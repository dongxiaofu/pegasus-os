#include "stdio.h"
#include "string.h"
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

    while (1)
    {
        read(fd, buf, SECTOR_SIZE);
        if (Strlen(buf) == 0)
        {
            break;
        }

        struct tar_header *tar_header = (struct tar_header *)buf;
        // 不确定能不能用指针接收一个字符串。能。
        char *name = tar_header->name;
        int fdout = open(name, O_WRONLY);
        // 计算文件大小
        int len = 0;
        char *size_str = tar_header->size;
        char *p = size_str;
        while (*p)
        {
            len = len * 8 + (*p - '0');
            p++;
        }

        int bytes_left = len;
        while (bytes_left)
        {
            int iobytes = MIN(chunk, bytes_left);
            read(fd, buf, ((iobytes - 1) / SECTOR_SIZE + 1) * SECTOR_SIZE);
            write(fdout, buf, iobytes);
            bytes_left -= iobytes;
        }

        close(fdout);
    }

    close(fd);
}


void exception_handler(int vec_no, int error_no, int eip, int cs, int eflags)
{
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
    // 这个值是第2个终端的显存初始处。
    dis_pos = 12000 - 128 + 10;
    // 清屏
    for (int i = 0; i < 80 * 25 * 2; i++)
    {
        disp_str(" ");
    }

    dis_pos = 12000 - 128 + 10;
    // int colour = 0x74;
    int colour = 0x0A;
    char *error_msg = msg[vec_no];
    //	Printf("error:%s\n", error_msg);
    disp_str_colour(error_msg, colour);
    disp_str("\n\n");
    disp_str_colour("vec_no:", colour);
    disp_int(vec_no);
    disp_str("\n\n");

    if (error_no != 0xFFFFFFFF)
    {
        disp_str_colour("error_no:", colour);
        disp_str_colour("error_no:", colour);
        disp_int(error_no);
        // Printf("error_no:%x\n", error_no);
        disp_str("\n\n");
    }

    disp_str_colour("cs:", colour);
    disp_int(cs);
    //Printf("cs:%x\n", cs);
    disp_str("\n\n");

    disp_str_colour("eip:", colour);
    disp_int(eip);
    //Printf("eip:%x\n", eip);
    disp_str("\n\n");

    disp_str_colour("eflags:", colour);
    disp_int(eflags);
    disp_str("\n\n");

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
    //return;
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

void kernel_main()
{
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
        //for (int i = 0; i < TASK_PROC_NUM; i++) {
        proc = proc_table + i;
        proc->ldt_selector = LDT_FIRST_SELECTOR + 8 * i;
        proc->pid = i;
        if (i >= TASK_PROC_NUM + USER_PROC_NUM)
        {
            proc->p_flag = FREE_SLOT;
            continue;
        }
        proc->p_flag = 0;
        //  proc = proc_table + i;
        if (i < TASK_PROC_NUM)
        {
            task = sys_task_table + i;
            eflags = 0x1202;
            rpl = 1;
            dpl = 1;
            proc->ticks = proc->priority = 15;
            proc->tty_index = 1;
        }
        else
        {
            task = user_task_table + i - TASK_PROC_NUM;
            eflags = 0x202;
            //eflags = 0x1202;
            rpl = 3;
            dpl = 3;
            proc->ticks = proc->priority = 5;
            //proc->tty_index = i - TASK_PROC_NUM;
            proc->tty_index = 1; //i - TASK_PROC_NUM;
        }

        // 进程名
        Strcpy(proc->name, task->name);

        //	if(strcmp(proc->name, "INIT") != 0){

        //proc->ldt_selector = LDT_FIRST_SELECTOR + i<<3;
        //        proc->ldt_selector = LDT_FIRST_SELECTOR + 8 * i;
        //        proc->pid = i;
        //proc->ldts[0] = ;
        Memcpy(&proc->ldts[0], &gdt[CS_SELECTOR_INDEX], sizeof(Descriptor));
        // 修改ldt描述符的属性。全局cs的属性是 0c9ah。
        //proc->ldts[0].seg_attr1 = 0xcd;
        //proc->ldts[0].seg_attr1 = 0xda;
        //proc->ldts[0].seg_attr1 = 0xba;			// 1011 1010
        proc->ldts[0].seg_attr1 = 0x9a | (dpl << 5); // 1001	1010
                                                     // todo 修改任务进程的内存的起始地址
                                                     // int base = 0x50000;
                                                     //int base = 5242880;
                                                     //	proc->ldts[0].seg_base_below = base & 0xFFFF;
                                                     //proc->ldts[0].seg_base_middle = (base >> 16) & 0xFF;
                                                     //proc->ldts[0].seg_base_high = (unsigned char) ((base >> 24) & 0xFF);
        Memcpy(&proc->ldts[1], &gdt[DS_SELECTOR_INDEX], sizeof(Descriptor));
        // 修改ldt描述符的属性。全局ds的属性是 0c92h
        // proc->ldts[1].seg_attr1 = 0xd2;
        // proc->ldts[1].seg_attr1 = 0xb2;			// 1011 0010
        proc->ldts[1].seg_attr1 = 0x92 | (dpl << 5); // 1001 0010
                                                     // proc->ldts[1].seg_attr1 = 0xb2;
        //proc->ldts[1].seg_base_below = base & 0xFFFF;
        //proc->ldts[1].seg_base_middle = (base >> 16) & 0xFF;

        //proc->ldts[1].seg_base_high = (unsigned char) ((base >> 24) & 0xFF);
        //}else{
        if (strcmp(proc->name, "INIT") == 0)
        {
            //	dis_pos = 12000 - 128 + 10 + 320;
            //	disp_str_colour("enter INIT", 0x0C);
            int init_image_size = (0x1000 + 0x020000 + 1);
            //int cs_attribute = 0x8000 | 0x4000 | 0x98 | (3 <<  5);
            int cs_attribute = 0xcfa; //0x8000 | 0x4000 | 0x98 | (3 <<  5);
            InitDescriptor(&(proc_table[i].ldts[0]), 0, (init_image_size - 1) >> 12, cs_attribute);
            //        proc->ldts[0].seg_attr1 = 0x9a | (dpl << 5);                // 1001	1010
            ////
            int ds_attribute = 0xcf2; //0x8000 | 0x4000 | 0x92 | (3 << 5);
            InitDescriptor(&(proc_table[i].ldts[1]), 0, (init_image_size - 1) >> 12, ds_attribute);
            //        proc->ldts[1].seg_attr1 = 0x92 | (dpl << 5);            // 1001 0010

            //	proc->ldts[0].seg_limit_below = init_image_size & 0xFFFF;
            //	proc->ldts[0].seg_limit_high_and_attr2 = ((proc->ldts[0].seg_limit_high_and_attr2) & 0xF0) |(init_image_size >> 16);
            //	proc->ldts[1].seg_limit_below = init_image_size & 0xFFFF;
            //	proc->ldts[1].seg_limit_high_and_attr2 = ((proc->ldts[1].seg_limit_high_and_attr2) & 0xF0)|(init_image_size >> 16);
        }
        // 初始化进程表的段寄存器
        // 我又看不懂当初写的代码了。
        // 一定要写非常详细的注释。
        // 0101：rpl是01，TI是1，在ldt中的索引是0。
        // 这里，是LDT的选择子，不是GDT的选择子。又耗费了很多很多时间才弄清楚。
        unsigned short cs = 0x4 | rpl;
        unsigned short ds = 0xC | rpl;
        // proc->s_reg.cs = 0x05;	// 000 0101
        // proc->s_reg.ds = 0x0D;	// 000 1101
        // proc->s_reg.fs = 0x0D;	// 000 1101
        // proc->s_reg.es = 0x0D;	// 000 1101
        // //proc->s_reg.ss = 0x0D;	// 000 1101
        // proc->s_reg.ss = 0x0D;	// 000 1100
        proc->s_reg.cs = cs;
        proc->s_reg.ds = ds;
        proc->s_reg.fs = ds;
        proc->s_reg.es = ds;
        //proc->s_reg.ss = 0x0D;	// 000 1101
        proc->s_reg.ss = ds; // 000 1100
        // 需要修改gs的TI和RPL
        // proc->s_reg.gs = GS_SELECTOR;
        // proc->s_reg.gs = GS_SELECTOR | (0x101);
        //proc->s_reg.gs = GS_SELECTOR;
        //proc->s_reg.gs = GS_SELECTOR & (0x001);
        // 0x3b--> 0011 1011 --> 0011 1 011
        // 1001
        proc->s_reg.gs = GS_SELECTOR & (0xFFF9);
        // proc->s_reg.gs = 0x0D;
        // 初始化进程表的通用寄存器
        // proc->s_reg.eip = (int)TestA;
        //proc->s_reg.eip = (int)task_table.func_name;
        proc->s_reg.eip = (int)task->func_name;
        // proc->s_reg.eip = TestA;

        //proc->s_reg.esp = (int)(proc_stack + 128 * i);
        // proc->s_reg.esp = (int)(proc_stack + 128 * (i+1));
        proc->s_reg.esp = (int)(p_task_stack);
        p_task_stack -= DEFAULT_STACK_SIZE;
        // proc->s_reg.esp = proc_stack + 128;
        // 抄的于上神的。需要自己弄清楚。我已经理解了。
        // IOPL = 1, IF = 1
        // IOPL 控制I/O权限的特权级，IF控制中断的打开和关闭
        //proc->s_reg.eflags = 0x1202;	// 0001 0010 0000 0010
        proc->s_reg.eflags = eflags;

        proc->has_int_msg = 0;
        proc->q_sending = 0;
        proc->q_next = 0;
        proc->p_receive_from = NO_TASK;
        proc->p_send_to = NO_TASK;
        proc->p_msg = 0;

        // ipc start
        //proc->header = {-1, NULL};
        //*(proc->header) = {-1, NULL};
        // proc->header->sender_pid = -1;
        // proc->header->next = 0;
        // struct MsgSender header = {-1, NULL};
        //struct MsgSender header = {-1, 0};
        //proc->header = &header;
        // ipc end

        //proc->tty_index = 0;
    }
    // 启动进程，扣动扳机，砰！
    //proc_ready_table = &proc_table[1];
    //proc_ready_table = &proc_table[2];
    proc_ready_table = proc_table;

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
    dis_pos = 0;

    init_keyboard_handler();
    restart();

    while (1)
    {
    }
}

#define A_PRINT_NUM 3
#define B_PRINT_NUM 3
#define C_PRINT_NUM 3

// 测试文件系统
void TestFS()
{
    Printf("TestA is running\n");
    char filename[5] = "AC";
    char filename2[5] = "AB";
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
            int k = read(fd, buf2, 18);
            Printf("buf2 = %s\n", buf2);
            delay(10);
            int fd2 = open(filename2, O_CREAT);
            Printf("fd2 = %x\n", fd2);
            flag = 0;
            char buf3[20] = "cg:how are you?";
            write(fd2, buf3, Strlen(buf2));
            char buf4[20];
            int k2 = read(fd2, buf4, 18);
            Printf("buf4 = %s\n", buf4);
            delay(10);
        }
    }
}

// wait、exit测试用例
void wait_exit()
{
	int fd_stdout = open("dev_tty1", O_RDWR);
	int fd_stdin = open("dev_tty1", O_RDWR);

	int pid = fork();
	if(pid > 0){
		int s = 2;
//		wait(&s);
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
		exit(9);
		Printf("I am child 1\n");
		while(1){}
	}
}

// fork、write、read测试用例
void INIT_fork()
{
	int fd_stdout = open("dev_tty1", O_RDWR);
	int fd_stdin = open("dev_tty1", O_RDWR);
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


void INIT()
{
	wait_exit();
}

void TestA()
{
//    Printf("TestA is running\n");
    while (1)
    {
    }
    //TestFS();
    //	TestFork();
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


void TaskSys()
{
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



