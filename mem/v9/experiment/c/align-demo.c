#include <stdio.h>

struct A{
	char a;
	int b;
	short c;
};

int main(){
	struct A a;
	printf("A: %ld\n", sizeof(a));
	return 0;
}
