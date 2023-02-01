#include <stdio.h>
#include <stdlib.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#define BUFSIZE 2048

int main()
{
	int shmid;
	char *shmaddr;

	if((shmid = shmget(IPC_PRIVATE, BUFSIZE, 0666)) < 0){
		perror("shmget");
		exit(1);
	}else{
		printf("created shared-memory: %d\n", shmid);
	}
	system("ipcs -m");

	if((shmaddr = shmat(shmid, 0, 0)) < (char *)0){
		perror("shmat");
		exit(1);
	}else{
		printf("attached shared-memory\n");
	}
	system("ipcs -m");

	if(shmdt(shmaddr) < 0){
		perror("shmdt");
		exit(1);
	}else{
		printf("detached shared-memory\n");
	}
	system("ipcs -m");

	if(shmctl(shmid, IPC_RMID, NULL) < 0){
		perror("shmctl");
		exit(1);
	}else{
		printf("delete shared-memory\n");
	}
	system("ipcs -m");

	exit(0);
}

