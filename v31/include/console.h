#ifndef _PEGASUS_OS_CONSOLE_H
#define _PEGASUS_OS_CONSOLE_H

#define TTY_BUF_SIZE 800
#define TTY_NUM 3
// 一屏占用的显存空间。
// todo 我不确定是不是整个值。
#define SCREEN_SIZE 80 * 25
// 一行的宽度
#define SCREEN_WIDTH 80
// 显存的初始地址
#define VM_BASE_ADDR 0xb8000
// 显存的总大小
#define VM_TOTAL (0xBFFFF - 0xb8000)
// 打印字符的默认颜色
#define DEFAULT_COLOUR 0x0A
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

// 设置console的start_video_addr
void set_cursor(unsigned int cursor);
void set_console_start_video_addr(unsigned int start_video_addr);
void flush(TTY *tty);
void select_console(unsigned char tty_index);
void put_key(TTY *tty, unsigned char key);
void scroll_up(TTY *tty);
void scroll_down(TTY *tty);
void out_char(TTY *tty, unsigned char key);
//void out_char(CONSOLE *console, unsigned char key);
void tty_do_read(TTY *tty);
void tty_do_write(TTY *tty);
void init_screen(TTY *tty);
void init_tty();


#endif
