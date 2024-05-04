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

ssize_t socket_write(int fildes, const void *buf, size_t nbyte)
{
	unsigned int ipc_msg_size = sizeof(struct ipc_msg);
	struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
	ipc_msg->type = IPC_WRITE;

	struct ipc_write *playload = (struct ipc_connect *)sys_malloc(sizeof(struct ipc_write));
	playload->sockfd = fildes;
	
	// TODO 尝试使用一下alloca。很可能出错。
	uint8_t *vaddr_buf = (uint8_t *)alloca(nbyte);
	Memcpy(vaddr_buf, (uint8_t *)buf, nbyte);
	// TODO 若使用alloca，为啥不直接使用buf？
	playload->buf = get_physical_address(vaddr_buf);
	playload->len = nbyte;
	// TODO 不能在这里使用。
	// sys_free(playload);
	
	ipc_msg->data = (char *)get_physical_address(playload);
	ipc_msg->data_size = sizeof(struct ipc_write);

    Message *msg = (Message *)sys_malloc(sizeof(Message));
    msg->TYPE = IPC_SOCKET_CALL;
	// TODO 能直接在用户进程中使用get_physical_address吗？
	// 当然，在我的OS中，从语法层面看，能使用。可是，那还需要系统调用做什么呢？
	unsigned int phy_ipc_msg = get_physical_address(ipc_msg);
    msg->BUF =  phy_ipc_msg;
    msg->BUF_LEN = ipc_msg_size;
	msg->SOCKET_FD = fildes;

    send_rec(BOTH, msg, TASK_NETWORK);

	phy_ipc_msg = msg->BUF;
	// TODO 像这样在进程之间传递数据实在是比较麻烦。通用做法是怎样的？
	unsigned int vaddr_ipc_msg = alloc_virtual_memory(phy_ipc_msg, msg->BUF_LEN);
	ipc_msg = (struct ipc_msg *)vaddr_ipc_msg;
	unsigned int phy_playload = (unsigned int)ipc_msg->data;
	unsigned int ipc_err_size = sizeof(struct ipc_err);
	unsigned int vaddr_playload = alloc_virtual_memory(phy_playload, ipc_err_size);
	// TODO 一个进程的栈空间只有4KB是合理的吗？
	struct ipc_err *err = (struct ipc_err *)alloca(ipc_err_size);
	Memcpy(err, vaddr_playload, ipc_err_size);
	int result = err->rc;

    sys_free(msg, sizeof(Message));

    return result;
}
