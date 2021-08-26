#include "stdio.h"

int main(int argc, char **argv)
{
	for(int i = 0; i < argc; i++){
		Printf(" %s", argv[i]);
	}
	
	return 0;
}
