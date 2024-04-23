#ifndef _PEGASUS_OS_SOCKET_H
#define _PEGASUS_OS_SOCKET_H

typedef	unsigned int socklen_t;

int socket(int domain, int type, int protocol);
int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen);

#endif
