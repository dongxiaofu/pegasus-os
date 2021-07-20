#include <stdio.h>
int *f();
int f2();
int *f3();

int main(int argc, char **argv)
{	
	int *t = f();
	printf("t = %p\n", t);	
	printf("*t = %d\n", *t);	
	int t2 = f2();
	printf("t2 = %d\n", t2);	
	int *t3 = f3();
	printf("t3 = %p\n", t3);	
	return 0;
}


int *f()
{
	int *a;
	//*a = 54;
	
	return a;
}


int f2()
{
	int a = 54;
	
	return a;
}


int *f3()
{
	int a = 54;
	
	// warning: function returns address of local variable [-Wreturn-local-addr]
	return &a;
}
