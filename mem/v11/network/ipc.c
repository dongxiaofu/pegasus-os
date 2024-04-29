#include "syshead.h"
#include "un.h"
#include "in.h"
#include "utils.h"
#include "ipc.h"
#include "socket.h"
#include "udp.h"
#include "stdlib.h"

#define IPC_BUFLEN 4096

static LIST_HEAD(connections);	/* connections是由struct ipc_thread构成的链 */
static int conn_count = 0;

static inline void
ipc_connections_enqueue(struct ipc_thread* th)
{
	//pthread_rwlock_wrlock(&lock);
	list_add_tail(&th->list, &connections); /* 将th->list加入到connections的尾部 */
	conn_count++;
	//pthread_rwlock_unlock(&lock);
}

static inline void
ipc_connections_remove(struct ipc_thread *th)
{
	//pthread_rwlock_wrlock(&lock);
	list_del_init(&th->list);
	conn_count--;
	//pthread_rwlock_unlock(&lock);
}

static struct ipc_thread *
ipc_alloc_thread(int sock)
{
	struct ipc_thread *th = calloc(sizeof(struct ipc_thread), 1);
	list_init(&th->list);
	th->sock = sock;		/* sock仅仅只是一个标记 */
	
	ipc_connections_enqueue(th);
	
	//ipc_dbg("New IPC socket allocated", th);
	return th;
}

static void
ipc_free_thread(int sock)
{
	struct list_head *item, *tmp = NULL;
	struct ipc_thread *th = NULL;

	//pthread_rwlock_rdlock(&lock);
	list_for_each_safe(item, tmp, &connections) {
		th = list_entry(item, struct ipc_thread, list);

		if (th->sock == sock) {		/* sock类似于文件描述符 */
			list_del_init(&th->list);
			conn_count--;
			//ipc_dbg("IPC socket deleted", th);
			close(th->sock);
			sys_free(th);
			break;
		}
	}
	//pthread_rwlock_unlock(&lock);
}

/**\
 * ipc_write_rc 用于对付那些没有数据要返回的函数.
\**/
static int 
ipc_write_rc(int sockfd, pid_t pid, uint16_t type, int rc)
{
	/*
	 返回的数据示意图如下:
	 +----------+----------+
	 | ipc_msg  | ipc_err  |        
	 +----------+----------+
	 
	 */
	int resplen = sizeof(struct ipc_msg);
	struct ipc_msg *response = alloca(resplen);	 /* 在栈上动态分配内存 */
	
	if (response == NULL) {
		print_err("Could not allocate memory for IPC write response\n");
		return -1;
	}

	response->type = type;
	response->pid = pid;

	struct ipc_err err;

	if (rc < 0) {
		err.err = -rc;
		err.rc = -1;
	}
	else {
		err.err = 0;
		err.rc = rc;
	}

	int ipc_err_size = sizeof(struct ipc_err);
	// 不为response->data分配内存会导致page fault。
	char *data = (char *)alloca(ipc_err_size);
	Memcpy(data, &err, ipc_err_size);	/* 直接拷贝err */
	// TODO 在不同的进程之间传递数据。这是业界的通用方法吗？
	response->data = get_physical_address(data);

	// TODO 本想把这些代码封装成函数，但我想不出合适的函数名称，又不愿意在头文件中新增函数。
	unsigned int msg_size = sizeof(Message);
	Message *msg = (Message *)sys_malloc(msg_size);
	// TODO 需要返回数据给请求方。我现在还没有理清全部逻辑，搁置。
	msg->type = SYSCALL_RET;
	msg->BUF = get_physical_address(response) ;
	msg->BUF_LEN = resplen;
	// TODO 需要判断返回值吗？
	send_rec(SEND, msg, pid);

	return 0;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

/**\
 * ipc_read函数用于读取数据.
\**/
static int
ipc_read(int sockfd, struct ipc_msg *msg)
{
	struct ipc_read *requested = (struct ipc_read *)msg->data;
	pid_t pid = msg->pid;
	int rlen = -1;
	char rbuf[requested->len];
	Memset(rbuf, 0, requested->len);
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
	Memcpy(actual->buf, rbuf, rlen > 0 ? rlen : 0);
	
	// if (write(sockfd, (char *)response, resplen) == -1) {
	// 	perror("Error on writing IPC write response");
	// }

	// TODO 本想把这些代码封装成函数，但我想不出合适的函数名称，又不愿意在头文件中新增函数。
	unsigned int msg_size = sizeof(Message);
	Message *message = (Message *)sys_malloc(msg_size);
	unsigned int phy_buf = get_physical_address(message);
	message->TYPE = NET_IPC;
	message->BUF = response;
	message->CNT = resplen;
	send_rec(SEND, message, TASK_NETWORK);

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
	
	Memset(buf, 0, payload->len);
	Memcpy(buf, payload->buf, payload->len > IPC_BUFLEN ? IPC_BUFLEN : payload->len);

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
	Memset(rbuf, 0, requested->len);

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
	Memcpy(actual->buf, rbuf, rlen > 0 ? rlen : 0);

	// if (write(sockfd, (char *)response, resplen) == -1) {
	// 	perror("Error on writing IPC recvfrom response");
	// }

	// TODO 本想把这些代码封装成函数，但我想不出合适的函数名称，又不愿意在头文件中新增函数。
	unsigned int msg_size = sizeof(Message);
	Message *message = (Message *)sys_malloc(msg_size);
	unsigned int phy_buf = get_physical_address(message);
	message->TYPE = NET_IPC;
	message->BUF = response;
	message->CNT = resplen;
	send_rec(SEND, message, TASK_NETWORK);

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
	Memset(buf, 0, payload->len);
	Memcpy(buf, payload->buf, payload->len > IPC_BUFLEN ? IPC_BUFLEN : payload->len);

	if (payload->len > IPC_BUFLEN) {
		// TODO 待功能稳定后，删除下面这行代码。
		// int res = read(sockfd, buf + IPC_BUFLEN, payload->len - IPC_BUFLEN);
		// TODO 本想把这些代码封装成函数，但我想不出合适的函数名称，又不愿意在头文件中新增函数。
		unsigned int msg_size = sizeof(Message);
		Message *message = (Message *)sys_malloc(msg_size);
		int res = send_rec(RECEIVE, message, TASK_NETWORK);
		Memcpy(buf + IPC_BUFLEN, message->BUF, payload->len - IPC_BUFLEN);

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
	// rc = _connect(pid, payload->sockfd, &payload->addr);
	rc = _connect(pid, sockfd, &payload->addr);
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
		Memcpy(&acc->addr, addr, sizeof(struct sockaddr_in));
	// if (write(sockfd, (char *)response, resplen) == -1) {
	// 	perror("Error on writing IPC accept response");
	// }

	// TODO 本想把这些代码封装成函数，但我想不出合适的函数名称，又不愿意在头文件中新增函数。
	unsigned int msg_size = sizeof(Message);
	Message *message = (Message *)sys_malloc(msg_size);
	unsigned int phy_buf = get_physical_address(message);
	message->TYPE = NET_IPC;
	message->BUF = response;
	message->CNT = resplen;
	rc = send_rec(SEND, message, TASK_NETWORK);
	if(rc == -1){
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

void ipc_call_from_netdev_rx(const Message *msg)
{
    Message *result = (Message *)sys_malloc(sizeof(Message));
    result->RETVAL = 0;
    send_rec(SEND, result, TASK_NET_DEV_RX);
}

/**\
 * demux_ipc_socket_call 更多的是实现消息的分发.
\**/
int
demux_ipc_socket_call(int source, int sockfd, char *cmdbuf, int blen, Message *param)
{
	struct ipc_msg *msg = (struct ipc_msg *)cmdbuf;
	// 没有办法。移植别人的代码，只能像这样打补丁。
	// 有时候，结构不是一次性设计出来的。
	msg->pid = source;
	// TODO 这种共享内存的方法实在太麻烦了。
	unsigned int data_size = msg->data_size;
	char *data = (char *)sys_malloc(data_size);
	Memcpy(data, alloc_virtual_memory(msg->data, data_size), data_size);
	msg->data = data;

	Printf("source = %x, type = %x\n", source, msg->type);

	switch (msg->type) {
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
	case IPC_UPDATE_ARP_TABLE:
		return update_arp_translation_table(msg);
	case IPC_INSERT_ARP_TABLE:
		return insert_arp_translation_table(msg);
	case IPC_GET_HWADDR:
		return arp_get_hwaddr(msg);	
	case IPC_GET_NETDEV:
		return netdev_get(msg);
	case IPC_ROUTE_LOOKUP:
		return route_lookup(msg); 
	default:
		print_err("No such IPC type %d\n", msg->type);
		break;
	}
	return 0;
}
