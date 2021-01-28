org 0x7c00

jmp	LABEL_START
nop

LABEL_START:
	mov ax,	0B800h
	mov gs,	ax
	mov al,	'G'
	mov ah,	0Ch
	mov [gs:((80 * 2 + 40) * 2)],	ax

times	510 - ($ - $$)	db	0
dw	0xAA55
