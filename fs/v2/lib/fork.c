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

    msg.type = FORK;
    send_rec(BOTH, &msg, TASK_FS);

    assert(msg.type = SYSCALL_RET);
    assert(msg.RETVAL == 0);
    return msg.PID;
}
