#ifndef _PEGASUS_OS_TYPE_H
#define _PEGASUS_OS_TYPE_H

typedef void (*Func)();
typedef void *system_call;
typedef void (*int_handle) ();

typedef struct{
	unsigned int m20;
	unsigned int m21;
	unsigned int m22;
	unsigned int m23;
}u2;

typedef struct{
	unsigned int m10;
	unsigned int m11;
	unsigned int m12;
	unsigned int m13;
}u1;

typedef struct{
	u1 u10;
	u1 u11;
	u1 u12;

	u2 u20;
	u2 u21;
	u2 u22;
}u;
// todo 根据目前的需求，下面的成员都是必需的。
typedef struct{
        int source;             // 谁发送的消息
        int type;               // 这条消息要求接收者做什么。例如，获取时钟中断次数。
        int val;                // 消息中的数据。

	u u0;
}Message;

// 能用相同的结构体组合表示不同的数据吗？例如，用u0.u1.m10表示len和inode。
// A消息传递过程，B消息传递过程。A的len会覆盖B的len吗？

#define LEN u0.u1.m10;
#define BUF u0.u1.m11;
#define DEVICE u0.u1.m12;
#define POSITION u0.u1.m13;

// do_rdwt中使用
#define HD_OPERATE_TYPE u0.u2.m20; 
// 存储 struct inode * 应该用什么数据类型？
#define INODE u0.u2.m21;
#define SENDER u0.u2.m22; 
#endif
