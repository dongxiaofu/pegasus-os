#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "console.h"
#include "global.h"

//int do_exec(Message *msg);

int do_exec2(Message *msg) {
	int a = 5;
	return 0;
}
int do_exec(Message *msg) {
    // 主要思路：
    // 1. 本函数做的事：设置eip、esp、eax、ecx
    // 2. 调整caller的数据空间的值，并在不同进程间复制。
    // 3. 重新放置二进制代码。
    // 4. 写非常接近正式代码的伪代码。因为，很多函数都没有实现。
    //
    //
	char tty1[10] = "dev_tty1";
	asm ("xchgw %bx, %bx");
int fd_stdout = open(tty1, O_RDONLY);
	int source = msg->source;    

    // 重新放置二进制代码
    // 主要思路：
    // 1. 从elf头中找出程序头表项中的表项数量，遍历程序头表。
    // 2. 每个表项中，有我需要的数据：二进制代码的虚拟地址、在文件中的偏移量、长度。
    // 3. 对了，要先把文件读到内存中。
    //
    // 把文件读取到mmbuf中。文件的最大长度是有限制的，因此，可以把mmbuf的长度设置为
    // 大于等于文件的最大长度。
    // 我们常用的文件的最大长度似乎没限制，后期，我想想怎么实现这个特性。
    // char mmbuf[MAX_FILE_SIZE];
    // todo 先用硬编码
    int MAX_FILE_SIZE = 148368;
//    char mmbuf[158368];
      char mmbuf[1024];
//    char mmbuf[212096];
    char filename[12];
	Memset(filename,0,12);
    // FILENAME的长度包含末尾的'0'吗？
    unsigned int phy_pathname = msg->PATHNAME;
	unsigned int vaddr_pathname = alloc_virtual_memory(phy_pathname, msg->NAME_LEN);
    phycopy(filename, vaddr_pathname, msg->NAME_LEN);
	filename[msg->NAME_LEN] = 0;
    int fd = open(filename, O_RDONLY);
		if(fd == -1){
			// TODO 这是临时措施。
			Printf("open file fail\n");
			return;
		}
        int byte_rdwt = 0;
        while(1){

            int cnt = read(fd, mmbuf + byte_rdwt, 512);
                byte_rdwt += cnt;
                if(cnt == 0){
                        break;
                }
				if(byte_rdwt >= 1024)	break;
        }

        close(fd);
	asm ("xchgw %bx, %bx");

    // 开始解析ELF文件了
    // Elf32_Ehdr、Elf32_Phdr 需要在我的操作系统中定义吗？需要。我的操作系统不使用其他操作系统的库文件。
    Elf32_Ehdr *elf_header = (Elf32_Ehdr *) mmbuf;
    for (int i = 0; i < elf_header->e_phnum; i++) {
        Elf32_Phdr *program_header = (Elf32_Phdr * )(mmbuf + elf_header->e_ehsize +
                                                     i * elf_header->e_phentsize);

		unsigned int program_size = program_header->p_filesz;
		unsigned int page_cnt = ROUND_UP(program_size, PAGE_SIZE);
		unsigned int p_vaddr = program_header->p_vaddr;
		unsigned int start_vaddr = 0;

		// 怎么会有程序段的大小是0呢？
		// 在测试时，我发现了这种情况。程序段的大小是0，不能做内存地址映射，不能调用下面的phycopy。
		if(program_size == 0)	continue;

		for(int i = 0; i < page_cnt; i++){
			unsigned int phy_addr = alloc_physical_memory_of_proc(p_vaddr, source);
			unsigned vaddr = alloc_virtual_memory(phy_addr, PAGE_SIZE);
			if(start_vaddr == 0)	start_vaddr = vaddr;

			p_vaddr += PAGE_SIZE;
		}

        phycopy(start_vaddr, mmbuf + program_header->p_offset, program_header->p_filesz);
    }

//	Printf("after reload elf\n");

	asm ("xchgw %bx, %bx");
    // 调整caller的数据空间的值
    //char *stackcopy = PROC_IMAGE_DEFAULT_SIZE - PROC_STACK_SIZE;
    char stackcopy[PROC_STACK_SIZE];
    // 从caller把arg_stack复制过来
    // 这样使用指针，正确吗？
    char *buf = msg->BUF;
    int buf_len = msg->BUF_LEN;

	Proc *proc = pid2proc(source);	
    char *origin_stack = (char *)(proc + PAGE_SIZE - buf_len);

    // 把caller的数据空间复制到当前进程，即TASK_MM。
    // 复制函数太难用了。
    unsigned int phy_buf = msg->BUF;
	unsigned int vaddr_buf = alloc_virtual_memory(phy_buf, buf_len);
	asm ("xchgw %bx, %bx");
    phycopy(stackcopy, vaddr_buf, buf_len);

	// 打印数据看看
	int stackcopy_line_addr = (int)stackcopy;
	char **ptr = (char **)stackcopy_line_addr;
	int cnt2 = 0;
	while(*ptr){
		cnt2++;
	//	Printf("*ptr = %x\n", *ptr);
		ptr++;
	}
	//Printf("cnt2 = %x\n", cnt2);

    // 调整caller的数据空间的值
    //int delta = stackcopy - buf;
    int delta = origin_stack - vaddr_buf;
    int argc = 0;
    char **p = (char **)stackcopy;
    while (*p) {
        argc++;
        *p = *p + delta;
        p++;
    }

    // 把重新放置后的数据空间复制到caller的数据空间中。
	// 在TASK_MM中直接调用pid2proc，合适吗？
	int source_esp = (unsigned int)proc & 0xFFFFF000;
	asm ("xchgw %bx, %bx");
    phycopy(origin_stack, stackcopy, buf_len);

    // 设置eip、esp、eax、ecx
    Regs *stack0 = (Regs *)(proc + PAGE_SIZE - sizeof(Regs));
	stack0->eax = origin_stack;
	stack0->ecx = argc;
	stack0->eip = elf_header->e_entry;
	stack0->esp = origin_stack;

	proc->p_send_to = NO_TASK;

    // 解除caller的阻塞
    Message m;
    m.TYPE = SYSCALL_RET;
    m.RETVAL = 0;
    m.PID = 0;
	asm ("xchgw %bx, %bx");
    send_rec(SEND, &m, source);
}
