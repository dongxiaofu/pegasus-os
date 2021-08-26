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

void check() {

    Proc *p;
    for (p = proc_table; p < proc_table + TASK_PROC_NUM; p++) {
        // if (p->p_flag != RUNNING  && p->p_flag != SENDING && p->p_flag != RECEIVING) {
        if (p->has_int_msg != 0 && p->has_int_msg != 1) {
            dis_pos = 10 * 1024 + 2;
            disp_str_colour("error", 0xA);
            disp_int(p->p_flag);
            while (1) {
            }
        }
    }
}

// 进程调度次数
void schedule_process() {
    Proc *p;
    unsigned int greatest_ticks = 0;
    while (!greatest_ticks) {
        // todo 测试需要，去掉用户进程USER_PROC_NUM。
        //for(p = proc_table; p < proc_table + USER_PROC_NUM; p++){
        for (p = proc_table; p < proc_table + TASK_PROC_NUM + USER_PROC_NUM + FORKED_USER_PROC_NUM; p++) {
            // for (p = proc_table; p < proc_table + TASK_PROC_NUM; p++) {
            if (p->p_flag == RUNNING && p->ticks > greatest_ticks) {
                greatest_ticks = p->ticks;
                proc_ready_table = p;
            }
        }

        //p_flag需要参与运算吗？目前，是否参与都行，看具体需求。
        //while(!greatest_ticks){
        if (!greatest_ticks) {
            // for (p = proc_table; p < proc_table + TASK_PROC_NUM; p++) {
            // todo 测试需要，去掉用户进程USER_PROC_NUM。
            for (p = proc_table; p < proc_table + TASK_PROC_NUM + USER_PROC_NUM + FORKED_USER_PROC_NUM; p++) {
                if (p->p_flag == RUNNING) {
                    p->ticks = p->priority;
                }
            }
        }
    }

    if (proc_ready_table->pid == 7) {

        int a = 8;
    }
}

void clock_handler() {
    if (proc_ready_table->p_flag == RECEIVING || proc_ready_table->p_flag == SENDING) {
        //	schedule_process();
        //	return;
    }
    //	check();
    if (++ticks >= MAX_TICKS) {
        ticks = 0;
    }
    if (proc_ready_table->ticks > 0) {
        proc_ready_table->ticks--;
    }

    if (key_pressed) {
        inform_int(0);
    }

    if (k_reenter != 0) {
        //return proc_ready_tab
        return;
    }

    if (proc_ready_table->ticks > 0) {
        return;
    }

    // 调度进程
    schedule_process();
}

Proc *pid2proc(int pid) {
    Proc *proc = proc_table + pid;
    // todo 用局部变量当返回值，曾经遇到过出错。要当心。
    return proc;
}

int proc2pid(Proc *proc) {
    int pid = proc - proc_table;
    return pid;
}

// ipc start
int dead_lock(int src, int dest) {
    Proc *src_proc = pid2proc(src);
    Proc *dest_proc = pid2proc(dest);
    while (1) {
        // Proc *src_proc = pid2proc(src);
        // Proc *dest_proc = pid2proc(dest);
        if (dest_proc->p_flag == SENDING) {
            if (dest_proc->p_send_to == src) {
                // panic("dead lock!\n");
                //Printf("%x---->%x---->", src, dest);
                // 打印死锁环
                Proc *p = dest_proc;
                do {
                    // Printf("%x---->%x---->", proc2pid(p), p->p_send_to);
                    p = pid2proc(p->p_send_to);
                } while (p->pid != src);
                //Printf("%x\n", src);
                // Printf("%x---->%x---->", proc2pid(p), src);
                return 1;
            }
            dest_proc = pid2proc(dest_proc->p_send_to);
        } else {
            break;
        }
    }

    return 0;
}

// send_msg 通过sys_call调用
int sys_send_msg(Message *msg, int receiver_pid, Proc *sender) {
    Proc *receiver = pid2proc(receiver_pid);
    int sender_pid = proc2pid(sender);
    // 计算msg的线性地址
    int ds = sender->s_reg.ds;
    int base = Seg2PhyAddrLDT(ds, sender);
    int msg_line_addr = base + (int) msg;
    int msg_size = sizeof(Message);
    Message *msg_tmp = (Message *) msg_line_addr;
    msg_tmp->source = sender_pid;
    //    msg->source = sender_pid;
    // 死锁检测
    if (dead_lock(sender_pid, receiver_pid) == 1) {
        panic("dead lock\n");
    }

    if (receiver->p_flag == RECEIVING && (receiver->p_receive_from == sender_pid || receiver->p_receive_from == ANY)) {
        // 计算msg的线性地址
        // int ds = sender->s_reg.ds;
        // int base = Seg2PhyAddrLDT(ds, sender);
        // int msg_line_addr = base + (int)msg;
        // int msg_size = sizeof(Message);

        int ds2 = receiver->s_reg.ds;
        int base2 = Seg2PhyAddrLDT(ds2, receiver);
        int msg_line_addr2 = base2 + (int) (receiver->p_msg);
        // 从sender中把消息复制到receiver
        //    phycopy(receiver->p_msg, msg_line_addr, msg_size);
        phycopy(msg_line_addr2, msg_line_addr, msg_size);
        // 重置sender
        //        sender->p_msg = 0;
        //        sender->p_send_to = 0;
        // 重置receiver
        receiver->p_msg = 0;
        receiver->p_flag = RUNNING;
        receiver->p_receive_from = NO_TASK;

        // 解除receiver的阻塞。
        unblock(receiver);

        // 调试函数
        assert(sender->p_msg == 0);
        assert(sender->p_flag == 0);
        assert(sender->p_send_to == NO_TASK);
        //assert(sender->p_receive_from == NO_TASK);
        assert(receiver->p_msg == 0);
        assert(receiver->p_flag == 0);
        assert(receiver->p_receive_from == NO_TASK);
        //assert(receiver->p_send_to == NO_TASK);
    } else {
        // 思路：
        // 1. 如何目标进程没有准备好接收消息，把消息加入目标进程的消息队列。
        // 2. 如果是目标进程的消息队列的第一个进程是空，把本进程设置成消息队列的第一个进程。
        // 3. 如果目标进程的消息队列的第一个进程不是空，把本进程放到消息队列的末尾。
        Proc *pre = 0;
        Proc *p = receiver;
        if (receiver->q_sending == 0) {
            receiver->q_sending = sender;
            sender->q_next = 0;
        } else {
            Proc *p = receiver->q_sending;
            while (p) {
                pre = p;
                p = p->q_next;
            }
            pre->q_next = sender;
            sender->q_next = 0;
        }

        sender->p_msg = msg;
        sender->p_send_to = receiver_pid;
        sender->p_flag = SENDING;

        // 调试函数
        assert(sender->p_flag == SENDING);
        assert(sender->p_send_to == receiver_pid);
        assert(sender->p_msg == msg);

        // 阻塞sender
        block(sender);
    }

    return 0;
}

// receive_msg 通过sys_call调用
int sys_receive_msg(Message *msg, int sender_pid, Proc *receiver) {
    int copy_ok = 0;
    Proc *p_from;
    Proc *pre;

    Proc *sender = pid2proc(sender_pid);
    int receiver_pid = proc2pid(receiver);

    //	dis_pos = (1024*12 + 0);
    //	dis_pos = (1024*12 + 0);
    //	dis_pos = 12000 - 128 + 10 + 320;
    //	//dis_pos += 160;
    //	disp_str_colour("sender0:", 0x0C);
    //	disp_int(sender_pid);
    //	disp_str("#");
    //	disp_str_colour("pid:", 0x0B);
    //	disp_int(proc_ready_table->pid);
    //	disp_str("#");

    //	disp_str_colour("sender:", 0x0B);
    //	dis_pos += Strlen("sender:");
    //	disp_int(sender_pid);
    //
    //	disp_str_colour("receiver:", 0x0B);
    //	dis_pos += Strlen("receiver:");
    //	disp_int(receiver_pid);
    if (DEBUG == 1) {
        Printf("sender = %x, receiver = %x\n", sender_pid, receiver_pid);

        assert((sender_pid == 1) || (sender_pid == 2) || (sender_pid == 3) || (sender_pid == 15));
        assert((receiver_pid == 1) || (receiver_pid == 2) || (receiver_pid == 3) || (receiver_pid == 15));
    }

    if (receiver->has_int_msg && (sender_pid == ANY || sender_pid == INTERRUPT)) {

        Message m;
        Memset(&m, 0, sizeof(Message));
        m.source = INTERRUPT;
        m.TYPE = HARD_INT;

        phycopy(v2l(receiver_pid, msg), &m,
                sizeof(Message));

        receiver->has_int_msg = 0;
        receiver->p_receive_from = NO_TASK;
        receiver->p_send_to = NO_TASK;
        receiver->p_flag = RUNNING;

        return 0;
    }

    // 主要思路：
    // 1. 如果信息来源是ANY，从本进程的消息队列中取出一个消息进行处理。
    // 2. 如果消息来源不是ANY，进入下面的流程。
    // 2.1. 进程pid合法 && 消息来源的状态是SENDING && 消息来源的发送对象是本进程。
    if (sender_pid == ANY) {
        if (receiver->q_sending) {
            // Printf("sending id:%x\n", receiver->q_sending->pid);
            //	dis_pos = 12000 - 128 + 10 + 160;
            //	disp_str_colour("send-id:", 0x0C);
            //	disp_int(receiver->q_sending->pid);
            //	disp_str("#");
            //	disp_str_colour("receiver-id:", 0x0C);
            //	disp_int(receiver->pid);
            p_from = receiver->q_sending;
            //	disp_str_colour("rpfrom-id:", 0x0C);
            //	disp_int(p_from->pid);
            //	disp_str("#");
            //	disp_str_colour("type:", 0x0C);
            //	disp_int(p_from->pid);
            //	disp_str("#");
            copy_ok = 1;
        }
    } else if (0 <= sender_pid && sender_pid < USER_PROC_NUM + TASK_PROC_NUM) {
        if (sender->p_flag == SENDING && (sender->p_send_to == ANY || sender->p_send_to == receiver_pid)) {
            p_from = receiver->q_sending;
            while (p_from) {
                pre = p_from;
                if (p_from->pid == sender_pid) {
                    copy_ok = 1;
                    break;
                }
                p_from = p_from->q_next;
            }
        }
    }

    if (copy_ok == 1) {
        Proc *p_from_proc = p_from;
        // 计算msg的线性地址
        int ds = receiver->s_reg.ds;
        int base = Seg2PhyAddrLDT(ds, receiver);
        void *msg_line_addr = (void *) (base + (int) msg);
        int msg_size = sizeof(Message);

        int ds2 = receiver->s_reg.ds;
        int base2 = Seg2PhyAddrLDT(ds2, p_from_proc);
        void *msg_line_addr2 = (void *) (base2 + (int) (p_from_proc->p_msg));

        // 从receiver中把消息复制到sender
        // phycopy(msg_line_addr, p_from_proc->p_msg, msg_size);
        phycopy(msg_line_addr, msg_line_addr2, msg_size);
        Message *m = (Message *) msg_line_addr;
        //	dis_pos = 12000 - 128 + 10 + 320;
        //	disp_str_colour("current-id:", 0x0C);
        //	disp_int(proc_ready_table->pid);
        //	disp_str("#");
        //	disp_str_colour("from-id:", 0x0C);
        //	disp_int(p_from_proc->pid);
        //	assert(p_from_proc->p_msg->TYPE != 0);

        if (sender_pid == 4) {
            assert(msg->TYPE == OPEN);
        }

        // 移除已经处理过的消息。
        if (p_from == receiver->q_sending) {
            receiver->q_sending = p_from->q_next;
            p_from->q_next = 0;
        } else {
            pre->q_next = p_from->q_next;
            p_from->q_next = 0;
        }
        //	dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("sender33:", 0x0C);
        //	disp_int(sender_pid);
        //dis_pos -= Strlen("sender33:");

        // 重置sender
        p_from_proc->p_msg = 0;
        p_from_proc->p_flag = RUNNING;
        //p_from_proc->p_send_to = 0;
        p_from_proc->p_send_to = NO_TASK;
        // 重置receiver
        receiver->p_msg = 0;
        receiver->p_receive_from = NO_TASK;
        receiver->p_send_to = NO_TASK;
        // 解除sender的阻塞
        // unblock(sender);
        unblock(p_from_proc);

        // 调试函数
        assert(p_from_proc->p_msg == 0);
        assert(p_from_proc->p_flag == 0);
        assert(p_from_proc->p_send_to == NO_TASK);
        //assert(p_from_proc->p_receive_from == NO_TASK);
        assert(receiver->p_msg == 0);
        assert(receiver->p_flag == 0);
        assert(receiver->p_receive_from == NO_TASK);
        assert(receiver->p_send_to == NO_TASK);
    } else {
        //	dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("sender3:", 0x0C);
        //	disp_int(sender_pid);
        //	disp_str("#");
        receiver->p_flag = RECEIVING;
        receiver->p_msg = msg;
        // receiver->p_msg = 0;

        if (sender_pid == ANY) {
            receiver->p_receive_from = ANY;
        } else {
            receiver->p_receive_from = sender_pid;
        }
        //	sender_pid = 3;

        //	dis_pos = (80 * 80 + 0)*2;
        //	dis_pos = 1024 * (10 +1) + 160;

        //	dis_pos = (1024*12 + 0);
        dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("sender4:", 0x0C);
        //	disp_int(sender_pid);
        //	disp_str("#");
        //	disp_str_colour("type:", 0x0B);
        //	disp_int(msg->TYPE);
        //	disp_str("#");
        //	disp_str_colour("copy_ok:", 0x0B);
        //	disp_int(copy_ok);
        //	disp_str("#");
        //	disp_str_colour("type2:", 0x0B);
        //	disp_int(msg->TYPE);
        //	disp_str("#");
        //
        //	dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("receiver2:", 0x0B);
        //	//dis_pos += Strlen("receiver2:");
        //	disp_int(receiver_pid);
        // 调试函数
        //        assert(sender_pid == TASK_TTY || sender_pid == TASK_SYS || sender_pid == TASK_HD
        //                 || sender_pid == TASK_FS || sender_pid == ANY || sender_pid == INTERRUPT
        //                 || sender_pid == PROC_A || sender_pid == TASK_MM || sender_pid == INIT_PID);

        //	dis_pos = (dis_pos / 160 + 1) * 160;
        //	disp_str_colour("receiver flag:", 0x0C);
        //	disp_int(receiver->p_flag);
        //assert(receiver->p_flag == RECEIVING || receiver->p_flag == RUNNING);
        assert(receiver->p_flag == RECEIVING);
        //assert(receiver->p_msg == 0);
        assert(receiver->p_receive_from == sender_pid);

        block(receiver);
    }

    return 0;
}

// 系统调用--用汇编实现
// int send_msg(Message *msg, int receiver_pid)
// {

// }

// 系统调用--用汇编实现
// int receive_msg(Message *msg, int sender_pid)
// {

// }
// todo 以后去掉这个函数。
void disp_str_colour_debug(char *strr) {
}

// send_rec封装send_msg和receive_msg，直接被外部使用
// function：选择发送还是接收还是其他;pid，sender或receiver的进程id
int send_rec(int function, Message *msg, int pid) {

    // todo 调试
    //	dis_pos = 12000 - 128 + 10 + 320;
    //	//dis_pos += 160;
    //	disp_str_colour("send_rec pid:", 0x0C);
    //	disp_int(pid);

    //	assert(pid == TASK_TTY || pid == TASK_SYS || pid == TASK_HD
    //                 || pid == TASK_FS || pid == ANY || pid == INTERRUPT || pid == PROC_A
    //		 || pid == TASK_MM
    //		);
    assert(function == SEND || function == RECEIVE || function == BOTH);

    if (function == RECEIVE) {
        Memset(msg, 0, sizeof(Message));
    }

    int ret;
    switch (function) {
        case SEND:
            ret = send_msg(msg, pid);
            break;
        case RECEIVE:
            ret = receive_msg(msg, pid);
            break;
        case BOTH:
            // 两个函数都使用pid，正确吗？
            // 很费解。在send_msg中，pid是本进程投递消息的目标。
            // 在receive_msg中，pid是本进程要从哪个进程接收消息。
            ret = send_msg(msg, pid); // pid是receiver
            //while(proc_table[1].p_flag != RUNNING){

            //}
            //assert(proc_table[1].p_flag == RUNNING);
            if (ret == 0) {
                Memset(msg, 0, sizeof(Message));
                ret = receive_msg(msg, pid); // pid是sender
                // assert(msg->val != 0);
            }
            break;
        default:
            panic("function is invalid\n");
            break;
    }
    return 0;
}

// 阻塞进程
int block(Proc *proc) {
    // 判断，调试函数
    assert(proc->p_flag != RUNNING);
    schedule_process();
    return 0;
}

// 解除阻塞
int unblock(Proc *proc) {
    // do nothing
    assert(proc->p_flag == RUNNING);

    return 0;
}

int get_ticks_ipc() {
    //return ticks;
    Message msg;
    Memset(&msg, 0, sizeof(Message));
    //msg.source = 2;
    msg.type = TICKS_TASK_SYS_TYPE;
    msg.TYPE = TICKS_TASK_SYS_TYPE;
    int ret = send_rec(BOTH, &msg, 1);
    int ticks = msg.val;
    return ticks;
}

// 把整型数字转成指定进制的字符串
//void itoa(int value, char *str, int base)
char *itoa(int value, char **str, int base) {
    int remainder = value % base;
    int queotion = value / base;
    // 这是递归啊，怎么会用while呢？
    //while(queotion > 0){
    //	itoa(queotion, str, base);
    //}
    if (queotion) {
        itoa(queotion, str, base);
    }
    // *str++，是这样写吗？没有把握。不是！致命的常规错误，耗费了很长时间。
    // *str++ = remainder + '0';

    *((*str)++) = remainder + '0';
    return *str;
}
// ipc end

char *i2a(int val, int base, char **ps) {
    int m = val % base;
    int q = val / base;
    if (q) {
        i2a(q, base, ps);
    }
    *(*ps)++ = (m < 10) ? (m + '0') : (m - 10 + 'A');
    // 等价于
    // unsigned char c = (m < 10) ? (m + '0') : (m - 10 + 'A');
    // *ps++ = &c;

    return *ps;
}

void inform_int(int task_nr) {
    Proc *current = pid2proc(task_nr);
    // 思路：
    // 1. 如果目标进程是RECEIVING状态。
    // 1.1. 如果目标进程接收来自INTERUPT或ANY的消息，进入处理流程。
    // 1.2. 解除目标进程的阻塞。
    // 1.3. 改变目标进程的p_flag。
    // 1.4. 改变目标进程的消息源、消息体等。
    // 2. 如果目标进程不是RECEIVING状态，把该进程的成员has_int_msg设置成1。
    if (current->p_flag & RECEIVING) {
        if (current->p_receive_from == INTERRUPT || current->p_receive_from == ANY) {

            // todo 我并不理解把current的p_msg设置成这两个值在哪里会被用到。
            current->p_msg->source = INTERRUPT;
            current->p_msg->TYPE = HARD_INT;
            // todo 怎么往进程中塞进去一个变量？此处使用了未声明的变量msg，行不通。
            //		phycopy(v2l(current, msg), &msg2tty, sizeof(Message));
            // 只有一个办法通知TTY，接收到识别不了的TYPE，不终止进程。
            current->has_int_msg = 0;
            // todo 想不到更好的方法，只能这样做。
            // current->p_receive_from = NO_TASK;
            current->p_receive_from = NO_TASK;
            current->p_msg = 0;
            current->p_flag = RUNNING;
            unblock(current);
        }
    } else {
        current->has_int_msg = 1;
    }
}
