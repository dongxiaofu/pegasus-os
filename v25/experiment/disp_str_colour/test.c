//extern disp_str_colour;
int dis_pos;
void disp_str_colour(char *str, int colour);

int main(void)
{
	char *str = "Hi";
	int colour = 9988;
	disp_str_colour(str, colour);

	return 0;
}
