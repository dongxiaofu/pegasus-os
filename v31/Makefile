.PYTHON:everything

ASM	=	nasm
CC	=	gcc
CFLAGS	=	-I include  -g -c -I main.h -fno-builtin -o -m32	
everything:boot.bin loader.bin kernel.bin
	# ld -s -Ttext 0x30400  -o kernel.bin  kernel.o  kernel_main.o -m elf_i386 
	# ld -s -Ttext 0x30400  -o kernel.bin  kernel.o string.o kernel_main.o -m elf_i386 
	ld -Ttext 0x30400  -o kernel.bin  kernel.o string.o kernel_main.o hd.o syscall.o -m elf_i386 
	# ld -s -Ttext 0x30400  -o kernel.bin  kernel.o string.o  -m elf_i386 
	# ld -s -Ttext 0x30400  -o kernel.bin  kernel.o  -m elf_i386 
	dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc
	sudo mount -o loop a.img /mnt/floppy/
	sudo cp loader.bin	/mnt/floppy/ -v
	#sudo cp pmtest2.com	/mnt/floppy/ -v
	sudo cp kernel.bin 	/mnt/floppy/ -v
	sudo umount /mnt/floppy
clean:
	rm -rvf *.bin

boot.bin:boot.asm
	nasm $< -o $@ 

#loader.bin:loader.asm
loader.bin:pmtest2.asm
	# nasm -o loader.bin pmtest2.asm
	nasm -o loader.bin loader.asm

kernel.bin:kernel.asm string.asm main.c syscall.asm hd.c
	nasm -o kernel.o -f elf kernel.asm
	#ld -s -Ttext 0x30400  -o kernel.bin  kernel.o string.o kernel_main.o -m elf_i386 
	nasm -o string.o -f elf string.asm
	nasm -o syscall.o -f elf syscall.asm
	# gcc -c -fno-builtin -o kernel_main.o kernel_main.c -m32
	# gcc -g -c -I main.h -fno-builtin -o kernel_main.o main.c -m32
	# gcc -g -c -I main.h -fno-builtin -o hd.o hd.c -m32
	${CC} ${CFLAGS} kernel_main.o main.c
	${CC} ${CFLAGS} hd.o hd.c
	# ld -s -Ttext 0x60400  -o kernel.bin  kernel.o -m elf_i386 
	#ld -s -Ttext 0x6400  -o kernel.bin  kernel.o -m elf_i386 
	# ld -s  -o kernel.bin  kernel.o -m elf_i386 
	# nasm  kernel.asm -o kernel.bin
