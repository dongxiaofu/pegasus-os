#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "global.h"

int open(char *pathname, int flags) {
    Message *msg = (Message *)sys_malloc(sizeof(Message));
	Memset(msg, 0, sizeof(Message));
    msg->TYPE = OPEN;//OPEN;
	unsigned int phy_pathname = get_physical_address(pathname);
    msg->PATHNAME =  phy_pathname;
    // todo FLAGS FD定义了吗？
    msg->FLAGS = flags;
    msg->NAME_LEN = Strlen(pathname);

    send_rec(BOTH, msg, TASK_FS);

    //assert(msg.type == SYSCALL_RET);
    //
    sys_free(msg, sizeof(Message));

    return msg->FD;
}
