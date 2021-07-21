#include <stdio.h>
#include <string.h>
#include <stdlib.h>


struct person{
	int age;
	char name[20];
};

int *f();
int f2();
int *f3();
int *f4();
struct person f5();
struct person *f6();

int main(int argc, char **argv)
{	
	int *t = f();
	printf("t = %p\n", t);	
	printf("*t = %d\n", *t);	
	int t2 = f2();
	printf("t2 = %d\n", t2);	
	int *t3 = f3();
	printf("t3 = %p\n", t3);	
	int *t4 = f4();
	printf("t4 = %p\n", t4);	
	struct person p1 = f5();
	printf("p1.age = %d\n", p1.age);
	struct person *p2 = f6();
	printf("p2->age = %d\n", p2->age);
	return 0;
}

int *f()
{
	int *a = malloc(sizeof(int));
	*a = 54;
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

int *f4()
{
	int a[2]  = {1,2};
	// warning: function returns address of local variable [-Wreturn-local-addr]
	return a;
}

struct person f5()
{
	struct person p1 = {2, "Jim"};
	return p1;
}

struct person *f6()
{
	struct person *p1 = malloc(sizeof(struct person));
	//struct person *p1;
	//*p1 = {2};
	p1->age = 2;
	strcpy(p1->name, "Jim");
	return p1;
}
