#include "stdio.h"
#include "string.h"
#include "mem.h"
#include "mm.h"
#include "const.h"
#include "type.h"
#include "double_link_list.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"

VirtualMemoryAddress *create_user_process_address_space()
{
	VirtualMemoryAddress *space = (VirtualMemoryAddress *)alloc_memory(1, KERNEL);
	space->start_addr = 0x8048000;
	// space->map.bits = (char *)((unsigned int)space + 0x8048000);
	// space->map.bits = (char *)((unsigned int)space);
	// space->map.bits = (char *)alloc_memory(1, KERNEL);
	unsigned int length = 0xC0000000 - 0x8048000;		// 单位是字节
	unsigned int bitmap_bit_cnt = ROUND_UP(length, PAGE_SIZE);
	space->map.length = ROUND_UP(bitmap_bit_cnt, 8); 
	int bitmap_page_cnt = ROUND_UP(space->map.length, PAGE_SIZE);
	space->map.bits = (char *)alloc_memory(bitmap_page_cnt, KERNEL);
	// 初始化位图
	init_bitmap(&space->map);

	return space;
}

void user_process(Func func, void *arg)
{
	Proc *process = (Proc *)get_running_thread_pcb();
	process->stack = (unsigned int *)((unsigned int)process + PAGE_SIZE);
	process->stack -= sizeof(Regs);
	Regs *process_stack = (Regs *)process->stack;
	// 为进程第一次启动准备数据
	unsigned char rpl = 0;
	unsigned short eflags = 0x1202;
	unsigned short es = 0x48;
	unsigned short cs = 0x50;
	unsigned short ss = es;
	unsigned short ds = es;
	unsigned short fs = es;
	unsigned short gs = 0x38;
	process_stack->cs = cs;
	process_stack->ds = ds;
	process_stack->fs = ds;
	process_stack->es = ds;
	process_stack->ss = ds; // 000 1100
	process_stack->gs = gs;//GS_SELECTOR & (0xFFF9);
	process_stack->eip = func;
	process_stack->eflags = eflags;	
	// 第一次启动进程
	restart((unsigned int)process_stack);
}

void process_execute(Func func, char *thread_arg, char *process_name)
{
	Proc *process = thread_init();
	thread_create(process);
	Strcpy(process->name, process_name);

	// 建立进程的页表
	unsigned int page_dir_vaddr = alloc_memory(1, KERNEL);
	// Memcpy((void *)(page_dir_vaddr + 0x300 * 4), (void *)(0xC0000000 + 0x300 * 4), 1024); 
	// Memcpy((void *)(page_dir_vaddr + 0x300 * 4), (void *)(0xC0100000 + 0x300 * 4), 1024); 
	Memcpy((void *)(page_dir_vaddr + 0x300 * 4), (void *)(0xFFFFF000 + 0x300 * 4), 1024); 
	unsigned int page_dir_phy_addr = get_physical_address(page_dir_vaddr);
	unsigned int *ptr1 = (unsigned int *)(page_dir_vaddr + 1023*4);
	// *ptr1 = page_dir_phy_addr;
	*ptr1 = page_dir_phy_addr | PG_P_YES | PG_RW_RW | PG_US_SUPER;
	process->page_directory = page_dir_phy_addr;
	init_memory_block_desc(process->mem_block_desc_array);

	// 用户进程的虚拟地址空间
	// TODO 
	// 目前头文件很乱，在process.h中使用VirtualMemoryAddress很麻烦，所以使用unsigned int记录
	// 用户进程的虚拟地址空间。反正它是指针，使用时强制转换一下就行。
	process->user_virtual_memory_address = (unsigned int)create_user_process_address_space();

	ThreadStack *thread_stack = (ThreadStack *)process->stack;
	thread_stack->eip2 = user_process;
	thread_stack->func_name = func;
	thread_stack->func_arg = thread_arg;
	thread_stack->pcb_addr = (unsigned int)process;
	thread_stack->ebp = thread_stack->ebx = thread_stack->edi = thread_stack->esi = 0;
	// 加入链表，在调度模块中处理
	appendToDoubleLinkList(&pcb_list, (ListElement *)(&process->tag));	
	appendToDoubleLinkList(&all_pcb_list, (ListElement *)(&process->all_tag));	
}
