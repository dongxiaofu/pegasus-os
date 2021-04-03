org	0100h


	jmp	LABEL_START
	nop

	; 下面是 FAT12 磁盘的头
	BS_OEMName	DB 'ForrestY'	; OEM String, 必须 8 个字节
	BPB_BytsPerSec	DW 512		; 每扇区字节数
	BPB_SecPerClus	DB 1		; 每簇多少扇区
	BPB_RsvdSecCnt	DW 1		; Boot 记录占用多少扇区
	BPB_NumFATs	DB 2		; 共有多少 FAT 表
	BPB_RootEntCnt	DW 224		; 根目录文件数最大值
	BPB_TotSec16	DW 2880		; 逻辑扇区总数
	BPB_Media	DB 0xF0		; 媒体描述符
	BPB_FATSz16	DW 9		; 每FAT扇区数
	BPB_SecPerTrk	DW 18		; 每磁道扇区数
	BPB_NumHeads	DW 2		; 磁头数(面数)
	BPB_HiddSec	DD 0		; 隐藏扇区数
	BPB_TotSec32	DD 0		; wTotalSectorCount为0时这个值记录扇区数
	BS_DrvNum	DB 0		; 中断 13 的驱动器号
	BS_Reserved1	DB 0		; 未使用
	BS_BootSig	DB 29h		; 扩展引导标记 (29h)
	BS_VolID	DD 0		; 卷序列号
	BS_VolLab	DB 'OrangeS0.02'; 卷标, 必须 11 个字节
	BS_FileSysType	DB 'FAT12   '	; 文件系统类型, 必须 8个字节

; 三个参数分别是段基址、段界限、段属性
; 分别用 %1、%2、%3表示上面的三个参数
%macro	Descriptor 3
	dw	%2 & 0ffffh
	dw	%1 & 0ffffh
	db	(%1 >> 16) & 0ffh
	db	%3 & 0ffh
	db	((%2 >> 16) & 0fh) | (((%3 >> 8) & 0fh) << 4)
	db	(%1 >> 24) & 0ffh
%endmacro


; 门描述符，四个参数，分别是：目标代码段的偏移量、目标代码段选择子、门描述符的属性、ParamCount
%macro	GateDes	4
	dw	%1 & 0ffffh
	dw	%2 & 0ffffh
	dw	(%4 & 01fh) | ((%3 << 8) & 0ff00h)
	dw	(%1 >> 16) & 0ffffh
%endmacro

; 门
; 门描述符，四个参数，分别是：目标代码段的偏移量、目标代码段选择子、门描述符的属性、ParamCount
%macro Gate 4
	dw	(%1 & 0FFFFh)				; 偏移1
	dw	%2					; 选择子
	dw	(%4 & 1Fh) | ((%3 << 8) & 0FF00h)	; 属性
	dw	((%1 >> 16) & 0FFFFh)			; 偏移2
%endmacro ; 共 8 字节


;	%macro	Descriptor 3
;	dw	0h;%2 & ffffh dw	%1 & ffffh
;	dw	0h;%2 & ffffh dw	%1 & ffffh
;	db	0h;(%1 >> 16) & ffh
;	db	0h;%3 & ffh
;	db	0h;((%2 >> 16) & fh) | (((%3 >> 8) & fh) << 4)
;	db	0h;(%1 >> 24) & ffh
;	%endmacro
;
	LABEL_GDT:	Descriptor  0,	0,	0
	;LABLE_GDT_FLAT_X: Descriptor	0,		0ffffffh,		 0c9ah
	LABLE_GDT_FLAT_X: Descriptor	0,		Seg32Len - 1,		 0c9ah
	;LABLE_GDT_FLAT_X: Descriptor	0,		0ffffffh,		 0c9ah
	LABEL_GDT_TSS	: Descriptor	0,	        LABEL_TSS_LEN - 1,	 0889h	
	LABLE_GDT_STACK_0:Descriptor 0,	        	TopOfStack,              0c92h
	; 3特权等级
	LABLE_GDT_FLAT_X_3: Descriptor	0,		0ffffffh,		 0cf8h
	LABLE_GDT_STACK_3:Descriptor 0,	        	TOP_OF_STACK3,           0cf2h
	LABLE_GDT_FLAT_X_16: Descriptor	0,		0ffffffh,		 98h
	;LABLE_GDT_FLAT_X: Descriptor	0,		0FFFFFh,		 0c9ah
	;LABLE_GDT_FLAT_WR:Descriptor	0,	        0fffffh,	         293h
	LABLE_GDT_FLAT_WR_TEST:Descriptor 5242880,	        0fffffh,	         0c92h
	LABLE_GDT_FLAT_WR_16:Descriptor 0,	        0fffffh,	         0892h
	LABLE_GDT_FLAT_WR:Descriptor	0,	        0fffffh,	         0c92h
	LABLE_GDT_VIDEO: Descriptor	0b8000h,		0ffffh,		 0f2h

	; 门
	LABLE_GDT_GATE: Descriptor	0,		0ffffffh,		 0c9ah
	;LABLE_GATE: GateDes	0,SELECTOR_GDT_GATE,	0c9ah,	0
	;bx_dbg_read_pmode_descriptor: selector 0x0050 points to a system descriptor and is not supported!
	;LABLE_GATE: Gate	0,SELECTOR_GDT_GATE,	0c8ah,	0
	LABLE_GATE: Gate	0,SELECTOR_GDT_GATE,	008ch + 60h,	0

	GdtLen	equ		$ - LABEL_GDT
	GdtPtr	dw	GdtLen - 1
		dd	0
		;dd	BaseOfLoaderPhyAddr + LABEL_GDT
	SelectFlatX	equ	LABLE_GDT_FLAT_X - LABEL_GDT
	SelectStack	equ	LABLE_GDT_STACK_0 - LABEL_GDT
	SelectTss	equ	LABEL_GDT_TSS - LABEL_GDT
	;SelectFlatX_3	equ	LABLE_GDT_FLAT_X_3 - LABEL_GDT
	SelectFlatX_3	equ	LABLE_GDT_FLAT_X_3 - LABEL_GDT + 3
	SelectStack_3	equ	LABLE_GDT_STACK_3 - LABEL_GDT + 3
	;SelectStack_3	equ	LABLE_GDT_STACK_3 - LABEL_GDT
	SelectFlatX_16	equ	LABLE_GDT_FLAT_X_16 - LABEL_GDT
	SelectFlatWR	equ	LABLE_GDT_FLAT_WR - LABEL_GDT
	SelectFlatWR_TEST	equ	LABLE_GDT_FLAT_WR_TEST - LABEL_GDT
	SelectFlatWR_16	equ	LABLE_GDT_FLAT_WR_16 - LABEL_GDT
	SelectVideo	equ	LABLE_GDT_VIDEO - LABEL_GDT + 3
	
	; 门
	SELECTOR_GDT_GATE	equ	LABLE_GDT_GATE - LABEL_GDT
	SelectGate	equ	LABLE_GATE - LABEL_GDT + 3

LABEL_START:
	mov	ax,	cs
	mov	ds,	ax
	;;xchg bx, bx	
	xor		eax,	eax
	mov		ax,		cs
	movzx	eax, ax
	shl		eax,		4
	add		eax,		LABEL_SEG_16

	mov		word [LABLE_GDT_FLAT_X_16+2],	ax
	shr		eax,		16
	mov		byte [LABLE_GDT_FLAT_X_16+4],  al
	mov		byte [LABLE_GDT_FLAT_X_16+7],	ah


	; 门指向的段描述符
	mov     ax,     cs
        mov     ds,     ax
        ;;xchg bx, bx
        xor             eax,    eax
        mov             ax,             cs
        movzx   eax, ax
        shl             eax,            4
        add             eax,           	LABLE_SEG_GDT_GATE


        mov             word [LABLE_GDT_GATE+2],     ax
        shr             eax,            16
        mov             byte [LABLE_GDT_GATE+4],  al
        mov             byte [LABLE_GDT_GATE+7],     ah

	; 3特权级
	mov     ax,     cs
        mov     ds,     ax
        ;;xchg bx, bx
        xor             eax,    eax
        mov             ax,             cs
        movzx   eax, ax
        shl             eax,            4
        add             eax,            LABEL_SEG_PRI3

        mov             word [LABLE_GDT_FLAT_X_3+2],     ax
        shr             eax,            16
        mov             byte [LABLE_GDT_FLAT_X_3+4],  al
        mov             byte [LABLE_GDT_FLAT_X_3+7],     ah


	mov     ax,     cs
        mov     ds,     ax
        ;;xchg bx, bx
        xor             eax,    eax
        mov             ax,             cs
        movzx   eax, ax
        shl             eax,            4
        add             eax,            LABEL_STACK3

        mov             word [LABLE_GDT_STACK_3+2],     ax
        shr             eax,            16
        mov             byte [LABLE_GDT_STACK_3+4],  al
        mov             byte [LABLE_GDT_STACK_3+7],     ah


	; 0特权级的堆栈
	mov     ax,     cs
        mov     ds,     ax
        ;;xchg bx, bx
        xor             eax,    eax
        mov             ax,             cs
        movzx   eax, ax
        shl             eax,            4
        add             eax,            LABLE_STACK

        mov             word [LABLE_GDT_STACK_3+2],     ax
        shr             eax,            16
        mov             byte [LABLE_GDT_STACK_3+4],  al
        mov             byte [LABLE_GDT_STACK_3+7],     ah


	; TSS
	mov     ax,     cs
        mov     ds,     ax
        ;xchg bx, bx
        xor             eax,    eax
        mov             ax,             cs
        movzx   eax, ax
        shl             eax,            4
        add             eax,            LABEL_TSS

        mov             word [LABEL_GDT_TSS+2],     ax
        shr             eax,            16
        mov             byte [LABEL_GDT_TSS+4],  al
        mov             byte [LABEL_GDT_TSS+7],     ah


	; 32位
	mov     ax,     cs
        mov     ds,     ax
        ;xchg bx, bx
        xor             eax,    eax
        mov             ax,             cs
        movzx   eax, ax
        shl             eax,            4
        add             eax,           LABEL_PM_START 

        mov             word [LABLE_GDT_FLAT_X+2],     ax
        shr             eax,            16
        mov             byte [LABLE_GDT_FLAT_X+4],  al
        mov             byte [LABLE_GDT_FLAT_X+7],     ah


	mov		ax,	cs
	mov		[BaseOfLoaderPhyAddr + GO_BACK_REAL_MODEL + 3],	ax
	
	mov ax, 0B800h
	mov gs, ax
	mov ah, 0Ch
	mov al, 'X'
	mov [gs:(80 * 16 + 20)*2], ax


	; 修改IdtPtr的基地址
	xchg bx, bx
	;mov ax, cs
	xor eax, eax
	mov ax, cs
	movzx eax, ax
	shl eax, 4
	add eax, LABEL_IDT

	mov dword [IdtPtr + 2], eax 	

	
	mov ax, BaseOfKernel
	mov es, ax
	;mov ds, ax		; lodsb、lodsw，把[ds:si]中的数据加载到ax中
	mov ax, BaseOfLoader
	mov ds, ax

	; 读取根目录扇区
	mov  ah, 00h
	mov  dl, 0
	int 13h
	mov ax,	FirstSectorOfRootDirectory
	mov cl, 1
	
	mov bx, OffSetOfLoader
	call ReadSector
	;;;;;;xchg bx, bx
	mov cx, 4
	mov bx, (80 * 18 + 40) * 2
	mov di, OffSetOfLoader
	; mov si, LoaderBinFileName
SEARCH_FILE_IN_ROOT_DIRECTORY:
	cmp cx, 0
	jz FILE_NOT_FOUND
	push cx
	;mov ax, cs
	;mov es, ax
	;mov ds, ax	
	; mov si, bx
	; mov di, BaseOfKernel
	mov si, LoaderBinFileName
	;mov cx,	[LoaderBinFileNameLength]
	mov cx, LoaderBinFileNameLength
	mov dx, 0
	;mov bx, (80 * 18 + 40) * 2
	;mov ex, (80 * 25 + 40) * 2
COMPARE_FILENAME:
	;cmp [es:si], [ds:di]
	;cmp [si], [di]
	; 把[ds:si]指向的数据装载到ax/eax/rax中。
	; 在本程序中，es段的数据来源于前面读取的【根目录扇区】。
	; 在本程序中，ds段的数据来源于第74、75行，把ds设置为BaseOfLoader。
	; 所有疑团全部解开，mov si, LoaderBinFileName，[ds:si]指向 "KERNEL  BIN"。
	; cmp al, byte [es:di] 逐字节比较"KERNEL  BIN"和根目录扇区中读取到的文件名。
	; 太惨重的教训！花了两天，才衔接上十多天前写的汇编代码。
	; 一定要写更详细的注释；尽量一气呵成完成汇编代码写的功能。
	lodsb
	cmp al, byte [es:di]
	jnz FILENAME_DIFFIERENT
	dec cx

	inc di
	inc dx
	
	cmp dx, LoaderBinFileNameLength
	jz FILE_FOUND
	jmp COMPARE_FILENAME		
FILENAME_DIFFIERENT:
	mov al, 'Y'
        mov ah, 0Ch
        mov [gs:bx], ax
	add bx, 160

	pop cx		; 在循环中，cx会自动减少吗？
	cmp cx, 0
	dec cx
	jz FILE_NOT_FOUND
	;;;;;;;xchg bx, bx
	and di, 0xFFE0	; 低5位设置为0，其余位数保持原状。回到正在遍历的根目录项的初始位置
	add di, 32	; 增加一个根目录项的大小
	jmp SEARCH_FILE_IN_ROOT_DIRECTORY
FILE_FOUND:
	mov al, 'S'
	mov ah, 0Ah
	mov [gs:(80 * 23 + 35) *2], ax
	;;;;;;xchg bx, bx
	; 修改段地址和偏移量后，获取的第一个簇号错了 
	; 获取文件的第一个簇的簇号
	and di, 0xFFE0  ; 低5位设置为0，其余位数保持原状。回到正在遍历的根目录项的初始位置; 获取文件的第一个簇的簇号
	add di, 0x1A
	mov si, di
	mov ax, BaseOfKernel
	push ds
	mov ds, ax
	;;;;;;xchg bx, bx
	lodsw
	pop ds	
	push ax
	;;;;;;xchg bx, bx	
	; call GetFATEntry
	mov bx, OffSetOfLoader
	; 获取到文件的第一个簇号后，开始读取文件
READ_FILE:
	;;;;;;xchg bx, bx
	push bx
	; push ax
	; 簇号就是FAT项的编号，把FAT项的编号换算成字节数
	;;push bx
	;mov dx, 0
	;mov bx, 3
	;mul bx
	;mov bx, 2
	;div bx			; 商在ax中，余数在dx中
	;mov [FATEntryIsInt], dx
	;
	;; 用字节数计算出FAT项在软盘中的扇区号
	;mov dx, 0
	;mov bx, 512
	;div bx			; 商在ax中，余数在dx中。商是扇区偏移量，余数是在扇区内的字节偏移量
	
	; 簇号就是FAT项的编号，同时也是文件块在数据区的扇区号。
	; 用簇号计算出目标扇区在软盘中的的扇区号。
	add ax, 19
	add ax, 14
	sub ax, 2
		
	; 读取一个扇区的数据 start
	; add ax, SectorNumberOfFAT1
	mov cl, 1
	pop bx	
	call ReadSector
	;;;;xchg bx, bx
        add bx, 512
	jc	.1
	jmp	.2
	; 读取一个扇区的数据 end
.1:
	;;;xchg bx, bx
	push ax
	mov ax, es
	add ax, 0100h
	mov es, ax
	pop ax
.2:
	pop ax
	push bx
	;;;xchg bx, bx
	call GetFATEntry
	;;;xchg bx, bx
	pop bx
	push ax
	cmp ax, 0xFF8
	; 注意了，ax >= 0xFF8 时跳转，使用jc 而不是jz。昨天，一定是在这里弄错了，导致浪费几个小时调试。
	;jz READ_FILE_OVER	
	;jc READ_FILE_OVER	
	;add bx, 2
	jnb READ_FILE_OVER	
	
	;mov al, 'A'
	;inc al
	;mov ah, 0Ah
	;mov [gs:(80 * 23 + 36) *2], ax	
	;;;;;;;xchg bx, bx	
	jmp READ_FILE
	
FILE_NOT_FOUND:
        mov al, 'N'
        mov ah, 0Ah
        mov [gs:(80 * 23 + 36) *2], ax
	jmp OVER

READ_FILE_OVER:
	;mov al, 'O'
	;mov ah, 0Dh
	;mov [gs:(80 * 23 + 33) * 2], ax
	; 开启保护模式 start
	;cli
	;mov dx, BaseOfLoaderPhyAddr + 0	
	;;xchg	bx, bx
	mov 	dword [GdtPtr + 2], BaseOfLoaderPhyAddr + LABEL_GDT
	lgdt [GdtPtr]	

	; 加载TSS
	;mov ax, SelectTss
	;ltr ax
	
	cli
	

	; 加载 Idt
	xchg bx, bx
	lidt [IdtPtr]

	 in al, 92h
	or al, 10b
	out 92h, al

	mov eax, cr0
	or eax, 1
	mov cr0, eax
	;;;xchg bx, bx
	; 真正进入保护模式。这句把cs设置为SelectFlatX	
	;jmp dword SelectFlatX:(BaseOfLoaderPhyAddr + 100h + LABEL_PM_START)
	;jmp dword SelectFlatX:dx
	;;xchg bx, bx
	;jmp dword SelectFlatX:(BaseOfLoaderPhyAddr + LABEL_PM_START)
	jmp dword SelectFlatX:0;
	; 开启保护模式 end


	; 在内存中重新放置内核
	;call InitKernel

	
	;;;;;xchg bx, bx
	;jmp BaseOfKernel:73h
	;jmp BaseOfKernel:61h
	;jmp BaseOfKernel2:400h
	;jmp BaseOfKernel:60h
	;jmp BaseOfKernel:0
	;jmp BaseOfKernel:OffSetOfLoader	
	;jmp BaseOfKernel2:0x30400
	;jmp BaseOfKernel:OffSetOfLoader
	;jmp BaseOfKernel:40h
	;jmp OVER

OVER:

	jmp $

; 从保护模式切换到实模式后，回到这里
IN_REAL_MODEL:
	mov ax, cs
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov fs, ax

	mov ax, 0xb800
	mov gs, ax

	mov al, 'H'
	mov ah, 0Ah
	mov [gs:(80*23+20)*2], ax

	jmp $



BootMessage:	db	"Hello,World OS!"
;BootMessageLength:	db	$ - BootMessage
; 长度，需要使用 equ 
BootMessageLength	equ	$ - BootMessage

; 根目录区的第一个扇区。引导扇区占用一个扇区，每个FAT区占用9个扇区，2个FAT项占用18个扇区。
; 因此，根目录区的第一个扇区是第19个扇区。
; 根目录区所占用的扇区长度不固定，我们的FAT文件系统人为设置它占用的扇区是1个。
; 根目录区占用的扇区的数量由FAT系统中包含的文件数量决定。
FirstSectorOfRootDirectory	equ	19
SectorNumberOfTrack	equ	18
SectorNumberOfFAT1	equ	1

;LoaderBinFileName:	db	"KERNEL  BIN"
LoaderBinFileName:	db	"KERNEL  BIN"
LoaderBinFileNameLength	equ	$ - LoaderBinFileName	; 中间两个空格

FATEntryIsInt	equ 0		; FAT项的字节偏移量是不是整数个字节：0，不是；1，是。
BytesOfSector	equ	512	; 每个扇区包含的字节数量
; 根据FAT项的编号获取这个FAT项的值
GetFATEntry:
	; 用FAT项的编号计算出这个FAT项的字节偏移量 start
	; mov cx, 3
	; mul cx
	; mov cx, 2
	;div cx		; 商在al中，余数在ah中	; 
	push bx
	push ax
	MOV ah, 00h
	mov dl, 0
	int 13h
	
	pop ax	
	mov dx, 0
	mov bx, 3
	mul bx
	mov bx, 2
	div bx
	; 用FAT项的编号计算出这个FAT项的字节偏移量 end
	mov [FATEntryIsInt], dx
	; 用字节偏移量计算出扇区偏移量 start
	mov dx, 0
	; and ax, 0000000011111111b  ; 不知道这句的意图是啥，忘记得太快了！
	; mov dword ax, al ; 错误用法
	; mov cx, [BytesOfSector]
	mov cx, 512
	div cx
	; push dx
	add ax, SectorNumberOfFAT1	; ax 是在FAT1区域的偏移。要把它转化为在软盘中的扇区号，需加上FAT1对软盘的偏移量。
	; mov ah, 00h

	; mov dl, 0
	; int 13h
	; 用字节偏移量计算出扇区偏移量 end
	; mov dword ax, al
	; add ax,1
	mov cl, 2 
	mov bx, 0
	push es
	push dx
	push ax
	mov ax, BaseOfFATEntry
	mov es, ax
	pop ax
	; 用扇区偏移量计算出在某柱面某磁道的扇区偏移量，可以直接调用ReadSector
	call ReadSector
	;pop es
	;;;;;;;;xchg bx, bx
	;pop ax
	;mov ax, [es:bx]
	pop dx
	add bx, dx
	mov ax, [es:bx]
	pop es
	; 根据FAT项偏移量是否占用整数个字节来计算FAT项的值
	cmp byte [FATEntryIsInt], 0
	jz FATEntry_Is_Int
	shr ax, 4	
FATEntry_Is_Int:
	and ax, 0x0FFF
	pop bx
	ret

; 读取扇区
ReadSector:
	push ax
	push bp
	push bx
	mov bp, sp
	sub sp, 2
	mov byte [bp-2], cl
	; push al	; error: invalid combination of opcode and operands
	;push cx
	; mov bx, SectorNumberOfTrack
	
	; ax 存储在软盘中的扇区号
	mov bl, SectorNumberOfTrack	; 一个磁道包含的扇区数
	div bl	; 商在al中，余数在ah中
	mov ch, al
	shr ch, 1	; ch 是柱面号
	mov dh, al
	and dh, 1	; dh 是磁头号
	mov dl, 0	; 驱动器号，0表示A盘
	inc ah
	mov cl, ah
	;add cl, 1	; cl 是起始扇区号
	; pop al		; al 是要读的扇区数量
	mov al, [bp-2]
	add sp, 2
	mov ah, 02h	; 读软盘
	pop bx
	
	;mov bx, BaseOfKernel	; 让es:bx指向BaseOfKernel
	;mov ax, cs
	;mov es, ax
	;;;;;;;;xchg bx, bx
	int 13h
	;pop cx
	;;;;;;;;xchg bx, bx
	; pop bx
	pop bp
	pop ax
	ret	


;
;        mov ch, 0
;        mov cl, 1
;        mov dh, 0
;        mov dl, 0
;        mov al, 1                       ; 要读的扇区数量
;        mov ah, 02h                     ; 读软盘
;        mov bx, BaseOfKernel            ; 让es:bx指向BaseOfKernel
;        int 13h                         ; int 13h 中断
;        ret



; 读取扇区
ReadSector2:
	mov ch, 0
	mov cl, 2
	mov dh, 1
	mov dl, 0
	mov al, 1			; 要读的扇区数量
	mov ah,	02h			; 读软盘
	mov bx,	BaseOfKernel		; 让es:bx指向BaseOfKernel
	int 13h				; int 13h 中断
	ret

; 这些值的设置非常重要。
; 第一，BaseOfLoader 要与boot.asm中的同名标号，值相同。
; 第二，BaseOfKernel 和 BaseOfLoader 的值不能随意设置，有讲究。
; 1>BaseOfKernel 要比 BaseOfLoader 大。否则，内核过大，会覆盖loader.bin。
; 2>BaseOfLoader 和 0x30000 之间要留足空间。否则，loader.bin 会覆盖重新放置后的内核。
; 3>BaseOfKernel 和 0x30000 之间呢？
; 3>0x30000 这个数值，是 Makefile 中编译时设置的：ld -s -Ttext 0x30400  -o kernel.bin  kernel.o -m elf_i386 
;BaseOfKernel	equ	0x8000
BaseOfKernel	equ	0x9000
BaseOfKernel2	equ	0x6000
BaseOfKernel3	equ	0x0
OffSetOfLoader	equ	0x0
BaseOfFATEntry	equ	0x1000
;BaseOfLoader    equ     0x9000
BaseOfLoader    equ     0x2000


BaseOfLoaderPhyAddr	equ	BaseOfLoader * 10h	; LOADER.BIN 被加载到的位置 ---- 物理地址 (= BaseOfLoader * 10h)

[SECTION .s32]

ALIGN	32

[BITS	32]

LABEL_PM_START:
	;;xchg bx, bx
	mov ax, SelectFlatWR
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov ss, ax
	mov ax, SelectVideo
	mov gs, ax
	;;xchg bx, bx
	; 使用门
	;call SelectGate:0 
	;call SELECTOR_GDT_GATE:0

	mov al, 'T'
        mov ah, 0Ah
        ;mov [gs:(80 * 19 + 25) * 2], ax

	; 中断
	call Init_8259A
	;xchg bx, bx
	sti
	int 80h
	;int 20h
	;sti
	jmp $

	mov al, 'K'
        mov ah, 0Ah
        ;mov [gs:(80 * 19 + 25) * 2], ax

	;jmp $

	
	mov ax, SelectTss
	ltr ax

	mov al, 'K'
	mov ah, 0Ah
	mov [gs:(80 * 19 + 25) * 2], ax
	;;xchg bx, bx	
	; 跳入16位模式（保护模式)
	;jmp word SelectFlatX_16:0
	;jmp SelectFlatX_3:0
	push SelectStack_3 
	push TOP_OF_STACK3
	push SelectFlatX_3
	push 0
	retf
	
	; check_cs(0x0012): non-conforming code seg descriptor dpl != cpl, dpl=2, cpl=0
	; 检查特权级时，jmp并没有把cpl更新为目标选择子的rpl；使用retf时，更新后再检查。	
	jmp SelectFlatX_3:0;

	;;xchg bx, bx
	;call InitKernel
	;;xchg bx, bx	

	;mov gs, ax
	mov al, 'G'
	mov ah, 0Ah
	mov [gs:(80 * 19 + 20) * 2], ax
	
	
	; 测试读写5M之上的内存读写 start
	push es
	mov ax, SelectFlatWR_TEST
	mov es, ax
	mov esi, 0
	mov edi, 0
	;;xchg bx, bx
	mov byte [es:edi], 'W'
	mov byte al, [es:edi]
	mov ah, 0Ah
	mov [gs:(80*20 + 20) * 2], ax
	
	mov byte [es:edi], 'Q'
	mov byte al, [es:edi]
	mov [gs:(80*20 + 21) * 2], ax
	
	pop es
	; 测试读写5M之上的内存读写 end


; 中断例程
_Superious_handle:
;Superious_handle  equ	$ - _Superious_handle
Superious_handle  equ	_Superious_handle - $$
;Superious_handle  equ	_Superious_handle - $$ + BaseOfLoaderPhyAddr 
	xchg bx, bx
	mov al, 'A'
	mov ah, 0Ah
	mov [gs:(80*20 + 21)*2], ax
	;;ret
	iretd

	;jmp $
	;jmp $
	;jmp $
	;mov	ah, 0Ch				; 0000: 黑底    1100: 红字
	;mov	al, '!'
	;mov	al, 'V'
	;mov	[gs:((80 * 0 + 75) * 2)], ax	; 屏幕第 0 行, 第 75 列。
	;jmp	$
	iretd

_ClockHandler:
ClockHandler	equ	_ClockHandler - $$
	; error: operation size not specified
	;inc [gs:(80*20 + 21)*2]
	xchg bx, bx
	inc byte [gs:(80*20 + 21)*2]
	mov al, 20h
	out 20h, al
	iretd


; END OF 中断例程



	;jmp SelectFlatX:0x30400
	jmp $
	jmp $
	jmp $
	jmp $


Init_8259A:
	; ICW1
	mov al, 011h
	out 0x20, al
	call io_delay
	
	out 0xA0, al	
	call io_delay
	
	; ICW2
	mov al, 020h
	out 0x21, al
	call io_delay
	
	mov al, 028h
	out 0xA1, al
	call io_delay

	; ICW3
	mov al, 004h
	out 0x21, al
	call io_delay
	
	mov al, 002h
	out 0xA1, al
	call io_delay
	
	; ICW4
	mov al, 001h
	out 0x21, al
	call io_delay

	out 0xA1, al
	call io_delay
	 
	; OCW1
	mov al, 11111110b
	out 0x21, al
	call io_delay

	mov al, 11111111b
	out 0xA1, al
	call io_delay
	;OCW2
;	mov al, 11111110b
;	out 0x21, al
;	call io_delay
;
;	mov al, 11111111b
;	out 0xA1, al		
;	call io_delay
	ret

io_delay:
	nop
	nop
	nop
	nop
	ret

Seg32Len equ $ - LABEL_PM_START



; 重新放置内核
InitKernel:
	push eax
	push ecx
	push esi
	;;;xchg bx, bx
	;程序段的个数
	;mov cx, word ptr ds:0x802c
	mov cx, [BaseOfKernelPhyAddr + 2CH]
	movzx ecx, cx
	;程序头表的内存地址
	xor esi, esi
	mov esi, [BaseOfKernelPhyAddr + 1CH]
	add esi, BaseOfKernelPhyAddr
	;;xchg bx, bx

.Begin:
	mov eax, [esi + 10H]
	push eax

	mov eax, BaseOfKernelPhyAddr
	add eax, [esi + 4H]
	push eax
	mov eax, [esi + 8H]
	push eax
	call Memcpy
	;;xchg bx, bx
	; 三个参数（每个占用32位，4个字节，2个字），占用6个字,12个字节
	add esp, 12
	dec ecx
	cmp ecx, 0
	jz .NoAction
	add esi, 20H
	jmp .Begin

.NoAction:
	;;;xchg bx, bx
	pop esi
	pop ecx
	pop eax

	ret


; Memcpy(p_vaddr, p_off, p_size)
Memcpy:
	;;xchg bx, bx
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

	;;xchg bx, bx
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
	dec ecx

	cmp ecx, 0
	jz .2
	jmp .1

.2:
	;;xchg bx, bx
	;pop es
	mov eax, [ebp + 8]

	pop edi
	pop esi
	pop ecx
	pop eax
	pop ebp

	ret



BaseOfKernelPhyAddr	equ	BaseOfKernel * 10h  ; Kernel.BIN 被加载到的位置 ---- 物理地址 中的段基址部分

[SECTION .s16]
[BITS 16]
LABEL_SEG_16:
	;;xchg bx, bx
	mov ax, 	SelectFlatWR_16
	mov es,	ax
	mov ss, ax
	mov fs, ax
	mov ds, ax
	
	; 必须先切换到实模式，跳转才生效
	in al, 92h
	and al,	11111101b
	out 92h, al

	mov eax, cr0
	and eax,0xfffffffe
	mov cr0, eax		
GO_BACK_REAL_MODEL:
	jmp 0:IN_REAL_MODEL



[SECTION .s32]
[BITS 32]

LABEL_SEG_PRI3:
	;;xchg bx, bx
	mov ax, cs
	;mov ds, ax
	;mov es, ax
	;mov ss, ax
	;mov fs, ax

	mov al, '3'
	mov ah, 0Ah
	mov [gs:(80*24+25)*2], ax

	; 使用调用门，从低特权级向高特权级转移	
	call SelectGate:0;

	jmp $



;堆栈
[SECTION .s3]
ALIGN 32
[BITS 32]

LABEL_STACK3:
	times	512	db	0

TOP_OF_STACK3	equ	$ - LABEL_STACK3 - 1

;门
;[SECTION .gate]
;ALIGN 32
;[BITS 32]
;
;LABLE_SEG_GDT_GATE:
;	jmp $
;	jmp $
;	mov al, 'T'
;	mov ah, 0Ah
;	mov [gs:(80*24 + 25)*2], ax
;
;	ret


[SECTION .sdest]; 调用门目标段
[BITS	32]

LABLE_SEG_GDT_GATE:
	;jmp	$
	mov	ax, SelectVideo
	mov	gs, ax			; 视频段选择子(目的)

	mov	edi, (80 * 12 + 0) * 2	; 屏幕第 12 行, 第 0 列。
	mov	ah, 0Ch			; 0000: 黑底    1100: 红字
	mov	al, 'C'
	mov	[gs:edi], ax

	mov	edi, (80 * 12 + 1) * 2
	mov	ah, 0Bh
	mov 	al, 'D'
	mov	[gs:edi], ax

	retf

SegCodeDestLen	equ	$ - LABLE_SEG_GDT_GATE
; END of [SECTION .sdest]

[SECTION .stack0]
[BITS 32]

LABLE_STACK:
	times	512	db	0
LABLE_LEN	equ	$ - LABLE_STACK
TopOfStack	equ	LABLE_LEN - 1
; END of [SECTION .stack0]


[SECTION .tss]
[BITS 32]

LABEL_TSS:
	DD	0
	DD	TopOfStack
	DD	SelectStack
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0	; cr3
	DD	0	; EIP
	DD	0	; eflags
	DD	0	; eax
	DD	0	; ecx
	DD	0	; edx
	DD	0	; ebx
	DD	0	; esp
	DD	0	; ebp
	DD	0	; esi
	DD	0	; edi
	DD	0	; es
	DD	0	; cs
	DD	0	; ss
	DD	0	; ds
	DD	0	; fs
	DD	0	; gs
	DD	0	; ldt
	DD	$ - LABEL_TSS + 2
LABEL_TSS_LEN	equ	$ - LABEL_TSS
; END OF [SECTION .tss]

; 门描述符，四个参数，分别是：目标代码段的偏移量、目标代码段选择子、门描述符的属性、ParamCount
; 属性是 1110，或者是0111。不确定是小端法或大端法，所以有两种顺序的属性。
; 属性是 0111 0001。错误.
; 属性应该是 1000 1110
[SECTION .idt]
ALIGN 32
[BITS 32]
LABEL_IDT:
%rep	32
	Gate	Superious_handle, SelectFlatX, 08Eh, 0 ; 属性是 1110，或者是0111。不确定是小端法或大端法，所以有两种顺序的属性。 
%endrep
.20h:	Gate	ClockHandler,	SelectFlatX, 08Eh, 0
;.80h:	Gate	ClockHandler,	SelectFlatX, 08Eh, 0
%rep 222
	Gate    Superious_handle, SelectFlatX, 08Eh, 0
%endrep
IDT_LEN	equ	$ - LABEL_IDT
IdtPtr	dw	IDT_LEN - 1
	dd	0
;END OF [SECTION .idt]

