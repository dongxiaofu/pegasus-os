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
	Memset(&msg, 0, sizeof(Message));
    msg.TYPE = OPEN;//OPEN;
    msg.PATHNAME = (void *) pathname;
    // todo FLAGS FD定义了吗？
    msg.FLAGS = flags;
    msg.NAME_LEN = Strlen(pathname);

	Printf("lib open start\n");
    send_rec(BOTH, &msg, TASK_FS);
	Printf("lib open end\n");

    //assert(msg.type == SYSCALL_RET);

    return msg.FD;
}
