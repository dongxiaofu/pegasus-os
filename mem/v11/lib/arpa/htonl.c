uint32_t htonl(uint32_t hostlong)
{
	unsigned char bytes[4] = {0};

	uint32_t network_value = 0;
	for(int i = 0; i < 4; i++){
		bytes[i] = (hostlong & (0xFF << (8 * i))) >> (8 * i);
		network_value |= bytes[i] << (8 * (3-i));
	}

	return network_value;
}