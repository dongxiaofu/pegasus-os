#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "mem.h"
#include "protect.h"
#include "process.h"
#include "console.h"
#include "proto.h"
#include "global.h"
#include "hd.h"
#include "fs.h"

// 根目录的inode
// struct inode *root;
// 使用数据而非指针更好。不是更好，是必须。若使用指针，指向fsbuf，fsbuf的数据更换后，使用
// root不能获取到需要的数据。
struct inode root;

// 读写硬盘
void rd_wt(int pos, int device, char *buf, int len, int type);

// 建立文件系统
void mkfs();

// 初始文件系统
void init_fs();

// 比较str1和str2这两个字符串的大小。
//int strcmp(char *str1, char *str2);

// 去掉完整文件路径中的路径，只留下文件名
int strip_path(char *filename, char *pathname, struct inode *dev_root);

// 查找文件
int search_file(char *pathname);

// 获取inode
// struct inode *get_inode(int nr_inode);
int get_inode(struct inode *inode, int nr_inode);

// 获取super_block
struct super_block *get_super_block();

// 分配inode-map
int alloc_imap_bit();

// 分配sector-map
int alloc_smap_bit(int nr_inode, unsigned int nr_sect_to_alloc);

// 新建inode
// struct inode *new_inode(int nr_inode, int nr_start_sect);
int new_inode(struct inode *inode, int nr_inode, int nr_start_sect);

// 同步indoe到硬盘
void sync_inode(struct inode *inode);

// 将inode的cnt减去1
void put_inode(struct inode *inode);

// 创建目录项
int new_dir_entry(struct dir_entry *dir_entry, struct inode *dir_root, char *filename, int nr_inode);

// 创建文件
// struct inode *create_file(char *pathname);
int create_file(struct inode *inode, char *pathname);

// 打开文件
// int do_open(char *pathname, int oflag);
int do_open(Message *msg);

// 删除文件
void do_unlink(char *filename);

// 读写文件。
// 不知道返回值，不知道需要哪些参数。边写边想吧。
// void do_rdwt(Message *msg);
int do_rdwt(Message *msg);

// 关闭文件
int do_close(int fd);

int c = 0;

void task_fs()
{
    Proc *cur = get_running_thread_pcb();
    init_fs();

    Message *msg = (Message *)sys_malloc(sizeof(Message));
    Message *fs_msg  = (Message *)sys_malloc(sizeof(Message));

    while (1)
    {
        Memset(msg, 0, sizeof(Message));
        send_rec(RECEIVE, msg, ANY);
        int type = msg->TYPE;
        int source = msg->source;
        int fd = msg->FD;
	// todo 很辛苦才找到的错误。
	int proc_who_want_to_rdwt = msg->PROCNR;
	if(msg->source == INIT_PID){
		//Printf("INIT is calling\n");
	}
        // 不知道为何会发送来source为0、type为0的消息，不处理吧。
        // todo 耗费了好多好多好多好多时间才发现，原来是这里阻止了TTY通过FS唤醒INIT进程。
        // 我的调试能力，太差了。
        if (msg->source == 0)
        {
            //continue;
            int t = 5;
        }

		int byte_rdwt = 0;
        // open
        pcaller = pid2proc(source);

		assert(type == 0 || type == RESUME_PROC || type == OPEN || type == READ || type == WRITE || type == CLOSE);
        switch (type)
        {
        case OPEN:
            // fs_msg.FD = do_open(pathname, oflags);
            msg->TYPE = SYSCALL_RET;
            msg->FD = do_open(msg);
			send_rec(SEND, msg, msg->source);
            break;
        case READ:
        case WRITE:
           	byte_rdwt =  do_rdwt(msg);
            break;
        case CLOSE:
            //	int fd = msg.FD;
            do_close(fd);
            break;
		case RESUME_PROC:
			send_rec(SEND, msg, msg->PROCNR);
			break; 
		case 0:
			// 不清楚内核线程为啥发来type为0的消息。
			break;
        default:
            panic("FS Unknown message");
            break;
        }
    }
}

void rd_wt(int pos, int device, char *buf, int len, int type)
{
//	////Printf("enter fs rd_wt\n");
    Message *msg = (Message *)sys_malloc(sizeof(Message));
    Memset(msg, 0, sizeof(Message));
    msg->TYPE = type;
    msg->DEVICE = device;
    msg->BUF = buf;
    msg->LEN = len;
    msg->POSITION = pos * SECTOR_SIZE;
    //   msg.POSITION = pos;// * SECTOR_SIZE;
    // 文件系统的PID
    // msg.source = TASK_FS;
    assert(type == READ || type == WRITE);
    assert(msg->TYPE == READ || msg->TYPE == WRITE);
    send_rec(BOTH, msg, TASK_HD);

	sys_free(msg, sizeof(Message));
}

void mkfs()
{
    //    // fsbuf未定义。神奇！
    //    //Memset(fsbuf, 0, 512);
    //    RD_SECT(ROOT_DEV, 1);
    //    ////Printf("read over\n");
    //    Memset(fsbuf, 0x0, 512);
    //    WT_SECT(ROOT_DEV, 1);
    //    Memset(fsbuf, 0xFF, 512);
    //    RD_SECT(ROOT_DEV, 1);
    //    ////Printf("fsbuf = %s\n", fsbuf);
    //    return;
    // 写入超级块
    // fsbuf = (char *)sys_malloc(sizeof(SECTOR_SIZE));
    fsbuf = (char *)sys_malloc(ONE_MB);
	super_block_buf = (struct super_block *)sys_malloc(sizeof(struct super_block)); 

	phy_fsbuf = get_physical_address((unsigned int)fsbuf);
	phy_super_block_buf = get_physical_address((unsigned int)super_block_buf);

    // 写入超级块
    Memset(fsbuf, 0x0, 512);
    WT_SECT(ROOT_DEV, 0);
    struct super_block *sp = (struct super_block *)fsbuf;
    sp->cnt_of_inode_map_sect = 1;
    sp->nr_sect = CNT_OF_FILE_SECT;
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
    sp->cnt_of_sector_map_sect = CNT_OF_FILE_SECT * CNT_OF_FILE / SECTOR_SIZE / 8;
    // sp->cnt_of_inode_sect = (1 * 512 * 8 * 16) / 512;
    // todo 文件数 * 16 / 512
    sp->cnt_of_inode_sect = (CNT_OF_FILE * INODE_SIZE) / SECTOR_SIZE;

    // 1. 数据区的第一个扇区 = 引导扇区 + 超级块 + inode-map + sector-map + inodes。
    // 2. 上面的公式中的每个元素都是简写，完整表述应该是："XX占用的扇区数量”,例如，超级块占用的扇区
    // 	数量。
    sp->data_1st_sect = 1 + 1 + sp->cnt_of_inode_map_sect + sp->cnt_of_sector_map_sect + sp->cnt_of_inode_sect;
    // 写入硬盘
    // 先把数据写入fsbuf，再写入硬盘。
    // Memcpy(fsbuf + SECTOR_SIZE, sp, SECTOR_SIZE);
    // Memcpy(fsbuf, &sp, SECTOR_SIZE);
    // Memcpy(fsbuf, sp + SECTOR_SIZE, SECTOR_SIZE);
    // ROOT_DEV 是安装文件系统的分区的次设备号。
    // 参数1是写入超级的位置
    //int sp_size = SUPER_BLOCK_SIZE;
    int sp_size = SUPER_BLOCK_SIZE;
    // 调试
    //assert(sp->data_1st_sect == 2211);
    //assert(sp->cnt_of_sector_map_sect == 2048);
    //assert(sp->cnt_of_inode_sect == 160);
    //assert(sp->cnt_of_inode_map_sect == 1);
    //assert(sp->nr_sect = CNT_OF_FILE_SECT);
    //    Memcpy(fsbuf, sp, sp_size);
    Memset(fsbuf + sp_size, 0x80, 512 - sp_size);
    WT_SECT(ROOT_DEV, 1);

    struct super_block sp2 = *sp;

    // 写入inode-map
    // todo 又看不懂这块的逻辑了。先让语法错误消失吧。
    // char first_bit = 0x3;    // 0x3 的二进制形式：0000 0011。
    // imap的第0个bit是保留位，剩下的依次是：根目录、dev_tty1、dev_tty2、dev_tty3。
    // char first_byte = 31; // 31 的二进制形式：0001 1111。
    char first_byte = 0x3F; //  二进制形式：0011 1111。
    // todo 如此写入first_bit，好像不妥。
    Memset(fsbuf, first_byte, 1);
    Memset(fsbuf + 1, 0x80, SECTOR_SIZE - 1);
    WT_SECT(ROOT_DEV, 1 + 1);
    // 写入sector-map
    // pos的值 = 1（引导扇区）+ 1（超级块）+ 1(inode-map)。
    int pos = 1 + 1 + 1;
	// 新增 install.tar 之前的sector-map初始 start
    // 写入第一个扇区。这个扇区的前256个字节的所有bit都是1，后256个字节的所有bit都是0。
    // 一个文件最多占用256 * 8 = 2048个扇区，2048*512/1024/1024个字节 = 1M个字节。
//    Memset(fsbuf, 0xFF, SECTOR_SIZE >> 1);
//    // 前面256*8 + 1个bit都是1，后面所有的字节的bit都是0。
//    // 这里，费解！三四个小时前写的，现在看，又花了点时间才理解。
//    // 1个字节：0000 0001。多出来的1，是sector-map的第0个bti是保留位造成的。
//    // error: invalid operands to binary >> (have 'char *' and 'int')
//    // Memset(fsbuf + SECTOR_SIZE >> 1, 1, 1);
//    // Memset(fsbuf + (SECTOR_SIZE >> 1), 1, 1);
//    // 256 * 8 + 1，256*8个扇区，这是一个文件能占用的最大扇区数量。
//    // 256 + 1 个字节，前256个字节的每个bit都是1，第257个字节的8个bit中的第0个bit是1。
//    // error: invalid operands to binary >> (have 'char *' and 'int')
//    // Memset(fsbuf + SECTOR_SIZE >> 1 + 1, 0, SECTOR_SIZE >> 1 - 1);
//    //Memset(fsbuf + (SECTOR_SIZE >> 1) + 1, 0x01, SECTOR_SIZE >> 1 - 1);
//    //Memset(fsbuf + (SECTOR_SIZE >> 1) + 1, 0x01, 1);
//    Memset(fsbuf + (SECTOR_SIZE >> 1), 0x01, 1);
//    // 这个扇区的后255个字节都是0，前256个字节是0xFF,第256个字节是0x1。
//    int rest_bits = (SECTOR_SIZE >> 1) - 1;
//    // Memset(fsbuf + (SECTOR_SIZE >> 1) + 1 + 1, 0x0, rest_bits);
//    Memset(fsbuf + (SECTOR_SIZE >> 1) + 1, 0x0, rest_bits);
	// 新增 install.tar 之前的sector-map初始 end
	// 新增 install.tar 之后的sector-map初始 start
Memset(fsbuf, 0xFF, SECTOR_SIZE);
WT_SECT(ROOT_DEV, pos);	
// 因为保留位而多出来的一个bit
Memset(fsbuf, 0x1, 1);
// todo 硬盘不会写入0，怎么办？
Memset(fsbuf+1, 0x0, SECTOR_SIZE-1);
	// 新增 install.tar 之后的sector-map初始 end
    WT_SECT(ROOT_DEV, pos + 1);
    //        Memset(fsbuf, 0x40, SECTOR_SIZE);
    //        WT_SECT(ROOT_DEV, pos + 1);
    // 写入sector-map的剩余扇区
    int rest_sects = sp2.cnt_of_sector_map_sect - 2;
//	rest_sects = 3;
	// todo 不是非常确定此处是否应该加1。
    for (int i = 2; i <= rest_sects + 1; i++)
    {
	// 多次执行Memset，会导致段错误。
 //      Memset(fsbuf, 0x0, SECTOR_SIZE);
 //      多次执行WT_SECT，会导致TASK_HD接收到非法type操作。原因未知。
//       WT_SECT(ROOT_DEV, pos + i);
    }
    //return;
    // 写入inode-array
    // 先找出第一个空闲的inode。初始化时不必寻找。
    //Memset(fsbuf, 0, SECTOR_SIZE);
    //    struct inode *inode = (struct inode *)fsbuf;;
    //    inode->type = FILE_TYPE_TEXT;
    //    inode->size = DIR_ENTRY_SIZE;
    //    inode->start_sect = sp2.data_1st_sect;
    //    inode->nr_sect = CNT_OF_FILE_SECT;
    // 只存在于内存中的inode成员，不能在此时赋值。
    //  Memcpy(fsbuf, &inode, INODE_SIZE);
    // 很想用一个变量存储1 + 1 + 1 + sp.cnt_of_sector_map_sect，可想不出好名字。
    WT_SECT(ROOT_DEV, 1 + 1 + 1 + sp2.cnt_of_sector_map_sect);

    // 创建默认文件：根目录、终端。
    // 错了！这是inode-array的初始位置。没错。
    RD_SECT(ROOT_DEV, 1 + 1 + 1 + sp2.cnt_of_sector_map_sect);
    //	RD_SECT(ROOT_DEV, sp2.data_1st_sect);
    // 创建根目录
    struct inode *pinode = (struct inode *)fsbuf;
    pinode->type = FILE_TYPE_TEXT;
    // todo 初始化文件系统时默认有5个文件，分别是：根目录、三个终端、install.tar
    pinode->size = DIR_ENTRY_SIZE * INIT_FS_FILE_CNT;
    pinode->start_sect = sp2.data_1st_sect;
    pinode->nr_sect = CNT_OF_FILE_SECT;
    // 根目录的inode用imap中的第1个bit记录。
    pinode->nr_inode = 1;

    // todo 存储根目录的inode到root中，下面的方法是否可以？
    //Memcpy(&root, pinode, sizeof(pinode));
    //Memcpy(&root, pinode, INODE_SIZE);
    // todo 这种方法是否行得通？
    //*root = *pinode;
    root = *pinode;

    // 创建终端
    for (int i = 0; i < 3; i++)
    {
        //pinode = (struct inode *) (fsbuf + INODE_SIZE * (i + 1));
        pinode = (struct inode *)(fsbuf + INODE_SIZE * (i + 1));
        pinode->type = FILE_TYPE_SPECIAL_CHAR;
        pinode->size = 0;
        pinode->nr_sect = 0;
        // todo 待确定。
        int task_tty = 0;
        pinode->start_sect = MAKE_DEV(task_tty, i);
    }

	// 创建其他文件，例如install.tar
	// todo 这个数组，语法有问题吗？
	int other_file_cnt = 1;
	// error: variable-sized object may not be initialized
	// char *other_file_name[other_file_cnt] = {"install.tar"};
	char *other_file_name[10] = {"install.tar"};
	for(int i = 0; i < other_file_cnt; i++){
		// 错误，other_file_name[i] 的长度是10。
//		if(Strlen(other_file_name[i]) == 0)	continue;
		
	// todo 漏掉了这句。更好的方式，使用pinode++。
        pinode = (struct inode *)(fsbuf + INODE_SIZE * (i + 4));
	    pinode->type = FILE_TYPE_TEXT;
	    // todo 初始化文件系统时默认有5个文件，分别是：根目录、三个终端、install.tar
	    pinode->size = 583680;
	    pinode->start_sect = sp2.data_1st_sect + (i+1) * CNT_OF_FILE_SECT;
	    pinode->nr_sect = CNT_OF_FILE_SECT;
	    // 根目录的inode用imap中的第1个bit记录。
	    pinode->nr_inode = INIT_FS_FILE_CNT + i;
	}

    WT_SECT(ROOT_DEV, 1 + 1 + 1 + sp2.cnt_of_sector_map_sect);

    // 写入根目录
    RD_SECT(ROOT_DEV, sp2.data_1st_sect);
    struct dir_entry dir_entry2;
    dir_entry2.nr_inode = 0xCC;
    // 并不需要手工添加字符串的结束字符，因为Memcpy并不会复制结束字符。
    // 说错了，Memcpy会复制指定长度的字符串，可以看Memcpy的实现。
    char filename[2] = ".";
    //filename[0] = '.';
    //filename[1] = '0';
    //filename[1] = 0;
    //    char filename[3] = "AB";
    //	filename[3] = 0;
    //Memcpy(dir_entry2.filename, filename, sizeof(filename));
    struct dir_entry *dir_entry = (struct dir_entry *)fsbuf;
    dir_entry->nr_inode = 0x1;
    Memcpy(dir_entry->filename, filename, Strlen(filename));
    //Memcpy(fsbuf, &dir_entry2, DIR_ENTRY_SIZE);

    char *tty_name[10] = {"dev_tty0", "dev_tty1", "dev_tty2"};
    int tty_cnt = 3;
    // 写入终端的目录项
    for (int i = 0; i < tty_cnt; i++)
    {
        dir_entry++;
        dir_entry->nr_inode = 2 + i;
        Memcpy(dir_entry->filename, tty_name[i], Strlen(tty_name[i]));
    }
    //WT_SECT(ROOT_DEV, sp2.data_1st_sect);

	// 写入其他文件的目录项，例如install.tar
	for(int i = 0; i < other_file_cnt; i++){
		if(Strlen(other_file_name[i]) == 0) continue;
        	dir_entry++;
        	dir_entry->nr_inode = INIT_FS_FILE_CNT + i;
        	Memcpy(dir_entry->filename, other_file_name[i], Strlen(other_file_name[i]));
	}
    WT_SECT(ROOT_DEV, sp2.data_1st_sect);
}

void init_fs()
{

    Message *driver_msg = (Message *)sys_malloc(sizeof(Message));
    driver_msg->TYPE = OPEN;
    // todo 暂时使用硬编码。
    driver_msg->DEVICE = 32;
    send_rec(BOTH, driver_msg, TASK_HD);
    mkfs();

	sys_free(driver_msg, sizeof(Message));
}

// int do_open(char *pathname, int oflag)
int do_open(Message *msg)
{
	
    	char pathname[12];
	Memset(pathname, 0, 12);
    // FILENAME的长度包含末尾的'0'吗？
//    int p_source = 0xA00000 + msg.PATHNAME;
	unsigned int phy_pathname = msg->PATHNAME;
	unsigned int vaddr_pathname = alloc_virtual_memory(phy_pathname, sizeof(pathname));
	phycopy(pathname, vaddr_pathname, msg->NAME_LEN);
	pathname[msg->NAME_LEN] = 0;
	int oflag = msg->FLAGS;
	////Printf("Enter fs open\n");
    // pcaller是调用open的进程
    // 从pcaller的filp_table中找出空闲的元素
    int i = -1;
    for (int j = 0; j < FILP_TABLE_SIZE; j++)
    {
        if (pcaller->filp[j] == 0)
        {
            i = j;
            break;
        }
    }
    assert(i != -1);

    // 从文件描述符数组中找出空闲的文件描述符
    int j = -1;
    for (int i = 0; i < FILE_DESC_SIZE; i++)
    {
        if (file_desc_table[i].nr_inode == 0)
        {
            j = i;
            break;
        }
    }
    assert(j != -1);

    struct inode pinode;
    // 根据pathname查找文件是否存在
    int nr_inode = search_file(pathname);
    if (oflag == O_CREAT)
    {
        if (nr_inode > 0)
        {
            panic("file exists\n");
        }
        // 创建文件
        //pinode = create_file(pathname);
        create_file(&pinode, pathname);
    }
    else
    {
	if(nr_inode == -1){
		return -1;
	}
        int res = get_inode(&pinode, nr_inode);
	if(res == 0){
//		return -1;
	}
    }

    //    panic("open file failure\n");

    //	assert(pinode.nr_inode == 5);
    // 把flip、pinode、file_desc联系起来。
    pcaller->filp[i] = &file_desc_table[j];
    file_desc_table[j].nr_inode = pinode.nr_inode;
    //	assert(file_desc_table[j].nr_inode == 5);
    // 刚打开文件，pos应该是0
    file_desc_table[j].pos = 0;
    // mode怎么设置？
    file_desc_table[j].mode = 0;

    int fd = i;

    return fd;
}

int search_file(char *pathname)
{
    // 获取文件名
    char filename[MAX_FILENAME_LEN];
	Memset(filename, 0, MAX_FILENAME_LEN);
    // struct inode *dev_root;
    struct inode dev_root;
	Memset(&dev_root, 0, sizeof(struct inode));
    int res = strip_path(filename, pathname, &dev_root);

	if(res == -1){
		return -1;
	}
    //assert(res != -1);

    int dev_root_dir_size = dev_root.size;
    int dev_root_dir_sect = (dev_root_dir_size + SECTOR_SIZE) / SECTOR_SIZE;
    int dir_entry_num = dev_root.size / DIR_ENTRY_SIZE;

    // 数据区的第一个扇区地址
    struct super_block *sb = get_super_block();
    int nr_1st_data_sect = sb->data_1st_sect;
    int dev = ROOT_DEV;
    int m = 0;
    for (int i = 0; i < dev_root_dir_sect; i++)
    {
        RD_SECT(dev, nr_1st_data_sect + i);
        // 遍历扇区
        struct dir_entry *entry = (struct dir_entry *)fsbuf;
        for (int j = 0; j < SECTOR_SIZE / DIR_ENTRY_SIZE; j++, entry++)
        {
            if (++m > dir_entry_num)
            {
                break;
            }

            if (strcmp(filename, entry->filename) == 0)
            {
                return entry->nr_inode;
            }
        }
    }

    return -1;
}

int strip_path(char *filename, char *pathname, struct inode *dev_root)
{
    if (pathname == 0)
    {
        return -1;
    }

    char *t = filename;
    char *s = pathname;

    if (*s == '/')
    {
        s++;
    }

    //while (s) {
    while (*s)
    {
        if (*s == '/')
        {
            return -1;
        }

        *t = *s;
        t++;
        s++;
    }
    *t = 0;
    // 根目录的inode是一个全局变量，在哪里设置？就设置在global.h中吧。
    *dev_root = root;

    return 0;
}

// 移动到kernel的主体文件main.c中了。
//int strcmp(char *str1, char *str2) {
//    if (str1 == 0 || str2 == 0) {
//        return (str1 - str2);
//    }
//
//    char *p1 = str1;
//    char *p2 = str2;
//
//    for (; *p1 && *p2; p1++, p2++) {
//        if (*p1 != *p2) {
//            break;
//        }
//    }
//
//    return (*p1 - *p2);
//}

int get_inode(struct inode *inode, int nr_inode)
{
    if (nr_inode == 0)
    {
        return 0;
    }

    struct inode *p = 0;
    // 从缓冲中找到目标元素
    for (struct inode *q = &inode_table[0]; q <= &inode_table[INODE_TABLE_SIZE]; q++)
    {
        if (q->cnt > 0)
        {
            if (q->nr_inode == nr_inode)
            {
                *inode = *q;
                return q;
            }
        }
        else
        {
            p = q;
            break;
        }
    }

    // 在缓存中没有找到目标inode，从硬盘中读取。
    struct super_block *sb = get_super_block();
    int inode_size = INODE_SIZE;
    int pos = 1 + 1 + sb->cnt_of_inode_map_sect + sb->cnt_of_sector_map_sect +
              (nr_inode - 1) / (SECTOR_SIZE / inode_size);
    int dev = ROOT_DEV;
    RD_SECT(dev, pos);
    int offset = (nr_inode - 1) % (SECTOR_SIZE / inode_size);
    struct inode *new_inode = (struct inode *)(fsbuf + inode_size * offset);

    // 把数据放到缓存中
    //    p->nr_inode = nr_inode;
    //    p->size = new_inode->size;
    //    p->start_sect = new_inode->start_sect;
    //    p->type = new_inode->type;
    //    p->nr_sect = new_inode->nr_sect;

    //    p->nr_inode = nr_inode;
    //    p->size = new_inode->size;
    //    p->start_sect = new_inode->start_sect;
    //    p->type = new_inode->type;
    //    p->nr_sect = new_inode->nr_sect;

    *p = *new_inode;
    p->nr_inode = nr_inode;

    // inode的成员dev、cnt也需要放到缓存中吗？不放。理由是，理由不明，我不知道把dev、cnt
    // 放进去有什么用。
    p->dev = dev;

    //*inode = *new_inode;
    *inode = *p;

    return inode;
}

int create_file(struct inode *inode, char *pathname)
{
    // 获取文件名
    // todo 复制root中的内容，花了很多时间理解。还不能随心所欲使用指针。
    // struct inode *dev_root;
    struct inode dev_root;
    char filename[MAX_FILENAME_LEN];
    if (strip_path(filename, pathname, &dev_root) == -1)
    {
        return 0;
    }

    // 获取nr_inode
    int nr_inode = alloc_imap_bit();
    if (nr_inode == 0)
    {
        return 0;
    }

    // 获取文件的第一个扇区
    struct super_block *sb = get_super_block();
    int nr_sect_to_alloc = sb->nr_sect;
    int nr_start_sect = alloc_smap_bit(nr_inode, nr_sect_to_alloc);
    if (nr_start_sect == 0)
    {
        return 0;
    }

    // 获取inode
    struct inode pinode;
    int ret = new_inode(&pinode, nr_inode, nr_start_sect);
    if (ret == 0)
    {
        return 0;
    }

    // 创建根目录中的目录项
    struct dir_entry entry;
    int ret2 = new_dir_entry(&entry, &dev_root, filename, nr_inode);
    if (ret2 == 0)
    {
        return 0;
    }

    *inode = pinode;

    return inode;
}

int alloc_imap_bit()
{
    // 分区内的扇区分布:引导扇区(1) + 超级块(1) + inode-map(1) + sector-map(多少？)
    int pos = 1 + 1;
    //  dev的值从何处获得？
    int dev = ROOT_DEV;
    RD_SECT(dev, pos);

    int nr_inode = 0;
    for (int i = 0; i < SECTOR_SIZE; i++)
    {
        // 找到第一个值不是0xFF的字节。
        if (fsbuf[i] == 0xFF)
            continue;
        for (int j = 0; j < 8; j++)
        {
            // 找到字节中第一个值不是1的bit。
            // if (fsbuf[i] & (1 << j) == 1) continue;
            // todo 这个语句是错误的，耗费了不少时间才发现。
            //if ((fsbuf[i] & (1 << j)) == 1) continue;
            if ((fsbuf[i] >> j) & 1 == 1)
                continue;
            // 把这个bit的值设置成1。
            fsbuf[i] |= 1 << j;
            // 为新文件分配的bit。仍然会纠结于偏移量这种常识问题。
            nr_inode = 8 * i + j;
            // nr_inode = 8 * i + j + 1;
            // 修改了数据，应该写入硬盘。
            WT_SECT(dev, pos);
            return nr_inode;
        }
    }
}

// todo 在函数中，nr_sect_to_alloc的值被递减成负数。
// int alloc_smap_bit(int nr_inode, int nr_sect_to_alloc)
int alloc_smap_bit(int nr_inode, unsigned int nr_sect_to_alloc)
{
    // 思路：
    // 1. 从sector-map区域的第一个扇区开始，遍历N个扇区，遍历单位是扇区。
    // 2. 以字节为单位遍历每个扇区，一直找到值不是0xFF的那个字节A。
    // 3. 以bit为单位遍历字节A，一直找到值不是1的那个bit--B。
    // 4. 上面是遍历过程中第一阶段。找到B后，第一阶段的任务完成，进入第二阶段。
    // 5. 第二阶段的任务是：从B开始，把M个bit设置成1；然后，把修改过后的数据写入硬盘。
    // 6. 写硬盘的单位是扇区。只有在找到B的情况下才写硬盘。

    assert(nr_sect_to_alloc > 0);

    struct super_block *sb = get_super_block();
    // 每个文件占用smap的多少个扇区。
    // int nr_sect_to_alloc = sb->nr_sect;
    int nr_smap_sect = sb->cnt_of_sector_map_sect;
    // smap的第一个扇区
    int nr_sect_blk0 = 1 + 1 + sb->cnt_of_inode_map_sect;
    // smap中第一个值为0的bit的序号。
    int nr_free_smap_bit = 0;

    int dev = ROOT_DEV;
	int pos;
    for (int i = 0; i < nr_smap_sect; i++)
    {
        pos = nr_sect_blk0 + i;
        RD_SECT(dev, pos);
        for (int j = 0; j < SECTOR_SIZE; j++)
        {
            int k = 0;
            if (nr_free_smap_bit == 0)
            {
                if (fsbuf[j] == 0xFF)
                    continue;
                for (; k < 8; k++)
                {
                    // if (fsbuf[j] & (1 << k) == 1) continue;
                    if ((fsbuf[j] >> k) & 1 == 1)
                        continue;
                    nr_free_smap_bit = (i * SECTOR_SIZE + j) * 8 + k;
                    break;
                }
            }

            // 设置bit的值
            for (; nr_sect_to_alloc > 0 &&  k < 8; k++)
            {
                //fsbuf[j] &= 1 << k;
//                fsbuf[j] |= 1 << k;
		// todo 这种写法，问题非常大!当nr_sect_to_alloc是int类型时，巧妙地跳过了0和0的比较。
		// 究竟是比较nr_sect_to_alloc和0还是比较--nr_sect_to_alloc和0？
//                if (--nr_sect_to_alloc == 0)
//                {
//                    break;
//                }
//		nr_sect_to_alloc--;
		if(nr_sect_to_alloc == 0){
			break;
		}
		
                fsbuf[j] |= 1 << k;
		nr_sect_to_alloc--;
            }
        }
        // 写入硬盘
        // 必须放在这里，而不能放到循环外面。这是我运行代码得出的结论。
        // 并没有完全理解为什么会这样。放在外面，有时会导致后面的文件覆盖前面文件的smap记录。
        // 我的猜想是：有的文件的smap记录跨越两个扇区。放在外面，只更新了一个扇区。
        if (nr_free_smap_bit)
        {
            WT_SECT(dev, pos);
        }

	// todo 神奇！当nr_sect_to_alloc的数据类型是int时，执行到这里，nr_sect_to_alloc的值是负数。
        if (nr_sect_to_alloc == 0)
        {
            break;
        }
    }
        // 写入硬盘
//        if (nr_free_smap_bit)
//        {
//            WT_SECT(dev, pos);
//        }

    // todo 减去1，有点费解。
    // todo 我不怎么理解是否要减去1。不减去1，结果不正确。
    return (nr_free_smap_bit - 1 + sb->data_1st_sect);
//    return (nr_free_smap_bit + sb->data_1st_sect);
}

int new_inode(struct inode *inode, int nr_inode, int nr_start_sect)
{
    struct inode new_inode;
    int ret = get_inode(&new_inode, nr_inode);
    if (ret == 0)
    {
        return 0;
    }

    new_inode.start_sect = nr_start_sect;
    new_inode.nr_sect = CNT_OF_FILE_SECT;
    new_inode.size = 0;
    //new_inode.cnt = 1;
    new_inode.type = FILE_TYPE_TEXT;
    new_inode.nr_inode = nr_inode;

    // 同步到硬盘
    sync_inode(&new_inode);

    new_inode.cnt = 1;
    // 同步到缓存中
    // todo 后期优化
    //	struct inode *p = inode_table[INODE_TABLE_SIZE];
    int i;
    for (i = 0; i < INODE_TABLE_SIZE; i++)
    {
        if (inode_table[i].nr_inode == nr_inode)
        {
            break;
        }
    }

    inode_table[i] = new_inode;

    *inode = new_inode;
}

int new_dir_entry(struct dir_entry *dir_entry, struct inode *dir_root, char *filename, int nr_inode)
{
    // 当前有多少个目录项
    int dir_entry_size = DIR_ENTRY_SIZE;
    // 下面两种运算，绝对不等价。我怎么连这样的错误也犯！
    // int nr_entry = dir_root->size >> dir_entry_size;
    int nr_entry = dir_root->size / dir_entry_size;
    // 目录区域最多能存储max_nr_entry个目录项
    // int max_nr_entry = dir_root->nr_sect >> dir_entry_size;
    int max_nr_entry = dir_root->nr_sect / dir_entry_size;
    // 第一个目录项的扇区号
    struct super_block *sb = get_super_block();
    int nr_dir_entry_blk0 = sb->data_1st_sect;
    // 遍历扇区的界限值
    int nr_sector_max = (dir_root->nr_sect + SECTOR_SIZE) / SECTOR_SIZE;

    // 遍历扇区
    struct dir_entry *new_pde = 0;
    struct dir_entry *pde;
    // 统计遍历过的目录项的数量
    int m = 0;
    int i;

    // todo 暂时这样处理dev。
    int dev = ROOT_DEV;
    for (i = 0; i < nr_sector_max; i++)
    {
        RD_SECT(dev, nr_dir_entry_blk0 + i);
        // 在已经使用过的目录项中寻找空闲目录项
        pde = (struct dir_entry *)fsbuf;
        for (int j = 0; j < SECTOR_SIZE / dir_entry_size; j++, pde++)
        {
            if (++m > nr_entry)
            {
                break;
            }

            if (pde->nr_inode == 0)
            {
                new_pde = pde;
                break;
            }
        }

        if (m > nr_entry || new_pde)
        {
            break;
        }
    }

    // 当根目录区域的所有根目录都非空闲时
    if (nr_entry == max_nr_entry)
    {
        // 根目录区域已经满了
        return 0;
    }

    int is_add = 0;
    // 新增目录项
    if (new_pde == 0)
    {
        new_pde = pde;
        dir_root->size += dir_entry_size;
        is_add = 1;
        //sync_inode(dir_root);
    }

    // 设置新目录项的值
    new_pde->nr_inode = nr_inode;
    Strcpy(new_pde->filename, filename);
    *dir_entry = *new_pde;

    // 写入硬盘
    WT_SECT(dev, nr_dir_entry_blk0 + i);

    // 新增目录项
    //    if (new_pde == 0) {
    //        new_pde = pde;
    //        dir_root->size += dir_entry_size;
    //        sync_inode(dir_root);
    //    }
    if (is_add)
    {
        root = *dir_root;
        sync_inode(dir_root);
    }
    //*dir_entry = *new_pde;

    return dir_entry;
}

// 函数也不好确定。我不了解所有情况，所以不好确定函数。
void do_unlink(char *filename)
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
    if (strcmp("/", filename) == 0)
    {
        panic("Can not delete the root dir");
    }

    int nr_inode = search_file(filename);
    if (nr_inode == -1)
    {
        panic("The file does not exist\n");
    }
    struct inode inode;
    int ret = get_inode(&inode, nr_inode);
    if (ret == 0)
    {
        panic("The file does not exist\n");
    }

    // 被其他进程使用的文件不能删除
    if (inode.cnt > 0)
    {
        panic("Can not delete the file that is using by other process.");
    }

    // 不能删除终端文件。
    // todo 暂不实现。

    // 清除imap
    // 主要思路：找到目标bit所在扇区、所在字节、目标bit，然后用位运算设置值。
    int imap_bit_idx = inode.nr_inode;
    int imap_byte_idx = imap_bit_idx / 8;
    // 目前，imap只占用一个扇区，本不需要计算。但imap不会总是被设计成一个扇区，还是不写固定值了。
    int imap_sector_idx = imap_byte_idx / SECTOR_SIZE;
    // bit在目标字节中的偏移量。
    int imap_offset = imap_bit_idx % 8;
    // 读取目标扇区
    // 引导扇区 + super block + 目标扇区
    int dev = ROOT_DEV;
    RD_SECT(dev, 1 + 1 + imap_sector_idx);
    fsbuf[imap_byte_idx] &= ~(1 << imap_offset);
    WT_SECT(dev, 1 + 1 + imap_sector_idx);

    // 清除smap
    // 主要思路：
    // 1. 本文件的smap分为三段处理。这三段分别是：第一个字节、最后一个字节、中间字节。
    // 2. 中间字节用字节为单位，把每个字节的值设置成0，按扇区为单位写入硬盘。
    struct super_block *sb = get_super_block();
    int smap_bit_idx = inode.start_sect - sb->data_1st_sect + 1;
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

    for (; i < smap_byte_left; i++, smap_bit_left -= 8)
    {
        if (i == SECTOR_SIZE)
        {
            i = 0;
            WT_SECT(dev, s);
            RD_SECT(dev, s++);
        }
        fsbuf[i] = 0;
    }

    if (i == SECTOR_SIZE)
    {
        i = 0;
        WT_SECT(dev, s);
        RD_SECT(dev, s++);
    }

    // 处理最后一个字节
    fsbuf[i] &= (~0) << smap_bit_left;
    WT_SECT(dev, s);

    // 清除inode，最简单
    inode.start_sect = 0;
    inode.size = 0;
    inode.nr_sect = 0;
    sync_inode(&inode);
    put_inode(&inode);

    // 清除目录项。又是个让我费解的问题。繁琐。
    // 主要思路：
    // 1. 和新增目录项很相似。遍历算法相似。
    // 2. 删除的目录项是最后一个时改变根目录的大小，否则，不改变。
    // 根目录的第一个扇区
    int root_dir_sect_blk0 = sb->data_1st_sect;
    struct inode *dev_root = &root;
    // 根目录的大小
    int root_dir_size = dev_root->size;
    // 根目录占用的扇区
    int root_dir_nr_sect = dev_root->nr_sect;
    // 根目录中的目录项的数量
    int nr_dir_entry = root_dir_size / DIR_ENTRY_SIZE;
    int flag = 0;
    // 纠结m的值。m是对遍历过的目录项的数量的统计。
    int m = 0;
    int new_root_dir_size = 0;
    int j;

    int n = 0;
    for (; n < root_dir_nr_sect; n++)
    {
        RD_SECT(dev, root_dir_sect_blk0 + n);
        struct dir_entry *pde = (struct dir_entry *)fsbuf;
        for (j = 0; j < root_dir_nr_sect; j++, pde++)
        {
            if (++m > nr_dir_entry)
            {
                break;
            }

            new_root_dir_size += DIR_ENTRY_SIZE;

            if (strcmp(pde->filename, filename) == 0)
            {
                flag = 1;
                Memset(pde, 0, DIR_ENTRY_SIZE);
                break;
            }
        }

        if (m > nr_dir_entry || flag)
        {
            break;
        }
    }

    if (m == nr_dir_entry)
    {
        dev_root->size = new_root_dir_size;
        sync_inode(dev_root);
    }

    // 修改了根目录才写硬盘。
    if (flag)
    {
        WT_SECT(dev, root_dir_sect_blk0 + i);
    }
}

int do_rdwt(Message *msg)
{
	////Printf("enter fs do_rdwt\n");
    // 这个函数的主要思路：
    // 1. 先读取N个扇区。
    // 2. 读，从N个扇区中把数据复制到buf中。
    // 3. 写，从buf把数据复制到N个扇区中；然后，把N个扇区写入硬盘。
    // 上面的表述并不完全正确。
    // 有哪些难点？
    // 1. 一次读取多少个扇区？
    // 2. 每次复制多少数据？
    // 从文件描述符中获取操作文件时的位置。 int pos = 0;
    //
    // 所有需要的数据都从消息中获取，把函数的参数确定为只需要一个消息。

    // msg的成员定义在 ./include/sys/type.h
    // 操作类型
    int hd_operate_type = msg->TYPE;
    // 要操作的数据的长度：读len字节；写入len字节。
    //int len = msg->BUF_LEN;
    int len = msg->CNT;
    // 设备号
    // todo 设备号有没有用？
    int dev = msg->DEV;
    // 调用文件系统的进程PID。
    int sender = msg->source;
    // 把数据读取到buf中；把buf中的数据写入硬盘。
    unsigned int buf = msg->BUF;
    // todo 下面获取inode的方法正确吗？
    int fd = msg->FD;
	// todo 大错特错！
//    int pos = msg->POS;
    //struct inode *inode = proc_table[sender].filp[fd]->inode;
    // todo 在任务进程中直接这样获取proc_table是否合适？
    Proc *sender_thread = pid2proc(sender);
    struct file_desc *file_desc = sender_thread->filp[fd];
    int nr_inode = file_desc->nr_inode;
	int source = msg->source;

    struct inode pinode;
    int ret = get_inode(&pinode, nr_inode);
    if (ret == 0)
    {
        panic("file doesn't\n");
    }

    //	assert(pinode.nr_inode == 5);

    // 文件大小
    int file_size = pinode.size;
	// todo 有问题吗？
//	int pos = pinode.start_sect;
//	int pos = pinode.start_sect + file_desc->pos;
//	int pos = 0;
	int pos = file_desc->pos;
    //assert(len == 6);
    //	assert(fd == 0);
    assert(hd_operate_type == WRITE || hd_operate_type == READ);

	//Printf("fs pinode.type = %d\n", pinode.type);
    // 文件是IS_CHAR_SPECIAL

//	FILE_TYPE_SPECIAL_CHAR
    //if (pinode.type == IS_CHAR_SPECIAL)
    if (pinode.type == FILE_TYPE_SPECIAL_CHAR)
    {
        // 请求TTY
        // 如果type不是READ也不是WRITE，怎么处理？
        int type;
        if (hd_operate_type == READ)
        {
            type = DEV_READ;
        }
        else if (hd_operate_type == WRITE)
        {
            type = DEV_WRITE;
        }

        msg->TYPE = type;
		// source是通过文件系统读写TTY的用户进程的PID。
        msg->PROCNR = source;
        // todo 假设 BUF、BUF_LEN 已经在用户进程传递给本进程的消息体中了。
        // 怎么确定TTY的pid？在sys_task_table中查看，TASK_TTY是第0个元素。
        send_rec(BOTH, msg, TASK_TTY);

		if(msg->TYPE == SUPEND_PROC){
			// 让用户进程继续阻塞，文件系统当然不能阻塞。
		}

		if(msg->TYPE == RESUME_PROC){
			// 唤醒用户进程
			send_rec(SEND, msg, source);
		}

		if(msg->TYPE == SYSCALL_RET){
			send_rec(SEND, msg, source);
		}

        return 0;
    }


	// 读写了多少数据
	if (hd_operate_type == READ && pos == file_size){
	// 为什么会写出这种愚蠢的代码？
	//	return 0;
	}

	
	if (hd_operate_type == WRITE && pos == pinode.nr_sect * SECTOR_SIZE){
		return 0;
	}

    // 文件是普通文件，即非终端文件
    // 文件操作的结束位置
    // pos的参照坐标是0，是相对于文件的初始位置的字节偏移量。
    int pos_end;
    if (hd_operate_type == READ)
    {
		pos = 0;
        pos_end = MIN(pos + len, file_size);
    }
    else
    {

        pos_end = MIN(pos + len, pinode.nr_sect * SECTOR_SIZE);
    }

    // 字节偏移量
    // 为什么没有位偏移量？因为，读取数据的单位是字节。
    int offset = pos % SECTOR_SIZE;

    int start_sect = pinode.start_sect + pos / SECTOR_SIZE;
    int start_end = pinode.start_sect + pos_end / SECTOR_SIZE;

    int chunk = MIN(start_end - start_sect + 1, FSBUF_SIZE);

    // 获取buf的物理地址
    int byte_left = len;
    int byte_wt = 0;
    // 计算buf的线性地址
    // 怎么确定sender？
    Proc *sender_proc = pid2proc(msg->source);
    int buf_line_addr = alloc_virtual_memory(buf, len);

    for (int i = start_sect; i <= start_end && byte_left; i += chunk)
    {
        int byte = MIN(byte_left, chunk * SECTOR_SIZE - offset);
        // device是什么？是分区号。
        // 是安装了文件系统的那个分区的分区号吗？是的。
        // 耗费了非常多时间才想明白这个device的值是多少。
        // todo hd2a 定义在 hd.c中，如何才能在这个文件中使用hd.h中的数据呢？
        int device = ROOT_DEV;

        if (hd_operate_type == READ)
        {
        	rd_wt(i, device, phy_fsbuf, SECTOR_SIZE * chunk, READ);
            // 把数据从fsbuf中复制到buf中
            phycopy(buf_line_addr + byte_wt, fsbuf + offset, byte);
            // 文件的大小不会改变
        }
        else
        {
            // 把数据从buf中复制到fsbuf中
            phycopy(fsbuf + offset, buf_line_addr + byte_wt, byte);
            // 把fsbuf中的数据写入硬盘
            rd_wt(i, device, phy_fsbuf, SECTOR_SIZE * chunk, WRITE);
            // 文件的大小会改变
        }
        byte_left -= byte;
        byte_wt += byte;
        // offset的处理很费劲。
        offset = 0;
    }

	file_desc->pos += len;
    // 呵呵，这个常识，还让费解。悲伤！
    if (pos + len > pinode.size)
    {
        pinode.size = pos + len;
	//file_desc->pos += len;
        sync_inode(&pinode);
    }
	// 返回值是已经写入或读取的数据的长度。
	return byte_wt;
}

void sync_inode(struct inode *inode)
{
	// todo 更新缓存中的inode。暂时没有想出方法。我不愿使用遍历数组的方式来更新。
	// todo 想不到好方法，先使用遍历数组的方式来实现吧。
	for(int i = 0; i < INODE_TABLE_SIZE ;i++){
		if(inode_table[i].nr_inode == inode->nr_inode){
			inode_table[i] = *inode;
			break;
		}
	}

    // 本函数不负责处理目标inode是否存在于硬盘上，只负责更新数据到硬盘上。
    // 主要思路：从硬盘中读取包含目标inode的扇区，更新fsbuf的inode后，把fsbuf写入硬盘。
    // int inode_size = sizeof(struct inode_size);
    int inode_size = INODE_SIZE; // INODE_SIZE;
    int nr_inode = inode->nr_inode;
    // inode的数量的偏移量
    int inode_idx = (nr_inode - 1) % (SECTOR_SIZE / inode_size);
    // 扇区偏移量
    int sect_idx = (nr_inode - 1) / (SECTOR_SIZE / inode_size);
    // 读取一个扇区
    int dev = inode->dev;
    struct super_block *sb = get_super_block();
    int pos = 1 + 1 + sb->cnt_of_inode_map_sect + sb->cnt_of_sector_map_sect + sect_idx;
    RD_SECT(dev, pos);

    struct inode *new_inode = (struct inode *)fsbuf;
    Memcpy(new_inode, inode, inode_size);

    WT_SECT(dev, pos);
}

void put_inode(struct inode *inode)
{
    assert(inode->cnt > 0);
    inode->cnt--;
}

int do_close(int fd)
{
    // 主要思路：
    // 1. 关闭文件，实质是：减少inode的引用数、减少文件描述符的引用数、
    // 	把进程表中对应的flip[i]设置成0。
    // 2. 详细说明“减少文件描述符的引用数”。当一个文件描述符的引用数是0时，把这个文件描述符
    // 	设置成不指向任何inode。

    // todo 这里的逻辑似乎有问题，暂时不管。
    //    put_inode(pcaller->filp[fd]->inode);
    if (--pcaller->filp[fd]->fd_cnt == 0)
    {
        pcaller->filp[fd]->nr_inode = 0;
    }
    pcaller->filp[fd] = 0;

    return 0;
}

struct super_block *get_super_block()
{
    RD_SECT(ROOT_DEV, 1);
    *super_block_buf = *((struct super_block *)fsbuf);
    return super_block_buf;
}
