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
	mov al,	'G'
	mov ah,	0Ch
	mov [gs:((80 * 10 + 40) * 2)],	ax

	mov  ah, 00h
	mov  dl, 0
	int 13h
	mov ax,	FirstSectorOfRootDirectory
	mov cl, 1
	call ReadSector

	mov cx, 3
	mov di, BaseOfLoader
	push di

SEARCH_FILE_IN_ROOT_DIRECTORY:
	cmp cx, 0
	jz FILE_NOT_FOUND
	mov si, LoaderBinFileName
	cld
	;mov cx,	[LoaderBinFileNameLength]
	mov cx, LoaderBinFileNameLength
	mov dx, 0
	mov bx, (80 * 30 + 10) *2
	push bx
COMPARE_FILENAME:
	;cmp [es:si], [ds:di]
	;cmp [si], [di]
	;push cx
	xchg bx, bx
	lodsb
	;pop cx
	mov ah, [es:di]
	;cmp al, byte [es:di]
	;jnz FILENAME_DIFFIERENT
	dec cx
	; inc si
	inc di
	inc dx

	;mov al, ah
	;mov al, 'K'
        mov ah, 0Ah
	pop bx
	xchg bx, bx
        mov [gs:bx], ax
	;add bx, 160
	add bx, 2
	push bx

	;mp dx, [LoaderBinFileNameLength]
	cmp cx, 0
	jz OVER
	;cmp dx, [LoaderBinFileNameLength]
	;jz FILE_FOUND
	jmp COMPARE_FILENAME		
FILENAME_DIFFIERENT:
	mov al, 'D'
        mov ah, 0Ah
        mov [gs:(80 * 23 + 40) *2], ax

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
	mov [gs:(80 * 23 + 35) *2], ax
	jmp $
	; 获取文件的第一个簇的簇号
	and di, 0xFFE0  ; 低5位设置为0，其余位数保持原状。回到正在遍历的根目录项的初始位置; 获取文件的第一个簇的簇号
	add di, 0x1A
	mov si, di
	lodsw	
	xchg bx, bx	
	; 读取文件的第一个簇
	add ax, 19
	add ax, 14
	sub ax, 2
	mov cl, 1
	mov bx, 0	
	call ReadSector
	add bx, 512
	xchg bx, bx	

READ_FILE:
	xchg bx, bx
	push bx
	call GetFATEntry
	cmp ax, 0xFF8
	jz FILE_READ_OVER

	xchg bx, bx	
	; 根据簇号读取文件
	mov ax, 19
	mov ax, 14
	sub ax, 2	; ReadSector 的参数，目标扇区在软盘中的扇区号
	mov cl, 1	; ReadSector 的参数，要读取多少个扇区
	pop bx
	call ReadSector
	xchg bx, bx	
	add bx, 512	; 下一次读取的数据要放到上一次读取的数据的后面，无缝衔接
	jmp READ_FILE
	
FILE_NOT_FOUND:
        mov al, 'N'
        mov ah, 0Ah
        mov [gs:(80 * 23 + 36) *2], ax
	jmp OVER

FILE_READ_OVER:
	mov al, 'O'
        mov ah, 0Ah
        mov [gs:(80 * 23 + 37) *2], ax
	
	;jmp BaseOfLoader:OffSetLoader

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
	push es
	push ax
	mov ax, BaseOfLoader
	sub ax, 0100h
	mov es, ax
	pop ax

	MOV ah, 00h
	mov dl, 0
	int 13h
	
	mov dx, 0
	mov bx, 3
	mul bx
	mov bx, 2
	div bx
	xchg bx, bx
	; 用FAT项的编号计算出这个FAT项的字节偏移量 end
	mov [FATEntryIsInt], dx
	; 用字节偏移量计算出扇区偏移量 start
	mov dx, 0
	; and ax, 0000000011111111b  ; 不知道这句的意图是啥，忘记得太快了！
	; mov dword ax, al ; 错误用法
	; mov cx, [BytesOfSector]
	mov cx, 512
	div cx
	push dx
	add ax, SectorNumberOfFAT1	; ax 是在FAT1区域的偏移。要把它转化为在软盘中的扇区号，需加上FAT1对软盘的偏移量。
	; mov ah, 00h

	; mov dl, 0
	; int 13h
	; 用字节偏移量计算出扇区偏移量 end
	; mov dword ax, al
	; add ax,1
	mov cl, 2 
	mov bx, 0
	; 用扇区偏移量计算出在某柱面某磁道的扇区偏移量，可以直接调用ReadSector
	call ReadSector
	;mov ax, [es:bx]
	pop dx
	add bx, dx
	mov ax, [es:bx]
	; 根据FAT项偏移量是否占用整数个字节来计算FAT项的值
	cmp byte [FATEntryIsInt], 0
	jz FATEntry_Is_Int
	shr ax, 4	
FATEntry_Is_Int:
	and ax, 0x0FFF
	pop es
	ret

; 读取扇区
ReadSector:
	push bx
	push bp
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
	;pop cx
	; mov bx, BaseOfLoader	; 让es:bx指向BaseOfLoader
	pop bp
	pop bx

	int 13h
	;pop cx
	; pop bx
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
	xchg	bx, bx
	int 13h				; int 13h 中断
	ret

BaseOfLoader	equ	0x9000
OffSetLoader	equ	0x0100


times	510 - ($ - $$)	db	0
dw	0xAA55
