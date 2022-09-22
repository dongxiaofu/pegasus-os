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

// 内存管理
// 内核的内存块描述符
// 2kb、4KB、8KB、16KB、32KB、64KB、128KB、256KB、512KB、1024KB
mem_block_desc kernel_mem_block_decs_array[MEM_BLOCK_DESC_KIND_NUM];

void init_bitmap(Bitmap *map)
{
	Memset(map->bits, 0, map->length);
}

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
//	int tmp = ROUND_UP(0x100000 + 0x2000, PAGE_SIZE);
	int tmp = 0;
	int first_free_bit = get_first_free_bit(map, tmp);
	if(first_free_bit == -1){
		// TODO 错误处理。
	}

	int length = map->length * 8;
	int loop_cnt = cnt - 1;
	if(loop_cnt == 0)	return first_free_bit;

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
	Proc *current_thread = (Proc *)get_running_thread_pcb();

	if(pool_type == KERNEL){
		pool = KernelVirtualMemory;
	}else{
		// TODO 某个用户进程的虚拟地址池
		// pool = (VirtualMemoryAddress)current_thread->user_virtual_memory_address;
		Memcpy(&pool, current_thread->user_virtual_memory_address, sizeof(VirtualMemoryAddress));
	}
	
	Bitmap map = pool.map;

	int index = get_bits(&map, cnt);
	
	// int addr = pool.start_addr + PAGE_SIZE * index;
	// unsigned int addr = pool.start_addr + PAGE_SIZE * cnt;
	// unsigned int addr = pool.start_addr + PAGE_SIZE * (cnt - 1);
	// unsigned int addr = pool.start_addr + PAGE_SIZE * (index - 1);
	unsigned int addr = pool.start_addr + PAGE_SIZE * index;
	set_bits(&map, index, 1, cnt);

	return addr;
}

unsigned int *ptr_pde(unsigned int vaddr)
{
	return (unsigned int)((1023 << 22) + (1023 << 12) + (vaddr >> 22) * 4);
	// return (int *)((1023 << 22) + (1023 << 12) + (vaddr >> 22) * 4);
	// return (int *)((0xffc0000) + (0x3ff000) + (vaddr >> 22) * 4);
//	return (int *)((0xffc00000) + (0x3ff000) + ((vaddr & 0xffc00000) >> 22) * 4);
//	return (int *)((0xffc0000) + (0x3ff000) + ((vaddr & 0x3ff00000) >> 22) * 4);
//	uint32_t* pde = (uint32_t*)((0xfffff000) + PDE_IDX(vaddr) * 4);
//	return (int *)(0xfffff000 + ((vaddr & 0x3ff00000) >> 22) * 4);
}

unsigned int *ptr_pte(unsigned int vaddr)
{
	// 00000000001111111111000000000000 是 0x3ff000。
	// return (int *)((1023 << 22) + (vaddr >> 22) << 12 + ((vaddr & 0x3ff000) >> 12) * 4);
	// return (int *)((0xffc0000) + (vaddr >> 22) << 12 + ((vaddr & 0x3ff000) >> 12) * 4);
	// return (unsigned int *)((0xffc00000) + (vaddr & 0x3ff00000) >> 10 + ((vaddr & 0x3ff000) >> 12) * 4);
	// return (unsigned int *)((0xffc00000) + (vaddr & 0xffc00000) >> 10 + ((vaddr & 0x3ff000) >> 12) * 4);
	return (unsigned int *)((0xffc00000) + ((vaddr & 0xffc00000) >> 10) + ((vaddr & 0x3ff000) >> 12) * 4);
}
// 增加映射条目
void add_map_entry(unsigned int vaddr, unsigned int phy_addr)
{
	// 获取PDE的虚拟地址
	// void *pde = ptr_pde(vaddr);
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
//			*pte = phy_addr;
		    *pte = phy_addr | PG_P_YES |  PG_RW_RW |  PG_US_SUPER;
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

unsigned int alloc_virtual_memory(unsigned int phy_addr, unsigned int size)
{
	int page_cnt = ROUND_UP(size, PAGE_SIZE);
	MEMORY_POOL_TYPE pool_type;	
	Proc *proc = (Proc *)get_running_thread_pcb();
	if(proc->page_directory == 0x0){
		pool_type = KERNEL;
	}else{
		pool_type = USER;
	}
	unsigned int vaddr = get_virtual_address(page_cnt, pool_type);
	add_map_entry(vaddr, phy_addr);

	return (vaddr + (phy_addr & 0xFFF));
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

unsigned int get_a_virtual_page(MEMORY_POOL_TYPE pool_type, unsigned int vaddr)
{
	unsigned int phy_addr = get_a_page(pool_type);
	add_map_entry(vaddr, phy_addr);

	return vaddr;
}

arena *block2arena(mem_block *block)
{
	arena *a = (arena *)((unsigned int)block & 0xFFFFF000);

	return a;
}

unsigned int sys_malloc(unsigned int size)
{
	unsigned int addr = 0x0;
	MEMORY_POOL_TYPE pool_type;
	mem_block_desc *desc_array;

	Proc *current_thread = (Proc *)get_running_thread_pcb();
	if(current_thread->page_directory == 0x0){
		pool_type = KERNEL;
		desc_array = kernel_mem_block_decs_array;
	}else{
		pool_type = USER;
		desc_array = current_thread->mem_block_desc_array;
	}


	if(size > 1024){
		unsigned int cnt = ROUND_UP(size + sizeof(arena), PAGE_SIZE);
		unsigned int page_addr = alloc_memory(cnt, pool_type);
		// 有必要增加元数据吗？
		arena *a = (arena *)page_addr;
		a->desc = (mem_block_desc *)0x0;
		a->cnt = 1;
		a->large = 1;
		addr = (unsigned int)(a + 1);
	}else{
		// 从小往大，开始寻找大于size的内存块。
		unsigned int index = 0;
		for(int i = 0; i < MEM_BLOCK_DESC_KIND_NUM; i++){
			if(desc_array[i].size >= size){
				index = i;
				break;
			}
		}

		unsigned int block_addr;
//		mem_block_desc desc = desc_array[index];
		mem_block_desc *desc = (mem_block_desc *)alloc_memory(1,pool_type);
		Memcpy(desc,desc_array + index, sizeof(mem_block_desc)); 
		// if(isListEmpty(&desc->free_list) == 1){
		if(isListEmpty(&(desc_array[index].free_list)) == 1){
			unsigned int page_addr = alloc_memory(1, pool_type);
			// TODO 没有做容错处理。
			unsigned int mem_block_size = desc->size;
			unsigned int arena_size = sizeof(arena);
			// unsigned int cnt = (PAGE_SIZE - arena_size) / arena_size; 
			unsigned int cnt = (PAGE_SIZE - arena_size) / mem_block_size; 
			unsigned int start_addr = page_addr + arena_size;

			// for(int i = 0; i < cnt; i++){
			for(int i = 0; i < cnt - 1; i++){
				block_addr = start_addr + mem_block_size * i; 
				appendToDoubleLinkList(&(desc_array[index].free_list), (void *)block_addr);
			}
		}

		block_addr = (unsigned int)popFromDoubleLinkList(&(desc_array[index].free_list));
		addr = block_addr;
		
		arena *a = block2arena((mem_block *)block_addr);
		a->cnt--;
	}

	return addr;
}

void remove_map_entry(unsigned int vaddr)
{
	unsigned int *pte = ptr_pte(vaddr);
	*pte |= PG_P_NO;
}

void free_a_page(unsigned int vaddr, MEMORY_POOL_TYPE pool_type)
{
	VirtualMemoryAddress vm;
	MemPool pool;
	
	if(pool_type == KERNEL){
		vm = KernelVirtualMemory;
		pool = &KernelPool;
	}else{
		// TODO 当前进程的虚拟地址池
		vm = KernelVirtualMemory;
		pool = &UserPool;
	}

	// 释放虚拟内存
	int virtual_page_index = vaddr / PAGE_SIZE;
	set_bit_val(&vm.map, virtual_page_index, 0);
	// 释放物理内存
	int phy_addr = get_physical_address(vaddr);
	int phy_page_index = phy_addr / PAGE_SIZE;
	set_bit_val(&pool->map, phy_page_index, 0);
	// 释放页表	
	remove_map_entry(vaddr);
}

void sys_free(unsigned int addr, unsigned int size)
{
	Proc *current_thread = (Proc *)get_running_thread_pcb();
	MEMORY_POOL_TYPE pool_type;
	
	if(current_thread->page_directory == 0x0){
		pool_type = KERNEL;
	}else{
		pool_type = USER;
	}	

	if(size > 1024){
		unsigned int page_addr = addr - sizeof(arena);
		size += sizeof(arena);
		unsigned int page_cnt = ROUND_UP(size, PAGE_SIZE);
		for(int i = 0; i < page_cnt; i++){
			free_a_page(page_addr, pool_type);
			page_addr += PAGE_SIZE;
		}
	}else{
		unsigned int index = 0;
		for(int i = 0; i < MEM_BLOCK_DESC_KIND_NUM; i++){
			if(kernel_mem_block_decs_array[i].size >= size){
				index = i;
				break;
			}
		}

		mem_block_desc desc = kernel_mem_block_decs_array[index];
		mem_block *block = (mem_block *)addr;
		arena *a = block2arena(block);
		appendToDoubleLinkList(&desc.free_list, (void *)block); 
		a->cnt++;
		// 当一个内存元仓库中的所有小内存块都是空闲状态时，释放这个内存元仓库。
		// 我不理解这样做的原因。
		if(a->cnt == desc.cnt){
			for(int i = 0; i < desc.cnt; i++){
				popFromDoubleLinkList(&desc.free_list);
			}

			free_a_page((unsigned int)a, pool_type);
		}
	}
}

void init_memory_block_desc(mem_block_desc *mem_block_decs_array)
{
	for(int i = 0; i < MEM_BLOCK_DESC_KIND_NUM; i++){
		if(i == 0){
			mem_block_decs_array[i].size = 2;
		}else{
			mem_block_decs_array[i].size = mem_block_decs_array[i-1].size * 2;
		}
		mem_block_decs_array[i].cnt = (PAGE_SIZE - sizeof(arena)) / mem_block_decs_array[i].size;
		initDoubleLinkList(&(mem_block_decs_array[i].free_list));
	} 
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
	
	int map_base_addr = 0xC009A000;
	// 					0xc0100000;
	int k_v_addr 	  = 0xc0100000;
	

	int page_table_size = PAGE_SIZE * 256;
	int used_memory = 0x100000 + page_table_size;	

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
	KernelVirtualMemory.start_addr = k_v_addr + 1024 * 1024;
	Memset(KernelVirtualMemory.map.bits, 0, kbm_length);

	init_memory_block_desc(kernel_mem_block_decs_array);	
}
