// TODO 此函数目前不处理endptr，仅支持十六进制。
long int strtol(const char *nptr, char **endptr, int base)
{
	char *ptr = nptr;

	long int number = 0;
	int currentNum = 0;
	int cnt = 0;

	//while(*ptr++){
	while(*ptr){
		if(base == 16){
			if('a' <= *ptr && *ptr <= 'f'){
				currentNum = 10 + *ptr - 'a';
			}else if('A' <= *ptr && *ptr <= 'F'){
				currentNum = 10 + *ptr - 'A';
			}else if('0' <= *ptr && *ptr <= '9'){
				currentNum = *ptr - '0';
			}else{
				currentNum = 0;
			}
		}else{

		}
		
		ptr++;

		number = number * base + currentNum;
	}

	return number;
}
