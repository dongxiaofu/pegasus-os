#ifndef _PEGASUS_OS_STDIO_H
#define _PEGASUS_OS_STDIO_H

// debug start
// panic的魔数
#define PANIC_MAGIC 58
// assert的魔数
#define ASSERT_MAGIC 59
int vsprintf(char *buf, char *fmt, char *var_list);
void printx(char *fmt, ...);
int write_debug(char *buf, int len);
// int vsprintf_debug(char *buf, char *fmt, char *var_list);
void spin(char *error_msg);
void panic(char *error_msg);
void assertion_failure(char *exp, char *filename, char *base_filename, unsigned int line);

//#define assert if(exp) ;
#define assert(exp)  if(exp) ; \
	else assertion_failure(#exp, __FILE__, __BASE_FILE__, __LINE__)

#define assert2(exp, arg)  if(exp) ; \
	else assertion_failure2(#exp, arg, __FILE__, __BASE_FILE__, __LINE__)


char* i2a(int val, int base, char ** ps);
// 只支持%x
void Printf(char *fmt, ...);
int sprintf(char *str, const char *format, ...);

// 把整型数字转成指定进制的字符串
// void itoa(int value, char **str, int base);
char *itoa(int value, char **str, int base);

void num_to_string(char *str, int num);
void disp_int(int num);

int sscanf(const char *str, const char *format, ...);


// debug end

int open(char *pathname, int flags);
int read(int fd, void *buf, int count);
int write(int fd, const void *buf, int count);
int close(int fd);

void perror(const char *s);

#endif
