int inet_pton(int af, const char *src, void *dst)
{
	int result = 1;

	// const char *delimiter = ".";
	const char delimiters[] = ".";
	unsigned char i = 0;

	uint32_t network_value = 0;

	unsigned int len = strlen(src);

	if(af == AF_INET){
		char *src_copy = (char *)malloc(len + 1);
		memset(src_copy, 0, len); 
		strcpy(src_copy, src);
		char *token = strtok(src_copy, delimiters);

		while(token != NULL){
			unsigned char byte = (unsigned char)atoi(token);
			network_value |= byte << (8 * i);
			token = strtok(NULL, delimiters);
			i++;
		}

		// (uint32_t *)dst = &network_value;
		*(uint32_t *)dst = network_value;

	}else if(af == AF_INET6){
		// TODO 过于复杂，搁置。
	}else{
		result = -1;
	}

	return result;
}