#include "stddef.h"
#include "string.h"
#include "stdlib.h"

#include "mem.h"
#include "mm.h"
#include "const.h"
#include "type.h"
#include "protect.h"
//#include "fs.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
// global.h需要上面的头文件。我不知道它需要哪个，索性全部都复制过来了。
#include "global.h"
#include "stdint.h"

void *calloc(size_t nmemb, size_t size)
{
	uint32_t len = sizeof(size_t) * nmemb;
	void *mem = (void *)sys_malloc(len); 
	if(mem == NULL){
		return NULL;
	}
	Memset(mem, 0, len); 

	return mem;
}
