.PYTHON:everything

everything:boot.bin loader.bin kernel.bin
	dd if=boot.bin of=a.img count=1 conv=notrunc
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
	ld -s kernel.o -o kernel.bin -m elf_i386 
	# nasm  kernel.asm -o kernel.bin
