#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "console.h"
#include "proto.h"
#include "global.h"

void cleanup(Proc *proc);

int alloc_mem(int pid, int memory_size);

int do_fork(Message *msg);

void do_exit(Message *msg, int *exit_code);

void do_wait(Message *msg);

int do_exec(Message *msg);

void TaskMM();

void TaskMM(){
//	Printf("MM is running\n");

	while(1){
		Message msg;

		send_rec(RECEIVE, &msg, ANY);

		int type = msg.TYPE;
		int source = msg.source;
		int reply = 1;
//		Printf("source = %d\n", source);

		//assert(source == INIT_PID);
		
		// 调试
//		Printf("mm type = %x\n", type);
//		assert(type == FORK || type == EXEC || type == EXIT);
		
		int *data;		
		int pid;
		Message m;
    m.TYPE = SYSCALL_RET;
	m.RETVAL = 0;

	char *t = (char *)(0x0006d073+0xA00000);

		switch(type){
			case FORK:
				m.PID = do_fork(&msg);
				break;
		case EXEC:
			reply = 0;
			do_exec(&msg);
			break;
		case EXIT:
			reply = 0;
			do_exit(&msg, data);
			break;
		case WAIT:
			reply = 0;
			do_wait(&msg);
				break;
			default:
				panic("MM unknown type\n");
				break;
		}

		if(reply){
    			send_rec(SEND, &m, source);
		}
	}
}

int alloc_mem(int pid, int memory_size)
{
//	if(memory_size > PROC_IMAGE_DEFAULT_SIZE){
//		panic("can not support such large memeory");
//	}

	int address = USER_PROC_MEM_BASE + (pid - TASK_PROC_NUM - USER_PROC_NUM) * PROC_IMAGE_DEFAULT_SIZE;
//	int address = USER_PROC_MEM_BASE + (pid - TASK_PROC_NUM - USER_PROC_NUM) * memory_size;

	if(address + memory_size >= 0x8246c){
		
//		panic("can not support such large memeory");
	}

	return address;
}

