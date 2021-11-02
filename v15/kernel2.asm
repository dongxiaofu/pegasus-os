org	0100h
	;xchg bx, bx
	mov ax, 0B800h
	mov gs, ax
	mov ah, 0Ah
	mov al, 'J'
	mov [gs:(80 * 22 + 35)*2], ax

	jmp $
