PYTHON:everything

ASM	=	nasm
CC	=	gcc
LD	=	ld
ASKFLAGS=	-I include/ -f elf
CFLAGS	=	-I include/  -g -c -fno-builtin -m32	
LDFLAGS	=	-s -Ttext 0x30400 -m elf_i386

BOOT = loader.bin boot.bin
KERNEL	=	kernel.bin
OBJS	=	kernel.o string.o kernel_main.o hd.o syscall.o

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

kernel.o:kernel.asm include/string.h
	${ASM} ${ASKFLAGS} -o $@ $<

string.o:string.asm  include/main.h include/string.h
	${ASM} ${ASKFLAGS} -o $@ $<

syscall.o:syscall.asm  include/main.h include/string.h
	${ASM} ${ASKFLAGS} -o $@ $<

kernel_main.o:main.c include/main.h include/string.h include/keymap.h
	${CC} ${CFLAGS} -o $@ $<

hd.o:hd.c include/main.h include/string.h
	${CC} ${CFLAGS} -o $@ $<
