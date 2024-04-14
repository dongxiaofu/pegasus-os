ASM	:=	nasm
CC	=	gcc
LD	=	ld
ASKFLAGS=	-I include/ -f elf
CFLAGS	=	-I include/ -I include/sys -I include/mem \
			-I include/arpa \
			-I include/netinet \
			-I include/network \
			-g -c -fno-builtin -m32
LDFLAGS		:= -Ttext 0xc0500000 -Map krnl.map -m elf_i386

BIN	:=	kernel.bin

SRCS := $(wildcard *.c)
NETWORK_FILES := $(wildcard network/*.c)
HD_FILES := $(wildcard hd/*.c)
FS_FILES := $(wildcard fs/*)
MM_FILES := $(wildcard mm/*)
MEM_FILES := $(wildcard mem/*)
LIB_FILES := $(wildcard lib/*.c lib/**/*)
ALL_FILES := $(SRCS) $(NETWORK_FILES) $(HD_FILES) $(FS_FILES) $(MM_FILES) $(MEM_FILES) $(LIB_FILES)
#ALL_FILES := $(SRCS) $(HD_FILES) $(FS_FILES) $(MM_FILES) $(MEM_FILES) $(LIB_FILES)

OBJS	:= $(ALL_FILES:.c=.o)   # 将所有的.c文件名替换为.o
#LIB_OBJS	:=	$(LIB_FILES:.c=.o)

ASM_SOURCE := $(wildcard *.asm)
ASM_HD_SOURCE	:=	$(wildcard hd/*.asm)
ASM_NET_SOURCE	:=	$(wildcard network/*.asm)
ALL_ASM_SOURCE	:=	$(ASM_SOURCE) $(ASM_HD_SOURCE) $(ASM_NET_SOURCE)
ASM_OBJS	:= $(ALL_ASM_SOURCE:.asm=.o)	

ASM_BOOT_SOURCE	:=	$(wildcard boot/*.asm)
ASM_BOOT_OBJS	:=  $(ASM_BOOT_SOURCE:.asm=.bin)	

ASM_KERNEL_SOURCE	:=	$(wildcard kernel/*.asm)
ASM_KERNEL_OBJS	:=  $(ASM_KERNEL_SOURCE:.asm=.o)	
#排除kernel_sub.o。
ASM_KERNEL_OBJS_FILTERED	:=	$(filter-out kernel_sub.o, $(ASM_KERNEL_OBJS))

LOBJS	=	command/pegasus_crt.a

image: clean all

all: everything buildimg subsystem

everything:${BIN} ${LOBJS} $(ASM_BOOT_OBJS) $(ASM_KERNEL_OBJS)

$(BIN):$(ASM_KERNEL_OBJS) $(ASM_OBJS) $(OBJS)
	${LD} ${LDFLAGS} -o $@ $^

%.o:%.c
	@echo "正在编译C代码...";
	${CC} ${CFLAGS} -o $@ $<

%.o:%.asm
	@echo "正在编译汇编代码...";
	${ASM} ${ASKFLAGS} -o $@ $<

%.bin:%.asm
	@echo "正在编译boot中的汇编代码...";
	${ASM}	$<	-o	$@

# 生成CRT，C语言运行时环境
${LOBJS}: $(ASM_KERNEL_OBJS_FILTERED) $(ASM_OBJS) $(OBJS)
	ar rcs $@ $^

subsystem:
	cd command && make all

buildimg:
	dd if=boot/boot.bin of=a.img bs=512 count=1 conv=notrunc
	sudo mount -o loop a.img /mnt/floppy/
	sudo cp boot/loader.bin	/mnt/floppy/ -v
	sudo cp kernel.bin 	/mnt/floppy/ -v
	sudo umount /mnt/floppy
	cp -rvf /home/cg/os/pegasus-os/hd/80m.img ./
	chown cg 80m.img
	objdump -d kernel.bin > k-log


clean:
	rm -rvf *.bin
	rm -rvf boot/*.bin
	rm -rvf *.o
	rm -rvf mm/*.o
	rm -rvf hd/*.o
	rm -rvf fs/*.o
	rm -rvf network/*.o
	rm -rvf lib/*.o
	rm -rvf command/*.o
	rm -rvf command/*.a
	rm -rvf 80m.img
	rm -rvf 80m.img.lock
	rm -rvf k-log
