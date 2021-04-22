#include <stdio.h>

int main(int argc, char **argv)
{
	int arr[3] = {0,1,2};
	
	printf("arr[0] = %d\n", arr[0]);	
	
	int *ptr = arr;
	printf("arr[0] = %d\n", *ptr);
	ptr++;
	printf("arr[0] = %d\n", *ptr);
	printf("arr[2] - arr = %d\n", &arr[2] - arr);

	
	typedef struct{
		int age;
		int height;
	}Person;
	
	Person arr2[3];

	Person p1 = {23, 24};
	Person p2 = {25, 26};
	Person p3 = {27, 28};

	arr2[0] = p1;
	arr2[1] = p2;
	arr2[2] = p3;	

	printf("arr2[2] - arr2 = %d\n", &arr2[2] - arr2);

	return 0;
}
