#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "global.h"
#include "network/ipc.h"

int socket_close(int sockfd)
{
	unsigned int ipc_msg_size = sizeof(struct ipc_msg);
	struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
	ipc_msg->type = IPC_CLOSE;
	struct ipc_close *playload = (struct ipc_close *)sys_malloc(sizeof(struct ipc_close));
	playload->sockfd = sockfd;
	ipc_msg->data = (char *)playload;

    Message *msg = (Message *)sys_malloc(sizeof(Message));
    msg->TYPE = IPC_SOCKET_CALL;
	msg->SOCKET_FD = sockfd;

	unsigned int phy_ipc_msg = get_physical_address(ipc_msg);
    msg->BUF =  phy_ipc_msg;
    msg->BUF_LEN = ipc_msg_size;

    send_rec(BOTH, msg, TASK_NETWORK);

    //assert(msg.type == SYSCALL_RET);
    sys_free(msg, sizeof(Message));

    return msg->FD;
}
