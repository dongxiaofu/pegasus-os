#include "stdio.h"
#include "string.h"
#include "mem.h"
#include "mm.h"
#include "const.h"
#include "type.h"
#include "protect.h"
//#include "double_link_list.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"

#include "sys/socket.h"
#include "in.h"

unsigned int fork_pid;
DoubleLinkList pcb_list;
DoubleLinkList all_pcb_list;
unsigned int MAIN_THREAD_PAGE_DIRECTORY;

void init();

void kernel_thread_a(void *msg);
void kernel_thread_b(void *msg);
void kernel_thread_c(void *msg);
void kernel_thread_d(void *msg);

void user_proc_a();
void user_proc_b();

void kernel_main()
{
	init();

//	disable_int();
	int init_ticks = TICKS_NUM;
	
	main_thread = get_running_thread_pcb();
	main_thread->ticks = main_thread->init_ticks = init_ticks + 2;
	main_thread->page_directory = MAIN_THREAD_PAGE_DIRECTORY;
	Strcpy(main_thread->name, "main_thread");
	main_thread->stack_magic = STACK_MAGIC;
	proc_ready_table = main_thread;

//	appendToDoubleLinkList(&pcb_list, (ListElement *)(&main_thread->tag));
	// appendToDoubleLinkList(&pcb_list, (ListElement *)(&main_thread->all_tag));
	appendToDoubleLinkList(&all_pcb_list, (ListElement *)(&main_thread->all_tag));

	process_execute(TaskMM, "task_mm\n", "TaskMM", 0, init_ticks);
	process_execute(task_fs, "task_fs\n", "task_fs", 0, init_ticks);
	process_execute(TaskHD, "task_hd\n", "TaskHD", 0, init_ticks);
	process_execute(TaskTTY, "task_tty\n", "TaskTTY", 0, init_ticks);
	process_execute(task_network, "task_network\n", "task_network", 0, init_ticks);
	process_execute(task_netdev_rx, "task_netdev_rx\n", "task_netdev_rx", 0, init_ticks);
	process_execute(init_dev, "init_dev\n", "init_dev", 0, init_ticks);
	process_execute(user_proc_a, "user_proc_a\n", "process_a", 1, init_ticks - 2);
	process_execute(user_proc_b, "user_proc_b\n", "process_b", 1, init_ticks - 3);

	disp_str("main end\n");

	asm volatile ("sti");
	while(1){
		stop_here();
	}
}

void init()
{
	char *stackaddr = "10.0.0.9";   /* 本协议栈模拟的ip地址 */

	MAIN_THREAD_PAGE_DIRECTORY = 0x400000;
	k_reenter = 99;
	dis_pos = 0;
	pid = 0;
	fork_pid = 100;
	gdt_index = 9;
	proc_ready_table = 0xc07fe000;

	init_memory(64*1024*1024);

	// 网卡驱动用到这个数据。
	nic_current_page = 0x40;
	// static struct list_head name;
//	static struct netdev *loop;
//	static struct netdev *netdev; /* 用于记录本机地址,包括ip和mac地址 */
	// 初始化NIC。
	DriverInitialize();
	//在这里调用这两个函数必然出错。它们使用了sys_malloc。
	//内存都没有初始化，怎么能分配内存？
	//可以先初始化内存，再试试这两个函数。
//	netdev_init();
//    route_init();

	init_keyboard();
//	init_memory(64*1024*1024);

	// 初始化PCB链表
	initDoubleLinkList(&pcb_list);
	initDoubleLinkList(&all_pcb_list);
}

void kernel_thread_a(void *msg)
{
	disp_str(msg);
	int b = dis_pos;
	int a = 0;
	while(1){
		dis_pos = b;
		disp_str("still a:");
		disp_str("\n");
	}
}

void kernel_thread_b(void *msg)
{
	disp_str(msg);
	int b = dis_pos;
	int a = 0;
	while(1){
		dis_pos = b;
		disp_str("still b:");
		disp_str("\n");
	}
}

void kernel_thread_c(void *msg)
{
	disp_str(msg);
	while(1);
}

void kernel_thread_d(void *msg)
{
	disp_str(msg);
	while(1);
}

void user_proc_a()
{
	Printf("hello,A\n");
	while(1);
	disp_str("-------------I am user_proc_a\n");
	net_data = 0;
	unsigned int size = 22;
	net_buf = (char *)sys_malloc(size);
	Memset(net_buf, 0, size);

	while(1){
		if(test_ticks % 10 == 0){
			inform_int(TASK_NET_DEV_RX, NETWORK_INT);
		}
	}

	// char *str = "Next, what’s wealthy to you may not be wealthy to your children";
	char *str = "Next, what’s wealthy";
	Strcpy(net_buf, str);

//	hello = (char *)sys_malloc(12);
	// Memset(helloStr, 0, 12);
//	Printf("net_buf = %s\n", net_buf);

	//enable_8259A_slave_net_irq();
//
	net_data = 4;
///	DriverInitialize();
/////	//asm ("xchgw %bx, %bx");
/////	while(1){
///	for(int i = 0; i < 1; i++){
/// 		DriverSend(net_buf, size);
///	}
	//asm ("xchgw %bx, %bx");
//	disp_str(net_buf);
//	disp_str(helloStr);
//	disp_str("\n");
//	disp_str("DriverInitialize2\n");
//	disp_str("DriverInitialize1\n");
//	// disp_str(helloStr);
//	disp_str("\nDriverInitialize3\n");
	while(1);

//	TestFS2();
//	wait_exit();
	test_exec();
//	test_shell();
//	INIT_fork();
//	TestTTY();
//	TestFS();
	while(1);
}

// 实现TCP客户端
static void tcp_client()
{
	// 创建socket
	int sock = socket(AF_INET, SOCK_STREAM, 0);	
	Printf("sock = %x\n", sock);

	struct sockaddr_in addr;
	int addrlen = 0;

//	char *host = "10.0.0.9";
//	char port = 80;

	// ifeng.com
	char *dst_host = "82.156.59.186";
//	char *dst_port = "80";
	unsigned short dst_port = 80;
	Memset(&addr, 0, sizeof(struct sockaddr_in));
	addr.sin_family = AF_INET;
	addr.sin_port = htons(dst_port);;
	inet_pton(AF_INET, dst_host, &addr.sin_addr.s_addr);

	assert(sock == 4097);
	if (connect(sock, (struct sockaddr_in*)&addr, addrlen) == -1) {
        perror("Curl could not establish connection");
        return 1;
    }
//	return;

	char str[512] = {0};
//	char *dst_host = "82.156.59.186";
//	char *dst_port = "80";
	sprintf(str, "GET / HTTP/1.1\r\nHost: %s:%s\r\nConnection: close\r\n\r\n", dst_host, dst_port);
    int len = Strlen(str);

//	asm("xchgw %bx, %bx");
	Printf("start to write\n");
    if (socket_write(sock, str, len) != len) {
        Printf("Write error\n");
        return 1;
    }

	// TODO 一个进程的栈只有4096字节。新建一个4KB的局部变量，恐怕不行。
    // char buf[4096] = { 0 };
    unsigned int buf_len = 4096;
    char *buf = (char *)sys_malloc(buf_len);
    int rlen = 0;

    while ((rlen = socket_read(sock, buf, buf_len)) > 0) {
        Printf("%s", buf);
    }

    if (rlen == -1) {
        perror("Curl read error");
        return 1;
    }

    socket_close(sock);	
}

void user_proc_b()
{
 	// disp_str("\n-------------I am user_proc_b\n");
	Printf("\n-------------I am user_proc_b\n");
//	while(1);
		tcp_client();	
//		tcp_client();	
//		tcp_client();	
//		tcp_client();	
	while(1){
		//tcp_client();	
	}
}
