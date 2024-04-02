double floor(double x)
{
	int intergerResult = (int)x;

	if(x < 0 && x != intergerResult){
		intergerResult -= 1;
	}

	return (double)intergerResult;
}