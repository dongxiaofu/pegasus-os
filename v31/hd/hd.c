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
// 硬盘驱动
void TaskHD()
{
	Printf("%s\n", "HD driver is running!");
	// 初始硬盘
	init_hd();

	while(1){
		hd_handle();
	}
}

// 初始硬盘
void init_hd()
{
	// 获取硬盘数量
	char *buf = (char *)(0x475);
	Printf("Num:%d\n", *buf);
	// 打开8259A的从片级联设置
	enable_8259A_casecade_irq();
	// 打开硬盘中断
	enable_8259A_slave_winchester_irq();
}

void hd_handle()
{
	Printf("%s\n", "HD handle is running!");
	Message msg;	
	send_rec(RECEIVE, &msg, ANY);
	unsigned int type = msg.type;
	unsigned int source = msg.source;

	switch(type){
		case HD_DEV_OPEN:
			Printf("%s:%d\n", "Open HD", source);
			hd_identify(0);
			break;
		default:
			Printf("%s\n", "Unknown Operation");
			break;
	}

	msg.source = 2;
	// ipc存在问题，使用频繁，会导致IPC异常，所以，我暂时注释主句。
	//send_rec(SEND, &msg, source);
}


// void hd_cmd_out(unsigned char driver_number, int command, unsigned int lba, unsigned sector_count)
void hd_cmd_out(struct hd_cmd *cmd)
{
	while(in_byte(0x1F7) & 0x80 != 0){
		int t = in_byte(0x1F7);
		Printf("ticks:%d\n", t);
	}
		int t = in_byte(0x1F7);
		Printf("t:%d\n", t);
	// 向Control Block Register写入数据
	out_byte(PRIMARY_DEVICE_CONTROL, 0);	
	// 向Command Block Registers写入数据
	out_byte(PRIMARY_CMD_FEATURES_REGISTER, cmd->feature);
	out_byte(PRIMARY_CMD_SECTOR_COUNT_REGISTER, cmd->sector_count);
	out_byte(PRIMARY_CMD_LBA_LOW_REGISTER, cmd->lba_low);
	out_byte(PRIMARY_CMD_LBA_MID_REGISTER, cmd->lba_mid);
	out_byte(PRIMARY_CMD_LBA_HIGH_REGISTER, cmd->lba_high);
	out_byte(PRIMARY_CMD_DEVICE_REGISTER, cmd->device);
	out_byte(PRIMARY_CMD_COMMAND_REGISTER, cmd->command);	
}

void hd_identify(int driver_number)
{
	struct hd_cmd cmd;
	cmd.feature = 0;//64;
	cmd.sector_count = 1;//0;
	cmd.lba_low = 0;//99;
	cmd.lba_mid = 0;//22;
	cmd.lba_high = 0;//18;
	cmd.device = MAKE_DEVICE_REGISTER(0, driver_number);
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
	delay(250); //导致invalid opcode
	Printf("%s\n", "delay over");
	//delay(10);
	// 从Command Block Registers的data寄存器读取数据
	char buf[512*2];
	Memset(buf, 0, 1024);
	// size应该如何确定？
	read_port(PRIMARY_CMD_DATA_REGISTER, buf,512); 	
	
	// 这句会导致invalid opcode，为什么？实在太令人费解了！
	//unsigned short *hdinfo = (unsigned short *)buf;	
	print_hdinfo((unsigned short *)buf);

	Printf("%s\n", "hd identify");
	Printf("buf:%s\n", buf);
}

void print_hdinfo(unsigned short *hdinfo)
{
	// 把short类型的硬盘参数转换为char类型的参数
	
	// 用一个循环读取硬盘参数中两个区间的数据。这两个区间分别是：10~19和27~46。单位是字。
	struct hdinfo_meta header[2] = {
		{10, 20, "Serial Number"},
		{27, 40, "Model Number"}
	};
	// 翻译60~61区间的数据，用户可用的最大扇区数
	for(int i = 0; i < 2; i++){
		char s[40];
		int j = 0;
		char *p = (char *)(&hdinfo[header[i].idx]);
		for(; j < header[i].len / 2; j++){
			s[j+1] = *p++;
			s[j] = *p++;
		}	
		s[j] = 0;
		Printf("%s:%s\n", header[i].name, s);
	}
	// 49，是否支持LBA
	// 83，是否支持LBA48
}

