#include <stdio.h>

int main(int argc, char **argv)
{
	printf("file name:%s\n", __FILE__);
	printf("line:%d\n", __LINE__);
	printf("base file:%s\n", __BASE_FILE__);


	return 0;
}
