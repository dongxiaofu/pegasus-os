#include <stdio.h>
#include <string.h>

void test(char *fmt, ...);
void test2(const char *fmt, char *var_list);

int main(int argc, char **argv)
{
	char *fmt = "I am %d years old\n";
	//test(fmt, 3, 5);
	//char *var_list = (char *)fmt + 4;
	test(fmt, "Hello", "World", "How", "Are", 0);
	return 0;
}

void test(char *fmt, ...)
{
	char *var_list = (char *)((char *)(&fmt) + 4);	
	char **p = (char **)var_list;
	char stack[64];
	memset(stack, 0x0, 64);
	int len = 0;
	while(*p){
		printf("*p = %s\n", *p);
		p++;
		len += sizeof(char *);
	}
	stack[len] = 0;
	len += sizeof(char *);

	char **ptr = (char **)stack;
	char **q = (char **)var_list;
	while(*q){
		*ptr = (char *)(&stack[len]);
		//memcpy(&stack[len], *q, strlen(*q));
		strcpy(&stack[len], *q);
	//	(char *)(&stack[len]) = **q;
		len += strlen(*q);
		stack[len] = 0;
		len += sizeof(char); 
		printf("*q = %s\n", *q);
		q++;
		ptr++;
	}


	printf("print stack\n");

	char **t = (char **)stack;
	while((*t)){
		printf("*t = %x\n", *t);
		t++;
	}

//	test2(fmt, var_list);
	return;
}

void test2(const char *fmt, char *var_list)
{
	printf(fmt);	
	return;
}
