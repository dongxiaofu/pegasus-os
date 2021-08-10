#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"
#include "hd.h"

struct hd_info hd_info[1];


// 等待硬盘准备好传输数据
void wait_for();

// 等待硬盘中断发生
void interrupt_wait();

// 读写硬盘
void hd_rdwt(Message *msg);

void init_hd();

// 向硬盘发送命令
// 纠结，本函数的参数怎么设置？
// 三个参数分别是：硬盘编号、要执行的命令、lba地址、要读取的扇区的数量。
// 无需纠结。根据需要设置参数就行，不需要受别人代码的束缚。
// void hd_cmd_out(unsigned char driver_number, int command, unsigned int lba, unsigned sector_count);
void hd_cmd_out(struct hd_cmd *cmd);

// 打印硬盘参数
void print_hdinfo(unsigned short *hdinfo);

// 获取硬盘参数
void hd_identify(int driver_number);

// 打印分区表项
void print_dpt_entry(struct partition_table_entry *entry);

// 获取分区表数据
// 纠结这个函数的参数。暂时无法确定，边写边看吧。
void get_partition_table(int device, int lba, struct partition_table_entry *partition_table);

// 把分区表按照主分区和逻辑分区分类然后存储到对应的硬盘中
void partition(int device, unsigned char part_type);

// 打开硬盘
void hd_open();

// 获取分区的扇区数量
int get_hd_ioctl(int device);

// 硬盘驱动
void TaskHD() {
    Printf("%s\n", "HD driver is running!");
    // 初始硬盘
    init_hd();

    while (1) {
        hd_handle();
    }
}

// 初始硬盘
void init_hd() {
    // 获取硬盘数量
    char *buf = (char *) (0x475);
    Printf("Num:%d\n", *buf);
    // 打开8259A的从片级联设置
    enable_8259A_casecade_irq();
    // 打开硬盘中断
    enable_8259A_slave_winchester_irq();
}

void hd_handle() {
    Printf("%s\n", "HD handle is running!");
    Message msg;
    send_rec(RECEIVE, &msg, ANY);
    unsigned int type = msg.type;
    unsigned int source = msg.source;

    switch (type) {
        case OPEN:
            hd_open();
            Printf("%s:%d\n", "Open HD", source);
            break;
        case READ:
        case WRITE:
            hd_rdwt(&msg);
            Printf("%s:%d\n", "RD/WT HD", source);
            break;
        case GET_HD_IOCTL:
            get_hd_ioctl(0);
            Printf("%s:%d\n", "GET_HD_IOCTL", source);
            break;
        default:
            Printf("%s\n", "Unknown Operation");
            break;
    }

    msg.source = 2;
    // ipc存在问题，使用频繁，会导致IPC异常，所以，我暂时注释主句。
    send_rec(SEND, &msg, source);
}


// void hd_cmd_out(unsigned char driver_number, int command, unsigned int lba, unsigned sector_count)
void hd_cmd_out(struct hd_cmd *cmd) {
    while (in_byte(0x1F7) & 0x80 != 0) {
        int t = in_byte(0x1F7);
        Printf("ticks:%d\n", t);
    }
    int t = in_byte(0x1F7);
    Printf("t:%d\n", t);
    // 向Control Block Register写入数据
    out_byte(PRIMARY_DEVICE_CONTROL, 0);
    Printf("tt:%d\n", 23);
    // 向Command Block Registers写入数据
    out_byte(PRIMARY_CMD_FEATURES_REGISTER, cmd->feature);
    //Printf("tt:%d\n", 23);
    out_byte(PRIMARY_CMD_SECTOR_COUNT_REGISTER, cmd->sector_count);
    //Printf("tt:%d\n", 23);
    out_byte(PRIMARY_CMD_LBA_LOW_REGISTER, cmd->lba_low);
    //Printf("tt:%d\n", 23);
    out_byte(PRIMARY_CMD_LBA_MID_REGISTER, cmd->lba_mid);
    Printf("tt:%d\n", 23);
    out_byte(PRIMARY_CMD_LBA_HIGH_REGISTER, cmd->lba_high);
    Printf("tt:%d\n", 23);
    out_byte(PRIMARY_CMD_DEVICE_REGISTER, cmd->device);
    Printf("tt:%d\n", 23);
    out_byte(PRIMARY_CMD_COMMAND_REGISTER, cmd->command);
    Printf("tt:%d\n", 23);
}

void hd_identify(int driver_number) {
    struct hd_cmd cmd;
    cmd.feature = 0;//64;
    cmd.sector_count = 1;//0;
    cmd.lba_low = 0;//99;
    cmd.lba_mid = 0;//22;
    cmd.lba_high = 0;//18;
    cmd.device = MAKE_DEVICE_REGISTER(driver_number, 0);
    //	cmd.feature = 64;
    //	cmd.sector_count = 0;
    //	cmd.lba_low = 99;
    //	cmd.lba_mid = 22;
    //	cmd.lba_high = 18;
    //	cmd.device = 160;
    cmd.command = ATA_IDENTIFY;
    hd_cmd_out(&cmd);

    // 延迟一会。必须延迟一会。
    // 频繁使用IPC，所以不能使用。
    // milli_delay(5000);
    delay(1); //导致invalid opcode
    Printf("%s\n", "delay over");
    //delay(10);
    // 从Command Block Registers的data寄存器读取数据
    char buf[512 * 2];
    Memset(buf, 0, 1024);
    // size应该如何确定？
    read_port(PRIMARY_CMD_DATA_REGISTER, buf, 512);

    // 这句会导致invalid opcode，为什么？实在太令人费解了！
    //unsigned short *hdinfo = (unsigned short *)buf;
    print_hdinfo((unsigned short *) buf);

    Printf("%s\n", "hd identify");
    Printf("buf:%s\n", buf);
}

void print_hdinfo(unsigned short *hdinfo) {
    // 把short类型的硬盘参数转换为char类型的参数

    // 用一个循环读取硬盘参数中两个区间的数据。这两个区间分别是：10~19和27~46。单位是字。
    struct hdinfo_meta header[2] = {
            {10, 20, "Serial Number"},
            {27, 40, "Model Number"}
    };
    // 翻译60~61区间的数据，用户可用的最大扇区数
    for (int i = 0; i < 2; i++) {
        char s[40];
        int j = 0;
        char *p = (char *) (&hdinfo[header[i].idx]);
        for (; j < header[i].len / 2; j++) {
            s[j + 1] = *p++;
            s[j] = *p++;
        }
        s[j] = 0;
        Printf("%s:%s\n", header[i].name, s);
    }
    // 49，是否支持LBA
    unsigned short capabilities = hdinfo[49];
    unsigned char support_lba = (capabilities >> 8) && (0x01);
    //char capabilitie_lba[4] = (support_lba == 1 ? "Yes": "No");
    char capabilitie_lba[4];
    char yes_str[4] = "Yes";
    char no_str[3] = "No";
    if (support_lba == 1) {
        Strcpy(capabilitie_lba, yes_str);
    } else {
        Strcpy(capabilitie_lba, no_str);
    }
    Printf("Support LBA:%s\n", capabilitie_lba);
    // 用户可用最大扇区数
    int sector_count = hdinfo[61] << 16 + hdinfo[60];
    Printf("Sector counter:%d\n", sector_count);
    Printf("Size(MB):%d\n", sector_count * 512 / 1024 * 1024);
    // 83，是否支持LBA48
}

void print_dpt_entry(struct partition_table_entry *entry) {
    // Printf("\n%s\n", "========================Start=================");
    //Printf("LBA:%d\n", entry->start_sector_lba);
    //Printf("Sector Count:%d\n", entry->nr_sector);
    Printf("System ID:%d\n", entry->system_id);
    //Printf("Status:%d\n", entry->status);
    //Printf("\n%s\n", "========================end=================");
}

// 1. 之前不知道本函数的参数是什么，写着写着，自然就知道了。
// 2. 先想后写是为了写得更顺畅。想不下去的时候，可以边写边想。
// 3. 有的人，要求在写之前想好所有细节。
// 4. 那其实是要求先写一次再想。
void get_partition_table(int driver, int lba, struct partition_table_entry *partition_table) {
    struct hd_cmd cmd;
    cmd.feature = 0;
    cmd.sector_count = 1;
    cmd.lba_low = lba & 0xFF;
    cmd.lba_mid = (lba >> 8) & 0xFF;
    cmd.lba_high = (lba >> 16) & 0xFF;
    cmd.device = MAKE_DEVICE_REGISTER(driver, lba);
    cmd.command = ATA_READ;
    hd_cmd_out(&cmd);

    delay(500);
    char buf[1024];
    Memset(buf, 0, 1024);
    read_port(PRIMARY_CMD_DATA_REGISTER, buf, 512);

    // 获取分区表
    // char partition_table[64];
    Memcpy(partition_table, buf + PARTITION_TABLE_OFFSET, 64);
    // Strcpy(partition_table, buf + PARTITION_TABLE_OFFSET);
}

void partition(int device, unsigned char part_type) {
    int driver = DR_OF_DEV(device);

    //struct partition_table_entry partition_table[64];
    struct partition_table_entry partition_table[5];
    if (part_type == PART_PRIMARY) {
        // 获取分区表
        //struct partition_table_entry partition_table[4];
        // struct partition_table_entry partition_table[64];
        // int lba = 0;	// 硬盘的MBR的初始地址的lba是0
        Memset(partition_table, 0, 5 * sizeof(struct partition_table_entry));
        get_partition_table(driver, 0, partition_table);
        // 遍历分区表
        for (int i = 0; i < NR_MBR_DPT_ENTRY; i++) {
            // 打印分区表项
            // print_dpt_entry(&partition_table[i]);
            // 想不出更好的名称。
            int nr_part = 1 + i;
            hd_info[driver].primary_part[nr_part].base = partition_table[i].start_sector_lba;
            hd_info[driver].primary_part[nr_part].size = partition_table[i].nr_sector;

            if (partition_table[i].system_id == PARTITION_SYSTEM_ID_EXTENDED) {
                partition(device + nr_part, PART_EXTENDED);
            }
        }

    } else if (part_type == PART_EXTENDED) {
        int j = device % 5;
        int lba_base = hd_info[driver].primary_part[j].base;
        int lba = lba_base;
        // 取值分别是：0，16，32，48
        int nr_1st = (j - 1) * 16;
        for (int i = 0; i < NR_HD_EXTEND_PARTITION; i++) {
            //struct partition_table_entry partition_table[4];
            Memset(partition_table, 0, 5 * sizeof(struct partition_table_entry));
            get_partition_table(driver, lba, partition_table);
            print_dpt_entry(&partition_table[0]);

            int index = nr_1st + i;
            hd_info[driver].logical_part[index].base = lba + partition_table[0].start_sector_lba;
            hd_info[driver].logical_part[index].size = partition_table[0].nr_sector;
            // 在什么情况下终止循环？
            // 没有下一个子扩展分区？
            if (partition_table[1].system_id == PARTITION_SYSTEM_ID_NO_PART) {
                break;
            }
            lba = lba_base + partition_table[1].start_sector_lba;
        }
    } else {
        Printf("%s\n", "Do nothing");
    }
}

void hd_open() {
    int driver = DR_OF_DEV(0);
    //struct hdinfo hd_info;
    hd_info[driver].open_cnt++;
    //hd_identify(0);
    partition(0, PART_PRIMARY);
    get_hd_ioctl(2);
    Printf("%s\n", "Over");
}

int get_hd_ioctl(int device) {
    int driver = DR_OF_DEV(device);
    int geometry = hd_info[driver].primary_part[device].size;
    Printf("geometry:%d\n", geometry);
    return geometry;
}


void wait_for() {
    delay(4);
}

void interrupt_wait() {
    delay(4);
}


void hd_rdwt(Message *msg) {
    // 从msg中获取硬盘操作的位置pos
    unsigned long long pos = msg->POSITION;
    // 计算pos在安装文件系统的分区的LBA地址
    int device = msg->DEVICE;
    int driver = DR_OF_DEV(device);
    // 用次设备号计算出硬盘分区数组中对应的索引
    int logical_idx = IDX_OF_LOGICAL(device);
    int nr_sects = pos >> SECTOR_SIZE_SHIFT;
    nr_sects += device < NR_PRIM_MAX ? \
            hd_info[driver].primary_part[device].base : \
            hd_info[driver].logical_part[logical_idx].base;
    // 读写硬盘
    int len = msg->LEN;
    int bytes_left = len;
    // 从msg中获取内存地址。
    // 这个内存地址存储了要写入硬盘的数据，	或用来存储从硬盘中读取到的数据。
    char *hdbuf = msg->BUF;
    int source = msg->source;
    // 计算出hdbuf的物理地址。
    char *phy_hdbuf = v2l(source, hdbuf);

    int type = msg->type;
    assert(type == READ || type == WRITE);
    // 执行hd_cmd_out，指挥硬盘
    struct hd_cmd cmd;
    cmd.feature = 0;
    cmd.sector_count = 1;
    cmd.lba_low = nr_sects & 0xFF;
    cmd.lba_mid = (nr_sects >> 8) & 0xFF;
    cmd.lba_high = (nr_sects >> 16) & 0xFF;
    cmd.device = MAKE_DEVICE_REGISTER(nr_sects, driver);
    cmd.command = type == READ ? ATA_READ : ATA_WRITE;
    hd_cmd_out(&cmd);

    while (bytes_left) {
        int bytes = MIN(SECTOR_SIZE, len);
        if (type == READ) {
            // 读
            interrupt_wait();
            // 从REG_DATA端口读取数据存储到phy_hdbuf中
            read_port(PRIMARY_CMD_DATA_REGISTER, phy_hdbuf, SECTOR_SIZE);
        } else if (type == WRITE) {
            // 写
            wait_for();
            // 把数据从phy_hdbuf写入到REG_DATA端口
            write_port(PRIMARY_CMD_DATA_REGISTER, phy_hdbuf, SECTOR_SIZE);
            interrupt_wait();
        }
        bytes_left -= SECTOR_SIZE;
        phy_hdbuf += SECTOR_SIZE;
    }
}
