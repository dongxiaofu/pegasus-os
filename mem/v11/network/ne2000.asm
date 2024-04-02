extern net_data
extern net_buf
extern helloStr
extern disp_str
extern disp_str_len
extern debug_ticks

global DriverInitialize
global DriverSend
global PCtoNIC
global NICtoPC
global get_interrupt_status
global set_interrupt_status
global get_curr_page
global SetPageStart

LOOP_NUM equ 32
NET_TEST_DATA equ 0x59
;NET_TEST_DATA equ 0x20

CRDA equ (16 * 1024)
CRDA0 equ (0 * 1024)

LOOP_NUM_LESS equ 256
PAGE_NO	equ 2

Buf times 22  db  0
My_Buf:    db  "Hello,World\0" 
My_Buf_Len	equ $ - My_Buf

COMMAND equ 300h
PAGESTART equ COMMAND + 01
PAGESTOP equ COMMAND + 02
BOUNDARY equ COMMAND + 03
TRANSMITSTATUS equ COMMAND + 04
TRANSMITPAGE equ COMMAND + 04
TRANSMITBYTECOUNT0 equ COMMAND + 05
NCR equ COMMAND + 05
TRANSMITBYTECOUNT1 equ COMMAND + 06
INTERRUPTSTATUS equ COMMAND + 07
CURRENT equ COMMAND + 07 ;in page 1
REMOTESTARTADDRESS0 equ COMMAND + 08
CRDMA0 equ COMMAND + 08
REMOTESTARTADDRESS1 equ COMMAND + 09
CRDMA1 equ COMMAND + 09
REMOTEBYTECOUNT0 equ COMMAND + 0ah
REMOTEBYTECOUNT1 equ COMMAND + 0xb
RECEIVESTATUS equ COMMAND + 0ch
RECEIVECONFIGURATION equ COMMAND + 0ch
TRANSMITCONFIGURATION equ COMMAND + 0dh
FAE_TALLY equ COMMAND + 0dh
DATACONFIGURATION equ COMMAND + 0eh
CRC_TALLY equ COMMAND + 0eh
INTERRUPTMASK equ COMMAND + 0fh
MISS_PKT_TALLY equ COMMAND + 0fh
PSTART equ 46h
PSTOP equ 80h

;rcrc db 0 ;value for Recv config. reg
;rcrc equ 0 ;value for Recv config. reg
rcrc equ 0x10 ;value for Recv config. reg
;tcr db 0 ;value for trans. config. reg
;tcr equ 0b110 ;value for trans. config. reg
;tcr equ 0b110 ;value for trans. config. reg
tcr equ 0 ;value for trans. config. reg
;dcr equ 0x59 ;value for data config. reg
;dcr equ 0b1001001
;dcr equ 0x59
dcr equ 0x59
;dcr equ 59h
;dcr equ 0xb
;imr db Obh ;value for intr. mask reg
;imr db 0xOb ;value for intr. mask reg
;imr equ 0xOb ;value for intr. mask reg
imr equ 0xFb ;value for intr. mask reg

DriverInitialize:
	;保存栈
	push esi
	push edi
	push ebx
	push ebp
	push ecx
	mov ebp, esp

    mov al,21h ;stop mode
    mov dx,COMMAND
    out dx,al
    mov al,dcr
    mov dx,DATACONFIGURATION ;data configuration register
    out dx,al
    mov dx,REMOTEBYTECOUNT0
    xor ax,ax
	mov al, 0
    out dx,al ;low remote byte count
    mov dx,REMOTEBYTECOUNT1
	mov al, 1
    out dx,al ;high remote byte count
    mov al,rcrc
    mov dx,RECEIVECONFIGURATION ;receive configuration register
    out dx,al
    mov al,20h
    mov dx,TRANSMITPAGE ;transmit page start
    out dx,al
    mov al,02
    mov dx,TRANSMITCONFIGURATION
    out dx,al ;temporarily go into Loopback mode
    mov al,40h
    mov dx,PAGESTART ;page start
    out dx,al
    mov dx,BOUNDARY ;boundary register
    out dx,al
    mov al,60h
    mov dx,PAGESTOP ;page stop
    out dx,al
    mov al,61h ;go to page 1 registers
    mov dx,COMMAND
    out dx,al
    mov al,40h
    mov dx,CURRENT ;current page register
    out dx,al
    mov al,22h ;back to page 0, start mode
    mov dx,COMMAND
    out dx,al
    mov al,0ffh
    mov dx,INTERRUPTSTATUS ;interrupt status register
    out dx,al
    mov al,imr
    mov dx,INTERRUPTMASK ;interrupt mask register
    out dx,al
    mov dx,TRANSMITCONFIGURATION
    mov al,tcr
    out dx,al ;TCR in normal mode, NIC is now
    ;ready for reception

	push 16*1024 
	call SetPageStart

	;出栈
	mov esp, ebp
	pop ecx
	pop ebp
	pop ebx
	pop edi
	pop esi
    ret

;***********************************************************************
; DriverSend
; Either transmits a packet passed to it or queues up the
; packet if the transmitter is busy (COMMAND +  register 4 26h).
; Routine is called from upper layer software.
; Entry: ds:si 4l packet to be transmitted
;***********************************************************************
;***********************Equates for NIC Registers***********************
COMMAND  equ 300h
PAGESTART equ COMMAND + 01
PAGESTOP equ COMMAND + 02
BOUNDARY equ COMMAND + 03
TRANSMITSTATUS equ COMMAND + 04
TRANSMITPAGE equ COMMAND + 04
TRANSMITBYTECOUNT0 equ COMMAND + 05
NCR equ COMMAND + 05
TRANSMITBYTECOUNTl equ COMMAND + 06
INTERRUPTSTATUS equ COMMAND + 07
CURRENT equ COMMAND + 07 ;in page l
REMOTESTARTADDRESSO equ COMMAND + 08
CRDMA0 equ COMMAND + 08
REMOTESTARTADDRESSl equ COMMAND + 09
CRDMAl equ COMMAND + 09
REMOTEBYTECOUNT0 equ COMMAND + 0ah
REMOTEBYTECOUNTl equ COMMAND + 0bh
RECEIVESTATUS equ COMMAND + 0ch
RECEIVECONFIGURATION equ COMMAND + 0ch
TRANSMITCONFIGURATION equ COMMAND + 0dh
FAE_TALLY equ COMMAND + 0dh
DATACONFIGURATION equ COMMAND + 0eh
CRC_TALLY equ COMMAND + 0eh
INTERRUPTMASK equ COMMAND + 0fh
MISS_PKT_TALLY equ COMMAND + 0fh
IOPORT equ COMMAND + 010h
PSTART equ 46h
PSTOP equ 80h
TRANSMITBUFFER equ 40h

;void SetPageStart(unsigned int pageStart)
SetPageStart:
	;保存栈
	push esi
	push edi
	push ebx
	push ebp
	push ecx
	mov ebp, esp

	;BX_NE2K_THIS s.remote_dma = BX_NE2K_THIS s.remote_start;
	mov dx, CRDMA0
	xor ax, ax
	;mov ax, CRDA
	;使用SetPageStart的参数pageStart。
	mov ax, [ebp+24]
	out dx, al
	mov dx, CRDMA1
	;and ax, 0b11110000
	and ax, 0xFF00
	shr ax, 8
	out dx, al

	;出栈
	mov esp, ebp
	pop ecx
	pop ebp
	pop ebx
	pop edi
	pop esi
    ret


;void DriverSend(char *buf, unsigned int len);
DriverSend:
	;xchg bx, bx
	;保存栈
	push esi
	push edi
	push ebx
	push ebp
	push ecx
	mov ebp, esp

    ;cli ;disable interrupts
    mov dx,COMMAND
    in al,dx ;read NIC command +  register
    cmp al, 26h ;transmitting?
    je QueueIt ;if so, queue packet
	; cx是多少？
    push cx ;store byte count
	
	; 这是做什么？
	and al, 0b00111111
	out dx, al

	;CRDMA0这个名字有误导性，应该为RSAR0。
	;乍看，和NE2K的使用方法不吻合。看了bochs的NE2K的源码，
	;我才认为CRDMA0有误导性。
	;把CRDA分两次写入NE2K，第一次写入低8位，第二次写入高8位。
	mov dx, CRDMA0
	xor ax, ax
	mov ax, CRDA
	out dx, al
	;上下两个操作的作用是：
	;BX_NE2K_THIS s.remote_dma = BX_NE2K_THIS s.remote_start;
	mov dx, CRDMA1
	and ax, 0xFF00
	shr ax, 8
	out dx, al

	;传递PCtoNIC的参数。
	push dword [ebp + 24] 
    call PCtoNIC ;transfer packet to NIC buffer RAM
	;消除因传递参数增加的栈。
	add esp, 4
    jmp Finished
	;call NICtoPC
	;有什么作用？
	;TPSR
	;BX_NE2K_THIS s.tx_page_start = value;
    mov dx,TRANSMITPAGE
    mov al,TRANSMITBUFFER
	mov ax, CRDA
	shr ax, 8
    out dx,ax ;set NIC transmit page

	;有什么作用？
	;TBCR0
	;BX_NE2K_THIS s.tx_bytes |= (value & 0xff);
    pop cx ;get byte count back
    mov dx,TRANSMITBYTECOUNT0
    mov al,cl
    out dx,al ;set transmit byte count 0 on NIC

	;TBCR1
	;BX_NE2K_THIS s.tx_bytes |= ((value & 0xff) << 8);
    mov dx,TRANSMITBYTECOUNT1
    mov al,ch
    out dx,al ;set transmit byte count 1 on NIC
	;有什么作用？
    mov dx,COMMAND
    mov al,26h
    out dx,al ;issue transmit to COMMAND +  register
    jmp Finished
QueueIt:
	nop
;    call Queue packet
Finished: ;enable interrupts
    ;sti
	;出栈
	mov esp, ebp
	pop ecx
	pop ebp
	pop ebx
	pop edi
	pop esi
    ret

;***********************************************************************
; PCtoNIC
;
; This routine will transfer a packet from the PC’s RAM
; to the local RAM on the NIC card.
;
; assumes: ds: si 4 packet to be transferred
; cx 4 byte count
; ax 4 NIC buffer page to transfer to
;***********************************************************************

MyEnd:
	;出栈
	mov esp, ebp
	pop ecx
	pop ebp
	pop ebx
	pop edi
	pop esi
    ret

;len是数据的长度，单位是字节。
;void PCtoNIC(unsigned int pageStart, unsigned int len); 
PCtoNIC:
	;保存栈
	push esi
	push edi
	push ebx
	push ebp
	push ecx
	mov ebp, esp
	
	;jmp MyEnd

	;获取第二个参数。
	mov ebx, dword [esp + 28]
    mov dx,REMOTEBYTECOUNT0 ; set byte count low byte
    mov al,bl
	;jmp MyEnd
    out dx,al
	;jmp MyEnd
    mov dx,REMOTEBYTECOUNT1 ; set byte count high byte
    mov al,bh
    out dx,al

	;jmp MyEnd
   ; pop ax ; get our page back
   ; mov dx,REMOTESTARTADDRESS0
   ; out dx,al ; set as lo address
   ; mov dx,REMOTESTARTADDRESS1
   ; mov al,ah ; set as hi address
   ; out dx,al
    mov dx,COMMAND
    mov al,12h ; write and start
    out dx,al
    mov dx,IOPORT
	;一次循环写入两个字节，因此，循环次数是字节数/2。
    ;shr cx,1 ; need to loop half as many times
	;获取第二个参数。
	mov cx, dword [esp + 28]
	;inc cx
    shr cx,1 ; need to loop half as many times
	;mov esi, 0xc050d004 
	;不知道这是在做什么。
	mov ax, NET_TEST_DATA
	;mov esi, [net_buf]
	xor esi, esi
	;mov esi, net_buf
	;mov esi, My_Buf
	; 获取参数。
	mov esi, dword [esp + 24]

	;调用SetPageStart，传递参数，消除因传递参数增加的栈。
	push 16*1024 
	;每次调用PCtoNIC都把pageStart设置成16*1024，正确吗？
	call SetPageStart
	add esp, 4
;	mov dx, CRDMA0
;	mov ax, CRDA
;	out dx, al
;	mov al, ah
;	out dx, al
    mov dx,IOPORT

;写入数据到NIC。
	;mov [esi], ax
Writing_Word: ;because of word-wide transfers
	;mov esi, 0xc050d004 
	xor ax, ax
    lodsw ;load word from ds:si
    out dx,ax ;write to IOPORT on NIC board
	;loop的循环次数由cx决定。
    loop Writing_Word
	
;不太理解下面的操作的必要性。
    mov cx,0
    mov dx,INTERRUPTSTATUS
CheckDMA:
    in al,dx
	;当al是40h时，跳转到toNICEND。
    test al,40h ; dma done ???
    jnz toNICEND ; if so, go to NICEND
    jmp CheckDMA ;loop until done
toNICEND:
    mov dx,INTERRUPTSTATUS
    mov al,0xF ;clear DMA interrupt bit in ISR
    out dx,al
	;不清楚为什么要使用这个指令。
    clc

	;出栈
	mov esp, ebp
	pop ecx
	pop ebp
	pop ebx
	pop edi
	pop esi
    ret

;和外面的C函数保持一致的命名风格。
;unsigned char get_interrupt_status()
get_interrupt_status:
	;保存栈
	push esi
	push edi
	push ebx
	push ebp
	push ecx
	mov ebp, esp

	;读取INTERRUPT STATUS REGISTER
    mov dx,INTERRUPTSTATUS
	xor eax, eax
    in al,dx

	;出栈
	mov esp, ebp
	pop ecx
	pop ebp
	pop ebx
	pop edi
	pop esi
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void char get_interrupt_status(unsigned char status)
set_interrupt_status:
	;保存栈
	push esi
	push edi
	push ebx
	push ebp
	push ecx
	mov ebp, esp

	;读取INTERRUPT STATUS REGISTER
    mov dx,INTERRUPTSTATUS
	xor eax, eax
	;mov eax, [ebp + 20]
	mov eax, [ebp + 24]
    out dx,	al

	;出栈
	mov esp, ebp
	pop ecx
	pop ebp
	pop ebx
	pop edi
	pop esi

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;end;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;start get_curr_page;;;;;;;;;;;;;;;;;
;unsigned char get_curr_page()
get_curr_page:
	;保存栈
	push esi
	push edi
	push ebx
	push ebp
	push ecx
	mov ebp, esp
	
    mov al,61h ;go to page 1 registers
    mov dx,COMMAND
    out dx,al

    mov dx,CURRENT
	xor eax, eax
	in al, dx

	;出栈
	mov esp, ebp
	pop ecx
	pop ebp
	pop ebx
	pop edi
	pop esi

	ret
;;;;;;;;;;;;;;;;;end get_curr_page;;;;;;;;;;;;;;;;;



;***********************************************************************
; NICtoPC
;
; This routine will transfer a packet from the RAM
; on the NIC card to the RAM in the PC.
;
; assumes: es: di 4 packet to be transferred
; cx 4 byte count
; ax 4 NIC buffer page to transfer from
;***********************************************************************
;unsigned int NICtoPC(char *buf)
NICtoPC:
	;保存栈
	push esi
	push edi
	push ebx
	push ebp
	push ecx
	mov ebp, esp

	mov bx, LOOP_NUM_LESS
    mov dx,REMOTEBYTECOUNT0
    mov al,bl
    out dx,al
    mov dx,REMOTEBYTECOUNT1
    mov al,bh
    out dx,al
   ; pop ax ; get our page back
   ; mov dx,REMOTESTARTADDRESS0
   ; out dx,al ; set as low address
   ; mov dx,REMOTESTARTADDRESS1
   ; mov al,ah
   ; out dx,al ; set as hi address
    mov dx,COMMAND 
    mov al,0ah ; read and start
    out dx,al
    mov dx,IOPORT

	;push 16*1024 
	;call SetPageStart

    mov dx,IOPORT
    ;shr cx,1 ; need to loop half as many times
	mov cx, LOOP_NUM_LESS
	;inc cx
    shr cx,1 ; need to loop half as many times
	;mov edi, [hello]
	mov edi, Buf
	;[ebb + 24]是NICtoPC的参数buf。
	mov edi, [ebp + 24]
	;mov edi,0xc0503000
READING_Word_NICtoPC: ;because of word-wide transfers
	xor eax, eax
	;xchg bx, bx
	;call debug_ticks
    mov dx,IOPORT
    in ax,dx
    stosw ;read word and store in es:di
	loop READING_Word_NICtoPC

	;xchg bx, bx
;	mov eax, Buf
	;mov eax, My_Buf
;	push 80
;	push eax
;	call disp_str_len
;	add esp, 4

    mov dx,INTERRUPTSTATUS
CheckDMA_NICtoPC:
    in al,dx
    test al,40h
    jnz ReadEnd
    jmp CheckDMA_NICtoPC
ReadEnd:
    out dx,al ; clear RDMA bit in NIC ISR
	;NICtoPC的返回值，是数据的长度。
	mov eax, LOOP_NUM
	;出栈
	mov esp, ebp
	pop ecx
	pop ebp
	pop ebx
	pop edi
	pop esi
    ret
