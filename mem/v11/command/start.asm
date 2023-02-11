
;global main
;global exit

extern main
extern exit

global _start


_start:
	mov		eax, ebx
	push	eax
	push	ecx
	xchg	bx, bx
	call	main

	push	eax
	call	exit
	
	jmp $
	; todo 能用ret吗？
	hlt
