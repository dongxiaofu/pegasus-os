[section .text]

global _start

_start:
	mov ah, 0Fh
	mov al, 'C'
	mov [gs:(80 * 20 + 40) * 2], ax
	mov [gs:(80 * 21 + 40) * 2], ax
	mov [gs:(80 * 22 + 80) * 2], ax
	jmp $
	jmp $
