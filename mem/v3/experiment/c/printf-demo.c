#include <stdio.h>

int f();
int f2(int num);
int f3();
int main(int argc, char **argv)
{
	//char format[100] = "x is %p\n";
	char format[100] = "x is %p, %d\n";
	int num = 10;
	//printf(format, &num);
	printf(format, &num, num);
	f();
	f2(10);
	f3();
	return 0;

}

int f()
{

	return 0;
}

int f2(int num)
{

	return num;
}

int f3()
{
	int num = 10;
	return num;
}
