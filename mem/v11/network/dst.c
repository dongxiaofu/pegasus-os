#include "syshead.h"
#include "dst.h"
#include "ip.h"
#include "arp.h"
#include "if_ether.h"

void print_array(uint8_t arr[], int size)
{
	if(arr == NULL){
		Printf("arr is NULL\n");
		return;
	}
	Printf("\n");
	for(int i = 0; i < size; i++){
		Printf("%x,", arr[i]);
	}
	Printf("\n");
}

int
dst_neigh_output(struct sk_buff *skb)
{
	struct iphdr *iphdr = ip_hdr(skb);
	struct netdev *netdev = skb->dev;
	struct rtentry *rt = skb->rt;
	uint32_t daddr = ntohl(iphdr->daddr);
	uint32_t saddr = ntohl(iphdr->saddr);
	int count = 0;
	uint8_t *dmac;

	if (rt->flags & RT_GATEWAY) {
		daddr = rt->gateway;	  /*  需要发送到网关 */
	}

//	do{
//		Printf("saddr = %x, saddr2 = %x\n", saddr, iphdr->saddr);
//		netdev = call_netdev_get(saddr);
//	}while(netdev == NULL);

try_agin:
	// dmac = arp_get_hwaddr(daddr); /* 根据ip地址获得mac地址 */
	dmac = call_arp_get_hwaddr(daddr); /* 根据ip地址获得mac地址 */
	//print_array(dmac, 6);

	if (dmac) {
		//Printf("get\n");
		int ret = -1;
			ret = netdev_transmit(skb, dmac, ETH_P_IP);
		//	Printf("after netdev_transmit\n");
		return ret;
	}
	else {
		count += 1;
		arp_request(saddr, daddr, netdev);
		// TODO 必须阻塞此进程，直到对方进程通知本进程，已经更新了ARP缓存。
		Message *msg = (Message *)sys_malloc(sizeof(Message));
		send_rec(RECEIVE, msg, TASK_NET_DEV_RX);
		//Printf("after arp_request\n");
        /* Inform upper layer that traffic was not sent, retry later */
		//if (count < 3) {
		// if (count < 3) {
		if (count < 12) {
			// usleep(10000);
			// milli_delay(50);
			//asm("xchgw %bx, %bx");
			goto try_agin;
		}
		return -1;
	}
}
