#include <stdio.h>

char (*pFunc)(int n);
char func(int n)
{
	return 'a';
}

int main(int argc, char **argv)
{
	pFunc = func;
	char res = (*pFunc)(3);
	printf("res = %c\n", res);

	return 0;
}
