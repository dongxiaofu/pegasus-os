#include "syshead.h"
#include "utils.h"
#include "basic.h"
#include "netdev.h"
#include "skbuff.h"
#include "ethernet.h"
#include "ip.h"
#include "tuntap.h"
#include "arp.h"
#include "if_ether.h"

#include "global.h"
#include "net.h"
#include "wait.h"

//struct netdev *loop;
//struct netdev *netdev; /* 用于记录本机地址,包括ip和mac地址 */
extern int running;

char *receive_msg_from_nic();
//
// addr表示ip地址, hwadddr表示mac地址, mtu表示最大传输单元的大小
static struct netdev *
netdev_alloc(char *addr, char* hwaddr, uint32_t mtu)
{
	/* hwaddr表示硬件地址 */
	struct netdev *dev = sys_malloc(sizeof(struct netdev));
	dev->addr = ip_parse(addr);		/* 记录下ip地址 */

	sscanf(hwaddr, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx",
		&dev->hwaddr[0],
		&dev->hwaddr[1],
		&dev->hwaddr[2],
		&dev->hwaddr[3],
		&dev->hwaddr[4],
		&dev->hwaddr[5]);				/* 记录下mac地址 */

	dev->addr_len = 6;					/* 地址长度 */
	dev->mtu = mtu;						/* 最大传输单元 */

	return dev;
}


void 
netdev_init()
{
	/* 本地环回地址 */
	loop = netdev_alloc("127.0.0.1", "00:00:00:00:00:00", 1500);
	/* 下面的mac地址是捏造的. */
	netdev = netdev_alloc("10.0.1.4", "00:0c:29:6d:50:25", 1500);
}

/**\
 * netdev_transmit 用于对上层传递过来的数据包装以太网头部(数据链路层)
\**/
int 
netdev_transmit(struct sk_buff *skb, uint8_t *dst_hw, uint16_t ethertype)
{
	struct netdev *dev;
	struct eth_hdr *hdr;
	int ret = 0;

	dev = skb->dev;
	skb_push(skb, ETH_HDR_LEN);
	hdr = (struct eth_hdr *)skb->data;

	/* 拷贝硬件地址 */
	Memcpy(hdr->dmac, dst_hw, dev->addr_len); /* 对端的mac地址 */
	Memcpy(hdr->smac, dev->hwaddr, dev->addr_len); /* 本端的mac地址 */
	
	//eth_dbg("out", hdr);
	hdr->ethertype = htons(ethertype);	/* 帧类型 */
	/* 回复,直接写即可 */
	// ret = tun_write((char *)skb->data, skb->len);
	//DriverSend((char *)skb->data, skb->len);
	Printf("send to physical network\n");
	DriverSend(skb->data, skb->len);
	
	// TODO 暂时返回1。
	return 1;
}

static int 
netdev_receive(struct sk_buff *skb)
{
//	// 从其他进程获取netdev。
//	Message *msg = (Message *)sys_malloc(sizeof(Message));
//	Memset(msg, 0, sizeof(Message));
//	// TODO INTERRUPT 应该修改为解除阻塞的进程。
//    send_rec(RECEIVE, msg, TASK_NETWORK);
//	unsigned int phy_buf = msg->BUF;
//	unsigned int len = msg->BUF_LEN;
//	unsigned int vaddr_buf = alloc_virtual_memory(phy_buf, len); 
//	Memcpy(netdev, vaddr_buf, sizeof(struct netdev));
//	sys_free(msg, sizeof(Message));

	struct eth_hdr *hdr = eth_hdr(skb);  /* 获得以太网头部信息,以太网头部包括
										 目的mac地址,源mac地址,以及类型信息 */
	// disp_int(hdr->ethertype);
	Printf("hdr->ethertype = %x\n", hdr->ethertype);
	//eth_dbg("in", hdr);
	/* 以太网头部的Type(类型)字段 0x86dd表示IPv6 0x0800表示IPv4
	0x0806表示ARP */
	switch (hdr->ethertype) {
	case ETH_P_ARP:	/* ARP  0x0806 */
		arp_rcv(skb);
		break;
	case ETH_P_IP:  /* IPv4 0x0800 */
		ip_rcv(skb);
		break;
	case ETH_P_IPV6: /* IPv6 0x86dd -- not supported! */
	default:
		Printf("Unsupported ethertype %x\n", hdr->ethertype);
		free_skb(skb);
		break;
	}
	return 0;
}


void interrupt_wait2() {
    Message *msg = (Message *)sys_malloc(sizeof(Message));
    Memset(msg, 0, sizeof(Message));
    // todo INTERRUPT 拼写正确吗？
    send_rec(RECEIVING, msg, INTERRUPT);
    sys_free(msg, sizeof(Message));
}


/* netdev_rx_loop */
void *
netdev_rx_loop()
{
// 是否注释，可能要看情况。
//	netdev_init();
//	route_init();

	while (1) {
		wait_sleep(0);

		unsigned char status = get_interrupt_status();
		// TODO 如果status是指针，我确定可以这样使用。如果它不是指针，我不知道能不能这样做。
		// interrupt_status irs = (interrupt_status)status;
		interrupt_status irs = {0};
		Memcpy(&irs, &status, sizeof(interrupt_status));
//	Printf("prx = %x, ptx = %x, rxe = %x, rdc = %x\n", irs.prx, irs.ptx, irs.rxe, irs.rdc);
	disp_str("\n=====================\n");

//	/sm("xchgw %bx, %bx");

	int size = 256;
	if(irs.prx == 1){
		char *buf = receive_msg_from_nic();
		struct sk_buff *skb = alloc_skb(BUFLEN);		/* 1600 */
		//Printf("skb0 = %x\n", skb);
		/* skb是对数据的一个简单封装,真正的数据在skb->data中,skb的其他域是对数据的一些描述 */
		/* tun_read每一次会读取一个数据报,即使该数据长度达不到1600 */
		// int len = tun_read((char *)skb->data, BUFLEN);  
		Memcpy((char *)skb->data, buf, BUFLEN);
		int len = 2;
		if (len < 0) {									
			perror("ERR: Read from tun_fd");
			free_skb(skb);
			return NULL;
		}
		netdev_receive(skb);
	}else if(irs.rdc == 1){
		StartSendToPhysicalLink();
	}

		set_interrupt_status(0x7F);
	}

	return NULL;
}

struct netdev* 
call_netdev_get(uint32_t sip)
{
    unsigned int ipc_msg_size = sizeof(struct ipc_msg);
    struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
    ipc_msg->type = IPC_GET_NETDEV;

    unsigned int payload_size = sizeof(struct ipc_get_netdev);

    struct ipc_get_netdev *payload = (struct ipc_get_netdev *)sys_malloc(payload_size);
    payload->sip = sip;

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

	struct netdev *dev;
	unsigned int netdev_phy_addr = msg->BUF;
	if(netdev_phy_addr == NULL){
		dev = NULL;
	}else{
		unsigned int netdev_size = sizeof(struct netdev);
		unsigned int netdev_vaddr = alloc_virtual_memory(netdev_phy_addr, netdev_size);
		struct netdev *dev = (struct netdev *)sys_malloc(netdev_size);
		Memcpy(dev, netdev_vaddr, netdev_size);
	}

    sys_free(msg, sizeof(Message));

    return dev;
}

int netdev_get(struct ipc_msg *msg)
{
	struct netdev *dev = NULL;
    pid_t pid = msg->pid;
    struct ipc_get_netdev *param = (struct ipc_get_netdev *)msg->data;
    uint32_t sip = param->sip;

	if (netdev->addr == sip) {
		dev = netdev; /* 将static local variable的地址传递出去, netdev包含mac地址信息 */
	}
	
	Message *result = (Message *)sys_malloc(sizeof(Message));
	if(dev == NULL){
    	result->BUF = get_physical_address(netdev);
		result->BUF_LEN = sizeof(struct netdev);
	}else{
		result->BUF = NULL;
		result->BUF_LEN = 0;
	}
    send_rec(SEND, result, pid);
	sys_free(result);

	// TODO 不知道该返回什么。
	return 0;
}

void 
free_netdev()
{
	sys_free(loop);
	sys_free(netdev);
}

/**\
 * local_ipaddress用于判断addr是否为本机地址.
\**/
int
local_ipaddress(uint32_t addr)
{
	/* 传入的addr是本机字节序表示的ip地址 */
	struct netdev *dev;
	if (!addr) /* INADDR_ANY */
		return 1;
	/* netdev的addr域记录的是本机字节序的ip地址 */
	if (addr == netdev->addr) return 1;
	if (addr == loop->addr) return 1;
	return 0;
}

char *receive_msg_from_nic()
{
	unsigned int pageStart = 16 * 1024;
	unsigned char curr_page = get_curr_page();
	disp_str("#");
	disp_int(curr_page);
	disp_str("#\n");
//	没有NULL，只能用0。略感惊讶，我的OS中还不能使用NULL。
//	我使用过链表，不用NULL用什么解决问题的？
	NIC_PAGE_BUF_NODE bufLinkList = 0;	
	NIC_PAGE_BUF_NODE preNode = 0;
	unsigned int size = 256;
	unsigned char startPage = nic_current_page;
	unsigned char endPage = curr_page;
	Printf("nic_current_page = %x, endPage = %x\n", nic_current_page, endPage);
	nic_current_page = curr_page;
	unsigned int pageNum = 0;
	//unsigned int endPage = 1516 / 256;
	unsigned int cnt = 1516/256;
	for(int k = startPage; k < endPage; k++){
	//for(int k = 0; k < cnt; k++){
		pageNum++;
		char *buf = (char *)sys_malloc(size); 
		Memset(buf, 0, size);
	//	Printf("k * size = %x\n", (startPage + k) * size);
		SetPageStart(k * size);
//		/sm("xchgw %bx, %bx");
		unsigned int len = NICtoPC(buf, size, (startPage + k) * size);
	//	disp_int(buf[16]);
	//	disp_int(buf[17]);
		// 把从NIC中读取的数据存储到单链表中。
		unsigned int nodeSize = sizeof(struct nic_page_buf_node);
		NIC_PAGE_BUF_NODE node = (NIC_PAGE_BUF_NODE)sys_malloc(nodeSize);
		Memset(node, 0, nodeSize);
		if(bufLinkList == 0){
			bufLinkList = node;
			node->buf = buf + 4;
		}else{
			node->buf = buf;
			preNode->next = node;
		}
		preNode = node;
	}

	// 遍历链表，把数据合并到一个连续的区域中。
	unsigned int bufSize = pageNum * size;
	char *buf = (char *)sys_malloc(bufSize);
	NIC_PAGE_BUF_NODE current_node = bufLinkList;
	unsigned int start = 0;
	while(current_node != 0){
		Memcpy(buf+start * size, current_node->buf, size);
		start++;

		current_node = current_node->next;
	}

//	for(int i = 0; i < bufSize; i++){
//		disp_int((unsigned char)(buf[i]));
//		disp_str(" ");
//	}
//	disp_str(buf);

	return buf;
}

void receive_msg_from_nic2()
{
	Printf("receive Message\n");
	unsigned int pageStart = 16 * 1024;
	unsigned char curr_page = get_curr_page();
	Printf("curr_page = %d", curr_page);

//	return;
	//	/sm ("xchgw %bx, %bx");
	//	没有NULL，只能用0。略感惊讶，我的OS中还不能使用NULL。
	//	我使用过链表，不用NULL用什么解决问题的？
	NIC_PAGE_BUF_NODE bufLinkList = 0;	
	NIC_PAGE_BUF_NODE preNode = 0;
	unsigned char startPage = nic_current_page;
	unsigned char endPage = curr_page;
	nic_current_page = curr_page;
	unsigned int pageNum = 1;
	unsigned int size = 256;
	//char *buf = (char *)sys_malloc(size); 
	char buf[256];
	unsigned int bufSize = pageNum * size;
	//char *buf2 = (char *)sys_malloc(bufSize);
	char buf2[4096];
	//struct sk_buff *skb = alloc_skb(bufSize);		/* 1600 */
	for(int k = startPage; k < endPage; k++){
		Printf("Enter loop\n");
		pageNum++;
		//char *buf = (char *)sys_malloc(size); 
		Memset(buf, 0, size);
		SetPageStart(k * 256);
		Printf("before NICtoPC\n");
		unsigned int len = NICtoPC(buf, size, 3);
		Printf("buf = %s\n", buf);
		//		/sm ("xchgw %bx, %bx");
		// 把从NIC中读取的数据存储到单链表中。
//		unsigned int nodeSize = sizeof(struct nic_page_buf_node);
//		NIC_PAGE_BUF_NODE node = (NIC_PAGE_BUF_NODE)sys_malloc(nodeSize);
//		Memset(node, 0, nodeSize);
//		node->buf = buf;
//		if(bufLinkList == 0){
//			bufLinkList = node;
//		}else{
//			preNode->next = node;
//		}
//		preNode = node;
	}
	
	Printf("merge\n");

	// 遍历链表，把数据合并到一个连续的区域中。
	//unsigned int bufSize = pageNum * size;
	// char *buf2 = (char *)sys_malloc(bufSize);
//	NIC_PAGE_BUF_NODE current_node = bufLinkList;
//	unsigned int start = 0;
//	while(current_node != 0){
//		Memcpy(buf2+start * size, current_node->buf, size);
//		start++;
//
//		current_node = current_node->next;
//	}

	//Printf(buf);

//	struct sk_buff *skb = alloc_skb(bufSize);		/* 1600 */
//	Memcpy((char *)skb->data, buf, bufSize);
//	netdev_receive(skb);
}

void net_handler()
{
//	非常奇怪。从hwint10进入此函数后，如果调用Printf，连时钟中断都不能发生了。
//	不知道原因。
//	Printf("write Message\n");
	wait_wakeup(0);
}
