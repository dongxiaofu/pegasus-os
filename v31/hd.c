// #include "main.h"

// 硬盘驱动
//
void TaskHD()
{
	Printf("%s\n", "HD driver is running!");
	char *buf = (char *)(0x475);
	Printf("Num:%d\n", *buf);

	while(1){

	}
}
