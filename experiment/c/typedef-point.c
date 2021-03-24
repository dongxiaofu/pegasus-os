#include <stdio.h>

typedef char (*PTRFUNC)(int n);

char func(int n)
{
	return (char)n;
}

int main(int argc, char **argv)
{
	PTRFUNC pFunc = func;
	char res = (*pFunc)(65);
	printf("res = %c\n", res);
	return 0;
}
