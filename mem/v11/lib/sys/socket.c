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
//#include "ipc.h"

int socket(int domain, int type, int protocol)
{
	unsigned int ipc_msg_size = sizeof(struct ipc_msg);
	struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
	ipc_msg->type = IPC_SOCKET;

	struct ipc_socket *playload = (struct ipc_socket *)sys_malloc(sizeof(struct ipc_socket));
	playload->domain = domain;
	playload->type = type;
	playload->protocol = protocol;
	
	ipc_msg->data = (unsigned char *)playload;
	
    Message *msg = (Message *)sys_malloc(sizeof(Message));
	Memset(msg, 0, sizeof(Message));
    msg->TYPE = IPC_SOCKET_CALL;
	unsigned int phy_ipc_msg = get_physical_address(ipc_msg);
    msg->BUF =  phy_ipc_msg;
    msg->BUF_LEN = ipc_msg_size;

    send_rec(BOTH, msg, TASK_NETWORK);
	asm("xchgw %bx, %bx");


    assert(msg->type == SYSCALL_RET);
	ipc_msg = (struct ipc_msg *)msg->BUF;
	// TODO 像这样在进程之间传递数据实在是比较麻烦。通用做法是怎样的？
	unsigned int phy_playload = ipc_msg;
	unsigned int vaddr_playload = alloc_virtual_memory(phy_playload, msg->BUF_LEN);
	asm("xchgw %bx, %bx");
	// TODO 一个进程的栈空间只有4KB是合理的吗？
	unsigned int ipc_err_size = sizeof(struct ipc_err);
	struct ipc_err *err = (struct ipc_err *)alloca(ipc_err_size);
	Memcpy(err, vaddr_playload, ipc_err_size);
	asm("xchgw %bx, %bx");
	int sockefd = err->rc;

    sys_free(msg, sizeof(Message));

    return sockefd;
}
