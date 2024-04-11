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

// 网络协议。
void task_network() {
	char tty1[10] = "dev_tty1";
	int fd_stdout = open(tty1, O_RDWR);

	Printf("------network is running\n");

	Message *msg = (Message *)sys_malloc(sizeof(Message));

    while (1) {
		Memset(msg, 0, sizeof(Message));
		send_rec(RECEIVE, msg, ANY);
		unsigned int type = msg->TYPE;
		unsigned int source = msg->source;
		if(type != NET_IPC){
			continue;
		}
		char *buf = msg->BUF;
		int blen = 256;
		int sockfd = 0;
        int rc = demux_ipc_socket_call(sockfd, buf, blen);	/* 分发 */

		if (rc == -1) {
			Printf("Error on demuxing IPC socket call\n");
			close(sockfd);
			return NULL;
		}
    }
}

void task_netdev_rx()
{
	netdev_rx_loop();
}

