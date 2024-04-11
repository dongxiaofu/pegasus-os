#ifndef _PEGASUS_OS_IN_H
#define _PEGASUS_OS_IN_H

#define	AF_INET			4
#define AF_INET6		10

#define SOCK_STREAM 1
#define SOCK_DGRAM 2

#define IPPROTO_TCP 6
#define IPPROTO_UDP 17

typedef unsigned int socklen_t;

struct in_addr {
     unsigned int s_addr;  // IPv4 地址，32 位无符号整数，网络字节序 (Network Byte Order)
};

struct sockaddr {
    // sa_family_t sa_family;      // 地址家族
    unsigned int sa_family;      // 地址家族
    char        sa_data[14];    // 地址数据
};


struct sockaddr_in{
	short            sin_family;   // 地址族 (Address Family)，通常为 AF_INET
	unsigned short   sin_port;     // 16 位端口号，网络字节序 (Network Byte Order)
	struct in_addr   sin_addr;     // IPv4 地址，网络字节序 (Network Byte Order)
	char             sin_zero[8];  // 填充字段，用于使结构体大小和 sockaddr 结构体一样大
};


#endif
