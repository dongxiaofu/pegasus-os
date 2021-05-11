global get_ticks
global write
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
	;;xchg bx, bx
	mov eax, _NR_GET_TICKS
	int INT_VECTOR_TICKS
	ret


; int write(char *buf, int len)
write:
	;;xchg bx, bx
	mov eax, _NR_WRITE
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret


; int write_debug(char *buf, int len);
write_debug:
	xchg bx, bx
	mov eax, _NR_WRITE_DEBUG
	;mov eax, _NR_WRITE
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret

; int send_msg(Message *msg, int receiver_pid)
send_msg:
	mov eax, _NR_SEND_MSG
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret


; int receive_msg(Message *msg, int sender_id)
receive_msg:
	mov eax, _NR_RECEIVE_MSG
	; 第2个参数
	mov ebx, [esp+8]
	; 第1个参数
	mov ecx, [esp+4]

	int INT_VECTOR_TICKS

	ret
