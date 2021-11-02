[section .data]
Stack	resb	1024*2
StackTop:

[section .text]
extern gdt_ptr
extern ReloadGDT
global _start

_start:
	mov ah, 0Bh
	mov al, 'L'
	mov [gs:(80 * 20 + 40) * 2], ax
	;xchg bx, bx
	sgdt [gdt_ptr]
	call ReloadGDT
	;xchg bx, bx
	lgdt [gdt_ptr]

	mov ah, 0Bh
	mov al, 'Y'
	mov [gs:(80 * 20 + 41) * 2], ax

	xchg bx, bx
	mov esp, StackTop
	push 0
	;push 0xFFFFFFFF
	popfd
	; 测试resb是否把堆栈初始化成了0
	push 1
	push 2
	push 3
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
