.PYTHON:everything

everything:boot.bin
	dd if=boot.bin of=a.img count=1 conv=notrunc

boot.bin:boot.asm
	nasm $< -o $@ 
