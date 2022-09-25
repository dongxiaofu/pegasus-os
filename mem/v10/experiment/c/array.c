#include <stdio.h>
#include <string.h>

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

	printf("测试数组的间隔\n");
	char buf[5];
	memset(buf, 0,sizeof(buf));
	buf[2] = 'A';
	buf[4] = 'B';
	for(int i = 0; i < 5; i++){
		printf("buf[%d] = %c\n", i, buf[i]);
	}

	printf("测试字符串数组\n");
	char *tty_name[10] = {"dev_tty0", "dev_tty1", "dev_tty2"};
	for(int i = 0; i < 3; i++){
		printf("tty_name[%d] = %s\n", i, tty_name[i]);
	}

	return 0;
}
