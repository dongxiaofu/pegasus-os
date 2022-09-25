#ifndef _PEGASUS_OS_CONSOLE_H
#define _PEGASUS_OS_CONSOLE_H


// 当前tty
//TTY *current_tty;

typedef struct {
    unsigned int original_addr;
    unsigned int vm_limit;
    unsigned int start_video_addr;
    unsigned int cursor;
} CONSOLE;

typedef struct {
    unsigned int *head;
    unsigned int *tail;
    //unsigned char buf[TTY_BUF_SIZE];
    unsigned int buf[TTY_BUF_SIZE];
    unsigned int counter;

    // 还剩余多少字符需要传输。
    unsigned int left_cnt;
    // 已经传输了多少字符。
    unsigned int tran_cnt;
	// 需要传输多少字符。
    unsigned int want_cnt;
    // 接收字符的变量的线性地址。
    unsigned int req_buf;
    // 向TTY发送IPC请求的进程的pid。
    unsigned int pcaller;
    // 通过FS操作TTY的进程的pid。
    unsigned int procnr;

    CONSOLE *console;
} TTY;

TTY *current_tty;
TTY tty_table[TTY_NUM];
CONSOLE console_table[TTY_NUM];

#endif
