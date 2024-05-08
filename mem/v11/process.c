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
#include "string.h"

// 进程调度次数
void schedule_process()
{

//	test_ticks++;
//    current_dis_pos = dis_pos;
//    dis_pos = 0;
//    disp_str("[");
//    disp_int(test_ticks);
//    disp_str("]");
//    dis_pos = current_dis_pos;	
//
	int k = 2;
//	if(test_ticks == 33){
//		k = 4;
//	}

	int page_directory = 0x400000;
    Proc *next, *cur;


//	Proc *first = (Proc *)((unsigned int)(pcb_list.next) & 0xFFFFF000);
//	disp_str(first->name);
//	disp_str("#");
//	if(strcmp(first->name, "TaskHD") == 0){
//		k = 9;
//	}

	// 脏数据太多，怎么办？
	cur = (Proc *)get_running_thread_pcb();
	assert(cur->stack_magic == STACK_MAGIC);
	dis_pos = 150;
	disp_str(cur->name);
	disp_str("$$$");

	if(cur->p_flag == RUNNING){
		cur->ticks = cur->init_ticks;
		cur->p_flag = HANGING;
//		if(findElementInList(&pcb_list, cur) == 0){
//			insertToDoubleLinkList(&pcb_list, &cur->tag);
//	if(strcmp(first->name, "main_thread") == 0){
//		k = 9;
//	}
//		}
			if(&cur->tag == 0xc03ff218 || &cur->tag == 0xc03ff220){
				k = 12;
			}
			// insertToDoubleLinkList(&pcb_list, &cur->tag);
			appendToDoubleLinkList(&pcb_list, &cur->tag);
			
			if(isListEmpty(&pcb_list)){
				k = 9;
			}
	}else{

	}
	
	if(isListEmpty(&pcb_list)){
		k = 5;
	}

	assert(isListEmpty(&pcb_list) == 0);
	unsigned int element = (unsigned int)popFromDoubleLinkList(&pcb_list);
	//next = (Proc *)(element - offsetof(Proc,tag));
	next = (Proc *)(element & 0xFFFFF000);
	next->p_flag = RUNNING;
//	disp_str(next->name);
//	disp_str("#");
	Proc *next_process = NULL;
	unsigned int next_page_directory = 0;
	unsigned int next_tss = 0;
	assert(next->process_or_thread == PROCESS || next->process_or_thread == THREAD);
	if(next->process_or_thread == PROCESS){
		next_process = next;
		next_page_directory = next->page_directory;
		next_tss = (unsigned int)next + PAGE_SIZE;
	}else{
		Proc *proc = pid2proc(next->pid);
		next_process = proc;
		next_page_directory = proc->page_directory;
		next_tss = (unsigned int)proc + PAGE_SIZE;
	} 

	if(next->page_directory != page_directory){
		update_tss(next_tss);
		update_cr3(next_page_directory);
	}else{
		update_cr3(page_directory);
	}

	// proc_ready_table = next_process;	
	proc_ready_table = next;	

	switch_to(cur, next);
}

void clock_handler()
{
	ticks++;

	Proc *cur = get_running_thread_pcb();
//	assert(cur->stack_magic == STACK_MAGIC);
	if(key_pressed){
		inform_int(TASK_TTY, KEYBOARD_INT);
	}

	// 线程切换时被k_reenter阻止调度。
	// 我不清楚这样做会怎样。
	// 一时半会儿想不明白，先这样吧。
	if(cur->process_or_thread == THREAD)	goto start;

	// 第一次时钟中断时，处理k_reenter
	if(k_reenter == 100){
		k_reenter = 1;
	}else{
		// 非第一次时钟中断
		if(k_reenter != 1)	return;
	}

start:
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
