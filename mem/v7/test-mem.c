

int set_bit_val(char *map, int idx, int val);

int main(int argc, char *argv[])
{
	char map[10];
	map[0] = 0;
	set_bit_val(map, 4, 1);
	int a = 8;
	int b = a;

	return 0;
}

int set_bit_val(char *map, int idx, int val)
{
	// TODO 要判断val。它只能是0或1。
	// TODO 判断idx
	int byte_idx = idx / 8;
	int bit_idx = idx % 8;	
	char byte_val = map[byte_idx];
	
	if(val >  0){
		byte_val = byte_val | (1 << bit_idx);	
	}else{
		byte_val = byte_val & (~(1 << bit_idx));
	}

	map[byte_idx] = byte_val;
	
	// TODO 在这个函数需要返回值吗？
	return 1;
}
