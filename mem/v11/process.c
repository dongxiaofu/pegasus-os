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
#include "proto.h"
#include "global.h"

// 进程调度次数
void schedule_process()
{
	int page_directory = 0x400000;
    Proc *next, *cur;

	// 脏数据太多，怎么办？
	cur = (Proc *)get_running_thread_pcb();
	if(cur->p_flag == RUNNING){
		cur->ticks = cur->init_ticks;
		cur->p_flag = HANGING;
		insertToDoubleLinkList(&pcb_list, &cur->tag);
	}else{

	}

	assert(isListEmpty(&pcb_list) == 0);
	unsigned int element = (unsigned int)popFromDoubleLinkList(&pcb_list);
	next = (Proc *)(element & 0xFFFFF000);
	next->p_flag = RUNNING;

	if(next->page_directory != page_directory){
		update_tss((unsigned int)next + PAGE_SIZE);
		update_cr3((unsigned int)next->page_directory);
	}else{
		update_cr3(page_directory);
	}

	proc_ready_table = next;	

	switch_to(cur, next);
}

void clock_handler()
{
	Proc *cur = get_running_thread_pcb();
//	assert(cur->stack_magic == STACK_MAGIC);
	if(key_pressed){
		inform_int(TASK_TTY);
	}

	// 第一次时钟中断时，处理k_reenter
	if(k_reenter == 100){
		k_reenter = 1;
	}else{
		// 非第一次时钟中断
		if(k_reenter != 1)	return;
	}

    // 调度进程
	if(cur->ticks > 0){
		proc_ready_table->ticks--;
	}else{
    	schedule_process();
	}
}

Proc *pid2proc(int pid)
{
	int t = 0;
	Proc *proc = 0x0;
	ListElement head = all_pcb_list.head;
	ListElement tail = all_pcb_list.tail;
	// ListElement *cur = head.next;
	ListElement *cur = all_pcb_list.head.next;
	while(cur != &all_pcb_list.tail){
		proc = (Proc *)((unsigned int)cur & 0xFFFFF000);
		if(proc == 0x0){
			t = 4;
		}
		// assert(proc != 0x0);
		if(proc->pid == pid){
			return proc;
		}
		cur = cur->next;
	}

	return 0x0;
}

int proc2pid(Proc *proc)
{
	unsigned int pid = proc->pid;
	return pid;
}
