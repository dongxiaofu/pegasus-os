[SECTION .txt]

; 忘记了写汇编函数的格式，照着string.asm写的。
; 对文件命名比较纠结。
global read_port
global write_port

; read_port(int port, char *fsbuf, int size)
read_port:
	push ebp
	mov ebp, esp
	;mov dx, [ebp + 8]	; port
	mov edx, [ebp + 8]	; port
	;mov esi, [ebp + 12]	; fsbuf
	mov edi, [ebp + 12]	; fsbuf
	mov ecx, [ebp + 16]	; size
	shr ecx, 1		; 把字节换算成字
	cld
	rep insw		; 从port端口把ecx个字的数据复制到es:edi处

	pop ebp
	ret

; write_port(int port, char *fsbuf, int size)
write_port:
	push ebp
	mov ebp, esp
	;mov dx, [ebp + 8]	; port
	mov edx, [ebp + 8]	; port
	mov esi, [ebp + 12]	; fsbuf
	;mov edi, [ebp + 12]	; fsbuf
	mov ecx, [ebp + 16]	; size
	shr ecx, 1		; 把字节换算成字
	cld
	rep outsw		; 把fsbuf中的数据写入到port端口

	pop ebp
	ret

