#ifndef _PEGASUS_OS_CONST_H
#define _PEGASUS_OS_CONST_H

#define DEBUG 0
#define DEFAULT_STR_SIZE 512


// 描述符在gdt中的索引
// #define CS_SELECTOR_INDEX 1;
#define CS_SELECTOR_INDEX 1
#define DS_SELECTOR_INDEX 6
#define GS_SELECTOR_INDEX 7

#define TSS_SELECTOR_INDEX 8
#define LDT_FIRST_SELECTOR_INDEX 9

// 选择子
//#define CS_SELECTOR 0x1000;
#define CS_SELECTOR 0x08
#define DS_SELECTOR 0x30
//#define GS_SELECTOR 0x38
#define GS_SELECTOR 0x3b
#define TSS_SELECTOR 0x40	//1000  000 ---> 100 0000
#define LDT_FIRST_SELECTOR 0x48


// ipc0 start
// 能用enum吗？不能很快心算出”能不能“这个结果，先不用，减小难度。
#define RUNNING	0
#define SENDING 1
#define RECEIVING 2

// send_rec的function的取值
#define SEND 1
#define RECEIVE 2
#define BOTH	3

// Message 中的type的取值
#define TICKS_TASK_SYS_TYPE 1 


// 系统调用 start
#define SYS_CALL_FUNCTION_NUM 5
#define NR_GET_TICKS	0
#define _NR_WRITE	1
#define _NR_WRITE_DEBUG	2
#define _NR_SEND_MSG	3
#define _NR_RECEIVE_MSG	4

#define INIT_MASTER_VEC_NO 0x20
#define INIT_SLAVE_VEC_NO 0x28


// 键盘相关 start
#define NR_SCAN_CODES 128
#define MAP_COLS 3

// 识别不可打印字符
#define FLAG_EXT 0x0100

// 映射数组中的常量start
#define ESC	0x1 + FLAG_EXT
#define BACKSPACE	0x2 + FLAG_EXT
#define TAB	0x3 + FLAG_EXT
#define Q	0x4 + FLAG_EXT
#define W	0x5 + FLAG_EXT
#define E	0x6 + FLAG_EXT
#define R	0x7 + FLAG_EXT
#define T	0x8 + FLAG_EXT
#define Y	0x9 + FLAG_EXT
#define U	0x10 + FLAG_EXT
#define I	0x11 + FLAG_EXT
#define O	0x12 + FLAG_EXT
#define P	0x13 + FLAG_EXT
#define ENTER	0x14 + FLAG_EXT
#define PAD_ENTER	0x15 + FLAG_EXT
#define CTRL_L	0x16 + FLAG_EXT
#define CTRL_R	0x17 + FLAG_EXT
#define A	0x18 + FLAG_EXT
#define S	0x19 + FLAG_EXT
#define D	0x20 + FLAG_EXT
#define F	0x21 + FLAG_EXT
#define G	0x22 + FLAG_EXT
#define H	0x23 + FLAG_EXT
#define J	0x24 + FLAG_EXT
#define K	0x25 + FLAG_EXT
#define L	0x26 + FLAG_EXT
#define SHIFT_L	0x27 + FLAG_EXT
#define Z	0x28 + FLAG_EXT
#define X	0x29 + FLAG_EXT
#define C	0x30 + FLAG_EXT
#define V	0x31 + FLAG_EXT
#define B	0x32 + FLAG_EXT
#define N	0x33 + FLAG_EXT
#define M	0x34 + FLAG_EXT
#define PAD_SLASH	0x35 + FLAG_EXT
#define SHIFT_R	0x36 + FLAG_EXT
#define ALT_L	0x37 + FLAG_EXT
#define ALT_R	0x38 + FLAG_EXT
#define CAPS_LOCK	0x39 + FLAG_EXT
#define F1	0x40 + FLAG_EXT
#define F2	0x41 + FLAG_EXT
#define F3	0x42 + FLAG_EXT
#define F4	0x43 + FLAG_EXT
#define F5	0x44 + FLAG_EXT
#define F6	0x45 + FLAG_EXT
#define F7	0x46 + FLAG_EXT
#define F8	0x47 + FLAG_EXT
#define F9	0x48 + FLAG_EXT
#define F10	0x49 + FLAG_EXT
#define NUM_LOCK	0x50 + FLAG_EXT
#define SCROLL_LOCK	0x51 + FLAG_EXT
#define PAD_HOME	0x52 + FLAG_EXT
#define HOME	0x53 + FLAG_EXT
#define PAD_UP	0x54 + FLAG_EXT
#define UP	0x55 + FLAG_EXT
#define PAD_PAGEUP	0x56 + FLAG_EXT
#define PAGEUP	0x57 + FLAG_EXT
#define PAD_MINUS	0x58 + FLAG_EXT
#define PAD_LEFT	0x59 + FLAG_EXT
#define LEFT	0x60 + FLAG_EXT
#define PAD_MID	0x61 + FLAG_EXT
#define PAD_RIGHT	0x62 + FLAG_EXT
#define RIGHT	0x63 + FLAG_EXT
#define PAD_PLUS	0x64 + FLAG_EXT
#define PAD_END	0x65 + FLAG_EXT
#define END	0x66 + FLAG_EXT
#define PAD_DOWN	0x67 + FLAG_EXT
#define DOWN	0x68 + FLAG_EXT
#define PAD_PAGEDOWN	0x69 + FLAG_EXT
#define PAGEDOWN	0x70 + FLAG_EXT
#define PAD_INS	0x71 + FLAG_EXT
#define INSERT	0x72 + FLAG_EXT
#define PAD_DOT	0x73 + FLAG_EXT
#define DELETE	0x74 + FLAG_EXT
#define F11	0x75 + FLAG_EXT
#define F12	0x76 + FLAG_EXT
#define GUI_L	0x77 + FLAG_EXT
#define GUI_R	0x78 + FLAG_EXT
#define APPS	0x79 + FLAG_EXT
// pause
#define PAUSE 0x80 + FLAG_EXT
#define PRINT_SCREEN 0x81 + FLAG_EXT
// 映射数组中的常量 end

// #define KEYBOARD_BUF_SIZE 10; // 不能有逗号
#define KEYBOARD_BUF_SIZE 800
// shift_r、shift_l等特权常量，值是它们的Make Code
// 和keymap.h中的定义重复了，故在后面加了1
#define SHIFT_R1 0x36
#define SHIFT_L1 0x2A

// 键盘相关 end

// console相关 start
#define TTY_BUF_SIZE 800
#define TTY_NUM 3
// 一屏占用的显存空间。
// todo 我不确定是不是整个值。
#define SCREEN_SIZE 80 * 25
// 一行的宽度
#define SCREEN_WIDTH 80
// 显存的初始地址
#define VM_BASE_ADDR 0xb8000
// 显存的总大小
#define VM_TOTAL (0xBFFFF - 0xb8000)
// 打印字符的默认颜色
#define DEFAULT_COLOUR 0x0A
// console相关 end


// 进程相关 start
// 用户进程的数量
#define USER_PROC_NUM 3
// 系统任务的数量
#define TASK_PROC_NUM 4
// 用fork创建的用户进程的数量
#define FORKED_USER_PROC_NUM 32
// 消息收发对象是任意进程时，目标进程的pid是这个值
#define ANY (USER_PROC_NUM + TASK_PROC_NUM + 10)
// 消息收发对象是无对象时，目标进程的pid是这个值
#define NO_TASK (USER_PROC_NUM + TASK_PROC_NUM + 25)

// 进程栈默认大小
// #define DEFAULT_STACK_SIZE 32768     // 这个值，导致无法加载内核
#define DEFAULT_STACK_SIZE 1024

// 进程A、B、C的堆栈大小
#define A_STACK_SIZE DEFAULT_STACK_SIZE
#define B_STACK_SIZE DEFAULT_STACK_SIZE
#define C_STACK_SIZE DEFAULT_STACK_SIZE
// 系统进程
#define TaskTTY_STACK_SIZE DEFAULT_STACK_SIZE
#define TASK_SYS_SIZE DEFAULT_STACK_SIZE
#define TASK_HD_SIZE DEFAULT_STACK_SIZE
#define TASK_FS_SIZE DEFAULT_STACK_SIZE
//#define A_STACK_SIZE 128
//#define B_STACK_SIZE 128
//#define C_STACK_SIZE 128
//#define TaskTTY_STACK_SIZE 128
// 进程栈
#define STACK_SIZE (A_STACK_SIZE \
        + B_STACK_SIZE \
        + C_STACK_SIZE \
        + TaskTTY_STACK_SIZE \
        + TASK_SYS_SIZE \
        + TASK_HD_SIZE  \
        + TASK_FS_SIZE)
// 进程相关 end


#define OPEN 1001        // 打开硬盘
#define READ 1002        // 读硬盘
#define WRITE 1003       // 写硬盘
#define CLOSE 1004       //关闭硬盘
#define GET_HD_IOCTL 1005	// 获取文件系统所在分区的扇区数量


// 进程表的p_flag
#define FREE_SLOT 0	// 空闲进程表


#endif
