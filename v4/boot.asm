org 0x7c00

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


LABEL_START:
	mov ax,	0B800h
	mov gs,	ax
	;;xchg bx, bx	
	mov ax, BaseOfLoader
	mov es, ax
	;mov ds, ax		; lodsb、lodsw，把[ds:si]中的数据加载到ax中

	mov  ah, 00h
	mov  dl, 0
	int 13h
	mov ax,	FirstSectorOfRootDirectory
	mov cl, 1
	
	mov bx, OffSetOfLoader
	call ReadSector
	;;;xchg bx, bx
	mov cx, 3
	
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
	; mov di, BaseOfLoader
	mov si, LoaderBinFileName
	;;xchg bx, bx
	;mov cx,	[LoaderBinFileNameLength]
	mov cx, LoaderBinFileNameLength
	mov dx, 0
	mov bx, (80 * 18 + 40) * 2
	;mov ex, (80 * 25 + 40) * 2
COMPARE_FILENAME:
	;cmp [es:si], [ds:di]
	;cmp [si], [di]
	;;xchg bx, bx
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
	mov al, 'D'
        mov ah, 0Ah
        mov [gs:(80 * 24 + 40) *2], ax


	pop cx		; 在循环中，cx会自动减少吗？
	cmp cx, 0
	dec cx
	jz FILE_NOT_FOUND
	and di, 0xFFE0	; 低5位设置为0，其余位数保持原状。回到正在遍历的根目录项的初始位置
	add di, 32	; 增加一个根目录项的大小
	jmp SEARCH_FILE_IN_ROOT_DIRECTORY
FILE_FOUND:
	mov al, 'S'
	mov ah, 0Ah
	mov [gs:(80 * 24 + 35) *2], ax
	; 修改段地址和偏移量后，获取的第一个簇号错了 
	; 获取文件的第一个簇的簇号
	and di, 0xFFE0  ; 低5位设置为0，其余位数保持原状。回到正在遍历的根目录项的初始位置; 获取文件的第一个簇的簇号
	add di, 0x1A
	mov si, di
	mov ax, BaseOfLoader
	push ds
	mov ds, ax
	lodsw
	pop ds	
	push ax
	;;xchg bx, bx	
	; call GetFATEntry
	mov bx, OffSetOfLoader
	; 获取到文件的第一个簇号后，开始读取文件
READ_FILE:
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
	;;;xchg bx, bx
        add bx, 512
	; 读取一个扇区的数据 end
	
	;jmp READ_FILE_OVER
		
	pop ax
	push bx
	call GetFATEntry
	pop bx
	push ax
	cmp ax, 0xFF8
	; 注意了，ax >= 0xFF8 时跳转，使用jc 而不是jz。昨天，一定是在这里弄错了，导致浪费几个小时调试。
	;jz READ_FILE_OVER	
	;jc READ_FILE_OVER	
	jnb READ_FILE_OVER	
	
	jmp READ_FILE
	
FILE_NOT_FOUND:
        mov al, 'N'
        mov ah, 0Ah
        mov [gs:(80 * 24 + 36) *2], ax
	jmp OVER

READ_FILE_OVER:
	
	; 簇号就是FAT项的编号，同时也是文件块在数据区的扇区号。
	; 用簇号计算出目标扇区在软盘中的的扇区号。
	add ax, 19
	add ax, 14
	sub ax, 2

	; 读取一个扇区的数据 start
	; add ax, SectorNumberOfFAT1
	mov cl, 1
	;pop bx	
	;call ReadSector
	;;xchg bx, bx
    	;add bx, 512
	; 读取一个扇区的数据 end

	mov al, 'O'
	mov ah, 0Ah
	mov [gs:(80 * 24 + 33) * 2], ax
	
	;xchg bx, bx
	jmp BaseOfLoader:OffSetOfLoader	
	jmp OVER

OVER:

	jmp $

BootMessage:	db	"Hello,World OS!"
;BootMessageLength:	db	$ - BootMessage
; 长度，需要使用 equ 
BootMessageLength	equ	$ - BootMessage

FirstSectorOfRootDirectory	equ	19
SectorNumberOfTrack	equ	18
SectorNumberOfFAT1	equ	1

LoaderBinFileName:	db	"LOADER  BIN"
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
	;;;xchg bx, bx
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
	ret

; 读取扇区
ReadSector:
	push ax
	push bp
	push bx
	mov bp, sp
	sub esp, 2
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
	add esp, 2
	mov ah, 02h	; 读软盘
	pop bx
	
	;mov bx, BaseOfLoader	; 让es:bx指向BaseOfLoader
	;mov ax, cs
	;mov es, ax
	;;;xchg bx, bx
	int 13h
	;pop cx
	;;;xchg bx, bx
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
;        mov bx, BaseOfLoader            ; 让es:bx指向BaseOfLoader
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
	mov bx,	BaseOfLoader		; 让es:bx指向BaseOfLoader
	int 13h				; int 13h 中断
	ret

BaseOfLoader	equ	0x9000
OffSetOfLoader	equ	0x100
BaseOfFATEntry	equ	0x1000


times	510 - ($ - $$)	db	0
dw	0xAA55
