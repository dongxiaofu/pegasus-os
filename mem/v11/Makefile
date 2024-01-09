PYTHON:everything 

ENTRYOFFSET     =   0x400

ASM	=	nasm
CC	=	gcc
LD	=	ld
ASKFLAGS=	-I include/ -f elf
CFLAGS	=	-I include/ -I include/sys -I include/mem \
			-g -c -fno-builtin -m32	
# CFLAGS	=	-I include/ -I include/sys -c -fno-builtin -m32	
# LDFLAGS		= -Ttext 0x30400 -Map krnl.map -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc
# LDFLAGS		= -Ttext 0x30400 -Map krnl.map -m elf_i386
# LDFLAGS		= -Ttext 0x1000 -Map krnl.map -m elf_i386
# LDFLAGS		= -Ttext 0xc0001000 -Map krnl.map -m elf_i386
LDFLAGS		= -Ttext 0xc0100000 -Map krnl.map -m elf_i386
#LDFLAGS	=	-s -Ttext 0x30400 -m elf_i386

BOOT = loader.bin boot.bin
KERNEL	=	kernel.bin
OBJS	=	kernel_sub.o kernel.o string.o kernel_main.o hd.o syscall.o fs_main.o global.o \
		hd.o hd_rdwt.o process.o protect.o console.o keyboard.o \
		open.o	read.o	write.o	close.o \
		wait.o  exit.o 	fork.o	 getpid.o exec.o \
		mm/main.o mm/exec.o mm/forkexit.o	\
		mem/mem.o \
		kernel_main_old.o my_process.o \
		switch_to.o	double_link_list.o thread.o \
		ne2000.o
	#	wait.o	exit.o	fork.o	unlink.o getpid.o

LOBJS2	=	kernel.o string.o kernel_main.o hd.o syscall.o fs_main.o global.o \
		hd.o hd_rdwt.o process.o protect.o console.o keyboard.o \
		open.o	read.o	write.o	close.o \
		wait.o  exit.o 	fork.o	 getpid.o exec.o \
		mm/main.o mm/exec.o mm/forkexit.o \
		mem/mem.o \
		kernel_main_old.o my_process.o \
		switch_to.o	double_link_list.o thread.o \
		ne2000.o

LOBJS	=	lib/pegasus_crt.a

image:clean everything buildimg subsystem

everything:${BOOT} ${KERNEL} ${LOBJS}

subsystem:
	cd command && make all

buildimg:
	dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc
	sudo mount -o loop a.img /mnt/floppy/
	sudo cp loader.bin	/mnt/floppy/ -v
	sudo cp kernel.bin 	/mnt/floppy/ -v
	sudo umount /mnt/floppy
	cp -rvf /home/cg/os/pegasus-os/hd/80m.img ./
	chown cg 80m.img

	objdump -d kernel.bin > k-log.asm
clean:
	rm -rvf *.bin
	rm -rvf *.o
	rm -rvf mm/*.o
	rm -rvf lib/*.a
	rm -rvf 80m.img
	rm -rvf 80m.img.lock

# 不能使用所有的输入文件
# kernel.bin:kernel.o string.o kernel_main.o hd.o syscall.o
#	${LD} ${LDFLAGS} -o $@ $<

${KERNEL}:${OBJS}
	# 1. $^ 非常有用。
	# 2. 它解决了错误：
	# 3. keyboard.o:/home/cg/os/pegasus-os/v31/include/sys/keymap.h:4: 
	# 	multiple definition of `keymap'
	${LD} ${LDFLAGS} -o $@ $^
	#${LD} ${LDFLAGS} -o ${KERNEL} ${OBJS}

boot.bin:boot.asm
	nasm $< -o $@ 

loader.bin:pmtest2.asm
	nasm -o loader.bin loader.asm

# kernel.o:kernel.asm include/string.h include/hd.h
# kernel.o:kernel-30.asm
kernel.o:kernel-20.asm
# kernel.o:kernel.asm
	${ASM} ${ASKFLAGS} -o $@ $<

ne2000.o:network/demo.asm
	${ASM} ${ASKFLAGS} -o $@ $<

#DriverSend.o:network/DriverSend.asm
#	${ASM} ${ASKFLAGS} -o $@ $<

kernel_sub.o:kernel_sub.asm
	${ASM} ${ASKFLAGS} -o $@ $<

# string.o:string.asm  include/main.h include/string.h
string.o:string.asm
	${ASM} ${ASKFLAGS} -o $@ $<

switch_to.o:switch_to.asm
	${ASM} ${ASKFLAGS} -o $@ $<

#syscall.o:syscall.asm  include/main.h include/string.h
syscall.o:syscall.asm
	${ASM} ${ASKFLAGS} -o $@ $<

hd_rdwt.o:hd/hd_rdwt.asm
	${ASM} ${ASKFLAGS} -o $@ $<

kernel_main.o:main.c
	${CC} ${CFLAGS} -o $@ $<
kernel_main_old.o:20220913-main.c
	${CC} ${CFLAGS} -o $@ $<

process.o:process.c
	${CC} ${CFLAGS} -o $@ $<

global.o:global.c
	${CC} ${CFLAGS} -o $@ $<

protect.o:protect.c
	${CC} ${CFLAGS} -o $@ $<

hd.o:hd/hd.c
	${CC} ${CFLAGS} -o $@ $<

console.o:console.c
	${CC} ${CFLAGS} -o $@ $<

keyboard.o:keyboard.c
	${CC} ${CFLAGS} -o $@ $<

fs_main.o:fs/fs_main.c
	${CC} ${CFLAGS} -o $@ $^

open.o:lib/open.c
	${CC} ${CFLAGS} -o $@ $<

read.o:lib/read.c
	${CC} ${CFLAGS} -o $@ $<

write.o:lib/write.c
	${CC} ${CFLAGS} -o $@ $<

close.o:lib/close.c
	${CC} ${CFLAGS} -o $@ $<

# MM
mm/main.o:mm/main.c
	${CC} ${CFLAGS} -o $@ $<

mm/exec.o:mm/exec.c
	${CC} ${CFLAGS} -o $@ $<

mm/forkexit.o: mm/forkexit.c
	${CC} ${CFLAGS} -o $@ $<

wait.o:lib/wait.c
	${CC} ${CFLAGS} -o $@ $<

exit.o:lib/exit.c
	${CC} ${CFLAGS} -o $@ $<

fork.o:lib/fork.c
	${CC} ${CFLAGS} -o $@ $<

unlink.o:lib/unlink.c
	${CC} ${CFLAGS} -o $@ $<

getpid.o:lib/getpid.c
	${CC} ${CFLAGS} -o $@ $<

exec.o:lib/exec.c
	${CC} ${CFLAGS} -o $@ $<
# 内存管理
mem.o:mem/mem.c
	${CC} ${CFLAGS} -o $@ $<

# 重构时写的代码start
double_link_list.o:double_link_list.c
	${CC} ${CFLAGS} -o $@ $<
thread.o:thread.c
	${CC} ${CFLAGS} -o $@ $<
my_process.o:my_process.c
	${CC} ${CFLAGS} -o $@ $<
# 重构时写的代码end

# 生成CRT，C语言运行时环境
${LOBJS}:${LOBJS2}
	ar rcs $@ $^
