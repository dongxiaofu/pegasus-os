#ifndef _PEGASUS_OS_UNISTD_H
#define _PEGASUS_OS_UNISTD_H

#include "stddef.h"

ssize_t socket_write(int fildes, const void *buf, size_t nbyte);
ssize_t socket_read(int fildes, void *buf, size_t nbyte);
int socket_close(int sockfd);

#endif
