#include <stdio.h>

#define ASSERT
#ifdef ASSERT
void assertion_failure(char *exp, char *file, char *base_file, int line);
#define assert(exp)  if (exp) ; \
        else assertion_failure(#exp, __FILE__, __BASE_FILE__, __LINE__)
#else
#define assert(exp)
#endif


int main(int argc, char **argv)
{
	int a = 1;
	int b = 3;
	assert(a == b);
	return 0;
}

void assertion_failure(char *exp, char *file, char *base_file, int line)
{
	printf("file:%s\nbase_file:%s\nline:%d\n", file, base_file, line);
	printf("exp:%s\n", exp);
	
	return;
}
