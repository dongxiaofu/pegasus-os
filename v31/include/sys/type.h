#ifndef _PEGASUS_OS_TYPE_H
#define _PEGASUS_OS_TYPE_H

typedef void (*Func)();
typedef void *system_call;
typedef void (*int_handle) ();

// todo 根据目前的需求，下面的成员都是必需的。
typedef struct{
        int source;             // 谁发送的消息
        int type;               // 这条消息要求接收者做什么。例如，获取时钟中断次数。
        int val;                // 消息中的数据。
}Message;


#endif