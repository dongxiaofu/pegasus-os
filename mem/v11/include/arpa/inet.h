uint16_t ntohs(uint16_t netshort);
uint32_t ntohl(uint32_t netlong);

unsigned short htons(uint16_t hostshort);
uint32_t htonl(uint32_t hostlong);

int inet_pton(int af, const char *src, void *dst);
const char *inet_ntop(int af, const void *src, char *dst, socklen_t size);