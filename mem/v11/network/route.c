#include "syshead.h"
#include "route.h"
#include "dst.h"
#include "netdev.h"
#include "list.h"
#include "ip.h"
#include "ipc.h"

#include "global.h"
//static LIST_HEAD(routes);

//extern struct netdev *netdev;
//extern struct netdev *gatedev;
//extern struct netdev *loop;

extern char *tapaddr;
extern char *taproute;

static struct rtentry* 
route_alloc(uint32_t dst, uint32_t gateway, uint32_t netmask,
	uint8_t flags, uint32_t metric, struct netdev *dev)
{
	struct rtentry *rt = sys_malloc(sizeof(struct rtentry));
	list_init(&rt->list);
	rt->dst = dst;		   /* 目的地址 */
	rt->gateway = gateway; /* 网关 */
	rt->netmask = netmask;
	rt->flags = flags;
	rt->metric = metric;
	rt->dev = dev;
	return rt;
}

/**\
 * route_add 添加路由项.
\**/
void 
route_add(uint32_t dst, uint32_t gateway, uint32_t netmask, uint8_t flags,
	uint32_t metric, struct netdev *dev)
{
	// dst 目的网段
	// gateway 网关
	// netmask 子网掩码
	struct rtentry *rt = route_alloc(dst, gateway, netmask, flags, metric, dev);
	list_add_tail(&rt->list, routes);  // 添加到尾部
}

void 
route_init()
{
	routes = (struct list_head *)sys_malloc(sizeof(struct list_head));
	routes->next = routes->prev = routes;

	route_add(loop->addr, 0, 0xff000000, RT_LOOPBACK, 0, loop);  // 127.0.0.1
    route_add(netdev->addr, 0, 0xffffff00, RT_HOST, 0, netdev);  // 10.0.1.4
    char *tapaddr = "10.0.1.5";     /* tap设备的地址 */
    route_add(0, ip_parse(tapaddr), 0, RT_GATEWAY, 0, netdev);   // 默认的网关
}

struct rtentry *call_route_lookup(uint32_t daddr)
{
    unsigned int ipc_msg_size = sizeof(struct ipc_msg);
    struct ipc_msg *ipc_msg = (struct ipc_msg *)sys_malloc(ipc_msg_size);
    ipc_msg->type = IPC_ROUTE_LOOKUP;

    unsigned int payload_size = sizeof(struct ipc_route_lookup);

    struct ipc_route_lookup *payload = (struct ipc_route_lookup *)sys_malloc(payload_size);
    payload->daddr = daddr;

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

	struct rtentry *route;
	unsigned int route_phy_addr = msg->BUF;
	if(route_phy_addr == NULL){
		route = NULL;
	}else{
		unsigned int route_size = sizeof(struct rtentry);
		unsigned int rtentry_vaddr = alloc_virtual_memory(route_phy_addr, route_size);
		route = (struct netdev *)sys_malloc(route_size);
		Memcpy(route, rtentry_vaddr, route_size);
	}

    sys_free(msg, sizeof(Message));

    return route;
}

/**\
 * route_lookup 从路由表中查找路由.
\**/
int route_lookup(struct ipc_msg *msg)
{
    pid_t pid = msg->pid;
    struct ipc_route_lookup *param = (struct ipc_route_lookup *)msg->data;
    uint32_t daddr = param->daddr;

	struct list_head *item;
    struct rtentry *rt = NULL;

    list_for_each(item, routes) {
        rt = list_entry(item, struct rtentry, list);
        if ((rt->netmask & daddr) == rt->dst) break;
        /* 如果不能匹配的话,我们默认使用最后一个项,也就是网关 */
    }

	Message *result = (Message *)sys_malloc(sizeof(Message));
	if(rt != NULL){
    	result->BUF = get_physical_address(rt);
		result->BUF_LEN = sizeof(struct rtentry);
	}else{
		result->BUF = NULL;
		result->BUF_LEN = 0;
	}
    send_rec(SEND, result, pid);
	sys_free(result);

	return 0;
}
