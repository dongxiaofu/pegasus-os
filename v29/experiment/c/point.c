#include <stdio.h>

int main(int argc, char **argv)
{
	//int *a;
	int b = 7;
	int *a = (int *)(&b);
	int c = 9;
	*a = c;
	printf("a = %p\n", a);
	printf("*a = %d\n", *a);
	printf("b = %d\n", b);
	int *e = &b;
	printf("e = %d\n", *e);
	//int *f = b;
	//printf("f = %d\n", *f);

	char *str = "hello";
	char **ps = &str;

	return 0;
}
