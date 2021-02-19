[section .text]

global _start

_start:
	mov ax, 0xB800
	mov gs, ax
	mov ah, 0Fh
	mov al, 'G'
	mov [gs:(80 * 28 + 40) * 2], ax
	jmp $
