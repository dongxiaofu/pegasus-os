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


int network_handle(Message *msg);

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

static int
ipc_read(int sockfd, struct ipc_msg *msg)
{
	struct ipc_read *requested = (struct ipc_read *)msg->data;
	pid_t pid = msg->pid;
	int rlen = -1;
	char rbuf[requested->len];
	memset(rbuf, 0, requested->len);
	/* pid和sockfd可以唯一确定一个socket */
	rlen = _read(pid, requested->sockfd, rbuf, requested->len);
	int resplen = sizeof(struct ipc_msg) + sizeof(struct ipc_err) + sizeof(struct ipc_read) + rlen;
	struct ipc_msg *response = alloca(resplen);
	struct ipc_err *error = (struct ipc_err *)response->data;
	struct ipc_read *actual = (struct ipc_read *)error->data;

	if (response == NULL) {
		print_err("Could not allocate memory for IPC read response\n");
		return -1;
	}

	response->type = IPC_READ;
	response->pid = pid;

	error->rc = rlen < 0 ? -1 : rlen;
	error->err = rlen < 0 ? -rlen : 0;

	actual->sockfd = requested->sockfd;
	actual->len = rlen;
	memcpy(actual->buf, rbuf, rlen > 0 ? rlen : 0);
	
	if (write(sockfd, (char *)response, resplen) == -1) {
		perror("Error on writing IPC write response");
	}

	return 0;
}

static int
ipc_sendto(int sockfd, struct ipc_msg *msg)
{
	struct ipc_sendto *payload = (struct ipc_sendto *)msg->data;
	pid_t pid = msg->pid;
	int rc = -1;
	int dlen = payload->len - IPC_BUFLEN;
	char buf[payload->len];
	
	memset(buf, 0, payload->len);
	memcpy(buf, payload->buf, payload->len > IPC_BUFLEN ? IPC_BUFLEN : payload->len);

	if (payload->len > IPC_BUFLEN) {
		int res = read(sockfd, buf + IPC_BUFLEN, payload->len - IPC_BUFLEN);
		if (res == -1) {
			perror("Read on IPC payload guard");
			return -1;
		}
		else if (res != dlen) {
			print_err("Hmm, we did not read exact payload amount in IPC write\n");
		}
	}
	rc = _sendto(pid, payload->sockfd, buf, payload->len, &payload->addr);
	return ipc_write_rc(sockfd, pid, IPC_SENDTO, rc);
}

static int
ipc_recvfrom(int sockfd, struct ipc_msg *msg)
{
	struct ipc_recvfrom *requested = (struct ipc_recvfrom *)msg->data;
	pid_t pid = msg->pid;
	int rlen = -1;
	char rbuf[requested->len];
	struct sockaddr_in *saddr;
	memset(rbuf, 0, requested->len);

	saddr = requested->contain_addr ? &requested->addr: NULL;

	/* pid和sockfd可以唯一确定一个socket */
	rlen = _recvfrom(pid, requested->sockfd, rbuf, requested->len, saddr);
	int resplen = sizeof(struct ipc_msg) + sizeof(struct ipc_err) + sizeof(struct ipc_recvfrom) + rlen;
	struct ipc_msg *response = alloca(resplen);
	struct ipc_err *error = (struct ipc_err *)response->data;
	struct ipc_recvfrom *actual = (struct ipc_recvfrom *)error->data;

	if (response == NULL) {
		print_err("Could not allocate memory for IPC read response\n");
		return -1;
	}

	response->type = IPC_RECVFROM;
	response->pid = pid;

	error->rc = rlen < 0 ? -1 : rlen;
	error->err = rlen < 0 ? -rlen : 0;

	actual->sockfd = requested->sockfd;
	actual->len = rlen;
	if (saddr) {	/* 拷贝对方的地址信息 */
		actual->addr = *saddr;
	}
	memcpy(actual->buf, rbuf, rlen > 0 ? rlen : 0);

	if (write(sockfd, (char *)response, resplen) == -1) {
		perror("Error on writing IPC recvfrom response");
	}

	return 0;
}


static int
ipc_write(int sockfd, struct ipc_msg *msg)
{
	struct ipc_write *payload = (struct ipc_write *)msg->data;
	pid_t pid = msg->pid;
	int rc = -1;
	int dlen = payload->len - IPC_BUFLEN;
	char buf[payload->len];
	memset(buf, 0, payload->len);
	memcpy(buf, payload->buf, payload->len > IPC_BUFLEN ? IPC_BUFLEN : payload->len);

	if (payload->len > IPC_BUFLEN) {
		int res = read(sockfd, buf + IPC_BUFLEN, payload->len - IPC_BUFLEN);
		if (res == -1) {
			perror("Read on IPC payload guard");
			return -1;
		}
		else if (res != dlen) {
			print_err("Hmm, we did not read exact payload amount in IPC write\n");
		}
	}
	rc = _write(pid, payload->sockfd, buf, payload->len);
	return ipc_write_rc(sockfd, pid, IPC_WRITE, rc);
}

static int
ipc_connect(int sockfd, struct ipc_msg *msg)
{
	struct ipc_connect *payload = (struct ipc_connect *)msg->data;
	pid_t pid = msg->pid;
	int rc = -1;
	rc = _connect(pid, payload->sockfd, &payload->addr);
	return ipc_write_rc(sockfd, pid, IPC_CONNECT, rc); /* 所谓的IPC,只是自己定义的一套规则吗? */
}

static int
ipc_listen(int sockfd, struct ipc_msg *msg)
{
	struct ipc_listen *payload = (struct ipc_listen *)msg->data;
	pid_t pid = msg->pid;
	int rc = -1;
	rc = _listen(pid, payload->sockfd, payload->backoff);
	return ipc_write_rc(sockfd, pid, IPC_LISTEN, rc); /* 所谓的IPC,只是自己定义的一套规则吗? */
}

/**\
 * ipc_bind调用下层的bind函数,模拟bind函数的功能. 
\**/
static int
ipc_bind(int sockfd, struct ipc_msg *msg)
{
	struct ipc_bind *payload = (struct ipc_bind *)msg->data;
	pid_t pid = msg->pid;
	int rc = -1;
	rc = _bind(pid, payload->sockfd, &payload->addr);
	return ipc_write_rc(sockfd, pid, IPC_BIND, rc);
}


static int
ipc_accept(int sockfd, struct ipc_msg *msg)
{
	struct ipc_accept *payload = (struct ipc_accept *)msg->data;
	pid_t pid = msg->pid;
	int rc = -1;
	struct socket *sock;
	struct sockaddr_in *addr = payload->contain_addr ? alloca(sizeof(struct sockaddr)) : NULL;
	rc = _accept(pid, payload->sockfd, addr);	/* 如果rc > 0,那么rc是对应连接的文件描述符 */

	/* acccept的函数,我们必须要自己回复. */
	int resplen = sizeof(struct ipc_msg) + sizeof(struct ipc_err) + sizeof(struct ipc_accept);
	struct ipc_msg *response = alloca(resplen);
	struct ipc_err *error = (struct ipc_err *)response->data;
	struct ipc_accept *acc = (struct ipc_accept *)error->data;

	if (response == NULL) {
		print_err("Could not allocate memorty for IPC accept response\n");
		return -1;
	}

	response->type = IPC_ACCEPT;
	response->pid = pid;

	error->rc = rc;
	error->err = 0; // tofix:

	acc->sockfd = sockfd;
	if (payload->contain_addr)
		memcpy(&acc->addr, addr, sizeof(struct sockaddr_in));
	if (write(sockfd, (char *)response, resplen) == -1) {
		perror("Error on writing IPC accept response");
	}
	return 0;
}

static int
ipc_socket(int sockfd, struct ipc_msg *msg)
{
	struct ipc_socket *sock = (struct ipc_socket *)msg->data;
	pid_t pid = msg->pid;
	int rc = -1;

	rc = _socket(pid, sock->domain, sock->type, sock->protocol);
	return ipc_write_rc(sockfd, pid, IPC_SOCKET, rc);
}

int 
ipc_close(int sockfd, struct ipc_msg *msg)
{
	struct ipc_close *payload = (struct ipc_close *)msg->data;
	pid_t pid = msg->pid;
	int rc = -1;

	rc = _close(pid, payload->sockfd);
	rc = ipc_write_rc(sockfd, pid, IPC_CLOSE, rc);
	return rc;
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

