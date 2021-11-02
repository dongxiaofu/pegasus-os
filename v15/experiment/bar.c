#include <stdio.h>
#include <string.h>

void _displayStr(char *str, int len);

typedef struct{
	int age;
	char name[10];
}Person;

Person men[10];

//void choose(int a, int b)
int choose(int a, int b)
{
  //int a = 8;
  //int b = 9;

  if(a > b){
    // 哪些函数能用，哪些函数不能用，不清楚。用C语言写代码，仍受束缚啊。
    // 比如，我想把a和字符串混合起来。在PHP中直接用点号就能连接起来。
    _displayStr("first", 5);
  }else{
    _displayStr("second", 6);
  }

	// men[0] = {20, "Jim"};
	men[0].age = 20;
	// men[0].name =  "Jim";
	memcpy(men[0].name, "Jim", 4);

	printf("name = %s, age = %d\n", men[0].name, men[0].age);
  
  return 0;
}
