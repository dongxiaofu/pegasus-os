#include <stdio.h>
#include <string.h>

int main(int argc, char **argv)
{
	char str[20];
	//memset(str, 0, sizeof(char) * 20);
	
	char *p0 = str;
	char **p = &p0;
	*((*p)++) = 'A';
	*(*p)++ = 'B';
	*(*p++) = '\0';
	//printf("p = %s\n", *p);
	printf("p = %s\n", str);
	return 0;
}
