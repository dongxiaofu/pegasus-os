#include <stdio.h>
#include <string.h>

void f(char *name);
void f2(const char *name);

int main(int argc, char **argv)
{
	char name[20] = "hello";
	f(name);
	printf("name = %s\n", name);
	f2(name);
	printf("name = %s\n", name);
	return 0;
}


void f(char *name)
{
	strcpy(name, "hi");
}

void f2(const char *name)
{
	strcpy(name, "how are you?");
}
