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
}* Bitmap;

// 内存池
typedef struct _MemPool
{
	Bitmap map;
	int start_addr;
}* MemPool;

int test_bit_val(Bitmap map, int idx);
int set_bit_val(Bitmap map, int idx, int val);
int set_bits(Bitmap map, int idx, int val, int cnt);
int get_bits(Bitmap map, int cnt);

// 分配内存
// 申请一个物理页框
int get_a_page(int type, MemPool pool);
// 申请一个虚拟内存地址
// cnt是页框数量
// 每个进程的虚拟内存地址池不同，是不是要指定进程？
int get_virtual_address(Bitmap map, int cnt);
// void *ptr_pde(int vaddr);
// void *ptr_pte(int vaddr);
int *ptr_pde(int vaddr);
int *ptr_pte(int vaddr);
// 增加映射条目
void add_map_entry(int vaddr, int phy_addr);
// 申请内存，返回内存空间的虚拟地址
int alloc_memory(int cnt);

#endif

