unsigned char isValidIPv4(const char *address) 
{
	int num, dots = 0;
	char *ptr;

	if (address == NULL)
		return 0;

	unsigned int len = Strlen(address) + 1;
	char *ip = (char *)sys_malloc(len);
	Memset(ip, 0, len);
	Strcpy(ip, address);

	ptr = strtok((char *)ip, ".");
	if (ptr == NULL)
		return 0;

	while (ptr) {
		if (!strcmp(ptr, ""))
			return 0;

		unsigned int ptr_len = Strlen(ptr);
		char *ptr_ptr = ptr;
		for(int i = 0; i < ptr_len; i++){
			unsigned char ch = *(ptr_ptr + i); 
			if (!('0' <= ch && ch <= '9'))
				return 0;
		}

		num = atoi(ptr);
		if(num < 0 || num > 255){
			return 0;
		}

		if (*ptr == '0' && Strlen(ptr) > 1)
			return 0;

		ptr = strtok(NULL, ".");

		if(ptr != NULL){
			dots++;
		}
	}

	// 难以理解。
	if (dots != 3)
		return 0;

	return 1;
}


// inet_pton() returns 1 on success (network address was successfully converted).  0 is returned if src does not contain a  charac-
// ter string representing a valid network address in the specified address family.  If af does not contain a valid address family,
// -1 is returned and errno is set to EAFNOSUPPORT.
int inet_pton(int af, const char *src, void *dst)
{
	int result = 1;

	// 检查src是不是合法的网络地址。
	IF(isValidIPv4(src) == 0){
		return 0;
	}

	// const char *delimiter = ".";
	const char delimiters[] = ".";
	unsigned char i = 0;

	uint32_t network_value = 0;

	unsigned int len = strlen(src);

	if(af == AF_INET){
		char *src_copy = (char *)sys_malloc(len + 1);
		Memset(src_copy, 0, len); 
		Strcpy(src_copy, src);
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