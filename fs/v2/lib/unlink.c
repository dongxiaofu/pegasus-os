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

int unlink(const char *pathname)
{
	Message msg;

	msg.type = UNLINK;
	msg.PATHNAME = pathname;
	msg.NAME_LEN = Strlen(pathname);
	
	send_rec(BOTH, &msg, TASK_FS);

	return msg.RETVAL;
}
