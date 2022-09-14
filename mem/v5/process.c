#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "double_link_list.h"
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
	
	cur = proc_ready_table;

	if(isListEmpty(pcb_list) == 1){
		disp_str("switch_to?No\n");
	}else{
		disp_str("switch_to?Yes\n");
		Proc *tmp = (Proc *)popFromDoubleLinkList(pcb_list);
		if(tmp != 0x0)	proc_ready_table = tmp;
	}

	// 进程，切换页目录表。
	int page_directory = 0x100000;
	if(proc_ready_table->page_directory != 0x0){
		//asm volatile ("movl %0, %%cr3" : : "r" (proc_ready_table->page_directory) : "memory");
	}else{
		//asm volatile ("movl %0, %%cr3" : : "r" (page_directory) : "memory");
	}
	
	next = proc_ready_table;
	disp_str("no switch_to\n");
	switch_to(cur, next);
	disp_str("no switch_to 2\n");
}

void clock_handler()
{
    // 调度进程
    schedule_process();
	disp_str("clock_handler:");
	disp_int(ticks);
	disp_str("\n");
}

Proc *pid2proc(int pid)
{
    Proc *proc = proc_table + pid;
    // todo 用局部变量当返回值，曾经遇到过出错。要当心。
    return proc;
}

int proc2pid(Proc *proc)
{
    int pid = proc - proc_table;
    return pid;
}

//unsigned int v2l(int pid, void *offset)
//{
//	Proc *proc = pid2proc(pid);
//	int ds = proc->s_reg.ds;
//	int base = Seg2PhyAddrLDT(ds, proc);
//	int line_addr = base + offset;
//	return line_addr;
//}
