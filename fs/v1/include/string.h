#ifndef _PEGASUS_OS_STRING_H
#define _PEGASUS_OS_STRING_H

char *Strcpy(char *dest, char *src);
int Strlen(char *buf);
void Memcpy(void *dst, void *src, int size);
void Memset(void *dest, char character, int size);

// 为什么用宏？以后可能会不使用Memcpy
#define phycopy Memcpy

#endif