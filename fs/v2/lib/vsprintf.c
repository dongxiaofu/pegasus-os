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


int vsprintf(char *buf, char *fmt, char *var_list) {
    // 指向buf
    char *p;
    // 必须作为全局变量。如果作为局部变量，然后初始化，会覆盖其他数据。
    // 目前的内存机制，就是这样。
    //char inner_buf[DEFAULT_STR_SIZE];
    // Memset(inner_buf, 0, DEFAULT_STR_SIZE);
    char inner_buf[DEFAULT_STR_SIZE];
    char *str = inner_buf;
    // 转换数字使用
    // 使用256会导致gdt中的数据被擦除，从而导致各种奇怪的问题，比如，proc_ready_table中的数据被修改。
    // 耗费了八个小时左右才发现这个问题。
    //char tmp[256];
    //char tmp[128];
    char tmp[64];
    //char tmp[4];
    //return 0;
    Memset(tmp, 0, sizeof(tmp));
    //Memset(tmp, 0, 256);
    char *next_arg = var_list;
    int len2 = 0;
    for (p = buf; *fmt; fmt++) {
        if (*fmt != '%') {
            *p++ = *fmt;
            //p++;
            continue;
        }
        // 跳过%
        fmt++;
        switch (*fmt) {
            //case 'd':;
            case 'd': {
                int m = *(int *) next_arg;
                itoa(m, &str, 10);
                //i2a(m, 10, &str);
                //Strcpy(p, str);
                Strcpy(p, inner_buf);
                next_arg += 4;
                // len2 = Strlen(str);
                len2 = Strlen(inner_buf);
                p += len2;
                break;
            }
            case 'x':
                atoi(tmp, *(int *) next_arg);
                //Strcpy(buf, tmp);
                Strcpy(p, tmp);
                next_arg += 4;
                len2 = Strlen(tmp);
                p += len2; //Strlen(tmp);
                break;
            case 's':
                //char *str = *(char **)next_arg;
                Strcpy(p, *(char **) next_arg);
                len2 = Strlen(*(char **) next_arg);
                next_arg += 4;
                //len2 = 6;//Strlen(*(char **)next_arg);
                p += len2; //Strlen(tmp);
                break;
            case 'c':
                //char c = *(char *)next_arg;
                *p = *(char *) next_arg;
                next_arg += 4;
                len2 = 1;
                p += len2; //Strlen(tmp);
                break;
            default:
                break;
        }
    }

    return (p - buf);
}