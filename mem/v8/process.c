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

void check();

void check()
{

    Proc *p;
    for (p = proc_table; p < proc_table + TASK_PROC_NUM; p++)
    {
        // if (p->p_flag != RUNNING  && p->p_flag != SENDING && p->p_flag != RECEIVING) {
        if (p->has_int_msg != 0 && p->has_int_msg != 1)
        {
            dis_pos = 10 * 1024 + 2;
            disp_str_colour("error", 0xA);
            disp_int(p->p_flag);
            while (1)
            {
            }
        }
    }
}

// 进程调度次数
void schedule_process()
{
    Proc *next, *cur;
	
	// 脏数据太多，怎么办？
	cur = (Proc *)get_running_thread_pcb();

	if(isListEmpty(&pcb_list) == 1){
//		disp_str("switch_to?No\n");
		next = cur;
//		disp_str("switch_to?No2\n");
	}else{
//		disp_str("switch_to?Yes\n");
		// unsigned int element = (unsigned int)popFromDoubleLinkList(&pcb_list);
		unsigned int element = (unsigned int)popFromDoubleLinkList(&pcb_list);
		Proc *tmp = (Proc *)(element & 0xFFFFF000);
		if(tmp != 0x0){
			next = tmp;
			next->p_flag = RUNNING;
			if(strcmp(next->name, "task_fs") == 0){
		//		disp_str("next:");
		//		disp_int(6);
		//		disp_str(next->name);
		//	//	disp_int((unsigned int)next);
		//		disp_str("\n");
			}
//			disp_int((unsigned int)next);
//			disp_str("\n");
		}
//		disp_str("switch_to?Yes2\n");
	}

	if(cur->p_flag == RUNNING){
		insertToDoubleLinkList(&pcb_list, &cur->tag);
//		disp_str("insertToDoubleLinkList:");
//		disp_int((unsigned int)cur);
//		disp_str("\n");
//		disp_str(cur->name);
//		disp_str("\n");
	}

//	disp_str("switch_to?No3\n");
	// 进程，切换页目录表。
	int page_directory = 0x100000;
	if(next->page_directory != 0x0){
//		disp_str("update_tss\n");
		update_tss((unsigned int)next + PAGE_SIZE);
//		disp_str("update_cr3\n");
		update_cr3((unsigned int)next->page_directory);
//		disp_str("update_cr3 end\n");
	}else{
//		disp_str("switch_to?No4\n");
		//asm volatile ("movl %0, %%cr3" : : "r" (page_directory) : "memory");
		update_cr3(page_directory);
//		disp_str("switch_to?No5\n");
	}

	proc_ready_table = next;	


//	disp_str("switch_to\n");
	switch_to(cur, next);
//	disp_str("switch_to 2\n");
}

void clock_handler()
{
	if(key_pressed){
		inform_int(TASK_TTY);
	}
    // 调度进程
    schedule_process();
}

Proc *pid2proc(int pid)
{
	Proc *proc = 0x0;
	ListElement head = all_pcb_list.head;
	ListElement tail = all_pcb_list.tail;
	// ListElement *cur = head.next;
	ListElement *cur = all_pcb_list.head.next;
	while(cur != &all_pcb_list.tail){
		proc = (Proc *)((unsigned int)cur & 0xFFFFF000);
		if(proc->pid == pid){
			return proc;
		}
		cur = cur->next;
	}

	return proc;
}

int proc2pid(Proc *proc)
{
	unsigned int pid = proc->pid;
	return pid;
}
