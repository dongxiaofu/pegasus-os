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
#include "hd.h"

int do_exec(Message *msg);


int do_exec(Message *msg)
{
	// 主要思路：
	// 1. 本函数做的事：设置eip、esp、eax、ecx
	// 2. 调整caller的数据空间的值，并在不同进程间复制。
	// 3. 重新放置二进制代码。
	// 4. 写非常接近正式代码的伪代码。因为，很多函数都没有实现。
	//
	// 调整caller的数据空间的值
	char *stackcopy = PROC_IMAGE_DEFAULT_SIZE - PROC_STACK_SIZE;
	// 从caller把arg_stack复制过来
	int caller_pid = msg->source;
	// 这样使用指针，正确吗？
	char *buf = msg->STACK_BUF;
	int buf_len = msg->STACK_BUF_LEN;

	// 把caller的数据空间复制到当前进程，即TASK_MM。
	// 复制函数太难用了。
	phycopy(v2l(TASK_MM, stackcopy), v2l(caller_pid, buf),  buf_len);
	// 调整caller的数据空间的值
	int delta = stackcopy - buf;
	int argc = 0;
	char *p = stackcopy;
	while(*p){
		argc++;
		*p = *p + delta;
		p++;
	}	

	// 把重新放置后的数据空间复制到caller的数据空间中。	
	char *origin_stack = PROC_IMAGE_DEFAULT_SIZE - PROC_STACK_SIZE;
	phycopy(v2l(caller_pid, origin_stack), v2l(TASK_MM, stackcopy),  buf_len);	

	// 重新放置二进制代码
	// 主要思路：
	// 1. 从elf头中找出程序头表项中的表现数量，遍历程序头表。
	// 2. 每个表现中，有我需要的数据：二进制代码的虚拟地址、在文件中的偏移量、长度。
	// 3. 对了，要先把文件读到内存中。
	//
	// 把文件读取到mmbuf中。文件的最大长度是有限制的，因此，可以把mmbuf的长度设置为
	// 大于等于文件的最大长度。
	// 我们常用的文件的最大长度似乎没限制，后期，我想想怎么实现这个特性。
	// todo MAX_FILE_SIZE 的值，待确定。
	char mmbuf[MAX_FILE_SIZE];
	char filename[20];
	// todo FILENAME 等都不是Message的成员，需要补充。
	// FILENAME的长度包含末尾的'0'吗？
	phycopy(v2l(TASK_MM, filename), v2l(caller_pid, msg->FILENAME),  msg->FILENAME_LEN);
	int fd = open(filename);
	read(fd, mmbuf, MAX_FILE_SIZE);

	// 开始解析ELF文件了
	// todo Elf32_Ehdr、Elf32_Phdr 需要在我的操作系统中定义吗？
	Elf32_Ehdr * elf_header = (Elf32_Ehdr *)mmbuf;
	for(int i = 0; i < elf_header->e_phnum; i++){	
		Elf32_Phdr * program_header = (Elf32_Phdr *)(mmbuf + elf_header->e_ehsize + 
			i * elf_header->e_phentsize);			
		// 复制二进制代码
		phycopy(v2l(caller_pid, program_header->p_vaddr),
			v2l(TASK_MM, mmbuf + program_header->p_offset),
			program_header->p_filesz
		);
	}

	// 设置eip、esp、eax、ecx
	proc_table[caller_pid].s_reg.eax = origin_stack;
	proc_table[caller_pid].s_reg.ecx = argc;
	proc_table[caller_pid].s_reg.eip = elf_header->e_entry;
	proc_table[caller_pid].s_reg.esp = origin_stack;

	// 解除caller的阻塞
	Message m;
	m.type = SYSCALL_RET;
	m.RET_VAL = 0;
	m.PID = 0;
	send_rec(SEND, &m, caller_pid);
}
