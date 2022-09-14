/*
 *  fork_test.c
 *  version 1
 *  Created on: 2010-5-29
 *      Author: wangth
 */
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
		printf("i am the child process, my process id is %d\n",getpid());
		printf("我是爹的儿子\n");//对某些人来说中文看着更直白。
		count++;
		exit(123);
	}
	else {
		printf("i am the parent process, my process id is %d\n",getpid());
		printf("我是孩子他爹\n");
		count++;
		//int res = wait(&status);
		// i = WEXITSTATUS(status);
		printf("子进程退出时传递的数据是：%d\n", i);
	}
	printf("统计结果是: %d\n",count);
	return 0;
}
