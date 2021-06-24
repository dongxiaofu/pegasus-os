#include <stdio.h>
#include <stdlib.h>

#include "proto.h"

void say3()
{
	printf("%d\n", 3);
	say5();
	exit(-1);
}


