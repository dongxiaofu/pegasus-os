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


int wait(int *status) {
    Message msg;

    msg.TYPE = WAIT;
    send_rec(BOTH, &msg, TASK_MM);
    *status = msg.STATUS;

    return (msg.PID == NO_TASK ? -1 : msg.PID);
}
