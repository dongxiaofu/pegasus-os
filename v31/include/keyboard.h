#ifndef _PEGASUS_OS_KEYBOARD_H
#define _PEGASUS_OS_KEYBOARD_H


// 键盘 start
// 键盘中断例程的中间代码
// #define KEYBOARD_BUF_SIZE 10; // 不能有逗号
#define KEYBOARD_BUF_SIZE 800
// 中断例程的缓冲区结构体
typedef struct{
	unsigned char *head;
	unsigned char *tail;
	int counter;
	unsigned char buf[KEYBOARD_BUF_SIZE];
}KeyboardBuffer;
// 中断例程的缓冲区
KeyboardBuffer keyboard_buffer;
// 从端口读取一个字节，汇编函数
unsigned char in_byte(unsigned short port);
void out_byte(unsigned int port, unsigned short value);
void keyboard_handler();
// 从中断例程的缓冲区读取数据
void keyboard_read(TTY *tty);

// 从中断例程的缓冲区读取一个字符，供keyboard_read调用
unsigned char read_from_keyboard_buf();
// 扫描码是不是0xE0
unsigned char is_e0;
// 扫描码是不是左右shift
unsigned char is_shift;
// 是否打印字符
unsigned char is_disp;
// 初始化键盘中断例程
void init_keyboard_handler();
// shift_r、shift_l等特权常量，值是它们的Make Code
// 和keymap.h中的定义重复了，故在后面加了1
#define SHIFT_R1 0x36
#define SHIFT_L1 0x2A

// 打印扫描码等功能
void in_process(TTY *tty, unsigned int key);

// 键盘 end

#endif