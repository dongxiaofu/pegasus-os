#include <stdio.h>

struct Person{
	int age;
	struct Person *next;
};

int main(int argc, char **argv)
{
	// 会导致段错误
	//char *str2 = "";// = "hello";
	//*str2 = 'A';
	
	//int *a;
	int *k;
	int b = 7;
	int *a = (int *)(&b);
	int *f;
	char *tmp;
	int c = 9;
	struct Person p2 = {47, NULL};
	struct Person person;
	person.age = 52;
	person.next = &p2;
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
	
	char buf[4] = {0x00, 0x01, 0x02, 0x03};
	short *buf2 = (short *)buf;


	return 0;
}
