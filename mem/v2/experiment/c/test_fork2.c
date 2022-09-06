#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/wait.h>
int main ()
{
	pid_t fpid; //fpid表示fork函数返回的值
	int count=0;
	int status,i;
	fpid=fork();
	if (fpid < 0)
		printf("error in fork!");
	else if (fpid == 0) {
		sleep(10);
		printf("I am the child process, my process id is %d\n",getpid());
		count++;
		exit(123);
	}
	else {
		printf("I am the parent process, my process id is %d\n",getpid());
		count++;
		//int res = wait(&status);
		// i = WEXITSTATUS(status);
		printf("The child exits status：%d\n", i);
	}
	printf("count is: %d\n",count);
	return 0;
}
