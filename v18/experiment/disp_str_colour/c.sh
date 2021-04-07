#! /bin/bash

unlink test
unlink disp_str.o

nasm -o disp_str.o disp_str.asm -f elf
gcc -o test test.c disp_str.o -m32

ndisasm test > test.asm
