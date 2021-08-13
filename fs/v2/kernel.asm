[section .bss]
Stack	resb	1024*2
;Stack	resb	1024*1024
;Stack	resb	1024*1024*16
;Stack	resb	1024*2
StackTop:
; TSS选择子
TSS_SELECTOR	equ	0x40
[section .data]
msg1	db	"esp:", "$"
msg2	db	"tss.esp0:", "$"
; 系统调用
extern sys_call_table


[section .text]
extern gdt_ptr
extern idt_ptr
extern tss
extern proc_table
extern ticks
extern proc_ready_table
extern k_reenter

extern ReloadGDT
extern exception_handler

extern dis_pos
extern test
extern spurious_irq
extern kernel_main
extern clock_handler
extern disp_int
extern keyboard_handler
extern hd_handle

global disp_str
global disp_str_colour
global _start
global InterruptTest
global restart
global in_byte
global out_byte
; 关闭中断
global disable_int:
; 打开中断
global enable_int


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
; 系统调用
global sys_call

; 内部中断
global hwint0
global hwint1
; 硬盘中断
global hwint14

; 打开8259A的级联中断
global enable_8259A_casecade_irq
; 关闭8259A的级联中断
global disable_8259A_casecade_irq
; 打开8259A的从片的硬盘中断
global enable_8259A_slave_winchester_irq
; 关闭8259A的从片的硬盘中断
global disable_8259A_slave_winchester_irq


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
	xchg bx, bx	
	;mov word [dis_pos], 0
	mov dword [dis_pos], 0
	mov ah, 0Bh
	mov al, 'L'
	mov [gs:(80 * 20 + 40) * 2], ax
	
	mov esp, StackTop
	mov word [dis_pos], 0
	xchg bx, bx
	sgdt [gdt_ptr]
	call ReloadGDT
	lgdt [gdt_ptr]
	lidt [idt_ptr]
	jmp 0x8:csinit
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
	xchg bx, bx
	jmp kernel_main
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

; 中断例程
InterruptTest:
	mov ah, 0Dh
	mov al, 'T'
	mov [gs:(80 * 20 + 42)*2], ax
	ret


; 打印字符串
disp_str:
	;;;;xhcg bx, bx
	push ebp
	mov ebp, esp
	;push edi
	;push esi
	
	mov ah, 0Dh

	;mov esi, [ebp + 4]; ebp + 4，乱码。那么，[ebp + 4]存储的是什么？
	mov esi, [ebp + 8]
	mov edi, [dis_pos]
	;;;;;;;;xhcg bx, bx

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
	;;;;;;;;xhcg bx, bx
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
	;;;;;xhcg bx, bx
	push ebp
	mov ebp, esp
	;push edi
	;push esi
	;;;;;;;xhcg bx, bx	
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
	;;;;;;;;xhcg bx, bx

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
	;;;;;;xhcg bx, bx
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
	;xhcg bx, bx
	;inc byte [gs:(80*20 + 41)*2]
        ; 发送EOF
        ;mov al, 20h
        ;out 20h, al
	;iretd
	;hwint_master 0
	;ret
	; 建立快照
	pushad
	push ds
	push es
	push fs
	push gs

	mov dx, ss
	mov ds, dx
	mov es, dx
	mov fs, dx
	;;xhcg bx, bx	
	mov al, 11111101b
	out 21h, al
	; 置EOI位 start
	mov al, 20h
	out 20h, al	
	; 置EOI位 end
	inc dword [k_reenter]
	cmp dword [k_reenter], 0
	jne .2
.1:
	mov esp, StackTop
.2:
	sti
	call clock_handler
	mov al, 11111100b
	out 21h, al
	cli	
	cmp dword [k_reenter], 0
	jne reenter_restore
	jmp restore


hwint1:
	;hwint_master 1
	;ret ; 奇怪，这个函数不能用这个结尾。
	;in al, 0x60
	;push ax
	;call disp_int
	;add esp, 4
	;ret

	; 建立快照
	pushad
	push ds
	push es
	push fs
	push gs
	

	mov dx, ss
	mov ds, dx
	mov es, dx
	mov fs, dx

	mov al, 11111110b
	out 21h, al
	mov al, 20h
	out 20h, al


	inc dword [k_reenter]
	cmp dword [k_reenter], 0
	jne .2
.1:
	mov esp, StackTop
.2:
	sti	
	;inc dword [k_reenter]
	; 中间代码
	;mov esp, StackTop
	;;;;;xhcg bx, bx
	call keyboard_handler
	;;;;;xhcg bx, bx
	mov al, 11111100b
	out 21h, al
	cli
	;dec dword [k_reenter]
	;;;;;xhcg bx, bx
	; 没有比较，为啥用jne？因为这是修改之前的代码后遗漏的地方.
	; 导致键盘缓冲区出现Invalid Code。
	;jne restore
	;jmp restore
	cmp dword [k_reenter], 0
	;je restore
	jne reenter_restore
	jmp restore

; 硬盘中断
hwint14:
	; 建立快照
	pushad
	push ds
	push es
	push fs
	push gs

	mov dx, ss
	mov ds, dx
	mov es, dx
	mov fs, dx

	; 禁用硬盘中断
	call disable_8259A_slave_winchester_irq

	; master置EOI位 start
	mov al, 20h
	out 20h, al	
	; master置EOI位 end

	; slave置EOI位 start
	;mov al, A0h ; symbol `A0h' not defined
	mov al, 0xA0
	out 0xA0, al	
	; slave置EOI位 end

	inc dword [k_reenter]
	cmp dword [k_reenter], 0
	jne .2
.1:
	mov esp, StackTop
.2:
	sti	
	; 调用硬盘中断
	call hd_handle
	
	; 打开硬盘中断
	call enable_8259A_slave_winchester_irq

	cli
	cmp dword [k_reenter], 0
	jne reenter_restore
	jmp restore


%macro hwint_slave 1
	push %1
	call spurious_irq
	add esp, 4
%endmacro



; 系统调用中断 start
sys_call:
	; 建立快照
	pushad
	push ds
	push es
	push fs
	push gs
	;;xhcg bx, bx	
	; 中间代码修改eax使用
	; 从gs到eax，距离是多少个字节？11个	
	; 中间代码修改eax使用
	mov esi, esp
	;mov edx, esp
	
	mov dx, ss
	mov ds, dx
	mov es, dx	
	mov fs, dx
	
	;;xchg bx, bx
	inc dword [k_reenter]
	cmp dword [k_reenter], 0
	jne .2
.1:
	mov esp, StackTop 
.2:
	sti
	;inc dword [k_reenter]
	; 中间代码
	; 需要切换到内核栈吗？
	;mov esp, StackTop 
	push esi
	;dec dword [k_reenter]
	;push dword proc_ready_table
	push dword [proc_ready_table]
	push ebx
	push ecx
	;;xchg bx, bx
	call [sys_call_table + 4 * eax]
	; 修改请求系统调用的进程的进程表中的堆栈
	; 获取堆栈中的eax是个难题：
	; 1. 怎么获取进程表的堆栈？proc_ready_table不能用，esp指向的不是堆栈的最开始位置
	; 2. 	
	;;xhcg bx, bx
	;pop esi
	add esp, 12
	pop esi
	mov [esi + 11 * 4], eax
	;mov [esi + 12 * 4], eax
	;pop esi
	;;xchg bx, bx
	;cli
	; 恢复进程。不能使用restart，因为，不能使用proc_ready_table
	; jmp restart	
	;sub esi, 68
	;mov esp, esi
	;dec dword [k_reenter]
	cmp dword [k_reenter], 0
	;je restore
	jne reenter_restore
	jmp restore

	;mov esp, [proc_ready_table]
	;lldt [esp + 68]
	;lea eax, [esp + 68]
	;mov dword [tss + 4], eax
	;
	;pop gs
	;pop fs
	;pop es
	;pop ds
	;popad
	;
	;iretd

; 系统调用中断 end

; 启动进程
restart:
	;mov esp, [proc_table]
	;mov eax, proc_table
	;mov esp, eax
	; 加载ldt
	;lldt [proc_table + 52]
	;lldt [proc_table + 64]
	;lldt [proc_table + 68]
	; 不能放到前面
	dec dword [k_reenter]
	mov esp, [proc_ready_table]
	lldt [esp + 68]
	;lldt [proc_table + 56]
	; 设置tss.esp0
	;lea eax, [proc_table + 52]
	;lea eax, [proc_table + 56]
	;lea eax, [proc_table + 68]
	lea eax, [esp + 68]
	mov [tss + 4], eax 
	; 出栈 	
	pop gs
	pop fs
	pop es
	pop ds

	popad
	iretd

; 恢复进程
restore:
	;;;;xhcg bx, bx
	;mov esp, [proc_table]
	;mov eax, proc_table
	;mov esp, eax
	; 加载ldt
	;lldt [proc_table + 52]
	;lldt [proc_table + 64]
	;lldt [proc_table + 68]
	;dec word [k_reenter]
	;;;;;xhcg bx, bx
	; 能放到前dword 面，和其他函数在形式上比较相似
	;dec dword [k_reenter]
	mov esp, [proc_ready_table]
	lldt [esp + 68]
	;lldt [proc_table + 56]
	; 设置tss.esp0
	;lea eax, [proc_table + 52]
	;lea eax, [proc_table + 56]
	;lea eax, [proc_table + 68]
	lea eax, [esp + 68]
	mov dword [tss + 4], eax 
reenter_restore:
	dec dword [k_reenter]
	; 出栈 	
	pop gs
	pop fs
	pop es
	pop ds

	;;xchg bx, bx
	popad
	;;xchg bx, bx
	iretd

in_byte:
	xor edx, edx
	mov edx, [esp + 4]
	xor eax, eax
	;xhcg bx, bx
	in al, dx
	;movzx eax, al
	;in ax, dx
	nop
	nop

	ret

;实现这个函数，疑点很多。
;1.在函数内修改了edx、eax，需要把它们放入堆栈吗？于上神没有这样做。
;2.写入的数据是一个字节，out dx,al使用al还是ax？断点调试再看。
;out_byte(int port, char ch)
out_byte:
	xor edx, edx
	xor eax, eax
	
	mov edx, [esp + 4]	; port
	mov eax, [esp + 8]	; ch

	out dx, al

	nop
	nop
	nop
	nop

	ret




; 读取一个字节
in_byte2:
	;xhcg bx, bx
	;mov ebp, esp
	push ebp
	mov ebp, esp
	push edx
	;push ax
	; 必须有这两句，才能让中断多次发生。	
	; 放到中断例程中
	;mov al, 20h
	;out 20h, al	

	; in_byte的参数
	xor edx, edx
	mov dx, [ebp + 8]
	xor eax, eax
	;in byte al, [ebp + 8]
	; error: invalid combination of opcode and operands
	; 不能用bx，原因未知
	;in al, bx
	in al, dx
	;and al, 0xFF	
	;in eax, dx
	;movzx eax, al
	nop
	nop

	;pop ax
	pop ebx
	pop ebp
	ret

; 打开中断
disable_int:
	cli
	ret

; 关闭中断
enable_int:
	sti
	ret

; 检查tss.esp0和CPU使用 堆栈是否一致
check_tss_esp0:
	push ebp
	mov ebp, esp
	; CPU选择的堆栈
	mov eax, [ebp+8]
	; 出现错误的中断种类
	mov ebx, [ebp+12]

	add eax, 68
	; tss中的堆栈
	mov edx, [tss+4]
	cmp eax, edx
	;pop ebp
	;ret
	; 二者相等就跳转到2
	je .2
.1:
	; 打印错误的堆栈
	push eax
	push edx
	;mov word [dis_pos], 0
	push dword msg1
	call disp_str
	add esp, 4
	pop edx
	pop eax

	; 打印中断种类
	push dword edx	
	push dword eax
	push dword ebx
	call disp_int
	add esp, 4
	pop eax
	pop edx

	push dword edx	
	push dword eax
	call disp_int
	pop eax
	pop edx

	push dword edx	
	push dword eax
	push dword [k_reenter]
	call disp_int
	add esp, 4
	pop eax
	pop edx

	; 打印tss.esp0中的eip
	push dword edx	
	push dword eax
	push dword [edx - 20]
	call disp_int
	add esp, 4
	pop eax
	pop edx


	; 打印cpu选择的esp中的eip
	push dword edx	
	push dword eax
	push dword [eax - 20]
	call disp_int
	add esp, 4
	pop eax
	pop edx
	
	; 打印proc_ready_table
	push dword edx	
	push dword eax
	push dword [proc_ready_table]
	call disp_int
	add esp, 4
	pop eax
	pop edx

	;打印StackTop
	push dword edx	
	push dword eax
	push dword StackTop
	call disp_int
	add esp, 4
	pop eax
	pop edx

	pop ebp
	;hlt
	ret
.2:
	pop ebp
	ret	


enable_8259A_casecade_irq:
	push ax

	in  al, 0x21
	and  al, ~(1<<2)
	out 0x21, al
	
	pop ax
	ret

disable_8259A_casecade_irq:
	push ax

	in al, 0x21
	or al, 1<<2
	out 0x21, al
	
	pop ax
	ret

enable_8259A_slave_winchester_irq:
	push ax

	in al, 0xA1
	or al, ~(1<<6)
	out 0xA1, al

	pop ax
	ret

disable_8259A_slave_winchester_irq:
	push ax	
	
	in al, 0xA1
	or al, 1 << 6	
	out 0xA1, al

	pop ax
	ret
