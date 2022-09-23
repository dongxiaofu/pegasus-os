#ifndef _PEGASUS_OS_MM_H
#define _PEGASUS_OS_MM_H

//int do_fork(Message *msg);
//
//void cleanup(Proc *proc);
//
//void do_exit(Message msg, int exit_code);
//
//void do_wait(Message msg, int *data);
//
//int do_exec(Message *msg);

// 位图
typedef struct _Bitmap
{
	char *bits;
	int length;
// }* Bitmap;
}Bitmap;

// 内存池
typedef struct _MemPool
{
	Bitmap map;
	unsigned int start_addr;
	int length;
}* MemPool;

// 虚拟地址
typedef struct _VirtualMemoryAddress
{
	Bitmap map;
	unsigned start_addr;
}VirtualMemoryAddress;

// 内核内存池
struct _MemPool KernelPool;
// 用户内存池
struct _MemPool UserPool;
// 内存池的种类
typedef enum _MEMORY_POOL_TYPE {KERNEL, USER} MEMORY_POOL_TYPE;
// 内核的虚拟地址池
VirtualMemoryAddress KernelVirtualMemory;
// 向上取整
#define ROUND_UP(length, size)  ((length + size - 1) / size)

void init_bitmap(Bitmap *map);
int test_bit_val(Bitmap *map, int idx);
int set_bit_val(Bitmap *map, int idx, int val);
int set_bits(Bitmap *map, int idx, int val, int cnt);
int get_first_free_bit(Bitmap *map, int idx);
int get_bits(Bitmap *map, int cnt);

// 分配内存
int get_a_page2(int vaddr, MEMORY_POOL_TYPE pool_type);
// 申请一个物理页框
unsigned int get_a_page(MEMORY_POOL_TYPE pool_type);
// 申请一个虚拟内存地址
// cnt是页框数量
// 每个进程的虚拟内存地址池不同，是不是要指定进程？
unsigned int get_virtual_address(unsigned int cnt, MEMORY_POOL_TYPE pool_type);
// void *ptr_pde(int vaddr);
// void *ptr_pte(int vaddr);
unsigned int *ptr_pde(unsigned int vaddr);
unsigned int *ptr_pte(unsigned int vaddr);
// 增加映射条目
void add_map_entry(unsigned int vaddr, unsigned int phy_addr);
unsigned int alloc_virtual_memory(unsigned int phy_addr, unsigned int size);
// 获取虚拟地址对应的物理地址
unsigned int get_physical_address(unsigned int vaddr);
void remove_map_entry(unsigned int vaddr);
void free_a_page(unsigned int vaddr, MEMORY_POOL_TYPE pool_type);
void sys_free(unsigned int addr, unsigned int size);
// 申请内存，返回内存空间的虚拟地址
unsigned int alloc_memory(unsigned int cnt, MEMORY_POOL_TYPE pool_type);
unsigned int get_a_virtual_page(MEMORY_POOL_TYPE pool_type, unsigned int vaddr);

// 初始化内存管理模块
void init_memory2();
void init_memory(int total_memory);
#endif

