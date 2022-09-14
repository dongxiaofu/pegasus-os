#include "stdio.h"
#include "string.h"
#include "mem.h"
#include "mm.h"
#include "const.h"
#include "type.h"
#include "protect.h"
//#include "fs.h"
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

void kernel_main()
{
	init();

	disp_str("main start\n");
	thread_start(kernel_thread_a, "thread a\n");
	thread_start(kernel_thread_b, "thread b\n");
	thread_start(kernel_thread_c, "thread c\n");
	thread_start(kernel_thread_d, "thread d\n");
	disp_str("main end\n");

	asm volatile ("sti");
	while(1);
}

void init()
{
	dis_pos = 0;

	disp_str("init\n");
	init_keyboard();
	init_memory(32*1024*1024);

	// 初始化PCB链表
	pcb_list = initDoubleLinkList();
}

void kernel_thread_a(void *msg)
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

void kernel_thread_b(void *msg)
{
	disp_str(msg);
	while(1);
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
