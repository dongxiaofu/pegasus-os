#include "stddef.h"
#include "string.h"

int strcmp(const char *s1, const char *s2)
{
	unsigned int len1 = Strlen(s1);
	unsigned int len2 = Strlen(s2);

	unsigned int min = len1 > len2 ? len2 : len1;

	for(int i = 0; i < min; i++){
		// if(*s1++ == *s2++){
		if(*s1 == *s2){
			*s1++;
			*s2++;
			continue;
		}

		// if(*s1++ > *s2++){
		if(*s1 > *s2){
			return 1;
		}else{
			return -1;
		}
	}
}
