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
          //  disp_str_colour("error", 0xA);
           // disp_int(p->p_flag);
            while (1)
            {
            }
        }
    }
}

// 进程调度次数
void schedule_process()
{

	unsigned int max_pid = 5;
	int page_directory = 0x100000;

    Proc *next, *cur;

	next = 0x0;

	// 脏数据太多，怎么办？
	cur = (Proc *)get_running_thread_pcb();

	if(cur == 0xc0234000 && cur->parent_pid != -1){
		int k = 4;
		int b = k;
	}
	// if(cur == 0xc0234000 && cur->wait_status == 66){
	if(cur == 0xc0234000){
		int k = 4;
		int b = k;
	}

	if(isListEmpty(&pcb_list) == 1){
		if(cur->pid == 0){
			next = cur;
			appendToDoubleLinkList(&pcb_list, &cur->tag);
		}else{
			if(cur->p_flag == RUNNING){
				appendToDoubleLinkList(&pcb_list, &cur->tag);
				unsigned int element = (unsigned int)popFromDoubleLinkList(&pcb_list);
				Proc *tmp = (Proc *)(element & 0xFFFFF000);
				if(tmp != 0x0){
					if(tmp->pid == 0){
						tmp->p_flag = HANGING;
						if(isListEmpty(&pcb_list) == 0){
							element = (unsigned int)popFromDoubleLinkList(&pcb_list);
							tmp = (Proc *)(element & 0xFFFFF000);
							if(tmp != 0x0){
								next = tmp;
								next->p_flag = RUNNING;
							}	
						}else{
							next = tmp;
							next->p_flag = RUNNING;
						}
					}else{
						next = tmp;
						next->p_flag = RUNNING;
					}
				}
			}
		}
	}else{
		if(cur->p_flag == RUNNING){
			appendToDoubleLinkList(&pcb_list, &cur->tag);
			unsigned int element = (unsigned int)popFromDoubleLinkList(&pcb_list);
			Proc *tmp = (Proc *)(element & 0xFFFFF000);
			if(tmp != 0x0){
				if(tmp->pid == 0){
					tmp->p_flag = HANGING;
					if(isListEmpty(&pcb_list) == 0){
						element = (unsigned int)popFromDoubleLinkList(&pcb_list);
						tmp = (Proc *)(element & 0xFFFFF000);
						if(tmp != 0x0){
							next = tmp;
							next->p_flag = RUNNING;
						}	
					}else{
						next = tmp;
						next->p_flag = RUNNING;
					}
				}else{
					next = tmp;
					next->p_flag = RUNNING;
				}
			}
		}else{
			unsigned int element = (unsigned int)popFromDoubleLinkList(&pcb_list);
			Proc *tmp = (Proc *)(element & 0xFFFFF000);
			if(tmp != 0x0){
				if(tmp->pid == 0){
					tmp->p_flag = HANGING;
					if(isListEmpty(&pcb_list) == 0){
						element = (unsigned int)popFromDoubleLinkList(&pcb_list);
						tmp = (Proc *)(element & 0xFFFFF000);
						if(tmp != 0x0){
							next = tmp;
							next->p_flag = RUNNING;
						}	
					}else{
						next = tmp;
						next->p_flag = RUNNING;
					}
				}else{
					next = tmp;
					next->p_flag = RUNNING;
				}
			}
		}
	}

	if(is_init == 0){
		if(next == 0 || next->pid < max_pid){
	//		goto _do_not_switch;
		}else{
			is_init = 1;
	//		goto _start_switch;
		}
	}

	if(next == 0){
_do_not_switch:
		// if(next->pid != 0){ 当next == 0时，next->pid的值是1048576。意外！
		if(next != 0 && next->pid != 0){
			appendToDoubleLinkList(&pcb_list, &next->tag);
		}
		next = main_thread; 
		next->p_flag = RUNNING;
	}


_start_switch:
//	disp_str("switch_to?No3\n");
	// 进程，切换页目录表。
//	int page_directory = 0x100000;
	if(next->page_directory != 0x0){
//		disp_str("update_tss\n");
		// update_tss((unsigned int)next + PAGE_SIZE);
		update_tss((unsigned int)next);
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

	if(next->pid ==  5){
//		asm ("xchgw %bx, %bx");
	}

	if(next->pid != 0 && next->parent_pid != -1){
    	asm ("xchgw %bx, %bx");
    	next = pid2proc(next->parent_pid);
	}

	switch_to(cur, next);
}

void clock_handler()
{
	if(key_pressed){
		inform_int(TASK_TTY);
	}
    // 调度进程
    if(proc_ready_table != 0x0){
		proc_ready_table->ticks--;
	}
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

	return 0x0;
}

int proc2pid(Proc *proc)
{
	unsigned int pid = proc->pid;
	return pid;
}
