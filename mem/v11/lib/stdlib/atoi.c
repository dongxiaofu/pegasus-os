#include "string.h"
//TODO 这个文件头究竟是否需要？
#include "stdlib.h"

int atoi(const char *nptr)
{
	char *ptr = (char *)nptr;
	// 符号：1-正数；-1-负数。
	char sign = 1;

	int num = 0;

	// TODO 还需要清理”  345”这种字符串前面的空格，但我现在懒得这样做。
	int len = Strlen(nptr);
	
	for(int i = 0; i < len; i++){
		//TODO 需要处理正数吗？
		//熟悉这个问题，因此写代码非常快。
		if(i == 0 && *ptr == '-'){
			sign = -1;
			continue;
		}
		// "435.2"，直接把小数点和它后面的字符串丢弃。
		// TODO 其他OS也这样做吗？
		// if(*ptr == '.')	break;
		if(*ptr < '0' || *ptr > '9'){
			break;
		}
		//num = (num * 10 + (*ptr - '0')) * sign;
		num = num * 10 + (*ptr - '0');
		ptr++;
	}

	// 如果是负数。
	// 正数变为负数的方法是：取反加一。
	// 用 num = -1 * num求负数，可靠吗？
	if(sign == -1){
		num = ~num;
		num += 1;

	}

	return num;
}
