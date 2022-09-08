global _start
extern main

_start:

	push ecx
	push eax
	call main
	add esp, 8

	ret
