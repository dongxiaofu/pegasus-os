#include "stddef.h"
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
//#include <unistd.h>


// 和socket_write非常相似。直接复制那个函数，然后修改。
// TODO 这个函数和socket_write的相同代码多达百分之九十九点九九九。有空时必须优化。
ssize_t socket_read(int fildes, void *buf, size_t nbyte)
{
	unsigned int ipc_msg_size = sizeof(struct ipc_msg);
	struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
	ipc_msg->type = IPC_READ;

	struct ipc_read *playload = (struct ipc_connect *)sys_malloc(sizeof(struct ipc_read));
	playload->sockfd = fildes;
	
	// TODO 尝试使用一下alloca。很可能出错。
	uint8_t *vaddr_buf = (uint8_t *)alloca(nbyte);
	Memcpy(vaddr_buf, (uint8_t *)buf, nbyte);
	// TODO 若使用alloca，为啥不直接使用buf？
	playload->buf = get_physical_address(vaddr_buf);
	playload->len = nbyte;
	
	ipc_msg->data = (char *)playload;

    Message *msg = (Message *)sys_malloc(sizeof(Message));
    msg->TYPE = IPC_SOCKET_CALL;
	// TODO 能直接在用户进程中使用get_physical_address吗？
	// 当然，在我的OS中，从语法层面看，能使用。可是，那还需要系统调用做什么呢？
	unsigned int phy_ipc_msg = get_physical_address(ipc_msg);
    msg->BUF =  phy_ipc_msg;
    msg->BUF_LEN = ipc_msg_size;

    send_rec(BOTH, msg, TASK_NETWORK);

    //assert(msg.type == SYSCALL_RET);

	sys_free(playload);
    sys_free(msg, sizeof(Message));

    return msg->FD;
}
