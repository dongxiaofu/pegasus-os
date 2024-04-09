#ifndef _PEGASUS_OS_STRING_H
#define _PEGASUS_OS_STRING_H

#include "stddef.h"

// 比较str1和str2这两个字符串的大小。
int strcmp(const char *s1, const char *s2);
// int strcmp(char *str1, char *str2);
char *Strcpy(char *dest, char *src);
int Strlen(char *buf);
void Memcpy(void *dst, void *src, int size);
void Memset(void *dest, char character, int size);

int strncmp(const char *s1, const char *s2, size_t n);

char *strpbrk(const char *s, const char *accept);
char *strtok(char *str, const char *delim);

// 为什么用宏？以后可能会不使用Memcpy
// #define phycopy Memcpy2
#define phycopy Memcpy

#endif
