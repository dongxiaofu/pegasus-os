PYTHON:everything 
ASM	=	nasm
CC	=	gcc
LD	=	ld
ASKFLAGS=	-I include/ -f elf
CFLAGS	=	-I include/ -I include/sys  -g -c -fno-builtin -m32	
LDFLAGS		= -Ttext 0x30400 -Map krnl.map -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc
#LDFLAGS	=	-s -Ttext 0x30400 -m elf_i386

BOOT = loader.bin boot.bin
KERNEL	=	kernel.bin
OBJS	=	kernel.o string.o kernel_main.o hd.o syscall.o fs_main.o global.o \
		hd.o process.o protect.o console.o keyboard.o

image:clean everything buildimg

everything:${BOOT} ${KERNEL}

buildimg:
	dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc
	sudo mount -o loop a.img /mnt/floppy/
	sudo cp loader.bin	/mnt/floppy/ -v
	sudo cp kernel.bin 	/mnt/floppy/ -v
	sudo umount /mnt/floppy
clean:
	rm -rvf *.bin
	rm -rvf *.o

# 不能使用所有的输入文件
# kernel.bin:kernel.o string.o kernel_main.o hd.o syscall.o
#	${LD} ${LDFLAGS} -o $@ $<

${KERNEL}:${OBJS}
	# 行不通
	# ${LD} ${LDFLAGS} -o $@ $<
	${LD} ${LDFLAGS} -o ${KERNEL} ${OBJS}

boot.bin:boot.asm
	nasm $< -o $@ 

loader.bin:pmtest2.asm
	nasm -o loader.bin loader.asm

# kernel.o:kernel.asm include/string.h include/hd.h
kernel.o:kernel.asm
	${ASM} ${ASKFLAGS} -o $@ $<

# string.o:string.asm  include/main.h include/string.h
string.o:string.asm
	${ASM} ${ASKFLAGS} -o $@ $<

#syscall.o:syscall.asm  include/main.h include/string.h
syscall.o:syscall.asm
	${ASM} ${ASKFLAGS} -o $@ $<

kernel_main.o:main.c
	${CC} ${CFLAGS} -o $@ $<

process.o:process.c
	${CC} ${CFLAGS} -o $@ $<

global.o:global.c
	${CC} ${CFLAGS} -o $@ $<

protect.o:protect.c
	${CC} ${CFLAGS} -o $@ $<

hd.o:hd.c
	${CC} ${CFLAGS} -o $@ $<

console.o:console.c
	${CC} ${CFLAGS} -o $@ $<

keyboard.o:keyboard.c
	${CC} ${CFLAGS} -o $@ $<

fs_main.o:fs/fs_main.c
	${CC} ${CFLAGS} -o $@ $<
