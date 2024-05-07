#include "netdev.h"
#include "skbuff.h"
#include "list.h"
#include "arp.h"
#include "utils.h"
#include "if_ether.h"

static uint8_t broadcast_hw[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff}; /* 广播地址 */

static LIST_HEAD(arp_cache);

static struct sk_buff *
arp_alloc_skb()
{
	struct sk_buff *skb = alloc_skb(ETH_HDR_LEN + ARP_HDR_LEN + ARP_DATA_LEN);
	skb_reserve(skb, ETH_HDR_LEN + ARP_HDR_LEN + ARP_DATA_LEN);
	skb->protocol = htons(ETH_P_ARP);
	return skb;
}

static struct arp_cache_entry *
arp_entry_alloc(struct arp_hdr *hdr, struct arp_ipv4 *data)
{
	struct arp_cache_entry *entry = sys_malloc(sizeof(struct arp_cache_entry));
	list_init(&entry->list);
	entry->state = ARP_RESOLVED;	// arp应答
	entry->hwtype = hdr->hwtype;
	entry->sip = data->sip;
	Memcpy(entry->smac, data->smac, sizeof(entry->smac));
	return entry;
}

int call_update_arp_translation_table(struct arp_hdr *hdr, struct arp_ipv4 *data)
{
//	return 1;
	unsigned int ipc_msg_size = sizeof(struct ipc_msg);
	struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
	ipc_msg->type = IPC_UPDATE_ARP_TABLE;

	unsigned int payload_size = sizeof(struct ipc_update_arp_table);

	struct ipc_update_arp_table *payload = (struct ipc_update_arp_table *)sys_malloc(payload_size);
//	payload->hdr = get_physical_address(hdr);
//	payload->data = get_physical_address(data);
	Memcpy(&(payload->arp_hdr), hdr, sizeof(struct arp_hdr));
	Memcpy(&(payload->arp_ipv4), data, sizeof(struct arp_ipv4));
	
	ipc_msg->data = (char *)get_physical_address(payload);
	ipc_msg->data_size = payload_size;

    Message *msg = (Message *)sys_malloc(sizeof(Message));
	Memset(msg, 0, sizeof(Message));
    msg->TYPE = IPC_SOCKET_CALL;
	msg->SOCKET_FD = 0;

	unsigned int phy_ipc_msg = get_physical_address(ipc_msg);
	msg->BUF =  phy_ipc_msg;
	msg->BUF_LEN = ipc_msg_size;

//    send_rec(BOTH, msg, TASK_NETWORK);
    send_rec(BOTH, msg, TASK_NET_INIT_DEV);
	
	int result = msg->RETVAL;

    //assert(msg.type == SYSCALL_RET);
    sys_free(msg, sizeof(Message));

    return result;
}

int call_insert_arp_translation_table(struct arp_hdr *hdr, struct arp_ipv4 *data)
{
	unsigned int ipc_msg_size = sizeof(struct ipc_msg);
	struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
	ipc_msg->type = IPC_INSERT_ARP_TABLE;

	unsigned int payload_size = sizeof(struct ipc_update_arp_table);

	struct ipc_update_arp_table *payload = (struct ipc_update_arp_table *)sys_malloc(payload_size);
//	payload->hdr = get_physical_address(hdr);
//	payload->data = get_physical_address(data);
//	Memcpy(payload->arp_hdr, hdr, sizeof(struct arp_hdr));
//	Memcpy(payload->arp_ipv4, data, sizeof(struct arp_ipv4));
	Memcpy(&(payload->arp_hdr), hdr, sizeof(struct arp_hdr));
	Memcpy(&(payload->arp_ipv4), data, sizeof(struct arp_ipv4));
	
	ipc_msg->data = (char *)get_physical_address(payload);
	ipc_msg->data_size = payload_size;

    Message *msg = (Message *)sys_malloc(sizeof(Message));
	Memset(msg, 0, sizeof(Message));
    msg->TYPE = IPC_SOCKET_CALL;
	msg->SOCKET_FD = 0;

	unsigned int phy_ipc_msg = get_physical_address(ipc_msg);
    msg->BUF =  phy_ipc_msg;
    msg->BUF_LEN = ipc_msg_size;

    // send_rec(BOTH, msg, TASK_NETWORK);
    send_rec(BOTH, msg, TASK_NET_INIT_DEV);
	
	int result = msg->RETVAL;

    //assert(msg.type == SYSCALL_RET);
    sys_free(msg, sizeof(Message));

    return result;
}

// int insert_arp_translation_table(struct arp_hdr *hdr, struct arp_ipv4 *data)
int insert_arp_translation_table(struct ipc_msg *msg)
{
	pid_t pid = msg->pid;
	struct ipc_insert_arp_table *data = (struct ipc_insert_arp_table *)msg->data;
	struct arp_hdr *hdr = (struct arp_hdr *)(&(data->arp_hdr));
	struct arp_ipv4 *arp_ipv4 = (struct arp_ipv4 *)(&(data->arp_ipv4));

	struct arp_cache_entry *entry = arp_entry_alloc(hdr, arp_ipv4);
	list_add_tail(&entry->list, &arp_cache); /* 添加到arp_cache的尾部 */

	Message *result = (Message *)sys_malloc(sizeof(Message));
	result->RETVAL = 0;
	send_rec(SEND, result, pid);

//	return ipc_write_rc(sockfd, pid, IPC_SENDTO, 1);
}

/**\
 * update_arp_translation_table 更新arp转换表 
\**/
//int update_arp_translation_table(struct arp_hdr *hdr, struct arp_ipv4 *data)
int update_arp_translation_table(struct ipc_msg *msg)
{
	pid_t pid = msg->pid;
	struct ipc_update_arp_table *data = (struct ipc_update_arp_table *)msg->data;
	struct arp_hdr *hdr = (struct arp_hdr *)(&(data->arp_hdr));
	struct arp_ipv4 *arp_ipv4 = (struct arp_ipv4 *)(&(data->arp_ipv4));

	struct list_head *item;
	struct arp_cache_entry *entry;
	unsigned char rc = 0;
	
	list_for_each(item, &arp_cache) {
		entry = list_entry(item, struct arp_cache_entry, list);
		if (entry->hwtype == hdr->hwtype && entry->sip == arp_ipv4->sip) {
			Memcpy(entry->smac, arp_ipv4->smac, 6);
			rc =  1;
			break;
		}
	}

	Message *result = (Message *)sys_malloc(sizeof(Message));
	result->RETVAL = rc;
	send_rec(SEND, result, pid);

//	return ipc_write_rc(sockfd, pid, IPC_SENDTO, rc);
}

void arp_init()
{

}

/**\
 * arp_rcv 接收到了arp数据报,马上调用这个函数来处理
\**/
void arp_rcv(struct sk_buff *skb)
{
	struct arp_hdr *arphdr;
	struct arp_ipv4 *arpdata;
	struct netdev *netdev;
	int merge = 0;
	arphdr = arp_hdr(skb);						// 获得arp头部
	arphdr->hwtype = ntohs(arphdr->hwtype);		// 硬件类型
	arphdr->protype = ntohs(arphdr->protype);	// 协议类型
	arphdr->opcode = ntohs(arphdr->opcode);		// 操作类型
	//arp_dbg("in", arphdr);

	if (arphdr->hwtype != ARP_ETHERNET) {		// 1代表以太网地址
		Printf("ARP: Unsupported HW type\n");
		goto drop_pkt;
	}

	if (arphdr->protype != ARP_IPV4) {			// 0x0800 -- 2048表示arp协议
		Printf("ARP: Unsupported protocol\n");
		goto drop_pkt;
	}

	arpdata = (struct arp_ipv4 *)arphdr->data;

	arpdata->sip = ntohl(arpdata->sip);		// 发送方ip地址
	arpdata->dip = ntohl(arpdata->dip);		// 接收方ip地址
	//arpdata_dbg("receive", arpdata);

	merge = call_update_arp_translation_table(arphdr, arpdata); // 更新arp缓存
//	Printf("merge = %x\n", merge);
	
	if (!(netdev = call_netdev_get(arpdata->dip))) {
		Printf("ARP was not for us\n");
		goto drop_pkt;
	}
//	Printf("netdev = %x\n", netdev);

	if (!merge && call_insert_arp_translation_table(arphdr, arpdata) != 0) {
		print_err("ERR: No free space in ARP translation table\n");
		goto drop_pkt;
	}

	switch (arphdr->opcode) {
	case ARP_REQUEST:		// 0x0001 -- arp请求
		arp_reply(skb, netdev);
		return;
	case ARP_REPLY:			// 0x0002 -- arp回复,这里实际上在上面已经处理了,更新了arp缓存
		{
			Message *msg = (Message *)sys_malloc(sizeof(Message));
			send_rec(SEND, msg, TASK_NETWORK);
			Printf("unblock TASK_NETWORK\n");
			return;
		}
	default:
		Printf("ARP: Opcode not supported\n");
		goto drop_pkt;
	}

drop_pkt:
	free_skb(skb);
	return;
}

/**\
 * arp_rquest 用于发送arp请求
\**/
int 
arp_request(uint32_t sip, uint32_t dip, struct netdev *netdev)
{
	struct sk_buff *skb;
	struct arp_hdr *arp;
	struct arp_ipv4 *payload;
	int rc = 0;
	int size = ETH_HDR_LEN + ARP_HDR_LEN + ARP_DATA_LEN;

	skb = arp_alloc_skb(); // 分配arp回复的数据
	
	if (!skb) return -1;


	skb->dev = netdev;
	payload = (struct arp_ipv4 *)skb_push(skb, ARP_DATA_LEN);
	
	/* 发送端填入的是本机的地址信息,但是ip是主机字节序 */
	Memcpy(payload->smac, netdev->hwaddr, netdev->addr_len); // 拷贝硬件地址
	payload->sip = sip;

	/* 接收端填入的是广播地址以及想要查询的ip的地址,但是ip是主机字节序 */
	Memcpy(payload->dmac, broadcast_hw, netdev->addr_len);  // 广播
	payload->dip = dip;

	arp = (struct arp_hdr *)skb_push(skb, ARP_HDR_LEN);

	//arp_dbg("req", arp);
	arp->opcode = htons(ARP_REQUEST);
//	arp->opcode = htons(ARP_REPLY);
//	arp->opcode = 0x100;
	// arp->opcode = ARP_REQUEST;
	arp->hwtype = htons(ARP_ETHERNET);
	arp->protype = htons(ETH_P_IP);
	arp->hwsize = netdev->addr_len;
	arp->prosize = 4;

	//arpdata_dbg("req", payload);
	/* 然后转换为网络字节序 */
	payload->sip = htonl(payload->sip);
	payload->dip = htonl(payload->dip);
	Printf("payload->sip = %x, dip = %x\n", payload->sip, payload->dip);

	rc = netdev_transmit(skb, broadcast_hw, ETH_P_ARP);

	free_skb(skb);
	return rc;
}

/**\
 * arp_reply 用于arp回复
\**/
void 
arp_reply(struct sk_buff *skb, struct netdev *netdev)
{
	Printf("arp_reply\n");
	/* netdev中包含了本机的地址信息,包括ip地址和mac地址 */
	struct arp_hdr *arphdr;
	struct arp_ipv4 *arpdata;

	arphdr = arp_hdr(skb);

	// skb_reserve函数会将skb的data指针向后移动ETH_HDR_LEN + ARP_HDR_LEN + ARP_DATA_LEN个字节.
	skb_reserve(skb, ETH_HDR_LEN + ARP_HDR_LEN + ARP_DATA_LEN);	
	// skb_push函数将skb的data指针向前移动ARP_HDR_LEN个字节
	skb_push(skb, ARP_HDR_LEN + ARP_DATA_LEN);

	arpdata = (struct arp_ipv4 *)arphdr->data;

	/* 将源地址和目的地址进行交换,需要注意的是下面的ip地址都是主机字节序 */
	Memcpy(arpdata->dmac, arpdata->smac, 6);
	arpdata->dip = arpdata->sip;

	Memcpy(arpdata->smac, netdev->hwaddr, 6);
	arpdata->sip = netdev->addr;

	arphdr->opcode = ARP_REPLY; // 0x0002

	//arp_dbg("reply", arphdr);

	arphdr->opcode = htons(arphdr->opcode);
	arphdr->hwtype = htons(arphdr->hwtype);
	arphdr->protype = htons(arphdr->protype);

	//arpdata_dbg("reply", arpdata);
	/* 最终转换为本机字节序 */
	arpdata->sip = htonl(arpdata->sip);
	arpdata->dip = htonl(arpdata->dip);

	skb->dev = netdev;
	// arp协议完成自己的部分,然后接下来让链路层去操心
	netdev_transmit(skb, arpdata->dmac, ETH_P_ARP);
	free_skb(skb);
}

uint8_t *call_arp_get_hwaddr(uint32_t sip)
{
    //return 0;
    unsigned int ipc_msg_size = sizeof(struct ipc_msg);
    struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
    ipc_msg->type = IPC_GET_HWADDR;

    unsigned int payload_size = sizeof(struct ipc_get_hwaddr);

    struct ipc_get_hwaddr *payload = (struct ipc_get_hwaddr *)sys_malloc(payload_size);
    payload->sip = sip;
//	Printf("call_arp_get_hwaddr sip = %x\n", sip);

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

	uint8_t *mac = NULL;
    //int result = msg->RETVAL;
	uint32_t phy_mac_addr = msg->BUF;
	if(phy_mac_addr != NULL){
		uint32_t mac_len = msg->BUF_LEN;
		uint32_t mac_vaddr = alloc_virtual_memory(phy_mac_addr, mac_len);	
		mac = (uint8_t *)sys_malloc(mac_len);
		Memcpy(mac, mac_vaddr, mac_len);
	}

    //assert(msg.type == SYSCALL_RET);
    sys_free(msg, sizeof(Message));

    return (uint8_t *)mac;
}

/**\
 * arp_get_hwaddr 根据ip得到mac地址,找不到则返回NULL
\**/
uint8_t* 
//arp_get_hwaddr(uint32_t sip)
arp_get_hwaddr(struct ipc_msg *msg)
{
	struct list_head *item;
	struct arp_cache_entry *entry;
	uint8_t *smac = NULL;

    pid_t pid = msg->pid;
    struct ipc_get_hwaddr *hwaddr = (struct ipc_get_hwaddr *)msg->data;
    uint32_t sip = hwaddr->sip;
	
	list_for_each(item, &arp_cache) {
		entry = list_entry(item, struct arp_cache_entry, list);
//		Printf("entry->sip = %x\n", entry->sip);
		if (entry->state == ARP_RESOLVED &&
			entry->sip == sip) {
			//arpcache_dbg("entry", entry);
			// return entry->smac;
			smac = entry->smac;
			break;
		}
	}

//	Printf("arp_get_hwaddr sip = %x\n", sip);
//	print_array(smac, 6);

	Message *result = (Message *)sys_malloc(sizeof(Message));
    //result->RETVAL = smac;
    if(smac != NULL){
    	result->BUF = get_physical_address(smac);
		result->BUF_LEN = 6;
	}else{
    	result->BUF = NULL; 
		result->BUF_LEN = 0;
	}
    send_rec(SEND, result, pid);
	sys_free(result);

    // TODO 无用，但又不确定是否无用，所以随便设置一个返回值。
    return 0;
}

void 
free_arp()
{
	struct list_head *item, *tmp;
	struct arp_cache_entry *entry;
	
	list_for_each_safe(item, tmp, &arp_cache) {
		entry = list_entry(item, struct arp_cache_entry, list);
		list_del(item);
		sys_free(entry);
	}
}

