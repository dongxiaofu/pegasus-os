COMMAND +  equ 30h
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
REMOTEBYTECOUNT1 equ COMMAND + 0bh
RECEIVESTATUS equ COMMAND + 0ch
RECEIVECONFIGURATION equ COMMAND + 0ch
TRANSMITCONFIGURATION equ COMMAND + 0dh
FAE TALLY equ COMMAND + 0dh
DATACONFIGURATION equ COMMAND + 0eh
CRC TALLY equ COMMAND + 0eh
INTERRUPTMASK equ COMMAND + 0fh
MISS PKT TALLY equ COMMAND + 0fh
PSTART equ 46h
PSTOP equ 80h
CGroup group Code
Code segment para public ’Code’
assume cs:CGroup, ds:CGroup, es:nothing, ss:nothing
rcr db 0 ;value for Recv config. reg
tcr db 0 ;value for trans. config. reg
dcr db 58h ;value for data config. reg
imr db Obh ;value for intr. mask reg

DriverInitialize proc near
public DriverInitialize
	mov al,21h ;stop mode
	mov dx,COMMAND 
	out dx,a1
	mov a1,dcr
	mov dx,DATACONFIGURATION ;data configuration register
	out dx,a1
	mov dx,REMOTEBYTECOUNT0
	xor a1,a1
	out dx,a1 ;low remote byte count
	mov dx,REMOTEBYTECOUNT1
	out dx,a1 ;high remote byte count
	mov a1,rcr
	mov dx,RECEIVECONFIGURATION ;receive configuration register
	out dx,a1
	mov a1,20h
	mov dx,TRANSMITPAGE ;transmit page start
	out dx,a1
	mov a1,02
	mov dx,TRANSMITCONFIGURATION
	out dx,a1 ;temporarily go into Loopback mode
	mov a1,26h
	mov dx,PAGESTART ;page start
	out dx,a1
	mov dx,BOUNDARY ;boundary register
	out dx,a1
	mov a1,40h
	mov dx,PAGESTOP ;page stop
	out dx,a1
	mov a1,61h ;go to page 1 registers
	mov dx,COMMAND 
	out dx,a1
	mov a1,26h
	mov dx,CURRENT ;current page register
	out dx,a1
	mov a1,22h ;back to page 0, start mode
	mov dx,COMMAND
	out dx,a1
	mov a1,0ffh
	mov dx,INTERRUPTSTATUS ;interrupt status register
	out dx,a1
	mov a1,imr
	mov dx,INTERRUPTMASK ;interrupt mask register
	out dx,a1
	mov dx,TRANSMITCONFIGURATION
	mov a1,tcr
	out dx,a1 ;TCR in norma1 mode, NIC is now
	;ready for reception
	ret
DriverInitialize endp
Code ends
end

