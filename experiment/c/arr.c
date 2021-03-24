#include <stdio.h>

int main(int argc, char **argv)
{
	int arr[5];

	for(int i = 0; i < 5; i++){
		arr[i] = i;
	}

	int *ptr = arr;
	
	ptr++;
	printf("*ptr - arr = %d\n", ptr - arr);
	
	ptr++;
        printf("*ptr - arr = %d\n", ptr - arr);

	ptr++;
        printf("*ptr - arr = %d\n", ptr - arr);

	for(int j = 0; j < 5; j++){
		printf("arr[%d] = %d\n", j, j);
	}

	return 0;
}
