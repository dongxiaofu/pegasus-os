#include "stdio.h"

int main(int argc, char *argv[])
{
	for(int i = 1; i < argc; i++){
		Printf("%s%s", i == 1 ? "" : " ", argv[i] );
	}
	return 0;
}
