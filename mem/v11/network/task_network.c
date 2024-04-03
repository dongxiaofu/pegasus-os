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

// 网络协议。
#include "syshead.h"
#include "utils.h"
#include "ipc.h"
#include "socket.h"
#include "udp.h"


int network_handle(Message *msg);

// 网络协议。
void task_network() {
	char tty1[10] = "dev_tty1";
	int fd_stdout = open(tty1, O_RDWR);

	Printf("------network is running\n");

	Message *msg = (Message *)sys_sys_malloc(sizeof(Message));

    while (1) {
		Memset(msg, 0, sizeof(Message));
		send_rec(RECEIVE, msg, ANY);
		unsigned int type = msg->TYPE;
		unsigned int source = msg->source;
		if(type != NET_IPC){
			continue;
		}
		char *buf = msg->BUF;
        rc = demux_ipc_socket_call(sockfd, buf, blen);	/* 分发 */

		if (rc == -1) {
			Printf("Error on demuxing IPC socket call\n");
			close(sockfd);
			return NULL;
		}
    }
}

int network_handle(Message *msg) {
    send_rec(RECEIVE, msg, ANY);
    unsigned int type = msg->TYPE;
 	unsigned int source = msg->source;

    switch (type) {
		case IPC_SOCKET:
			return ipc_socket(sockfd, msg);
		case IPC_CONNECT:
			return ipc_connect(sockfd, msg);
		case IPC_WRITE:
			return ipc_write(sockfd, msg);
		case IPC_READ:
			return ipc_read(sockfd, msg);
		case IPC_BIND:
			return ipc_bind(sockfd, msg);
		case IPC_ACCEPT:
			return ipc_accept(sockfd, msg);
		case IPC_CLOSE:
			return ipc_close(sockfd, msg);
		case IPC_LISTEN:
			return ipc_listen(sockfd, msg);
		case IPC_SENDTO:
			return ipc_sendto(sockfd, msg);
		case IPC_RECVFROM:
			return ipc_recvfrom(sockfd, msg);
        default:
            spin("Unknown Operation");
            break;
    }
}

