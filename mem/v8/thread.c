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

void kernel_thread(thread_function func, void *arg)
{
	asm volatile ("sti");
	func(arg);
}

Proc *thread_init()
{
	Proc *proc = (Proc *)alloc_memory(1, KERNEL);
	// Memset(proc, 0, sizeof(*proc));
	Memset(proc, 0, PAGE_SIZE);
	proc->stack = (unsigned int *)((unsigned int)proc + PAGE_SIZE);
	proc->page_directory = 0x0;
	proc->pid = ++pid;

	return proc;
}

void thread_create(Proc *proc)
{
//	Proc *proc = (Proc *)alloc_memory(1, KERNEL);
//	Memset(proc, 0, sizeof(*proc));
//	proc->stack = (unsigned int *)((unsigned int)proc + PAGE_SIZE);
//	proc->page_directory = 0x0;

	unsigned int proc_stack_size = sizeof(Regs);	
	unsigned int thread_stack_size = sizeof(ThreadStack);	
	proc->stack = (unsigned int *)((unsigned int)(proc->stack) - proc_stack_size);
	proc->stack = (unsigned int *)((unsigned int)(proc->stack) - thread_stack_size);
}

void thread_start(thread_function func, char *thread_arg, char *thread_name)
{
	Proc *thread = thread_init();
 	thread_create(thread);
	Strcpy(thread->name, thread_name);

	ThreadStack *thread_stack = (ThreadStack *)thread->stack;
	thread_stack->eip2 = kernel_thread;
	thread_stack->func_name = func;
	thread_stack->func_arg = thread_arg;
	thread_stack->ebp = thread_stack->ebx = thread_stack->edi = thread_stack->esi = 0;
	// 加入链表，在调度模块中处理
	appendToDoubleLinkList(&pcb_list, (ListElement *)(&thread->tag));	
	appendToDoubleLinkList(&all_pcb_list, (ListElement *)(&thread->all_tag));	
}
