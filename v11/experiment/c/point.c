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

	return 0;
}
