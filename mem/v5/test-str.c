#include <stdio.h>
#include <string.h>

int main(int argc0, char *argv0[]){

	char read_buf[100] = "echo    hello world";

	char *argv[10];
//	char argv[5][10];
	int argc = 0;
	int word = 0;
	char *p = read_buf;
	char *s;
	char ch;
	
	do{
		ch = *p;
		if((*p != ' ' && *p != 0) && word == 0){
			s = p;
			word = 1;
		}

		if((*p == ' ' || *p == 0) && word == 1){
			argv[argc++] = s;
			//Printf("argc[%d] = %s\n", argc-1, argc[argc-1]);
			*p = 0;
			printf("argv[%d] = %s\n", argc-1, argv[argc-1]);
			word = 0;
		}

		p++;
	}while(ch);
	
	argv[argc] = 0x0;

	for(int i = 0; i < argc; i++){
		printf("argv[%d] = %s\n", i, argv[i]);
	}

	int i = 0;
	while(argv[i++]){
		printf("argv[%d] = %s\n", i-1, argv[i-1]);
	}

	return 0;
}
