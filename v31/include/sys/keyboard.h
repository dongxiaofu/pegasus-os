#ifndef _PEGASUS_OS_KEYBOARD_H
#define _PEGASUS_OS_KEYBOARD_H

// 键盘 start
// 键盘中断例程的中间代码
// 中断例程的缓冲区结构体
typedef struct{
	unsigned char *head;
	unsigned char *tail;
	int counter;
	unsigned char buf[KEYBOARD_BUF_SIZE];
}KeyboardBuffer;
// 中断例程的缓冲区
KeyboardBuffer keyboard_buffer;


// 扫描码是不是0xE0
unsigned char is_e0;
// 扫描码是不是左右shift
unsigned char is_shift;
// 是否打印字符
unsigned char is_disp;


// 键盘 end

#endif