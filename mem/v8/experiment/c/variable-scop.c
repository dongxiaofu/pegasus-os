#include <stdio.h>

int f();
int a;

int main(int argc, char **argv)
{
	a = 5;
	f();
	return 0;
}

int f()
{
	printf("a in f is %d\n", a);
	return 0;
}
