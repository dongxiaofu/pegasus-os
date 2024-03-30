int strncmp(const char *s1, const char *s2, size_t n)
{
	unsigned int len1 = strlen(s1);
	unsigned int len2 = strlen(s2);

	unsigned int arr[3] = {len1, len2, n};
	
	unsigned int min = 0;

	for(int i = 0; i < 3; i++){
		if(min == 0){
			min = arr[i];
			continue;
		}		

		if(min > arr[i]){
			min = arr[i];
		}
	}

	for(int i = 0; i < min; i++){
		// if(*s1++ == *s2++){
		if(*s1 == *s2){
			*s1++;
			*s2++;
			continue;
		}

		return (*s1 - *s2);
	}
	
	return 0;
}