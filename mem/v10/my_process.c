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
	unsigned short es;	// = 0x49;
	// unsigned short cs = 0x50;
	unsigned short cs; 	// = 0x51;
	// 1特权级描述符
	unsigned int es_attribute = 0xcb2;
	unsigned int cs_attribute = 0xcba;
	unsigned int limit = 0xffffffff;
	es = 0x48;
	cs = 0x50;
	// es
//	gdt_index = 9;
//	es = gdt_index * 8 + 1;
//	InitDescriptor(&gdt[gdt_index], 0, limit, es_attribute);
//	gdt_index++;
//	// cs
//	gdt_index = 10;
//	cs = gdt_index * 8 + 1;
//  	InitDescriptor(&gdt[gdt_index], 0, limit, cs_attribute);
//	gdt_index++;

	Proc *process = (Proc *)get_running_thread_pcb();
	process->stack = (unsigned int *)((unsigned int)process + PAGE_SIZE);
	// 费了很大劲才找出的错误。
	// process->stack -= sizeof(Regs);
	process->stack = (unsigned int *)(((unsigned int)process->stack) - sizeof(Regs));
	Regs *process_stack = (Regs *)process->stack;
	// 为进程第一次启动准备数据
	unsigned char rpl = 0;
	unsigned short eflags = 0x1202;
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
	// process_stack->esp = (0xC0000000 - 0x1000);
	process_stack->esp = alloc_physical_memory(0xC0000000 - 0x1000, USER) + PAGE_SIZE;
//	process_stack->esp = alloc_physical_memory(0xC0000000 - 0x2000, USER) + PAGE_SIZE;
	// 第一次启动进程
	restart((unsigned int)process_stack);
}

Proc *clone_pcb(Proc *parent_process)
{
	Proc *process = alloc_memory(1, KERNEL);
	Memset(process, 0, PAGE_SIZE);
	// Memcpy(process, parent_process, sizeof(Proc));
	Memcpy(process, parent_process, PAGE_SIZE);

	process->pid = ++pid;
	process->parent_pid = parent_process->parent_pid;
//	unsigned int stack_offset = (unsigned int)(parent_process + PAGE_SIZE) - (unsigned int)parent_process->stack;
//	process->stack = (unsigned int)(process + PAGE_SIZE) - stack_offset;

	// 子进程必须有独立的页表和虚拟地址空间
	// 建立进程的页表
	unsigned int page_dir_vaddr = alloc_memory(1, KERNEL);
	Memcpy((void *)(page_dir_vaddr + 0x300 * 4), (void *)(0xFFFFF000 + 0x300 * 4), 1024); 
	unsigned int page_dir_phy_addr = get_physical_address(page_dir_vaddr);
	unsigned int *ptr1 = (unsigned int *)(page_dir_vaddr + 1023*4);
	*ptr1 = page_dir_phy_addr | PG_P_YES | PG_RW_RW | PG_US_SUPER;
	process->page_directory = page_dir_phy_addr;

	// 用户进程的虚拟地址空间
	process->user_virtual_memory_address = (unsigned int)create_user_process_address_space();
	Memcpy(process->user_virtual_memory_address,parent_process->user_virtual_memory_address,	\
		sizeof(VirtualMemoryAddress)); 

// 我担心克隆子进程的所有流程还没有完成就调度到子进程了。
//	// 加入链表，在调度模块中处理
//	if(process->p_flag == RUNNING){
//		Memset(&process->tag, 0, sizeof(process->tag));
//		appendToDoubleLinkList(&pcb_list, (ListElement *)(&process->tag));	
//	}
//
//	Memset(&process->all_tag, 0, sizeof(process->all_tag));
//	appendToDoubleLinkList(&all_pcb_list, (ListElement *)(&process->all_tag));	

	return process;
}

void build_body_stack(Proc *parent_process, Proc *child_process, unsigned int buf)
{
	VirtualMemoryAddress *virtualMemory = (VirtualMemoryAddress *)parent_process->user_virtual_memory_address;
	Bitmap bitmap = virtualMemory->map;	
	char *bits = bitmap.bits;
	unsigned int map_length = bitmap.length;
	unsigned int vaddr_start = virtualMemory->start_addr;

	// int bit_idx = 15;
	int bit_idx = 0;
	int k = 0;
//	disable_int();
	enum intr_status old_status = intr_disable();
	for(int i = 0; i < map_length; i++){
		char one_byte = bits[i];
		for(int j = 0; j < 8; j++){
		// for(int j = 0; j < 7; j++){
			// 把if写成这样，是因为我不喜欢在一个花括号中写一大段代码。
			// if(one_byte & (1 << j) == 0)	{ bit_idx++ ; continue; }
			if((one_byte & (1 << j)) == 0)
			{ 
				bit_idx++ ;
				 continue;
			}
	//		bit_idx++;
	//		continue;
			// 把页表更换为父进程的页表
			update_cr3(parent_process->page_directory);
			// 当前位是1，它对应的虚拟地址被使用，这个虚拟地址对应的物理空间存储了数据。
			unsigned int vaddr = vaddr_start + bit_idx * PAGE_SIZE; 
			// unsigned int vaddr = vaddr_start + bit_idx * PAGE_SIZE - 1; 
			// 把起点是vaddr的页框中的数据复制到内核的buf中。
			Memcpy(buf, vaddr, PAGE_SIZE);
			
			// 把页表更换为子进程的页表
			update_cr3(child_process->page_directory);
			// 在子进程的页表中建立vaddr和一个物理地址之间的映射关系。
			get_a_virtual_page(USER, vaddr);
			// 把buf中的数据复制到子进程中起点是vaddr的页框中。
			Memcpy(vaddr, buf,  PAGE_SIZE);
			// 把页表更换为父进程的页表
			// update_cr3(parent_process->page_directory);
			bit_idx++;
			k++;
		}
	}	

	intr_set_status(old_status);
}

// 不理解这个函数中的代码。
void build_process_kernel_stack(Proc *process)
{
	enum intr_status old_status = intr_disable();
	unsigned int *stack = (unsigned int *)((unsigned int)process + PAGE_SIZE);
	while(1){
		if(*stack == 0x38){
			break;
		}

		stack--;
	}

	// 设置tss.esp0
	process->tss_esp0 = stack;

//	unsigned int *stack = (unsigned int *)(process + PAGE_SIZE - sizeof(Regs));
//	unsigned int *stack = (unsigned int *)((unsigned int)process + PAGE_SIZE - sizeof(Regs));
//	stack = (unsigned int *)((unsigned int)process + PAGE_SIZE - sizeof(Regs));
	unsigned int *eax_in_process_stack = stack + 11;
	
	// 这种corner case，我不喜欢处理。
	unsigned int *eip_in_thread_stack = stack - 1;
	unsigned int *esi_in_thread_stack = stack - 2;
	unsigned int *edi_in_thread_stack = stack - 3;
	unsigned int *ebx_in_thread_stack = stack - 4;
	unsigned int *ebp_in_thread_stack = stack - 5;

	*eip_in_thread_stack = fork_restart;

	*esi_in_thread_stack = *edi_in_thread_stack = \
	*ebx_in_thread_stack = *ebp_in_thread_stack = 0;

	*eax_in_process_stack = 0;

	//process->stack = stack;
	process->stack = ebp_in_thread_stack;

	intr_set_status(old_status);
}

Proc *fork_process(unsigned int parent_pid)
{
	Proc *parent_process = pid2proc(parent_pid);
	Proc *child_process = clone_pcb(parent_process);
	unsigned int buf = alloc_memory(1, KERNEL);
	build_body_stack(parent_process, child_process, buf);
	build_process_kernel_stack(child_process);

	// 加入链表，在调度模块中处理
//	if(child_process->p_flag == RUNNING){
		Memset(&child_process->tag, 0, sizeof(child_process->tag));
//		appendToDoubleLinkList(&pcb_list, (ListElement *)(&child_process->tag));	
//	}

	Memset(&child_process->all_tag, 0, sizeof(child_process->all_tag));
	appendToDoubleLinkList(&all_pcb_list, (ListElement *)(&child_process->all_tag));	

	// 在函数返回前，这个新创建的进程会被调度到吗？
	return child_process;
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
	if(isListEmpty(&pcb_list) == 1){
//		Proc *kernel_thread = (Proc *)0xc009f000;
//		appendToDoubleLinkList(&pcb_list, (ListElement *)(&kernel_thread->tag));	
//		appendToDoubleLinkList(&all_pcb_list, (ListElement *)(&kernel_thread->all_tag));	
	}
	enum intr_status old_status = intr_disable();
	// 加入链表，在调度模块中处理
	appendToDoubleLinkList(&pcb_list, (ListElement *)(&process->tag));	
	appendToDoubleLinkList(&all_pcb_list, (ListElement *)(&process->all_tag));	
	intr_set_status(old_status);
}
