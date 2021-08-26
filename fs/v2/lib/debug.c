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


// debug start
void printx(char *fmt, ...) {
    char buf[256];
    char *var_list = (char *) ((char *) &fmt + 4);
    int len = vsprintf(buf, fmt, var_list);
    write_debug(buf, len);
}

// 系统调用，使用汇编代码实现
// void write_debug(char *buf, int len);
void sys_printx(char *error_msg, int len, Proc *proc)
//void sys_printx(char *error_msg, int caller_pid)
{
    int line_addr;
    int base;
    //Proc *proc = pid2proc(caller_pid);

    if (k_reenter == 0) {
        int ds = proc->s_reg.ds;
        base = Seg2PhyAddrLDT(ds, proc);
    } else if (k_reenter > 0) {
        base = Seg2PhyAddr(DS_SELECTOR);
    }
    // line_addr = base + error_msg;
    // line_addr = base + (int *)error_msg;
    line_addr = base + (int) error_msg;

    // 打印字符串
    TTY *tty = &tty_table[proc->tty_index];
    char *p = (char *) line_addr;
    char magic = *p;
    while (len > 0) {
        if (*p == ASSERT_MAGIC || *p == PANIC_MAGIC) {
            p++;
            continue;
        }
        out_char(tty, *p);
        p++;
        len--;
    }
    // 字符串中有空格时不能打印出来
    //while(*p != '\0'){
    //	if(*p == ASSERT_MAGIC || *p == PANIC_MAGIC){
    //		p++;
    //		continue;
    //	}
    //	out_char(tty, *p);
    //	p++;
    //}

    //char magic = error_msg[0];
    if (magic == ASSERT_MAGIC) {
        if (k_reenter > 0) {
            disable_int();
            __asm__("hlt");
        } else {
        }
    } else if (magic == PANIC_MAGIC) {
        disable_int();
        __asm__("hlt");
    }

    return;
}


void spin(char *error_msg) {
    while (1) {
    }
}

void panic(char *error_msg) {
    printx("%c%s\n", PANIC_MAGIC, error_msg);
    //Printf("%c%s\n", PANIC_MAGIC, error_msg);
}

void assertion_failure(char *exp, char *filename, char *base_filename, unsigned int line) {
    // todo %d还未实现或者有问题。
    printx("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
            //Printf("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
           ASSERT_MAGIC, exp, filename, base_filename, line);
    spin("Stop Here!\n");
    return;
}

// debug end