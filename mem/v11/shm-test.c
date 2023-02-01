#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<sys/shm.h>
 
int main()
{
    //合成键
    printf("%d进程：合成键\n",getpid());
    key_t key = ftok("./hello",1);
    if(key == -1)
    {
        perror("ftok");
        return -1;
    }
    //获取共享内存
    printf("%d进程：获取共享内存\n",getpid());
    int shm_id = shmget(key,100000,0600);
    if(shm_id == -1)
    {
        perror("shmget");
        return -1;
    }
    //加载共享内存
    printf("%d进程：加载共享内存\n",getpid());
    void* shm_addr = shmat(shm_id,NULL,0);
    if(shm_addr == (void*)-1)
    {
        perror("shmat");
        return -1;
    }
    //读取共享内存
    printf("%d进程：读取共享内存\n",getpid());
    getchar();
    printf("%s\n",(char*)shm_addr);
    //卸载共享内存
    printf("%d进程：卸载共享内存\n",getpid());
    if(shmdt(shm_addr) == -1)
    {
        perror("shmdt");
        return -1;
    }
    return 0;
}
 
