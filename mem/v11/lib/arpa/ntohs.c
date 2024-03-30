uint16_t ntohs(uint16_t netshort)
{
	unsigned char low_byte = netshort & 0xFF;
	unsigned char high_byte = (netshort & 0xFF00) >> 8;

	unsigned short network_value = (low_byte << 8) | high_byte;

	return network_value;
}
