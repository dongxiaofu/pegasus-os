org 0x7c00

mov cx, 0
mov ax, 0xB800
mov gs, ax

mov ax, cs
mov ds, ax
mov es, ax

mov di, (80 * 20 + 20) * 2

BootMessage:	db	"Hello,World"
BMLen	equ	$ - BootMessage
mov si, BootMessage
cld
LABEL_START:
	xchg bx, bx	
	lodsb
	xchg bx, bx
	;mov al, 'G'
	mov ah, 0Dh
	mov [gs:di], ax
	add di, 2
	
	;inc si	
	inc cx
	cmp cx, BMLen
	
	jz OVER	


	jmp LABEL_START
	;loop LABEL_START
OVER:
	jmp $

times	510 - ($ - $$)	db	0
dw	0xAA55
