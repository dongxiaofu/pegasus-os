org 0x7c00

jmp	LABEL_START
nop

LABEL_START:
	mov ax,	0B800h
	mov gs,	ax
	mov al,	'G'
	mov ah,	0Ch
	mov [gs:((80 * 10 + 40) * 2)],	ax

	; 打印字符串
	mov ax, cs
	mov es, ax	; 非必须
	mov ds, ax	; 非必须
	mov ax, BootMessage
	; 变量不能直接赋值给bp，原因未知。下面的cx也是如此。
	;mov bp,	BootMessage
	mov bp, ax
	;mov cx,	BootMessageLength
	;mov cx, 16
	mov ax, BootMessageLength
	mov cx, ax
	mov ah,	13h
	mov al, 01h
	; mov ax,	1301h	; al 是0、1或2时，字符串显示不正常，花花绿绿，看不清楚
	mov bx, 000ch
	mov dl,	10
	mov dh, 15
	int 10h

	; 写显存打印字符串 start	
	mov di,	(80 * 5 + 20) * 2
	mov ax, BootMessageLength
	mov cx, ax
	
	; 关键语句，让 si 指向 BootMessage
	mov si, BootMessage
	;mov es, ax
	;lea si, BootMessage
	; mov si, ax	
	;mov si, BootMessage
	;mov es, si
	;mov si,	0
	
	
DISP_STR:
	;mov al,	[es:si]
	;mov al, 'M'
	; 获取si指向的内存中的数据
	mov al, [si]
	; 下一个字节的内存找那个存储的数据
	inc si
	mov ah, 0Ah
	mov [gs:di], ax
	add di, 2
	
	loop DISP_STR


	; 写显存打印字符串 end	
	jmp $

BootMessage:	db	"Hello,World OS!"
;BootMessageLength:	db	$ - BootMessage
; 长度，需要使用 equ 
BootMessageLength	equ	$ - BootMessage

times	510 - ($ - $$)	db	0
dw	0xAA55
