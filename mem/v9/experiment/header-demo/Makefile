CC		= gcc
LD		= ld
# FLAGS		= -I include/ -I include/sys/ -I /usr/include/ -c -fno-builtin -Wall -m32
FLAGS		= -I include/ -I /usr/include/ -c -Wall -m32
LDFLAGS		= -Ttext 0x30400 -Map krnl.map -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc
# LDFLAGS		= -Ttext 0x30400 -Map krnl.map -m elf_i386 -lc
ASM		= nasm
ASKFLAGS=	-I include/ -f elf

# This Program
ORANGESKERNEL	= kernel.bin

OBJS		= main.o a.o b.o kernel.o
# OBJS		= main.o a.o b.o

# All Phony Targets
.PHONY : everything final image clean realclean disasm all buildimg

# Default starting position
nop :
	@echo "why not \`make image' huh? :)"

everything :  $(ORANGESKERNEL)

all : realclean everything

image : realclean everything clean buildimg

clean :
	rm -f $(OBJS)

realclean :
	rm -f $(OBJS)  $(ORANGESKERNEL)

kernel.o:start.asm
	${ASM} ${ASKFLAGS} -o $@ $<

${ORANGESKERNEL}:${OBJS}
	# 行不通
	# ${LD} ${LDFLAGS} -o $@ $<
	${LD} ${LDFLAGS} -o ${ORANGESKERNEL} ${OBJS}


main.o : main.c
	$(CC) $(FLAGS) -o $@ $<

a.o : a.c
	$(CC) $(FLAGS) -o $@ $<

b.o : b.c
	$(CC) $(FLAGS) -o $@ $<
