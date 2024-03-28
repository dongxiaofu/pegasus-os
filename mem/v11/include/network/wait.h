#ifndef WAIT_H
#define WAIT_H

#include "syshead.h"

struct wait_lock {
	pthread_cond_t ready;	/* 条件变量用于等待 */
	pthread_mutex_t lock;	/* 互斥锁用于上锁 */
	uint8_t sleeping;
};

static inline int
wait_init(struct wait_lock *w) {
	pthread_cond_init(&w->ready, NULL);
	pthread_mutex_init(&w->lock, NULL);
	w->sleeping = 0;
	return 0;
}

static inline int 
wait_wakeup(struct wait_lock *w) {
	pthread_mutex_lock(&w->lock);
	w->sleeping = 0;
	pthread_cond_signal(&w->ready);		/* 唤醒等待在条件变量ready上的线程 */
	pthread_mutex_unlock(&w->lock);
	return 0;
}

static inline int 
wait_sleep(struct wait_lock *w) {
	pthread_mutex_lock(&w->lock);
	w->sleeping = 1;
	while (w->sleeping == 1) { /* 防止spurious wakeup */
		pthread_cond_wait(&w->ready, &w->lock);
	}
	pthread_mutex_unlock(&w->lock);
	return 0;
}

static inline void 
wait_free(struct wait_lock *w) {
	wait_wakeup(w);
	pthread_mutex_destroy(&w->lock);
	pthread_cond_destroy(&w->ready);
}

#endif // !WAIT_H