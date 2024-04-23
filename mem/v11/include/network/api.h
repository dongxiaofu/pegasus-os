#ifndef API_H
#define API_H

int
demux_ipc_socket_call(int source, int sockfd, char *cmdbuf, int blen);

#endif 
