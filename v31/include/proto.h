#ifndef _PEGASUS_OS_PROTO_H
#define _PEGASUS_OS_PROTO_H

int dis_pos;
unsigned int ticks;
unsigned int k_reenter;
unsigned int counter;
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


// 外部中断 start
void hwint0();
void hwint1();
void hwint14();
// 外部中断 end


void InterruptTest();
void exception_handler(int vec_no, int error_no, int eip, int cs, int eflags);

void test();

void spurious_irq(int irq);


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
// 文件系统
void task_fs();
// 启动进程
void restart();
void delay(int time);




// ipc start
// 死锁检测
int dead_lock(int src, int dest);
// send_msg 通过sys_call调用
int sys_send_msg(Message *msg, int receiver_pid, Proc *sender);
// receive_msg 通过sys_call调用
int sys_receive_msg(Message *msg, int sender_pid, Proc *receiver);
// ipc end


// 从汇编中导入的函数
void disable_int();
void enable_int();
int get_ticks();
int get_ticks_ipc();
// 系统调用 end
// 延迟函数 start
void milli_delay(unsigned milli_sec);
// 延迟函数 end

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

#endif
