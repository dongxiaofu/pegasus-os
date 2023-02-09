#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "global.h"

int read456(int fd, void *buf, int count) {
	unsigned int msg_size = sizeof(Message);
    Message *msg = (Message *)sys_malloc(msg_size);

	unsigned int phy_buf = get_physical_address(buf);
	unsigned int phy_buf_page_start = phy_buf & 0xFFFFF000;
	unsigned int phy_buf_page_end = phy_buf_page_start + PAGE_SIZE - 1;

  	unsigned int cnt = 0;
	unsigned int len = 0;
	if(phy_buf + count > 4096){
		len = PAGE_SIZE - phy_buf_page_start;
		do{
			 Memset(msg, 0, msg_size);
   			 msg->TYPE = READ;
   			 msg->FD = fd;
   			 msg->BUF = phy_buf;
   			 msg->CNT = len;

   			 send_rec(BOTH, msg, TASK_FS);
			 cnt += msg->CNT;
			 len = count - len;
			 phy_buf_page_start += PAGE_SIZE;

		}while(len > 0);
	}else{
		 Memset(msg, 0, msg_size);

   		 msg->TYPE = READ;
   		 msg->FD = fd;
   		 msg->BUF = phy_buf;
   		 msg->CNT = count;

   		 send_rec(BOTH, msg, TASK_FS);
		 
		 cnt = msg->CNT;
	}

//	sys_free(msg, msg_size);

    return cnt;
}

int read(int fd, void *buf, int count) {
	// Message msg;
	unsigned int msg_size = sizeof(Message);
    Message *msg = (Message *)sys_malloc(msg_size);

	unsigned int phy_buf = get_physical_address(buf);

    msg->TYPE = READ;
    msg->FD = fd;
    msg->BUF = phy_buf;
    msg->CNT = count;

    send_rec(BOTH, msg, TASK_FS);

	unsigned int cnt = msg->CNT;

    return cnt;
}
