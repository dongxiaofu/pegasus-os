char *strpbrk(const char *s, const char *accept)
{
	if(s == NULL || accept == NULL){
		return NULL;
	}

	unsigned int accept_len = strlen(accept);
	unsigned int s_len = strlen(s);
//	char *s_copy = (char *)malloc(s_len + 1);
//	memset(s_copy, 0, s_len + 1);
//	strcpy(s_copy, s);

	for(int i = 0; i < s_len; i++){
		// if(strncmp(s+i, accept, accept_len) == 0){
		for(int j = 0; j < accept_len; j++){
			if(*(s+i) == *(accept + j)){
				return (char *)(s+i);
			}
		}
	}

	return NULL;
}