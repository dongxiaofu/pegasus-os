#include "stdio.h"
#include "string.h"
#include "mem.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"

int test_bit_val(int idx)
{
	
	return 0;
}

int set_bit_val(int idx)
{
	
	return 0;
}

int get_bits(int cnt)
{
	
	return 0;
}

// 申请一个物理页框
int get_a_page(int type, MemPool pool)
{

	return 0;
}
// 申请一个虚拟内存地址
// cnt是页框数量
// 每个进程的虚拟内存地址池不同，是不是要指定进程？
int get_virtual_address(int cnt)
{

	return 0;
}
// 增加映射条目
void add_map_entry(int vaddr, int phy_addr)
{

}

int alloc_memory(int cnt)
{

	return 0;
}

