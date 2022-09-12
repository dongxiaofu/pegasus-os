#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
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
	Proc *next;
    Proc *p;
    unsigned int greatest_ticks = 0;
	proc_ready_table = proc_table2[k_reenter % 2];
//    while (!greatest_ticks)
	while(0)
    {
        // todo 测试需要，去掉用户进程USER_PROC_NUM。
        //for(p = proc_table; p < proc_table + USER_PROC_NUM; p++){
        for (p = proc_table; p < proc_table + TASK_PROC_NUM + USER_PROC_NUM + FORKED_USER_PROC_NUM; p++)
        {
            // for (p = proc_table; p < proc_table + TASK_PROC_NUM; p++) {
            if (p->p_flag == RUNNING && p->ticks > greatest_ticks)
            {
                greatest_ticks = p->ticks;
                proc_ready_table = p;
            }
        }

        //p_flag需要参与运算吗？目前，是否参与都行，看具体需求。
        //while(!greatest_ticks){
        if (!greatest_ticks)
        {
            // for (p = proc_table; p < proc_table + TASK_PROC_NUM; p++) {
            // todo 测试需要，去掉用户进程USER_PROC_NUM。
            for (p = proc_table; p < proc_table + TASK_PROC_NUM + USER_PROC_NUM + FORKED_USER_PROC_NUM; p++)
            {
                if (p->p_flag == RUNNING)
                {
                    p->ticks = p->priority;
                }
            }
        }
    }

	next = proc_ready_table;

//	switch_to(next);

	// 进程，切换页目录表。
	int page_directory = 0x100000;
	if(proc_ready_table->page_directory != 0x0){
//		proc_ready_table->page_directory = 0x100000;
		// asm ("xchgw %bx, %bx");
		asm volatile ("movl %0, %%cr3" : : "r" (proc_ready_table->page_directory) : "memory");
	}else{
//		page_directory = 0x100000 + 0x2000;
		asm volatile ("movl %0, %%cr3" : : "r" (page_directory) : "memory");
	}
}

void clock_handler()
{
    schedule_process();
    if (proc_ready_table->p_flag == RECEIVING || proc_ready_table->p_flag == SENDING)
    {
        //	schedule_process();
        //	return;
    }
    //	check();
    if (++ticks >= MAX_TICKS)
    {
        ticks = 0;
    }
    if (proc_ready_table->ticks > 0)
    {
        proc_ready_table->ticks--;
    }

    if (key_pressed)
    {
        inform_int(0);
    }

    if (k_reenter != 0)
    {
        //return proc_ready_tab
        return;
    }

    if (proc_ready_table->ticks > 0)
    {
        return;
    }

    // 调度进程
    schedule_process();
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
