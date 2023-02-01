
;global main
;global exit

extern main
extern exit

global _start


_start:
	push	eax
	push	ecx
	call	main

	push	eax
	call	exit
	
	jmp $
	; todo 能用ret吗？
	hlt
