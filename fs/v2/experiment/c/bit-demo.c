#include <stdio.h>

int main(int argc, char **argv)
{
	// int a = 00001111;
	char a  = 15;
	char b  = a & (~0)<<2;
	printf("b = %c\n", b);	
	printf("~0 = %c\n", (~0) << 2);
	printf("~0 = %c\n", (~0) << 2);

for (k = 0; k < byte_cnt; k++,i++,bits_left-=8) {
                if (i == SECTOR_SIZE) {
                        i = 0;
                        WR_SECT(pin->i_dev, s);
                        RD_SECT(pin->i_dev, ++s);
                }
                assert(fsbuf[i] == 0xFF);
                fsbuf[i] = 0;
        }

        // 未处理完的bit，在最后一个字节处理。
        // 最后一个字节，又需要特殊处理。为什么？
        /* clear the last byte */
        if (i == SECTOR_SIZE) {
                i = 0;
                WR_SECT(pin->i_dev, s);
                RD_SECT(pin->i_dev, ++s);
        }
        // ~0 是多少？不是1，而是11111111，共8个1。
        unsigned char mask = ~((unsigned char)(~0) << bits_left);
        // 依然费解。fsbuf的低bits_left必须是1，这样才正确。
        assert((fsbuf[i] & mask) == mask);
        // 把bits_left个bit设置成0，其他bit保留原来的值。
        // 找到了突破口，所以理解了。
        // fsbuf[i]是char类型，这限制了(~0)的数据类型也是char类型。
        fsbuf[i] &= (~0) << bits_left;
        WR_SECT(pin->i_dev, s);


	return 0;
}
