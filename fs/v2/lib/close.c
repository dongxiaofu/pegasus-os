#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"

int close(int fd)
{
	Message msg;

	msg.type = CLOSE;
	msg.FD = fd;
	
	send_rec(BOTH, &msg, TASK_FS);

	assert(msg.type == SYSCALL_RET);

	return msg.RET_VAL;
}
