#include "alloca.h"
#include "math.h"

void *alloca(size_t size)
{
	unsigned int address = (unsigned int)&size - size;
	double val = floor((double)(address));
	void *sp =  (int)val * sizeof(size);

	return sp;
}
