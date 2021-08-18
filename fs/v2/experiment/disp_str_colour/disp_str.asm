global disp_str_colour

extern dis_pos

[SECTION .text]
; 打印字符串，设置颜色
disp_str_colour:
	push ebp
	mov ebp, esp
	;push edi
	;push esi
	xchg bx, bx	
	mov esi, [ebp + 8]
	; 颜色
	mov eax, [ebp + 12]
	;mov eax, [ebp + 4]
	;mov eax, 0Bh
	mov edi, [dis_pos]
	;xchg bx, bx

.1:
	lodsb
	; al为空，即字符串打印完毕
	test al, al
	jz .4
	cmp al, 0X0A
	jnz .3
	; 处理换行
	push eax
	mov eax, edi
	mov bl, 160
	div bl
	inc eax
	mov bl, 160
	mul bl
	mov edi, eax
	pop eax
	jmp .1
.3:
	xchg bx, bx
	mov [gs:edi], ax
	add edi, 2
	jmp .1
.4:
	mov [dis_pos], edi
	;pop esi
	;pop edi	
	pop ebp
	
	ret
	;ret 2
