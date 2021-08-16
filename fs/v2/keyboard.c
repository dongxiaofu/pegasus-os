#include "const.h"
#include "stdio.h"
#include "type.h"
#include "protect.h"
#include "console.h"
#include "process.h"
#include "proto.h"
#include "string.h"
#include "keymap.h"
#include "global.h"
#include "keyboard.h"


// 键盘 start
void keyboard_handler()
{
	key_pressed = 1;
	//char scan_code = in_byte(0x60);
	//disp_int(scan_code);
	int port = 0x60;
	if(keyboard_buffer.counter < KEYBOARD_BUF_SIZE){
		//unsigned char scan_code = 0x9E;//in_byte(port);
		disable_int();
		// 耗费了巨量时间
		unsigned char scan_code = in_byte(port);
		//scan_code = scan_code;
		//disp_int(scan_code);
		*(keyboard_buffer.head) = scan_code;//in_byte(port);
		keyboard_buffer.head++;
		keyboard_buffer.counter++;
		//if(keyboard_buffer.counter == KEYBOARD_BUF_SIZE){
		//if(keyboard_buffer.head > keyboard_buffer.buf + KEYBOARD_BUF_SIZE){
		if(keyboard_buffer.head >= keyboard_buffer.buf + KEYBOARD_BUF_SIZE){
			keyboard_buffer.head = keyboard_buffer.buf;
		}
		enable_int();
	}
}

unsigned char read_from_keyboard_buf()
//void keyboard_read()
{
	unsigned char scan_code = 0;
	if(keyboard_buffer.counter > 0){
		disable_int();
		//char scan_code = *(keyboard_buffer.tail);
		scan_code = *(keyboard_buffer.tail);

		//disp_int(scan_code);

		keyboard_buffer.tail++;
		keyboard_buffer.counter--;
		//if(keyboard_buffer.counter == 0){
		//if(keyboard_buffer.tail > keyboard_buffer.buf + KEYBOARD_BUF_SIZE){
		if(keyboard_buffer.tail >= keyboard_buffer.buf + KEYBOARD_BUF_SIZE){
			keyboard_buffer.tail = keyboard_buffer.buf;
		}
		enable_int();
	}
	
	return scan_code;
}

void keyboard_read(TTY *tty)
{
	while(keyboard_buffer.counter <= 0){
	}
	unsigned char scan_code = read_from_keyboard_buf();
	// 从映射数组中解析出来的值
	unsigned int key = 0;
	unsigned char make = 0;
	//scan_code = 0x30;
	if(scan_code == 0xE1){
		// 解析Pause
		unsigned char make_code[6] = {0xE1, 0x1D, 0x45, 0xE1, 0x9D, 0xC5};
		char is_pause = 1;
		for(int i = 1; i < 6; i++){
			if(read_from_keyboard_buf() != make_code[i]){
				is_pause = 0;
				break;
			}
		}	
		
		if(is_pause){
			key = PAUSE; 
		}

	}else if(scan_code == 0xE0){
		// 按下
		if(read_from_keyboard_buf() == 0x2A){
			if(read_from_keyboard_buf() == 0xE0){
				if(read_from_keyboard_buf() == 0x37){
					key = PRINT_SCREEN;
					make = 1;
				}
			}
		}

		// 松开
		if(read_from_keyboard_buf() == 0xB7){
			if(read_from_keyboard_buf() == 0xE0){
				if(read_from_keyboard_buf() == 0xAA){
					key = PRINT_SCREEN;
					make = 0;
				}
			}
		}

		if(key == 0){
			is_e0 = 1;
		}
	}

	if(key != PAUSE && key  != PRINT_SCREEN){

		if(scan_code == SHIFT_R1 | scan_code == SHIFT_L1){
			is_shift = 1;
		}

		// 是不是Make Code
		make = (scan_code & 0x80) ? 0 : 1;
		//if(is_shift != 1 && make){
		if(scan_code && make){
			unsigned char cols = 0;
			if(is_shift == 1){
				cols = 1;
				//is_shift = 0;
				//is_disp = 0;
			}
			// is_e0 == 1 不等价于 is_e0
			// 上面说错了 is_e0 是0，if不成立；is_e0非0，if成立。
			//if(is_e0 == 1){
			if(is_e0){
				cols = 2;
				//is_e0 = 0;
				//is_disp = 0;
			}
			key = keymap[MAP_COLS * scan_code + cols];
			//if(scan_code != SHIFT_L1 && scan_code != SHIFT_R1){
			//	unsigned char ch[2];
			//	Memset(ch, 0, 2);
			//	ch[0] = keymap[MAP_COLS * scan_code + cols];
			//	disp_str(ch);
			//	is_shift = 0;
			//	is_e0 = 0;
			//}
			// 处理字符打印等
			// todo key，在上面处理
			in_process(tty, key);
		}
	}	
}

void init_keyboard_handler()
{
	//unsigned char is_e0 = 0;
	//如果用上面的语句创建is_e0，是局部变量，没有修改全局变量is_e0的值。
	is_e0 = 0;
	//unsigned char is_shift = 0;
	is_shift = 0;
	//unsigned char is_disp = 1;
	//dis_pos = 0;
}

void in_process(TTY *tty, unsigned int key)
{
	// 一个字符占用2个字节。需填充15行。
	// 每行80个字节，共25行。
	// 每行需打印40个字符。
	//for(int i = 0; i < 40*15; i++){
	//	disp_str("A");
	//}
	// 打印字符
	unsigned char ch[2];
	Memset(ch, 0, 2);
	if(!(key & FLAG_EXT)){
		// ch[0] = key;
		// out_char(tty->console, key);
		put_key(tty, key);

		// disp_str(ch);
		
		// //disp_str("pos:");
		// //disp_int(dis_pos);
		// // 设置光标位置
		// // Cursor Location High Register
		// out_byte(0x3D4, 0x0E);
		// out_byte(0x3D5, (dis_pos/2) >> 8);
		// // Cursor Location Low Register
		// out_byte(0x3D4, 0xF);
		// out_byte(0x3D5, dis_pos/2);
		
		// 没有想到更好的方法，只能放到这个函数中，下策。
		is_e0 = 0;
		is_shift = 0;
	}else{
		if(is_shift && (key != SHIFT_L1 && key != SHIFT_R1)){
			switch(key){
				case UP:
					// out_byte(0x3D4, 0xC);
					// out_byte(0x3D5, (80*15) >> 8);
					// out_byte(0x3D4, 0xD);
					// out_byte(0x3D5, 80*15);

					scroll_up(tty);

					is_shift = 0;
					is_e0 = 0;
					break;
				case DOWN:
					
					// out_byte(0x3D4, 0xC);
					// out_byte(0x3D5, (80*0) >> 8);
					// out_byte(0x3D4, 0xD);
					// out_byte(0x3D5, 80*0);

					scroll_down(tty);

					is_shift = 0;
					is_e0 = 0;
					break;
				case ENTER:
					out_char(tty, '\n');
					break;
				case BACKSPACE:
					out_char(tty, '\b');
					break;
				default:
					// 这个break必须有，否则，会报下面的错误。
					// main.c:1053:5: error: label at end of compound statement
					//is_shift = 0;
					//is_e0 = 0;
					break;
					
			}
			//is_shift = 0;
			//is_e0 = 0;
		}else{
			switch(key){
				case ENTER:
					//out_char(tty->console, '\n');
					put_key(tty, '\n');
					break;
				case BACKSPACE:
					//out_char(tty->console, '\b');
					put_key(tty, '\b');
					break;
				case F1:
					select_console(0);
					break;
				case F2:
					select_console(1);
					break;
				case F3:
					select_console(2);
					break;
				default:
					break;
			}
		}	
	}	
	key_pressed = 0;
}

// 键盘 end
