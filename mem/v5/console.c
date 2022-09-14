#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
//#include "keymap.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"


// console.c  start
// 设置console的start_video_addr
void set_cursor(unsigned int cursor);

void set_console_start_video_addr(unsigned int start_video_addr);

void flush(TTY *tty);

void select_console(unsigned char tty_index);

void put_key(TTY *tty, unsigned char key);

void scroll_up(TTY *tty);

void scroll_down(TTY *tty);

//void out_char(CONSOLE *console, unsigned char key);
void tty_dev_read(TTY *tty);

void tty_dev_write(TTY *tty);

void tty_do_read(TTY *tty, Message *msg);

void tty_do_write(TTY *tty, Message *msg);

void init_screen(TTY *tty);

void init_tty();
// console.c end

void select_console(unsigned char tty_index) {
    if (tty_index < 0 || tty_index > TTY_NUM - 1) {
        return;
    }

    // 不确定这个写法是否能达到预期目的
    current_tty = &tty_table[tty_index];

    flush(current_tty);
}

void flush(TTY *tty) {
    //set_cursor(VM_BASE_ADDR + tty->console->cursor);
    //set_cursor(tty->console->cursor + 1);
    set_cursor(tty->console->cursor);
    //set_cursor(0);
    //set_console_start_video_addr(VM_BASE_ADDR + tty->console->start_video_addr);
    set_console_start_video_addr(tty->console->start_video_addr);
}

void set_cursor(unsigned int cursor) {
    //cursor = 80;
    // 设置光标位置
    // Cursor Location High Register
    out_byte(0x3D4, 0x0E);
    out_byte(0x3D5, cursor >> 8);
    // Cursor Location Low Register
    out_byte(0x3D4, 0xF);
    out_byte(0x3D5, cursor);
}

void set_console_start_video_addr(unsigned int start_video_addr) {
    out_byte(0x3D4, 0xC);
    out_byte(0x3D5, start_video_addr >> 8);
    out_byte(0x3D4, 0xD);
    out_byte(0x3D5, start_video_addr);
}

/*====================================================
把数据放入tty的缓冲区。逻辑如下：
1. 缓冲区未满才放入。
2. 放入head，然后head向后移动一位。
3. counter++。
4. 检查，head == tty_buf_table + 缓冲区长度。
5. 如果上面的条件成立，重置 head = tty_buf_table。
======================================================*/
void put_key(TTY *tty, unsigned char key) {
    if (tty->counter < KEYBOARD_BUF_SIZE) {
        *(tty->head) = key;
        tty->head++;
        tty->counter++;
        if (tty->head == tty->buf + KEYBOARD_BUF_SIZE) {
            tty->head = tty->buf;
        }
    }
}

/*====================================================
把tty的屏幕向上滚动一屏。逻辑如下：
1. 如果终端的start_video_addr > original_addr，那么，可以向上滚屏。
2. start_video_addr 是 SCREEN_SIZE 的倍数。
3. 滚屏，涉及到寄存器操作。
======================================================*/
void scroll_up(TTY *tty) {
    // if (tty->console->start_video_addr > tty->console->original_addr) {
    if (tty->console->start_video_addr - SCREEN_WIDTH > tty->console->original_addr) {
        // set_console_start_video_addr(tty->console->start_video_addr - SCREEN_SIZE);
        set_console_start_video_addr(tty->console->start_video_addr - SCREEN_WIDTH);
    }
}

/*====================================================
把tty的屏幕向下滚动一屏。逻辑如下：
1. 剩余的显存大于一屏的空间。
2. 记得不牢，需要再次分析、计算。
3. 剩余的显存大于一屏的空间，怎么写代码？
======================================================*/
// void scroll_down(TTY *tty) {
//     if (tty->console->start_video_addr + 2 * SCREEN_SIZE < tty->console->original_addr + tty->console->vm_limit) {
//         set_console_start_video_addr(tty->console->start_video_addr + SCREEN_SIZE);
//         tty->console->start_video_addr += SCREEN_SIZE;
//     }
// }

void scroll_down(TTY *tty) {
    if (tty->console->start_video_addr + SCREEN_WIDTH < tty->console->original_addr + tty->console->vm_limit) {
        set_console_start_video_addr(tty->console->start_video_addr + SCREEN_WIDTH);
        tty->console->start_video_addr += SCREEN_WIDTH;
    }
}
/*====================================================
耗费最多时间。
把字符写入显存，代替disp_str。逻辑如下：
1. 换行符。最费劲。我的理解，仍有点不透彻。
2. 退格符。
3. 普通字符。
======================================================*/
void out_char(TTY *tty, unsigned char key)
//void out_char(CONSOLE *console, unsigned char key)
{
    // unsigned int addr_in_vm = VM_BASE_ADDR + tty->console->cursor * 2;
    //(unsigned char*) addr_in_vm = (unsigned char *)(VM_BASE_ADDR + tty->console->cursor * 2);
    //unsigned char* addr_in_vm = (unsigned char *)(VM_BASE_ADDR + console->cursor * 2);
    //unsigned char* addr_in_vm = (unsigned char *)(console->cursor * 2);
    //unsigned char* addr_in_vm = (unsigned char *)(console->cursor);
    unsigned char *addr_in_vm = (unsigned char *) (VM_BASE_ADDR + tty->console->cursor * 2);
    //unsigned char* addr_in_vm = (unsigned char *)(VM_BASE_ADDR + 0);

    //key = 'C';
    switch (key) {
        case '\n':
            // 换行
            // 看了于上神的代码，我才写出来。唉-----
            if (tty->console->cursor < tty->console->original_addr + tty->console->vm_limit - SCREEN_WIDTH) {
                tty->console->cursor = tty->console->original_addr +
                                       ((tty->console->cursor - tty->console->original_addr) / SCREEN_WIDTH + 1) *
                                       SCREEN_WIDTH;
            }
            break;
        case '\b':
            // 退格
            //if(tty->console->cursor > 0){
            if (tty->console->cursor > tty->console->original_addr) {
                //*(addr_in_vm - 1) = ' ';
                //*(addr_in_vm - 2) = 0x00;//DEFAULT_COLOUR;
                tty->console->cursor--;
                *(addr_in_vm - 2) = ' ';
                *(addr_in_vm - 1) = 0x00;
                //set_cursor(0);
                //tty->console->cursor--;
            }
            break;
        default:
            //普通字符
            // 也看了于上神的代码。这个分支，我完全能独立写出来。不要依赖别人代码。
            // 总看别人的代码，那么，这是我自己写的还是抄别人的？
            // 实在实在想不出来，再去看别人的。
            // 这个分支，完全只是普通的逻辑，没有任何领域知识。我应该完全能够独立写出来。
            if (tty->console->cursor + 1 < tty->console->original_addr + tty->console->vm_limit) {
                //key = 'F';
                //*(addr_in_vm + 2) = key;
                *addr_in_vm++ = key;
                //*(addr_in_vm + 1) = key;
                //*(addr_in_vm + 2) = DEFAULT_COLOUR;
                //*(addr_in_vm + 1) = DEFAULT_COLOUR;
                *addr_in_vm++ = DEFAULT_COLOUR;
                tty->console->cursor++;
                //console->cursor = console->cursor + 1;
            }
            break;
    }

    // 有bug，导致只能打印部分字符。故，暂时不滚屏。
    // 向下滚屏
    // 什么时候需要滚屏？我又不记得了。独立分析出来！
    // 超过一屏数据时，需要滚屏。
    while (tty->console->cursor - tty->console->start_video_addr > SCREEN_SIZE) {
        scroll_down(tty);
    }

    flush(tty);
}

/*====================================================
把数据从键盘缓冲区读出来放到tty缓冲区。逻辑如下：
1. 键盘缓冲区有数据才读。
2. 遇到ENTER转换成\n。
3. 遇到BACKSPACE转换成\b。
3. 用put_key放入tty缓冲区。
======================================================*/
void tty_dev_read(TTY *tty) {
    // if条件，似乎可以不要
    if (tty == current_tty && keyboard_buffer.counter > 0) {
        keyboard_read(tty);
    }
}

/*====================================================
======================================================*/
void tty_dev_write(TTY *tty) {
	int req_cnt = tty->left_cnt; 
    while (tty->counter > 0) {
	//int req_cnt = tty->left_cnt; 
        unsigned char key = *(tty->tail);
        //key = 'F';
        tty->tail++;
        tty->counter--;
        if (tty->tail == tty->buf + KEYBOARD_BUF_SIZE) {
            tty->tail = tty->buf;
        }
// todo 调试使用，等全部功能结束后，可能要注释掉。
//        out_char(tty, key);

	//dis_pos = 12000 + 160 * 20;
//	dis_pos = 12000 - 128 + 180 * 13;
//	disp_str_colour("tty->left_cnt:", 0x0D);
//	disp_int(tty->left_cnt);
//	//Printf("tty->left_cnt = %d\n", tty->left_cnt);
        // 把数据从终端缓冲区读取到用户进程
        if (tty->left_cnt) {
            // 是可打印字符
            // if ('!' <= key && key <= '~') {
            // 上面的判断不能把空格符合空字符发送给用户进程。
            if (('!' <= key && key <= '~') || (key == ' ' || key == 0)) {
                // 复制数据
                // phycopy(tty->req_buf + tty->tran_cnt, key, 1);
                phycopy(tty->req_buf + tty->tran_cnt, v2l(TASK_TTY, &key), 1);
                tty->left_cnt--;
                tty->tran_cnt++;

                //key = 'B';
                out_char(tty, key);
            } else if (key == 8) {// 是退格符
                tty->left_cnt++;
                tty->tran_cnt--;

                // 对缓冲区有没有影响？

                out_char(tty, key);
            } else if (key == '\n' || tty->tran_cnt == req_cnt) {// 是换行符或达到需要的长度

	//	char end_flag = 0;
        //        phycopy(tty->req_buf + tty->tran_cnt, v2l(TASK_TTY, &end_flag), 1);
        //        tty->left_cnt--;
        //        tty->tran_cnt++;
		//Printf("tty resume, pcaller = %x \n", tty->pcaller);
                out_char(tty, key);
//                tty->left_cnt = 0;
//                tty->tran_cnt = 0;

                // IPC返回
                // todo 这里，需要补充，把tty的req_buf中存储的数据放到msg中，然后发送给用户进程。
                Message msg;
                msg.TYPE = RESUME_PROC;
                // 能用msg.RETVAL = tty->tran_cnt 吗?
                msg.CNT = tty->tran_cnt;
                msg.PROCNR = tty->procnr;
                msg.BUF = tty->req_buf;

                tty->left_cnt = 0;
                tty->tran_cnt = 0;


                send_rec(SEND, &msg, tty->pcaller);

		// todo	本次读操作结束。
		return;
            }
        }
    }
}

void tty_do_read(TTY *tty, Message *msg) {

    // 设置tty的一些成员变量
    tty->tran_cnt = 0;
    tty->procnr = msg->PROCNR;
    tty->pcaller = msg->source;
    tty->left_cnt = msg->CNT;
	//Memset(tty->req_buf, 0, Strlen(tty->req_buf));
	// todo 似乎行不通。用户进程，例如INIT的msg并没有通过FS传递给本进程。
    tty->req_buf = v2l(tty->procnr, msg->BUF);

	//Printf("\tty read %d return\n", tty->left_cnt);
    // IPC返回
    msg->TYPE = SUPEND_PROC;
    send_rec(SEND, msg, tty->pcaller);
}

/*====================================================
* 主要思路：把用户进程中的数据复制到TTY进程，然后逐个字符输出。
* 我的疑问：
 * 1. 需要处理tty的left_cnt这些成员吗？

======================================================*/
void tty_do_write(TTY *tty, Message *msg) {
    int TTY_WRITE_BUF_SIZE = 128;
    char buf[TTY_WRITE_BUF_SIZE];
	Memset(buf, 0, TTY_WRITE_BUF_SIZE);
    // 用户进程要向终端写入多少字符。
    int cnt = msg->CNT;
	// todo 第二次调用write写终端无效果，是因为，tty->tran_cnt继承了上一个write写终端
	// 的值。例如，本次要写的字符串的长度是3，上一次执行write写终端后tty->tran_cnt是4，
	// 从本次字符串的4开始读取字符，自然读取不到数据。
	tty->tran_cnt = 0;

    // 把用户进程的数据复制到TTY进程，然后输出。
    while (cnt) {
        int bytes = MIN(cnt, TTY_WRITE_BUF_SIZE);
        // in expansion of macro 'BUF'
        // phycopy(buf, v2l(msg->PROCNR, msg->BUF) + tty->tran_cnt, bytes);
        phycopy(buf, v2l(msg->PROCNR, (char *) msg->BUF) + tty->tran_cnt, bytes);
        cnt -= bytes;
        tty->tran_cnt += bytes;
        int i = 0;
        while (bytes) {
            out_char(tty, buf[i]);
            i++;
            bytes--;
        }
    }
    // IPC返回
    // todo 能沿用上面的msg吗？
    Message msg2FS;
    msg2FS.TYPE = SYSCALL_RET;
    msg2FS.RETVAL = tty->tran_cnt;
    send_rec(SEND, &msg2FS, msg->source);
}

/*====================================================
初始化CONSOLE。逻辑如下：
1. 难点是，如何确定original_addr?
需要确定，是第几个console。
======================================================*/
//void init_screen(CONSOLE *console)
void init_screen(TTY *tty) {
    unsigned int index = tty - tty_table;
    //CONSOLE *console = &console_table[index];
    tty->console = console_table + index;

    // 把字节数转换为字
    unsigned video_mem_size_by_word = VM_TOTAL >> 1;

    // 单位转换为字
    tty->console->vm_limit = video_mem_size_by_word / TTY_NUM;

    //tty->console->original_addr = VM_BASE_ADDR + index * tty->console->vm_limit;
    tty->console->original_addr = index * tty->console->vm_limit;

    //tty->console->cursor = tty->console->start_video_addr = tty->console->original_addr;
    tty->console->cursor = tty->console->start_video_addr = tty->console->original_addr;

    if (index > 0) {
        //disp_str("#");
        //disp_int(index + 1);
        //tty->console->cursor += 2;
    }
}

/*====================================================
初始tty。逻辑如下：

======================================================*/
void init_tty() {
    for (TTY *tty = tty_table; tty < tty_table + TTY_NUM; tty++) {
        // 初始化缓冲区
        tty->head = tty->tail = tty->buf;
        tty->counter = 0;
        // 初始化console
        init_screen(tty);
        if (tty - tty_table > 0) {
            out_char(tty, '#');
            out_char(tty, 49 + tty - tty_table);
            //tty->console->cursor++;

        }
    }
}

void TaskTTY() {
	disp_str("TASK_TTY\n");
	while(1);
    //keyboard_buffer.buf[0] = 0x1E;
    //keyboard_buffer.buf[1] = 0x30;
    //keyboard_buffer.buf[2] = 0x2E;
    //keyboard_buffer.buf[3] = 0x20;
    //keyboard_buffer.buf[4] = 0x12;
    //keyboard_buffer.tail = keyboard_buffer.head = keyboard_buffer.buf;
    //keyboard_buffer.counter = 5;

    // // 设置光标位置
    // Cursor Location High Register
    //out_byte(0x3D4, 0x0E);
    ////out_byte(0x3D5, ((VM_BASE_ADDR + dis_pos)/2) >> 8);
    //out_byte(0x3D5, (VM_BASE_ADDR) >> 8);
    //// Cursor Location Low Register
    //out_byte(0x3D4, 0xF);
    ////out_byte(0x3D5, (VM_BASE_ADDR + dis_pos)/2);
    //out_byte(0x3D5, VM_BASE_ADDR);


    init_tty();
    select_console(1);
    ////Printf("T:%x", 3);
    int m = 0;
	int d = 0;
    while (1) {
        for (TTY *tty = tty_table; tty < tty_table + TTY_NUM; tty++) {
            do {
                tty_dev_read(tty);
                tty_dev_write(tty);
            } while (tty->counter);
        }

//	dis_pos = 12000 - 128 + 360 * 7;
//	disp_str_colour("Enter tty:", 0x0D);
//	m++;
//	disp_int(m);
        Message msg;
        send_rec(RECEIVE, &msg, ANY);
        int type = msg.TYPE;
//	dis_pos = 12000 - 128 + 180 * 15 - 40;
//	disp_str_colour("Enter tty after type", 0x0D);
//	disp_int(type);
//	dis_pos = 12000 + 180 * 16;
//	disp_str_colour("0-tty->left_cnt:", 0x0D);
	
	if(msg.source == TASK_FS){
	//	//Printf("FS is calling\n");
	}

        //int type = msg.TYPE;
//	//Printf("tty type===%d\n", type);

        switch (type) {
            case DEV_OPEN:
                // 我以为，没必要实现。
                break;
            case DEV_READ:
                tty_do_read(current_tty, &msg);
                break;
            case DEV_WRITE:
                tty_do_write(current_tty, &msg);
                break;
		case HARD_INT:
			key_pressed = 0;
			continue;
            default:
               //Printf("Unknown tty message type");
               // 当接收到clock_handler中发送的通知时，需要继续运行本进程，所以，此处
               // 不能终止。
               continue;
               // break;
        }
    }
}
