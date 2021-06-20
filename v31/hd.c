#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keymap.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"
// 硬盘驱动
void TaskHD()
{
	Printf("%s\n", "HD driver is running!");
	// 初始硬盘
	init_hd();

	while(1){

	}
}

// 初始硬盘
void init_hd()
{
	// 获取硬盘数量
	char *buf = (char *)(0x475);
	Printf("Num:%d\n", *buf);
	// 打开8259A的从片级联设置
	enable_8259A_casecade_irq();
	// 打开硬盘中断
	enable_8259A_slave_winchester_irq();
}

void hd_handle()
{
	Printf("%s\n", "HD handle is running!");
	Message msg;	
	send_rec(RECEIVE, &msg, ANY);
	unsigned int type = msg.type;

	switch(type){
		case HD_DEV_OPEN:
			Printf("%s\n", "Open HD");
			break;
		default:
			Printf("%s\n", "Unknown Operation");
			break;
	}
}