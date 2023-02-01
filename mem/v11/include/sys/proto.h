#ifndef _PEGASUS_OS_PROTO_H
#define _PEGASUS_OS_PROTO_H

enum intr_status {       // 中断状态
	INTR_OFF,
	INTR_ON
};

#define EFLAGS_IF   0x00000200       // eflags寄存器中的if位为1
#define GET_EFLAGS(EFLAG_VAR) asm volatile("pushfl; popl %0" : "=g" (EFLAG_VAR))

enum intr_status intr_enable();
enum intr_status intr_disable(); 
enum intr_status intr_set_status(enum intr_status status);
enum intr_status intr_get_status();

// void Memcpy(unsigned int *dst, unsigned int *src, unsigned int size);
void disp_str(char *str);
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




// 从汇编中导入的函数
void disable_int();
void enable_int();


void InterruptTest();
void do_page_fault();
void exception_handler(unsigned int vec_no, unsigned int error_no, unsigned int eip, int cs, int eflags);
void test();

void spurious_irq(int irq);


void fork_restart();
// 启动进程
void restart(unsigned int esp);
void delay(int time);


int sys_get_ticks();
void sys_call();
void sys_call_test();

// 根据段名求物理地址
unsigned int Seg2PhyAddr(unsigned int selector);
// 进程中的段
unsigned int Seg2PhyAddrLDT(unsigned int selector, Proc *proc);
// 根据虚拟地址求物理地址
// unsigned int VirAddr2PhyAddr(unsigned int base, unsigned int offset);
unsigned int VirAddr2PhyAddr(unsigned int base, void *offset);
// process start
// 根据进程ID获取进程表的指针
Proc *pid2proc(int pid);
// 根据进程表的指针计算进程ID。
int proc2pid(Proc *proc);
// 计算线性地址
unsigned int v2l(int pid, void *offset);
// process end

// console.c  start
void select_console(unsigned char tty_index);
void put_key(TTY *tty, unsigned char key);
void scroll_up(TTY *tty);
void scroll_down(TTY *tty);

void out_char(TTY *tty, unsigned char key);
void sys_write(char *buf, int len, Proc *proc);
void sys_printx(char *error_msg, int len, Proc *proc);
// console.c end

// protect.c start
void InitInterruptDesc(int vec_no, int_handle offset, int privilege, int type);
// 初始化内部中断
void init_internal_interrupt();
// 初始化描述符
// void InitDescriptor(void *desc, unsigned int base, unsigned int limit, unsigned short attribute);
void InitDescriptor(Descriptor *desc, unsigned int base, unsigned int limit, unsigned short attribute);
void init_propt();
// protect.c end


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

// ipc start
// 死锁检测
int dead_lock(int src, int dest);
// send_msg 通过sys_call调用
int sys_send_msg(Message *msg, int receiver_pid, Proc *sender);
// receive_msg 通过sys_call调用
int sys_receive_msg(Message *msg, int sender_pid, Proc *receiver);
// ipc end


// keyboard.c start
// 从端口读取一个字节，汇编函数
unsigned char in_byte(unsigned short port);
void out_byte(unsigned int port, unsigned short value);
void keyboard_handler();
// 从中断例程的缓冲区读取数据
void keyboard_read(TTY *tty);

// 从中断例程的缓冲区读取一个字符，供keyboard_read调用
unsigned char read_from_keyboard_buf();
// 初始化键盘中断例程
void init_keyboard_handler();


// 打印扫描码等功能
void in_process(TTY *tty, unsigned int key);
// keyboard.c end

// hd.c start
// 打开8258A的从片级联
void enable_8259A_casecade_irq();
// 打开8259A的从片硬盘中断
void enable_8259A_slave_winchester_irq();

void inform_int(int task_nr);

// 硬盘驱动
void hd_handle(Message *msg);
void hd_handler();
// hd.c end

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
// 文件系统
extern void task_fs();
// 内存管理
void TaskMM();
// INIT进程
void INIT();
// 测试内存管理
void TestFork();

void ReloadGDT();

void init_keyboard();
void init();

/****************************************thread start***************************************/
void kernel_thread(thread_function func, void *arg);
Proc *thread_init();
void thread_create(Proc *proc);
void thread_start(thread_function func, char *thread_arg, char *thread_name);

// 进程
VirtualMemoryAddress *create_user_process_address_space();
void user_process(Func func, void *arg, unsigned int privilege);
Proc *clone_pcb(Proc *parent_process);
void build_body_stack(Proc *parent_process, Proc *child_process, unsigned int buf);
void build_process_kernel_stack(Proc *process);
Proc *fork_process(unsigned int parent_pid);
void process_execute(Func func, char *thread_arg, char *process_name, unsigned int privilege);

/****************************************thread end*****************************************/

// 内核的入口函数
void kernel_main();

// 外部中断 start
void hwint0();
void hwint1();
void hwint14();
// 外部中断 end

void update_cr3(unsigned int page_dir_table_phy_addr);
void update_tss(unsigned int esp);
unsigned int get_running_thread_pcb();

// 测试数据
void TestTTY();
#endif
