char *strtok(char *str, const char *delim)
{
	static char *token;
	char *start;

	if(str != NULL){
		token = str;
	}

	if(token == NULL){
		return NULL;
	}

	char *end = _strpbrk(token, delim);

	if(end != NULL){
		start = token;	
		*end = '\0';
		// token += strlen(start) + strlen(delim); 
		token += strlen(start) + 1;
	}else{
		start = token;	
		token = NULL;
	}

	return start;
}
