#include <stdio.h>

int main(int argc, char **argv)
{
	int arr[3] = {0,1,2};
	
	printf("arr[0] = %d\n", arr[0]);	
	
	int *ptr = arr;
	printf("arr[0] = %d\n", *ptr);
	ptr++;
	printf("arr[0] = %d\n", *ptr);
	return 0;
}
