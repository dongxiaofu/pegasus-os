//#ifdef  GLOBAL_VARIABLES_HERE
#ifndef _PEGASUS_OS_GLOBAL_H
#define _PEGASUS_OS_GLOBAL_H
//#undef  EXTERN
#define EXTERN
//#endif

// typedef struct _ListElement{
//   	struct _ListElement *prev;
//   	struct _ListElement *next;
// } ListElement;
// 
// typedef struct _DoubleLinkList{
//   	ListElement head;
//   	ListElement tail;
// } DoubleLinkList;
// 
// // 内存块描述符
// typedef struct _mem_block_desc
// {
// 	int size;
// 	int cnt;
// 	DoubleLinkList free_list;
// } mem_block_desc;
// 
// typedef struct _mem_block
// { 
// 	ListElement element;
// } mem_block;
// 
// typedef struct _arena
// {
// 	mem_block_desc *desc;
// 	int cnt;
// 	char large;
// }arena;
// 
// void initDoubleLinkList(DoubleLinkList *list);
// char isListEmpty(DoubleLinkList *list);
// void appendToDoubleLinkList(DoubleLinkList *list, void *element);
// void insertToDoubleLinkList(DoubleLinkList *list, void *element);
// // void appendToDoubleLinkList(DoubleLinkList *list, void *value);
// // void insertToDoubleLinkList(DoubleLinkList *list, void *value);
// void *popFromDoubleLinkList(DoubleLinkList *list);

// 全局相关 start
EXTERN int dis_pos;
EXTERN unsigned long long int ticks;
// TODO 测试用，要删除
EXTERN unsigned int test_ticks;
EXTERN unsigned int k_reenter;
EXTERN unsigned int counter;
EXTERN unsigned int key_pressed;
EXTERN unsigned int pid;

// 全局相关 end

// 进程相关 start
// 即将或正在执行的进程的进程表
EXTERN Proc *proc_ready_table;
EXTERN Proc *pcaller;
EXTERN DoubleLinkList pcb_list;
EXTERN DoubleLinkList all_pcb_list;
// 系统任何和用户进程的进程表都存储在这个数组中
extern struct proc proc_table[];
// 用户进程元数据
extern Task user_task_table[];

// 系统任务元数据
extern Task sys_task_table[];

// 进程的堆栈
extern int proc_stack[STACK_SIZE];

//system_call sys_call_table[1] = {
extern int_handle sys_call_table[];

// 进程相关 end

arena *block2arena(mem_block *block);
unsigned int sys_malloc(unsigned int size);


// 保护模式相关 start
EXTERN Descriptor gdt[128];
EXTERN unsigned char idt_ptr[6];
EXTERN Gate idt[256];
EXTERN unsigned char gdt_ptr[6];
EXTERN TSS tss;

// 保护模式相关 end

#define MIN(a, b) (a > b ? b : a)
#define MAX(a, b) (a > b ? a : b)

// 系统进程的PID
// 顺序和初始值由kernel_main决定
#define START_PID 1
#define TASK_TTY 2	//(START_PID + 1)
#define TASK_SYS (TASK_TTY + 1)
#define TASK_HD  3	//(TASK_SYS + 1)
#define TASK_FS  4//  (TASK_HD + 1) 
#define TASK_MM  (TASK_FS + 1)
#define INIT_PID  6

#define PROC_A	5

#define reassembly(val1, offset1, val2, offset2, val3) \
        ((val1 << offset1) + (val2 << offset2) + val3)

// todo 不正确
// #define alloc_mem(pid, size, base)  \
        (base + pid * size)


// 根目录的inode
// struct inode *root;
// 使用数据而非指针更好。不是更好，是必须。若使用指针，指向fsbuf，fsbuf的数据更换后，使用
// root不能获取到需要的数据。
// error: storage size of 'root' isn't known
// struct inode root;

// 文件描述符数组长度
#define FILE_DESC_SIZE 64
// 文件描述符数组
// struct file_desc file_desc_table[FILE_DESC_SIZE];
// struct file_desc *file_desc_table[FILE_DESC_SIZE];
// open的oflag参数
#define O_RDONLY        0
#define O_WRONLY        1
#define O_RDWR          2

#define O_EXEC          3
#define O_SEARCH        4
#define O_APPEND        5
#define O_CLOEXEC       6

#define O_CREAT         7

// todo fork创建的进程的内存空间的初始地址
#define USER_PROC_MEM_BASE	0xA00000
// 内存块种类数量
// #define MEM_BLOCK_DESC_KIND_NUM	10

#endif
