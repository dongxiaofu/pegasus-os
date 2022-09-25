#include "stdio.h"
#include "string.h"
#include "mem.h"
#include "mm.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "double_link_list.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"

void init();

void kernel_thread_a(void *msg);
void kernel_thread_b(void *msg);
void kernel_thread_c(void *msg);
void kernel_thread_d(void *msg);

void user_proc_a();
void user_proc_b();

void kernel_main()
{
	init();

	process_execute(user_proc_a, "user_proc_a\n", "process_a");
	process_execute(TaskTTY, "task_tty\n", "TaskTTY");
//	process_execute(TaskSys, "task_sys\n", "TaskSys");
	process_execute(TaskHD, "task_hd\n", "TaskHD");
	process_execute(task_fs, "task_fs\n", "task_fs");
//	process_execute(TaskMM, "task_mm\n", "TaskMM");
//	thread_start(kernel_thread_a, "thread a\n");
//	thread_start(kernel_thread_b, "thread b\n");
//	thread_start(kernel_thread_c, "thread c\n");
//	thread_start(kernel_thread_d, "thread d\n");
//	process_execute(user_proc_b, "user_proc_b\n");
	disp_str("main end\n");

	asm volatile ("sti");
	while(1);
}

void init()
{
	dis_pos = 0;
	pid = 0;

	disp_str("init\n");
	init_keyboard();
	init_memory(32*1024*1024);

	// 初始化PCB链表
	initDoubleLinkList(&pcb_list);
	initDoubleLinkList(&all_pcb_list);
}

void kernel_thread_a(void *msg)
{
	disp_str(msg);
	int b = dis_pos;
	int a = 0;
	while(1){
		dis_pos = b;
		disp_str("still a:");
		disp_int(a++);
		disp_str("\n");
	}
}

void kernel_thread_b(void *msg)
{
	disp_str(msg);
	int b = dis_pos;
	int a = 0;
	while(1){
		dis_pos = b;
		disp_str("still b:");
		disp_int(a++);
		disp_str("\n");
	}
}

void kernel_thread_c(void *msg)
{
	disp_str(msg);
	while(1);
}

void kernel_thread_d(void *msg)
{
	disp_str(msg);
	while(1);
}

void user_proc_a()
{
	disp_str("I am user_proc_a\n");
	INIT_fork();
//	TestTTY();
	// TestFS();
	while(1);
}

void user_proc_b()
{
	disp_str("I am user_proc_b\n");
	while(1);
}
