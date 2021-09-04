#include "stdio.h"

int main(int argc, char *argv[])
{
//	Printf("Hello,World\n");
//	while(1){}
	//for(int i = 1; i < argc; i++){
	for(int i = 0; i < argc; i++){
		//dis_pos = 12000 - 128 + 10 + 160 * 7;
		//Printf("i = %d\n", i);
		Printf("%s%s", i == 0 ? "" : " ", argv[i] );
	}
	Printf("\n");
	Printf("It will be end at last\n");	
//	while(1){}
	return 0;
}
