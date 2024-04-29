#ifndef IPC_H_
#define IPC_H_

#include "syshead.h"
#include "in.h"
#include "list.h"
#include "arp.h"


#define DEBUG_IPC
#ifdef DEBUG_IPC
#define ipc_dbg(msg, th)													\
    do {																	\
        print_debug("IPC sockets count %d, current sock %d, tid %lu: %s",	\
                    conn_count, th->sock, th->id, msg);						\
    } while (0)
#else
#define ipc_dbg(msg, th)
#endif


#define IPC_SOCKET	 0x0001
#define IPC_CONNECT  0x0002
#define IPC_WRITE    0x0003
#define IPC_READ     0x0004
#define IPC_CLOSE    0x0005
#define IPC_BIND	 0x0006
#define IPC_ACCEPT   0x0007
#define IPC_LISTEN   0x0008
#define IPC_SENDTO   0x0009
#define IPC_RECVFROM 0x000a
#define IPC_API		 0x000b
// 勤快一点，多记一个vim命令，我就不必逐个费劲自己逐个敲入小写字母对应的大写字母了。
#define IPC_INSERT_ARP_TABLE         0x000b
#define IPC_UPDATE_ARP_TABLE         0x000c
#define IPC_GET_HWADDR               0x000d
#define IPC_GET_NETDEV               0x000e
#define IPC_ROUTE_LOOKUP             0x000f

struct ipc_thread {
    struct list_head list;
    int sock;
    //pthread_t id;
    int id;
};

struct ipc_msg {
    uint16_t type;
    pid_t pid;
	//error: invalid use of flexible array member
    //uint8_t data[];
    uint8_t *data;
	uint32_t data_size;
} __attribute__((packed));

struct ipc_err {
    int rc;				/* 用于记录函数运行的结果 */
    int err;			/* 用于记录errno */
    uint8_t data[];
} __attribute__((packed));

/* ipc_socket主要用于传递socket函数的参数 */
struct ipc_socket {
    int domain;
    int type;
    int protocol;
} __attribute__((packed));

/* ipc_connect主要用于传递connnect函数的参数 */
struct ipc_connect {
    int sockfd;
    struct sockaddr_in addr;
} __attribute__((packed));

struct ipc_accept {
	int sockfd;
	int contain_addr;	/* 是否需要包含地址信息 */
	struct sockaddr_in addr;
} __attribute__((packed));

struct ipc_recvfrom {
	int sockfd;
	size_t len;
	int contain_addr;	/* 是否包含了地址信息 */
	struct sockaddr_in addr;
	uint8_t buf[];
} __attribute__((packed));

struct ipc_bind {
	int sockfd;
	struct sockaddr_in addr;
} __attribute__((packed));

struct ipc_write {
    int sockfd;
    size_t len;
    uint8_t *buf;
} __attribute__((packed));

struct ipc_sendto {
	int sockfd;
	size_t len;
	struct sockaddr_in addr;
	uint8_t buf[];
} __attribute__((packed));


struct ipc_listen {
	int sockfd;
	int backoff;
} __attribute__((packed));

struct ipc_read {
    int sockfd;
    size_t len;
    uint8_t *buf;
} __attribute__((packed));

struct ipc_close {
    int sockfd;
} __attribute__((packed));

//struct ipc_update_arp_table {
//	struct arp_hdr hdr;
//	struct arp_ipv4 data;
//} __attribute__((packed));
//
//struct ipc_insert_arp_table {
//	struct arp_hdr hdr;
//	struct arp_ipv4 data;
//} __attribute__((packed));

//struct ipc_update_arp_table {
//	uint8_t *arp_hdr;
//	uint8_t *arp_ipv4;
//} __attribute__((packed));
//
//struct ipc_insert_arp_table {
//	uint8_t *arp_hdr;
//	uint8_t *arp_ipv4;
//} __attribute__((packed));

struct ipc_route_lookup {
    uint32_t daddr;
} __attribute__((packed));

int route_lookup(struct ipc_msg *msg);
#endif
