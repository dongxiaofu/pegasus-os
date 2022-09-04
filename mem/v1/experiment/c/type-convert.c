#include <stdio.h>

int main(int agc, char *argc[])
{
	char name[32] = "How are you?Fine,thank you.";
	unsigned short *buf = (unsigned short *)name;
	printf("buf = %s\n", buf);

	return 0;
}
