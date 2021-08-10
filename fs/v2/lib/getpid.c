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


int getpid() {
    Message msg;

    msg.type = GET_PID;
    send_rec(BOTH, &msg, TASK_SYS);

    return msg.PID;
}
