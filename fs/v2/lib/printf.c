





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

int vsprintf(char *buf, char *fmt, char *var_list)
{
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
    for (p = buf; *fmt; fmt++)
    {
	if (*fmt != '%')
	{
	    *p++ = *fmt;
	    //p++;
	    continue;
	}
	// 跳过%
	fmt++;
	switch (*fmt)
	{
	//case 'd':;
	case 'd':
	{
	    int m = *(int *)next_arg;
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
	    atoi(tmp, *(int *)next_arg);
	    //Strcpy(buf, tmp);
	    Strcpy(p, tmp);
	    next_arg += 4;
	    len2 = Strlen(tmp);
	    p += len2; //Strlen(tmp);
	    break;
	case 's':
	    //char *str = *(char **)next_arg;
	    Strcpy(p, *(char **)next_arg);
	    len2 = Strlen(*(char **)next_arg);
	    next_arg += 4;
	    //len2 = 6;//Strlen(*(char **)next_arg);
	    p += len2; //Strlen(tmp);
	    break;
	case 'c':
	    //char c = *(char *)next_arg;
	    *p = *(char *)next_arg;
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


// debug start
void printx(char *fmt, ...)
{
    char buf[256];
    char *var_list = (char *)((char *)&fmt + 4);
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

    if (k_reenter == 0)
    {
        int ds = proc->s_reg.ds;
        base = Seg2PhyAddrLDT(ds, proc);
    }
    else if (k_reenter > 0)
    {
        base = Seg2PhyAddr(DS_SELECTOR);
    }
    // line_addr = base + error_msg;
    // line_addr = base + (int *)error_msg;
    line_addr = base + (int)error_msg;

    // 打印字符串
    TTY *tty = &tty_table[proc->tty_index];
    char *p = (char *)line_addr;
    char magic = *p;
    while (len > 0)
    {
        if (*p == ASSERT_MAGIC || *p == PANIC_MAGIC)
        {
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
    if (magic == ASSERT_MAGIC)
    {
        if (k_reenter > 0)
        {
            disable_int();
            __asm__("hlt");
        }
        else
        {
        }
    }
    else if (magic == PANIC_MAGIC)
    {
        disable_int();
        __asm__("hlt");
    }

    return;
}


void spin(char *error_msg)
{
    while (1)
    {
    }
}

void panic(char *error_msg)
{
    printx("%c%s\n", PANIC_MAGIC, error_msg);
    //Printf("%c%s\n", PANIC_MAGIC, error_msg);
}

void assertion_failure(char *exp, char *filename, char *base_filename, unsigned int line)
{
    // todo %d还未实现或者有问题。
    printx("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
           //Printf("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
           ASSERT_MAGIC, exp, filename, base_filename, line);
    spin("Stop Here!\n");
    return;
}

// debug end
