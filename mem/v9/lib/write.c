#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "global.h"

int write(int fd, const void *buf, int count) {
	unsigned int msg_size = sizeof(Message);
    Message *msg = (Message *)sys_malloc(msg_size);

	unsigned int phy_buf = get_physical_address(buf);
	// unsigned int phy_buf = buf;

    msg->TYPE = WRITE;
    msg->FD = fd;
    msg->BUF = phy_buf;
    msg->CNT = count;

    send_rec(BOTH, msg, TASK_FS);

	unsigned int cnt = msg->CNT;

	sys_free(msg, msg_size);

    return cnt;
}
