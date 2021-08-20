#include "stdio.h"
#include "string.h"
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
struct tar_header {
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

void untar(const char *filename) {
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

    while (1) {
        read(fd, buf, SECTOR_SIZE);
        if (Strlen(buf) == 0) {
            break;
        }

        struct tar_header *tar_header = (struct tar_header *) buf;
        // 不确定能不能用指针接收一个字符串。能。
        char *name = tar_header->name;
        int fdout = open(name, O_WRONLY);
        // 计算文件大小
        int len = 0;
        char *size_str = tar_header->size;
        char *p = size_str;
        while (*p) {
            len = len * 8 + (*p - '0');
            p++;
        }

        int bytes_left = len;
        while (bytes_left) {
            int iobytes = MIN(chunk, bytes_left);
            read(fd, buf, ((iobytes - 1) / SECTOR_SIZE + 1) * SECTOR_SIZE);
            write(fdout, buf, iobytes);
            bytes_left -= iobytes;
        }

        close(fdout);
    }

    close(fd);
}

void atoi(char *str, int num) {
//	char str2[20];
    char *p = str;
    *p++ = '0';
    *p++ = 'x';
    char ch;
    char flag = 0;

    if (num == 0) {
        *p++ = '0';
    } else {
        for (int i = 28; i >= 0; i -= 4) {
            ch = (num >> i) & 0xF;
            if (flag == 0 && ch == 0) continue;
            flag = 1;
            ch = ch + '0';
            if (ch > '9') {
                ch += 7;
            }
            *p++ = ch;
        }
    }

    *p = 0;
//	Memcpy(str, str2, Strlen(str2));

    return;
}

void disp_int(int num) {
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

void exception_handler(int vec_no, int error_no, int eip, int cs, int eflags) {
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
    for (int i = 0; i < 80 * 25 * 2; i++) {
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

    if (error_no != 0xFFFFFFFF) {
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

void init_internal_interrupt() {
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

void test() {
    disp_str("A");
    disp_int(0x6);
    disp_str("\n");
    //return;
    //disp_str_colour2(0x9988, 0x74);
    dis_pos = 0;
    for (int i = 0; i < 80 * 25 * 2; i++) {
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


void disp_str_colour3(char *str, int colour) {

}

void spurious_irq(int irq) {
    disp_str_colour("\n------------irq start---------------\n", 0x0B);
    disp_int(irq);
    ticks++;
    disp_str("[");
    disp_int(ticks);
    disp_str("]");
    disp_str_colour("\n------------irq end---------------\n", 0x0C);
}

void kernel_main() {
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
    for (int i = 0; i < TASK_PROC_NUM + USER_PROC_NUM; i++) {
    //for (int i = 0; i < TASK_PROC_NUM; i++) {
        proc = proc_table + i;
        if (i < TASK_PROC_NUM) {
            task = sys_task_table + i;
            eflags = 0x1202;
            rpl = 1;
            dpl = 1;
            proc->ticks = proc->priority = 15;
            proc->tty_index = 1;
        } else {
            task = user_task_table + i - TASK_PROC_NUM;
            eflags = 0x202;
            //eflags = 0x1202;
            rpl = 3;
            dpl = 3;
            proc->ticks = proc->priority = 10;
            //proc->tty_index = i - TASK_PROC_NUM;
            proc->tty_index = 1;//i - TASK_PROC_NUM;
        }

        //proc->ldt_selector = LDT_FIRST_SELECTOR + i<<3;
        proc->ldt_selector = LDT_FIRST_SELECTOR + 8 * i;
        proc->pid = i;
        //proc->ldts[0] = ;
        Memcpy(&proc->ldts[0], &gdt[CS_SELECTOR_INDEX], sizeof(Descriptor));
        // 修改ldt描述符的属性。全局cs的属性是 0c9ah。
        //proc->ldts[0].seg_attr1 = 0xcd;
        //proc->ldts[0].seg_attr1 = 0xda;
        //proc->ldts[0].seg_attr1 = 0xba;			// 1011 1010
        proc->ldts[0].seg_attr1 = 0x9a | (dpl << 5);                // 1001	1010
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
        proc->ldts[1].seg_attr1 = 0x92 | (dpl << 5);            // 1001 0010
        // proc->ldts[1].seg_attr1 = 0xb2;
//proc->ldts[1].seg_base_below = base & 0xFFFF;
//proc->ldts[1].seg_base_middle = (base >> 16) & 0xFF;
//proc->ldts[1].seg_base_high = (unsigned char) ((base >> 24) & 0xFF);

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
        proc->s_reg.ss = ds;    // 000 1100
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
        proc->s_reg.eip = (int) task->func_name;
        // proc->s_reg.eip = TestA;

        //proc->s_reg.esp = (int)(proc_stack + 128 * i);
        // proc->s_reg.esp = (int)(proc_stack + 128 * (i+1));
        proc->s_reg.esp = (int) (p_task_stack);
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
    for (int i = 0; i < 80 * 25 * 2; i++) {
        disp_str(" ");
    }
    dis_pos = 0;

    init_keyboard_handler();
    restart();

    while (1) {}
}

#define A_PRINT_NUM 3
#define B_PRINT_NUM 3
#define C_PRINT_NUM 3

// 测试文件系统
void TestFS() {
	Printf("TestA is running\n");
	char filename[5] = "AC";
	char filename2[5] = "AB";
	int flag = 1;
	while(1){
	if(flag == 1){
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


// 行不通。并不能当进程体。
void TestA() {
	Printf("TestA is running\n");
	TestFS();
}

void delay(int time) {
    for (int i = 0; i < time; i++) {
        for (int j = 0; j < 10; j++) {
            for (int k = 0; k < 1000; k++) {
            }
        }
    }
}

void TestB() {
    //Printf("<b ticks:%x\n>", get_ticks());
    // select_console(1);
    unsigned int i = 0;
    while (1) {
        //select_console(1);
        //Printf("<b ticks:%x\n>", get_ticks());
        if (i < B_PRINT_NUM) {
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

void TestC() {
    //Printf("<c ticks:%x\n>", get_ticks());
    // select_console(2);
    unsigned int i = 0;
    while (1) {
        //select_console(2);
        if (i < C_PRINT_NUM) {
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

int sys_get_ticks() {
    //disp_str("@@");

    return ticks;
}

void sys_write(char *buf, int len, Proc *proc) {
    //TTY *tty = &tty_table[proc - proc_table];
    TTY *tty = &tty_table[proc->tty_index];
    int i = len;
    char *p = buf;
    while (i > 0) {
        out_char(tty, *p);
        p++;
        i--;
    }
}

void milli_delay(unsigned int milli_sec) {
    int t = get_ticks_ipc();

    while (((get_ticks_ipc() - t) / 100 * 1000) < milli_sec) {}
}

void TaskSys() {
    while (1) {
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
        if (ret != 0) {
            return;
        }
        //int type = msg.type;
        int type = msg.TYPE;
        int source = msg.source;
        switch (type) {
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
void Printf(char *fmt, ...) {
    char buf[256];
    Memset(buf, 0, 256);
    // 理解这句，耗费了大量时间。
    char *var_list = (char *) ((char *) &fmt + 4);
    int len = vsprintf(buf, fmt, var_list);
    //char str[2] = {'A', 0};
    //len = 2;
    write2(buf, len);
    return;
}

int vsprintf(char *buf, char *fmt, char *var_list) {
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
    for (p = buf; *fmt; fmt++) {
        if (*fmt != '%') {
            *p++ = *fmt;
            //p++;
            continue;
        }
        // 跳过%
        fmt++;
        switch (*fmt) {
            //case 'd':;
            case 'd': {
                int m = *(int *) next_arg;
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
                atoi(tmp, *(int *) next_arg);
                //Strcpy(buf, tmp);
                Strcpy(p, tmp);
                next_arg += 4;
                len2 = Strlen(tmp);
                p += len2;//Strlen(tmp);
                break;
            case 's':
                //char *str = *(char **)next_arg;
                Strcpy(p, *(char **) next_arg);
                len2 = Strlen(*(char **) next_arg);
                next_arg += 4;
                //len2 = 6;//Strlen(*(char **)next_arg);
                p += len2;//Strlen(tmp);
                break;
            case 'c':
                //char c = *(char *)next_arg;
                *p = *(char *) next_arg;
                next_arg += 4;
                len2 = 1;
                p += len2;//Strlen(tmp);
                break;
            default:
                break;
        }
    }

    return (p - buf);
}
// printf end



// debug start
void printx(char *fmt, ...) {
    char buf[256];
    char *var_list = (char *) ((char *) &fmt + 4);
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

    if (k_reenter == 0) {
        int ds = proc->s_reg.ds;
        base = Seg2PhyAddrLDT(ds, proc);
    } else if (k_reenter > 0) {
        base = Seg2PhyAddr(DS_SELECTOR);
    }
    // line_addr = base + error_msg;
    // line_addr = base + (int *)error_msg;
    line_addr = base + (int) error_msg;


    // 打印字符串
    TTY *tty = &tty_table[proc->tty_index];
    char *p = (char *) line_addr;
    char magic = *p;
    while (len > 0) {
        if (*p == ASSERT_MAGIC || *p == PANIC_MAGIC) {
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
    if (magic == ASSERT_MAGIC) {
        if (k_reenter > 0) {
            disable_int();
            __asm__("hlt");
        } else {

        }
    } else if (magic == PANIC_MAGIC) {
        disable_int();
        __asm__("hlt");
    }

    return;
}

void spin(char *error_msg) {
    while (1) {}
}

void panic(char *error_msg) {
    printx("%c%s\n", PANIC_MAGIC, error_msg);
    //Printf("%c%s\n", PANIC_MAGIC, error_msg);
}

void assertion_failure(char *exp, char *filename, char *base_filename, unsigned int line) {
    // todo %d还未实现或者有问题。
    printx("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
            //Printf("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
           ASSERT_MAGIC, exp, filename, base_filename, line);
    spin("Stop Here!\n");
    return;
}


// debug end


// ipc start
int dead_lock(int src, int dest) {
    Proc *src_proc = pid2proc(src);
    Proc *dest_proc = pid2proc(dest);
    while (1) {
        // Proc *src_proc = pid2proc(src);
        // Proc *dest_proc = pid2proc(dest);
        if (dest_proc->p_flag == SENDING) {
            if (dest_proc->p_send_to == src) {
                // panic("dead lock!\n");
                //Printf("%x---->%x---->", src, dest);
                // 打印死锁环
                Proc *p = dest_proc;
                do {
                    // Printf("%x---->%x---->", proc2pid(p), p->p_send_to);
                    p = pid2proc(p->p_send_to);
                } while (p->pid != src);
                //Printf("%x\n", src);
                // Printf("%x---->%x---->", proc2pid(p), src);
                return 1;
            }
            dest_proc = pid2proc(dest_proc->p_send_to);
        } else {
            break;
        }
    }

    return 0;
}

// send_msg 通过sys_call调用
int sys_send_msg(Message *msg, int receiver_pid, Proc *sender) {
assert(receiver_pid == 0 || receiver_pid == 1 || receiver_pid == 2 || receiver_pid == 3 || receiver_pid == 4 || receiver_pid == 15 || receiver_pid == 30);
    Proc *receiver = pid2proc(receiver_pid);
    int sender_pid = proc2pid(sender);
    if (DEBUG == 1) {
        Printf("sender = %x, receiver = %x\n", sender_pid, receiver_pid);

        assert((sender_pid == 1) || (sender_pid == 2) || (sender_pid == 3) || (receiver_pid == 15));
        assert((receiver_pid == 1) || (receiver_pid == 2) || (receiver_pid == 3) || (receiver_pid == 15));
    }
    msg->source = sender_pid;
    // 死锁检测
    if (dead_lock(sender_pid, receiver_pid) == 1) {
        panic("dead lock\n");
    }

    if (receiver->p_flag == RECEIVING && (receiver->p_receive_from == sender_pid
                                          || receiver->p_receive_from == ANY)) {
        // 计算msg的线性地址
        int ds = sender->s_reg.ds;
        int base = Seg2PhyAddrLDT(ds, sender);
        int msg_line_addr = base + msg;
        int msg_size = sizeof(Message);

        int ds2 = receiver->s_reg.ds;
        int base2 = Seg2PhyAddrLDT(ds2, receiver);
        int msg_line_addr2 = base2 + receiver->p_msg;
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

    } else {
        // 思路：
        // 1. 如何目标进程没有准备好接收消息，把消息加入目标进程的消息队列。
        // 2. 如果是目标进程的消息队列的第一个进程是空，把本进程设置成消息队列的第一个进程。
        // 3. 如果目标进程的消息队列的第一个进程不是空，把本进程放到消息队列的末尾。
        Proc *pre = 0;
        Proc *p = receiver;
        if (receiver->q_sending == 0) {
            receiver->q_sending = sender;
            sender->q_next = 0;
        } else {
            Proc *p = receiver->q_sending;
            while (p) {
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
int sys_receive_msg(Message *msg, int sender_pid, Proc *receiver) {
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
    if (DEBUG == 1) {
        Printf("sender = %x, receiver = %x\n", sender_pid, receiver_pid);

        assert((sender_pid == 1) || (sender_pid == 2) || (sender_pid == 3) || (sender_pid == 15));
        assert((receiver_pid == 1) || (receiver_pid == 2) || (receiver_pid == 3) || (receiver_pid == 15));
    }

    if (receiver->has_int_msg && (sender_pid == ANY || sender_pid == INTERRUPT)) {

        Message m;
        Memset(&m, 0, sizeof(Message));
        m.source = INTERRUPT;
        m.type = 1;

        assert(msg);

        phycopy(v2l(receiver_pid, msg), &m,
                sizeof(Message));

        receiver->has_int_msg = 0;
        receiver->p_receive_from = NO_TASK;
        receiver->p_send_to = NO_TASK;
        receiver->p_flag = RUNNING;

        return 0;
    }


    // 主要思路：
    // 1. 如果信息来源是ANY，从本进程的消息队列中取出一个消息进行处理。
    // 2. 如果消息来源不是ANY，进入下面的流程。
    // 2.1. 进程pid合法 && 消息来源的状态是SENDING && 消息来源的发送对象是本进程。
    if (sender_pid == ANY) {
        if (receiver->q_sending) {
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
    } else if (0 <= sender_pid && sender_pid < USER_PROC_NUM + TASK_PROC_NUM) {
        if (sender->p_flag == SENDING && (sender->p_send_to == ANY
                                          || sender->p_send_to == receiver_pid)) {
            p_from = receiver->q_sending;
            while (p_from) {
                pre = p_from;
                if (p_from->pid == sender_pid) {
                    copy_ok = 1;
                    break;
                }
                p_from = p_from->q_next;
            }
        }
    }


    if (copy_ok == 1) {
        Proc *p_from_proc = p_from;
        // 计算msg的线性地址
        int ds = receiver->s_reg.ds;
        int base = Seg2PhyAddrLDT(ds, receiver);
        void *msg_line_addr = (void *)(base + msg);
        int msg_size = sizeof(Message);

	
        int ds2 = receiver->s_reg.ds;
        int base2 = Seg2PhyAddrLDT(ds2, p_from_proc);
        void *msg_line_addr2 = (void *)(base2 + p_from_proc->p_msg);

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

	if(sender_pid == 4){
		assert(msg->TYPE == OPEN);
	}

        // 移除已经处理过的消息。
        if (p_from == receiver->q_sending) {
            receiver->q_sending = p_from->q_next;
            p_from->q_next = 0;
        } else {
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

    } else {
//	dis_pos = (dis_pos / 160 + 1) * 160;
//	disp_str_colour("sender3:", 0x0C);
//	disp_int(sender_pid);
//	disp_str("#");
        receiver->p_flag = RECEIVING;
        receiver->p_msg = msg;
       // receiver->p_msg = 0;

        if (sender_pid == ANY) {
            receiver->p_receive_from = ANY;
        } else {
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
        assert(sender_pid == TASK_TTY || sender_pid == TASK_SYS || sender_pid == TASK_HD
                 || sender_pid == TASK_FS || sender_pid == ANY || sender_pid == INTERRUPT
                 || sender_pid == PROC_A);
	
//	dis_pos = (dis_pos / 160 + 1) * 160;
//	disp_str_colour("receiver flag:", 0x0C);
//	disp_int(receiver->p_flag);
        //assert(receiver->p_flag == RECEIVING || receiver->p_flag == RUNNING);
        assert(receiver->p_flag == RECEIVING);
        //assert(receiver->p_msg == 0);
	assert(receiver->p_receive_from == sender_pid);

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
int send_rec(int function, Message *msg, int pid) {
	
	// todo 调试
//	dis_pos = 12000 - 128 + 10 + 320;
//	//dis_pos += 160;
//	disp_str_colour("send_rec pid:", 0x0C);
//	disp_int(pid);
	
	assert(pid == TASK_TTY || pid == TASK_SYS || pid == TASK_HD
                 || pid == TASK_FS || pid == ANY || pid == INTERRUPT || pid == PROC_A);
	assert(function == SEND || function == RECEIVE || function == BOTH);

    int ret;
    switch (function) {
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
            ret = send_msg(msg, pid);    // pid是receiver
            //while(proc_table[1].p_flag != RUNNING){

            //}
            //assert(proc_table[1].p_flag == RUNNING);
            if (ret == 0) {
                ret = receive_msg(msg, pid);    // pid是sender
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
int block(Proc *proc) {
    // 判断，调试函数
    assert(proc->p_flag != RUNNING);
    schedule_process();
    return 0;
}

// 解除阻塞
int unblock(Proc *proc) {
    // do nothing
    assert(proc->p_flag == RUNNING);

    return 0;
}

int get_ticks_ipc() {
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
char *itoa(int value, char **str, int base) {
    int remainder = value % base;
    int queotion = value / base;
    // 这是递归啊，怎么会用while呢？
    //while(queotion > 0){
    //	itoa(queotion, str, base);
    //}
    if (queotion) {
        itoa(queotion, str, base);
    }
    // *str++，是这样写吗？没有把握。不是！致命的常规错误，耗费了很长时间。
    // *str++ = remainder + '0';

    *((*str)++) = remainder + '0';
    return *str;
}
// ipc end

char *i2a(int val, int base, char **ps) {
    int m = val % base;
    int q = val / base;
    if (q) {
        i2a(q, base, ps);
    }
    *(*ps)++ = (m < 10) ? (m + '0') : (m - 10 + 'A');
    // 等价于
    // unsigned char c = (m < 10) ? (m + '0') : (m - 10 + 'A');
    // *ps++ = &c;

    return *ps;
}

void inform_int(int task_nr) {
    Proc *current = pid2proc(task_nr);
    // 思路：
    // 1. 如果目标进程是RECEIVING状态。
    // 1.1. 如果目标进程接收来自INTERUPT或ANY的消息，进入处理流程。
    // 1.2. 解除目标进程的阻塞。
    // 1.3. 改变目标进程的p_flag。
    // 1.4. 改变目标进程的消息源、消息体等。
    // 2. 如果目标进程不是RECEIVING状态，把该进程的成员has_int_msg设置成1。
    if (current->p_flag & RECEIVING) {
        if (current->p_receive_from == INTERRUPT || current->p_receive_from == ANY) {
            current->has_int_msg = 0;
            current->p_receive_from = NO_TASK;
            current->p_msg = 0;
            current->p_flag = RUNNING;
            unblock(current);
        }
    } else {
        current->has_int_msg = 1;
    }
}
