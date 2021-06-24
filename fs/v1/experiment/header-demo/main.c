#include "a.h"
#include "b.h"
#include "proto.h"

int main(int argc, char *argv[])
{
	say1();
	return 0;
}

void say1()
{
	say2();
	say3();

}


void say5()
{
	printf("%d\n", 5);
}
