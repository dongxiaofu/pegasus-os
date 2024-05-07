#include "syshead.h"
#include "utils.h"
#include "ipc.h"
#include "tcp.h"
#include "ip.h"
#include "skbuff.h"
#include "timer.h"

static void tcp_retransmission_timeout(uint32_t ts, void *arg);


//static struct sk_buff *
//tcp_alloc_skb(int optlen, int size)
//{
//	/*
//	 optlen表示tcp首部选项的大小
//	 这里要特别注意一下,因为忘记了TCP_HDR_LEN导致出错
//	 */
//	int reserved = ETH_HDR_LEN + IP_HDR_LEN + TCP_HDR_LEN + optlen + size; /* ==> 这里的一个错误弄得我好苦! */
//	struct sk_buff *skb = alloc_skb(reserved);
//
//	skb_reserve(skb, reserved); /* skb->data部分留出reserved个字节 */
//	skb->protocol = IP_TCP;
//	skb->dlen = size;	/* dlen表示数据的大小 */
//
//	return skb;
//}

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

//static int 
//tcp_syn_options(struct sock *sk, struct tcp_options *opts)
//{
//	struct tcp_sock *tsk = tcp_sk(sk);
//	int optlen = 0;
//
//	opts->mss = tsk->rmss;
//	optlen += TCP_OPTLEN_MSS;
//	return optlen;
//}

static int 
tcp_transmit_skb(struct sock *sk, struct sk_buff *skb, uint32_t seq)
{
	struct tcp_sock *tsk = tcp_sk(sk);
	struct tcb *tcb = &tsk->tcb;
	struct tcphdr *thdr = tcp_hdr(skb);  /* tcp头部信息 */

	if (thdr->hl == 0) thdr->hl = TCP_DOFFSET;

	skb_push(skb, thdr->hl * 4); /* hl表示tcp头部大小 */

	/* 填充头部信息 */
	thdr->sport = sk->sport;
	thdr->dport = sk->dport;
	thdr->seq = seq;		/* 分组的序号 */
	thdr->ack_seq = tcb->rcv_nxt; /* 携带一个确认序号 */
	thdr->win = tcb->rcv_wnd;	  /* 接收窗口的大小 */
	thdr->csum = 0;
	thdr->urp = 0;
	thdr->rsvd = 0;

//	tcp_out_dbg(thdr, sk, skb);

	/* 记录下要传递的数据包的起始和终止序号,这里主要是为了方便后面的重传
	 具体可以参见tcp_input.c --> tcp_clean_retransmission_queue 函数. */
	skb->seq = tcb->snd_una;
	skb->end_seq = tcb->snd_una + skb->dlen; /* 终止序列号 */

	thdr->sport = htons(thdr->sport);
	thdr->dport = htons(thdr->dport);
	thdr->seq = htonl(thdr->seq);
	thdr->ack_seq = htonl(thdr->ack_seq);
	thdr->win = htons(thdr->win);
	thdr->csum = htons(thdr->csum);
	thdr->urp = htons(thdr->urp);
	// tcp首部的检验和,需要检验首部和数据,在计算检验和时,要在TCP报文段的前面加上12字节伪首部
	/*
		TCP伪首部
	          4                     4              1     1       2
	   +--------------------+-------------------+-----+-----+----------+
	   | saddr              | daddr             | 0   | 6   | len      |
	   +--------------------+-------------------+-----+-----+----------+
	   
	 */
	thdr->csum = tcp_checksum(skb, htonl(sk->saddr), htonl(sk->daddr));

	return 0;
}

/**\
 * tcp_queue_transmit_skb 将要发送的内容加入write_queue,没有接收到ack的话,会一直重
 * 传该数据包,而tcp_transmit_skb函数不会如此. 
\**/
static int
tcp_queue_transmit_skb(struct sock *sk, struct sk_buff *skb)
{
	struct tcp_sock *tsk = tcp_sk(sk);
	struct tcb *tcb = &tsk->tcb;  /* 传输控制块 */
	int rc = 0;

	//pthread_mutex_lock(&sk->write_queue.lock);

	if (skb_queue_empty(&sk->write_queue)) {
		tcp_reset_retransmission_timer(tsk);
	}

	skb_queue_tail(&sk->write_queue, skb);	/* 将skb加入到发送队列的尾部 */
	rc = tcp_transmit_skb(sk, skb, tcb->snd_nxt); /* 首先将数据发送一遍 */
	tcb->snd_nxt += skb->dlen;
	//pthread_mutex_unlock(&sk->write_queue.lock);
//	return ip_output(sk, skb);
	return 0;
}

int
tcp_send_synack(struct sock *sk)
{
	if (sk->state != TCP_SYN_RECEIVED) {
		print_err("TCP synack: Socket was not in correct state (SYN_SENT)\n");
		return 1;
	}

	struct sk_buff *skb;
	struct tcphdr *th;
	struct tcb *tcb = &tcp_sk(sk)->tcb;
	int rc = 0;

	skb = tcp_alloc_skb(0, 0);
	th = tcp_hdr(skb);

	th->syn = 1;
	th->ack = 1;
	/* 不消耗序列号 */
	rc = tcp_transmit_skb(sk, skb, tcb->snd_nxt);
	free_skb(skb);

	return rc;
}

void
tcp_send_delack(uint32_t ts, void *arg)
{
	struct sock *sk = (struct sock *)arg;
	struct tcp_sock *tsk = tcp_sk(sk);

	tsk->delacks = 0;
	tcp_release_delack_timer(tsk);
	tcp_send_ack(sk);
}

/**\
 * tcp_send_ack 发送ack.
\**/
int
tcp_send_ack(struct sock *sk)
{
	if (sk->state == TCP_CLOSE) 
		return 0;

	struct sk_buff *skb;
	struct tcphdr *th;
	struct tcb *tcb = &tcp_sk(sk)->tcb;
	int rc = 0;

	skb = tcp_alloc_skb(0, 0);  /* 需要重新分配数据块,不包含tcp选项,不包含数据 */

	th = tcp_hdr(skb); /* th指向要发送数据的tcp头部 */
	th->ack = 1;

	rc = tcp_transmit_skb(sk, skb, tcb->snd_nxt);
	free_skb(skb);

	return rc;
}

static int
tcp_write_options(struct tcphdr *th, struct tcp_options *opts, int optlen)
{
	struct tcp_opt_mss *opt_mss = (struct tcp_opt_mss *)th->data;

	opt_mss->kind = TCP_OPT_MSS;
	opt_mss->len = TCP_OPTLEN_MSS;
	opt_mss->mss = htons(opts->mss);

	th->hl = TCP_DOFFSET + (optlen / 4);
	return 0;
}

static int
tcp_send_syn(struct sock *sk, struct sk_buff *skb, struct tcp_options opts, int tcp_options_len)
{
	if (sk->state != TCP_SYN_SENT && sk->state != TCP_CLOSE && sk->state != TCP_LISTEN) {
		print_err("Socket was not in correct state (closed or listen)\n");
		return 1;
	}

//	struct sk_buff *skb;
//	struct tcphdr *th;
//	struct tcp_options opts = { 0 };
//	int tcp_options_len = 0;

//	tcp_options_len = tcp_syn_options(sk, &opts);	/* tcp选项的长度 */
//	skb = tcp_alloc_skb(tcp_options_len, 0); /* 需要发送tcp选项 */
	struct tcphdr *th;
	th = tcp_hdr(skb);		/* 指向tcp头部 */

	tcp_write_options(th, &opts, tcp_options_len);
	sk->state = TCP_SYN_SENT;  /* 客户端发送了syn之后,进入syn_sent状态 */
	th->syn = 1;

	return tcp_queue_transmit_skb(sk, skb);
}


int
tcp_send_fin(struct sock *sk)
{
	if (sk->state == TCP_CLOSE) return 0;
	struct tcphdr *th;
	struct sk_buff *skb;
	int rc = 0;

	skb = tcp_alloc_skb(0, 0);

	th = tcp_hdr(skb);
	th->fin = 1;
	th->ack = 1;

	rc = tcp_queue_transmit_skb(sk, skb);

	return rc;
}

void 
tcp_select_initial_window(uint32_t *rcv_wnd)
{
	*rcv_wnd = 44477;
}

static void
tcp_notify_user(struct sock *sk)
{
	struct tcp_sock *tsk = tcp_sk(sk);
	switch (sk->state) {
	case TCP_CLOSE_WAIT:
		wait_wakeup(&tsk->wait);
		break;
	}
}

static void
tcp_connect_rto(uint32_t ts, void *arg)
{
	struct tcp_sock *tsk = (struct tcp_sock *)arg;
	struct tcb *tcb = &tsk->tcb;
	struct sock *sk = &tsk->sk;

	tcp_release_retransmission_timer(tsk);

	if (sk->state != TCP_ESTABLISHED) {
		if (tsk->backoff > TCP_CONN_RETRIES) { /* 如果退避的次数过多,表示连接不通,
											   要通知上层. */
			tsk->sk.err = -ETIMEDOUT;  /* 超时 */
			// tofix: 要将sk从链表中移除
			tcp_free_sock(sk);
		}
		else {
			//pthread_mutex_lock(&sk->write_queue.lock);

			struct sk_buff *skb = write_queue_head(sk);

			if (skb) {
				skb_reset_header(skb);
				tcp_transmit_skb(sk, skb, tcb->snd_una);

				tsk->backoff++;
				tcp_reset_retransmission_timer(tsk);
			}
			//pthread_mutex_unlock(&sk->write_queue.lock);
		}
	}
	else {
		print_err("TCP connect RTO triggered even when Established\n");
	}

}


/**\
 * tcp_retransmission_timeout 如果在规定的时间内还没有收到tcp数据报的确认,那么要重传
 * 该数据包. 
\**/
static void
tcp_retransmission_timeout(uint32_t ts, void *arg)
{
	struct tcp_sock *tsk = (struct tcp_sock *)arg;
	struct tcb *tcb = &tsk->tcb;
	struct sock *sk = &tsk->sk;

	//pthread_mutex_lock(&sk->write_queue.lock);
	tcp_release_retransmission_timer(tsk);

	struct sk_buff *skb = write_queue_head(sk);

	if (!skb) {
		tcp_sock_dbg("TCP RTO queue empty, notifying user", sk);
		tcp_notify_user(sk);
		goto unlock;
	}

	struct tcphdr *th = tcp_hdr(skb);
	skb_reset_header(skb);

	tcp_transmit_skb(sk, skb, tcb->snd_una);
	/* 每个500个时间单位检查一次. */
	// tsk->retransmit = timer_add(500, &tcp_retransmission_timeout, tsk);

	if (th->fin) {
		tcp_handle_fin_state(sk);
	}

unlock:
	//pthread_mutex_unlock(&sk->write_queue.lock);
	return;
}


/**\
 * tcp_reset_retransmission_timer 用于重新设置重传定时器.
\**/
void
tcp_reset_retransmission_timer(struct tcp_sock *tsk)
{
	struct sock *sk = &tsk->sk;
	tcp_release_retransmission_timer(tsk);	/* 释放掉之前的重传定时器 */

	if (sk->state == TCP_SYN_SENT) {	/* backoff 貌似是退避时间 */
		// tsk->retransmit = timer_add(TCP_SYN_BACKOFF << tsk->backoff, &tcp_connect_rto, tsk);
	}
	else {
		/* 500秒超时重传 */
		// tsk->retransmit = timer_add(500, &tcp_retransmission_timeout, tsk);
	}
}

int call_tcp_begin_connect(struct sock *sk, struct sk_buff *skb, struct tcp_options opts, int optlen)
{
	unsigned int ipc_msg_size = sizeof(struct ipc_msg);
	struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
	ipc_msg->type = IPC_TCP_BEGIN_CONNECT; 

	unsigned int payload_size = sizeof(struct ipc_tcp_begin_connect);
	struct ipc_tcp_begin_connect *payload = (struct ipc_tcp_begin_connect *)sys_malloc(payload_size);
	payload->sk = get_physical_address(sk);
	payload->skb = get_physical_address(skb);
	payload->skb_data = get_physical_address(skb->data);
	payload->data_len = skb->all_data_len;

	Memcpy(&payload->opts, &opts, sizeof(struct tcp_options));
	payload->optlen = optlen;
	
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
	
	int result = msg->RETVAL;

    sys_free(msg, sizeof(Message));

	return result;
}

int tcp_begin_connect(struct ipc_msg *msg)
{
	pid_t pid = msg->pid;
	struct ipc_tcp_begin_connect *payload = (struct ipc_tcp_begin_connect *)msg->data;
	uint32_t sk_phy_addr = payload->sk;
	uint32_t skb_phy_addr = payload->skb;

	uint32_t sock_size = sizeof(struct tcp_sock);
	struct sock *sk_vaddr = (struct sock *)alloc_virtual_memory(sk_phy_addr, sock_size);
	struct sock *sk = (struct sock *)sys_malloc(sock_size);
	Memcpy(sk, sk_vaddr, sock_size);

	uint32_t skb_size = sizeof(struct sk_buff);
	struct sk_buff *skb_vaddr = (struct sk_buff *)alloc_virtual_memory(skb_phy_addr, skb_size);
	struct sk_buff *skb = (struct sk_buff *)sys_malloc(skb_size);
	Memcpy(skb, skb_vaddr, skb_size);

	uint32_t skb_data_size = payload->data_len;
	uint32_t skb_data_phy_addr = payload->skb_data;
	uint32_t skb_data_vaddr = alloc_virtual_memory(skb_data_phy_addr, skb_data_size);
	uint8_t *data = (uint8_t *)sys_malloc(skb_data_size);
	Memcpy(data, skb_data_vaddr, skb_data_size);
	skb->data = data;
	skb->head = skb->data;
	skb->end = skb->head + skb->all_data_len;

	uint32_t tcp_options_size = sizeof(struct tcp_options);
	struct tcp_options *opts = (struct tcp_options *)sys_malloc(tcp_options_size);
	Memcpy(opts, &payload->opts, tcp_options_size);
	uint32_t optlen = payload->optlen;

	struct tcp_sock *tsk = tcp_sk(sk);
	struct tcb *tcb = &tsk->tcb;
	int rc = 0;

	tsk->tcp_header_len = sizeof(struct tcphdr);
	tcb->isn = tcp_generate_isn();  /* isn是随机产生的一个序列号 */
	tcb->snd_wnd = 0;
	tcb->snd_wl1 = 0;

	tcb->snd_una = tcb->isn;
	tcb->snd_up = tcb->isn;	
	tcb->snd_nxt = tcb->isn;
	tcb->rcv_nxt = 0;

	tcp_select_initial_window(&tsk->tcb.rcv_wnd); /* 接收窗口的大小 */

	// tcp_send_syn可能由于暂时找不到以太网地址的原因发送失败
	// 但是存在定时器,隔一段时间再次尝试发送.
	rc = tcp_send_syn(sk, skb, *opts, optlen);  
	// 消耗一个序列号.
	tcb->snd_nxt++;  

	Message *result = (Message *)sys_malloc(sizeof(Message));
	result->RETVAL = 0;
	send_rec(SEND, result, pid);

	// TODO 随便设置一个返回值。
	return 0;
}

int call_tcp_write(struct sock *sk, struct sk_buff *skb, uint32_t data_len)
{
	unsigned int ipc_msg_size = sizeof(struct ipc_msg);
	struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
	ipc_msg->type = IPC_TCP_WRITE; 

	unsigned int payload_size = sizeof(struct ipc_tcp_write);
	struct ipc_tcp_write *payload = (struct ipc_tcp_write *)sys_malloc(payload_size);
	payload->sk = get_physical_address(sk);
	payload->skb = get_physical_address(skb);
	payload->skb_data = get_physical_address(skb->data);
	payload->data_len = data_len;
	
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
	
	int result = msg->RETVAL;

    sys_free(msg, sizeof(Message));

	return result;
}

/* tcp_send 发送tcp数据 */
//int ipc_tcp_write(struct sock *sk, struct sk_buff *skb)
int ipc_tcp_write(struct ipc_msg *msg)
{
	pid_t pid = msg->pid;
	struct ipc_tcp_write *payload = (struct ipc_tcp_write *)msg->data;
	uint32_t sk_phy_addr = payload->sk;
	uint32_t skb_phy_addr = payload->skb;

	uint32_t sock_size = sizeof(struct tcp_sock);
	struct sock *sk_vaddr = (struct sock *)alloc_virtual_memory(sk_phy_addr, sock_size);
	struct sock *sk = (struct sock *)sys_malloc(sock_size);
	Memcpy(sk, sk_vaddr, sock_size);

	uint32_t skb_size = sizeof(struct sk_buff);
	struct sk_buff *skb_vaddr = (struct sk_buff *)alloc_virtual_memory(skb_phy_addr, skb_size);
	struct sk_buff *skb = (struct sk_buff *)sys_malloc(skb_size);
	Memcpy(skb, skb_vaddr, skb_size);

	uint32_t skb_data_size = payload->data_len;
	uint32_t skb_data_phy_addr = payload->skb_data;
	uint32_t skb_data_vaddr = alloc_virtual_memory(skb_data_phy_addr, skb_data_size);
	uint8_t *data = (uint8_t *)sys_malloc(skb_data_size);
	Memcpy(data, skb_data_vaddr, skb_data_size);
	
	skb->data = data;
	skb->head = skb->data;
	skb->end = skb->head + skb->all_data_len;

	struct tcp_sock *tsk = tcp_sk(sk);
	int ret = -1;

	tcp_queue_transmit_skb(&tsk->sk, skb);

	Message *result = (Message *)sys_malloc(sizeof(Message));
	result->RETVAL = 0;
	send_rec(SEND, result, pid);

	return 0;
}

/* tcp_send_reset 向对端发送rst */
int
tcp_send_reset(struct tcp_sock *tsk)
{
	struct sk_buff *skb;
	struct tcphdr *th;
	struct tcb *tcb;
	int rc = 0;

	skb = tcp_alloc_skb(0, 0);
	th = tcp_hdr(skb);
	tcb = &tsk->tcb;

	th->rst = 1;
	tcb->snd_una = tcb->snd_nxt;

	/* rst 并不消耗序列号 */
	rc = tcp_transmit_skb(&tsk->sk, skb, tcb->snd_nxt);
	free_skb(skb);
	return rc;
}

int 
tcp_queue_fin(struct sock *sk)
{
	struct sk_buff *skb;
	struct tcphdr *th;
	struct tcb *tcb = &tcp_sk(sk)->tcb;
	int rc = 0;

	skb = tcp_alloc_skb(0, 0);  /* 需要重新分配数据块,不包含tcp选项,不包含数据 */
	th = tcp_hdr(skb);

	th->fin = 1;
	th->ack = 1;

	tcp_sock_dbg("Queueing fin", sk);
	/* 调用tcp_queue_transmit_skb,如果没有及时收到对方对该数据报的ack,会重传该数据包 */
	rc = tcp_queue_transmit_skb(sk, skb);
	/* TCP规定,fin报文即使不携带数据,它也要消耗掉一个序号 */
	tcb->snd_nxt++;	/* fin消耗一个序列号 */

	return rc;
}
