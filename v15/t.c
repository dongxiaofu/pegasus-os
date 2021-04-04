#include <stdio.h>
char gdt_ptr2[6];
int main(void)
{
	int arr[2] = {1,2};
	printf("arr[0] = %d\n", arr[0]);
	
	typedef struct{
        unsigned short seg_limit_below;
        unsigned short seg_base_below;
        unsigned char  seg_base_middle;
        unsigned char seg_attr1;
        unsigned char seg_limit_high_and_attr2;
        unsigned char seg_base_high;
}Descriptor;

	printf("Descriptor size = %d\n", sizeof(Descriptor));
	
	typedef struct
{
    int a;
    char b;
    double c; 
} Simple2;

	
	printf("int size = %d\n", sizeof(int));
	printf("char size = %d\n", sizeof(char));
	printf("double size = %d\n", sizeof(double));
	printf("Simple2 size = %d\n", sizeof(Simple2));

	struct {char b; double x;} a;
	printf("a size = %d\n", sizeof(a));

	return 0;
}
