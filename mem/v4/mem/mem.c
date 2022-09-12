#include "stdio.h"
#include "string.h"
#include "const.h"
#include "mem.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"

#define PTE_IDX(addr) ((addr & 0x003ff000) >> 12)
#define PDE_IDX(addr) ((addr & 0xffc00000) >> 22)

int test_bit_val(Bitmap *map, int idx)
{
	int byte_idx = idx / 8;
	int bit_idx = idx % 8;	
	char val = map->bits[byte_idx];
	int bit_val = (val & (1 << bit_idx)) >> bit_idx;

	return (bit_val > 0 ? 1 : 0);
}

int set_bit_val(Bitmap *map, int idx, int val)
{
	// TODO 要判断val。它只能是0或1。
	// TODO 判断idx
	int byte_idx = idx / 8;
	int bit_idx = idx % 8;	
	char byte_val = map->bits[byte_idx];
	
	if(val >  0){
		byte_val = byte_val | (1 << bit_idx);	
	}else{
		byte_val = byte_val & (~(1 << bit_idx));
	}

	map->bits[byte_idx] = byte_val;
	
	// TODO 在这个函数需要返回值吗？
	return 1;
}

int set_bits(Bitmap *map, int idx, int val, int cnt)
{
	for(int i = 0; i < cnt; i++){
		set_bit_val(map, idx++, val);
	}

	// TODO 在这个函数需要返回值吗？
	return 1;
}

int get_first_free_bit(Bitmap *map, int idx)
{
	int length = map->length * 8;

	for(int i = idx; i < length; i++){
		if(test_bit_val(map, i) == 0){
			return i;
		}
	}

	return -1;
}

int get_bits(Bitmap *map, int cnt)
{
	// int first_free_bit = get_first_free_bit(map, 0);
	int tmp = ROUND_UP(0x100000 + 0x2000, PAGE_SIZE);
	tmp = 0;
	int first_free_bit = get_first_free_bit(map, tmp);
	if(first_free_bit == -1){
		// TODO 错误处理。
	}

	int length = map->length * 8;
	int loop_cnt = cnt - 1;

	int start_idx = first_free_bit + 1;
	int end_idx = first_free_bit;
	while(loop_cnt-- > 0){
		if(test_bit_val(map, start_idx) == 0){
			start_idx++;
			end_idx++;
		}else{
			first_free_bit = get_first_free_bit(map, 0) + 1;
			// TODO 错误处理。
			start_idx = first_free_bit + 1;
			end_idx = start_idx;
			loop_cnt = cnt - 1; 
		}

		if(end_idx >= length){
			end_idx = -1;
			break;
		}
	}

	if(end_idx == -1){
		// TODO 错误处理。
	}

	start_idx = end_idx - cnt + 1;
	
	return start_idx;
}

int get_a_page2(int vaddr, MEMORY_POOL_TYPE pool_type)
{
	int phy_addr = get_a_page(pool_type);
	add_map_entry(vaddr, phy_addr);

	return vaddr;
}

// 申请一个物理页框
unsigned int get_a_page(MEMORY_POOL_TYPE pool_type)
{
	struct _MemPool pool;
	
	if(pool_type == KERNEL){
		pool = KernelPool;
	}else{
		// TODO 某个用户进程的虚拟地址池
		pool = UserPool;
	}
	// 找到位图中的空闲bit，返回它的索引。
	Bitmap map = pool.map;
	int index = get_bits(&map, 1);
	// TODO 内存不足，无法分配。
	unsigned int addr = pool.start_addr + PAGE_SIZE * index;
	// 把第index个bit设置成1。
	set_bit_val(&map, index, 1);

	return addr;
}

// 申请一个虚拟内存地址
// cnt是页框数量
// 每个进程的虚拟内存地址池不同，是不是要指定进程？
unsigned int get_virtual_address(unsigned int cnt, MEMORY_POOL_TYPE pool_type)
{
	VirtualMemoryAddress pool;

	if(pool_type == KERNEL){
		pool = KernelVirtualMemory;
	}else{
		// TODO 某个用户进程的虚拟地址池
	}
	
	Bitmap map = pool.map;

	int index = get_bits(&map, cnt);
	// int addr = pool.start_addr + PAGE_SIZE * index;
	// unsigned int addr = pool.start_addr + PAGE_SIZE * cnt;
	unsigned int addr = pool.start_addr + PAGE_SIZE * (cnt - 1);
	if(addr == 0xC0203EA0){
		disp_str("get_virtual_address\n");
		while(1);
	}
	set_bits(&map, index, 1, cnt);

	return addr;
}

unsigned int *ptr_pte(unsigned int vaddr)
{
	unsigned int* pte = (unsigned int*)(0xffc00000 + \
			((vaddr & 0xffc00000) >> 10) + \
			PTE_IDX(vaddr) * 4);
	return pte;
//	return (unsigned int)((1023 << 22) + (1023 << 12) + (vaddr >> 22) * 4);
	// return (int *)((1023 << 22) + (1023 << 12) + (vaddr >> 22) * 4);
	// return (int *)((0xffc0000) + (0x3ff000) + (vaddr >> 22) * 4);
//	return (int *)((0xffc00000) + (0x3ff000) + ((vaddr & 0xffc00000) >> 22) * 4);
//	return (int *)((0xffc0000) + (0x3ff000) + ((vaddr & 0x3ff00000) >> 22) * 4);
//	uint32_t* pde = (uint32_t*)((0xfffff000) + PDE_IDX(vaddr) * 4);
//	return (int *)(0xfffff000 + ((vaddr & 0x3ff00000) >> 22) * 4);
}

unsigned int *ptr_pde(unsigned int vaddr)
{
	unsigned int* pde = (unsigned int*)((0xfffff000) + PDE_IDX(vaddr) * 4);
	return pde;
	// 00000000001111111111000000000000 是 0x3ff000。
	// return (int *)((1023 << 22) + (vaddr >> 22) << 12 + ((vaddr & 0x3ff000) >> 12) * 4);
	// return (int *)((0xffc0000) + (vaddr >> 22) << 12 + ((vaddr & 0x3ff000) >> 12) * 4);
	// return (unsigned int *)((0xffc00000) + (vaddr & 0x3ff00000) >> 10 + ((vaddr & 0x3ff000) >> 12) * 4);
	// return (unsigned int *)((0xffc00000) + (vaddr & 0xffc00000) >> 10 + ((vaddr & 0x3ff000) >> 12) * 4);
//	return (unsigned int *)((0xffc00000) + ((vaddr & 0xffc00000) >> 10) + ((vaddr & 0x3ff000) >> 12) * 4);
}
// 增加映射条目
void add_map_entry(unsigned int vaddr, unsigned int phy_addr)
{
	// 获取PDE的虚拟地址
	// void *pde = ptr_pde(vaddr);
//	asm ("xchgw %bx, %bx");
	unsigned int *pde = ptr_pde(vaddr);
	// 获取PTE的虚拟地址
	// void *pte = ptr_pte(vaddr);
	unsigned int *pte = ptr_pte(vaddr);
	
	if(*pde & PG_P_YES){
		if(*pte & PG_P_YES){
			// do nothing
			// 这种情况，应该报错。如果pte已经和一个物理页框建立了映射，就不应该再把这个虚拟地址和
			// 目标物理地址建立映射。
			// 有必要解除虚拟地址和物理地址之间的映射关系吗？
		}else{
			// TODO 内存池没有规划好，只能先这样。
//			int type = 1;
//			MemPool pool = 0x0;
//			int *addr = get_a_page(type, pool);
			// TODO 页框的物理地址存储在PTE中。但PTE中的值除了物理地址，还有P位等属性，怎么设置？
		//	asm ("xchgw %bx, %bx");
//			*pte = phy_addr;
		    *pte = phy_addr | PG_P_YES |  PG_RW_RW |  PG_US_SUPER;;
		//	asm volatile ("movl %0, %1" : : "r" (phy_addr), "m" (*pte) : "memory");
		}
	}else{
			// TODO 内存池没有规划好，只能先这样。
			unsigned int addr = get_a_page(KERNEL);
		// 要把这个页框初始化。
		*pde = addr | PG_P_YES |  PG_RW_RW |  PG_US_SUPER;
		// Memset(pde, 0, PAGE_SIZE);
		// Memset(pde, 0, PAGE_SIZE);
//		Memset(pde, 0, PAGE_SIZE);
		Memset((void*)((int)pte & 0xfffff000), 0, PAGE_SIZE);

		// TODO 这样写，就可以了吗？
		*pte = phy_addr | PG_P_YES |  PG_RW_RW |  PG_US_SUPER;

		// 绝对不存在下面的情况。页表都不存在，里面的PTE没有任何意义。
//		if(*pte & PG_P_YES){
//			// do nothing
//		}else{
//			// TODO 内存池没有规划好，只能先这样。
//			int type = 1;
//			MemPool pool = 0x0;
//			int *addr = get_a_page(type, pool);
//			// TODO 页框的物理地址存储在PTE中。但PTE中的值除了物理地址，还有P位等属性，怎么设置？
//			*pte = addr;
//		}
	}
}

// 获取虚拟地址对应的物理地址
unsigned int get_physical_address(unsigned int vaddr)
{
	unsigned int *pte = ptr_pte(vaddr);
	unsigned int phy_addr = (int)(*pte & 0xFFFFF000) + (vaddr & 0xFFF);

	return phy_addr;
}

unsigned int alloc_memory(unsigned int cnt, MEMORY_POOL_TYPE pool_type)
{
	unsigned int vaddr = get_virtual_address(cnt, pool_type);
	unsigned int vaddr_temp = vaddr - PAGE_SIZE;

	while(cnt--){
		vaddr_temp += PAGE_SIZE;
		unsigned int phy_addr = get_a_page(pool_type);
		add_map_entry(vaddr_temp, phy_addr);
		// vaddr += PAGE_SIZE;
	}

//	int page_directory = 0x100000;
//	asm volatile ("movl %0, %%cr3" : : "r" (page_directory) : "memory");
	return vaddr;
}

void init_memory2()
{
	// asm ("xchgw %bx, %bx");
	int total_memory = 32 * 1024 * 1024;
	// 低端1MB和紧随其后的两个页框被内核、页目录表、页表使用。
	int used_memory = 0x100000 + 0x2000;
	KernelPool.start_addr = used_memory;
	// KernelPool.start_addr = 0x100000 + 0x4000;
	// KernelPool.start_addr = 0x100000 + 0x4000;
	// KernelPool.start_addr = 0x100000 + (0x1000 + 0x1000 + 0x1000 + 0x1000);
	total_memory = total_memory - KernelPool.start_addr;
	KernelPool.length = total_memory / 2;	
	disp_int(KernelPool.length);
	UserPool.length = total_memory - KernelPool.length;
	disp_str("\n");
	disp_int(UserPool.length);
	disp_str("\n");
	// 设置内核内存池的位图。
	// 用户内存池池有多少个页？
	// int page_cnt = (KernelPool.length + PAGE_SIZE - 1)/ PAGE_SIZE;
	int page_cnt = ROUND_UP(KernelPool.length, PAGE_SIZE);
	KernelPool.map.length = ROUND_UP(page_cnt, 8);	
	// 位图的初始地址怎么确定？
	KernelPool.map.bits = (char *)(KernelPool.start_addr + 0xc0000000);
	// 初始化内核的位图。
	Memset(KernelPool.map.bits, 0, KernelPool.map.length);
	// 位图放在内核内存池。更新内核内存池的初始化地址。
	// KernelPool.start_addr += KernelPool.map.length;
	// 不更新内核内存池的初始化地址了。把位图占用的内存标记成已经使用。
	// 内核内存池的位图占用多少个扇区？
	int bitmap_page_cnt = ROUND_UP(KernelPool.map.length, PAGE_SIZE);	
	int userPoolMapBitIdx = bitmap_page_cnt;
	set_bits(&KernelPool.map, 0, 1, bitmap_page_cnt);

	// 处理物理内存池
	page_cnt = ROUND_UP(UserPool.length, PAGE_SIZE);
	UserPool.map.length = ROUND_UP(page_cnt, 8);
	// 用户内存池的位图的初始地址 = 内核内存池的初始地址 + 内核内存池的位图的长度。
	UserPool.map.bits = (char *)(KernelPool.start_addr + KernelPool.map.length);
	// 初始化用户内存池的位图。
	Memset(UserPool.map.bits, 0, UserPool.map.length);
	bitmap_page_cnt = ROUND_UP(UserPool.map.length, PAGE_SIZE);
	int bit_idx = userPoolMapBitIdx; 
	set_bits(&KernelPool.map, bit_idx, 1, bitmap_page_cnt);

	// 初始化内核的虚拟内存池
	// int virtual_total_memory = 4*1024*1024*1024;
	// long long virtual_total_memory = 4*1024*1024*1024;
//	unsigned long long virtual_total_memory = 4*1024*1024*1024;
	// 4GB/4KB
	int virtual_total_memory_page_cnt = 1024*1024;
//	page_cnt = ROUND_UP(virtual_total_memory, PAGE_SIZE);
	page_cnt = virtual_total_memory_page_cnt;
	KernelVirtualMemory.map.length = ROUND_UP(page_cnt, 8);	
	// 初始化内核的虚拟内存池的位图。
	KernelVirtualMemory.map.bits = (char *)(KernelPool.start_addr + KernelPool.map.length + UserPool.map.length);
	Memset(KernelVirtualMemory.map.bits, 0, KernelVirtualMemory.map.length);
	// 把虚拟内存池的位图占用的内核内存标记为已经使用。
	bit_idx = userPoolMapBitIdx + bitmap_page_cnt;
	bitmap_page_cnt = ROUND_UP(KernelVirtualMemory.map.length, PAGE_SIZE);
	set_bits(&KernelPool.map, bit_idx, 1, bitmap_page_cnt);
	KernelVirtualMemory.start_addr = (bit_idx + bitmap_page_cnt) * 0x1000;
	// KernelVirtualMemory.start_addr = KernelPool.start_addr + (bit_idx + bitmap_page_cnt) * 0x1000;
	KernelVirtualMemory.start_addr = used_memory + (1 + 1 + bitmap_page_cnt) * 0x1000;
	int a = 5;
	int b = a;
	
}

void init_memory(int total_memory)
{
	// int map_base_addr = 0xC009F000;
	
	// int map_base_addr = 0xC009A000;
	int map_base_addr = 0xC00fa000;
	// 					0xc0100000;
	int k_v_addr 	  = 0xc0200000;
	

	int page_table_size = PAGE_SIZE * 256;
	int used_memory = 0x200000 + page_table_size;	

	int all_free_page_cnt = (total_memory - used_memory) / PAGE_SIZE;
	int kernel_pool_free_pages = all_free_page_cnt / 2;
	int user_pool_free_pages = all_free_page_cnt - kernel_pool_free_pages;

	int kbm_length = kernel_pool_free_pages / 8;
	int ubm_length = user_pool_free_pages / 8;

	KernelPool.start_addr = used_memory;
	UserPool.start_addr = KernelPool.start_addr + PAGE_SIZE * kernel_pool_free_pages;

	// 位图
	KernelPool.map.bits = (char *)map_base_addr;
	KernelPool.map.length = kbm_length;
	// Memset(&KernelPool.map.bits, 0, kbm_length);
	Memset(KernelPool.map.bits, 0, kbm_length);

	UserPool.map.bits = (char *)(map_base_addr + kbm_length);
	UserPool.map.length = ubm_length;
	Memset(UserPool.map.bits, 0, ubm_length);

	KernelVirtualMemory.map.length = kbm_length;
	KernelVirtualMemory.map.bits = (char *)(map_base_addr + kbm_length + ubm_length);
	KernelVirtualMemory.start_addr = k_v_addr;
	Memset(KernelVirtualMemory.map.bits, 0, kbm_length);
	asm ("xchgw %bx, %bx");
}
