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
#include "hd.h"

int do_fork(Message *msg);
void cleanup(Proc *proc);
void do_exit(Message msg, int exit_code);
void do_wait(Message msg, int *data);

int do_fork(Message *msg)
{
	// 找到一个空闲进程表
	Proc *proc = proc_table;
	int pid = 0;
	for(int i = TASK_PROC_NUM + USER_PROC_NUM; i <= FORKED_USER_PROC_NUM; i++){
		// todo 定义FREE_SLOT；修改进程表
		if(proc->p_flag == FREE_SLOT){
			pid = i;	
			break;
		}
		proc++;
	} 

	assert(pid >= TASK_PROC_NUM + USER_PROC_NUM);

	// 复制父进程的进程表
	int parent_pid = msg->source;
	int ldt_sel = proc->ldt_sel;
	*proc = proc_table[pid];
	proc->ldt_sel = ldt_sel;

	// 复制父进程的内存空间
	Descriptor cs_descriptor = proc_table[parent_pid].ldt[0];
	// todo 实现reassembly
	int caller_cs_base = reassembly(
			cs_descriptor->seg_base_high, 24
			cs_descriptor->seg_base_mid, 16
			cs_descriptor->seg_base_low
			);

	int caller_cs_limit = reassembly(
			cs_descriptor->seg_limit_high, 24
			cs_descriptor->seg_limit_mid, 16
			cs_descriptor->seg_limit_low
			);

	// cs段的size
	// todo 需验证，段大小的单位是4K还是字节。
	int caller_cs_size = (caller_cs_limit + 1) * 4096;

	// 计算子进程的内存空间的基地址
	// todo alloc_mem还没有实现
	int child_base = alloc_mem(pid, caller_cs_size);

	// 复制父进程的物理空间
	// phycopy(buf_line_addr + byte_wt, fsbuf + offset,  byte);
	// 两个参数都是物理地址。
	phycopy(child_base, caller_cs_base,  caller_cs_size);

	// 设置子进程的ldt
	int cs_attribute = 0;	// 最大难点。
	InitDescriptor(&proc_table[pid].ldt[0], child_base, caller_cs_limit, cs_attribute);	
	int ds_attribute = 0;	// 最大难点。
	InitDescriptor(&proc_table[pid].ldt[1], child_base, caller_cs_limit, ds_attribute);	

	// 处理文件
	Message msg2fs;
	msg2fs.type = FORK;
	msg2fs.PID = pid;
	send_rec(BOTH, &msg2fs, pid); 

	// 解除子进程的阻塞
	Message m;
	m.type = SYSCALL_RET;
	m.RET_VAL = 0;
	m.PID = 0; 
	send_rec(SEND, &m, pid); 

	return 0;
}

// todo exit_code没用到。
void do_exit(Message msg, int exit_code)
{
	// 获取caller
	int pid = msg.source;
	Proc *proc = proc_table[pid];

	// 处理文件
	Message msg2fs;
	msg2fs.type = EXIT;
	msg2fs.PID = pid;
	send_rec(BOTH, &msg2fs, pid);

	// 处理caller
	int parent_pid = proc->parent_pid;
	if(proc_table[parent_pid].p_flag == WAITING){
		proc_table[parent_pid].p_flag = ~WAITING;
		cleanup(proc);
	}else{
		proc->p_flag = FREE_SLOT;
	}

	// 处理caller的子进程
	for(int i = TASK_PROC_NUM + USER_PROC_NUM; i <= FORKED_USER_PROC_NUM; i++){
		if(proc_table[i].parent_pid == pid){
			proc_table[i].parent_pid = INIT_PID;
			if(proc_table[INIT_PID].p_flag == WAITING && proc_table[i].p_flag == HANGING){
				proc_table[INIT_PID].p_flag = ~WAITING;
				cleanup(proc_table[i]);
			}
		}
	}	
}


void do_wait(Message msg, int *data)
{
	// caller
	int pid = msg.source;
	int child_count = 0;

	// 检查子进程是否处于HANGING状态
	for(int i = TASK_PROC_NUM + USER_PROC_NUM; i <= FORKED_USER_PROC_NUM; i++){
		if(proc_table[i].parent_pid = pid){
			child_count++;
			if(proc_table[i].p_flag == HANGING){
				proc_table[pid].p_flag = ~WAITING;
				cleanup(proc_table[i]);
				return;
			}
		}
	}

	// 有子进程；无子进程。
	if(child_count){
		proc_table[pid].p_flag = HANGING;
	}else{
		// 解除caller的阻塞
		Message m;
		m.type = SYSCALL_RET;
		m.RET_VAL = 0;
		m.PID = 0;
		send_rec(SEND, &m, pid);
	}
}


void cleanup(Proc *proc)
{
	// 解除父进程的阻塞
	Message msg2parent;
	msg2parent.type = SYSCALL_RET;
	msg2parent.RET_VAL = 0;
	msg2parent.PID = proc->parent_pid;
	send_rec(SEND, &msg2parent, proc->parent_pid);
	// 回收子进程的进程表
	proc->p_flag = FREE_SLOT;
}
