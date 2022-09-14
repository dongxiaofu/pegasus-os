00000000  7F45              jg 0x47
00000002  4C                dec sp
00000003  46                inc si
00000004  0101              add [bx+di],ax
00000006  0100              add [bx+si],ax
00000008  0000              add [bx+si],al
0000000A  0000              add [bx+si],al
0000000C  0000              add [bx+si],al
0000000E  0000              add [bx+si],al
00000010  0200              add al,[bx+si]
00000012  0300              add ax,[bx+si]
00000014  0100              add [bx+si],ax
00000016  0000              add [bx+si],al
00000018  40                inc ax
00000019  830408            add word [si],byte +0x8
0000001C  3400              xor al,0x0
0000001E  0000              add [bx+si],al
00000020  2427              and al,0x27
00000022  0000              add [bx+si],al
00000024  0000              add [bx+si],al
00000026  0000              add [bx+si],al
00000028  3400              xor al,0x0
0000002A  2000              and [bx+si],al
0000002C  0900              or [bx+si],ax
0000002E  2800              sub [bx+si],al
00000030  1E                push ds
00000031  001D              add [di],bl
00000033  00060000          add [0x0],al
00000037  0034              add [si],dh
00000039  0000              add [bx+si],al
0000003B  0034              add [si],dh
0000003D  800408            add byte [si],0x8
00000040  3480              xor al,0x80
00000042  0408              add al,0x8
00000044  2001              and [bx+di],al
00000046  0000              add [bx+si],al
00000048  2001              and [bx+di],al
0000004A  0000              add [bx+si],al
0000004C  0400              add al,0x0
0000004E  0000              add [bx+si],al
00000050  0400              add al,0x0
00000052  0000              add [bx+si],al
00000054  0300              add ax,[bx+si]
00000056  0000              add [bx+si],al
00000058  54                push sp
00000059  0100              add [bx+si],ax
0000005B  005481            add [si-0x7f],dl
0000005E  0408              add al,0x8
00000060  54                push sp
00000061  81040813          add word [si],0x1308
00000065  0000              add [bx+si],al
00000067  0013              add [bp+di],dl
00000069  0000              add [bx+si],al
0000006B  0004              add [si],al
0000006D  0000              add [bx+si],al
0000006F  0001              add [bx+di],al
00000071  0000              add [bx+si],al
00000073  0001              add [bx+di],al
00000075  0000              add [bx+si],al
00000077  0000              add [bx+si],al
00000079  0000              add [bx+si],al
0000007B  0000              add [bx+si],al
0000007D  800408            add byte [si],0x8
00000080  00800408          add [bx+si+0x804],al
00000084  D0060000          rol byte [0x0],1
00000088  D0060000          rol byte [0x0],1
0000008C  050000            add ax,0x0
0000008F  0000              add [bx+si],al
00000091  1000              adc [bx+si],al
00000093  0001              add [bx+di],al
00000095  0000              add [bx+si],al
00000097  0004              add [si],al
00000099  0F0000            sldt [bx+si]
0000009C  049F              add al,0x9f
0000009E  0408              add al,0x8
000000A0  049F              add al,0x9f
000000A2  0408              add al,0x8
000000A4  1001              adc [bx+di],al
000000A6  0000              add [bx+si],al
000000A8  1801              sbb [bx+di],al
000000AA  0000              add [bx+si],al
000000AC  06                push es
000000AD  0000              add [bx+si],al
000000AF  0000              add [bx+si],al
000000B1  1000              adc [bx+si],al
000000B3  0002              add [bp+si],al
000000B5  0000              add [bx+si],al
000000B7  000C              add [si],cl
000000B9  0F0000            sldt [bx+si]
000000BC  0C9F              or al,0x9f
000000BE  0408              add al,0x8
000000C0  0C9F              or al,0x9f
000000C2  0408              add al,0x8
000000C4  E80000            call 0xc7
000000C7  00E8              add al,ch
000000C9  0000              add [bx+si],al
000000CB  00060000          add [0x0],al
000000CF  0004              add [si],al
000000D1  0000              add [bx+si],al
000000D3  0004              add [si],al
000000D5  0000              add [bx+si],al
000000D7  006801            add [bx+si+0x1],ch
000000DA  0000              add [bx+si],al
000000DC  688104            push word 0x481
000000DF  086881            or [bx+si-0x7f],ch
000000E2  0408              add al,0x8
000000E4  44                inc sp
000000E5  0000              add [bx+si],al
000000E7  004400            add [si+0x0],al
000000EA  0000              add [bx+si],al
000000EC  0400              add al,0x0
000000EE  0000              add [bx+si],al
000000F0  0400              add al,0x0
000000F2  0000              add [bx+si],al
000000F4  50                push ax
000000F5  E574              in ax,0x74
000000F7  64A00500          mov al,[fs:0x5]
000000FB  00A08504          add [bx+si+0x485],ah
000000FF  08A08504          or [bx+si+0x485],ah
00000103  083C              or [si],bh
00000105  0000              add [bx+si],al
00000107  003C              add [si],bh
00000109  0000              add [bx+si],al
0000010B  0004              add [si],al
0000010D  0000              add [bx+si],al
0000010F  0004              add [si],al
00000111  0000              add [bx+si],al
00000113  0051E5            add [bx+di-0x1b],dl
00000116  7464              jz 0x17c
00000118  0000              add [bx+si],al
0000011A  0000              add [bx+si],al
0000011C  0000              add [bx+si],al
0000011E  0000              add [bx+si],al
00000120  0000              add [bx+si],al
00000122  0000              add [bx+si],al
00000124  0000              add [bx+si],al
00000126  0000              add [bx+si],al
00000128  0000              add [bx+si],al
0000012A  0000              add [bx+si],al
0000012C  07                pop es
0000012D  0000              add [bx+si],al
0000012F  0010              add [bx+si],dl
00000131  0000              add [bx+si],al
00000133  0052E5            add [bp+si-0x1b],dl
00000136  7464              jz 0x19c
00000138  040F              add al,0xf
0000013A  0000              add [bx+si],al
0000013C  049F              add al,0x9f
0000013E  0408              add al,0x8
00000140  049F              add al,0x9f
00000142  0408              add al,0x8
00000144  FC                cld
00000145  0000              add [bx+si],al
00000147  00FC              add ah,bh
00000149  0000              add [bx+si],al
0000014B  0004              add [si],al
0000014D  0000              add [bx+si],al
0000014F  0001              add [bx+di],al
00000151  0000              add [bx+si],al
00000153  002F              add [bx],ch
00000155  6C                insb
00000156  69622F6C64        imul sp,[bp+si+0x2f],word 0x646c
0000015B  2D6C69            sub ax,0x696c
0000015E  6E                outsb
0000015F  7578              jnz 0x1d9
00000161  2E736F            cs jnc 0x1d3
00000164  2E3200            xor al,[cs:bx+si]
00000167  0004              add [si],al
00000169  0000              add [bx+si],al
0000016B  0010              add [bx+si],dl
0000016D  0000              add [bx+si],al
0000016F  0001              add [bx+di],al
00000171  0000              add [bx+si],al
00000173  00474E            add [bx+0x4e],al
00000176  55                push bp
00000177  0000              add [bx+si],al
00000179  0000              add [bx+si],al
0000017B  0003              add [bp+di],al
0000017D  0000              add [bx+si],al
0000017F  0002              add [bp+si],al
00000181  0000              add [bx+si],al
00000183  0000              add [bx+si],al
00000185  0000              add [bx+si],al
00000187  0004              add [si],al
00000189  0000              add [bx+si],al
0000018B  0014              add [si],dl
0000018D  0000              add [bx+si],al
0000018F  0003              add [bp+di],al
00000191  0000              add [bx+si],al
00000193  00474E            add [bx+0x4e],al
00000196  55                push bp
00000197  004087            add [bx+si-0x79],al
0000019A  B2D5              mov dl,0xd5
0000019C  AA                stosb
0000019D  AB                stosw
0000019E  C538              lds di,[bx+si]
000001A0  817933426A        cmp word [bx+di+0x33],0x6a42
000001A5  C7                db 0xc7
000001A6  D446              aam 0x46
000001A8  16                push ss
000001A9  45                inc bp
000001AA  2492              and al,0x92
000001AC  0200              add al,[bx+si]
000001AE  0000              add [bx+si],al
000001B0  050000            add ax,0x0
000001B3  0001              add [bx+di],al
000001B5  0000              add [bx+si],al
000001B7  0005              add [di],al
000001B9  0000              add [bx+si],al
000001BB  0000              add [bx+si],al
000001BD  2000              and [bx+si],al
000001BF  2000              and [bx+si],al
000001C1  0000              add [bx+si],al
000001C3  0005              add [di],al
000001C5  0000              add [bx+si],al
000001C7  00AD4BE3          add [di-0x1cb5],ch
000001CB  C00000            rol byte [bx+si],byte 0x0
000001CE  0000              add [bx+si],al
000001D0  0000              add [bx+si],al
000001D2  0000              add [bx+si],al
000001D4  0000              add [bx+si],al
000001D6  0000              add [bx+si],al
000001D8  0000              add [bx+si],al
000001DA  0000              add [bx+si],al
000001DC  360000            add [ss:bx+si],al
000001DF  0000              add [bx+si],al
000001E1  0000              add [bx+si],al
000001E3  0000              add [bx+si],al
000001E5  0000              add [bx+si],al
000001E7  0020              add [bx+si],ah
000001E9  0000              add [bx+si],al
000001EB  005200            add [bp+si+0x0],dl
000001EE  0000              add [bx+si],al
000001F0  0000              add [bx+si],al
000001F2  0000              add [bx+si],al
000001F4  0000              add [bx+si],al
000001F6  0000              add [bx+si],al
000001F8  2000              and [bx+si],al
000001FA  0000              add [bx+si],al
000001FC  1A00              sbb al,[bx+si]
000001FE  0000              add [bx+si],al
00000200  0000              add [bx+si],al
00000202  0000              add [bx+si],al
00000204  0000              add [bx+si],al
00000206  0000              add [bx+si],al
00000208  1200              adc al,[bx+si]
0000020A  0000              add [bx+si],al
0000020C  61                popa
0000020D  0000              add [bx+si],al
0000020F  0000              add [bx+si],al
00000211  0000              add [bx+si],al
00000213  0000              add [bx+si],al
00000215  0000              add [bx+si],al
00000217  0020              add [bx+si],ah
00000219  0000              add [bx+si],al
0000021B  000B              add [bp+di],cl
0000021D  0000              add [bx+si],al
0000021F  00948504          add [si+0x485],dl
00000223  0804              or [si],al
00000225  0000              add [bx+si],al
00000227  0011              add [bx+di],dl
00000229  000F              add [bx],cl
0000022B  0000              add [bx+si],al
0000022D  6C                insb
0000022E  6962632E73        imul sp,[bp+si+0x63],word 0x732e
00000233  6F                outsw
00000234  2E36005F49        add [ss:bx+0x49],bl
00000239  4F                dec di
0000023A  5F                pop di
0000023B  7374              jnc 0x2b1
0000023D  64696E5F7573      imul bp,[fs:bp+0x5f],word 0x7375
00000243  6564005F5F        add [fs:bx+0x5f],bl
00000248  6C                insb
00000249  6962635F73        imul sp,[bp+si+0x63],word 0x735f
0000024E  7461              jz 0x2b1
00000250  7274              jc 0x2c6
00000252  5F                pop di
00000253  6D                insw
00000254  61                popa
00000255  696E00474C        imul bp,[bp+0x0],word 0x4c47
0000025A  49                dec cx
0000025B  42                inc dx
0000025C  43                inc bx
0000025D  5F                pop di
0000025E  322E3000          xor ch,[0x30]
00000262  5F                pop di
00000263  49                dec cx
00000264  54                push sp
00000265  4D                dec bp
00000266  5F                pop di
00000267  64657265          gs jc 0x2d0
0000026B  676973746572      imul si,[ebx+0x74],word 0x7265
00000271  54                push sp
00000272  4D                dec bp
00000273  43                inc bx
00000274  6C                insb
00000275  6F                outsw
00000276  6E                outsb
00000277  6554              gs push sp
00000279  61                popa
0000027A  626C65            bound bp,[si+0x65]
0000027D  005F5F            add [bx+0x5f],bl
00000280  676D              a32 insw
00000282  6F                outsw
00000283  6E                outsb
00000284  5F                pop di
00000285  7374              jnc 0x2fb
00000287  61                popa
00000288  7274              jc 0x2fe
0000028A  5F                pop di
0000028B  5F                pop di
0000028C  005F49            add [bx+0x49],bl
0000028F  54                push sp
00000290  4D                dec bp
00000291  5F                pop di
00000292  7265              jc 0x2f9
00000294  676973746572      imul si,[ebx+0x74],word 0x7265
0000029A  54                push sp
0000029B  4D                dec bp
0000029C  43                inc bx
0000029D  6C                insb
0000029E  6F                outsw
0000029F  6E                outsb
000002A0  6554              gs push sp
000002A2  61                popa
000002A3  626C65            bound bp,[si+0x65]
000002A6  0000              add [bx+si],al
000002A8  0000              add [bx+si],al
000002AA  0000              add [bx+si],al
000002AC  0000              add [bx+si],al
000002AE  0200              add al,[bx+si]
000002B0  0000              add [bx+si],al
000002B2  0100              add [bx+si],ax
000002B4  0100              add [bx+si],ax
000002B6  0100              add [bx+si],ax
000002B8  0100              add [bx+si],ax
000002BA  0000              add [bx+si],al
000002BC  1000              adc [bx+si],al
000002BE  0000              add [bx+si],al
000002C0  0000              add [bx+si],al
000002C2  0000              add [bx+si],al
000002C4  106969            adc [bx+di+0x69],ch
000002C7  0D0000            or ax,0x0
000002CA  0200              add al,[bx+si]
000002CC  2C00              sub al,0x0
000002CE  0000              add [bx+si],al
000002D0  0000              add [bx+si],al
000002D2  0000              add [bx+si],al
000002D4  F4                hlt
000002D5  9F                lahf
000002D6  0408              add al,0x8
000002D8  06                push es
000002D9  0100              add [bx+si],ax
000002DB  00F8              add al,bh
000002DD  9F                lahf
000002DE  0408              add al,0x8
000002E0  06                push es
000002E1  0200              add al,[bx+si]
000002E3  00FC              add ah,bh
000002E5  9F                lahf
000002E6  0408              add al,0x8
000002E8  06                push es
000002E9  0400              add al,0x0
000002EB  000C              add [si],cl
000002ED  A00408            mov al,[0x804]
000002F0  07                pop es
000002F1  0300              add ax,[bx+si]
000002F3  00F3              add bl,dh
000002F5  0F1EFB            hint_nop55 bx
000002F8  53                push bx
000002F9  83EC08            sub sp,byte +0x8
000002FC  E88F00            call 0x38e
000002FF  0000              add [bx+si],al
00000301  81C3FF1C          add bx,0x1cff
00000305  0000              add [bx+si],al
00000307  8B83F8FF          mov ax,[bp+di-0x8]
0000030B  FF                db 0xff
0000030C  FF85C074          inc word [di+0x74c0]
00000310  02FF              add bh,bh
00000312  D083C408          rol byte [bp+di+0x8c4],1
00000316  5B                pop bx
00000317  C3                ret
00000318  0000              add [bx+si],al
0000031A  0000              add [bx+si],al
0000031C  0000              add [bx+si],al
0000031E  0000              add [bx+si],al
00000320  FF35              push word [di]
00000322  04A0              add al,0xa0
00000324  0408              add al,0x8
00000326  FF25              jmp [di]
00000328  08A00408          or [bx+si+0x804],ah
0000032C  0000              add [bx+si],al
0000032E  0000              add [bx+si],al
00000330  FF25              jmp [di]
00000332  0CA0              or al,0xa0
00000334  0408              add al,0x8
00000336  680000            push word 0x0
00000339  0000              add [bx+si],al
0000033B  E9E0FF            jmp 0x31e
0000033E  FF                db 0xff
0000033F  FFF3              push bx
00000341  0F1EFB            hint_nop55 bx
00000344  31ED              xor bp,bp
00000346  5E                pop si
00000347  89E1              mov cx,sp
00000349  83E4F0            and sp,byte -0x10
0000034C  50                push ax
0000034D  54                push sp
0000034E  52                push dx
0000034F  E82300            call 0x375
00000352  0000              add [bx+si],al
00000354  81C3AC1C          add bx,0x1cac
00000358  0000              add [bx+si],al
0000035A  8D8370E5          lea ax,[bp+di-0x1a90]
0000035E  FF                db 0xff
0000035F  FF508D            call [bx+si-0x73]
00000362  8310E5            adc word [bx+si],byte -0x1b
00000365  FF                db 0xff
00000366  FF5051            call [bx+si+0x51]
00000369  56                push si
0000036A  C7C07D84          mov ax,0x847d
0000036E  0408              add al,0x8
00000370  50                push ax
00000371  E8BAFF            call 0x32e
00000374  FF                db 0xff
00000375  FFF4              push sp
00000377  8B1C              mov bx,[si]
00000379  24C3              and al,0xc3
0000037B  6690              xchg eax,eax
0000037D  6690              xchg eax,eax
0000037F  90                nop
00000380  F30F1EFB          endbr32
00000384  C3                ret
00000385  6690              xchg eax,eax
00000387  6690              xchg eax,eax
00000389  6690              xchg eax,eax
0000038B  6690              xchg eax,eax
0000038D  6690              xchg eax,eax
0000038F  90                nop
00000390  8B1C              mov bx,[si]
00000392  24C3              and al,0xc3
00000394  6690              xchg eax,eax
00000396  6690              xchg eax,eax
00000398  6690              xchg eax,eax
0000039A  6690              xchg eax,eax
0000039C  6690              xchg eax,eax
0000039E  6690              xchg eax,eax
000003A0  E8D400            call 0x477
000003A3  0000              add [bx+si],al
000003A5  81C25B1C          add dx,0x1c5b
000003A9  0000              add [bx+si],al
000003AB  8D8A1400          lea cx,[bp+si+0x14]
000003AF  0000              add [bx+si],al
000003B1  8D821400          lea ax,[bp+si+0x14]
000003B5  0000              add [bx+si],al
000003B7  39C8              cmp ax,cx
000003B9  741D              jz 0x3d8
000003BB  8B82F4FF          mov ax,[bp+si-0xc]
000003BF  FF                db 0xff
000003C0  FF85C074          inc word [di+0x74c0]
000003C4  135589            adc dx,[di-0x77]
000003C7  E583              in ax,0x83
000003C9  EC                in al,dx
000003CA  1451              adc al,0x51
000003CC  FFD0              call ax
000003CE  83C410            add sp,byte +0x10
000003D1  C9                leave
000003D2  C3                ret
000003D3  90                nop
000003D4  8D7426            lea si,[si+0x26]
000003D7  00C3              add bl,al
000003D9  8DB42600          lea si,[si+0x26]
000003DD  0000              add [bx+si],al
000003DF  00E8              add al,ch
000003E1  94                xchg ax,sp
000003E2  0000              add [bx+si],al
000003E4  0081C21B          add [bx+di+0x1bc2],al
000003E8  1C00              sbb al,0x0
000003EA  005589            add [di-0x77],dl
000003ED  E553              in ax,0x53
000003EF  8D8A1400          lea cx,[bp+si+0x14]
000003F3  0000              add [bx+si],al
000003F5  8D821400          lea ax,[bp+si+0x14]
000003F9  0000              add [bx+si],al
000003FB  83EC04            sub sp,byte +0x4
000003FE  29C8              sub ax,cx
00000400  C1F802            sar ax,byte 0x2
00000403  89C3              mov bx,ax
00000405  C1EB1F            shr bx,byte 0x1f
00000408  01D8              add ax,bx
0000040A  D1F8              sar ax,1
0000040C  7414              jz 0x422
0000040E  8B92FCFF          mov dx,[bp+si-0x4]
00000412  FF                db 0xff
00000413  FF85D274          inc word [di+0x74d2]
00000417  0A83EC08          or al,[bp+di+0x8ec]
0000041B  50                push ax
0000041C  51                push cx
0000041D  FFD2              call dx
0000041F  83C410            add sp,byte +0x10
00000422  8B5DFC            mov bx,[di-0x4]
00000425  C9                leave
00000426  C3                ret
00000427  89F6              mov si,si
00000429  8DBC2700          lea di,[si+0x27]
0000042D  0000              add [bx+si],al
0000042F  00F3              add bl,dh
00000431  0F1EFB            hint_nop55 bx
00000434  55                push bp
00000435  89E5              mov bp,sp
00000437  53                push bx
00000438  E853FF            call 0x38e
0000043B  FF                db 0xff
0000043C  FF81C3C3          inc word [bx+di-0x3c3d]
00000440  1B00              sbb ax,[bx+si]
00000442  0083EC04          add [bp+di+0x4ec],al
00000446  80BB140000        cmp byte [bp+di+0x14],0x0
0000044B  0000              add [bx+si],al
0000044D  750C              jnz 0x45b
0000044F  E84CFF            call 0x39e
00000452  FF                db 0xff
00000453  FFC6              inc si
00000455  831400            adc word [si],byte +0x0
00000458  0000              add [bx+si],al
0000045A  0183C404          add [bp+di+0x4c4],ax
0000045E  5B                pop bx
0000045F  5D                pop bp
00000460  C3                ret
00000461  EB0D              jmp short 0x470
00000463  90                nop
00000464  90                nop
00000465  90                nop
00000466  90                nop
00000467  90                nop
00000468  90                nop
00000469  90                nop
0000046A  90                nop
0000046B  90                nop
0000046C  90                nop
0000046D  90                nop
0000046E  90                nop
0000046F  90                nop
00000470  F30F1EFB          endbr32
00000474  E967FF            jmp 0x3de
00000477  FF                db 0xff
00000478  FF8B1424          dec word [bp+di+0x2414]
0000047C  C3                ret
0000047D  8D4C24            lea cx,[si+0x24]
00000480  0483              add al,0x83
00000482  E4F0              in al,0xf0
00000484  FF71FC            push word [bx+di-0x4]
00000487  55                push bp
00000488  89E5              mov bp,sp
0000048A  51                push cx
0000048B  83EC14            sub sp,byte +0x14
0000048E  C745F49C85        mov word [di-0xc],0x859c
00000493  0408              add al,0x8
00000495  C745F00427        mov word [di-0x10],0x2704
0000049A  0000              add [bx+si],al
0000049C  83EC08            sub sp,byte +0x8
0000049F  FF75F0            push word [di-0x10]
000004A2  FF75F4            push word [di-0xc]
000004A5  E81600            call 0x4be
000004A8  0000              add [bx+si],al
000004AA  83C410            add sp,byte +0x10
000004AD  B80000            mov ax,0x0
000004B0  0000              add [bx+si],al
000004B2  8B4DFC            mov cx,[di-0x4]
000004B5  C9                leave
000004B6  8D61FC            lea sp,[bx+di-0x4]
000004B9  C3                ret
000004BA  6690              xchg eax,eax
000004BC  6690              xchg eax,eax
000004BE  6690              xchg eax,eax
000004C0  EBFE              jmp short 0x4c0
000004C2  EBFE              jmp short 0x4c2
000004C4  EBFE              jmp short 0x4c4
000004C6  55                push bp
000004C7  89E5              mov bp,sp
000004C9  6687DB            xchg ebx,ebx
000004CC  8B7508            mov si,[di+0x8]
000004CF  8B450C            mov ax,[di+0xc]
000004D2  8B3D              mov di,[di]
000004D4  18A00408          sbb [bx+si+0x804],ah
000004D8  AC                lodsb
000004D9  84C0              test al,al
000004DB  7421              jz 0x4fe
000004DD  3C0A              cmp al,0xa
000004DF  7511              jnz 0x4f2
000004E1  50                push ax
000004E2  89F8              mov ax,di
000004E4  B3A0              mov bl,0xa0
000004E6  F6F3              div bl
000004E8  40                inc ax
000004E9  B3A0              mov bl,0xa0
000004EB  F6E3              mul bl
000004ED  89C7              mov di,ax
000004EF  58                pop ax
000004F0  EBE6              jmp short 0x4d8
000004F2  6687DB            xchg ebx,ebx
000004F5  65668907          mov [gs:bx],eax
000004F9  83C702            add di,byte +0x2
000004FC  EBDA              jmp short 0x4d8
000004FE  893D              mov [di],di
00000500  18A00408          sbb [bx+si+0x804],ah
00000504  5D                pop bp
00000505  C3                ret
00000506  6690              xchg eax,eax
00000508  6690              xchg eax,eax
0000050A  6690              xchg eax,eax
0000050C  6690              xchg eax,eax
0000050E  6690              xchg eax,eax
00000510  F30F1EFB          endbr32
00000514  55                push bp
00000515  57                push di
00000516  56                push si
00000517  53                push bx
00000518  E873FE            call 0x38e
0000051B  FF                db 0xff
0000051C  FF81C3E3          inc word [bx+di-0x1c3d]
00000520  1A00              sbb al,[bx+si]
00000522  0083EC0C          add [bp+di+0xcec],al
00000526  8B6C24            mov bp,[si+0x24]
00000529  28E8              sub al,ch
0000052B  C5                db 0xc5
0000052C  FD                std
0000052D  FF                db 0xff
0000052E  FF8DB308          dec word [di+0x8b3]
00000532  FF                db 0xff
00000533  FF                db 0xff
00000534  FF8D8304          dec word [di+0x483]
00000538  FF                db 0xff
00000539  FF                db 0xff
0000053A  FF29              jmp far [bx+di]
0000053C  C6C1FE            mov cl,0xfe
0000053F  027423            add dh,[si+0x23]
00000542  31FF              xor di,di
00000544  8D7426            lea si,[si+0x26]
00000547  0083EC04          add [bp+di+0x4ec],al
0000054B  55                push bp
0000054C  FF7424            push word [si+0x24]
0000054F  2CFF              sub al,0xff
00000551  7424              jz 0x577
00000553  2CFF              sub al,0xff
00000555  94                xchg ax,sp
00000556  BB04FF            mov bx,0xff04
00000559  FF                db 0xff
0000055A  FF83C701          inc word [bp+di+0x1c7]
0000055E  83C410            add sp,byte +0x10
00000561  39FE              cmp si,di
00000563  75E3              jnz 0x548
00000565  83C40C            add sp,byte +0xc
00000568  5B                pop bx
00000569  5E                pop si
0000056A  5F                pop di
0000056B  5D                pop bp
0000056C  C3                ret
0000056D  8D7600            lea si,[bp+0x0]
00000570  F30F1EFB          endbr32
00000574  C3                ret
00000575  0000              add [bx+si],al
00000577  00F3              add bl,dh
00000579  0F1EFB            hint_nop55 bx
0000057C  53                push bx
0000057D  83EC08            sub sp,byte +0x8
00000580  E80BFE            call 0x38e
00000583  FF                db 0xff
00000584  FF81C37B          inc word [bx+di+0x7bc3]
00000588  1A00              sbb al,[bx+si]
0000058A  0083C408          add [bp+di+0x8c4],al
0000058E  5B                pop bx
0000058F  C3                ret
00000590  0300              add ax,[bx+si]
00000592  0000              add [bx+si],al
00000594  0100              add [bx+si],ax
00000596  0200              add al,[bx+si]
00000598  0000              add [bx+si],al
0000059A  0000              add [bx+si],al
0000059C  48                dec ax
0000059D  69000001          imul ax,[bx+si],word 0x100
000005A1  1B03              sbb ax,[bp+di]
000005A3  3B38              cmp di,[bx+si]
000005A5  0000              add [bx+si],al
000005A7  00060000          add [0x0],al
000005AB  0080FDFF          add [bx+si-0x3],al
000005AF  FF                db 0xff
000005B0  7C00              jl 0x5b2
000005B2  0000              add [bx+si],al
000005B4  A0FDFF            mov al,[0xfffd]
000005B7  FF5400            call [si+0x0]
000005BA  0000              add [bx+si],al
000005BC  E0FD              loopne 0x5bb
000005BE  FF                db 0xff
000005BF  FF6800            jmp far [bx+si+0x0]
000005C2  0000              add [bx+si],al
000005C4  DD                db 0xdd
000005C5  FE                db 0xfe
000005C6  FF                db 0xff
000005C7  FFA00000          jmp [bx+si+0x0]
000005CB  0070FF            add [bx+si-0x1],dh
000005CE  FF                db 0xff
000005CF  FFCC              dec sp
000005D1  0000              add [bx+si],al
000005D3  00D0              add al,dl
000005D5  FF                db 0xff
000005D6  FF                db 0xff
000005D7  FF18              call far [bx+si]
000005D9  0100              add [bx+si],ax
000005DB  0014              add [si],dl
000005DD  0000              add [bx+si],al
000005DF  0000              add [bx+si],al
000005E1  0000              add [bx+si],al
000005E3  0001              add [bx+di],al
000005E5  7A52              jpe 0x639
000005E7  0001              add [bx+di],al
000005E9  7C08              jl 0x5f3
000005EB  011B              add [bp+di],bx
000005ED  0C04              or al,0x4
000005EF  0488              add al,0x88
000005F1  0100              add [bx+si],ax
000005F3  0010              add [bx+si],dl
000005F5  0000              add [bx+si],al
000005F7  001C              add [si],bl
000005F9  0000              add [bx+si],al
000005FB  0044FD            add [si-0x3],al
000005FE  FF                db 0xff
000005FF  FF                db 0xff
00000600  3B00              cmp ax,[bx+si]
00000602  0000              add [bx+si],al
00000604  004407            add [si+0x7],al
00000607  0810              or [bx+si],dl
00000609  0000              add [bx+si],al
0000060B  0030              add [bx+si],dh
0000060D  0000              add [bx+si],al
0000060F  0070FD            add [bx+si-0x3],dh
00000612  FF                db 0xff
00000613  FF05              inc word [di]
00000615  0000              add [bx+si],al
00000617  0000              add [bx+si],al
00000619  0000              add [bx+si],al
0000061B  0020              add [bx+si],ah
0000061D  0000              add [bx+si],al
0000061F  004400            add [si+0x0],al
00000622  0000              add [bx+si],al
00000624  FC                cld
00000625  FC                cld
00000626  FF                db 0xff
00000627  FF20              jmp [bx+si]
00000629  0000              add [bx+si],al
0000062B  0000              add [bx+si],al
0000062D  0E                push cs
0000062E  08460E            or [bp+0xe],al
00000631  0C4A              or al,0x4a
00000633  0F0B              ud2
00000635  7404              jz 0x63b
00000637  7800              js 0x639
00000639  3F                aas
0000063A  1A3B              sbb bh,[bp+di]
0000063C  2A32              sub dh,[bp+si]
0000063E  2422              and al,0x22
00000640  2800              sub [bx+si],al
00000642  0000              add [bx+si],al
00000644  680000            push word 0x0
00000647  0035              add [di],dh
00000649  FE                db 0xfe
0000064A  FF                db 0xff
0000064B  FF                db 0xff
0000064C  3D0000            cmp ax,0x0
0000064F  0000              add [bx+si],al
00000651  44                inc sp
00000652  0C01              or al,0x1
00000654  004710            add [bx+0x10],al
00000657  050275            add ax,0x7502
0000065A  00430F            add [bp+di+0xf],al
0000065D  03757C            add si,[di+0x7c]
00000660  06                push es
00000661  6A0C              push byte +0xc
00000663  0100              add [bx+si],ax
00000665  41                inc cx
00000666  C5430C            lds ax,[bp+di+0xc]
00000669  0404              add al,0x4
0000066B  004800            add [bx+si+0x0],cl
0000066E  0000              add [bx+si],al
00000670  94                xchg ax,sp
00000671  0000              add [bx+si],al
00000673  009CFEFF          add [si-0x2],bl
00000677  FF5D00            call far [di+0x0]
0000067A  0000              add [bx+si],al
0000067C  00450E            add [di+0xe],al
0000067F  08850241          or [di+0x4102],al
00000683  0E                push cs
00000684  0C87              or al,0x87
00000686  03410E            add ax,[bx+di+0xe]
00000689  10860441          adc [bp+0x4104],al
0000068D  0E                push cs
0000068E  1483              adc al,0x83
00000690  054E0E            add ax,0xe4e
00000693  20650E            and [di+0xe],ah
00000696  2441              and al,0x41
00000698  0E                push cs
00000699  28440E            sub [si+0xe],al
0000069C  2C44              sub al,0x44
0000069E  0E                push cs
0000069F  304D0E            xor [di+0xe],cl
000006A2  20470E            and [bx+0xe],al
000006A5  1441              adc al,0x41
000006A7  C3                ret
000006A8  0E                push cs
000006A9  1041C6            adc [bx+di-0x3a],al
000006AC  0E                push cs
000006AD  0C41              or al,0x41
000006AF  C7                db 0xc7
000006B0  0E                push cs
000006B1  0841C5            or [bx+di-0x3b],al
000006B4  0E                push cs
000006B5  0400              add al,0x0
000006B7  0010              add [bx+si],dl
000006B9  0000              add [bx+si],al
000006BB  00E0              add al,ah
000006BD  0000              add [bx+si],al
000006BF  00B0FEFF          add [bx+si-0x2],dh
000006C3  FF05              inc word [di]
000006C5  0000              add [bx+si],al
000006C7  0000              add [bx+si],al
000006C9  0000              add [bx+si],al
000006CB  0000              add [bx+si],al
000006CD  0000              add [bx+si],al
000006CF  0000              add [bx+si],al
000006D1  0000              add [bx+si],al
000006D3  0000              add [bx+si],al
000006D5  0000              add [bx+si],al
000006D7  0000              add [bx+si],al
000006D9  0000              add [bx+si],al
000006DB  0000              add [bx+si],al
000006DD  0000              add [bx+si],al
000006DF  0000              add [bx+si],al
000006E1  0000              add [bx+si],al
000006E3  0000              add [bx+si],al
000006E5  0000              add [bx+si],al
000006E7  0000              add [bx+si],al
000006E9  0000              add [bx+si],al
000006EB  0000              add [bx+si],al
000006ED  0000              add [bx+si],al
000006EF  0000              add [bx+si],al
000006F1  0000              add [bx+si],al
000006F3  0000              add [bx+si],al
000006F5  0000              add [bx+si],al
000006F7  0000              add [bx+si],al
000006F9  0000              add [bx+si],al
000006FB  0000              add [bx+si],al
000006FD  0000              add [bx+si],al
000006FF  0000              add [bx+si],al
00000701  0000              add [bx+si],al
00000703  0000              add [bx+si],al
00000705  0000              add [bx+si],al
00000707  0000              add [bx+si],al
00000709  0000              add [bx+si],al
0000070B  0000              add [bx+si],al
0000070D  0000              add [bx+si],al
0000070F  0000              add [bx+si],al
00000711  0000              add [bx+si],al
00000713  0000              add [bx+si],al
00000715  0000              add [bx+si],al
00000717  0000              add [bx+si],al
00000719  0000              add [bx+si],al
0000071B  0000              add [bx+si],al
0000071D  0000              add [bx+si],al
0000071F  0000              add [bx+si],al
00000721  0000              add [bx+si],al
00000723  0000              add [bx+si],al
00000725  0000              add [bx+si],al
00000727  0000              add [bx+si],al
00000729  0000              add [bx+si],al
0000072B  0000              add [bx+si],al
0000072D  0000              add [bx+si],al
0000072F  0000              add [bx+si],al
00000731  0000              add [bx+si],al
00000733  0000              add [bx+si],al
00000735  0000              add [bx+si],al
00000737  0000              add [bx+si],al
00000739  0000              add [bx+si],al
0000073B  0000              add [bx+si],al
0000073D  0000              add [bx+si],al
0000073F  0000              add [bx+si],al
00000741  0000              add [bx+si],al
00000743  0000              add [bx+si],al
00000745  0000              add [bx+si],al
00000747  0000              add [bx+si],al
00000749  0000              add [bx+si],al
0000074B  0000              add [bx+si],al
0000074D  0000              add [bx+si],al
0000074F  0000              add [bx+si],al
00000751  0000              add [bx+si],al
00000753  0000              add [bx+si],al
00000755  0000              add [bx+si],al
00000757  0000              add [bx+si],al
00000759  0000              add [bx+si],al
0000075B  0000              add [bx+si],al
0000075D  0000              add [bx+si],al
0000075F  0000              add [bx+si],al
00000761  0000              add [bx+si],al
00000763  0000              add [bx+si],al
00000765  0000              add [bx+si],al
00000767  0000              add [bx+si],al
00000769  0000              add [bx+si],al
0000076B  0000              add [bx+si],al
0000076D  0000              add [bx+si],al
0000076F  0000              add [bx+si],al
00000771  0000              add [bx+si],al
00000773  0000              add [bx+si],al
00000775  0000              add [bx+si],al
00000777  0000              add [bx+si],al
00000779  0000              add [bx+si],al
0000077B  0000              add [bx+si],al
0000077D  0000              add [bx+si],al
0000077F  0000              add [bx+si],al
00000781  0000              add [bx+si],al
00000783  0000              add [bx+si],al
00000785  0000              add [bx+si],al
00000787  0000              add [bx+si],al
00000789  0000              add [bx+si],al
0000078B  0000              add [bx+si],al
0000078D  0000              add [bx+si],al
0000078F  0000              add [bx+si],al
00000791  0000              add [bx+si],al
00000793  0000              add [bx+si],al
00000795  0000              add [bx+si],al
00000797  0000              add [bx+si],al
00000799  0000              add [bx+si],al
0000079B  0000              add [bx+si],al
0000079D  0000              add [bx+si],al
0000079F  0000              add [bx+si],al
000007A1  0000              add [bx+si],al
000007A3  0000              add [bx+si],al
000007A5  0000              add [bx+si],al
000007A7  0000              add [bx+si],al
000007A9  0000              add [bx+si],al
000007AB  0000              add [bx+si],al
000007AD  0000              add [bx+si],al
000007AF  0000              add [bx+si],al
000007B1  0000              add [bx+si],al
000007B3  0000              add [bx+si],al
000007B5  0000              add [bx+si],al
000007B7  0000              add [bx+si],al
000007B9  0000              add [bx+si],al
000007BB  0000              add [bx+si],al
000007BD  0000              add [bx+si],al
000007BF  0000              add [bx+si],al
000007C1  0000              add [bx+si],al
000007C3  0000              add [bx+si],al
000007C5  0000              add [bx+si],al
000007C7  0000              add [bx+si],al
000007C9  0000              add [bx+si],al
000007CB  0000              add [bx+si],al
000007CD  0000              add [bx+si],al
000007CF  0000              add [bx+si],al
000007D1  0000              add [bx+si],al
000007D3  0000              add [bx+si],al
000007D5  0000              add [bx+si],al
000007D7  0000              add [bx+si],al
000007D9  0000              add [bx+si],al
000007DB  0000              add [bx+si],al
000007DD  0000              add [bx+si],al
000007DF  0000              add [bx+si],al
000007E1  0000              add [bx+si],al
000007E3  0000              add [bx+si],al
000007E5  0000              add [bx+si],al
000007E7  0000              add [bx+si],al
000007E9  0000              add [bx+si],al
000007EB  0000              add [bx+si],al
000007ED  0000              add [bx+si],al
000007EF  0000              add [bx+si],al
000007F1  0000              add [bx+si],al
000007F3  0000              add [bx+si],al
000007F5  0000              add [bx+si],al
000007F7  0000              add [bx+si],al
000007F9  0000              add [bx+si],al
000007FB  0000              add [bx+si],al
000007FD  0000              add [bx+si],al
000007FF  0000              add [bx+si],al
00000801  0000              add [bx+si],al
00000803  0000              add [bx+si],al
00000805  0000              add [bx+si],al
00000807  0000              add [bx+si],al
00000809  0000              add [bx+si],al
0000080B  0000              add [bx+si],al
0000080D  0000              add [bx+si],al
0000080F  0000              add [bx+si],al
00000811  0000              add [bx+si],al
00000813  0000              add [bx+si],al
00000815  0000              add [bx+si],al
00000817  0000              add [bx+si],al
00000819  0000              add [bx+si],al
0000081B  0000              add [bx+si],al
0000081D  0000              add [bx+si],al
0000081F  0000              add [bx+si],al
00000821  0000              add [bx+si],al
00000823  0000              add [bx+si],al
00000825  0000              add [bx+si],al
00000827  0000              add [bx+si],al
00000829  0000              add [bx+si],al
0000082B  0000              add [bx+si],al
0000082D  0000              add [bx+si],al
0000082F  0000              add [bx+si],al
00000831  0000              add [bx+si],al
00000833  0000              add [bx+si],al
00000835  0000              add [bx+si],al
00000837  0000              add [bx+si],al
00000839  0000              add [bx+si],al
0000083B  0000              add [bx+si],al
0000083D  0000              add [bx+si],al
0000083F  0000              add [bx+si],al
00000841  0000              add [bx+si],al
00000843  0000              add [bx+si],al
00000845  0000              add [bx+si],al
00000847  0000              add [bx+si],al
00000849  0000              add [bx+si],al
0000084B  0000              add [bx+si],al
0000084D  0000              add [bx+si],al
0000084F  0000              add [bx+si],al
00000851  0000              add [bx+si],al
00000853  0000              add [bx+si],al
00000855  0000              add [bx+si],al
00000857  0000              add [bx+si],al
00000859  0000              add [bx+si],al
0000085B  0000              add [bx+si],al
0000085D  0000              add [bx+si],al
0000085F  0000              add [bx+si],al
00000861  0000              add [bx+si],al
00000863  0000              add [bx+si],al
00000865  0000              add [bx+si],al
00000867  0000              add [bx+si],al
00000869  0000              add [bx+si],al
0000086B  0000              add [bx+si],al
0000086D  0000              add [bx+si],al
0000086F  0000              add [bx+si],al
00000871  0000              add [bx+si],al
00000873  0000              add [bx+si],al
00000875  0000              add [bx+si],al
00000877  0000              add [bx+si],al
00000879  0000              add [bx+si],al
0000087B  0000              add [bx+si],al
0000087D  0000              add [bx+si],al
0000087F  0000              add [bx+si],al
00000881  0000              add [bx+si],al
00000883  0000              add [bx+si],al
00000885  0000              add [bx+si],al
00000887  0000              add [bx+si],al
00000889  0000              add [bx+si],al
0000088B  0000              add [bx+si],al
0000088D  0000              add [bx+si],al
0000088F  0000              add [bx+si],al
00000891  0000              add [bx+si],al
00000893  0000              add [bx+si],al
00000895  0000              add [bx+si],al
00000897  0000              add [bx+si],al
00000899  0000              add [bx+si],al
0000089B  0000              add [bx+si],al
0000089D  0000              add [bx+si],al
0000089F  0000              add [bx+si],al
000008A1  0000              add [bx+si],al
000008A3  0000              add [bx+si],al
000008A5  0000              add [bx+si],al
000008A7  0000              add [bx+si],al
000008A9  0000              add [bx+si],al
000008AB  0000              add [bx+si],al
000008AD  0000              add [bx+si],al
000008AF  0000              add [bx+si],al
000008B1  0000              add [bx+si],al
000008B3  0000              add [bx+si],al
000008B5  0000              add [bx+si],al
000008B7  0000              add [bx+si],al
000008B9  0000              add [bx+si],al
000008BB  0000              add [bx+si],al
000008BD  0000              add [bx+si],al
000008BF  0000              add [bx+si],al
000008C1  0000              add [bx+si],al
000008C3  0000              add [bx+si],al
000008C5  0000              add [bx+si],al
000008C7  0000              add [bx+si],al
000008C9  0000              add [bx+si],al
000008CB  0000              add [bx+si],al
000008CD  0000              add [bx+si],al
000008CF  0000              add [bx+si],al
000008D1  0000              add [bx+si],al
000008D3  0000              add [bx+si],al
000008D5  0000              add [bx+si],al
000008D7  0000              add [bx+si],al
000008D9  0000              add [bx+si],al
000008DB  0000              add [bx+si],al
000008DD  0000              add [bx+si],al
000008DF  0000              add [bx+si],al
000008E1  0000              add [bx+si],al
000008E3  0000              add [bx+si],al
000008E5  0000              add [bx+si],al
000008E7  0000              add [bx+si],al
000008E9  0000              add [bx+si],al
000008EB  0000              add [bx+si],al
000008ED  0000              add [bx+si],al
000008EF  0000              add [bx+si],al
000008F1  0000              add [bx+si],al
000008F3  0000              add [bx+si],al
000008F5  0000              add [bx+si],al
000008F7  0000              add [bx+si],al
000008F9  0000              add [bx+si],al
000008FB  0000              add [bx+si],al
000008FD  0000              add [bx+si],al
000008FF  0000              add [bx+si],al
00000901  0000              add [bx+si],al
00000903  0000              add [bx+si],al
00000905  0000              add [bx+si],al
00000907  0000              add [bx+si],al
00000909  0000              add [bx+si],al
0000090B  0000              add [bx+si],al
0000090D  0000              add [bx+si],al
0000090F  0000              add [bx+si],al
00000911  0000              add [bx+si],al
00000913  0000              add [bx+si],al
00000915  0000              add [bx+si],al
00000917  0000              add [bx+si],al
00000919  0000              add [bx+si],al
0000091B  0000              add [bx+si],al
0000091D  0000              add [bx+si],al
0000091F  0000              add [bx+si],al
00000921  0000              add [bx+si],al
00000923  0000              add [bx+si],al
00000925  0000              add [bx+si],al
00000927  0000              add [bx+si],al
00000929  0000              add [bx+si],al
0000092B  0000              add [bx+si],al
0000092D  0000              add [bx+si],al
0000092F  0000              add [bx+si],al
00000931  0000              add [bx+si],al
00000933  0000              add [bx+si],al
00000935  0000              add [bx+si],al
00000937  0000              add [bx+si],al
00000939  0000              add [bx+si],al
0000093B  0000              add [bx+si],al
0000093D  0000              add [bx+si],al
0000093F  0000              add [bx+si],al
00000941  0000              add [bx+si],al
00000943  0000              add [bx+si],al
00000945  0000              add [bx+si],al
00000947  0000              add [bx+si],al
00000949  0000              add [bx+si],al
0000094B  0000              add [bx+si],al
0000094D  0000              add [bx+si],al
0000094F  0000              add [bx+si],al
00000951  0000              add [bx+si],al
00000953  0000              add [bx+si],al
00000955  0000              add [bx+si],al
00000957  0000              add [bx+si],al
00000959  0000              add [bx+si],al
0000095B  0000              add [bx+si],al
0000095D  0000              add [bx+si],al
0000095F  0000              add [bx+si],al
00000961  0000              add [bx+si],al
00000963  0000              add [bx+si],al
00000965  0000              add [bx+si],al
00000967  0000              add [bx+si],al
00000969  0000              add [bx+si],al
0000096B  0000              add [bx+si],al
0000096D  0000              add [bx+si],al
0000096F  0000              add [bx+si],al
00000971  0000              add [bx+si],al
00000973  0000              add [bx+si],al
00000975  0000              add [bx+si],al
00000977  0000              add [bx+si],al
00000979  0000              add [bx+si],al
0000097B  0000              add [bx+si],al
0000097D  0000              add [bx+si],al
0000097F  0000              add [bx+si],al
00000981  0000              add [bx+si],al
00000983  0000              add [bx+si],al
00000985  0000              add [bx+si],al
00000987  0000              add [bx+si],al
00000989  0000              add [bx+si],al
0000098B  0000              add [bx+si],al
0000098D  0000              add [bx+si],al
0000098F  0000              add [bx+si],al
00000991  0000              add [bx+si],al
00000993  0000              add [bx+si],al
00000995  0000              add [bx+si],al
00000997  0000              add [bx+si],al
00000999  0000              add [bx+si],al
0000099B  0000              add [bx+si],al
0000099D  0000              add [bx+si],al
0000099F  0000              add [bx+si],al
000009A1  0000              add [bx+si],al
000009A3  0000              add [bx+si],al
000009A5  0000              add [bx+si],al
000009A7  0000              add [bx+si],al
000009A9  0000              add [bx+si],al
000009AB  0000              add [bx+si],al
000009AD  0000              add [bx+si],al
000009AF  0000              add [bx+si],al
000009B1  0000              add [bx+si],al
000009B3  0000              add [bx+si],al
000009B5  0000              add [bx+si],al
000009B7  0000              add [bx+si],al
000009B9  0000              add [bx+si],al
000009BB  0000              add [bx+si],al
000009BD  0000              add [bx+si],al
000009BF  0000              add [bx+si],al
000009C1  0000              add [bx+si],al
000009C3  0000              add [bx+si],al
000009C5  0000              add [bx+si],al
000009C7  0000              add [bx+si],al
000009C9  0000              add [bx+si],al
000009CB  0000              add [bx+si],al
000009CD  0000              add [bx+si],al
000009CF  0000              add [bx+si],al
000009D1  0000              add [bx+si],al
000009D3  0000              add [bx+si],al
000009D5  0000              add [bx+si],al
000009D7  0000              add [bx+si],al
000009D9  0000              add [bx+si],al
000009DB  0000              add [bx+si],al
000009DD  0000              add [bx+si],al
000009DF  0000              add [bx+si],al
000009E1  0000              add [bx+si],al
000009E3  0000              add [bx+si],al
000009E5  0000              add [bx+si],al
000009E7  0000              add [bx+si],al
000009E9  0000              add [bx+si],al
000009EB  0000              add [bx+si],al
000009ED  0000              add [bx+si],al
000009EF  0000              add [bx+si],al
000009F1  0000              add [bx+si],al
000009F3  0000              add [bx+si],al
000009F5  0000              add [bx+si],al
000009F7  0000              add [bx+si],al
000009F9  0000              add [bx+si],al
000009FB  0000              add [bx+si],al
000009FD  0000              add [bx+si],al
000009FF  0000              add [bx+si],al
00000A01  0000              add [bx+si],al
00000A03  0000              add [bx+si],al
00000A05  0000              add [bx+si],al
00000A07  0000              add [bx+si],al
00000A09  0000              add [bx+si],al
00000A0B  0000              add [bx+si],al
00000A0D  0000              add [bx+si],al
00000A0F  0000              add [bx+si],al
00000A11  0000              add [bx+si],al
00000A13  0000              add [bx+si],al
00000A15  0000              add [bx+si],al
00000A17  0000              add [bx+si],al
00000A19  0000              add [bx+si],al
00000A1B  0000              add [bx+si],al
00000A1D  0000              add [bx+si],al
00000A1F  0000              add [bx+si],al
00000A21  0000              add [bx+si],al
00000A23  0000              add [bx+si],al
00000A25  0000              add [bx+si],al
00000A27  0000              add [bx+si],al
00000A29  0000              add [bx+si],al
00000A2B  0000              add [bx+si],al
00000A2D  0000              add [bx+si],al
00000A2F  0000              add [bx+si],al
00000A31  0000              add [bx+si],al
00000A33  0000              add [bx+si],al
00000A35  0000              add [bx+si],al
00000A37  0000              add [bx+si],al
00000A39  0000              add [bx+si],al
00000A3B  0000              add [bx+si],al
00000A3D  0000              add [bx+si],al
00000A3F  0000              add [bx+si],al
00000A41  0000              add [bx+si],al
00000A43  0000              add [bx+si],al
00000A45  0000              add [bx+si],al
00000A47  0000              add [bx+si],al
00000A49  0000              add [bx+si],al
00000A4B  0000              add [bx+si],al
00000A4D  0000              add [bx+si],al
00000A4F  0000              add [bx+si],al
00000A51  0000              add [bx+si],al
00000A53  0000              add [bx+si],al
00000A55  0000              add [bx+si],al
00000A57  0000              add [bx+si],al
00000A59  0000              add [bx+si],al
00000A5B  0000              add [bx+si],al
00000A5D  0000              add [bx+si],al
00000A5F  0000              add [bx+si],al
00000A61  0000              add [bx+si],al
00000A63  0000              add [bx+si],al
00000A65  0000              add [bx+si],al
00000A67  0000              add [bx+si],al
00000A69  0000              add [bx+si],al
00000A6B  0000              add [bx+si],al
00000A6D  0000              add [bx+si],al
00000A6F  0000              add [bx+si],al
00000A71  0000              add [bx+si],al
00000A73  0000              add [bx+si],al
00000A75  0000              add [bx+si],al
00000A77  0000              add [bx+si],al
00000A79  0000              add [bx+si],al
00000A7B  0000              add [bx+si],al
00000A7D  0000              add [bx+si],al
00000A7F  0000              add [bx+si],al
00000A81  0000              add [bx+si],al
00000A83  0000              add [bx+si],al
00000A85  0000              add [bx+si],al
00000A87  0000              add [bx+si],al
00000A89  0000              add [bx+si],al
00000A8B  0000              add [bx+si],al
00000A8D  0000              add [bx+si],al
00000A8F  0000              add [bx+si],al
00000A91  0000              add [bx+si],al
00000A93  0000              add [bx+si],al
00000A95  0000              add [bx+si],al
00000A97  0000              add [bx+si],al
00000A99  0000              add [bx+si],al
00000A9B  0000              add [bx+si],al
00000A9D  0000              add [bx+si],al
00000A9F  0000              add [bx+si],al
00000AA1  0000              add [bx+si],al
00000AA3  0000              add [bx+si],al
00000AA5  0000              add [bx+si],al
00000AA7  0000              add [bx+si],al
00000AA9  0000              add [bx+si],al
00000AAB  0000              add [bx+si],al
00000AAD  0000              add [bx+si],al
00000AAF  0000              add [bx+si],al
00000AB1  0000              add [bx+si],al
00000AB3  0000              add [bx+si],al
00000AB5  0000              add [bx+si],al
00000AB7  0000              add [bx+si],al
00000AB9  0000              add [bx+si],al
00000ABB  0000              add [bx+si],al
00000ABD  0000              add [bx+si],al
00000ABF  0000              add [bx+si],al
00000AC1  0000              add [bx+si],al
00000AC3  0000              add [bx+si],al
00000AC5  0000              add [bx+si],al
00000AC7  0000              add [bx+si],al
00000AC9  0000              add [bx+si],al
00000ACB  0000              add [bx+si],al
00000ACD  0000              add [bx+si],al
00000ACF  0000              add [bx+si],al
00000AD1  0000              add [bx+si],al
00000AD3  0000              add [bx+si],al
00000AD5  0000              add [bx+si],al
00000AD7  0000              add [bx+si],al
00000AD9  0000              add [bx+si],al
00000ADB  0000              add [bx+si],al
00000ADD  0000              add [bx+si],al
00000ADF  0000              add [bx+si],al
00000AE1  0000              add [bx+si],al
00000AE3  0000              add [bx+si],al
00000AE5  0000              add [bx+si],al
00000AE7  0000              add [bx+si],al
00000AE9  0000              add [bx+si],al
00000AEB  0000              add [bx+si],al
00000AED  0000              add [bx+si],al
00000AEF  0000              add [bx+si],al
00000AF1  0000              add [bx+si],al
00000AF3  0000              add [bx+si],al
00000AF5  0000              add [bx+si],al
00000AF7  0000              add [bx+si],al
00000AF9  0000              add [bx+si],al
00000AFB  0000              add [bx+si],al
00000AFD  0000              add [bx+si],al
00000AFF  0000              add [bx+si],al
00000B01  0000              add [bx+si],al
00000B03  0000              add [bx+si],al
00000B05  0000              add [bx+si],al
00000B07  0000              add [bx+si],al
00000B09  0000              add [bx+si],al
00000B0B  0000              add [bx+si],al
00000B0D  0000              add [bx+si],al
00000B0F  0000              add [bx+si],al
00000B11  0000              add [bx+si],al
00000B13  0000              add [bx+si],al
00000B15  0000              add [bx+si],al
00000B17  0000              add [bx+si],al
00000B19  0000              add [bx+si],al
00000B1B  0000              add [bx+si],al
00000B1D  0000              add [bx+si],al
00000B1F  0000              add [bx+si],al
00000B21  0000              add [bx+si],al
00000B23  0000              add [bx+si],al
00000B25  0000              add [bx+si],al
00000B27  0000              add [bx+si],al
00000B29  0000              add [bx+si],al
00000B2B  0000              add [bx+si],al
00000B2D  0000              add [bx+si],al
00000B2F  0000              add [bx+si],al
00000B31  0000              add [bx+si],al
00000B33  0000              add [bx+si],al
00000B35  0000              add [bx+si],al
00000B37  0000              add [bx+si],al
00000B39  0000              add [bx+si],al
00000B3B  0000              add [bx+si],al
00000B3D  0000              add [bx+si],al
00000B3F  0000              add [bx+si],al
00000B41  0000              add [bx+si],al
00000B43  0000              add [bx+si],al
00000B45  0000              add [bx+si],al
00000B47  0000              add [bx+si],al
00000B49  0000              add [bx+si],al
00000B4B  0000              add [bx+si],al
00000B4D  0000              add [bx+si],al
00000B4F  0000              add [bx+si],al
00000B51  0000              add [bx+si],al
00000B53  0000              add [bx+si],al
00000B55  0000              add [bx+si],al
00000B57  0000              add [bx+si],al
00000B59  0000              add [bx+si],al
00000B5B  0000              add [bx+si],al
00000B5D  0000              add [bx+si],al
00000B5F  0000              add [bx+si],al
00000B61  0000              add [bx+si],al
00000B63  0000              add [bx+si],al
00000B65  0000              add [bx+si],al
00000B67  0000              add [bx+si],al
00000B69  0000              add [bx+si],al
00000B6B  0000              add [bx+si],al
00000B6D  0000              add [bx+si],al
00000B6F  0000              add [bx+si],al
00000B71  0000              add [bx+si],al
00000B73  0000              add [bx+si],al
00000B75  0000              add [bx+si],al
00000B77  0000              add [bx+si],al
00000B79  0000              add [bx+si],al
00000B7B  0000              add [bx+si],al
00000B7D  0000              add [bx+si],al
00000B7F  0000              add [bx+si],al
00000B81  0000              add [bx+si],al
00000B83  0000              add [bx+si],al
00000B85  0000              add [bx+si],al
00000B87  0000              add [bx+si],al
00000B89  0000              add [bx+si],al
00000B8B  0000              add [bx+si],al
00000B8D  0000              add [bx+si],al
00000B8F  0000              add [bx+si],al
00000B91  0000              add [bx+si],al
00000B93  0000              add [bx+si],al
00000B95  0000              add [bx+si],al
00000B97  0000              add [bx+si],al
00000B99  0000              add [bx+si],al
00000B9B  0000              add [bx+si],al
00000B9D  0000              add [bx+si],al
00000B9F  0000              add [bx+si],al
00000BA1  0000              add [bx+si],al
00000BA3  0000              add [bx+si],al
00000BA5  0000              add [bx+si],al
00000BA7  0000              add [bx+si],al
00000BA9  0000              add [bx+si],al
00000BAB  0000              add [bx+si],al
00000BAD  0000              add [bx+si],al
00000BAF  0000              add [bx+si],al
00000BB1  0000              add [bx+si],al
00000BB3  0000              add [bx+si],al
00000BB5  0000              add [bx+si],al
00000BB7  0000              add [bx+si],al
00000BB9  0000              add [bx+si],al
00000BBB  0000              add [bx+si],al
00000BBD  0000              add [bx+si],al
00000BBF  0000              add [bx+si],al
00000BC1  0000              add [bx+si],al
00000BC3  0000              add [bx+si],al
00000BC5  0000              add [bx+si],al
00000BC7  0000              add [bx+si],al
00000BC9  0000              add [bx+si],al
00000BCB  0000              add [bx+si],al
00000BCD  0000              add [bx+si],al
00000BCF  0000              add [bx+si],al
00000BD1  0000              add [bx+si],al
00000BD3  0000              add [bx+si],al
00000BD5  0000              add [bx+si],al
00000BD7  0000              add [bx+si],al
00000BD9  0000              add [bx+si],al
00000BDB  0000              add [bx+si],al
00000BDD  0000              add [bx+si],al
00000BDF  0000              add [bx+si],al
00000BE1  0000              add [bx+si],al
00000BE3  0000              add [bx+si],al
00000BE5  0000              add [bx+si],al
00000BE7  0000              add [bx+si],al
00000BE9  0000              add [bx+si],al
00000BEB  0000              add [bx+si],al
00000BED  0000              add [bx+si],al
00000BEF  0000              add [bx+si],al
00000BF1  0000              add [bx+si],al
00000BF3  0000              add [bx+si],al
00000BF5  0000              add [bx+si],al
00000BF7  0000              add [bx+si],al
00000BF9  0000              add [bx+si],al
00000BFB  0000              add [bx+si],al
00000BFD  0000              add [bx+si],al
00000BFF  0000              add [bx+si],al
00000C01  0000              add [bx+si],al
00000C03  0000              add [bx+si],al
00000C05  0000              add [bx+si],al
00000C07  0000              add [bx+si],al
00000C09  0000              add [bx+si],al
00000C0B  0000              add [bx+si],al
00000C0D  0000              add [bx+si],al
00000C0F  0000              add [bx+si],al
00000C11  0000              add [bx+si],al
00000C13  0000              add [bx+si],al
00000C15  0000              add [bx+si],al
00000C17  0000              add [bx+si],al
00000C19  0000              add [bx+si],al
00000C1B  0000              add [bx+si],al
00000C1D  0000              add [bx+si],al
00000C1F  0000              add [bx+si],al
00000C21  0000              add [bx+si],al
00000C23  0000              add [bx+si],al
00000C25  0000              add [bx+si],al
00000C27  0000              add [bx+si],al
00000C29  0000              add [bx+si],al
00000C2B  0000              add [bx+si],al
00000C2D  0000              add [bx+si],al
00000C2F  0000              add [bx+si],al
00000C31  0000              add [bx+si],al
00000C33  0000              add [bx+si],al
00000C35  0000              add [bx+si],al
00000C37  0000              add [bx+si],al
00000C39  0000              add [bx+si],al
00000C3B  0000              add [bx+si],al
00000C3D  0000              add [bx+si],al
00000C3F  0000              add [bx+si],al
00000C41  0000              add [bx+si],al
00000C43  0000              add [bx+si],al
00000C45  0000              add [bx+si],al
00000C47  0000              add [bx+si],al
00000C49  0000              add [bx+si],al
00000C4B  0000              add [bx+si],al
00000C4D  0000              add [bx+si],al
00000C4F  0000              add [bx+si],al
00000C51  0000              add [bx+si],al
00000C53  0000              add [bx+si],al
00000C55  0000              add [bx+si],al
00000C57  0000              add [bx+si],al
00000C59  0000              add [bx+si],al
00000C5B  0000              add [bx+si],al
00000C5D  0000              add [bx+si],al
00000C5F  0000              add [bx+si],al
00000C61  0000              add [bx+si],al
00000C63  0000              add [bx+si],al
00000C65  0000              add [bx+si],al
00000C67  0000              add [bx+si],al
00000C69  0000              add [bx+si],al
00000C6B  0000              add [bx+si],al
00000C6D  0000              add [bx+si],al
00000C6F  0000              add [bx+si],al
00000C71  0000              add [bx+si],al
00000C73  0000              add [bx+si],al
00000C75  0000              add [bx+si],al
00000C77  0000              add [bx+si],al
00000C79  0000              add [bx+si],al
00000C7B  0000              add [bx+si],al
00000C7D  0000              add [bx+si],al
00000C7F  0000              add [bx+si],al
00000C81  0000              add [bx+si],al
00000C83  0000              add [bx+si],al
00000C85  0000              add [bx+si],al
00000C87  0000              add [bx+si],al
00000C89  0000              add [bx+si],al
00000C8B  0000              add [bx+si],al
00000C8D  0000              add [bx+si],al
00000C8F  0000              add [bx+si],al
00000C91  0000              add [bx+si],al
00000C93  0000              add [bx+si],al
00000C95  0000              add [bx+si],al
00000C97  0000              add [bx+si],al
00000C99  0000              add [bx+si],al
00000C9B  0000              add [bx+si],al
00000C9D  0000              add [bx+si],al
00000C9F  0000              add [bx+si],al
00000CA1  0000              add [bx+si],al
00000CA3  0000              add [bx+si],al
00000CA5  0000              add [bx+si],al
00000CA7  0000              add [bx+si],al
00000CA9  0000              add [bx+si],al
00000CAB  0000              add [bx+si],al
00000CAD  0000              add [bx+si],al
00000CAF  0000              add [bx+si],al
00000CB1  0000              add [bx+si],al
00000CB3  0000              add [bx+si],al
00000CB5  0000              add [bx+si],al
00000CB7  0000              add [bx+si],al
00000CB9  0000              add [bx+si],al
00000CBB  0000              add [bx+si],al
00000CBD  0000              add [bx+si],al
00000CBF  0000              add [bx+si],al
00000CC1  0000              add [bx+si],al
00000CC3  0000              add [bx+si],al
00000CC5  0000              add [bx+si],al
00000CC7  0000              add [bx+si],al
00000CC9  0000              add [bx+si],al
00000CCB  0000              add [bx+si],al
00000CCD  0000              add [bx+si],al
00000CCF  0000              add [bx+si],al
00000CD1  0000              add [bx+si],al
00000CD3  0000              add [bx+si],al
00000CD5  0000              add [bx+si],al
00000CD7  0000              add [bx+si],al
00000CD9  0000              add [bx+si],al
00000CDB  0000              add [bx+si],al
00000CDD  0000              add [bx+si],al
00000CDF  0000              add [bx+si],al
00000CE1  0000              add [bx+si],al
00000CE3  0000              add [bx+si],al
00000CE5  0000              add [bx+si],al
00000CE7  0000              add [bx+si],al
00000CE9  0000              add [bx+si],al
00000CEB  0000              add [bx+si],al
00000CED  0000              add [bx+si],al
00000CEF  0000              add [bx+si],al
00000CF1  0000              add [bx+si],al
00000CF3  0000              add [bx+si],al
00000CF5  0000              add [bx+si],al
00000CF7  0000              add [bx+si],al
00000CF9  0000              add [bx+si],al
00000CFB  0000              add [bx+si],al
00000CFD  0000              add [bx+si],al
00000CFF  0000              add [bx+si],al
00000D01  0000              add [bx+si],al
00000D03  0000              add [bx+si],al
00000D05  0000              add [bx+si],al
00000D07  0000              add [bx+si],al
00000D09  0000              add [bx+si],al
00000D0B  0000              add [bx+si],al
00000D0D  0000              add [bx+si],al
00000D0F  0000              add [bx+si],al
00000D11  0000              add [bx+si],al
00000D13  0000              add [bx+si],al
00000D15  0000              add [bx+si],al
00000D17  0000              add [bx+si],al
00000D19  0000              add [bx+si],al
00000D1B  0000              add [bx+si],al
00000D1D  0000              add [bx+si],al
00000D1F  0000              add [bx+si],al
00000D21  0000              add [bx+si],al
00000D23  0000              add [bx+si],al
00000D25  0000              add [bx+si],al
00000D27  0000              add [bx+si],al
00000D29  0000              add [bx+si],al
00000D2B  0000              add [bx+si],al
00000D2D  0000              add [bx+si],al
00000D2F  0000              add [bx+si],al
00000D31  0000              add [bx+si],al
00000D33  0000              add [bx+si],al
00000D35  0000              add [bx+si],al
00000D37  0000              add [bx+si],al
00000D39  0000              add [bx+si],al
00000D3B  0000              add [bx+si],al
00000D3D  0000              add [bx+si],al
00000D3F  0000              add [bx+si],al
00000D41  0000              add [bx+si],al
00000D43  0000              add [bx+si],al
00000D45  0000              add [bx+si],al
00000D47  0000              add [bx+si],al
00000D49  0000              add [bx+si],al
00000D4B  0000              add [bx+si],al
00000D4D  0000              add [bx+si],al
00000D4F  0000              add [bx+si],al
00000D51  0000              add [bx+si],al
00000D53  0000              add [bx+si],al
00000D55  0000              add [bx+si],al
00000D57  0000              add [bx+si],al
00000D59  0000              add [bx+si],al
00000D5B  0000              add [bx+si],al
00000D5D  0000              add [bx+si],al
00000D5F  0000              add [bx+si],al
00000D61  0000              add [bx+si],al
00000D63  0000              add [bx+si],al
00000D65  0000              add [bx+si],al
00000D67  0000              add [bx+si],al
00000D69  0000              add [bx+si],al
00000D6B  0000              add [bx+si],al
00000D6D  0000              add [bx+si],al
00000D6F  0000              add [bx+si],al
00000D71  0000              add [bx+si],al
00000D73  0000              add [bx+si],al
00000D75  0000              add [bx+si],al
00000D77  0000              add [bx+si],al
00000D79  0000              add [bx+si],al
00000D7B  0000              add [bx+si],al
00000D7D  0000              add [bx+si],al
00000D7F  0000              add [bx+si],al
00000D81  0000              add [bx+si],al
00000D83  0000              add [bx+si],al
00000D85  0000              add [bx+si],al
00000D87  0000              add [bx+si],al
00000D89  0000              add [bx+si],al
00000D8B  0000              add [bx+si],al
00000D8D  0000              add [bx+si],al
00000D8F  0000              add [bx+si],al
00000D91  0000              add [bx+si],al
00000D93  0000              add [bx+si],al
00000D95  0000              add [bx+si],al
00000D97  0000              add [bx+si],al
00000D99  0000              add [bx+si],al
00000D9B  0000              add [bx+si],al
00000D9D  0000              add [bx+si],al
00000D9F  0000              add [bx+si],al
00000DA1  0000              add [bx+si],al
00000DA3  0000              add [bx+si],al
00000DA5  0000              add [bx+si],al
00000DA7  0000              add [bx+si],al
00000DA9  0000              add [bx+si],al
00000DAB  0000              add [bx+si],al
00000DAD  0000              add [bx+si],al
00000DAF  0000              add [bx+si],al
00000DB1  0000              add [bx+si],al
00000DB3  0000              add [bx+si],al
00000DB5  0000              add [bx+si],al
00000DB7  0000              add [bx+si],al
00000DB9  0000              add [bx+si],al
00000DBB  0000              add [bx+si],al
00000DBD  0000              add [bx+si],al
00000DBF  0000              add [bx+si],al
00000DC1  0000              add [bx+si],al
00000DC3  0000              add [bx+si],al
00000DC5  0000              add [bx+si],al
00000DC7  0000              add [bx+si],al
00000DC9  0000              add [bx+si],al
00000DCB  0000              add [bx+si],al
00000DCD  0000              add [bx+si],al
00000DCF  0000              add [bx+si],al
00000DD1  0000              add [bx+si],al
00000DD3  0000              add [bx+si],al
00000DD5  0000              add [bx+si],al
00000DD7  0000              add [bx+si],al
00000DD9  0000              add [bx+si],al
00000DDB  0000              add [bx+si],al
00000DDD  0000              add [bx+si],al
00000DDF  0000              add [bx+si],al
00000DE1  0000              add [bx+si],al
00000DE3  0000              add [bx+si],al
00000DE5  0000              add [bx+si],al
00000DE7  0000              add [bx+si],al
00000DE9  0000              add [bx+si],al
00000DEB  0000              add [bx+si],al
00000DED  0000              add [bx+si],al
00000DEF  0000              add [bx+si],al
00000DF1  0000              add [bx+si],al
00000DF3  0000              add [bx+si],al
00000DF5  0000              add [bx+si],al
00000DF7  0000              add [bx+si],al
00000DF9  0000              add [bx+si],al
00000DFB  0000              add [bx+si],al
00000DFD  0000              add [bx+si],al
00000DFF  0000              add [bx+si],al
00000E01  0000              add [bx+si],al
00000E03  0000              add [bx+si],al
00000E05  0000              add [bx+si],al
00000E07  0000              add [bx+si],al
00000E09  0000              add [bx+si],al
00000E0B  0000              add [bx+si],al
00000E0D  0000              add [bx+si],al
00000E0F  0000              add [bx+si],al
00000E11  0000              add [bx+si],al
00000E13  0000              add [bx+si],al
00000E15  0000              add [bx+si],al
00000E17  0000              add [bx+si],al
00000E19  0000              add [bx+si],al
00000E1B  0000              add [bx+si],al
00000E1D  0000              add [bx+si],al
00000E1F  0000              add [bx+si],al
00000E21  0000              add [bx+si],al
00000E23  0000              add [bx+si],al
00000E25  0000              add [bx+si],al
00000E27  0000              add [bx+si],al
00000E29  0000              add [bx+si],al
00000E2B  0000              add [bx+si],al
00000E2D  0000              add [bx+si],al
00000E2F  0000              add [bx+si],al
00000E31  0000              add [bx+si],al
00000E33  0000              add [bx+si],al
00000E35  0000              add [bx+si],al
00000E37  0000              add [bx+si],al
00000E39  0000              add [bx+si],al
00000E3B  0000              add [bx+si],al
00000E3D  0000              add [bx+si],al
00000E3F  0000              add [bx+si],al
00000E41  0000              add [bx+si],al
00000E43  0000              add [bx+si],al
00000E45  0000              add [bx+si],al
00000E47  0000              add [bx+si],al
00000E49  0000              add [bx+si],al
00000E4B  0000              add [bx+si],al
00000E4D  0000              add [bx+si],al
00000E4F  0000              add [bx+si],al
00000E51  0000              add [bx+si],al
00000E53  0000              add [bx+si],al
00000E55  0000              add [bx+si],al
00000E57  0000              add [bx+si],al
00000E59  0000              add [bx+si],al
00000E5B  0000              add [bx+si],al
00000E5D  0000              add [bx+si],al
00000E5F  0000              add [bx+si],al
00000E61  0000              add [bx+si],al
00000E63  0000              add [bx+si],al
00000E65  0000              add [bx+si],al
00000E67  0000              add [bx+si],al
00000E69  0000              add [bx+si],al
00000E6B  0000              add [bx+si],al
00000E6D  0000              add [bx+si],al
00000E6F  0000              add [bx+si],al
00000E71  0000              add [bx+si],al
00000E73  0000              add [bx+si],al
00000E75  0000              add [bx+si],al
00000E77  0000              add [bx+si],al
00000E79  0000              add [bx+si],al
00000E7B  0000              add [bx+si],al
00000E7D  0000              add [bx+si],al
00000E7F  0000              add [bx+si],al
00000E81  0000              add [bx+si],al
00000E83  0000              add [bx+si],al
00000E85  0000              add [bx+si],al
00000E87  0000              add [bx+si],al
00000E89  0000              add [bx+si],al
00000E8B  0000              add [bx+si],al
00000E8D  0000              add [bx+si],al
00000E8F  0000              add [bx+si],al
00000E91  0000              add [bx+si],al
00000E93  0000              add [bx+si],al
00000E95  0000              add [bx+si],al
00000E97  0000              add [bx+si],al
00000E99  0000              add [bx+si],al
00000E9B  0000              add [bx+si],al
00000E9D  0000              add [bx+si],al
00000E9F  0000              add [bx+si],al
00000EA1  0000              add [bx+si],al
00000EA3  0000              add [bx+si],al
00000EA5  0000              add [bx+si],al
00000EA7  0000              add [bx+si],al
00000EA9  0000              add [bx+si],al
00000EAB  0000              add [bx+si],al
00000EAD  0000              add [bx+si],al
00000EAF  0000              add [bx+si],al
00000EB1  0000              add [bx+si],al
00000EB3  0000              add [bx+si],al
00000EB5  0000              add [bx+si],al
00000EB7  0000              add [bx+si],al
00000EB9  0000              add [bx+si],al
00000EBB  0000              add [bx+si],al
00000EBD  0000              add [bx+si],al
00000EBF  0000              add [bx+si],al
00000EC1  0000              add [bx+si],al
00000EC3  0000              add [bx+si],al
00000EC5  0000              add [bx+si],al
00000EC7  0000              add [bx+si],al
00000EC9  0000              add [bx+si],al
00000ECB  0000              add [bx+si],al
00000ECD  0000              add [bx+si],al
00000ECF  0000              add [bx+si],al
00000ED1  0000              add [bx+si],al
00000ED3  0000              add [bx+si],al
00000ED5  0000              add [bx+si],al
00000ED7  0000              add [bx+si],al
00000ED9  0000              add [bx+si],al
00000EDB  0000              add [bx+si],al
00000EDD  0000              add [bx+si],al
00000EDF  0000              add [bx+si],al
00000EE1  0000              add [bx+si],al
00000EE3  0000              add [bx+si],al
00000EE5  0000              add [bx+si],al
00000EE7  0000              add [bx+si],al
00000EE9  0000              add [bx+si],al
00000EEB  0000              add [bx+si],al
00000EED  0000              add [bx+si],al
00000EEF  0000              add [bx+si],al
00000EF1  0000              add [bx+si],al
00000EF3  0000              add [bx+si],al
00000EF5  0000              add [bx+si],al
00000EF7  0000              add [bx+si],al
00000EF9  0000              add [bx+si],al
00000EFB  0000              add [bx+si],al
00000EFD  0000              add [bx+si],al
00000EFF  0000              add [bx+si],al
00000F01  0000              add [bx+si],al
00000F03  007084            add [bx+si-0x7c],dh
00000F06  0408              add al,0x8
00000F08  30840408          xor [si+0x804],al
00000F0C  0100              add [bx+si],ax
00000F0E  0000              add [bx+si],al
00000F10  0100              add [bx+si],ax
00000F12  0000              add [bx+si],al
00000F14  0C00              or al,0x0
00000F16  0000              add [bx+si],al
00000F18  F4                hlt
00000F19  82                db 0x82
00000F1A  0408              add al,0x8
00000F1C  0D0000            or ax,0x0
00000F1F  007885            add [bx+si-0x7b],bh
00000F22  0408              add al,0x8
00000F24  1900              sbb [bx+si],ax
00000F26  0000              add [bx+si],al
00000F28  049F              add al,0x9f
00000F2A  0408              add al,0x8
00000F2C  1B00              sbb ax,[bx+si]
00000F2E  0000              add [bx+si],al
00000F30  0400              add al,0x0
00000F32  0000              add [bx+si],al
00000F34  1A00              sbb al,[bx+si]
00000F36  0000              add [bx+si],al
00000F38  089F0408          or [bx+0x804],bl
00000F3C  1C00              sbb al,0x0
00000F3E  0000              add [bx+si],al
00000F40  0400              add al,0x0
00000F42  0000              add [bx+si],al
00000F44  F5                cmc
00000F45  FE                db 0xfe
00000F46  FF6FAC            jmp far [bx-0x54]
00000F49  81040805          add word [si],0x508
00000F4D  0000              add [bx+si],al
00000F4F  002C              add [si],ch
00000F51  82                db 0x82
00000F52  0408              add al,0x8
00000F54  06                push es
00000F55  0000              add [bx+si],al
00000F57  00CC              add ah,cl
00000F59  8104080A          add word [si],0xa08
00000F5D  0000              add [bx+si],al
00000F5F  007B00            add [bp+di+0x0],bh
00000F62  0000              add [bx+si],al
00000F64  0B00              or ax,[bx+si]
00000F66  0000              add [bx+si],al
00000F68  1000              adc [bx+si],al
00000F6A  0000              add [bx+si],al
00000F6C  150000            adc ax,0x0
00000F6F  0000              add [bx+si],al
00000F71  0000              add [bx+si],al
00000F73  0003              add [bp+di],al
00000F75  0000              add [bx+si],al
00000F77  0000              add [bx+si],al
00000F79  A00408            mov al,[0x804]
00000F7C  0200              add al,[bx+si]
00000F7E  0000              add [bx+si],al
00000F80  0800              or [bx+si],al
00000F82  0000              add [bx+si],al
00000F84  1400              adc al,0x0
00000F86  0000              add [bx+si],al
00000F88  1100              adc [bx+si],ax
00000F8A  0000              add [bx+si],al
00000F8C  17                pop ss
00000F8D  0000              add [bx+si],al
00000F8F  00EC              add ah,ch
00000F91  82                db 0x82
00000F92  0408              add al,0x8
00000F94  1100              adc [bx+si],ax
00000F96  0000              add [bx+si],al
00000F98  D482              aam 0x82
00000F9A  0408              add al,0x8
00000F9C  1200              adc al,[bx+si]
00000F9E  0000              add [bx+si],al
00000FA0  1800              sbb [bx+si],al
00000FA2  0000              add [bx+si],al
00000FA4  1300              adc ax,[bx+si]
00000FA6  0000              add [bx+si],al
00000FA8  0800              or [bx+si],al
00000FAA  0000              add [bx+si],al
00000FAC  FE                db 0xfe
00000FAD  FF                db 0xff
00000FAE  FF6FB4            jmp far [bx-0x4c]
00000FB1  82                db 0x82
00000FB2  0408              add al,0x8
00000FB4  FF                db 0xff
00000FB5  FF                db 0xff
00000FB6  FF6F01            jmp far [bx+0x1]
00000FB9  0000              add [bx+si],al
00000FBB  00F0              add al,dh
00000FBD  FF                db 0xff
00000FBE  FF6FA8            jmp far [bx-0x58]
00000FC1  82                db 0x82
00000FC2  0408              add al,0x8
00000FC4  0000              add [bx+si],al
00000FC6  0000              add [bx+si],al
00000FC8  0000              add [bx+si],al
00000FCA  0000              add [bx+si],al
00000FCC  0000              add [bx+si],al
00000FCE  0000              add [bx+si],al
00000FD0  0000              add [bx+si],al
00000FD2  0000              add [bx+si],al
00000FD4  0000              add [bx+si],al
00000FD6  0000              add [bx+si],al
00000FD8  0000              add [bx+si],al
00000FDA  0000              add [bx+si],al
00000FDC  0000              add [bx+si],al
00000FDE  0000              add [bx+si],al
00000FE0  0000              add [bx+si],al
00000FE2  0000              add [bx+si],al
00000FE4  0000              add [bx+si],al
00000FE6  0000              add [bx+si],al
00000FE8  0000              add [bx+si],al
00000FEA  0000              add [bx+si],al
00000FEC  0000              add [bx+si],al
00000FEE  0000              add [bx+si],al
00000FF0  0000              add [bx+si],al
00000FF2  0000              add [bx+si],al
00000FF4  0000              add [bx+si],al
00000FF6  0000              add [bx+si],al
00000FF8  0000              add [bx+si],al
00000FFA  0000              add [bx+si],al
00000FFC  0000              add [bx+si],al
00000FFE  0000              add [bx+si],al
00001000  0C9F              or al,0x9f
00001002  0408              add al,0x8
00001004  0000              add [bx+si],al
00001006  0000              add [bx+si],al
00001008  0000              add [bx+si],al
0000100A  0000              add [bx+si],al
0000100C  36830408          add word [ss:si],byte +0x8
00001010  0000              add [bx+si],al
00001012  0000              add [bx+si],al
00001014  47                inc di
00001015  43                inc bx
00001016  43                inc bx
00001017  3A20              cmp ah,[bx+si]
00001019  28474E            sub [bx+0x4e],al
0000101C  55                push bp
0000101D  2920              sub [bx+si],sp
0000101F  382E332E          cmp [0x2e33],ch
00001023  3120              xor [bx+si],sp
00001025  3230              xor dh,[bx+si]
00001027  3139              xor [bx+di],di
00001029  3131              xor [bx+di],si
0000102B  3231              xor dh,[bx+di]
0000102D  2028              and [bx+si],ch
0000102F  52                push dx
00001030  6564204861        and [fs:bx+si+0x61],cl
00001035  7420              jz 0x1057
00001037  382E332E          cmp [0x2e33],ch
0000103B  312D              xor [di],bp
0000103D  352900            xor ax,0x29
00001040  0A00              or al,[bx+si]
00001042  0000              add [bx+si],al
00001044  0800              or [bx+si],al
00001046  0000              add [bx+si],al
00001048  0001              add [bx+di],al
0000104A  0000              add [bx+si],al
0000104C  47                inc di
0000104D  41                inc cx
0000104E  2401              and al,0x1
00001050  336839            xor bp,[bx+si+0x39]
00001053  3231              xor dh,[bx+di]
00001055  0000              add [bx+si],al
00001057  004083            add [bx+si-0x7d],al
0000105A  0408              add al,0x8
0000105C  40                inc ax
0000105D  830408            add word [si],byte +0x8
00001060  0A00              or al,[bx+si]
00001062  0000              add [bx+si],al
00001064  0800              or [bx+si],al
00001066  0000              add [bx+si],al
00001068  0001              add [bx+di],al
0000106A  0000              add [bx+si],al
0000106C  47                inc di
0000106D  41                inc cx
0000106E  2401              and al,0x1
00001070  336339            xor sp,[bp+di+0x39]
00001073  3231              xor dh,[bx+di]
00001075  0000              add [bx+si],al
00001077  004083            add [bx+si-0x7d],al
0000107A  0408              add al,0x8
0000107C  40                inc ax
0000107D  830408            add word [si],byte +0x8
00001080  0A00              or al,[bx+si]
00001082  0000              add [bx+si],al
00001084  0800              or [bx+si],al
00001086  0000              add [bx+si],al
00001088  0001              add [bx+di],al
0000108A  0000              add [bx+si],al
0000108C  47                inc di
0000108D  41                inc cx
0000108E  2401              and al,0x1
00001090  337339            xor si,[bp+di+0x39]
00001093  3231              xor dh,[bx+di]
00001095  0000              add [bx+si],al
00001097  004083            add [bx+si-0x7d],al
0000109A  0408              add al,0x8
0000109C  40                inc ax
0000109D  830408            add word [si],byte +0x8
000010A0  0A00              or al,[bx+si]
000010A2  0000              add [bx+si],al
000010A4  0800              or [bx+si],al
000010A6  0000              add [bx+si],al
000010A8  0001              add [bx+di],al
000010AA  0000              add [bx+si],al
000010AC  47                inc di
000010AD  41                inc cx
000010AE  2401              and al,0x1
000010B0  336539            xor sp,[di+0x39]
000010B3  3231              xor dh,[bx+di]
000010B5  0000              add [bx+si],al
000010B7  004083            add [bx+si-0x7d],al
000010BA  0408              add al,0x8
000010BC  40                inc ax
000010BD  830408            add word [si],byte +0x8
000010C0  0A00              or al,[bx+si]
000010C2  0000              add [bx+si],al
000010C4  0800              or [bx+si],al
000010C6  0000              add [bx+si],al
000010C8  0001              add [bx+di],al
000010CA  0000              add [bx+si],al
000010CC  47                inc di
000010CD  41                inc cx
000010CE  2401              and al,0x1
000010D0  336839            xor bp,[bx+si+0x39]
000010D3  3231              xor dh,[bx+di]
000010D5  0000              add [bx+si],al
000010D7  004083            add [bx+si-0x7d],al
000010DA  0408              add al,0x8
000010DC  40                inc ax
000010DD  830408            add word [si],byte +0x8
000010E0  0A00              or al,[bx+si]
000010E2  0000              add [bx+si],al
000010E4  0800              or [bx+si],al
000010E6  0000              add [bx+si],al
000010E8  0001              add [bx+di],al
000010EA  0000              add [bx+si],al
000010EC  47                inc di
000010ED  41                inc cx
000010EE  2401              and al,0x1
000010F0  336339            xor sp,[bp+di+0x39]
000010F3  3231              xor dh,[bx+di]
000010F5  0000              add [bx+si],al
000010F7  004083            add [bx+si-0x7d],al
000010FA  0408              add al,0x8
000010FC  40                inc ax
000010FD  830408            add word [si],byte +0x8
00001100  0A00              or al,[bx+si]
00001102  0000              add [bx+si],al
00001104  0800              or [bx+si],al
00001106  0000              add [bx+si],al
00001108  0001              add [bx+di],al
0000110A  0000              add [bx+si],al
0000110C  47                inc di
0000110D  41                inc cx
0000110E  2401              and al,0x1
00001110  337339            xor si,[bp+di+0x39]
00001113  3231              xor dh,[bx+di]
00001115  0000              add [bx+si],al
00001117  004083            add [bx+si-0x7d],al
0000111A  0408              add al,0x8
0000111C  40                inc ax
0000111D  830408            add word [si],byte +0x8
00001120  0A00              or al,[bx+si]
00001122  0000              add [bx+si],al
00001124  0800              or [bx+si],al
00001126  0000              add [bx+si],al
00001128  0001              add [bx+di],al
0000112A  0000              add [bx+si],al
0000112C  47                inc di
0000112D  41                inc cx
0000112E  2401              and al,0x1
00001130  336539            xor sp,[di+0x39]
00001133  3231              xor dh,[bx+di]
00001135  0000              add [bx+si],al
00001137  004083            add [bx+si-0x7d],al
0000113A  0408              add al,0x8
0000113C  40                inc ax
0000113D  830408            add word [si],byte +0x8
00001140  0800              or [bx+si],al
00001142  0000              add [bx+si],al
00001144  0800              or [bx+si],al
00001146  0000              add [bx+si],al
00001148  0001              add [bx+di],al
0000114A  0000              add [bx+si],al
0000114C  47                inc di
0000114D  41                inc cx
0000114E  2401              and al,0x1
00001150  336131            xor sp,[bx+di+0x31]
00001153  004083            add [bx+si-0x7d],al
00001156  0408              add al,0x8
00001158  B683              mov dh,0x83
0000115A  0408              add al,0x8
0000115C  0800              or [bx+si],al
0000115E  0000              add [bx+si],al
00001160  0800              or [bx+si],al
00001162  0000              add [bx+si],al
00001164  0001              add [bx+di],al
00001166  0000              add [bx+si],al
00001168  47                inc di
00001169  41                inc cx
0000116A  2401              and al,0x1
0000116C  336131            xor sp,[bx+di+0x31]
0000116F  007B83            add [bp+di-0x7d],bh
00001172  0408              add al,0x8
00001174  7B83              jpo 0x10f9
00001176  0408              add al,0x8
00001178  0A00              or al,[bx+si]
0000117A  0000              add [bx+si],al
0000117C  0800              or [bx+si],al
0000117E  0000              add [bx+si],al
00001180  0001              add [bx+di],al
00001182  0000              add [bx+si],al
00001184  47                inc di
00001185  41                inc cx
00001186  2401              and al,0x1
00001188  337039            xor si,[bx+si+0x39]
0000118B  3231              xor dh,[bx+di]
0000118D  0000              add [bx+si],al
0000118F  007B83            add [bp+di-0x7d],bh
00001192  0408              add al,0x8
00001194  7B83              jpo 0x1119
00001196  0408              add al,0x8
00001198  1F                pop ds
00001199  0000              add [bx+si],al
0000119B  0000              add [bx+si],al
0000119D  0000              add [bx+si],al
0000119F  0000              add [bx+si],al
000011A1  0100              add [bx+si],ax
000011A3  004741            add [bx+0x41],al
000011A6  2405              and al,0x5
000011A8  7275              jc 0x121f
000011AA  6E                outsb
000011AB  6E                outsb
000011AC  696E672067        imul bp,[bp+0x67],word 0x6720
000011B1  636320            arpl [bp+di+0x20],sp
000011B4  382E332E          cmp [0x2e33],ch
000011B8  3120              xor [bx+si],sp
000011BA  3230              xor dh,[bx+si]
000011BC  3139              xor [bx+di],di
000011BE  3131              xor [bx+di],si
000011C0  3231              xor dh,[bx+di]
000011C2  0000              add [bx+si],al
000011C4  1F                pop ds
000011C5  0000              add [bx+si],al
000011C7  0000              add [bx+si],al
000011C9  0000              add [bx+si],al
000011CB  0000              add [bx+si],al
000011CD  0100              add [bx+si],ax
000011CF  004741            add [bx+0x41],al
000011D2  2405              and al,0x5
000011D4  61                popa
000011D5  6E                outsb
000011D6  6E                outsb
000011D7  6F                outsw
000011D8  62696E            bound bp,[bx+di+0x6e]
000011DB  206763            and [bx+0x63],ah
000011DE  6320              arpl [bx+si],sp
000011E0  382E332E          cmp [0x2e33],ch
000011E4  3120              xor [bx+si],sp
000011E6  3230              xor dh,[bx+si]
000011E8  3139              xor [bx+di],di
000011EA  3131              xor [bx+di],si
000011EC  3231              xor dh,[bx+di]
000011EE  0000              add [bx+si],al
000011F0  0A00              or al,[bx+si]
000011F2  0000              add [bx+si],al
000011F4  0000              add [bx+si],al
000011F6  0000              add [bx+si],al
000011F8  0001              add [bx+di],al
000011FA  0000              add [bx+si],al
000011FC  47                inc di
000011FD  41                inc cx
000011FE  2A474F            sub al,[bx+0x4f]
00001201  57                push di
00001202  002A              add [bp+si],ch
00001204  45                inc bp
00001205  0000              add [bx+si],al
00001207  00060000          add [0x0],al
0000120B  0000              add [bx+si],al
0000120D  0000              add [bx+si],al
0000120F  0000              add [bx+si],al
00001211  0100              add [bx+si],ax
00001213  004741            add [bx+0x41],al
00001216  2A02              sub al,[bp+si]
00001218  0000              add [bx+si],al
0000121A  0000              add [bx+si],al
0000121C  0F0000            sldt [bx+si]
0000121F  0000              add [bx+si],al
00001221  0000              add [bx+si],al
00001223  0000              add [bx+si],al
00001225  0100              add [bx+si],ax
00001227  004741            add [bx+0x41],al
0000122A  2B7374            sub si,[bp+di+0x74]
0000122D  61                popa
0000122E  636B5F            arpl [bp+di+0x5f],bp
00001231  636C61            arpl [si+0x61],bp
00001234  7368              jnc 0x129e
00001236  0000              add [bx+si],al
00001238  1300              adc ax,[bx+si]
0000123A  0000              add [bx+si],al
0000123C  0000              add [bx+si],al
0000123E  0000              add [bx+si],al
00001240  0001              add [bx+di],al
00001242  0000              add [bx+si],al
00001244  47                inc di
00001245  41                inc cx
00001246  2A6366            sub ah,[bp+di+0x66]
00001249  5F                pop di
0000124A  7072              jo 0x12be
0000124C  6F                outsw
0000124D  7465              jz 0x12b4
0000124F  637469            arpl [si+0x69],si
00001252  6F                outsw
00001253  6E                outsb
00001254  0008              add [bx+si],cl
00001256  0000              add [bx+si],al
00001258  0D0000            or ax,0x0
0000125B  0000              add [bx+si],al
0000125D  0000              add [bx+si],al
0000125F  0000              add [bx+si],al
00001261  0100              add [bx+si],ax
00001263  004741            add [bx+0x41],al
00001266  2A464F            sub al,[bp+0x4f]
00001269  52                push dx
0000126A  54                push sp
0000126B  49                dec cx
0000126C  46                inc si
0000126D  59                pop cx
0000126E  00FF              add bh,bh
00001270  0000              add [bx+si],al
00001272  0000              add [bx+si],al
00001274  16                push ss
00001275  0000              add [bx+si],al
00001277  0000              add [bx+si],al
00001279  0000              add [bx+si],al
0000127B  0000              add [bx+si],al
0000127D  0100              add [bx+si],ax
0000127F  004741            add [bx+0x41],al
00001282  2B474C            sub ax,[bx+0x4c]
00001285  49                dec cx
00001286  42                inc dx
00001287  43                inc bx
00001288  58                pop ax
00001289  58                pop ax
0000128A  5F                pop di
0000128B  41                inc cx
0000128C  53                push bx
0000128D  53                push bx
0000128E  45                inc bp
0000128F  52                push dx
00001290  54                push sp
00001291  49                dec cx
00001292  4F                dec di
00001293  4E                dec si
00001294  53                push bx
00001295  0000              add [bx+si],al
00001297  00060000          add [0x0],al
0000129B  0000              add [bx+si],al
0000129D  0000              add [bx+si],al
0000129F  0000              add [bx+si],al
000012A1  0100              add [bx+si],ax
000012A3  004741            add [bx+0x41],al
000012A6  2A07              sub al,[bx]
000012A8  0300              add ax,[bx+si]
000012AA  0000              add [bx+si],al
000012AC  050000            add ax,0x0
000012AF  0000              add [bx+si],al
000012B1  0000              add [bx+si],al
000012B3  0000              add [bx+si],al
000012B5  0100              add [bx+si],ax
000012B7  004741            add [bx+0x41],al
000012BA  2108              and [bx+si],cx
000012BC  0000              add [bx+si],al
000012BE  0000              add [bx+si],al
000012C0  16                push ss
000012C1  0000              add [bx+si],al
000012C3  0000              add [bx+si],al
000012C5  0000              add [bx+si],al
000012C7  0000              add [bx+si],al
000012C9  0100              add [bx+si],ax
000012CB  004741            add [bx+0x41],al
000012CE  2B6F6D            sub bp,[bx+0x6d]
000012D1  69745F6672        imul si,[si+0x5f],word 0x7266
000012D6  61                popa
000012D7  6D                insw
000012D8  655F              gs pop di
000012DA  706F              jo 0x134b
000012DC  696E746572        imul bp,[bp+0x74],word 0x7265
000012E1  0000              add [bx+si],al
000012E3  00060000          add [0x0],al
000012E7  0000              add [bx+si],al
000012E9  0000              add [bx+si],al
000012EB  0000              add [bx+si],al
000012ED  0100              add [bx+si],ax
000012EF  004741            add [bx+0x41],al
000012F2  2A060000          sub al,[0x0]
000012F6  0000              add [bx+si],al
000012F8  1100              adc [bx+si],ax
000012FA  0000              add [bx+si],al
000012FC  0000              add [bx+si],al
000012FE  0000              add [bx+si],al
00001300  0001              add [bx+di],al
00001302  0000              add [bx+si],al
00001304  47                inc di
00001305  41                inc cx
00001306  2B7374            sub si,[bp+di+0x74]
00001309  61                popa
0000130A  636B5F            arpl [bp+di+0x5f],bp
0000130D  7265              jc 0x1374
0000130F  61                popa
00001310  6C                insb
00001311  69676E0000        imul sp,[bx+0x6e],word 0x0
00001316  0000              add [bx+si],al
00001318  0A00              or al,[bx+si]
0000131A  0000              add [bx+si],al
0000131C  0800              or [bx+si],al
0000131E  0000              add [bx+si],al
00001320  0001              add [bx+di],al
00001322  0000              add [bx+si],al
00001324  47                inc di
00001325  41                inc cx
00001326  2401              and al,0x1
00001328  337039            xor si,[bx+si+0x39]
0000132B  3231              xor dh,[bx+di]
0000132D  0000              add [bx+si],al
0000132F  00808304          add [bx+si+0x483],al
00001333  08858304          or [di+0x483],al
00001337  081F              or [bx],bl
00001339  0000              add [bx+si],al
0000133B  0000              add [bx+si],al
0000133D  0000              add [bx+si],al
0000133F  0000              add [bx+si],al
00001341  0100              add [bx+si],ax
00001343  004741            add [bx+0x41],al
00001346  2405              and al,0x5
00001348  7275              jc 0x13bf
0000134A  6E                outsb
0000134B  6E                outsb
0000134C  696E672067        imul bp,[bp+0x67],word 0x6720
00001351  636320            arpl [bp+di+0x20],sp
00001354  382E332E          cmp [0x2e33],ch
00001358  3120              xor [bx+si],sp
0000135A  3230              xor dh,[bx+si]
0000135C  3139              xor [bx+di],di
0000135E  3131              xor [bx+di],si
00001360  3231              xor dh,[bx+di]
00001362  0000              add [bx+si],al
00001364  1F                pop ds
00001365  0000              add [bx+si],al
00001367  0000              add [bx+si],al
00001369  0000              add [bx+si],al
0000136B  0000              add [bx+si],al
0000136D  0100              add [bx+si],ax
0000136F  004741            add [bx+0x41],al
00001372  2405              and al,0x5
00001374  61                popa
00001375  6E                outsb
00001376  6E                outsb
00001377  6F                outsw
00001378  62696E            bound bp,[bx+di+0x6e]
0000137B  206763            and [bx+0x63],ah
0000137E  6320              arpl [bx+si],sp
00001380  382E332E          cmp [0x2e33],ch
00001384  3120              xor [bx+si],sp
00001386  3230              xor dh,[bx+si]
00001388  3139              xor [bx+di],di
0000138A  3131              xor [bx+di],si
0000138C  3231              xor dh,[bx+di]
0000138E  0000              add [bx+si],al
00001390  0A00              or al,[bx+si]
00001392  0000              add [bx+si],al
00001394  0000              add [bx+si],al
00001396  0000              add [bx+si],al
00001398  0001              add [bx+di],al
0000139A  0000              add [bx+si],al
0000139C  47                inc di
0000139D  41                inc cx
0000139E  2A474F            sub al,[bx+0x4f]
000013A1  57                push di
000013A2  002A              add [bp+si],ch
000013A4  45                inc bp
000013A5  0000              add [bx+si],al
000013A7  00060000          add [0x0],al
000013AB  0000              add [bx+si],al
000013AD  0000              add [bx+si],al
000013AF  0000              add [bx+si],al
000013B1  0100              add [bx+si],ax
000013B3  004741            add [bx+0x41],al
000013B6  2A02              sub al,[bp+si]
000013B8  0000              add [bx+si],al
000013BA  0000              add [bx+si],al
000013BC  0F0000            sldt [bx+si]
000013BF  0000              add [bx+si],al
000013C1  0000              add [bx+si],al
000013C3  0000              add [bx+si],al
000013C5  0100              add [bx+si],ax
000013C7  004741            add [bx+0x41],al
000013CA  2B7374            sub si,[bp+di+0x74]
000013CD  61                popa
000013CE  636B5F            arpl [bp+di+0x5f],bp
000013D1  636C61            arpl [si+0x61],bp
000013D4  7368              jnc 0x143e
000013D6  0000              add [bx+si],al
000013D8  1300              adc ax,[bx+si]
000013DA  0000              add [bx+si],al
000013DC  0000              add [bx+si],al
000013DE  0000              add [bx+si],al
000013E0  0001              add [bx+di],al
000013E2  0000              add [bx+si],al
000013E4  47                inc di
000013E5  41                inc cx
000013E6  2A6366            sub ah,[bp+di+0x66]
000013E9  5F                pop di
000013EA  7072              jo 0x145e
000013EC  6F                outsw
000013ED  7465              jz 0x1454
000013EF  637469            arpl [si+0x69],si
000013F2  6F                outsw
000013F3  6E                outsb
000013F4  0008              add [bx+si],cl
000013F6  0000              add [bx+si],al
000013F8  0D0000            or ax,0x0
000013FB  0000              add [bx+si],al
000013FD  0000              add [bx+si],al
000013FF  0000              add [bx+si],al
00001401  0100              add [bx+si],ax
00001403  004741            add [bx+0x41],al
00001406  2A464F            sub al,[bp+0x4f]
00001409  52                push dx
0000140A  54                push sp
0000140B  49                dec cx
0000140C  46                inc si
0000140D  59                pop cx
0000140E  00FF              add bh,bh
00001410  0000              add [bx+si],al
00001412  0000              add [bx+si],al
00001414  16                push ss
00001415  0000              add [bx+si],al
00001417  0000              add [bx+si],al
00001419  0000              add [bx+si],al
0000141B  0000              add [bx+si],al
0000141D  0100              add [bx+si],ax
0000141F  004741            add [bx+0x41],al
00001422  2B474C            sub ax,[bx+0x4c]
00001425  49                dec cx
00001426  42                inc dx
00001427  43                inc bx
00001428  58                pop ax
00001429  58                pop ax
0000142A  5F                pop di
0000142B  41                inc cx
0000142C  53                push bx
0000142D  53                push bx
0000142E  45                inc bp
0000142F  52                push dx
00001430  54                push sp
00001431  49                dec cx
00001432  4F                dec di
00001433  4E                dec si
00001434  53                push bx
00001435  0000              add [bx+si],al
00001437  00060000          add [0x0],al
0000143B  0000              add [bx+si],al
0000143D  0000              add [bx+si],al
0000143F  0000              add [bx+si],al
00001441  0100              add [bx+si],ax
00001443  004741            add [bx+0x41],al
00001446  2A07              sub al,[bx]
00001448  0300              add ax,[bx+si]
0000144A  0000              add [bx+si],al
0000144C  050000            add ax,0x0
0000144F  0000              add [bx+si],al
00001451  0000              add [bx+si],al
00001453  0000              add [bx+si],al
00001455  0100              add [bx+si],ax
00001457  004741            add [bx+0x41],al
0000145A  2108              and [bx+si],cx
0000145C  0000              add [bx+si],al
0000145E  0000              add [bx+si],al
00001460  16                push ss
00001461  0000              add [bx+si],al
00001463  0000              add [bx+si],al
00001465  0000              add [bx+si],al
00001467  0000              add [bx+si],al
00001469  0100              add [bx+si],ax
0000146B  004741            add [bx+0x41],al
0000146E  2B6F6D            sub bp,[bx+0x6d]
00001471  69745F6672        imul si,[si+0x5f],word 0x7266
00001476  61                popa
00001477  6D                insw
00001478  655F              gs pop di
0000147A  706F              jo 0x14eb
0000147C  696E746572        imul bp,[bp+0x74],word 0x7265
00001481  0000              add [bx+si],al
00001483  00060000          add [0x0],al
00001487  0000              add [bx+si],al
00001489  0000              add [bx+si],al
0000148B  0000              add [bx+si],al
0000148D  0100              add [bx+si],ax
0000148F  004741            add [bx+0x41],al
00001492  2A060000          sub al,[0x0]
00001496  0000              add [bx+si],al
00001498  1100              adc [bx+si],ax
0000149A  0000              add [bx+si],al
0000149C  0000              add [bx+si],al
0000149E  0000              add [bx+si],al
000014A0  0001              add [bx+di],al
000014A2  0000              add [bx+si],al
000014A4  47                inc di
000014A5  41                inc cx
000014A6  2B7374            sub si,[bp+di+0x74]
000014A9  61                popa
000014AA  636B5F            arpl [bp+di+0x5f],bp
000014AD  7265              jc 0x1514
000014AF  61                popa
000014B0  6C                insb
000014B1  69676E0000        imul sp,[bx+0x6e],word 0x0
000014B6  0000              add [bx+si],al
000014B8  0D0000            or ax,0x0
000014BB  0000              add [bx+si],al
000014BD  0000              add [bx+si],al
000014BF  0001              add [bx+di],al
000014C1  0100              add [bx+si],ax
000014C3  004741            add [bx+0x41],al
000014C6  2A464F            sub al,[bp+0x4f]
000014C9  52                push dx
000014CA  54                push sp
000014CB  49                dec cx
000014CC  46                inc si
000014CD  59                pop cx
000014CE  00FF              add bh,bh
000014D0  0000              add [bx+si],al
000014D2  0000              add [bx+si],al
000014D4  16                push ss
000014D5  0000              add [bx+si],al
000014D7  0000              add [bx+si],al
000014D9  0000              add [bx+si],al
000014DB  0001              add [bx+di],al
000014DD  0100              add [bx+si],ax
000014DF  004741            add [bx+0x41],al
000014E2  2B474C            sub ax,[bx+0x4c]
000014E5  49                dec cx
000014E6  42                inc dx
000014E7  43                inc bx
000014E8  58                pop ax
000014E9  58                pop ax
000014EA  5F                pop di
000014EB  41                inc cx
000014EC  53                push bx
000014ED  53                push bx
000014EE  45                inc bp
000014EF  52                push dx
000014F0  54                push sp
000014F1  49                dec cx
000014F2  4F                dec di
000014F3  4E                dec si
000014F4  53                push bx
000014F5  0000              add [bx+si],al
000014F7  0008              add [bx+si],cl
000014F9  0000              add [bx+si],al
000014FB  0008              add [bx+si],cl
000014FD  0000              add [bx+si],al
000014FF  0000              add [bx+si],al
00001501  0100              add [bx+si],ax
00001503  004741            add [bx+0x41],al
00001506  2401              and al,0x1
00001508  336131            xor sp,[bx+di+0x31]
0000150B  00858304          add [di+0x483],al
0000150F  08858304          or [di+0x483],al
00001513  0808              or [bx+si],cl
00001515  0000              add [bx+si],al
00001517  0008              add [bx+si],cl
00001519  0000              add [bx+si],al
0000151B  0000              add [bx+si],al
0000151D  0100              add [bx+si],ax
0000151F  004741            add [bx+0x41],al
00001522  2401              and al,0x1
00001524  336131            xor sp,[bx+di+0x31]
00001527  00F4              add ah,dh
00001529  82                db 0x82
0000152A  0408              add al,0x8
0000152C  13830408          adc ax,[bp+di+0x804]
00001530  0800              or [bx+si],al
00001532  0000              add [bx+si],al
00001534  0800              or [bx+si],al
00001536  0000              add [bx+si],al
00001538  0001              add [bx+di],al
0000153A  0000              add [bx+si],al
0000153C  47                inc di
0000153D  41                inc cx
0000153E  2401              and al,0x1
00001540  336131            xor sp,[bx+di+0x31]
00001543  007885            add [bx+si-0x7b],bh
00001546  0408              add al,0x8
00001548  8B850408          mov ax,[di+0x804]
0000154C  0800              or [bx+si],al
0000154E  0000              add [bx+si],al
00001550  0800              or [bx+si],al
00001552  0000              add [bx+si],al
00001554  0001              add [bx+di],al
00001556  0000              add [bx+si],al
00001558  47                inc di
00001559  41                inc cx
0000155A  2401              and al,0x1
0000155C  336131            xor sp,[bx+di+0x31]
0000155F  00A08304          add [bx+si+0x483],ah
00001563  085285            or [bp+si-0x7b],dl
00001566  0408              add al,0x8
00001568  0A00              or al,[bx+si]
0000156A  0000              add [bx+si],al
0000156C  0800              or [bx+si],al
0000156E  0000              add [bx+si],al
00001570  0001              add [bx+di],al
00001572  0000              add [bx+si],al
00001574  47                inc di
00001575  41                inc cx
00001576  2401              and al,0x1
00001578  337039            xor si,[bx+si+0x39]
0000157B  3231              xor dh,[bx+di]
0000157D  0000              add [bx+si],al
0000157F  0010              add [bx+si],dl
00001581  8504              test [si],ax
00001583  087585            or [di-0x7b],dh
00001586  0408              add al,0x8
00001588  1F                pop ds
00001589  0000              add [bx+si],al
0000158B  0000              add [bx+si],al
0000158D  0000              add [bx+si],al
0000158F  0000              add [bx+si],al
00001591  0100              add [bx+si],ax
00001593  004741            add [bx+0x41],al
00001596  2405              and al,0x5
00001598  7275              jc 0x160f
0000159A  6E                outsb
0000159B  6E                outsb
0000159C  696E672067        imul bp,[bp+0x67],word 0x6720
000015A1  636320            arpl [bp+di+0x20],sp
000015A4  382E332E          cmp [0x2e33],ch
000015A8  3120              xor [bx+si],sp
000015AA  3230              xor dh,[bx+si]
000015AC  3139              xor [bx+di],di
000015AE  3131              xor [bx+di],si
000015B0  3231              xor dh,[bx+di]
000015B2  0000              add [bx+si],al
000015B4  1F                pop ds
000015B5  0000              add [bx+si],al
000015B7  0000              add [bx+si],al
000015B9  0000              add [bx+si],al
000015BB  0000              add [bx+si],al
000015BD  0100              add [bx+si],ax
000015BF  004741            add [bx+0x41],al
000015C2  2405              and al,0x5
000015C4  61                popa
000015C5  6E                outsb
000015C6  6E                outsb
000015C7  6F                outsw
000015C8  62696E            bound bp,[bx+di+0x6e]
000015CB  206763            and [bx+0x63],ah
000015CE  6320              arpl [bx+si],sp
000015D0  382E332E          cmp [0x2e33],ch
000015D4  3120              xor [bx+si],sp
000015D6  3230              xor dh,[bx+si]
000015D8  3139              xor [bx+di],di
000015DA  3131              xor [bx+di],si
000015DC  3231              xor dh,[bx+di]
000015DE  0000              add [bx+si],al
000015E0  0A00              or al,[bx+si]
000015E2  0000              add [bx+si],al
000015E4  0000              add [bx+si],al
000015E6  0000              add [bx+si],al
000015E8  0001              add [bx+di],al
000015EA  0000              add [bx+si],al
000015EC  47                inc di
000015ED  41                inc cx
000015EE  2A474F            sub al,[bx+0x4f]
000015F1  57                push di
000015F2  002A              add [bp+si],ch
000015F4  45                inc bp
000015F5  0000              add [bx+si],al
000015F7  00060000          add [0x0],al
000015FB  0000              add [bx+si],al
000015FD  0000              add [bx+si],al
000015FF  0000              add [bx+si],al
00001601  0100              add [bx+si],ax
00001603  004741            add [bx+0x41],al
00001606  2A02              sub al,[bp+si]
00001608  0300              add ax,[bx+si]
0000160A  0000              add [bx+si],al
0000160C  0F0000            sldt [bx+si]
0000160F  0000              add [bx+si],al
00001611  0000              add [bx+si],al
00001613  0000              add [bx+si],al
00001615  0100              add [bx+si],ax
00001617  004741            add [bx+0x41],al
0000161A  2B7374            sub si,[bp+di+0x74]
0000161D  61                popa
0000161E  636B5F            arpl [bp+di+0x5f],bp
00001621  636C61            arpl [si+0x61],bp
00001624  7368              jnc 0x168e
00001626  0000              add [bx+si],al
00001628  1300              adc ax,[bx+si]
0000162A  0000              add [bx+si],al
0000162C  0000              add [bx+si],al
0000162E  0000              add [bx+si],al
00001630  0001              add [bx+di],al
00001632  0000              add [bx+si],al
00001634  47                inc di
00001635  41                inc cx
00001636  2A6366            sub ah,[bp+di+0x66]
00001639  5F                pop di
0000163A  7072              jo 0x16ae
0000163C  6F                outsw
0000163D  7465              jz 0x16a4
0000163F  637469            arpl [si+0x69],si
00001642  6F                outsw
00001643  6E                outsb
00001644  0008              add [bx+si],cl
00001646  0000              add [bx+si],al
00001648  0D0000            or ax,0x0
0000164B  0000              add [bx+si],al
0000164D  0000              add [bx+si],al
0000164F  0000              add [bx+si],al
00001651  0100              add [bx+si],ax
00001653  004741            add [bx+0x41],al
00001656  2A464F            sub al,[bp+0x4f]
00001659  52                push dx
0000165A  54                push sp
0000165B  49                dec cx
0000165C  46                inc si
0000165D  59                pop cx
0000165E  0002              add [bp+si],al
00001660  0000              add [bx+si],al
00001662  0000              add [bx+si],al
00001664  16                push ss
00001665  0000              add [bx+si],al
00001667  0000              add [bx+si],al
00001669  0000              add [bx+si],al
0000166B  0000              add [bx+si],al
0000166D  0100              add [bx+si],ax
0000166F  004741            add [bx+0x41],al
00001672  2B474C            sub ax,[bx+0x4c]
00001675  49                dec cx
00001676  42                inc dx
00001677  43                inc bx
00001678  58                pop ax
00001679  58                pop ax
0000167A  5F                pop di
0000167B  41                inc cx
0000167C  53                push bx
0000167D  53                push bx
0000167E  45                inc bp
0000167F  52                push dx
00001680  54                push sp
00001681  49                dec cx
00001682  4F                dec di
00001683  4E                dec si
00001684  53                push bx
00001685  0000              add [bx+si],al
00001687  00060000          add [0x0],al
0000168B  0000              add [bx+si],al
0000168D  0000              add [bx+si],al
0000168F  0000              add [bx+si],al
00001691  0100              add [bx+si],ax
00001693  004741            add [bx+0x41],al
00001696  2A07              sub al,[bx]
00001698  0200              add al,[bx+si]
0000169A  0000              add [bx+si],al
0000169C  050000            add ax,0x0
0000169F  0000              add [bx+si],al
000016A1  0000              add [bx+si],al
000016A3  0000              add [bx+si],al
000016A5  0100              add [bx+si],ax
000016A7  004741            add [bx+0x41],al
000016AA  2108              and [bx+si],cx
000016AC  0000              add [bx+si],al
000016AE  0000              add [bx+si],al
000016B0  16                push ss
000016B1  0000              add [bx+si],al
000016B3  0000              add [bx+si],al
000016B5  0000              add [bx+si],al
000016B7  0000              add [bx+si],al
000016B9  0100              add [bx+si],ax
000016BB  004741            add [bx+0x41],al
000016BE  2B6F6D            sub bp,[bx+0x6d]
000016C1  69745F6672        imul si,[si+0x5f],word 0x7266
000016C6  61                popa
000016C7  6D                insw
000016C8  655F              gs pop di
000016CA  706F              jo 0x173b
000016CC  696E746572        imul bp,[bp+0x74],word 0x7265
000016D1  0000              add [bx+si],al
000016D3  00060000          add [0x0],al
000016D7  0000              add [bx+si],al
000016D9  0000              add [bx+si],al
000016DB  0000              add [bx+si],al
000016DD  0100              add [bx+si],ax
000016DF  004741            add [bx+0x41],al
000016E2  2A060000          sub al,[0x0]
000016E6  0000              add [bx+si],al
000016E8  1100              adc [bx+si],ax
000016EA  0000              add [bx+si],al
000016EC  0000              add [bx+si],al
000016EE  0000              add [bx+si],al
000016F0  0001              add [bx+di],al
000016F2  0000              add [bx+si],al
000016F4  47                inc di
000016F5  41                inc cx
000016F6  2B7374            sub si,[bp+di+0x74]
000016F9  61                popa
000016FA  636B5F            arpl [bp+di+0x5f],bp
000016FD  7265              jc 0x1764
000016FF  61                popa
00001700  6C                insb
00001701  69676E0000        imul sp,[bx+0x6e],word 0x0
00001706  0000              add [bx+si],al
00001708  0D0000            or ax,0x0
0000170B  0000              add [bx+si],al
0000170D  0000              add [bx+si],al
0000170F  0001              add [bx+di],al
00001711  0100              add [bx+si],ax
00001713  004741            add [bx+0x41],al
00001716  2A464F            sub al,[bp+0x4f]
00001719  52                push dx
0000171A  54                push sp
0000171B  49                dec cx
0000171C  46                inc si
0000171D  59                pop cx
0000171E  0002              add [bp+si],al
00001720  0000              add [bx+si],al
00001722  0000              add [bx+si],al
00001724  16                push ss
00001725  0000              add [bx+si],al
00001727  0000              add [bx+si],al
00001729  0000              add [bx+si],al
0000172B  0001              add [bx+di],al
0000172D  0100              add [bx+si],ax
0000172F  004741            add [bx+0x41],al
00001732  2B474C            sub ax,[bx+0x4c]
00001735  49                dec cx
00001736  42                inc dx
00001737  43                inc bx
00001738  58                pop ax
00001739  58                pop ax
0000173A  5F                pop di
0000173B  41                inc cx
0000173C  53                push bx
0000173D  53                push bx
0000173E  45                inc bp
0000173F  52                push dx
00001740  54                push sp
00001741  49                dec cx
00001742  4F                dec di
00001743  4E                dec si
00001744  53                push bx
00001745  0000              add [bx+si],al
00001747  000D              add [di],cl
00001749  0000              add [bx+si],al
0000174B  0000              add [bx+si],al
0000174D  0000              add [bx+si],al
0000174F  0001              add [bx+di],al
00001751  0100              add [bx+si],ax
00001753  004741            add [bx+0x41],al
00001756  2A464F            sub al,[bp+0x4f]
00001759  52                push dx
0000175A  54                push sp
0000175B  49                dec cx
0000175C  46                inc si
0000175D  59                pop cx
0000175E  0002              add [bp+si],al
00001760  0000              add [bx+si],al
00001762  0000              add [bx+si],al
00001764  16                push ss
00001765  0000              add [bx+si],al
00001767  0000              add [bx+si],al
00001769  0000              add [bx+si],al
0000176B  0001              add [bx+di],al
0000176D  0100              add [bx+si],ax
0000176F  004741            add [bx+0x41],al
00001772  2B474C            sub ax,[bx+0x4c]
00001775  49                dec cx
00001776  42                inc dx
00001777  43                inc bx
00001778  58                pop ax
00001779  58                pop ax
0000177A  5F                pop di
0000177B  41                inc cx
0000177C  53                push bx
0000177D  53                push bx
0000177E  45                inc bp
0000177F  52                push dx
00001780  54                push sp
00001781  49                dec cx
00001782  4F                dec di
00001783  4E                dec si
00001784  53                push bx
00001785  0000              add [bx+si],al
00001787  000A              add [bp+si],cl
00001789  0000              add [bx+si],al
0000178B  0008              add [bx+si],cl
0000178D  0000              add [bx+si],al
0000178F  0000              add [bx+si],al
00001791  0100              add [bx+si],ax
00001793  004741            add [bx+0x41],al
00001796  2401              and al,0x1
00001798  336839            xor bp,[bx+si+0x39]
0000179B  3231              xor dh,[bx+di]
0000179D  0000              add [bx+si],al
0000179F  004083            add [bx+si-0x7d],al
000017A2  0408              add al,0x8
000017A4  40                inc ax
000017A5  830408            add word [si],byte +0x8
000017A8  0A00              or al,[bx+si]
000017AA  0000              add [bx+si],al
000017AC  0800              or [bx+si],al
000017AE  0000              add [bx+si],al
000017B0  0001              add [bx+di],al
000017B2  0000              add [bx+si],al
000017B4  47                inc di
000017B5  41                inc cx
000017B6  2401              and al,0x1
000017B8  336339            xor sp,[bp+di+0x39]
000017BB  3231              xor dh,[bx+di]
000017BD  0000              add [bx+si],al
000017BF  004083            add [bx+si-0x7d],al
000017C2  0408              add al,0x8
000017C4  40                inc ax
000017C5  830408            add word [si],byte +0x8
000017C8  0A00              or al,[bx+si]
000017CA  0000              add [bx+si],al
000017CC  0800              or [bx+si],al
000017CE  0000              add [bx+si],al
000017D0  0001              add [bx+di],al
000017D2  0000              add [bx+si],al
000017D4  47                inc di
000017D5  41                inc cx
000017D6  2401              and al,0x1
000017D8  337339            xor si,[bp+di+0x39]
000017DB  3231              xor dh,[bx+di]
000017DD  0000              add [bx+si],al
000017DF  004083            add [bx+si-0x7d],al
000017E2  0408              add al,0x8
000017E4  40                inc ax
000017E5  830408            add word [si],byte +0x8
000017E8  0A00              or al,[bx+si]
000017EA  0000              add [bx+si],al
000017EC  0800              or [bx+si],al
000017EE  0000              add [bx+si],al
000017F0  0001              add [bx+di],al
000017F2  0000              add [bx+si],al
000017F4  47                inc di
000017F5  41                inc cx
000017F6  2401              and al,0x1
000017F8  336539            xor sp,[di+0x39]
000017FB  3231              xor dh,[bx+di]
000017FD  0000              add [bx+si],al
000017FF  004083            add [bx+si-0x7d],al
00001802  0408              add al,0x8
00001804  40                inc ax
00001805  830408            add word [si],byte +0x8
00001808  0800              or [bx+si],al
0000180A  0000              add [bx+si],al
0000180C  0800              or [bx+si],al
0000180E  0000              add [bx+si],al
00001810  0001              add [bx+di],al
00001812  0000              add [bx+si],al
00001814  47                inc di
00001815  41                inc cx
00001816  2401              and al,0x1
00001818  336131            xor sp,[bx+di+0x31]
0000181B  007585            add [di-0x7b],dh
0000181E  0408              add al,0x8
00001820  7585              jnz 0x17a7
00001822  0408              add al,0x8
00001824  0800              or [bx+si],al
00001826  0000              add [bx+si],al
00001828  0800              or [bx+si],al
0000182A  0000              add [bx+si],al
0000182C  0001              add [bx+di],al
0000182E  0000              add [bx+si],al
00001830  47                inc di
00001831  41                inc cx
00001832  2401              and al,0x1
00001834  336131            xor sp,[bx+di+0x31]
00001837  007585            add [di-0x7b],dh
0000183A  0408              add al,0x8
0000183C  7585              jnz 0x17c3
0000183E  0408              add al,0x8
00001840  0800              or [bx+si],al
00001842  0000              add [bx+si],al
00001844  0800              or [bx+si],al
00001846  0000              add [bx+si],al
00001848  0001              add [bx+di],al
0000184A  0000              add [bx+si],al
0000184C  47                inc di
0000184D  41                inc cx
0000184E  2401              and al,0x1
00001850  336131            xor sp,[bx+di+0x31]
00001853  0013              add [bp+di],dl
00001855  830408            add word [si],byte +0x8
00001858  18830408          sbb [bp+di+0x804],al
0000185C  0800              or [bx+si],al
0000185E  0000              add [bx+si],al
00001860  0800              or [bx+si],al
00001862  0000              add [bx+si],al
00001864  0001              add [bx+di],al
00001866  0000              add [bx+si],al
00001868  47                inc di
00001869  41                inc cx
0000186A  2401              and al,0x1
0000186C  336131            xor sp,[bx+di+0x31]
0000186F  008B8504          add [bp+di+0x485],cl
00001873  08908504          or [bx+si+0x485],dl
00001877  0800              or [bx+si],al
00001879  0000              add [bx+si],al
0000187B  0000              add [bx+si],al
0000187D  0000              add [bx+si],al
0000187F  0000              add [bx+si],al
00001881  0000              add [bx+si],al
00001883  0000              add [bx+si],al
00001885  0000              add [bx+si],al
00001887  0000              add [bx+si],al
00001889  0000              add [bx+si],al
0000188B  005481            add [si-0x7f],dl
0000188E  0408              add al,0x8
00001890  0000              add [bx+si],al
00001892  0000              add [bx+si],al
00001894  0300              add ax,[bx+si]
00001896  0100              add [bx+si],ax
00001898  0000              add [bx+si],al
0000189A  0000              add [bx+si],al
0000189C  688104            push word 0x481
0000189F  0800              or [bx+si],al
000018A1  0000              add [bx+si],al
000018A3  0003              add [bp+di],al
000018A5  0002              add [bp+si],al
000018A7  0000              add [bx+si],al
000018A9  0000              add [bx+si],al
000018AB  00888104          add [bx+si+0x481],cl
000018AF  0800              or [bx+si],al
000018B1  0000              add [bx+si],al
000018B3  0003              add [bp+di],al
000018B5  0003              add [bp+di],al
000018B7  0000              add [bx+si],al
000018B9  0000              add [bx+si],al
000018BB  00AC8104          add [si+0x481],ch
000018BF  0800              or [bx+si],al
000018C1  0000              add [bx+si],al
000018C3  0003              add [bp+di],al
000018C5  0004              add [si],al
000018C7  0000              add [bx+si],al
000018C9  0000              add [bx+si],al
000018CB  00CC              add ah,cl
000018CD  81040800          add word [si],0x8
000018D1  0000              add [bx+si],al
000018D3  0003              add [bp+di],al
000018D5  0005              add [di],al
000018D7  0000              add [bx+si],al
000018D9  0000              add [bx+si],al
000018DB  002C              add [si],ch
000018DD  82                db 0x82
000018DE  0408              add al,0x8
000018E0  0000              add [bx+si],al
000018E2  0000              add [bx+si],al
000018E4  0300              add ax,[bx+si]
000018E6  06                push es
000018E7  0000              add [bx+si],al
000018E9  0000              add [bx+si],al
000018EB  00A88204          add [bx+si+0x482],ch
000018EF  0800              or [bx+si],al
000018F1  0000              add [bx+si],al
000018F3  0003              add [bp+di],al
000018F5  0007              add [bx],al
000018F7  0000              add [bx+si],al
000018F9  0000              add [bx+si],al
000018FB  00B48204          add [si+0x482],dh
000018FF  0800              or [bx+si],al
00001901  0000              add [bx+si],al
00001903  0003              add [bp+di],al
00001905  0008              add [bx+si],cl
00001907  0000              add [bx+si],al
00001909  0000              add [bx+si],al
0000190B  00D4              add ah,dl
0000190D  82                db 0x82
0000190E  0408              add al,0x8
00001910  0000              add [bx+si],al
00001912  0000              add [bx+si],al
00001914  0300              add ax,[bx+si]
00001916  0900              or [bx+si],ax
00001918  0000              add [bx+si],al
0000191A  0000              add [bx+si],al
0000191C  EC                in al,dx
0000191D  82                db 0x82
0000191E  0408              add al,0x8
00001920  0000              add [bx+si],al
00001922  0000              add [bx+si],al
00001924  0300              add ax,[bx+si]
00001926  0A00              or al,[bx+si]
00001928  0000              add [bx+si],al
0000192A  0000              add [bx+si],al
0000192C  F4                hlt
0000192D  82                db 0x82
0000192E  0408              add al,0x8
00001930  0000              add [bx+si],al
00001932  0000              add [bx+si],al
00001934  0300              add ax,[bx+si]
00001936  0B00              or ax,[bx+si]
00001938  0000              add [bx+si],al
0000193A  0000              add [bx+si],al
0000193C  20830408          and [bp+di+0x804],al
00001940  0000              add [bx+si],al
00001942  0000              add [bx+si],al
00001944  0300              add ax,[bx+si]
00001946  0C00              or al,0x0
00001948  0000              add [bx+si],al
0000194A  0000              add [bx+si],al
0000194C  40                inc ax
0000194D  830408            add word [si],byte +0x8
00001950  0000              add [bx+si],al
00001952  0000              add [bx+si],al
00001954  0300              add ax,[bx+si]
00001956  0D0000            or ax,0x0
00001959  0000              add [bx+si],al
0000195B  007885            add [bx+si-0x7b],bh
0000195E  0408              add al,0x8
00001960  0000              add [bx+si],al
00001962  0000              add [bx+si],al
00001964  0300              add ax,[bx+si]
00001966  0E                push cs
00001967  0000              add [bx+si],al
00001969  0000              add [bx+si],al
0000196B  00908504          add [bx+si+0x485],dl
0000196F  0800              or [bx+si],al
00001971  0000              add [bx+si],al
00001973  0003              add [bp+di],al
00001975  000F              add [bx],cl
00001977  0000              add [bx+si],al
00001979  0000              add [bx+si],al
0000197B  00A08504          add [bx+si+0x485],ah
0000197F  0800              or [bx+si],al
00001981  0000              add [bx+si],al
00001983  0003              add [bp+di],al
00001985  0010              add [bx+si],dl
00001987  0000              add [bx+si],al
00001989  0000              add [bx+si],al
0000198B  00DC              add ah,bl
0000198D  8504              test [si],ax
0000198F  0800              or [bx+si],al
00001991  0000              add [bx+si],al
00001993  0003              add [bp+di],al
00001995  0011              add [bx+di],dl
00001997  0000              add [bx+si],al
00001999  0000              add [bx+si],al
0000199B  0004              add [si],al
0000199D  9F                lahf
0000199E  0408              add al,0x8
000019A0  0000              add [bx+si],al
000019A2  0000              add [bx+si],al
000019A4  0300              add ax,[bx+si]
000019A6  1200              adc al,[bx+si]
000019A8  0000              add [bx+si],al
000019AA  0000              add [bx+si],al
000019AC  089F0408          or [bx+0x804],bl
000019B0  0000              add [bx+si],al
000019B2  0000              add [bx+si],al
000019B4  0300              add ax,[bx+si]
000019B6  1300              adc ax,[bx+si]
000019B8  0000              add [bx+si],al
000019BA  0000              add [bx+si],al
000019BC  0C9F              or al,0x9f
000019BE  0408              add al,0x8
000019C0  0000              add [bx+si],al
000019C2  0000              add [bx+si],al
000019C4  0300              add ax,[bx+si]
000019C6  1400              adc al,0x0
000019C8  0000              add [bx+si],al
000019CA  0000              add [bx+si],al
000019CC  F4                hlt
000019CD  9F                lahf
000019CE  0408              add al,0x8
000019D0  0000              add [bx+si],al
000019D2  0000              add [bx+si],al
000019D4  0300              add ax,[bx+si]
000019D6  150000            adc ax,0x0
000019D9  0000              add [bx+si],al
000019DB  0000              add [bx+si],al
000019DD  A00408            mov al,[0x804]
000019E0  0000              add [bx+si],al
000019E2  0000              add [bx+si],al
000019E4  0300              add ax,[bx+si]
000019E6  16                push ss
000019E7  0000              add [bx+si],al
000019E9  0000              add [bx+si],al
000019EB  0010              add [bx+si],dl
000019ED  A00408            mov al,[0x804]
000019F0  0000              add [bx+si],al
000019F2  0000              add [bx+si],al
000019F4  0300              add ax,[bx+si]
000019F6  17                pop ss
000019F7  0000              add [bx+si],al
000019F9  0000              add [bx+si],al
000019FB  0014              add [si],dl
000019FD  A00408            mov al,[0x804]
00001A00  0000              add [bx+si],al
00001A02  0000              add [bx+si],al
00001A04  0300              add ax,[bx+si]
00001A06  1800              sbb [bx+si],al
00001A08  0000              add [bx+si],al
00001A0A  0000              add [bx+si],al
00001A0C  0000              add [bx+si],al
00001A0E  0000              add [bx+si],al
00001A10  0000              add [bx+si],al
00001A12  0000              add [bx+si],al
00001A14  0300              add ax,[bx+si]
00001A16  1900              sbb [bx+si],ax
00001A18  0000              add [bx+si],al
00001A1A  0000              add [bx+si],al
00001A1C  1CA0              sbb al,0xa0
00001A1E  0408              add al,0x8
00001A20  0000              add [bx+si],al
00001A22  0000              add [bx+si],al
00001A24  0300              add ax,[bx+si]
00001A26  1A00              sbb al,[bx+si]
00001A28  0100              add [bx+si],ax
00001A2A  0000              add [bx+si],al
00001A2C  0000              add [bx+si],al
00001A2E  0000              add [bx+si],al
00001A30  0000              add [bx+si],al
00001A32  0000              add [bx+si],al
00001A34  0400              add al,0x0
00001A36  F1                int1
00001A37  FF                db 0xff
00001A38  3B00              cmp ax,[bx+si]
00001A3A  0000              add [bx+si],al
00001A3C  7B83              jpo 0x19c1
00001A3E  0408              add al,0x8
00001A40  0000              add [bx+si],al
00001A42  0000              add [bx+si],al
00001A44  0002              add [bp+si],al
00001A46  0D004B            or ax,0x4b00
00001A49  0000              add [bx+si],al
00001A4B  007B83            add [bp+di-0x7d],bh
00001A4E  0408              add al,0x8
00001A50  0000              add [bx+si],al
00001A52  0000              add [bx+si],al
00001A54  0002              add [bp+si],al
00001A56  0D005F            or ax,0x5f00
00001A59  0000              add [bx+si],al
00001A5B  004083            add [bx+si-0x7d],al
00001A5E  0408              add al,0x8
00001A60  0000              add [bx+si],al
00001A62  0000              add [bx+si],al
00001A64  0002              add [bp+si],al
00001A66  0D0073            or ax,0x7300
00001A69  0000              add [bx+si],al
00001A6B  004083            add [bx+si-0x7d],al
00001A6E  0408              add al,0x8
00001A70  0000              add [bx+si],al
00001A72  0000              add [bx+si],al
00001A74  0002              add [bp+si],al
00001A76  0D008B            or ax,0x8b00
00001A79  0000              add [bx+si],al
00001A7B  004083            add [bx+si-0x7d],al
00001A7E  0408              add al,0x8
00001A80  0000              add [bx+si],al
00001A82  0000              add [bx+si],al
00001A84  0002              add [bp+si],al
00001A86  0D00A4            or ax,0xa400
00001A89  0000              add [bx+si],al
00001A8B  004083            add [bx+si-0x7d],al
00001A8E  0408              add al,0x8
00001A90  0000              add [bx+si],al
00001A92  0000              add [bx+si],al
00001A94  0002              add [bp+si],al
00001A96  0D00C1            or ax,0xc100
00001A99  0000              add [bx+si],al
00001A9B  004083            add [bx+si-0x7d],al
00001A9E  0408              add al,0x8
00001AA0  0000              add [bx+si],al
00001AA2  0000              add [bx+si],al
00001AA4  0002              add [bp+si],al
00001AA6  0D00D9            or ax,0xd900
00001AA9  0000              add [bx+si],al
00001AAB  004083            add [bx+si-0x7d],al
00001AAE  0408              add al,0x8
00001AB0  0000              add [bx+si],al
00001AB2  0000              add [bx+si],al
00001AB4  0002              add [bp+si],al
00001AB6  0D00F5            or ax,0xf500
00001AB9  0000              add [bx+si],al
00001ABB  004083            add [bx+si-0x7d],al
00001ABE  0408              add al,0x8
00001AC0  0000              add [bx+si],al
00001AC2  0000              add [bx+si],al
00001AC4  0002              add [bp+si],al
00001AC6  0D000A            or ax,0xa00
00001AC9  0100              add [bx+si],ax
00001ACB  004083            add [bx+si-0x7d],al
00001ACE  0408              add al,0x8
00001AD0  0000              add [bx+si],al
00001AD2  0000              add [bx+si],al
00001AD4  0002              add [bp+si],al
00001AD6  0D0023            or ax,0x2300
00001AD9  0100              add [bx+si],ax
00001ADB  00808304          add [bx+si+0x483],al
00001ADF  0800              or [bx+si],al
00001AE1  0000              add [bx+si],al
00001AE3  0000              add [bx+si],al
00001AE5  020D              add cl,[di]
00001AE7  003B              add [bp+di],bh
00001AE9  0100              add [bx+si],ax
00001AEB  00858304          add [di+0x483],al
00001AEF  0800              or [bx+si],al
00001AF1  0000              add [bx+si],al
00001AF3  0000              add [bx+si],al
00001AF5  020D              add cl,[di]
00001AF7  005701            add [bx+0x1],dl
00001AFA  0000              add [bx+si],al
00001AFC  40                inc ax
00001AFD  830408            add word [si],byte +0x8
00001B00  0000              add [bx+si],al
00001B02  0000              add [bx+si],al
00001B04  0002              add [bp+si],al
00001B06  0D0073            or ax,0x7300
00001B09  0100              add [bx+si],ax
00001B0B  004083            add [bx+si-0x7d],al
00001B0E  0408              add al,0x8
00001B10  0000              add [bx+si],al
00001B12  0000              add [bx+si],al
00001B14  0002              add [bp+si],al
00001B16  0D0093            or ax,0x9300
00001B19  0100              add [bx+si],ax
00001B1B  004083            add [bx+si-0x7d],al
00001B1E  0408              add al,0x8
00001B20  0000              add [bx+si],al
00001B22  0000              add [bx+si],al
00001B24  0002              add [bp+si],al
00001B26  0D00B4            or ax,0xb400
00001B29  0100              add [bx+si],ax
00001B2B  004083            add [bx+si-0x7d],al
00001B2E  0408              add al,0x8
00001B30  0000              add [bx+si],al
00001B32  0000              add [bx+si],al
00001B34  0002              add [bp+si],al
00001B36  0D00D9            or ax,0xd900
00001B39  0100              add [bx+si],ax
00001B3B  004083            add [bx+si-0x7d],al
00001B3E  0408              add al,0x8
00001B40  0000              add [bx+si],al
00001B42  0000              add [bx+si],al
00001B44  0002              add [bp+si],al
00001B46  0D00F9            or ax,0xf900
00001B49  0100              add [bx+si],ax
00001B4B  004083            add [bx+si-0x7d],al
00001B4E  0408              add al,0x8
00001B50  0000              add [bx+si],al
00001B52  0000              add [bx+si],al
00001B54  0002              add [bp+si],al
00001B56  0D001D            or ax,0x1d00
00001B59  0200              add al,[bx+si]
00001B5B  004083            add [bx+si-0x7d],al
00001B5E  0408              add al,0x8
00001B60  0000              add [bx+si],al
00001B62  0000              add [bx+si],al
00001B64  0002              add [bp+si],al
00001B66  0D003A            or ax,0x3a00
00001B69  0200              add al,[bx+si]
00001B6B  004083            add [bx+si-0x7d],al
00001B6E  0408              add al,0x8
00001B70  0000              add [bx+si],al
00001B72  0000              add [bx+si],al
00001B74  0002              add [bp+si],al
00001B76  0D005B            or ax,0x5b00
00001B79  0200              add al,[bx+si]
00001B7B  00808304          add [bx+si+0x483],al
00001B7F  0800              or [bx+si],al
00001B81  0000              add [bx+si],al
00001B83  0000              add [bx+si],al
00001B85  020D              add cl,[di]
00001B87  00820200          add [bp+si+0x2],al
00001B8B  00858304          add [di+0x483],al
00001B8F  0800              or [bx+si],al
00001B91  0000              add [bx+si],al
00001B93  0000              add [bx+si],al
00001B95  020D              add cl,[di]
00001B97  00A70200          add [bx+0x2],ah
00001B9B  0000              add [bx+si],al
00001B9D  0000              add [bx+si],al
00001B9F  0000              add [bx+si],al
00001BA1  0000              add [bx+si],al
00001BA3  0004              add [si],al
00001BA5  00F1              add cl,dh
00001BA7  FFB30200          push word [bp+di+0x2]
00001BAB  0010              add [bx+si],dl
00001BAD  8504              test [si],ax
00001BAF  0800              or [bx+si],al
00001BB1  0000              add [bx+si],al
00001BB3  0000              add [bx+si],al
00001BB5  020D              add cl,[di]
00001BB7  00C7              add bh,al
00001BB9  0200              add al,[bx+si]
00001BBB  007585            add [di-0x7b],dh
00001BBE  0408              add al,0x8
00001BC0  0000              add [bx+si],al
00001BC2  0000              add [bx+si],al
00001BC4  0002              add [bp+si],al
00001BC6  0D00DF            or ax,0xdf00
00001BC9  0200              add al,[bx+si]
00001BCB  004083            add [bx+si-0x7d],al
00001BCE  0408              add al,0x8
00001BD0  0000              add [bx+si],al
00001BD2  0000              add [bx+si],al
00001BD4  0002              add [bp+si],al
00001BD6  0D00F7            or ax,0xf700
00001BD9  0200              add al,[bx+si]
00001BDB  004083            add [bx+si-0x7d],al
00001BDE  0408              add al,0x8
00001BE0  0000              add [bx+si],al
00001BE2  0000              add [bx+si],al
00001BE4  0002              add [bp+si],al
00001BE6  0D0013            or ax,0x1300
00001BE9  0300              add ax,[bx+si]
00001BEB  004083            add [bx+si-0x7d],al
00001BEE  0408              add al,0x8
00001BF0  0000              add [bx+si],al
00001BF2  0000              add [bx+si],al
00001BF4  0002              add [bp+si],al
00001BF6  0D0030            or ax,0x3000
00001BF9  0300              add ax,[bx+si]
00001BFB  004083            add [bx+si-0x7d],al
00001BFE  0408              add al,0x8
00001C00  0000              add [bx+si],al
00001C02  0000              add [bx+si],al
00001C04  0002              add [bp+si],al
00001C06  0D0051            or ax,0x5100
00001C09  0300              add ax,[bx+si]
00001C0B  004083            add [bx+si-0x7d],al
00001C0E  0408              add al,0x8
00001C10  0000              add [bx+si],al
00001C12  0000              add [bx+si],al
00001C14  0002              add [bp+si],al
00001C16  0D006D            or ax,0x6d00
00001C19  0300              add ax,[bx+si]
00001C1B  004083            add [bx+si-0x7d],al
00001C1E  0408              add al,0x8
00001C20  0000              add [bx+si],al
00001C22  0000              add [bx+si],al
00001C24  0002              add [bp+si],al
00001C26  0D008D            or ax,0x8d00
00001C29  0300              add ax,[bx+si]
00001C2B  004083            add [bx+si-0x7d],al
00001C2E  0408              add al,0x8
00001C30  0000              add [bx+si],al
00001C32  0000              add [bx+si],al
00001C34  0002              add [bp+si],al
00001C36  0D00A6            or ax,0xa600
00001C39  0300              add ax,[bx+si]
00001C3B  004083            add [bx+si-0x7d],al
00001C3E  0408              add al,0x8
00001C40  0000              add [bx+si],al
00001C42  0000              add [bx+si],al
00001C44  0002              add [bp+si],al
00001C46  0D00C3            or ax,0xc300
00001C49  0300              add ax,[bx+si]
00001C4B  0010              add [bx+si],dl
00001C4D  8504              test [si],ax
00001C4F  0800              or [bx+si],al
00001C51  0000              add [bx+si],al
00001C53  0000              add [bx+si],al
00001C55  020D              add cl,[di]
00001C57  00E2              add dl,ah
00001C59  0300              add ax,[bx+si]
00001C5B  006D85            add [di-0x7b],ch
00001C5E  0408              add al,0x8
00001C60  0000              add [bx+si],al
00001C62  0000              add [bx+si],al
00001C64  0002              add [bp+si],al
00001C66  0D00FF            or ax,0xff00
00001C69  0300              add ax,[bx+si]
00001C6B  006D85            add [di-0x7b],ch
00001C6E  0408              add al,0x8
00001C70  0000              add [bx+si],al
00001C72  0000              add [bx+si],al
00001C74  0002              add [bp+si],al
00001C76  0D001E            or ax,0x1e00
00001C79  0400              add al,0x0
00001C7B  007585            add [di-0x7b],dh
00001C7E  0408              add al,0x8
00001C80  0000              add [bx+si],al
00001C82  0000              add [bx+si],al
00001C84  0002              add [bp+si],al
00001C86  0D003B            or ax,0x3b00
00001C89  0400              add al,0x0
00001C8B  0000              add [bx+si],al
00001C8D  0000              add [bx+si],al
00001C8F  0000              add [bx+si],al
00001C91  0000              add [bx+si],al
00001C93  0004              add [si],al
00001C95  00F1              add cl,dh
00001C97  FF4604            inc word [bp+0x4]
00001C9A  0000              add [bx+si],al
00001C9C  A08304            mov al,[0x483]
00001C9F  0800              or [bx+si],al
00001CA1  0000              add [bx+si],al
00001CA3  0002              add [bp+si],al
00001CA5  000D              add [di],cl
00001CA7  004804            add [bx+si+0x4],cl
00001CAA  0000              add [bx+si],al
00001CAC  E083              loopne 0x1c31
00001CAE  0408              add al,0x8
00001CB0  0000              add [bx+si],al
00001CB2  0000              add [bx+si],al
00001CB4  0200              add al,[bx+si]
00001CB6  0D005B            or ax,0x5b00
00001CB9  0400              add al,0x0
00001CBB  0030              add [bx+si],dh
00001CBD  8404              test [si],al
00001CBF  0800              or [bx+si],al
00001CC1  0000              add [bx+si],al
00001CC3  0002              add [bp+si],al
00001CC5  000D              add [di],cl
00001CC7  007104            add [bx+di+0x4],dh
00001CCA  0000              add [bx+si],al
00001CCC  14A0              adc al,0xa0
00001CCE  0408              add al,0x8
00001CD0  0100              add [bx+si],ax
00001CD2  0000              add [bx+si],al
00001CD4  0100              add [bx+si],ax
00001CD6  1800              sbb [bx+si],al
00001CD8  800400            add byte [si],0x0
00001CDB  0008              add [bx+si],cl
00001CDD  9F                lahf
00001CDE  0408              add al,0x8
00001CE0  0000              add [bx+si],al
00001CE2  0000              add [bx+si],al
00001CE4  0100              add [bx+si],ax
00001CE6  1300              adc ax,[bx+si]
00001CE8  A7                cmpsw
00001CE9  0400              add al,0x0
00001CEB  007084            add [bx+si-0x7c],dh
00001CEE  0408              add al,0x8
00001CF0  0000              add [bx+si],al
00001CF2  0000              add [bx+si],al
00001CF4  0200              add al,[bx+si]
00001CF6  0D00B3            or ax,0xb300
00001CF9  0400              add al,0x0
00001CFB  0004              add [si],al
00001CFD  9F                lahf
00001CFE  0408              add al,0x8
00001D00  0000              add [bx+si],al
00001D02  0000              add [bx+si],al
00001D04  0100              add [bx+si],ax
00001D06  1200              adc al,[bx+si]
00001D08  D204              rol byte [si],cl
00001D0A  0000              add [bx+si],al
00001D0C  0000              add [bx+si],al
00001D0E  0000              add [bx+si],al
00001D10  0000              add [bx+si],al
00001D12  0000              add [bx+si],al
00001D14  0400              add al,0x0
00001D16  F1                int1
00001D17  FF                db 0xff
00001D18  D904              fld dword [si]
00001D1A  0000              add [bx+si],al
00001D1C  0000              add [bx+si],al
00001D1E  0000              add [bx+si],al
00001D20  0000              add [bx+si],al
00001D22  0000              add [bx+si],al
00001D24  0400              add al,0x0
00001D26  F1                int1
00001D27  FFE6              jmp si
00001D29  0400              add al,0x0
00001D2B  00D8              add al,bl
00001D2D  8404              test [si],al
00001D2F  0800              or [bx+si],al
00001D31  0000              add [bx+si],al
00001D33  0000              add [bx+si],al
00001D35  000D              add [di],cl
00001D37  00F8              add al,bh
00001D39  0400              add al,0x0
00001D3B  00F2              add dl,dh
00001D3D  8404              test [si],al
00001D3F  0800              or [bx+si],al
00001D41  0000              add [bx+si],al
00001D43  0000              add [bx+si],al
00001D45  000D              add [di],cl
00001D47  000A              add [bp+si],cl
00001D49  050000            add ax,0x0
00001D4C  FE840408          inc byte [si+0x804]
00001D50  0000              add [bx+si],al
00001D52  0000              add [bx+si],al
00001D54  0000              add [bx+si],al
00001D56  0D003B            or ax,0x3b00
00001D59  0400              add al,0x0
00001D5B  0000              add [bx+si],al
00001D5D  0000              add [bx+si],al
00001D5F  0000              add [bx+si],al
00001D61  0000              add [bx+si],al
00001D63  0004              add [si],al
00001D65  00F1              add cl,dh
00001D67  FF1C              call far [si]
00001D69  050000            add ax,0x0
00001D6C  CC                int3
00001D6D  8604              xchg al,[si]
00001D6F  0800              or [bx+si],al
00001D71  0000              add [bx+si],al
00001D73  0001              add [bx+di],al
00001D75  0011              add [bx+di],dl
00001D77  0000              add [bx+si],al
00001D79  0000              add [bx+si],al
00001D7B  0000              add [bx+si],al
00001D7D  0000              add [bx+si],al
00001D7F  0000              add [bx+si],al
00001D81  0000              add [bx+si],al
00001D83  0004              add [si],al
00001D85  00F1              add cl,dh
00001D87  FF2A              jmp far [bp+si]
00001D89  050000            add ax,0x0
00001D8C  089F0408          or [bx+0x804],bl
00001D90  0000              add [bx+si],al
00001D92  0000              add [bx+si],al
00001D94  0000              add [bx+si],al
00001D96  1200              adc al,[bx+si]
00001D98  3B05              cmp ax,[di]
00001D9A  0000              add [bx+si],al
00001D9C  0C9F              or al,0x9f
00001D9E  0408              add al,0x8
00001DA0  0000              add [bx+si],al
00001DA2  0000              add [bx+si],al
00001DA4  0100              add [bx+si],ax
00001DA6  1400              adc al,0x0
00001DA8  44                inc sp
00001DA9  050000            add ax,0x0
00001DAC  049F              add al,0x9f
00001DAE  0408              add al,0x8
00001DB0  0000              add [bx+si],al
00001DB2  0000              add [bx+si],al
00001DB4  0000              add [bx+si],al
00001DB6  1200              adc al,[bx+si]
00001DB8  57                push di
00001DB9  050000            add ax,0x0
00001DBC  A08504            mov al,[0x485]
00001DBF  0800              or [bx+si],al
00001DC1  0000              add [bx+si],al
00001DC3  0000              add [bx+si],al
00001DC5  0010              add [bx+si],dl
00001DC7  006A05            add [bp+si+0x5],ch
00001DCA  0000              add [bx+si],al
00001DCC  00A00408          add [bx+si+0x804],ah
00001DD0  0000              add [bx+si],al
00001DD2  0000              add [bx+si],al
00001DD4  0100              add [bx+si],ax
00001DD6  16                push ss
00001DD7  00800500          add [bx+si+0x5],al
00001DDB  007085            add [bx+si-0x7b],dh
00001DDE  0408              add al,0x8
00001DE0  050000            add ax,0x0
00001DE3  0012              add [bp+si],dl
00001DE5  000D              add [di],cl
00001DE7  00900500          add [bx+si+0x5],dl
00001DEB  0000              add [bx+si],al
00001DED  0000              add [bx+si],al
00001DEF  0000              add [bx+si],al
00001DF1  0000              add [bx+si],al
00001DF3  0020              add [bx+si],ah
00001DF5  0000              add [bx+si],al
00001DF7  00AC0500          add [si+0x5],ch
00001DFB  00908304          add [bx+si+0x483],dl
00001DFF  0804              or [si],al
00001E01  0000              add [bx+si],al
00001E03  0012              add [bp+si],dl
00001E05  020D              add cl,[di]
00001E07  00E9              add cl,ch
00001E09  050000            add ax,0x0
00001E0C  10A00408          adc [bx+si+0x804],ah
00001E10  0000              add [bx+si],al
00001E12  0000              add [bx+si],al
00001E14  2000              and [bx+si],al
00001E16  17                pop ss
00001E17  00C2              add dl,al
00001E19  050000            add ax,0x0
00001E1C  18A00408          sbb [bx+si+0x804],ah
00001E20  0400              add al,0x0
00001E22  0000              add [bx+si],al
00001E24  1100              adc [bx+si],ax
00001E26  1800              sbb [bx+si],al
00001E28  CA0500            retf 0x5
00001E2B  0014              add [si],dl
00001E2D  A00408            mov al,[0x804]
00001E30  0000              add [bx+si],al
00001E32  0000              add [bx+si],al
00001E34  1000              adc [bx+si],al
00001E36  17                pop ss
00001E37  008A0500          add [bp+si+0x5],cl
00001E3B  007885            add [bx+si-0x7b],bh
00001E3E  0408              add al,0x8
00001E40  0000              add [bx+si],al
00001E42  0000              add [bx+si],al
00001E44  1202              adc al,[bp+si]
00001E46  0E                push cs
00001E47  00D1              add cl,dl
00001E49  050000            add ax,0x0
00001E4C  7984              jns 0x1dd2
00001E4E  0408              add al,0x8
00001E50  0000              add [bx+si],al
00001E52  0000              add [bx+si],al
00001E54  1202              adc al,[bp+si]
00001E56  0D00E7            or ax,0xe700
00001E59  050000            add ax,0x0
00001E5C  10A00408          adc [bx+si+0x804],ah
00001E60  0000              add [bx+si],al
00001E62  0000              add [bx+si],al
00001E64  1000              adc [bx+si],al
00001E66  17                pop ss
00001E67  00F4              add ah,dh
00001E69  050000            add ax,0x0
00001E6C  0000              add [bx+si],al
00001E6E  0000              add [bx+si],al
00001E70  0000              add [bx+si],al
00001E72  0000              add [bx+si],al
00001E74  2000              and [bx+si],al
00001E76  0000              add [bx+si],al
00001E78  03060000          add ax,[0x0]
00001E7C  98                cbw
00001E7D  8504              test [si],ax
00001E7F  0800              or [bx+si],al
00001E81  0000              add [bx+si],al
00001E83  0011              add [bx+di],dl
00001E85  020F              add cl,[bx]
00001E87  0010              add [bx+si],dl
00001E89  06                push es
00001E8A  0000              add [bx+si],al
00001E8C  94                xchg ax,sp
00001E8D  8504              test [si],ax
00001E8F  0804              or [si],al
00001E91  0000              add [bx+si],al
00001E93  0011              add [bx+di],dl
00001E95  000F              add [bx],cl
00001E97  001F              add [bx],bl
00001E99  06                push es
00001E9A  0000              add [bx+si],al
00001E9C  0000              add [bx+si],al
00001E9E  0000              add [bx+si],al
00001EA0  0000              add [bx+si],al
00001EA2  0000              add [bx+si],al
00001EA4  1200              adc al,[bx+si]
00001EA6  0000              add [bx+si],al
00001EA8  3C06              cmp al,0x6
00001EAA  0000              add [bx+si],al
00001EAC  10850408          adc [di+0x804],al
00001EB0  5D                pop bp
00001EB1  0000              add [bx+si],al
00001EB3  0012              add [bp+si],dl
00001EB5  000D              add [di],cl
00001EB7  005201            add [bp+si+0x1],dl
00001EBA  0000              add [bx+si],al
00001EBC  1CA0              sbb al,0xa0
00001EBE  0408              add al,0x8
00001EC0  0000              add [bx+si],al
00001EC2  0000              add [bx+si],al
00001EC4  1000              adc [bx+si],al
00001EC6  1800              sbb [bx+si],al
00001EC8  4C                dec sp
00001EC9  06                push es
00001ECA  0000              add [bx+si],al
00001ECC  8083040805        add byte [bp+di+0x804],0x5
00001ED1  0000              add [bx+si],al
00001ED3  0012              add [bp+si],dl
00001ED5  020D              add cl,[di]
00001ED7  00ED              add ch,ch
00001ED9  050000            add ax,0x0
00001EDC  40                inc ax
00001EDD  830408            add word [si],byte +0x8
00001EE0  3B00              cmp ax,[bx+si]
00001EE2  0000              add [bx+si],al
00001EE4  1200              adc al,[bx+si]
00001EE6  0D0064            or ax,0x6400
00001EE9  06                push es
00001EEA  0000              add [bx+si],al
00001EEC  90                nop
00001EED  8504              test [si],ax
00001EEF  0804              or [si],al
00001EF1  0000              add [bx+si],al
00001EF3  0011              add [bx+di],dl
00001EF5  000F              add [bx],cl
00001EF7  006B06            add [bp+di+0x6],ch
00001EFA  0000              add [bx+si],al
00001EFC  14A0              adc al,0xa0
00001EFE  0408              add al,0x8
00001F00  0000              add [bx+si],al
00001F02  0000              add [bx+si],al
00001F04  1000              adc [bx+si],al
00001F06  1800              sbb [bx+si],al
00001F08  7706              ja 0x1f10
00001F0A  0000              add [bx+si],al
00001F0C  7D84              jnl 0x1e92
00001F0E  0408              add al,0x8
00001F10  3D0000            cmp ax,0x0
00001F13  0012              add [bp+si],dl
00001F15  000D              add [di],cl
00001F17  007C06            add [si+0x6],bh
00001F1A  0000              add [bx+si],al
00001F1C  14A0              adc al,0xa0
00001F1E  0408              add al,0x8
00001F20  0000              add [bx+si],al
00001F22  0000              add [bx+si],al
00001F24  1102              adc [bp+si],ax
00001F26  17                pop ss
00001F27  00880600          add [bx+si+0x6],cl
00001F2B  0000              add [bx+si],al
00001F2D  0000              add [bx+si],al
00001F2F  0000              add [bx+si],al
00001F31  0000              add [bx+si],al
00001F33  0020              add [bx+si],ah
00001F35  0000              add [bx+si],al
00001F37  004606            add [bp+0x6],al
00001F3A  0000              add [bx+si],al
00001F3C  F4                hlt
00001F3D  82                db 0x82
00001F3E  0408              add al,0x8
00001F40  0000              add [bx+si],al
00001F42  0000              add [bx+si],al
00001F44  1202              adc al,[bp+si]
00001F46  0B00              or ax,[bx+si]
00001F48  A20600            mov [0x6],al
00001F4B  00C0              add al,al
00001F4D  8404              test [si],al
00001F4F  0800              or [bx+si],al
00001F51  0000              add [bx+si],al
00001F53  0010              add [bx+si],dl
00001F55  000D              add [di],cl
00001F57  0000              add [bx+si],al
00001F59  2F                das
00001F5A  7573              jnz 0x1fcf
00001F5C  722F              jc 0x1f8d
00001F5E  6C                insb
00001F5F  69622F6763        imul sp,[bp+si+0x2f],word 0x6367
00001F64  632F              arpl [bx],bp
00001F66  7838              js 0x1fa0
00001F68  365F              ss pop di
00001F6A  36342D            ss xor al,0x2d
00001F6D  7265              jc 0x1fd4
00001F6F  64686174          fs push word 0x7461
00001F73  2D6C69            sub ax,0x696c
00001F76  6E                outsb
00001F77  7578              jnz 0x1ff1
00001F79  2F                das
00001F7A  382F              cmp [bx],ch
00001F7C  2E2E2F            cs das
00001F7F  2E2E2F            cs das
00001F82  2E2E2F            cs das
00001F85  2E2E2F            cs das
00001F88  6C                insb
00001F89  69622F6372        imul sp,[bp+si+0x2f],word 0x7263
00001F8E  7431              jz 0x1fc1
00001F90  2E6F              cs outsw
00001F92  002E616E          add [0x6e61],ch
00001F96  6E                outsb
00001F97  6F                outsw
00001F98  62696E            bound bp,[bx+di+0x6e]
00001F9B  5F                pop di
00001F9C  696E69742E        imul bp,[bp+0x69],word 0x2e74
00001FA1  6300              arpl [bx+si],ax
00001FA3  2E61              cs popa
00001FA5  6E                outsb
00001FA6  6E                outsb
00001FA7  6F                outsw
00001FA8  62696E            bound bp,[bx+di+0x6e]
00001FAB  5F                pop di
00001FAC  696E69742E        imul bp,[bp+0x69],word 0x2e74
00001FB1  635F65            arpl [bx+0x65],bx
00001FB4  6E                outsb
00001FB5  64002E616E        add [fs:0x6e61],ch
00001FBA  6E                outsb
00001FBB  6F                outsw
00001FBC  62696E            bound bp,[bx+di+0x6e]
00001FBF  5F                pop di
00001FC0  696E69742E        imul bp,[bp+0x69],word 0x2e74
00001FC5  632E686F          arpl [0x6f68],bp
00001FC9  7400              jz 0x1fcb
00001FCB  2E61              cs popa
00001FCD  6E                outsb
00001FCE  6E                outsb
00001FCF  6F                outsw
00001FD0  62696E            bound bp,[bx+di+0x6e]
00001FD3  5F                pop di
00001FD4  696E69742E        imul bp,[bp+0x69],word 0x2e74
00001FD9  635F65            arpl [bx+0x65],bx
00001FDC  6E                outsb
00001FDD  642E686F74        cs push word 0x746f
00001FE2  002E616E          add [0x6e61],ch
00001FE6  6E                outsb
00001FE7  6F                outsw
00001FE8  62696E            bound bp,[bx+di+0x6e]
00001FEB  5F                pop di
00001FEC  696E69742E        imul bp,[bp+0x69],word 0x2e74
00001FF1  632E756E          arpl [0x6e75],bp
00001FF5  6C                insb
00001FF6  696B656C79        imul bp,[bp+di+0x65],word 0x796c
00001FFB  002E616E          add [0x6e61],ch
00001FFF  6E                outsb
00002000  6F                outsw
00002001  62696E            bound bp,[bx+di+0x6e]
00002004  5F                pop di
00002005  696E69742E        imul bp,[bp+0x69],word 0x2e74
0000200A  635F65            arpl [bx+0x65],bx
0000200D  6E                outsb
0000200E  642E756E          cs jnz 0x2080
00002012  6C                insb
00002013  696B656C79        imul bp,[bp+di+0x65],word 0x796c
00002018  002E616E          add [0x6e61],ch
0000201C  6E                outsb
0000201D  6F                outsw
0000201E  62696E            bound bp,[bx+di+0x6e]
00002021  5F                pop di
00002022  696E69742E        imul bp,[bp+0x69],word 0x2e74
00002027  632E7374          arpl [0x7473],bp
0000202B  61                popa
0000202C  7274              jc 0x20a2
0000202E  7570              jnz 0x20a0
00002030  002E616E          add [0x6e61],ch
00002034  6E                outsb
00002035  6F                outsw
00002036  62696E            bound bp,[bx+di+0x6e]
00002039  5F                pop di
0000203A  696E69742E        imul bp,[bp+0x69],word 0x2e74
0000203F  635F65            arpl [bx+0x65],bx
00002042  6E                outsb
00002043  642E7374          cs jnc 0x20bb
00002047  61                popa
00002048  7274              jc 0x20be
0000204A  7570              jnz 0x20bc
0000204C  002E616E          add [0x6e61],ch
00002050  6E                outsb
00002051  6F                outsw
00002052  62696E            bound bp,[bx+di+0x6e]
00002055  5F                pop di
00002056  696E69742E        imul bp,[bp+0x69],word 0x2e74
0000205B  632E6578          arpl [0x7865],bp
0000205F  6974002E61        imul si,[si+0x0],word 0x612e
00002064  6E                outsb
00002065  6E                outsb
00002066  6F                outsw
00002067  62696E            bound bp,[bx+di+0x6e]
0000206A  5F                pop di
0000206B  696E69742E        imul bp,[bp+0x69],word 0x2e74
00002070  635F65            arpl [bx+0x65],bx
00002073  6E                outsb
00002074  642E657869        gs js 0x20e2
00002079  7400              jz 0x207b
0000207B  2E61              cs popa
0000207D  6E                outsb
0000207E  6E                outsb
0000207F  6F                outsw
00002080  62696E            bound bp,[bx+di+0x6e]
00002083  5F                pop di
00002084  7374              jnc 0x20fa
00002086  61                popa
00002087  7469              jz 0x20f2
00002089  635F72            arpl [bx+0x72],bx
0000208C  656C              gs insb
0000208E  6F                outsw
0000208F  632E6300          arpl [0x63],bp
00002093  2E61              cs popa
00002095  6E                outsb
00002096  6E                outsb
00002097  6F                outsw
00002098  62696E            bound bp,[bx+di+0x6e]
0000209B  5F                pop di
0000209C  7374              jnc 0x2112
0000209E  61                popa
0000209F  7469              jz 0x210a
000020A1  635F72            arpl [bx+0x72],bx
000020A4  656C              gs insb
000020A6  6F                outsw
000020A7  632E635F          arpl [0x5f63],bp
000020AB  656E              gs outsb
000020AD  64002E616E        add [fs:0x6e61],ch
000020B2  6E                outsb
000020B3  6F                outsw
000020B4  62696E            bound bp,[bx+di+0x6e]
000020B7  5F                pop di
000020B8  7374              jnc 0x212e
000020BA  61                popa
000020BB  7469              jz 0x2126
000020BD  635F72            arpl [bx+0x72],bx
000020C0  656C              gs insb
000020C2  6F                outsw
000020C3  632E632E          arpl [0x2e63],bp
000020C7  686F74            push word 0x746f
000020CA  002E616E          add [0x6e61],ch
000020CE  6E                outsb
000020CF  6F                outsw
000020D0  62696E            bound bp,[bx+di+0x6e]
000020D3  5F                pop di
000020D4  7374              jnc 0x214a
000020D6  61                popa
000020D7  7469              jz 0x2142
000020D9  635F72            arpl [bx+0x72],bx
000020DC  656C              gs insb
000020DE  6F                outsw
000020DF  632E635F          arpl [0x5f63],bp
000020E3  656E              gs outsb
000020E5  642E686F74        cs push word 0x746f
000020EA  002E616E          add [0x6e61],ch
000020EE  6E                outsb
000020EF  6F                outsw
000020F0  62696E            bound bp,[bx+di+0x6e]
000020F3  5F                pop di
000020F4  7374              jnc 0x216a
000020F6  61                popa
000020F7  7469              jz 0x2162
000020F9  635F72            arpl [bx+0x72],bx
000020FC  656C              gs insb
000020FE  6F                outsw
000020FF  632E632E          arpl [0x2e63],bp
00002103  756E              jnz 0x2173
00002105  6C                insb
00002106  696B656C79        imul bp,[bp+di+0x65],word 0x796c
0000210B  002E616E          add [0x6e61],ch
0000210F  6E                outsb
00002110  6F                outsw
00002111  62696E            bound bp,[bx+di+0x6e]
00002114  5F                pop di
00002115  7374              jnc 0x218b
00002117  61                popa
00002118  7469              jz 0x2183
0000211A  635F72            arpl [bx+0x72],bx
0000211D  656C              gs insb
0000211F  6F                outsw
00002120  632E635F          arpl [0x5f63],bp
00002124  656E              gs outsb
00002126  642E756E          cs jnz 0x2198
0000212A  6C                insb
0000212B  696B656C79        imul bp,[bp+di+0x65],word 0x796c
00002130  002E616E          add [0x6e61],ch
00002134  6E                outsb
00002135  6F                outsw
00002136  62696E            bound bp,[bx+di+0x6e]
00002139  5F                pop di
0000213A  7374              jnc 0x21b0
0000213C  61                popa
0000213D  7469              jz 0x21a8
0000213F  635F72            arpl [bx+0x72],bx
00002142  656C              gs insb
00002144  6F                outsw
00002145  632E632E          arpl [0x2e63],bp
00002149  7374              jnc 0x21bf
0000214B  61                popa
0000214C  7274              jc 0x21c2
0000214E  7570              jnz 0x21c0
00002150  002E616E          add [0x6e61],ch
00002154  6E                outsb
00002155  6F                outsw
00002156  62696E            bound bp,[bx+di+0x6e]
00002159  5F                pop di
0000215A  7374              jnc 0x21d0
0000215C  61                popa
0000215D  7469              jz 0x21c8
0000215F  635F72            arpl [bx+0x72],bx
00002162  656C              gs insb
00002164  6F                outsw
00002165  632E635F          arpl [0x5f63],bp
00002169  656E              gs outsb
0000216B  642E7374          cs jnc 0x21e3
0000216F  61                popa
00002170  7274              jc 0x21e6
00002172  7570              jnz 0x21e4
00002174  002E616E          add [0x6e61],ch
00002178  6E                outsb
00002179  6F                outsw
0000217A  62696E            bound bp,[bx+di+0x6e]
0000217D  5F                pop di
0000217E  7374              jnc 0x21f4
00002180  61                popa
00002181  7469              jz 0x21ec
00002183  635F72            arpl [bx+0x72],bx
00002186  656C              gs insb
00002188  6F                outsw
00002189  632E632E          arpl [0x2e63],bp
0000218D  657869            gs js 0x21f9
00002190  7400              jz 0x2192
00002192  2E61              cs popa
00002194  6E                outsb
00002195  6E                outsb
00002196  6F                outsw
00002197  62696E            bound bp,[bx+di+0x6e]
0000219A  5F                pop di
0000219B  7374              jnc 0x2211
0000219D  61                popa
0000219E  7469              jz 0x2209
000021A0  635F72            arpl [bx+0x72],bx
000021A3  656C              gs insb
000021A5  6F                outsw
000021A6  632E635F          arpl [0x5f63],bp
000021AA  656E              gs outsb
000021AC  642E657869        gs js 0x221a
000021B1  7400              jz 0x21b3
000021B3  2E61              cs popa
000021B5  6E                outsb
000021B6  6E                outsb
000021B7  6F                outsw
000021B8  62696E            bound bp,[bx+di+0x6e]
000021BB  5F                pop di
000021BC  5F                pop di
000021BD  646C              fs insb
000021BF  5F                pop di
000021C0  7265              jc 0x2227
000021C2  6C                insb
000021C3  6F                outsw
000021C4  636174            arpl [bx+di+0x74],sp
000021C7  655F              gs pop di
000021C9  7374              jnc 0x223f
000021CB  61                popa
000021CC  7469              jz 0x2237
000021CE  635F70            arpl [bx+0x70],bx
000021D1  69652E7374        imul sp,[di+0x2e],word 0x7473
000021D6  61                popa
000021D7  7274              jc 0x224d
000021D9  002E616E          add [0x6e61],ch
000021DD  6E                outsb
000021DE  6F                outsw
000021DF  62696E            bound bp,[bx+di+0x6e]
000021E2  5F                pop di
000021E3  5F                pop di
000021E4  646C              fs insb
000021E6  5F                pop di
000021E7  7265              jc 0x224e
000021E9  6C                insb
000021EA  6F                outsw
000021EB  636174            arpl [bx+di+0x74],sp
000021EE  655F              gs pop di
000021F0  7374              jnc 0x2266
000021F2  61                popa
000021F3  7469              jz 0x225e
000021F5  635F70            arpl [bx+0x70],bx
000021F8  69652E656E        imul sp,[di+0x2e],word 0x6e65
000021FD  6400656C          add [fs:di+0x6c],ah
00002201  662D696E6974      sub eax,0x74696e69
00002207  2E6F              cs outsw
00002209  53                push bx
0000220A  002E616E          add [0x6e61],ch
0000220E  6E                outsb
0000220F  6F                outsw
00002210  62696E            bound bp,[bx+di+0x6e]
00002213  5F                pop di
00002214  656C              gs insb
00002216  665F              pop edi
00002218  696E69742E        imul bp,[bp+0x69],word 0x2e74
0000221D  6300              arpl [bx+si],ax
0000221F  2E61              cs popa
00002221  6E                outsb
00002222  6E                outsb
00002223  6F                outsw
00002224  62696E            bound bp,[bx+di+0x6e]
00002227  5F                pop di
00002228  656C              gs insb
0000222A  665F              pop edi
0000222C  696E69742E        imul bp,[bp+0x69],word 0x2e74
00002231  635F65            arpl [bx+0x65],bx
00002234  6E                outsb
00002235  64002E616E        add [fs:0x6e61],ch
0000223A  6E                outsb
0000223B  6F                outsw
0000223C  62696E            bound bp,[bx+di+0x6e]
0000223F  5F                pop di
00002240  656C              gs insb
00002242  665F              pop edi
00002244  696E69742E        imul bp,[bp+0x69],word 0x2e74
00002249  632E686F          arpl [0x6f68],bp
0000224D  7400              jz 0x224f
0000224F  2E61              cs popa
00002251  6E                outsb
00002252  6E                outsb
00002253  6F                outsw
00002254  62696E            bound bp,[bx+di+0x6e]
00002257  5F                pop di
00002258  656C              gs insb
0000225A  665F              pop edi
0000225C  696E69742E        imul bp,[bp+0x69],word 0x2e74
00002261  635F65            arpl [bx+0x65],bx
00002264  6E                outsb
00002265  642E686F74        cs push word 0x746f
0000226A  002E616E          add [0x6e61],ch
0000226E  6E                outsb
0000226F  6F                outsw
00002270  62696E            bound bp,[bx+di+0x6e]
00002273  5F                pop di
00002274  656C              gs insb
00002276  665F              pop edi
00002278  696E69742E        imul bp,[bp+0x69],word 0x2e74
0000227D  632E756E          arpl [0x6e75],bp
00002281  6C                insb
00002282  696B656C79        imul bp,[bp+di+0x65],word 0x796c
00002287  002E616E          add [0x6e61],ch
0000228B  6E                outsb
0000228C  6F                outsw
0000228D  62696E            bound bp,[bx+di+0x6e]
00002290  5F                pop di
00002291  656C              gs insb
00002293  665F              pop edi
00002295  696E69742E        imul bp,[bp+0x69],word 0x2e74
0000229A  635F65            arpl [bx+0x65],bx
0000229D  6E                outsb
0000229E  642E756E          cs jnz 0x2310
000022A2  6C                insb
000022A3  696B656C79        imul bp,[bp+di+0x65],word 0x796c
000022A8  002E616E          add [0x6e61],ch
000022AC  6E                outsb
000022AD  6F                outsw
000022AE  62696E            bound bp,[bx+di+0x6e]
000022B1  5F                pop di
000022B2  656C              gs insb
000022B4  665F              pop edi
000022B6  696E69742E        imul bp,[bp+0x69],word 0x2e74
000022BB  632E7374          arpl [0x7473],bp
000022BF  61                popa
000022C0  7274              jc 0x2336
000022C2  7570              jnz 0x2334
000022C4  002E616E          add [0x6e61],ch
000022C8  6E                outsb
000022C9  6F                outsw
000022CA  62696E            bound bp,[bx+di+0x6e]
000022CD  5F                pop di
000022CE  656C              gs insb
000022D0  665F              pop edi
000022D2  696E69742E        imul bp,[bp+0x69],word 0x2e74
000022D7  635F65            arpl [bx+0x65],bx
000022DA  6E                outsb
000022DB  642E7374          cs jnc 0x2353
000022DF  61                popa
000022E0  7274              jc 0x2356
000022E2  7570              jnz 0x2354
000022E4  002E616E          add [0x6e61],ch
000022E8  6E                outsb
000022E9  6F                outsw
000022EA  62696E            bound bp,[bx+di+0x6e]
000022ED  5F                pop di
000022EE  656C              gs insb
000022F0  665F              pop edi
000022F2  696E69742E        imul bp,[bp+0x69],word 0x2e74
000022F7  632E6578          arpl [0x7865],bp
000022FB  6974002E61        imul si,[si+0x0],word 0x612e
00002300  6E                outsb
00002301  6E                outsb
00002302  6F                outsw
00002303  62696E            bound bp,[bx+di+0x6e]
00002306  5F                pop di
00002307  656C              gs insb
00002309  665F              pop edi
0000230B  696E69742E        imul bp,[bp+0x69],word 0x2e74
00002310  635F65            arpl [bx+0x65],bx
00002313  6E                outsb
00002314  642E657869        gs js 0x2382
00002319  7400              jz 0x231b
0000231B  2E61              cs popa
0000231D  6E                outsb
0000231E  6E                outsb
0000231F  6F                outsw
00002320  62696E            bound bp,[bx+di+0x6e]
00002323  5F                pop di
00002324  5F                pop di
00002325  5F                pop di
00002326  6C                insb
00002327  6962635F63        imul sp,[bp+si+0x63],word 0x635f
0000232C  7375              jnc 0x23a3
0000232E  5F                pop di
0000232F  696E69742E        imul bp,[bp+0x69],word 0x2e74
00002334  7374              jnc 0x23aa
00002336  61                popa
00002337  7274              jc 0x23ad
00002339  002E616E          add [0x6e61],ch
0000233D  6E                outsb
0000233E  6F                outsw
0000233F  62696E            bound bp,[bx+di+0x6e]
00002342  5F                pop di
00002343  5F                pop di
00002344  5F                pop di
00002345  6C                insb
00002346  6962635F63        imul sp,[bp+si+0x63],word 0x635f
0000234B  7375              jnc 0x23c2
0000234D  5F                pop di
0000234E  696E69742E        imul bp,[bp+0x69],word 0x2e74
00002353  656E              gs outsb
00002355  64002E616E        add [fs:0x6e61],ch
0000235A  6E                outsb
0000235B  6F                outsw
0000235C  62696E            bound bp,[bx+di+0x6e]
0000235F  5F                pop di
00002360  5F                pop di
00002361  5F                pop di
00002362  6C                insb
00002363  6962635F63        imul sp,[bp+si+0x63],word 0x635f
00002368  7375              jnc 0x23df
0000236A  5F                pop di
0000236B  66696E692E737461  imul ebp,[bp+0x69],dword 0x6174732e
00002373  7274              jc 0x23e9
00002375  002E616E          add [0x6e61],ch
00002379  6E                outsb
0000237A  6F                outsw
0000237B  62696E            bound bp,[bx+di+0x6e]
0000237E  5F                pop di
0000237F  5F                pop di
00002380  5F                pop di
00002381  6C                insb
00002382  6962635F63        imul sp,[bp+si+0x63],word 0x635f
00002387  7375              jnc 0x23fe
00002389  5F                pop di
0000238A  66696E692E656E64  imul ebp,[bp+0x69],dword 0x646e652e
00002392  006372            add [bp+di+0x72],ah
00002395  7473              jz 0x240a
00002397  7475              jz 0x240e
00002399  66662E6300        o32 arpl [cs:bx+si],ax
0000239E  64657265          gs jc 0x2407
000023A2  676973746572      imul si,[ebx+0x74],word 0x7265
000023A8  5F                pop di
000023A9  746D              jz 0x2418
000023AB  5F                pop di
000023AC  636C6F            arpl [si+0x6f],bp
000023AF  6E                outsb
000023B0  657300            gs jnc 0x23b3
000023B3  5F                pop di
000023B4  5F                pop di
000023B5  646F              fs outsw
000023B7  5F                pop di
000023B8  676C              a32 insb
000023BA  6F                outsw
000023BB  62616C            bound sp,[bx+di+0x6c]
000023BE  5F                pop di
000023BF  64746F            fs jz 0x2431
000023C2  7273              jc 0x2437
000023C4  5F                pop di
000023C5  61                popa
000023C6  7578              jnz 0x2440
000023C8  00636F            add [bp+di+0x6f],ah
000023CB  6D                insw
000023CC  706C              jo 0x243a
000023CE  657465            gs jz 0x2436
000023D1  642E37            cs aaa
000023D4  3139              xor [bx+di],di
000023D6  3900              cmp [bx+si],ax
000023D8  5F                pop di
000023D9  5F                pop di
000023DA  646F              fs outsw
000023DC  5F                pop di
000023DD  676C              a32 insb
000023DF  6F                outsw
000023E0  62616C            bound sp,[bx+di+0x6c]
000023E3  5F                pop di
000023E4  64746F            fs jz 0x2456
000023E7  7273              jc 0x245c
000023E9  5F                pop di
000023EA  61                popa
000023EB  7578              jnz 0x2465
000023ED  5F                pop di
000023EE  66696E695F617272  imul ebp,[bp+0x69],dword 0x7272615f
000023F6  61                popa
000023F7  795F              jns 0x2458
000023F9  656E              gs outsb
000023FB  7472              jz 0x246f
000023FD  7900              jns 0x23ff
000023FF  667261            o32 jc 0x2463
00002402  6D                insw
00002403  655F              gs pop di
00002405  64756D            fs jnz 0x2475
00002408  6D                insw
00002409  7900              jns 0x240b
0000240B  5F                pop di
0000240C  5F                pop di
0000240D  667261            o32 jc 0x2471
00002410  6D                insw
00002411  655F              gs pop di
00002413  64756D            fs jnz 0x2483
00002416  6D                insw
00002417  795F              jns 0x2478
00002419  696E69745F        imul bp,[bp+0x69],word 0x5f74
0000241E  61                popa
0000241F  7272              jc 0x2493
00002421  61                popa
00002422  795F              jns 0x2483
00002424  656E              gs outsb
00002426  7472              jz 0x249a
00002428  7900              jns 0x242a
0000242A  7465              jz 0x2491
0000242C  7374              jnc 0x24a2
0000242E  2E6300            arpl [cs:bx+si],ax
00002431  646973705F73      imul si,[fs:bp+di+0x70],word 0x735f
00002437  7472              jz 0x24ab
00002439  2E61              cs popa
0000243B  736D              jnc 0x24aa
0000243D  006469            add [si+0x69],ah
00002440  7370              jnc 0x24b2
00002442  5F                pop di
00002443  7374              jnc 0x24b9
00002445  725F              jc 0x24a6
00002447  636F6C            arpl [bx+0x6c],bp
0000244A  6F                outsw
0000244B  7572              jnz 0x24bf
0000244D  2E3100            xor [cs:bx+si],ax
00002450  646973705F73      imul si,[fs:bp+di+0x70],word 0x735f
00002456  7472              jz 0x24ca
00002458  5F                pop di
00002459  636F6C            arpl [bx+0x6c],bp
0000245C  6F                outsw
0000245D  7572              jnz 0x24d1
0000245F  2E3300            xor ax,[cs:bx+si]
00002462  646973705F73      imul si,[fs:bp+di+0x70],word 0x735f
00002468  7472              jz 0x24dc
0000246A  5F                pop di
0000246B  636F6C            arpl [bx+0x6c],bp
0000246E  6F                outsw
0000246F  7572              jnz 0x24e3
00002471  2E3400            cs xor al,0x0
00002474  5F                pop di
00002475  5F                pop di
00002476  46                inc si
00002477  52                push dx
00002478  41                inc cx
00002479  4D                dec bp
0000247A  45                inc bp
0000247B  5F                pop di
0000247C  45                inc bp
0000247D  4E                dec si
0000247E  44                inc sp
0000247F  5F                pop di
00002480  5F                pop di
00002481  005F5F            add [bx+0x5f],bl
00002484  696E69745F        imul bp,[bp+0x69],word 0x5f74
00002489  61                popa
0000248A  7272              jc 0x24fe
0000248C  61                popa
0000248D  795F              jns 0x24ee
0000248F  656E              gs outsb
00002491  64005F44          add [fs:bx+0x44],bl
00002495  59                pop cx
00002496  4E                dec si
00002497  41                inc cx
00002498  4D                dec bp
00002499  49                dec cx
0000249A  43                inc bx
0000249B  005F5F            add [bx+0x5f],bl
0000249E  696E69745F        imul bp,[bp+0x69],word 0x5f74
000024A3  61                popa
000024A4  7272              jc 0x2518
000024A6  61                popa
000024A7  795F              jns 0x2508
000024A9  7374              jnc 0x251f
000024AB  61                popa
000024AC  7274              jc 0x2522
000024AE  005F5F            add [bx+0x5f],bl
000024B1  47                inc di
000024B2  4E                dec si
000024B3  55                push bp
000024B4  5F                pop di
000024B5  45                inc bp
000024B6  48                dec ax
000024B7  5F                pop di
000024B8  46                inc si
000024B9  52                push dx
000024BA  41                inc cx
000024BB  4D                dec bp
000024BC  45                inc bp
000024BD  5F                pop di
000024BE  48                dec ax
000024BF  44                inc sp
000024C0  52                push dx
000024C1  005F47            add [bx+0x47],bl
000024C4  4C                dec sp
000024C5  4F                dec di
000024C6  42                inc dx
000024C7  41                inc cx
000024C8  4C                dec sp
000024C9  5F                pop di
000024CA  4F                dec di
000024CB  46                inc si
000024CC  46                inc si
000024CD  53                push bx
000024CE  45                inc bp
000024CF  54                push sp
000024D0  5F                pop di
000024D1  54                push sp
000024D2  41                inc cx
000024D3  42                inc dx
000024D4  4C                dec sp
000024D5  45                inc bp
000024D6  5F                pop di
000024D7  005F5F            add [bx+0x5f],bl
000024DA  6C                insb
000024DB  6962635F63        imul sp,[bp+si+0x63],word 0x635f
000024E0  7375              jnc 0x2557
000024E2  5F                pop di
000024E3  66696E69005F4954  imul ebp,[bp+0x69],dword 0x54495f00
000024EB  4D                dec bp
000024EC  5F                pop di
000024ED  64657265          gs jc 0x2556
000024F1  676973746572      imul si,[ebx+0x74],word 0x7265
000024F7  54                push sp
000024F8  4D                dec bp
000024F9  43                inc bx
000024FA  6C                insb
000024FB  6F                outsw
000024FC  6E                outsb
000024FD  6554              gs push sp
000024FF  61                popa
00002500  626C65            bound bp,[si+0x65]
00002503  005F5F            add [bx+0x5f],bl
00002506  7838              js 0x2540
00002508  362E6765745F      gs jz 0x256d
0000250E  7063              jo 0x2573
00002510  5F                pop di
00002511  7468              jz 0x257b
00002513  756E              jnz 0x2583
00002515  6B2E627800        imul bp,[0x7862],byte +0x0
0000251A  6469735F706F      imul si,[fs:bp+di+0x5f],word 0x6f70
00002520  7300              jnc 0x2522
00002522  5F                pop di
00002523  656461            fs popa
00002526  7461              jz 0x2589
00002528  005F5F            add [bx+0x5f],bl
0000252B  7838              js 0x2565
0000252D  362E6765745F      gs jz 0x2592
00002533  7063              jo 0x2598
00002535  5F                pop di
00002536  7468              jz 0x25a0
00002538  756E              jnz 0x25a8
0000253A  6B2E647800        imul bp,[0x7864],byte +0x0
0000253F  5F                pop di
00002540  5F                pop di
00002541  6461              fs popa
00002543  7461              jz 0x25a6
00002545  5F                pop di
00002546  7374              jnc 0x25bc
00002548  61                popa
00002549  7274              jc 0x25bf
0000254B  005F5F            add [bx+0x5f],bl
0000254E  676D              a32 insw
00002550  6F                outsw
00002551  6E                outsb
00002552  5F                pop di
00002553  7374              jnc 0x25c9
00002555  61                popa
00002556  7274              jc 0x25cc
00002558  5F                pop di
00002559  5F                pop di
0000255A  005F5F            add [bx+0x5f],bl
0000255D  64736F            fs jnc 0x25cf
00002560  5F                pop di
00002561  68616E            push word 0x6e61
00002564  646C              fs insb
00002566  65005F49          add [gs:bx+0x49],bl
0000256A  4F                dec di
0000256B  5F                pop di
0000256C  7374              jnc 0x25e2
0000256E  64696E5F7573      imul bp,[fs:bp+0x5f],word 0x7375
00002574  6564005F5F        add [fs:bx+0x5f],bl
00002579  6C                insb
0000257A  6962635F73        imul sp,[bp+si+0x63],word 0x735f
0000257F  7461              jz 0x25e2
00002581  7274              jc 0x25f7
00002583  5F                pop di
00002584  6D                insw
00002585  61                popa
00002586  696E404047        imul bp,[bp+0x40],word 0x4740
0000258B  4C                dec sp
0000258C  49                dec cx
0000258D  42                inc dx
0000258E  43                inc bx
0000258F  5F                pop di
00002590  322E3000          xor ch,[0x30]
00002594  5F                pop di
00002595  5F                pop di
00002596  6C                insb
00002597  6962635F63        imul sp,[bp+si+0x63],word 0x635f
0000259C  7375              jnc 0x2613
0000259E  5F                pop di
0000259F  696E697400        imul bp,[bp+0x69],word 0x74
000025A4  5F                pop di
000025A5  646C              fs insb
000025A7  5F                pop di
000025A8  7265              jc 0x260f
000025AA  6C                insb
000025AB  6F                outsw
000025AC  636174            arpl [bx+di+0x74],sp
000025AF  655F              gs pop di
000025B1  7374              jnc 0x2627
000025B3  61                popa
000025B4  7469              jz 0x261f
000025B6  635F70            arpl [bx+0x70],bx
000025B9  6965005F66        imul sp,[di+0x0],word 0x665f
000025BE  705F              jo 0x261f
000025C0  687700            push word 0x77
000025C3  5F                pop di
000025C4  5F                pop di
000025C5  627373            bound si,[bp+di+0x73]
000025C8  5F                pop di
000025C9  7374              jnc 0x263f
000025CB  61                popa
000025CC  7274              jc 0x2642
000025CE  006D61            add [di+0x61],ch
000025D1  696E005F5F        imul bp,[bp+0x0],word 0x5f5f
000025D6  54                push sp
000025D7  4D                dec bp
000025D8  43                inc bx
000025D9  5F                pop di
000025DA  45                inc bp
000025DB  4E                dec si
000025DC  44                inc sp
000025DD  5F                pop di
000025DE  5F                pop di
000025DF  005F49            add [bx+0x49],bl
000025E2  54                push sp
000025E3  4D                dec bp
000025E4  5F                pop di
000025E5  7265              jc 0x264c
000025E7  676973746572      imul si,[ebx+0x74],word 0x7265
000025ED  54                push sp
000025EE  4D                dec bp
000025EF  43                inc bx
000025F0  6C                insb
000025F1  6F                outsw
000025F2  6E                outsb
000025F3  6554              gs push sp
000025F5  61                popa
000025F6  626C65            bound bp,[si+0x65]
000025F9  006469            add [si+0x69],ah
000025FC  7370              jnc 0x266e
000025FE  5F                pop di
000025FF  7374              jnc 0x2675
00002601  725F              jc 0x2662
00002603  636F6C            arpl [bx+0x6c],bp
00002606  6F                outsw
00002607  7572              jnz 0x267b
00002609  0000              add [bx+si],al
0000260B  2E7379            cs jnc 0x2687
0000260E  6D                insw
0000260F  7461              jz 0x2672
00002611  6200              bound ax,[bx+si]
00002613  2E7374            cs jnc 0x268a
00002616  7274              jc 0x268c
00002618  61                popa
00002619  6200              bound ax,[bx+si]
0000261B  2E7368            cs jnc 0x2686
0000261E  7374              jnc 0x2694
00002620  7274              jc 0x2696
00002622  61                popa
00002623  6200              bound ax,[bx+si]
00002625  2E696E746572      imul bp,[cs:bp+0x74],word 0x7265
0000262B  7000              jo 0x262d
0000262D  2E6E              cs outsb
0000262F  6F                outsw
00002630  7465              jz 0x2697
00002632  2E41              cs inc cx
00002634  42                inc dx
00002635  49                dec cx
00002636  2D7461            sub ax,0x6174
00002639  67002E            add [esi],ch
0000263C  6E                outsb
0000263D  6F                outsw
0000263E  7465              jz 0x26a5
00002640  2E676E            cs a32 outsb
00002643  752E              jnz 0x2673
00002645  627569            bound si,[di+0x69]
00002648  6C                insb
00002649  642D6964          fs sub ax,0x6469
0000264D  002E676E          add [0x6e67],ch
00002651  752E              jnz 0x2681
00002653  686173            push word 0x7361
00002656  68002E            push word 0x2e00
00002659  64796E            fs jns 0x26ca
0000265C  7379              jnc 0x26d7
0000265E  6D                insw
0000265F  002E6479          add [0x7964],ch
00002663  6E                outsb
00002664  7374              jnc 0x26da
00002666  7200              jc 0x2668
00002668  2E676E            cs a32 outsb
0000266B  752E              jnz 0x269b
0000266D  7665              jna 0x26d4
0000266F  7273              jc 0x26e4
00002671  696F6E002E        imul bp,[bx+0x6e],word 0x2e00
00002676  676E              a32 outsb
00002678  752E              jnz 0x26a8
0000267A  7665              jna 0x26e1
0000267C  7273              jc 0x26f1
0000267E  696F6E5F72        imul bp,[bx+0x6e],word 0x725f
00002683  002E7265          add [0x6572],ch
00002687  6C                insb
00002688  2E64796E          fs jns 0x26fa
0000268C  002E7265          add [0x6572],ch
00002690  6C                insb
00002691  2E706C            cs jo 0x2700
00002694  7400              jz 0x2696
00002696  2E696E697400      imul bp,[cs:bp+0x69],word 0x74
0000269C  2E7465            cs jz 0x2704
0000269F  7874              js 0x2715
000026A1  002E6669          add [0x6966],ch
000026A5  6E                outsb
000026A6  69002E72          imul ax,[bx+si],word 0x722e
000026AA  6F                outsw
000026AB  6461              fs popa
000026AD  7461              jz 0x2710
000026AF  002E6568          add [0x6865],ch
000026B3  5F                pop di
000026B4  667261            o32 jc 0x2718
000026B7  6D                insw
000026B8  655F              gs pop di
000026BA  686472            push word 0x7264
000026BD  002E6568          add [0x6865],ch
000026C1  5F                pop di
000026C2  667261            o32 jc 0x2726
000026C5  6D                insw
000026C6  65002E696E        add [gs:0x6e69],ch
000026CB  69745F6172        imul si,[si+0x5f],word 0x7261
000026D0  7261              jc 0x2733
000026D2  7900              jns 0x26d4
000026D4  2E66696E695F6172  imul ebp,[cs:bp+0x69],dword 0x7272615f
         -72
000026DD  61                popa
000026DE  7900              jns 0x26e0
000026E0  2E64796E          fs jns 0x2752
000026E4  61                popa
000026E5  6D                insw
000026E6  6963002E67        imul sp,[bp+di+0x0],word 0x672e
000026EB  6F                outsw
000026EC  7400              jz 0x26ee
000026EE  2E676F            cs a32 outsw
000026F1  742E              jz 0x2721
000026F3  706C              jo 0x2761
000026F5  7400              jz 0x26f7
000026F7  2E6461            fs popa
000026FA  7461              jz 0x275d
000026FC  002E6273          add [0x7362],ch
00002700  7300              jnc 0x2702
00002702  2E636F6D          arpl [cs:bx+0x6d],bp
00002706  6D                insw
00002707  656E              gs outsb
00002709  7400              jz 0x270b
0000270B  2E676E            cs a32 outsb
0000270E  752E              jnz 0x273e
00002710  627569            bound si,[di+0x69]
00002713  6C                insb
00002714  642E61            cs popa
00002717  7474              jz 0x278d
00002719  7269              jc 0x2784
0000271B  627574            bound si,[di+0x74]
0000271E  657300            gs jnc 0x2721
00002721  0000              add [bx+si],al
00002723  0000              add [bx+si],al
00002725  0000              add [bx+si],al
00002727  0000              add [bx+si],al
00002729  0000              add [bx+si],al
0000272B  0000              add [bx+si],al
0000272D  0000              add [bx+si],al
0000272F  0000              add [bx+si],al
00002731  0000              add [bx+si],al
00002733  0000              add [bx+si],al
00002735  0000              add [bx+si],al
00002737  0000              add [bx+si],al
00002739  0000              add [bx+si],al
0000273B  0000              add [bx+si],al
0000273D  0000              add [bx+si],al
0000273F  0000              add [bx+si],al
00002741  0000              add [bx+si],al
00002743  0000              add [bx+si],al
00002745  0000              add [bx+si],al
00002747  0000              add [bx+si],al
00002749  0000              add [bx+si],al
0000274B  001B              add [bp+di],bl
0000274D  0000              add [bx+si],al
0000274F  0001              add [bx+di],al
00002751  0000              add [bx+si],al
00002753  0002              add [bp+si],al
00002755  0000              add [bx+si],al
00002757  005481            add [si-0x7f],dl
0000275A  0408              add al,0x8
0000275C  54                push sp
0000275D  0100              add [bx+si],ax
0000275F  0013              add [bp+di],dl
00002761  0000              add [bx+si],al
00002763  0000              add [bx+si],al
00002765  0000              add [bx+si],al
00002767  0000              add [bx+si],al
00002769  0000              add [bx+si],al
0000276B  0001              add [bx+di],al
0000276D  0000              add [bx+si],al
0000276F  0000              add [bx+si],al
00002771  0000              add [bx+si],al
00002773  0023              add [bp+di],ah
00002775  0000              add [bx+si],al
00002777  0007              add [bx],al
00002779  0000              add [bx+si],al
0000277B  0002              add [bp+si],al
0000277D  0000              add [bx+si],al
0000277F  006881            add [bx+si-0x7f],ch
00002782  0408              add al,0x8
00002784  680100            push word 0x1
00002787  0020              add [bx+si],ah
00002789  0000              add [bx+si],al
0000278B  0000              add [bx+si],al
0000278D  0000              add [bx+si],al
0000278F  0000              add [bx+si],al
00002791  0000              add [bx+si],al
00002793  0004              add [si],al
00002795  0000              add [bx+si],al
00002797  0000              add [bx+si],al
00002799  0000              add [bx+si],al
0000279B  0031              add [bx+di],dh
0000279D  0000              add [bx+si],al
0000279F  0007              add [bx],al
000027A1  0000              add [bx+si],al
000027A3  0002              add [bp+si],al
000027A5  0000              add [bx+si],al
000027A7  00888104          add [bx+si+0x481],cl
000027AB  08880100          or [bx+si+0x1],cl
000027AF  0024              add [si],ah
000027B1  0000              add [bx+si],al
000027B3  0000              add [bx+si],al
000027B5  0000              add [bx+si],al
000027B7  0000              add [bx+si],al
000027B9  0000              add [bx+si],al
000027BB  0004              add [si],al
000027BD  0000              add [bx+si],al
000027BF  0000              add [bx+si],al
000027C1  0000              add [bx+si],al
000027C3  004400            add [si+0x0],al
000027C6  0000              add [bx+si],al
000027C8  F6FF              idiv bh
000027CA  FF6F02            jmp far [bx+0x2]
000027CD  0000              add [bx+si],al
000027CF  00AC8104          add [si+0x481],ch
000027D3  08AC0100          or [si+0x1],ch
000027D7  0020              add [bx+si],ah
000027D9  0000              add [bx+si],al
000027DB  0005              add [di],al
000027DD  0000              add [bx+si],al
000027DF  0000              add [bx+si],al
000027E1  0000              add [bx+si],al
000027E3  0004              add [si],al
000027E5  0000              add [bx+si],al
000027E7  0004              add [si],al
000027E9  0000              add [bx+si],al
000027EB  004E00            add [bp+0x0],cl
000027EE  0000              add [bx+si],al
000027F0  0B00              or ax,[bx+si]
000027F2  0000              add [bx+si],al
000027F4  0200              add al,[bx+si]
000027F6  0000              add [bx+si],al
000027F8  CC                int3
000027F9  810408CC          add word [si],0xcc08
000027FD  0100              add [bx+si],ax
000027FF  006000            add [bx+si+0x0],ah
00002802  0000              add [bx+si],al
00002804  06                push es
00002805  0000              add [bx+si],al
00002807  0001              add [bx+di],al
00002809  0000              add [bx+si],al
0000280B  0004              add [si],al
0000280D  0000              add [bx+si],al
0000280F  0010              add [bx+si],dl
00002811  0000              add [bx+si],al
00002813  005600            add [bp+0x0],dl
00002816  0000              add [bx+si],al
00002818  0300              add ax,[bx+si]
0000281A  0000              add [bx+si],al
0000281C  0200              add al,[bx+si]
0000281E  0000              add [bx+si],al
00002820  2C82              sub al,0x82
00002822  0408              add al,0x8
00002824  2C02              sub al,0x2
00002826  0000              add [bx+si],al
00002828  7B00              jpo 0x282a
0000282A  0000              add [bx+si],al
0000282C  0000              add [bx+si],al
0000282E  0000              add [bx+si],al
00002830  0000              add [bx+si],al
00002832  0000              add [bx+si],al
00002834  0100              add [bx+si],ax
00002836  0000              add [bx+si],al
00002838  0000              add [bx+si],al
0000283A  0000              add [bx+si],al
0000283C  5E                pop si
0000283D  0000              add [bx+si],al
0000283F  00FF              add bh,bh
00002841  FF                db 0xff
00002842  FF6F02            jmp far [bx+0x2]
00002845  0000              add [bx+si],al
00002847  00A88204          add [bx+si+0x482],ch
0000284B  08A80200          or [bx+si+0x2],ch
0000284F  000C              add [si],cl
00002851  0000              add [bx+si],al
00002853  0005              add [di],al
00002855  0000              add [bx+si],al
00002857  0000              add [bx+si],al
00002859  0000              add [bx+si],al
0000285B  0002              add [bp+si],al
0000285D  0000              add [bx+si],al
0000285F  0002              add [bp+si],al
00002861  0000              add [bx+si],al
00002863  006B00            add [bp+di+0x0],ch
00002866  0000              add [bx+si],al
00002868  FE                db 0xfe
00002869  FF                db 0xff
0000286A  FF6F02            jmp far [bx+0x2]
0000286D  0000              add [bx+si],al
0000286F  00B48204          add [si+0x482],dh
00002873  08B40200          or [si+0x2],dh
00002877  0020              add [bx+si],ah
00002879  0000              add [bx+si],al
0000287B  00060000          add [0x0],al
0000287F  0001              add [bx+di],al
00002881  0000              add [bx+si],al
00002883  0004              add [si],al
00002885  0000              add [bx+si],al
00002887  0000              add [bx+si],al
00002889  0000              add [bx+si],al
0000288B  007A00            add [bp+si+0x0],bh
0000288E  0000              add [bx+si],al
00002890  0900              or [bx+si],ax
00002892  0000              add [bx+si],al
00002894  0200              add al,[bx+si]
00002896  0000              add [bx+si],al
00002898  D482              aam 0x82
0000289A  0408              add al,0x8
0000289C  D402              aam 0x2
0000289E  0000              add [bx+si],al
000028A0  1800              sbb [bx+si],al
000028A2  0000              add [bx+si],al
000028A4  050000            add ax,0x0
000028A7  0000              add [bx+si],al
000028A9  0000              add [bx+si],al
000028AB  0004              add [si],al
000028AD  0000              add [bx+si],al
000028AF  0008              add [bx+si],cl
000028B1  0000              add [bx+si],al
000028B3  00830000          add [bp+di+0x0],al
000028B7  0009              add [bx+di],cl
000028B9  0000              add [bx+si],al
000028BB  004200            add [bp+si+0x0],al
000028BE  0000              add [bx+si],al
000028C0  EC                in al,dx
000028C1  82                db 0x82
000028C2  0408              add al,0x8
000028C4  EC                in al,dx
000028C5  0200              add al,[bx+si]
000028C7  0008              add [bx+si],cl
000028C9  0000              add [bx+si],al
000028CB  0005              add [di],al
000028CD  0000              add [bx+si],al
000028CF  00160000          add [0x0],dl
000028D3  0004              add [si],al
000028D5  0000              add [bx+si],al
000028D7  0008              add [bx+si],cl
000028D9  0000              add [bx+si],al
000028DB  008C0000          add [si+0x0],cl
000028DF  0001              add [bx+di],al
000028E1  0000              add [bx+si],al
000028E3  00060000          add [0x0],al
000028E7  00F4              add ah,dh
000028E9  82                db 0x82
000028EA  0408              add al,0x8
000028EC  F4                hlt
000028ED  0200              add al,[bx+si]
000028EF  0024              add [si],ah
000028F1  0000              add [bx+si],al
000028F3  0000              add [bx+si],al
000028F5  0000              add [bx+si],al
000028F7  0000              add [bx+si],al
000028F9  0000              add [bx+si],al
000028FB  0004              add [si],al
000028FD  0000              add [bx+si],al
000028FF  0000              add [bx+si],al
00002901  0000              add [bx+si],al
00002903  00870000          add [bx+0x0],al
00002907  0001              add [bx+di],al
00002909  0000              add [bx+si],al
0000290B  00060000          add [0x0],al
0000290F  0020              add [bx+si],ah
00002911  830408            add word [si],byte +0x8
00002914  2003              and [bp+di],al
00002916  0000              add [bx+si],al
00002918  2000              and [bx+si],al
0000291A  0000              add [bx+si],al
0000291C  0000              add [bx+si],al
0000291E  0000              add [bx+si],al
00002920  0000              add [bx+si],al
00002922  0000              add [bx+si],al
00002924  1000              adc [bx+si],al
00002926  0000              add [bx+si],al
00002928  0400              add al,0x0
0000292A  0000              add [bx+si],al
0000292C  92                xchg ax,dx
0000292D  0000              add [bx+si],al
0000292F  0001              add [bx+di],al
00002931  0000              add [bx+si],al
00002933  00060000          add [0x0],al
00002937  004083            add [bx+si-0x7d],al
0000293A  0408              add al,0x8
0000293C  40                inc ax
0000293D  0300              add ax,[bx+si]
0000293F  0035              add [di],dh
00002941  0200              add al,[bx+si]
00002943  0000              add [bx+si],al
00002945  0000              add [bx+si],al
00002947  0000              add [bx+si],al
00002949  0000              add [bx+si],al
0000294B  0010              add [bx+si],dl
0000294D  0000              add [bx+si],al
0000294F  0000              add [bx+si],al
00002951  0000              add [bx+si],al
00002953  00980000          add [bx+si+0x0],bl
00002957  0001              add [bx+di],al
00002959  0000              add [bx+si],al
0000295B  00060000          add [0x0],al
0000295F  007885            add [bx+si-0x7b],bh
00002962  0408              add al,0x8
00002964  7805              js 0x296b
00002966  0000              add [bx+si],al
00002968  1800              sbb [bx+si],al
0000296A  0000              add [bx+si],al
0000296C  0000              add [bx+si],al
0000296E  0000              add [bx+si],al
00002970  0000              add [bx+si],al
00002972  0000              add [bx+si],al
00002974  0400              add al,0x0
00002976  0000              add [bx+si],al
00002978  0000              add [bx+si],al
0000297A  0000              add [bx+si],al
0000297C  9E                sahf
0000297D  0000              add [bx+si],al
0000297F  0001              add [bx+di],al
00002981  0000              add [bx+si],al
00002983  0002              add [bp+si],al
00002985  0000              add [bx+si],al
00002987  00908504          add [bx+si+0x485],dl
0000298B  08900500          or [bx+si+0x5],dl
0000298F  000F              add [bx],cl
00002991  0000              add [bx+si],al
00002993  0000              add [bx+si],al
00002995  0000              add [bx+si],al
00002997  0000              add [bx+si],al
00002999  0000              add [bx+si],al
0000299B  0004              add [si],al
0000299D  0000              add [bx+si],al
0000299F  0000              add [bx+si],al
000029A1  0000              add [bx+si],al
000029A3  00A60000          add [bp+0x0],ah
000029A7  0001              add [bx+di],al
000029A9  0000              add [bx+si],al
000029AB  0002              add [bp+si],al
000029AD  0000              add [bx+si],al
000029AF  00A08504          add [bx+si+0x485],ah
000029B3  08A00500          or [bx+si+0x5],ah
000029B7  003C              add [si],bh
000029B9  0000              add [bx+si],al
000029BB  0000              add [bx+si],al
000029BD  0000              add [bx+si],al
000029BF  0000              add [bx+si],al
000029C1  0000              add [bx+si],al
000029C3  0004              add [si],al
000029C5  0000              add [bx+si],al
000029C7  0000              add [bx+si],al
000029C9  0000              add [bx+si],al
000029CB  00B40000          add [si+0x0],dh
000029CF  0001              add [bx+di],al
000029D1  0000              add [bx+si],al
000029D3  0002              add [bp+si],al
000029D5  0000              add [bx+si],al
000029D7  00DC              add ah,bl
000029D9  8504              test [si],ax
000029DB  08DC              or ah,bl
000029DD  050000            add ax,0x0
000029E0  F4                hlt
000029E1  0000              add [bx+si],al
000029E3  0000              add [bx+si],al
000029E5  0000              add [bx+si],al
000029E7  0000              add [bx+si],al
000029E9  0000              add [bx+si],al
000029EB  0004              add [si],al
000029ED  0000              add [bx+si],al
000029EF  0000              add [bx+si],al
000029F1  0000              add [bx+si],al
000029F3  00BE0000          add [bp+0x0],bh
000029F7  000E0000          add [0x0],cl
000029FB  0003              add [bp+di],al
000029FD  0000              add [bx+si],al
000029FF  0004              add [si],al
00002A01  9F                lahf
00002A02  0408              add al,0x8
00002A04  040F              add al,0xf
00002A06  0000              add [bx+si],al
00002A08  0400              add al,0x0
00002A0A  0000              add [bx+si],al
00002A0C  0000              add [bx+si],al
00002A0E  0000              add [bx+si],al
00002A10  0000              add [bx+si],al
00002A12  0000              add [bx+si],al
00002A14  0400              add al,0x0
00002A16  0000              add [bx+si],al
00002A18  0400              add al,0x0
00002A1A  0000              add [bx+si],al
00002A1C  CA0000            retf 0x0
00002A1F  000F              add [bx],cl
00002A21  0000              add [bx+si],al
00002A23  0003              add [bp+di],al
00002A25  0000              add [bx+si],al
00002A27  0008              add [bx+si],cl
00002A29  9F                lahf
00002A2A  0408              add al,0x8
00002A2C  080F              or [bx],cl
00002A2E  0000              add [bx+si],al
00002A30  0400              add al,0x0
00002A32  0000              add [bx+si],al
00002A34  0000              add [bx+si],al
00002A36  0000              add [bx+si],al
00002A38  0000              add [bx+si],al
00002A3A  0000              add [bx+si],al
00002A3C  0400              add al,0x0
00002A3E  0000              add [bx+si],al
00002A40  0400              add al,0x0
00002A42  0000              add [bx+si],al
00002A44  D6                salc
00002A45  0000              add [bx+si],al
00002A47  00060000          add [0x0],al
00002A4B  0003              add [bp+di],al
00002A4D  0000              add [bx+si],al
00002A4F  000C              add [si],cl
00002A51  9F                lahf
00002A52  0408              add al,0x8
00002A54  0C0F              or al,0xf
00002A56  0000              add [bx+si],al
00002A58  E80000            call 0x2a5b
00002A5B  00060000          add [0x0],al
00002A5F  0000              add [bx+si],al
00002A61  0000              add [bx+si],al
00002A63  0004              add [si],al
00002A65  0000              add [bx+si],al
00002A67  0008              add [bx+si],cl
00002A69  0000              add [bx+si],al
00002A6B  00DF              add bh,bl
00002A6D  0000              add [bx+si],al
00002A6F  0001              add [bx+di],al
00002A71  0000              add [bx+si],al
00002A73  0003              add [bp+di],al
00002A75  0000              add [bx+si],al
00002A77  00F4              add ah,dh
00002A79  9F                lahf
00002A7A  0408              add al,0x8
00002A7C  F4                hlt
00002A7D  0F0000            sldt [bx+si]
00002A80  0C00              or al,0x0
00002A82  0000              add [bx+si],al
00002A84  0000              add [bx+si],al
00002A86  0000              add [bx+si],al
00002A88  0000              add [bx+si],al
00002A8A  0000              add [bx+si],al
00002A8C  0400              add al,0x0
00002A8E  0000              add [bx+si],al
00002A90  0400              add al,0x0
00002A92  0000              add [bx+si],al
00002A94  E400              in al,0x0
00002A96  0000              add [bx+si],al
00002A98  0100              add [bx+si],ax
00002A9A  0000              add [bx+si],al
00002A9C  0300              add ax,[bx+si]
00002A9E  0000              add [bx+si],al
00002AA0  00A00408          add [bx+si+0x804],ah
00002AA4  0010              add [bx+si],dl
00002AA6  0000              add [bx+si],al
00002AA8  1000              adc [bx+si],al
00002AAA  0000              add [bx+si],al
00002AAC  0000              add [bx+si],al
00002AAE  0000              add [bx+si],al
00002AB0  0000              add [bx+si],al
00002AB2  0000              add [bx+si],al
00002AB4  0400              add al,0x0
00002AB6  0000              add [bx+si],al
00002AB8  0400              add al,0x0
00002ABA  0000              add [bx+si],al
00002ABC  ED                in ax,dx
00002ABD  0000              add [bx+si],al
00002ABF  0001              add [bx+di],al
00002AC1  0000              add [bx+si],al
00002AC3  0003              add [bp+di],al
00002AC5  0000              add [bx+si],al
00002AC7  0010              add [bx+si],dl
00002AC9  A00408            mov al,[0x804]
00002ACC  1010              adc [bx+si],dl
00002ACE  0000              add [bx+si],al
00002AD0  0400              add al,0x0
00002AD2  0000              add [bx+si],al
00002AD4  0000              add [bx+si],al
00002AD6  0000              add [bx+si],al
00002AD8  0000              add [bx+si],al
00002ADA  0000              add [bx+si],al
00002ADC  0100              add [bx+si],ax
00002ADE  0000              add [bx+si],al
00002AE0  0000              add [bx+si],al
00002AE2  0000              add [bx+si],al
00002AE4  F30000            rep add [bx+si],al
00002AE7  0008              add [bx+si],cl
00002AE9  0000              add [bx+si],al
00002AEB  0003              add [bp+di],al
00002AED  0000              add [bx+si],al
00002AEF  0014              add [si],dl
00002AF1  A00408            mov al,[0x804]
00002AF4  1410              adc al,0x10
00002AF6  0000              add [bx+si],al
00002AF8  0800              or [bx+si],al
00002AFA  0000              add [bx+si],al
00002AFC  0000              add [bx+si],al
00002AFE  0000              add [bx+si],al
00002B00  0000              add [bx+si],al
00002B02  0000              add [bx+si],al
00002B04  0400              add al,0x0
00002B06  0000              add [bx+si],al
00002B08  0000              add [bx+si],al
00002B0A  0000              add [bx+si],al
00002B0C  F8                clc
00002B0D  0000              add [bx+si],al
00002B0F  0001              add [bx+di],al
00002B11  0000              add [bx+si],al
00002B13  0030              add [bx+si],dh
00002B15  0000              add [bx+si],al
00002B17  0000              add [bx+si],al
00002B19  0000              add [bx+si],al
00002B1B  0014              add [si],dl
00002B1D  1000              adc [bx+si],al
00002B1F  002C              add [si],ch
00002B21  0000              add [bx+si],al
00002B23  0000              add [bx+si],al
00002B25  0000              add [bx+si],al
00002B27  0000              add [bx+si],al
00002B29  0000              add [bx+si],al
00002B2B  0001              add [bx+di],al
00002B2D  0000              add [bx+si],al
00002B2F  0001              add [bx+di],al
00002B31  0000              add [bx+si],al
00002B33  0001              add [bx+di],al
00002B35  0100              add [bx+si],ax
00002B37  0007              add [bx],al
00002B39  0000              add [bx+si],al
00002B3B  0000              add [bx+si],al
00002B3D  0000              add [bx+si],al
00002B3F  001C              add [si],bl
00002B41  A00408            mov al,[0x804]
00002B44  40                inc ax
00002B45  1000              adc [bx+si],al
00002B47  0038              add [bx+si],bh
00002B49  0800              or [bx+si],al
00002B4B  0000              add [bx+si],al
00002B4D  0000              add [bx+si],al
00002B4F  0000              add [bx+si],al
00002B51  0000              add [bx+si],al
00002B53  0004              add [si],al
00002B55  0000              add [bx+si],al
00002B57  0000              add [bx+si],al
00002B59  0000              add [bx+si],al
00002B5B  0001              add [bx+di],al
00002B5D  0000              add [bx+si],al
00002B5F  0002              add [bp+si],al
00002B61  0000              add [bx+si],al
00002B63  0000              add [bx+si],al
00002B65  0000              add [bx+si],al
00002B67  0000              add [bx+si],al
00002B69  0000              add [bx+si],al
00002B6B  007818            add [bx+si+0x18],bh
00002B6E  0000              add [bx+si],al
00002B70  E006              loopne 0x2b78
00002B72  0000              add [bx+si],al
00002B74  1C00              sbb al,0x0
00002B76  0000              add [bx+si],al
00002B78  56                push si
00002B79  0000              add [bx+si],al
00002B7B  0004              add [si],al
00002B7D  0000              add [bx+si],al
00002B7F  0010              add [bx+si],dl
00002B81  0000              add [bx+si],al
00002B83  0009              add [bx+di],cl
00002B85  0000              add [bx+si],al
00002B87  0003              add [bp+di],al
00002B89  0000              add [bx+si],al
00002B8B  0000              add [bx+si],al
00002B8D  0000              add [bx+si],al
00002B8F  0000              add [bx+si],al
00002B91  0000              add [bx+si],al
00002B93  00581F            add [bx+si+0x1f],bl
00002B96  0000              add [bx+si],al
00002B98  B206              mov dl,0x6
00002B9A  0000              add [bx+si],al
00002B9C  0000              add [bx+si],al
00002B9E  0000              add [bx+si],al
00002BA0  0000              add [bx+si],al
00002BA2  0000              add [bx+si],al
00002BA4  0100              add [bx+si],ax
00002BA6  0000              add [bx+si],al
00002BA8  0000              add [bx+si],al
00002BAA  0000              add [bx+si],al
00002BAC  1100              adc [bx+si],ax
00002BAE  0000              add [bx+si],al
00002BB0  0300              add ax,[bx+si]
00002BB2  0000              add [bx+si],al
00002BB4  0000              add [bx+si],al
00002BB6  0000              add [bx+si],al
00002BB8  0000              add [bx+si],al
00002BBA  0000              add [bx+si],al
00002BBC  0A260000          or ah,[0x0]
00002BC0  17                pop ss
00002BC1  0100              add [bx+si],ax
00002BC3  0000              add [bx+si],al
00002BC5  0000              add [bx+si],al
00002BC7  0000              add [bx+si],al
00002BC9  0000              add [bx+si],al
00002BCB  0001              add [bx+di],al
00002BCD  0000              add [bx+si],al
00002BCF  0000              add [bx+si],al
00002BD1  0000              add [bx+si],al
00002BD3  00                db 0x00
