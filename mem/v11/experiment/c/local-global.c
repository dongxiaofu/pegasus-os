#include <stdio.h>

int *f1(int num, int num2, int num3, int num4, int num5);
//int *f1(int num, int num2, int num3, int num4);
// int *f1(int num);
int *f2();
int f3();

int main(int argc, char **argv)
{
	int num = 10;
	int num2 = 20;
	int num3 = 30;
	int num4 = 40;
	int num5 = 50;
	//int *p1 = f1(num, num2, num3, num4, num5);
	// int *p1 = f1(num, num2);
	int *p1 = f1(num, num5, num3, num2, num4);
//	printf("first:%d\n", *p1);
//	printf("second:%d\n", *p1);
//	printf("address of p1:%p\n", p1);
//	printf("address of num:%p\n", &num);
//
//	int *p2 = f2();
//	printf("p2 first:%d\n", *p2);
//	printf("p2 second:%d\n", *p2);
	return 0;
}


int *f1(int num, int num2, int num3, int num4, int num5)
//int *f1(int num, int num2, int num3, int num4)
// int *f1(int num)
{
	//printf("address of num:%p\n", &num);
	return &num;
}

int *f2()
{
	
	int num = 10;
	int num2 = 30;
	int num3 = 40;
	f1(num, 20, num2, num3, 16);
	f3();
	//printf("address of local num:%p\n", &num);
	return &num;
}

int f3()
{
	int num = 10;
	//printf("address of local num:%p\n", &num);
	return num;
}
