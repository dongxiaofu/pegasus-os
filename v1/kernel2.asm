org	0100h
	xchg bx, bx
	mov ax, 0B800h
	mov gs, ax
	mov ah, 0Ch
	mov al, 'K'
	mov [gs:(80 * 28 + 20)*2], ax

	jmp $
