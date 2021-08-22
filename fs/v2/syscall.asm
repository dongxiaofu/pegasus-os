global get_ticks
global write2
global write_debug
global send_msg
global receive_msg

[section .data]
_NR_GET_TICKS	equ	0
_NR_WRITE	equ	1
_NR_WRITE_DEBUG	equ	2
_NR_SEND_MSG	equ		3
_NR_RECEIVE_MSG	equ		4
INT_VECTOR_TICKS	equ	0x90

[section .text]

;使用ICP改写了
get_ticks:
	;;;;xhcg bx, bx
	mov eax, _NR_GET_TICKS
	int INT_VECTOR_TICKS
	ret


; int write2(char *buf, int len)
write2:
	;;;;xhcg bx, bx
	mov eax, _NR_WRITE
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret


; int write_debug(char *buf, int len);
write_debug:
	;;xhcg bx, bx
	mov eax, _NR_WRITE_DEBUG
	;mov eax, _NR_WRITE
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret

; int send_msg(Message *msg, int receiver_pid)
send_msg2:
	mov eax, _NR_SEND_MSG
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret

; int send_msg(Message *msg, int receiver_pid)
send_msg:
	push	ebp
	mov	ebp,	esp
;	push	eax
	push	ebx
	push	ecx

	

	mov eax, _NR_SEND_MSG
	; 第2个参数
	mov ebx, [ebp+12]
	; 第1个参数
	mov ecx, [ebp+8]

	int INT_VECTOR_TICKS

	pop	ecx
	pop	ebx
;	push	eax
	pop	ebp

	ret

; int receive_msg(Message *msg, int sender_id)
receive_msg2:
	mov eax, _NR_RECEIVE_MSG
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret

; int receive_msg(Message *msg, int sender_id)
receive_msg:
	push	ebp
	mov	ebp,	esp
;	push	eax
	push	ebx
	push	ecx


	mov eax, _NR_RECEIVE_MSG
	; 第2个参数
	mov ebx, [ebp+12]
	; 第1个参数
	mov ecx, [ebp+8]

	int INT_VECTOR_TICKS

	pop	ecx
	pop	ebx
;	pop	eax
	pop	ebp

	ret
