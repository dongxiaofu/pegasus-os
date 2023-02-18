PYTHON:everything 


HD	=	../80m.img
ASM	=	nasm
CC	=	gcc
LD	=	ld
ASKFLAGS=	-I ../include/ -f elf
CFLAGS	=	-I ../include/ -I ../include/sys -c -fno-builtin -m32	
LDFLAGS		= -Ttext 0xb0800000 -Map krnl.map -m elf_i386
LIB	=	../lib/pegasus_crt.a
KERNEL	=	kernel.bin
OBJS	=	start.o	pwd.o echo.o ls.o test.o
BIN	=	echo pwd ls test

all:clean everything install

everything:echo pwd ls test

install:
	# tar cvf install.tar echo pwd ls test
	tar cvf install.tar echo
	cp -rvf ../kernel.bin ./
	dd if=install.tar of=${HD} seek=24578 bs=512 count=1140 conv=notrunc
	objdump -d echo > test.asm

clean:
	#rm -rvf *.o
	rm -rvf ${OBJS}
	rm -rvf ${BIN}
	rm -rvf install.tar

start.o:start.asm
	${ASM} ${ASKFLAGS} -o $@ $<

echo:echo.o start.o ${LIB}
	#${LD} ${LDFLAGS} -o $@ $<
	${LD} ${LDFLAGS} -o $@ $?

echo.o:echo.c  ../include/stdio.h
	${CC} ${CFLAGS} -o $@ $<

pwd:pwd.o start.o  ${LIB}
	#${LD} ${LDFLAGS} -o $@ $<
	${LD} ${LDFLAGS} -o $@ $?

pwd.o:pwd.c ../include/stdio.h
	${CC} ${CFLAGS} -o $@ $<

ls:ls.o start.o  ${LIB}
	#${LD} ${LDFLAGS} -o $@ $<
	${LD} ${LDFLAGS} -o $@ $?

ls.o:ls.c ../include/stdio.h
	${CC} ${CFLAGS} -o $@ $<

test:test.o start.o  ${LIB}
	#${LD} ${LDFLAGS} -o $@ $<
	${LD} ${LDFLAGS} -o $@ $?

test.o:test.c ../include/stdio.h
	${CC} ${CFLAGS} -o $@ $<
