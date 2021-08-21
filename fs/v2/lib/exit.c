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


void exit(int status) {
    Message msg;

    msg.TYPE = EXIT;
    msg.STATUS = status;
    send_rec(BOTH, &msg, TASK_MM);

    assert(msg.TYPE == SYSCALL_RET);
}
