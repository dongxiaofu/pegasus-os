.PYTHON:everything

everything:boot.bin loader.bin kernel.bin
	dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc
	sudo mount -o loop a.img /mnt/floppy/
	sudo cp loader.bin	/mnt/floppy/ -v
	sudo cp kernel.bin 	/mnt/floppy/ -v
	sudo umount /mnt/floppy
clean:
	rm -rvf *.bin

boot.bin:boot.asm
	nasm $< -o $@ 

loader.bin:loader.asm
	nasm -o loader.bin loader.asm

kernel.bin:kernel.asm
	nasm -o kernel.o -f elf kernel.asm
	ld -s -Ttext 0x30400  -o kernel.bin  kernel.o -m elf_i386 
	# ld -s -Ttext 0x60400  -o kernel.bin  kernel.o -m elf_i386 
	#ld -s -Ttext 0x6400  -o kernel.bin  kernel.o -m elf_i386 
	# ld -s  -o kernel.bin  kernel.o -m elf_i386 
	# nasm  kernel.asm -o kernel.bin
