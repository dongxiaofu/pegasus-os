org 0x7c00

jmp	LABEL_START
nop

LABEL_START:
	mov ax,	0B800h
	mov gs,	ax
	mov al,	'G'
	mov ah,	0Ch
	mov [gs:((80 * 2 + 40) * 2)],	ax

	; 打印字符串
	mov ax, cs
	mov es, ax
	mov ds, ax
	mov ax, BootMessage
	;mov bp,	BootMessage
	mov bp, ax
	;mov cx,	BootMessageLength
	;mov cx, 16
	mov ax, BootMessageLength
	mov cx, ax
	mov ax,	1301h
	mov bx, 000ch
	mov dl,	10
	mov dh, 15
	int 10h
	
	jmp $

BootMessage:	db	"Hello,World OS!"
;BootMessageLength:	db	$ - BootMessage
BootMessageLength	equ	$ - BootMessage

times	510 - ($ - $$)	db	0
dw	0xAA55
