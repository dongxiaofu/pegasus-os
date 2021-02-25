extern choose

[section .data]

GreaterNumber	equ	51
SmallerNumber equ	23

[section .text]

global _start
global _displayStr

_start:
	push	GreaterNumber
	push	SmallerNumber
	call choose
	add	esp,	8
	
	ret
	
; _displayStr(char *str, int len)	
_displayStr:
	mov eax, 4
	mov ebx, 1
	mov ecx, [ebp + 8]		; str
	mov edx, [ebp + 4]		; len。ebp + 0 是 cs:ip中的ip
	int 0x80
