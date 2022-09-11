extern choose

[section .data]

GreaterNumber	equ	51
SmallerNumber equ	23

Str:	db	"Hello"
;StrLe	equ	$ - Str 未定义

;Str	dd	"Hello"
Strlen2	dd	5

[section .text]

global _start
global _displayStr

_start:
	;mov	al,	'A'
	;mov	ah,	0Fh
	;mov	[gs:(80*22 + 35)*2],	ax

	;push	GreaterNumber
	push	SmallerNumber
	push	GreaterNumber
	call choose
	add	esp,	8

	mov eax, 1
	mov ebx, 0
	int 0x80	

	ret
	
; _displayStr(char *str, int len)	
_displayStr:
	mov eax, 4
	mov ebx, 1
	;mov ecx, [ebp + 4]		; str
	mov ecx, [esp + 4]		; str
	;mov edx, [ebp + 8]		; len。ebp + 0 是 cs:ip中的ip
	mov edx, [esp + 8]		; len。ebp + 0 是 cs:ip中的ip
	int 0x80
	ret
