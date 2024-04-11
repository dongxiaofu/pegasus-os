#include "stddef.h"
#include "inet.h"

const char *inet_ntop(int af, const void *src, char *dst, socklen_t size)
{
	// TODO 没有检查dst的size。
	if(af == AF_INET){
		uint32_t value = *(uint32_t *)src;
		unsigned int len = 0;
		char *ptr = dst;
		for(int i = 0; i < 4; i++){
			unsigned char byte = (value & (0xFF << (8 * i))) >> (8 * i);
			char str[4] = {0};	
			sprintf(str, "%d", byte); // 使用sprintf进行转换
			len = Strlen(str);
			Strcpy(ptr, str);
			if(i == 3){
				*(ptr + len) = '\0';
			}else{
				*(ptr + len) = '.';
			}
			
			ptr += len + 1;
		}

	}else if(af == AF_INET6){


	}else{
		return NULL;
	}

	return dst;
}
