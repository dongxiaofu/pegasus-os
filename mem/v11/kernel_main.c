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

unsigned int fork_pid;
DoubleLinkList pcb_list;
DoubleLinkList all_pcb_list;
unsigned int MAIN_THREAD_PAGE_DIRECTORY;

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

//	disable_int();
	int init_ticks = TICKS_NUM;
	
	main_thread = get_running_thread_pcb();
	main_thread->ticks = main_thread->init_ticks = init_ticks + 2;
	main_thread->page_directory = MAIN_THREAD_PAGE_DIRECTORY;
	Strcpy(main_thread->name, "main_thread");
	proc_ready_table = main_thread;

	appendToDoubleLinkList(&pcb_list, (ListElement *)(&main_thread->tag));
	// appendToDoubleLinkList(&pcb_list, (ListElement *)(&main_thread->all_tag));
	appendToDoubleLinkList(&all_pcb_list, (ListElement *)(&main_thread->all_tag));

	process_execute(TaskMM, "task_mm\n", "TaskMM", 0, init_ticks);
	process_execute(task_fs, "task_fs\n", "task_fs", 0, init_ticks);
	process_execute(TaskHD, "task_hd\n", "TaskHD", 0, init_ticks);
	process_execute(TaskTTY, "task_tty\n", "TaskTTY", 0, init_ticks);
	process_execute(task_network, "task_network\n", "task_network", 0, init_ticks);
	process_execute(task_netdev_rx, "task_netdev_rx\n", "task_netdev_rx", 0, init_ticks);
	process_execute(user_proc_a, "user_proc_a\n", "process_a", 1, init_ticks - 2);
	process_execute(user_proc_b, "user_proc_b\n", "process_b", 1, init_ticks - 3);

//	enable_int();
//	thread_start(kernel_thread_a, "thread a\n");
//	thread_start(kernel_thread_b, "thread b\n");
//	thread_start(kernel_thread_c, "thread c\n");
//	thread_start(kernel_thread_d, "thread d\n");
//	process_execute(user_proc_b, "user_proc_b\n");
	disp_str("main end\n");

	asm volatile ("sti");
	while(1){
		stop_here();
	}
}

void init()
{
//	DoubleLinkList pcb_list;
//	DoubleLinkList all_pcb_list;
	
	char *stackaddr = "10.0.1.4";   /* 本协议栈模拟的ip地址 */

	MAIN_THREAD_PAGE_DIRECTORY = 0x400000;
	k_reenter = 99;
	dis_pos = 0;
	pid = 0;
	fork_pid = 100;
	gdt_index = 9;
	proc_ready_table = 0x0;

	// 网卡驱动用到这个数据。
	nic_current_page = 0x40;

	asm ("xchgw %bx, %bx");
//	disp_str("init\n");
	init_keyboard();
	//init_memory(64*1024*1024);
	init_memory(64*1024*1024);
//	DriverInitialize();
//	//asm ("xchgw %bx, %bx");
//	DriverSend();
//	//asm ("xchgw %bx, %bx");
//	disp_str("DriverInitialize\n");

	// 初始化PCB链表
	initDoubleLinkList(&pcb_list);
	initDoubleLinkList(&all_pcb_list);

	// 用下面的代码清屏，不晓得为啥没效果。已经在boot.asm用汇编代码清屏了。
	// 清屏
//	dis_pos = 0;
//	for(int i = 0; i < 80*25*4; i++){
//		disp_str("");
//	}
//
//	dis_pos = 0;
}

void kernel_thread_a(void *msg)
{
	disp_str(msg);
	int b = dis_pos;
	int a = 0;
	while(1){
		dis_pos = b;
		disp_str("still a:");
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
	disp_str("-------------I am user_proc_a\n");
	net_data = 0;
	unsigned int size = 22;
	net_buf = (char *)sys_malloc(size);
	Memset(net_buf, 0, size);

	// char *str = "Next, what’s wealthy to you may not be wealthy to your children";
	char *str = "Next, what’s wealthy";
	Strcpy(net_buf, str);

//	hello = (char *)sys_malloc(12);
	// Memset(helloStr, 0, 12);
//	Printf("net_buf = %s\n", net_buf);

	//enable_8259A_slave_net_irq();
//
	net_data = 4;
///	DriverInitialize();
/////	//asm ("xchgw %bx, %bx");
/////	while(1){
///	for(int i = 0; i < 1; i++){
/// 		DriverSend(net_buf, size);
///	}
	//asm ("xchgw %bx, %bx");
//	disp_str(net_buf);
//	disp_str(helloStr);
//	disp_str("\n");
//	disp_str("DriverInitialize2\n");
//	disp_str("DriverInitialize1\n");
//	// disp_str(helloStr);
//	disp_str("\nDriverInitialize3\n");
	while(1);

//	TestFS2();
//	wait_exit();
	test_exec();
//	test_shell();
//	INIT_fork();
//	TestTTY();
//	TestFS();
	while(1);
}

 void user_proc_b()
 {
 	disp_str("\n-------------I am user_proc_b\n");
 	while(1);
 }
