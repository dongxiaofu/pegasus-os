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

#include "global.h"
#include "net.h"
#include "wait.h"
#include "netdev.h"
#include "ip.h"

void init_dev()
{
	netdev_init();
	route_init();

	// TODO 没有其他办法，只能放在这里。
	unsigned int size = sizeof(struct list_head);
	tcp_connecting_or_listening_socks = (struct list_head *)sys_malloc(size);
	tcp_connecting_or_listening_socks->prev = tcp_connecting_or_listening_socks->next = tcp_connecting_or_listening_socks;

	tcp_establised_or_syn_recvd_socks = (struct list_head *)sys_malloc(size);
	tcp_establised_or_syn_recvd_socks->prev = tcp_establised_or_syn_recvd_socks->next = tcp_establised_or_syn_recvd_socks;

	Message *msg = (Message *)sys_malloc(sizeof(Message));

	   // 向TASK_NET_DEV_RX进程发送netdev数据。
//    Message *msg_netdev = (Message *)sys_malloc(sizeof(Message));
//    unsigned int phy_buf = get_physical_address(netdev);
//    msg_netdev->BUF = phy_buf;
//    msg_netdev->BUF_LEN = sizeof(struct netdev);
//    send_rec(SEND, msg_netdev, TASK_NET_DEV_RX);

//    send_rec(SEND, msg_netdev, TASK_NETWORK);

	while(1){
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
		
		int rc = demux_ipc_socket_call(source, sockfd, buf, len, msg);	/* 分发 */
		
		if (rc == -1) {
			Printf("Error on demuxing IPC socket call\n");
			close(sockfd);
			return NULL;
		}
	}
}

// 网络协议。
void task_network() {
	Printf("------network is running\n");

//	netdev_init();
//	route_init();

	// 从其他进程获取netdev。
	Message *msg = (Message *)sys_malloc(sizeof(Message));
	Memset(msg, 0, sizeof(Message));
	// TODO INTERRUPT 应该修改为解除阻塞的进程。
//    send_rec(RECEIVE, msg, TASK_NET_INIT_DEV);
//	unsigned int phy_buf = msg->BUF;
//	unsigned int len = msg->BUF_LEN;
//	unsigned int vaddr_buf = alloc_virtual_memory(phy_buf, len); 
//	Memcpy(netdev, vaddr_buf, sizeof(struct netdev));
//	sys_free(msg, sizeof(Message));

//	if(netdev == NULL){
		uint8_t *addr = "10.0.1.4";
		addr = ip_parse(addr);
		netdev = call_netdev_get(addr);
//	}

//	Printf("netdev->addr = %x\n", netdev->addr);
//	print_array(netdev->hwaddr, 6);

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

        int rc = demux_ipc_socket_call(source, sockfd, buf, len, msg);	/* 分发 */

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

	// 从其他进程获取netdev。
//	Message *msg = (Message *)sys_malloc(sizeof(Message));
//	Memset(msg, 0, sizeof(Message));
//	// TODO INTERRUPT 应该修改为解除阻塞的进程。
//    send_rec(RECEIVE, msg, TASK_NET_INIT_DEV);   // 向TASK_NET_DEV_RX进程发送netdev数据。
//	unsigned int phy_buf = msg->BUF;
//	unsigned int len = msg->BUF_LEN;
//	unsigned int vaddr_buf = alloc_virtual_memory(phy_buf, len); 
//	Memcpy(netdev, vaddr_buf, sizeof(struct netdev));
//	sys_free(msg, sizeof(Message));
//
//	Printf("task:%x-%x-%x\n", netdev->hwaddr[0], netdev->hwaddr[1],netdev->hwaddr[2]); 

	uint8_t *addr = "10.0.1.4";
	addr = ip_parse(addr);
	netdev = call_netdev_get(addr);
	netdev_rx_loop();
}
