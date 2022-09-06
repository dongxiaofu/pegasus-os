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
	
	return 0;
}

int set_bit_val(Bitmap map, int idx, int val)
{
	// TODO 判断idx
	
	return 1;
}

int set_bits(Bitmap map, int idx, int val, int cnt)
{
	for(int i = 0; i < cnt; i++){
		set_bit_val(map, idx++, val);
	}
}

int get_bits(Bitmap map, int cnt)
{
	
	return 0;
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

// 增加映射条目
void add_map_entry(int vaddr, int phy_addr)
{

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

