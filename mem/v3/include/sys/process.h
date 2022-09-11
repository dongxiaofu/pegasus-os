#ifndef _PEGASUS_OS_PROCESS_H
#define _PEGASUS_OS_PROCESS_H
// 进程表 start
typedef struct{
        // 中断处理程序压栈，手工压栈
        //unsigned short gs;
        //unsigned short fs;
        //unsigned short es;
        //unsigned short ds;

        unsigned int gs;
        unsigned int fs;
        unsigned int es;
        unsigned int ds;
        // pushad压栈，顺序固定
        unsigned int edi;
        unsigned int esi;
        unsigned int ebp;
        // 在这里消耗了很多时间。为啥需要在这里补上一个值？这是因为popad依次出栈的数据中有这么个值，
        // 如果不补上这一位，出栈时数据不能依次正确更新到寄存器中。
        unsigned int kernel_esp;
        unsigned int ebx;
        unsigned int edx;
        unsigned int ecx;
        unsigned int eax;
        // 中断发生时压栈
        unsigned int eip;
        unsigned int cs;
        //unsigned short cs;
        unsigned int eflags;
        //unsigned short ss;
        unsigned int esp;       // 漏掉了这个。iretd会出栈更新esp。
        unsigned int ss;
}Regs;
// 发送消息的进程队列的成员的数据类型
struct MsgSender
{
        //Proc *sender;
        unsigned int sender_pid;
        //struct MsgSender next;
        struct MsgSender *next;
};

#define FILP_TABLE_SIZE 64
#define FILE_TABLE_SIZE 64

// 进程表
typedef struct proc{
        Regs s_reg;
        // ldt选择子
        unsigned short ldt_selector;
        // ldt
        Descriptor ldts[2];
        unsigned int pid;
        // 进程剩余可用的时钟中断次数
        unsigned int ticks;
        // 进程优先级
        unsigned int priority;
        // 本进程使用哪个tty，tty_table的索引
        unsigned int tty_index;
        // 进程名称
        char name[20];
	// 进程打开的文件相关
	// struct filp filp_table[FILE_TABLE_SIZE];	
	// struct file_desc filp_table[FILP_TABLE_SIZE];	
	struct file_desc *filp[FILP_TABLE_SIZE];	

		unsigned int page_directory;
		unsigned int user_virtual_memory_address;
	
        // ipc start
        char p_flag;           // 进程的状态：RUNNING等
	char wait_status;	// 在exit、wait中使用。和p_flag分开，降低难度。
        Message *p_msg; // 指向消息体
         int p_send_to;  // 要向哪个进程发送消息，目标进程ID
        int p_receive_from;     // 要从哪个进程接收消息，目标进程ID

	struct proc *q_sending;
	struct proc *q_next;
	
	unsigned int has_int_msg;	// 是否有中断消息。
	
	int parent_pid;
	int exit_status;	// wait、exit系列中的退出状态码
	
        // ipc end
}Proc;

typedef struct{
	char name[20];
        Func func_name;
        unsigned short stack_size;
}Task;


#endif
