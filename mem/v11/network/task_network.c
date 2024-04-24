#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "mem.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"

// 网络协议。
void task_network() {
	Printf("------network is running\n");

	netdev_init();
	route_init();

	Message *msg = (Message *)sys_malloc(sizeof(Message));
    while (1) {
		Memset(msg, 0, sizeof(Message));
		send_rec(RECEIVE, msg, ANY);
		unsigned int type = msg->TYPE;
		unsigned int source = msg->source;
		// TODO 会接收到type不是IPC_SOCKET_CALL的数据吗？
		// 会。收到这样的数据，不处理。
		if(type != IPC_SOCKET_CALL){
			continue;
		}

		int sockfd = msg->SOCKET_FD;
		unsigned int phy_addr_buf = msg->BUF;
		unsigned int len = msg->BUF_LEN;
		// TODO 在用户进程中能直接使用alloc_virtual_memory吗？
		// 在OS中，用户进程是command中的代码运行起来创建的进程。
		unsigned int vaddr_buf = alloc_virtual_memory(phy_addr_buf, len); 
		char *buf = (char *)sys_malloc(len);
		Memcpy((char *)buf, vaddr_buf, len);

        int rc = demux_ipc_socket_call(source, sockfd, buf, len);	/* 分发 */

		if (rc == -1) {
			Printf("Error on demuxing IPC socket call\n");
			close(sockfd);
			return NULL;
		}
    }
}

void task_netdev_rx()
{
	Printf("------netdev_rx_loop is running\n");
	netdev_rx_loop();
}
