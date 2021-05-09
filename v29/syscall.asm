global get_ticks
global write

[section .data]
_NR_GET_TICKS	equ	0
_NR_WRITE	equ	1
INT_VECTOR_TICKS	equ	0x90

[section .text]

get_ticks:
	xchg bx, bx
	mov eax, _NR_GET_TICKS
	int INT_VECTOR_TICKS
	ret


; int write(char *buf, int len)
write:
	xchg bx, bx
	mov eax, _NR_WRITE
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret


; int write_debug(char *buf, int len);
write:
	xchg bx, bx
	mov eax, _NR_WRITE
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret
