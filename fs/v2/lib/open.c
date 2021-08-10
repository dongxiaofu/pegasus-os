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

int open(const char *pathname, int flags) {
    Message msg;

    msg.type = OPEN;
    msg.PATHNAME = (void *) pathname;
    msg.FLAGS = flags;
    msg.NAME_LEN = Strlen(pathname);

    send_rec(BOTH, &msg, TASK_FS);

    assert(msg.type == SYSCALL_RET);

    return msg.FD;
}
