#ifndef _PEGASUS_OS_HD_H
#define _PEGASUS_OS_HD_H

// 为什么把这些常量定义在本文件？因为它们只在硬盘驱动中使用。
// Command Block Registers
#define PRIMARY_CMD_DATA_REGISTER 0x1F0
#define PRIMARY_CMD_FEATURES_REGISTER 0x1F1
#define PRIMARY_CMD_SECTOR_COUNT_REGISTER 0x1F2
#define PRIMARY_CMD_LBA_LOW_REGISTER 0x1F3
#define PRIMARY_CMD_LBA_MID_REGISTER 0x1F4
#define PRIMARY_CMD_LBA_HIGH_REGISTER 0x1F5
#define PRIMARY_CMD_DEVICE_REGISTER 0x1F6
#define PRIMARY_CMD_COMMAND_REGISTER 0x1F7

// Control Block Register
#define PRIMARY_DEVICE_CONTROL	0x3F6

// 获取硬盘参数
#define ATA_IDENTIFY 0xEC


// 操作硬盘的命令
struct hd_cmd{
	unsigned char feature;
	unsigned char sector_count;
	unsigned char lba_low;
	unsigned char lba_mid;
	unsigned char lba_high;
	unsigned char device;
	unsigned char command;
};
// 打印硬盘参数需要用到的辅助元素，不知道用什么名称才好。
struct hdinfo_meta{
	unsigned short idx;
	unsigned short len;
	unsigned char name[20];
};

// 生成Device Register
// 1. lba的最高四位作为本寄存器的低四位。
// 2. 硬盘号作为本寄存器的第5位。
// 3. 本寄存器的高三位默认是1。
// 4. 宏的写法：必须写在一行。
// 5. 宏比函数执行快；作为内联代码插入到代码中。
#define MAKE_DEVICE_REGISTER(driver_num,lba)	\
	(lba >> 24) | (driver_num << 4) | (7 << 5)		


void read_port(int port, char *fsbuf, int size);
void write_port(int port, char *fsbuf, int size);

#endif
