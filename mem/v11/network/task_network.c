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


void network_handle(Message *msg);

// 网络协议。
void task_network() {
	char tty1[10] = "dev_tty1";
	int fd_stdout = open(tty1, O_RDWR);

	Printf("------network is running\n");

	Message *msg = (Message *)sys_malloc(sizeof(Message));

    while (1) {
		Memset(msg, 0, sizeof(Message));
        network_handle(msg);
    }
}

void network_handle(Message *msg) {
    send_rec(RECEIVE, msg, ANY);
    unsigned int type = msg->TYPE;
 	unsigned int source = msg->source;

    switch (type) {
		case HARD_INT:
			break;
        default:
            spin("Unknown Operation");
            break;
    }
}

