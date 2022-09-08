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


int fork() {
    Message msg;
	Memset(&msg, 0, sizeof(Message));

    msg.TYPE = FORK;
    send_rec(BOTH, &msg, TASK_MM);

    assert(msg.TYPE = SYSCALL_RET);
    assert(msg.RETVAL == 0);
    return msg.PID;
}
