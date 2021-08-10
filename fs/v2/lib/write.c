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

int write(int fd, const void *buf, int count) {
    Message msg;

    msg.type = WRITE;
    msg.FD = fd;
    msg.BUF = buf;
    msg.CNT = count;

    send_rec(BOTH, &msg, TASK_FS);

    return msg.CNT;
}
