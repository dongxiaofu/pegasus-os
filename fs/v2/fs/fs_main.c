#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "console.h"
#include "proto.h"
#include "global.h"
#include "hd.h"
#include "fs.h"

// 读写硬盘
void rd_wt(int pos, int device, int buf, int len, int type);
// 建立文件系统
void mkfs();

void task_fs()
{
	Printf("%s\n", "FS is running");
	
	Message msg;
	msg.type = HD_DEV_OPEN;
	msg.source = 3;
	send_rec(BOTH, &msg, 2);

	msg.type = GET_HD_IOCTL;
	msg.source = 3;
	send_rec(BOTH, &msg, 2);

	Printf("FS : %d\n", msg.source);

	spin("Stopping\n");
}


void rd_wt(int pos, int device, int buf, int len, int type)
{
	Message msg;
	Memset(&msg, 0, sizeof(Message));
	msg.type = type;
	msg.DEVICE = device;
	msg.BUF = buf;
	msg.LEN = len;
	msg.POSITION = pos;
	// 文件系统的PID
	msg.source = TASK_FS ;
	send_rec(BOTH, &msg, TASK_HD);
}

void mkfs()
{
	// 写入超级块
	struct super_block sp;
	Memset(&sp, 0, SECTOR_SIZE);
	sp.cnt_of_inode_map_sect = 1;
	// 1. 是多少？无头绪。
	// 2. 有条理地思考。
	// 3. 需要记录的扇区有多少个？
	// 4. 需要记录的扇区中的第一个扇区的扇区号是多少？
	// 4.1. 第一个扇区，可以人为设定。
	// 4.2. 是数据区的第一个扇区？是这个。
	// 4.3. 是安装文件系统的分区的第一个扇区？不是这个。没必要记录超级块占用的扇区的使用情况。
	// 5. 一共有多少个文件？
	// 6. 每个文件占用多少个扇区？
	// 7. cnt_of_sector_map_sect = 512 * 文件数量 * 8。 
	sp.cnt_of_sector_map_sect = CNT_OF_FILE_SECT * CNT_OF_FILE * SECTOR_SIZE * 8;
	sp.cnt_of_inode_sect = (1*512*8*16) / 512;
	// 1. 数据区的第一个扇区 = 引导扇区 + 超级块 + inode-map + sector-map + inodes。
	// 2. 上面的公式中的每个元素都是简写，完整表述应该是："XX占用的扇区数量”,例如，超级块占用的扇区
	// 	数量。
	sp.data_1st_sect = 1 + 1 + sp.cnt_of_inode_map_sect + sp.cnt_of_sector_map_sect\
				+ sp.cnt_of_inode_sect;
	// 写入硬盘
	// 先把数据写入fsbuf，再写入硬盘。
	// Memcpy(fsbuf + SECTOR_SIZE, sp, SECTOR_SIZE);
	Memcpy(fsbuf, sp + SECTOR_SIZE, SECTOR_SIZE);
	// ROOT_DEV 是安装文件系统的分区的次设备号。
	// 参数1是写入超级的位置
	// Memcpy(fsbuf + 512, sp, 512);
	WT_SECT(ROOT_DEV, 1);

	// 写入inode-map
	char first_bit = 0x3;	// 0x3 的二进制形式：0000 0011。
	Memcpy(fsbuf, first_bit, 1);
	Memcpy(fsbuf + 1, 0, SECTOR_SIZE - 1);
	WT_SECT(ROOT_DEV, 1+1);
	// 写入sector-map
	// pos的值 = 1（引导扇区）+ 1（超级块）+ 1(inode-map)。
	int pos = 1 + 1 + 1;
	// 写入第一个扇区。这个扇区的前256个字节的所有bit都是1，后256个字节的所有bit都是0。
	Memset(fsbuf, 0xFF, SECTOR_SIZE>>1);
	// 前面256*8 + 1个bit都是1，后面所有的字节的bit都是0。
	// 这里，费解！三四个小时前写的，现在看，又花了点时间才理解。
	// 1个字节：0000 0001。多出来的1，是sector-map的第0个bti是保留位造成的。
	Memset(fsbuf + SECTOR_SIZE >> 1, 1, 1);
	// 256 * 8 + 1，256*8个扇区，这是一个文件能占用的最大扇区数量。
	// 256 + 1 个字节，前256个字节的每个bit都是1，第257个字节的8个bit中的第0个bit是1。
	Memset(fsbuf + SECTOR_SIZE>>1 + 1, 0, SECTOR_SIZE>>1 - 1);
	WT_SECT(ROOT_DEV, pos); 
	// 写入sector-map的剩余扇区
	int rest_sects = sp.cnt_of_sector_map_sect - 1;
	for(int i = 1; i <= rest_sects; i++){
		Memset(fsbuf, 0, SECTOR_SIZE);
		WT_SECT(ROOT_DEV, pos + i);
	}
	// 写入inode-array
	// 先找出第一个空闲的inode。初始化时不必寻找。
	Memset(fsbuf, 0, SECTOR_SIZE);
	struct inode inode;
	inode.type = FILE_TYPE_TEXT;
	inode.size = 0;
	inode.start_sect = sp.data_1st_sect;
	inode.nr_sect = CNT_OF_FILE_SECT;	
	// 只存在于内存中的inode成员，不能在此时赋值。
	Memcpy(fsbuf, &inode, INODE_SIZE);
	// 很想用一个变量存储1 + 1 + 1 + sp.cnt_of_sector_map_sect，可想不出好名字。
	WT_SECT(ROOT_DEV, 1 + 1 + 1 + sp.cnt_of_sector_map_sect);
	// 写入根目录
	struct dir_entry dir_entry;
	dir_entry.nr_inode = 1;
	char filename[2];
	filename[0] = '.';
	filename[1] = '0';
	Memcpy(dir_entry.filename, filename, sizeof(filename));
	Memcpy(fsbuf, &dir_entry, sizeof(dir_entry));
	WT_SECT(ROOT_DEV, sp.data_1st_sect);
	//
}
