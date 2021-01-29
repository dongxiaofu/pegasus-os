org	0100h

	mov ax, 0B800h
	mov gs, ax
	mov ah, 0Ch
	mov al, 'M'
	mov [gs:(80 * 16 + 20)*2], ax

	jmp $
	
