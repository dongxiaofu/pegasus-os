#include "global.h"
#include "main.h"
#include "string.h"

void task_fs()
{
	Printf("%s\n", "FS is running");
	
	Message msg;
	msg.type = HD_DEV_OPEN;
	msg.source = 3;
	send_rec(BOTH, &msg, 2);

	spin("Stopping\n");
}
