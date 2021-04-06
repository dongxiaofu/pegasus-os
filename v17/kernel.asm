[section .bss]
Stack	resb	1024*2
StackTop:

[section .data]



[section .text]
extern gdt_ptr
extern idt_ptr
extern ReloadGDT

extern dis_pos

global disp_str
global _start
global InterruptTest


_start:
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;jmp $
	;jmp $
	;jmp $
	;xchg; bx, bx
	
	;mov word [dis_pos], 0
	mov dword [dis_pos], 0
	mov ah, 0Bh
	mov al, 'L'
	mov [gs:(80 * 20 + 40) * 2], ax
	sgdt [gdt_ptr]
	call ReloadGDT
	lgdt [gdt_ptr]
	lidt [idt_ptr]
	;jmp 0x8:csinit
csinit:
	mov ah, 0Bh
	mov al, 'M'
	mov [gs:(80 * 20 + 41) * 2], ax
	;mov word [dis_pos], 0
	mov esp, StackTop
	push 0
	popfd
	; 测试resb是否把堆栈初始化成了0
	push 1
	push 2
	push 3

	int 0x0

	hlt

	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	131072	db	0
	;times	85537	db	0
	;times	85537	db	0





; 中断例程
InterruptTest:
	mov ah, 0Dh
	mov al, 'T'
	mov [gs:(80 * 20 + 42)*2], ax
	ret


; 打印字符串
disp_str:
	xchg bx, bx
	push ebp
	mov ebp, esp
	push edi
	push esi
	
	mov ah, 0Fh

	mov esi, [ebp + 8]
	mov edi, [dis_pos]
	xchg bx, bx

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
	pop esi
	pop edi	
	pop ebp
	
	ret	

