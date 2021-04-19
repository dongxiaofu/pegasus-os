[section .data]
Str:	db	"Hello,World"
Len	equ	$ - Str

[section .text]

global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, Str
	mov edx, Len
	int 0x80
	
	mov eax, 1
	mov ebx, 0
	int 0x80

	ret
