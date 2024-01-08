global DriverInitialize
global DriverSend
global PCtoNIC
global NICtoPC


COMMAND equ 10h
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
rcrc equ 0 ;value for Recv config. reg
;tcr db 0 ;value for trans. config. reg
tcr equ 0 ;value for trans. config. reg
;dcr db 58h ;value for data config. reg
dcr equ 58h
;imr db Obh ;value for intr. mask reg
;imr db 0xOb ;value for intr. mask reg
;imr equ 0xOb ;value for intr. mask reg
imr equ 11 ;value for intr. mask reg

DriverInitialize:
    mov al,21h ;stop mode
    mov dx,COMMAND
    out dx,al
    mov al,dcr
    mov dx,DATACONFIGURATION ;data configuration register
    out dx,al
    mov dx,REMOTEBYTECOUNT0
    xor al,al
    out dx,al ;low remote byte count
    mov dx,REMOTEBYTECOUNT1
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
    mov al,26h
    mov dx,PAGESTART ;page start
    out dx,al
    mov dx,BOUNDARY ;boundary register
    out dx,al
    mov al,40h
    mov dx,PAGESTOP ;page stop
    out dx,al
    mov al,61h ;go to page 1 registers
    mov dx,COMMAND
    out dx,al
    mov al,26h
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
    ret

;***********************************************************************
; DriverSend
; Either transmits a packet passed to it or queues up the
; packet if the transmitter is busy (COMMAND +  register 4 26h).
; Routine is called from upper layer software.
; Entry: ds:si 4l packet to be transmitted
;***********************************************************************
;***********************Equates for NIC Registers***********************
COMMAND  equ 10h
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


DriverSend:
    cli ;disable interrupts
    mov dx,COMMAND
    in al,dx ;read NIC command +  register
    cmp al, 26h ;transmitting?
    je QueueIt ;if so, queue packet
    push cx ;store byte count
    mov ah,TRANSMITBUFFER
    xor al,al ;set page to transfer packet to
    call PCtoNIC ;transfer packet to NIC buffer RAM
    mov dx,TRANSMITPAGE
    mov al,TRANSMITBUFFER
    out dx,al ;set NIC transmit page
    pop cx ;get byte count back
    mov dx,TRANSMITBYTECOUNT0
    mov al,cl
    out dx,al ;set transmit byte count 0 on NIC
    mov dx,TRANSMITBYTECOUNT1
    mov al,ch
    out dx,al ;set transmit byte count 1 on NIC
    mov dx,COMMAND
    mov al,26h
    out dx,al ;issue transmit to COMMAND +  register
    jmp Finished
QueueIt:
	nop
;    call Queue packet
Finished: ;enable interrupts
    sti
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

PCtoNIC:
    push ax ; save buffer address
    inc cx ; make even
    and cx,0fffeh
    mov dx,REMOTEBYTECOUNT0 ; set byte count low byte
    mov al,cl
    out dx,al
    mov dx,REMOTEBYTECOUNT1 ; set byte count high byte
    mov al,ch
    out dx,al
    pop ax ; get our page back
    mov dx,REMOTESTARTADDRESS0
    out dx,al ; set as lo address
    mov dx,REMOTESTARTADDRESS1
    mov al,ah ; set as hi address
    out dx,al
    mov dx,COMMAND
    mov al,12h ; write and start
    out dx,al
    mov dx,IOPORT
    shr cx,1 ; need to loop half as many times
Writing_Word: ;because of word-wide transfers
    lodsw ;load word from ds:si
    out dx,ax ;write to IOPORT on NIC board
    loop Writing_Word
    mov cx,0
    mov dx,INTERRUPTSTATUS
CheckDMA:
    in al,dx
    test al,40h ; dma done ???
    jnz toNICEND ; if so, go to NICEND
    jmp CheckDMA ;loop until done
    toNICEND:
    mov dx,INTERRUPTSTATUS
    mov al,40h ;clear DMA interrupt bit in ISR
    out dx,al
    clc
    ret

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
NICtoPC:
    push ax ; save buffer address
    inc cx ; make even
    and cx,0fffeh
    mov dx,REMOTEBYTECOUNT0
    mov al,cl
    out dx,al
    mov dx,REMOTEBYTECOUNT1
    mov al,ch
    out dx,al
    pop ax ; get our page back
    mov dx,REMOTESTARTADDRESS0
    out dx,al ; set as low address
    mov dx,REMOTESTARTADDRESS1
    mov al,ah
    out dx,al ; set as hi address
    mov dx,COMMAND 
    mov al,0ah ; read and start
    out dx,al
    mov dx,IOPORT
    shr cx,1 ; need to loop half as many times
Writing_Word_NICtoPC: ;because of word-wide transfers
    in ax,dx
    stosw ;read word and store in es:di
	loop Writing_Word_NICtoPC
    mov dx,INTERRUPTSTATUS
CheckDMA_NICtoPC:
    in al,dx
    test al,40h
    jnz ReadEnd
    jmp CheckDMA_NICtoPC
ReadEnd:
    out dx,al ; clear RDMA bit in NIC ISR
    ret
