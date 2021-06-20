#ifndef _PEGASUS_OS_GLOBAL_H
#define _PEGASUS_OS_GLOBAL_H


// 全局相关 start
int dis_pos;
unsigned int ticks;
unsigned int k_reenter;
unsigned int counter;

// 全局相关 end

// 进程相关 start
// 即将或正在执行的进程的进程表
Proc *proc_ready_table;
// 系统任何和用户进程的进程表都存储在这个数组中
Proc proc_table[TASK_PROC_NUM + USER_PROC_NUM];
// 用户进程元数据
Task user_task_table[USER_PROC_NUM] = {
        {TestA, A_STACK_SIZE},
        {TestB, B_STACK_SIZE},
        {TestC, C_STACK_SIZE}
};
// 系统任务元数据
Task sys_task_table[TASK_PROC_NUM] = {
        {TaskTTY, TaskTTY_STACK_SIZE},
        {TaskSys, TASK_SYS_SIZE},
        {TaskHD, TASK_HD_SIZE},
        {task_fs, TASK_FS_SIZE}
};

// 进程的堆栈
int proc_stack[STACK_SIZE];

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

// 进程相关 end

// 保护模式相关 start
Descriptor gdt[128];
unsigned char idt_ptr[6];
Gate idt[256];
unsigned char gdt_ptr[6];
TSS tss;

// 保护模式相关 end


#define HD_DEV_OPEN 1001	// 打开硬盘

#endif



