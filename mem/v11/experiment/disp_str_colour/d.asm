00000000  7F45              jg 0x47
00000002  4C                dec sp
00000003  46                inc si
00000004  0101              add [bx+di],ax
00000006  0100              add [bx+si],ax
00000008  0000              add [bx+si],al
0000000A  0000              add [bx+si],al
0000000C  0000              add [bx+si],al
0000000E  0000              add [bx+si],al
00000010  0100              add [bx+si],ax
00000012  0300              add ax,[bx+si]
00000014  0100              add [bx+si],ax
00000016  0000              add [bx+si],al
00000018  0000              add [bx+si],al
0000001A  0000              add [bx+si],al
0000001C  0000              add [bx+si],al
0000001E  0000              add [bx+si],al
00000020  40                inc ax
00000021  0000              add [bx+si],al
00000023  0000              add [bx+si],al
00000025  0000              add [bx+si],al
00000027  0034              add [si],dh
00000029  0000              add [bx+si],al
0000002B  0000              add [bx+si],al
0000002D  0028              add [bx+si],ch
0000002F  00060002          add [0x200],al
00000033  0000              add [bx+si],al
00000035  0000              add [bx+si],al
00000037  0000              add [bx+si],al
00000039  0000              add [bx+si],al
0000003B  0000              add [bx+si],al
0000003D  0000              add [bx+si],al
0000003F  0000              add [bx+si],al
00000041  0000              add [bx+si],al
00000043  0000              add [bx+si],al
00000045  0000              add [bx+si],al
00000047  0000              add [bx+si],al
00000049  0000              add [bx+si],al
0000004B  0000              add [bx+si],al
0000004D  0000              add [bx+si],al
0000004F  0000              add [bx+si],al
00000051  0000              add [bx+si],al
00000053  0000              add [bx+si],al
00000055  0000              add [bx+si],al
00000057  0000              add [bx+si],al
00000059  0000              add [bx+si],al
0000005B  0000              add [bx+si],al
0000005D  0000              add [bx+si],al
0000005F  0000              add [bx+si],al
00000061  0000              add [bx+si],al
00000063  0000              add [bx+si],al
00000065  0000              add [bx+si],al
00000067  0001              add [bx+di],al
00000069  0000              add [bx+si],al
0000006B  0001              add [bx+di],al
0000006D  0000              add [bx+si],al
0000006F  00060000          add [0x0],al
00000073  0000              add [bx+si],al
00000075  0000              add [bx+si],al
00000077  0030              add [bx+si],dh
00000079  0100              add [bx+si],ax
0000007B  004600            add [bp+0x0],al
0000007E  0000              add [bx+si],al
00000080  0000              add [bx+si],al
00000082  0000              add [bx+si],al
00000084  0000              add [bx+si],al
00000086  0000              add [bx+si],al
00000088  1000              adc [bx+si],al
0000008A  0000              add [bx+si],al
0000008C  0000              add [bx+si],al
0000008E  0000              add [bx+si],al
00000090  07                pop es
00000091  0000              add [bx+si],al
00000093  0003              add [bp+di],al
00000095  0000              add [bx+si],al
00000097  0000              add [bx+si],al
00000099  0000              add [bx+si],al
0000009B  0000              add [bx+si],al
0000009D  0000              add [bx+si],al
0000009F  00800100          add [bx+si+0x1],al
000000A3  002B              add [bp+di],ch
000000A5  0000              add [bx+si],al
000000A7  0000              add [bx+si],al
000000A9  0000              add [bx+si],al
000000AB  0000              add [bx+si],al
000000AD  0000              add [bx+si],al
000000AF  0001              add [bx+di],al
000000B1  0000              add [bx+si],al
000000B3  0000              add [bx+si],al
000000B5  0000              add [bx+si],al
000000B7  0011              add [bx+di],dl
000000B9  0000              add [bx+si],al
000000BB  0002              add [bp+si],al
000000BD  0000              add [bx+si],al
000000BF  0000              add [bx+si],al
000000C1  0000              add [bx+si],al
000000C3  0000              add [bx+si],al
000000C5  0000              add [bx+si],al
000000C7  00B00100          add [bx+si+0x1],dh
000000CB  00800000          add [bx+si+0x0],al
000000CF  0004              add [si],al
000000D1  0000              add [bx+si],al
000000D3  00060000          add [0x0],al
000000D7  0004              add [si],al
000000D9  0000              add [bx+si],al
000000DB  0010              add [bx+si],dl
000000DD  0000              add [bx+si],al
000000DF  0019              add [bx+di],bl
000000E1  0000              add [bx+si],al
000000E3  0003              add [bp+di],al
000000E5  0000              add [bx+si],al
000000E7  0000              add [bx+si],al
000000E9  0000              add [bx+si],al
000000EB  0000              add [bx+si],al
000000ED  0000              add [bx+si],al
000000EF  0030              add [bx+si],dh
000000F1  0200              add al,[bx+si]
000000F3  005C00            add [si+0x0],bl
000000F6  0000              add [bx+si],al
000000F8  0000              add [bx+si],al
000000FA  0000              add [bx+si],al
000000FC  0000              add [bx+si],al
000000FE  0000              add [bx+si],al
00000100  0100              add [bx+si],ax
00000102  0000              add [bx+si],al
00000104  0000              add [bx+si],al
00000106  0000              add [bx+si],al
00000108  2100              and [bx+si],ax
0000010A  0000              add [bx+si],al
0000010C  0900              or [bx+si],ax
0000010E  0000              add [bx+si],al
00000110  0000              add [bx+si],al
00000112  0000              add [bx+si],al
00000114  0000              add [bx+si],al
00000116  0000              add [bx+si],al
00000118  90                nop
00000119  0200              add al,[bx+si]
0000011B  0010              add [bx+si],dl
0000011D  0000              add [bx+si],al
0000011F  0003              add [bp+di],al
00000121  0000              add [bx+si],al
00000123  0001              add [bx+di],al
00000125  0000              add [bx+si],al
00000127  0004              add [si],al
00000129  0000              add [bx+si],al
0000012B  0008              add [bx+si],cl
0000012D  0000              add [bx+si],al
0000012F  00EB              add bl,ch
00000131  FE                db 0xfe
00000132  EBFE              jmp short 0x132
00000134  EBFE              jmp short 0x134
00000136  55                push bp
00000137  89E5              mov bp,sp
00000139  6687DB            xchg ebx,ebx
0000013C  8B7508            mov si,[di+0x8]
0000013F  8B450C            mov ax,[di+0xc]
00000142  8B3D              mov di,[di]
00000144  0000              add [bx+si],al
00000146  0000              add [bx+si],al
00000148  AC                lodsb
00000149  84C0              test al,al
0000014B  7421              jz 0x16e
0000014D  3C0A              cmp al,0xa
0000014F  7511              jnz 0x162
00000151  50                push ax
00000152  89F8              mov ax,di
00000154  B3A0              mov bl,0xa0
00000156  F6F3              div bl
00000158  40                inc ax
00000159  B3A0              mov bl,0xa0
0000015B  F6E3              mul bl
0000015D  89C7              mov di,ax
0000015F  58                pop ax
00000160  EBE6              jmp short 0x148
00000162  6687DB            xchg ebx,ebx
00000165  65668907          mov [gs:bx],eax
00000169  83C702            add di,byte +0x2
0000016C  EBDA              jmp short 0x148
0000016E  893D              mov [di],di
00000170  0000              add [bx+si],al
00000172  0000              add [bx+si],al
00000174  5D                pop bp
00000175  C3                ret
00000176  0000              add [bx+si],al
00000178  0000              add [bx+si],al
0000017A  0000              add [bx+si],al
0000017C  0000              add [bx+si],al
0000017E  0000              add [bx+si],al
00000180  002E7465          add [0x6574],ch
00000184  7874              js 0x1fa
00000186  002E7368          add [0x6873],ch
0000018A  7374              jnc 0x200
0000018C  7274              jc 0x202
0000018E  61                popa
0000018F  6200              bound ax,[bx+si]
00000191  2E7379            cs jnc 0x20d
00000194  6D                insw
00000195  7461              jz 0x1f8
00000197  6200              bound ax,[bx+si]
00000199  2E7374            cs jnc 0x210
0000019C  7274              jc 0x212
0000019E  61                popa
0000019F  6200              bound ax,[bx+si]
000001A1  2E7265            cs jc 0x209
000001A4  6C                insb
000001A5  2E7465            cs jz 0x20d
000001A8  7874              js 0x21e
000001AA  0000              add [bx+si],al
000001AC  0000              add [bx+si],al
000001AE  0000              add [bx+si],al
000001B0  0000              add [bx+si],al
000001B2  0000              add [bx+si],al
000001B4  0000              add [bx+si],al
000001B6  0000              add [bx+si],al
000001B8  0000              add [bx+si],al
000001BA  0000              add [bx+si],al
000001BC  0000              add [bx+si],al
000001BE  0000              add [bx+si],al
000001C0  0100              add [bx+si],ax
000001C2  0000              add [bx+si],al
000001C4  0000              add [bx+si],al
000001C6  0000              add [bx+si],al
000001C8  0000              add [bx+si],al
000001CA  0000              add [bx+si],al
000001CC  0400              add al,0x0
000001CE  F1                int1
000001CF  FF00              inc word [bx+si]
000001D1  0000              add [bx+si],al
000001D3  0000              add [bx+si],al
000001D5  0000              add [bx+si],al
000001D7  0000              add [bx+si],al
000001D9  0000              add [bx+si],al
000001DB  0003              add [bp+di],al
000001DD  0001              add [bx+di],al
000001DF  00260000          add [0x0],ah
000001E3  0018              add [bx+si],bl
000001E5  0000              add [bx+si],al
000001E7  0000              add [bx+si],al
000001E9  0000              add [bx+si],al
000001EB  0000              add [bx+si],al
000001ED  0001              add [bx+di],al
000001EF  0038              add [bx+si],bh
000001F1  0000              add [bx+si],al
000001F3  0032              add [bp+si],dh
000001F5  0000              add [bx+si],al
000001F7  0000              add [bx+si],al
000001F9  0000              add [bx+si],al
000001FB  0000              add [bx+si],al
000001FD  0001              add [bx+di],al
000001FF  004A00            add [bp+si+0x0],cl
00000202  0000              add [bx+si],al
00000204  3E0000            add [ds:bx+si],al
00000207  0000              add [bx+si],al
00000209  0000              add [bx+si],al
0000020B  0000              add [bx+si],al
0000020D  0001              add [bx+di],al
0000020F  000E0000          add [0x0],cl
00000213  0000              add [bx+si],al
00000215  0000              add [bx+si],al
00000217  0000              add [bx+si],al
00000219  0000              add [bx+si],al
0000021B  0010              add [bx+si],dl
0000021D  0000              add [bx+si],al
0000021F  00160000          add [0x0],dl
00000223  0000              add [bx+si],al
00000225  0000              add [bx+si],al
00000227  0000              add [bx+si],al
00000229  0000              add [bx+si],al
0000022B  0010              add [bx+si],dl
0000022D  0001              add [bx+di],al
0000022F  0000              add [bx+si],al
00000231  646973705F73      imul si,[fs:bp+di+0x70],word 0x735f
00000237  7472              jz 0x2ab
00000239  2E61              cs popa
0000023B  736D              jnc 0x2aa
0000023D  006469            add [si+0x69],ah
00000240  735F              jnc 0x2a1
00000242  706F              jo 0x2b3
00000244  7300              jnc 0x246
00000246  646973705F73      imul si,[fs:bp+di+0x70],word 0x735f
0000024C  7472              jz 0x2c0
0000024E  5F                pop di
0000024F  636F6C            arpl [bx+0x6c],bp
00000252  6F                outsw
00000253  7572              jnz 0x2c7
00000255  006469            add [si+0x69],ah
00000258  7370              jnc 0x2ca
0000025A  5F                pop di
0000025B  7374              jnc 0x2d1
0000025D  725F              jc 0x2be
0000025F  636F6C            arpl [bx+0x6c],bp
00000262  6F                outsw
00000263  7572              jnz 0x2d7
00000265  2E3100            xor [cs:bx+si],ax
00000268  646973705F73      imul si,[fs:bp+di+0x70],word 0x735f
0000026E  7472              jz 0x2e2
00000270  5F                pop di
00000271  636F6C            arpl [bx+0x6c],bp
00000274  6F                outsw
00000275  7572              jnz 0x2e9
00000277  2E3300            xor ax,[cs:bx+si]
0000027A  646973705F73      imul si,[fs:bp+di+0x70],word 0x735f
00000280  7472              jz 0x2f4
00000282  5F                pop di
00000283  636F6C            arpl [bx+0x6c],bp
00000286  6F                outsw
00000287  7572              jnz 0x2fb
00000289  2E3400            cs xor al,0x0
0000028C  0000              add [bx+si],al
0000028E  0000              add [bx+si],al
00000290  1400              adc al,0x0
00000292  0000              add [bx+si],al
00000294  01060000          add [0x0],ax
00000298  40                inc ax
00000299  0000              add [bx+si],al
0000029B  0001              add [bx+di],al
0000029D  06                push es
0000029E  0000              add [bx+si],al
