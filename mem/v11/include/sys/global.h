#ifndef _PEGASUS_OS_GLOBAL_H
#define _PEGASUS_OS_GLOBAL_H

#include "double_link_list.h"

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
EXTERN int current_dis_pos;
EXTERN unsigned long long int ticks;
EXTERN unsigned int MAIN_THREAD_PAGE_DIRECTORY;
EXTERN unsigned char nic_current_page;
// TODO 测试用，要删除
EXTERN unsigned int test_ticks;
EXTERN unsigned int k_reenter;
EXTERN unsigned int counter;
EXTERN unsigned int key_pressed;
EXTERN unsigned int pid;
EXTERN unsigned int fork_pid;
EXTERN unsigned char is_init;
EXTERN unsigned int gdt_index;

EXTERN unsigned char net_data;
EXTERN unsigned char *net_buf;
EXTERN unsigned char helloStr[12];



// 全局相关 end

// 进程相关 start
// 即将或正在执行的进程的进程表
EXTERN Proc *proc_ready_table;
EXTERN Proc *pcaller;
EXTERN DoubleLinkList pcb_list;
EXTERN DoubleLinkList all_pcb_list;
EXTERN Proc *main_thread;
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
//unsigned int sys_malloc2(unsigned int size);
unsigned int sys_malloc2(unsigned int size, int unknown, Proc *caller);
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
#define TASK_TTY 4	//(START_PID + 1)
#define TASK_SYS (TASK_TTY + 1)
#define TASK_HD  3	//(TASK_SYS + 1)
#define TASK_FS  2//  (TASK_HD + 1) 
#define TASK_MM  1	//(TASK_FS + 1)
#define INIT_PID  6

#define PROC_A	5
// TODO 设置成7不知道行不行。太久了，我不记得设置进程的PID有什么规则。
// 网络协议栈。
#define TASK_NETWORK            5
// 从网卡接收数据。
#define TASK_NET_DEV_RX         6
#define TASK_NET_INIT_DEV         7


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

// 向上取整
#define ROUND_UP(length, size)  ((length + size - 1) / size)

// 网络协议。
// TODO 暂时放在这里。
typedef struct nic_page_buf_node{
	unsigned char *buf;
	struct nic_page_buf_node *next;
} *NIC_PAGE_BUF_NODE;

// 以太网帧结构体。
#define ETH_ALEN	6
// 16位大端法。
// typedef _be16 unsigned short;
typedef unsigned short _be16;

typedef struct ethhdr{
	unsigned char   h_dest[ETH_ALEN];   /* destination eth addr */
	unsigned char   h_source[ETH_ALEN];   /* source eth addr */
	_be16      h_proto;        /* packet type ID field */
} *ETHHDR;

// 网络协议栈。
//static LIST_HEAD(routes);
//static struct netdev *loop;
//static struct netdev *netdev; /* 用于记录本机地址,包括ip和mac地址 */
//EXTERN LIST_HEAD(routes); 
struct list_head *routes;
EXTERN struct netdev *loop;
//EXTERN struct netdev *netdev = NULL; /* 用于记录本机地址,包括ip和mac地址 */
EXTERN struct netdev *netdev; /* 用于记录本机地址,包括ip和mac地址 */

struct list_head *tcp_connecting_or_listening_socks;
struct list_head *tcp_establised_or_syn_recvd_socks;

#endif
