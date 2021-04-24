
mov ax, 3
mov cx, 1

jmp $

jmp $

SelectFlatWR	equ	$ - $$
SelectVideo	equ	$ - $$

[SECTION .s32]

ALIGN   32

[BITS   32]

LABEL_PM_START:
				jmp $
        jmp $
        jmp $
        jmp $
        
        mov ax, SelectFlatWR
        mov ds, ax
        mov es, ax
        mov fs, ax
        mov ss, ax
        mov ax, SelectVideo
        mov gs, ax

        mov gs, ax
        mov al, 'K'
        mov ah, 0Ah
        mov [gs:(80 * 19 + 25) * 2], ax

        jmp $
        jmp $
        jmp $
        jmp $
