[section .text]
;extern gdt_ptr
;extern ReloadGDT
global _start

_start:
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	mov ah, 0Bh
	mov al, 'L'
	mov [gs:(80 * 20 + 40) * 2], ax

	;sgdt [gdt_ptr]
	;call ReloadGDT
	;lgdt [gdt_ptr]

	mov ah, 0Bh
	mov al, 'M'
	mov [gs:(80 * 20 + 41) * 2], ax


	jmp $

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
