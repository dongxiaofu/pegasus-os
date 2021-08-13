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
// 从硬盘读取数据
#define ATA_READ 0x20
// 向硬盘写入数据
#define ATA_WRITE 0x30


// 分区表在MBR或EBR中的偏移量
#define PARTITION_TABLE_OFFSET	0x1BE

// MBR中的分区表中的分区表项的数量
#define NR_MBR_DPT_ENTRY 4
// EBR中的分区表中的分区表项的数量
#define NR_EBR_DPT_ENTRY 2
// 硬盘的主分区数量
#define NR_HD_PRIMARY_PARTITION 4
// 主扩展分区包含的扩展分区数量
#define NR_HD_EXTEND_PARTITION 16

// 硬盘分区ystem_id
#define PARTITION_SYSTEM_ID_PRIMARY	0x83
#define PARTITION_SYSTEM_ID_EXTENDED	0x5
// 不是可用分区
#define PARTITION_SYSTEM_ID_NO_PART	0x0


// 主分区
#define PART_PRIMARY	0
// 扩展分区
#define PART_EXTENDED	1

// 操作硬盘的命令
struct hd_cmd{
	// 作用是什么？
	unsigned char feature;
	// 要操作的扇区数量
	unsigned char sector_count;
	unsigned char lba_low;
	unsigned char lba_mid;
	unsigned char lba_high;
	unsigned char device;
	// 读硬盘、写硬盘、识别硬盘
	unsigned char command;
};
// 打印硬盘参数需要用到的辅助元素，不知道用什么名称才好。
struct hdinfo_meta{
	unsigned short idx;
	unsigned short len;
	unsigned char name[20];
};

// 分区表项
// 对照《一个操作系统的实现》表9.3写出这个结构。
struct partition_table_entry{
	unsigned char status;
	unsigned char start_head;
	unsigned char start_sector;
	unsigned char start_cylinder;
	unsigned char system_id;
	unsigned char end_head;
	unsigned char end_sector;
	unsigned char end_cylinder;
	unsigned int start_sector_lba;
	unsigned int nr_sector;	
};

// 硬盘分区
struct hd_part{
	unsigned int base;
	unsigned int size;
};

// 分区信息
struct hd_info{
	unsigned int open_cnt;
	struct hd_part primary_part[NR_HD_PRIMARY_PARTITION];
	struct hd_part logical_part[NR_HD_EXTEND_PARTITION * 4];
};

// 生成Device Register
// 1. lba的最高四位作为本寄存器的低四位。
// 2. 硬盘号作为本寄存器的第5位。
// 3. 本寄存器的高三位默认是1。
// 4. 宏的写法：必须写在一行。
// 5. 宏比函数执行快；作为内联代码插入到代码中。
#define MAKE_DEVICE_REGISTER(driver_num,lba)	\
	(lba >> 24) | (driver_num << 4) | (7 << 5)		
// 如果不是每个宏都被使用，我认为，不应该弄出这么多只在宏中使用的宏。
// 第0块硬盘的第1个主分区的第1个逻辑分区的次设备号
#define hd1a	0x10
// 第0块硬盘的第2个主分区的第1个逻辑分区的次设备号
#define hd2a	0x20
// 最大的主分区号
#define NR_PRIM_MAX	9
// 每个硬盘有四个主分区
#define NR_PRIM_PART_PER_HD	4
// 每个硬盘有五个设备号，硬盘本身的设备号是0
// #define NR_DEV_PER_HD	NR_PRIM_PART_PER_HD + 1
// #define NR_DEV_PER_HD	5
// 一定应该是(NR_PRIM_PART_PER_HD + 1)，而不是NR_PRIM_PART_PER_HD + 1
#define NR_DEV_PER_HD	(NR_PRIM_PART_PER_HD + 1)
// 每个主分区能划分出16个逻辑分区
#define NR_SUB_PART_PER_PRIM	16
// 根据次设备号计算硬盘号
// 难点是用什么理由写出NR_SUB_PART_PER_PRIM * NR_PRIM_PART_PER_HD这个等式，我想直接写64。
//#define DR_OF_DEV(device) device < NR_PRIM_MAX ? \
//	device / NR_DEV_PER_HD:\
//	(device-hd1a) / (NR_SUB_PART_PER_PRIM * NR_PRIM_PART_PER_HD) 

#define DR_OF_DEV2(device) (device <= NR_PRIM_MAX ? 0 : 0)
// 根据次设备号计算硬盘编号
#define DR_OF_DEV(device) (device <= NR_PRIM_MAX ? \
	device / NR_DEV_PER_HD:\
	(device-hd1a) / (NR_SUB_PART_PER_PRIM * NR_PRIM_PART_PER_HD)) 
// 根据次设备号计算逻辑分区数组索引
#define IDX_OF_LOGICAL(device) ((device - hd1a) % (NR_SUB_PART_PER_PRIM * NR_PRIM_PART_PER_HD))
// 位移运算---字节与扇区的换算需要移动的位数
#define SECTOR_SIZE_SHIFT 9
void read_port(int port, char *fsbuf, int size);
void write_port(int port, char *fsbuf, int size);

#endif
