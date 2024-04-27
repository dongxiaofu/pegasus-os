#include "string.h"
#include "stdlib.h"

int sscanf(const char *str, const char *format, ...)
{
	unsigned int str_len = Strlen(str);
	unsigned int format_len = Strlen(format);

	int *arg_list = (int *)((int *)&format + 1);
	int *next_arg = arg_list;

	char *ptr_str = (char *)str;
	char *ptr_format = (char *)format;

	for(int i = 0; i < format_len; i++){
		if(*ptr_format != '%' && *ptr_str++ != *ptr_format++){
			break;
		}	

		
		if(*ptr_format == '%'){
			ptr_format++;
			// continue;
		}else{
			continue;
		}

		switch(*ptr_format){
			case 'd':
				{
					// 解析str中的十进制数字字符串。
					char *start = ptr_str;
					while('0' <= *ptr_str && *ptr_str <= '9'){
						ptr_str++;
					}
					unsigned int len = ptr_str - start;
					char *buf = (char *)sys_malloc(len + 1);
					Memset(buf, 0, len + 1);
					Memcpy(buf, start, len);
					// 成功把十进制数字字符串解析出来了，并且存储到了buf中。
					// TODO 怎么识别参数的数据类型？在函数内部无法识别。
					int number = atoi(buf);
					// *next_arg = number;
					*(unsigned int *)(*next_arg) = number;
					next_arg++;
					ptr_format++;
					break;
				}
			case 'c':
				{
					if(0 <= *ptr_str && *ptr_str <= 127){
						if('0' <= *ptr_str && *ptr_str <= '9'){
							*(unsigned char *)(*next_arg) = *ptr_str++ - '0';
						}else{
							*(unsigned char *)(*next_arg) = *ptr_str++;
						}
					}
					next_arg++;
					ptr_format++;
					break;
				}
			case 's':
				{
					char *start = ptr_str;
					// while(*ptr_str != '\0'){
					// while(*ptr_str != 0){
					while(*ptr_str != 32 && *ptr_str != '\0'){
						ptr_str++;
					}
					unsigned int len = ptr_str - start;
					Memcpy((char *)(*next_arg), start, len);
					char *dst = (char *)(*next_arg);
					// *(dst + len + 1) = '\0';
					// *(dst + len) = '\0';
					*(dst + len) = 0;
					next_arg++;
					ptr_format++;
					break;
				}
			case 'h':
				{
					// TODO 时间有限，对sscanf的格式字符串不是特别熟悉，所以只支持%hhu这种。
					ptr_format++;		// 跳过h。
					ptr_format++;		// 跳过h。
					
					// TODO 有空时，把进制种类改成枚举类型。
					char number_base = 1;   // 进制种类：1-二进制；2-八进制；3-十六进制。

					if(*ptr_format == 'u'){
						number_base = 1;
					}else if(*ptr_format == 'x'){
						number_base = 3;
					}else{
						// do nothing
					}

					char *start = ptr_str;
			//		while('0' <= *ptr_str && *ptr_str <= '9'){
			//			ptr_str++;
			//		}
			//		while('a' <= *ptr_str && *ptr_str <= 'f'){
			//			ptr_str++;
			//		}
			//		while('A' <= *ptr_str && *ptr_str <= 'F'){
			//			ptr_str++;
			//		}
					while(('0' <= *ptr_str && *ptr_str <= '9')	\
						||('a' <= *ptr_str && *ptr_str <= 'f')	\
						||('A' <= *ptr_str && *ptr_str <= 'F')){
						ptr_str++;
					}
						
					unsigned int len = ptr_str - start;
					char *buf = (char *)sys_malloc(len + 1);
					Memset(buf, 0, len + 1);
					Memcpy(buf, start, len);
					// 成功把十进制数字字符串解析出来了，并且存储到了buf中。
					// TODO 怎么识别参数的数据类型？在函数内部无法识别。
					int number = 0;
					if(number_base == 1){
						number = atoi(buf);
					}else if(number_base == 3){
						number = (int)strtol(buf, NULL, 16);
					}else{
						// TODO do nothing
					}
					// *next_arg = number;
					// *(unsigned int *)(*next_arg) = number;
					// 上面这行代码是错误的。我花了很多时间才发现这个错误。
					// unsigned char *决定数据占用一个字节。
					// unsigned int *决定数据占用四个字节。
					*(unsigned char *)(*next_arg) = (unsigned char)number;
					next_arg++;
					ptr_format++;
					break;
				}
			default:
				{

				}

		}

	}
}
