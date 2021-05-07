#include <stdio.h>

int main(int argc, char **argv)
{
	char buf[30] = "Hello,World!";
	char *p = buf;
	
	printf("buf[30] = %s\n", p);

	printf("p = %c\n", *p);
	p++;
	printf("p = %c\n", *p);
	p++;

	printf("p = %c\n", *p);
	printf("p = %s\n", p);

	return 0;
}
