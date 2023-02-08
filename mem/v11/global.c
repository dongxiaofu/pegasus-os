#define  GLOBAL_VARIABLES_HERE


#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "double_link_list.h"
#include "mem.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "global.h"
#include "proto.h"


// 存储线程和进程的PCB
// DoubleLinkList pcb_list;

// 系统任何和用户进程的进程表都存储在这个数组中
Proc proc_table[TASK_PROC_NUM + USER_PROC_NUM + FORKED_USER_PROC_NUM];
// 用户进程元数据
Task user_task_table[USER_PROC_NUM] = {
//Task user_task_table[1] = {
//	{"INIT", INIT, TASK_INIT_SIZE},
        {"A", TestA, A_STACK_SIZE},
        {"B", TestB, B_STACK_SIZE},
//        {TestC, C_STACK_SIZE}
};
// 系统任务元数据
// Task sys_task_table[TASK_PROC_NUM] = {
Task sys_task_table[5] = {
        {"TTY", TaskTTY, TaskTTY_STACK_SIZE},
        {"SYS", TaskSys, TASK_SYS_SIZE},
        {"HD", TaskHD,  TASK_HD_SIZE},
        {"FS", task_fs, TASK_FS_SIZE},
        {"MM",TaskMM, TASK_MM_SIZE}
 };

// 进程的堆栈
int proc_stack[STACK_SIZE];

int_handle sys_call_table[SYS_CALL_FUNCTION_NUM] = {
        // warning: initialization of 'void (*)()' from incompatible pointer type 'int (*)()' [-Wincompatible-pointer-types]
        // sys_get_ticks
        (int_handle) sys_get_ticks,
        (int_handle) sys_write,
        (int_handle) sys_printx,
        (int_handle) sys_send_msg,
        (int_handle) sys_receive_msg,
        (int_handle) sys_malloc2,
        (int_handle) sys_free2
};

// 内存管理
// 内核的内存块描述符
// 2kb、4KB、8KB、16KB、32KB、64KB、128KB、256KB、512KB、1024KB
// mem_block_desc kernel_mem_block_decs_array[MEM_BLOCK_DESC_KIND_NUM];

// 进程相关 end

// 根目录的inode
// struct inode *root;
// 使用数据而非指针更好。不是更好，是必须。若使用指针，指向fsbuf，fsbuf的数据更换后，使用
// root不能获取到需要的数据。
// 'root' undeclared (first use in this function)
// struct inode root;
