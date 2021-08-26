#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"





// 只支持%x
void Printf(char *fmt, ...)
{
    char buf[256];
    Memset(buf, 0, 256);
    // 理解这句，耗费了大量时间。
    char *var_list = (char *)((char *)&fmt + 4);
    int len = vsprintf(buf, fmt, var_list);
    //char str[2] = {'A', 0};
    //len = 2;
    // todo 想办法不使用硬编码0。0是文件描述符。
    write(0, buf, len);
//    write2(buf, len);
    return;
}



void disp_int(int num)
{
    //char *str = "";
    char str[10];
    //	Memset(str, 0, sizeof(str));
    atoi(str, num);
    //disp_str_colour("ABC", 0x0A);
    // disp_str(str);
    //char str2[20] = "0x57";
    disp_str_colour(str, 0x0B);
    //return;
}


