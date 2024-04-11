#include "inet.h"

uint32_t ntohl(uint32_t netlong)
{
	unsigned char bytes[4] = {0};

	uint32_t network_value = 0;
	for(int i = 0; i < 4; i++){
		bytes[i] = (netlong & (0xFF << (8 * i))) >> (8 * i);
		network_value |= bytes[i] << (8 * (3-i));
	}

	return network_value;
}