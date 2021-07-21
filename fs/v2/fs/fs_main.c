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
// 初始文件系统
void init_fs();
// 比较str1和str2这两个字符串的大小。 
int strcmp(char *str1, char *str2);
// 去掉完整文件路径中的路径，只留下文件名
int strip_path(char *filename, char *pathname, struct inode *dev_root);
// 查找文件
int search_file(char *pathname);
// 获取inode
struct inode *get_inode(int nr_inode);
// 分配inode-map
int alloc_imap_bit();
// 分配sector-map
int alloc_smap_bit(int nr_inode, int nr_sect_to_alloc);
// 新建inode
struct inode *new_inode(int nr_inode, int nr_start_sect);
// 创建目录项
struct root_dir_entry *new_dir_entry(struct inode *dir_root, char *filename, int nr_inode);
// 创建文件
struct inode *create_file(char *pathname);
// 打开文件
int open(char *pathname, int oflag);
// 删除文件
void do_unlink(struct inode *inode, char *filename);
// 读写文件。
// 不知道返回值，不知道需要哪些参数。边写边想吧。
void do_rdwt();

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
	// 7. cnt_of_sector_map_sect = 每个文件占用的扇区数量 * 文件数量 / (512字节 * 8)。 
	sp.cnt_of_sector_map_sect = CNT_OF_FILE_SECT * CNT_OF_FILE / SECTOR_SIZE;
	// todo 应该写错了。先不管。
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

void init_fs()
{
	mkfs();
}

int open(char *pathname, int oflag)
{
	// pcaller是调用open的进程
	// 从pcaller的filp_table中找出空闲的元素
	int i = -1;
	for(int j = 0; j < FILE_TABLE_SIZE; j++){
		if(pcaller->filp_table[j]->file_desc == 0){
			i = j;
			break;
		}
	}
	assert(i != -1);

	// 从文件描述符数组中找出空闲的文件描述符
	int j = -1;
	for(int i = 0; i < FILE_DESC_SIZE; i++){
		if(file_desc_table[i]->inode == 0){
			j = i;
			break;
		}
	}
	assert(j != -1);

	struct inode *pinode;
	// 根据pathname查找文件是否存在
	int nr_inode = search_file(pathname);
	if(oflag == O_CREAT){
		if(nr_inode > 0){
			panic("file exists\n");
		}
		// 创建文件
		pinode = create_file(pathname);
	}else{
		pinode = get_inode(nr_inode);
	}	

	// 把flip、pinode、file_desc联系起来。
	pcaller->filp_table[i]->file_desc = &file_desc_table[j];	
	file_desc_table[j]->inode = pinode;
	// 刚打开文件，pos应该是0
	file_desc_table[j]->pos = 0;
	// mode怎么设置？
	file_desc_table[j]->mode = 0;

	int fd = i;

	return fd;
}


int search_file(char *pathname)
{
	// 获取文件名
	char filename[MAX_FILENAME_LEN];
	struct inode *dev_root;
	int res = strip_path(filename, pathname, dev_root);

	assert(res != -1);

	int dev_root_dir_size = dev_root->size;
	int dev_root_dir_sect = (dev_root_dir_size + SECTOR_SIZE) / SECTOR_SIZE;
	int dir_entry_num = dev_root->size / DIR_ENTRY_SIZE;

	// 数据区的第一个扇区地址
	// todo 需要从super block中获取
	int nr_1st_data_sect = N;

	for(int i = 0; i < dev_root_dir_sect; i++){
		RD_SECT(dev, nr_1st_data_sect+i);
		// 遍历扇区
		struct dir_entry *entry = (struct dir_entry *)fsbuf;
		for(int j = 0; j < SECTOR_SIZE / DIR_ENTRY_SIZE; j++, entry++){
			if(++m > dir_entry_num){
				break;
			}

			if(strcmp(filename, entry->filename) == 0){
				return entry->nr_inode;
			}
		}
	}

	return -1;
}


int strip_path(char *filename, char *pathname, struct inode *dev_root)
{
	if(pathname == 0){
		return -1;
	}

	char *t = filename;
	char *s = pathname;

	if(*s == '/'){
		s++;
	}

	while(s){
		if(*s == '/'){
			return -1;
		}	

		*t = *s;
		t++;
		s++;
	}
	*t = 0;
	// todo 根目录的inode是一个全局变量，在哪里设置？
	dev_root = root;

	return 0;
}


int strcmp(char *str1, char *str2)
{
	if(str1 == 0 || str2 == 0){
		return (str1 - str2);
	}

	char *p1 = str1;
	char *p2 = str2;	

	for(; *p1 && *p2; p1++, p2++){
		if(*p1 != *p2){
			break;
		}
	}

	return (*p1 - *p2);
}


struct inode *get_inode(int nr_inode)
{
	if(nr_inode == 0){
		return 0;
	}

	struct inode *p = 0;
	// 从缓冲中找到目标元素	
	for(struct inode *q = &inode_table[0]; q <= &inode_table[INODE_TABLE_SIZE]; q++){
		if(q->cnt > 0){
			if(q->nr_inode == nr_inode){
				return q;
			}	
		}else{
			p = q;
			break;
		}
	}	

	// 在缓存中没有找到目标inode，从硬盘中读取。
	// todo 需要获取超级块。
	int inode_size = sizeof(struct inode);
	int pos = 1 + 1 + sb->nr_imap_sect + sb->nr_smap_sect + (nr_inode-1)/(SECTOR_SIZE/inode_size);
	RD_SECT(dev, pos);
	int offset = (nr_inode-1)%(SECTOR_SIZE/inode_size);
	struct inode *inode = (struct inode *)(fsbuf + inode_size * offset);

	// 把数据放到缓存中
	p->nr_inode = nr_inode;
	// todo 不记得inode的成员了。
	p->nr_inode = inode->size;
	p->start_sect = inode->start_sect;

	return p;
}

struct inode *create_file(char *pathname)
{
	// 获取文件名
	struct inode *dev_root;
	char *filename[MAX_FILENAME_LEN];
	if(strip_path(filename, path, dev_root) == -1){
		return 0;
	}

	// 获取nr_inode
	int nr_inode = alloc_imap_bit();
	if(nr_inode == 0){
		return 0;
	}

	// 获取文件的第一个扇区
	// todo nr_sect_to_alloc 应该从哪里获取？
	int nr_sect_to_alloc = 1024;
	int nr_start_sect = alloc_smap_bit(nr_inode, nr_sect_to_alloc);
	if(nr_start_sect == 0){
		return 0;
	}

	// 获取inode
	struct inode *inode = new_inode(nr_inode, nr_start_sect);
	if(inode == 0){
		return 0;
	}

	// 创建根目录中的目录项
	// todo dev_root 处理
	struct entry *entry = new_dir_entry(dev_root, filename, nr_inode); 
	if(entry == 0){
		return 0;
	}

	return inode;
}

int alloc_imap_bit()
{
	// 分区内的扇区分布:引导扇区(1) + 超级块(1) + inode-map(1) + sector-map(多少？)
	int pos = 1 + 1;
	// todo dev的值从何处获得？
	RD_SECT(dev, pos);

	int nr_inode = 0;
	for(int i = 0; i < SECTOR_SIZE; i++){
		// 找到第一个值不是0xFF的字节。
		if(fsbuf[i] == 0xFF)	continue;
		for(int j = 0; j < 8; j++){
			// 找到字节中第一个值不是1的bit。
			if(fsbuf[i] & (1 << j) == 1)	continue;
			// 把这个bit的值设置成1。
			fsbuf[i] |= 1 << j;
			// 为新文件分配的bit。仍然会纠结于偏移量这种常识问题。
			nr_inode = 8 * i + j;
			// 修改了数据，应该写入硬盘。
			WT_SECT(dev, pos);
			return nr_inode;
		}
	}
}

int alloc_smap_bit(int nr_inode, int nr_sect_to_alloc)
{
	// 思路：
	// 1. 从sector-map区域的第一个扇区开始，遍历N个扇区，遍历单位是扇区。
	// 2. 以字节为单位遍历每个扇区，一直找到值不是0xFF的那个字节A。
	// 3. 以bit为单位遍历字节A，一直找到值不是1的那个bit--B。
	// 4. 上面是遍历过程中第一阶段。找到B后，第一阶段的任务完成，进入第二阶段。
	// 5. 第二阶段的任务是：从B开始，把M个bit设置成1；然后，把修改过后的数据写入硬盘。
	// 6. 写硬盘的单位是扇区。只有在找到B的情况下才写硬盘。

	assert(nr_sect_to_alloc > 0);

	// todo 获取超级块
	// 每个文件占用smap的多少个bit。
	// int nr_sect_to_alloc = sb->nr_sect;
	int nr_smap_sect = sb->cnt_of_sector_map_sect;
	// smap的第一个扇区
	int nr_sect_blk0 = 1 + 1 + sb->nr_imap_sect;
	// smap中第一个值为0的bit的序号。
	int nr_free_smap_bit = 0;

	for(int i = 0; i < nr_smap_sect; i++){
		int pos = nr_sect_blk0 + i;
		RD_SECT(dev, pos);
		for(int j = 0; j < SECTOR_SIZE; j++){
			int k = 0;
			if(nr_free_smap_bit == 0){
				if(fsbuf[j] == 0xFF)	continue;
				for(; k < 8; k++){
					if(fsbuf[j] & (1 << k) == 1)	continue;
					nr_free_smap_bit = (i * SECTOR_SIZE + j) * 8 + k;
					break;
				}	
			}

			// 设置bit的值
			for(; k < 8; k++){
				fsbuf[j] &= 1 << k;
				if(--nr_sect_to_alloc == 0)
				{	
					break;
				}
			}
		}
		// 写入硬盘
		if(nr_free_smap_bit){
			WT_SECT(dev, pos);
		}

		if(nr_sect_to_alloc == 0)
		{
			break;
		}
	}

	return nr_free_smap_bit;
}

struct inode *new_inode(int nr_inode, int nr_start_sect)
{
	struct inode *new_inode = get_inode(nr_inode);
	if(new_inode == 0){
		return 0;
	}	

	new_inode->start_sect = nr_start_sect;
	new_inode->nr_sect = CNT_OF_FILE_SECT;
	new_inode->size = 0;

	// 同步到硬盘
	// todo sync_inode函数还没有实现。
	sync_inode(new_inode);

	return new_inode;
}

struct root_dir_entry *new_dir_entry(struct inode *dir_root, char *filename, int nr_inode)
{
	// 当前有多少个目录项
	int dir_entry_size = sizeof(struct dir_entry);
	int nr_entry = dir_root->size >> dir_entry_size;
	// 目录区域最多能存储max_nr_entry个目录项	
	int max_nr_entry = dir_root->nr_sect >> dir_entry_size;
	// 第一个目录项的扇区号
	int nr_dir_entry_blk0 = sb->data_1st_sect;
	// 遍历扇区的界限值
	int nr_sector_max = (dir_root->nr_sect + SECTOR_SIZE) / SECTOR_SIZE;

	// 遍历扇区
	struct dir_entry *new_entry = 0;
	struct dir_entry *pde;
	// 统计遍历过的目录项的数量
	int m = 0;
	int i;

	for(i = 0; i < nr_sector_max; i++){
		RD_SECTOR(dev, nr_dir_entry_blk0 + i);
		// 在已经使用过的目录项中寻找空闲目录项
		pde = (struct dir_entry *)fsbuf;
		for(int j = 0; j < SECTOR_SIZE/dir_entry_size; j++, pde++){
			if(++m > nr_entry){
				break;
			}

			if(pde->nr_inode == 0){
				new_pde = pde;
				break;
			}
		}

		if(m > nr_entry || new_pde){
			break;
		}
	}	

	// 当根目录区域的所有根目录都非空闲时
	if(nr_entry == max_nr_entry){
		// 根目录区域已经满了
		return 0;
	}

	// 新增目录项
	if(new_pde == 0){
		new_pde = pde;
		dir_root->size += dir_entry_size;
		// todo 实现sync_inode函数
		sync_inode(dir_root);
	}

	// 设置新目录项的值
	new_pde->nr_inode = nr_inode;
	Strcpy(new_pde->filename, filename);

	// 写入硬盘
	WT_SECTOR(dev, nr_dir_entry_blk0 + i);
}

// 函数也不好确定。我不了解所有情况，所以不好确定函数。
// todo 处理dev、dev_root、sync_inode、put_inode等。
void do_unlink(struct inode *inode, char *filename)
{
	// 简略思路：
	// 1. 检查是否能够删除目标文件
	// 2. 清除imap
	// 3. 清除smap
	// 4. 清除inode
	// 5. 清除目录项
	// 实说实说，我写这个函数，不轻松，比较费劲。 
	//
	// 根目录不能删除
	if(strcmp("/", filename) == 0){
		panic("Can not delete the root dir");
	}

	// 被其他进程使用的文件不能删除
	if(inode->cnt > 0){
		panic("Can not delete the file that is using by other process.");		
	}

	// 不能删除终端文件。
	// todo 暂不实现。	

	// 清除imap
	// 主要思路：找到目标bit所在扇区、所在字节、目标bit，然后用位运算设置值。
	int imap_bit_idx = inode->nr_inode;	
	int imap_byte_idx = imap_bit_idx / 8;
	// 目前，imap只占用一个扇区，本不需要计算。但imap不会总是被设计成一个扇区，还是不写固定值了。
	int imap_sector_idx = imap_byte_idx / SECTOR_SIZE;
	// bit在目标字节中的偏移量。
	int imap_offset = imap_bit_idx % 8;
	// 读取目标扇区
	// 引导扇区 + super block + 目标扇区
	RD_SECTOR(dev, 1 + 1 + imap_sector_idx);
	fsbuf[imap_byte_idx] &= ~(1 << imap_offset);
	WT_SECTOR(dev, 1 + 1 + imap_sector_idx);

	// 清除smap
	// 主要思路：
	// 1. 本文件的smap分为三段处理。这三段分别是：第一个字节、最后一个字节、中间字节。
	// 2. 中间字节用字节为单位，把每个字节的值设置成0，按扇区为单位写入硬盘。
	int smap_bit_idx = inode->start_sect - sb->data_1st_sect + 1;
	int smap_byte_idx = smap_bit_idx / 8;
	int smap_sect_idx = smap_byte_idx / SECTOR_SIZE;
	int smap_bit_offset = smap_bit_idx % 8;
	int smap_bit_left = smap_bit_idx - (8 - smap_bit_offset);
	int smap_byte_left = smap_bit_left / 8;
	// 处理第一个字节。第一个字节中只有(8- smap_bit_offset)个bit属于本文件的bit。
	RD_SECT(dev, 1 + 1 + sb->cnt_of_inode_map_sect + smap_sect_idx);
	fsbuf[smap_byte_idx] &= ~((~0) << smap_bit_offset); 

	// 处理中间字节
	int i = 1;
	int s = smap_sect_idx;

	for(; i < smap_byte_left; i++, smap_bit_left -= 8){
		if(i == SECTOR_SIZE){
			i = 0;
			WT_SECTOR(dev, s);
			RD_SECTOR(dev, s++);
		}
		fsbuf[i] = 0;
	}

	if(i == SECTOR_SIZE){
		i = 0;
		WT_SECTOR(dev, s);
		RD_SECTOR(dev, s++);
	}	

	// 处理最后一个字节
	fsbuf[i] &= (~0) << smap_bit_left; 
	WT_SECTOR(dev, s);

	// 清除inode，最简单
	inode->start_sect = 0;
	inode->size = 0;
	inode->nr_sect = 0;
	sync_inode(inode);
	put_inode(inode);

	// 清除目录项。又是个让我费解的问题。繁琐。
	// 主要思路：
	// 1. 和新增目录项很相似。遍历算法相似。
	// 2. 删除的目录项是最后一个时改变根目录的大小，否则，不改变。
	// 根目录的第一个扇区
	int root_dir_sect_blk0 = sb->data_1st_sect;
	// 根目录的大小
	int root_dir_size = dev_root->size;
	// 根目录占用的扇区
	int root_dir_nr_sect = dev_root->nr_sect;	
	// 根目录中的目录项的数量
	int nr_dir_entry = root_dir_size / sizeof(struct dir_entry);
	int i = 0;
	int flag = 0;
	// 纠结m的值。m是对遍历过的目录项的数量的统计。
	int m = 0;
	int new_root_dir_size = 0;
	int j;

	for(; i < root_dir_nr_sect; i++){
		RD_SECT(dev, root_dir_sect_blk0 + i);
		struct dir_entry *pde = (struct dir_entry *)fsbuf;
		// for(int j = 0; j < root_dir_nr_sect; j++, pde++){
		for(j = 0; j < root_dir_nr_sect; j++, pde++){
			if(++m > nr_dir_entry){
				break;
			}

			new_root_dir += sizeof(struct dir_entry);

			if(strcmp(pde->filename, filename) == 0){
				flag = 1;
				Memset(pde, 0, sizeof(struct dir_entry));
				break;
			}
		}

		if(m > nr_dir_entry || flag){
			break;
		}
	}

	if(m == nr_dir_entry){
		dev_root->size = new_root_dir_size;
		sync_inode(dev_root);
	}

	// 修改了根目录才写硬盘。
	if(flag){
		WT_SECT(dev, root_dir_sect_blk0 + i);
	}
	}
}
void do_rdwt()
{
	// 这个函数的主要思路：
	// 1. 先读取N个扇区。
	// 2. 读，从N个扇区中把数据复制到buf中。
	// 3. 写，从buf把数据复制到N个扇区中；然后，把N个扇区写入硬盘。
	// 上面的表述并不完全正确。
	// 有哪些难点？
	// 1. 一次读取多少个扇区？
	// 2. 每次复制多少数据？ 
	// 从文件描述符中获取操作文件时的位置。 int pos = 0;
	// 文件大小
	int file_size = inode->size;
	// 操作类型
	// todo 从Message中获取
	int hd_operate_type = HD_DEV_READ;
	// 文件操作的结束位置
	// pos的参照坐标是0，是相对于文件的初始位置的字节偏移量。
	if(hd_operate_type == HD_DEV_READ){

		pos_end = min(pos + len, file_size);

	}else{

		pos_end = min(pos + len, inode->nr_sect * SECTOR_SIZE);
	}

	int start_sect = inode->start_sect + pos / SECTOR_SIZE;
	int start_end = inode->start_sect + pos_end / SECTOR_SIZE;

	int chunk = min(start_end - start_sect + 1, FSBUF_SIZE);

	// 获取buf的物理地址
	int byte_left = len;
	// 计算buf的线性地址
	// todo 怎么确定sender？
	int ds = sender->s_reg.ds;
	int base = Seg2PhyAddrLDT(ds, sender);
	int buf_line_addr = base + buf;

	for(int i = start_sect; i <= start_end && byte_left; i += chunk){
		int byte = min(byte_left, chunk * SECTOR_SIZE - offset);
		// todo device 怎么确定？
		rd_wt(i, device, fsbuf, SECTOR_SIZE * chunk, HD_DEV_READ);		

		if(hd_operate_type == HD_DEV_READ){
			// 把数据从fsbuf中复制到buf中
			phycopy(buf_line_addr, fsbuf + offset,  byte);
			// 文件的大小不会改变
		}else{
			// 把数据从buf中复制到fsbuf中
			phycopy(fsbuf + offset, buf_line_addr, byte);
			// 把fsbuf中的数据写入硬盘
			rd_wt(i, device, fsbuf, SECTOR_SIZE * chunk, HD_DEV_WRITE);		
			// 文件的大小会改变
		}
		byte_left -= byte;
	}

	// 呵呵，这个常识，还让费解。悲伤！
	if(pos + len > inode->size){
		inode->size = pos + len;
		sync_inode(inode);
	}
}
