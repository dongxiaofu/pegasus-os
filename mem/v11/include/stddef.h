#ifndef _PEGASUS_OS_STDDEF_H
#define _PEGASUS_OS_STDDEF_H

#define NULL ((void *)0)
typedef unsigned int size_t;

#define offsetof(type, member) (size_t)(&(((type *)0)->member))	

#endif