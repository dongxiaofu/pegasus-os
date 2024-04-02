void *alloca(size_t size)
{
	double val = floor((void *)&size - size);
	void *sp =  (int)val * sizeof(size);

	return sp;
}