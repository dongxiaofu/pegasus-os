#ifndef _PEGASUS_OS_CONST_H
#define _PEGASUS_OS_CONST_H

#define DEBUG 0
#define DEFAULT_STR_SIZE 512


// 描述符在gdt中的索引
// #define CS_SELECTOR_INDEX 1;
#define CS_SELECTOR_INDEX 1
#define DS_SELECTOR_INDEX 6
#define GS_SELECTOR_INDEX 7

#define TSS_SELECTOR_INDEX 8
#define LDT_FIRST_SELECTOR_INDEX 9

// 选择子
//#define CS_SELECTOR 0x1000;
#define CS_SELECTOR 0x08
#define DS_SELECTOR 0x30
//#define GS_SELECTOR 0x38
#define GS_SELECTOR 0x3b
#define TSS_SELECTOR 0x40	//1000  000 ---> 100 0000
#define LDT_FIRST_SELECTOR 0x48


// ipc0 start
// 能用enum吗？不能很快心算出”能不能“这个结果，先不用，减小难度。
#define RUNNING	0
#define SENDING 1
#define RECEIVING 2

// send_rec的function的取值
#define SEND 1
#define RECEIVE 2
#define BOTH	3

// Message 中的type的取值
#define TICKS_TASK_SYS_TYPE 1 


// 系统调用 start
#define SYS_CALL_FUNCTION_NUM 5
#define NR_GET_TICKS	0
#define _NR_WRITE	1
#define _NR_WRITE_DEBUG	2
#define _NR_SEND_MSG	3
#define _NR_RECEIVE_MSG	4

const int INIT_MASTER_VEC_NO = 0x20;
const int INIT_SLAVE_VEC_NO = 0x28;

#endif
