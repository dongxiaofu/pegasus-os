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

//int do_fork(Message *msg);
//
//void cleanup(Proc *proc);
//
//void do_exit(Message msg, int exit_code);
//
//void do_wait(Message msg, int *data);

int do_fork(Message *msg)
{
    // 找到一个空闲进程表
    Proc *proc = &proc_table[TASK_PROC_NUM + USER_PROC_NUM];
    int pid = 0;
    for (int i = TASK_PROC_NUM + USER_PROC_NUM; i <= FORKED_USER_PROC_NUM; i++)
    {
        if (proc->p_flag == FREE_SLOT)
        {
            pid = i;
            break;
        }
        proc++;
    }

    //assert(pid > TASK_PROC_NUM + USER_PROC_NUM);
    // assert(pid > (TASK_PROC_NUM + USER_PROC_NUM));
    assert(pid >= (TASK_PROC_NUM + USER_PROC_NUM));

    // 复制父进程的进程表
    int parent_pid = msg->source;
    int ldt_sel = proc->ldt_selector;
    *proc = proc_table[parent_pid];
    proc->pid = pid;
    proc->ldt_selector = ldt_sel;
	proc->parent_pid = parent_pid;

    // 复制父进程的内存空间
    // 使用指针，是因为我想改动最小，不想把下面的->改成.。
    Descriptor *cs_descriptor = &proc_table[parent_pid].ldts[0];
    // 该在哪个文件实现reassembly？满足两点：本文件对应的头文件；能被本文件引用。
    int caller_cs_base = reassembly(
        cs_descriptor->seg_base_high, 24, cs_descriptor->seg_base_middle, 16, cs_descriptor->seg_base_below);

    // todo 不知道怎么计算。
    int caller_cs_limit = reassembly(
        cs_descriptor->seg_limit_high_and_attr2 & 0xF, 16, cs_descriptor->seg_limit_below, 0, 0);

    // cs段的size
    // todo 需验证，段大小的单位是4K还是字节。
    int caller_cs_size = (caller_cs_limit + 1) * 4096;
    //    int caller_cs_size = (caller_cs_limit + 1);

    // 计算子进程的内存空间的基地址
    int child_base = alloc_mem(pid, caller_cs_size);

    // 复制父进程的物理空间
    // phycopy(buf_line_addr + byte_wt, fsbuf + offset,  byte);
    // 两个参数都是物理地址。
    //caller_cs_size = PROC_IMAGE_DEFAULT_SIZE;
    //	caller_cs_size = (0x1000 + 0x015be4);
    //	caller_cs_base = 0x1000;
    //	child_base += 0x10;
    phycopy(child_base, caller_cs_base, caller_cs_size);

    // 设置子进程的ldt
    // todo 偷个懒，从我以前的代码中拼凑成的。我仍然不熟悉这块知识。
    int dpl = 3;
    //child_base -= 0xA000;

    //proc_table[pid].ldts[0].seg_base_below = child_base & 0x0000FFFF;
    //proc_table[pid].ldts[0].seg_base_middle = (child_base & 0x00FF0000)>>8;
    //proc_table[pid].ldts[0].seg_base_high = (child_base & 0xFF000000)>>24;
    //
    //proc_table[pid].ldts[1].seg_base_below = child_base & 0x0000FFFF;
    //proc_table[pid].ldts[1].seg_base_middle = (child_base & 0x00FF0000)>>8;
    //proc_table[pid].ldts[1].seg_base_high = (child_base & 0x00FF0000)>>24;
    //int cs_attribute = 0x82;    // 最大难点。
    //int cs_attribute = 8000h | 4000h | 98h | (3 <<  5);
    //int cs_attribute = 0x8000 | 0x4000 | 0x98 | (3 <<  5);
    int cs_attribute = 0xcfa; //0x8000 | 0x4000 | 0x98 | (3 <<  5);
    InitDescriptor(&proc_table[pid].ldts[0], child_base, caller_cs_limit, cs_attribute);
    //    int limit = (0x1000 + 0x020000);
    //  InitDescriptor(&(proc_table[pid].ldts[0]), child_base, (limit - 1) >> 12, cs_attribute);
    ////	proc->ldts[0].seg_attr1 = 0x9a | (dpl << 5);
    ////    int ds_attribute = 0x82;    // 最大难点。
    //    //InitDescriptor(&proc_table[pid].ldts[1], child_base, caller_cs_limit, ds_attribute);
    //    //int ds_attribute = 8000h | 4000h | 92h | (3 << 5);
    //int ds_attribute = 0x8000 | 0x4000 | 0x92 | (3 << 5);
    int ds_attribute = 0xcf2; //0x8000 | 0x4000 | 0x92 | (3 << 5);
    InitDescriptor(&(proc_table[pid].ldts[1]), child_base, caller_cs_limit, ds_attribute);
    //proc->ldts[1].seg_attr1 = 0x92 | (dpl << 5);

    // 处理文件todo，暂时不处理。
    //    Message msg2fs;
    //    msg2fs.type = FORK;
    //    msg2fs.PID = pid;
    //    send_rec(BOTH, &msg2fs, pid);

    // 把子进程的pid返回给父进程
    msg->PID = pid;

    // 解除子进程的阻塞
    Message m;
    m.TYPE = SYSCALL_RET;
    m.RETVAL = 0;
    m.PID = 0;
    send_rec(SEND, &m, pid);

    return pid;
}

// todo exit_code没用到。不知道怎么处理。
void do_exit(Message *msg, int exit_code)
{
    // 获取caller
    int pid = msg->source;
    Proc *proc = &proc_table[pid];

    // 处理文件
    Message msg2fs;
    msg2fs.type = EXIT;
    msg2fs.PID = pid;
    send_rec(BOTH, &msg2fs, pid);

    // 处理caller
    int parent_pid = proc->parent_pid;
    if (proc_table[parent_pid].p_flag == WAITING)
    {
        proc_table[parent_pid].p_flag = ~WAITING;
        cleanup(proc);
    }
    else
    {
        proc->p_flag = FREE_SLOT;
    }

    // 处理caller的子进程
    for (int i = TASK_PROC_NUM + USER_PROC_NUM; i <= FORKED_USER_PROC_NUM; i++)
    {
        if (proc_table[i].parent_pid == pid)
        {
            proc_table[i].parent_pid = INIT_PID;
            if (proc_table[INIT_PID].p_flag == WAITING && proc_table[i].p_flag == HANGING)
            {
                proc_table[INIT_PID].p_flag = ~WAITING;
                cleanup(proc_table[i]);
            }
        }
    }
}

void do_wait(Message msg)
{
    // caller
    int pid = msg.source;
    int child_count = 0;

    // 检查子进程是否处于HANGING状态
    for (int i = TASK_PROC_NUM + USER_PROC_NUM; i <= FORKED_USER_PROC_NUM; i++)
    {
        if (proc_table[i].parent_pid = pid)
        {
            child_count++;
            if (proc_table[i].p_flag == HANGING)
            {
                proc_table[pid].p_flag = ~WAITING;
                cleanup(proc_table[i]);
                return;
            }
        }
    }

    // 有子进程；无子进程。
    if (child_count)
    {
        proc_table[pid].p_flag = HANGING;
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
{
    // 解除父进程的阻塞
    Message msg2parent;
    msg2parent.TYPE = SYSCALL_RET;
    msg2parent.RETVAL = 0;
    msg2parent.PID = proc->parent_pid;
    send_rec(SEND, &msg2parent, proc->parent_pid);
    // 回收子进程的进程表
    proc->p_flag = FREE_SLOT;
}
