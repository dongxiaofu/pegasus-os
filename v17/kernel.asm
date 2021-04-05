[section .bss]
Stack	resb	1024*2
StackTop:

[section .text]
extern gdt_ptr
extern idt_ptr
extern ReloadGDT
global _start
global InterruptTest
_start:
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;jmp $
	;jmp $
	;jmp $
	;xchg bx, bx
	mov ah, 0Bh
	mov al, 'L'
	mov [gs:(80 * 20 + 40) * 2], ax
	xchg bx, bx
	sgdt [gdt_ptr]
	call ReloadGDT
	xchg bx, bx
	lgdt [gdt_ptr]
	lidt [idt_ptr]
	;jmp 0x8:csinit
csinit:
	mov ah, 0Bh
	mov al, 'M'
	mov [gs:(80 * 20 + 41) * 2], ax

	mov esp, StackTop
	push 0
	popfd
	; 测试resb是否把堆栈初始化成了0
	push 1
	push 2
	push 3

	int 0x0

	hlt

	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	85537	db	0
	;times	85537	db	0





; 中断例程
InterruptTest:
	mov ah, 0Dh
	mov al, 'T'
	mov [gs:(80 * 20 + 42)*2], ax
	ret
