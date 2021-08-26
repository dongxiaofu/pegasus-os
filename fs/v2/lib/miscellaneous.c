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


int strcmp(char *str1, char *str2)
{
    if (str1 == 0 || str2 == 0)
    {
        return (str1 - str2);
    }

    char *p1 = str1;
    char *p2 = str2;

    for (; *p1 && *p2; p1++, p2++)
    {
        if (*p1 != *p2)
        {
            break;
        }
    }

    return (*p1 - *p2);
}


// 把整型数字转成指定进制的字符串
//void itoa(int value, char *str, int base)
char *itoa(int value, char **str, int base)
{
    int remainder = value % base;
    int queotion = value / base;
    // 这是递归啊，怎么会用while呢？
    //while(queotion > 0){
    //	itoa(queotion, str, base);
    //}
    if (queotion)
    {
        itoa(queotion, str, base);
    }
    // *str++，是这样写吗？没有把握。不是！致命的常规错误，耗费了很长时间。
    // *str++ = remainder + '0';

    *((*str)++) = remainder + '0';
    return *str;
}
// ipc end

char *i2a(int val, int base, char **ps)
{
    int m = val % base;
    int q = val / base;
    if (q)
    {
        i2a(q, base, ps);
    }
    *(*ps)++ = (m < 10) ? (m + '0') : (m - 10 + 'A');
    // 等价于
    // unsigned char c = (m < 10) ? (m + '0') : (m - 10 + 'A');
    // *ps++ = &c;

    return *ps;
}


void atoi(char *str, int num)
{
    //	char str2[20];
    char *p = str;
    *p++ = '0';
    *p++ = 'x';
    char ch;
    char flag = 0;

    if (num == 0)
    {
        *p++ = '0';
    }
    else
    {
        for (int i = 28; i >= 0; i -= 4)
        {
            ch = (num >> i) & 0xF;
            if (flag == 0 && ch == 0)
                continue;
            flag = 1;
            ch = ch + '0';
            if (ch > '9')
            {
                ch += 7;
            }
            *p++ = ch;
        }
    }

    *p = 0;
    //	Memcpy(str, str2, Strlen(str2));

    return;
}


void delay(int time)
{
    for (int i = 0; i < time; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            for (int k = 0; k < 1000; k++)
            {
            }
        }
    }
}


int sys_get_ticks()
{
    //disp_str("@@");

    return ticks;
}

void sys_write(char *buf, int len, Proc *proc)
{
    //TTY *tty = &tty_table[proc - proc_table];
    TTY *tty = &tty_table[proc->tty_index];
    int i = len;
    char *p = buf;
    while (i > 0)
    {
        out_char(tty, *p);
        p++;
        i--;
    }
}

void milli_delay(unsigned int milli_sec)
{
    int t = get_ticks_ipc();

    while (((get_ticks_ipc() - t) / 100 * 1000) < milli_sec)
    {
    }
}


int get_ticks_ipc()
{
    //return ticks;
    Message msg;
    Memset(&msg, 0, sizeof(Message));
    //msg.source = 2;
    msg.type = TICKS_TASK_SYS_TYPE;
    msg.TYPE = TICKS_TASK_SYS_TYPE;
    int ret = send_rec(BOTH, &msg, 1);
    int ticks = msg.val;
    return ticks;
}