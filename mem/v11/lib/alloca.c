#include "alloca.h"
#include "math.h"

// 调用此函数时，size是最新的局部变量。
// 下一个局部变量的地址和这个局部变量的地址之差就是要分配的内存空间。
void *alloca(size_t size)
{
	unsigned int size_of_size = sizeof(size_t);
	unsigned int len = size * size_of_size;
	
	return sys_malloc(len);

	unsigned int address = ((unsigned int)(&size)) - len;

	Memset(address, 0, len);

	return (void *)address;
}
