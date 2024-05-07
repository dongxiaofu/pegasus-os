#include "syshead.h"
#include "tcp.h"
#include "global.h"
#include "ipc.h"

//struct list_head *tcp_connecting_or_listening_socks;
//struct list_head *tcp_establised_or_syn_recvd_socks;
//tcp_connecting_or_listening_socks = NULL;
//tcp_establised_or_syn_recvd_socks = NULL;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
/* 为了尽可能简洁,所以实现非常简单. */


//static LIST_HEAD(tcp_connecting_or_listening_socks);
//static LIST_HEAD(tcp_establised_or_syn_recvd_socks);
//struct list_head *tcp_connecting_or_listening_socks;
//struct list_head *tcp_establised_or_syn_recvd_socks;

inline void
tcp_established_or_syn_recvd_socks_enqueue(struct sock *sk)
{
	//pthread_rwlock_wrlock(&es_lock);
	list_add_tail(&sk->link, tcp_establised_or_syn_recvd_socks);
	//pthread_rwlock_unlock(&es_lock);
}


inline void
tcp_established_or_syn_recvd_socks_remove(struct sock *sk)
{
	//pthread_rwlock_wrlock(&es_lock);
	list_del_init(&sk->link);
	//pthread_rwlock_unlock(&es_lock);
}

void call_tcp_connecting_or_listening_socks_enqueue(struct sock *sk)
{
    unsigned int ipc_msg_size = sizeof(struct ipc_msg);
    struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
    ipc_msg->type = IPC_TCP_CONNECTING_OR_LISTENING_SOCKS_ENQUEUE;

    unsigned int payload_size = sizeof(struct tcp_connecting_or_listening_socks_enqueue);

	struct tcp_connecting_or_listening_socks_enqueue *payload = \
		(struct tcp_connecting_or_listening_socks_enqueue *)sys_malloc(payload_size);
    payload->sk = get_physical_address(sk);

    ipc_msg->data = (char *)get_physical_address(payload);
    ipc_msg->data_size = payload_size;

    Message *msg = (Message *)sys_malloc(sizeof(Message));
    Memset(msg, 0, sizeof(Message));
    msg->TYPE = IPC_SOCKET_CALL;
    msg->SOCKET_FD = 0;

    unsigned int phy_ipc_msg = get_physical_address(ipc_msg);
    msg->BUF =  phy_ipc_msg;
    msg->BUF_LEN = ipc_msg_size;

    send_rec(SEND, msg, TASK_NET_INIT_DEV);
    //assert(msg.type == SYSCALL_RET);
    sys_free(msg, sizeof(Message));

	return;
}

void tcp_connecting_or_listening_socks_enqueue(struct ipc_msg *msg)
{
	//pthread_rwlock_wrlock(&cl_lock);
    pid_t pid = msg->pid;
    struct tcp_connecting_or_listening_socks_enqueue *payload = \
		(struct tcp_connecting_or_listening_socks_enqueue *)msg->data;
//	struct sock *sk_phy_addr = (struct sock *)payload->sk;
//	unsigned int sock_size = sizeof(struct sock);
//	unsigned int sk_vaddr = alloc_virtual_memory(sk_phy_addr, sock_size); 
//	struct sock *sk = (struct sock *)sys_malloc(sock_size);
//	Memcpy(sk, sk_vaddr, sock_size);

	struct sock *sk_phy_addr = (struct tcp_sock *)payload->sk;
	unsigned int sock_size = sizeof(struct tcp_sock);
	unsigned int sk_vaddr = alloc_virtual_memory(sk_phy_addr, sock_size); 
	struct sock *sk = (struct sock *)sys_malloc(sock_size);
	Memcpy(sk, sk_vaddr, sock_size);
	asm("xchgw %bx, %bx");
	list_add_tail(&sk->link, tcp_connecting_or_listening_socks);
	//pthread_rwlock_unlock(&cl_lock);
}

inline void
tcp_connecting_or_listening_socks_remove(struct sock *sk)
{
	//pthread_rwlock_wrlock(&cl_lock);
	list_del_init(&sk->link);
	//pthread_rwlock_unlock(&cl_lock);
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
static int tcp_set_sport(struct sock *sk, uint16_t port);
static int tcp_listen(struct sock *sk, int backlog);
static struct sock* tcp_accept(struct sock* sk);

struct net_ops tcp_ops = {
	.alloc_sock = &tcp_alloc_sock,
	.init = &tcp_sock_init,
	.connect = &tcp_v4_connect,
	.accept = &tcp_accept,
	.listen = &tcp_listen,
	.send_buf = &tcp_write,
	.recv_buf = &tcp_read,
	.recv_notify = &tcp_recv_notify,	/* recv_notify用于唤醒调用该协议栈的应用程序 */
	.close = &tcp_close,
	.set_sport = &tcp_set_sport,
};

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
struct sock *
	tcp_alloc_sock()
{
	struct tcp_sock *tsk = sys_malloc(sizeof(struct tcp_sock));
	Memset(tsk, 0, sizeof(struct tcp_sock));
	tsk->sk.state = TCP_CLOSE;		/* 最开始处在关闭状态 */
	tsk->flags = 0;
	tsk->backoff = 0;

	tsk->retransmit = NULL;
	tsk->delack = NULL;
	tsk->keepalive = NULL;

	tsk->delacks = 0;
	tsk->parent = NULL;


	tsk->sk.ops = &tcp_ops;
	/* todo: determine mss properly */

	/* 设置最大报文段长度 */
	tsk->rmss = 1460;
	tsk->smss = 1460;

	wait_init(&tsk->wait);
	skb_queue_init(&tsk->ofo_queue);
	list_init(&tsk->accept_queue);
	list_init(&tsk->listen_queue);
	return (struct sock *)tsk;
}


static void
tcp_clear_queues(struct tcp_sock *tsk) 
{
	//pthread_mutex_lock(&tsk->ofo_queue.lock);
	skb_queue_free(&tsk->ofo_queue);
	//pthread_mutex_unlock(&tsk->ofo_queue.lock);

}

int
tcp_free_sock(struct sock *sk)
{
	struct tcp_sock *tsk = tcp_sk(sk);
	//pthread_mutex_lock(&sk->lock);
	tcp_set_state(sk, TCP_CLOSE);
	tcp_clear_timers(sk);
	tcp_clear_queues(tsk);
	//pthread_mutex_unlock(&sk->lock);
	if (sk->sock) sk->sock->sk = NULL;
	sk_free(sk);
	sys_free(tsk);
	tsk = NULL;
	return 0;
}


/**\
 * tcp_init 对整个tcp协议做一些初始化工作.
\**/
int
tcp_init()
{
//	Printf("tcp_init\n");
//	unsigned int size = sizeof(struct list_head);
//	tcp_connecting_or_listening_socks = (struct list_head *)sys_malloc(size);
//	tcp_establised_or_syn_recvd_socks = (struct list_head *)sys_malloc(size);
	return 0;
}

/**\
 * tcp_sock_init 每构建一个tcp_sock,都会调用这个函数对该tcp_sock做初始化 
\**/
int
tcp_sock_init(struct sock *sk)
{
	return 0;
}


/**\
 * tcp_port_used用于判断port端口是否已经被使用.
\**/
static int
tcp_port_used(uint16_t pt)
{
	struct list_head* item;
	struct sock* it;
	/* 遍历监听队列,查看是否port已经被使用 */
	list_for_each(item, tcp_connecting_or_listening_socks) {
		it = list_entry(item, struct sock, link);
		if (it->sport == pt) return 1;
	}
	return 0;
}

/**\
 * tcp_set_sport用于设置源端口,需要保证,port是主机字节序.
\**/
static int
tcp_set_sport(struct sock *sk, uint16_t port)
{
	int err = -1;
	/* 端口号不能为0 */
	if (!port) goto out;
	/* 端口已经被占用 */
	if (port && tcp_port_used(port)) goto out;

	sk->sport = port;
	err = 0;
out:
	return err;
}

int tcp_write(struct sock *sk, const void *buf, const uint32_t len)
{
	// 先想办法执行ipc_tcp_write。
	// 再执行 ip_output(sk, skb);
	struct sk_buff *skb;
	struct tcphdr *th;
	int slen = len;
	struct tcp_sock *tsk = tcp_sk(sk);
	int mss = tsk->smss;
	int dlen = 0;

	while (slen > 0) {
		dlen = slen > mss ? mss : slen; /* 一个tcp报文最多只能发送mss个字节tcp数据 */
		slen -= dlen;
		skb = tcp_alloc_skb(0, dlen); /* tcp头部选项0字节,数据大小dlen字节 */
		skb_push(skb, dlen);
		Memcpy(skb->data, buf, dlen);

		buf += dlen;
		th = tcp_hdr(skb);
		th->ack = 1;

		if (slen == 0){
			th->psh = 1;	/*将推送标志bit置为1,表示接收方一旦接收到这个报文, */
		}
		uint8_t state = sk->state;

		// TODO 调用其他进程。
		call_tcp_write(sk, skb, dlen);
		//ipc_tcp_write(sk, skb);

		if(state != TCP_ESTABLISHED && state != TCP_CLOSE_WAIT){
			ip_output(sk, skb);
		}
	}

	// TODO 随便设置的。
	return 0;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
// TODO 要删除
int
ipc_tcp_write2(struct sock *sk, const void *buf, const uint32_t len)
{
	struct tcp_sock *tsk = tcp_sk(sk);
	int ret = -1;

	switch (sk->state) {
		/* 只有established和close_wait两个状态可以向对端发送数据 */
	case TCP_ESTABLISHED:
	case TCP_CLOSE_WAIT: /* close_wait状态指的是接收到了对端发送的fin,
						 但是此端还可以向对端发送数据 */
		break;
	default:
		goto out;
	}
//	return tcp_send(tsk, buf, len);
out:
	return ret;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
int
tcp_read(struct sock *sk, void *buf, const uint32_t len)
{
	struct tcp_sock *tsk = tcp_sk(sk);
	int ret = -1;

	switch (sk->state) {
	case TCP_CLOSE:
		print_err("error: connectin does not exists\n");
		goto out;
	case TCP_LISTEN:
	case TCP_SYN_SENT:
	case TCP_SYN_RECEIVED:
	case TCP_ESTABLISHED:
	case TCP_FIN_WAIT_1:
	case TCP_FIN_WAIT_2:
		break;
	case TCP_CLOSE_WAIT: /* 到达了close_wait状态之后,对方不应该再发送tcp数据过来 */
		if (!skb_queue_empty(&tsk->sk.receive_queue)) break;
		if (tsk->flags & TCP_FIN) {
			tsk->flags &= ~TCP_FIN;
			return 0;
		}
		break;
		/* closing --两端同时关闭,发送了fin,并且接收到了对方的fin,此时进入closing状态;
		last_ack --服务端向对方发送了fin,只需要接收对方的ACK,就可以进入closed状态;
		time_wait --客户端接收到了处于last_ack状态的服务端发送的fin,最后一次向服务端发送ack;
		以上的这些状态都不可能发送tcp数据给对方. */
	case TCP_CLOSING:
	case TCP_LAST_ACK:
	case TCP_TIME_WAIT:
		print_err("error:  connection closing\n");
		goto out;
	default:
		goto out;
	}
	return tcp_receive(tsk, buf, len);
out:
	return ret;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
int
tcp_close(struct sock *sk)
{
	switch (sk->state) {
		/* 以下这些状态已经正在处理close,不能再次执行close */
	case TCP_CLOSE:
	case TCP_CLOSING:
	case TCP_LAST_ACK:
	case TCP_TIME_WAIT:
	case TCP_FIN_WAIT_1:
	case TCP_FIN_WAIT_2:
		sk->err = -EBADF;
		return -1;
		/* 服务端一般都处在listen状态 */
	case TCP_LISTEN:
		/* 客户端向服务端发送了syn,进入syn_sent状态 */
		tcp_set_state(sk, TCP_CLOSE);
		/* 将其从tcp_connecting_or_listening_socks中删除 */
		tcp_connecting_or_listening_socks_remove(sk);
		tcp_free_sock(sk);
		break;
	case TCP_SYN_SENT:
		/* 服务端接受到了现在处于syn_sent状态的客户端发送的syn,进入syn_received状态,
		正常情况下,要向对方发送syn和ack */
	case TCP_SYN_RECEIVED:
	case TCP_ESTABLISHED:
		tcp_queue_fin(sk);	/* 向对端发送fin,进入fin_wait_1状态 */
		tcp_set_state(sk, TCP_FIN_WAIT_1);
		break;
	case TCP_CLOSE_WAIT:
		/* close_wait属于被动关闭,但是这个状态还可以向对端发送数据,但是一旦向彼方发送了fin
		立即进入lask_ack状态 */
		tcp_queue_fin(sk);
		tcp_set_state(sk, TCP_LAST_ACK);
		break;
	default:
		print_err("Unknown TCP state for close\n");
		return -1;
	}
	return 0;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
int
tcp_recv_notify(struct sock *sk)
{
	if (&(sk->recv_wait)) {
		return wait_wakeup(&sk->recv_wait); /* 唤醒等待的进程 */
	}
	return -1;
}

//static int
//tcp_write_options(struct tcphdr *th, struct tcp_options *opts, int optlen)
//{
//	struct tcp_opt_mss *opt_mss = (struct tcp_opt_mss *)th->data;
//
//	opt_mss->kind = TCP_OPT_MSS;
//	opt_mss->len = TCP_OPTLEN_MSS;
//	opt_mss->mss = htons(opts->mss);
//
//	th->hl = TCP_DOFFSET + (optlen / 4);
//	return 0;
//}

static int 
tcp_syn_options(struct sock *sk, struct tcp_options *opts)
{
	struct tcp_sock *tsk = tcp_sk(sk);
	int optlen = 0;

	opts->mss = tsk->rmss;
	optlen += TCP_OPTLEN_MSS;
	return optlen;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
int
tcp_v4_connect(struct sock *sk, const struct sockaddr_in *addr)
{
	extern char *stackaddr;
	struct tcp_sock *tsk = tcp_sk(sk);
	uint16_t dport = ((struct sockaddr_in *)addr)->sin_port;
	uint32_t daddr = ((struct sockaddr_in *)addr)->sin_addr.s_addr;
	int rc = 0;

	sk->dport = ntohs(dport);
	sk->sport = tcp_generate_port();			  /* 伪随机产生一个端口 */
	sk->daddr = ntohl(daddr);
	sk->saddr = ip_parse(stackaddr);			  /* sk中存储的是主机字节序 */
	// tcp_connecting_or_listening_socks_enqueue(sk);
	//call_tcp_connecting_or_listening_socks_enqueue(sk);
	struct sk_buff *skb;
	struct tcp_options opts = { 0 };
	int tcp_options_len = 0;

	tcp_options_len = tcp_syn_options(sk, &opts);	/* tcp选项的长度 */
	skb = tcp_alloc_skb(tcp_options_len, 0); /* 需要发送tcp选项 */
	// TODO 把这行代码改造为IPC机制。
	// opts和tcp_options_len这两个参数真是草灰蛇线，实在不是个好方法，可我暂时想不到好方法。
	rc = call_tcp_begin_connect(sk, skb, opts, tcp_options_len);					  /* 首先向对方发送ack */

	// TODO 把在tcp_begin_connect中生成的skb提到外面。
	ip_output(sk, skb);
	// call_tcp_connecting_or_listening_socks_enqueue(sk);

	/* 接下来需要等待连接的成功建立 */
	wait_sleep(&tsk->wait);
	tcp_connecting_or_listening_socks_remove(sk);
	tcp_established_or_syn_recvd_socks_enqueue(sk);
out:
	return rc;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

static struct sock*
tcp_accept(struct sock* sk)
{
	struct tcp_sock *tsk = tcp_sk(sk);
	struct tcp_sock *newtsk = NULL;	/* 期待构建一个新的连接 */

	while (list_empty(&tsk->accept_queue)) {
		if (wait_sleep(&tsk->wait) < 0) goto out;	/* 等待被唤醒 */
	}

	newtsk = tcp_accept_dequeue(tsk);


	/* 连接建立成功, 这里不用再次加入,因为唤醒的时候newsk已经在队列中了. */
out:
	return newtsk ? &newtsk->sk : NULL;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

/**\
 * tcp_lookup_established_or_syn_recvd_sock 用于搜寻相关的sock.
\**/
static struct sock*
tcp_lookup_establised_or_syn_recvd_sock(uint32_t src, uint16_t sport, uint32_t dst, uint16_t dport)
{
	struct sock *sk;
	struct list_head* item;
	//pthread_rwlock_rdlock(&es_lock);
	list_for_each(item, tcp_establised_or_syn_recvd_socks) {
		sk = list_entry(item, struct sock, link);
		if ((sk->saddr == src) && (sk->sport == sport) &&
			(sk->daddr == dst) && (sk->dport == dport)) {
			//pthread_rwlock_unlock(&es_lock);
			return sk;
		}
	}
	//pthread_rwlock_unlock(&es_lock);
	return NULL;
}


/**\
 * tcp_lookup_connecting_or_listening_sock 用于搜寻正在监听的sock.
\**/
static struct sock *
	tcp_lookup_connecting_or_listening_sock(uint32_t src, uint16_t sport)
{
	struct sock *sk;
	struct list_head *item;
	//pthread_rwlock_rdlock(&cl_lock);
	list_for_each(item, tcp_connecting_or_listening_socks) {
		sk = list_entry(item, struct sock, link);
		if ((sk->saddr == src) && (sk->sport == sport)) {
			//pthread_rwlock_unlock(&cl_lock);
			return sk;
		}
	}
	//pthread_rwlock_unlock(&cl_lock);
	return NULL;
}

/**\
 * tcp_connection_exist 用于判断连接是否已经存在,主要是避免试图多次连接.
\**/
static int
tcp_connection_exist(uint32_t dst, uint16_t dport)
{
	struct sock *sk;
	struct list_head *item;
	list_for_each(item, tcp_establised_or_syn_recvd_socks) {
		sk = list_entry(item, struct sock, link);
		if ((sk->daddr == dst) && (sk->dport == dport))
			return 1;
	}
	return 0;
}

struct sock *call_tcp_lookup_sock(uint32_t src, uint16_t sport, uint32_t dst, uint16_t dport)
{
    unsigned int ipc_msg_size = sizeof(struct ipc_msg);
    struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
    ipc_msg->type = IPC_TCP_LOOKUP_SOCK; 

    unsigned int payload_size = sizeof(struct tcp_lookup_sock); 
	struct tcp_lookup_sock *payload = sys_malloc(payload_size);
    payload->src = src; 
	payload->sport = sport;
	payload->dst = dst;
	payload->dport = dport;

    ipc_msg->data = (char *)get_physical_address(payload);
    ipc_msg->data_size = payload_size;

    Message *msg = (Message *)sys_malloc(sizeof(Message));
    Memset(msg, 0, sizeof(Message));
    msg->TYPE = IPC_SOCKET_CALL;
    msg->SOCKET_FD = 0;

    unsigned int phy_ipc_msg = get_physical_address(ipc_msg);
    msg->BUF =  phy_ipc_msg;
    msg->BUF_LEN = ipc_msg_size;

    send_rec(BOTH, msg, TASK_NET_INIT_DEV);
    sys_free(msg, sizeof(Message));

	uint32_t sock_phy_addr = msg->BUF;
	uint32_t sock_size = msg->BUF_LEN;
	uint32_t sock_vaddr = alloc_virtual_memory(sock_phy_addr, sock_size);
	uint32_t sock = (uint32_t)sys_malloc(sock_size);
	Memcpy(sock, sock_vaddr, sock_size);

	return (struct sock *)sock;
}

/**\
 * tcp_lookup_sock根据给出的四元组寻找对应的sock.
\**/
struct sock* tcp_lookup_sock(struct ipc_msg *msg)
{
	struct tcp_lookup_sock *payload = (struct tcp_lookup_sock *)msg->data;
	uint32_t dst = payload->dst;
	uint32_t dport = payload->dport;
	uint32_t src = payload->src;
	uint32_t sport = payload->sport;

	struct sock *sk;
	sk = tcp_lookup_establised_or_syn_recvd_sock(dst, dport, src, sport);
	if (!sk) sk = tcp_lookup_connecting_or_listening_sock(dst, dport);
	return sk;
}

struct sock *tcp_lookup_sock2(uint32_t src, uint16_t sport, uint32_t dst, uint16_t dport)
{
	struct sock *sk;
	sk = tcp_lookup_establised_or_syn_recvd_sock(dst, dport, src, sport);
	if (!sk) sk = tcp_lookup_connecting_or_listening_sock(dst, dport);
	return sk;
}

static int
tcp_listen(struct sock *sk, int backlog)
{
	/* 在这里backlog失效 */
	struct tcp_sock *tsk = tcp_sk(sk);
	struct tcb *tcb = &tsk->tcb;

	/* 接下来需要进行一系列的检查 */
	if (!sk->sport) return -1;		/* 没有绑定好端口 */
	if (sk->state != TCP_CLOSE && sk->state != TCP_LISTEN)
		return -1;

	sk->state = TCP_LISTEN;		/* 进入监听状态 */
	/* 接下来需要将sk加入监听队列 */
	tcp_connecting_or_listening_socks_enqueue(sk);
	return 0;
}
