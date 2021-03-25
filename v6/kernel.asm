[section .text]

global _start

_start:
	xchg bx, bx
	;times	85537	db	0
	mov ah, 0Fh
	mov al, 'C'
	mov [gs:(80 * 20 + 40) * 2], ax
	mov [gs:(80 * 21 + 40) * 2], ax
	mov [gs:(80 * 22 + 80) * 2], ax
	jmp $
	jmp $

	times	131072	db	0
	times	131072	db	0
	times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	85537	db	0
	;times	85537	db	0
