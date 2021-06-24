#ifndef _PEGASUS_OS_CONSOLE_H
#define _PEGASUS_OS_CONSOLE_H


// 当前tty
//TTY *current_tty;

typedef struct{
	unsigned int original_addr;
	unsigned int vm_limit;
	unsigned int start_video_addr;
	unsigned int cursor;
}CONSOLE;

typedef struct{
	unsigned int *head;
	unsigned int *tail;
	//unsigned char buf[TTY_BUF_SIZE];
	unsigned int buf[TTY_BUF_SIZE];
	unsigned int counter;

	CONSOLE *console;
}TTY;

TTY *current_tty;
TTY tty_table[TTY_NUM];
CONSOLE console_table[TTY_NUM];

#endif
