global get_ticks

[section .data]
_NR_GET_TICKS	equ	0
INT_VECTOR_TICKS	equ	0x90

[section .text]

get_ticks:
	mov eax, _NR_GET_TICKS
	int INT_VECTOR_TICKS
	ret
