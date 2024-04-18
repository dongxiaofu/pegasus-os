#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "global.h"
#include "hd.h"

int do_fork(Message *msg)
{
	int parent_pid = msg->source;
	// disable_int();
	Proc *child_process = fork_process(parent_pid);
	// enable_int();
	unsigned int child_pid = child_process->pid;

    // 把子进程的pid返回给父进程
    msg->PID = child_process->pid;

    // 解除子进程的阻塞
    Message m;
    m.TYPE = SYSCALL_RET;
    m.RETVAL = 0;
    m.PID = 0;
    send_rec(SEND, &m, child_pid);

    return child_pid;
}

// todo exit_code没用到。不知道怎么处理。
void do_exit(Message *msg, int exit_code)
{
    // 获取caller
    int pid = msg->source;
	Proc *proc = pid2proc(pid);

    // 处理文件 todo 暂时不实现。
//    Message msg2fs;
//    msg2fs.type = EXIT;
//    msg2fs.PID = pid;
//    send_rec(BOTH, &msg2fs, pid);

    // 处理caller
    int parent_pid = proc->parent_pid;
	Proc *parent_proc = pid2proc(parent_pid);
	// TODO 没有父进程怎么处理？
	if(parent_proc == 0x0)	return;
	proc->exit_status = msg->STATUS;
    if (parent_proc->wait_status == WAITING)
    {
		parent_proc->wait_status = ~WAITING;
        cleanup(proc);
    }
    else
    {
        //proc->p_flag = FREE_SLOT;
        proc->p_flag = HANGING;
    }

    // 处理caller的子进程
    // TODO 暂时不实现。我不知道怎么实现。
//    for (int i = TASK_PROC_NUM + USER_PROC_NUM; i <= FORKED_USER_PROC_NUM; i++)
//    {
//        if (proc_table[i].parent_pid == pid)
//        {
//            proc_table[i].parent_pid = INIT_PID;
//            if (proc_table[INIT_PID].wait_status == WAITING && proc_table[i].wait_status == HANGING)
//            {
//                proc_table[INIT_PID].wait_status = ~WAITING;
//                cleanup(&proc_table[i]);
//            }
//        }
//    }
}

void do_wait(Message *msg)
{
    // caller
    int pid = msg->source;
    int child_count = 0;

    // 检查子进程是否处于HANGING状态
	Proc *proc = 0x0;
	Proc *parent_proc = pid2proc(pid);
	assert(parent_proc != 0x0);

	ListElement *cur = pcb_list.head.next;
	while(cur != &pcb_list.tail){
		proc = (Proc *)((unsigned int)cur & 0xFFFFF000);
		if(proc->parent_pid != pid){
			cur = cur->next;
			continue;
		}
		child_count++;
        if(proc->wait_status != HANGING){
			cur = cur->next;
			continue;
		}
        parent_proc->wait_status = ~WAITING;
        cleanup(proc);
        return;
	}

    // 有子进程；无子进程。
    if (child_count)
    {
        parent_proc->wait_status = WAITING;
    }
    else
    {
        // 解除caller的阻塞
        Message m;
        m.TYPE = SYSCALL_RET;
        m.RETVAL = 0;
        m.PID = 0;
        send_rec(SEND, &m, pid);
    }
}

void cleanup(Proc *proc)
// void cleanup(Proc proc)
{
    // 解除父进程的阻塞
    Message msg2parent;
    msg2parent.TYPE = SYSCALL_RET;
    msg2parent.RETVAL = 0;
    msg2parent.PID = proc->parent_pid;
//    msg2parent.PID = proc.parent_pid;
	msg2parent.STATUS = proc->exit_status;
//	msg2parent.STATUS = proc.exit_status;
// todo 把子进程的退出码传递给父进程。
    send_rec(SEND, &msg2parent, proc->parent_pid);
    // 回收子进程的进程表
    proc->p_flag = FREE_SLOT;
}
