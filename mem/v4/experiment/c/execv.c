#include <unistd.h>
int main(int argc, char **argv)
{
	// execl("/bin/ls","ls", "-al", "./", (char *)0);
	//execl("./echo", "echo2", "Hello", "World", (char *)0);

	char * argv2[] = {"echo", "Hello", "World",  (char*)0};
	execv("./echo", argv2);

	return 0;
}
