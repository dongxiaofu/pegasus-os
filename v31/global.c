#define  GLOBAL_VARIABLES_HERE


#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"



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