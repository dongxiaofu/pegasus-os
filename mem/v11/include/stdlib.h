#ifndef _PEGASUS_OS_STDLIB_H
#define _PEGASUS_OS_STDLIB_H

#include "stddef.h"

void *calloc(size_t nmemb, size_t size);
int atoi(const char *nptr);
long int strtol(const char *nptr, char **endptr, int base);

#endif
