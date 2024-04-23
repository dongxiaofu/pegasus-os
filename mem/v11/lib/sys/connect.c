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

int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen)
{
	unsigned int ipc_msg_size = sizeof(struct ipc_msg);
	struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
	ipc_msg->type = IPC_CONNECT;
//	struct ipc_connect playload = {
//		.sockfd = sockfd,
//		// TODO 像这样写有问题吗？
//		// error: incompatible types when initializing type 'short int' using type 'const struct sockaddr'
//		.addr = *addr
//	};

	struct ipc_connect *playload = (struct ipc_connect *)sys_malloc(sizeof(struct ipc_connect));
	playload->sockfd = sockfd;
	Memcpy(&playload->addr, addr, sizeof(struct sockaddr));
	
	ipc_msg->data = (char *)playload;

    Message *msg = (Message *)sys_malloc(sizeof(Message));
	Memset(msg, 0, sizeof(Message));
    msg->TYPE = IPC_SOCKET_CALL;
	msg->SOCKET_FD = sockfd;

	unsigned int phy_ipc_msg = get_physical_address(ipc_msg);
    msg->BUF =  phy_ipc_msg;
    msg->BUF_LEN = ipc_msg_size;

    send_rec(BOTH, msg, TASK_NETWORK);

    //assert(msg.type == SYSCALL_RET);
    //
    sys_free(msg, sizeof(Message));

	// TODO 需要修改成什么？
    return msg->FD;
}
