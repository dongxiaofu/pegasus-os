#include "string.h"
#include "hd.h"

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
}
