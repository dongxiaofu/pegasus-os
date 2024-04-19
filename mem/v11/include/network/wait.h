#ifndef WAIT_H
#define WAIT_H

#include "stdio.h"
#include "string.h"
#include "mem.h"
#include "mm.h"
#include "const.h"
#include "type.h"
#include "protect.h"
//#include "fs.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
// global.h需要上面的头文件。我不知道它需要哪个，索性全部都复制过来了。
#include "global.h"

#include "stdint.h"
#include "syshead.h"

struct wait_lock {
//	pthread_cond_t ready;	/* 条件变量用于等待 */
//	pthread_mutex_t lock;	/* 互斥锁用于上锁 */
	uint8_t sleeping;
};

static inline int
wait_init(struct wait_lock *w) {
//	pthread_cond_init(&w->ready, NULL);
//	pthread_mutex_init(&w->lock, NULL);
	w->sleeping = 0;
	return 0;
}

static inline int 
wait_wakeup(struct wait_lock *w) {
	inform_int(TASK_NET_DEV_RX, NETWORK_INT);
	return 0;
}

static inline int 
wait_sleep(struct wait_lock *w) {
	Message *msg = (Message *)sys_malloc(sizeof(Message));
	Memset(msg, 0, sizeof(Message));
	// TODO INTERRUPT 应该修改为解除阻塞的进程。
    send_rec(RECEIVING, msg, INTERRUPT);
	sys_free(msg, sizeof(Message));

	return 0;
}

static inline void 
wait_free(struct wait_lock *w) {
	wait_wakeup(w);
//	pthread_mutex_destroy(&w->lock);
//	pthread_cond_destroy(&w->ready);
}

#endif // !WAIT_H
