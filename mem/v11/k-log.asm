
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
c0100025:	e8 01 3c 00 00       	call   c0103c2b <ReloadGDT>
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
c010014b:	e8 20 71 00 00       	call   c0107270 <exception_handler>
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
c0100168:	e8 03 71 00 00       	call   c0107270 <exception_handler>
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
c0100195:	e8 5b 36 00 00       	call   c01037f5 <clock_handler>
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
c01001c7:	e8 b4 45 00 00       	call   c0104780 <keyboard_handler>
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
c010020d:	e8 65 12 00 00       	call   c0101477 <hd_handler>
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
c0100256:	e8 c1 a4 00 00       	call   c010a71c <NICtoPC>
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
c0100340:	e8 c5 6d 00 00       	call   c010710a <disp_int>
c0100345:	83 c4 04             	add    $0x4,%esp
c0100348:	58                   	pop    %eax
c0100349:	5a                   	pop    %edx
c010034a:	52                   	push   %edx
c010034b:	50                   	push   %eax
c010034c:	e8 b9 6d 00 00       	call   c010710a <disp_int>
c0100351:	58                   	pop    %eax
c0100352:	5a                   	pop    %edx
c0100353:	52                   	push   %edx
c0100354:	50                   	push   %eax
c0100355:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c010035b:	e8 aa 6d 00 00       	call   c010710a <disp_int>
c0100360:	83 c4 04             	add    $0x4,%esp
c0100363:	58                   	pop    %eax
c0100364:	5a                   	pop    %edx
c0100365:	52                   	push   %edx
c0100366:	50                   	push   %eax
c0100367:	ff 72 ec             	pushl  -0x14(%edx)
c010036a:	e8 9b 6d 00 00       	call   c010710a <disp_int>
c010036f:	83 c4 04             	add    $0x4,%esp
c0100372:	58                   	pop    %eax
c0100373:	5a                   	pop    %edx
c0100374:	52                   	push   %edx
c0100375:	50                   	push   %eax
c0100376:	ff 70 ec             	pushl  -0x14(%eax)
c0100379:	e8 8c 6d 00 00       	call   c010710a <disp_int>
c010037e:	83 c4 04             	add    $0x4,%esp
c0100381:	58                   	pop    %eax
c0100382:	5a                   	pop    %edx
c0100383:	52                   	push   %edx
c0100384:	50                   	push   %eax
c0100385:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c010038b:	e8 7a 6d 00 00       	call   c010710a <disp_int>
c0100390:	83 c4 04             	add    $0x4,%esp
c0100393:	58                   	pop    %eax
c0100394:	5a                   	pop    %edx
c0100395:	52                   	push   %edx
c0100396:	50                   	push   %eax
c0100397:	68 60 f7 10 c0       	push   $0xc010f760
c010039c:	e8 69 6d 00 00       	call   c010710a <disp_int>
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
c010048e:	e8 5d 9d 00 00       	call   c010a1f0 <appendToDoubleLinkList>
c0100493:	83 c4 10             	add    $0x10,%esp
c0100496:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010049b:	05 6a 02 00 00       	add    $0x26a,%eax
c01004a0:	83 ec 08             	sub    $0x8,%esp
c01004a3:	50                   	push   %eax
c01004a4:	68 ec fd 10 c0       	push   $0xc010fdec
c01004a9:	e8 42 9d 00 00       	call   c010a1f0 <appendToDoubleLinkList>
c01004ae:	83 c4 10             	add    $0x10,%esp
c01004b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004b4:	83 ec 0c             	sub    $0xc,%esp
c01004b7:	50                   	push   %eax
c01004b8:	6a 00                	push   $0x0
c01004ba:	68 0c b0 10 c0       	push   $0xc010b00c
c01004bf:	68 13 b0 10 c0       	push   $0xc010b013
c01004c4:	68 e7 51 10 c0       	push   $0xc01051e7
c01004c9:	e8 63 9a 00 00       	call   c0109f31 <process_execute>
c01004ce:	83 c4 20             	add    $0x20,%esp
c01004d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004d4:	83 ec 0c             	sub    $0xc,%esp
c01004d7:	50                   	push   %eax
c01004d8:	6a 00                	push   $0x0
c01004da:	68 1c b0 10 c0       	push   $0xc010b01c
c01004df:	68 24 b0 10 c0       	push   $0xc010b024
c01004e4:	68 99 16 10 c0       	push   $0xc0101699
c01004e9:	e8 43 9a 00 00       	call   c0109f31 <process_execute>
c01004ee:	83 c4 20             	add    $0x20,%esp
c01004f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004f4:	83 ec 0c             	sub    $0xc,%esp
c01004f7:	50                   	push   %eax
c01004f8:	6a 00                	push   $0x0
c01004fa:	68 2d b0 10 c0       	push   $0xc010b02d
c01004ff:	68 34 b0 10 c0       	push   $0xc010b034
c0100504:	68 ef 07 10 c0       	push   $0xc01007ef
c0100509:	e8 23 9a 00 00       	call   c0109f31 <process_execute>
c010050e:	83 c4 20             	add    $0x20,%esp
c0100511:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100514:	83 ec 0c             	sub    $0xc,%esp
c0100517:	50                   	push   %eax
c0100518:	6a 00                	push   $0x0
c010051a:	68 3d b0 10 c0       	push   $0xc010b03d
c010051f:	68 45 b0 10 c0       	push   $0xc010b045
c0100524:	68 7d 46 10 c0       	push   $0xc010467d
c0100529:	e8 03 9a 00 00       	call   c0109f31 <process_execute>
c010052e:	83 c4 20             	add    $0x20,%esp
c0100531:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100534:	83 e8 02             	sub    $0x2,%eax
c0100537:	83 ec 0c             	sub    $0xc,%esp
c010053a:	50                   	push   %eax
c010053b:	6a 01                	push   $0x1
c010053d:	68 4f b0 10 c0       	push   $0xc010b04f
c0100542:	68 59 b0 10 c0       	push   $0xc010b059
c0100547:	68 e9 06 10 c0       	push   $0xc01006e9
c010054c:	e8 e0 99 00 00       	call   c0109f31 <process_execute>
c0100551:	83 c4 20             	add    $0x20,%esp
c0100554:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100557:	83 e8 03             	sub    $0x3,%eax
c010055a:	83 ec 0c             	sub    $0xc,%esp
c010055d:	50                   	push   %eax
c010055e:	6a 01                	push   $0x1
c0100560:	68 66 b0 10 c0       	push   $0xc010b066
c0100565:	68 70 b0 10 c0       	push   $0xc010b070
c010056a:	68 d7 07 10 c0       	push   $0xc01007d7
c010056f:	e8 bd 99 00 00       	call   c0109f31 <process_execute>
c0100574:	83 c4 20             	add    $0x20,%esp
c0100577:	83 ec 0c             	sub    $0xc,%esp
c010057a:	68 7d b0 10 c0       	push   $0xc010b07d
c010057f:	e8 08 fb ff ff       	call   c010008c <disp_str>
c0100584:	83 c4 10             	add    $0x10,%esp
c0100587:	fb                   	sti    
c0100588:	e8 a1 66 00 00       	call   c0106c2e <stop_here>
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
c01005eb:	e8 6a 70 00 00       	call   c010765a <init_keyboard>
c01005f0:	83 ec 0c             	sub    $0xc,%esp
c01005f3:	68 00 00 00 04       	push   $0x4000000
c01005f8:	e8 e8 64 00 00       	call   c0106ae5 <init_memory>
c01005fd:	83 c4 10             	add    $0x10,%esp
c0100600:	83 ec 0c             	sub    $0xc,%esp
c0100603:	68 ec fd 10 c0       	push   $0xc010fdec
c0100608:	e8 b8 9a 00 00       	call   c010a0c5 <initDoubleLinkList>
c010060d:	83 c4 10             	add    $0x10,%esp
c0100610:	83 ec 0c             	sub    $0xc,%esp
c0100613:	68 04 0f 11 c0       	push   $0xc0110f04
c0100618:	e8 a8 9a 00 00       	call   c010a0c5 <initDoubleLinkList>
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
c0100706:	c7 45 f4 16 00 00 00 	movl   $0x16,-0xc(%ebp)
c010070d:	83 ec 0c             	sub    $0xc,%esp
c0100710:	ff 75 f4             	pushl  -0xc(%ebp)
c0100713:	e8 54 0f 00 00       	call   c010166c <sys_malloc>
c0100718:	83 c4 10             	add    $0x10,%esp
c010071b:	a3 bc 06 11 c0       	mov    %eax,0xc01106bc
c0100720:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100723:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100728:	83 ec 04             	sub    $0x4,%esp
c010072b:	52                   	push   %edx
c010072c:	6a 00                	push   $0x0
c010072e:	50                   	push   %eax
c010072f:	e8 9b ba 00 00       	call   c010c1cf <Memset>
c0100734:	83 c4 10             	add    $0x10,%esp
c0100737:	c7 45 f0 c3 b0 10 c0 	movl   $0xc010b0c3,-0x10(%ebp)
c010073e:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100743:	83 ec 08             	sub    $0x8,%esp
c0100746:	ff 75 f0             	pushl  -0x10(%ebp)
c0100749:	50                   	push   %eax
c010074a:	e8 9f ba 00 00       	call   c010c1ee <Strcpy>
c010074f:	83 c4 10             	add    $0x10,%esp
c0100752:	c6 05 cd 06 11 c0 04 	movb   $0x4,0xc01106cd
c0100759:	e8 65 9e 00 00       	call   c010a5c3 <DriverInitialize>
c010075e:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100763:	83 ec 0c             	sub    $0xc,%esp
c0100766:	50                   	push   %eax
c0100767:	e8 d8 9e 00 00       	call   c010a644 <DriverSend>
c010076c:	83 c4 10             	add    $0x10,%esp
c010076f:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100774:	83 ec 0c             	sub    $0xc,%esp
c0100777:	50                   	push   %eax
c0100778:	e8 0f f9 ff ff       	call   c010008c <disp_str>
c010077d:	83 c4 10             	add    $0x10,%esp
c0100780:	83 ec 0c             	sub    $0xc,%esp
c0100783:	68 2c 0f 11 c0       	push   $0xc0110f2c
c0100788:	e8 ff f8 ff ff       	call   c010008c <disp_str>
c010078d:	83 c4 10             	add    $0x10,%esp
c0100790:	83 ec 0c             	sub    $0xc,%esp
c0100793:	68 96 b0 10 c0       	push   $0xc010b096
c0100798:	e8 ef f8 ff ff       	call   c010008c <disp_str>
c010079d:	83 c4 10             	add    $0x10,%esp
c01007a0:	83 ec 0c             	sub    $0xc,%esp
c01007a3:	68 da b0 10 c0       	push   $0xc010b0da
c01007a8:	e8 df f8 ff ff       	call   c010008c <disp_str>
c01007ad:	83 c4 10             	add    $0x10,%esp
c01007b0:	83 ec 0c             	sub    $0xc,%esp
c01007b3:	68 ed b0 10 c0       	push   $0xc010b0ed
c01007b8:	e8 cf f8 ff ff       	call   c010008c <disp_str>
c01007bd:	83 c4 10             	add    $0x10,%esp
c01007c0:	83 ec 0c             	sub    $0xc,%esp
c01007c3:	68 00 b1 10 c0       	push   $0xc010b100
c01007c8:	e8 bf f8 ff ff       	call   c010008c <disp_str>
c01007cd:	83 c4 10             	add    $0x10,%esp
c01007d0:	e8 4d 7b 00 00       	call   c0108322 <test_exec>
c01007d5:	eb fe                	jmp    c01007d5 <user_proc_a+0xec>

c01007d7 <user_proc_b>:
c01007d7:	55                   	push   %ebp
c01007d8:	89 e5                	mov    %esp,%ebp
c01007da:	83 ec 08             	sub    $0x8,%esp
c01007dd:	83 ec 0c             	sub    $0xc,%esp
c01007e0:	68 14 b1 10 c0       	push   $0xc010b114
c01007e5:	e8 a2 f8 ff ff       	call   c010008c <disp_str>
c01007ea:	83 c4 10             	add    $0x10,%esp
c01007ed:	eb fe                	jmp    c01007ed <user_proc_b+0x16>

c01007ef <TaskHD>:
c01007ef:	55                   	push   %ebp
c01007f0:	89 e5                	mov    %esp,%ebp
c01007f2:	83 ec 18             	sub    $0x18,%esp
c01007f5:	e8 f4 fb ff ff       	call   c01003ee <get_running_thread_pcb>
c01007fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01007fd:	e8 32 00 00 00       	call   c0100834 <init_hd>
c0100802:	83 ec 0c             	sub    $0xc,%esp
c0100805:	6a 7c                	push   $0x7c
c0100807:	e8 60 0e 00 00       	call   c010166c <sys_malloc>
c010080c:	83 c4 10             	add    $0x10,%esp
c010080f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100812:	83 ec 04             	sub    $0x4,%esp
c0100815:	6a 7c                	push   $0x7c
c0100817:	6a 00                	push   $0x0
c0100819:	ff 75 f0             	pushl  -0x10(%ebp)
c010081c:	e8 ae b9 00 00       	call   c010c1cf <Memset>
c0100821:	83 c4 10             	add    $0x10,%esp
c0100824:	83 ec 0c             	sub    $0xc,%esp
c0100827:	ff 75 f0             	pushl  -0x10(%ebp)
c010082a:	e8 1f 00 00 00       	call   c010084e <hd_handle>
c010082f:	83 c4 10             	add    $0x10,%esp
c0100832:	eb de                	jmp    c0100812 <TaskHD+0x23>

c0100834 <init_hd>:
c0100834:	55                   	push   %ebp
c0100835:	89 e5                	mov    %esp,%ebp
c0100837:	83 ec 18             	sub    $0x18,%esp
c010083a:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0100841:	e8 64 fb ff ff       	call   c01003aa <enable_8259A_casecade_irq>
c0100846:	e8 73 fb ff ff       	call   c01003be <enable_8259A_slave_winchester_irq>
c010084b:	90                   	nop
c010084c:	c9                   	leave  
c010084d:	c3                   	ret    

c010084e <hd_handle>:
c010084e:	55                   	push   %ebp
c010084f:	89 e5                	mov    %esp,%ebp
c0100851:	83 ec 18             	sub    $0x18,%esp
c0100854:	83 ec 04             	sub    $0x4,%esp
c0100857:	6a 12                	push   $0x12
c0100859:	ff 75 08             	pushl  0x8(%ebp)
c010085c:	6a 02                	push   $0x2
c010085e:	e8 42 8d 00 00       	call   c01095a5 <send_rec>
c0100863:	83 c4 10             	add    $0x10,%esp
c0100866:	8b 45 08             	mov    0x8(%ebp),%eax
c0100869:	8b 40 78             	mov    0x78(%eax),%eax
c010086c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010086f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100873:	0f 84 d4 00 00 00    	je     c010094d <hd_handle+0xff>
c0100879:	8b 45 08             	mov    0x8(%ebp),%eax
c010087c:	8b 00                	mov    (%eax),%eax
c010087e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100881:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100885:	74 28                	je     c01008af <hd_handle+0x61>
c0100887:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c010088b:	74 22                	je     c01008af <hd_handle+0x61>
c010088d:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100891:	74 1c                	je     c01008af <hd_handle+0x61>
c0100893:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100897:	74 16                	je     c01008af <hd_handle+0x61>
c0100899:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008a0:	74 0d                	je     c01008af <hd_handle+0x61>
c01008a2:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01008a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008ac:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01008af:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008b3:	74 34                	je     c01008e9 <hd_handle+0x9b>
c01008b5:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008b9:	74 2e                	je     c01008e9 <hd_handle+0x9b>
c01008bb:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008bf:	74 28                	je     c01008e9 <hd_handle+0x9b>
c01008c1:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008c5:	74 22                	je     c01008e9 <hd_handle+0x9b>
c01008c7:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008ce:	74 19                	je     c01008e9 <hd_handle+0x9b>
c01008d0:	6a 6d                	push   $0x6d
c01008d2:	68 34 b1 10 c0       	push   $0xc010b134
c01008d7:	68 34 b1 10 c0       	push   $0xc010b134
c01008dc:	68 3c b1 10 c0       	push   $0xc010b13c
c01008e1:	e8 4f 80 00 00       	call   c0108935 <assertion_failure>
c01008e6:	83 c4 10             	add    $0x10,%esp
c01008e9:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008ed:	74 2c                	je     c010091b <hd_handle+0xcd>
c01008ef:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008f3:	77 0e                	ja     c0100903 <hd_handle+0xb5>
c01008f5:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008f9:	74 19                	je     c0100914 <hd_handle+0xc6>
c01008fb:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008ff:	74 1a                	je     c010091b <hd_handle+0xcd>
c0100901:	eb 37                	jmp    c010093a <hd_handle+0xec>
c0100903:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100907:	74 22                	je     c010092b <hd_handle+0xdd>
c0100909:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100910:	74 3e                	je     c0100950 <hd_handle+0x102>
c0100912:	eb 26                	jmp    c010093a <hd_handle+0xec>
c0100914:	e8 e6 06 00 00       	call   c0100fff <hd_open>
c0100919:	eb 36                	jmp    c0100951 <hd_handle+0x103>
c010091b:	83 ec 0c             	sub    $0xc,%esp
c010091e:	ff 75 08             	pushl  0x8(%ebp)
c0100921:	e8 b2 08 00 00       	call   c01011d8 <hd_rdwt>
c0100926:	83 c4 10             	add    $0x10,%esp
c0100929:	eb 26                	jmp    c0100951 <hd_handle+0x103>
c010092b:	83 ec 0c             	sub    $0xc,%esp
c010092e:	6a 00                	push   $0x0
c0100930:	e8 71 07 00 00       	call   c01010a6 <get_hd_ioctl>
c0100935:	83 c4 10             	add    $0x10,%esp
c0100938:	eb 17                	jmp    c0100951 <hd_handle+0x103>
c010093a:	83 ec 0c             	sub    $0xc,%esp
c010093d:	68 96 b1 10 c0       	push   $0xc010b196
c0100942:	e8 aa 7f 00 00       	call   c01088f1 <spin>
c0100947:	83 c4 10             	add    $0x10,%esp
c010094a:	90                   	nop
c010094b:	eb 04                	jmp    c0100951 <hd_handle+0x103>
c010094d:	90                   	nop
c010094e:	eb 01                	jmp    c0100951 <hd_handle+0x103>
c0100950:	90                   	nop
c0100951:	c9                   	leave  
c0100952:	c3                   	ret    

c0100953 <hd_cmd_out>:
c0100953:	55                   	push   %ebp
c0100954:	89 e5                	mov    %esp,%ebp
c0100956:	83 ec 08             	sub    $0x8,%esp
c0100959:	83 ec 04             	sub    $0x4,%esp
c010095c:	68 18 73 01 00       	push   $0x17318
c0100961:	6a 00                	push   $0x0
c0100963:	68 80 00 00 00       	push   $0x80
c0100968:	e8 52 0b 00 00       	call   c01014bf <waitfor>
c010096d:	83 c4 10             	add    $0x10,%esp
c0100970:	85 c0                	test   %eax,%eax
c0100972:	75 10                	jne    c0100984 <hd_cmd_out+0x31>
c0100974:	83 ec 0c             	sub    $0xc,%esp
c0100977:	68 a8 b1 10 c0       	push   $0xc010b1a8
c010097c:	e8 96 7f 00 00       	call   c0108917 <panic>
c0100981:	83 c4 10             	add    $0x10,%esp
c0100984:	83 ec 08             	sub    $0x8,%esp
c0100987:	6a 00                	push   $0x0
c0100989:	68 f6 03 00 00       	push   $0x3f6
c010098e:	e8 5d f9 ff ff       	call   c01002f0 <out_byte>
c0100993:	83 c4 10             	add    $0x10,%esp
c0100996:	8b 45 08             	mov    0x8(%ebp),%eax
c0100999:	0f b6 00             	movzbl (%eax),%eax
c010099c:	0f b6 c0             	movzbl %al,%eax
c010099f:	83 ec 08             	sub    $0x8,%esp
c01009a2:	50                   	push   %eax
c01009a3:	68 f1 01 00 00       	push   $0x1f1
c01009a8:	e8 43 f9 ff ff       	call   c01002f0 <out_byte>
c01009ad:	83 c4 10             	add    $0x10,%esp
c01009b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01009b3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01009b7:	0f b6 c0             	movzbl %al,%eax
c01009ba:	83 ec 08             	sub    $0x8,%esp
c01009bd:	50                   	push   %eax
c01009be:	68 f2 01 00 00       	push   $0x1f2
c01009c3:	e8 28 f9 ff ff       	call   c01002f0 <out_byte>
c01009c8:	83 c4 10             	add    $0x10,%esp
c01009cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01009ce:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c01009d2:	0f b6 c0             	movzbl %al,%eax
c01009d5:	83 ec 08             	sub    $0x8,%esp
c01009d8:	50                   	push   %eax
c01009d9:	68 f3 01 00 00       	push   $0x1f3
c01009de:	e8 0d f9 ff ff       	call   c01002f0 <out_byte>
c01009e3:	83 c4 10             	add    $0x10,%esp
c01009e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01009e9:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c01009ed:	0f b6 c0             	movzbl %al,%eax
c01009f0:	83 ec 08             	sub    $0x8,%esp
c01009f3:	50                   	push   %eax
c01009f4:	68 f4 01 00 00       	push   $0x1f4
c01009f9:	e8 f2 f8 ff ff       	call   c01002f0 <out_byte>
c01009fe:	83 c4 10             	add    $0x10,%esp
c0100a01:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a04:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100a08:	0f b6 c0             	movzbl %al,%eax
c0100a0b:	83 ec 08             	sub    $0x8,%esp
c0100a0e:	50                   	push   %eax
c0100a0f:	68 f5 01 00 00       	push   $0x1f5
c0100a14:	e8 d7 f8 ff ff       	call   c01002f0 <out_byte>
c0100a19:	83 c4 10             	add    $0x10,%esp
c0100a1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a1f:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0100a23:	0f b6 c0             	movzbl %al,%eax
c0100a26:	83 ec 08             	sub    $0x8,%esp
c0100a29:	50                   	push   %eax
c0100a2a:	68 f6 01 00 00       	push   $0x1f6
c0100a2f:	e8 bc f8 ff ff       	call   c01002f0 <out_byte>
c0100a34:	83 c4 10             	add    $0x10,%esp
c0100a37:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a3a:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100a3e:	0f b6 c0             	movzbl %al,%eax
c0100a41:	83 ec 08             	sub    $0x8,%esp
c0100a44:	50                   	push   %eax
c0100a45:	68 f7 01 00 00       	push   $0x1f7
c0100a4a:	e8 a1 f8 ff ff       	call   c01002f0 <out_byte>
c0100a4f:	83 c4 10             	add    $0x10,%esp
c0100a52:	90                   	nop
c0100a53:	c9                   	leave  
c0100a54:	c3                   	ret    

c0100a55 <hd_identify>:
c0100a55:	55                   	push   %ebp
c0100a56:	89 e5                	mov    %esp,%ebp
c0100a58:	53                   	push   %ebx
c0100a59:	83 ec 24             	sub    $0x24,%esp
c0100a5c:	89 e0                	mov    %esp,%eax
c0100a5e:	89 c3                	mov    %eax,%ebx
c0100a60:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0100a64:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100a68:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100a6c:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100a70:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0100a74:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a77:	c1 e0 04             	shl    $0x4,%eax
c0100a7a:	83 c8 e0             	or     $0xffffffe0,%eax
c0100a7d:	88 45 ea             	mov    %al,-0x16(%ebp)
c0100a80:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0100a84:	83 ec 0c             	sub    $0xc,%esp
c0100a87:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100a8a:	50                   	push   %eax
c0100a8b:	e8 c3 fe ff ff       	call   c0100953 <hd_cmd_out>
c0100a90:	83 c4 10             	add    $0x10,%esp
c0100a93:	e8 f0 06 00 00       	call   c0101188 <interrupt_wait>
c0100a98:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100a9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100aa2:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100aa5:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100aa8:	89 c2                	mov    %eax,%edx
c0100aaa:	b8 10 00 00 00       	mov    $0x10,%eax
c0100aaf:	83 e8 01             	sub    $0x1,%eax
c0100ab2:	01 d0                	add    %edx,%eax
c0100ab4:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100ab9:	ba 00 00 00 00       	mov    $0x0,%edx
c0100abe:	f7 f1                	div    %ecx
c0100ac0:	6b c0 10             	imul   $0x10,%eax,%eax
c0100ac3:	29 c4                	sub    %eax,%esp
c0100ac5:	89 e0                	mov    %esp,%eax
c0100ac7:	83 c0 00             	add    $0x0,%eax
c0100aca:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100acd:	83 ec 04             	sub    $0x4,%esp
c0100ad0:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ad3:	6a 00                	push   $0x0
c0100ad5:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ad8:	e8 f2 b6 00 00       	call   c010c1cf <Memset>
c0100add:	83 c4 10             	add    $0x10,%esp
c0100ae0:	83 ec 04             	sub    $0x4,%esp
c0100ae3:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ae6:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ae9:	68 f0 01 00 00       	push   $0x1f0
c0100aee:	e8 30 b7 00 00       	call   c010c223 <read_port>
c0100af3:	83 c4 10             	add    $0x10,%esp
c0100af6:	83 ec 0c             	sub    $0xc,%esp
c0100af9:	ff 75 ec             	pushl  -0x14(%ebp)
c0100afc:	e8 0b 00 00 00       	call   c0100b0c <print_hdinfo>
c0100b01:	83 c4 10             	add    $0x10,%esp
c0100b04:	89 dc                	mov    %ebx,%esp
c0100b06:	90                   	nop
c0100b07:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b0a:	c9                   	leave  
c0100b0b:	c3                   	ret    

c0100b0c <print_hdinfo>:
c0100b0c:	55                   	push   %ebp
c0100b0d:	89 e5                	mov    %esp,%ebp
c0100b0f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100b15:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100b1b:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100b21:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100b28:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100b2f:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100b36:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100b3d:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100b44:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100b4a:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100b50:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100b57:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100b5e:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100b65:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100b6c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100b73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100b7a:	e9 8f 00 00 00       	jmp    c0100c0e <print_hdinfo+0x102>
c0100b7f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100b86:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100b89:	89 d0                	mov    %edx,%eax
c0100b8b:	01 c0                	add    %eax,%eax
c0100b8d:	01 d0                	add    %edx,%eax
c0100b8f:	c1 e0 03             	shl    $0x3,%eax
c0100b92:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100b95:	01 c8                	add    %ecx,%eax
c0100b97:	83 e8 44             	sub    $0x44,%eax
c0100b9a:	0f b7 00             	movzwl (%eax),%eax
c0100b9d:	0f b7 c0             	movzwl %ax,%eax
c0100ba0:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100ba3:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ba6:	01 d0                	add    %edx,%eax
c0100ba8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100bab:	eb 30                	jmp    c0100bdd <print_hdinfo+0xd1>
c0100bad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bb0:	8d 50 01             	lea    0x1(%eax),%edx
c0100bb3:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100bb6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100bb9:	83 c2 01             	add    $0x1,%edx
c0100bbc:	0f b6 00             	movzbl (%eax),%eax
c0100bbf:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100bc3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bc6:	8d 50 01             	lea    0x1(%eax),%edx
c0100bc9:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100bcc:	0f b6 00             	movzbl (%eax),%eax
c0100bcf:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100bd2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100bd5:	01 ca                	add    %ecx,%edx
c0100bd7:	88 02                	mov    %al,(%edx)
c0100bd9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100bdd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100be0:	89 d0                	mov    %edx,%eax
c0100be2:	01 c0                	add    %eax,%eax
c0100be4:	01 d0                	add    %edx,%eax
c0100be6:	c1 e0 03             	shl    $0x3,%eax
c0100be9:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100bec:	01 c8                	add    %ecx,%eax
c0100bee:	83 e8 42             	sub    $0x42,%eax
c0100bf1:	0f b7 00             	movzwl (%eax),%eax
c0100bf4:	66 d1 e8             	shr    %ax
c0100bf7:	0f b7 c0             	movzwl %ax,%eax
c0100bfa:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100bfd:	7c ae                	jl     c0100bad <print_hdinfo+0xa1>
c0100bff:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100c02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c05:	01 d0                	add    %edx,%eax
c0100c07:	c6 00 00             	movb   $0x0,(%eax)
c0100c0a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100c0e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100c12:	0f 8e 67 ff ff ff    	jle    c0100b7f <print_hdinfo+0x73>
c0100c18:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c1b:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100c1f:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100c23:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100c27:	66 c1 e8 08          	shr    $0x8,%ax
c0100c2b:	66 85 c0             	test   %ax,%ax
c0100c2e:	0f 95 c0             	setne  %al
c0100c31:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100c34:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100c3b:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100c41:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100c45:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100c49:	75 15                	jne    c0100c60 <print_hdinfo+0x154>
c0100c4b:	83 ec 08             	sub    $0x8,%esp
c0100c4e:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100c51:	50                   	push   %eax
c0100c52:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c55:	50                   	push   %eax
c0100c56:	e8 93 b5 00 00       	call   c010c1ee <Strcpy>
c0100c5b:	83 c4 10             	add    $0x10,%esp
c0100c5e:	eb 13                	jmp    c0100c73 <print_hdinfo+0x167>
c0100c60:	83 ec 08             	sub    $0x8,%esp
c0100c63:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c66:	50                   	push   %eax
c0100c67:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c6a:	50                   	push   %eax
c0100c6b:	e8 7e b5 00 00       	call   c010c1ee <Strcpy>
c0100c70:	83 c4 10             	add    $0x10,%esp
c0100c73:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c76:	83 c0 7a             	add    $0x7a,%eax
c0100c79:	0f b7 00             	movzwl (%eax),%eax
c0100c7c:	0f b7 d0             	movzwl %ax,%edx
c0100c7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c82:	83 c0 78             	add    $0x78,%eax
c0100c85:	0f b7 00             	movzwl (%eax),%eax
c0100c88:	0f b7 c0             	movzwl %ax,%eax
c0100c8b:	83 c0 10             	add    $0x10,%eax
c0100c8e:	89 c1                	mov    %eax,%ecx
c0100c90:	d3 e2                	shl    %cl,%edx
c0100c92:	89 d0                	mov    %edx,%eax
c0100c94:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100c97:	90                   	nop
c0100c98:	c9                   	leave  
c0100c99:	c3                   	ret    

c0100c9a <print_dpt_entry>:
c0100c9a:	55                   	push   %ebp
c0100c9b:	89 e5                	mov    %esp,%ebp
c0100c9d:	83 ec 08             	sub    $0x8,%esp
c0100ca0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ca3:	8b 40 08             	mov    0x8(%eax),%eax
c0100ca6:	83 ec 08             	sub    $0x8,%esp
c0100ca9:	50                   	push   %eax
c0100caa:	68 b2 b1 10 c0       	push   $0xc010b1b2
c0100caf:	e8 24 79 00 00       	call   c01085d8 <Printf>
c0100cb4:	83 c4 10             	add    $0x10,%esp
c0100cb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cba:	8b 40 0c             	mov    0xc(%eax),%eax
c0100cbd:	83 ec 08             	sub    $0x8,%esp
c0100cc0:	50                   	push   %eax
c0100cc1:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100cc6:	e8 0d 79 00 00       	call   c01085d8 <Printf>
c0100ccb:	83 c4 10             	add    $0x10,%esp
c0100cce:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cd1:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100cd5:	0f b6 c0             	movzbl %al,%eax
c0100cd8:	83 ec 08             	sub    $0x8,%esp
c0100cdb:	50                   	push   %eax
c0100cdc:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100ce1:	e8 f2 78 00 00       	call   c01085d8 <Printf>
c0100ce6:	83 c4 10             	add    $0x10,%esp
c0100ce9:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cec:	0f b6 00             	movzbl (%eax),%eax
c0100cef:	0f b6 c0             	movzbl %al,%eax
c0100cf2:	83 ec 08             	sub    $0x8,%esp
c0100cf5:	50                   	push   %eax
c0100cf6:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100cfb:	e8 d8 78 00 00       	call   c01085d8 <Printf>
c0100d00:	83 c4 10             	add    $0x10,%esp
c0100d03:	90                   	nop
c0100d04:	c9                   	leave  
c0100d05:	c3                   	ret    

c0100d06 <get_partition_table>:
c0100d06:	55                   	push   %ebp
c0100d07:	89 e5                	mov    %esp,%ebp
c0100d09:	53                   	push   %ebx
c0100d0a:	83 ec 24             	sub    $0x24,%esp
c0100d0d:	89 e0                	mov    %esp,%eax
c0100d0f:	89 c3                	mov    %eax,%ebx
c0100d11:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100d15:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100d19:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d1c:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100d1f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d22:	c1 f8 08             	sar    $0x8,%eax
c0100d25:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100d28:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d2b:	c1 f8 10             	sar    $0x10,%eax
c0100d2e:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100d31:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d34:	c1 f8 18             	sar    $0x18,%eax
c0100d37:	89 c2                	mov    %eax,%edx
c0100d39:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d3c:	c1 e0 04             	shl    $0x4,%eax
c0100d3f:	09 d0                	or     %edx,%eax
c0100d41:	83 c8 e0             	or     $0xffffffe0,%eax
c0100d44:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100d47:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100d4b:	83 ec 0c             	sub    $0xc,%esp
c0100d4e:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100d51:	50                   	push   %eax
c0100d52:	e8 fc fb ff ff       	call   c0100953 <hd_cmd_out>
c0100d57:	83 c4 10             	add    $0x10,%esp
c0100d5a:	e8 29 04 00 00       	call   c0101188 <interrupt_wait>
c0100d5f:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100d66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d69:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100d6c:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100d6f:	89 c2                	mov    %eax,%edx
c0100d71:	b8 10 00 00 00       	mov    $0x10,%eax
c0100d76:	83 e8 01             	sub    $0x1,%eax
c0100d79:	01 d0                	add    %edx,%eax
c0100d7b:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100d80:	ba 00 00 00 00       	mov    $0x0,%edx
c0100d85:	f7 f1                	div    %ecx
c0100d87:	6b c0 10             	imul   $0x10,%eax,%eax
c0100d8a:	29 c4                	sub    %eax,%esp
c0100d8c:	89 e0                	mov    %esp,%eax
c0100d8e:	83 c0 00             	add    $0x0,%eax
c0100d91:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100d94:	83 ec 04             	sub    $0x4,%esp
c0100d97:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d9a:	6a 00                	push   $0x0
c0100d9c:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d9f:	e8 2b b4 00 00       	call   c010c1cf <Memset>
c0100da4:	83 c4 10             	add    $0x10,%esp
c0100da7:	83 ec 04             	sub    $0x4,%esp
c0100daa:	ff 75 f4             	pushl  -0xc(%ebp)
c0100dad:	ff 75 ec             	pushl  -0x14(%ebp)
c0100db0:	68 f0 01 00 00       	push   $0x1f0
c0100db5:	e8 69 b4 00 00       	call   c010c223 <read_port>
c0100dba:	83 c4 10             	add    $0x10,%esp
c0100dbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100dc0:	05 be 01 00 00       	add    $0x1be,%eax
c0100dc5:	83 ec 04             	sub    $0x4,%esp
c0100dc8:	6a 40                	push   $0x40
c0100dca:	50                   	push   %eax
c0100dcb:	ff 75 10             	pushl  0x10(%ebp)
c0100dce:	e8 49 5f 00 00       	call   c0106d1c <Memcpy>
c0100dd3:	83 c4 10             	add    $0x10,%esp
c0100dd6:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100ddd:	89 dc                	mov    %ebx,%esp
c0100ddf:	90                   	nop
c0100de0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100de3:	c9                   	leave  
c0100de4:	c3                   	ret    

c0100de5 <partition>:
c0100de5:	55                   	push   %ebp
c0100de6:	89 e5                	mov    %esp,%ebp
c0100de8:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100dee:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100df1:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100df4:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100df8:	7f 19                	jg     c0100e13 <partition+0x2e>
c0100dfa:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100dfd:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100e02:	89 c8                	mov    %ecx,%eax
c0100e04:	f7 ea                	imul   %edx
c0100e06:	d1 fa                	sar    %edx
c0100e08:	89 c8                	mov    %ecx,%eax
c0100e0a:	c1 f8 1f             	sar    $0x1f,%eax
c0100e0d:	29 c2                	sub    %eax,%edx
c0100e0f:	89 d0                	mov    %edx,%eax
c0100e11:	eb 11                	jmp    c0100e24 <partition+0x3f>
c0100e13:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e16:	83 e8 10             	sub    $0x10,%eax
c0100e19:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100e1c:	85 c0                	test   %eax,%eax
c0100e1e:	0f 48 c2             	cmovs  %edx,%eax
c0100e21:	c1 f8 06             	sar    $0x6,%eax
c0100e24:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100e27:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100e2b:	0f 85 cc 00 00 00    	jne    c0100efd <partition+0x118>
c0100e31:	83 ec 04             	sub    $0x4,%esp
c0100e34:	6a 40                	push   $0x40
c0100e36:	6a 00                	push   $0x0
c0100e38:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e3b:	50                   	push   %eax
c0100e3c:	e8 8e b3 00 00       	call   c010c1cf <Memset>
c0100e41:	83 c4 10             	add    $0x10,%esp
c0100e44:	83 ec 04             	sub    $0x4,%esp
c0100e47:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e4a:	50                   	push   %eax
c0100e4b:	6a 00                	push   $0x0
c0100e4d:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e50:	e8 b1 fe ff ff       	call   c0100d06 <get_partition_table>
c0100e55:	83 c4 10             	add    $0x10,%esp
c0100e58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e5f:	e9 8a 00 00 00       	jmp    c0100eee <partition+0x109>
c0100e64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e67:	83 c0 01             	add    $0x1,%eax
c0100e6a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100e6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e70:	c1 e0 04             	shl    $0x4,%eax
c0100e73:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e76:	01 c8                	add    %ecx,%eax
c0100e78:	83 e8 5c             	sub    $0x5c,%eax
c0100e7b:	8b 00                	mov    (%eax),%eax
c0100e7d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e80:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e83:	c1 e1 03             	shl    $0x3,%ecx
c0100e86:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e8c:	01 ca                	add    %ecx,%edx
c0100e8e:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100e94:	89 02                	mov    %eax,(%edx)
c0100e96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e99:	c1 e0 04             	shl    $0x4,%eax
c0100e9c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e9f:	01 c8                	add    %ecx,%eax
c0100ea1:	83 e8 58             	sub    $0x58,%eax
c0100ea4:	8b 00                	mov    (%eax),%eax
c0100ea6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100ea9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100eac:	c1 e1 03             	shl    $0x3,%ecx
c0100eaf:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100eb5:	01 ca                	add    %ecx,%edx
c0100eb7:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100ebd:	89 02                	mov    %eax,(%edx)
c0100ebf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ec2:	c1 e0 04             	shl    $0x4,%eax
c0100ec5:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ec8:	01 c8                	add    %ecx,%eax
c0100eca:	83 e8 60             	sub    $0x60,%eax
c0100ecd:	0f b6 00             	movzbl (%eax),%eax
c0100ed0:	3c 05                	cmp    $0x5,%al
c0100ed2:	75 16                	jne    c0100eea <partition+0x105>
c0100ed4:	8b 55 08             	mov    0x8(%ebp),%edx
c0100ed7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100eda:	01 d0                	add    %edx,%eax
c0100edc:	83 ec 08             	sub    $0x8,%esp
c0100edf:	6a 01                	push   $0x1
c0100ee1:	50                   	push   %eax
c0100ee2:	e8 fe fe ff ff       	call   c0100de5 <partition>
c0100ee7:	83 c4 10             	add    $0x10,%esp
c0100eea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100eee:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100ef2:	0f 8e 6c ff ff ff    	jle    c0100e64 <partition+0x7f>
c0100ef8:	e9 ff 00 00 00       	jmp    c0100ffc <partition+0x217>
c0100efd:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100f01:	0f 85 f5 00 00 00    	jne    c0100ffc <partition+0x217>
c0100f07:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f0a:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100f0f:	89 c8                	mov    %ecx,%eax
c0100f11:	f7 ea                	imul   %edx
c0100f13:	d1 fa                	sar    %edx
c0100f15:	89 c8                	mov    %ecx,%eax
c0100f17:	c1 f8 1f             	sar    $0x1f,%eax
c0100f1a:	29 c2                	sub    %eax,%edx
c0100f1c:	89 d0                	mov    %edx,%eax
c0100f1e:	c1 e0 02             	shl    $0x2,%eax
c0100f21:	01 d0                	add    %edx,%eax
c0100f23:	29 c1                	sub    %eax,%ecx
c0100f25:	89 c8                	mov    %ecx,%eax
c0100f27:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100f2a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100f2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f30:	c1 e2 03             	shl    $0x3,%edx
c0100f33:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f39:	01 d0                	add    %edx,%eax
c0100f3b:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f40:	8b 00                	mov    (%eax),%eax
c0100f42:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100f45:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f48:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f4b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100f4e:	83 e8 01             	sub    $0x1,%eax
c0100f51:	c1 e0 04             	shl    $0x4,%eax
c0100f54:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100f57:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100f5e:	e9 8c 00 00 00       	jmp    c0100fef <partition+0x20a>
c0100f63:	83 ec 04             	sub    $0x4,%esp
c0100f66:	6a 40                	push   $0x40
c0100f68:	6a 00                	push   $0x0
c0100f6a:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f6d:	50                   	push   %eax
c0100f6e:	e8 5c b2 00 00       	call   c010c1cf <Memset>
c0100f73:	83 c4 10             	add    $0x10,%esp
c0100f76:	83 ec 04             	sub    $0x4,%esp
c0100f79:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f7c:	50                   	push   %eax
c0100f7d:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f80:	ff 75 e8             	pushl  -0x18(%ebp)
c0100f83:	e8 7e fd ff ff       	call   c0100d06 <get_partition_table>
c0100f88:	83 c4 10             	add    $0x10,%esp
c0100f8b:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100f8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f91:	01 d0                	add    %edx,%eax
c0100f93:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100f96:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100f99:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f9c:	01 c2                	add    %eax,%edx
c0100f9e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100fa1:	8d 48 04             	lea    0x4(%eax),%ecx
c0100fa4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100fa7:	c1 e1 03             	shl    $0x3,%ecx
c0100faa:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100fb0:	01 c8                	add    %ecx,%eax
c0100fb2:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100fb7:	89 10                	mov    %edx,(%eax)
c0100fb9:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100fbc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100fbf:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100fc2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100fc5:	c1 e1 03             	shl    $0x3,%ecx
c0100fc8:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100fce:	01 ca                	add    %ecx,%edx
c0100fd0:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100fd6:	89 02                	mov    %eax,(%edx)
c0100fd8:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100fdc:	84 c0                	test   %al,%al
c0100fde:	74 1b                	je     c0100ffb <partition+0x216>
c0100fe0:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100fe3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100fe6:	01 d0                	add    %edx,%eax
c0100fe8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100feb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100fef:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100ff3:	0f 8e 6a ff ff ff    	jle    c0100f63 <partition+0x17e>
c0100ff9:	eb 01                	jmp    c0100ffc <partition+0x217>
c0100ffb:	90                   	nop
c0100ffc:	90                   	nop
c0100ffd:	c9                   	leave  
c0100ffe:	c3                   	ret    

c0100fff <hd_open>:
c0100fff:	55                   	push   %ebp
c0101000:	89 e5                	mov    %esp,%ebp
c0101002:	83 ec 18             	sub    $0x18,%esp
c0101005:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010100c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010100f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101015:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c010101a:	8b 00                	mov    (%eax),%eax
c010101c:	8d 50 01             	lea    0x1(%eax),%edx
c010101f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101022:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101028:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c010102d:	89 10                	mov    %edx,(%eax)
c010102f:	83 ec 0c             	sub    $0xc,%esp
c0101032:	6a 00                	push   $0x0
c0101034:	e8 1c fa ff ff       	call   c0100a55 <hd_identify>
c0101039:	83 c4 10             	add    $0x10,%esp
c010103c:	83 ec 08             	sub    $0x8,%esp
c010103f:	6a 00                	push   $0x0
c0101041:	6a 00                	push   $0x0
c0101043:	e8 9d fd ff ff       	call   c0100de5 <partition>
c0101048:	83 c4 10             	add    $0x10,%esp
c010104b:	83 ec 0c             	sub    $0xc,%esp
c010104e:	6a 7c                	push   $0x7c
c0101050:	e8 17 06 00 00       	call   c010166c <sys_malloc>
c0101055:	83 c4 10             	add    $0x10,%esp
c0101058:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010105b:	83 ec 04             	sub    $0x4,%esp
c010105e:	6a 7c                	push   $0x7c
c0101060:	6a 00                	push   $0x0
c0101062:	ff 75 f0             	pushl  -0x10(%ebp)
c0101065:	e8 65 b1 00 00       	call   c010c1cf <Memset>
c010106a:	83 c4 10             	add    $0x10,%esp
c010106d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101070:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101077:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010107a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101081:	83 ec 04             	sub    $0x4,%esp
c0101084:	6a 02                	push   $0x2
c0101086:	ff 75 f0             	pushl  -0x10(%ebp)
c0101089:	6a 01                	push   $0x1
c010108b:	e8 15 85 00 00       	call   c01095a5 <send_rec>
c0101090:	83 c4 10             	add    $0x10,%esp
c0101093:	83 ec 08             	sub    $0x8,%esp
c0101096:	6a 7c                	push   $0x7c
c0101098:	ff 75 f0             	pushl  -0x10(%ebp)
c010109b:	e8 e1 05 00 00       	call   c0101681 <sys_free>
c01010a0:	83 c4 10             	add    $0x10,%esp
c01010a3:	90                   	nop
c01010a4:	c9                   	leave  
c01010a5:	c3                   	ret    

c01010a6 <get_hd_ioctl>:
c01010a6:	55                   	push   %ebp
c01010a7:	89 e5                	mov    %esp,%ebp
c01010a9:	83 ec 18             	sub    $0x18,%esp
c01010ac:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c01010b0:	7f 19                	jg     c01010cb <get_hd_ioctl+0x25>
c01010b2:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01010b5:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01010ba:	89 c8                	mov    %ecx,%eax
c01010bc:	f7 ea                	imul   %edx
c01010be:	d1 fa                	sar    %edx
c01010c0:	89 c8                	mov    %ecx,%eax
c01010c2:	c1 f8 1f             	sar    $0x1f,%eax
c01010c5:	29 c2                	sub    %eax,%edx
c01010c7:	89 d0                	mov    %edx,%eax
c01010c9:	eb 11                	jmp    c01010dc <get_hd_ioctl+0x36>
c01010cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01010ce:	83 e8 10             	sub    $0x10,%eax
c01010d1:	8d 50 3f             	lea    0x3f(%eax),%edx
c01010d4:	85 c0                	test   %eax,%eax
c01010d6:	0f 48 c2             	cmovs  %edx,%eax
c01010d9:	c1 f8 06             	sar    $0x6,%eax
c01010dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010df:	8b 55 08             	mov    0x8(%ebp),%edx
c01010e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010e5:	c1 e2 03             	shl    $0x3,%edx
c01010e8:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01010ee:	01 d0                	add    %edx,%eax
c01010f0:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c01010f5:	8b 00                	mov    (%eax),%eax
c01010f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01010fa:	83 ec 0c             	sub    $0xc,%esp
c01010fd:	6a 7c                	push   $0x7c
c01010ff:	e8 68 05 00 00       	call   c010166c <sys_malloc>
c0101104:	83 c4 10             	add    $0x10,%esp
c0101107:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010110a:	83 ec 04             	sub    $0x4,%esp
c010110d:	6a 7c                	push   $0x7c
c010110f:	6a 00                	push   $0x0
c0101111:	ff 75 ec             	pushl  -0x14(%ebp)
c0101114:	e8 b6 b0 00 00       	call   c010c1cf <Memset>
c0101119:	83 c4 10             	add    $0x10,%esp
c010111c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010111f:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101126:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101129:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101130:	83 ec 04             	sub    $0x4,%esp
c0101133:	6a 02                	push   $0x2
c0101135:	ff 75 ec             	pushl  -0x14(%ebp)
c0101138:	6a 01                	push   $0x1
c010113a:	e8 66 84 00 00       	call   c01095a5 <send_rec>
c010113f:	83 c4 10             	add    $0x10,%esp
c0101142:	83 ec 08             	sub    $0x8,%esp
c0101145:	6a 7c                	push   $0x7c
c0101147:	ff 75 ec             	pushl  -0x14(%ebp)
c010114a:	e8 32 05 00 00       	call   c0101681 <sys_free>
c010114f:	83 c4 10             	add    $0x10,%esp
c0101152:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101155:	c9                   	leave  
c0101156:	c3                   	ret    

c0101157 <wait_for>:
c0101157:	55                   	push   %ebp
c0101158:	89 e5                	mov    %esp,%ebp
c010115a:	83 ec 08             	sub    $0x8,%esp
c010115d:	83 ec 04             	sub    $0x4,%esp
c0101160:	68 50 c3 00 00       	push   $0xc350
c0101165:	6a 08                	push   $0x8
c0101167:	6a 08                	push   $0x8
c0101169:	e8 51 03 00 00       	call   c01014bf <waitfor>
c010116e:	83 c4 10             	add    $0x10,%esp
c0101171:	85 c0                	test   %eax,%eax
c0101173:	75 10                	jne    c0101185 <wait_for+0x2e>
c0101175:	83 ec 0c             	sub    $0xc,%esp
c0101178:	68 e4 b1 10 c0       	push   $0xc010b1e4
c010117d:	e8 95 77 00 00       	call   c0108917 <panic>
c0101182:	83 c4 10             	add    $0x10,%esp
c0101185:	90                   	nop
c0101186:	c9                   	leave  
c0101187:	c3                   	ret    

c0101188 <interrupt_wait>:
c0101188:	55                   	push   %ebp
c0101189:	89 e5                	mov    %esp,%ebp
c010118b:	83 ec 18             	sub    $0x18,%esp
c010118e:	83 ec 0c             	sub    $0xc,%esp
c0101191:	6a 7c                	push   $0x7c
c0101193:	e8 d4 04 00 00       	call   c010166c <sys_malloc>
c0101198:	83 c4 10             	add    $0x10,%esp
c010119b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010119e:	83 ec 04             	sub    $0x4,%esp
c01011a1:	6a 7c                	push   $0x7c
c01011a3:	6a 00                	push   $0x0
c01011a5:	ff 75 f4             	pushl  -0xc(%ebp)
c01011a8:	e8 22 b0 00 00       	call   c010c1cf <Memset>
c01011ad:	83 c4 10             	add    $0x10,%esp
c01011b0:	83 ec 04             	sub    $0x4,%esp
c01011b3:	68 13 02 00 00       	push   $0x213
c01011b8:	ff 75 f4             	pushl  -0xc(%ebp)
c01011bb:	6a 02                	push   $0x2
c01011bd:	e8 e3 83 00 00       	call   c01095a5 <send_rec>
c01011c2:	83 c4 10             	add    $0x10,%esp
c01011c5:	83 ec 08             	sub    $0x8,%esp
c01011c8:	6a 7c                	push   $0x7c
c01011ca:	ff 75 f4             	pushl  -0xc(%ebp)
c01011cd:	e8 af 04 00 00       	call   c0101681 <sys_free>
c01011d2:	83 c4 10             	add    $0x10,%esp
c01011d5:	90                   	nop
c01011d6:	c9                   	leave  
c01011d7:	c3                   	ret    

c01011d8 <hd_rdwt>:
c01011d8:	55                   	push   %ebp
c01011d9:	89 e5                	mov    %esp,%ebp
c01011db:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c01011e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01011e4:	8b 40 18             	mov    0x18(%eax),%eax
c01011e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01011ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01011ed:	8b 40 14             	mov    0x14(%eax),%eax
c01011f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01011f3:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01011f7:	7f 19                	jg     c0101212 <hd_rdwt+0x3a>
c01011f9:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c01011fc:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101201:	89 c8                	mov    %ecx,%eax
c0101203:	f7 ea                	imul   %edx
c0101205:	d1 fa                	sar    %edx
c0101207:	89 c8                	mov    %ecx,%eax
c0101209:	c1 f8 1f             	sar    $0x1f,%eax
c010120c:	29 c2                	sub    %eax,%edx
c010120e:	89 d0                	mov    %edx,%eax
c0101210:	eb 11                	jmp    c0101223 <hd_rdwt+0x4b>
c0101212:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101215:	83 e8 10             	sub    $0x10,%eax
c0101218:	8d 50 3f             	lea    0x3f(%eax),%edx
c010121b:	85 c0                	test   %eax,%eax
c010121d:	0f 48 c2             	cmovs  %edx,%eax
c0101220:	c1 f8 06             	sar    $0x6,%eax
c0101223:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101226:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101229:	8d 50 f0             	lea    -0x10(%eax),%edx
c010122c:	89 d0                	mov    %edx,%eax
c010122e:	c1 f8 1f             	sar    $0x1f,%eax
c0101231:	c1 e8 1a             	shr    $0x1a,%eax
c0101234:	01 c2                	add    %eax,%edx
c0101236:	83 e2 3f             	and    $0x3f,%edx
c0101239:	29 c2                	sub    %eax,%edx
c010123b:	89 d0                	mov    %edx,%eax
c010123d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101240:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101243:	c1 e8 09             	shr    $0x9,%eax
c0101246:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101249:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c010124d:	7f 1a                	jg     c0101269 <hd_rdwt+0x91>
c010124f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101252:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101255:	c1 e2 03             	shl    $0x3,%edx
c0101258:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010125e:	01 d0                	add    %edx,%eax
c0101260:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101265:	8b 00                	mov    (%eax),%eax
c0101267:	eb 1b                	jmp    c0101284 <hd_rdwt+0xac>
c0101269:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010126c:	8d 50 04             	lea    0x4(%eax),%edx
c010126f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101272:	c1 e2 03             	shl    $0x3,%edx
c0101275:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010127b:	01 d0                	add    %edx,%eax
c010127d:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101282:	8b 00                	mov    (%eax),%eax
c0101284:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101287:	01 d0                	add    %edx,%eax
c0101289:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010128c:	8b 45 08             	mov    0x8(%ebp),%eax
c010128f:	8b 40 0c             	mov    0xc(%eax),%eax
c0101292:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101295:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101298:	05 ff 01 00 00       	add    $0x1ff,%eax
c010129d:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01012a3:	85 c0                	test   %eax,%eax
c01012a5:	0f 48 c2             	cmovs  %edx,%eax
c01012a8:	c1 f8 09             	sar    $0x9,%eax
c01012ab:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01012ae:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01012b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01012b7:	8b 40 10             	mov    0x10(%eax),%eax
c01012ba:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01012bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01012c0:	8b 00                	mov    (%eax),%eax
c01012c2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01012c5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012c8:	83 ec 08             	sub    $0x8,%esp
c01012cb:	50                   	push   %eax
c01012cc:	ff 75 d0             	pushl  -0x30(%ebp)
c01012cf:	e8 db 4b 00 00       	call   c0105eaf <alloc_virtual_memory>
c01012d4:	83 c4 10             	add    $0x10,%esp
c01012d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01012da:	8b 45 08             	mov    0x8(%ebp),%eax
c01012dd:	8b 40 78             	mov    0x78(%eax),%eax
c01012e0:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01012e3:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01012e7:	74 22                	je     c010130b <hd_rdwt+0x133>
c01012e9:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01012ed:	74 1c                	je     c010130b <hd_rdwt+0x133>
c01012ef:	68 b7 01 00 00       	push   $0x1b7
c01012f4:	68 34 b1 10 c0       	push   $0xc010b134
c01012f9:	68 34 b1 10 c0       	push   $0xc010b134
c01012fe:	68 f6 b1 10 c0       	push   $0xc010b1f6
c0101303:	e8 2d 76 00 00       	call   c0108935 <assertion_failure>
c0101308:	83 c4 10             	add    $0x10,%esp
c010130b:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c010130f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0101312:	88 45 be             	mov    %al,-0x42(%ebp)
c0101315:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101318:	88 45 bf             	mov    %al,-0x41(%ebp)
c010131b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010131e:	c1 f8 08             	sar    $0x8,%eax
c0101321:	88 45 c0             	mov    %al,-0x40(%ebp)
c0101324:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101327:	c1 f8 10             	sar    $0x10,%eax
c010132a:	88 45 c1             	mov    %al,-0x3f(%ebp)
c010132d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101330:	c1 f8 18             	sar    $0x18,%eax
c0101333:	83 e0 0f             	and    $0xf,%eax
c0101336:	83 c8 e0             	or     $0xffffffe0,%eax
c0101339:	88 45 c2             	mov    %al,-0x3e(%ebp)
c010133c:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101340:	75 07                	jne    c0101349 <hd_rdwt+0x171>
c0101342:	b8 20 00 00 00       	mov    $0x20,%eax
c0101347:	eb 05                	jmp    c010134e <hd_rdwt+0x176>
c0101349:	b8 30 00 00 00       	mov    $0x30,%eax
c010134e:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0101351:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101355:	3c 20                	cmp    $0x20,%al
c0101357:	74 24                	je     c010137d <hd_rdwt+0x1a5>
c0101359:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010135d:	3c 30                	cmp    $0x30,%al
c010135f:	74 1c                	je     c010137d <hd_rdwt+0x1a5>
c0101361:	68 c5 01 00 00       	push   $0x1c5
c0101366:	68 34 b1 10 c0       	push   $0xc010b134
c010136b:	68 34 b1 10 c0       	push   $0xc010b134
c0101370:	68 14 b2 10 c0       	push   $0xc010b214
c0101375:	e8 bb 75 00 00       	call   c0108935 <assertion_failure>
c010137a:	83 c4 10             	add    $0x10,%esp
c010137d:	83 ec 0c             	sub    $0xc,%esp
c0101380:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0101383:	50                   	push   %eax
c0101384:	e8 ca f5 ff ff       	call   c0100953 <hd_cmd_out>
c0101389:	83 c4 10             	add    $0x10,%esp
c010138c:	e9 9c 00 00 00       	jmp    c010142d <hd_rdwt+0x255>
c0101391:	b8 00 02 00 00       	mov    $0x200,%eax
c0101396:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c010139d:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c01013a1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01013a4:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01013a8:	75 51                	jne    c01013fb <hd_rdwt+0x223>
c01013aa:	e8 a8 fd ff ff       	call   c0101157 <wait_for>
c01013af:	e8 d4 fd ff ff       	call   c0101188 <interrupt_wait>
c01013b4:	83 ec 04             	sub    $0x4,%esp
c01013b7:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013ba:	6a 00                	push   $0x0
c01013bc:	68 80 11 11 c0       	push   $0xc0111180
c01013c1:	e8 09 ae 00 00       	call   c010c1cf <Memset>
c01013c6:	83 c4 10             	add    $0x10,%esp
c01013c9:	83 ec 04             	sub    $0x4,%esp
c01013cc:	68 00 02 00 00       	push   $0x200
c01013d1:	68 80 11 11 c0       	push   $0xc0111180
c01013d6:	68 f0 01 00 00       	push   $0x1f0
c01013db:	e8 43 ae 00 00       	call   c010c223 <read_port>
c01013e0:	83 c4 10             	add    $0x10,%esp
c01013e3:	83 ec 04             	sub    $0x4,%esp
c01013e6:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013e9:	68 80 11 11 c0       	push   $0xc0111180
c01013ee:	ff 75 f0             	pushl  -0x10(%ebp)
c01013f1:	e8 26 59 00 00       	call   c0106d1c <Memcpy>
c01013f6:	83 c4 10             	add    $0x10,%esp
c01013f9:	eb 26                	jmp    c0101421 <hd_rdwt+0x249>
c01013fb:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01013ff:	75 20                	jne    c0101421 <hd_rdwt+0x249>
c0101401:	e8 51 fd ff ff       	call   c0101157 <wait_for>
c0101406:	83 ec 04             	sub    $0x4,%esp
c0101409:	ff 75 c4             	pushl  -0x3c(%ebp)
c010140c:	ff 75 f0             	pushl  -0x10(%ebp)
c010140f:	68 f0 01 00 00       	push   $0x1f0
c0101414:	e8 1e ae 00 00       	call   c010c237 <write_port>
c0101419:	83 c4 10             	add    $0x10,%esp
c010141c:	e8 67 fd ff ff       	call   c0101188 <interrupt_wait>
c0101421:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101424:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101427:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010142a:	01 45 f0             	add    %eax,-0x10(%ebp)
c010142d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101431:	0f 85 5a ff ff ff    	jne    c0101391 <hd_rdwt+0x1b9>
c0101437:	83 ec 04             	sub    $0x4,%esp
c010143a:	6a 7c                	push   $0x7c
c010143c:	6a 00                	push   $0x0
c010143e:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101444:	50                   	push   %eax
c0101445:	e8 85 ad 00 00       	call   c010c1cf <Memset>
c010144a:	83 c4 10             	add    $0x10,%esp
c010144d:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0101454:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c010145b:	00 00 00 
c010145e:	83 ec 04             	sub    $0x4,%esp
c0101461:	6a 02                	push   $0x2
c0101463:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101469:	50                   	push   %eax
c010146a:	6a 01                	push   $0x1
c010146c:	e8 34 81 00 00       	call   c01095a5 <send_rec>
c0101471:	83 c4 10             	add    $0x10,%esp
c0101474:	90                   	nop
c0101475:	c9                   	leave  
c0101476:	c3                   	ret    

c0101477 <hd_handler>:
c0101477:	55                   	push   %ebp
c0101478:	89 e5                	mov    %esp,%ebp
c010147a:	83 ec 18             	sub    $0x18,%esp
c010147d:	83 ec 0c             	sub    $0xc,%esp
c0101480:	68 f7 01 00 00       	push   $0x1f7
c0101485:	e8 5a ee ff ff       	call   c01002e4 <in_byte>
c010148a:	83 c4 10             	add    $0x10,%esp
c010148d:	0f b6 c0             	movzbl %al,%eax
c0101490:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101493:	83 ec 0c             	sub    $0xc,%esp
c0101496:	6a 03                	push   $0x3
c0101498:	e8 a2 83 00 00       	call   c010983f <inform_int>
c010149d:	83 c4 10             	add    $0x10,%esp
c01014a0:	90                   	nop
c01014a1:	c9                   	leave  
c01014a2:	c3                   	ret    

c01014a3 <net_handler>:
c01014a3:	55                   	push   %ebp
c01014a4:	89 e5                	mov    %esp,%ebp
c01014a6:	83 ec 08             	sub    $0x8,%esp
c01014a9:	83 ec 0c             	sub    $0xc,%esp
c01014ac:	68 48 b2 10 c0       	push   $0xc010b248
c01014b1:	e8 22 71 00 00       	call   c01085d8 <Printf>
c01014b6:	83 c4 10             	add    $0x10,%esp
c01014b9:	66 87 db             	xchg   %bx,%bx
c01014bc:	90                   	nop
c01014bd:	c9                   	leave  
c01014be:	c3                   	ret    

c01014bf <waitfor>:
c01014bf:	55                   	push   %ebp
c01014c0:	89 e5                	mov    %esp,%ebp
c01014c2:	83 ec 18             	sub    $0x18,%esp
c01014c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01014cc:	eb 26                	jmp    c01014f4 <waitfor+0x35>
c01014ce:	83 ec 0c             	sub    $0xc,%esp
c01014d1:	68 f7 01 00 00       	push   $0x1f7
c01014d6:	e8 09 ee ff ff       	call   c01002e4 <in_byte>
c01014db:	83 c4 10             	add    $0x10,%esp
c01014de:	0f b6 c0             	movzbl %al,%eax
c01014e1:	23 45 08             	and    0x8(%ebp),%eax
c01014e4:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01014e7:	75 07                	jne    c01014f0 <waitfor+0x31>
c01014e9:	b8 01 00 00 00       	mov    $0x1,%eax
c01014ee:	eb 11                	jmp    c0101501 <waitfor+0x42>
c01014f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01014f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01014f7:	3b 45 10             	cmp    0x10(%ebp),%eax
c01014fa:	7c d2                	jl     c01014ce <waitfor+0xf>
c01014fc:	b8 00 00 00 00       	mov    $0x0,%eax
c0101501:	c9                   	leave  
c0101502:	c3                   	ret    

c0101503 <print_hd_info>:
c0101503:	55                   	push   %ebp
c0101504:	89 e5                	mov    %esp,%ebp
c0101506:	83 ec 18             	sub    $0x18,%esp
c0101509:	83 ec 0c             	sub    $0xc,%esp
c010150c:	68 6a b2 10 c0       	push   $0xc010b26a
c0101511:	e8 c2 70 00 00       	call   c01085d8 <Printf>
c0101516:	83 c4 10             	add    $0x10,%esp
c0101519:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101520:	eb 3b                	jmp    c010155d <print_hd_info+0x5a>
c0101522:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101525:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c010152c:	85 c0                	test   %eax,%eax
c010152e:	74 28                	je     c0101558 <print_hd_info+0x55>
c0101530:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101533:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c010153a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010153d:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101544:	ff 75 f4             	pushl  -0xc(%ebp)
c0101547:	52                   	push   %edx
c0101548:	50                   	push   %eax
c0101549:	68 87 b2 10 c0       	push   $0xc010b287
c010154e:	e8 85 70 00 00       	call   c01085d8 <Printf>
c0101553:	83 c4 10             	add    $0x10,%esp
c0101556:	eb 01                	jmp    c0101559 <print_hd_info+0x56>
c0101558:	90                   	nop
c0101559:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010155d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0101561:	7e bf                	jle    c0101522 <print_hd_info+0x1f>
c0101563:	83 ec 0c             	sub    $0xc,%esp
c0101566:	68 9f b2 10 c0       	push   $0xc010b29f
c010156b:	e8 68 70 00 00       	call   c01085d8 <Printf>
c0101570:	83 c4 10             	add    $0x10,%esp
c0101573:	83 ec 0c             	sub    $0xc,%esp
c0101576:	68 ba b2 10 c0       	push   $0xc010b2ba
c010157b:	e8 58 70 00 00       	call   c01085d8 <Printf>
c0101580:	83 c4 10             	add    $0x10,%esp
c0101583:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c010158a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101591:	eb 44                	jmp    c01015d7 <print_hd_info+0xd4>
c0101593:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101596:	83 c0 04             	add    $0x4,%eax
c0101599:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01015a0:	85 c0                	test   %eax,%eax
c01015a2:	74 2e                	je     c01015d2 <print_hd_info+0xcf>
c01015a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015a7:	83 c0 04             	add    $0x4,%eax
c01015aa:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01015b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01015b4:	83 c0 04             	add    $0x4,%eax
c01015b7:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01015be:	ff 75 f0             	pushl  -0x10(%ebp)
c01015c1:	52                   	push   %edx
c01015c2:	50                   	push   %eax
c01015c3:	68 87 b2 10 c0       	push   $0xc010b287
c01015c8:	e8 0b 70 00 00       	call   c01085d8 <Printf>
c01015cd:	83 c4 10             	add    $0x10,%esp
c01015d0:	eb 01                	jmp    c01015d3 <print_hd_info+0xd0>
c01015d2:	90                   	nop
c01015d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01015d7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01015db:	7e b6                	jle    c0101593 <print_hd_info+0x90>
c01015dd:	83 ec 0c             	sub    $0xc,%esp
c01015e0:	68 d7 b2 10 c0       	push   $0xc010b2d7
c01015e5:	e8 ee 6f 00 00       	call   c01085d8 <Printf>
c01015ea:	83 c4 10             	add    $0x10,%esp
c01015ed:	90                   	nop
c01015ee:	c9                   	leave  
c01015ef:	c3                   	ret    

c01015f0 <is_empty>:
c01015f0:	55                   	push   %ebp
c01015f1:	89 e5                	mov    %esp,%ebp
c01015f3:	83 ec 10             	sub    $0x10,%esp
c01015f6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01015fd:	eb 1a                	jmp    c0101619 <is_empty+0x29>
c01015ff:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0101602:	8b 45 08             	mov    0x8(%ebp),%eax
c0101605:	01 d0                	add    %edx,%eax
c0101607:	0f b6 00             	movzbl (%eax),%eax
c010160a:	84 c0                	test   %al,%al
c010160c:	74 07                	je     c0101615 <is_empty+0x25>
c010160e:	b8 00 00 00 00       	mov    $0x0,%eax
c0101613:	eb 11                	jmp    c0101626 <is_empty+0x36>
c0101615:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0101619:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010161c:	3b 45 0c             	cmp    0xc(%ebp),%eax
c010161f:	7c de                	jl     c01015ff <is_empty+0xf>
c0101621:	b8 01 00 00 00       	mov    $0x1,%eax
c0101626:	c9                   	leave  
c0101627:	c3                   	ret    
c0101628:	66 90                	xchg   %ax,%ax
c010162a:	66 90                	xchg   %ax,%ax
c010162c:	66 90                	xchg   %ax,%ax
c010162e:	66 90                	xchg   %ax,%ax

c0101630 <write_debug>:
c0101630:	b8 02 00 00 00       	mov    $0x2,%eax
c0101635:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101639:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010163d:	cd 90                	int    $0x90
c010163f:	c3                   	ret    

c0101640 <send_msg>:
c0101640:	55                   	push   %ebp
c0101641:	89 e5                	mov    %esp,%ebp
c0101643:	53                   	push   %ebx
c0101644:	51                   	push   %ecx
c0101645:	b8 03 00 00 00       	mov    $0x3,%eax
c010164a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010164d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101650:	cd 90                	int    $0x90
c0101652:	59                   	pop    %ecx
c0101653:	5b                   	pop    %ebx
c0101654:	5d                   	pop    %ebp
c0101655:	c3                   	ret    

c0101656 <receive_msg>:
c0101656:	55                   	push   %ebp
c0101657:	89 e5                	mov    %esp,%ebp
c0101659:	53                   	push   %ebx
c010165a:	51                   	push   %ecx
c010165b:	b8 04 00 00 00       	mov    $0x4,%eax
c0101660:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101663:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101666:	cd 90                	int    $0x90
c0101668:	59                   	pop    %ecx
c0101669:	5b                   	pop    %ebx
c010166a:	5d                   	pop    %ebp
c010166b:	c3                   	ret    

c010166c <sys_malloc>:
c010166c:	56                   	push   %esi
c010166d:	57                   	push   %edi
c010166e:	53                   	push   %ebx
c010166f:	55                   	push   %ebp
c0101670:	89 e5                	mov    %esp,%ebp
c0101672:	b8 05 00 00 00       	mov    $0x5,%eax
c0101677:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010167a:	cd 90                	int    $0x90
c010167c:	5d                   	pop    %ebp
c010167d:	5b                   	pop    %ebx
c010167e:	5f                   	pop    %edi
c010167f:	5e                   	pop    %esi
c0101680:	c3                   	ret    

c0101681 <sys_free>:
c0101681:	56                   	push   %esi
c0101682:	57                   	push   %edi
c0101683:	53                   	push   %ebx
c0101684:	55                   	push   %ebp
c0101685:	89 e5                	mov    %esp,%ebp
c0101687:	b8 06 00 00 00       	mov    $0x6,%eax
c010168c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010168f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0101692:	cd 90                	int    $0x90
c0101694:	5d                   	pop    %ebp
c0101695:	5b                   	pop    %ebx
c0101696:	5f                   	pop    %edi
c0101697:	5e                   	pop    %esi
c0101698:	c3                   	ret    

c0101699 <task_fs>:
c0101699:	55                   	push   %ebp
c010169a:	89 e5                	mov    %esp,%ebp
c010169c:	83 ec 28             	sub    $0x28,%esp
c010169f:	e8 bb 08 00 00       	call   c0101f5f <init_fs>
c01016a4:	83 ec 0c             	sub    $0xc,%esp
c01016a7:	6a 7c                	push   $0x7c
c01016a9:	e8 be ff ff ff       	call   c010166c <sys_malloc>
c01016ae:	83 c4 10             	add    $0x10,%esp
c01016b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01016b4:	83 ec 0c             	sub    $0xc,%esp
c01016b7:	6a 7c                	push   $0x7c
c01016b9:	e8 ae ff ff ff       	call   c010166c <sys_malloc>
c01016be:	83 c4 10             	add    $0x10,%esp
c01016c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01016c4:	83 ec 04             	sub    $0x4,%esp
c01016c7:	6a 7c                	push   $0x7c
c01016c9:	6a 00                	push   $0x0
c01016cb:	ff 75 f4             	pushl  -0xc(%ebp)
c01016ce:	e8 fc aa 00 00       	call   c010c1cf <Memset>
c01016d3:	83 c4 10             	add    $0x10,%esp
c01016d6:	83 ec 04             	sub    $0x4,%esp
c01016d9:	6a 12                	push   $0x12
c01016db:	ff 75 f4             	pushl  -0xc(%ebp)
c01016de:	6a 02                	push   $0x2
c01016e0:	e8 c0 7e 00 00       	call   c01095a5 <send_rec>
c01016e5:	83 c4 10             	add    $0x10,%esp
c01016e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016eb:	8b 40 78             	mov    0x78(%eax),%eax
c01016ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01016f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016f4:	8b 00                	mov    (%eax),%eax
c01016f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01016f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016fc:	8b 40 50             	mov    0x50(%eax),%eax
c01016ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101702:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101705:	8b 40 68             	mov    0x68(%eax),%eax
c0101708:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010170b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010170e:	8b 00                	mov    (%eax),%eax
c0101710:	85 c0                	test   %eax,%eax
c0101712:	75 07                	jne    c010171b <task_fs+0x82>
c0101714:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010171b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101722:	83 ec 0c             	sub    $0xc,%esp
c0101725:	ff 75 e8             	pushl  -0x18(%ebp)
c0101728:	e8 39 21 00 00       	call   c0103866 <pid2proc>
c010172d:	83 c4 10             	add    $0x10,%esp
c0101730:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101735:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101739:	74 37                	je     c0101772 <task_fs+0xd9>
c010173b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010173f:	74 31                	je     c0101772 <task_fs+0xd9>
c0101741:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101745:	74 2b                	je     c0101772 <task_fs+0xd9>
c0101747:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010174b:	74 25                	je     c0101772 <task_fs+0xd9>
c010174d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101751:	74 1f                	je     c0101772 <task_fs+0xd9>
c0101753:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101757:	74 19                	je     c0101772 <task_fs+0xd9>
c0101759:	6a 7a                	push   $0x7a
c010175b:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101760:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101765:	68 08 b3 10 c0       	push   $0xc010b308
c010176a:	e8 c6 71 00 00       	call   c0108935 <assertion_failure>
c010176f:	83 c4 10             	add    $0x10,%esp
c0101772:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101776:	74 3a                	je     c01017b2 <task_fs+0x119>
c0101778:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010177c:	7f 19                	jg     c0101797 <task_fs+0xfe>
c010177e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101782:	0f 84 10 01 00 00    	je     c0101898 <task_fs+0x1ff>
c0101788:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010178c:	0f 84 a1 00 00 00    	je     c0101833 <task_fs+0x19a>
c0101792:	e9 ef 00 00 00       	jmp    c0101886 <task_fs+0x1ed>
c0101797:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c010179b:	74 50                	je     c01017ed <task_fs+0x154>
c010179d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01017a1:	0f 84 c6 00 00 00    	je     c010186d <task_fs+0x1d4>
c01017a7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01017ab:	74 40                	je     c01017ed <task_fs+0x154>
c01017ad:	e9 d4 00 00 00       	jmp    c0101886 <task_fs+0x1ed>
c01017b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017b5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01017bc:	83 ec 0c             	sub    $0xc,%esp
c01017bf:	ff 75 f4             	pushl  -0xc(%ebp)
c01017c2:	e8 ec 07 00 00       	call   c0101fb3 <do_open>
c01017c7:	83 c4 10             	add    $0x10,%esp
c01017ca:	89 c2                	mov    %eax,%edx
c01017cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017cf:	89 50 50             	mov    %edx,0x50(%eax)
c01017d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017d5:	8b 00                	mov    (%eax),%eax
c01017d7:	83 ec 04             	sub    $0x4,%esp
c01017da:	50                   	push   %eax
c01017db:	ff 75 f4             	pushl  -0xc(%ebp)
c01017de:	6a 01                	push   $0x1
c01017e0:	e8 c0 7d 00 00       	call   c01095a5 <send_rec>
c01017e5:	83 c4 10             	add    $0x10,%esp
c01017e8:	e9 b2 00 00 00       	jmp    c010189f <task_fs+0x206>
c01017ed:	83 ec 0c             	sub    $0xc,%esp
c01017f0:	ff 75 f4             	pushl  -0xc(%ebp)
c01017f3:	e8 19 19 00 00       	call   c0103111 <do_rdwt>
c01017f8:	83 c4 10             	add    $0x10,%esp
c01017fb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01017fe:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101802:	0f 84 96 00 00 00    	je     c010189e <task_fs+0x205>
c0101808:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010180b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101812:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101815:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101818:	89 50 60             	mov    %edx,0x60(%eax)
c010181b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010181e:	8b 00                	mov    (%eax),%eax
c0101820:	83 ec 04             	sub    $0x4,%esp
c0101823:	50                   	push   %eax
c0101824:	ff 75 f4             	pushl  -0xc(%ebp)
c0101827:	6a 01                	push   $0x1
c0101829:	e8 77 7d 00 00       	call   c01095a5 <send_rec>
c010182e:	83 c4 10             	add    $0x10,%esp
c0101831:	eb 6b                	jmp    c010189e <task_fs+0x205>
c0101833:	83 ec 0c             	sub    $0xc,%esp
c0101836:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101839:	e8 f0 1d 00 00       	call   c010362e <do_close>
c010183e:	83 c4 10             	add    $0x10,%esp
c0101841:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101844:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010184b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010184e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101855:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101858:	8b 00                	mov    (%eax),%eax
c010185a:	83 ec 04             	sub    $0x4,%esp
c010185d:	50                   	push   %eax
c010185e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101861:	6a 01                	push   $0x1
c0101863:	e8 3d 7d 00 00       	call   c01095a5 <send_rec>
c0101868:	83 c4 10             	add    $0x10,%esp
c010186b:	eb 32                	jmp    c010189f <task_fs+0x206>
c010186d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101870:	8b 40 68             	mov    0x68(%eax),%eax
c0101873:	83 ec 04             	sub    $0x4,%esp
c0101876:	50                   	push   %eax
c0101877:	ff 75 f4             	pushl  -0xc(%ebp)
c010187a:	6a 01                	push   $0x1
c010187c:	e8 24 7d 00 00       	call   c01095a5 <send_rec>
c0101881:	83 c4 10             	add    $0x10,%esp
c0101884:	eb 19                	jmp    c010189f <task_fs+0x206>
c0101886:	83 ec 0c             	sub    $0xc,%esp
c0101889:	68 6b b3 10 c0       	push   $0xc010b36b
c010188e:	e8 84 70 00 00       	call   c0108917 <panic>
c0101893:	83 c4 10             	add    $0x10,%esp
c0101896:	eb 07                	jmp    c010189f <task_fs+0x206>
c0101898:	90                   	nop
c0101899:	e9 26 fe ff ff       	jmp    c01016c4 <task_fs+0x2b>
c010189e:	90                   	nop
c010189f:	e9 20 fe ff ff       	jmp    c01016c4 <task_fs+0x2b>

c01018a4 <rd_wt>:
c01018a4:	55                   	push   %ebp
c01018a5:	89 e5                	mov    %esp,%ebp
c01018a7:	83 ec 18             	sub    $0x18,%esp
c01018aa:	83 ec 0c             	sub    $0xc,%esp
c01018ad:	6a 7c                	push   $0x7c
c01018af:	e8 b8 fd ff ff       	call   c010166c <sys_malloc>
c01018b4:	83 c4 10             	add    $0x10,%esp
c01018b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01018ba:	83 ec 04             	sub    $0x4,%esp
c01018bd:	6a 7c                	push   $0x7c
c01018bf:	6a 00                	push   $0x0
c01018c1:	ff 75 f4             	pushl  -0xc(%ebp)
c01018c4:	e8 06 a9 00 00       	call   c010c1cf <Memset>
c01018c9:	83 c4 10             	add    $0x10,%esp
c01018cc:	8b 55 18             	mov    0x18(%ebp),%edx
c01018cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018d2:	89 50 78             	mov    %edx,0x78(%eax)
c01018d5:	8b 55 0c             	mov    0xc(%ebp),%edx
c01018d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018db:	89 50 14             	mov    %edx,0x14(%eax)
c01018de:	8b 55 10             	mov    0x10(%ebp),%edx
c01018e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018e4:	89 50 10             	mov    %edx,0x10(%eax)
c01018e7:	8b 55 14             	mov    0x14(%ebp),%edx
c01018ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018ed:	89 50 0c             	mov    %edx,0xc(%eax)
c01018f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01018f3:	c1 e0 09             	shl    $0x9,%eax
c01018f6:	89 c2                	mov    %eax,%edx
c01018f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018fb:	89 50 18             	mov    %edx,0x18(%eax)
c01018fe:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101902:	74 22                	je     c0101926 <rd_wt+0x82>
c0101904:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101908:	74 1c                	je     c0101926 <rd_wt+0x82>
c010190a:	68 b1 00 00 00       	push   $0xb1
c010190f:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101914:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101919:	68 7e b3 10 c0       	push   $0xc010b37e
c010191e:	e8 12 70 00 00       	call   c0108935 <assertion_failure>
c0101923:	83 c4 10             	add    $0x10,%esp
c0101926:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101929:	8b 40 78             	mov    0x78(%eax),%eax
c010192c:	83 f8 07             	cmp    $0x7,%eax
c010192f:	74 27                	je     c0101958 <rd_wt+0xb4>
c0101931:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101934:	8b 40 78             	mov    0x78(%eax),%eax
c0101937:	83 f8 0a             	cmp    $0xa,%eax
c010193a:	74 1c                	je     c0101958 <rd_wt+0xb4>
c010193c:	68 b2 00 00 00       	push   $0xb2
c0101941:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101946:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010194b:	68 9c b3 10 c0       	push   $0xc010b39c
c0101950:	e8 e0 6f 00 00       	call   c0108935 <assertion_failure>
c0101955:	83 c4 10             	add    $0x10,%esp
c0101958:	83 ec 04             	sub    $0x4,%esp
c010195b:	6a 03                	push   $0x3
c010195d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101960:	6a 03                	push   $0x3
c0101962:	e8 3e 7c 00 00       	call   c01095a5 <send_rec>
c0101967:	83 c4 10             	add    $0x10,%esp
c010196a:	83 ec 08             	sub    $0x8,%esp
c010196d:	6a 7c                	push   $0x7c
c010196f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101972:	e8 0a fd ff ff       	call   c0101681 <sys_free>
c0101977:	83 c4 10             	add    $0x10,%esp
c010197a:	90                   	nop
c010197b:	c9                   	leave  
c010197c:	c3                   	ret    

c010197d <mkfs>:
c010197d:	55                   	push   %ebp
c010197e:	89 e5                	mov    %esp,%ebp
c0101980:	57                   	push   %edi
c0101981:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101987:	83 ec 0c             	sub    $0xc,%esp
c010198a:	68 00 80 00 00       	push   $0x8000
c010198f:	e8 d8 fc ff ff       	call   c010166c <sys_malloc>
c0101994:	83 c4 10             	add    $0x10,%esp
c0101997:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c010199c:	83 ec 0c             	sub    $0xc,%esp
c010199f:	6a 24                	push   $0x24
c01019a1:	e8 c6 fc ff ff       	call   c010166c <sys_malloc>
c01019a6:	83 c4 10             	add    $0x10,%esp
c01019a9:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c01019ae:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019b3:	83 ec 0c             	sub    $0xc,%esp
c01019b6:	50                   	push   %eax
c01019b7:	e8 42 46 00 00       	call   c0105ffe <get_physical_address>
c01019bc:	83 c4 10             	add    $0x10,%esp
c01019bf:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c01019c4:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01019c9:	83 ec 0c             	sub    $0xc,%esp
c01019cc:	50                   	push   %eax
c01019cd:	e8 2c 46 00 00       	call   c0105ffe <get_physical_address>
c01019d2:	83 c4 10             	add    $0x10,%esp
c01019d5:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c01019da:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019df:	83 ec 04             	sub    $0x4,%esp
c01019e2:	68 00 02 00 00       	push   $0x200
c01019e7:	6a 00                	push   $0x0
c01019e9:	50                   	push   %eax
c01019ea:	e8 e0 a7 00 00       	call   c010c1cf <Memset>
c01019ef:	83 c4 10             	add    $0x10,%esp
c01019f2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019f7:	83 ec 0c             	sub    $0xc,%esp
c01019fa:	6a 0a                	push   $0xa
c01019fc:	68 00 02 00 00       	push   $0x200
c0101a01:	50                   	push   %eax
c0101a02:	6a 20                	push   $0x20
c0101a04:	6a 00                	push   $0x0
c0101a06:	e8 99 fe ff ff       	call   c01018a4 <rd_wt>
c0101a0b:	83 c4 20             	add    $0x20,%esp
c0101a0e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a13:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101a16:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a19:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101a20:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a23:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0101a2a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a2d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101a34:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a37:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101a3e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a41:	8b 40 04             	mov    0x4(%eax),%eax
c0101a44:	8d 50 02             	lea    0x2(%eax),%edx
c0101a47:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a4a:	8b 40 08             	mov    0x8(%eax),%eax
c0101a4d:	01 c2                	add    %eax,%edx
c0101a4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a52:	8b 40 0c             	mov    0xc(%eax),%eax
c0101a55:	01 c2                	add    %eax,%edx
c0101a57:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a5a:	89 10                	mov    %edx,(%eax)
c0101a5c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101a63:	b8 00 02 00 00       	mov    $0x200,%eax
c0101a68:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101a6b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101a71:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101a74:	01 ca                	add    %ecx,%edx
c0101a76:	83 ec 04             	sub    $0x4,%esp
c0101a79:	50                   	push   %eax
c0101a7a:	6a 80                	push   $0xffffff80
c0101a7c:	52                   	push   %edx
c0101a7d:	e8 4d a7 00 00       	call   c010c1cf <Memset>
c0101a82:	83 c4 10             	add    $0x10,%esp
c0101a85:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a8a:	83 ec 0c             	sub    $0xc,%esp
c0101a8d:	6a 0a                	push   $0xa
c0101a8f:	68 00 02 00 00       	push   $0x200
c0101a94:	50                   	push   %eax
c0101a95:	6a 20                	push   $0x20
c0101a97:	6a 01                	push   $0x1
c0101a99:	e8 06 fe ff ff       	call   c01018a4 <rd_wt>
c0101a9e:	83 c4 20             	add    $0x20,%esp
c0101aa1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101aa4:	8b 10                	mov    (%eax),%edx
c0101aa6:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101aa9:	8b 50 04             	mov    0x4(%eax),%edx
c0101aac:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101aaf:	8b 50 08             	mov    0x8(%eax),%edx
c0101ab2:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101ab5:	8b 50 0c             	mov    0xc(%eax),%edx
c0101ab8:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101abb:	8b 50 10             	mov    0x10(%eax),%edx
c0101abe:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101ac1:	8b 50 14             	mov    0x14(%eax),%edx
c0101ac4:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101ac7:	8b 50 18             	mov    0x18(%eax),%edx
c0101aca:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101acd:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101ad0:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101ad3:	8b 40 20             	mov    0x20(%eax),%eax
c0101ad6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101ad9:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101add:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101ae1:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ae6:	83 ec 04             	sub    $0x4,%esp
c0101ae9:	6a 01                	push   $0x1
c0101aeb:	52                   	push   %edx
c0101aec:	50                   	push   %eax
c0101aed:	e8 dd a6 00 00       	call   c010c1cf <Memset>
c0101af2:	83 c4 10             	add    $0x10,%esp
c0101af5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101afa:	83 c0 01             	add    $0x1,%eax
c0101afd:	83 ec 04             	sub    $0x4,%esp
c0101b00:	68 ff 01 00 00       	push   $0x1ff
c0101b05:	6a 80                	push   $0xffffff80
c0101b07:	50                   	push   %eax
c0101b08:	e8 c2 a6 00 00       	call   c010c1cf <Memset>
c0101b0d:	83 c4 10             	add    $0x10,%esp
c0101b10:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b15:	83 ec 0c             	sub    $0xc,%esp
c0101b18:	6a 0a                	push   $0xa
c0101b1a:	68 00 02 00 00       	push   $0x200
c0101b1f:	50                   	push   %eax
c0101b20:	6a 20                	push   $0x20
c0101b22:	6a 02                	push   $0x2
c0101b24:	e8 7b fd ff ff       	call   c01018a4 <rd_wt>
c0101b29:	83 c4 20             	add    $0x20,%esp
c0101b2c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101b33:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b38:	83 ec 04             	sub    $0x4,%esp
c0101b3b:	68 00 02 00 00       	push   $0x200
c0101b40:	6a ff                	push   $0xffffffff
c0101b42:	50                   	push   %eax
c0101b43:	e8 87 a6 00 00       	call   c010c1cf <Memset>
c0101b48:	83 c4 10             	add    $0x10,%esp
c0101b4b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b50:	83 ec 0c             	sub    $0xc,%esp
c0101b53:	6a 0a                	push   $0xa
c0101b55:	68 00 02 00 00       	push   $0x200
c0101b5a:	50                   	push   %eax
c0101b5b:	6a 20                	push   $0x20
c0101b5d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101b60:	e8 3f fd ff ff       	call   c01018a4 <rd_wt>
c0101b65:	83 c4 20             	add    $0x20,%esp
c0101b68:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b6d:	83 ec 04             	sub    $0x4,%esp
c0101b70:	6a 01                	push   $0x1
c0101b72:	6a 01                	push   $0x1
c0101b74:	50                   	push   %eax
c0101b75:	e8 55 a6 00 00       	call   c010c1cf <Memset>
c0101b7a:	83 c4 10             	add    $0x10,%esp
c0101b7d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b82:	83 c0 01             	add    $0x1,%eax
c0101b85:	83 ec 04             	sub    $0x4,%esp
c0101b88:	68 ff 01 00 00       	push   $0x1ff
c0101b8d:	6a 00                	push   $0x0
c0101b8f:	50                   	push   %eax
c0101b90:	e8 3a a6 00 00       	call   c010c1cf <Memset>
c0101b95:	83 c4 10             	add    $0x10,%esp
c0101b98:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b9d:	89 c2                	mov    %eax,%edx
c0101b9f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101ba2:	83 c0 01             	add    $0x1,%eax
c0101ba5:	83 ec 0c             	sub    $0xc,%esp
c0101ba8:	6a 0a                	push   $0xa
c0101baa:	68 00 02 00 00       	push   $0x200
c0101baf:	52                   	push   %edx
c0101bb0:	6a 20                	push   $0x20
c0101bb2:	50                   	push   %eax
c0101bb3:	e8 ec fc ff ff       	call   c01018a4 <rd_wt>
c0101bb8:	83 c4 20             	add    $0x20,%esp
c0101bbb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101bbe:	83 e8 02             	sub    $0x2,%eax
c0101bc1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101bc4:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101bcb:	eb 04                	jmp    c0101bd1 <mkfs+0x254>
c0101bcd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101bd1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101bd4:	83 c0 01             	add    $0x1,%eax
c0101bd7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101bda:	7e f1                	jle    c0101bcd <mkfs+0x250>
c0101bdc:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101be1:	89 c2                	mov    %eax,%edx
c0101be3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101be6:	83 c0 03             	add    $0x3,%eax
c0101be9:	83 ec 0c             	sub    $0xc,%esp
c0101bec:	6a 0a                	push   $0xa
c0101bee:	68 00 02 00 00       	push   $0x200
c0101bf3:	52                   	push   %edx
c0101bf4:	6a 20                	push   $0x20
c0101bf6:	50                   	push   %eax
c0101bf7:	e8 a8 fc ff ff       	call   c01018a4 <rd_wt>
c0101bfc:	83 c4 20             	add    $0x20,%esp
c0101bff:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c04:	89 c2                	mov    %eax,%edx
c0101c06:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c09:	83 c0 03             	add    $0x3,%eax
c0101c0c:	83 ec 0c             	sub    $0xc,%esp
c0101c0f:	6a 07                	push   $0x7
c0101c11:	68 00 02 00 00       	push   $0x200
c0101c16:	52                   	push   %edx
c0101c17:	6a 20                	push   $0x20
c0101c19:	50                   	push   %eax
c0101c1a:	e8 85 fc ff ff       	call   c01018a4 <rd_wt>
c0101c1f:	83 c4 20             	add    $0x20,%esp
c0101c22:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c27:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101c2a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c2d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101c33:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c36:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101c3d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101c40:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c43:	89 50 08             	mov    %edx,0x8(%eax)
c0101c46:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c49:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101c50:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c53:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101c5a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c5d:	8b 10                	mov    (%eax),%edx
c0101c5f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101c65:	8b 50 04             	mov    0x4(%eax),%edx
c0101c68:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101c6e:	8b 50 08             	mov    0x8(%eax),%edx
c0101c71:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101c77:	8b 50 0c             	mov    0xc(%eax),%edx
c0101c7a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101c80:	8b 50 10             	mov    0x10(%eax),%edx
c0101c83:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101c89:	8b 50 14             	mov    0x14(%eax),%edx
c0101c8c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101c92:	8b 50 18             	mov    0x18(%eax),%edx
c0101c95:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101c9b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101c9e:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101ca4:	8b 50 20             	mov    0x20(%eax),%edx
c0101ca7:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101cad:	8b 40 24             	mov    0x24(%eax),%eax
c0101cb0:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101cb5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101cbc:	eb 4c                	jmp    c0101d0a <mkfs+0x38d>
c0101cbe:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101cc3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101cc6:	83 c2 01             	add    $0x1,%edx
c0101cc9:	c1 e2 05             	shl    $0x5,%edx
c0101ccc:	01 d0                	add    %edx,%eax
c0101cce:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101cd1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cd4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101cda:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cdd:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101ce4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ce7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101cee:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101cf5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101cf8:	c1 e0 08             	shl    $0x8,%eax
c0101cfb:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101cfe:	89 c2                	mov    %eax,%edx
c0101d00:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d03:	89 50 08             	mov    %edx,0x8(%eax)
c0101d06:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101d0a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101d0e:	7e ae                	jle    c0101cbe <mkfs+0x341>
c0101d10:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101d17:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101d1d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101d22:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101d27:	89 d7                	mov    %edx,%edi
c0101d29:	f3 ab                	rep stos %eax,%es:(%edi)
c0101d2b:	c7 85 70 ff ff ff c4 	movl   $0xc010b3c4,-0x90(%ebp)
c0101d32:	b3 10 c0 
c0101d35:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101d3c:	eb 54                	jmp    c0101d92 <mkfs+0x415>
c0101d3e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d43:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101d46:	83 c2 04             	add    $0x4,%edx
c0101d49:	c1 e2 05             	shl    $0x5,%edx
c0101d4c:	01 d0                	add    %edx,%eax
c0101d4e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101d51:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d54:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101d5a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d5d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101d64:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101d67:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101d6a:	83 c2 01             	add    $0x1,%edx
c0101d6d:	c1 e2 0b             	shl    $0xb,%edx
c0101d70:	01 c2                	add    %eax,%edx
c0101d72:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d75:	89 50 08             	mov    %edx,0x8(%eax)
c0101d78:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d7b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101d82:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d85:	8d 50 05             	lea    0x5(%eax),%edx
c0101d88:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d8b:	89 50 10             	mov    %edx,0x10(%eax)
c0101d8e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101d92:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d95:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101d98:	7c a4                	jl     c0101d3e <mkfs+0x3c1>
c0101d9a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d9f:	89 c2                	mov    %eax,%edx
c0101da1:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101da4:	83 c0 03             	add    $0x3,%eax
c0101da7:	83 ec 0c             	sub    $0xc,%esp
c0101daa:	6a 0a                	push   $0xa
c0101dac:	68 00 02 00 00       	push   $0x200
c0101db1:	52                   	push   %edx
c0101db2:	6a 20                	push   $0x20
c0101db4:	50                   	push   %eax
c0101db5:	e8 ea fa ff ff       	call   c01018a4 <rd_wt>
c0101dba:	83 c4 20             	add    $0x20,%esp
c0101dbd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101dc2:	89 c2                	mov    %eax,%edx
c0101dc4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101dc7:	83 ec 0c             	sub    $0xc,%esp
c0101dca:	6a 07                	push   $0x7
c0101dcc:	68 00 02 00 00       	push   $0x200
c0101dd1:	52                   	push   %edx
c0101dd2:	6a 20                	push   $0x20
c0101dd4:	50                   	push   %eax
c0101dd5:	e8 ca fa ff ff       	call   c01018a4 <rd_wt>
c0101dda:	83 c4 20             	add    $0x20,%esp
c0101ddd:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101de4:	00 00 00 
c0101de7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101dee:	2e 00 
c0101df0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101df5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101df8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101dfb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101e01:	83 ec 0c             	sub    $0xc,%esp
c0101e04:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101e0a:	50                   	push   %eax
c0101e0b:	e8 f8 a3 00 00       	call   c010c208 <Strlen>
c0101e10:	83 c4 10             	add    $0x10,%esp
c0101e13:	89 c1                	mov    %eax,%ecx
c0101e15:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e18:	8d 50 04             	lea    0x4(%eax),%edx
c0101e1b:	83 ec 04             	sub    $0x4,%esp
c0101e1e:	51                   	push   %ecx
c0101e1f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101e25:	50                   	push   %eax
c0101e26:	52                   	push   %edx
c0101e27:	e8 f0 4e 00 00       	call   c0106d1c <Memcpy>
c0101e2c:	83 c4 10             	add    $0x10,%esp
c0101e2f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101e35:	b8 00 00 00 00       	mov    $0x0,%eax
c0101e3a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101e3f:	89 d7                	mov    %edx,%edi
c0101e41:	f3 ab                	rep stos %eax,%es:(%edi)
c0101e43:	c7 85 34 ff ff ff d0 	movl   $0xc010b3d0,-0xcc(%ebp)
c0101e4a:	b3 10 c0 
c0101e4d:	c7 85 38 ff ff ff d9 	movl   $0xc010b3d9,-0xc8(%ebp)
c0101e54:	b3 10 c0 
c0101e57:	c7 85 3c ff ff ff e2 	movl   $0xc010b3e2,-0xc4(%ebp)
c0101e5e:	b3 10 c0 
c0101e61:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101e68:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101e6f:	eb 49                	jmp    c0101eba <mkfs+0x53d>
c0101e71:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101e75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e78:	8d 50 02             	lea    0x2(%eax),%edx
c0101e7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e7e:	89 10                	mov    %edx,(%eax)
c0101e80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e83:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101e8a:	83 ec 0c             	sub    $0xc,%esp
c0101e8d:	50                   	push   %eax
c0101e8e:	e8 75 a3 00 00       	call   c010c208 <Strlen>
c0101e93:	83 c4 10             	add    $0x10,%esp
c0101e96:	89 c1                	mov    %eax,%ecx
c0101e98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e9b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101ea2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101ea5:	83 c2 04             	add    $0x4,%edx
c0101ea8:	83 ec 04             	sub    $0x4,%esp
c0101eab:	51                   	push   %ecx
c0101eac:	50                   	push   %eax
c0101ead:	52                   	push   %edx
c0101eae:	e8 69 4e 00 00       	call   c0106d1c <Memcpy>
c0101eb3:	83 c4 10             	add    $0x10,%esp
c0101eb6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101eba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101ebd:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101ec0:	7c af                	jl     c0101e71 <mkfs+0x4f4>
c0101ec2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101ec9:	eb 66                	jmp    c0101f31 <mkfs+0x5b4>
c0101ecb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ece:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101ed5:	83 ec 0c             	sub    $0xc,%esp
c0101ed8:	50                   	push   %eax
c0101ed9:	e8 2a a3 00 00       	call   c010c208 <Strlen>
c0101ede:	83 c4 10             	add    $0x10,%esp
c0101ee1:	85 c0                	test   %eax,%eax
c0101ee3:	74 47                	je     c0101f2c <mkfs+0x5af>
c0101ee5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101ee9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101eec:	8d 50 05             	lea    0x5(%eax),%edx
c0101eef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ef2:	89 10                	mov    %edx,(%eax)
c0101ef4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ef7:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101efe:	83 ec 0c             	sub    $0xc,%esp
c0101f01:	50                   	push   %eax
c0101f02:	e8 01 a3 00 00       	call   c010c208 <Strlen>
c0101f07:	83 c4 10             	add    $0x10,%esp
c0101f0a:	89 c1                	mov    %eax,%ecx
c0101f0c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f0f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101f16:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101f19:	83 c2 04             	add    $0x4,%edx
c0101f1c:	83 ec 04             	sub    $0x4,%esp
c0101f1f:	51                   	push   %ecx
c0101f20:	50                   	push   %eax
c0101f21:	52                   	push   %edx
c0101f22:	e8 f5 4d 00 00       	call   c0106d1c <Memcpy>
c0101f27:	83 c4 10             	add    $0x10,%esp
c0101f2a:	eb 01                	jmp    c0101f2d <mkfs+0x5b0>
c0101f2c:	90                   	nop
c0101f2d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101f31:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f34:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101f37:	7c 92                	jl     c0101ecb <mkfs+0x54e>
c0101f39:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101f3e:	89 c2                	mov    %eax,%edx
c0101f40:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101f43:	83 ec 0c             	sub    $0xc,%esp
c0101f46:	6a 0a                	push   $0xa
c0101f48:	68 00 02 00 00       	push   $0x200
c0101f4d:	52                   	push   %edx
c0101f4e:	6a 20                	push   $0x20
c0101f50:	50                   	push   %eax
c0101f51:	e8 4e f9 ff ff       	call   c01018a4 <rd_wt>
c0101f56:	83 c4 20             	add    $0x20,%esp
c0101f59:	90                   	nop
c0101f5a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101f5d:	c9                   	leave  
c0101f5e:	c3                   	ret    

c0101f5f <init_fs>:
c0101f5f:	55                   	push   %ebp
c0101f60:	89 e5                	mov    %esp,%ebp
c0101f62:	83 ec 18             	sub    $0x18,%esp
c0101f65:	83 ec 0c             	sub    $0xc,%esp
c0101f68:	6a 7c                	push   $0x7c
c0101f6a:	e8 fd f6 ff ff       	call   c010166c <sys_malloc>
c0101f6f:	83 c4 10             	add    $0x10,%esp
c0101f72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101f75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f78:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101f7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f82:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101f89:	83 ec 04             	sub    $0x4,%esp
c0101f8c:	6a 03                	push   $0x3
c0101f8e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101f91:	6a 03                	push   $0x3
c0101f93:	e8 0d 76 00 00       	call   c01095a5 <send_rec>
c0101f98:	83 c4 10             	add    $0x10,%esp
c0101f9b:	e8 dd f9 ff ff       	call   c010197d <mkfs>
c0101fa0:	83 ec 08             	sub    $0x8,%esp
c0101fa3:	6a 7c                	push   $0x7c
c0101fa5:	ff 75 f4             	pushl  -0xc(%ebp)
c0101fa8:	e8 d4 f6 ff ff       	call   c0101681 <sys_free>
c0101fad:	83 c4 10             	add    $0x10,%esp
c0101fb0:	90                   	nop
c0101fb1:	c9                   	leave  
c0101fb2:	c3                   	ret    

c0101fb3 <do_open>:
c0101fb3:	55                   	push   %ebp
c0101fb4:	89 e5                	mov    %esp,%ebp
c0101fb6:	83 ec 68             	sub    $0x68,%esp
c0101fb9:	83 ec 04             	sub    $0x4,%esp
c0101fbc:	6a 0c                	push   $0xc
c0101fbe:	6a 00                	push   $0x0
c0101fc0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101fc3:	50                   	push   %eax
c0101fc4:	e8 06 a2 00 00       	call   c010c1cf <Memset>
c0101fc9:	83 c4 10             	add    $0x10,%esp
c0101fcc:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fcf:	8b 40 44             	mov    0x44(%eax),%eax
c0101fd2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101fd5:	83 ec 08             	sub    $0x8,%esp
c0101fd8:	6a 0c                	push   $0xc
c0101fda:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101fdd:	e8 cd 3e 00 00       	call   c0105eaf <alloc_virtual_memory>
c0101fe2:	83 c4 10             	add    $0x10,%esp
c0101fe5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101fe8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101feb:	8b 40 40             	mov    0x40(%eax),%eax
c0101fee:	89 c2                	mov    %eax,%edx
c0101ff0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ff3:	83 ec 04             	sub    $0x4,%esp
c0101ff6:	52                   	push   %edx
c0101ff7:	50                   	push   %eax
c0101ff8:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101ffb:	50                   	push   %eax
c0101ffc:	e8 1b 4d 00 00       	call   c0106d1c <Memcpy>
c0102001:	83 c4 10             	add    $0x10,%esp
c0102004:	8b 45 08             	mov    0x8(%ebp),%eax
c0102007:	8b 40 40             	mov    0x40(%eax),%eax
c010200a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c010200f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102012:	8b 40 74             	mov    0x74(%eax),%eax
c0102015:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102018:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c010201f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102026:	eb 1f                	jmp    c0102047 <do_open+0x94>
c0102028:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010202d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102030:	83 c2 4c             	add    $0x4c,%edx
c0102033:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0102037:	85 c0                	test   %eax,%eax
c0102039:	75 08                	jne    c0102043 <do_open+0x90>
c010203b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010203e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102041:	eb 0a                	jmp    c010204d <do_open+0x9a>
c0102043:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102047:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c010204b:	7e db                	jle    c0102028 <do_open+0x75>
c010204d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0102051:	75 1c                	jne    c010206f <do_open+0xbc>
c0102053:	68 c6 01 00 00       	push   $0x1c6
c0102058:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010205d:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102062:	68 eb b3 10 c0       	push   $0xc010b3eb
c0102067:	e8 c9 68 00 00       	call   c0108935 <assertion_failure>
c010206c:	83 c4 10             	add    $0x10,%esp
c010206f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0102076:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010207d:	eb 1d                	jmp    c010209c <do_open+0xe9>
c010207f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102082:	c1 e0 04             	shl    $0x4,%eax
c0102085:	05 88 13 11 c0       	add    $0xc0111388,%eax
c010208a:	8b 00                	mov    (%eax),%eax
c010208c:	85 c0                	test   %eax,%eax
c010208e:	75 08                	jne    c0102098 <do_open+0xe5>
c0102090:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102093:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102096:	eb 0a                	jmp    c01020a2 <do_open+0xef>
c0102098:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010209c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c01020a0:	7e dd                	jle    c010207f <do_open+0xcc>
c01020a2:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c01020a6:	75 1c                	jne    c01020c4 <do_open+0x111>
c01020a8:	68 d2 01 00 00       	push   $0x1d2
c01020ad:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01020b2:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01020b7:	68 f3 b3 10 c0       	push   $0xc010b3f3
c01020bc:	e8 74 68 00 00       	call   c0108935 <assertion_failure>
c01020c1:	83 c4 10             	add    $0x10,%esp
c01020c4:	83 ec 0c             	sub    $0xc,%esp
c01020c7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01020ca:	50                   	push   %eax
c01020cb:	e8 d2 00 00 00       	call   c01021a2 <search_file>
c01020d0:	83 c4 10             	add    $0x10,%esp
c01020d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01020d6:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01020da:	75 2b                	jne    c0102107 <do_open+0x154>
c01020dc:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c01020e0:	7e 10                	jle    c01020f2 <do_open+0x13f>
c01020e2:	83 ec 0c             	sub    $0xc,%esp
c01020e5:	68 fb b3 10 c0       	push   $0xc010b3fb
c01020ea:	e8 28 68 00 00       	call   c0108917 <panic>
c01020ef:	83 c4 10             	add    $0x10,%esp
c01020f2:	83 ec 08             	sub    $0x8,%esp
c01020f5:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01020f8:	50                   	push   %eax
c01020f9:	8d 45 9c             	lea    -0x64(%ebp),%eax
c01020fc:	50                   	push   %eax
c01020fd:	e8 60 04 00 00       	call   c0102562 <create_file>
c0102102:	83 c4 10             	add    $0x10,%esp
c0102105:	eb 25                	jmp    c010212c <do_open+0x179>
c0102107:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010210b:	75 0a                	jne    c0102117 <do_open+0x164>
c010210d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102112:	e9 89 00 00 00       	jmp    c01021a0 <do_open+0x1ed>
c0102117:	83 ec 08             	sub    $0x8,%esp
c010211a:	ff 75 d8             	pushl  -0x28(%ebp)
c010211d:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0102120:	50                   	push   %eax
c0102121:	e8 7a 02 00 00       	call   c01023a0 <get_inode>
c0102126:	83 c4 10             	add    $0x10,%esp
c0102129:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010212c:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0102131:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102134:	c1 e2 04             	shl    $0x4,%edx
c0102137:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010213d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102140:	83 c2 4c             	add    $0x4c,%edx
c0102143:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102147:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010214a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010214d:	c1 e2 04             	shl    $0x4,%edx
c0102150:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102156:	89 02                	mov    %eax,(%edx)
c0102158:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010215b:	c1 e0 04             	shl    $0x4,%eax
c010215e:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102163:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102169:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010216c:	c1 e0 04             	shl    $0x4,%eax
c010216f:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102174:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010217a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010217d:	c1 e0 04             	shl    $0x4,%eax
c0102180:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102185:	8b 00                	mov    (%eax),%eax
c0102187:	8d 50 01             	lea    0x1(%eax),%edx
c010218a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010218d:	c1 e0 04             	shl    $0x4,%eax
c0102190:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102195:	89 10                	mov    %edx,(%eax)
c0102197:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010219a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010219d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01021a0:	c9                   	leave  
c01021a1:	c3                   	ret    

c01021a2 <search_file>:
c01021a2:	55                   	push   %ebp
c01021a3:	89 e5                	mov    %esp,%ebp
c01021a5:	83 ec 68             	sub    $0x68,%esp
c01021a8:	83 ec 04             	sub    $0x4,%esp
c01021ab:	6a 0c                	push   $0xc
c01021ad:	6a 00                	push   $0x0
c01021af:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01021b2:	50                   	push   %eax
c01021b3:	e8 17 a0 00 00       	call   c010c1cf <Memset>
c01021b8:	83 c4 10             	add    $0x10,%esp
c01021bb:	83 ec 04             	sub    $0x4,%esp
c01021be:	6a 28                	push   $0x28
c01021c0:	6a 00                	push   $0x0
c01021c2:	8d 45 98             	lea    -0x68(%ebp),%eax
c01021c5:	50                   	push   %eax
c01021c6:	e8 04 a0 00 00       	call   c010c1cf <Memset>
c01021cb:	83 c4 10             	add    $0x10,%esp
c01021ce:	83 ec 04             	sub    $0x4,%esp
c01021d1:	8d 45 98             	lea    -0x68(%ebp),%eax
c01021d4:	50                   	push   %eax
c01021d5:	ff 75 08             	pushl  0x8(%ebp)
c01021d8:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01021db:	50                   	push   %eax
c01021dc:	e8 f3 00 00 00       	call   c01022d4 <strip_path>
c01021e1:	83 c4 10             	add    $0x10,%esp
c01021e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01021e7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c01021eb:	75 0a                	jne    c01021f7 <search_file+0x55>
c01021ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01021f2:	e9 db 00 00 00       	jmp    c01022d2 <search_file+0x130>
c01021f7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01021fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01021fd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102200:	05 00 02 00 00       	add    $0x200,%eax
c0102205:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010220b:	85 c0                	test   %eax,%eax
c010220d:	0f 48 c2             	cmovs  %edx,%eax
c0102210:	c1 f8 09             	sar    $0x9,%eax
c0102213:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102216:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102219:	c1 e8 04             	shr    $0x4,%eax
c010221c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010221f:	e8 5c 14 00 00       	call   c0103680 <get_super_block>
c0102224:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102227:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010222a:	8b 00                	mov    (%eax),%eax
c010222c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010222f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102236:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010223d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102244:	eb 7b                	jmp    c01022c1 <search_file+0x11f>
c0102246:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010224b:	89 c1                	mov    %eax,%ecx
c010224d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102250:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102253:	01 d0                	add    %edx,%eax
c0102255:	83 ec 0c             	sub    $0xc,%esp
c0102258:	6a 07                	push   $0x7
c010225a:	68 00 02 00 00       	push   $0x200
c010225f:	51                   	push   %ecx
c0102260:	ff 75 cc             	pushl  -0x34(%ebp)
c0102263:	50                   	push   %eax
c0102264:	e8 3b f6 ff ff       	call   c01018a4 <rd_wt>
c0102269:	83 c4 20             	add    $0x20,%esp
c010226c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102271:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102274:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010227b:	eb 35                	jmp    c01022b2 <search_file+0x110>
c010227d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102281:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102284:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102287:	7f 33                	jg     c01022bc <search_file+0x11a>
c0102289:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010228c:	83 c0 04             	add    $0x4,%eax
c010228f:	83 ec 08             	sub    $0x8,%esp
c0102292:	50                   	push   %eax
c0102293:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102296:	50                   	push   %eax
c0102297:	e8 70 76 00 00       	call   c010990c <strcmp>
c010229c:	83 c4 10             	add    $0x10,%esp
c010229f:	85 c0                	test   %eax,%eax
c01022a1:	75 07                	jne    c01022aa <search_file+0x108>
c01022a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022a6:	8b 00                	mov    (%eax),%eax
c01022a8:	eb 28                	jmp    c01022d2 <search_file+0x130>
c01022aa:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01022ae:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c01022b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022b5:	83 f8 1f             	cmp    $0x1f,%eax
c01022b8:	76 c3                	jbe    c010227d <search_file+0xdb>
c01022ba:	eb 01                	jmp    c01022bd <search_file+0x11b>
c01022bc:	90                   	nop
c01022bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01022c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022c4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c01022c7:	0f 8c 79 ff ff ff    	jl     c0102246 <search_file+0xa4>
c01022cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022d2:	c9                   	leave  
c01022d3:	c3                   	ret    

c01022d4 <strip_path>:
c01022d4:	55                   	push   %ebp
c01022d5:	89 e5                	mov    %esp,%ebp
c01022d7:	83 ec 10             	sub    $0x10,%esp
c01022da:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01022de:	75 0a                	jne    c01022ea <strip_path+0x16>
c01022e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022e5:	e9 b4 00 00 00       	jmp    c010239e <strip_path+0xca>
c01022ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01022ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01022f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022f3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01022f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01022f9:	0f b6 00             	movzbl (%eax),%eax
c01022fc:	3c 2f                	cmp    $0x2f,%al
c01022fe:	75 2d                	jne    c010232d <strip_path+0x59>
c0102300:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102304:	eb 27                	jmp    c010232d <strip_path+0x59>
c0102306:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102309:	0f b6 00             	movzbl (%eax),%eax
c010230c:	3c 2f                	cmp    $0x2f,%al
c010230e:	75 0a                	jne    c010231a <strip_path+0x46>
c0102310:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102315:	e9 84 00 00 00       	jmp    c010239e <strip_path+0xca>
c010231a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010231d:	0f b6 10             	movzbl (%eax),%edx
c0102320:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102323:	88 10                	mov    %dl,(%eax)
c0102325:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102329:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010232d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102330:	0f b6 00             	movzbl (%eax),%eax
c0102333:	84 c0                	test   %al,%al
c0102335:	75 cf                	jne    c0102306 <strip_path+0x32>
c0102337:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010233a:	c6 00 00             	movb   $0x0,(%eax)
c010233d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102340:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102346:	89 10                	mov    %edx,(%eax)
c0102348:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010234e:	89 50 04             	mov    %edx,0x4(%eax)
c0102351:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102357:	89 50 08             	mov    %edx,0x8(%eax)
c010235a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102360:	89 50 0c             	mov    %edx,0xc(%eax)
c0102363:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102369:	89 50 10             	mov    %edx,0x10(%eax)
c010236c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102372:	89 50 14             	mov    %edx,0x14(%eax)
c0102375:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010237b:	89 50 18             	mov    %edx,0x18(%eax)
c010237e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102384:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102387:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010238d:	89 50 20             	mov    %edx,0x20(%eax)
c0102390:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102396:	89 50 24             	mov    %edx,0x24(%eax)
c0102399:	b8 00 00 00 00       	mov    $0x0,%eax
c010239e:	c9                   	leave  
c010239f:	c3                   	ret    

c01023a0 <get_inode>:
c01023a0:	55                   	push   %ebp
c01023a1:	89 e5                	mov    %esp,%ebp
c01023a3:	56                   	push   %esi
c01023a4:	53                   	push   %ebx
c01023a5:	83 ec 20             	sub    $0x20,%esp
c01023a8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01023ac:	75 0a                	jne    c01023b8 <get_inode+0x18>
c01023ae:	b8 00 00 00 00       	mov    $0x0,%eax
c01023b3:	e9 a3 01 00 00       	jmp    c010255b <get_inode+0x1bb>
c01023b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01023bf:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c01023c6:	eb 69                	jmp    c0102431 <get_inode+0x91>
c01023c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023cb:	8b 40 24             	mov    0x24(%eax),%eax
c01023ce:	85 c0                	test   %eax,%eax
c01023d0:	7e 53                	jle    c0102425 <get_inode+0x85>
c01023d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023d5:	8b 40 10             	mov    0x10(%eax),%eax
c01023d8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01023db:	75 50                	jne    c010242d <get_inode+0x8d>
c01023dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01023e0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01023e3:	8b 0a                	mov    (%edx),%ecx
c01023e5:	89 08                	mov    %ecx,(%eax)
c01023e7:	8b 4a 04             	mov    0x4(%edx),%ecx
c01023ea:	89 48 04             	mov    %ecx,0x4(%eax)
c01023ed:	8b 4a 08             	mov    0x8(%edx),%ecx
c01023f0:	89 48 08             	mov    %ecx,0x8(%eax)
c01023f3:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01023f6:	89 48 0c             	mov    %ecx,0xc(%eax)
c01023f9:	8b 4a 10             	mov    0x10(%edx),%ecx
c01023fc:	89 48 10             	mov    %ecx,0x10(%eax)
c01023ff:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102402:	89 48 14             	mov    %ecx,0x14(%eax)
c0102405:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102408:	89 48 18             	mov    %ecx,0x18(%eax)
c010240b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010240e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102411:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102414:	89 48 20             	mov    %ecx,0x20(%eax)
c0102417:	8b 52 24             	mov    0x24(%edx),%edx
c010241a:	89 50 24             	mov    %edx,0x24(%eax)
c010241d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102420:	e9 36 01 00 00       	jmp    c010255b <get_inode+0x1bb>
c0102425:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102428:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010242b:	eb 0d                	jmp    c010243a <get_inode+0x9a>
c010242d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102431:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102438:	76 8e                	jbe    c01023c8 <get_inode+0x28>
c010243a:	e8 41 12 00 00       	call   c0103680 <get_super_block>
c010243f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102442:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102449:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010244c:	8b 40 04             	mov    0x4(%eax),%eax
c010244f:	8d 50 02             	lea    0x2(%eax),%edx
c0102452:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102455:	8b 40 08             	mov    0x8(%eax),%eax
c0102458:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010245b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010245e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102461:	b8 00 02 00 00       	mov    $0x200,%eax
c0102466:	99                   	cltd   
c0102467:	f7 7d e8             	idivl  -0x18(%ebp)
c010246a:	89 c6                	mov    %eax,%esi
c010246c:	89 c8                	mov    %ecx,%eax
c010246e:	99                   	cltd   
c010246f:	f7 fe                	idiv   %esi
c0102471:	01 d8                	add    %ebx,%eax
c0102473:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102476:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010247d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102482:	83 ec 0c             	sub    $0xc,%esp
c0102485:	6a 07                	push   $0x7
c0102487:	68 00 02 00 00       	push   $0x200
c010248c:	50                   	push   %eax
c010248d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102490:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102493:	e8 0c f4 ff ff       	call   c01018a4 <rd_wt>
c0102498:	83 c4 20             	add    $0x20,%esp
c010249b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010249e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01024a1:	b8 00 02 00 00       	mov    $0x200,%eax
c01024a6:	99                   	cltd   
c01024a7:	f7 7d e8             	idivl  -0x18(%ebp)
c01024aa:	89 c3                	mov    %eax,%ebx
c01024ac:	89 c8                	mov    %ecx,%eax
c01024ae:	99                   	cltd   
c01024af:	f7 fb                	idiv   %ebx
c01024b1:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01024b4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01024ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01024bd:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c01024c1:	01 d0                	add    %edx,%eax
c01024c3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01024c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024c9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01024cc:	8b 0a                	mov    (%edx),%ecx
c01024ce:	89 08                	mov    %ecx,(%eax)
c01024d0:	8b 4a 04             	mov    0x4(%edx),%ecx
c01024d3:	89 48 04             	mov    %ecx,0x4(%eax)
c01024d6:	8b 4a 08             	mov    0x8(%edx),%ecx
c01024d9:	89 48 08             	mov    %ecx,0x8(%eax)
c01024dc:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01024df:	89 48 0c             	mov    %ecx,0xc(%eax)
c01024e2:	8b 4a 10             	mov    0x10(%edx),%ecx
c01024e5:	89 48 10             	mov    %ecx,0x10(%eax)
c01024e8:	8b 4a 14             	mov    0x14(%edx),%ecx
c01024eb:	89 48 14             	mov    %ecx,0x14(%eax)
c01024ee:	8b 4a 18             	mov    0x18(%edx),%ecx
c01024f1:	89 48 18             	mov    %ecx,0x18(%eax)
c01024f4:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01024f7:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01024fa:	8b 4a 20             	mov    0x20(%edx),%ecx
c01024fd:	89 48 20             	mov    %ecx,0x20(%eax)
c0102500:	8b 52 24             	mov    0x24(%edx),%edx
c0102503:	89 50 24             	mov    %edx,0x24(%eax)
c0102506:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102509:	8b 55 0c             	mov    0xc(%ebp),%edx
c010250c:	89 50 10             	mov    %edx,0x10(%eax)
c010250f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102512:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102515:	89 50 20             	mov    %edx,0x20(%eax)
c0102518:	8b 45 08             	mov    0x8(%ebp),%eax
c010251b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010251e:	8b 0a                	mov    (%edx),%ecx
c0102520:	89 08                	mov    %ecx,(%eax)
c0102522:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102525:	89 48 04             	mov    %ecx,0x4(%eax)
c0102528:	8b 4a 08             	mov    0x8(%edx),%ecx
c010252b:	89 48 08             	mov    %ecx,0x8(%eax)
c010252e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102531:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102534:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102537:	89 48 10             	mov    %ecx,0x10(%eax)
c010253a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010253d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102540:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102543:	89 48 18             	mov    %ecx,0x18(%eax)
c0102546:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102549:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010254c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010254f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102552:	8b 52 24             	mov    0x24(%edx),%edx
c0102555:	89 50 24             	mov    %edx,0x24(%eax)
c0102558:	8b 45 08             	mov    0x8(%ebp),%eax
c010255b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010255e:	5b                   	pop    %ebx
c010255f:	5e                   	pop    %esi
c0102560:	5d                   	pop    %ebp
c0102561:	c3                   	ret    

c0102562 <create_file>:
c0102562:	55                   	push   %ebp
c0102563:	89 e5                	mov    %esp,%ebp
c0102565:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010256b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010256e:	50                   	push   %eax
c010256f:	ff 75 0c             	pushl  0xc(%ebp)
c0102572:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102575:	50                   	push   %eax
c0102576:	e8 59 fd ff ff       	call   c01022d4 <strip_path>
c010257b:	83 c4 0c             	add    $0xc,%esp
c010257e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102581:	75 0a                	jne    c010258d <create_file+0x2b>
c0102583:	b8 00 00 00 00       	mov    $0x0,%eax
c0102588:	e9 de 00 00 00       	jmp    c010266b <create_file+0x109>
c010258d:	e8 db 00 00 00       	call   c010266d <alloc_imap_bit>
c0102592:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102595:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102599:	75 0a                	jne    c01025a5 <create_file+0x43>
c010259b:	b8 00 00 00 00       	mov    $0x0,%eax
c01025a0:	e9 c6 00 00 00       	jmp    c010266b <create_file+0x109>
c01025a5:	e8 d6 10 00 00       	call   c0103680 <get_super_block>
c01025aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01025ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025b0:	8b 40 10             	mov    0x10(%eax),%eax
c01025b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01025b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01025b9:	83 ec 08             	sub    $0x8,%esp
c01025bc:	50                   	push   %eax
c01025bd:	ff 75 f4             	pushl  -0xc(%ebp)
c01025c0:	e8 a5 01 00 00       	call   c010276a <alloc_smap_bit>
c01025c5:	83 c4 10             	add    $0x10,%esp
c01025c8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01025cb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01025cf:	75 0a                	jne    c01025db <create_file+0x79>
c01025d1:	b8 00 00 00 00       	mov    $0x0,%eax
c01025d6:	e9 90 00 00 00       	jmp    c010266b <create_file+0x109>
c01025db:	83 ec 04             	sub    $0x4,%esp
c01025de:	ff 75 e8             	pushl  -0x18(%ebp)
c01025e1:	ff 75 f4             	pushl  -0xc(%ebp)
c01025e4:	8d 45 84             	lea    -0x7c(%ebp),%eax
c01025e7:	50                   	push   %eax
c01025e8:	e8 1e 03 00 00       	call   c010290b <new_inode>
c01025ed:	83 c4 10             	add    $0x10,%esp
c01025f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01025f3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01025f7:	75 07                	jne    c0102600 <create_file+0x9e>
c01025f9:	b8 00 00 00 00       	mov    $0x0,%eax
c01025fe:	eb 6b                	jmp    c010266b <create_file+0x109>
c0102600:	ff 75 f4             	pushl  -0xc(%ebp)
c0102603:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102606:	50                   	push   %eax
c0102607:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010260a:	50                   	push   %eax
c010260b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102611:	50                   	push   %eax
c0102612:	e8 12 04 00 00       	call   c0102a29 <new_dir_entry>
c0102617:	83 c4 10             	add    $0x10,%esp
c010261a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010261d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102621:	75 07                	jne    c010262a <create_file+0xc8>
c0102623:	b8 00 00 00 00       	mov    $0x0,%eax
c0102628:	eb 41                	jmp    c010266b <create_file+0x109>
c010262a:	8b 45 08             	mov    0x8(%ebp),%eax
c010262d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102630:	89 10                	mov    %edx,(%eax)
c0102632:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102635:	89 50 04             	mov    %edx,0x4(%eax)
c0102638:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010263b:	89 50 08             	mov    %edx,0x8(%eax)
c010263e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102641:	89 50 0c             	mov    %edx,0xc(%eax)
c0102644:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102647:	89 50 10             	mov    %edx,0x10(%eax)
c010264a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010264d:	89 50 14             	mov    %edx,0x14(%eax)
c0102650:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102653:	89 50 18             	mov    %edx,0x18(%eax)
c0102656:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102659:	89 50 1c             	mov    %edx,0x1c(%eax)
c010265c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010265f:	89 50 20             	mov    %edx,0x20(%eax)
c0102662:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102665:	89 50 24             	mov    %edx,0x24(%eax)
c0102668:	8b 45 08             	mov    0x8(%ebp),%eax
c010266b:	c9                   	leave  
c010266c:	c3                   	ret    

c010266d <alloc_imap_bit>:
c010266d:	55                   	push   %ebp
c010266e:	89 e5                	mov    %esp,%ebp
c0102670:	53                   	push   %ebx
c0102671:	83 ec 24             	sub    $0x24,%esp
c0102674:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010267b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102682:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102687:	83 ec 0c             	sub    $0xc,%esp
c010268a:	6a 07                	push   $0x7
c010268c:	68 00 02 00 00       	push   $0x200
c0102691:	50                   	push   %eax
c0102692:	ff 75 e8             	pushl  -0x18(%ebp)
c0102695:	ff 75 ec             	pushl  -0x14(%ebp)
c0102698:	e8 07 f2 ff ff       	call   c01018a4 <rd_wt>
c010269d:	83 c4 20             	add    $0x20,%esp
c01026a0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01026a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01026ae:	e9 a5 00 00 00       	jmp    c0102758 <alloc_imap_bit+0xeb>
c01026b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01026ba:	e9 8b 00 00 00       	jmp    c010274a <alloc_imap_bit+0xdd>
c01026bf:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026c8:	01 d0                	add    %edx,%eax
c01026ca:	0f b6 00             	movzbl (%eax),%eax
c01026cd:	0f be d0             	movsbl %al,%edx
c01026d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026d3:	89 c1                	mov    %eax,%ecx
c01026d5:	d3 fa                	sar    %cl,%edx
c01026d7:	89 d0                	mov    %edx,%eax
c01026d9:	83 e0 01             	and    $0x1,%eax
c01026dc:	85 c0                	test   %eax,%eax
c01026de:	74 06                	je     c01026e6 <alloc_imap_bit+0x79>
c01026e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01026e4:	eb 64                	jmp    c010274a <alloc_imap_bit+0xdd>
c01026e6:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026ef:	01 d0                	add    %edx,%eax
c01026f1:	0f b6 18             	movzbl (%eax),%ebx
c01026f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026f7:	ba 01 00 00 00       	mov    $0x1,%edx
c01026fc:	89 c1                	mov    %eax,%ecx
c01026fe:	d3 e2                	shl    %cl,%edx
c0102700:	89 d0                	mov    %edx,%eax
c0102702:	89 c1                	mov    %eax,%ecx
c0102704:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010270a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010270d:	01 d0                	add    %edx,%eax
c010270f:	09 cb                	or     %ecx,%ebx
c0102711:	89 da                	mov    %ebx,%edx
c0102713:	88 10                	mov    %dl,(%eax)
c0102715:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102718:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010271f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102722:	01 d0                	add    %edx,%eax
c0102724:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102727:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010272c:	83 ec 0c             	sub    $0xc,%esp
c010272f:	6a 0a                	push   $0xa
c0102731:	68 00 02 00 00       	push   $0x200
c0102736:	50                   	push   %eax
c0102737:	ff 75 e8             	pushl  -0x18(%ebp)
c010273a:	ff 75 ec             	pushl  -0x14(%ebp)
c010273d:	e8 62 f1 ff ff       	call   c01018a4 <rd_wt>
c0102742:	83 c4 20             	add    $0x20,%esp
c0102745:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102748:	eb 1b                	jmp    c0102765 <alloc_imap_bit+0xf8>
c010274a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010274e:	0f 8e 6b ff ff ff    	jle    c01026bf <alloc_imap_bit+0x52>
c0102754:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102758:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010275f:	0f 8e 4e ff ff ff    	jle    c01026b3 <alloc_imap_bit+0x46>
c0102765:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102768:	c9                   	leave  
c0102769:	c3                   	ret    

c010276a <alloc_smap_bit>:
c010276a:	55                   	push   %ebp
c010276b:	89 e5                	mov    %esp,%ebp
c010276d:	53                   	push   %ebx
c010276e:	83 ec 34             	sub    $0x34,%esp
c0102771:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102775:	75 1c                	jne    c0102793 <alloc_smap_bit+0x29>
c0102777:	68 fd 02 00 00       	push   $0x2fd
c010277c:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102781:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102786:	68 08 b4 10 c0       	push   $0xc010b408
c010278b:	e8 a5 61 00 00       	call   c0108935 <assertion_failure>
c0102790:	83 c4 10             	add    $0x10,%esp
c0102793:	e8 e8 0e 00 00       	call   c0103680 <get_super_block>
c0102798:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010279b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010279e:	8b 40 08             	mov    0x8(%eax),%eax
c01027a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01027a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01027a7:	8b 40 04             	mov    0x4(%eax),%eax
c01027aa:	83 c0 02             	add    $0x2,%eax
c01027ad:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01027b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01027b7:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c01027be:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01027c5:	e9 20 01 00 00       	jmp    c01028ea <alloc_smap_bit+0x180>
c01027ca:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01027cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027d0:	01 d0                	add    %edx,%eax
c01027d2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01027d5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01027da:	83 ec 0c             	sub    $0xc,%esp
c01027dd:	6a 07                	push   $0x7
c01027df:	68 00 02 00 00       	push   $0x200
c01027e4:	50                   	push   %eax
c01027e5:	ff 75 d8             	pushl  -0x28(%ebp)
c01027e8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01027eb:	e8 b4 f0 ff ff       	call   c01018a4 <rd_wt>
c01027f0:	83 c4 20             	add    $0x20,%esp
c01027f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01027fa:	e9 b0 00 00 00       	jmp    c01028af <alloc_smap_bit+0x145>
c01027ff:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102806:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010280a:	0f 85 8c 00 00 00    	jne    c010289c <alloc_smap_bit+0x132>
c0102810:	eb 45                	jmp    c0102857 <alloc_smap_bit+0xed>
c0102812:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102818:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010281b:	01 d0                	add    %edx,%eax
c010281d:	0f b6 00             	movzbl (%eax),%eax
c0102820:	0f be d0             	movsbl %al,%edx
c0102823:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102826:	89 c1                	mov    %eax,%ecx
c0102828:	d3 fa                	sar    %cl,%edx
c010282a:	89 d0                	mov    %edx,%eax
c010282c:	83 e0 01             	and    $0x1,%eax
c010282f:	85 c0                	test   %eax,%eax
c0102831:	74 06                	je     c0102839 <alloc_smap_bit+0xcf>
c0102833:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102837:	eb 1e                	jmp    c0102857 <alloc_smap_bit+0xed>
c0102839:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010283c:	c1 e0 09             	shl    $0x9,%eax
c010283f:	89 c2                	mov    %eax,%edx
c0102841:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102844:	01 d0                	add    %edx,%eax
c0102846:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010284d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102850:	01 d0                	add    %edx,%eax
c0102852:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102855:	eb 06                	jmp    c010285d <alloc_smap_bit+0xf3>
c0102857:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010285b:	7e b5                	jle    c0102812 <alloc_smap_bit+0xa8>
c010285d:	eb 3d                	jmp    c010289c <alloc_smap_bit+0x132>
c010285f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102863:	74 45                	je     c01028aa <alloc_smap_bit+0x140>
c0102865:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010286b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010286e:	01 d0                	add    %edx,%eax
c0102870:	0f b6 18             	movzbl (%eax),%ebx
c0102873:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102876:	ba 01 00 00 00       	mov    $0x1,%edx
c010287b:	89 c1                	mov    %eax,%ecx
c010287d:	d3 e2                	shl    %cl,%edx
c010287f:	89 d0                	mov    %edx,%eax
c0102881:	89 c1                	mov    %eax,%ecx
c0102883:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102889:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010288c:	01 d0                	add    %edx,%eax
c010288e:	09 cb                	or     %ecx,%ebx
c0102890:	89 da                	mov    %ebx,%edx
c0102892:	88 10                	mov    %dl,(%eax)
c0102894:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102898:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010289c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01028a0:	74 09                	je     c01028ab <alloc_smap_bit+0x141>
c01028a2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c01028a6:	7e b7                	jle    c010285f <alloc_smap_bit+0xf5>
c01028a8:	eb 01                	jmp    c01028ab <alloc_smap_bit+0x141>
c01028aa:	90                   	nop
c01028ab:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01028af:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c01028b6:	0f 8e 43 ff ff ff    	jle    c01027ff <alloc_smap_bit+0x95>
c01028bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01028c0:	74 1e                	je     c01028e0 <alloc_smap_bit+0x176>
c01028c2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01028c7:	83 ec 0c             	sub    $0xc,%esp
c01028ca:	6a 0a                	push   $0xa
c01028cc:	68 00 02 00 00       	push   $0x200
c01028d1:	50                   	push   %eax
c01028d2:	ff 75 d8             	pushl  -0x28(%ebp)
c01028d5:	ff 75 d4             	pushl  -0x2c(%ebp)
c01028d8:	e8 c7 ef ff ff       	call   c01018a4 <rd_wt>
c01028dd:	83 c4 20             	add    $0x20,%esp
c01028e0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01028e4:	74 12                	je     c01028f8 <alloc_smap_bit+0x18e>
c01028e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01028ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028ed:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01028f0:	0f 8c d4 fe ff ff    	jl     c01027ca <alloc_smap_bit+0x60>
c01028f6:	eb 01                	jmp    c01028f9 <alloc_smap_bit+0x18f>
c01028f8:	90                   	nop
c01028f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028fc:	8d 50 ff             	lea    -0x1(%eax),%edx
c01028ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102902:	8b 00                	mov    (%eax),%eax
c0102904:	01 d0                	add    %edx,%eax
c0102906:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102909:	c9                   	leave  
c010290a:	c3                   	ret    

c010290b <new_inode>:
c010290b:	55                   	push   %ebp
c010290c:	89 e5                	mov    %esp,%ebp
c010290e:	83 ec 38             	sub    $0x38,%esp
c0102911:	83 ec 08             	sub    $0x8,%esp
c0102914:	ff 75 0c             	pushl  0xc(%ebp)
c0102917:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010291a:	50                   	push   %eax
c010291b:	e8 80 fa ff ff       	call   c01023a0 <get_inode>
c0102920:	83 c4 10             	add    $0x10,%esp
c0102923:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102926:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010292a:	75 0a                	jne    c0102936 <new_inode+0x2b>
c010292c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102931:	e9 f1 00 00 00       	jmp    c0102a27 <new_inode+0x11c>
c0102936:	8b 45 10             	mov    0x10(%ebp),%eax
c0102939:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010293c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102943:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010294a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102951:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102954:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102957:	83 ec 0c             	sub    $0xc,%esp
c010295a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010295d:	50                   	push   %eax
c010295e:	e8 39 0b 00 00       	call   c010349c <sync_inode>
c0102963:	83 c4 10             	add    $0x10,%esp
c0102966:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010296d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102974:	eb 1d                	jmp    c0102993 <new_inode+0x88>
c0102976:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102979:	89 d0                	mov    %edx,%eax
c010297b:	c1 e0 02             	shl    $0x2,%eax
c010297e:	01 d0                	add    %edx,%eax
c0102980:	c1 e0 03             	shl    $0x3,%eax
c0102983:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102988:	8b 00                	mov    (%eax),%eax
c010298a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010298d:	74 0c                	je     c010299b <new_inode+0x90>
c010298f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102993:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102997:	7e dd                	jle    c0102976 <new_inode+0x6b>
c0102999:	eb 01                	jmp    c010299c <new_inode+0x91>
c010299b:	90                   	nop
c010299c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010299f:	89 d0                	mov    %edx,%eax
c01029a1:	c1 e0 02             	shl    $0x2,%eax
c01029a4:	01 d0                	add    %edx,%eax
c01029a6:	c1 e0 03             	shl    $0x3,%eax
c01029a9:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c01029ae:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01029b1:	89 10                	mov    %edx,(%eax)
c01029b3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01029b6:	89 50 04             	mov    %edx,0x4(%eax)
c01029b9:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01029bc:	89 50 08             	mov    %edx,0x8(%eax)
c01029bf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01029c2:	89 50 0c             	mov    %edx,0xc(%eax)
c01029c5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01029c8:	89 50 10             	mov    %edx,0x10(%eax)
c01029cb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01029ce:	89 50 14             	mov    %edx,0x14(%eax)
c01029d1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01029d4:	89 50 18             	mov    %edx,0x18(%eax)
c01029d7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01029da:	89 50 1c             	mov    %edx,0x1c(%eax)
c01029dd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01029e0:	89 50 20             	mov    %edx,0x20(%eax)
c01029e3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01029e6:	89 50 24             	mov    %edx,0x24(%eax)
c01029e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01029ec:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01029ef:	89 10                	mov    %edx,(%eax)
c01029f1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01029f4:	89 50 04             	mov    %edx,0x4(%eax)
c01029f7:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01029fa:	89 50 08             	mov    %edx,0x8(%eax)
c01029fd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102a00:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a03:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102a06:	89 50 10             	mov    %edx,0x10(%eax)
c0102a09:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102a0c:	89 50 14             	mov    %edx,0x14(%eax)
c0102a0f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102a12:	89 50 18             	mov    %edx,0x18(%eax)
c0102a15:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102a18:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102a1b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102a1e:	89 50 20             	mov    %edx,0x20(%eax)
c0102a21:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102a24:	89 50 24             	mov    %edx,0x24(%eax)
c0102a27:	c9                   	leave  
c0102a28:	c3                   	ret    

c0102a29 <new_dir_entry>:
c0102a29:	55                   	push   %ebp
c0102a2a:	89 e5                	mov    %esp,%ebp
c0102a2c:	83 ec 48             	sub    $0x48,%esp
c0102a2f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102a36:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a39:	8b 40 04             	mov    0x4(%eax),%eax
c0102a3c:	99                   	cltd   
c0102a3d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a40:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102a43:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a46:	8b 40 0c             	mov    0xc(%eax),%eax
c0102a49:	99                   	cltd   
c0102a4a:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a4d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102a50:	e8 2b 0c 00 00       	call   c0103680 <get_super_block>
c0102a55:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102a58:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102a5b:	8b 00                	mov    (%eax),%eax
c0102a5d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102a60:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a63:	8b 40 0c             	mov    0xc(%eax),%eax
c0102a66:	05 00 02 00 00       	add    $0x200,%eax
c0102a6b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102a71:	85 c0                	test   %eax,%eax
c0102a73:	0f 48 c2             	cmovs  %edx,%eax
c0102a76:	c1 f8 09             	sar    $0x9,%eax
c0102a79:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102a7c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102a83:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102a8a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102a91:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102a98:	eb 7f                	jmp    c0102b19 <new_dir_entry+0xf0>
c0102a9a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a9f:	89 c1                	mov    %eax,%ecx
c0102aa1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102aa4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102aa7:	01 d0                	add    %edx,%eax
c0102aa9:	83 ec 0c             	sub    $0xc,%esp
c0102aac:	6a 07                	push   $0x7
c0102aae:	68 00 02 00 00       	push   $0x200
c0102ab3:	51                   	push   %ecx
c0102ab4:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102ab7:	50                   	push   %eax
c0102ab8:	e8 e7 ed ff ff       	call   c01018a4 <rd_wt>
c0102abd:	83 c4 20             	add    $0x20,%esp
c0102ac0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102ac5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102ac8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102acf:	eb 25                	jmp    c0102af6 <new_dir_entry+0xcd>
c0102ad1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102ad5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102ad8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102adb:	7f 29                	jg     c0102b06 <new_dir_entry+0xdd>
c0102add:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ae0:	8b 00                	mov    (%eax),%eax
c0102ae2:	85 c0                	test   %eax,%eax
c0102ae4:	75 08                	jne    c0102aee <new_dir_entry+0xc5>
c0102ae6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ae9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102aec:	eb 19                	jmp    c0102b07 <new_dir_entry+0xde>
c0102aee:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102af2:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102af6:	b8 00 02 00 00       	mov    $0x200,%eax
c0102afb:	99                   	cltd   
c0102afc:	f7 7d dc             	idivl  -0x24(%ebp)
c0102aff:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102b02:	7c cd                	jl     c0102ad1 <new_dir_entry+0xa8>
c0102b04:	eb 01                	jmp    c0102b07 <new_dir_entry+0xde>
c0102b06:	90                   	nop
c0102b07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b0a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102b0d:	7f 16                	jg     c0102b25 <new_dir_entry+0xfc>
c0102b0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102b13:	75 10                	jne    c0102b25 <new_dir_entry+0xfc>
c0102b15:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102b19:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b1c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102b1f:	0f 8c 75 ff ff ff    	jl     c0102a9a <new_dir_entry+0x71>
c0102b25:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102b28:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102b2b:	75 0a                	jne    c0102b37 <new_dir_entry+0x10e>
c0102b2d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102b32:	e9 fc 00 00 00       	jmp    c0102c33 <new_dir_entry+0x20a>
c0102b37:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102b3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102b42:	75 1e                	jne    c0102b62 <new_dir_entry+0x139>
c0102b44:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b47:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102b4a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b4d:	8b 50 04             	mov    0x4(%eax),%edx
c0102b50:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102b53:	01 c2                	add    %eax,%edx
c0102b55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b58:	89 50 04             	mov    %edx,0x4(%eax)
c0102b5b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102b62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b65:	8b 55 14             	mov    0x14(%ebp),%edx
c0102b68:	89 10                	mov    %edx,(%eax)
c0102b6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b6d:	83 c0 04             	add    $0x4,%eax
c0102b70:	83 ec 08             	sub    $0x8,%esp
c0102b73:	ff 75 10             	pushl  0x10(%ebp)
c0102b76:	50                   	push   %eax
c0102b77:	e8 72 96 00 00       	call   c010c1ee <Strcpy>
c0102b7c:	83 c4 10             	add    $0x10,%esp
c0102b7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b82:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102b85:	8b 0a                	mov    (%edx),%ecx
c0102b87:	89 08                	mov    %ecx,(%eax)
c0102b89:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102b8c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102b8f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102b92:	89 48 08             	mov    %ecx,0x8(%eax)
c0102b95:	8b 52 0c             	mov    0xc(%edx),%edx
c0102b98:	89 50 0c             	mov    %edx,0xc(%eax)
c0102b9b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ba0:	89 c1                	mov    %eax,%ecx
c0102ba2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102ba5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102ba8:	01 d0                	add    %edx,%eax
c0102baa:	83 ec 0c             	sub    $0xc,%esp
c0102bad:	6a 0a                	push   $0xa
c0102baf:	68 00 02 00 00       	push   $0x200
c0102bb4:	51                   	push   %ecx
c0102bb5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102bb8:	50                   	push   %eax
c0102bb9:	e8 e6 ec ff ff       	call   c01018a4 <rd_wt>
c0102bbe:	83 c4 20             	add    $0x20,%esp
c0102bc1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102bc5:	74 69                	je     c0102c30 <new_dir_entry+0x207>
c0102bc7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bca:	8b 10                	mov    (%eax),%edx
c0102bcc:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102bd2:	8b 50 04             	mov    0x4(%eax),%edx
c0102bd5:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102bdb:	8b 50 08             	mov    0x8(%eax),%edx
c0102bde:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102be4:	8b 50 0c             	mov    0xc(%eax),%edx
c0102be7:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102bed:	8b 50 10             	mov    0x10(%eax),%edx
c0102bf0:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102bf6:	8b 50 14             	mov    0x14(%eax),%edx
c0102bf9:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102bff:	8b 50 18             	mov    0x18(%eax),%edx
c0102c02:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102c08:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102c0b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102c11:	8b 50 20             	mov    0x20(%eax),%edx
c0102c14:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102c1a:	8b 40 24             	mov    0x24(%eax),%eax
c0102c1d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102c22:	83 ec 0c             	sub    $0xc,%esp
c0102c25:	ff 75 0c             	pushl  0xc(%ebp)
c0102c28:	e8 6f 08 00 00       	call   c010349c <sync_inode>
c0102c2d:	83 c4 10             	add    $0x10,%esp
c0102c30:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c33:	c9                   	leave  
c0102c34:	c3                   	ret    

c0102c35 <do_unlink>:
c0102c35:	55                   	push   %ebp
c0102c36:	89 e5                	mov    %esp,%ebp
c0102c38:	53                   	push   %ebx
c0102c39:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102c3f:	83 ec 08             	sub    $0x8,%esp
c0102c42:	ff 75 08             	pushl  0x8(%ebp)
c0102c45:	68 1d b4 10 c0       	push   $0xc010b41d
c0102c4a:	e8 bd 6c 00 00       	call   c010990c <strcmp>
c0102c4f:	83 c4 10             	add    $0x10,%esp
c0102c52:	85 c0                	test   %eax,%eax
c0102c54:	75 10                	jne    c0102c66 <do_unlink+0x31>
c0102c56:	83 ec 0c             	sub    $0xc,%esp
c0102c59:	68 1f b4 10 c0       	push   $0xc010b41f
c0102c5e:	e8 b4 5c 00 00       	call   c0108917 <panic>
c0102c63:	83 c4 10             	add    $0x10,%esp
c0102c66:	83 ec 0c             	sub    $0xc,%esp
c0102c69:	ff 75 08             	pushl  0x8(%ebp)
c0102c6c:	e8 31 f5 ff ff       	call   c01021a2 <search_file>
c0102c71:	83 c4 10             	add    $0x10,%esp
c0102c74:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102c77:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102c7b:	75 10                	jne    c0102c8d <do_unlink+0x58>
c0102c7d:	83 ec 0c             	sub    $0xc,%esp
c0102c80:	68 3b b4 10 c0       	push   $0xc010b43b
c0102c85:	e8 8d 5c 00 00       	call   c0108917 <panic>
c0102c8a:	83 c4 10             	add    $0x10,%esp
c0102c8d:	83 ec 08             	sub    $0x8,%esp
c0102c90:	ff 75 d0             	pushl  -0x30(%ebp)
c0102c93:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102c99:	50                   	push   %eax
c0102c9a:	e8 01 f7 ff ff       	call   c01023a0 <get_inode>
c0102c9f:	83 c4 10             	add    $0x10,%esp
c0102ca2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102ca5:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102ca9:	75 10                	jne    c0102cbb <do_unlink+0x86>
c0102cab:	83 ec 0c             	sub    $0xc,%esp
c0102cae:	68 3b b4 10 c0       	push   $0xc010b43b
c0102cb3:	e8 5f 5c 00 00       	call   c0108917 <panic>
c0102cb8:	83 c4 10             	add    $0x10,%esp
c0102cbb:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102cbe:	85 c0                	test   %eax,%eax
c0102cc0:	7e 10                	jle    c0102cd2 <do_unlink+0x9d>
c0102cc2:	83 ec 0c             	sub    $0xc,%esp
c0102cc5:	68 54 b4 10 c0       	push   $0xc010b454
c0102cca:	e8 48 5c 00 00       	call   c0108917 <panic>
c0102ccf:	83 c4 10             	add    $0x10,%esp
c0102cd2:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102cd8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102cdb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102cde:	8d 50 07             	lea    0x7(%eax),%edx
c0102ce1:	85 c0                	test   %eax,%eax
c0102ce3:	0f 48 c2             	cmovs  %edx,%eax
c0102ce6:	c1 f8 03             	sar    $0x3,%eax
c0102ce9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102cec:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102cef:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102cf5:	85 c0                	test   %eax,%eax
c0102cf7:	0f 48 c2             	cmovs  %edx,%eax
c0102cfa:	c1 f8 09             	sar    $0x9,%eax
c0102cfd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102d00:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102d03:	99                   	cltd   
c0102d04:	c1 ea 1d             	shr    $0x1d,%edx
c0102d07:	01 d0                	add    %edx,%eax
c0102d09:	83 e0 07             	and    $0x7,%eax
c0102d0c:	29 d0                	sub    %edx,%eax
c0102d0e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102d11:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102d18:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d1d:	89 c2                	mov    %eax,%edx
c0102d1f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102d22:	83 c0 02             	add    $0x2,%eax
c0102d25:	83 ec 0c             	sub    $0xc,%esp
c0102d28:	6a 07                	push   $0x7
c0102d2a:	68 00 02 00 00       	push   $0x200
c0102d2f:	52                   	push   %edx
c0102d30:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d33:	50                   	push   %eax
c0102d34:	e8 6b eb ff ff       	call   c01018a4 <rd_wt>
c0102d39:	83 c4 20             	add    $0x20,%esp
c0102d3c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d42:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d45:	01 d0                	add    %edx,%eax
c0102d47:	0f b6 10             	movzbl (%eax),%edx
c0102d4a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102d4d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102d52:	89 c1                	mov    %eax,%ecx
c0102d54:	d3 e3                	shl    %cl,%ebx
c0102d56:	89 d8                	mov    %ebx,%eax
c0102d58:	f7 d0                	not    %eax
c0102d5a:	89 c3                	mov    %eax,%ebx
c0102d5c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102d62:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d65:	01 c8                	add    %ecx,%eax
c0102d67:	21 da                	and    %ebx,%edx
c0102d69:	88 10                	mov    %dl,(%eax)
c0102d6b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d70:	89 c2                	mov    %eax,%edx
c0102d72:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102d75:	83 c0 02             	add    $0x2,%eax
c0102d78:	83 ec 0c             	sub    $0xc,%esp
c0102d7b:	6a 0a                	push   $0xa
c0102d7d:	68 00 02 00 00       	push   $0x200
c0102d82:	52                   	push   %edx
c0102d83:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d86:	50                   	push   %eax
c0102d87:	e8 18 eb ff ff       	call   c01018a4 <rd_wt>
c0102d8c:	83 c4 20             	add    $0x20,%esp
c0102d8f:	e8 ec 08 00 00       	call   c0103680 <get_super_block>
c0102d94:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102d97:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102d9d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102da0:	8b 00                	mov    (%eax),%eax
c0102da2:	29 c2                	sub    %eax,%edx
c0102da4:	89 d0                	mov    %edx,%eax
c0102da6:	83 c0 01             	add    $0x1,%eax
c0102da9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102dac:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102daf:	8d 50 07             	lea    0x7(%eax),%edx
c0102db2:	85 c0                	test   %eax,%eax
c0102db4:	0f 48 c2             	cmovs  %edx,%eax
c0102db7:	c1 f8 03             	sar    $0x3,%eax
c0102dba:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102dbd:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102dc0:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102dc6:	85 c0                	test   %eax,%eax
c0102dc8:	0f 48 c2             	cmovs  %edx,%eax
c0102dcb:	c1 f8 09             	sar    $0x9,%eax
c0102dce:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102dd1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102dd4:	99                   	cltd   
c0102dd5:	c1 ea 1d             	shr    $0x1d,%edx
c0102dd8:	01 d0                	add    %edx,%eax
c0102dda:	83 e0 07             	and    $0x7,%eax
c0102ddd:	29 d0                	sub    %edx,%eax
c0102ddf:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102de2:	b8 08 00 00 00       	mov    $0x8,%eax
c0102de7:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102dea:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102ded:	29 c2                	sub    %eax,%edx
c0102def:	89 d0                	mov    %edx,%eax
c0102df1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102df4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102df7:	8d 50 07             	lea    0x7(%eax),%edx
c0102dfa:	85 c0                	test   %eax,%eax
c0102dfc:	0f 48 c2             	cmovs  %edx,%eax
c0102dff:	c1 f8 03             	sar    $0x3,%eax
c0102e02:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102e05:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e0a:	89 c1                	mov    %eax,%ecx
c0102e0c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102e0f:	8b 40 04             	mov    0x4(%eax),%eax
c0102e12:	8d 50 02             	lea    0x2(%eax),%edx
c0102e15:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102e18:	01 d0                	add    %edx,%eax
c0102e1a:	83 ec 0c             	sub    $0xc,%esp
c0102e1d:	6a 07                	push   $0x7
c0102e1f:	68 00 02 00 00       	push   $0x200
c0102e24:	51                   	push   %ecx
c0102e25:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e28:	50                   	push   %eax
c0102e29:	e8 76 ea ff ff       	call   c01018a4 <rd_wt>
c0102e2e:	83 c4 20             	add    $0x20,%esp
c0102e31:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102e37:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e3a:	01 d0                	add    %edx,%eax
c0102e3c:	0f b6 10             	movzbl (%eax),%edx
c0102e3f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102e42:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102e47:	89 c1                	mov    %eax,%ecx
c0102e49:	d3 e3                	shl    %cl,%ebx
c0102e4b:	89 d8                	mov    %ebx,%eax
c0102e4d:	f7 d0                	not    %eax
c0102e4f:	89 c3                	mov    %eax,%ebx
c0102e51:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102e57:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e5a:	01 c8                	add    %ecx,%eax
c0102e5c:	21 da                	and    %ebx,%edx
c0102e5e:	88 10                	mov    %dl,(%eax)
c0102e60:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102e67:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102e6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102e6d:	eb 6b                	jmp    c0102eda <do_unlink+0x2a5>
c0102e6f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102e76:	75 4c                	jne    c0102ec4 <do_unlink+0x28f>
c0102e78:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102e7f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e84:	83 ec 0c             	sub    $0xc,%esp
c0102e87:	6a 0a                	push   $0xa
c0102e89:	68 00 02 00 00       	push   $0x200
c0102e8e:	50                   	push   %eax
c0102e8f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e92:	ff 75 ec             	pushl  -0x14(%ebp)
c0102e95:	e8 0a ea ff ff       	call   c01018a4 <rd_wt>
c0102e9a:	83 c4 20             	add    $0x20,%esp
c0102e9d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ea2:	89 c1                	mov    %eax,%ecx
c0102ea4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102ea7:	8d 50 01             	lea    0x1(%eax),%edx
c0102eaa:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102ead:	83 ec 0c             	sub    $0xc,%esp
c0102eb0:	6a 07                	push   $0x7
c0102eb2:	68 00 02 00 00       	push   $0x200
c0102eb7:	51                   	push   %ecx
c0102eb8:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ebb:	50                   	push   %eax
c0102ebc:	e8 e3 e9 ff ff       	call   c01018a4 <rd_wt>
c0102ec1:	83 c4 20             	add    $0x20,%esp
c0102ec4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102eca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ecd:	01 d0                	add    %edx,%eax
c0102ecf:	c6 00 00             	movb   $0x0,(%eax)
c0102ed2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102ed6:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102eda:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102edd:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102ee0:	7c 8d                	jl     c0102e6f <do_unlink+0x23a>
c0102ee2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102ee9:	75 4c                	jne    c0102f37 <do_unlink+0x302>
c0102eeb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102ef2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ef7:	83 ec 0c             	sub    $0xc,%esp
c0102efa:	6a 0a                	push   $0xa
c0102efc:	68 00 02 00 00       	push   $0x200
c0102f01:	50                   	push   %eax
c0102f02:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f05:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f08:	e8 97 e9 ff ff       	call   c01018a4 <rd_wt>
c0102f0d:	83 c4 20             	add    $0x20,%esp
c0102f10:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f15:	89 c1                	mov    %eax,%ecx
c0102f17:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102f1a:	8d 50 01             	lea    0x1(%eax),%edx
c0102f1d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102f20:	83 ec 0c             	sub    $0xc,%esp
c0102f23:	6a 07                	push   $0x7
c0102f25:	68 00 02 00 00       	push   $0x200
c0102f2a:	51                   	push   %ecx
c0102f2b:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f2e:	50                   	push   %eax
c0102f2f:	e8 70 e9 ff ff       	call   c01018a4 <rd_wt>
c0102f34:	83 c4 20             	add    $0x20,%esp
c0102f37:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102f3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f40:	01 d0                	add    %edx,%eax
c0102f42:	0f b6 10             	movzbl (%eax),%edx
c0102f45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102f48:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102f4d:	89 c1                	mov    %eax,%ecx
c0102f4f:	d3 e3                	shl    %cl,%ebx
c0102f51:	89 d8                	mov    %ebx,%eax
c0102f53:	89 c3                	mov    %eax,%ebx
c0102f55:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102f5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f5e:	01 c8                	add    %ecx,%eax
c0102f60:	21 da                	and    %ebx,%edx
c0102f62:	88 10                	mov    %dl,(%eax)
c0102f64:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f69:	83 ec 0c             	sub    $0xc,%esp
c0102f6c:	6a 0a                	push   $0xa
c0102f6e:	68 00 02 00 00       	push   $0x200
c0102f73:	50                   	push   %eax
c0102f74:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f77:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f7a:	e8 25 e9 ff ff       	call   c01018a4 <rd_wt>
c0102f7f:	83 c4 20             	add    $0x20,%esp
c0102f82:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102f89:	00 00 00 
c0102f8c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102f93:	00 00 00 
c0102f96:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102f9d:	00 00 00 
c0102fa0:	83 ec 0c             	sub    $0xc,%esp
c0102fa3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102fa9:	50                   	push   %eax
c0102faa:	e8 ed 04 00 00       	call   c010349c <sync_inode>
c0102faf:	83 c4 10             	add    $0x10,%esp
c0102fb2:	83 ec 0c             	sub    $0xc,%esp
c0102fb5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102fbb:	50                   	push   %eax
c0102fbc:	e8 2f 06 00 00       	call   c01035f0 <put_inode>
c0102fc1:	83 c4 10             	add    $0x10,%esp
c0102fc4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102fc7:	8b 00                	mov    (%eax),%eax
c0102fc9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102fcc:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102fd3:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102fd6:	8b 40 04             	mov    0x4(%eax),%eax
c0102fd9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102fdc:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102fdf:	8b 40 0c             	mov    0xc(%eax),%eax
c0102fe2:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102fe5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102fe8:	c1 e8 04             	shr    $0x4,%eax
c0102feb:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102fee:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102ff5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102ffc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0103003:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010300a:	e9 a5 00 00 00       	jmp    c01030b4 <do_unlink+0x47f>
c010300f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103014:	89 c1                	mov    %eax,%ecx
c0103016:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0103019:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010301c:	01 d0                	add    %edx,%eax
c010301e:	83 ec 0c             	sub    $0xc,%esp
c0103021:	6a 07                	push   $0x7
c0103023:	68 00 02 00 00       	push   $0x200
c0103028:	51                   	push   %ecx
c0103029:	ff 75 b8             	pushl  -0x48(%ebp)
c010302c:	50                   	push   %eax
c010302d:	e8 72 e8 ff ff       	call   c01018a4 <rd_wt>
c0103032:	83 c4 20             	add    $0x20,%esp
c0103035:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010303a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010303d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0103044:	eb 51                	jmp    c0103097 <do_unlink+0x462>
c0103046:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010304a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010304d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103050:	7f 4f                	jg     c01030a1 <do_unlink+0x46c>
c0103052:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103055:	83 c0 10             	add    $0x10,%eax
c0103058:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010305b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010305e:	83 c0 04             	add    $0x4,%eax
c0103061:	83 ec 08             	sub    $0x8,%esp
c0103064:	ff 75 08             	pushl  0x8(%ebp)
c0103067:	50                   	push   %eax
c0103068:	e8 9f 68 00 00       	call   c010990c <strcmp>
c010306d:	83 c4 10             	add    $0x10,%esp
c0103070:	85 c0                	test   %eax,%eax
c0103072:	75 1b                	jne    c010308f <do_unlink+0x45a>
c0103074:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c010307b:	83 ec 04             	sub    $0x4,%esp
c010307e:	6a 10                	push   $0x10
c0103080:	6a 00                	push   $0x0
c0103082:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103085:	e8 45 91 00 00       	call   c010c1cf <Memset>
c010308a:	83 c4 10             	add    $0x10,%esp
c010308d:	eb 13                	jmp    c01030a2 <do_unlink+0x46d>
c010308f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0103093:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0103097:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010309a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010309d:	7c a7                	jl     c0103046 <do_unlink+0x411>
c010309f:	eb 01                	jmp    c01030a2 <do_unlink+0x46d>
c01030a1:	90                   	nop
c01030a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01030a5:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01030a8:	7f 16                	jg     c01030c0 <do_unlink+0x48b>
c01030aa:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01030ae:	75 10                	jne    c01030c0 <do_unlink+0x48b>
c01030b0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c01030b4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01030b7:	3b 45 90             	cmp    -0x70(%ebp),%eax
c01030ba:	0f 8c 4f ff ff ff    	jl     c010300f <do_unlink+0x3da>
c01030c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01030c3:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01030c6:	75 17                	jne    c01030df <do_unlink+0x4aa>
c01030c8:	8b 45 98             	mov    -0x68(%ebp),%eax
c01030cb:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01030ce:	89 50 04             	mov    %edx,0x4(%eax)
c01030d1:	83 ec 0c             	sub    $0xc,%esp
c01030d4:	ff 75 98             	pushl  -0x68(%ebp)
c01030d7:	e8 c0 03 00 00       	call   c010349c <sync_inode>
c01030dc:	83 c4 10             	add    $0x10,%esp
c01030df:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01030e3:	74 26                	je     c010310b <do_unlink+0x4d6>
c01030e5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030ea:	89 c1                	mov    %eax,%ecx
c01030ec:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01030ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030f2:	01 d0                	add    %edx,%eax
c01030f4:	83 ec 0c             	sub    $0xc,%esp
c01030f7:	6a 0a                	push   $0xa
c01030f9:	68 00 02 00 00       	push   $0x200
c01030fe:	51                   	push   %ecx
c01030ff:	ff 75 b8             	pushl  -0x48(%ebp)
c0103102:	50                   	push   %eax
c0103103:	e8 9c e7 ff ff       	call   c01018a4 <rd_wt>
c0103108:	83 c4 20             	add    $0x20,%esp
c010310b:	90                   	nop
c010310c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010310f:	c9                   	leave  
c0103110:	c3                   	ret    

c0103111 <do_rdwt>:
c0103111:	55                   	push   %ebp
c0103112:	89 e5                	mov    %esp,%ebp
c0103114:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010311a:	8b 45 08             	mov    0x8(%ebp),%eax
c010311d:	8b 40 78             	mov    0x78(%eax),%eax
c0103120:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103123:	8b 45 08             	mov    0x8(%ebp),%eax
c0103126:	8b 40 60             	mov    0x60(%eax),%eax
c0103129:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010312c:	8b 45 08             	mov    0x8(%ebp),%eax
c010312f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103132:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103135:	8b 45 08             	mov    0x8(%ebp),%eax
c0103138:	8b 00                	mov    (%eax),%eax
c010313a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010313d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103140:	8b 40 10             	mov    0x10(%eax),%eax
c0103143:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103146:	8b 45 08             	mov    0x8(%ebp),%eax
c0103149:	8b 40 50             	mov    0x50(%eax),%eax
c010314c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010314f:	83 ec 0c             	sub    $0xc,%esp
c0103152:	ff 75 d0             	pushl  -0x30(%ebp)
c0103155:	e8 0c 07 00 00       	call   c0103866 <pid2proc>
c010315a:	83 c4 10             	add    $0x10,%esp
c010315d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103160:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103163:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0103166:	83 c2 4c             	add    $0x4c,%edx
c0103169:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010316d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103170:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103173:	8b 40 08             	mov    0x8(%eax),%eax
c0103176:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103179:	8b 45 08             	mov    0x8(%ebp),%eax
c010317c:	8b 00                	mov    (%eax),%eax
c010317e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103181:	83 ec 08             	sub    $0x8,%esp
c0103184:	ff 75 bc             	pushl  -0x44(%ebp)
c0103187:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010318d:	50                   	push   %eax
c010318e:	e8 0d f2 ff ff       	call   c01023a0 <get_inode>
c0103193:	83 c4 10             	add    $0x10,%esp
c0103196:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103199:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010319d:	75 10                	jne    c01031af <do_rdwt+0x9e>
c010319f:	83 ec 0c             	sub    $0xc,%esp
c01031a2:	68 8c b4 10 c0       	push   $0xc010b48c
c01031a7:	e8 6b 57 00 00       	call   c0108917 <panic>
c01031ac:	83 c4 10             	add    $0x10,%esp
c01031af:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01031b5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01031b8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01031bb:	8b 40 04             	mov    0x4(%eax),%eax
c01031be:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01031c1:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01031c5:	74 22                	je     c01031e9 <do_rdwt+0xd8>
c01031c7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01031cb:	74 1c                	je     c01031e9 <do_rdwt+0xd8>
c01031cd:	68 a8 04 00 00       	push   $0x4a8
c01031d2:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01031d7:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01031dc:	68 9c b4 10 c0       	push   $0xc010b49c
c01031e1:	e8 4f 57 00 00       	call   c0108935 <assertion_failure>
c01031e6:	83 c4 10             	add    $0x10,%esp
c01031e9:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c01031ef:	83 f8 01             	cmp    $0x1,%eax
c01031f2:	0f 85 86 00 00 00    	jne    c010327e <do_rdwt+0x16d>
c01031f8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01031fc:	75 09                	jne    c0103207 <do_rdwt+0xf6>
c01031fe:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103205:	eb 0d                	jmp    c0103214 <do_rdwt+0x103>
c0103207:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010320b:	75 07                	jne    c0103214 <do_rdwt+0x103>
c010320d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103214:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103217:	8b 45 08             	mov    0x8(%ebp),%eax
c010321a:	89 50 78             	mov    %edx,0x78(%eax)
c010321d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103220:	8b 45 08             	mov    0x8(%ebp),%eax
c0103223:	89 50 68             	mov    %edx,0x68(%eax)
c0103226:	83 ec 04             	sub    $0x4,%esp
c0103229:	6a 04                	push   $0x4
c010322b:	ff 75 08             	pushl  0x8(%ebp)
c010322e:	6a 03                	push   $0x3
c0103230:	e8 70 63 00 00       	call   c01095a5 <send_rec>
c0103235:	83 c4 10             	add    $0x10,%esp
c0103238:	8b 45 08             	mov    0x8(%ebp),%eax
c010323b:	8b 40 78             	mov    0x78(%eax),%eax
c010323e:	83 f8 66             	cmp    $0x66,%eax
c0103241:	75 13                	jne    c0103256 <do_rdwt+0x145>
c0103243:	83 ec 04             	sub    $0x4,%esp
c0103246:	ff 75 b8             	pushl  -0x48(%ebp)
c0103249:	ff 75 08             	pushl  0x8(%ebp)
c010324c:	6a 01                	push   $0x1
c010324e:	e8 52 63 00 00       	call   c01095a5 <send_rec>
c0103253:	83 c4 10             	add    $0x10,%esp
c0103256:	8b 45 08             	mov    0x8(%ebp),%eax
c0103259:	8b 40 78             	mov    0x78(%eax),%eax
c010325c:	83 f8 65             	cmp    $0x65,%eax
c010325f:	75 13                	jne    c0103274 <do_rdwt+0x163>
c0103261:	83 ec 04             	sub    $0x4,%esp
c0103264:	ff 75 b8             	pushl  -0x48(%ebp)
c0103267:	ff 75 08             	pushl  0x8(%ebp)
c010326a:	6a 01                	push   $0x1
c010326c:	e8 34 63 00 00       	call   c01095a5 <send_rec>
c0103271:	83 c4 10             	add    $0x10,%esp
c0103274:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103279:	e9 1c 02 00 00       	jmp    c010349a <do_rdwt+0x389>
c010327e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103282:	75 18                	jne    c010329c <do_rdwt+0x18b>
c0103284:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010328a:	c1 e0 09             	shl    $0x9,%eax
c010328d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103290:	75 0a                	jne    c010329c <do_rdwt+0x18b>
c0103292:	b8 00 00 00 00       	mov    $0x0,%eax
c0103297:	e9 fe 01 00 00       	jmp    c010349a <do_rdwt+0x389>
c010329c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01032a0:	75 14                	jne    c01032b6 <do_rdwt+0x1a5>
c01032a2:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01032a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032a8:	01 d0                	add    %edx,%eax
c01032aa:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01032ad:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c01032b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01032b4:	eb 19                	jmp    c01032cf <do_rdwt+0x1be>
c01032b6:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01032b9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032bc:	01 c2                	add    %eax,%edx
c01032be:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01032c4:	c1 e0 09             	shl    $0x9,%eax
c01032c7:	39 c2                	cmp    %eax,%edx
c01032c9:	0f 4e c2             	cmovle %edx,%eax
c01032cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01032cf:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01032d2:	99                   	cltd   
c01032d3:	c1 ea 17             	shr    $0x17,%edx
c01032d6:	01 d0                	add    %edx,%eax
c01032d8:	25 ff 01 00 00       	and    $0x1ff,%eax
c01032dd:	29 d0                	sub    %edx,%eax
c01032df:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01032e2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01032e8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01032eb:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01032f1:	85 c0                	test   %eax,%eax
c01032f3:	0f 48 c1             	cmovs  %ecx,%eax
c01032f6:	c1 f8 09             	sar    $0x9,%eax
c01032f9:	01 d0                	add    %edx,%eax
c01032fb:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01032fe:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103304:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103307:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010330d:	85 c0                	test   %eax,%eax
c010330f:	0f 48 c1             	cmovs  %ecx,%eax
c0103312:	c1 f8 09             	sar    $0x9,%eax
c0103315:	01 d0                	add    %edx,%eax
c0103317:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010331a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010331d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103320:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103325:	39 d0                	cmp    %edx,%eax
c0103327:	7d 0b                	jge    c0103334 <do_rdwt+0x223>
c0103329:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010332c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010332f:	83 c0 01             	add    $0x1,%eax
c0103332:	eb 05                	jmp    c0103339 <do_rdwt+0x228>
c0103334:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103339:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010333c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010333f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103342:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103349:	8b 45 08             	mov    0x8(%ebp),%eax
c010334c:	8b 00                	mov    (%eax),%eax
c010334e:	83 ec 0c             	sub    $0xc,%esp
c0103351:	50                   	push   %eax
c0103352:	e8 0f 05 00 00       	call   c0103866 <pid2proc>
c0103357:	83 c4 10             	add    $0x10,%esp
c010335a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010335d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103360:	83 ec 08             	sub    $0x8,%esp
c0103363:	50                   	push   %eax
c0103364:	ff 75 cc             	pushl  -0x34(%ebp)
c0103367:	e8 43 2b 00 00       	call   c0105eaf <alloc_virtual_memory>
c010336c:	83 c4 10             	add    $0x10,%esp
c010336f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103372:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103375:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103378:	e9 c5 00 00 00       	jmp    c0103442 <do_rdwt+0x331>
c010337d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103380:	c1 e0 09             	shl    $0x9,%eax
c0103383:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103386:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103389:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010338d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103390:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103397:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010339b:	75 46                	jne    c01033e3 <do_rdwt+0x2d2>
c010339d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01033a0:	c1 e0 09             	shl    $0x9,%eax
c01033a3:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01033a9:	83 ec 0c             	sub    $0xc,%esp
c01033ac:	6a 07                	push   $0x7
c01033ae:	50                   	push   %eax
c01033af:	52                   	push   %edx
c01033b0:	ff 75 90             	pushl  -0x70(%ebp)
c01033b3:	ff 75 e0             	pushl  -0x20(%ebp)
c01033b6:	e8 e9 e4 ff ff       	call   c01018a4 <rd_wt>
c01033bb:	83 c4 20             	add    $0x20,%esp
c01033be:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01033c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033c7:	01 d0                	add    %edx,%eax
c01033c9:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01033cc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01033cf:	01 ca                	add    %ecx,%edx
c01033d1:	83 ec 04             	sub    $0x4,%esp
c01033d4:	ff 75 94             	pushl  -0x6c(%ebp)
c01033d7:	50                   	push   %eax
c01033d8:	52                   	push   %edx
c01033d9:	e8 3e 39 00 00       	call   c0106d1c <Memcpy>
c01033de:	83 c4 10             	add    $0x10,%esp
c01033e1:	eb 46                	jmp    c0103429 <do_rdwt+0x318>
c01033e3:	8b 55 98             	mov    -0x68(%ebp),%edx
c01033e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01033e9:	01 d0                	add    %edx,%eax
c01033eb:	89 c1                	mov    %eax,%ecx
c01033ed:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01033f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033f6:	01 d0                	add    %edx,%eax
c01033f8:	83 ec 04             	sub    $0x4,%esp
c01033fb:	ff 75 94             	pushl  -0x6c(%ebp)
c01033fe:	51                   	push   %ecx
c01033ff:	50                   	push   %eax
c0103400:	e8 17 39 00 00       	call   c0106d1c <Memcpy>
c0103405:	83 c4 10             	add    $0x10,%esp
c0103408:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010340b:	c1 e0 09             	shl    $0x9,%eax
c010340e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103414:	83 ec 0c             	sub    $0xc,%esp
c0103417:	6a 0a                	push   $0xa
c0103419:	50                   	push   %eax
c010341a:	52                   	push   %edx
c010341b:	ff 75 90             	pushl  -0x70(%ebp)
c010341e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103421:	e8 7e e4 ff ff       	call   c01018a4 <rd_wt>
c0103426:	83 c4 20             	add    $0x20,%esp
c0103429:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010342c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010342f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103432:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103435:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010343c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010343f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103442:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103445:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103448:	7f 0a                	jg     c0103454 <do_rdwt+0x343>
c010344a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010344e:	0f 85 29 ff ff ff    	jne    c010337d <do_rdwt+0x26c>
c0103454:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103457:	8b 50 04             	mov    0x4(%eax),%edx
c010345a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010345d:	01 c2                	add    %eax,%edx
c010345f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103462:	89 50 04             	mov    %edx,0x4(%eax)
c0103465:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103468:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010346b:	01 c2                	add    %eax,%edx
c010346d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103473:	39 c2                	cmp    %eax,%edx
c0103475:	7e 20                	jle    c0103497 <do_rdwt+0x386>
c0103477:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010347a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010347d:	01 d0                	add    %edx,%eax
c010347f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103485:	83 ec 0c             	sub    $0xc,%esp
c0103488:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010348e:	50                   	push   %eax
c010348f:	e8 08 00 00 00       	call   c010349c <sync_inode>
c0103494:	83 c4 10             	add    $0x10,%esp
c0103497:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010349a:	c9                   	leave  
c010349b:	c3                   	ret    

c010349c <sync_inode>:
c010349c:	55                   	push   %ebp
c010349d:	89 e5                	mov    %esp,%ebp
c010349f:	53                   	push   %ebx
c01034a0:	83 ec 34             	sub    $0x34,%esp
c01034a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01034aa:	eb 74                	jmp    c0103520 <sync_inode+0x84>
c01034ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01034af:	89 d0                	mov    %edx,%eax
c01034b1:	c1 e0 02             	shl    $0x2,%eax
c01034b4:	01 d0                	add    %edx,%eax
c01034b6:	c1 e0 03             	shl    $0x3,%eax
c01034b9:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01034be:	8b 10                	mov    (%eax),%edx
c01034c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01034c3:	8b 40 10             	mov    0x10(%eax),%eax
c01034c6:	39 c2                	cmp    %eax,%edx
c01034c8:	75 52                	jne    c010351c <sync_inode+0x80>
c01034ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01034cd:	89 d0                	mov    %edx,%eax
c01034cf:	c1 e0 02             	shl    $0x2,%eax
c01034d2:	01 d0                	add    %edx,%eax
c01034d4:	c1 e0 03             	shl    $0x3,%eax
c01034d7:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c01034dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01034e0:	8b 08                	mov    (%eax),%ecx
c01034e2:	89 0a                	mov    %ecx,(%edx)
c01034e4:	8b 48 04             	mov    0x4(%eax),%ecx
c01034e7:	89 4a 04             	mov    %ecx,0x4(%edx)
c01034ea:	8b 48 08             	mov    0x8(%eax),%ecx
c01034ed:	89 4a 08             	mov    %ecx,0x8(%edx)
c01034f0:	8b 48 0c             	mov    0xc(%eax),%ecx
c01034f3:	89 4a 0c             	mov    %ecx,0xc(%edx)
c01034f6:	8b 48 10             	mov    0x10(%eax),%ecx
c01034f9:	89 4a 10             	mov    %ecx,0x10(%edx)
c01034fc:	8b 48 14             	mov    0x14(%eax),%ecx
c01034ff:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103502:	8b 48 18             	mov    0x18(%eax),%ecx
c0103505:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103508:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010350b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010350e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103511:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103514:	8b 40 24             	mov    0x24(%eax),%eax
c0103517:	89 42 24             	mov    %eax,0x24(%edx)
c010351a:	eb 0a                	jmp    c0103526 <sync_inode+0x8a>
c010351c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103520:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103524:	7e 86                	jle    c01034ac <sync_inode+0x10>
c0103526:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010352d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103530:	8b 40 10             	mov    0x10(%eax),%eax
c0103533:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103536:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103539:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010353c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103541:	99                   	cltd   
c0103542:	f7 7d f0             	idivl  -0x10(%ebp)
c0103545:	89 c3                	mov    %eax,%ebx
c0103547:	89 c8                	mov    %ecx,%eax
c0103549:	99                   	cltd   
c010354a:	f7 fb                	idiv   %ebx
c010354c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010354f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103552:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103555:	b8 00 02 00 00       	mov    $0x200,%eax
c010355a:	99                   	cltd   
c010355b:	f7 7d f0             	idivl  -0x10(%ebp)
c010355e:	89 c3                	mov    %eax,%ebx
c0103560:	89 c8                	mov    %ecx,%eax
c0103562:	99                   	cltd   
c0103563:	f7 fb                	idiv   %ebx
c0103565:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103568:	8b 45 08             	mov    0x8(%ebp),%eax
c010356b:	8b 40 20             	mov    0x20(%eax),%eax
c010356e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103571:	e8 0a 01 00 00       	call   c0103680 <get_super_block>
c0103576:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103579:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010357c:	8b 40 04             	mov    0x4(%eax),%eax
c010357f:	8d 50 02             	lea    0x2(%eax),%edx
c0103582:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103585:	8b 40 08             	mov    0x8(%eax),%eax
c0103588:	01 c2                	add    %eax,%edx
c010358a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010358d:	01 d0                	add    %edx,%eax
c010358f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103592:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103597:	83 ec 0c             	sub    $0xc,%esp
c010359a:	6a 07                	push   $0x7
c010359c:	68 00 02 00 00       	push   $0x200
c01035a1:	50                   	push   %eax
c01035a2:	ff 75 e0             	pushl  -0x20(%ebp)
c01035a5:	ff 75 d8             	pushl  -0x28(%ebp)
c01035a8:	e8 f7 e2 ff ff       	call   c01018a4 <rd_wt>
c01035ad:	83 c4 20             	add    $0x20,%esp
c01035b0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01035b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01035b8:	83 ec 04             	sub    $0x4,%esp
c01035bb:	ff 75 f0             	pushl  -0x10(%ebp)
c01035be:	ff 75 08             	pushl  0x8(%ebp)
c01035c1:	ff 75 d4             	pushl  -0x2c(%ebp)
c01035c4:	e8 53 37 00 00       	call   c0106d1c <Memcpy>
c01035c9:	83 c4 10             	add    $0x10,%esp
c01035cc:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01035d1:	83 ec 0c             	sub    $0xc,%esp
c01035d4:	6a 0a                	push   $0xa
c01035d6:	68 00 02 00 00       	push   $0x200
c01035db:	50                   	push   %eax
c01035dc:	ff 75 e0             	pushl  -0x20(%ebp)
c01035df:	ff 75 d8             	pushl  -0x28(%ebp)
c01035e2:	e8 bd e2 ff ff       	call   c01018a4 <rd_wt>
c01035e7:	83 c4 20             	add    $0x20,%esp
c01035ea:	90                   	nop
c01035eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01035ee:	c9                   	leave  
c01035ef:	c3                   	ret    

c01035f0 <put_inode>:
c01035f0:	55                   	push   %ebp
c01035f1:	89 e5                	mov    %esp,%ebp
c01035f3:	83 ec 08             	sub    $0x8,%esp
c01035f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01035f9:	8b 40 24             	mov    0x24(%eax),%eax
c01035fc:	85 c0                	test   %eax,%eax
c01035fe:	7f 1c                	jg     c010361c <put_inode+0x2c>
c0103600:	68 4d 05 00 00       	push   $0x54d
c0103605:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010360a:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010360f:	68 d0 b4 10 c0       	push   $0xc010b4d0
c0103614:	e8 1c 53 00 00       	call   c0108935 <assertion_failure>
c0103619:	83 c4 10             	add    $0x10,%esp
c010361c:	8b 45 08             	mov    0x8(%ebp),%eax
c010361f:	8b 40 24             	mov    0x24(%eax),%eax
c0103622:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103625:	8b 45 08             	mov    0x8(%ebp),%eax
c0103628:	89 50 24             	mov    %edx,0x24(%eax)
c010362b:	90                   	nop
c010362c:	c9                   	leave  
c010362d:	c3                   	ret    

c010362e <do_close>:
c010362e:	55                   	push   %ebp
c010362f:	89 e5                	mov    %esp,%ebp
c0103631:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103636:	8b 55 08             	mov    0x8(%ebp),%edx
c0103639:	83 c2 4c             	add    $0x4c,%edx
c010363c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103640:	8b 50 0c             	mov    0xc(%eax),%edx
c0103643:	83 ea 01             	sub    $0x1,%edx
c0103646:	89 50 0c             	mov    %edx,0xc(%eax)
c0103649:	8b 40 0c             	mov    0xc(%eax),%eax
c010364c:	85 c0                	test   %eax,%eax
c010364e:	75 16                	jne    c0103666 <do_close+0x38>
c0103650:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103655:	8b 55 08             	mov    0x8(%ebp),%edx
c0103658:	83 c2 4c             	add    $0x4c,%edx
c010365b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010365f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103666:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010366b:	8b 55 08             	mov    0x8(%ebp),%edx
c010366e:	83 c2 4c             	add    $0x4c,%edx
c0103671:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103678:	00 
c0103679:	b8 00 00 00 00       	mov    $0x0,%eax
c010367e:	5d                   	pop    %ebp
c010367f:	c3                   	ret    

c0103680 <get_super_block>:
c0103680:	55                   	push   %ebp
c0103681:	89 e5                	mov    %esp,%ebp
c0103683:	83 ec 08             	sub    $0x8,%esp
c0103686:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010368b:	83 ec 0c             	sub    $0xc,%esp
c010368e:	6a 07                	push   $0x7
c0103690:	68 00 02 00 00       	push   $0x200
c0103695:	50                   	push   %eax
c0103696:	6a 20                	push   $0x20
c0103698:	6a 01                	push   $0x1
c010369a:	e8 05 e2 ff ff       	call   c01018a4 <rd_wt>
c010369f:	83 c4 20             	add    $0x20,%esp
c01036a2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01036a8:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01036ad:	8b 0a                	mov    (%edx),%ecx
c01036af:	89 08                	mov    %ecx,(%eax)
c01036b1:	8b 4a 04             	mov    0x4(%edx),%ecx
c01036b4:	89 48 04             	mov    %ecx,0x4(%eax)
c01036b7:	8b 4a 08             	mov    0x8(%edx),%ecx
c01036ba:	89 48 08             	mov    %ecx,0x8(%eax)
c01036bd:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01036c0:	89 48 0c             	mov    %ecx,0xc(%eax)
c01036c3:	8b 4a 10             	mov    0x10(%edx),%ecx
c01036c6:	89 48 10             	mov    %ecx,0x10(%eax)
c01036c9:	8b 4a 14             	mov    0x14(%edx),%ecx
c01036cc:	89 48 14             	mov    %ecx,0x14(%eax)
c01036cf:	8b 4a 18             	mov    0x18(%edx),%ecx
c01036d2:	89 48 18             	mov    %ecx,0x18(%eax)
c01036d5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01036d8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01036db:	8b 52 20             	mov    0x20(%edx),%edx
c01036de:	89 50 20             	mov    %edx,0x20(%eax)
c01036e1:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01036e6:	c9                   	leave  
c01036e7:	c3                   	ret    

c01036e8 <schedule_process>:
c01036e8:	55                   	push   %ebp
c01036e9:	89 e5                	mov    %esp,%ebp
c01036eb:	83 ec 18             	sub    $0x18,%esp
c01036ee:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c01036f5:	e8 f4 cc ff ff       	call   c01003ee <get_running_thread_pcb>
c01036fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01036fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103700:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103707:	84 c0                	test   %al,%al
c0103709:	75 35                	jne    c0103740 <schedule_process+0x58>
c010370b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010370e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103714:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103717:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010371d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103720:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103727:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010372a:	05 60 02 00 00       	add    $0x260,%eax
c010372f:	83 ec 08             	sub    $0x8,%esp
c0103732:	50                   	push   %eax
c0103733:	68 ec fd 10 c0       	push   $0xc010fdec
c0103738:	e8 9a 6b 00 00       	call   c010a2d7 <insertToDoubleLinkList>
c010373d:	83 c4 10             	add    $0x10,%esp
c0103740:	83 ec 0c             	sub    $0xc,%esp
c0103743:	68 ec fd 10 c0       	push   $0xc010fdec
c0103748:	e8 a6 69 00 00       	call   c010a0f3 <isListEmpty>
c010374d:	83 c4 10             	add    $0x10,%esp
c0103750:	84 c0                	test   %al,%al
c0103752:	74 19                	je     c010376d <schedule_process+0x85>
c0103754:	6a 1e                	push   $0x1e
c0103756:	68 df b4 10 c0       	push   $0xc010b4df
c010375b:	68 df b4 10 c0       	push   $0xc010b4df
c0103760:	68 e9 b4 10 c0       	push   $0xc010b4e9
c0103765:	e8 cb 51 00 00       	call   c0108935 <assertion_failure>
c010376a:	83 c4 10             	add    $0x10,%esp
c010376d:	83 ec 0c             	sub    $0xc,%esp
c0103770:	68 ec fd 10 c0       	push   $0xc010fdec
c0103775:	e8 e0 6b 00 00       	call   c010a35a <popFromDoubleLinkList>
c010377a:	83 c4 10             	add    $0x10,%esp
c010377d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103780:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103783:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103788:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010378b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010378e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103795:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103798:	8b 50 08             	mov    0x8(%eax),%edx
c010379b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010379e:	39 c2                	cmp    %eax,%edx
c01037a0:	74 28                	je     c01037ca <schedule_process+0xe2>
c01037a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037a5:	05 00 10 00 00       	add    $0x1000,%eax
c01037aa:	83 ec 0c             	sub    $0xc,%esp
c01037ad:	50                   	push   %eax
c01037ae:	e8 2c cc ff ff       	call   c01003df <update_tss>
c01037b3:	83 c4 10             	add    $0x10,%esp
c01037b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037b9:	8b 40 08             	mov    0x8(%eax),%eax
c01037bc:	83 ec 0c             	sub    $0xc,%esp
c01037bf:	50                   	push   %eax
c01037c0:	e8 0d cc ff ff       	call   c01003d2 <update_cr3>
c01037c5:	83 c4 10             	add    $0x10,%esp
c01037c8:	eb 0f                	jmp    c01037d9 <schedule_process+0xf1>
c01037ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01037cd:	83 ec 0c             	sub    $0xc,%esp
c01037d0:	50                   	push   %eax
c01037d1:	e8 fc cb ff ff       	call   c01003d2 <update_cr3>
c01037d6:	83 c4 10             	add    $0x10,%esp
c01037d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037dc:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01037e1:	83 ec 08             	sub    $0x8,%esp
c01037e4:	ff 75 e8             	pushl  -0x18(%ebp)
c01037e7:	ff 75 f0             	pushl  -0x10(%ebp)
c01037ea:	e8 c1 68 00 00       	call   c010a0b0 <switch_to>
c01037ef:	83 c4 10             	add    $0x10,%esp
c01037f2:	90                   	nop
c01037f3:	c9                   	leave  
c01037f4:	c3                   	ret    

c01037f5 <clock_handler>:
c01037f5:	55                   	push   %ebp
c01037f6:	89 e5                	mov    %esp,%ebp
c01037f8:	83 ec 18             	sub    $0x18,%esp
c01037fb:	e8 ee cb ff ff       	call   c01003ee <get_running_thread_pcb>
c0103800:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103803:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0103808:	85 c0                	test   %eax,%eax
c010380a:	74 0d                	je     c0103819 <clock_handler+0x24>
c010380c:	83 ec 0c             	sub    $0xc,%esp
c010380f:	6a 04                	push   $0x4
c0103811:	e8 29 60 00 00       	call   c010983f <inform_int>
c0103816:	83 c4 10             	add    $0x10,%esp
c0103819:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010381e:	83 f8 64             	cmp    $0x64,%eax
c0103821:	75 0c                	jne    c010382f <clock_handler+0x3a>
c0103823:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c010382a:	00 00 00 
c010382d:	eb 0a                	jmp    c0103839 <clock_handler+0x44>
c010382f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103834:	83 f8 01             	cmp    $0x1,%eax
c0103837:	75 2a                	jne    c0103863 <clock_handler+0x6e>
c0103839:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010383c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103842:	85 c0                	test   %eax,%eax
c0103844:	74 16                	je     c010385c <clock_handler+0x67>
c0103846:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c010384b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103851:	83 ea 01             	sub    $0x1,%edx
c0103854:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010385a:	eb 08                	jmp    c0103864 <clock_handler+0x6f>
c010385c:	e8 87 fe ff ff       	call   c01036e8 <schedule_process>
c0103861:	eb 01                	jmp    c0103864 <clock_handler+0x6f>
c0103863:	90                   	nop
c0103864:	c9                   	leave  
c0103865:	c3                   	ret    

c0103866 <pid2proc>:
c0103866:	55                   	push   %ebp
c0103867:	89 e5                	mov    %esp,%ebp
c0103869:	83 ec 20             	sub    $0x20,%esp
c010386c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103873:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010387a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c010387f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103885:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103888:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010388b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103890:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103896:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103899:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010389c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c01038a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038a4:	eb 36                	jmp    c01038dc <pid2proc+0x76>
c01038a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038a9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01038ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01038b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01038b5:	75 07                	jne    c01038be <pid2proc+0x58>
c01038b7:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c01038be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038c1:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01038c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01038ca:	39 c2                	cmp    %eax,%edx
c01038cc:	75 05                	jne    c01038d3 <pid2proc+0x6d>
c01038ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038d1:	eb 17                	jmp    c01038ea <pid2proc+0x84>
c01038d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038d6:	8b 40 04             	mov    0x4(%eax),%eax
c01038d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038dc:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c01038e3:	75 c1                	jne    c01038a6 <pid2proc+0x40>
c01038e5:	b8 00 00 00 00       	mov    $0x0,%eax
c01038ea:	c9                   	leave  
c01038eb:	c3                   	ret    

c01038ec <proc2pid>:
c01038ec:	55                   	push   %ebp
c01038ed:	89 e5                	mov    %esp,%ebp
c01038ef:	83 ec 10             	sub    $0x10,%esp
c01038f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01038f5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01038fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103901:	c9                   	leave  
c0103902:	c3                   	ret    

c0103903 <InitDescriptor>:
c0103903:	55                   	push   %ebp
c0103904:	89 e5                	mov    %esp,%ebp
c0103906:	83 ec 04             	sub    $0x4,%esp
c0103909:	8b 45 14             	mov    0x14(%ebp),%eax
c010390c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103910:	8b 45 10             	mov    0x10(%ebp),%eax
c0103913:	89 c2                	mov    %eax,%edx
c0103915:	8b 45 08             	mov    0x8(%ebp),%eax
c0103918:	66 89 10             	mov    %dx,(%eax)
c010391b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010391e:	89 c2                	mov    %eax,%edx
c0103920:	8b 45 08             	mov    0x8(%ebp),%eax
c0103923:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103927:	8b 45 0c             	mov    0xc(%ebp),%eax
c010392a:	c1 e8 10             	shr    $0x10,%eax
c010392d:	89 c2                	mov    %eax,%edx
c010392f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103932:	88 50 04             	mov    %dl,0x4(%eax)
c0103935:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103939:	89 c2                	mov    %eax,%edx
c010393b:	8b 45 08             	mov    0x8(%ebp),%eax
c010393e:	88 50 05             	mov    %dl,0x5(%eax)
c0103941:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103945:	66 c1 e8 08          	shr    $0x8,%ax
c0103949:	c1 e0 04             	shl    $0x4,%eax
c010394c:	89 c2                	mov    %eax,%edx
c010394e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103951:	c1 e8 10             	shr    $0x10,%eax
c0103954:	83 e0 0f             	and    $0xf,%eax
c0103957:	09 c2                	or     %eax,%edx
c0103959:	8b 45 08             	mov    0x8(%ebp),%eax
c010395c:	88 50 06             	mov    %dl,0x6(%eax)
c010395f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103962:	c1 e8 18             	shr    $0x18,%eax
c0103965:	89 c2                	mov    %eax,%edx
c0103967:	8b 45 08             	mov    0x8(%ebp),%eax
c010396a:	88 50 07             	mov    %dl,0x7(%eax)
c010396d:	90                   	nop
c010396e:	c9                   	leave  
c010396f:	c3                   	ret    

c0103970 <Seg2PhyAddr>:
c0103970:	55                   	push   %ebp
c0103971:	89 e5                	mov    %esp,%ebp
c0103973:	83 ec 10             	sub    $0x10,%esp
c0103976:	8b 45 08             	mov    0x8(%ebp),%eax
c0103979:	c1 e8 03             	shr    $0x3,%eax
c010397c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103983:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c010398a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010398d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103990:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103994:	0f b7 c0             	movzwl %ax,%eax
c0103997:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010399b:	0f b6 d2             	movzbl %dl,%edx
c010399e:	c1 e2 10             	shl    $0x10,%edx
c01039a1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c01039a7:	09 d0                	or     %edx,%eax
c01039a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01039ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01039af:	c9                   	leave  
c01039b0:	c3                   	ret    

c01039b1 <Seg2PhyAddrLDT>:
c01039b1:	55                   	push   %ebp
c01039b2:	89 e5                	mov    %esp,%ebp
c01039b4:	83 ec 10             	sub    $0x10,%esp
c01039b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01039ba:	c1 e8 03             	shr    $0x3,%eax
c01039bd:	89 c2                	mov    %eax,%edx
c01039bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039c2:	83 c2 20             	add    $0x20,%edx
c01039c5:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c01039c9:	8b 02                	mov    (%edx),%eax
c01039cb:	8b 52 04             	mov    0x4(%edx),%edx
c01039ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01039d1:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01039d4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01039d8:	0f b7 c0             	movzwl %ax,%eax
c01039db:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c01039df:	0f b6 d2             	movzbl %dl,%edx
c01039e2:	c1 e2 10             	shl    $0x10,%edx
c01039e5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c01039eb:	09 d0                	or     %edx,%eax
c01039ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01039f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01039f3:	c9                   	leave  
c01039f4:	c3                   	ret    

c01039f5 <VirAddr2PhyAddr>:
c01039f5:	55                   	push   %ebp
c01039f6:	89 e5                	mov    %esp,%ebp
c01039f8:	83 ec 10             	sub    $0x10,%esp
c01039fb:	8b 55 0c             	mov    0xc(%ebp),%edx
c01039fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a01:	01 d0                	add    %edx,%eax
c0103a03:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a06:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a09:	c9                   	leave  
c0103a0a:	c3                   	ret    

c0103a0b <v2l>:
c0103a0b:	55                   	push   %ebp
c0103a0c:	89 e5                	mov    %esp,%ebp
c0103a0e:	83 ec 18             	sub    $0x18,%esp
c0103a11:	83 ec 0c             	sub    $0xc,%esp
c0103a14:	ff 75 08             	pushl  0x8(%ebp)
c0103a17:	e8 4a fe ff ff       	call   c0103866 <pid2proc>
c0103a1c:	83 c4 10             	add    $0x10,%esp
c0103a1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a22:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103a29:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a2c:	83 ec 08             	sub    $0x8,%esp
c0103a2f:	ff 75 f4             	pushl  -0xc(%ebp)
c0103a32:	50                   	push   %eax
c0103a33:	e8 79 ff ff ff       	call   c01039b1 <Seg2PhyAddrLDT>
c0103a38:	83 c4 10             	add    $0x10,%esp
c0103a3b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103a3e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103a41:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a44:	01 d0                	add    %edx,%eax
c0103a46:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103a49:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a4c:	c9                   	leave  
c0103a4d:	c3                   	ret    

c0103a4e <init_propt>:
c0103a4e:	55                   	push   %ebp
c0103a4f:	89 e5                	mov    %esp,%ebp
c0103a51:	83 ec 38             	sub    $0x38,%esp
c0103a54:	6a 0e                	push   $0xe
c0103a56:	6a 08                	push   $0x8
c0103a58:	68 71 01 10 c0       	push   $0xc0100171
c0103a5d:	6a 20                	push   $0x20
c0103a5f:	e8 6b 01 00 00       	call   c0103bcf <InitInterruptDesc>
c0103a64:	83 c4 10             	add    $0x10,%esp
c0103a67:	6a 0e                	push   $0xe
c0103a69:	6a 08                	push   $0x8
c0103a6b:	68 9f 01 10 c0       	push   $0xc010019f
c0103a70:	6a 21                	push   $0x21
c0103a72:	e8 58 01 00 00       	call   c0103bcf <InitInterruptDesc>
c0103a77:	83 c4 10             	add    $0x10,%esp
c0103a7a:	6a 0e                	push   $0xe
c0103a7c:	6a 08                	push   $0x8
c0103a7e:	68 e2 01 10 c0       	push   $0xc01001e2
c0103a83:	6a 2e                	push   $0x2e
c0103a85:	e8 45 01 00 00       	call   c0103bcf <InitInterruptDesc>
c0103a8a:	83 c4 10             	add    $0x10,%esp
c0103a8d:	6a 0e                	push   $0xe
c0103a8f:	6a 08                	push   $0x8
c0103a91:	68 28 02 10 c0       	push   $0xc0100228
c0103a96:	6a 2a                	push   $0x2a
c0103a98:	e8 32 01 00 00       	call   c0103bcf <InitInterruptDesc>
c0103a9d:	83 c4 10             	add    $0x10,%esp
c0103aa0:	83 ec 04             	sub    $0x4,%esp
c0103aa3:	68 e0 15 00 00       	push   $0x15e0
c0103aa8:	6a 00                	push   $0x0
c0103aaa:	68 00 22 18 c0       	push   $0xc0182200
c0103aaf:	e8 1b 87 00 00       	call   c010c1cf <Memset>
c0103ab4:	83 c4 10             	add    $0x10,%esp
c0103ab7:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103abe:	83 ec 04             	sub    $0x4,%esp
c0103ac1:	ff 75 f4             	pushl  -0xc(%ebp)
c0103ac4:	6a 00                	push   $0x0
c0103ac6:	68 40 06 11 c0       	push   $0xc0110640
c0103acb:	e8 ff 86 00 00       	call   c010c1cf <Memset>
c0103ad0:	83 c4 10             	add    $0x10,%esp
c0103ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103ad6:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103adb:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103ae2:	00 00 00 
c0103ae5:	83 ec 0c             	sub    $0xc,%esp
c0103ae8:	6a 30                	push   $0x30
c0103aea:	e8 81 fe ff ff       	call   c0103970 <Seg2PhyAddr>
c0103aef:	83 c4 10             	add    $0x10,%esp
c0103af2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103af5:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103afc:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103b03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b06:	0f b7 d0             	movzwl %ax,%edx
c0103b09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b0c:	83 e8 01             	sub    $0x1,%eax
c0103b0f:	89 c1                	mov    %eax,%ecx
c0103b11:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b14:	52                   	push   %edx
c0103b15:	51                   	push   %ecx
c0103b16:	50                   	push   %eax
c0103b17:	68 00 f8 10 c0       	push   $0xc010f800
c0103b1c:	e8 e2 fd ff ff       	call   c0103903 <InitDescriptor>
c0103b21:	83 c4 10             	add    $0x10,%esp
c0103b24:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103b2b:	68 f2 00 00 00       	push   $0xf2
c0103b30:	68 ff ff 00 00       	push   $0xffff
c0103b35:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103b38:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103b3d:	e8 c1 fd ff ff       	call   c0103903 <InitDescriptor>
c0103b42:	83 c4 10             	add    $0x10,%esp
c0103b45:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103b4c:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103b53:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103b5a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103b5d:	0f b7 c0             	movzwl %ax,%eax
c0103b60:	50                   	push   %eax
c0103b61:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b64:	6a 00                	push   $0x0
c0103b66:	68 08 f8 10 c0       	push   $0xc010f808
c0103b6b:	e8 93 fd ff ff       	call   c0103903 <InitDescriptor>
c0103b70:	83 c4 10             	add    $0x10,%esp
c0103b73:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103b76:	0f b7 c0             	movzwl %ax,%eax
c0103b79:	50                   	push   %eax
c0103b7a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b7d:	6a 00                	push   $0x0
c0103b7f:	68 10 f8 10 c0       	push   $0xc010f810
c0103b84:	e8 7a fd ff ff       	call   c0103903 <InitDescriptor>
c0103b89:	83 c4 10             	add    $0x10,%esp
c0103b8c:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103b93:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103b9a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103b9d:	0f b7 c0             	movzwl %ax,%eax
c0103ba0:	50                   	push   %eax
c0103ba1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103ba4:	6a 00                	push   $0x0
c0103ba6:	68 18 f8 10 c0       	push   $0xc010f818
c0103bab:	e8 53 fd ff ff       	call   c0103903 <InitDescriptor>
c0103bb0:	83 c4 10             	add    $0x10,%esp
c0103bb3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103bb6:	0f b7 c0             	movzwl %ax,%eax
c0103bb9:	50                   	push   %eax
c0103bba:	ff 75 d8             	pushl  -0x28(%ebp)
c0103bbd:	6a 00                	push   $0x0
c0103bbf:	68 20 f8 10 c0       	push   $0xc010f820
c0103bc4:	e8 3a fd ff ff       	call   c0103903 <InitDescriptor>
c0103bc9:	83 c4 10             	add    $0x10,%esp
c0103bcc:	90                   	nop
c0103bcd:	c9                   	leave  
c0103bce:	c3                   	ret    

c0103bcf <InitInterruptDesc>:
c0103bcf:	55                   	push   %ebp
c0103bd0:	89 e5                	mov    %esp,%ebp
c0103bd2:	83 ec 10             	sub    $0x10,%esp
c0103bd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bd8:	c1 e0 03             	shl    $0x3,%eax
c0103bdb:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103be0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103be3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103be6:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103bea:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bed:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103bf0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103bf3:	89 c2                	mov    %eax,%edx
c0103bf5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bf8:	66 89 10             	mov    %dx,(%eax)
c0103bfb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bfe:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103c04:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103c07:	c1 f8 10             	sar    $0x10,%eax
c0103c0a:	89 c2                	mov    %eax,%edx
c0103c0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c0f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103c13:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c16:	c1 e0 04             	shl    $0x4,%eax
c0103c19:	89 c2                	mov    %eax,%edx
c0103c1b:	8b 45 14             	mov    0x14(%ebp),%eax
c0103c1e:	09 d0                	or     %edx,%eax
c0103c20:	89 c2                	mov    %eax,%edx
c0103c22:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c25:	88 50 05             	mov    %dl,0x5(%eax)
c0103c28:	90                   	nop
c0103c29:	c9                   	leave  
c0103c2a:	c3                   	ret    

c0103c2b <ReloadGDT>:
c0103c2b:	55                   	push   %ebp
c0103c2c:	89 e5                	mov    %esp,%ebp
c0103c2e:	83 ec 28             	sub    $0x28,%esp
c0103c31:	b8 d0 06 11 c0       	mov    $0xc01106d0,%eax
c0103c36:	0f b7 00             	movzwl (%eax),%eax
c0103c39:	98                   	cwtl   
c0103c3a:	ba d2 06 11 c0       	mov    $0xc01106d2,%edx
c0103c3f:	8b 12                	mov    (%edx),%edx
c0103c41:	83 ec 04             	sub    $0x4,%esp
c0103c44:	50                   	push   %eax
c0103c45:	52                   	push   %edx
c0103c46:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103c4b:	e8 51 85 00 00       	call   c010c1a1 <Memcpy2>
c0103c50:	83 c4 10             	add    $0x10,%esp
c0103c53:	c7 45 f0 d0 06 11 c0 	movl   $0xc01106d0,-0x10(%ebp)
c0103c5a:	c7 45 ec d2 06 11 c0 	movl   $0xc01106d2,-0x14(%ebp)
c0103c61:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103c64:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103c69:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103c6e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103c71:	89 10                	mov    %edx,(%eax)
c0103c73:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103c7a:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103c81:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c84:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103c89:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103c8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103c91:	89 10                	mov    %edx,(%eax)
c0103c93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103c9a:	eb 04                	jmp    c0103ca0 <ReloadGDT+0x75>
c0103c9c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103ca0:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103ca7:	7e f3                	jle    c0103c9c <ReloadGDT+0x71>
c0103ca9:	e8 a9 37 00 00       	call   c0107457 <init_internal_interrupt>
c0103cae:	e8 9b fd ff ff       	call   c0103a4e <init_propt>
c0103cb3:	90                   	nop
c0103cb4:	c9                   	leave  
c0103cb5:	c3                   	ret    

c0103cb6 <select_console>:
c0103cb6:	55                   	push   %ebp
c0103cb7:	89 e5                	mov    %esp,%ebp
c0103cb9:	83 ec 18             	sub    $0x18,%esp
c0103cbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cbf:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103cc2:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103cc6:	75 27                	jne    c0103cef <select_console+0x39>
c0103cc8:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103ccc:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103cd2:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103cd7:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103cdc:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103ce1:	83 ec 0c             	sub    $0xc,%esp
c0103ce4:	50                   	push   %eax
c0103ce5:	e8 08 00 00 00       	call   c0103cf2 <flush>
c0103cea:	83 c4 10             	add    $0x10,%esp
c0103ced:	eb 01                	jmp    c0103cf0 <select_console+0x3a>
c0103cef:	90                   	nop
c0103cf0:	c9                   	leave  
c0103cf1:	c3                   	ret    

c0103cf2 <flush>:
c0103cf2:	55                   	push   %ebp
c0103cf3:	89 e5                	mov    %esp,%ebp
c0103cf5:	83 ec 08             	sub    $0x8,%esp
c0103cf8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cfb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d01:	8b 40 0c             	mov    0xc(%eax),%eax
c0103d04:	83 ec 0c             	sub    $0xc,%esp
c0103d07:	50                   	push   %eax
c0103d08:	e8 1e 00 00 00       	call   c0103d2b <set_cursor>
c0103d0d:	83 c4 10             	add    $0x10,%esp
c0103d10:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d13:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d19:	8b 40 08             	mov    0x8(%eax),%eax
c0103d1c:	83 ec 0c             	sub    $0xc,%esp
c0103d1f:	50                   	push   %eax
c0103d20:	e8 64 00 00 00       	call   c0103d89 <set_console_start_video_addr>
c0103d25:	83 c4 10             	add    $0x10,%esp
c0103d28:	90                   	nop
c0103d29:	c9                   	leave  
c0103d2a:	c3                   	ret    

c0103d2b <set_cursor>:
c0103d2b:	55                   	push   %ebp
c0103d2c:	89 e5                	mov    %esp,%ebp
c0103d2e:	83 ec 08             	sub    $0x8,%esp
c0103d31:	83 ec 08             	sub    $0x8,%esp
c0103d34:	6a 0e                	push   $0xe
c0103d36:	68 d4 03 00 00       	push   $0x3d4
c0103d3b:	e8 b0 c5 ff ff       	call   c01002f0 <out_byte>
c0103d40:	83 c4 10             	add    $0x10,%esp
c0103d43:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d46:	c1 e8 08             	shr    $0x8,%eax
c0103d49:	0f b7 c0             	movzwl %ax,%eax
c0103d4c:	83 ec 08             	sub    $0x8,%esp
c0103d4f:	50                   	push   %eax
c0103d50:	68 d5 03 00 00       	push   $0x3d5
c0103d55:	e8 96 c5 ff ff       	call   c01002f0 <out_byte>
c0103d5a:	83 c4 10             	add    $0x10,%esp
c0103d5d:	83 ec 08             	sub    $0x8,%esp
c0103d60:	6a 0f                	push   $0xf
c0103d62:	68 d4 03 00 00       	push   $0x3d4
c0103d67:	e8 84 c5 ff ff       	call   c01002f0 <out_byte>
c0103d6c:	83 c4 10             	add    $0x10,%esp
c0103d6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d72:	0f b7 c0             	movzwl %ax,%eax
c0103d75:	83 ec 08             	sub    $0x8,%esp
c0103d78:	50                   	push   %eax
c0103d79:	68 d5 03 00 00       	push   $0x3d5
c0103d7e:	e8 6d c5 ff ff       	call   c01002f0 <out_byte>
c0103d83:	83 c4 10             	add    $0x10,%esp
c0103d86:	90                   	nop
c0103d87:	c9                   	leave  
c0103d88:	c3                   	ret    

c0103d89 <set_console_start_video_addr>:
c0103d89:	55                   	push   %ebp
c0103d8a:	89 e5                	mov    %esp,%ebp
c0103d8c:	83 ec 08             	sub    $0x8,%esp
c0103d8f:	83 ec 08             	sub    $0x8,%esp
c0103d92:	6a 0c                	push   $0xc
c0103d94:	68 d4 03 00 00       	push   $0x3d4
c0103d99:	e8 52 c5 ff ff       	call   c01002f0 <out_byte>
c0103d9e:	83 c4 10             	add    $0x10,%esp
c0103da1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103da4:	c1 e8 08             	shr    $0x8,%eax
c0103da7:	0f b7 c0             	movzwl %ax,%eax
c0103daa:	83 ec 08             	sub    $0x8,%esp
c0103dad:	50                   	push   %eax
c0103dae:	68 d5 03 00 00       	push   $0x3d5
c0103db3:	e8 38 c5 ff ff       	call   c01002f0 <out_byte>
c0103db8:	83 c4 10             	add    $0x10,%esp
c0103dbb:	83 ec 08             	sub    $0x8,%esp
c0103dbe:	6a 0d                	push   $0xd
c0103dc0:	68 d4 03 00 00       	push   $0x3d4
c0103dc5:	e8 26 c5 ff ff       	call   c01002f0 <out_byte>
c0103dca:	83 c4 10             	add    $0x10,%esp
c0103dcd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dd0:	0f b7 c0             	movzwl %ax,%eax
c0103dd3:	83 ec 08             	sub    $0x8,%esp
c0103dd6:	50                   	push   %eax
c0103dd7:	68 d5 03 00 00       	push   $0x3d5
c0103ddc:	e8 0f c5 ff ff       	call   c01002f0 <out_byte>
c0103de1:	83 c4 10             	add    $0x10,%esp
c0103de4:	90                   	nop
c0103de5:	c9                   	leave  
c0103de6:	c3                   	ret    

c0103de7 <put_key>:
c0103de7:	55                   	push   %ebp
c0103de8:	89 e5                	mov    %esp,%ebp
c0103dea:	83 ec 04             	sub    $0x4,%esp
c0103ded:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103df0:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103df3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df6:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103dfc:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103e01:	77 4d                	ja     c0103e50 <put_key+0x69>
c0103e03:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e06:	8b 00                	mov    (%eax),%eax
c0103e08:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103e0c:	89 10                	mov    %edx,(%eax)
c0103e0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e11:	8b 00                	mov    (%eax),%eax
c0103e13:	8d 50 04             	lea    0x4(%eax),%edx
c0103e16:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e19:	89 10                	mov    %edx,(%eax)
c0103e1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e1e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103e24:	8d 50 01             	lea    0x1(%eax),%edx
c0103e27:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e2a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103e30:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e33:	8b 00                	mov    (%eax),%eax
c0103e35:	8b 55 08             	mov    0x8(%ebp),%edx
c0103e38:	83 c2 08             	add    $0x8,%edx
c0103e3b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103e41:	39 d0                	cmp    %edx,%eax
c0103e43:	75 0b                	jne    c0103e50 <put_key+0x69>
c0103e45:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e48:	8d 50 08             	lea    0x8(%eax),%edx
c0103e4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e4e:	89 10                	mov    %edx,(%eax)
c0103e50:	90                   	nop
c0103e51:	c9                   	leave  
c0103e52:	c3                   	ret    

c0103e53 <scroll_up>:
c0103e53:	55                   	push   %ebp
c0103e54:	89 e5                	mov    %esp,%ebp
c0103e56:	83 ec 08             	sub    $0x8,%esp
c0103e59:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e5c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e62:	8b 40 08             	mov    0x8(%eax),%eax
c0103e65:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103e68:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e6b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e71:	8b 00                	mov    (%eax),%eax
c0103e73:	39 c2                	cmp    %eax,%edx
c0103e75:	76 1b                	jbe    c0103e92 <scroll_up+0x3f>
c0103e77:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e7a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e80:	8b 40 08             	mov    0x8(%eax),%eax
c0103e83:	83 e8 50             	sub    $0x50,%eax
c0103e86:	83 ec 0c             	sub    $0xc,%esp
c0103e89:	50                   	push   %eax
c0103e8a:	e8 fa fe ff ff       	call   c0103d89 <set_console_start_video_addr>
c0103e8f:	83 c4 10             	add    $0x10,%esp
c0103e92:	90                   	nop
c0103e93:	c9                   	leave  
c0103e94:	c3                   	ret    

c0103e95 <scroll_down>:
c0103e95:	55                   	push   %ebp
c0103e96:	89 e5                	mov    %esp,%ebp
c0103e98:	83 ec 08             	sub    $0x8,%esp
c0103e9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e9e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ea4:	8b 40 08             	mov    0x8(%eax),%eax
c0103ea7:	8d 48 50             	lea    0x50(%eax),%ecx
c0103eaa:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ead:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eb3:	8b 10                	mov    (%eax),%edx
c0103eb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ebe:	8b 40 04             	mov    0x4(%eax),%eax
c0103ec1:	01 d0                	add    %edx,%eax
c0103ec3:	39 c1                	cmp    %eax,%ecx
c0103ec5:	73 36                	jae    c0103efd <scroll_down+0x68>
c0103ec7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ed0:	8b 40 08             	mov    0x8(%eax),%eax
c0103ed3:	83 c0 50             	add    $0x50,%eax
c0103ed6:	83 ec 0c             	sub    $0xc,%esp
c0103ed9:	50                   	push   %eax
c0103eda:	e8 aa fe ff ff       	call   c0103d89 <set_console_start_video_addr>
c0103edf:	83 c4 10             	add    $0x10,%esp
c0103ee2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ee5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eeb:	8b 50 08             	mov    0x8(%eax),%edx
c0103eee:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ef1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ef7:	83 c2 50             	add    $0x50,%edx
c0103efa:	89 50 08             	mov    %edx,0x8(%eax)
c0103efd:	90                   	nop
c0103efe:	c9                   	leave  
c0103eff:	c3                   	ret    

c0103f00 <out_char>:
c0103f00:	55                   	push   %ebp
c0103f01:	89 e5                	mov    %esp,%ebp
c0103f03:	83 ec 28             	sub    $0x28,%esp
c0103f06:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103f09:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103f0c:	e8 a7 2d 00 00       	call   c0106cb8 <intr_disable>
c0103f11:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103f14:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f17:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f1d:	8b 40 0c             	mov    0xc(%eax),%eax
c0103f20:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103f25:	01 c0                	add    %eax,%eax
c0103f27:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103f2a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103f2e:	83 f8 08             	cmp    $0x8,%eax
c0103f31:	0f 84 8d 00 00 00    	je     c0103fc4 <out_char+0xc4>
c0103f37:	83 f8 0a             	cmp    $0xa,%eax
c0103f3a:	0f 85 c9 00 00 00    	jne    c0104009 <out_char+0x109>
c0103f40:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f43:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f49:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f4f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f55:	8b 08                	mov    (%eax),%ecx
c0103f57:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f5a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f60:	8b 40 04             	mov    0x4(%eax),%eax
c0103f63:	01 c8                	add    %ecx,%eax
c0103f65:	83 e8 50             	sub    $0x50,%eax
c0103f68:	39 c2                	cmp    %eax,%edx
c0103f6a:	0f 83 f4 00 00 00    	jae    c0104064 <out_char+0x164>
c0103f70:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f73:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f79:	8b 08                	mov    (%eax),%ecx
c0103f7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f7e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f84:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f87:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f8a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f90:	8b 00                	mov    (%eax),%eax
c0103f92:	29 c2                	sub    %eax,%edx
c0103f94:	89 d0                	mov    %edx,%eax
c0103f96:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103f9b:	f7 e2                	mul    %edx
c0103f9d:	89 d0                	mov    %edx,%eax
c0103f9f:	c1 e8 06             	shr    $0x6,%eax
c0103fa2:	8d 50 01             	lea    0x1(%eax),%edx
c0103fa5:	89 d0                	mov    %edx,%eax
c0103fa7:	c1 e0 02             	shl    $0x2,%eax
c0103faa:	01 d0                	add    %edx,%eax
c0103fac:	c1 e0 04             	shl    $0x4,%eax
c0103faf:	89 c2                	mov    %eax,%edx
c0103fb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fb4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fba:	01 ca                	add    %ecx,%edx
c0103fbc:	89 50 0c             	mov    %edx,0xc(%eax)
c0103fbf:	e9 a0 00 00 00       	jmp    c0104064 <out_char+0x164>
c0103fc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fc7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fcd:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fd3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fd9:	8b 00                	mov    (%eax),%eax
c0103fdb:	39 c2                	cmp    %eax,%edx
c0103fdd:	0f 86 84 00 00 00    	jbe    c0104067 <out_char+0x167>
c0103fe3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fe6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fec:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fef:	83 ea 01             	sub    $0x1,%edx
c0103ff2:	89 50 0c             	mov    %edx,0xc(%eax)
c0103ff5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ff8:	83 e8 02             	sub    $0x2,%eax
c0103ffb:	c6 00 20             	movb   $0x20,(%eax)
c0103ffe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104001:	83 e8 01             	sub    $0x1,%eax
c0104004:	c6 00 00             	movb   $0x0,(%eax)
c0104007:	eb 5e                	jmp    c0104067 <out_char+0x167>
c0104009:	8b 45 08             	mov    0x8(%ebp),%eax
c010400c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104012:	8b 40 0c             	mov    0xc(%eax),%eax
c0104015:	8d 48 01             	lea    0x1(%eax),%ecx
c0104018:	8b 45 08             	mov    0x8(%ebp),%eax
c010401b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104021:	8b 10                	mov    (%eax),%edx
c0104023:	8b 45 08             	mov    0x8(%ebp),%eax
c0104026:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010402c:	8b 40 04             	mov    0x4(%eax),%eax
c010402f:	01 d0                	add    %edx,%eax
c0104031:	39 c1                	cmp    %eax,%ecx
c0104033:	73 35                	jae    c010406a <out_char+0x16a>
c0104035:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104038:	8d 50 01             	lea    0x1(%eax),%edx
c010403b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010403e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0104042:	88 10                	mov    %dl,(%eax)
c0104044:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104047:	8d 50 01             	lea    0x1(%eax),%edx
c010404a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010404d:	c6 00 0a             	movb   $0xa,(%eax)
c0104050:	8b 45 08             	mov    0x8(%ebp),%eax
c0104053:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104059:	8b 50 0c             	mov    0xc(%eax),%edx
c010405c:	83 c2 01             	add    $0x1,%edx
c010405f:	89 50 0c             	mov    %edx,0xc(%eax)
c0104062:	eb 06                	jmp    c010406a <out_char+0x16a>
c0104064:	90                   	nop
c0104065:	eb 14                	jmp    c010407b <out_char+0x17b>
c0104067:	90                   	nop
c0104068:	eb 11                	jmp    c010407b <out_char+0x17b>
c010406a:	90                   	nop
c010406b:	eb 0e                	jmp    c010407b <out_char+0x17b>
c010406d:	83 ec 0c             	sub    $0xc,%esp
c0104070:	ff 75 08             	pushl  0x8(%ebp)
c0104073:	e8 1d fe ff ff       	call   c0103e95 <scroll_down>
c0104078:	83 c4 10             	add    $0x10,%esp
c010407b:	8b 45 08             	mov    0x8(%ebp),%eax
c010407e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104084:	8b 50 0c             	mov    0xc(%eax),%edx
c0104087:	8b 45 08             	mov    0x8(%ebp),%eax
c010408a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104090:	8b 40 08             	mov    0x8(%eax),%eax
c0104093:	29 c2                	sub    %eax,%edx
c0104095:	89 d0                	mov    %edx,%eax
c0104097:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c010409c:	77 cf                	ja     c010406d <out_char+0x16d>
c010409e:	83 ec 0c             	sub    $0xc,%esp
c01040a1:	ff 75 08             	pushl  0x8(%ebp)
c01040a4:	e8 49 fc ff ff       	call   c0103cf2 <flush>
c01040a9:	83 c4 10             	add    $0x10,%esp
c01040ac:	83 ec 0c             	sub    $0xc,%esp
c01040af:	ff 75 f4             	pushl  -0xc(%ebp)
c01040b2:	e8 2a 2c 00 00       	call   c0106ce1 <intr_set_status>
c01040b7:	83 c4 10             	add    $0x10,%esp
c01040ba:	90                   	nop
c01040bb:	c9                   	leave  
c01040bc:	c3                   	ret    

c01040bd <tty_dev_read>:
c01040bd:	55                   	push   %ebp
c01040be:	89 e5                	mov    %esp,%ebp
c01040c0:	83 ec 08             	sub    $0x8,%esp
c01040c3:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01040c8:	39 45 08             	cmp    %eax,0x8(%ebp)
c01040cb:	75 17                	jne    c01040e4 <tty_dev_read+0x27>
c01040cd:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01040d2:	85 c0                	test   %eax,%eax
c01040d4:	7e 0e                	jle    c01040e4 <tty_dev_read+0x27>
c01040d6:	83 ec 0c             	sub    $0xc,%esp
c01040d9:	ff 75 08             	pushl  0x8(%ebp)
c01040dc:	e8 89 07 00 00       	call   c010486a <keyboard_read>
c01040e1:	83 c4 10             	add    $0x10,%esp
c01040e4:	90                   	nop
c01040e5:	c9                   	leave  
c01040e6:	c3                   	ret    

c01040e7 <tty_dev_write>:
c01040e7:	55                   	push   %ebp
c01040e8:	89 e5                	mov    %esp,%ebp
c01040ea:	83 ec 28             	sub    $0x28,%esp
c01040ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01040f0:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01040f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01040f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104100:	e9 88 01 00 00       	jmp    c010428d <tty_dev_write+0x1a6>
c0104105:	8b 45 08             	mov    0x8(%ebp),%eax
c0104108:	8b 40 04             	mov    0x4(%eax),%eax
c010410b:	8b 00                	mov    (%eax),%eax
c010410d:	88 45 e7             	mov    %al,-0x19(%ebp)
c0104110:	8b 45 08             	mov    0x8(%ebp),%eax
c0104113:	8b 40 04             	mov    0x4(%eax),%eax
c0104116:	8d 50 04             	lea    0x4(%eax),%edx
c0104119:	8b 45 08             	mov    0x8(%ebp),%eax
c010411c:	89 50 04             	mov    %edx,0x4(%eax)
c010411f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104122:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104128:	8d 50 ff             	lea    -0x1(%eax),%edx
c010412b:	8b 45 08             	mov    0x8(%ebp),%eax
c010412e:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104134:	8b 45 08             	mov    0x8(%ebp),%eax
c0104137:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010413d:	8d 50 01             	lea    0x1(%eax),%edx
c0104140:	8b 45 08             	mov    0x8(%ebp),%eax
c0104143:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104149:	8b 45 08             	mov    0x8(%ebp),%eax
c010414c:	8b 40 04             	mov    0x4(%eax),%eax
c010414f:	8b 55 08             	mov    0x8(%ebp),%edx
c0104152:	83 c2 08             	add    $0x8,%edx
c0104155:	81 c2 00 08 00 00    	add    $0x800,%edx
c010415b:	39 d0                	cmp    %edx,%eax
c010415d:	75 0c                	jne    c010416b <tty_dev_write+0x84>
c010415f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104162:	8d 50 08             	lea    0x8(%eax),%edx
c0104165:	8b 45 08             	mov    0x8(%ebp),%eax
c0104168:	89 50 04             	mov    %edx,0x4(%eax)
c010416b:	8b 45 08             	mov    0x8(%ebp),%eax
c010416e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104174:	85 c0                	test   %eax,%eax
c0104176:	0f 84 11 01 00 00    	je     c010428d <tty_dev_write+0x1a6>
c010417c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104180:	3c 20                	cmp    $0x20,%al
c0104182:	76 08                	jbe    c010418c <tty_dev_write+0xa5>
c0104184:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104188:	3c 7e                	cmp    $0x7e,%al
c010418a:	76 10                	jbe    c010419c <tty_dev_write+0xb5>
c010418c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104190:	3c 20                	cmp    $0x20,%al
c0104192:	74 08                	je     c010419c <tty_dev_write+0xb5>
c0104194:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104198:	84 c0                	test   %al,%al
c010419a:	75 58                	jne    c01041f4 <tty_dev_write+0x10d>
c010419c:	8b 45 08             	mov    0x8(%ebp),%eax
c010419f:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c01041a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01041a8:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01041ae:	01 d0                	add    %edx,%eax
c01041b0:	83 e8 01             	sub    $0x1,%eax
c01041b3:	89 c2                	mov    %eax,%edx
c01041b5:	83 ec 04             	sub    $0x4,%esp
c01041b8:	6a 01                	push   $0x1
c01041ba:	8d 45 e7             	lea    -0x19(%ebp),%eax
c01041bd:	50                   	push   %eax
c01041be:	52                   	push   %edx
c01041bf:	e8 58 2b 00 00       	call   c0106d1c <Memcpy>
c01041c4:	83 c4 10             	add    $0x10,%esp
c01041c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ca:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01041d0:	8d 50 ff             	lea    -0x1(%eax),%edx
c01041d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01041d6:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01041dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041e0:	0f b6 c0             	movzbl %al,%eax
c01041e3:	83 ec 08             	sub    $0x8,%esp
c01041e6:	50                   	push   %eax
c01041e7:	ff 75 08             	pushl  0x8(%ebp)
c01041ea:	e8 11 fd ff ff       	call   c0103f00 <out_char>
c01041ef:	83 c4 10             	add    $0x10,%esp
c01041f2:	eb 7c                	jmp    c0104270 <tty_dev_write+0x189>
c01041f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041f8:	3c 08                	cmp    $0x8,%al
c01041fa:	75 42                	jne    c010423e <tty_dev_write+0x157>
c01041fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ff:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104205:	8d 50 01             	lea    0x1(%eax),%edx
c0104208:	8b 45 08             	mov    0x8(%ebp),%eax
c010420b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104211:	8b 45 08             	mov    0x8(%ebp),%eax
c0104214:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010421a:	8d 50 fe             	lea    -0x2(%eax),%edx
c010421d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104220:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104226:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010422a:	0f b6 c0             	movzbl %al,%eax
c010422d:	83 ec 08             	sub    $0x8,%esp
c0104230:	50                   	push   %eax
c0104231:	ff 75 08             	pushl  0x8(%ebp)
c0104234:	e8 c7 fc ff ff       	call   c0103f00 <out_char>
c0104239:	83 c4 10             	add    $0x10,%esp
c010423c:	eb 32                	jmp    c0104270 <tty_dev_write+0x189>
c010423e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104242:	3c 0a                	cmp    $0xa,%al
c0104244:	75 2a                	jne    c0104270 <tty_dev_write+0x189>
c0104246:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010424a:	0f b6 c0             	movzbl %al,%eax
c010424d:	83 ec 08             	sub    $0x8,%esp
c0104250:	50                   	push   %eax
c0104251:	ff 75 08             	pushl  0x8(%ebp)
c0104254:	e8 a7 fc ff ff       	call   c0103f00 <out_char>
c0104259:	83 c4 10             	add    $0x10,%esp
c010425c:	8b 45 08             	mov    0x8(%ebp),%eax
c010425f:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0104266:	00 00 00 
c0104269:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104270:	8b 45 08             	mov    0x8(%ebp),%eax
c0104273:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104279:	8b 45 08             	mov    0x8(%ebp),%eax
c010427c:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0104282:	39 c2                	cmp    %eax,%edx
c0104284:	75 07                	jne    c010428d <tty_dev_write+0x1a6>
c0104286:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010428d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104290:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104296:	85 c0                	test   %eax,%eax
c0104298:	0f 85 67 fe ff ff    	jne    c0104105 <tty_dev_write+0x1e>
c010429e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01042a2:	74 6d                	je     c0104311 <tty_dev_write+0x22a>
c01042a4:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c01042ab:	83 ec 0c             	sub    $0xc,%esp
c01042ae:	ff 75 ec             	pushl  -0x14(%ebp)
c01042b1:	e8 b6 d3 ff ff       	call   c010166c <sys_malloc>
c01042b6:	83 c4 10             	add    $0x10,%esp
c01042b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01042bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042bf:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c01042c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01042c9:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01042cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042d2:	89 50 60             	mov    %edx,0x60(%eax)
c01042d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01042d8:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c01042de:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042e1:	89 50 68             	mov    %edx,0x68(%eax)
c01042e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01042e7:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01042ed:	83 ec 04             	sub    $0x4,%esp
c01042f0:	50                   	push   %eax
c01042f1:	ff 75 e8             	pushl  -0x18(%ebp)
c01042f4:	6a 01                	push   $0x1
c01042f6:	e8 aa 52 00 00       	call   c01095a5 <send_rec>
c01042fb:	83 c4 10             	add    $0x10,%esp
c01042fe:	83 ec 08             	sub    $0x8,%esp
c0104301:	ff 75 ec             	pushl  -0x14(%ebp)
c0104304:	ff 75 e8             	pushl  -0x18(%ebp)
c0104307:	e8 75 d3 ff ff       	call   c0101681 <sys_free>
c010430c:	83 c4 10             	add    $0x10,%esp
c010430f:	eb 01                	jmp    c0104312 <tty_dev_write+0x22b>
c0104311:	90                   	nop
c0104312:	c9                   	leave  
c0104313:	c3                   	ret    

c0104314 <tty_do_read>:
c0104314:	55                   	push   %ebp
c0104315:	89 e5                	mov    %esp,%ebp
c0104317:	83 ec 08             	sub    $0x8,%esp
c010431a:	8b 45 08             	mov    0x8(%ebp),%eax
c010431d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104324:	00 00 00 
c0104327:	8b 45 0c             	mov    0xc(%ebp),%eax
c010432a:	8b 50 68             	mov    0x68(%eax),%edx
c010432d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104330:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104336:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104339:	8b 00                	mov    (%eax),%eax
c010433b:	89 c2                	mov    %eax,%edx
c010433d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104340:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0104346:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104349:	8b 50 60             	mov    0x60(%eax),%edx
c010434c:	8b 45 08             	mov    0x8(%ebp),%eax
c010434f:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104355:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104358:	8b 50 60             	mov    0x60(%eax),%edx
c010435b:	8b 45 08             	mov    0x8(%ebp),%eax
c010435e:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0104364:	8b 45 08             	mov    0x8(%ebp),%eax
c0104367:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c010436d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104370:	8b 40 10             	mov    0x10(%eax),%eax
c0104373:	83 ec 08             	sub    $0x8,%esp
c0104376:	52                   	push   %edx
c0104377:	50                   	push   %eax
c0104378:	e8 32 1b 00 00       	call   c0105eaf <alloc_virtual_memory>
c010437d:	83 c4 10             	add    $0x10,%esp
c0104380:	89 c2                	mov    %eax,%edx
c0104382:	8b 45 08             	mov    0x8(%ebp),%eax
c0104385:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c010438b:	8b 45 08             	mov    0x8(%ebp),%eax
c010438e:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104394:	83 f8 02             	cmp    $0x2,%eax
c0104397:	74 1c                	je     c01043b5 <tty_do_read+0xa1>
c0104399:	68 3b 01 00 00       	push   $0x13b
c010439e:	68 05 b5 10 c0       	push   $0xc010b505
c01043a3:	68 05 b5 10 c0       	push   $0xc010b505
c01043a8:	68 0f b5 10 c0       	push   $0xc010b50f
c01043ad:	e8 83 45 00 00       	call   c0108935 <assertion_failure>
c01043b2:	83 c4 10             	add    $0x10,%esp
c01043b5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043b8:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c01043bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01043c2:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01043c8:	83 ec 04             	sub    $0x4,%esp
c01043cb:	50                   	push   %eax
c01043cc:	ff 75 0c             	pushl  0xc(%ebp)
c01043cf:	6a 01                	push   $0x1
c01043d1:	e8 cf 51 00 00       	call   c01095a5 <send_rec>
c01043d6:	83 c4 10             	add    $0x10,%esp
c01043d9:	90                   	nop
c01043da:	c9                   	leave  
c01043db:	c3                   	ret    

c01043dc <tty_do_write>:
c01043dc:	55                   	push   %ebp
c01043dd:	89 e5                	mov    %esp,%ebp
c01043df:	53                   	push   %ebx
c01043e0:	83 ec 24             	sub    $0x24,%esp
c01043e3:	89 e0                	mov    %esp,%eax
c01043e5:	89 c3                	mov    %eax,%ebx
c01043e7:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c01043ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01043f1:	8d 50 ff             	lea    -0x1(%eax),%edx
c01043f4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01043f7:	89 c2                	mov    %eax,%edx
c01043f9:	b8 10 00 00 00       	mov    $0x10,%eax
c01043fe:	83 e8 01             	sub    $0x1,%eax
c0104401:	01 d0                	add    %edx,%eax
c0104403:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104408:	ba 00 00 00 00       	mov    $0x0,%edx
c010440d:	f7 f1                	div    %ecx
c010440f:	6b c0 10             	imul   $0x10,%eax,%eax
c0104412:	29 c4                	sub    %eax,%esp
c0104414:	89 e0                	mov    %esp,%eax
c0104416:	83 c0 00             	add    $0x0,%eax
c0104419:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010441c:	83 ec 04             	sub    $0x4,%esp
c010441f:	ff 75 e8             	pushl  -0x18(%ebp)
c0104422:	6a 00                	push   $0x0
c0104424:	ff 75 e0             	pushl  -0x20(%ebp)
c0104427:	e8 a3 7d 00 00       	call   c010c1cf <Memset>
c010442c:	83 c4 10             	add    $0x10,%esp
c010442f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104432:	8b 40 60             	mov    0x60(%eax),%eax
c0104435:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104438:	8b 45 08             	mov    0x8(%ebp),%eax
c010443b:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104442:	00 00 00 
c0104445:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104448:	8b 45 0c             	mov    0xc(%ebp),%eax
c010444b:	8b 40 10             	mov    0x10(%eax),%eax
c010444e:	83 ec 08             	sub    $0x8,%esp
c0104451:	52                   	push   %edx
c0104452:	50                   	push   %eax
c0104453:	e8 57 1a 00 00       	call   c0105eaf <alloc_virtual_memory>
c0104458:	83 c4 10             	add    $0x10,%esp
c010445b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010445e:	eb 7e                	jmp    c01044de <tty_do_write+0x102>
c0104460:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104463:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0104466:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c010446a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010446d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104470:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104476:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104479:	01 d0                	add    %edx,%eax
c010447b:	83 ec 04             	sub    $0x4,%esp
c010447e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104481:	50                   	push   %eax
c0104482:	ff 75 e0             	pushl  -0x20(%ebp)
c0104485:	e8 92 28 00 00       	call   c0106d1c <Memcpy>
c010448a:	83 c4 10             	add    $0x10,%esp
c010448d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104490:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104493:	8b 45 08             	mov    0x8(%ebp),%eax
c0104496:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010449c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010449f:	01 c2                	add    %eax,%edx
c01044a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01044a4:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01044aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01044b1:	eb 25                	jmp    c01044d8 <tty_do_write+0xfc>
c01044b3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01044b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044b9:	01 d0                	add    %edx,%eax
c01044bb:	0f b6 00             	movzbl (%eax),%eax
c01044be:	0f b6 c0             	movzbl %al,%eax
c01044c1:	83 ec 08             	sub    $0x8,%esp
c01044c4:	50                   	push   %eax
c01044c5:	ff 75 08             	pushl  0x8(%ebp)
c01044c8:	e8 33 fa ff ff       	call   c0103f00 <out_char>
c01044cd:	83 c4 10             	add    $0x10,%esp
c01044d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01044d4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c01044d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01044dc:	75 d5                	jne    c01044b3 <tty_do_write+0xd7>
c01044de:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01044e2:	0f 85 78 ff ff ff    	jne    c0104460 <tty_do_write+0x84>
c01044e8:	83 ec 0c             	sub    $0xc,%esp
c01044eb:	6a 7c                	push   $0x7c
c01044ed:	e8 7a d1 ff ff       	call   c010166c <sys_malloc>
c01044f2:	83 c4 10             	add    $0x10,%esp
c01044f5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01044f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01044fb:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104502:	8b 45 08             	mov    0x8(%ebp),%eax
c0104505:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010450b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010450e:	89 50 58             	mov    %edx,0x58(%eax)
c0104511:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104514:	8b 00                	mov    (%eax),%eax
c0104516:	83 ec 04             	sub    $0x4,%esp
c0104519:	50                   	push   %eax
c010451a:	ff 75 d8             	pushl  -0x28(%ebp)
c010451d:	6a 01                	push   $0x1
c010451f:	e8 81 50 00 00       	call   c01095a5 <send_rec>
c0104524:	83 c4 10             	add    $0x10,%esp
c0104527:	83 ec 08             	sub    $0x8,%esp
c010452a:	6a 7c                	push   $0x7c
c010452c:	ff 75 d8             	pushl  -0x28(%ebp)
c010452f:	e8 4d d1 ff ff       	call   c0101681 <sys_free>
c0104534:	83 c4 10             	add    $0x10,%esp
c0104537:	89 dc                	mov    %ebx,%esp
c0104539:	90                   	nop
c010453a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010453d:	c9                   	leave  
c010453e:	c3                   	ret    

c010453f <init_screen>:
c010453f:	55                   	push   %ebp
c0104540:	89 e5                	mov    %esp,%ebp
c0104542:	83 ec 10             	sub    $0x10,%esp
c0104545:	8b 45 08             	mov    0x8(%ebp),%eax
c0104548:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010454d:	c1 f8 03             	sar    $0x3,%eax
c0104550:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104556:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104559:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010455c:	c1 e0 04             	shl    $0x4,%eax
c010455f:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c0104565:	8b 45 08             	mov    0x8(%ebp),%eax
c0104568:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c010456e:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104575:	8b 45 08             	mov    0x8(%ebp),%eax
c0104578:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010457e:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0104581:	89 50 04             	mov    %edx,0x4(%eax)
c0104584:	8b 45 08             	mov    0x8(%ebp),%eax
c0104587:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010458d:	8b 50 04             	mov    0x4(%eax),%edx
c0104590:	8b 45 08             	mov    0x8(%ebp),%eax
c0104593:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104599:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010459d:	89 10                	mov    %edx,(%eax)
c010459f:	8b 45 08             	mov    0x8(%ebp),%eax
c01045a2:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c01045a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01045ab:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01045b1:	8b 12                	mov    (%edx),%edx
c01045b3:	89 50 08             	mov    %edx,0x8(%eax)
c01045b6:	8b 55 08             	mov    0x8(%ebp),%edx
c01045b9:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c01045bf:	8b 40 08             	mov    0x8(%eax),%eax
c01045c2:	89 42 0c             	mov    %eax,0xc(%edx)
c01045c5:	90                   	nop
c01045c6:	c9                   	leave  
c01045c7:	c3                   	ret    

c01045c8 <init_tty>:
c01045c8:	55                   	push   %ebp
c01045c9:	89 e5                	mov    %esp,%ebp
c01045cb:	83 ec 18             	sub    $0x18,%esp
c01045ce:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01045d5:	e9 92 00 00 00       	jmp    c010466c <init_tty+0xa4>
c01045da:	83 ec 04             	sub    $0x4,%esp
c01045dd:	68 28 08 00 00       	push   $0x828
c01045e2:	6a 00                	push   $0x0
c01045e4:	ff 75 f4             	pushl  -0xc(%ebp)
c01045e7:	e8 e3 7b 00 00       	call   c010c1cf <Memset>
c01045ec:	83 c4 10             	add    $0x10,%esp
c01045ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045f2:	8d 50 08             	lea    0x8(%eax),%edx
c01045f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045f8:	89 50 04             	mov    %edx,0x4(%eax)
c01045fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045fe:	8b 50 04             	mov    0x4(%eax),%edx
c0104601:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104604:	89 10                	mov    %edx,(%eax)
c0104606:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104609:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0104610:	00 00 00 
c0104613:	83 ec 0c             	sub    $0xc,%esp
c0104616:	ff 75 f4             	pushl  -0xc(%ebp)
c0104619:	e8 21 ff ff ff       	call   c010453f <init_screen>
c010461e:	83 c4 10             	add    $0x10,%esp
c0104621:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104624:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104629:	85 c0                	test   %eax,%eax
c010462b:	7e 38                	jle    c0104665 <init_tty+0x9d>
c010462d:	83 ec 08             	sub    $0x8,%esp
c0104630:	6a 23                	push   $0x23
c0104632:	ff 75 f4             	pushl  -0xc(%ebp)
c0104635:	e8 c6 f8 ff ff       	call   c0103f00 <out_char>
c010463a:	83 c4 10             	add    $0x10,%esp
c010463d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104640:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0104645:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010464a:	c1 f8 03             	sar    $0x3,%eax
c010464d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104653:	0f b6 c0             	movzbl %al,%eax
c0104656:	83 ec 08             	sub    $0x8,%esp
c0104659:	50                   	push   %eax
c010465a:	ff 75 f4             	pushl  -0xc(%ebp)
c010465d:	e8 9e f8 ff ff       	call   c0103f00 <out_char>
c0104662:	83 c4 10             	add    $0x10,%esp
c0104665:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010466c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104671:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104674:	0f 82 60 ff ff ff    	jb     c01045da <init_tty+0x12>
c010467a:	90                   	nop
c010467b:	c9                   	leave  
c010467c:	c3                   	ret    

c010467d <TaskTTY>:
c010467d:	55                   	push   %ebp
c010467e:	89 e5                	mov    %esp,%ebp
c0104680:	83 ec 28             	sub    $0x28,%esp
c0104683:	e8 40 ff ff ff       	call   c01045c8 <init_tty>
c0104688:	83 ec 0c             	sub    $0xc,%esp
c010468b:	6a 00                	push   $0x0
c010468d:	e8 24 f6 ff ff       	call   c0103cb6 <select_console>
c0104692:	83 c4 10             	add    $0x10,%esp
c0104695:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010469c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01046a3:	83 ec 0c             	sub    $0xc,%esp
c01046a6:	6a 7c                	push   $0x7c
c01046a8:	e8 bf cf ff ff       	call   c010166c <sys_malloc>
c01046ad:	83 c4 10             	add    $0x10,%esp
c01046b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01046b3:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01046ba:	eb 30                	jmp    c01046ec <TaskTTY+0x6f>
c01046bc:	83 ec 0c             	sub    $0xc,%esp
c01046bf:	ff 75 f4             	pushl  -0xc(%ebp)
c01046c2:	e8 f6 f9 ff ff       	call   c01040bd <tty_dev_read>
c01046c7:	83 c4 10             	add    $0x10,%esp
c01046ca:	83 ec 0c             	sub    $0xc,%esp
c01046cd:	ff 75 f4             	pushl  -0xc(%ebp)
c01046d0:	e8 12 fa ff ff       	call   c01040e7 <tty_dev_write>
c01046d5:	83 c4 10             	add    $0x10,%esp
c01046d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046db:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01046e1:	85 c0                	test   %eax,%eax
c01046e3:	75 d7                	jne    c01046bc <TaskTTY+0x3f>
c01046e5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01046ec:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01046f1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01046f4:	72 c6                	jb     c01046bc <TaskTTY+0x3f>
c01046f6:	83 ec 04             	sub    $0x4,%esp
c01046f9:	6a 12                	push   $0x12
c01046fb:	ff 75 e8             	pushl  -0x18(%ebp)
c01046fe:	6a 02                	push   $0x2
c0104700:	e8 a0 4e 00 00       	call   c01095a5 <send_rec>
c0104705:	83 c4 10             	add    $0x10,%esp
c0104708:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010470b:	8b 40 78             	mov    0x78(%eax),%eax
c010470e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104711:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104718:	74 28                	je     c0104742 <TaskTTY+0xc5>
c010471a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104721:	7f 0b                	jg     c010472e <TaskTTY+0xb1>
c0104723:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c010472a:	74 4e                	je     c010477a <TaskTTY+0xfd>
c010472c:	eb 4d                	jmp    c010477b <TaskTTY+0xfe>
c010472e:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104735:	74 21                	je     c0104758 <TaskTTY+0xdb>
c0104737:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c010473e:	74 2e                	je     c010476e <TaskTTY+0xf1>
c0104740:	eb 39                	jmp    c010477b <TaskTTY+0xfe>
c0104742:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104747:	83 ec 08             	sub    $0x8,%esp
c010474a:	ff 75 e8             	pushl  -0x18(%ebp)
c010474d:	50                   	push   %eax
c010474e:	e8 c1 fb ff ff       	call   c0104314 <tty_do_read>
c0104753:	83 c4 10             	add    $0x10,%esp
c0104756:	eb 23                	jmp    c010477b <TaskTTY+0xfe>
c0104758:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c010475d:	83 ec 08             	sub    $0x8,%esp
c0104760:	ff 75 e8             	pushl  -0x18(%ebp)
c0104763:	50                   	push   %eax
c0104764:	e8 73 fc ff ff       	call   c01043dc <tty_do_write>
c0104769:	83 c4 10             	add    $0x10,%esp
c010476c:	eb 0d                	jmp    c010477b <TaskTTY+0xfe>
c010476e:	c7 05 c4 06 11 c0 00 	movl   $0x0,0xc01106c4
c0104775:	00 00 00 
c0104778:	eb 01                	jmp    c010477b <TaskTTY+0xfe>
c010477a:	90                   	nop
c010477b:	e9 33 ff ff ff       	jmp    c01046b3 <TaskTTY+0x36>

c0104780 <keyboard_handler>:
c0104780:	55                   	push   %ebp
c0104781:	89 e5                	mov    %esp,%ebp
c0104783:	83 ec 18             	sub    $0x18,%esp
c0104786:	c7 05 c4 06 11 c0 01 	movl   $0x1,0xc01106c4
c010478d:	00 00 00 
c0104790:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104797:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010479c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c01047a1:	7f 5e                	jg     c0104801 <keyboard_handler+0x81>
c01047a3:	e8 6a bb ff ff       	call   c0100312 <disable_int>
c01047a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01047ab:	0f b7 c0             	movzwl %ax,%eax
c01047ae:	83 ec 0c             	sub    $0xc,%esp
c01047b1:	50                   	push   %eax
c01047b2:	e8 2d bb ff ff       	call   c01002e4 <in_byte>
c01047b7:	83 c4 10             	add    $0x10,%esp
c01047ba:	88 45 f3             	mov    %al,-0xd(%ebp)
c01047bd:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047c2:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c01047c6:	88 10                	mov    %dl,(%eax)
c01047c8:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047cd:	83 c0 01             	add    $0x1,%eax
c01047d0:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c01047d5:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047da:	83 c0 01             	add    $0x1,%eax
c01047dd:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01047e2:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047e7:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01047ec:	39 d0                	cmp    %edx,%eax
c01047ee:	72 0a                	jb     c01047fa <keyboard_handler+0x7a>
c01047f0:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01047f7:	fb 10 c0 
c01047fa:	e8 15 bb ff ff       	call   c0100314 <enable_int>
c01047ff:	eb 01                	jmp    c0104802 <keyboard_handler+0x82>
c0104801:	90                   	nop
c0104802:	c9                   	leave  
c0104803:	c3                   	ret    

c0104804 <read_from_keyboard_buf>:
c0104804:	55                   	push   %ebp
c0104805:	89 e5                	mov    %esp,%ebp
c0104807:	83 ec 18             	sub    $0x18,%esp
c010480a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c010480e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104813:	85 c0                	test   %eax,%eax
c0104815:	7f 06                	jg     c010481d <read_from_keyboard_buf+0x19>
c0104817:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c010481b:	eb 4b                	jmp    c0104868 <read_from_keyboard_buf+0x64>
c010481d:	e8 f0 ba ff ff       	call   c0100312 <disable_int>
c0104822:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104827:	0f b6 00             	movzbl (%eax),%eax
c010482a:	88 45 f7             	mov    %al,-0x9(%ebp)
c010482d:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104832:	83 c0 01             	add    $0x1,%eax
c0104835:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010483a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010483f:	83 e8 01             	sub    $0x1,%eax
c0104842:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104847:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c010484c:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104851:	39 d0                	cmp    %edx,%eax
c0104853:	72 0a                	jb     c010485f <read_from_keyboard_buf+0x5b>
c0104855:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c010485c:	fb 10 c0 
c010485f:	e8 b0 ba ff ff       	call   c0100314 <enable_int>
c0104864:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104868:	c9                   	leave  
c0104869:	c3                   	ret    

c010486a <keyboard_read>:
c010486a:	55                   	push   %ebp
c010486b:	89 e5                	mov    %esp,%ebp
c010486d:	83 ec 28             	sub    $0x28,%esp
c0104870:	90                   	nop
c0104871:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104876:	85 c0                	test   %eax,%eax
c0104878:	7e f7                	jle    c0104871 <keyboard_read+0x7>
c010487a:	e8 85 ff ff ff       	call   c0104804 <read_from_keyboard_buf>
c010487f:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104882:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104889:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010488d:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104891:	75 5a                	jne    c01048ed <keyboard_read+0x83>
c0104893:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104897:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c010489b:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010489f:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c01048a3:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c01048a7:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c01048ab:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c01048af:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01048b6:	eb 20                	jmp    c01048d8 <keyboard_read+0x6e>
c01048b8:	e8 47 ff ff ff       	call   c0104804 <read_from_keyboard_buf>
c01048bd:	89 c1                	mov    %eax,%ecx
c01048bf:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c01048c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01048c5:	01 d0                	add    %edx,%eax
c01048c7:	0f b6 00             	movzbl (%eax),%eax
c01048ca:	38 c1                	cmp    %al,%cl
c01048cc:	74 06                	je     c01048d4 <keyboard_read+0x6a>
c01048ce:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c01048d2:	eb 0a                	jmp    c01048de <keyboard_read+0x74>
c01048d4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01048d8:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c01048dc:	7e da                	jle    c01048b8 <keyboard_read+0x4e>
c01048de:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c01048e2:	74 68                	je     c010494c <keyboard_read+0xe2>
c01048e4:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c01048eb:	eb 5f                	jmp    c010494c <keyboard_read+0xe2>
c01048ed:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c01048f1:	75 59                	jne    c010494c <keyboard_read+0xe2>
c01048f3:	e8 0c ff ff ff       	call   c0104804 <read_from_keyboard_buf>
c01048f8:	3c 2a                	cmp    $0x2a,%al
c01048fa:	75 1d                	jne    c0104919 <keyboard_read+0xaf>
c01048fc:	e8 03 ff ff ff       	call   c0104804 <read_from_keyboard_buf>
c0104901:	3c e0                	cmp    $0xe0,%al
c0104903:	75 14                	jne    c0104919 <keyboard_read+0xaf>
c0104905:	e8 fa fe ff ff       	call   c0104804 <read_from_keyboard_buf>
c010490a:	3c 37                	cmp    $0x37,%al
c010490c:	75 0b                	jne    c0104919 <keyboard_read+0xaf>
c010490e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104915:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104919:	e8 e6 fe ff ff       	call   c0104804 <read_from_keyboard_buf>
c010491e:	3c b7                	cmp    $0xb7,%al
c0104920:	75 1d                	jne    c010493f <keyboard_read+0xd5>
c0104922:	e8 dd fe ff ff       	call   c0104804 <read_from_keyboard_buf>
c0104927:	3c e0                	cmp    $0xe0,%al
c0104929:	75 14                	jne    c010493f <keyboard_read+0xd5>
c010492b:	e8 d4 fe ff ff       	call   c0104804 <read_from_keyboard_buf>
c0104930:	3c aa                	cmp    $0xaa,%al
c0104932:	75 0b                	jne    c010493f <keyboard_read+0xd5>
c0104934:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c010493b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010493f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104943:	75 07                	jne    c010494c <keyboard_read+0xe2>
c0104945:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c010494c:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104953:	0f 84 8d 00 00 00    	je     c01049e6 <keyboard_read+0x17c>
c0104959:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0104960:	0f 84 80 00 00 00    	je     c01049e6 <keyboard_read+0x17c>
c0104966:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c010496a:	0f 94 c2             	sete   %dl
c010496d:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104971:	0f 94 c0             	sete   %al
c0104974:	09 d0                	or     %edx,%eax
c0104976:	84 c0                	test   %al,%al
c0104978:	74 07                	je     c0104981 <keyboard_read+0x117>
c010497a:	c6 05 cc 06 11 c0 01 	movb   $0x1,0xc01106cc
c0104981:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104985:	f7 d0                	not    %eax
c0104987:	c0 e8 07             	shr    $0x7,%al
c010498a:	88 45 e9             	mov    %al,-0x17(%ebp)
c010498d:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104991:	74 53                	je     c01049e6 <keyboard_read+0x17c>
c0104993:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104997:	74 4d                	je     c01049e6 <keyboard_read+0x17c>
c0104999:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c010499d:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c01049a4:	3c 01                	cmp    $0x1,%al
c01049a6:	75 04                	jne    c01049ac <keyboard_read+0x142>
c01049a8:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c01049ac:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c01049b3:	84 c0                	test   %al,%al
c01049b5:	74 04                	je     c01049bb <keyboard_read+0x151>
c01049b7:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c01049bb:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c01049bf:	89 d0                	mov    %edx,%eax
c01049c1:	01 c0                	add    %eax,%eax
c01049c3:	01 c2                	add    %eax,%edx
c01049c5:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01049c9:	01 d0                	add    %edx,%eax
c01049cb:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c01049d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01049d5:	83 ec 08             	sub    $0x8,%esp
c01049d8:	ff 75 f4             	pushl  -0xc(%ebp)
c01049db:	ff 75 08             	pushl  0x8(%ebp)
c01049de:	e8 1a 00 00 00       	call   c01049fd <in_process>
c01049e3:	83 c4 10             	add    $0x10,%esp
c01049e6:	90                   	nop
c01049e7:	c9                   	leave  
c01049e8:	c3                   	ret    

c01049e9 <init_keyboard_handler>:
c01049e9:	55                   	push   %ebp
c01049ea:	89 e5                	mov    %esp,%ebp
c01049ec:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01049f3:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c01049fa:	90                   	nop
c01049fb:	5d                   	pop    %ebp
c01049fc:	c3                   	ret    

c01049fd <in_process>:
c01049fd:	55                   	push   %ebp
c01049fe:	89 e5                	mov    %esp,%ebp
c0104a00:	83 ec 18             	sub    $0x18,%esp
c0104a03:	83 ec 04             	sub    $0x4,%esp
c0104a06:	6a 02                	push   $0x2
c0104a08:	6a 00                	push   $0x0
c0104a0a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0104a0d:	50                   	push   %eax
c0104a0e:	e8 bc 77 00 00       	call   c010c1cf <Memset>
c0104a13:	83 c4 10             	add    $0x10,%esp
c0104a16:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a19:	25 00 01 00 00       	and    $0x100,%eax
c0104a1e:	85 c0                	test   %eax,%eax
c0104a20:	75 28                	jne    c0104a4a <in_process+0x4d>
c0104a22:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a25:	0f b6 c0             	movzbl %al,%eax
c0104a28:	83 ec 08             	sub    $0x8,%esp
c0104a2b:	50                   	push   %eax
c0104a2c:	ff 75 08             	pushl  0x8(%ebp)
c0104a2f:	e8 b3 f3 ff ff       	call   c0103de7 <put_key>
c0104a34:	83 c4 10             	add    $0x10,%esp
c0104a37:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a3e:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104a45:	e9 42 01 00 00       	jmp    c0104b8c <in_process+0x18f>
c0104a4a:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104a51:	84 c0                	test   %al,%al
c0104a53:	0f 84 a9 00 00 00    	je     c0104b02 <in_process+0x105>
c0104a59:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104a5d:	0f 84 9f 00 00 00    	je     c0104b02 <in_process+0x105>
c0104a63:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104a67:	0f 84 95 00 00 00    	je     c0104b02 <in_process+0x105>
c0104a6d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a74:	74 64                	je     c0104ada <in_process+0xdd>
c0104a76:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a7d:	77 0b                	ja     c0104a8a <in_process+0x8d>
c0104a7f:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104a86:	74 64                	je     c0104aec <in_process+0xef>
c0104a88:	eb 73                	jmp    c0104afd <in_process+0x100>
c0104a8a:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104a91:	74 0b                	je     c0104a9e <in_process+0xa1>
c0104a93:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104a9a:	74 20                	je     c0104abc <in_process+0xbf>
c0104a9c:	eb 5f                	jmp    c0104afd <in_process+0x100>
c0104a9e:	83 ec 0c             	sub    $0xc,%esp
c0104aa1:	ff 75 08             	pushl  0x8(%ebp)
c0104aa4:	e8 aa f3 ff ff       	call   c0103e53 <scroll_up>
c0104aa9:	83 c4 10             	add    $0x10,%esp
c0104aac:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104ab3:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104aba:	eb 41                	jmp    c0104afd <in_process+0x100>
c0104abc:	83 ec 0c             	sub    $0xc,%esp
c0104abf:	ff 75 08             	pushl  0x8(%ebp)
c0104ac2:	e8 ce f3 ff ff       	call   c0103e95 <scroll_down>
c0104ac7:	83 c4 10             	add    $0x10,%esp
c0104aca:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104ad1:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104ad8:	eb 23                	jmp    c0104afd <in_process+0x100>
c0104ada:	83 ec 08             	sub    $0x8,%esp
c0104add:	6a 0a                	push   $0xa
c0104adf:	ff 75 08             	pushl  0x8(%ebp)
c0104ae2:	e8 19 f4 ff ff       	call   c0103f00 <out_char>
c0104ae7:	83 c4 10             	add    $0x10,%esp
c0104aea:	eb 11                	jmp    c0104afd <in_process+0x100>
c0104aec:	83 ec 08             	sub    $0x8,%esp
c0104aef:	6a 08                	push   $0x8
c0104af1:	ff 75 08             	pushl  0x8(%ebp)
c0104af4:	e8 07 f4 ff ff       	call   c0103f00 <out_char>
c0104af9:	83 c4 10             	add    $0x10,%esp
c0104afc:	90                   	nop
c0104afd:	e9 8a 00 00 00       	jmp    c0104b8c <in_process+0x18f>
c0104b02:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104b09:	74 55                	je     c0104b60 <in_process+0x163>
c0104b0b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104b12:	77 14                	ja     c0104b28 <in_process+0x12b>
c0104b14:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104b1b:	74 31                	je     c0104b4e <in_process+0x151>
c0104b1d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104b24:	74 16                	je     c0104b3c <in_process+0x13f>
c0104b26:	eb 64                	jmp    c0104b8c <in_process+0x18f>
c0104b28:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104b2f:	74 3e                	je     c0104b6f <in_process+0x172>
c0104b31:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104b38:	74 44                	je     c0104b7e <in_process+0x181>
c0104b3a:	eb 50                	jmp    c0104b8c <in_process+0x18f>
c0104b3c:	83 ec 08             	sub    $0x8,%esp
c0104b3f:	6a 0a                	push   $0xa
c0104b41:	ff 75 08             	pushl  0x8(%ebp)
c0104b44:	e8 9e f2 ff ff       	call   c0103de7 <put_key>
c0104b49:	83 c4 10             	add    $0x10,%esp
c0104b4c:	eb 3e                	jmp    c0104b8c <in_process+0x18f>
c0104b4e:	83 ec 08             	sub    $0x8,%esp
c0104b51:	6a 08                	push   $0x8
c0104b53:	ff 75 08             	pushl  0x8(%ebp)
c0104b56:	e8 8c f2 ff ff       	call   c0103de7 <put_key>
c0104b5b:	83 c4 10             	add    $0x10,%esp
c0104b5e:	eb 2c                	jmp    c0104b8c <in_process+0x18f>
c0104b60:	83 ec 0c             	sub    $0xc,%esp
c0104b63:	6a 00                	push   $0x0
c0104b65:	e8 4c f1 ff ff       	call   c0103cb6 <select_console>
c0104b6a:	83 c4 10             	add    $0x10,%esp
c0104b6d:	eb 1d                	jmp    c0104b8c <in_process+0x18f>
c0104b6f:	83 ec 0c             	sub    $0xc,%esp
c0104b72:	6a 01                	push   $0x1
c0104b74:	e8 3d f1 ff ff       	call   c0103cb6 <select_console>
c0104b79:	83 c4 10             	add    $0x10,%esp
c0104b7c:	eb 0e                	jmp    c0104b8c <in_process+0x18f>
c0104b7e:	83 ec 0c             	sub    $0xc,%esp
c0104b81:	6a 02                	push   $0x2
c0104b83:	e8 2e f1 ff ff       	call   c0103cb6 <select_console>
c0104b88:	83 c4 10             	add    $0x10,%esp
c0104b8b:	90                   	nop
c0104b8c:	90                   	nop
c0104b8d:	c9                   	leave  
c0104b8e:	c3                   	ret    

c0104b8f <open>:
c0104b8f:	55                   	push   %ebp
c0104b90:	89 e5                	mov    %esp,%ebp
c0104b92:	83 ec 18             	sub    $0x18,%esp
c0104b95:	83 ec 0c             	sub    $0xc,%esp
c0104b98:	6a 7c                	push   $0x7c
c0104b9a:	e8 cd ca ff ff       	call   c010166c <sys_malloc>
c0104b9f:	83 c4 10             	add    $0x10,%esp
c0104ba2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104ba5:	83 ec 04             	sub    $0x4,%esp
c0104ba8:	6a 7c                	push   $0x7c
c0104baa:	6a 00                	push   $0x0
c0104bac:	ff 75 f4             	pushl  -0xc(%ebp)
c0104baf:	e8 1b 76 00 00       	call   c010c1cf <Memset>
c0104bb4:	83 c4 10             	add    $0x10,%esp
c0104bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bba:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104bc1:	83 ec 0c             	sub    $0xc,%esp
c0104bc4:	ff 75 08             	pushl  0x8(%ebp)
c0104bc7:	e8 32 14 00 00       	call   c0105ffe <get_physical_address>
c0104bcc:	83 c4 10             	add    $0x10,%esp
c0104bcf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104bd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bd5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104bd8:	89 50 44             	mov    %edx,0x44(%eax)
c0104bdb:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104bde:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104be1:	89 50 74             	mov    %edx,0x74(%eax)
c0104be4:	83 ec 0c             	sub    $0xc,%esp
c0104be7:	ff 75 08             	pushl  0x8(%ebp)
c0104bea:	e8 19 76 00 00       	call   c010c208 <Strlen>
c0104bef:	83 c4 10             	add    $0x10,%esp
c0104bf2:	89 c2                	mov    %eax,%edx
c0104bf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bf7:	89 50 40             	mov    %edx,0x40(%eax)
c0104bfa:	83 ec 04             	sub    $0x4,%esp
c0104bfd:	6a 02                	push   $0x2
c0104bff:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c02:	6a 03                	push   $0x3
c0104c04:	e8 9c 49 00 00       	call   c01095a5 <send_rec>
c0104c09:	83 c4 10             	add    $0x10,%esp
c0104c0c:	83 ec 08             	sub    $0x8,%esp
c0104c0f:	6a 7c                	push   $0x7c
c0104c11:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c14:	e8 68 ca ff ff       	call   c0101681 <sys_free>
c0104c19:	83 c4 10             	add    $0x10,%esp
c0104c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c1f:	8b 40 50             	mov    0x50(%eax),%eax
c0104c22:	c9                   	leave  
c0104c23:	c3                   	ret    

c0104c24 <read>:
c0104c24:	55                   	push   %ebp
c0104c25:	89 e5                	mov    %esp,%ebp
c0104c27:	83 ec 38             	sub    $0x38,%esp
c0104c2a:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104c31:	83 ec 0c             	sub    $0xc,%esp
c0104c34:	ff 75 dc             	pushl  -0x24(%ebp)
c0104c37:	e8 30 ca ff ff       	call   c010166c <sys_malloc>
c0104c3c:	83 c4 10             	add    $0x10,%esp
c0104c3f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104c42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104c45:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104c4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104c4d:	83 ec 0c             	sub    $0xc,%esp
c0104c50:	ff 75 0c             	pushl  0xc(%ebp)
c0104c53:	e8 a6 13 00 00       	call   c0105ffe <get_physical_address>
c0104c58:	83 c4 10             	add    $0x10,%esp
c0104c5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c61:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104c66:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104c69:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104c6c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104c71:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104c74:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104c7b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104c82:	8b 55 10             	mov    0x10(%ebp),%edx
c0104c85:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c88:	01 d0                	add    %edx,%eax
c0104c8a:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104c8d:	0f 83 a8 00 00 00    	jae    c0104d3b <read+0x117>
c0104c93:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104c96:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104c99:	05 00 10 00 00       	add    $0x1000,%eax
c0104c9e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104ca1:	8b 45 10             	mov    0x10(%ebp),%eax
c0104ca4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104ca7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104caa:	83 ec 04             	sub    $0x4,%esp
c0104cad:	50                   	push   %eax
c0104cae:	6a 00                	push   $0x0
c0104cb0:	ff 75 d8             	pushl  -0x28(%ebp)
c0104cb3:	e8 17 75 00 00       	call   c010c1cf <Memset>
c0104cb8:	83 c4 10             	add    $0x10,%esp
c0104cbb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cbe:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104cc5:	8b 55 08             	mov    0x8(%ebp),%edx
c0104cc8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ccb:	89 50 50             	mov    %edx,0x50(%eax)
c0104cce:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cd1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104cd4:	89 50 10             	mov    %edx,0x10(%eax)
c0104cd7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cda:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104cdd:	89 50 60             	mov    %edx,0x60(%eax)
c0104ce0:	83 ec 04             	sub    $0x4,%esp
c0104ce3:	6a 02                	push   $0x2
c0104ce5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104ce8:	6a 03                	push   $0x3
c0104cea:	e8 b6 48 00 00       	call   c01095a5 <send_rec>
c0104cef:	83 c4 10             	add    $0x10,%esp
c0104cf2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cf5:	8b 40 60             	mov    0x60(%eax),%eax
c0104cf8:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104cfb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104cfe:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104d01:	8b 45 10             	mov    0x10(%ebp),%eax
c0104d04:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104d07:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104d0a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104d0d:	89 45 10             	mov    %eax,0x10(%ebp)
c0104d10:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104d17:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104d1e:	83 ec 0c             	sub    $0xc,%esp
c0104d21:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d24:	e8 d5 12 00 00       	call   c0105ffe <get_physical_address>
c0104d29:	83 c4 10             	add    $0x10,%esp
c0104d2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104d2f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104d33:	0f 85 6e ff ff ff    	jne    c0104ca7 <read+0x83>
c0104d39:	eb 54                	jmp    c0104d8f <read+0x16b>
c0104d3b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104d3e:	83 ec 04             	sub    $0x4,%esp
c0104d41:	50                   	push   %eax
c0104d42:	6a 00                	push   $0x0
c0104d44:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d47:	e8 83 74 00 00       	call   c010c1cf <Memset>
c0104d4c:	83 c4 10             	add    $0x10,%esp
c0104d4f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d52:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104d59:	8b 55 08             	mov    0x8(%ebp),%edx
c0104d5c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d5f:	89 50 50             	mov    %edx,0x50(%eax)
c0104d62:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d65:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104d68:	89 50 10             	mov    %edx,0x10(%eax)
c0104d6b:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d6e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d71:	89 50 60             	mov    %edx,0x60(%eax)
c0104d74:	83 ec 04             	sub    $0x4,%esp
c0104d77:	6a 02                	push   $0x2
c0104d79:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d7c:	6a 03                	push   $0x3
c0104d7e:	e8 22 48 00 00       	call   c01095a5 <send_rec>
c0104d83:	83 c4 10             	add    $0x10,%esp
c0104d86:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d89:	8b 40 60             	mov    0x60(%eax),%eax
c0104d8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104d8f:	83 ec 08             	sub    $0x8,%esp
c0104d92:	ff 75 dc             	pushl  -0x24(%ebp)
c0104d95:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d98:	e8 e4 c8 ff ff       	call   c0101681 <sys_free>
c0104d9d:	83 c4 10             	add    $0x10,%esp
c0104da0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104da3:	c9                   	leave  
c0104da4:	c3                   	ret    

c0104da5 <write>:
c0104da5:	55                   	push   %ebp
c0104da6:	89 e5                	mov    %esp,%ebp
c0104da8:	83 ec 18             	sub    $0x18,%esp
c0104dab:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104db2:	83 ec 0c             	sub    $0xc,%esp
c0104db5:	ff 75 f4             	pushl  -0xc(%ebp)
c0104db8:	e8 af c8 ff ff       	call   c010166c <sys_malloc>
c0104dbd:	83 c4 10             	add    $0x10,%esp
c0104dc0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104dc3:	83 ec 0c             	sub    $0xc,%esp
c0104dc6:	ff 75 0c             	pushl  0xc(%ebp)
c0104dc9:	e8 30 12 00 00       	call   c0105ffe <get_physical_address>
c0104dce:	83 c4 10             	add    $0x10,%esp
c0104dd1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104dd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dd7:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104dde:	8b 55 08             	mov    0x8(%ebp),%edx
c0104de1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104de4:	89 50 50             	mov    %edx,0x50(%eax)
c0104de7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dea:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104ded:	89 50 10             	mov    %edx,0x10(%eax)
c0104df0:	8b 55 10             	mov    0x10(%ebp),%edx
c0104df3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104df6:	89 50 60             	mov    %edx,0x60(%eax)
c0104df9:	83 ec 04             	sub    $0x4,%esp
c0104dfc:	6a 02                	push   $0x2
c0104dfe:	ff 75 f0             	pushl  -0x10(%ebp)
c0104e01:	6a 03                	push   $0x3
c0104e03:	e8 9d 47 00 00       	call   c01095a5 <send_rec>
c0104e08:	83 c4 10             	add    $0x10,%esp
c0104e0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e0e:	8b 40 60             	mov    0x60(%eax),%eax
c0104e11:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104e14:	83 ec 08             	sub    $0x8,%esp
c0104e17:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e1a:	ff 75 f0             	pushl  -0x10(%ebp)
c0104e1d:	e8 5f c8 ff ff       	call   c0101681 <sys_free>
c0104e22:	83 c4 10             	add    $0x10,%esp
c0104e25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104e28:	c9                   	leave  
c0104e29:	c3                   	ret    

c0104e2a <close>:
c0104e2a:	55                   	push   %ebp
c0104e2b:	89 e5                	mov    %esp,%ebp
c0104e2d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e33:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104e3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e3d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104e40:	83 ec 04             	sub    $0x4,%esp
c0104e43:	6a 02                	push   $0x2
c0104e45:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e4b:	50                   	push   %eax
c0104e4c:	6a 03                	push   $0x3
c0104e4e:	e8 52 47 00 00       	call   c01095a5 <send_rec>
c0104e53:	83 c4 10             	add    $0x10,%esp
c0104e56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e59:	83 f8 65             	cmp    $0x65,%eax
c0104e5c:	74 19                	je     c0104e77 <close+0x4d>
c0104e5e:	6a 13                	push   $0x13
c0104e60:	68 27 b5 10 c0       	push   $0xc010b527
c0104e65:	68 27 b5 10 c0       	push   $0xc010b527
c0104e6a:	68 33 b5 10 c0       	push   $0xc010b533
c0104e6f:	e8 c1 3a 00 00       	call   c0108935 <assertion_failure>
c0104e74:	83 c4 10             	add    $0x10,%esp
c0104e77:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104e7a:	c9                   	leave  
c0104e7b:	c3                   	ret    

c0104e7c <wait>:
c0104e7c:	55                   	push   %ebp
c0104e7d:	89 e5                	mov    %esp,%ebp
c0104e7f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e85:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104e8c:	83 ec 04             	sub    $0x4,%esp
c0104e8f:	6a 01                	push   $0x1
c0104e91:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e97:	50                   	push   %eax
c0104e98:	6a 03                	push   $0x3
c0104e9a:	e8 06 47 00 00       	call   c01095a5 <send_rec>
c0104e9f:	83 c4 10             	add    $0x10,%esp
c0104ea2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104ea5:	89 c2                	mov    %eax,%edx
c0104ea7:	8b 45 08             	mov    0x8(%ebp),%eax
c0104eaa:	89 10                	mov    %edx,(%eax)
c0104eac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104eaf:	83 f8 21             	cmp    $0x21,%eax
c0104eb2:	74 05                	je     c0104eb9 <wait+0x3d>
c0104eb4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104eb7:	eb 05                	jmp    c0104ebe <wait+0x42>
c0104eb9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104ebe:	c9                   	leave  
c0104ebf:	c3                   	ret    

c0104ec0 <exit>:
c0104ec0:	55                   	push   %ebp
c0104ec1:	89 e5                	mov    %esp,%ebp
c0104ec3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ec9:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104ed0:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ed3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104ed6:	83 ec 04             	sub    $0x4,%esp
c0104ed9:	6a 01                	push   $0x1
c0104edb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ee1:	50                   	push   %eax
c0104ee2:	6a 03                	push   $0x3
c0104ee4:	e8 bc 46 00 00       	call   c01095a5 <send_rec>
c0104ee9:	83 c4 10             	add    $0x10,%esp
c0104eec:	90                   	nop
c0104eed:	c9                   	leave  
c0104eee:	c3                   	ret    

c0104eef <fork>:
c0104eef:	55                   	push   %ebp
c0104ef0:	89 e5                	mov    %esp,%ebp
c0104ef2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ef8:	83 ec 04             	sub    $0x4,%esp
c0104efb:	6a 7c                	push   $0x7c
c0104efd:	6a 00                	push   $0x0
c0104eff:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f05:	50                   	push   %eax
c0104f06:	e8 c4 72 00 00       	call   c010c1cf <Memset>
c0104f0b:	83 c4 10             	add    $0x10,%esp
c0104f0e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104f15:	83 ec 04             	sub    $0x4,%esp
c0104f18:	6a 01                	push   $0x1
c0104f1a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f20:	50                   	push   %eax
c0104f21:	6a 03                	push   $0x3
c0104f23:	e8 7d 46 00 00       	call   c01095a5 <send_rec>
c0104f28:	83 c4 10             	add    $0x10,%esp
c0104f2b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104f32:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f35:	c9                   	leave  
c0104f36:	c3                   	ret    

c0104f37 <getpid>:
c0104f37:	55                   	push   %ebp
c0104f38:	89 e5                	mov    %esp,%ebp
c0104f3a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f40:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104f47:	83 ec 04             	sub    $0x4,%esp
c0104f4a:	6a 05                	push   $0x5
c0104f4c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f52:	50                   	push   %eax
c0104f53:	6a 03                	push   $0x3
c0104f55:	e8 4b 46 00 00       	call   c01095a5 <send_rec>
c0104f5a:	83 c4 10             	add    $0x10,%esp
c0104f5d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f60:	c9                   	leave  
c0104f61:	c3                   	ret    

c0104f62 <exec>:
c0104f62:	55                   	push   %ebp
c0104f63:	89 e5                	mov    %esp,%ebp
c0104f65:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f6b:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104f72:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f75:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104f78:	83 ec 0c             	sub    $0xc,%esp
c0104f7b:	ff 75 08             	pushl  0x8(%ebp)
c0104f7e:	e8 85 72 00 00       	call   c010c208 <Strlen>
c0104f83:	83 c4 10             	add    $0x10,%esp
c0104f86:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104f89:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104f90:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104f97:	83 ec 04             	sub    $0x4,%esp
c0104f9a:	6a 01                	push   $0x1
c0104f9c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104fa2:	50                   	push   %eax
c0104fa3:	6a 03                	push   $0x3
c0104fa5:	e8 fb 45 00 00       	call   c01095a5 <send_rec>
c0104faa:	83 c4 10             	add    $0x10,%esp
c0104fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104fb0:	83 f8 65             	cmp    $0x65,%eax
c0104fb3:	74 19                	je     c0104fce <exec+0x6c>
c0104fb5:	6a 19                	push   $0x19
c0104fb7:	68 4b b5 10 c0       	push   $0xc010b54b
c0104fbc:	68 4b b5 10 c0       	push   $0xc010b54b
c0104fc1:	68 56 b5 10 c0       	push   $0xc010b556
c0104fc6:	e8 6a 39 00 00       	call   c0108935 <assertion_failure>
c0104fcb:	83 c4 10             	add    $0x10,%esp
c0104fce:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104fd1:	c9                   	leave  
c0104fd2:	c3                   	ret    

c0104fd3 <execv>:
c0104fd3:	55                   	push   %ebp
c0104fd4:	89 e5                	mov    %esp,%ebp
c0104fd6:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104fdc:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104fe3:	83 ec 0c             	sub    $0xc,%esp
c0104fe6:	ff 75 e0             	pushl  -0x20(%ebp)
c0104fe9:	e8 7e c6 ff ff       	call   c010166c <sys_malloc>
c0104fee:	83 c4 10             	add    $0x10,%esp
c0104ff1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104ff4:	66 87 db             	xchg   %bx,%bx
c0104ff7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104ffa:	83 ec 04             	sub    $0x4,%esp
c0104ffd:	50                   	push   %eax
c0104ffe:	6a 00                	push   $0x0
c0105000:	ff 75 dc             	pushl  -0x24(%ebp)
c0105003:	e8 c7 71 00 00       	call   c010c1cf <Memset>
c0105008:	83 c4 10             	add    $0x10,%esp
c010500b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010500e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105011:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105018:	eb 23                	jmp    c010503d <execv+0x6a>
c010501a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010501d:	8b 00                	mov    (%eax),%eax
c010501f:	83 ec 08             	sub    $0x8,%esp
c0105022:	50                   	push   %eax
c0105023:	68 6e b5 10 c0       	push   $0xc010b56e
c0105028:	e8 ab 35 00 00       	call   c01085d8 <Printf>
c010502d:	83 c4 10             	add    $0x10,%esp
c0105030:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0105034:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105037:	83 c0 04             	add    $0x4,%eax
c010503a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010503d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105040:	8b 00                	mov    (%eax),%eax
c0105042:	85 c0                	test   %eax,%eax
c0105044:	75 d4                	jne    c010501a <execv+0x47>
c0105046:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105049:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010504c:	01 d0                	add    %edx,%eax
c010504e:	c6 00 00             	movb   $0x0,(%eax)
c0105051:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105054:	83 c0 04             	add    $0x4,%eax
c0105057:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010505a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010505d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105060:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105063:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105066:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010506d:	eb 5b                	jmp    c01050ca <execv+0xf7>
c010506f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105072:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105075:	01 c2                	add    %eax,%edx
c0105077:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010507a:	89 10                	mov    %edx,(%eax)
c010507c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010507f:	8b 00                	mov    (%eax),%eax
c0105081:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0105084:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0105087:	01 ca                	add    %ecx,%edx
c0105089:	83 ec 08             	sub    $0x8,%esp
c010508c:	50                   	push   %eax
c010508d:	52                   	push   %edx
c010508e:	e8 5b 71 00 00       	call   c010c1ee <Strcpy>
c0105093:	83 c4 10             	add    $0x10,%esp
c0105096:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105099:	8b 00                	mov    (%eax),%eax
c010509b:	83 ec 0c             	sub    $0xc,%esp
c010509e:	50                   	push   %eax
c010509f:	e8 64 71 00 00       	call   c010c208 <Strlen>
c01050a4:	83 c4 10             	add    $0x10,%esp
c01050a7:	01 45 f0             	add    %eax,-0x10(%ebp)
c01050aa:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01050ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050b0:	01 d0                	add    %edx,%eax
c01050b2:	c6 00 00             	movb   $0x0,(%eax)
c01050b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050b8:	83 c0 01             	add    $0x1,%eax
c01050bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050be:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c01050c2:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c01050c6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01050ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01050cd:	8b 00                	mov    (%eax),%eax
c01050cf:	85 c0                	test   %eax,%eax
c01050d1:	75 9c                	jne    c010506f <execv+0x9c>
c01050d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050d6:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c01050db:	29 c2                	sub    %eax,%edx
c01050dd:	89 d0                	mov    %edx,%eax
c01050df:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01050e2:	83 ec 0c             	sub    $0xc,%esp
c01050e5:	ff 75 08             	pushl  0x8(%ebp)
c01050e8:	e8 11 0f 00 00       	call   c0105ffe <get_physical_address>
c01050ed:	83 c4 10             	add    $0x10,%esp
c01050f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01050f3:	83 ec 0c             	sub    $0xc,%esp
c01050f6:	ff 75 dc             	pushl  -0x24(%ebp)
c01050f9:	e8 00 0f 00 00       	call   c0105ffe <get_physical_address>
c01050fe:	83 c4 10             	add    $0x10,%esp
c0105101:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105104:	83 ec 0c             	sub    $0xc,%esp
c0105107:	ff 75 d8             	pushl  -0x28(%ebp)
c010510a:	e8 ef 0e 00 00       	call   c0105ffe <get_physical_address>
c010510f:	83 c4 10             	add    $0x10,%esp
c0105112:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105115:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c010511c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010511f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105122:	83 ec 0c             	sub    $0xc,%esp
c0105125:	ff 75 08             	pushl  0x8(%ebp)
c0105128:	e8 db 70 00 00       	call   c010c208 <Strlen>
c010512d:	83 c4 10             	add    $0x10,%esp
c0105130:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105133:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105136:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010513c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010513f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105145:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105148:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010514e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105151:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105157:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010515a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105160:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105163:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105166:	29 c2                	sub    %eax,%edx
c0105168:	89 d0                	mov    %edx,%eax
c010516a:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0105170:	83 ec 04             	sub    $0x4,%esp
c0105173:	6a 01                	push   $0x1
c0105175:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c010517b:	50                   	push   %eax
c010517c:	6a 03                	push   $0x3
c010517e:	e8 22 44 00 00       	call   c01095a5 <send_rec>
c0105183:	83 c4 10             	add    $0x10,%esp
c0105186:	83 ec 08             	sub    $0x8,%esp
c0105189:	68 00 04 00 00       	push   $0x400
c010518e:	ff 75 dc             	pushl  -0x24(%ebp)
c0105191:	e8 eb c4 ff ff       	call   c0101681 <sys_free>
c0105196:	83 c4 10             	add    $0x10,%esp
c0105199:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010519c:	83 f8 65             	cmp    $0x65,%eax
c010519f:	74 1c                	je     c01051bd <execv+0x1ea>
c01051a1:	68 95 00 00 00       	push   $0x95
c01051a6:	68 4b b5 10 c0       	push   $0xc010b54b
c01051ab:	68 4b b5 10 c0       	push   $0xc010b54b
c01051b0:	68 56 b5 10 c0       	push   $0xc010b556
c01051b5:	e8 7b 37 00 00       	call   c0108935 <assertion_failure>
c01051ba:	83 c4 10             	add    $0x10,%esp
c01051bd:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01051c0:	c9                   	leave  
c01051c1:	c3                   	ret    

c01051c2 <execl>:
c01051c2:	55                   	push   %ebp
c01051c3:	89 e5                	mov    %esp,%ebp
c01051c5:	83 ec 18             	sub    $0x18,%esp
c01051c8:	8d 45 0c             	lea    0xc(%ebp),%eax
c01051cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01051ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01051d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01051d4:	83 ec 08             	sub    $0x8,%esp
c01051d7:	ff 75 f0             	pushl  -0x10(%ebp)
c01051da:	ff 75 08             	pushl  0x8(%ebp)
c01051dd:	e8 f1 fd ff ff       	call   c0104fd3 <execv>
c01051e2:	83 c4 10             	add    $0x10,%esp
c01051e5:	c9                   	leave  
c01051e6:	c3                   	ret    

c01051e7 <TaskMM>:
c01051e7:	55                   	push   %ebp
c01051e8:	89 e5                	mov    %esp,%ebp
c01051ea:	83 ec 28             	sub    $0x28,%esp
c01051ed:	83 ec 0c             	sub    $0xc,%esp
c01051f0:	6a 7c                	push   $0x7c
c01051f2:	e8 75 c4 ff ff       	call   c010166c <sys_malloc>
c01051f7:	83 c4 10             	add    $0x10,%esp
c01051fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01051fd:	83 ec 0c             	sub    $0xc,%esp
c0105200:	6a 7c                	push   $0x7c
c0105202:	e8 65 c4 ff ff       	call   c010166c <sys_malloc>
c0105207:	83 c4 10             	add    $0x10,%esp
c010520a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010520d:	83 ec 04             	sub    $0x4,%esp
c0105210:	6a 12                	push   $0x12
c0105212:	ff 75 f0             	pushl  -0x10(%ebp)
c0105215:	6a 02                	push   $0x2
c0105217:	e8 89 43 00 00       	call   c01095a5 <send_rec>
c010521c:	83 c4 10             	add    $0x10,%esp
c010521f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105222:	8b 40 78             	mov    0x78(%eax),%eax
c0105225:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105228:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010522b:	8b 00                	mov    (%eax),%eax
c010522d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105230:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105237:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010523a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0105241:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105244:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c010524b:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c010524f:	74 4e                	je     c010529f <TaskMM+0xb8>
c0105251:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105255:	7f 08                	jg     c010525f <TaskMM+0x78>
c0105257:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c010525b:	74 28                	je     c0105285 <TaskMM+0x9e>
c010525d:	eb 71                	jmp    c01052d0 <TaskMM+0xe9>
c010525f:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0105263:	74 08                	je     c010526d <TaskMM+0x86>
c0105265:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0105269:	74 4e                	je     c01052b9 <TaskMM+0xd2>
c010526b:	eb 63                	jmp    c01052d0 <TaskMM+0xe9>
c010526d:	83 ec 0c             	sub    $0xc,%esp
c0105270:	ff 75 f0             	pushl  -0x10(%ebp)
c0105273:	e8 d0 04 00 00       	call   c0105748 <do_fork>
c0105278:	83 c4 10             	add    $0x10,%esp
c010527b:	89 c2                	mov    %eax,%edx
c010527d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105280:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105283:	eb 5c                	jmp    c01052e1 <TaskMM+0xfa>
c0105285:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010528c:	66 87 db             	xchg   %bx,%bx
c010528f:	83 ec 0c             	sub    $0xc,%esp
c0105292:	ff 75 f0             	pushl  -0x10(%ebp)
c0105295:	e8 95 00 00 00       	call   c010532f <do_exec>
c010529a:	83 c4 10             	add    $0x10,%esp
c010529d:	eb 42                	jmp    c01052e1 <TaskMM+0xfa>
c010529f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01052a6:	83 ec 08             	sub    $0x8,%esp
c01052a9:	ff 75 e0             	pushl  -0x20(%ebp)
c01052ac:	ff 75 f0             	pushl  -0x10(%ebp)
c01052af:	e8 02 05 00 00       	call   c01057b6 <do_exit>
c01052b4:	83 c4 10             	add    $0x10,%esp
c01052b7:	eb 28                	jmp    c01052e1 <TaskMM+0xfa>
c01052b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01052c0:	83 ec 0c             	sub    $0xc,%esp
c01052c3:	ff 75 f0             	pushl  -0x10(%ebp)
c01052c6:	e8 75 05 00 00       	call   c0105840 <do_wait>
c01052cb:	83 c4 10             	add    $0x10,%esp
c01052ce:	eb 11                	jmp    c01052e1 <TaskMM+0xfa>
c01052d0:	83 ec 0c             	sub    $0xc,%esp
c01052d3:	68 78 b5 10 c0       	push   $0xc010b578
c01052d8:	e8 3a 36 00 00       	call   c0108917 <panic>
c01052dd:	83 c4 10             	add    $0x10,%esp
c01052e0:	90                   	nop
c01052e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01052e5:	0f 84 22 ff ff ff    	je     c010520d <TaskMM+0x26>
c01052eb:	83 ec 0c             	sub    $0xc,%esp
c01052ee:	6a 03                	push   $0x3
c01052f0:	e8 af 31 00 00       	call   c01084a4 <delay>
c01052f5:	83 c4 10             	add    $0x10,%esp
c01052f8:	83 ec 04             	sub    $0x4,%esp
c01052fb:	ff 75 e4             	pushl  -0x1c(%ebp)
c01052fe:	ff 75 ec             	pushl  -0x14(%ebp)
c0105301:	6a 01                	push   $0x1
c0105303:	e8 9d 42 00 00       	call   c01095a5 <send_rec>
c0105308:	83 c4 10             	add    $0x10,%esp
c010530b:	e9 fd fe ff ff       	jmp    c010520d <TaskMM+0x26>

c0105310 <alloc_mem>:
c0105310:	55                   	push   %ebp
c0105311:	89 e5                	mov    %esp,%ebp
c0105313:	83 ec 10             	sub    $0x10,%esp
c0105316:	8b 45 08             	mov    0x8(%ebp),%eax
c0105319:	83 e8 08             	sub    $0x8,%eax
c010531c:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0105322:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105327:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010532a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010532d:	c9                   	leave  
c010532e:	c3                   	ret    

c010532f <do_exec>:
c010532f:	55                   	push   %ebp
c0105330:	89 e5                	mov    %esp,%ebp
c0105332:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105338:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010533f:	65 76 5f 
c0105342:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c0105349:	74 79 31 
c010534c:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105353:	00 00 
c0105355:	83 ec 08             	sub    $0x8,%esp
c0105358:	6a 00                	push   $0x0
c010535a:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c0105360:	50                   	push   %eax
c0105361:	e8 29 f8 ff ff       	call   c0104b8f <open>
c0105366:	83 c4 10             	add    $0x10,%esp
c0105369:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010536c:	8b 45 08             	mov    0x8(%ebp),%eax
c010536f:	8b 00                	mov    (%eax),%eax
c0105371:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105374:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c010537b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010537e:	83 ec 0c             	sub    $0xc,%esp
c0105381:	50                   	push   %eax
c0105382:	e8 e5 c2 ff ff       	call   c010166c <sys_malloc>
c0105387:	83 c4 10             	add    $0x10,%esp
c010538a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010538d:	83 ec 04             	sub    $0x4,%esp
c0105390:	ff 75 d0             	pushl  -0x30(%ebp)
c0105393:	6a 00                	push   $0x0
c0105395:	ff 75 cc             	pushl  -0x34(%ebp)
c0105398:	e8 32 6e 00 00       	call   c010c1cf <Memset>
c010539d:	83 c4 10             	add    $0x10,%esp
c01053a0:	83 ec 04             	sub    $0x4,%esp
c01053a3:	6a 0c                	push   $0xc
c01053a5:	6a 00                	push   $0x0
c01053a7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01053ad:	50                   	push   %eax
c01053ae:	e8 1c 6e 00 00       	call   c010c1cf <Memset>
c01053b3:	83 c4 10             	add    $0x10,%esp
c01053b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01053b9:	8b 40 44             	mov    0x44(%eax),%eax
c01053bc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01053bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01053c2:	8b 40 40             	mov    0x40(%eax),%eax
c01053c5:	83 ec 08             	sub    $0x8,%esp
c01053c8:	50                   	push   %eax
c01053c9:	ff 75 c8             	pushl  -0x38(%ebp)
c01053cc:	e8 de 0a 00 00       	call   c0105eaf <alloc_virtual_memory>
c01053d1:	83 c4 10             	add    $0x10,%esp
c01053d4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01053d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01053da:	8b 40 40             	mov    0x40(%eax),%eax
c01053dd:	89 c2                	mov    %eax,%edx
c01053df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01053e2:	83 ec 04             	sub    $0x4,%esp
c01053e5:	52                   	push   %edx
c01053e6:	50                   	push   %eax
c01053e7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01053ed:	50                   	push   %eax
c01053ee:	e8 29 19 00 00       	call   c0106d1c <Memcpy>
c01053f3:	83 c4 10             	add    $0x10,%esp
c01053f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01053f9:	8b 40 40             	mov    0x40(%eax),%eax
c01053fc:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105403:	00 
c0105404:	83 ec 08             	sub    $0x8,%esp
c0105407:	6a 00                	push   $0x0
c0105409:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010540f:	50                   	push   %eax
c0105410:	e8 7a f7 ff ff       	call   c0104b8f <open>
c0105415:	83 c4 10             	add    $0x10,%esp
c0105418:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010541b:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010541f:	75 15                	jne    c0105436 <do_exec+0x107>
c0105421:	83 ec 0c             	sub    $0xc,%esp
c0105424:	68 89 b5 10 c0       	push   $0xc010b589
c0105429:	e8 aa 31 00 00       	call   c01085d8 <Printf>
c010542e:	83 c4 10             	add    $0x10,%esp
c0105431:	e9 10 03 00 00       	jmp    c0105746 <do_exec+0x417>
c0105436:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010543d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105440:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105443:	01 d0                	add    %edx,%eax
c0105445:	83 ec 04             	sub    $0x4,%esp
c0105448:	68 00 10 00 00       	push   $0x1000
c010544d:	50                   	push   %eax
c010544e:	ff 75 c0             	pushl  -0x40(%ebp)
c0105451:	e8 ce f7 ff ff       	call   c0104c24 <read>
c0105456:	83 c4 10             	add    $0x10,%esp
c0105459:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010545c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010545f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0105462:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0105466:	74 0a                	je     c0105472 <do_exec+0x143>
c0105468:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010546b:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c010546e:	7d 05                	jge    c0105475 <do_exec+0x146>
c0105470:	eb cb                	jmp    c010543d <do_exec+0x10e>
c0105472:	90                   	nop
c0105473:	eb 01                	jmp    c0105476 <do_exec+0x147>
c0105475:	90                   	nop
c0105476:	83 ec 0c             	sub    $0xc,%esp
c0105479:	ff 75 c0             	pushl  -0x40(%ebp)
c010547c:	e8 a9 f9 ff ff       	call   c0104e2a <close>
c0105481:	83 c4 10             	add    $0x10,%esp
c0105484:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105487:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010548a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010548d:	8b 40 18             	mov    0x18(%eax),%eax
c0105490:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105493:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010549a:	e9 04 01 00 00       	jmp    c01055a3 <do_exec+0x274>
c010549f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01054a2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c01054a6:	0f b7 d0             	movzwl %ax,%edx
c01054a9:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01054ac:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c01054b0:	0f b7 c0             	movzwl %ax,%eax
c01054b3:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c01054b7:	01 c2                	add    %eax,%edx
c01054b9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01054bc:	01 d0                	add    %edx,%eax
c01054be:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01054c1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054c4:	8b 40 10             	mov    0x10(%eax),%eax
c01054c7:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01054ca:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01054cd:	05 ff 0f 00 00       	add    $0xfff,%eax
c01054d2:	c1 e8 0c             	shr    $0xc,%eax
c01054d5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01054d8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054db:	8b 40 08             	mov    0x8(%eax),%eax
c01054de:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01054e1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01054e8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01054eb:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c01054ee:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01054f1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054f4:	8b 50 04             	mov    0x4(%eax),%edx
c01054f7:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01054fa:	01 d0                	add    %edx,%eax
c01054fc:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01054ff:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105503:	0f 84 95 00 00 00    	je     c010559e <do_exec+0x26f>
c0105509:	83 ec 04             	sub    $0x4,%esp
c010550c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010550f:	ff 75 a8             	pushl  -0x58(%ebp)
c0105512:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105515:	e8 a0 07 00 00       	call   c0105cba <get_virtual_address_start_with_addr>
c010551a:	83 c4 10             	add    $0x10,%esp
c010551d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105520:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105523:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105526:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010552d:	eb 41                	jmp    c0105570 <do_exec+0x241>
c010552f:	83 ec 08             	sub    $0x8,%esp
c0105532:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105535:	ff 75 e8             	pushl  -0x18(%ebp)
c0105538:	e8 f3 0a 00 00       	call   c0106030 <alloc_physical_memory_of_proc>
c010553d:	83 c4 10             	add    $0x10,%esp
c0105540:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105543:	83 ec 08             	sub    $0x8,%esp
c0105546:	68 00 10 00 00       	push   $0x1000
c010554b:	ff 75 94             	pushl  -0x6c(%ebp)
c010554e:	e8 5c 09 00 00       	call   c0105eaf <alloc_virtual_memory>
c0105553:	83 c4 10             	add    $0x10,%esp
c0105556:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105559:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010555d:	75 06                	jne    c0105565 <do_exec+0x236>
c010555f:	8b 45 90             	mov    -0x70(%ebp),%eax
c0105562:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105565:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c010556c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0105570:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105573:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105576:	77 b7                	ja     c010552f <do_exec+0x200>
c0105578:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010557b:	8b 40 10             	mov    0x10(%eax),%eax
c010557e:	89 c1                	mov    %eax,%ecx
c0105580:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105583:	8b 50 04             	mov    0x4(%eax),%edx
c0105586:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105589:	01 c2                	add    %eax,%edx
c010558b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010558e:	83 ec 04             	sub    $0x4,%esp
c0105591:	51                   	push   %ecx
c0105592:	52                   	push   %edx
c0105593:	50                   	push   %eax
c0105594:	e8 83 17 00 00       	call   c0106d1c <Memcpy>
c0105599:	83 c4 10             	add    $0x10,%esp
c010559c:	eb 01                	jmp    c010559f <do_exec+0x270>
c010559e:	90                   	nop
c010559f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01055a3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01055a6:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01055aa:	0f b7 c0             	movzwl %ax,%eax
c01055ad:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01055b0:	0f 8c e9 fe ff ff    	jl     c010549f <do_exec+0x170>
c01055b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01055b9:	8b 40 10             	mov    0x10(%eax),%eax
c01055bc:	89 45 8c             	mov    %eax,-0x74(%ebp)
c01055bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01055c2:	8b 40 1c             	mov    0x1c(%eax),%eax
c01055c5:	89 45 88             	mov    %eax,-0x78(%ebp)
c01055c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01055cb:	8b 40 24             	mov    0x24(%eax),%eax
c01055ce:	89 45 84             	mov    %eax,-0x7c(%ebp)
c01055d1:	83 ec 0c             	sub    $0xc,%esp
c01055d4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055d7:	e8 8a e2 ff ff       	call   c0103866 <pid2proc>
c01055dc:	83 c4 10             	add    $0x10,%esp
c01055df:	89 45 80             	mov    %eax,-0x80(%ebp)
c01055e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01055e5:	8b 40 10             	mov    0x10(%eax),%eax
c01055e8:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01055ee:	83 ec 08             	sub    $0x8,%esp
c01055f1:	ff 75 88             	pushl  -0x78(%ebp)
c01055f4:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c01055fa:	e8 b0 08 00 00       	call   c0105eaf <alloc_virtual_memory>
c01055ff:	83 c4 10             	add    $0x10,%esp
c0105602:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105608:	8b 45 08             	mov    0x8(%ebp),%eax
c010560b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010560e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105614:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010561b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0105621:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105624:	eb 1a                	jmp    c0105640 <do_exec+0x311>
c0105626:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010562a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010562d:	8b 10                	mov    (%eax),%edx
c010562f:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105635:	01 c2                	add    %eax,%edx
c0105637:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010563a:	89 10                	mov    %edx,(%eax)
c010563c:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0105640:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105643:	8b 00                	mov    (%eax),%eax
c0105645:	85 c0                	test   %eax,%eax
c0105647:	75 dd                	jne    c0105626 <do_exec+0x2f7>
c0105649:	83 ec 0c             	sub    $0xc,%esp
c010564c:	ff 75 84             	pushl  -0x7c(%ebp)
c010564f:	e8 5b 08 00 00       	call   c0105eaf <alloc_virtual_memory>
c0105654:	83 c4 10             	add    $0x10,%esp
c0105657:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010565d:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c0105663:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0105669:	83 ec 04             	sub    $0x4,%esp
c010566c:	ff 75 88             	pushl  -0x78(%ebp)
c010566f:	52                   	push   %edx
c0105670:	50                   	push   %eax
c0105671:	e8 a6 16 00 00       	call   c0106d1c <Memcpy>
c0105676:	83 c4 10             	add    $0x10,%esp
c0105679:	8b 45 08             	mov    0x8(%ebp),%eax
c010567c:	8b 40 28             	mov    0x28(%eax),%eax
c010567f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105685:	83 ec 08             	sub    $0x8,%esp
c0105688:	ff 75 d4             	pushl  -0x2c(%ebp)
c010568b:	ff 75 80             	pushl  -0x80(%ebp)
c010568e:	e8 ef 08 00 00       	call   c0105f82 <get_physical_address_proc>
c0105693:	83 c4 10             	add    $0x10,%esp
c0105696:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c010569c:	83 ec 08             	sub    $0x8,%esp
c010569f:	68 00 10 00 00       	push   $0x1000
c01056a4:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c01056aa:	e8 00 08 00 00       	call   c0105eaf <alloc_virtual_memory>
c01056af:	83 c4 10             	add    $0x10,%esp
c01056b2:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c01056b8:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c01056be:	05 bc 0f 00 00       	add    $0xfbc,%eax
c01056c3:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01056c9:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056cf:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01056d5:	89 50 20             	mov    %edx,0x20(%eax)
c01056d8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01056db:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056e1:	89 50 28             	mov    %edx,0x28(%eax)
c01056e4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056e7:	8b 40 18             	mov    0x18(%eax),%eax
c01056ea:	89 c2                	mov    %eax,%edx
c01056ec:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056f2:	89 50 30             	mov    %edx,0x30(%eax)
c01056f5:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056fb:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105701:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105704:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105707:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010570e:	00 00 00 
c0105711:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105718:	00 00 00 
c010571b:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0105722:	00 00 00 
c0105725:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c010572c:	00 00 00 
c010572f:	83 ec 04             	sub    $0x4,%esp
c0105732:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105735:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c010573b:	50                   	push   %eax
c010573c:	6a 01                	push   $0x1
c010573e:	e8 62 3e 00 00       	call   c01095a5 <send_rec>
c0105743:	83 c4 10             	add    $0x10,%esp
c0105746:	c9                   	leave  
c0105747:	c3                   	ret    

c0105748 <do_fork>:
c0105748:	55                   	push   %ebp
c0105749:	89 e5                	mov    %esp,%ebp
c010574b:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0105751:	8b 45 08             	mov    0x8(%ebp),%eax
c0105754:	8b 00                	mov    (%eax),%eax
c0105756:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105759:	83 ec 0c             	sub    $0xc,%esp
c010575c:	ff 75 f4             	pushl  -0xc(%ebp)
c010575f:	e8 3c 47 00 00       	call   c0109ea0 <fork_process>
c0105764:	83 c4 10             	add    $0x10,%esp
c0105767:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010576a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010576d:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105773:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105776:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105779:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010577f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105782:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105785:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c010578c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105793:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010579a:	83 ec 04             	sub    $0x4,%esp
c010579d:	ff 75 ec             	pushl  -0x14(%ebp)
c01057a0:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c01057a6:	50                   	push   %eax
c01057a7:	6a 01                	push   $0x1
c01057a9:	e8 f7 3d 00 00       	call   c01095a5 <send_rec>
c01057ae:	83 c4 10             	add    $0x10,%esp
c01057b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01057b4:	c9                   	leave  
c01057b5:	c3                   	ret    

c01057b6 <do_exit>:
c01057b6:	55                   	push   %ebp
c01057b7:	89 e5                	mov    %esp,%ebp
c01057b9:	83 ec 18             	sub    $0x18,%esp
c01057bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01057bf:	8b 00                	mov    (%eax),%eax
c01057c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01057c4:	83 ec 0c             	sub    $0xc,%esp
c01057c7:	ff 75 f4             	pushl  -0xc(%ebp)
c01057ca:	e8 97 e0 ff ff       	call   c0103866 <pid2proc>
c01057cf:	83 c4 10             	add    $0x10,%esp
c01057d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057d8:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01057de:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01057e1:	83 ec 0c             	sub    $0xc,%esp
c01057e4:	ff 75 ec             	pushl  -0x14(%ebp)
c01057e7:	e8 7a e0 ff ff       	call   c0103866 <pid2proc>
c01057ec:	83 c4 10             	add    $0x10,%esp
c01057ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01057f2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01057f6:	74 45                	je     c010583d <do_exit+0x87>
c01057f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01057fb:	8b 40 54             	mov    0x54(%eax),%eax
c01057fe:	89 c2                	mov    %eax,%edx
c0105800:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105803:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105809:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010580c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105813:	3c 04                	cmp    $0x4,%al
c0105815:	75 1a                	jne    c0105831 <do_exit+0x7b>
c0105817:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010581a:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105821:	83 ec 0c             	sub    $0xc,%esp
c0105824:	ff 75 f0             	pushl  -0x10(%ebp)
c0105827:	e8 33 01 00 00       	call   c010595f <cleanup>
c010582c:	83 c4 10             	add    $0x10,%esp
c010582f:	eb 0d                	jmp    c010583e <do_exit+0x88>
c0105831:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105834:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c010583b:	eb 01                	jmp    c010583e <do_exit+0x88>
c010583d:	90                   	nop
c010583e:	c9                   	leave  
c010583f:	c3                   	ret    

c0105840 <do_wait>:
c0105840:	55                   	push   %ebp
c0105841:	89 e5                	mov    %esp,%ebp
c0105843:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0105849:	8b 45 08             	mov    0x8(%ebp),%eax
c010584c:	8b 00                	mov    (%eax),%eax
c010584e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105851:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105858:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010585f:	83 ec 0c             	sub    $0xc,%esp
c0105862:	ff 75 ec             	pushl  -0x14(%ebp)
c0105865:	e8 fc df ff ff       	call   c0103866 <pid2proc>
c010586a:	83 c4 10             	add    $0x10,%esp
c010586d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105870:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105874:	75 19                	jne    c010588f <do_wait+0x4f>
c0105876:	6a 58                	push   $0x58
c0105878:	68 99 b5 10 c0       	push   $0xc010b599
c010587d:	68 99 b5 10 c0       	push   $0xc010b599
c0105882:	68 a7 b5 10 c0       	push   $0xc010b5a7
c0105887:	e8 a9 30 00 00       	call   c0108935 <assertion_failure>
c010588c:	83 c4 10             	add    $0x10,%esp
c010588f:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105894:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c010589a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010589d:	89 55 e0             	mov    %edx,-0x20(%ebp)
c01058a0:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c01058a5:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c01058ab:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01058ae:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01058b1:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c01058b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058b9:	eb 5b                	jmp    c0105916 <do_wait+0xd6>
c01058bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058be:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01058c3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01058c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01058c9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01058cf:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01058d2:	74 0b                	je     c01058df <do_wait+0x9f>
c01058d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058d7:	8b 40 04             	mov    0x4(%eax),%eax
c01058da:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058dd:	eb 37                	jmp    c0105916 <do_wait+0xd6>
c01058df:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01058e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01058e6:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01058ed:	3c 03                	cmp    $0x3,%al
c01058ef:	74 0b                	je     c01058fc <do_wait+0xbc>
c01058f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058f4:	8b 40 04             	mov    0x4(%eax),%eax
c01058f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058fa:	eb 1a                	jmp    c0105916 <do_wait+0xd6>
c01058fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01058ff:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105906:	83 ec 0c             	sub    $0xc,%esp
c0105909:	ff 75 e8             	pushl  -0x18(%ebp)
c010590c:	e8 4e 00 00 00       	call   c010595f <cleanup>
c0105911:	83 c4 10             	add    $0x10,%esp
c0105914:	eb 47                	jmp    c010595d <do_wait+0x11d>
c0105916:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c010591d:	75 9c                	jne    c01058bb <do_wait+0x7b>
c010591f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105923:	74 0c                	je     c0105931 <do_wait+0xf1>
c0105925:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105928:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c010592f:	eb 2c                	jmp    c010595d <do_wait+0x11d>
c0105931:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105938:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010593f:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105946:	83 ec 04             	sub    $0x4,%esp
c0105949:	ff 75 ec             	pushl  -0x14(%ebp)
c010594c:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c0105952:	50                   	push   %eax
c0105953:	6a 01                	push   $0x1
c0105955:	e8 4b 3c 00 00       	call   c01095a5 <send_rec>
c010595a:	83 c4 10             	add    $0x10,%esp
c010595d:	c9                   	leave  
c010595e:	c3                   	ret    

c010595f <cleanup>:
c010595f:	55                   	push   %ebp
c0105960:	89 e5                	mov    %esp,%ebp
c0105962:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105968:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c010596f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105976:	8b 45 08             	mov    0x8(%ebp),%eax
c0105979:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010597f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105982:	8b 45 08             	mov    0x8(%ebp),%eax
c0105985:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c010598b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010598e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105991:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105997:	83 ec 04             	sub    $0x4,%esp
c010599a:	50                   	push   %eax
c010599b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01059a1:	50                   	push   %eax
c01059a2:	6a 01                	push   $0x1
c01059a4:	e8 fc 3b 00 00       	call   c01095a5 <send_rec>
c01059a9:	83 c4 10             	add    $0x10,%esp
c01059ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01059af:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c01059b6:	90                   	nop
c01059b7:	c9                   	leave  
c01059b8:	c3                   	ret    

c01059b9 <init_bitmap>:
c01059b9:	55                   	push   %ebp
c01059ba:	89 e5                	mov    %esp,%ebp
c01059bc:	83 ec 08             	sub    $0x8,%esp
c01059bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01059c2:	8b 50 04             	mov    0x4(%eax),%edx
c01059c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01059c8:	8b 00                	mov    (%eax),%eax
c01059ca:	83 ec 04             	sub    $0x4,%esp
c01059cd:	52                   	push   %edx
c01059ce:	6a 00                	push   $0x0
c01059d0:	50                   	push   %eax
c01059d1:	e8 f9 67 00 00       	call   c010c1cf <Memset>
c01059d6:	83 c4 10             	add    $0x10,%esp
c01059d9:	90                   	nop
c01059da:	c9                   	leave  
c01059db:	c3                   	ret    

c01059dc <test_bit_val>:
c01059dc:	55                   	push   %ebp
c01059dd:	89 e5                	mov    %esp,%ebp
c01059df:	53                   	push   %ebx
c01059e0:	83 ec 10             	sub    $0x10,%esp
c01059e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059e6:	8d 50 07             	lea    0x7(%eax),%edx
c01059e9:	85 c0                	test   %eax,%eax
c01059eb:	0f 48 c2             	cmovs  %edx,%eax
c01059ee:	c1 f8 03             	sar    $0x3,%eax
c01059f1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01059f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059f7:	99                   	cltd   
c01059f8:	c1 ea 1d             	shr    $0x1d,%edx
c01059fb:	01 d0                	add    %edx,%eax
c01059fd:	83 e0 07             	and    $0x7,%eax
c0105a00:	29 d0                	sub    %edx,%eax
c0105a02:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a05:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a08:	8b 10                	mov    (%eax),%edx
c0105a0a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a0d:	01 d0                	add    %edx,%eax
c0105a0f:	0f b6 00             	movzbl (%eax),%eax
c0105a12:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105a15:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a1c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105a21:	89 c1                	mov    %eax,%ecx
c0105a23:	d3 e3                	shl    %cl,%ebx
c0105a25:	89 d8                	mov    %ebx,%eax
c0105a27:	21 c2                	and    %eax,%edx
c0105a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a2c:	89 c1                	mov    %eax,%ecx
c0105a2e:	d3 fa                	sar    %cl,%edx
c0105a30:	89 d0                	mov    %edx,%eax
c0105a32:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a35:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105a39:	0f 9f c0             	setg   %al
c0105a3c:	0f b6 c0             	movzbl %al,%eax
c0105a3f:	83 c4 10             	add    $0x10,%esp
c0105a42:	5b                   	pop    %ebx
c0105a43:	5d                   	pop    %ebp
c0105a44:	c3                   	ret    

c0105a45 <set_bit_val>:
c0105a45:	55                   	push   %ebp
c0105a46:	89 e5                	mov    %esp,%ebp
c0105a48:	83 ec 10             	sub    $0x10,%esp
c0105a4b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a4e:	8d 50 07             	lea    0x7(%eax),%edx
c0105a51:	85 c0                	test   %eax,%eax
c0105a53:	0f 48 c2             	cmovs  %edx,%eax
c0105a56:	c1 f8 03             	sar    $0x3,%eax
c0105a59:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a5c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a5f:	99                   	cltd   
c0105a60:	c1 ea 1d             	shr    $0x1d,%edx
c0105a63:	01 d0                	add    %edx,%eax
c0105a65:	83 e0 07             	and    $0x7,%eax
c0105a68:	29 d0                	sub    %edx,%eax
c0105a6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a70:	8b 10                	mov    (%eax),%edx
c0105a72:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a75:	01 d0                	add    %edx,%eax
c0105a77:	0f b6 00             	movzbl (%eax),%eax
c0105a7a:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105a7d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105a81:	7e 13                	jle    c0105a96 <set_bit_val+0x51>
c0105a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a86:	ba 01 00 00 00       	mov    $0x1,%edx
c0105a8b:	89 c1                	mov    %eax,%ecx
c0105a8d:	d3 e2                	shl    %cl,%edx
c0105a8f:	89 d0                	mov    %edx,%eax
c0105a91:	08 45 ff             	or     %al,-0x1(%ebp)
c0105a94:	eb 13                	jmp    c0105aa9 <set_bit_val+0x64>
c0105a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a99:	ba 01 00 00 00       	mov    $0x1,%edx
c0105a9e:	89 c1                	mov    %eax,%ecx
c0105aa0:	d3 e2                	shl    %cl,%edx
c0105aa2:	89 d0                	mov    %edx,%eax
c0105aa4:	f7 d0                	not    %eax
c0105aa6:	20 45 ff             	and    %al,-0x1(%ebp)
c0105aa9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105aac:	8b 10                	mov    (%eax),%edx
c0105aae:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105ab1:	01 c2                	add    %eax,%edx
c0105ab3:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105ab7:	88 02                	mov    %al,(%edx)
c0105ab9:	b8 01 00 00 00       	mov    $0x1,%eax
c0105abe:	c9                   	leave  
c0105abf:	c3                   	ret    

c0105ac0 <set_bits>:
c0105ac0:	55                   	push   %ebp
c0105ac1:	89 e5                	mov    %esp,%ebp
c0105ac3:	83 ec 10             	sub    $0x10,%esp
c0105ac6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105acd:	eb 1c                	jmp    c0105aeb <set_bits+0x2b>
c0105acf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ad2:	8d 50 01             	lea    0x1(%eax),%edx
c0105ad5:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105ad8:	ff 75 10             	pushl  0x10(%ebp)
c0105adb:	50                   	push   %eax
c0105adc:	ff 75 08             	pushl  0x8(%ebp)
c0105adf:	e8 61 ff ff ff       	call   c0105a45 <set_bit_val>
c0105ae4:	83 c4 0c             	add    $0xc,%esp
c0105ae7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105aeb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105aee:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105af1:	7c dc                	jl     c0105acf <set_bits+0xf>
c0105af3:	b8 01 00 00 00       	mov    $0x1,%eax
c0105af8:	c9                   	leave  
c0105af9:	c3                   	ret    

c0105afa <get_first_free_bit>:
c0105afa:	55                   	push   %ebp
c0105afb:	89 e5                	mov    %esp,%ebp
c0105afd:	83 ec 10             	sub    $0x10,%esp
c0105b00:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b03:	8b 40 04             	mov    0x4(%eax),%eax
c0105b06:	c1 e0 03             	shl    $0x3,%eax
c0105b09:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105b12:	eb 1b                	jmp    c0105b2f <get_first_free_bit+0x35>
c0105b14:	ff 75 fc             	pushl  -0x4(%ebp)
c0105b17:	ff 75 08             	pushl  0x8(%ebp)
c0105b1a:	e8 bd fe ff ff       	call   c01059dc <test_bit_val>
c0105b1f:	83 c4 08             	add    $0x8,%esp
c0105b22:	85 c0                	test   %eax,%eax
c0105b24:	75 05                	jne    c0105b2b <get_first_free_bit+0x31>
c0105b26:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b29:	eb 11                	jmp    c0105b3c <get_first_free_bit+0x42>
c0105b2b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105b2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b32:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105b35:	7c dd                	jl     c0105b14 <get_first_free_bit+0x1a>
c0105b37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105b3c:	c9                   	leave  
c0105b3d:	c3                   	ret    

c0105b3e <get_bits>:
c0105b3e:	55                   	push   %ebp
c0105b3f:	89 e5                	mov    %esp,%ebp
c0105b41:	83 ec 20             	sub    $0x20,%esp
c0105b44:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105b4b:	ff 75 f0             	pushl  -0x10(%ebp)
c0105b4e:	ff 75 08             	pushl  0x8(%ebp)
c0105b51:	e8 a4 ff ff ff       	call   c0105afa <get_first_free_bit>
c0105b56:	83 c4 08             	add    $0x8,%esp
c0105b59:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b5f:	8b 40 04             	mov    0x4(%eax),%eax
c0105b62:	c1 e0 03             	shl    $0x3,%eax
c0105b65:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b68:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b6b:	83 e8 01             	sub    $0x1,%eax
c0105b6e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105b71:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105b75:	75 08                	jne    c0105b7f <get_bits+0x41>
c0105b77:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b7a:	e9 85 00 00 00       	jmp    c0105c04 <get_bits+0xc6>
c0105b7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b82:	83 c0 01             	add    $0x1,%eax
c0105b85:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b88:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b8e:	eb 58                	jmp    c0105be8 <get_bits+0xaa>
c0105b90:	ff 75 f8             	pushl  -0x8(%ebp)
c0105b93:	ff 75 08             	pushl  0x8(%ebp)
c0105b96:	e8 41 fe ff ff       	call   c01059dc <test_bit_val>
c0105b9b:	83 c4 08             	add    $0x8,%esp
c0105b9e:	85 c0                	test   %eax,%eax
c0105ba0:	75 0a                	jne    c0105bac <get_bits+0x6e>
c0105ba2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105ba6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105baa:	eb 2b                	jmp    c0105bd7 <get_bits+0x99>
c0105bac:	6a 00                	push   $0x0
c0105bae:	ff 75 08             	pushl  0x8(%ebp)
c0105bb1:	e8 44 ff ff ff       	call   c0105afa <get_first_free_bit>
c0105bb6:	83 c4 08             	add    $0x8,%esp
c0105bb9:	83 c0 01             	add    $0x1,%eax
c0105bbc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105bbf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105bc2:	83 c0 01             	add    $0x1,%eax
c0105bc5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105bc8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105bcb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105bce:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105bd1:	83 e8 01             	sub    $0x1,%eax
c0105bd4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105bd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bda:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105bdd:	7c 09                	jl     c0105be8 <get_bits+0xaa>
c0105bdf:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105be6:	eb 0d                	jmp    c0105bf5 <get_bits+0xb7>
c0105be8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105beb:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105bee:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105bf1:	85 c0                	test   %eax,%eax
c0105bf3:	7f 9b                	jg     c0105b90 <get_bits+0x52>
c0105bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bf8:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105bfb:	83 c0 01             	add    $0x1,%eax
c0105bfe:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c01:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c04:	c9                   	leave  
c0105c05:	c3                   	ret    

c0105c06 <get_a_page>:
c0105c06:	55                   	push   %ebp
c0105c07:	89 e5                	mov    %esp,%ebp
c0105c09:	83 ec 28             	sub    $0x28,%esp
c0105c0c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105c10:	75 22                	jne    c0105c34 <get_a_page+0x2e>
c0105c12:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105c17:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c1a:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105c1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c22:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105c27:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c2a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105c2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c32:	eb 20                	jmp    c0105c54 <get_a_page+0x4e>
c0105c34:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105c39:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c3c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105c41:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c44:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105c49:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c4c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105c51:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c54:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105c57:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105c5a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c5d:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105c60:	6a 01                	push   $0x1
c0105c62:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c65:	50                   	push   %eax
c0105c66:	e8 d3 fe ff ff       	call   c0105b3e <get_bits>
c0105c6b:	83 c4 08             	add    $0x8,%esp
c0105c6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c71:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105c75:	75 1c                	jne    c0105c93 <get_a_page+0x8d>
c0105c77:	68 84 00 00 00       	push   $0x84
c0105c7c:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105c81:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105c86:	68 c4 b5 10 c0       	push   $0xc010b5c4
c0105c8b:	e8 a5 2c 00 00       	call   c0108935 <assertion_failure>
c0105c90:	83 c4 10             	add    $0x10,%esp
c0105c93:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c96:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105c99:	c1 e2 0c             	shl    $0xc,%edx
c0105c9c:	01 d0                	add    %edx,%eax
c0105c9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ca1:	83 ec 04             	sub    $0x4,%esp
c0105ca4:	6a 01                	push   $0x1
c0105ca6:	ff 75 f4             	pushl  -0xc(%ebp)
c0105ca9:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105cac:	50                   	push   %eax
c0105cad:	e8 93 fd ff ff       	call   c0105a45 <set_bit_val>
c0105cb2:	83 c4 10             	add    $0x10,%esp
c0105cb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cb8:	c9                   	leave  
c0105cb9:	c3                   	ret    

c0105cba <get_virtual_address_start_with_addr>:
c0105cba:	55                   	push   %ebp
c0105cbb:	89 e5                	mov    %esp,%ebp
c0105cbd:	83 ec 38             	sub    $0x38,%esp
c0105cc0:	e8 29 a7 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105cc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cc8:	83 ec 0c             	sub    $0xc,%esp
c0105ccb:	ff 75 10             	pushl  0x10(%ebp)
c0105cce:	e8 93 db ff ff       	call   c0103866 <pid2proc>
c0105cd3:	83 c4 10             	add    $0x10,%esp
c0105cd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105cd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cdc:	8b 40 0c             	mov    0xc(%eax),%eax
c0105cdf:	83 ec 04             	sub    $0x4,%esp
c0105ce2:	6a 0c                	push   $0xc
c0105ce4:	50                   	push   %eax
c0105ce5:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105ce8:	50                   	push   %eax
c0105ce9:	e8 2e 10 00 00       	call   c0106d1c <Memcpy>
c0105cee:	83 c4 10             	add    $0x10,%esp
c0105cf1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105cf4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105cf7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105cfa:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105cfd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105d00:	8b 55 08             	mov    0x8(%ebp),%edx
c0105d03:	29 c2                	sub    %eax,%edx
c0105d05:	89 d0                	mov    %edx,%eax
c0105d07:	c1 e8 0c             	shr    $0xc,%eax
c0105d0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d0d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105d11:	79 1c                	jns    c0105d2f <get_virtual_address_start_with_addr+0x75>
c0105d13:	68 97 00 00 00       	push   $0x97
c0105d18:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105d1d:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105d22:	68 d0 b5 10 c0       	push   $0xc010b5d0
c0105d27:	e8 09 2c 00 00       	call   c0108935 <assertion_failure>
c0105d2c:	83 c4 10             	add    $0x10,%esp
c0105d2f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d32:	50                   	push   %eax
c0105d33:	6a 01                	push   $0x1
c0105d35:	ff 75 ec             	pushl  -0x14(%ebp)
c0105d38:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105d3b:	50                   	push   %eax
c0105d3c:	e8 7f fd ff ff       	call   c0105ac0 <set_bits>
c0105d41:	83 c4 10             	add    $0x10,%esp
c0105d44:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d47:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105d4c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d52:	c9                   	leave  
c0105d53:	c3                   	ret    

c0105d54 <get_virtual_address>:
c0105d54:	55                   	push   %ebp
c0105d55:	89 e5                	mov    %esp,%ebp
c0105d57:	83 ec 28             	sub    $0x28,%esp
c0105d5a:	e8 8f a6 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105d5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d62:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105d66:	75 1a                	jne    c0105d82 <get_virtual_address+0x2e>
c0105d68:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105d6d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d70:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105d75:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d78:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105d7d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d80:	eb 18                	jmp    c0105d9a <get_virtual_address+0x46>
c0105d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d85:	8b 40 0c             	mov    0xc(%eax),%eax
c0105d88:	83 ec 04             	sub    $0x4,%esp
c0105d8b:	6a 0c                	push   $0xc
c0105d8d:	50                   	push   %eax
c0105d8e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105d91:	50                   	push   %eax
c0105d92:	e8 85 0f 00 00       	call   c0106d1c <Memcpy>
c0105d97:	83 c4 10             	add    $0x10,%esp
c0105d9a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105d9d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105da0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105da3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105da6:	8b 45 08             	mov    0x8(%ebp),%eax
c0105da9:	83 ec 08             	sub    $0x8,%esp
c0105dac:	50                   	push   %eax
c0105dad:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105db0:	50                   	push   %eax
c0105db1:	e8 88 fd ff ff       	call   c0105b3e <get_bits>
c0105db6:	83 c4 10             	add    $0x10,%esp
c0105db9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105dbc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105dbf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105dc2:	c1 e2 0c             	shl    $0xc,%edx
c0105dc5:	01 d0                	add    %edx,%eax
c0105dc7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105dca:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dcd:	50                   	push   %eax
c0105dce:	6a 01                	push   $0x1
c0105dd0:	ff 75 f0             	pushl  -0x10(%ebp)
c0105dd3:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105dd6:	50                   	push   %eax
c0105dd7:	e8 e4 fc ff ff       	call   c0105ac0 <set_bits>
c0105ddc:	83 c4 10             	add    $0x10,%esp
c0105ddf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105de2:	c9                   	leave  
c0105de3:	c3                   	ret    

c0105de4 <ptr_pde>:
c0105de4:	55                   	push   %ebp
c0105de5:	89 e5                	mov    %esp,%ebp
c0105de7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dea:	c1 e8 16             	shr    $0x16,%eax
c0105ded:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105df2:	c1 e0 02             	shl    $0x2,%eax
c0105df5:	5d                   	pop    %ebp
c0105df6:	c3                   	ret    

c0105df7 <ptr_pte>:
c0105df7:	55                   	push   %ebp
c0105df8:	89 e5                	mov    %esp,%ebp
c0105dfa:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dfd:	c1 e8 0a             	shr    $0xa,%eax
c0105e00:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105e05:	89 c2                	mov    %eax,%edx
c0105e07:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e0a:	c1 e8 0c             	shr    $0xc,%eax
c0105e0d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105e12:	c1 e0 02             	shl    $0x2,%eax
c0105e15:	01 d0                	add    %edx,%eax
c0105e17:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105e1c:	5d                   	pop    %ebp
c0105e1d:	c3                   	ret    

c0105e1e <add_map_entry>:
c0105e1e:	55                   	push   %ebp
c0105e1f:	89 e5                	mov    %esp,%ebp
c0105e21:	83 ec 18             	sub    $0x18,%esp
c0105e24:	ff 75 08             	pushl  0x8(%ebp)
c0105e27:	e8 b8 ff ff ff       	call   c0105de4 <ptr_pde>
c0105e2c:	83 c4 04             	add    $0x4,%esp
c0105e2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e32:	ff 75 08             	pushl  0x8(%ebp)
c0105e35:	e8 bd ff ff ff       	call   c0105df7 <ptr_pte>
c0105e3a:	83 c4 04             	add    $0x4,%esp
c0105e3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e43:	8b 00                	mov    (%eax),%eax
c0105e45:	83 e0 01             	and    $0x1,%eax
c0105e48:	85 c0                	test   %eax,%eax
c0105e4a:	74 1b                	je     c0105e67 <add_map_entry+0x49>
c0105e4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e4f:	8b 00                	mov    (%eax),%eax
c0105e51:	83 e0 01             	and    $0x1,%eax
c0105e54:	85 c0                	test   %eax,%eax
c0105e56:	75 54                	jne    c0105eac <add_map_entry+0x8e>
c0105e58:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e5b:	83 c8 07             	or     $0x7,%eax
c0105e5e:	89 c2                	mov    %eax,%edx
c0105e60:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e63:	89 10                	mov    %edx,(%eax)
c0105e65:	eb 45                	jmp    c0105eac <add_map_entry+0x8e>
c0105e67:	83 ec 0c             	sub    $0xc,%esp
c0105e6a:	6a 00                	push   $0x0
c0105e6c:	e8 95 fd ff ff       	call   c0105c06 <get_a_page>
c0105e71:	83 c4 10             	add    $0x10,%esp
c0105e74:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e77:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e7a:	83 c8 07             	or     $0x7,%eax
c0105e7d:	89 c2                	mov    %eax,%edx
c0105e7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e82:	89 10                	mov    %edx,(%eax)
c0105e84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e87:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e8c:	83 ec 04             	sub    $0x4,%esp
c0105e8f:	68 00 10 00 00       	push   $0x1000
c0105e94:	6a 00                	push   $0x0
c0105e96:	50                   	push   %eax
c0105e97:	e8 33 63 00 00       	call   c010c1cf <Memset>
c0105e9c:	83 c4 10             	add    $0x10,%esp
c0105e9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ea2:	83 c8 07             	or     $0x7,%eax
c0105ea5:	89 c2                	mov    %eax,%edx
c0105ea7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105eaa:	89 10                	mov    %edx,(%eax)
c0105eac:	90                   	nop
c0105ead:	c9                   	leave  
c0105eae:	c3                   	ret    

c0105eaf <alloc_virtual_memory>:
c0105eaf:	55                   	push   %ebp
c0105eb0:	89 e5                	mov    %esp,%ebp
c0105eb2:	83 ec 28             	sub    $0x28,%esp
c0105eb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105eb8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ebd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ec0:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ec3:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105ec6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ec9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ecc:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105ecf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105ed2:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105ed7:	c1 e8 0c             	shr    $0xc,%eax
c0105eda:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105edd:	e8 0c a5 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105ee2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105ee5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105ee8:	8b 50 08             	mov    0x8(%eax),%edx
c0105eeb:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105ef0:	39 c2                	cmp    %eax,%edx
c0105ef2:	75 09                	jne    c0105efd <alloc_virtual_memory+0x4e>
c0105ef4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105efb:	eb 07                	jmp    c0105f04 <alloc_virtual_memory+0x55>
c0105efd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105f04:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105f0b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105f12:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105f19:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105f20:	eb 47                	jmp    c0105f69 <alloc_virtual_memory+0xba>
c0105f22:	83 ec 08             	sub    $0x8,%esp
c0105f25:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f28:	6a 01                	push   $0x1
c0105f2a:	e8 25 fe ff ff       	call   c0105d54 <get_virtual_address>
c0105f2f:	83 c4 10             	add    $0x10,%esp
c0105f32:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f35:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105f39:	74 13                	je     c0105f4e <alloc_virtual_memory+0x9f>
c0105f3b:	83 ec 0c             	sub    $0xc,%esp
c0105f3e:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f41:	e8 c0 fc ff ff       	call   c0105c06 <get_a_page>
c0105f46:	83 c4 10             	add    $0x10,%esp
c0105f49:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f4c:	eb 06                	jmp    c0105f54 <alloc_virtual_memory+0xa5>
c0105f4e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105f51:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f54:	83 ec 08             	sub    $0x8,%esp
c0105f57:	ff 75 f4             	pushl  -0xc(%ebp)
c0105f5a:	ff 75 d8             	pushl  -0x28(%ebp)
c0105f5d:	e8 bc fe ff ff       	call   c0105e1e <add_map_entry>
c0105f62:	83 c4 10             	add    $0x10,%esp
c0105f65:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105f69:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105f6c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105f6f:	72 b1                	jb     c0105f22 <alloc_virtual_memory+0x73>
c0105f71:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f74:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f79:	89 c2                	mov    %eax,%edx
c0105f7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f7e:	01 d0                	add    %edx,%eax
c0105f80:	c9                   	leave  
c0105f81:	c3                   	ret    

c0105f82 <get_physical_address_proc>:
c0105f82:	55                   	push   %ebp
c0105f83:	89 e5                	mov    %esp,%ebp
c0105f85:	83 ec 18             	sub    $0x18,%esp
c0105f88:	e8 85 a3 ff ff       	call   c0100312 <disable_int>
c0105f8d:	e8 5c a4 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105f92:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f95:	83 ec 0c             	sub    $0xc,%esp
c0105f98:	ff 75 0c             	pushl  0xc(%ebp)
c0105f9b:	e8 c6 d8 ff ff       	call   c0103866 <pid2proc>
c0105fa0:	83 c4 10             	add    $0x10,%esp
c0105fa3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fa6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fa9:	8b 40 08             	mov    0x8(%eax),%eax
c0105fac:	83 ec 0c             	sub    $0xc,%esp
c0105faf:	50                   	push   %eax
c0105fb0:	e8 1d a4 ff ff       	call   c01003d2 <update_cr3>
c0105fb5:	83 c4 10             	add    $0x10,%esp
c0105fb8:	83 ec 0c             	sub    $0xc,%esp
c0105fbb:	ff 75 08             	pushl  0x8(%ebp)
c0105fbe:	e8 34 fe ff ff       	call   c0105df7 <ptr_pte>
c0105fc3:	83 c4 10             	add    $0x10,%esp
c0105fc6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105fcc:	8b 00                	mov    (%eax),%eax
c0105fce:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105fd3:	89 c2                	mov    %eax,%edx
c0105fd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fd8:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105fdd:	09 d0                	or     %edx,%eax
c0105fdf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105fe2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105fe5:	8b 40 08             	mov    0x8(%eax),%eax
c0105fe8:	83 ec 0c             	sub    $0xc,%esp
c0105feb:	50                   	push   %eax
c0105fec:	e8 e1 a3 ff ff       	call   c01003d2 <update_cr3>
c0105ff1:	83 c4 10             	add    $0x10,%esp
c0105ff4:	e8 1b a3 ff ff       	call   c0100314 <enable_int>
c0105ff9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105ffc:	c9                   	leave  
c0105ffd:	c3                   	ret    

c0105ffe <get_physical_address>:
c0105ffe:	55                   	push   %ebp
c0105fff:	89 e5                	mov    %esp,%ebp
c0106001:	83 ec 10             	sub    $0x10,%esp
c0106004:	ff 75 08             	pushl  0x8(%ebp)
c0106007:	e8 eb fd ff ff       	call   c0105df7 <ptr_pte>
c010600c:	83 c4 04             	add    $0x4,%esp
c010600f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106012:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106015:	8b 00                	mov    (%eax),%eax
c0106017:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010601c:	89 c2                	mov    %eax,%edx
c010601e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106021:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106026:	09 d0                	or     %edx,%eax
c0106028:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010602b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010602e:	c9                   	leave  
c010602f:	c3                   	ret    

c0106030 <alloc_physical_memory_of_proc>:
c0106030:	55                   	push   %ebp
c0106031:	89 e5                	mov    %esp,%ebp
c0106033:	83 ec 48             	sub    $0x48,%esp
c0106036:	e8 d7 a2 ff ff       	call   c0100312 <disable_int>
c010603b:	8b 45 08             	mov    0x8(%ebp),%eax
c010603e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106043:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106046:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010604d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106050:	83 ec 0c             	sub    $0xc,%esp
c0106053:	50                   	push   %eax
c0106054:	e8 0d d8 ff ff       	call   c0103866 <pid2proc>
c0106059:	83 c4 10             	add    $0x10,%esp
c010605c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010605f:	e8 8a a3 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106064:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106067:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010606a:	8b 40 0c             	mov    0xc(%eax),%eax
c010606d:	83 ec 04             	sub    $0x4,%esp
c0106070:	6a 0c                	push   $0xc
c0106072:	50                   	push   %eax
c0106073:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106076:	50                   	push   %eax
c0106077:	e8 a0 0c 00 00       	call   c0106d1c <Memcpy>
c010607c:	83 c4 10             	add    $0x10,%esp
c010607f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106082:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0106085:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106088:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010608b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010608e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106091:	29 c2                	sub    %eax,%edx
c0106093:	89 d0                	mov    %edx,%eax
c0106095:	c1 e8 0c             	shr    $0xc,%eax
c0106098:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010609b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010609e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01060a1:	c1 e2 0c             	shl    $0xc,%edx
c01060a4:	01 d0                	add    %edx,%eax
c01060a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01060a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01060ac:	6a 01                	push   $0x1
c01060ae:	6a 01                	push   $0x1
c01060b0:	50                   	push   %eax
c01060b1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01060b4:	50                   	push   %eax
c01060b5:	e8 06 fa ff ff       	call   c0105ac0 <set_bits>
c01060ba:	83 c4 10             	add    $0x10,%esp
c01060bd:	83 ec 0c             	sub    $0xc,%esp
c01060c0:	ff 75 f0             	pushl  -0x10(%ebp)
c01060c3:	e8 3e fb ff ff       	call   c0105c06 <get_a_page>
c01060c8:	83 c4 10             	add    $0x10,%esp
c01060cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01060ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01060d1:	25 ff 0f 00 00       	and    $0xfff,%eax
c01060d6:	89 c2                	mov    %eax,%edx
c01060d8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01060db:	01 d0                	add    %edx,%eax
c01060dd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01060e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060e3:	8b 40 08             	mov    0x8(%eax),%eax
c01060e6:	83 ec 0c             	sub    $0xc,%esp
c01060e9:	50                   	push   %eax
c01060ea:	e8 e3 a2 ff ff       	call   c01003d2 <update_cr3>
c01060ef:	83 c4 10             	add    $0x10,%esp
c01060f2:	83 ec 08             	sub    $0x8,%esp
c01060f5:	ff 75 dc             	pushl  -0x24(%ebp)
c01060f8:	ff 75 f4             	pushl  -0xc(%ebp)
c01060fb:	e8 1e fd ff ff       	call   c0105e1e <add_map_entry>
c0106100:	83 c4 10             	add    $0x10,%esp
c0106103:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106106:	8b 40 08             	mov    0x8(%eax),%eax
c0106109:	83 ec 0c             	sub    $0xc,%esp
c010610c:	50                   	push   %eax
c010610d:	e8 c0 a2 ff ff       	call   c01003d2 <update_cr3>
c0106112:	83 c4 10             	add    $0x10,%esp
c0106115:	e8 fa a1 ff ff       	call   c0100314 <enable_int>
c010611a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010611d:	c9                   	leave  
c010611e:	c3                   	ret    

c010611f <alloc_physical_memory>:
c010611f:	55                   	push   %ebp
c0106120:	89 e5                	mov    %esp,%ebp
c0106122:	83 ec 38             	sub    $0x38,%esp
c0106125:	8b 45 08             	mov    0x8(%ebp),%eax
c0106128:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010612d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106130:	e8 b9 a2 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106135:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106138:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010613c:	75 1a                	jne    c0106158 <alloc_physical_memory+0x39>
c010613e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106143:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106146:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010614b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010614e:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106153:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106156:	eb 18                	jmp    c0106170 <alloc_physical_memory+0x51>
c0106158:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010615b:	8b 40 0c             	mov    0xc(%eax),%eax
c010615e:	83 ec 04             	sub    $0x4,%esp
c0106161:	6a 0c                	push   $0xc
c0106163:	50                   	push   %eax
c0106164:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0106167:	50                   	push   %eax
c0106168:	e8 af 0b 00 00       	call   c0106d1c <Memcpy>
c010616d:	83 c4 10             	add    $0x10,%esp
c0106170:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106173:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106176:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106179:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010617c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010617f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106182:	29 c2                	sub    %eax,%edx
c0106184:	89 d0                	mov    %edx,%eax
c0106186:	c1 e8 0c             	shr    $0xc,%eax
c0106189:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010618c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010618f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106192:	c1 e2 0c             	shl    $0xc,%edx
c0106195:	01 d0                	add    %edx,%eax
c0106197:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010619a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010619d:	6a 01                	push   $0x1
c010619f:	6a 01                	push   $0x1
c01061a1:	50                   	push   %eax
c01061a2:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01061a5:	50                   	push   %eax
c01061a6:	e8 15 f9 ff ff       	call   c0105ac0 <set_bits>
c01061ab:	83 c4 10             	add    $0x10,%esp
c01061ae:	83 ec 0c             	sub    $0xc,%esp
c01061b1:	ff 75 0c             	pushl  0xc(%ebp)
c01061b4:	e8 4d fa ff ff       	call   c0105c06 <get_a_page>
c01061b9:	83 c4 10             	add    $0x10,%esp
c01061bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01061bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01061c2:	25 ff 0f 00 00       	and    $0xfff,%eax
c01061c7:	89 c2                	mov    %eax,%edx
c01061c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01061cc:	01 d0                	add    %edx,%eax
c01061ce:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01061d1:	83 ec 08             	sub    $0x8,%esp
c01061d4:	ff 75 e4             	pushl  -0x1c(%ebp)
c01061d7:	ff 75 f4             	pushl  -0xc(%ebp)
c01061da:	e8 3f fc ff ff       	call   c0105e1e <add_map_entry>
c01061df:	83 c4 10             	add    $0x10,%esp
c01061e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01061e5:	c9                   	leave  
c01061e6:	c3                   	ret    

c01061e7 <alloc_memory>:
c01061e7:	55                   	push   %ebp
c01061e8:	89 e5                	mov    %esp,%ebp
c01061ea:	83 ec 18             	sub    $0x18,%esp
c01061ed:	83 ec 08             	sub    $0x8,%esp
c01061f0:	ff 75 0c             	pushl  0xc(%ebp)
c01061f3:	ff 75 08             	pushl  0x8(%ebp)
c01061f6:	e8 59 fb ff ff       	call   c0105d54 <get_virtual_address>
c01061fb:	83 c4 10             	add    $0x10,%esp
c01061fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106201:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106204:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106209:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010620c:	eb 29                	jmp    c0106237 <alloc_memory+0x50>
c010620e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106215:	83 ec 0c             	sub    $0xc,%esp
c0106218:	ff 75 0c             	pushl  0xc(%ebp)
c010621b:	e8 e6 f9 ff ff       	call   c0105c06 <get_a_page>
c0106220:	83 c4 10             	add    $0x10,%esp
c0106223:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106226:	83 ec 08             	sub    $0x8,%esp
c0106229:	ff 75 ec             	pushl  -0x14(%ebp)
c010622c:	ff 75 f4             	pushl  -0xc(%ebp)
c010622f:	e8 ea fb ff ff       	call   c0105e1e <add_map_entry>
c0106234:	83 c4 10             	add    $0x10,%esp
c0106237:	8b 45 08             	mov    0x8(%ebp),%eax
c010623a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010623d:	89 55 08             	mov    %edx,0x8(%ebp)
c0106240:	85 c0                	test   %eax,%eax
c0106242:	75 ca                	jne    c010620e <alloc_memory+0x27>
c0106244:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106247:	c9                   	leave  
c0106248:	c3                   	ret    

c0106249 <get_a_virtual_page>:
c0106249:	55                   	push   %ebp
c010624a:	89 e5                	mov    %esp,%ebp
c010624c:	83 ec 18             	sub    $0x18,%esp
c010624f:	83 ec 0c             	sub    $0xc,%esp
c0106252:	ff 75 08             	pushl  0x8(%ebp)
c0106255:	e8 ac f9 ff ff       	call   c0105c06 <get_a_page>
c010625a:	83 c4 10             	add    $0x10,%esp
c010625d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106260:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106263:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106268:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010626b:	83 ec 08             	sub    $0x8,%esp
c010626e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106271:	ff 75 f0             	pushl  -0x10(%ebp)
c0106274:	e8 a5 fb ff ff       	call   c0105e1e <add_map_entry>
c0106279:	83 c4 10             	add    $0x10,%esp
c010627c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010627f:	c9                   	leave  
c0106280:	c3                   	ret    

c0106281 <block2arena>:
c0106281:	55                   	push   %ebp
c0106282:	89 e5                	mov    %esp,%ebp
c0106284:	83 ec 10             	sub    $0x10,%esp
c0106287:	8b 45 08             	mov    0x8(%ebp),%eax
c010628a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010628f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106292:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106295:	c9                   	leave  
c0106296:	c3                   	ret    

c0106297 <sys_malloc2>:
c0106297:	55                   	push   %ebp
c0106298:	89 e5                	mov    %esp,%ebp
c010629a:	83 ec 68             	sub    $0x68,%esp
c010629d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01062a4:	e8 45 a1 ff ff       	call   c01003ee <get_running_thread_pcb>
c01062a9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01062ac:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062af:	8b 50 08             	mov    0x8(%eax),%edx
c01062b2:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01062b7:	39 c2                	cmp    %eax,%edx
c01062b9:	75 10                	jne    c01062cb <sys_malloc2+0x34>
c01062bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01062c2:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c01062c9:	eb 10                	jmp    c01062db <sys_malloc2+0x44>
c01062cb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01062d2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062d5:	83 c0 10             	add    $0x10,%eax
c01062d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01062db:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c01062e2:	76 52                	jbe    c0106336 <sys_malloc2+0x9f>
c01062e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01062e7:	05 0b 10 00 00       	add    $0x100b,%eax
c01062ec:	c1 e8 0c             	shr    $0xc,%eax
c01062ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01062f2:	83 ec 08             	sub    $0x8,%esp
c01062f5:	ff 75 f0             	pushl  -0x10(%ebp)
c01062f8:	ff 75 d8             	pushl  -0x28(%ebp)
c01062fb:	e8 e7 fe ff ff       	call   c01061e7 <alloc_memory>
c0106300:	83 c4 10             	add    $0x10,%esp
c0106303:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106306:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106309:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010630c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010630f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106315:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106318:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010631f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106322:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106326:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106329:	05 90 00 00 00       	add    $0x90,%eax
c010632e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106331:	e9 f0 01 00 00       	jmp    c0106526 <sys_malloc2+0x28f>
c0106336:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010633d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106344:	eb 26                	jmp    c010636c <sys_malloc2+0xd5>
c0106346:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106349:	89 d0                	mov    %edx,%eax
c010634b:	01 c0                	add    %eax,%eax
c010634d:	01 d0                	add    %edx,%eax
c010634f:	c1 e0 03             	shl    $0x3,%eax
c0106352:	89 c2                	mov    %eax,%edx
c0106354:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106357:	01 d0                	add    %edx,%eax
c0106359:	8b 00                	mov    (%eax),%eax
c010635b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010635e:	77 08                	ja     c0106368 <sys_malloc2+0xd1>
c0106360:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106363:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106366:	eb 0a                	jmp    c0106372 <sys_malloc2+0xdb>
c0106368:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010636c:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0106370:	7e d4                	jle    c0106346 <sys_malloc2+0xaf>
c0106372:	83 ec 08             	sub    $0x8,%esp
c0106375:	ff 75 f0             	pushl  -0x10(%ebp)
c0106378:	6a 01                	push   $0x1
c010637a:	e8 68 fe ff ff       	call   c01061e7 <alloc_memory>
c010637f:	83 c4 10             	add    $0x10,%esp
c0106382:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106385:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106388:	89 d0                	mov    %edx,%eax
c010638a:	01 c0                	add    %eax,%eax
c010638c:	01 d0                	add    %edx,%eax
c010638e:	c1 e0 03             	shl    $0x3,%eax
c0106391:	89 c2                	mov    %eax,%edx
c0106393:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106396:	01 d0                	add    %edx,%eax
c0106398:	83 ec 04             	sub    $0x4,%esp
c010639b:	6a 18                	push   $0x18
c010639d:	50                   	push   %eax
c010639e:	ff 75 cc             	pushl  -0x34(%ebp)
c01063a1:	e8 76 09 00 00       	call   c0106d1c <Memcpy>
c01063a6:	83 c4 10             	add    $0x10,%esp
c01063a9:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01063b0:	e8 03 09 00 00       	call   c0106cb8 <intr_disable>
c01063b5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01063b8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01063bb:	89 d0                	mov    %edx,%eax
c01063bd:	01 c0                	add    %eax,%eax
c01063bf:	01 d0                	add    %edx,%eax
c01063c1:	c1 e0 03             	shl    $0x3,%eax
c01063c4:	89 c2                	mov    %eax,%edx
c01063c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063c9:	01 d0                	add    %edx,%eax
c01063cb:	83 c0 08             	add    $0x8,%eax
c01063ce:	83 ec 0c             	sub    $0xc,%esp
c01063d1:	50                   	push   %eax
c01063d2:	e8 1c 3d 00 00       	call   c010a0f3 <isListEmpty>
c01063d7:	83 c4 10             	add    $0x10,%esp
c01063da:	3c 01                	cmp    $0x1,%al
c01063dc:	0f 85 c1 00 00 00    	jne    c01064a3 <sys_malloc2+0x20c>
c01063e2:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c01063e9:	83 ec 08             	sub    $0x8,%esp
c01063ec:	ff 75 f0             	pushl  -0x10(%ebp)
c01063ef:	6a 01                	push   $0x1
c01063f1:	e8 f1 fd ff ff       	call   c01061e7 <alloc_memory>
c01063f6:	83 c4 10             	add    $0x10,%esp
c01063f9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01063fc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01063ff:	83 ec 0c             	sub    $0xc,%esp
c0106402:	50                   	push   %eax
c0106403:	e8 79 fe ff ff       	call   c0106281 <block2arena>
c0106408:	83 c4 10             	add    $0x10,%esp
c010640b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010640e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106411:	89 d0                	mov    %edx,%eax
c0106413:	01 c0                	add    %eax,%eax
c0106415:	01 d0                	add    %edx,%eax
c0106417:	c1 e0 03             	shl    $0x3,%eax
c010641a:	89 c2                	mov    %eax,%edx
c010641c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010641f:	01 d0                	add    %edx,%eax
c0106421:	8b 50 04             	mov    0x4(%eax),%edx
c0106424:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106427:	89 50 04             	mov    %edx,0x4(%eax)
c010642a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010642d:	8b 00                	mov    (%eax),%eax
c010642f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106432:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106439:	b8 00 10 00 00       	mov    $0x1000,%eax
c010643e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0106441:	ba 00 00 00 00       	mov    $0x0,%edx
c0106446:	f7 75 b8             	divl   -0x48(%ebp)
c0106449:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010644c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010644f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0106452:	01 d0                	add    %edx,%eax
c0106454:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106457:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010645e:	eb 3b                	jmp    c010649b <sys_malloc2+0x204>
c0106460:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106463:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0106467:	89 c2                	mov    %eax,%edx
c0106469:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010646c:	01 d0                	add    %edx,%eax
c010646e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106471:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106474:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106477:	89 d0                	mov    %edx,%eax
c0106479:	01 c0                	add    %eax,%eax
c010647b:	01 d0                	add    %edx,%eax
c010647d:	c1 e0 03             	shl    $0x3,%eax
c0106480:	89 c2                	mov    %eax,%edx
c0106482:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106485:	01 d0                	add    %edx,%eax
c0106487:	83 c0 08             	add    $0x8,%eax
c010648a:	83 ec 08             	sub    $0x8,%esp
c010648d:	51                   	push   %ecx
c010648e:	50                   	push   %eax
c010648f:	e8 5c 3d 00 00       	call   c010a1f0 <appendToDoubleLinkList>
c0106494:	83 c4 10             	add    $0x10,%esp
c0106497:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010649b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010649e:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01064a1:	77 bd                	ja     c0106460 <sys_malloc2+0x1c9>
c01064a3:	83 ec 0c             	sub    $0xc,%esp
c01064a6:	ff 75 c4             	pushl  -0x3c(%ebp)
c01064a9:	e8 33 08 00 00       	call   c0106ce1 <intr_set_status>
c01064ae:	83 c4 10             	add    $0x10,%esp
c01064b1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01064b4:	89 d0                	mov    %edx,%eax
c01064b6:	01 c0                	add    %eax,%eax
c01064b8:	01 d0                	add    %edx,%eax
c01064ba:	c1 e0 03             	shl    $0x3,%eax
c01064bd:	89 c2                	mov    %eax,%edx
c01064bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01064c2:	01 d0                	add    %edx,%eax
c01064c4:	83 c0 08             	add    $0x8,%eax
c01064c7:	83 ec 0c             	sub    $0xc,%esp
c01064ca:	50                   	push   %eax
c01064cb:	e8 8a 3e 00 00       	call   c010a35a <popFromDoubleLinkList>
c01064d0:	83 c4 10             	add    $0x10,%esp
c01064d3:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01064d6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01064d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01064dc:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c01064e0:	75 1c                	jne    c01064fe <sys_malloc2+0x267>
c01064e2:	68 ef 01 00 00       	push   $0x1ef
c01064e7:	68 ba b5 10 c0       	push   $0xc010b5ba
c01064ec:	68 ba b5 10 c0       	push   $0xc010b5ba
c01064f1:	68 db b5 10 c0       	push   $0xc010b5db
c01064f6:	e8 3a 24 00 00       	call   c0108935 <assertion_failure>
c01064fb:	83 c4 10             	add    $0x10,%esp
c01064fe:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106501:	83 ec 0c             	sub    $0xc,%esp
c0106504:	50                   	push   %eax
c0106505:	e8 77 fd ff ff       	call   c0106281 <block2arena>
c010650a:	83 c4 10             	add    $0x10,%esp
c010650d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106510:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106513:	8b 40 04             	mov    0x4(%eax),%eax
c0106516:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106519:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010651c:	89 50 04             	mov    %edx,0x4(%eax)
c010651f:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106526:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010652a:	75 1c                	jne    c0106548 <sys_malloc2+0x2b1>
c010652c:	68 f6 01 00 00       	push   $0x1f6
c0106531:	68 ba b5 10 c0       	push   $0xc010b5ba
c0106536:	68 ba b5 10 c0       	push   $0xc010b5ba
c010653b:	68 ed b5 10 c0       	push   $0xc010b5ed
c0106540:	e8 f0 23 00 00       	call   c0108935 <assertion_failure>
c0106545:	83 c4 10             	add    $0x10,%esp
c0106548:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010654b:	c9                   	leave  
c010654c:	c3                   	ret    

c010654d <remove_map_entry>:
c010654d:	55                   	push   %ebp
c010654e:	89 e5                	mov    %esp,%ebp
c0106550:	83 ec 10             	sub    $0x10,%esp
c0106553:	ff 75 08             	pushl  0x8(%ebp)
c0106556:	e8 9c f8 ff ff       	call   c0105df7 <ptr_pte>
c010655b:	83 c4 04             	add    $0x4,%esp
c010655e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106561:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106564:	8b 10                	mov    (%eax),%edx
c0106566:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106569:	89 10                	mov    %edx,(%eax)
c010656b:	90                   	nop
c010656c:	c9                   	leave  
c010656d:	c3                   	ret    

c010656e <free_a_page>:
c010656e:	55                   	push   %ebp
c010656f:	89 e5                	mov    %esp,%ebp
c0106571:	83 ec 20             	sub    $0x20,%esp
c0106574:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106578:	75 21                	jne    c010659b <free_a_page+0x2d>
c010657a:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010657f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106582:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106587:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010658a:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010658f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106592:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106599:	eb 1f                	jmp    c01065ba <free_a_page+0x4c>
c010659b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01065a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01065a3:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01065a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01065ab:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01065b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01065b3:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c01065ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01065bd:	c1 e8 0c             	shr    $0xc,%eax
c01065c0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01065c3:	6a 00                	push   $0x0
c01065c5:	ff 75 f8             	pushl  -0x8(%ebp)
c01065c8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01065cb:	50                   	push   %eax
c01065cc:	e8 74 f4 ff ff       	call   c0105a45 <set_bit_val>
c01065d1:	83 c4 0c             	add    $0xc,%esp
c01065d4:	ff 75 08             	pushl  0x8(%ebp)
c01065d7:	e8 22 fa ff ff       	call   c0105ffe <get_physical_address>
c01065dc:	83 c4 04             	add    $0x4,%esp
c01065df:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01065e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01065e5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01065eb:	85 c0                	test   %eax,%eax
c01065ed:	0f 48 c2             	cmovs  %edx,%eax
c01065f0:	c1 f8 0c             	sar    $0xc,%eax
c01065f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01065f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01065f9:	6a 00                	push   $0x0
c01065fb:	ff 75 f0             	pushl  -0x10(%ebp)
c01065fe:	50                   	push   %eax
c01065ff:	e8 41 f4 ff ff       	call   c0105a45 <set_bit_val>
c0106604:	83 c4 0c             	add    $0xc,%esp
c0106607:	ff 75 08             	pushl  0x8(%ebp)
c010660a:	e8 3e ff ff ff       	call   c010654d <remove_map_entry>
c010660f:	83 c4 04             	add    $0x4,%esp
c0106612:	90                   	nop
c0106613:	c9                   	leave  
c0106614:	c3                   	ret    

c0106615 <sys_free2>:
c0106615:	55                   	push   %ebp
c0106616:	89 e5                	mov    %esp,%ebp
c0106618:	83 ec 58             	sub    $0x58,%esp
c010661b:	e8 ce 9d ff ff       	call   c01003ee <get_running_thread_pcb>
c0106620:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106623:	e8 90 06 00 00       	call   c0106cb8 <intr_disable>
c0106628:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010662b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010662e:	8b 50 08             	mov    0x8(%eax),%edx
c0106631:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106636:	39 c2                	cmp    %eax,%edx
c0106638:	75 10                	jne    c010664a <sys_free2+0x35>
c010663a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106641:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c0106648:	eb 10                	jmp    c010665a <sys_free2+0x45>
c010664a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106651:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106654:	83 c0 10             	add    $0x10,%eax
c0106657:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010665a:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0106661:	76 4d                	jbe    c01066b0 <sys_free2+0x9b>
c0106663:	8b 45 08             	mov    0x8(%ebp),%eax
c0106666:	83 e8 0c             	sub    $0xc,%eax
c0106669:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010666c:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0106670:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106673:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106678:	c1 e8 0c             	shr    $0xc,%eax
c010667b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010667e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106685:	eb 1c                	jmp    c01066a3 <sys_free2+0x8e>
c0106687:	83 ec 08             	sub    $0x8,%esp
c010668a:	ff 75 f4             	pushl  -0xc(%ebp)
c010668d:	ff 75 ec             	pushl  -0x14(%ebp)
c0106690:	e8 d9 fe ff ff       	call   c010656e <free_a_page>
c0106695:	83 c4 10             	add    $0x10,%esp
c0106698:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010669f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01066a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01066a6:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c01066a9:	77 dc                	ja     c0106687 <sys_free2+0x72>
c01066ab:	e9 dc 00 00 00       	jmp    c010678c <sys_free2+0x177>
c01066b0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01066b7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01066be:	eb 26                	jmp    c01066e6 <sys_free2+0xd1>
c01066c0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01066c3:	89 d0                	mov    %edx,%eax
c01066c5:	01 c0                	add    %eax,%eax
c01066c7:	01 d0                	add    %edx,%eax
c01066c9:	c1 e0 03             	shl    $0x3,%eax
c01066cc:	89 c2                	mov    %eax,%edx
c01066ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066d1:	01 d0                	add    %edx,%eax
c01066d3:	8b 00                	mov    (%eax),%eax
c01066d5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01066d8:	77 08                	ja     c01066e2 <sys_free2+0xcd>
c01066da:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01066dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01066e0:	eb 0a                	jmp    c01066ec <sys_free2+0xd7>
c01066e2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01066e6:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c01066ea:	7e d4                	jle    c01066c0 <sys_free2+0xab>
c01066ec:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01066ef:	89 d0                	mov    %edx,%eax
c01066f1:	01 c0                	add    %eax,%eax
c01066f3:	01 d0                	add    %edx,%eax
c01066f5:	c1 e0 03             	shl    $0x3,%eax
c01066f8:	89 c2                	mov    %eax,%edx
c01066fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066fd:	01 d0                	add    %edx,%eax
c01066ff:	8b 10                	mov    (%eax),%edx
c0106701:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106704:	8b 50 04             	mov    0x4(%eax),%edx
c0106707:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010670a:	8b 50 08             	mov    0x8(%eax),%edx
c010670d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106710:	8b 50 0c             	mov    0xc(%eax),%edx
c0106713:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106716:	8b 50 10             	mov    0x10(%eax),%edx
c0106719:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010671c:	8b 40 14             	mov    0x14(%eax),%eax
c010671f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106722:	8b 45 08             	mov    0x8(%ebp),%eax
c0106725:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106728:	83 ec 0c             	sub    $0xc,%esp
c010672b:	ff 75 d0             	pushl  -0x30(%ebp)
c010672e:	e8 4e fb ff ff       	call   c0106281 <block2arena>
c0106733:	83 c4 10             	add    $0x10,%esp
c0106736:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106739:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010673c:	89 d0                	mov    %edx,%eax
c010673e:	01 c0                	add    %eax,%eax
c0106740:	01 d0                	add    %edx,%eax
c0106742:	c1 e0 03             	shl    $0x3,%eax
c0106745:	89 c2                	mov    %eax,%edx
c0106747:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010674a:	01 d0                	add    %edx,%eax
c010674c:	83 c0 08             	add    $0x8,%eax
c010674f:	83 ec 08             	sub    $0x8,%esp
c0106752:	ff 75 d0             	pushl  -0x30(%ebp)
c0106755:	50                   	push   %eax
c0106756:	e8 95 3a 00 00       	call   c010a1f0 <appendToDoubleLinkList>
c010675b:	83 c4 10             	add    $0x10,%esp
c010675e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106761:	8b 40 04             	mov    0x4(%eax),%eax
c0106764:	8d 50 01             	lea    0x1(%eax),%edx
c0106767:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010676a:	89 50 04             	mov    %edx,0x4(%eax)
c010676d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106770:	8b 50 04             	mov    0x4(%eax),%edx
c0106773:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106776:	39 c2                	cmp    %eax,%edx
c0106778:	75 12                	jne    c010678c <sys_free2+0x177>
c010677a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010677d:	83 ec 08             	sub    $0x8,%esp
c0106780:	ff 75 f4             	pushl  -0xc(%ebp)
c0106783:	50                   	push   %eax
c0106784:	e8 e5 fd ff ff       	call   c010656e <free_a_page>
c0106789:	83 c4 10             	add    $0x10,%esp
c010678c:	83 ec 0c             	sub    $0xc,%esp
c010678f:	ff 75 d8             	pushl  -0x28(%ebp)
c0106792:	e8 4a 05 00 00       	call   c0106ce1 <intr_set_status>
c0106797:	83 c4 10             	add    $0x10,%esp
c010679a:	90                   	nop
c010679b:	c9                   	leave  
c010679c:	c3                   	ret    

c010679d <init_memory_block_desc>:
c010679d:	55                   	push   %ebp
c010679e:	89 e5                	mov    %esp,%ebp
c01067a0:	83 ec 18             	sub    $0x18,%esp
c01067a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01067aa:	e9 b2 00 00 00       	jmp    c0106861 <init_memory_block_desc+0xc4>
c01067af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01067b3:	75 1b                	jne    c01067d0 <init_memory_block_desc+0x33>
c01067b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067b8:	89 d0                	mov    %edx,%eax
c01067ba:	01 c0                	add    %eax,%eax
c01067bc:	01 d0                	add    %edx,%eax
c01067be:	c1 e0 03             	shl    $0x3,%eax
c01067c1:	89 c2                	mov    %eax,%edx
c01067c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01067c6:	01 d0                	add    %edx,%eax
c01067c8:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c01067ce:	eb 2e                	jmp    c01067fe <init_memory_block_desc+0x61>
c01067d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067d3:	89 d0                	mov    %edx,%eax
c01067d5:	01 c0                	add    %eax,%eax
c01067d7:	01 d0                	add    %edx,%eax
c01067d9:	c1 e0 03             	shl    $0x3,%eax
c01067dc:	8d 50 e8             	lea    -0x18(%eax),%edx
c01067df:	8b 45 08             	mov    0x8(%ebp),%eax
c01067e2:	01 d0                	add    %edx,%eax
c01067e4:	8b 08                	mov    (%eax),%ecx
c01067e6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067e9:	89 d0                	mov    %edx,%eax
c01067eb:	01 c0                	add    %eax,%eax
c01067ed:	01 d0                	add    %edx,%eax
c01067ef:	c1 e0 03             	shl    $0x3,%eax
c01067f2:	89 c2                	mov    %eax,%edx
c01067f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01067f7:	01 d0                	add    %edx,%eax
c01067f9:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c01067fc:	89 10                	mov    %edx,(%eax)
c01067fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106801:	89 d0                	mov    %edx,%eax
c0106803:	01 c0                	add    %eax,%eax
c0106805:	01 d0                	add    %edx,%eax
c0106807:	c1 e0 03             	shl    $0x3,%eax
c010680a:	89 c2                	mov    %eax,%edx
c010680c:	8b 45 08             	mov    0x8(%ebp),%eax
c010680f:	01 d0                	add    %edx,%eax
c0106811:	8b 00                	mov    (%eax),%eax
c0106813:	89 c1                	mov    %eax,%ecx
c0106815:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c010681a:	ba 00 00 00 00       	mov    $0x0,%edx
c010681f:	f7 f1                	div    %ecx
c0106821:	89 c1                	mov    %eax,%ecx
c0106823:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106826:	89 d0                	mov    %edx,%eax
c0106828:	01 c0                	add    %eax,%eax
c010682a:	01 d0                	add    %edx,%eax
c010682c:	c1 e0 03             	shl    $0x3,%eax
c010682f:	89 c2                	mov    %eax,%edx
c0106831:	8b 45 08             	mov    0x8(%ebp),%eax
c0106834:	01 d0                	add    %edx,%eax
c0106836:	89 ca                	mov    %ecx,%edx
c0106838:	89 50 04             	mov    %edx,0x4(%eax)
c010683b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010683e:	89 d0                	mov    %edx,%eax
c0106840:	01 c0                	add    %eax,%eax
c0106842:	01 d0                	add    %edx,%eax
c0106844:	c1 e0 03             	shl    $0x3,%eax
c0106847:	89 c2                	mov    %eax,%edx
c0106849:	8b 45 08             	mov    0x8(%ebp),%eax
c010684c:	01 d0                	add    %edx,%eax
c010684e:	83 c0 08             	add    $0x8,%eax
c0106851:	83 ec 0c             	sub    $0xc,%esp
c0106854:	50                   	push   %eax
c0106855:	e8 6b 38 00 00       	call   c010a0c5 <initDoubleLinkList>
c010685a:	83 c4 10             	add    $0x10,%esp
c010685d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0106861:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0106865:	0f 8e 44 ff ff ff    	jle    c01067af <init_memory_block_desc+0x12>
c010686b:	90                   	nop
c010686c:	c9                   	leave  
c010686d:	c3                   	ret    

c010686e <init_memory2>:
c010686e:	55                   	push   %ebp
c010686f:	89 e5                	mov    %esp,%ebp
c0106871:	83 ec 38             	sub    $0x38,%esp
c0106874:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c010687b:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106882:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106885:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c010688a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010688d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106892:	29 c2                	sub    %eax,%edx
c0106894:	89 d0                	mov    %edx,%eax
c0106896:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106899:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010689c:	89 c2                	mov    %eax,%edx
c010689e:	c1 ea 1f             	shr    $0x1f,%edx
c01068a1:	01 d0                	add    %edx,%eax
c01068a3:	d1 f8                	sar    %eax
c01068a5:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c01068aa:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01068af:	83 ec 0c             	sub    $0xc,%esp
c01068b2:	50                   	push   %eax
c01068b3:	e8 52 08 00 00       	call   c010710a <disp_int>
c01068b8:	83 c4 10             	add    $0x10,%esp
c01068bb:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01068c0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01068c3:	29 c2                	sub    %eax,%edx
c01068c5:	89 d0                	mov    %edx,%eax
c01068c7:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c01068cc:	83 ec 0c             	sub    $0xc,%esp
c01068cf:	68 f9 b5 10 c0       	push   $0xc010b5f9
c01068d4:	e8 b3 97 ff ff       	call   c010008c <disp_str>
c01068d9:	83 c4 10             	add    $0x10,%esp
c01068dc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c01068e1:	83 ec 0c             	sub    $0xc,%esp
c01068e4:	50                   	push   %eax
c01068e5:	e8 20 08 00 00       	call   c010710a <disp_int>
c01068ea:	83 c4 10             	add    $0x10,%esp
c01068ed:	83 ec 0c             	sub    $0xc,%esp
c01068f0:	68 f9 b5 10 c0       	push   $0xc010b5f9
c01068f5:	e8 92 97 ff ff       	call   c010008c <disp_str>
c01068fa:	83 c4 10             	add    $0x10,%esp
c01068fd:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106902:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106907:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010690d:	85 c0                	test   %eax,%eax
c010690f:	0f 48 c2             	cmovs  %edx,%eax
c0106912:	c1 f8 0c             	sar    $0xc,%eax
c0106915:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106918:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010691b:	83 c0 07             	add    $0x7,%eax
c010691e:	8d 50 07             	lea    0x7(%eax),%edx
c0106921:	85 c0                	test   %eax,%eax
c0106923:	0f 48 c2             	cmovs  %edx,%eax
c0106926:	c1 f8 03             	sar    $0x3,%eax
c0106929:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c010692e:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106933:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106938:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c010693d:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106943:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106948:	83 ec 04             	sub    $0x4,%esp
c010694b:	52                   	push   %edx
c010694c:	6a 00                	push   $0x0
c010694e:	50                   	push   %eax
c010694f:	e8 7b 58 00 00       	call   c010c1cf <Memset>
c0106954:	83 c4 10             	add    $0x10,%esp
c0106957:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c010695c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106961:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106967:	85 c0                	test   %eax,%eax
c0106969:	0f 48 c2             	cmovs  %edx,%eax
c010696c:	c1 f8 0c             	sar    $0xc,%eax
c010696f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106972:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106975:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106978:	ff 75 e8             	pushl  -0x18(%ebp)
c010697b:	6a 01                	push   $0x1
c010697d:	6a 00                	push   $0x0
c010697f:	68 ac 06 11 c0       	push   $0xc01106ac
c0106984:	e8 37 f1 ff ff       	call   c0105ac0 <set_bits>
c0106989:	83 c4 10             	add    $0x10,%esp
c010698c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106991:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106996:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010699c:	85 c0                	test   %eax,%eax
c010699e:	0f 48 c2             	cmovs  %edx,%eax
c01069a1:	c1 f8 0c             	sar    $0xc,%eax
c01069a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01069a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01069aa:	83 c0 07             	add    $0x7,%eax
c01069ad:	8d 50 07             	lea    0x7(%eax),%edx
c01069b0:	85 c0                	test   %eax,%eax
c01069b2:	0f 48 c2             	cmovs  %edx,%eax
c01069b5:	c1 f8 03             	sar    $0x3,%eax
c01069b8:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c01069bd:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01069c2:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01069c8:	01 d0                	add    %edx,%eax
c01069ca:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c01069cf:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c01069d5:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c01069da:	83 ec 04             	sub    $0x4,%esp
c01069dd:	52                   	push   %edx
c01069de:	6a 00                	push   $0x0
c01069e0:	50                   	push   %eax
c01069e1:	e8 e9 57 00 00       	call   c010c1cf <Memset>
c01069e6:	83 c4 10             	add    $0x10,%esp
c01069e9:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01069ee:	05 ff 0f 00 00       	add    $0xfff,%eax
c01069f3:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069f9:	85 c0                	test   %eax,%eax
c01069fb:	0f 48 c2             	cmovs  %edx,%eax
c01069fe:	c1 f8 0c             	sar    $0xc,%eax
c0106a01:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106a07:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a0a:	ff 75 e8             	pushl  -0x18(%ebp)
c0106a0d:	6a 01                	push   $0x1
c0106a0f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106a12:	68 ac 06 11 c0       	push   $0xc01106ac
c0106a17:	e8 a4 f0 ff ff       	call   c0105ac0 <set_bits>
c0106a1c:	83 c4 10             	add    $0x10,%esp
c0106a1f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106a26:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106a29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106a2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106a2f:	83 c0 07             	add    $0x7,%eax
c0106a32:	8d 50 07             	lea    0x7(%eax),%edx
c0106a35:	85 c0                	test   %eax,%eax
c0106a37:	0f 48 c2             	cmovs  %edx,%eax
c0106a3a:	c1 f8 03             	sar    $0x3,%eax
c0106a3d:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106a42:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106a47:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106a4d:	01 c2                	add    %eax,%edx
c0106a4f:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106a54:	01 d0                	add    %edx,%eax
c0106a56:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106a5b:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106a61:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106a66:	83 ec 04             	sub    $0x4,%esp
c0106a69:	52                   	push   %edx
c0106a6a:	6a 00                	push   $0x0
c0106a6c:	50                   	push   %eax
c0106a6d:	e8 5d 57 00 00       	call   c010c1cf <Memset>
c0106a72:	83 c4 10             	add    $0x10,%esp
c0106a75:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106a78:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a7b:	01 d0                	add    %edx,%eax
c0106a7d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a80:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106a85:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a8a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a90:	85 c0                	test   %eax,%eax
c0106a92:	0f 48 c2             	cmovs  %edx,%eax
c0106a95:	c1 f8 0c             	sar    $0xc,%eax
c0106a98:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a9b:	ff 75 e8             	pushl  -0x18(%ebp)
c0106a9e:	6a 01                	push   $0x1
c0106aa0:	ff 75 e0             	pushl  -0x20(%ebp)
c0106aa3:	68 ac 06 11 c0       	push   $0xc01106ac
c0106aa8:	e8 13 f0 ff ff       	call   c0105ac0 <set_bits>
c0106aad:	83 c4 10             	add    $0x10,%esp
c0106ab0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106ab3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ab6:	01 d0                	add    %edx,%eax
c0106ab8:	c1 e0 0c             	shl    $0xc,%eax
c0106abb:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106ac0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ac3:	83 c0 02             	add    $0x2,%eax
c0106ac6:	c1 e0 0c             	shl    $0xc,%eax
c0106ac9:	89 c2                	mov    %eax,%edx
c0106acb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106ace:	01 d0                	add    %edx,%eax
c0106ad0:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106ad5:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106adc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106adf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106ae2:	90                   	nop
c0106ae3:	c9                   	leave  
c0106ae4:	c3                   	ret    

c0106ae5 <init_memory>:
c0106ae5:	55                   	push   %ebp
c0106ae6:	89 e5                	mov    %esp,%ebp
c0106ae8:	83 ec 38             	sub    $0x38,%esp
c0106aeb:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106af2:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106af9:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106b00:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106b03:	05 00 00 40 00       	add    $0x400000,%eax
c0106b08:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b0e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106b11:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106b17:	85 c0                	test   %eax,%eax
c0106b19:	0f 48 c2             	cmovs  %edx,%eax
c0106b1c:	c1 f8 0c             	sar    $0xc,%eax
c0106b1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106b22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106b25:	89 c2                	mov    %eax,%edx
c0106b27:	c1 ea 1f             	shr    $0x1f,%edx
c0106b2a:	01 d0                	add    %edx,%eax
c0106b2c:	d1 f8                	sar    %eax
c0106b2e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106b31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106b34:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106b37:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106b3a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106b3d:	8d 50 07             	lea    0x7(%eax),%edx
c0106b40:	85 c0                	test   %eax,%eax
c0106b42:	0f 48 c2             	cmovs  %edx,%eax
c0106b45:	c1 f8 03             	sar    $0x3,%eax
c0106b48:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106b4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106b4e:	8d 50 07             	lea    0x7(%eax),%edx
c0106b51:	85 c0                	test   %eax,%eax
c0106b53:	0f 48 c2             	cmovs  %edx,%eax
c0106b56:	c1 f8 03             	sar    $0x3,%eax
c0106b59:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106b5c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b5f:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106b64:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106b69:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106b6c:	c1 e2 0c             	shl    $0xc,%edx
c0106b6f:	01 d0                	add    %edx,%eax
c0106b71:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106b76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b79:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106b7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b81:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106b86:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106b8b:	83 ec 04             	sub    $0x4,%esp
c0106b8e:	ff 75 d8             	pushl  -0x28(%ebp)
c0106b91:	6a 00                	push   $0x0
c0106b93:	50                   	push   %eax
c0106b94:	e8 36 56 00 00       	call   c010c1cf <Memset>
c0106b99:	83 c4 10             	add    $0x10,%esp
c0106b9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b9f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ba2:	01 d0                	add    %edx,%eax
c0106ba4:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106ba9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106bac:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106bb1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106bb6:	83 ec 04             	sub    $0x4,%esp
c0106bb9:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106bbc:	6a 00                	push   $0x0
c0106bbe:	50                   	push   %eax
c0106bbf:	e8 0b 56 00 00       	call   c010c1cf <Memset>
c0106bc4:	83 c4 10             	add    $0x10,%esp
c0106bc7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106bca:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106bcf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106bd2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106bd5:	01 c2                	add    %eax,%edx
c0106bd7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106bda:	01 d0                	add    %edx,%eax
c0106bdc:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106be1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106be4:	05 00 00 10 00       	add    $0x100000,%eax
c0106be9:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106bee:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106bf3:	83 ec 04             	sub    $0x4,%esp
c0106bf6:	ff 75 d8             	pushl  -0x28(%ebp)
c0106bf9:	6a 00                	push   $0x0
c0106bfb:	50                   	push   %eax
c0106bfc:	e8 ce 55 00 00       	call   c010c1cf <Memset>
c0106c01:	83 c4 10             	add    $0x10,%esp
c0106c04:	83 ec 04             	sub    $0x4,%esp
c0106c07:	68 f0 00 00 00       	push   $0xf0
c0106c0c:	6a 00                	push   $0x0
c0106c0e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106c13:	e8 b7 55 00 00       	call   c010c1cf <Memset>
c0106c18:	83 c4 10             	add    $0x10,%esp
c0106c1b:	83 ec 0c             	sub    $0xc,%esp
c0106c1e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106c23:	e8 75 fb ff ff       	call   c010679d <init_memory_block_desc>
c0106c28:	83 c4 10             	add    $0x10,%esp
c0106c2b:	90                   	nop
c0106c2c:	c9                   	leave  
c0106c2d:	c3                   	ret    

c0106c2e <stop_here>:
c0106c2e:	55                   	push   %ebp
c0106c2f:	89 e5                	mov    %esp,%ebp
c0106c31:	83 ec 08             	sub    $0x8,%esp
c0106c34:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106c3b:	00 00 00 
c0106c3e:	83 ec 0c             	sub    $0xc,%esp
c0106c41:	68 00 b6 10 c0       	push   $0xc010b600
c0106c46:	e8 41 94 ff ff       	call   c010008c <disp_str>
c0106c4b:	83 c4 10             	add    $0x10,%esp
c0106c4e:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106c53:	83 ec 0c             	sub    $0xc,%esp
c0106c56:	50                   	push   %eax
c0106c57:	e8 ae 04 00 00       	call   c010710a <disp_int>
c0106c5c:	83 c4 10             	add    $0x10,%esp
c0106c5f:	83 ec 0c             	sub    $0xc,%esp
c0106c62:	68 02 b6 10 c0       	push   $0xc010b602
c0106c67:	e8 20 94 ff ff       	call   c010008c <disp_str>
c0106c6c:	83 c4 10             	add    $0x10,%esp
c0106c6f:	90                   	nop
c0106c70:	c9                   	leave  
c0106c71:	c3                   	ret    

c0106c72 <catch_error>:
c0106c72:	55                   	push   %ebp
c0106c73:	89 e5                	mov    %esp,%ebp
c0106c75:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106c7a:	83 c0 01             	add    $0x1,%eax
c0106c7d:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106c82:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106c87:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106c8c:	90                   	nop
c0106c8d:	5d                   	pop    %ebp
c0106c8e:	c3                   	ret    

c0106c8f <intr_enable>:
c0106c8f:	55                   	push   %ebp
c0106c90:	89 e5                	mov    %esp,%ebp
c0106c92:	83 ec 18             	sub    $0x18,%esp
c0106c95:	e8 65 00 00 00       	call   c0106cff <intr_get_status>
c0106c9a:	83 f8 01             	cmp    $0x1,%eax
c0106c9d:	75 0c                	jne    c0106cab <intr_enable+0x1c>
c0106c9f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106ca6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ca9:	eb 0b                	jmp    c0106cb6 <intr_enable+0x27>
c0106cab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106cb2:	fb                   	sti    
c0106cb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cb6:	c9                   	leave  
c0106cb7:	c3                   	ret    

c0106cb8 <intr_disable>:
c0106cb8:	55                   	push   %ebp
c0106cb9:	89 e5                	mov    %esp,%ebp
c0106cbb:	83 ec 18             	sub    $0x18,%esp
c0106cbe:	e8 3c 00 00 00       	call   c0106cff <intr_get_status>
c0106cc3:	83 f8 01             	cmp    $0x1,%eax
c0106cc6:	75 0d                	jne    c0106cd5 <intr_disable+0x1d>
c0106cc8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106ccf:	fa                   	cli    
c0106cd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cd3:	eb 0a                	jmp    c0106cdf <intr_disable+0x27>
c0106cd5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106cdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cdf:	c9                   	leave  
c0106ce0:	c3                   	ret    

c0106ce1 <intr_set_status>:
c0106ce1:	55                   	push   %ebp
c0106ce2:	89 e5                	mov    %esp,%ebp
c0106ce4:	83 ec 08             	sub    $0x8,%esp
c0106ce7:	8b 45 08             	mov    0x8(%ebp),%eax
c0106cea:	83 e0 01             	and    $0x1,%eax
c0106ced:	85 c0                	test   %eax,%eax
c0106cef:	74 07                	je     c0106cf8 <intr_set_status+0x17>
c0106cf1:	e8 99 ff ff ff       	call   c0106c8f <intr_enable>
c0106cf6:	eb 05                	jmp    c0106cfd <intr_set_status+0x1c>
c0106cf8:	e8 bb ff ff ff       	call   c0106cb8 <intr_disable>
c0106cfd:	c9                   	leave  
c0106cfe:	c3                   	ret    

c0106cff <intr_get_status>:
c0106cff:	55                   	push   %ebp
c0106d00:	89 e5                	mov    %esp,%ebp
c0106d02:	83 ec 10             	sub    $0x10,%esp
c0106d05:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106d0c:	9c                   	pushf  
c0106d0d:	58                   	pop    %eax
c0106d0e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106d11:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106d14:	c1 e8 09             	shr    $0x9,%eax
c0106d17:	83 e0 01             	and    $0x1,%eax
c0106d1a:	c9                   	leave  
c0106d1b:	c3                   	ret    

c0106d1c <Memcpy>:
c0106d1c:	55                   	push   %ebp
c0106d1d:	89 e5                	mov    %esp,%ebp
c0106d1f:	83 ec 18             	sub    $0x18,%esp
c0106d22:	e8 91 ff ff ff       	call   c0106cb8 <intr_disable>
c0106d27:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106d2a:	83 ec 04             	sub    $0x4,%esp
c0106d2d:	ff 75 10             	pushl  0x10(%ebp)
c0106d30:	ff 75 0c             	pushl  0xc(%ebp)
c0106d33:	ff 75 08             	pushl  0x8(%ebp)
c0106d36:	e8 66 54 00 00       	call   c010c1a1 <Memcpy2>
c0106d3b:	83 c4 10             	add    $0x10,%esp
c0106d3e:	83 ec 0c             	sub    $0xc,%esp
c0106d41:	ff 75 f4             	pushl  -0xc(%ebp)
c0106d44:	e8 98 ff ff ff       	call   c0106ce1 <intr_set_status>
c0106d49:	83 c4 10             	add    $0x10,%esp
c0106d4c:	90                   	nop
c0106d4d:	c9                   	leave  
c0106d4e:	c3                   	ret    

c0106d4f <untar>:
c0106d4f:	55                   	push   %ebp
c0106d50:	89 e5                	mov    %esp,%ebp
c0106d52:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106d58:	83 ec 08             	sub    $0x8,%esp
c0106d5b:	6a 00                	push   $0x0
c0106d5d:	ff 75 08             	pushl  0x8(%ebp)
c0106d60:	e8 2a de ff ff       	call   c0104b8f <open>
c0106d65:	83 c4 10             	add    $0x10,%esp
c0106d68:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106d6b:	83 ec 0c             	sub    $0xc,%esp
c0106d6e:	68 04 b6 10 c0       	push   $0xc010b604
c0106d73:	e8 60 18 00 00       	call   c01085d8 <Printf>
c0106d78:	83 c4 10             	add    $0x10,%esp
c0106d7b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106d82:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106d89:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d90:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106d97:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106d9e:	e9 63 02 00 00       	jmp    c0107006 <untar+0x2b7>
c0106da3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106da7:	7e 58                	jle    c0106e01 <untar+0xb2>
c0106da9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106dac:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106db1:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106db7:	85 c0                	test   %eax,%eax
c0106db9:	0f 48 c2             	cmovs  %edx,%eax
c0106dbc:	c1 f8 09             	sar    $0x9,%eax
c0106dbf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106dc2:	83 ec 04             	sub    $0x4,%esp
c0106dc5:	68 00 02 00 00       	push   $0x200
c0106dca:	6a 00                	push   $0x0
c0106dcc:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106dd2:	50                   	push   %eax
c0106dd3:	e8 f7 53 00 00       	call   c010c1cf <Memset>
c0106dd8:	83 c4 10             	add    $0x10,%esp
c0106ddb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106dde:	c1 e0 09             	shl    $0x9,%eax
c0106de1:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106de4:	83 ec 04             	sub    $0x4,%esp
c0106de7:	50                   	push   %eax
c0106de8:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106dee:	50                   	push   %eax
c0106def:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106df2:	e8 2d de ff ff       	call   c0104c24 <read>
c0106df7:	83 c4 10             	add    $0x10,%esp
c0106dfa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106e01:	83 ec 04             	sub    $0x4,%esp
c0106e04:	68 00 02 00 00       	push   $0x200
c0106e09:	6a 00                	push   $0x0
c0106e0b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e11:	50                   	push   %eax
c0106e12:	e8 b8 53 00 00       	call   c010c1cf <Memset>
c0106e17:	83 c4 10             	add    $0x10,%esp
c0106e1a:	83 ec 04             	sub    $0x4,%esp
c0106e1d:	68 00 02 00 00       	push   $0x200
c0106e22:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e28:	50                   	push   %eax
c0106e29:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106e2c:	e8 f3 dd ff ff       	call   c0104c24 <read>
c0106e31:	83 c4 10             	add    $0x10,%esp
c0106e34:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106e37:	83 ec 0c             	sub    $0xc,%esp
c0106e3a:	68 16 b6 10 c0       	push   $0xc010b616
c0106e3f:	e8 94 17 00 00       	call   c01085d8 <Printf>
c0106e44:	83 c4 10             	add    $0x10,%esp
c0106e47:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106e4b:	0f 84 c1 01 00 00    	je     c0107012 <untar+0x2c3>
c0106e51:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106e54:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106e57:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106e5e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e64:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106e67:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106e6a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106e6d:	83 ec 08             	sub    $0x8,%esp
c0106e70:	6a 07                	push   $0x7
c0106e72:	ff 75 cc             	pushl  -0x34(%ebp)
c0106e75:	e8 15 dd ff ff       	call   c0104b8f <open>
c0106e7a:	83 c4 10             	add    $0x10,%esp
c0106e7d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106e80:	83 ec 0c             	sub    $0xc,%esp
c0106e83:	68 28 b6 10 c0       	push   $0xc010b628
c0106e88:	e8 4b 17 00 00       	call   c01085d8 <Printf>
c0106e8d:	83 c4 10             	add    $0x10,%esp
c0106e90:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106e97:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106e9a:	83 c0 7c             	add    $0x7c,%eax
c0106e9d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106ea0:	83 ec 0c             	sub    $0xc,%esp
c0106ea3:	ff 75 cc             	pushl  -0x34(%ebp)
c0106ea6:	e8 5d 53 00 00       	call   c010c208 <Strlen>
c0106eab:	83 c4 10             	add    $0x10,%esp
c0106eae:	85 c0                	test   %eax,%eax
c0106eb0:	75 28                	jne    c0106eda <untar+0x18b>
c0106eb2:	83 ec 0c             	sub    $0xc,%esp
c0106eb5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106eb8:	e8 4b 53 00 00       	call   c010c208 <Strlen>
c0106ebd:	83 c4 10             	add    $0x10,%esp
c0106ec0:	85 c0                	test   %eax,%eax
c0106ec2:	75 16                	jne    c0106eda <untar+0x18b>
c0106ec4:	83 ec 0c             	sub    $0xc,%esp
c0106ec7:	68 3a b6 10 c0       	push   $0xc010b63a
c0106ecc:	e8 07 17 00 00       	call   c01085d8 <Printf>
c0106ed1:	83 c4 10             	add    $0x10,%esp
c0106ed4:	90                   	nop
c0106ed5:	e9 39 01 00 00       	jmp    c0107013 <untar+0x2c4>
c0106eda:	83 ec 0c             	sub    $0xc,%esp
c0106edd:	68 41 b6 10 c0       	push   $0xc010b641
c0106ee2:	e8 f1 16 00 00       	call   c01085d8 <Printf>
c0106ee7:	83 c4 10             	add    $0x10,%esp
c0106eea:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106eed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106ef0:	eb 1f                	jmp    c0106f11 <untar+0x1c2>
c0106ef2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106ef5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106efc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106eff:	0f b6 00             	movzbl (%eax),%eax
c0106f02:	0f be c0             	movsbl %al,%eax
c0106f05:	83 e8 30             	sub    $0x30,%eax
c0106f08:	01 d0                	add    %edx,%eax
c0106f0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106f0d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106f11:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106f14:	0f b6 00             	movzbl (%eax),%eax
c0106f17:	84 c0                	test   %al,%al
c0106f19:	75 d7                	jne    c0106ef2 <untar+0x1a3>
c0106f1b:	83 ec 0c             	sub    $0xc,%esp
c0106f1e:	68 4f b6 10 c0       	push   $0xc010b64f
c0106f23:	e8 b0 16 00 00       	call   c01085d8 <Printf>
c0106f28:	83 c4 10             	add    $0x10,%esp
c0106f2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f2e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106f31:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106f38:	83 ec 08             	sub    $0x8,%esp
c0106f3b:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f3e:	68 5d b6 10 c0       	push   $0xc010b65d
c0106f43:	e8 90 16 00 00       	call   c01085d8 <Printf>
c0106f48:	83 c4 10             	add    $0x10,%esp
c0106f4b:	83 ec 08             	sub    $0x8,%esp
c0106f4e:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f51:	68 6f b6 10 c0       	push   $0xc010b66f
c0106f56:	e8 7d 16 00 00       	call   c01085d8 <Printf>
c0106f5b:	83 c4 10             	add    $0x10,%esp
c0106f5e:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106f61:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106f64:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106f68:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106f6b:	e8 02 fd ff ff       	call   c0106c72 <catch_error>
c0106f70:	83 ec 04             	sub    $0x4,%esp
c0106f73:	ff 75 b8             	pushl  -0x48(%ebp)
c0106f76:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106f7c:	50                   	push   %eax
c0106f7d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106f80:	e8 9f dc ff ff       	call   c0104c24 <read>
c0106f85:	83 c4 10             	add    $0x10,%esp
c0106f88:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106f8b:	83 ec 04             	sub    $0x4,%esp
c0106f8e:	ff 75 b8             	pushl  -0x48(%ebp)
c0106f91:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106f97:	50                   	push   %eax
c0106f98:	ff 75 c8             	pushl  -0x38(%ebp)
c0106f9b:	e8 05 de ff ff       	call   c0104da5 <write>
c0106fa0:	83 c4 10             	add    $0x10,%esp
c0106fa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fa6:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106fa9:	7d 02                	jge    c0106fad <untar+0x25e>
c0106fab:	eb be                	jmp    c0106f6b <untar+0x21c>
c0106fad:	90                   	nop
c0106fae:	83 ec 08             	sub    $0x8,%esp
c0106fb1:	ff 75 f4             	pushl  -0xc(%ebp)
c0106fb4:	68 81 b6 10 c0       	push   $0xc010b681
c0106fb9:	e8 1a 16 00 00       	call   c01085d8 <Printf>
c0106fbe:	83 c4 10             	add    $0x10,%esp
c0106fc1:	83 ec 08             	sub    $0x8,%esp
c0106fc4:	ff 75 c0             	pushl  -0x40(%ebp)
c0106fc7:	68 93 b6 10 c0       	push   $0xc010b693
c0106fcc:	e8 07 16 00 00       	call   c01085d8 <Printf>
c0106fd1:	83 c4 10             	add    $0x10,%esp
c0106fd4:	83 ec 0c             	sub    $0xc,%esp
c0106fd7:	68 a4 b6 10 c0       	push   $0xc010b6a4
c0106fdc:	e8 f7 15 00 00       	call   c01085d8 <Printf>
c0106fe1:	83 c4 10             	add    $0x10,%esp
c0106fe4:	83 ec 0c             	sub    $0xc,%esp
c0106fe7:	ff 75 c8             	pushl  -0x38(%ebp)
c0106fea:	e8 3b de ff ff       	call   c0104e2a <close>
c0106fef:	83 c4 10             	add    $0x10,%esp
c0106ff2:	83 ec 0c             	sub    $0xc,%esp
c0106ff5:	68 b2 b6 10 c0       	push   $0xc010b6b2
c0106ffa:	e8 d9 15 00 00       	call   c01085d8 <Printf>
c0106fff:	83 c4 10             	add    $0x10,%esp
c0107002:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0107006:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010700a:	0f 8f 93 fd ff ff    	jg     c0106da3 <untar+0x54>
c0107010:	eb 01                	jmp    c0107013 <untar+0x2c4>
c0107012:	90                   	nop
c0107013:	83 ec 0c             	sub    $0xc,%esp
c0107016:	68 bf b6 10 c0       	push   $0xc010b6bf
c010701b:	e8 b8 15 00 00       	call   c01085d8 <Printf>
c0107020:	83 c4 10             	add    $0x10,%esp
c0107023:	83 ec 0c             	sub    $0xc,%esp
c0107026:	68 d1 b6 10 c0       	push   $0xc010b6d1
c010702b:	e8 a8 15 00 00       	call   c01085d8 <Printf>
c0107030:	83 c4 10             	add    $0x10,%esp
c0107033:	83 ec 0c             	sub    $0xc,%esp
c0107036:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107039:	e8 ec dd ff ff       	call   c0104e2a <close>
c010703e:	83 c4 10             	add    $0x10,%esp
c0107041:	83 ec 0c             	sub    $0xc,%esp
c0107044:	68 e1 b6 10 c0       	push   $0xc010b6e1
c0107049:	e8 8a 15 00 00       	call   c01085d8 <Printf>
c010704e:	83 c4 10             	add    $0x10,%esp
c0107051:	83 ec 0c             	sub    $0xc,%esp
c0107054:	68 f4 b6 10 c0       	push   $0xc010b6f4
c0107059:	e8 7a 15 00 00       	call   c01085d8 <Printf>
c010705e:	83 c4 10             	add    $0x10,%esp
c0107061:	90                   	nop
c0107062:	c9                   	leave  
c0107063:	c3                   	ret    

c0107064 <atoi>:
c0107064:	55                   	push   %ebp
c0107065:	89 e5                	mov    %esp,%ebp
c0107067:	83 ec 10             	sub    $0x10,%esp
c010706a:	8b 45 08             	mov    0x8(%ebp),%eax
c010706d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107070:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107073:	8d 50 01             	lea    0x1(%eax),%edx
c0107076:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107079:	c6 00 30             	movb   $0x30,(%eax)
c010707c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010707f:	8d 50 01             	lea    0x1(%eax),%edx
c0107082:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107085:	c6 00 78             	movb   $0x78,(%eax)
c0107088:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c010708c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0107090:	75 0e                	jne    c01070a0 <atoi+0x3c>
c0107092:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107095:	8d 50 01             	lea    0x1(%eax),%edx
c0107098:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010709b:	c6 00 30             	movb   $0x30,(%eax)
c010709e:	eb 61                	jmp    c0107101 <atoi+0x9d>
c01070a0:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c01070a7:	eb 52                	jmp    c01070fb <atoi+0x97>
c01070a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01070ac:	8b 55 0c             	mov    0xc(%ebp),%edx
c01070af:	89 c1                	mov    %eax,%ecx
c01070b1:	d3 fa                	sar    %cl,%edx
c01070b3:	89 d0                	mov    %edx,%eax
c01070b5:	83 e0 0f             	and    $0xf,%eax
c01070b8:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070bb:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c01070bf:	75 06                	jne    c01070c7 <atoi+0x63>
c01070c1:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c01070c5:	74 2f                	je     c01070f6 <atoi+0x92>
c01070c7:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c01070cb:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01070cf:	83 c0 30             	add    $0x30,%eax
c01070d2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070d5:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c01070d9:	7e 0a                	jle    c01070e5 <atoi+0x81>
c01070db:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01070df:	83 c0 07             	add    $0x7,%eax
c01070e2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01070e8:	8d 50 01             	lea    0x1(%eax),%edx
c01070eb:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01070ee:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c01070f2:	88 10                	mov    %dl,(%eax)
c01070f4:	eb 01                	jmp    c01070f7 <atoi+0x93>
c01070f6:	90                   	nop
c01070f7:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c01070fb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01070ff:	79 a8                	jns    c01070a9 <atoi+0x45>
c0107101:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107104:	c6 00 00             	movb   $0x0,(%eax)
c0107107:	90                   	nop
c0107108:	c9                   	leave  
c0107109:	c3                   	ret    

c010710a <disp_int>:
c010710a:	55                   	push   %ebp
c010710b:	89 e5                	mov    %esp,%ebp
c010710d:	83 ec 18             	sub    $0x18,%esp
c0107110:	ff 75 08             	pushl  0x8(%ebp)
c0107113:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107116:	50                   	push   %eax
c0107117:	e8 48 ff ff ff       	call   c0107064 <atoi>
c010711c:	83 c4 08             	add    $0x8,%esp
c010711f:	83 ec 08             	sub    $0x8,%esp
c0107122:	6a 0b                	push   $0xb
c0107124:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107127:	50                   	push   %eax
c0107128:	e8 9a 8f ff ff       	call   c01000c7 <disp_str_colour>
c010712d:	83 c4 10             	add    $0x10,%esp
c0107130:	90                   	nop
c0107131:	c9                   	leave  
c0107132:	c3                   	ret    

c0107133 <do_page_fault>:
c0107133:	55                   	push   %ebp
c0107134:	89 e5                	mov    %esp,%ebp
c0107136:	83 ec 28             	sub    $0x28,%esp
c0107139:	0f 20 d0             	mov    %cr2,%eax
c010713c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010713f:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107146:	00 00 00 
c0107149:	83 ec 0c             	sub    $0xc,%esp
c010714c:	68 ff b6 10 c0       	push   $0xc010b6ff
c0107151:	e8 36 8f ff ff       	call   c010008c <disp_str>
c0107156:	83 c4 10             	add    $0x10,%esp
c0107159:	83 ec 0c             	sub    $0xc,%esp
c010715c:	68 0e b7 10 c0       	push   $0xc010b70e
c0107161:	e8 26 8f ff ff       	call   c010008c <disp_str>
c0107166:	83 c4 10             	add    $0x10,%esp
c0107169:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010716c:	83 ec 0c             	sub    $0xc,%esp
c010716f:	50                   	push   %eax
c0107170:	e8 95 ff ff ff       	call   c010710a <disp_int>
c0107175:	83 c4 10             	add    $0x10,%esp
c0107178:	83 ec 0c             	sub    $0xc,%esp
c010717b:	68 13 b7 10 c0       	push   $0xc010b713
c0107180:	e8 07 8f ff ff       	call   c010008c <disp_str>
c0107185:	83 c4 10             	add    $0x10,%esp
c0107188:	83 ec 0c             	sub    $0xc,%esp
c010718b:	ff 75 f4             	pushl  -0xc(%ebp)
c010718e:	e8 51 ec ff ff       	call   c0105de4 <ptr_pde>
c0107193:	83 c4 10             	add    $0x10,%esp
c0107196:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107199:	83 ec 0c             	sub    $0xc,%esp
c010719c:	ff 75 f4             	pushl  -0xc(%ebp)
c010719f:	e8 53 ec ff ff       	call   c0105df7 <ptr_pte>
c01071a4:	83 c4 10             	add    $0x10,%esp
c01071a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01071aa:	83 ec 0c             	sub    $0xc,%esp
c01071ad:	68 15 b7 10 c0       	push   $0xc010b715
c01071b2:	e8 d5 8e ff ff       	call   c010008c <disp_str>
c01071b7:	83 c4 10             	add    $0x10,%esp
c01071ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01071bd:	83 ec 0c             	sub    $0xc,%esp
c01071c0:	50                   	push   %eax
c01071c1:	e8 44 ff ff ff       	call   c010710a <disp_int>
c01071c6:	83 c4 10             	add    $0x10,%esp
c01071c9:	83 ec 0c             	sub    $0xc,%esp
c01071cc:	68 1a b7 10 c0       	push   $0xc010b71a
c01071d1:	e8 b6 8e ff ff       	call   c010008c <disp_str>
c01071d6:	83 c4 10             	add    $0x10,%esp
c01071d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01071dc:	8b 00                	mov    (%eax),%eax
c01071de:	83 ec 0c             	sub    $0xc,%esp
c01071e1:	50                   	push   %eax
c01071e2:	e8 23 ff ff ff       	call   c010710a <disp_int>
c01071e7:	83 c4 10             	add    $0x10,%esp
c01071ea:	83 ec 0c             	sub    $0xc,%esp
c01071ed:	68 13 b7 10 c0       	push   $0xc010b713
c01071f2:	e8 95 8e ff ff       	call   c010008c <disp_str>
c01071f7:	83 c4 10             	add    $0x10,%esp
c01071fa:	83 ec 0c             	sub    $0xc,%esp
c01071fd:	68 23 b7 10 c0       	push   $0xc010b723
c0107202:	e8 85 8e ff ff       	call   c010008c <disp_str>
c0107207:	83 c4 10             	add    $0x10,%esp
c010720a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010720d:	83 ec 0c             	sub    $0xc,%esp
c0107210:	50                   	push   %eax
c0107211:	e8 f4 fe ff ff       	call   c010710a <disp_int>
c0107216:	83 c4 10             	add    $0x10,%esp
c0107219:	83 ec 0c             	sub    $0xc,%esp
c010721c:	68 28 b7 10 c0       	push   $0xc010b728
c0107221:	e8 66 8e ff ff       	call   c010008c <disp_str>
c0107226:	83 c4 10             	add    $0x10,%esp
c0107229:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010722c:	8b 00                	mov    (%eax),%eax
c010722e:	83 ec 0c             	sub    $0xc,%esp
c0107231:	50                   	push   %eax
c0107232:	e8 d3 fe ff ff       	call   c010710a <disp_int>
c0107237:	83 c4 10             	add    $0x10,%esp
c010723a:	83 ec 0c             	sub    $0xc,%esp
c010723d:	68 13 b7 10 c0       	push   $0xc010b713
c0107242:	e8 45 8e ff ff       	call   c010008c <disp_str>
c0107247:	83 c4 10             	add    $0x10,%esp
c010724a:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0107251:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107254:	8b 00                	mov    (%eax),%eax
c0107256:	83 e0 01             	and    $0x1,%eax
c0107259:	85 c0                	test   %eax,%eax
c010725b:	74 09                	je     c0107266 <do_page_fault+0x133>
c010725d:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0107264:	eb 07                	jmp    c010726d <do_page_fault+0x13a>
c0107266:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010726d:	90                   	nop
c010726e:	c9                   	leave  
c010726f:	c3                   	ret    

c0107270 <exception_handler>:
c0107270:	55                   	push   %ebp
c0107271:	89 e5                	mov    %esp,%ebp
c0107273:	57                   	push   %edi
c0107274:	56                   	push   %esi
c0107275:	53                   	push   %ebx
c0107276:	83 ec 6c             	sub    $0x6c,%esp
c0107279:	8d 45 8c             	lea    -0x74(%ebp),%eax
c010727c:	bb a0 b9 10 c0       	mov    $0xc010b9a0,%ebx
c0107281:	ba 13 00 00 00       	mov    $0x13,%edx
c0107286:	89 c7                	mov    %eax,%edi
c0107288:	89 de                	mov    %ebx,%esi
c010728a:	89 d1                	mov    %edx,%ecx
c010728c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010728e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107295:	eb 04                	jmp    c010729b <exception_handler+0x2b>
c0107297:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010729b:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c01072a2:	7e f3                	jle    c0107297 <exception_handler+0x27>
c01072a4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01072ab:	00 00 00 
c01072ae:	83 ec 0c             	sub    $0xc,%esp
c01072b1:	68 31 b7 10 c0       	push   $0xc010b731
c01072b6:	e8 d1 8d ff ff       	call   c010008c <disp_str>
c01072bb:	83 c4 10             	add    $0x10,%esp
c01072be:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c01072c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01072c8:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c01072cc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01072cf:	83 ec 0c             	sub    $0xc,%esp
c01072d2:	ff 75 dc             	pushl  -0x24(%ebp)
c01072d5:	e8 b2 8d ff ff       	call   c010008c <disp_str>
c01072da:	83 c4 10             	add    $0x10,%esp
c01072dd:	83 ec 0c             	sub    $0xc,%esp
c01072e0:	68 3f b7 10 c0       	push   $0xc010b73f
c01072e5:	e8 a2 8d ff ff       	call   c010008c <disp_str>
c01072ea:	83 c4 10             	add    $0x10,%esp
c01072ed:	83 ec 0c             	sub    $0xc,%esp
c01072f0:	68 42 b7 10 c0       	push   $0xc010b742
c01072f5:	e8 92 8d ff ff       	call   c010008c <disp_str>
c01072fa:	83 c4 10             	add    $0x10,%esp
c01072fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0107300:	83 ec 0c             	sub    $0xc,%esp
c0107303:	50                   	push   %eax
c0107304:	e8 01 fe ff ff       	call   c010710a <disp_int>
c0107309:	83 c4 10             	add    $0x10,%esp
c010730c:	83 ec 0c             	sub    $0xc,%esp
c010730f:	68 3f b7 10 c0       	push   $0xc010b73f
c0107314:	e8 73 8d ff ff       	call   c010008c <disp_str>
c0107319:	83 c4 10             	add    $0x10,%esp
c010731c:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107320:	74 2f                	je     c0107351 <exception_handler+0xe1>
c0107322:	83 ec 0c             	sub    $0xc,%esp
c0107325:	68 4a b7 10 c0       	push   $0xc010b74a
c010732a:	e8 5d 8d ff ff       	call   c010008c <disp_str>
c010732f:	83 c4 10             	add    $0x10,%esp
c0107332:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107335:	83 ec 0c             	sub    $0xc,%esp
c0107338:	50                   	push   %eax
c0107339:	e8 cc fd ff ff       	call   c010710a <disp_int>
c010733e:	83 c4 10             	add    $0x10,%esp
c0107341:	83 ec 0c             	sub    $0xc,%esp
c0107344:	68 3f b7 10 c0       	push   $0xc010b73f
c0107349:	e8 3e 8d ff ff       	call   c010008c <disp_str>
c010734e:	83 c4 10             	add    $0x10,%esp
c0107351:	83 ec 0c             	sub    $0xc,%esp
c0107354:	68 54 b7 10 c0       	push   $0xc010b754
c0107359:	e8 2e 8d ff ff       	call   c010008c <disp_str>
c010735e:	83 c4 10             	add    $0x10,%esp
c0107361:	83 ec 0c             	sub    $0xc,%esp
c0107364:	ff 75 14             	pushl  0x14(%ebp)
c0107367:	e8 9e fd ff ff       	call   c010710a <disp_int>
c010736c:	83 c4 10             	add    $0x10,%esp
c010736f:	83 ec 0c             	sub    $0xc,%esp
c0107372:	68 3f b7 10 c0       	push   $0xc010b73f
c0107377:	e8 10 8d ff ff       	call   c010008c <disp_str>
c010737c:	83 c4 10             	add    $0x10,%esp
c010737f:	83 ec 0c             	sub    $0xc,%esp
c0107382:	68 58 b7 10 c0       	push   $0xc010b758
c0107387:	e8 00 8d ff ff       	call   c010008c <disp_str>
c010738c:	83 c4 10             	add    $0x10,%esp
c010738f:	8b 45 10             	mov    0x10(%ebp),%eax
c0107392:	83 ec 0c             	sub    $0xc,%esp
c0107395:	50                   	push   %eax
c0107396:	e8 6f fd ff ff       	call   c010710a <disp_int>
c010739b:	83 c4 10             	add    $0x10,%esp
c010739e:	83 ec 0c             	sub    $0xc,%esp
c01073a1:	68 3f b7 10 c0       	push   $0xc010b73f
c01073a6:	e8 e1 8c ff ff       	call   c010008c <disp_str>
c01073ab:	83 c4 10             	add    $0x10,%esp
c01073ae:	83 ec 0c             	sub    $0xc,%esp
c01073b1:	68 5d b7 10 c0       	push   $0xc010b75d
c01073b6:	e8 d1 8c ff ff       	call   c010008c <disp_str>
c01073bb:	83 c4 10             	add    $0x10,%esp
c01073be:	83 ec 0c             	sub    $0xc,%esp
c01073c1:	ff 75 18             	pushl  0x18(%ebp)
c01073c4:	e8 41 fd ff ff       	call   c010710a <disp_int>
c01073c9:	83 c4 10             	add    $0x10,%esp
c01073cc:	83 ec 0c             	sub    $0xc,%esp
c01073cf:	68 3f b7 10 c0       	push   $0xc010b73f
c01073d4:	e8 b3 8c ff ff       	call   c010008c <disp_str>
c01073d9:	83 c4 10             	add    $0x10,%esp
c01073dc:	83 ec 0c             	sub    $0xc,%esp
c01073df:	68 68 b7 10 c0       	push   $0xc010b768
c01073e4:	e8 a3 8c ff ff       	call   c010008c <disp_str>
c01073e9:	83 c4 10             	add    $0x10,%esp
c01073ec:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c01073f0:	75 45                	jne    c0107437 <exception_handler+0x1c7>
c01073f2:	0f 20 d0             	mov    %cr2,%eax
c01073f5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01073f8:	83 ec 0c             	sub    $0xc,%esp
c01073fb:	68 87 b7 10 c0       	push   $0xc010b787
c0107400:	e8 87 8c ff ff       	call   c010008c <disp_str>
c0107405:	83 c4 10             	add    $0x10,%esp
c0107408:	83 ec 0c             	sub    $0xc,%esp
c010740b:	68 0e b7 10 c0       	push   $0xc010b70e
c0107410:	e8 77 8c ff ff       	call   c010008c <disp_str>
c0107415:	83 c4 10             	add    $0x10,%esp
c0107418:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010741b:	83 ec 0c             	sub    $0xc,%esp
c010741e:	50                   	push   %eax
c010741f:	e8 e6 fc ff ff       	call   c010710a <disp_int>
c0107424:	83 c4 10             	add    $0x10,%esp
c0107427:	83 ec 0c             	sub    $0xc,%esp
c010742a:	68 13 b7 10 c0       	push   $0xc010b713
c010742f:	e8 58 8c ff ff       	call   c010008c <disp_str>
c0107434:	83 c4 10             	add    $0x10,%esp
c0107437:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c010743b:	75 11                	jne    c010744e <exception_handler+0x1de>
c010743d:	83 ec 0c             	sub    $0xc,%esp
c0107440:	68 93 b7 10 c0       	push   $0xc010b793
c0107445:	e8 42 8c ff ff       	call   c010008c <disp_str>
c010744a:	83 c4 10             	add    $0x10,%esp
c010744d:	90                   	nop
c010744e:	90                   	nop
c010744f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107452:	5b                   	pop    %ebx
c0107453:	5e                   	pop    %esi
c0107454:	5f                   	pop    %edi
c0107455:	5d                   	pop    %ebp
c0107456:	c3                   	ret    

c0107457 <init_internal_interrupt>:
c0107457:	55                   	push   %ebp
c0107458:	89 e5                	mov    %esp,%ebp
c010745a:	83 ec 08             	sub    $0x8,%esp
c010745d:	6a 0e                	push   $0xe
c010745f:	6a 08                	push   $0x8
c0107461:	68 03 01 10 c0       	push   $0xc0100103
c0107466:	6a 00                	push   $0x0
c0107468:	e8 62 c7 ff ff       	call   c0103bcf <InitInterruptDesc>
c010746d:	83 c4 10             	add    $0x10,%esp
c0107470:	6a 0e                	push   $0xe
c0107472:	6a 08                	push   $0x8
c0107474:	68 09 01 10 c0       	push   $0xc0100109
c0107479:	6a 01                	push   $0x1
c010747b:	e8 4f c7 ff ff       	call   c0103bcf <InitInterruptDesc>
c0107480:	83 c4 10             	add    $0x10,%esp
c0107483:	6a 0e                	push   $0xe
c0107485:	6a 08                	push   $0x8
c0107487:	68 0f 01 10 c0       	push   $0xc010010f
c010748c:	6a 02                	push   $0x2
c010748e:	e8 3c c7 ff ff       	call   c0103bcf <InitInterruptDesc>
c0107493:	83 c4 10             	add    $0x10,%esp
c0107496:	6a 0e                	push   $0xe
c0107498:	6a 08                	push   $0x8
c010749a:	68 15 01 10 c0       	push   $0xc0100115
c010749f:	6a 03                	push   $0x3
c01074a1:	e8 29 c7 ff ff       	call   c0103bcf <InitInterruptDesc>
c01074a6:	83 c4 10             	add    $0x10,%esp
c01074a9:	6a 0e                	push   $0xe
c01074ab:	6a 08                	push   $0x8
c01074ad:	68 1b 01 10 c0       	push   $0xc010011b
c01074b2:	6a 04                	push   $0x4
c01074b4:	e8 16 c7 ff ff       	call   c0103bcf <InitInterruptDesc>
c01074b9:	83 c4 10             	add    $0x10,%esp
c01074bc:	6a 0e                	push   $0xe
c01074be:	6a 08                	push   $0x8
c01074c0:	68 21 01 10 c0       	push   $0xc0100121
c01074c5:	6a 05                	push   $0x5
c01074c7:	e8 03 c7 ff ff       	call   c0103bcf <InitInterruptDesc>
c01074cc:	83 c4 10             	add    $0x10,%esp
c01074cf:	6a 0e                	push   $0xe
c01074d1:	6a 08                	push   $0x8
c01074d3:	68 27 01 10 c0       	push   $0xc0100127
c01074d8:	6a 06                	push   $0x6
c01074da:	e8 f0 c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c01074df:	83 c4 10             	add    $0x10,%esp
c01074e2:	6a 0e                	push   $0xe
c01074e4:	6a 08                	push   $0x8
c01074e6:	68 2d 01 10 c0       	push   $0xc010012d
c01074eb:	6a 07                	push   $0x7
c01074ed:	e8 dd c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c01074f2:	83 c4 10             	add    $0x10,%esp
c01074f5:	6a 0e                	push   $0xe
c01074f7:	6a 08                	push   $0x8
c01074f9:	68 33 01 10 c0       	push   $0xc0100133
c01074fe:	6a 08                	push   $0x8
c0107500:	e8 ca c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c0107505:	83 c4 10             	add    $0x10,%esp
c0107508:	6a 0e                	push   $0xe
c010750a:	6a 08                	push   $0x8
c010750c:	68 37 01 10 c0       	push   $0xc0100137
c0107511:	6a 09                	push   $0x9
c0107513:	e8 b7 c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c0107518:	83 c4 10             	add    $0x10,%esp
c010751b:	6a 0e                	push   $0xe
c010751d:	6a 08                	push   $0x8
c010751f:	68 3d 01 10 c0       	push   $0xc010013d
c0107524:	6a 0a                	push   $0xa
c0107526:	e8 a4 c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c010752b:	83 c4 10             	add    $0x10,%esp
c010752e:	6a 0e                	push   $0xe
c0107530:	6a 08                	push   $0x8
c0107532:	68 41 01 10 c0       	push   $0xc0100141
c0107537:	6a 0b                	push   $0xb
c0107539:	e8 91 c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c010753e:	83 c4 10             	add    $0x10,%esp
c0107541:	6a 0e                	push   $0xe
c0107543:	6a 08                	push   $0x8
c0107545:	68 45 01 10 c0       	push   $0xc0100145
c010754a:	6a 0c                	push   $0xc
c010754c:	e8 7e c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c0107551:	83 c4 10             	add    $0x10,%esp
c0107554:	6a 0e                	push   $0xe
c0107556:	6a 08                	push   $0x8
c0107558:	68 49 01 10 c0       	push   $0xc0100149
c010755d:	6a 0d                	push   $0xd
c010755f:	e8 6b c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c0107564:	83 c4 10             	add    $0x10,%esp
c0107567:	6a 0e                	push   $0xe
c0107569:	6a 08                	push   $0x8
c010756b:	68 54 01 10 c0       	push   $0xc0100154
c0107570:	6a 0e                	push   $0xe
c0107572:	e8 58 c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c0107577:	83 c4 10             	add    $0x10,%esp
c010757a:	6a 0e                	push   $0xe
c010757c:	6a 08                	push   $0x8
c010757e:	68 58 01 10 c0       	push   $0xc0100158
c0107583:	6a 10                	push   $0x10
c0107585:	e8 45 c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c010758a:	83 c4 10             	add    $0x10,%esp
c010758d:	6a 0e                	push   $0xe
c010758f:	6a 08                	push   $0x8
c0107591:	68 5e 01 10 c0       	push   $0xc010015e
c0107596:	6a 11                	push   $0x11
c0107598:	e8 32 c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c010759d:	83 c4 10             	add    $0x10,%esp
c01075a0:	6a 0e                	push   $0xe
c01075a2:	6a 08                	push   $0x8
c01075a4:	68 62 01 10 c0       	push   $0xc0100162
c01075a9:	6a 12                	push   $0x12
c01075ab:	e8 1f c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c01075b0:	83 c4 10             	add    $0x10,%esp
c01075b3:	6a 0e                	push   $0xe
c01075b5:	6a 0e                	push   $0xe
c01075b7:	68 6c 02 10 c0       	push   $0xc010026c
c01075bc:	68 90 00 00 00       	push   $0x90
c01075c1:	e8 09 c6 ff ff       	call   c0103bcf <InitInterruptDesc>
c01075c6:	83 c4 10             	add    $0x10,%esp
c01075c9:	90                   	nop
c01075ca:	c9                   	leave  
c01075cb:	c3                   	ret    

c01075cc <spurious_irq>:
c01075cc:	55                   	push   %ebp
c01075cd:	89 e5                	mov    %esp,%ebp
c01075cf:	83 ec 08             	sub    $0x8,%esp
c01075d2:	83 ec 08             	sub    $0x8,%esp
c01075d5:	6a 0b                	push   $0xb
c01075d7:	68 ec b9 10 c0       	push   $0xc010b9ec
c01075dc:	e8 e6 8a ff ff       	call   c01000c7 <disp_str_colour>
c01075e1:	83 c4 10             	add    $0x10,%esp
c01075e4:	83 ec 0c             	sub    $0xc,%esp
c01075e7:	ff 75 08             	pushl  0x8(%ebp)
c01075ea:	e8 1b fb ff ff       	call   c010710a <disp_int>
c01075ef:	83 c4 10             	add    $0x10,%esp
c01075f2:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01075f7:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01075fd:	83 c0 01             	add    $0x1,%eax
c0107600:	83 d2 00             	adc    $0x0,%edx
c0107603:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107608:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010760e:	83 ec 0c             	sub    $0xc,%esp
c0107611:	68 00 b6 10 c0       	push   $0xc010b600
c0107616:	e8 71 8a ff ff       	call   c010008c <disp_str>
c010761b:	83 c4 10             	add    $0x10,%esp
c010761e:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107623:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107629:	83 ec 0c             	sub    $0xc,%esp
c010762c:	50                   	push   %eax
c010762d:	e8 d8 fa ff ff       	call   c010710a <disp_int>
c0107632:	83 c4 10             	add    $0x10,%esp
c0107635:	83 ec 0c             	sub    $0xc,%esp
c0107638:	68 02 b6 10 c0       	push   $0xc010b602
c010763d:	e8 4a 8a ff ff       	call   c010008c <disp_str>
c0107642:	83 c4 10             	add    $0x10,%esp
c0107645:	83 ec 08             	sub    $0x8,%esp
c0107648:	6a 0c                	push   $0xc
c010764a:	68 14 ba 10 c0       	push   $0xc010ba14
c010764f:	e8 73 8a ff ff       	call   c01000c7 <disp_str_colour>
c0107654:	83 c4 10             	add    $0x10,%esp
c0107657:	90                   	nop
c0107658:	c9                   	leave  
c0107659:	c3                   	ret    

c010765a <init_keyboard>:
c010765a:	55                   	push   %ebp
c010765b:	89 e5                	mov    %esp,%ebp
c010765d:	83 ec 08             	sub    $0x8,%esp
c0107660:	83 ec 04             	sub    $0x4,%esp
c0107663:	68 00 02 00 00       	push   $0x200
c0107668:	6a 00                	push   $0x0
c010766a:	68 ec fb 10 c0       	push   $0xc010fbec
c010766f:	e8 5b 4b 00 00       	call   c010c1cf <Memset>
c0107674:	83 c4 10             	add    $0x10,%esp
c0107677:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010767e:	fb 10 c0 
c0107681:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107686:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010768b:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c0107692:	00 00 00 
c0107695:	e8 4f d3 ff ff       	call   c01049e9 <init_keyboard_handler>
c010769a:	90                   	nop
c010769b:	c9                   	leave  
c010769c:	c3                   	ret    

c010769d <TestTTY>:
c010769d:	55                   	push   %ebp
c010769e:	89 e5                	mov    %esp,%ebp
c01076a0:	83 ec 28             	sub    $0x28,%esp
c01076a3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01076aa:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01076b1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01076b7:	83 ec 08             	sub    $0x8,%esp
c01076ba:	6a 02                	push   $0x2
c01076bc:	8d 45 de             	lea    -0x22(%ebp),%eax
c01076bf:	50                   	push   %eax
c01076c0:	e8 ca d4 ff ff       	call   c0104b8f <open>
c01076c5:	83 c4 10             	add    $0x10,%esp
c01076c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01076cb:	83 ec 08             	sub    $0x8,%esp
c01076ce:	6a 02                	push   $0x2
c01076d0:	8d 45 de             	lea    -0x22(%ebp),%eax
c01076d3:	50                   	push   %eax
c01076d4:	e8 b6 d4 ff ff       	call   c0104b8f <open>
c01076d9:	83 c4 10             	add    $0x10,%esp
c01076dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01076df:	83 ec 0c             	sub    $0xc,%esp
c01076e2:	68 39 ba 10 c0       	push   $0xc010ba39
c01076e7:	e8 ec 0e 00 00       	call   c01085d8 <Printf>
c01076ec:	83 c4 10             	add    $0x10,%esp
c01076ef:	83 ec 0c             	sub    $0xc,%esp
c01076f2:	6a 0a                	push   $0xa
c01076f4:	e8 73 9f ff ff       	call   c010166c <sys_malloc>
c01076f9:	83 c4 10             	add    $0x10,%esp
c01076fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01076ff:	83 ec 04             	sub    $0x4,%esp
c0107702:	6a 0a                	push   $0xa
c0107704:	6a 00                	push   $0x0
c0107706:	ff 75 ec             	pushl  -0x14(%ebp)
c0107709:	e8 c1 4a 00 00       	call   c010c1cf <Memset>
c010770e:	83 c4 10             	add    $0x10,%esp
c0107711:	83 ec 04             	sub    $0x4,%esp
c0107714:	6a 0a                	push   $0xa
c0107716:	ff 75 ec             	pushl  -0x14(%ebp)
c0107719:	ff 75 f0             	pushl  -0x10(%ebp)
c010771c:	e8 03 d5 ff ff       	call   c0104c24 <read>
c0107721:	83 c4 10             	add    $0x10,%esp
c0107724:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107727:	83 ec 08             	sub    $0x8,%esp
c010772a:	ff 75 ec             	pushl  -0x14(%ebp)
c010772d:	68 4b ba 10 c0       	push   $0xc010ba4b
c0107732:	e8 a1 0e 00 00       	call   c01085d8 <Printf>
c0107737:	83 c4 10             	add    $0x10,%esp
c010773a:	eb c3                	jmp    c01076ff <TestTTY+0x62>

c010773c <TestReadReturnValue>:
c010773c:	55                   	push   %ebp
c010773d:	89 e5                	mov    %esp,%ebp
c010773f:	81 ec 18 02 00 00    	sub    $0x218,%esp
c0107745:	c7 45 f4 55 ba 10 c0 	movl   $0xc010ba55,-0xc(%ebp)
c010774c:	83 ec 08             	sub    $0x8,%esp
c010774f:	6a 00                	push   $0x0
c0107751:	ff 75 f4             	pushl  -0xc(%ebp)
c0107754:	e8 36 d4 ff ff       	call   c0104b8f <open>
c0107759:	83 c4 10             	add    $0x10,%esp
c010775c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010775f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107766:	83 ec 04             	sub    $0x4,%esp
c0107769:	68 cb 00 00 00       	push   $0xcb
c010776e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0107774:	50                   	push   %eax
c0107775:	ff 75 f0             	pushl  -0x10(%ebp)
c0107778:	e8 a7 d4 ff ff       	call   c0104c24 <read>
c010777d:	83 c4 10             	add    $0x10,%esp
c0107780:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107783:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c010778a:	74 1c                	je     c01077a8 <TestReadReturnValue+0x6c>
c010778c:	68 08 02 00 00       	push   $0x208
c0107791:	68 61 ba 10 c0       	push   $0xc010ba61
c0107796:	68 61 ba 10 c0       	push   $0xc010ba61
c010779b:	68 71 ba 10 c0       	push   $0xc010ba71
c01077a0:	e8 90 11 00 00       	call   c0108935 <assertion_failure>
c01077a5:	83 c4 10             	add    $0x10,%esp
c01077a8:	83 ec 0c             	sub    $0xc,%esp
c01077ab:	ff 75 f0             	pushl  -0x10(%ebp)
c01077ae:	e8 77 d6 ff ff       	call   c0104e2a <close>
c01077b3:	83 c4 10             	add    $0x10,%esp
c01077b6:	90                   	nop
c01077b7:	c9                   	leave  
c01077b8:	c3                   	ret    

c01077b9 <TestWriteReturnValue>:
c01077b9:	55                   	push   %ebp
c01077ba:	89 e5                	mov    %esp,%ebp
c01077bc:	81 ec 28 02 00 00    	sub    $0x228,%esp
c01077c2:	c7 45 f4 7c ba 10 c0 	movl   $0xc010ba7c,-0xc(%ebp)
c01077c9:	83 ec 08             	sub    $0x8,%esp
c01077cc:	6a 07                	push   $0x7
c01077ce:	ff 75 f4             	pushl  -0xc(%ebp)
c01077d1:	e8 b9 d3 ff ff       	call   c0104b8f <open>
c01077d6:	83 c4 10             	add    $0x10,%esp
c01077d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01077dc:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c01077e0:	75 1c                	jne    c01077fe <TestWriteReturnValue+0x45>
c01077e2:	68 12 02 00 00       	push   $0x212
c01077e7:	68 61 ba 10 c0       	push   $0xc010ba61
c01077ec:	68 61 ba 10 c0       	push   $0xc010ba61
c01077f1:	68 89 ba 10 c0       	push   $0xc010ba89
c01077f6:	e8 3a 11 00 00       	call   c0108935 <assertion_failure>
c01077fb:	83 c4 10             	add    $0x10,%esp
c01077fe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107805:	c7 45 e8 94 ba 10 c0 	movl   $0xc010ba94,-0x18(%ebp)
c010780c:	83 ec 0c             	sub    $0xc,%esp
c010780f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107812:	e8 f1 49 00 00       	call   c010c208 <Strlen>
c0107817:	83 c4 10             	add    $0x10,%esp
c010781a:	83 ec 04             	sub    $0x4,%esp
c010781d:	50                   	push   %eax
c010781e:	ff 75 e8             	pushl  -0x18(%ebp)
c0107821:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107827:	50                   	push   %eax
c0107828:	e8 ef f4 ff ff       	call   c0106d1c <Memcpy>
c010782d:	83 c4 10             	add    $0x10,%esp
c0107830:	83 ec 04             	sub    $0x4,%esp
c0107833:	68 ff 01 00 00       	push   $0x1ff
c0107838:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c010783e:	50                   	push   %eax
c010783f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107842:	e8 5e d5 ff ff       	call   c0104da5 <write>
c0107847:	83 c4 10             	add    $0x10,%esp
c010784a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010784d:	83 ec 0c             	sub    $0xc,%esp
c0107850:	ff 75 e8             	pushl  -0x18(%ebp)
c0107853:	e8 b0 49 00 00       	call   c010c208 <Strlen>
c0107858:	83 c4 10             	add    $0x10,%esp
c010785b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c010785e:	74 1c                	je     c010787c <TestWriteReturnValue+0xc3>
c0107860:	68 1c 02 00 00       	push   $0x21c
c0107865:	68 61 ba 10 c0       	push   $0xc010ba61
c010786a:	68 61 ba 10 c0       	push   $0xc010ba61
c010786f:	68 c7 ba 10 c0       	push   $0xc010bac7
c0107874:	e8 bc 10 00 00       	call   c0108935 <assertion_failure>
c0107879:	83 c4 10             	add    $0x10,%esp
c010787c:	83 ec 0c             	sub    $0xc,%esp
c010787f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107882:	e8 a3 d5 ff ff       	call   c0104e2a <close>
c0107887:	83 c4 10             	add    $0x10,%esp
c010788a:	90                   	nop
c010788b:	c9                   	leave  
c010788c:	c3                   	ret    

c010788d <TestFS2>:
c010788d:	55                   	push   %ebp
c010788e:	89 e5                	mov    %esp,%ebp
c0107890:	83 ec 08             	sub    $0x8,%esp
c0107893:	e8 21 ff ff ff       	call   c01077b9 <TestWriteReturnValue>
c0107898:	90                   	nop
c0107899:	c9                   	leave  
c010789a:	c3                   	ret    

c010789b <TestFS>:
c010789b:	55                   	push   %ebp
c010789c:	89 e5                	mov    %esp,%ebp
c010789e:	57                   	push   %edi
c010789f:	56                   	push   %esi
c01078a0:	53                   	push   %ebx
c01078a1:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c01078a7:	83 ec 0c             	sub    $0xc,%esp
c01078aa:	68 da ba 10 c0       	push   $0xc010bada
c01078af:	e8 d8 87 ff ff       	call   c010008c <disp_str>
c01078b4:	83 c4 10             	add    $0x10,%esp
c01078b7:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c01078be:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c01078c5:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c01078cb:	83 ec 08             	sub    $0x8,%esp
c01078ce:	6a 02                	push   $0x2
c01078d0:	8d 45 ae             	lea    -0x52(%ebp),%eax
c01078d3:	50                   	push   %eax
c01078d4:	e8 b6 d2 ff ff       	call   c0104b8f <open>
c01078d9:	83 c4 10             	add    $0x10,%esp
c01078dc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01078df:	83 ec 08             	sub    $0x8,%esp
c01078e2:	6a 02                	push   $0x2
c01078e4:	8d 45 ae             	lea    -0x52(%ebp),%eax
c01078e7:	50                   	push   %eax
c01078e8:	e8 a2 d2 ff ff       	call   c0104b8f <open>
c01078ed:	83 c4 10             	add    $0x10,%esp
c01078f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01078f3:	83 ec 0c             	sub    $0xc,%esp
c01078f6:	68 39 ba 10 c0       	push   $0xc010ba39
c01078fb:	e8 d8 0c 00 00       	call   c01085d8 <Printf>
c0107900:	83 c4 10             	add    $0x10,%esp
c0107903:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c010790a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c010790e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c0107915:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c0107919:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c0107920:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c0107927:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c010792d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c0107934:	83 ec 0c             	sub    $0xc,%esp
c0107937:	68 e2 ba 10 c0       	push   $0xc010bae2
c010793c:	e8 97 0c 00 00       	call   c01085d8 <Printf>
c0107941:	83 c4 10             	add    $0x10,%esp
c0107944:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c0107948:	0f 85 e6 03 00 00    	jne    c0107d34 <TestFS+0x499>
c010794e:	83 ec 08             	sub    $0x8,%esp
c0107951:	6a 07                	push   $0x7
c0107953:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107956:	50                   	push   %eax
c0107957:	e8 33 d2 ff ff       	call   c0104b8f <open>
c010795c:	83 c4 10             	add    $0x10,%esp
c010795f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107962:	83 ec 08             	sub    $0x8,%esp
c0107965:	ff 75 d0             	pushl  -0x30(%ebp)
c0107968:	68 fa ba 10 c0       	push   $0xc010bafa
c010796d:	e8 66 0c 00 00       	call   c01085d8 <Printf>
c0107972:	83 c4 10             	add    $0x10,%esp
c0107975:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c010797c:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107983:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c010798a:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107991:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107998:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c010799f:	83 ec 0c             	sub    $0xc,%esp
c01079a2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c01079a5:	50                   	push   %eax
c01079a6:	e8 5d 48 00 00       	call   c010c208 <Strlen>
c01079ab:	83 c4 10             	add    $0x10,%esp
c01079ae:	83 ec 04             	sub    $0x4,%esp
c01079b1:	50                   	push   %eax
c01079b2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c01079b5:	50                   	push   %eax
c01079b6:	ff 75 d0             	pushl  -0x30(%ebp)
c01079b9:	e8 e7 d3 ff ff       	call   c0104da5 <write>
c01079be:	83 c4 10             	add    $0x10,%esp
c01079c1:	83 ec 0c             	sub    $0xc,%esp
c01079c4:	ff 75 d0             	pushl  -0x30(%ebp)
c01079c7:	e8 5e d4 ff ff       	call   c0104e2a <close>
c01079cc:	83 c4 10             	add    $0x10,%esp
c01079cf:	83 ec 08             	sub    $0x8,%esp
c01079d2:	6a 00                	push   $0x0
c01079d4:	8d 45 a9             	lea    -0x57(%ebp),%eax
c01079d7:	50                   	push   %eax
c01079d8:	e8 b2 d1 ff ff       	call   c0104b8f <open>
c01079dd:	83 c4 10             	add    $0x10,%esp
c01079e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01079e3:	83 ec 04             	sub    $0x4,%esp
c01079e6:	6a 14                	push   $0x14
c01079e8:	6a 00                	push   $0x0
c01079ea:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c01079f0:	50                   	push   %eax
c01079f1:	e8 d9 47 00 00       	call   c010c1cf <Memset>
c01079f6:	83 c4 10             	add    $0x10,%esp
c01079f9:	83 ec 04             	sub    $0x4,%esp
c01079fc:	6a 12                	push   $0x12
c01079fe:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a04:	50                   	push   %eax
c0107a05:	ff 75 d0             	pushl  -0x30(%ebp)
c0107a08:	e8 17 d2 ff ff       	call   c0104c24 <read>
c0107a0d:	83 c4 10             	add    $0x10,%esp
c0107a10:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107a13:	83 ec 08             	sub    $0x8,%esp
c0107a16:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a1c:	50                   	push   %eax
c0107a1d:	68 03 bb 10 c0       	push   $0xc010bb03
c0107a22:	e8 b1 0b 00 00       	call   c01085d8 <Printf>
c0107a27:	83 c4 10             	add    $0x10,%esp
c0107a2a:	83 ec 0c             	sub    $0xc,%esp
c0107a2d:	6a 0a                	push   $0xa
c0107a2f:	e8 70 0a 00 00       	call   c01084a4 <delay>
c0107a34:	83 c4 10             	add    $0x10,%esp
c0107a37:	83 ec 08             	sub    $0x8,%esp
c0107a3a:	6a 07                	push   $0x7
c0107a3c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107a3f:	50                   	push   %eax
c0107a40:	e8 4a d1 ff ff       	call   c0104b8f <open>
c0107a45:	83 c4 10             	add    $0x10,%esp
c0107a48:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107a4b:	83 ec 08             	sub    $0x8,%esp
c0107a4e:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a51:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107a56:	e8 7d 0b 00 00       	call   c01085d8 <Printf>
c0107a5b:	83 c4 10             	add    $0x10,%esp
c0107a5e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107a65:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a6b:	bb 44 bb 10 c0       	mov    $0xc010bb44,%ebx
c0107a70:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107a75:	8b 0b                	mov    (%ebx),%ecx
c0107a77:	89 08                	mov    %ecx,(%eax)
c0107a79:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107a7d:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107a81:	8d 78 04             	lea    0x4(%eax),%edi
c0107a84:	83 e7 fc             	and    $0xfffffffc,%edi
c0107a87:	29 f8                	sub    %edi,%eax
c0107a89:	29 c3                	sub    %eax,%ebx
c0107a8b:	01 c2                	add    %eax,%edx
c0107a8d:	83 e2 fc             	and    $0xfffffffc,%edx
c0107a90:	89 d0                	mov    %edx,%eax
c0107a92:	c1 e8 02             	shr    $0x2,%eax
c0107a95:	89 de                	mov    %ebx,%esi
c0107a97:	89 c1                	mov    %eax,%ecx
c0107a99:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107a9b:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107aa2:	00 00 00 
c0107aa5:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107aac:	00 00 00 
c0107aaf:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107ab6:	83 ec 0c             	sub    $0xc,%esp
c0107ab9:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107abf:	50                   	push   %eax
c0107ac0:	e8 43 47 00 00       	call   c010c208 <Strlen>
c0107ac5:	83 c4 10             	add    $0x10,%esp
c0107ac8:	83 ec 04             	sub    $0x4,%esp
c0107acb:	50                   	push   %eax
c0107acc:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107ad2:	50                   	push   %eax
c0107ad3:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ad6:	e8 ca d2 ff ff       	call   c0104da5 <write>
c0107adb:	83 c4 10             	add    $0x10,%esp
c0107ade:	83 ec 0c             	sub    $0xc,%esp
c0107ae1:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ae4:	e8 41 d3 ff ff       	call   c0104e2a <close>
c0107ae9:	83 c4 10             	add    $0x10,%esp
c0107aec:	83 ec 08             	sub    $0x8,%esp
c0107aef:	6a 00                	push   $0x0
c0107af1:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107af4:	50                   	push   %eax
c0107af5:	e8 95 d0 ff ff       	call   c0104b8f <open>
c0107afa:	83 c4 10             	add    $0x10,%esp
c0107afd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107b00:	83 ec 04             	sub    $0x4,%esp
c0107b03:	68 c8 00 00 00       	push   $0xc8
c0107b08:	6a 00                	push   $0x0
c0107b0a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b10:	50                   	push   %eax
c0107b11:	e8 b9 46 00 00       	call   c010c1cf <Memset>
c0107b16:	83 c4 10             	add    $0x10,%esp
c0107b19:	83 ec 0c             	sub    $0xc,%esp
c0107b1c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107b22:	50                   	push   %eax
c0107b23:	e8 e0 46 00 00       	call   c010c208 <Strlen>
c0107b28:	83 c4 10             	add    $0x10,%esp
c0107b2b:	83 ec 04             	sub    $0x4,%esp
c0107b2e:	50                   	push   %eax
c0107b2f:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b35:	50                   	push   %eax
c0107b36:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b39:	e8 e6 d0 ff ff       	call   c0104c24 <read>
c0107b3e:	83 c4 10             	add    $0x10,%esp
c0107b41:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107b44:	83 ec 08             	sub    $0x8,%esp
c0107b47:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b4d:	50                   	push   %eax
c0107b4e:	68 18 bb 10 c0       	push   $0xc010bb18
c0107b53:	e8 80 0a 00 00       	call   c01085d8 <Printf>
c0107b58:	83 c4 10             	add    $0x10,%esp
c0107b5b:	83 ec 08             	sub    $0x8,%esp
c0107b5e:	6a 07                	push   $0x7
c0107b60:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107b63:	50                   	push   %eax
c0107b64:	e8 26 d0 ff ff       	call   c0104b8f <open>
c0107b69:	83 c4 10             	add    $0x10,%esp
c0107b6c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107b6f:	83 ec 08             	sub    $0x8,%esp
c0107b72:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b75:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107b7a:	e8 59 0a 00 00       	call   c01085d8 <Printf>
c0107b7f:	83 c4 10             	add    $0x10,%esp
c0107b82:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107b89:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107b90:	20 77 69 
c0107b93:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107b9a:	6c 20 73 
c0107b9d:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107ba4:	63 63 65 
c0107ba7:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107bae:	73 20 61 
c0107bb1:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107bb8:	20 6c 61 
c0107bbb:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107bc2:	74 2e 00 
c0107bc5:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107bcc:	00 00 00 
c0107bcf:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107bd6:	00 00 
c0107bd8:	83 ec 0c             	sub    $0xc,%esp
c0107bdb:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107be1:	50                   	push   %eax
c0107be2:	e8 21 46 00 00       	call   c010c208 <Strlen>
c0107be7:	83 c4 10             	add    $0x10,%esp
c0107bea:	83 ec 04             	sub    $0x4,%esp
c0107bed:	50                   	push   %eax
c0107bee:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107bf4:	50                   	push   %eax
c0107bf5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107bf8:	e8 a8 d1 ff ff       	call   c0104da5 <write>
c0107bfd:	83 c4 10             	add    $0x10,%esp
c0107c00:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107c07:	eb 7e                	jmp    c0107c87 <TestFS+0x3ec>
c0107c09:	83 ec 0c             	sub    $0xc,%esp
c0107c0c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c0f:	e8 16 d2 ff ff       	call   c0104e2a <close>
c0107c14:	83 c4 10             	add    $0x10,%esp
c0107c17:	83 ec 08             	sub    $0x8,%esp
c0107c1a:	6a 00                	push   $0x0
c0107c1c:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107c1f:	50                   	push   %eax
c0107c20:	e8 6a cf ff ff       	call   c0104b8f <open>
c0107c25:	83 c4 10             	add    $0x10,%esp
c0107c28:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107c2b:	83 ec 04             	sub    $0x4,%esp
c0107c2e:	6a 1e                	push   $0x1e
c0107c30:	6a 00                	push   $0x0
c0107c32:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c38:	50                   	push   %eax
c0107c39:	e8 91 45 00 00       	call   c010c1cf <Memset>
c0107c3e:	83 c4 10             	add    $0x10,%esp
c0107c41:	83 ec 0c             	sub    $0xc,%esp
c0107c44:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107c4a:	50                   	push   %eax
c0107c4b:	e8 b8 45 00 00       	call   c010c208 <Strlen>
c0107c50:	83 c4 10             	add    $0x10,%esp
c0107c53:	83 ec 04             	sub    $0x4,%esp
c0107c56:	50                   	push   %eax
c0107c57:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c5d:	50                   	push   %eax
c0107c5e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c61:	e8 be cf ff ff       	call   c0104c24 <read>
c0107c66:	83 c4 10             	add    $0x10,%esp
c0107c69:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107c6c:	83 ec 08             	sub    $0x8,%esp
c0107c6f:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c75:	50                   	push   %eax
c0107c76:	68 23 bb 10 c0       	push   $0xc010bb23
c0107c7b:	e8 58 09 00 00       	call   c01085d8 <Printf>
c0107c80:	83 c4 10             	add    $0x10,%esp
c0107c83:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107c87:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107c8b:	0f 8e 78 ff ff ff    	jle    c0107c09 <TestFS+0x36e>
c0107c91:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107c98:	6e 73 74 
c0107c9b:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107ca2:	6c 6c 2e 
c0107ca5:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107cac:	61 72 00 
c0107caf:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107cb6:	00 00 00 
c0107cb9:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107cc0:	00 00 00 
c0107cc3:	83 ec 08             	sub    $0x8,%esp
c0107cc6:	6a 00                	push   $0x0
c0107cc8:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107cce:	50                   	push   %eax
c0107ccf:	e8 bb ce ff ff       	call   c0104b8f <open>
c0107cd4:	83 c4 10             	add    $0x10,%esp
c0107cd7:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107cda:	83 ec 08             	sub    $0x8,%esp
c0107cdd:	ff 75 bc             	pushl  -0x44(%ebp)
c0107ce0:	68 2e bb 10 c0       	push   $0xc010bb2e
c0107ce5:	e8 ee 08 00 00       	call   c01085d8 <Printf>
c0107cea:	83 c4 10             	add    $0x10,%esp
c0107ced:	83 ec 04             	sub    $0x4,%esp
c0107cf0:	6a 28                	push   $0x28
c0107cf2:	6a 00                	push   $0x0
c0107cf4:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107cfa:	50                   	push   %eax
c0107cfb:	e8 cf 44 00 00       	call   c010c1cf <Memset>
c0107d00:	83 c4 10             	add    $0x10,%esp
c0107d03:	83 ec 04             	sub    $0x4,%esp
c0107d06:	6a 28                	push   $0x28
c0107d08:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d0e:	50                   	push   %eax
c0107d0f:	ff 75 bc             	pushl  -0x44(%ebp)
c0107d12:	e8 0d cf ff ff       	call   c0104c24 <read>
c0107d17:	83 c4 10             	add    $0x10,%esp
c0107d1a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107d1d:	83 ec 08             	sub    $0x8,%esp
c0107d20:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d26:	50                   	push   %eax
c0107d27:	68 38 bb 10 c0       	push   $0xc010bb38
c0107d2c:	e8 a7 08 00 00       	call   c01085d8 <Printf>
c0107d31:	83 c4 10             	add    $0x10,%esp
c0107d34:	90                   	nop
c0107d35:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107d38:	5b                   	pop    %ebx
c0107d39:	5e                   	pop    %esi
c0107d3a:	5f                   	pop    %edi
c0107d3b:	5d                   	pop    %ebp
c0107d3c:	c3                   	ret    

c0107d3d <wait_exit>:
c0107d3d:	55                   	push   %ebp
c0107d3e:	89 e5                	mov    %esp,%ebp
c0107d40:	83 ec 28             	sub    $0x28,%esp
c0107d43:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107d4a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107d51:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107d57:	83 ec 08             	sub    $0x8,%esp
c0107d5a:	6a 02                	push   $0x2
c0107d5c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d5f:	50                   	push   %eax
c0107d60:	e8 2a ce ff ff       	call   c0104b8f <open>
c0107d65:	83 c4 10             	add    $0x10,%esp
c0107d68:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107d6b:	83 ec 08             	sub    $0x8,%esp
c0107d6e:	6a 02                	push   $0x2
c0107d70:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d73:	50                   	push   %eax
c0107d74:	e8 16 ce ff ff       	call   c0104b8f <open>
c0107d79:	83 c4 10             	add    $0x10,%esp
c0107d7c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107d7f:	e8 6b d1 ff ff       	call   c0104eef <fork>
c0107d84:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107d87:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107d8b:	7e 35                	jle    c0107dc2 <wait_exit+0x85>
c0107d8d:	83 ec 0c             	sub    $0xc,%esp
c0107d90:	68 0c bc 10 c0       	push   $0xc010bc0c
c0107d95:	e8 3e 08 00 00       	call   c01085d8 <Printf>
c0107d9a:	83 c4 10             	add    $0x10,%esp
c0107d9d:	83 ec 0c             	sub    $0xc,%esp
c0107da0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107da3:	50                   	push   %eax
c0107da4:	e8 d3 d0 ff ff       	call   c0104e7c <wait>
c0107da9:	83 c4 10             	add    $0x10,%esp
c0107dac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107daf:	83 ec 08             	sub    $0x8,%esp
c0107db2:	50                   	push   %eax
c0107db3:	68 24 bc 10 c0       	push   $0xc010bc24
c0107db8:	e8 1b 08 00 00       	call   c01085d8 <Printf>
c0107dbd:	83 c4 10             	add    $0x10,%esp
c0107dc0:	eb fe                	jmp    c0107dc0 <wait_exit+0x83>
c0107dc2:	83 ec 0c             	sub    $0xc,%esp
c0107dc5:	68 3f bc 10 c0       	push   $0xc010bc3f
c0107dca:	e8 09 08 00 00       	call   c01085d8 <Printf>
c0107dcf:	83 c4 10             	add    $0x10,%esp
c0107dd2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107dd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107ddc:	8d 50 01             	lea    0x1(%eax),%edx
c0107ddf:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107de2:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107de7:	7f 02                	jg     c0107deb <wait_exit+0xae>
c0107de9:	eb ee                	jmp    c0107dd9 <wait_exit+0x9c>
c0107deb:	90                   	nop
c0107dec:	83 ec 0c             	sub    $0xc,%esp
c0107def:	68 4b bc 10 c0       	push   $0xc010bc4b
c0107df4:	e8 df 07 00 00       	call   c01085d8 <Printf>
c0107df9:	83 c4 10             	add    $0x10,%esp
c0107dfc:	83 ec 0c             	sub    $0xc,%esp
c0107dff:	68 59 bc 10 c0       	push   $0xc010bc59
c0107e04:	e8 cf 07 00 00       	call   c01085d8 <Printf>
c0107e09:	83 c4 10             	add    $0x10,%esp
c0107e0c:	83 ec 0c             	sub    $0xc,%esp
c0107e0f:	68 68 bc 10 c0       	push   $0xc010bc68
c0107e14:	e8 bf 07 00 00       	call   c01085d8 <Printf>
c0107e19:	83 c4 10             	add    $0x10,%esp
c0107e1c:	83 ec 0c             	sub    $0xc,%esp
c0107e1f:	6a 5a                	push   $0x5a
c0107e21:	e8 9a d0 ff ff       	call   c0104ec0 <exit>
c0107e26:	83 c4 10             	add    $0x10,%esp
c0107e29:	83 ec 0c             	sub    $0xc,%esp
c0107e2c:	68 77 bc 10 c0       	push   $0xc010bc77
c0107e31:	e8 a2 07 00 00       	call   c01085d8 <Printf>
c0107e36:	83 c4 10             	add    $0x10,%esp
c0107e39:	eb fe                	jmp    c0107e39 <wait_exit+0xfc>

c0107e3b <INIT_fork>:
c0107e3b:	55                   	push   %ebp
c0107e3c:	89 e5                	mov    %esp,%ebp
c0107e3e:	83 ec 78             	sub    $0x78,%esp
c0107e41:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107e48:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107e4f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107e55:	83 ec 08             	sub    $0x8,%esp
c0107e58:	6a 02                	push   $0x2
c0107e5a:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107e5d:	50                   	push   %eax
c0107e5e:	e8 2c cd ff ff       	call   c0104b8f <open>
c0107e63:	83 c4 10             	add    $0x10,%esp
c0107e66:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107e69:	83 ec 08             	sub    $0x8,%esp
c0107e6c:	6a 02                	push   $0x2
c0107e6e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107e71:	50                   	push   %eax
c0107e72:	e8 18 cd ff ff       	call   c0104b8f <open>
c0107e77:	83 c4 10             	add    $0x10,%esp
c0107e7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107e7d:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107e84:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107e8b:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107e92:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107e99:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107ea0:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107ea7:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107eae:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107eb5:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107ebc:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107ec3:	83 ec 0c             	sub    $0xc,%esp
c0107ec6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107ec9:	50                   	push   %eax
c0107eca:	e8 09 07 00 00       	call   c01085d8 <Printf>
c0107ecf:	83 c4 10             	add    $0x10,%esp
c0107ed2:	83 ec 0c             	sub    $0xc,%esp
c0107ed5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107ed8:	50                   	push   %eax
c0107ed9:	e8 2a 43 00 00       	call   c010c208 <Strlen>
c0107ede:	83 c4 10             	add    $0x10,%esp
c0107ee1:	83 ec 04             	sub    $0x4,%esp
c0107ee4:	50                   	push   %eax
c0107ee5:	6a 00                	push   $0x0
c0107ee7:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107eea:	50                   	push   %eax
c0107eeb:	e8 df 42 00 00       	call   c010c1cf <Memset>
c0107ef0:	83 c4 10             	add    $0x10,%esp
c0107ef3:	83 ec 04             	sub    $0x4,%esp
c0107ef6:	6a 28                	push   $0x28
c0107ef8:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107efb:	50                   	push   %eax
c0107efc:	ff 75 f0             	pushl  -0x10(%ebp)
c0107eff:	e8 20 cd ff ff       	call   c0104c24 <read>
c0107f04:	83 c4 10             	add    $0x10,%esp
c0107f07:	83 ec 0c             	sub    $0xc,%esp
c0107f0a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f0d:	50                   	push   %eax
c0107f0e:	e8 c5 06 00 00       	call   c01085d8 <Printf>
c0107f13:	83 c4 10             	add    $0x10,%esp
c0107f16:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107f1d:	e8 cd cf ff ff       	call   c0104eef <fork>
c0107f22:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107f25:	83 ec 0c             	sub    $0xc,%esp
c0107f28:	6a 01                	push   $0x1
c0107f2a:	e8 75 05 00 00       	call   c01084a4 <delay>
c0107f2f:	83 c4 10             	add    $0x10,%esp
c0107f32:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107f36:	0f 8e cd 00 00 00    	jle    c0108009 <INIT_fork+0x1ce>
c0107f3c:	83 ec 08             	sub    $0x8,%esp
c0107f3f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107f42:	68 85 bc 10 c0       	push   $0xc010bc85
c0107f47:	e8 8c 06 00 00       	call   c01085d8 <Printf>
c0107f4c:	83 c4 10             	add    $0x10,%esp
c0107f4f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107f53:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107f5a:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107f61:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107f68:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107f6f:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107f76:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107f7d:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107f84:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107f8b:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107f92:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107f99:	83 ec 0c             	sub    $0xc,%esp
c0107f9c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f9f:	50                   	push   %eax
c0107fa0:	e8 63 42 00 00       	call   c010c208 <Strlen>
c0107fa5:	83 c4 10             	add    $0x10,%esp
c0107fa8:	83 ec 04             	sub    $0x4,%esp
c0107fab:	50                   	push   %eax
c0107fac:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107faf:	50                   	push   %eax
c0107fb0:	ff 75 f4             	pushl  -0xc(%ebp)
c0107fb3:	e8 ed cd ff ff       	call   c0104da5 <write>
c0107fb8:	83 c4 10             	add    $0x10,%esp
c0107fbb:	e8 b2 ec ff ff       	call   c0106c72 <catch_error>
c0107fc0:	83 ec 0c             	sub    $0xc,%esp
c0107fc3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fc6:	50                   	push   %eax
c0107fc7:	e8 3c 42 00 00       	call   c010c208 <Strlen>
c0107fcc:	83 c4 10             	add    $0x10,%esp
c0107fcf:	83 ec 04             	sub    $0x4,%esp
c0107fd2:	50                   	push   %eax
c0107fd3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fd6:	50                   	push   %eax
c0107fd7:	ff 75 f4             	pushl  -0xc(%ebp)
c0107fda:	e8 c6 cd ff ff       	call   c0104da5 <write>
c0107fdf:	83 c4 10             	add    $0x10,%esp
c0107fe2:	83 ec 0c             	sub    $0xc,%esp
c0107fe5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fe8:	50                   	push   %eax
c0107fe9:	e8 1a 42 00 00       	call   c010c208 <Strlen>
c0107fee:	83 c4 10             	add    $0x10,%esp
c0107ff1:	83 ec 04             	sub    $0x4,%esp
c0107ff4:	50                   	push   %eax
c0107ff5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107ff8:	50                   	push   %eax
c0107ff9:	ff 75 f4             	pushl  -0xc(%ebp)
c0107ffc:	e8 a4 cd ff ff       	call   c0104da5 <write>
c0108001:	83 c4 10             	add    $0x10,%esp
c0108004:	e9 d6 00 00 00       	jmp    c01080df <INIT_fork+0x2a4>
c0108009:	83 ec 08             	sub    $0x8,%esp
c010800c:	ff 75 e8             	pushl  -0x18(%ebp)
c010800f:	68 85 bc 10 c0       	push   $0xc010bc85
c0108014:	e8 bf 05 00 00       	call   c01085d8 <Printf>
c0108019:	83 c4 10             	add    $0x10,%esp
c010801c:	83 ec 0c             	sub    $0xc,%esp
c010801f:	6a 01                	push   $0x1
c0108021:	e8 7e 04 00 00       	call   c01084a4 <delay>
c0108026:	83 c4 10             	add    $0x10,%esp
c0108029:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010802d:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0108031:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0108038:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c010803f:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0108046:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c010804d:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0108054:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c010805b:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0108062:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0108069:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108070:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108077:	83 ec 0c             	sub    $0xc,%esp
c010807a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010807d:	50                   	push   %eax
c010807e:	e8 85 41 00 00       	call   c010c208 <Strlen>
c0108083:	83 c4 10             	add    $0x10,%esp
c0108086:	83 ec 04             	sub    $0x4,%esp
c0108089:	50                   	push   %eax
c010808a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010808d:	50                   	push   %eax
c010808e:	ff 75 f4             	pushl  -0xc(%ebp)
c0108091:	e8 0f cd ff ff       	call   c0104da5 <write>
c0108096:	83 c4 10             	add    $0x10,%esp
c0108099:	83 ec 0c             	sub    $0xc,%esp
c010809c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010809f:	50                   	push   %eax
c01080a0:	e8 63 41 00 00       	call   c010c208 <Strlen>
c01080a5:	83 c4 10             	add    $0x10,%esp
c01080a8:	83 ec 04             	sub    $0x4,%esp
c01080ab:	50                   	push   %eax
c01080ac:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080af:	50                   	push   %eax
c01080b0:	ff 75 f4             	pushl  -0xc(%ebp)
c01080b3:	e8 ed cc ff ff       	call   c0104da5 <write>
c01080b8:	83 c4 10             	add    $0x10,%esp
c01080bb:	83 ec 0c             	sub    $0xc,%esp
c01080be:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080c1:	50                   	push   %eax
c01080c2:	e8 41 41 00 00       	call   c010c208 <Strlen>
c01080c7:	83 c4 10             	add    $0x10,%esp
c01080ca:	83 ec 04             	sub    $0x4,%esp
c01080cd:	50                   	push   %eax
c01080ce:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080d1:	50                   	push   %eax
c01080d2:	ff 75 f4             	pushl  -0xc(%ebp)
c01080d5:	e8 cb cc ff ff       	call   c0104da5 <write>
c01080da:	83 c4 10             	add    $0x10,%esp
c01080dd:	eb fe                	jmp    c01080dd <INIT_fork+0x2a2>
c01080df:	83 ec 04             	sub    $0x4,%esp
c01080e2:	6a 28                	push   $0x28
c01080e4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080e7:	50                   	push   %eax
c01080e8:	ff 75 f0             	pushl  -0x10(%ebp)
c01080eb:	e8 34 cb ff ff       	call   c0104c24 <read>
c01080f0:	83 c4 10             	add    $0x10,%esp
c01080f3:	83 ec 0c             	sub    $0xc,%esp
c01080f6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080f9:	50                   	push   %eax
c01080fa:	e8 d9 04 00 00       	call   c01085d8 <Printf>
c01080ff:	83 c4 10             	add    $0x10,%esp
c0108102:	83 ec 0c             	sub    $0xc,%esp
c0108105:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108108:	50                   	push   %eax
c0108109:	e8 ca 04 00 00       	call   c01085d8 <Printf>
c010810e:	83 c4 10             	add    $0x10,%esp
c0108111:	83 ec 0c             	sub    $0xc,%esp
c0108114:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108117:	50                   	push   %eax
c0108118:	e8 bb 04 00 00       	call   c01085d8 <Printf>
c010811d:	83 c4 10             	add    $0x10,%esp
c0108120:	83 ec 0c             	sub    $0xc,%esp
c0108123:	68 8f bc 10 c0       	push   $0xc010bc8f
c0108128:	e8 c4 07 00 00       	call   c01088f1 <spin>
c010812d:	83 c4 10             	add    $0x10,%esp
c0108130:	90                   	nop
c0108131:	c9                   	leave  
c0108132:	c3                   	ret    

c0108133 <simple_shell>:
c0108133:	55                   	push   %ebp
c0108134:	89 e5                	mov    %esp,%ebp
c0108136:	57                   	push   %edi
c0108137:	83 ec 64             	sub    $0x64,%esp
c010813a:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0108141:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0108148:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c010814e:	83 ec 08             	sub    $0x8,%esp
c0108151:	6a 02                	push   $0x2
c0108153:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108156:	50                   	push   %eax
c0108157:	e8 33 ca ff ff       	call   c0104b8f <open>
c010815c:	83 c4 10             	add    $0x10,%esp
c010815f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108162:	83 ec 08             	sub    $0x8,%esp
c0108165:	6a 02                	push   $0x2
c0108167:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c010816a:	50                   	push   %eax
c010816b:	e8 1f ca ff ff       	call   c0104b8f <open>
c0108170:	83 c4 10             	add    $0x10,%esp
c0108173:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108176:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0108179:	b8 00 00 00 00       	mov    $0x0,%eax
c010817e:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0108183:	89 d7                	mov    %edx,%edi
c0108185:	f3 ab                	rep stos %eax,%es:(%edi)
c0108187:	c7 45 a8 97 bc 10 c0 	movl   $0xc010bc97,-0x58(%ebp)
c010818e:	c7 45 ac 9c bc 10 c0 	movl   $0xc010bc9c,-0x54(%ebp)
c0108195:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010819c:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c01081a3:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c01081aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01081ad:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c01081b4:	00 
c01081b5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01081b8:	85 c0                	test   %eax,%eax
c01081ba:	75 1c                	jne    c01081d8 <simple_shell+0xa5>
c01081bc:	68 0e 03 00 00       	push   $0x30e
c01081c1:	68 61 ba 10 c0       	push   $0xc010ba61
c01081c6:	68 61 ba 10 c0       	push   $0xc010ba61
c01081cb:	68 a2 bc 10 c0       	push   $0xc010bca2
c01081d0:	e8 60 07 00 00       	call   c0108935 <assertion_failure>
c01081d5:	83 c4 10             	add    $0x10,%esp
c01081d8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01081db:	83 ec 08             	sub    $0x8,%esp
c01081de:	6a 02                	push   $0x2
c01081e0:	50                   	push   %eax
c01081e1:	e8 a9 c9 ff ff       	call   c0104b8f <open>
c01081e6:	83 c4 10             	add    $0x10,%esp
c01081e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01081ec:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c01081f0:	75 4b                	jne    c010823d <simple_shell+0x10a>
c01081f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01081f9:	eb 26                	jmp    c0108221 <simple_shell+0xee>
c01081fb:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01081fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108201:	01 d0                	add    %edx,%eax
c0108203:	0f b6 00             	movzbl (%eax),%eax
c0108206:	0f be c0             	movsbl %al,%eax
c0108209:	83 ec 04             	sub    $0x4,%esp
c010820c:	50                   	push   %eax
c010820d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108210:	68 b1 bc 10 c0       	push   $0xc010bcb1
c0108215:	e8 be 03 00 00       	call   c01085d8 <Printf>
c010821a:	83 c4 10             	add    $0x10,%esp
c010821d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108221:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0108225:	7e d4                	jle    c01081fb <simple_shell+0xc8>
c0108227:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010822a:	83 ec 08             	sub    $0x8,%esp
c010822d:	50                   	push   %eax
c010822e:	68 b8 bc 10 c0       	push   $0xc010bcb8
c0108233:	e8 a0 03 00 00       	call   c01085d8 <Printf>
c0108238:	83 c4 10             	add    $0x10,%esp
c010823b:	eb 78                	jmp    c01082b5 <simple_shell+0x182>
c010823d:	83 ec 0c             	sub    $0xc,%esp
c0108240:	68 be bc 10 c0       	push   $0xc010bcbe
c0108245:	e8 8e 03 00 00       	call   c01085d8 <Printf>
c010824a:	83 c4 10             	add    $0x10,%esp
c010824d:	e8 9d cc ff ff       	call   c0104eef <fork>
c0108252:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108255:	83 ec 0c             	sub    $0xc,%esp
c0108258:	68 d3 bc 10 c0       	push   $0xc010bcd3
c010825d:	e8 76 03 00 00       	call   c01085d8 <Printf>
c0108262:	83 c4 10             	add    $0x10,%esp
c0108265:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0108269:	7e 11                	jle    c010827c <simple_shell+0x149>
c010826b:	83 ec 0c             	sub    $0xc,%esp
c010826e:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0108271:	50                   	push   %eax
c0108272:	e8 05 cc ff ff       	call   c0104e7c <wait>
c0108277:	83 c4 10             	add    $0x10,%esp
c010827a:	eb 39                	jmp    c01082b5 <simple_shell+0x182>
c010827c:	83 ec 0c             	sub    $0xc,%esp
c010827f:	68 e8 bc 10 c0       	push   $0xc010bce8
c0108284:	e8 4f 03 00 00       	call   c01085d8 <Printf>
c0108289:	83 c4 10             	add    $0x10,%esp
c010828c:	83 ec 0c             	sub    $0xc,%esp
c010828f:	ff 75 e0             	pushl  -0x20(%ebp)
c0108292:	e8 93 cb ff ff       	call   c0104e2a <close>
c0108297:	83 c4 10             	add    $0x10,%esp
c010829a:	6a 00                	push   $0x0
c010829c:	68 9c bc 10 c0       	push   $0xc010bc9c
c01082a1:	68 97 bc 10 c0       	push   $0xc010bc97
c01082a6:	68 04 bd 10 c0       	push   $0xc010bd04
c01082ab:	e8 12 cf ff ff       	call   c01051c2 <execl>
c01082b0:	83 c4 10             	add    $0x10,%esp
c01082b3:	eb fe                	jmp    c01082b3 <simple_shell+0x180>
c01082b5:	8b 7d fc             	mov    -0x4(%ebp),%edi
c01082b8:	c9                   	leave  
c01082b9:	c3                   	ret    

c01082ba <test_shell>:
c01082ba:	55                   	push   %ebp
c01082bb:	89 e5                	mov    %esp,%ebp
c01082bd:	83 ec 38             	sub    $0x38,%esp
c01082c0:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c01082c7:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c01082ce:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c01082d4:	83 ec 08             	sub    $0x8,%esp
c01082d7:	6a 02                	push   $0x2
c01082d9:	8d 45 ea             	lea    -0x16(%ebp),%eax
c01082dc:	50                   	push   %eax
c01082dd:	e8 ad c8 ff ff       	call   c0104b8f <open>
c01082e2:	83 c4 10             	add    $0x10,%esp
c01082e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01082e8:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c01082ef:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c01082f6:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c01082fd:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108304:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010830b:	83 ec 0c             	sub    $0xc,%esp
c010830e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108311:	50                   	push   %eax
c0108312:	e8 38 ea ff ff       	call   c0106d4f <untar>
c0108317:	83 c4 10             	add    $0x10,%esp
c010831a:	e8 14 fe ff ff       	call   c0108133 <simple_shell>
c010831f:	90                   	nop
c0108320:	c9                   	leave  
c0108321:	c3                   	ret    

c0108322 <test_exec>:
c0108322:	55                   	push   %ebp
c0108323:	89 e5                	mov    %esp,%ebp
c0108325:	83 ec 38             	sub    $0x38,%esp
c0108328:	83 ec 0c             	sub    $0xc,%esp
c010832b:	68 0a bd 10 c0       	push   $0xc010bd0a
c0108330:	e8 57 7d ff ff       	call   c010008c <disp_str>
c0108335:	83 c4 10             	add    $0x10,%esp
c0108338:	83 ec 0c             	sub    $0xc,%esp
c010833b:	68 1c bd 10 c0       	push   $0xc010bd1c
c0108340:	e8 47 7d ff ff       	call   c010008c <disp_str>
c0108345:	83 c4 10             	add    $0x10,%esp
c0108348:	83 ec 0c             	sub    $0xc,%esp
c010834b:	6a 07                	push   $0x7
c010834d:	e8 b8 ed ff ff       	call   c010710a <disp_int>
c0108352:	83 c4 10             	add    $0x10,%esp
c0108355:	83 ec 0c             	sub    $0xc,%esp
c0108358:	68 00 b6 10 c0       	push   $0xc010b600
c010835d:	e8 2a 7d ff ff       	call   c010008c <disp_str>
c0108362:	83 c4 10             	add    $0x10,%esp
c0108365:	83 ec 0c             	sub    $0xc,%esp
c0108368:	68 02 b6 10 c0       	push   $0xc010b602
c010836d:	e8 1a 7d ff ff       	call   c010008c <disp_str>
c0108372:	83 c4 10             	add    $0x10,%esp
c0108375:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c010837c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108383:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0108389:	83 ec 08             	sub    $0x8,%esp
c010838c:	6a 02                	push   $0x2
c010838e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108391:	50                   	push   %eax
c0108392:	e8 f8 c7 ff ff       	call   c0104b8f <open>
c0108397:	83 c4 10             	add    $0x10,%esp
c010839a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010839d:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c01083a4:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c01083ab:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c01083b2:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c01083b9:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01083c0:	83 ec 0c             	sub    $0xc,%esp
c01083c3:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01083c6:	50                   	push   %eax
c01083c7:	e8 83 e9 ff ff       	call   c0106d4f <untar>
c01083cc:	83 c4 10             	add    $0x10,%esp
c01083cf:	83 ec 08             	sub    $0x8,%esp
c01083d2:	6a 00                	push   $0x0
c01083d4:	68 2f bd 10 c0       	push   $0xc010bd2f
c01083d9:	68 33 bd 10 c0       	push   $0xc010bd33
c01083de:	68 9c bc 10 c0       	push   $0xc010bc9c
c01083e3:	68 97 bc 10 c0       	push   $0xc010bc97
c01083e8:	68 04 bd 10 c0       	push   $0xc010bd04
c01083ed:	e8 d0 cd ff ff       	call   c01051c2 <execl>
c01083f2:	83 c4 20             	add    $0x20,%esp
c01083f5:	e8 34 e8 ff ff       	call   c0106c2e <stop_here>
c01083fa:	e8 f0 ca ff ff       	call   c0104eef <fork>
c01083ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108402:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108406:	7e 25                	jle    c010842d <test_exec+0x10b>
c0108408:	83 ec 0c             	sub    $0xc,%esp
c010840b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c010840e:	50                   	push   %eax
c010840f:	e8 68 ca ff ff       	call   c0104e7c <wait>
c0108414:	83 c4 10             	add    $0x10,%esp
c0108417:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010841a:	83 ec 08             	sub    $0x8,%esp
c010841d:	50                   	push   %eax
c010841e:	68 39 bd 10 c0       	push   $0xc010bd39
c0108423:	e8 b0 01 00 00       	call   c01085d8 <Printf>
c0108428:	83 c4 10             	add    $0x10,%esp
c010842b:	eb 33                	jmp    c0108460 <test_exec+0x13e>
c010842d:	83 ec 0c             	sub    $0xc,%esp
c0108430:	68 4b bd 10 c0       	push   $0xc010bd4b
c0108435:	e8 9e 01 00 00       	call   c01085d8 <Printf>
c010843a:	83 c4 10             	add    $0x10,%esp
c010843d:	83 ec 0c             	sub    $0xc,%esp
c0108440:	6a 00                	push   $0x0
c0108442:	68 33 bd 10 c0       	push   $0xc010bd33
c0108447:	68 9c bc 10 c0       	push   $0xc010bc9c
c010844c:	68 97 bc 10 c0       	push   $0xc010bc97
c0108451:	68 04 bd 10 c0       	push   $0xc010bd04
c0108456:	e8 67 cd ff ff       	call   c01051c2 <execl>
c010845b:	83 c4 20             	add    $0x20,%esp
c010845e:	eb fe                	jmp    c010845e <test_exec+0x13c>
c0108460:	c9                   	leave  
c0108461:	c3                   	ret    

c0108462 <INIT>:
c0108462:	55                   	push   %ebp
c0108463:	89 e5                	mov    %esp,%ebp
c0108465:	83 ec 08             	sub    $0x8,%esp
c0108468:	e8 4d fe ff ff       	call   c01082ba <test_shell>
c010846d:	eb fe                	jmp    c010846d <INIT+0xb>

c010846f <TestA>:
c010846f:	55                   	push   %ebp
c0108470:	89 e5                	mov    %esp,%ebp
c0108472:	83 ec 08             	sub    $0x8,%esp
c0108475:	83 ec 0c             	sub    $0xc,%esp
c0108478:	6a 05                	push   $0x5
c010847a:	e8 8b ec ff ff       	call   c010710a <disp_int>
c010847f:	83 c4 10             	add    $0x10,%esp
c0108482:	83 ec 0c             	sub    $0xc,%esp
c0108485:	68 13 b7 10 c0       	push   $0xc010b713
c010848a:	e8 fd 7b ff ff       	call   c010008c <disp_str>
c010848f:	83 c4 10             	add    $0x10,%esp
c0108492:	83 ec 0c             	sub    $0xc,%esp
c0108495:	68 59 bd 10 c0       	push   $0xc010bd59
c010849a:	e8 ed 7b ff ff       	call   c010008c <disp_str>
c010849f:	83 c4 10             	add    $0x10,%esp
c01084a2:	eb fe                	jmp    c01084a2 <TestA+0x33>

c01084a4 <delay>:
c01084a4:	55                   	push   %ebp
c01084a5:	89 e5                	mov    %esp,%ebp
c01084a7:	83 ec 10             	sub    $0x10,%esp
c01084aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01084b1:	eb 2a                	jmp    c01084dd <delay+0x39>
c01084b3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01084ba:	eb 17                	jmp    c01084d3 <delay+0x2f>
c01084bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084c3:	eb 04                	jmp    c01084c9 <delay+0x25>
c01084c5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01084c9:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01084cd:	7e f6                	jle    c01084c5 <delay+0x21>
c01084cf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01084d3:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c01084d7:	7e e3                	jle    c01084bc <delay+0x18>
c01084d9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01084dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01084e0:	3b 45 08             	cmp    0x8(%ebp),%eax
c01084e3:	7c ce                	jl     c01084b3 <delay+0xf>
c01084e5:	90                   	nop
c01084e6:	c9                   	leave  
c01084e7:	c3                   	ret    

c01084e8 <TestB>:
c01084e8:	55                   	push   %ebp
c01084e9:	89 e5                	mov    %esp,%ebp
c01084eb:	83 ec 08             	sub    $0x8,%esp
c01084ee:	83 ec 0c             	sub    $0xc,%esp
c01084f1:	68 60 bd 10 c0       	push   $0xc010bd60
c01084f6:	e8 91 7b ff ff       	call   c010008c <disp_str>
c01084fb:	83 c4 10             	add    $0x10,%esp
c01084fe:	eb fe                	jmp    c01084fe <TestB+0x16>

c0108500 <TestC>:
c0108500:	55                   	push   %ebp
c0108501:	89 e5                	mov    %esp,%ebp
c0108503:	83 ec 18             	sub    $0x18,%esp
c0108506:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010850d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108511:	77 1a                	ja     c010852d <TestC+0x2d>
c0108513:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010851a:	83 ec 08             	sub    $0x8,%esp
c010851d:	ff 75 f0             	pushl  -0x10(%ebp)
c0108520:	68 63 bd 10 c0       	push   $0xc010bd63
c0108525:	e8 ae 00 00 00       	call   c01085d8 <Printf>
c010852a:	83 c4 10             	add    $0x10,%esp
c010852d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108531:	eb da                	jmp    c010850d <TestC+0xd>

c0108533 <sys_get_ticks>:
c0108533:	55                   	push   %ebp
c0108534:	89 e5                	mov    %esp,%ebp
c0108536:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010853b:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108541:	5d                   	pop    %ebp
c0108542:	c3                   	ret    

c0108543 <sys_write>:
c0108543:	55                   	push   %ebp
c0108544:	89 e5                	mov    %esp,%ebp
c0108546:	83 ec 18             	sub    $0x18,%esp
c0108549:	8b 45 10             	mov    0x10(%ebp),%eax
c010854c:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108552:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108558:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010855d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108560:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108563:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108566:	8b 45 08             	mov    0x8(%ebp),%eax
c0108569:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010856c:	eb 20                	jmp    c010858e <sys_write+0x4b>
c010856e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108571:	0f b6 00             	movzbl (%eax),%eax
c0108574:	0f b6 c0             	movzbl %al,%eax
c0108577:	83 ec 08             	sub    $0x8,%esp
c010857a:	50                   	push   %eax
c010857b:	ff 75 ec             	pushl  -0x14(%ebp)
c010857e:	e8 7d b9 ff ff       	call   c0103f00 <out_char>
c0108583:	83 c4 10             	add    $0x10,%esp
c0108586:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010858a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c010858e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108592:	7f da                	jg     c010856e <sys_write+0x2b>
c0108594:	90                   	nop
c0108595:	c9                   	leave  
c0108596:	c3                   	ret    

c0108597 <milli_delay>:
c0108597:	55                   	push   %ebp
c0108598:	89 e5                	mov    %esp,%ebp
c010859a:	83 ec 18             	sub    $0x18,%esp
c010859d:	e8 8a 11 00 00       	call   c010972c <get_ticks_ipc>
c01085a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085a5:	90                   	nop
c01085a6:	e8 81 11 00 00       	call   c010972c <get_ticks_ipc>
c01085ab:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01085ae:	89 c1                	mov    %eax,%ecx
c01085b0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c01085b5:	89 c8                	mov    %ecx,%eax
c01085b7:	f7 ea                	imul   %edx
c01085b9:	c1 fa 05             	sar    $0x5,%edx
c01085bc:	89 c8                	mov    %ecx,%eax
c01085be:	c1 f8 1f             	sar    $0x1f,%eax
c01085c1:	29 c2                	sub    %eax,%edx
c01085c3:	89 d0                	mov    %edx,%eax
c01085c5:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c01085cb:	39 45 08             	cmp    %eax,0x8(%ebp)
c01085ce:	77 d6                	ja     c01085a6 <milli_delay+0xf>
c01085d0:	90                   	nop
c01085d1:	c9                   	leave  
c01085d2:	c3                   	ret    

c01085d3 <TaskSys>:
c01085d3:	55                   	push   %ebp
c01085d4:	89 e5                	mov    %esp,%ebp
c01085d6:	eb fe                	jmp    c01085d6 <TaskSys+0x3>

c01085d8 <Printf>:
c01085d8:	55                   	push   %ebp
c01085d9:	89 e5                	mov    %esp,%ebp
c01085db:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01085e1:	83 ec 04             	sub    $0x4,%esp
c01085e4:	68 00 01 00 00       	push   $0x100
c01085e9:	6a 00                	push   $0x0
c01085eb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01085f1:	50                   	push   %eax
c01085f2:	e8 d8 3b 00 00       	call   c010c1cf <Memset>
c01085f7:	83 c4 10             	add    $0x10,%esp
c01085fa:	8d 45 0c             	lea    0xc(%ebp),%eax
c01085fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108600:	8b 45 08             	mov    0x8(%ebp),%eax
c0108603:	83 ec 04             	sub    $0x4,%esp
c0108606:	ff 75 f4             	pushl  -0xc(%ebp)
c0108609:	50                   	push   %eax
c010860a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108610:	50                   	push   %eax
c0108611:	e8 20 00 00 00       	call   c0108636 <vsprintf>
c0108616:	83 c4 10             	add    $0x10,%esp
c0108619:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010861c:	83 ec 04             	sub    $0x4,%esp
c010861f:	ff 75 f0             	pushl  -0x10(%ebp)
c0108622:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108628:	50                   	push   %eax
c0108629:	6a 00                	push   $0x0
c010862b:	e8 75 c7 ff ff       	call   c0104da5 <write>
c0108630:	83 c4 10             	add    $0x10,%esp
c0108633:	90                   	nop
c0108634:	c9                   	leave  
c0108635:	c3                   	ret    

c0108636 <vsprintf>:
c0108636:	55                   	push   %ebp
c0108637:	89 e5                	mov    %esp,%ebp
c0108639:	81 ec 68 02 00 00    	sub    $0x268,%esp
c010863f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108645:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010864b:	83 ec 04             	sub    $0x4,%esp
c010864e:	6a 40                	push   $0x40
c0108650:	6a 00                	push   $0x0
c0108652:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108658:	50                   	push   %eax
c0108659:	e8 71 3b 00 00       	call   c010c1cf <Memset>
c010865e:	83 c4 10             	add    $0x10,%esp
c0108661:	8b 45 10             	mov    0x10(%ebp),%eax
c0108664:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108667:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010866e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108671:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108674:	e9 53 01 00 00       	jmp    c01087cc <vsprintf+0x196>
c0108679:	8b 45 0c             	mov    0xc(%ebp),%eax
c010867c:	0f b6 00             	movzbl (%eax),%eax
c010867f:	3c 25                	cmp    $0x25,%al
c0108681:	74 16                	je     c0108699 <vsprintf+0x63>
c0108683:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108686:	8d 50 01             	lea    0x1(%eax),%edx
c0108689:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010868c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010868f:	0f b6 12             	movzbl (%edx),%edx
c0108692:	88 10                	mov    %dl,(%eax)
c0108694:	e9 2f 01 00 00       	jmp    c01087c8 <vsprintf+0x192>
c0108699:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010869d:	8b 45 0c             	mov    0xc(%ebp),%eax
c01086a0:	0f b6 00             	movzbl (%eax),%eax
c01086a3:	0f be c0             	movsbl %al,%eax
c01086a6:	83 f8 64             	cmp    $0x64,%eax
c01086a9:	74 26                	je     c01086d1 <vsprintf+0x9b>
c01086ab:	83 f8 64             	cmp    $0x64,%eax
c01086ae:	7f 0e                	jg     c01086be <vsprintf+0x88>
c01086b0:	83 f8 63             	cmp    $0x63,%eax
c01086b3:	0f 84 f2 00 00 00    	je     c01087ab <vsprintf+0x175>
c01086b9:	e9 0a 01 00 00       	jmp    c01087c8 <vsprintf+0x192>
c01086be:	83 f8 73             	cmp    $0x73,%eax
c01086c1:	0f 84 b0 00 00 00    	je     c0108777 <vsprintf+0x141>
c01086c7:	83 f8 78             	cmp    $0x78,%eax
c01086ca:	74 5d                	je     c0108729 <vsprintf+0xf3>
c01086cc:	e9 f7 00 00 00       	jmp    c01087c8 <vsprintf+0x192>
c01086d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086d4:	8b 00                	mov    (%eax),%eax
c01086d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01086d9:	83 ec 04             	sub    $0x4,%esp
c01086dc:	6a 0a                	push   $0xa
c01086de:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01086e4:	50                   	push   %eax
c01086e5:	ff 75 e8             	pushl  -0x18(%ebp)
c01086e8:	e8 96 10 00 00       	call   c0109783 <itoa>
c01086ed:	83 c4 10             	add    $0x10,%esp
c01086f0:	83 ec 08             	sub    $0x8,%esp
c01086f3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01086f9:	50                   	push   %eax
c01086fa:	ff 75 f4             	pushl  -0xc(%ebp)
c01086fd:	e8 ec 3a 00 00       	call   c010c1ee <Strcpy>
c0108702:	83 c4 10             	add    $0x10,%esp
c0108705:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108709:	83 ec 0c             	sub    $0xc,%esp
c010870c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108712:	50                   	push   %eax
c0108713:	e8 f0 3a 00 00       	call   c010c208 <Strlen>
c0108718:	83 c4 10             	add    $0x10,%esp
c010871b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010871e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108721:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108724:	e9 9f 00 00 00       	jmp    c01087c8 <vsprintf+0x192>
c0108729:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010872c:	8b 00                	mov    (%eax),%eax
c010872e:	83 ec 08             	sub    $0x8,%esp
c0108731:	50                   	push   %eax
c0108732:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108738:	50                   	push   %eax
c0108739:	e8 26 e9 ff ff       	call   c0107064 <atoi>
c010873e:	83 c4 10             	add    $0x10,%esp
c0108741:	83 ec 08             	sub    $0x8,%esp
c0108744:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010874a:	50                   	push   %eax
c010874b:	ff 75 f4             	pushl  -0xc(%ebp)
c010874e:	e8 9b 3a 00 00       	call   c010c1ee <Strcpy>
c0108753:	83 c4 10             	add    $0x10,%esp
c0108756:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010875a:	83 ec 0c             	sub    $0xc,%esp
c010875d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108763:	50                   	push   %eax
c0108764:	e8 9f 3a 00 00       	call   c010c208 <Strlen>
c0108769:	83 c4 10             	add    $0x10,%esp
c010876c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010876f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108772:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108775:	eb 51                	jmp    c01087c8 <vsprintf+0x192>
c0108777:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010877a:	8b 00                	mov    (%eax),%eax
c010877c:	83 ec 08             	sub    $0x8,%esp
c010877f:	50                   	push   %eax
c0108780:	ff 75 f4             	pushl  -0xc(%ebp)
c0108783:	e8 66 3a 00 00       	call   c010c1ee <Strcpy>
c0108788:	83 c4 10             	add    $0x10,%esp
c010878b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010878e:	8b 00                	mov    (%eax),%eax
c0108790:	83 ec 0c             	sub    $0xc,%esp
c0108793:	50                   	push   %eax
c0108794:	e8 6f 3a 00 00       	call   c010c208 <Strlen>
c0108799:	83 c4 10             	add    $0x10,%esp
c010879c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010879f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01087a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01087a6:	01 45 f4             	add    %eax,-0xc(%ebp)
c01087a9:	eb 1d                	jmp    c01087c8 <vsprintf+0x192>
c01087ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087ae:	0f b6 10             	movzbl (%eax),%edx
c01087b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01087b4:	88 10                	mov    %dl,(%eax)
c01087b6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01087ba:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01087c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01087c4:	01 45 f4             	add    %eax,-0xc(%ebp)
c01087c7:	90                   	nop
c01087c8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01087cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01087cf:	0f b6 00             	movzbl (%eax),%eax
c01087d2:	84 c0                	test   %al,%al
c01087d4:	0f 85 9f fe ff ff    	jne    c0108679 <vsprintf+0x43>
c01087da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01087dd:	2b 45 08             	sub    0x8(%ebp),%eax
c01087e0:	c9                   	leave  
c01087e1:	c3                   	ret    

c01087e2 <printx>:
c01087e2:	55                   	push   %ebp
c01087e3:	89 e5                	mov    %esp,%ebp
c01087e5:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01087eb:	8d 45 0c             	lea    0xc(%ebp),%eax
c01087ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01087f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01087f4:	83 ec 04             	sub    $0x4,%esp
c01087f7:	ff 75 f4             	pushl  -0xc(%ebp)
c01087fa:	50                   	push   %eax
c01087fb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108801:	50                   	push   %eax
c0108802:	e8 2f fe ff ff       	call   c0108636 <vsprintf>
c0108807:	83 c4 10             	add    $0x10,%esp
c010880a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010880d:	83 ec 08             	sub    $0x8,%esp
c0108810:	ff 75 f0             	pushl  -0x10(%ebp)
c0108813:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108819:	50                   	push   %eax
c010881a:	e8 11 8e ff ff       	call   c0101630 <write_debug>
c010881f:	83 c4 10             	add    $0x10,%esp
c0108822:	90                   	nop
c0108823:	c9                   	leave  
c0108824:	c3                   	ret    

c0108825 <sys_printx>:
c0108825:	55                   	push   %ebp
c0108826:	89 e5                	mov    %esp,%ebp
c0108828:	83 ec 28             	sub    $0x28,%esp
c010882b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108830:	85 c0                	test   %eax,%eax
c0108832:	75 15                	jne    c0108849 <sys_printx+0x24>
c0108834:	8b 45 10             	mov    0x10(%ebp),%eax
c0108837:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c010883d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108840:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108847:	eb 10                	jmp    c0108859 <sys_printx+0x34>
c0108849:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010884e:	85 c0                	test   %eax,%eax
c0108850:	74 07                	je     c0108859 <sys_printx+0x34>
c0108852:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108859:	8b 55 08             	mov    0x8(%ebp),%edx
c010885c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010885f:	01 d0                	add    %edx,%eax
c0108861:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108864:	8b 45 10             	mov    0x10(%ebp),%eax
c0108867:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c010886d:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108873:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108878:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010887b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010887e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108881:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108884:	0f b6 00             	movzbl (%eax),%eax
c0108887:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010888a:	eb 3a                	jmp    c01088c6 <sys_printx+0xa1>
c010888c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010888f:	0f b6 00             	movzbl (%eax),%eax
c0108892:	3c 3b                	cmp    $0x3b,%al
c0108894:	74 0a                	je     c01088a0 <sys_printx+0x7b>
c0108896:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108899:	0f b6 00             	movzbl (%eax),%eax
c010889c:	3c 3a                	cmp    $0x3a,%al
c010889e:	75 06                	jne    c01088a6 <sys_printx+0x81>
c01088a0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01088a4:	eb 20                	jmp    c01088c6 <sys_printx+0xa1>
c01088a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01088a9:	0f b6 00             	movzbl (%eax),%eax
c01088ac:	0f b6 c0             	movzbl %al,%eax
c01088af:	83 ec 08             	sub    $0x8,%esp
c01088b2:	50                   	push   %eax
c01088b3:	ff 75 e4             	pushl  -0x1c(%ebp)
c01088b6:	e8 45 b6 ff ff       	call   c0103f00 <out_char>
c01088bb:	83 c4 10             	add    $0x10,%esp
c01088be:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01088c2:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01088c6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01088ca:	7f c0                	jg     c010888c <sys_printx+0x67>
c01088cc:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c01088d0:	75 10                	jne    c01088e2 <sys_printx+0xbd>
c01088d2:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01088d7:	85 c0                	test   %eax,%eax
c01088d9:	74 13                	je     c01088ee <sys_printx+0xc9>
c01088db:	e8 32 7a ff ff       	call   c0100312 <disable_int>
c01088e0:	eb 0c                	jmp    c01088ee <sys_printx+0xc9>
c01088e2:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c01088e6:	75 06                	jne    c01088ee <sys_printx+0xc9>
c01088e8:	e8 25 7a ff ff       	call   c0100312 <disable_int>
c01088ed:	90                   	nop
c01088ee:	90                   	nop
c01088ef:	c9                   	leave  
c01088f0:	c3                   	ret    

c01088f1 <spin>:
c01088f1:	55                   	push   %ebp
c01088f2:	89 e5                	mov    %esp,%ebp
c01088f4:	83 ec 08             	sub    $0x8,%esp
c01088f7:	83 ec 0c             	sub    $0xc,%esp
c01088fa:	ff 75 08             	pushl  0x8(%ebp)
c01088fd:	e8 8a 77 ff ff       	call   c010008c <disp_str>
c0108902:	83 c4 10             	add    $0x10,%esp
c0108905:	83 ec 0c             	sub    $0xc,%esp
c0108908:	68 13 b7 10 c0       	push   $0xc010b713
c010890d:	e8 7a 77 ff ff       	call   c010008c <disp_str>
c0108912:	83 c4 10             	add    $0x10,%esp
c0108915:	eb fe                	jmp    c0108915 <spin+0x24>

c0108917 <panic>:
c0108917:	55                   	push   %ebp
c0108918:	89 e5                	mov    %esp,%ebp
c010891a:	83 ec 08             	sub    $0x8,%esp
c010891d:	83 ec 04             	sub    $0x4,%esp
c0108920:	ff 75 08             	pushl  0x8(%ebp)
c0108923:	6a 3a                	push   $0x3a
c0108925:	68 70 bd 10 c0       	push   $0xc010bd70
c010892a:	e8 b3 fe ff ff       	call   c01087e2 <printx>
c010892f:	83 c4 10             	add    $0x10,%esp
c0108932:	90                   	nop
c0108933:	c9                   	leave  
c0108934:	c3                   	ret    

c0108935 <assertion_failure>:
c0108935:	55                   	push   %ebp
c0108936:	89 e5                	mov    %esp,%ebp
c0108938:	83 ec 08             	sub    $0x8,%esp
c010893b:	83 ec 08             	sub    $0x8,%esp
c010893e:	ff 75 14             	pushl  0x14(%ebp)
c0108941:	ff 75 10             	pushl  0x10(%ebp)
c0108944:	ff 75 0c             	pushl  0xc(%ebp)
c0108947:	ff 75 08             	pushl  0x8(%ebp)
c010894a:	6a 3b                	push   $0x3b
c010894c:	68 78 bd 10 c0       	push   $0xc010bd78
c0108951:	e8 8c fe ff ff       	call   c01087e2 <printx>
c0108956:	83 c4 20             	add    $0x20,%esp
c0108959:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108960:	00 00 00 
c0108963:	83 ec 0c             	sub    $0xc,%esp
c0108966:	68 00 b6 10 c0       	push   $0xc010b600
c010896b:	e8 1c 77 ff ff       	call   c010008c <disp_str>
c0108970:	83 c4 10             	add    $0x10,%esp
c0108973:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108978:	83 ec 0c             	sub    $0xc,%esp
c010897b:	50                   	push   %eax
c010897c:	e8 89 e7 ff ff       	call   c010710a <disp_int>
c0108981:	83 c4 10             	add    $0x10,%esp
c0108984:	83 ec 0c             	sub    $0xc,%esp
c0108987:	68 02 b6 10 c0       	push   $0xc010b602
c010898c:	e8 fb 76 ff ff       	call   c010008c <disp_str>
c0108991:	83 c4 10             	add    $0x10,%esp
c0108994:	83 ec 0c             	sub    $0xc,%esp
c0108997:	68 ab bd 10 c0       	push   $0xc010bdab
c010899c:	e8 50 ff ff ff       	call   c01088f1 <spin>
c01089a1:	83 c4 10             	add    $0x10,%esp
c01089a4:	90                   	nop
c01089a5:	c9                   	leave  
c01089a6:	c3                   	ret    

c01089a7 <assertion_failure2>:
c01089a7:	55                   	push   %ebp
c01089a8:	89 e5                	mov    %esp,%ebp
c01089aa:	83 ec 08             	sub    $0x8,%esp
c01089ad:	83 ec 04             	sub    $0x4,%esp
c01089b0:	ff 75 18             	pushl  0x18(%ebp)
c01089b3:	ff 75 14             	pushl  0x14(%ebp)
c01089b6:	ff 75 10             	pushl  0x10(%ebp)
c01089b9:	ff 75 0c             	pushl  0xc(%ebp)
c01089bc:	ff 75 08             	pushl  0x8(%ebp)
c01089bf:	6a 3b                	push   $0x3b
c01089c1:	68 b8 bd 10 c0       	push   $0xc010bdb8
c01089c6:	e8 17 fe ff ff       	call   c01087e2 <printx>
c01089cb:	83 c4 20             	add    $0x20,%esp
c01089ce:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01089d5:	00 00 00 
c01089d8:	83 ec 0c             	sub    $0xc,%esp
c01089db:	68 00 b6 10 c0       	push   $0xc010b600
c01089e0:	e8 a7 76 ff ff       	call   c010008c <disp_str>
c01089e5:	83 c4 10             	add    $0x10,%esp
c01089e8:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01089ed:	83 ec 0c             	sub    $0xc,%esp
c01089f0:	50                   	push   %eax
c01089f1:	e8 14 e7 ff ff       	call   c010710a <disp_int>
c01089f6:	83 c4 10             	add    $0x10,%esp
c01089f9:	83 ec 0c             	sub    $0xc,%esp
c01089fc:	68 02 b6 10 c0       	push   $0xc010b602
c0108a01:	e8 86 76 ff ff       	call   c010008c <disp_str>
c0108a06:	83 c4 10             	add    $0x10,%esp
c0108a09:	83 ec 0c             	sub    $0xc,%esp
c0108a0c:	68 ab bd 10 c0       	push   $0xc010bdab
c0108a11:	e8 db fe ff ff       	call   c01088f1 <spin>
c0108a16:	83 c4 10             	add    $0x10,%esp
c0108a19:	90                   	nop
c0108a1a:	c9                   	leave  
c0108a1b:	c3                   	ret    

c0108a1c <dead_lock>:
c0108a1c:	55                   	push   %ebp
c0108a1d:	89 e5                	mov    %esp,%ebp
c0108a1f:	b8 00 00 00 00       	mov    $0x0,%eax
c0108a24:	5d                   	pop    %ebp
c0108a25:	c3                   	ret    

c0108a26 <sys_send_msg>:
c0108a26:	55                   	push   %ebp
c0108a27:	89 e5                	mov    %esp,%ebp
c0108a29:	83 ec 58             	sub    $0x58,%esp
c0108a2c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108a33:	83 ec 0c             	sub    $0xc,%esp
c0108a36:	ff 75 0c             	pushl  0xc(%ebp)
c0108a39:	e8 28 ae ff ff       	call   c0103866 <pid2proc>
c0108a3e:	83 c4 10             	add    $0x10,%esp
c0108a41:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108a44:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a48:	74 2c                	je     c0108a76 <sys_send_msg+0x50>
c0108a4a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a4d:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108a53:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108a58:	74 1c                	je     c0108a76 <sys_send_msg+0x50>
c0108a5a:	68 5c 05 00 00       	push   $0x55c
c0108a5f:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a64:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a69:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108a6e:	e8 c2 fe ff ff       	call   c0108935 <assertion_failure>
c0108a73:	83 c4 10             	add    $0x10,%esp
c0108a76:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a79:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108a7f:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108a84:	74 1c                	je     c0108aa2 <sys_send_msg+0x7c>
c0108a86:	68 5e 05 00 00       	push   $0x55e
c0108a8b:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a90:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a95:	68 20 be 10 c0       	push   $0xc010be20
c0108a9a:	e8 96 fe ff ff       	call   c0108935 <assertion_failure>
c0108a9f:	83 c4 10             	add    $0x10,%esp
c0108aa2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108aa6:	75 22                	jne    c0108aca <sys_send_msg+0xa4>
c0108aa8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108aac:	75 1c                	jne    c0108aca <sys_send_msg+0xa4>
c0108aae:	68 61 05 00 00       	push   $0x561
c0108ab3:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ab8:	68 61 ba 10 c0       	push   $0xc010ba61
c0108abd:	68 43 be 10 c0       	push   $0xc010be43
c0108ac2:	e8 6e fe ff ff       	call   c0108935 <assertion_failure>
c0108ac7:	83 c4 10             	add    $0x10,%esp
c0108aca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108acd:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ad4:	84 c0                	test   %al,%al
c0108ad6:	74 65                	je     c0108b3d <sys_send_msg+0x117>
c0108ad8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108adb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ae2:	3c 01                	cmp    $0x1,%al
c0108ae4:	74 57                	je     c0108b3d <sys_send_msg+0x117>
c0108ae6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ae9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108af0:	3c 02                	cmp    $0x2,%al
c0108af2:	74 49                	je     c0108b3d <sys_send_msg+0x117>
c0108af4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108af7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108afe:	3c 03                	cmp    $0x3,%al
c0108b00:	74 3b                	je     c0108b3d <sys_send_msg+0x117>
c0108b02:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b05:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b0c:	3c 04                	cmp    $0x4,%al
c0108b0e:	74 2d                	je     c0108b3d <sys_send_msg+0x117>
c0108b10:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b13:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b1a:	0f be c0             	movsbl %al,%eax
c0108b1d:	83 ec 0c             	sub    $0xc,%esp
c0108b20:	68 65 05 00 00       	push   $0x565
c0108b25:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b2a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b2f:	50                   	push   %eax
c0108b30:	68 54 be 10 c0       	push   $0xc010be54
c0108b35:	e8 6d fe ff ff       	call   c01089a7 <assertion_failure2>
c0108b3a:	83 c4 20             	add    $0x20,%esp
c0108b3d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b40:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b47:	84 c0                	test   %al,%al
c0108b49:	74 65                	je     c0108bb0 <sys_send_msg+0x18a>
c0108b4b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b4e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b55:	3c 01                	cmp    $0x1,%al
c0108b57:	74 57                	je     c0108bb0 <sys_send_msg+0x18a>
c0108b59:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b5c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b63:	3c 02                	cmp    $0x2,%al
c0108b65:	74 49                	je     c0108bb0 <sys_send_msg+0x18a>
c0108b67:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b6a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b71:	3c 03                	cmp    $0x3,%al
c0108b73:	74 3b                	je     c0108bb0 <sys_send_msg+0x18a>
c0108b75:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b78:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b7f:	3c 04                	cmp    $0x4,%al
c0108b81:	74 2d                	je     c0108bb0 <sys_send_msg+0x18a>
c0108b83:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b86:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b8d:	0f be c0             	movsbl %al,%eax
c0108b90:	83 ec 0c             	sub    $0xc,%esp
c0108b93:	68 68 05 00 00       	push   $0x568
c0108b98:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b9d:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ba2:	50                   	push   %eax
c0108ba3:	68 f0 be 10 c0       	push   $0xc010bef0
c0108ba8:	e8 fa fd ff ff       	call   c01089a7 <assertion_failure2>
c0108bad:	83 c4 20             	add    $0x20,%esp
c0108bb0:	83 ec 0c             	sub    $0xc,%esp
c0108bb3:	ff 75 10             	pushl  0x10(%ebp)
c0108bb6:	e8 31 ad ff ff       	call   c01038ec <proc2pid>
c0108bbb:	83 c4 10             	add    $0x10,%esp
c0108bbe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108bc1:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108bc8:	8b 45 08             	mov    0x8(%ebp),%eax
c0108bcb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108bce:	83 ec 08             	sub    $0x8,%esp
c0108bd1:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108bd4:	ff 75 dc             	pushl  -0x24(%ebp)
c0108bd7:	e8 a6 d3 ff ff       	call   c0105f82 <get_physical_address_proc>
c0108bdc:	83 c4 10             	add    $0x10,%esp
c0108bdf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108be2:	83 ec 08             	sub    $0x8,%esp
c0108be5:	ff 75 e0             	pushl  -0x20(%ebp)
c0108be8:	ff 75 d8             	pushl  -0x28(%ebp)
c0108beb:	e8 bf d2 ff ff       	call   c0105eaf <alloc_virtual_memory>
c0108bf0:	83 c4 10             	add    $0x10,%esp
c0108bf3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108bf6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bf9:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108bff:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108c02:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108c09:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108c0c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108c0f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108c12:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108c15:	89 10                	mov    %edx,(%eax)
c0108c17:	83 ec 08             	sub    $0x8,%esp
c0108c1a:	ff 75 0c             	pushl  0xc(%ebp)
c0108c1d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108c20:	e8 f7 fd ff ff       	call   c0108a1c <dead_lock>
c0108c25:	83 c4 10             	add    $0x10,%esp
c0108c28:	83 f8 01             	cmp    $0x1,%eax
c0108c2b:	75 10                	jne    c0108c3d <sys_send_msg+0x217>
c0108c2d:	83 ec 0c             	sub    $0xc,%esp
c0108c30:	68 80 bf 10 c0       	push   $0xc010bf80
c0108c35:	e8 dd fc ff ff       	call   c0108917 <panic>
c0108c3a:	83 c4 10             	add    $0x10,%esp
c0108c3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c40:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c47:	3c 02                	cmp    $0x2,%al
c0108c49:	0f 85 ca 01 00 00    	jne    c0108e19 <sys_send_msg+0x3f3>
c0108c4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c52:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108c58:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108c5b:	74 12                	je     c0108c6f <sys_send_msg+0x249>
c0108c5d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c60:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108c66:	83 f8 12             	cmp    $0x12,%eax
c0108c69:	0f 85 aa 01 00 00    	jne    c0108e19 <sys_send_msg+0x3f3>
c0108c6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c72:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108c78:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108c7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c7e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108c84:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108c87:	83 ec 08             	sub    $0x8,%esp
c0108c8a:	ff 75 0c             	pushl  0xc(%ebp)
c0108c8d:	ff 75 c0             	pushl  -0x40(%ebp)
c0108c90:	e8 ed d2 ff ff       	call   c0105f82 <get_physical_address_proc>
c0108c95:	83 c4 10             	add    $0x10,%esp
c0108c98:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108c9b:	83 ec 08             	sub    $0x8,%esp
c0108c9e:	ff 75 e0             	pushl  -0x20(%ebp)
c0108ca1:	ff 75 bc             	pushl  -0x44(%ebp)
c0108ca4:	e8 06 d2 ff ff       	call   c0105eaf <alloc_virtual_memory>
c0108ca9:	83 c4 10             	add    $0x10,%esp
c0108cac:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108caf:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108cb2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108cb5:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108cb8:	83 ec 04             	sub    $0x4,%esp
c0108cbb:	51                   	push   %ecx
c0108cbc:	52                   	push   %edx
c0108cbd:	50                   	push   %eax
c0108cbe:	e8 59 e0 ff ff       	call   c0106d1c <Memcpy>
c0108cc3:	83 c4 10             	add    $0x10,%esp
c0108cc6:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108ccb:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108cd0:	75 0a                	jne    c0108cdc <sys_send_msg+0x2b6>
c0108cd2:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108cd9:	00 00 00 
c0108cdc:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cdf:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108ce6:	00 00 00 
c0108ce9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cec:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108cf3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cf6:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108cfd:	00 00 00 
c0108d00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d03:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108d0a:	00 00 00 
c0108d0d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d10:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108d17:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d1a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108d21:	00 00 00 
c0108d24:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d27:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108d2e:	00 00 00 
c0108d31:	83 ec 0c             	sub    $0xc,%esp
c0108d34:	ff 75 e8             	pushl  -0x18(%ebp)
c0108d37:	e8 a0 09 00 00       	call   c01096dc <unblock>
c0108d3c:	83 c4 10             	add    $0x10,%esp
c0108d3f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d42:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d49:	84 c0                	test   %al,%al
c0108d4b:	74 1c                	je     c0108d69 <sys_send_msg+0x343>
c0108d4d:	68 a0 05 00 00       	push   $0x5a0
c0108d52:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d57:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d5c:	68 8b bf 10 c0       	push   $0xc010bf8b
c0108d61:	e8 cf fb ff ff       	call   c0108935 <assertion_failure>
c0108d66:	83 c4 10             	add    $0x10,%esp
c0108d69:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d6c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108d72:	83 f8 21             	cmp    $0x21,%eax
c0108d75:	74 1c                	je     c0108d93 <sys_send_msg+0x36d>
c0108d77:	68 a1 05 00 00       	push   $0x5a1
c0108d7c:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d81:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d86:	68 9f bf 10 c0       	push   $0xc010bf9f
c0108d8b:	e8 a5 fb ff ff       	call   c0108935 <assertion_failure>
c0108d90:	83 c4 10             	add    $0x10,%esp
c0108d93:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d96:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108d9c:	85 c0                	test   %eax,%eax
c0108d9e:	74 1c                	je     c0108dbc <sys_send_msg+0x396>
c0108da0:	68 a3 05 00 00       	push   $0x5a3
c0108da5:	68 61 ba 10 c0       	push   $0xc010ba61
c0108daa:	68 61 ba 10 c0       	push   $0xc010ba61
c0108daf:	68 bc bf 10 c0       	push   $0xc010bfbc
c0108db4:	e8 7c fb ff ff       	call   c0108935 <assertion_failure>
c0108db9:	83 c4 10             	add    $0x10,%esp
c0108dbc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108dbf:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dc6:	84 c0                	test   %al,%al
c0108dc8:	74 1c                	je     c0108de6 <sys_send_msg+0x3c0>
c0108dca:	68 a4 05 00 00       	push   $0x5a4
c0108dcf:	68 61 ba 10 c0       	push   $0xc010ba61
c0108dd4:	68 61 ba 10 c0       	push   $0xc010ba61
c0108dd9:	68 d1 bf 10 c0       	push   $0xc010bfd1
c0108dde:	e8 52 fb ff ff       	call   c0108935 <assertion_failure>
c0108de3:	83 c4 10             	add    $0x10,%esp
c0108de6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108de9:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108def:	83 f8 21             	cmp    $0x21,%eax
c0108df2:	0f 84 45 01 00 00    	je     c0108f3d <sys_send_msg+0x517>
c0108df8:	68 a5 05 00 00       	push   $0x5a5
c0108dfd:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e02:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e07:	68 e8 bf 10 c0       	push   $0xc010bfe8
c0108e0c:	e8 24 fb ff ff       	call   c0108935 <assertion_failure>
c0108e11:	83 c4 10             	add    $0x10,%esp
c0108e14:	e9 24 01 00 00       	jmp    c0108f3d <sys_send_msg+0x517>
c0108e19:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108e20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e23:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108e26:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e29:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e2f:	85 c0                	test   %eax,%eax
c0108e31:	75 1b                	jne    c0108e4e <sys_send_msg+0x428>
c0108e33:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e36:	8b 55 10             	mov    0x10(%ebp),%edx
c0108e39:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108e3f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e42:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108e49:	00 00 00 
c0108e4c:	eb 3f                	jmp    c0108e8d <sys_send_msg+0x467>
c0108e4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e51:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e57:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e5a:	eb 12                	jmp    c0108e6e <sys_send_msg+0x448>
c0108e5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108e5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108e62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108e65:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108e6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e6e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108e72:	75 e8                	jne    c0108e5c <sys_send_msg+0x436>
c0108e74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108e77:	8b 55 10             	mov    0x10(%ebp),%edx
c0108e7a:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108e80:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e83:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108e8a:	00 00 00 
c0108e8d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e90:	8b 55 08             	mov    0x8(%ebp),%edx
c0108e93:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108e99:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e9c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108e9f:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108ea5:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ea8:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108eaf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eb2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108eb9:	3c 01                	cmp    $0x1,%al
c0108ebb:	74 1c                	je     c0108ed9 <sys_send_msg+0x4b3>
c0108ebd:	68 c7 05 00 00       	push   $0x5c7
c0108ec2:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ec7:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ecc:	68 0c c0 10 c0       	push   $0xc010c00c
c0108ed1:	e8 5f fa ff ff       	call   c0108935 <assertion_failure>
c0108ed6:	83 c4 10             	add    $0x10,%esp
c0108ed9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108edc:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108ee2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108ee5:	74 1c                	je     c0108f03 <sys_send_msg+0x4dd>
c0108ee7:	68 c8 05 00 00       	push   $0x5c8
c0108eec:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ef1:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ef6:	68 28 c0 10 c0       	push   $0xc010c028
c0108efb:	e8 35 fa ff ff       	call   c0108935 <assertion_failure>
c0108f00:	83 c4 10             	add    $0x10,%esp
c0108f03:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f06:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108f0c:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108f0f:	74 1c                	je     c0108f2d <sys_send_msg+0x507>
c0108f11:	68 c9 05 00 00       	push   $0x5c9
c0108f16:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f1b:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f20:	68 4a c0 10 c0       	push   $0xc010c04a
c0108f25:	e8 0b fa ff ff       	call   c0108935 <assertion_failure>
c0108f2a:	83 c4 10             	add    $0x10,%esp
c0108f2d:	83 ec 0c             	sub    $0xc,%esp
c0108f30:	ff 75 10             	pushl  0x10(%ebp)
c0108f33:	e8 68 07 00 00       	call   c01096a0 <block>
c0108f38:	83 c4 10             	add    $0x10,%esp
c0108f3b:	eb 01                	jmp    c0108f3e <sys_send_msg+0x518>
c0108f3d:	90                   	nop
c0108f3e:	b8 00 00 00 00       	mov    $0x0,%eax
c0108f43:	c9                   	leave  
c0108f44:	c3                   	ret    

c0108f45 <sys_receive_msg>:
c0108f45:	55                   	push   %ebp
c0108f46:	89 e5                	mov    %esp,%ebp
c0108f48:	83 ec 58             	sub    $0x58,%esp
c0108f4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108f52:	83 ec 0c             	sub    $0xc,%esp
c0108f55:	ff 75 0c             	pushl  0xc(%ebp)
c0108f58:	e8 09 a9 ff ff       	call   c0103866 <pid2proc>
c0108f5d:	83 c4 10             	add    $0x10,%esp
c0108f60:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108f63:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108f67:	74 2c                	je     c0108f95 <sys_receive_msg+0x50>
c0108f69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f6c:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108f72:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108f77:	74 1c                	je     c0108f95 <sys_receive_msg+0x50>
c0108f79:	68 dd 05 00 00       	push   $0x5dd
c0108f7e:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f83:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f88:	68 20 be 10 c0       	push   $0xc010be20
c0108f8d:	e8 a3 f9 ff ff       	call   c0108935 <assertion_failure>
c0108f92:	83 c4 10             	add    $0x10,%esp
c0108f95:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f98:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108f9e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108fa3:	74 1c                	je     c0108fc1 <sys_receive_msg+0x7c>
c0108fa5:	68 df 05 00 00       	push   $0x5df
c0108faa:	68 61 ba 10 c0       	push   $0xc010ba61
c0108faf:	68 61 ba 10 c0       	push   $0xc010ba61
c0108fb4:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108fb9:	e8 77 f9 ff ff       	call   c0108935 <assertion_failure>
c0108fbe:	83 c4 10             	add    $0x10,%esp
c0108fc1:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fc4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fcb:	84 c0                	test   %al,%al
c0108fcd:	74 65                	je     c0109034 <sys_receive_msg+0xef>
c0108fcf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fd2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fd9:	3c 01                	cmp    $0x1,%al
c0108fdb:	74 57                	je     c0109034 <sys_receive_msg+0xef>
c0108fdd:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fe0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fe7:	3c 02                	cmp    $0x2,%al
c0108fe9:	74 49                	je     c0109034 <sys_receive_msg+0xef>
c0108feb:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fee:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ff5:	3c 03                	cmp    $0x3,%al
c0108ff7:	74 3b                	je     c0109034 <sys_receive_msg+0xef>
c0108ff9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ffc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109003:	3c 04                	cmp    $0x4,%al
c0109005:	74 2d                	je     c0109034 <sys_receive_msg+0xef>
c0109007:	8b 45 10             	mov    0x10(%ebp),%eax
c010900a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109011:	0f be c0             	movsbl %al,%eax
c0109014:	83 ec 0c             	sub    $0xc,%esp
c0109017:	68 e2 05 00 00       	push   $0x5e2
c010901c:	68 61 ba 10 c0       	push   $0xc010ba61
c0109021:	68 61 ba 10 c0       	push   $0xc010ba61
c0109026:	50                   	push   %eax
c0109027:	68 54 be 10 c0       	push   $0xc010be54
c010902c:	e8 76 f9 ff ff       	call   c01089a7 <assertion_failure2>
c0109031:	83 c4 20             	add    $0x20,%esp
c0109034:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109038:	74 73                	je     c01090ad <sys_receive_msg+0x168>
c010903a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010903d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109044:	84 c0                	test   %al,%al
c0109046:	74 65                	je     c01090ad <sys_receive_msg+0x168>
c0109048:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010904b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109052:	3c 01                	cmp    $0x1,%al
c0109054:	74 57                	je     c01090ad <sys_receive_msg+0x168>
c0109056:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109059:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109060:	3c 02                	cmp    $0x2,%al
c0109062:	74 49                	je     c01090ad <sys_receive_msg+0x168>
c0109064:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109067:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010906e:	3c 03                	cmp    $0x3,%al
c0109070:	74 3b                	je     c01090ad <sys_receive_msg+0x168>
c0109072:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109075:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010907c:	3c 04                	cmp    $0x4,%al
c010907e:	74 2d                	je     c01090ad <sys_receive_msg+0x168>
c0109080:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109083:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010908a:	0f be c0             	movsbl %al,%eax
c010908d:	83 ec 0c             	sub    $0xc,%esp
c0109090:	68 e6 05 00 00       	push   $0x5e6
c0109095:	68 61 ba 10 c0       	push   $0xc010ba61
c010909a:	68 61 ba 10 c0       	push   $0xc010ba61
c010909f:	50                   	push   %eax
c01090a0:	68 f0 be 10 c0       	push   $0xc010bef0
c01090a5:	e8 fd f8 ff ff       	call   c01089a7 <assertion_failure2>
c01090aa:	83 c4 20             	add    $0x20,%esp
c01090ad:	83 ec 0c             	sub    $0xc,%esp
c01090b0:	ff 75 10             	pushl  0x10(%ebp)
c01090b3:	e8 34 a8 ff ff       	call   c01038ec <proc2pid>
c01090b8:	83 c4 10             	add    $0x10,%esp
c01090bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01090be:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c01090c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01090c8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01090cb:	8b 45 10             	mov    0x10(%ebp),%eax
c01090ce:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01090d4:	83 ec 08             	sub    $0x8,%esp
c01090d7:	50                   	push   %eax
c01090d8:	ff 75 d8             	pushl  -0x28(%ebp)
c01090db:	e8 a2 ce ff ff       	call   c0105f82 <get_physical_address_proc>
c01090e0:	83 c4 10             	add    $0x10,%esp
c01090e3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01090e6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01090ed:	8b 45 10             	mov    0x10(%ebp),%eax
c01090f0:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c01090f6:	85 c0                	test   %eax,%eax
c01090f8:	0f 84 c5 00 00 00    	je     c01091c3 <sys_receive_msg+0x27e>
c01090fe:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109102:	74 0d                	je     c0109111 <sys_receive_msg+0x1cc>
c0109104:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010910b:	0f 85 b2 00 00 00    	jne    c01091c3 <sys_receive_msg+0x27e>
c0109111:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0109118:	83 ec 0c             	sub    $0xc,%esp
c010911b:	ff 75 d0             	pushl  -0x30(%ebp)
c010911e:	e8 49 85 ff ff       	call   c010166c <sys_malloc>
c0109123:	83 c4 10             	add    $0x10,%esp
c0109126:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109129:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010912c:	83 ec 04             	sub    $0x4,%esp
c010912f:	50                   	push   %eax
c0109130:	6a 00                	push   $0x0
c0109132:	ff 75 cc             	pushl  -0x34(%ebp)
c0109135:	e8 95 30 00 00       	call   c010c1cf <Memset>
c010913a:	83 c4 10             	add    $0x10,%esp
c010913d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109140:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109146:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109149:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109150:	83 ec 08             	sub    $0x8,%esp
c0109153:	ff 75 d0             	pushl  -0x30(%ebp)
c0109156:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109159:	e8 51 cd ff ff       	call   c0105eaf <alloc_virtual_memory>
c010915e:	83 c4 10             	add    $0x10,%esp
c0109161:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0109164:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0109167:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010916a:	83 ec 04             	sub    $0x4,%esp
c010916d:	52                   	push   %edx
c010916e:	ff 75 cc             	pushl  -0x34(%ebp)
c0109171:	50                   	push   %eax
c0109172:	e8 a5 db ff ff       	call   c0106d1c <Memcpy>
c0109177:	83 c4 10             	add    $0x10,%esp
c010917a:	8b 45 10             	mov    0x10(%ebp),%eax
c010917d:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109184:	00 00 00 
c0109187:	8b 45 10             	mov    0x10(%ebp),%eax
c010918a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109191:	00 00 00 
c0109194:	8b 45 10             	mov    0x10(%ebp),%eax
c0109197:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010919e:	00 00 00 
c01091a1:	8b 45 10             	mov    0x10(%ebp),%eax
c01091a4:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01091ab:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01091b2:	83 ec 08             	sub    $0x8,%esp
c01091b5:	ff 75 d0             	pushl  -0x30(%ebp)
c01091b8:	ff 75 cc             	pushl  -0x34(%ebp)
c01091bb:	e8 c1 84 ff ff       	call   c0101681 <sys_free>
c01091c0:	83 c4 10             	add    $0x10,%esp
c01091c3:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c01091c7:	0f 84 d4 03 00 00    	je     c01095a1 <sys_receive_msg+0x65c>
c01091cd:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01091d1:	75 26                	jne    c01091f9 <sys_receive_msg+0x2b4>
c01091d3:	8b 45 10             	mov    0x10(%ebp),%eax
c01091d6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01091dc:	85 c0                	test   %eax,%eax
c01091de:	0f 84 8a 00 00 00    	je     c010926e <sys_receive_msg+0x329>
c01091e4:	8b 45 10             	mov    0x10(%ebp),%eax
c01091e7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01091ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01091f0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01091f7:	eb 75                	jmp    c010926e <sys_receive_msg+0x329>
c01091f9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01091fd:	78 6f                	js     c010926e <sys_receive_msg+0x329>
c01091ff:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109203:	7f 69                	jg     c010926e <sys_receive_msg+0x329>
c0109205:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109208:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010920f:	3c 01                	cmp    $0x1,%al
c0109211:	75 5b                	jne    c010926e <sys_receive_msg+0x329>
c0109213:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109216:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010921c:	83 f8 12             	cmp    $0x12,%eax
c010921f:	74 0e                	je     c010922f <sys_receive_msg+0x2ea>
c0109221:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109224:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010922a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c010922d:	75 3f                	jne    c010926e <sys_receive_msg+0x329>
c010922f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109232:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109238:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010923b:	eb 2b                	jmp    c0109268 <sys_receive_msg+0x323>
c010923d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109240:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109243:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109246:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010924c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010924f:	39 c2                	cmp    %eax,%edx
c0109251:	75 09                	jne    c010925c <sys_receive_msg+0x317>
c0109253:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010925a:	eb 12                	jmp    c010926e <sys_receive_msg+0x329>
c010925c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010925f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0109265:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109268:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010926c:	75 cf                	jne    c010923d <sys_receive_msg+0x2f8>
c010926e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0109272:	0f 85 4e 02 00 00    	jne    c01094c6 <sys_receive_msg+0x581>
c0109278:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010927b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010927e:	83 ec 08             	sub    $0x8,%esp
c0109281:	ff 75 dc             	pushl  -0x24(%ebp)
c0109284:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109287:	e8 23 cc ff ff       	call   c0105eaf <alloc_virtual_memory>
c010928c:	83 c4 10             	add    $0x10,%esp
c010928f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0109292:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109295:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010929b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010929e:	83 ec 0c             	sub    $0xc,%esp
c01092a1:	ff 75 c4             	pushl  -0x3c(%ebp)
c01092a4:	e8 43 a6 ff ff       	call   c01038ec <proc2pid>
c01092a9:	83 c4 10             	add    $0x10,%esp
c01092ac:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01092af:	83 ec 08             	sub    $0x8,%esp
c01092b2:	ff 75 b8             	pushl  -0x48(%ebp)
c01092b5:	ff 75 bc             	pushl  -0x44(%ebp)
c01092b8:	e8 c5 cc ff ff       	call   c0105f82 <get_physical_address_proc>
c01092bd:	83 c4 10             	add    $0x10,%esp
c01092c0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01092c3:	83 ec 08             	sub    $0x8,%esp
c01092c6:	ff 75 dc             	pushl  -0x24(%ebp)
c01092c9:	ff 75 b4             	pushl  -0x4c(%ebp)
c01092cc:	e8 de cb ff ff       	call   c0105eaf <alloc_virtual_memory>
c01092d1:	83 c4 10             	add    $0x10,%esp
c01092d4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01092d7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01092da:	83 ec 04             	sub    $0x4,%esp
c01092dd:	50                   	push   %eax
c01092de:	ff 75 b0             	pushl  -0x50(%ebp)
c01092e1:	ff 75 c0             	pushl  -0x40(%ebp)
c01092e4:	e8 33 da ff ff       	call   c0106d1c <Memcpy>
c01092e9:	83 c4 10             	add    $0x10,%esp
c01092ec:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01092ef:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01092f2:	8b 45 10             	mov    0x10(%ebp),%eax
c01092f5:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01092fb:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01092fe:	75 21                	jne    c0109321 <sys_receive_msg+0x3dc>
c0109300:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109303:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109309:	8b 45 10             	mov    0x10(%ebp),%eax
c010930c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109312:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109315:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010931c:	00 00 00 
c010931f:	eb 1f                	jmp    c0109340 <sys_receive_msg+0x3fb>
c0109321:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109324:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010932a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010932d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109333:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109336:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010933d:	00 00 00 
c0109340:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109343:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010934a:	00 00 00 
c010934d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109350:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109357:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010935a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109361:	00 00 00 
c0109364:	8b 45 10             	mov    0x10(%ebp),%eax
c0109367:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010936e:	00 00 00 
c0109371:	8b 45 10             	mov    0x10(%ebp),%eax
c0109374:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010937b:	00 00 00 
c010937e:	8b 45 10             	mov    0x10(%ebp),%eax
c0109381:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109388:	00 00 00 
c010938b:	83 ec 0c             	sub    $0xc,%esp
c010938e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109391:	e8 46 03 00 00       	call   c01096dc <unblock>
c0109396:	83 c4 10             	add    $0x10,%esp
c0109399:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010939c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01093a2:	85 c0                	test   %eax,%eax
c01093a4:	74 1c                	je     c01093c2 <sys_receive_msg+0x47d>
c01093a6:	68 56 06 00 00       	push   $0x656
c01093ab:	68 61 ba 10 c0       	push   $0xc010ba61
c01093b0:	68 61 ba 10 c0       	push   $0xc010ba61
c01093b5:	68 5f c0 10 c0       	push   $0xc010c05f
c01093ba:	e8 76 f5 ff ff       	call   c0108935 <assertion_failure>
c01093bf:	83 c4 10             	add    $0x10,%esp
c01093c2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093c5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01093cc:	84 c0                	test   %al,%al
c01093ce:	74 1c                	je     c01093ec <sys_receive_msg+0x4a7>
c01093d0:	68 57 06 00 00       	push   $0x657
c01093d5:	68 61 ba 10 c0       	push   $0xc010ba61
c01093da:	68 61 ba 10 c0       	push   $0xc010ba61
c01093df:	68 77 c0 10 c0       	push   $0xc010c077
c01093e4:	e8 4c f5 ff ff       	call   c0108935 <assertion_failure>
c01093e9:	83 c4 10             	add    $0x10,%esp
c01093ec:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093ef:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01093f5:	83 f8 21             	cmp    $0x21,%eax
c01093f8:	74 1c                	je     c0109416 <sys_receive_msg+0x4d1>
c01093fa:	68 58 06 00 00       	push   $0x658
c01093ff:	68 61 ba 10 c0       	push   $0xc010ba61
c0109404:	68 61 ba 10 c0       	push   $0xc010ba61
c0109409:	68 90 c0 10 c0       	push   $0xc010c090
c010940e:	e8 22 f5 ff ff       	call   c0108935 <assertion_failure>
c0109413:	83 c4 10             	add    $0x10,%esp
c0109416:	8b 45 10             	mov    0x10(%ebp),%eax
c0109419:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010941f:	85 c0                	test   %eax,%eax
c0109421:	74 1c                	je     c010943f <sys_receive_msg+0x4fa>
c0109423:	68 5a 06 00 00       	push   $0x65a
c0109428:	68 61 ba 10 c0       	push   $0xc010ba61
c010942d:	68 61 ba 10 c0       	push   $0xc010ba61
c0109432:	68 bc bf 10 c0       	push   $0xc010bfbc
c0109437:	e8 f9 f4 ff ff       	call   c0108935 <assertion_failure>
c010943c:	83 c4 10             	add    $0x10,%esp
c010943f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109442:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109449:	84 c0                	test   %al,%al
c010944b:	74 1c                	je     c0109469 <sys_receive_msg+0x524>
c010944d:	68 5b 06 00 00       	push   $0x65b
c0109452:	68 61 ba 10 c0       	push   $0xc010ba61
c0109457:	68 61 ba 10 c0       	push   $0xc010ba61
c010945c:	68 d1 bf 10 c0       	push   $0xc010bfd1
c0109461:	e8 cf f4 ff ff       	call   c0108935 <assertion_failure>
c0109466:	83 c4 10             	add    $0x10,%esp
c0109469:	8b 45 10             	mov    0x10(%ebp),%eax
c010946c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109472:	83 f8 21             	cmp    $0x21,%eax
c0109475:	74 1c                	je     c0109493 <sys_receive_msg+0x54e>
c0109477:	68 5c 06 00 00       	push   $0x65c
c010947c:	68 61 ba 10 c0       	push   $0xc010ba61
c0109481:	68 61 ba 10 c0       	push   $0xc010ba61
c0109486:	68 e8 bf 10 c0       	push   $0xc010bfe8
c010948b:	e8 a5 f4 ff ff       	call   c0108935 <assertion_failure>
c0109490:	83 c4 10             	add    $0x10,%esp
c0109493:	8b 45 10             	mov    0x10(%ebp),%eax
c0109496:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010949c:	83 f8 21             	cmp    $0x21,%eax
c010949f:	0f 84 f5 00 00 00    	je     c010959a <sys_receive_msg+0x655>
c01094a5:	68 5d 06 00 00       	push   $0x65d
c01094aa:	68 61 ba 10 c0       	push   $0xc010ba61
c01094af:	68 61 ba 10 c0       	push   $0xc010ba61
c01094b4:	68 b4 c0 10 c0       	push   $0xc010c0b4
c01094b9:	e8 77 f4 ff ff       	call   c0108935 <assertion_failure>
c01094be:	83 c4 10             	add    $0x10,%esp
c01094c1:	e9 d4 00 00 00       	jmp    c010959a <sys_receive_msg+0x655>
c01094c6:	8b 45 10             	mov    0x10(%ebp),%eax
c01094c9:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c01094d0:	8b 45 10             	mov    0x10(%ebp),%eax
c01094d3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094da:	3c 02                	cmp    $0x2,%al
c01094dc:	74 1c                	je     c01094fa <sys_receive_msg+0x5b5>
c01094de:	68 62 06 00 00       	push   $0x662
c01094e3:	68 61 ba 10 c0       	push   $0xc010ba61
c01094e8:	68 61 ba 10 c0       	push   $0xc010ba61
c01094ed:	68 d3 c0 10 c0       	push   $0xc010c0d3
c01094f2:	e8 3e f4 ff ff       	call   c0108935 <assertion_failure>
c01094f7:	83 c4 10             	add    $0x10,%esp
c01094fa:	8b 45 10             	mov    0x10(%ebp),%eax
c01094fd:	8b 55 08             	mov    0x8(%ebp),%edx
c0109500:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109506:	8b 45 10             	mov    0x10(%ebp),%eax
c0109509:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109510:	3c 02                	cmp    $0x2,%al
c0109512:	74 1c                	je     c0109530 <sys_receive_msg+0x5eb>
c0109514:	68 64 06 00 00       	push   $0x664
c0109519:	68 61 ba 10 c0       	push   $0xc010ba61
c010951e:	68 61 ba 10 c0       	push   $0xc010ba61
c0109523:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109528:	e8 08 f4 ff ff       	call   c0108935 <assertion_failure>
c010952d:	83 c4 10             	add    $0x10,%esp
c0109530:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109534:	75 0f                	jne    c0109545 <sys_receive_msg+0x600>
c0109536:	8b 45 10             	mov    0x10(%ebp),%eax
c0109539:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c0109540:	00 00 00 
c0109543:	eb 0c                	jmp    c0109551 <sys_receive_msg+0x60c>
c0109545:	8b 45 10             	mov    0x10(%ebp),%eax
c0109548:	8b 55 0c             	mov    0xc(%ebp),%edx
c010954b:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0109551:	8b 45 10             	mov    0x10(%ebp),%eax
c0109554:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010955b:	3c 02                	cmp    $0x2,%al
c010955d:	74 2d                	je     c010958c <sys_receive_msg+0x647>
c010955f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109562:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109569:	0f be c0             	movsbl %al,%eax
c010956c:	83 ec 0c             	sub    $0xc,%esp
c010956f:	68 6f 06 00 00       	push   $0x66f
c0109574:	68 61 ba 10 c0       	push   $0xc010ba61
c0109579:	68 61 ba 10 c0       	push   $0xc010ba61
c010957e:	50                   	push   %eax
c010957f:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109584:	e8 1e f4 ff ff       	call   c01089a7 <assertion_failure2>
c0109589:	83 c4 20             	add    $0x20,%esp
c010958c:	83 ec 0c             	sub    $0xc,%esp
c010958f:	ff 75 10             	pushl  0x10(%ebp)
c0109592:	e8 09 01 00 00       	call   c01096a0 <block>
c0109597:	83 c4 10             	add    $0x10,%esp
c010959a:	b8 00 00 00 00       	mov    $0x0,%eax
c010959f:	eb 02                	jmp    c01095a3 <sys_receive_msg+0x65e>
c01095a1:	90                   	nop
c01095a2:	90                   	nop
c01095a3:	c9                   	leave  
c01095a4:	c3                   	ret    

c01095a5 <send_rec>:
c01095a5:	55                   	push   %ebp
c01095a6:	89 e5                	mov    %esp,%ebp
c01095a8:	83 ec 18             	sub    $0x18,%esp
c01095ab:	8b 45 0c             	mov    0xc(%ebp),%eax
c01095ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01095b1:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01095b8:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01095bc:	74 28                	je     c01095e6 <send_rec+0x41>
c01095be:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01095c2:	74 22                	je     c01095e6 <send_rec+0x41>
c01095c4:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01095c8:	74 1c                	je     c01095e6 <send_rec+0x41>
c01095ca:	68 81 06 00 00       	push   $0x681
c01095cf:	68 61 ba 10 c0       	push   $0xc010ba61
c01095d4:	68 61 ba 10 c0       	push   $0xc010ba61
c01095d9:	68 f4 c0 10 c0       	push   $0xc010c0f4
c01095de:	e8 52 f3 ff ff       	call   c0108935 <assertion_failure>
c01095e3:	83 c4 10             	add    $0x10,%esp
c01095e6:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01095ea:	75 14                	jne    c0109600 <send_rec+0x5b>
c01095ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01095ef:	83 ec 04             	sub    $0x4,%esp
c01095f2:	50                   	push   %eax
c01095f3:	6a 00                	push   $0x0
c01095f5:	ff 75 0c             	pushl  0xc(%ebp)
c01095f8:	e8 d2 2b 00 00       	call   c010c1cf <Memset>
c01095fd:	83 c4 10             	add    $0x10,%esp
c0109600:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109604:	74 23                	je     c0109629 <send_rec+0x84>
c0109606:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010960a:	74 34                	je     c0109640 <send_rec+0x9b>
c010960c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109610:	75 74                	jne    c0109686 <send_rec+0xe1>
c0109612:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109615:	83 ec 08             	sub    $0x8,%esp
c0109618:	ff 75 10             	pushl  0x10(%ebp)
c010961b:	50                   	push   %eax
c010961c:	e8 1f 80 ff ff       	call   c0101640 <send_msg>
c0109621:	83 c4 10             	add    $0x10,%esp
c0109624:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109627:	eb 70                	jmp    c0109699 <send_rec+0xf4>
c0109629:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010962c:	83 ec 08             	sub    $0x8,%esp
c010962f:	ff 75 10             	pushl  0x10(%ebp)
c0109632:	50                   	push   %eax
c0109633:	e8 1e 80 ff ff       	call   c0101656 <receive_msg>
c0109638:	83 c4 10             	add    $0x10,%esp
c010963b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010963e:	eb 59                	jmp    c0109699 <send_rec+0xf4>
c0109640:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109643:	83 ec 08             	sub    $0x8,%esp
c0109646:	ff 75 10             	pushl  0x10(%ebp)
c0109649:	50                   	push   %eax
c010964a:	e8 f1 7f ff ff       	call   c0101640 <send_msg>
c010964f:	83 c4 10             	add    $0x10,%esp
c0109652:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109655:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0109659:	75 3d                	jne    c0109698 <send_rec+0xf3>
c010965b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010965e:	83 ec 04             	sub    $0x4,%esp
c0109661:	50                   	push   %eax
c0109662:	6a 00                	push   $0x0
c0109664:	ff 75 0c             	pushl  0xc(%ebp)
c0109667:	e8 63 2b 00 00       	call   c010c1cf <Memset>
c010966c:	83 c4 10             	add    $0x10,%esp
c010966f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109672:	83 ec 08             	sub    $0x8,%esp
c0109675:	ff 75 10             	pushl  0x10(%ebp)
c0109678:	50                   	push   %eax
c0109679:	e8 d8 7f ff ff       	call   c0101656 <receive_msg>
c010967e:	83 c4 10             	add    $0x10,%esp
c0109681:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109684:	eb 12                	jmp    c0109698 <send_rec+0xf3>
c0109686:	83 ec 0c             	sub    $0xc,%esp
c0109689:	68 30 c1 10 c0       	push   $0xc010c130
c010968e:	e8 84 f2 ff ff       	call   c0108917 <panic>
c0109693:	83 c4 10             	add    $0x10,%esp
c0109696:	eb 01                	jmp    c0109699 <send_rec+0xf4>
c0109698:	90                   	nop
c0109699:	b8 00 00 00 00       	mov    $0x0,%eax
c010969e:	c9                   	leave  
c010969f:	c3                   	ret    

c01096a0 <block>:
c01096a0:	55                   	push   %ebp
c01096a1:	89 e5                	mov    %esp,%ebp
c01096a3:	83 ec 08             	sub    $0x8,%esp
c01096a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01096a9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096b0:	84 c0                	test   %al,%al
c01096b2:	75 1c                	jne    c01096d0 <block+0x30>
c01096b4:	68 b0 06 00 00       	push   $0x6b0
c01096b9:	68 61 ba 10 c0       	push   $0xc010ba61
c01096be:	68 61 ba 10 c0       	push   $0xc010ba61
c01096c3:	68 45 c1 10 c0       	push   $0xc010c145
c01096c8:	e8 68 f2 ff ff       	call   c0108935 <assertion_failure>
c01096cd:	83 c4 10             	add    $0x10,%esp
c01096d0:	e8 13 a0 ff ff       	call   c01036e8 <schedule_process>
c01096d5:	b8 00 00 00 00       	mov    $0x0,%eax
c01096da:	c9                   	leave  
c01096db:	c3                   	ret    

c01096dc <unblock>:
c01096dc:	55                   	push   %ebp
c01096dd:	89 e5                	mov    %esp,%ebp
c01096df:	83 ec 08             	sub    $0x8,%esp
c01096e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01096e5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096ec:	84 c0                	test   %al,%al
c01096ee:	74 1c                	je     c010970c <unblock+0x30>
c01096f0:	68 b9 06 00 00       	push   $0x6b9
c01096f5:	68 61 ba 10 c0       	push   $0xc010ba61
c01096fa:	68 61 ba 10 c0       	push   $0xc010ba61
c01096ff:	68 5d c1 10 c0       	push   $0xc010c15d
c0109704:	e8 2c f2 ff ff       	call   c0108935 <assertion_failure>
c0109709:	83 c4 10             	add    $0x10,%esp
c010970c:	8b 45 08             	mov    0x8(%ebp),%eax
c010970f:	05 60 02 00 00       	add    $0x260,%eax
c0109714:	83 ec 08             	sub    $0x8,%esp
c0109717:	50                   	push   %eax
c0109718:	68 ec fd 10 c0       	push   $0xc010fdec
c010971d:	e8 ce 0a 00 00       	call   c010a1f0 <appendToDoubleLinkList>
c0109722:	83 c4 10             	add    $0x10,%esp
c0109725:	b8 00 00 00 00       	mov    $0x0,%eax
c010972a:	c9                   	leave  
c010972b:	c3                   	ret    

c010972c <get_ticks_ipc>:
c010972c:	55                   	push   %ebp
c010972d:	89 e5                	mov    %esp,%ebp
c010972f:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109735:	83 ec 04             	sub    $0x4,%esp
c0109738:	6a 7c                	push   $0x7c
c010973a:	6a 00                	push   $0x0
c010973c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109742:	50                   	push   %eax
c0109743:	e8 87 2a 00 00       	call   c010c1cf <Memset>
c0109748:	83 c4 10             	add    $0x10,%esp
c010974b:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109752:	00 00 00 
c0109755:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010975c:	83 ec 04             	sub    $0x4,%esp
c010975f:	6a 01                	push   $0x1
c0109761:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109767:	50                   	push   %eax
c0109768:	6a 03                	push   $0x3
c010976a:	e8 36 fe ff ff       	call   c01095a5 <send_rec>
c010976f:	83 c4 10             	add    $0x10,%esp
c0109772:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109775:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010977b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010977e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109781:	c9                   	leave  
c0109782:	c3                   	ret    

c0109783 <itoa>:
c0109783:	55                   	push   %ebp
c0109784:	89 e5                	mov    %esp,%ebp
c0109786:	53                   	push   %ebx
c0109787:	83 ec 14             	sub    $0x14,%esp
c010978a:	8b 45 08             	mov    0x8(%ebp),%eax
c010978d:	99                   	cltd   
c010978e:	f7 7d 10             	idivl  0x10(%ebp)
c0109791:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109794:	8b 45 08             	mov    0x8(%ebp),%eax
c0109797:	99                   	cltd   
c0109798:	f7 7d 10             	idivl  0x10(%ebp)
c010979b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010979e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01097a2:	74 14                	je     c01097b8 <itoa+0x35>
c01097a4:	83 ec 04             	sub    $0x4,%esp
c01097a7:	ff 75 10             	pushl  0x10(%ebp)
c01097aa:	ff 75 0c             	pushl  0xc(%ebp)
c01097ad:	ff 75 f0             	pushl  -0x10(%ebp)
c01097b0:	e8 ce ff ff ff       	call   c0109783 <itoa>
c01097b5:	83 c4 10             	add    $0x10,%esp
c01097b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097bb:	8d 58 30             	lea    0x30(%eax),%ebx
c01097be:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097c1:	8b 00                	mov    (%eax),%eax
c01097c3:	8d 48 01             	lea    0x1(%eax),%ecx
c01097c6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01097c9:	89 0a                	mov    %ecx,(%edx)
c01097cb:	89 da                	mov    %ebx,%edx
c01097cd:	88 10                	mov    %dl,(%eax)
c01097cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097d2:	8b 00                	mov    (%eax),%eax
c01097d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01097d7:	c9                   	leave  
c01097d8:	c3                   	ret    

c01097d9 <i2a>:
c01097d9:	55                   	push   %ebp
c01097da:	89 e5                	mov    %esp,%ebp
c01097dc:	53                   	push   %ebx
c01097dd:	83 ec 14             	sub    $0x14,%esp
c01097e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01097e3:	99                   	cltd   
c01097e4:	f7 7d 0c             	idivl  0xc(%ebp)
c01097e7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01097ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01097ed:	99                   	cltd   
c01097ee:	f7 7d 0c             	idivl  0xc(%ebp)
c01097f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01097f4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01097f8:	74 14                	je     c010980e <i2a+0x35>
c01097fa:	83 ec 04             	sub    $0x4,%esp
c01097fd:	ff 75 10             	pushl  0x10(%ebp)
c0109800:	ff 75 0c             	pushl  0xc(%ebp)
c0109803:	ff 75 f0             	pushl  -0x10(%ebp)
c0109806:	e8 ce ff ff ff       	call   c01097d9 <i2a>
c010980b:	83 c4 10             	add    $0x10,%esp
c010980e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109812:	7f 0a                	jg     c010981e <i2a+0x45>
c0109814:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109817:	83 c0 30             	add    $0x30,%eax
c010981a:	89 c3                	mov    %eax,%ebx
c010981c:	eb 08                	jmp    c0109826 <i2a+0x4d>
c010981e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109821:	83 c0 37             	add    $0x37,%eax
c0109824:	89 c3                	mov    %eax,%ebx
c0109826:	8b 45 10             	mov    0x10(%ebp),%eax
c0109829:	8b 00                	mov    (%eax),%eax
c010982b:	8d 48 01             	lea    0x1(%eax),%ecx
c010982e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109831:	89 0a                	mov    %ecx,(%edx)
c0109833:	88 18                	mov    %bl,(%eax)
c0109835:	8b 45 10             	mov    0x10(%ebp),%eax
c0109838:	8b 00                	mov    (%eax),%eax
c010983a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010983d:	c9                   	leave  
c010983e:	c3                   	ret    

c010983f <inform_int>:
c010983f:	55                   	push   %ebp
c0109840:	89 e5                	mov    %esp,%ebp
c0109842:	83 ec 18             	sub    $0x18,%esp
c0109845:	83 ec 0c             	sub    $0xc,%esp
c0109848:	ff 75 08             	pushl  0x8(%ebp)
c010984b:	e8 16 a0 ff ff       	call   c0103866 <pid2proc>
c0109850:	83 c4 10             	add    $0x10,%esp
c0109853:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109856:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109859:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109860:	0f be c0             	movsbl %al,%eax
c0109863:	83 e0 02             	and    $0x2,%eax
c0109866:	85 c0                	test   %eax,%eax
c0109868:	0f 84 8e 00 00 00    	je     c01098fc <inform_int+0xbd>
c010986e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109871:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109877:	3d 13 02 00 00       	cmp    $0x213,%eax
c010987c:	74 0e                	je     c010988c <inform_int+0x4d>
c010987e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109881:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109887:	83 f8 12             	cmp    $0x12,%eax
c010988a:	75 7d                	jne    c0109909 <inform_int+0xca>
c010988c:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109893:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109896:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010989c:	83 ec 08             	sub    $0x8,%esp
c010989f:	ff 75 f0             	pushl  -0x10(%ebp)
c01098a2:	50                   	push   %eax
c01098a3:	e8 07 c6 ff ff       	call   c0105eaf <alloc_virtual_memory>
c01098a8:	83 c4 10             	add    $0x10,%esp
c01098ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01098ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01098b1:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c01098b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01098ba:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c01098c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098c4:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c01098cb:	00 00 00 
c01098ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098d1:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01098d8:	00 00 00 
c01098db:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01098e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098e5:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01098ec:	83 ec 0c             	sub    $0xc,%esp
c01098ef:	ff 75 f4             	pushl  -0xc(%ebp)
c01098f2:	e8 e5 fd ff ff       	call   c01096dc <unblock>
c01098f7:	83 c4 10             	add    $0x10,%esp
c01098fa:	eb 0d                	jmp    c0109909 <inform_int+0xca>
c01098fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098ff:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109906:	00 00 00 
c0109909:	90                   	nop
c010990a:	c9                   	leave  
c010990b:	c3                   	ret    

c010990c <strcmp>:
c010990c:	55                   	push   %ebp
c010990d:	89 e5                	mov    %esp,%ebp
c010990f:	83 ec 10             	sub    $0x10,%esp
c0109912:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109916:	74 06                	je     c010991e <strcmp+0x12>
c0109918:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010991c:	75 08                	jne    c0109926 <strcmp+0x1a>
c010991e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109921:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109924:	eb 53                	jmp    c0109979 <strcmp+0x6d>
c0109926:	8b 45 08             	mov    0x8(%ebp),%eax
c0109929:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010992c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010992f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109932:	eb 18                	jmp    c010994c <strcmp+0x40>
c0109934:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109937:	0f b6 10             	movzbl (%eax),%edx
c010993a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010993d:	0f b6 00             	movzbl (%eax),%eax
c0109940:	38 c2                	cmp    %al,%dl
c0109942:	75 1e                	jne    c0109962 <strcmp+0x56>
c0109944:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0109948:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010994c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010994f:	0f b6 00             	movzbl (%eax),%eax
c0109952:	84 c0                	test   %al,%al
c0109954:	74 0d                	je     c0109963 <strcmp+0x57>
c0109956:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109959:	0f b6 00             	movzbl (%eax),%eax
c010995c:	84 c0                	test   %al,%al
c010995e:	75 d4                	jne    c0109934 <strcmp+0x28>
c0109960:	eb 01                	jmp    c0109963 <strcmp+0x57>
c0109962:	90                   	nop
c0109963:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109966:	0f b6 00             	movzbl (%eax),%eax
c0109969:	0f be d0             	movsbl %al,%edx
c010996c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010996f:	0f b6 00             	movzbl (%eax),%eax
c0109972:	0f be c0             	movsbl %al,%eax
c0109975:	29 c2                	sub    %eax,%edx
c0109977:	89 d0                	mov    %edx,%eax
c0109979:	c9                   	leave  
c010997a:	c3                   	ret    

c010997b <create_user_process_address_space>:
c010997b:	55                   	push   %ebp
c010997c:	89 e5                	mov    %esp,%ebp
c010997e:	83 ec 18             	sub    $0x18,%esp
c0109981:	83 ec 08             	sub    $0x8,%esp
c0109984:	6a 00                	push   $0x0
c0109986:	6a 01                	push   $0x1
c0109988:	e8 5a c8 ff ff       	call   c01061e7 <alloc_memory>
c010998d:	83 c4 10             	add    $0x10,%esp
c0109990:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109993:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109996:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c010999d:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c01099a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01099a7:	05 ff 0f 00 00       	add    $0xfff,%eax
c01099ac:	c1 e8 0c             	shr    $0xc,%eax
c01099af:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01099b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01099b5:	83 c0 07             	add    $0x7,%eax
c01099b8:	c1 e8 03             	shr    $0x3,%eax
c01099bb:	89 c2                	mov    %eax,%edx
c01099bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099c0:	89 50 04             	mov    %edx,0x4(%eax)
c01099c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099c6:	8b 40 04             	mov    0x4(%eax),%eax
c01099c9:	05 ff 0f 00 00       	add    $0xfff,%eax
c01099ce:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01099d4:	85 c0                	test   %eax,%eax
c01099d6:	0f 48 c2             	cmovs  %edx,%eax
c01099d9:	c1 f8 0c             	sar    $0xc,%eax
c01099dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01099df:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01099e2:	83 ec 08             	sub    $0x8,%esp
c01099e5:	6a 00                	push   $0x0
c01099e7:	50                   	push   %eax
c01099e8:	e8 fa c7 ff ff       	call   c01061e7 <alloc_memory>
c01099ed:	83 c4 10             	add    $0x10,%esp
c01099f0:	89 c2                	mov    %eax,%edx
c01099f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099f5:	89 10                	mov    %edx,(%eax)
c01099f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099fa:	83 ec 0c             	sub    $0xc,%esp
c01099fd:	50                   	push   %eax
c01099fe:	e8 b6 bf ff ff       	call   c01059b9 <init_bitmap>
c0109a03:	83 c4 10             	add    $0x10,%esp
c0109a06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a09:	c9                   	leave  
c0109a0a:	c3                   	ret    

c0109a0b <user_process>:
c0109a0b:	55                   	push   %ebp
c0109a0c:	89 e5                	mov    %esp,%ebp
c0109a0e:	83 ec 38             	sub    $0x38,%esp
c0109a11:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109a18:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109a1f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109a26:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0109a2a:	75 0e                	jne    c0109a3a <user_process+0x2f>
c0109a2c:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109a32:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109a38:	eb 0c                	jmp    c0109a46 <user_process+0x3b>
c0109a3a:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109a40:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109a46:	e8 a3 69 ff ff       	call   c01003ee <get_running_thread_pcb>
c0109a4b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109a4e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a51:	8b 55 14             	mov    0x14(%ebp),%edx
c0109a54:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109a5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a5d:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109a63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a66:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109a6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a6f:	05 00 10 00 00       	add    $0x1000,%eax
c0109a74:	89 c2                	mov    %eax,%edx
c0109a76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a79:	89 10                	mov    %edx,(%eax)
c0109a7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a7e:	8b 00                	mov    (%eax),%eax
c0109a80:	83 e8 44             	sub    $0x44,%eax
c0109a83:	89 c2                	mov    %eax,%edx
c0109a85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a88:	89 10                	mov    %edx,(%eax)
c0109a8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a8d:	8b 00                	mov    (%eax),%eax
c0109a8f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109a92:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109a96:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109a9c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109aa0:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109aa4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109aa8:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109aac:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109ab0:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109ab4:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109aba:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109abe:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ac1:	89 50 34             	mov    %edx,0x34(%eax)
c0109ac4:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ac8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109acb:	89 50 0c             	mov    %edx,0xc(%eax)
c0109ace:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ad2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ad5:	89 50 04             	mov    %edx,0x4(%eax)
c0109ad8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109adc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109adf:	89 50 08             	mov    %edx,0x8(%eax)
c0109ae2:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ae6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ae9:	89 50 40             	mov    %edx,0x40(%eax)
c0109aec:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109af0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109af3:	89 10                	mov    %edx,(%eax)
c0109af5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109af8:	8b 55 08             	mov    0x8(%ebp),%edx
c0109afb:	89 50 30             	mov    %edx,0x30(%eax)
c0109afe:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109b02:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b05:	89 50 38             	mov    %edx,0x38(%eax)
c0109b08:	83 ec 08             	sub    $0x8,%esp
c0109b0b:	6a 01                	push   $0x1
c0109b0d:	68 00 f0 ff bf       	push   $0xbffff000
c0109b12:	e8 08 c6 ff ff       	call   c010611f <alloc_physical_memory>
c0109b17:	83 c4 10             	add    $0x10,%esp
c0109b1a:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109b20:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b23:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109b26:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b29:	83 ec 0c             	sub    $0xc,%esp
c0109b2c:	50                   	push   %eax
c0109b2d:	e8 8f 67 ff ff       	call   c01002c1 <restart>
c0109b32:	83 c4 10             	add    $0x10,%esp
c0109b35:	90                   	nop
c0109b36:	c9                   	leave  
c0109b37:	c3                   	ret    

c0109b38 <clone_pcb>:
c0109b38:	55                   	push   %ebp
c0109b39:	89 e5                	mov    %esp,%ebp
c0109b3b:	83 ec 38             	sub    $0x38,%esp
c0109b3e:	83 ec 08             	sub    $0x8,%esp
c0109b41:	6a 00                	push   $0x0
c0109b43:	6a 01                	push   $0x1
c0109b45:	e8 9d c6 ff ff       	call   c01061e7 <alloc_memory>
c0109b4a:	83 c4 10             	add    $0x10,%esp
c0109b4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109b50:	83 ec 04             	sub    $0x4,%esp
c0109b53:	68 00 10 00 00       	push   $0x1000
c0109b58:	6a 00                	push   $0x0
c0109b5a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b5d:	e8 6d 26 00 00       	call   c010c1cf <Memset>
c0109b62:	83 c4 10             	add    $0x10,%esp
c0109b65:	83 ec 04             	sub    $0x4,%esp
c0109b68:	68 00 10 00 00       	push   $0x1000
c0109b6d:	ff 75 08             	pushl  0x8(%ebp)
c0109b70:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b73:	e8 a4 d1 ff ff       	call   c0106d1c <Memcpy>
c0109b78:	83 c4 10             	add    $0x10,%esp
c0109b7b:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0109b80:	8d 50 01             	lea    0x1(%eax),%edx
c0109b83:	89 15 c8 06 11 c0    	mov    %edx,0xc01106c8
c0109b89:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109b8c:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109b92:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b95:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109b9b:	89 c2                	mov    %eax,%edx
c0109b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ba0:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109ba6:	83 ec 08             	sub    $0x8,%esp
c0109ba9:	6a 00                	push   $0x0
c0109bab:	6a 01                	push   $0x1
c0109bad:	e8 35 c6 ff ff       	call   c01061e7 <alloc_memory>
c0109bb2:	83 c4 10             	add    $0x10,%esp
c0109bb5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109bb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bbb:	05 00 0c 00 00       	add    $0xc00,%eax
c0109bc0:	83 ec 04             	sub    $0x4,%esp
c0109bc3:	68 00 04 00 00       	push   $0x400
c0109bc8:	68 00 fc ff ff       	push   $0xfffffc00
c0109bcd:	50                   	push   %eax
c0109bce:	e8 49 d1 ff ff       	call   c0106d1c <Memcpy>
c0109bd3:	83 c4 10             	add    $0x10,%esp
c0109bd6:	83 ec 0c             	sub    $0xc,%esp
c0109bd9:	ff 75 f0             	pushl  -0x10(%ebp)
c0109bdc:	e8 1d c4 ff ff       	call   c0105ffe <get_physical_address>
c0109be1:	83 c4 10             	add    $0x10,%esp
c0109be4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109be7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bea:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109bef:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109bf2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109bf5:	83 c8 07             	or     $0x7,%eax
c0109bf8:	89 c2                	mov    %eax,%edx
c0109bfa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109bfd:	89 10                	mov    %edx,(%eax)
c0109bff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c02:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109c05:	89 50 08             	mov    %edx,0x8(%eax)
c0109c08:	e8 6e fd ff ff       	call   c010997b <create_user_process_address_space>
c0109c0d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c10:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109c13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c16:	89 50 0c             	mov    %edx,0xc(%eax)
c0109c19:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c1c:	8b 40 0c             	mov    0xc(%eax),%eax
c0109c1f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109c22:	83 ec 04             	sub    $0x4,%esp
c0109c25:	6a 0c                	push   $0xc
c0109c27:	ff 75 e0             	pushl  -0x20(%ebp)
c0109c2a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109c2d:	e8 ea d0 ff ff       	call   c0106d1c <Memcpy>
c0109c32:	83 c4 10             	add    $0x10,%esp
c0109c35:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109c3c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109c3f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109c44:	c1 e8 0c             	shr    $0xc,%eax
c0109c47:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109c4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109c4d:	83 c0 07             	add    $0x7,%eax
c0109c50:	c1 e8 03             	shr    $0x3,%eax
c0109c53:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109c56:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109c59:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109c5c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109c5f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109c64:	c1 e8 0c             	shr    $0xc,%eax
c0109c67:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109c6a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109c6d:	83 ec 08             	sub    $0x8,%esp
c0109c70:	6a 00                	push   $0x0
c0109c72:	50                   	push   %eax
c0109c73:	e8 6f c5 ff ff       	call   c01061e7 <alloc_memory>
c0109c78:	83 c4 10             	add    $0x10,%esp
c0109c7b:	89 c2                	mov    %eax,%edx
c0109c7d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c80:	89 10                	mov    %edx,(%eax)
c0109c82:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109c85:	c1 e0 0c             	shl    $0xc,%eax
c0109c88:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109c8b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c8e:	8b 10                	mov    (%eax),%edx
c0109c90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c93:	8b 00                	mov    (%eax),%eax
c0109c95:	83 ec 04             	sub    $0x4,%esp
c0109c98:	ff 75 cc             	pushl  -0x34(%ebp)
c0109c9b:	52                   	push   %edx
c0109c9c:	50                   	push   %eax
c0109c9d:	e8 7a d0 ff ff       	call   c0106d1c <Memcpy>
c0109ca2:	83 c4 10             	add    $0x10,%esp
c0109ca5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ca8:	c9                   	leave  
c0109ca9:	c3                   	ret    

c0109caa <build_body_stack>:
c0109caa:	55                   	push   %ebp
c0109cab:	89 e5                	mov    %esp,%ebp
c0109cad:	83 ec 48             	sub    $0x48,%esp
c0109cb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109cb3:	8b 40 0c             	mov    0xc(%eax),%eax
c0109cb6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109cb9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cbc:	8b 50 04             	mov    0x4(%eax),%edx
c0109cbf:	8b 00                	mov    (%eax),%eax
c0109cc1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109cc4:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109cc7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109cca:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109ccd:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109cd0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109cd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cd6:	8b 40 08             	mov    0x8(%eax),%eax
c0109cd9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109cdc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109ce3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109cea:	e8 c9 cf ff ff       	call   c0106cb8 <intr_disable>
c0109cef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109cf2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109cf9:	e9 c2 00 00 00       	jmp    c0109dc0 <build_body_stack+0x116>
c0109cfe:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109d01:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d04:	01 d0                	add    %edx,%eax
c0109d06:	0f b6 00             	movzbl (%eax),%eax
c0109d09:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109d0c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109d13:	e9 9a 00 00 00       	jmp    c0109db2 <build_body_stack+0x108>
c0109d18:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109d1c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109d1f:	89 c1                	mov    %eax,%ecx
c0109d21:	d3 fa                	sar    %cl,%edx
c0109d23:	89 d0                	mov    %edx,%eax
c0109d25:	83 e0 01             	and    $0x1,%eax
c0109d28:	85 c0                	test   %eax,%eax
c0109d2a:	75 06                	jne    c0109d32 <build_body_stack+0x88>
c0109d2c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109d30:	eb 7c                	jmp    c0109dae <build_body_stack+0x104>
c0109d32:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d35:	8b 40 08             	mov    0x8(%eax),%eax
c0109d38:	83 ec 0c             	sub    $0xc,%esp
c0109d3b:	50                   	push   %eax
c0109d3c:	e8 91 66 ff ff       	call   c01003d2 <update_cr3>
c0109d41:	83 c4 10             	add    $0x10,%esp
c0109d44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d47:	c1 e0 0c             	shl    $0xc,%eax
c0109d4a:	89 c2                	mov    %eax,%edx
c0109d4c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109d4f:	01 d0                	add    %edx,%eax
c0109d51:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109d54:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109d57:	8b 45 10             	mov    0x10(%ebp),%eax
c0109d5a:	83 ec 04             	sub    $0x4,%esp
c0109d5d:	68 00 10 00 00       	push   $0x1000
c0109d62:	52                   	push   %edx
c0109d63:	50                   	push   %eax
c0109d64:	e8 b3 cf ff ff       	call   c0106d1c <Memcpy>
c0109d69:	83 c4 10             	add    $0x10,%esp
c0109d6c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109d6f:	8b 40 08             	mov    0x8(%eax),%eax
c0109d72:	83 ec 0c             	sub    $0xc,%esp
c0109d75:	50                   	push   %eax
c0109d76:	e8 57 66 ff ff       	call   c01003d2 <update_cr3>
c0109d7b:	83 c4 10             	add    $0x10,%esp
c0109d7e:	83 ec 08             	sub    $0x8,%esp
c0109d81:	ff 75 cc             	pushl  -0x34(%ebp)
c0109d84:	6a 01                	push   $0x1
c0109d86:	e8 be c4 ff ff       	call   c0106249 <get_a_virtual_page>
c0109d8b:	83 c4 10             	add    $0x10,%esp
c0109d8e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109d91:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109d94:	83 ec 04             	sub    $0x4,%esp
c0109d97:	68 00 10 00 00       	push   $0x1000
c0109d9c:	52                   	push   %edx
c0109d9d:	50                   	push   %eax
c0109d9e:	e8 79 cf ff ff       	call   c0106d1c <Memcpy>
c0109da3:	83 c4 10             	add    $0x10,%esp
c0109da6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109daa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109dae:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109db2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109db6:	0f 8e 5c ff ff ff    	jle    c0109d18 <build_body_stack+0x6e>
c0109dbc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109dc0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109dc3:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109dc6:	0f 87 32 ff ff ff    	ja     c0109cfe <build_body_stack+0x54>
c0109dcc:	83 ec 0c             	sub    $0xc,%esp
c0109dcf:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109dd2:	e8 0a cf ff ff       	call   c0106ce1 <intr_set_status>
c0109dd7:	83 c4 10             	add    $0x10,%esp
c0109dda:	90                   	nop
c0109ddb:	c9                   	leave  
c0109ddc:	c3                   	ret    

c0109ddd <build_process_kernel_stack>:
c0109ddd:	55                   	push   %ebp
c0109dde:	89 e5                	mov    %esp,%ebp
c0109de0:	83 ec 28             	sub    $0x28,%esp
c0109de3:	e8 d0 ce ff ff       	call   c0106cb8 <intr_disable>
c0109de8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109deb:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dee:	05 00 10 00 00       	add    $0x1000,%eax
c0109df3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109df6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109df9:	8b 00                	mov    (%eax),%eax
c0109dfb:	83 f8 38             	cmp    $0x38,%eax
c0109dfe:	74 06                	je     c0109e06 <build_process_kernel_stack+0x29>
c0109e00:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109e04:	eb f0                	jmp    c0109df6 <build_process_kernel_stack+0x19>
c0109e06:	90                   	nop
c0109e07:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e0a:	05 00 10 00 00       	add    $0x1000,%eax
c0109e0f:	89 c2                	mov    %eax,%edx
c0109e11:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e14:	89 50 04             	mov    %edx,0x4(%eax)
c0109e17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e1a:	83 c0 2c             	add    $0x2c,%eax
c0109e1d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109e20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e23:	83 e8 04             	sub    $0x4,%eax
c0109e26:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109e29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e2c:	83 e8 08             	sub    $0x8,%eax
c0109e2f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e35:	83 e8 0c             	sub    $0xc,%eax
c0109e38:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109e3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e3e:	83 e8 10             	sub    $0x10,%eax
c0109e41:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109e44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e47:	83 e8 14             	sub    $0x14,%eax
c0109e4a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109e4d:	ba b2 02 10 c0       	mov    $0xc01002b2,%edx
c0109e52:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e55:	89 10                	mov    %edx,(%eax)
c0109e57:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e5a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109e60:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e63:	8b 10                	mov    (%eax),%edx
c0109e65:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e68:	89 10                	mov    %edx,(%eax)
c0109e6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e6d:	8b 10                	mov    (%eax),%edx
c0109e6f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e72:	89 10                	mov    %edx,(%eax)
c0109e74:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e77:	8b 10                	mov    (%eax),%edx
c0109e79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e7c:	89 10                	mov    %edx,(%eax)
c0109e7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e81:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109e87:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e8a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109e8d:	89 10                	mov    %edx,(%eax)
c0109e8f:	83 ec 0c             	sub    $0xc,%esp
c0109e92:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e95:	e8 47 ce ff ff       	call   c0106ce1 <intr_set_status>
c0109e9a:	83 c4 10             	add    $0x10,%esp
c0109e9d:	90                   	nop
c0109e9e:	c9                   	leave  
c0109e9f:	c3                   	ret    

c0109ea0 <fork_process>:
c0109ea0:	55                   	push   %ebp
c0109ea1:	89 e5                	mov    %esp,%ebp
c0109ea3:	83 ec 18             	sub    $0x18,%esp
c0109ea6:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ea9:	83 ec 0c             	sub    $0xc,%esp
c0109eac:	50                   	push   %eax
c0109ead:	e8 b4 99 ff ff       	call   c0103866 <pid2proc>
c0109eb2:	83 c4 10             	add    $0x10,%esp
c0109eb5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109eb8:	83 ec 0c             	sub    $0xc,%esp
c0109ebb:	ff 75 f4             	pushl  -0xc(%ebp)
c0109ebe:	e8 75 fc ff ff       	call   c0109b38 <clone_pcb>
c0109ec3:	83 c4 10             	add    $0x10,%esp
c0109ec6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109ec9:	83 ec 08             	sub    $0x8,%esp
c0109ecc:	6a 00                	push   $0x0
c0109ece:	6a 01                	push   $0x1
c0109ed0:	e8 12 c3 ff ff       	call   c01061e7 <alloc_memory>
c0109ed5:	83 c4 10             	add    $0x10,%esp
c0109ed8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109edb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109ede:	83 ec 04             	sub    $0x4,%esp
c0109ee1:	68 00 10 00 00       	push   $0x1000
c0109ee6:	6a 00                	push   $0x0
c0109ee8:	50                   	push   %eax
c0109ee9:	e8 e1 22 00 00       	call   c010c1cf <Memset>
c0109eee:	83 c4 10             	add    $0x10,%esp
c0109ef1:	83 ec 04             	sub    $0x4,%esp
c0109ef4:	ff 75 ec             	pushl  -0x14(%ebp)
c0109ef7:	ff 75 f0             	pushl  -0x10(%ebp)
c0109efa:	ff 75 f4             	pushl  -0xc(%ebp)
c0109efd:	e8 a8 fd ff ff       	call   c0109caa <build_body_stack>
c0109f02:	83 c4 10             	add    $0x10,%esp
c0109f05:	83 ec 0c             	sub    $0xc,%esp
c0109f08:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f0b:	e8 cd fe ff ff       	call   c0109ddd <build_process_kernel_stack>
c0109f10:	83 c4 10             	add    $0x10,%esp
c0109f13:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f16:	05 6a 02 00 00       	add    $0x26a,%eax
c0109f1b:	83 ec 08             	sub    $0x8,%esp
c0109f1e:	50                   	push   %eax
c0109f1f:	68 04 0f 11 c0       	push   $0xc0110f04
c0109f24:	e8 c7 02 00 00       	call   c010a1f0 <appendToDoubleLinkList>
c0109f29:	83 c4 10             	add    $0x10,%esp
c0109f2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f2f:	c9                   	leave  
c0109f30:	c3                   	ret    

c0109f31 <process_execute>:
c0109f31:	55                   	push   %ebp
c0109f32:	89 e5                	mov    %esp,%ebp
c0109f34:	83 ec 28             	sub    $0x28,%esp
c0109f37:	e8 ca 04 00 00       	call   c010a406 <thread_init>
c0109f3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109f3f:	83 ec 0c             	sub    $0xc,%esp
c0109f42:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f45:	e8 69 05 00 00       	call   c010a4b3 <thread_create>
c0109f4a:	83 c4 10             	add    $0x10,%esp
c0109f4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f50:	05 28 01 00 00       	add    $0x128,%eax
c0109f55:	83 ec 08             	sub    $0x8,%esp
c0109f58:	ff 75 10             	pushl  0x10(%ebp)
c0109f5b:	50                   	push   %eax
c0109f5c:	e8 8d 22 00 00       	call   c010c1ee <Strcpy>
c0109f61:	83 c4 10             	add    $0x10,%esp
c0109f64:	83 ec 08             	sub    $0x8,%esp
c0109f67:	6a 00                	push   $0x0
c0109f69:	6a 01                	push   $0x1
c0109f6b:	e8 77 c2 ff ff       	call   c01061e7 <alloc_memory>
c0109f70:	83 c4 10             	add    $0x10,%esp
c0109f73:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109f76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f79:	05 00 0c 00 00       	add    $0xc00,%eax
c0109f7e:	83 ec 04             	sub    $0x4,%esp
c0109f81:	68 00 04 00 00       	push   $0x400
c0109f86:	68 00 fc ff ff       	push   $0xfffffc00
c0109f8b:	50                   	push   %eax
c0109f8c:	e8 8b cd ff ff       	call   c0106d1c <Memcpy>
c0109f91:	83 c4 10             	add    $0x10,%esp
c0109f94:	83 ec 0c             	sub    $0xc,%esp
c0109f97:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f9a:	e8 5f c0 ff ff       	call   c0105ffe <get_physical_address>
c0109f9f:	83 c4 10             	add    $0x10,%esp
c0109fa2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109fa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109fa8:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109fad:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109fb0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109fb3:	83 c8 07             	or     $0x7,%eax
c0109fb6:	89 c2                	mov    %eax,%edx
c0109fb8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109fbb:	89 10                	mov    %edx,(%eax)
c0109fbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fc0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109fc3:	89 50 08             	mov    %edx,0x8(%eax)
c0109fc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fc9:	83 c0 10             	add    $0x10,%eax
c0109fcc:	83 ec 0c             	sub    $0xc,%esp
c0109fcf:	50                   	push   %eax
c0109fd0:	e8 c8 c7 ff ff       	call   c010679d <init_memory_block_desc>
c0109fd5:	83 c4 10             	add    $0x10,%esp
c0109fd8:	e8 9e f9 ff ff       	call   c010997b <create_user_process_address_space>
c0109fdd:	89 c2                	mov    %eax,%edx
c0109fdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fe2:	89 50 0c             	mov    %edx,0xc(%eax)
c0109fe5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fe8:	8b 00                	mov    (%eax),%eax
c0109fea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109fed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ff0:	c7 40 10 0b 9a 10 c0 	movl   $0xc0109a0b,0x10(%eax)
c0109ff7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ffa:	8b 55 08             	mov    0x8(%ebp),%edx
c0109ffd:	89 50 18             	mov    %edx,0x18(%eax)
c010a000:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a003:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a006:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a009:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a00c:	8b 55 14             	mov    0x14(%ebp),%edx
c010a00f:	89 50 20             	mov    %edx,0x20(%eax)
c010a012:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a015:	8b 55 18             	mov    0x18(%ebp),%edx
c010a018:	89 50 24             	mov    %edx,0x24(%eax)
c010a01b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010a01e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a021:	89 50 28             	mov    %edx,0x28(%eax)
c010a024:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a027:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a02d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a030:	8b 10                	mov    (%eax),%edx
c010a032:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a035:	89 50 04             	mov    %edx,0x4(%eax)
c010a038:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a03b:	8b 50 04             	mov    0x4(%eax),%edx
c010a03e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a041:	89 50 08             	mov    %edx,0x8(%eax)
c010a044:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a047:	8b 50 08             	mov    0x8(%eax),%edx
c010a04a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a04d:	89 50 0c             	mov    %edx,0xc(%eax)
c010a050:	83 ec 0c             	sub    $0xc,%esp
c010a053:	68 ec fd 10 c0       	push   $0xc010fdec
c010a058:	e8 96 00 00 00       	call   c010a0f3 <isListEmpty>
c010a05d:	83 c4 10             	add    $0x10,%esp
c010a060:	e8 53 cc ff ff       	call   c0106cb8 <intr_disable>
c010a065:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a068:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a06b:	05 60 02 00 00       	add    $0x260,%eax
c010a070:	83 ec 08             	sub    $0x8,%esp
c010a073:	50                   	push   %eax
c010a074:	68 ec fd 10 c0       	push   $0xc010fdec
c010a079:	e8 72 01 00 00       	call   c010a1f0 <appendToDoubleLinkList>
c010a07e:	83 c4 10             	add    $0x10,%esp
c010a081:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a084:	05 6a 02 00 00       	add    $0x26a,%eax
c010a089:	83 ec 08             	sub    $0x8,%esp
c010a08c:	50                   	push   %eax
c010a08d:	68 04 0f 11 c0       	push   $0xc0110f04
c010a092:	e8 59 01 00 00       	call   c010a1f0 <appendToDoubleLinkList>
c010a097:	83 c4 10             	add    $0x10,%esp
c010a09a:	83 ec 0c             	sub    $0xc,%esp
c010a09d:	ff 75 e0             	pushl  -0x20(%ebp)
c010a0a0:	e8 3c cc ff ff       	call   c0106ce1 <intr_set_status>
c010a0a5:	83 c4 10             	add    $0x10,%esp
c010a0a8:	90                   	nop
c010a0a9:	c9                   	leave  
c010a0aa:	c3                   	ret    
c010a0ab:	66 90                	xchg   %ax,%ax
c010a0ad:	66 90                	xchg   %ax,%ax
c010a0af:	90                   	nop

c010a0b0 <switch_to>:
c010a0b0:	56                   	push   %esi
c010a0b1:	57                   	push   %edi
c010a0b2:	53                   	push   %ebx
c010a0b3:	55                   	push   %ebp
c010a0b4:	89 e5                	mov    %esp,%ebp
c010a0b6:	8b 45 14             	mov    0x14(%ebp),%eax
c010a0b9:	89 20                	mov    %esp,(%eax)
c010a0bb:	8b 45 18             	mov    0x18(%ebp),%eax
c010a0be:	8b 20                	mov    (%eax),%esp
c010a0c0:	5d                   	pop    %ebp
c010a0c1:	5b                   	pop    %ebx
c010a0c2:	5f                   	pop    %edi
c010a0c3:	5e                   	pop    %esi
c010a0c4:	c3                   	ret    

c010a0c5 <initDoubleLinkList>:
c010a0c5:	55                   	push   %ebp
c010a0c6:	89 e5                	mov    %esp,%ebp
c010a0c8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0cb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a0d1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0d4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a0db:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0de:	8d 50 08             	lea    0x8(%eax),%edx
c010a0e1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0e4:	89 50 04             	mov    %edx,0x4(%eax)
c010a0e7:	8b 55 08             	mov    0x8(%ebp),%edx
c010a0ea:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0ed:	89 50 08             	mov    %edx,0x8(%eax)
c010a0f0:	90                   	nop
c010a0f1:	5d                   	pop    %ebp
c010a0f2:	c3                   	ret    

c010a0f3 <isListEmpty>:
c010a0f3:	55                   	push   %ebp
c010a0f4:	89 e5                	mov    %esp,%ebp
c010a0f6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0f9:	8b 40 04             	mov    0x4(%eax),%eax
c010a0fc:	8b 55 08             	mov    0x8(%ebp),%edx
c010a0ff:	83 c2 08             	add    $0x8,%edx
c010a102:	39 d0                	cmp    %edx,%eax
c010a104:	75 07                	jne    c010a10d <isListEmpty+0x1a>
c010a106:	b8 01 00 00 00       	mov    $0x1,%eax
c010a10b:	eb 05                	jmp    c010a112 <isListEmpty+0x1f>
c010a10d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a112:	5d                   	pop    %ebp
c010a113:	c3                   	ret    

c010a114 <findElementInList>:
c010a114:	55                   	push   %ebp
c010a115:	89 e5                	mov    %esp,%ebp
c010a117:	83 ec 28             	sub    $0x28,%esp
c010a11a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a11e:	75 19                	jne    c010a139 <findElementInList+0x25>
c010a120:	6a 60                	push   $0x60
c010a122:	68 75 c1 10 c0       	push   $0xc010c175
c010a127:	68 75 c1 10 c0       	push   $0xc010c175
c010a12c:	68 88 c1 10 c0       	push   $0xc010c188
c010a131:	e8 ff e7 ff ff       	call   c0108935 <assertion_failure>
c010a136:	83 c4 10             	add    $0x10,%esp
c010a139:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a13d:	75 19                	jne    c010a158 <findElementInList+0x44>
c010a13f:	6a 61                	push   $0x61
c010a141:	68 75 c1 10 c0       	push   $0xc010c175
c010a146:	68 75 c1 10 c0       	push   $0xc010c175
c010a14b:	68 94 c1 10 c0       	push   $0xc010c194
c010a150:	e8 e0 e7 ff ff       	call   c0108935 <assertion_failure>
c010a155:	83 c4 10             	add    $0x10,%esp
c010a158:	e8 5b cb ff ff       	call   c0106cb8 <intr_disable>
c010a15d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a160:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a167:	8b 45 08             	mov    0x8(%ebp),%eax
c010a16a:	8b 40 08             	mov    0x8(%eax),%eax
c010a16d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a170:	8b 45 08             	mov    0x8(%ebp),%eax
c010a173:	8b 40 04             	mov    0x4(%eax),%eax
c010a176:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a179:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a17d:	75 07                	jne    c010a186 <findElementInList+0x72>
c010a17f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a184:	eb 68                	jmp    c010a1ee <findElementInList+0xda>
c010a186:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a189:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a18c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a18f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a192:	c1 f8 03             	sar    $0x3,%eax
c010a195:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a198:	eb 36                	jmp    c010a1d0 <findElementInList+0xbc>
c010a19a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a19d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a1a0:	75 07                	jne    c010a1a9 <findElementInList+0x95>
c010a1a2:	b8 01 00 00 00       	mov    $0x1,%eax
c010a1a7:	eb 45                	jmp    c010a1ee <findElementInList+0xda>
c010a1a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a1ad:	75 07                	jne    c010a1b6 <findElementInList+0xa2>
c010a1af:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1b4:	eb 38                	jmp    c010a1ee <findElementInList+0xda>
c010a1b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1b9:	8b 40 04             	mov    0x4(%eax),%eax
c010a1bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a1bf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a1c3:	75 07                	jne    c010a1cc <findElementInList+0xb8>
c010a1c5:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1ca:	eb 22                	jmp    c010a1ee <findElementInList+0xda>
c010a1cc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a1d0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1d3:	83 c0 08             	add    $0x8,%eax
c010a1d6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a1d9:	75 bf                	jne    c010a19a <findElementInList+0x86>
c010a1db:	83 ec 0c             	sub    $0xc,%esp
c010a1de:	ff 75 ec             	pushl  -0x14(%ebp)
c010a1e1:	e8 fb ca ff ff       	call   c0106ce1 <intr_set_status>
c010a1e6:	83 c4 10             	add    $0x10,%esp
c010a1e9:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1ee:	c9                   	leave  
c010a1ef:	c3                   	ret    

c010a1f0 <appendToDoubleLinkList>:
c010a1f0:	55                   	push   %ebp
c010a1f1:	89 e5                	mov    %esp,%ebp
c010a1f3:	83 ec 18             	sub    $0x18,%esp
c010a1f6:	83 ec 08             	sub    $0x8,%esp
c010a1f9:	ff 75 0c             	pushl  0xc(%ebp)
c010a1fc:	ff 75 08             	pushl  0x8(%ebp)
c010a1ff:	e8 10 ff ff ff       	call   c010a114 <findElementInList>
c010a204:	83 c4 10             	add    $0x10,%esp
c010a207:	3c 01                	cmp    $0x1,%al
c010a209:	0f 84 c2 00 00 00    	je     c010a2d1 <appendToDoubleLinkList+0xe1>
c010a20f:	e8 a4 ca ff ff       	call   c0106cb8 <intr_disable>
c010a214:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a217:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a21b:	75 1c                	jne    c010a239 <appendToDoubleLinkList+0x49>
c010a21d:	68 9e 00 00 00       	push   $0x9e
c010a222:	68 75 c1 10 c0       	push   $0xc010c175
c010a227:	68 75 c1 10 c0       	push   $0xc010c175
c010a22c:	68 88 c1 10 c0       	push   $0xc010c188
c010a231:	e8 ff e6 ff ff       	call   c0108935 <assertion_failure>
c010a236:	83 c4 10             	add    $0x10,%esp
c010a239:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a23d:	75 1c                	jne    c010a25b <appendToDoubleLinkList+0x6b>
c010a23f:	68 9f 00 00 00       	push   $0x9f
c010a244:	68 75 c1 10 c0       	push   $0xc010c175
c010a249:	68 75 c1 10 c0       	push   $0xc010c175
c010a24e:	68 94 c1 10 c0       	push   $0xc010c194
c010a253:	e8 dd e6 ff ff       	call   c0108935 <assertion_failure>
c010a258:	83 c4 10             	add    $0x10,%esp
c010a25b:	83 ec 08             	sub    $0x8,%esp
c010a25e:	ff 75 0c             	pushl  0xc(%ebp)
c010a261:	ff 75 08             	pushl  0x8(%ebp)
c010a264:	e8 ab fe ff ff       	call   c010a114 <findElementInList>
c010a269:	83 c4 10             	add    $0x10,%esp
c010a26c:	3c 01                	cmp    $0x1,%al
c010a26e:	74 64                	je     c010a2d4 <appendToDoubleLinkList+0xe4>
c010a270:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a273:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a276:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a279:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a280:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a283:	8b 50 04             	mov    0x4(%eax),%edx
c010a286:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a289:	89 10                	mov    %edx,(%eax)
c010a28b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a28e:	8b 50 08             	mov    0x8(%eax),%edx
c010a291:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a294:	89 10                	mov    %edx,(%eax)
c010a296:	8b 45 08             	mov    0x8(%ebp),%eax
c010a299:	8b 40 08             	mov    0x8(%eax),%eax
c010a29c:	85 c0                	test   %eax,%eax
c010a29e:	74 0c                	je     c010a2ac <appendToDoubleLinkList+0xbc>
c010a2a0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2a3:	8b 40 08             	mov    0x8(%eax),%eax
c010a2a6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a2a9:	89 50 04             	mov    %edx,0x4(%eax)
c010a2ac:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2af:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a2b2:	89 50 08             	mov    %edx,0x8(%eax)
c010a2b5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2b8:	8d 50 08             	lea    0x8(%eax),%edx
c010a2bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2be:	89 50 04             	mov    %edx,0x4(%eax)
c010a2c1:	83 ec 0c             	sub    $0xc,%esp
c010a2c4:	ff 75 f4             	pushl  -0xc(%ebp)
c010a2c7:	e8 15 ca ff ff       	call   c0106ce1 <intr_set_status>
c010a2cc:	83 c4 10             	add    $0x10,%esp
c010a2cf:	eb 04                	jmp    c010a2d5 <appendToDoubleLinkList+0xe5>
c010a2d1:	90                   	nop
c010a2d2:	eb 01                	jmp    c010a2d5 <appendToDoubleLinkList+0xe5>
c010a2d4:	90                   	nop
c010a2d5:	c9                   	leave  
c010a2d6:	c3                   	ret    

c010a2d7 <insertToDoubleLinkList>:
c010a2d7:	55                   	push   %ebp
c010a2d8:	89 e5                	mov    %esp,%ebp
c010a2da:	83 ec 18             	sub    $0x18,%esp
c010a2dd:	83 ec 08             	sub    $0x8,%esp
c010a2e0:	ff 75 0c             	pushl  0xc(%ebp)
c010a2e3:	ff 75 08             	pushl  0x8(%ebp)
c010a2e6:	e8 29 fe ff ff       	call   c010a114 <findElementInList>
c010a2eb:	83 c4 10             	add    $0x10,%esp
c010a2ee:	3c 01                	cmp    $0x1,%al
c010a2f0:	74 65                	je     c010a357 <insertToDoubleLinkList+0x80>
c010a2f2:	e8 c1 c9 ff ff       	call   c0106cb8 <intr_disable>
c010a2f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a2fa:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a2fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a300:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a303:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a30a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a30d:	8b 50 04             	mov    0x4(%eax),%edx
c010a310:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a313:	89 10                	mov    %edx,(%eax)
c010a315:	8b 45 08             	mov    0x8(%ebp),%eax
c010a318:	8b 50 04             	mov    0x4(%eax),%edx
c010a31b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a31e:	89 50 04             	mov    %edx,0x4(%eax)
c010a321:	8b 45 08             	mov    0x8(%ebp),%eax
c010a324:	8b 40 04             	mov    0x4(%eax),%eax
c010a327:	85 c0                	test   %eax,%eax
c010a329:	74 0b                	je     c010a336 <insertToDoubleLinkList+0x5f>
c010a32b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a32e:	8b 40 04             	mov    0x4(%eax),%eax
c010a331:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a334:	89 10                	mov    %edx,(%eax)
c010a336:	8b 45 08             	mov    0x8(%ebp),%eax
c010a339:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a33c:	89 50 04             	mov    %edx,0x4(%eax)
c010a33f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a342:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a345:	89 10                	mov    %edx,(%eax)
c010a347:	83 ec 0c             	sub    $0xc,%esp
c010a34a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a34d:	e8 8f c9 ff ff       	call   c0106ce1 <intr_set_status>
c010a352:	83 c4 10             	add    $0x10,%esp
c010a355:	eb 01                	jmp    c010a358 <insertToDoubleLinkList+0x81>
c010a357:	90                   	nop
c010a358:	c9                   	leave  
c010a359:	c3                   	ret    

c010a35a <popFromDoubleLinkList>:
c010a35a:	55                   	push   %ebp
c010a35b:	89 e5                	mov    %esp,%ebp
c010a35d:	83 ec 18             	sub    $0x18,%esp
c010a360:	e8 53 c9 ff ff       	call   c0106cb8 <intr_disable>
c010a365:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a368:	83 ec 0c             	sub    $0xc,%esp
c010a36b:	ff 75 08             	pushl  0x8(%ebp)
c010a36e:	e8 80 fd ff ff       	call   c010a0f3 <isListEmpty>
c010a373:	83 c4 10             	add    $0x10,%esp
c010a376:	3c 01                	cmp    $0x1,%al
c010a378:	75 07                	jne    c010a381 <popFromDoubleLinkList+0x27>
c010a37a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a37f:	eb 6b                	jmp    c010a3ec <popFromDoubleLinkList+0x92>
c010a381:	8b 45 08             	mov    0x8(%ebp),%eax
c010a384:	8b 40 08             	mov    0x8(%eax),%eax
c010a387:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a38a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a38d:	8b 40 08             	mov    0x8(%eax),%eax
c010a390:	85 c0                	test   %eax,%eax
c010a392:	75 07                	jne    c010a39b <popFromDoubleLinkList+0x41>
c010a394:	b8 00 00 00 00       	mov    $0x0,%eax
c010a399:	eb 51                	jmp    c010a3ec <popFromDoubleLinkList+0x92>
c010a39b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a39e:	8b 40 08             	mov    0x8(%eax),%eax
c010a3a1:	8b 00                	mov    (%eax),%eax
c010a3a3:	85 c0                	test   %eax,%eax
c010a3a5:	74 11                	je     c010a3b8 <popFromDoubleLinkList+0x5e>
c010a3a7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3aa:	8b 40 08             	mov    0x8(%eax),%eax
c010a3ad:	8b 00                	mov    (%eax),%eax
c010a3af:	8b 55 08             	mov    0x8(%ebp),%edx
c010a3b2:	83 c2 08             	add    $0x8,%edx
c010a3b5:	89 50 04             	mov    %edx,0x4(%eax)
c010a3b8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3bb:	8b 40 08             	mov    0x8(%eax),%eax
c010a3be:	8b 10                	mov    (%eax),%edx
c010a3c0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3c3:	89 50 08             	mov    %edx,0x8(%eax)
c010a3c6:	83 ec 0c             	sub    $0xc,%esp
c010a3c9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a3cc:	e8 10 c9 ff ff       	call   c0106ce1 <intr_set_status>
c010a3d1:	83 c4 10             	add    $0x10,%esp
c010a3d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3d7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a3de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3e1:	8b 50 04             	mov    0x4(%eax),%edx
c010a3e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3e7:	89 10                	mov    %edx,(%eax)
c010a3e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3ec:	c9                   	leave  
c010a3ed:	c3                   	ret    

c010a3ee <kernel_thread>:
c010a3ee:	55                   	push   %ebp
c010a3ef:	89 e5                	mov    %esp,%ebp
c010a3f1:	83 ec 08             	sub    $0x8,%esp
c010a3f4:	fb                   	sti    
c010a3f5:	83 ec 0c             	sub    $0xc,%esp
c010a3f8:	ff 75 0c             	pushl  0xc(%ebp)
c010a3fb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3fe:	ff d0                	call   *%eax
c010a400:	83 c4 10             	add    $0x10,%esp
c010a403:	90                   	nop
c010a404:	c9                   	leave  
c010a405:	c3                   	ret    

c010a406 <thread_init>:
c010a406:	55                   	push   %ebp
c010a407:	89 e5                	mov    %esp,%ebp
c010a409:	83 ec 18             	sub    $0x18,%esp
c010a40c:	83 ec 08             	sub    $0x8,%esp
c010a40f:	6a 00                	push   $0x0
c010a411:	6a 01                	push   $0x1
c010a413:	e8 cf bd ff ff       	call   c01061e7 <alloc_memory>
c010a418:	83 c4 10             	add    $0x10,%esp
c010a41b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a41e:	83 ec 04             	sub    $0x4,%esp
c010a421:	68 00 10 00 00       	push   $0x1000
c010a426:	6a 00                	push   $0x0
c010a428:	ff 75 f4             	pushl  -0xc(%ebp)
c010a42b:	e8 9f 1d 00 00       	call   c010c1cf <Memset>
c010a430:	83 c4 10             	add    $0x10,%esp
c010a433:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a436:	05 00 10 00 00       	add    $0x1000,%eax
c010a43b:	89 c2                	mov    %eax,%edx
c010a43d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a440:	89 10                	mov    %edx,(%eax)
c010a442:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a445:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a44c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a44f:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a456:	ff ff ff 
c010a459:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a45c:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a463:	00 00 00 
c010a466:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a469:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a46f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a472:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a478:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a47d:	83 c0 01             	add    $0x1,%eax
c010a480:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a485:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a48b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a48e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a494:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a497:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a49e:	00 00 00 
c010a4a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4a4:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a4ab:	cd ab 99 
c010a4ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4b1:	c9                   	leave  
c010a4b2:	c3                   	ret    

c010a4b3 <thread_create>:
c010a4b3:	55                   	push   %ebp
c010a4b4:	89 e5                	mov    %esp,%ebp
c010a4b6:	83 ec 10             	sub    $0x10,%esp
c010a4b9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a4c0:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a4c7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4ca:	8b 00                	mov    (%eax),%eax
c010a4cc:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a4cf:	89 c2                	mov    %eax,%edx
c010a4d1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4d4:	89 10                	mov    %edx,(%eax)
c010a4d6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4d9:	8b 00                	mov    (%eax),%eax
c010a4db:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a4de:	89 c2                	mov    %eax,%edx
c010a4e0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4e3:	89 10                	mov    %edx,(%eax)
c010a4e5:	90                   	nop
c010a4e6:	c9                   	leave  
c010a4e7:	c3                   	ret    

c010a4e8 <thread_start>:
c010a4e8:	55                   	push   %ebp
c010a4e9:	89 e5                	mov    %esp,%ebp
c010a4eb:	83 ec 18             	sub    $0x18,%esp
c010a4ee:	e8 13 ff ff ff       	call   c010a406 <thread_init>
c010a4f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a4f6:	83 ec 0c             	sub    $0xc,%esp
c010a4f9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a4fc:	e8 b2 ff ff ff       	call   c010a4b3 <thread_create>
c010a501:	83 c4 10             	add    $0x10,%esp
c010a504:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a507:	05 28 01 00 00       	add    $0x128,%eax
c010a50c:	83 ec 08             	sub    $0x8,%esp
c010a50f:	ff 75 10             	pushl  0x10(%ebp)
c010a512:	50                   	push   %eax
c010a513:	e8 d6 1c 00 00       	call   c010c1ee <Strcpy>
c010a518:	83 c4 10             	add    $0x10,%esp
c010a51b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a51e:	8b 00                	mov    (%eax),%eax
c010a520:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a523:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a526:	c7 40 10 ee a3 10 c0 	movl   $0xc010a3ee,0x10(%eax)
c010a52d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a530:	8b 55 08             	mov    0x8(%ebp),%edx
c010a533:	89 50 18             	mov    %edx,0x18(%eax)
c010a536:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a539:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a53c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a53f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a542:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a548:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a54b:	8b 10                	mov    (%eax),%edx
c010a54d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a550:	89 50 04             	mov    %edx,0x4(%eax)
c010a553:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a556:	8b 50 04             	mov    0x4(%eax),%edx
c010a559:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a55c:	89 50 08             	mov    %edx,0x8(%eax)
c010a55f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a562:	8b 50 08             	mov    0x8(%eax),%edx
c010a565:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a568:	89 50 0c             	mov    %edx,0xc(%eax)
c010a56b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a56e:	05 60 02 00 00       	add    $0x260,%eax
c010a573:	83 ec 08             	sub    $0x8,%esp
c010a576:	50                   	push   %eax
c010a577:	68 ec fd 10 c0       	push   $0xc010fdec
c010a57c:	e8 6f fc ff ff       	call   c010a1f0 <appendToDoubleLinkList>
c010a581:	83 c4 10             	add    $0x10,%esp
c010a584:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a587:	05 6a 02 00 00       	add    $0x26a,%eax
c010a58c:	83 ec 08             	sub    $0x8,%esp
c010a58f:	50                   	push   %eax
c010a590:	68 04 0f 11 c0       	push   $0xc0110f04
c010a595:	e8 56 fc ff ff       	call   c010a1f0 <appendToDoubleLinkList>
c010a59a:	83 c4 10             	add    $0x10,%esp
c010a59d:	90                   	nop
c010a59e:	c9                   	leave  
c010a59f:	c3                   	ret    

c010a5a0 <Buf>:
	...

c010a5b6 <My_Buf>:
c010a5b6:	48                   	dec    %eax
c010a5b7:	65 6c                	gs insb (%dx),%es:(%edi)
c010a5b9:	6c                   	insb   (%dx),%es:(%edi)
c010a5ba:	6f                   	outsl  %ds:(%esi),(%dx)
c010a5bb:	2c 57                	sub    $0x57,%al
c010a5bd:	6f                   	outsl  %ds:(%esi),(%dx)
c010a5be:	72 6c                	jb     c010a62c <DriverInitialize+0x69>
c010a5c0:	64 5c                	fs pop %esp
c010a5c2:	30                   	.byte 0x30

c010a5c3 <DriverInitialize>:
c010a5c3:	66 87 db             	xchg   %bx,%bx
c010a5c6:	56                   	push   %esi
c010a5c7:	57                   	push   %edi
c010a5c8:	53                   	push   %ebx
c010a5c9:	55                   	push   %ebp
c010a5ca:	51                   	push   %ecx
c010a5cb:	89 e5                	mov    %esp,%ebp
c010a5cd:	b0 21                	mov    $0x21,%al
c010a5cf:	66 ba 00 03          	mov    $0x300,%dx
c010a5d3:	ee                   	out    %al,(%dx)
c010a5d4:	b0 59                	mov    $0x59,%al
c010a5d6:	66 ba 0e 03          	mov    $0x30e,%dx
c010a5da:	ee                   	out    %al,(%dx)
c010a5db:	66 ba 0a 03          	mov    $0x30a,%dx
c010a5df:	30 c0                	xor    %al,%al
c010a5e1:	ee                   	out    %al,(%dx)
c010a5e2:	66 ba 0b 03          	mov    $0x30b,%dx
c010a5e6:	ee                   	out    %al,(%dx)
c010a5e7:	b0 00                	mov    $0x0,%al
c010a5e9:	66 ba 0c 03          	mov    $0x30c,%dx
c010a5ed:	ee                   	out    %al,(%dx)
c010a5ee:	b0 20                	mov    $0x20,%al
c010a5f0:	66 ba 04 03          	mov    $0x304,%dx
c010a5f4:	ee                   	out    %al,(%dx)
c010a5f5:	b0 02                	mov    $0x2,%al
c010a5f7:	66 ba 0d 03          	mov    $0x30d,%dx
c010a5fb:	ee                   	out    %al,(%dx)
c010a5fc:	b0 26                	mov    $0x26,%al
c010a5fe:	66 ba 01 03          	mov    $0x301,%dx
c010a602:	ee                   	out    %al,(%dx)
c010a603:	66 ba 03 03          	mov    $0x303,%dx
c010a607:	ee                   	out    %al,(%dx)
c010a608:	b0 40                	mov    $0x40,%al
c010a60a:	66 ba 02 03          	mov    $0x302,%dx
c010a60e:	ee                   	out    %al,(%dx)
c010a60f:	b0 61                	mov    $0x61,%al
c010a611:	66 ba 00 03          	mov    $0x300,%dx
c010a615:	ee                   	out    %al,(%dx)
c010a616:	b0 26                	mov    $0x26,%al
c010a618:	66 ba 07 03          	mov    $0x307,%dx
c010a61c:	ee                   	out    %al,(%dx)
c010a61d:	b0 22                	mov    $0x22,%al
c010a61f:	66 ba 00 03          	mov    $0x300,%dx
c010a623:	ee                   	out    %al,(%dx)
c010a624:	b0 ff                	mov    $0xff,%al
c010a626:	66 ba 07 03          	mov    $0x307,%dx
c010a62a:	ee                   	out    %al,(%dx)
c010a62b:	b0 fb                	mov    $0xfb,%al
c010a62d:	66 87 db             	xchg   %bx,%bx
c010a630:	66 ba 0f 03          	mov    $0x30f,%dx
c010a634:	ee                   	out    %al,(%dx)
c010a635:	66 ba 0d 03          	mov    $0x30d,%dx
c010a639:	b0 00                	mov    $0x0,%al
c010a63b:	ee                   	out    %al,(%dx)
c010a63c:	89 ec                	mov    %ebp,%esp
c010a63e:	59                   	pop    %ecx
c010a63f:	5d                   	pop    %ebp
c010a640:	5b                   	pop    %ebx
c010a641:	5f                   	pop    %edi
c010a642:	5e                   	pop    %esi
c010a643:	c3                   	ret    

c010a644 <DriverSend>:
c010a644:	56                   	push   %esi
c010a645:	57                   	push   %edi
c010a646:	53                   	push   %ebx
c010a647:	55                   	push   %ebp
c010a648:	51                   	push   %ecx
c010a649:	89 e5                	mov    %esp,%ebp
c010a64b:	66 ba 00 03          	mov    $0x300,%dx
c010a64f:	ec                   	in     (%dx),%al
c010a650:	3c 26                	cmp    $0x26,%al
c010a652:	74 44                	je     c010a698 <QueueIt>
c010a654:	66 51                	push   %cx
c010a656:	24 3f                	and    $0x3f,%al
c010a658:	ee                   	out    %al,(%dx)
c010a659:	66 ba 08 03          	mov    $0x308,%dx
c010a65d:	66 b8 00 40          	mov    $0x4000,%ax
c010a661:	ee                   	out    %al,(%dx)
c010a662:	66 ba 09 03          	mov    $0x309,%dx
c010a666:	88 e0                	mov    %ah,%al
c010a668:	ee                   	out    %al,(%dx)
c010a669:	b4 40                	mov    $0x40,%ah
c010a66b:	30 c0                	xor    %al,%al
c010a66d:	ff 75 18             	pushl  0x18(%ebp)
c010a670:	e8 34 00 00 00       	call   c010a6a9 <PCtoNIC>
c010a675:	83 c4 04             	add    $0x4,%esp
c010a678:	66 ba 04 03          	mov    $0x304,%dx
c010a67c:	b0 40                	mov    $0x40,%al
c010a67e:	ee                   	out    %al,(%dx)
c010a67f:	66 59                	pop    %cx
c010a681:	66 ba 05 03          	mov    $0x305,%dx
c010a685:	88 c8                	mov    %cl,%al
c010a687:	ee                   	out    %al,(%dx)
c010a688:	66 ba 06 03          	mov    $0x306,%dx
c010a68c:	88 e8                	mov    %ch,%al
c010a68e:	ee                   	out    %al,(%dx)
c010a68f:	66 ba 00 03          	mov    $0x300,%dx
c010a693:	b0 26                	mov    $0x26,%al
c010a695:	ee                   	out    %al,(%dx)
c010a696:	eb 01                	jmp    c010a699 <Finished>

c010a698 <QueueIt>:
c010a698:	90                   	nop

c010a699 <Finished>:
c010a699:	89 ec                	mov    %ebp,%esp
c010a69b:	59                   	pop    %ecx
c010a69c:	5d                   	pop    %ebp
c010a69d:	5b                   	pop    %ebx
c010a69e:	5f                   	pop    %edi
c010a69f:	5e                   	pop    %esi
c010a6a0:	c3                   	ret    

c010a6a1 <MyEnd>:
c010a6a1:	89 ec                	mov    %ebp,%esp
c010a6a3:	59                   	pop    %ecx
c010a6a4:	5d                   	pop    %ebp
c010a6a5:	5b                   	pop    %ebx
c010a6a6:	5f                   	pop    %edi
c010a6a7:	5e                   	pop    %esi
c010a6a8:	c3                   	ret    

c010a6a9 <PCtoNIC>:
c010a6a9:	56                   	push   %esi
c010a6aa:	57                   	push   %edi
c010a6ab:	53                   	push   %ebx
c010a6ac:	55                   	push   %ebp
c010a6ad:	51                   	push   %ecx
c010a6ae:	89 e5                	mov    %esp,%ebp
c010a6b0:	66 bb 16 00          	mov    $0x16,%bx
c010a6b4:	66 ba 0a 03          	mov    $0x30a,%dx
c010a6b8:	88 d8                	mov    %bl,%al
c010a6ba:	ee                   	out    %al,(%dx)
c010a6bb:	66 ba 0b 03          	mov    $0x30b,%dx
c010a6bf:	88 f8                	mov    %bh,%al
c010a6c1:	ee                   	out    %al,(%dx)
c010a6c2:	66 ba 00 03          	mov    $0x300,%dx
c010a6c6:	b0 12                	mov    $0x12,%al
c010a6c8:	ee                   	out    %al,(%dx)
c010a6c9:	66 ba 10 03          	mov    $0x310,%dx
c010a6cd:	66 b9 16 00          	mov    $0x16,%cx
c010a6d1:	66 d1 e9             	shr    %cx
c010a6d4:	66 b8 59 00          	mov    $0x59,%ax
c010a6d8:	31 f6                	xor    %esi,%esi
c010a6da:	8b 74 24 18          	mov    0x18(%esp),%esi
c010a6de:	66 ba 08 03          	mov    $0x308,%dx
c010a6e2:	66 b8 00 40          	mov    $0x4000,%ax
c010a6e6:	ee                   	out    %al,(%dx)
c010a6e7:	88 e0                	mov    %ah,%al
c010a6e9:	ee                   	out    %al,(%dx)
c010a6ea:	66 ba 10 03          	mov    $0x310,%dx
c010a6ee:	66 87 db             	xchg   %bx,%bx

c010a6f1 <Writing_Word>:
c010a6f1:	66 31 c0             	xor    %ax,%ax
c010a6f4:	66 ad                	lods   %ds:(%esi),%ax
c010a6f6:	66 ef                	out    %ax,(%dx)
c010a6f8:	e2 f7                	loop   c010a6f1 <Writing_Word>
c010a6fa:	66 87 db             	xchg   %bx,%bx
c010a6fd:	66 b9 00 00          	mov    $0x0,%cx
c010a701:	66 ba 07 03          	mov    $0x307,%dx

c010a705 <CheckDMA>:
c010a705:	ec                   	in     (%dx),%al
c010a706:	a8 40                	test   $0x40,%al
c010a708:	75 02                	jne    c010a70c <toNICEND>
c010a70a:	eb f9                	jmp    c010a705 <CheckDMA>

c010a70c <toNICEND>:
c010a70c:	66 ba 07 03          	mov    $0x307,%dx
c010a710:	b0 40                	mov    $0x40,%al
c010a712:	ee                   	out    %al,(%dx)
c010a713:	f8                   	clc    
c010a714:	89 ec                	mov    %ebp,%esp
c010a716:	59                   	pop    %ecx
c010a717:	5d                   	pop    %ebp
c010a718:	5b                   	pop    %ebx
c010a719:	5f                   	pop    %edi
c010a71a:	5e                   	pop    %esi
c010a71b:	c3                   	ret    

c010a71c <NICtoPC>:
c010a71c:	66 87 db             	xchg   %bx,%bx
c010a71f:	56                   	push   %esi
c010a720:	57                   	push   %edi
c010a721:	53                   	push   %ebx
c010a722:	55                   	push   %ebp
c010a723:	51                   	push   %ecx
c010a724:	89 e5                	mov    %esp,%ebp
c010a726:	66 bb 16 00          	mov    $0x16,%bx
c010a72a:	66 ba 0a 03          	mov    $0x30a,%dx
c010a72e:	88 d8                	mov    %bl,%al
c010a730:	ee                   	out    %al,(%dx)
c010a731:	66 ba 0b 03          	mov    $0x30b,%dx
c010a735:	88 f8                	mov    %bh,%al
c010a737:	ee                   	out    %al,(%dx)
c010a738:	66 ba 00 03          	mov    $0x300,%dx
c010a73c:	b0 0a                	mov    $0xa,%al
c010a73e:	ee                   	out    %al,(%dx)
c010a73f:	66 ba 10 03          	mov    $0x310,%dx
c010a743:	66 ba 08 03          	mov    $0x308,%dx
c010a747:	66 b8 00 40          	mov    $0x4000,%ax
c010a74b:	ee                   	out    %al,(%dx)
c010a74c:	88 e0                	mov    %ah,%al
c010a74e:	ee                   	out    %al,(%dx)
c010a74f:	66 ba 10 03          	mov    $0x310,%dx
c010a753:	66 b9 16 00          	mov    $0x16,%cx
c010a757:	66 d1 e9             	shr    %cx
c010a75a:	bf a0 a5 10 c0       	mov    $0xc010a5a0,%edi

c010a75f <READING_Word_NICtoPC>:
c010a75f:	31 c0                	xor    %eax,%eax
c010a761:	66 ed                	in     (%dx),%ax
c010a763:	66 ab                	stos   %ax,%es:(%edi)
c010a765:	e2 f8                	loop   c010a75f <READING_Word_NICtoPC>
c010a767:	b8 a0 a5 10 c0       	mov    $0xc010a5a0,%eax
c010a76c:	50                   	push   %eax
c010a76d:	e8 1a 59 ff ff       	call   c010008c <disp_str>
c010a772:	83 c4 04             	add    $0x4,%esp
c010a775:	66 ba 07 03          	mov    $0x307,%dx

c010a779 <CheckDMA_NICtoPC>:
c010a779:	ec                   	in     (%dx),%al
c010a77a:	a8 40                	test   $0x40,%al
c010a77c:	75 02                	jne    c010a780 <ReadEnd>
c010a77e:	eb f9                	jmp    c010a779 <CheckDMA_NICtoPC>

c010a780 <ReadEnd>:
c010a780:	ee                   	out    %al,(%dx)
c010a781:	89 ec                	mov    %ebp,%esp
c010a783:	59                   	pop    %ecx
c010a784:	5d                   	pop    %ebp
c010a785:	5b                   	pop    %ebx
c010a786:	5f                   	pop    %edi
c010a787:	5e                   	pop    %esi
c010a788:	c3                   	ret    
