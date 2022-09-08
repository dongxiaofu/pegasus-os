#include <stdio.h>

// int f(char *fmt, int a, char *str);
int f(char *fmt, ...);
int f2(char *fmt, void *next_arg);
int main(int argc, char *argv)
{
	char fmt[20] = "hello, world!";
	int a = 10;
	char str[10] = "hi";
	f(fmt, a, str);	
	return 0;
}


// int f(char *fmt, int a, char *str)
int f(char *fmt, ...)
{
	char c = *fmt;
	void *next_arg = (void *)((char *)&fmt + 4);
	f2(fmt, next_arg);
	return 0;
}


int f2(char *fmt, void *next_arg)
{
	printf(fmt);
	printf("a is %d\n", *((int *)next_arg));
	printf("str is %s\n", *((char **)(next_arg + 4)));

	return 0;
}
