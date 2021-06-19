//#define DEBUG 1
#define DEBUG 0

#define DEFAULT_STR_SIZE 512
// 必须作为全局变量。如果作为局部变量，然后初始化，会覆盖其他数据。
// 目前的内存机制，就是这样。
// char inner_buf[DEFAULT_STR_SIZE];
// TaskTTY start
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
// 当前tty
//TTY *current_tty;

typedef struct{
	unsigned int original_addr;
	unsigned int vm_limit;
	unsigned int start_video_addr;
	unsigned int cursor;
}CONSOLE;

typedef struct{
	unsigned int *head;
	unsigned int *tail;
	//unsigned char buf[TTY_BUF_SIZE];
	unsigned int buf[TTY_BUF_SIZE];
	unsigned int counter;

	CONSOLE *console;
}TTY;

TTY *current_tty;
TTY tty_table[TTY_NUM];
CONSOLE console_table[TTY_NUM];

// 设置console的start_video_addr
void set_cursor(unsigned int cursor);
void set_console_start_video_addr(unsigned int start_video_addr);
void flush(TTY *tty);
void select_console(unsigned char tty_index);
void put_key(TTY *tty, unsigned char key);
void scroll_up(TTY *tty);
void scroll_down(TTY *tty);
void out_char(TTY *tty, unsigned char key);
//void out_char(CONSOLE *console, unsigned char key);
void tty_do_read(TTY *tty);
void tty_do_write(TTY *tty);
void init_screen(TTY *tty);
void init_tty();



// TaskTTY end

int dis_pos;
unsigned int ticks;
// 标识时钟中断是否重入
//unsigned char k_reenter;
//char k_reenter;
//short k_reenter;
unsigned int k_reenter;
//static unsigned int counter = 0;
unsigned int counter;
typedef void (*int_handle) ();
void disp_str(char *str);
// void disp_str_colour(char *str, int colour);
void disp_str_colour2(int str, int colour);
void disp_str_colour(char *str, int colour);

// 内部中断 start
void divide_zero_fault();
void single_step_fault();
void non_maskable_interrupt();
void breakpoint_trap();
void overflow_trap();
void bound_range_exceeded_fault();
void invalid_opcode_fault();
void coprocessor_not_available_fault();
void double_fault_exception_abort();
void coprocessor_segment_overrun();
void invalid_task_state_segment_fault();
void segment_not_present_fault();
void stack_exception_fault();
void general_protection_exception_fault();
void page_fault();
void coprocessor_error_fault();
void align_check_fault();
void simd_float_exception_fault();
// 内部中断 end


// 外部中断 start
void hwint0();
void hwint1();
// 外部中断 end

void atoi(char *str, int num);
void disp_int(int num);
void InterruptTest();
void exception_handler(int vec_no, int error_no, int eip, int cs, int eflags);
unsigned char gdt_ptr[6];
// void Memcpy(void *dst, void *src, int size);
// void Memset(void *dest, char character, int size);
//void InitInterruptDesc(int vec_no, int_handle offset); 
void InitInterruptDesc(int vec_no, int_handle offset, int privilege, int type);
// 初始化内部中断
void init_internal_interrupt();

void test();

void spurious_irq(int irq);
void init_propt();

const int INIT_MASTER_VEC_NO = 0x20;
const int INIT_SLAVE_VEC_NO = 0x28;



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


typedef struct{
	unsigned short seg_limit_below;
	unsigned short seg_base_below;
	unsigned char  seg_base_middle;
	unsigned char seg_attr1;
	unsigned char seg_limit_high_and_attr2;
	unsigned char seg_base_high;
	//char seg_base_high;
}Descriptor;

Descriptor gdt[128];

unsigned char idt_ptr[6];
//门描述符
typedef struct{
	unsigned short offset_below;
	unsigned short selector;
	unsigned char paramCount;
	unsigned char type_other_attribute;
	unsigned short offset_high;
}Gate;

Gate idt[256];

// tss
typedef struct{
	// 上一个任务的TSS指针
	unsigned int last_tss_ptr;
	unsigned int esp0;
	unsigned int ss0;
	unsigned int esp1;
	unsigned int ss1;
	unsigned int esp2;
	unsigned int ss2;
	unsigned int cr3;
	unsigned int eip;
	unsigned int eflags;
	unsigned int eax;
	unsigned int ecx;
	unsigned int edx;
	unsigned int ebx;
	unsigned int esp;
	unsigned int ebp;
	unsigned int esi;
	unsigned int edi;
	unsigned int es;
	unsigned int cs;
	unsigned int ss;
	unsigned int ds;
	unsigned int fs;
	unsigned int gs;
	unsigned int ldt;
	unsigned int trace;
	unsigned int iobase;
}TSS;

// 进程表 start
typedef struct{
	// 中断处理程序压栈，手工压栈
	//unsigned short gs;	
	//unsigned short fs;	
	//unsigned short es;	
	//unsigned short ds;
	
	unsigned int gs;	
	unsigned int fs;	
	unsigned int es;	
	unsigned int ds;	
	// pushad压栈，顺序固定	
	unsigned int edi;	
	unsigned int esi;	
	unsigned int ebp;	
	// 在这里消耗了很多时间。为啥需要在这里补上一个值？这是因为popad依次出栈的数据中有这么个值，
	// 如果不补上这一位，出栈时数据不能依次正确更新到寄存器中。
	unsigned int kernel_esp;	
	unsigned int ebx;	
	unsigned int edx;	
	unsigned int ecx;	
	unsigned int eax;
	// 中断发生时压栈
	unsigned int eip;
	unsigned int cs;
	//unsigned short cs;
	unsigned int eflags;
	//unsigned short ss;
	unsigned int esp;	// 漏掉了这个。iretd会出栈更新esp。
	unsigned int ss;
}Regs;

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

// todo 根据目前的需求，下面的成员都是必需的。
typedef struct{
	int source;		// 谁发送的消息
	int type;		// 这条消息要求接收者做什么。例如，获取时钟中断次数。
	int val;		// 消息中的数据。
}Message;

// 发送消息的进程队列的成员的数据类型
struct MsgSender
{
	//Proc *sender;
	unsigned int sender_pid;
	//struct MsgSender next;
	struct MsgSender *next;
};
//struct MsgSender
//{
//	//Proc *sender;
//	int sender_pid;
//	struct MsgSender *next;
//};
// 旧设计非常矛盾。必须在Proc前定义，却又要使用Proc，这要求Proc在本结构体前定义。
//struct MsgSender
//{
//	Proc *sender;
//	struct MsgSender *next;
//};

// ipc0 end

typedef struct{
	Regs s_reg;
	// ldt选择子
	unsigned short ldt_selector;
	// ldt
	Descriptor ldts[2];	
	unsigned int pid;
	// 进程剩余可用的时钟中断次数
	unsigned int ticks;
	// 进程优先级
	unsigned int priority;
	// 本进程使用哪个tty，tty_table的索引
	unsigned int tty_index;
	// 进程名称
	char name[20];

	// ipc start
	unsigned char p_flag;		// 进程的状态：RUNNING等
	Message *p_msg;	// 指向消息体
	int p_send_to;	// 要向哪个进程发送消息，目标进程ID
	int p_receive_from;	// 要从哪个进程接收消息，目标进程ID
	struct MsgSender *header;	// 要给本进程发送消息的进程的队列的头指针
	//struct MsgSender header;	// 要给本进程发送消息的进程的队列的头指针

	// ipc end
}Proc;

// 进程表 end

// 变量--进程
TSS tss;
// 用户进程的数量
#define USER_PROC_NUM 3
// 系统任务的数量
#define TASK_PROC_NUM 3
// 消息收发对象是任意进程时，目标进程的pid是这个值
#define ANY (USER_PROC_NUM + TASK_PROC_NUM + 10)
// 消息收发对象是无对象时，目标进程的pid是这个值
#define NO_TASK (USER_PROC_NUM + TASK_PROC_NUM + 25)
// 系统任何和用户进程的进程表都存储在这个数组中
Proc proc_table[TASK_PROC_NUM + USER_PROC_NUM];
// 即将或正在执行的进程的进程表
Proc *proc_ready_table;
typedef void (*Func)();

typedef struct{
	Func func_name;
	unsigned short stack_size;
}Task;

// 进程栈默认大小
// #define DEFAULT_STACK_SIZE 32768	// 这个值，导致无法加载内核
#define DEFAULT_STACK_SIZE 1024

// 进程A、B、C的堆栈大小
#define A_STACK_SIZE DEFAULT_STACK_SIZE
#define B_STACK_SIZE DEFAULT_STACK_SIZE
#define C_STACK_SIZE DEFAULT_STACK_SIZE
// 系统进程
#define TaskTTY_STACK_SIZE DEFAULT_STACK_SIZE
#define TASK_SYS_SIZE DEFAULT_STACK_SIZE
#define TASK_HD_SIZE DEFAULT_STACK_SIZE
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
	+ TASK_HD_SIZE)

// 初始化描述符
// void InitDescriptor(void *desc, unsigned int base, unsigned int limit, unsigned short attribute);
void InitDescriptor(Descriptor *desc, unsigned int base, unsigned int limit, unsigned short attribute);
// 根据段名求物理地址
unsigned int Seg2PhyAddr(unsigned int selector);
// 进程中的段
unsigned int Seg2PhyAddrLDT(unsigned int selector, Proc *proc);
// 根据虚拟地址求物理地址
// unsigned int VirAddr2PhyAddr(unsigned int base, unsigned int offset);
unsigned int VirAddr2PhyAddr(unsigned int base, void *offset);
// 内核的入口函数
void kernel_main();
// 进程A的进程体
void TestA();
void TestB();
void TestC();
// 终端--任务进程体，键盘
void TaskTTY();
// 系统任务进程
void TaskSys();
// 硬盘驱动
void TaskHD();
// 启动进程
void restart();
void delay(int time);
// 调度进程
// void schedule_process();
// 进程的堆栈
int proc_stack[STACK_SIZE];
// 用户进程元数据
Task user_task_table[USER_PROC_NUM] = {
	{TestA, A_STACK_SIZE},
	{TestB, B_STACK_SIZE},
	{TestC, C_STACK_SIZE},
};
// 系统任务元数据
Task sys_task_table[TASK_PROC_NUM] = {
	{TaskTTY, TaskTTY_STACK_SIZE},
	{TaskSys, TASK_SYS_SIZE},
	{TaskHD, TASK_HD_SIZE},
};

// 系统调用 start
#define SYS_CALL_FUNCTION_NUM 5
#define NR_GET_TICKS	0
#define _NR_WRITE	1
#define _NR_WRITE_DEBUG	2
#define _NR_SEND_MSG	3
#define _NR_RECEIVE_MSG	4

typedef void *system_call;
int sys_get_ticks();
void sys_write(char *buf, int len, Proc *proc);
// debug function start
void sys_printx(char *error_msg, int len, Proc *proc);
//void sys_printx(char *error_msg, Proc *proc);
//void sys_printx(char *error_msg, int caller_id);
// debug function end

// ipc start
// 死锁检测
int dead_lock(int src, int dest);
// send_msg 通过sys_call调用
int sys_send_msg(Message *msg, int receiver_pid, Proc *sender);
// receive_msg 通过sys_call调用
int sys_receive_msg(Message *msg, int sender_pid, Proc *receiver);

// 把整型数字转成指定进制的字符串
// void itoa(int value, char **str, int base);
char *itoa(int value, char **str, int base);

// ipc end

void sys_call();
//system_call sys_call_table[1] = {
int_handle sys_call_table[SYS_CALL_FUNCTION_NUM] = {
	// warning: initialization of 'void (*)()' from incompatible pointer type 'int (*)()' [-Wincompatible-pointer-types]
	// sys_get_ticks
	(int_handle) sys_get_ticks,
	(int_handle) sys_write,
	(int_handle) sys_printx,
	(int_handle) sys_send_msg,
	(int_handle) sys_receive_msg
};
// 从汇编中导入的函数
int get_ticks();
int get_ticks_ipc();
// 系统调用 end
// 延迟函数 start
void milli_delay(unsigned milli_sec);
// 延迟函数 end
// 进程调度 start
// 时钟中断处理函数
void clock_handler();
// 进程调度
void schedule_process();
// 进程调度 end


// 键盘 start
// 键盘中断例程的中间代码
// #define KEYBOARD_BUF_SIZE 10; // 不能有逗号
#define KEYBOARD_BUF_SIZE 800
// 中断例程的缓冲区结构体
typedef struct{
	unsigned char *head;
	unsigned char *tail;
	int counter;
	unsigned char buf[KEYBOARD_BUF_SIZE];
}KeyboardBuffer;
// 中断例程的缓冲区
KeyboardBuffer keyboard_buffer;
// 从端口读取一个字节，汇编函数
unsigned char in_byte(unsigned short port);
void out_byte(unsigned int port, unsigned short value);
void keyboard_handler();
// 从中断例程的缓冲区读取数据
void keyboard_read(TTY *tty);

void disable_int();
void enable_int();

// 从中断例程的缓冲区读取一个字符，供keyboard_read调用
unsigned char read_from_keyboard_buf();
// 扫描码是不是0xE0
unsigned char is_e0;
// 扫描码是不是左右shift
unsigned char is_shift;
// 是否打印字符
unsigned char is_disp;
// 初始化键盘中断例程
void init_keyboard_handler();
// shift_r、shift_l等特权常量，值是它们的Make Code
// 和keymap.h中的定义重复了，故在后面加了1
#define SHIFT_R1 0x36
#define SHIFT_L1 0x2A

// 打印扫描码等功能
void in_process(TTY *tty, unsigned int key);

// 键盘 end

// printf start
// char *Strcpy(char *dest, char *src);
// int Strlen(char *buf);

char* i2a(int val, int base, char ** ps);
// 只支持%x
void Printf(char *fmt, ...);

// 根据进程ID获取进程表的指针
Proc *pid2proc(int pid);
// 根据进程表的指针计算进程ID。
int proc2pid(Proc *proc);
// debug start
// panic的魔数
#define PANIC_MAGIC 58
// assert的魔数
#define ASSERT_MAGIC 59
int vsprintf(char *buf, char *fmt, char *var_list);
void write(char *buf, int len);
void printx(char *fmt, ...);
int write_debug(char *buf, int len);
// int vsprintf_debug(char *buf, char *fmt, char *var_list);
void spin(char *error_msg);
void panic(char *error_msg);
void assertion_failure(char *exp, char *filename, char *base_filename, unsigned int line);

// todo __BASE_FILE__ 正确性未知
//#define assert if(exp) ; 
#define assert(exp)  if(exp) ; \
	else assertion_failure(#exp, __FILE__, __BASE_FILE__, __LINE__)


// debug end
//int vsprintf(char *buf, char *fmt, char *var_list);
//void write(char *buf, int len);

// 根据进程ID获取进程表的指针
//Proc *pid2proc(int pid);
//// 根据进程表的指针计算进程ID。
//int proc2pid(Proc *proc);


// ipc start
// // send_msg 通过sys_call调用
// int sys_send_msg(Message *msg, int receiver_pid, Proc *sender);
// // receive_msg 通过sys_call调用
// int sys_receive_msg(Message *msg, int sender_pid, Proc *receiver);
// 系统调用
int send_msg(Message *msg, int receiver_pid);
// 系统调用
int receive_msg(Message *msg, int sender_pid);
// send_rec封装send_msg和receive_msg，直接被外部使用
// function：选择发送还是接收还是其他;pid，sender或receiver的进程id
int send_rec(int function, Message *msg, int pid);
// 阻塞进程
int block(Proc *proc);
// 解决阻塞
int unblock(Proc *proc);
// 为什么用宏？以后可能会不使用Memcpy
#define phycopy Memcpy
