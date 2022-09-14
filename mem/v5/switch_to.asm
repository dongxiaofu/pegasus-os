global switch_to

switch_to:
	;保存栈
	push esi
	push edi
	push ebx
	push ebp
	mov ebp, esp


	mov eax, [ebp+20]
	mov [eax], esp


	;第一个参数
	;需要第一个参数吗？
	;第二个参数
	mov eax, [ebp+24]	
	mov esp, [eax]

	;出栈
	pop ebp
	pop ebx
	pop edi
	pop esi

	ret
