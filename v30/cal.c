#include <stdio.h>

int main(int argc ,char **argv)
{
	int a = 0x0104ce54;
	int b = 0x01049dc0;
	int diff = a - b;
	printf("diff = %d\n", diff);
	return 0;
}
