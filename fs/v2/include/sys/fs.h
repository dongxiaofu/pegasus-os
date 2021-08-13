#ifndef _PEGASUS_OS_FS_H
#define _PEGASUS_OS_FS_H

// 文件名的最大长度
#define MAX_FILENAME_LEN	14
// 最大文件数量
#define CNT_OF_FILE	4096	// 512*8 = 4096。
// #define SECTOR_SIZE	512
// 一个文件占用的扇区数量
#define CNT_OF_FILE_SECT  2048
// 一个inode占用多少空间
#define INODE_SIZE	16
// 超级块
struct super_block{
	// 数据区域的第一个扇区的偏移量。
	int data_1st_sect;
	// inode-map占用的扇区数量
	int cnt_of_inode_map_sect; 
	// sector-map占用的扇区数量
	int cnt_of_sector_map_sect;
	// inode-array占用的扇区数量
	int cnt_of_inode_sect;
	// 一个文件分配多少个扇区。放在inode中，能随时获取这个值。
	int nr_sect;
	// 只存在于内存中
	// 次设备号
	int dev;
};
// 文件类型。想不出大家都用的名称。先随便取名，后续再改。
// 特殊文件
#define FILE_TYPE_SPECIAL_CHAR 1
// 文本文件
#define FILE_TYPE_TEXT 2
// inode
struct inode{
	// 文件类型，例如：终端、文本文件
	int type;
	// 文件大小
	int size;
	// 存储文件的第一个扇区的LBA地址。是LBA地址还是偏移量？
	int start_sect;
	// 一个文件分配多少个扇区。放在inode中，能随时获取这个值。
	int nr_sect;
	// 在imap中的索引
	int nr_inode;

	// 只存在于内存中
	// 次设备号
	int dev;
	// 引用数
	int cnt;
	// 想不起来了。说明我还不需要这些成员。
};

// 目录项
struct dir_entry{
	// 本目录项对应的inode在inode-array中的索引？在inode-map的索引？
	// 暂定为inode-map的索引。
	int nr_inode;
	char filename[MAX_FILENAME_LEN];
};
// 目录项的长度
#define DIR_ENTRY_SIZE (sizeof(int) + MAX_FILENAME_LEN)

// 文件描述符
struct file_desc{
	// 打开文件的模式，例如：可读、可写
	int mode;
	// 记录文件操作的当前位置
	// 这个当前位置相对于本文件还是本分区？
	int pos;
	// 文件描述符关联的inode。应该使用inode的索引还是指向inode的指针？
	struct inode *inode;	
	// 文件描述符引用数
	int fd_cnt;
	//想不起来了 

};

// 文件描述符数组长度
#define FILE_DESC_SIZE 64
// 文件描述符数组
struct file_desc file_desc_table[FILE_DESC_SIZE];
// open的oflag参数
#define O_RDONLY	0
#define O_WRONLY	1
#define O_RDWR		2

#define O_EXEC		3
#define O_SEARCH	4
#define O_APPEND	5
#define O_CLOEXEC	6

#define O_CREAT		7

// inode缓存
#define INODE_TABLE_SIZE FILE_DESC_SIZE
struct inode inode_table[INODE_TABLE_SIZE];

// fsbuf这个缓存区的内存地址设置成什么？
// 我不知道，随便设置了一个值。
#define fsbuf	0x1000000
#define FSBUF_SIZE	1024 * 1024

// 读写硬盘，单位是扇区
#define RD_SECT(device, pos)	rd_wt(pos, device, fsbuf, SECTOR_SIZE, HD_DEV_READ)
#define WT_SECT(device, pos)	rd_wt(pos, device, fsbuf, SECTOR_SIZE, HD_DEV_WRITE)

// 安装文件系统的分区的次设备号。
// 次设备号应该是多少？
// hda1是hd.h中定义的常量，所以，要把hd.h放入fs_main.c中。
#define ROOT_DEV (hd1a + 16)

// 生成设备号
#define MAKE_DEV(a, b)  (a << 8 | b)

#endif
