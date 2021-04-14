[section .bss]
Stack	resb	1024*2
StackTop:
; TSS选择子
TSS_SELECTOR	equ	0x40
[section .data]



[section .text]
extern gdt_ptr
extern idt_ptr
extern tss
extern proc_table

extern ReloadGDT
extern exception_handler

extern dis_pos
extern test
extern spurious_irq
extern kernel_main

global disp_str
global disp_str_colour
global _start
global InterruptTest

; 内部中断
global divide_zero_fault
global single_step_fault
global non_maskable_interrupt
global breakpoint_trap
global overflow_trap
global bound_range_exceeded_fault
global invalid_opcode_fault
global coprocessor_not_available_fault
global double_fault_exception_abort
global coprocessor_segment_overrun
global invalid_task_state_segment_fault
global segment_not_present_fault
global stack_exception_fault
global general_protection_exception_fault
global page_fault
global coprocessor_error_fault
global align_check_fault
global simd_float_exception_fault


; 内部中断
global hwint0
global hwint1



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
	;;;xchg; bx, bx
	
	;mov word [dis_pos], 0
	mov dword [dis_pos], 0
	mov ah, 0Bh
	mov al, 'L'
	mov [gs:(80 * 20 + 40) * 2], ax
	
	mov esp, StackTop
	mov word [dis_pos], 0
	sgdt [gdt_ptr]
	xchg bx, bx
	call ReloadGDT
	lgdt [gdt_ptr]
	lidt [idt_ptr]
	jmp 0x8:csinit
	;jmp $
csinit:
	; 加载tss
	; 怎么使用C代码中的常量？
	; ltr TSS_SELECTOR
	ltr [TSS_SELECTOR]
	jmp kernel_main

	hlt
	sti
	hlt
	mov ah, 0Bh
	mov al, 'M'
	mov [gs:(80 * 20 + 41) * 2], ax
	;mov word [dis_pos], 0
	;mov esp, StackTop
	push 0
	popfd
	
	call test
	;hlt	
	; 测试resb是否把堆栈初始化成了0
	push 1
	push 2
	push 3
	;int 0x0D
	;ud2
	;int 0x0

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
	;push edi
	;push esi
	
	mov ah, 0Dh

	;mov esi, [ebp + 4]; ebp + 4，乱码。那么，[ebp + 4]存储的是什么？
	mov esi, [ebp + 8]
	mov edi, [dis_pos]
	;;xchg bx, bx

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
	;;xchg bx, bx
	mov [gs:edi], ax
	add edi, 2
	jmp .1
.4:
	mov [dis_pos], edi
	;pop esi
	;pop edi	
	mov esp, ebp
	pop ebp
	
	
	;ret 1	
	ret

; 打印字符串，设置颜色
disp_str_colour:
	xchg bx, bx
	push ebp
	mov ebp, esp
	;push edi
	;push esi
	;xchg bx, bx	
	mov esi, [ebp + 8]
	; ebp + 4 就是颜色
	;mov eax, [ebp + 4]
	;mov eax, [ebp + 12]
	;mov ax, [ebp + 12]
	mov ah, [ebp + 12]
	;mov eax, [ebp + 12]
	;mov eax, [ebp + 4]
	;mov ah, 0Fh
	mov edi, [dis_pos]
	;mov ah, 0Ah
	;mov al, [ebp + 8]	
	;mov [gs:edi], ax
	;add edi, 2
	;mov al, [ebp + 4]
	;mov [gs:edi], ax
	;add edi, 2
	;mov al, [ebp + 12]
	;mov [gs:edi], ax

	;mov esp, ebp
	;pop ebp
	;ret
	;;xchg bx, bx

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
	mov esp, ebp
	pop ebp
	
	ret
	;ret 2
	
; 内部中断
divide_zero_fault:
	push 0xFFFFFFFF
	push 0
	jmp exception
single_step_fault:
	push 0xFFFFFFFF
	push 1
	jmp exception
non_maskable_interrupt:
	push 0xFFFFFFFF
	push 2
	jmp exception
breakpoint_trap:
	push 0xFFFFFFFF
	push 3
	jmp exception
overflow_trap:
	push 0xFFFFFFFF
	push 4
	jmp exception
bound_range_exceeded_fault:
	push 0xFFFFFFFF
	push 5
	jmp exception
invalid_opcode_fault:
	push 0xFFFFFFFF
	push 6
	jmp exception
coprocessor_not_available_fault:
	push 0xFFFFFFFF
	push 7
	jmp exception
double_fault_exception_abort:
	push 8
	jmp exception
coprocessor_segment_overrun:
	push 0xFFFFFFFF
	push 9
	jmp exception
invalid_task_state_segment_fault:
	push 10
	jmp exception
segment_not_present_fault:
	push 11
	jmp exception
stack_exception_fault:
	push 12
	jmp exception
general_protection_exception_fault:
	push 13
	jmp exception
page_fault:
	push 14
	jmp exception
coprocessor_error_fault:
	push 0xFFFFFFFF
	push 16
	jmp exception
align_check_fault:
	push 17
	jmp exception
simd_float_exception_fault:
	push 0xFFFFFFFF
	push 18
	jmp exception

exception:
	call exception_handler
	add esp, 4 * 2
	hlt



; 外部中断
%macro hwint_master 1
	push %1
	call spurious_irq
	add esp, 4
	hlt	; 奇怪，必须使用hlt结尾，敲击键盘才能触发中断例程
%endmacro

hwint0:
	hwint_master 0
	;ret
hwint1:
	hwint_master 1
	;ret ; 奇怪，这个函数不能用这个结尾。



%macro hwint_slave 1
	push %1
	call spurious_irq
	add esp, 4
%endmacro


; 启动进程
restart:
	mov esp, [proc_table]
	; 加载ldt
	lldt [proc_table + 52]
	; 设置tss.esp0
	lea eax, [proc_table + 52]
	mov [tss + 4], eax 
	; 出栈 	
	pop gs
	pop fs
	pop es
	pop ds

	popad
	
	iretd








