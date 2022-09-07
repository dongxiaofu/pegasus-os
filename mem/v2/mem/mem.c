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

int test_bit_val(Bitmap map, int idx)
{
	int byte_idx = idx / 8;
	int bit_idx = idx % 8;	
	char val = map->bits[byte_idx];
	int bit_val = (val & (1 << bit_idx)) >> bit_idx;

	return (bit_val > 0 ? 1 : 0);
}

int set_bit_val(Bitmap map, int idx, int val)
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
	
	// TODO 在这个函数需要返回值吗？
	return 1;
}

int set_bits(Bitmap map, int idx, int val, int cnt)
{
	for(int i = 0; i < cnt; i++){
		set_bit_val(map, idx++, val);
	}

	// TODO 在这个函数需要返回值吗？
	return 1;
}

int get_first_free_bit(Bitmap map, int idx)
{
	int length = map->length * 8;

	for(int i = idx; i < length; i++){
		if(test_bit_val(map, i) == 0){
			return i;
		}
	}

	return -1;
}

int get_bits(Bitmap map, int cnt)
{
	int first_free_bit = get_first_free_bit(map, 0);
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

// 申请一个物理页框
int get_a_page(int type, MemPool pool)
{
	// 找到位图中的空闲bit，返回它的索引。
	Bitmap map = pool->map;
	int index = get_bits(map, 1);
	// TODO 内存不足，无法分配。
	int addr = pool->start_addr + PAGE_SIZE * index;
	// 把第index个bit设置成1。
	set_bit_val(map, index, 1);

	return addr;
}

// 申请一个虚拟内存地址
// cnt是页框数量
// 每个进程的虚拟内存地址池不同，是不是要指定进程？
int get_virtual_address(Bitmap map, int cnt)
{
	int index = get_bits(map, cnt);
	int addr = PAGE_SIZE * index;
	set_bits(map, index, 1, cnt);

	return addr;
}

int *ptr_pde(int vaddr)
{
	// return ((1023 << 22) + (1023 << 12) + (vaddr >> 22) * 4);
	return (int *)((1023 << 22) + (1023 << 12) + (vaddr >> 22) * 4);
}

int *ptr_pte(int vaddr)
{
	// 00000000001111111111000000000000 是 0x3ff000。
	return (int *)((1023 << 22) + (vaddr >> 22) << 12 + ((vaddr & 0x3ff000) >> 12) * 4);
}
// 增加映射条目
void add_map_entry(int vaddr, int phy_addr)
{
	// 获取PDE的虚拟地址
	// void *pde = ptr_pde(vaddr);
	int *pde = ptr_pde(vaddr);
	// 获取PTE的虚拟地址
	// void *pte = ptr_pte(vaddr);
	int *pte = ptr_pte(vaddr);
	
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
			// *pte = addr;
			*pte = phy_addr;
		}
	}else{
			// TODO 内存池没有规划好，只能先这样。
			int type = 1;
			MemPool pool = 0x0;
			int addr = get_a_page(type, pool);
		// 要把这个页框初始化。
		*pde = addr;
		Memset(pde, 0, PAGE_SIZE);

		// TODO 这样写，就可以了吗？
		*pte = phy_addr;

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

int alloc_memory(int cnt)
{
	// TODO pool的值应该是多少？
	MemPool pool = 0x0;
	Bitmap map = map;
	int vaddr = get_virtual_address(map, cnt);

	while(cnt--){
		int phy_addr = get_a_page(1, pool);
		add_map_entry(vaddr, phy_addr);
		vaddr += PAGE_SIZE;
	}

	return vaddr;
}

