unsigned short htons(uint16_t hostshort)
{
	unsigned char low_byte = hostshort & 0xFF;
	unsigned char high_byte = (hostshort & 0xFF00) >> 8;

	unsigned short network_value = (low_byte << 8) | high_byte;

	return network_value;
}