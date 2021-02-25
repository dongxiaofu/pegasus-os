#! /bin/bash

nasm -f elf -o foo.o foo.asm
gcc -c -o bar.o bar.c -m32
ld -s -o kernel.bin foo.o bar.o -m elf_i386
