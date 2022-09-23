#include <stdio.h>

int main(int argc, char **argv)
{
	char filename[6] = "hello";
	char *t = filename;
	t++;
	t++;
	printf("t - filename = %d\n", t - filename);
	int nums[3] = {1,2,3};
	int *p = nums;
	p++;
	p++;
	printf("p - nums = %d\n", p - nums);
	return 0;
}
