#include "stdio.h"

int main(int argc, char *argv[])
{
//	asm ("xchgw %bx, %bx");
//	Printf("%s\n", argv[0]);
//	asm ("xchgw %bx, %bx");
	Printf("--------Hello,World-----------\n");

	for(int i = 0; i < argc; i++){
		Printf("%s%s", i == 0 ? "" : " ", argv[i] );
	}

	Printf("\n=========Hello,World=================\n");
	Printf("It will be end at last\n");	

	return 0;
}
