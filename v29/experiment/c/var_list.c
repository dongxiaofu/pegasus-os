#include <stdio.h>

void test(char *fmt, ...);
void test2(const char *fmt, char *var_list);

int main(int argc, char **argv)
{
	char *fmt = "I am %d years old\n";
	//test(fmt, 3, 5);
	//char *var_list = (char *)fmt + 4;
	test(fmt, 398, 5, 4, 8);
	return 0;
}

void test(char *fmt, ...)
{
	char *var_list = (char *)((char *)(&fmt) + 4);	
	test2(fmt, var_list);
	return;
}

void test2(const char *fmt, char *var_list)
{
	printf(fmt);	
	return;
}
