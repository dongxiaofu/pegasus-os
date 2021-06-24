[SECTION .txt]

global Memcpy
global Memset
global Strcpy
global Strlen

Memcpy:
	push ebp
	mov ebp, esp
	push eax
	push ecx
	push esi
	push edi
	;mov bp, sp
	;mov di, [bp + 4]        ; p_vaddr，即 dst
	;mov si, [bp + 8]        ; p_off，即 src
	;mov cx, [bp + 12]	; 程序头的个数，即p_size

	;mov di, [bp + 8]        ; p_vaddr，即 dst
	;mov si, [bp + 12]        ; p_off，即 src
	;mov cx, [bp + 16]       ; 程序头的个数，即p_size

	mov edi, [ebp + 8]        ; p_vaddr，即 dst
	mov esi, [ebp + 12]        ; p_off，即 src
	mov ecx, [ebp + 16]       ; 程序头的个数，即p_size
	;push es

	; 在32位模式下，这两步操作不需要。而且，我没有找到把大操作数赋值给小存储单元的指令。
	; mov es, edi
	; mov edi, 0

.1:
	mov byte al, [ds:esi]
	mov [es:edi], al

	inc esi
	inc edi
	cmp ecx, 0
	jz .2
	dec ecx

	cmp ecx, 0
	jz .2
	jmp .1

.2:
	;pop es
	mov eax, [ebp + 8]

	pop edi
	pop esi
	pop ecx
	pop eax
	pop ebp

	ret

; Memset(void *dest, char character, int size)
Memset:
	;;;;;;;;;;xhcg bx, bx
	push ebp
	mov ebp, esp	
	
	push eax
	push esi
	push ecx
	
	mov ecx, [ebp + 16]	; size
	mov esi, [ebp + 8]	; dest
	mov byte al, [ebp + 12]	; character	

.1:
	cmp ecx, 0
	jz .2
	mov [esi], al
	dec ecx
	inc esi		
	jmp .1
.2:
	;;;;;;;;;;xhcg bx, bx
	pop ecx
	pop esi
	pop eax
	pop ebp	
	;mov esp, ebp
	;;;;;;;;;;xhcg bx, bx

	ret	

; char* Strcpy(char *dest, char *src)
Strcpy:
	push ebp
	mov ebp, esp

	mov esi, [ebp + 12]
	mov edi, [ebp + 8]

.1:
	mov byte al, [esi]
	inc esi
	
	cmp al, 0
	jz .2	

	mov byte [edi], al
	inc edi

	jmp .1

.2:
	; 返回值
	mov eax, [ebp + 8]
	
	pop ebp
	ret


; int Strlen(char *str)
Strlen:
	push ebp
	mov ebp, esp
	push ecx
	mov ecx, 0
	mov esi, [ebp + 8]
	
.1:
	mov byte al, [esi]
	;cmp al, 0
	;jz .2
	inc esi
	inc ecx
	cmp al, 0
	jz .2
	jmp .1
.2:
	mov eax, ecx
	pop ecx
	pop ebp
	ret 
