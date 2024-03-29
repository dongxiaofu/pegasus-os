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

// 进程调度次数
void schedule_process()
{
	Proc *p;
	unsigned int greatest_ticks = 0;
	while(!greatest_ticks){
		//for(p = proc_table; p < proc_table + USER_PROC_NUM; p++){
		for(p = proc_table; p < proc_table + TASK_PROC_NUM + USER_PROC_NUM; p++){
			if(p->p_flag == RUNNING && p->ticks > greatest_ticks){
				greatest_ticks = p->ticks;
				proc_ready_table = p;
			}
		}

		//p_flag需要参与运算吗？目前，是否参与都行，看具体需求。
		//while(!greatest_ticks){
		if(!greatest_ticks){
			for(p = proc_table; p < proc_table + TASK_PROC_NUM + USER_PROC_NUM; p++){
				if(p->p_flag == RUNNING){
					p->ticks = p->priority;
				}
			}
		}

	}
}

void clock_handler()
{
	if(proc_ready_table->ticks > 0){
		proc_ready_table->ticks--;
	}
	ticks++;

	if(k_reenter != 0 ){
		//return proc_ready_tab
		return;
	}

	if(proc_ready_table->ticks > 0){
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
