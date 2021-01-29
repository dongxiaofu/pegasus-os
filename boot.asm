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

	; 打印字符串
	mov ax, cs
	mov es, ax	; 非必须
	mov ds, ax	; 非必须
	mov ax, BootMessage
	; 变量不能直接赋值给bp，原因未知。下面的cx也是如此。
	;mov bp,	BootMessage
	mov bp, ax
	;mov cx,	BootMessageLength
	;mov cx, 16
	mov ax, BootMessageLength
	mov cx, ax
	mov ah,	13h
	mov al, 01h
	; mov ax,	1301h	; al 是0、1或2时，字符串显示不正常，花花绿绿，看不清楚
	mov bx, 000ch
	mov dl,	10
	mov dh, 15
	int 10h

	; 写显存打印字符串 start	
	mov di,	(80 * 5 + 20) * 2
	mov ax, BootMessageLength
	mov cx, ax
	
	; 关键语句，让 si 指向 BootMessage
	mov si, BootMessage
	;mov es, ax
	;lea si, BootMessage
	; mov si, ax	
	;mov si, BootMessage
	;mov es, si
	;mov si,	0
	
	
DISP_STR:
	;mov al,	[es:si]
	;mov al, 'M'
	; 获取si指向的内存中的数据
	mov al, [si]
	; 下一个字节的内存找那个存储的数据
	inc si
	mov ah, 0Ah
	mov [gs:di], ax
	add di, 2
	
	loop DISP_STR


	; 写显存打印字符串 end	
	mov  ah, 00h
	mov  dl, 0
	int 13h
	mov ax,	FirstSectorOfRootDirectory
	call ReadSector

	mov ah,	0Ah
	; mov al,	[es:bx+510]
	;mov al,	[es:bx]
	mov al,	[es:bx + 32]
	;mov al, 'F'
	mov [gs:(80 * 13 + 35) * 2],	ax
	mov cx, 3
	mov di, BaseOfLoader
	; mov si, LoaderBinFileName
SEARCH_FILE_IN_ROOT_DIRECTORY:
	xchg bx, bx
	cmp cx, 0
	jz FILE_NOT_FOUND
	push cx
	;mov ax, cs
	;mov es, ax
	;mov ds, ax	
	; mov si, bx
	; mov di, BaseOfLoader
	mov si, LoaderBinFileName
	;mov cx,	[LoaderBinFileNameLength]
	mov cx, LoaderBinFileNameLength
	mov dx, 0
COMPARE_FILENAME:
	;cmp [es:si], [ds:di]
	;cmp [si], [di]
	lodsb
	xchg bx, bx
	mov ah, [es:di]
	cmp al, byte [es:di]
	jnz FILENAME_DIFFIERENT
	dec cx
	; inc si
	inc di
	inc dx
	;cmp dx, [LoaderBinFileNameLength]
	;cmp dx, 11
	cmp dx, LoaderBinFileNameLength
	jz FILE_FOUND
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
	xchg bx, bx
	jmp SEARCH_FILE_IN_ROOT_DIRECTORY
FILE_FOUND:
	mov al, 'S'
	mov ah, 0Ah
	mov [gs:(80 * 23 + 35) *2], ax
	jmp OVER
	
FILE_NOT_FOUND:
        mov al, 'N'
        mov ah, 0Ah
        mov [gs:(80 * 23 + 36) *2], ax

OVER:

	jmp $

BootMessage:	db	"Hello,World OS!"
;BootMessageLength:	db	$ - BootMessage
; 长度，需要使用 equ 
BootMessageLength	equ	$ - BootMessage

FirstSectorOfRootDirectory	equ	19
SectorNumberOfTrack	equ	18

LoaderBinFileName:	db	"LOADER  BIN4"
LoaderBinFileNameLength	equ	$ - LoaderBinFileName	; 中间两个空格

; 读取扇区
ReadSector:
	;push bx
	xchg	bx, bx
	;push cx
	; mov bx, SectorNumberOfTrack
	mov bl, SectorNumberOfTrack
	div bl	; 商在al中，余数在ah中
	mov ch, al
	shr ch, 1	; ch 是柱面号
	mov dh, al
	and dh, 1	; dh 是磁头号
	mov dl, 0	; 驱动器号，0表示A盘
	mov cl, ah
	add cl, 1	; cl 是起始扇区号
	mov ah, 02h	; 读软盘
	;pop cx
	mov bx, BaseOfLoader	; 让es:bx指向BaseOfLoader
	xchg	bx, bx
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


times	510 - ($ - $$)	db	0
dw	0xAA55
