#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "global.h"


// 这些函数的函数声明应该放在哪个文件？
// 先搁置吧。
int exec(const char *pathname) {
    Message msg;

    msg.TYPE = EXEC;
    msg.PATHNAME = pathname;
    msg.NAME_LEN = Strlen(pathname);
    msg.BUF = 0;
    msg.BUF_LEN = 0;

    send_rec(BOTH, &msg, TASK_MM);

    assert(msg.TYPE == SYSCALL_RET);

    return msg.RETVAL;
}

int execv(const char *pathname, char **argv) {
    // 主要思路：
    // 1. 创建一个数组，数组的内容分为A、B、C三部分。
    // 2. A是C所占据的内存空间的内存地址。
    // 3. B是空字符，把A和C分隔开。
    // 这不是我想出来的思路，是我看了于上神的代码后总结出来的。这也是业务逻辑。
    // 这只是大概思路，怎么实现，这才是重点和难点。
    // 怎么实现?
    // 1. 声明一个数组。
    // 2. 遍历argv，统计A的长度。A的长度等于argv中元素的数量 * sizeof(char *)。
    // 3. 为啥这样计算？因为，A的长度是指针占用的内存空间的长度。
    // 4. 统计A的长度。
    // 5. 从A开始，把argv中的元素指向的字符串复制到C中。注意，要手动复制末尾的空字符串。
    // 6. 复制C的时候，要继续统计长度。
    // 7. BUF 就是创建的那个数值，而BUF_LEN就是统计出来的长度。

    // 第一个难点：遍历argv时，是*argv还是argv还是**argv？
    // 是*argv。最后一个元素的值是(char *)0。这是人为设置的。
    // char *p = argv;
    // 必须使用类型转换。
//    char arg_stack[PROC_STACK_SIZE];
	unsigned int proc_stack_size = 256;
	char *arg_stack = sys_malloc(proc_stack_size);
	asm ("xchgw %bx, %bx");
	Memset(arg_stack, 0, proc_stack_size);
    char **p = (char **) argv;
    int len = 0;
    while (*p) {
	Printf("*p0 = %x\n", *p);
//	Printf("*p0_str = %s\n", *p);
        // 第三个难点：应该使用p++还是*p++？
        p++;
        len += sizeof(char *);
    }
//	Printf("*p0 = %x\n", *p);

    // 存储空字符。
    // 加上空字符占用的长度。
    arg_stack[len] = 0;
    // len += sizeof(char *);
    len += sizeof(char *);
    // 复制数据
    // char arg_stack[PROC_STACK_SIZE];
    //char *ptr = arg_stack;
    char **ptr = arg_stack;
    char **q = (char **)argv;
	int cnt = 0;
    while (*q) {
//	Printf("cnt0 = %d\n", cnt);
        // 开始复制argv中的数据到arg_stack中
       *ptr = &arg_stack[len];
//	Printf("*q-- = %s\n", *q);
        Strcpy(&arg_stack[len], *q);
//	Printf("arg_stack[%d] = %s\n", len, (char *)(&arg_stack[len]));
        len += Strlen(*q);
        arg_stack[len] = 0;
        len += sizeof(char);

        q++;
        ptr++;
	cnt++;
    }
//Printf("len = %d\n", len);
//Printf("cnt = %x\n", cnt);
//	Printf("*t0 = %x\n", *t);


//	return 0;

    Message msg;


	unsigned int vaddr_proc_esp = 0xC0000000 - 0x1000 + PAGE_SIZE - len;
	// 直接在用户进程中获取虚拟地址的物理地址，合适吗？语法上，能这样做。
	unsigned int phy_pathname = get_physical_address(pathname);
	unsigned int phy_arg_stack = get_physical_address(arg_stack);
	// unsigned int phy_proc_esp = get_physical_address(0xC0000000 - 0x1000 + PAGE_SIZE);
	unsigned int phy_proc_esp = get_physical_address(vaddr_proc_esp);
//	unsigned int phy_proc = get_physical_address();

    msg.TYPE = EXEC;
    msg.PATHNAME = phy_pathname;
    msg.NAME_LEN = Strlen(pathname);
    msg.BUF = phy_arg_stack;
    msg.BUF_LEN = len;

	msg.ARG_STACK_VADDR = arg_stack;
	msg.PHY_PROC_ESP = phy_proc_esp;
	msg.VADDR_PROC_ESP = vaddr_proc_esp;
	msg.DELTA = vaddr_proc_esp - (unsigned int)arg_stack;

    send_rec(BOTH, &msg, TASK_MM);

	sys_free(arg_stack, PROC_STACK_SIZE);

//	int counter = 0;
//	while(1){
////		Printf("before send_rec22\n");
//		// 接收mem进程发送过来的用户程序的虚拟地址。
//	    send_rec(RECEIVE, &msg, TASK_MM);
//		Printf("before send_rec--%d\n", counter);
//		unsigned int v_addr = msg.PROGRAM_VIRTUAL_ADDR;
//		if(v_addr == 0)	break;
//		// 直接在用户进程中像这样分配内存，究竟是否合适？
//		// 在本文件使用USER枚举值，报错。
////		alloc_physical_memory(v_addr, USER);
//		
//		// 直接在用户进程中像这样映射内存地址，是否合适？
//		unsigned int phy_addr = get_physical_address(v_addr);
//		add_map_entry(v_addr, phy_addr);
//		Printf("before send_rec--%d--2\n", counter);
//
//		counter++;
//	}
//
//	// 再接收一次。
//    send_rec(RECEIVE, &msg, TASK_MM);


    assert(msg.TYPE == SYSCALL_RET);

    return msg.RETVAL;
}

int execl(const char *pathname, char *argv, ...) {
    char *parg = (char *) &argv;
    char **p = (char **) parg;

    // 上面的两条语句是否等价于 char **p = (char **)(&argv) ？

    return execv(pathname, p);
}


//int execv(const char *pathname, char **argv) {
//    // 主要思路：
//    // 1. 创建一个数组，数组的内容分为A、B、C三部分。
//    // 2. A是C所占据的内存空间的内存地址。
//    // 3. B是空字符，把A和C分隔开。
//    // 这不是我想出来的思路，是我看了于上神的代码后总结出来的。这也是业务逻辑。
//    // 这只是大概思路，怎么实现，这才是重点和难点。
//    // 怎么实现?
//    // 1. 声明一个数组。
//    // 2. 遍历argv，统计A的长度。A的长度等于argv中元素的数量 * sizeof(char *)。
//    // 3. 为啥这样计算？因为，A的长度是指针占用的内存空间的长度。
//    // 4. 统计A的长度。
//    // 5. 从A开始，把argv中的元素指向的字符串复制到C中。注意，要手动复制末尾的空字符串。
//    // 6. 复制C的时候，要继续统计长度。
//    // 7. BUF 就是创建的那个数值，而BUF_LEN就是统计出来的长度。
//
//    // 第一个难点：遍历argv时，是*argv还是argv还是**argv？
//    // 是*argv。最后一个元素的值是(char *)0。这是人为设置的。
//    // char *p = argv;
//    // 必须使用类型转换。
//    char arg_stack[PROC_STACK_SIZE];
//    char *p = (char *) argv;
//    int len = 0;
//    while (*p) {
//        // 第三个难点：应该使用p++还是*p++？
//        p++;
//        len += sizeof(char *);
//    }
//
//    // 存储空字符。
//    // 加上空字符占用的长度。
//    arg_stack[len] = 0;
//    // len += sizeof(char *);
//    len += sizeof(char);
//
//    // 复制数据
//    // char arg_stack[PROC_STACK_SIZE];
//    char *ptr = arg_stack;
//    char **q = argv;
//    while (*q) {
//        // 开始复制argv中的数据到arg_stack中
//        *ptr = &arg_stack[len];
//        Strcpy(&arg_stack[len], *q);
//        len += Strlen(*q);
//        arg_stack[len] = 0;
//        len += sizeof(char);
//
//        q++;
//        ptr++;
//    }
//
//    Message msg;
//
//    msg.TYPE = EXEC;
//    msg.PATHNAME = pathname;
//    msg.NAME_LEN = Strlen(pathname);
//    msg.BUF = arg_stack;
//    msg.BUF_LEN = len;
//
//    send_rec(BOTH, &msg, TASK_MM);
//
//    assert(msg.TYPE == SYSCALL_RET);
//
//    return msg.RETVAL;
//}
