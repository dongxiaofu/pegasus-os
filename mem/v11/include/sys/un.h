#ifndef _PEGASUS_OS_UN_H
#define _PEGASUS_OS_UN_H

struct sockaddr_un {
    // sa_family_t sun_family;     // 地址家族，通常是 AF_UNIX
    unsigned int sun_family;     // 地址家族，通常是 AF_UNIX
    char sun_path[108];         // 路径名
};


#endif
