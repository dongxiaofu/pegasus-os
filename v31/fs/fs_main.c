#include "const.h"
#include "stdio.h"
#include "process.h"
#include "protect.h"
#include "proto.h"
#include "string.h"
#include "keymap.h"
#include "keyboard.h"
#include "console.h"


void task_fs()
{
	Printf("%s\n", "FS is running");
	
	Message msg;
	msg.type = HD_DEV_OPEN;
	msg.source = 3;
	send_rec(BOTH, &msg, 2);

	spin("Stopping\n");
}
