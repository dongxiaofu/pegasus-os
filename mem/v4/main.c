#include "stdio.h"
#include "string.h"
#include "mem.h"
#include "mm.h"
#include "const.h"
#include "type.h"
#include "protect.h"
//#include "fs.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"

// 解包tar文件
struct tar_header
{
    char name[100];
    char mode[8];
    char uid[8];
    char gid[8];
    char size[12];
    char mtime[12];
    char chksum[8];
    char typeflag;
    char linkname[100];
    char magic[6];
    char version[2];
    char uname[32];
    char gname[32];
    char devmajor[8];
    char devminor[8];
    char prefix[155];
    char padding[12];
};

void untar(const char *filename)
{
    // 思路：
    // 1. 读取filename文件。
    // 2. 先读取一个扇区，再读取一个文件，并把这个文件的数据写入新文件。
    // 3. 读取文件时，读取单位一定是N个扇区。
    // todo 后续再完善open。
    int fd = open(filename, O_RDONLY);

    // 获取文件的长度
    // todo 怎么获取文件的长度？
    int file_size = 0;

    char buf[SECTOR_SIZE * 16];
    int chunk = sizeof(buf);

	int bytes_read2 = 0;
	int bytes_read = 0;

    while (1)
    {
	// 跳过上一个文件占用的空间
	if(bytes_read2 > 0){
		int sector_count = (bytes_read2 - 1 + SECTOR_SIZE) / SECTOR_SIZE;		
			Memset(buf, 0, SECTOR_SIZE * 16);
       		 	read(fd, buf, sector_count * SECTOR_SIZE - bytes_read2);
			bytes_read2 = 0;
	}

	Memset(buf, 0, SECTOR_SIZE * 16);
        bytes_read = read(fd, buf, SECTOR_SIZE);
        if (bytes_read == 0)
        {
            break;
        }

	bytes_read2 += bytes_read;
	bytes_read = 0;

        struct tar_header *tar_header = (struct tar_header *)buf;
        // 不确定能不能用指针接收一个字符串。能。
        char *name = tar_header->name;
        // int fdout = open(name, O_WRONLY);
        int fdout = open(name, O_CREAT);
        // 计算文件大小
        int len = 0;
        char *size_str = tar_header->size;
	
	// 检查有效数据是否已经结束
	if(Strlen(name) == 0 && Strlen(size_str) == 0){
		break;
	}

        char *p = size_str;
        while (*p)
        {
            len = len * 8 + (*p - '0');
            p++;
        }

        int bytes_left = len;
	int chunk = SECTOR_SIZE;
        while (bytes_left)
       {
       int iobytes = MIN(chunk, bytes_left);
            Memset(buf, 0, SECTOR_SIZE);
            bytes_read2 += read(fd, buf, iobytes);
           write(fdout, buf, iobytes);
            //write(fdout, buf, len);
           bytes_left -= iobytes;
        }

        close(fdout);

	
    }

    close(fd);
}

void atoi(char *str, int num)
{
    //	char str2[20];
    char *p = str;
    *p++ = '0';
    *p++ = 'x';
    char ch;
    char flag = 0;

    if (num == 0)
    {
        *p++ = '0';
    }
    else
    {
        for (int i = 28; i >= 0; i -= 4)
        {
            ch = (num >> i) & 0xF;
            if (flag == 0 && ch == 0)
                continue;
            flag = 1;
            ch = ch + '0';
            if (ch > '9')
            {
                ch += 7;
            }
            *p++ = ch;
        }
    }

    *p = 0;
    //	Memcpy(str, str2, Strlen(str2));

    return;
}

void disp_int(int num)
{
    //char *str = "";
    char str[10];
    //	Memset(str, 0, sizeof(str));
    atoi(str, num);
    //disp_str_colour("ABC", 0x0A);
    // disp_str(str);
    //char str2[20] = "0x57";
    disp_str_colour(str, 0x0B);
    //return;
}

void do_page_fault()
{
    // 这个值是第2个终端的显存初始处。
    dis_pos = 12000 - 128 + 10;
	unsigned int cr2;

	asm volatile ("movl %%cr2, %%eax":"=a"(cr2):);

	disp_str("do_page_fault\n");
	disp_str("cr2:");
	disp_int(cr2);
	disp_str("\n");
	
	unsigned int *pde = ptr_pde(cr2);
	unsigned int *pte = ptr_pte(cr2);

	disp_str("pde:");
	disp_int(pde);
	disp_str("===*pde:");
	disp_int(*pde);
	disp_str("\n");
	disp_str("pte:");
	disp_int(pte);
	disp_str("===*pte:");
	disp_int(*pte);
	disp_str("\n");

	unsigned int page_vaddr = cr2 & 0xFFFFF000;
	unsigned int page_paddr = get_a_page(KERNEL);
	add_map_entry(page_vaddr, page_paddr);

//	asm volatile ("invlpg %0"::"m" (page_vaddr):"memory");    //更新tlb
	unsigned int page_directory  = 0x000000100000;
	asm volatile ("movl %0, %%cr3" : : "r" (page_directory) : "memory");

	int a;
	if(*pte & PG_P_YES){
		a = 1;
	}else{
		a = 0;
	}

	// asm volatile ("movl %%eax, 4(%%ebp)" : "a"(eip)  :);
}

void exception_handler(unsigned int vec_no, unsigned int error_no, unsigned int eip, int cs, int eflags)
{
//	asm volatile ("movl %%eax, 16(%%ebp)" : "a"(eip)  :);
    char *msg[] = {
        "# Divide by zero:",
        "# Single step:",
        "# Non-maskable  (NMI):",
        "# Breakpoint:",
        "# Overflow trap:",
        "# BOUND range exceeded (186,286,386):",
        "# Invalid opcode (186,286,386):",
        "# Coprocessor not available (286,386):",
        "# Double fault exception (286,386):",
        "# Coprocessor segment overrun (286,386):",
        "# Invalid task state segment (286,386):",
        "# Segment not present (286,386):",
        "# Stack exception (286,386):",
        "# General protection exception (286,386):",
        "# Page fault (286,386):",
        //"# Reserved:",
        "# Coprocessor error (286,386):",

        "#AC :",
        "#MC :",
        "#XF :",
    };
	// 清屏
	if(dis_pos > 800){
 //   	dis_pos -= 600;
	}
    for (int i = 0; i < 80 * 25 * 2; i++)
    {
    //    disp_str(" ");
    }
    // int colour = 0x74;
    disp_str("\n\nfault msg\n\n");
    int colour = 0x0A;
    char *error_msg = msg[vec_no];
    //	Printf("error:%s\n", error_msg);
    // disp_str_colour(error_msg, colour);
    disp_str(error_msg);
    disp_str("\n\n");
    disp_str("vec_no:");
    disp_int(vec_no);
    disp_str("\n\n");

    if (error_no != 0xFFFFFFFF)
    {
        disp_str("error_no:");
        disp_int(error_no);
        // Printf("error_no:%x\n", error_no);
        disp_str("\n\n");
    }

    disp_str("cs:");
    disp_int(cs);
    //Printf("cs:%x\n", cs);
    disp_str("\n\n");

    disp_str("eip:");
		
    disp_int(eip);
    //Printf("eip:%x\n", eip);
    disp_str("\n\n");

    disp_str("eflags:");
    disp_int(eflags);
    disp_str("\n\n");
	disp_str("return from exception_handler\n");

	// asm ("xchgw %bx, %bx");

	do_page_fault();

	asm volatile("nop;nop;nop;");
	asm volatile ("movl %%eax, 4(%%ebp)" : :"a"(eip));
	asm ("sti;");

	asm ("xchgw %bx, %bx");
    return;
}

void init_internal_interrupt()
{
    InitInterruptDesc(0, divide_zero_fault, 0x08, 0x0E);
    InitInterruptDesc(1, single_step_fault, 0x08, 0x0E);
    InitInterruptDesc(2, non_maskable_interrupt, 0x08, 0x0E);
    InitInterruptDesc(3, breakpoint_trap, 0x08, 0x0E);
    InitInterruptDesc(4, overflow_trap, 0x08, 0x0E);
    InitInterruptDesc(5, bound_range_exceeded_fault, 0x08, 0x0E);
    InitInterruptDesc(6, invalid_opcode_fault, 0x08, 0x0E);
    InitInterruptDesc(7, coprocessor_not_available_fault, 0x08, 0x0E);
    InitInterruptDesc(8, double_fault_exception_abort, 0x08, 0x0E);
    InitInterruptDesc(9, coprocessor_segment_overrun, 0x08, 0x0E);
    InitInterruptDesc(10, invalid_task_state_segment_fault, 0x08, 0x0E);
    InitInterruptDesc(11, segment_not_present_fault, 0x08, 0x0E);
    InitInterruptDesc(12, stack_exception_fault, 0x08, 0x0E);
    InitInterruptDesc(13, general_protection_exception_fault, 0x08, 0x0E);
    InitInterruptDesc(14, page_fault, 0x08, 0x0E);
    InitInterruptDesc(16, coprocessor_error_fault, 0x08, 0x0E);
    InitInterruptDesc(17, align_check_fault, 0x08, 0x0E);
    InitInterruptDesc(18, simd_float_exception_fault, 0x08, 0x0E);

    // 系统调用
    // 属性可能需要修改
    //InitInterruptDesc(0x90,sys_get_ticks,0x08,0x0E);
    // interrupt(): soft_int && (gate.dpl < CPL)
    // InitInterruptDesc(0x90,sys_call,0x08,0x0E);
    // 0x08--->1000b--->特权级是0
    // 1010b-->0xA--->特权级是1
    // 1110b-->0xE--->特权级应该是3
    InitInterruptDesc(0x90, sys_call, 0x0E, 0x0E);
}

void test()
{
    disp_str("A");
    disp_int(0x6);
    disp_str("\n");
    return;
    //disp_str_colour2(0x9988, 0x74);
    dis_pos = 0;
    for (int i = 0; i < 80 * 25 * 2; i++)
    {
        disp_str(" ");
    }
    dis_pos = 0;
    //return;
    disp_str_colour("Hello, World!", 0x0F);
    disp_str("\n");
    disp_int(0x89);
    disp_str("\n");
    disp_str_colour("Hello, World!", 0x0F);
    disp_str_colour("Hello, World!", 0x74);
    disp_str("\n");
    disp_str_colour("Hello, World!===========I am successful!", 0x0F);
    disp_str("\n=================\n");
    disp_str("Hello, World!\n");
    disp_int(23);
    disp_str("\n");
    disp_int(0x020A);
    disp_str("\n");
}

void disp_str_colour3(char *str, int colour)
{
}

void spurious_irq(int irq)
{
    disp_str_colour("\n------------irq start---------------\n", 0x0B);
    disp_int(irq);
    ticks++;
    disp_str("[");
    disp_int(ticks);
    disp_str("]");
    disp_str_colour("\n------------irq end---------------\n", 0x0C);
}


void init_keyboard()
{
    // 键盘
    Memset(keyboard_buffer.buf, 0, sizeof(keyboard_buffer.buf));
    keyboard_buffer.tail = keyboard_buffer.head = keyboard_buffer.buf;
    keyboard_buffer.counter = 0;
    // 初始键盘中断例程
    //init_keyboard_handler();
    dis_pos = 0;
    // 清屏
    for (int i = 0; i < 80 * 25 * 2; i++)
    {
        disp_str(" ");
    }
//    dis_pos = 0x0c0b8000;
	dis_pos = 0;

    init_keyboard_handler();

}

void init()
{
	asm ("xchgw %bx, %bx");
			// unsigned int *pte = (0x101000 + 257 * 4);
//			unsigned int *pte = (1024*1024 + 4096 + 256 * 4);
//			unsigned int phy_addr = (0x1001000 | PG_P_YES |  PG_RW_RW |  PG_US_SUPER);
//
//			asm volatile ("movl %0, %1" : : "r" (phy_addr), "m" (*pte) : "memory");
	disp_str("init\n");
//	asm ("xchgw %bx, %bx");
	init_keyboard();
	init_memory(32*1024*1024);
}

void kernel_main()
{
	int a = 5;
	int b = 4;
	int c;
	c = a - b;
//	asm ("xchgw %bx, %bx");
	disp_str("Hello,World");
	
	init();

	/*******************start************************/
    ticks = 0;
    counter = 0;
    // 在这个项目的C代码中，全局变量如此赋值才有效。原因未知，实践要求如此。
    //k_reenter = -1;
    k_reenter = 0;
    Proc *proc;
    Task *task;
    unsigned int eflags;
    unsigned char rpl;
    unsigned char dpl;
    char *p_task_stack = proc_stack + STACK_SIZE;
    // todo 测试需要，去掉用户进程USER_PROC_NUM。
    for (int i = 0; i < TASK_PROC_NUM + USER_PROC_NUM + FORKED_USER_PROC_NUM; i++)
    {
		// proc_table2[i] = (Proc *)alloc_memory(1, KERNEL);
		// proc = (Proc *)proc_table2[i];
		proc = (Proc *)alloc_memory(2, KERNEL);
		Memset(proc, 0, sizeof(*proc));
		proc->stack = (unsigned int *)((unsigned int)proc + PAGE_SIZE);
        // proc->ldt_selector = LDT_FIRST_SELECTOR + 8 * i;
        proc->ldt_selector = 0;
        proc->pid = i;
		proc->page_directory = 0x0;
        if (i >= TASK_PROC_NUM + USER_PROC_NUM)
        {
            proc->p_flag = FREE_SLOT;
            continue;
        }
        proc->p_flag = 0;
        if (i < TASK_PROC_NUM)
        {
            task = sys_task_table + i;
		//	proc->stack -= sizeof(Regs);
		//	proc->stack -= sizeof(ThreadStack);
			proc->stack = (unsigned int *)((unsigned int)(proc->stack) - 68);
			proc->stack = (unsigned int *)((unsigned int)(proc->stack) - 20);
			// ThreadStack *thread_stack = (ThreadStack *)(proc->stack - sizeof(ThreadStack));
			asm ("xchgw %bx, %bx");
			ThreadStack *thread_stack = (ThreadStack *)proc->stack;
//			ThreadStack *thread_stack = (ThreadStack *)alloc_memory(1, KERNEL);
//			Memset(thread_stack, 0, sizeof(ThreadStack));
			
			asm ("xchgw %bx, %bx");
			// thread_stack->eip = (unsigned int)task->func_name;
			thread_stack->eip = 8;//TaskSys; 
//			while(1);
			thread_stack->ebp = thread_stack->ebx = thread_stack->edi = thread_stack->esi = 0;
//			Memcpy((unsigned int *)proc->stack, thread_stack, sizeof(ThreadStack));
			// asm ("xchgw %bx, %bx");
			
        }

        // 进程名
        Strcpy(proc->name, task->name);

        unsigned short cs = 0x4 | rpl;
        unsigned short ds = 0xC | rpl;
        proc->s_reg.cs = cs;
        proc->s_reg.ds = ds;
        proc->s_reg.fs = ds;
        proc->s_reg.es = ds;
        proc->s_reg.ss = ds; // 000 1100
        proc->s_reg.gs = GS_SELECTOR & (0xFFF9);
        proc->s_reg.eip = (int)task->func_name;
        proc->s_reg.eflags = eflags;


        proc->has_int_msg = 0;
        proc->q_sending = 0;
        proc->q_next = 0;
        proc->p_receive_from = NO_TASK;
        proc->p_send_to = NO_TASK;
        proc->p_msg = 0;
    }
    // proc_ready_table = &proc_table2[0];
    proc_ready_table = proc;
    //proc_ready_table = &proc_table[TASK_PROC_NUM];

	/*******************end************************/
//	restart();

	asm ("xchgw %bx, %bx");
	asm ("sti;");
    while (1);
}

#define A_PRINT_NUM 3
#define B_PRINT_NUM 3
#define C_PRINT_NUM 3

// 测试文件系统
void TestFS()
{
	char tty1[10] = "dev_tty1";
	int fd_stdout = open(tty1, O_RDWR);
//	while(1){}
	int fd_stdin = open(tty1, O_RDWR);
    Printf("TestA is running\n");
    char filename[5] = "AC";
    char filename2[5] = "cAB";
    char filename3[10] = "INTERRUPT";
    int flag = 1;
    while (1)
    {
        if (flag == 1)
        {
            int fd = open(filename, O_CREAT);
         Printf("fd = %x\n", fd);
            flag = 0;
            char buf[20] = "cg:hello,world!";
            write(fd, buf, Strlen(buf));
            char buf2[20];
		Memset(buf2, 0, 20);
            int k = read(fd, buf2, 18);
           Printf("buf2 = %s\n", buf2);
            delay(10);
            int fd2 = open(filename2, O_CREAT);
           Printf("fd2 = %x\n", fd2);
            flag = 0;
            char buf3[20] = "cg:how are you?";
            write(fd2, buf3, Strlen(buf3));
            char buf4[20];
		Memset(buf4, 0, 20);
            int k2 = read(fd2, buf4, 18);
            Printf("buf4 = %s\n", buf4);
         //   delay(10);
            int fd3 = open(filename3, O_CREAT);
           Printf("fd2 = %x\n", fd2);
            flag = 0;
            char buf5[30] = "I will success at last.";
            write(fd3, buf5, Strlen(buf5));
            char buf6[30];
		for(int i = 0; i < 6; i++){
		Memset(buf6, 0, 30);
            int k3 = read(fd3, buf6, Strlen(buf5));
            Printf("buf6 = %s\n", buf6);
		}
		char file[20] = "install.tar";
            int fd4 = open(file, O_RDONLY);
           Printf("fd4 = %x\n", fd4);
		char buf7[512];
		Memset(buf7, 0, 20);
            int k4 = read(fd4, buf7, 512);
            Printf("buf7 = %s\n", buf7);
        }
    }
}

// wait、exit测试用例
void wait_exit()
{
	char tty1[10] = "dev_tty1";
	int fd_stdout = open(tty1, O_RDWR);
//	while(1){}
	int fd_stdin = open(tty1, O_RDWR);
	//while(1){}

	int pid = fork();
	//while(1){}
	if(pid > 0){
		int s;;
		wait(&s);
		Printf("child main exit status %d\n", s);
		while(1){}
	}else{
		Printf("I am child\n");
		int c = 0;
		while(1){
			if(c++ > 50000){
				break;
			}
		}
		Printf("I am child 0\n");
		exit(9);
		Printf("I am child 1\n");
		while(1){}
	}
}

// fork、write、read测试用例
void INIT_fork()
{
	char tty1[10] = "dev_tty1";
	int fd_stdout = open(tty1, O_RDWR);
	int fd_stdin = open(tty1, O_RDWR);
//	int fd_stdout = 0;
	char buf[40] = "INIT is running\n";
	Memset(buf, 0, Strlen(buf));
	//Printf("fd_stdout = %d\n", fd_stdout);
	//Printf("fd_stdout = %d\n", fd_stdout);
	//Printf("fd_stdin = %d\n", fd_stdin);
//	while(1){}
//	write(fd_stdout, buf, 40);
//	write(fd_stdout, "\n", 1);
//	write(fd_stdout, "T", 1);
//	dis_pos = 12000 - 128 + 180 * 1 + 60;
//	disp_str_colour("read over2\n", 0x0E);
	read(fd_stdin, buf, 40);
//	dis_pos = 12000 - 128 + 180 * 1 + 60;
//	disp_str_colour("read over\n", 0x0E);
	write(fd_stdout, buf, 40);
//	while(1){};
int j = 0;
			int pid = fork();
		
			if(pid > 0){
				j++;
				char buf1[40] = "Parent\n";
				write(fd_stdout, buf1, Strlen(buf1));			
		write(fd_stdout, buf1, Strlen(buf1));			
		write(fd_stdout, buf1, Strlen(buf1));			
				for(int i = 0; i < 5; i++){
					j++;
					//write(fd_stdout, buf1, Strlen(buf1));			
				}
				//spin("parent\n");
			}else{	
			j++;		//	spin("child");
			j += 2;
		//		int fd2 = open("dev_tty0", O_RDWR);
				char buf2[40] = "Child\n";
			write(fd_stdout, buf2, Strlen(buf2));			
			write(fd_stdout, buf2, Strlen(buf2));			
			write(fd_stdout, buf2, Strlen(buf2));			
//		dis_pos = 12000 - 128 + 10 + 160 * 8;
//		disp_str_colour("j = ", 0x0C);
//		disp_int(j);
		char buf4[] = "Child j = ";
//		
		write(fd_stdout, buf4, Strlen(buf4));
				spin("child\n");
			}

//		dis_pos = 12000 - 128 + 10 + 160 * 7;
//		disp_str_colour("j = ", 0x0C);
//		disp_int(j);
				spin("parent\n");
}


// shell
void simple_shell()
{
	// 打开终端，用来输入输出
	char tty1[10] = "dev_tty1";
	int fd_stdout = open(tty1, O_RDWR);
	int fd_stdin = open(tty1, O_RDWR);
	
	char read_buf[128];
	while(1){
	Memset(read_buf, 0, 128);
	read(fd_stdout, read_buf, 128);
//	Printf("read_buf = %s\n", read_buf);

	// 分割从终端读取的字符串
	char *argv[10];
//	Memset(argv, 0, 10);
//	char argv[5][10];
	int argc = 0;
	int word = 0;
	char *p = read_buf;
	char *s;
	char ch;

	do{
		ch = *p;
		if((*p != ' ' && *p != 0) && word == 0){
			s = p;
			word = 1;
		}

		if((*p == ' ' || *p == 0) && word == 1){
//			int index = argc++;
//			Memset(argv[index], 0, sizeof(argv[index]));
//			argv[index] = s;
			argv[argc++] = s;
			//Printf("argc[%d] = %s\n", argc-1, argc[argc-1]);
			*p = 0;
		//	Printf("argv[%d] = %s\n", argc-1, argv[argc-1]);
			word = 0;
		}

		p++;
	}while(ch);
	// argv[argc] = s;
	argv[argc] = 0;
	
	int i = -1;
//	while(argv[++i]){
//		Printf("argv[%d] = %s\n", i, argv[i]);
//	}
//	// int fd = open(argv[0], O_RDWR);
//	argv[0][5] = 0;
//	Printf("argv2[0] = %s\n", argv[0]);
	int fd = open(argv[0], O_RDWR);
//	char file[5] = "echo";
//	int fd = open(file, O_RDWR);
//	int fd = open("echo", O_RDWR);
//	int fd = 2;
		//	Printf("simple shell start3\n");
	if(fd == -1){
		for(int i = 0; i < 6; i++){
			Printf("%x:%x\n", i, argv[0][i]);
		}
		Printf("{%s}\n", argv[0]);
	}else{
		// 实现shell	
//			Printf("simple shell start4\n");
		int pid = fork();
//		Printf("simple shell start5\n");
		//return;
		if(pid > 0){
			int s;
			wait(&s);
//			Printf("simple shell over\n");
		}else{
//			Printf("simple shell start\n");
			close(fd);
//			exit(5);
			execv(argv[0], argv);	
			while(1){}
	//		char *s1 = "echo";
	//		char *s2 = "hello";
	//		argv[0] = s1;
	//		argv[1] = s2;
			
	//		execv("echo", argv);	
	//		exit(5);
		}
	}

	}
}

void test_split_str()
{
	char *argv[100];
	int argc = 0;
	int word = 0;
	char *p = "echo hello world";
	char *s;

	do{
		if(argc == 0){
		Printf("*p = %x\n", *p); 
		}
		if((*p != ' ' || *p != 0) && word == 0){
			s = p;
			word = 1;
		}

		if((*p == ' ' || *p == 0) && word == 1){
			argv[argc++] = s;
			//Printf("argc[%d] = %s\n", argc-1, argc[argc-1]);
			*p = 0;
//			Printf("argv2[%d] = %s\n", argc-1, argv2[argc-1]);
			word = 0;
		}

		p++;
	}while(*p);
	argv[argc] = s;

	Printf("print argv, argc = %x\n", argc);
	// for(int i = 0; i < argc; i++){
	for(int i = 0; i <= argc; i++){
		Printf("argv[%x] = %s\n", i, argv[i]);
	}

	if(strcmp(argv[0], "echo") == 0){
		Printf("Yes,it is.\n");
	}

//	return;
	//char *argv[10] = {"echo4", "Hello2", "World3"};
	Printf("argv[0] = %s\n", argv[0]);
	Printf("print argv[0]\n");
	int j = 0;
	while(j <= 5){
		Printf("ch = %x\n", argv[0][j]);
		j++;
	}
	return;
//	argv[0] = "echo ";
	int fd = open(argv[0], O_RDWR);
//	int fd = open("echo", O_RDWR);
	if(fd == -1){
		Printf("{%s}\n", argv[0]);
	}else{
		// 实现shell	
		int pid = fork();
		if(pid > 0){
			int s;
			wait(&s);
		}else{
			close(fd);
			execv(argv[0], argv);	
		}
	}
}




void test_shell()
{
	char tty1[10] = "dev_tty1";
	int fd_stdout = open(tty1, O_RDWR);
	char filename[20] = "install.tar";
	untar(filename);
//		Printf("I am a child\n");
//		simple_shell();
//	return;
	int pid = fork();
	if(pid > 0){
		int s;
		wait(&s);
		Printf("My child exit %d\n", s);
	}else{
		Printf("I am a child\n");
		close(fd_stdout);
		simple_shell();
	}

	while(1){
		int s;
		int child = wait(&s);
		Printf("child exit with status %d\n", s);
	}

}

// exec测试用例
void test_exec()
{
	char tty1[10] = "dev_tty1";
	int fd_stdout = open(tty1, O_RDWR);
	char filename[20] = "install.tar";
	untar(filename);
//	execl("/echo", "echo", "hello", 0);
//		while(1){};

	int pid = fork();
	if(pid > 0){
		int s;
		wait(&s);
		Printf("My child exit %d\n", s);
	}else{
		Printf("I am a child\n");
		// exit(5);
		// execl("/pwd", "echo", "hello",  "world", 0);
		execl("/echo", "echo", "hello",  "world", 0);
		while(1){};
	}

}

void INIT()
{
	test_shell();
	while(1);
}

void TestA()
{
	asm ("xchgw %bx, %bx");
//	disp_int(5);
//	asm ("xchgw %bx, %bx");
//	disp_str("\n");
//	asm ("xchgw %bx, %bx");
//	disp_str("TestA\n");
//	asm ("xchgw %bx, %bx");

	while(1);
}

void delay(int time)
{
    for (int i = 0; i < time; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            for (int k = 0; k < 1000; k++)
            {
            }
        }
    }
}

void TestB()
{
    //Printf("<b ticks:%x\n>", get_ticks());
    // select_console(1);
    unsigned int i = 0;
    while (1)
    {
        //select_console(1);
        //Printf("<b ticks:%x\n>", get_ticks());
        if (i < B_PRINT_NUM)
        {
            //int t_ipc = get_ticks_ipc();
            //int t_ipc = get_ticks();
            //Printf("%x", t_ipc);
            //Printf("%x\n", 3);
            //Printf("i=%d\n", 9);
            Printf("b_t:%x", get_ticks_ipc());
        }
        i++;
        // int t = get_ticks();
        // if(t < 600){
        // 	out_char(current_tty, 'B');
        // }
        //milli_delay(10);
        //disp_int(get_ticks());
        //disp_str("B");
        //disp_str(".");
        //delay(1);
        //milli_delay(20);
        //milli_delay(1);
    }
}

void TestC()
{
    //Printf("<c ticks:%x\n>", get_ticks());
    // select_console(2);
    unsigned int i = 0;
    while (1)
    {
        //select_console(2);
        if (i < C_PRINT_NUM)
        {
            //Printf("i=%d\n", 5);
            //int t_ipc = get_ticks_ipc();
            //int t_ipc = get_ticks();
            int t_ipc = 5;
            Printf("c_t_ipc = %x", t_ipc);
            //Printf("c_t0:%x\n", 3);
            //Printf("c_t:%x\n", get_ticks_ipc());
        }
        i++;
        //Printf("<c ticks:%x\n>", get_ticks());
        // select_console(2);
        // int t = get_ticks();
        // if(t < 900){
        // 	out_char(current_tty, 'C');
        // }
        //milli_delay(10);
        //disp_int(get_ticks());
        //disp_str("C");
        //disp_str(".");
        //delay(1);
        //milli_delay(30);
        //milli_delay(1);
    }
}

int sys_get_ticks()
{
    //disp_str("@@");

    return ticks;
}

void sys_write(char *buf, int len, Proc *proc)
{
    //TTY *tty = &tty_table[proc - proc_table];
    TTY *tty = &tty_table[proc->tty_index];
    int i = len;
    char *p = buf;
    while (i > 0)
    {
        out_char(tty, *p);
        p++;
        i--;
    }
}

void milli_delay(unsigned int milli_sec)
{
    int t = get_ticks_ipc();

    while (((get_ticks_ipc() - t) / 100 * 1000) < milli_sec)
    {
    }
}

void TaskSys()
{
	asm ("xchgw %bx, %bx");
	disp_str("TaskSys\n");

    while (1)
    {
        //Message *msg;
        //Printf("%c--", 'S');
        //Printf("flag:%x--,", proc_table[1].p_flag);
        //Printf("send_to:%x--,", proc_table[1].p_send_to);
        //Printf("receive_from:%x--,", proc_table[1].p_receive_from);
        //Printf("%c", '\n');
        //return;
        Message msg;
        Memset(&msg, 0, sizeof(Message));
        int ret = receive_msg(&msg, ANY);
        if (ret != 0)
        {
            return;
        }
        //int type = msg.type;
        int type = msg.TYPE;
        int source = msg.source;
        switch (type)
        {
        case TICKS_TASK_SYS_TYPE:
            msg.val = ticks;
            ret = send_msg(&msg, source);
            break;
        default:

            break;
        }
    }
}

//
// 只支持%x
void Printf(char *fmt, ...)
{
    char buf[256];
    Memset(buf, 0, 256);
    // 理解这句，耗费了大量时间。
    char *var_list = (char *)((char *)&fmt + 4);
    int len = vsprintf(buf, fmt, var_list);
    //char str[2] = {'A', 0};
    //len = 2;
    // todo 想办法不使用硬编码0。0是文件描述符。
    write(0, buf, len);
//    write2(buf, len);
    return;
}

int vsprintf(char *buf, char *fmt, char *var_list)
{
    // 指向buf
    char *p;
    // 必须作为全局变量。如果作为局部变量，然后初始化，会覆盖其他数据。
    // 目前的内存机制，就是这样。
    //char inner_buf[DEFAULT_STR_SIZE];
    // Memset(inner_buf, 0, DEFAULT_STR_SIZE);
    char inner_buf[DEFAULT_STR_SIZE];
    char *str = inner_buf;
    // 转换数字使用
    // 使用256会导致gdt中的数据被擦除，从而导致各种奇怪的问题，比如，proc_ready_table中的数据被修改。
    // 耗费了八个小时左右才发现这个问题。
    //char tmp[256];
    //char tmp[128];
    char tmp[64];
    //char tmp[4];
    //return 0;
    Memset(tmp, 0, sizeof(tmp));
    //Memset(tmp, 0, 256);
    char *next_arg = var_list;
    int len2 = 0;
    for (p = buf; *fmt; fmt++)
    {
        if (*fmt != '%')
        {
            *p++ = *fmt;
            //p++;
            continue;
        }
        // 跳过%
        fmt++;
        switch (*fmt)
        {
        //case 'd':;
        case 'd':
        {
            int m = *(int *)next_arg;
            itoa(m, &str, 10);
            //i2a(m, 10, &str);
            //Strcpy(p, str);
            Strcpy(p, inner_buf);
            next_arg += 4;
            // len2 = Strlen(str);
            len2 = Strlen(inner_buf);
            p += len2;
            break;
        }
        case 'x':
            atoi(tmp, *(int *)next_arg);
            //Strcpy(buf, tmp);
            Strcpy(p, tmp);
            next_arg += 4;
            len2 = Strlen(tmp);
            p += len2; //Strlen(tmp);
            break;
        case 's':
            //char *str = *(char **)next_arg;
            Strcpy(p, *(char **)next_arg);
            len2 = Strlen(*(char **)next_arg);
            next_arg += 4;
            //len2 = 6;//Strlen(*(char **)next_arg);
            p += len2; //Strlen(tmp);
            break;
        case 'c':
            //char c = *(char *)next_arg;
            *p = *(char *)next_arg;
            next_arg += 4;
            len2 = 1;
            p += len2; //Strlen(tmp);
            break;
        default:
            break;
        }
    }

    return (p - buf);
}
// printf end

// debug start
void printx(char *fmt, ...)
{
    char buf[256];
    char *var_list = (char *)((char *)&fmt + 4);
    int len = vsprintf(buf, fmt, var_list);
    write_debug(buf, len);
}

// 系统调用，使用汇编代码实现
// void write_debug(char *buf, int len);
void sys_printx(char *error_msg, int len, Proc *proc)
//void sys_printx(char *error_msg, int caller_pid)
{
    int line_addr;
    int base;
    //Proc *proc = pid2proc(caller_pid);

    if (k_reenter == 0)
    {
        int ds = proc->s_reg.ds;
        base = Seg2PhyAddrLDT(ds, proc);
    }
    else if (k_reenter > 0)
    {
        base = Seg2PhyAddr(DS_SELECTOR);
    }
    // line_addr = base + error_msg;
    // line_addr = base + (int *)error_msg;
    line_addr = base + (int)error_msg;

    // 打印字符串
    TTY *tty = &tty_table[proc->tty_index];
    char *p = (char *)line_addr;
    char magic = *p;
    while (len > 0)
    {
        if (*p == ASSERT_MAGIC || *p == PANIC_MAGIC)
        {
            p++;
            continue;
        }
        out_char(tty, *p);
        p++;
        len--;
    }
    // 字符串中有空格时不能打印出来
    //while(*p != '\0'){
    //	if(*p == ASSERT_MAGIC || *p == PANIC_MAGIC){
    //		p++;
    //		continue;
    //	}
    //	out_char(tty, *p);
    //	p++;
    //}

    //char magic = error_msg[0];
    if (magic == ASSERT_MAGIC)
    {
        if (k_reenter > 0)
        {
            disable_int();
            __asm__("hlt");
        }
        else
        {
        }
    }
    else if (magic == PANIC_MAGIC)
    {
        disable_int();
        __asm__("hlt");
    }

    return;
}

void spin(char *error_msg)
{
    while (1)
    {
    }
}

void panic(char *error_msg)
{
    printx("%c%s\n", PANIC_MAGIC, error_msg);
    //Printf("%c%s\n", PANIC_MAGIC, error_msg);
}

void assertion_failure(char *exp, char *filename, char *base_filename, unsigned int line)
{
    // todo %d还未实现或者有问题。
    printx("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
           //Printf("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
           ASSERT_MAGIC, exp, filename, base_filename, line);
    spin("Stop Here!\n");
    return;
}

// debug end

// ipc start
int dead_lock(int src, int dest)
{
	return 0;
    Proc *src_proc = pid2proc(src);
    Proc *dest_proc = pid2proc(dest);
    while (1)
    {
//        Proc *src_proc = pid2proc(src);
//        Proc *dest_proc = pid2proc(dest);
        if (dest_proc->p_flag == SENDING)
        {
            if (dest_proc->p_send_to == src)
            {
                // panic("dead lock!\n");
//                Printf("%x---->%x---->", src, dest);
                // 打印死锁环
                Proc *p = dest_proc;
                do
                {
                    Printf("%x--2-->%x---->", proc2pid(p), p->p_send_to);
                    p = pid2proc(p->p_send_to);
                } while (p->pid != src);
                //Printf("%x\n", src);
                // Printf("%x---->%x---->", proc2pid(p), src);
                return 1;
            }
            dest_proc = pid2proc(dest_proc->p_send_to);
        }
        else
        {
            break;
        }
    }

    return 0;
}

// send_msg 通过sys_call调用
int sys_send_msg(Message *msg, int receiver_pid, Proc *sender)
{
    Proc *receiver = pid2proc(receiver_pid);
    int sender_pid = proc2pid(sender);
        // 计算msg的线性地址
        int ds = sender->s_reg.ds;
        int base = Seg2PhyAddrLDT(ds, sender);
        int msg_line_addr = base + (int)msg;
        int msg_size = sizeof(Message);
	Message *msg_tmp =  (Message *)msg_line_addr;
	msg_tmp->source = sender_pid;
//    msg->source = sender_pid;
    // 死锁检测
    if (dead_lock(sender_pid, receiver_pid) == 1)
    {
        panic("dead lock\n");
    }

    if (receiver->p_flag == RECEIVING && (receiver->p_receive_from == sender_pid || receiver->p_receive_from == ANY))
    {
        // 计算msg的线性地址
       // int ds = sender->s_reg.ds;
       // int base = Seg2PhyAddrLDT(ds, sender);
       // int msg_line_addr = base + (int)msg;
       // int msg_size = sizeof(Message);

        int ds2 = receiver->s_reg.ds;
        int base2 = Seg2PhyAddrLDT(ds2, receiver);
        int msg_line_addr2 = base2 + (int)(receiver->p_msg);
        // 从sender中把消息复制到receiver
        //    phycopy(receiver->p_msg, msg_line_addr, msg_size);
        phycopy(msg_line_addr2, msg_line_addr, msg_size);
        // 重置sender
        //        sender->p_msg = 0;
        //        sender->p_send_to = 0;
        // 重置receiver
        receiver->p_msg = 0;
        receiver->p_flag = RUNNING;
        receiver->p_receive_from = NO_TASK;

        // 解除receiver的阻塞。
        unblock(receiver);

        // 调试函数
        assert(sender->p_msg == 0);
        assert(sender->p_flag == 0);
        assert(sender->p_send_to == NO_TASK);
        //assert(sender->p_receive_from == NO_TASK);
        assert(receiver->p_msg == 0);
        assert(receiver->p_flag == 0);
        assert(receiver->p_receive_from == NO_TASK);
        //assert(receiver->p_send_to == NO_TASK);
    }
    else
    {
        // 思路：
        // 1. 如何目标进程没有准备好接收消息，把消息加入目标进程的消息队列。
        // 2. 如果是目标进程的消息队列的第一个进程是空，把本进程设置成消息队列的第一个进程。
        // 3. 如果目标进程的消息队列的第一个进程不是空，把本进程放到消息队列的末尾。
        Proc *pre = 0;
        Proc *p = receiver;
        if (receiver->q_sending == 0)
        {
            receiver->q_sending = sender;
            sender->q_next = 0;
        }
        else
        {
            Proc *p = receiver->q_sending;
            while (p)
            {
                pre = p;
                p = p->q_next;
            }
            pre->q_next = sender;
            sender->q_next = 0;
        }

        sender->p_msg = msg;
        sender->p_send_to = receiver_pid;
        sender->p_flag = SENDING;

        // 调试函数
        assert(sender->p_flag == SENDING);
        assert(sender->p_send_to == receiver_pid);
        assert(sender->p_msg == msg);

        // 阻塞sender
        block(sender);
    }

    return 0;
}

// receive_msg 通过sys_call调用
int sys_receive_msg(Message *msg, int sender_pid, Proc *receiver)
{
    int copy_ok = 0;
    Proc *p_from;
    Proc *pre;

    Proc *sender = pid2proc(sender_pid);
    int receiver_pid = proc2pid(receiver);

    //	dis_pos = (1024*12 + 0);
    //	dis_pos = (1024*12 + 0);
    //	dis_pos = 12000 - 128 + 10 + 320;
    //	//dis_pos += 160;
    //	disp_str_colour("sender0:", 0x0C);
    //	disp_int(sender_pid);
    //	disp_str("#");
    //	disp_str_colour("pid:", 0x0B);
    //	disp_int(proc_ready_table->pid);
    //	disp_str("#");

    //	disp_str_colour("sender:", 0x0B);
    //	dis_pos += Strlen("sender:");
    //	disp_int(sender_pid);
    //
    //	disp_str_colour("receiver:", 0x0B);
    //	dis_pos += Strlen("receiver:");
    //	disp_int(receiver_pid);
    if (DEBUG == 1)
    {
        Printf("sender = %x, receiver = %x\n", sender_pid, receiver_pid);

        assert((sender_pid == 1) || (sender_pid == 2) || (sender_pid == 3) || (sender_pid == 15));
        assert((receiver_pid == 1) || (receiver_pid == 2) || (receiver_pid == 3) || (receiver_pid == 15));
    }

	int int_flag = 0;
    if (receiver->has_int_msg && (sender_pid == ANY || sender_pid == INTERRUPT))
    {

        Message m;
        Memset(&m, 0, sizeof(Message));
        m.source = INTERRUPT;
        m.TYPE = HARD_INT;

        phycopy(v2l(receiver_pid, msg), &m,
                sizeof(Message));

        receiver->has_int_msg = 0;
        receiver->p_receive_from = NO_TASK;
        receiver->p_send_to = NO_TASK;
        receiver->p_flag = RUNNING;

	int_flag = 1;
	
       // return 0;
    }

	if(int_flag == 1){
		return;
	}

    // 主要思路：
    // 1. 如果信息来源是ANY，从本进程的消息队列中取出一个消息进行处理。
    // 2. 如果消息来源不是ANY，进入下面的流程。
    // 2.1. 进程pid合法 && 消息来源的状态是SENDING && 消息来源的发送对象是本进程。
    if (sender_pid == ANY)
    {
        if (receiver->q_sending)
        {
            // Printf("sending id:%x\n", receiver->q_sending->pid);
            //	dis_pos = 12000 - 128 + 10 + 160;
            //	disp_str_colour("send-id:", 0x0C);
            //	disp_int(receiver->q_sending->pid);
            //	disp_str("#");
            //	disp_str_colour("receiver-id:", 0x0C);
            //	disp_int(receiver->pid);
            p_from = receiver->q_sending;
            //	disp_str_colour("rpfrom-id:", 0x0C);
            //	disp_int(p_from->pid);
            //	disp_str("#");
            //	disp_str_colour("type:", 0x0C);
            //	disp_int(p_from->pid);
            //	disp_str("#");
            copy_ok = 1;
        }
    }
    else if (0 <= sender_pid && sender_pid < USER_PROC_NUM + TASK_PROC_NUM)
    {
        if (sender->p_flag == SENDING && (sender->p_send_to == ANY || sender->p_send_to == receiver_pid))
        {
            p_from = receiver->q_sending;
            while (p_from)
            {
                pre = p_from;
                if (p_from->pid == sender_pid)
                {
                    copy_ok = 1;
                    break;
                }
                p_from = p_from->q_next;
            }
        }
    }

    if (copy_ok == 1)
    {
        Proc *p_from_proc = p_from;
        // 计算msg的线性地址
        int ds = receiver->s_reg.ds;
        int base = Seg2PhyAddrLDT(ds, receiver);
        void *msg_line_addr = (void *)(base + (int)msg);
        int msg_size = sizeof(Message);

        int ds2 = receiver->s_reg.ds;
        int base2 = Seg2PhyAddrLDT(ds2, p_from_proc);
        void *msg_line_addr2 = (void *)(base2 + (int)(p_from_proc->p_msg));

        // 从receiver中把消息复制到sender
        // phycopy(msg_line_addr, p_from_proc->p_msg, msg_size);
        phycopy(msg_line_addr, msg_line_addr2, msg_size);
        Message *m = (Message *)msg_line_addr;
        //	dis_pos = 12000 - 128 + 10 + 320;
        //	disp_str_colour("current-id:", 0x0C);
        //	disp_int(proc_ready_table->pid);
        //	disp_str("#");
        //	disp_str_colour("from-id:", 0x0C);
        //	disp_int(p_from_proc->pid);
        //	assert(p_from_proc->p_msg->TYPE != 0);

        if (sender_pid == 4)
        {
            assert(msg->TYPE == OPEN);
        }

        // 移除已经处理过的消息。
        if (p_from == receiver->q_sending)
        {
            receiver->q_sending = p_from->q_next;
            p_from->q_next = 0;
        }
        else
        {
            pre->q_next = p_from->q_next;
            p_from->q_next = 0;
        }
        //	dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("sender33:", 0x0C);
        //	disp_int(sender_pid);
        //dis_pos -= Strlen("sender33:");

        // 重置sender
        p_from_proc->p_msg = 0;
        p_from_proc->p_flag = RUNNING;
        //p_from_proc->p_send_to = 0;
        p_from_proc->p_send_to = NO_TASK;
        // 重置receiver
        receiver->p_msg = 0;
        receiver->p_receive_from = NO_TASK;
        receiver->p_send_to = NO_TASK;
        // 解除sender的阻塞
        // unblock(sender);
        unblock(p_from_proc);

        // 调试函数
        assert(p_from_proc->p_msg == 0);
        assert(p_from_proc->p_flag == 0);
        assert(p_from_proc->p_send_to == NO_TASK);
        //assert(p_from_proc->p_receive_from == NO_TASK);
        assert(receiver->p_msg == 0);
        assert(receiver->p_flag == 0);
        assert(receiver->p_receive_from == NO_TASK);
        assert(receiver->p_send_to == NO_TASK);
    }
    else
    {
        //	dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("sender3:", 0x0C);
        //	disp_int(sender_pid);
        //	disp_str("#");
        receiver->p_flag = RECEIVING;
        receiver->p_msg = msg;
        // receiver->p_msg = 0;

        if (sender_pid == ANY)
        {
            receiver->p_receive_from = ANY;
        }
        else
        {
            receiver->p_receive_from = sender_pid;
        }
        //	sender_pid = 3;

        //	dis_pos = (80 * 80 + 0)*2;
        //	dis_pos = 1024 * (10 +1) + 160;

        //	dis_pos = (1024*12 + 0);
        dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("sender4:", 0x0C);
        //	disp_int(sender_pid);
        //	disp_str("#");
        //	disp_str_colour("type:", 0x0B);
        //	disp_int(msg->TYPE);
        //	disp_str("#");
        //	disp_str_colour("copy_ok:", 0x0B);
        //	disp_int(copy_ok);
        //	disp_str("#");
        //	disp_str_colour("type2:", 0x0B);
        //	disp_int(msg->TYPE);
        //	disp_str("#");
        //
        //	dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("receiver2:", 0x0B);
        //	//dis_pos += Strlen("receiver2:");
        //	disp_int(receiver_pid);
        // 调试函数
        //        assert(sender_pid == TASK_TTY || sender_pid == TASK_SYS || sender_pid == TASK_HD
        //                 || sender_pid == TASK_FS || sender_pid == ANY || sender_pid == INTERRUPT
        //                 || sender_pid == PROC_A || sender_pid == TASK_MM || sender_pid == INIT_PID);

        //	dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("receiver flag:", 0x0C);
        //	disp_int(receiver->p_flag);
        //assert(receiver->p_flag == RECEIVING || receiver->p_flag == RUNNING);
        assert(receiver->p_flag == RECEIVING);
        //assert(receiver->p_msg == 0);
        //assert(receiver->p_receive_from == sender_pid || receiver->p_receive_from == ANY);

        block(receiver);
    }

    return 0;
}

// 系统调用--用汇编实现
// int send_msg(Message *msg, int receiver_pid)
// {

// }

// 系统调用--用汇编实现
// int receive_msg(Message *msg, int sender_pid)
// {

// }
// todo 以后去掉这个函数。
void disp_str_colour_debug(char *strr)
{
}

// send_rec封装send_msg和receive_msg，直接被外部使用
// function：选择发送还是接收还是其他;pid，sender或receiver的进程id
int send_rec(int function, Message *msg, int pid)
{

    // todo 调试
//    	dis_pos = 12000 - 128 + 10 + 320;
//    	//dis_pos += 160;
//    	disp_str_colour("send_rec pid:", 0x0C);
//    	disp_int(function);

    //	assert(pid == TASK_TTY || pid == TASK_SYS || pid == TASK_HD
    //                 || pid == TASK_FS || pid == ANY || pid == INTERRUPT || pid == PROC_A
    //		 || pid == TASK_MM
    //		);
    assert(function == SEND || function == RECEIVE || function == BOTH);
	
	if(function == RECEIVE){
		Memset(msg, 0, sizeof(Message));
	}

    int ret;
    switch (function)
    {
    case SEND:
        ret = send_msg(msg, pid);
        break;
    case RECEIVE:
        ret = receive_msg(msg, pid);
        break;
    case BOTH:
        // 两个函数都使用pid，正确吗？
        // 很费解。在send_msg中，pid是本进程投递消息的目标。
        // 在receive_msg中，pid是本进程要从哪个进程接收消息。
//    	dis_pos = 12000 - 128 + 10 + 320;
//    	dis_pos += 160;
//    	disp_str_colour("send_rec pid2:", 0x0C);
//    	disp_int(pid);
        ret = send_msg(msg, pid); // pid是receiver
        //while(proc_table[1].p_flag != RUNNING){

        //}
        //assert(proc_table[1].p_flag == RUNNING);
        if (ret == 0)
        {
		Memset(msg, 0, sizeof(Message));
            ret = receive_msg(msg, pid); // pid是sender
            // assert(msg->val != 0);
        }
        break;
    default:
        panic("function is invalid\n");
        break;
    }
    return 0;
}

// 阻塞进程
int block(Proc *proc)
{
    // 判断，调试函数
    // todo 需要再验证。在运行过程中，确实出现了进程状态不是RUNNING的情况。
//    assert(proc->p_flag != RUNNING);
    schedule_process();
    return 0;
}

// 解除阻塞
int unblock(Proc *proc)
{
    // do nothing
    assert(proc->p_flag == RUNNING);

    return 0;
}

int get_ticks_ipc()
{
    //return ticks;
    Message msg;
    Memset(&msg, 0, sizeof(Message));
    //msg.source = 2;
    msg.type = TICKS_TASK_SYS_TYPE;
    msg.TYPE = TICKS_TASK_SYS_TYPE;
    int ret = send_rec(BOTH, &msg, 1);
    int ticks = msg.val;
    return ticks;
}

// 把整型数字转成指定进制的字符串
//void itoa(int value, char *str, int base)
char *itoa(int value, char **str, int base)
{
    int remainder = value % base;
    int queotion = value / base;
    // 这是递归啊，怎么会用while呢？
    //while(queotion > 0){
    //	itoa(queotion, str, base);
    //}
    if (queotion)
    {
        itoa(queotion, str, base);
    }
    // *str++，是这样写吗？没有把握。不是！致命的常规错误，耗费了很长时间。
    // *str++ = remainder + '0';

    *((*str)++) = remainder + '0';
    return *str;
}
// ipc end

char *i2a(int val, int base, char **ps)
{
    int m = val % base;
    int q = val / base;
    if (q)
    {
        i2a(q, base, ps);
    }
    *(*ps)++ = (m < 10) ? (m + '0') : (m - 10 + 'A');
    // 等价于
    // unsigned char c = (m < 10) ? (m + '0') : (m - 10 + 'A');
    // *ps++ = &c;

    return *ps;
}

void inform_int(int task_nr)
{
    Proc *current = pid2proc(task_nr);
    // 思路：
    // 1. 如果目标进程是RECEIVING状态。
    // 1.1. 如果目标进程接收来自INTERUPT或ANY的消息，进入处理流程。
    // 1.2. 解除目标进程的阻塞。
    // 1.3. 改变目标进程的p_flag。
    // 1.4. 改变目标进程的消息源、消息体等。
    // 2. 如果目标进程不是RECEIVING状态，把该进程的成员has_int_msg设置成1。
    if (current->p_flag & RECEIVING)
    {
        if (current->p_receive_from == INTERRUPT || current->p_receive_from == ANY)
        {

		// todo 我并不理解把current的p_msg设置成这两个值在哪里会被用到。
		current->p_msg->source = INTERRUPT;
		current->p_msg->TYPE = HARD_INT;
		// todo 怎么往进程中塞进去一个变量？此处使用了未声明的变量msg，行不通。
//		phycopy(v2l(current, msg), &msg2tty, sizeof(Message));
		// 只有一个办法通知TTY，接收到识别不了的TYPE，不终止进程。
            current->has_int_msg = 0;
		// todo 想不到更好的方法，只能这样做。
            // current->p_receive_from = NO_TASK;
            current->p_receive_from = NO_TASK;
            current->p_msg = 0;
            current->p_flag = RUNNING;
            unblock(current);
        }
    } else
    {
        current->has_int_msg = 1;
    }
}

int strcmp(char *str1, char *str2)
{
    if (str1 == 0 || str2 == 0)
    {
        return (str1 - str2);
    }

    char *p1 = str1;
    char *p2 = str2;

    for (; *p1 && *p2; p1++, p2++)
    {
        if (*p1 != *p2)
        {
            break;
        }
    }

    return (*p1 - *p2);
}
