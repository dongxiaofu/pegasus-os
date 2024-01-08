[section .bss]
Stack	resb	1024*2
;Stack	resb	1024*1024
;Stack	resb	1024*1024*16
;Stack	resb	1024*2
StackTop:
; TSS选择子
TSS_SELECTOR	equ	0x40
GS_SELECTOR		equ	0x3b
[section .data]
msg1	db	"esp:", "$"
msg2	db	"tss.esp0:", "$"

[section .text]
extern gdt_ptr
extern idt_ptr
extern tss
extern proc_table

extern ReloadGDT

extern dis_pos
extern kernel_main

global _start


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
	;;;xchg bx, bx	
	;mov word [dis_pos], 0
	mov dword [dis_pos], 0
	mov ah, 0Bh
	mov al, 'L'
	mov [gs:(80 * 20 + 40) * 2], ax
	
	;mov esp, StackTop
	mov word [dis_pos], 0
	;;;xchg bx, bx
	sgdt [gdt_ptr]
	call ReloadGDT
	lgdt [gdt_ptr]
	lidt [idt_ptr]
	push gs
	pop gs
	jmp dword 0x8:csinit
	;;;;;;xhcg bx, bx
	;jmp $
csinit:
	;;;;;;xhcg bx, bx
	; 加载tss
	; 怎么使用C代码中的常量？
	; ltr TSS_SELECTOR
	;ltr [TSS_SELECTOR]
	xor eax, eax
	mov ax, TSS_SELECTOR
	ltr ax
	xor eax, eax
	
	;;xchg bx, bx
	jmp kernel_main
	hlt
	jmp $	
	sti
	mov ah, 0Bh
	mov al, 'M'
	mov [gs:(80 * 20 + 41) * 2], ax
	jmp $
	hlt
	;mov word [dis_pos], 0
	;mov esp, StackTop
	push 0
	popfd
	jmp $	
	;hlt	
	; 测试resb是否把堆栈初始化成了0
	push 1
	push 2
	push 3
	;int 0x0D
	;ud2
	;int 0x0

	hlt

