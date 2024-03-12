
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0100000 <_start>:
c0100000:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0100007:	00 00 00 
c010000a:	b4 0b                	mov    $0xb,%ah
c010000c:	b0 4c                	mov    $0x4c,%al
c010000e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0100015:	66 c7 05 a4 f7 10 c0 	movw   $0x0,0xc010f7a4
c010001c:	00 00 
c010001e:	0f 01 05 d0 06 11 c0 	sgdtl  0xc01106d0
c0100025:	e8 11 3c 00 00       	call   c0103c3b <ReloadGDT>
c010002a:	0f 01 15 d0 06 11 c0 	lgdtl  0xc01106d0
c0100031:	0f 01 1d 88 f7 10 c0 	lidtl  0xc010f788
c0100038:	0f a8                	push   %gs
c010003a:	0f a9                	pop    %gs
c010003c:	ea 43 00 10 c0 08 00 	ljmp   $0x8,$0xc0100043

c0100043 <csinit>:
c0100043:	31 c0                	xor    %eax,%eax
c0100045:	66 b8 40 00          	mov    $0x40,%ax
c0100049:	0f 00 d8             	ltr    %ax
c010004c:	31 c0                	xor    %eax,%eax
c010004e:	e9 b6 03 00 00       	jmp    c0100409 <kernel_main>
c0100053:	f4                   	hlt    
c0100054:	eb fe                	jmp    c0100054 <csinit+0x11>
c0100056:	fb                   	sti    
c0100057:	b4 0b                	mov    $0xb,%ah
c0100059:	b0 4d                	mov    $0x4d,%al
c010005b:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
c0100062:	eb fe                	jmp    c0100062 <csinit+0x1f>
c0100064:	f4                   	hlt    
c0100065:	6a 00                	push   $0x0
c0100067:	9d                   	popf   
c0100068:	eb fe                	jmp    c0100068 <csinit+0x25>
c010006a:	6a 01                	push   $0x1
c010006c:	6a 02                	push   $0x2
c010006e:	6a 03                	push   $0x3
c0100070:	f4                   	hlt    
c0100071:	66 90                	xchg   %ax,%ax
c0100073:	66 90                	xchg   %ax,%ax
c0100075:	66 90                	xchg   %ax,%ax
c0100077:	66 90                	xchg   %ax,%ax
c0100079:	66 90                	xchg   %ax,%ax
c010007b:	66 90                	xchg   %ax,%ax
c010007d:	66 90                	xchg   %ax,%ax
c010007f:	90                   	nop

c0100080 <InterruptTest>:
c0100080:	b4 0d                	mov    $0xd,%ah
c0100082:	b0 54                	mov    $0x54,%al
c0100084:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
c010008b:	c3                   	ret    

c010008c <disp_str>:
c010008c:	55                   	push   %ebp
c010008d:	89 e5                	mov    %esp,%ebp
c010008f:	b4 0d                	mov    $0xd,%ah
c0100091:	8b 75 08             	mov    0x8(%ebp),%esi
c0100094:	8b 3d a4 f7 10 c0    	mov    0xc010f7a4,%edi

c010009a <disp_str.1>:
c010009a:	ac                   	lods   %ds:(%esi),%al
c010009b:	84 c0                	test   %al,%al
c010009d:	74 1e                	je     c01000bd <disp_str.4>
c010009f:	3c 0a                	cmp    $0xa,%al
c01000a1:	75 11                	jne    c01000b4 <disp_str.3>
c01000a3:	50                   	push   %eax
c01000a4:	89 f8                	mov    %edi,%eax
c01000a6:	b3 a0                	mov    $0xa0,%bl
c01000a8:	f6 f3                	div    %bl
c01000aa:	40                   	inc    %eax
c01000ab:	b3 a0                	mov    $0xa0,%bl
c01000ad:	f6 e3                	mul    %bl
c01000af:	89 c7                	mov    %eax,%edi
c01000b1:	58                   	pop    %eax
c01000b2:	eb e6                	jmp    c010009a <disp_str.1>

c01000b4 <disp_str.3>:
c01000b4:	65 66 89 07          	mov    %ax,%gs:(%edi)
c01000b8:	83 c7 02             	add    $0x2,%edi
c01000bb:	eb dd                	jmp    c010009a <disp_str.1>

c01000bd <disp_str.4>:
c01000bd:	89 3d a4 f7 10 c0    	mov    %edi,0xc010f7a4
c01000c3:	89 ec                	mov    %ebp,%esp
c01000c5:	5d                   	pop    %ebp
c01000c6:	c3                   	ret    

c01000c7 <disp_str_colour>:
c01000c7:	55                   	push   %ebp
c01000c8:	89 e5                	mov    %esp,%ebp
c01000ca:	8b 75 08             	mov    0x8(%ebp),%esi
c01000cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c01000d0:	8b 3d a4 f7 10 c0    	mov    0xc010f7a4,%edi

c01000d6 <disp_str_colour.1>:
c01000d6:	ac                   	lods   %ds:(%esi),%al
c01000d7:	84 c0                	test   %al,%al
c01000d9:	74 1e                	je     c01000f9 <disp_str_colour.4>
c01000db:	3c 0a                	cmp    $0xa,%al
c01000dd:	75 11                	jne    c01000f0 <disp_str_colour.3>
c01000df:	50                   	push   %eax
c01000e0:	89 f8                	mov    %edi,%eax
c01000e2:	b3 a0                	mov    $0xa0,%bl
c01000e4:	f6 f3                	div    %bl
c01000e6:	40                   	inc    %eax
c01000e7:	b3 a0                	mov    $0xa0,%bl
c01000e9:	f6 e3                	mul    %bl
c01000eb:	89 c7                	mov    %eax,%edi
c01000ed:	58                   	pop    %eax
c01000ee:	eb e6                	jmp    c01000d6 <disp_str_colour.1>

c01000f0 <disp_str_colour.3>:
c01000f0:	65 66 89 07          	mov    %ax,%gs:(%edi)
c01000f4:	83 c7 02             	add    $0x2,%edi
c01000f7:	eb dd                	jmp    c01000d6 <disp_str_colour.1>

c01000f9 <disp_str_colour.4>:
c01000f9:	89 3d a4 f7 10 c0    	mov    %edi,0xc010f7a4
c01000ff:	89 ec                	mov    %ebp,%esp
c0100101:	5d                   	pop    %ebp
c0100102:	c3                   	ret    

c0100103 <divide_zero_fault>:
c0100103:	6a ff                	push   $0xffffffff
c0100105:	6a 00                	push   $0x0
c0100107:	eb 5f                	jmp    c0100168 <exception>

c0100109 <single_step_fault>:
c0100109:	6a ff                	push   $0xffffffff
c010010b:	6a 01                	push   $0x1
c010010d:	eb 59                	jmp    c0100168 <exception>

c010010f <non_maskable_interrupt>:
c010010f:	6a ff                	push   $0xffffffff
c0100111:	6a 02                	push   $0x2
c0100113:	eb 53                	jmp    c0100168 <exception>

c0100115 <breakpoint_trap>:
c0100115:	6a ff                	push   $0xffffffff
c0100117:	6a 03                	push   $0x3
c0100119:	eb 4d                	jmp    c0100168 <exception>

c010011b <overflow_trap>:
c010011b:	6a ff                	push   $0xffffffff
c010011d:	6a 04                	push   $0x4
c010011f:	eb 47                	jmp    c0100168 <exception>

c0100121 <bound_range_exceeded_fault>:
c0100121:	6a ff                	push   $0xffffffff
c0100123:	6a 05                	push   $0x5
c0100125:	eb 41                	jmp    c0100168 <exception>

c0100127 <invalid_opcode_fault>:
c0100127:	6a ff                	push   $0xffffffff
c0100129:	6a 06                	push   $0x6
c010012b:	eb 3b                	jmp    c0100168 <exception>

c010012d <coprocessor_not_available_fault>:
c010012d:	6a ff                	push   $0xffffffff
c010012f:	6a 07                	push   $0x7
c0100131:	eb 35                	jmp    c0100168 <exception>

c0100133 <double_fault_exception_abort>:
c0100133:	6a 08                	push   $0x8
c0100135:	eb 31                	jmp    c0100168 <exception>

c0100137 <coprocessor_segment_overrun>:
c0100137:	6a ff                	push   $0xffffffff
c0100139:	6a 09                	push   $0x9
c010013b:	eb 2b                	jmp    c0100168 <exception>

c010013d <invalid_task_state_segment_fault>:
c010013d:	6a 0a                	push   $0xa
c010013f:	eb 27                	jmp    c0100168 <exception>

c0100141 <segment_not_present_fault>:
c0100141:	6a 0b                	push   $0xb
c0100143:	eb 23                	jmp    c0100168 <exception>

c0100145 <stack_exception_fault>:
c0100145:	6a 0c                	push   $0xc
c0100147:	eb 1f                	jmp    c0100168 <exception>

c0100149 <general_protection_exception_fault>:
c0100149:	6a 0d                	push   $0xd
c010014b:	e8 30 71 00 00       	call   c0107280 <exception_handler>
c0100150:	83 c4 08             	add    $0x8,%esp
c0100153:	cf                   	iret   

c0100154 <page_fault>:
c0100154:	6a 0e                	push   $0xe
c0100156:	eb 10                	jmp    c0100168 <exception>

c0100158 <coprocessor_error_fault>:
c0100158:	6a ff                	push   $0xffffffff
c010015a:	6a 10                	push   $0x10
c010015c:	eb 0a                	jmp    c0100168 <exception>

c010015e <align_check_fault>:
c010015e:	6a 11                	push   $0x11
c0100160:	eb 06                	jmp    c0100168 <exception>

c0100162 <simd_float_exception_fault>:
c0100162:	6a ff                	push   $0xffffffff
c0100164:	6a 12                	push   $0x12
c0100166:	eb 00                	jmp    c0100168 <exception>

c0100168 <exception>:
c0100168:	e8 13 71 00 00       	call   c0107280 <exception_handler>
c010016d:	83 c4 08             	add    $0x8,%esp
c0100170:	f4                   	hlt    

c0100171 <hwint0>:
c0100171:	60                   	pusha  
c0100172:	1e                   	push   %ds
c0100173:	06                   	push   %es
c0100174:	0f a0                	push   %fs
c0100176:	0f a8                	push   %gs
c0100178:	66 8c d2             	mov    %ss,%dx
c010017b:	8e da                	mov    %edx,%ds
c010017d:	8e c2                	mov    %edx,%es
c010017f:	8e e2                	mov    %edx,%fs
c0100181:	b0 20                	mov    $0x20,%al
c0100183:	e6 20                	out    %al,$0x20
c0100185:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c010018b:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100192:	75 00                	jne    c0100194 <hwint0.1>

c0100194 <hwint0.1>:
c0100194:	fb                   	sti    
c0100195:	e8 6b 36 00 00       	call   c0103805 <clock_handler>
c010019a:	e9 36 01 00 00       	jmp    c01002d5 <reenter_restore>

c010019f <hwint1>:
c010019f:	60                   	pusha  
c01001a0:	1e                   	push   %ds
c01001a1:	06                   	push   %es
c01001a2:	0f a0                	push   %fs
c01001a4:	0f a8                	push   %gs
c01001a6:	66 8c d2             	mov    %ss,%dx
c01001a9:	8e da                	mov    %edx,%ds
c01001ab:	8e c2                	mov    %edx,%es
c01001ad:	8e e2                	mov    %edx,%fs
c01001af:	b0 fa                	mov    $0xfa,%al
c01001b1:	e6 21                	out    %al,$0x21
c01001b3:	b0 20                	mov    $0x20,%al
c01001b5:	e6 20                	out    %al,$0x20
c01001b7:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c01001bd:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01001c4:	75 00                	jne    c01001c6 <hwint1.1>

c01001c6 <hwint1.1>:
c01001c6:	fb                   	sti    
c01001c7:	e8 c4 45 00 00       	call   c0104790 <keyboard_handler>
c01001cc:	b0 f8                	mov    $0xf8,%al
c01001ce:	e6 21                	out    %al,$0x21
c01001d0:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01001d7:	0f 85 f8 00 00 00    	jne    c01002d5 <reenter_restore>
c01001dd:	e9 f3 00 00 00       	jmp    c01002d5 <reenter_restore>

c01001e2 <hwint14>:
c01001e2:	60                   	pusha  
c01001e3:	1e                   	push   %ds
c01001e4:	06                   	push   %es
c01001e5:	0f a0                	push   %fs
c01001e7:	0f a8                	push   %gs
c01001e9:	66 8c d2             	mov    %ss,%dx
c01001ec:	8e da                	mov    %edx,%ds
c01001ee:	8e c2                	mov    %edx,%es
c01001f0:	8e e2                	mov    %edx,%fs
c01001f2:	b0 fb                	mov    $0xfb,%al
c01001f4:	e6 a1                	out    %al,$0xa1
c01001f6:	b0 20                	mov    $0x20,%al
c01001f8:	e6 20                	out    %al,$0x20
c01001fa:	90                   	nop
c01001fb:	e6 a0                	out    %al,$0xa0
c01001fd:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c0100203:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010020a:	75 00                	jne    c010020c <hwint14.1>

c010020c <hwint14.1>:
c010020c:	fb                   	sti    
c010020d:	e8 78 12 00 00       	call   c010148a <hd_handler>
c0100212:	b0 bb                	mov    $0xbb,%al
c0100214:	e6 a1                	out    %al,$0xa1
c0100216:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010021d:	0f 85 b2 00 00 00    	jne    c01002d5 <reenter_restore>
c0100223:	e9 ad 00 00 00       	jmp    c01002d5 <reenter_restore>

c0100228 <hwint10>:
c0100228:	66 87 db             	xchg   %bx,%bx
c010022b:	60                   	pusha  
c010022c:	1e                   	push   %ds
c010022d:	06                   	push   %es
c010022e:	0f a0                	push   %fs
c0100230:	0f a8                	push   %gs
c0100232:	66 8c d2             	mov    %ss,%dx
c0100235:	8e da                	mov    %edx,%ds
c0100237:	8e c2                	mov    %edx,%es
c0100239:	8e e2                	mov    %edx,%fs
c010023b:	b0 bf                	mov    $0xbf,%al
c010023d:	e6 a1                	out    %al,$0xa1
c010023f:	b0 20                	mov    $0x20,%al
c0100241:	e6 20                	out    %al,$0x20
c0100243:	90                   	nop
c0100244:	e6 a0                	out    %al,$0xa0
c0100246:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c010024c:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100253:	75 00                	jne    c0100255 <hwint10.1>

c0100255 <hwint10.1>:
c0100255:	fb                   	sti    
c0100256:	e8 f5 a4 00 00       	call   c010a750 <NICtoPC>
c010025b:	90                   	nop
c010025c:	90                   	nop
c010025d:	b0 bb                	mov    $0xbb,%al
c010025f:	e6 a1                	out    %al,$0xa1
c0100261:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100268:	75 6b                	jne    c01002d5 <reenter_restore>
c010026a:	eb 69                	jmp    c01002d5 <reenter_restore>

c010026c <sys_call>:
c010026c:	60                   	pusha  
c010026d:	1e                   	push   %ds
c010026e:	06                   	push   %es
c010026f:	0f a0                	push   %fs
c0100271:	0f a8                	push   %gs
c0100273:	89 e6                	mov    %esp,%esi
c0100275:	89 e5                	mov    %esp,%ebp
c0100277:	66 8c d2             	mov    %ss,%dx
c010027a:	8e da                	mov    %edx,%ds
c010027c:	8e c2                	mov    %edx,%es
c010027e:	8e e2                	mov    %edx,%fs
c0100280:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c0100286:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010028d:	75 00                	jne    c010028f <sys_call.1>

c010028f <sys_call.1>:
c010028f:	fb                   	sti    
c0100290:	56                   	push   %esi
c0100291:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100297:	53                   	push   %ebx
c0100298:	51                   	push   %ecx
c0100299:	ff 14 85 2c e1 10 c0 	call   *-0x3fef1ed4(,%eax,4)
c01002a0:	83 c4 0c             	add    $0xc,%esp
c01002a3:	5e                   	pop    %esi
c01002a4:	89 45 2c             	mov    %eax,0x2c(%ebp)
c01002a7:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01002ae:	75 25                	jne    c01002d5 <reenter_restore>
c01002b0:	eb 23                	jmp    c01002d5 <reenter_restore>

c01002b2 <fork_restart>:
c01002b2:	fa                   	cli    
c01002b3:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c01002b9:	0f a9                	pop    %gs
c01002bb:	0f a1                	pop    %fs
c01002bd:	07                   	pop    %es
c01002be:	1f                   	pop    %ds
c01002bf:	61                   	popa   
c01002c0:	cf                   	iret   

c01002c1 <restart>:
c01002c1:	fa                   	cli    
c01002c2:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c01002c8:	89 e5                	mov    %esp,%ebp
c01002ca:	8b 65 04             	mov    0x4(%ebp),%esp
c01002cd:	0f a9                	pop    %gs
c01002cf:	0f a1                	pop    %fs
c01002d1:	07                   	pop    %es
c01002d2:	1f                   	pop    %ds
c01002d3:	61                   	popa   
c01002d4:	cf                   	iret   

c01002d5 <reenter_restore>:
c01002d5:	fa                   	cli    
c01002d6:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c01002dc:	0f a9                	pop    %gs
c01002de:	0f a1                	pop    %fs
c01002e0:	07                   	pop    %es
c01002e1:	1f                   	pop    %ds
c01002e2:	61                   	popa   
c01002e3:	cf                   	iret   

c01002e4 <in_byte>:
c01002e4:	31 d2                	xor    %edx,%edx
c01002e6:	8b 54 24 04          	mov    0x4(%esp),%edx
c01002ea:	31 c0                	xor    %eax,%eax
c01002ec:	ec                   	in     (%dx),%al
c01002ed:	90                   	nop
c01002ee:	90                   	nop
c01002ef:	c3                   	ret    

c01002f0 <out_byte>:
c01002f0:	31 d2                	xor    %edx,%edx
c01002f2:	31 c0                	xor    %eax,%eax
c01002f4:	8b 54 24 04          	mov    0x4(%esp),%edx
c01002f8:	8a 44 24 08          	mov    0x8(%esp),%al
c01002fc:	ee                   	out    %al,(%dx)
c01002fd:	90                   	nop
c01002fe:	90                   	nop
c01002ff:	c3                   	ret    

c0100300 <in_byte2>:
c0100300:	55                   	push   %ebp
c0100301:	89 e5                	mov    %esp,%ebp
c0100303:	52                   	push   %edx
c0100304:	31 d2                	xor    %edx,%edx
c0100306:	66 8b 55 08          	mov    0x8(%ebp),%dx
c010030a:	31 c0                	xor    %eax,%eax
c010030c:	ec                   	in     (%dx),%al
c010030d:	90                   	nop
c010030e:	90                   	nop
c010030f:	5b                   	pop    %ebx
c0100310:	5d                   	pop    %ebp
c0100311:	c3                   	ret    

c0100312 <disable_int>:
c0100312:	fa                   	cli    
c0100313:	c3                   	ret    

c0100314 <enable_int>:
c0100314:	fb                   	sti    
c0100315:	c3                   	ret    

c0100316 <check_tss_esp0>:
c0100316:	55                   	push   %ebp
c0100317:	89 e5                	mov    %esp,%ebp
c0100319:	8b 45 08             	mov    0x8(%ebp),%eax
c010031c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010031f:	83 c0 44             	add    $0x44,%eax
c0100322:	8b 15 44 06 11 c0    	mov    0xc0110644,%edx
c0100328:	39 d0                	cmp    %edx,%eax
c010032a:	74 7c                	je     c01003a8 <check_tss_esp0.2>

c010032c <check_tss_esp0.1>:
c010032c:	50                   	push   %eax
c010032d:	52                   	push   %edx
c010032e:	68 10 e0 10 c0       	push   $0xc010e010
c0100333:	e8 54 fd ff ff       	call   c010008c <disp_str>
c0100338:	83 c4 04             	add    $0x4,%esp
c010033b:	5a                   	pop    %edx
c010033c:	58                   	pop    %eax
c010033d:	52                   	push   %edx
c010033e:	50                   	push   %eax
c010033f:	53                   	push   %ebx
c0100340:	e8 d5 6d 00 00       	call   c010711a <disp_int>
c0100345:	83 c4 04             	add    $0x4,%esp
c0100348:	58                   	pop    %eax
c0100349:	5a                   	pop    %edx
c010034a:	52                   	push   %edx
c010034b:	50                   	push   %eax
c010034c:	e8 c9 6d 00 00       	call   c010711a <disp_int>
c0100351:	58                   	pop    %eax
c0100352:	5a                   	pop    %edx
c0100353:	52                   	push   %edx
c0100354:	50                   	push   %eax
c0100355:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c010035b:	e8 ba 6d 00 00       	call   c010711a <disp_int>
c0100360:	83 c4 04             	add    $0x4,%esp
c0100363:	58                   	pop    %eax
c0100364:	5a                   	pop    %edx
c0100365:	52                   	push   %edx
c0100366:	50                   	push   %eax
c0100367:	ff 72 ec             	pushl  -0x14(%edx)
c010036a:	e8 ab 6d 00 00       	call   c010711a <disp_int>
c010036f:	83 c4 04             	add    $0x4,%esp
c0100372:	58                   	pop    %eax
c0100373:	5a                   	pop    %edx
c0100374:	52                   	push   %edx
c0100375:	50                   	push   %eax
c0100376:	ff 70 ec             	pushl  -0x14(%eax)
c0100379:	e8 9c 6d 00 00       	call   c010711a <disp_int>
c010037e:	83 c4 04             	add    $0x4,%esp
c0100381:	58                   	pop    %eax
c0100382:	5a                   	pop    %edx
c0100383:	52                   	push   %edx
c0100384:	50                   	push   %eax
c0100385:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c010038b:	e8 8a 6d 00 00       	call   c010711a <disp_int>
c0100390:	83 c4 04             	add    $0x4,%esp
c0100393:	58                   	pop    %eax
c0100394:	5a                   	pop    %edx
c0100395:	52                   	push   %edx
c0100396:	50                   	push   %eax
c0100397:	68 60 f7 10 c0       	push   $0xc010f760
c010039c:	e8 79 6d 00 00       	call   c010711a <disp_int>
c01003a1:	83 c4 04             	add    $0x4,%esp
c01003a4:	58                   	pop    %eax
c01003a5:	5a                   	pop    %edx
c01003a6:	5d                   	pop    %ebp
c01003a7:	c3                   	ret    

c01003a8 <check_tss_esp0.2>:
c01003a8:	5d                   	pop    %ebp
c01003a9:	c3                   	ret    

c01003aa <enable_8259A_casecade_irq>:
c01003aa:	9c                   	pushf  
c01003ab:	fa                   	cli    
c01003ac:	e4 21                	in     $0x21,%al
c01003ae:	24 fb                	and    $0xfb,%al
c01003b0:	e6 21                	out    %al,$0x21
c01003b2:	9d                   	popf   
c01003b3:	c3                   	ret    

c01003b4 <disable_8259A_casecade_irq>:
c01003b4:	9c                   	pushf  
c01003b5:	fa                   	cli    
c01003b6:	e4 21                	in     $0x21,%al
c01003b8:	0c 04                	or     $0x4,%al
c01003ba:	e6 21                	out    %al,$0x21
c01003bc:	9c                   	pushf  
c01003bd:	c3                   	ret    

c01003be <enable_8259A_slave_winchester_irq>:
c01003be:	9c                   	pushf  
c01003bf:	fa                   	cli    
c01003c0:	e4 a1                	in     $0xa1,%al
c01003c2:	24 bf                	and    $0xbf,%al
c01003c4:	e6 a1                	out    %al,$0xa1
c01003c6:	9d                   	popf   
c01003c7:	c3                   	ret    

c01003c8 <disable_8259A_slave_winchester_irq>:
c01003c8:	9c                   	pushf  
c01003c9:	fa                   	cli    
c01003ca:	e4 a1                	in     $0xa1,%al
c01003cc:	0c 40                	or     $0x40,%al
c01003ce:	e6 a1                	out    %al,$0xa1
c01003d0:	9d                   	popf   
c01003d1:	c3                   	ret    

c01003d2 <update_cr3>:
c01003d2:	55                   	push   %ebp
c01003d3:	89 e5                	mov    %esp,%ebp
c01003d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01003d8:	0f 22 d8             	mov    %eax,%cr3
c01003db:	89 ec                	mov    %ebp,%esp
c01003dd:	5d                   	pop    %ebp
c01003de:	c3                   	ret    

c01003df <update_tss>:
c01003df:	55                   	push   %ebp
c01003e0:	89 e5                	mov    %esp,%ebp
c01003e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01003e5:	a3 44 06 11 c0       	mov    %eax,0xc0110644
c01003ea:	89 ec                	mov    %ebp,%esp
c01003ec:	5d                   	pop    %ebp
c01003ed:	c3                   	ret    

c01003ee <get_running_thread_pcb>:
c01003ee:	89 e0                	mov    %esp,%eax
c01003f0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01003f5:	c3                   	ret    

c01003f6 <sys_call_test>:
c01003f6:	9c                   	pushf  
c01003f7:	9d                   	popf   
c01003f8:	c3                   	ret    

c01003f9 <enable_8259A_slave_net_irq>:
c01003f9:	9c                   	pushf  
c01003fa:	fa                   	cli    
c01003fb:	66 87 db             	xchg   %bx,%bx
c01003fe:	30 c0                	xor    %al,%al
c0100400:	e4 a1                	in     $0xa1,%al
c0100402:	24 fb                	and    $0xfb,%al
c0100404:	e6 a1                	out    %al,$0xa1
c0100406:	9d                   	popf   
c0100407:	fb                   	sti    
c0100408:	c3                   	ret    

c0100409 <kernel_main>:
c0100409:	55                   	push   %ebp
c010040a:	89 e5                	mov    %esp,%ebp
c010040c:	83 ec 18             	sub    $0x18,%esp
c010040f:	e8 7b 01 00 00       	call   c010058f <init>
c0100414:	c7 45 f4 0f 00 00 00 	movl   $0xf,-0xc(%ebp)
c010041b:	e8 ce ff ff ff       	call   c01003ee <get_running_thread_pcb>
c0100420:	a3 e0 0e 11 c0       	mov    %eax,0xc0110ee0
c0100425:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100428:	8d 50 02             	lea    0x2(%eax),%edx
c010042b:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100430:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0100436:	8b 15 e0 0e 11 c0    	mov    0xc0110ee0,%edx
c010043c:	8b 80 1c 01 00 00    	mov    0x11c(%eax),%eax
c0100442:	89 82 18 01 00 00    	mov    %eax,0x118(%edx)
c0100448:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010044d:	8b 15 28 0f 11 c0    	mov    0xc0110f28,%edx
c0100453:	89 50 08             	mov    %edx,0x8(%eax)
c0100456:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010045b:	05 28 01 00 00       	add    $0x128,%eax
c0100460:	83 ec 08             	sub    $0x8,%esp
c0100463:	68 00 b0 10 c0       	push   $0xc010b000
c0100468:	50                   	push   %eax
c0100469:	e8 80 bd 00 00       	call   c010c1ee <Strcpy>
c010046e:	83 c4 10             	add    $0x10,%esp
c0100471:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100476:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c010047b:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100480:	05 60 02 00 00       	add    $0x260,%eax
c0100485:	83 ec 08             	sub    $0x8,%esp
c0100488:	50                   	push   %eax
c0100489:	68 ec fd 10 c0       	push   $0xc010fdec
c010048e:	e8 6d 9d 00 00       	call   c010a200 <appendToDoubleLinkList>
c0100493:	83 c4 10             	add    $0x10,%esp
c0100496:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010049b:	05 6a 02 00 00       	add    $0x26a,%eax
c01004a0:	83 ec 08             	sub    $0x8,%esp
c01004a3:	50                   	push   %eax
c01004a4:	68 ec fd 10 c0       	push   $0xc010fdec
c01004a9:	e8 52 9d 00 00       	call   c010a200 <appendToDoubleLinkList>
c01004ae:	83 c4 10             	add    $0x10,%esp
c01004b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004b4:	83 ec 0c             	sub    $0xc,%esp
c01004b7:	50                   	push   %eax
c01004b8:	6a 00                	push   $0x0
c01004ba:	68 0c b0 10 c0       	push   $0xc010b00c
c01004bf:	68 13 b0 10 c0       	push   $0xc010b013
c01004c4:	68 f7 51 10 c0       	push   $0xc01051f7
c01004c9:	e8 73 9a 00 00       	call   c0109f41 <process_execute>
c01004ce:	83 c4 20             	add    $0x20,%esp
c01004d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004d4:	83 ec 0c             	sub    $0xc,%esp
c01004d7:	50                   	push   %eax
c01004d8:	6a 00                	push   $0x0
c01004da:	68 1c b0 10 c0       	push   $0xc010b01c
c01004df:	68 24 b0 10 c0       	push   $0xc010b024
c01004e4:	68 a9 16 10 c0       	push   $0xc01016a9
c01004e9:	e8 53 9a 00 00       	call   c0109f41 <process_execute>
c01004ee:	83 c4 20             	add    $0x20,%esp
c01004f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004f4:	83 ec 0c             	sub    $0xc,%esp
c01004f7:	50                   	push   %eax
c01004f8:	6a 00                	push   $0x0
c01004fa:	68 2d b0 10 c0       	push   $0xc010b02d
c01004ff:	68 34 b0 10 c0       	push   $0xc010b034
c0100504:	68 02 08 10 c0       	push   $0xc0100802
c0100509:	e8 33 9a 00 00       	call   c0109f41 <process_execute>
c010050e:	83 c4 20             	add    $0x20,%esp
c0100511:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100514:	83 ec 0c             	sub    $0xc,%esp
c0100517:	50                   	push   %eax
c0100518:	6a 00                	push   $0x0
c010051a:	68 3d b0 10 c0       	push   $0xc010b03d
c010051f:	68 45 b0 10 c0       	push   $0xc010b045
c0100524:	68 8d 46 10 c0       	push   $0xc010468d
c0100529:	e8 13 9a 00 00       	call   c0109f41 <process_execute>
c010052e:	83 c4 20             	add    $0x20,%esp
c0100531:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100534:	83 e8 02             	sub    $0x2,%eax
c0100537:	83 ec 0c             	sub    $0xc,%esp
c010053a:	50                   	push   %eax
c010053b:	6a 01                	push   $0x1
c010053d:	68 4f b0 10 c0       	push   $0xc010b04f
c0100542:	68 59 b0 10 c0       	push   $0xc010b059
c0100547:	68 e9 06 10 c0       	push   $0xc01006e9
c010054c:	e8 f0 99 00 00       	call   c0109f41 <process_execute>
c0100551:	83 c4 20             	add    $0x20,%esp
c0100554:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100557:	83 e8 03             	sub    $0x3,%eax
c010055a:	83 ec 0c             	sub    $0xc,%esp
c010055d:	50                   	push   %eax
c010055e:	6a 01                	push   $0x1
c0100560:	68 66 b0 10 c0       	push   $0xc010b066
c0100565:	68 70 b0 10 c0       	push   $0xc010b070
c010056a:	68 ea 07 10 c0       	push   $0xc01007ea
c010056f:	e8 cd 99 00 00       	call   c0109f41 <process_execute>
c0100574:	83 c4 20             	add    $0x20,%esp
c0100577:	83 ec 0c             	sub    $0xc,%esp
c010057a:	68 7d b0 10 c0       	push   $0xc010b07d
c010057f:	e8 08 fb ff ff       	call   c010008c <disp_str>
c0100584:	83 c4 10             	add    $0x10,%esp
c0100587:	fb                   	sti    
c0100588:	e8 b1 66 00 00       	call   c0106c3e <stop_here>
c010058d:	eb f9                	jmp    c0100588 <kernel_main+0x17f>

c010058f <init>:
c010058f:	55                   	push   %ebp
c0100590:	89 e5                	mov    %esp,%ebp
c0100592:	83 ec 08             	sub    $0x8,%esp
c0100595:	c7 05 28 0f 11 c0 00 	movl   $0x400000,0xc0110f28
c010059c:	00 40 00 
c010059f:	c7 05 a8 f7 10 c0 63 	movl   $0x63,0xc010f7a8
c01005a6:	00 00 00 
c01005a9:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01005b0:	00 00 00 
c01005b3:	c7 05 90 f7 10 c0 00 	movl   $0x0,0xc010f790
c01005ba:	00 00 00 
c01005bd:	c7 05 c8 06 11 c0 64 	movl   $0x64,0xc01106c8
c01005c4:	00 00 00 
c01005c7:	c7 05 fc fd 10 c0 09 	movl   $0x9,0xc010fdfc
c01005ce:	00 00 00 
c01005d1:	c7 05 c0 fb 10 c0 00 	movl   $0x0,0xc010fbc0
c01005d8:	00 00 00 
c01005db:	83 ec 0c             	sub    $0xc,%esp
c01005de:	68 87 b0 10 c0       	push   $0xc010b087
c01005e3:	e8 a4 fa ff ff       	call   c010008c <disp_str>
c01005e8:	83 c4 10             	add    $0x10,%esp
c01005eb:	e8 7a 70 00 00       	call   c010766a <init_keyboard>
c01005f0:	83 ec 0c             	sub    $0xc,%esp
c01005f3:	68 00 00 00 04       	push   $0x4000000
c01005f8:	e8 f8 64 00 00       	call   c0106af5 <init_memory>
c01005fd:	83 c4 10             	add    $0x10,%esp
c0100600:	83 ec 0c             	sub    $0xc,%esp
c0100603:	68 ec fd 10 c0       	push   $0xc010fdec
c0100608:	e8 c8 9a 00 00       	call   c010a0d5 <initDoubleLinkList>
c010060d:	83 c4 10             	add    $0x10,%esp
c0100610:	83 ec 0c             	sub    $0xc,%esp
c0100613:	68 04 0f 11 c0       	push   $0xc0110f04
c0100618:	e8 b8 9a 00 00       	call   c010a0d5 <initDoubleLinkList>
c010061d:	83 c4 10             	add    $0x10,%esp
c0100620:	90                   	nop
c0100621:	c9                   	leave  
c0100622:	c3                   	ret    

c0100623 <kernel_thread_a>:
c0100623:	55                   	push   %ebp
c0100624:	89 e5                	mov    %esp,%ebp
c0100626:	83 ec 18             	sub    $0x18,%esp
c0100629:	83 ec 0c             	sub    $0xc,%esp
c010062c:	ff 75 08             	pushl  0x8(%ebp)
c010062f:	e8 58 fa ff ff       	call   c010008c <disp_str>
c0100634:	83 c4 10             	add    $0x10,%esp
c0100637:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c010063c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010063f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100646:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100649:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c010064e:	83 ec 0c             	sub    $0xc,%esp
c0100651:	68 8d b0 10 c0       	push   $0xc010b08d
c0100656:	e8 31 fa ff ff       	call   c010008c <disp_str>
c010065b:	83 c4 10             	add    $0x10,%esp
c010065e:	83 ec 0c             	sub    $0xc,%esp
c0100661:	68 96 b0 10 c0       	push   $0xc010b096
c0100666:	e8 21 fa ff ff       	call   c010008c <disp_str>
c010066b:	83 c4 10             	add    $0x10,%esp
c010066e:	eb d6                	jmp    c0100646 <kernel_thread_a+0x23>

c0100670 <kernel_thread_b>:
c0100670:	55                   	push   %ebp
c0100671:	89 e5                	mov    %esp,%ebp
c0100673:	83 ec 18             	sub    $0x18,%esp
c0100676:	83 ec 0c             	sub    $0xc,%esp
c0100679:	ff 75 08             	pushl  0x8(%ebp)
c010067c:	e8 0b fa ff ff       	call   c010008c <disp_str>
c0100681:	83 c4 10             	add    $0x10,%esp
c0100684:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100689:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010068c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100693:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100696:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c010069b:	83 ec 0c             	sub    $0xc,%esp
c010069e:	68 98 b0 10 c0       	push   $0xc010b098
c01006a3:	e8 e4 f9 ff ff       	call   c010008c <disp_str>
c01006a8:	83 c4 10             	add    $0x10,%esp
c01006ab:	83 ec 0c             	sub    $0xc,%esp
c01006ae:	68 96 b0 10 c0       	push   $0xc010b096
c01006b3:	e8 d4 f9 ff ff       	call   c010008c <disp_str>
c01006b8:	83 c4 10             	add    $0x10,%esp
c01006bb:	eb d6                	jmp    c0100693 <kernel_thread_b+0x23>

c01006bd <kernel_thread_c>:
c01006bd:	55                   	push   %ebp
c01006be:	89 e5                	mov    %esp,%ebp
c01006c0:	83 ec 08             	sub    $0x8,%esp
c01006c3:	83 ec 0c             	sub    $0xc,%esp
c01006c6:	ff 75 08             	pushl  0x8(%ebp)
c01006c9:	e8 be f9 ff ff       	call   c010008c <disp_str>
c01006ce:	83 c4 10             	add    $0x10,%esp
c01006d1:	eb fe                	jmp    c01006d1 <kernel_thread_c+0x14>

c01006d3 <kernel_thread_d>:
c01006d3:	55                   	push   %ebp
c01006d4:	89 e5                	mov    %esp,%ebp
c01006d6:	83 ec 08             	sub    $0x8,%esp
c01006d9:	83 ec 0c             	sub    $0xc,%esp
c01006dc:	ff 75 08             	pushl  0x8(%ebp)
c01006df:	e8 a8 f9 ff ff       	call   c010008c <disp_str>
c01006e4:	83 c4 10             	add    $0x10,%esp
c01006e7:	eb fe                	jmp    c01006e7 <kernel_thread_d+0x14>

c01006e9 <user_proc_a>:
c01006e9:	55                   	push   %ebp
c01006ea:	89 e5                	mov    %esp,%ebp
c01006ec:	83 ec 18             	sub    $0x18,%esp
c01006ef:	83 ec 0c             	sub    $0xc,%esp
c01006f2:	68 a4 b0 10 c0       	push   $0xc010b0a4
c01006f7:	e8 90 f9 ff ff       	call   c010008c <disp_str>
c01006fc:	83 c4 10             	add    $0x10,%esp
c01006ff:	c6 05 cd 06 11 c0 00 	movb   $0x0,0xc01106cd
c0100706:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
c010070d:	83 ec 0c             	sub    $0xc,%esp
c0100710:	ff 75 f0             	pushl  -0x10(%ebp)
c0100713:	e8 64 0f 00 00       	call   c010167c <sys_malloc>
c0100718:	83 c4 10             	add    $0x10,%esp
c010071b:	a3 bc 06 11 c0       	mov    %eax,0xc01106bc
c0100720:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100723:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100728:	83 ec 04             	sub    $0x4,%esp
c010072b:	52                   	push   %edx
c010072c:	6a 00                	push   $0x0
c010072e:	50                   	push   %eax
c010072f:	e8 9b ba 00 00       	call   c010c1cf <Memset>
c0100734:	83 c4 10             	add    $0x10,%esp
c0100737:	c7 45 ec c3 b0 10 c0 	movl   $0xc010b0c3,-0x14(%ebp)
c010073e:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100743:	83 ec 08             	sub    $0x8,%esp
c0100746:	ff 75 ec             	pushl  -0x14(%ebp)
c0100749:	50                   	push   %eax
c010074a:	e8 9f ba 00 00       	call   c010c1ee <Strcpy>
c010074f:	83 c4 10             	add    $0x10,%esp
c0100752:	c6 05 cd 06 11 c0 04 	movb   $0x4,0xc01106cd
c0100759:	e8 75 9e 00 00       	call   c010a5d3 <DriverInitialize>
c010075e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100765:	eb 15                	jmp    c010077c <user_proc_a+0x93>
c0100767:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c010076c:	83 ec 0c             	sub    $0xc,%esp
c010076f:	50                   	push   %eax
c0100770:	e8 f9 9e 00 00       	call   c010a66e <DriverSend>
c0100775:	83 c4 10             	add    $0x10,%esp
c0100778:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010077c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0100780:	7e e5                	jle    c0100767 <user_proc_a+0x7e>
c0100782:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100787:	83 ec 0c             	sub    $0xc,%esp
c010078a:	50                   	push   %eax
c010078b:	e8 fc f8 ff ff       	call   c010008c <disp_str>
c0100790:	83 c4 10             	add    $0x10,%esp
c0100793:	83 ec 0c             	sub    $0xc,%esp
c0100796:	68 2c 0f 11 c0       	push   $0xc0110f2c
c010079b:	e8 ec f8 ff ff       	call   c010008c <disp_str>
c01007a0:	83 c4 10             	add    $0x10,%esp
c01007a3:	83 ec 0c             	sub    $0xc,%esp
c01007a6:	68 96 b0 10 c0       	push   $0xc010b096
c01007ab:	e8 dc f8 ff ff       	call   c010008c <disp_str>
c01007b0:	83 c4 10             	add    $0x10,%esp
c01007b3:	83 ec 0c             	sub    $0xc,%esp
c01007b6:	68 da b0 10 c0       	push   $0xc010b0da
c01007bb:	e8 cc f8 ff ff       	call   c010008c <disp_str>
c01007c0:	83 c4 10             	add    $0x10,%esp
c01007c3:	83 ec 0c             	sub    $0xc,%esp
c01007c6:	68 ed b0 10 c0       	push   $0xc010b0ed
c01007cb:	e8 bc f8 ff ff       	call   c010008c <disp_str>
c01007d0:	83 c4 10             	add    $0x10,%esp
c01007d3:	83 ec 0c             	sub    $0xc,%esp
c01007d6:	68 00 b1 10 c0       	push   $0xc010b100
c01007db:	e8 ac f8 ff ff       	call   c010008c <disp_str>
c01007e0:	83 c4 10             	add    $0x10,%esp
c01007e3:	e8 4a 7b 00 00       	call   c0108332 <test_exec>
c01007e8:	eb fe                	jmp    c01007e8 <user_proc_a+0xff>

c01007ea <user_proc_b>:
c01007ea:	55                   	push   %ebp
c01007eb:	89 e5                	mov    %esp,%ebp
c01007ed:	83 ec 08             	sub    $0x8,%esp
c01007f0:	83 ec 0c             	sub    $0xc,%esp
c01007f3:	68 14 b1 10 c0       	push   $0xc010b114
c01007f8:	e8 8f f8 ff ff       	call   c010008c <disp_str>
c01007fd:	83 c4 10             	add    $0x10,%esp
c0100800:	eb fe                	jmp    c0100800 <user_proc_b+0x16>

c0100802 <TaskHD>:
c0100802:	55                   	push   %ebp
c0100803:	89 e5                	mov    %esp,%ebp
c0100805:	83 ec 18             	sub    $0x18,%esp
c0100808:	e8 e1 fb ff ff       	call   c01003ee <get_running_thread_pcb>
c010080d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100810:	e8 32 00 00 00       	call   c0100847 <init_hd>
c0100815:	83 ec 0c             	sub    $0xc,%esp
c0100818:	6a 7c                	push   $0x7c
c010081a:	e8 5d 0e 00 00       	call   c010167c <sys_malloc>
c010081f:	83 c4 10             	add    $0x10,%esp
c0100822:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100825:	83 ec 04             	sub    $0x4,%esp
c0100828:	6a 7c                	push   $0x7c
c010082a:	6a 00                	push   $0x0
c010082c:	ff 75 f0             	pushl  -0x10(%ebp)
c010082f:	e8 9b b9 00 00       	call   c010c1cf <Memset>
c0100834:	83 c4 10             	add    $0x10,%esp
c0100837:	83 ec 0c             	sub    $0xc,%esp
c010083a:	ff 75 f0             	pushl  -0x10(%ebp)
c010083d:	e8 1f 00 00 00       	call   c0100861 <hd_handle>
c0100842:	83 c4 10             	add    $0x10,%esp
c0100845:	eb de                	jmp    c0100825 <TaskHD+0x23>

c0100847 <init_hd>:
c0100847:	55                   	push   %ebp
c0100848:	89 e5                	mov    %esp,%ebp
c010084a:	83 ec 18             	sub    $0x18,%esp
c010084d:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0100854:	e8 51 fb ff ff       	call   c01003aa <enable_8259A_casecade_irq>
c0100859:	e8 60 fb ff ff       	call   c01003be <enable_8259A_slave_winchester_irq>
c010085e:	90                   	nop
c010085f:	c9                   	leave  
c0100860:	c3                   	ret    

c0100861 <hd_handle>:
c0100861:	55                   	push   %ebp
c0100862:	89 e5                	mov    %esp,%ebp
c0100864:	83 ec 18             	sub    $0x18,%esp
c0100867:	83 ec 04             	sub    $0x4,%esp
c010086a:	6a 12                	push   $0x12
c010086c:	ff 75 08             	pushl  0x8(%ebp)
c010086f:	6a 02                	push   $0x2
c0100871:	e8 3f 8d 00 00       	call   c01095b5 <send_rec>
c0100876:	83 c4 10             	add    $0x10,%esp
c0100879:	8b 45 08             	mov    0x8(%ebp),%eax
c010087c:	8b 40 78             	mov    0x78(%eax),%eax
c010087f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100882:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100886:	0f 84 d4 00 00 00    	je     c0100960 <hd_handle+0xff>
c010088c:	8b 45 08             	mov    0x8(%ebp),%eax
c010088f:	8b 00                	mov    (%eax),%eax
c0100891:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100894:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100898:	74 28                	je     c01008c2 <hd_handle+0x61>
c010089a:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c010089e:	74 22                	je     c01008c2 <hd_handle+0x61>
c01008a0:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008a4:	74 1c                	je     c01008c2 <hd_handle+0x61>
c01008a6:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008aa:	74 16                	je     c01008c2 <hd_handle+0x61>
c01008ac:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008b3:	74 0d                	je     c01008c2 <hd_handle+0x61>
c01008b5:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01008bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01008c2:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008c6:	74 34                	je     c01008fc <hd_handle+0x9b>
c01008c8:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008cc:	74 2e                	je     c01008fc <hd_handle+0x9b>
c01008ce:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008d2:	74 28                	je     c01008fc <hd_handle+0x9b>
c01008d4:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008d8:	74 22                	je     c01008fc <hd_handle+0x9b>
c01008da:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008e1:	74 19                	je     c01008fc <hd_handle+0x9b>
c01008e3:	6a 6d                	push   $0x6d
c01008e5:	68 34 b1 10 c0       	push   $0xc010b134
c01008ea:	68 34 b1 10 c0       	push   $0xc010b134
c01008ef:	68 3c b1 10 c0       	push   $0xc010b13c
c01008f4:	e8 4c 80 00 00       	call   c0108945 <assertion_failure>
c01008f9:	83 c4 10             	add    $0x10,%esp
c01008fc:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100900:	74 2c                	je     c010092e <hd_handle+0xcd>
c0100902:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100906:	77 0e                	ja     c0100916 <hd_handle+0xb5>
c0100908:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010090c:	74 19                	je     c0100927 <hd_handle+0xc6>
c010090e:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100912:	74 1a                	je     c010092e <hd_handle+0xcd>
c0100914:	eb 37                	jmp    c010094d <hd_handle+0xec>
c0100916:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c010091a:	74 22                	je     c010093e <hd_handle+0xdd>
c010091c:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100923:	74 3e                	je     c0100963 <hd_handle+0x102>
c0100925:	eb 26                	jmp    c010094d <hd_handle+0xec>
c0100927:	e8 e6 06 00 00       	call   c0101012 <hd_open>
c010092c:	eb 36                	jmp    c0100964 <hd_handle+0x103>
c010092e:	83 ec 0c             	sub    $0xc,%esp
c0100931:	ff 75 08             	pushl  0x8(%ebp)
c0100934:	e8 b2 08 00 00       	call   c01011eb <hd_rdwt>
c0100939:	83 c4 10             	add    $0x10,%esp
c010093c:	eb 26                	jmp    c0100964 <hd_handle+0x103>
c010093e:	83 ec 0c             	sub    $0xc,%esp
c0100941:	6a 00                	push   $0x0
c0100943:	e8 71 07 00 00       	call   c01010b9 <get_hd_ioctl>
c0100948:	83 c4 10             	add    $0x10,%esp
c010094b:	eb 17                	jmp    c0100964 <hd_handle+0x103>
c010094d:	83 ec 0c             	sub    $0xc,%esp
c0100950:	68 96 b1 10 c0       	push   $0xc010b196
c0100955:	e8 a7 7f 00 00       	call   c0108901 <spin>
c010095a:	83 c4 10             	add    $0x10,%esp
c010095d:	90                   	nop
c010095e:	eb 04                	jmp    c0100964 <hd_handle+0x103>
c0100960:	90                   	nop
c0100961:	eb 01                	jmp    c0100964 <hd_handle+0x103>
c0100963:	90                   	nop
c0100964:	c9                   	leave  
c0100965:	c3                   	ret    

c0100966 <hd_cmd_out>:
c0100966:	55                   	push   %ebp
c0100967:	89 e5                	mov    %esp,%ebp
c0100969:	83 ec 08             	sub    $0x8,%esp
c010096c:	83 ec 04             	sub    $0x4,%esp
c010096f:	68 18 73 01 00       	push   $0x17318
c0100974:	6a 00                	push   $0x0
c0100976:	68 80 00 00 00       	push   $0x80
c010097b:	e8 52 0b 00 00       	call   c01014d2 <waitfor>
c0100980:	83 c4 10             	add    $0x10,%esp
c0100983:	85 c0                	test   %eax,%eax
c0100985:	75 10                	jne    c0100997 <hd_cmd_out+0x31>
c0100987:	83 ec 0c             	sub    $0xc,%esp
c010098a:	68 a8 b1 10 c0       	push   $0xc010b1a8
c010098f:	e8 93 7f 00 00       	call   c0108927 <panic>
c0100994:	83 c4 10             	add    $0x10,%esp
c0100997:	83 ec 08             	sub    $0x8,%esp
c010099a:	6a 00                	push   $0x0
c010099c:	68 f6 03 00 00       	push   $0x3f6
c01009a1:	e8 4a f9 ff ff       	call   c01002f0 <out_byte>
c01009a6:	83 c4 10             	add    $0x10,%esp
c01009a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01009ac:	0f b6 00             	movzbl (%eax),%eax
c01009af:	0f b6 c0             	movzbl %al,%eax
c01009b2:	83 ec 08             	sub    $0x8,%esp
c01009b5:	50                   	push   %eax
c01009b6:	68 f1 01 00 00       	push   $0x1f1
c01009bb:	e8 30 f9 ff ff       	call   c01002f0 <out_byte>
c01009c0:	83 c4 10             	add    $0x10,%esp
c01009c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01009c6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01009ca:	0f b6 c0             	movzbl %al,%eax
c01009cd:	83 ec 08             	sub    $0x8,%esp
c01009d0:	50                   	push   %eax
c01009d1:	68 f2 01 00 00       	push   $0x1f2
c01009d6:	e8 15 f9 ff ff       	call   c01002f0 <out_byte>
c01009db:	83 c4 10             	add    $0x10,%esp
c01009de:	8b 45 08             	mov    0x8(%ebp),%eax
c01009e1:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c01009e5:	0f b6 c0             	movzbl %al,%eax
c01009e8:	83 ec 08             	sub    $0x8,%esp
c01009eb:	50                   	push   %eax
c01009ec:	68 f3 01 00 00       	push   $0x1f3
c01009f1:	e8 fa f8 ff ff       	call   c01002f0 <out_byte>
c01009f6:	83 c4 10             	add    $0x10,%esp
c01009f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01009fc:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0100a00:	0f b6 c0             	movzbl %al,%eax
c0100a03:	83 ec 08             	sub    $0x8,%esp
c0100a06:	50                   	push   %eax
c0100a07:	68 f4 01 00 00       	push   $0x1f4
c0100a0c:	e8 df f8 ff ff       	call   c01002f0 <out_byte>
c0100a11:	83 c4 10             	add    $0x10,%esp
c0100a14:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a17:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100a1b:	0f b6 c0             	movzbl %al,%eax
c0100a1e:	83 ec 08             	sub    $0x8,%esp
c0100a21:	50                   	push   %eax
c0100a22:	68 f5 01 00 00       	push   $0x1f5
c0100a27:	e8 c4 f8 ff ff       	call   c01002f0 <out_byte>
c0100a2c:	83 c4 10             	add    $0x10,%esp
c0100a2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a32:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0100a36:	0f b6 c0             	movzbl %al,%eax
c0100a39:	83 ec 08             	sub    $0x8,%esp
c0100a3c:	50                   	push   %eax
c0100a3d:	68 f6 01 00 00       	push   $0x1f6
c0100a42:	e8 a9 f8 ff ff       	call   c01002f0 <out_byte>
c0100a47:	83 c4 10             	add    $0x10,%esp
c0100a4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a4d:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100a51:	0f b6 c0             	movzbl %al,%eax
c0100a54:	83 ec 08             	sub    $0x8,%esp
c0100a57:	50                   	push   %eax
c0100a58:	68 f7 01 00 00       	push   $0x1f7
c0100a5d:	e8 8e f8 ff ff       	call   c01002f0 <out_byte>
c0100a62:	83 c4 10             	add    $0x10,%esp
c0100a65:	90                   	nop
c0100a66:	c9                   	leave  
c0100a67:	c3                   	ret    

c0100a68 <hd_identify>:
c0100a68:	55                   	push   %ebp
c0100a69:	89 e5                	mov    %esp,%ebp
c0100a6b:	53                   	push   %ebx
c0100a6c:	83 ec 24             	sub    $0x24,%esp
c0100a6f:	89 e0                	mov    %esp,%eax
c0100a71:	89 c3                	mov    %eax,%ebx
c0100a73:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0100a77:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100a7b:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100a7f:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100a83:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0100a87:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a8a:	c1 e0 04             	shl    $0x4,%eax
c0100a8d:	83 c8 e0             	or     $0xffffffe0,%eax
c0100a90:	88 45 ea             	mov    %al,-0x16(%ebp)
c0100a93:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0100a97:	83 ec 0c             	sub    $0xc,%esp
c0100a9a:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100a9d:	50                   	push   %eax
c0100a9e:	e8 c3 fe ff ff       	call   c0100966 <hd_cmd_out>
c0100aa3:	83 c4 10             	add    $0x10,%esp
c0100aa6:	e8 f0 06 00 00       	call   c010119b <interrupt_wait>
c0100aab:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100ab2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ab5:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100ab8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100abb:	89 c2                	mov    %eax,%edx
c0100abd:	b8 10 00 00 00       	mov    $0x10,%eax
c0100ac2:	83 e8 01             	sub    $0x1,%eax
c0100ac5:	01 d0                	add    %edx,%eax
c0100ac7:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100acc:	ba 00 00 00 00       	mov    $0x0,%edx
c0100ad1:	f7 f1                	div    %ecx
c0100ad3:	6b c0 10             	imul   $0x10,%eax,%eax
c0100ad6:	29 c4                	sub    %eax,%esp
c0100ad8:	89 e0                	mov    %esp,%eax
c0100ada:	83 c0 00             	add    $0x0,%eax
c0100add:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100ae0:	83 ec 04             	sub    $0x4,%esp
c0100ae3:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ae6:	6a 00                	push   $0x0
c0100ae8:	ff 75 ec             	pushl  -0x14(%ebp)
c0100aeb:	e8 df b6 00 00       	call   c010c1cf <Memset>
c0100af0:	83 c4 10             	add    $0x10,%esp
c0100af3:	83 ec 04             	sub    $0x4,%esp
c0100af6:	ff 75 f4             	pushl  -0xc(%ebp)
c0100af9:	ff 75 ec             	pushl  -0x14(%ebp)
c0100afc:	68 f0 01 00 00       	push   $0x1f0
c0100b01:	e8 1d b7 00 00       	call   c010c223 <read_port>
c0100b06:	83 c4 10             	add    $0x10,%esp
c0100b09:	83 ec 0c             	sub    $0xc,%esp
c0100b0c:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b0f:	e8 0b 00 00 00       	call   c0100b1f <print_hdinfo>
c0100b14:	83 c4 10             	add    $0x10,%esp
c0100b17:	89 dc                	mov    %ebx,%esp
c0100b19:	90                   	nop
c0100b1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b1d:	c9                   	leave  
c0100b1e:	c3                   	ret    

c0100b1f <print_hdinfo>:
c0100b1f:	55                   	push   %ebp
c0100b20:	89 e5                	mov    %esp,%ebp
c0100b22:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100b28:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100b2e:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100b34:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100b3b:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100b42:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100b49:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100b50:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100b57:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100b5d:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100b63:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100b6a:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100b71:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100b78:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100b7f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100b86:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100b8d:	e9 8f 00 00 00       	jmp    c0100c21 <print_hdinfo+0x102>
c0100b92:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100b99:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100b9c:	89 d0                	mov    %edx,%eax
c0100b9e:	01 c0                	add    %eax,%eax
c0100ba0:	01 d0                	add    %edx,%eax
c0100ba2:	c1 e0 03             	shl    $0x3,%eax
c0100ba5:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ba8:	01 c8                	add    %ecx,%eax
c0100baa:	83 e8 44             	sub    $0x44,%eax
c0100bad:	0f b7 00             	movzwl (%eax),%eax
c0100bb0:	0f b7 c0             	movzwl %ax,%eax
c0100bb3:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100bb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bb9:	01 d0                	add    %edx,%eax
c0100bbb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100bbe:	eb 30                	jmp    c0100bf0 <print_hdinfo+0xd1>
c0100bc0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bc3:	8d 50 01             	lea    0x1(%eax),%edx
c0100bc6:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100bc9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100bcc:	83 c2 01             	add    $0x1,%edx
c0100bcf:	0f b6 00             	movzbl (%eax),%eax
c0100bd2:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100bd6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bd9:	8d 50 01             	lea    0x1(%eax),%edx
c0100bdc:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100bdf:	0f b6 00             	movzbl (%eax),%eax
c0100be2:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100be5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100be8:	01 ca                	add    %ecx,%edx
c0100bea:	88 02                	mov    %al,(%edx)
c0100bec:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100bf0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100bf3:	89 d0                	mov    %edx,%eax
c0100bf5:	01 c0                	add    %eax,%eax
c0100bf7:	01 d0                	add    %edx,%eax
c0100bf9:	c1 e0 03             	shl    $0x3,%eax
c0100bfc:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100bff:	01 c8                	add    %ecx,%eax
c0100c01:	83 e8 42             	sub    $0x42,%eax
c0100c04:	0f b7 00             	movzwl (%eax),%eax
c0100c07:	66 d1 e8             	shr    %ax
c0100c0a:	0f b7 c0             	movzwl %ax,%eax
c0100c0d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100c10:	7c ae                	jl     c0100bc0 <print_hdinfo+0xa1>
c0100c12:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100c15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c18:	01 d0                	add    %edx,%eax
c0100c1a:	c6 00 00             	movb   $0x0,(%eax)
c0100c1d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100c21:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100c25:	0f 8e 67 ff ff ff    	jle    c0100b92 <print_hdinfo+0x73>
c0100c2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c2e:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100c32:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100c36:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100c3a:	66 c1 e8 08          	shr    $0x8,%ax
c0100c3e:	66 85 c0             	test   %ax,%ax
c0100c41:	0f 95 c0             	setne  %al
c0100c44:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100c47:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100c4e:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100c54:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100c58:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100c5c:	75 15                	jne    c0100c73 <print_hdinfo+0x154>
c0100c5e:	83 ec 08             	sub    $0x8,%esp
c0100c61:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100c64:	50                   	push   %eax
c0100c65:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c68:	50                   	push   %eax
c0100c69:	e8 80 b5 00 00       	call   c010c1ee <Strcpy>
c0100c6e:	83 c4 10             	add    $0x10,%esp
c0100c71:	eb 13                	jmp    c0100c86 <print_hdinfo+0x167>
c0100c73:	83 ec 08             	sub    $0x8,%esp
c0100c76:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c79:	50                   	push   %eax
c0100c7a:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c7d:	50                   	push   %eax
c0100c7e:	e8 6b b5 00 00       	call   c010c1ee <Strcpy>
c0100c83:	83 c4 10             	add    $0x10,%esp
c0100c86:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c89:	83 c0 7a             	add    $0x7a,%eax
c0100c8c:	0f b7 00             	movzwl (%eax),%eax
c0100c8f:	0f b7 d0             	movzwl %ax,%edx
c0100c92:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c95:	83 c0 78             	add    $0x78,%eax
c0100c98:	0f b7 00             	movzwl (%eax),%eax
c0100c9b:	0f b7 c0             	movzwl %ax,%eax
c0100c9e:	83 c0 10             	add    $0x10,%eax
c0100ca1:	89 c1                	mov    %eax,%ecx
c0100ca3:	d3 e2                	shl    %cl,%edx
c0100ca5:	89 d0                	mov    %edx,%eax
c0100ca7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100caa:	90                   	nop
c0100cab:	c9                   	leave  
c0100cac:	c3                   	ret    

c0100cad <print_dpt_entry>:
c0100cad:	55                   	push   %ebp
c0100cae:	89 e5                	mov    %esp,%ebp
c0100cb0:	83 ec 08             	sub    $0x8,%esp
c0100cb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cb6:	8b 40 08             	mov    0x8(%eax),%eax
c0100cb9:	83 ec 08             	sub    $0x8,%esp
c0100cbc:	50                   	push   %eax
c0100cbd:	68 b2 b1 10 c0       	push   $0xc010b1b2
c0100cc2:	e8 21 79 00 00       	call   c01085e8 <Printf>
c0100cc7:	83 c4 10             	add    $0x10,%esp
c0100cca:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ccd:	8b 40 0c             	mov    0xc(%eax),%eax
c0100cd0:	83 ec 08             	sub    $0x8,%esp
c0100cd3:	50                   	push   %eax
c0100cd4:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100cd9:	e8 0a 79 00 00       	call   c01085e8 <Printf>
c0100cde:	83 c4 10             	add    $0x10,%esp
c0100ce1:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ce4:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100ce8:	0f b6 c0             	movzbl %al,%eax
c0100ceb:	83 ec 08             	sub    $0x8,%esp
c0100cee:	50                   	push   %eax
c0100cef:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100cf4:	e8 ef 78 00 00       	call   c01085e8 <Printf>
c0100cf9:	83 c4 10             	add    $0x10,%esp
c0100cfc:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cff:	0f b6 00             	movzbl (%eax),%eax
c0100d02:	0f b6 c0             	movzbl %al,%eax
c0100d05:	83 ec 08             	sub    $0x8,%esp
c0100d08:	50                   	push   %eax
c0100d09:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100d0e:	e8 d5 78 00 00       	call   c01085e8 <Printf>
c0100d13:	83 c4 10             	add    $0x10,%esp
c0100d16:	90                   	nop
c0100d17:	c9                   	leave  
c0100d18:	c3                   	ret    

c0100d19 <get_partition_table>:
c0100d19:	55                   	push   %ebp
c0100d1a:	89 e5                	mov    %esp,%ebp
c0100d1c:	53                   	push   %ebx
c0100d1d:	83 ec 24             	sub    $0x24,%esp
c0100d20:	89 e0                	mov    %esp,%eax
c0100d22:	89 c3                	mov    %eax,%ebx
c0100d24:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100d28:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100d2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d2f:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100d32:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d35:	c1 f8 08             	sar    $0x8,%eax
c0100d38:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100d3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d3e:	c1 f8 10             	sar    $0x10,%eax
c0100d41:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100d44:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d47:	c1 f8 18             	sar    $0x18,%eax
c0100d4a:	89 c2                	mov    %eax,%edx
c0100d4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d4f:	c1 e0 04             	shl    $0x4,%eax
c0100d52:	09 d0                	or     %edx,%eax
c0100d54:	83 c8 e0             	or     $0xffffffe0,%eax
c0100d57:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100d5a:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100d5e:	83 ec 0c             	sub    $0xc,%esp
c0100d61:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100d64:	50                   	push   %eax
c0100d65:	e8 fc fb ff ff       	call   c0100966 <hd_cmd_out>
c0100d6a:	83 c4 10             	add    $0x10,%esp
c0100d6d:	e8 29 04 00 00       	call   c010119b <interrupt_wait>
c0100d72:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100d79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d7c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100d7f:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100d82:	89 c2                	mov    %eax,%edx
c0100d84:	b8 10 00 00 00       	mov    $0x10,%eax
c0100d89:	83 e8 01             	sub    $0x1,%eax
c0100d8c:	01 d0                	add    %edx,%eax
c0100d8e:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100d93:	ba 00 00 00 00       	mov    $0x0,%edx
c0100d98:	f7 f1                	div    %ecx
c0100d9a:	6b c0 10             	imul   $0x10,%eax,%eax
c0100d9d:	29 c4                	sub    %eax,%esp
c0100d9f:	89 e0                	mov    %esp,%eax
c0100da1:	83 c0 00             	add    $0x0,%eax
c0100da4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100da7:	83 ec 04             	sub    $0x4,%esp
c0100daa:	ff 75 f4             	pushl  -0xc(%ebp)
c0100dad:	6a 00                	push   $0x0
c0100daf:	ff 75 ec             	pushl  -0x14(%ebp)
c0100db2:	e8 18 b4 00 00       	call   c010c1cf <Memset>
c0100db7:	83 c4 10             	add    $0x10,%esp
c0100dba:	83 ec 04             	sub    $0x4,%esp
c0100dbd:	ff 75 f4             	pushl  -0xc(%ebp)
c0100dc0:	ff 75 ec             	pushl  -0x14(%ebp)
c0100dc3:	68 f0 01 00 00       	push   $0x1f0
c0100dc8:	e8 56 b4 00 00       	call   c010c223 <read_port>
c0100dcd:	83 c4 10             	add    $0x10,%esp
c0100dd0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100dd3:	05 be 01 00 00       	add    $0x1be,%eax
c0100dd8:	83 ec 04             	sub    $0x4,%esp
c0100ddb:	6a 40                	push   $0x40
c0100ddd:	50                   	push   %eax
c0100dde:	ff 75 10             	pushl  0x10(%ebp)
c0100de1:	e8 46 5f 00 00       	call   c0106d2c <Memcpy>
c0100de6:	83 c4 10             	add    $0x10,%esp
c0100de9:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100df0:	89 dc                	mov    %ebx,%esp
c0100df2:	90                   	nop
c0100df3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100df6:	c9                   	leave  
c0100df7:	c3                   	ret    

c0100df8 <partition>:
c0100df8:	55                   	push   %ebp
c0100df9:	89 e5                	mov    %esp,%ebp
c0100dfb:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100e01:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100e04:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100e07:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100e0b:	7f 19                	jg     c0100e26 <partition+0x2e>
c0100e0d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100e10:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100e15:	89 c8                	mov    %ecx,%eax
c0100e17:	f7 ea                	imul   %edx
c0100e19:	d1 fa                	sar    %edx
c0100e1b:	89 c8                	mov    %ecx,%eax
c0100e1d:	c1 f8 1f             	sar    $0x1f,%eax
c0100e20:	29 c2                	sub    %eax,%edx
c0100e22:	89 d0                	mov    %edx,%eax
c0100e24:	eb 11                	jmp    c0100e37 <partition+0x3f>
c0100e26:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e29:	83 e8 10             	sub    $0x10,%eax
c0100e2c:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100e2f:	85 c0                	test   %eax,%eax
c0100e31:	0f 48 c2             	cmovs  %edx,%eax
c0100e34:	c1 f8 06             	sar    $0x6,%eax
c0100e37:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100e3a:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100e3e:	0f 85 cc 00 00 00    	jne    c0100f10 <partition+0x118>
c0100e44:	83 ec 04             	sub    $0x4,%esp
c0100e47:	6a 40                	push   $0x40
c0100e49:	6a 00                	push   $0x0
c0100e4b:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e4e:	50                   	push   %eax
c0100e4f:	e8 7b b3 00 00       	call   c010c1cf <Memset>
c0100e54:	83 c4 10             	add    $0x10,%esp
c0100e57:	83 ec 04             	sub    $0x4,%esp
c0100e5a:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e5d:	50                   	push   %eax
c0100e5e:	6a 00                	push   $0x0
c0100e60:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e63:	e8 b1 fe ff ff       	call   c0100d19 <get_partition_table>
c0100e68:	83 c4 10             	add    $0x10,%esp
c0100e6b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e72:	e9 8a 00 00 00       	jmp    c0100f01 <partition+0x109>
c0100e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e7a:	83 c0 01             	add    $0x1,%eax
c0100e7d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100e80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e83:	c1 e0 04             	shl    $0x4,%eax
c0100e86:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e89:	01 c8                	add    %ecx,%eax
c0100e8b:	83 e8 5c             	sub    $0x5c,%eax
c0100e8e:	8b 00                	mov    (%eax),%eax
c0100e90:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e93:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e96:	c1 e1 03             	shl    $0x3,%ecx
c0100e99:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e9f:	01 ca                	add    %ecx,%edx
c0100ea1:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100ea7:	89 02                	mov    %eax,(%edx)
c0100ea9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100eac:	c1 e0 04             	shl    $0x4,%eax
c0100eaf:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100eb2:	01 c8                	add    %ecx,%eax
c0100eb4:	83 e8 58             	sub    $0x58,%eax
c0100eb7:	8b 00                	mov    (%eax),%eax
c0100eb9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100ebc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100ebf:	c1 e1 03             	shl    $0x3,%ecx
c0100ec2:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ec8:	01 ca                	add    %ecx,%edx
c0100eca:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100ed0:	89 02                	mov    %eax,(%edx)
c0100ed2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ed5:	c1 e0 04             	shl    $0x4,%eax
c0100ed8:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100edb:	01 c8                	add    %ecx,%eax
c0100edd:	83 e8 60             	sub    $0x60,%eax
c0100ee0:	0f b6 00             	movzbl (%eax),%eax
c0100ee3:	3c 05                	cmp    $0x5,%al
c0100ee5:	75 16                	jne    c0100efd <partition+0x105>
c0100ee7:	8b 55 08             	mov    0x8(%ebp),%edx
c0100eea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100eed:	01 d0                	add    %edx,%eax
c0100eef:	83 ec 08             	sub    $0x8,%esp
c0100ef2:	6a 01                	push   $0x1
c0100ef4:	50                   	push   %eax
c0100ef5:	e8 fe fe ff ff       	call   c0100df8 <partition>
c0100efa:	83 c4 10             	add    $0x10,%esp
c0100efd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100f01:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100f05:	0f 8e 6c ff ff ff    	jle    c0100e77 <partition+0x7f>
c0100f0b:	e9 ff 00 00 00       	jmp    c010100f <partition+0x217>
c0100f10:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100f14:	0f 85 f5 00 00 00    	jne    c010100f <partition+0x217>
c0100f1a:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f1d:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100f22:	89 c8                	mov    %ecx,%eax
c0100f24:	f7 ea                	imul   %edx
c0100f26:	d1 fa                	sar    %edx
c0100f28:	89 c8                	mov    %ecx,%eax
c0100f2a:	c1 f8 1f             	sar    $0x1f,%eax
c0100f2d:	29 c2                	sub    %eax,%edx
c0100f2f:	89 d0                	mov    %edx,%eax
c0100f31:	c1 e0 02             	shl    $0x2,%eax
c0100f34:	01 d0                	add    %edx,%eax
c0100f36:	29 c1                	sub    %eax,%ecx
c0100f38:	89 c8                	mov    %ecx,%eax
c0100f3a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100f3d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100f40:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f43:	c1 e2 03             	shl    $0x3,%edx
c0100f46:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f4c:	01 d0                	add    %edx,%eax
c0100f4e:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f53:	8b 00                	mov    (%eax),%eax
c0100f55:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100f58:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f5e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100f61:	83 e8 01             	sub    $0x1,%eax
c0100f64:	c1 e0 04             	shl    $0x4,%eax
c0100f67:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100f6a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100f71:	e9 8c 00 00 00       	jmp    c0101002 <partition+0x20a>
c0100f76:	83 ec 04             	sub    $0x4,%esp
c0100f79:	6a 40                	push   $0x40
c0100f7b:	6a 00                	push   $0x0
c0100f7d:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f80:	50                   	push   %eax
c0100f81:	e8 49 b2 00 00       	call   c010c1cf <Memset>
c0100f86:	83 c4 10             	add    $0x10,%esp
c0100f89:	83 ec 04             	sub    $0x4,%esp
c0100f8c:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f8f:	50                   	push   %eax
c0100f90:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f93:	ff 75 e8             	pushl  -0x18(%ebp)
c0100f96:	e8 7e fd ff ff       	call   c0100d19 <get_partition_table>
c0100f9b:	83 c4 10             	add    $0x10,%esp
c0100f9e:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100fa1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fa4:	01 d0                	add    %edx,%eax
c0100fa6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100fa9:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100fac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100faf:	01 c2                	add    %eax,%edx
c0100fb1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100fb4:	8d 48 04             	lea    0x4(%eax),%ecx
c0100fb7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100fba:	c1 e1 03             	shl    $0x3,%ecx
c0100fbd:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100fc3:	01 c8                	add    %ecx,%eax
c0100fc5:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100fca:	89 10                	mov    %edx,(%eax)
c0100fcc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100fcf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100fd2:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100fd5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100fd8:	c1 e1 03             	shl    $0x3,%ecx
c0100fdb:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100fe1:	01 ca                	add    %ecx,%edx
c0100fe3:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100fe9:	89 02                	mov    %eax,(%edx)
c0100feb:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100fef:	84 c0                	test   %al,%al
c0100ff1:	74 1b                	je     c010100e <partition+0x216>
c0100ff3:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100ff6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100ff9:	01 d0                	add    %edx,%eax
c0100ffb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100ffe:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101002:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0101006:	0f 8e 6a ff ff ff    	jle    c0100f76 <partition+0x17e>
c010100c:	eb 01                	jmp    c010100f <partition+0x217>
c010100e:	90                   	nop
c010100f:	90                   	nop
c0101010:	c9                   	leave  
c0101011:	c3                   	ret    

c0101012 <hd_open>:
c0101012:	55                   	push   %ebp
c0101013:	89 e5                	mov    %esp,%ebp
c0101015:	83 ec 18             	sub    $0x18,%esp
c0101018:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010101f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101022:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101028:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c010102d:	8b 00                	mov    (%eax),%eax
c010102f:	8d 50 01             	lea    0x1(%eax),%edx
c0101032:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101035:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010103b:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0101040:	89 10                	mov    %edx,(%eax)
c0101042:	83 ec 0c             	sub    $0xc,%esp
c0101045:	6a 00                	push   $0x0
c0101047:	e8 1c fa ff ff       	call   c0100a68 <hd_identify>
c010104c:	83 c4 10             	add    $0x10,%esp
c010104f:	83 ec 08             	sub    $0x8,%esp
c0101052:	6a 00                	push   $0x0
c0101054:	6a 00                	push   $0x0
c0101056:	e8 9d fd ff ff       	call   c0100df8 <partition>
c010105b:	83 c4 10             	add    $0x10,%esp
c010105e:	83 ec 0c             	sub    $0xc,%esp
c0101061:	6a 7c                	push   $0x7c
c0101063:	e8 14 06 00 00       	call   c010167c <sys_malloc>
c0101068:	83 c4 10             	add    $0x10,%esp
c010106b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010106e:	83 ec 04             	sub    $0x4,%esp
c0101071:	6a 7c                	push   $0x7c
c0101073:	6a 00                	push   $0x0
c0101075:	ff 75 f0             	pushl  -0x10(%ebp)
c0101078:	e8 52 b1 00 00       	call   c010c1cf <Memset>
c010107d:	83 c4 10             	add    $0x10,%esp
c0101080:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101083:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010108a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010108d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101094:	83 ec 04             	sub    $0x4,%esp
c0101097:	6a 02                	push   $0x2
c0101099:	ff 75 f0             	pushl  -0x10(%ebp)
c010109c:	6a 01                	push   $0x1
c010109e:	e8 12 85 00 00       	call   c01095b5 <send_rec>
c01010a3:	83 c4 10             	add    $0x10,%esp
c01010a6:	83 ec 08             	sub    $0x8,%esp
c01010a9:	6a 7c                	push   $0x7c
c01010ab:	ff 75 f0             	pushl  -0x10(%ebp)
c01010ae:	e8 de 05 00 00       	call   c0101691 <sys_free>
c01010b3:	83 c4 10             	add    $0x10,%esp
c01010b6:	90                   	nop
c01010b7:	c9                   	leave  
c01010b8:	c3                   	ret    

c01010b9 <get_hd_ioctl>:
c01010b9:	55                   	push   %ebp
c01010ba:	89 e5                	mov    %esp,%ebp
c01010bc:	83 ec 18             	sub    $0x18,%esp
c01010bf:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c01010c3:	7f 19                	jg     c01010de <get_hd_ioctl+0x25>
c01010c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01010c8:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01010cd:	89 c8                	mov    %ecx,%eax
c01010cf:	f7 ea                	imul   %edx
c01010d1:	d1 fa                	sar    %edx
c01010d3:	89 c8                	mov    %ecx,%eax
c01010d5:	c1 f8 1f             	sar    $0x1f,%eax
c01010d8:	29 c2                	sub    %eax,%edx
c01010da:	89 d0                	mov    %edx,%eax
c01010dc:	eb 11                	jmp    c01010ef <get_hd_ioctl+0x36>
c01010de:	8b 45 08             	mov    0x8(%ebp),%eax
c01010e1:	83 e8 10             	sub    $0x10,%eax
c01010e4:	8d 50 3f             	lea    0x3f(%eax),%edx
c01010e7:	85 c0                	test   %eax,%eax
c01010e9:	0f 48 c2             	cmovs  %edx,%eax
c01010ec:	c1 f8 06             	sar    $0x6,%eax
c01010ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010f2:	8b 55 08             	mov    0x8(%ebp),%edx
c01010f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010f8:	c1 e2 03             	shl    $0x3,%edx
c01010fb:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101101:	01 d0                	add    %edx,%eax
c0101103:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c0101108:	8b 00                	mov    (%eax),%eax
c010110a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010110d:	83 ec 0c             	sub    $0xc,%esp
c0101110:	6a 7c                	push   $0x7c
c0101112:	e8 65 05 00 00       	call   c010167c <sys_malloc>
c0101117:	83 c4 10             	add    $0x10,%esp
c010111a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010111d:	83 ec 04             	sub    $0x4,%esp
c0101120:	6a 7c                	push   $0x7c
c0101122:	6a 00                	push   $0x0
c0101124:	ff 75 ec             	pushl  -0x14(%ebp)
c0101127:	e8 a3 b0 00 00       	call   c010c1cf <Memset>
c010112c:	83 c4 10             	add    $0x10,%esp
c010112f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101132:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101139:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010113c:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101143:	83 ec 04             	sub    $0x4,%esp
c0101146:	6a 02                	push   $0x2
c0101148:	ff 75 ec             	pushl  -0x14(%ebp)
c010114b:	6a 01                	push   $0x1
c010114d:	e8 63 84 00 00       	call   c01095b5 <send_rec>
c0101152:	83 c4 10             	add    $0x10,%esp
c0101155:	83 ec 08             	sub    $0x8,%esp
c0101158:	6a 7c                	push   $0x7c
c010115a:	ff 75 ec             	pushl  -0x14(%ebp)
c010115d:	e8 2f 05 00 00       	call   c0101691 <sys_free>
c0101162:	83 c4 10             	add    $0x10,%esp
c0101165:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101168:	c9                   	leave  
c0101169:	c3                   	ret    

c010116a <wait_for>:
c010116a:	55                   	push   %ebp
c010116b:	89 e5                	mov    %esp,%ebp
c010116d:	83 ec 08             	sub    $0x8,%esp
c0101170:	83 ec 04             	sub    $0x4,%esp
c0101173:	68 50 c3 00 00       	push   $0xc350
c0101178:	6a 08                	push   $0x8
c010117a:	6a 08                	push   $0x8
c010117c:	e8 51 03 00 00       	call   c01014d2 <waitfor>
c0101181:	83 c4 10             	add    $0x10,%esp
c0101184:	85 c0                	test   %eax,%eax
c0101186:	75 10                	jne    c0101198 <wait_for+0x2e>
c0101188:	83 ec 0c             	sub    $0xc,%esp
c010118b:	68 e4 b1 10 c0       	push   $0xc010b1e4
c0101190:	e8 92 77 00 00       	call   c0108927 <panic>
c0101195:	83 c4 10             	add    $0x10,%esp
c0101198:	90                   	nop
c0101199:	c9                   	leave  
c010119a:	c3                   	ret    

c010119b <interrupt_wait>:
c010119b:	55                   	push   %ebp
c010119c:	89 e5                	mov    %esp,%ebp
c010119e:	83 ec 18             	sub    $0x18,%esp
c01011a1:	83 ec 0c             	sub    $0xc,%esp
c01011a4:	6a 7c                	push   $0x7c
c01011a6:	e8 d1 04 00 00       	call   c010167c <sys_malloc>
c01011ab:	83 c4 10             	add    $0x10,%esp
c01011ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01011b1:	83 ec 04             	sub    $0x4,%esp
c01011b4:	6a 7c                	push   $0x7c
c01011b6:	6a 00                	push   $0x0
c01011b8:	ff 75 f4             	pushl  -0xc(%ebp)
c01011bb:	e8 0f b0 00 00       	call   c010c1cf <Memset>
c01011c0:	83 c4 10             	add    $0x10,%esp
c01011c3:	83 ec 04             	sub    $0x4,%esp
c01011c6:	68 13 02 00 00       	push   $0x213
c01011cb:	ff 75 f4             	pushl  -0xc(%ebp)
c01011ce:	6a 02                	push   $0x2
c01011d0:	e8 e0 83 00 00       	call   c01095b5 <send_rec>
c01011d5:	83 c4 10             	add    $0x10,%esp
c01011d8:	83 ec 08             	sub    $0x8,%esp
c01011db:	6a 7c                	push   $0x7c
c01011dd:	ff 75 f4             	pushl  -0xc(%ebp)
c01011e0:	e8 ac 04 00 00       	call   c0101691 <sys_free>
c01011e5:	83 c4 10             	add    $0x10,%esp
c01011e8:	90                   	nop
c01011e9:	c9                   	leave  
c01011ea:	c3                   	ret    

c01011eb <hd_rdwt>:
c01011eb:	55                   	push   %ebp
c01011ec:	89 e5                	mov    %esp,%ebp
c01011ee:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c01011f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01011f7:	8b 40 18             	mov    0x18(%eax),%eax
c01011fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01011fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0101200:	8b 40 14             	mov    0x14(%eax),%eax
c0101203:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101206:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c010120a:	7f 19                	jg     c0101225 <hd_rdwt+0x3a>
c010120c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c010120f:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101214:	89 c8                	mov    %ecx,%eax
c0101216:	f7 ea                	imul   %edx
c0101218:	d1 fa                	sar    %edx
c010121a:	89 c8                	mov    %ecx,%eax
c010121c:	c1 f8 1f             	sar    $0x1f,%eax
c010121f:	29 c2                	sub    %eax,%edx
c0101221:	89 d0                	mov    %edx,%eax
c0101223:	eb 11                	jmp    c0101236 <hd_rdwt+0x4b>
c0101225:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101228:	83 e8 10             	sub    $0x10,%eax
c010122b:	8d 50 3f             	lea    0x3f(%eax),%edx
c010122e:	85 c0                	test   %eax,%eax
c0101230:	0f 48 c2             	cmovs  %edx,%eax
c0101233:	c1 f8 06             	sar    $0x6,%eax
c0101236:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101239:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010123c:	8d 50 f0             	lea    -0x10(%eax),%edx
c010123f:	89 d0                	mov    %edx,%eax
c0101241:	c1 f8 1f             	sar    $0x1f,%eax
c0101244:	c1 e8 1a             	shr    $0x1a,%eax
c0101247:	01 c2                	add    %eax,%edx
c0101249:	83 e2 3f             	and    $0x3f,%edx
c010124c:	29 c2                	sub    %eax,%edx
c010124e:	89 d0                	mov    %edx,%eax
c0101250:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101253:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101256:	c1 e8 09             	shr    $0x9,%eax
c0101259:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010125c:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0101260:	7f 1a                	jg     c010127c <hd_rdwt+0x91>
c0101262:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101265:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101268:	c1 e2 03             	shl    $0x3,%edx
c010126b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101271:	01 d0                	add    %edx,%eax
c0101273:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101278:	8b 00                	mov    (%eax),%eax
c010127a:	eb 1b                	jmp    c0101297 <hd_rdwt+0xac>
c010127c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010127f:	8d 50 04             	lea    0x4(%eax),%edx
c0101282:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101285:	c1 e2 03             	shl    $0x3,%edx
c0101288:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010128e:	01 d0                	add    %edx,%eax
c0101290:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101295:	8b 00                	mov    (%eax),%eax
c0101297:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010129a:	01 d0                	add    %edx,%eax
c010129c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010129f:	8b 45 08             	mov    0x8(%ebp),%eax
c01012a2:	8b 40 0c             	mov    0xc(%eax),%eax
c01012a5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01012a8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012ab:	05 ff 01 00 00       	add    $0x1ff,%eax
c01012b0:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01012b6:	85 c0                	test   %eax,%eax
c01012b8:	0f 48 c2             	cmovs  %edx,%eax
c01012bb:	c1 f8 09             	sar    $0x9,%eax
c01012be:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01012c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01012c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01012ca:	8b 40 10             	mov    0x10(%eax),%eax
c01012cd:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01012d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01012d3:	8b 00                	mov    (%eax),%eax
c01012d5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01012d8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012db:	83 ec 08             	sub    $0x8,%esp
c01012de:	50                   	push   %eax
c01012df:	ff 75 d0             	pushl  -0x30(%ebp)
c01012e2:	e8 d8 4b 00 00       	call   c0105ebf <alloc_virtual_memory>
c01012e7:	83 c4 10             	add    $0x10,%esp
c01012ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01012ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01012f0:	8b 40 78             	mov    0x78(%eax),%eax
c01012f3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01012f6:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01012fa:	74 22                	je     c010131e <hd_rdwt+0x133>
c01012fc:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101300:	74 1c                	je     c010131e <hd_rdwt+0x133>
c0101302:	68 b7 01 00 00       	push   $0x1b7
c0101307:	68 34 b1 10 c0       	push   $0xc010b134
c010130c:	68 34 b1 10 c0       	push   $0xc010b134
c0101311:	68 f6 b1 10 c0       	push   $0xc010b1f6
c0101316:	e8 2a 76 00 00       	call   c0108945 <assertion_failure>
c010131b:	83 c4 10             	add    $0x10,%esp
c010131e:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0101322:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0101325:	88 45 be             	mov    %al,-0x42(%ebp)
c0101328:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010132b:	88 45 bf             	mov    %al,-0x41(%ebp)
c010132e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101331:	c1 f8 08             	sar    $0x8,%eax
c0101334:	88 45 c0             	mov    %al,-0x40(%ebp)
c0101337:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010133a:	c1 f8 10             	sar    $0x10,%eax
c010133d:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0101340:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101343:	c1 f8 18             	sar    $0x18,%eax
c0101346:	83 e0 0f             	and    $0xf,%eax
c0101349:	83 c8 e0             	or     $0xffffffe0,%eax
c010134c:	88 45 c2             	mov    %al,-0x3e(%ebp)
c010134f:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101353:	75 07                	jne    c010135c <hd_rdwt+0x171>
c0101355:	b8 20 00 00 00       	mov    $0x20,%eax
c010135a:	eb 05                	jmp    c0101361 <hd_rdwt+0x176>
c010135c:	b8 30 00 00 00       	mov    $0x30,%eax
c0101361:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0101364:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101368:	3c 20                	cmp    $0x20,%al
c010136a:	74 24                	je     c0101390 <hd_rdwt+0x1a5>
c010136c:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101370:	3c 30                	cmp    $0x30,%al
c0101372:	74 1c                	je     c0101390 <hd_rdwt+0x1a5>
c0101374:	68 c5 01 00 00       	push   $0x1c5
c0101379:	68 34 b1 10 c0       	push   $0xc010b134
c010137e:	68 34 b1 10 c0       	push   $0xc010b134
c0101383:	68 14 b2 10 c0       	push   $0xc010b214
c0101388:	e8 b8 75 00 00       	call   c0108945 <assertion_failure>
c010138d:	83 c4 10             	add    $0x10,%esp
c0101390:	83 ec 0c             	sub    $0xc,%esp
c0101393:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0101396:	50                   	push   %eax
c0101397:	e8 ca f5 ff ff       	call   c0100966 <hd_cmd_out>
c010139c:	83 c4 10             	add    $0x10,%esp
c010139f:	e9 9c 00 00 00       	jmp    c0101440 <hd_rdwt+0x255>
c01013a4:	b8 00 02 00 00       	mov    $0x200,%eax
c01013a9:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c01013b0:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c01013b4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01013b7:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01013bb:	75 51                	jne    c010140e <hd_rdwt+0x223>
c01013bd:	e8 a8 fd ff ff       	call   c010116a <wait_for>
c01013c2:	e8 d4 fd ff ff       	call   c010119b <interrupt_wait>
c01013c7:	83 ec 04             	sub    $0x4,%esp
c01013ca:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013cd:	6a 00                	push   $0x0
c01013cf:	68 80 11 11 c0       	push   $0xc0111180
c01013d4:	e8 f6 ad 00 00       	call   c010c1cf <Memset>
c01013d9:	83 c4 10             	add    $0x10,%esp
c01013dc:	83 ec 04             	sub    $0x4,%esp
c01013df:	68 00 02 00 00       	push   $0x200
c01013e4:	68 80 11 11 c0       	push   $0xc0111180
c01013e9:	68 f0 01 00 00       	push   $0x1f0
c01013ee:	e8 30 ae 00 00       	call   c010c223 <read_port>
c01013f3:	83 c4 10             	add    $0x10,%esp
c01013f6:	83 ec 04             	sub    $0x4,%esp
c01013f9:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013fc:	68 80 11 11 c0       	push   $0xc0111180
c0101401:	ff 75 f0             	pushl  -0x10(%ebp)
c0101404:	e8 23 59 00 00       	call   c0106d2c <Memcpy>
c0101409:	83 c4 10             	add    $0x10,%esp
c010140c:	eb 26                	jmp    c0101434 <hd_rdwt+0x249>
c010140e:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101412:	75 20                	jne    c0101434 <hd_rdwt+0x249>
c0101414:	e8 51 fd ff ff       	call   c010116a <wait_for>
c0101419:	83 ec 04             	sub    $0x4,%esp
c010141c:	ff 75 c4             	pushl  -0x3c(%ebp)
c010141f:	ff 75 f0             	pushl  -0x10(%ebp)
c0101422:	68 f0 01 00 00       	push   $0x1f0
c0101427:	e8 0b ae 00 00       	call   c010c237 <write_port>
c010142c:	83 c4 10             	add    $0x10,%esp
c010142f:	e8 67 fd ff ff       	call   c010119b <interrupt_wait>
c0101434:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101437:	29 45 f4             	sub    %eax,-0xc(%ebp)
c010143a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010143d:	01 45 f0             	add    %eax,-0x10(%ebp)
c0101440:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101444:	0f 85 5a ff ff ff    	jne    c01013a4 <hd_rdwt+0x1b9>
c010144a:	83 ec 04             	sub    $0x4,%esp
c010144d:	6a 7c                	push   $0x7c
c010144f:	6a 00                	push   $0x0
c0101451:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101457:	50                   	push   %eax
c0101458:	e8 72 ad 00 00       	call   c010c1cf <Memset>
c010145d:	83 c4 10             	add    $0x10,%esp
c0101460:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0101467:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c010146e:	00 00 00 
c0101471:	83 ec 04             	sub    $0x4,%esp
c0101474:	6a 02                	push   $0x2
c0101476:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010147c:	50                   	push   %eax
c010147d:	6a 01                	push   $0x1
c010147f:	e8 31 81 00 00       	call   c01095b5 <send_rec>
c0101484:	83 c4 10             	add    $0x10,%esp
c0101487:	90                   	nop
c0101488:	c9                   	leave  
c0101489:	c3                   	ret    

c010148a <hd_handler>:
c010148a:	55                   	push   %ebp
c010148b:	89 e5                	mov    %esp,%ebp
c010148d:	83 ec 18             	sub    $0x18,%esp
c0101490:	83 ec 0c             	sub    $0xc,%esp
c0101493:	68 f7 01 00 00       	push   $0x1f7
c0101498:	e8 47 ee ff ff       	call   c01002e4 <in_byte>
c010149d:	83 c4 10             	add    $0x10,%esp
c01014a0:	0f b6 c0             	movzbl %al,%eax
c01014a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01014a6:	83 ec 0c             	sub    $0xc,%esp
c01014a9:	6a 03                	push   $0x3
c01014ab:	e8 9f 83 00 00       	call   c010984f <inform_int>
c01014b0:	83 c4 10             	add    $0x10,%esp
c01014b3:	90                   	nop
c01014b4:	c9                   	leave  
c01014b5:	c3                   	ret    

c01014b6 <net_handler>:
c01014b6:	55                   	push   %ebp
c01014b7:	89 e5                	mov    %esp,%ebp
c01014b9:	83 ec 08             	sub    $0x8,%esp
c01014bc:	83 ec 0c             	sub    $0xc,%esp
c01014bf:	68 48 b2 10 c0       	push   $0xc010b248
c01014c4:	e8 1f 71 00 00       	call   c01085e8 <Printf>
c01014c9:	83 c4 10             	add    $0x10,%esp
c01014cc:	66 87 db             	xchg   %bx,%bx
c01014cf:	90                   	nop
c01014d0:	c9                   	leave  
c01014d1:	c3                   	ret    

c01014d2 <waitfor>:
c01014d2:	55                   	push   %ebp
c01014d3:	89 e5                	mov    %esp,%ebp
c01014d5:	83 ec 18             	sub    $0x18,%esp
c01014d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01014df:	eb 26                	jmp    c0101507 <waitfor+0x35>
c01014e1:	83 ec 0c             	sub    $0xc,%esp
c01014e4:	68 f7 01 00 00       	push   $0x1f7
c01014e9:	e8 f6 ed ff ff       	call   c01002e4 <in_byte>
c01014ee:	83 c4 10             	add    $0x10,%esp
c01014f1:	0f b6 c0             	movzbl %al,%eax
c01014f4:	23 45 08             	and    0x8(%ebp),%eax
c01014f7:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01014fa:	75 07                	jne    c0101503 <waitfor+0x31>
c01014fc:	b8 01 00 00 00       	mov    $0x1,%eax
c0101501:	eb 11                	jmp    c0101514 <waitfor+0x42>
c0101503:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101507:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010150a:	3b 45 10             	cmp    0x10(%ebp),%eax
c010150d:	7c d2                	jl     c01014e1 <waitfor+0xf>
c010150f:	b8 00 00 00 00       	mov    $0x0,%eax
c0101514:	c9                   	leave  
c0101515:	c3                   	ret    

c0101516 <print_hd_info>:
c0101516:	55                   	push   %ebp
c0101517:	89 e5                	mov    %esp,%ebp
c0101519:	83 ec 18             	sub    $0x18,%esp
c010151c:	83 ec 0c             	sub    $0xc,%esp
c010151f:	68 6a b2 10 c0       	push   $0xc010b26a
c0101524:	e8 bf 70 00 00       	call   c01085e8 <Printf>
c0101529:	83 c4 10             	add    $0x10,%esp
c010152c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101533:	eb 3b                	jmp    c0101570 <print_hd_info+0x5a>
c0101535:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101538:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c010153f:	85 c0                	test   %eax,%eax
c0101541:	74 28                	je     c010156b <print_hd_info+0x55>
c0101543:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101546:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c010154d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101550:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101557:	ff 75 f4             	pushl  -0xc(%ebp)
c010155a:	52                   	push   %edx
c010155b:	50                   	push   %eax
c010155c:	68 87 b2 10 c0       	push   $0xc010b287
c0101561:	e8 82 70 00 00       	call   c01085e8 <Printf>
c0101566:	83 c4 10             	add    $0x10,%esp
c0101569:	eb 01                	jmp    c010156c <print_hd_info+0x56>
c010156b:	90                   	nop
c010156c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101570:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0101574:	7e bf                	jle    c0101535 <print_hd_info+0x1f>
c0101576:	83 ec 0c             	sub    $0xc,%esp
c0101579:	68 9f b2 10 c0       	push   $0xc010b29f
c010157e:	e8 65 70 00 00       	call   c01085e8 <Printf>
c0101583:	83 c4 10             	add    $0x10,%esp
c0101586:	83 ec 0c             	sub    $0xc,%esp
c0101589:	68 ba b2 10 c0       	push   $0xc010b2ba
c010158e:	e8 55 70 00 00       	call   c01085e8 <Printf>
c0101593:	83 c4 10             	add    $0x10,%esp
c0101596:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c010159d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01015a4:	eb 44                	jmp    c01015ea <print_hd_info+0xd4>
c01015a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015a9:	83 c0 04             	add    $0x4,%eax
c01015ac:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01015b3:	85 c0                	test   %eax,%eax
c01015b5:	74 2e                	je     c01015e5 <print_hd_info+0xcf>
c01015b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015ba:	83 c0 04             	add    $0x4,%eax
c01015bd:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01015c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015c7:	83 c0 04             	add    $0x4,%eax
c01015ca:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01015d1:	ff 75 f0             	pushl  -0x10(%ebp)
c01015d4:	52                   	push   %edx
c01015d5:	50                   	push   %eax
c01015d6:	68 87 b2 10 c0       	push   $0xc010b287
c01015db:	e8 08 70 00 00       	call   c01085e8 <Printf>
c01015e0:	83 c4 10             	add    $0x10,%esp
c01015e3:	eb 01                	jmp    c01015e6 <print_hd_info+0xd0>
c01015e5:	90                   	nop
c01015e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01015ea:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01015ee:	7e b6                	jle    c01015a6 <print_hd_info+0x90>
c01015f0:	83 ec 0c             	sub    $0xc,%esp
c01015f3:	68 d7 b2 10 c0       	push   $0xc010b2d7
c01015f8:	e8 eb 6f 00 00       	call   c01085e8 <Printf>
c01015fd:	83 c4 10             	add    $0x10,%esp
c0101600:	90                   	nop
c0101601:	c9                   	leave  
c0101602:	c3                   	ret    

c0101603 <is_empty>:
c0101603:	55                   	push   %ebp
c0101604:	89 e5                	mov    %esp,%ebp
c0101606:	83 ec 10             	sub    $0x10,%esp
c0101609:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0101610:	eb 1a                	jmp    c010162c <is_empty+0x29>
c0101612:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0101615:	8b 45 08             	mov    0x8(%ebp),%eax
c0101618:	01 d0                	add    %edx,%eax
c010161a:	0f b6 00             	movzbl (%eax),%eax
c010161d:	84 c0                	test   %al,%al
c010161f:	74 07                	je     c0101628 <is_empty+0x25>
c0101621:	b8 00 00 00 00       	mov    $0x0,%eax
c0101626:	eb 11                	jmp    c0101639 <is_empty+0x36>
c0101628:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010162c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010162f:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101632:	7c de                	jl     c0101612 <is_empty+0xf>
c0101634:	b8 01 00 00 00       	mov    $0x1,%eax
c0101639:	c9                   	leave  
c010163a:	c3                   	ret    
c010163b:	66 90                	xchg   %ax,%ax
c010163d:	66 90                	xchg   %ax,%ax
c010163f:	90                   	nop

c0101640 <write_debug>:
c0101640:	b8 02 00 00 00       	mov    $0x2,%eax
c0101645:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101649:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010164d:	cd 90                	int    $0x90
c010164f:	c3                   	ret    

c0101650 <send_msg>:
c0101650:	55                   	push   %ebp
c0101651:	89 e5                	mov    %esp,%ebp
c0101653:	53                   	push   %ebx
c0101654:	51                   	push   %ecx
c0101655:	b8 03 00 00 00       	mov    $0x3,%eax
c010165a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010165d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101660:	cd 90                	int    $0x90
c0101662:	59                   	pop    %ecx
c0101663:	5b                   	pop    %ebx
c0101664:	5d                   	pop    %ebp
c0101665:	c3                   	ret    

c0101666 <receive_msg>:
c0101666:	55                   	push   %ebp
c0101667:	89 e5                	mov    %esp,%ebp
c0101669:	53                   	push   %ebx
c010166a:	51                   	push   %ecx
c010166b:	b8 04 00 00 00       	mov    $0x4,%eax
c0101670:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101673:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101676:	cd 90                	int    $0x90
c0101678:	59                   	pop    %ecx
c0101679:	5b                   	pop    %ebx
c010167a:	5d                   	pop    %ebp
c010167b:	c3                   	ret    

c010167c <sys_malloc>:
c010167c:	56                   	push   %esi
c010167d:	57                   	push   %edi
c010167e:	53                   	push   %ebx
c010167f:	55                   	push   %ebp
c0101680:	89 e5                	mov    %esp,%ebp
c0101682:	b8 05 00 00 00       	mov    $0x5,%eax
c0101687:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010168a:	cd 90                	int    $0x90
c010168c:	5d                   	pop    %ebp
c010168d:	5b                   	pop    %ebx
c010168e:	5f                   	pop    %edi
c010168f:	5e                   	pop    %esi
c0101690:	c3                   	ret    

c0101691 <sys_free>:
c0101691:	56                   	push   %esi
c0101692:	57                   	push   %edi
c0101693:	53                   	push   %ebx
c0101694:	55                   	push   %ebp
c0101695:	89 e5                	mov    %esp,%ebp
c0101697:	b8 06 00 00 00       	mov    $0x6,%eax
c010169c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010169f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c01016a2:	cd 90                	int    $0x90
c01016a4:	5d                   	pop    %ebp
c01016a5:	5b                   	pop    %ebx
c01016a6:	5f                   	pop    %edi
c01016a7:	5e                   	pop    %esi
c01016a8:	c3                   	ret    

c01016a9 <task_fs>:
c01016a9:	55                   	push   %ebp
c01016aa:	89 e5                	mov    %esp,%ebp
c01016ac:	83 ec 28             	sub    $0x28,%esp
c01016af:	e8 bb 08 00 00       	call   c0101f6f <init_fs>
c01016b4:	83 ec 0c             	sub    $0xc,%esp
c01016b7:	6a 7c                	push   $0x7c
c01016b9:	e8 be ff ff ff       	call   c010167c <sys_malloc>
c01016be:	83 c4 10             	add    $0x10,%esp
c01016c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01016c4:	83 ec 0c             	sub    $0xc,%esp
c01016c7:	6a 7c                	push   $0x7c
c01016c9:	e8 ae ff ff ff       	call   c010167c <sys_malloc>
c01016ce:	83 c4 10             	add    $0x10,%esp
c01016d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01016d4:	83 ec 04             	sub    $0x4,%esp
c01016d7:	6a 7c                	push   $0x7c
c01016d9:	6a 00                	push   $0x0
c01016db:	ff 75 f4             	pushl  -0xc(%ebp)
c01016de:	e8 ec aa 00 00       	call   c010c1cf <Memset>
c01016e3:	83 c4 10             	add    $0x10,%esp
c01016e6:	83 ec 04             	sub    $0x4,%esp
c01016e9:	6a 12                	push   $0x12
c01016eb:	ff 75 f4             	pushl  -0xc(%ebp)
c01016ee:	6a 02                	push   $0x2
c01016f0:	e8 c0 7e 00 00       	call   c01095b5 <send_rec>
c01016f5:	83 c4 10             	add    $0x10,%esp
c01016f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016fb:	8b 40 78             	mov    0x78(%eax),%eax
c01016fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101701:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101704:	8b 00                	mov    (%eax),%eax
c0101706:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101709:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010170c:	8b 40 50             	mov    0x50(%eax),%eax
c010170f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101712:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101715:	8b 40 68             	mov    0x68(%eax),%eax
c0101718:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010171b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010171e:	8b 00                	mov    (%eax),%eax
c0101720:	85 c0                	test   %eax,%eax
c0101722:	75 07                	jne    c010172b <task_fs+0x82>
c0101724:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010172b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101732:	83 ec 0c             	sub    $0xc,%esp
c0101735:	ff 75 e8             	pushl  -0x18(%ebp)
c0101738:	e8 39 21 00 00       	call   c0103876 <pid2proc>
c010173d:	83 c4 10             	add    $0x10,%esp
c0101740:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101745:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101749:	74 37                	je     c0101782 <task_fs+0xd9>
c010174b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010174f:	74 31                	je     c0101782 <task_fs+0xd9>
c0101751:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101755:	74 2b                	je     c0101782 <task_fs+0xd9>
c0101757:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010175b:	74 25                	je     c0101782 <task_fs+0xd9>
c010175d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101761:	74 1f                	je     c0101782 <task_fs+0xd9>
c0101763:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101767:	74 19                	je     c0101782 <task_fs+0xd9>
c0101769:	6a 7a                	push   $0x7a
c010176b:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101770:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101775:	68 08 b3 10 c0       	push   $0xc010b308
c010177a:	e8 c6 71 00 00       	call   c0108945 <assertion_failure>
c010177f:	83 c4 10             	add    $0x10,%esp
c0101782:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101786:	74 3a                	je     c01017c2 <task_fs+0x119>
c0101788:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010178c:	7f 19                	jg     c01017a7 <task_fs+0xfe>
c010178e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101792:	0f 84 10 01 00 00    	je     c01018a8 <task_fs+0x1ff>
c0101798:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010179c:	0f 84 a1 00 00 00    	je     c0101843 <task_fs+0x19a>
c01017a2:	e9 ef 00 00 00       	jmp    c0101896 <task_fs+0x1ed>
c01017a7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01017ab:	74 50                	je     c01017fd <task_fs+0x154>
c01017ad:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01017b1:	0f 84 c6 00 00 00    	je     c010187d <task_fs+0x1d4>
c01017b7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01017bb:	74 40                	je     c01017fd <task_fs+0x154>
c01017bd:	e9 d4 00 00 00       	jmp    c0101896 <task_fs+0x1ed>
c01017c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017c5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01017cc:	83 ec 0c             	sub    $0xc,%esp
c01017cf:	ff 75 f4             	pushl  -0xc(%ebp)
c01017d2:	e8 ec 07 00 00       	call   c0101fc3 <do_open>
c01017d7:	83 c4 10             	add    $0x10,%esp
c01017da:	89 c2                	mov    %eax,%edx
c01017dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017df:	89 50 50             	mov    %edx,0x50(%eax)
c01017e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017e5:	8b 00                	mov    (%eax),%eax
c01017e7:	83 ec 04             	sub    $0x4,%esp
c01017ea:	50                   	push   %eax
c01017eb:	ff 75 f4             	pushl  -0xc(%ebp)
c01017ee:	6a 01                	push   $0x1
c01017f0:	e8 c0 7d 00 00       	call   c01095b5 <send_rec>
c01017f5:	83 c4 10             	add    $0x10,%esp
c01017f8:	e9 b2 00 00 00       	jmp    c01018af <task_fs+0x206>
c01017fd:	83 ec 0c             	sub    $0xc,%esp
c0101800:	ff 75 f4             	pushl  -0xc(%ebp)
c0101803:	e8 19 19 00 00       	call   c0103121 <do_rdwt>
c0101808:	83 c4 10             	add    $0x10,%esp
c010180b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010180e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101812:	0f 84 96 00 00 00    	je     c01018ae <task_fs+0x205>
c0101818:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010181b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101822:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101825:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101828:	89 50 60             	mov    %edx,0x60(%eax)
c010182b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010182e:	8b 00                	mov    (%eax),%eax
c0101830:	83 ec 04             	sub    $0x4,%esp
c0101833:	50                   	push   %eax
c0101834:	ff 75 f4             	pushl  -0xc(%ebp)
c0101837:	6a 01                	push   $0x1
c0101839:	e8 77 7d 00 00       	call   c01095b5 <send_rec>
c010183e:	83 c4 10             	add    $0x10,%esp
c0101841:	eb 6b                	jmp    c01018ae <task_fs+0x205>
c0101843:	83 ec 0c             	sub    $0xc,%esp
c0101846:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101849:	e8 f0 1d 00 00       	call   c010363e <do_close>
c010184e:	83 c4 10             	add    $0x10,%esp
c0101851:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101854:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010185b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010185e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101865:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101868:	8b 00                	mov    (%eax),%eax
c010186a:	83 ec 04             	sub    $0x4,%esp
c010186d:	50                   	push   %eax
c010186e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101871:	6a 01                	push   $0x1
c0101873:	e8 3d 7d 00 00       	call   c01095b5 <send_rec>
c0101878:	83 c4 10             	add    $0x10,%esp
c010187b:	eb 32                	jmp    c01018af <task_fs+0x206>
c010187d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101880:	8b 40 68             	mov    0x68(%eax),%eax
c0101883:	83 ec 04             	sub    $0x4,%esp
c0101886:	50                   	push   %eax
c0101887:	ff 75 f4             	pushl  -0xc(%ebp)
c010188a:	6a 01                	push   $0x1
c010188c:	e8 24 7d 00 00       	call   c01095b5 <send_rec>
c0101891:	83 c4 10             	add    $0x10,%esp
c0101894:	eb 19                	jmp    c01018af <task_fs+0x206>
c0101896:	83 ec 0c             	sub    $0xc,%esp
c0101899:	68 6b b3 10 c0       	push   $0xc010b36b
c010189e:	e8 84 70 00 00       	call   c0108927 <panic>
c01018a3:	83 c4 10             	add    $0x10,%esp
c01018a6:	eb 07                	jmp    c01018af <task_fs+0x206>
c01018a8:	90                   	nop
c01018a9:	e9 26 fe ff ff       	jmp    c01016d4 <task_fs+0x2b>
c01018ae:	90                   	nop
c01018af:	e9 20 fe ff ff       	jmp    c01016d4 <task_fs+0x2b>

c01018b4 <rd_wt>:
c01018b4:	55                   	push   %ebp
c01018b5:	89 e5                	mov    %esp,%ebp
c01018b7:	83 ec 18             	sub    $0x18,%esp
c01018ba:	83 ec 0c             	sub    $0xc,%esp
c01018bd:	6a 7c                	push   $0x7c
c01018bf:	e8 b8 fd ff ff       	call   c010167c <sys_malloc>
c01018c4:	83 c4 10             	add    $0x10,%esp
c01018c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01018ca:	83 ec 04             	sub    $0x4,%esp
c01018cd:	6a 7c                	push   $0x7c
c01018cf:	6a 00                	push   $0x0
c01018d1:	ff 75 f4             	pushl  -0xc(%ebp)
c01018d4:	e8 f6 a8 00 00       	call   c010c1cf <Memset>
c01018d9:	83 c4 10             	add    $0x10,%esp
c01018dc:	8b 55 18             	mov    0x18(%ebp),%edx
c01018df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018e2:	89 50 78             	mov    %edx,0x78(%eax)
c01018e5:	8b 55 0c             	mov    0xc(%ebp),%edx
c01018e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018eb:	89 50 14             	mov    %edx,0x14(%eax)
c01018ee:	8b 55 10             	mov    0x10(%ebp),%edx
c01018f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018f4:	89 50 10             	mov    %edx,0x10(%eax)
c01018f7:	8b 55 14             	mov    0x14(%ebp),%edx
c01018fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018fd:	89 50 0c             	mov    %edx,0xc(%eax)
c0101900:	8b 45 08             	mov    0x8(%ebp),%eax
c0101903:	c1 e0 09             	shl    $0x9,%eax
c0101906:	89 c2                	mov    %eax,%edx
c0101908:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010190b:	89 50 18             	mov    %edx,0x18(%eax)
c010190e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101912:	74 22                	je     c0101936 <rd_wt+0x82>
c0101914:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101918:	74 1c                	je     c0101936 <rd_wt+0x82>
c010191a:	68 b1 00 00 00       	push   $0xb1
c010191f:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101924:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101929:	68 7e b3 10 c0       	push   $0xc010b37e
c010192e:	e8 12 70 00 00       	call   c0108945 <assertion_failure>
c0101933:	83 c4 10             	add    $0x10,%esp
c0101936:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101939:	8b 40 78             	mov    0x78(%eax),%eax
c010193c:	83 f8 07             	cmp    $0x7,%eax
c010193f:	74 27                	je     c0101968 <rd_wt+0xb4>
c0101941:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101944:	8b 40 78             	mov    0x78(%eax),%eax
c0101947:	83 f8 0a             	cmp    $0xa,%eax
c010194a:	74 1c                	je     c0101968 <rd_wt+0xb4>
c010194c:	68 b2 00 00 00       	push   $0xb2
c0101951:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101956:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010195b:	68 9c b3 10 c0       	push   $0xc010b39c
c0101960:	e8 e0 6f 00 00       	call   c0108945 <assertion_failure>
c0101965:	83 c4 10             	add    $0x10,%esp
c0101968:	83 ec 04             	sub    $0x4,%esp
c010196b:	6a 03                	push   $0x3
c010196d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101970:	6a 03                	push   $0x3
c0101972:	e8 3e 7c 00 00       	call   c01095b5 <send_rec>
c0101977:	83 c4 10             	add    $0x10,%esp
c010197a:	83 ec 08             	sub    $0x8,%esp
c010197d:	6a 7c                	push   $0x7c
c010197f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101982:	e8 0a fd ff ff       	call   c0101691 <sys_free>
c0101987:	83 c4 10             	add    $0x10,%esp
c010198a:	90                   	nop
c010198b:	c9                   	leave  
c010198c:	c3                   	ret    

c010198d <mkfs>:
c010198d:	55                   	push   %ebp
c010198e:	89 e5                	mov    %esp,%ebp
c0101990:	57                   	push   %edi
c0101991:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101997:	83 ec 0c             	sub    $0xc,%esp
c010199a:	68 00 80 00 00       	push   $0x8000
c010199f:	e8 d8 fc ff ff       	call   c010167c <sys_malloc>
c01019a4:	83 c4 10             	add    $0x10,%esp
c01019a7:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c01019ac:	83 ec 0c             	sub    $0xc,%esp
c01019af:	6a 24                	push   $0x24
c01019b1:	e8 c6 fc ff ff       	call   c010167c <sys_malloc>
c01019b6:	83 c4 10             	add    $0x10,%esp
c01019b9:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c01019be:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019c3:	83 ec 0c             	sub    $0xc,%esp
c01019c6:	50                   	push   %eax
c01019c7:	e8 42 46 00 00       	call   c010600e <get_physical_address>
c01019cc:	83 c4 10             	add    $0x10,%esp
c01019cf:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c01019d4:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01019d9:	83 ec 0c             	sub    $0xc,%esp
c01019dc:	50                   	push   %eax
c01019dd:	e8 2c 46 00 00       	call   c010600e <get_physical_address>
c01019e2:	83 c4 10             	add    $0x10,%esp
c01019e5:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c01019ea:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019ef:	83 ec 04             	sub    $0x4,%esp
c01019f2:	68 00 02 00 00       	push   $0x200
c01019f7:	6a 00                	push   $0x0
c01019f9:	50                   	push   %eax
c01019fa:	e8 d0 a7 00 00       	call   c010c1cf <Memset>
c01019ff:	83 c4 10             	add    $0x10,%esp
c0101a02:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a07:	83 ec 0c             	sub    $0xc,%esp
c0101a0a:	6a 0a                	push   $0xa
c0101a0c:	68 00 02 00 00       	push   $0x200
c0101a11:	50                   	push   %eax
c0101a12:	6a 20                	push   $0x20
c0101a14:	6a 00                	push   $0x0
c0101a16:	e8 99 fe ff ff       	call   c01018b4 <rd_wt>
c0101a1b:	83 c4 20             	add    $0x20,%esp
c0101a1e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a23:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101a26:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a29:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101a30:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a33:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0101a3a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a3d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101a44:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a47:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101a4e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a51:	8b 40 04             	mov    0x4(%eax),%eax
c0101a54:	8d 50 02             	lea    0x2(%eax),%edx
c0101a57:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a5a:	8b 40 08             	mov    0x8(%eax),%eax
c0101a5d:	01 c2                	add    %eax,%edx
c0101a5f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a62:	8b 40 0c             	mov    0xc(%eax),%eax
c0101a65:	01 c2                	add    %eax,%edx
c0101a67:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a6a:	89 10                	mov    %edx,(%eax)
c0101a6c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101a73:	b8 00 02 00 00       	mov    $0x200,%eax
c0101a78:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101a7b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101a81:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101a84:	01 ca                	add    %ecx,%edx
c0101a86:	83 ec 04             	sub    $0x4,%esp
c0101a89:	50                   	push   %eax
c0101a8a:	6a 80                	push   $0xffffff80
c0101a8c:	52                   	push   %edx
c0101a8d:	e8 3d a7 00 00       	call   c010c1cf <Memset>
c0101a92:	83 c4 10             	add    $0x10,%esp
c0101a95:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a9a:	83 ec 0c             	sub    $0xc,%esp
c0101a9d:	6a 0a                	push   $0xa
c0101a9f:	68 00 02 00 00       	push   $0x200
c0101aa4:	50                   	push   %eax
c0101aa5:	6a 20                	push   $0x20
c0101aa7:	6a 01                	push   $0x1
c0101aa9:	e8 06 fe ff ff       	call   c01018b4 <rd_wt>
c0101aae:	83 c4 20             	add    $0x20,%esp
c0101ab1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ab4:	8b 10                	mov    (%eax),%edx
c0101ab6:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101ab9:	8b 50 04             	mov    0x4(%eax),%edx
c0101abc:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101abf:	8b 50 08             	mov    0x8(%eax),%edx
c0101ac2:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101ac5:	8b 50 0c             	mov    0xc(%eax),%edx
c0101ac8:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101acb:	8b 50 10             	mov    0x10(%eax),%edx
c0101ace:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101ad1:	8b 50 14             	mov    0x14(%eax),%edx
c0101ad4:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101ad7:	8b 50 18             	mov    0x18(%eax),%edx
c0101ada:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101add:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101ae0:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101ae3:	8b 40 20             	mov    0x20(%eax),%eax
c0101ae6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101ae9:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101aed:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101af1:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101af6:	83 ec 04             	sub    $0x4,%esp
c0101af9:	6a 01                	push   $0x1
c0101afb:	52                   	push   %edx
c0101afc:	50                   	push   %eax
c0101afd:	e8 cd a6 00 00       	call   c010c1cf <Memset>
c0101b02:	83 c4 10             	add    $0x10,%esp
c0101b05:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b0a:	83 c0 01             	add    $0x1,%eax
c0101b0d:	83 ec 04             	sub    $0x4,%esp
c0101b10:	68 ff 01 00 00       	push   $0x1ff
c0101b15:	6a 80                	push   $0xffffff80
c0101b17:	50                   	push   %eax
c0101b18:	e8 b2 a6 00 00       	call   c010c1cf <Memset>
c0101b1d:	83 c4 10             	add    $0x10,%esp
c0101b20:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b25:	83 ec 0c             	sub    $0xc,%esp
c0101b28:	6a 0a                	push   $0xa
c0101b2a:	68 00 02 00 00       	push   $0x200
c0101b2f:	50                   	push   %eax
c0101b30:	6a 20                	push   $0x20
c0101b32:	6a 02                	push   $0x2
c0101b34:	e8 7b fd ff ff       	call   c01018b4 <rd_wt>
c0101b39:	83 c4 20             	add    $0x20,%esp
c0101b3c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101b43:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b48:	83 ec 04             	sub    $0x4,%esp
c0101b4b:	68 00 02 00 00       	push   $0x200
c0101b50:	6a ff                	push   $0xffffffff
c0101b52:	50                   	push   %eax
c0101b53:	e8 77 a6 00 00       	call   c010c1cf <Memset>
c0101b58:	83 c4 10             	add    $0x10,%esp
c0101b5b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b60:	83 ec 0c             	sub    $0xc,%esp
c0101b63:	6a 0a                	push   $0xa
c0101b65:	68 00 02 00 00       	push   $0x200
c0101b6a:	50                   	push   %eax
c0101b6b:	6a 20                	push   $0x20
c0101b6d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101b70:	e8 3f fd ff ff       	call   c01018b4 <rd_wt>
c0101b75:	83 c4 20             	add    $0x20,%esp
c0101b78:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b7d:	83 ec 04             	sub    $0x4,%esp
c0101b80:	6a 01                	push   $0x1
c0101b82:	6a 01                	push   $0x1
c0101b84:	50                   	push   %eax
c0101b85:	e8 45 a6 00 00       	call   c010c1cf <Memset>
c0101b8a:	83 c4 10             	add    $0x10,%esp
c0101b8d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b92:	83 c0 01             	add    $0x1,%eax
c0101b95:	83 ec 04             	sub    $0x4,%esp
c0101b98:	68 ff 01 00 00       	push   $0x1ff
c0101b9d:	6a 00                	push   $0x0
c0101b9f:	50                   	push   %eax
c0101ba0:	e8 2a a6 00 00       	call   c010c1cf <Memset>
c0101ba5:	83 c4 10             	add    $0x10,%esp
c0101ba8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101bad:	89 c2                	mov    %eax,%edx
c0101baf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101bb2:	83 c0 01             	add    $0x1,%eax
c0101bb5:	83 ec 0c             	sub    $0xc,%esp
c0101bb8:	6a 0a                	push   $0xa
c0101bba:	68 00 02 00 00       	push   $0x200
c0101bbf:	52                   	push   %edx
c0101bc0:	6a 20                	push   $0x20
c0101bc2:	50                   	push   %eax
c0101bc3:	e8 ec fc ff ff       	call   c01018b4 <rd_wt>
c0101bc8:	83 c4 20             	add    $0x20,%esp
c0101bcb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101bce:	83 e8 02             	sub    $0x2,%eax
c0101bd1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101bd4:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101bdb:	eb 04                	jmp    c0101be1 <mkfs+0x254>
c0101bdd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101be1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101be4:	83 c0 01             	add    $0x1,%eax
c0101be7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101bea:	7e f1                	jle    c0101bdd <mkfs+0x250>
c0101bec:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101bf1:	89 c2                	mov    %eax,%edx
c0101bf3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101bf6:	83 c0 03             	add    $0x3,%eax
c0101bf9:	83 ec 0c             	sub    $0xc,%esp
c0101bfc:	6a 0a                	push   $0xa
c0101bfe:	68 00 02 00 00       	push   $0x200
c0101c03:	52                   	push   %edx
c0101c04:	6a 20                	push   $0x20
c0101c06:	50                   	push   %eax
c0101c07:	e8 a8 fc ff ff       	call   c01018b4 <rd_wt>
c0101c0c:	83 c4 20             	add    $0x20,%esp
c0101c0f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c14:	89 c2                	mov    %eax,%edx
c0101c16:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c19:	83 c0 03             	add    $0x3,%eax
c0101c1c:	83 ec 0c             	sub    $0xc,%esp
c0101c1f:	6a 07                	push   $0x7
c0101c21:	68 00 02 00 00       	push   $0x200
c0101c26:	52                   	push   %edx
c0101c27:	6a 20                	push   $0x20
c0101c29:	50                   	push   %eax
c0101c2a:	e8 85 fc ff ff       	call   c01018b4 <rd_wt>
c0101c2f:	83 c4 20             	add    $0x20,%esp
c0101c32:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c37:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101c3a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c3d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101c43:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c46:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101c4d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101c50:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c53:	89 50 08             	mov    %edx,0x8(%eax)
c0101c56:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c59:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101c60:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c63:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101c6a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c6d:	8b 10                	mov    (%eax),%edx
c0101c6f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101c75:	8b 50 04             	mov    0x4(%eax),%edx
c0101c78:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101c7e:	8b 50 08             	mov    0x8(%eax),%edx
c0101c81:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101c87:	8b 50 0c             	mov    0xc(%eax),%edx
c0101c8a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101c90:	8b 50 10             	mov    0x10(%eax),%edx
c0101c93:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101c99:	8b 50 14             	mov    0x14(%eax),%edx
c0101c9c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101ca2:	8b 50 18             	mov    0x18(%eax),%edx
c0101ca5:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101cab:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101cae:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101cb4:	8b 50 20             	mov    0x20(%eax),%edx
c0101cb7:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101cbd:	8b 40 24             	mov    0x24(%eax),%eax
c0101cc0:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101cc5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101ccc:	eb 4c                	jmp    c0101d1a <mkfs+0x38d>
c0101cce:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101cd3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101cd6:	83 c2 01             	add    $0x1,%edx
c0101cd9:	c1 e2 05             	shl    $0x5,%edx
c0101cdc:	01 d0                	add    %edx,%eax
c0101cde:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101ce1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ce4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101cea:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ced:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101cf4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cf7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101cfe:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101d05:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101d08:	c1 e0 08             	shl    $0x8,%eax
c0101d0b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101d0e:	89 c2                	mov    %eax,%edx
c0101d10:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d13:	89 50 08             	mov    %edx,0x8(%eax)
c0101d16:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101d1a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101d1e:	7e ae                	jle    c0101cce <mkfs+0x341>
c0101d20:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101d27:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101d2d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101d32:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101d37:	89 d7                	mov    %edx,%edi
c0101d39:	f3 ab                	rep stos %eax,%es:(%edi)
c0101d3b:	c7 85 70 ff ff ff c4 	movl   $0xc010b3c4,-0x90(%ebp)
c0101d42:	b3 10 c0 
c0101d45:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101d4c:	eb 54                	jmp    c0101da2 <mkfs+0x415>
c0101d4e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d53:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101d56:	83 c2 04             	add    $0x4,%edx
c0101d59:	c1 e2 05             	shl    $0x5,%edx
c0101d5c:	01 d0                	add    %edx,%eax
c0101d5e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101d61:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d64:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101d6a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d6d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101d74:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101d77:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101d7a:	83 c2 01             	add    $0x1,%edx
c0101d7d:	c1 e2 0b             	shl    $0xb,%edx
c0101d80:	01 c2                	add    %eax,%edx
c0101d82:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d85:	89 50 08             	mov    %edx,0x8(%eax)
c0101d88:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d8b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101d92:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d95:	8d 50 05             	lea    0x5(%eax),%edx
c0101d98:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d9b:	89 50 10             	mov    %edx,0x10(%eax)
c0101d9e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101da2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101da5:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101da8:	7c a4                	jl     c0101d4e <mkfs+0x3c1>
c0101daa:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101daf:	89 c2                	mov    %eax,%edx
c0101db1:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101db4:	83 c0 03             	add    $0x3,%eax
c0101db7:	83 ec 0c             	sub    $0xc,%esp
c0101dba:	6a 0a                	push   $0xa
c0101dbc:	68 00 02 00 00       	push   $0x200
c0101dc1:	52                   	push   %edx
c0101dc2:	6a 20                	push   $0x20
c0101dc4:	50                   	push   %eax
c0101dc5:	e8 ea fa ff ff       	call   c01018b4 <rd_wt>
c0101dca:	83 c4 20             	add    $0x20,%esp
c0101dcd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101dd2:	89 c2                	mov    %eax,%edx
c0101dd4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101dd7:	83 ec 0c             	sub    $0xc,%esp
c0101dda:	6a 07                	push   $0x7
c0101ddc:	68 00 02 00 00       	push   $0x200
c0101de1:	52                   	push   %edx
c0101de2:	6a 20                	push   $0x20
c0101de4:	50                   	push   %eax
c0101de5:	e8 ca fa ff ff       	call   c01018b4 <rd_wt>
c0101dea:	83 c4 20             	add    $0x20,%esp
c0101ded:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101df4:	00 00 00 
c0101df7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101dfe:	2e 00 
c0101e00:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101e05:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101e08:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e0b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101e11:	83 ec 0c             	sub    $0xc,%esp
c0101e14:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101e1a:	50                   	push   %eax
c0101e1b:	e8 e8 a3 00 00       	call   c010c208 <Strlen>
c0101e20:	83 c4 10             	add    $0x10,%esp
c0101e23:	89 c1                	mov    %eax,%ecx
c0101e25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e28:	8d 50 04             	lea    0x4(%eax),%edx
c0101e2b:	83 ec 04             	sub    $0x4,%esp
c0101e2e:	51                   	push   %ecx
c0101e2f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101e35:	50                   	push   %eax
c0101e36:	52                   	push   %edx
c0101e37:	e8 f0 4e 00 00       	call   c0106d2c <Memcpy>
c0101e3c:	83 c4 10             	add    $0x10,%esp
c0101e3f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101e45:	b8 00 00 00 00       	mov    $0x0,%eax
c0101e4a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101e4f:	89 d7                	mov    %edx,%edi
c0101e51:	f3 ab                	rep stos %eax,%es:(%edi)
c0101e53:	c7 85 34 ff ff ff d0 	movl   $0xc010b3d0,-0xcc(%ebp)
c0101e5a:	b3 10 c0 
c0101e5d:	c7 85 38 ff ff ff d9 	movl   $0xc010b3d9,-0xc8(%ebp)
c0101e64:	b3 10 c0 
c0101e67:	c7 85 3c ff ff ff e2 	movl   $0xc010b3e2,-0xc4(%ebp)
c0101e6e:	b3 10 c0 
c0101e71:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101e78:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101e7f:	eb 49                	jmp    c0101eca <mkfs+0x53d>
c0101e81:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101e85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e88:	8d 50 02             	lea    0x2(%eax),%edx
c0101e8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e8e:	89 10                	mov    %edx,(%eax)
c0101e90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e93:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101e9a:	83 ec 0c             	sub    $0xc,%esp
c0101e9d:	50                   	push   %eax
c0101e9e:	e8 65 a3 00 00       	call   c010c208 <Strlen>
c0101ea3:	83 c4 10             	add    $0x10,%esp
c0101ea6:	89 c1                	mov    %eax,%ecx
c0101ea8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101eab:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101eb2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101eb5:	83 c2 04             	add    $0x4,%edx
c0101eb8:	83 ec 04             	sub    $0x4,%esp
c0101ebb:	51                   	push   %ecx
c0101ebc:	50                   	push   %eax
c0101ebd:	52                   	push   %edx
c0101ebe:	e8 69 4e 00 00       	call   c0106d2c <Memcpy>
c0101ec3:	83 c4 10             	add    $0x10,%esp
c0101ec6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101eca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101ecd:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101ed0:	7c af                	jl     c0101e81 <mkfs+0x4f4>
c0101ed2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101ed9:	eb 66                	jmp    c0101f41 <mkfs+0x5b4>
c0101edb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ede:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101ee5:	83 ec 0c             	sub    $0xc,%esp
c0101ee8:	50                   	push   %eax
c0101ee9:	e8 1a a3 00 00       	call   c010c208 <Strlen>
c0101eee:	83 c4 10             	add    $0x10,%esp
c0101ef1:	85 c0                	test   %eax,%eax
c0101ef3:	74 47                	je     c0101f3c <mkfs+0x5af>
c0101ef5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101ef9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101efc:	8d 50 05             	lea    0x5(%eax),%edx
c0101eff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f02:	89 10                	mov    %edx,(%eax)
c0101f04:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f07:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101f0e:	83 ec 0c             	sub    $0xc,%esp
c0101f11:	50                   	push   %eax
c0101f12:	e8 f1 a2 00 00       	call   c010c208 <Strlen>
c0101f17:	83 c4 10             	add    $0x10,%esp
c0101f1a:	89 c1                	mov    %eax,%ecx
c0101f1c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f1f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101f26:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101f29:	83 c2 04             	add    $0x4,%edx
c0101f2c:	83 ec 04             	sub    $0x4,%esp
c0101f2f:	51                   	push   %ecx
c0101f30:	50                   	push   %eax
c0101f31:	52                   	push   %edx
c0101f32:	e8 f5 4d 00 00       	call   c0106d2c <Memcpy>
c0101f37:	83 c4 10             	add    $0x10,%esp
c0101f3a:	eb 01                	jmp    c0101f3d <mkfs+0x5b0>
c0101f3c:	90                   	nop
c0101f3d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101f41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f44:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101f47:	7c 92                	jl     c0101edb <mkfs+0x54e>
c0101f49:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101f4e:	89 c2                	mov    %eax,%edx
c0101f50:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101f53:	83 ec 0c             	sub    $0xc,%esp
c0101f56:	6a 0a                	push   $0xa
c0101f58:	68 00 02 00 00       	push   $0x200
c0101f5d:	52                   	push   %edx
c0101f5e:	6a 20                	push   $0x20
c0101f60:	50                   	push   %eax
c0101f61:	e8 4e f9 ff ff       	call   c01018b4 <rd_wt>
c0101f66:	83 c4 20             	add    $0x20,%esp
c0101f69:	90                   	nop
c0101f6a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101f6d:	c9                   	leave  
c0101f6e:	c3                   	ret    

c0101f6f <init_fs>:
c0101f6f:	55                   	push   %ebp
c0101f70:	89 e5                	mov    %esp,%ebp
c0101f72:	83 ec 18             	sub    $0x18,%esp
c0101f75:	83 ec 0c             	sub    $0xc,%esp
c0101f78:	6a 7c                	push   $0x7c
c0101f7a:	e8 fd f6 ff ff       	call   c010167c <sys_malloc>
c0101f7f:	83 c4 10             	add    $0x10,%esp
c0101f82:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101f85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f88:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101f8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f92:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101f99:	83 ec 04             	sub    $0x4,%esp
c0101f9c:	6a 03                	push   $0x3
c0101f9e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101fa1:	6a 03                	push   $0x3
c0101fa3:	e8 0d 76 00 00       	call   c01095b5 <send_rec>
c0101fa8:	83 c4 10             	add    $0x10,%esp
c0101fab:	e8 dd f9 ff ff       	call   c010198d <mkfs>
c0101fb0:	83 ec 08             	sub    $0x8,%esp
c0101fb3:	6a 7c                	push   $0x7c
c0101fb5:	ff 75 f4             	pushl  -0xc(%ebp)
c0101fb8:	e8 d4 f6 ff ff       	call   c0101691 <sys_free>
c0101fbd:	83 c4 10             	add    $0x10,%esp
c0101fc0:	90                   	nop
c0101fc1:	c9                   	leave  
c0101fc2:	c3                   	ret    

c0101fc3 <do_open>:
c0101fc3:	55                   	push   %ebp
c0101fc4:	89 e5                	mov    %esp,%ebp
c0101fc6:	83 ec 68             	sub    $0x68,%esp
c0101fc9:	83 ec 04             	sub    $0x4,%esp
c0101fcc:	6a 0c                	push   $0xc
c0101fce:	6a 00                	push   $0x0
c0101fd0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101fd3:	50                   	push   %eax
c0101fd4:	e8 f6 a1 00 00       	call   c010c1cf <Memset>
c0101fd9:	83 c4 10             	add    $0x10,%esp
c0101fdc:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fdf:	8b 40 44             	mov    0x44(%eax),%eax
c0101fe2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101fe5:	83 ec 08             	sub    $0x8,%esp
c0101fe8:	6a 0c                	push   $0xc
c0101fea:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101fed:	e8 cd 3e 00 00       	call   c0105ebf <alloc_virtual_memory>
c0101ff2:	83 c4 10             	add    $0x10,%esp
c0101ff5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101ff8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ffb:	8b 40 40             	mov    0x40(%eax),%eax
c0101ffe:	89 c2                	mov    %eax,%edx
c0102000:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102003:	83 ec 04             	sub    $0x4,%esp
c0102006:	52                   	push   %edx
c0102007:	50                   	push   %eax
c0102008:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010200b:	50                   	push   %eax
c010200c:	e8 1b 4d 00 00       	call   c0106d2c <Memcpy>
c0102011:	83 c4 10             	add    $0x10,%esp
c0102014:	8b 45 08             	mov    0x8(%ebp),%eax
c0102017:	8b 40 40             	mov    0x40(%eax),%eax
c010201a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c010201f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102022:	8b 40 74             	mov    0x74(%eax),%eax
c0102025:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102028:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c010202f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102036:	eb 1f                	jmp    c0102057 <do_open+0x94>
c0102038:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010203d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102040:	83 c2 4c             	add    $0x4c,%edx
c0102043:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0102047:	85 c0                	test   %eax,%eax
c0102049:	75 08                	jne    c0102053 <do_open+0x90>
c010204b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010204e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102051:	eb 0a                	jmp    c010205d <do_open+0x9a>
c0102053:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102057:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c010205b:	7e db                	jle    c0102038 <do_open+0x75>
c010205d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0102061:	75 1c                	jne    c010207f <do_open+0xbc>
c0102063:	68 c6 01 00 00       	push   $0x1c6
c0102068:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010206d:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102072:	68 eb b3 10 c0       	push   $0xc010b3eb
c0102077:	e8 c9 68 00 00       	call   c0108945 <assertion_failure>
c010207c:	83 c4 10             	add    $0x10,%esp
c010207f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0102086:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010208d:	eb 1d                	jmp    c01020ac <do_open+0xe9>
c010208f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102092:	c1 e0 04             	shl    $0x4,%eax
c0102095:	05 88 13 11 c0       	add    $0xc0111388,%eax
c010209a:	8b 00                	mov    (%eax),%eax
c010209c:	85 c0                	test   %eax,%eax
c010209e:	75 08                	jne    c01020a8 <do_open+0xe5>
c01020a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01020a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01020a6:	eb 0a                	jmp    c01020b2 <do_open+0xef>
c01020a8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01020ac:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c01020b0:	7e dd                	jle    c010208f <do_open+0xcc>
c01020b2:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c01020b6:	75 1c                	jne    c01020d4 <do_open+0x111>
c01020b8:	68 d2 01 00 00       	push   $0x1d2
c01020bd:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01020c2:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01020c7:	68 f3 b3 10 c0       	push   $0xc010b3f3
c01020cc:	e8 74 68 00 00       	call   c0108945 <assertion_failure>
c01020d1:	83 c4 10             	add    $0x10,%esp
c01020d4:	83 ec 0c             	sub    $0xc,%esp
c01020d7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01020da:	50                   	push   %eax
c01020db:	e8 d2 00 00 00       	call   c01021b2 <search_file>
c01020e0:	83 c4 10             	add    $0x10,%esp
c01020e3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01020e6:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01020ea:	75 2b                	jne    c0102117 <do_open+0x154>
c01020ec:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c01020f0:	7e 10                	jle    c0102102 <do_open+0x13f>
c01020f2:	83 ec 0c             	sub    $0xc,%esp
c01020f5:	68 fb b3 10 c0       	push   $0xc010b3fb
c01020fa:	e8 28 68 00 00       	call   c0108927 <panic>
c01020ff:	83 c4 10             	add    $0x10,%esp
c0102102:	83 ec 08             	sub    $0x8,%esp
c0102105:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102108:	50                   	push   %eax
c0102109:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010210c:	50                   	push   %eax
c010210d:	e8 60 04 00 00       	call   c0102572 <create_file>
c0102112:	83 c4 10             	add    $0x10,%esp
c0102115:	eb 25                	jmp    c010213c <do_open+0x179>
c0102117:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010211b:	75 0a                	jne    c0102127 <do_open+0x164>
c010211d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102122:	e9 89 00 00 00       	jmp    c01021b0 <do_open+0x1ed>
c0102127:	83 ec 08             	sub    $0x8,%esp
c010212a:	ff 75 d8             	pushl  -0x28(%ebp)
c010212d:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0102130:	50                   	push   %eax
c0102131:	e8 7a 02 00 00       	call   c01023b0 <get_inode>
c0102136:	83 c4 10             	add    $0x10,%esp
c0102139:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010213c:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0102141:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102144:	c1 e2 04             	shl    $0x4,%edx
c0102147:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010214d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102150:	83 c2 4c             	add    $0x4c,%edx
c0102153:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102157:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010215a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010215d:	c1 e2 04             	shl    $0x4,%edx
c0102160:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102166:	89 02                	mov    %eax,(%edx)
c0102168:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010216b:	c1 e0 04             	shl    $0x4,%eax
c010216e:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102173:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102179:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010217c:	c1 e0 04             	shl    $0x4,%eax
c010217f:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102184:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010218a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010218d:	c1 e0 04             	shl    $0x4,%eax
c0102190:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102195:	8b 00                	mov    (%eax),%eax
c0102197:	8d 50 01             	lea    0x1(%eax),%edx
c010219a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010219d:	c1 e0 04             	shl    $0x4,%eax
c01021a0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01021a5:	89 10                	mov    %edx,(%eax)
c01021a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01021aa:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01021ad:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01021b0:	c9                   	leave  
c01021b1:	c3                   	ret    

c01021b2 <search_file>:
c01021b2:	55                   	push   %ebp
c01021b3:	89 e5                	mov    %esp,%ebp
c01021b5:	83 ec 68             	sub    $0x68,%esp
c01021b8:	83 ec 04             	sub    $0x4,%esp
c01021bb:	6a 0c                	push   $0xc
c01021bd:	6a 00                	push   $0x0
c01021bf:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01021c2:	50                   	push   %eax
c01021c3:	e8 07 a0 00 00       	call   c010c1cf <Memset>
c01021c8:	83 c4 10             	add    $0x10,%esp
c01021cb:	83 ec 04             	sub    $0x4,%esp
c01021ce:	6a 28                	push   $0x28
c01021d0:	6a 00                	push   $0x0
c01021d2:	8d 45 98             	lea    -0x68(%ebp),%eax
c01021d5:	50                   	push   %eax
c01021d6:	e8 f4 9f 00 00       	call   c010c1cf <Memset>
c01021db:	83 c4 10             	add    $0x10,%esp
c01021de:	83 ec 04             	sub    $0x4,%esp
c01021e1:	8d 45 98             	lea    -0x68(%ebp),%eax
c01021e4:	50                   	push   %eax
c01021e5:	ff 75 08             	pushl  0x8(%ebp)
c01021e8:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01021eb:	50                   	push   %eax
c01021ec:	e8 f3 00 00 00       	call   c01022e4 <strip_path>
c01021f1:	83 c4 10             	add    $0x10,%esp
c01021f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01021f7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c01021fb:	75 0a                	jne    c0102207 <search_file+0x55>
c01021fd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102202:	e9 db 00 00 00       	jmp    c01022e2 <search_file+0x130>
c0102207:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010220a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010220d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102210:	05 00 02 00 00       	add    $0x200,%eax
c0102215:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010221b:	85 c0                	test   %eax,%eax
c010221d:	0f 48 c2             	cmovs  %edx,%eax
c0102220:	c1 f8 09             	sar    $0x9,%eax
c0102223:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102226:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102229:	c1 e8 04             	shr    $0x4,%eax
c010222c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010222f:	e8 5c 14 00 00       	call   c0103690 <get_super_block>
c0102234:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102237:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010223a:	8b 00                	mov    (%eax),%eax
c010223c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010223f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102246:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010224d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102254:	eb 7b                	jmp    c01022d1 <search_file+0x11f>
c0102256:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010225b:	89 c1                	mov    %eax,%ecx
c010225d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102260:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102263:	01 d0                	add    %edx,%eax
c0102265:	83 ec 0c             	sub    $0xc,%esp
c0102268:	6a 07                	push   $0x7
c010226a:	68 00 02 00 00       	push   $0x200
c010226f:	51                   	push   %ecx
c0102270:	ff 75 cc             	pushl  -0x34(%ebp)
c0102273:	50                   	push   %eax
c0102274:	e8 3b f6 ff ff       	call   c01018b4 <rd_wt>
c0102279:	83 c4 20             	add    $0x20,%esp
c010227c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102281:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102284:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010228b:	eb 35                	jmp    c01022c2 <search_file+0x110>
c010228d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102291:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102294:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102297:	7f 33                	jg     c01022cc <search_file+0x11a>
c0102299:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010229c:	83 c0 04             	add    $0x4,%eax
c010229f:	83 ec 08             	sub    $0x8,%esp
c01022a2:	50                   	push   %eax
c01022a3:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01022a6:	50                   	push   %eax
c01022a7:	e8 70 76 00 00       	call   c010991c <strcmp>
c01022ac:	83 c4 10             	add    $0x10,%esp
c01022af:	85 c0                	test   %eax,%eax
c01022b1:	75 07                	jne    c01022ba <search_file+0x108>
c01022b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022b6:	8b 00                	mov    (%eax),%eax
c01022b8:	eb 28                	jmp    c01022e2 <search_file+0x130>
c01022ba:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01022be:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c01022c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022c5:	83 f8 1f             	cmp    $0x1f,%eax
c01022c8:	76 c3                	jbe    c010228d <search_file+0xdb>
c01022ca:	eb 01                	jmp    c01022cd <search_file+0x11b>
c01022cc:	90                   	nop
c01022cd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01022d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022d4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c01022d7:	0f 8c 79 ff ff ff    	jl     c0102256 <search_file+0xa4>
c01022dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022e2:	c9                   	leave  
c01022e3:	c3                   	ret    

c01022e4 <strip_path>:
c01022e4:	55                   	push   %ebp
c01022e5:	89 e5                	mov    %esp,%ebp
c01022e7:	83 ec 10             	sub    $0x10,%esp
c01022ea:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01022ee:	75 0a                	jne    c01022fa <strip_path+0x16>
c01022f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022f5:	e9 b4 00 00 00       	jmp    c01023ae <strip_path+0xca>
c01022fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01022fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102300:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102303:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102306:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102309:	0f b6 00             	movzbl (%eax),%eax
c010230c:	3c 2f                	cmp    $0x2f,%al
c010230e:	75 2d                	jne    c010233d <strip_path+0x59>
c0102310:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102314:	eb 27                	jmp    c010233d <strip_path+0x59>
c0102316:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102319:	0f b6 00             	movzbl (%eax),%eax
c010231c:	3c 2f                	cmp    $0x2f,%al
c010231e:	75 0a                	jne    c010232a <strip_path+0x46>
c0102320:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102325:	e9 84 00 00 00       	jmp    c01023ae <strip_path+0xca>
c010232a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010232d:	0f b6 10             	movzbl (%eax),%edx
c0102330:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102333:	88 10                	mov    %dl,(%eax)
c0102335:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102339:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010233d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102340:	0f b6 00             	movzbl (%eax),%eax
c0102343:	84 c0                	test   %al,%al
c0102345:	75 cf                	jne    c0102316 <strip_path+0x32>
c0102347:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010234a:	c6 00 00             	movb   $0x0,(%eax)
c010234d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102350:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102356:	89 10                	mov    %edx,(%eax)
c0102358:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010235e:	89 50 04             	mov    %edx,0x4(%eax)
c0102361:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102367:	89 50 08             	mov    %edx,0x8(%eax)
c010236a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102370:	89 50 0c             	mov    %edx,0xc(%eax)
c0102373:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102379:	89 50 10             	mov    %edx,0x10(%eax)
c010237c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102382:	89 50 14             	mov    %edx,0x14(%eax)
c0102385:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010238b:	89 50 18             	mov    %edx,0x18(%eax)
c010238e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102394:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102397:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010239d:	89 50 20             	mov    %edx,0x20(%eax)
c01023a0:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c01023a6:	89 50 24             	mov    %edx,0x24(%eax)
c01023a9:	b8 00 00 00 00       	mov    $0x0,%eax
c01023ae:	c9                   	leave  
c01023af:	c3                   	ret    

c01023b0 <get_inode>:
c01023b0:	55                   	push   %ebp
c01023b1:	89 e5                	mov    %esp,%ebp
c01023b3:	56                   	push   %esi
c01023b4:	53                   	push   %ebx
c01023b5:	83 ec 20             	sub    $0x20,%esp
c01023b8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01023bc:	75 0a                	jne    c01023c8 <get_inode+0x18>
c01023be:	b8 00 00 00 00       	mov    $0x0,%eax
c01023c3:	e9 a3 01 00 00       	jmp    c010256b <get_inode+0x1bb>
c01023c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01023cf:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c01023d6:	eb 69                	jmp    c0102441 <get_inode+0x91>
c01023d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023db:	8b 40 24             	mov    0x24(%eax),%eax
c01023de:	85 c0                	test   %eax,%eax
c01023e0:	7e 53                	jle    c0102435 <get_inode+0x85>
c01023e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023e5:	8b 40 10             	mov    0x10(%eax),%eax
c01023e8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01023eb:	75 50                	jne    c010243d <get_inode+0x8d>
c01023ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01023f0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01023f3:	8b 0a                	mov    (%edx),%ecx
c01023f5:	89 08                	mov    %ecx,(%eax)
c01023f7:	8b 4a 04             	mov    0x4(%edx),%ecx
c01023fa:	89 48 04             	mov    %ecx,0x4(%eax)
c01023fd:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102400:	89 48 08             	mov    %ecx,0x8(%eax)
c0102403:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102406:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102409:	8b 4a 10             	mov    0x10(%edx),%ecx
c010240c:	89 48 10             	mov    %ecx,0x10(%eax)
c010240f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102412:	89 48 14             	mov    %ecx,0x14(%eax)
c0102415:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102418:	89 48 18             	mov    %ecx,0x18(%eax)
c010241b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010241e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102421:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102424:	89 48 20             	mov    %ecx,0x20(%eax)
c0102427:	8b 52 24             	mov    0x24(%edx),%edx
c010242a:	89 50 24             	mov    %edx,0x24(%eax)
c010242d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102430:	e9 36 01 00 00       	jmp    c010256b <get_inode+0x1bb>
c0102435:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102438:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010243b:	eb 0d                	jmp    c010244a <get_inode+0x9a>
c010243d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102441:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102448:	76 8e                	jbe    c01023d8 <get_inode+0x28>
c010244a:	e8 41 12 00 00       	call   c0103690 <get_super_block>
c010244f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102452:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102459:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010245c:	8b 40 04             	mov    0x4(%eax),%eax
c010245f:	8d 50 02             	lea    0x2(%eax),%edx
c0102462:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102465:	8b 40 08             	mov    0x8(%eax),%eax
c0102468:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010246b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010246e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102471:	b8 00 02 00 00       	mov    $0x200,%eax
c0102476:	99                   	cltd   
c0102477:	f7 7d e8             	idivl  -0x18(%ebp)
c010247a:	89 c6                	mov    %eax,%esi
c010247c:	89 c8                	mov    %ecx,%eax
c010247e:	99                   	cltd   
c010247f:	f7 fe                	idiv   %esi
c0102481:	01 d8                	add    %ebx,%eax
c0102483:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102486:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010248d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102492:	83 ec 0c             	sub    $0xc,%esp
c0102495:	6a 07                	push   $0x7
c0102497:	68 00 02 00 00       	push   $0x200
c010249c:	50                   	push   %eax
c010249d:	ff 75 e0             	pushl  -0x20(%ebp)
c01024a0:	ff 75 e4             	pushl  -0x1c(%ebp)
c01024a3:	e8 0c f4 ff ff       	call   c01018b4 <rd_wt>
c01024a8:	83 c4 20             	add    $0x20,%esp
c01024ab:	8b 45 0c             	mov    0xc(%ebp),%eax
c01024ae:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01024b1:	b8 00 02 00 00       	mov    $0x200,%eax
c01024b6:	99                   	cltd   
c01024b7:	f7 7d e8             	idivl  -0x18(%ebp)
c01024ba:	89 c3                	mov    %eax,%ebx
c01024bc:	89 c8                	mov    %ecx,%eax
c01024be:	99                   	cltd   
c01024bf:	f7 fb                	idiv   %ebx
c01024c1:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01024c4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01024ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01024cd:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c01024d1:	01 d0                	add    %edx,%eax
c01024d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01024d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024d9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01024dc:	8b 0a                	mov    (%edx),%ecx
c01024de:	89 08                	mov    %ecx,(%eax)
c01024e0:	8b 4a 04             	mov    0x4(%edx),%ecx
c01024e3:	89 48 04             	mov    %ecx,0x4(%eax)
c01024e6:	8b 4a 08             	mov    0x8(%edx),%ecx
c01024e9:	89 48 08             	mov    %ecx,0x8(%eax)
c01024ec:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01024ef:	89 48 0c             	mov    %ecx,0xc(%eax)
c01024f2:	8b 4a 10             	mov    0x10(%edx),%ecx
c01024f5:	89 48 10             	mov    %ecx,0x10(%eax)
c01024f8:	8b 4a 14             	mov    0x14(%edx),%ecx
c01024fb:	89 48 14             	mov    %ecx,0x14(%eax)
c01024fe:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102501:	89 48 18             	mov    %ecx,0x18(%eax)
c0102504:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102507:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010250a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010250d:	89 48 20             	mov    %ecx,0x20(%eax)
c0102510:	8b 52 24             	mov    0x24(%edx),%edx
c0102513:	89 50 24             	mov    %edx,0x24(%eax)
c0102516:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102519:	8b 55 0c             	mov    0xc(%ebp),%edx
c010251c:	89 50 10             	mov    %edx,0x10(%eax)
c010251f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102522:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102525:	89 50 20             	mov    %edx,0x20(%eax)
c0102528:	8b 45 08             	mov    0x8(%ebp),%eax
c010252b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010252e:	8b 0a                	mov    (%edx),%ecx
c0102530:	89 08                	mov    %ecx,(%eax)
c0102532:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102535:	89 48 04             	mov    %ecx,0x4(%eax)
c0102538:	8b 4a 08             	mov    0x8(%edx),%ecx
c010253b:	89 48 08             	mov    %ecx,0x8(%eax)
c010253e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102541:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102544:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102547:	89 48 10             	mov    %ecx,0x10(%eax)
c010254a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010254d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102550:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102553:	89 48 18             	mov    %ecx,0x18(%eax)
c0102556:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102559:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010255c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010255f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102562:	8b 52 24             	mov    0x24(%edx),%edx
c0102565:	89 50 24             	mov    %edx,0x24(%eax)
c0102568:	8b 45 08             	mov    0x8(%ebp),%eax
c010256b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010256e:	5b                   	pop    %ebx
c010256f:	5e                   	pop    %esi
c0102570:	5d                   	pop    %ebp
c0102571:	c3                   	ret    

c0102572 <create_file>:
c0102572:	55                   	push   %ebp
c0102573:	89 e5                	mov    %esp,%ebp
c0102575:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010257b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010257e:	50                   	push   %eax
c010257f:	ff 75 0c             	pushl  0xc(%ebp)
c0102582:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102585:	50                   	push   %eax
c0102586:	e8 59 fd ff ff       	call   c01022e4 <strip_path>
c010258b:	83 c4 0c             	add    $0xc,%esp
c010258e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102591:	75 0a                	jne    c010259d <create_file+0x2b>
c0102593:	b8 00 00 00 00       	mov    $0x0,%eax
c0102598:	e9 de 00 00 00       	jmp    c010267b <create_file+0x109>
c010259d:	e8 db 00 00 00       	call   c010267d <alloc_imap_bit>
c01025a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01025a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01025a9:	75 0a                	jne    c01025b5 <create_file+0x43>
c01025ab:	b8 00 00 00 00       	mov    $0x0,%eax
c01025b0:	e9 c6 00 00 00       	jmp    c010267b <create_file+0x109>
c01025b5:	e8 d6 10 00 00       	call   c0103690 <get_super_block>
c01025ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01025bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025c0:	8b 40 10             	mov    0x10(%eax),%eax
c01025c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01025c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01025c9:	83 ec 08             	sub    $0x8,%esp
c01025cc:	50                   	push   %eax
c01025cd:	ff 75 f4             	pushl  -0xc(%ebp)
c01025d0:	e8 a5 01 00 00       	call   c010277a <alloc_smap_bit>
c01025d5:	83 c4 10             	add    $0x10,%esp
c01025d8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01025db:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01025df:	75 0a                	jne    c01025eb <create_file+0x79>
c01025e1:	b8 00 00 00 00       	mov    $0x0,%eax
c01025e6:	e9 90 00 00 00       	jmp    c010267b <create_file+0x109>
c01025eb:	83 ec 04             	sub    $0x4,%esp
c01025ee:	ff 75 e8             	pushl  -0x18(%ebp)
c01025f1:	ff 75 f4             	pushl  -0xc(%ebp)
c01025f4:	8d 45 84             	lea    -0x7c(%ebp),%eax
c01025f7:	50                   	push   %eax
c01025f8:	e8 1e 03 00 00       	call   c010291b <new_inode>
c01025fd:	83 c4 10             	add    $0x10,%esp
c0102600:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102603:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102607:	75 07                	jne    c0102610 <create_file+0x9e>
c0102609:	b8 00 00 00 00       	mov    $0x0,%eax
c010260e:	eb 6b                	jmp    c010267b <create_file+0x109>
c0102610:	ff 75 f4             	pushl  -0xc(%ebp)
c0102613:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102616:	50                   	push   %eax
c0102617:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010261a:	50                   	push   %eax
c010261b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102621:	50                   	push   %eax
c0102622:	e8 12 04 00 00       	call   c0102a39 <new_dir_entry>
c0102627:	83 c4 10             	add    $0x10,%esp
c010262a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010262d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102631:	75 07                	jne    c010263a <create_file+0xc8>
c0102633:	b8 00 00 00 00       	mov    $0x0,%eax
c0102638:	eb 41                	jmp    c010267b <create_file+0x109>
c010263a:	8b 45 08             	mov    0x8(%ebp),%eax
c010263d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102640:	89 10                	mov    %edx,(%eax)
c0102642:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102645:	89 50 04             	mov    %edx,0x4(%eax)
c0102648:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010264b:	89 50 08             	mov    %edx,0x8(%eax)
c010264e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102651:	89 50 0c             	mov    %edx,0xc(%eax)
c0102654:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102657:	89 50 10             	mov    %edx,0x10(%eax)
c010265a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010265d:	89 50 14             	mov    %edx,0x14(%eax)
c0102660:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102663:	89 50 18             	mov    %edx,0x18(%eax)
c0102666:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102669:	89 50 1c             	mov    %edx,0x1c(%eax)
c010266c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010266f:	89 50 20             	mov    %edx,0x20(%eax)
c0102672:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102675:	89 50 24             	mov    %edx,0x24(%eax)
c0102678:	8b 45 08             	mov    0x8(%ebp),%eax
c010267b:	c9                   	leave  
c010267c:	c3                   	ret    

c010267d <alloc_imap_bit>:
c010267d:	55                   	push   %ebp
c010267e:	89 e5                	mov    %esp,%ebp
c0102680:	53                   	push   %ebx
c0102681:	83 ec 24             	sub    $0x24,%esp
c0102684:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010268b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102692:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102697:	83 ec 0c             	sub    $0xc,%esp
c010269a:	6a 07                	push   $0x7
c010269c:	68 00 02 00 00       	push   $0x200
c01026a1:	50                   	push   %eax
c01026a2:	ff 75 e8             	pushl  -0x18(%ebp)
c01026a5:	ff 75 ec             	pushl  -0x14(%ebp)
c01026a8:	e8 07 f2 ff ff       	call   c01018b4 <rd_wt>
c01026ad:	83 c4 20             	add    $0x20,%esp
c01026b0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01026b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01026be:	e9 a5 00 00 00       	jmp    c0102768 <alloc_imap_bit+0xeb>
c01026c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01026ca:	e9 8b 00 00 00       	jmp    c010275a <alloc_imap_bit+0xdd>
c01026cf:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026d8:	01 d0                	add    %edx,%eax
c01026da:	0f b6 00             	movzbl (%eax),%eax
c01026dd:	0f be d0             	movsbl %al,%edx
c01026e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026e3:	89 c1                	mov    %eax,%ecx
c01026e5:	d3 fa                	sar    %cl,%edx
c01026e7:	89 d0                	mov    %edx,%eax
c01026e9:	83 e0 01             	and    $0x1,%eax
c01026ec:	85 c0                	test   %eax,%eax
c01026ee:	74 06                	je     c01026f6 <alloc_imap_bit+0x79>
c01026f0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01026f4:	eb 64                	jmp    c010275a <alloc_imap_bit+0xdd>
c01026f6:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026ff:	01 d0                	add    %edx,%eax
c0102701:	0f b6 18             	movzbl (%eax),%ebx
c0102704:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102707:	ba 01 00 00 00       	mov    $0x1,%edx
c010270c:	89 c1                	mov    %eax,%ecx
c010270e:	d3 e2                	shl    %cl,%edx
c0102710:	89 d0                	mov    %edx,%eax
c0102712:	89 c1                	mov    %eax,%ecx
c0102714:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010271a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010271d:	01 d0                	add    %edx,%eax
c010271f:	09 cb                	or     %ecx,%ebx
c0102721:	89 da                	mov    %ebx,%edx
c0102723:	88 10                	mov    %dl,(%eax)
c0102725:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102728:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010272f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102732:	01 d0                	add    %edx,%eax
c0102734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102737:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010273c:	83 ec 0c             	sub    $0xc,%esp
c010273f:	6a 0a                	push   $0xa
c0102741:	68 00 02 00 00       	push   $0x200
c0102746:	50                   	push   %eax
c0102747:	ff 75 e8             	pushl  -0x18(%ebp)
c010274a:	ff 75 ec             	pushl  -0x14(%ebp)
c010274d:	e8 62 f1 ff ff       	call   c01018b4 <rd_wt>
c0102752:	83 c4 20             	add    $0x20,%esp
c0102755:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102758:	eb 1b                	jmp    c0102775 <alloc_imap_bit+0xf8>
c010275a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010275e:	0f 8e 6b ff ff ff    	jle    c01026cf <alloc_imap_bit+0x52>
c0102764:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102768:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010276f:	0f 8e 4e ff ff ff    	jle    c01026c3 <alloc_imap_bit+0x46>
c0102775:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102778:	c9                   	leave  
c0102779:	c3                   	ret    

c010277a <alloc_smap_bit>:
c010277a:	55                   	push   %ebp
c010277b:	89 e5                	mov    %esp,%ebp
c010277d:	53                   	push   %ebx
c010277e:	83 ec 34             	sub    $0x34,%esp
c0102781:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102785:	75 1c                	jne    c01027a3 <alloc_smap_bit+0x29>
c0102787:	68 fd 02 00 00       	push   $0x2fd
c010278c:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102791:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102796:	68 08 b4 10 c0       	push   $0xc010b408
c010279b:	e8 a5 61 00 00       	call   c0108945 <assertion_failure>
c01027a0:	83 c4 10             	add    $0x10,%esp
c01027a3:	e8 e8 0e 00 00       	call   c0103690 <get_super_block>
c01027a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01027ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01027ae:	8b 40 08             	mov    0x8(%eax),%eax
c01027b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01027b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01027b7:	8b 40 04             	mov    0x4(%eax),%eax
c01027ba:	83 c0 02             	add    $0x2,%eax
c01027bd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01027c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01027c7:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c01027ce:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01027d5:	e9 20 01 00 00       	jmp    c01028fa <alloc_smap_bit+0x180>
c01027da:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01027dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027e0:	01 d0                	add    %edx,%eax
c01027e2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01027e5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01027ea:	83 ec 0c             	sub    $0xc,%esp
c01027ed:	6a 07                	push   $0x7
c01027ef:	68 00 02 00 00       	push   $0x200
c01027f4:	50                   	push   %eax
c01027f5:	ff 75 d8             	pushl  -0x28(%ebp)
c01027f8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01027fb:	e8 b4 f0 ff ff       	call   c01018b4 <rd_wt>
c0102800:	83 c4 20             	add    $0x20,%esp
c0102803:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010280a:	e9 b0 00 00 00       	jmp    c01028bf <alloc_smap_bit+0x145>
c010280f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102816:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010281a:	0f 85 8c 00 00 00    	jne    c01028ac <alloc_smap_bit+0x132>
c0102820:	eb 45                	jmp    c0102867 <alloc_smap_bit+0xed>
c0102822:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102828:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010282b:	01 d0                	add    %edx,%eax
c010282d:	0f b6 00             	movzbl (%eax),%eax
c0102830:	0f be d0             	movsbl %al,%edx
c0102833:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102836:	89 c1                	mov    %eax,%ecx
c0102838:	d3 fa                	sar    %cl,%edx
c010283a:	89 d0                	mov    %edx,%eax
c010283c:	83 e0 01             	and    $0x1,%eax
c010283f:	85 c0                	test   %eax,%eax
c0102841:	74 06                	je     c0102849 <alloc_smap_bit+0xcf>
c0102843:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102847:	eb 1e                	jmp    c0102867 <alloc_smap_bit+0xed>
c0102849:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010284c:	c1 e0 09             	shl    $0x9,%eax
c010284f:	89 c2                	mov    %eax,%edx
c0102851:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102854:	01 d0                	add    %edx,%eax
c0102856:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010285d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102860:	01 d0                	add    %edx,%eax
c0102862:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102865:	eb 06                	jmp    c010286d <alloc_smap_bit+0xf3>
c0102867:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010286b:	7e b5                	jle    c0102822 <alloc_smap_bit+0xa8>
c010286d:	eb 3d                	jmp    c01028ac <alloc_smap_bit+0x132>
c010286f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102873:	74 45                	je     c01028ba <alloc_smap_bit+0x140>
c0102875:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010287b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010287e:	01 d0                	add    %edx,%eax
c0102880:	0f b6 18             	movzbl (%eax),%ebx
c0102883:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102886:	ba 01 00 00 00       	mov    $0x1,%edx
c010288b:	89 c1                	mov    %eax,%ecx
c010288d:	d3 e2                	shl    %cl,%edx
c010288f:	89 d0                	mov    %edx,%eax
c0102891:	89 c1                	mov    %eax,%ecx
c0102893:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102899:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010289c:	01 d0                	add    %edx,%eax
c010289e:	09 cb                	or     %ecx,%ebx
c01028a0:	89 da                	mov    %ebx,%edx
c01028a2:	88 10                	mov    %dl,(%eax)
c01028a4:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01028a8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01028ac:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01028b0:	74 09                	je     c01028bb <alloc_smap_bit+0x141>
c01028b2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c01028b6:	7e b7                	jle    c010286f <alloc_smap_bit+0xf5>
c01028b8:	eb 01                	jmp    c01028bb <alloc_smap_bit+0x141>
c01028ba:	90                   	nop
c01028bb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01028bf:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c01028c6:	0f 8e 43 ff ff ff    	jle    c010280f <alloc_smap_bit+0x95>
c01028cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01028d0:	74 1e                	je     c01028f0 <alloc_smap_bit+0x176>
c01028d2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01028d7:	83 ec 0c             	sub    $0xc,%esp
c01028da:	6a 0a                	push   $0xa
c01028dc:	68 00 02 00 00       	push   $0x200
c01028e1:	50                   	push   %eax
c01028e2:	ff 75 d8             	pushl  -0x28(%ebp)
c01028e5:	ff 75 d4             	pushl  -0x2c(%ebp)
c01028e8:	e8 c7 ef ff ff       	call   c01018b4 <rd_wt>
c01028ed:	83 c4 20             	add    $0x20,%esp
c01028f0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01028f4:	74 12                	je     c0102908 <alloc_smap_bit+0x18e>
c01028f6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01028fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028fd:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102900:	0f 8c d4 fe ff ff    	jl     c01027da <alloc_smap_bit+0x60>
c0102906:	eb 01                	jmp    c0102909 <alloc_smap_bit+0x18f>
c0102908:	90                   	nop
c0102909:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010290c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010290f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102912:	8b 00                	mov    (%eax),%eax
c0102914:	01 d0                	add    %edx,%eax
c0102916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102919:	c9                   	leave  
c010291a:	c3                   	ret    

c010291b <new_inode>:
c010291b:	55                   	push   %ebp
c010291c:	89 e5                	mov    %esp,%ebp
c010291e:	83 ec 38             	sub    $0x38,%esp
c0102921:	83 ec 08             	sub    $0x8,%esp
c0102924:	ff 75 0c             	pushl  0xc(%ebp)
c0102927:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010292a:	50                   	push   %eax
c010292b:	e8 80 fa ff ff       	call   c01023b0 <get_inode>
c0102930:	83 c4 10             	add    $0x10,%esp
c0102933:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102936:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010293a:	75 0a                	jne    c0102946 <new_inode+0x2b>
c010293c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102941:	e9 f1 00 00 00       	jmp    c0102a37 <new_inode+0x11c>
c0102946:	8b 45 10             	mov    0x10(%ebp),%eax
c0102949:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010294c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102953:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010295a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102961:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102964:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102967:	83 ec 0c             	sub    $0xc,%esp
c010296a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010296d:	50                   	push   %eax
c010296e:	e8 39 0b 00 00       	call   c01034ac <sync_inode>
c0102973:	83 c4 10             	add    $0x10,%esp
c0102976:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010297d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102984:	eb 1d                	jmp    c01029a3 <new_inode+0x88>
c0102986:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102989:	89 d0                	mov    %edx,%eax
c010298b:	c1 e0 02             	shl    $0x2,%eax
c010298e:	01 d0                	add    %edx,%eax
c0102990:	c1 e0 03             	shl    $0x3,%eax
c0102993:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102998:	8b 00                	mov    (%eax),%eax
c010299a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010299d:	74 0c                	je     c01029ab <new_inode+0x90>
c010299f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01029a3:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c01029a7:	7e dd                	jle    c0102986 <new_inode+0x6b>
c01029a9:	eb 01                	jmp    c01029ac <new_inode+0x91>
c01029ab:	90                   	nop
c01029ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01029af:	89 d0                	mov    %edx,%eax
c01029b1:	c1 e0 02             	shl    $0x2,%eax
c01029b4:	01 d0                	add    %edx,%eax
c01029b6:	c1 e0 03             	shl    $0x3,%eax
c01029b9:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c01029be:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01029c1:	89 10                	mov    %edx,(%eax)
c01029c3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01029c6:	89 50 04             	mov    %edx,0x4(%eax)
c01029c9:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01029cc:	89 50 08             	mov    %edx,0x8(%eax)
c01029cf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01029d2:	89 50 0c             	mov    %edx,0xc(%eax)
c01029d5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01029d8:	89 50 10             	mov    %edx,0x10(%eax)
c01029db:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01029de:	89 50 14             	mov    %edx,0x14(%eax)
c01029e1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01029e4:	89 50 18             	mov    %edx,0x18(%eax)
c01029e7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01029ea:	89 50 1c             	mov    %edx,0x1c(%eax)
c01029ed:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01029f0:	89 50 20             	mov    %edx,0x20(%eax)
c01029f3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01029f6:	89 50 24             	mov    %edx,0x24(%eax)
c01029f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01029fc:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01029ff:	89 10                	mov    %edx,(%eax)
c0102a01:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a04:	89 50 04             	mov    %edx,0x4(%eax)
c0102a07:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102a0a:	89 50 08             	mov    %edx,0x8(%eax)
c0102a0d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102a10:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a13:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102a16:	89 50 10             	mov    %edx,0x10(%eax)
c0102a19:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102a1c:	89 50 14             	mov    %edx,0x14(%eax)
c0102a1f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102a22:	89 50 18             	mov    %edx,0x18(%eax)
c0102a25:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102a28:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102a2b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102a2e:	89 50 20             	mov    %edx,0x20(%eax)
c0102a31:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102a34:	89 50 24             	mov    %edx,0x24(%eax)
c0102a37:	c9                   	leave  
c0102a38:	c3                   	ret    

c0102a39 <new_dir_entry>:
c0102a39:	55                   	push   %ebp
c0102a3a:	89 e5                	mov    %esp,%ebp
c0102a3c:	83 ec 48             	sub    $0x48,%esp
c0102a3f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102a46:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a49:	8b 40 04             	mov    0x4(%eax),%eax
c0102a4c:	99                   	cltd   
c0102a4d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a50:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102a53:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a56:	8b 40 0c             	mov    0xc(%eax),%eax
c0102a59:	99                   	cltd   
c0102a5a:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a5d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102a60:	e8 2b 0c 00 00       	call   c0103690 <get_super_block>
c0102a65:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102a68:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102a6b:	8b 00                	mov    (%eax),%eax
c0102a6d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102a70:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a73:	8b 40 0c             	mov    0xc(%eax),%eax
c0102a76:	05 00 02 00 00       	add    $0x200,%eax
c0102a7b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102a81:	85 c0                	test   %eax,%eax
c0102a83:	0f 48 c2             	cmovs  %edx,%eax
c0102a86:	c1 f8 09             	sar    $0x9,%eax
c0102a89:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102a8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102a93:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102a9a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102aa1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102aa8:	eb 7f                	jmp    c0102b29 <new_dir_entry+0xf0>
c0102aaa:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102aaf:	89 c1                	mov    %eax,%ecx
c0102ab1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102ab4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102ab7:	01 d0                	add    %edx,%eax
c0102ab9:	83 ec 0c             	sub    $0xc,%esp
c0102abc:	6a 07                	push   $0x7
c0102abe:	68 00 02 00 00       	push   $0x200
c0102ac3:	51                   	push   %ecx
c0102ac4:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102ac7:	50                   	push   %eax
c0102ac8:	e8 e7 ed ff ff       	call   c01018b4 <rd_wt>
c0102acd:	83 c4 20             	add    $0x20,%esp
c0102ad0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102ad5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102ad8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102adf:	eb 25                	jmp    c0102b06 <new_dir_entry+0xcd>
c0102ae1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102ae5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102ae8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102aeb:	7f 29                	jg     c0102b16 <new_dir_entry+0xdd>
c0102aed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102af0:	8b 00                	mov    (%eax),%eax
c0102af2:	85 c0                	test   %eax,%eax
c0102af4:	75 08                	jne    c0102afe <new_dir_entry+0xc5>
c0102af6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102af9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102afc:	eb 19                	jmp    c0102b17 <new_dir_entry+0xde>
c0102afe:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102b02:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102b06:	b8 00 02 00 00       	mov    $0x200,%eax
c0102b0b:	99                   	cltd   
c0102b0c:	f7 7d dc             	idivl  -0x24(%ebp)
c0102b0f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102b12:	7c cd                	jl     c0102ae1 <new_dir_entry+0xa8>
c0102b14:	eb 01                	jmp    c0102b17 <new_dir_entry+0xde>
c0102b16:	90                   	nop
c0102b17:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b1a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102b1d:	7f 16                	jg     c0102b35 <new_dir_entry+0xfc>
c0102b1f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102b23:	75 10                	jne    c0102b35 <new_dir_entry+0xfc>
c0102b25:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102b29:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b2c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102b2f:	0f 8c 75 ff ff ff    	jl     c0102aaa <new_dir_entry+0x71>
c0102b35:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102b38:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102b3b:	75 0a                	jne    c0102b47 <new_dir_entry+0x10e>
c0102b3d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102b42:	e9 fc 00 00 00       	jmp    c0102c43 <new_dir_entry+0x20a>
c0102b47:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102b4e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102b52:	75 1e                	jne    c0102b72 <new_dir_entry+0x139>
c0102b54:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b57:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102b5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b5d:	8b 50 04             	mov    0x4(%eax),%edx
c0102b60:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102b63:	01 c2                	add    %eax,%edx
c0102b65:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b68:	89 50 04             	mov    %edx,0x4(%eax)
c0102b6b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102b72:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b75:	8b 55 14             	mov    0x14(%ebp),%edx
c0102b78:	89 10                	mov    %edx,(%eax)
c0102b7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b7d:	83 c0 04             	add    $0x4,%eax
c0102b80:	83 ec 08             	sub    $0x8,%esp
c0102b83:	ff 75 10             	pushl  0x10(%ebp)
c0102b86:	50                   	push   %eax
c0102b87:	e8 62 96 00 00       	call   c010c1ee <Strcpy>
c0102b8c:	83 c4 10             	add    $0x10,%esp
c0102b8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b92:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102b95:	8b 0a                	mov    (%edx),%ecx
c0102b97:	89 08                	mov    %ecx,(%eax)
c0102b99:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102b9c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102b9f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102ba2:	89 48 08             	mov    %ecx,0x8(%eax)
c0102ba5:	8b 52 0c             	mov    0xc(%edx),%edx
c0102ba8:	89 50 0c             	mov    %edx,0xc(%eax)
c0102bab:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102bb0:	89 c1                	mov    %eax,%ecx
c0102bb2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102bb5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102bb8:	01 d0                	add    %edx,%eax
c0102bba:	83 ec 0c             	sub    $0xc,%esp
c0102bbd:	6a 0a                	push   $0xa
c0102bbf:	68 00 02 00 00       	push   $0x200
c0102bc4:	51                   	push   %ecx
c0102bc5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102bc8:	50                   	push   %eax
c0102bc9:	e8 e6 ec ff ff       	call   c01018b4 <rd_wt>
c0102bce:	83 c4 20             	add    $0x20,%esp
c0102bd1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102bd5:	74 69                	je     c0102c40 <new_dir_entry+0x207>
c0102bd7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bda:	8b 10                	mov    (%eax),%edx
c0102bdc:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102be2:	8b 50 04             	mov    0x4(%eax),%edx
c0102be5:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102beb:	8b 50 08             	mov    0x8(%eax),%edx
c0102bee:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102bf4:	8b 50 0c             	mov    0xc(%eax),%edx
c0102bf7:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102bfd:	8b 50 10             	mov    0x10(%eax),%edx
c0102c00:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102c06:	8b 50 14             	mov    0x14(%eax),%edx
c0102c09:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102c0f:	8b 50 18             	mov    0x18(%eax),%edx
c0102c12:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102c18:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102c1b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102c21:	8b 50 20             	mov    0x20(%eax),%edx
c0102c24:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102c2a:	8b 40 24             	mov    0x24(%eax),%eax
c0102c2d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102c32:	83 ec 0c             	sub    $0xc,%esp
c0102c35:	ff 75 0c             	pushl  0xc(%ebp)
c0102c38:	e8 6f 08 00 00       	call   c01034ac <sync_inode>
c0102c3d:	83 c4 10             	add    $0x10,%esp
c0102c40:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c43:	c9                   	leave  
c0102c44:	c3                   	ret    

c0102c45 <do_unlink>:
c0102c45:	55                   	push   %ebp
c0102c46:	89 e5                	mov    %esp,%ebp
c0102c48:	53                   	push   %ebx
c0102c49:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102c4f:	83 ec 08             	sub    $0x8,%esp
c0102c52:	ff 75 08             	pushl  0x8(%ebp)
c0102c55:	68 1d b4 10 c0       	push   $0xc010b41d
c0102c5a:	e8 bd 6c 00 00       	call   c010991c <strcmp>
c0102c5f:	83 c4 10             	add    $0x10,%esp
c0102c62:	85 c0                	test   %eax,%eax
c0102c64:	75 10                	jne    c0102c76 <do_unlink+0x31>
c0102c66:	83 ec 0c             	sub    $0xc,%esp
c0102c69:	68 1f b4 10 c0       	push   $0xc010b41f
c0102c6e:	e8 b4 5c 00 00       	call   c0108927 <panic>
c0102c73:	83 c4 10             	add    $0x10,%esp
c0102c76:	83 ec 0c             	sub    $0xc,%esp
c0102c79:	ff 75 08             	pushl  0x8(%ebp)
c0102c7c:	e8 31 f5 ff ff       	call   c01021b2 <search_file>
c0102c81:	83 c4 10             	add    $0x10,%esp
c0102c84:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102c87:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102c8b:	75 10                	jne    c0102c9d <do_unlink+0x58>
c0102c8d:	83 ec 0c             	sub    $0xc,%esp
c0102c90:	68 3b b4 10 c0       	push   $0xc010b43b
c0102c95:	e8 8d 5c 00 00       	call   c0108927 <panic>
c0102c9a:	83 c4 10             	add    $0x10,%esp
c0102c9d:	83 ec 08             	sub    $0x8,%esp
c0102ca0:	ff 75 d0             	pushl  -0x30(%ebp)
c0102ca3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102ca9:	50                   	push   %eax
c0102caa:	e8 01 f7 ff ff       	call   c01023b0 <get_inode>
c0102caf:	83 c4 10             	add    $0x10,%esp
c0102cb2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102cb5:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102cb9:	75 10                	jne    c0102ccb <do_unlink+0x86>
c0102cbb:	83 ec 0c             	sub    $0xc,%esp
c0102cbe:	68 3b b4 10 c0       	push   $0xc010b43b
c0102cc3:	e8 5f 5c 00 00       	call   c0108927 <panic>
c0102cc8:	83 c4 10             	add    $0x10,%esp
c0102ccb:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102cce:	85 c0                	test   %eax,%eax
c0102cd0:	7e 10                	jle    c0102ce2 <do_unlink+0x9d>
c0102cd2:	83 ec 0c             	sub    $0xc,%esp
c0102cd5:	68 54 b4 10 c0       	push   $0xc010b454
c0102cda:	e8 48 5c 00 00       	call   c0108927 <panic>
c0102cdf:	83 c4 10             	add    $0x10,%esp
c0102ce2:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102ce8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102ceb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102cee:	8d 50 07             	lea    0x7(%eax),%edx
c0102cf1:	85 c0                	test   %eax,%eax
c0102cf3:	0f 48 c2             	cmovs  %edx,%eax
c0102cf6:	c1 f8 03             	sar    $0x3,%eax
c0102cf9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102cfc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102cff:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102d05:	85 c0                	test   %eax,%eax
c0102d07:	0f 48 c2             	cmovs  %edx,%eax
c0102d0a:	c1 f8 09             	sar    $0x9,%eax
c0102d0d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102d10:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102d13:	99                   	cltd   
c0102d14:	c1 ea 1d             	shr    $0x1d,%edx
c0102d17:	01 d0                	add    %edx,%eax
c0102d19:	83 e0 07             	and    $0x7,%eax
c0102d1c:	29 d0                	sub    %edx,%eax
c0102d1e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102d21:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102d28:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d2d:	89 c2                	mov    %eax,%edx
c0102d2f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102d32:	83 c0 02             	add    $0x2,%eax
c0102d35:	83 ec 0c             	sub    $0xc,%esp
c0102d38:	6a 07                	push   $0x7
c0102d3a:	68 00 02 00 00       	push   $0x200
c0102d3f:	52                   	push   %edx
c0102d40:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d43:	50                   	push   %eax
c0102d44:	e8 6b eb ff ff       	call   c01018b4 <rd_wt>
c0102d49:	83 c4 20             	add    $0x20,%esp
c0102d4c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d52:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d55:	01 d0                	add    %edx,%eax
c0102d57:	0f b6 10             	movzbl (%eax),%edx
c0102d5a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102d5d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102d62:	89 c1                	mov    %eax,%ecx
c0102d64:	d3 e3                	shl    %cl,%ebx
c0102d66:	89 d8                	mov    %ebx,%eax
c0102d68:	f7 d0                	not    %eax
c0102d6a:	89 c3                	mov    %eax,%ebx
c0102d6c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102d72:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d75:	01 c8                	add    %ecx,%eax
c0102d77:	21 da                	and    %ebx,%edx
c0102d79:	88 10                	mov    %dl,(%eax)
c0102d7b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d80:	89 c2                	mov    %eax,%edx
c0102d82:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102d85:	83 c0 02             	add    $0x2,%eax
c0102d88:	83 ec 0c             	sub    $0xc,%esp
c0102d8b:	6a 0a                	push   $0xa
c0102d8d:	68 00 02 00 00       	push   $0x200
c0102d92:	52                   	push   %edx
c0102d93:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d96:	50                   	push   %eax
c0102d97:	e8 18 eb ff ff       	call   c01018b4 <rd_wt>
c0102d9c:	83 c4 20             	add    $0x20,%esp
c0102d9f:	e8 ec 08 00 00       	call   c0103690 <get_super_block>
c0102da4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102da7:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102dad:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102db0:	8b 00                	mov    (%eax),%eax
c0102db2:	29 c2                	sub    %eax,%edx
c0102db4:	89 d0                	mov    %edx,%eax
c0102db6:	83 c0 01             	add    $0x1,%eax
c0102db9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102dbc:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102dbf:	8d 50 07             	lea    0x7(%eax),%edx
c0102dc2:	85 c0                	test   %eax,%eax
c0102dc4:	0f 48 c2             	cmovs  %edx,%eax
c0102dc7:	c1 f8 03             	sar    $0x3,%eax
c0102dca:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102dcd:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102dd0:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102dd6:	85 c0                	test   %eax,%eax
c0102dd8:	0f 48 c2             	cmovs  %edx,%eax
c0102ddb:	c1 f8 09             	sar    $0x9,%eax
c0102dde:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102de1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102de4:	99                   	cltd   
c0102de5:	c1 ea 1d             	shr    $0x1d,%edx
c0102de8:	01 d0                	add    %edx,%eax
c0102dea:	83 e0 07             	and    $0x7,%eax
c0102ded:	29 d0                	sub    %edx,%eax
c0102def:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102df2:	b8 08 00 00 00       	mov    $0x8,%eax
c0102df7:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102dfa:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102dfd:	29 c2                	sub    %eax,%edx
c0102dff:	89 d0                	mov    %edx,%eax
c0102e01:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102e04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e07:	8d 50 07             	lea    0x7(%eax),%edx
c0102e0a:	85 c0                	test   %eax,%eax
c0102e0c:	0f 48 c2             	cmovs  %edx,%eax
c0102e0f:	c1 f8 03             	sar    $0x3,%eax
c0102e12:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102e15:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e1a:	89 c1                	mov    %eax,%ecx
c0102e1c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102e1f:	8b 40 04             	mov    0x4(%eax),%eax
c0102e22:	8d 50 02             	lea    0x2(%eax),%edx
c0102e25:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102e28:	01 d0                	add    %edx,%eax
c0102e2a:	83 ec 0c             	sub    $0xc,%esp
c0102e2d:	6a 07                	push   $0x7
c0102e2f:	68 00 02 00 00       	push   $0x200
c0102e34:	51                   	push   %ecx
c0102e35:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e38:	50                   	push   %eax
c0102e39:	e8 76 ea ff ff       	call   c01018b4 <rd_wt>
c0102e3e:	83 c4 20             	add    $0x20,%esp
c0102e41:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102e47:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e4a:	01 d0                	add    %edx,%eax
c0102e4c:	0f b6 10             	movzbl (%eax),%edx
c0102e4f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102e52:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102e57:	89 c1                	mov    %eax,%ecx
c0102e59:	d3 e3                	shl    %cl,%ebx
c0102e5b:	89 d8                	mov    %ebx,%eax
c0102e5d:	f7 d0                	not    %eax
c0102e5f:	89 c3                	mov    %eax,%ebx
c0102e61:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102e67:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e6a:	01 c8                	add    %ecx,%eax
c0102e6c:	21 da                	and    %ebx,%edx
c0102e6e:	88 10                	mov    %dl,(%eax)
c0102e70:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102e77:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102e7a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102e7d:	eb 6b                	jmp    c0102eea <do_unlink+0x2a5>
c0102e7f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102e86:	75 4c                	jne    c0102ed4 <do_unlink+0x28f>
c0102e88:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102e8f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e94:	83 ec 0c             	sub    $0xc,%esp
c0102e97:	6a 0a                	push   $0xa
c0102e99:	68 00 02 00 00       	push   $0x200
c0102e9e:	50                   	push   %eax
c0102e9f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ea2:	ff 75 ec             	pushl  -0x14(%ebp)
c0102ea5:	e8 0a ea ff ff       	call   c01018b4 <rd_wt>
c0102eaa:	83 c4 20             	add    $0x20,%esp
c0102ead:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102eb2:	89 c1                	mov    %eax,%ecx
c0102eb4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102eb7:	8d 50 01             	lea    0x1(%eax),%edx
c0102eba:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102ebd:	83 ec 0c             	sub    $0xc,%esp
c0102ec0:	6a 07                	push   $0x7
c0102ec2:	68 00 02 00 00       	push   $0x200
c0102ec7:	51                   	push   %ecx
c0102ec8:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ecb:	50                   	push   %eax
c0102ecc:	e8 e3 e9 ff ff       	call   c01018b4 <rd_wt>
c0102ed1:	83 c4 20             	add    $0x20,%esp
c0102ed4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102eda:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102edd:	01 d0                	add    %edx,%eax
c0102edf:	c6 00 00             	movb   $0x0,(%eax)
c0102ee2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102ee6:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102eea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102eed:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102ef0:	7c 8d                	jl     c0102e7f <do_unlink+0x23a>
c0102ef2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102ef9:	75 4c                	jne    c0102f47 <do_unlink+0x302>
c0102efb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102f02:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f07:	83 ec 0c             	sub    $0xc,%esp
c0102f0a:	6a 0a                	push   $0xa
c0102f0c:	68 00 02 00 00       	push   $0x200
c0102f11:	50                   	push   %eax
c0102f12:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f15:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f18:	e8 97 e9 ff ff       	call   c01018b4 <rd_wt>
c0102f1d:	83 c4 20             	add    $0x20,%esp
c0102f20:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f25:	89 c1                	mov    %eax,%ecx
c0102f27:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102f2a:	8d 50 01             	lea    0x1(%eax),%edx
c0102f2d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102f30:	83 ec 0c             	sub    $0xc,%esp
c0102f33:	6a 07                	push   $0x7
c0102f35:	68 00 02 00 00       	push   $0x200
c0102f3a:	51                   	push   %ecx
c0102f3b:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f3e:	50                   	push   %eax
c0102f3f:	e8 70 e9 ff ff       	call   c01018b4 <rd_wt>
c0102f44:	83 c4 20             	add    $0x20,%esp
c0102f47:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102f4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f50:	01 d0                	add    %edx,%eax
c0102f52:	0f b6 10             	movzbl (%eax),%edx
c0102f55:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102f58:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102f5d:	89 c1                	mov    %eax,%ecx
c0102f5f:	d3 e3                	shl    %cl,%ebx
c0102f61:	89 d8                	mov    %ebx,%eax
c0102f63:	89 c3                	mov    %eax,%ebx
c0102f65:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102f6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f6e:	01 c8                	add    %ecx,%eax
c0102f70:	21 da                	and    %ebx,%edx
c0102f72:	88 10                	mov    %dl,(%eax)
c0102f74:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f79:	83 ec 0c             	sub    $0xc,%esp
c0102f7c:	6a 0a                	push   $0xa
c0102f7e:	68 00 02 00 00       	push   $0x200
c0102f83:	50                   	push   %eax
c0102f84:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f87:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f8a:	e8 25 e9 ff ff       	call   c01018b4 <rd_wt>
c0102f8f:	83 c4 20             	add    $0x20,%esp
c0102f92:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102f99:	00 00 00 
c0102f9c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102fa3:	00 00 00 
c0102fa6:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102fad:	00 00 00 
c0102fb0:	83 ec 0c             	sub    $0xc,%esp
c0102fb3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102fb9:	50                   	push   %eax
c0102fba:	e8 ed 04 00 00       	call   c01034ac <sync_inode>
c0102fbf:	83 c4 10             	add    $0x10,%esp
c0102fc2:	83 ec 0c             	sub    $0xc,%esp
c0102fc5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102fcb:	50                   	push   %eax
c0102fcc:	e8 2f 06 00 00       	call   c0103600 <put_inode>
c0102fd1:	83 c4 10             	add    $0x10,%esp
c0102fd4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102fd7:	8b 00                	mov    (%eax),%eax
c0102fd9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102fdc:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102fe3:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102fe6:	8b 40 04             	mov    0x4(%eax),%eax
c0102fe9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102fec:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102fef:	8b 40 0c             	mov    0xc(%eax),%eax
c0102ff2:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102ff5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102ff8:	c1 e8 04             	shr    $0x4,%eax
c0102ffb:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102ffe:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0103005:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010300c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0103013:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010301a:	e9 a5 00 00 00       	jmp    c01030c4 <do_unlink+0x47f>
c010301f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103024:	89 c1                	mov    %eax,%ecx
c0103026:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0103029:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010302c:	01 d0                	add    %edx,%eax
c010302e:	83 ec 0c             	sub    $0xc,%esp
c0103031:	6a 07                	push   $0x7
c0103033:	68 00 02 00 00       	push   $0x200
c0103038:	51                   	push   %ecx
c0103039:	ff 75 b8             	pushl  -0x48(%ebp)
c010303c:	50                   	push   %eax
c010303d:	e8 72 e8 ff ff       	call   c01018b4 <rd_wt>
c0103042:	83 c4 20             	add    $0x20,%esp
c0103045:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010304a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010304d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0103054:	eb 51                	jmp    c01030a7 <do_unlink+0x462>
c0103056:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010305a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010305d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103060:	7f 4f                	jg     c01030b1 <do_unlink+0x46c>
c0103062:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103065:	83 c0 10             	add    $0x10,%eax
c0103068:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010306b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010306e:	83 c0 04             	add    $0x4,%eax
c0103071:	83 ec 08             	sub    $0x8,%esp
c0103074:	ff 75 08             	pushl  0x8(%ebp)
c0103077:	50                   	push   %eax
c0103078:	e8 9f 68 00 00       	call   c010991c <strcmp>
c010307d:	83 c4 10             	add    $0x10,%esp
c0103080:	85 c0                	test   %eax,%eax
c0103082:	75 1b                	jne    c010309f <do_unlink+0x45a>
c0103084:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c010308b:	83 ec 04             	sub    $0x4,%esp
c010308e:	6a 10                	push   $0x10
c0103090:	6a 00                	push   $0x0
c0103092:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103095:	e8 35 91 00 00       	call   c010c1cf <Memset>
c010309a:	83 c4 10             	add    $0x10,%esp
c010309d:	eb 13                	jmp    c01030b2 <do_unlink+0x46d>
c010309f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c01030a3:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c01030a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01030aa:	3b 45 90             	cmp    -0x70(%ebp),%eax
c01030ad:	7c a7                	jl     c0103056 <do_unlink+0x411>
c01030af:	eb 01                	jmp    c01030b2 <do_unlink+0x46d>
c01030b1:	90                   	nop
c01030b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01030b5:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01030b8:	7f 16                	jg     c01030d0 <do_unlink+0x48b>
c01030ba:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01030be:	75 10                	jne    c01030d0 <do_unlink+0x48b>
c01030c0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c01030c4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01030c7:	3b 45 90             	cmp    -0x70(%ebp),%eax
c01030ca:	0f 8c 4f ff ff ff    	jl     c010301f <do_unlink+0x3da>
c01030d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01030d3:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01030d6:	75 17                	jne    c01030ef <do_unlink+0x4aa>
c01030d8:	8b 45 98             	mov    -0x68(%ebp),%eax
c01030db:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01030de:	89 50 04             	mov    %edx,0x4(%eax)
c01030e1:	83 ec 0c             	sub    $0xc,%esp
c01030e4:	ff 75 98             	pushl  -0x68(%ebp)
c01030e7:	e8 c0 03 00 00       	call   c01034ac <sync_inode>
c01030ec:	83 c4 10             	add    $0x10,%esp
c01030ef:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01030f3:	74 26                	je     c010311b <do_unlink+0x4d6>
c01030f5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030fa:	89 c1                	mov    %eax,%ecx
c01030fc:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01030ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103102:	01 d0                	add    %edx,%eax
c0103104:	83 ec 0c             	sub    $0xc,%esp
c0103107:	6a 0a                	push   $0xa
c0103109:	68 00 02 00 00       	push   $0x200
c010310e:	51                   	push   %ecx
c010310f:	ff 75 b8             	pushl  -0x48(%ebp)
c0103112:	50                   	push   %eax
c0103113:	e8 9c e7 ff ff       	call   c01018b4 <rd_wt>
c0103118:	83 c4 20             	add    $0x20,%esp
c010311b:	90                   	nop
c010311c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010311f:	c9                   	leave  
c0103120:	c3                   	ret    

c0103121 <do_rdwt>:
c0103121:	55                   	push   %ebp
c0103122:	89 e5                	mov    %esp,%ebp
c0103124:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010312a:	8b 45 08             	mov    0x8(%ebp),%eax
c010312d:	8b 40 78             	mov    0x78(%eax),%eax
c0103130:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103133:	8b 45 08             	mov    0x8(%ebp),%eax
c0103136:	8b 40 60             	mov    0x60(%eax),%eax
c0103139:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010313c:	8b 45 08             	mov    0x8(%ebp),%eax
c010313f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103142:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103145:	8b 45 08             	mov    0x8(%ebp),%eax
c0103148:	8b 00                	mov    (%eax),%eax
c010314a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010314d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103150:	8b 40 10             	mov    0x10(%eax),%eax
c0103153:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103156:	8b 45 08             	mov    0x8(%ebp),%eax
c0103159:	8b 40 50             	mov    0x50(%eax),%eax
c010315c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010315f:	83 ec 0c             	sub    $0xc,%esp
c0103162:	ff 75 d0             	pushl  -0x30(%ebp)
c0103165:	e8 0c 07 00 00       	call   c0103876 <pid2proc>
c010316a:	83 c4 10             	add    $0x10,%esp
c010316d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103170:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103173:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0103176:	83 c2 4c             	add    $0x4c,%edx
c0103179:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010317d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103180:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103183:	8b 40 08             	mov    0x8(%eax),%eax
c0103186:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103189:	8b 45 08             	mov    0x8(%ebp),%eax
c010318c:	8b 00                	mov    (%eax),%eax
c010318e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103191:	83 ec 08             	sub    $0x8,%esp
c0103194:	ff 75 bc             	pushl  -0x44(%ebp)
c0103197:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010319d:	50                   	push   %eax
c010319e:	e8 0d f2 ff ff       	call   c01023b0 <get_inode>
c01031a3:	83 c4 10             	add    $0x10,%esp
c01031a6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01031a9:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c01031ad:	75 10                	jne    c01031bf <do_rdwt+0x9e>
c01031af:	83 ec 0c             	sub    $0xc,%esp
c01031b2:	68 8c b4 10 c0       	push   $0xc010b48c
c01031b7:	e8 6b 57 00 00       	call   c0108927 <panic>
c01031bc:	83 c4 10             	add    $0x10,%esp
c01031bf:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01031c5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01031c8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01031cb:	8b 40 04             	mov    0x4(%eax),%eax
c01031ce:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01031d1:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01031d5:	74 22                	je     c01031f9 <do_rdwt+0xd8>
c01031d7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01031db:	74 1c                	je     c01031f9 <do_rdwt+0xd8>
c01031dd:	68 a8 04 00 00       	push   $0x4a8
c01031e2:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01031e7:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01031ec:	68 9c b4 10 c0       	push   $0xc010b49c
c01031f1:	e8 4f 57 00 00       	call   c0108945 <assertion_failure>
c01031f6:	83 c4 10             	add    $0x10,%esp
c01031f9:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c01031ff:	83 f8 01             	cmp    $0x1,%eax
c0103202:	0f 85 86 00 00 00    	jne    c010328e <do_rdwt+0x16d>
c0103208:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010320c:	75 09                	jne    c0103217 <do_rdwt+0xf6>
c010320e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103215:	eb 0d                	jmp    c0103224 <do_rdwt+0x103>
c0103217:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010321b:	75 07                	jne    c0103224 <do_rdwt+0x103>
c010321d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103224:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103227:	8b 45 08             	mov    0x8(%ebp),%eax
c010322a:	89 50 78             	mov    %edx,0x78(%eax)
c010322d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103230:	8b 45 08             	mov    0x8(%ebp),%eax
c0103233:	89 50 68             	mov    %edx,0x68(%eax)
c0103236:	83 ec 04             	sub    $0x4,%esp
c0103239:	6a 04                	push   $0x4
c010323b:	ff 75 08             	pushl  0x8(%ebp)
c010323e:	6a 03                	push   $0x3
c0103240:	e8 70 63 00 00       	call   c01095b5 <send_rec>
c0103245:	83 c4 10             	add    $0x10,%esp
c0103248:	8b 45 08             	mov    0x8(%ebp),%eax
c010324b:	8b 40 78             	mov    0x78(%eax),%eax
c010324e:	83 f8 66             	cmp    $0x66,%eax
c0103251:	75 13                	jne    c0103266 <do_rdwt+0x145>
c0103253:	83 ec 04             	sub    $0x4,%esp
c0103256:	ff 75 b8             	pushl  -0x48(%ebp)
c0103259:	ff 75 08             	pushl  0x8(%ebp)
c010325c:	6a 01                	push   $0x1
c010325e:	e8 52 63 00 00       	call   c01095b5 <send_rec>
c0103263:	83 c4 10             	add    $0x10,%esp
c0103266:	8b 45 08             	mov    0x8(%ebp),%eax
c0103269:	8b 40 78             	mov    0x78(%eax),%eax
c010326c:	83 f8 65             	cmp    $0x65,%eax
c010326f:	75 13                	jne    c0103284 <do_rdwt+0x163>
c0103271:	83 ec 04             	sub    $0x4,%esp
c0103274:	ff 75 b8             	pushl  -0x48(%ebp)
c0103277:	ff 75 08             	pushl  0x8(%ebp)
c010327a:	6a 01                	push   $0x1
c010327c:	e8 34 63 00 00       	call   c01095b5 <send_rec>
c0103281:	83 c4 10             	add    $0x10,%esp
c0103284:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103289:	e9 1c 02 00 00       	jmp    c01034aa <do_rdwt+0x389>
c010328e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103292:	75 18                	jne    c01032ac <do_rdwt+0x18b>
c0103294:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010329a:	c1 e0 09             	shl    $0x9,%eax
c010329d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c01032a0:	75 0a                	jne    c01032ac <do_rdwt+0x18b>
c01032a2:	b8 00 00 00 00       	mov    $0x0,%eax
c01032a7:	e9 fe 01 00 00       	jmp    c01034aa <do_rdwt+0x389>
c01032ac:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01032b0:	75 14                	jne    c01032c6 <do_rdwt+0x1a5>
c01032b2:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01032b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032b8:	01 d0                	add    %edx,%eax
c01032ba:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01032bd:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c01032c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01032c4:	eb 19                	jmp    c01032df <do_rdwt+0x1be>
c01032c6:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01032c9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032cc:	01 c2                	add    %eax,%edx
c01032ce:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01032d4:	c1 e0 09             	shl    $0x9,%eax
c01032d7:	39 c2                	cmp    %eax,%edx
c01032d9:	0f 4e c2             	cmovle %edx,%eax
c01032dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01032df:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01032e2:	99                   	cltd   
c01032e3:	c1 ea 17             	shr    $0x17,%edx
c01032e6:	01 d0                	add    %edx,%eax
c01032e8:	25 ff 01 00 00       	and    $0x1ff,%eax
c01032ed:	29 d0                	sub    %edx,%eax
c01032ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01032f2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01032f8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01032fb:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103301:	85 c0                	test   %eax,%eax
c0103303:	0f 48 c1             	cmovs  %ecx,%eax
c0103306:	c1 f8 09             	sar    $0x9,%eax
c0103309:	01 d0                	add    %edx,%eax
c010330b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010330e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103314:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103317:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010331d:	85 c0                	test   %eax,%eax
c010331f:	0f 48 c1             	cmovs  %ecx,%eax
c0103322:	c1 f8 09             	sar    $0x9,%eax
c0103325:	01 d0                	add    %edx,%eax
c0103327:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010332a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010332d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103330:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103335:	39 d0                	cmp    %edx,%eax
c0103337:	7d 0b                	jge    c0103344 <do_rdwt+0x223>
c0103339:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010333c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010333f:	83 c0 01             	add    $0x1,%eax
c0103342:	eb 05                	jmp    c0103349 <do_rdwt+0x228>
c0103344:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103349:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010334c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010334f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103352:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103359:	8b 45 08             	mov    0x8(%ebp),%eax
c010335c:	8b 00                	mov    (%eax),%eax
c010335e:	83 ec 0c             	sub    $0xc,%esp
c0103361:	50                   	push   %eax
c0103362:	e8 0f 05 00 00       	call   c0103876 <pid2proc>
c0103367:	83 c4 10             	add    $0x10,%esp
c010336a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010336d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103370:	83 ec 08             	sub    $0x8,%esp
c0103373:	50                   	push   %eax
c0103374:	ff 75 cc             	pushl  -0x34(%ebp)
c0103377:	e8 43 2b 00 00       	call   c0105ebf <alloc_virtual_memory>
c010337c:	83 c4 10             	add    $0x10,%esp
c010337f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103382:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103385:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103388:	e9 c5 00 00 00       	jmp    c0103452 <do_rdwt+0x331>
c010338d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103390:	c1 e0 09             	shl    $0x9,%eax
c0103393:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103396:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103399:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010339d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01033a0:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c01033a7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01033ab:	75 46                	jne    c01033f3 <do_rdwt+0x2d2>
c01033ad:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01033b0:	c1 e0 09             	shl    $0x9,%eax
c01033b3:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01033b9:	83 ec 0c             	sub    $0xc,%esp
c01033bc:	6a 07                	push   $0x7
c01033be:	50                   	push   %eax
c01033bf:	52                   	push   %edx
c01033c0:	ff 75 90             	pushl  -0x70(%ebp)
c01033c3:	ff 75 e0             	pushl  -0x20(%ebp)
c01033c6:	e8 e9 e4 ff ff       	call   c01018b4 <rd_wt>
c01033cb:	83 c4 20             	add    $0x20,%esp
c01033ce:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01033d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033d7:	01 d0                	add    %edx,%eax
c01033d9:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01033dc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01033df:	01 ca                	add    %ecx,%edx
c01033e1:	83 ec 04             	sub    $0x4,%esp
c01033e4:	ff 75 94             	pushl  -0x6c(%ebp)
c01033e7:	50                   	push   %eax
c01033e8:	52                   	push   %edx
c01033e9:	e8 3e 39 00 00       	call   c0106d2c <Memcpy>
c01033ee:	83 c4 10             	add    $0x10,%esp
c01033f1:	eb 46                	jmp    c0103439 <do_rdwt+0x318>
c01033f3:	8b 55 98             	mov    -0x68(%ebp),%edx
c01033f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01033f9:	01 d0                	add    %edx,%eax
c01033fb:	89 c1                	mov    %eax,%ecx
c01033fd:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103403:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103406:	01 d0                	add    %edx,%eax
c0103408:	83 ec 04             	sub    $0x4,%esp
c010340b:	ff 75 94             	pushl  -0x6c(%ebp)
c010340e:	51                   	push   %ecx
c010340f:	50                   	push   %eax
c0103410:	e8 17 39 00 00       	call   c0106d2c <Memcpy>
c0103415:	83 c4 10             	add    $0x10,%esp
c0103418:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010341b:	c1 e0 09             	shl    $0x9,%eax
c010341e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103424:	83 ec 0c             	sub    $0xc,%esp
c0103427:	6a 0a                	push   $0xa
c0103429:	50                   	push   %eax
c010342a:	52                   	push   %edx
c010342b:	ff 75 90             	pushl  -0x70(%ebp)
c010342e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103431:	e8 7e e4 ff ff       	call   c01018b4 <rd_wt>
c0103436:	83 c4 20             	add    $0x20,%esp
c0103439:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010343c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010343f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103442:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103445:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010344c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010344f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103452:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103455:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103458:	7f 0a                	jg     c0103464 <do_rdwt+0x343>
c010345a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010345e:	0f 85 29 ff ff ff    	jne    c010338d <do_rdwt+0x26c>
c0103464:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103467:	8b 50 04             	mov    0x4(%eax),%edx
c010346a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010346d:	01 c2                	add    %eax,%edx
c010346f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103472:	89 50 04             	mov    %edx,0x4(%eax)
c0103475:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103478:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010347b:	01 c2                	add    %eax,%edx
c010347d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103483:	39 c2                	cmp    %eax,%edx
c0103485:	7e 20                	jle    c01034a7 <do_rdwt+0x386>
c0103487:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010348a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010348d:	01 d0                	add    %edx,%eax
c010348f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103495:	83 ec 0c             	sub    $0xc,%esp
c0103498:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010349e:	50                   	push   %eax
c010349f:	e8 08 00 00 00       	call   c01034ac <sync_inode>
c01034a4:	83 c4 10             	add    $0x10,%esp
c01034a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01034aa:	c9                   	leave  
c01034ab:	c3                   	ret    

c01034ac <sync_inode>:
c01034ac:	55                   	push   %ebp
c01034ad:	89 e5                	mov    %esp,%ebp
c01034af:	53                   	push   %ebx
c01034b0:	83 ec 34             	sub    $0x34,%esp
c01034b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01034ba:	eb 74                	jmp    c0103530 <sync_inode+0x84>
c01034bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01034bf:	89 d0                	mov    %edx,%eax
c01034c1:	c1 e0 02             	shl    $0x2,%eax
c01034c4:	01 d0                	add    %edx,%eax
c01034c6:	c1 e0 03             	shl    $0x3,%eax
c01034c9:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01034ce:	8b 10                	mov    (%eax),%edx
c01034d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01034d3:	8b 40 10             	mov    0x10(%eax),%eax
c01034d6:	39 c2                	cmp    %eax,%edx
c01034d8:	75 52                	jne    c010352c <sync_inode+0x80>
c01034da:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01034dd:	89 d0                	mov    %edx,%eax
c01034df:	c1 e0 02             	shl    $0x2,%eax
c01034e2:	01 d0                	add    %edx,%eax
c01034e4:	c1 e0 03             	shl    $0x3,%eax
c01034e7:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c01034ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01034f0:	8b 08                	mov    (%eax),%ecx
c01034f2:	89 0a                	mov    %ecx,(%edx)
c01034f4:	8b 48 04             	mov    0x4(%eax),%ecx
c01034f7:	89 4a 04             	mov    %ecx,0x4(%edx)
c01034fa:	8b 48 08             	mov    0x8(%eax),%ecx
c01034fd:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103500:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103503:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103506:	8b 48 10             	mov    0x10(%eax),%ecx
c0103509:	89 4a 10             	mov    %ecx,0x10(%edx)
c010350c:	8b 48 14             	mov    0x14(%eax),%ecx
c010350f:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103512:	8b 48 18             	mov    0x18(%eax),%ecx
c0103515:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103518:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010351b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010351e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103521:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103524:	8b 40 24             	mov    0x24(%eax),%eax
c0103527:	89 42 24             	mov    %eax,0x24(%edx)
c010352a:	eb 0a                	jmp    c0103536 <sync_inode+0x8a>
c010352c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103530:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103534:	7e 86                	jle    c01034bc <sync_inode+0x10>
c0103536:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010353d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103540:	8b 40 10             	mov    0x10(%eax),%eax
c0103543:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103546:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103549:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010354c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103551:	99                   	cltd   
c0103552:	f7 7d f0             	idivl  -0x10(%ebp)
c0103555:	89 c3                	mov    %eax,%ebx
c0103557:	89 c8                	mov    %ecx,%eax
c0103559:	99                   	cltd   
c010355a:	f7 fb                	idiv   %ebx
c010355c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010355f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103562:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103565:	b8 00 02 00 00       	mov    $0x200,%eax
c010356a:	99                   	cltd   
c010356b:	f7 7d f0             	idivl  -0x10(%ebp)
c010356e:	89 c3                	mov    %eax,%ebx
c0103570:	89 c8                	mov    %ecx,%eax
c0103572:	99                   	cltd   
c0103573:	f7 fb                	idiv   %ebx
c0103575:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103578:	8b 45 08             	mov    0x8(%ebp),%eax
c010357b:	8b 40 20             	mov    0x20(%eax),%eax
c010357e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103581:	e8 0a 01 00 00       	call   c0103690 <get_super_block>
c0103586:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103589:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010358c:	8b 40 04             	mov    0x4(%eax),%eax
c010358f:	8d 50 02             	lea    0x2(%eax),%edx
c0103592:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103595:	8b 40 08             	mov    0x8(%eax),%eax
c0103598:	01 c2                	add    %eax,%edx
c010359a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010359d:	01 d0                	add    %edx,%eax
c010359f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01035a2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01035a7:	83 ec 0c             	sub    $0xc,%esp
c01035aa:	6a 07                	push   $0x7
c01035ac:	68 00 02 00 00       	push   $0x200
c01035b1:	50                   	push   %eax
c01035b2:	ff 75 e0             	pushl  -0x20(%ebp)
c01035b5:	ff 75 d8             	pushl  -0x28(%ebp)
c01035b8:	e8 f7 e2 ff ff       	call   c01018b4 <rd_wt>
c01035bd:	83 c4 20             	add    $0x20,%esp
c01035c0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01035c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01035c8:	83 ec 04             	sub    $0x4,%esp
c01035cb:	ff 75 f0             	pushl  -0x10(%ebp)
c01035ce:	ff 75 08             	pushl  0x8(%ebp)
c01035d1:	ff 75 d4             	pushl  -0x2c(%ebp)
c01035d4:	e8 53 37 00 00       	call   c0106d2c <Memcpy>
c01035d9:	83 c4 10             	add    $0x10,%esp
c01035dc:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01035e1:	83 ec 0c             	sub    $0xc,%esp
c01035e4:	6a 0a                	push   $0xa
c01035e6:	68 00 02 00 00       	push   $0x200
c01035eb:	50                   	push   %eax
c01035ec:	ff 75 e0             	pushl  -0x20(%ebp)
c01035ef:	ff 75 d8             	pushl  -0x28(%ebp)
c01035f2:	e8 bd e2 ff ff       	call   c01018b4 <rd_wt>
c01035f7:	83 c4 20             	add    $0x20,%esp
c01035fa:	90                   	nop
c01035fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01035fe:	c9                   	leave  
c01035ff:	c3                   	ret    

c0103600 <put_inode>:
c0103600:	55                   	push   %ebp
c0103601:	89 e5                	mov    %esp,%ebp
c0103603:	83 ec 08             	sub    $0x8,%esp
c0103606:	8b 45 08             	mov    0x8(%ebp),%eax
c0103609:	8b 40 24             	mov    0x24(%eax),%eax
c010360c:	85 c0                	test   %eax,%eax
c010360e:	7f 1c                	jg     c010362c <put_inode+0x2c>
c0103610:	68 4d 05 00 00       	push   $0x54d
c0103615:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010361a:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010361f:	68 d0 b4 10 c0       	push   $0xc010b4d0
c0103624:	e8 1c 53 00 00       	call   c0108945 <assertion_failure>
c0103629:	83 c4 10             	add    $0x10,%esp
c010362c:	8b 45 08             	mov    0x8(%ebp),%eax
c010362f:	8b 40 24             	mov    0x24(%eax),%eax
c0103632:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103635:	8b 45 08             	mov    0x8(%ebp),%eax
c0103638:	89 50 24             	mov    %edx,0x24(%eax)
c010363b:	90                   	nop
c010363c:	c9                   	leave  
c010363d:	c3                   	ret    

c010363e <do_close>:
c010363e:	55                   	push   %ebp
c010363f:	89 e5                	mov    %esp,%ebp
c0103641:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103646:	8b 55 08             	mov    0x8(%ebp),%edx
c0103649:	83 c2 4c             	add    $0x4c,%edx
c010364c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103650:	8b 50 0c             	mov    0xc(%eax),%edx
c0103653:	83 ea 01             	sub    $0x1,%edx
c0103656:	89 50 0c             	mov    %edx,0xc(%eax)
c0103659:	8b 40 0c             	mov    0xc(%eax),%eax
c010365c:	85 c0                	test   %eax,%eax
c010365e:	75 16                	jne    c0103676 <do_close+0x38>
c0103660:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103665:	8b 55 08             	mov    0x8(%ebp),%edx
c0103668:	83 c2 4c             	add    $0x4c,%edx
c010366b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010366f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103676:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010367b:	8b 55 08             	mov    0x8(%ebp),%edx
c010367e:	83 c2 4c             	add    $0x4c,%edx
c0103681:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103688:	00 
c0103689:	b8 00 00 00 00       	mov    $0x0,%eax
c010368e:	5d                   	pop    %ebp
c010368f:	c3                   	ret    

c0103690 <get_super_block>:
c0103690:	55                   	push   %ebp
c0103691:	89 e5                	mov    %esp,%ebp
c0103693:	83 ec 08             	sub    $0x8,%esp
c0103696:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010369b:	83 ec 0c             	sub    $0xc,%esp
c010369e:	6a 07                	push   $0x7
c01036a0:	68 00 02 00 00       	push   $0x200
c01036a5:	50                   	push   %eax
c01036a6:	6a 20                	push   $0x20
c01036a8:	6a 01                	push   $0x1
c01036aa:	e8 05 e2 ff ff       	call   c01018b4 <rd_wt>
c01036af:	83 c4 20             	add    $0x20,%esp
c01036b2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01036b8:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01036bd:	8b 0a                	mov    (%edx),%ecx
c01036bf:	89 08                	mov    %ecx,(%eax)
c01036c1:	8b 4a 04             	mov    0x4(%edx),%ecx
c01036c4:	89 48 04             	mov    %ecx,0x4(%eax)
c01036c7:	8b 4a 08             	mov    0x8(%edx),%ecx
c01036ca:	89 48 08             	mov    %ecx,0x8(%eax)
c01036cd:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01036d0:	89 48 0c             	mov    %ecx,0xc(%eax)
c01036d3:	8b 4a 10             	mov    0x10(%edx),%ecx
c01036d6:	89 48 10             	mov    %ecx,0x10(%eax)
c01036d9:	8b 4a 14             	mov    0x14(%edx),%ecx
c01036dc:	89 48 14             	mov    %ecx,0x14(%eax)
c01036df:	8b 4a 18             	mov    0x18(%edx),%ecx
c01036e2:	89 48 18             	mov    %ecx,0x18(%eax)
c01036e5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01036e8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01036eb:	8b 52 20             	mov    0x20(%edx),%edx
c01036ee:	89 50 20             	mov    %edx,0x20(%eax)
c01036f1:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01036f6:	c9                   	leave  
c01036f7:	c3                   	ret    

c01036f8 <schedule_process>:
c01036f8:	55                   	push   %ebp
c01036f9:	89 e5                	mov    %esp,%ebp
c01036fb:	83 ec 18             	sub    $0x18,%esp
c01036fe:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103705:	e8 e4 cc ff ff       	call   c01003ee <get_running_thread_pcb>
c010370a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010370d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103710:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103717:	84 c0                	test   %al,%al
c0103719:	75 35                	jne    c0103750 <schedule_process+0x58>
c010371b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010371e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103724:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103727:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010372d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103730:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103737:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010373a:	05 60 02 00 00       	add    $0x260,%eax
c010373f:	83 ec 08             	sub    $0x8,%esp
c0103742:	50                   	push   %eax
c0103743:	68 ec fd 10 c0       	push   $0xc010fdec
c0103748:	e8 9a 6b 00 00       	call   c010a2e7 <insertToDoubleLinkList>
c010374d:	83 c4 10             	add    $0x10,%esp
c0103750:	83 ec 0c             	sub    $0xc,%esp
c0103753:	68 ec fd 10 c0       	push   $0xc010fdec
c0103758:	e8 a6 69 00 00       	call   c010a103 <isListEmpty>
c010375d:	83 c4 10             	add    $0x10,%esp
c0103760:	84 c0                	test   %al,%al
c0103762:	74 19                	je     c010377d <schedule_process+0x85>
c0103764:	6a 1e                	push   $0x1e
c0103766:	68 df b4 10 c0       	push   $0xc010b4df
c010376b:	68 df b4 10 c0       	push   $0xc010b4df
c0103770:	68 e9 b4 10 c0       	push   $0xc010b4e9
c0103775:	e8 cb 51 00 00       	call   c0108945 <assertion_failure>
c010377a:	83 c4 10             	add    $0x10,%esp
c010377d:	83 ec 0c             	sub    $0xc,%esp
c0103780:	68 ec fd 10 c0       	push   $0xc010fdec
c0103785:	e8 e0 6b 00 00       	call   c010a36a <popFromDoubleLinkList>
c010378a:	83 c4 10             	add    $0x10,%esp
c010378d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103790:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103793:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103798:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010379b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010379e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01037a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037a8:	8b 50 08             	mov    0x8(%eax),%edx
c01037ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01037ae:	39 c2                	cmp    %eax,%edx
c01037b0:	74 28                	je     c01037da <schedule_process+0xe2>
c01037b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037b5:	05 00 10 00 00       	add    $0x1000,%eax
c01037ba:	83 ec 0c             	sub    $0xc,%esp
c01037bd:	50                   	push   %eax
c01037be:	e8 1c cc ff ff       	call   c01003df <update_tss>
c01037c3:	83 c4 10             	add    $0x10,%esp
c01037c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037c9:	8b 40 08             	mov    0x8(%eax),%eax
c01037cc:	83 ec 0c             	sub    $0xc,%esp
c01037cf:	50                   	push   %eax
c01037d0:	e8 fd cb ff ff       	call   c01003d2 <update_cr3>
c01037d5:	83 c4 10             	add    $0x10,%esp
c01037d8:	eb 0f                	jmp    c01037e9 <schedule_process+0xf1>
c01037da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01037dd:	83 ec 0c             	sub    $0xc,%esp
c01037e0:	50                   	push   %eax
c01037e1:	e8 ec cb ff ff       	call   c01003d2 <update_cr3>
c01037e6:	83 c4 10             	add    $0x10,%esp
c01037e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037ec:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01037f1:	83 ec 08             	sub    $0x8,%esp
c01037f4:	ff 75 e8             	pushl  -0x18(%ebp)
c01037f7:	ff 75 f0             	pushl  -0x10(%ebp)
c01037fa:	e8 c1 68 00 00       	call   c010a0c0 <switch_to>
c01037ff:	83 c4 10             	add    $0x10,%esp
c0103802:	90                   	nop
c0103803:	c9                   	leave  
c0103804:	c3                   	ret    

c0103805 <clock_handler>:
c0103805:	55                   	push   %ebp
c0103806:	89 e5                	mov    %esp,%ebp
c0103808:	83 ec 18             	sub    $0x18,%esp
c010380b:	e8 de cb ff ff       	call   c01003ee <get_running_thread_pcb>
c0103810:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103813:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0103818:	85 c0                	test   %eax,%eax
c010381a:	74 0d                	je     c0103829 <clock_handler+0x24>
c010381c:	83 ec 0c             	sub    $0xc,%esp
c010381f:	6a 04                	push   $0x4
c0103821:	e8 29 60 00 00       	call   c010984f <inform_int>
c0103826:	83 c4 10             	add    $0x10,%esp
c0103829:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010382e:	83 f8 64             	cmp    $0x64,%eax
c0103831:	75 0c                	jne    c010383f <clock_handler+0x3a>
c0103833:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c010383a:	00 00 00 
c010383d:	eb 0a                	jmp    c0103849 <clock_handler+0x44>
c010383f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103844:	83 f8 01             	cmp    $0x1,%eax
c0103847:	75 2a                	jne    c0103873 <clock_handler+0x6e>
c0103849:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010384c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103852:	85 c0                	test   %eax,%eax
c0103854:	74 16                	je     c010386c <clock_handler+0x67>
c0103856:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c010385b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103861:	83 ea 01             	sub    $0x1,%edx
c0103864:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010386a:	eb 08                	jmp    c0103874 <clock_handler+0x6f>
c010386c:	e8 87 fe ff ff       	call   c01036f8 <schedule_process>
c0103871:	eb 01                	jmp    c0103874 <clock_handler+0x6f>
c0103873:	90                   	nop
c0103874:	c9                   	leave  
c0103875:	c3                   	ret    

c0103876 <pid2proc>:
c0103876:	55                   	push   %ebp
c0103877:	89 e5                	mov    %esp,%ebp
c0103879:	83 ec 20             	sub    $0x20,%esp
c010387c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103883:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010388a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c010388f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103895:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103898:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010389b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c01038a0:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c01038a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01038a9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01038ac:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c01038b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038b4:	eb 36                	jmp    c01038ec <pid2proc+0x76>
c01038b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038b9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01038be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01038c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01038c5:	75 07                	jne    c01038ce <pid2proc+0x58>
c01038c7:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c01038ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038d1:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01038d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01038da:	39 c2                	cmp    %eax,%edx
c01038dc:	75 05                	jne    c01038e3 <pid2proc+0x6d>
c01038de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038e1:	eb 17                	jmp    c01038fa <pid2proc+0x84>
c01038e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038e6:	8b 40 04             	mov    0x4(%eax),%eax
c01038e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038ec:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c01038f3:	75 c1                	jne    c01038b6 <pid2proc+0x40>
c01038f5:	b8 00 00 00 00       	mov    $0x0,%eax
c01038fa:	c9                   	leave  
c01038fb:	c3                   	ret    

c01038fc <proc2pid>:
c01038fc:	55                   	push   %ebp
c01038fd:	89 e5                	mov    %esp,%ebp
c01038ff:	83 ec 10             	sub    $0x10,%esp
c0103902:	8b 45 08             	mov    0x8(%ebp),%eax
c0103905:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c010390b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010390e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103911:	c9                   	leave  
c0103912:	c3                   	ret    

c0103913 <InitDescriptor>:
c0103913:	55                   	push   %ebp
c0103914:	89 e5                	mov    %esp,%ebp
c0103916:	83 ec 04             	sub    $0x4,%esp
c0103919:	8b 45 14             	mov    0x14(%ebp),%eax
c010391c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103920:	8b 45 10             	mov    0x10(%ebp),%eax
c0103923:	89 c2                	mov    %eax,%edx
c0103925:	8b 45 08             	mov    0x8(%ebp),%eax
c0103928:	66 89 10             	mov    %dx,(%eax)
c010392b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010392e:	89 c2                	mov    %eax,%edx
c0103930:	8b 45 08             	mov    0x8(%ebp),%eax
c0103933:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103937:	8b 45 0c             	mov    0xc(%ebp),%eax
c010393a:	c1 e8 10             	shr    $0x10,%eax
c010393d:	89 c2                	mov    %eax,%edx
c010393f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103942:	88 50 04             	mov    %dl,0x4(%eax)
c0103945:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103949:	89 c2                	mov    %eax,%edx
c010394b:	8b 45 08             	mov    0x8(%ebp),%eax
c010394e:	88 50 05             	mov    %dl,0x5(%eax)
c0103951:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103955:	66 c1 e8 08          	shr    $0x8,%ax
c0103959:	c1 e0 04             	shl    $0x4,%eax
c010395c:	89 c2                	mov    %eax,%edx
c010395e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103961:	c1 e8 10             	shr    $0x10,%eax
c0103964:	83 e0 0f             	and    $0xf,%eax
c0103967:	09 c2                	or     %eax,%edx
c0103969:	8b 45 08             	mov    0x8(%ebp),%eax
c010396c:	88 50 06             	mov    %dl,0x6(%eax)
c010396f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103972:	c1 e8 18             	shr    $0x18,%eax
c0103975:	89 c2                	mov    %eax,%edx
c0103977:	8b 45 08             	mov    0x8(%ebp),%eax
c010397a:	88 50 07             	mov    %dl,0x7(%eax)
c010397d:	90                   	nop
c010397e:	c9                   	leave  
c010397f:	c3                   	ret    

c0103980 <Seg2PhyAddr>:
c0103980:	55                   	push   %ebp
c0103981:	89 e5                	mov    %esp,%ebp
c0103983:	83 ec 10             	sub    $0x10,%esp
c0103986:	8b 45 08             	mov    0x8(%ebp),%eax
c0103989:	c1 e8 03             	shr    $0x3,%eax
c010398c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103993:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c010399a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010399d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01039a0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01039a4:	0f b7 c0             	movzwl %ax,%eax
c01039a7:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c01039ab:	0f b6 d2             	movzbl %dl,%edx
c01039ae:	c1 e2 10             	shl    $0x10,%edx
c01039b1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c01039b7:	09 d0                	or     %edx,%eax
c01039b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01039bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01039bf:	c9                   	leave  
c01039c0:	c3                   	ret    

c01039c1 <Seg2PhyAddrLDT>:
c01039c1:	55                   	push   %ebp
c01039c2:	89 e5                	mov    %esp,%ebp
c01039c4:	83 ec 10             	sub    $0x10,%esp
c01039c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01039ca:	c1 e8 03             	shr    $0x3,%eax
c01039cd:	89 c2                	mov    %eax,%edx
c01039cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039d2:	83 c2 20             	add    $0x20,%edx
c01039d5:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c01039d9:	8b 02                	mov    (%edx),%eax
c01039db:	8b 52 04             	mov    0x4(%edx),%edx
c01039de:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01039e1:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01039e4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01039e8:	0f b7 c0             	movzwl %ax,%eax
c01039eb:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c01039ef:	0f b6 d2             	movzbl %dl,%edx
c01039f2:	c1 e2 10             	shl    $0x10,%edx
c01039f5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c01039fb:	09 d0                	or     %edx,%eax
c01039fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a00:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a03:	c9                   	leave  
c0103a04:	c3                   	ret    

c0103a05 <VirAddr2PhyAddr>:
c0103a05:	55                   	push   %ebp
c0103a06:	89 e5                	mov    %esp,%ebp
c0103a08:	83 ec 10             	sub    $0x10,%esp
c0103a0b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103a0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a11:	01 d0                	add    %edx,%eax
c0103a13:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a16:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a19:	c9                   	leave  
c0103a1a:	c3                   	ret    

c0103a1b <v2l>:
c0103a1b:	55                   	push   %ebp
c0103a1c:	89 e5                	mov    %esp,%ebp
c0103a1e:	83 ec 18             	sub    $0x18,%esp
c0103a21:	83 ec 0c             	sub    $0xc,%esp
c0103a24:	ff 75 08             	pushl  0x8(%ebp)
c0103a27:	e8 4a fe ff ff       	call   c0103876 <pid2proc>
c0103a2c:	83 c4 10             	add    $0x10,%esp
c0103a2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a32:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a3c:	83 ec 08             	sub    $0x8,%esp
c0103a3f:	ff 75 f4             	pushl  -0xc(%ebp)
c0103a42:	50                   	push   %eax
c0103a43:	e8 79 ff ff ff       	call   c01039c1 <Seg2PhyAddrLDT>
c0103a48:	83 c4 10             	add    $0x10,%esp
c0103a4b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103a4e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103a51:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a54:	01 d0                	add    %edx,%eax
c0103a56:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103a59:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a5c:	c9                   	leave  
c0103a5d:	c3                   	ret    

c0103a5e <init_propt>:
c0103a5e:	55                   	push   %ebp
c0103a5f:	89 e5                	mov    %esp,%ebp
c0103a61:	83 ec 38             	sub    $0x38,%esp
c0103a64:	6a 0e                	push   $0xe
c0103a66:	6a 08                	push   $0x8
c0103a68:	68 71 01 10 c0       	push   $0xc0100171
c0103a6d:	6a 20                	push   $0x20
c0103a6f:	e8 6b 01 00 00       	call   c0103bdf <InitInterruptDesc>
c0103a74:	83 c4 10             	add    $0x10,%esp
c0103a77:	6a 0e                	push   $0xe
c0103a79:	6a 08                	push   $0x8
c0103a7b:	68 9f 01 10 c0       	push   $0xc010019f
c0103a80:	6a 21                	push   $0x21
c0103a82:	e8 58 01 00 00       	call   c0103bdf <InitInterruptDesc>
c0103a87:	83 c4 10             	add    $0x10,%esp
c0103a8a:	6a 0e                	push   $0xe
c0103a8c:	6a 08                	push   $0x8
c0103a8e:	68 e2 01 10 c0       	push   $0xc01001e2
c0103a93:	6a 2e                	push   $0x2e
c0103a95:	e8 45 01 00 00       	call   c0103bdf <InitInterruptDesc>
c0103a9a:	83 c4 10             	add    $0x10,%esp
c0103a9d:	6a 0e                	push   $0xe
c0103a9f:	6a 08                	push   $0x8
c0103aa1:	68 28 02 10 c0       	push   $0xc0100228
c0103aa6:	6a 2a                	push   $0x2a
c0103aa8:	e8 32 01 00 00       	call   c0103bdf <InitInterruptDesc>
c0103aad:	83 c4 10             	add    $0x10,%esp
c0103ab0:	83 ec 04             	sub    $0x4,%esp
c0103ab3:	68 e0 15 00 00       	push   $0x15e0
c0103ab8:	6a 00                	push   $0x0
c0103aba:	68 00 22 18 c0       	push   $0xc0182200
c0103abf:	e8 0b 87 00 00       	call   c010c1cf <Memset>
c0103ac4:	83 c4 10             	add    $0x10,%esp
c0103ac7:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103ace:	83 ec 04             	sub    $0x4,%esp
c0103ad1:	ff 75 f4             	pushl  -0xc(%ebp)
c0103ad4:	6a 00                	push   $0x0
c0103ad6:	68 40 06 11 c0       	push   $0xc0110640
c0103adb:	e8 ef 86 00 00       	call   c010c1cf <Memset>
c0103ae0:	83 c4 10             	add    $0x10,%esp
c0103ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103ae6:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103aeb:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103af2:	00 00 00 
c0103af5:	83 ec 0c             	sub    $0xc,%esp
c0103af8:	6a 30                	push   $0x30
c0103afa:	e8 81 fe ff ff       	call   c0103980 <Seg2PhyAddr>
c0103aff:	83 c4 10             	add    $0x10,%esp
c0103b02:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103b05:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103b0c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103b13:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b16:	0f b7 d0             	movzwl %ax,%edx
c0103b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b1c:	83 e8 01             	sub    $0x1,%eax
c0103b1f:	89 c1                	mov    %eax,%ecx
c0103b21:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b24:	52                   	push   %edx
c0103b25:	51                   	push   %ecx
c0103b26:	50                   	push   %eax
c0103b27:	68 00 f8 10 c0       	push   $0xc010f800
c0103b2c:	e8 e2 fd ff ff       	call   c0103913 <InitDescriptor>
c0103b31:	83 c4 10             	add    $0x10,%esp
c0103b34:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103b3b:	68 f2 00 00 00       	push   $0xf2
c0103b40:	68 ff ff 00 00       	push   $0xffff
c0103b45:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103b48:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103b4d:	e8 c1 fd ff ff       	call   c0103913 <InitDescriptor>
c0103b52:	83 c4 10             	add    $0x10,%esp
c0103b55:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103b5c:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103b63:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103b6a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103b6d:	0f b7 c0             	movzwl %ax,%eax
c0103b70:	50                   	push   %eax
c0103b71:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b74:	6a 00                	push   $0x0
c0103b76:	68 08 f8 10 c0       	push   $0xc010f808
c0103b7b:	e8 93 fd ff ff       	call   c0103913 <InitDescriptor>
c0103b80:	83 c4 10             	add    $0x10,%esp
c0103b83:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103b86:	0f b7 c0             	movzwl %ax,%eax
c0103b89:	50                   	push   %eax
c0103b8a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b8d:	6a 00                	push   $0x0
c0103b8f:	68 10 f8 10 c0       	push   $0xc010f810
c0103b94:	e8 7a fd ff ff       	call   c0103913 <InitDescriptor>
c0103b99:	83 c4 10             	add    $0x10,%esp
c0103b9c:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103ba3:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103baa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103bad:	0f b7 c0             	movzwl %ax,%eax
c0103bb0:	50                   	push   %eax
c0103bb1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103bb4:	6a 00                	push   $0x0
c0103bb6:	68 18 f8 10 c0       	push   $0xc010f818
c0103bbb:	e8 53 fd ff ff       	call   c0103913 <InitDescriptor>
c0103bc0:	83 c4 10             	add    $0x10,%esp
c0103bc3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103bc6:	0f b7 c0             	movzwl %ax,%eax
c0103bc9:	50                   	push   %eax
c0103bca:	ff 75 d8             	pushl  -0x28(%ebp)
c0103bcd:	6a 00                	push   $0x0
c0103bcf:	68 20 f8 10 c0       	push   $0xc010f820
c0103bd4:	e8 3a fd ff ff       	call   c0103913 <InitDescriptor>
c0103bd9:	83 c4 10             	add    $0x10,%esp
c0103bdc:	90                   	nop
c0103bdd:	c9                   	leave  
c0103bde:	c3                   	ret    

c0103bdf <InitInterruptDesc>:
c0103bdf:	55                   	push   %ebp
c0103be0:	89 e5                	mov    %esp,%ebp
c0103be2:	83 ec 10             	sub    $0x10,%esp
c0103be5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103be8:	c1 e0 03             	shl    $0x3,%eax
c0103beb:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103bf0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103bf3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bf6:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103bfa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bfd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103c00:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103c03:	89 c2                	mov    %eax,%edx
c0103c05:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c08:	66 89 10             	mov    %dx,(%eax)
c0103c0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c0e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103c14:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103c17:	c1 f8 10             	sar    $0x10,%eax
c0103c1a:	89 c2                	mov    %eax,%edx
c0103c1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c1f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103c23:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c26:	c1 e0 04             	shl    $0x4,%eax
c0103c29:	89 c2                	mov    %eax,%edx
c0103c2b:	8b 45 14             	mov    0x14(%ebp),%eax
c0103c2e:	09 d0                	or     %edx,%eax
c0103c30:	89 c2                	mov    %eax,%edx
c0103c32:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c35:	88 50 05             	mov    %dl,0x5(%eax)
c0103c38:	90                   	nop
c0103c39:	c9                   	leave  
c0103c3a:	c3                   	ret    

c0103c3b <ReloadGDT>:
c0103c3b:	55                   	push   %ebp
c0103c3c:	89 e5                	mov    %esp,%ebp
c0103c3e:	83 ec 28             	sub    $0x28,%esp
c0103c41:	b8 d0 06 11 c0       	mov    $0xc01106d0,%eax
c0103c46:	0f b7 00             	movzwl (%eax),%eax
c0103c49:	98                   	cwtl   
c0103c4a:	ba d2 06 11 c0       	mov    $0xc01106d2,%edx
c0103c4f:	8b 12                	mov    (%edx),%edx
c0103c51:	83 ec 04             	sub    $0x4,%esp
c0103c54:	50                   	push   %eax
c0103c55:	52                   	push   %edx
c0103c56:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103c5b:	e8 41 85 00 00       	call   c010c1a1 <Memcpy2>
c0103c60:	83 c4 10             	add    $0x10,%esp
c0103c63:	c7 45 f0 d0 06 11 c0 	movl   $0xc01106d0,-0x10(%ebp)
c0103c6a:	c7 45 ec d2 06 11 c0 	movl   $0xc01106d2,-0x14(%ebp)
c0103c71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103c74:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103c79:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103c7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103c81:	89 10                	mov    %edx,(%eax)
c0103c83:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103c8a:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103c91:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c94:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103c99:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103c9e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103ca1:	89 10                	mov    %edx,(%eax)
c0103ca3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103caa:	eb 04                	jmp    c0103cb0 <ReloadGDT+0x75>
c0103cac:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103cb0:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103cb7:	7e f3                	jle    c0103cac <ReloadGDT+0x71>
c0103cb9:	e8 a9 37 00 00       	call   c0107467 <init_internal_interrupt>
c0103cbe:	e8 9b fd ff ff       	call   c0103a5e <init_propt>
c0103cc3:	90                   	nop
c0103cc4:	c9                   	leave  
c0103cc5:	c3                   	ret    

c0103cc6 <select_console>:
c0103cc6:	55                   	push   %ebp
c0103cc7:	89 e5                	mov    %esp,%ebp
c0103cc9:	83 ec 18             	sub    $0x18,%esp
c0103ccc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ccf:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103cd2:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103cd6:	75 27                	jne    c0103cff <select_console+0x39>
c0103cd8:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103cdc:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103ce2:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103ce7:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103cec:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103cf1:	83 ec 0c             	sub    $0xc,%esp
c0103cf4:	50                   	push   %eax
c0103cf5:	e8 08 00 00 00       	call   c0103d02 <flush>
c0103cfa:	83 c4 10             	add    $0x10,%esp
c0103cfd:	eb 01                	jmp    c0103d00 <select_console+0x3a>
c0103cff:	90                   	nop
c0103d00:	c9                   	leave  
c0103d01:	c3                   	ret    

c0103d02 <flush>:
c0103d02:	55                   	push   %ebp
c0103d03:	89 e5                	mov    %esp,%ebp
c0103d05:	83 ec 08             	sub    $0x8,%esp
c0103d08:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d0b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d11:	8b 40 0c             	mov    0xc(%eax),%eax
c0103d14:	83 ec 0c             	sub    $0xc,%esp
c0103d17:	50                   	push   %eax
c0103d18:	e8 1e 00 00 00       	call   c0103d3b <set_cursor>
c0103d1d:	83 c4 10             	add    $0x10,%esp
c0103d20:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d23:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d29:	8b 40 08             	mov    0x8(%eax),%eax
c0103d2c:	83 ec 0c             	sub    $0xc,%esp
c0103d2f:	50                   	push   %eax
c0103d30:	e8 64 00 00 00       	call   c0103d99 <set_console_start_video_addr>
c0103d35:	83 c4 10             	add    $0x10,%esp
c0103d38:	90                   	nop
c0103d39:	c9                   	leave  
c0103d3a:	c3                   	ret    

c0103d3b <set_cursor>:
c0103d3b:	55                   	push   %ebp
c0103d3c:	89 e5                	mov    %esp,%ebp
c0103d3e:	83 ec 08             	sub    $0x8,%esp
c0103d41:	83 ec 08             	sub    $0x8,%esp
c0103d44:	6a 0e                	push   $0xe
c0103d46:	68 d4 03 00 00       	push   $0x3d4
c0103d4b:	e8 a0 c5 ff ff       	call   c01002f0 <out_byte>
c0103d50:	83 c4 10             	add    $0x10,%esp
c0103d53:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d56:	c1 e8 08             	shr    $0x8,%eax
c0103d59:	0f b7 c0             	movzwl %ax,%eax
c0103d5c:	83 ec 08             	sub    $0x8,%esp
c0103d5f:	50                   	push   %eax
c0103d60:	68 d5 03 00 00       	push   $0x3d5
c0103d65:	e8 86 c5 ff ff       	call   c01002f0 <out_byte>
c0103d6a:	83 c4 10             	add    $0x10,%esp
c0103d6d:	83 ec 08             	sub    $0x8,%esp
c0103d70:	6a 0f                	push   $0xf
c0103d72:	68 d4 03 00 00       	push   $0x3d4
c0103d77:	e8 74 c5 ff ff       	call   c01002f0 <out_byte>
c0103d7c:	83 c4 10             	add    $0x10,%esp
c0103d7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d82:	0f b7 c0             	movzwl %ax,%eax
c0103d85:	83 ec 08             	sub    $0x8,%esp
c0103d88:	50                   	push   %eax
c0103d89:	68 d5 03 00 00       	push   $0x3d5
c0103d8e:	e8 5d c5 ff ff       	call   c01002f0 <out_byte>
c0103d93:	83 c4 10             	add    $0x10,%esp
c0103d96:	90                   	nop
c0103d97:	c9                   	leave  
c0103d98:	c3                   	ret    

c0103d99 <set_console_start_video_addr>:
c0103d99:	55                   	push   %ebp
c0103d9a:	89 e5                	mov    %esp,%ebp
c0103d9c:	83 ec 08             	sub    $0x8,%esp
c0103d9f:	83 ec 08             	sub    $0x8,%esp
c0103da2:	6a 0c                	push   $0xc
c0103da4:	68 d4 03 00 00       	push   $0x3d4
c0103da9:	e8 42 c5 ff ff       	call   c01002f0 <out_byte>
c0103dae:	83 c4 10             	add    $0x10,%esp
c0103db1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103db4:	c1 e8 08             	shr    $0x8,%eax
c0103db7:	0f b7 c0             	movzwl %ax,%eax
c0103dba:	83 ec 08             	sub    $0x8,%esp
c0103dbd:	50                   	push   %eax
c0103dbe:	68 d5 03 00 00       	push   $0x3d5
c0103dc3:	e8 28 c5 ff ff       	call   c01002f0 <out_byte>
c0103dc8:	83 c4 10             	add    $0x10,%esp
c0103dcb:	83 ec 08             	sub    $0x8,%esp
c0103dce:	6a 0d                	push   $0xd
c0103dd0:	68 d4 03 00 00       	push   $0x3d4
c0103dd5:	e8 16 c5 ff ff       	call   c01002f0 <out_byte>
c0103dda:	83 c4 10             	add    $0x10,%esp
c0103ddd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103de0:	0f b7 c0             	movzwl %ax,%eax
c0103de3:	83 ec 08             	sub    $0x8,%esp
c0103de6:	50                   	push   %eax
c0103de7:	68 d5 03 00 00       	push   $0x3d5
c0103dec:	e8 ff c4 ff ff       	call   c01002f0 <out_byte>
c0103df1:	83 c4 10             	add    $0x10,%esp
c0103df4:	90                   	nop
c0103df5:	c9                   	leave  
c0103df6:	c3                   	ret    

c0103df7 <put_key>:
c0103df7:	55                   	push   %ebp
c0103df8:	89 e5                	mov    %esp,%ebp
c0103dfa:	83 ec 04             	sub    $0x4,%esp
c0103dfd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103e00:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103e03:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e06:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103e0c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103e11:	77 4d                	ja     c0103e60 <put_key+0x69>
c0103e13:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e16:	8b 00                	mov    (%eax),%eax
c0103e18:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103e1c:	89 10                	mov    %edx,(%eax)
c0103e1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e21:	8b 00                	mov    (%eax),%eax
c0103e23:	8d 50 04             	lea    0x4(%eax),%edx
c0103e26:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e29:	89 10                	mov    %edx,(%eax)
c0103e2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e2e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103e34:	8d 50 01             	lea    0x1(%eax),%edx
c0103e37:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e3a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103e40:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e43:	8b 00                	mov    (%eax),%eax
c0103e45:	8b 55 08             	mov    0x8(%ebp),%edx
c0103e48:	83 c2 08             	add    $0x8,%edx
c0103e4b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103e51:	39 d0                	cmp    %edx,%eax
c0103e53:	75 0b                	jne    c0103e60 <put_key+0x69>
c0103e55:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e58:	8d 50 08             	lea    0x8(%eax),%edx
c0103e5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e5e:	89 10                	mov    %edx,(%eax)
c0103e60:	90                   	nop
c0103e61:	c9                   	leave  
c0103e62:	c3                   	ret    

c0103e63 <scroll_up>:
c0103e63:	55                   	push   %ebp
c0103e64:	89 e5                	mov    %esp,%ebp
c0103e66:	83 ec 08             	sub    $0x8,%esp
c0103e69:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e6c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e72:	8b 40 08             	mov    0x8(%eax),%eax
c0103e75:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103e78:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e7b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e81:	8b 00                	mov    (%eax),%eax
c0103e83:	39 c2                	cmp    %eax,%edx
c0103e85:	76 1b                	jbe    c0103ea2 <scroll_up+0x3f>
c0103e87:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e8a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e90:	8b 40 08             	mov    0x8(%eax),%eax
c0103e93:	83 e8 50             	sub    $0x50,%eax
c0103e96:	83 ec 0c             	sub    $0xc,%esp
c0103e99:	50                   	push   %eax
c0103e9a:	e8 fa fe ff ff       	call   c0103d99 <set_console_start_video_addr>
c0103e9f:	83 c4 10             	add    $0x10,%esp
c0103ea2:	90                   	nop
c0103ea3:	c9                   	leave  
c0103ea4:	c3                   	ret    

c0103ea5 <scroll_down>:
c0103ea5:	55                   	push   %ebp
c0103ea6:	89 e5                	mov    %esp,%ebp
c0103ea8:	83 ec 08             	sub    $0x8,%esp
c0103eab:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eae:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eb4:	8b 40 08             	mov    0x8(%eax),%eax
c0103eb7:	8d 48 50             	lea    0x50(%eax),%ecx
c0103eba:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ebd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ec3:	8b 10                	mov    (%eax),%edx
c0103ec5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ec8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ece:	8b 40 04             	mov    0x4(%eax),%eax
c0103ed1:	01 d0                	add    %edx,%eax
c0103ed3:	39 c1                	cmp    %eax,%ecx
c0103ed5:	73 36                	jae    c0103f0d <scroll_down+0x68>
c0103ed7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eda:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ee0:	8b 40 08             	mov    0x8(%eax),%eax
c0103ee3:	83 c0 50             	add    $0x50,%eax
c0103ee6:	83 ec 0c             	sub    $0xc,%esp
c0103ee9:	50                   	push   %eax
c0103eea:	e8 aa fe ff ff       	call   c0103d99 <set_console_start_video_addr>
c0103eef:	83 c4 10             	add    $0x10,%esp
c0103ef2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ef5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103efb:	8b 50 08             	mov    0x8(%eax),%edx
c0103efe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f01:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f07:	83 c2 50             	add    $0x50,%edx
c0103f0a:	89 50 08             	mov    %edx,0x8(%eax)
c0103f0d:	90                   	nop
c0103f0e:	c9                   	leave  
c0103f0f:	c3                   	ret    

c0103f10 <out_char>:
c0103f10:	55                   	push   %ebp
c0103f11:	89 e5                	mov    %esp,%ebp
c0103f13:	83 ec 28             	sub    $0x28,%esp
c0103f16:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103f19:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103f1c:	e8 a7 2d 00 00       	call   c0106cc8 <intr_disable>
c0103f21:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103f24:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f27:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f2d:	8b 40 0c             	mov    0xc(%eax),%eax
c0103f30:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103f35:	01 c0                	add    %eax,%eax
c0103f37:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103f3a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103f3e:	83 f8 08             	cmp    $0x8,%eax
c0103f41:	0f 84 8d 00 00 00    	je     c0103fd4 <out_char+0xc4>
c0103f47:	83 f8 0a             	cmp    $0xa,%eax
c0103f4a:	0f 85 c9 00 00 00    	jne    c0104019 <out_char+0x109>
c0103f50:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f53:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f59:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f5f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f65:	8b 08                	mov    (%eax),%ecx
c0103f67:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f6a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f70:	8b 40 04             	mov    0x4(%eax),%eax
c0103f73:	01 c8                	add    %ecx,%eax
c0103f75:	83 e8 50             	sub    $0x50,%eax
c0103f78:	39 c2                	cmp    %eax,%edx
c0103f7a:	0f 83 f4 00 00 00    	jae    c0104074 <out_char+0x164>
c0103f80:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f83:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f89:	8b 08                	mov    (%eax),%ecx
c0103f8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f8e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f94:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f97:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f9a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fa0:	8b 00                	mov    (%eax),%eax
c0103fa2:	29 c2                	sub    %eax,%edx
c0103fa4:	89 d0                	mov    %edx,%eax
c0103fa6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103fab:	f7 e2                	mul    %edx
c0103fad:	89 d0                	mov    %edx,%eax
c0103faf:	c1 e8 06             	shr    $0x6,%eax
c0103fb2:	8d 50 01             	lea    0x1(%eax),%edx
c0103fb5:	89 d0                	mov    %edx,%eax
c0103fb7:	c1 e0 02             	shl    $0x2,%eax
c0103fba:	01 d0                	add    %edx,%eax
c0103fbc:	c1 e0 04             	shl    $0x4,%eax
c0103fbf:	89 c2                	mov    %eax,%edx
c0103fc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fc4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fca:	01 ca                	add    %ecx,%edx
c0103fcc:	89 50 0c             	mov    %edx,0xc(%eax)
c0103fcf:	e9 a0 00 00 00       	jmp    c0104074 <out_char+0x164>
c0103fd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fd7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fdd:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fe0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fe3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fe9:	8b 00                	mov    (%eax),%eax
c0103feb:	39 c2                	cmp    %eax,%edx
c0103fed:	0f 86 84 00 00 00    	jbe    c0104077 <out_char+0x167>
c0103ff3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ffc:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fff:	83 ea 01             	sub    $0x1,%edx
c0104002:	89 50 0c             	mov    %edx,0xc(%eax)
c0104005:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104008:	83 e8 02             	sub    $0x2,%eax
c010400b:	c6 00 20             	movb   $0x20,(%eax)
c010400e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104011:	83 e8 01             	sub    $0x1,%eax
c0104014:	c6 00 00             	movb   $0x0,(%eax)
c0104017:	eb 5e                	jmp    c0104077 <out_char+0x167>
c0104019:	8b 45 08             	mov    0x8(%ebp),%eax
c010401c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104022:	8b 40 0c             	mov    0xc(%eax),%eax
c0104025:	8d 48 01             	lea    0x1(%eax),%ecx
c0104028:	8b 45 08             	mov    0x8(%ebp),%eax
c010402b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104031:	8b 10                	mov    (%eax),%edx
c0104033:	8b 45 08             	mov    0x8(%ebp),%eax
c0104036:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010403c:	8b 40 04             	mov    0x4(%eax),%eax
c010403f:	01 d0                	add    %edx,%eax
c0104041:	39 c1                	cmp    %eax,%ecx
c0104043:	73 35                	jae    c010407a <out_char+0x16a>
c0104045:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104048:	8d 50 01             	lea    0x1(%eax),%edx
c010404b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010404e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0104052:	88 10                	mov    %dl,(%eax)
c0104054:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104057:	8d 50 01             	lea    0x1(%eax),%edx
c010405a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010405d:	c6 00 0a             	movb   $0xa,(%eax)
c0104060:	8b 45 08             	mov    0x8(%ebp),%eax
c0104063:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104069:	8b 50 0c             	mov    0xc(%eax),%edx
c010406c:	83 c2 01             	add    $0x1,%edx
c010406f:	89 50 0c             	mov    %edx,0xc(%eax)
c0104072:	eb 06                	jmp    c010407a <out_char+0x16a>
c0104074:	90                   	nop
c0104075:	eb 14                	jmp    c010408b <out_char+0x17b>
c0104077:	90                   	nop
c0104078:	eb 11                	jmp    c010408b <out_char+0x17b>
c010407a:	90                   	nop
c010407b:	eb 0e                	jmp    c010408b <out_char+0x17b>
c010407d:	83 ec 0c             	sub    $0xc,%esp
c0104080:	ff 75 08             	pushl  0x8(%ebp)
c0104083:	e8 1d fe ff ff       	call   c0103ea5 <scroll_down>
c0104088:	83 c4 10             	add    $0x10,%esp
c010408b:	8b 45 08             	mov    0x8(%ebp),%eax
c010408e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104094:	8b 50 0c             	mov    0xc(%eax),%edx
c0104097:	8b 45 08             	mov    0x8(%ebp),%eax
c010409a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040a0:	8b 40 08             	mov    0x8(%eax),%eax
c01040a3:	29 c2                	sub    %eax,%edx
c01040a5:	89 d0                	mov    %edx,%eax
c01040a7:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c01040ac:	77 cf                	ja     c010407d <out_char+0x16d>
c01040ae:	83 ec 0c             	sub    $0xc,%esp
c01040b1:	ff 75 08             	pushl  0x8(%ebp)
c01040b4:	e8 49 fc ff ff       	call   c0103d02 <flush>
c01040b9:	83 c4 10             	add    $0x10,%esp
c01040bc:	83 ec 0c             	sub    $0xc,%esp
c01040bf:	ff 75 f4             	pushl  -0xc(%ebp)
c01040c2:	e8 2a 2c 00 00       	call   c0106cf1 <intr_set_status>
c01040c7:	83 c4 10             	add    $0x10,%esp
c01040ca:	90                   	nop
c01040cb:	c9                   	leave  
c01040cc:	c3                   	ret    

c01040cd <tty_dev_read>:
c01040cd:	55                   	push   %ebp
c01040ce:	89 e5                	mov    %esp,%ebp
c01040d0:	83 ec 08             	sub    $0x8,%esp
c01040d3:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01040d8:	39 45 08             	cmp    %eax,0x8(%ebp)
c01040db:	75 17                	jne    c01040f4 <tty_dev_read+0x27>
c01040dd:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01040e2:	85 c0                	test   %eax,%eax
c01040e4:	7e 0e                	jle    c01040f4 <tty_dev_read+0x27>
c01040e6:	83 ec 0c             	sub    $0xc,%esp
c01040e9:	ff 75 08             	pushl  0x8(%ebp)
c01040ec:	e8 89 07 00 00       	call   c010487a <keyboard_read>
c01040f1:	83 c4 10             	add    $0x10,%esp
c01040f4:	90                   	nop
c01040f5:	c9                   	leave  
c01040f6:	c3                   	ret    

c01040f7 <tty_dev_write>:
c01040f7:	55                   	push   %ebp
c01040f8:	89 e5                	mov    %esp,%ebp
c01040fa:	83 ec 28             	sub    $0x28,%esp
c01040fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0104100:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104106:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104109:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104110:	e9 88 01 00 00       	jmp    c010429d <tty_dev_write+0x1a6>
c0104115:	8b 45 08             	mov    0x8(%ebp),%eax
c0104118:	8b 40 04             	mov    0x4(%eax),%eax
c010411b:	8b 00                	mov    (%eax),%eax
c010411d:	88 45 e7             	mov    %al,-0x19(%ebp)
c0104120:	8b 45 08             	mov    0x8(%ebp),%eax
c0104123:	8b 40 04             	mov    0x4(%eax),%eax
c0104126:	8d 50 04             	lea    0x4(%eax),%edx
c0104129:	8b 45 08             	mov    0x8(%ebp),%eax
c010412c:	89 50 04             	mov    %edx,0x4(%eax)
c010412f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104132:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104138:	8d 50 ff             	lea    -0x1(%eax),%edx
c010413b:	8b 45 08             	mov    0x8(%ebp),%eax
c010413e:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104144:	8b 45 08             	mov    0x8(%ebp),%eax
c0104147:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010414d:	8d 50 01             	lea    0x1(%eax),%edx
c0104150:	8b 45 08             	mov    0x8(%ebp),%eax
c0104153:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104159:	8b 45 08             	mov    0x8(%ebp),%eax
c010415c:	8b 40 04             	mov    0x4(%eax),%eax
c010415f:	8b 55 08             	mov    0x8(%ebp),%edx
c0104162:	83 c2 08             	add    $0x8,%edx
c0104165:	81 c2 00 08 00 00    	add    $0x800,%edx
c010416b:	39 d0                	cmp    %edx,%eax
c010416d:	75 0c                	jne    c010417b <tty_dev_write+0x84>
c010416f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104172:	8d 50 08             	lea    0x8(%eax),%edx
c0104175:	8b 45 08             	mov    0x8(%ebp),%eax
c0104178:	89 50 04             	mov    %edx,0x4(%eax)
c010417b:	8b 45 08             	mov    0x8(%ebp),%eax
c010417e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104184:	85 c0                	test   %eax,%eax
c0104186:	0f 84 11 01 00 00    	je     c010429d <tty_dev_write+0x1a6>
c010418c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104190:	3c 20                	cmp    $0x20,%al
c0104192:	76 08                	jbe    c010419c <tty_dev_write+0xa5>
c0104194:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104198:	3c 7e                	cmp    $0x7e,%al
c010419a:	76 10                	jbe    c01041ac <tty_dev_write+0xb5>
c010419c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041a0:	3c 20                	cmp    $0x20,%al
c01041a2:	74 08                	je     c01041ac <tty_dev_write+0xb5>
c01041a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041a8:	84 c0                	test   %al,%al
c01041aa:	75 58                	jne    c0104204 <tty_dev_write+0x10d>
c01041ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01041af:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c01041b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01041b8:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01041be:	01 d0                	add    %edx,%eax
c01041c0:	83 e8 01             	sub    $0x1,%eax
c01041c3:	89 c2                	mov    %eax,%edx
c01041c5:	83 ec 04             	sub    $0x4,%esp
c01041c8:	6a 01                	push   $0x1
c01041ca:	8d 45 e7             	lea    -0x19(%ebp),%eax
c01041cd:	50                   	push   %eax
c01041ce:	52                   	push   %edx
c01041cf:	e8 58 2b 00 00       	call   c0106d2c <Memcpy>
c01041d4:	83 c4 10             	add    $0x10,%esp
c01041d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041da:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01041e0:	8d 50 ff             	lea    -0x1(%eax),%edx
c01041e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01041e6:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01041ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041f0:	0f b6 c0             	movzbl %al,%eax
c01041f3:	83 ec 08             	sub    $0x8,%esp
c01041f6:	50                   	push   %eax
c01041f7:	ff 75 08             	pushl  0x8(%ebp)
c01041fa:	e8 11 fd ff ff       	call   c0103f10 <out_char>
c01041ff:	83 c4 10             	add    $0x10,%esp
c0104202:	eb 7c                	jmp    c0104280 <tty_dev_write+0x189>
c0104204:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104208:	3c 08                	cmp    $0x8,%al
c010420a:	75 42                	jne    c010424e <tty_dev_write+0x157>
c010420c:	8b 45 08             	mov    0x8(%ebp),%eax
c010420f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104215:	8d 50 01             	lea    0x1(%eax),%edx
c0104218:	8b 45 08             	mov    0x8(%ebp),%eax
c010421b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104221:	8b 45 08             	mov    0x8(%ebp),%eax
c0104224:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010422a:	8d 50 fe             	lea    -0x2(%eax),%edx
c010422d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104230:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104236:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010423a:	0f b6 c0             	movzbl %al,%eax
c010423d:	83 ec 08             	sub    $0x8,%esp
c0104240:	50                   	push   %eax
c0104241:	ff 75 08             	pushl  0x8(%ebp)
c0104244:	e8 c7 fc ff ff       	call   c0103f10 <out_char>
c0104249:	83 c4 10             	add    $0x10,%esp
c010424c:	eb 32                	jmp    c0104280 <tty_dev_write+0x189>
c010424e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104252:	3c 0a                	cmp    $0xa,%al
c0104254:	75 2a                	jne    c0104280 <tty_dev_write+0x189>
c0104256:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010425a:	0f b6 c0             	movzbl %al,%eax
c010425d:	83 ec 08             	sub    $0x8,%esp
c0104260:	50                   	push   %eax
c0104261:	ff 75 08             	pushl  0x8(%ebp)
c0104264:	e8 a7 fc ff ff       	call   c0103f10 <out_char>
c0104269:	83 c4 10             	add    $0x10,%esp
c010426c:	8b 45 08             	mov    0x8(%ebp),%eax
c010426f:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0104276:	00 00 00 
c0104279:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104280:	8b 45 08             	mov    0x8(%ebp),%eax
c0104283:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104289:	8b 45 08             	mov    0x8(%ebp),%eax
c010428c:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0104292:	39 c2                	cmp    %eax,%edx
c0104294:	75 07                	jne    c010429d <tty_dev_write+0x1a6>
c0104296:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010429d:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a0:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01042a6:	85 c0                	test   %eax,%eax
c01042a8:	0f 85 67 fe ff ff    	jne    c0104115 <tty_dev_write+0x1e>
c01042ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01042b2:	74 6d                	je     c0104321 <tty_dev_write+0x22a>
c01042b4:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c01042bb:	83 ec 0c             	sub    $0xc,%esp
c01042be:	ff 75 ec             	pushl  -0x14(%ebp)
c01042c1:	e8 b6 d3 ff ff       	call   c010167c <sys_malloc>
c01042c6:	83 c4 10             	add    $0x10,%esp
c01042c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01042cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042cf:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c01042d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01042d9:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01042df:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042e2:	89 50 60             	mov    %edx,0x60(%eax)
c01042e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01042e8:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c01042ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042f1:	89 50 68             	mov    %edx,0x68(%eax)
c01042f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01042f7:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01042fd:	83 ec 04             	sub    $0x4,%esp
c0104300:	50                   	push   %eax
c0104301:	ff 75 e8             	pushl  -0x18(%ebp)
c0104304:	6a 01                	push   $0x1
c0104306:	e8 aa 52 00 00       	call   c01095b5 <send_rec>
c010430b:	83 c4 10             	add    $0x10,%esp
c010430e:	83 ec 08             	sub    $0x8,%esp
c0104311:	ff 75 ec             	pushl  -0x14(%ebp)
c0104314:	ff 75 e8             	pushl  -0x18(%ebp)
c0104317:	e8 75 d3 ff ff       	call   c0101691 <sys_free>
c010431c:	83 c4 10             	add    $0x10,%esp
c010431f:	eb 01                	jmp    c0104322 <tty_dev_write+0x22b>
c0104321:	90                   	nop
c0104322:	c9                   	leave  
c0104323:	c3                   	ret    

c0104324 <tty_do_read>:
c0104324:	55                   	push   %ebp
c0104325:	89 e5                	mov    %esp,%ebp
c0104327:	83 ec 08             	sub    $0x8,%esp
c010432a:	8b 45 08             	mov    0x8(%ebp),%eax
c010432d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104334:	00 00 00 
c0104337:	8b 45 0c             	mov    0xc(%ebp),%eax
c010433a:	8b 50 68             	mov    0x68(%eax),%edx
c010433d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104340:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104346:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104349:	8b 00                	mov    (%eax),%eax
c010434b:	89 c2                	mov    %eax,%edx
c010434d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104350:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0104356:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104359:	8b 50 60             	mov    0x60(%eax),%edx
c010435c:	8b 45 08             	mov    0x8(%ebp),%eax
c010435f:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104365:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104368:	8b 50 60             	mov    0x60(%eax),%edx
c010436b:	8b 45 08             	mov    0x8(%ebp),%eax
c010436e:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0104374:	8b 45 08             	mov    0x8(%ebp),%eax
c0104377:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c010437d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104380:	8b 40 10             	mov    0x10(%eax),%eax
c0104383:	83 ec 08             	sub    $0x8,%esp
c0104386:	52                   	push   %edx
c0104387:	50                   	push   %eax
c0104388:	e8 32 1b 00 00       	call   c0105ebf <alloc_virtual_memory>
c010438d:	83 c4 10             	add    $0x10,%esp
c0104390:	89 c2                	mov    %eax,%edx
c0104392:	8b 45 08             	mov    0x8(%ebp),%eax
c0104395:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c010439b:	8b 45 08             	mov    0x8(%ebp),%eax
c010439e:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01043a4:	83 f8 02             	cmp    $0x2,%eax
c01043a7:	74 1c                	je     c01043c5 <tty_do_read+0xa1>
c01043a9:	68 3b 01 00 00       	push   $0x13b
c01043ae:	68 05 b5 10 c0       	push   $0xc010b505
c01043b3:	68 05 b5 10 c0       	push   $0xc010b505
c01043b8:	68 0f b5 10 c0       	push   $0xc010b50f
c01043bd:	e8 83 45 00 00       	call   c0108945 <assertion_failure>
c01043c2:	83 c4 10             	add    $0x10,%esp
c01043c5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043c8:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c01043cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01043d2:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01043d8:	83 ec 04             	sub    $0x4,%esp
c01043db:	50                   	push   %eax
c01043dc:	ff 75 0c             	pushl  0xc(%ebp)
c01043df:	6a 01                	push   $0x1
c01043e1:	e8 cf 51 00 00       	call   c01095b5 <send_rec>
c01043e6:	83 c4 10             	add    $0x10,%esp
c01043e9:	90                   	nop
c01043ea:	c9                   	leave  
c01043eb:	c3                   	ret    

c01043ec <tty_do_write>:
c01043ec:	55                   	push   %ebp
c01043ed:	89 e5                	mov    %esp,%ebp
c01043ef:	53                   	push   %ebx
c01043f0:	83 ec 24             	sub    $0x24,%esp
c01043f3:	89 e0                	mov    %esp,%eax
c01043f5:	89 c3                	mov    %eax,%ebx
c01043f7:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c01043fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104401:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104404:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104407:	89 c2                	mov    %eax,%edx
c0104409:	b8 10 00 00 00       	mov    $0x10,%eax
c010440e:	83 e8 01             	sub    $0x1,%eax
c0104411:	01 d0                	add    %edx,%eax
c0104413:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104418:	ba 00 00 00 00       	mov    $0x0,%edx
c010441d:	f7 f1                	div    %ecx
c010441f:	6b c0 10             	imul   $0x10,%eax,%eax
c0104422:	29 c4                	sub    %eax,%esp
c0104424:	89 e0                	mov    %esp,%eax
c0104426:	83 c0 00             	add    $0x0,%eax
c0104429:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010442c:	83 ec 04             	sub    $0x4,%esp
c010442f:	ff 75 e8             	pushl  -0x18(%ebp)
c0104432:	6a 00                	push   $0x0
c0104434:	ff 75 e0             	pushl  -0x20(%ebp)
c0104437:	e8 93 7d 00 00       	call   c010c1cf <Memset>
c010443c:	83 c4 10             	add    $0x10,%esp
c010443f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104442:	8b 40 60             	mov    0x60(%eax),%eax
c0104445:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104448:	8b 45 08             	mov    0x8(%ebp),%eax
c010444b:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104452:	00 00 00 
c0104455:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104458:	8b 45 0c             	mov    0xc(%ebp),%eax
c010445b:	8b 40 10             	mov    0x10(%eax),%eax
c010445e:	83 ec 08             	sub    $0x8,%esp
c0104461:	52                   	push   %edx
c0104462:	50                   	push   %eax
c0104463:	e8 57 1a 00 00       	call   c0105ebf <alloc_virtual_memory>
c0104468:	83 c4 10             	add    $0x10,%esp
c010446b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010446e:	eb 7e                	jmp    c01044ee <tty_do_write+0x102>
c0104470:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104473:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0104476:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c010447a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010447d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104480:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104486:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104489:	01 d0                	add    %edx,%eax
c010448b:	83 ec 04             	sub    $0x4,%esp
c010448e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104491:	50                   	push   %eax
c0104492:	ff 75 e0             	pushl  -0x20(%ebp)
c0104495:	e8 92 28 00 00       	call   c0106d2c <Memcpy>
c010449a:	83 c4 10             	add    $0x10,%esp
c010449d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01044a0:	29 45 ec             	sub    %eax,-0x14(%ebp)
c01044a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01044a6:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01044ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01044af:	01 c2                	add    %eax,%edx
c01044b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01044b4:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01044ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01044c1:	eb 25                	jmp    c01044e8 <tty_do_write+0xfc>
c01044c3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01044c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044c9:	01 d0                	add    %edx,%eax
c01044cb:	0f b6 00             	movzbl (%eax),%eax
c01044ce:	0f b6 c0             	movzbl %al,%eax
c01044d1:	83 ec 08             	sub    $0x8,%esp
c01044d4:	50                   	push   %eax
c01044d5:	ff 75 08             	pushl  0x8(%ebp)
c01044d8:	e8 33 fa ff ff       	call   c0103f10 <out_char>
c01044dd:	83 c4 10             	add    $0x10,%esp
c01044e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01044e4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c01044e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01044ec:	75 d5                	jne    c01044c3 <tty_do_write+0xd7>
c01044ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01044f2:	0f 85 78 ff ff ff    	jne    c0104470 <tty_do_write+0x84>
c01044f8:	83 ec 0c             	sub    $0xc,%esp
c01044fb:	6a 7c                	push   $0x7c
c01044fd:	e8 7a d1 ff ff       	call   c010167c <sys_malloc>
c0104502:	83 c4 10             	add    $0x10,%esp
c0104505:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104508:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010450b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104512:	8b 45 08             	mov    0x8(%ebp),%eax
c0104515:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010451b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010451e:	89 50 58             	mov    %edx,0x58(%eax)
c0104521:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104524:	8b 00                	mov    (%eax),%eax
c0104526:	83 ec 04             	sub    $0x4,%esp
c0104529:	50                   	push   %eax
c010452a:	ff 75 d8             	pushl  -0x28(%ebp)
c010452d:	6a 01                	push   $0x1
c010452f:	e8 81 50 00 00       	call   c01095b5 <send_rec>
c0104534:	83 c4 10             	add    $0x10,%esp
c0104537:	83 ec 08             	sub    $0x8,%esp
c010453a:	6a 7c                	push   $0x7c
c010453c:	ff 75 d8             	pushl  -0x28(%ebp)
c010453f:	e8 4d d1 ff ff       	call   c0101691 <sys_free>
c0104544:	83 c4 10             	add    $0x10,%esp
c0104547:	89 dc                	mov    %ebx,%esp
c0104549:	90                   	nop
c010454a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010454d:	c9                   	leave  
c010454e:	c3                   	ret    

c010454f <init_screen>:
c010454f:	55                   	push   %ebp
c0104550:	89 e5                	mov    %esp,%ebp
c0104552:	83 ec 10             	sub    $0x10,%esp
c0104555:	8b 45 08             	mov    0x8(%ebp),%eax
c0104558:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010455d:	c1 f8 03             	sar    $0x3,%eax
c0104560:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104566:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104569:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010456c:	c1 e0 04             	shl    $0x4,%eax
c010456f:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c0104575:	8b 45 08             	mov    0x8(%ebp),%eax
c0104578:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c010457e:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104585:	8b 45 08             	mov    0x8(%ebp),%eax
c0104588:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010458e:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0104591:	89 50 04             	mov    %edx,0x4(%eax)
c0104594:	8b 45 08             	mov    0x8(%ebp),%eax
c0104597:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010459d:	8b 50 04             	mov    0x4(%eax),%edx
c01045a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01045a3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01045a9:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c01045ad:	89 10                	mov    %edx,(%eax)
c01045af:	8b 45 08             	mov    0x8(%ebp),%eax
c01045b2:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c01045b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01045bb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01045c1:	8b 12                	mov    (%edx),%edx
c01045c3:	89 50 08             	mov    %edx,0x8(%eax)
c01045c6:	8b 55 08             	mov    0x8(%ebp),%edx
c01045c9:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c01045cf:	8b 40 08             	mov    0x8(%eax),%eax
c01045d2:	89 42 0c             	mov    %eax,0xc(%edx)
c01045d5:	90                   	nop
c01045d6:	c9                   	leave  
c01045d7:	c3                   	ret    

c01045d8 <init_tty>:
c01045d8:	55                   	push   %ebp
c01045d9:	89 e5                	mov    %esp,%ebp
c01045db:	83 ec 18             	sub    $0x18,%esp
c01045de:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01045e5:	e9 92 00 00 00       	jmp    c010467c <init_tty+0xa4>
c01045ea:	83 ec 04             	sub    $0x4,%esp
c01045ed:	68 28 08 00 00       	push   $0x828
c01045f2:	6a 00                	push   $0x0
c01045f4:	ff 75 f4             	pushl  -0xc(%ebp)
c01045f7:	e8 d3 7b 00 00       	call   c010c1cf <Memset>
c01045fc:	83 c4 10             	add    $0x10,%esp
c01045ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104602:	8d 50 08             	lea    0x8(%eax),%edx
c0104605:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104608:	89 50 04             	mov    %edx,0x4(%eax)
c010460b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010460e:	8b 50 04             	mov    0x4(%eax),%edx
c0104611:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104614:	89 10                	mov    %edx,(%eax)
c0104616:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104619:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0104620:	00 00 00 
c0104623:	83 ec 0c             	sub    $0xc,%esp
c0104626:	ff 75 f4             	pushl  -0xc(%ebp)
c0104629:	e8 21 ff ff ff       	call   c010454f <init_screen>
c010462e:	83 c4 10             	add    $0x10,%esp
c0104631:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104634:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104639:	85 c0                	test   %eax,%eax
c010463b:	7e 38                	jle    c0104675 <init_tty+0x9d>
c010463d:	83 ec 08             	sub    $0x8,%esp
c0104640:	6a 23                	push   $0x23
c0104642:	ff 75 f4             	pushl  -0xc(%ebp)
c0104645:	e8 c6 f8 ff ff       	call   c0103f10 <out_char>
c010464a:	83 c4 10             	add    $0x10,%esp
c010464d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104650:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0104655:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010465a:	c1 f8 03             	sar    $0x3,%eax
c010465d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104663:	0f b6 c0             	movzbl %al,%eax
c0104666:	83 ec 08             	sub    $0x8,%esp
c0104669:	50                   	push   %eax
c010466a:	ff 75 f4             	pushl  -0xc(%ebp)
c010466d:	e8 9e f8 ff ff       	call   c0103f10 <out_char>
c0104672:	83 c4 10             	add    $0x10,%esp
c0104675:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010467c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104681:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104684:	0f 82 60 ff ff ff    	jb     c01045ea <init_tty+0x12>
c010468a:	90                   	nop
c010468b:	c9                   	leave  
c010468c:	c3                   	ret    

c010468d <TaskTTY>:
c010468d:	55                   	push   %ebp
c010468e:	89 e5                	mov    %esp,%ebp
c0104690:	83 ec 28             	sub    $0x28,%esp
c0104693:	e8 40 ff ff ff       	call   c01045d8 <init_tty>
c0104698:	83 ec 0c             	sub    $0xc,%esp
c010469b:	6a 00                	push   $0x0
c010469d:	e8 24 f6 ff ff       	call   c0103cc6 <select_console>
c01046a2:	83 c4 10             	add    $0x10,%esp
c01046a5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01046ac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01046b3:	83 ec 0c             	sub    $0xc,%esp
c01046b6:	6a 7c                	push   $0x7c
c01046b8:	e8 bf cf ff ff       	call   c010167c <sys_malloc>
c01046bd:	83 c4 10             	add    $0x10,%esp
c01046c0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01046c3:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01046ca:	eb 30                	jmp    c01046fc <TaskTTY+0x6f>
c01046cc:	83 ec 0c             	sub    $0xc,%esp
c01046cf:	ff 75 f4             	pushl  -0xc(%ebp)
c01046d2:	e8 f6 f9 ff ff       	call   c01040cd <tty_dev_read>
c01046d7:	83 c4 10             	add    $0x10,%esp
c01046da:	83 ec 0c             	sub    $0xc,%esp
c01046dd:	ff 75 f4             	pushl  -0xc(%ebp)
c01046e0:	e8 12 fa ff ff       	call   c01040f7 <tty_dev_write>
c01046e5:	83 c4 10             	add    $0x10,%esp
c01046e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046eb:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01046f1:	85 c0                	test   %eax,%eax
c01046f3:	75 d7                	jne    c01046cc <TaskTTY+0x3f>
c01046f5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01046fc:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104701:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104704:	72 c6                	jb     c01046cc <TaskTTY+0x3f>
c0104706:	83 ec 04             	sub    $0x4,%esp
c0104709:	6a 12                	push   $0x12
c010470b:	ff 75 e8             	pushl  -0x18(%ebp)
c010470e:	6a 02                	push   $0x2
c0104710:	e8 a0 4e 00 00       	call   c01095b5 <send_rec>
c0104715:	83 c4 10             	add    $0x10,%esp
c0104718:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010471b:	8b 40 78             	mov    0x78(%eax),%eax
c010471e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104721:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104728:	74 28                	je     c0104752 <TaskTTY+0xc5>
c010472a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104731:	7f 0b                	jg     c010473e <TaskTTY+0xb1>
c0104733:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c010473a:	74 4e                	je     c010478a <TaskTTY+0xfd>
c010473c:	eb 4d                	jmp    c010478b <TaskTTY+0xfe>
c010473e:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104745:	74 21                	je     c0104768 <TaskTTY+0xdb>
c0104747:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c010474e:	74 2e                	je     c010477e <TaskTTY+0xf1>
c0104750:	eb 39                	jmp    c010478b <TaskTTY+0xfe>
c0104752:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104757:	83 ec 08             	sub    $0x8,%esp
c010475a:	ff 75 e8             	pushl  -0x18(%ebp)
c010475d:	50                   	push   %eax
c010475e:	e8 c1 fb ff ff       	call   c0104324 <tty_do_read>
c0104763:	83 c4 10             	add    $0x10,%esp
c0104766:	eb 23                	jmp    c010478b <TaskTTY+0xfe>
c0104768:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c010476d:	83 ec 08             	sub    $0x8,%esp
c0104770:	ff 75 e8             	pushl  -0x18(%ebp)
c0104773:	50                   	push   %eax
c0104774:	e8 73 fc ff ff       	call   c01043ec <tty_do_write>
c0104779:	83 c4 10             	add    $0x10,%esp
c010477c:	eb 0d                	jmp    c010478b <TaskTTY+0xfe>
c010477e:	c7 05 c4 06 11 c0 00 	movl   $0x0,0xc01106c4
c0104785:	00 00 00 
c0104788:	eb 01                	jmp    c010478b <TaskTTY+0xfe>
c010478a:	90                   	nop
c010478b:	e9 33 ff ff ff       	jmp    c01046c3 <TaskTTY+0x36>

c0104790 <keyboard_handler>:
c0104790:	55                   	push   %ebp
c0104791:	89 e5                	mov    %esp,%ebp
c0104793:	83 ec 18             	sub    $0x18,%esp
c0104796:	c7 05 c4 06 11 c0 01 	movl   $0x1,0xc01106c4
c010479d:	00 00 00 
c01047a0:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c01047a7:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047ac:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c01047b1:	7f 5e                	jg     c0104811 <keyboard_handler+0x81>
c01047b3:	e8 5a bb ff ff       	call   c0100312 <disable_int>
c01047b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01047bb:	0f b7 c0             	movzwl %ax,%eax
c01047be:	83 ec 0c             	sub    $0xc,%esp
c01047c1:	50                   	push   %eax
c01047c2:	e8 1d bb ff ff       	call   c01002e4 <in_byte>
c01047c7:	83 c4 10             	add    $0x10,%esp
c01047ca:	88 45 f3             	mov    %al,-0xd(%ebp)
c01047cd:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047d2:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c01047d6:	88 10                	mov    %dl,(%eax)
c01047d8:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047dd:	83 c0 01             	add    $0x1,%eax
c01047e0:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c01047e5:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047ea:	83 c0 01             	add    $0x1,%eax
c01047ed:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01047f2:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047f7:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01047fc:	39 d0                	cmp    %edx,%eax
c01047fe:	72 0a                	jb     c010480a <keyboard_handler+0x7a>
c0104800:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104807:	fb 10 c0 
c010480a:	e8 05 bb ff ff       	call   c0100314 <enable_int>
c010480f:	eb 01                	jmp    c0104812 <keyboard_handler+0x82>
c0104811:	90                   	nop
c0104812:	c9                   	leave  
c0104813:	c3                   	ret    

c0104814 <read_from_keyboard_buf>:
c0104814:	55                   	push   %ebp
c0104815:	89 e5                	mov    %esp,%ebp
c0104817:	83 ec 18             	sub    $0x18,%esp
c010481a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c010481e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104823:	85 c0                	test   %eax,%eax
c0104825:	7f 06                	jg     c010482d <read_from_keyboard_buf+0x19>
c0104827:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c010482b:	eb 4b                	jmp    c0104878 <read_from_keyboard_buf+0x64>
c010482d:	e8 e0 ba ff ff       	call   c0100312 <disable_int>
c0104832:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104837:	0f b6 00             	movzbl (%eax),%eax
c010483a:	88 45 f7             	mov    %al,-0x9(%ebp)
c010483d:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104842:	83 c0 01             	add    $0x1,%eax
c0104845:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010484a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010484f:	83 e8 01             	sub    $0x1,%eax
c0104852:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104857:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c010485c:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104861:	39 d0                	cmp    %edx,%eax
c0104863:	72 0a                	jb     c010486f <read_from_keyboard_buf+0x5b>
c0104865:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c010486c:	fb 10 c0 
c010486f:	e8 a0 ba ff ff       	call   c0100314 <enable_int>
c0104874:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104878:	c9                   	leave  
c0104879:	c3                   	ret    

c010487a <keyboard_read>:
c010487a:	55                   	push   %ebp
c010487b:	89 e5                	mov    %esp,%ebp
c010487d:	83 ec 28             	sub    $0x28,%esp
c0104880:	90                   	nop
c0104881:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104886:	85 c0                	test   %eax,%eax
c0104888:	7e f7                	jle    c0104881 <keyboard_read+0x7>
c010488a:	e8 85 ff ff ff       	call   c0104814 <read_from_keyboard_buf>
c010488f:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104892:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104899:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010489d:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c01048a1:	75 5a                	jne    c01048fd <keyboard_read+0x83>
c01048a3:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c01048a7:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c01048ab:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c01048af:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c01048b3:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c01048b7:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c01048bb:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c01048bf:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01048c6:	eb 20                	jmp    c01048e8 <keyboard_read+0x6e>
c01048c8:	e8 47 ff ff ff       	call   c0104814 <read_from_keyboard_buf>
c01048cd:	89 c1                	mov    %eax,%ecx
c01048cf:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c01048d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01048d5:	01 d0                	add    %edx,%eax
c01048d7:	0f b6 00             	movzbl (%eax),%eax
c01048da:	38 c1                	cmp    %al,%cl
c01048dc:	74 06                	je     c01048e4 <keyboard_read+0x6a>
c01048de:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c01048e2:	eb 0a                	jmp    c01048ee <keyboard_read+0x74>
c01048e4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01048e8:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c01048ec:	7e da                	jle    c01048c8 <keyboard_read+0x4e>
c01048ee:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c01048f2:	74 68                	je     c010495c <keyboard_read+0xe2>
c01048f4:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c01048fb:	eb 5f                	jmp    c010495c <keyboard_read+0xe2>
c01048fd:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104901:	75 59                	jne    c010495c <keyboard_read+0xe2>
c0104903:	e8 0c ff ff ff       	call   c0104814 <read_from_keyboard_buf>
c0104908:	3c 2a                	cmp    $0x2a,%al
c010490a:	75 1d                	jne    c0104929 <keyboard_read+0xaf>
c010490c:	e8 03 ff ff ff       	call   c0104814 <read_from_keyboard_buf>
c0104911:	3c e0                	cmp    $0xe0,%al
c0104913:	75 14                	jne    c0104929 <keyboard_read+0xaf>
c0104915:	e8 fa fe ff ff       	call   c0104814 <read_from_keyboard_buf>
c010491a:	3c 37                	cmp    $0x37,%al
c010491c:	75 0b                	jne    c0104929 <keyboard_read+0xaf>
c010491e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104925:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104929:	e8 e6 fe ff ff       	call   c0104814 <read_from_keyboard_buf>
c010492e:	3c b7                	cmp    $0xb7,%al
c0104930:	75 1d                	jne    c010494f <keyboard_read+0xd5>
c0104932:	e8 dd fe ff ff       	call   c0104814 <read_from_keyboard_buf>
c0104937:	3c e0                	cmp    $0xe0,%al
c0104939:	75 14                	jne    c010494f <keyboard_read+0xd5>
c010493b:	e8 d4 fe ff ff       	call   c0104814 <read_from_keyboard_buf>
c0104940:	3c aa                	cmp    $0xaa,%al
c0104942:	75 0b                	jne    c010494f <keyboard_read+0xd5>
c0104944:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c010494b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010494f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104953:	75 07                	jne    c010495c <keyboard_read+0xe2>
c0104955:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c010495c:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104963:	0f 84 8d 00 00 00    	je     c01049f6 <keyboard_read+0x17c>
c0104969:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0104970:	0f 84 80 00 00 00    	je     c01049f6 <keyboard_read+0x17c>
c0104976:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c010497a:	0f 94 c2             	sete   %dl
c010497d:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104981:	0f 94 c0             	sete   %al
c0104984:	09 d0                	or     %edx,%eax
c0104986:	84 c0                	test   %al,%al
c0104988:	74 07                	je     c0104991 <keyboard_read+0x117>
c010498a:	c6 05 cc 06 11 c0 01 	movb   $0x1,0xc01106cc
c0104991:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104995:	f7 d0                	not    %eax
c0104997:	c0 e8 07             	shr    $0x7,%al
c010499a:	88 45 e9             	mov    %al,-0x17(%ebp)
c010499d:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c01049a1:	74 53                	je     c01049f6 <keyboard_read+0x17c>
c01049a3:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c01049a7:	74 4d                	je     c01049f6 <keyboard_read+0x17c>
c01049a9:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c01049ad:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c01049b4:	3c 01                	cmp    $0x1,%al
c01049b6:	75 04                	jne    c01049bc <keyboard_read+0x142>
c01049b8:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c01049bc:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c01049c3:	84 c0                	test   %al,%al
c01049c5:	74 04                	je     c01049cb <keyboard_read+0x151>
c01049c7:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c01049cb:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c01049cf:	89 d0                	mov    %edx,%eax
c01049d1:	01 c0                	add    %eax,%eax
c01049d3:	01 c2                	add    %eax,%edx
c01049d5:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01049d9:	01 d0                	add    %edx,%eax
c01049db:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c01049e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01049e5:	83 ec 08             	sub    $0x8,%esp
c01049e8:	ff 75 f4             	pushl  -0xc(%ebp)
c01049eb:	ff 75 08             	pushl  0x8(%ebp)
c01049ee:	e8 1a 00 00 00       	call   c0104a0d <in_process>
c01049f3:	83 c4 10             	add    $0x10,%esp
c01049f6:	90                   	nop
c01049f7:	c9                   	leave  
c01049f8:	c3                   	ret    

c01049f9 <init_keyboard_handler>:
c01049f9:	55                   	push   %ebp
c01049fa:	89 e5                	mov    %esp,%ebp
c01049fc:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a03:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104a0a:	90                   	nop
c0104a0b:	5d                   	pop    %ebp
c0104a0c:	c3                   	ret    

c0104a0d <in_process>:
c0104a0d:	55                   	push   %ebp
c0104a0e:	89 e5                	mov    %esp,%ebp
c0104a10:	83 ec 18             	sub    $0x18,%esp
c0104a13:	83 ec 04             	sub    $0x4,%esp
c0104a16:	6a 02                	push   $0x2
c0104a18:	6a 00                	push   $0x0
c0104a1a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0104a1d:	50                   	push   %eax
c0104a1e:	e8 ac 77 00 00       	call   c010c1cf <Memset>
c0104a23:	83 c4 10             	add    $0x10,%esp
c0104a26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a29:	25 00 01 00 00       	and    $0x100,%eax
c0104a2e:	85 c0                	test   %eax,%eax
c0104a30:	75 28                	jne    c0104a5a <in_process+0x4d>
c0104a32:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a35:	0f b6 c0             	movzbl %al,%eax
c0104a38:	83 ec 08             	sub    $0x8,%esp
c0104a3b:	50                   	push   %eax
c0104a3c:	ff 75 08             	pushl  0x8(%ebp)
c0104a3f:	e8 b3 f3 ff ff       	call   c0103df7 <put_key>
c0104a44:	83 c4 10             	add    $0x10,%esp
c0104a47:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a4e:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104a55:	e9 42 01 00 00       	jmp    c0104b9c <in_process+0x18f>
c0104a5a:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104a61:	84 c0                	test   %al,%al
c0104a63:	0f 84 a9 00 00 00    	je     c0104b12 <in_process+0x105>
c0104a69:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104a6d:	0f 84 9f 00 00 00    	je     c0104b12 <in_process+0x105>
c0104a73:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104a77:	0f 84 95 00 00 00    	je     c0104b12 <in_process+0x105>
c0104a7d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a84:	74 64                	je     c0104aea <in_process+0xdd>
c0104a86:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a8d:	77 0b                	ja     c0104a9a <in_process+0x8d>
c0104a8f:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104a96:	74 64                	je     c0104afc <in_process+0xef>
c0104a98:	eb 73                	jmp    c0104b0d <in_process+0x100>
c0104a9a:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104aa1:	74 0b                	je     c0104aae <in_process+0xa1>
c0104aa3:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104aaa:	74 20                	je     c0104acc <in_process+0xbf>
c0104aac:	eb 5f                	jmp    c0104b0d <in_process+0x100>
c0104aae:	83 ec 0c             	sub    $0xc,%esp
c0104ab1:	ff 75 08             	pushl  0x8(%ebp)
c0104ab4:	e8 aa f3 ff ff       	call   c0103e63 <scroll_up>
c0104ab9:	83 c4 10             	add    $0x10,%esp
c0104abc:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104ac3:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104aca:	eb 41                	jmp    c0104b0d <in_process+0x100>
c0104acc:	83 ec 0c             	sub    $0xc,%esp
c0104acf:	ff 75 08             	pushl  0x8(%ebp)
c0104ad2:	e8 ce f3 ff ff       	call   c0103ea5 <scroll_down>
c0104ad7:	83 c4 10             	add    $0x10,%esp
c0104ada:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104ae1:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104ae8:	eb 23                	jmp    c0104b0d <in_process+0x100>
c0104aea:	83 ec 08             	sub    $0x8,%esp
c0104aed:	6a 0a                	push   $0xa
c0104aef:	ff 75 08             	pushl  0x8(%ebp)
c0104af2:	e8 19 f4 ff ff       	call   c0103f10 <out_char>
c0104af7:	83 c4 10             	add    $0x10,%esp
c0104afa:	eb 11                	jmp    c0104b0d <in_process+0x100>
c0104afc:	83 ec 08             	sub    $0x8,%esp
c0104aff:	6a 08                	push   $0x8
c0104b01:	ff 75 08             	pushl  0x8(%ebp)
c0104b04:	e8 07 f4 ff ff       	call   c0103f10 <out_char>
c0104b09:	83 c4 10             	add    $0x10,%esp
c0104b0c:	90                   	nop
c0104b0d:	e9 8a 00 00 00       	jmp    c0104b9c <in_process+0x18f>
c0104b12:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104b19:	74 55                	je     c0104b70 <in_process+0x163>
c0104b1b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104b22:	77 14                	ja     c0104b38 <in_process+0x12b>
c0104b24:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104b2b:	74 31                	je     c0104b5e <in_process+0x151>
c0104b2d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104b34:	74 16                	je     c0104b4c <in_process+0x13f>
c0104b36:	eb 64                	jmp    c0104b9c <in_process+0x18f>
c0104b38:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104b3f:	74 3e                	je     c0104b7f <in_process+0x172>
c0104b41:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104b48:	74 44                	je     c0104b8e <in_process+0x181>
c0104b4a:	eb 50                	jmp    c0104b9c <in_process+0x18f>
c0104b4c:	83 ec 08             	sub    $0x8,%esp
c0104b4f:	6a 0a                	push   $0xa
c0104b51:	ff 75 08             	pushl  0x8(%ebp)
c0104b54:	e8 9e f2 ff ff       	call   c0103df7 <put_key>
c0104b59:	83 c4 10             	add    $0x10,%esp
c0104b5c:	eb 3e                	jmp    c0104b9c <in_process+0x18f>
c0104b5e:	83 ec 08             	sub    $0x8,%esp
c0104b61:	6a 08                	push   $0x8
c0104b63:	ff 75 08             	pushl  0x8(%ebp)
c0104b66:	e8 8c f2 ff ff       	call   c0103df7 <put_key>
c0104b6b:	83 c4 10             	add    $0x10,%esp
c0104b6e:	eb 2c                	jmp    c0104b9c <in_process+0x18f>
c0104b70:	83 ec 0c             	sub    $0xc,%esp
c0104b73:	6a 00                	push   $0x0
c0104b75:	e8 4c f1 ff ff       	call   c0103cc6 <select_console>
c0104b7a:	83 c4 10             	add    $0x10,%esp
c0104b7d:	eb 1d                	jmp    c0104b9c <in_process+0x18f>
c0104b7f:	83 ec 0c             	sub    $0xc,%esp
c0104b82:	6a 01                	push   $0x1
c0104b84:	e8 3d f1 ff ff       	call   c0103cc6 <select_console>
c0104b89:	83 c4 10             	add    $0x10,%esp
c0104b8c:	eb 0e                	jmp    c0104b9c <in_process+0x18f>
c0104b8e:	83 ec 0c             	sub    $0xc,%esp
c0104b91:	6a 02                	push   $0x2
c0104b93:	e8 2e f1 ff ff       	call   c0103cc6 <select_console>
c0104b98:	83 c4 10             	add    $0x10,%esp
c0104b9b:	90                   	nop
c0104b9c:	90                   	nop
c0104b9d:	c9                   	leave  
c0104b9e:	c3                   	ret    

c0104b9f <open>:
c0104b9f:	55                   	push   %ebp
c0104ba0:	89 e5                	mov    %esp,%ebp
c0104ba2:	83 ec 18             	sub    $0x18,%esp
c0104ba5:	83 ec 0c             	sub    $0xc,%esp
c0104ba8:	6a 7c                	push   $0x7c
c0104baa:	e8 cd ca ff ff       	call   c010167c <sys_malloc>
c0104baf:	83 c4 10             	add    $0x10,%esp
c0104bb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104bb5:	83 ec 04             	sub    $0x4,%esp
c0104bb8:	6a 7c                	push   $0x7c
c0104bba:	6a 00                	push   $0x0
c0104bbc:	ff 75 f4             	pushl  -0xc(%ebp)
c0104bbf:	e8 0b 76 00 00       	call   c010c1cf <Memset>
c0104bc4:	83 c4 10             	add    $0x10,%esp
c0104bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bca:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104bd1:	83 ec 0c             	sub    $0xc,%esp
c0104bd4:	ff 75 08             	pushl  0x8(%ebp)
c0104bd7:	e8 32 14 00 00       	call   c010600e <get_physical_address>
c0104bdc:	83 c4 10             	add    $0x10,%esp
c0104bdf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104be2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104be5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104be8:	89 50 44             	mov    %edx,0x44(%eax)
c0104beb:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104bee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bf1:	89 50 74             	mov    %edx,0x74(%eax)
c0104bf4:	83 ec 0c             	sub    $0xc,%esp
c0104bf7:	ff 75 08             	pushl  0x8(%ebp)
c0104bfa:	e8 09 76 00 00       	call   c010c208 <Strlen>
c0104bff:	83 c4 10             	add    $0x10,%esp
c0104c02:	89 c2                	mov    %eax,%edx
c0104c04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c07:	89 50 40             	mov    %edx,0x40(%eax)
c0104c0a:	83 ec 04             	sub    $0x4,%esp
c0104c0d:	6a 02                	push   $0x2
c0104c0f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c12:	6a 03                	push   $0x3
c0104c14:	e8 9c 49 00 00       	call   c01095b5 <send_rec>
c0104c19:	83 c4 10             	add    $0x10,%esp
c0104c1c:	83 ec 08             	sub    $0x8,%esp
c0104c1f:	6a 7c                	push   $0x7c
c0104c21:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c24:	e8 68 ca ff ff       	call   c0101691 <sys_free>
c0104c29:	83 c4 10             	add    $0x10,%esp
c0104c2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c2f:	8b 40 50             	mov    0x50(%eax),%eax
c0104c32:	c9                   	leave  
c0104c33:	c3                   	ret    

c0104c34 <read>:
c0104c34:	55                   	push   %ebp
c0104c35:	89 e5                	mov    %esp,%ebp
c0104c37:	83 ec 38             	sub    $0x38,%esp
c0104c3a:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104c41:	83 ec 0c             	sub    $0xc,%esp
c0104c44:	ff 75 dc             	pushl  -0x24(%ebp)
c0104c47:	e8 30 ca ff ff       	call   c010167c <sys_malloc>
c0104c4c:	83 c4 10             	add    $0x10,%esp
c0104c4f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104c52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104c55:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104c5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104c5d:	83 ec 0c             	sub    $0xc,%esp
c0104c60:	ff 75 0c             	pushl  0xc(%ebp)
c0104c63:	e8 a6 13 00 00       	call   c010600e <get_physical_address>
c0104c68:	83 c4 10             	add    $0x10,%esp
c0104c6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c71:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104c76:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104c79:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104c7c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104c81:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104c84:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104c8b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104c92:	8b 55 10             	mov    0x10(%ebp),%edx
c0104c95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c98:	01 d0                	add    %edx,%eax
c0104c9a:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104c9d:	0f 83 a8 00 00 00    	jae    c0104d4b <read+0x117>
c0104ca3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104ca6:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104ca9:	05 00 10 00 00       	add    $0x1000,%eax
c0104cae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104cb1:	8b 45 10             	mov    0x10(%ebp),%eax
c0104cb4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104cb7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104cba:	83 ec 04             	sub    $0x4,%esp
c0104cbd:	50                   	push   %eax
c0104cbe:	6a 00                	push   $0x0
c0104cc0:	ff 75 d8             	pushl  -0x28(%ebp)
c0104cc3:	e8 07 75 00 00       	call   c010c1cf <Memset>
c0104cc8:	83 c4 10             	add    $0x10,%esp
c0104ccb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cce:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104cd5:	8b 55 08             	mov    0x8(%ebp),%edx
c0104cd8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cdb:	89 50 50             	mov    %edx,0x50(%eax)
c0104cde:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ce1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ce4:	89 50 10             	mov    %edx,0x10(%eax)
c0104ce7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104ced:	89 50 60             	mov    %edx,0x60(%eax)
c0104cf0:	83 ec 04             	sub    $0x4,%esp
c0104cf3:	6a 02                	push   $0x2
c0104cf5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104cf8:	6a 03                	push   $0x3
c0104cfa:	e8 b6 48 00 00       	call   c01095b5 <send_rec>
c0104cff:	83 c4 10             	add    $0x10,%esp
c0104d02:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d05:	8b 40 60             	mov    0x60(%eax),%eax
c0104d08:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104d0b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104d0e:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104d11:	8b 45 10             	mov    0x10(%ebp),%eax
c0104d14:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104d17:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104d1a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104d1d:	89 45 10             	mov    %eax,0x10(%ebp)
c0104d20:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104d27:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104d2e:	83 ec 0c             	sub    $0xc,%esp
c0104d31:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d34:	e8 d5 12 00 00       	call   c010600e <get_physical_address>
c0104d39:	83 c4 10             	add    $0x10,%esp
c0104d3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104d3f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104d43:	0f 85 6e ff ff ff    	jne    c0104cb7 <read+0x83>
c0104d49:	eb 54                	jmp    c0104d9f <read+0x16b>
c0104d4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104d4e:	83 ec 04             	sub    $0x4,%esp
c0104d51:	50                   	push   %eax
c0104d52:	6a 00                	push   $0x0
c0104d54:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d57:	e8 73 74 00 00       	call   c010c1cf <Memset>
c0104d5c:	83 c4 10             	add    $0x10,%esp
c0104d5f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d62:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104d69:	8b 55 08             	mov    0x8(%ebp),%edx
c0104d6c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d6f:	89 50 50             	mov    %edx,0x50(%eax)
c0104d72:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d75:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104d78:	89 50 10             	mov    %edx,0x10(%eax)
c0104d7b:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d81:	89 50 60             	mov    %edx,0x60(%eax)
c0104d84:	83 ec 04             	sub    $0x4,%esp
c0104d87:	6a 02                	push   $0x2
c0104d89:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d8c:	6a 03                	push   $0x3
c0104d8e:	e8 22 48 00 00       	call   c01095b5 <send_rec>
c0104d93:	83 c4 10             	add    $0x10,%esp
c0104d96:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d99:	8b 40 60             	mov    0x60(%eax),%eax
c0104d9c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104d9f:	83 ec 08             	sub    $0x8,%esp
c0104da2:	ff 75 dc             	pushl  -0x24(%ebp)
c0104da5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104da8:	e8 e4 c8 ff ff       	call   c0101691 <sys_free>
c0104dad:	83 c4 10             	add    $0x10,%esp
c0104db0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104db3:	c9                   	leave  
c0104db4:	c3                   	ret    

c0104db5 <write>:
c0104db5:	55                   	push   %ebp
c0104db6:	89 e5                	mov    %esp,%ebp
c0104db8:	83 ec 18             	sub    $0x18,%esp
c0104dbb:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104dc2:	83 ec 0c             	sub    $0xc,%esp
c0104dc5:	ff 75 f4             	pushl  -0xc(%ebp)
c0104dc8:	e8 af c8 ff ff       	call   c010167c <sys_malloc>
c0104dcd:	83 c4 10             	add    $0x10,%esp
c0104dd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104dd3:	83 ec 0c             	sub    $0xc,%esp
c0104dd6:	ff 75 0c             	pushl  0xc(%ebp)
c0104dd9:	e8 30 12 00 00       	call   c010600e <get_physical_address>
c0104dde:	83 c4 10             	add    $0x10,%esp
c0104de1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104de4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104de7:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104dee:	8b 55 08             	mov    0x8(%ebp),%edx
c0104df1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104df4:	89 50 50             	mov    %edx,0x50(%eax)
c0104df7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dfa:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104dfd:	89 50 10             	mov    %edx,0x10(%eax)
c0104e00:	8b 55 10             	mov    0x10(%ebp),%edx
c0104e03:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e06:	89 50 60             	mov    %edx,0x60(%eax)
c0104e09:	83 ec 04             	sub    $0x4,%esp
c0104e0c:	6a 02                	push   $0x2
c0104e0e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104e11:	6a 03                	push   $0x3
c0104e13:	e8 9d 47 00 00       	call   c01095b5 <send_rec>
c0104e18:	83 c4 10             	add    $0x10,%esp
c0104e1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e1e:	8b 40 60             	mov    0x60(%eax),%eax
c0104e21:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104e24:	83 ec 08             	sub    $0x8,%esp
c0104e27:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e2a:	ff 75 f0             	pushl  -0x10(%ebp)
c0104e2d:	e8 5f c8 ff ff       	call   c0101691 <sys_free>
c0104e32:	83 c4 10             	add    $0x10,%esp
c0104e35:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104e38:	c9                   	leave  
c0104e39:	c3                   	ret    

c0104e3a <close>:
c0104e3a:	55                   	push   %ebp
c0104e3b:	89 e5                	mov    %esp,%ebp
c0104e3d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e43:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104e4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e4d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104e50:	83 ec 04             	sub    $0x4,%esp
c0104e53:	6a 02                	push   $0x2
c0104e55:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e5b:	50                   	push   %eax
c0104e5c:	6a 03                	push   $0x3
c0104e5e:	e8 52 47 00 00       	call   c01095b5 <send_rec>
c0104e63:	83 c4 10             	add    $0x10,%esp
c0104e66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e69:	83 f8 65             	cmp    $0x65,%eax
c0104e6c:	74 19                	je     c0104e87 <close+0x4d>
c0104e6e:	6a 13                	push   $0x13
c0104e70:	68 27 b5 10 c0       	push   $0xc010b527
c0104e75:	68 27 b5 10 c0       	push   $0xc010b527
c0104e7a:	68 33 b5 10 c0       	push   $0xc010b533
c0104e7f:	e8 c1 3a 00 00       	call   c0108945 <assertion_failure>
c0104e84:	83 c4 10             	add    $0x10,%esp
c0104e87:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104e8a:	c9                   	leave  
c0104e8b:	c3                   	ret    

c0104e8c <wait>:
c0104e8c:	55                   	push   %ebp
c0104e8d:	89 e5                	mov    %esp,%ebp
c0104e8f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e95:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104e9c:	83 ec 04             	sub    $0x4,%esp
c0104e9f:	6a 01                	push   $0x1
c0104ea1:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ea7:	50                   	push   %eax
c0104ea8:	6a 03                	push   $0x3
c0104eaa:	e8 06 47 00 00       	call   c01095b5 <send_rec>
c0104eaf:	83 c4 10             	add    $0x10,%esp
c0104eb2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104eb5:	89 c2                	mov    %eax,%edx
c0104eb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0104eba:	89 10                	mov    %edx,(%eax)
c0104ebc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ebf:	83 f8 21             	cmp    $0x21,%eax
c0104ec2:	74 05                	je     c0104ec9 <wait+0x3d>
c0104ec4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ec7:	eb 05                	jmp    c0104ece <wait+0x42>
c0104ec9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104ece:	c9                   	leave  
c0104ecf:	c3                   	ret    

c0104ed0 <exit>:
c0104ed0:	55                   	push   %ebp
c0104ed1:	89 e5                	mov    %esp,%ebp
c0104ed3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ed9:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104ee0:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ee3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104ee6:	83 ec 04             	sub    $0x4,%esp
c0104ee9:	6a 01                	push   $0x1
c0104eeb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ef1:	50                   	push   %eax
c0104ef2:	6a 03                	push   $0x3
c0104ef4:	e8 bc 46 00 00       	call   c01095b5 <send_rec>
c0104ef9:	83 c4 10             	add    $0x10,%esp
c0104efc:	90                   	nop
c0104efd:	c9                   	leave  
c0104efe:	c3                   	ret    

c0104eff <fork>:
c0104eff:	55                   	push   %ebp
c0104f00:	89 e5                	mov    %esp,%ebp
c0104f02:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f08:	83 ec 04             	sub    $0x4,%esp
c0104f0b:	6a 7c                	push   $0x7c
c0104f0d:	6a 00                	push   $0x0
c0104f0f:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f15:	50                   	push   %eax
c0104f16:	e8 b4 72 00 00       	call   c010c1cf <Memset>
c0104f1b:	83 c4 10             	add    $0x10,%esp
c0104f1e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104f25:	83 ec 04             	sub    $0x4,%esp
c0104f28:	6a 01                	push   $0x1
c0104f2a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f30:	50                   	push   %eax
c0104f31:	6a 03                	push   $0x3
c0104f33:	e8 7d 46 00 00       	call   c01095b5 <send_rec>
c0104f38:	83 c4 10             	add    $0x10,%esp
c0104f3b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104f42:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f45:	c9                   	leave  
c0104f46:	c3                   	ret    

c0104f47 <getpid>:
c0104f47:	55                   	push   %ebp
c0104f48:	89 e5                	mov    %esp,%ebp
c0104f4a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f50:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104f57:	83 ec 04             	sub    $0x4,%esp
c0104f5a:	6a 05                	push   $0x5
c0104f5c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f62:	50                   	push   %eax
c0104f63:	6a 03                	push   $0x3
c0104f65:	e8 4b 46 00 00       	call   c01095b5 <send_rec>
c0104f6a:	83 c4 10             	add    $0x10,%esp
c0104f6d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f70:	c9                   	leave  
c0104f71:	c3                   	ret    

c0104f72 <exec>:
c0104f72:	55                   	push   %ebp
c0104f73:	89 e5                	mov    %esp,%ebp
c0104f75:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f7b:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104f82:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f85:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104f88:	83 ec 0c             	sub    $0xc,%esp
c0104f8b:	ff 75 08             	pushl  0x8(%ebp)
c0104f8e:	e8 75 72 00 00       	call   c010c208 <Strlen>
c0104f93:	83 c4 10             	add    $0x10,%esp
c0104f96:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104f99:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104fa0:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104fa7:	83 ec 04             	sub    $0x4,%esp
c0104faa:	6a 01                	push   $0x1
c0104fac:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104fb2:	50                   	push   %eax
c0104fb3:	6a 03                	push   $0x3
c0104fb5:	e8 fb 45 00 00       	call   c01095b5 <send_rec>
c0104fba:	83 c4 10             	add    $0x10,%esp
c0104fbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104fc0:	83 f8 65             	cmp    $0x65,%eax
c0104fc3:	74 19                	je     c0104fde <exec+0x6c>
c0104fc5:	6a 19                	push   $0x19
c0104fc7:	68 4b b5 10 c0       	push   $0xc010b54b
c0104fcc:	68 4b b5 10 c0       	push   $0xc010b54b
c0104fd1:	68 56 b5 10 c0       	push   $0xc010b556
c0104fd6:	e8 6a 39 00 00       	call   c0108945 <assertion_failure>
c0104fdb:	83 c4 10             	add    $0x10,%esp
c0104fde:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104fe1:	c9                   	leave  
c0104fe2:	c3                   	ret    

c0104fe3 <execv>:
c0104fe3:	55                   	push   %ebp
c0104fe4:	89 e5                	mov    %esp,%ebp
c0104fe6:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104fec:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104ff3:	83 ec 0c             	sub    $0xc,%esp
c0104ff6:	ff 75 e0             	pushl  -0x20(%ebp)
c0104ff9:	e8 7e c6 ff ff       	call   c010167c <sys_malloc>
c0104ffe:	83 c4 10             	add    $0x10,%esp
c0105001:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105004:	66 87 db             	xchg   %bx,%bx
c0105007:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010500a:	83 ec 04             	sub    $0x4,%esp
c010500d:	50                   	push   %eax
c010500e:	6a 00                	push   $0x0
c0105010:	ff 75 dc             	pushl  -0x24(%ebp)
c0105013:	e8 b7 71 00 00       	call   c010c1cf <Memset>
c0105018:	83 c4 10             	add    $0x10,%esp
c010501b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010501e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105021:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105028:	eb 23                	jmp    c010504d <execv+0x6a>
c010502a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010502d:	8b 00                	mov    (%eax),%eax
c010502f:	83 ec 08             	sub    $0x8,%esp
c0105032:	50                   	push   %eax
c0105033:	68 6e b5 10 c0       	push   $0xc010b56e
c0105038:	e8 ab 35 00 00       	call   c01085e8 <Printf>
c010503d:	83 c4 10             	add    $0x10,%esp
c0105040:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0105044:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105047:	83 c0 04             	add    $0x4,%eax
c010504a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010504d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105050:	8b 00                	mov    (%eax),%eax
c0105052:	85 c0                	test   %eax,%eax
c0105054:	75 d4                	jne    c010502a <execv+0x47>
c0105056:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105059:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010505c:	01 d0                	add    %edx,%eax
c010505e:	c6 00 00             	movb   $0x0,(%eax)
c0105061:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105064:	83 c0 04             	add    $0x4,%eax
c0105067:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010506a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010506d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105070:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105073:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105076:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010507d:	eb 5b                	jmp    c01050da <execv+0xf7>
c010507f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105082:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105085:	01 c2                	add    %eax,%edx
c0105087:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010508a:	89 10                	mov    %edx,(%eax)
c010508c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010508f:	8b 00                	mov    (%eax),%eax
c0105091:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0105094:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0105097:	01 ca                	add    %ecx,%edx
c0105099:	83 ec 08             	sub    $0x8,%esp
c010509c:	50                   	push   %eax
c010509d:	52                   	push   %edx
c010509e:	e8 4b 71 00 00       	call   c010c1ee <Strcpy>
c01050a3:	83 c4 10             	add    $0x10,%esp
c01050a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01050a9:	8b 00                	mov    (%eax),%eax
c01050ab:	83 ec 0c             	sub    $0xc,%esp
c01050ae:	50                   	push   %eax
c01050af:	e8 54 71 00 00       	call   c010c208 <Strlen>
c01050b4:	83 c4 10             	add    $0x10,%esp
c01050b7:	01 45 f0             	add    %eax,-0x10(%ebp)
c01050ba:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01050bd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050c0:	01 d0                	add    %edx,%eax
c01050c2:	c6 00 00             	movb   $0x0,(%eax)
c01050c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050c8:	83 c0 01             	add    $0x1,%eax
c01050cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050ce:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c01050d2:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c01050d6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01050da:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01050dd:	8b 00                	mov    (%eax),%eax
c01050df:	85 c0                	test   %eax,%eax
c01050e1:	75 9c                	jne    c010507f <execv+0x9c>
c01050e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050e6:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c01050eb:	29 c2                	sub    %eax,%edx
c01050ed:	89 d0                	mov    %edx,%eax
c01050ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01050f2:	83 ec 0c             	sub    $0xc,%esp
c01050f5:	ff 75 08             	pushl  0x8(%ebp)
c01050f8:	e8 11 0f 00 00       	call   c010600e <get_physical_address>
c01050fd:	83 c4 10             	add    $0x10,%esp
c0105100:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105103:	83 ec 0c             	sub    $0xc,%esp
c0105106:	ff 75 dc             	pushl  -0x24(%ebp)
c0105109:	e8 00 0f 00 00       	call   c010600e <get_physical_address>
c010510e:	83 c4 10             	add    $0x10,%esp
c0105111:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105114:	83 ec 0c             	sub    $0xc,%esp
c0105117:	ff 75 d8             	pushl  -0x28(%ebp)
c010511a:	e8 ef 0e 00 00       	call   c010600e <get_physical_address>
c010511f:	83 c4 10             	add    $0x10,%esp
c0105122:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105125:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c010512c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010512f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105132:	83 ec 0c             	sub    $0xc,%esp
c0105135:	ff 75 08             	pushl  0x8(%ebp)
c0105138:	e8 cb 70 00 00       	call   c010c208 <Strlen>
c010513d:	83 c4 10             	add    $0x10,%esp
c0105140:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105143:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105146:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010514c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010514f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105155:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105158:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010515e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105161:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105167:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010516a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105170:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105173:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105176:	29 c2                	sub    %eax,%edx
c0105178:	89 d0                	mov    %edx,%eax
c010517a:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0105180:	83 ec 04             	sub    $0x4,%esp
c0105183:	6a 01                	push   $0x1
c0105185:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c010518b:	50                   	push   %eax
c010518c:	6a 03                	push   $0x3
c010518e:	e8 22 44 00 00       	call   c01095b5 <send_rec>
c0105193:	83 c4 10             	add    $0x10,%esp
c0105196:	83 ec 08             	sub    $0x8,%esp
c0105199:	68 00 04 00 00       	push   $0x400
c010519e:	ff 75 dc             	pushl  -0x24(%ebp)
c01051a1:	e8 eb c4 ff ff       	call   c0101691 <sys_free>
c01051a6:	83 c4 10             	add    $0x10,%esp
c01051a9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01051ac:	83 f8 65             	cmp    $0x65,%eax
c01051af:	74 1c                	je     c01051cd <execv+0x1ea>
c01051b1:	68 95 00 00 00       	push   $0x95
c01051b6:	68 4b b5 10 c0       	push   $0xc010b54b
c01051bb:	68 4b b5 10 c0       	push   $0xc010b54b
c01051c0:	68 56 b5 10 c0       	push   $0xc010b556
c01051c5:	e8 7b 37 00 00       	call   c0108945 <assertion_failure>
c01051ca:	83 c4 10             	add    $0x10,%esp
c01051cd:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01051d0:	c9                   	leave  
c01051d1:	c3                   	ret    

c01051d2 <execl>:
c01051d2:	55                   	push   %ebp
c01051d3:	89 e5                	mov    %esp,%ebp
c01051d5:	83 ec 18             	sub    $0x18,%esp
c01051d8:	8d 45 0c             	lea    0xc(%ebp),%eax
c01051db:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01051de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01051e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01051e4:	83 ec 08             	sub    $0x8,%esp
c01051e7:	ff 75 f0             	pushl  -0x10(%ebp)
c01051ea:	ff 75 08             	pushl  0x8(%ebp)
c01051ed:	e8 f1 fd ff ff       	call   c0104fe3 <execv>
c01051f2:	83 c4 10             	add    $0x10,%esp
c01051f5:	c9                   	leave  
c01051f6:	c3                   	ret    

c01051f7 <TaskMM>:
c01051f7:	55                   	push   %ebp
c01051f8:	89 e5                	mov    %esp,%ebp
c01051fa:	83 ec 28             	sub    $0x28,%esp
c01051fd:	83 ec 0c             	sub    $0xc,%esp
c0105200:	6a 7c                	push   $0x7c
c0105202:	e8 75 c4 ff ff       	call   c010167c <sys_malloc>
c0105207:	83 c4 10             	add    $0x10,%esp
c010520a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010520d:	83 ec 0c             	sub    $0xc,%esp
c0105210:	6a 7c                	push   $0x7c
c0105212:	e8 65 c4 ff ff       	call   c010167c <sys_malloc>
c0105217:	83 c4 10             	add    $0x10,%esp
c010521a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010521d:	83 ec 04             	sub    $0x4,%esp
c0105220:	6a 12                	push   $0x12
c0105222:	ff 75 f0             	pushl  -0x10(%ebp)
c0105225:	6a 02                	push   $0x2
c0105227:	e8 89 43 00 00       	call   c01095b5 <send_rec>
c010522c:	83 c4 10             	add    $0x10,%esp
c010522f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105232:	8b 40 78             	mov    0x78(%eax),%eax
c0105235:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105238:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010523b:	8b 00                	mov    (%eax),%eax
c010523d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105240:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105247:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010524a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0105251:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105254:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c010525b:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c010525f:	74 4e                	je     c01052af <TaskMM+0xb8>
c0105261:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105265:	7f 08                	jg     c010526f <TaskMM+0x78>
c0105267:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c010526b:	74 28                	je     c0105295 <TaskMM+0x9e>
c010526d:	eb 71                	jmp    c01052e0 <TaskMM+0xe9>
c010526f:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0105273:	74 08                	je     c010527d <TaskMM+0x86>
c0105275:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0105279:	74 4e                	je     c01052c9 <TaskMM+0xd2>
c010527b:	eb 63                	jmp    c01052e0 <TaskMM+0xe9>
c010527d:	83 ec 0c             	sub    $0xc,%esp
c0105280:	ff 75 f0             	pushl  -0x10(%ebp)
c0105283:	e8 d0 04 00 00       	call   c0105758 <do_fork>
c0105288:	83 c4 10             	add    $0x10,%esp
c010528b:	89 c2                	mov    %eax,%edx
c010528d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105290:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105293:	eb 5c                	jmp    c01052f1 <TaskMM+0xfa>
c0105295:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010529c:	66 87 db             	xchg   %bx,%bx
c010529f:	83 ec 0c             	sub    $0xc,%esp
c01052a2:	ff 75 f0             	pushl  -0x10(%ebp)
c01052a5:	e8 95 00 00 00       	call   c010533f <do_exec>
c01052aa:	83 c4 10             	add    $0x10,%esp
c01052ad:	eb 42                	jmp    c01052f1 <TaskMM+0xfa>
c01052af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01052b6:	83 ec 08             	sub    $0x8,%esp
c01052b9:	ff 75 e0             	pushl  -0x20(%ebp)
c01052bc:	ff 75 f0             	pushl  -0x10(%ebp)
c01052bf:	e8 02 05 00 00       	call   c01057c6 <do_exit>
c01052c4:	83 c4 10             	add    $0x10,%esp
c01052c7:	eb 28                	jmp    c01052f1 <TaskMM+0xfa>
c01052c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01052d0:	83 ec 0c             	sub    $0xc,%esp
c01052d3:	ff 75 f0             	pushl  -0x10(%ebp)
c01052d6:	e8 75 05 00 00       	call   c0105850 <do_wait>
c01052db:	83 c4 10             	add    $0x10,%esp
c01052de:	eb 11                	jmp    c01052f1 <TaskMM+0xfa>
c01052e0:	83 ec 0c             	sub    $0xc,%esp
c01052e3:	68 78 b5 10 c0       	push   $0xc010b578
c01052e8:	e8 3a 36 00 00       	call   c0108927 <panic>
c01052ed:	83 c4 10             	add    $0x10,%esp
c01052f0:	90                   	nop
c01052f1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01052f5:	0f 84 22 ff ff ff    	je     c010521d <TaskMM+0x26>
c01052fb:	83 ec 0c             	sub    $0xc,%esp
c01052fe:	6a 03                	push   $0x3
c0105300:	e8 af 31 00 00       	call   c01084b4 <delay>
c0105305:	83 c4 10             	add    $0x10,%esp
c0105308:	83 ec 04             	sub    $0x4,%esp
c010530b:	ff 75 e4             	pushl  -0x1c(%ebp)
c010530e:	ff 75 ec             	pushl  -0x14(%ebp)
c0105311:	6a 01                	push   $0x1
c0105313:	e8 9d 42 00 00       	call   c01095b5 <send_rec>
c0105318:	83 c4 10             	add    $0x10,%esp
c010531b:	e9 fd fe ff ff       	jmp    c010521d <TaskMM+0x26>

c0105320 <alloc_mem>:
c0105320:	55                   	push   %ebp
c0105321:	89 e5                	mov    %esp,%ebp
c0105323:	83 ec 10             	sub    $0x10,%esp
c0105326:	8b 45 08             	mov    0x8(%ebp),%eax
c0105329:	83 e8 08             	sub    $0x8,%eax
c010532c:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0105332:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105337:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010533a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010533d:	c9                   	leave  
c010533e:	c3                   	ret    

c010533f <do_exec>:
c010533f:	55                   	push   %ebp
c0105340:	89 e5                	mov    %esp,%ebp
c0105342:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105348:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010534f:	65 76 5f 
c0105352:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c0105359:	74 79 31 
c010535c:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105363:	00 00 
c0105365:	83 ec 08             	sub    $0x8,%esp
c0105368:	6a 00                	push   $0x0
c010536a:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c0105370:	50                   	push   %eax
c0105371:	e8 29 f8 ff ff       	call   c0104b9f <open>
c0105376:	83 c4 10             	add    $0x10,%esp
c0105379:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010537c:	8b 45 08             	mov    0x8(%ebp),%eax
c010537f:	8b 00                	mov    (%eax),%eax
c0105381:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105384:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c010538b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010538e:	83 ec 0c             	sub    $0xc,%esp
c0105391:	50                   	push   %eax
c0105392:	e8 e5 c2 ff ff       	call   c010167c <sys_malloc>
c0105397:	83 c4 10             	add    $0x10,%esp
c010539a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010539d:	83 ec 04             	sub    $0x4,%esp
c01053a0:	ff 75 d0             	pushl  -0x30(%ebp)
c01053a3:	6a 00                	push   $0x0
c01053a5:	ff 75 cc             	pushl  -0x34(%ebp)
c01053a8:	e8 22 6e 00 00       	call   c010c1cf <Memset>
c01053ad:	83 c4 10             	add    $0x10,%esp
c01053b0:	83 ec 04             	sub    $0x4,%esp
c01053b3:	6a 0c                	push   $0xc
c01053b5:	6a 00                	push   $0x0
c01053b7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01053bd:	50                   	push   %eax
c01053be:	e8 0c 6e 00 00       	call   c010c1cf <Memset>
c01053c3:	83 c4 10             	add    $0x10,%esp
c01053c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01053c9:	8b 40 44             	mov    0x44(%eax),%eax
c01053cc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01053cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01053d2:	8b 40 40             	mov    0x40(%eax),%eax
c01053d5:	83 ec 08             	sub    $0x8,%esp
c01053d8:	50                   	push   %eax
c01053d9:	ff 75 c8             	pushl  -0x38(%ebp)
c01053dc:	e8 de 0a 00 00       	call   c0105ebf <alloc_virtual_memory>
c01053e1:	83 c4 10             	add    $0x10,%esp
c01053e4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01053e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01053ea:	8b 40 40             	mov    0x40(%eax),%eax
c01053ed:	89 c2                	mov    %eax,%edx
c01053ef:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01053f2:	83 ec 04             	sub    $0x4,%esp
c01053f5:	52                   	push   %edx
c01053f6:	50                   	push   %eax
c01053f7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01053fd:	50                   	push   %eax
c01053fe:	e8 29 19 00 00       	call   c0106d2c <Memcpy>
c0105403:	83 c4 10             	add    $0x10,%esp
c0105406:	8b 45 08             	mov    0x8(%ebp),%eax
c0105409:	8b 40 40             	mov    0x40(%eax),%eax
c010540c:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105413:	00 
c0105414:	83 ec 08             	sub    $0x8,%esp
c0105417:	6a 00                	push   $0x0
c0105419:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010541f:	50                   	push   %eax
c0105420:	e8 7a f7 ff ff       	call   c0104b9f <open>
c0105425:	83 c4 10             	add    $0x10,%esp
c0105428:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010542b:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010542f:	75 15                	jne    c0105446 <do_exec+0x107>
c0105431:	83 ec 0c             	sub    $0xc,%esp
c0105434:	68 89 b5 10 c0       	push   $0xc010b589
c0105439:	e8 aa 31 00 00       	call   c01085e8 <Printf>
c010543e:	83 c4 10             	add    $0x10,%esp
c0105441:	e9 10 03 00 00       	jmp    c0105756 <do_exec+0x417>
c0105446:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010544d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105450:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105453:	01 d0                	add    %edx,%eax
c0105455:	83 ec 04             	sub    $0x4,%esp
c0105458:	68 00 10 00 00       	push   $0x1000
c010545d:	50                   	push   %eax
c010545e:	ff 75 c0             	pushl  -0x40(%ebp)
c0105461:	e8 ce f7 ff ff       	call   c0104c34 <read>
c0105466:	83 c4 10             	add    $0x10,%esp
c0105469:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010546c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010546f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0105472:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0105476:	74 0a                	je     c0105482 <do_exec+0x143>
c0105478:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010547b:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c010547e:	7d 05                	jge    c0105485 <do_exec+0x146>
c0105480:	eb cb                	jmp    c010544d <do_exec+0x10e>
c0105482:	90                   	nop
c0105483:	eb 01                	jmp    c0105486 <do_exec+0x147>
c0105485:	90                   	nop
c0105486:	83 ec 0c             	sub    $0xc,%esp
c0105489:	ff 75 c0             	pushl  -0x40(%ebp)
c010548c:	e8 a9 f9 ff ff       	call   c0104e3a <close>
c0105491:	83 c4 10             	add    $0x10,%esp
c0105494:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105497:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010549a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010549d:	8b 40 18             	mov    0x18(%eax),%eax
c01054a0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01054a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01054aa:	e9 04 01 00 00       	jmp    c01055b3 <do_exec+0x274>
c01054af:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01054b2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c01054b6:	0f b7 d0             	movzwl %ax,%edx
c01054b9:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01054bc:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c01054c0:	0f b7 c0             	movzwl %ax,%eax
c01054c3:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c01054c7:	01 c2                	add    %eax,%edx
c01054c9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01054cc:	01 d0                	add    %edx,%eax
c01054ce:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01054d1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054d4:	8b 40 10             	mov    0x10(%eax),%eax
c01054d7:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01054da:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01054dd:	05 ff 0f 00 00       	add    $0xfff,%eax
c01054e2:	c1 e8 0c             	shr    $0xc,%eax
c01054e5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01054e8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054eb:	8b 40 08             	mov    0x8(%eax),%eax
c01054ee:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01054f1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01054f8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01054fb:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c01054fe:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0105501:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105504:	8b 50 04             	mov    0x4(%eax),%edx
c0105507:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010550a:	01 d0                	add    %edx,%eax
c010550c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010550f:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105513:	0f 84 95 00 00 00    	je     c01055ae <do_exec+0x26f>
c0105519:	83 ec 04             	sub    $0x4,%esp
c010551c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010551f:	ff 75 a8             	pushl  -0x58(%ebp)
c0105522:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105525:	e8 a0 07 00 00       	call   c0105cca <get_virtual_address_start_with_addr>
c010552a:	83 c4 10             	add    $0x10,%esp
c010552d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105530:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105533:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105536:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010553d:	eb 41                	jmp    c0105580 <do_exec+0x241>
c010553f:	83 ec 08             	sub    $0x8,%esp
c0105542:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105545:	ff 75 e8             	pushl  -0x18(%ebp)
c0105548:	e8 f3 0a 00 00       	call   c0106040 <alloc_physical_memory_of_proc>
c010554d:	83 c4 10             	add    $0x10,%esp
c0105550:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105553:	83 ec 08             	sub    $0x8,%esp
c0105556:	68 00 10 00 00       	push   $0x1000
c010555b:	ff 75 94             	pushl  -0x6c(%ebp)
c010555e:	e8 5c 09 00 00       	call   c0105ebf <alloc_virtual_memory>
c0105563:	83 c4 10             	add    $0x10,%esp
c0105566:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105569:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010556d:	75 06                	jne    c0105575 <do_exec+0x236>
c010556f:	8b 45 90             	mov    -0x70(%ebp),%eax
c0105572:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105575:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c010557c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0105580:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105583:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105586:	77 b7                	ja     c010553f <do_exec+0x200>
c0105588:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010558b:	8b 40 10             	mov    0x10(%eax),%eax
c010558e:	89 c1                	mov    %eax,%ecx
c0105590:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105593:	8b 50 04             	mov    0x4(%eax),%edx
c0105596:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105599:	01 c2                	add    %eax,%edx
c010559b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010559e:	83 ec 04             	sub    $0x4,%esp
c01055a1:	51                   	push   %ecx
c01055a2:	52                   	push   %edx
c01055a3:	50                   	push   %eax
c01055a4:	e8 83 17 00 00       	call   c0106d2c <Memcpy>
c01055a9:	83 c4 10             	add    $0x10,%esp
c01055ac:	eb 01                	jmp    c01055af <do_exec+0x270>
c01055ae:	90                   	nop
c01055af:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01055b3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01055b6:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01055ba:	0f b7 c0             	movzwl %ax,%eax
c01055bd:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01055c0:	0f 8c e9 fe ff ff    	jl     c01054af <do_exec+0x170>
c01055c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01055c9:	8b 40 10             	mov    0x10(%eax),%eax
c01055cc:	89 45 8c             	mov    %eax,-0x74(%ebp)
c01055cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01055d2:	8b 40 1c             	mov    0x1c(%eax),%eax
c01055d5:	89 45 88             	mov    %eax,-0x78(%ebp)
c01055d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01055db:	8b 40 24             	mov    0x24(%eax),%eax
c01055de:	89 45 84             	mov    %eax,-0x7c(%ebp)
c01055e1:	83 ec 0c             	sub    $0xc,%esp
c01055e4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055e7:	e8 8a e2 ff ff       	call   c0103876 <pid2proc>
c01055ec:	83 c4 10             	add    $0x10,%esp
c01055ef:	89 45 80             	mov    %eax,-0x80(%ebp)
c01055f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01055f5:	8b 40 10             	mov    0x10(%eax),%eax
c01055f8:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01055fe:	83 ec 08             	sub    $0x8,%esp
c0105601:	ff 75 88             	pushl  -0x78(%ebp)
c0105604:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c010560a:	e8 b0 08 00 00       	call   c0105ebf <alloc_virtual_memory>
c010560f:	83 c4 10             	add    $0x10,%esp
c0105612:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105618:	8b 45 08             	mov    0x8(%ebp),%eax
c010561b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010561e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105624:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010562b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0105631:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105634:	eb 1a                	jmp    c0105650 <do_exec+0x311>
c0105636:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010563a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010563d:	8b 10                	mov    (%eax),%edx
c010563f:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105645:	01 c2                	add    %eax,%edx
c0105647:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010564a:	89 10                	mov    %edx,(%eax)
c010564c:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0105650:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105653:	8b 00                	mov    (%eax),%eax
c0105655:	85 c0                	test   %eax,%eax
c0105657:	75 dd                	jne    c0105636 <do_exec+0x2f7>
c0105659:	83 ec 0c             	sub    $0xc,%esp
c010565c:	ff 75 84             	pushl  -0x7c(%ebp)
c010565f:	e8 5b 08 00 00       	call   c0105ebf <alloc_virtual_memory>
c0105664:	83 c4 10             	add    $0x10,%esp
c0105667:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010566d:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c0105673:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0105679:	83 ec 04             	sub    $0x4,%esp
c010567c:	ff 75 88             	pushl  -0x78(%ebp)
c010567f:	52                   	push   %edx
c0105680:	50                   	push   %eax
c0105681:	e8 a6 16 00 00       	call   c0106d2c <Memcpy>
c0105686:	83 c4 10             	add    $0x10,%esp
c0105689:	8b 45 08             	mov    0x8(%ebp),%eax
c010568c:	8b 40 28             	mov    0x28(%eax),%eax
c010568f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105695:	83 ec 08             	sub    $0x8,%esp
c0105698:	ff 75 d4             	pushl  -0x2c(%ebp)
c010569b:	ff 75 80             	pushl  -0x80(%ebp)
c010569e:	e8 ef 08 00 00       	call   c0105f92 <get_physical_address_proc>
c01056a3:	83 c4 10             	add    $0x10,%esp
c01056a6:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c01056ac:	83 ec 08             	sub    $0x8,%esp
c01056af:	68 00 10 00 00       	push   $0x1000
c01056b4:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c01056ba:	e8 00 08 00 00       	call   c0105ebf <alloc_virtual_memory>
c01056bf:	83 c4 10             	add    $0x10,%esp
c01056c2:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c01056c8:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c01056ce:	05 bc 0f 00 00       	add    $0xfbc,%eax
c01056d3:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01056d9:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056df:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01056e5:	89 50 20             	mov    %edx,0x20(%eax)
c01056e8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01056eb:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056f1:	89 50 28             	mov    %edx,0x28(%eax)
c01056f4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056f7:	8b 40 18             	mov    0x18(%eax),%eax
c01056fa:	89 c2                	mov    %eax,%edx
c01056fc:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105702:	89 50 30             	mov    %edx,0x30(%eax)
c0105705:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010570b:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105711:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105714:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105717:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010571e:	00 00 00 
c0105721:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105728:	00 00 00 
c010572b:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0105732:	00 00 00 
c0105735:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c010573c:	00 00 00 
c010573f:	83 ec 04             	sub    $0x4,%esp
c0105742:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105745:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c010574b:	50                   	push   %eax
c010574c:	6a 01                	push   $0x1
c010574e:	e8 62 3e 00 00       	call   c01095b5 <send_rec>
c0105753:	83 c4 10             	add    $0x10,%esp
c0105756:	c9                   	leave  
c0105757:	c3                   	ret    

c0105758 <do_fork>:
c0105758:	55                   	push   %ebp
c0105759:	89 e5                	mov    %esp,%ebp
c010575b:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0105761:	8b 45 08             	mov    0x8(%ebp),%eax
c0105764:	8b 00                	mov    (%eax),%eax
c0105766:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105769:	83 ec 0c             	sub    $0xc,%esp
c010576c:	ff 75 f4             	pushl  -0xc(%ebp)
c010576f:	e8 3c 47 00 00       	call   c0109eb0 <fork_process>
c0105774:	83 c4 10             	add    $0x10,%esp
c0105777:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010577a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010577d:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105783:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105786:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105789:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010578f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105792:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105795:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c010579c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01057a3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01057aa:	83 ec 04             	sub    $0x4,%esp
c01057ad:	ff 75 ec             	pushl  -0x14(%ebp)
c01057b0:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c01057b6:	50                   	push   %eax
c01057b7:	6a 01                	push   $0x1
c01057b9:	e8 f7 3d 00 00       	call   c01095b5 <send_rec>
c01057be:	83 c4 10             	add    $0x10,%esp
c01057c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01057c4:	c9                   	leave  
c01057c5:	c3                   	ret    

c01057c6 <do_exit>:
c01057c6:	55                   	push   %ebp
c01057c7:	89 e5                	mov    %esp,%ebp
c01057c9:	83 ec 18             	sub    $0x18,%esp
c01057cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01057cf:	8b 00                	mov    (%eax),%eax
c01057d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01057d4:	83 ec 0c             	sub    $0xc,%esp
c01057d7:	ff 75 f4             	pushl  -0xc(%ebp)
c01057da:	e8 97 e0 ff ff       	call   c0103876 <pid2proc>
c01057df:	83 c4 10             	add    $0x10,%esp
c01057e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057e8:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01057ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01057f1:	83 ec 0c             	sub    $0xc,%esp
c01057f4:	ff 75 ec             	pushl  -0x14(%ebp)
c01057f7:	e8 7a e0 ff ff       	call   c0103876 <pid2proc>
c01057fc:	83 c4 10             	add    $0x10,%esp
c01057ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105802:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105806:	74 45                	je     c010584d <do_exit+0x87>
c0105808:	8b 45 08             	mov    0x8(%ebp),%eax
c010580b:	8b 40 54             	mov    0x54(%eax),%eax
c010580e:	89 c2                	mov    %eax,%edx
c0105810:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105813:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105819:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010581c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105823:	3c 04                	cmp    $0x4,%al
c0105825:	75 1a                	jne    c0105841 <do_exit+0x7b>
c0105827:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010582a:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105831:	83 ec 0c             	sub    $0xc,%esp
c0105834:	ff 75 f0             	pushl  -0x10(%ebp)
c0105837:	e8 33 01 00 00       	call   c010596f <cleanup>
c010583c:	83 c4 10             	add    $0x10,%esp
c010583f:	eb 0d                	jmp    c010584e <do_exit+0x88>
c0105841:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105844:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c010584b:	eb 01                	jmp    c010584e <do_exit+0x88>
c010584d:	90                   	nop
c010584e:	c9                   	leave  
c010584f:	c3                   	ret    

c0105850 <do_wait>:
c0105850:	55                   	push   %ebp
c0105851:	89 e5                	mov    %esp,%ebp
c0105853:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0105859:	8b 45 08             	mov    0x8(%ebp),%eax
c010585c:	8b 00                	mov    (%eax),%eax
c010585e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105861:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105868:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010586f:	83 ec 0c             	sub    $0xc,%esp
c0105872:	ff 75 ec             	pushl  -0x14(%ebp)
c0105875:	e8 fc df ff ff       	call   c0103876 <pid2proc>
c010587a:	83 c4 10             	add    $0x10,%esp
c010587d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105880:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105884:	75 19                	jne    c010589f <do_wait+0x4f>
c0105886:	6a 58                	push   $0x58
c0105888:	68 99 b5 10 c0       	push   $0xc010b599
c010588d:	68 99 b5 10 c0       	push   $0xc010b599
c0105892:	68 a7 b5 10 c0       	push   $0xc010b5a7
c0105897:	e8 a9 30 00 00       	call   c0108945 <assertion_failure>
c010589c:	83 c4 10             	add    $0x10,%esp
c010589f:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c01058a4:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c01058aa:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01058ad:	89 55 e0             	mov    %edx,-0x20(%ebp)
c01058b0:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c01058b5:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c01058bb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01058be:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01058c1:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c01058c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058c9:	eb 5b                	jmp    c0105926 <do_wait+0xd6>
c01058cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058ce:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01058d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01058d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01058d9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01058df:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01058e2:	74 0b                	je     c01058ef <do_wait+0x9f>
c01058e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058e7:	8b 40 04             	mov    0x4(%eax),%eax
c01058ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058ed:	eb 37                	jmp    c0105926 <do_wait+0xd6>
c01058ef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01058f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01058f6:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01058fd:	3c 03                	cmp    $0x3,%al
c01058ff:	74 0b                	je     c010590c <do_wait+0xbc>
c0105901:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105904:	8b 40 04             	mov    0x4(%eax),%eax
c0105907:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010590a:	eb 1a                	jmp    c0105926 <do_wait+0xd6>
c010590c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010590f:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105916:	83 ec 0c             	sub    $0xc,%esp
c0105919:	ff 75 e8             	pushl  -0x18(%ebp)
c010591c:	e8 4e 00 00 00       	call   c010596f <cleanup>
c0105921:	83 c4 10             	add    $0x10,%esp
c0105924:	eb 47                	jmp    c010596d <do_wait+0x11d>
c0105926:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c010592d:	75 9c                	jne    c01058cb <do_wait+0x7b>
c010592f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105933:	74 0c                	je     c0105941 <do_wait+0xf1>
c0105935:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105938:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c010593f:	eb 2c                	jmp    c010596d <do_wait+0x11d>
c0105941:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105948:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010594f:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105956:	83 ec 04             	sub    $0x4,%esp
c0105959:	ff 75 ec             	pushl  -0x14(%ebp)
c010595c:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c0105962:	50                   	push   %eax
c0105963:	6a 01                	push   $0x1
c0105965:	e8 4b 3c 00 00       	call   c01095b5 <send_rec>
c010596a:	83 c4 10             	add    $0x10,%esp
c010596d:	c9                   	leave  
c010596e:	c3                   	ret    

c010596f <cleanup>:
c010596f:	55                   	push   %ebp
c0105970:	89 e5                	mov    %esp,%ebp
c0105972:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105978:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c010597f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105986:	8b 45 08             	mov    0x8(%ebp),%eax
c0105989:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010598f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105992:	8b 45 08             	mov    0x8(%ebp),%eax
c0105995:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c010599b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010599e:	8b 45 08             	mov    0x8(%ebp),%eax
c01059a1:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01059a7:	83 ec 04             	sub    $0x4,%esp
c01059aa:	50                   	push   %eax
c01059ab:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01059b1:	50                   	push   %eax
c01059b2:	6a 01                	push   $0x1
c01059b4:	e8 fc 3b 00 00       	call   c01095b5 <send_rec>
c01059b9:	83 c4 10             	add    $0x10,%esp
c01059bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01059bf:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c01059c6:	90                   	nop
c01059c7:	c9                   	leave  
c01059c8:	c3                   	ret    

c01059c9 <init_bitmap>:
c01059c9:	55                   	push   %ebp
c01059ca:	89 e5                	mov    %esp,%ebp
c01059cc:	83 ec 08             	sub    $0x8,%esp
c01059cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01059d2:	8b 50 04             	mov    0x4(%eax),%edx
c01059d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01059d8:	8b 00                	mov    (%eax),%eax
c01059da:	83 ec 04             	sub    $0x4,%esp
c01059dd:	52                   	push   %edx
c01059de:	6a 00                	push   $0x0
c01059e0:	50                   	push   %eax
c01059e1:	e8 e9 67 00 00       	call   c010c1cf <Memset>
c01059e6:	83 c4 10             	add    $0x10,%esp
c01059e9:	90                   	nop
c01059ea:	c9                   	leave  
c01059eb:	c3                   	ret    

c01059ec <test_bit_val>:
c01059ec:	55                   	push   %ebp
c01059ed:	89 e5                	mov    %esp,%ebp
c01059ef:	53                   	push   %ebx
c01059f0:	83 ec 10             	sub    $0x10,%esp
c01059f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059f6:	8d 50 07             	lea    0x7(%eax),%edx
c01059f9:	85 c0                	test   %eax,%eax
c01059fb:	0f 48 c2             	cmovs  %edx,%eax
c01059fe:	c1 f8 03             	sar    $0x3,%eax
c0105a01:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a07:	99                   	cltd   
c0105a08:	c1 ea 1d             	shr    $0x1d,%edx
c0105a0b:	01 d0                	add    %edx,%eax
c0105a0d:	83 e0 07             	and    $0x7,%eax
c0105a10:	29 d0                	sub    %edx,%eax
c0105a12:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a15:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a18:	8b 10                	mov    (%eax),%edx
c0105a1a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a1d:	01 d0                	add    %edx,%eax
c0105a1f:	0f b6 00             	movzbl (%eax),%eax
c0105a22:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105a25:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a2c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105a31:	89 c1                	mov    %eax,%ecx
c0105a33:	d3 e3                	shl    %cl,%ebx
c0105a35:	89 d8                	mov    %ebx,%eax
c0105a37:	21 c2                	and    %eax,%edx
c0105a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a3c:	89 c1                	mov    %eax,%ecx
c0105a3e:	d3 fa                	sar    %cl,%edx
c0105a40:	89 d0                	mov    %edx,%eax
c0105a42:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a45:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105a49:	0f 9f c0             	setg   %al
c0105a4c:	0f b6 c0             	movzbl %al,%eax
c0105a4f:	83 c4 10             	add    $0x10,%esp
c0105a52:	5b                   	pop    %ebx
c0105a53:	5d                   	pop    %ebp
c0105a54:	c3                   	ret    

c0105a55 <set_bit_val>:
c0105a55:	55                   	push   %ebp
c0105a56:	89 e5                	mov    %esp,%ebp
c0105a58:	83 ec 10             	sub    $0x10,%esp
c0105a5b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a5e:	8d 50 07             	lea    0x7(%eax),%edx
c0105a61:	85 c0                	test   %eax,%eax
c0105a63:	0f 48 c2             	cmovs  %edx,%eax
c0105a66:	c1 f8 03             	sar    $0x3,%eax
c0105a69:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a6c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a6f:	99                   	cltd   
c0105a70:	c1 ea 1d             	shr    $0x1d,%edx
c0105a73:	01 d0                	add    %edx,%eax
c0105a75:	83 e0 07             	and    $0x7,%eax
c0105a78:	29 d0                	sub    %edx,%eax
c0105a7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a80:	8b 10                	mov    (%eax),%edx
c0105a82:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a85:	01 d0                	add    %edx,%eax
c0105a87:	0f b6 00             	movzbl (%eax),%eax
c0105a8a:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105a8d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105a91:	7e 13                	jle    c0105aa6 <set_bit_val+0x51>
c0105a93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a96:	ba 01 00 00 00       	mov    $0x1,%edx
c0105a9b:	89 c1                	mov    %eax,%ecx
c0105a9d:	d3 e2                	shl    %cl,%edx
c0105a9f:	89 d0                	mov    %edx,%eax
c0105aa1:	08 45 ff             	or     %al,-0x1(%ebp)
c0105aa4:	eb 13                	jmp    c0105ab9 <set_bit_val+0x64>
c0105aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105aa9:	ba 01 00 00 00       	mov    $0x1,%edx
c0105aae:	89 c1                	mov    %eax,%ecx
c0105ab0:	d3 e2                	shl    %cl,%edx
c0105ab2:	89 d0                	mov    %edx,%eax
c0105ab4:	f7 d0                	not    %eax
c0105ab6:	20 45 ff             	and    %al,-0x1(%ebp)
c0105ab9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105abc:	8b 10                	mov    (%eax),%edx
c0105abe:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105ac1:	01 c2                	add    %eax,%edx
c0105ac3:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105ac7:	88 02                	mov    %al,(%edx)
c0105ac9:	b8 01 00 00 00       	mov    $0x1,%eax
c0105ace:	c9                   	leave  
c0105acf:	c3                   	ret    

c0105ad0 <set_bits>:
c0105ad0:	55                   	push   %ebp
c0105ad1:	89 e5                	mov    %esp,%ebp
c0105ad3:	83 ec 10             	sub    $0x10,%esp
c0105ad6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105add:	eb 1c                	jmp    c0105afb <set_bits+0x2b>
c0105adf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ae2:	8d 50 01             	lea    0x1(%eax),%edx
c0105ae5:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105ae8:	ff 75 10             	pushl  0x10(%ebp)
c0105aeb:	50                   	push   %eax
c0105aec:	ff 75 08             	pushl  0x8(%ebp)
c0105aef:	e8 61 ff ff ff       	call   c0105a55 <set_bit_val>
c0105af4:	83 c4 0c             	add    $0xc,%esp
c0105af7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105afb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105afe:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105b01:	7c dc                	jl     c0105adf <set_bits+0xf>
c0105b03:	b8 01 00 00 00       	mov    $0x1,%eax
c0105b08:	c9                   	leave  
c0105b09:	c3                   	ret    

c0105b0a <get_first_free_bit>:
c0105b0a:	55                   	push   %ebp
c0105b0b:	89 e5                	mov    %esp,%ebp
c0105b0d:	83 ec 10             	sub    $0x10,%esp
c0105b10:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b13:	8b 40 04             	mov    0x4(%eax),%eax
c0105b16:	c1 e0 03             	shl    $0x3,%eax
c0105b19:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b1f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105b22:	eb 1b                	jmp    c0105b3f <get_first_free_bit+0x35>
c0105b24:	ff 75 fc             	pushl  -0x4(%ebp)
c0105b27:	ff 75 08             	pushl  0x8(%ebp)
c0105b2a:	e8 bd fe ff ff       	call   c01059ec <test_bit_val>
c0105b2f:	83 c4 08             	add    $0x8,%esp
c0105b32:	85 c0                	test   %eax,%eax
c0105b34:	75 05                	jne    c0105b3b <get_first_free_bit+0x31>
c0105b36:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b39:	eb 11                	jmp    c0105b4c <get_first_free_bit+0x42>
c0105b3b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105b3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b42:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105b45:	7c dd                	jl     c0105b24 <get_first_free_bit+0x1a>
c0105b47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105b4c:	c9                   	leave  
c0105b4d:	c3                   	ret    

c0105b4e <get_bits>:
c0105b4e:	55                   	push   %ebp
c0105b4f:	89 e5                	mov    %esp,%ebp
c0105b51:	83 ec 20             	sub    $0x20,%esp
c0105b54:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105b5b:	ff 75 f0             	pushl  -0x10(%ebp)
c0105b5e:	ff 75 08             	pushl  0x8(%ebp)
c0105b61:	e8 a4 ff ff ff       	call   c0105b0a <get_first_free_bit>
c0105b66:	83 c4 08             	add    $0x8,%esp
c0105b69:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b6f:	8b 40 04             	mov    0x4(%eax),%eax
c0105b72:	c1 e0 03             	shl    $0x3,%eax
c0105b75:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b78:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b7b:	83 e8 01             	sub    $0x1,%eax
c0105b7e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105b81:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105b85:	75 08                	jne    c0105b8f <get_bits+0x41>
c0105b87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b8a:	e9 85 00 00 00       	jmp    c0105c14 <get_bits+0xc6>
c0105b8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b92:	83 c0 01             	add    $0x1,%eax
c0105b95:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b9e:	eb 58                	jmp    c0105bf8 <get_bits+0xaa>
c0105ba0:	ff 75 f8             	pushl  -0x8(%ebp)
c0105ba3:	ff 75 08             	pushl  0x8(%ebp)
c0105ba6:	e8 41 fe ff ff       	call   c01059ec <test_bit_val>
c0105bab:	83 c4 08             	add    $0x8,%esp
c0105bae:	85 c0                	test   %eax,%eax
c0105bb0:	75 0a                	jne    c0105bbc <get_bits+0x6e>
c0105bb2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105bb6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105bba:	eb 2b                	jmp    c0105be7 <get_bits+0x99>
c0105bbc:	6a 00                	push   $0x0
c0105bbe:	ff 75 08             	pushl  0x8(%ebp)
c0105bc1:	e8 44 ff ff ff       	call   c0105b0a <get_first_free_bit>
c0105bc6:	83 c4 08             	add    $0x8,%esp
c0105bc9:	83 c0 01             	add    $0x1,%eax
c0105bcc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105bcf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105bd2:	83 c0 01             	add    $0x1,%eax
c0105bd5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105bd8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105bdb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105bde:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105be1:	83 e8 01             	sub    $0x1,%eax
c0105be4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105be7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bea:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105bed:	7c 09                	jl     c0105bf8 <get_bits+0xaa>
c0105bef:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105bf6:	eb 0d                	jmp    c0105c05 <get_bits+0xb7>
c0105bf8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105bfb:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105bfe:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105c01:	85 c0                	test   %eax,%eax
c0105c03:	7f 9b                	jg     c0105ba0 <get_bits+0x52>
c0105c05:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c08:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105c0b:	83 c0 01             	add    $0x1,%eax
c0105c0e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c11:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c14:	c9                   	leave  
c0105c15:	c3                   	ret    

c0105c16 <get_a_page>:
c0105c16:	55                   	push   %ebp
c0105c17:	89 e5                	mov    %esp,%ebp
c0105c19:	83 ec 28             	sub    $0x28,%esp
c0105c1c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105c20:	75 22                	jne    c0105c44 <get_a_page+0x2e>
c0105c22:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105c27:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c2a:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105c2f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c32:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105c37:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c3a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105c3f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c42:	eb 20                	jmp    c0105c64 <get_a_page+0x4e>
c0105c44:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105c49:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c4c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105c51:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c54:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105c59:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c5c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105c61:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c64:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105c67:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105c6a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c6d:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105c70:	6a 01                	push   $0x1
c0105c72:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c75:	50                   	push   %eax
c0105c76:	e8 d3 fe ff ff       	call   c0105b4e <get_bits>
c0105c7b:	83 c4 08             	add    $0x8,%esp
c0105c7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c81:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105c85:	75 1c                	jne    c0105ca3 <get_a_page+0x8d>
c0105c87:	68 84 00 00 00       	push   $0x84
c0105c8c:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105c91:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105c96:	68 c4 b5 10 c0       	push   $0xc010b5c4
c0105c9b:	e8 a5 2c 00 00       	call   c0108945 <assertion_failure>
c0105ca0:	83 c4 10             	add    $0x10,%esp
c0105ca3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105ca6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105ca9:	c1 e2 0c             	shl    $0xc,%edx
c0105cac:	01 d0                	add    %edx,%eax
c0105cae:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105cb1:	83 ec 04             	sub    $0x4,%esp
c0105cb4:	6a 01                	push   $0x1
c0105cb6:	ff 75 f4             	pushl  -0xc(%ebp)
c0105cb9:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105cbc:	50                   	push   %eax
c0105cbd:	e8 93 fd ff ff       	call   c0105a55 <set_bit_val>
c0105cc2:	83 c4 10             	add    $0x10,%esp
c0105cc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cc8:	c9                   	leave  
c0105cc9:	c3                   	ret    

c0105cca <get_virtual_address_start_with_addr>:
c0105cca:	55                   	push   %ebp
c0105ccb:	89 e5                	mov    %esp,%ebp
c0105ccd:	83 ec 38             	sub    $0x38,%esp
c0105cd0:	e8 19 a7 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105cd5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cd8:	83 ec 0c             	sub    $0xc,%esp
c0105cdb:	ff 75 10             	pushl  0x10(%ebp)
c0105cde:	e8 93 db ff ff       	call   c0103876 <pid2proc>
c0105ce3:	83 c4 10             	add    $0x10,%esp
c0105ce6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ce9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cec:	8b 40 0c             	mov    0xc(%eax),%eax
c0105cef:	83 ec 04             	sub    $0x4,%esp
c0105cf2:	6a 0c                	push   $0xc
c0105cf4:	50                   	push   %eax
c0105cf5:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105cf8:	50                   	push   %eax
c0105cf9:	e8 2e 10 00 00       	call   c0106d2c <Memcpy>
c0105cfe:	83 c4 10             	add    $0x10,%esp
c0105d01:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105d04:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105d07:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105d0a:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105d0d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105d10:	8b 55 08             	mov    0x8(%ebp),%edx
c0105d13:	29 c2                	sub    %eax,%edx
c0105d15:	89 d0                	mov    %edx,%eax
c0105d17:	c1 e8 0c             	shr    $0xc,%eax
c0105d1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d1d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105d21:	79 1c                	jns    c0105d3f <get_virtual_address_start_with_addr+0x75>
c0105d23:	68 97 00 00 00       	push   $0x97
c0105d28:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105d2d:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105d32:	68 d0 b5 10 c0       	push   $0xc010b5d0
c0105d37:	e8 09 2c 00 00       	call   c0108945 <assertion_failure>
c0105d3c:	83 c4 10             	add    $0x10,%esp
c0105d3f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d42:	50                   	push   %eax
c0105d43:	6a 01                	push   $0x1
c0105d45:	ff 75 ec             	pushl  -0x14(%ebp)
c0105d48:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105d4b:	50                   	push   %eax
c0105d4c:	e8 7f fd ff ff       	call   c0105ad0 <set_bits>
c0105d51:	83 c4 10             	add    $0x10,%esp
c0105d54:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d57:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105d5c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d62:	c9                   	leave  
c0105d63:	c3                   	ret    

c0105d64 <get_virtual_address>:
c0105d64:	55                   	push   %ebp
c0105d65:	89 e5                	mov    %esp,%ebp
c0105d67:	83 ec 28             	sub    $0x28,%esp
c0105d6a:	e8 7f a6 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105d6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d72:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105d76:	75 1a                	jne    c0105d92 <get_virtual_address+0x2e>
c0105d78:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105d7d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d80:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105d85:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d88:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105d8d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d90:	eb 18                	jmp    c0105daa <get_virtual_address+0x46>
c0105d92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d95:	8b 40 0c             	mov    0xc(%eax),%eax
c0105d98:	83 ec 04             	sub    $0x4,%esp
c0105d9b:	6a 0c                	push   $0xc
c0105d9d:	50                   	push   %eax
c0105d9e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105da1:	50                   	push   %eax
c0105da2:	e8 85 0f 00 00       	call   c0106d2c <Memcpy>
c0105da7:	83 c4 10             	add    $0x10,%esp
c0105daa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105dad:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105db0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105db3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105db6:	8b 45 08             	mov    0x8(%ebp),%eax
c0105db9:	83 ec 08             	sub    $0x8,%esp
c0105dbc:	50                   	push   %eax
c0105dbd:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105dc0:	50                   	push   %eax
c0105dc1:	e8 88 fd ff ff       	call   c0105b4e <get_bits>
c0105dc6:	83 c4 10             	add    $0x10,%esp
c0105dc9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105dcc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105dcf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105dd2:	c1 e2 0c             	shl    $0xc,%edx
c0105dd5:	01 d0                	add    %edx,%eax
c0105dd7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105dda:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ddd:	50                   	push   %eax
c0105dde:	6a 01                	push   $0x1
c0105de0:	ff 75 f0             	pushl  -0x10(%ebp)
c0105de3:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105de6:	50                   	push   %eax
c0105de7:	e8 e4 fc ff ff       	call   c0105ad0 <set_bits>
c0105dec:	83 c4 10             	add    $0x10,%esp
c0105def:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105df2:	c9                   	leave  
c0105df3:	c3                   	ret    

c0105df4 <ptr_pde>:
c0105df4:	55                   	push   %ebp
c0105df5:	89 e5                	mov    %esp,%ebp
c0105df7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dfa:	c1 e8 16             	shr    $0x16,%eax
c0105dfd:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105e02:	c1 e0 02             	shl    $0x2,%eax
c0105e05:	5d                   	pop    %ebp
c0105e06:	c3                   	ret    

c0105e07 <ptr_pte>:
c0105e07:	55                   	push   %ebp
c0105e08:	89 e5                	mov    %esp,%ebp
c0105e0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e0d:	c1 e8 0a             	shr    $0xa,%eax
c0105e10:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105e15:	89 c2                	mov    %eax,%edx
c0105e17:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e1a:	c1 e8 0c             	shr    $0xc,%eax
c0105e1d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105e22:	c1 e0 02             	shl    $0x2,%eax
c0105e25:	01 d0                	add    %edx,%eax
c0105e27:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105e2c:	5d                   	pop    %ebp
c0105e2d:	c3                   	ret    

c0105e2e <add_map_entry>:
c0105e2e:	55                   	push   %ebp
c0105e2f:	89 e5                	mov    %esp,%ebp
c0105e31:	83 ec 18             	sub    $0x18,%esp
c0105e34:	ff 75 08             	pushl  0x8(%ebp)
c0105e37:	e8 b8 ff ff ff       	call   c0105df4 <ptr_pde>
c0105e3c:	83 c4 04             	add    $0x4,%esp
c0105e3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e42:	ff 75 08             	pushl  0x8(%ebp)
c0105e45:	e8 bd ff ff ff       	call   c0105e07 <ptr_pte>
c0105e4a:	83 c4 04             	add    $0x4,%esp
c0105e4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e53:	8b 00                	mov    (%eax),%eax
c0105e55:	83 e0 01             	and    $0x1,%eax
c0105e58:	85 c0                	test   %eax,%eax
c0105e5a:	74 1b                	je     c0105e77 <add_map_entry+0x49>
c0105e5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e5f:	8b 00                	mov    (%eax),%eax
c0105e61:	83 e0 01             	and    $0x1,%eax
c0105e64:	85 c0                	test   %eax,%eax
c0105e66:	75 54                	jne    c0105ebc <add_map_entry+0x8e>
c0105e68:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e6b:	83 c8 07             	or     $0x7,%eax
c0105e6e:	89 c2                	mov    %eax,%edx
c0105e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e73:	89 10                	mov    %edx,(%eax)
c0105e75:	eb 45                	jmp    c0105ebc <add_map_entry+0x8e>
c0105e77:	83 ec 0c             	sub    $0xc,%esp
c0105e7a:	6a 00                	push   $0x0
c0105e7c:	e8 95 fd ff ff       	call   c0105c16 <get_a_page>
c0105e81:	83 c4 10             	add    $0x10,%esp
c0105e84:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e8a:	83 c8 07             	or     $0x7,%eax
c0105e8d:	89 c2                	mov    %eax,%edx
c0105e8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e92:	89 10                	mov    %edx,(%eax)
c0105e94:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e97:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e9c:	83 ec 04             	sub    $0x4,%esp
c0105e9f:	68 00 10 00 00       	push   $0x1000
c0105ea4:	6a 00                	push   $0x0
c0105ea6:	50                   	push   %eax
c0105ea7:	e8 23 63 00 00       	call   c010c1cf <Memset>
c0105eac:	83 c4 10             	add    $0x10,%esp
c0105eaf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105eb2:	83 c8 07             	or     $0x7,%eax
c0105eb5:	89 c2                	mov    %eax,%edx
c0105eb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105eba:	89 10                	mov    %edx,(%eax)
c0105ebc:	90                   	nop
c0105ebd:	c9                   	leave  
c0105ebe:	c3                   	ret    

c0105ebf <alloc_virtual_memory>:
c0105ebf:	55                   	push   %ebp
c0105ec0:	89 e5                	mov    %esp,%ebp
c0105ec2:	83 ec 28             	sub    $0x28,%esp
c0105ec5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ec8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ecd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ed0:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ed3:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105ed6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ed9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105edc:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105edf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105ee2:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105ee7:	c1 e8 0c             	shr    $0xc,%eax
c0105eea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105eed:	e8 fc a4 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105ef2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105ef5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105ef8:	8b 50 08             	mov    0x8(%eax),%edx
c0105efb:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105f00:	39 c2                	cmp    %eax,%edx
c0105f02:	75 09                	jne    c0105f0d <alloc_virtual_memory+0x4e>
c0105f04:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105f0b:	eb 07                	jmp    c0105f14 <alloc_virtual_memory+0x55>
c0105f0d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105f14:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105f1b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105f22:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105f29:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105f30:	eb 47                	jmp    c0105f79 <alloc_virtual_memory+0xba>
c0105f32:	83 ec 08             	sub    $0x8,%esp
c0105f35:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f38:	6a 01                	push   $0x1
c0105f3a:	e8 25 fe ff ff       	call   c0105d64 <get_virtual_address>
c0105f3f:	83 c4 10             	add    $0x10,%esp
c0105f42:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f45:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105f49:	74 13                	je     c0105f5e <alloc_virtual_memory+0x9f>
c0105f4b:	83 ec 0c             	sub    $0xc,%esp
c0105f4e:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f51:	e8 c0 fc ff ff       	call   c0105c16 <get_a_page>
c0105f56:	83 c4 10             	add    $0x10,%esp
c0105f59:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f5c:	eb 06                	jmp    c0105f64 <alloc_virtual_memory+0xa5>
c0105f5e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105f61:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f64:	83 ec 08             	sub    $0x8,%esp
c0105f67:	ff 75 f4             	pushl  -0xc(%ebp)
c0105f6a:	ff 75 d8             	pushl  -0x28(%ebp)
c0105f6d:	e8 bc fe ff ff       	call   c0105e2e <add_map_entry>
c0105f72:	83 c4 10             	add    $0x10,%esp
c0105f75:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105f79:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105f7c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105f7f:	72 b1                	jb     c0105f32 <alloc_virtual_memory+0x73>
c0105f81:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f84:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f89:	89 c2                	mov    %eax,%edx
c0105f8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f8e:	01 d0                	add    %edx,%eax
c0105f90:	c9                   	leave  
c0105f91:	c3                   	ret    

c0105f92 <get_physical_address_proc>:
c0105f92:	55                   	push   %ebp
c0105f93:	89 e5                	mov    %esp,%ebp
c0105f95:	83 ec 18             	sub    $0x18,%esp
c0105f98:	e8 75 a3 ff ff       	call   c0100312 <disable_int>
c0105f9d:	e8 4c a4 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105fa2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fa5:	83 ec 0c             	sub    $0xc,%esp
c0105fa8:	ff 75 0c             	pushl  0xc(%ebp)
c0105fab:	e8 c6 d8 ff ff       	call   c0103876 <pid2proc>
c0105fb0:	83 c4 10             	add    $0x10,%esp
c0105fb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fb9:	8b 40 08             	mov    0x8(%eax),%eax
c0105fbc:	83 ec 0c             	sub    $0xc,%esp
c0105fbf:	50                   	push   %eax
c0105fc0:	e8 0d a4 ff ff       	call   c01003d2 <update_cr3>
c0105fc5:	83 c4 10             	add    $0x10,%esp
c0105fc8:	83 ec 0c             	sub    $0xc,%esp
c0105fcb:	ff 75 08             	pushl  0x8(%ebp)
c0105fce:	e8 34 fe ff ff       	call   c0105e07 <ptr_pte>
c0105fd3:	83 c4 10             	add    $0x10,%esp
c0105fd6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105fdc:	8b 00                	mov    (%eax),%eax
c0105fde:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105fe3:	89 c2                	mov    %eax,%edx
c0105fe5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fe8:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105fed:	09 d0                	or     %edx,%eax
c0105fef:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ff2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105ff5:	8b 40 08             	mov    0x8(%eax),%eax
c0105ff8:	83 ec 0c             	sub    $0xc,%esp
c0105ffb:	50                   	push   %eax
c0105ffc:	e8 d1 a3 ff ff       	call   c01003d2 <update_cr3>
c0106001:	83 c4 10             	add    $0x10,%esp
c0106004:	e8 0b a3 ff ff       	call   c0100314 <enable_int>
c0106009:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010600c:	c9                   	leave  
c010600d:	c3                   	ret    

c010600e <get_physical_address>:
c010600e:	55                   	push   %ebp
c010600f:	89 e5                	mov    %esp,%ebp
c0106011:	83 ec 10             	sub    $0x10,%esp
c0106014:	ff 75 08             	pushl  0x8(%ebp)
c0106017:	e8 eb fd ff ff       	call   c0105e07 <ptr_pte>
c010601c:	83 c4 04             	add    $0x4,%esp
c010601f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106022:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106025:	8b 00                	mov    (%eax),%eax
c0106027:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010602c:	89 c2                	mov    %eax,%edx
c010602e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106031:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106036:	09 d0                	or     %edx,%eax
c0106038:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010603b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010603e:	c9                   	leave  
c010603f:	c3                   	ret    

c0106040 <alloc_physical_memory_of_proc>:
c0106040:	55                   	push   %ebp
c0106041:	89 e5                	mov    %esp,%ebp
c0106043:	83 ec 48             	sub    $0x48,%esp
c0106046:	e8 c7 a2 ff ff       	call   c0100312 <disable_int>
c010604b:	8b 45 08             	mov    0x8(%ebp),%eax
c010604e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106053:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106056:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010605d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106060:	83 ec 0c             	sub    $0xc,%esp
c0106063:	50                   	push   %eax
c0106064:	e8 0d d8 ff ff       	call   c0103876 <pid2proc>
c0106069:	83 c4 10             	add    $0x10,%esp
c010606c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010606f:	e8 7a a3 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106074:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106077:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010607a:	8b 40 0c             	mov    0xc(%eax),%eax
c010607d:	83 ec 04             	sub    $0x4,%esp
c0106080:	6a 0c                	push   $0xc
c0106082:	50                   	push   %eax
c0106083:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106086:	50                   	push   %eax
c0106087:	e8 a0 0c 00 00       	call   c0106d2c <Memcpy>
c010608c:	83 c4 10             	add    $0x10,%esp
c010608f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106092:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0106095:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106098:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010609b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010609e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01060a1:	29 c2                	sub    %eax,%edx
c01060a3:	89 d0                	mov    %edx,%eax
c01060a5:	c1 e8 0c             	shr    $0xc,%eax
c01060a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01060ab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01060ae:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01060b1:	c1 e2 0c             	shl    $0xc,%edx
c01060b4:	01 d0                	add    %edx,%eax
c01060b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01060b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01060bc:	6a 01                	push   $0x1
c01060be:	6a 01                	push   $0x1
c01060c0:	50                   	push   %eax
c01060c1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01060c4:	50                   	push   %eax
c01060c5:	e8 06 fa ff ff       	call   c0105ad0 <set_bits>
c01060ca:	83 c4 10             	add    $0x10,%esp
c01060cd:	83 ec 0c             	sub    $0xc,%esp
c01060d0:	ff 75 f0             	pushl  -0x10(%ebp)
c01060d3:	e8 3e fb ff ff       	call   c0105c16 <get_a_page>
c01060d8:	83 c4 10             	add    $0x10,%esp
c01060db:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01060de:	8b 45 08             	mov    0x8(%ebp),%eax
c01060e1:	25 ff 0f 00 00       	and    $0xfff,%eax
c01060e6:	89 c2                	mov    %eax,%edx
c01060e8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01060eb:	01 d0                	add    %edx,%eax
c01060ed:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01060f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060f3:	8b 40 08             	mov    0x8(%eax),%eax
c01060f6:	83 ec 0c             	sub    $0xc,%esp
c01060f9:	50                   	push   %eax
c01060fa:	e8 d3 a2 ff ff       	call   c01003d2 <update_cr3>
c01060ff:	83 c4 10             	add    $0x10,%esp
c0106102:	83 ec 08             	sub    $0x8,%esp
c0106105:	ff 75 dc             	pushl  -0x24(%ebp)
c0106108:	ff 75 f4             	pushl  -0xc(%ebp)
c010610b:	e8 1e fd ff ff       	call   c0105e2e <add_map_entry>
c0106110:	83 c4 10             	add    $0x10,%esp
c0106113:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106116:	8b 40 08             	mov    0x8(%eax),%eax
c0106119:	83 ec 0c             	sub    $0xc,%esp
c010611c:	50                   	push   %eax
c010611d:	e8 b0 a2 ff ff       	call   c01003d2 <update_cr3>
c0106122:	83 c4 10             	add    $0x10,%esp
c0106125:	e8 ea a1 ff ff       	call   c0100314 <enable_int>
c010612a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010612d:	c9                   	leave  
c010612e:	c3                   	ret    

c010612f <alloc_physical_memory>:
c010612f:	55                   	push   %ebp
c0106130:	89 e5                	mov    %esp,%ebp
c0106132:	83 ec 38             	sub    $0x38,%esp
c0106135:	8b 45 08             	mov    0x8(%ebp),%eax
c0106138:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010613d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106140:	e8 a9 a2 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106145:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106148:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010614c:	75 1a                	jne    c0106168 <alloc_physical_memory+0x39>
c010614e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106153:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106156:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010615b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010615e:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106163:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106166:	eb 18                	jmp    c0106180 <alloc_physical_memory+0x51>
c0106168:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010616b:	8b 40 0c             	mov    0xc(%eax),%eax
c010616e:	83 ec 04             	sub    $0x4,%esp
c0106171:	6a 0c                	push   $0xc
c0106173:	50                   	push   %eax
c0106174:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0106177:	50                   	push   %eax
c0106178:	e8 af 0b 00 00       	call   c0106d2c <Memcpy>
c010617d:	83 c4 10             	add    $0x10,%esp
c0106180:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106183:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106186:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106189:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010618c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010618f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106192:	29 c2                	sub    %eax,%edx
c0106194:	89 d0                	mov    %edx,%eax
c0106196:	c1 e8 0c             	shr    $0xc,%eax
c0106199:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010619c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010619f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01061a2:	c1 e2 0c             	shl    $0xc,%edx
c01061a5:	01 d0                	add    %edx,%eax
c01061a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01061aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061ad:	6a 01                	push   $0x1
c01061af:	6a 01                	push   $0x1
c01061b1:	50                   	push   %eax
c01061b2:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01061b5:	50                   	push   %eax
c01061b6:	e8 15 f9 ff ff       	call   c0105ad0 <set_bits>
c01061bb:	83 c4 10             	add    $0x10,%esp
c01061be:	83 ec 0c             	sub    $0xc,%esp
c01061c1:	ff 75 0c             	pushl  0xc(%ebp)
c01061c4:	e8 4d fa ff ff       	call   c0105c16 <get_a_page>
c01061c9:	83 c4 10             	add    $0x10,%esp
c01061cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01061cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01061d2:	25 ff 0f 00 00       	and    $0xfff,%eax
c01061d7:	89 c2                	mov    %eax,%edx
c01061d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01061dc:	01 d0                	add    %edx,%eax
c01061de:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01061e1:	83 ec 08             	sub    $0x8,%esp
c01061e4:	ff 75 e4             	pushl  -0x1c(%ebp)
c01061e7:	ff 75 f4             	pushl  -0xc(%ebp)
c01061ea:	e8 3f fc ff ff       	call   c0105e2e <add_map_entry>
c01061ef:	83 c4 10             	add    $0x10,%esp
c01061f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01061f5:	c9                   	leave  
c01061f6:	c3                   	ret    

c01061f7 <alloc_memory>:
c01061f7:	55                   	push   %ebp
c01061f8:	89 e5                	mov    %esp,%ebp
c01061fa:	83 ec 18             	sub    $0x18,%esp
c01061fd:	83 ec 08             	sub    $0x8,%esp
c0106200:	ff 75 0c             	pushl  0xc(%ebp)
c0106203:	ff 75 08             	pushl  0x8(%ebp)
c0106206:	e8 59 fb ff ff       	call   c0105d64 <get_virtual_address>
c010620b:	83 c4 10             	add    $0x10,%esp
c010620e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106211:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106214:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106219:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010621c:	eb 29                	jmp    c0106247 <alloc_memory+0x50>
c010621e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106225:	83 ec 0c             	sub    $0xc,%esp
c0106228:	ff 75 0c             	pushl  0xc(%ebp)
c010622b:	e8 e6 f9 ff ff       	call   c0105c16 <get_a_page>
c0106230:	83 c4 10             	add    $0x10,%esp
c0106233:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106236:	83 ec 08             	sub    $0x8,%esp
c0106239:	ff 75 ec             	pushl  -0x14(%ebp)
c010623c:	ff 75 f4             	pushl  -0xc(%ebp)
c010623f:	e8 ea fb ff ff       	call   c0105e2e <add_map_entry>
c0106244:	83 c4 10             	add    $0x10,%esp
c0106247:	8b 45 08             	mov    0x8(%ebp),%eax
c010624a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010624d:	89 55 08             	mov    %edx,0x8(%ebp)
c0106250:	85 c0                	test   %eax,%eax
c0106252:	75 ca                	jne    c010621e <alloc_memory+0x27>
c0106254:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106257:	c9                   	leave  
c0106258:	c3                   	ret    

c0106259 <get_a_virtual_page>:
c0106259:	55                   	push   %ebp
c010625a:	89 e5                	mov    %esp,%ebp
c010625c:	83 ec 18             	sub    $0x18,%esp
c010625f:	83 ec 0c             	sub    $0xc,%esp
c0106262:	ff 75 08             	pushl  0x8(%ebp)
c0106265:	e8 ac f9 ff ff       	call   c0105c16 <get_a_page>
c010626a:	83 c4 10             	add    $0x10,%esp
c010626d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106270:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106273:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106278:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010627b:	83 ec 08             	sub    $0x8,%esp
c010627e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106281:	ff 75 f0             	pushl  -0x10(%ebp)
c0106284:	e8 a5 fb ff ff       	call   c0105e2e <add_map_entry>
c0106289:	83 c4 10             	add    $0x10,%esp
c010628c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010628f:	c9                   	leave  
c0106290:	c3                   	ret    

c0106291 <block2arena>:
c0106291:	55                   	push   %ebp
c0106292:	89 e5                	mov    %esp,%ebp
c0106294:	83 ec 10             	sub    $0x10,%esp
c0106297:	8b 45 08             	mov    0x8(%ebp),%eax
c010629a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010629f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01062a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01062a5:	c9                   	leave  
c01062a6:	c3                   	ret    

c01062a7 <sys_malloc2>:
c01062a7:	55                   	push   %ebp
c01062a8:	89 e5                	mov    %esp,%ebp
c01062aa:	83 ec 68             	sub    $0x68,%esp
c01062ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01062b4:	e8 35 a1 ff ff       	call   c01003ee <get_running_thread_pcb>
c01062b9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01062bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062bf:	8b 50 08             	mov    0x8(%eax),%edx
c01062c2:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01062c7:	39 c2                	cmp    %eax,%edx
c01062c9:	75 10                	jne    c01062db <sys_malloc2+0x34>
c01062cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01062d2:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c01062d9:	eb 10                	jmp    c01062eb <sys_malloc2+0x44>
c01062db:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01062e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062e5:	83 c0 10             	add    $0x10,%eax
c01062e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01062eb:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c01062f2:	76 52                	jbe    c0106346 <sys_malloc2+0x9f>
c01062f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01062f7:	05 0b 10 00 00       	add    $0x100b,%eax
c01062fc:	c1 e8 0c             	shr    $0xc,%eax
c01062ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106302:	83 ec 08             	sub    $0x8,%esp
c0106305:	ff 75 f0             	pushl  -0x10(%ebp)
c0106308:	ff 75 d8             	pushl  -0x28(%ebp)
c010630b:	e8 e7 fe ff ff       	call   c01061f7 <alloc_memory>
c0106310:	83 c4 10             	add    $0x10,%esp
c0106313:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106316:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106319:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010631c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010631f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106325:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106328:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010632f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106332:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106336:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106339:	05 90 00 00 00       	add    $0x90,%eax
c010633e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106341:	e9 f0 01 00 00       	jmp    c0106536 <sys_malloc2+0x28f>
c0106346:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010634d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106354:	eb 26                	jmp    c010637c <sys_malloc2+0xd5>
c0106356:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106359:	89 d0                	mov    %edx,%eax
c010635b:	01 c0                	add    %eax,%eax
c010635d:	01 d0                	add    %edx,%eax
c010635f:	c1 e0 03             	shl    $0x3,%eax
c0106362:	89 c2                	mov    %eax,%edx
c0106364:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106367:	01 d0                	add    %edx,%eax
c0106369:	8b 00                	mov    (%eax),%eax
c010636b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010636e:	77 08                	ja     c0106378 <sys_malloc2+0xd1>
c0106370:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106373:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106376:	eb 0a                	jmp    c0106382 <sys_malloc2+0xdb>
c0106378:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010637c:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0106380:	7e d4                	jle    c0106356 <sys_malloc2+0xaf>
c0106382:	83 ec 08             	sub    $0x8,%esp
c0106385:	ff 75 f0             	pushl  -0x10(%ebp)
c0106388:	6a 01                	push   $0x1
c010638a:	e8 68 fe ff ff       	call   c01061f7 <alloc_memory>
c010638f:	83 c4 10             	add    $0x10,%esp
c0106392:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106395:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106398:	89 d0                	mov    %edx,%eax
c010639a:	01 c0                	add    %eax,%eax
c010639c:	01 d0                	add    %edx,%eax
c010639e:	c1 e0 03             	shl    $0x3,%eax
c01063a1:	89 c2                	mov    %eax,%edx
c01063a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063a6:	01 d0                	add    %edx,%eax
c01063a8:	83 ec 04             	sub    $0x4,%esp
c01063ab:	6a 18                	push   $0x18
c01063ad:	50                   	push   %eax
c01063ae:	ff 75 cc             	pushl  -0x34(%ebp)
c01063b1:	e8 76 09 00 00       	call   c0106d2c <Memcpy>
c01063b6:	83 c4 10             	add    $0x10,%esp
c01063b9:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01063c0:	e8 03 09 00 00       	call   c0106cc8 <intr_disable>
c01063c5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01063c8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01063cb:	89 d0                	mov    %edx,%eax
c01063cd:	01 c0                	add    %eax,%eax
c01063cf:	01 d0                	add    %edx,%eax
c01063d1:	c1 e0 03             	shl    $0x3,%eax
c01063d4:	89 c2                	mov    %eax,%edx
c01063d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063d9:	01 d0                	add    %edx,%eax
c01063db:	83 c0 08             	add    $0x8,%eax
c01063de:	83 ec 0c             	sub    $0xc,%esp
c01063e1:	50                   	push   %eax
c01063e2:	e8 1c 3d 00 00       	call   c010a103 <isListEmpty>
c01063e7:	83 c4 10             	add    $0x10,%esp
c01063ea:	3c 01                	cmp    $0x1,%al
c01063ec:	0f 85 c1 00 00 00    	jne    c01064b3 <sys_malloc2+0x20c>
c01063f2:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c01063f9:	83 ec 08             	sub    $0x8,%esp
c01063fc:	ff 75 f0             	pushl  -0x10(%ebp)
c01063ff:	6a 01                	push   $0x1
c0106401:	e8 f1 fd ff ff       	call   c01061f7 <alloc_memory>
c0106406:	83 c4 10             	add    $0x10,%esp
c0106409:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010640c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010640f:	83 ec 0c             	sub    $0xc,%esp
c0106412:	50                   	push   %eax
c0106413:	e8 79 fe ff ff       	call   c0106291 <block2arena>
c0106418:	83 c4 10             	add    $0x10,%esp
c010641b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010641e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106421:	89 d0                	mov    %edx,%eax
c0106423:	01 c0                	add    %eax,%eax
c0106425:	01 d0                	add    %edx,%eax
c0106427:	c1 e0 03             	shl    $0x3,%eax
c010642a:	89 c2                	mov    %eax,%edx
c010642c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010642f:	01 d0                	add    %edx,%eax
c0106431:	8b 50 04             	mov    0x4(%eax),%edx
c0106434:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106437:	89 50 04             	mov    %edx,0x4(%eax)
c010643a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010643d:	8b 00                	mov    (%eax),%eax
c010643f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106442:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106449:	b8 00 10 00 00       	mov    $0x1000,%eax
c010644e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0106451:	ba 00 00 00 00       	mov    $0x0,%edx
c0106456:	f7 75 b8             	divl   -0x48(%ebp)
c0106459:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010645c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010645f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0106462:	01 d0                	add    %edx,%eax
c0106464:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106467:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010646e:	eb 3b                	jmp    c01064ab <sys_malloc2+0x204>
c0106470:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106473:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0106477:	89 c2                	mov    %eax,%edx
c0106479:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010647c:	01 d0                	add    %edx,%eax
c010647e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106481:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106484:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106487:	89 d0                	mov    %edx,%eax
c0106489:	01 c0                	add    %eax,%eax
c010648b:	01 d0                	add    %edx,%eax
c010648d:	c1 e0 03             	shl    $0x3,%eax
c0106490:	89 c2                	mov    %eax,%edx
c0106492:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106495:	01 d0                	add    %edx,%eax
c0106497:	83 c0 08             	add    $0x8,%eax
c010649a:	83 ec 08             	sub    $0x8,%esp
c010649d:	51                   	push   %ecx
c010649e:	50                   	push   %eax
c010649f:	e8 5c 3d 00 00       	call   c010a200 <appendToDoubleLinkList>
c01064a4:	83 c4 10             	add    $0x10,%esp
c01064a7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01064ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01064ae:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01064b1:	77 bd                	ja     c0106470 <sys_malloc2+0x1c9>
c01064b3:	83 ec 0c             	sub    $0xc,%esp
c01064b6:	ff 75 c4             	pushl  -0x3c(%ebp)
c01064b9:	e8 33 08 00 00       	call   c0106cf1 <intr_set_status>
c01064be:	83 c4 10             	add    $0x10,%esp
c01064c1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01064c4:	89 d0                	mov    %edx,%eax
c01064c6:	01 c0                	add    %eax,%eax
c01064c8:	01 d0                	add    %edx,%eax
c01064ca:	c1 e0 03             	shl    $0x3,%eax
c01064cd:	89 c2                	mov    %eax,%edx
c01064cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01064d2:	01 d0                	add    %edx,%eax
c01064d4:	83 c0 08             	add    $0x8,%eax
c01064d7:	83 ec 0c             	sub    $0xc,%esp
c01064da:	50                   	push   %eax
c01064db:	e8 8a 3e 00 00       	call   c010a36a <popFromDoubleLinkList>
c01064e0:	83 c4 10             	add    $0x10,%esp
c01064e3:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01064e6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01064e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01064ec:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c01064f0:	75 1c                	jne    c010650e <sys_malloc2+0x267>
c01064f2:	68 ef 01 00 00       	push   $0x1ef
c01064f7:	68 ba b5 10 c0       	push   $0xc010b5ba
c01064fc:	68 ba b5 10 c0       	push   $0xc010b5ba
c0106501:	68 db b5 10 c0       	push   $0xc010b5db
c0106506:	e8 3a 24 00 00       	call   c0108945 <assertion_failure>
c010650b:	83 c4 10             	add    $0x10,%esp
c010650e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106511:	83 ec 0c             	sub    $0xc,%esp
c0106514:	50                   	push   %eax
c0106515:	e8 77 fd ff ff       	call   c0106291 <block2arena>
c010651a:	83 c4 10             	add    $0x10,%esp
c010651d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106520:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106523:	8b 40 04             	mov    0x4(%eax),%eax
c0106526:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106529:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010652c:	89 50 04             	mov    %edx,0x4(%eax)
c010652f:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106536:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010653a:	75 1c                	jne    c0106558 <sys_malloc2+0x2b1>
c010653c:	68 f6 01 00 00       	push   $0x1f6
c0106541:	68 ba b5 10 c0       	push   $0xc010b5ba
c0106546:	68 ba b5 10 c0       	push   $0xc010b5ba
c010654b:	68 ed b5 10 c0       	push   $0xc010b5ed
c0106550:	e8 f0 23 00 00       	call   c0108945 <assertion_failure>
c0106555:	83 c4 10             	add    $0x10,%esp
c0106558:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010655b:	c9                   	leave  
c010655c:	c3                   	ret    

c010655d <remove_map_entry>:
c010655d:	55                   	push   %ebp
c010655e:	89 e5                	mov    %esp,%ebp
c0106560:	83 ec 10             	sub    $0x10,%esp
c0106563:	ff 75 08             	pushl  0x8(%ebp)
c0106566:	e8 9c f8 ff ff       	call   c0105e07 <ptr_pte>
c010656b:	83 c4 04             	add    $0x4,%esp
c010656e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106571:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106574:	8b 10                	mov    (%eax),%edx
c0106576:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106579:	89 10                	mov    %edx,(%eax)
c010657b:	90                   	nop
c010657c:	c9                   	leave  
c010657d:	c3                   	ret    

c010657e <free_a_page>:
c010657e:	55                   	push   %ebp
c010657f:	89 e5                	mov    %esp,%ebp
c0106581:	83 ec 20             	sub    $0x20,%esp
c0106584:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106588:	75 21                	jne    c01065ab <free_a_page+0x2d>
c010658a:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010658f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106592:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106597:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010659a:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010659f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01065a2:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c01065a9:	eb 1f                	jmp    c01065ca <free_a_page+0x4c>
c01065ab:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01065b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01065b3:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01065b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01065bb:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01065c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01065c3:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c01065ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01065cd:	c1 e8 0c             	shr    $0xc,%eax
c01065d0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01065d3:	6a 00                	push   $0x0
c01065d5:	ff 75 f8             	pushl  -0x8(%ebp)
c01065d8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01065db:	50                   	push   %eax
c01065dc:	e8 74 f4 ff ff       	call   c0105a55 <set_bit_val>
c01065e1:	83 c4 0c             	add    $0xc,%esp
c01065e4:	ff 75 08             	pushl  0x8(%ebp)
c01065e7:	e8 22 fa ff ff       	call   c010600e <get_physical_address>
c01065ec:	83 c4 04             	add    $0x4,%esp
c01065ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01065f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01065f5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01065fb:	85 c0                	test   %eax,%eax
c01065fd:	0f 48 c2             	cmovs  %edx,%eax
c0106600:	c1 f8 0c             	sar    $0xc,%eax
c0106603:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106606:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106609:	6a 00                	push   $0x0
c010660b:	ff 75 f0             	pushl  -0x10(%ebp)
c010660e:	50                   	push   %eax
c010660f:	e8 41 f4 ff ff       	call   c0105a55 <set_bit_val>
c0106614:	83 c4 0c             	add    $0xc,%esp
c0106617:	ff 75 08             	pushl  0x8(%ebp)
c010661a:	e8 3e ff ff ff       	call   c010655d <remove_map_entry>
c010661f:	83 c4 04             	add    $0x4,%esp
c0106622:	90                   	nop
c0106623:	c9                   	leave  
c0106624:	c3                   	ret    

c0106625 <sys_free2>:
c0106625:	55                   	push   %ebp
c0106626:	89 e5                	mov    %esp,%ebp
c0106628:	83 ec 58             	sub    $0x58,%esp
c010662b:	e8 be 9d ff ff       	call   c01003ee <get_running_thread_pcb>
c0106630:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106633:	e8 90 06 00 00       	call   c0106cc8 <intr_disable>
c0106638:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010663b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010663e:	8b 50 08             	mov    0x8(%eax),%edx
c0106641:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106646:	39 c2                	cmp    %eax,%edx
c0106648:	75 10                	jne    c010665a <sys_free2+0x35>
c010664a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106651:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c0106658:	eb 10                	jmp    c010666a <sys_free2+0x45>
c010665a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106661:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106664:	83 c0 10             	add    $0x10,%eax
c0106667:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010666a:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0106671:	76 4d                	jbe    c01066c0 <sys_free2+0x9b>
c0106673:	8b 45 08             	mov    0x8(%ebp),%eax
c0106676:	83 e8 0c             	sub    $0xc,%eax
c0106679:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010667c:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0106680:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106683:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106688:	c1 e8 0c             	shr    $0xc,%eax
c010668b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010668e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106695:	eb 1c                	jmp    c01066b3 <sys_free2+0x8e>
c0106697:	83 ec 08             	sub    $0x8,%esp
c010669a:	ff 75 f4             	pushl  -0xc(%ebp)
c010669d:	ff 75 ec             	pushl  -0x14(%ebp)
c01066a0:	e8 d9 fe ff ff       	call   c010657e <free_a_page>
c01066a5:	83 c4 10             	add    $0x10,%esp
c01066a8:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c01066af:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01066b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01066b6:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c01066b9:	77 dc                	ja     c0106697 <sys_free2+0x72>
c01066bb:	e9 dc 00 00 00       	jmp    c010679c <sys_free2+0x177>
c01066c0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01066c7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01066ce:	eb 26                	jmp    c01066f6 <sys_free2+0xd1>
c01066d0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01066d3:	89 d0                	mov    %edx,%eax
c01066d5:	01 c0                	add    %eax,%eax
c01066d7:	01 d0                	add    %edx,%eax
c01066d9:	c1 e0 03             	shl    $0x3,%eax
c01066dc:	89 c2                	mov    %eax,%edx
c01066de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066e1:	01 d0                	add    %edx,%eax
c01066e3:	8b 00                	mov    (%eax),%eax
c01066e5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01066e8:	77 08                	ja     c01066f2 <sys_free2+0xcd>
c01066ea:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01066ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01066f0:	eb 0a                	jmp    c01066fc <sys_free2+0xd7>
c01066f2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01066f6:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c01066fa:	7e d4                	jle    c01066d0 <sys_free2+0xab>
c01066fc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01066ff:	89 d0                	mov    %edx,%eax
c0106701:	01 c0                	add    %eax,%eax
c0106703:	01 d0                	add    %edx,%eax
c0106705:	c1 e0 03             	shl    $0x3,%eax
c0106708:	89 c2                	mov    %eax,%edx
c010670a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010670d:	01 d0                	add    %edx,%eax
c010670f:	8b 10                	mov    (%eax),%edx
c0106711:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106714:	8b 50 04             	mov    0x4(%eax),%edx
c0106717:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010671a:	8b 50 08             	mov    0x8(%eax),%edx
c010671d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106720:	8b 50 0c             	mov    0xc(%eax),%edx
c0106723:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106726:	8b 50 10             	mov    0x10(%eax),%edx
c0106729:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010672c:	8b 40 14             	mov    0x14(%eax),%eax
c010672f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106732:	8b 45 08             	mov    0x8(%ebp),%eax
c0106735:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106738:	83 ec 0c             	sub    $0xc,%esp
c010673b:	ff 75 d0             	pushl  -0x30(%ebp)
c010673e:	e8 4e fb ff ff       	call   c0106291 <block2arena>
c0106743:	83 c4 10             	add    $0x10,%esp
c0106746:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106749:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010674c:	89 d0                	mov    %edx,%eax
c010674e:	01 c0                	add    %eax,%eax
c0106750:	01 d0                	add    %edx,%eax
c0106752:	c1 e0 03             	shl    $0x3,%eax
c0106755:	89 c2                	mov    %eax,%edx
c0106757:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010675a:	01 d0                	add    %edx,%eax
c010675c:	83 c0 08             	add    $0x8,%eax
c010675f:	83 ec 08             	sub    $0x8,%esp
c0106762:	ff 75 d0             	pushl  -0x30(%ebp)
c0106765:	50                   	push   %eax
c0106766:	e8 95 3a 00 00       	call   c010a200 <appendToDoubleLinkList>
c010676b:	83 c4 10             	add    $0x10,%esp
c010676e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106771:	8b 40 04             	mov    0x4(%eax),%eax
c0106774:	8d 50 01             	lea    0x1(%eax),%edx
c0106777:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010677a:	89 50 04             	mov    %edx,0x4(%eax)
c010677d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106780:	8b 50 04             	mov    0x4(%eax),%edx
c0106783:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106786:	39 c2                	cmp    %eax,%edx
c0106788:	75 12                	jne    c010679c <sys_free2+0x177>
c010678a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010678d:	83 ec 08             	sub    $0x8,%esp
c0106790:	ff 75 f4             	pushl  -0xc(%ebp)
c0106793:	50                   	push   %eax
c0106794:	e8 e5 fd ff ff       	call   c010657e <free_a_page>
c0106799:	83 c4 10             	add    $0x10,%esp
c010679c:	83 ec 0c             	sub    $0xc,%esp
c010679f:	ff 75 d8             	pushl  -0x28(%ebp)
c01067a2:	e8 4a 05 00 00       	call   c0106cf1 <intr_set_status>
c01067a7:	83 c4 10             	add    $0x10,%esp
c01067aa:	90                   	nop
c01067ab:	c9                   	leave  
c01067ac:	c3                   	ret    

c01067ad <init_memory_block_desc>:
c01067ad:	55                   	push   %ebp
c01067ae:	89 e5                	mov    %esp,%ebp
c01067b0:	83 ec 18             	sub    $0x18,%esp
c01067b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01067ba:	e9 b2 00 00 00       	jmp    c0106871 <init_memory_block_desc+0xc4>
c01067bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01067c3:	75 1b                	jne    c01067e0 <init_memory_block_desc+0x33>
c01067c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067c8:	89 d0                	mov    %edx,%eax
c01067ca:	01 c0                	add    %eax,%eax
c01067cc:	01 d0                	add    %edx,%eax
c01067ce:	c1 e0 03             	shl    $0x3,%eax
c01067d1:	89 c2                	mov    %eax,%edx
c01067d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01067d6:	01 d0                	add    %edx,%eax
c01067d8:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c01067de:	eb 2e                	jmp    c010680e <init_memory_block_desc+0x61>
c01067e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067e3:	89 d0                	mov    %edx,%eax
c01067e5:	01 c0                	add    %eax,%eax
c01067e7:	01 d0                	add    %edx,%eax
c01067e9:	c1 e0 03             	shl    $0x3,%eax
c01067ec:	8d 50 e8             	lea    -0x18(%eax),%edx
c01067ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01067f2:	01 d0                	add    %edx,%eax
c01067f4:	8b 08                	mov    (%eax),%ecx
c01067f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067f9:	89 d0                	mov    %edx,%eax
c01067fb:	01 c0                	add    %eax,%eax
c01067fd:	01 d0                	add    %edx,%eax
c01067ff:	c1 e0 03             	shl    $0x3,%eax
c0106802:	89 c2                	mov    %eax,%edx
c0106804:	8b 45 08             	mov    0x8(%ebp),%eax
c0106807:	01 d0                	add    %edx,%eax
c0106809:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c010680c:	89 10                	mov    %edx,(%eax)
c010680e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106811:	89 d0                	mov    %edx,%eax
c0106813:	01 c0                	add    %eax,%eax
c0106815:	01 d0                	add    %edx,%eax
c0106817:	c1 e0 03             	shl    $0x3,%eax
c010681a:	89 c2                	mov    %eax,%edx
c010681c:	8b 45 08             	mov    0x8(%ebp),%eax
c010681f:	01 d0                	add    %edx,%eax
c0106821:	8b 00                	mov    (%eax),%eax
c0106823:	89 c1                	mov    %eax,%ecx
c0106825:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c010682a:	ba 00 00 00 00       	mov    $0x0,%edx
c010682f:	f7 f1                	div    %ecx
c0106831:	89 c1                	mov    %eax,%ecx
c0106833:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106836:	89 d0                	mov    %edx,%eax
c0106838:	01 c0                	add    %eax,%eax
c010683a:	01 d0                	add    %edx,%eax
c010683c:	c1 e0 03             	shl    $0x3,%eax
c010683f:	89 c2                	mov    %eax,%edx
c0106841:	8b 45 08             	mov    0x8(%ebp),%eax
c0106844:	01 d0                	add    %edx,%eax
c0106846:	89 ca                	mov    %ecx,%edx
c0106848:	89 50 04             	mov    %edx,0x4(%eax)
c010684b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010684e:	89 d0                	mov    %edx,%eax
c0106850:	01 c0                	add    %eax,%eax
c0106852:	01 d0                	add    %edx,%eax
c0106854:	c1 e0 03             	shl    $0x3,%eax
c0106857:	89 c2                	mov    %eax,%edx
c0106859:	8b 45 08             	mov    0x8(%ebp),%eax
c010685c:	01 d0                	add    %edx,%eax
c010685e:	83 c0 08             	add    $0x8,%eax
c0106861:	83 ec 0c             	sub    $0xc,%esp
c0106864:	50                   	push   %eax
c0106865:	e8 6b 38 00 00       	call   c010a0d5 <initDoubleLinkList>
c010686a:	83 c4 10             	add    $0x10,%esp
c010686d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0106871:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0106875:	0f 8e 44 ff ff ff    	jle    c01067bf <init_memory_block_desc+0x12>
c010687b:	90                   	nop
c010687c:	c9                   	leave  
c010687d:	c3                   	ret    

c010687e <init_memory2>:
c010687e:	55                   	push   %ebp
c010687f:	89 e5                	mov    %esp,%ebp
c0106881:	83 ec 38             	sub    $0x38,%esp
c0106884:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c010688b:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106892:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106895:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c010689a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010689d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01068a2:	29 c2                	sub    %eax,%edx
c01068a4:	89 d0                	mov    %edx,%eax
c01068a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01068a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01068ac:	89 c2                	mov    %eax,%edx
c01068ae:	c1 ea 1f             	shr    $0x1f,%edx
c01068b1:	01 d0                	add    %edx,%eax
c01068b3:	d1 f8                	sar    %eax
c01068b5:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c01068ba:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01068bf:	83 ec 0c             	sub    $0xc,%esp
c01068c2:	50                   	push   %eax
c01068c3:	e8 52 08 00 00       	call   c010711a <disp_int>
c01068c8:	83 c4 10             	add    $0x10,%esp
c01068cb:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01068d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01068d3:	29 c2                	sub    %eax,%edx
c01068d5:	89 d0                	mov    %edx,%eax
c01068d7:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c01068dc:	83 ec 0c             	sub    $0xc,%esp
c01068df:	68 f9 b5 10 c0       	push   $0xc010b5f9
c01068e4:	e8 a3 97 ff ff       	call   c010008c <disp_str>
c01068e9:	83 c4 10             	add    $0x10,%esp
c01068ec:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c01068f1:	83 ec 0c             	sub    $0xc,%esp
c01068f4:	50                   	push   %eax
c01068f5:	e8 20 08 00 00       	call   c010711a <disp_int>
c01068fa:	83 c4 10             	add    $0x10,%esp
c01068fd:	83 ec 0c             	sub    $0xc,%esp
c0106900:	68 f9 b5 10 c0       	push   $0xc010b5f9
c0106905:	e8 82 97 ff ff       	call   c010008c <disp_str>
c010690a:	83 c4 10             	add    $0x10,%esp
c010690d:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106912:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106917:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010691d:	85 c0                	test   %eax,%eax
c010691f:	0f 48 c2             	cmovs  %edx,%eax
c0106922:	c1 f8 0c             	sar    $0xc,%eax
c0106925:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106928:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010692b:	83 c0 07             	add    $0x7,%eax
c010692e:	8d 50 07             	lea    0x7(%eax),%edx
c0106931:	85 c0                	test   %eax,%eax
c0106933:	0f 48 c2             	cmovs  %edx,%eax
c0106936:	c1 f8 03             	sar    $0x3,%eax
c0106939:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c010693e:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106943:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106948:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c010694d:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106953:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106958:	83 ec 04             	sub    $0x4,%esp
c010695b:	52                   	push   %edx
c010695c:	6a 00                	push   $0x0
c010695e:	50                   	push   %eax
c010695f:	e8 6b 58 00 00       	call   c010c1cf <Memset>
c0106964:	83 c4 10             	add    $0x10,%esp
c0106967:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c010696c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106971:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106977:	85 c0                	test   %eax,%eax
c0106979:	0f 48 c2             	cmovs  %edx,%eax
c010697c:	c1 f8 0c             	sar    $0xc,%eax
c010697f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106982:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106985:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106988:	ff 75 e8             	pushl  -0x18(%ebp)
c010698b:	6a 01                	push   $0x1
c010698d:	6a 00                	push   $0x0
c010698f:	68 ac 06 11 c0       	push   $0xc01106ac
c0106994:	e8 37 f1 ff ff       	call   c0105ad0 <set_bits>
c0106999:	83 c4 10             	add    $0x10,%esp
c010699c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c01069a1:	05 ff 0f 00 00       	add    $0xfff,%eax
c01069a6:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069ac:	85 c0                	test   %eax,%eax
c01069ae:	0f 48 c2             	cmovs  %edx,%eax
c01069b1:	c1 f8 0c             	sar    $0xc,%eax
c01069b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01069b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01069ba:	83 c0 07             	add    $0x7,%eax
c01069bd:	8d 50 07             	lea    0x7(%eax),%edx
c01069c0:	85 c0                	test   %eax,%eax
c01069c2:	0f 48 c2             	cmovs  %edx,%eax
c01069c5:	c1 f8 03             	sar    $0x3,%eax
c01069c8:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c01069cd:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01069d2:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01069d8:	01 d0                	add    %edx,%eax
c01069da:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c01069df:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c01069e5:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c01069ea:	83 ec 04             	sub    $0x4,%esp
c01069ed:	52                   	push   %edx
c01069ee:	6a 00                	push   $0x0
c01069f0:	50                   	push   %eax
c01069f1:	e8 d9 57 00 00       	call   c010c1cf <Memset>
c01069f6:	83 c4 10             	add    $0x10,%esp
c01069f9:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01069fe:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a03:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a09:	85 c0                	test   %eax,%eax
c0106a0b:	0f 48 c2             	cmovs  %edx,%eax
c0106a0e:	c1 f8 0c             	sar    $0xc,%eax
c0106a11:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106a17:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a1a:	ff 75 e8             	pushl  -0x18(%ebp)
c0106a1d:	6a 01                	push   $0x1
c0106a1f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106a22:	68 ac 06 11 c0       	push   $0xc01106ac
c0106a27:	e8 a4 f0 ff ff       	call   c0105ad0 <set_bits>
c0106a2c:	83 c4 10             	add    $0x10,%esp
c0106a2f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106a36:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106a39:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106a3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106a3f:	83 c0 07             	add    $0x7,%eax
c0106a42:	8d 50 07             	lea    0x7(%eax),%edx
c0106a45:	85 c0                	test   %eax,%eax
c0106a47:	0f 48 c2             	cmovs  %edx,%eax
c0106a4a:	c1 f8 03             	sar    $0x3,%eax
c0106a4d:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106a52:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106a57:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106a5d:	01 c2                	add    %eax,%edx
c0106a5f:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106a64:	01 d0                	add    %edx,%eax
c0106a66:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106a6b:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106a71:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106a76:	83 ec 04             	sub    $0x4,%esp
c0106a79:	52                   	push   %edx
c0106a7a:	6a 00                	push   $0x0
c0106a7c:	50                   	push   %eax
c0106a7d:	e8 4d 57 00 00       	call   c010c1cf <Memset>
c0106a82:	83 c4 10             	add    $0x10,%esp
c0106a85:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106a88:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a8b:	01 d0                	add    %edx,%eax
c0106a8d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a90:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106a95:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a9a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106aa0:	85 c0                	test   %eax,%eax
c0106aa2:	0f 48 c2             	cmovs  %edx,%eax
c0106aa5:	c1 f8 0c             	sar    $0xc,%eax
c0106aa8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106aab:	ff 75 e8             	pushl  -0x18(%ebp)
c0106aae:	6a 01                	push   $0x1
c0106ab0:	ff 75 e0             	pushl  -0x20(%ebp)
c0106ab3:	68 ac 06 11 c0       	push   $0xc01106ac
c0106ab8:	e8 13 f0 ff ff       	call   c0105ad0 <set_bits>
c0106abd:	83 c4 10             	add    $0x10,%esp
c0106ac0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106ac3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ac6:	01 d0                	add    %edx,%eax
c0106ac8:	c1 e0 0c             	shl    $0xc,%eax
c0106acb:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106ad0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ad3:	83 c0 02             	add    $0x2,%eax
c0106ad6:	c1 e0 0c             	shl    $0xc,%eax
c0106ad9:	89 c2                	mov    %eax,%edx
c0106adb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106ade:	01 d0                	add    %edx,%eax
c0106ae0:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106ae5:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106aec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106aef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106af2:	90                   	nop
c0106af3:	c9                   	leave  
c0106af4:	c3                   	ret    

c0106af5 <init_memory>:
c0106af5:	55                   	push   %ebp
c0106af6:	89 e5                	mov    %esp,%ebp
c0106af8:	83 ec 38             	sub    $0x38,%esp
c0106afb:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106b02:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106b09:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106b10:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106b13:	05 00 00 40 00       	add    $0x400000,%eax
c0106b18:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b1e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106b21:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106b27:	85 c0                	test   %eax,%eax
c0106b29:	0f 48 c2             	cmovs  %edx,%eax
c0106b2c:	c1 f8 0c             	sar    $0xc,%eax
c0106b2f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106b32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106b35:	89 c2                	mov    %eax,%edx
c0106b37:	c1 ea 1f             	shr    $0x1f,%edx
c0106b3a:	01 d0                	add    %edx,%eax
c0106b3c:	d1 f8                	sar    %eax
c0106b3e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106b41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106b44:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106b47:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106b4a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106b4d:	8d 50 07             	lea    0x7(%eax),%edx
c0106b50:	85 c0                	test   %eax,%eax
c0106b52:	0f 48 c2             	cmovs  %edx,%eax
c0106b55:	c1 f8 03             	sar    $0x3,%eax
c0106b58:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106b5b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106b5e:	8d 50 07             	lea    0x7(%eax),%edx
c0106b61:	85 c0                	test   %eax,%eax
c0106b63:	0f 48 c2             	cmovs  %edx,%eax
c0106b66:	c1 f8 03             	sar    $0x3,%eax
c0106b69:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106b6c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b6f:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106b74:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106b79:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106b7c:	c1 e2 0c             	shl    $0xc,%edx
c0106b7f:	01 d0                	add    %edx,%eax
c0106b81:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106b86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b89:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106b8e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b91:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106b96:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106b9b:	83 ec 04             	sub    $0x4,%esp
c0106b9e:	ff 75 d8             	pushl  -0x28(%ebp)
c0106ba1:	6a 00                	push   $0x0
c0106ba3:	50                   	push   %eax
c0106ba4:	e8 26 56 00 00       	call   c010c1cf <Memset>
c0106ba9:	83 c4 10             	add    $0x10,%esp
c0106bac:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106baf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106bb2:	01 d0                	add    %edx,%eax
c0106bb4:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106bb9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106bbc:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106bc1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106bc6:	83 ec 04             	sub    $0x4,%esp
c0106bc9:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106bcc:	6a 00                	push   $0x0
c0106bce:	50                   	push   %eax
c0106bcf:	e8 fb 55 00 00       	call   c010c1cf <Memset>
c0106bd4:	83 c4 10             	add    $0x10,%esp
c0106bd7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106bda:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106bdf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106be2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106be5:	01 c2                	add    %eax,%edx
c0106be7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106bea:	01 d0                	add    %edx,%eax
c0106bec:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106bf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106bf4:	05 00 00 10 00       	add    $0x100000,%eax
c0106bf9:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106bfe:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106c03:	83 ec 04             	sub    $0x4,%esp
c0106c06:	ff 75 d8             	pushl  -0x28(%ebp)
c0106c09:	6a 00                	push   $0x0
c0106c0b:	50                   	push   %eax
c0106c0c:	e8 be 55 00 00       	call   c010c1cf <Memset>
c0106c11:	83 c4 10             	add    $0x10,%esp
c0106c14:	83 ec 04             	sub    $0x4,%esp
c0106c17:	68 f0 00 00 00       	push   $0xf0
c0106c1c:	6a 00                	push   $0x0
c0106c1e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106c23:	e8 a7 55 00 00       	call   c010c1cf <Memset>
c0106c28:	83 c4 10             	add    $0x10,%esp
c0106c2b:	83 ec 0c             	sub    $0xc,%esp
c0106c2e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106c33:	e8 75 fb ff ff       	call   c01067ad <init_memory_block_desc>
c0106c38:	83 c4 10             	add    $0x10,%esp
c0106c3b:	90                   	nop
c0106c3c:	c9                   	leave  
c0106c3d:	c3                   	ret    

c0106c3e <stop_here>:
c0106c3e:	55                   	push   %ebp
c0106c3f:	89 e5                	mov    %esp,%ebp
c0106c41:	83 ec 08             	sub    $0x8,%esp
c0106c44:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106c4b:	00 00 00 
c0106c4e:	83 ec 0c             	sub    $0xc,%esp
c0106c51:	68 00 b6 10 c0       	push   $0xc010b600
c0106c56:	e8 31 94 ff ff       	call   c010008c <disp_str>
c0106c5b:	83 c4 10             	add    $0x10,%esp
c0106c5e:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106c63:	83 ec 0c             	sub    $0xc,%esp
c0106c66:	50                   	push   %eax
c0106c67:	e8 ae 04 00 00       	call   c010711a <disp_int>
c0106c6c:	83 c4 10             	add    $0x10,%esp
c0106c6f:	83 ec 0c             	sub    $0xc,%esp
c0106c72:	68 02 b6 10 c0       	push   $0xc010b602
c0106c77:	e8 10 94 ff ff       	call   c010008c <disp_str>
c0106c7c:	83 c4 10             	add    $0x10,%esp
c0106c7f:	90                   	nop
c0106c80:	c9                   	leave  
c0106c81:	c3                   	ret    

c0106c82 <catch_error>:
c0106c82:	55                   	push   %ebp
c0106c83:	89 e5                	mov    %esp,%ebp
c0106c85:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106c8a:	83 c0 01             	add    $0x1,%eax
c0106c8d:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106c92:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106c97:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106c9c:	90                   	nop
c0106c9d:	5d                   	pop    %ebp
c0106c9e:	c3                   	ret    

c0106c9f <intr_enable>:
c0106c9f:	55                   	push   %ebp
c0106ca0:	89 e5                	mov    %esp,%ebp
c0106ca2:	83 ec 18             	sub    $0x18,%esp
c0106ca5:	e8 65 00 00 00       	call   c0106d0f <intr_get_status>
c0106caa:	83 f8 01             	cmp    $0x1,%eax
c0106cad:	75 0c                	jne    c0106cbb <intr_enable+0x1c>
c0106caf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106cb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cb9:	eb 0b                	jmp    c0106cc6 <intr_enable+0x27>
c0106cbb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106cc2:	fb                   	sti    
c0106cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cc6:	c9                   	leave  
c0106cc7:	c3                   	ret    

c0106cc8 <intr_disable>:
c0106cc8:	55                   	push   %ebp
c0106cc9:	89 e5                	mov    %esp,%ebp
c0106ccb:	83 ec 18             	sub    $0x18,%esp
c0106cce:	e8 3c 00 00 00       	call   c0106d0f <intr_get_status>
c0106cd3:	83 f8 01             	cmp    $0x1,%eax
c0106cd6:	75 0d                	jne    c0106ce5 <intr_disable+0x1d>
c0106cd8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106cdf:	fa                   	cli    
c0106ce0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ce3:	eb 0a                	jmp    c0106cef <intr_disable+0x27>
c0106ce5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106cec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cef:	c9                   	leave  
c0106cf0:	c3                   	ret    

c0106cf1 <intr_set_status>:
c0106cf1:	55                   	push   %ebp
c0106cf2:	89 e5                	mov    %esp,%ebp
c0106cf4:	83 ec 08             	sub    $0x8,%esp
c0106cf7:	8b 45 08             	mov    0x8(%ebp),%eax
c0106cfa:	83 e0 01             	and    $0x1,%eax
c0106cfd:	85 c0                	test   %eax,%eax
c0106cff:	74 07                	je     c0106d08 <intr_set_status+0x17>
c0106d01:	e8 99 ff ff ff       	call   c0106c9f <intr_enable>
c0106d06:	eb 05                	jmp    c0106d0d <intr_set_status+0x1c>
c0106d08:	e8 bb ff ff ff       	call   c0106cc8 <intr_disable>
c0106d0d:	c9                   	leave  
c0106d0e:	c3                   	ret    

c0106d0f <intr_get_status>:
c0106d0f:	55                   	push   %ebp
c0106d10:	89 e5                	mov    %esp,%ebp
c0106d12:	83 ec 10             	sub    $0x10,%esp
c0106d15:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106d1c:	9c                   	pushf  
c0106d1d:	58                   	pop    %eax
c0106d1e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106d21:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106d24:	c1 e8 09             	shr    $0x9,%eax
c0106d27:	83 e0 01             	and    $0x1,%eax
c0106d2a:	c9                   	leave  
c0106d2b:	c3                   	ret    

c0106d2c <Memcpy>:
c0106d2c:	55                   	push   %ebp
c0106d2d:	89 e5                	mov    %esp,%ebp
c0106d2f:	83 ec 18             	sub    $0x18,%esp
c0106d32:	e8 91 ff ff ff       	call   c0106cc8 <intr_disable>
c0106d37:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106d3a:	83 ec 04             	sub    $0x4,%esp
c0106d3d:	ff 75 10             	pushl  0x10(%ebp)
c0106d40:	ff 75 0c             	pushl  0xc(%ebp)
c0106d43:	ff 75 08             	pushl  0x8(%ebp)
c0106d46:	e8 56 54 00 00       	call   c010c1a1 <Memcpy2>
c0106d4b:	83 c4 10             	add    $0x10,%esp
c0106d4e:	83 ec 0c             	sub    $0xc,%esp
c0106d51:	ff 75 f4             	pushl  -0xc(%ebp)
c0106d54:	e8 98 ff ff ff       	call   c0106cf1 <intr_set_status>
c0106d59:	83 c4 10             	add    $0x10,%esp
c0106d5c:	90                   	nop
c0106d5d:	c9                   	leave  
c0106d5e:	c3                   	ret    

c0106d5f <untar>:
c0106d5f:	55                   	push   %ebp
c0106d60:	89 e5                	mov    %esp,%ebp
c0106d62:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106d68:	83 ec 08             	sub    $0x8,%esp
c0106d6b:	6a 00                	push   $0x0
c0106d6d:	ff 75 08             	pushl  0x8(%ebp)
c0106d70:	e8 2a de ff ff       	call   c0104b9f <open>
c0106d75:	83 c4 10             	add    $0x10,%esp
c0106d78:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106d7b:	83 ec 0c             	sub    $0xc,%esp
c0106d7e:	68 04 b6 10 c0       	push   $0xc010b604
c0106d83:	e8 60 18 00 00       	call   c01085e8 <Printf>
c0106d88:	83 c4 10             	add    $0x10,%esp
c0106d8b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106d92:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106d99:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106da0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106da7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106dae:	e9 63 02 00 00       	jmp    c0107016 <untar+0x2b7>
c0106db3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106db7:	7e 58                	jle    c0106e11 <untar+0xb2>
c0106db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106dbc:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106dc1:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106dc7:	85 c0                	test   %eax,%eax
c0106dc9:	0f 48 c2             	cmovs  %edx,%eax
c0106dcc:	c1 f8 09             	sar    $0x9,%eax
c0106dcf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106dd2:	83 ec 04             	sub    $0x4,%esp
c0106dd5:	68 00 02 00 00       	push   $0x200
c0106dda:	6a 00                	push   $0x0
c0106ddc:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106de2:	50                   	push   %eax
c0106de3:	e8 e7 53 00 00       	call   c010c1cf <Memset>
c0106de8:	83 c4 10             	add    $0x10,%esp
c0106deb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106dee:	c1 e0 09             	shl    $0x9,%eax
c0106df1:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106df4:	83 ec 04             	sub    $0x4,%esp
c0106df7:	50                   	push   %eax
c0106df8:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106dfe:	50                   	push   %eax
c0106dff:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106e02:	e8 2d de ff ff       	call   c0104c34 <read>
c0106e07:	83 c4 10             	add    $0x10,%esp
c0106e0a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106e11:	83 ec 04             	sub    $0x4,%esp
c0106e14:	68 00 02 00 00       	push   $0x200
c0106e19:	6a 00                	push   $0x0
c0106e1b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e21:	50                   	push   %eax
c0106e22:	e8 a8 53 00 00       	call   c010c1cf <Memset>
c0106e27:	83 c4 10             	add    $0x10,%esp
c0106e2a:	83 ec 04             	sub    $0x4,%esp
c0106e2d:	68 00 02 00 00       	push   $0x200
c0106e32:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e38:	50                   	push   %eax
c0106e39:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106e3c:	e8 f3 dd ff ff       	call   c0104c34 <read>
c0106e41:	83 c4 10             	add    $0x10,%esp
c0106e44:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106e47:	83 ec 0c             	sub    $0xc,%esp
c0106e4a:	68 16 b6 10 c0       	push   $0xc010b616
c0106e4f:	e8 94 17 00 00       	call   c01085e8 <Printf>
c0106e54:	83 c4 10             	add    $0x10,%esp
c0106e57:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106e5b:	0f 84 c1 01 00 00    	je     c0107022 <untar+0x2c3>
c0106e61:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106e64:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106e67:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106e6e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e74:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106e77:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106e7a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106e7d:	83 ec 08             	sub    $0x8,%esp
c0106e80:	6a 07                	push   $0x7
c0106e82:	ff 75 cc             	pushl  -0x34(%ebp)
c0106e85:	e8 15 dd ff ff       	call   c0104b9f <open>
c0106e8a:	83 c4 10             	add    $0x10,%esp
c0106e8d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106e90:	83 ec 0c             	sub    $0xc,%esp
c0106e93:	68 28 b6 10 c0       	push   $0xc010b628
c0106e98:	e8 4b 17 00 00       	call   c01085e8 <Printf>
c0106e9d:	83 c4 10             	add    $0x10,%esp
c0106ea0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106ea7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106eaa:	83 c0 7c             	add    $0x7c,%eax
c0106ead:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106eb0:	83 ec 0c             	sub    $0xc,%esp
c0106eb3:	ff 75 cc             	pushl  -0x34(%ebp)
c0106eb6:	e8 4d 53 00 00       	call   c010c208 <Strlen>
c0106ebb:	83 c4 10             	add    $0x10,%esp
c0106ebe:	85 c0                	test   %eax,%eax
c0106ec0:	75 28                	jne    c0106eea <untar+0x18b>
c0106ec2:	83 ec 0c             	sub    $0xc,%esp
c0106ec5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106ec8:	e8 3b 53 00 00       	call   c010c208 <Strlen>
c0106ecd:	83 c4 10             	add    $0x10,%esp
c0106ed0:	85 c0                	test   %eax,%eax
c0106ed2:	75 16                	jne    c0106eea <untar+0x18b>
c0106ed4:	83 ec 0c             	sub    $0xc,%esp
c0106ed7:	68 3a b6 10 c0       	push   $0xc010b63a
c0106edc:	e8 07 17 00 00       	call   c01085e8 <Printf>
c0106ee1:	83 c4 10             	add    $0x10,%esp
c0106ee4:	90                   	nop
c0106ee5:	e9 39 01 00 00       	jmp    c0107023 <untar+0x2c4>
c0106eea:	83 ec 0c             	sub    $0xc,%esp
c0106eed:	68 41 b6 10 c0       	push   $0xc010b641
c0106ef2:	e8 f1 16 00 00       	call   c01085e8 <Printf>
c0106ef7:	83 c4 10             	add    $0x10,%esp
c0106efa:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106efd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106f00:	eb 1f                	jmp    c0106f21 <untar+0x1c2>
c0106f02:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f05:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106f0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106f0f:	0f b6 00             	movzbl (%eax),%eax
c0106f12:	0f be c0             	movsbl %al,%eax
c0106f15:	83 e8 30             	sub    $0x30,%eax
c0106f18:	01 d0                	add    %edx,%eax
c0106f1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106f1d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106f21:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106f24:	0f b6 00             	movzbl (%eax),%eax
c0106f27:	84 c0                	test   %al,%al
c0106f29:	75 d7                	jne    c0106f02 <untar+0x1a3>
c0106f2b:	83 ec 0c             	sub    $0xc,%esp
c0106f2e:	68 4f b6 10 c0       	push   $0xc010b64f
c0106f33:	e8 b0 16 00 00       	call   c01085e8 <Printf>
c0106f38:	83 c4 10             	add    $0x10,%esp
c0106f3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f3e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106f41:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106f48:	83 ec 08             	sub    $0x8,%esp
c0106f4b:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f4e:	68 5d b6 10 c0       	push   $0xc010b65d
c0106f53:	e8 90 16 00 00       	call   c01085e8 <Printf>
c0106f58:	83 c4 10             	add    $0x10,%esp
c0106f5b:	83 ec 08             	sub    $0x8,%esp
c0106f5e:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f61:	68 6f b6 10 c0       	push   $0xc010b66f
c0106f66:	e8 7d 16 00 00       	call   c01085e8 <Printf>
c0106f6b:	83 c4 10             	add    $0x10,%esp
c0106f6e:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106f71:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106f74:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106f78:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106f7b:	e8 02 fd ff ff       	call   c0106c82 <catch_error>
c0106f80:	83 ec 04             	sub    $0x4,%esp
c0106f83:	ff 75 b8             	pushl  -0x48(%ebp)
c0106f86:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106f8c:	50                   	push   %eax
c0106f8d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106f90:	e8 9f dc ff ff       	call   c0104c34 <read>
c0106f95:	83 c4 10             	add    $0x10,%esp
c0106f98:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106f9b:	83 ec 04             	sub    $0x4,%esp
c0106f9e:	ff 75 b8             	pushl  -0x48(%ebp)
c0106fa1:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106fa7:	50                   	push   %eax
c0106fa8:	ff 75 c8             	pushl  -0x38(%ebp)
c0106fab:	e8 05 de ff ff       	call   c0104db5 <write>
c0106fb0:	83 c4 10             	add    $0x10,%esp
c0106fb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fb6:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106fb9:	7d 02                	jge    c0106fbd <untar+0x25e>
c0106fbb:	eb be                	jmp    c0106f7b <untar+0x21c>
c0106fbd:	90                   	nop
c0106fbe:	83 ec 08             	sub    $0x8,%esp
c0106fc1:	ff 75 f4             	pushl  -0xc(%ebp)
c0106fc4:	68 81 b6 10 c0       	push   $0xc010b681
c0106fc9:	e8 1a 16 00 00       	call   c01085e8 <Printf>
c0106fce:	83 c4 10             	add    $0x10,%esp
c0106fd1:	83 ec 08             	sub    $0x8,%esp
c0106fd4:	ff 75 c0             	pushl  -0x40(%ebp)
c0106fd7:	68 93 b6 10 c0       	push   $0xc010b693
c0106fdc:	e8 07 16 00 00       	call   c01085e8 <Printf>
c0106fe1:	83 c4 10             	add    $0x10,%esp
c0106fe4:	83 ec 0c             	sub    $0xc,%esp
c0106fe7:	68 a4 b6 10 c0       	push   $0xc010b6a4
c0106fec:	e8 f7 15 00 00       	call   c01085e8 <Printf>
c0106ff1:	83 c4 10             	add    $0x10,%esp
c0106ff4:	83 ec 0c             	sub    $0xc,%esp
c0106ff7:	ff 75 c8             	pushl  -0x38(%ebp)
c0106ffa:	e8 3b de ff ff       	call   c0104e3a <close>
c0106fff:	83 c4 10             	add    $0x10,%esp
c0107002:	83 ec 0c             	sub    $0xc,%esp
c0107005:	68 b2 b6 10 c0       	push   $0xc010b6b2
c010700a:	e8 d9 15 00 00       	call   c01085e8 <Printf>
c010700f:	83 c4 10             	add    $0x10,%esp
c0107012:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0107016:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010701a:	0f 8f 93 fd ff ff    	jg     c0106db3 <untar+0x54>
c0107020:	eb 01                	jmp    c0107023 <untar+0x2c4>
c0107022:	90                   	nop
c0107023:	83 ec 0c             	sub    $0xc,%esp
c0107026:	68 bf b6 10 c0       	push   $0xc010b6bf
c010702b:	e8 b8 15 00 00       	call   c01085e8 <Printf>
c0107030:	83 c4 10             	add    $0x10,%esp
c0107033:	83 ec 0c             	sub    $0xc,%esp
c0107036:	68 d1 b6 10 c0       	push   $0xc010b6d1
c010703b:	e8 a8 15 00 00       	call   c01085e8 <Printf>
c0107040:	83 c4 10             	add    $0x10,%esp
c0107043:	83 ec 0c             	sub    $0xc,%esp
c0107046:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107049:	e8 ec dd ff ff       	call   c0104e3a <close>
c010704e:	83 c4 10             	add    $0x10,%esp
c0107051:	83 ec 0c             	sub    $0xc,%esp
c0107054:	68 e1 b6 10 c0       	push   $0xc010b6e1
c0107059:	e8 8a 15 00 00       	call   c01085e8 <Printf>
c010705e:	83 c4 10             	add    $0x10,%esp
c0107061:	83 ec 0c             	sub    $0xc,%esp
c0107064:	68 f4 b6 10 c0       	push   $0xc010b6f4
c0107069:	e8 7a 15 00 00       	call   c01085e8 <Printf>
c010706e:	83 c4 10             	add    $0x10,%esp
c0107071:	90                   	nop
c0107072:	c9                   	leave  
c0107073:	c3                   	ret    

c0107074 <atoi>:
c0107074:	55                   	push   %ebp
c0107075:	89 e5                	mov    %esp,%ebp
c0107077:	83 ec 10             	sub    $0x10,%esp
c010707a:	8b 45 08             	mov    0x8(%ebp),%eax
c010707d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107080:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107083:	8d 50 01             	lea    0x1(%eax),%edx
c0107086:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107089:	c6 00 30             	movb   $0x30,(%eax)
c010708c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010708f:	8d 50 01             	lea    0x1(%eax),%edx
c0107092:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107095:	c6 00 78             	movb   $0x78,(%eax)
c0107098:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c010709c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01070a0:	75 0e                	jne    c01070b0 <atoi+0x3c>
c01070a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01070a5:	8d 50 01             	lea    0x1(%eax),%edx
c01070a8:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01070ab:	c6 00 30             	movb   $0x30,(%eax)
c01070ae:	eb 61                	jmp    c0107111 <atoi+0x9d>
c01070b0:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c01070b7:	eb 52                	jmp    c010710b <atoi+0x97>
c01070b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01070bc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01070bf:	89 c1                	mov    %eax,%ecx
c01070c1:	d3 fa                	sar    %cl,%edx
c01070c3:	89 d0                	mov    %edx,%eax
c01070c5:	83 e0 0f             	and    $0xf,%eax
c01070c8:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070cb:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c01070cf:	75 06                	jne    c01070d7 <atoi+0x63>
c01070d1:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c01070d5:	74 2f                	je     c0107106 <atoi+0x92>
c01070d7:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c01070db:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01070df:	83 c0 30             	add    $0x30,%eax
c01070e2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070e5:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c01070e9:	7e 0a                	jle    c01070f5 <atoi+0x81>
c01070eb:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01070ef:	83 c0 07             	add    $0x7,%eax
c01070f2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01070f8:	8d 50 01             	lea    0x1(%eax),%edx
c01070fb:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01070fe:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0107102:	88 10                	mov    %dl,(%eax)
c0107104:	eb 01                	jmp    c0107107 <atoi+0x93>
c0107106:	90                   	nop
c0107107:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010710b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010710f:	79 a8                	jns    c01070b9 <atoi+0x45>
c0107111:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107114:	c6 00 00             	movb   $0x0,(%eax)
c0107117:	90                   	nop
c0107118:	c9                   	leave  
c0107119:	c3                   	ret    

c010711a <disp_int>:
c010711a:	55                   	push   %ebp
c010711b:	89 e5                	mov    %esp,%ebp
c010711d:	83 ec 18             	sub    $0x18,%esp
c0107120:	ff 75 08             	pushl  0x8(%ebp)
c0107123:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107126:	50                   	push   %eax
c0107127:	e8 48 ff ff ff       	call   c0107074 <atoi>
c010712c:	83 c4 08             	add    $0x8,%esp
c010712f:	83 ec 08             	sub    $0x8,%esp
c0107132:	6a 0b                	push   $0xb
c0107134:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107137:	50                   	push   %eax
c0107138:	e8 8a 8f ff ff       	call   c01000c7 <disp_str_colour>
c010713d:	83 c4 10             	add    $0x10,%esp
c0107140:	90                   	nop
c0107141:	c9                   	leave  
c0107142:	c3                   	ret    

c0107143 <do_page_fault>:
c0107143:	55                   	push   %ebp
c0107144:	89 e5                	mov    %esp,%ebp
c0107146:	83 ec 28             	sub    $0x28,%esp
c0107149:	0f 20 d0             	mov    %cr2,%eax
c010714c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010714f:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107156:	00 00 00 
c0107159:	83 ec 0c             	sub    $0xc,%esp
c010715c:	68 ff b6 10 c0       	push   $0xc010b6ff
c0107161:	e8 26 8f ff ff       	call   c010008c <disp_str>
c0107166:	83 c4 10             	add    $0x10,%esp
c0107169:	83 ec 0c             	sub    $0xc,%esp
c010716c:	68 0e b7 10 c0       	push   $0xc010b70e
c0107171:	e8 16 8f ff ff       	call   c010008c <disp_str>
c0107176:	83 c4 10             	add    $0x10,%esp
c0107179:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010717c:	83 ec 0c             	sub    $0xc,%esp
c010717f:	50                   	push   %eax
c0107180:	e8 95 ff ff ff       	call   c010711a <disp_int>
c0107185:	83 c4 10             	add    $0x10,%esp
c0107188:	83 ec 0c             	sub    $0xc,%esp
c010718b:	68 13 b7 10 c0       	push   $0xc010b713
c0107190:	e8 f7 8e ff ff       	call   c010008c <disp_str>
c0107195:	83 c4 10             	add    $0x10,%esp
c0107198:	83 ec 0c             	sub    $0xc,%esp
c010719b:	ff 75 f4             	pushl  -0xc(%ebp)
c010719e:	e8 51 ec ff ff       	call   c0105df4 <ptr_pde>
c01071a3:	83 c4 10             	add    $0x10,%esp
c01071a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01071a9:	83 ec 0c             	sub    $0xc,%esp
c01071ac:	ff 75 f4             	pushl  -0xc(%ebp)
c01071af:	e8 53 ec ff ff       	call   c0105e07 <ptr_pte>
c01071b4:	83 c4 10             	add    $0x10,%esp
c01071b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01071ba:	83 ec 0c             	sub    $0xc,%esp
c01071bd:	68 15 b7 10 c0       	push   $0xc010b715
c01071c2:	e8 c5 8e ff ff       	call   c010008c <disp_str>
c01071c7:	83 c4 10             	add    $0x10,%esp
c01071ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01071cd:	83 ec 0c             	sub    $0xc,%esp
c01071d0:	50                   	push   %eax
c01071d1:	e8 44 ff ff ff       	call   c010711a <disp_int>
c01071d6:	83 c4 10             	add    $0x10,%esp
c01071d9:	83 ec 0c             	sub    $0xc,%esp
c01071dc:	68 1a b7 10 c0       	push   $0xc010b71a
c01071e1:	e8 a6 8e ff ff       	call   c010008c <disp_str>
c01071e6:	83 c4 10             	add    $0x10,%esp
c01071e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01071ec:	8b 00                	mov    (%eax),%eax
c01071ee:	83 ec 0c             	sub    $0xc,%esp
c01071f1:	50                   	push   %eax
c01071f2:	e8 23 ff ff ff       	call   c010711a <disp_int>
c01071f7:	83 c4 10             	add    $0x10,%esp
c01071fa:	83 ec 0c             	sub    $0xc,%esp
c01071fd:	68 13 b7 10 c0       	push   $0xc010b713
c0107202:	e8 85 8e ff ff       	call   c010008c <disp_str>
c0107207:	83 c4 10             	add    $0x10,%esp
c010720a:	83 ec 0c             	sub    $0xc,%esp
c010720d:	68 23 b7 10 c0       	push   $0xc010b723
c0107212:	e8 75 8e ff ff       	call   c010008c <disp_str>
c0107217:	83 c4 10             	add    $0x10,%esp
c010721a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010721d:	83 ec 0c             	sub    $0xc,%esp
c0107220:	50                   	push   %eax
c0107221:	e8 f4 fe ff ff       	call   c010711a <disp_int>
c0107226:	83 c4 10             	add    $0x10,%esp
c0107229:	83 ec 0c             	sub    $0xc,%esp
c010722c:	68 28 b7 10 c0       	push   $0xc010b728
c0107231:	e8 56 8e ff ff       	call   c010008c <disp_str>
c0107236:	83 c4 10             	add    $0x10,%esp
c0107239:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010723c:	8b 00                	mov    (%eax),%eax
c010723e:	83 ec 0c             	sub    $0xc,%esp
c0107241:	50                   	push   %eax
c0107242:	e8 d3 fe ff ff       	call   c010711a <disp_int>
c0107247:	83 c4 10             	add    $0x10,%esp
c010724a:	83 ec 0c             	sub    $0xc,%esp
c010724d:	68 13 b7 10 c0       	push   $0xc010b713
c0107252:	e8 35 8e ff ff       	call   c010008c <disp_str>
c0107257:	83 c4 10             	add    $0x10,%esp
c010725a:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0107261:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107264:	8b 00                	mov    (%eax),%eax
c0107266:	83 e0 01             	and    $0x1,%eax
c0107269:	85 c0                	test   %eax,%eax
c010726b:	74 09                	je     c0107276 <do_page_fault+0x133>
c010726d:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0107274:	eb 07                	jmp    c010727d <do_page_fault+0x13a>
c0107276:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010727d:	90                   	nop
c010727e:	c9                   	leave  
c010727f:	c3                   	ret    

c0107280 <exception_handler>:
c0107280:	55                   	push   %ebp
c0107281:	89 e5                	mov    %esp,%ebp
c0107283:	57                   	push   %edi
c0107284:	56                   	push   %esi
c0107285:	53                   	push   %ebx
c0107286:	83 ec 6c             	sub    $0x6c,%esp
c0107289:	8d 45 8c             	lea    -0x74(%ebp),%eax
c010728c:	bb a0 b9 10 c0       	mov    $0xc010b9a0,%ebx
c0107291:	ba 13 00 00 00       	mov    $0x13,%edx
c0107296:	89 c7                	mov    %eax,%edi
c0107298:	89 de                	mov    %ebx,%esi
c010729a:	89 d1                	mov    %edx,%ecx
c010729c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010729e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01072a5:	eb 04                	jmp    c01072ab <exception_handler+0x2b>
c01072a7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01072ab:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c01072b2:	7e f3                	jle    c01072a7 <exception_handler+0x27>
c01072b4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01072bb:	00 00 00 
c01072be:	83 ec 0c             	sub    $0xc,%esp
c01072c1:	68 31 b7 10 c0       	push   $0xc010b731
c01072c6:	e8 c1 8d ff ff       	call   c010008c <disp_str>
c01072cb:	83 c4 10             	add    $0x10,%esp
c01072ce:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c01072d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01072d8:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c01072dc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01072df:	83 ec 0c             	sub    $0xc,%esp
c01072e2:	ff 75 dc             	pushl  -0x24(%ebp)
c01072e5:	e8 a2 8d ff ff       	call   c010008c <disp_str>
c01072ea:	83 c4 10             	add    $0x10,%esp
c01072ed:	83 ec 0c             	sub    $0xc,%esp
c01072f0:	68 3f b7 10 c0       	push   $0xc010b73f
c01072f5:	e8 92 8d ff ff       	call   c010008c <disp_str>
c01072fa:	83 c4 10             	add    $0x10,%esp
c01072fd:	83 ec 0c             	sub    $0xc,%esp
c0107300:	68 42 b7 10 c0       	push   $0xc010b742
c0107305:	e8 82 8d ff ff       	call   c010008c <disp_str>
c010730a:	83 c4 10             	add    $0x10,%esp
c010730d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107310:	83 ec 0c             	sub    $0xc,%esp
c0107313:	50                   	push   %eax
c0107314:	e8 01 fe ff ff       	call   c010711a <disp_int>
c0107319:	83 c4 10             	add    $0x10,%esp
c010731c:	83 ec 0c             	sub    $0xc,%esp
c010731f:	68 3f b7 10 c0       	push   $0xc010b73f
c0107324:	e8 63 8d ff ff       	call   c010008c <disp_str>
c0107329:	83 c4 10             	add    $0x10,%esp
c010732c:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107330:	74 2f                	je     c0107361 <exception_handler+0xe1>
c0107332:	83 ec 0c             	sub    $0xc,%esp
c0107335:	68 4a b7 10 c0       	push   $0xc010b74a
c010733a:	e8 4d 8d ff ff       	call   c010008c <disp_str>
c010733f:	83 c4 10             	add    $0x10,%esp
c0107342:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107345:	83 ec 0c             	sub    $0xc,%esp
c0107348:	50                   	push   %eax
c0107349:	e8 cc fd ff ff       	call   c010711a <disp_int>
c010734e:	83 c4 10             	add    $0x10,%esp
c0107351:	83 ec 0c             	sub    $0xc,%esp
c0107354:	68 3f b7 10 c0       	push   $0xc010b73f
c0107359:	e8 2e 8d ff ff       	call   c010008c <disp_str>
c010735e:	83 c4 10             	add    $0x10,%esp
c0107361:	83 ec 0c             	sub    $0xc,%esp
c0107364:	68 54 b7 10 c0       	push   $0xc010b754
c0107369:	e8 1e 8d ff ff       	call   c010008c <disp_str>
c010736e:	83 c4 10             	add    $0x10,%esp
c0107371:	83 ec 0c             	sub    $0xc,%esp
c0107374:	ff 75 14             	pushl  0x14(%ebp)
c0107377:	e8 9e fd ff ff       	call   c010711a <disp_int>
c010737c:	83 c4 10             	add    $0x10,%esp
c010737f:	83 ec 0c             	sub    $0xc,%esp
c0107382:	68 3f b7 10 c0       	push   $0xc010b73f
c0107387:	e8 00 8d ff ff       	call   c010008c <disp_str>
c010738c:	83 c4 10             	add    $0x10,%esp
c010738f:	83 ec 0c             	sub    $0xc,%esp
c0107392:	68 58 b7 10 c0       	push   $0xc010b758
c0107397:	e8 f0 8c ff ff       	call   c010008c <disp_str>
c010739c:	83 c4 10             	add    $0x10,%esp
c010739f:	8b 45 10             	mov    0x10(%ebp),%eax
c01073a2:	83 ec 0c             	sub    $0xc,%esp
c01073a5:	50                   	push   %eax
c01073a6:	e8 6f fd ff ff       	call   c010711a <disp_int>
c01073ab:	83 c4 10             	add    $0x10,%esp
c01073ae:	83 ec 0c             	sub    $0xc,%esp
c01073b1:	68 3f b7 10 c0       	push   $0xc010b73f
c01073b6:	e8 d1 8c ff ff       	call   c010008c <disp_str>
c01073bb:	83 c4 10             	add    $0x10,%esp
c01073be:	83 ec 0c             	sub    $0xc,%esp
c01073c1:	68 5d b7 10 c0       	push   $0xc010b75d
c01073c6:	e8 c1 8c ff ff       	call   c010008c <disp_str>
c01073cb:	83 c4 10             	add    $0x10,%esp
c01073ce:	83 ec 0c             	sub    $0xc,%esp
c01073d1:	ff 75 18             	pushl  0x18(%ebp)
c01073d4:	e8 41 fd ff ff       	call   c010711a <disp_int>
c01073d9:	83 c4 10             	add    $0x10,%esp
c01073dc:	83 ec 0c             	sub    $0xc,%esp
c01073df:	68 3f b7 10 c0       	push   $0xc010b73f
c01073e4:	e8 a3 8c ff ff       	call   c010008c <disp_str>
c01073e9:	83 c4 10             	add    $0x10,%esp
c01073ec:	83 ec 0c             	sub    $0xc,%esp
c01073ef:	68 68 b7 10 c0       	push   $0xc010b768
c01073f4:	e8 93 8c ff ff       	call   c010008c <disp_str>
c01073f9:	83 c4 10             	add    $0x10,%esp
c01073fc:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0107400:	75 45                	jne    c0107447 <exception_handler+0x1c7>
c0107402:	0f 20 d0             	mov    %cr2,%eax
c0107405:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107408:	83 ec 0c             	sub    $0xc,%esp
c010740b:	68 87 b7 10 c0       	push   $0xc010b787
c0107410:	e8 77 8c ff ff       	call   c010008c <disp_str>
c0107415:	83 c4 10             	add    $0x10,%esp
c0107418:	83 ec 0c             	sub    $0xc,%esp
c010741b:	68 0e b7 10 c0       	push   $0xc010b70e
c0107420:	e8 67 8c ff ff       	call   c010008c <disp_str>
c0107425:	83 c4 10             	add    $0x10,%esp
c0107428:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010742b:	83 ec 0c             	sub    $0xc,%esp
c010742e:	50                   	push   %eax
c010742f:	e8 e6 fc ff ff       	call   c010711a <disp_int>
c0107434:	83 c4 10             	add    $0x10,%esp
c0107437:	83 ec 0c             	sub    $0xc,%esp
c010743a:	68 13 b7 10 c0       	push   $0xc010b713
c010743f:	e8 48 8c ff ff       	call   c010008c <disp_str>
c0107444:	83 c4 10             	add    $0x10,%esp
c0107447:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c010744b:	75 11                	jne    c010745e <exception_handler+0x1de>
c010744d:	83 ec 0c             	sub    $0xc,%esp
c0107450:	68 93 b7 10 c0       	push   $0xc010b793
c0107455:	e8 32 8c ff ff       	call   c010008c <disp_str>
c010745a:	83 c4 10             	add    $0x10,%esp
c010745d:	90                   	nop
c010745e:	90                   	nop
c010745f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107462:	5b                   	pop    %ebx
c0107463:	5e                   	pop    %esi
c0107464:	5f                   	pop    %edi
c0107465:	5d                   	pop    %ebp
c0107466:	c3                   	ret    

c0107467 <init_internal_interrupt>:
c0107467:	55                   	push   %ebp
c0107468:	89 e5                	mov    %esp,%ebp
c010746a:	83 ec 08             	sub    $0x8,%esp
c010746d:	6a 0e                	push   $0xe
c010746f:	6a 08                	push   $0x8
c0107471:	68 03 01 10 c0       	push   $0xc0100103
c0107476:	6a 00                	push   $0x0
c0107478:	e8 62 c7 ff ff       	call   c0103bdf <InitInterruptDesc>
c010747d:	83 c4 10             	add    $0x10,%esp
c0107480:	6a 0e                	push   $0xe
c0107482:	6a 08                	push   $0x8
c0107484:	68 09 01 10 c0       	push   $0xc0100109
c0107489:	6a 01                	push   $0x1
c010748b:	e8 4f c7 ff ff       	call   c0103bdf <InitInterruptDesc>
c0107490:	83 c4 10             	add    $0x10,%esp
c0107493:	6a 0e                	push   $0xe
c0107495:	6a 08                	push   $0x8
c0107497:	68 0f 01 10 c0       	push   $0xc010010f
c010749c:	6a 02                	push   $0x2
c010749e:	e8 3c c7 ff ff       	call   c0103bdf <InitInterruptDesc>
c01074a3:	83 c4 10             	add    $0x10,%esp
c01074a6:	6a 0e                	push   $0xe
c01074a8:	6a 08                	push   $0x8
c01074aa:	68 15 01 10 c0       	push   $0xc0100115
c01074af:	6a 03                	push   $0x3
c01074b1:	e8 29 c7 ff ff       	call   c0103bdf <InitInterruptDesc>
c01074b6:	83 c4 10             	add    $0x10,%esp
c01074b9:	6a 0e                	push   $0xe
c01074bb:	6a 08                	push   $0x8
c01074bd:	68 1b 01 10 c0       	push   $0xc010011b
c01074c2:	6a 04                	push   $0x4
c01074c4:	e8 16 c7 ff ff       	call   c0103bdf <InitInterruptDesc>
c01074c9:	83 c4 10             	add    $0x10,%esp
c01074cc:	6a 0e                	push   $0xe
c01074ce:	6a 08                	push   $0x8
c01074d0:	68 21 01 10 c0       	push   $0xc0100121
c01074d5:	6a 05                	push   $0x5
c01074d7:	e8 03 c7 ff ff       	call   c0103bdf <InitInterruptDesc>
c01074dc:	83 c4 10             	add    $0x10,%esp
c01074df:	6a 0e                	push   $0xe
c01074e1:	6a 08                	push   $0x8
c01074e3:	68 27 01 10 c0       	push   $0xc0100127
c01074e8:	6a 06                	push   $0x6
c01074ea:	e8 f0 c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c01074ef:	83 c4 10             	add    $0x10,%esp
c01074f2:	6a 0e                	push   $0xe
c01074f4:	6a 08                	push   $0x8
c01074f6:	68 2d 01 10 c0       	push   $0xc010012d
c01074fb:	6a 07                	push   $0x7
c01074fd:	e8 dd c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c0107502:	83 c4 10             	add    $0x10,%esp
c0107505:	6a 0e                	push   $0xe
c0107507:	6a 08                	push   $0x8
c0107509:	68 33 01 10 c0       	push   $0xc0100133
c010750e:	6a 08                	push   $0x8
c0107510:	e8 ca c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c0107515:	83 c4 10             	add    $0x10,%esp
c0107518:	6a 0e                	push   $0xe
c010751a:	6a 08                	push   $0x8
c010751c:	68 37 01 10 c0       	push   $0xc0100137
c0107521:	6a 09                	push   $0x9
c0107523:	e8 b7 c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c0107528:	83 c4 10             	add    $0x10,%esp
c010752b:	6a 0e                	push   $0xe
c010752d:	6a 08                	push   $0x8
c010752f:	68 3d 01 10 c0       	push   $0xc010013d
c0107534:	6a 0a                	push   $0xa
c0107536:	e8 a4 c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c010753b:	83 c4 10             	add    $0x10,%esp
c010753e:	6a 0e                	push   $0xe
c0107540:	6a 08                	push   $0x8
c0107542:	68 41 01 10 c0       	push   $0xc0100141
c0107547:	6a 0b                	push   $0xb
c0107549:	e8 91 c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c010754e:	83 c4 10             	add    $0x10,%esp
c0107551:	6a 0e                	push   $0xe
c0107553:	6a 08                	push   $0x8
c0107555:	68 45 01 10 c0       	push   $0xc0100145
c010755a:	6a 0c                	push   $0xc
c010755c:	e8 7e c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c0107561:	83 c4 10             	add    $0x10,%esp
c0107564:	6a 0e                	push   $0xe
c0107566:	6a 08                	push   $0x8
c0107568:	68 49 01 10 c0       	push   $0xc0100149
c010756d:	6a 0d                	push   $0xd
c010756f:	e8 6b c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c0107574:	83 c4 10             	add    $0x10,%esp
c0107577:	6a 0e                	push   $0xe
c0107579:	6a 08                	push   $0x8
c010757b:	68 54 01 10 c0       	push   $0xc0100154
c0107580:	6a 0e                	push   $0xe
c0107582:	e8 58 c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c0107587:	83 c4 10             	add    $0x10,%esp
c010758a:	6a 0e                	push   $0xe
c010758c:	6a 08                	push   $0x8
c010758e:	68 58 01 10 c0       	push   $0xc0100158
c0107593:	6a 10                	push   $0x10
c0107595:	e8 45 c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c010759a:	83 c4 10             	add    $0x10,%esp
c010759d:	6a 0e                	push   $0xe
c010759f:	6a 08                	push   $0x8
c01075a1:	68 5e 01 10 c0       	push   $0xc010015e
c01075a6:	6a 11                	push   $0x11
c01075a8:	e8 32 c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c01075ad:	83 c4 10             	add    $0x10,%esp
c01075b0:	6a 0e                	push   $0xe
c01075b2:	6a 08                	push   $0x8
c01075b4:	68 62 01 10 c0       	push   $0xc0100162
c01075b9:	6a 12                	push   $0x12
c01075bb:	e8 1f c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c01075c0:	83 c4 10             	add    $0x10,%esp
c01075c3:	6a 0e                	push   $0xe
c01075c5:	6a 0e                	push   $0xe
c01075c7:	68 6c 02 10 c0       	push   $0xc010026c
c01075cc:	68 90 00 00 00       	push   $0x90
c01075d1:	e8 09 c6 ff ff       	call   c0103bdf <InitInterruptDesc>
c01075d6:	83 c4 10             	add    $0x10,%esp
c01075d9:	90                   	nop
c01075da:	c9                   	leave  
c01075db:	c3                   	ret    

c01075dc <spurious_irq>:
c01075dc:	55                   	push   %ebp
c01075dd:	89 e5                	mov    %esp,%ebp
c01075df:	83 ec 08             	sub    $0x8,%esp
c01075e2:	83 ec 08             	sub    $0x8,%esp
c01075e5:	6a 0b                	push   $0xb
c01075e7:	68 ec b9 10 c0       	push   $0xc010b9ec
c01075ec:	e8 d6 8a ff ff       	call   c01000c7 <disp_str_colour>
c01075f1:	83 c4 10             	add    $0x10,%esp
c01075f4:	83 ec 0c             	sub    $0xc,%esp
c01075f7:	ff 75 08             	pushl  0x8(%ebp)
c01075fa:	e8 1b fb ff ff       	call   c010711a <disp_int>
c01075ff:	83 c4 10             	add    $0x10,%esp
c0107602:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107607:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010760d:	83 c0 01             	add    $0x1,%eax
c0107610:	83 d2 00             	adc    $0x0,%edx
c0107613:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107618:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010761e:	83 ec 0c             	sub    $0xc,%esp
c0107621:	68 00 b6 10 c0       	push   $0xc010b600
c0107626:	e8 61 8a ff ff       	call   c010008c <disp_str>
c010762b:	83 c4 10             	add    $0x10,%esp
c010762e:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107633:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107639:	83 ec 0c             	sub    $0xc,%esp
c010763c:	50                   	push   %eax
c010763d:	e8 d8 fa ff ff       	call   c010711a <disp_int>
c0107642:	83 c4 10             	add    $0x10,%esp
c0107645:	83 ec 0c             	sub    $0xc,%esp
c0107648:	68 02 b6 10 c0       	push   $0xc010b602
c010764d:	e8 3a 8a ff ff       	call   c010008c <disp_str>
c0107652:	83 c4 10             	add    $0x10,%esp
c0107655:	83 ec 08             	sub    $0x8,%esp
c0107658:	6a 0c                	push   $0xc
c010765a:	68 14 ba 10 c0       	push   $0xc010ba14
c010765f:	e8 63 8a ff ff       	call   c01000c7 <disp_str_colour>
c0107664:	83 c4 10             	add    $0x10,%esp
c0107667:	90                   	nop
c0107668:	c9                   	leave  
c0107669:	c3                   	ret    

c010766a <init_keyboard>:
c010766a:	55                   	push   %ebp
c010766b:	89 e5                	mov    %esp,%ebp
c010766d:	83 ec 08             	sub    $0x8,%esp
c0107670:	83 ec 04             	sub    $0x4,%esp
c0107673:	68 00 02 00 00       	push   $0x200
c0107678:	6a 00                	push   $0x0
c010767a:	68 ec fb 10 c0       	push   $0xc010fbec
c010767f:	e8 4b 4b 00 00       	call   c010c1cf <Memset>
c0107684:	83 c4 10             	add    $0x10,%esp
c0107687:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010768e:	fb 10 c0 
c0107691:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107696:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010769b:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c01076a2:	00 00 00 
c01076a5:	e8 4f d3 ff ff       	call   c01049f9 <init_keyboard_handler>
c01076aa:	90                   	nop
c01076ab:	c9                   	leave  
c01076ac:	c3                   	ret    

c01076ad <TestTTY>:
c01076ad:	55                   	push   %ebp
c01076ae:	89 e5                	mov    %esp,%ebp
c01076b0:	83 ec 28             	sub    $0x28,%esp
c01076b3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01076ba:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01076c1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01076c7:	83 ec 08             	sub    $0x8,%esp
c01076ca:	6a 02                	push   $0x2
c01076cc:	8d 45 de             	lea    -0x22(%ebp),%eax
c01076cf:	50                   	push   %eax
c01076d0:	e8 ca d4 ff ff       	call   c0104b9f <open>
c01076d5:	83 c4 10             	add    $0x10,%esp
c01076d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01076db:	83 ec 08             	sub    $0x8,%esp
c01076de:	6a 02                	push   $0x2
c01076e0:	8d 45 de             	lea    -0x22(%ebp),%eax
c01076e3:	50                   	push   %eax
c01076e4:	e8 b6 d4 ff ff       	call   c0104b9f <open>
c01076e9:	83 c4 10             	add    $0x10,%esp
c01076ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01076ef:	83 ec 0c             	sub    $0xc,%esp
c01076f2:	68 39 ba 10 c0       	push   $0xc010ba39
c01076f7:	e8 ec 0e 00 00       	call   c01085e8 <Printf>
c01076fc:	83 c4 10             	add    $0x10,%esp
c01076ff:	83 ec 0c             	sub    $0xc,%esp
c0107702:	6a 0a                	push   $0xa
c0107704:	e8 73 9f ff ff       	call   c010167c <sys_malloc>
c0107709:	83 c4 10             	add    $0x10,%esp
c010770c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010770f:	83 ec 04             	sub    $0x4,%esp
c0107712:	6a 0a                	push   $0xa
c0107714:	6a 00                	push   $0x0
c0107716:	ff 75 ec             	pushl  -0x14(%ebp)
c0107719:	e8 b1 4a 00 00       	call   c010c1cf <Memset>
c010771e:	83 c4 10             	add    $0x10,%esp
c0107721:	83 ec 04             	sub    $0x4,%esp
c0107724:	6a 0a                	push   $0xa
c0107726:	ff 75 ec             	pushl  -0x14(%ebp)
c0107729:	ff 75 f0             	pushl  -0x10(%ebp)
c010772c:	e8 03 d5 ff ff       	call   c0104c34 <read>
c0107731:	83 c4 10             	add    $0x10,%esp
c0107734:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107737:	83 ec 08             	sub    $0x8,%esp
c010773a:	ff 75 ec             	pushl  -0x14(%ebp)
c010773d:	68 4b ba 10 c0       	push   $0xc010ba4b
c0107742:	e8 a1 0e 00 00       	call   c01085e8 <Printf>
c0107747:	83 c4 10             	add    $0x10,%esp
c010774a:	eb c3                	jmp    c010770f <TestTTY+0x62>

c010774c <TestReadReturnValue>:
c010774c:	55                   	push   %ebp
c010774d:	89 e5                	mov    %esp,%ebp
c010774f:	81 ec 18 02 00 00    	sub    $0x218,%esp
c0107755:	c7 45 f4 55 ba 10 c0 	movl   $0xc010ba55,-0xc(%ebp)
c010775c:	83 ec 08             	sub    $0x8,%esp
c010775f:	6a 00                	push   $0x0
c0107761:	ff 75 f4             	pushl  -0xc(%ebp)
c0107764:	e8 36 d4 ff ff       	call   c0104b9f <open>
c0107769:	83 c4 10             	add    $0x10,%esp
c010776c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010776f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107776:	83 ec 04             	sub    $0x4,%esp
c0107779:	68 cb 00 00 00       	push   $0xcb
c010777e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0107784:	50                   	push   %eax
c0107785:	ff 75 f0             	pushl  -0x10(%ebp)
c0107788:	e8 a7 d4 ff ff       	call   c0104c34 <read>
c010778d:	83 c4 10             	add    $0x10,%esp
c0107790:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107793:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c010779a:	74 1c                	je     c01077b8 <TestReadReturnValue+0x6c>
c010779c:	68 08 02 00 00       	push   $0x208
c01077a1:	68 61 ba 10 c0       	push   $0xc010ba61
c01077a6:	68 61 ba 10 c0       	push   $0xc010ba61
c01077ab:	68 71 ba 10 c0       	push   $0xc010ba71
c01077b0:	e8 90 11 00 00       	call   c0108945 <assertion_failure>
c01077b5:	83 c4 10             	add    $0x10,%esp
c01077b8:	83 ec 0c             	sub    $0xc,%esp
c01077bb:	ff 75 f0             	pushl  -0x10(%ebp)
c01077be:	e8 77 d6 ff ff       	call   c0104e3a <close>
c01077c3:	83 c4 10             	add    $0x10,%esp
c01077c6:	90                   	nop
c01077c7:	c9                   	leave  
c01077c8:	c3                   	ret    

c01077c9 <TestWriteReturnValue>:
c01077c9:	55                   	push   %ebp
c01077ca:	89 e5                	mov    %esp,%ebp
c01077cc:	81 ec 28 02 00 00    	sub    $0x228,%esp
c01077d2:	c7 45 f4 7c ba 10 c0 	movl   $0xc010ba7c,-0xc(%ebp)
c01077d9:	83 ec 08             	sub    $0x8,%esp
c01077dc:	6a 07                	push   $0x7
c01077de:	ff 75 f4             	pushl  -0xc(%ebp)
c01077e1:	e8 b9 d3 ff ff       	call   c0104b9f <open>
c01077e6:	83 c4 10             	add    $0x10,%esp
c01077e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01077ec:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c01077f0:	75 1c                	jne    c010780e <TestWriteReturnValue+0x45>
c01077f2:	68 12 02 00 00       	push   $0x212
c01077f7:	68 61 ba 10 c0       	push   $0xc010ba61
c01077fc:	68 61 ba 10 c0       	push   $0xc010ba61
c0107801:	68 89 ba 10 c0       	push   $0xc010ba89
c0107806:	e8 3a 11 00 00       	call   c0108945 <assertion_failure>
c010780b:	83 c4 10             	add    $0x10,%esp
c010780e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107815:	c7 45 e8 94 ba 10 c0 	movl   $0xc010ba94,-0x18(%ebp)
c010781c:	83 ec 0c             	sub    $0xc,%esp
c010781f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107822:	e8 e1 49 00 00       	call   c010c208 <Strlen>
c0107827:	83 c4 10             	add    $0x10,%esp
c010782a:	83 ec 04             	sub    $0x4,%esp
c010782d:	50                   	push   %eax
c010782e:	ff 75 e8             	pushl  -0x18(%ebp)
c0107831:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107837:	50                   	push   %eax
c0107838:	e8 ef f4 ff ff       	call   c0106d2c <Memcpy>
c010783d:	83 c4 10             	add    $0x10,%esp
c0107840:	83 ec 04             	sub    $0x4,%esp
c0107843:	68 ff 01 00 00       	push   $0x1ff
c0107848:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c010784e:	50                   	push   %eax
c010784f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107852:	e8 5e d5 ff ff       	call   c0104db5 <write>
c0107857:	83 c4 10             	add    $0x10,%esp
c010785a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010785d:	83 ec 0c             	sub    $0xc,%esp
c0107860:	ff 75 e8             	pushl  -0x18(%ebp)
c0107863:	e8 a0 49 00 00       	call   c010c208 <Strlen>
c0107868:	83 c4 10             	add    $0x10,%esp
c010786b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c010786e:	74 1c                	je     c010788c <TestWriteReturnValue+0xc3>
c0107870:	68 1c 02 00 00       	push   $0x21c
c0107875:	68 61 ba 10 c0       	push   $0xc010ba61
c010787a:	68 61 ba 10 c0       	push   $0xc010ba61
c010787f:	68 c7 ba 10 c0       	push   $0xc010bac7
c0107884:	e8 bc 10 00 00       	call   c0108945 <assertion_failure>
c0107889:	83 c4 10             	add    $0x10,%esp
c010788c:	83 ec 0c             	sub    $0xc,%esp
c010788f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107892:	e8 a3 d5 ff ff       	call   c0104e3a <close>
c0107897:	83 c4 10             	add    $0x10,%esp
c010789a:	90                   	nop
c010789b:	c9                   	leave  
c010789c:	c3                   	ret    

c010789d <TestFS2>:
c010789d:	55                   	push   %ebp
c010789e:	89 e5                	mov    %esp,%ebp
c01078a0:	83 ec 08             	sub    $0x8,%esp
c01078a3:	e8 21 ff ff ff       	call   c01077c9 <TestWriteReturnValue>
c01078a8:	90                   	nop
c01078a9:	c9                   	leave  
c01078aa:	c3                   	ret    

c01078ab <TestFS>:
c01078ab:	55                   	push   %ebp
c01078ac:	89 e5                	mov    %esp,%ebp
c01078ae:	57                   	push   %edi
c01078af:	56                   	push   %esi
c01078b0:	53                   	push   %ebx
c01078b1:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c01078b7:	83 ec 0c             	sub    $0xc,%esp
c01078ba:	68 da ba 10 c0       	push   $0xc010bada
c01078bf:	e8 c8 87 ff ff       	call   c010008c <disp_str>
c01078c4:	83 c4 10             	add    $0x10,%esp
c01078c7:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c01078ce:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c01078d5:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c01078db:	83 ec 08             	sub    $0x8,%esp
c01078de:	6a 02                	push   $0x2
c01078e0:	8d 45 ae             	lea    -0x52(%ebp),%eax
c01078e3:	50                   	push   %eax
c01078e4:	e8 b6 d2 ff ff       	call   c0104b9f <open>
c01078e9:	83 c4 10             	add    $0x10,%esp
c01078ec:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01078ef:	83 ec 08             	sub    $0x8,%esp
c01078f2:	6a 02                	push   $0x2
c01078f4:	8d 45 ae             	lea    -0x52(%ebp),%eax
c01078f7:	50                   	push   %eax
c01078f8:	e8 a2 d2 ff ff       	call   c0104b9f <open>
c01078fd:	83 c4 10             	add    $0x10,%esp
c0107900:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107903:	83 ec 0c             	sub    $0xc,%esp
c0107906:	68 39 ba 10 c0       	push   $0xc010ba39
c010790b:	e8 d8 0c 00 00       	call   c01085e8 <Printf>
c0107910:	83 c4 10             	add    $0x10,%esp
c0107913:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c010791a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c010791e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c0107925:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c0107929:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c0107930:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c0107937:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c010793d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c0107944:	83 ec 0c             	sub    $0xc,%esp
c0107947:	68 e2 ba 10 c0       	push   $0xc010bae2
c010794c:	e8 97 0c 00 00       	call   c01085e8 <Printf>
c0107951:	83 c4 10             	add    $0x10,%esp
c0107954:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c0107958:	0f 85 e6 03 00 00    	jne    c0107d44 <TestFS+0x499>
c010795e:	83 ec 08             	sub    $0x8,%esp
c0107961:	6a 07                	push   $0x7
c0107963:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107966:	50                   	push   %eax
c0107967:	e8 33 d2 ff ff       	call   c0104b9f <open>
c010796c:	83 c4 10             	add    $0x10,%esp
c010796f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107972:	83 ec 08             	sub    $0x8,%esp
c0107975:	ff 75 d0             	pushl  -0x30(%ebp)
c0107978:	68 fa ba 10 c0       	push   $0xc010bafa
c010797d:	e8 66 0c 00 00       	call   c01085e8 <Printf>
c0107982:	83 c4 10             	add    $0x10,%esp
c0107985:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c010798c:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107993:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c010799a:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c01079a1:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c01079a8:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c01079af:	83 ec 0c             	sub    $0xc,%esp
c01079b2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c01079b5:	50                   	push   %eax
c01079b6:	e8 4d 48 00 00       	call   c010c208 <Strlen>
c01079bb:	83 c4 10             	add    $0x10,%esp
c01079be:	83 ec 04             	sub    $0x4,%esp
c01079c1:	50                   	push   %eax
c01079c2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c01079c5:	50                   	push   %eax
c01079c6:	ff 75 d0             	pushl  -0x30(%ebp)
c01079c9:	e8 e7 d3 ff ff       	call   c0104db5 <write>
c01079ce:	83 c4 10             	add    $0x10,%esp
c01079d1:	83 ec 0c             	sub    $0xc,%esp
c01079d4:	ff 75 d0             	pushl  -0x30(%ebp)
c01079d7:	e8 5e d4 ff ff       	call   c0104e3a <close>
c01079dc:	83 c4 10             	add    $0x10,%esp
c01079df:	83 ec 08             	sub    $0x8,%esp
c01079e2:	6a 00                	push   $0x0
c01079e4:	8d 45 a9             	lea    -0x57(%ebp),%eax
c01079e7:	50                   	push   %eax
c01079e8:	e8 b2 d1 ff ff       	call   c0104b9f <open>
c01079ed:	83 c4 10             	add    $0x10,%esp
c01079f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01079f3:	83 ec 04             	sub    $0x4,%esp
c01079f6:	6a 14                	push   $0x14
c01079f8:	6a 00                	push   $0x0
c01079fa:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a00:	50                   	push   %eax
c0107a01:	e8 c9 47 00 00       	call   c010c1cf <Memset>
c0107a06:	83 c4 10             	add    $0x10,%esp
c0107a09:	83 ec 04             	sub    $0x4,%esp
c0107a0c:	6a 12                	push   $0x12
c0107a0e:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a14:	50                   	push   %eax
c0107a15:	ff 75 d0             	pushl  -0x30(%ebp)
c0107a18:	e8 17 d2 ff ff       	call   c0104c34 <read>
c0107a1d:	83 c4 10             	add    $0x10,%esp
c0107a20:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107a23:	83 ec 08             	sub    $0x8,%esp
c0107a26:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a2c:	50                   	push   %eax
c0107a2d:	68 03 bb 10 c0       	push   $0xc010bb03
c0107a32:	e8 b1 0b 00 00       	call   c01085e8 <Printf>
c0107a37:	83 c4 10             	add    $0x10,%esp
c0107a3a:	83 ec 0c             	sub    $0xc,%esp
c0107a3d:	6a 0a                	push   $0xa
c0107a3f:	e8 70 0a 00 00       	call   c01084b4 <delay>
c0107a44:	83 c4 10             	add    $0x10,%esp
c0107a47:	83 ec 08             	sub    $0x8,%esp
c0107a4a:	6a 07                	push   $0x7
c0107a4c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107a4f:	50                   	push   %eax
c0107a50:	e8 4a d1 ff ff       	call   c0104b9f <open>
c0107a55:	83 c4 10             	add    $0x10,%esp
c0107a58:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107a5b:	83 ec 08             	sub    $0x8,%esp
c0107a5e:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a61:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107a66:	e8 7d 0b 00 00       	call   c01085e8 <Printf>
c0107a6b:	83 c4 10             	add    $0x10,%esp
c0107a6e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107a75:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a7b:	bb 44 bb 10 c0       	mov    $0xc010bb44,%ebx
c0107a80:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107a85:	8b 0b                	mov    (%ebx),%ecx
c0107a87:	89 08                	mov    %ecx,(%eax)
c0107a89:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107a8d:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107a91:	8d 78 04             	lea    0x4(%eax),%edi
c0107a94:	83 e7 fc             	and    $0xfffffffc,%edi
c0107a97:	29 f8                	sub    %edi,%eax
c0107a99:	29 c3                	sub    %eax,%ebx
c0107a9b:	01 c2                	add    %eax,%edx
c0107a9d:	83 e2 fc             	and    $0xfffffffc,%edx
c0107aa0:	89 d0                	mov    %edx,%eax
c0107aa2:	c1 e8 02             	shr    $0x2,%eax
c0107aa5:	89 de                	mov    %ebx,%esi
c0107aa7:	89 c1                	mov    %eax,%ecx
c0107aa9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107aab:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107ab2:	00 00 00 
c0107ab5:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107abc:	00 00 00 
c0107abf:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107ac6:	83 ec 0c             	sub    $0xc,%esp
c0107ac9:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107acf:	50                   	push   %eax
c0107ad0:	e8 33 47 00 00       	call   c010c208 <Strlen>
c0107ad5:	83 c4 10             	add    $0x10,%esp
c0107ad8:	83 ec 04             	sub    $0x4,%esp
c0107adb:	50                   	push   %eax
c0107adc:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107ae2:	50                   	push   %eax
c0107ae3:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ae6:	e8 ca d2 ff ff       	call   c0104db5 <write>
c0107aeb:	83 c4 10             	add    $0x10,%esp
c0107aee:	83 ec 0c             	sub    $0xc,%esp
c0107af1:	ff 75 c8             	pushl  -0x38(%ebp)
c0107af4:	e8 41 d3 ff ff       	call   c0104e3a <close>
c0107af9:	83 c4 10             	add    $0x10,%esp
c0107afc:	83 ec 08             	sub    $0x8,%esp
c0107aff:	6a 00                	push   $0x0
c0107b01:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107b04:	50                   	push   %eax
c0107b05:	e8 95 d0 ff ff       	call   c0104b9f <open>
c0107b0a:	83 c4 10             	add    $0x10,%esp
c0107b0d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107b10:	83 ec 04             	sub    $0x4,%esp
c0107b13:	68 c8 00 00 00       	push   $0xc8
c0107b18:	6a 00                	push   $0x0
c0107b1a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b20:	50                   	push   %eax
c0107b21:	e8 a9 46 00 00       	call   c010c1cf <Memset>
c0107b26:	83 c4 10             	add    $0x10,%esp
c0107b29:	83 ec 0c             	sub    $0xc,%esp
c0107b2c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107b32:	50                   	push   %eax
c0107b33:	e8 d0 46 00 00       	call   c010c208 <Strlen>
c0107b38:	83 c4 10             	add    $0x10,%esp
c0107b3b:	83 ec 04             	sub    $0x4,%esp
c0107b3e:	50                   	push   %eax
c0107b3f:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b45:	50                   	push   %eax
c0107b46:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b49:	e8 e6 d0 ff ff       	call   c0104c34 <read>
c0107b4e:	83 c4 10             	add    $0x10,%esp
c0107b51:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107b54:	83 ec 08             	sub    $0x8,%esp
c0107b57:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b5d:	50                   	push   %eax
c0107b5e:	68 18 bb 10 c0       	push   $0xc010bb18
c0107b63:	e8 80 0a 00 00       	call   c01085e8 <Printf>
c0107b68:	83 c4 10             	add    $0x10,%esp
c0107b6b:	83 ec 08             	sub    $0x8,%esp
c0107b6e:	6a 07                	push   $0x7
c0107b70:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107b73:	50                   	push   %eax
c0107b74:	e8 26 d0 ff ff       	call   c0104b9f <open>
c0107b79:	83 c4 10             	add    $0x10,%esp
c0107b7c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107b7f:	83 ec 08             	sub    $0x8,%esp
c0107b82:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b85:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107b8a:	e8 59 0a 00 00       	call   c01085e8 <Printf>
c0107b8f:	83 c4 10             	add    $0x10,%esp
c0107b92:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107b99:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107ba0:	20 77 69 
c0107ba3:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107baa:	6c 20 73 
c0107bad:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107bb4:	63 63 65 
c0107bb7:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107bbe:	73 20 61 
c0107bc1:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107bc8:	20 6c 61 
c0107bcb:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107bd2:	74 2e 00 
c0107bd5:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107bdc:	00 00 00 
c0107bdf:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107be6:	00 00 
c0107be8:	83 ec 0c             	sub    $0xc,%esp
c0107beb:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107bf1:	50                   	push   %eax
c0107bf2:	e8 11 46 00 00       	call   c010c208 <Strlen>
c0107bf7:	83 c4 10             	add    $0x10,%esp
c0107bfa:	83 ec 04             	sub    $0x4,%esp
c0107bfd:	50                   	push   %eax
c0107bfe:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107c04:	50                   	push   %eax
c0107c05:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c08:	e8 a8 d1 ff ff       	call   c0104db5 <write>
c0107c0d:	83 c4 10             	add    $0x10,%esp
c0107c10:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107c17:	eb 7e                	jmp    c0107c97 <TestFS+0x3ec>
c0107c19:	83 ec 0c             	sub    $0xc,%esp
c0107c1c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c1f:	e8 16 d2 ff ff       	call   c0104e3a <close>
c0107c24:	83 c4 10             	add    $0x10,%esp
c0107c27:	83 ec 08             	sub    $0x8,%esp
c0107c2a:	6a 00                	push   $0x0
c0107c2c:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107c2f:	50                   	push   %eax
c0107c30:	e8 6a cf ff ff       	call   c0104b9f <open>
c0107c35:	83 c4 10             	add    $0x10,%esp
c0107c38:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107c3b:	83 ec 04             	sub    $0x4,%esp
c0107c3e:	6a 1e                	push   $0x1e
c0107c40:	6a 00                	push   $0x0
c0107c42:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c48:	50                   	push   %eax
c0107c49:	e8 81 45 00 00       	call   c010c1cf <Memset>
c0107c4e:	83 c4 10             	add    $0x10,%esp
c0107c51:	83 ec 0c             	sub    $0xc,%esp
c0107c54:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107c5a:	50                   	push   %eax
c0107c5b:	e8 a8 45 00 00       	call   c010c208 <Strlen>
c0107c60:	83 c4 10             	add    $0x10,%esp
c0107c63:	83 ec 04             	sub    $0x4,%esp
c0107c66:	50                   	push   %eax
c0107c67:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c6d:	50                   	push   %eax
c0107c6e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c71:	e8 be cf ff ff       	call   c0104c34 <read>
c0107c76:	83 c4 10             	add    $0x10,%esp
c0107c79:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107c7c:	83 ec 08             	sub    $0x8,%esp
c0107c7f:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c85:	50                   	push   %eax
c0107c86:	68 23 bb 10 c0       	push   $0xc010bb23
c0107c8b:	e8 58 09 00 00       	call   c01085e8 <Printf>
c0107c90:	83 c4 10             	add    $0x10,%esp
c0107c93:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107c97:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107c9b:	0f 8e 78 ff ff ff    	jle    c0107c19 <TestFS+0x36e>
c0107ca1:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107ca8:	6e 73 74 
c0107cab:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107cb2:	6c 6c 2e 
c0107cb5:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107cbc:	61 72 00 
c0107cbf:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107cc6:	00 00 00 
c0107cc9:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107cd0:	00 00 00 
c0107cd3:	83 ec 08             	sub    $0x8,%esp
c0107cd6:	6a 00                	push   $0x0
c0107cd8:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107cde:	50                   	push   %eax
c0107cdf:	e8 bb ce ff ff       	call   c0104b9f <open>
c0107ce4:	83 c4 10             	add    $0x10,%esp
c0107ce7:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107cea:	83 ec 08             	sub    $0x8,%esp
c0107ced:	ff 75 bc             	pushl  -0x44(%ebp)
c0107cf0:	68 2e bb 10 c0       	push   $0xc010bb2e
c0107cf5:	e8 ee 08 00 00       	call   c01085e8 <Printf>
c0107cfa:	83 c4 10             	add    $0x10,%esp
c0107cfd:	83 ec 04             	sub    $0x4,%esp
c0107d00:	6a 28                	push   $0x28
c0107d02:	6a 00                	push   $0x0
c0107d04:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d0a:	50                   	push   %eax
c0107d0b:	e8 bf 44 00 00       	call   c010c1cf <Memset>
c0107d10:	83 c4 10             	add    $0x10,%esp
c0107d13:	83 ec 04             	sub    $0x4,%esp
c0107d16:	6a 28                	push   $0x28
c0107d18:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d1e:	50                   	push   %eax
c0107d1f:	ff 75 bc             	pushl  -0x44(%ebp)
c0107d22:	e8 0d cf ff ff       	call   c0104c34 <read>
c0107d27:	83 c4 10             	add    $0x10,%esp
c0107d2a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107d2d:	83 ec 08             	sub    $0x8,%esp
c0107d30:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d36:	50                   	push   %eax
c0107d37:	68 38 bb 10 c0       	push   $0xc010bb38
c0107d3c:	e8 a7 08 00 00       	call   c01085e8 <Printf>
c0107d41:	83 c4 10             	add    $0x10,%esp
c0107d44:	90                   	nop
c0107d45:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107d48:	5b                   	pop    %ebx
c0107d49:	5e                   	pop    %esi
c0107d4a:	5f                   	pop    %edi
c0107d4b:	5d                   	pop    %ebp
c0107d4c:	c3                   	ret    

c0107d4d <wait_exit>:
c0107d4d:	55                   	push   %ebp
c0107d4e:	89 e5                	mov    %esp,%ebp
c0107d50:	83 ec 28             	sub    $0x28,%esp
c0107d53:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107d5a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107d61:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107d67:	83 ec 08             	sub    $0x8,%esp
c0107d6a:	6a 02                	push   $0x2
c0107d6c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d6f:	50                   	push   %eax
c0107d70:	e8 2a ce ff ff       	call   c0104b9f <open>
c0107d75:	83 c4 10             	add    $0x10,%esp
c0107d78:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107d7b:	83 ec 08             	sub    $0x8,%esp
c0107d7e:	6a 02                	push   $0x2
c0107d80:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d83:	50                   	push   %eax
c0107d84:	e8 16 ce ff ff       	call   c0104b9f <open>
c0107d89:	83 c4 10             	add    $0x10,%esp
c0107d8c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107d8f:	e8 6b d1 ff ff       	call   c0104eff <fork>
c0107d94:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107d97:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107d9b:	7e 35                	jle    c0107dd2 <wait_exit+0x85>
c0107d9d:	83 ec 0c             	sub    $0xc,%esp
c0107da0:	68 0c bc 10 c0       	push   $0xc010bc0c
c0107da5:	e8 3e 08 00 00       	call   c01085e8 <Printf>
c0107daa:	83 c4 10             	add    $0x10,%esp
c0107dad:	83 ec 0c             	sub    $0xc,%esp
c0107db0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107db3:	50                   	push   %eax
c0107db4:	e8 d3 d0 ff ff       	call   c0104e8c <wait>
c0107db9:	83 c4 10             	add    $0x10,%esp
c0107dbc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107dbf:	83 ec 08             	sub    $0x8,%esp
c0107dc2:	50                   	push   %eax
c0107dc3:	68 24 bc 10 c0       	push   $0xc010bc24
c0107dc8:	e8 1b 08 00 00       	call   c01085e8 <Printf>
c0107dcd:	83 c4 10             	add    $0x10,%esp
c0107dd0:	eb fe                	jmp    c0107dd0 <wait_exit+0x83>
c0107dd2:	83 ec 0c             	sub    $0xc,%esp
c0107dd5:	68 3f bc 10 c0       	push   $0xc010bc3f
c0107dda:	e8 09 08 00 00       	call   c01085e8 <Printf>
c0107ddf:	83 c4 10             	add    $0x10,%esp
c0107de2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107de9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107dec:	8d 50 01             	lea    0x1(%eax),%edx
c0107def:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107df2:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107df7:	7f 02                	jg     c0107dfb <wait_exit+0xae>
c0107df9:	eb ee                	jmp    c0107de9 <wait_exit+0x9c>
c0107dfb:	90                   	nop
c0107dfc:	83 ec 0c             	sub    $0xc,%esp
c0107dff:	68 4b bc 10 c0       	push   $0xc010bc4b
c0107e04:	e8 df 07 00 00       	call   c01085e8 <Printf>
c0107e09:	83 c4 10             	add    $0x10,%esp
c0107e0c:	83 ec 0c             	sub    $0xc,%esp
c0107e0f:	68 59 bc 10 c0       	push   $0xc010bc59
c0107e14:	e8 cf 07 00 00       	call   c01085e8 <Printf>
c0107e19:	83 c4 10             	add    $0x10,%esp
c0107e1c:	83 ec 0c             	sub    $0xc,%esp
c0107e1f:	68 68 bc 10 c0       	push   $0xc010bc68
c0107e24:	e8 bf 07 00 00       	call   c01085e8 <Printf>
c0107e29:	83 c4 10             	add    $0x10,%esp
c0107e2c:	83 ec 0c             	sub    $0xc,%esp
c0107e2f:	6a 5a                	push   $0x5a
c0107e31:	e8 9a d0 ff ff       	call   c0104ed0 <exit>
c0107e36:	83 c4 10             	add    $0x10,%esp
c0107e39:	83 ec 0c             	sub    $0xc,%esp
c0107e3c:	68 77 bc 10 c0       	push   $0xc010bc77
c0107e41:	e8 a2 07 00 00       	call   c01085e8 <Printf>
c0107e46:	83 c4 10             	add    $0x10,%esp
c0107e49:	eb fe                	jmp    c0107e49 <wait_exit+0xfc>

c0107e4b <INIT_fork>:
c0107e4b:	55                   	push   %ebp
c0107e4c:	89 e5                	mov    %esp,%ebp
c0107e4e:	83 ec 78             	sub    $0x78,%esp
c0107e51:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107e58:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107e5f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107e65:	83 ec 08             	sub    $0x8,%esp
c0107e68:	6a 02                	push   $0x2
c0107e6a:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107e6d:	50                   	push   %eax
c0107e6e:	e8 2c cd ff ff       	call   c0104b9f <open>
c0107e73:	83 c4 10             	add    $0x10,%esp
c0107e76:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107e79:	83 ec 08             	sub    $0x8,%esp
c0107e7c:	6a 02                	push   $0x2
c0107e7e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107e81:	50                   	push   %eax
c0107e82:	e8 18 cd ff ff       	call   c0104b9f <open>
c0107e87:	83 c4 10             	add    $0x10,%esp
c0107e8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107e8d:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107e94:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107e9b:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107ea2:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107ea9:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107eb0:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107eb7:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107ebe:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107ec5:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107ecc:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107ed3:	83 ec 0c             	sub    $0xc,%esp
c0107ed6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107ed9:	50                   	push   %eax
c0107eda:	e8 09 07 00 00       	call   c01085e8 <Printf>
c0107edf:	83 c4 10             	add    $0x10,%esp
c0107ee2:	83 ec 0c             	sub    $0xc,%esp
c0107ee5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107ee8:	50                   	push   %eax
c0107ee9:	e8 1a 43 00 00       	call   c010c208 <Strlen>
c0107eee:	83 c4 10             	add    $0x10,%esp
c0107ef1:	83 ec 04             	sub    $0x4,%esp
c0107ef4:	50                   	push   %eax
c0107ef5:	6a 00                	push   $0x0
c0107ef7:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107efa:	50                   	push   %eax
c0107efb:	e8 cf 42 00 00       	call   c010c1cf <Memset>
c0107f00:	83 c4 10             	add    $0x10,%esp
c0107f03:	83 ec 04             	sub    $0x4,%esp
c0107f06:	6a 28                	push   $0x28
c0107f08:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f0b:	50                   	push   %eax
c0107f0c:	ff 75 f0             	pushl  -0x10(%ebp)
c0107f0f:	e8 20 cd ff ff       	call   c0104c34 <read>
c0107f14:	83 c4 10             	add    $0x10,%esp
c0107f17:	83 ec 0c             	sub    $0xc,%esp
c0107f1a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f1d:	50                   	push   %eax
c0107f1e:	e8 c5 06 00 00       	call   c01085e8 <Printf>
c0107f23:	83 c4 10             	add    $0x10,%esp
c0107f26:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107f2d:	e8 cd cf ff ff       	call   c0104eff <fork>
c0107f32:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107f35:	83 ec 0c             	sub    $0xc,%esp
c0107f38:	6a 01                	push   $0x1
c0107f3a:	e8 75 05 00 00       	call   c01084b4 <delay>
c0107f3f:	83 c4 10             	add    $0x10,%esp
c0107f42:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107f46:	0f 8e cd 00 00 00    	jle    c0108019 <INIT_fork+0x1ce>
c0107f4c:	83 ec 08             	sub    $0x8,%esp
c0107f4f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107f52:	68 85 bc 10 c0       	push   $0xc010bc85
c0107f57:	e8 8c 06 00 00       	call   c01085e8 <Printf>
c0107f5c:	83 c4 10             	add    $0x10,%esp
c0107f5f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107f63:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107f6a:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107f71:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107f78:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107f7f:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107f86:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107f8d:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107f94:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107f9b:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107fa2:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107fa9:	83 ec 0c             	sub    $0xc,%esp
c0107fac:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107faf:	50                   	push   %eax
c0107fb0:	e8 53 42 00 00       	call   c010c208 <Strlen>
c0107fb5:	83 c4 10             	add    $0x10,%esp
c0107fb8:	83 ec 04             	sub    $0x4,%esp
c0107fbb:	50                   	push   %eax
c0107fbc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fbf:	50                   	push   %eax
c0107fc0:	ff 75 f4             	pushl  -0xc(%ebp)
c0107fc3:	e8 ed cd ff ff       	call   c0104db5 <write>
c0107fc8:	83 c4 10             	add    $0x10,%esp
c0107fcb:	e8 b2 ec ff ff       	call   c0106c82 <catch_error>
c0107fd0:	83 ec 0c             	sub    $0xc,%esp
c0107fd3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fd6:	50                   	push   %eax
c0107fd7:	e8 2c 42 00 00       	call   c010c208 <Strlen>
c0107fdc:	83 c4 10             	add    $0x10,%esp
c0107fdf:	83 ec 04             	sub    $0x4,%esp
c0107fe2:	50                   	push   %eax
c0107fe3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fe6:	50                   	push   %eax
c0107fe7:	ff 75 f4             	pushl  -0xc(%ebp)
c0107fea:	e8 c6 cd ff ff       	call   c0104db5 <write>
c0107fef:	83 c4 10             	add    $0x10,%esp
c0107ff2:	83 ec 0c             	sub    $0xc,%esp
c0107ff5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107ff8:	50                   	push   %eax
c0107ff9:	e8 0a 42 00 00       	call   c010c208 <Strlen>
c0107ffe:	83 c4 10             	add    $0x10,%esp
c0108001:	83 ec 04             	sub    $0x4,%esp
c0108004:	50                   	push   %eax
c0108005:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108008:	50                   	push   %eax
c0108009:	ff 75 f4             	pushl  -0xc(%ebp)
c010800c:	e8 a4 cd ff ff       	call   c0104db5 <write>
c0108011:	83 c4 10             	add    $0x10,%esp
c0108014:	e9 d6 00 00 00       	jmp    c01080ef <INIT_fork+0x2a4>
c0108019:	83 ec 08             	sub    $0x8,%esp
c010801c:	ff 75 e8             	pushl  -0x18(%ebp)
c010801f:	68 85 bc 10 c0       	push   $0xc010bc85
c0108024:	e8 bf 05 00 00       	call   c01085e8 <Printf>
c0108029:	83 c4 10             	add    $0x10,%esp
c010802c:	83 ec 0c             	sub    $0xc,%esp
c010802f:	6a 01                	push   $0x1
c0108031:	e8 7e 04 00 00       	call   c01084b4 <delay>
c0108036:	83 c4 10             	add    $0x10,%esp
c0108039:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010803d:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0108041:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0108048:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c010804f:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0108056:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c010805d:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0108064:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c010806b:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0108072:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0108079:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108080:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108087:	83 ec 0c             	sub    $0xc,%esp
c010808a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010808d:	50                   	push   %eax
c010808e:	e8 75 41 00 00       	call   c010c208 <Strlen>
c0108093:	83 c4 10             	add    $0x10,%esp
c0108096:	83 ec 04             	sub    $0x4,%esp
c0108099:	50                   	push   %eax
c010809a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010809d:	50                   	push   %eax
c010809e:	ff 75 f4             	pushl  -0xc(%ebp)
c01080a1:	e8 0f cd ff ff       	call   c0104db5 <write>
c01080a6:	83 c4 10             	add    $0x10,%esp
c01080a9:	83 ec 0c             	sub    $0xc,%esp
c01080ac:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080af:	50                   	push   %eax
c01080b0:	e8 53 41 00 00       	call   c010c208 <Strlen>
c01080b5:	83 c4 10             	add    $0x10,%esp
c01080b8:	83 ec 04             	sub    $0x4,%esp
c01080bb:	50                   	push   %eax
c01080bc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080bf:	50                   	push   %eax
c01080c0:	ff 75 f4             	pushl  -0xc(%ebp)
c01080c3:	e8 ed cc ff ff       	call   c0104db5 <write>
c01080c8:	83 c4 10             	add    $0x10,%esp
c01080cb:	83 ec 0c             	sub    $0xc,%esp
c01080ce:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080d1:	50                   	push   %eax
c01080d2:	e8 31 41 00 00       	call   c010c208 <Strlen>
c01080d7:	83 c4 10             	add    $0x10,%esp
c01080da:	83 ec 04             	sub    $0x4,%esp
c01080dd:	50                   	push   %eax
c01080de:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080e1:	50                   	push   %eax
c01080e2:	ff 75 f4             	pushl  -0xc(%ebp)
c01080e5:	e8 cb cc ff ff       	call   c0104db5 <write>
c01080ea:	83 c4 10             	add    $0x10,%esp
c01080ed:	eb fe                	jmp    c01080ed <INIT_fork+0x2a2>
c01080ef:	83 ec 04             	sub    $0x4,%esp
c01080f2:	6a 28                	push   $0x28
c01080f4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080f7:	50                   	push   %eax
c01080f8:	ff 75 f0             	pushl  -0x10(%ebp)
c01080fb:	e8 34 cb ff ff       	call   c0104c34 <read>
c0108100:	83 c4 10             	add    $0x10,%esp
c0108103:	83 ec 0c             	sub    $0xc,%esp
c0108106:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108109:	50                   	push   %eax
c010810a:	e8 d9 04 00 00       	call   c01085e8 <Printf>
c010810f:	83 c4 10             	add    $0x10,%esp
c0108112:	83 ec 0c             	sub    $0xc,%esp
c0108115:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108118:	50                   	push   %eax
c0108119:	e8 ca 04 00 00       	call   c01085e8 <Printf>
c010811e:	83 c4 10             	add    $0x10,%esp
c0108121:	83 ec 0c             	sub    $0xc,%esp
c0108124:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108127:	50                   	push   %eax
c0108128:	e8 bb 04 00 00       	call   c01085e8 <Printf>
c010812d:	83 c4 10             	add    $0x10,%esp
c0108130:	83 ec 0c             	sub    $0xc,%esp
c0108133:	68 8f bc 10 c0       	push   $0xc010bc8f
c0108138:	e8 c4 07 00 00       	call   c0108901 <spin>
c010813d:	83 c4 10             	add    $0x10,%esp
c0108140:	90                   	nop
c0108141:	c9                   	leave  
c0108142:	c3                   	ret    

c0108143 <simple_shell>:
c0108143:	55                   	push   %ebp
c0108144:	89 e5                	mov    %esp,%ebp
c0108146:	57                   	push   %edi
c0108147:	83 ec 64             	sub    $0x64,%esp
c010814a:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0108151:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0108158:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c010815e:	83 ec 08             	sub    $0x8,%esp
c0108161:	6a 02                	push   $0x2
c0108163:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108166:	50                   	push   %eax
c0108167:	e8 33 ca ff ff       	call   c0104b9f <open>
c010816c:	83 c4 10             	add    $0x10,%esp
c010816f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108172:	83 ec 08             	sub    $0x8,%esp
c0108175:	6a 02                	push   $0x2
c0108177:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c010817a:	50                   	push   %eax
c010817b:	e8 1f ca ff ff       	call   c0104b9f <open>
c0108180:	83 c4 10             	add    $0x10,%esp
c0108183:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108186:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0108189:	b8 00 00 00 00       	mov    $0x0,%eax
c010818e:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0108193:	89 d7                	mov    %edx,%edi
c0108195:	f3 ab                	rep stos %eax,%es:(%edi)
c0108197:	c7 45 a8 97 bc 10 c0 	movl   $0xc010bc97,-0x58(%ebp)
c010819e:	c7 45 ac 9c bc 10 c0 	movl   $0xc010bc9c,-0x54(%ebp)
c01081a5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01081ac:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c01081b3:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c01081ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01081bd:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c01081c4:	00 
c01081c5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01081c8:	85 c0                	test   %eax,%eax
c01081ca:	75 1c                	jne    c01081e8 <simple_shell+0xa5>
c01081cc:	68 0e 03 00 00       	push   $0x30e
c01081d1:	68 61 ba 10 c0       	push   $0xc010ba61
c01081d6:	68 61 ba 10 c0       	push   $0xc010ba61
c01081db:	68 a2 bc 10 c0       	push   $0xc010bca2
c01081e0:	e8 60 07 00 00       	call   c0108945 <assertion_failure>
c01081e5:	83 c4 10             	add    $0x10,%esp
c01081e8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01081eb:	83 ec 08             	sub    $0x8,%esp
c01081ee:	6a 02                	push   $0x2
c01081f0:	50                   	push   %eax
c01081f1:	e8 a9 c9 ff ff       	call   c0104b9f <open>
c01081f6:	83 c4 10             	add    $0x10,%esp
c01081f9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01081fc:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0108200:	75 4b                	jne    c010824d <simple_shell+0x10a>
c0108202:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108209:	eb 26                	jmp    c0108231 <simple_shell+0xee>
c010820b:	8b 55 a8             	mov    -0x58(%ebp),%edx
c010820e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108211:	01 d0                	add    %edx,%eax
c0108213:	0f b6 00             	movzbl (%eax),%eax
c0108216:	0f be c0             	movsbl %al,%eax
c0108219:	83 ec 04             	sub    $0x4,%esp
c010821c:	50                   	push   %eax
c010821d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108220:	68 b1 bc 10 c0       	push   $0xc010bcb1
c0108225:	e8 be 03 00 00       	call   c01085e8 <Printf>
c010822a:	83 c4 10             	add    $0x10,%esp
c010822d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108231:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0108235:	7e d4                	jle    c010820b <simple_shell+0xc8>
c0108237:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010823a:	83 ec 08             	sub    $0x8,%esp
c010823d:	50                   	push   %eax
c010823e:	68 b8 bc 10 c0       	push   $0xc010bcb8
c0108243:	e8 a0 03 00 00       	call   c01085e8 <Printf>
c0108248:	83 c4 10             	add    $0x10,%esp
c010824b:	eb 78                	jmp    c01082c5 <simple_shell+0x182>
c010824d:	83 ec 0c             	sub    $0xc,%esp
c0108250:	68 be bc 10 c0       	push   $0xc010bcbe
c0108255:	e8 8e 03 00 00       	call   c01085e8 <Printf>
c010825a:	83 c4 10             	add    $0x10,%esp
c010825d:	e8 9d cc ff ff       	call   c0104eff <fork>
c0108262:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108265:	83 ec 0c             	sub    $0xc,%esp
c0108268:	68 d3 bc 10 c0       	push   $0xc010bcd3
c010826d:	e8 76 03 00 00       	call   c01085e8 <Printf>
c0108272:	83 c4 10             	add    $0x10,%esp
c0108275:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0108279:	7e 11                	jle    c010828c <simple_shell+0x149>
c010827b:	83 ec 0c             	sub    $0xc,%esp
c010827e:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0108281:	50                   	push   %eax
c0108282:	e8 05 cc ff ff       	call   c0104e8c <wait>
c0108287:	83 c4 10             	add    $0x10,%esp
c010828a:	eb 39                	jmp    c01082c5 <simple_shell+0x182>
c010828c:	83 ec 0c             	sub    $0xc,%esp
c010828f:	68 e8 bc 10 c0       	push   $0xc010bce8
c0108294:	e8 4f 03 00 00       	call   c01085e8 <Printf>
c0108299:	83 c4 10             	add    $0x10,%esp
c010829c:	83 ec 0c             	sub    $0xc,%esp
c010829f:	ff 75 e0             	pushl  -0x20(%ebp)
c01082a2:	e8 93 cb ff ff       	call   c0104e3a <close>
c01082a7:	83 c4 10             	add    $0x10,%esp
c01082aa:	6a 00                	push   $0x0
c01082ac:	68 9c bc 10 c0       	push   $0xc010bc9c
c01082b1:	68 97 bc 10 c0       	push   $0xc010bc97
c01082b6:	68 04 bd 10 c0       	push   $0xc010bd04
c01082bb:	e8 12 cf ff ff       	call   c01051d2 <execl>
c01082c0:	83 c4 10             	add    $0x10,%esp
c01082c3:	eb fe                	jmp    c01082c3 <simple_shell+0x180>
c01082c5:	8b 7d fc             	mov    -0x4(%ebp),%edi
c01082c8:	c9                   	leave  
c01082c9:	c3                   	ret    

c01082ca <test_shell>:
c01082ca:	55                   	push   %ebp
c01082cb:	89 e5                	mov    %esp,%ebp
c01082cd:	83 ec 38             	sub    $0x38,%esp
c01082d0:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c01082d7:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c01082de:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c01082e4:	83 ec 08             	sub    $0x8,%esp
c01082e7:	6a 02                	push   $0x2
c01082e9:	8d 45 ea             	lea    -0x16(%ebp),%eax
c01082ec:	50                   	push   %eax
c01082ed:	e8 ad c8 ff ff       	call   c0104b9f <open>
c01082f2:	83 c4 10             	add    $0x10,%esp
c01082f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01082f8:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c01082ff:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0108306:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c010830d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108314:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010831b:	83 ec 0c             	sub    $0xc,%esp
c010831e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108321:	50                   	push   %eax
c0108322:	e8 38 ea ff ff       	call   c0106d5f <untar>
c0108327:	83 c4 10             	add    $0x10,%esp
c010832a:	e8 14 fe ff ff       	call   c0108143 <simple_shell>
c010832f:	90                   	nop
c0108330:	c9                   	leave  
c0108331:	c3                   	ret    

c0108332 <test_exec>:
c0108332:	55                   	push   %ebp
c0108333:	89 e5                	mov    %esp,%ebp
c0108335:	83 ec 38             	sub    $0x38,%esp
c0108338:	83 ec 0c             	sub    $0xc,%esp
c010833b:	68 0a bd 10 c0       	push   $0xc010bd0a
c0108340:	e8 47 7d ff ff       	call   c010008c <disp_str>
c0108345:	83 c4 10             	add    $0x10,%esp
c0108348:	83 ec 0c             	sub    $0xc,%esp
c010834b:	68 1c bd 10 c0       	push   $0xc010bd1c
c0108350:	e8 37 7d ff ff       	call   c010008c <disp_str>
c0108355:	83 c4 10             	add    $0x10,%esp
c0108358:	83 ec 0c             	sub    $0xc,%esp
c010835b:	6a 07                	push   $0x7
c010835d:	e8 b8 ed ff ff       	call   c010711a <disp_int>
c0108362:	83 c4 10             	add    $0x10,%esp
c0108365:	83 ec 0c             	sub    $0xc,%esp
c0108368:	68 00 b6 10 c0       	push   $0xc010b600
c010836d:	e8 1a 7d ff ff       	call   c010008c <disp_str>
c0108372:	83 c4 10             	add    $0x10,%esp
c0108375:	83 ec 0c             	sub    $0xc,%esp
c0108378:	68 02 b6 10 c0       	push   $0xc010b602
c010837d:	e8 0a 7d ff ff       	call   c010008c <disp_str>
c0108382:	83 c4 10             	add    $0x10,%esp
c0108385:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c010838c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108393:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0108399:	83 ec 08             	sub    $0x8,%esp
c010839c:	6a 02                	push   $0x2
c010839e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c01083a1:	50                   	push   %eax
c01083a2:	e8 f8 c7 ff ff       	call   c0104b9f <open>
c01083a7:	83 c4 10             	add    $0x10,%esp
c01083aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01083ad:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c01083b4:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c01083bb:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c01083c2:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c01083c9:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01083d0:	83 ec 0c             	sub    $0xc,%esp
c01083d3:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01083d6:	50                   	push   %eax
c01083d7:	e8 83 e9 ff ff       	call   c0106d5f <untar>
c01083dc:	83 c4 10             	add    $0x10,%esp
c01083df:	83 ec 08             	sub    $0x8,%esp
c01083e2:	6a 00                	push   $0x0
c01083e4:	68 2f bd 10 c0       	push   $0xc010bd2f
c01083e9:	68 33 bd 10 c0       	push   $0xc010bd33
c01083ee:	68 9c bc 10 c0       	push   $0xc010bc9c
c01083f3:	68 97 bc 10 c0       	push   $0xc010bc97
c01083f8:	68 04 bd 10 c0       	push   $0xc010bd04
c01083fd:	e8 d0 cd ff ff       	call   c01051d2 <execl>
c0108402:	83 c4 20             	add    $0x20,%esp
c0108405:	e8 34 e8 ff ff       	call   c0106c3e <stop_here>
c010840a:	e8 f0 ca ff ff       	call   c0104eff <fork>
c010840f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108412:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108416:	7e 25                	jle    c010843d <test_exec+0x10b>
c0108418:	83 ec 0c             	sub    $0xc,%esp
c010841b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c010841e:	50                   	push   %eax
c010841f:	e8 68 ca ff ff       	call   c0104e8c <wait>
c0108424:	83 c4 10             	add    $0x10,%esp
c0108427:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010842a:	83 ec 08             	sub    $0x8,%esp
c010842d:	50                   	push   %eax
c010842e:	68 39 bd 10 c0       	push   $0xc010bd39
c0108433:	e8 b0 01 00 00       	call   c01085e8 <Printf>
c0108438:	83 c4 10             	add    $0x10,%esp
c010843b:	eb 33                	jmp    c0108470 <test_exec+0x13e>
c010843d:	83 ec 0c             	sub    $0xc,%esp
c0108440:	68 4b bd 10 c0       	push   $0xc010bd4b
c0108445:	e8 9e 01 00 00       	call   c01085e8 <Printf>
c010844a:	83 c4 10             	add    $0x10,%esp
c010844d:	83 ec 0c             	sub    $0xc,%esp
c0108450:	6a 00                	push   $0x0
c0108452:	68 33 bd 10 c0       	push   $0xc010bd33
c0108457:	68 9c bc 10 c0       	push   $0xc010bc9c
c010845c:	68 97 bc 10 c0       	push   $0xc010bc97
c0108461:	68 04 bd 10 c0       	push   $0xc010bd04
c0108466:	e8 67 cd ff ff       	call   c01051d2 <execl>
c010846b:	83 c4 20             	add    $0x20,%esp
c010846e:	eb fe                	jmp    c010846e <test_exec+0x13c>
c0108470:	c9                   	leave  
c0108471:	c3                   	ret    

c0108472 <INIT>:
c0108472:	55                   	push   %ebp
c0108473:	89 e5                	mov    %esp,%ebp
c0108475:	83 ec 08             	sub    $0x8,%esp
c0108478:	e8 4d fe ff ff       	call   c01082ca <test_shell>
c010847d:	eb fe                	jmp    c010847d <INIT+0xb>

c010847f <TestA>:
c010847f:	55                   	push   %ebp
c0108480:	89 e5                	mov    %esp,%ebp
c0108482:	83 ec 08             	sub    $0x8,%esp
c0108485:	83 ec 0c             	sub    $0xc,%esp
c0108488:	6a 05                	push   $0x5
c010848a:	e8 8b ec ff ff       	call   c010711a <disp_int>
c010848f:	83 c4 10             	add    $0x10,%esp
c0108492:	83 ec 0c             	sub    $0xc,%esp
c0108495:	68 13 b7 10 c0       	push   $0xc010b713
c010849a:	e8 ed 7b ff ff       	call   c010008c <disp_str>
c010849f:	83 c4 10             	add    $0x10,%esp
c01084a2:	83 ec 0c             	sub    $0xc,%esp
c01084a5:	68 59 bd 10 c0       	push   $0xc010bd59
c01084aa:	e8 dd 7b ff ff       	call   c010008c <disp_str>
c01084af:	83 c4 10             	add    $0x10,%esp
c01084b2:	eb fe                	jmp    c01084b2 <TestA+0x33>

c01084b4 <delay>:
c01084b4:	55                   	push   %ebp
c01084b5:	89 e5                	mov    %esp,%ebp
c01084b7:	83 ec 10             	sub    $0x10,%esp
c01084ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01084c1:	eb 2a                	jmp    c01084ed <delay+0x39>
c01084c3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01084ca:	eb 17                	jmp    c01084e3 <delay+0x2f>
c01084cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084d3:	eb 04                	jmp    c01084d9 <delay+0x25>
c01084d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01084d9:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01084dd:	7e f6                	jle    c01084d5 <delay+0x21>
c01084df:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01084e3:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c01084e7:	7e e3                	jle    c01084cc <delay+0x18>
c01084e9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01084ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01084f0:	3b 45 08             	cmp    0x8(%ebp),%eax
c01084f3:	7c ce                	jl     c01084c3 <delay+0xf>
c01084f5:	90                   	nop
c01084f6:	c9                   	leave  
c01084f7:	c3                   	ret    

c01084f8 <TestB>:
c01084f8:	55                   	push   %ebp
c01084f9:	89 e5                	mov    %esp,%ebp
c01084fb:	83 ec 08             	sub    $0x8,%esp
c01084fe:	83 ec 0c             	sub    $0xc,%esp
c0108501:	68 60 bd 10 c0       	push   $0xc010bd60
c0108506:	e8 81 7b ff ff       	call   c010008c <disp_str>
c010850b:	83 c4 10             	add    $0x10,%esp
c010850e:	eb fe                	jmp    c010850e <TestB+0x16>

c0108510 <TestC>:
c0108510:	55                   	push   %ebp
c0108511:	89 e5                	mov    %esp,%ebp
c0108513:	83 ec 18             	sub    $0x18,%esp
c0108516:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010851d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108521:	77 1a                	ja     c010853d <TestC+0x2d>
c0108523:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010852a:	83 ec 08             	sub    $0x8,%esp
c010852d:	ff 75 f0             	pushl  -0x10(%ebp)
c0108530:	68 63 bd 10 c0       	push   $0xc010bd63
c0108535:	e8 ae 00 00 00       	call   c01085e8 <Printf>
c010853a:	83 c4 10             	add    $0x10,%esp
c010853d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108541:	eb da                	jmp    c010851d <TestC+0xd>

c0108543 <sys_get_ticks>:
c0108543:	55                   	push   %ebp
c0108544:	89 e5                	mov    %esp,%ebp
c0108546:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010854b:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108551:	5d                   	pop    %ebp
c0108552:	c3                   	ret    

c0108553 <sys_write>:
c0108553:	55                   	push   %ebp
c0108554:	89 e5                	mov    %esp,%ebp
c0108556:	83 ec 18             	sub    $0x18,%esp
c0108559:	8b 45 10             	mov    0x10(%ebp),%eax
c010855c:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108562:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108568:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010856d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108570:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108573:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108576:	8b 45 08             	mov    0x8(%ebp),%eax
c0108579:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010857c:	eb 20                	jmp    c010859e <sys_write+0x4b>
c010857e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108581:	0f b6 00             	movzbl (%eax),%eax
c0108584:	0f b6 c0             	movzbl %al,%eax
c0108587:	83 ec 08             	sub    $0x8,%esp
c010858a:	50                   	push   %eax
c010858b:	ff 75 ec             	pushl  -0x14(%ebp)
c010858e:	e8 7d b9 ff ff       	call   c0103f10 <out_char>
c0108593:	83 c4 10             	add    $0x10,%esp
c0108596:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010859a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c010859e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01085a2:	7f da                	jg     c010857e <sys_write+0x2b>
c01085a4:	90                   	nop
c01085a5:	c9                   	leave  
c01085a6:	c3                   	ret    

c01085a7 <milli_delay>:
c01085a7:	55                   	push   %ebp
c01085a8:	89 e5                	mov    %esp,%ebp
c01085aa:	83 ec 18             	sub    $0x18,%esp
c01085ad:	e8 8a 11 00 00       	call   c010973c <get_ticks_ipc>
c01085b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085b5:	90                   	nop
c01085b6:	e8 81 11 00 00       	call   c010973c <get_ticks_ipc>
c01085bb:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01085be:	89 c1                	mov    %eax,%ecx
c01085c0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c01085c5:	89 c8                	mov    %ecx,%eax
c01085c7:	f7 ea                	imul   %edx
c01085c9:	c1 fa 05             	sar    $0x5,%edx
c01085cc:	89 c8                	mov    %ecx,%eax
c01085ce:	c1 f8 1f             	sar    $0x1f,%eax
c01085d1:	29 c2                	sub    %eax,%edx
c01085d3:	89 d0                	mov    %edx,%eax
c01085d5:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c01085db:	39 45 08             	cmp    %eax,0x8(%ebp)
c01085de:	77 d6                	ja     c01085b6 <milli_delay+0xf>
c01085e0:	90                   	nop
c01085e1:	c9                   	leave  
c01085e2:	c3                   	ret    

c01085e3 <TaskSys>:
c01085e3:	55                   	push   %ebp
c01085e4:	89 e5                	mov    %esp,%ebp
c01085e6:	eb fe                	jmp    c01085e6 <TaskSys+0x3>

c01085e8 <Printf>:
c01085e8:	55                   	push   %ebp
c01085e9:	89 e5                	mov    %esp,%ebp
c01085eb:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01085f1:	83 ec 04             	sub    $0x4,%esp
c01085f4:	68 00 01 00 00       	push   $0x100
c01085f9:	6a 00                	push   $0x0
c01085fb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108601:	50                   	push   %eax
c0108602:	e8 c8 3b 00 00       	call   c010c1cf <Memset>
c0108607:	83 c4 10             	add    $0x10,%esp
c010860a:	8d 45 0c             	lea    0xc(%ebp),%eax
c010860d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108610:	8b 45 08             	mov    0x8(%ebp),%eax
c0108613:	83 ec 04             	sub    $0x4,%esp
c0108616:	ff 75 f4             	pushl  -0xc(%ebp)
c0108619:	50                   	push   %eax
c010861a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108620:	50                   	push   %eax
c0108621:	e8 20 00 00 00       	call   c0108646 <vsprintf>
c0108626:	83 c4 10             	add    $0x10,%esp
c0108629:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010862c:	83 ec 04             	sub    $0x4,%esp
c010862f:	ff 75 f0             	pushl  -0x10(%ebp)
c0108632:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108638:	50                   	push   %eax
c0108639:	6a 00                	push   $0x0
c010863b:	e8 75 c7 ff ff       	call   c0104db5 <write>
c0108640:	83 c4 10             	add    $0x10,%esp
c0108643:	90                   	nop
c0108644:	c9                   	leave  
c0108645:	c3                   	ret    

c0108646 <vsprintf>:
c0108646:	55                   	push   %ebp
c0108647:	89 e5                	mov    %esp,%ebp
c0108649:	81 ec 68 02 00 00    	sub    $0x268,%esp
c010864f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108655:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010865b:	83 ec 04             	sub    $0x4,%esp
c010865e:	6a 40                	push   $0x40
c0108660:	6a 00                	push   $0x0
c0108662:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108668:	50                   	push   %eax
c0108669:	e8 61 3b 00 00       	call   c010c1cf <Memset>
c010866e:	83 c4 10             	add    $0x10,%esp
c0108671:	8b 45 10             	mov    0x10(%ebp),%eax
c0108674:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108677:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010867e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108681:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108684:	e9 53 01 00 00       	jmp    c01087dc <vsprintf+0x196>
c0108689:	8b 45 0c             	mov    0xc(%ebp),%eax
c010868c:	0f b6 00             	movzbl (%eax),%eax
c010868f:	3c 25                	cmp    $0x25,%al
c0108691:	74 16                	je     c01086a9 <vsprintf+0x63>
c0108693:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108696:	8d 50 01             	lea    0x1(%eax),%edx
c0108699:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010869c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010869f:	0f b6 12             	movzbl (%edx),%edx
c01086a2:	88 10                	mov    %dl,(%eax)
c01086a4:	e9 2f 01 00 00       	jmp    c01087d8 <vsprintf+0x192>
c01086a9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01086ad:	8b 45 0c             	mov    0xc(%ebp),%eax
c01086b0:	0f b6 00             	movzbl (%eax),%eax
c01086b3:	0f be c0             	movsbl %al,%eax
c01086b6:	83 f8 64             	cmp    $0x64,%eax
c01086b9:	74 26                	je     c01086e1 <vsprintf+0x9b>
c01086bb:	83 f8 64             	cmp    $0x64,%eax
c01086be:	7f 0e                	jg     c01086ce <vsprintf+0x88>
c01086c0:	83 f8 63             	cmp    $0x63,%eax
c01086c3:	0f 84 f2 00 00 00    	je     c01087bb <vsprintf+0x175>
c01086c9:	e9 0a 01 00 00       	jmp    c01087d8 <vsprintf+0x192>
c01086ce:	83 f8 73             	cmp    $0x73,%eax
c01086d1:	0f 84 b0 00 00 00    	je     c0108787 <vsprintf+0x141>
c01086d7:	83 f8 78             	cmp    $0x78,%eax
c01086da:	74 5d                	je     c0108739 <vsprintf+0xf3>
c01086dc:	e9 f7 00 00 00       	jmp    c01087d8 <vsprintf+0x192>
c01086e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086e4:	8b 00                	mov    (%eax),%eax
c01086e6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01086e9:	83 ec 04             	sub    $0x4,%esp
c01086ec:	6a 0a                	push   $0xa
c01086ee:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01086f4:	50                   	push   %eax
c01086f5:	ff 75 e8             	pushl  -0x18(%ebp)
c01086f8:	e8 96 10 00 00       	call   c0109793 <itoa>
c01086fd:	83 c4 10             	add    $0x10,%esp
c0108700:	83 ec 08             	sub    $0x8,%esp
c0108703:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108709:	50                   	push   %eax
c010870a:	ff 75 f4             	pushl  -0xc(%ebp)
c010870d:	e8 dc 3a 00 00       	call   c010c1ee <Strcpy>
c0108712:	83 c4 10             	add    $0x10,%esp
c0108715:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108719:	83 ec 0c             	sub    $0xc,%esp
c010871c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108722:	50                   	push   %eax
c0108723:	e8 e0 3a 00 00       	call   c010c208 <Strlen>
c0108728:	83 c4 10             	add    $0x10,%esp
c010872b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010872e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108731:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108734:	e9 9f 00 00 00       	jmp    c01087d8 <vsprintf+0x192>
c0108739:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010873c:	8b 00                	mov    (%eax),%eax
c010873e:	83 ec 08             	sub    $0x8,%esp
c0108741:	50                   	push   %eax
c0108742:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108748:	50                   	push   %eax
c0108749:	e8 26 e9 ff ff       	call   c0107074 <atoi>
c010874e:	83 c4 10             	add    $0x10,%esp
c0108751:	83 ec 08             	sub    $0x8,%esp
c0108754:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010875a:	50                   	push   %eax
c010875b:	ff 75 f4             	pushl  -0xc(%ebp)
c010875e:	e8 8b 3a 00 00       	call   c010c1ee <Strcpy>
c0108763:	83 c4 10             	add    $0x10,%esp
c0108766:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010876a:	83 ec 0c             	sub    $0xc,%esp
c010876d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108773:	50                   	push   %eax
c0108774:	e8 8f 3a 00 00       	call   c010c208 <Strlen>
c0108779:	83 c4 10             	add    $0x10,%esp
c010877c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010877f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108782:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108785:	eb 51                	jmp    c01087d8 <vsprintf+0x192>
c0108787:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010878a:	8b 00                	mov    (%eax),%eax
c010878c:	83 ec 08             	sub    $0x8,%esp
c010878f:	50                   	push   %eax
c0108790:	ff 75 f4             	pushl  -0xc(%ebp)
c0108793:	e8 56 3a 00 00       	call   c010c1ee <Strcpy>
c0108798:	83 c4 10             	add    $0x10,%esp
c010879b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010879e:	8b 00                	mov    (%eax),%eax
c01087a0:	83 ec 0c             	sub    $0xc,%esp
c01087a3:	50                   	push   %eax
c01087a4:	e8 5f 3a 00 00       	call   c010c208 <Strlen>
c01087a9:	83 c4 10             	add    $0x10,%esp
c01087ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01087af:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01087b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01087b6:	01 45 f4             	add    %eax,-0xc(%ebp)
c01087b9:	eb 1d                	jmp    c01087d8 <vsprintf+0x192>
c01087bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087be:	0f b6 10             	movzbl (%eax),%edx
c01087c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01087c4:	88 10                	mov    %dl,(%eax)
c01087c6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01087ca:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01087d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01087d4:	01 45 f4             	add    %eax,-0xc(%ebp)
c01087d7:	90                   	nop
c01087d8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01087dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01087df:	0f b6 00             	movzbl (%eax),%eax
c01087e2:	84 c0                	test   %al,%al
c01087e4:	0f 85 9f fe ff ff    	jne    c0108689 <vsprintf+0x43>
c01087ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01087ed:	2b 45 08             	sub    0x8(%ebp),%eax
c01087f0:	c9                   	leave  
c01087f1:	c3                   	ret    

c01087f2 <printx>:
c01087f2:	55                   	push   %ebp
c01087f3:	89 e5                	mov    %esp,%ebp
c01087f5:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01087fb:	8d 45 0c             	lea    0xc(%ebp),%eax
c01087fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108801:	8b 45 08             	mov    0x8(%ebp),%eax
c0108804:	83 ec 04             	sub    $0x4,%esp
c0108807:	ff 75 f4             	pushl  -0xc(%ebp)
c010880a:	50                   	push   %eax
c010880b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108811:	50                   	push   %eax
c0108812:	e8 2f fe ff ff       	call   c0108646 <vsprintf>
c0108817:	83 c4 10             	add    $0x10,%esp
c010881a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010881d:	83 ec 08             	sub    $0x8,%esp
c0108820:	ff 75 f0             	pushl  -0x10(%ebp)
c0108823:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108829:	50                   	push   %eax
c010882a:	e8 11 8e ff ff       	call   c0101640 <write_debug>
c010882f:	83 c4 10             	add    $0x10,%esp
c0108832:	90                   	nop
c0108833:	c9                   	leave  
c0108834:	c3                   	ret    

c0108835 <sys_printx>:
c0108835:	55                   	push   %ebp
c0108836:	89 e5                	mov    %esp,%ebp
c0108838:	83 ec 28             	sub    $0x28,%esp
c010883b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108840:	85 c0                	test   %eax,%eax
c0108842:	75 15                	jne    c0108859 <sys_printx+0x24>
c0108844:	8b 45 10             	mov    0x10(%ebp),%eax
c0108847:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c010884d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108850:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108857:	eb 10                	jmp    c0108869 <sys_printx+0x34>
c0108859:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010885e:	85 c0                	test   %eax,%eax
c0108860:	74 07                	je     c0108869 <sys_printx+0x34>
c0108862:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108869:	8b 55 08             	mov    0x8(%ebp),%edx
c010886c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010886f:	01 d0                	add    %edx,%eax
c0108871:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108874:	8b 45 10             	mov    0x10(%ebp),%eax
c0108877:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c010887d:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108883:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108888:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010888b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010888e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108891:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108894:	0f b6 00             	movzbl (%eax),%eax
c0108897:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010889a:	eb 3a                	jmp    c01088d6 <sys_printx+0xa1>
c010889c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010889f:	0f b6 00             	movzbl (%eax),%eax
c01088a2:	3c 3b                	cmp    $0x3b,%al
c01088a4:	74 0a                	je     c01088b0 <sys_printx+0x7b>
c01088a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01088a9:	0f b6 00             	movzbl (%eax),%eax
c01088ac:	3c 3a                	cmp    $0x3a,%al
c01088ae:	75 06                	jne    c01088b6 <sys_printx+0x81>
c01088b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01088b4:	eb 20                	jmp    c01088d6 <sys_printx+0xa1>
c01088b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01088b9:	0f b6 00             	movzbl (%eax),%eax
c01088bc:	0f b6 c0             	movzbl %al,%eax
c01088bf:	83 ec 08             	sub    $0x8,%esp
c01088c2:	50                   	push   %eax
c01088c3:	ff 75 e4             	pushl  -0x1c(%ebp)
c01088c6:	e8 45 b6 ff ff       	call   c0103f10 <out_char>
c01088cb:	83 c4 10             	add    $0x10,%esp
c01088ce:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01088d2:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01088d6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01088da:	7f c0                	jg     c010889c <sys_printx+0x67>
c01088dc:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c01088e0:	75 10                	jne    c01088f2 <sys_printx+0xbd>
c01088e2:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01088e7:	85 c0                	test   %eax,%eax
c01088e9:	74 13                	je     c01088fe <sys_printx+0xc9>
c01088eb:	e8 22 7a ff ff       	call   c0100312 <disable_int>
c01088f0:	eb 0c                	jmp    c01088fe <sys_printx+0xc9>
c01088f2:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c01088f6:	75 06                	jne    c01088fe <sys_printx+0xc9>
c01088f8:	e8 15 7a ff ff       	call   c0100312 <disable_int>
c01088fd:	90                   	nop
c01088fe:	90                   	nop
c01088ff:	c9                   	leave  
c0108900:	c3                   	ret    

c0108901 <spin>:
c0108901:	55                   	push   %ebp
c0108902:	89 e5                	mov    %esp,%ebp
c0108904:	83 ec 08             	sub    $0x8,%esp
c0108907:	83 ec 0c             	sub    $0xc,%esp
c010890a:	ff 75 08             	pushl  0x8(%ebp)
c010890d:	e8 7a 77 ff ff       	call   c010008c <disp_str>
c0108912:	83 c4 10             	add    $0x10,%esp
c0108915:	83 ec 0c             	sub    $0xc,%esp
c0108918:	68 13 b7 10 c0       	push   $0xc010b713
c010891d:	e8 6a 77 ff ff       	call   c010008c <disp_str>
c0108922:	83 c4 10             	add    $0x10,%esp
c0108925:	eb fe                	jmp    c0108925 <spin+0x24>

c0108927 <panic>:
c0108927:	55                   	push   %ebp
c0108928:	89 e5                	mov    %esp,%ebp
c010892a:	83 ec 08             	sub    $0x8,%esp
c010892d:	83 ec 04             	sub    $0x4,%esp
c0108930:	ff 75 08             	pushl  0x8(%ebp)
c0108933:	6a 3a                	push   $0x3a
c0108935:	68 70 bd 10 c0       	push   $0xc010bd70
c010893a:	e8 b3 fe ff ff       	call   c01087f2 <printx>
c010893f:	83 c4 10             	add    $0x10,%esp
c0108942:	90                   	nop
c0108943:	c9                   	leave  
c0108944:	c3                   	ret    

c0108945 <assertion_failure>:
c0108945:	55                   	push   %ebp
c0108946:	89 e5                	mov    %esp,%ebp
c0108948:	83 ec 08             	sub    $0x8,%esp
c010894b:	83 ec 08             	sub    $0x8,%esp
c010894e:	ff 75 14             	pushl  0x14(%ebp)
c0108951:	ff 75 10             	pushl  0x10(%ebp)
c0108954:	ff 75 0c             	pushl  0xc(%ebp)
c0108957:	ff 75 08             	pushl  0x8(%ebp)
c010895a:	6a 3b                	push   $0x3b
c010895c:	68 78 bd 10 c0       	push   $0xc010bd78
c0108961:	e8 8c fe ff ff       	call   c01087f2 <printx>
c0108966:	83 c4 20             	add    $0x20,%esp
c0108969:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108970:	00 00 00 
c0108973:	83 ec 0c             	sub    $0xc,%esp
c0108976:	68 00 b6 10 c0       	push   $0xc010b600
c010897b:	e8 0c 77 ff ff       	call   c010008c <disp_str>
c0108980:	83 c4 10             	add    $0x10,%esp
c0108983:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108988:	83 ec 0c             	sub    $0xc,%esp
c010898b:	50                   	push   %eax
c010898c:	e8 89 e7 ff ff       	call   c010711a <disp_int>
c0108991:	83 c4 10             	add    $0x10,%esp
c0108994:	83 ec 0c             	sub    $0xc,%esp
c0108997:	68 02 b6 10 c0       	push   $0xc010b602
c010899c:	e8 eb 76 ff ff       	call   c010008c <disp_str>
c01089a1:	83 c4 10             	add    $0x10,%esp
c01089a4:	83 ec 0c             	sub    $0xc,%esp
c01089a7:	68 ab bd 10 c0       	push   $0xc010bdab
c01089ac:	e8 50 ff ff ff       	call   c0108901 <spin>
c01089b1:	83 c4 10             	add    $0x10,%esp
c01089b4:	90                   	nop
c01089b5:	c9                   	leave  
c01089b6:	c3                   	ret    

c01089b7 <assertion_failure2>:
c01089b7:	55                   	push   %ebp
c01089b8:	89 e5                	mov    %esp,%ebp
c01089ba:	83 ec 08             	sub    $0x8,%esp
c01089bd:	83 ec 04             	sub    $0x4,%esp
c01089c0:	ff 75 18             	pushl  0x18(%ebp)
c01089c3:	ff 75 14             	pushl  0x14(%ebp)
c01089c6:	ff 75 10             	pushl  0x10(%ebp)
c01089c9:	ff 75 0c             	pushl  0xc(%ebp)
c01089cc:	ff 75 08             	pushl  0x8(%ebp)
c01089cf:	6a 3b                	push   $0x3b
c01089d1:	68 b8 bd 10 c0       	push   $0xc010bdb8
c01089d6:	e8 17 fe ff ff       	call   c01087f2 <printx>
c01089db:	83 c4 20             	add    $0x20,%esp
c01089de:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01089e5:	00 00 00 
c01089e8:	83 ec 0c             	sub    $0xc,%esp
c01089eb:	68 00 b6 10 c0       	push   $0xc010b600
c01089f0:	e8 97 76 ff ff       	call   c010008c <disp_str>
c01089f5:	83 c4 10             	add    $0x10,%esp
c01089f8:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01089fd:	83 ec 0c             	sub    $0xc,%esp
c0108a00:	50                   	push   %eax
c0108a01:	e8 14 e7 ff ff       	call   c010711a <disp_int>
c0108a06:	83 c4 10             	add    $0x10,%esp
c0108a09:	83 ec 0c             	sub    $0xc,%esp
c0108a0c:	68 02 b6 10 c0       	push   $0xc010b602
c0108a11:	e8 76 76 ff ff       	call   c010008c <disp_str>
c0108a16:	83 c4 10             	add    $0x10,%esp
c0108a19:	83 ec 0c             	sub    $0xc,%esp
c0108a1c:	68 ab bd 10 c0       	push   $0xc010bdab
c0108a21:	e8 db fe ff ff       	call   c0108901 <spin>
c0108a26:	83 c4 10             	add    $0x10,%esp
c0108a29:	90                   	nop
c0108a2a:	c9                   	leave  
c0108a2b:	c3                   	ret    

c0108a2c <dead_lock>:
c0108a2c:	55                   	push   %ebp
c0108a2d:	89 e5                	mov    %esp,%ebp
c0108a2f:	b8 00 00 00 00       	mov    $0x0,%eax
c0108a34:	5d                   	pop    %ebp
c0108a35:	c3                   	ret    

c0108a36 <sys_send_msg>:
c0108a36:	55                   	push   %ebp
c0108a37:	89 e5                	mov    %esp,%ebp
c0108a39:	83 ec 58             	sub    $0x58,%esp
c0108a3c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108a43:	83 ec 0c             	sub    $0xc,%esp
c0108a46:	ff 75 0c             	pushl  0xc(%ebp)
c0108a49:	e8 28 ae ff ff       	call   c0103876 <pid2proc>
c0108a4e:	83 c4 10             	add    $0x10,%esp
c0108a51:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108a54:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a58:	74 2c                	je     c0108a86 <sys_send_msg+0x50>
c0108a5a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a5d:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108a63:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108a68:	74 1c                	je     c0108a86 <sys_send_msg+0x50>
c0108a6a:	68 5c 05 00 00       	push   $0x55c
c0108a6f:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a74:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a79:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108a7e:	e8 c2 fe ff ff       	call   c0108945 <assertion_failure>
c0108a83:	83 c4 10             	add    $0x10,%esp
c0108a86:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a89:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108a8f:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108a94:	74 1c                	je     c0108ab2 <sys_send_msg+0x7c>
c0108a96:	68 5e 05 00 00       	push   $0x55e
c0108a9b:	68 61 ba 10 c0       	push   $0xc010ba61
c0108aa0:	68 61 ba 10 c0       	push   $0xc010ba61
c0108aa5:	68 20 be 10 c0       	push   $0xc010be20
c0108aaa:	e8 96 fe ff ff       	call   c0108945 <assertion_failure>
c0108aaf:	83 c4 10             	add    $0x10,%esp
c0108ab2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108ab6:	75 22                	jne    c0108ada <sys_send_msg+0xa4>
c0108ab8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108abc:	75 1c                	jne    c0108ada <sys_send_msg+0xa4>
c0108abe:	68 61 05 00 00       	push   $0x561
c0108ac3:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ac8:	68 61 ba 10 c0       	push   $0xc010ba61
c0108acd:	68 43 be 10 c0       	push   $0xc010be43
c0108ad2:	e8 6e fe ff ff       	call   c0108945 <assertion_failure>
c0108ad7:	83 c4 10             	add    $0x10,%esp
c0108ada:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108add:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ae4:	84 c0                	test   %al,%al
c0108ae6:	74 65                	je     c0108b4d <sys_send_msg+0x117>
c0108ae8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108aeb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108af2:	3c 01                	cmp    $0x1,%al
c0108af4:	74 57                	je     c0108b4d <sys_send_msg+0x117>
c0108af6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108af9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b00:	3c 02                	cmp    $0x2,%al
c0108b02:	74 49                	je     c0108b4d <sys_send_msg+0x117>
c0108b04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b07:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b0e:	3c 03                	cmp    $0x3,%al
c0108b10:	74 3b                	je     c0108b4d <sys_send_msg+0x117>
c0108b12:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b15:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b1c:	3c 04                	cmp    $0x4,%al
c0108b1e:	74 2d                	je     c0108b4d <sys_send_msg+0x117>
c0108b20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b23:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b2a:	0f be c0             	movsbl %al,%eax
c0108b2d:	83 ec 0c             	sub    $0xc,%esp
c0108b30:	68 65 05 00 00       	push   $0x565
c0108b35:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b3a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b3f:	50                   	push   %eax
c0108b40:	68 54 be 10 c0       	push   $0xc010be54
c0108b45:	e8 6d fe ff ff       	call   c01089b7 <assertion_failure2>
c0108b4a:	83 c4 20             	add    $0x20,%esp
c0108b4d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b50:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b57:	84 c0                	test   %al,%al
c0108b59:	74 65                	je     c0108bc0 <sys_send_msg+0x18a>
c0108b5b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b5e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b65:	3c 01                	cmp    $0x1,%al
c0108b67:	74 57                	je     c0108bc0 <sys_send_msg+0x18a>
c0108b69:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b6c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b73:	3c 02                	cmp    $0x2,%al
c0108b75:	74 49                	je     c0108bc0 <sys_send_msg+0x18a>
c0108b77:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b7a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b81:	3c 03                	cmp    $0x3,%al
c0108b83:	74 3b                	je     c0108bc0 <sys_send_msg+0x18a>
c0108b85:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b88:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b8f:	3c 04                	cmp    $0x4,%al
c0108b91:	74 2d                	je     c0108bc0 <sys_send_msg+0x18a>
c0108b93:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b96:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b9d:	0f be c0             	movsbl %al,%eax
c0108ba0:	83 ec 0c             	sub    $0xc,%esp
c0108ba3:	68 68 05 00 00       	push   $0x568
c0108ba8:	68 61 ba 10 c0       	push   $0xc010ba61
c0108bad:	68 61 ba 10 c0       	push   $0xc010ba61
c0108bb2:	50                   	push   %eax
c0108bb3:	68 f0 be 10 c0       	push   $0xc010bef0
c0108bb8:	e8 fa fd ff ff       	call   c01089b7 <assertion_failure2>
c0108bbd:	83 c4 20             	add    $0x20,%esp
c0108bc0:	83 ec 0c             	sub    $0xc,%esp
c0108bc3:	ff 75 10             	pushl  0x10(%ebp)
c0108bc6:	e8 31 ad ff ff       	call   c01038fc <proc2pid>
c0108bcb:	83 c4 10             	add    $0x10,%esp
c0108bce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108bd1:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108bd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0108bdb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108bde:	83 ec 08             	sub    $0x8,%esp
c0108be1:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108be4:	ff 75 dc             	pushl  -0x24(%ebp)
c0108be7:	e8 a6 d3 ff ff       	call   c0105f92 <get_physical_address_proc>
c0108bec:	83 c4 10             	add    $0x10,%esp
c0108bef:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108bf2:	83 ec 08             	sub    $0x8,%esp
c0108bf5:	ff 75 e0             	pushl  -0x20(%ebp)
c0108bf8:	ff 75 d8             	pushl  -0x28(%ebp)
c0108bfb:	e8 bf d2 ff ff       	call   c0105ebf <alloc_virtual_memory>
c0108c00:	83 c4 10             	add    $0x10,%esp
c0108c03:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108c06:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c09:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108c0f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108c12:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108c19:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108c1c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108c1f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108c22:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108c25:	89 10                	mov    %edx,(%eax)
c0108c27:	83 ec 08             	sub    $0x8,%esp
c0108c2a:	ff 75 0c             	pushl  0xc(%ebp)
c0108c2d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108c30:	e8 f7 fd ff ff       	call   c0108a2c <dead_lock>
c0108c35:	83 c4 10             	add    $0x10,%esp
c0108c38:	83 f8 01             	cmp    $0x1,%eax
c0108c3b:	75 10                	jne    c0108c4d <sys_send_msg+0x217>
c0108c3d:	83 ec 0c             	sub    $0xc,%esp
c0108c40:	68 80 bf 10 c0       	push   $0xc010bf80
c0108c45:	e8 dd fc ff ff       	call   c0108927 <panic>
c0108c4a:	83 c4 10             	add    $0x10,%esp
c0108c4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c50:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c57:	3c 02                	cmp    $0x2,%al
c0108c59:	0f 85 ca 01 00 00    	jne    c0108e29 <sys_send_msg+0x3f3>
c0108c5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c62:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108c68:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108c6b:	74 12                	je     c0108c7f <sys_send_msg+0x249>
c0108c6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c70:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108c76:	83 f8 12             	cmp    $0x12,%eax
c0108c79:	0f 85 aa 01 00 00    	jne    c0108e29 <sys_send_msg+0x3f3>
c0108c7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c82:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108c88:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108c8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c8e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108c94:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108c97:	83 ec 08             	sub    $0x8,%esp
c0108c9a:	ff 75 0c             	pushl  0xc(%ebp)
c0108c9d:	ff 75 c0             	pushl  -0x40(%ebp)
c0108ca0:	e8 ed d2 ff ff       	call   c0105f92 <get_physical_address_proc>
c0108ca5:	83 c4 10             	add    $0x10,%esp
c0108ca8:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108cab:	83 ec 08             	sub    $0x8,%esp
c0108cae:	ff 75 e0             	pushl  -0x20(%ebp)
c0108cb1:	ff 75 bc             	pushl  -0x44(%ebp)
c0108cb4:	e8 06 d2 ff ff       	call   c0105ebf <alloc_virtual_memory>
c0108cb9:	83 c4 10             	add    $0x10,%esp
c0108cbc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108cbf:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108cc2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108cc5:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108cc8:	83 ec 04             	sub    $0x4,%esp
c0108ccb:	51                   	push   %ecx
c0108ccc:	52                   	push   %edx
c0108ccd:	50                   	push   %eax
c0108cce:	e8 59 e0 ff ff       	call   c0106d2c <Memcpy>
c0108cd3:	83 c4 10             	add    $0x10,%esp
c0108cd6:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108cdb:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108ce0:	75 0a                	jne    c0108cec <sys_send_msg+0x2b6>
c0108ce2:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108ce9:	00 00 00 
c0108cec:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cef:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108cf6:	00 00 00 
c0108cf9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cfc:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108d03:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d06:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108d0d:	00 00 00 
c0108d10:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d13:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108d1a:	00 00 00 
c0108d1d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d20:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108d27:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d2a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108d31:	00 00 00 
c0108d34:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d37:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108d3e:	00 00 00 
c0108d41:	83 ec 0c             	sub    $0xc,%esp
c0108d44:	ff 75 e8             	pushl  -0x18(%ebp)
c0108d47:	e8 a0 09 00 00       	call   c01096ec <unblock>
c0108d4c:	83 c4 10             	add    $0x10,%esp
c0108d4f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d52:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d59:	84 c0                	test   %al,%al
c0108d5b:	74 1c                	je     c0108d79 <sys_send_msg+0x343>
c0108d5d:	68 a0 05 00 00       	push   $0x5a0
c0108d62:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d67:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d6c:	68 8b bf 10 c0       	push   $0xc010bf8b
c0108d71:	e8 cf fb ff ff       	call   c0108945 <assertion_failure>
c0108d76:	83 c4 10             	add    $0x10,%esp
c0108d79:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d7c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108d82:	83 f8 21             	cmp    $0x21,%eax
c0108d85:	74 1c                	je     c0108da3 <sys_send_msg+0x36d>
c0108d87:	68 a1 05 00 00       	push   $0x5a1
c0108d8c:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d91:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d96:	68 9f bf 10 c0       	push   $0xc010bf9f
c0108d9b:	e8 a5 fb ff ff       	call   c0108945 <assertion_failure>
c0108da0:	83 c4 10             	add    $0x10,%esp
c0108da3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108da6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108dac:	85 c0                	test   %eax,%eax
c0108dae:	74 1c                	je     c0108dcc <sys_send_msg+0x396>
c0108db0:	68 a3 05 00 00       	push   $0x5a3
c0108db5:	68 61 ba 10 c0       	push   $0xc010ba61
c0108dba:	68 61 ba 10 c0       	push   $0xc010ba61
c0108dbf:	68 bc bf 10 c0       	push   $0xc010bfbc
c0108dc4:	e8 7c fb ff ff       	call   c0108945 <assertion_failure>
c0108dc9:	83 c4 10             	add    $0x10,%esp
c0108dcc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108dcf:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dd6:	84 c0                	test   %al,%al
c0108dd8:	74 1c                	je     c0108df6 <sys_send_msg+0x3c0>
c0108dda:	68 a4 05 00 00       	push   $0x5a4
c0108ddf:	68 61 ba 10 c0       	push   $0xc010ba61
c0108de4:	68 61 ba 10 c0       	push   $0xc010ba61
c0108de9:	68 d1 bf 10 c0       	push   $0xc010bfd1
c0108dee:	e8 52 fb ff ff       	call   c0108945 <assertion_failure>
c0108df3:	83 c4 10             	add    $0x10,%esp
c0108df6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108df9:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108dff:	83 f8 21             	cmp    $0x21,%eax
c0108e02:	0f 84 45 01 00 00    	je     c0108f4d <sys_send_msg+0x517>
c0108e08:	68 a5 05 00 00       	push   $0x5a5
c0108e0d:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e12:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e17:	68 e8 bf 10 c0       	push   $0xc010bfe8
c0108e1c:	e8 24 fb ff ff       	call   c0108945 <assertion_failure>
c0108e21:	83 c4 10             	add    $0x10,%esp
c0108e24:	e9 24 01 00 00       	jmp    c0108f4d <sys_send_msg+0x517>
c0108e29:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108e30:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e33:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108e36:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e39:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e3f:	85 c0                	test   %eax,%eax
c0108e41:	75 1b                	jne    c0108e5e <sys_send_msg+0x428>
c0108e43:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e46:	8b 55 10             	mov    0x10(%ebp),%edx
c0108e49:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108e4f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e52:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108e59:	00 00 00 
c0108e5c:	eb 3f                	jmp    c0108e9d <sys_send_msg+0x467>
c0108e5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e61:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e67:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e6a:	eb 12                	jmp    c0108e7e <sys_send_msg+0x448>
c0108e6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108e6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108e72:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108e75:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108e7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e7e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108e82:	75 e8                	jne    c0108e6c <sys_send_msg+0x436>
c0108e84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108e87:	8b 55 10             	mov    0x10(%ebp),%edx
c0108e8a:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108e90:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e93:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108e9a:	00 00 00 
c0108e9d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ea0:	8b 55 08             	mov    0x8(%ebp),%edx
c0108ea3:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108ea9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eac:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108eaf:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108eb5:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eb8:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108ebf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ec2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ec9:	3c 01                	cmp    $0x1,%al
c0108ecb:	74 1c                	je     c0108ee9 <sys_send_msg+0x4b3>
c0108ecd:	68 c7 05 00 00       	push   $0x5c7
c0108ed2:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ed7:	68 61 ba 10 c0       	push   $0xc010ba61
c0108edc:	68 0c c0 10 c0       	push   $0xc010c00c
c0108ee1:	e8 5f fa ff ff       	call   c0108945 <assertion_failure>
c0108ee6:	83 c4 10             	add    $0x10,%esp
c0108ee9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eec:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108ef2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108ef5:	74 1c                	je     c0108f13 <sys_send_msg+0x4dd>
c0108ef7:	68 c8 05 00 00       	push   $0x5c8
c0108efc:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f01:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f06:	68 28 c0 10 c0       	push   $0xc010c028
c0108f0b:	e8 35 fa ff ff       	call   c0108945 <assertion_failure>
c0108f10:	83 c4 10             	add    $0x10,%esp
c0108f13:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f16:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108f1c:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108f1f:	74 1c                	je     c0108f3d <sys_send_msg+0x507>
c0108f21:	68 c9 05 00 00       	push   $0x5c9
c0108f26:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f2b:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f30:	68 4a c0 10 c0       	push   $0xc010c04a
c0108f35:	e8 0b fa ff ff       	call   c0108945 <assertion_failure>
c0108f3a:	83 c4 10             	add    $0x10,%esp
c0108f3d:	83 ec 0c             	sub    $0xc,%esp
c0108f40:	ff 75 10             	pushl  0x10(%ebp)
c0108f43:	e8 68 07 00 00       	call   c01096b0 <block>
c0108f48:	83 c4 10             	add    $0x10,%esp
c0108f4b:	eb 01                	jmp    c0108f4e <sys_send_msg+0x518>
c0108f4d:	90                   	nop
c0108f4e:	b8 00 00 00 00       	mov    $0x0,%eax
c0108f53:	c9                   	leave  
c0108f54:	c3                   	ret    

c0108f55 <sys_receive_msg>:
c0108f55:	55                   	push   %ebp
c0108f56:	89 e5                	mov    %esp,%ebp
c0108f58:	83 ec 58             	sub    $0x58,%esp
c0108f5b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108f62:	83 ec 0c             	sub    $0xc,%esp
c0108f65:	ff 75 0c             	pushl  0xc(%ebp)
c0108f68:	e8 09 a9 ff ff       	call   c0103876 <pid2proc>
c0108f6d:	83 c4 10             	add    $0x10,%esp
c0108f70:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108f73:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108f77:	74 2c                	je     c0108fa5 <sys_receive_msg+0x50>
c0108f79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f7c:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108f82:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108f87:	74 1c                	je     c0108fa5 <sys_receive_msg+0x50>
c0108f89:	68 dd 05 00 00       	push   $0x5dd
c0108f8e:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f93:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f98:	68 20 be 10 c0       	push   $0xc010be20
c0108f9d:	e8 a3 f9 ff ff       	call   c0108945 <assertion_failure>
c0108fa2:	83 c4 10             	add    $0x10,%esp
c0108fa5:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fa8:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108fae:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108fb3:	74 1c                	je     c0108fd1 <sys_receive_msg+0x7c>
c0108fb5:	68 df 05 00 00       	push   $0x5df
c0108fba:	68 61 ba 10 c0       	push   $0xc010ba61
c0108fbf:	68 61 ba 10 c0       	push   $0xc010ba61
c0108fc4:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108fc9:	e8 77 f9 ff ff       	call   c0108945 <assertion_failure>
c0108fce:	83 c4 10             	add    $0x10,%esp
c0108fd1:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fd4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fdb:	84 c0                	test   %al,%al
c0108fdd:	74 65                	je     c0109044 <sys_receive_msg+0xef>
c0108fdf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fe2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fe9:	3c 01                	cmp    $0x1,%al
c0108feb:	74 57                	je     c0109044 <sys_receive_msg+0xef>
c0108fed:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ff0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ff7:	3c 02                	cmp    $0x2,%al
c0108ff9:	74 49                	je     c0109044 <sys_receive_msg+0xef>
c0108ffb:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ffe:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109005:	3c 03                	cmp    $0x3,%al
c0109007:	74 3b                	je     c0109044 <sys_receive_msg+0xef>
c0109009:	8b 45 10             	mov    0x10(%ebp),%eax
c010900c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109013:	3c 04                	cmp    $0x4,%al
c0109015:	74 2d                	je     c0109044 <sys_receive_msg+0xef>
c0109017:	8b 45 10             	mov    0x10(%ebp),%eax
c010901a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109021:	0f be c0             	movsbl %al,%eax
c0109024:	83 ec 0c             	sub    $0xc,%esp
c0109027:	68 e2 05 00 00       	push   $0x5e2
c010902c:	68 61 ba 10 c0       	push   $0xc010ba61
c0109031:	68 61 ba 10 c0       	push   $0xc010ba61
c0109036:	50                   	push   %eax
c0109037:	68 54 be 10 c0       	push   $0xc010be54
c010903c:	e8 76 f9 ff ff       	call   c01089b7 <assertion_failure2>
c0109041:	83 c4 20             	add    $0x20,%esp
c0109044:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109048:	74 73                	je     c01090bd <sys_receive_msg+0x168>
c010904a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010904d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109054:	84 c0                	test   %al,%al
c0109056:	74 65                	je     c01090bd <sys_receive_msg+0x168>
c0109058:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010905b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109062:	3c 01                	cmp    $0x1,%al
c0109064:	74 57                	je     c01090bd <sys_receive_msg+0x168>
c0109066:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109069:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109070:	3c 02                	cmp    $0x2,%al
c0109072:	74 49                	je     c01090bd <sys_receive_msg+0x168>
c0109074:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109077:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010907e:	3c 03                	cmp    $0x3,%al
c0109080:	74 3b                	je     c01090bd <sys_receive_msg+0x168>
c0109082:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109085:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010908c:	3c 04                	cmp    $0x4,%al
c010908e:	74 2d                	je     c01090bd <sys_receive_msg+0x168>
c0109090:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109093:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010909a:	0f be c0             	movsbl %al,%eax
c010909d:	83 ec 0c             	sub    $0xc,%esp
c01090a0:	68 e6 05 00 00       	push   $0x5e6
c01090a5:	68 61 ba 10 c0       	push   $0xc010ba61
c01090aa:	68 61 ba 10 c0       	push   $0xc010ba61
c01090af:	50                   	push   %eax
c01090b0:	68 f0 be 10 c0       	push   $0xc010bef0
c01090b5:	e8 fd f8 ff ff       	call   c01089b7 <assertion_failure2>
c01090ba:	83 c4 20             	add    $0x20,%esp
c01090bd:	83 ec 0c             	sub    $0xc,%esp
c01090c0:	ff 75 10             	pushl  0x10(%ebp)
c01090c3:	e8 34 a8 ff ff       	call   c01038fc <proc2pid>
c01090c8:	83 c4 10             	add    $0x10,%esp
c01090cb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01090ce:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c01090d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01090d8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01090db:	8b 45 10             	mov    0x10(%ebp),%eax
c01090de:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01090e4:	83 ec 08             	sub    $0x8,%esp
c01090e7:	50                   	push   %eax
c01090e8:	ff 75 d8             	pushl  -0x28(%ebp)
c01090eb:	e8 a2 ce ff ff       	call   c0105f92 <get_physical_address_proc>
c01090f0:	83 c4 10             	add    $0x10,%esp
c01090f3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01090f6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01090fd:	8b 45 10             	mov    0x10(%ebp),%eax
c0109100:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109106:	85 c0                	test   %eax,%eax
c0109108:	0f 84 c5 00 00 00    	je     c01091d3 <sys_receive_msg+0x27e>
c010910e:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109112:	74 0d                	je     c0109121 <sys_receive_msg+0x1cc>
c0109114:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010911b:	0f 85 b2 00 00 00    	jne    c01091d3 <sys_receive_msg+0x27e>
c0109121:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0109128:	83 ec 0c             	sub    $0xc,%esp
c010912b:	ff 75 d0             	pushl  -0x30(%ebp)
c010912e:	e8 49 85 ff ff       	call   c010167c <sys_malloc>
c0109133:	83 c4 10             	add    $0x10,%esp
c0109136:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109139:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010913c:	83 ec 04             	sub    $0x4,%esp
c010913f:	50                   	push   %eax
c0109140:	6a 00                	push   $0x0
c0109142:	ff 75 cc             	pushl  -0x34(%ebp)
c0109145:	e8 85 30 00 00       	call   c010c1cf <Memset>
c010914a:	83 c4 10             	add    $0x10,%esp
c010914d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109150:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109156:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109159:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109160:	83 ec 08             	sub    $0x8,%esp
c0109163:	ff 75 d0             	pushl  -0x30(%ebp)
c0109166:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109169:	e8 51 cd ff ff       	call   c0105ebf <alloc_virtual_memory>
c010916e:	83 c4 10             	add    $0x10,%esp
c0109171:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0109174:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0109177:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010917a:	83 ec 04             	sub    $0x4,%esp
c010917d:	52                   	push   %edx
c010917e:	ff 75 cc             	pushl  -0x34(%ebp)
c0109181:	50                   	push   %eax
c0109182:	e8 a5 db ff ff       	call   c0106d2c <Memcpy>
c0109187:	83 c4 10             	add    $0x10,%esp
c010918a:	8b 45 10             	mov    0x10(%ebp),%eax
c010918d:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109194:	00 00 00 
c0109197:	8b 45 10             	mov    0x10(%ebp),%eax
c010919a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01091a1:	00 00 00 
c01091a4:	8b 45 10             	mov    0x10(%ebp),%eax
c01091a7:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01091ae:	00 00 00 
c01091b1:	8b 45 10             	mov    0x10(%ebp),%eax
c01091b4:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01091bb:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01091c2:	83 ec 08             	sub    $0x8,%esp
c01091c5:	ff 75 d0             	pushl  -0x30(%ebp)
c01091c8:	ff 75 cc             	pushl  -0x34(%ebp)
c01091cb:	e8 c1 84 ff ff       	call   c0101691 <sys_free>
c01091d0:	83 c4 10             	add    $0x10,%esp
c01091d3:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c01091d7:	0f 84 d4 03 00 00    	je     c01095b1 <sys_receive_msg+0x65c>
c01091dd:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01091e1:	75 26                	jne    c0109209 <sys_receive_msg+0x2b4>
c01091e3:	8b 45 10             	mov    0x10(%ebp),%eax
c01091e6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01091ec:	85 c0                	test   %eax,%eax
c01091ee:	0f 84 8a 00 00 00    	je     c010927e <sys_receive_msg+0x329>
c01091f4:	8b 45 10             	mov    0x10(%ebp),%eax
c01091f7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01091fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109200:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0109207:	eb 75                	jmp    c010927e <sys_receive_msg+0x329>
c0109209:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010920d:	78 6f                	js     c010927e <sys_receive_msg+0x329>
c010920f:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109213:	7f 69                	jg     c010927e <sys_receive_msg+0x329>
c0109215:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109218:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010921f:	3c 01                	cmp    $0x1,%al
c0109221:	75 5b                	jne    c010927e <sys_receive_msg+0x329>
c0109223:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109226:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010922c:	83 f8 12             	cmp    $0x12,%eax
c010922f:	74 0e                	je     c010923f <sys_receive_msg+0x2ea>
c0109231:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109234:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010923a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c010923d:	75 3f                	jne    c010927e <sys_receive_msg+0x329>
c010923f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109242:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109248:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010924b:	eb 2b                	jmp    c0109278 <sys_receive_msg+0x323>
c010924d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109250:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109253:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109256:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010925c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010925f:	39 c2                	cmp    %eax,%edx
c0109261:	75 09                	jne    c010926c <sys_receive_msg+0x317>
c0109263:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010926a:	eb 12                	jmp    c010927e <sys_receive_msg+0x329>
c010926c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010926f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0109275:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109278:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010927c:	75 cf                	jne    c010924d <sys_receive_msg+0x2f8>
c010927e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0109282:	0f 85 4e 02 00 00    	jne    c01094d6 <sys_receive_msg+0x581>
c0109288:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010928b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010928e:	83 ec 08             	sub    $0x8,%esp
c0109291:	ff 75 dc             	pushl  -0x24(%ebp)
c0109294:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109297:	e8 23 cc ff ff       	call   c0105ebf <alloc_virtual_memory>
c010929c:	83 c4 10             	add    $0x10,%esp
c010929f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01092a2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01092a5:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01092ab:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01092ae:	83 ec 0c             	sub    $0xc,%esp
c01092b1:	ff 75 c4             	pushl  -0x3c(%ebp)
c01092b4:	e8 43 a6 ff ff       	call   c01038fc <proc2pid>
c01092b9:	83 c4 10             	add    $0x10,%esp
c01092bc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01092bf:	83 ec 08             	sub    $0x8,%esp
c01092c2:	ff 75 b8             	pushl  -0x48(%ebp)
c01092c5:	ff 75 bc             	pushl  -0x44(%ebp)
c01092c8:	e8 c5 cc ff ff       	call   c0105f92 <get_physical_address_proc>
c01092cd:	83 c4 10             	add    $0x10,%esp
c01092d0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01092d3:	83 ec 08             	sub    $0x8,%esp
c01092d6:	ff 75 dc             	pushl  -0x24(%ebp)
c01092d9:	ff 75 b4             	pushl  -0x4c(%ebp)
c01092dc:	e8 de cb ff ff       	call   c0105ebf <alloc_virtual_memory>
c01092e1:	83 c4 10             	add    $0x10,%esp
c01092e4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01092e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01092ea:	83 ec 04             	sub    $0x4,%esp
c01092ed:	50                   	push   %eax
c01092ee:	ff 75 b0             	pushl  -0x50(%ebp)
c01092f1:	ff 75 c0             	pushl  -0x40(%ebp)
c01092f4:	e8 33 da ff ff       	call   c0106d2c <Memcpy>
c01092f9:	83 c4 10             	add    $0x10,%esp
c01092fc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01092ff:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0109302:	8b 45 10             	mov    0x10(%ebp),%eax
c0109305:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010930b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010930e:	75 21                	jne    c0109331 <sys_receive_msg+0x3dc>
c0109310:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109313:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109319:	8b 45 10             	mov    0x10(%ebp),%eax
c010931c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109322:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109325:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010932c:	00 00 00 
c010932f:	eb 1f                	jmp    c0109350 <sys_receive_msg+0x3fb>
c0109331:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109334:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010933a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010933d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109343:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109346:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010934d:	00 00 00 
c0109350:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109353:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010935a:	00 00 00 
c010935d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109360:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109367:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010936a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109371:	00 00 00 
c0109374:	8b 45 10             	mov    0x10(%ebp),%eax
c0109377:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010937e:	00 00 00 
c0109381:	8b 45 10             	mov    0x10(%ebp),%eax
c0109384:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010938b:	00 00 00 
c010938e:	8b 45 10             	mov    0x10(%ebp),%eax
c0109391:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109398:	00 00 00 
c010939b:	83 ec 0c             	sub    $0xc,%esp
c010939e:	ff 75 c4             	pushl  -0x3c(%ebp)
c01093a1:	e8 46 03 00 00       	call   c01096ec <unblock>
c01093a6:	83 c4 10             	add    $0x10,%esp
c01093a9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093ac:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01093b2:	85 c0                	test   %eax,%eax
c01093b4:	74 1c                	je     c01093d2 <sys_receive_msg+0x47d>
c01093b6:	68 56 06 00 00       	push   $0x656
c01093bb:	68 61 ba 10 c0       	push   $0xc010ba61
c01093c0:	68 61 ba 10 c0       	push   $0xc010ba61
c01093c5:	68 5f c0 10 c0       	push   $0xc010c05f
c01093ca:	e8 76 f5 ff ff       	call   c0108945 <assertion_failure>
c01093cf:	83 c4 10             	add    $0x10,%esp
c01093d2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093d5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01093dc:	84 c0                	test   %al,%al
c01093de:	74 1c                	je     c01093fc <sys_receive_msg+0x4a7>
c01093e0:	68 57 06 00 00       	push   $0x657
c01093e5:	68 61 ba 10 c0       	push   $0xc010ba61
c01093ea:	68 61 ba 10 c0       	push   $0xc010ba61
c01093ef:	68 77 c0 10 c0       	push   $0xc010c077
c01093f4:	e8 4c f5 ff ff       	call   c0108945 <assertion_failure>
c01093f9:	83 c4 10             	add    $0x10,%esp
c01093fc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093ff:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109405:	83 f8 21             	cmp    $0x21,%eax
c0109408:	74 1c                	je     c0109426 <sys_receive_msg+0x4d1>
c010940a:	68 58 06 00 00       	push   $0x658
c010940f:	68 61 ba 10 c0       	push   $0xc010ba61
c0109414:	68 61 ba 10 c0       	push   $0xc010ba61
c0109419:	68 90 c0 10 c0       	push   $0xc010c090
c010941e:	e8 22 f5 ff ff       	call   c0108945 <assertion_failure>
c0109423:	83 c4 10             	add    $0x10,%esp
c0109426:	8b 45 10             	mov    0x10(%ebp),%eax
c0109429:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010942f:	85 c0                	test   %eax,%eax
c0109431:	74 1c                	je     c010944f <sys_receive_msg+0x4fa>
c0109433:	68 5a 06 00 00       	push   $0x65a
c0109438:	68 61 ba 10 c0       	push   $0xc010ba61
c010943d:	68 61 ba 10 c0       	push   $0xc010ba61
c0109442:	68 bc bf 10 c0       	push   $0xc010bfbc
c0109447:	e8 f9 f4 ff ff       	call   c0108945 <assertion_failure>
c010944c:	83 c4 10             	add    $0x10,%esp
c010944f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109452:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109459:	84 c0                	test   %al,%al
c010945b:	74 1c                	je     c0109479 <sys_receive_msg+0x524>
c010945d:	68 5b 06 00 00       	push   $0x65b
c0109462:	68 61 ba 10 c0       	push   $0xc010ba61
c0109467:	68 61 ba 10 c0       	push   $0xc010ba61
c010946c:	68 d1 bf 10 c0       	push   $0xc010bfd1
c0109471:	e8 cf f4 ff ff       	call   c0108945 <assertion_failure>
c0109476:	83 c4 10             	add    $0x10,%esp
c0109479:	8b 45 10             	mov    0x10(%ebp),%eax
c010947c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109482:	83 f8 21             	cmp    $0x21,%eax
c0109485:	74 1c                	je     c01094a3 <sys_receive_msg+0x54e>
c0109487:	68 5c 06 00 00       	push   $0x65c
c010948c:	68 61 ba 10 c0       	push   $0xc010ba61
c0109491:	68 61 ba 10 c0       	push   $0xc010ba61
c0109496:	68 e8 bf 10 c0       	push   $0xc010bfe8
c010949b:	e8 a5 f4 ff ff       	call   c0108945 <assertion_failure>
c01094a0:	83 c4 10             	add    $0x10,%esp
c01094a3:	8b 45 10             	mov    0x10(%ebp),%eax
c01094a6:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01094ac:	83 f8 21             	cmp    $0x21,%eax
c01094af:	0f 84 f5 00 00 00    	je     c01095aa <sys_receive_msg+0x655>
c01094b5:	68 5d 06 00 00       	push   $0x65d
c01094ba:	68 61 ba 10 c0       	push   $0xc010ba61
c01094bf:	68 61 ba 10 c0       	push   $0xc010ba61
c01094c4:	68 b4 c0 10 c0       	push   $0xc010c0b4
c01094c9:	e8 77 f4 ff ff       	call   c0108945 <assertion_failure>
c01094ce:	83 c4 10             	add    $0x10,%esp
c01094d1:	e9 d4 00 00 00       	jmp    c01095aa <sys_receive_msg+0x655>
c01094d6:	8b 45 10             	mov    0x10(%ebp),%eax
c01094d9:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c01094e0:	8b 45 10             	mov    0x10(%ebp),%eax
c01094e3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094ea:	3c 02                	cmp    $0x2,%al
c01094ec:	74 1c                	je     c010950a <sys_receive_msg+0x5b5>
c01094ee:	68 62 06 00 00       	push   $0x662
c01094f3:	68 61 ba 10 c0       	push   $0xc010ba61
c01094f8:	68 61 ba 10 c0       	push   $0xc010ba61
c01094fd:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109502:	e8 3e f4 ff ff       	call   c0108945 <assertion_failure>
c0109507:	83 c4 10             	add    $0x10,%esp
c010950a:	8b 45 10             	mov    0x10(%ebp),%eax
c010950d:	8b 55 08             	mov    0x8(%ebp),%edx
c0109510:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109516:	8b 45 10             	mov    0x10(%ebp),%eax
c0109519:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109520:	3c 02                	cmp    $0x2,%al
c0109522:	74 1c                	je     c0109540 <sys_receive_msg+0x5eb>
c0109524:	68 64 06 00 00       	push   $0x664
c0109529:	68 61 ba 10 c0       	push   $0xc010ba61
c010952e:	68 61 ba 10 c0       	push   $0xc010ba61
c0109533:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109538:	e8 08 f4 ff ff       	call   c0108945 <assertion_failure>
c010953d:	83 c4 10             	add    $0x10,%esp
c0109540:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109544:	75 0f                	jne    c0109555 <sys_receive_msg+0x600>
c0109546:	8b 45 10             	mov    0x10(%ebp),%eax
c0109549:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c0109550:	00 00 00 
c0109553:	eb 0c                	jmp    c0109561 <sys_receive_msg+0x60c>
c0109555:	8b 45 10             	mov    0x10(%ebp),%eax
c0109558:	8b 55 0c             	mov    0xc(%ebp),%edx
c010955b:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0109561:	8b 45 10             	mov    0x10(%ebp),%eax
c0109564:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010956b:	3c 02                	cmp    $0x2,%al
c010956d:	74 2d                	je     c010959c <sys_receive_msg+0x647>
c010956f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109572:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109579:	0f be c0             	movsbl %al,%eax
c010957c:	83 ec 0c             	sub    $0xc,%esp
c010957f:	68 6f 06 00 00       	push   $0x66f
c0109584:	68 61 ba 10 c0       	push   $0xc010ba61
c0109589:	68 61 ba 10 c0       	push   $0xc010ba61
c010958e:	50                   	push   %eax
c010958f:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109594:	e8 1e f4 ff ff       	call   c01089b7 <assertion_failure2>
c0109599:	83 c4 20             	add    $0x20,%esp
c010959c:	83 ec 0c             	sub    $0xc,%esp
c010959f:	ff 75 10             	pushl  0x10(%ebp)
c01095a2:	e8 09 01 00 00       	call   c01096b0 <block>
c01095a7:	83 c4 10             	add    $0x10,%esp
c01095aa:	b8 00 00 00 00       	mov    $0x0,%eax
c01095af:	eb 02                	jmp    c01095b3 <sys_receive_msg+0x65e>
c01095b1:	90                   	nop
c01095b2:	90                   	nop
c01095b3:	c9                   	leave  
c01095b4:	c3                   	ret    

c01095b5 <send_rec>:
c01095b5:	55                   	push   %ebp
c01095b6:	89 e5                	mov    %esp,%ebp
c01095b8:	83 ec 18             	sub    $0x18,%esp
c01095bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01095be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01095c1:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01095c8:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01095cc:	74 28                	je     c01095f6 <send_rec+0x41>
c01095ce:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01095d2:	74 22                	je     c01095f6 <send_rec+0x41>
c01095d4:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01095d8:	74 1c                	je     c01095f6 <send_rec+0x41>
c01095da:	68 81 06 00 00       	push   $0x681
c01095df:	68 61 ba 10 c0       	push   $0xc010ba61
c01095e4:	68 61 ba 10 c0       	push   $0xc010ba61
c01095e9:	68 f4 c0 10 c0       	push   $0xc010c0f4
c01095ee:	e8 52 f3 ff ff       	call   c0108945 <assertion_failure>
c01095f3:	83 c4 10             	add    $0x10,%esp
c01095f6:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01095fa:	75 14                	jne    c0109610 <send_rec+0x5b>
c01095fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01095ff:	83 ec 04             	sub    $0x4,%esp
c0109602:	50                   	push   %eax
c0109603:	6a 00                	push   $0x0
c0109605:	ff 75 0c             	pushl  0xc(%ebp)
c0109608:	e8 c2 2b 00 00       	call   c010c1cf <Memset>
c010960d:	83 c4 10             	add    $0x10,%esp
c0109610:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109614:	74 23                	je     c0109639 <send_rec+0x84>
c0109616:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010961a:	74 34                	je     c0109650 <send_rec+0x9b>
c010961c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109620:	75 74                	jne    c0109696 <send_rec+0xe1>
c0109622:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109625:	83 ec 08             	sub    $0x8,%esp
c0109628:	ff 75 10             	pushl  0x10(%ebp)
c010962b:	50                   	push   %eax
c010962c:	e8 1f 80 ff ff       	call   c0101650 <send_msg>
c0109631:	83 c4 10             	add    $0x10,%esp
c0109634:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109637:	eb 70                	jmp    c01096a9 <send_rec+0xf4>
c0109639:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010963c:	83 ec 08             	sub    $0x8,%esp
c010963f:	ff 75 10             	pushl  0x10(%ebp)
c0109642:	50                   	push   %eax
c0109643:	e8 1e 80 ff ff       	call   c0101666 <receive_msg>
c0109648:	83 c4 10             	add    $0x10,%esp
c010964b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010964e:	eb 59                	jmp    c01096a9 <send_rec+0xf4>
c0109650:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109653:	83 ec 08             	sub    $0x8,%esp
c0109656:	ff 75 10             	pushl  0x10(%ebp)
c0109659:	50                   	push   %eax
c010965a:	e8 f1 7f ff ff       	call   c0101650 <send_msg>
c010965f:	83 c4 10             	add    $0x10,%esp
c0109662:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109665:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0109669:	75 3d                	jne    c01096a8 <send_rec+0xf3>
c010966b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010966e:	83 ec 04             	sub    $0x4,%esp
c0109671:	50                   	push   %eax
c0109672:	6a 00                	push   $0x0
c0109674:	ff 75 0c             	pushl  0xc(%ebp)
c0109677:	e8 53 2b 00 00       	call   c010c1cf <Memset>
c010967c:	83 c4 10             	add    $0x10,%esp
c010967f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109682:	83 ec 08             	sub    $0x8,%esp
c0109685:	ff 75 10             	pushl  0x10(%ebp)
c0109688:	50                   	push   %eax
c0109689:	e8 d8 7f ff ff       	call   c0101666 <receive_msg>
c010968e:	83 c4 10             	add    $0x10,%esp
c0109691:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109694:	eb 12                	jmp    c01096a8 <send_rec+0xf3>
c0109696:	83 ec 0c             	sub    $0xc,%esp
c0109699:	68 30 c1 10 c0       	push   $0xc010c130
c010969e:	e8 84 f2 ff ff       	call   c0108927 <panic>
c01096a3:	83 c4 10             	add    $0x10,%esp
c01096a6:	eb 01                	jmp    c01096a9 <send_rec+0xf4>
c01096a8:	90                   	nop
c01096a9:	b8 00 00 00 00       	mov    $0x0,%eax
c01096ae:	c9                   	leave  
c01096af:	c3                   	ret    

c01096b0 <block>:
c01096b0:	55                   	push   %ebp
c01096b1:	89 e5                	mov    %esp,%ebp
c01096b3:	83 ec 08             	sub    $0x8,%esp
c01096b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01096b9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096c0:	84 c0                	test   %al,%al
c01096c2:	75 1c                	jne    c01096e0 <block+0x30>
c01096c4:	68 b0 06 00 00       	push   $0x6b0
c01096c9:	68 61 ba 10 c0       	push   $0xc010ba61
c01096ce:	68 61 ba 10 c0       	push   $0xc010ba61
c01096d3:	68 45 c1 10 c0       	push   $0xc010c145
c01096d8:	e8 68 f2 ff ff       	call   c0108945 <assertion_failure>
c01096dd:	83 c4 10             	add    $0x10,%esp
c01096e0:	e8 13 a0 ff ff       	call   c01036f8 <schedule_process>
c01096e5:	b8 00 00 00 00       	mov    $0x0,%eax
c01096ea:	c9                   	leave  
c01096eb:	c3                   	ret    

c01096ec <unblock>:
c01096ec:	55                   	push   %ebp
c01096ed:	89 e5                	mov    %esp,%ebp
c01096ef:	83 ec 08             	sub    $0x8,%esp
c01096f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01096f5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096fc:	84 c0                	test   %al,%al
c01096fe:	74 1c                	je     c010971c <unblock+0x30>
c0109700:	68 b9 06 00 00       	push   $0x6b9
c0109705:	68 61 ba 10 c0       	push   $0xc010ba61
c010970a:	68 61 ba 10 c0       	push   $0xc010ba61
c010970f:	68 5d c1 10 c0       	push   $0xc010c15d
c0109714:	e8 2c f2 ff ff       	call   c0108945 <assertion_failure>
c0109719:	83 c4 10             	add    $0x10,%esp
c010971c:	8b 45 08             	mov    0x8(%ebp),%eax
c010971f:	05 60 02 00 00       	add    $0x260,%eax
c0109724:	83 ec 08             	sub    $0x8,%esp
c0109727:	50                   	push   %eax
c0109728:	68 ec fd 10 c0       	push   $0xc010fdec
c010972d:	e8 ce 0a 00 00       	call   c010a200 <appendToDoubleLinkList>
c0109732:	83 c4 10             	add    $0x10,%esp
c0109735:	b8 00 00 00 00       	mov    $0x0,%eax
c010973a:	c9                   	leave  
c010973b:	c3                   	ret    

c010973c <get_ticks_ipc>:
c010973c:	55                   	push   %ebp
c010973d:	89 e5                	mov    %esp,%ebp
c010973f:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109745:	83 ec 04             	sub    $0x4,%esp
c0109748:	6a 7c                	push   $0x7c
c010974a:	6a 00                	push   $0x0
c010974c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109752:	50                   	push   %eax
c0109753:	e8 77 2a 00 00       	call   c010c1cf <Memset>
c0109758:	83 c4 10             	add    $0x10,%esp
c010975b:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109762:	00 00 00 
c0109765:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010976c:	83 ec 04             	sub    $0x4,%esp
c010976f:	6a 01                	push   $0x1
c0109771:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109777:	50                   	push   %eax
c0109778:	6a 03                	push   $0x3
c010977a:	e8 36 fe ff ff       	call   c01095b5 <send_rec>
c010977f:	83 c4 10             	add    $0x10,%esp
c0109782:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109785:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010978b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010978e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109791:	c9                   	leave  
c0109792:	c3                   	ret    

c0109793 <itoa>:
c0109793:	55                   	push   %ebp
c0109794:	89 e5                	mov    %esp,%ebp
c0109796:	53                   	push   %ebx
c0109797:	83 ec 14             	sub    $0x14,%esp
c010979a:	8b 45 08             	mov    0x8(%ebp),%eax
c010979d:	99                   	cltd   
c010979e:	f7 7d 10             	idivl  0x10(%ebp)
c01097a1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01097a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01097a7:	99                   	cltd   
c01097a8:	f7 7d 10             	idivl  0x10(%ebp)
c01097ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01097ae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01097b2:	74 14                	je     c01097c8 <itoa+0x35>
c01097b4:	83 ec 04             	sub    $0x4,%esp
c01097b7:	ff 75 10             	pushl  0x10(%ebp)
c01097ba:	ff 75 0c             	pushl  0xc(%ebp)
c01097bd:	ff 75 f0             	pushl  -0x10(%ebp)
c01097c0:	e8 ce ff ff ff       	call   c0109793 <itoa>
c01097c5:	83 c4 10             	add    $0x10,%esp
c01097c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097cb:	8d 58 30             	lea    0x30(%eax),%ebx
c01097ce:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097d1:	8b 00                	mov    (%eax),%eax
c01097d3:	8d 48 01             	lea    0x1(%eax),%ecx
c01097d6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01097d9:	89 0a                	mov    %ecx,(%edx)
c01097db:	89 da                	mov    %ebx,%edx
c01097dd:	88 10                	mov    %dl,(%eax)
c01097df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097e2:	8b 00                	mov    (%eax),%eax
c01097e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01097e7:	c9                   	leave  
c01097e8:	c3                   	ret    

c01097e9 <i2a>:
c01097e9:	55                   	push   %ebp
c01097ea:	89 e5                	mov    %esp,%ebp
c01097ec:	53                   	push   %ebx
c01097ed:	83 ec 14             	sub    $0x14,%esp
c01097f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01097f3:	99                   	cltd   
c01097f4:	f7 7d 0c             	idivl  0xc(%ebp)
c01097f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01097fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01097fd:	99                   	cltd   
c01097fe:	f7 7d 0c             	idivl  0xc(%ebp)
c0109801:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109804:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109808:	74 14                	je     c010981e <i2a+0x35>
c010980a:	83 ec 04             	sub    $0x4,%esp
c010980d:	ff 75 10             	pushl  0x10(%ebp)
c0109810:	ff 75 0c             	pushl  0xc(%ebp)
c0109813:	ff 75 f0             	pushl  -0x10(%ebp)
c0109816:	e8 ce ff ff ff       	call   c01097e9 <i2a>
c010981b:	83 c4 10             	add    $0x10,%esp
c010981e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109822:	7f 0a                	jg     c010982e <i2a+0x45>
c0109824:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109827:	83 c0 30             	add    $0x30,%eax
c010982a:	89 c3                	mov    %eax,%ebx
c010982c:	eb 08                	jmp    c0109836 <i2a+0x4d>
c010982e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109831:	83 c0 37             	add    $0x37,%eax
c0109834:	89 c3                	mov    %eax,%ebx
c0109836:	8b 45 10             	mov    0x10(%ebp),%eax
c0109839:	8b 00                	mov    (%eax),%eax
c010983b:	8d 48 01             	lea    0x1(%eax),%ecx
c010983e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109841:	89 0a                	mov    %ecx,(%edx)
c0109843:	88 18                	mov    %bl,(%eax)
c0109845:	8b 45 10             	mov    0x10(%ebp),%eax
c0109848:	8b 00                	mov    (%eax),%eax
c010984a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010984d:	c9                   	leave  
c010984e:	c3                   	ret    

c010984f <inform_int>:
c010984f:	55                   	push   %ebp
c0109850:	89 e5                	mov    %esp,%ebp
c0109852:	83 ec 18             	sub    $0x18,%esp
c0109855:	83 ec 0c             	sub    $0xc,%esp
c0109858:	ff 75 08             	pushl  0x8(%ebp)
c010985b:	e8 16 a0 ff ff       	call   c0103876 <pid2proc>
c0109860:	83 c4 10             	add    $0x10,%esp
c0109863:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109866:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109869:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109870:	0f be c0             	movsbl %al,%eax
c0109873:	83 e0 02             	and    $0x2,%eax
c0109876:	85 c0                	test   %eax,%eax
c0109878:	0f 84 8e 00 00 00    	je     c010990c <inform_int+0xbd>
c010987e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109881:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109887:	3d 13 02 00 00       	cmp    $0x213,%eax
c010988c:	74 0e                	je     c010989c <inform_int+0x4d>
c010988e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109891:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109897:	83 f8 12             	cmp    $0x12,%eax
c010989a:	75 7d                	jne    c0109919 <inform_int+0xca>
c010989c:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01098a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098a6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01098ac:	83 ec 08             	sub    $0x8,%esp
c01098af:	ff 75 f0             	pushl  -0x10(%ebp)
c01098b2:	50                   	push   %eax
c01098b3:	e8 07 c6 ff ff       	call   c0105ebf <alloc_virtual_memory>
c01098b8:	83 c4 10             	add    $0x10,%esp
c01098bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01098be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01098c1:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c01098c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01098ca:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c01098d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098d4:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c01098db:	00 00 00 
c01098de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098e1:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01098e8:	00 00 00 
c01098eb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01098f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098f5:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01098fc:	83 ec 0c             	sub    $0xc,%esp
c01098ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0109902:	e8 e5 fd ff ff       	call   c01096ec <unblock>
c0109907:	83 c4 10             	add    $0x10,%esp
c010990a:	eb 0d                	jmp    c0109919 <inform_int+0xca>
c010990c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010990f:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109916:	00 00 00 
c0109919:	90                   	nop
c010991a:	c9                   	leave  
c010991b:	c3                   	ret    

c010991c <strcmp>:
c010991c:	55                   	push   %ebp
c010991d:	89 e5                	mov    %esp,%ebp
c010991f:	83 ec 10             	sub    $0x10,%esp
c0109922:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109926:	74 06                	je     c010992e <strcmp+0x12>
c0109928:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010992c:	75 08                	jne    c0109936 <strcmp+0x1a>
c010992e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109931:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109934:	eb 53                	jmp    c0109989 <strcmp+0x6d>
c0109936:	8b 45 08             	mov    0x8(%ebp),%eax
c0109939:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010993c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010993f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109942:	eb 18                	jmp    c010995c <strcmp+0x40>
c0109944:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109947:	0f b6 10             	movzbl (%eax),%edx
c010994a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010994d:	0f b6 00             	movzbl (%eax),%eax
c0109950:	38 c2                	cmp    %al,%dl
c0109952:	75 1e                	jne    c0109972 <strcmp+0x56>
c0109954:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0109958:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010995c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010995f:	0f b6 00             	movzbl (%eax),%eax
c0109962:	84 c0                	test   %al,%al
c0109964:	74 0d                	je     c0109973 <strcmp+0x57>
c0109966:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109969:	0f b6 00             	movzbl (%eax),%eax
c010996c:	84 c0                	test   %al,%al
c010996e:	75 d4                	jne    c0109944 <strcmp+0x28>
c0109970:	eb 01                	jmp    c0109973 <strcmp+0x57>
c0109972:	90                   	nop
c0109973:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109976:	0f b6 00             	movzbl (%eax),%eax
c0109979:	0f be d0             	movsbl %al,%edx
c010997c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010997f:	0f b6 00             	movzbl (%eax),%eax
c0109982:	0f be c0             	movsbl %al,%eax
c0109985:	29 c2                	sub    %eax,%edx
c0109987:	89 d0                	mov    %edx,%eax
c0109989:	c9                   	leave  
c010998a:	c3                   	ret    

c010998b <create_user_process_address_space>:
c010998b:	55                   	push   %ebp
c010998c:	89 e5                	mov    %esp,%ebp
c010998e:	83 ec 18             	sub    $0x18,%esp
c0109991:	83 ec 08             	sub    $0x8,%esp
c0109994:	6a 00                	push   $0x0
c0109996:	6a 01                	push   $0x1
c0109998:	e8 5a c8 ff ff       	call   c01061f7 <alloc_memory>
c010999d:	83 c4 10             	add    $0x10,%esp
c01099a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01099a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099a6:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c01099ad:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c01099b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01099b7:	05 ff 0f 00 00       	add    $0xfff,%eax
c01099bc:	c1 e8 0c             	shr    $0xc,%eax
c01099bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01099c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01099c5:	83 c0 07             	add    $0x7,%eax
c01099c8:	c1 e8 03             	shr    $0x3,%eax
c01099cb:	89 c2                	mov    %eax,%edx
c01099cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099d0:	89 50 04             	mov    %edx,0x4(%eax)
c01099d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099d6:	8b 40 04             	mov    0x4(%eax),%eax
c01099d9:	05 ff 0f 00 00       	add    $0xfff,%eax
c01099de:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01099e4:	85 c0                	test   %eax,%eax
c01099e6:	0f 48 c2             	cmovs  %edx,%eax
c01099e9:	c1 f8 0c             	sar    $0xc,%eax
c01099ec:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01099ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01099f2:	83 ec 08             	sub    $0x8,%esp
c01099f5:	6a 00                	push   $0x0
c01099f7:	50                   	push   %eax
c01099f8:	e8 fa c7 ff ff       	call   c01061f7 <alloc_memory>
c01099fd:	83 c4 10             	add    $0x10,%esp
c0109a00:	89 c2                	mov    %eax,%edx
c0109a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a05:	89 10                	mov    %edx,(%eax)
c0109a07:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a0a:	83 ec 0c             	sub    $0xc,%esp
c0109a0d:	50                   	push   %eax
c0109a0e:	e8 b6 bf ff ff       	call   c01059c9 <init_bitmap>
c0109a13:	83 c4 10             	add    $0x10,%esp
c0109a16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a19:	c9                   	leave  
c0109a1a:	c3                   	ret    

c0109a1b <user_process>:
c0109a1b:	55                   	push   %ebp
c0109a1c:	89 e5                	mov    %esp,%ebp
c0109a1e:	83 ec 38             	sub    $0x38,%esp
c0109a21:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109a28:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109a2f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109a36:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0109a3a:	75 0e                	jne    c0109a4a <user_process+0x2f>
c0109a3c:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109a42:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109a48:	eb 0c                	jmp    c0109a56 <user_process+0x3b>
c0109a4a:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109a50:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109a56:	e8 93 69 ff ff       	call   c01003ee <get_running_thread_pcb>
c0109a5b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109a5e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a61:	8b 55 14             	mov    0x14(%ebp),%edx
c0109a64:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109a6a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a6d:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109a73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a76:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109a7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a7f:	05 00 10 00 00       	add    $0x1000,%eax
c0109a84:	89 c2                	mov    %eax,%edx
c0109a86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a89:	89 10                	mov    %edx,(%eax)
c0109a8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a8e:	8b 00                	mov    (%eax),%eax
c0109a90:	83 e8 44             	sub    $0x44,%eax
c0109a93:	89 c2                	mov    %eax,%edx
c0109a95:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a98:	89 10                	mov    %edx,(%eax)
c0109a9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a9d:	8b 00                	mov    (%eax),%eax
c0109a9f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109aa2:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109aa6:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109aac:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109ab0:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109ab4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109ab8:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109abc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109ac0:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109ac4:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109aca:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109ace:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ad1:	89 50 34             	mov    %edx,0x34(%eax)
c0109ad4:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ad8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109adb:	89 50 0c             	mov    %edx,0xc(%eax)
c0109ade:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ae2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ae5:	89 50 04             	mov    %edx,0x4(%eax)
c0109ae8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109aec:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109aef:	89 50 08             	mov    %edx,0x8(%eax)
c0109af2:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109af6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109af9:	89 50 40             	mov    %edx,0x40(%eax)
c0109afc:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109b00:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b03:	89 10                	mov    %edx,(%eax)
c0109b05:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b08:	8b 55 08             	mov    0x8(%ebp),%edx
c0109b0b:	89 50 30             	mov    %edx,0x30(%eax)
c0109b0e:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109b12:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b15:	89 50 38             	mov    %edx,0x38(%eax)
c0109b18:	83 ec 08             	sub    $0x8,%esp
c0109b1b:	6a 01                	push   $0x1
c0109b1d:	68 00 f0 ff bf       	push   $0xbffff000
c0109b22:	e8 08 c6 ff ff       	call   c010612f <alloc_physical_memory>
c0109b27:	83 c4 10             	add    $0x10,%esp
c0109b2a:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109b30:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b33:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109b36:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b39:	83 ec 0c             	sub    $0xc,%esp
c0109b3c:	50                   	push   %eax
c0109b3d:	e8 7f 67 ff ff       	call   c01002c1 <restart>
c0109b42:	83 c4 10             	add    $0x10,%esp
c0109b45:	90                   	nop
c0109b46:	c9                   	leave  
c0109b47:	c3                   	ret    

c0109b48 <clone_pcb>:
c0109b48:	55                   	push   %ebp
c0109b49:	89 e5                	mov    %esp,%ebp
c0109b4b:	83 ec 38             	sub    $0x38,%esp
c0109b4e:	83 ec 08             	sub    $0x8,%esp
c0109b51:	6a 00                	push   $0x0
c0109b53:	6a 01                	push   $0x1
c0109b55:	e8 9d c6 ff ff       	call   c01061f7 <alloc_memory>
c0109b5a:	83 c4 10             	add    $0x10,%esp
c0109b5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109b60:	83 ec 04             	sub    $0x4,%esp
c0109b63:	68 00 10 00 00       	push   $0x1000
c0109b68:	6a 00                	push   $0x0
c0109b6a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b6d:	e8 5d 26 00 00       	call   c010c1cf <Memset>
c0109b72:	83 c4 10             	add    $0x10,%esp
c0109b75:	83 ec 04             	sub    $0x4,%esp
c0109b78:	68 00 10 00 00       	push   $0x1000
c0109b7d:	ff 75 08             	pushl  0x8(%ebp)
c0109b80:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b83:	e8 a4 d1 ff ff       	call   c0106d2c <Memcpy>
c0109b88:	83 c4 10             	add    $0x10,%esp
c0109b8b:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0109b90:	8d 50 01             	lea    0x1(%eax),%edx
c0109b93:	89 15 c8 06 11 c0    	mov    %edx,0xc01106c8
c0109b99:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109b9c:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109ba2:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ba5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109bab:	89 c2                	mov    %eax,%edx
c0109bad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bb0:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109bb6:	83 ec 08             	sub    $0x8,%esp
c0109bb9:	6a 00                	push   $0x0
c0109bbb:	6a 01                	push   $0x1
c0109bbd:	e8 35 c6 ff ff       	call   c01061f7 <alloc_memory>
c0109bc2:	83 c4 10             	add    $0x10,%esp
c0109bc5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109bc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bcb:	05 00 0c 00 00       	add    $0xc00,%eax
c0109bd0:	83 ec 04             	sub    $0x4,%esp
c0109bd3:	68 00 04 00 00       	push   $0x400
c0109bd8:	68 00 fc ff ff       	push   $0xfffffc00
c0109bdd:	50                   	push   %eax
c0109bde:	e8 49 d1 ff ff       	call   c0106d2c <Memcpy>
c0109be3:	83 c4 10             	add    $0x10,%esp
c0109be6:	83 ec 0c             	sub    $0xc,%esp
c0109be9:	ff 75 f0             	pushl  -0x10(%ebp)
c0109bec:	e8 1d c4 ff ff       	call   c010600e <get_physical_address>
c0109bf1:	83 c4 10             	add    $0x10,%esp
c0109bf4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109bf7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bfa:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109bff:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109c02:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109c05:	83 c8 07             	or     $0x7,%eax
c0109c08:	89 c2                	mov    %eax,%edx
c0109c0a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109c0d:	89 10                	mov    %edx,(%eax)
c0109c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c12:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109c15:	89 50 08             	mov    %edx,0x8(%eax)
c0109c18:	e8 6e fd ff ff       	call   c010998b <create_user_process_address_space>
c0109c1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c20:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109c23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c26:	89 50 0c             	mov    %edx,0xc(%eax)
c0109c29:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c2c:	8b 40 0c             	mov    0xc(%eax),%eax
c0109c2f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109c32:	83 ec 04             	sub    $0x4,%esp
c0109c35:	6a 0c                	push   $0xc
c0109c37:	ff 75 e0             	pushl  -0x20(%ebp)
c0109c3a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109c3d:	e8 ea d0 ff ff       	call   c0106d2c <Memcpy>
c0109c42:	83 c4 10             	add    $0x10,%esp
c0109c45:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109c4c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109c4f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109c54:	c1 e8 0c             	shr    $0xc,%eax
c0109c57:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109c5a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109c5d:	83 c0 07             	add    $0x7,%eax
c0109c60:	c1 e8 03             	shr    $0x3,%eax
c0109c63:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109c66:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109c69:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109c6c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109c6f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109c74:	c1 e8 0c             	shr    $0xc,%eax
c0109c77:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109c7a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109c7d:	83 ec 08             	sub    $0x8,%esp
c0109c80:	6a 00                	push   $0x0
c0109c82:	50                   	push   %eax
c0109c83:	e8 6f c5 ff ff       	call   c01061f7 <alloc_memory>
c0109c88:	83 c4 10             	add    $0x10,%esp
c0109c8b:	89 c2                	mov    %eax,%edx
c0109c8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c90:	89 10                	mov    %edx,(%eax)
c0109c92:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109c95:	c1 e0 0c             	shl    $0xc,%eax
c0109c98:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109c9b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c9e:	8b 10                	mov    (%eax),%edx
c0109ca0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ca3:	8b 00                	mov    (%eax),%eax
c0109ca5:	83 ec 04             	sub    $0x4,%esp
c0109ca8:	ff 75 cc             	pushl  -0x34(%ebp)
c0109cab:	52                   	push   %edx
c0109cac:	50                   	push   %eax
c0109cad:	e8 7a d0 ff ff       	call   c0106d2c <Memcpy>
c0109cb2:	83 c4 10             	add    $0x10,%esp
c0109cb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cb8:	c9                   	leave  
c0109cb9:	c3                   	ret    

c0109cba <build_body_stack>:
c0109cba:	55                   	push   %ebp
c0109cbb:	89 e5                	mov    %esp,%ebp
c0109cbd:	83 ec 48             	sub    $0x48,%esp
c0109cc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109cc3:	8b 40 0c             	mov    0xc(%eax),%eax
c0109cc6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109cc9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ccc:	8b 50 04             	mov    0x4(%eax),%edx
c0109ccf:	8b 00                	mov    (%eax),%eax
c0109cd1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109cd4:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109cd7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109cda:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109cdd:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109ce0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109ce3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ce6:	8b 40 08             	mov    0x8(%eax),%eax
c0109ce9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109cec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109cf3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109cfa:	e8 c9 cf ff ff       	call   c0106cc8 <intr_disable>
c0109cff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109d02:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109d09:	e9 c2 00 00 00       	jmp    c0109dd0 <build_body_stack+0x116>
c0109d0e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109d11:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d14:	01 d0                	add    %edx,%eax
c0109d16:	0f b6 00             	movzbl (%eax),%eax
c0109d19:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109d1c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109d23:	e9 9a 00 00 00       	jmp    c0109dc2 <build_body_stack+0x108>
c0109d28:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109d2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109d2f:	89 c1                	mov    %eax,%ecx
c0109d31:	d3 fa                	sar    %cl,%edx
c0109d33:	89 d0                	mov    %edx,%eax
c0109d35:	83 e0 01             	and    $0x1,%eax
c0109d38:	85 c0                	test   %eax,%eax
c0109d3a:	75 06                	jne    c0109d42 <build_body_stack+0x88>
c0109d3c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109d40:	eb 7c                	jmp    c0109dbe <build_body_stack+0x104>
c0109d42:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d45:	8b 40 08             	mov    0x8(%eax),%eax
c0109d48:	83 ec 0c             	sub    $0xc,%esp
c0109d4b:	50                   	push   %eax
c0109d4c:	e8 81 66 ff ff       	call   c01003d2 <update_cr3>
c0109d51:	83 c4 10             	add    $0x10,%esp
c0109d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d57:	c1 e0 0c             	shl    $0xc,%eax
c0109d5a:	89 c2                	mov    %eax,%edx
c0109d5c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109d5f:	01 d0                	add    %edx,%eax
c0109d61:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109d64:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109d67:	8b 45 10             	mov    0x10(%ebp),%eax
c0109d6a:	83 ec 04             	sub    $0x4,%esp
c0109d6d:	68 00 10 00 00       	push   $0x1000
c0109d72:	52                   	push   %edx
c0109d73:	50                   	push   %eax
c0109d74:	e8 b3 cf ff ff       	call   c0106d2c <Memcpy>
c0109d79:	83 c4 10             	add    $0x10,%esp
c0109d7c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109d7f:	8b 40 08             	mov    0x8(%eax),%eax
c0109d82:	83 ec 0c             	sub    $0xc,%esp
c0109d85:	50                   	push   %eax
c0109d86:	e8 47 66 ff ff       	call   c01003d2 <update_cr3>
c0109d8b:	83 c4 10             	add    $0x10,%esp
c0109d8e:	83 ec 08             	sub    $0x8,%esp
c0109d91:	ff 75 cc             	pushl  -0x34(%ebp)
c0109d94:	6a 01                	push   $0x1
c0109d96:	e8 be c4 ff ff       	call   c0106259 <get_a_virtual_page>
c0109d9b:	83 c4 10             	add    $0x10,%esp
c0109d9e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109da1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109da4:	83 ec 04             	sub    $0x4,%esp
c0109da7:	68 00 10 00 00       	push   $0x1000
c0109dac:	52                   	push   %edx
c0109dad:	50                   	push   %eax
c0109dae:	e8 79 cf ff ff       	call   c0106d2c <Memcpy>
c0109db3:	83 c4 10             	add    $0x10,%esp
c0109db6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109dba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109dbe:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109dc2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109dc6:	0f 8e 5c ff ff ff    	jle    c0109d28 <build_body_stack+0x6e>
c0109dcc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109dd0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109dd3:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109dd6:	0f 87 32 ff ff ff    	ja     c0109d0e <build_body_stack+0x54>
c0109ddc:	83 ec 0c             	sub    $0xc,%esp
c0109ddf:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109de2:	e8 0a cf ff ff       	call   c0106cf1 <intr_set_status>
c0109de7:	83 c4 10             	add    $0x10,%esp
c0109dea:	90                   	nop
c0109deb:	c9                   	leave  
c0109dec:	c3                   	ret    

c0109ded <build_process_kernel_stack>:
c0109ded:	55                   	push   %ebp
c0109dee:	89 e5                	mov    %esp,%ebp
c0109df0:	83 ec 28             	sub    $0x28,%esp
c0109df3:	e8 d0 ce ff ff       	call   c0106cc8 <intr_disable>
c0109df8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109dfb:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dfe:	05 00 10 00 00       	add    $0x1000,%eax
c0109e03:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e09:	8b 00                	mov    (%eax),%eax
c0109e0b:	83 f8 38             	cmp    $0x38,%eax
c0109e0e:	74 06                	je     c0109e16 <build_process_kernel_stack+0x29>
c0109e10:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109e14:	eb f0                	jmp    c0109e06 <build_process_kernel_stack+0x19>
c0109e16:	90                   	nop
c0109e17:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e1a:	05 00 10 00 00       	add    $0x1000,%eax
c0109e1f:	89 c2                	mov    %eax,%edx
c0109e21:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e24:	89 50 04             	mov    %edx,0x4(%eax)
c0109e27:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e2a:	83 c0 2c             	add    $0x2c,%eax
c0109e2d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e33:	83 e8 04             	sub    $0x4,%eax
c0109e36:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109e39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e3c:	83 e8 08             	sub    $0x8,%eax
c0109e3f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e45:	83 e8 0c             	sub    $0xc,%eax
c0109e48:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109e4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e4e:	83 e8 10             	sub    $0x10,%eax
c0109e51:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109e54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e57:	83 e8 14             	sub    $0x14,%eax
c0109e5a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109e5d:	ba b2 02 10 c0       	mov    $0xc01002b2,%edx
c0109e62:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e65:	89 10                	mov    %edx,(%eax)
c0109e67:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e6a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109e70:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e73:	8b 10                	mov    (%eax),%edx
c0109e75:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e78:	89 10                	mov    %edx,(%eax)
c0109e7a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e7d:	8b 10                	mov    (%eax),%edx
c0109e7f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e82:	89 10                	mov    %edx,(%eax)
c0109e84:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e87:	8b 10                	mov    (%eax),%edx
c0109e89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e8c:	89 10                	mov    %edx,(%eax)
c0109e8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e91:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109e97:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e9a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109e9d:	89 10                	mov    %edx,(%eax)
c0109e9f:	83 ec 0c             	sub    $0xc,%esp
c0109ea2:	ff 75 f0             	pushl  -0x10(%ebp)
c0109ea5:	e8 47 ce ff ff       	call   c0106cf1 <intr_set_status>
c0109eaa:	83 c4 10             	add    $0x10,%esp
c0109ead:	90                   	nop
c0109eae:	c9                   	leave  
c0109eaf:	c3                   	ret    

c0109eb0 <fork_process>:
c0109eb0:	55                   	push   %ebp
c0109eb1:	89 e5                	mov    %esp,%ebp
c0109eb3:	83 ec 18             	sub    $0x18,%esp
c0109eb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0109eb9:	83 ec 0c             	sub    $0xc,%esp
c0109ebc:	50                   	push   %eax
c0109ebd:	e8 b4 99 ff ff       	call   c0103876 <pid2proc>
c0109ec2:	83 c4 10             	add    $0x10,%esp
c0109ec5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109ec8:	83 ec 0c             	sub    $0xc,%esp
c0109ecb:	ff 75 f4             	pushl  -0xc(%ebp)
c0109ece:	e8 75 fc ff ff       	call   c0109b48 <clone_pcb>
c0109ed3:	83 c4 10             	add    $0x10,%esp
c0109ed6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109ed9:	83 ec 08             	sub    $0x8,%esp
c0109edc:	6a 00                	push   $0x0
c0109ede:	6a 01                	push   $0x1
c0109ee0:	e8 12 c3 ff ff       	call   c01061f7 <alloc_memory>
c0109ee5:	83 c4 10             	add    $0x10,%esp
c0109ee8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109eeb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109eee:	83 ec 04             	sub    $0x4,%esp
c0109ef1:	68 00 10 00 00       	push   $0x1000
c0109ef6:	6a 00                	push   $0x0
c0109ef8:	50                   	push   %eax
c0109ef9:	e8 d1 22 00 00       	call   c010c1cf <Memset>
c0109efe:	83 c4 10             	add    $0x10,%esp
c0109f01:	83 ec 04             	sub    $0x4,%esp
c0109f04:	ff 75 ec             	pushl  -0x14(%ebp)
c0109f07:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f0a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f0d:	e8 a8 fd ff ff       	call   c0109cba <build_body_stack>
c0109f12:	83 c4 10             	add    $0x10,%esp
c0109f15:	83 ec 0c             	sub    $0xc,%esp
c0109f18:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f1b:	e8 cd fe ff ff       	call   c0109ded <build_process_kernel_stack>
c0109f20:	83 c4 10             	add    $0x10,%esp
c0109f23:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f26:	05 6a 02 00 00       	add    $0x26a,%eax
c0109f2b:	83 ec 08             	sub    $0x8,%esp
c0109f2e:	50                   	push   %eax
c0109f2f:	68 04 0f 11 c0       	push   $0xc0110f04
c0109f34:	e8 c7 02 00 00       	call   c010a200 <appendToDoubleLinkList>
c0109f39:	83 c4 10             	add    $0x10,%esp
c0109f3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f3f:	c9                   	leave  
c0109f40:	c3                   	ret    

c0109f41 <process_execute>:
c0109f41:	55                   	push   %ebp
c0109f42:	89 e5                	mov    %esp,%ebp
c0109f44:	83 ec 28             	sub    $0x28,%esp
c0109f47:	e8 ca 04 00 00       	call   c010a416 <thread_init>
c0109f4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109f4f:	83 ec 0c             	sub    $0xc,%esp
c0109f52:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f55:	e8 69 05 00 00       	call   c010a4c3 <thread_create>
c0109f5a:	83 c4 10             	add    $0x10,%esp
c0109f5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f60:	05 28 01 00 00       	add    $0x128,%eax
c0109f65:	83 ec 08             	sub    $0x8,%esp
c0109f68:	ff 75 10             	pushl  0x10(%ebp)
c0109f6b:	50                   	push   %eax
c0109f6c:	e8 7d 22 00 00       	call   c010c1ee <Strcpy>
c0109f71:	83 c4 10             	add    $0x10,%esp
c0109f74:	83 ec 08             	sub    $0x8,%esp
c0109f77:	6a 00                	push   $0x0
c0109f79:	6a 01                	push   $0x1
c0109f7b:	e8 77 c2 ff ff       	call   c01061f7 <alloc_memory>
c0109f80:	83 c4 10             	add    $0x10,%esp
c0109f83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109f86:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f89:	05 00 0c 00 00       	add    $0xc00,%eax
c0109f8e:	83 ec 04             	sub    $0x4,%esp
c0109f91:	68 00 04 00 00       	push   $0x400
c0109f96:	68 00 fc ff ff       	push   $0xfffffc00
c0109f9b:	50                   	push   %eax
c0109f9c:	e8 8b cd ff ff       	call   c0106d2c <Memcpy>
c0109fa1:	83 c4 10             	add    $0x10,%esp
c0109fa4:	83 ec 0c             	sub    $0xc,%esp
c0109fa7:	ff 75 f0             	pushl  -0x10(%ebp)
c0109faa:	e8 5f c0 ff ff       	call   c010600e <get_physical_address>
c0109faf:	83 c4 10             	add    $0x10,%esp
c0109fb2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109fb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109fb8:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109fbd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109fc0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109fc3:	83 c8 07             	or     $0x7,%eax
c0109fc6:	89 c2                	mov    %eax,%edx
c0109fc8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109fcb:	89 10                	mov    %edx,(%eax)
c0109fcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fd0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109fd3:	89 50 08             	mov    %edx,0x8(%eax)
c0109fd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fd9:	83 c0 10             	add    $0x10,%eax
c0109fdc:	83 ec 0c             	sub    $0xc,%esp
c0109fdf:	50                   	push   %eax
c0109fe0:	e8 c8 c7 ff ff       	call   c01067ad <init_memory_block_desc>
c0109fe5:	83 c4 10             	add    $0x10,%esp
c0109fe8:	e8 9e f9 ff ff       	call   c010998b <create_user_process_address_space>
c0109fed:	89 c2                	mov    %eax,%edx
c0109fef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ff2:	89 50 0c             	mov    %edx,0xc(%eax)
c0109ff5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ff8:	8b 00                	mov    (%eax),%eax
c0109ffa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109ffd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a000:	c7 40 10 1b 9a 10 c0 	movl   $0xc0109a1b,0x10(%eax)
c010a007:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a00a:	8b 55 08             	mov    0x8(%ebp),%edx
c010a00d:	89 50 18             	mov    %edx,0x18(%eax)
c010a010:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a013:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a016:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a019:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a01c:	8b 55 14             	mov    0x14(%ebp),%edx
c010a01f:	89 50 20             	mov    %edx,0x20(%eax)
c010a022:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a025:	8b 55 18             	mov    0x18(%ebp),%edx
c010a028:	89 50 24             	mov    %edx,0x24(%eax)
c010a02b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010a02e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a031:	89 50 28             	mov    %edx,0x28(%eax)
c010a034:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a037:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a03d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a040:	8b 10                	mov    (%eax),%edx
c010a042:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a045:	89 50 04             	mov    %edx,0x4(%eax)
c010a048:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a04b:	8b 50 04             	mov    0x4(%eax),%edx
c010a04e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a051:	89 50 08             	mov    %edx,0x8(%eax)
c010a054:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a057:	8b 50 08             	mov    0x8(%eax),%edx
c010a05a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a05d:	89 50 0c             	mov    %edx,0xc(%eax)
c010a060:	83 ec 0c             	sub    $0xc,%esp
c010a063:	68 ec fd 10 c0       	push   $0xc010fdec
c010a068:	e8 96 00 00 00       	call   c010a103 <isListEmpty>
c010a06d:	83 c4 10             	add    $0x10,%esp
c010a070:	e8 53 cc ff ff       	call   c0106cc8 <intr_disable>
c010a075:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a078:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a07b:	05 60 02 00 00       	add    $0x260,%eax
c010a080:	83 ec 08             	sub    $0x8,%esp
c010a083:	50                   	push   %eax
c010a084:	68 ec fd 10 c0       	push   $0xc010fdec
c010a089:	e8 72 01 00 00       	call   c010a200 <appendToDoubleLinkList>
c010a08e:	83 c4 10             	add    $0x10,%esp
c010a091:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a094:	05 6a 02 00 00       	add    $0x26a,%eax
c010a099:	83 ec 08             	sub    $0x8,%esp
c010a09c:	50                   	push   %eax
c010a09d:	68 04 0f 11 c0       	push   $0xc0110f04
c010a0a2:	e8 59 01 00 00       	call   c010a200 <appendToDoubleLinkList>
c010a0a7:	83 c4 10             	add    $0x10,%esp
c010a0aa:	83 ec 0c             	sub    $0xc,%esp
c010a0ad:	ff 75 e0             	pushl  -0x20(%ebp)
c010a0b0:	e8 3c cc ff ff       	call   c0106cf1 <intr_set_status>
c010a0b5:	83 c4 10             	add    $0x10,%esp
c010a0b8:	90                   	nop
c010a0b9:	c9                   	leave  
c010a0ba:	c3                   	ret    
c010a0bb:	66 90                	xchg   %ax,%ax
c010a0bd:	66 90                	xchg   %ax,%ax
c010a0bf:	90                   	nop

c010a0c0 <switch_to>:
c010a0c0:	56                   	push   %esi
c010a0c1:	57                   	push   %edi
c010a0c2:	53                   	push   %ebx
c010a0c3:	55                   	push   %ebp
c010a0c4:	89 e5                	mov    %esp,%ebp
c010a0c6:	8b 45 14             	mov    0x14(%ebp),%eax
c010a0c9:	89 20                	mov    %esp,(%eax)
c010a0cb:	8b 45 18             	mov    0x18(%ebp),%eax
c010a0ce:	8b 20                	mov    (%eax),%esp
c010a0d0:	5d                   	pop    %ebp
c010a0d1:	5b                   	pop    %ebx
c010a0d2:	5f                   	pop    %edi
c010a0d3:	5e                   	pop    %esi
c010a0d4:	c3                   	ret    

c010a0d5 <initDoubleLinkList>:
c010a0d5:	55                   	push   %ebp
c010a0d6:	89 e5                	mov    %esp,%ebp
c010a0d8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0db:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a0e1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0e4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a0eb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0ee:	8d 50 08             	lea    0x8(%eax),%edx
c010a0f1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0f4:	89 50 04             	mov    %edx,0x4(%eax)
c010a0f7:	8b 55 08             	mov    0x8(%ebp),%edx
c010a0fa:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0fd:	89 50 08             	mov    %edx,0x8(%eax)
c010a100:	90                   	nop
c010a101:	5d                   	pop    %ebp
c010a102:	c3                   	ret    

c010a103 <isListEmpty>:
c010a103:	55                   	push   %ebp
c010a104:	89 e5                	mov    %esp,%ebp
c010a106:	8b 45 08             	mov    0x8(%ebp),%eax
c010a109:	8b 40 04             	mov    0x4(%eax),%eax
c010a10c:	8b 55 08             	mov    0x8(%ebp),%edx
c010a10f:	83 c2 08             	add    $0x8,%edx
c010a112:	39 d0                	cmp    %edx,%eax
c010a114:	75 07                	jne    c010a11d <isListEmpty+0x1a>
c010a116:	b8 01 00 00 00       	mov    $0x1,%eax
c010a11b:	eb 05                	jmp    c010a122 <isListEmpty+0x1f>
c010a11d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a122:	5d                   	pop    %ebp
c010a123:	c3                   	ret    

c010a124 <findElementInList>:
c010a124:	55                   	push   %ebp
c010a125:	89 e5                	mov    %esp,%ebp
c010a127:	83 ec 28             	sub    $0x28,%esp
c010a12a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a12e:	75 19                	jne    c010a149 <findElementInList+0x25>
c010a130:	6a 60                	push   $0x60
c010a132:	68 75 c1 10 c0       	push   $0xc010c175
c010a137:	68 75 c1 10 c0       	push   $0xc010c175
c010a13c:	68 88 c1 10 c0       	push   $0xc010c188
c010a141:	e8 ff e7 ff ff       	call   c0108945 <assertion_failure>
c010a146:	83 c4 10             	add    $0x10,%esp
c010a149:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a14d:	75 19                	jne    c010a168 <findElementInList+0x44>
c010a14f:	6a 61                	push   $0x61
c010a151:	68 75 c1 10 c0       	push   $0xc010c175
c010a156:	68 75 c1 10 c0       	push   $0xc010c175
c010a15b:	68 94 c1 10 c0       	push   $0xc010c194
c010a160:	e8 e0 e7 ff ff       	call   c0108945 <assertion_failure>
c010a165:	83 c4 10             	add    $0x10,%esp
c010a168:	e8 5b cb ff ff       	call   c0106cc8 <intr_disable>
c010a16d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a170:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a177:	8b 45 08             	mov    0x8(%ebp),%eax
c010a17a:	8b 40 08             	mov    0x8(%eax),%eax
c010a17d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a180:	8b 45 08             	mov    0x8(%ebp),%eax
c010a183:	8b 40 04             	mov    0x4(%eax),%eax
c010a186:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a189:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a18d:	75 07                	jne    c010a196 <findElementInList+0x72>
c010a18f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a194:	eb 68                	jmp    c010a1fe <findElementInList+0xda>
c010a196:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a199:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a19c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a19f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a1a2:	c1 f8 03             	sar    $0x3,%eax
c010a1a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a1a8:	eb 36                	jmp    c010a1e0 <findElementInList+0xbc>
c010a1aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a1ad:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a1b0:	75 07                	jne    c010a1b9 <findElementInList+0x95>
c010a1b2:	b8 01 00 00 00       	mov    $0x1,%eax
c010a1b7:	eb 45                	jmp    c010a1fe <findElementInList+0xda>
c010a1b9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a1bd:	75 07                	jne    c010a1c6 <findElementInList+0xa2>
c010a1bf:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1c4:	eb 38                	jmp    c010a1fe <findElementInList+0xda>
c010a1c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1c9:	8b 40 04             	mov    0x4(%eax),%eax
c010a1cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a1cf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a1d3:	75 07                	jne    c010a1dc <findElementInList+0xb8>
c010a1d5:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1da:	eb 22                	jmp    c010a1fe <findElementInList+0xda>
c010a1dc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a1e0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1e3:	83 c0 08             	add    $0x8,%eax
c010a1e6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a1e9:	75 bf                	jne    c010a1aa <findElementInList+0x86>
c010a1eb:	83 ec 0c             	sub    $0xc,%esp
c010a1ee:	ff 75 ec             	pushl  -0x14(%ebp)
c010a1f1:	e8 fb ca ff ff       	call   c0106cf1 <intr_set_status>
c010a1f6:	83 c4 10             	add    $0x10,%esp
c010a1f9:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1fe:	c9                   	leave  
c010a1ff:	c3                   	ret    

c010a200 <appendToDoubleLinkList>:
c010a200:	55                   	push   %ebp
c010a201:	89 e5                	mov    %esp,%ebp
c010a203:	83 ec 18             	sub    $0x18,%esp
c010a206:	83 ec 08             	sub    $0x8,%esp
c010a209:	ff 75 0c             	pushl  0xc(%ebp)
c010a20c:	ff 75 08             	pushl  0x8(%ebp)
c010a20f:	e8 10 ff ff ff       	call   c010a124 <findElementInList>
c010a214:	83 c4 10             	add    $0x10,%esp
c010a217:	3c 01                	cmp    $0x1,%al
c010a219:	0f 84 c2 00 00 00    	je     c010a2e1 <appendToDoubleLinkList+0xe1>
c010a21f:	e8 a4 ca ff ff       	call   c0106cc8 <intr_disable>
c010a224:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a227:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a22b:	75 1c                	jne    c010a249 <appendToDoubleLinkList+0x49>
c010a22d:	68 9e 00 00 00       	push   $0x9e
c010a232:	68 75 c1 10 c0       	push   $0xc010c175
c010a237:	68 75 c1 10 c0       	push   $0xc010c175
c010a23c:	68 88 c1 10 c0       	push   $0xc010c188
c010a241:	e8 ff e6 ff ff       	call   c0108945 <assertion_failure>
c010a246:	83 c4 10             	add    $0x10,%esp
c010a249:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a24d:	75 1c                	jne    c010a26b <appendToDoubleLinkList+0x6b>
c010a24f:	68 9f 00 00 00       	push   $0x9f
c010a254:	68 75 c1 10 c0       	push   $0xc010c175
c010a259:	68 75 c1 10 c0       	push   $0xc010c175
c010a25e:	68 94 c1 10 c0       	push   $0xc010c194
c010a263:	e8 dd e6 ff ff       	call   c0108945 <assertion_failure>
c010a268:	83 c4 10             	add    $0x10,%esp
c010a26b:	83 ec 08             	sub    $0x8,%esp
c010a26e:	ff 75 0c             	pushl  0xc(%ebp)
c010a271:	ff 75 08             	pushl  0x8(%ebp)
c010a274:	e8 ab fe ff ff       	call   c010a124 <findElementInList>
c010a279:	83 c4 10             	add    $0x10,%esp
c010a27c:	3c 01                	cmp    $0x1,%al
c010a27e:	74 64                	je     c010a2e4 <appendToDoubleLinkList+0xe4>
c010a280:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a283:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a286:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a289:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a290:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a293:	8b 50 04             	mov    0x4(%eax),%edx
c010a296:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a299:	89 10                	mov    %edx,(%eax)
c010a29b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a29e:	8b 50 08             	mov    0x8(%eax),%edx
c010a2a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2a4:	89 10                	mov    %edx,(%eax)
c010a2a6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2a9:	8b 40 08             	mov    0x8(%eax),%eax
c010a2ac:	85 c0                	test   %eax,%eax
c010a2ae:	74 0c                	je     c010a2bc <appendToDoubleLinkList+0xbc>
c010a2b0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2b3:	8b 40 08             	mov    0x8(%eax),%eax
c010a2b6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a2b9:	89 50 04             	mov    %edx,0x4(%eax)
c010a2bc:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2bf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a2c2:	89 50 08             	mov    %edx,0x8(%eax)
c010a2c5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2c8:	8d 50 08             	lea    0x8(%eax),%edx
c010a2cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2ce:	89 50 04             	mov    %edx,0x4(%eax)
c010a2d1:	83 ec 0c             	sub    $0xc,%esp
c010a2d4:	ff 75 f4             	pushl  -0xc(%ebp)
c010a2d7:	e8 15 ca ff ff       	call   c0106cf1 <intr_set_status>
c010a2dc:	83 c4 10             	add    $0x10,%esp
c010a2df:	eb 04                	jmp    c010a2e5 <appendToDoubleLinkList+0xe5>
c010a2e1:	90                   	nop
c010a2e2:	eb 01                	jmp    c010a2e5 <appendToDoubleLinkList+0xe5>
c010a2e4:	90                   	nop
c010a2e5:	c9                   	leave  
c010a2e6:	c3                   	ret    

c010a2e7 <insertToDoubleLinkList>:
c010a2e7:	55                   	push   %ebp
c010a2e8:	89 e5                	mov    %esp,%ebp
c010a2ea:	83 ec 18             	sub    $0x18,%esp
c010a2ed:	83 ec 08             	sub    $0x8,%esp
c010a2f0:	ff 75 0c             	pushl  0xc(%ebp)
c010a2f3:	ff 75 08             	pushl  0x8(%ebp)
c010a2f6:	e8 29 fe ff ff       	call   c010a124 <findElementInList>
c010a2fb:	83 c4 10             	add    $0x10,%esp
c010a2fe:	3c 01                	cmp    $0x1,%al
c010a300:	74 65                	je     c010a367 <insertToDoubleLinkList+0x80>
c010a302:	e8 c1 c9 ff ff       	call   c0106cc8 <intr_disable>
c010a307:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a30a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a30d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a310:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a313:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a31a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a31d:	8b 50 04             	mov    0x4(%eax),%edx
c010a320:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a323:	89 10                	mov    %edx,(%eax)
c010a325:	8b 45 08             	mov    0x8(%ebp),%eax
c010a328:	8b 50 04             	mov    0x4(%eax),%edx
c010a32b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a32e:	89 50 04             	mov    %edx,0x4(%eax)
c010a331:	8b 45 08             	mov    0x8(%ebp),%eax
c010a334:	8b 40 04             	mov    0x4(%eax),%eax
c010a337:	85 c0                	test   %eax,%eax
c010a339:	74 0b                	je     c010a346 <insertToDoubleLinkList+0x5f>
c010a33b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a33e:	8b 40 04             	mov    0x4(%eax),%eax
c010a341:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a344:	89 10                	mov    %edx,(%eax)
c010a346:	8b 45 08             	mov    0x8(%ebp),%eax
c010a349:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a34c:	89 50 04             	mov    %edx,0x4(%eax)
c010a34f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a352:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a355:	89 10                	mov    %edx,(%eax)
c010a357:	83 ec 0c             	sub    $0xc,%esp
c010a35a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a35d:	e8 8f c9 ff ff       	call   c0106cf1 <intr_set_status>
c010a362:	83 c4 10             	add    $0x10,%esp
c010a365:	eb 01                	jmp    c010a368 <insertToDoubleLinkList+0x81>
c010a367:	90                   	nop
c010a368:	c9                   	leave  
c010a369:	c3                   	ret    

c010a36a <popFromDoubleLinkList>:
c010a36a:	55                   	push   %ebp
c010a36b:	89 e5                	mov    %esp,%ebp
c010a36d:	83 ec 18             	sub    $0x18,%esp
c010a370:	e8 53 c9 ff ff       	call   c0106cc8 <intr_disable>
c010a375:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a378:	83 ec 0c             	sub    $0xc,%esp
c010a37b:	ff 75 08             	pushl  0x8(%ebp)
c010a37e:	e8 80 fd ff ff       	call   c010a103 <isListEmpty>
c010a383:	83 c4 10             	add    $0x10,%esp
c010a386:	3c 01                	cmp    $0x1,%al
c010a388:	75 07                	jne    c010a391 <popFromDoubleLinkList+0x27>
c010a38a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a38f:	eb 6b                	jmp    c010a3fc <popFromDoubleLinkList+0x92>
c010a391:	8b 45 08             	mov    0x8(%ebp),%eax
c010a394:	8b 40 08             	mov    0x8(%eax),%eax
c010a397:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a39a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a39d:	8b 40 08             	mov    0x8(%eax),%eax
c010a3a0:	85 c0                	test   %eax,%eax
c010a3a2:	75 07                	jne    c010a3ab <popFromDoubleLinkList+0x41>
c010a3a4:	b8 00 00 00 00       	mov    $0x0,%eax
c010a3a9:	eb 51                	jmp    c010a3fc <popFromDoubleLinkList+0x92>
c010a3ab:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3ae:	8b 40 08             	mov    0x8(%eax),%eax
c010a3b1:	8b 00                	mov    (%eax),%eax
c010a3b3:	85 c0                	test   %eax,%eax
c010a3b5:	74 11                	je     c010a3c8 <popFromDoubleLinkList+0x5e>
c010a3b7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3ba:	8b 40 08             	mov    0x8(%eax),%eax
c010a3bd:	8b 00                	mov    (%eax),%eax
c010a3bf:	8b 55 08             	mov    0x8(%ebp),%edx
c010a3c2:	83 c2 08             	add    $0x8,%edx
c010a3c5:	89 50 04             	mov    %edx,0x4(%eax)
c010a3c8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3cb:	8b 40 08             	mov    0x8(%eax),%eax
c010a3ce:	8b 10                	mov    (%eax),%edx
c010a3d0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3d3:	89 50 08             	mov    %edx,0x8(%eax)
c010a3d6:	83 ec 0c             	sub    $0xc,%esp
c010a3d9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a3dc:	e8 10 c9 ff ff       	call   c0106cf1 <intr_set_status>
c010a3e1:	83 c4 10             	add    $0x10,%esp
c010a3e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3e7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a3ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3f1:	8b 50 04             	mov    0x4(%eax),%edx
c010a3f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3f7:	89 10                	mov    %edx,(%eax)
c010a3f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3fc:	c9                   	leave  
c010a3fd:	c3                   	ret    

c010a3fe <kernel_thread>:
c010a3fe:	55                   	push   %ebp
c010a3ff:	89 e5                	mov    %esp,%ebp
c010a401:	83 ec 08             	sub    $0x8,%esp
c010a404:	fb                   	sti    
c010a405:	83 ec 0c             	sub    $0xc,%esp
c010a408:	ff 75 0c             	pushl  0xc(%ebp)
c010a40b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a40e:	ff d0                	call   *%eax
c010a410:	83 c4 10             	add    $0x10,%esp
c010a413:	90                   	nop
c010a414:	c9                   	leave  
c010a415:	c3                   	ret    

c010a416 <thread_init>:
c010a416:	55                   	push   %ebp
c010a417:	89 e5                	mov    %esp,%ebp
c010a419:	83 ec 18             	sub    $0x18,%esp
c010a41c:	83 ec 08             	sub    $0x8,%esp
c010a41f:	6a 00                	push   $0x0
c010a421:	6a 01                	push   $0x1
c010a423:	e8 cf bd ff ff       	call   c01061f7 <alloc_memory>
c010a428:	83 c4 10             	add    $0x10,%esp
c010a42b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a42e:	83 ec 04             	sub    $0x4,%esp
c010a431:	68 00 10 00 00       	push   $0x1000
c010a436:	6a 00                	push   $0x0
c010a438:	ff 75 f4             	pushl  -0xc(%ebp)
c010a43b:	e8 8f 1d 00 00       	call   c010c1cf <Memset>
c010a440:	83 c4 10             	add    $0x10,%esp
c010a443:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a446:	05 00 10 00 00       	add    $0x1000,%eax
c010a44b:	89 c2                	mov    %eax,%edx
c010a44d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a450:	89 10                	mov    %edx,(%eax)
c010a452:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a455:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a45c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a45f:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a466:	ff ff ff 
c010a469:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a46c:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a473:	00 00 00 
c010a476:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a479:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a47f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a482:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a488:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a48d:	83 c0 01             	add    $0x1,%eax
c010a490:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a495:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a49b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a49e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a4a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4a7:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a4ae:	00 00 00 
c010a4b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4b4:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a4bb:	cd ab 99 
c010a4be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4c1:	c9                   	leave  
c010a4c2:	c3                   	ret    

c010a4c3 <thread_create>:
c010a4c3:	55                   	push   %ebp
c010a4c4:	89 e5                	mov    %esp,%ebp
c010a4c6:	83 ec 10             	sub    $0x10,%esp
c010a4c9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a4d0:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a4d7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4da:	8b 00                	mov    (%eax),%eax
c010a4dc:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a4df:	89 c2                	mov    %eax,%edx
c010a4e1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4e4:	89 10                	mov    %edx,(%eax)
c010a4e6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4e9:	8b 00                	mov    (%eax),%eax
c010a4eb:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a4ee:	89 c2                	mov    %eax,%edx
c010a4f0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4f3:	89 10                	mov    %edx,(%eax)
c010a4f5:	90                   	nop
c010a4f6:	c9                   	leave  
c010a4f7:	c3                   	ret    

c010a4f8 <thread_start>:
c010a4f8:	55                   	push   %ebp
c010a4f9:	89 e5                	mov    %esp,%ebp
c010a4fb:	83 ec 18             	sub    $0x18,%esp
c010a4fe:	e8 13 ff ff ff       	call   c010a416 <thread_init>
c010a503:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a506:	83 ec 0c             	sub    $0xc,%esp
c010a509:	ff 75 f4             	pushl  -0xc(%ebp)
c010a50c:	e8 b2 ff ff ff       	call   c010a4c3 <thread_create>
c010a511:	83 c4 10             	add    $0x10,%esp
c010a514:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a517:	05 28 01 00 00       	add    $0x128,%eax
c010a51c:	83 ec 08             	sub    $0x8,%esp
c010a51f:	ff 75 10             	pushl  0x10(%ebp)
c010a522:	50                   	push   %eax
c010a523:	e8 c6 1c 00 00       	call   c010c1ee <Strcpy>
c010a528:	83 c4 10             	add    $0x10,%esp
c010a52b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a52e:	8b 00                	mov    (%eax),%eax
c010a530:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a533:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a536:	c7 40 10 fe a3 10 c0 	movl   $0xc010a3fe,0x10(%eax)
c010a53d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a540:	8b 55 08             	mov    0x8(%ebp),%edx
c010a543:	89 50 18             	mov    %edx,0x18(%eax)
c010a546:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a549:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a54c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a54f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a552:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a558:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a55b:	8b 10                	mov    (%eax),%edx
c010a55d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a560:	89 50 04             	mov    %edx,0x4(%eax)
c010a563:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a566:	8b 50 04             	mov    0x4(%eax),%edx
c010a569:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a56c:	89 50 08             	mov    %edx,0x8(%eax)
c010a56f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a572:	8b 50 08             	mov    0x8(%eax),%edx
c010a575:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a578:	89 50 0c             	mov    %edx,0xc(%eax)
c010a57b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a57e:	05 60 02 00 00       	add    $0x260,%eax
c010a583:	83 ec 08             	sub    $0x8,%esp
c010a586:	50                   	push   %eax
c010a587:	68 ec fd 10 c0       	push   $0xc010fdec
c010a58c:	e8 6f fc ff ff       	call   c010a200 <appendToDoubleLinkList>
c010a591:	83 c4 10             	add    $0x10,%esp
c010a594:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a597:	05 6a 02 00 00       	add    $0x26a,%eax
c010a59c:	83 ec 08             	sub    $0x8,%esp
c010a59f:	50                   	push   %eax
c010a5a0:	68 04 0f 11 c0       	push   $0xc0110f04
c010a5a5:	e8 56 fc ff ff       	call   c010a200 <appendToDoubleLinkList>
c010a5aa:	83 c4 10             	add    $0x10,%esp
c010a5ad:	90                   	nop
c010a5ae:	c9                   	leave  
c010a5af:	c3                   	ret    

c010a5b0 <Buf>:
	...

c010a5c6 <My_Buf>:
c010a5c6:	48                   	dec    %eax
c010a5c7:	65 6c                	gs insb (%dx),%es:(%edi)
c010a5c9:	6c                   	insb   (%dx),%es:(%edi)
c010a5ca:	6f                   	outsl  %ds:(%esi),(%dx)
c010a5cb:	2c 57                	sub    $0x57,%al
c010a5cd:	6f                   	outsl  %ds:(%esi),(%dx)
c010a5ce:	72 6c                	jb     c010a63c <DriverInitialize+0x69>
c010a5d0:	64 5c                	fs pop %esp
c010a5d2:	30                   	.byte 0x30

c010a5d3 <DriverInitialize>:
c010a5d3:	66 87 db             	xchg   %bx,%bx
c010a5d6:	56                   	push   %esi
c010a5d7:	57                   	push   %edi
c010a5d8:	53                   	push   %ebx
c010a5d9:	55                   	push   %ebp
c010a5da:	51                   	push   %ecx
c010a5db:	89 e5                	mov    %esp,%ebp
c010a5dd:	b0 21                	mov    $0x21,%al
c010a5df:	66 ba 00 03          	mov    $0x300,%dx
c010a5e3:	ee                   	out    %al,(%dx)
c010a5e4:	b0 59                	mov    $0x59,%al
c010a5e6:	66 ba 0e 03          	mov    $0x30e,%dx
c010a5ea:	ee                   	out    %al,(%dx)
c010a5eb:	66 ba 0a 03          	mov    $0x30a,%dx
c010a5ef:	30 c0                	xor    %al,%al
c010a5f1:	ee                   	out    %al,(%dx)
c010a5f2:	66 ba 0b 03          	mov    $0x30b,%dx
c010a5f6:	ee                   	out    %al,(%dx)
c010a5f7:	b0 00                	mov    $0x0,%al
c010a5f9:	66 ba 0c 03          	mov    $0x30c,%dx
c010a5fd:	ee                   	out    %al,(%dx)
c010a5fe:	b0 20                	mov    $0x20,%al
c010a600:	66 ba 04 03          	mov    $0x304,%dx
c010a604:	ee                   	out    %al,(%dx)
c010a605:	b0 02                	mov    $0x2,%al
c010a607:	66 ba 0d 03          	mov    $0x30d,%dx
c010a60b:	ee                   	out    %al,(%dx)
c010a60c:	b0 26                	mov    $0x26,%al
c010a60e:	66 ba 01 03          	mov    $0x301,%dx
c010a612:	ee                   	out    %al,(%dx)
c010a613:	66 ba 03 03          	mov    $0x303,%dx
c010a617:	ee                   	out    %al,(%dx)
c010a618:	b0 40                	mov    $0x40,%al
c010a61a:	66 ba 02 03          	mov    $0x302,%dx
c010a61e:	ee                   	out    %al,(%dx)
c010a61f:	b0 61                	mov    $0x61,%al
c010a621:	66 ba 00 03          	mov    $0x300,%dx
c010a625:	ee                   	out    %al,(%dx)
c010a626:	b0 26                	mov    $0x26,%al
c010a628:	66 ba 07 03          	mov    $0x307,%dx
c010a62c:	ee                   	out    %al,(%dx)
c010a62d:	b0 22                	mov    $0x22,%al
c010a62f:	66 ba 00 03          	mov    $0x300,%dx
c010a633:	ee                   	out    %al,(%dx)
c010a634:	b0 ff                	mov    $0xff,%al
c010a636:	66 ba 07 03          	mov    $0x307,%dx
c010a63a:	ee                   	out    %al,(%dx)
c010a63b:	b0 fb                	mov    $0xfb,%al
c010a63d:	66 87 db             	xchg   %bx,%bx
c010a640:	66 ba 0f 03          	mov    $0x30f,%dx
c010a644:	ee                   	out    %al,(%dx)
c010a645:	66 ba 0d 03          	mov    $0x30d,%dx
c010a649:	b0 00                	mov    $0x0,%al
c010a64b:	ee                   	out    %al,(%dx)
c010a64c:	89 ec                	mov    %ebp,%esp
c010a64e:	59                   	pop    %ecx
c010a64f:	5d                   	pop    %ebp
c010a650:	5b                   	pop    %ebx
c010a651:	5f                   	pop    %edi
c010a652:	5e                   	pop    %esi
c010a653:	c3                   	ret    

c010a654 <SetPageStart>:
c010a654:	66 ba 08 03          	mov    $0x308,%dx
c010a658:	66 31 c0             	xor    %ax,%ax
c010a65b:	66 b8 00 40          	mov    $0x4000,%ax
c010a65f:	ee                   	out    %al,(%dx)
c010a660:	66 ba 09 03          	mov    $0x309,%dx
c010a664:	66 25 00 ff          	and    $0xff00,%ax
c010a668:	66 c1 e8 08          	shr    $0x8,%ax
c010a66c:	ee                   	out    %al,(%dx)
c010a66d:	c3                   	ret    

c010a66e <DriverSend>:
c010a66e:	56                   	push   %esi
c010a66f:	57                   	push   %edi
c010a670:	53                   	push   %ebx
c010a671:	55                   	push   %ebp
c010a672:	51                   	push   %ecx
c010a673:	89 e5                	mov    %esp,%ebp
c010a675:	66 ba 00 03          	mov    $0x300,%dx
c010a679:	ec                   	in     (%dx),%al
c010a67a:	3c 26                	cmp    $0x26,%al
c010a67c:	74 55                	je     c010a6d3 <QueueIt>
c010a67e:	66 51                	push   %cx
c010a680:	66 87 db             	xchg   %bx,%bx
c010a683:	24 3f                	and    $0x3f,%al
c010a685:	ee                   	out    %al,(%dx)
c010a686:	66 ba 08 03          	mov    $0x308,%dx
c010a68a:	66 31 c0             	xor    %ax,%ax
c010a68d:	66 b8 00 40          	mov    $0x4000,%ax
c010a691:	ee                   	out    %al,(%dx)
c010a692:	66 ba 09 03          	mov    $0x309,%dx
c010a696:	66 25 00 ff          	and    $0xff00,%ax
c010a69a:	66 c1 e8 08          	shr    $0x8,%ax
c010a69e:	ee                   	out    %al,(%dx)
c010a69f:	ff 75 18             	pushl  0x18(%ebp)
c010a6a2:	e8 3d 00 00 00       	call   c010a6e4 <PCtoNIC>
c010a6a7:	83 c4 04             	add    $0x4,%esp
c010a6aa:	66 ba 04 03          	mov    $0x304,%dx
c010a6ae:	b0 40                	mov    $0x40,%al
c010a6b0:	66 b8 00 40          	mov    $0x4000,%ax
c010a6b4:	66 c1 e8 08          	shr    $0x8,%ax
c010a6b8:	66 ef                	out    %ax,(%dx)
c010a6ba:	66 59                	pop    %cx
c010a6bc:	66 ba 05 03          	mov    $0x305,%dx
c010a6c0:	88 c8                	mov    %cl,%al
c010a6c2:	ee                   	out    %al,(%dx)
c010a6c3:	66 ba 06 03          	mov    $0x306,%dx
c010a6c7:	88 e8                	mov    %ch,%al
c010a6c9:	ee                   	out    %al,(%dx)
c010a6ca:	66 ba 00 03          	mov    $0x300,%dx
c010a6ce:	b0 26                	mov    $0x26,%al
c010a6d0:	ee                   	out    %al,(%dx)
c010a6d1:	eb 01                	jmp    c010a6d4 <Finished>

c010a6d3 <QueueIt>:
c010a6d3:	90                   	nop

c010a6d4 <Finished>:
c010a6d4:	89 ec                	mov    %ebp,%esp
c010a6d6:	59                   	pop    %ecx
c010a6d7:	5d                   	pop    %ebp
c010a6d8:	5b                   	pop    %ebx
c010a6d9:	5f                   	pop    %edi
c010a6da:	5e                   	pop    %esi
c010a6db:	c3                   	ret    

c010a6dc <MyEnd>:
c010a6dc:	89 ec                	mov    %ebp,%esp
c010a6de:	59                   	pop    %ecx
c010a6df:	5d                   	pop    %ebp
c010a6e0:	5b                   	pop    %ebx
c010a6e1:	5f                   	pop    %edi
c010a6e2:	5e                   	pop    %esi
c010a6e3:	c3                   	ret    

c010a6e4 <PCtoNIC>:
c010a6e4:	56                   	push   %esi
c010a6e5:	57                   	push   %edi
c010a6e6:	53                   	push   %ebx
c010a6e7:	55                   	push   %ebp
c010a6e8:	51                   	push   %ecx
c010a6e9:	89 e5                	mov    %esp,%ebp
c010a6eb:	66 bb 16 00          	mov    $0x16,%bx
c010a6ef:	66 ba 0a 03          	mov    $0x30a,%dx
c010a6f3:	88 d8                	mov    %bl,%al
c010a6f5:	ee                   	out    %al,(%dx)
c010a6f6:	66 ba 0b 03          	mov    $0x30b,%dx
c010a6fa:	88 f8                	mov    %bh,%al
c010a6fc:	ee                   	out    %al,(%dx)
c010a6fd:	66 ba 00 03          	mov    $0x300,%dx
c010a701:	b0 12                	mov    $0x12,%al
c010a703:	ee                   	out    %al,(%dx)
c010a704:	66 ba 10 03          	mov    $0x310,%dx
c010a708:	66 b9 16 00          	mov    $0x16,%cx
c010a70c:	66 d1 e9             	shr    %cx
c010a70f:	66 b8 59 00          	mov    $0x59,%ax
c010a713:	31 f6                	xor    %esi,%esi
c010a715:	8b 74 24 18          	mov    0x18(%esp),%esi
c010a719:	e8 36 ff ff ff       	call   c010a654 <SetPageStart>
c010a71e:	66 ba 10 03          	mov    $0x310,%dx
c010a722:	66 87 db             	xchg   %bx,%bx

c010a725 <Writing_Word>:
c010a725:	66 31 c0             	xor    %ax,%ax
c010a728:	66 ad                	lods   %ds:(%esi),%ax
c010a72a:	66 ef                	out    %ax,(%dx)
c010a72c:	e2 f7                	loop   c010a725 <Writing_Word>
c010a72e:	66 87 db             	xchg   %bx,%bx
c010a731:	66 b9 00 00          	mov    $0x0,%cx
c010a735:	66 ba 07 03          	mov    $0x307,%dx

c010a739 <CheckDMA>:
c010a739:	ec                   	in     (%dx),%al
c010a73a:	a8 40                	test   $0x40,%al
c010a73c:	75 02                	jne    c010a740 <toNICEND>
c010a73e:	eb f9                	jmp    c010a739 <CheckDMA>

c010a740 <toNICEND>:
c010a740:	66 ba 07 03          	mov    $0x307,%dx
c010a744:	b0 40                	mov    $0x40,%al
c010a746:	ee                   	out    %al,(%dx)
c010a747:	f8                   	clc    
c010a748:	89 ec                	mov    %ebp,%esp
c010a74a:	59                   	pop    %ecx
c010a74b:	5d                   	pop    %ebp
c010a74c:	5b                   	pop    %ebx
c010a74d:	5f                   	pop    %edi
c010a74e:	5e                   	pop    %esi
c010a74f:	c3                   	ret    

c010a750 <NICtoPC>:
c010a750:	66 87 db             	xchg   %bx,%bx
c010a753:	56                   	push   %esi
c010a754:	57                   	push   %edi
c010a755:	53                   	push   %ebx
c010a756:	55                   	push   %ebp
c010a757:	51                   	push   %ecx
c010a758:	89 e5                	mov    %esp,%ebp
c010a75a:	eb 80                	jmp    c010a6dc <MyEnd>
c010a75c:	66 bb 16 00          	mov    $0x16,%bx
c010a760:	66 ba 0a 03          	mov    $0x30a,%dx
c010a764:	88 d8                	mov    %bl,%al
c010a766:	ee                   	out    %al,(%dx)
c010a767:	66 ba 0b 03          	mov    $0x30b,%dx
c010a76b:	88 f8                	mov    %bh,%al
c010a76d:	ee                   	out    %al,(%dx)
c010a76e:	66 ba 00 03          	mov    $0x300,%dx
c010a772:	b0 0a                	mov    $0xa,%al
c010a774:	ee                   	out    %al,(%dx)
c010a775:	66 ba 10 03          	mov    $0x310,%dx
c010a779:	66 ba 10 03          	mov    $0x310,%dx
c010a77d:	66 b9 16 00          	mov    $0x16,%cx
c010a781:	66 d1 e9             	shr    %cx
c010a784:	bf b0 a5 10 c0       	mov    $0xc010a5b0,%edi

c010a789 <READING_Word_NICtoPC>:
c010a789:	31 c0                	xor    %eax,%eax
c010a78b:	66 ed                	in     (%dx),%ax
c010a78d:	66 ab                	stos   %ax,%es:(%edi)
c010a78f:	e2 f8                	loop   c010a789 <READING_Word_NICtoPC>
c010a791:	b8 b0 a5 10 c0       	mov    $0xc010a5b0,%eax
c010a796:	50                   	push   %eax
c010a797:	e8 f0 58 ff ff       	call   c010008c <disp_str>
c010a79c:	83 c4 04             	add    $0x4,%esp
c010a79f:	66 ba 07 03          	mov    $0x307,%dx

c010a7a3 <CheckDMA_NICtoPC>:
c010a7a3:	ec                   	in     (%dx),%al
c010a7a4:	a8 40                	test   $0x40,%al
c010a7a6:	75 02                	jne    c010a7aa <ReadEnd>
c010a7a8:	eb f9                	jmp    c010a7a3 <CheckDMA_NICtoPC>

c010a7aa <ReadEnd>:
c010a7aa:	ee                   	out    %al,(%dx)
c010a7ab:	89 ec                	mov    %ebp,%esp
c010a7ad:	59                   	pop    %ecx
c010a7ae:	5d                   	pop    %ebp
c010a7af:	5b                   	pop    %ebx
c010a7b0:	5f                   	pop    %edi
c010a7b1:	5e                   	pop    %esi
c010a7b2:	c3                   	ret    
