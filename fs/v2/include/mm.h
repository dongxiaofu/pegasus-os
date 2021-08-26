#ifndef _PEGASUS_OS_MM_H
#define _PEGASUS_OS_MM_H

//int do_fork(Message *msg);
//
//void cleanup(Proc *proc);
//
//void do_exit(Message msg, int exit_code);
//
//void do_wait(Message msg, int *data);
//
//int do_exec(Message *msg);

int fork();

int wait(int *status);

int exec(const char *pathname);

int execv(const char *pathname, char **argv);

int execl(const char *pathname, char *argv, ...);

void exit(int status);

int getpid();

#endif
