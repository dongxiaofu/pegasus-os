//#ifdef  GLOBAL_VARIABLES_HERE
//#undef  EXTERN
#define EXTERN
//#endif


// 全局相关 start
EXTERN int dis_pos;
EXTERN unsigned int ticks;
EXTERN unsigned int k_reenter;
EXTERN unsigned int counter;

// 全局相关 end

// 进程相关 start
// 即将或正在执行的进程的进程表
EXTERN Proc *proc_ready_table;
// 系统任何和用户进程的进程表都存储在这个数组中
extern Proc proc_table[];
// 用户进程元数据
extern Task user_task_table[];

// 系统任务元数据
extern Task sys_task_table[];

// 进程的堆栈
extern int proc_stack[STACK_SIZE];

//system_call sys_call_table[1] = {
extern int_handle sys_call_table[];

// 进程相关 end

// 保护模式相关 start
EXTERN Descriptor gdt[128];
EXTERN unsigned char idt_ptr[6];
EXTERN Gate idt[256];
EXTERN unsigned char gdt_ptr[6];
EXTERN TSS tss;

// 保护模式相关 end



