
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
c0100025:	e8 e1 3b 00 00       	call   c0103c0b <ReloadGDT>
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
c010014b:	e8 00 71 00 00       	call   c0107250 <exception_handler>
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
c0100168:	e8 e3 70 00 00       	call   c0107250 <exception_handler>
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
c0100195:	e8 3b 36 00 00       	call   c01037d5 <clock_handler>
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
c01001c7:	e8 94 45 00 00       	call   c0104760 <keyboard_handler>
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
c010020d:	e8 42 12 00 00       	call   c0101454 <hd_handler>
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
c0100256:	e8 c5 a4 00 00       	call   c010a720 <NICtoPC>
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
c0100340:	e8 a5 6d 00 00       	call   c01070ea <disp_int>
c0100345:	83 c4 04             	add    $0x4,%esp
c0100348:	58                   	pop    %eax
c0100349:	5a                   	pop    %edx
c010034a:	52                   	push   %edx
c010034b:	50                   	push   %eax
c010034c:	e8 99 6d 00 00       	call   c01070ea <disp_int>
c0100351:	58                   	pop    %eax
c0100352:	5a                   	pop    %edx
c0100353:	52                   	push   %edx
c0100354:	50                   	push   %eax
c0100355:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c010035b:	e8 8a 6d 00 00       	call   c01070ea <disp_int>
c0100360:	83 c4 04             	add    $0x4,%esp
c0100363:	58                   	pop    %eax
c0100364:	5a                   	pop    %edx
c0100365:	52                   	push   %edx
c0100366:	50                   	push   %eax
c0100367:	ff 72 ec             	pushl  -0x14(%edx)
c010036a:	e8 7b 6d 00 00       	call   c01070ea <disp_int>
c010036f:	83 c4 04             	add    $0x4,%esp
c0100372:	58                   	pop    %eax
c0100373:	5a                   	pop    %edx
c0100374:	52                   	push   %edx
c0100375:	50                   	push   %eax
c0100376:	ff 70 ec             	pushl  -0x14(%eax)
c0100379:	e8 6c 6d 00 00       	call   c01070ea <disp_int>
c010037e:	83 c4 04             	add    $0x4,%esp
c0100381:	58                   	pop    %eax
c0100382:	5a                   	pop    %edx
c0100383:	52                   	push   %edx
c0100384:	50                   	push   %eax
c0100385:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c010038b:	e8 5a 6d 00 00       	call   c01070ea <disp_int>
c0100390:	83 c4 04             	add    $0x4,%esp
c0100393:	58                   	pop    %eax
c0100394:	5a                   	pop    %edx
c0100395:	52                   	push   %edx
c0100396:	50                   	push   %eax
c0100397:	68 60 f7 10 c0       	push   $0xc010f760
c010039c:	e8 49 6d 00 00       	call   c01070ea <disp_int>
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
c010048e:	e8 3d 9d 00 00       	call   c010a1d0 <appendToDoubleLinkList>
c0100493:	83 c4 10             	add    $0x10,%esp
c0100496:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010049b:	05 6a 02 00 00       	add    $0x26a,%eax
c01004a0:	83 ec 08             	sub    $0x8,%esp
c01004a3:	50                   	push   %eax
c01004a4:	68 ec fd 10 c0       	push   $0xc010fdec
c01004a9:	e8 22 9d 00 00       	call   c010a1d0 <appendToDoubleLinkList>
c01004ae:	83 c4 10             	add    $0x10,%esp
c01004b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004b4:	83 ec 0c             	sub    $0xc,%esp
c01004b7:	50                   	push   %eax
c01004b8:	6a 00                	push   $0x0
c01004ba:	68 0c b0 10 c0       	push   $0xc010b00c
c01004bf:	68 13 b0 10 c0       	push   $0xc010b013
c01004c4:	68 c7 51 10 c0       	push   $0xc01051c7
c01004c9:	e8 43 9a 00 00       	call   c0109f11 <process_execute>
c01004ce:	83 c4 20             	add    $0x20,%esp
c01004d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004d4:	83 ec 0c             	sub    $0xc,%esp
c01004d7:	50                   	push   %eax
c01004d8:	6a 00                	push   $0x0
c01004da:	68 1c b0 10 c0       	push   $0xc010b01c
c01004df:	68 24 b0 10 c0       	push   $0xc010b024
c01004e4:	68 79 16 10 c0       	push   $0xc0101679
c01004e9:	e8 23 9a 00 00       	call   c0109f11 <process_execute>
c01004ee:	83 c4 20             	add    $0x20,%esp
c01004f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004f4:	83 ec 0c             	sub    $0xc,%esp
c01004f7:	50                   	push   %eax
c01004f8:	6a 00                	push   $0x0
c01004fa:	68 2d b0 10 c0       	push   $0xc010b02d
c01004ff:	68 34 b0 10 c0       	push   $0xc010b034
c0100504:	68 cc 07 10 c0       	push   $0xc01007cc
c0100509:	e8 03 9a 00 00       	call   c0109f11 <process_execute>
c010050e:	83 c4 20             	add    $0x20,%esp
c0100511:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100514:	83 ec 0c             	sub    $0xc,%esp
c0100517:	50                   	push   %eax
c0100518:	6a 00                	push   $0x0
c010051a:	68 3d b0 10 c0       	push   $0xc010b03d
c010051f:	68 45 b0 10 c0       	push   $0xc010b045
c0100524:	68 5d 46 10 c0       	push   $0xc010465d
c0100529:	e8 e3 99 00 00       	call   c0109f11 <process_execute>
c010052e:	83 c4 20             	add    $0x20,%esp
c0100531:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100534:	83 e8 02             	sub    $0x2,%eax
c0100537:	83 ec 0c             	sub    $0xc,%esp
c010053a:	50                   	push   %eax
c010053b:	6a 01                	push   $0x1
c010053d:	68 4f b0 10 c0       	push   $0xc010b04f
c0100542:	68 59 b0 10 c0       	push   $0xc010b059
c0100547:	68 e9 06 10 c0       	push   $0xc01006e9
c010054c:	e8 c0 99 00 00       	call   c0109f11 <process_execute>
c0100551:	83 c4 20             	add    $0x20,%esp
c0100554:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100557:	83 e8 03             	sub    $0x3,%eax
c010055a:	83 ec 0c             	sub    $0xc,%esp
c010055d:	50                   	push   %eax
c010055e:	6a 01                	push   $0x1
c0100560:	68 66 b0 10 c0       	push   $0xc010b066
c0100565:	68 70 b0 10 c0       	push   $0xc010b070
c010056a:	68 b4 07 10 c0       	push   $0xc01007b4
c010056f:	e8 9d 99 00 00       	call   c0109f11 <process_execute>
c0100574:	83 c4 20             	add    $0x20,%esp
c0100577:	83 ec 0c             	sub    $0xc,%esp
c010057a:	68 7d b0 10 c0       	push   $0xc010b07d
c010057f:	e8 08 fb ff ff       	call   c010008c <disp_str>
c0100584:	83 c4 10             	add    $0x10,%esp
c0100587:	fb                   	sti    
c0100588:	e8 81 66 00 00       	call   c0106c0e <stop_here>
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
c01005eb:	e8 4a 70 00 00       	call   c010763a <init_keyboard>
c01005f0:	83 ec 0c             	sub    $0xc,%esp
c01005f3:	68 00 00 00 04       	push   $0x4000000
c01005f8:	e8 c8 64 00 00       	call   c0106ac5 <init_memory>
c01005fd:	83 c4 10             	add    $0x10,%esp
c0100600:	83 ec 0c             	sub    $0xc,%esp
c0100603:	68 ec fd 10 c0       	push   $0xc010fdec
c0100608:	e8 98 9a 00 00       	call   c010a0a5 <initDoubleLinkList>
c010060d:	83 c4 10             	add    $0x10,%esp
c0100610:	83 ec 0c             	sub    $0xc,%esp
c0100613:	68 04 0f 11 c0       	push   $0xc0110f04
c0100618:	e8 88 9a 00 00       	call   c010a0a5 <initDoubleLinkList>
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
c0100713:	e8 34 0f 00 00       	call   c010164c <sys_malloc>
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
c0100759:	e8 45 9e 00 00       	call   c010a5a3 <DriverInitialize>
c010075e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100765:	eb 15                	jmp    c010077c <user_proc_a+0x93>
c0100767:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c010076c:	83 ec 0c             	sub    $0xc,%esp
c010076f:	50                   	push   %eax
c0100770:	e8 c9 9e 00 00       	call   c010a63e <DriverSend>
c0100775:	83 c4 10             	add    $0x10,%esp
c0100778:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010077c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0100780:	7e e5                	jle    c0100767 <user_proc_a+0x7e>
c0100782:	83 ec 0c             	sub    $0xc,%esp
c0100785:	68 da b0 10 c0       	push   $0xc010b0da
c010078a:	e8 fd f8 ff ff       	call   c010008c <disp_str>
c010078f:	83 c4 10             	add    $0x10,%esp
c0100792:	83 ec 0c             	sub    $0xc,%esp
c0100795:	68 ed b0 10 c0       	push   $0xc010b0ed
c010079a:	e8 ed f8 ff ff       	call   c010008c <disp_str>
c010079f:	83 c4 10             	add    $0x10,%esp
c01007a2:	83 ec 0c             	sub    $0xc,%esp
c01007a5:	68 00 b1 10 c0       	push   $0xc010b100
c01007aa:	e8 dd f8 ff ff       	call   c010008c <disp_str>
c01007af:	83 c4 10             	add    $0x10,%esp
c01007b2:	eb fe                	jmp    c01007b2 <user_proc_a+0xc9>

c01007b4 <user_proc_b>:
c01007b4:	55                   	push   %ebp
c01007b5:	89 e5                	mov    %esp,%ebp
c01007b7:	83 ec 08             	sub    $0x8,%esp
c01007ba:	83 ec 0c             	sub    $0xc,%esp
c01007bd:	68 14 b1 10 c0       	push   $0xc010b114
c01007c2:	e8 c5 f8 ff ff       	call   c010008c <disp_str>
c01007c7:	83 c4 10             	add    $0x10,%esp
c01007ca:	eb fe                	jmp    c01007ca <user_proc_b+0x16>

c01007cc <TaskHD>:
c01007cc:	55                   	push   %ebp
c01007cd:	89 e5                	mov    %esp,%ebp
c01007cf:	83 ec 18             	sub    $0x18,%esp
c01007d2:	e8 17 fc ff ff       	call   c01003ee <get_running_thread_pcb>
c01007d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01007da:	e8 32 00 00 00       	call   c0100811 <init_hd>
c01007df:	83 ec 0c             	sub    $0xc,%esp
c01007e2:	6a 7c                	push   $0x7c
c01007e4:	e8 63 0e 00 00       	call   c010164c <sys_malloc>
c01007e9:	83 c4 10             	add    $0x10,%esp
c01007ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01007ef:	83 ec 04             	sub    $0x4,%esp
c01007f2:	6a 7c                	push   $0x7c
c01007f4:	6a 00                	push   $0x0
c01007f6:	ff 75 f0             	pushl  -0x10(%ebp)
c01007f9:	e8 d1 b9 00 00       	call   c010c1cf <Memset>
c01007fe:	83 c4 10             	add    $0x10,%esp
c0100801:	83 ec 0c             	sub    $0xc,%esp
c0100804:	ff 75 f0             	pushl  -0x10(%ebp)
c0100807:	e8 1f 00 00 00       	call   c010082b <hd_handle>
c010080c:	83 c4 10             	add    $0x10,%esp
c010080f:	eb de                	jmp    c01007ef <TaskHD+0x23>

c0100811 <init_hd>:
c0100811:	55                   	push   %ebp
c0100812:	89 e5                	mov    %esp,%ebp
c0100814:	83 ec 18             	sub    $0x18,%esp
c0100817:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c010081e:	e8 87 fb ff ff       	call   c01003aa <enable_8259A_casecade_irq>
c0100823:	e8 96 fb ff ff       	call   c01003be <enable_8259A_slave_winchester_irq>
c0100828:	90                   	nop
c0100829:	c9                   	leave  
c010082a:	c3                   	ret    

c010082b <hd_handle>:
c010082b:	55                   	push   %ebp
c010082c:	89 e5                	mov    %esp,%ebp
c010082e:	83 ec 18             	sub    $0x18,%esp
c0100831:	83 ec 04             	sub    $0x4,%esp
c0100834:	6a 12                	push   $0x12
c0100836:	ff 75 08             	pushl  0x8(%ebp)
c0100839:	6a 02                	push   $0x2
c010083b:	e8 45 8d 00 00       	call   c0109585 <send_rec>
c0100840:	83 c4 10             	add    $0x10,%esp
c0100843:	8b 45 08             	mov    0x8(%ebp),%eax
c0100846:	8b 40 78             	mov    0x78(%eax),%eax
c0100849:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010084c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100850:	0f 84 d4 00 00 00    	je     c010092a <hd_handle+0xff>
c0100856:	8b 45 08             	mov    0x8(%ebp),%eax
c0100859:	8b 00                	mov    (%eax),%eax
c010085b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010085e:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100862:	74 28                	je     c010088c <hd_handle+0x61>
c0100864:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100868:	74 22                	je     c010088c <hd_handle+0x61>
c010086a:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010086e:	74 1c                	je     c010088c <hd_handle+0x61>
c0100870:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100874:	74 16                	je     c010088c <hd_handle+0x61>
c0100876:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c010087d:	74 0d                	je     c010088c <hd_handle+0x61>
c010087f:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0100886:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100889:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010088c:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100890:	74 34                	je     c01008c6 <hd_handle+0x9b>
c0100892:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100896:	74 2e                	je     c01008c6 <hd_handle+0x9b>
c0100898:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010089c:	74 28                	je     c01008c6 <hd_handle+0x9b>
c010089e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008a2:	74 22                	je     c01008c6 <hd_handle+0x9b>
c01008a4:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008ab:	74 19                	je     c01008c6 <hd_handle+0x9b>
c01008ad:	6a 6d                	push   $0x6d
c01008af:	68 34 b1 10 c0       	push   $0xc010b134
c01008b4:	68 34 b1 10 c0       	push   $0xc010b134
c01008b9:	68 3c b1 10 c0       	push   $0xc010b13c
c01008be:	e8 52 80 00 00       	call   c0108915 <assertion_failure>
c01008c3:	83 c4 10             	add    $0x10,%esp
c01008c6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008ca:	74 2c                	je     c01008f8 <hd_handle+0xcd>
c01008cc:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008d0:	77 0e                	ja     c01008e0 <hd_handle+0xb5>
c01008d2:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008d6:	74 19                	je     c01008f1 <hd_handle+0xc6>
c01008d8:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008dc:	74 1a                	je     c01008f8 <hd_handle+0xcd>
c01008de:	eb 37                	jmp    c0100917 <hd_handle+0xec>
c01008e0:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008e4:	74 22                	je     c0100908 <hd_handle+0xdd>
c01008e6:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008ed:	74 3e                	je     c010092d <hd_handle+0x102>
c01008ef:	eb 26                	jmp    c0100917 <hd_handle+0xec>
c01008f1:	e8 e6 06 00 00       	call   c0100fdc <hd_open>
c01008f6:	eb 36                	jmp    c010092e <hd_handle+0x103>
c01008f8:	83 ec 0c             	sub    $0xc,%esp
c01008fb:	ff 75 08             	pushl  0x8(%ebp)
c01008fe:	e8 b2 08 00 00       	call   c01011b5 <hd_rdwt>
c0100903:	83 c4 10             	add    $0x10,%esp
c0100906:	eb 26                	jmp    c010092e <hd_handle+0x103>
c0100908:	83 ec 0c             	sub    $0xc,%esp
c010090b:	6a 00                	push   $0x0
c010090d:	e8 71 07 00 00       	call   c0101083 <get_hd_ioctl>
c0100912:	83 c4 10             	add    $0x10,%esp
c0100915:	eb 17                	jmp    c010092e <hd_handle+0x103>
c0100917:	83 ec 0c             	sub    $0xc,%esp
c010091a:	68 96 b1 10 c0       	push   $0xc010b196
c010091f:	e8 ad 7f 00 00       	call   c01088d1 <spin>
c0100924:	83 c4 10             	add    $0x10,%esp
c0100927:	90                   	nop
c0100928:	eb 04                	jmp    c010092e <hd_handle+0x103>
c010092a:	90                   	nop
c010092b:	eb 01                	jmp    c010092e <hd_handle+0x103>
c010092d:	90                   	nop
c010092e:	c9                   	leave  
c010092f:	c3                   	ret    

c0100930 <hd_cmd_out>:
c0100930:	55                   	push   %ebp
c0100931:	89 e5                	mov    %esp,%ebp
c0100933:	83 ec 08             	sub    $0x8,%esp
c0100936:	83 ec 04             	sub    $0x4,%esp
c0100939:	68 18 73 01 00       	push   $0x17318
c010093e:	6a 00                	push   $0x0
c0100940:	68 80 00 00 00       	push   $0x80
c0100945:	e8 52 0b 00 00       	call   c010149c <waitfor>
c010094a:	83 c4 10             	add    $0x10,%esp
c010094d:	85 c0                	test   %eax,%eax
c010094f:	75 10                	jne    c0100961 <hd_cmd_out+0x31>
c0100951:	83 ec 0c             	sub    $0xc,%esp
c0100954:	68 a8 b1 10 c0       	push   $0xc010b1a8
c0100959:	e8 99 7f 00 00       	call   c01088f7 <panic>
c010095e:	83 c4 10             	add    $0x10,%esp
c0100961:	83 ec 08             	sub    $0x8,%esp
c0100964:	6a 00                	push   $0x0
c0100966:	68 f6 03 00 00       	push   $0x3f6
c010096b:	e8 80 f9 ff ff       	call   c01002f0 <out_byte>
c0100970:	83 c4 10             	add    $0x10,%esp
c0100973:	8b 45 08             	mov    0x8(%ebp),%eax
c0100976:	0f b6 00             	movzbl (%eax),%eax
c0100979:	0f b6 c0             	movzbl %al,%eax
c010097c:	83 ec 08             	sub    $0x8,%esp
c010097f:	50                   	push   %eax
c0100980:	68 f1 01 00 00       	push   $0x1f1
c0100985:	e8 66 f9 ff ff       	call   c01002f0 <out_byte>
c010098a:	83 c4 10             	add    $0x10,%esp
c010098d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100990:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0100994:	0f b6 c0             	movzbl %al,%eax
c0100997:	83 ec 08             	sub    $0x8,%esp
c010099a:	50                   	push   %eax
c010099b:	68 f2 01 00 00       	push   $0x1f2
c01009a0:	e8 4b f9 ff ff       	call   c01002f0 <out_byte>
c01009a5:	83 c4 10             	add    $0x10,%esp
c01009a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01009ab:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c01009af:	0f b6 c0             	movzbl %al,%eax
c01009b2:	83 ec 08             	sub    $0x8,%esp
c01009b5:	50                   	push   %eax
c01009b6:	68 f3 01 00 00       	push   $0x1f3
c01009bb:	e8 30 f9 ff ff       	call   c01002f0 <out_byte>
c01009c0:	83 c4 10             	add    $0x10,%esp
c01009c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01009c6:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c01009ca:	0f b6 c0             	movzbl %al,%eax
c01009cd:	83 ec 08             	sub    $0x8,%esp
c01009d0:	50                   	push   %eax
c01009d1:	68 f4 01 00 00       	push   $0x1f4
c01009d6:	e8 15 f9 ff ff       	call   c01002f0 <out_byte>
c01009db:	83 c4 10             	add    $0x10,%esp
c01009de:	8b 45 08             	mov    0x8(%ebp),%eax
c01009e1:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c01009e5:	0f b6 c0             	movzbl %al,%eax
c01009e8:	83 ec 08             	sub    $0x8,%esp
c01009eb:	50                   	push   %eax
c01009ec:	68 f5 01 00 00       	push   $0x1f5
c01009f1:	e8 fa f8 ff ff       	call   c01002f0 <out_byte>
c01009f6:	83 c4 10             	add    $0x10,%esp
c01009f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01009fc:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0100a00:	0f b6 c0             	movzbl %al,%eax
c0100a03:	83 ec 08             	sub    $0x8,%esp
c0100a06:	50                   	push   %eax
c0100a07:	68 f6 01 00 00       	push   $0x1f6
c0100a0c:	e8 df f8 ff ff       	call   c01002f0 <out_byte>
c0100a11:	83 c4 10             	add    $0x10,%esp
c0100a14:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a17:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100a1b:	0f b6 c0             	movzbl %al,%eax
c0100a1e:	83 ec 08             	sub    $0x8,%esp
c0100a21:	50                   	push   %eax
c0100a22:	68 f7 01 00 00       	push   $0x1f7
c0100a27:	e8 c4 f8 ff ff       	call   c01002f0 <out_byte>
c0100a2c:	83 c4 10             	add    $0x10,%esp
c0100a2f:	90                   	nop
c0100a30:	c9                   	leave  
c0100a31:	c3                   	ret    

c0100a32 <hd_identify>:
c0100a32:	55                   	push   %ebp
c0100a33:	89 e5                	mov    %esp,%ebp
c0100a35:	53                   	push   %ebx
c0100a36:	83 ec 24             	sub    $0x24,%esp
c0100a39:	89 e0                	mov    %esp,%eax
c0100a3b:	89 c3                	mov    %eax,%ebx
c0100a3d:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0100a41:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100a45:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100a49:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100a4d:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0100a51:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a54:	c1 e0 04             	shl    $0x4,%eax
c0100a57:	83 c8 e0             	or     $0xffffffe0,%eax
c0100a5a:	88 45 ea             	mov    %al,-0x16(%ebp)
c0100a5d:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0100a61:	83 ec 0c             	sub    $0xc,%esp
c0100a64:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100a67:	50                   	push   %eax
c0100a68:	e8 c3 fe ff ff       	call   c0100930 <hd_cmd_out>
c0100a6d:	83 c4 10             	add    $0x10,%esp
c0100a70:	e8 f0 06 00 00       	call   c0101165 <interrupt_wait>
c0100a75:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a7f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100a82:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100a85:	89 c2                	mov    %eax,%edx
c0100a87:	b8 10 00 00 00       	mov    $0x10,%eax
c0100a8c:	83 e8 01             	sub    $0x1,%eax
c0100a8f:	01 d0                	add    %edx,%eax
c0100a91:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100a96:	ba 00 00 00 00       	mov    $0x0,%edx
c0100a9b:	f7 f1                	div    %ecx
c0100a9d:	6b c0 10             	imul   $0x10,%eax,%eax
c0100aa0:	29 c4                	sub    %eax,%esp
c0100aa2:	89 e0                	mov    %esp,%eax
c0100aa4:	83 c0 00             	add    $0x0,%eax
c0100aa7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100aaa:	83 ec 04             	sub    $0x4,%esp
c0100aad:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ab0:	6a 00                	push   $0x0
c0100ab2:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ab5:	e8 15 b7 00 00       	call   c010c1cf <Memset>
c0100aba:	83 c4 10             	add    $0x10,%esp
c0100abd:	83 ec 04             	sub    $0x4,%esp
c0100ac0:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ac3:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ac6:	68 f0 01 00 00       	push   $0x1f0
c0100acb:	e8 53 b7 00 00       	call   c010c223 <read_port>
c0100ad0:	83 c4 10             	add    $0x10,%esp
c0100ad3:	83 ec 0c             	sub    $0xc,%esp
c0100ad6:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ad9:	e8 0b 00 00 00       	call   c0100ae9 <print_hdinfo>
c0100ade:	83 c4 10             	add    $0x10,%esp
c0100ae1:	89 dc                	mov    %ebx,%esp
c0100ae3:	90                   	nop
c0100ae4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100ae7:	c9                   	leave  
c0100ae8:	c3                   	ret    

c0100ae9 <print_hdinfo>:
c0100ae9:	55                   	push   %ebp
c0100aea:	89 e5                	mov    %esp,%ebp
c0100aec:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100af2:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100af8:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100afe:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100b05:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100b0c:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100b13:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100b1a:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100b21:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100b27:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100b2d:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100b34:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100b3b:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100b42:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100b49:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100b50:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100b57:	e9 8f 00 00 00       	jmp    c0100beb <print_hdinfo+0x102>
c0100b5c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100b63:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100b66:	89 d0                	mov    %edx,%eax
c0100b68:	01 c0                	add    %eax,%eax
c0100b6a:	01 d0                	add    %edx,%eax
c0100b6c:	c1 e0 03             	shl    $0x3,%eax
c0100b6f:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100b72:	01 c8                	add    %ecx,%eax
c0100b74:	83 e8 44             	sub    $0x44,%eax
c0100b77:	0f b7 00             	movzwl (%eax),%eax
c0100b7a:	0f b7 c0             	movzwl %ax,%eax
c0100b7d:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100b80:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b83:	01 d0                	add    %edx,%eax
c0100b85:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100b88:	eb 30                	jmp    c0100bba <print_hdinfo+0xd1>
c0100b8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100b8d:	8d 50 01             	lea    0x1(%eax),%edx
c0100b90:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100b93:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100b96:	83 c2 01             	add    $0x1,%edx
c0100b99:	0f b6 00             	movzbl (%eax),%eax
c0100b9c:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100ba0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ba3:	8d 50 01             	lea    0x1(%eax),%edx
c0100ba6:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100ba9:	0f b6 00             	movzbl (%eax),%eax
c0100bac:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100baf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100bb2:	01 ca                	add    %ecx,%edx
c0100bb4:	88 02                	mov    %al,(%edx)
c0100bb6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100bba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100bbd:	89 d0                	mov    %edx,%eax
c0100bbf:	01 c0                	add    %eax,%eax
c0100bc1:	01 d0                	add    %edx,%eax
c0100bc3:	c1 e0 03             	shl    $0x3,%eax
c0100bc6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100bc9:	01 c8                	add    %ecx,%eax
c0100bcb:	83 e8 42             	sub    $0x42,%eax
c0100bce:	0f b7 00             	movzwl (%eax),%eax
c0100bd1:	66 d1 e8             	shr    %ax
c0100bd4:	0f b7 c0             	movzwl %ax,%eax
c0100bd7:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100bda:	7c ae                	jl     c0100b8a <print_hdinfo+0xa1>
c0100bdc:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100bdf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100be2:	01 d0                	add    %edx,%eax
c0100be4:	c6 00 00             	movb   $0x0,(%eax)
c0100be7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100beb:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100bef:	0f 8e 67 ff ff ff    	jle    c0100b5c <print_hdinfo+0x73>
c0100bf5:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bf8:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100bfc:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100c00:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100c04:	66 c1 e8 08          	shr    $0x8,%ax
c0100c08:	66 85 c0             	test   %ax,%ax
c0100c0b:	0f 95 c0             	setne  %al
c0100c0e:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100c11:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100c18:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100c1e:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100c22:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100c26:	75 15                	jne    c0100c3d <print_hdinfo+0x154>
c0100c28:	83 ec 08             	sub    $0x8,%esp
c0100c2b:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100c2e:	50                   	push   %eax
c0100c2f:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c32:	50                   	push   %eax
c0100c33:	e8 b6 b5 00 00       	call   c010c1ee <Strcpy>
c0100c38:	83 c4 10             	add    $0x10,%esp
c0100c3b:	eb 13                	jmp    c0100c50 <print_hdinfo+0x167>
c0100c3d:	83 ec 08             	sub    $0x8,%esp
c0100c40:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c43:	50                   	push   %eax
c0100c44:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c47:	50                   	push   %eax
c0100c48:	e8 a1 b5 00 00       	call   c010c1ee <Strcpy>
c0100c4d:	83 c4 10             	add    $0x10,%esp
c0100c50:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c53:	83 c0 7a             	add    $0x7a,%eax
c0100c56:	0f b7 00             	movzwl (%eax),%eax
c0100c59:	0f b7 d0             	movzwl %ax,%edx
c0100c5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c5f:	83 c0 78             	add    $0x78,%eax
c0100c62:	0f b7 00             	movzwl (%eax),%eax
c0100c65:	0f b7 c0             	movzwl %ax,%eax
c0100c68:	83 c0 10             	add    $0x10,%eax
c0100c6b:	89 c1                	mov    %eax,%ecx
c0100c6d:	d3 e2                	shl    %cl,%edx
c0100c6f:	89 d0                	mov    %edx,%eax
c0100c71:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100c74:	90                   	nop
c0100c75:	c9                   	leave  
c0100c76:	c3                   	ret    

c0100c77 <print_dpt_entry>:
c0100c77:	55                   	push   %ebp
c0100c78:	89 e5                	mov    %esp,%ebp
c0100c7a:	83 ec 08             	sub    $0x8,%esp
c0100c7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c80:	8b 40 08             	mov    0x8(%eax),%eax
c0100c83:	83 ec 08             	sub    $0x8,%esp
c0100c86:	50                   	push   %eax
c0100c87:	68 b2 b1 10 c0       	push   $0xc010b1b2
c0100c8c:	e8 27 79 00 00       	call   c01085b8 <Printf>
c0100c91:	83 c4 10             	add    $0x10,%esp
c0100c94:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c97:	8b 40 0c             	mov    0xc(%eax),%eax
c0100c9a:	83 ec 08             	sub    $0x8,%esp
c0100c9d:	50                   	push   %eax
c0100c9e:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100ca3:	e8 10 79 00 00       	call   c01085b8 <Printf>
c0100ca8:	83 c4 10             	add    $0x10,%esp
c0100cab:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cae:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100cb2:	0f b6 c0             	movzbl %al,%eax
c0100cb5:	83 ec 08             	sub    $0x8,%esp
c0100cb8:	50                   	push   %eax
c0100cb9:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100cbe:	e8 f5 78 00 00       	call   c01085b8 <Printf>
c0100cc3:	83 c4 10             	add    $0x10,%esp
c0100cc6:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cc9:	0f b6 00             	movzbl (%eax),%eax
c0100ccc:	0f b6 c0             	movzbl %al,%eax
c0100ccf:	83 ec 08             	sub    $0x8,%esp
c0100cd2:	50                   	push   %eax
c0100cd3:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100cd8:	e8 db 78 00 00       	call   c01085b8 <Printf>
c0100cdd:	83 c4 10             	add    $0x10,%esp
c0100ce0:	90                   	nop
c0100ce1:	c9                   	leave  
c0100ce2:	c3                   	ret    

c0100ce3 <get_partition_table>:
c0100ce3:	55                   	push   %ebp
c0100ce4:	89 e5                	mov    %esp,%ebp
c0100ce6:	53                   	push   %ebx
c0100ce7:	83 ec 24             	sub    $0x24,%esp
c0100cea:	89 e0                	mov    %esp,%eax
c0100cec:	89 c3                	mov    %eax,%ebx
c0100cee:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100cf2:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100cf6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100cf9:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100cfc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100cff:	c1 f8 08             	sar    $0x8,%eax
c0100d02:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100d05:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d08:	c1 f8 10             	sar    $0x10,%eax
c0100d0b:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100d0e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d11:	c1 f8 18             	sar    $0x18,%eax
c0100d14:	89 c2                	mov    %eax,%edx
c0100d16:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d19:	c1 e0 04             	shl    $0x4,%eax
c0100d1c:	09 d0                	or     %edx,%eax
c0100d1e:	83 c8 e0             	or     $0xffffffe0,%eax
c0100d21:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100d24:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100d28:	83 ec 0c             	sub    $0xc,%esp
c0100d2b:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100d2e:	50                   	push   %eax
c0100d2f:	e8 fc fb ff ff       	call   c0100930 <hd_cmd_out>
c0100d34:	83 c4 10             	add    $0x10,%esp
c0100d37:	e8 29 04 00 00       	call   c0101165 <interrupt_wait>
c0100d3c:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100d43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d46:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100d49:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100d4c:	89 c2                	mov    %eax,%edx
c0100d4e:	b8 10 00 00 00       	mov    $0x10,%eax
c0100d53:	83 e8 01             	sub    $0x1,%eax
c0100d56:	01 d0                	add    %edx,%eax
c0100d58:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100d5d:	ba 00 00 00 00       	mov    $0x0,%edx
c0100d62:	f7 f1                	div    %ecx
c0100d64:	6b c0 10             	imul   $0x10,%eax,%eax
c0100d67:	29 c4                	sub    %eax,%esp
c0100d69:	89 e0                	mov    %esp,%eax
c0100d6b:	83 c0 00             	add    $0x0,%eax
c0100d6e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100d71:	83 ec 04             	sub    $0x4,%esp
c0100d74:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d77:	6a 00                	push   $0x0
c0100d79:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d7c:	e8 4e b4 00 00       	call   c010c1cf <Memset>
c0100d81:	83 c4 10             	add    $0x10,%esp
c0100d84:	83 ec 04             	sub    $0x4,%esp
c0100d87:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d8a:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d8d:	68 f0 01 00 00       	push   $0x1f0
c0100d92:	e8 8c b4 00 00       	call   c010c223 <read_port>
c0100d97:	83 c4 10             	add    $0x10,%esp
c0100d9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100d9d:	05 be 01 00 00       	add    $0x1be,%eax
c0100da2:	83 ec 04             	sub    $0x4,%esp
c0100da5:	6a 40                	push   $0x40
c0100da7:	50                   	push   %eax
c0100da8:	ff 75 10             	pushl  0x10(%ebp)
c0100dab:	e8 4c 5f 00 00       	call   c0106cfc <Memcpy>
c0100db0:	83 c4 10             	add    $0x10,%esp
c0100db3:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100dba:	89 dc                	mov    %ebx,%esp
c0100dbc:	90                   	nop
c0100dbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100dc0:	c9                   	leave  
c0100dc1:	c3                   	ret    

c0100dc2 <partition>:
c0100dc2:	55                   	push   %ebp
c0100dc3:	89 e5                	mov    %esp,%ebp
c0100dc5:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100dcb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100dce:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100dd1:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100dd5:	7f 19                	jg     c0100df0 <partition+0x2e>
c0100dd7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100dda:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100ddf:	89 c8                	mov    %ecx,%eax
c0100de1:	f7 ea                	imul   %edx
c0100de3:	d1 fa                	sar    %edx
c0100de5:	89 c8                	mov    %ecx,%eax
c0100de7:	c1 f8 1f             	sar    $0x1f,%eax
c0100dea:	29 c2                	sub    %eax,%edx
c0100dec:	89 d0                	mov    %edx,%eax
c0100dee:	eb 11                	jmp    c0100e01 <partition+0x3f>
c0100df0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100df3:	83 e8 10             	sub    $0x10,%eax
c0100df6:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100df9:	85 c0                	test   %eax,%eax
c0100dfb:	0f 48 c2             	cmovs  %edx,%eax
c0100dfe:	c1 f8 06             	sar    $0x6,%eax
c0100e01:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100e04:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100e08:	0f 85 cc 00 00 00    	jne    c0100eda <partition+0x118>
c0100e0e:	83 ec 04             	sub    $0x4,%esp
c0100e11:	6a 40                	push   $0x40
c0100e13:	6a 00                	push   $0x0
c0100e15:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e18:	50                   	push   %eax
c0100e19:	e8 b1 b3 00 00       	call   c010c1cf <Memset>
c0100e1e:	83 c4 10             	add    $0x10,%esp
c0100e21:	83 ec 04             	sub    $0x4,%esp
c0100e24:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e27:	50                   	push   %eax
c0100e28:	6a 00                	push   $0x0
c0100e2a:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e2d:	e8 b1 fe ff ff       	call   c0100ce3 <get_partition_table>
c0100e32:	83 c4 10             	add    $0x10,%esp
c0100e35:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e3c:	e9 8a 00 00 00       	jmp    c0100ecb <partition+0x109>
c0100e41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e44:	83 c0 01             	add    $0x1,%eax
c0100e47:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100e4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e4d:	c1 e0 04             	shl    $0x4,%eax
c0100e50:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e53:	01 c8                	add    %ecx,%eax
c0100e55:	83 e8 5c             	sub    $0x5c,%eax
c0100e58:	8b 00                	mov    (%eax),%eax
c0100e5a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e5d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e60:	c1 e1 03             	shl    $0x3,%ecx
c0100e63:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e69:	01 ca                	add    %ecx,%edx
c0100e6b:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100e71:	89 02                	mov    %eax,(%edx)
c0100e73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e76:	c1 e0 04             	shl    $0x4,%eax
c0100e79:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e7c:	01 c8                	add    %ecx,%eax
c0100e7e:	83 e8 58             	sub    $0x58,%eax
c0100e81:	8b 00                	mov    (%eax),%eax
c0100e83:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e86:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e89:	c1 e1 03             	shl    $0x3,%ecx
c0100e8c:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e92:	01 ca                	add    %ecx,%edx
c0100e94:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100e9a:	89 02                	mov    %eax,(%edx)
c0100e9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e9f:	c1 e0 04             	shl    $0x4,%eax
c0100ea2:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ea5:	01 c8                	add    %ecx,%eax
c0100ea7:	83 e8 60             	sub    $0x60,%eax
c0100eaa:	0f b6 00             	movzbl (%eax),%eax
c0100ead:	3c 05                	cmp    $0x5,%al
c0100eaf:	75 16                	jne    c0100ec7 <partition+0x105>
c0100eb1:	8b 55 08             	mov    0x8(%ebp),%edx
c0100eb4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100eb7:	01 d0                	add    %edx,%eax
c0100eb9:	83 ec 08             	sub    $0x8,%esp
c0100ebc:	6a 01                	push   $0x1
c0100ebe:	50                   	push   %eax
c0100ebf:	e8 fe fe ff ff       	call   c0100dc2 <partition>
c0100ec4:	83 c4 10             	add    $0x10,%esp
c0100ec7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100ecb:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100ecf:	0f 8e 6c ff ff ff    	jle    c0100e41 <partition+0x7f>
c0100ed5:	e9 ff 00 00 00       	jmp    c0100fd9 <partition+0x217>
c0100eda:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100ede:	0f 85 f5 00 00 00    	jne    c0100fd9 <partition+0x217>
c0100ee4:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100ee7:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100eec:	89 c8                	mov    %ecx,%eax
c0100eee:	f7 ea                	imul   %edx
c0100ef0:	d1 fa                	sar    %edx
c0100ef2:	89 c8                	mov    %ecx,%eax
c0100ef4:	c1 f8 1f             	sar    $0x1f,%eax
c0100ef7:	29 c2                	sub    %eax,%edx
c0100ef9:	89 d0                	mov    %edx,%eax
c0100efb:	c1 e0 02             	shl    $0x2,%eax
c0100efe:	01 d0                	add    %edx,%eax
c0100f00:	29 c1                	sub    %eax,%ecx
c0100f02:	89 c8                	mov    %ecx,%eax
c0100f04:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100f07:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100f0a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f0d:	c1 e2 03             	shl    $0x3,%edx
c0100f10:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f16:	01 d0                	add    %edx,%eax
c0100f18:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f1d:	8b 00                	mov    (%eax),%eax
c0100f1f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100f22:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f25:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f28:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100f2b:	83 e8 01             	sub    $0x1,%eax
c0100f2e:	c1 e0 04             	shl    $0x4,%eax
c0100f31:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100f34:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100f3b:	e9 8c 00 00 00       	jmp    c0100fcc <partition+0x20a>
c0100f40:	83 ec 04             	sub    $0x4,%esp
c0100f43:	6a 40                	push   $0x40
c0100f45:	6a 00                	push   $0x0
c0100f47:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f4a:	50                   	push   %eax
c0100f4b:	e8 7f b2 00 00       	call   c010c1cf <Memset>
c0100f50:	83 c4 10             	add    $0x10,%esp
c0100f53:	83 ec 04             	sub    $0x4,%esp
c0100f56:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f59:	50                   	push   %eax
c0100f5a:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f5d:	ff 75 e8             	pushl  -0x18(%ebp)
c0100f60:	e8 7e fd ff ff       	call   c0100ce3 <get_partition_table>
c0100f65:	83 c4 10             	add    $0x10,%esp
c0100f68:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100f6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f6e:	01 d0                	add    %edx,%eax
c0100f70:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100f73:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100f76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f79:	01 c2                	add    %eax,%edx
c0100f7b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100f7e:	8d 48 04             	lea    0x4(%eax),%ecx
c0100f81:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f84:	c1 e1 03             	shl    $0x3,%ecx
c0100f87:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f8d:	01 c8                	add    %ecx,%eax
c0100f8f:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f94:	89 10                	mov    %edx,(%eax)
c0100f96:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100f99:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100f9c:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100f9f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100fa2:	c1 e1 03             	shl    $0x3,%ecx
c0100fa5:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100fab:	01 ca                	add    %ecx,%edx
c0100fad:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100fb3:	89 02                	mov    %eax,(%edx)
c0100fb5:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100fb9:	84 c0                	test   %al,%al
c0100fbb:	74 1b                	je     c0100fd8 <partition+0x216>
c0100fbd:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100fc0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100fc3:	01 d0                	add    %edx,%eax
c0100fc5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100fc8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100fcc:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100fd0:	0f 8e 6a ff ff ff    	jle    c0100f40 <partition+0x17e>
c0100fd6:	eb 01                	jmp    c0100fd9 <partition+0x217>
c0100fd8:	90                   	nop
c0100fd9:	90                   	nop
c0100fda:	c9                   	leave  
c0100fdb:	c3                   	ret    

c0100fdc <hd_open>:
c0100fdc:	55                   	push   %ebp
c0100fdd:	89 e5                	mov    %esp,%ebp
c0100fdf:	83 ec 18             	sub    $0x18,%esp
c0100fe2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100fe9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100fec:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100ff2:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100ff7:	8b 00                	mov    (%eax),%eax
c0100ff9:	8d 50 01             	lea    0x1(%eax),%edx
c0100ffc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100fff:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101005:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c010100a:	89 10                	mov    %edx,(%eax)
c010100c:	83 ec 0c             	sub    $0xc,%esp
c010100f:	6a 00                	push   $0x0
c0101011:	e8 1c fa ff ff       	call   c0100a32 <hd_identify>
c0101016:	83 c4 10             	add    $0x10,%esp
c0101019:	83 ec 08             	sub    $0x8,%esp
c010101c:	6a 00                	push   $0x0
c010101e:	6a 00                	push   $0x0
c0101020:	e8 9d fd ff ff       	call   c0100dc2 <partition>
c0101025:	83 c4 10             	add    $0x10,%esp
c0101028:	83 ec 0c             	sub    $0xc,%esp
c010102b:	6a 7c                	push   $0x7c
c010102d:	e8 1a 06 00 00       	call   c010164c <sys_malloc>
c0101032:	83 c4 10             	add    $0x10,%esp
c0101035:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101038:	83 ec 04             	sub    $0x4,%esp
c010103b:	6a 7c                	push   $0x7c
c010103d:	6a 00                	push   $0x0
c010103f:	ff 75 f0             	pushl  -0x10(%ebp)
c0101042:	e8 88 b1 00 00       	call   c010c1cf <Memset>
c0101047:	83 c4 10             	add    $0x10,%esp
c010104a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010104d:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101054:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101057:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010105e:	83 ec 04             	sub    $0x4,%esp
c0101061:	6a 02                	push   $0x2
c0101063:	ff 75 f0             	pushl  -0x10(%ebp)
c0101066:	6a 01                	push   $0x1
c0101068:	e8 18 85 00 00       	call   c0109585 <send_rec>
c010106d:	83 c4 10             	add    $0x10,%esp
c0101070:	83 ec 08             	sub    $0x8,%esp
c0101073:	6a 7c                	push   $0x7c
c0101075:	ff 75 f0             	pushl  -0x10(%ebp)
c0101078:	e8 e4 05 00 00       	call   c0101661 <sys_free>
c010107d:	83 c4 10             	add    $0x10,%esp
c0101080:	90                   	nop
c0101081:	c9                   	leave  
c0101082:	c3                   	ret    

c0101083 <get_hd_ioctl>:
c0101083:	55                   	push   %ebp
c0101084:	89 e5                	mov    %esp,%ebp
c0101086:	83 ec 18             	sub    $0x18,%esp
c0101089:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c010108d:	7f 19                	jg     c01010a8 <get_hd_ioctl+0x25>
c010108f:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101092:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101097:	89 c8                	mov    %ecx,%eax
c0101099:	f7 ea                	imul   %edx
c010109b:	d1 fa                	sar    %edx
c010109d:	89 c8                	mov    %ecx,%eax
c010109f:	c1 f8 1f             	sar    $0x1f,%eax
c01010a2:	29 c2                	sub    %eax,%edx
c01010a4:	89 d0                	mov    %edx,%eax
c01010a6:	eb 11                	jmp    c01010b9 <get_hd_ioctl+0x36>
c01010a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01010ab:	83 e8 10             	sub    $0x10,%eax
c01010ae:	8d 50 3f             	lea    0x3f(%eax),%edx
c01010b1:	85 c0                	test   %eax,%eax
c01010b3:	0f 48 c2             	cmovs  %edx,%eax
c01010b6:	c1 f8 06             	sar    $0x6,%eax
c01010b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010bc:	8b 55 08             	mov    0x8(%ebp),%edx
c01010bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010c2:	c1 e2 03             	shl    $0x3,%edx
c01010c5:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01010cb:	01 d0                	add    %edx,%eax
c01010cd:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c01010d2:	8b 00                	mov    (%eax),%eax
c01010d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01010d7:	83 ec 0c             	sub    $0xc,%esp
c01010da:	6a 7c                	push   $0x7c
c01010dc:	e8 6b 05 00 00       	call   c010164c <sys_malloc>
c01010e1:	83 c4 10             	add    $0x10,%esp
c01010e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01010e7:	83 ec 04             	sub    $0x4,%esp
c01010ea:	6a 7c                	push   $0x7c
c01010ec:	6a 00                	push   $0x0
c01010ee:	ff 75 ec             	pushl  -0x14(%ebp)
c01010f1:	e8 d9 b0 00 00       	call   c010c1cf <Memset>
c01010f6:	83 c4 10             	add    $0x10,%esp
c01010f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01010fc:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101103:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101106:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010110d:	83 ec 04             	sub    $0x4,%esp
c0101110:	6a 02                	push   $0x2
c0101112:	ff 75 ec             	pushl  -0x14(%ebp)
c0101115:	6a 01                	push   $0x1
c0101117:	e8 69 84 00 00       	call   c0109585 <send_rec>
c010111c:	83 c4 10             	add    $0x10,%esp
c010111f:	83 ec 08             	sub    $0x8,%esp
c0101122:	6a 7c                	push   $0x7c
c0101124:	ff 75 ec             	pushl  -0x14(%ebp)
c0101127:	e8 35 05 00 00       	call   c0101661 <sys_free>
c010112c:	83 c4 10             	add    $0x10,%esp
c010112f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101132:	c9                   	leave  
c0101133:	c3                   	ret    

c0101134 <wait_for>:
c0101134:	55                   	push   %ebp
c0101135:	89 e5                	mov    %esp,%ebp
c0101137:	83 ec 08             	sub    $0x8,%esp
c010113a:	83 ec 04             	sub    $0x4,%esp
c010113d:	68 50 c3 00 00       	push   $0xc350
c0101142:	6a 08                	push   $0x8
c0101144:	6a 08                	push   $0x8
c0101146:	e8 51 03 00 00       	call   c010149c <waitfor>
c010114b:	83 c4 10             	add    $0x10,%esp
c010114e:	85 c0                	test   %eax,%eax
c0101150:	75 10                	jne    c0101162 <wait_for+0x2e>
c0101152:	83 ec 0c             	sub    $0xc,%esp
c0101155:	68 e4 b1 10 c0       	push   $0xc010b1e4
c010115a:	e8 98 77 00 00       	call   c01088f7 <panic>
c010115f:	83 c4 10             	add    $0x10,%esp
c0101162:	90                   	nop
c0101163:	c9                   	leave  
c0101164:	c3                   	ret    

c0101165 <interrupt_wait>:
c0101165:	55                   	push   %ebp
c0101166:	89 e5                	mov    %esp,%ebp
c0101168:	83 ec 18             	sub    $0x18,%esp
c010116b:	83 ec 0c             	sub    $0xc,%esp
c010116e:	6a 7c                	push   $0x7c
c0101170:	e8 d7 04 00 00       	call   c010164c <sys_malloc>
c0101175:	83 c4 10             	add    $0x10,%esp
c0101178:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010117b:	83 ec 04             	sub    $0x4,%esp
c010117e:	6a 7c                	push   $0x7c
c0101180:	6a 00                	push   $0x0
c0101182:	ff 75 f4             	pushl  -0xc(%ebp)
c0101185:	e8 45 b0 00 00       	call   c010c1cf <Memset>
c010118a:	83 c4 10             	add    $0x10,%esp
c010118d:	83 ec 04             	sub    $0x4,%esp
c0101190:	68 13 02 00 00       	push   $0x213
c0101195:	ff 75 f4             	pushl  -0xc(%ebp)
c0101198:	6a 02                	push   $0x2
c010119a:	e8 e6 83 00 00       	call   c0109585 <send_rec>
c010119f:	83 c4 10             	add    $0x10,%esp
c01011a2:	83 ec 08             	sub    $0x8,%esp
c01011a5:	6a 7c                	push   $0x7c
c01011a7:	ff 75 f4             	pushl  -0xc(%ebp)
c01011aa:	e8 b2 04 00 00       	call   c0101661 <sys_free>
c01011af:	83 c4 10             	add    $0x10,%esp
c01011b2:	90                   	nop
c01011b3:	c9                   	leave  
c01011b4:	c3                   	ret    

c01011b5 <hd_rdwt>:
c01011b5:	55                   	push   %ebp
c01011b6:	89 e5                	mov    %esp,%ebp
c01011b8:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c01011be:	8b 45 08             	mov    0x8(%ebp),%eax
c01011c1:	8b 40 18             	mov    0x18(%eax),%eax
c01011c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01011c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01011ca:	8b 40 14             	mov    0x14(%eax),%eax
c01011cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01011d0:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01011d4:	7f 19                	jg     c01011ef <hd_rdwt+0x3a>
c01011d6:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c01011d9:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01011de:	89 c8                	mov    %ecx,%eax
c01011e0:	f7 ea                	imul   %edx
c01011e2:	d1 fa                	sar    %edx
c01011e4:	89 c8                	mov    %ecx,%eax
c01011e6:	c1 f8 1f             	sar    $0x1f,%eax
c01011e9:	29 c2                	sub    %eax,%edx
c01011eb:	89 d0                	mov    %edx,%eax
c01011ed:	eb 11                	jmp    c0101200 <hd_rdwt+0x4b>
c01011ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01011f2:	83 e8 10             	sub    $0x10,%eax
c01011f5:	8d 50 3f             	lea    0x3f(%eax),%edx
c01011f8:	85 c0                	test   %eax,%eax
c01011fa:	0f 48 c2             	cmovs  %edx,%eax
c01011fd:	c1 f8 06             	sar    $0x6,%eax
c0101200:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101203:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101206:	8d 50 f0             	lea    -0x10(%eax),%edx
c0101209:	89 d0                	mov    %edx,%eax
c010120b:	c1 f8 1f             	sar    $0x1f,%eax
c010120e:	c1 e8 1a             	shr    $0x1a,%eax
c0101211:	01 c2                	add    %eax,%edx
c0101213:	83 e2 3f             	and    $0x3f,%edx
c0101216:	29 c2                	sub    %eax,%edx
c0101218:	89 d0                	mov    %edx,%eax
c010121a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010121d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101220:	c1 e8 09             	shr    $0x9,%eax
c0101223:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101226:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c010122a:	7f 1a                	jg     c0101246 <hd_rdwt+0x91>
c010122c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010122f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101232:	c1 e2 03             	shl    $0x3,%edx
c0101235:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010123b:	01 d0                	add    %edx,%eax
c010123d:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101242:	8b 00                	mov    (%eax),%eax
c0101244:	eb 1b                	jmp    c0101261 <hd_rdwt+0xac>
c0101246:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101249:	8d 50 04             	lea    0x4(%eax),%edx
c010124c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010124f:	c1 e2 03             	shl    $0x3,%edx
c0101252:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101258:	01 d0                	add    %edx,%eax
c010125a:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010125f:	8b 00                	mov    (%eax),%eax
c0101261:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101264:	01 d0                	add    %edx,%eax
c0101266:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101269:	8b 45 08             	mov    0x8(%ebp),%eax
c010126c:	8b 40 0c             	mov    0xc(%eax),%eax
c010126f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101272:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101275:	05 ff 01 00 00       	add    $0x1ff,%eax
c010127a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0101280:	85 c0                	test   %eax,%eax
c0101282:	0f 48 c2             	cmovs  %edx,%eax
c0101285:	c1 f8 09             	sar    $0x9,%eax
c0101288:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010128b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010128e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101291:	8b 45 08             	mov    0x8(%ebp),%eax
c0101294:	8b 40 10             	mov    0x10(%eax),%eax
c0101297:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010129a:	8b 45 08             	mov    0x8(%ebp),%eax
c010129d:	8b 00                	mov    (%eax),%eax
c010129f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01012a2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012a5:	83 ec 08             	sub    $0x8,%esp
c01012a8:	50                   	push   %eax
c01012a9:	ff 75 d0             	pushl  -0x30(%ebp)
c01012ac:	e8 de 4b 00 00       	call   c0105e8f <alloc_virtual_memory>
c01012b1:	83 c4 10             	add    $0x10,%esp
c01012b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01012b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01012ba:	8b 40 78             	mov    0x78(%eax),%eax
c01012bd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01012c0:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01012c4:	74 22                	je     c01012e8 <hd_rdwt+0x133>
c01012c6:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01012ca:	74 1c                	je     c01012e8 <hd_rdwt+0x133>
c01012cc:	68 b7 01 00 00       	push   $0x1b7
c01012d1:	68 34 b1 10 c0       	push   $0xc010b134
c01012d6:	68 34 b1 10 c0       	push   $0xc010b134
c01012db:	68 f6 b1 10 c0       	push   $0xc010b1f6
c01012e0:	e8 30 76 00 00       	call   c0108915 <assertion_failure>
c01012e5:	83 c4 10             	add    $0x10,%esp
c01012e8:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c01012ec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01012ef:	88 45 be             	mov    %al,-0x42(%ebp)
c01012f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01012f5:	88 45 bf             	mov    %al,-0x41(%ebp)
c01012f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01012fb:	c1 f8 08             	sar    $0x8,%eax
c01012fe:	88 45 c0             	mov    %al,-0x40(%ebp)
c0101301:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101304:	c1 f8 10             	sar    $0x10,%eax
c0101307:	88 45 c1             	mov    %al,-0x3f(%ebp)
c010130a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010130d:	c1 f8 18             	sar    $0x18,%eax
c0101310:	83 e0 0f             	and    $0xf,%eax
c0101313:	83 c8 e0             	or     $0xffffffe0,%eax
c0101316:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0101319:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c010131d:	75 07                	jne    c0101326 <hd_rdwt+0x171>
c010131f:	b8 20 00 00 00       	mov    $0x20,%eax
c0101324:	eb 05                	jmp    c010132b <hd_rdwt+0x176>
c0101326:	b8 30 00 00 00       	mov    $0x30,%eax
c010132b:	88 45 c3             	mov    %al,-0x3d(%ebp)
c010132e:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101332:	3c 20                	cmp    $0x20,%al
c0101334:	74 24                	je     c010135a <hd_rdwt+0x1a5>
c0101336:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010133a:	3c 30                	cmp    $0x30,%al
c010133c:	74 1c                	je     c010135a <hd_rdwt+0x1a5>
c010133e:	68 c5 01 00 00       	push   $0x1c5
c0101343:	68 34 b1 10 c0       	push   $0xc010b134
c0101348:	68 34 b1 10 c0       	push   $0xc010b134
c010134d:	68 14 b2 10 c0       	push   $0xc010b214
c0101352:	e8 be 75 00 00       	call   c0108915 <assertion_failure>
c0101357:	83 c4 10             	add    $0x10,%esp
c010135a:	83 ec 0c             	sub    $0xc,%esp
c010135d:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0101360:	50                   	push   %eax
c0101361:	e8 ca f5 ff ff       	call   c0100930 <hd_cmd_out>
c0101366:	83 c4 10             	add    $0x10,%esp
c0101369:	e9 9c 00 00 00       	jmp    c010140a <hd_rdwt+0x255>
c010136e:	b8 00 02 00 00       	mov    $0x200,%eax
c0101373:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c010137a:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c010137e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0101381:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101385:	75 51                	jne    c01013d8 <hd_rdwt+0x223>
c0101387:	e8 a8 fd ff ff       	call   c0101134 <wait_for>
c010138c:	e8 d4 fd ff ff       	call   c0101165 <interrupt_wait>
c0101391:	83 ec 04             	sub    $0x4,%esp
c0101394:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101397:	6a 00                	push   $0x0
c0101399:	68 80 11 11 c0       	push   $0xc0111180
c010139e:	e8 2c ae 00 00       	call   c010c1cf <Memset>
c01013a3:	83 c4 10             	add    $0x10,%esp
c01013a6:	83 ec 04             	sub    $0x4,%esp
c01013a9:	68 00 02 00 00       	push   $0x200
c01013ae:	68 80 11 11 c0       	push   $0xc0111180
c01013b3:	68 f0 01 00 00       	push   $0x1f0
c01013b8:	e8 66 ae 00 00       	call   c010c223 <read_port>
c01013bd:	83 c4 10             	add    $0x10,%esp
c01013c0:	83 ec 04             	sub    $0x4,%esp
c01013c3:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013c6:	68 80 11 11 c0       	push   $0xc0111180
c01013cb:	ff 75 f0             	pushl  -0x10(%ebp)
c01013ce:	e8 29 59 00 00       	call   c0106cfc <Memcpy>
c01013d3:	83 c4 10             	add    $0x10,%esp
c01013d6:	eb 26                	jmp    c01013fe <hd_rdwt+0x249>
c01013d8:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01013dc:	75 20                	jne    c01013fe <hd_rdwt+0x249>
c01013de:	e8 51 fd ff ff       	call   c0101134 <wait_for>
c01013e3:	83 ec 04             	sub    $0x4,%esp
c01013e6:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013e9:	ff 75 f0             	pushl  -0x10(%ebp)
c01013ec:	68 f0 01 00 00       	push   $0x1f0
c01013f1:	e8 41 ae 00 00       	call   c010c237 <write_port>
c01013f6:	83 c4 10             	add    $0x10,%esp
c01013f9:	e8 67 fd ff ff       	call   c0101165 <interrupt_wait>
c01013fe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101401:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101404:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101407:	01 45 f0             	add    %eax,-0x10(%ebp)
c010140a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010140e:	0f 85 5a ff ff ff    	jne    c010136e <hd_rdwt+0x1b9>
c0101414:	83 ec 04             	sub    $0x4,%esp
c0101417:	6a 7c                	push   $0x7c
c0101419:	6a 00                	push   $0x0
c010141b:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101421:	50                   	push   %eax
c0101422:	e8 a8 ad 00 00       	call   c010c1cf <Memset>
c0101427:	83 c4 10             	add    $0x10,%esp
c010142a:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0101431:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101438:	00 00 00 
c010143b:	83 ec 04             	sub    $0x4,%esp
c010143e:	6a 02                	push   $0x2
c0101440:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101446:	50                   	push   %eax
c0101447:	6a 01                	push   $0x1
c0101449:	e8 37 81 00 00       	call   c0109585 <send_rec>
c010144e:	83 c4 10             	add    $0x10,%esp
c0101451:	90                   	nop
c0101452:	c9                   	leave  
c0101453:	c3                   	ret    

c0101454 <hd_handler>:
c0101454:	55                   	push   %ebp
c0101455:	89 e5                	mov    %esp,%ebp
c0101457:	83 ec 18             	sub    $0x18,%esp
c010145a:	83 ec 0c             	sub    $0xc,%esp
c010145d:	68 f7 01 00 00       	push   $0x1f7
c0101462:	e8 7d ee ff ff       	call   c01002e4 <in_byte>
c0101467:	83 c4 10             	add    $0x10,%esp
c010146a:	0f b6 c0             	movzbl %al,%eax
c010146d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101470:	83 ec 0c             	sub    $0xc,%esp
c0101473:	6a 03                	push   $0x3
c0101475:	e8 a5 83 00 00       	call   c010981f <inform_int>
c010147a:	83 c4 10             	add    $0x10,%esp
c010147d:	90                   	nop
c010147e:	c9                   	leave  
c010147f:	c3                   	ret    

c0101480 <net_handler>:
c0101480:	55                   	push   %ebp
c0101481:	89 e5                	mov    %esp,%ebp
c0101483:	83 ec 08             	sub    $0x8,%esp
c0101486:	83 ec 0c             	sub    $0xc,%esp
c0101489:	68 48 b2 10 c0       	push   $0xc010b248
c010148e:	e8 25 71 00 00       	call   c01085b8 <Printf>
c0101493:	83 c4 10             	add    $0x10,%esp
c0101496:	66 87 db             	xchg   %bx,%bx
c0101499:	90                   	nop
c010149a:	c9                   	leave  
c010149b:	c3                   	ret    

c010149c <waitfor>:
c010149c:	55                   	push   %ebp
c010149d:	89 e5                	mov    %esp,%ebp
c010149f:	83 ec 18             	sub    $0x18,%esp
c01014a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01014a9:	eb 26                	jmp    c01014d1 <waitfor+0x35>
c01014ab:	83 ec 0c             	sub    $0xc,%esp
c01014ae:	68 f7 01 00 00       	push   $0x1f7
c01014b3:	e8 2c ee ff ff       	call   c01002e4 <in_byte>
c01014b8:	83 c4 10             	add    $0x10,%esp
c01014bb:	0f b6 c0             	movzbl %al,%eax
c01014be:	23 45 08             	and    0x8(%ebp),%eax
c01014c1:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01014c4:	75 07                	jne    c01014cd <waitfor+0x31>
c01014c6:	b8 01 00 00 00       	mov    $0x1,%eax
c01014cb:	eb 11                	jmp    c01014de <waitfor+0x42>
c01014cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01014d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01014d4:	3b 45 10             	cmp    0x10(%ebp),%eax
c01014d7:	7c d2                	jl     c01014ab <waitfor+0xf>
c01014d9:	b8 00 00 00 00       	mov    $0x0,%eax
c01014de:	c9                   	leave  
c01014df:	c3                   	ret    

c01014e0 <print_hd_info>:
c01014e0:	55                   	push   %ebp
c01014e1:	89 e5                	mov    %esp,%ebp
c01014e3:	83 ec 18             	sub    $0x18,%esp
c01014e6:	83 ec 0c             	sub    $0xc,%esp
c01014e9:	68 6a b2 10 c0       	push   $0xc010b26a
c01014ee:	e8 c5 70 00 00       	call   c01085b8 <Printf>
c01014f3:	83 c4 10             	add    $0x10,%esp
c01014f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01014fd:	eb 3b                	jmp    c010153a <print_hd_info+0x5a>
c01014ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101502:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101509:	85 c0                	test   %eax,%eax
c010150b:	74 28                	je     c0101535 <print_hd_info+0x55>
c010150d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101510:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101517:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010151a:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101521:	ff 75 f4             	pushl  -0xc(%ebp)
c0101524:	52                   	push   %edx
c0101525:	50                   	push   %eax
c0101526:	68 87 b2 10 c0       	push   $0xc010b287
c010152b:	e8 88 70 00 00       	call   c01085b8 <Printf>
c0101530:	83 c4 10             	add    $0x10,%esp
c0101533:	eb 01                	jmp    c0101536 <print_hd_info+0x56>
c0101535:	90                   	nop
c0101536:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010153a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c010153e:	7e bf                	jle    c01014ff <print_hd_info+0x1f>
c0101540:	83 ec 0c             	sub    $0xc,%esp
c0101543:	68 9f b2 10 c0       	push   $0xc010b29f
c0101548:	e8 6b 70 00 00       	call   c01085b8 <Printf>
c010154d:	83 c4 10             	add    $0x10,%esp
c0101550:	83 ec 0c             	sub    $0xc,%esp
c0101553:	68 ba b2 10 c0       	push   $0xc010b2ba
c0101558:	e8 5b 70 00 00       	call   c01085b8 <Printf>
c010155d:	83 c4 10             	add    $0x10,%esp
c0101560:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0101567:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010156e:	eb 44                	jmp    c01015b4 <print_hd_info+0xd4>
c0101570:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101573:	83 c0 04             	add    $0x4,%eax
c0101576:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c010157d:	85 c0                	test   %eax,%eax
c010157f:	74 2e                	je     c01015af <print_hd_info+0xcf>
c0101581:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101584:	83 c0 04             	add    $0x4,%eax
c0101587:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c010158e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101591:	83 c0 04             	add    $0x4,%eax
c0101594:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c010159b:	ff 75 f0             	pushl  -0x10(%ebp)
c010159e:	52                   	push   %edx
c010159f:	50                   	push   %eax
c01015a0:	68 87 b2 10 c0       	push   $0xc010b287
c01015a5:	e8 0e 70 00 00       	call   c01085b8 <Printf>
c01015aa:	83 c4 10             	add    $0x10,%esp
c01015ad:	eb 01                	jmp    c01015b0 <print_hd_info+0xd0>
c01015af:	90                   	nop
c01015b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01015b4:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01015b8:	7e b6                	jle    c0101570 <print_hd_info+0x90>
c01015ba:	83 ec 0c             	sub    $0xc,%esp
c01015bd:	68 d7 b2 10 c0       	push   $0xc010b2d7
c01015c2:	e8 f1 6f 00 00       	call   c01085b8 <Printf>
c01015c7:	83 c4 10             	add    $0x10,%esp
c01015ca:	90                   	nop
c01015cb:	c9                   	leave  
c01015cc:	c3                   	ret    

c01015cd <is_empty>:
c01015cd:	55                   	push   %ebp
c01015ce:	89 e5                	mov    %esp,%ebp
c01015d0:	83 ec 10             	sub    $0x10,%esp
c01015d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01015da:	eb 1a                	jmp    c01015f6 <is_empty+0x29>
c01015dc:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01015df:	8b 45 08             	mov    0x8(%ebp),%eax
c01015e2:	01 d0                	add    %edx,%eax
c01015e4:	0f b6 00             	movzbl (%eax),%eax
c01015e7:	84 c0                	test   %al,%al
c01015e9:	74 07                	je     c01015f2 <is_empty+0x25>
c01015eb:	b8 00 00 00 00       	mov    $0x0,%eax
c01015f0:	eb 11                	jmp    c0101603 <is_empty+0x36>
c01015f2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01015f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01015f9:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01015fc:	7c de                	jl     c01015dc <is_empty+0xf>
c01015fe:	b8 01 00 00 00       	mov    $0x1,%eax
c0101603:	c9                   	leave  
c0101604:	c3                   	ret    
c0101605:	66 90                	xchg   %ax,%ax
c0101607:	66 90                	xchg   %ax,%ax
c0101609:	66 90                	xchg   %ax,%ax
c010160b:	66 90                	xchg   %ax,%ax
c010160d:	66 90                	xchg   %ax,%ax
c010160f:	90                   	nop

c0101610 <write_debug>:
c0101610:	b8 02 00 00 00       	mov    $0x2,%eax
c0101615:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101619:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010161d:	cd 90                	int    $0x90
c010161f:	c3                   	ret    

c0101620 <send_msg>:
c0101620:	55                   	push   %ebp
c0101621:	89 e5                	mov    %esp,%ebp
c0101623:	53                   	push   %ebx
c0101624:	51                   	push   %ecx
c0101625:	b8 03 00 00 00       	mov    $0x3,%eax
c010162a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010162d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101630:	cd 90                	int    $0x90
c0101632:	59                   	pop    %ecx
c0101633:	5b                   	pop    %ebx
c0101634:	5d                   	pop    %ebp
c0101635:	c3                   	ret    

c0101636 <receive_msg>:
c0101636:	55                   	push   %ebp
c0101637:	89 e5                	mov    %esp,%ebp
c0101639:	53                   	push   %ebx
c010163a:	51                   	push   %ecx
c010163b:	b8 04 00 00 00       	mov    $0x4,%eax
c0101640:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101643:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101646:	cd 90                	int    $0x90
c0101648:	59                   	pop    %ecx
c0101649:	5b                   	pop    %ebx
c010164a:	5d                   	pop    %ebp
c010164b:	c3                   	ret    

c010164c <sys_malloc>:
c010164c:	56                   	push   %esi
c010164d:	57                   	push   %edi
c010164e:	53                   	push   %ebx
c010164f:	55                   	push   %ebp
c0101650:	89 e5                	mov    %esp,%ebp
c0101652:	b8 05 00 00 00       	mov    $0x5,%eax
c0101657:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010165a:	cd 90                	int    $0x90
c010165c:	5d                   	pop    %ebp
c010165d:	5b                   	pop    %ebx
c010165e:	5f                   	pop    %edi
c010165f:	5e                   	pop    %esi
c0101660:	c3                   	ret    

c0101661 <sys_free>:
c0101661:	56                   	push   %esi
c0101662:	57                   	push   %edi
c0101663:	53                   	push   %ebx
c0101664:	55                   	push   %ebp
c0101665:	89 e5                	mov    %esp,%ebp
c0101667:	b8 06 00 00 00       	mov    $0x6,%eax
c010166c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010166f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0101672:	cd 90                	int    $0x90
c0101674:	5d                   	pop    %ebp
c0101675:	5b                   	pop    %ebx
c0101676:	5f                   	pop    %edi
c0101677:	5e                   	pop    %esi
c0101678:	c3                   	ret    

c0101679 <task_fs>:
c0101679:	55                   	push   %ebp
c010167a:	89 e5                	mov    %esp,%ebp
c010167c:	83 ec 28             	sub    $0x28,%esp
c010167f:	e8 bb 08 00 00       	call   c0101f3f <init_fs>
c0101684:	83 ec 0c             	sub    $0xc,%esp
c0101687:	6a 7c                	push   $0x7c
c0101689:	e8 be ff ff ff       	call   c010164c <sys_malloc>
c010168e:	83 c4 10             	add    $0x10,%esp
c0101691:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101694:	83 ec 0c             	sub    $0xc,%esp
c0101697:	6a 7c                	push   $0x7c
c0101699:	e8 ae ff ff ff       	call   c010164c <sys_malloc>
c010169e:	83 c4 10             	add    $0x10,%esp
c01016a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01016a4:	83 ec 04             	sub    $0x4,%esp
c01016a7:	6a 7c                	push   $0x7c
c01016a9:	6a 00                	push   $0x0
c01016ab:	ff 75 f4             	pushl  -0xc(%ebp)
c01016ae:	e8 1c ab 00 00       	call   c010c1cf <Memset>
c01016b3:	83 c4 10             	add    $0x10,%esp
c01016b6:	83 ec 04             	sub    $0x4,%esp
c01016b9:	6a 12                	push   $0x12
c01016bb:	ff 75 f4             	pushl  -0xc(%ebp)
c01016be:	6a 02                	push   $0x2
c01016c0:	e8 c0 7e 00 00       	call   c0109585 <send_rec>
c01016c5:	83 c4 10             	add    $0x10,%esp
c01016c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016cb:	8b 40 78             	mov    0x78(%eax),%eax
c01016ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01016d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016d4:	8b 00                	mov    (%eax),%eax
c01016d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01016d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016dc:	8b 40 50             	mov    0x50(%eax),%eax
c01016df:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01016e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016e5:	8b 40 68             	mov    0x68(%eax),%eax
c01016e8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01016eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016ee:	8b 00                	mov    (%eax),%eax
c01016f0:	85 c0                	test   %eax,%eax
c01016f2:	75 07                	jne    c01016fb <task_fs+0x82>
c01016f4:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c01016fb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101702:	83 ec 0c             	sub    $0xc,%esp
c0101705:	ff 75 e8             	pushl  -0x18(%ebp)
c0101708:	e8 39 21 00 00       	call   c0103846 <pid2proc>
c010170d:	83 c4 10             	add    $0x10,%esp
c0101710:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101715:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101719:	74 37                	je     c0101752 <task_fs+0xd9>
c010171b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010171f:	74 31                	je     c0101752 <task_fs+0xd9>
c0101721:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101725:	74 2b                	je     c0101752 <task_fs+0xd9>
c0101727:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010172b:	74 25                	je     c0101752 <task_fs+0xd9>
c010172d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101731:	74 1f                	je     c0101752 <task_fs+0xd9>
c0101733:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101737:	74 19                	je     c0101752 <task_fs+0xd9>
c0101739:	6a 7a                	push   $0x7a
c010173b:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101740:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101745:	68 08 b3 10 c0       	push   $0xc010b308
c010174a:	e8 c6 71 00 00       	call   c0108915 <assertion_failure>
c010174f:	83 c4 10             	add    $0x10,%esp
c0101752:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101756:	74 3a                	je     c0101792 <task_fs+0x119>
c0101758:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010175c:	7f 19                	jg     c0101777 <task_fs+0xfe>
c010175e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101762:	0f 84 10 01 00 00    	je     c0101878 <task_fs+0x1ff>
c0101768:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010176c:	0f 84 a1 00 00 00    	je     c0101813 <task_fs+0x19a>
c0101772:	e9 ef 00 00 00       	jmp    c0101866 <task_fs+0x1ed>
c0101777:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c010177b:	74 50                	je     c01017cd <task_fs+0x154>
c010177d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101781:	0f 84 c6 00 00 00    	je     c010184d <task_fs+0x1d4>
c0101787:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010178b:	74 40                	je     c01017cd <task_fs+0x154>
c010178d:	e9 d4 00 00 00       	jmp    c0101866 <task_fs+0x1ed>
c0101792:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101795:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010179c:	83 ec 0c             	sub    $0xc,%esp
c010179f:	ff 75 f4             	pushl  -0xc(%ebp)
c01017a2:	e8 ec 07 00 00       	call   c0101f93 <do_open>
c01017a7:	83 c4 10             	add    $0x10,%esp
c01017aa:	89 c2                	mov    %eax,%edx
c01017ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017af:	89 50 50             	mov    %edx,0x50(%eax)
c01017b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017b5:	8b 00                	mov    (%eax),%eax
c01017b7:	83 ec 04             	sub    $0x4,%esp
c01017ba:	50                   	push   %eax
c01017bb:	ff 75 f4             	pushl  -0xc(%ebp)
c01017be:	6a 01                	push   $0x1
c01017c0:	e8 c0 7d 00 00       	call   c0109585 <send_rec>
c01017c5:	83 c4 10             	add    $0x10,%esp
c01017c8:	e9 b2 00 00 00       	jmp    c010187f <task_fs+0x206>
c01017cd:	83 ec 0c             	sub    $0xc,%esp
c01017d0:	ff 75 f4             	pushl  -0xc(%ebp)
c01017d3:	e8 19 19 00 00       	call   c01030f1 <do_rdwt>
c01017d8:	83 c4 10             	add    $0x10,%esp
c01017db:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01017de:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c01017e2:	0f 84 96 00 00 00    	je     c010187e <task_fs+0x205>
c01017e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017eb:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01017f2:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01017f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017f8:	89 50 60             	mov    %edx,0x60(%eax)
c01017fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017fe:	8b 00                	mov    (%eax),%eax
c0101800:	83 ec 04             	sub    $0x4,%esp
c0101803:	50                   	push   %eax
c0101804:	ff 75 f4             	pushl  -0xc(%ebp)
c0101807:	6a 01                	push   $0x1
c0101809:	e8 77 7d 00 00       	call   c0109585 <send_rec>
c010180e:	83 c4 10             	add    $0x10,%esp
c0101811:	eb 6b                	jmp    c010187e <task_fs+0x205>
c0101813:	83 ec 0c             	sub    $0xc,%esp
c0101816:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101819:	e8 f0 1d 00 00       	call   c010360e <do_close>
c010181e:	83 c4 10             	add    $0x10,%esp
c0101821:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101824:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010182b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010182e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101835:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101838:	8b 00                	mov    (%eax),%eax
c010183a:	83 ec 04             	sub    $0x4,%esp
c010183d:	50                   	push   %eax
c010183e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101841:	6a 01                	push   $0x1
c0101843:	e8 3d 7d 00 00       	call   c0109585 <send_rec>
c0101848:	83 c4 10             	add    $0x10,%esp
c010184b:	eb 32                	jmp    c010187f <task_fs+0x206>
c010184d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101850:	8b 40 68             	mov    0x68(%eax),%eax
c0101853:	83 ec 04             	sub    $0x4,%esp
c0101856:	50                   	push   %eax
c0101857:	ff 75 f4             	pushl  -0xc(%ebp)
c010185a:	6a 01                	push   $0x1
c010185c:	e8 24 7d 00 00       	call   c0109585 <send_rec>
c0101861:	83 c4 10             	add    $0x10,%esp
c0101864:	eb 19                	jmp    c010187f <task_fs+0x206>
c0101866:	83 ec 0c             	sub    $0xc,%esp
c0101869:	68 6b b3 10 c0       	push   $0xc010b36b
c010186e:	e8 84 70 00 00       	call   c01088f7 <panic>
c0101873:	83 c4 10             	add    $0x10,%esp
c0101876:	eb 07                	jmp    c010187f <task_fs+0x206>
c0101878:	90                   	nop
c0101879:	e9 26 fe ff ff       	jmp    c01016a4 <task_fs+0x2b>
c010187e:	90                   	nop
c010187f:	e9 20 fe ff ff       	jmp    c01016a4 <task_fs+0x2b>

c0101884 <rd_wt>:
c0101884:	55                   	push   %ebp
c0101885:	89 e5                	mov    %esp,%ebp
c0101887:	83 ec 18             	sub    $0x18,%esp
c010188a:	83 ec 0c             	sub    $0xc,%esp
c010188d:	6a 7c                	push   $0x7c
c010188f:	e8 b8 fd ff ff       	call   c010164c <sys_malloc>
c0101894:	83 c4 10             	add    $0x10,%esp
c0101897:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010189a:	83 ec 04             	sub    $0x4,%esp
c010189d:	6a 7c                	push   $0x7c
c010189f:	6a 00                	push   $0x0
c01018a1:	ff 75 f4             	pushl  -0xc(%ebp)
c01018a4:	e8 26 a9 00 00       	call   c010c1cf <Memset>
c01018a9:	83 c4 10             	add    $0x10,%esp
c01018ac:	8b 55 18             	mov    0x18(%ebp),%edx
c01018af:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018b2:	89 50 78             	mov    %edx,0x78(%eax)
c01018b5:	8b 55 0c             	mov    0xc(%ebp),%edx
c01018b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018bb:	89 50 14             	mov    %edx,0x14(%eax)
c01018be:	8b 55 10             	mov    0x10(%ebp),%edx
c01018c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018c4:	89 50 10             	mov    %edx,0x10(%eax)
c01018c7:	8b 55 14             	mov    0x14(%ebp),%edx
c01018ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018cd:	89 50 0c             	mov    %edx,0xc(%eax)
c01018d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01018d3:	c1 e0 09             	shl    $0x9,%eax
c01018d6:	89 c2                	mov    %eax,%edx
c01018d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018db:	89 50 18             	mov    %edx,0x18(%eax)
c01018de:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c01018e2:	74 22                	je     c0101906 <rd_wt+0x82>
c01018e4:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c01018e8:	74 1c                	je     c0101906 <rd_wt+0x82>
c01018ea:	68 b1 00 00 00       	push   $0xb1
c01018ef:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01018f4:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01018f9:	68 7e b3 10 c0       	push   $0xc010b37e
c01018fe:	e8 12 70 00 00       	call   c0108915 <assertion_failure>
c0101903:	83 c4 10             	add    $0x10,%esp
c0101906:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101909:	8b 40 78             	mov    0x78(%eax),%eax
c010190c:	83 f8 07             	cmp    $0x7,%eax
c010190f:	74 27                	je     c0101938 <rd_wt+0xb4>
c0101911:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101914:	8b 40 78             	mov    0x78(%eax),%eax
c0101917:	83 f8 0a             	cmp    $0xa,%eax
c010191a:	74 1c                	je     c0101938 <rd_wt+0xb4>
c010191c:	68 b2 00 00 00       	push   $0xb2
c0101921:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101926:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010192b:	68 9c b3 10 c0       	push   $0xc010b39c
c0101930:	e8 e0 6f 00 00       	call   c0108915 <assertion_failure>
c0101935:	83 c4 10             	add    $0x10,%esp
c0101938:	83 ec 04             	sub    $0x4,%esp
c010193b:	6a 03                	push   $0x3
c010193d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101940:	6a 03                	push   $0x3
c0101942:	e8 3e 7c 00 00       	call   c0109585 <send_rec>
c0101947:	83 c4 10             	add    $0x10,%esp
c010194a:	83 ec 08             	sub    $0x8,%esp
c010194d:	6a 7c                	push   $0x7c
c010194f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101952:	e8 0a fd ff ff       	call   c0101661 <sys_free>
c0101957:	83 c4 10             	add    $0x10,%esp
c010195a:	90                   	nop
c010195b:	c9                   	leave  
c010195c:	c3                   	ret    

c010195d <mkfs>:
c010195d:	55                   	push   %ebp
c010195e:	89 e5                	mov    %esp,%ebp
c0101960:	57                   	push   %edi
c0101961:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101967:	83 ec 0c             	sub    $0xc,%esp
c010196a:	68 00 80 00 00       	push   $0x8000
c010196f:	e8 d8 fc ff ff       	call   c010164c <sys_malloc>
c0101974:	83 c4 10             	add    $0x10,%esp
c0101977:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c010197c:	83 ec 0c             	sub    $0xc,%esp
c010197f:	6a 24                	push   $0x24
c0101981:	e8 c6 fc ff ff       	call   c010164c <sys_malloc>
c0101986:	83 c4 10             	add    $0x10,%esp
c0101989:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c010198e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101993:	83 ec 0c             	sub    $0xc,%esp
c0101996:	50                   	push   %eax
c0101997:	e8 42 46 00 00       	call   c0105fde <get_physical_address>
c010199c:	83 c4 10             	add    $0x10,%esp
c010199f:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c01019a4:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01019a9:	83 ec 0c             	sub    $0xc,%esp
c01019ac:	50                   	push   %eax
c01019ad:	e8 2c 46 00 00       	call   c0105fde <get_physical_address>
c01019b2:	83 c4 10             	add    $0x10,%esp
c01019b5:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c01019ba:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019bf:	83 ec 04             	sub    $0x4,%esp
c01019c2:	68 00 02 00 00       	push   $0x200
c01019c7:	6a 00                	push   $0x0
c01019c9:	50                   	push   %eax
c01019ca:	e8 00 a8 00 00       	call   c010c1cf <Memset>
c01019cf:	83 c4 10             	add    $0x10,%esp
c01019d2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019d7:	83 ec 0c             	sub    $0xc,%esp
c01019da:	6a 0a                	push   $0xa
c01019dc:	68 00 02 00 00       	push   $0x200
c01019e1:	50                   	push   %eax
c01019e2:	6a 20                	push   $0x20
c01019e4:	6a 00                	push   $0x0
c01019e6:	e8 99 fe ff ff       	call   c0101884 <rd_wt>
c01019eb:	83 c4 20             	add    $0x20,%esp
c01019ee:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019f3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01019f6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019f9:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101a00:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a03:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0101a0a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a0d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101a14:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a17:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101a1e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a21:	8b 40 04             	mov    0x4(%eax),%eax
c0101a24:	8d 50 02             	lea    0x2(%eax),%edx
c0101a27:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a2a:	8b 40 08             	mov    0x8(%eax),%eax
c0101a2d:	01 c2                	add    %eax,%edx
c0101a2f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a32:	8b 40 0c             	mov    0xc(%eax),%eax
c0101a35:	01 c2                	add    %eax,%edx
c0101a37:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a3a:	89 10                	mov    %edx,(%eax)
c0101a3c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101a43:	b8 00 02 00 00       	mov    $0x200,%eax
c0101a48:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101a4b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101a51:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101a54:	01 ca                	add    %ecx,%edx
c0101a56:	83 ec 04             	sub    $0x4,%esp
c0101a59:	50                   	push   %eax
c0101a5a:	6a 80                	push   $0xffffff80
c0101a5c:	52                   	push   %edx
c0101a5d:	e8 6d a7 00 00       	call   c010c1cf <Memset>
c0101a62:	83 c4 10             	add    $0x10,%esp
c0101a65:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a6a:	83 ec 0c             	sub    $0xc,%esp
c0101a6d:	6a 0a                	push   $0xa
c0101a6f:	68 00 02 00 00       	push   $0x200
c0101a74:	50                   	push   %eax
c0101a75:	6a 20                	push   $0x20
c0101a77:	6a 01                	push   $0x1
c0101a79:	e8 06 fe ff ff       	call   c0101884 <rd_wt>
c0101a7e:	83 c4 20             	add    $0x20,%esp
c0101a81:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a84:	8b 10                	mov    (%eax),%edx
c0101a86:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101a89:	8b 50 04             	mov    0x4(%eax),%edx
c0101a8c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101a8f:	8b 50 08             	mov    0x8(%eax),%edx
c0101a92:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101a95:	8b 50 0c             	mov    0xc(%eax),%edx
c0101a98:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101a9b:	8b 50 10             	mov    0x10(%eax),%edx
c0101a9e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101aa1:	8b 50 14             	mov    0x14(%eax),%edx
c0101aa4:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101aa7:	8b 50 18             	mov    0x18(%eax),%edx
c0101aaa:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101aad:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101ab0:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101ab3:	8b 40 20             	mov    0x20(%eax),%eax
c0101ab6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101ab9:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101abd:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101ac1:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ac6:	83 ec 04             	sub    $0x4,%esp
c0101ac9:	6a 01                	push   $0x1
c0101acb:	52                   	push   %edx
c0101acc:	50                   	push   %eax
c0101acd:	e8 fd a6 00 00       	call   c010c1cf <Memset>
c0101ad2:	83 c4 10             	add    $0x10,%esp
c0101ad5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ada:	83 c0 01             	add    $0x1,%eax
c0101add:	83 ec 04             	sub    $0x4,%esp
c0101ae0:	68 ff 01 00 00       	push   $0x1ff
c0101ae5:	6a 80                	push   $0xffffff80
c0101ae7:	50                   	push   %eax
c0101ae8:	e8 e2 a6 00 00       	call   c010c1cf <Memset>
c0101aed:	83 c4 10             	add    $0x10,%esp
c0101af0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101af5:	83 ec 0c             	sub    $0xc,%esp
c0101af8:	6a 0a                	push   $0xa
c0101afa:	68 00 02 00 00       	push   $0x200
c0101aff:	50                   	push   %eax
c0101b00:	6a 20                	push   $0x20
c0101b02:	6a 02                	push   $0x2
c0101b04:	e8 7b fd ff ff       	call   c0101884 <rd_wt>
c0101b09:	83 c4 20             	add    $0x20,%esp
c0101b0c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101b13:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b18:	83 ec 04             	sub    $0x4,%esp
c0101b1b:	68 00 02 00 00       	push   $0x200
c0101b20:	6a ff                	push   $0xffffffff
c0101b22:	50                   	push   %eax
c0101b23:	e8 a7 a6 00 00       	call   c010c1cf <Memset>
c0101b28:	83 c4 10             	add    $0x10,%esp
c0101b2b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b30:	83 ec 0c             	sub    $0xc,%esp
c0101b33:	6a 0a                	push   $0xa
c0101b35:	68 00 02 00 00       	push   $0x200
c0101b3a:	50                   	push   %eax
c0101b3b:	6a 20                	push   $0x20
c0101b3d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101b40:	e8 3f fd ff ff       	call   c0101884 <rd_wt>
c0101b45:	83 c4 20             	add    $0x20,%esp
c0101b48:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b4d:	83 ec 04             	sub    $0x4,%esp
c0101b50:	6a 01                	push   $0x1
c0101b52:	6a 01                	push   $0x1
c0101b54:	50                   	push   %eax
c0101b55:	e8 75 a6 00 00       	call   c010c1cf <Memset>
c0101b5a:	83 c4 10             	add    $0x10,%esp
c0101b5d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b62:	83 c0 01             	add    $0x1,%eax
c0101b65:	83 ec 04             	sub    $0x4,%esp
c0101b68:	68 ff 01 00 00       	push   $0x1ff
c0101b6d:	6a 00                	push   $0x0
c0101b6f:	50                   	push   %eax
c0101b70:	e8 5a a6 00 00       	call   c010c1cf <Memset>
c0101b75:	83 c4 10             	add    $0x10,%esp
c0101b78:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b7d:	89 c2                	mov    %eax,%edx
c0101b7f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101b82:	83 c0 01             	add    $0x1,%eax
c0101b85:	83 ec 0c             	sub    $0xc,%esp
c0101b88:	6a 0a                	push   $0xa
c0101b8a:	68 00 02 00 00       	push   $0x200
c0101b8f:	52                   	push   %edx
c0101b90:	6a 20                	push   $0x20
c0101b92:	50                   	push   %eax
c0101b93:	e8 ec fc ff ff       	call   c0101884 <rd_wt>
c0101b98:	83 c4 20             	add    $0x20,%esp
c0101b9b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101b9e:	83 e8 02             	sub    $0x2,%eax
c0101ba1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101ba4:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101bab:	eb 04                	jmp    c0101bb1 <mkfs+0x254>
c0101bad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101bb1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101bb4:	83 c0 01             	add    $0x1,%eax
c0101bb7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101bba:	7e f1                	jle    c0101bad <mkfs+0x250>
c0101bbc:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101bc1:	89 c2                	mov    %eax,%edx
c0101bc3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101bc6:	83 c0 03             	add    $0x3,%eax
c0101bc9:	83 ec 0c             	sub    $0xc,%esp
c0101bcc:	6a 0a                	push   $0xa
c0101bce:	68 00 02 00 00       	push   $0x200
c0101bd3:	52                   	push   %edx
c0101bd4:	6a 20                	push   $0x20
c0101bd6:	50                   	push   %eax
c0101bd7:	e8 a8 fc ff ff       	call   c0101884 <rd_wt>
c0101bdc:	83 c4 20             	add    $0x20,%esp
c0101bdf:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101be4:	89 c2                	mov    %eax,%edx
c0101be6:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101be9:	83 c0 03             	add    $0x3,%eax
c0101bec:	83 ec 0c             	sub    $0xc,%esp
c0101bef:	6a 07                	push   $0x7
c0101bf1:	68 00 02 00 00       	push   $0x200
c0101bf6:	52                   	push   %edx
c0101bf7:	6a 20                	push   $0x20
c0101bf9:	50                   	push   %eax
c0101bfa:	e8 85 fc ff ff       	call   c0101884 <rd_wt>
c0101bff:	83 c4 20             	add    $0x20,%esp
c0101c02:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c07:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101c0a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c0d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101c13:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c16:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101c1d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101c20:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c23:	89 50 08             	mov    %edx,0x8(%eax)
c0101c26:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c29:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101c30:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c33:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101c3a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c3d:	8b 10                	mov    (%eax),%edx
c0101c3f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101c45:	8b 50 04             	mov    0x4(%eax),%edx
c0101c48:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101c4e:	8b 50 08             	mov    0x8(%eax),%edx
c0101c51:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101c57:	8b 50 0c             	mov    0xc(%eax),%edx
c0101c5a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101c60:	8b 50 10             	mov    0x10(%eax),%edx
c0101c63:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101c69:	8b 50 14             	mov    0x14(%eax),%edx
c0101c6c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101c72:	8b 50 18             	mov    0x18(%eax),%edx
c0101c75:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101c7b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101c7e:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101c84:	8b 50 20             	mov    0x20(%eax),%edx
c0101c87:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101c8d:	8b 40 24             	mov    0x24(%eax),%eax
c0101c90:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101c95:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101c9c:	eb 4c                	jmp    c0101cea <mkfs+0x38d>
c0101c9e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ca3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101ca6:	83 c2 01             	add    $0x1,%edx
c0101ca9:	c1 e2 05             	shl    $0x5,%edx
c0101cac:	01 d0                	add    %edx,%eax
c0101cae:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101cb1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cb4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101cba:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cbd:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101cc4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cc7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101cce:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101cd5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101cd8:	c1 e0 08             	shl    $0x8,%eax
c0101cdb:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101cde:	89 c2                	mov    %eax,%edx
c0101ce0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ce3:	89 50 08             	mov    %edx,0x8(%eax)
c0101ce6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101cea:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101cee:	7e ae                	jle    c0101c9e <mkfs+0x341>
c0101cf0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101cf7:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101cfd:	b8 00 00 00 00       	mov    $0x0,%eax
c0101d02:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101d07:	89 d7                	mov    %edx,%edi
c0101d09:	f3 ab                	rep stos %eax,%es:(%edi)
c0101d0b:	c7 85 70 ff ff ff c4 	movl   $0xc010b3c4,-0x90(%ebp)
c0101d12:	b3 10 c0 
c0101d15:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101d1c:	eb 54                	jmp    c0101d72 <mkfs+0x415>
c0101d1e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d23:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101d26:	83 c2 04             	add    $0x4,%edx
c0101d29:	c1 e2 05             	shl    $0x5,%edx
c0101d2c:	01 d0                	add    %edx,%eax
c0101d2e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101d31:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d34:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101d3a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d3d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101d44:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101d47:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101d4a:	83 c2 01             	add    $0x1,%edx
c0101d4d:	c1 e2 0b             	shl    $0xb,%edx
c0101d50:	01 c2                	add    %eax,%edx
c0101d52:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d55:	89 50 08             	mov    %edx,0x8(%eax)
c0101d58:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d5b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101d62:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d65:	8d 50 05             	lea    0x5(%eax),%edx
c0101d68:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d6b:	89 50 10             	mov    %edx,0x10(%eax)
c0101d6e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101d72:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d75:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101d78:	7c a4                	jl     c0101d1e <mkfs+0x3c1>
c0101d7a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d7f:	89 c2                	mov    %eax,%edx
c0101d81:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101d84:	83 c0 03             	add    $0x3,%eax
c0101d87:	83 ec 0c             	sub    $0xc,%esp
c0101d8a:	6a 0a                	push   $0xa
c0101d8c:	68 00 02 00 00       	push   $0x200
c0101d91:	52                   	push   %edx
c0101d92:	6a 20                	push   $0x20
c0101d94:	50                   	push   %eax
c0101d95:	e8 ea fa ff ff       	call   c0101884 <rd_wt>
c0101d9a:	83 c4 20             	add    $0x20,%esp
c0101d9d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101da2:	89 c2                	mov    %eax,%edx
c0101da4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101da7:	83 ec 0c             	sub    $0xc,%esp
c0101daa:	6a 07                	push   $0x7
c0101dac:	68 00 02 00 00       	push   $0x200
c0101db1:	52                   	push   %edx
c0101db2:	6a 20                	push   $0x20
c0101db4:	50                   	push   %eax
c0101db5:	e8 ca fa ff ff       	call   c0101884 <rd_wt>
c0101dba:	83 c4 20             	add    $0x20,%esp
c0101dbd:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101dc4:	00 00 00 
c0101dc7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101dce:	2e 00 
c0101dd0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101dd5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101dd8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ddb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101de1:	83 ec 0c             	sub    $0xc,%esp
c0101de4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101dea:	50                   	push   %eax
c0101deb:	e8 18 a4 00 00       	call   c010c208 <Strlen>
c0101df0:	83 c4 10             	add    $0x10,%esp
c0101df3:	89 c1                	mov    %eax,%ecx
c0101df5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101df8:	8d 50 04             	lea    0x4(%eax),%edx
c0101dfb:	83 ec 04             	sub    $0x4,%esp
c0101dfe:	51                   	push   %ecx
c0101dff:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101e05:	50                   	push   %eax
c0101e06:	52                   	push   %edx
c0101e07:	e8 f0 4e 00 00       	call   c0106cfc <Memcpy>
c0101e0c:	83 c4 10             	add    $0x10,%esp
c0101e0f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101e15:	b8 00 00 00 00       	mov    $0x0,%eax
c0101e1a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101e1f:	89 d7                	mov    %edx,%edi
c0101e21:	f3 ab                	rep stos %eax,%es:(%edi)
c0101e23:	c7 85 34 ff ff ff d0 	movl   $0xc010b3d0,-0xcc(%ebp)
c0101e2a:	b3 10 c0 
c0101e2d:	c7 85 38 ff ff ff d9 	movl   $0xc010b3d9,-0xc8(%ebp)
c0101e34:	b3 10 c0 
c0101e37:	c7 85 3c ff ff ff e2 	movl   $0xc010b3e2,-0xc4(%ebp)
c0101e3e:	b3 10 c0 
c0101e41:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101e48:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101e4f:	eb 49                	jmp    c0101e9a <mkfs+0x53d>
c0101e51:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101e55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e58:	8d 50 02             	lea    0x2(%eax),%edx
c0101e5b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e5e:	89 10                	mov    %edx,(%eax)
c0101e60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e63:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101e6a:	83 ec 0c             	sub    $0xc,%esp
c0101e6d:	50                   	push   %eax
c0101e6e:	e8 95 a3 00 00       	call   c010c208 <Strlen>
c0101e73:	83 c4 10             	add    $0x10,%esp
c0101e76:	89 c1                	mov    %eax,%ecx
c0101e78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e7b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101e82:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101e85:	83 c2 04             	add    $0x4,%edx
c0101e88:	83 ec 04             	sub    $0x4,%esp
c0101e8b:	51                   	push   %ecx
c0101e8c:	50                   	push   %eax
c0101e8d:	52                   	push   %edx
c0101e8e:	e8 69 4e 00 00       	call   c0106cfc <Memcpy>
c0101e93:	83 c4 10             	add    $0x10,%esp
c0101e96:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101e9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e9d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101ea0:	7c af                	jl     c0101e51 <mkfs+0x4f4>
c0101ea2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101ea9:	eb 66                	jmp    c0101f11 <mkfs+0x5b4>
c0101eab:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101eae:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101eb5:	83 ec 0c             	sub    $0xc,%esp
c0101eb8:	50                   	push   %eax
c0101eb9:	e8 4a a3 00 00       	call   c010c208 <Strlen>
c0101ebe:	83 c4 10             	add    $0x10,%esp
c0101ec1:	85 c0                	test   %eax,%eax
c0101ec3:	74 47                	je     c0101f0c <mkfs+0x5af>
c0101ec5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101ec9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ecc:	8d 50 05             	lea    0x5(%eax),%edx
c0101ecf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ed2:	89 10                	mov    %edx,(%eax)
c0101ed4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ed7:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101ede:	83 ec 0c             	sub    $0xc,%esp
c0101ee1:	50                   	push   %eax
c0101ee2:	e8 21 a3 00 00       	call   c010c208 <Strlen>
c0101ee7:	83 c4 10             	add    $0x10,%esp
c0101eea:	89 c1                	mov    %eax,%ecx
c0101eec:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101eef:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101ef6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101ef9:	83 c2 04             	add    $0x4,%edx
c0101efc:	83 ec 04             	sub    $0x4,%esp
c0101eff:	51                   	push   %ecx
c0101f00:	50                   	push   %eax
c0101f01:	52                   	push   %edx
c0101f02:	e8 f5 4d 00 00       	call   c0106cfc <Memcpy>
c0101f07:	83 c4 10             	add    $0x10,%esp
c0101f0a:	eb 01                	jmp    c0101f0d <mkfs+0x5b0>
c0101f0c:	90                   	nop
c0101f0d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101f11:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f14:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101f17:	7c 92                	jl     c0101eab <mkfs+0x54e>
c0101f19:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101f1e:	89 c2                	mov    %eax,%edx
c0101f20:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101f23:	83 ec 0c             	sub    $0xc,%esp
c0101f26:	6a 0a                	push   $0xa
c0101f28:	68 00 02 00 00       	push   $0x200
c0101f2d:	52                   	push   %edx
c0101f2e:	6a 20                	push   $0x20
c0101f30:	50                   	push   %eax
c0101f31:	e8 4e f9 ff ff       	call   c0101884 <rd_wt>
c0101f36:	83 c4 20             	add    $0x20,%esp
c0101f39:	90                   	nop
c0101f3a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101f3d:	c9                   	leave  
c0101f3e:	c3                   	ret    

c0101f3f <init_fs>:
c0101f3f:	55                   	push   %ebp
c0101f40:	89 e5                	mov    %esp,%ebp
c0101f42:	83 ec 18             	sub    $0x18,%esp
c0101f45:	83 ec 0c             	sub    $0xc,%esp
c0101f48:	6a 7c                	push   $0x7c
c0101f4a:	e8 fd f6 ff ff       	call   c010164c <sys_malloc>
c0101f4f:	83 c4 10             	add    $0x10,%esp
c0101f52:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101f55:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f58:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101f5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f62:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101f69:	83 ec 04             	sub    $0x4,%esp
c0101f6c:	6a 03                	push   $0x3
c0101f6e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101f71:	6a 03                	push   $0x3
c0101f73:	e8 0d 76 00 00       	call   c0109585 <send_rec>
c0101f78:	83 c4 10             	add    $0x10,%esp
c0101f7b:	e8 dd f9 ff ff       	call   c010195d <mkfs>
c0101f80:	83 ec 08             	sub    $0x8,%esp
c0101f83:	6a 7c                	push   $0x7c
c0101f85:	ff 75 f4             	pushl  -0xc(%ebp)
c0101f88:	e8 d4 f6 ff ff       	call   c0101661 <sys_free>
c0101f8d:	83 c4 10             	add    $0x10,%esp
c0101f90:	90                   	nop
c0101f91:	c9                   	leave  
c0101f92:	c3                   	ret    

c0101f93 <do_open>:
c0101f93:	55                   	push   %ebp
c0101f94:	89 e5                	mov    %esp,%ebp
c0101f96:	83 ec 68             	sub    $0x68,%esp
c0101f99:	83 ec 04             	sub    $0x4,%esp
c0101f9c:	6a 0c                	push   $0xc
c0101f9e:	6a 00                	push   $0x0
c0101fa0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101fa3:	50                   	push   %eax
c0101fa4:	e8 26 a2 00 00       	call   c010c1cf <Memset>
c0101fa9:	83 c4 10             	add    $0x10,%esp
c0101fac:	8b 45 08             	mov    0x8(%ebp),%eax
c0101faf:	8b 40 44             	mov    0x44(%eax),%eax
c0101fb2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101fb5:	83 ec 08             	sub    $0x8,%esp
c0101fb8:	6a 0c                	push   $0xc
c0101fba:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101fbd:	e8 cd 3e 00 00       	call   c0105e8f <alloc_virtual_memory>
c0101fc2:	83 c4 10             	add    $0x10,%esp
c0101fc5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101fc8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fcb:	8b 40 40             	mov    0x40(%eax),%eax
c0101fce:	89 c2                	mov    %eax,%edx
c0101fd0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101fd3:	83 ec 04             	sub    $0x4,%esp
c0101fd6:	52                   	push   %edx
c0101fd7:	50                   	push   %eax
c0101fd8:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101fdb:	50                   	push   %eax
c0101fdc:	e8 1b 4d 00 00       	call   c0106cfc <Memcpy>
c0101fe1:	83 c4 10             	add    $0x10,%esp
c0101fe4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fe7:	8b 40 40             	mov    0x40(%eax),%eax
c0101fea:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0101fef:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ff2:	8b 40 74             	mov    0x74(%eax),%eax
c0101ff5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101ff8:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0101fff:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102006:	eb 1f                	jmp    c0102027 <do_open+0x94>
c0102008:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010200d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102010:	83 c2 4c             	add    $0x4c,%edx
c0102013:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0102017:	85 c0                	test   %eax,%eax
c0102019:	75 08                	jne    c0102023 <do_open+0x90>
c010201b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010201e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102021:	eb 0a                	jmp    c010202d <do_open+0x9a>
c0102023:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102027:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c010202b:	7e db                	jle    c0102008 <do_open+0x75>
c010202d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0102031:	75 1c                	jne    c010204f <do_open+0xbc>
c0102033:	68 c6 01 00 00       	push   $0x1c6
c0102038:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010203d:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102042:	68 eb b3 10 c0       	push   $0xc010b3eb
c0102047:	e8 c9 68 00 00       	call   c0108915 <assertion_failure>
c010204c:	83 c4 10             	add    $0x10,%esp
c010204f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0102056:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010205d:	eb 1d                	jmp    c010207c <do_open+0xe9>
c010205f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102062:	c1 e0 04             	shl    $0x4,%eax
c0102065:	05 88 13 11 c0       	add    $0xc0111388,%eax
c010206a:	8b 00                	mov    (%eax),%eax
c010206c:	85 c0                	test   %eax,%eax
c010206e:	75 08                	jne    c0102078 <do_open+0xe5>
c0102070:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102073:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102076:	eb 0a                	jmp    c0102082 <do_open+0xef>
c0102078:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010207c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0102080:	7e dd                	jle    c010205f <do_open+0xcc>
c0102082:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0102086:	75 1c                	jne    c01020a4 <do_open+0x111>
c0102088:	68 d2 01 00 00       	push   $0x1d2
c010208d:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102092:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102097:	68 f3 b3 10 c0       	push   $0xc010b3f3
c010209c:	e8 74 68 00 00       	call   c0108915 <assertion_failure>
c01020a1:	83 c4 10             	add    $0x10,%esp
c01020a4:	83 ec 0c             	sub    $0xc,%esp
c01020a7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01020aa:	50                   	push   %eax
c01020ab:	e8 d2 00 00 00       	call   c0102182 <search_file>
c01020b0:	83 c4 10             	add    $0x10,%esp
c01020b3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01020b6:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01020ba:	75 2b                	jne    c01020e7 <do_open+0x154>
c01020bc:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c01020c0:	7e 10                	jle    c01020d2 <do_open+0x13f>
c01020c2:	83 ec 0c             	sub    $0xc,%esp
c01020c5:	68 fb b3 10 c0       	push   $0xc010b3fb
c01020ca:	e8 28 68 00 00       	call   c01088f7 <panic>
c01020cf:	83 c4 10             	add    $0x10,%esp
c01020d2:	83 ec 08             	sub    $0x8,%esp
c01020d5:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01020d8:	50                   	push   %eax
c01020d9:	8d 45 9c             	lea    -0x64(%ebp),%eax
c01020dc:	50                   	push   %eax
c01020dd:	e8 60 04 00 00       	call   c0102542 <create_file>
c01020e2:	83 c4 10             	add    $0x10,%esp
c01020e5:	eb 25                	jmp    c010210c <do_open+0x179>
c01020e7:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c01020eb:	75 0a                	jne    c01020f7 <do_open+0x164>
c01020ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01020f2:	e9 89 00 00 00       	jmp    c0102180 <do_open+0x1ed>
c01020f7:	83 ec 08             	sub    $0x8,%esp
c01020fa:	ff 75 d8             	pushl  -0x28(%ebp)
c01020fd:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0102100:	50                   	push   %eax
c0102101:	e8 7a 02 00 00       	call   c0102380 <get_inode>
c0102106:	83 c4 10             	add    $0x10,%esp
c0102109:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010210c:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0102111:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102114:	c1 e2 04             	shl    $0x4,%edx
c0102117:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010211d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102120:	83 c2 4c             	add    $0x4c,%edx
c0102123:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102127:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010212a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010212d:	c1 e2 04             	shl    $0x4,%edx
c0102130:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102136:	89 02                	mov    %eax,(%edx)
c0102138:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010213b:	c1 e0 04             	shl    $0x4,%eax
c010213e:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102143:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102149:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010214c:	c1 e0 04             	shl    $0x4,%eax
c010214f:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102154:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010215a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010215d:	c1 e0 04             	shl    $0x4,%eax
c0102160:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102165:	8b 00                	mov    (%eax),%eax
c0102167:	8d 50 01             	lea    0x1(%eax),%edx
c010216a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010216d:	c1 e0 04             	shl    $0x4,%eax
c0102170:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102175:	89 10                	mov    %edx,(%eax)
c0102177:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010217a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010217d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102180:	c9                   	leave  
c0102181:	c3                   	ret    

c0102182 <search_file>:
c0102182:	55                   	push   %ebp
c0102183:	89 e5                	mov    %esp,%ebp
c0102185:	83 ec 68             	sub    $0x68,%esp
c0102188:	83 ec 04             	sub    $0x4,%esp
c010218b:	6a 0c                	push   $0xc
c010218d:	6a 00                	push   $0x0
c010218f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102192:	50                   	push   %eax
c0102193:	e8 37 a0 00 00       	call   c010c1cf <Memset>
c0102198:	83 c4 10             	add    $0x10,%esp
c010219b:	83 ec 04             	sub    $0x4,%esp
c010219e:	6a 28                	push   $0x28
c01021a0:	6a 00                	push   $0x0
c01021a2:	8d 45 98             	lea    -0x68(%ebp),%eax
c01021a5:	50                   	push   %eax
c01021a6:	e8 24 a0 00 00       	call   c010c1cf <Memset>
c01021ab:	83 c4 10             	add    $0x10,%esp
c01021ae:	83 ec 04             	sub    $0x4,%esp
c01021b1:	8d 45 98             	lea    -0x68(%ebp),%eax
c01021b4:	50                   	push   %eax
c01021b5:	ff 75 08             	pushl  0x8(%ebp)
c01021b8:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01021bb:	50                   	push   %eax
c01021bc:	e8 f3 00 00 00       	call   c01022b4 <strip_path>
c01021c1:	83 c4 10             	add    $0x10,%esp
c01021c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01021c7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c01021cb:	75 0a                	jne    c01021d7 <search_file+0x55>
c01021cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01021d2:	e9 db 00 00 00       	jmp    c01022b2 <search_file+0x130>
c01021d7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01021da:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01021dd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01021e0:	05 00 02 00 00       	add    $0x200,%eax
c01021e5:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01021eb:	85 c0                	test   %eax,%eax
c01021ed:	0f 48 c2             	cmovs  %edx,%eax
c01021f0:	c1 f8 09             	sar    $0x9,%eax
c01021f3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01021f6:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01021f9:	c1 e8 04             	shr    $0x4,%eax
c01021fc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01021ff:	e8 5c 14 00 00       	call   c0103660 <get_super_block>
c0102204:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102207:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010220a:	8b 00                	mov    (%eax),%eax
c010220c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010220f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102216:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010221d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102224:	eb 7b                	jmp    c01022a1 <search_file+0x11f>
c0102226:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010222b:	89 c1                	mov    %eax,%ecx
c010222d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102230:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102233:	01 d0                	add    %edx,%eax
c0102235:	83 ec 0c             	sub    $0xc,%esp
c0102238:	6a 07                	push   $0x7
c010223a:	68 00 02 00 00       	push   $0x200
c010223f:	51                   	push   %ecx
c0102240:	ff 75 cc             	pushl  -0x34(%ebp)
c0102243:	50                   	push   %eax
c0102244:	e8 3b f6 ff ff       	call   c0101884 <rd_wt>
c0102249:	83 c4 20             	add    $0x20,%esp
c010224c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102251:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102254:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010225b:	eb 35                	jmp    c0102292 <search_file+0x110>
c010225d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102261:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102264:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102267:	7f 33                	jg     c010229c <search_file+0x11a>
c0102269:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010226c:	83 c0 04             	add    $0x4,%eax
c010226f:	83 ec 08             	sub    $0x8,%esp
c0102272:	50                   	push   %eax
c0102273:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102276:	50                   	push   %eax
c0102277:	e8 70 76 00 00       	call   c01098ec <strcmp>
c010227c:	83 c4 10             	add    $0x10,%esp
c010227f:	85 c0                	test   %eax,%eax
c0102281:	75 07                	jne    c010228a <search_file+0x108>
c0102283:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102286:	8b 00                	mov    (%eax),%eax
c0102288:	eb 28                	jmp    c01022b2 <search_file+0x130>
c010228a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010228e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0102292:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102295:	83 f8 1f             	cmp    $0x1f,%eax
c0102298:	76 c3                	jbe    c010225d <search_file+0xdb>
c010229a:	eb 01                	jmp    c010229d <search_file+0x11b>
c010229c:	90                   	nop
c010229d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01022a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022a4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c01022a7:	0f 8c 79 ff ff ff    	jl     c0102226 <search_file+0xa4>
c01022ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022b2:	c9                   	leave  
c01022b3:	c3                   	ret    

c01022b4 <strip_path>:
c01022b4:	55                   	push   %ebp
c01022b5:	89 e5                	mov    %esp,%ebp
c01022b7:	83 ec 10             	sub    $0x10,%esp
c01022ba:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01022be:	75 0a                	jne    c01022ca <strip_path+0x16>
c01022c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022c5:	e9 b4 00 00 00       	jmp    c010237e <strip_path+0xca>
c01022ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01022cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01022d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022d3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01022d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01022d9:	0f b6 00             	movzbl (%eax),%eax
c01022dc:	3c 2f                	cmp    $0x2f,%al
c01022de:	75 2d                	jne    c010230d <strip_path+0x59>
c01022e0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01022e4:	eb 27                	jmp    c010230d <strip_path+0x59>
c01022e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01022e9:	0f b6 00             	movzbl (%eax),%eax
c01022ec:	3c 2f                	cmp    $0x2f,%al
c01022ee:	75 0a                	jne    c01022fa <strip_path+0x46>
c01022f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022f5:	e9 84 00 00 00       	jmp    c010237e <strip_path+0xca>
c01022fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01022fd:	0f b6 10             	movzbl (%eax),%edx
c0102300:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102303:	88 10                	mov    %dl,(%eax)
c0102305:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102309:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010230d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102310:	0f b6 00             	movzbl (%eax),%eax
c0102313:	84 c0                	test   %al,%al
c0102315:	75 cf                	jne    c01022e6 <strip_path+0x32>
c0102317:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010231a:	c6 00 00             	movb   $0x0,(%eax)
c010231d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102320:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102326:	89 10                	mov    %edx,(%eax)
c0102328:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010232e:	89 50 04             	mov    %edx,0x4(%eax)
c0102331:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102337:	89 50 08             	mov    %edx,0x8(%eax)
c010233a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102340:	89 50 0c             	mov    %edx,0xc(%eax)
c0102343:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102349:	89 50 10             	mov    %edx,0x10(%eax)
c010234c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102352:	89 50 14             	mov    %edx,0x14(%eax)
c0102355:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010235b:	89 50 18             	mov    %edx,0x18(%eax)
c010235e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102364:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102367:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010236d:	89 50 20             	mov    %edx,0x20(%eax)
c0102370:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102376:	89 50 24             	mov    %edx,0x24(%eax)
c0102379:	b8 00 00 00 00       	mov    $0x0,%eax
c010237e:	c9                   	leave  
c010237f:	c3                   	ret    

c0102380 <get_inode>:
c0102380:	55                   	push   %ebp
c0102381:	89 e5                	mov    %esp,%ebp
c0102383:	56                   	push   %esi
c0102384:	53                   	push   %ebx
c0102385:	83 ec 20             	sub    $0x20,%esp
c0102388:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010238c:	75 0a                	jne    c0102398 <get_inode+0x18>
c010238e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102393:	e9 a3 01 00 00       	jmp    c010253b <get_inode+0x1bb>
c0102398:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010239f:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c01023a6:	eb 69                	jmp    c0102411 <get_inode+0x91>
c01023a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023ab:	8b 40 24             	mov    0x24(%eax),%eax
c01023ae:	85 c0                	test   %eax,%eax
c01023b0:	7e 53                	jle    c0102405 <get_inode+0x85>
c01023b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023b5:	8b 40 10             	mov    0x10(%eax),%eax
c01023b8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01023bb:	75 50                	jne    c010240d <get_inode+0x8d>
c01023bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01023c0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01023c3:	8b 0a                	mov    (%edx),%ecx
c01023c5:	89 08                	mov    %ecx,(%eax)
c01023c7:	8b 4a 04             	mov    0x4(%edx),%ecx
c01023ca:	89 48 04             	mov    %ecx,0x4(%eax)
c01023cd:	8b 4a 08             	mov    0x8(%edx),%ecx
c01023d0:	89 48 08             	mov    %ecx,0x8(%eax)
c01023d3:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01023d6:	89 48 0c             	mov    %ecx,0xc(%eax)
c01023d9:	8b 4a 10             	mov    0x10(%edx),%ecx
c01023dc:	89 48 10             	mov    %ecx,0x10(%eax)
c01023df:	8b 4a 14             	mov    0x14(%edx),%ecx
c01023e2:	89 48 14             	mov    %ecx,0x14(%eax)
c01023e5:	8b 4a 18             	mov    0x18(%edx),%ecx
c01023e8:	89 48 18             	mov    %ecx,0x18(%eax)
c01023eb:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01023ee:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01023f1:	8b 4a 20             	mov    0x20(%edx),%ecx
c01023f4:	89 48 20             	mov    %ecx,0x20(%eax)
c01023f7:	8b 52 24             	mov    0x24(%edx),%edx
c01023fa:	89 50 24             	mov    %edx,0x24(%eax)
c01023fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102400:	e9 36 01 00 00       	jmp    c010253b <get_inode+0x1bb>
c0102405:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102408:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010240b:	eb 0d                	jmp    c010241a <get_inode+0x9a>
c010240d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102411:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102418:	76 8e                	jbe    c01023a8 <get_inode+0x28>
c010241a:	e8 41 12 00 00       	call   c0103660 <get_super_block>
c010241f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102422:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102429:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010242c:	8b 40 04             	mov    0x4(%eax),%eax
c010242f:	8d 50 02             	lea    0x2(%eax),%edx
c0102432:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102435:	8b 40 08             	mov    0x8(%eax),%eax
c0102438:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010243b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010243e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102441:	b8 00 02 00 00       	mov    $0x200,%eax
c0102446:	99                   	cltd   
c0102447:	f7 7d e8             	idivl  -0x18(%ebp)
c010244a:	89 c6                	mov    %eax,%esi
c010244c:	89 c8                	mov    %ecx,%eax
c010244e:	99                   	cltd   
c010244f:	f7 fe                	idiv   %esi
c0102451:	01 d8                	add    %ebx,%eax
c0102453:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102456:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010245d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102462:	83 ec 0c             	sub    $0xc,%esp
c0102465:	6a 07                	push   $0x7
c0102467:	68 00 02 00 00       	push   $0x200
c010246c:	50                   	push   %eax
c010246d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102470:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102473:	e8 0c f4 ff ff       	call   c0101884 <rd_wt>
c0102478:	83 c4 20             	add    $0x20,%esp
c010247b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010247e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102481:	b8 00 02 00 00       	mov    $0x200,%eax
c0102486:	99                   	cltd   
c0102487:	f7 7d e8             	idivl  -0x18(%ebp)
c010248a:	89 c3                	mov    %eax,%ebx
c010248c:	89 c8                	mov    %ecx,%eax
c010248e:	99                   	cltd   
c010248f:	f7 fb                	idiv   %ebx
c0102491:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0102494:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010249a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010249d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c01024a1:	01 d0                	add    %edx,%eax
c01024a3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01024a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024a9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01024ac:	8b 0a                	mov    (%edx),%ecx
c01024ae:	89 08                	mov    %ecx,(%eax)
c01024b0:	8b 4a 04             	mov    0x4(%edx),%ecx
c01024b3:	89 48 04             	mov    %ecx,0x4(%eax)
c01024b6:	8b 4a 08             	mov    0x8(%edx),%ecx
c01024b9:	89 48 08             	mov    %ecx,0x8(%eax)
c01024bc:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01024bf:	89 48 0c             	mov    %ecx,0xc(%eax)
c01024c2:	8b 4a 10             	mov    0x10(%edx),%ecx
c01024c5:	89 48 10             	mov    %ecx,0x10(%eax)
c01024c8:	8b 4a 14             	mov    0x14(%edx),%ecx
c01024cb:	89 48 14             	mov    %ecx,0x14(%eax)
c01024ce:	8b 4a 18             	mov    0x18(%edx),%ecx
c01024d1:	89 48 18             	mov    %ecx,0x18(%eax)
c01024d4:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01024d7:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01024da:	8b 4a 20             	mov    0x20(%edx),%ecx
c01024dd:	89 48 20             	mov    %ecx,0x20(%eax)
c01024e0:	8b 52 24             	mov    0x24(%edx),%edx
c01024e3:	89 50 24             	mov    %edx,0x24(%eax)
c01024e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024e9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01024ec:	89 50 10             	mov    %edx,0x10(%eax)
c01024ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024f2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01024f5:	89 50 20             	mov    %edx,0x20(%eax)
c01024f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01024fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01024fe:	8b 0a                	mov    (%edx),%ecx
c0102500:	89 08                	mov    %ecx,(%eax)
c0102502:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102505:	89 48 04             	mov    %ecx,0x4(%eax)
c0102508:	8b 4a 08             	mov    0x8(%edx),%ecx
c010250b:	89 48 08             	mov    %ecx,0x8(%eax)
c010250e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102511:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102514:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102517:	89 48 10             	mov    %ecx,0x10(%eax)
c010251a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010251d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102520:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102523:	89 48 18             	mov    %ecx,0x18(%eax)
c0102526:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102529:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010252c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010252f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102532:	8b 52 24             	mov    0x24(%edx),%edx
c0102535:	89 50 24             	mov    %edx,0x24(%eax)
c0102538:	8b 45 08             	mov    0x8(%ebp),%eax
c010253b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010253e:	5b                   	pop    %ebx
c010253f:	5e                   	pop    %esi
c0102540:	5d                   	pop    %ebp
c0102541:	c3                   	ret    

c0102542 <create_file>:
c0102542:	55                   	push   %ebp
c0102543:	89 e5                	mov    %esp,%ebp
c0102545:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010254b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010254e:	50                   	push   %eax
c010254f:	ff 75 0c             	pushl  0xc(%ebp)
c0102552:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102555:	50                   	push   %eax
c0102556:	e8 59 fd ff ff       	call   c01022b4 <strip_path>
c010255b:	83 c4 0c             	add    $0xc,%esp
c010255e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102561:	75 0a                	jne    c010256d <create_file+0x2b>
c0102563:	b8 00 00 00 00       	mov    $0x0,%eax
c0102568:	e9 de 00 00 00       	jmp    c010264b <create_file+0x109>
c010256d:	e8 db 00 00 00       	call   c010264d <alloc_imap_bit>
c0102572:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102575:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102579:	75 0a                	jne    c0102585 <create_file+0x43>
c010257b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102580:	e9 c6 00 00 00       	jmp    c010264b <create_file+0x109>
c0102585:	e8 d6 10 00 00       	call   c0103660 <get_super_block>
c010258a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010258d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102590:	8b 40 10             	mov    0x10(%eax),%eax
c0102593:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102596:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102599:	83 ec 08             	sub    $0x8,%esp
c010259c:	50                   	push   %eax
c010259d:	ff 75 f4             	pushl  -0xc(%ebp)
c01025a0:	e8 a5 01 00 00       	call   c010274a <alloc_smap_bit>
c01025a5:	83 c4 10             	add    $0x10,%esp
c01025a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01025ab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01025af:	75 0a                	jne    c01025bb <create_file+0x79>
c01025b1:	b8 00 00 00 00       	mov    $0x0,%eax
c01025b6:	e9 90 00 00 00       	jmp    c010264b <create_file+0x109>
c01025bb:	83 ec 04             	sub    $0x4,%esp
c01025be:	ff 75 e8             	pushl  -0x18(%ebp)
c01025c1:	ff 75 f4             	pushl  -0xc(%ebp)
c01025c4:	8d 45 84             	lea    -0x7c(%ebp),%eax
c01025c7:	50                   	push   %eax
c01025c8:	e8 1e 03 00 00       	call   c01028eb <new_inode>
c01025cd:	83 c4 10             	add    $0x10,%esp
c01025d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01025d3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01025d7:	75 07                	jne    c01025e0 <create_file+0x9e>
c01025d9:	b8 00 00 00 00       	mov    $0x0,%eax
c01025de:	eb 6b                	jmp    c010264b <create_file+0x109>
c01025e0:	ff 75 f4             	pushl  -0xc(%ebp)
c01025e3:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01025e6:	50                   	push   %eax
c01025e7:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01025ea:	50                   	push   %eax
c01025eb:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01025f1:	50                   	push   %eax
c01025f2:	e8 12 04 00 00       	call   c0102a09 <new_dir_entry>
c01025f7:	83 c4 10             	add    $0x10,%esp
c01025fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01025fd:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102601:	75 07                	jne    c010260a <create_file+0xc8>
c0102603:	b8 00 00 00 00       	mov    $0x0,%eax
c0102608:	eb 41                	jmp    c010264b <create_file+0x109>
c010260a:	8b 45 08             	mov    0x8(%ebp),%eax
c010260d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102610:	89 10                	mov    %edx,(%eax)
c0102612:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102615:	89 50 04             	mov    %edx,0x4(%eax)
c0102618:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010261b:	89 50 08             	mov    %edx,0x8(%eax)
c010261e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102621:	89 50 0c             	mov    %edx,0xc(%eax)
c0102624:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102627:	89 50 10             	mov    %edx,0x10(%eax)
c010262a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010262d:	89 50 14             	mov    %edx,0x14(%eax)
c0102630:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102633:	89 50 18             	mov    %edx,0x18(%eax)
c0102636:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102639:	89 50 1c             	mov    %edx,0x1c(%eax)
c010263c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010263f:	89 50 20             	mov    %edx,0x20(%eax)
c0102642:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102645:	89 50 24             	mov    %edx,0x24(%eax)
c0102648:	8b 45 08             	mov    0x8(%ebp),%eax
c010264b:	c9                   	leave  
c010264c:	c3                   	ret    

c010264d <alloc_imap_bit>:
c010264d:	55                   	push   %ebp
c010264e:	89 e5                	mov    %esp,%ebp
c0102650:	53                   	push   %ebx
c0102651:	83 ec 24             	sub    $0x24,%esp
c0102654:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010265b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102662:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102667:	83 ec 0c             	sub    $0xc,%esp
c010266a:	6a 07                	push   $0x7
c010266c:	68 00 02 00 00       	push   $0x200
c0102671:	50                   	push   %eax
c0102672:	ff 75 e8             	pushl  -0x18(%ebp)
c0102675:	ff 75 ec             	pushl  -0x14(%ebp)
c0102678:	e8 07 f2 ff ff       	call   c0101884 <rd_wt>
c010267d:	83 c4 20             	add    $0x20,%esp
c0102680:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102687:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010268e:	e9 a5 00 00 00       	jmp    c0102738 <alloc_imap_bit+0xeb>
c0102693:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010269a:	e9 8b 00 00 00       	jmp    c010272a <alloc_imap_bit+0xdd>
c010269f:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026a8:	01 d0                	add    %edx,%eax
c01026aa:	0f b6 00             	movzbl (%eax),%eax
c01026ad:	0f be d0             	movsbl %al,%edx
c01026b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026b3:	89 c1                	mov    %eax,%ecx
c01026b5:	d3 fa                	sar    %cl,%edx
c01026b7:	89 d0                	mov    %edx,%eax
c01026b9:	83 e0 01             	and    $0x1,%eax
c01026bc:	85 c0                	test   %eax,%eax
c01026be:	74 06                	je     c01026c6 <alloc_imap_bit+0x79>
c01026c0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01026c4:	eb 64                	jmp    c010272a <alloc_imap_bit+0xdd>
c01026c6:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026cf:	01 d0                	add    %edx,%eax
c01026d1:	0f b6 18             	movzbl (%eax),%ebx
c01026d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026d7:	ba 01 00 00 00       	mov    $0x1,%edx
c01026dc:	89 c1                	mov    %eax,%ecx
c01026de:	d3 e2                	shl    %cl,%edx
c01026e0:	89 d0                	mov    %edx,%eax
c01026e2:	89 c1                	mov    %eax,%ecx
c01026e4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026ed:	01 d0                	add    %edx,%eax
c01026ef:	09 cb                	or     %ecx,%ebx
c01026f1:	89 da                	mov    %ebx,%edx
c01026f3:	88 10                	mov    %dl,(%eax)
c01026f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026f8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01026ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102702:	01 d0                	add    %edx,%eax
c0102704:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102707:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010270c:	83 ec 0c             	sub    $0xc,%esp
c010270f:	6a 0a                	push   $0xa
c0102711:	68 00 02 00 00       	push   $0x200
c0102716:	50                   	push   %eax
c0102717:	ff 75 e8             	pushl  -0x18(%ebp)
c010271a:	ff 75 ec             	pushl  -0x14(%ebp)
c010271d:	e8 62 f1 ff ff       	call   c0101884 <rd_wt>
c0102722:	83 c4 20             	add    $0x20,%esp
c0102725:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102728:	eb 1b                	jmp    c0102745 <alloc_imap_bit+0xf8>
c010272a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010272e:	0f 8e 6b ff ff ff    	jle    c010269f <alloc_imap_bit+0x52>
c0102734:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102738:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010273f:	0f 8e 4e ff ff ff    	jle    c0102693 <alloc_imap_bit+0x46>
c0102745:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102748:	c9                   	leave  
c0102749:	c3                   	ret    

c010274a <alloc_smap_bit>:
c010274a:	55                   	push   %ebp
c010274b:	89 e5                	mov    %esp,%ebp
c010274d:	53                   	push   %ebx
c010274e:	83 ec 34             	sub    $0x34,%esp
c0102751:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102755:	75 1c                	jne    c0102773 <alloc_smap_bit+0x29>
c0102757:	68 fd 02 00 00       	push   $0x2fd
c010275c:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102761:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102766:	68 08 b4 10 c0       	push   $0xc010b408
c010276b:	e8 a5 61 00 00       	call   c0108915 <assertion_failure>
c0102770:	83 c4 10             	add    $0x10,%esp
c0102773:	e8 e8 0e 00 00       	call   c0103660 <get_super_block>
c0102778:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010277b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010277e:	8b 40 08             	mov    0x8(%eax),%eax
c0102781:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102784:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102787:	8b 40 04             	mov    0x4(%eax),%eax
c010278a:	83 c0 02             	add    $0x2,%eax
c010278d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102790:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102797:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c010279e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01027a5:	e9 20 01 00 00       	jmp    c01028ca <alloc_smap_bit+0x180>
c01027aa:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01027ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027b0:	01 d0                	add    %edx,%eax
c01027b2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01027b5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01027ba:	83 ec 0c             	sub    $0xc,%esp
c01027bd:	6a 07                	push   $0x7
c01027bf:	68 00 02 00 00       	push   $0x200
c01027c4:	50                   	push   %eax
c01027c5:	ff 75 d8             	pushl  -0x28(%ebp)
c01027c8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01027cb:	e8 b4 f0 ff ff       	call   c0101884 <rd_wt>
c01027d0:	83 c4 20             	add    $0x20,%esp
c01027d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01027da:	e9 b0 00 00 00       	jmp    c010288f <alloc_smap_bit+0x145>
c01027df:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01027e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01027ea:	0f 85 8c 00 00 00    	jne    c010287c <alloc_smap_bit+0x132>
c01027f0:	eb 45                	jmp    c0102837 <alloc_smap_bit+0xed>
c01027f2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01027f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027fb:	01 d0                	add    %edx,%eax
c01027fd:	0f b6 00             	movzbl (%eax),%eax
c0102800:	0f be d0             	movsbl %al,%edx
c0102803:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102806:	89 c1                	mov    %eax,%ecx
c0102808:	d3 fa                	sar    %cl,%edx
c010280a:	89 d0                	mov    %edx,%eax
c010280c:	83 e0 01             	and    $0x1,%eax
c010280f:	85 c0                	test   %eax,%eax
c0102811:	74 06                	je     c0102819 <alloc_smap_bit+0xcf>
c0102813:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102817:	eb 1e                	jmp    c0102837 <alloc_smap_bit+0xed>
c0102819:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010281c:	c1 e0 09             	shl    $0x9,%eax
c010281f:	89 c2                	mov    %eax,%edx
c0102821:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102824:	01 d0                	add    %edx,%eax
c0102826:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010282d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102830:	01 d0                	add    %edx,%eax
c0102832:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102835:	eb 06                	jmp    c010283d <alloc_smap_bit+0xf3>
c0102837:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010283b:	7e b5                	jle    c01027f2 <alloc_smap_bit+0xa8>
c010283d:	eb 3d                	jmp    c010287c <alloc_smap_bit+0x132>
c010283f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102843:	74 45                	je     c010288a <alloc_smap_bit+0x140>
c0102845:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010284b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010284e:	01 d0                	add    %edx,%eax
c0102850:	0f b6 18             	movzbl (%eax),%ebx
c0102853:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102856:	ba 01 00 00 00       	mov    $0x1,%edx
c010285b:	89 c1                	mov    %eax,%ecx
c010285d:	d3 e2                	shl    %cl,%edx
c010285f:	89 d0                	mov    %edx,%eax
c0102861:	89 c1                	mov    %eax,%ecx
c0102863:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102869:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010286c:	01 d0                	add    %edx,%eax
c010286e:	09 cb                	or     %ecx,%ebx
c0102870:	89 da                	mov    %ebx,%edx
c0102872:	88 10                	mov    %dl,(%eax)
c0102874:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102878:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010287c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102880:	74 09                	je     c010288b <alloc_smap_bit+0x141>
c0102882:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102886:	7e b7                	jle    c010283f <alloc_smap_bit+0xf5>
c0102888:	eb 01                	jmp    c010288b <alloc_smap_bit+0x141>
c010288a:	90                   	nop
c010288b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010288f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102896:	0f 8e 43 ff ff ff    	jle    c01027df <alloc_smap_bit+0x95>
c010289c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01028a0:	74 1e                	je     c01028c0 <alloc_smap_bit+0x176>
c01028a2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01028a7:	83 ec 0c             	sub    $0xc,%esp
c01028aa:	6a 0a                	push   $0xa
c01028ac:	68 00 02 00 00       	push   $0x200
c01028b1:	50                   	push   %eax
c01028b2:	ff 75 d8             	pushl  -0x28(%ebp)
c01028b5:	ff 75 d4             	pushl  -0x2c(%ebp)
c01028b8:	e8 c7 ef ff ff       	call   c0101884 <rd_wt>
c01028bd:	83 c4 20             	add    $0x20,%esp
c01028c0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01028c4:	74 12                	je     c01028d8 <alloc_smap_bit+0x18e>
c01028c6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01028ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028cd:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01028d0:	0f 8c d4 fe ff ff    	jl     c01027aa <alloc_smap_bit+0x60>
c01028d6:	eb 01                	jmp    c01028d9 <alloc_smap_bit+0x18f>
c01028d8:	90                   	nop
c01028d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028dc:	8d 50 ff             	lea    -0x1(%eax),%edx
c01028df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01028e2:	8b 00                	mov    (%eax),%eax
c01028e4:	01 d0                	add    %edx,%eax
c01028e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01028e9:	c9                   	leave  
c01028ea:	c3                   	ret    

c01028eb <new_inode>:
c01028eb:	55                   	push   %ebp
c01028ec:	89 e5                	mov    %esp,%ebp
c01028ee:	83 ec 38             	sub    $0x38,%esp
c01028f1:	83 ec 08             	sub    $0x8,%esp
c01028f4:	ff 75 0c             	pushl  0xc(%ebp)
c01028f7:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01028fa:	50                   	push   %eax
c01028fb:	e8 80 fa ff ff       	call   c0102380 <get_inode>
c0102900:	83 c4 10             	add    $0x10,%esp
c0102903:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102906:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010290a:	75 0a                	jne    c0102916 <new_inode+0x2b>
c010290c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102911:	e9 f1 00 00 00       	jmp    c0102a07 <new_inode+0x11c>
c0102916:	8b 45 10             	mov    0x10(%ebp),%eax
c0102919:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010291c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102923:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010292a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102931:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102934:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102937:	83 ec 0c             	sub    $0xc,%esp
c010293a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010293d:	50                   	push   %eax
c010293e:	e8 39 0b 00 00       	call   c010347c <sync_inode>
c0102943:	83 c4 10             	add    $0x10,%esp
c0102946:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010294d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102954:	eb 1d                	jmp    c0102973 <new_inode+0x88>
c0102956:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102959:	89 d0                	mov    %edx,%eax
c010295b:	c1 e0 02             	shl    $0x2,%eax
c010295e:	01 d0                	add    %edx,%eax
c0102960:	c1 e0 03             	shl    $0x3,%eax
c0102963:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102968:	8b 00                	mov    (%eax),%eax
c010296a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010296d:	74 0c                	je     c010297b <new_inode+0x90>
c010296f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102973:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102977:	7e dd                	jle    c0102956 <new_inode+0x6b>
c0102979:	eb 01                	jmp    c010297c <new_inode+0x91>
c010297b:	90                   	nop
c010297c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010297f:	89 d0                	mov    %edx,%eax
c0102981:	c1 e0 02             	shl    $0x2,%eax
c0102984:	01 d0                	add    %edx,%eax
c0102986:	c1 e0 03             	shl    $0x3,%eax
c0102989:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c010298e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102991:	89 10                	mov    %edx,(%eax)
c0102993:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102996:	89 50 04             	mov    %edx,0x4(%eax)
c0102999:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010299c:	89 50 08             	mov    %edx,0x8(%eax)
c010299f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01029a2:	89 50 0c             	mov    %edx,0xc(%eax)
c01029a5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01029a8:	89 50 10             	mov    %edx,0x10(%eax)
c01029ab:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01029ae:	89 50 14             	mov    %edx,0x14(%eax)
c01029b1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01029b4:	89 50 18             	mov    %edx,0x18(%eax)
c01029b7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01029ba:	89 50 1c             	mov    %edx,0x1c(%eax)
c01029bd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01029c0:	89 50 20             	mov    %edx,0x20(%eax)
c01029c3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01029c6:	89 50 24             	mov    %edx,0x24(%eax)
c01029c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01029cc:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01029cf:	89 10                	mov    %edx,(%eax)
c01029d1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01029d4:	89 50 04             	mov    %edx,0x4(%eax)
c01029d7:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01029da:	89 50 08             	mov    %edx,0x8(%eax)
c01029dd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01029e0:	89 50 0c             	mov    %edx,0xc(%eax)
c01029e3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01029e6:	89 50 10             	mov    %edx,0x10(%eax)
c01029e9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01029ec:	89 50 14             	mov    %edx,0x14(%eax)
c01029ef:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01029f2:	89 50 18             	mov    %edx,0x18(%eax)
c01029f5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01029f8:	89 50 1c             	mov    %edx,0x1c(%eax)
c01029fb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01029fe:	89 50 20             	mov    %edx,0x20(%eax)
c0102a01:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102a04:	89 50 24             	mov    %edx,0x24(%eax)
c0102a07:	c9                   	leave  
c0102a08:	c3                   	ret    

c0102a09 <new_dir_entry>:
c0102a09:	55                   	push   %ebp
c0102a0a:	89 e5                	mov    %esp,%ebp
c0102a0c:	83 ec 48             	sub    $0x48,%esp
c0102a0f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102a16:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a19:	8b 40 04             	mov    0x4(%eax),%eax
c0102a1c:	99                   	cltd   
c0102a1d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a20:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102a23:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a26:	8b 40 0c             	mov    0xc(%eax),%eax
c0102a29:	99                   	cltd   
c0102a2a:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a2d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102a30:	e8 2b 0c 00 00       	call   c0103660 <get_super_block>
c0102a35:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102a38:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102a3b:	8b 00                	mov    (%eax),%eax
c0102a3d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102a40:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a43:	8b 40 0c             	mov    0xc(%eax),%eax
c0102a46:	05 00 02 00 00       	add    $0x200,%eax
c0102a4b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102a51:	85 c0                	test   %eax,%eax
c0102a53:	0f 48 c2             	cmovs  %edx,%eax
c0102a56:	c1 f8 09             	sar    $0x9,%eax
c0102a59:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102a5c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102a63:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102a6a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102a71:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102a78:	eb 7f                	jmp    c0102af9 <new_dir_entry+0xf0>
c0102a7a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a7f:	89 c1                	mov    %eax,%ecx
c0102a81:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a84:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a87:	01 d0                	add    %edx,%eax
c0102a89:	83 ec 0c             	sub    $0xc,%esp
c0102a8c:	6a 07                	push   $0x7
c0102a8e:	68 00 02 00 00       	push   $0x200
c0102a93:	51                   	push   %ecx
c0102a94:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102a97:	50                   	push   %eax
c0102a98:	e8 e7 ed ff ff       	call   c0101884 <rd_wt>
c0102a9d:	83 c4 20             	add    $0x20,%esp
c0102aa0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102aa5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102aa8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102aaf:	eb 25                	jmp    c0102ad6 <new_dir_entry+0xcd>
c0102ab1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102ab5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102ab8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102abb:	7f 29                	jg     c0102ae6 <new_dir_entry+0xdd>
c0102abd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ac0:	8b 00                	mov    (%eax),%eax
c0102ac2:	85 c0                	test   %eax,%eax
c0102ac4:	75 08                	jne    c0102ace <new_dir_entry+0xc5>
c0102ac6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ac9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102acc:	eb 19                	jmp    c0102ae7 <new_dir_entry+0xde>
c0102ace:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102ad2:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102ad6:	b8 00 02 00 00       	mov    $0x200,%eax
c0102adb:	99                   	cltd   
c0102adc:	f7 7d dc             	idivl  -0x24(%ebp)
c0102adf:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102ae2:	7c cd                	jl     c0102ab1 <new_dir_entry+0xa8>
c0102ae4:	eb 01                	jmp    c0102ae7 <new_dir_entry+0xde>
c0102ae6:	90                   	nop
c0102ae7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102aea:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102aed:	7f 16                	jg     c0102b05 <new_dir_entry+0xfc>
c0102aef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102af3:	75 10                	jne    c0102b05 <new_dir_entry+0xfc>
c0102af5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102af9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102afc:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102aff:	0f 8c 75 ff ff ff    	jl     c0102a7a <new_dir_entry+0x71>
c0102b05:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102b08:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102b0b:	75 0a                	jne    c0102b17 <new_dir_entry+0x10e>
c0102b0d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102b12:	e9 fc 00 00 00       	jmp    c0102c13 <new_dir_entry+0x20a>
c0102b17:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102b1e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102b22:	75 1e                	jne    c0102b42 <new_dir_entry+0x139>
c0102b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b27:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102b2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b2d:	8b 50 04             	mov    0x4(%eax),%edx
c0102b30:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102b33:	01 c2                	add    %eax,%edx
c0102b35:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b38:	89 50 04             	mov    %edx,0x4(%eax)
c0102b3b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102b42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b45:	8b 55 14             	mov    0x14(%ebp),%edx
c0102b48:	89 10                	mov    %edx,(%eax)
c0102b4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b4d:	83 c0 04             	add    $0x4,%eax
c0102b50:	83 ec 08             	sub    $0x8,%esp
c0102b53:	ff 75 10             	pushl  0x10(%ebp)
c0102b56:	50                   	push   %eax
c0102b57:	e8 92 96 00 00       	call   c010c1ee <Strcpy>
c0102b5c:	83 c4 10             	add    $0x10,%esp
c0102b5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b62:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102b65:	8b 0a                	mov    (%edx),%ecx
c0102b67:	89 08                	mov    %ecx,(%eax)
c0102b69:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102b6c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102b6f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102b72:	89 48 08             	mov    %ecx,0x8(%eax)
c0102b75:	8b 52 0c             	mov    0xc(%edx),%edx
c0102b78:	89 50 0c             	mov    %edx,0xc(%eax)
c0102b7b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102b80:	89 c1                	mov    %eax,%ecx
c0102b82:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102b85:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b88:	01 d0                	add    %edx,%eax
c0102b8a:	83 ec 0c             	sub    $0xc,%esp
c0102b8d:	6a 0a                	push   $0xa
c0102b8f:	68 00 02 00 00       	push   $0x200
c0102b94:	51                   	push   %ecx
c0102b95:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102b98:	50                   	push   %eax
c0102b99:	e8 e6 ec ff ff       	call   c0101884 <rd_wt>
c0102b9e:	83 c4 20             	add    $0x20,%esp
c0102ba1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102ba5:	74 69                	je     c0102c10 <new_dir_entry+0x207>
c0102ba7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102baa:	8b 10                	mov    (%eax),%edx
c0102bac:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102bb2:	8b 50 04             	mov    0x4(%eax),%edx
c0102bb5:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102bbb:	8b 50 08             	mov    0x8(%eax),%edx
c0102bbe:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102bc4:	8b 50 0c             	mov    0xc(%eax),%edx
c0102bc7:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102bcd:	8b 50 10             	mov    0x10(%eax),%edx
c0102bd0:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102bd6:	8b 50 14             	mov    0x14(%eax),%edx
c0102bd9:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102bdf:	8b 50 18             	mov    0x18(%eax),%edx
c0102be2:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102be8:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102beb:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102bf1:	8b 50 20             	mov    0x20(%eax),%edx
c0102bf4:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102bfa:	8b 40 24             	mov    0x24(%eax),%eax
c0102bfd:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102c02:	83 ec 0c             	sub    $0xc,%esp
c0102c05:	ff 75 0c             	pushl  0xc(%ebp)
c0102c08:	e8 6f 08 00 00       	call   c010347c <sync_inode>
c0102c0d:	83 c4 10             	add    $0x10,%esp
c0102c10:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c13:	c9                   	leave  
c0102c14:	c3                   	ret    

c0102c15 <do_unlink>:
c0102c15:	55                   	push   %ebp
c0102c16:	89 e5                	mov    %esp,%ebp
c0102c18:	53                   	push   %ebx
c0102c19:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102c1f:	83 ec 08             	sub    $0x8,%esp
c0102c22:	ff 75 08             	pushl  0x8(%ebp)
c0102c25:	68 1d b4 10 c0       	push   $0xc010b41d
c0102c2a:	e8 bd 6c 00 00       	call   c01098ec <strcmp>
c0102c2f:	83 c4 10             	add    $0x10,%esp
c0102c32:	85 c0                	test   %eax,%eax
c0102c34:	75 10                	jne    c0102c46 <do_unlink+0x31>
c0102c36:	83 ec 0c             	sub    $0xc,%esp
c0102c39:	68 1f b4 10 c0       	push   $0xc010b41f
c0102c3e:	e8 b4 5c 00 00       	call   c01088f7 <panic>
c0102c43:	83 c4 10             	add    $0x10,%esp
c0102c46:	83 ec 0c             	sub    $0xc,%esp
c0102c49:	ff 75 08             	pushl  0x8(%ebp)
c0102c4c:	e8 31 f5 ff ff       	call   c0102182 <search_file>
c0102c51:	83 c4 10             	add    $0x10,%esp
c0102c54:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102c57:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102c5b:	75 10                	jne    c0102c6d <do_unlink+0x58>
c0102c5d:	83 ec 0c             	sub    $0xc,%esp
c0102c60:	68 3b b4 10 c0       	push   $0xc010b43b
c0102c65:	e8 8d 5c 00 00       	call   c01088f7 <panic>
c0102c6a:	83 c4 10             	add    $0x10,%esp
c0102c6d:	83 ec 08             	sub    $0x8,%esp
c0102c70:	ff 75 d0             	pushl  -0x30(%ebp)
c0102c73:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102c79:	50                   	push   %eax
c0102c7a:	e8 01 f7 ff ff       	call   c0102380 <get_inode>
c0102c7f:	83 c4 10             	add    $0x10,%esp
c0102c82:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102c85:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102c89:	75 10                	jne    c0102c9b <do_unlink+0x86>
c0102c8b:	83 ec 0c             	sub    $0xc,%esp
c0102c8e:	68 3b b4 10 c0       	push   $0xc010b43b
c0102c93:	e8 5f 5c 00 00       	call   c01088f7 <panic>
c0102c98:	83 c4 10             	add    $0x10,%esp
c0102c9b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102c9e:	85 c0                	test   %eax,%eax
c0102ca0:	7e 10                	jle    c0102cb2 <do_unlink+0x9d>
c0102ca2:	83 ec 0c             	sub    $0xc,%esp
c0102ca5:	68 54 b4 10 c0       	push   $0xc010b454
c0102caa:	e8 48 5c 00 00       	call   c01088f7 <panic>
c0102caf:	83 c4 10             	add    $0x10,%esp
c0102cb2:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102cb8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102cbb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102cbe:	8d 50 07             	lea    0x7(%eax),%edx
c0102cc1:	85 c0                	test   %eax,%eax
c0102cc3:	0f 48 c2             	cmovs  %edx,%eax
c0102cc6:	c1 f8 03             	sar    $0x3,%eax
c0102cc9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102ccc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102ccf:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102cd5:	85 c0                	test   %eax,%eax
c0102cd7:	0f 48 c2             	cmovs  %edx,%eax
c0102cda:	c1 f8 09             	sar    $0x9,%eax
c0102cdd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102ce0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102ce3:	99                   	cltd   
c0102ce4:	c1 ea 1d             	shr    $0x1d,%edx
c0102ce7:	01 d0                	add    %edx,%eax
c0102ce9:	83 e0 07             	and    $0x7,%eax
c0102cec:	29 d0                	sub    %edx,%eax
c0102cee:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102cf1:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102cf8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102cfd:	89 c2                	mov    %eax,%edx
c0102cff:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102d02:	83 c0 02             	add    $0x2,%eax
c0102d05:	83 ec 0c             	sub    $0xc,%esp
c0102d08:	6a 07                	push   $0x7
c0102d0a:	68 00 02 00 00       	push   $0x200
c0102d0f:	52                   	push   %edx
c0102d10:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d13:	50                   	push   %eax
c0102d14:	e8 6b eb ff ff       	call   c0101884 <rd_wt>
c0102d19:	83 c4 20             	add    $0x20,%esp
c0102d1c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d22:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d25:	01 d0                	add    %edx,%eax
c0102d27:	0f b6 10             	movzbl (%eax),%edx
c0102d2a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102d2d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102d32:	89 c1                	mov    %eax,%ecx
c0102d34:	d3 e3                	shl    %cl,%ebx
c0102d36:	89 d8                	mov    %ebx,%eax
c0102d38:	f7 d0                	not    %eax
c0102d3a:	89 c3                	mov    %eax,%ebx
c0102d3c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102d42:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d45:	01 c8                	add    %ecx,%eax
c0102d47:	21 da                	and    %ebx,%edx
c0102d49:	88 10                	mov    %dl,(%eax)
c0102d4b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d50:	89 c2                	mov    %eax,%edx
c0102d52:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102d55:	83 c0 02             	add    $0x2,%eax
c0102d58:	83 ec 0c             	sub    $0xc,%esp
c0102d5b:	6a 0a                	push   $0xa
c0102d5d:	68 00 02 00 00       	push   $0x200
c0102d62:	52                   	push   %edx
c0102d63:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d66:	50                   	push   %eax
c0102d67:	e8 18 eb ff ff       	call   c0101884 <rd_wt>
c0102d6c:	83 c4 20             	add    $0x20,%esp
c0102d6f:	e8 ec 08 00 00       	call   c0103660 <get_super_block>
c0102d74:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102d77:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102d7d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102d80:	8b 00                	mov    (%eax),%eax
c0102d82:	29 c2                	sub    %eax,%edx
c0102d84:	89 d0                	mov    %edx,%eax
c0102d86:	83 c0 01             	add    $0x1,%eax
c0102d89:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102d8c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102d8f:	8d 50 07             	lea    0x7(%eax),%edx
c0102d92:	85 c0                	test   %eax,%eax
c0102d94:	0f 48 c2             	cmovs  %edx,%eax
c0102d97:	c1 f8 03             	sar    $0x3,%eax
c0102d9a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102d9d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102da0:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102da6:	85 c0                	test   %eax,%eax
c0102da8:	0f 48 c2             	cmovs  %edx,%eax
c0102dab:	c1 f8 09             	sar    $0x9,%eax
c0102dae:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102db1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102db4:	99                   	cltd   
c0102db5:	c1 ea 1d             	shr    $0x1d,%edx
c0102db8:	01 d0                	add    %edx,%eax
c0102dba:	83 e0 07             	and    $0x7,%eax
c0102dbd:	29 d0                	sub    %edx,%eax
c0102dbf:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102dc2:	b8 08 00 00 00       	mov    $0x8,%eax
c0102dc7:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102dca:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102dcd:	29 c2                	sub    %eax,%edx
c0102dcf:	89 d0                	mov    %edx,%eax
c0102dd1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102dd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102dd7:	8d 50 07             	lea    0x7(%eax),%edx
c0102dda:	85 c0                	test   %eax,%eax
c0102ddc:	0f 48 c2             	cmovs  %edx,%eax
c0102ddf:	c1 f8 03             	sar    $0x3,%eax
c0102de2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102de5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102dea:	89 c1                	mov    %eax,%ecx
c0102dec:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102def:	8b 40 04             	mov    0x4(%eax),%eax
c0102df2:	8d 50 02             	lea    0x2(%eax),%edx
c0102df5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102df8:	01 d0                	add    %edx,%eax
c0102dfa:	83 ec 0c             	sub    $0xc,%esp
c0102dfd:	6a 07                	push   $0x7
c0102dff:	68 00 02 00 00       	push   $0x200
c0102e04:	51                   	push   %ecx
c0102e05:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e08:	50                   	push   %eax
c0102e09:	e8 76 ea ff ff       	call   c0101884 <rd_wt>
c0102e0e:	83 c4 20             	add    $0x20,%esp
c0102e11:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102e17:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e1a:	01 d0                	add    %edx,%eax
c0102e1c:	0f b6 10             	movzbl (%eax),%edx
c0102e1f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102e22:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102e27:	89 c1                	mov    %eax,%ecx
c0102e29:	d3 e3                	shl    %cl,%ebx
c0102e2b:	89 d8                	mov    %ebx,%eax
c0102e2d:	f7 d0                	not    %eax
c0102e2f:	89 c3                	mov    %eax,%ebx
c0102e31:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102e37:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e3a:	01 c8                	add    %ecx,%eax
c0102e3c:	21 da                	and    %ebx,%edx
c0102e3e:	88 10                	mov    %dl,(%eax)
c0102e40:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102e47:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102e4a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102e4d:	eb 6b                	jmp    c0102eba <do_unlink+0x2a5>
c0102e4f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102e56:	75 4c                	jne    c0102ea4 <do_unlink+0x28f>
c0102e58:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102e5f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e64:	83 ec 0c             	sub    $0xc,%esp
c0102e67:	6a 0a                	push   $0xa
c0102e69:	68 00 02 00 00       	push   $0x200
c0102e6e:	50                   	push   %eax
c0102e6f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e72:	ff 75 ec             	pushl  -0x14(%ebp)
c0102e75:	e8 0a ea ff ff       	call   c0101884 <rd_wt>
c0102e7a:	83 c4 20             	add    $0x20,%esp
c0102e7d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e82:	89 c1                	mov    %eax,%ecx
c0102e84:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102e87:	8d 50 01             	lea    0x1(%eax),%edx
c0102e8a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102e8d:	83 ec 0c             	sub    $0xc,%esp
c0102e90:	6a 07                	push   $0x7
c0102e92:	68 00 02 00 00       	push   $0x200
c0102e97:	51                   	push   %ecx
c0102e98:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e9b:	50                   	push   %eax
c0102e9c:	e8 e3 e9 ff ff       	call   c0101884 <rd_wt>
c0102ea1:	83 c4 20             	add    $0x20,%esp
c0102ea4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102eaa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ead:	01 d0                	add    %edx,%eax
c0102eaf:	c6 00 00             	movb   $0x0,(%eax)
c0102eb2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102eb6:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102eba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ebd:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102ec0:	7c 8d                	jl     c0102e4f <do_unlink+0x23a>
c0102ec2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102ec9:	75 4c                	jne    c0102f17 <do_unlink+0x302>
c0102ecb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102ed2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ed7:	83 ec 0c             	sub    $0xc,%esp
c0102eda:	6a 0a                	push   $0xa
c0102edc:	68 00 02 00 00       	push   $0x200
c0102ee1:	50                   	push   %eax
c0102ee2:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ee5:	ff 75 ec             	pushl  -0x14(%ebp)
c0102ee8:	e8 97 e9 ff ff       	call   c0101884 <rd_wt>
c0102eed:	83 c4 20             	add    $0x20,%esp
c0102ef0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ef5:	89 c1                	mov    %eax,%ecx
c0102ef7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102efa:	8d 50 01             	lea    0x1(%eax),%edx
c0102efd:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102f00:	83 ec 0c             	sub    $0xc,%esp
c0102f03:	6a 07                	push   $0x7
c0102f05:	68 00 02 00 00       	push   $0x200
c0102f0a:	51                   	push   %ecx
c0102f0b:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f0e:	50                   	push   %eax
c0102f0f:	e8 70 e9 ff ff       	call   c0101884 <rd_wt>
c0102f14:	83 c4 20             	add    $0x20,%esp
c0102f17:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102f1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f20:	01 d0                	add    %edx,%eax
c0102f22:	0f b6 10             	movzbl (%eax),%edx
c0102f25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102f28:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102f2d:	89 c1                	mov    %eax,%ecx
c0102f2f:	d3 e3                	shl    %cl,%ebx
c0102f31:	89 d8                	mov    %ebx,%eax
c0102f33:	89 c3                	mov    %eax,%ebx
c0102f35:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102f3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f3e:	01 c8                	add    %ecx,%eax
c0102f40:	21 da                	and    %ebx,%edx
c0102f42:	88 10                	mov    %dl,(%eax)
c0102f44:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f49:	83 ec 0c             	sub    $0xc,%esp
c0102f4c:	6a 0a                	push   $0xa
c0102f4e:	68 00 02 00 00       	push   $0x200
c0102f53:	50                   	push   %eax
c0102f54:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f57:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f5a:	e8 25 e9 ff ff       	call   c0101884 <rd_wt>
c0102f5f:	83 c4 20             	add    $0x20,%esp
c0102f62:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102f69:	00 00 00 
c0102f6c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102f73:	00 00 00 
c0102f76:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102f7d:	00 00 00 
c0102f80:	83 ec 0c             	sub    $0xc,%esp
c0102f83:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102f89:	50                   	push   %eax
c0102f8a:	e8 ed 04 00 00       	call   c010347c <sync_inode>
c0102f8f:	83 c4 10             	add    $0x10,%esp
c0102f92:	83 ec 0c             	sub    $0xc,%esp
c0102f95:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102f9b:	50                   	push   %eax
c0102f9c:	e8 2f 06 00 00       	call   c01035d0 <put_inode>
c0102fa1:	83 c4 10             	add    $0x10,%esp
c0102fa4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102fa7:	8b 00                	mov    (%eax),%eax
c0102fa9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102fac:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102fb3:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102fb6:	8b 40 04             	mov    0x4(%eax),%eax
c0102fb9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102fbc:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102fbf:	8b 40 0c             	mov    0xc(%eax),%eax
c0102fc2:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102fc5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102fc8:	c1 e8 04             	shr    $0x4,%eax
c0102fcb:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102fce:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102fd5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102fdc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102fe3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0102fea:	e9 a5 00 00 00       	jmp    c0103094 <do_unlink+0x47f>
c0102fef:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ff4:	89 c1                	mov    %eax,%ecx
c0102ff6:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102ff9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102ffc:	01 d0                	add    %edx,%eax
c0102ffe:	83 ec 0c             	sub    $0xc,%esp
c0103001:	6a 07                	push   $0x7
c0103003:	68 00 02 00 00       	push   $0x200
c0103008:	51                   	push   %ecx
c0103009:	ff 75 b8             	pushl  -0x48(%ebp)
c010300c:	50                   	push   %eax
c010300d:	e8 72 e8 ff ff       	call   c0101884 <rd_wt>
c0103012:	83 c4 20             	add    $0x20,%esp
c0103015:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010301a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010301d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0103024:	eb 51                	jmp    c0103077 <do_unlink+0x462>
c0103026:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010302a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010302d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103030:	7f 4f                	jg     c0103081 <do_unlink+0x46c>
c0103032:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103035:	83 c0 10             	add    $0x10,%eax
c0103038:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010303b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010303e:	83 c0 04             	add    $0x4,%eax
c0103041:	83 ec 08             	sub    $0x8,%esp
c0103044:	ff 75 08             	pushl  0x8(%ebp)
c0103047:	50                   	push   %eax
c0103048:	e8 9f 68 00 00       	call   c01098ec <strcmp>
c010304d:	83 c4 10             	add    $0x10,%esp
c0103050:	85 c0                	test   %eax,%eax
c0103052:	75 1b                	jne    c010306f <do_unlink+0x45a>
c0103054:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c010305b:	83 ec 04             	sub    $0x4,%esp
c010305e:	6a 10                	push   $0x10
c0103060:	6a 00                	push   $0x0
c0103062:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103065:	e8 65 91 00 00       	call   c010c1cf <Memset>
c010306a:	83 c4 10             	add    $0x10,%esp
c010306d:	eb 13                	jmp    c0103082 <do_unlink+0x46d>
c010306f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0103073:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0103077:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010307a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010307d:	7c a7                	jl     c0103026 <do_unlink+0x411>
c010307f:	eb 01                	jmp    c0103082 <do_unlink+0x46d>
c0103081:	90                   	nop
c0103082:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103085:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103088:	7f 16                	jg     c01030a0 <do_unlink+0x48b>
c010308a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010308e:	75 10                	jne    c01030a0 <do_unlink+0x48b>
c0103090:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0103094:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103097:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010309a:	0f 8c 4f ff ff ff    	jl     c0102fef <do_unlink+0x3da>
c01030a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01030a3:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01030a6:	75 17                	jne    c01030bf <do_unlink+0x4aa>
c01030a8:	8b 45 98             	mov    -0x68(%ebp),%eax
c01030ab:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01030ae:	89 50 04             	mov    %edx,0x4(%eax)
c01030b1:	83 ec 0c             	sub    $0xc,%esp
c01030b4:	ff 75 98             	pushl  -0x68(%ebp)
c01030b7:	e8 c0 03 00 00       	call   c010347c <sync_inode>
c01030bc:	83 c4 10             	add    $0x10,%esp
c01030bf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01030c3:	74 26                	je     c01030eb <do_unlink+0x4d6>
c01030c5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030ca:	89 c1                	mov    %eax,%ecx
c01030cc:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01030cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030d2:	01 d0                	add    %edx,%eax
c01030d4:	83 ec 0c             	sub    $0xc,%esp
c01030d7:	6a 0a                	push   $0xa
c01030d9:	68 00 02 00 00       	push   $0x200
c01030de:	51                   	push   %ecx
c01030df:	ff 75 b8             	pushl  -0x48(%ebp)
c01030e2:	50                   	push   %eax
c01030e3:	e8 9c e7 ff ff       	call   c0101884 <rd_wt>
c01030e8:	83 c4 20             	add    $0x20,%esp
c01030eb:	90                   	nop
c01030ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01030ef:	c9                   	leave  
c01030f0:	c3                   	ret    

c01030f1 <do_rdwt>:
c01030f1:	55                   	push   %ebp
c01030f2:	89 e5                	mov    %esp,%ebp
c01030f4:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01030fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01030fd:	8b 40 78             	mov    0x78(%eax),%eax
c0103100:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103103:	8b 45 08             	mov    0x8(%ebp),%eax
c0103106:	8b 40 60             	mov    0x60(%eax),%eax
c0103109:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010310c:	8b 45 08             	mov    0x8(%ebp),%eax
c010310f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103112:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103115:	8b 45 08             	mov    0x8(%ebp),%eax
c0103118:	8b 00                	mov    (%eax),%eax
c010311a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010311d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103120:	8b 40 10             	mov    0x10(%eax),%eax
c0103123:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103126:	8b 45 08             	mov    0x8(%ebp),%eax
c0103129:	8b 40 50             	mov    0x50(%eax),%eax
c010312c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010312f:	83 ec 0c             	sub    $0xc,%esp
c0103132:	ff 75 d0             	pushl  -0x30(%ebp)
c0103135:	e8 0c 07 00 00       	call   c0103846 <pid2proc>
c010313a:	83 c4 10             	add    $0x10,%esp
c010313d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103140:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103143:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0103146:	83 c2 4c             	add    $0x4c,%edx
c0103149:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010314d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103150:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103153:	8b 40 08             	mov    0x8(%eax),%eax
c0103156:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103159:	8b 45 08             	mov    0x8(%ebp),%eax
c010315c:	8b 00                	mov    (%eax),%eax
c010315e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103161:	83 ec 08             	sub    $0x8,%esp
c0103164:	ff 75 bc             	pushl  -0x44(%ebp)
c0103167:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010316d:	50                   	push   %eax
c010316e:	e8 0d f2 ff ff       	call   c0102380 <get_inode>
c0103173:	83 c4 10             	add    $0x10,%esp
c0103176:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103179:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010317d:	75 10                	jne    c010318f <do_rdwt+0x9e>
c010317f:	83 ec 0c             	sub    $0xc,%esp
c0103182:	68 8c b4 10 c0       	push   $0xc010b48c
c0103187:	e8 6b 57 00 00       	call   c01088f7 <panic>
c010318c:	83 c4 10             	add    $0x10,%esp
c010318f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103195:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103198:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010319b:	8b 40 04             	mov    0x4(%eax),%eax
c010319e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01031a1:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01031a5:	74 22                	je     c01031c9 <do_rdwt+0xd8>
c01031a7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01031ab:	74 1c                	je     c01031c9 <do_rdwt+0xd8>
c01031ad:	68 a8 04 00 00       	push   $0x4a8
c01031b2:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01031b7:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01031bc:	68 9c b4 10 c0       	push   $0xc010b49c
c01031c1:	e8 4f 57 00 00       	call   c0108915 <assertion_failure>
c01031c6:	83 c4 10             	add    $0x10,%esp
c01031c9:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c01031cf:	83 f8 01             	cmp    $0x1,%eax
c01031d2:	0f 85 86 00 00 00    	jne    c010325e <do_rdwt+0x16d>
c01031d8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01031dc:	75 09                	jne    c01031e7 <do_rdwt+0xf6>
c01031de:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c01031e5:	eb 0d                	jmp    c01031f4 <do_rdwt+0x103>
c01031e7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01031eb:	75 07                	jne    c01031f4 <do_rdwt+0x103>
c01031ed:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c01031f4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01031f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01031fa:	89 50 78             	mov    %edx,0x78(%eax)
c01031fd:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103200:	8b 45 08             	mov    0x8(%ebp),%eax
c0103203:	89 50 68             	mov    %edx,0x68(%eax)
c0103206:	83 ec 04             	sub    $0x4,%esp
c0103209:	6a 04                	push   $0x4
c010320b:	ff 75 08             	pushl  0x8(%ebp)
c010320e:	6a 03                	push   $0x3
c0103210:	e8 70 63 00 00       	call   c0109585 <send_rec>
c0103215:	83 c4 10             	add    $0x10,%esp
c0103218:	8b 45 08             	mov    0x8(%ebp),%eax
c010321b:	8b 40 78             	mov    0x78(%eax),%eax
c010321e:	83 f8 66             	cmp    $0x66,%eax
c0103221:	75 13                	jne    c0103236 <do_rdwt+0x145>
c0103223:	83 ec 04             	sub    $0x4,%esp
c0103226:	ff 75 b8             	pushl  -0x48(%ebp)
c0103229:	ff 75 08             	pushl  0x8(%ebp)
c010322c:	6a 01                	push   $0x1
c010322e:	e8 52 63 00 00       	call   c0109585 <send_rec>
c0103233:	83 c4 10             	add    $0x10,%esp
c0103236:	8b 45 08             	mov    0x8(%ebp),%eax
c0103239:	8b 40 78             	mov    0x78(%eax),%eax
c010323c:	83 f8 65             	cmp    $0x65,%eax
c010323f:	75 13                	jne    c0103254 <do_rdwt+0x163>
c0103241:	83 ec 04             	sub    $0x4,%esp
c0103244:	ff 75 b8             	pushl  -0x48(%ebp)
c0103247:	ff 75 08             	pushl  0x8(%ebp)
c010324a:	6a 01                	push   $0x1
c010324c:	e8 34 63 00 00       	call   c0109585 <send_rec>
c0103251:	83 c4 10             	add    $0x10,%esp
c0103254:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103259:	e9 1c 02 00 00       	jmp    c010347a <do_rdwt+0x389>
c010325e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103262:	75 18                	jne    c010327c <do_rdwt+0x18b>
c0103264:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010326a:	c1 e0 09             	shl    $0x9,%eax
c010326d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103270:	75 0a                	jne    c010327c <do_rdwt+0x18b>
c0103272:	b8 00 00 00 00       	mov    $0x0,%eax
c0103277:	e9 fe 01 00 00       	jmp    c010347a <do_rdwt+0x389>
c010327c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103280:	75 14                	jne    c0103296 <do_rdwt+0x1a5>
c0103282:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103285:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103288:	01 d0                	add    %edx,%eax
c010328a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010328d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0103291:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103294:	eb 19                	jmp    c01032af <do_rdwt+0x1be>
c0103296:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103299:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010329c:	01 c2                	add    %eax,%edx
c010329e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01032a4:	c1 e0 09             	shl    $0x9,%eax
c01032a7:	39 c2                	cmp    %eax,%edx
c01032a9:	0f 4e c2             	cmovle %edx,%eax
c01032ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01032af:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01032b2:	99                   	cltd   
c01032b3:	c1 ea 17             	shr    $0x17,%edx
c01032b6:	01 d0                	add    %edx,%eax
c01032b8:	25 ff 01 00 00       	and    $0x1ff,%eax
c01032bd:	29 d0                	sub    %edx,%eax
c01032bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01032c2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01032c8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01032cb:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01032d1:	85 c0                	test   %eax,%eax
c01032d3:	0f 48 c1             	cmovs  %ecx,%eax
c01032d6:	c1 f8 09             	sar    $0x9,%eax
c01032d9:	01 d0                	add    %edx,%eax
c01032db:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01032de:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01032e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01032e7:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01032ed:	85 c0                	test   %eax,%eax
c01032ef:	0f 48 c1             	cmovs  %ecx,%eax
c01032f2:	c1 f8 09             	sar    $0x9,%eax
c01032f5:	01 d0                	add    %edx,%eax
c01032f7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01032fa:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01032fd:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103300:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103305:	39 d0                	cmp    %edx,%eax
c0103307:	7d 0b                	jge    c0103314 <do_rdwt+0x223>
c0103309:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010330c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010330f:	83 c0 01             	add    $0x1,%eax
c0103312:	eb 05                	jmp    c0103319 <do_rdwt+0x228>
c0103314:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103319:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010331c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010331f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103322:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103329:	8b 45 08             	mov    0x8(%ebp),%eax
c010332c:	8b 00                	mov    (%eax),%eax
c010332e:	83 ec 0c             	sub    $0xc,%esp
c0103331:	50                   	push   %eax
c0103332:	e8 0f 05 00 00       	call   c0103846 <pid2proc>
c0103337:	83 c4 10             	add    $0x10,%esp
c010333a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010333d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103340:	83 ec 08             	sub    $0x8,%esp
c0103343:	50                   	push   %eax
c0103344:	ff 75 cc             	pushl  -0x34(%ebp)
c0103347:	e8 43 2b 00 00       	call   c0105e8f <alloc_virtual_memory>
c010334c:	83 c4 10             	add    $0x10,%esp
c010334f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103352:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103355:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103358:	e9 c5 00 00 00       	jmp    c0103422 <do_rdwt+0x331>
c010335d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103360:	c1 e0 09             	shl    $0x9,%eax
c0103363:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103366:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103369:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010336d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103370:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103377:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010337b:	75 46                	jne    c01033c3 <do_rdwt+0x2d2>
c010337d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103380:	c1 e0 09             	shl    $0x9,%eax
c0103383:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103389:	83 ec 0c             	sub    $0xc,%esp
c010338c:	6a 07                	push   $0x7
c010338e:	50                   	push   %eax
c010338f:	52                   	push   %edx
c0103390:	ff 75 90             	pushl  -0x70(%ebp)
c0103393:	ff 75 e0             	pushl  -0x20(%ebp)
c0103396:	e8 e9 e4 ff ff       	call   c0101884 <rd_wt>
c010339b:	83 c4 20             	add    $0x20,%esp
c010339e:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01033a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033a7:	01 d0                	add    %edx,%eax
c01033a9:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01033ac:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01033af:	01 ca                	add    %ecx,%edx
c01033b1:	83 ec 04             	sub    $0x4,%esp
c01033b4:	ff 75 94             	pushl  -0x6c(%ebp)
c01033b7:	50                   	push   %eax
c01033b8:	52                   	push   %edx
c01033b9:	e8 3e 39 00 00       	call   c0106cfc <Memcpy>
c01033be:	83 c4 10             	add    $0x10,%esp
c01033c1:	eb 46                	jmp    c0103409 <do_rdwt+0x318>
c01033c3:	8b 55 98             	mov    -0x68(%ebp),%edx
c01033c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01033c9:	01 d0                	add    %edx,%eax
c01033cb:	89 c1                	mov    %eax,%ecx
c01033cd:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01033d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033d6:	01 d0                	add    %edx,%eax
c01033d8:	83 ec 04             	sub    $0x4,%esp
c01033db:	ff 75 94             	pushl  -0x6c(%ebp)
c01033de:	51                   	push   %ecx
c01033df:	50                   	push   %eax
c01033e0:	e8 17 39 00 00       	call   c0106cfc <Memcpy>
c01033e5:	83 c4 10             	add    $0x10,%esp
c01033e8:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01033eb:	c1 e0 09             	shl    $0x9,%eax
c01033ee:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01033f4:	83 ec 0c             	sub    $0xc,%esp
c01033f7:	6a 0a                	push   $0xa
c01033f9:	50                   	push   %eax
c01033fa:	52                   	push   %edx
c01033fb:	ff 75 90             	pushl  -0x70(%ebp)
c01033fe:	ff 75 e0             	pushl  -0x20(%ebp)
c0103401:	e8 7e e4 ff ff       	call   c0101884 <rd_wt>
c0103406:	83 c4 20             	add    $0x20,%esp
c0103409:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010340c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010340f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103412:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103415:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010341c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010341f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103422:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103425:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103428:	7f 0a                	jg     c0103434 <do_rdwt+0x343>
c010342a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010342e:	0f 85 29 ff ff ff    	jne    c010335d <do_rdwt+0x26c>
c0103434:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103437:	8b 50 04             	mov    0x4(%eax),%edx
c010343a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010343d:	01 c2                	add    %eax,%edx
c010343f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103442:	89 50 04             	mov    %edx,0x4(%eax)
c0103445:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103448:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010344b:	01 c2                	add    %eax,%edx
c010344d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103453:	39 c2                	cmp    %eax,%edx
c0103455:	7e 20                	jle    c0103477 <do_rdwt+0x386>
c0103457:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010345a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010345d:	01 d0                	add    %edx,%eax
c010345f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103465:	83 ec 0c             	sub    $0xc,%esp
c0103468:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010346e:	50                   	push   %eax
c010346f:	e8 08 00 00 00       	call   c010347c <sync_inode>
c0103474:	83 c4 10             	add    $0x10,%esp
c0103477:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010347a:	c9                   	leave  
c010347b:	c3                   	ret    

c010347c <sync_inode>:
c010347c:	55                   	push   %ebp
c010347d:	89 e5                	mov    %esp,%ebp
c010347f:	53                   	push   %ebx
c0103480:	83 ec 34             	sub    $0x34,%esp
c0103483:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010348a:	eb 74                	jmp    c0103500 <sync_inode+0x84>
c010348c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010348f:	89 d0                	mov    %edx,%eax
c0103491:	c1 e0 02             	shl    $0x2,%eax
c0103494:	01 d0                	add    %edx,%eax
c0103496:	c1 e0 03             	shl    $0x3,%eax
c0103499:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c010349e:	8b 10                	mov    (%eax),%edx
c01034a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01034a3:	8b 40 10             	mov    0x10(%eax),%eax
c01034a6:	39 c2                	cmp    %eax,%edx
c01034a8:	75 52                	jne    c01034fc <sync_inode+0x80>
c01034aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01034ad:	89 d0                	mov    %edx,%eax
c01034af:	c1 e0 02             	shl    $0x2,%eax
c01034b2:	01 d0                	add    %edx,%eax
c01034b4:	c1 e0 03             	shl    $0x3,%eax
c01034b7:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c01034bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01034c0:	8b 08                	mov    (%eax),%ecx
c01034c2:	89 0a                	mov    %ecx,(%edx)
c01034c4:	8b 48 04             	mov    0x4(%eax),%ecx
c01034c7:	89 4a 04             	mov    %ecx,0x4(%edx)
c01034ca:	8b 48 08             	mov    0x8(%eax),%ecx
c01034cd:	89 4a 08             	mov    %ecx,0x8(%edx)
c01034d0:	8b 48 0c             	mov    0xc(%eax),%ecx
c01034d3:	89 4a 0c             	mov    %ecx,0xc(%edx)
c01034d6:	8b 48 10             	mov    0x10(%eax),%ecx
c01034d9:	89 4a 10             	mov    %ecx,0x10(%edx)
c01034dc:	8b 48 14             	mov    0x14(%eax),%ecx
c01034df:	89 4a 14             	mov    %ecx,0x14(%edx)
c01034e2:	8b 48 18             	mov    0x18(%eax),%ecx
c01034e5:	89 4a 18             	mov    %ecx,0x18(%edx)
c01034e8:	8b 48 1c             	mov    0x1c(%eax),%ecx
c01034eb:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c01034ee:	8b 48 20             	mov    0x20(%eax),%ecx
c01034f1:	89 4a 20             	mov    %ecx,0x20(%edx)
c01034f4:	8b 40 24             	mov    0x24(%eax),%eax
c01034f7:	89 42 24             	mov    %eax,0x24(%edx)
c01034fa:	eb 0a                	jmp    c0103506 <sync_inode+0x8a>
c01034fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103500:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103504:	7e 86                	jle    c010348c <sync_inode+0x10>
c0103506:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010350d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103510:	8b 40 10             	mov    0x10(%eax),%eax
c0103513:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103516:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103519:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010351c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103521:	99                   	cltd   
c0103522:	f7 7d f0             	idivl  -0x10(%ebp)
c0103525:	89 c3                	mov    %eax,%ebx
c0103527:	89 c8                	mov    %ecx,%eax
c0103529:	99                   	cltd   
c010352a:	f7 fb                	idiv   %ebx
c010352c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010352f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103532:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103535:	b8 00 02 00 00       	mov    $0x200,%eax
c010353a:	99                   	cltd   
c010353b:	f7 7d f0             	idivl  -0x10(%ebp)
c010353e:	89 c3                	mov    %eax,%ebx
c0103540:	89 c8                	mov    %ecx,%eax
c0103542:	99                   	cltd   
c0103543:	f7 fb                	idiv   %ebx
c0103545:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103548:	8b 45 08             	mov    0x8(%ebp),%eax
c010354b:	8b 40 20             	mov    0x20(%eax),%eax
c010354e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103551:	e8 0a 01 00 00       	call   c0103660 <get_super_block>
c0103556:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103559:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010355c:	8b 40 04             	mov    0x4(%eax),%eax
c010355f:	8d 50 02             	lea    0x2(%eax),%edx
c0103562:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103565:	8b 40 08             	mov    0x8(%eax),%eax
c0103568:	01 c2                	add    %eax,%edx
c010356a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010356d:	01 d0                	add    %edx,%eax
c010356f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103572:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103577:	83 ec 0c             	sub    $0xc,%esp
c010357a:	6a 07                	push   $0x7
c010357c:	68 00 02 00 00       	push   $0x200
c0103581:	50                   	push   %eax
c0103582:	ff 75 e0             	pushl  -0x20(%ebp)
c0103585:	ff 75 d8             	pushl  -0x28(%ebp)
c0103588:	e8 f7 e2 ff ff       	call   c0101884 <rd_wt>
c010358d:	83 c4 20             	add    $0x20,%esp
c0103590:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0103595:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103598:	83 ec 04             	sub    $0x4,%esp
c010359b:	ff 75 f0             	pushl  -0x10(%ebp)
c010359e:	ff 75 08             	pushl  0x8(%ebp)
c01035a1:	ff 75 d4             	pushl  -0x2c(%ebp)
c01035a4:	e8 53 37 00 00       	call   c0106cfc <Memcpy>
c01035a9:	83 c4 10             	add    $0x10,%esp
c01035ac:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01035b1:	83 ec 0c             	sub    $0xc,%esp
c01035b4:	6a 0a                	push   $0xa
c01035b6:	68 00 02 00 00       	push   $0x200
c01035bb:	50                   	push   %eax
c01035bc:	ff 75 e0             	pushl  -0x20(%ebp)
c01035bf:	ff 75 d8             	pushl  -0x28(%ebp)
c01035c2:	e8 bd e2 ff ff       	call   c0101884 <rd_wt>
c01035c7:	83 c4 20             	add    $0x20,%esp
c01035ca:	90                   	nop
c01035cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01035ce:	c9                   	leave  
c01035cf:	c3                   	ret    

c01035d0 <put_inode>:
c01035d0:	55                   	push   %ebp
c01035d1:	89 e5                	mov    %esp,%ebp
c01035d3:	83 ec 08             	sub    $0x8,%esp
c01035d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01035d9:	8b 40 24             	mov    0x24(%eax),%eax
c01035dc:	85 c0                	test   %eax,%eax
c01035de:	7f 1c                	jg     c01035fc <put_inode+0x2c>
c01035e0:	68 4d 05 00 00       	push   $0x54d
c01035e5:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01035ea:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01035ef:	68 d0 b4 10 c0       	push   $0xc010b4d0
c01035f4:	e8 1c 53 00 00       	call   c0108915 <assertion_failure>
c01035f9:	83 c4 10             	add    $0x10,%esp
c01035fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01035ff:	8b 40 24             	mov    0x24(%eax),%eax
c0103602:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103605:	8b 45 08             	mov    0x8(%ebp),%eax
c0103608:	89 50 24             	mov    %edx,0x24(%eax)
c010360b:	90                   	nop
c010360c:	c9                   	leave  
c010360d:	c3                   	ret    

c010360e <do_close>:
c010360e:	55                   	push   %ebp
c010360f:	89 e5                	mov    %esp,%ebp
c0103611:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103616:	8b 55 08             	mov    0x8(%ebp),%edx
c0103619:	83 c2 4c             	add    $0x4c,%edx
c010361c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103620:	8b 50 0c             	mov    0xc(%eax),%edx
c0103623:	83 ea 01             	sub    $0x1,%edx
c0103626:	89 50 0c             	mov    %edx,0xc(%eax)
c0103629:	8b 40 0c             	mov    0xc(%eax),%eax
c010362c:	85 c0                	test   %eax,%eax
c010362e:	75 16                	jne    c0103646 <do_close+0x38>
c0103630:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103635:	8b 55 08             	mov    0x8(%ebp),%edx
c0103638:	83 c2 4c             	add    $0x4c,%edx
c010363b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010363f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103646:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010364b:	8b 55 08             	mov    0x8(%ebp),%edx
c010364e:	83 c2 4c             	add    $0x4c,%edx
c0103651:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103658:	00 
c0103659:	b8 00 00 00 00       	mov    $0x0,%eax
c010365e:	5d                   	pop    %ebp
c010365f:	c3                   	ret    

c0103660 <get_super_block>:
c0103660:	55                   	push   %ebp
c0103661:	89 e5                	mov    %esp,%ebp
c0103663:	83 ec 08             	sub    $0x8,%esp
c0103666:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010366b:	83 ec 0c             	sub    $0xc,%esp
c010366e:	6a 07                	push   $0x7
c0103670:	68 00 02 00 00       	push   $0x200
c0103675:	50                   	push   %eax
c0103676:	6a 20                	push   $0x20
c0103678:	6a 01                	push   $0x1
c010367a:	e8 05 e2 ff ff       	call   c0101884 <rd_wt>
c010367f:	83 c4 20             	add    $0x20,%esp
c0103682:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103688:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010368d:	8b 0a                	mov    (%edx),%ecx
c010368f:	89 08                	mov    %ecx,(%eax)
c0103691:	8b 4a 04             	mov    0x4(%edx),%ecx
c0103694:	89 48 04             	mov    %ecx,0x4(%eax)
c0103697:	8b 4a 08             	mov    0x8(%edx),%ecx
c010369a:	89 48 08             	mov    %ecx,0x8(%eax)
c010369d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01036a0:	89 48 0c             	mov    %ecx,0xc(%eax)
c01036a3:	8b 4a 10             	mov    0x10(%edx),%ecx
c01036a6:	89 48 10             	mov    %ecx,0x10(%eax)
c01036a9:	8b 4a 14             	mov    0x14(%edx),%ecx
c01036ac:	89 48 14             	mov    %ecx,0x14(%eax)
c01036af:	8b 4a 18             	mov    0x18(%edx),%ecx
c01036b2:	89 48 18             	mov    %ecx,0x18(%eax)
c01036b5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01036b8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01036bb:	8b 52 20             	mov    0x20(%edx),%edx
c01036be:	89 50 20             	mov    %edx,0x20(%eax)
c01036c1:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01036c6:	c9                   	leave  
c01036c7:	c3                   	ret    

c01036c8 <schedule_process>:
c01036c8:	55                   	push   %ebp
c01036c9:	89 e5                	mov    %esp,%ebp
c01036cb:	83 ec 18             	sub    $0x18,%esp
c01036ce:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c01036d5:	e8 14 cd ff ff       	call   c01003ee <get_running_thread_pcb>
c01036da:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01036dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036e0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01036e7:	84 c0                	test   %al,%al
c01036e9:	75 35                	jne    c0103720 <schedule_process+0x58>
c01036eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036ee:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c01036f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036f7:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01036fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103700:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103707:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010370a:	05 60 02 00 00       	add    $0x260,%eax
c010370f:	83 ec 08             	sub    $0x8,%esp
c0103712:	50                   	push   %eax
c0103713:	68 ec fd 10 c0       	push   $0xc010fdec
c0103718:	e8 9a 6b 00 00       	call   c010a2b7 <insertToDoubleLinkList>
c010371d:	83 c4 10             	add    $0x10,%esp
c0103720:	83 ec 0c             	sub    $0xc,%esp
c0103723:	68 ec fd 10 c0       	push   $0xc010fdec
c0103728:	e8 a6 69 00 00       	call   c010a0d3 <isListEmpty>
c010372d:	83 c4 10             	add    $0x10,%esp
c0103730:	84 c0                	test   %al,%al
c0103732:	74 19                	je     c010374d <schedule_process+0x85>
c0103734:	6a 1e                	push   $0x1e
c0103736:	68 df b4 10 c0       	push   $0xc010b4df
c010373b:	68 df b4 10 c0       	push   $0xc010b4df
c0103740:	68 e9 b4 10 c0       	push   $0xc010b4e9
c0103745:	e8 cb 51 00 00       	call   c0108915 <assertion_failure>
c010374a:	83 c4 10             	add    $0x10,%esp
c010374d:	83 ec 0c             	sub    $0xc,%esp
c0103750:	68 ec fd 10 c0       	push   $0xc010fdec
c0103755:	e8 e0 6b 00 00       	call   c010a33a <popFromDoubleLinkList>
c010375a:	83 c4 10             	add    $0x10,%esp
c010375d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103760:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103763:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103768:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010376b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010376e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103775:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103778:	8b 50 08             	mov    0x8(%eax),%edx
c010377b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010377e:	39 c2                	cmp    %eax,%edx
c0103780:	74 28                	je     c01037aa <schedule_process+0xe2>
c0103782:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103785:	05 00 10 00 00       	add    $0x1000,%eax
c010378a:	83 ec 0c             	sub    $0xc,%esp
c010378d:	50                   	push   %eax
c010378e:	e8 4c cc ff ff       	call   c01003df <update_tss>
c0103793:	83 c4 10             	add    $0x10,%esp
c0103796:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103799:	8b 40 08             	mov    0x8(%eax),%eax
c010379c:	83 ec 0c             	sub    $0xc,%esp
c010379f:	50                   	push   %eax
c01037a0:	e8 2d cc ff ff       	call   c01003d2 <update_cr3>
c01037a5:	83 c4 10             	add    $0x10,%esp
c01037a8:	eb 0f                	jmp    c01037b9 <schedule_process+0xf1>
c01037aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01037ad:	83 ec 0c             	sub    $0xc,%esp
c01037b0:	50                   	push   %eax
c01037b1:	e8 1c cc ff ff       	call   c01003d2 <update_cr3>
c01037b6:	83 c4 10             	add    $0x10,%esp
c01037b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037bc:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01037c1:	83 ec 08             	sub    $0x8,%esp
c01037c4:	ff 75 e8             	pushl  -0x18(%ebp)
c01037c7:	ff 75 f0             	pushl  -0x10(%ebp)
c01037ca:	e8 c1 68 00 00       	call   c010a090 <switch_to>
c01037cf:	83 c4 10             	add    $0x10,%esp
c01037d2:	90                   	nop
c01037d3:	c9                   	leave  
c01037d4:	c3                   	ret    

c01037d5 <clock_handler>:
c01037d5:	55                   	push   %ebp
c01037d6:	89 e5                	mov    %esp,%ebp
c01037d8:	83 ec 18             	sub    $0x18,%esp
c01037db:	e8 0e cc ff ff       	call   c01003ee <get_running_thread_pcb>
c01037e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01037e3:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c01037e8:	85 c0                	test   %eax,%eax
c01037ea:	74 0d                	je     c01037f9 <clock_handler+0x24>
c01037ec:	83 ec 0c             	sub    $0xc,%esp
c01037ef:	6a 04                	push   $0x4
c01037f1:	e8 29 60 00 00       	call   c010981f <inform_int>
c01037f6:	83 c4 10             	add    $0x10,%esp
c01037f9:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01037fe:	83 f8 64             	cmp    $0x64,%eax
c0103801:	75 0c                	jne    c010380f <clock_handler+0x3a>
c0103803:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c010380a:	00 00 00 
c010380d:	eb 0a                	jmp    c0103819 <clock_handler+0x44>
c010380f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103814:	83 f8 01             	cmp    $0x1,%eax
c0103817:	75 2a                	jne    c0103843 <clock_handler+0x6e>
c0103819:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010381c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103822:	85 c0                	test   %eax,%eax
c0103824:	74 16                	je     c010383c <clock_handler+0x67>
c0103826:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c010382b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103831:	83 ea 01             	sub    $0x1,%edx
c0103834:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010383a:	eb 08                	jmp    c0103844 <clock_handler+0x6f>
c010383c:	e8 87 fe ff ff       	call   c01036c8 <schedule_process>
c0103841:	eb 01                	jmp    c0103844 <clock_handler+0x6f>
c0103843:	90                   	nop
c0103844:	c9                   	leave  
c0103845:	c3                   	ret    

c0103846 <pid2proc>:
c0103846:	55                   	push   %ebp
c0103847:	89 e5                	mov    %esp,%ebp
c0103849:	83 ec 20             	sub    $0x20,%esp
c010384c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103853:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010385a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c010385f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103865:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103868:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010386b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103870:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103876:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103879:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010387c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103881:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103884:	eb 36                	jmp    c01038bc <pid2proc+0x76>
c0103886:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103889:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010388e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103891:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103895:	75 07                	jne    c010389e <pid2proc+0x58>
c0103897:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c010389e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038a1:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01038a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01038aa:	39 c2                	cmp    %eax,%edx
c01038ac:	75 05                	jne    c01038b3 <pid2proc+0x6d>
c01038ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038b1:	eb 17                	jmp    c01038ca <pid2proc+0x84>
c01038b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038b6:	8b 40 04             	mov    0x4(%eax),%eax
c01038b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038bc:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c01038c3:	75 c1                	jne    c0103886 <pid2proc+0x40>
c01038c5:	b8 00 00 00 00       	mov    $0x0,%eax
c01038ca:	c9                   	leave  
c01038cb:	c3                   	ret    

c01038cc <proc2pid>:
c01038cc:	55                   	push   %ebp
c01038cd:	89 e5                	mov    %esp,%ebp
c01038cf:	83 ec 10             	sub    $0x10,%esp
c01038d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01038d5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01038db:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038de:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038e1:	c9                   	leave  
c01038e2:	c3                   	ret    

c01038e3 <InitDescriptor>:
c01038e3:	55                   	push   %ebp
c01038e4:	89 e5                	mov    %esp,%ebp
c01038e6:	83 ec 04             	sub    $0x4,%esp
c01038e9:	8b 45 14             	mov    0x14(%ebp),%eax
c01038ec:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c01038f0:	8b 45 10             	mov    0x10(%ebp),%eax
c01038f3:	89 c2                	mov    %eax,%edx
c01038f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01038f8:	66 89 10             	mov    %dx,(%eax)
c01038fb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038fe:	89 c2                	mov    %eax,%edx
c0103900:	8b 45 08             	mov    0x8(%ebp),%eax
c0103903:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103907:	8b 45 0c             	mov    0xc(%ebp),%eax
c010390a:	c1 e8 10             	shr    $0x10,%eax
c010390d:	89 c2                	mov    %eax,%edx
c010390f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103912:	88 50 04             	mov    %dl,0x4(%eax)
c0103915:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103919:	89 c2                	mov    %eax,%edx
c010391b:	8b 45 08             	mov    0x8(%ebp),%eax
c010391e:	88 50 05             	mov    %dl,0x5(%eax)
c0103921:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103925:	66 c1 e8 08          	shr    $0x8,%ax
c0103929:	c1 e0 04             	shl    $0x4,%eax
c010392c:	89 c2                	mov    %eax,%edx
c010392e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103931:	c1 e8 10             	shr    $0x10,%eax
c0103934:	83 e0 0f             	and    $0xf,%eax
c0103937:	09 c2                	or     %eax,%edx
c0103939:	8b 45 08             	mov    0x8(%ebp),%eax
c010393c:	88 50 06             	mov    %dl,0x6(%eax)
c010393f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103942:	c1 e8 18             	shr    $0x18,%eax
c0103945:	89 c2                	mov    %eax,%edx
c0103947:	8b 45 08             	mov    0x8(%ebp),%eax
c010394a:	88 50 07             	mov    %dl,0x7(%eax)
c010394d:	90                   	nop
c010394e:	c9                   	leave  
c010394f:	c3                   	ret    

c0103950 <Seg2PhyAddr>:
c0103950:	55                   	push   %ebp
c0103951:	89 e5                	mov    %esp,%ebp
c0103953:	83 ec 10             	sub    $0x10,%esp
c0103956:	8b 45 08             	mov    0x8(%ebp),%eax
c0103959:	c1 e8 03             	shr    $0x3,%eax
c010395c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103963:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c010396a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010396d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103970:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103974:	0f b7 c0             	movzwl %ax,%eax
c0103977:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010397b:	0f b6 d2             	movzbl %dl,%edx
c010397e:	c1 e2 10             	shl    $0x10,%edx
c0103981:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103987:	09 d0                	or     %edx,%eax
c0103989:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010398c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010398f:	c9                   	leave  
c0103990:	c3                   	ret    

c0103991 <Seg2PhyAddrLDT>:
c0103991:	55                   	push   %ebp
c0103992:	89 e5                	mov    %esp,%ebp
c0103994:	83 ec 10             	sub    $0x10,%esp
c0103997:	8b 45 08             	mov    0x8(%ebp),%eax
c010399a:	c1 e8 03             	shr    $0x3,%eax
c010399d:	89 c2                	mov    %eax,%edx
c010399f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039a2:	83 c2 20             	add    $0x20,%edx
c01039a5:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c01039a9:	8b 02                	mov    (%edx),%eax
c01039ab:	8b 52 04             	mov    0x4(%edx),%edx
c01039ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01039b1:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01039b4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01039b8:	0f b7 c0             	movzwl %ax,%eax
c01039bb:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c01039bf:	0f b6 d2             	movzbl %dl,%edx
c01039c2:	c1 e2 10             	shl    $0x10,%edx
c01039c5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c01039cb:	09 d0                	or     %edx,%eax
c01039cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01039d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01039d3:	c9                   	leave  
c01039d4:	c3                   	ret    

c01039d5 <VirAddr2PhyAddr>:
c01039d5:	55                   	push   %ebp
c01039d6:	89 e5                	mov    %esp,%ebp
c01039d8:	83 ec 10             	sub    $0x10,%esp
c01039db:	8b 55 0c             	mov    0xc(%ebp),%edx
c01039de:	8b 45 08             	mov    0x8(%ebp),%eax
c01039e1:	01 d0                	add    %edx,%eax
c01039e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01039e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01039e9:	c9                   	leave  
c01039ea:	c3                   	ret    

c01039eb <v2l>:
c01039eb:	55                   	push   %ebp
c01039ec:	89 e5                	mov    %esp,%ebp
c01039ee:	83 ec 18             	sub    $0x18,%esp
c01039f1:	83 ec 0c             	sub    $0xc,%esp
c01039f4:	ff 75 08             	pushl  0x8(%ebp)
c01039f7:	e8 4a fe ff ff       	call   c0103846 <pid2proc>
c01039fc:	83 c4 10             	add    $0x10,%esp
c01039ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a02:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103a09:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a0c:	83 ec 08             	sub    $0x8,%esp
c0103a0f:	ff 75 f4             	pushl  -0xc(%ebp)
c0103a12:	50                   	push   %eax
c0103a13:	e8 79 ff ff ff       	call   c0103991 <Seg2PhyAddrLDT>
c0103a18:	83 c4 10             	add    $0x10,%esp
c0103a1b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103a1e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103a21:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a24:	01 d0                	add    %edx,%eax
c0103a26:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103a29:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a2c:	c9                   	leave  
c0103a2d:	c3                   	ret    

c0103a2e <init_propt>:
c0103a2e:	55                   	push   %ebp
c0103a2f:	89 e5                	mov    %esp,%ebp
c0103a31:	83 ec 38             	sub    $0x38,%esp
c0103a34:	6a 0e                	push   $0xe
c0103a36:	6a 08                	push   $0x8
c0103a38:	68 71 01 10 c0       	push   $0xc0100171
c0103a3d:	6a 20                	push   $0x20
c0103a3f:	e8 6b 01 00 00       	call   c0103baf <InitInterruptDesc>
c0103a44:	83 c4 10             	add    $0x10,%esp
c0103a47:	6a 0e                	push   $0xe
c0103a49:	6a 08                	push   $0x8
c0103a4b:	68 9f 01 10 c0       	push   $0xc010019f
c0103a50:	6a 21                	push   $0x21
c0103a52:	e8 58 01 00 00       	call   c0103baf <InitInterruptDesc>
c0103a57:	83 c4 10             	add    $0x10,%esp
c0103a5a:	6a 0e                	push   $0xe
c0103a5c:	6a 08                	push   $0x8
c0103a5e:	68 e2 01 10 c0       	push   $0xc01001e2
c0103a63:	6a 2e                	push   $0x2e
c0103a65:	e8 45 01 00 00       	call   c0103baf <InitInterruptDesc>
c0103a6a:	83 c4 10             	add    $0x10,%esp
c0103a6d:	6a 0e                	push   $0xe
c0103a6f:	6a 08                	push   $0x8
c0103a71:	68 28 02 10 c0       	push   $0xc0100228
c0103a76:	6a 2a                	push   $0x2a
c0103a78:	e8 32 01 00 00       	call   c0103baf <InitInterruptDesc>
c0103a7d:	83 c4 10             	add    $0x10,%esp
c0103a80:	83 ec 04             	sub    $0x4,%esp
c0103a83:	68 e0 15 00 00       	push   $0x15e0
c0103a88:	6a 00                	push   $0x0
c0103a8a:	68 00 22 18 c0       	push   $0xc0182200
c0103a8f:	e8 3b 87 00 00       	call   c010c1cf <Memset>
c0103a94:	83 c4 10             	add    $0x10,%esp
c0103a97:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103a9e:	83 ec 04             	sub    $0x4,%esp
c0103aa1:	ff 75 f4             	pushl  -0xc(%ebp)
c0103aa4:	6a 00                	push   $0x0
c0103aa6:	68 40 06 11 c0       	push   $0xc0110640
c0103aab:	e8 1f 87 00 00       	call   c010c1cf <Memset>
c0103ab0:	83 c4 10             	add    $0x10,%esp
c0103ab3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103ab6:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103abb:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103ac2:	00 00 00 
c0103ac5:	83 ec 0c             	sub    $0xc,%esp
c0103ac8:	6a 30                	push   $0x30
c0103aca:	e8 81 fe ff ff       	call   c0103950 <Seg2PhyAddr>
c0103acf:	83 c4 10             	add    $0x10,%esp
c0103ad2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103ad5:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103adc:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103ae3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103ae6:	0f b7 d0             	movzwl %ax,%edx
c0103ae9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103aec:	83 e8 01             	sub    $0x1,%eax
c0103aef:	89 c1                	mov    %eax,%ecx
c0103af1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103af4:	52                   	push   %edx
c0103af5:	51                   	push   %ecx
c0103af6:	50                   	push   %eax
c0103af7:	68 00 f8 10 c0       	push   $0xc010f800
c0103afc:	e8 e2 fd ff ff       	call   c01038e3 <InitDescriptor>
c0103b01:	83 c4 10             	add    $0x10,%esp
c0103b04:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103b0b:	68 f2 00 00 00       	push   $0xf2
c0103b10:	68 ff ff 00 00       	push   $0xffff
c0103b15:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103b18:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103b1d:	e8 c1 fd ff ff       	call   c01038e3 <InitDescriptor>
c0103b22:	83 c4 10             	add    $0x10,%esp
c0103b25:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103b2c:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103b33:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103b3a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103b3d:	0f b7 c0             	movzwl %ax,%eax
c0103b40:	50                   	push   %eax
c0103b41:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b44:	6a 00                	push   $0x0
c0103b46:	68 08 f8 10 c0       	push   $0xc010f808
c0103b4b:	e8 93 fd ff ff       	call   c01038e3 <InitDescriptor>
c0103b50:	83 c4 10             	add    $0x10,%esp
c0103b53:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103b56:	0f b7 c0             	movzwl %ax,%eax
c0103b59:	50                   	push   %eax
c0103b5a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b5d:	6a 00                	push   $0x0
c0103b5f:	68 10 f8 10 c0       	push   $0xc010f810
c0103b64:	e8 7a fd ff ff       	call   c01038e3 <InitDescriptor>
c0103b69:	83 c4 10             	add    $0x10,%esp
c0103b6c:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103b73:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103b7a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103b7d:	0f b7 c0             	movzwl %ax,%eax
c0103b80:	50                   	push   %eax
c0103b81:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b84:	6a 00                	push   $0x0
c0103b86:	68 18 f8 10 c0       	push   $0xc010f818
c0103b8b:	e8 53 fd ff ff       	call   c01038e3 <InitDescriptor>
c0103b90:	83 c4 10             	add    $0x10,%esp
c0103b93:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103b96:	0f b7 c0             	movzwl %ax,%eax
c0103b99:	50                   	push   %eax
c0103b9a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b9d:	6a 00                	push   $0x0
c0103b9f:	68 20 f8 10 c0       	push   $0xc010f820
c0103ba4:	e8 3a fd ff ff       	call   c01038e3 <InitDescriptor>
c0103ba9:	83 c4 10             	add    $0x10,%esp
c0103bac:	90                   	nop
c0103bad:	c9                   	leave  
c0103bae:	c3                   	ret    

c0103baf <InitInterruptDesc>:
c0103baf:	55                   	push   %ebp
c0103bb0:	89 e5                	mov    %esp,%ebp
c0103bb2:	83 ec 10             	sub    $0x10,%esp
c0103bb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bb8:	c1 e0 03             	shl    $0x3,%eax
c0103bbb:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103bc0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103bc3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bc6:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103bca:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bcd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103bd0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103bd3:	89 c2                	mov    %eax,%edx
c0103bd5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bd8:	66 89 10             	mov    %dx,(%eax)
c0103bdb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bde:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103be4:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103be7:	c1 f8 10             	sar    $0x10,%eax
c0103bea:	89 c2                	mov    %eax,%edx
c0103bec:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bef:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103bf3:	8b 45 10             	mov    0x10(%ebp),%eax
c0103bf6:	c1 e0 04             	shl    $0x4,%eax
c0103bf9:	89 c2                	mov    %eax,%edx
c0103bfb:	8b 45 14             	mov    0x14(%ebp),%eax
c0103bfe:	09 d0                	or     %edx,%eax
c0103c00:	89 c2                	mov    %eax,%edx
c0103c02:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c05:	88 50 05             	mov    %dl,0x5(%eax)
c0103c08:	90                   	nop
c0103c09:	c9                   	leave  
c0103c0a:	c3                   	ret    

c0103c0b <ReloadGDT>:
c0103c0b:	55                   	push   %ebp
c0103c0c:	89 e5                	mov    %esp,%ebp
c0103c0e:	83 ec 28             	sub    $0x28,%esp
c0103c11:	b8 d0 06 11 c0       	mov    $0xc01106d0,%eax
c0103c16:	0f b7 00             	movzwl (%eax),%eax
c0103c19:	98                   	cwtl   
c0103c1a:	ba d2 06 11 c0       	mov    $0xc01106d2,%edx
c0103c1f:	8b 12                	mov    (%edx),%edx
c0103c21:	83 ec 04             	sub    $0x4,%esp
c0103c24:	50                   	push   %eax
c0103c25:	52                   	push   %edx
c0103c26:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103c2b:	e8 71 85 00 00       	call   c010c1a1 <Memcpy2>
c0103c30:	83 c4 10             	add    $0x10,%esp
c0103c33:	c7 45 f0 d0 06 11 c0 	movl   $0xc01106d0,-0x10(%ebp)
c0103c3a:	c7 45 ec d2 06 11 c0 	movl   $0xc01106d2,-0x14(%ebp)
c0103c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103c44:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103c49:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103c4e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103c51:	89 10                	mov    %edx,(%eax)
c0103c53:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103c5a:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103c61:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c64:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103c69:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103c6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103c71:	89 10                	mov    %edx,(%eax)
c0103c73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103c7a:	eb 04                	jmp    c0103c80 <ReloadGDT+0x75>
c0103c7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103c80:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103c87:	7e f3                	jle    c0103c7c <ReloadGDT+0x71>
c0103c89:	e8 a9 37 00 00       	call   c0107437 <init_internal_interrupt>
c0103c8e:	e8 9b fd ff ff       	call   c0103a2e <init_propt>
c0103c93:	90                   	nop
c0103c94:	c9                   	leave  
c0103c95:	c3                   	ret    

c0103c96 <select_console>:
c0103c96:	55                   	push   %ebp
c0103c97:	89 e5                	mov    %esp,%ebp
c0103c99:	83 ec 18             	sub    $0x18,%esp
c0103c9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c9f:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103ca2:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103ca6:	75 27                	jne    c0103ccf <select_console+0x39>
c0103ca8:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103cac:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103cb2:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103cb7:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103cbc:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103cc1:	83 ec 0c             	sub    $0xc,%esp
c0103cc4:	50                   	push   %eax
c0103cc5:	e8 08 00 00 00       	call   c0103cd2 <flush>
c0103cca:	83 c4 10             	add    $0x10,%esp
c0103ccd:	eb 01                	jmp    c0103cd0 <select_console+0x3a>
c0103ccf:	90                   	nop
c0103cd0:	c9                   	leave  
c0103cd1:	c3                   	ret    

c0103cd2 <flush>:
c0103cd2:	55                   	push   %ebp
c0103cd3:	89 e5                	mov    %esp,%ebp
c0103cd5:	83 ec 08             	sub    $0x8,%esp
c0103cd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cdb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ce1:	8b 40 0c             	mov    0xc(%eax),%eax
c0103ce4:	83 ec 0c             	sub    $0xc,%esp
c0103ce7:	50                   	push   %eax
c0103ce8:	e8 1e 00 00 00       	call   c0103d0b <set_cursor>
c0103ced:	83 c4 10             	add    $0x10,%esp
c0103cf0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cf3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103cf9:	8b 40 08             	mov    0x8(%eax),%eax
c0103cfc:	83 ec 0c             	sub    $0xc,%esp
c0103cff:	50                   	push   %eax
c0103d00:	e8 64 00 00 00       	call   c0103d69 <set_console_start_video_addr>
c0103d05:	83 c4 10             	add    $0x10,%esp
c0103d08:	90                   	nop
c0103d09:	c9                   	leave  
c0103d0a:	c3                   	ret    

c0103d0b <set_cursor>:
c0103d0b:	55                   	push   %ebp
c0103d0c:	89 e5                	mov    %esp,%ebp
c0103d0e:	83 ec 08             	sub    $0x8,%esp
c0103d11:	83 ec 08             	sub    $0x8,%esp
c0103d14:	6a 0e                	push   $0xe
c0103d16:	68 d4 03 00 00       	push   $0x3d4
c0103d1b:	e8 d0 c5 ff ff       	call   c01002f0 <out_byte>
c0103d20:	83 c4 10             	add    $0x10,%esp
c0103d23:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d26:	c1 e8 08             	shr    $0x8,%eax
c0103d29:	0f b7 c0             	movzwl %ax,%eax
c0103d2c:	83 ec 08             	sub    $0x8,%esp
c0103d2f:	50                   	push   %eax
c0103d30:	68 d5 03 00 00       	push   $0x3d5
c0103d35:	e8 b6 c5 ff ff       	call   c01002f0 <out_byte>
c0103d3a:	83 c4 10             	add    $0x10,%esp
c0103d3d:	83 ec 08             	sub    $0x8,%esp
c0103d40:	6a 0f                	push   $0xf
c0103d42:	68 d4 03 00 00       	push   $0x3d4
c0103d47:	e8 a4 c5 ff ff       	call   c01002f0 <out_byte>
c0103d4c:	83 c4 10             	add    $0x10,%esp
c0103d4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d52:	0f b7 c0             	movzwl %ax,%eax
c0103d55:	83 ec 08             	sub    $0x8,%esp
c0103d58:	50                   	push   %eax
c0103d59:	68 d5 03 00 00       	push   $0x3d5
c0103d5e:	e8 8d c5 ff ff       	call   c01002f0 <out_byte>
c0103d63:	83 c4 10             	add    $0x10,%esp
c0103d66:	90                   	nop
c0103d67:	c9                   	leave  
c0103d68:	c3                   	ret    

c0103d69 <set_console_start_video_addr>:
c0103d69:	55                   	push   %ebp
c0103d6a:	89 e5                	mov    %esp,%ebp
c0103d6c:	83 ec 08             	sub    $0x8,%esp
c0103d6f:	83 ec 08             	sub    $0x8,%esp
c0103d72:	6a 0c                	push   $0xc
c0103d74:	68 d4 03 00 00       	push   $0x3d4
c0103d79:	e8 72 c5 ff ff       	call   c01002f0 <out_byte>
c0103d7e:	83 c4 10             	add    $0x10,%esp
c0103d81:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d84:	c1 e8 08             	shr    $0x8,%eax
c0103d87:	0f b7 c0             	movzwl %ax,%eax
c0103d8a:	83 ec 08             	sub    $0x8,%esp
c0103d8d:	50                   	push   %eax
c0103d8e:	68 d5 03 00 00       	push   $0x3d5
c0103d93:	e8 58 c5 ff ff       	call   c01002f0 <out_byte>
c0103d98:	83 c4 10             	add    $0x10,%esp
c0103d9b:	83 ec 08             	sub    $0x8,%esp
c0103d9e:	6a 0d                	push   $0xd
c0103da0:	68 d4 03 00 00       	push   $0x3d4
c0103da5:	e8 46 c5 ff ff       	call   c01002f0 <out_byte>
c0103daa:	83 c4 10             	add    $0x10,%esp
c0103dad:	8b 45 08             	mov    0x8(%ebp),%eax
c0103db0:	0f b7 c0             	movzwl %ax,%eax
c0103db3:	83 ec 08             	sub    $0x8,%esp
c0103db6:	50                   	push   %eax
c0103db7:	68 d5 03 00 00       	push   $0x3d5
c0103dbc:	e8 2f c5 ff ff       	call   c01002f0 <out_byte>
c0103dc1:	83 c4 10             	add    $0x10,%esp
c0103dc4:	90                   	nop
c0103dc5:	c9                   	leave  
c0103dc6:	c3                   	ret    

c0103dc7 <put_key>:
c0103dc7:	55                   	push   %ebp
c0103dc8:	89 e5                	mov    %esp,%ebp
c0103dca:	83 ec 04             	sub    $0x4,%esp
c0103dcd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103dd0:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103dd3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dd6:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103ddc:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103de1:	77 4d                	ja     c0103e30 <put_key+0x69>
c0103de3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103de6:	8b 00                	mov    (%eax),%eax
c0103de8:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103dec:	89 10                	mov    %edx,(%eax)
c0103dee:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df1:	8b 00                	mov    (%eax),%eax
c0103df3:	8d 50 04             	lea    0x4(%eax),%edx
c0103df6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df9:	89 10                	mov    %edx,(%eax)
c0103dfb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dfe:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103e04:	8d 50 01             	lea    0x1(%eax),%edx
c0103e07:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e0a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103e10:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e13:	8b 00                	mov    (%eax),%eax
c0103e15:	8b 55 08             	mov    0x8(%ebp),%edx
c0103e18:	83 c2 08             	add    $0x8,%edx
c0103e1b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103e21:	39 d0                	cmp    %edx,%eax
c0103e23:	75 0b                	jne    c0103e30 <put_key+0x69>
c0103e25:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e28:	8d 50 08             	lea    0x8(%eax),%edx
c0103e2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e2e:	89 10                	mov    %edx,(%eax)
c0103e30:	90                   	nop
c0103e31:	c9                   	leave  
c0103e32:	c3                   	ret    

c0103e33 <scroll_up>:
c0103e33:	55                   	push   %ebp
c0103e34:	89 e5                	mov    %esp,%ebp
c0103e36:	83 ec 08             	sub    $0x8,%esp
c0103e39:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e3c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e42:	8b 40 08             	mov    0x8(%eax),%eax
c0103e45:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103e48:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e4b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e51:	8b 00                	mov    (%eax),%eax
c0103e53:	39 c2                	cmp    %eax,%edx
c0103e55:	76 1b                	jbe    c0103e72 <scroll_up+0x3f>
c0103e57:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e5a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e60:	8b 40 08             	mov    0x8(%eax),%eax
c0103e63:	83 e8 50             	sub    $0x50,%eax
c0103e66:	83 ec 0c             	sub    $0xc,%esp
c0103e69:	50                   	push   %eax
c0103e6a:	e8 fa fe ff ff       	call   c0103d69 <set_console_start_video_addr>
c0103e6f:	83 c4 10             	add    $0x10,%esp
c0103e72:	90                   	nop
c0103e73:	c9                   	leave  
c0103e74:	c3                   	ret    

c0103e75 <scroll_down>:
c0103e75:	55                   	push   %ebp
c0103e76:	89 e5                	mov    %esp,%ebp
c0103e78:	83 ec 08             	sub    $0x8,%esp
c0103e7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e7e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e84:	8b 40 08             	mov    0x8(%eax),%eax
c0103e87:	8d 48 50             	lea    0x50(%eax),%ecx
c0103e8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e8d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e93:	8b 10                	mov    (%eax),%edx
c0103e95:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e98:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e9e:	8b 40 04             	mov    0x4(%eax),%eax
c0103ea1:	01 d0                	add    %edx,%eax
c0103ea3:	39 c1                	cmp    %eax,%ecx
c0103ea5:	73 36                	jae    c0103edd <scroll_down+0x68>
c0103ea7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eaa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eb0:	8b 40 08             	mov    0x8(%eax),%eax
c0103eb3:	83 c0 50             	add    $0x50,%eax
c0103eb6:	83 ec 0c             	sub    $0xc,%esp
c0103eb9:	50                   	push   %eax
c0103eba:	e8 aa fe ff ff       	call   c0103d69 <set_console_start_video_addr>
c0103ebf:	83 c4 10             	add    $0x10,%esp
c0103ec2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ec5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ecb:	8b 50 08             	mov    0x8(%eax),%edx
c0103ece:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ed1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ed7:	83 c2 50             	add    $0x50,%edx
c0103eda:	89 50 08             	mov    %edx,0x8(%eax)
c0103edd:	90                   	nop
c0103ede:	c9                   	leave  
c0103edf:	c3                   	ret    

c0103ee0 <out_char>:
c0103ee0:	55                   	push   %ebp
c0103ee1:	89 e5                	mov    %esp,%ebp
c0103ee3:	83 ec 28             	sub    $0x28,%esp
c0103ee6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ee9:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103eec:	e8 a7 2d 00 00       	call   c0106c98 <intr_disable>
c0103ef1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103ef4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ef7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103efd:	8b 40 0c             	mov    0xc(%eax),%eax
c0103f00:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103f05:	01 c0                	add    %eax,%eax
c0103f07:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103f0a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103f0e:	83 f8 08             	cmp    $0x8,%eax
c0103f11:	0f 84 8d 00 00 00    	je     c0103fa4 <out_char+0xc4>
c0103f17:	83 f8 0a             	cmp    $0xa,%eax
c0103f1a:	0f 85 c9 00 00 00    	jne    c0103fe9 <out_char+0x109>
c0103f20:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f23:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f29:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f2f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f35:	8b 08                	mov    (%eax),%ecx
c0103f37:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f3a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f40:	8b 40 04             	mov    0x4(%eax),%eax
c0103f43:	01 c8                	add    %ecx,%eax
c0103f45:	83 e8 50             	sub    $0x50,%eax
c0103f48:	39 c2                	cmp    %eax,%edx
c0103f4a:	0f 83 f4 00 00 00    	jae    c0104044 <out_char+0x164>
c0103f50:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f53:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f59:	8b 08                	mov    (%eax),%ecx
c0103f5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f5e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f64:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f67:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f6a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f70:	8b 00                	mov    (%eax),%eax
c0103f72:	29 c2                	sub    %eax,%edx
c0103f74:	89 d0                	mov    %edx,%eax
c0103f76:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103f7b:	f7 e2                	mul    %edx
c0103f7d:	89 d0                	mov    %edx,%eax
c0103f7f:	c1 e8 06             	shr    $0x6,%eax
c0103f82:	8d 50 01             	lea    0x1(%eax),%edx
c0103f85:	89 d0                	mov    %edx,%eax
c0103f87:	c1 e0 02             	shl    $0x2,%eax
c0103f8a:	01 d0                	add    %edx,%eax
c0103f8c:	c1 e0 04             	shl    $0x4,%eax
c0103f8f:	89 c2                	mov    %eax,%edx
c0103f91:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f94:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f9a:	01 ca                	add    %ecx,%edx
c0103f9c:	89 50 0c             	mov    %edx,0xc(%eax)
c0103f9f:	e9 a0 00 00 00       	jmp    c0104044 <out_char+0x164>
c0103fa4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fa7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fad:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fb3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fb9:	8b 00                	mov    (%eax),%eax
c0103fbb:	39 c2                	cmp    %eax,%edx
c0103fbd:	0f 86 84 00 00 00    	jbe    c0104047 <out_char+0x167>
c0103fc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fc6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fcc:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fcf:	83 ea 01             	sub    $0x1,%edx
c0103fd2:	89 50 0c             	mov    %edx,0xc(%eax)
c0103fd5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103fd8:	83 e8 02             	sub    $0x2,%eax
c0103fdb:	c6 00 20             	movb   $0x20,(%eax)
c0103fde:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103fe1:	83 e8 01             	sub    $0x1,%eax
c0103fe4:	c6 00 00             	movb   $0x0,(%eax)
c0103fe7:	eb 5e                	jmp    c0104047 <out_char+0x167>
c0103fe9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fec:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ff2:	8b 40 0c             	mov    0xc(%eax),%eax
c0103ff5:	8d 48 01             	lea    0x1(%eax),%ecx
c0103ff8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ffb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104001:	8b 10                	mov    (%eax),%edx
c0104003:	8b 45 08             	mov    0x8(%ebp),%eax
c0104006:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010400c:	8b 40 04             	mov    0x4(%eax),%eax
c010400f:	01 d0                	add    %edx,%eax
c0104011:	39 c1                	cmp    %eax,%ecx
c0104013:	73 35                	jae    c010404a <out_char+0x16a>
c0104015:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104018:	8d 50 01             	lea    0x1(%eax),%edx
c010401b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010401e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0104022:	88 10                	mov    %dl,(%eax)
c0104024:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104027:	8d 50 01             	lea    0x1(%eax),%edx
c010402a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010402d:	c6 00 0a             	movb   $0xa,(%eax)
c0104030:	8b 45 08             	mov    0x8(%ebp),%eax
c0104033:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104039:	8b 50 0c             	mov    0xc(%eax),%edx
c010403c:	83 c2 01             	add    $0x1,%edx
c010403f:	89 50 0c             	mov    %edx,0xc(%eax)
c0104042:	eb 06                	jmp    c010404a <out_char+0x16a>
c0104044:	90                   	nop
c0104045:	eb 14                	jmp    c010405b <out_char+0x17b>
c0104047:	90                   	nop
c0104048:	eb 11                	jmp    c010405b <out_char+0x17b>
c010404a:	90                   	nop
c010404b:	eb 0e                	jmp    c010405b <out_char+0x17b>
c010404d:	83 ec 0c             	sub    $0xc,%esp
c0104050:	ff 75 08             	pushl  0x8(%ebp)
c0104053:	e8 1d fe ff ff       	call   c0103e75 <scroll_down>
c0104058:	83 c4 10             	add    $0x10,%esp
c010405b:	8b 45 08             	mov    0x8(%ebp),%eax
c010405e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104064:	8b 50 0c             	mov    0xc(%eax),%edx
c0104067:	8b 45 08             	mov    0x8(%ebp),%eax
c010406a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104070:	8b 40 08             	mov    0x8(%eax),%eax
c0104073:	29 c2                	sub    %eax,%edx
c0104075:	89 d0                	mov    %edx,%eax
c0104077:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c010407c:	77 cf                	ja     c010404d <out_char+0x16d>
c010407e:	83 ec 0c             	sub    $0xc,%esp
c0104081:	ff 75 08             	pushl  0x8(%ebp)
c0104084:	e8 49 fc ff ff       	call   c0103cd2 <flush>
c0104089:	83 c4 10             	add    $0x10,%esp
c010408c:	83 ec 0c             	sub    $0xc,%esp
c010408f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104092:	e8 2a 2c 00 00       	call   c0106cc1 <intr_set_status>
c0104097:	83 c4 10             	add    $0x10,%esp
c010409a:	90                   	nop
c010409b:	c9                   	leave  
c010409c:	c3                   	ret    

c010409d <tty_dev_read>:
c010409d:	55                   	push   %ebp
c010409e:	89 e5                	mov    %esp,%ebp
c01040a0:	83 ec 08             	sub    $0x8,%esp
c01040a3:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01040a8:	39 45 08             	cmp    %eax,0x8(%ebp)
c01040ab:	75 17                	jne    c01040c4 <tty_dev_read+0x27>
c01040ad:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01040b2:	85 c0                	test   %eax,%eax
c01040b4:	7e 0e                	jle    c01040c4 <tty_dev_read+0x27>
c01040b6:	83 ec 0c             	sub    $0xc,%esp
c01040b9:	ff 75 08             	pushl  0x8(%ebp)
c01040bc:	e8 89 07 00 00       	call   c010484a <keyboard_read>
c01040c1:	83 c4 10             	add    $0x10,%esp
c01040c4:	90                   	nop
c01040c5:	c9                   	leave  
c01040c6:	c3                   	ret    

c01040c7 <tty_dev_write>:
c01040c7:	55                   	push   %ebp
c01040c8:	89 e5                	mov    %esp,%ebp
c01040ca:	83 ec 28             	sub    $0x28,%esp
c01040cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01040d0:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01040d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01040d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01040e0:	e9 88 01 00 00       	jmp    c010426d <tty_dev_write+0x1a6>
c01040e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01040e8:	8b 40 04             	mov    0x4(%eax),%eax
c01040eb:	8b 00                	mov    (%eax),%eax
c01040ed:	88 45 e7             	mov    %al,-0x19(%ebp)
c01040f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01040f3:	8b 40 04             	mov    0x4(%eax),%eax
c01040f6:	8d 50 04             	lea    0x4(%eax),%edx
c01040f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01040fc:	89 50 04             	mov    %edx,0x4(%eax)
c01040ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0104102:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104108:	8d 50 ff             	lea    -0x1(%eax),%edx
c010410b:	8b 45 08             	mov    0x8(%ebp),%eax
c010410e:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104114:	8b 45 08             	mov    0x8(%ebp),%eax
c0104117:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010411d:	8d 50 01             	lea    0x1(%eax),%edx
c0104120:	8b 45 08             	mov    0x8(%ebp),%eax
c0104123:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104129:	8b 45 08             	mov    0x8(%ebp),%eax
c010412c:	8b 40 04             	mov    0x4(%eax),%eax
c010412f:	8b 55 08             	mov    0x8(%ebp),%edx
c0104132:	83 c2 08             	add    $0x8,%edx
c0104135:	81 c2 00 08 00 00    	add    $0x800,%edx
c010413b:	39 d0                	cmp    %edx,%eax
c010413d:	75 0c                	jne    c010414b <tty_dev_write+0x84>
c010413f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104142:	8d 50 08             	lea    0x8(%eax),%edx
c0104145:	8b 45 08             	mov    0x8(%ebp),%eax
c0104148:	89 50 04             	mov    %edx,0x4(%eax)
c010414b:	8b 45 08             	mov    0x8(%ebp),%eax
c010414e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104154:	85 c0                	test   %eax,%eax
c0104156:	0f 84 11 01 00 00    	je     c010426d <tty_dev_write+0x1a6>
c010415c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104160:	3c 20                	cmp    $0x20,%al
c0104162:	76 08                	jbe    c010416c <tty_dev_write+0xa5>
c0104164:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104168:	3c 7e                	cmp    $0x7e,%al
c010416a:	76 10                	jbe    c010417c <tty_dev_write+0xb5>
c010416c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104170:	3c 20                	cmp    $0x20,%al
c0104172:	74 08                	je     c010417c <tty_dev_write+0xb5>
c0104174:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104178:	84 c0                	test   %al,%al
c010417a:	75 58                	jne    c01041d4 <tty_dev_write+0x10d>
c010417c:	8b 45 08             	mov    0x8(%ebp),%eax
c010417f:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104185:	8b 45 08             	mov    0x8(%ebp),%eax
c0104188:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010418e:	01 d0                	add    %edx,%eax
c0104190:	83 e8 01             	sub    $0x1,%eax
c0104193:	89 c2                	mov    %eax,%edx
c0104195:	83 ec 04             	sub    $0x4,%esp
c0104198:	6a 01                	push   $0x1
c010419a:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010419d:	50                   	push   %eax
c010419e:	52                   	push   %edx
c010419f:	e8 58 2b 00 00       	call   c0106cfc <Memcpy>
c01041a4:	83 c4 10             	add    $0x10,%esp
c01041a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041aa:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01041b0:	8d 50 ff             	lea    -0x1(%eax),%edx
c01041b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01041b6:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01041bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041c0:	0f b6 c0             	movzbl %al,%eax
c01041c3:	83 ec 08             	sub    $0x8,%esp
c01041c6:	50                   	push   %eax
c01041c7:	ff 75 08             	pushl  0x8(%ebp)
c01041ca:	e8 11 fd ff ff       	call   c0103ee0 <out_char>
c01041cf:	83 c4 10             	add    $0x10,%esp
c01041d2:	eb 7c                	jmp    c0104250 <tty_dev_write+0x189>
c01041d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041d8:	3c 08                	cmp    $0x8,%al
c01041da:	75 42                	jne    c010421e <tty_dev_write+0x157>
c01041dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01041df:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01041e5:	8d 50 01             	lea    0x1(%eax),%edx
c01041e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01041eb:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01041f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01041f4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01041fa:	8d 50 fe             	lea    -0x2(%eax),%edx
c01041fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0104200:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104206:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010420a:	0f b6 c0             	movzbl %al,%eax
c010420d:	83 ec 08             	sub    $0x8,%esp
c0104210:	50                   	push   %eax
c0104211:	ff 75 08             	pushl  0x8(%ebp)
c0104214:	e8 c7 fc ff ff       	call   c0103ee0 <out_char>
c0104219:	83 c4 10             	add    $0x10,%esp
c010421c:	eb 32                	jmp    c0104250 <tty_dev_write+0x189>
c010421e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104222:	3c 0a                	cmp    $0xa,%al
c0104224:	75 2a                	jne    c0104250 <tty_dev_write+0x189>
c0104226:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010422a:	0f b6 c0             	movzbl %al,%eax
c010422d:	83 ec 08             	sub    $0x8,%esp
c0104230:	50                   	push   %eax
c0104231:	ff 75 08             	pushl  0x8(%ebp)
c0104234:	e8 a7 fc ff ff       	call   c0103ee0 <out_char>
c0104239:	83 c4 10             	add    $0x10,%esp
c010423c:	8b 45 08             	mov    0x8(%ebp),%eax
c010423f:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0104246:	00 00 00 
c0104249:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104250:	8b 45 08             	mov    0x8(%ebp),%eax
c0104253:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104259:	8b 45 08             	mov    0x8(%ebp),%eax
c010425c:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0104262:	39 c2                	cmp    %eax,%edx
c0104264:	75 07                	jne    c010426d <tty_dev_write+0x1a6>
c0104266:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010426d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104270:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104276:	85 c0                	test   %eax,%eax
c0104278:	0f 85 67 fe ff ff    	jne    c01040e5 <tty_dev_write+0x1e>
c010427e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104282:	74 6d                	je     c01042f1 <tty_dev_write+0x22a>
c0104284:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c010428b:	83 ec 0c             	sub    $0xc,%esp
c010428e:	ff 75 ec             	pushl  -0x14(%ebp)
c0104291:	e8 b6 d3 ff ff       	call   c010164c <sys_malloc>
c0104296:	83 c4 10             	add    $0x10,%esp
c0104299:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010429c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010429f:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c01042a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a9:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01042af:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042b2:	89 50 60             	mov    %edx,0x60(%eax)
c01042b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01042b8:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c01042be:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042c1:	89 50 68             	mov    %edx,0x68(%eax)
c01042c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01042c7:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01042cd:	83 ec 04             	sub    $0x4,%esp
c01042d0:	50                   	push   %eax
c01042d1:	ff 75 e8             	pushl  -0x18(%ebp)
c01042d4:	6a 01                	push   $0x1
c01042d6:	e8 aa 52 00 00       	call   c0109585 <send_rec>
c01042db:	83 c4 10             	add    $0x10,%esp
c01042de:	83 ec 08             	sub    $0x8,%esp
c01042e1:	ff 75 ec             	pushl  -0x14(%ebp)
c01042e4:	ff 75 e8             	pushl  -0x18(%ebp)
c01042e7:	e8 75 d3 ff ff       	call   c0101661 <sys_free>
c01042ec:	83 c4 10             	add    $0x10,%esp
c01042ef:	eb 01                	jmp    c01042f2 <tty_dev_write+0x22b>
c01042f1:	90                   	nop
c01042f2:	c9                   	leave  
c01042f3:	c3                   	ret    

c01042f4 <tty_do_read>:
c01042f4:	55                   	push   %ebp
c01042f5:	89 e5                	mov    %esp,%ebp
c01042f7:	83 ec 08             	sub    $0x8,%esp
c01042fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01042fd:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104304:	00 00 00 
c0104307:	8b 45 0c             	mov    0xc(%ebp),%eax
c010430a:	8b 50 68             	mov    0x68(%eax),%edx
c010430d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104310:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104316:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104319:	8b 00                	mov    (%eax),%eax
c010431b:	89 c2                	mov    %eax,%edx
c010431d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104320:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0104326:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104329:	8b 50 60             	mov    0x60(%eax),%edx
c010432c:	8b 45 08             	mov    0x8(%ebp),%eax
c010432f:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104335:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104338:	8b 50 60             	mov    0x60(%eax),%edx
c010433b:	8b 45 08             	mov    0x8(%ebp),%eax
c010433e:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0104344:	8b 45 08             	mov    0x8(%ebp),%eax
c0104347:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c010434d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104350:	8b 40 10             	mov    0x10(%eax),%eax
c0104353:	83 ec 08             	sub    $0x8,%esp
c0104356:	52                   	push   %edx
c0104357:	50                   	push   %eax
c0104358:	e8 32 1b 00 00       	call   c0105e8f <alloc_virtual_memory>
c010435d:	83 c4 10             	add    $0x10,%esp
c0104360:	89 c2                	mov    %eax,%edx
c0104362:	8b 45 08             	mov    0x8(%ebp),%eax
c0104365:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c010436b:	8b 45 08             	mov    0x8(%ebp),%eax
c010436e:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104374:	83 f8 02             	cmp    $0x2,%eax
c0104377:	74 1c                	je     c0104395 <tty_do_read+0xa1>
c0104379:	68 3b 01 00 00       	push   $0x13b
c010437e:	68 05 b5 10 c0       	push   $0xc010b505
c0104383:	68 05 b5 10 c0       	push   $0xc010b505
c0104388:	68 0f b5 10 c0       	push   $0xc010b50f
c010438d:	e8 83 45 00 00       	call   c0108915 <assertion_failure>
c0104392:	83 c4 10             	add    $0x10,%esp
c0104395:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104398:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010439f:	8b 45 08             	mov    0x8(%ebp),%eax
c01043a2:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01043a8:	83 ec 04             	sub    $0x4,%esp
c01043ab:	50                   	push   %eax
c01043ac:	ff 75 0c             	pushl  0xc(%ebp)
c01043af:	6a 01                	push   $0x1
c01043b1:	e8 cf 51 00 00       	call   c0109585 <send_rec>
c01043b6:	83 c4 10             	add    $0x10,%esp
c01043b9:	90                   	nop
c01043ba:	c9                   	leave  
c01043bb:	c3                   	ret    

c01043bc <tty_do_write>:
c01043bc:	55                   	push   %ebp
c01043bd:	89 e5                	mov    %esp,%ebp
c01043bf:	53                   	push   %ebx
c01043c0:	83 ec 24             	sub    $0x24,%esp
c01043c3:	89 e0                	mov    %esp,%eax
c01043c5:	89 c3                	mov    %eax,%ebx
c01043c7:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c01043ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01043d1:	8d 50 ff             	lea    -0x1(%eax),%edx
c01043d4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01043d7:	89 c2                	mov    %eax,%edx
c01043d9:	b8 10 00 00 00       	mov    $0x10,%eax
c01043de:	83 e8 01             	sub    $0x1,%eax
c01043e1:	01 d0                	add    %edx,%eax
c01043e3:	b9 10 00 00 00       	mov    $0x10,%ecx
c01043e8:	ba 00 00 00 00       	mov    $0x0,%edx
c01043ed:	f7 f1                	div    %ecx
c01043ef:	6b c0 10             	imul   $0x10,%eax,%eax
c01043f2:	29 c4                	sub    %eax,%esp
c01043f4:	89 e0                	mov    %esp,%eax
c01043f6:	83 c0 00             	add    $0x0,%eax
c01043f9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01043fc:	83 ec 04             	sub    $0x4,%esp
c01043ff:	ff 75 e8             	pushl  -0x18(%ebp)
c0104402:	6a 00                	push   $0x0
c0104404:	ff 75 e0             	pushl  -0x20(%ebp)
c0104407:	e8 c3 7d 00 00       	call   c010c1cf <Memset>
c010440c:	83 c4 10             	add    $0x10,%esp
c010440f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104412:	8b 40 60             	mov    0x60(%eax),%eax
c0104415:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104418:	8b 45 08             	mov    0x8(%ebp),%eax
c010441b:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104422:	00 00 00 
c0104425:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104428:	8b 45 0c             	mov    0xc(%ebp),%eax
c010442b:	8b 40 10             	mov    0x10(%eax),%eax
c010442e:	83 ec 08             	sub    $0x8,%esp
c0104431:	52                   	push   %edx
c0104432:	50                   	push   %eax
c0104433:	e8 57 1a 00 00       	call   c0105e8f <alloc_virtual_memory>
c0104438:	83 c4 10             	add    $0x10,%esp
c010443b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010443e:	eb 7e                	jmp    c01044be <tty_do_write+0x102>
c0104440:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104443:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0104446:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c010444a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010444d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104450:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104456:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104459:	01 d0                	add    %edx,%eax
c010445b:	83 ec 04             	sub    $0x4,%esp
c010445e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104461:	50                   	push   %eax
c0104462:	ff 75 e0             	pushl  -0x20(%ebp)
c0104465:	e8 92 28 00 00       	call   c0106cfc <Memcpy>
c010446a:	83 c4 10             	add    $0x10,%esp
c010446d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104470:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104473:	8b 45 08             	mov    0x8(%ebp),%eax
c0104476:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010447c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010447f:	01 c2                	add    %eax,%edx
c0104481:	8b 45 08             	mov    0x8(%ebp),%eax
c0104484:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c010448a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104491:	eb 25                	jmp    c01044b8 <tty_do_write+0xfc>
c0104493:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104496:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104499:	01 d0                	add    %edx,%eax
c010449b:	0f b6 00             	movzbl (%eax),%eax
c010449e:	0f b6 c0             	movzbl %al,%eax
c01044a1:	83 ec 08             	sub    $0x8,%esp
c01044a4:	50                   	push   %eax
c01044a5:	ff 75 08             	pushl  0x8(%ebp)
c01044a8:	e8 33 fa ff ff       	call   c0103ee0 <out_char>
c01044ad:	83 c4 10             	add    $0x10,%esp
c01044b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01044b4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c01044b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01044bc:	75 d5                	jne    c0104493 <tty_do_write+0xd7>
c01044be:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01044c2:	0f 85 78 ff ff ff    	jne    c0104440 <tty_do_write+0x84>
c01044c8:	83 ec 0c             	sub    $0xc,%esp
c01044cb:	6a 7c                	push   $0x7c
c01044cd:	e8 7a d1 ff ff       	call   c010164c <sys_malloc>
c01044d2:	83 c4 10             	add    $0x10,%esp
c01044d5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01044d8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01044db:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01044e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01044e5:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01044eb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01044ee:	89 50 58             	mov    %edx,0x58(%eax)
c01044f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01044f4:	8b 00                	mov    (%eax),%eax
c01044f6:	83 ec 04             	sub    $0x4,%esp
c01044f9:	50                   	push   %eax
c01044fa:	ff 75 d8             	pushl  -0x28(%ebp)
c01044fd:	6a 01                	push   $0x1
c01044ff:	e8 81 50 00 00       	call   c0109585 <send_rec>
c0104504:	83 c4 10             	add    $0x10,%esp
c0104507:	83 ec 08             	sub    $0x8,%esp
c010450a:	6a 7c                	push   $0x7c
c010450c:	ff 75 d8             	pushl  -0x28(%ebp)
c010450f:	e8 4d d1 ff ff       	call   c0101661 <sys_free>
c0104514:	83 c4 10             	add    $0x10,%esp
c0104517:	89 dc                	mov    %ebx,%esp
c0104519:	90                   	nop
c010451a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010451d:	c9                   	leave  
c010451e:	c3                   	ret    

c010451f <init_screen>:
c010451f:	55                   	push   %ebp
c0104520:	89 e5                	mov    %esp,%ebp
c0104522:	83 ec 10             	sub    $0x10,%esp
c0104525:	8b 45 08             	mov    0x8(%ebp),%eax
c0104528:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010452d:	c1 f8 03             	sar    $0x3,%eax
c0104530:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104536:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104539:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010453c:	c1 e0 04             	shl    $0x4,%eax
c010453f:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c0104545:	8b 45 08             	mov    0x8(%ebp),%eax
c0104548:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c010454e:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104555:	8b 45 08             	mov    0x8(%ebp),%eax
c0104558:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010455e:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0104561:	89 50 04             	mov    %edx,0x4(%eax)
c0104564:	8b 45 08             	mov    0x8(%ebp),%eax
c0104567:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010456d:	8b 50 04             	mov    0x4(%eax),%edx
c0104570:	8b 45 08             	mov    0x8(%ebp),%eax
c0104573:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104579:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010457d:	89 10                	mov    %edx,(%eax)
c010457f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104582:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104588:	8b 45 08             	mov    0x8(%ebp),%eax
c010458b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104591:	8b 12                	mov    (%edx),%edx
c0104593:	89 50 08             	mov    %edx,0x8(%eax)
c0104596:	8b 55 08             	mov    0x8(%ebp),%edx
c0104599:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010459f:	8b 40 08             	mov    0x8(%eax),%eax
c01045a2:	89 42 0c             	mov    %eax,0xc(%edx)
c01045a5:	90                   	nop
c01045a6:	c9                   	leave  
c01045a7:	c3                   	ret    

c01045a8 <init_tty>:
c01045a8:	55                   	push   %ebp
c01045a9:	89 e5                	mov    %esp,%ebp
c01045ab:	83 ec 18             	sub    $0x18,%esp
c01045ae:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01045b5:	e9 92 00 00 00       	jmp    c010464c <init_tty+0xa4>
c01045ba:	83 ec 04             	sub    $0x4,%esp
c01045bd:	68 28 08 00 00       	push   $0x828
c01045c2:	6a 00                	push   $0x0
c01045c4:	ff 75 f4             	pushl  -0xc(%ebp)
c01045c7:	e8 03 7c 00 00       	call   c010c1cf <Memset>
c01045cc:	83 c4 10             	add    $0x10,%esp
c01045cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045d2:	8d 50 08             	lea    0x8(%eax),%edx
c01045d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045d8:	89 50 04             	mov    %edx,0x4(%eax)
c01045db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045de:	8b 50 04             	mov    0x4(%eax),%edx
c01045e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045e4:	89 10                	mov    %edx,(%eax)
c01045e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045e9:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c01045f0:	00 00 00 
c01045f3:	83 ec 0c             	sub    $0xc,%esp
c01045f6:	ff 75 f4             	pushl  -0xc(%ebp)
c01045f9:	e8 21 ff ff ff       	call   c010451f <init_screen>
c01045fe:	83 c4 10             	add    $0x10,%esp
c0104601:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104604:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104609:	85 c0                	test   %eax,%eax
c010460b:	7e 38                	jle    c0104645 <init_tty+0x9d>
c010460d:	83 ec 08             	sub    $0x8,%esp
c0104610:	6a 23                	push   $0x23
c0104612:	ff 75 f4             	pushl  -0xc(%ebp)
c0104615:	e8 c6 f8 ff ff       	call   c0103ee0 <out_char>
c010461a:	83 c4 10             	add    $0x10,%esp
c010461d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104620:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0104625:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010462a:	c1 f8 03             	sar    $0x3,%eax
c010462d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104633:	0f b6 c0             	movzbl %al,%eax
c0104636:	83 ec 08             	sub    $0x8,%esp
c0104639:	50                   	push   %eax
c010463a:	ff 75 f4             	pushl  -0xc(%ebp)
c010463d:	e8 9e f8 ff ff       	call   c0103ee0 <out_char>
c0104642:	83 c4 10             	add    $0x10,%esp
c0104645:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010464c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104651:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104654:	0f 82 60 ff ff ff    	jb     c01045ba <init_tty+0x12>
c010465a:	90                   	nop
c010465b:	c9                   	leave  
c010465c:	c3                   	ret    

c010465d <TaskTTY>:
c010465d:	55                   	push   %ebp
c010465e:	89 e5                	mov    %esp,%ebp
c0104660:	83 ec 28             	sub    $0x28,%esp
c0104663:	e8 40 ff ff ff       	call   c01045a8 <init_tty>
c0104668:	83 ec 0c             	sub    $0xc,%esp
c010466b:	6a 00                	push   $0x0
c010466d:	e8 24 f6 ff ff       	call   c0103c96 <select_console>
c0104672:	83 c4 10             	add    $0x10,%esp
c0104675:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010467c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104683:	83 ec 0c             	sub    $0xc,%esp
c0104686:	6a 7c                	push   $0x7c
c0104688:	e8 bf cf ff ff       	call   c010164c <sys_malloc>
c010468d:	83 c4 10             	add    $0x10,%esp
c0104690:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104693:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c010469a:	eb 30                	jmp    c01046cc <TaskTTY+0x6f>
c010469c:	83 ec 0c             	sub    $0xc,%esp
c010469f:	ff 75 f4             	pushl  -0xc(%ebp)
c01046a2:	e8 f6 f9 ff ff       	call   c010409d <tty_dev_read>
c01046a7:	83 c4 10             	add    $0x10,%esp
c01046aa:	83 ec 0c             	sub    $0xc,%esp
c01046ad:	ff 75 f4             	pushl  -0xc(%ebp)
c01046b0:	e8 12 fa ff ff       	call   c01040c7 <tty_dev_write>
c01046b5:	83 c4 10             	add    $0x10,%esp
c01046b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046bb:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01046c1:	85 c0                	test   %eax,%eax
c01046c3:	75 d7                	jne    c010469c <TaskTTY+0x3f>
c01046c5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01046cc:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01046d1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01046d4:	72 c6                	jb     c010469c <TaskTTY+0x3f>
c01046d6:	83 ec 04             	sub    $0x4,%esp
c01046d9:	6a 12                	push   $0x12
c01046db:	ff 75 e8             	pushl  -0x18(%ebp)
c01046de:	6a 02                	push   $0x2
c01046e0:	e8 a0 4e 00 00       	call   c0109585 <send_rec>
c01046e5:	83 c4 10             	add    $0x10,%esp
c01046e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01046eb:	8b 40 78             	mov    0x78(%eax),%eax
c01046ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01046f1:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01046f8:	74 28                	je     c0104722 <TaskTTY+0xc5>
c01046fa:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104701:	7f 0b                	jg     c010470e <TaskTTY+0xb1>
c0104703:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c010470a:	74 4e                	je     c010475a <TaskTTY+0xfd>
c010470c:	eb 4d                	jmp    c010475b <TaskTTY+0xfe>
c010470e:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104715:	74 21                	je     c0104738 <TaskTTY+0xdb>
c0104717:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c010471e:	74 2e                	je     c010474e <TaskTTY+0xf1>
c0104720:	eb 39                	jmp    c010475b <TaskTTY+0xfe>
c0104722:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104727:	83 ec 08             	sub    $0x8,%esp
c010472a:	ff 75 e8             	pushl  -0x18(%ebp)
c010472d:	50                   	push   %eax
c010472e:	e8 c1 fb ff ff       	call   c01042f4 <tty_do_read>
c0104733:	83 c4 10             	add    $0x10,%esp
c0104736:	eb 23                	jmp    c010475b <TaskTTY+0xfe>
c0104738:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c010473d:	83 ec 08             	sub    $0x8,%esp
c0104740:	ff 75 e8             	pushl  -0x18(%ebp)
c0104743:	50                   	push   %eax
c0104744:	e8 73 fc ff ff       	call   c01043bc <tty_do_write>
c0104749:	83 c4 10             	add    $0x10,%esp
c010474c:	eb 0d                	jmp    c010475b <TaskTTY+0xfe>
c010474e:	c7 05 c4 06 11 c0 00 	movl   $0x0,0xc01106c4
c0104755:	00 00 00 
c0104758:	eb 01                	jmp    c010475b <TaskTTY+0xfe>
c010475a:	90                   	nop
c010475b:	e9 33 ff ff ff       	jmp    c0104693 <TaskTTY+0x36>

c0104760 <keyboard_handler>:
c0104760:	55                   	push   %ebp
c0104761:	89 e5                	mov    %esp,%ebp
c0104763:	83 ec 18             	sub    $0x18,%esp
c0104766:	c7 05 c4 06 11 c0 01 	movl   $0x1,0xc01106c4
c010476d:	00 00 00 
c0104770:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104777:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010477c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104781:	7f 5e                	jg     c01047e1 <keyboard_handler+0x81>
c0104783:	e8 8a bb ff ff       	call   c0100312 <disable_int>
c0104788:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010478b:	0f b7 c0             	movzwl %ax,%eax
c010478e:	83 ec 0c             	sub    $0xc,%esp
c0104791:	50                   	push   %eax
c0104792:	e8 4d bb ff ff       	call   c01002e4 <in_byte>
c0104797:	83 c4 10             	add    $0x10,%esp
c010479a:	88 45 f3             	mov    %al,-0xd(%ebp)
c010479d:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047a2:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c01047a6:	88 10                	mov    %dl,(%eax)
c01047a8:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047ad:	83 c0 01             	add    $0x1,%eax
c01047b0:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c01047b5:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047ba:	83 c0 01             	add    $0x1,%eax
c01047bd:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01047c2:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047c7:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01047cc:	39 d0                	cmp    %edx,%eax
c01047ce:	72 0a                	jb     c01047da <keyboard_handler+0x7a>
c01047d0:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01047d7:	fb 10 c0 
c01047da:	e8 35 bb ff ff       	call   c0100314 <enable_int>
c01047df:	eb 01                	jmp    c01047e2 <keyboard_handler+0x82>
c01047e1:	90                   	nop
c01047e2:	c9                   	leave  
c01047e3:	c3                   	ret    

c01047e4 <read_from_keyboard_buf>:
c01047e4:	55                   	push   %ebp
c01047e5:	89 e5                	mov    %esp,%ebp
c01047e7:	83 ec 18             	sub    $0x18,%esp
c01047ea:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c01047ee:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047f3:	85 c0                	test   %eax,%eax
c01047f5:	7f 06                	jg     c01047fd <read_from_keyboard_buf+0x19>
c01047f7:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01047fb:	eb 4b                	jmp    c0104848 <read_from_keyboard_buf+0x64>
c01047fd:	e8 10 bb ff ff       	call   c0100312 <disable_int>
c0104802:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104807:	0f b6 00             	movzbl (%eax),%eax
c010480a:	88 45 f7             	mov    %al,-0x9(%ebp)
c010480d:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104812:	83 c0 01             	add    $0x1,%eax
c0104815:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010481a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010481f:	83 e8 01             	sub    $0x1,%eax
c0104822:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104827:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c010482c:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104831:	39 d0                	cmp    %edx,%eax
c0104833:	72 0a                	jb     c010483f <read_from_keyboard_buf+0x5b>
c0104835:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c010483c:	fb 10 c0 
c010483f:	e8 d0 ba ff ff       	call   c0100314 <enable_int>
c0104844:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104848:	c9                   	leave  
c0104849:	c3                   	ret    

c010484a <keyboard_read>:
c010484a:	55                   	push   %ebp
c010484b:	89 e5                	mov    %esp,%ebp
c010484d:	83 ec 28             	sub    $0x28,%esp
c0104850:	90                   	nop
c0104851:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104856:	85 c0                	test   %eax,%eax
c0104858:	7e f7                	jle    c0104851 <keyboard_read+0x7>
c010485a:	e8 85 ff ff ff       	call   c01047e4 <read_from_keyboard_buf>
c010485f:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104862:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104869:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010486d:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104871:	75 5a                	jne    c01048cd <keyboard_read+0x83>
c0104873:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104877:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c010487b:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010487f:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104883:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104887:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c010488b:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010488f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104896:	eb 20                	jmp    c01048b8 <keyboard_read+0x6e>
c0104898:	e8 47 ff ff ff       	call   c01047e4 <read_from_keyboard_buf>
c010489d:	89 c1                	mov    %eax,%ecx
c010489f:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c01048a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01048a5:	01 d0                	add    %edx,%eax
c01048a7:	0f b6 00             	movzbl (%eax),%eax
c01048aa:	38 c1                	cmp    %al,%cl
c01048ac:	74 06                	je     c01048b4 <keyboard_read+0x6a>
c01048ae:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c01048b2:	eb 0a                	jmp    c01048be <keyboard_read+0x74>
c01048b4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01048b8:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c01048bc:	7e da                	jle    c0104898 <keyboard_read+0x4e>
c01048be:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c01048c2:	74 68                	je     c010492c <keyboard_read+0xe2>
c01048c4:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c01048cb:	eb 5f                	jmp    c010492c <keyboard_read+0xe2>
c01048cd:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c01048d1:	75 59                	jne    c010492c <keyboard_read+0xe2>
c01048d3:	e8 0c ff ff ff       	call   c01047e4 <read_from_keyboard_buf>
c01048d8:	3c 2a                	cmp    $0x2a,%al
c01048da:	75 1d                	jne    c01048f9 <keyboard_read+0xaf>
c01048dc:	e8 03 ff ff ff       	call   c01047e4 <read_from_keyboard_buf>
c01048e1:	3c e0                	cmp    $0xe0,%al
c01048e3:	75 14                	jne    c01048f9 <keyboard_read+0xaf>
c01048e5:	e8 fa fe ff ff       	call   c01047e4 <read_from_keyboard_buf>
c01048ea:	3c 37                	cmp    $0x37,%al
c01048ec:	75 0b                	jne    c01048f9 <keyboard_read+0xaf>
c01048ee:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01048f5:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c01048f9:	e8 e6 fe ff ff       	call   c01047e4 <read_from_keyboard_buf>
c01048fe:	3c b7                	cmp    $0xb7,%al
c0104900:	75 1d                	jne    c010491f <keyboard_read+0xd5>
c0104902:	e8 dd fe ff ff       	call   c01047e4 <read_from_keyboard_buf>
c0104907:	3c e0                	cmp    $0xe0,%al
c0104909:	75 14                	jne    c010491f <keyboard_read+0xd5>
c010490b:	e8 d4 fe ff ff       	call   c01047e4 <read_from_keyboard_buf>
c0104910:	3c aa                	cmp    $0xaa,%al
c0104912:	75 0b                	jne    c010491f <keyboard_read+0xd5>
c0104914:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c010491b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010491f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104923:	75 07                	jne    c010492c <keyboard_read+0xe2>
c0104925:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c010492c:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104933:	0f 84 8d 00 00 00    	je     c01049c6 <keyboard_read+0x17c>
c0104939:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0104940:	0f 84 80 00 00 00    	je     c01049c6 <keyboard_read+0x17c>
c0104946:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c010494a:	0f 94 c2             	sete   %dl
c010494d:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104951:	0f 94 c0             	sete   %al
c0104954:	09 d0                	or     %edx,%eax
c0104956:	84 c0                	test   %al,%al
c0104958:	74 07                	je     c0104961 <keyboard_read+0x117>
c010495a:	c6 05 cc 06 11 c0 01 	movb   $0x1,0xc01106cc
c0104961:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104965:	f7 d0                	not    %eax
c0104967:	c0 e8 07             	shr    $0x7,%al
c010496a:	88 45 e9             	mov    %al,-0x17(%ebp)
c010496d:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104971:	74 53                	je     c01049c6 <keyboard_read+0x17c>
c0104973:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104977:	74 4d                	je     c01049c6 <keyboard_read+0x17c>
c0104979:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c010497d:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104984:	3c 01                	cmp    $0x1,%al
c0104986:	75 04                	jne    c010498c <keyboard_read+0x142>
c0104988:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c010498c:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104993:	84 c0                	test   %al,%al
c0104995:	74 04                	je     c010499b <keyboard_read+0x151>
c0104997:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c010499b:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c010499f:	89 d0                	mov    %edx,%eax
c01049a1:	01 c0                	add    %eax,%eax
c01049a3:	01 c2                	add    %eax,%edx
c01049a5:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01049a9:	01 d0                	add    %edx,%eax
c01049ab:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c01049b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01049b5:	83 ec 08             	sub    $0x8,%esp
c01049b8:	ff 75 f4             	pushl  -0xc(%ebp)
c01049bb:	ff 75 08             	pushl  0x8(%ebp)
c01049be:	e8 1a 00 00 00       	call   c01049dd <in_process>
c01049c3:	83 c4 10             	add    $0x10,%esp
c01049c6:	90                   	nop
c01049c7:	c9                   	leave  
c01049c8:	c3                   	ret    

c01049c9 <init_keyboard_handler>:
c01049c9:	55                   	push   %ebp
c01049ca:	89 e5                	mov    %esp,%ebp
c01049cc:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01049d3:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c01049da:	90                   	nop
c01049db:	5d                   	pop    %ebp
c01049dc:	c3                   	ret    

c01049dd <in_process>:
c01049dd:	55                   	push   %ebp
c01049de:	89 e5                	mov    %esp,%ebp
c01049e0:	83 ec 18             	sub    $0x18,%esp
c01049e3:	83 ec 04             	sub    $0x4,%esp
c01049e6:	6a 02                	push   $0x2
c01049e8:	6a 00                	push   $0x0
c01049ea:	8d 45 f6             	lea    -0xa(%ebp),%eax
c01049ed:	50                   	push   %eax
c01049ee:	e8 dc 77 00 00       	call   c010c1cf <Memset>
c01049f3:	83 c4 10             	add    $0x10,%esp
c01049f6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049f9:	25 00 01 00 00       	and    $0x100,%eax
c01049fe:	85 c0                	test   %eax,%eax
c0104a00:	75 28                	jne    c0104a2a <in_process+0x4d>
c0104a02:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a05:	0f b6 c0             	movzbl %al,%eax
c0104a08:	83 ec 08             	sub    $0x8,%esp
c0104a0b:	50                   	push   %eax
c0104a0c:	ff 75 08             	pushl  0x8(%ebp)
c0104a0f:	e8 b3 f3 ff ff       	call   c0103dc7 <put_key>
c0104a14:	83 c4 10             	add    $0x10,%esp
c0104a17:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a1e:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104a25:	e9 42 01 00 00       	jmp    c0104b6c <in_process+0x18f>
c0104a2a:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104a31:	84 c0                	test   %al,%al
c0104a33:	0f 84 a9 00 00 00    	je     c0104ae2 <in_process+0x105>
c0104a39:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104a3d:	0f 84 9f 00 00 00    	je     c0104ae2 <in_process+0x105>
c0104a43:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104a47:	0f 84 95 00 00 00    	je     c0104ae2 <in_process+0x105>
c0104a4d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a54:	74 64                	je     c0104aba <in_process+0xdd>
c0104a56:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a5d:	77 0b                	ja     c0104a6a <in_process+0x8d>
c0104a5f:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104a66:	74 64                	je     c0104acc <in_process+0xef>
c0104a68:	eb 73                	jmp    c0104add <in_process+0x100>
c0104a6a:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104a71:	74 0b                	je     c0104a7e <in_process+0xa1>
c0104a73:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104a7a:	74 20                	je     c0104a9c <in_process+0xbf>
c0104a7c:	eb 5f                	jmp    c0104add <in_process+0x100>
c0104a7e:	83 ec 0c             	sub    $0xc,%esp
c0104a81:	ff 75 08             	pushl  0x8(%ebp)
c0104a84:	e8 aa f3 ff ff       	call   c0103e33 <scroll_up>
c0104a89:	83 c4 10             	add    $0x10,%esp
c0104a8c:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104a93:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a9a:	eb 41                	jmp    c0104add <in_process+0x100>
c0104a9c:	83 ec 0c             	sub    $0xc,%esp
c0104a9f:	ff 75 08             	pushl  0x8(%ebp)
c0104aa2:	e8 ce f3 ff ff       	call   c0103e75 <scroll_down>
c0104aa7:	83 c4 10             	add    $0x10,%esp
c0104aaa:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104ab1:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104ab8:	eb 23                	jmp    c0104add <in_process+0x100>
c0104aba:	83 ec 08             	sub    $0x8,%esp
c0104abd:	6a 0a                	push   $0xa
c0104abf:	ff 75 08             	pushl  0x8(%ebp)
c0104ac2:	e8 19 f4 ff ff       	call   c0103ee0 <out_char>
c0104ac7:	83 c4 10             	add    $0x10,%esp
c0104aca:	eb 11                	jmp    c0104add <in_process+0x100>
c0104acc:	83 ec 08             	sub    $0x8,%esp
c0104acf:	6a 08                	push   $0x8
c0104ad1:	ff 75 08             	pushl  0x8(%ebp)
c0104ad4:	e8 07 f4 ff ff       	call   c0103ee0 <out_char>
c0104ad9:	83 c4 10             	add    $0x10,%esp
c0104adc:	90                   	nop
c0104add:	e9 8a 00 00 00       	jmp    c0104b6c <in_process+0x18f>
c0104ae2:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104ae9:	74 55                	je     c0104b40 <in_process+0x163>
c0104aeb:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104af2:	77 14                	ja     c0104b08 <in_process+0x12b>
c0104af4:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104afb:	74 31                	je     c0104b2e <in_process+0x151>
c0104afd:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104b04:	74 16                	je     c0104b1c <in_process+0x13f>
c0104b06:	eb 64                	jmp    c0104b6c <in_process+0x18f>
c0104b08:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104b0f:	74 3e                	je     c0104b4f <in_process+0x172>
c0104b11:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104b18:	74 44                	je     c0104b5e <in_process+0x181>
c0104b1a:	eb 50                	jmp    c0104b6c <in_process+0x18f>
c0104b1c:	83 ec 08             	sub    $0x8,%esp
c0104b1f:	6a 0a                	push   $0xa
c0104b21:	ff 75 08             	pushl  0x8(%ebp)
c0104b24:	e8 9e f2 ff ff       	call   c0103dc7 <put_key>
c0104b29:	83 c4 10             	add    $0x10,%esp
c0104b2c:	eb 3e                	jmp    c0104b6c <in_process+0x18f>
c0104b2e:	83 ec 08             	sub    $0x8,%esp
c0104b31:	6a 08                	push   $0x8
c0104b33:	ff 75 08             	pushl  0x8(%ebp)
c0104b36:	e8 8c f2 ff ff       	call   c0103dc7 <put_key>
c0104b3b:	83 c4 10             	add    $0x10,%esp
c0104b3e:	eb 2c                	jmp    c0104b6c <in_process+0x18f>
c0104b40:	83 ec 0c             	sub    $0xc,%esp
c0104b43:	6a 00                	push   $0x0
c0104b45:	e8 4c f1 ff ff       	call   c0103c96 <select_console>
c0104b4a:	83 c4 10             	add    $0x10,%esp
c0104b4d:	eb 1d                	jmp    c0104b6c <in_process+0x18f>
c0104b4f:	83 ec 0c             	sub    $0xc,%esp
c0104b52:	6a 01                	push   $0x1
c0104b54:	e8 3d f1 ff ff       	call   c0103c96 <select_console>
c0104b59:	83 c4 10             	add    $0x10,%esp
c0104b5c:	eb 0e                	jmp    c0104b6c <in_process+0x18f>
c0104b5e:	83 ec 0c             	sub    $0xc,%esp
c0104b61:	6a 02                	push   $0x2
c0104b63:	e8 2e f1 ff ff       	call   c0103c96 <select_console>
c0104b68:	83 c4 10             	add    $0x10,%esp
c0104b6b:	90                   	nop
c0104b6c:	90                   	nop
c0104b6d:	c9                   	leave  
c0104b6e:	c3                   	ret    

c0104b6f <open>:
c0104b6f:	55                   	push   %ebp
c0104b70:	89 e5                	mov    %esp,%ebp
c0104b72:	83 ec 18             	sub    $0x18,%esp
c0104b75:	83 ec 0c             	sub    $0xc,%esp
c0104b78:	6a 7c                	push   $0x7c
c0104b7a:	e8 cd ca ff ff       	call   c010164c <sys_malloc>
c0104b7f:	83 c4 10             	add    $0x10,%esp
c0104b82:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104b85:	83 ec 04             	sub    $0x4,%esp
c0104b88:	6a 7c                	push   $0x7c
c0104b8a:	6a 00                	push   $0x0
c0104b8c:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b8f:	e8 3b 76 00 00       	call   c010c1cf <Memset>
c0104b94:	83 c4 10             	add    $0x10,%esp
c0104b97:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b9a:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104ba1:	83 ec 0c             	sub    $0xc,%esp
c0104ba4:	ff 75 08             	pushl  0x8(%ebp)
c0104ba7:	e8 32 14 00 00       	call   c0105fde <get_physical_address>
c0104bac:	83 c4 10             	add    $0x10,%esp
c0104baf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104bb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bb5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104bb8:	89 50 44             	mov    %edx,0x44(%eax)
c0104bbb:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104bbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bc1:	89 50 74             	mov    %edx,0x74(%eax)
c0104bc4:	83 ec 0c             	sub    $0xc,%esp
c0104bc7:	ff 75 08             	pushl  0x8(%ebp)
c0104bca:	e8 39 76 00 00       	call   c010c208 <Strlen>
c0104bcf:	83 c4 10             	add    $0x10,%esp
c0104bd2:	89 c2                	mov    %eax,%edx
c0104bd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bd7:	89 50 40             	mov    %edx,0x40(%eax)
c0104bda:	83 ec 04             	sub    $0x4,%esp
c0104bdd:	6a 02                	push   $0x2
c0104bdf:	ff 75 f4             	pushl  -0xc(%ebp)
c0104be2:	6a 03                	push   $0x3
c0104be4:	e8 9c 49 00 00       	call   c0109585 <send_rec>
c0104be9:	83 c4 10             	add    $0x10,%esp
c0104bec:	83 ec 08             	sub    $0x8,%esp
c0104bef:	6a 7c                	push   $0x7c
c0104bf1:	ff 75 f4             	pushl  -0xc(%ebp)
c0104bf4:	e8 68 ca ff ff       	call   c0101661 <sys_free>
c0104bf9:	83 c4 10             	add    $0x10,%esp
c0104bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bff:	8b 40 50             	mov    0x50(%eax),%eax
c0104c02:	c9                   	leave  
c0104c03:	c3                   	ret    

c0104c04 <read>:
c0104c04:	55                   	push   %ebp
c0104c05:	89 e5                	mov    %esp,%ebp
c0104c07:	83 ec 38             	sub    $0x38,%esp
c0104c0a:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104c11:	83 ec 0c             	sub    $0xc,%esp
c0104c14:	ff 75 dc             	pushl  -0x24(%ebp)
c0104c17:	e8 30 ca ff ff       	call   c010164c <sys_malloc>
c0104c1c:	83 c4 10             	add    $0x10,%esp
c0104c1f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104c22:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104c25:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104c2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104c2d:	83 ec 0c             	sub    $0xc,%esp
c0104c30:	ff 75 0c             	pushl  0xc(%ebp)
c0104c33:	e8 a6 13 00 00       	call   c0105fde <get_physical_address>
c0104c38:	83 c4 10             	add    $0x10,%esp
c0104c3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c41:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104c46:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104c49:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104c4c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104c51:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104c54:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104c5b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104c62:	8b 55 10             	mov    0x10(%ebp),%edx
c0104c65:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c68:	01 d0                	add    %edx,%eax
c0104c6a:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104c6d:	0f 83 a8 00 00 00    	jae    c0104d1b <read+0x117>
c0104c73:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104c76:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104c79:	05 00 10 00 00       	add    $0x1000,%eax
c0104c7e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104c81:	8b 45 10             	mov    0x10(%ebp),%eax
c0104c84:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104c87:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104c8a:	83 ec 04             	sub    $0x4,%esp
c0104c8d:	50                   	push   %eax
c0104c8e:	6a 00                	push   $0x0
c0104c90:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c93:	e8 37 75 00 00       	call   c010c1cf <Memset>
c0104c98:	83 c4 10             	add    $0x10,%esp
c0104c9b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c9e:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104ca5:	8b 55 08             	mov    0x8(%ebp),%edx
c0104ca8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cab:	89 50 50             	mov    %edx,0x50(%eax)
c0104cae:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cb1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104cb4:	89 50 10             	mov    %edx,0x10(%eax)
c0104cb7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104cbd:	89 50 60             	mov    %edx,0x60(%eax)
c0104cc0:	83 ec 04             	sub    $0x4,%esp
c0104cc3:	6a 02                	push   $0x2
c0104cc5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104cc8:	6a 03                	push   $0x3
c0104cca:	e8 b6 48 00 00       	call   c0109585 <send_rec>
c0104ccf:	83 c4 10             	add    $0x10,%esp
c0104cd2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cd5:	8b 40 60             	mov    0x60(%eax),%eax
c0104cd8:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104cdb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104cde:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104ce1:	8b 45 10             	mov    0x10(%ebp),%eax
c0104ce4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104ce7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104cea:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104ced:	89 45 10             	mov    %eax,0x10(%ebp)
c0104cf0:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104cf7:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104cfe:	83 ec 0c             	sub    $0xc,%esp
c0104d01:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d04:	e8 d5 12 00 00       	call   c0105fde <get_physical_address>
c0104d09:	83 c4 10             	add    $0x10,%esp
c0104d0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104d0f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104d13:	0f 85 6e ff ff ff    	jne    c0104c87 <read+0x83>
c0104d19:	eb 54                	jmp    c0104d6f <read+0x16b>
c0104d1b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104d1e:	83 ec 04             	sub    $0x4,%esp
c0104d21:	50                   	push   %eax
c0104d22:	6a 00                	push   $0x0
c0104d24:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d27:	e8 a3 74 00 00       	call   c010c1cf <Memset>
c0104d2c:	83 c4 10             	add    $0x10,%esp
c0104d2f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d32:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104d39:	8b 55 08             	mov    0x8(%ebp),%edx
c0104d3c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d3f:	89 50 50             	mov    %edx,0x50(%eax)
c0104d42:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d45:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104d48:	89 50 10             	mov    %edx,0x10(%eax)
c0104d4b:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d4e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d51:	89 50 60             	mov    %edx,0x60(%eax)
c0104d54:	83 ec 04             	sub    $0x4,%esp
c0104d57:	6a 02                	push   $0x2
c0104d59:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d5c:	6a 03                	push   $0x3
c0104d5e:	e8 22 48 00 00       	call   c0109585 <send_rec>
c0104d63:	83 c4 10             	add    $0x10,%esp
c0104d66:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d69:	8b 40 60             	mov    0x60(%eax),%eax
c0104d6c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104d6f:	83 ec 08             	sub    $0x8,%esp
c0104d72:	ff 75 dc             	pushl  -0x24(%ebp)
c0104d75:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d78:	e8 e4 c8 ff ff       	call   c0101661 <sys_free>
c0104d7d:	83 c4 10             	add    $0x10,%esp
c0104d80:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104d83:	c9                   	leave  
c0104d84:	c3                   	ret    

c0104d85 <write>:
c0104d85:	55                   	push   %ebp
c0104d86:	89 e5                	mov    %esp,%ebp
c0104d88:	83 ec 18             	sub    $0x18,%esp
c0104d8b:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104d92:	83 ec 0c             	sub    $0xc,%esp
c0104d95:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d98:	e8 af c8 ff ff       	call   c010164c <sys_malloc>
c0104d9d:	83 c4 10             	add    $0x10,%esp
c0104da0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104da3:	83 ec 0c             	sub    $0xc,%esp
c0104da6:	ff 75 0c             	pushl  0xc(%ebp)
c0104da9:	e8 30 12 00 00       	call   c0105fde <get_physical_address>
c0104dae:	83 c4 10             	add    $0x10,%esp
c0104db1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104db4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104db7:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104dbe:	8b 55 08             	mov    0x8(%ebp),%edx
c0104dc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dc4:	89 50 50             	mov    %edx,0x50(%eax)
c0104dc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dca:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104dcd:	89 50 10             	mov    %edx,0x10(%eax)
c0104dd0:	8b 55 10             	mov    0x10(%ebp),%edx
c0104dd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dd6:	89 50 60             	mov    %edx,0x60(%eax)
c0104dd9:	83 ec 04             	sub    $0x4,%esp
c0104ddc:	6a 02                	push   $0x2
c0104dde:	ff 75 f0             	pushl  -0x10(%ebp)
c0104de1:	6a 03                	push   $0x3
c0104de3:	e8 9d 47 00 00       	call   c0109585 <send_rec>
c0104de8:	83 c4 10             	add    $0x10,%esp
c0104deb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dee:	8b 40 60             	mov    0x60(%eax),%eax
c0104df1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104df4:	83 ec 08             	sub    $0x8,%esp
c0104df7:	ff 75 f4             	pushl  -0xc(%ebp)
c0104dfa:	ff 75 f0             	pushl  -0x10(%ebp)
c0104dfd:	e8 5f c8 ff ff       	call   c0101661 <sys_free>
c0104e02:	83 c4 10             	add    $0x10,%esp
c0104e05:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104e08:	c9                   	leave  
c0104e09:	c3                   	ret    

c0104e0a <close>:
c0104e0a:	55                   	push   %ebp
c0104e0b:	89 e5                	mov    %esp,%ebp
c0104e0d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e13:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104e1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e1d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104e20:	83 ec 04             	sub    $0x4,%esp
c0104e23:	6a 02                	push   $0x2
c0104e25:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e2b:	50                   	push   %eax
c0104e2c:	6a 03                	push   $0x3
c0104e2e:	e8 52 47 00 00       	call   c0109585 <send_rec>
c0104e33:	83 c4 10             	add    $0x10,%esp
c0104e36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e39:	83 f8 65             	cmp    $0x65,%eax
c0104e3c:	74 19                	je     c0104e57 <close+0x4d>
c0104e3e:	6a 13                	push   $0x13
c0104e40:	68 27 b5 10 c0       	push   $0xc010b527
c0104e45:	68 27 b5 10 c0       	push   $0xc010b527
c0104e4a:	68 33 b5 10 c0       	push   $0xc010b533
c0104e4f:	e8 c1 3a 00 00       	call   c0108915 <assertion_failure>
c0104e54:	83 c4 10             	add    $0x10,%esp
c0104e57:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104e5a:	c9                   	leave  
c0104e5b:	c3                   	ret    

c0104e5c <wait>:
c0104e5c:	55                   	push   %ebp
c0104e5d:	89 e5                	mov    %esp,%ebp
c0104e5f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e65:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104e6c:	83 ec 04             	sub    $0x4,%esp
c0104e6f:	6a 01                	push   $0x1
c0104e71:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e77:	50                   	push   %eax
c0104e78:	6a 03                	push   $0x3
c0104e7a:	e8 06 47 00 00       	call   c0109585 <send_rec>
c0104e7f:	83 c4 10             	add    $0x10,%esp
c0104e82:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104e85:	89 c2                	mov    %eax,%edx
c0104e87:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e8a:	89 10                	mov    %edx,(%eax)
c0104e8c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e8f:	83 f8 21             	cmp    $0x21,%eax
c0104e92:	74 05                	je     c0104e99 <wait+0x3d>
c0104e94:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e97:	eb 05                	jmp    c0104e9e <wait+0x42>
c0104e99:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104e9e:	c9                   	leave  
c0104e9f:	c3                   	ret    

c0104ea0 <exit>:
c0104ea0:	55                   	push   %ebp
c0104ea1:	89 e5                	mov    %esp,%ebp
c0104ea3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ea9:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104eb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0104eb3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104eb6:	83 ec 04             	sub    $0x4,%esp
c0104eb9:	6a 01                	push   $0x1
c0104ebb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ec1:	50                   	push   %eax
c0104ec2:	6a 03                	push   $0x3
c0104ec4:	e8 bc 46 00 00       	call   c0109585 <send_rec>
c0104ec9:	83 c4 10             	add    $0x10,%esp
c0104ecc:	90                   	nop
c0104ecd:	c9                   	leave  
c0104ece:	c3                   	ret    

c0104ecf <fork>:
c0104ecf:	55                   	push   %ebp
c0104ed0:	89 e5                	mov    %esp,%ebp
c0104ed2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ed8:	83 ec 04             	sub    $0x4,%esp
c0104edb:	6a 7c                	push   $0x7c
c0104edd:	6a 00                	push   $0x0
c0104edf:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ee5:	50                   	push   %eax
c0104ee6:	e8 e4 72 00 00       	call   c010c1cf <Memset>
c0104eeb:	83 c4 10             	add    $0x10,%esp
c0104eee:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104ef5:	83 ec 04             	sub    $0x4,%esp
c0104ef8:	6a 01                	push   $0x1
c0104efa:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f00:	50                   	push   %eax
c0104f01:	6a 03                	push   $0x3
c0104f03:	e8 7d 46 00 00       	call   c0109585 <send_rec>
c0104f08:	83 c4 10             	add    $0x10,%esp
c0104f0b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104f12:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f15:	c9                   	leave  
c0104f16:	c3                   	ret    

c0104f17 <getpid>:
c0104f17:	55                   	push   %ebp
c0104f18:	89 e5                	mov    %esp,%ebp
c0104f1a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f20:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104f27:	83 ec 04             	sub    $0x4,%esp
c0104f2a:	6a 05                	push   $0x5
c0104f2c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f32:	50                   	push   %eax
c0104f33:	6a 03                	push   $0x3
c0104f35:	e8 4b 46 00 00       	call   c0109585 <send_rec>
c0104f3a:	83 c4 10             	add    $0x10,%esp
c0104f3d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f40:	c9                   	leave  
c0104f41:	c3                   	ret    

c0104f42 <exec>:
c0104f42:	55                   	push   %ebp
c0104f43:	89 e5                	mov    %esp,%ebp
c0104f45:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f4b:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104f52:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f55:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104f58:	83 ec 0c             	sub    $0xc,%esp
c0104f5b:	ff 75 08             	pushl  0x8(%ebp)
c0104f5e:	e8 a5 72 00 00       	call   c010c208 <Strlen>
c0104f63:	83 c4 10             	add    $0x10,%esp
c0104f66:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104f69:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104f70:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104f77:	83 ec 04             	sub    $0x4,%esp
c0104f7a:	6a 01                	push   $0x1
c0104f7c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f82:	50                   	push   %eax
c0104f83:	6a 03                	push   $0x3
c0104f85:	e8 fb 45 00 00       	call   c0109585 <send_rec>
c0104f8a:	83 c4 10             	add    $0x10,%esp
c0104f8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104f90:	83 f8 65             	cmp    $0x65,%eax
c0104f93:	74 19                	je     c0104fae <exec+0x6c>
c0104f95:	6a 19                	push   $0x19
c0104f97:	68 4b b5 10 c0       	push   $0xc010b54b
c0104f9c:	68 4b b5 10 c0       	push   $0xc010b54b
c0104fa1:	68 56 b5 10 c0       	push   $0xc010b556
c0104fa6:	e8 6a 39 00 00       	call   c0108915 <assertion_failure>
c0104fab:	83 c4 10             	add    $0x10,%esp
c0104fae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104fb1:	c9                   	leave  
c0104fb2:	c3                   	ret    

c0104fb3 <execv>:
c0104fb3:	55                   	push   %ebp
c0104fb4:	89 e5                	mov    %esp,%ebp
c0104fb6:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104fbc:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104fc3:	83 ec 0c             	sub    $0xc,%esp
c0104fc6:	ff 75 e0             	pushl  -0x20(%ebp)
c0104fc9:	e8 7e c6 ff ff       	call   c010164c <sys_malloc>
c0104fce:	83 c4 10             	add    $0x10,%esp
c0104fd1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104fd4:	66 87 db             	xchg   %bx,%bx
c0104fd7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104fda:	83 ec 04             	sub    $0x4,%esp
c0104fdd:	50                   	push   %eax
c0104fde:	6a 00                	push   $0x0
c0104fe0:	ff 75 dc             	pushl  -0x24(%ebp)
c0104fe3:	e8 e7 71 00 00       	call   c010c1cf <Memset>
c0104fe8:	83 c4 10             	add    $0x10,%esp
c0104feb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104fee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104ff1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104ff8:	eb 23                	jmp    c010501d <execv+0x6a>
c0104ffa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ffd:	8b 00                	mov    (%eax),%eax
c0104fff:	83 ec 08             	sub    $0x8,%esp
c0105002:	50                   	push   %eax
c0105003:	68 6e b5 10 c0       	push   $0xc010b56e
c0105008:	e8 ab 35 00 00       	call   c01085b8 <Printf>
c010500d:	83 c4 10             	add    $0x10,%esp
c0105010:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0105014:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105017:	83 c0 04             	add    $0x4,%eax
c010501a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010501d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105020:	8b 00                	mov    (%eax),%eax
c0105022:	85 c0                	test   %eax,%eax
c0105024:	75 d4                	jne    c0104ffa <execv+0x47>
c0105026:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105029:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010502c:	01 d0                	add    %edx,%eax
c010502e:	c6 00 00             	movb   $0x0,(%eax)
c0105031:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105034:	83 c0 04             	add    $0x4,%eax
c0105037:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010503a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010503d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105040:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105043:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105046:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010504d:	eb 5b                	jmp    c01050aa <execv+0xf7>
c010504f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105052:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105055:	01 c2                	add    %eax,%edx
c0105057:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010505a:	89 10                	mov    %edx,(%eax)
c010505c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010505f:	8b 00                	mov    (%eax),%eax
c0105061:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0105064:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0105067:	01 ca                	add    %ecx,%edx
c0105069:	83 ec 08             	sub    $0x8,%esp
c010506c:	50                   	push   %eax
c010506d:	52                   	push   %edx
c010506e:	e8 7b 71 00 00       	call   c010c1ee <Strcpy>
c0105073:	83 c4 10             	add    $0x10,%esp
c0105076:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105079:	8b 00                	mov    (%eax),%eax
c010507b:	83 ec 0c             	sub    $0xc,%esp
c010507e:	50                   	push   %eax
c010507f:	e8 84 71 00 00       	call   c010c208 <Strlen>
c0105084:	83 c4 10             	add    $0x10,%esp
c0105087:	01 45 f0             	add    %eax,-0x10(%ebp)
c010508a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010508d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105090:	01 d0                	add    %edx,%eax
c0105092:	c6 00 00             	movb   $0x0,(%eax)
c0105095:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105098:	83 c0 01             	add    $0x1,%eax
c010509b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010509e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c01050a2:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c01050a6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01050aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01050ad:	8b 00                	mov    (%eax),%eax
c01050af:	85 c0                	test   %eax,%eax
c01050b1:	75 9c                	jne    c010504f <execv+0x9c>
c01050b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050b6:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c01050bb:	29 c2                	sub    %eax,%edx
c01050bd:	89 d0                	mov    %edx,%eax
c01050bf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01050c2:	83 ec 0c             	sub    $0xc,%esp
c01050c5:	ff 75 08             	pushl  0x8(%ebp)
c01050c8:	e8 11 0f 00 00       	call   c0105fde <get_physical_address>
c01050cd:	83 c4 10             	add    $0x10,%esp
c01050d0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01050d3:	83 ec 0c             	sub    $0xc,%esp
c01050d6:	ff 75 dc             	pushl  -0x24(%ebp)
c01050d9:	e8 00 0f 00 00       	call   c0105fde <get_physical_address>
c01050de:	83 c4 10             	add    $0x10,%esp
c01050e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01050e4:	83 ec 0c             	sub    $0xc,%esp
c01050e7:	ff 75 d8             	pushl  -0x28(%ebp)
c01050ea:	e8 ef 0e 00 00       	call   c0105fde <get_physical_address>
c01050ef:	83 c4 10             	add    $0x10,%esp
c01050f2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01050f5:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c01050fc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01050ff:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105102:	83 ec 0c             	sub    $0xc,%esp
c0105105:	ff 75 08             	pushl  0x8(%ebp)
c0105108:	e8 fb 70 00 00       	call   c010c208 <Strlen>
c010510d:	83 c4 10             	add    $0x10,%esp
c0105110:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105113:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105116:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010511c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010511f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105125:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105128:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010512e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105131:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105137:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010513a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105140:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105143:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105146:	29 c2                	sub    %eax,%edx
c0105148:	89 d0                	mov    %edx,%eax
c010514a:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0105150:	83 ec 04             	sub    $0x4,%esp
c0105153:	6a 01                	push   $0x1
c0105155:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c010515b:	50                   	push   %eax
c010515c:	6a 03                	push   $0x3
c010515e:	e8 22 44 00 00       	call   c0109585 <send_rec>
c0105163:	83 c4 10             	add    $0x10,%esp
c0105166:	83 ec 08             	sub    $0x8,%esp
c0105169:	68 00 04 00 00       	push   $0x400
c010516e:	ff 75 dc             	pushl  -0x24(%ebp)
c0105171:	e8 eb c4 ff ff       	call   c0101661 <sys_free>
c0105176:	83 c4 10             	add    $0x10,%esp
c0105179:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010517c:	83 f8 65             	cmp    $0x65,%eax
c010517f:	74 1c                	je     c010519d <execv+0x1ea>
c0105181:	68 95 00 00 00       	push   $0x95
c0105186:	68 4b b5 10 c0       	push   $0xc010b54b
c010518b:	68 4b b5 10 c0       	push   $0xc010b54b
c0105190:	68 56 b5 10 c0       	push   $0xc010b556
c0105195:	e8 7b 37 00 00       	call   c0108915 <assertion_failure>
c010519a:	83 c4 10             	add    $0x10,%esp
c010519d:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01051a0:	c9                   	leave  
c01051a1:	c3                   	ret    

c01051a2 <execl>:
c01051a2:	55                   	push   %ebp
c01051a3:	89 e5                	mov    %esp,%ebp
c01051a5:	83 ec 18             	sub    $0x18,%esp
c01051a8:	8d 45 0c             	lea    0xc(%ebp),%eax
c01051ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01051ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01051b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01051b4:	83 ec 08             	sub    $0x8,%esp
c01051b7:	ff 75 f0             	pushl  -0x10(%ebp)
c01051ba:	ff 75 08             	pushl  0x8(%ebp)
c01051bd:	e8 f1 fd ff ff       	call   c0104fb3 <execv>
c01051c2:	83 c4 10             	add    $0x10,%esp
c01051c5:	c9                   	leave  
c01051c6:	c3                   	ret    

c01051c7 <TaskMM>:
c01051c7:	55                   	push   %ebp
c01051c8:	89 e5                	mov    %esp,%ebp
c01051ca:	83 ec 28             	sub    $0x28,%esp
c01051cd:	83 ec 0c             	sub    $0xc,%esp
c01051d0:	6a 7c                	push   $0x7c
c01051d2:	e8 75 c4 ff ff       	call   c010164c <sys_malloc>
c01051d7:	83 c4 10             	add    $0x10,%esp
c01051da:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01051dd:	83 ec 0c             	sub    $0xc,%esp
c01051e0:	6a 7c                	push   $0x7c
c01051e2:	e8 65 c4 ff ff       	call   c010164c <sys_malloc>
c01051e7:	83 c4 10             	add    $0x10,%esp
c01051ea:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01051ed:	83 ec 04             	sub    $0x4,%esp
c01051f0:	6a 12                	push   $0x12
c01051f2:	ff 75 f0             	pushl  -0x10(%ebp)
c01051f5:	6a 02                	push   $0x2
c01051f7:	e8 89 43 00 00       	call   c0109585 <send_rec>
c01051fc:	83 c4 10             	add    $0x10,%esp
c01051ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105202:	8b 40 78             	mov    0x78(%eax),%eax
c0105205:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105208:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010520b:	8b 00                	mov    (%eax),%eax
c010520d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105210:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105217:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010521a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0105221:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105224:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c010522b:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c010522f:	74 4e                	je     c010527f <TaskMM+0xb8>
c0105231:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105235:	7f 08                	jg     c010523f <TaskMM+0x78>
c0105237:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c010523b:	74 28                	je     c0105265 <TaskMM+0x9e>
c010523d:	eb 71                	jmp    c01052b0 <TaskMM+0xe9>
c010523f:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0105243:	74 08                	je     c010524d <TaskMM+0x86>
c0105245:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0105249:	74 4e                	je     c0105299 <TaskMM+0xd2>
c010524b:	eb 63                	jmp    c01052b0 <TaskMM+0xe9>
c010524d:	83 ec 0c             	sub    $0xc,%esp
c0105250:	ff 75 f0             	pushl  -0x10(%ebp)
c0105253:	e8 d0 04 00 00       	call   c0105728 <do_fork>
c0105258:	83 c4 10             	add    $0x10,%esp
c010525b:	89 c2                	mov    %eax,%edx
c010525d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105260:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105263:	eb 5c                	jmp    c01052c1 <TaskMM+0xfa>
c0105265:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010526c:	66 87 db             	xchg   %bx,%bx
c010526f:	83 ec 0c             	sub    $0xc,%esp
c0105272:	ff 75 f0             	pushl  -0x10(%ebp)
c0105275:	e8 95 00 00 00       	call   c010530f <do_exec>
c010527a:	83 c4 10             	add    $0x10,%esp
c010527d:	eb 42                	jmp    c01052c1 <TaskMM+0xfa>
c010527f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105286:	83 ec 08             	sub    $0x8,%esp
c0105289:	ff 75 e0             	pushl  -0x20(%ebp)
c010528c:	ff 75 f0             	pushl  -0x10(%ebp)
c010528f:	e8 02 05 00 00       	call   c0105796 <do_exit>
c0105294:	83 c4 10             	add    $0x10,%esp
c0105297:	eb 28                	jmp    c01052c1 <TaskMM+0xfa>
c0105299:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01052a0:	83 ec 0c             	sub    $0xc,%esp
c01052a3:	ff 75 f0             	pushl  -0x10(%ebp)
c01052a6:	e8 75 05 00 00       	call   c0105820 <do_wait>
c01052ab:	83 c4 10             	add    $0x10,%esp
c01052ae:	eb 11                	jmp    c01052c1 <TaskMM+0xfa>
c01052b0:	83 ec 0c             	sub    $0xc,%esp
c01052b3:	68 78 b5 10 c0       	push   $0xc010b578
c01052b8:	e8 3a 36 00 00       	call   c01088f7 <panic>
c01052bd:	83 c4 10             	add    $0x10,%esp
c01052c0:	90                   	nop
c01052c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01052c5:	0f 84 22 ff ff ff    	je     c01051ed <TaskMM+0x26>
c01052cb:	83 ec 0c             	sub    $0xc,%esp
c01052ce:	6a 03                	push   $0x3
c01052d0:	e8 af 31 00 00       	call   c0108484 <delay>
c01052d5:	83 c4 10             	add    $0x10,%esp
c01052d8:	83 ec 04             	sub    $0x4,%esp
c01052db:	ff 75 e4             	pushl  -0x1c(%ebp)
c01052de:	ff 75 ec             	pushl  -0x14(%ebp)
c01052e1:	6a 01                	push   $0x1
c01052e3:	e8 9d 42 00 00       	call   c0109585 <send_rec>
c01052e8:	83 c4 10             	add    $0x10,%esp
c01052eb:	e9 fd fe ff ff       	jmp    c01051ed <TaskMM+0x26>

c01052f0 <alloc_mem>:
c01052f0:	55                   	push   %ebp
c01052f1:	89 e5                	mov    %esp,%ebp
c01052f3:	83 ec 10             	sub    $0x10,%esp
c01052f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01052f9:	83 e8 08             	sub    $0x8,%eax
c01052fc:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0105302:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105307:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010530a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010530d:	c9                   	leave  
c010530e:	c3                   	ret    

c010530f <do_exec>:
c010530f:	55                   	push   %ebp
c0105310:	89 e5                	mov    %esp,%ebp
c0105312:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105318:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010531f:	65 76 5f 
c0105322:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c0105329:	74 79 31 
c010532c:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105333:	00 00 
c0105335:	83 ec 08             	sub    $0x8,%esp
c0105338:	6a 00                	push   $0x0
c010533a:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c0105340:	50                   	push   %eax
c0105341:	e8 29 f8 ff ff       	call   c0104b6f <open>
c0105346:	83 c4 10             	add    $0x10,%esp
c0105349:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010534c:	8b 45 08             	mov    0x8(%ebp),%eax
c010534f:	8b 00                	mov    (%eax),%eax
c0105351:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105354:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c010535b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010535e:	83 ec 0c             	sub    $0xc,%esp
c0105361:	50                   	push   %eax
c0105362:	e8 e5 c2 ff ff       	call   c010164c <sys_malloc>
c0105367:	83 c4 10             	add    $0x10,%esp
c010536a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010536d:	83 ec 04             	sub    $0x4,%esp
c0105370:	ff 75 d0             	pushl  -0x30(%ebp)
c0105373:	6a 00                	push   $0x0
c0105375:	ff 75 cc             	pushl  -0x34(%ebp)
c0105378:	e8 52 6e 00 00       	call   c010c1cf <Memset>
c010537d:	83 c4 10             	add    $0x10,%esp
c0105380:	83 ec 04             	sub    $0x4,%esp
c0105383:	6a 0c                	push   $0xc
c0105385:	6a 00                	push   $0x0
c0105387:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010538d:	50                   	push   %eax
c010538e:	e8 3c 6e 00 00       	call   c010c1cf <Memset>
c0105393:	83 c4 10             	add    $0x10,%esp
c0105396:	8b 45 08             	mov    0x8(%ebp),%eax
c0105399:	8b 40 44             	mov    0x44(%eax),%eax
c010539c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010539f:	8b 45 08             	mov    0x8(%ebp),%eax
c01053a2:	8b 40 40             	mov    0x40(%eax),%eax
c01053a5:	83 ec 08             	sub    $0x8,%esp
c01053a8:	50                   	push   %eax
c01053a9:	ff 75 c8             	pushl  -0x38(%ebp)
c01053ac:	e8 de 0a 00 00       	call   c0105e8f <alloc_virtual_memory>
c01053b1:	83 c4 10             	add    $0x10,%esp
c01053b4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01053b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01053ba:	8b 40 40             	mov    0x40(%eax),%eax
c01053bd:	89 c2                	mov    %eax,%edx
c01053bf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01053c2:	83 ec 04             	sub    $0x4,%esp
c01053c5:	52                   	push   %edx
c01053c6:	50                   	push   %eax
c01053c7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01053cd:	50                   	push   %eax
c01053ce:	e8 29 19 00 00       	call   c0106cfc <Memcpy>
c01053d3:	83 c4 10             	add    $0x10,%esp
c01053d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01053d9:	8b 40 40             	mov    0x40(%eax),%eax
c01053dc:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c01053e3:	00 
c01053e4:	83 ec 08             	sub    $0x8,%esp
c01053e7:	6a 00                	push   $0x0
c01053e9:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01053ef:	50                   	push   %eax
c01053f0:	e8 7a f7 ff ff       	call   c0104b6f <open>
c01053f5:	83 c4 10             	add    $0x10,%esp
c01053f8:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01053fb:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c01053ff:	75 15                	jne    c0105416 <do_exec+0x107>
c0105401:	83 ec 0c             	sub    $0xc,%esp
c0105404:	68 89 b5 10 c0       	push   $0xc010b589
c0105409:	e8 aa 31 00 00       	call   c01085b8 <Printf>
c010540e:	83 c4 10             	add    $0x10,%esp
c0105411:	e9 10 03 00 00       	jmp    c0105726 <do_exec+0x417>
c0105416:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010541d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105420:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105423:	01 d0                	add    %edx,%eax
c0105425:	83 ec 04             	sub    $0x4,%esp
c0105428:	68 00 10 00 00       	push   $0x1000
c010542d:	50                   	push   %eax
c010542e:	ff 75 c0             	pushl  -0x40(%ebp)
c0105431:	e8 ce f7 ff ff       	call   c0104c04 <read>
c0105436:	83 c4 10             	add    $0x10,%esp
c0105439:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010543c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010543f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0105442:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0105446:	74 0a                	je     c0105452 <do_exec+0x143>
c0105448:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010544b:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c010544e:	7d 05                	jge    c0105455 <do_exec+0x146>
c0105450:	eb cb                	jmp    c010541d <do_exec+0x10e>
c0105452:	90                   	nop
c0105453:	eb 01                	jmp    c0105456 <do_exec+0x147>
c0105455:	90                   	nop
c0105456:	83 ec 0c             	sub    $0xc,%esp
c0105459:	ff 75 c0             	pushl  -0x40(%ebp)
c010545c:	e8 a9 f9 ff ff       	call   c0104e0a <close>
c0105461:	83 c4 10             	add    $0x10,%esp
c0105464:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105467:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010546a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010546d:	8b 40 18             	mov    0x18(%eax),%eax
c0105470:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105473:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010547a:	e9 04 01 00 00       	jmp    c0105583 <do_exec+0x274>
c010547f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105482:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105486:	0f b7 d0             	movzwl %ax,%edx
c0105489:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010548c:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0105490:	0f b7 c0             	movzwl %ax,%eax
c0105493:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105497:	01 c2                	add    %eax,%edx
c0105499:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010549c:	01 d0                	add    %edx,%eax
c010549e:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01054a1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054a4:	8b 40 10             	mov    0x10(%eax),%eax
c01054a7:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01054aa:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01054ad:	05 ff 0f 00 00       	add    $0xfff,%eax
c01054b2:	c1 e8 0c             	shr    $0xc,%eax
c01054b5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01054b8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054bb:	8b 40 08             	mov    0x8(%eax),%eax
c01054be:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01054c1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01054c8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01054cb:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c01054ce:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01054d1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054d4:	8b 50 04             	mov    0x4(%eax),%edx
c01054d7:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01054da:	01 d0                	add    %edx,%eax
c01054dc:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01054df:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c01054e3:	0f 84 95 00 00 00    	je     c010557e <do_exec+0x26f>
c01054e9:	83 ec 04             	sub    $0x4,%esp
c01054ec:	ff 75 d4             	pushl  -0x2c(%ebp)
c01054ef:	ff 75 a8             	pushl  -0x58(%ebp)
c01054f2:	ff 75 a4             	pushl  -0x5c(%ebp)
c01054f5:	e8 a0 07 00 00       	call   c0105c9a <get_virtual_address_start_with_addr>
c01054fa:	83 c4 10             	add    $0x10,%esp
c01054fd:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105500:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105503:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105506:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010550d:	eb 41                	jmp    c0105550 <do_exec+0x241>
c010550f:	83 ec 08             	sub    $0x8,%esp
c0105512:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105515:	ff 75 e8             	pushl  -0x18(%ebp)
c0105518:	e8 f3 0a 00 00       	call   c0106010 <alloc_physical_memory_of_proc>
c010551d:	83 c4 10             	add    $0x10,%esp
c0105520:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105523:	83 ec 08             	sub    $0x8,%esp
c0105526:	68 00 10 00 00       	push   $0x1000
c010552b:	ff 75 94             	pushl  -0x6c(%ebp)
c010552e:	e8 5c 09 00 00       	call   c0105e8f <alloc_virtual_memory>
c0105533:	83 c4 10             	add    $0x10,%esp
c0105536:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105539:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010553d:	75 06                	jne    c0105545 <do_exec+0x236>
c010553f:	8b 45 90             	mov    -0x70(%ebp),%eax
c0105542:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105545:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c010554c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0105550:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105553:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105556:	77 b7                	ja     c010550f <do_exec+0x200>
c0105558:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010555b:	8b 40 10             	mov    0x10(%eax),%eax
c010555e:	89 c1                	mov    %eax,%ecx
c0105560:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105563:	8b 50 04             	mov    0x4(%eax),%edx
c0105566:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105569:	01 c2                	add    %eax,%edx
c010556b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010556e:	83 ec 04             	sub    $0x4,%esp
c0105571:	51                   	push   %ecx
c0105572:	52                   	push   %edx
c0105573:	50                   	push   %eax
c0105574:	e8 83 17 00 00       	call   c0106cfc <Memcpy>
c0105579:	83 c4 10             	add    $0x10,%esp
c010557c:	eb 01                	jmp    c010557f <do_exec+0x270>
c010557e:	90                   	nop
c010557f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105583:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105586:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c010558a:	0f b7 c0             	movzwl %ax,%eax
c010558d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0105590:	0f 8c e9 fe ff ff    	jl     c010547f <do_exec+0x170>
c0105596:	8b 45 08             	mov    0x8(%ebp),%eax
c0105599:	8b 40 10             	mov    0x10(%eax),%eax
c010559c:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010559f:	8b 45 08             	mov    0x8(%ebp),%eax
c01055a2:	8b 40 1c             	mov    0x1c(%eax),%eax
c01055a5:	89 45 88             	mov    %eax,-0x78(%ebp)
c01055a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01055ab:	8b 40 24             	mov    0x24(%eax),%eax
c01055ae:	89 45 84             	mov    %eax,-0x7c(%ebp)
c01055b1:	83 ec 0c             	sub    $0xc,%esp
c01055b4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055b7:	e8 8a e2 ff ff       	call   c0103846 <pid2proc>
c01055bc:	83 c4 10             	add    $0x10,%esp
c01055bf:	89 45 80             	mov    %eax,-0x80(%ebp)
c01055c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01055c5:	8b 40 10             	mov    0x10(%eax),%eax
c01055c8:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01055ce:	83 ec 08             	sub    $0x8,%esp
c01055d1:	ff 75 88             	pushl  -0x78(%ebp)
c01055d4:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c01055da:	e8 b0 08 00 00       	call   c0105e8f <alloc_virtual_memory>
c01055df:	83 c4 10             	add    $0x10,%esp
c01055e2:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01055e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01055eb:	8b 40 2c             	mov    0x2c(%eax),%eax
c01055ee:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01055f4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01055fb:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0105601:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105604:	eb 1a                	jmp    c0105620 <do_exec+0x311>
c0105606:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010560a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010560d:	8b 10                	mov    (%eax),%edx
c010560f:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105615:	01 c2                	add    %eax,%edx
c0105617:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010561a:	89 10                	mov    %edx,(%eax)
c010561c:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0105620:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105623:	8b 00                	mov    (%eax),%eax
c0105625:	85 c0                	test   %eax,%eax
c0105627:	75 dd                	jne    c0105606 <do_exec+0x2f7>
c0105629:	83 ec 0c             	sub    $0xc,%esp
c010562c:	ff 75 84             	pushl  -0x7c(%ebp)
c010562f:	e8 5b 08 00 00       	call   c0105e8f <alloc_virtual_memory>
c0105634:	83 c4 10             	add    $0x10,%esp
c0105637:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010563d:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c0105643:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0105649:	83 ec 04             	sub    $0x4,%esp
c010564c:	ff 75 88             	pushl  -0x78(%ebp)
c010564f:	52                   	push   %edx
c0105650:	50                   	push   %eax
c0105651:	e8 a6 16 00 00       	call   c0106cfc <Memcpy>
c0105656:	83 c4 10             	add    $0x10,%esp
c0105659:	8b 45 08             	mov    0x8(%ebp),%eax
c010565c:	8b 40 28             	mov    0x28(%eax),%eax
c010565f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105665:	83 ec 08             	sub    $0x8,%esp
c0105668:	ff 75 d4             	pushl  -0x2c(%ebp)
c010566b:	ff 75 80             	pushl  -0x80(%ebp)
c010566e:	e8 ef 08 00 00       	call   c0105f62 <get_physical_address_proc>
c0105673:	83 c4 10             	add    $0x10,%esp
c0105676:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c010567c:	83 ec 08             	sub    $0x8,%esp
c010567f:	68 00 10 00 00       	push   $0x1000
c0105684:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c010568a:	e8 00 08 00 00       	call   c0105e8f <alloc_virtual_memory>
c010568f:	83 c4 10             	add    $0x10,%esp
c0105692:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105698:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010569e:	05 bc 0f 00 00       	add    $0xfbc,%eax
c01056a3:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01056a9:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056af:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01056b5:	89 50 20             	mov    %edx,0x20(%eax)
c01056b8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01056bb:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056c1:	89 50 28             	mov    %edx,0x28(%eax)
c01056c4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056c7:	8b 40 18             	mov    0x18(%eax),%eax
c01056ca:	89 c2                	mov    %eax,%edx
c01056cc:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056d2:	89 50 30             	mov    %edx,0x30(%eax)
c01056d5:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056db:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01056e1:	89 50 3c             	mov    %edx,0x3c(%eax)
c01056e4:	8b 45 80             	mov    -0x80(%ebp),%eax
c01056e7:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01056ee:	00 00 00 
c01056f1:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c01056f8:	00 00 00 
c01056fb:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0105702:	00 00 00 
c0105705:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c010570c:	00 00 00 
c010570f:	83 ec 04             	sub    $0x4,%esp
c0105712:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105715:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c010571b:	50                   	push   %eax
c010571c:	6a 01                	push   $0x1
c010571e:	e8 62 3e 00 00       	call   c0109585 <send_rec>
c0105723:	83 c4 10             	add    $0x10,%esp
c0105726:	c9                   	leave  
c0105727:	c3                   	ret    

c0105728 <do_fork>:
c0105728:	55                   	push   %ebp
c0105729:	89 e5                	mov    %esp,%ebp
c010572b:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0105731:	8b 45 08             	mov    0x8(%ebp),%eax
c0105734:	8b 00                	mov    (%eax),%eax
c0105736:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105739:	83 ec 0c             	sub    $0xc,%esp
c010573c:	ff 75 f4             	pushl  -0xc(%ebp)
c010573f:	e8 3c 47 00 00       	call   c0109e80 <fork_process>
c0105744:	83 c4 10             	add    $0x10,%esp
c0105747:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010574a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010574d:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105753:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105756:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105759:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010575f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105762:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105765:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c010576c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105773:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010577a:	83 ec 04             	sub    $0x4,%esp
c010577d:	ff 75 ec             	pushl  -0x14(%ebp)
c0105780:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105786:	50                   	push   %eax
c0105787:	6a 01                	push   $0x1
c0105789:	e8 f7 3d 00 00       	call   c0109585 <send_rec>
c010578e:	83 c4 10             	add    $0x10,%esp
c0105791:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105794:	c9                   	leave  
c0105795:	c3                   	ret    

c0105796 <do_exit>:
c0105796:	55                   	push   %ebp
c0105797:	89 e5                	mov    %esp,%ebp
c0105799:	83 ec 18             	sub    $0x18,%esp
c010579c:	8b 45 08             	mov    0x8(%ebp),%eax
c010579f:	8b 00                	mov    (%eax),%eax
c01057a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01057a4:	83 ec 0c             	sub    $0xc,%esp
c01057a7:	ff 75 f4             	pushl  -0xc(%ebp)
c01057aa:	e8 97 e0 ff ff       	call   c0103846 <pid2proc>
c01057af:	83 c4 10             	add    $0x10,%esp
c01057b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057b8:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01057be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01057c1:	83 ec 0c             	sub    $0xc,%esp
c01057c4:	ff 75 ec             	pushl  -0x14(%ebp)
c01057c7:	e8 7a e0 ff ff       	call   c0103846 <pid2proc>
c01057cc:	83 c4 10             	add    $0x10,%esp
c01057cf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01057d2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01057d6:	74 45                	je     c010581d <do_exit+0x87>
c01057d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01057db:	8b 40 54             	mov    0x54(%eax),%eax
c01057de:	89 c2                	mov    %eax,%edx
c01057e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057e3:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c01057e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01057ec:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01057f3:	3c 04                	cmp    $0x4,%al
c01057f5:	75 1a                	jne    c0105811 <do_exit+0x7b>
c01057f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01057fa:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105801:	83 ec 0c             	sub    $0xc,%esp
c0105804:	ff 75 f0             	pushl  -0x10(%ebp)
c0105807:	e8 33 01 00 00       	call   c010593f <cleanup>
c010580c:	83 c4 10             	add    $0x10,%esp
c010580f:	eb 0d                	jmp    c010581e <do_exit+0x88>
c0105811:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105814:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c010581b:	eb 01                	jmp    c010581e <do_exit+0x88>
c010581d:	90                   	nop
c010581e:	c9                   	leave  
c010581f:	c3                   	ret    

c0105820 <do_wait>:
c0105820:	55                   	push   %ebp
c0105821:	89 e5                	mov    %esp,%ebp
c0105823:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0105829:	8b 45 08             	mov    0x8(%ebp),%eax
c010582c:	8b 00                	mov    (%eax),%eax
c010582e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105831:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105838:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010583f:	83 ec 0c             	sub    $0xc,%esp
c0105842:	ff 75 ec             	pushl  -0x14(%ebp)
c0105845:	e8 fc df ff ff       	call   c0103846 <pid2proc>
c010584a:	83 c4 10             	add    $0x10,%esp
c010584d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105850:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105854:	75 19                	jne    c010586f <do_wait+0x4f>
c0105856:	6a 58                	push   $0x58
c0105858:	68 99 b5 10 c0       	push   $0xc010b599
c010585d:	68 99 b5 10 c0       	push   $0xc010b599
c0105862:	68 a7 b5 10 c0       	push   $0xc010b5a7
c0105867:	e8 a9 30 00 00       	call   c0108915 <assertion_failure>
c010586c:	83 c4 10             	add    $0x10,%esp
c010586f:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105874:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c010587a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010587d:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105880:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105885:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c010588b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010588e:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105891:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105896:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105899:	eb 5b                	jmp    c01058f6 <do_wait+0xd6>
c010589b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010589e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01058a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01058a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01058a9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01058af:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01058b2:	74 0b                	je     c01058bf <do_wait+0x9f>
c01058b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058b7:	8b 40 04             	mov    0x4(%eax),%eax
c01058ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058bd:	eb 37                	jmp    c01058f6 <do_wait+0xd6>
c01058bf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01058c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01058c6:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01058cd:	3c 03                	cmp    $0x3,%al
c01058cf:	74 0b                	je     c01058dc <do_wait+0xbc>
c01058d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058d4:	8b 40 04             	mov    0x4(%eax),%eax
c01058d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058da:	eb 1a                	jmp    c01058f6 <do_wait+0xd6>
c01058dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01058df:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01058e6:	83 ec 0c             	sub    $0xc,%esp
c01058e9:	ff 75 e8             	pushl  -0x18(%ebp)
c01058ec:	e8 4e 00 00 00       	call   c010593f <cleanup>
c01058f1:	83 c4 10             	add    $0x10,%esp
c01058f4:	eb 47                	jmp    c010593d <do_wait+0x11d>
c01058f6:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c01058fd:	75 9c                	jne    c010589b <do_wait+0x7b>
c01058ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105903:	74 0c                	je     c0105911 <do_wait+0xf1>
c0105905:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105908:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c010590f:	eb 2c                	jmp    c010593d <do_wait+0x11d>
c0105911:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105918:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010591f:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105926:	83 ec 04             	sub    $0x4,%esp
c0105929:	ff 75 ec             	pushl  -0x14(%ebp)
c010592c:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c0105932:	50                   	push   %eax
c0105933:	6a 01                	push   $0x1
c0105935:	e8 4b 3c 00 00       	call   c0109585 <send_rec>
c010593a:	83 c4 10             	add    $0x10,%esp
c010593d:	c9                   	leave  
c010593e:	c3                   	ret    

c010593f <cleanup>:
c010593f:	55                   	push   %ebp
c0105940:	89 e5                	mov    %esp,%ebp
c0105942:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105948:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c010594f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105956:	8b 45 08             	mov    0x8(%ebp),%eax
c0105959:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010595f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105962:	8b 45 08             	mov    0x8(%ebp),%eax
c0105965:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c010596b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010596e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105971:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105977:	83 ec 04             	sub    $0x4,%esp
c010597a:	50                   	push   %eax
c010597b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105981:	50                   	push   %eax
c0105982:	6a 01                	push   $0x1
c0105984:	e8 fc 3b 00 00       	call   c0109585 <send_rec>
c0105989:	83 c4 10             	add    $0x10,%esp
c010598c:	8b 45 08             	mov    0x8(%ebp),%eax
c010598f:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105996:	90                   	nop
c0105997:	c9                   	leave  
c0105998:	c3                   	ret    

c0105999 <init_bitmap>:
c0105999:	55                   	push   %ebp
c010599a:	89 e5                	mov    %esp,%ebp
c010599c:	83 ec 08             	sub    $0x8,%esp
c010599f:	8b 45 08             	mov    0x8(%ebp),%eax
c01059a2:	8b 50 04             	mov    0x4(%eax),%edx
c01059a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01059a8:	8b 00                	mov    (%eax),%eax
c01059aa:	83 ec 04             	sub    $0x4,%esp
c01059ad:	52                   	push   %edx
c01059ae:	6a 00                	push   $0x0
c01059b0:	50                   	push   %eax
c01059b1:	e8 19 68 00 00       	call   c010c1cf <Memset>
c01059b6:	83 c4 10             	add    $0x10,%esp
c01059b9:	90                   	nop
c01059ba:	c9                   	leave  
c01059bb:	c3                   	ret    

c01059bc <test_bit_val>:
c01059bc:	55                   	push   %ebp
c01059bd:	89 e5                	mov    %esp,%ebp
c01059bf:	53                   	push   %ebx
c01059c0:	83 ec 10             	sub    $0x10,%esp
c01059c3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059c6:	8d 50 07             	lea    0x7(%eax),%edx
c01059c9:	85 c0                	test   %eax,%eax
c01059cb:	0f 48 c2             	cmovs  %edx,%eax
c01059ce:	c1 f8 03             	sar    $0x3,%eax
c01059d1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01059d4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059d7:	99                   	cltd   
c01059d8:	c1 ea 1d             	shr    $0x1d,%edx
c01059db:	01 d0                	add    %edx,%eax
c01059dd:	83 e0 07             	and    $0x7,%eax
c01059e0:	29 d0                	sub    %edx,%eax
c01059e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01059e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01059e8:	8b 10                	mov    (%eax),%edx
c01059ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01059ed:	01 d0                	add    %edx,%eax
c01059ef:	0f b6 00             	movzbl (%eax),%eax
c01059f2:	88 45 f3             	mov    %al,-0xd(%ebp)
c01059f5:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c01059f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059fc:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105a01:	89 c1                	mov    %eax,%ecx
c0105a03:	d3 e3                	shl    %cl,%ebx
c0105a05:	89 d8                	mov    %ebx,%eax
c0105a07:	21 c2                	and    %eax,%edx
c0105a09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a0c:	89 c1                	mov    %eax,%ecx
c0105a0e:	d3 fa                	sar    %cl,%edx
c0105a10:	89 d0                	mov    %edx,%eax
c0105a12:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a15:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105a19:	0f 9f c0             	setg   %al
c0105a1c:	0f b6 c0             	movzbl %al,%eax
c0105a1f:	83 c4 10             	add    $0x10,%esp
c0105a22:	5b                   	pop    %ebx
c0105a23:	5d                   	pop    %ebp
c0105a24:	c3                   	ret    

c0105a25 <set_bit_val>:
c0105a25:	55                   	push   %ebp
c0105a26:	89 e5                	mov    %esp,%ebp
c0105a28:	83 ec 10             	sub    $0x10,%esp
c0105a2b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a2e:	8d 50 07             	lea    0x7(%eax),%edx
c0105a31:	85 c0                	test   %eax,%eax
c0105a33:	0f 48 c2             	cmovs  %edx,%eax
c0105a36:	c1 f8 03             	sar    $0x3,%eax
c0105a39:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a3f:	99                   	cltd   
c0105a40:	c1 ea 1d             	shr    $0x1d,%edx
c0105a43:	01 d0                	add    %edx,%eax
c0105a45:	83 e0 07             	and    $0x7,%eax
c0105a48:	29 d0                	sub    %edx,%eax
c0105a4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a50:	8b 10                	mov    (%eax),%edx
c0105a52:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a55:	01 d0                	add    %edx,%eax
c0105a57:	0f b6 00             	movzbl (%eax),%eax
c0105a5a:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105a5d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105a61:	7e 13                	jle    c0105a76 <set_bit_val+0x51>
c0105a63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a66:	ba 01 00 00 00       	mov    $0x1,%edx
c0105a6b:	89 c1                	mov    %eax,%ecx
c0105a6d:	d3 e2                	shl    %cl,%edx
c0105a6f:	89 d0                	mov    %edx,%eax
c0105a71:	08 45 ff             	or     %al,-0x1(%ebp)
c0105a74:	eb 13                	jmp    c0105a89 <set_bit_val+0x64>
c0105a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a79:	ba 01 00 00 00       	mov    $0x1,%edx
c0105a7e:	89 c1                	mov    %eax,%ecx
c0105a80:	d3 e2                	shl    %cl,%edx
c0105a82:	89 d0                	mov    %edx,%eax
c0105a84:	f7 d0                	not    %eax
c0105a86:	20 45 ff             	and    %al,-0x1(%ebp)
c0105a89:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a8c:	8b 10                	mov    (%eax),%edx
c0105a8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a91:	01 c2                	add    %eax,%edx
c0105a93:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105a97:	88 02                	mov    %al,(%edx)
c0105a99:	b8 01 00 00 00       	mov    $0x1,%eax
c0105a9e:	c9                   	leave  
c0105a9f:	c3                   	ret    

c0105aa0 <set_bits>:
c0105aa0:	55                   	push   %ebp
c0105aa1:	89 e5                	mov    %esp,%ebp
c0105aa3:	83 ec 10             	sub    $0x10,%esp
c0105aa6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105aad:	eb 1c                	jmp    c0105acb <set_bits+0x2b>
c0105aaf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ab2:	8d 50 01             	lea    0x1(%eax),%edx
c0105ab5:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105ab8:	ff 75 10             	pushl  0x10(%ebp)
c0105abb:	50                   	push   %eax
c0105abc:	ff 75 08             	pushl  0x8(%ebp)
c0105abf:	e8 61 ff ff ff       	call   c0105a25 <set_bit_val>
c0105ac4:	83 c4 0c             	add    $0xc,%esp
c0105ac7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105acb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105ace:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105ad1:	7c dc                	jl     c0105aaf <set_bits+0xf>
c0105ad3:	b8 01 00 00 00       	mov    $0x1,%eax
c0105ad8:	c9                   	leave  
c0105ad9:	c3                   	ret    

c0105ada <get_first_free_bit>:
c0105ada:	55                   	push   %ebp
c0105adb:	89 e5                	mov    %esp,%ebp
c0105add:	83 ec 10             	sub    $0x10,%esp
c0105ae0:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ae3:	8b 40 04             	mov    0x4(%eax),%eax
c0105ae6:	c1 e0 03             	shl    $0x3,%eax
c0105ae9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105aec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105aef:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105af2:	eb 1b                	jmp    c0105b0f <get_first_free_bit+0x35>
c0105af4:	ff 75 fc             	pushl  -0x4(%ebp)
c0105af7:	ff 75 08             	pushl  0x8(%ebp)
c0105afa:	e8 bd fe ff ff       	call   c01059bc <test_bit_val>
c0105aff:	83 c4 08             	add    $0x8,%esp
c0105b02:	85 c0                	test   %eax,%eax
c0105b04:	75 05                	jne    c0105b0b <get_first_free_bit+0x31>
c0105b06:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b09:	eb 11                	jmp    c0105b1c <get_first_free_bit+0x42>
c0105b0b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105b0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b12:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105b15:	7c dd                	jl     c0105af4 <get_first_free_bit+0x1a>
c0105b17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105b1c:	c9                   	leave  
c0105b1d:	c3                   	ret    

c0105b1e <get_bits>:
c0105b1e:	55                   	push   %ebp
c0105b1f:	89 e5                	mov    %esp,%ebp
c0105b21:	83 ec 20             	sub    $0x20,%esp
c0105b24:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105b2b:	ff 75 f0             	pushl  -0x10(%ebp)
c0105b2e:	ff 75 08             	pushl  0x8(%ebp)
c0105b31:	e8 a4 ff ff ff       	call   c0105ada <get_first_free_bit>
c0105b36:	83 c4 08             	add    $0x8,%esp
c0105b39:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b3f:	8b 40 04             	mov    0x4(%eax),%eax
c0105b42:	c1 e0 03             	shl    $0x3,%eax
c0105b45:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b48:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b4b:	83 e8 01             	sub    $0x1,%eax
c0105b4e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105b51:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105b55:	75 08                	jne    c0105b5f <get_bits+0x41>
c0105b57:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b5a:	e9 85 00 00 00       	jmp    c0105be4 <get_bits+0xc6>
c0105b5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b62:	83 c0 01             	add    $0x1,%eax
c0105b65:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b68:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b6e:	eb 58                	jmp    c0105bc8 <get_bits+0xaa>
c0105b70:	ff 75 f8             	pushl  -0x8(%ebp)
c0105b73:	ff 75 08             	pushl  0x8(%ebp)
c0105b76:	e8 41 fe ff ff       	call   c01059bc <test_bit_val>
c0105b7b:	83 c4 08             	add    $0x8,%esp
c0105b7e:	85 c0                	test   %eax,%eax
c0105b80:	75 0a                	jne    c0105b8c <get_bits+0x6e>
c0105b82:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105b86:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105b8a:	eb 2b                	jmp    c0105bb7 <get_bits+0x99>
c0105b8c:	6a 00                	push   $0x0
c0105b8e:	ff 75 08             	pushl  0x8(%ebp)
c0105b91:	e8 44 ff ff ff       	call   c0105ada <get_first_free_bit>
c0105b96:	83 c4 08             	add    $0x8,%esp
c0105b99:	83 c0 01             	add    $0x1,%eax
c0105b9c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ba2:	83 c0 01             	add    $0x1,%eax
c0105ba5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105ba8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105bab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105bae:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105bb1:	83 e8 01             	sub    $0x1,%eax
c0105bb4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bba:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105bbd:	7c 09                	jl     c0105bc8 <get_bits+0xaa>
c0105bbf:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105bc6:	eb 0d                	jmp    c0105bd5 <get_bits+0xb7>
c0105bc8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105bcb:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105bce:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105bd1:	85 c0                	test   %eax,%eax
c0105bd3:	7f 9b                	jg     c0105b70 <get_bits+0x52>
c0105bd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bd8:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105bdb:	83 c0 01             	add    $0x1,%eax
c0105bde:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105be1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105be4:	c9                   	leave  
c0105be5:	c3                   	ret    

c0105be6 <get_a_page>:
c0105be6:	55                   	push   %ebp
c0105be7:	89 e5                	mov    %esp,%ebp
c0105be9:	83 ec 28             	sub    $0x28,%esp
c0105bec:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105bf0:	75 22                	jne    c0105c14 <get_a_page+0x2e>
c0105bf2:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105bf7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105bfa:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105bff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c02:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105c07:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c0a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105c0f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c12:	eb 20                	jmp    c0105c34 <get_a_page+0x4e>
c0105c14:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105c19:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c1c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105c21:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c24:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105c29:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c2c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105c31:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c34:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105c37:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105c3a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c3d:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105c40:	6a 01                	push   $0x1
c0105c42:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c45:	50                   	push   %eax
c0105c46:	e8 d3 fe ff ff       	call   c0105b1e <get_bits>
c0105c4b:	83 c4 08             	add    $0x8,%esp
c0105c4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c51:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105c55:	75 1c                	jne    c0105c73 <get_a_page+0x8d>
c0105c57:	68 84 00 00 00       	push   $0x84
c0105c5c:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105c61:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105c66:	68 c4 b5 10 c0       	push   $0xc010b5c4
c0105c6b:	e8 a5 2c 00 00       	call   c0108915 <assertion_failure>
c0105c70:	83 c4 10             	add    $0x10,%esp
c0105c73:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c76:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105c79:	c1 e2 0c             	shl    $0xc,%edx
c0105c7c:	01 d0                	add    %edx,%eax
c0105c7e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105c81:	83 ec 04             	sub    $0x4,%esp
c0105c84:	6a 01                	push   $0x1
c0105c86:	ff 75 f4             	pushl  -0xc(%ebp)
c0105c89:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c8c:	50                   	push   %eax
c0105c8d:	e8 93 fd ff ff       	call   c0105a25 <set_bit_val>
c0105c92:	83 c4 10             	add    $0x10,%esp
c0105c95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c98:	c9                   	leave  
c0105c99:	c3                   	ret    

c0105c9a <get_virtual_address_start_with_addr>:
c0105c9a:	55                   	push   %ebp
c0105c9b:	89 e5                	mov    %esp,%ebp
c0105c9d:	83 ec 38             	sub    $0x38,%esp
c0105ca0:	e8 49 a7 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105ca5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ca8:	83 ec 0c             	sub    $0xc,%esp
c0105cab:	ff 75 10             	pushl  0x10(%ebp)
c0105cae:	e8 93 db ff ff       	call   c0103846 <pid2proc>
c0105cb3:	83 c4 10             	add    $0x10,%esp
c0105cb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105cb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cbc:	8b 40 0c             	mov    0xc(%eax),%eax
c0105cbf:	83 ec 04             	sub    $0x4,%esp
c0105cc2:	6a 0c                	push   $0xc
c0105cc4:	50                   	push   %eax
c0105cc5:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105cc8:	50                   	push   %eax
c0105cc9:	e8 2e 10 00 00       	call   c0106cfc <Memcpy>
c0105cce:	83 c4 10             	add    $0x10,%esp
c0105cd1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105cd4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105cd7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105cda:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105cdd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105ce0:	8b 55 08             	mov    0x8(%ebp),%edx
c0105ce3:	29 c2                	sub    %eax,%edx
c0105ce5:	89 d0                	mov    %edx,%eax
c0105ce7:	c1 e8 0c             	shr    $0xc,%eax
c0105cea:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ced:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105cf1:	79 1c                	jns    c0105d0f <get_virtual_address_start_with_addr+0x75>
c0105cf3:	68 97 00 00 00       	push   $0x97
c0105cf8:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105cfd:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105d02:	68 d0 b5 10 c0       	push   $0xc010b5d0
c0105d07:	e8 09 2c 00 00       	call   c0108915 <assertion_failure>
c0105d0c:	83 c4 10             	add    $0x10,%esp
c0105d0f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d12:	50                   	push   %eax
c0105d13:	6a 01                	push   $0x1
c0105d15:	ff 75 ec             	pushl  -0x14(%ebp)
c0105d18:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105d1b:	50                   	push   %eax
c0105d1c:	e8 7f fd ff ff       	call   c0105aa0 <set_bits>
c0105d21:	83 c4 10             	add    $0x10,%esp
c0105d24:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d27:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105d2c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d2f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d32:	c9                   	leave  
c0105d33:	c3                   	ret    

c0105d34 <get_virtual_address>:
c0105d34:	55                   	push   %ebp
c0105d35:	89 e5                	mov    %esp,%ebp
c0105d37:	83 ec 28             	sub    $0x28,%esp
c0105d3a:	e8 af a6 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105d3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d42:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105d46:	75 1a                	jne    c0105d62 <get_virtual_address+0x2e>
c0105d48:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105d4d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d50:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105d55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d58:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105d5d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d60:	eb 18                	jmp    c0105d7a <get_virtual_address+0x46>
c0105d62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d65:	8b 40 0c             	mov    0xc(%eax),%eax
c0105d68:	83 ec 04             	sub    $0x4,%esp
c0105d6b:	6a 0c                	push   $0xc
c0105d6d:	50                   	push   %eax
c0105d6e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105d71:	50                   	push   %eax
c0105d72:	e8 85 0f 00 00       	call   c0106cfc <Memcpy>
c0105d77:	83 c4 10             	add    $0x10,%esp
c0105d7a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105d7d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105d80:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105d83:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105d86:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d89:	83 ec 08             	sub    $0x8,%esp
c0105d8c:	50                   	push   %eax
c0105d8d:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105d90:	50                   	push   %eax
c0105d91:	e8 88 fd ff ff       	call   c0105b1e <get_bits>
c0105d96:	83 c4 10             	add    $0x10,%esp
c0105d99:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d9f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105da2:	c1 e2 0c             	shl    $0xc,%edx
c0105da5:	01 d0                	add    %edx,%eax
c0105da7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105daa:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dad:	50                   	push   %eax
c0105dae:	6a 01                	push   $0x1
c0105db0:	ff 75 f0             	pushl  -0x10(%ebp)
c0105db3:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105db6:	50                   	push   %eax
c0105db7:	e8 e4 fc ff ff       	call   c0105aa0 <set_bits>
c0105dbc:	83 c4 10             	add    $0x10,%esp
c0105dbf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105dc2:	c9                   	leave  
c0105dc3:	c3                   	ret    

c0105dc4 <ptr_pde>:
c0105dc4:	55                   	push   %ebp
c0105dc5:	89 e5                	mov    %esp,%ebp
c0105dc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dca:	c1 e8 16             	shr    $0x16,%eax
c0105dcd:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105dd2:	c1 e0 02             	shl    $0x2,%eax
c0105dd5:	5d                   	pop    %ebp
c0105dd6:	c3                   	ret    

c0105dd7 <ptr_pte>:
c0105dd7:	55                   	push   %ebp
c0105dd8:	89 e5                	mov    %esp,%ebp
c0105dda:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ddd:	c1 e8 0a             	shr    $0xa,%eax
c0105de0:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105de5:	89 c2                	mov    %eax,%edx
c0105de7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dea:	c1 e8 0c             	shr    $0xc,%eax
c0105ded:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105df2:	c1 e0 02             	shl    $0x2,%eax
c0105df5:	01 d0                	add    %edx,%eax
c0105df7:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105dfc:	5d                   	pop    %ebp
c0105dfd:	c3                   	ret    

c0105dfe <add_map_entry>:
c0105dfe:	55                   	push   %ebp
c0105dff:	89 e5                	mov    %esp,%ebp
c0105e01:	83 ec 18             	sub    $0x18,%esp
c0105e04:	ff 75 08             	pushl  0x8(%ebp)
c0105e07:	e8 b8 ff ff ff       	call   c0105dc4 <ptr_pde>
c0105e0c:	83 c4 04             	add    $0x4,%esp
c0105e0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e12:	ff 75 08             	pushl  0x8(%ebp)
c0105e15:	e8 bd ff ff ff       	call   c0105dd7 <ptr_pte>
c0105e1a:	83 c4 04             	add    $0x4,%esp
c0105e1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e23:	8b 00                	mov    (%eax),%eax
c0105e25:	83 e0 01             	and    $0x1,%eax
c0105e28:	85 c0                	test   %eax,%eax
c0105e2a:	74 1b                	je     c0105e47 <add_map_entry+0x49>
c0105e2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e2f:	8b 00                	mov    (%eax),%eax
c0105e31:	83 e0 01             	and    $0x1,%eax
c0105e34:	85 c0                	test   %eax,%eax
c0105e36:	75 54                	jne    c0105e8c <add_map_entry+0x8e>
c0105e38:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e3b:	83 c8 07             	or     $0x7,%eax
c0105e3e:	89 c2                	mov    %eax,%edx
c0105e40:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e43:	89 10                	mov    %edx,(%eax)
c0105e45:	eb 45                	jmp    c0105e8c <add_map_entry+0x8e>
c0105e47:	83 ec 0c             	sub    $0xc,%esp
c0105e4a:	6a 00                	push   $0x0
c0105e4c:	e8 95 fd ff ff       	call   c0105be6 <get_a_page>
c0105e51:	83 c4 10             	add    $0x10,%esp
c0105e54:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e57:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e5a:	83 c8 07             	or     $0x7,%eax
c0105e5d:	89 c2                	mov    %eax,%edx
c0105e5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e62:	89 10                	mov    %edx,(%eax)
c0105e64:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e67:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e6c:	83 ec 04             	sub    $0x4,%esp
c0105e6f:	68 00 10 00 00       	push   $0x1000
c0105e74:	6a 00                	push   $0x0
c0105e76:	50                   	push   %eax
c0105e77:	e8 53 63 00 00       	call   c010c1cf <Memset>
c0105e7c:	83 c4 10             	add    $0x10,%esp
c0105e7f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e82:	83 c8 07             	or     $0x7,%eax
c0105e85:	89 c2                	mov    %eax,%edx
c0105e87:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e8a:	89 10                	mov    %edx,(%eax)
c0105e8c:	90                   	nop
c0105e8d:	c9                   	leave  
c0105e8e:	c3                   	ret    

c0105e8f <alloc_virtual_memory>:
c0105e8f:	55                   	push   %ebp
c0105e90:	89 e5                	mov    %esp,%ebp
c0105e92:	83 ec 28             	sub    $0x28,%esp
c0105e95:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e98:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ea0:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ea3:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105ea6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ea9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105eac:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105eaf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105eb2:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105eb7:	c1 e8 0c             	shr    $0xc,%eax
c0105eba:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ebd:	e8 2c a5 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105ec2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105ec5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105ec8:	8b 50 08             	mov    0x8(%eax),%edx
c0105ecb:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105ed0:	39 c2                	cmp    %eax,%edx
c0105ed2:	75 09                	jne    c0105edd <alloc_virtual_memory+0x4e>
c0105ed4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105edb:	eb 07                	jmp    c0105ee4 <alloc_virtual_memory+0x55>
c0105edd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105ee4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105eeb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105ef2:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105ef9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105f00:	eb 47                	jmp    c0105f49 <alloc_virtual_memory+0xba>
c0105f02:	83 ec 08             	sub    $0x8,%esp
c0105f05:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f08:	6a 01                	push   $0x1
c0105f0a:	e8 25 fe ff ff       	call   c0105d34 <get_virtual_address>
c0105f0f:	83 c4 10             	add    $0x10,%esp
c0105f12:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f15:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105f19:	74 13                	je     c0105f2e <alloc_virtual_memory+0x9f>
c0105f1b:	83 ec 0c             	sub    $0xc,%esp
c0105f1e:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f21:	e8 c0 fc ff ff       	call   c0105be6 <get_a_page>
c0105f26:	83 c4 10             	add    $0x10,%esp
c0105f29:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f2c:	eb 06                	jmp    c0105f34 <alloc_virtual_memory+0xa5>
c0105f2e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105f31:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f34:	83 ec 08             	sub    $0x8,%esp
c0105f37:	ff 75 f4             	pushl  -0xc(%ebp)
c0105f3a:	ff 75 d8             	pushl  -0x28(%ebp)
c0105f3d:	e8 bc fe ff ff       	call   c0105dfe <add_map_entry>
c0105f42:	83 c4 10             	add    $0x10,%esp
c0105f45:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105f49:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105f4c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105f4f:	72 b1                	jb     c0105f02 <alloc_virtual_memory+0x73>
c0105f51:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f54:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f59:	89 c2                	mov    %eax,%edx
c0105f5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f5e:	01 d0                	add    %edx,%eax
c0105f60:	c9                   	leave  
c0105f61:	c3                   	ret    

c0105f62 <get_physical_address_proc>:
c0105f62:	55                   	push   %ebp
c0105f63:	89 e5                	mov    %esp,%ebp
c0105f65:	83 ec 18             	sub    $0x18,%esp
c0105f68:	e8 a5 a3 ff ff       	call   c0100312 <disable_int>
c0105f6d:	e8 7c a4 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105f72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f75:	83 ec 0c             	sub    $0xc,%esp
c0105f78:	ff 75 0c             	pushl  0xc(%ebp)
c0105f7b:	e8 c6 d8 ff ff       	call   c0103846 <pid2proc>
c0105f80:	83 c4 10             	add    $0x10,%esp
c0105f83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105f86:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f89:	8b 40 08             	mov    0x8(%eax),%eax
c0105f8c:	83 ec 0c             	sub    $0xc,%esp
c0105f8f:	50                   	push   %eax
c0105f90:	e8 3d a4 ff ff       	call   c01003d2 <update_cr3>
c0105f95:	83 c4 10             	add    $0x10,%esp
c0105f98:	83 ec 0c             	sub    $0xc,%esp
c0105f9b:	ff 75 08             	pushl  0x8(%ebp)
c0105f9e:	e8 34 fe ff ff       	call   c0105dd7 <ptr_pte>
c0105fa3:	83 c4 10             	add    $0x10,%esp
c0105fa6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fa9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105fac:	8b 00                	mov    (%eax),%eax
c0105fae:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105fb3:	89 c2                	mov    %eax,%edx
c0105fb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fb8:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105fbd:	09 d0                	or     %edx,%eax
c0105fbf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105fc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105fc5:	8b 40 08             	mov    0x8(%eax),%eax
c0105fc8:	83 ec 0c             	sub    $0xc,%esp
c0105fcb:	50                   	push   %eax
c0105fcc:	e8 01 a4 ff ff       	call   c01003d2 <update_cr3>
c0105fd1:	83 c4 10             	add    $0x10,%esp
c0105fd4:	e8 3b a3 ff ff       	call   c0100314 <enable_int>
c0105fd9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105fdc:	c9                   	leave  
c0105fdd:	c3                   	ret    

c0105fde <get_physical_address>:
c0105fde:	55                   	push   %ebp
c0105fdf:	89 e5                	mov    %esp,%ebp
c0105fe1:	83 ec 10             	sub    $0x10,%esp
c0105fe4:	ff 75 08             	pushl  0x8(%ebp)
c0105fe7:	e8 eb fd ff ff       	call   c0105dd7 <ptr_pte>
c0105fec:	83 c4 04             	add    $0x4,%esp
c0105fef:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105ff2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105ff5:	8b 00                	mov    (%eax),%eax
c0105ff7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ffc:	89 c2                	mov    %eax,%edx
c0105ffe:	8b 45 08             	mov    0x8(%ebp),%eax
c0106001:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106006:	09 d0                	or     %edx,%eax
c0106008:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010600b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010600e:	c9                   	leave  
c010600f:	c3                   	ret    

c0106010 <alloc_physical_memory_of_proc>:
c0106010:	55                   	push   %ebp
c0106011:	89 e5                	mov    %esp,%ebp
c0106013:	83 ec 48             	sub    $0x48,%esp
c0106016:	e8 f7 a2 ff ff       	call   c0100312 <disable_int>
c010601b:	8b 45 08             	mov    0x8(%ebp),%eax
c010601e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106023:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106026:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010602d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106030:	83 ec 0c             	sub    $0xc,%esp
c0106033:	50                   	push   %eax
c0106034:	e8 0d d8 ff ff       	call   c0103846 <pid2proc>
c0106039:	83 c4 10             	add    $0x10,%esp
c010603c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010603f:	e8 aa a3 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106044:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106047:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010604a:	8b 40 0c             	mov    0xc(%eax),%eax
c010604d:	83 ec 04             	sub    $0x4,%esp
c0106050:	6a 0c                	push   $0xc
c0106052:	50                   	push   %eax
c0106053:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106056:	50                   	push   %eax
c0106057:	e8 a0 0c 00 00       	call   c0106cfc <Memcpy>
c010605c:	83 c4 10             	add    $0x10,%esp
c010605f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106062:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0106065:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106068:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010606b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010606e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106071:	29 c2                	sub    %eax,%edx
c0106073:	89 d0                	mov    %edx,%eax
c0106075:	c1 e8 0c             	shr    $0xc,%eax
c0106078:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010607b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010607e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106081:	c1 e2 0c             	shl    $0xc,%edx
c0106084:	01 d0                	add    %edx,%eax
c0106086:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106089:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010608c:	6a 01                	push   $0x1
c010608e:	6a 01                	push   $0x1
c0106090:	50                   	push   %eax
c0106091:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0106094:	50                   	push   %eax
c0106095:	e8 06 fa ff ff       	call   c0105aa0 <set_bits>
c010609a:	83 c4 10             	add    $0x10,%esp
c010609d:	83 ec 0c             	sub    $0xc,%esp
c01060a0:	ff 75 f0             	pushl  -0x10(%ebp)
c01060a3:	e8 3e fb ff ff       	call   c0105be6 <get_a_page>
c01060a8:	83 c4 10             	add    $0x10,%esp
c01060ab:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01060ae:	8b 45 08             	mov    0x8(%ebp),%eax
c01060b1:	25 ff 0f 00 00       	and    $0xfff,%eax
c01060b6:	89 c2                	mov    %eax,%edx
c01060b8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01060bb:	01 d0                	add    %edx,%eax
c01060bd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01060c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060c3:	8b 40 08             	mov    0x8(%eax),%eax
c01060c6:	83 ec 0c             	sub    $0xc,%esp
c01060c9:	50                   	push   %eax
c01060ca:	e8 03 a3 ff ff       	call   c01003d2 <update_cr3>
c01060cf:	83 c4 10             	add    $0x10,%esp
c01060d2:	83 ec 08             	sub    $0x8,%esp
c01060d5:	ff 75 dc             	pushl  -0x24(%ebp)
c01060d8:	ff 75 f4             	pushl  -0xc(%ebp)
c01060db:	e8 1e fd ff ff       	call   c0105dfe <add_map_entry>
c01060e0:	83 c4 10             	add    $0x10,%esp
c01060e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01060e6:	8b 40 08             	mov    0x8(%eax),%eax
c01060e9:	83 ec 0c             	sub    $0xc,%esp
c01060ec:	50                   	push   %eax
c01060ed:	e8 e0 a2 ff ff       	call   c01003d2 <update_cr3>
c01060f2:	83 c4 10             	add    $0x10,%esp
c01060f5:	e8 1a a2 ff ff       	call   c0100314 <enable_int>
c01060fa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01060fd:	c9                   	leave  
c01060fe:	c3                   	ret    

c01060ff <alloc_physical_memory>:
c01060ff:	55                   	push   %ebp
c0106100:	89 e5                	mov    %esp,%ebp
c0106102:	83 ec 38             	sub    $0x38,%esp
c0106105:	8b 45 08             	mov    0x8(%ebp),%eax
c0106108:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010610d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106110:	e8 d9 a2 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106115:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106118:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010611c:	75 1a                	jne    c0106138 <alloc_physical_memory+0x39>
c010611e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106123:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106126:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010612b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010612e:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106133:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106136:	eb 18                	jmp    c0106150 <alloc_physical_memory+0x51>
c0106138:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010613b:	8b 40 0c             	mov    0xc(%eax),%eax
c010613e:	83 ec 04             	sub    $0x4,%esp
c0106141:	6a 0c                	push   $0xc
c0106143:	50                   	push   %eax
c0106144:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0106147:	50                   	push   %eax
c0106148:	e8 af 0b 00 00       	call   c0106cfc <Memcpy>
c010614d:	83 c4 10             	add    $0x10,%esp
c0106150:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106153:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106156:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106159:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010615c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010615f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106162:	29 c2                	sub    %eax,%edx
c0106164:	89 d0                	mov    %edx,%eax
c0106166:	c1 e8 0c             	shr    $0xc,%eax
c0106169:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010616c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010616f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106172:	c1 e2 0c             	shl    $0xc,%edx
c0106175:	01 d0                	add    %edx,%eax
c0106177:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010617a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010617d:	6a 01                	push   $0x1
c010617f:	6a 01                	push   $0x1
c0106181:	50                   	push   %eax
c0106182:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106185:	50                   	push   %eax
c0106186:	e8 15 f9 ff ff       	call   c0105aa0 <set_bits>
c010618b:	83 c4 10             	add    $0x10,%esp
c010618e:	83 ec 0c             	sub    $0xc,%esp
c0106191:	ff 75 0c             	pushl  0xc(%ebp)
c0106194:	e8 4d fa ff ff       	call   c0105be6 <get_a_page>
c0106199:	83 c4 10             	add    $0x10,%esp
c010619c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010619f:	8b 45 08             	mov    0x8(%ebp),%eax
c01061a2:	25 ff 0f 00 00       	and    $0xfff,%eax
c01061a7:	89 c2                	mov    %eax,%edx
c01061a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01061ac:	01 d0                	add    %edx,%eax
c01061ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01061b1:	83 ec 08             	sub    $0x8,%esp
c01061b4:	ff 75 e4             	pushl  -0x1c(%ebp)
c01061b7:	ff 75 f4             	pushl  -0xc(%ebp)
c01061ba:	e8 3f fc ff ff       	call   c0105dfe <add_map_entry>
c01061bf:	83 c4 10             	add    $0x10,%esp
c01061c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01061c5:	c9                   	leave  
c01061c6:	c3                   	ret    

c01061c7 <alloc_memory>:
c01061c7:	55                   	push   %ebp
c01061c8:	89 e5                	mov    %esp,%ebp
c01061ca:	83 ec 18             	sub    $0x18,%esp
c01061cd:	83 ec 08             	sub    $0x8,%esp
c01061d0:	ff 75 0c             	pushl  0xc(%ebp)
c01061d3:	ff 75 08             	pushl  0x8(%ebp)
c01061d6:	e8 59 fb ff ff       	call   c0105d34 <get_virtual_address>
c01061db:	83 c4 10             	add    $0x10,%esp
c01061de:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01061e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01061e4:	2d 00 10 00 00       	sub    $0x1000,%eax
c01061e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061ec:	eb 29                	jmp    c0106217 <alloc_memory+0x50>
c01061ee:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01061f5:	83 ec 0c             	sub    $0xc,%esp
c01061f8:	ff 75 0c             	pushl  0xc(%ebp)
c01061fb:	e8 e6 f9 ff ff       	call   c0105be6 <get_a_page>
c0106200:	83 c4 10             	add    $0x10,%esp
c0106203:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106206:	83 ec 08             	sub    $0x8,%esp
c0106209:	ff 75 ec             	pushl  -0x14(%ebp)
c010620c:	ff 75 f4             	pushl  -0xc(%ebp)
c010620f:	e8 ea fb ff ff       	call   c0105dfe <add_map_entry>
c0106214:	83 c4 10             	add    $0x10,%esp
c0106217:	8b 45 08             	mov    0x8(%ebp),%eax
c010621a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010621d:	89 55 08             	mov    %edx,0x8(%ebp)
c0106220:	85 c0                	test   %eax,%eax
c0106222:	75 ca                	jne    c01061ee <alloc_memory+0x27>
c0106224:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106227:	c9                   	leave  
c0106228:	c3                   	ret    

c0106229 <get_a_virtual_page>:
c0106229:	55                   	push   %ebp
c010622a:	89 e5                	mov    %esp,%ebp
c010622c:	83 ec 18             	sub    $0x18,%esp
c010622f:	83 ec 0c             	sub    $0xc,%esp
c0106232:	ff 75 08             	pushl  0x8(%ebp)
c0106235:	e8 ac f9 ff ff       	call   c0105be6 <get_a_page>
c010623a:	83 c4 10             	add    $0x10,%esp
c010623d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106240:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106243:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106248:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010624b:	83 ec 08             	sub    $0x8,%esp
c010624e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106251:	ff 75 f0             	pushl  -0x10(%ebp)
c0106254:	e8 a5 fb ff ff       	call   c0105dfe <add_map_entry>
c0106259:	83 c4 10             	add    $0x10,%esp
c010625c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010625f:	c9                   	leave  
c0106260:	c3                   	ret    

c0106261 <block2arena>:
c0106261:	55                   	push   %ebp
c0106262:	89 e5                	mov    %esp,%ebp
c0106264:	83 ec 10             	sub    $0x10,%esp
c0106267:	8b 45 08             	mov    0x8(%ebp),%eax
c010626a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010626f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106272:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106275:	c9                   	leave  
c0106276:	c3                   	ret    

c0106277 <sys_malloc2>:
c0106277:	55                   	push   %ebp
c0106278:	89 e5                	mov    %esp,%ebp
c010627a:	83 ec 68             	sub    $0x68,%esp
c010627d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106284:	e8 65 a1 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106289:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010628c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010628f:	8b 50 08             	mov    0x8(%eax),%edx
c0106292:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106297:	39 c2                	cmp    %eax,%edx
c0106299:	75 10                	jne    c01062ab <sys_malloc2+0x34>
c010629b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01062a2:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c01062a9:	eb 10                	jmp    c01062bb <sys_malloc2+0x44>
c01062ab:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01062b2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062b5:	83 c0 10             	add    $0x10,%eax
c01062b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01062bb:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c01062c2:	76 52                	jbe    c0106316 <sys_malloc2+0x9f>
c01062c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01062c7:	05 0b 10 00 00       	add    $0x100b,%eax
c01062cc:	c1 e8 0c             	shr    $0xc,%eax
c01062cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01062d2:	83 ec 08             	sub    $0x8,%esp
c01062d5:	ff 75 f0             	pushl  -0x10(%ebp)
c01062d8:	ff 75 d8             	pushl  -0x28(%ebp)
c01062db:	e8 e7 fe ff ff       	call   c01061c7 <alloc_memory>
c01062e0:	83 c4 10             	add    $0x10,%esp
c01062e3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01062e6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01062e9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01062ec:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01062ef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01062f5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01062f8:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01062ff:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106302:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106306:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106309:	05 90 00 00 00       	add    $0x90,%eax
c010630e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106311:	e9 f0 01 00 00       	jmp    c0106506 <sys_malloc2+0x28f>
c0106316:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010631d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106324:	eb 26                	jmp    c010634c <sys_malloc2+0xd5>
c0106326:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106329:	89 d0                	mov    %edx,%eax
c010632b:	01 c0                	add    %eax,%eax
c010632d:	01 d0                	add    %edx,%eax
c010632f:	c1 e0 03             	shl    $0x3,%eax
c0106332:	89 c2                	mov    %eax,%edx
c0106334:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106337:	01 d0                	add    %edx,%eax
c0106339:	8b 00                	mov    (%eax),%eax
c010633b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010633e:	77 08                	ja     c0106348 <sys_malloc2+0xd1>
c0106340:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106343:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106346:	eb 0a                	jmp    c0106352 <sys_malloc2+0xdb>
c0106348:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010634c:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0106350:	7e d4                	jle    c0106326 <sys_malloc2+0xaf>
c0106352:	83 ec 08             	sub    $0x8,%esp
c0106355:	ff 75 f0             	pushl  -0x10(%ebp)
c0106358:	6a 01                	push   $0x1
c010635a:	e8 68 fe ff ff       	call   c01061c7 <alloc_memory>
c010635f:	83 c4 10             	add    $0x10,%esp
c0106362:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106365:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106368:	89 d0                	mov    %edx,%eax
c010636a:	01 c0                	add    %eax,%eax
c010636c:	01 d0                	add    %edx,%eax
c010636e:	c1 e0 03             	shl    $0x3,%eax
c0106371:	89 c2                	mov    %eax,%edx
c0106373:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106376:	01 d0                	add    %edx,%eax
c0106378:	83 ec 04             	sub    $0x4,%esp
c010637b:	6a 18                	push   $0x18
c010637d:	50                   	push   %eax
c010637e:	ff 75 cc             	pushl  -0x34(%ebp)
c0106381:	e8 76 09 00 00       	call   c0106cfc <Memcpy>
c0106386:	83 c4 10             	add    $0x10,%esp
c0106389:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0106390:	e8 03 09 00 00       	call   c0106c98 <intr_disable>
c0106395:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106398:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010639b:	89 d0                	mov    %edx,%eax
c010639d:	01 c0                	add    %eax,%eax
c010639f:	01 d0                	add    %edx,%eax
c01063a1:	c1 e0 03             	shl    $0x3,%eax
c01063a4:	89 c2                	mov    %eax,%edx
c01063a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063a9:	01 d0                	add    %edx,%eax
c01063ab:	83 c0 08             	add    $0x8,%eax
c01063ae:	83 ec 0c             	sub    $0xc,%esp
c01063b1:	50                   	push   %eax
c01063b2:	e8 1c 3d 00 00       	call   c010a0d3 <isListEmpty>
c01063b7:	83 c4 10             	add    $0x10,%esp
c01063ba:	3c 01                	cmp    $0x1,%al
c01063bc:	0f 85 c1 00 00 00    	jne    c0106483 <sys_malloc2+0x20c>
c01063c2:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c01063c9:	83 ec 08             	sub    $0x8,%esp
c01063cc:	ff 75 f0             	pushl  -0x10(%ebp)
c01063cf:	6a 01                	push   $0x1
c01063d1:	e8 f1 fd ff ff       	call   c01061c7 <alloc_memory>
c01063d6:	83 c4 10             	add    $0x10,%esp
c01063d9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01063dc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01063df:	83 ec 0c             	sub    $0xc,%esp
c01063e2:	50                   	push   %eax
c01063e3:	e8 79 fe ff ff       	call   c0106261 <block2arena>
c01063e8:	83 c4 10             	add    $0x10,%esp
c01063eb:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01063ee:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01063f1:	89 d0                	mov    %edx,%eax
c01063f3:	01 c0                	add    %eax,%eax
c01063f5:	01 d0                	add    %edx,%eax
c01063f7:	c1 e0 03             	shl    $0x3,%eax
c01063fa:	89 c2                	mov    %eax,%edx
c01063fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063ff:	01 d0                	add    %edx,%eax
c0106401:	8b 50 04             	mov    0x4(%eax),%edx
c0106404:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106407:	89 50 04             	mov    %edx,0x4(%eax)
c010640a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010640d:	8b 00                	mov    (%eax),%eax
c010640f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106412:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106419:	b8 00 10 00 00       	mov    $0x1000,%eax
c010641e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0106421:	ba 00 00 00 00       	mov    $0x0,%edx
c0106426:	f7 75 b8             	divl   -0x48(%ebp)
c0106429:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010642c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010642f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0106432:	01 d0                	add    %edx,%eax
c0106434:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106437:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010643e:	eb 3b                	jmp    c010647b <sys_malloc2+0x204>
c0106440:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106443:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0106447:	89 c2                	mov    %eax,%edx
c0106449:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010644c:	01 d0                	add    %edx,%eax
c010644e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106451:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106454:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106457:	89 d0                	mov    %edx,%eax
c0106459:	01 c0                	add    %eax,%eax
c010645b:	01 d0                	add    %edx,%eax
c010645d:	c1 e0 03             	shl    $0x3,%eax
c0106460:	89 c2                	mov    %eax,%edx
c0106462:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106465:	01 d0                	add    %edx,%eax
c0106467:	83 c0 08             	add    $0x8,%eax
c010646a:	83 ec 08             	sub    $0x8,%esp
c010646d:	51                   	push   %ecx
c010646e:	50                   	push   %eax
c010646f:	e8 5c 3d 00 00       	call   c010a1d0 <appendToDoubleLinkList>
c0106474:	83 c4 10             	add    $0x10,%esp
c0106477:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010647b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010647e:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0106481:	77 bd                	ja     c0106440 <sys_malloc2+0x1c9>
c0106483:	83 ec 0c             	sub    $0xc,%esp
c0106486:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106489:	e8 33 08 00 00       	call   c0106cc1 <intr_set_status>
c010648e:	83 c4 10             	add    $0x10,%esp
c0106491:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106494:	89 d0                	mov    %edx,%eax
c0106496:	01 c0                	add    %eax,%eax
c0106498:	01 d0                	add    %edx,%eax
c010649a:	c1 e0 03             	shl    $0x3,%eax
c010649d:	89 c2                	mov    %eax,%edx
c010649f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01064a2:	01 d0                	add    %edx,%eax
c01064a4:	83 c0 08             	add    $0x8,%eax
c01064a7:	83 ec 0c             	sub    $0xc,%esp
c01064aa:	50                   	push   %eax
c01064ab:	e8 8a 3e 00 00       	call   c010a33a <popFromDoubleLinkList>
c01064b0:	83 c4 10             	add    $0x10,%esp
c01064b3:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01064b6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01064b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01064bc:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c01064c0:	75 1c                	jne    c01064de <sys_malloc2+0x267>
c01064c2:	68 ef 01 00 00       	push   $0x1ef
c01064c7:	68 ba b5 10 c0       	push   $0xc010b5ba
c01064cc:	68 ba b5 10 c0       	push   $0xc010b5ba
c01064d1:	68 db b5 10 c0       	push   $0xc010b5db
c01064d6:	e8 3a 24 00 00       	call   c0108915 <assertion_failure>
c01064db:	83 c4 10             	add    $0x10,%esp
c01064de:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01064e1:	83 ec 0c             	sub    $0xc,%esp
c01064e4:	50                   	push   %eax
c01064e5:	e8 77 fd ff ff       	call   c0106261 <block2arena>
c01064ea:	83 c4 10             	add    $0x10,%esp
c01064ed:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01064f0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01064f3:	8b 40 04             	mov    0x4(%eax),%eax
c01064f6:	8d 50 ff             	lea    -0x1(%eax),%edx
c01064f9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01064fc:	89 50 04             	mov    %edx,0x4(%eax)
c01064ff:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106506:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010650a:	75 1c                	jne    c0106528 <sys_malloc2+0x2b1>
c010650c:	68 f6 01 00 00       	push   $0x1f6
c0106511:	68 ba b5 10 c0       	push   $0xc010b5ba
c0106516:	68 ba b5 10 c0       	push   $0xc010b5ba
c010651b:	68 ed b5 10 c0       	push   $0xc010b5ed
c0106520:	e8 f0 23 00 00       	call   c0108915 <assertion_failure>
c0106525:	83 c4 10             	add    $0x10,%esp
c0106528:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010652b:	c9                   	leave  
c010652c:	c3                   	ret    

c010652d <remove_map_entry>:
c010652d:	55                   	push   %ebp
c010652e:	89 e5                	mov    %esp,%ebp
c0106530:	83 ec 10             	sub    $0x10,%esp
c0106533:	ff 75 08             	pushl  0x8(%ebp)
c0106536:	e8 9c f8 ff ff       	call   c0105dd7 <ptr_pte>
c010653b:	83 c4 04             	add    $0x4,%esp
c010653e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106541:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106544:	8b 10                	mov    (%eax),%edx
c0106546:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106549:	89 10                	mov    %edx,(%eax)
c010654b:	90                   	nop
c010654c:	c9                   	leave  
c010654d:	c3                   	ret    

c010654e <free_a_page>:
c010654e:	55                   	push   %ebp
c010654f:	89 e5                	mov    %esp,%ebp
c0106551:	83 ec 20             	sub    $0x20,%esp
c0106554:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106558:	75 21                	jne    c010657b <free_a_page+0x2d>
c010655a:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010655f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106562:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106567:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010656a:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010656f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106572:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106579:	eb 1f                	jmp    c010659a <free_a_page+0x4c>
c010657b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106580:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106583:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106588:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010658b:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106590:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106593:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c010659a:	8b 45 08             	mov    0x8(%ebp),%eax
c010659d:	c1 e8 0c             	shr    $0xc,%eax
c01065a0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01065a3:	6a 00                	push   $0x0
c01065a5:	ff 75 f8             	pushl  -0x8(%ebp)
c01065a8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01065ab:	50                   	push   %eax
c01065ac:	e8 74 f4 ff ff       	call   c0105a25 <set_bit_val>
c01065b1:	83 c4 0c             	add    $0xc,%esp
c01065b4:	ff 75 08             	pushl  0x8(%ebp)
c01065b7:	e8 22 fa ff ff       	call   c0105fde <get_physical_address>
c01065bc:	83 c4 04             	add    $0x4,%esp
c01065bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01065c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01065c5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01065cb:	85 c0                	test   %eax,%eax
c01065cd:	0f 48 c2             	cmovs  %edx,%eax
c01065d0:	c1 f8 0c             	sar    $0xc,%eax
c01065d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01065d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01065d9:	6a 00                	push   $0x0
c01065db:	ff 75 f0             	pushl  -0x10(%ebp)
c01065de:	50                   	push   %eax
c01065df:	e8 41 f4 ff ff       	call   c0105a25 <set_bit_val>
c01065e4:	83 c4 0c             	add    $0xc,%esp
c01065e7:	ff 75 08             	pushl  0x8(%ebp)
c01065ea:	e8 3e ff ff ff       	call   c010652d <remove_map_entry>
c01065ef:	83 c4 04             	add    $0x4,%esp
c01065f2:	90                   	nop
c01065f3:	c9                   	leave  
c01065f4:	c3                   	ret    

c01065f5 <sys_free2>:
c01065f5:	55                   	push   %ebp
c01065f6:	89 e5                	mov    %esp,%ebp
c01065f8:	83 ec 58             	sub    $0x58,%esp
c01065fb:	e8 ee 9d ff ff       	call   c01003ee <get_running_thread_pcb>
c0106600:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106603:	e8 90 06 00 00       	call   c0106c98 <intr_disable>
c0106608:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010660b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010660e:	8b 50 08             	mov    0x8(%eax),%edx
c0106611:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106616:	39 c2                	cmp    %eax,%edx
c0106618:	75 10                	jne    c010662a <sys_free2+0x35>
c010661a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106621:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c0106628:	eb 10                	jmp    c010663a <sys_free2+0x45>
c010662a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106631:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106634:	83 c0 10             	add    $0x10,%eax
c0106637:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010663a:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0106641:	76 4d                	jbe    c0106690 <sys_free2+0x9b>
c0106643:	8b 45 08             	mov    0x8(%ebp),%eax
c0106646:	83 e8 0c             	sub    $0xc,%eax
c0106649:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010664c:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0106650:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106653:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106658:	c1 e8 0c             	shr    $0xc,%eax
c010665b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010665e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106665:	eb 1c                	jmp    c0106683 <sys_free2+0x8e>
c0106667:	83 ec 08             	sub    $0x8,%esp
c010666a:	ff 75 f4             	pushl  -0xc(%ebp)
c010666d:	ff 75 ec             	pushl  -0x14(%ebp)
c0106670:	e8 d9 fe ff ff       	call   c010654e <free_a_page>
c0106675:	83 c4 10             	add    $0x10,%esp
c0106678:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010667f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106683:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106686:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106689:	77 dc                	ja     c0106667 <sys_free2+0x72>
c010668b:	e9 dc 00 00 00       	jmp    c010676c <sys_free2+0x177>
c0106690:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106697:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010669e:	eb 26                	jmp    c01066c6 <sys_free2+0xd1>
c01066a0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01066a3:	89 d0                	mov    %edx,%eax
c01066a5:	01 c0                	add    %eax,%eax
c01066a7:	01 d0                	add    %edx,%eax
c01066a9:	c1 e0 03             	shl    $0x3,%eax
c01066ac:	89 c2                	mov    %eax,%edx
c01066ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066b1:	01 d0                	add    %edx,%eax
c01066b3:	8b 00                	mov    (%eax),%eax
c01066b5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01066b8:	77 08                	ja     c01066c2 <sys_free2+0xcd>
c01066ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01066bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01066c0:	eb 0a                	jmp    c01066cc <sys_free2+0xd7>
c01066c2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01066c6:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c01066ca:	7e d4                	jle    c01066a0 <sys_free2+0xab>
c01066cc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01066cf:	89 d0                	mov    %edx,%eax
c01066d1:	01 c0                	add    %eax,%eax
c01066d3:	01 d0                	add    %edx,%eax
c01066d5:	c1 e0 03             	shl    $0x3,%eax
c01066d8:	89 c2                	mov    %eax,%edx
c01066da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066dd:	01 d0                	add    %edx,%eax
c01066df:	8b 10                	mov    (%eax),%edx
c01066e1:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c01066e4:	8b 50 04             	mov    0x4(%eax),%edx
c01066e7:	89 55 b8             	mov    %edx,-0x48(%ebp)
c01066ea:	8b 50 08             	mov    0x8(%eax),%edx
c01066ed:	89 55 bc             	mov    %edx,-0x44(%ebp)
c01066f0:	8b 50 0c             	mov    0xc(%eax),%edx
c01066f3:	89 55 c0             	mov    %edx,-0x40(%ebp)
c01066f6:	8b 50 10             	mov    0x10(%eax),%edx
c01066f9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c01066fc:	8b 40 14             	mov    0x14(%eax),%eax
c01066ff:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106702:	8b 45 08             	mov    0x8(%ebp),%eax
c0106705:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106708:	83 ec 0c             	sub    $0xc,%esp
c010670b:	ff 75 d0             	pushl  -0x30(%ebp)
c010670e:	e8 4e fb ff ff       	call   c0106261 <block2arena>
c0106713:	83 c4 10             	add    $0x10,%esp
c0106716:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106719:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010671c:	89 d0                	mov    %edx,%eax
c010671e:	01 c0                	add    %eax,%eax
c0106720:	01 d0                	add    %edx,%eax
c0106722:	c1 e0 03             	shl    $0x3,%eax
c0106725:	89 c2                	mov    %eax,%edx
c0106727:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010672a:	01 d0                	add    %edx,%eax
c010672c:	83 c0 08             	add    $0x8,%eax
c010672f:	83 ec 08             	sub    $0x8,%esp
c0106732:	ff 75 d0             	pushl  -0x30(%ebp)
c0106735:	50                   	push   %eax
c0106736:	e8 95 3a 00 00       	call   c010a1d0 <appendToDoubleLinkList>
c010673b:	83 c4 10             	add    $0x10,%esp
c010673e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106741:	8b 40 04             	mov    0x4(%eax),%eax
c0106744:	8d 50 01             	lea    0x1(%eax),%edx
c0106747:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010674a:	89 50 04             	mov    %edx,0x4(%eax)
c010674d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106750:	8b 50 04             	mov    0x4(%eax),%edx
c0106753:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106756:	39 c2                	cmp    %eax,%edx
c0106758:	75 12                	jne    c010676c <sys_free2+0x177>
c010675a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010675d:	83 ec 08             	sub    $0x8,%esp
c0106760:	ff 75 f4             	pushl  -0xc(%ebp)
c0106763:	50                   	push   %eax
c0106764:	e8 e5 fd ff ff       	call   c010654e <free_a_page>
c0106769:	83 c4 10             	add    $0x10,%esp
c010676c:	83 ec 0c             	sub    $0xc,%esp
c010676f:	ff 75 d8             	pushl  -0x28(%ebp)
c0106772:	e8 4a 05 00 00       	call   c0106cc1 <intr_set_status>
c0106777:	83 c4 10             	add    $0x10,%esp
c010677a:	90                   	nop
c010677b:	c9                   	leave  
c010677c:	c3                   	ret    

c010677d <init_memory_block_desc>:
c010677d:	55                   	push   %ebp
c010677e:	89 e5                	mov    %esp,%ebp
c0106780:	83 ec 18             	sub    $0x18,%esp
c0106783:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010678a:	e9 b2 00 00 00       	jmp    c0106841 <init_memory_block_desc+0xc4>
c010678f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106793:	75 1b                	jne    c01067b0 <init_memory_block_desc+0x33>
c0106795:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106798:	89 d0                	mov    %edx,%eax
c010679a:	01 c0                	add    %eax,%eax
c010679c:	01 d0                	add    %edx,%eax
c010679e:	c1 e0 03             	shl    $0x3,%eax
c01067a1:	89 c2                	mov    %eax,%edx
c01067a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01067a6:	01 d0                	add    %edx,%eax
c01067a8:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c01067ae:	eb 2e                	jmp    c01067de <init_memory_block_desc+0x61>
c01067b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067b3:	89 d0                	mov    %edx,%eax
c01067b5:	01 c0                	add    %eax,%eax
c01067b7:	01 d0                	add    %edx,%eax
c01067b9:	c1 e0 03             	shl    $0x3,%eax
c01067bc:	8d 50 e8             	lea    -0x18(%eax),%edx
c01067bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01067c2:	01 d0                	add    %edx,%eax
c01067c4:	8b 08                	mov    (%eax),%ecx
c01067c6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067c9:	89 d0                	mov    %edx,%eax
c01067cb:	01 c0                	add    %eax,%eax
c01067cd:	01 d0                	add    %edx,%eax
c01067cf:	c1 e0 03             	shl    $0x3,%eax
c01067d2:	89 c2                	mov    %eax,%edx
c01067d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01067d7:	01 d0                	add    %edx,%eax
c01067d9:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c01067dc:	89 10                	mov    %edx,(%eax)
c01067de:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067e1:	89 d0                	mov    %edx,%eax
c01067e3:	01 c0                	add    %eax,%eax
c01067e5:	01 d0                	add    %edx,%eax
c01067e7:	c1 e0 03             	shl    $0x3,%eax
c01067ea:	89 c2                	mov    %eax,%edx
c01067ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01067ef:	01 d0                	add    %edx,%eax
c01067f1:	8b 00                	mov    (%eax),%eax
c01067f3:	89 c1                	mov    %eax,%ecx
c01067f5:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c01067fa:	ba 00 00 00 00       	mov    $0x0,%edx
c01067ff:	f7 f1                	div    %ecx
c0106801:	89 c1                	mov    %eax,%ecx
c0106803:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106806:	89 d0                	mov    %edx,%eax
c0106808:	01 c0                	add    %eax,%eax
c010680a:	01 d0                	add    %edx,%eax
c010680c:	c1 e0 03             	shl    $0x3,%eax
c010680f:	89 c2                	mov    %eax,%edx
c0106811:	8b 45 08             	mov    0x8(%ebp),%eax
c0106814:	01 d0                	add    %edx,%eax
c0106816:	89 ca                	mov    %ecx,%edx
c0106818:	89 50 04             	mov    %edx,0x4(%eax)
c010681b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010681e:	89 d0                	mov    %edx,%eax
c0106820:	01 c0                	add    %eax,%eax
c0106822:	01 d0                	add    %edx,%eax
c0106824:	c1 e0 03             	shl    $0x3,%eax
c0106827:	89 c2                	mov    %eax,%edx
c0106829:	8b 45 08             	mov    0x8(%ebp),%eax
c010682c:	01 d0                	add    %edx,%eax
c010682e:	83 c0 08             	add    $0x8,%eax
c0106831:	83 ec 0c             	sub    $0xc,%esp
c0106834:	50                   	push   %eax
c0106835:	e8 6b 38 00 00       	call   c010a0a5 <initDoubleLinkList>
c010683a:	83 c4 10             	add    $0x10,%esp
c010683d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0106841:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0106845:	0f 8e 44 ff ff ff    	jle    c010678f <init_memory_block_desc+0x12>
c010684b:	90                   	nop
c010684c:	c9                   	leave  
c010684d:	c3                   	ret    

c010684e <init_memory2>:
c010684e:	55                   	push   %ebp
c010684f:	89 e5                	mov    %esp,%ebp
c0106851:	83 ec 38             	sub    $0x38,%esp
c0106854:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c010685b:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106862:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106865:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c010686a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010686d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106872:	29 c2                	sub    %eax,%edx
c0106874:	89 d0                	mov    %edx,%eax
c0106876:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106879:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010687c:	89 c2                	mov    %eax,%edx
c010687e:	c1 ea 1f             	shr    $0x1f,%edx
c0106881:	01 d0                	add    %edx,%eax
c0106883:	d1 f8                	sar    %eax
c0106885:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c010688a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010688f:	83 ec 0c             	sub    $0xc,%esp
c0106892:	50                   	push   %eax
c0106893:	e8 52 08 00 00       	call   c01070ea <disp_int>
c0106898:	83 c4 10             	add    $0x10,%esp
c010689b:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01068a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01068a3:	29 c2                	sub    %eax,%edx
c01068a5:	89 d0                	mov    %edx,%eax
c01068a7:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c01068ac:	83 ec 0c             	sub    $0xc,%esp
c01068af:	68 f9 b5 10 c0       	push   $0xc010b5f9
c01068b4:	e8 d3 97 ff ff       	call   c010008c <disp_str>
c01068b9:	83 c4 10             	add    $0x10,%esp
c01068bc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c01068c1:	83 ec 0c             	sub    $0xc,%esp
c01068c4:	50                   	push   %eax
c01068c5:	e8 20 08 00 00       	call   c01070ea <disp_int>
c01068ca:	83 c4 10             	add    $0x10,%esp
c01068cd:	83 ec 0c             	sub    $0xc,%esp
c01068d0:	68 f9 b5 10 c0       	push   $0xc010b5f9
c01068d5:	e8 b2 97 ff ff       	call   c010008c <disp_str>
c01068da:	83 c4 10             	add    $0x10,%esp
c01068dd:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01068e2:	05 ff 0f 00 00       	add    $0xfff,%eax
c01068e7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068ed:	85 c0                	test   %eax,%eax
c01068ef:	0f 48 c2             	cmovs  %edx,%eax
c01068f2:	c1 f8 0c             	sar    $0xc,%eax
c01068f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01068f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01068fb:	83 c0 07             	add    $0x7,%eax
c01068fe:	8d 50 07             	lea    0x7(%eax),%edx
c0106901:	85 c0                	test   %eax,%eax
c0106903:	0f 48 c2             	cmovs  %edx,%eax
c0106906:	c1 f8 03             	sar    $0x3,%eax
c0106909:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c010690e:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106913:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106918:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c010691d:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106923:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106928:	83 ec 04             	sub    $0x4,%esp
c010692b:	52                   	push   %edx
c010692c:	6a 00                	push   $0x0
c010692e:	50                   	push   %eax
c010692f:	e8 9b 58 00 00       	call   c010c1cf <Memset>
c0106934:	83 c4 10             	add    $0x10,%esp
c0106937:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c010693c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106941:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106947:	85 c0                	test   %eax,%eax
c0106949:	0f 48 c2             	cmovs  %edx,%eax
c010694c:	c1 f8 0c             	sar    $0xc,%eax
c010694f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106952:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106955:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106958:	ff 75 e8             	pushl  -0x18(%ebp)
c010695b:	6a 01                	push   $0x1
c010695d:	6a 00                	push   $0x0
c010695f:	68 ac 06 11 c0       	push   $0xc01106ac
c0106964:	e8 37 f1 ff ff       	call   c0105aa0 <set_bits>
c0106969:	83 c4 10             	add    $0x10,%esp
c010696c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106971:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106976:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010697c:	85 c0                	test   %eax,%eax
c010697e:	0f 48 c2             	cmovs  %edx,%eax
c0106981:	c1 f8 0c             	sar    $0xc,%eax
c0106984:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106987:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010698a:	83 c0 07             	add    $0x7,%eax
c010698d:	8d 50 07             	lea    0x7(%eax),%edx
c0106990:	85 c0                	test   %eax,%eax
c0106992:	0f 48 c2             	cmovs  %edx,%eax
c0106995:	c1 f8 03             	sar    $0x3,%eax
c0106998:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c010699d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01069a2:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01069a8:	01 d0                	add    %edx,%eax
c01069aa:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c01069af:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c01069b5:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c01069ba:	83 ec 04             	sub    $0x4,%esp
c01069bd:	52                   	push   %edx
c01069be:	6a 00                	push   $0x0
c01069c0:	50                   	push   %eax
c01069c1:	e8 09 58 00 00       	call   c010c1cf <Memset>
c01069c6:	83 c4 10             	add    $0x10,%esp
c01069c9:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01069ce:	05 ff 0f 00 00       	add    $0xfff,%eax
c01069d3:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069d9:	85 c0                	test   %eax,%eax
c01069db:	0f 48 c2             	cmovs  %edx,%eax
c01069de:	c1 f8 0c             	sar    $0xc,%eax
c01069e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01069e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01069e7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01069ea:	ff 75 e8             	pushl  -0x18(%ebp)
c01069ed:	6a 01                	push   $0x1
c01069ef:	ff 75 e0             	pushl  -0x20(%ebp)
c01069f2:	68 ac 06 11 c0       	push   $0xc01106ac
c01069f7:	e8 a4 f0 ff ff       	call   c0105aa0 <set_bits>
c01069fc:	83 c4 10             	add    $0x10,%esp
c01069ff:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106a06:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106a09:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106a0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106a0f:	83 c0 07             	add    $0x7,%eax
c0106a12:	8d 50 07             	lea    0x7(%eax),%edx
c0106a15:	85 c0                	test   %eax,%eax
c0106a17:	0f 48 c2             	cmovs  %edx,%eax
c0106a1a:	c1 f8 03             	sar    $0x3,%eax
c0106a1d:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106a22:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106a27:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106a2d:	01 c2                	add    %eax,%edx
c0106a2f:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106a34:	01 d0                	add    %edx,%eax
c0106a36:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106a3b:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106a41:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106a46:	83 ec 04             	sub    $0x4,%esp
c0106a49:	52                   	push   %edx
c0106a4a:	6a 00                	push   $0x0
c0106a4c:	50                   	push   %eax
c0106a4d:	e8 7d 57 00 00       	call   c010c1cf <Memset>
c0106a52:	83 c4 10             	add    $0x10,%esp
c0106a55:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106a58:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a5b:	01 d0                	add    %edx,%eax
c0106a5d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a60:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106a65:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a6a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a70:	85 c0                	test   %eax,%eax
c0106a72:	0f 48 c2             	cmovs  %edx,%eax
c0106a75:	c1 f8 0c             	sar    $0xc,%eax
c0106a78:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a7b:	ff 75 e8             	pushl  -0x18(%ebp)
c0106a7e:	6a 01                	push   $0x1
c0106a80:	ff 75 e0             	pushl  -0x20(%ebp)
c0106a83:	68 ac 06 11 c0       	push   $0xc01106ac
c0106a88:	e8 13 f0 ff ff       	call   c0105aa0 <set_bits>
c0106a8d:	83 c4 10             	add    $0x10,%esp
c0106a90:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106a93:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a96:	01 d0                	add    %edx,%eax
c0106a98:	c1 e0 0c             	shl    $0xc,%eax
c0106a9b:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106aa0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106aa3:	83 c0 02             	add    $0x2,%eax
c0106aa6:	c1 e0 0c             	shl    $0xc,%eax
c0106aa9:	89 c2                	mov    %eax,%edx
c0106aab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106aae:	01 d0                	add    %edx,%eax
c0106ab0:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106ab5:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106abc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106abf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106ac2:	90                   	nop
c0106ac3:	c9                   	leave  
c0106ac4:	c3                   	ret    

c0106ac5 <init_memory>:
c0106ac5:	55                   	push   %ebp
c0106ac6:	89 e5                	mov    %esp,%ebp
c0106ac8:	83 ec 38             	sub    $0x38,%esp
c0106acb:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106ad2:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106ad9:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106ae0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106ae3:	05 00 00 40 00       	add    $0x400000,%eax
c0106ae8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106aeb:	8b 45 08             	mov    0x8(%ebp),%eax
c0106aee:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106af1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106af7:	85 c0                	test   %eax,%eax
c0106af9:	0f 48 c2             	cmovs  %edx,%eax
c0106afc:	c1 f8 0c             	sar    $0xc,%eax
c0106aff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106b02:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106b05:	89 c2                	mov    %eax,%edx
c0106b07:	c1 ea 1f             	shr    $0x1f,%edx
c0106b0a:	01 d0                	add    %edx,%eax
c0106b0c:	d1 f8                	sar    %eax
c0106b0e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106b11:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106b14:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106b17:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106b1a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106b1d:	8d 50 07             	lea    0x7(%eax),%edx
c0106b20:	85 c0                	test   %eax,%eax
c0106b22:	0f 48 c2             	cmovs  %edx,%eax
c0106b25:	c1 f8 03             	sar    $0x3,%eax
c0106b28:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106b2b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106b2e:	8d 50 07             	lea    0x7(%eax),%edx
c0106b31:	85 c0                	test   %eax,%eax
c0106b33:	0f 48 c2             	cmovs  %edx,%eax
c0106b36:	c1 f8 03             	sar    $0x3,%eax
c0106b39:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106b3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b3f:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106b44:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106b49:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106b4c:	c1 e2 0c             	shl    $0xc,%edx
c0106b4f:	01 d0                	add    %edx,%eax
c0106b51:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106b56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b59:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106b5e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b61:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106b66:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106b6b:	83 ec 04             	sub    $0x4,%esp
c0106b6e:	ff 75 d8             	pushl  -0x28(%ebp)
c0106b71:	6a 00                	push   $0x0
c0106b73:	50                   	push   %eax
c0106b74:	e8 56 56 00 00       	call   c010c1cf <Memset>
c0106b79:	83 c4 10             	add    $0x10,%esp
c0106b7c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b7f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b82:	01 d0                	add    %edx,%eax
c0106b84:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106b89:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106b8c:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106b91:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106b96:	83 ec 04             	sub    $0x4,%esp
c0106b99:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106b9c:	6a 00                	push   $0x0
c0106b9e:	50                   	push   %eax
c0106b9f:	e8 2b 56 00 00       	call   c010c1cf <Memset>
c0106ba4:	83 c4 10             	add    $0x10,%esp
c0106ba7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106baa:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106baf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106bb2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106bb5:	01 c2                	add    %eax,%edx
c0106bb7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106bba:	01 d0                	add    %edx,%eax
c0106bbc:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106bc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106bc4:	05 00 00 10 00       	add    $0x100000,%eax
c0106bc9:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106bce:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106bd3:	83 ec 04             	sub    $0x4,%esp
c0106bd6:	ff 75 d8             	pushl  -0x28(%ebp)
c0106bd9:	6a 00                	push   $0x0
c0106bdb:	50                   	push   %eax
c0106bdc:	e8 ee 55 00 00       	call   c010c1cf <Memset>
c0106be1:	83 c4 10             	add    $0x10,%esp
c0106be4:	83 ec 04             	sub    $0x4,%esp
c0106be7:	68 f0 00 00 00       	push   $0xf0
c0106bec:	6a 00                	push   $0x0
c0106bee:	68 e0 37 18 c0       	push   $0xc01837e0
c0106bf3:	e8 d7 55 00 00       	call   c010c1cf <Memset>
c0106bf8:	83 c4 10             	add    $0x10,%esp
c0106bfb:	83 ec 0c             	sub    $0xc,%esp
c0106bfe:	68 e0 37 18 c0       	push   $0xc01837e0
c0106c03:	e8 75 fb ff ff       	call   c010677d <init_memory_block_desc>
c0106c08:	83 c4 10             	add    $0x10,%esp
c0106c0b:	90                   	nop
c0106c0c:	c9                   	leave  
c0106c0d:	c3                   	ret    

c0106c0e <stop_here>:
c0106c0e:	55                   	push   %ebp
c0106c0f:	89 e5                	mov    %esp,%ebp
c0106c11:	83 ec 08             	sub    $0x8,%esp
c0106c14:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106c1b:	00 00 00 
c0106c1e:	83 ec 0c             	sub    $0xc,%esp
c0106c21:	68 00 b6 10 c0       	push   $0xc010b600
c0106c26:	e8 61 94 ff ff       	call   c010008c <disp_str>
c0106c2b:	83 c4 10             	add    $0x10,%esp
c0106c2e:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106c33:	83 ec 0c             	sub    $0xc,%esp
c0106c36:	50                   	push   %eax
c0106c37:	e8 ae 04 00 00       	call   c01070ea <disp_int>
c0106c3c:	83 c4 10             	add    $0x10,%esp
c0106c3f:	83 ec 0c             	sub    $0xc,%esp
c0106c42:	68 02 b6 10 c0       	push   $0xc010b602
c0106c47:	e8 40 94 ff ff       	call   c010008c <disp_str>
c0106c4c:	83 c4 10             	add    $0x10,%esp
c0106c4f:	90                   	nop
c0106c50:	c9                   	leave  
c0106c51:	c3                   	ret    

c0106c52 <catch_error>:
c0106c52:	55                   	push   %ebp
c0106c53:	89 e5                	mov    %esp,%ebp
c0106c55:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106c5a:	83 c0 01             	add    $0x1,%eax
c0106c5d:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106c62:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106c67:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106c6c:	90                   	nop
c0106c6d:	5d                   	pop    %ebp
c0106c6e:	c3                   	ret    

c0106c6f <intr_enable>:
c0106c6f:	55                   	push   %ebp
c0106c70:	89 e5                	mov    %esp,%ebp
c0106c72:	83 ec 18             	sub    $0x18,%esp
c0106c75:	e8 65 00 00 00       	call   c0106cdf <intr_get_status>
c0106c7a:	83 f8 01             	cmp    $0x1,%eax
c0106c7d:	75 0c                	jne    c0106c8b <intr_enable+0x1c>
c0106c7f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106c86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c89:	eb 0b                	jmp    c0106c96 <intr_enable+0x27>
c0106c8b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c92:	fb                   	sti    
c0106c93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c96:	c9                   	leave  
c0106c97:	c3                   	ret    

c0106c98 <intr_disable>:
c0106c98:	55                   	push   %ebp
c0106c99:	89 e5                	mov    %esp,%ebp
c0106c9b:	83 ec 18             	sub    $0x18,%esp
c0106c9e:	e8 3c 00 00 00       	call   c0106cdf <intr_get_status>
c0106ca3:	83 f8 01             	cmp    $0x1,%eax
c0106ca6:	75 0d                	jne    c0106cb5 <intr_disable+0x1d>
c0106ca8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106caf:	fa                   	cli    
c0106cb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cb3:	eb 0a                	jmp    c0106cbf <intr_disable+0x27>
c0106cb5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cbf:	c9                   	leave  
c0106cc0:	c3                   	ret    

c0106cc1 <intr_set_status>:
c0106cc1:	55                   	push   %ebp
c0106cc2:	89 e5                	mov    %esp,%ebp
c0106cc4:	83 ec 08             	sub    $0x8,%esp
c0106cc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0106cca:	83 e0 01             	and    $0x1,%eax
c0106ccd:	85 c0                	test   %eax,%eax
c0106ccf:	74 07                	je     c0106cd8 <intr_set_status+0x17>
c0106cd1:	e8 99 ff ff ff       	call   c0106c6f <intr_enable>
c0106cd6:	eb 05                	jmp    c0106cdd <intr_set_status+0x1c>
c0106cd8:	e8 bb ff ff ff       	call   c0106c98 <intr_disable>
c0106cdd:	c9                   	leave  
c0106cde:	c3                   	ret    

c0106cdf <intr_get_status>:
c0106cdf:	55                   	push   %ebp
c0106ce0:	89 e5                	mov    %esp,%ebp
c0106ce2:	83 ec 10             	sub    $0x10,%esp
c0106ce5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106cec:	9c                   	pushf  
c0106ced:	58                   	pop    %eax
c0106cee:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106cf1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106cf4:	c1 e8 09             	shr    $0x9,%eax
c0106cf7:	83 e0 01             	and    $0x1,%eax
c0106cfa:	c9                   	leave  
c0106cfb:	c3                   	ret    

c0106cfc <Memcpy>:
c0106cfc:	55                   	push   %ebp
c0106cfd:	89 e5                	mov    %esp,%ebp
c0106cff:	83 ec 18             	sub    $0x18,%esp
c0106d02:	e8 91 ff ff ff       	call   c0106c98 <intr_disable>
c0106d07:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106d0a:	83 ec 04             	sub    $0x4,%esp
c0106d0d:	ff 75 10             	pushl  0x10(%ebp)
c0106d10:	ff 75 0c             	pushl  0xc(%ebp)
c0106d13:	ff 75 08             	pushl  0x8(%ebp)
c0106d16:	e8 86 54 00 00       	call   c010c1a1 <Memcpy2>
c0106d1b:	83 c4 10             	add    $0x10,%esp
c0106d1e:	83 ec 0c             	sub    $0xc,%esp
c0106d21:	ff 75 f4             	pushl  -0xc(%ebp)
c0106d24:	e8 98 ff ff ff       	call   c0106cc1 <intr_set_status>
c0106d29:	83 c4 10             	add    $0x10,%esp
c0106d2c:	90                   	nop
c0106d2d:	c9                   	leave  
c0106d2e:	c3                   	ret    

c0106d2f <untar>:
c0106d2f:	55                   	push   %ebp
c0106d30:	89 e5                	mov    %esp,%ebp
c0106d32:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106d38:	83 ec 08             	sub    $0x8,%esp
c0106d3b:	6a 00                	push   $0x0
c0106d3d:	ff 75 08             	pushl  0x8(%ebp)
c0106d40:	e8 2a de ff ff       	call   c0104b6f <open>
c0106d45:	83 c4 10             	add    $0x10,%esp
c0106d48:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106d4b:	83 ec 0c             	sub    $0xc,%esp
c0106d4e:	68 04 b6 10 c0       	push   $0xc010b604
c0106d53:	e8 60 18 00 00       	call   c01085b8 <Printf>
c0106d58:	83 c4 10             	add    $0x10,%esp
c0106d5b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106d62:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106d69:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d70:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106d77:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106d7e:	e9 63 02 00 00       	jmp    c0106fe6 <untar+0x2b7>
c0106d83:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106d87:	7e 58                	jle    c0106de1 <untar+0xb2>
c0106d89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d8c:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106d91:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106d97:	85 c0                	test   %eax,%eax
c0106d99:	0f 48 c2             	cmovs  %edx,%eax
c0106d9c:	c1 f8 09             	sar    $0x9,%eax
c0106d9f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106da2:	83 ec 04             	sub    $0x4,%esp
c0106da5:	68 00 02 00 00       	push   $0x200
c0106daa:	6a 00                	push   $0x0
c0106dac:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106db2:	50                   	push   %eax
c0106db3:	e8 17 54 00 00       	call   c010c1cf <Memset>
c0106db8:	83 c4 10             	add    $0x10,%esp
c0106dbb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106dbe:	c1 e0 09             	shl    $0x9,%eax
c0106dc1:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106dc4:	83 ec 04             	sub    $0x4,%esp
c0106dc7:	50                   	push   %eax
c0106dc8:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106dce:	50                   	push   %eax
c0106dcf:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106dd2:	e8 2d de ff ff       	call   c0104c04 <read>
c0106dd7:	83 c4 10             	add    $0x10,%esp
c0106dda:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106de1:	83 ec 04             	sub    $0x4,%esp
c0106de4:	68 00 02 00 00       	push   $0x200
c0106de9:	6a 00                	push   $0x0
c0106deb:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106df1:	50                   	push   %eax
c0106df2:	e8 d8 53 00 00       	call   c010c1cf <Memset>
c0106df7:	83 c4 10             	add    $0x10,%esp
c0106dfa:	83 ec 04             	sub    $0x4,%esp
c0106dfd:	68 00 02 00 00       	push   $0x200
c0106e02:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e08:	50                   	push   %eax
c0106e09:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106e0c:	e8 f3 dd ff ff       	call   c0104c04 <read>
c0106e11:	83 c4 10             	add    $0x10,%esp
c0106e14:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106e17:	83 ec 0c             	sub    $0xc,%esp
c0106e1a:	68 16 b6 10 c0       	push   $0xc010b616
c0106e1f:	e8 94 17 00 00       	call   c01085b8 <Printf>
c0106e24:	83 c4 10             	add    $0x10,%esp
c0106e27:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106e2b:	0f 84 c1 01 00 00    	je     c0106ff2 <untar+0x2c3>
c0106e31:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106e34:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106e37:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106e3e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e44:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106e47:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106e4a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106e4d:	83 ec 08             	sub    $0x8,%esp
c0106e50:	6a 07                	push   $0x7
c0106e52:	ff 75 cc             	pushl  -0x34(%ebp)
c0106e55:	e8 15 dd ff ff       	call   c0104b6f <open>
c0106e5a:	83 c4 10             	add    $0x10,%esp
c0106e5d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106e60:	83 ec 0c             	sub    $0xc,%esp
c0106e63:	68 28 b6 10 c0       	push   $0xc010b628
c0106e68:	e8 4b 17 00 00       	call   c01085b8 <Printf>
c0106e6d:	83 c4 10             	add    $0x10,%esp
c0106e70:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106e77:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106e7a:	83 c0 7c             	add    $0x7c,%eax
c0106e7d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106e80:	83 ec 0c             	sub    $0xc,%esp
c0106e83:	ff 75 cc             	pushl  -0x34(%ebp)
c0106e86:	e8 7d 53 00 00       	call   c010c208 <Strlen>
c0106e8b:	83 c4 10             	add    $0x10,%esp
c0106e8e:	85 c0                	test   %eax,%eax
c0106e90:	75 28                	jne    c0106eba <untar+0x18b>
c0106e92:	83 ec 0c             	sub    $0xc,%esp
c0106e95:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106e98:	e8 6b 53 00 00       	call   c010c208 <Strlen>
c0106e9d:	83 c4 10             	add    $0x10,%esp
c0106ea0:	85 c0                	test   %eax,%eax
c0106ea2:	75 16                	jne    c0106eba <untar+0x18b>
c0106ea4:	83 ec 0c             	sub    $0xc,%esp
c0106ea7:	68 3a b6 10 c0       	push   $0xc010b63a
c0106eac:	e8 07 17 00 00       	call   c01085b8 <Printf>
c0106eb1:	83 c4 10             	add    $0x10,%esp
c0106eb4:	90                   	nop
c0106eb5:	e9 39 01 00 00       	jmp    c0106ff3 <untar+0x2c4>
c0106eba:	83 ec 0c             	sub    $0xc,%esp
c0106ebd:	68 41 b6 10 c0       	push   $0xc010b641
c0106ec2:	e8 f1 16 00 00       	call   c01085b8 <Printf>
c0106ec7:	83 c4 10             	add    $0x10,%esp
c0106eca:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106ecd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106ed0:	eb 1f                	jmp    c0106ef1 <untar+0x1c2>
c0106ed2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106ed5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106edc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106edf:	0f b6 00             	movzbl (%eax),%eax
c0106ee2:	0f be c0             	movsbl %al,%eax
c0106ee5:	83 e8 30             	sub    $0x30,%eax
c0106ee8:	01 d0                	add    %edx,%eax
c0106eea:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106eed:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106ef1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ef4:	0f b6 00             	movzbl (%eax),%eax
c0106ef7:	84 c0                	test   %al,%al
c0106ef9:	75 d7                	jne    c0106ed2 <untar+0x1a3>
c0106efb:	83 ec 0c             	sub    $0xc,%esp
c0106efe:	68 4f b6 10 c0       	push   $0xc010b64f
c0106f03:	e8 b0 16 00 00       	call   c01085b8 <Printf>
c0106f08:	83 c4 10             	add    $0x10,%esp
c0106f0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f0e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106f11:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106f18:	83 ec 08             	sub    $0x8,%esp
c0106f1b:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f1e:	68 5d b6 10 c0       	push   $0xc010b65d
c0106f23:	e8 90 16 00 00       	call   c01085b8 <Printf>
c0106f28:	83 c4 10             	add    $0x10,%esp
c0106f2b:	83 ec 08             	sub    $0x8,%esp
c0106f2e:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f31:	68 6f b6 10 c0       	push   $0xc010b66f
c0106f36:	e8 7d 16 00 00       	call   c01085b8 <Printf>
c0106f3b:	83 c4 10             	add    $0x10,%esp
c0106f3e:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106f41:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106f44:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106f48:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106f4b:	e8 02 fd ff ff       	call   c0106c52 <catch_error>
c0106f50:	83 ec 04             	sub    $0x4,%esp
c0106f53:	ff 75 b8             	pushl  -0x48(%ebp)
c0106f56:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106f5c:	50                   	push   %eax
c0106f5d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106f60:	e8 9f dc ff ff       	call   c0104c04 <read>
c0106f65:	83 c4 10             	add    $0x10,%esp
c0106f68:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106f6b:	83 ec 04             	sub    $0x4,%esp
c0106f6e:	ff 75 b8             	pushl  -0x48(%ebp)
c0106f71:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106f77:	50                   	push   %eax
c0106f78:	ff 75 c8             	pushl  -0x38(%ebp)
c0106f7b:	e8 05 de ff ff       	call   c0104d85 <write>
c0106f80:	83 c4 10             	add    $0x10,%esp
c0106f83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f86:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106f89:	7d 02                	jge    c0106f8d <untar+0x25e>
c0106f8b:	eb be                	jmp    c0106f4b <untar+0x21c>
c0106f8d:	90                   	nop
c0106f8e:	83 ec 08             	sub    $0x8,%esp
c0106f91:	ff 75 f4             	pushl  -0xc(%ebp)
c0106f94:	68 81 b6 10 c0       	push   $0xc010b681
c0106f99:	e8 1a 16 00 00       	call   c01085b8 <Printf>
c0106f9e:	83 c4 10             	add    $0x10,%esp
c0106fa1:	83 ec 08             	sub    $0x8,%esp
c0106fa4:	ff 75 c0             	pushl  -0x40(%ebp)
c0106fa7:	68 93 b6 10 c0       	push   $0xc010b693
c0106fac:	e8 07 16 00 00       	call   c01085b8 <Printf>
c0106fb1:	83 c4 10             	add    $0x10,%esp
c0106fb4:	83 ec 0c             	sub    $0xc,%esp
c0106fb7:	68 a4 b6 10 c0       	push   $0xc010b6a4
c0106fbc:	e8 f7 15 00 00       	call   c01085b8 <Printf>
c0106fc1:	83 c4 10             	add    $0x10,%esp
c0106fc4:	83 ec 0c             	sub    $0xc,%esp
c0106fc7:	ff 75 c8             	pushl  -0x38(%ebp)
c0106fca:	e8 3b de ff ff       	call   c0104e0a <close>
c0106fcf:	83 c4 10             	add    $0x10,%esp
c0106fd2:	83 ec 0c             	sub    $0xc,%esp
c0106fd5:	68 b2 b6 10 c0       	push   $0xc010b6b2
c0106fda:	e8 d9 15 00 00       	call   c01085b8 <Printf>
c0106fdf:	83 c4 10             	add    $0x10,%esp
c0106fe2:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106fe6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106fea:	0f 8f 93 fd ff ff    	jg     c0106d83 <untar+0x54>
c0106ff0:	eb 01                	jmp    c0106ff3 <untar+0x2c4>
c0106ff2:	90                   	nop
c0106ff3:	83 ec 0c             	sub    $0xc,%esp
c0106ff6:	68 bf b6 10 c0       	push   $0xc010b6bf
c0106ffb:	e8 b8 15 00 00       	call   c01085b8 <Printf>
c0107000:	83 c4 10             	add    $0x10,%esp
c0107003:	83 ec 0c             	sub    $0xc,%esp
c0107006:	68 d1 b6 10 c0       	push   $0xc010b6d1
c010700b:	e8 a8 15 00 00       	call   c01085b8 <Printf>
c0107010:	83 c4 10             	add    $0x10,%esp
c0107013:	83 ec 0c             	sub    $0xc,%esp
c0107016:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107019:	e8 ec dd ff ff       	call   c0104e0a <close>
c010701e:	83 c4 10             	add    $0x10,%esp
c0107021:	83 ec 0c             	sub    $0xc,%esp
c0107024:	68 e1 b6 10 c0       	push   $0xc010b6e1
c0107029:	e8 8a 15 00 00       	call   c01085b8 <Printf>
c010702e:	83 c4 10             	add    $0x10,%esp
c0107031:	83 ec 0c             	sub    $0xc,%esp
c0107034:	68 f4 b6 10 c0       	push   $0xc010b6f4
c0107039:	e8 7a 15 00 00       	call   c01085b8 <Printf>
c010703e:	83 c4 10             	add    $0x10,%esp
c0107041:	90                   	nop
c0107042:	c9                   	leave  
c0107043:	c3                   	ret    

c0107044 <atoi>:
c0107044:	55                   	push   %ebp
c0107045:	89 e5                	mov    %esp,%ebp
c0107047:	83 ec 10             	sub    $0x10,%esp
c010704a:	8b 45 08             	mov    0x8(%ebp),%eax
c010704d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107050:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107053:	8d 50 01             	lea    0x1(%eax),%edx
c0107056:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107059:	c6 00 30             	movb   $0x30,(%eax)
c010705c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010705f:	8d 50 01             	lea    0x1(%eax),%edx
c0107062:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107065:	c6 00 78             	movb   $0x78,(%eax)
c0107068:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c010706c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0107070:	75 0e                	jne    c0107080 <atoi+0x3c>
c0107072:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107075:	8d 50 01             	lea    0x1(%eax),%edx
c0107078:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010707b:	c6 00 30             	movb   $0x30,(%eax)
c010707e:	eb 61                	jmp    c01070e1 <atoi+0x9d>
c0107080:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0107087:	eb 52                	jmp    c01070db <atoi+0x97>
c0107089:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010708c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010708f:	89 c1                	mov    %eax,%ecx
c0107091:	d3 fa                	sar    %cl,%edx
c0107093:	89 d0                	mov    %edx,%eax
c0107095:	83 e0 0f             	and    $0xf,%eax
c0107098:	88 45 fb             	mov    %al,-0x5(%ebp)
c010709b:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c010709f:	75 06                	jne    c01070a7 <atoi+0x63>
c01070a1:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c01070a5:	74 2f                	je     c01070d6 <atoi+0x92>
c01070a7:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c01070ab:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01070af:	83 c0 30             	add    $0x30,%eax
c01070b2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070b5:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c01070b9:	7e 0a                	jle    c01070c5 <atoi+0x81>
c01070bb:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01070bf:	83 c0 07             	add    $0x7,%eax
c01070c2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01070c8:	8d 50 01             	lea    0x1(%eax),%edx
c01070cb:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01070ce:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c01070d2:	88 10                	mov    %dl,(%eax)
c01070d4:	eb 01                	jmp    c01070d7 <atoi+0x93>
c01070d6:	90                   	nop
c01070d7:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c01070db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01070df:	79 a8                	jns    c0107089 <atoi+0x45>
c01070e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01070e4:	c6 00 00             	movb   $0x0,(%eax)
c01070e7:	90                   	nop
c01070e8:	c9                   	leave  
c01070e9:	c3                   	ret    

c01070ea <disp_int>:
c01070ea:	55                   	push   %ebp
c01070eb:	89 e5                	mov    %esp,%ebp
c01070ed:	83 ec 18             	sub    $0x18,%esp
c01070f0:	ff 75 08             	pushl  0x8(%ebp)
c01070f3:	8d 45 ee             	lea    -0x12(%ebp),%eax
c01070f6:	50                   	push   %eax
c01070f7:	e8 48 ff ff ff       	call   c0107044 <atoi>
c01070fc:	83 c4 08             	add    $0x8,%esp
c01070ff:	83 ec 08             	sub    $0x8,%esp
c0107102:	6a 0b                	push   $0xb
c0107104:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107107:	50                   	push   %eax
c0107108:	e8 ba 8f ff ff       	call   c01000c7 <disp_str_colour>
c010710d:	83 c4 10             	add    $0x10,%esp
c0107110:	90                   	nop
c0107111:	c9                   	leave  
c0107112:	c3                   	ret    

c0107113 <do_page_fault>:
c0107113:	55                   	push   %ebp
c0107114:	89 e5                	mov    %esp,%ebp
c0107116:	83 ec 28             	sub    $0x28,%esp
c0107119:	0f 20 d0             	mov    %cr2,%eax
c010711c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010711f:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107126:	00 00 00 
c0107129:	83 ec 0c             	sub    $0xc,%esp
c010712c:	68 ff b6 10 c0       	push   $0xc010b6ff
c0107131:	e8 56 8f ff ff       	call   c010008c <disp_str>
c0107136:	83 c4 10             	add    $0x10,%esp
c0107139:	83 ec 0c             	sub    $0xc,%esp
c010713c:	68 0e b7 10 c0       	push   $0xc010b70e
c0107141:	e8 46 8f ff ff       	call   c010008c <disp_str>
c0107146:	83 c4 10             	add    $0x10,%esp
c0107149:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010714c:	83 ec 0c             	sub    $0xc,%esp
c010714f:	50                   	push   %eax
c0107150:	e8 95 ff ff ff       	call   c01070ea <disp_int>
c0107155:	83 c4 10             	add    $0x10,%esp
c0107158:	83 ec 0c             	sub    $0xc,%esp
c010715b:	68 13 b7 10 c0       	push   $0xc010b713
c0107160:	e8 27 8f ff ff       	call   c010008c <disp_str>
c0107165:	83 c4 10             	add    $0x10,%esp
c0107168:	83 ec 0c             	sub    $0xc,%esp
c010716b:	ff 75 f4             	pushl  -0xc(%ebp)
c010716e:	e8 51 ec ff ff       	call   c0105dc4 <ptr_pde>
c0107173:	83 c4 10             	add    $0x10,%esp
c0107176:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107179:	83 ec 0c             	sub    $0xc,%esp
c010717c:	ff 75 f4             	pushl  -0xc(%ebp)
c010717f:	e8 53 ec ff ff       	call   c0105dd7 <ptr_pte>
c0107184:	83 c4 10             	add    $0x10,%esp
c0107187:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010718a:	83 ec 0c             	sub    $0xc,%esp
c010718d:	68 15 b7 10 c0       	push   $0xc010b715
c0107192:	e8 f5 8e ff ff       	call   c010008c <disp_str>
c0107197:	83 c4 10             	add    $0x10,%esp
c010719a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010719d:	83 ec 0c             	sub    $0xc,%esp
c01071a0:	50                   	push   %eax
c01071a1:	e8 44 ff ff ff       	call   c01070ea <disp_int>
c01071a6:	83 c4 10             	add    $0x10,%esp
c01071a9:	83 ec 0c             	sub    $0xc,%esp
c01071ac:	68 1a b7 10 c0       	push   $0xc010b71a
c01071b1:	e8 d6 8e ff ff       	call   c010008c <disp_str>
c01071b6:	83 c4 10             	add    $0x10,%esp
c01071b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01071bc:	8b 00                	mov    (%eax),%eax
c01071be:	83 ec 0c             	sub    $0xc,%esp
c01071c1:	50                   	push   %eax
c01071c2:	e8 23 ff ff ff       	call   c01070ea <disp_int>
c01071c7:	83 c4 10             	add    $0x10,%esp
c01071ca:	83 ec 0c             	sub    $0xc,%esp
c01071cd:	68 13 b7 10 c0       	push   $0xc010b713
c01071d2:	e8 b5 8e ff ff       	call   c010008c <disp_str>
c01071d7:	83 c4 10             	add    $0x10,%esp
c01071da:	83 ec 0c             	sub    $0xc,%esp
c01071dd:	68 23 b7 10 c0       	push   $0xc010b723
c01071e2:	e8 a5 8e ff ff       	call   c010008c <disp_str>
c01071e7:	83 c4 10             	add    $0x10,%esp
c01071ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01071ed:	83 ec 0c             	sub    $0xc,%esp
c01071f0:	50                   	push   %eax
c01071f1:	e8 f4 fe ff ff       	call   c01070ea <disp_int>
c01071f6:	83 c4 10             	add    $0x10,%esp
c01071f9:	83 ec 0c             	sub    $0xc,%esp
c01071fc:	68 28 b7 10 c0       	push   $0xc010b728
c0107201:	e8 86 8e ff ff       	call   c010008c <disp_str>
c0107206:	83 c4 10             	add    $0x10,%esp
c0107209:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010720c:	8b 00                	mov    (%eax),%eax
c010720e:	83 ec 0c             	sub    $0xc,%esp
c0107211:	50                   	push   %eax
c0107212:	e8 d3 fe ff ff       	call   c01070ea <disp_int>
c0107217:	83 c4 10             	add    $0x10,%esp
c010721a:	83 ec 0c             	sub    $0xc,%esp
c010721d:	68 13 b7 10 c0       	push   $0xc010b713
c0107222:	e8 65 8e ff ff       	call   c010008c <disp_str>
c0107227:	83 c4 10             	add    $0x10,%esp
c010722a:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0107231:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107234:	8b 00                	mov    (%eax),%eax
c0107236:	83 e0 01             	and    $0x1,%eax
c0107239:	85 c0                	test   %eax,%eax
c010723b:	74 09                	je     c0107246 <do_page_fault+0x133>
c010723d:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0107244:	eb 07                	jmp    c010724d <do_page_fault+0x13a>
c0107246:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010724d:	90                   	nop
c010724e:	c9                   	leave  
c010724f:	c3                   	ret    

c0107250 <exception_handler>:
c0107250:	55                   	push   %ebp
c0107251:	89 e5                	mov    %esp,%ebp
c0107253:	57                   	push   %edi
c0107254:	56                   	push   %esi
c0107255:	53                   	push   %ebx
c0107256:	83 ec 6c             	sub    $0x6c,%esp
c0107259:	8d 45 8c             	lea    -0x74(%ebp),%eax
c010725c:	bb a0 b9 10 c0       	mov    $0xc010b9a0,%ebx
c0107261:	ba 13 00 00 00       	mov    $0x13,%edx
c0107266:	89 c7                	mov    %eax,%edi
c0107268:	89 de                	mov    %ebx,%esi
c010726a:	89 d1                	mov    %edx,%ecx
c010726c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010726e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107275:	eb 04                	jmp    c010727b <exception_handler+0x2b>
c0107277:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010727b:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0107282:	7e f3                	jle    c0107277 <exception_handler+0x27>
c0107284:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010728b:	00 00 00 
c010728e:	83 ec 0c             	sub    $0xc,%esp
c0107291:	68 31 b7 10 c0       	push   $0xc010b731
c0107296:	e8 f1 8d ff ff       	call   c010008c <disp_str>
c010729b:	83 c4 10             	add    $0x10,%esp
c010729e:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c01072a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01072a8:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c01072ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01072af:	83 ec 0c             	sub    $0xc,%esp
c01072b2:	ff 75 dc             	pushl  -0x24(%ebp)
c01072b5:	e8 d2 8d ff ff       	call   c010008c <disp_str>
c01072ba:	83 c4 10             	add    $0x10,%esp
c01072bd:	83 ec 0c             	sub    $0xc,%esp
c01072c0:	68 3f b7 10 c0       	push   $0xc010b73f
c01072c5:	e8 c2 8d ff ff       	call   c010008c <disp_str>
c01072ca:	83 c4 10             	add    $0x10,%esp
c01072cd:	83 ec 0c             	sub    $0xc,%esp
c01072d0:	68 42 b7 10 c0       	push   $0xc010b742
c01072d5:	e8 b2 8d ff ff       	call   c010008c <disp_str>
c01072da:	83 c4 10             	add    $0x10,%esp
c01072dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01072e0:	83 ec 0c             	sub    $0xc,%esp
c01072e3:	50                   	push   %eax
c01072e4:	e8 01 fe ff ff       	call   c01070ea <disp_int>
c01072e9:	83 c4 10             	add    $0x10,%esp
c01072ec:	83 ec 0c             	sub    $0xc,%esp
c01072ef:	68 3f b7 10 c0       	push   $0xc010b73f
c01072f4:	e8 93 8d ff ff       	call   c010008c <disp_str>
c01072f9:	83 c4 10             	add    $0x10,%esp
c01072fc:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107300:	74 2f                	je     c0107331 <exception_handler+0xe1>
c0107302:	83 ec 0c             	sub    $0xc,%esp
c0107305:	68 4a b7 10 c0       	push   $0xc010b74a
c010730a:	e8 7d 8d ff ff       	call   c010008c <disp_str>
c010730f:	83 c4 10             	add    $0x10,%esp
c0107312:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107315:	83 ec 0c             	sub    $0xc,%esp
c0107318:	50                   	push   %eax
c0107319:	e8 cc fd ff ff       	call   c01070ea <disp_int>
c010731e:	83 c4 10             	add    $0x10,%esp
c0107321:	83 ec 0c             	sub    $0xc,%esp
c0107324:	68 3f b7 10 c0       	push   $0xc010b73f
c0107329:	e8 5e 8d ff ff       	call   c010008c <disp_str>
c010732e:	83 c4 10             	add    $0x10,%esp
c0107331:	83 ec 0c             	sub    $0xc,%esp
c0107334:	68 54 b7 10 c0       	push   $0xc010b754
c0107339:	e8 4e 8d ff ff       	call   c010008c <disp_str>
c010733e:	83 c4 10             	add    $0x10,%esp
c0107341:	83 ec 0c             	sub    $0xc,%esp
c0107344:	ff 75 14             	pushl  0x14(%ebp)
c0107347:	e8 9e fd ff ff       	call   c01070ea <disp_int>
c010734c:	83 c4 10             	add    $0x10,%esp
c010734f:	83 ec 0c             	sub    $0xc,%esp
c0107352:	68 3f b7 10 c0       	push   $0xc010b73f
c0107357:	e8 30 8d ff ff       	call   c010008c <disp_str>
c010735c:	83 c4 10             	add    $0x10,%esp
c010735f:	83 ec 0c             	sub    $0xc,%esp
c0107362:	68 58 b7 10 c0       	push   $0xc010b758
c0107367:	e8 20 8d ff ff       	call   c010008c <disp_str>
c010736c:	83 c4 10             	add    $0x10,%esp
c010736f:	8b 45 10             	mov    0x10(%ebp),%eax
c0107372:	83 ec 0c             	sub    $0xc,%esp
c0107375:	50                   	push   %eax
c0107376:	e8 6f fd ff ff       	call   c01070ea <disp_int>
c010737b:	83 c4 10             	add    $0x10,%esp
c010737e:	83 ec 0c             	sub    $0xc,%esp
c0107381:	68 3f b7 10 c0       	push   $0xc010b73f
c0107386:	e8 01 8d ff ff       	call   c010008c <disp_str>
c010738b:	83 c4 10             	add    $0x10,%esp
c010738e:	83 ec 0c             	sub    $0xc,%esp
c0107391:	68 5d b7 10 c0       	push   $0xc010b75d
c0107396:	e8 f1 8c ff ff       	call   c010008c <disp_str>
c010739b:	83 c4 10             	add    $0x10,%esp
c010739e:	83 ec 0c             	sub    $0xc,%esp
c01073a1:	ff 75 18             	pushl  0x18(%ebp)
c01073a4:	e8 41 fd ff ff       	call   c01070ea <disp_int>
c01073a9:	83 c4 10             	add    $0x10,%esp
c01073ac:	83 ec 0c             	sub    $0xc,%esp
c01073af:	68 3f b7 10 c0       	push   $0xc010b73f
c01073b4:	e8 d3 8c ff ff       	call   c010008c <disp_str>
c01073b9:	83 c4 10             	add    $0x10,%esp
c01073bc:	83 ec 0c             	sub    $0xc,%esp
c01073bf:	68 68 b7 10 c0       	push   $0xc010b768
c01073c4:	e8 c3 8c ff ff       	call   c010008c <disp_str>
c01073c9:	83 c4 10             	add    $0x10,%esp
c01073cc:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c01073d0:	75 45                	jne    c0107417 <exception_handler+0x1c7>
c01073d2:	0f 20 d0             	mov    %cr2,%eax
c01073d5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01073d8:	83 ec 0c             	sub    $0xc,%esp
c01073db:	68 87 b7 10 c0       	push   $0xc010b787
c01073e0:	e8 a7 8c ff ff       	call   c010008c <disp_str>
c01073e5:	83 c4 10             	add    $0x10,%esp
c01073e8:	83 ec 0c             	sub    $0xc,%esp
c01073eb:	68 0e b7 10 c0       	push   $0xc010b70e
c01073f0:	e8 97 8c ff ff       	call   c010008c <disp_str>
c01073f5:	83 c4 10             	add    $0x10,%esp
c01073f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01073fb:	83 ec 0c             	sub    $0xc,%esp
c01073fe:	50                   	push   %eax
c01073ff:	e8 e6 fc ff ff       	call   c01070ea <disp_int>
c0107404:	83 c4 10             	add    $0x10,%esp
c0107407:	83 ec 0c             	sub    $0xc,%esp
c010740a:	68 13 b7 10 c0       	push   $0xc010b713
c010740f:	e8 78 8c ff ff       	call   c010008c <disp_str>
c0107414:	83 c4 10             	add    $0x10,%esp
c0107417:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c010741b:	75 11                	jne    c010742e <exception_handler+0x1de>
c010741d:	83 ec 0c             	sub    $0xc,%esp
c0107420:	68 93 b7 10 c0       	push   $0xc010b793
c0107425:	e8 62 8c ff ff       	call   c010008c <disp_str>
c010742a:	83 c4 10             	add    $0x10,%esp
c010742d:	90                   	nop
c010742e:	90                   	nop
c010742f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107432:	5b                   	pop    %ebx
c0107433:	5e                   	pop    %esi
c0107434:	5f                   	pop    %edi
c0107435:	5d                   	pop    %ebp
c0107436:	c3                   	ret    

c0107437 <init_internal_interrupt>:
c0107437:	55                   	push   %ebp
c0107438:	89 e5                	mov    %esp,%ebp
c010743a:	83 ec 08             	sub    $0x8,%esp
c010743d:	6a 0e                	push   $0xe
c010743f:	6a 08                	push   $0x8
c0107441:	68 03 01 10 c0       	push   $0xc0100103
c0107446:	6a 00                	push   $0x0
c0107448:	e8 62 c7 ff ff       	call   c0103baf <InitInterruptDesc>
c010744d:	83 c4 10             	add    $0x10,%esp
c0107450:	6a 0e                	push   $0xe
c0107452:	6a 08                	push   $0x8
c0107454:	68 09 01 10 c0       	push   $0xc0100109
c0107459:	6a 01                	push   $0x1
c010745b:	e8 4f c7 ff ff       	call   c0103baf <InitInterruptDesc>
c0107460:	83 c4 10             	add    $0x10,%esp
c0107463:	6a 0e                	push   $0xe
c0107465:	6a 08                	push   $0x8
c0107467:	68 0f 01 10 c0       	push   $0xc010010f
c010746c:	6a 02                	push   $0x2
c010746e:	e8 3c c7 ff ff       	call   c0103baf <InitInterruptDesc>
c0107473:	83 c4 10             	add    $0x10,%esp
c0107476:	6a 0e                	push   $0xe
c0107478:	6a 08                	push   $0x8
c010747a:	68 15 01 10 c0       	push   $0xc0100115
c010747f:	6a 03                	push   $0x3
c0107481:	e8 29 c7 ff ff       	call   c0103baf <InitInterruptDesc>
c0107486:	83 c4 10             	add    $0x10,%esp
c0107489:	6a 0e                	push   $0xe
c010748b:	6a 08                	push   $0x8
c010748d:	68 1b 01 10 c0       	push   $0xc010011b
c0107492:	6a 04                	push   $0x4
c0107494:	e8 16 c7 ff ff       	call   c0103baf <InitInterruptDesc>
c0107499:	83 c4 10             	add    $0x10,%esp
c010749c:	6a 0e                	push   $0xe
c010749e:	6a 08                	push   $0x8
c01074a0:	68 21 01 10 c0       	push   $0xc0100121
c01074a5:	6a 05                	push   $0x5
c01074a7:	e8 03 c7 ff ff       	call   c0103baf <InitInterruptDesc>
c01074ac:	83 c4 10             	add    $0x10,%esp
c01074af:	6a 0e                	push   $0xe
c01074b1:	6a 08                	push   $0x8
c01074b3:	68 27 01 10 c0       	push   $0xc0100127
c01074b8:	6a 06                	push   $0x6
c01074ba:	e8 f0 c6 ff ff       	call   c0103baf <InitInterruptDesc>
c01074bf:	83 c4 10             	add    $0x10,%esp
c01074c2:	6a 0e                	push   $0xe
c01074c4:	6a 08                	push   $0x8
c01074c6:	68 2d 01 10 c0       	push   $0xc010012d
c01074cb:	6a 07                	push   $0x7
c01074cd:	e8 dd c6 ff ff       	call   c0103baf <InitInterruptDesc>
c01074d2:	83 c4 10             	add    $0x10,%esp
c01074d5:	6a 0e                	push   $0xe
c01074d7:	6a 08                	push   $0x8
c01074d9:	68 33 01 10 c0       	push   $0xc0100133
c01074de:	6a 08                	push   $0x8
c01074e0:	e8 ca c6 ff ff       	call   c0103baf <InitInterruptDesc>
c01074e5:	83 c4 10             	add    $0x10,%esp
c01074e8:	6a 0e                	push   $0xe
c01074ea:	6a 08                	push   $0x8
c01074ec:	68 37 01 10 c0       	push   $0xc0100137
c01074f1:	6a 09                	push   $0x9
c01074f3:	e8 b7 c6 ff ff       	call   c0103baf <InitInterruptDesc>
c01074f8:	83 c4 10             	add    $0x10,%esp
c01074fb:	6a 0e                	push   $0xe
c01074fd:	6a 08                	push   $0x8
c01074ff:	68 3d 01 10 c0       	push   $0xc010013d
c0107504:	6a 0a                	push   $0xa
c0107506:	e8 a4 c6 ff ff       	call   c0103baf <InitInterruptDesc>
c010750b:	83 c4 10             	add    $0x10,%esp
c010750e:	6a 0e                	push   $0xe
c0107510:	6a 08                	push   $0x8
c0107512:	68 41 01 10 c0       	push   $0xc0100141
c0107517:	6a 0b                	push   $0xb
c0107519:	e8 91 c6 ff ff       	call   c0103baf <InitInterruptDesc>
c010751e:	83 c4 10             	add    $0x10,%esp
c0107521:	6a 0e                	push   $0xe
c0107523:	6a 08                	push   $0x8
c0107525:	68 45 01 10 c0       	push   $0xc0100145
c010752a:	6a 0c                	push   $0xc
c010752c:	e8 7e c6 ff ff       	call   c0103baf <InitInterruptDesc>
c0107531:	83 c4 10             	add    $0x10,%esp
c0107534:	6a 0e                	push   $0xe
c0107536:	6a 08                	push   $0x8
c0107538:	68 49 01 10 c0       	push   $0xc0100149
c010753d:	6a 0d                	push   $0xd
c010753f:	e8 6b c6 ff ff       	call   c0103baf <InitInterruptDesc>
c0107544:	83 c4 10             	add    $0x10,%esp
c0107547:	6a 0e                	push   $0xe
c0107549:	6a 08                	push   $0x8
c010754b:	68 54 01 10 c0       	push   $0xc0100154
c0107550:	6a 0e                	push   $0xe
c0107552:	e8 58 c6 ff ff       	call   c0103baf <InitInterruptDesc>
c0107557:	83 c4 10             	add    $0x10,%esp
c010755a:	6a 0e                	push   $0xe
c010755c:	6a 08                	push   $0x8
c010755e:	68 58 01 10 c0       	push   $0xc0100158
c0107563:	6a 10                	push   $0x10
c0107565:	e8 45 c6 ff ff       	call   c0103baf <InitInterruptDesc>
c010756a:	83 c4 10             	add    $0x10,%esp
c010756d:	6a 0e                	push   $0xe
c010756f:	6a 08                	push   $0x8
c0107571:	68 5e 01 10 c0       	push   $0xc010015e
c0107576:	6a 11                	push   $0x11
c0107578:	e8 32 c6 ff ff       	call   c0103baf <InitInterruptDesc>
c010757d:	83 c4 10             	add    $0x10,%esp
c0107580:	6a 0e                	push   $0xe
c0107582:	6a 08                	push   $0x8
c0107584:	68 62 01 10 c0       	push   $0xc0100162
c0107589:	6a 12                	push   $0x12
c010758b:	e8 1f c6 ff ff       	call   c0103baf <InitInterruptDesc>
c0107590:	83 c4 10             	add    $0x10,%esp
c0107593:	6a 0e                	push   $0xe
c0107595:	6a 0e                	push   $0xe
c0107597:	68 6c 02 10 c0       	push   $0xc010026c
c010759c:	68 90 00 00 00       	push   $0x90
c01075a1:	e8 09 c6 ff ff       	call   c0103baf <InitInterruptDesc>
c01075a6:	83 c4 10             	add    $0x10,%esp
c01075a9:	90                   	nop
c01075aa:	c9                   	leave  
c01075ab:	c3                   	ret    

c01075ac <spurious_irq>:
c01075ac:	55                   	push   %ebp
c01075ad:	89 e5                	mov    %esp,%ebp
c01075af:	83 ec 08             	sub    $0x8,%esp
c01075b2:	83 ec 08             	sub    $0x8,%esp
c01075b5:	6a 0b                	push   $0xb
c01075b7:	68 ec b9 10 c0       	push   $0xc010b9ec
c01075bc:	e8 06 8b ff ff       	call   c01000c7 <disp_str_colour>
c01075c1:	83 c4 10             	add    $0x10,%esp
c01075c4:	83 ec 0c             	sub    $0xc,%esp
c01075c7:	ff 75 08             	pushl  0x8(%ebp)
c01075ca:	e8 1b fb ff ff       	call   c01070ea <disp_int>
c01075cf:	83 c4 10             	add    $0x10,%esp
c01075d2:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01075d7:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01075dd:	83 c0 01             	add    $0x1,%eax
c01075e0:	83 d2 00             	adc    $0x0,%edx
c01075e3:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c01075e8:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c01075ee:	83 ec 0c             	sub    $0xc,%esp
c01075f1:	68 00 b6 10 c0       	push   $0xc010b600
c01075f6:	e8 91 8a ff ff       	call   c010008c <disp_str>
c01075fb:	83 c4 10             	add    $0x10,%esp
c01075fe:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107603:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107609:	83 ec 0c             	sub    $0xc,%esp
c010760c:	50                   	push   %eax
c010760d:	e8 d8 fa ff ff       	call   c01070ea <disp_int>
c0107612:	83 c4 10             	add    $0x10,%esp
c0107615:	83 ec 0c             	sub    $0xc,%esp
c0107618:	68 02 b6 10 c0       	push   $0xc010b602
c010761d:	e8 6a 8a ff ff       	call   c010008c <disp_str>
c0107622:	83 c4 10             	add    $0x10,%esp
c0107625:	83 ec 08             	sub    $0x8,%esp
c0107628:	6a 0c                	push   $0xc
c010762a:	68 14 ba 10 c0       	push   $0xc010ba14
c010762f:	e8 93 8a ff ff       	call   c01000c7 <disp_str_colour>
c0107634:	83 c4 10             	add    $0x10,%esp
c0107637:	90                   	nop
c0107638:	c9                   	leave  
c0107639:	c3                   	ret    

c010763a <init_keyboard>:
c010763a:	55                   	push   %ebp
c010763b:	89 e5                	mov    %esp,%ebp
c010763d:	83 ec 08             	sub    $0x8,%esp
c0107640:	83 ec 04             	sub    $0x4,%esp
c0107643:	68 00 02 00 00       	push   $0x200
c0107648:	6a 00                	push   $0x0
c010764a:	68 ec fb 10 c0       	push   $0xc010fbec
c010764f:	e8 7b 4b 00 00       	call   c010c1cf <Memset>
c0107654:	83 c4 10             	add    $0x10,%esp
c0107657:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010765e:	fb 10 c0 
c0107661:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107666:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010766b:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c0107672:	00 00 00 
c0107675:	e8 4f d3 ff ff       	call   c01049c9 <init_keyboard_handler>
c010767a:	90                   	nop
c010767b:	c9                   	leave  
c010767c:	c3                   	ret    

c010767d <TestTTY>:
c010767d:	55                   	push   %ebp
c010767e:	89 e5                	mov    %esp,%ebp
c0107680:	83 ec 28             	sub    $0x28,%esp
c0107683:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c010768a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107691:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107697:	83 ec 08             	sub    $0x8,%esp
c010769a:	6a 02                	push   $0x2
c010769c:	8d 45 de             	lea    -0x22(%ebp),%eax
c010769f:	50                   	push   %eax
c01076a0:	e8 ca d4 ff ff       	call   c0104b6f <open>
c01076a5:	83 c4 10             	add    $0x10,%esp
c01076a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01076ab:	83 ec 08             	sub    $0x8,%esp
c01076ae:	6a 02                	push   $0x2
c01076b0:	8d 45 de             	lea    -0x22(%ebp),%eax
c01076b3:	50                   	push   %eax
c01076b4:	e8 b6 d4 ff ff       	call   c0104b6f <open>
c01076b9:	83 c4 10             	add    $0x10,%esp
c01076bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01076bf:	83 ec 0c             	sub    $0xc,%esp
c01076c2:	68 39 ba 10 c0       	push   $0xc010ba39
c01076c7:	e8 ec 0e 00 00       	call   c01085b8 <Printf>
c01076cc:	83 c4 10             	add    $0x10,%esp
c01076cf:	83 ec 0c             	sub    $0xc,%esp
c01076d2:	6a 0a                	push   $0xa
c01076d4:	e8 73 9f ff ff       	call   c010164c <sys_malloc>
c01076d9:	83 c4 10             	add    $0x10,%esp
c01076dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01076df:	83 ec 04             	sub    $0x4,%esp
c01076e2:	6a 0a                	push   $0xa
c01076e4:	6a 00                	push   $0x0
c01076e6:	ff 75 ec             	pushl  -0x14(%ebp)
c01076e9:	e8 e1 4a 00 00       	call   c010c1cf <Memset>
c01076ee:	83 c4 10             	add    $0x10,%esp
c01076f1:	83 ec 04             	sub    $0x4,%esp
c01076f4:	6a 0a                	push   $0xa
c01076f6:	ff 75 ec             	pushl  -0x14(%ebp)
c01076f9:	ff 75 f0             	pushl  -0x10(%ebp)
c01076fc:	e8 03 d5 ff ff       	call   c0104c04 <read>
c0107701:	83 c4 10             	add    $0x10,%esp
c0107704:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107707:	83 ec 08             	sub    $0x8,%esp
c010770a:	ff 75 ec             	pushl  -0x14(%ebp)
c010770d:	68 4b ba 10 c0       	push   $0xc010ba4b
c0107712:	e8 a1 0e 00 00       	call   c01085b8 <Printf>
c0107717:	83 c4 10             	add    $0x10,%esp
c010771a:	eb c3                	jmp    c01076df <TestTTY+0x62>

c010771c <TestReadReturnValue>:
c010771c:	55                   	push   %ebp
c010771d:	89 e5                	mov    %esp,%ebp
c010771f:	81 ec 18 02 00 00    	sub    $0x218,%esp
c0107725:	c7 45 f4 55 ba 10 c0 	movl   $0xc010ba55,-0xc(%ebp)
c010772c:	83 ec 08             	sub    $0x8,%esp
c010772f:	6a 00                	push   $0x0
c0107731:	ff 75 f4             	pushl  -0xc(%ebp)
c0107734:	e8 36 d4 ff ff       	call   c0104b6f <open>
c0107739:	83 c4 10             	add    $0x10,%esp
c010773c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010773f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107746:	83 ec 04             	sub    $0x4,%esp
c0107749:	68 cb 00 00 00       	push   $0xcb
c010774e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0107754:	50                   	push   %eax
c0107755:	ff 75 f0             	pushl  -0x10(%ebp)
c0107758:	e8 a7 d4 ff ff       	call   c0104c04 <read>
c010775d:	83 c4 10             	add    $0x10,%esp
c0107760:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107763:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c010776a:	74 1c                	je     c0107788 <TestReadReturnValue+0x6c>
c010776c:	68 08 02 00 00       	push   $0x208
c0107771:	68 61 ba 10 c0       	push   $0xc010ba61
c0107776:	68 61 ba 10 c0       	push   $0xc010ba61
c010777b:	68 71 ba 10 c0       	push   $0xc010ba71
c0107780:	e8 90 11 00 00       	call   c0108915 <assertion_failure>
c0107785:	83 c4 10             	add    $0x10,%esp
c0107788:	83 ec 0c             	sub    $0xc,%esp
c010778b:	ff 75 f0             	pushl  -0x10(%ebp)
c010778e:	e8 77 d6 ff ff       	call   c0104e0a <close>
c0107793:	83 c4 10             	add    $0x10,%esp
c0107796:	90                   	nop
c0107797:	c9                   	leave  
c0107798:	c3                   	ret    

c0107799 <TestWriteReturnValue>:
c0107799:	55                   	push   %ebp
c010779a:	89 e5                	mov    %esp,%ebp
c010779c:	81 ec 28 02 00 00    	sub    $0x228,%esp
c01077a2:	c7 45 f4 7c ba 10 c0 	movl   $0xc010ba7c,-0xc(%ebp)
c01077a9:	83 ec 08             	sub    $0x8,%esp
c01077ac:	6a 07                	push   $0x7
c01077ae:	ff 75 f4             	pushl  -0xc(%ebp)
c01077b1:	e8 b9 d3 ff ff       	call   c0104b6f <open>
c01077b6:	83 c4 10             	add    $0x10,%esp
c01077b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01077bc:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c01077c0:	75 1c                	jne    c01077de <TestWriteReturnValue+0x45>
c01077c2:	68 12 02 00 00       	push   $0x212
c01077c7:	68 61 ba 10 c0       	push   $0xc010ba61
c01077cc:	68 61 ba 10 c0       	push   $0xc010ba61
c01077d1:	68 89 ba 10 c0       	push   $0xc010ba89
c01077d6:	e8 3a 11 00 00       	call   c0108915 <assertion_failure>
c01077db:	83 c4 10             	add    $0x10,%esp
c01077de:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01077e5:	c7 45 e8 94 ba 10 c0 	movl   $0xc010ba94,-0x18(%ebp)
c01077ec:	83 ec 0c             	sub    $0xc,%esp
c01077ef:	ff 75 e8             	pushl  -0x18(%ebp)
c01077f2:	e8 11 4a 00 00       	call   c010c208 <Strlen>
c01077f7:	83 c4 10             	add    $0x10,%esp
c01077fa:	83 ec 04             	sub    $0x4,%esp
c01077fd:	50                   	push   %eax
c01077fe:	ff 75 e8             	pushl  -0x18(%ebp)
c0107801:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107807:	50                   	push   %eax
c0107808:	e8 ef f4 ff ff       	call   c0106cfc <Memcpy>
c010780d:	83 c4 10             	add    $0x10,%esp
c0107810:	83 ec 04             	sub    $0x4,%esp
c0107813:	68 ff 01 00 00       	push   $0x1ff
c0107818:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c010781e:	50                   	push   %eax
c010781f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107822:	e8 5e d5 ff ff       	call   c0104d85 <write>
c0107827:	83 c4 10             	add    $0x10,%esp
c010782a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010782d:	83 ec 0c             	sub    $0xc,%esp
c0107830:	ff 75 e8             	pushl  -0x18(%ebp)
c0107833:	e8 d0 49 00 00       	call   c010c208 <Strlen>
c0107838:	83 c4 10             	add    $0x10,%esp
c010783b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c010783e:	74 1c                	je     c010785c <TestWriteReturnValue+0xc3>
c0107840:	68 1c 02 00 00       	push   $0x21c
c0107845:	68 61 ba 10 c0       	push   $0xc010ba61
c010784a:	68 61 ba 10 c0       	push   $0xc010ba61
c010784f:	68 c7 ba 10 c0       	push   $0xc010bac7
c0107854:	e8 bc 10 00 00       	call   c0108915 <assertion_failure>
c0107859:	83 c4 10             	add    $0x10,%esp
c010785c:	83 ec 0c             	sub    $0xc,%esp
c010785f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107862:	e8 a3 d5 ff ff       	call   c0104e0a <close>
c0107867:	83 c4 10             	add    $0x10,%esp
c010786a:	90                   	nop
c010786b:	c9                   	leave  
c010786c:	c3                   	ret    

c010786d <TestFS2>:
c010786d:	55                   	push   %ebp
c010786e:	89 e5                	mov    %esp,%ebp
c0107870:	83 ec 08             	sub    $0x8,%esp
c0107873:	e8 21 ff ff ff       	call   c0107799 <TestWriteReturnValue>
c0107878:	90                   	nop
c0107879:	c9                   	leave  
c010787a:	c3                   	ret    

c010787b <TestFS>:
c010787b:	55                   	push   %ebp
c010787c:	89 e5                	mov    %esp,%ebp
c010787e:	57                   	push   %edi
c010787f:	56                   	push   %esi
c0107880:	53                   	push   %ebx
c0107881:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c0107887:	83 ec 0c             	sub    $0xc,%esp
c010788a:	68 da ba 10 c0       	push   $0xc010bada
c010788f:	e8 f8 87 ff ff       	call   c010008c <disp_str>
c0107894:	83 c4 10             	add    $0x10,%esp
c0107897:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c010789e:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c01078a5:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c01078ab:	83 ec 08             	sub    $0x8,%esp
c01078ae:	6a 02                	push   $0x2
c01078b0:	8d 45 ae             	lea    -0x52(%ebp),%eax
c01078b3:	50                   	push   %eax
c01078b4:	e8 b6 d2 ff ff       	call   c0104b6f <open>
c01078b9:	83 c4 10             	add    $0x10,%esp
c01078bc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01078bf:	83 ec 08             	sub    $0x8,%esp
c01078c2:	6a 02                	push   $0x2
c01078c4:	8d 45 ae             	lea    -0x52(%ebp),%eax
c01078c7:	50                   	push   %eax
c01078c8:	e8 a2 d2 ff ff       	call   c0104b6f <open>
c01078cd:	83 c4 10             	add    $0x10,%esp
c01078d0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01078d3:	83 ec 0c             	sub    $0xc,%esp
c01078d6:	68 39 ba 10 c0       	push   $0xc010ba39
c01078db:	e8 d8 0c 00 00       	call   c01085b8 <Printf>
c01078e0:	83 c4 10             	add    $0x10,%esp
c01078e3:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c01078ea:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c01078ee:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c01078f5:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c01078f9:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c0107900:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c0107907:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c010790d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c0107914:	83 ec 0c             	sub    $0xc,%esp
c0107917:	68 e2 ba 10 c0       	push   $0xc010bae2
c010791c:	e8 97 0c 00 00       	call   c01085b8 <Printf>
c0107921:	83 c4 10             	add    $0x10,%esp
c0107924:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c0107928:	0f 85 e6 03 00 00    	jne    c0107d14 <TestFS+0x499>
c010792e:	83 ec 08             	sub    $0x8,%esp
c0107931:	6a 07                	push   $0x7
c0107933:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107936:	50                   	push   %eax
c0107937:	e8 33 d2 ff ff       	call   c0104b6f <open>
c010793c:	83 c4 10             	add    $0x10,%esp
c010793f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107942:	83 ec 08             	sub    $0x8,%esp
c0107945:	ff 75 d0             	pushl  -0x30(%ebp)
c0107948:	68 fa ba 10 c0       	push   $0xc010bafa
c010794d:	e8 66 0c 00 00       	call   c01085b8 <Printf>
c0107952:	83 c4 10             	add    $0x10,%esp
c0107955:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c010795c:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107963:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c010796a:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107971:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107978:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c010797f:	83 ec 0c             	sub    $0xc,%esp
c0107982:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107985:	50                   	push   %eax
c0107986:	e8 7d 48 00 00       	call   c010c208 <Strlen>
c010798b:	83 c4 10             	add    $0x10,%esp
c010798e:	83 ec 04             	sub    $0x4,%esp
c0107991:	50                   	push   %eax
c0107992:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107995:	50                   	push   %eax
c0107996:	ff 75 d0             	pushl  -0x30(%ebp)
c0107999:	e8 e7 d3 ff ff       	call   c0104d85 <write>
c010799e:	83 c4 10             	add    $0x10,%esp
c01079a1:	83 ec 0c             	sub    $0xc,%esp
c01079a4:	ff 75 d0             	pushl  -0x30(%ebp)
c01079a7:	e8 5e d4 ff ff       	call   c0104e0a <close>
c01079ac:	83 c4 10             	add    $0x10,%esp
c01079af:	83 ec 08             	sub    $0x8,%esp
c01079b2:	6a 00                	push   $0x0
c01079b4:	8d 45 a9             	lea    -0x57(%ebp),%eax
c01079b7:	50                   	push   %eax
c01079b8:	e8 b2 d1 ff ff       	call   c0104b6f <open>
c01079bd:	83 c4 10             	add    $0x10,%esp
c01079c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01079c3:	83 ec 04             	sub    $0x4,%esp
c01079c6:	6a 14                	push   $0x14
c01079c8:	6a 00                	push   $0x0
c01079ca:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c01079d0:	50                   	push   %eax
c01079d1:	e8 f9 47 00 00       	call   c010c1cf <Memset>
c01079d6:	83 c4 10             	add    $0x10,%esp
c01079d9:	83 ec 04             	sub    $0x4,%esp
c01079dc:	6a 12                	push   $0x12
c01079de:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c01079e4:	50                   	push   %eax
c01079e5:	ff 75 d0             	pushl  -0x30(%ebp)
c01079e8:	e8 17 d2 ff ff       	call   c0104c04 <read>
c01079ed:	83 c4 10             	add    $0x10,%esp
c01079f0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01079f3:	83 ec 08             	sub    $0x8,%esp
c01079f6:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c01079fc:	50                   	push   %eax
c01079fd:	68 03 bb 10 c0       	push   $0xc010bb03
c0107a02:	e8 b1 0b 00 00       	call   c01085b8 <Printf>
c0107a07:	83 c4 10             	add    $0x10,%esp
c0107a0a:	83 ec 0c             	sub    $0xc,%esp
c0107a0d:	6a 0a                	push   $0xa
c0107a0f:	e8 70 0a 00 00       	call   c0108484 <delay>
c0107a14:	83 c4 10             	add    $0x10,%esp
c0107a17:	83 ec 08             	sub    $0x8,%esp
c0107a1a:	6a 07                	push   $0x7
c0107a1c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107a1f:	50                   	push   %eax
c0107a20:	e8 4a d1 ff ff       	call   c0104b6f <open>
c0107a25:	83 c4 10             	add    $0x10,%esp
c0107a28:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107a2b:	83 ec 08             	sub    $0x8,%esp
c0107a2e:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a31:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107a36:	e8 7d 0b 00 00       	call   c01085b8 <Printf>
c0107a3b:	83 c4 10             	add    $0x10,%esp
c0107a3e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107a45:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a4b:	bb 44 bb 10 c0       	mov    $0xc010bb44,%ebx
c0107a50:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107a55:	8b 0b                	mov    (%ebx),%ecx
c0107a57:	89 08                	mov    %ecx,(%eax)
c0107a59:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107a5d:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107a61:	8d 78 04             	lea    0x4(%eax),%edi
c0107a64:	83 e7 fc             	and    $0xfffffffc,%edi
c0107a67:	29 f8                	sub    %edi,%eax
c0107a69:	29 c3                	sub    %eax,%ebx
c0107a6b:	01 c2                	add    %eax,%edx
c0107a6d:	83 e2 fc             	and    $0xfffffffc,%edx
c0107a70:	89 d0                	mov    %edx,%eax
c0107a72:	c1 e8 02             	shr    $0x2,%eax
c0107a75:	89 de                	mov    %ebx,%esi
c0107a77:	89 c1                	mov    %eax,%ecx
c0107a79:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107a7b:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107a82:	00 00 00 
c0107a85:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107a8c:	00 00 00 
c0107a8f:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107a96:	83 ec 0c             	sub    $0xc,%esp
c0107a99:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a9f:	50                   	push   %eax
c0107aa0:	e8 63 47 00 00       	call   c010c208 <Strlen>
c0107aa5:	83 c4 10             	add    $0x10,%esp
c0107aa8:	83 ec 04             	sub    $0x4,%esp
c0107aab:	50                   	push   %eax
c0107aac:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107ab2:	50                   	push   %eax
c0107ab3:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ab6:	e8 ca d2 ff ff       	call   c0104d85 <write>
c0107abb:	83 c4 10             	add    $0x10,%esp
c0107abe:	83 ec 0c             	sub    $0xc,%esp
c0107ac1:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ac4:	e8 41 d3 ff ff       	call   c0104e0a <close>
c0107ac9:	83 c4 10             	add    $0x10,%esp
c0107acc:	83 ec 08             	sub    $0x8,%esp
c0107acf:	6a 00                	push   $0x0
c0107ad1:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107ad4:	50                   	push   %eax
c0107ad5:	e8 95 d0 ff ff       	call   c0104b6f <open>
c0107ada:	83 c4 10             	add    $0x10,%esp
c0107add:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107ae0:	83 ec 04             	sub    $0x4,%esp
c0107ae3:	68 c8 00 00 00       	push   $0xc8
c0107ae8:	6a 00                	push   $0x0
c0107aea:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107af0:	50                   	push   %eax
c0107af1:	e8 d9 46 00 00       	call   c010c1cf <Memset>
c0107af6:	83 c4 10             	add    $0x10,%esp
c0107af9:	83 ec 0c             	sub    $0xc,%esp
c0107afc:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107b02:	50                   	push   %eax
c0107b03:	e8 00 47 00 00       	call   c010c208 <Strlen>
c0107b08:	83 c4 10             	add    $0x10,%esp
c0107b0b:	83 ec 04             	sub    $0x4,%esp
c0107b0e:	50                   	push   %eax
c0107b0f:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b15:	50                   	push   %eax
c0107b16:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b19:	e8 e6 d0 ff ff       	call   c0104c04 <read>
c0107b1e:	83 c4 10             	add    $0x10,%esp
c0107b21:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107b24:	83 ec 08             	sub    $0x8,%esp
c0107b27:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b2d:	50                   	push   %eax
c0107b2e:	68 18 bb 10 c0       	push   $0xc010bb18
c0107b33:	e8 80 0a 00 00       	call   c01085b8 <Printf>
c0107b38:	83 c4 10             	add    $0x10,%esp
c0107b3b:	83 ec 08             	sub    $0x8,%esp
c0107b3e:	6a 07                	push   $0x7
c0107b40:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107b43:	50                   	push   %eax
c0107b44:	e8 26 d0 ff ff       	call   c0104b6f <open>
c0107b49:	83 c4 10             	add    $0x10,%esp
c0107b4c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107b4f:	83 ec 08             	sub    $0x8,%esp
c0107b52:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b55:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107b5a:	e8 59 0a 00 00       	call   c01085b8 <Printf>
c0107b5f:	83 c4 10             	add    $0x10,%esp
c0107b62:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107b69:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107b70:	20 77 69 
c0107b73:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107b7a:	6c 20 73 
c0107b7d:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107b84:	63 63 65 
c0107b87:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107b8e:	73 20 61 
c0107b91:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107b98:	20 6c 61 
c0107b9b:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107ba2:	74 2e 00 
c0107ba5:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107bac:	00 00 00 
c0107baf:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107bb6:	00 00 
c0107bb8:	83 ec 0c             	sub    $0xc,%esp
c0107bbb:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107bc1:	50                   	push   %eax
c0107bc2:	e8 41 46 00 00       	call   c010c208 <Strlen>
c0107bc7:	83 c4 10             	add    $0x10,%esp
c0107bca:	83 ec 04             	sub    $0x4,%esp
c0107bcd:	50                   	push   %eax
c0107bce:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107bd4:	50                   	push   %eax
c0107bd5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107bd8:	e8 a8 d1 ff ff       	call   c0104d85 <write>
c0107bdd:	83 c4 10             	add    $0x10,%esp
c0107be0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107be7:	eb 7e                	jmp    c0107c67 <TestFS+0x3ec>
c0107be9:	83 ec 0c             	sub    $0xc,%esp
c0107bec:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107bef:	e8 16 d2 ff ff       	call   c0104e0a <close>
c0107bf4:	83 c4 10             	add    $0x10,%esp
c0107bf7:	83 ec 08             	sub    $0x8,%esp
c0107bfa:	6a 00                	push   $0x0
c0107bfc:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107bff:	50                   	push   %eax
c0107c00:	e8 6a cf ff ff       	call   c0104b6f <open>
c0107c05:	83 c4 10             	add    $0x10,%esp
c0107c08:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107c0b:	83 ec 04             	sub    $0x4,%esp
c0107c0e:	6a 1e                	push   $0x1e
c0107c10:	6a 00                	push   $0x0
c0107c12:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c18:	50                   	push   %eax
c0107c19:	e8 b1 45 00 00       	call   c010c1cf <Memset>
c0107c1e:	83 c4 10             	add    $0x10,%esp
c0107c21:	83 ec 0c             	sub    $0xc,%esp
c0107c24:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107c2a:	50                   	push   %eax
c0107c2b:	e8 d8 45 00 00       	call   c010c208 <Strlen>
c0107c30:	83 c4 10             	add    $0x10,%esp
c0107c33:	83 ec 04             	sub    $0x4,%esp
c0107c36:	50                   	push   %eax
c0107c37:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c3d:	50                   	push   %eax
c0107c3e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c41:	e8 be cf ff ff       	call   c0104c04 <read>
c0107c46:	83 c4 10             	add    $0x10,%esp
c0107c49:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107c4c:	83 ec 08             	sub    $0x8,%esp
c0107c4f:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c55:	50                   	push   %eax
c0107c56:	68 23 bb 10 c0       	push   $0xc010bb23
c0107c5b:	e8 58 09 00 00       	call   c01085b8 <Printf>
c0107c60:	83 c4 10             	add    $0x10,%esp
c0107c63:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107c67:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107c6b:	0f 8e 78 ff ff ff    	jle    c0107be9 <TestFS+0x36e>
c0107c71:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107c78:	6e 73 74 
c0107c7b:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107c82:	6c 6c 2e 
c0107c85:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107c8c:	61 72 00 
c0107c8f:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107c96:	00 00 00 
c0107c99:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107ca0:	00 00 00 
c0107ca3:	83 ec 08             	sub    $0x8,%esp
c0107ca6:	6a 00                	push   $0x0
c0107ca8:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107cae:	50                   	push   %eax
c0107caf:	e8 bb ce ff ff       	call   c0104b6f <open>
c0107cb4:	83 c4 10             	add    $0x10,%esp
c0107cb7:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107cba:	83 ec 08             	sub    $0x8,%esp
c0107cbd:	ff 75 bc             	pushl  -0x44(%ebp)
c0107cc0:	68 2e bb 10 c0       	push   $0xc010bb2e
c0107cc5:	e8 ee 08 00 00       	call   c01085b8 <Printf>
c0107cca:	83 c4 10             	add    $0x10,%esp
c0107ccd:	83 ec 04             	sub    $0x4,%esp
c0107cd0:	6a 28                	push   $0x28
c0107cd2:	6a 00                	push   $0x0
c0107cd4:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107cda:	50                   	push   %eax
c0107cdb:	e8 ef 44 00 00       	call   c010c1cf <Memset>
c0107ce0:	83 c4 10             	add    $0x10,%esp
c0107ce3:	83 ec 04             	sub    $0x4,%esp
c0107ce6:	6a 28                	push   $0x28
c0107ce8:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107cee:	50                   	push   %eax
c0107cef:	ff 75 bc             	pushl  -0x44(%ebp)
c0107cf2:	e8 0d cf ff ff       	call   c0104c04 <read>
c0107cf7:	83 c4 10             	add    $0x10,%esp
c0107cfa:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107cfd:	83 ec 08             	sub    $0x8,%esp
c0107d00:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d06:	50                   	push   %eax
c0107d07:	68 38 bb 10 c0       	push   $0xc010bb38
c0107d0c:	e8 a7 08 00 00       	call   c01085b8 <Printf>
c0107d11:	83 c4 10             	add    $0x10,%esp
c0107d14:	90                   	nop
c0107d15:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107d18:	5b                   	pop    %ebx
c0107d19:	5e                   	pop    %esi
c0107d1a:	5f                   	pop    %edi
c0107d1b:	5d                   	pop    %ebp
c0107d1c:	c3                   	ret    

c0107d1d <wait_exit>:
c0107d1d:	55                   	push   %ebp
c0107d1e:	89 e5                	mov    %esp,%ebp
c0107d20:	83 ec 28             	sub    $0x28,%esp
c0107d23:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107d2a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107d31:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107d37:	83 ec 08             	sub    $0x8,%esp
c0107d3a:	6a 02                	push   $0x2
c0107d3c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d3f:	50                   	push   %eax
c0107d40:	e8 2a ce ff ff       	call   c0104b6f <open>
c0107d45:	83 c4 10             	add    $0x10,%esp
c0107d48:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107d4b:	83 ec 08             	sub    $0x8,%esp
c0107d4e:	6a 02                	push   $0x2
c0107d50:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d53:	50                   	push   %eax
c0107d54:	e8 16 ce ff ff       	call   c0104b6f <open>
c0107d59:	83 c4 10             	add    $0x10,%esp
c0107d5c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107d5f:	e8 6b d1 ff ff       	call   c0104ecf <fork>
c0107d64:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107d67:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107d6b:	7e 35                	jle    c0107da2 <wait_exit+0x85>
c0107d6d:	83 ec 0c             	sub    $0xc,%esp
c0107d70:	68 0c bc 10 c0       	push   $0xc010bc0c
c0107d75:	e8 3e 08 00 00       	call   c01085b8 <Printf>
c0107d7a:	83 c4 10             	add    $0x10,%esp
c0107d7d:	83 ec 0c             	sub    $0xc,%esp
c0107d80:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107d83:	50                   	push   %eax
c0107d84:	e8 d3 d0 ff ff       	call   c0104e5c <wait>
c0107d89:	83 c4 10             	add    $0x10,%esp
c0107d8c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107d8f:	83 ec 08             	sub    $0x8,%esp
c0107d92:	50                   	push   %eax
c0107d93:	68 24 bc 10 c0       	push   $0xc010bc24
c0107d98:	e8 1b 08 00 00       	call   c01085b8 <Printf>
c0107d9d:	83 c4 10             	add    $0x10,%esp
c0107da0:	eb fe                	jmp    c0107da0 <wait_exit+0x83>
c0107da2:	83 ec 0c             	sub    $0xc,%esp
c0107da5:	68 3f bc 10 c0       	push   $0xc010bc3f
c0107daa:	e8 09 08 00 00       	call   c01085b8 <Printf>
c0107daf:	83 c4 10             	add    $0x10,%esp
c0107db2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107dbc:	8d 50 01             	lea    0x1(%eax),%edx
c0107dbf:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107dc2:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107dc7:	7f 02                	jg     c0107dcb <wait_exit+0xae>
c0107dc9:	eb ee                	jmp    c0107db9 <wait_exit+0x9c>
c0107dcb:	90                   	nop
c0107dcc:	83 ec 0c             	sub    $0xc,%esp
c0107dcf:	68 4b bc 10 c0       	push   $0xc010bc4b
c0107dd4:	e8 df 07 00 00       	call   c01085b8 <Printf>
c0107dd9:	83 c4 10             	add    $0x10,%esp
c0107ddc:	83 ec 0c             	sub    $0xc,%esp
c0107ddf:	68 59 bc 10 c0       	push   $0xc010bc59
c0107de4:	e8 cf 07 00 00       	call   c01085b8 <Printf>
c0107de9:	83 c4 10             	add    $0x10,%esp
c0107dec:	83 ec 0c             	sub    $0xc,%esp
c0107def:	68 68 bc 10 c0       	push   $0xc010bc68
c0107df4:	e8 bf 07 00 00       	call   c01085b8 <Printf>
c0107df9:	83 c4 10             	add    $0x10,%esp
c0107dfc:	83 ec 0c             	sub    $0xc,%esp
c0107dff:	6a 5a                	push   $0x5a
c0107e01:	e8 9a d0 ff ff       	call   c0104ea0 <exit>
c0107e06:	83 c4 10             	add    $0x10,%esp
c0107e09:	83 ec 0c             	sub    $0xc,%esp
c0107e0c:	68 77 bc 10 c0       	push   $0xc010bc77
c0107e11:	e8 a2 07 00 00       	call   c01085b8 <Printf>
c0107e16:	83 c4 10             	add    $0x10,%esp
c0107e19:	eb fe                	jmp    c0107e19 <wait_exit+0xfc>

c0107e1b <INIT_fork>:
c0107e1b:	55                   	push   %ebp
c0107e1c:	89 e5                	mov    %esp,%ebp
c0107e1e:	83 ec 78             	sub    $0x78,%esp
c0107e21:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107e28:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107e2f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107e35:	83 ec 08             	sub    $0x8,%esp
c0107e38:	6a 02                	push   $0x2
c0107e3a:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107e3d:	50                   	push   %eax
c0107e3e:	e8 2c cd ff ff       	call   c0104b6f <open>
c0107e43:	83 c4 10             	add    $0x10,%esp
c0107e46:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107e49:	83 ec 08             	sub    $0x8,%esp
c0107e4c:	6a 02                	push   $0x2
c0107e4e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107e51:	50                   	push   %eax
c0107e52:	e8 18 cd ff ff       	call   c0104b6f <open>
c0107e57:	83 c4 10             	add    $0x10,%esp
c0107e5a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107e5d:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107e64:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107e6b:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107e72:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107e79:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107e80:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107e87:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107e8e:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107e95:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107e9c:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107ea3:	83 ec 0c             	sub    $0xc,%esp
c0107ea6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107ea9:	50                   	push   %eax
c0107eaa:	e8 09 07 00 00       	call   c01085b8 <Printf>
c0107eaf:	83 c4 10             	add    $0x10,%esp
c0107eb2:	83 ec 0c             	sub    $0xc,%esp
c0107eb5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107eb8:	50                   	push   %eax
c0107eb9:	e8 4a 43 00 00       	call   c010c208 <Strlen>
c0107ebe:	83 c4 10             	add    $0x10,%esp
c0107ec1:	83 ec 04             	sub    $0x4,%esp
c0107ec4:	50                   	push   %eax
c0107ec5:	6a 00                	push   $0x0
c0107ec7:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107eca:	50                   	push   %eax
c0107ecb:	e8 ff 42 00 00       	call   c010c1cf <Memset>
c0107ed0:	83 c4 10             	add    $0x10,%esp
c0107ed3:	83 ec 04             	sub    $0x4,%esp
c0107ed6:	6a 28                	push   $0x28
c0107ed8:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107edb:	50                   	push   %eax
c0107edc:	ff 75 f0             	pushl  -0x10(%ebp)
c0107edf:	e8 20 cd ff ff       	call   c0104c04 <read>
c0107ee4:	83 c4 10             	add    $0x10,%esp
c0107ee7:	83 ec 0c             	sub    $0xc,%esp
c0107eea:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107eed:	50                   	push   %eax
c0107eee:	e8 c5 06 00 00       	call   c01085b8 <Printf>
c0107ef3:	83 c4 10             	add    $0x10,%esp
c0107ef6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107efd:	e8 cd cf ff ff       	call   c0104ecf <fork>
c0107f02:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107f05:	83 ec 0c             	sub    $0xc,%esp
c0107f08:	6a 01                	push   $0x1
c0107f0a:	e8 75 05 00 00       	call   c0108484 <delay>
c0107f0f:	83 c4 10             	add    $0x10,%esp
c0107f12:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107f16:	0f 8e cd 00 00 00    	jle    c0107fe9 <INIT_fork+0x1ce>
c0107f1c:	83 ec 08             	sub    $0x8,%esp
c0107f1f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107f22:	68 85 bc 10 c0       	push   $0xc010bc85
c0107f27:	e8 8c 06 00 00       	call   c01085b8 <Printf>
c0107f2c:	83 c4 10             	add    $0x10,%esp
c0107f2f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107f33:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107f3a:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107f41:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107f48:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107f4f:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107f56:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107f5d:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107f64:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107f6b:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107f72:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107f79:	83 ec 0c             	sub    $0xc,%esp
c0107f7c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f7f:	50                   	push   %eax
c0107f80:	e8 83 42 00 00       	call   c010c208 <Strlen>
c0107f85:	83 c4 10             	add    $0x10,%esp
c0107f88:	83 ec 04             	sub    $0x4,%esp
c0107f8b:	50                   	push   %eax
c0107f8c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f8f:	50                   	push   %eax
c0107f90:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f93:	e8 ed cd ff ff       	call   c0104d85 <write>
c0107f98:	83 c4 10             	add    $0x10,%esp
c0107f9b:	e8 b2 ec ff ff       	call   c0106c52 <catch_error>
c0107fa0:	83 ec 0c             	sub    $0xc,%esp
c0107fa3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fa6:	50                   	push   %eax
c0107fa7:	e8 5c 42 00 00       	call   c010c208 <Strlen>
c0107fac:	83 c4 10             	add    $0x10,%esp
c0107faf:	83 ec 04             	sub    $0x4,%esp
c0107fb2:	50                   	push   %eax
c0107fb3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fb6:	50                   	push   %eax
c0107fb7:	ff 75 f4             	pushl  -0xc(%ebp)
c0107fba:	e8 c6 cd ff ff       	call   c0104d85 <write>
c0107fbf:	83 c4 10             	add    $0x10,%esp
c0107fc2:	83 ec 0c             	sub    $0xc,%esp
c0107fc5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fc8:	50                   	push   %eax
c0107fc9:	e8 3a 42 00 00       	call   c010c208 <Strlen>
c0107fce:	83 c4 10             	add    $0x10,%esp
c0107fd1:	83 ec 04             	sub    $0x4,%esp
c0107fd4:	50                   	push   %eax
c0107fd5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fd8:	50                   	push   %eax
c0107fd9:	ff 75 f4             	pushl  -0xc(%ebp)
c0107fdc:	e8 a4 cd ff ff       	call   c0104d85 <write>
c0107fe1:	83 c4 10             	add    $0x10,%esp
c0107fe4:	e9 d6 00 00 00       	jmp    c01080bf <INIT_fork+0x2a4>
c0107fe9:	83 ec 08             	sub    $0x8,%esp
c0107fec:	ff 75 e8             	pushl  -0x18(%ebp)
c0107fef:	68 85 bc 10 c0       	push   $0xc010bc85
c0107ff4:	e8 bf 05 00 00       	call   c01085b8 <Printf>
c0107ff9:	83 c4 10             	add    $0x10,%esp
c0107ffc:	83 ec 0c             	sub    $0xc,%esp
c0107fff:	6a 01                	push   $0x1
c0108001:	e8 7e 04 00 00       	call   c0108484 <delay>
c0108006:	83 c4 10             	add    $0x10,%esp
c0108009:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010800d:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0108011:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0108018:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c010801f:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0108026:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c010802d:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0108034:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c010803b:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0108042:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0108049:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108050:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108057:	83 ec 0c             	sub    $0xc,%esp
c010805a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010805d:	50                   	push   %eax
c010805e:	e8 a5 41 00 00       	call   c010c208 <Strlen>
c0108063:	83 c4 10             	add    $0x10,%esp
c0108066:	83 ec 04             	sub    $0x4,%esp
c0108069:	50                   	push   %eax
c010806a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010806d:	50                   	push   %eax
c010806e:	ff 75 f4             	pushl  -0xc(%ebp)
c0108071:	e8 0f cd ff ff       	call   c0104d85 <write>
c0108076:	83 c4 10             	add    $0x10,%esp
c0108079:	83 ec 0c             	sub    $0xc,%esp
c010807c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010807f:	50                   	push   %eax
c0108080:	e8 83 41 00 00       	call   c010c208 <Strlen>
c0108085:	83 c4 10             	add    $0x10,%esp
c0108088:	83 ec 04             	sub    $0x4,%esp
c010808b:	50                   	push   %eax
c010808c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010808f:	50                   	push   %eax
c0108090:	ff 75 f4             	pushl  -0xc(%ebp)
c0108093:	e8 ed cc ff ff       	call   c0104d85 <write>
c0108098:	83 c4 10             	add    $0x10,%esp
c010809b:	83 ec 0c             	sub    $0xc,%esp
c010809e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080a1:	50                   	push   %eax
c01080a2:	e8 61 41 00 00       	call   c010c208 <Strlen>
c01080a7:	83 c4 10             	add    $0x10,%esp
c01080aa:	83 ec 04             	sub    $0x4,%esp
c01080ad:	50                   	push   %eax
c01080ae:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080b1:	50                   	push   %eax
c01080b2:	ff 75 f4             	pushl  -0xc(%ebp)
c01080b5:	e8 cb cc ff ff       	call   c0104d85 <write>
c01080ba:	83 c4 10             	add    $0x10,%esp
c01080bd:	eb fe                	jmp    c01080bd <INIT_fork+0x2a2>
c01080bf:	83 ec 04             	sub    $0x4,%esp
c01080c2:	6a 28                	push   $0x28
c01080c4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080c7:	50                   	push   %eax
c01080c8:	ff 75 f0             	pushl  -0x10(%ebp)
c01080cb:	e8 34 cb ff ff       	call   c0104c04 <read>
c01080d0:	83 c4 10             	add    $0x10,%esp
c01080d3:	83 ec 0c             	sub    $0xc,%esp
c01080d6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080d9:	50                   	push   %eax
c01080da:	e8 d9 04 00 00       	call   c01085b8 <Printf>
c01080df:	83 c4 10             	add    $0x10,%esp
c01080e2:	83 ec 0c             	sub    $0xc,%esp
c01080e5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080e8:	50                   	push   %eax
c01080e9:	e8 ca 04 00 00       	call   c01085b8 <Printf>
c01080ee:	83 c4 10             	add    $0x10,%esp
c01080f1:	83 ec 0c             	sub    $0xc,%esp
c01080f4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080f7:	50                   	push   %eax
c01080f8:	e8 bb 04 00 00       	call   c01085b8 <Printf>
c01080fd:	83 c4 10             	add    $0x10,%esp
c0108100:	83 ec 0c             	sub    $0xc,%esp
c0108103:	68 8f bc 10 c0       	push   $0xc010bc8f
c0108108:	e8 c4 07 00 00       	call   c01088d1 <spin>
c010810d:	83 c4 10             	add    $0x10,%esp
c0108110:	90                   	nop
c0108111:	c9                   	leave  
c0108112:	c3                   	ret    

c0108113 <simple_shell>:
c0108113:	55                   	push   %ebp
c0108114:	89 e5                	mov    %esp,%ebp
c0108116:	57                   	push   %edi
c0108117:	83 ec 64             	sub    $0x64,%esp
c010811a:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0108121:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0108128:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c010812e:	83 ec 08             	sub    $0x8,%esp
c0108131:	6a 02                	push   $0x2
c0108133:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108136:	50                   	push   %eax
c0108137:	e8 33 ca ff ff       	call   c0104b6f <open>
c010813c:	83 c4 10             	add    $0x10,%esp
c010813f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108142:	83 ec 08             	sub    $0x8,%esp
c0108145:	6a 02                	push   $0x2
c0108147:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c010814a:	50                   	push   %eax
c010814b:	e8 1f ca ff ff       	call   c0104b6f <open>
c0108150:	83 c4 10             	add    $0x10,%esp
c0108153:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108156:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0108159:	b8 00 00 00 00       	mov    $0x0,%eax
c010815e:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0108163:	89 d7                	mov    %edx,%edi
c0108165:	f3 ab                	rep stos %eax,%es:(%edi)
c0108167:	c7 45 a8 97 bc 10 c0 	movl   $0xc010bc97,-0x58(%ebp)
c010816e:	c7 45 ac 9c bc 10 c0 	movl   $0xc010bc9c,-0x54(%ebp)
c0108175:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010817c:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0108183:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c010818a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010818d:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c0108194:	00 
c0108195:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0108198:	85 c0                	test   %eax,%eax
c010819a:	75 1c                	jne    c01081b8 <simple_shell+0xa5>
c010819c:	68 0e 03 00 00       	push   $0x30e
c01081a1:	68 61 ba 10 c0       	push   $0xc010ba61
c01081a6:	68 61 ba 10 c0       	push   $0xc010ba61
c01081ab:	68 a2 bc 10 c0       	push   $0xc010bca2
c01081b0:	e8 60 07 00 00       	call   c0108915 <assertion_failure>
c01081b5:	83 c4 10             	add    $0x10,%esp
c01081b8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01081bb:	83 ec 08             	sub    $0x8,%esp
c01081be:	6a 02                	push   $0x2
c01081c0:	50                   	push   %eax
c01081c1:	e8 a9 c9 ff ff       	call   c0104b6f <open>
c01081c6:	83 c4 10             	add    $0x10,%esp
c01081c9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01081cc:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c01081d0:	75 4b                	jne    c010821d <simple_shell+0x10a>
c01081d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01081d9:	eb 26                	jmp    c0108201 <simple_shell+0xee>
c01081db:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01081de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01081e1:	01 d0                	add    %edx,%eax
c01081e3:	0f b6 00             	movzbl (%eax),%eax
c01081e6:	0f be c0             	movsbl %al,%eax
c01081e9:	83 ec 04             	sub    $0x4,%esp
c01081ec:	50                   	push   %eax
c01081ed:	ff 75 f4             	pushl  -0xc(%ebp)
c01081f0:	68 b1 bc 10 c0       	push   $0xc010bcb1
c01081f5:	e8 be 03 00 00       	call   c01085b8 <Printf>
c01081fa:	83 c4 10             	add    $0x10,%esp
c01081fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108201:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0108205:	7e d4                	jle    c01081db <simple_shell+0xc8>
c0108207:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010820a:	83 ec 08             	sub    $0x8,%esp
c010820d:	50                   	push   %eax
c010820e:	68 b8 bc 10 c0       	push   $0xc010bcb8
c0108213:	e8 a0 03 00 00       	call   c01085b8 <Printf>
c0108218:	83 c4 10             	add    $0x10,%esp
c010821b:	eb 78                	jmp    c0108295 <simple_shell+0x182>
c010821d:	83 ec 0c             	sub    $0xc,%esp
c0108220:	68 be bc 10 c0       	push   $0xc010bcbe
c0108225:	e8 8e 03 00 00       	call   c01085b8 <Printf>
c010822a:	83 c4 10             	add    $0x10,%esp
c010822d:	e8 9d cc ff ff       	call   c0104ecf <fork>
c0108232:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108235:	83 ec 0c             	sub    $0xc,%esp
c0108238:	68 d3 bc 10 c0       	push   $0xc010bcd3
c010823d:	e8 76 03 00 00       	call   c01085b8 <Printf>
c0108242:	83 c4 10             	add    $0x10,%esp
c0108245:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0108249:	7e 11                	jle    c010825c <simple_shell+0x149>
c010824b:	83 ec 0c             	sub    $0xc,%esp
c010824e:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0108251:	50                   	push   %eax
c0108252:	e8 05 cc ff ff       	call   c0104e5c <wait>
c0108257:	83 c4 10             	add    $0x10,%esp
c010825a:	eb 39                	jmp    c0108295 <simple_shell+0x182>
c010825c:	83 ec 0c             	sub    $0xc,%esp
c010825f:	68 e8 bc 10 c0       	push   $0xc010bce8
c0108264:	e8 4f 03 00 00       	call   c01085b8 <Printf>
c0108269:	83 c4 10             	add    $0x10,%esp
c010826c:	83 ec 0c             	sub    $0xc,%esp
c010826f:	ff 75 e0             	pushl  -0x20(%ebp)
c0108272:	e8 93 cb ff ff       	call   c0104e0a <close>
c0108277:	83 c4 10             	add    $0x10,%esp
c010827a:	6a 00                	push   $0x0
c010827c:	68 9c bc 10 c0       	push   $0xc010bc9c
c0108281:	68 97 bc 10 c0       	push   $0xc010bc97
c0108286:	68 04 bd 10 c0       	push   $0xc010bd04
c010828b:	e8 12 cf ff ff       	call   c01051a2 <execl>
c0108290:	83 c4 10             	add    $0x10,%esp
c0108293:	eb fe                	jmp    c0108293 <simple_shell+0x180>
c0108295:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0108298:	c9                   	leave  
c0108299:	c3                   	ret    

c010829a <test_shell>:
c010829a:	55                   	push   %ebp
c010829b:	89 e5                	mov    %esp,%ebp
c010829d:	83 ec 38             	sub    $0x38,%esp
c01082a0:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c01082a7:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c01082ae:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c01082b4:	83 ec 08             	sub    $0x8,%esp
c01082b7:	6a 02                	push   $0x2
c01082b9:	8d 45 ea             	lea    -0x16(%ebp),%eax
c01082bc:	50                   	push   %eax
c01082bd:	e8 ad c8 ff ff       	call   c0104b6f <open>
c01082c2:	83 c4 10             	add    $0x10,%esp
c01082c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01082c8:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c01082cf:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c01082d6:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c01082dd:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01082e4:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c01082eb:	83 ec 0c             	sub    $0xc,%esp
c01082ee:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c01082f1:	50                   	push   %eax
c01082f2:	e8 38 ea ff ff       	call   c0106d2f <untar>
c01082f7:	83 c4 10             	add    $0x10,%esp
c01082fa:	e8 14 fe ff ff       	call   c0108113 <simple_shell>
c01082ff:	90                   	nop
c0108300:	c9                   	leave  
c0108301:	c3                   	ret    

c0108302 <test_exec>:
c0108302:	55                   	push   %ebp
c0108303:	89 e5                	mov    %esp,%ebp
c0108305:	83 ec 38             	sub    $0x38,%esp
c0108308:	83 ec 0c             	sub    $0xc,%esp
c010830b:	68 0a bd 10 c0       	push   $0xc010bd0a
c0108310:	e8 77 7d ff ff       	call   c010008c <disp_str>
c0108315:	83 c4 10             	add    $0x10,%esp
c0108318:	83 ec 0c             	sub    $0xc,%esp
c010831b:	68 1c bd 10 c0       	push   $0xc010bd1c
c0108320:	e8 67 7d ff ff       	call   c010008c <disp_str>
c0108325:	83 c4 10             	add    $0x10,%esp
c0108328:	83 ec 0c             	sub    $0xc,%esp
c010832b:	6a 07                	push   $0x7
c010832d:	e8 b8 ed ff ff       	call   c01070ea <disp_int>
c0108332:	83 c4 10             	add    $0x10,%esp
c0108335:	83 ec 0c             	sub    $0xc,%esp
c0108338:	68 00 b6 10 c0       	push   $0xc010b600
c010833d:	e8 4a 7d ff ff       	call   c010008c <disp_str>
c0108342:	83 c4 10             	add    $0x10,%esp
c0108345:	83 ec 0c             	sub    $0xc,%esp
c0108348:	68 02 b6 10 c0       	push   $0xc010b602
c010834d:	e8 3a 7d ff ff       	call   c010008c <disp_str>
c0108352:	83 c4 10             	add    $0x10,%esp
c0108355:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c010835c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108363:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0108369:	83 ec 08             	sub    $0x8,%esp
c010836c:	6a 02                	push   $0x2
c010836e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108371:	50                   	push   %eax
c0108372:	e8 f8 c7 ff ff       	call   c0104b6f <open>
c0108377:	83 c4 10             	add    $0x10,%esp
c010837a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010837d:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0108384:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c010838b:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0108392:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0108399:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01083a0:	83 ec 0c             	sub    $0xc,%esp
c01083a3:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01083a6:	50                   	push   %eax
c01083a7:	e8 83 e9 ff ff       	call   c0106d2f <untar>
c01083ac:	83 c4 10             	add    $0x10,%esp
c01083af:	83 ec 08             	sub    $0x8,%esp
c01083b2:	6a 00                	push   $0x0
c01083b4:	68 2f bd 10 c0       	push   $0xc010bd2f
c01083b9:	68 33 bd 10 c0       	push   $0xc010bd33
c01083be:	68 9c bc 10 c0       	push   $0xc010bc9c
c01083c3:	68 97 bc 10 c0       	push   $0xc010bc97
c01083c8:	68 04 bd 10 c0       	push   $0xc010bd04
c01083cd:	e8 d0 cd ff ff       	call   c01051a2 <execl>
c01083d2:	83 c4 20             	add    $0x20,%esp
c01083d5:	e8 34 e8 ff ff       	call   c0106c0e <stop_here>
c01083da:	e8 f0 ca ff ff       	call   c0104ecf <fork>
c01083df:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01083e2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01083e6:	7e 25                	jle    c010840d <test_exec+0x10b>
c01083e8:	83 ec 0c             	sub    $0xc,%esp
c01083eb:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01083ee:	50                   	push   %eax
c01083ef:	e8 68 ca ff ff       	call   c0104e5c <wait>
c01083f4:	83 c4 10             	add    $0x10,%esp
c01083f7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01083fa:	83 ec 08             	sub    $0x8,%esp
c01083fd:	50                   	push   %eax
c01083fe:	68 39 bd 10 c0       	push   $0xc010bd39
c0108403:	e8 b0 01 00 00       	call   c01085b8 <Printf>
c0108408:	83 c4 10             	add    $0x10,%esp
c010840b:	eb 33                	jmp    c0108440 <test_exec+0x13e>
c010840d:	83 ec 0c             	sub    $0xc,%esp
c0108410:	68 4b bd 10 c0       	push   $0xc010bd4b
c0108415:	e8 9e 01 00 00       	call   c01085b8 <Printf>
c010841a:	83 c4 10             	add    $0x10,%esp
c010841d:	83 ec 0c             	sub    $0xc,%esp
c0108420:	6a 00                	push   $0x0
c0108422:	68 33 bd 10 c0       	push   $0xc010bd33
c0108427:	68 9c bc 10 c0       	push   $0xc010bc9c
c010842c:	68 97 bc 10 c0       	push   $0xc010bc97
c0108431:	68 04 bd 10 c0       	push   $0xc010bd04
c0108436:	e8 67 cd ff ff       	call   c01051a2 <execl>
c010843b:	83 c4 20             	add    $0x20,%esp
c010843e:	eb fe                	jmp    c010843e <test_exec+0x13c>
c0108440:	c9                   	leave  
c0108441:	c3                   	ret    

c0108442 <INIT>:
c0108442:	55                   	push   %ebp
c0108443:	89 e5                	mov    %esp,%ebp
c0108445:	83 ec 08             	sub    $0x8,%esp
c0108448:	e8 4d fe ff ff       	call   c010829a <test_shell>
c010844d:	eb fe                	jmp    c010844d <INIT+0xb>

c010844f <TestA>:
c010844f:	55                   	push   %ebp
c0108450:	89 e5                	mov    %esp,%ebp
c0108452:	83 ec 08             	sub    $0x8,%esp
c0108455:	83 ec 0c             	sub    $0xc,%esp
c0108458:	6a 05                	push   $0x5
c010845a:	e8 8b ec ff ff       	call   c01070ea <disp_int>
c010845f:	83 c4 10             	add    $0x10,%esp
c0108462:	83 ec 0c             	sub    $0xc,%esp
c0108465:	68 13 b7 10 c0       	push   $0xc010b713
c010846a:	e8 1d 7c ff ff       	call   c010008c <disp_str>
c010846f:	83 c4 10             	add    $0x10,%esp
c0108472:	83 ec 0c             	sub    $0xc,%esp
c0108475:	68 59 bd 10 c0       	push   $0xc010bd59
c010847a:	e8 0d 7c ff ff       	call   c010008c <disp_str>
c010847f:	83 c4 10             	add    $0x10,%esp
c0108482:	eb fe                	jmp    c0108482 <TestA+0x33>

c0108484 <delay>:
c0108484:	55                   	push   %ebp
c0108485:	89 e5                	mov    %esp,%ebp
c0108487:	83 ec 10             	sub    $0x10,%esp
c010848a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108491:	eb 2a                	jmp    c01084bd <delay+0x39>
c0108493:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c010849a:	eb 17                	jmp    c01084b3 <delay+0x2f>
c010849c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084a3:	eb 04                	jmp    c01084a9 <delay+0x25>
c01084a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01084a9:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01084ad:	7e f6                	jle    c01084a5 <delay+0x21>
c01084af:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01084b3:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c01084b7:	7e e3                	jle    c010849c <delay+0x18>
c01084b9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01084bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01084c0:	3b 45 08             	cmp    0x8(%ebp),%eax
c01084c3:	7c ce                	jl     c0108493 <delay+0xf>
c01084c5:	90                   	nop
c01084c6:	c9                   	leave  
c01084c7:	c3                   	ret    

c01084c8 <TestB>:
c01084c8:	55                   	push   %ebp
c01084c9:	89 e5                	mov    %esp,%ebp
c01084cb:	83 ec 08             	sub    $0x8,%esp
c01084ce:	83 ec 0c             	sub    $0xc,%esp
c01084d1:	68 60 bd 10 c0       	push   $0xc010bd60
c01084d6:	e8 b1 7b ff ff       	call   c010008c <disp_str>
c01084db:	83 c4 10             	add    $0x10,%esp
c01084de:	eb fe                	jmp    c01084de <TestB+0x16>

c01084e0 <TestC>:
c01084e0:	55                   	push   %ebp
c01084e1:	89 e5                	mov    %esp,%ebp
c01084e3:	83 ec 18             	sub    $0x18,%esp
c01084e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084ed:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c01084f1:	77 1a                	ja     c010850d <TestC+0x2d>
c01084f3:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c01084fa:	83 ec 08             	sub    $0x8,%esp
c01084fd:	ff 75 f0             	pushl  -0x10(%ebp)
c0108500:	68 63 bd 10 c0       	push   $0xc010bd63
c0108505:	e8 ae 00 00 00       	call   c01085b8 <Printf>
c010850a:	83 c4 10             	add    $0x10,%esp
c010850d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108511:	eb da                	jmp    c01084ed <TestC+0xd>

c0108513 <sys_get_ticks>:
c0108513:	55                   	push   %ebp
c0108514:	89 e5                	mov    %esp,%ebp
c0108516:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010851b:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108521:	5d                   	pop    %ebp
c0108522:	c3                   	ret    

c0108523 <sys_write>:
c0108523:	55                   	push   %ebp
c0108524:	89 e5                	mov    %esp,%ebp
c0108526:	83 ec 18             	sub    $0x18,%esp
c0108529:	8b 45 10             	mov    0x10(%ebp),%eax
c010852c:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108532:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108538:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010853d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108540:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108543:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108546:	8b 45 08             	mov    0x8(%ebp),%eax
c0108549:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010854c:	eb 20                	jmp    c010856e <sys_write+0x4b>
c010854e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108551:	0f b6 00             	movzbl (%eax),%eax
c0108554:	0f b6 c0             	movzbl %al,%eax
c0108557:	83 ec 08             	sub    $0x8,%esp
c010855a:	50                   	push   %eax
c010855b:	ff 75 ec             	pushl  -0x14(%ebp)
c010855e:	e8 7d b9 ff ff       	call   c0103ee0 <out_char>
c0108563:	83 c4 10             	add    $0x10,%esp
c0108566:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010856a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c010856e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108572:	7f da                	jg     c010854e <sys_write+0x2b>
c0108574:	90                   	nop
c0108575:	c9                   	leave  
c0108576:	c3                   	ret    

c0108577 <milli_delay>:
c0108577:	55                   	push   %ebp
c0108578:	89 e5                	mov    %esp,%ebp
c010857a:	83 ec 18             	sub    $0x18,%esp
c010857d:	e8 8a 11 00 00       	call   c010970c <get_ticks_ipc>
c0108582:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108585:	90                   	nop
c0108586:	e8 81 11 00 00       	call   c010970c <get_ticks_ipc>
c010858b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c010858e:	89 c1                	mov    %eax,%ecx
c0108590:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0108595:	89 c8                	mov    %ecx,%eax
c0108597:	f7 ea                	imul   %edx
c0108599:	c1 fa 05             	sar    $0x5,%edx
c010859c:	89 c8                	mov    %ecx,%eax
c010859e:	c1 f8 1f             	sar    $0x1f,%eax
c01085a1:	29 c2                	sub    %eax,%edx
c01085a3:	89 d0                	mov    %edx,%eax
c01085a5:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c01085ab:	39 45 08             	cmp    %eax,0x8(%ebp)
c01085ae:	77 d6                	ja     c0108586 <milli_delay+0xf>
c01085b0:	90                   	nop
c01085b1:	c9                   	leave  
c01085b2:	c3                   	ret    

c01085b3 <TaskSys>:
c01085b3:	55                   	push   %ebp
c01085b4:	89 e5                	mov    %esp,%ebp
c01085b6:	eb fe                	jmp    c01085b6 <TaskSys+0x3>

c01085b8 <Printf>:
c01085b8:	55                   	push   %ebp
c01085b9:	89 e5                	mov    %esp,%ebp
c01085bb:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01085c1:	83 ec 04             	sub    $0x4,%esp
c01085c4:	68 00 01 00 00       	push   $0x100
c01085c9:	6a 00                	push   $0x0
c01085cb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01085d1:	50                   	push   %eax
c01085d2:	e8 f8 3b 00 00       	call   c010c1cf <Memset>
c01085d7:	83 c4 10             	add    $0x10,%esp
c01085da:	8d 45 0c             	lea    0xc(%ebp),%eax
c01085dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01085e3:	83 ec 04             	sub    $0x4,%esp
c01085e6:	ff 75 f4             	pushl  -0xc(%ebp)
c01085e9:	50                   	push   %eax
c01085ea:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01085f0:	50                   	push   %eax
c01085f1:	e8 20 00 00 00       	call   c0108616 <vsprintf>
c01085f6:	83 c4 10             	add    $0x10,%esp
c01085f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01085fc:	83 ec 04             	sub    $0x4,%esp
c01085ff:	ff 75 f0             	pushl  -0x10(%ebp)
c0108602:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108608:	50                   	push   %eax
c0108609:	6a 00                	push   $0x0
c010860b:	e8 75 c7 ff ff       	call   c0104d85 <write>
c0108610:	83 c4 10             	add    $0x10,%esp
c0108613:	90                   	nop
c0108614:	c9                   	leave  
c0108615:	c3                   	ret    

c0108616 <vsprintf>:
c0108616:	55                   	push   %ebp
c0108617:	89 e5                	mov    %esp,%ebp
c0108619:	81 ec 68 02 00 00    	sub    $0x268,%esp
c010861f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108625:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010862b:	83 ec 04             	sub    $0x4,%esp
c010862e:	6a 40                	push   $0x40
c0108630:	6a 00                	push   $0x0
c0108632:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108638:	50                   	push   %eax
c0108639:	e8 91 3b 00 00       	call   c010c1cf <Memset>
c010863e:	83 c4 10             	add    $0x10,%esp
c0108641:	8b 45 10             	mov    0x10(%ebp),%eax
c0108644:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108647:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010864e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108651:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108654:	e9 53 01 00 00       	jmp    c01087ac <vsprintf+0x196>
c0108659:	8b 45 0c             	mov    0xc(%ebp),%eax
c010865c:	0f b6 00             	movzbl (%eax),%eax
c010865f:	3c 25                	cmp    $0x25,%al
c0108661:	74 16                	je     c0108679 <vsprintf+0x63>
c0108663:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108666:	8d 50 01             	lea    0x1(%eax),%edx
c0108669:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010866c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010866f:	0f b6 12             	movzbl (%edx),%edx
c0108672:	88 10                	mov    %dl,(%eax)
c0108674:	e9 2f 01 00 00       	jmp    c01087a8 <vsprintf+0x192>
c0108679:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010867d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108680:	0f b6 00             	movzbl (%eax),%eax
c0108683:	0f be c0             	movsbl %al,%eax
c0108686:	83 f8 64             	cmp    $0x64,%eax
c0108689:	74 26                	je     c01086b1 <vsprintf+0x9b>
c010868b:	83 f8 64             	cmp    $0x64,%eax
c010868e:	7f 0e                	jg     c010869e <vsprintf+0x88>
c0108690:	83 f8 63             	cmp    $0x63,%eax
c0108693:	0f 84 f2 00 00 00    	je     c010878b <vsprintf+0x175>
c0108699:	e9 0a 01 00 00       	jmp    c01087a8 <vsprintf+0x192>
c010869e:	83 f8 73             	cmp    $0x73,%eax
c01086a1:	0f 84 b0 00 00 00    	je     c0108757 <vsprintf+0x141>
c01086a7:	83 f8 78             	cmp    $0x78,%eax
c01086aa:	74 5d                	je     c0108709 <vsprintf+0xf3>
c01086ac:	e9 f7 00 00 00       	jmp    c01087a8 <vsprintf+0x192>
c01086b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086b4:	8b 00                	mov    (%eax),%eax
c01086b6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01086b9:	83 ec 04             	sub    $0x4,%esp
c01086bc:	6a 0a                	push   $0xa
c01086be:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01086c4:	50                   	push   %eax
c01086c5:	ff 75 e8             	pushl  -0x18(%ebp)
c01086c8:	e8 96 10 00 00       	call   c0109763 <itoa>
c01086cd:	83 c4 10             	add    $0x10,%esp
c01086d0:	83 ec 08             	sub    $0x8,%esp
c01086d3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01086d9:	50                   	push   %eax
c01086da:	ff 75 f4             	pushl  -0xc(%ebp)
c01086dd:	e8 0c 3b 00 00       	call   c010c1ee <Strcpy>
c01086e2:	83 c4 10             	add    $0x10,%esp
c01086e5:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01086e9:	83 ec 0c             	sub    $0xc,%esp
c01086ec:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01086f2:	50                   	push   %eax
c01086f3:	e8 10 3b 00 00       	call   c010c208 <Strlen>
c01086f8:	83 c4 10             	add    $0x10,%esp
c01086fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01086fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108701:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108704:	e9 9f 00 00 00       	jmp    c01087a8 <vsprintf+0x192>
c0108709:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010870c:	8b 00                	mov    (%eax),%eax
c010870e:	83 ec 08             	sub    $0x8,%esp
c0108711:	50                   	push   %eax
c0108712:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108718:	50                   	push   %eax
c0108719:	e8 26 e9 ff ff       	call   c0107044 <atoi>
c010871e:	83 c4 10             	add    $0x10,%esp
c0108721:	83 ec 08             	sub    $0x8,%esp
c0108724:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010872a:	50                   	push   %eax
c010872b:	ff 75 f4             	pushl  -0xc(%ebp)
c010872e:	e8 bb 3a 00 00       	call   c010c1ee <Strcpy>
c0108733:	83 c4 10             	add    $0x10,%esp
c0108736:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010873a:	83 ec 0c             	sub    $0xc,%esp
c010873d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108743:	50                   	push   %eax
c0108744:	e8 bf 3a 00 00       	call   c010c208 <Strlen>
c0108749:	83 c4 10             	add    $0x10,%esp
c010874c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010874f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108752:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108755:	eb 51                	jmp    c01087a8 <vsprintf+0x192>
c0108757:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010875a:	8b 00                	mov    (%eax),%eax
c010875c:	83 ec 08             	sub    $0x8,%esp
c010875f:	50                   	push   %eax
c0108760:	ff 75 f4             	pushl  -0xc(%ebp)
c0108763:	e8 86 3a 00 00       	call   c010c1ee <Strcpy>
c0108768:	83 c4 10             	add    $0x10,%esp
c010876b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010876e:	8b 00                	mov    (%eax),%eax
c0108770:	83 ec 0c             	sub    $0xc,%esp
c0108773:	50                   	push   %eax
c0108774:	e8 8f 3a 00 00       	call   c010c208 <Strlen>
c0108779:	83 c4 10             	add    $0x10,%esp
c010877c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010877f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108783:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108786:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108789:	eb 1d                	jmp    c01087a8 <vsprintf+0x192>
c010878b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010878e:	0f b6 10             	movzbl (%eax),%edx
c0108791:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108794:	88 10                	mov    %dl,(%eax)
c0108796:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010879a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01087a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01087a4:	01 45 f4             	add    %eax,-0xc(%ebp)
c01087a7:	90                   	nop
c01087a8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01087ac:	8b 45 0c             	mov    0xc(%ebp),%eax
c01087af:	0f b6 00             	movzbl (%eax),%eax
c01087b2:	84 c0                	test   %al,%al
c01087b4:	0f 85 9f fe ff ff    	jne    c0108659 <vsprintf+0x43>
c01087ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01087bd:	2b 45 08             	sub    0x8(%ebp),%eax
c01087c0:	c9                   	leave  
c01087c1:	c3                   	ret    

c01087c2 <printx>:
c01087c2:	55                   	push   %ebp
c01087c3:	89 e5                	mov    %esp,%ebp
c01087c5:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01087cb:	8d 45 0c             	lea    0xc(%ebp),%eax
c01087ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01087d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01087d4:	83 ec 04             	sub    $0x4,%esp
c01087d7:	ff 75 f4             	pushl  -0xc(%ebp)
c01087da:	50                   	push   %eax
c01087db:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01087e1:	50                   	push   %eax
c01087e2:	e8 2f fe ff ff       	call   c0108616 <vsprintf>
c01087e7:	83 c4 10             	add    $0x10,%esp
c01087ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01087ed:	83 ec 08             	sub    $0x8,%esp
c01087f0:	ff 75 f0             	pushl  -0x10(%ebp)
c01087f3:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01087f9:	50                   	push   %eax
c01087fa:	e8 11 8e ff ff       	call   c0101610 <write_debug>
c01087ff:	83 c4 10             	add    $0x10,%esp
c0108802:	90                   	nop
c0108803:	c9                   	leave  
c0108804:	c3                   	ret    

c0108805 <sys_printx>:
c0108805:	55                   	push   %ebp
c0108806:	89 e5                	mov    %esp,%ebp
c0108808:	83 ec 28             	sub    $0x28,%esp
c010880b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108810:	85 c0                	test   %eax,%eax
c0108812:	75 15                	jne    c0108829 <sys_printx+0x24>
c0108814:	8b 45 10             	mov    0x10(%ebp),%eax
c0108817:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c010881d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108820:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108827:	eb 10                	jmp    c0108839 <sys_printx+0x34>
c0108829:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010882e:	85 c0                	test   %eax,%eax
c0108830:	74 07                	je     c0108839 <sys_printx+0x34>
c0108832:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108839:	8b 55 08             	mov    0x8(%ebp),%edx
c010883c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010883f:	01 d0                	add    %edx,%eax
c0108841:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108844:	8b 45 10             	mov    0x10(%ebp),%eax
c0108847:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c010884d:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108853:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108858:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010885b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010885e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108861:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108864:	0f b6 00             	movzbl (%eax),%eax
c0108867:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010886a:	eb 3a                	jmp    c01088a6 <sys_printx+0xa1>
c010886c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010886f:	0f b6 00             	movzbl (%eax),%eax
c0108872:	3c 3b                	cmp    $0x3b,%al
c0108874:	74 0a                	je     c0108880 <sys_printx+0x7b>
c0108876:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108879:	0f b6 00             	movzbl (%eax),%eax
c010887c:	3c 3a                	cmp    $0x3a,%al
c010887e:	75 06                	jne    c0108886 <sys_printx+0x81>
c0108880:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108884:	eb 20                	jmp    c01088a6 <sys_printx+0xa1>
c0108886:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108889:	0f b6 00             	movzbl (%eax),%eax
c010888c:	0f b6 c0             	movzbl %al,%eax
c010888f:	83 ec 08             	sub    $0x8,%esp
c0108892:	50                   	push   %eax
c0108893:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108896:	e8 45 b6 ff ff       	call   c0103ee0 <out_char>
c010889b:	83 c4 10             	add    $0x10,%esp
c010889e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01088a2:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01088a6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01088aa:	7f c0                	jg     c010886c <sys_printx+0x67>
c01088ac:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c01088b0:	75 10                	jne    c01088c2 <sys_printx+0xbd>
c01088b2:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01088b7:	85 c0                	test   %eax,%eax
c01088b9:	74 13                	je     c01088ce <sys_printx+0xc9>
c01088bb:	e8 52 7a ff ff       	call   c0100312 <disable_int>
c01088c0:	eb 0c                	jmp    c01088ce <sys_printx+0xc9>
c01088c2:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c01088c6:	75 06                	jne    c01088ce <sys_printx+0xc9>
c01088c8:	e8 45 7a ff ff       	call   c0100312 <disable_int>
c01088cd:	90                   	nop
c01088ce:	90                   	nop
c01088cf:	c9                   	leave  
c01088d0:	c3                   	ret    

c01088d1 <spin>:
c01088d1:	55                   	push   %ebp
c01088d2:	89 e5                	mov    %esp,%ebp
c01088d4:	83 ec 08             	sub    $0x8,%esp
c01088d7:	83 ec 0c             	sub    $0xc,%esp
c01088da:	ff 75 08             	pushl  0x8(%ebp)
c01088dd:	e8 aa 77 ff ff       	call   c010008c <disp_str>
c01088e2:	83 c4 10             	add    $0x10,%esp
c01088e5:	83 ec 0c             	sub    $0xc,%esp
c01088e8:	68 13 b7 10 c0       	push   $0xc010b713
c01088ed:	e8 9a 77 ff ff       	call   c010008c <disp_str>
c01088f2:	83 c4 10             	add    $0x10,%esp
c01088f5:	eb fe                	jmp    c01088f5 <spin+0x24>

c01088f7 <panic>:
c01088f7:	55                   	push   %ebp
c01088f8:	89 e5                	mov    %esp,%ebp
c01088fa:	83 ec 08             	sub    $0x8,%esp
c01088fd:	83 ec 04             	sub    $0x4,%esp
c0108900:	ff 75 08             	pushl  0x8(%ebp)
c0108903:	6a 3a                	push   $0x3a
c0108905:	68 70 bd 10 c0       	push   $0xc010bd70
c010890a:	e8 b3 fe ff ff       	call   c01087c2 <printx>
c010890f:	83 c4 10             	add    $0x10,%esp
c0108912:	90                   	nop
c0108913:	c9                   	leave  
c0108914:	c3                   	ret    

c0108915 <assertion_failure>:
c0108915:	55                   	push   %ebp
c0108916:	89 e5                	mov    %esp,%ebp
c0108918:	83 ec 08             	sub    $0x8,%esp
c010891b:	83 ec 08             	sub    $0x8,%esp
c010891e:	ff 75 14             	pushl  0x14(%ebp)
c0108921:	ff 75 10             	pushl  0x10(%ebp)
c0108924:	ff 75 0c             	pushl  0xc(%ebp)
c0108927:	ff 75 08             	pushl  0x8(%ebp)
c010892a:	6a 3b                	push   $0x3b
c010892c:	68 78 bd 10 c0       	push   $0xc010bd78
c0108931:	e8 8c fe ff ff       	call   c01087c2 <printx>
c0108936:	83 c4 20             	add    $0x20,%esp
c0108939:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108940:	00 00 00 
c0108943:	83 ec 0c             	sub    $0xc,%esp
c0108946:	68 00 b6 10 c0       	push   $0xc010b600
c010894b:	e8 3c 77 ff ff       	call   c010008c <disp_str>
c0108950:	83 c4 10             	add    $0x10,%esp
c0108953:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108958:	83 ec 0c             	sub    $0xc,%esp
c010895b:	50                   	push   %eax
c010895c:	e8 89 e7 ff ff       	call   c01070ea <disp_int>
c0108961:	83 c4 10             	add    $0x10,%esp
c0108964:	83 ec 0c             	sub    $0xc,%esp
c0108967:	68 02 b6 10 c0       	push   $0xc010b602
c010896c:	e8 1b 77 ff ff       	call   c010008c <disp_str>
c0108971:	83 c4 10             	add    $0x10,%esp
c0108974:	83 ec 0c             	sub    $0xc,%esp
c0108977:	68 ab bd 10 c0       	push   $0xc010bdab
c010897c:	e8 50 ff ff ff       	call   c01088d1 <spin>
c0108981:	83 c4 10             	add    $0x10,%esp
c0108984:	90                   	nop
c0108985:	c9                   	leave  
c0108986:	c3                   	ret    

c0108987 <assertion_failure2>:
c0108987:	55                   	push   %ebp
c0108988:	89 e5                	mov    %esp,%ebp
c010898a:	83 ec 08             	sub    $0x8,%esp
c010898d:	83 ec 04             	sub    $0x4,%esp
c0108990:	ff 75 18             	pushl  0x18(%ebp)
c0108993:	ff 75 14             	pushl  0x14(%ebp)
c0108996:	ff 75 10             	pushl  0x10(%ebp)
c0108999:	ff 75 0c             	pushl  0xc(%ebp)
c010899c:	ff 75 08             	pushl  0x8(%ebp)
c010899f:	6a 3b                	push   $0x3b
c01089a1:	68 b8 bd 10 c0       	push   $0xc010bdb8
c01089a6:	e8 17 fe ff ff       	call   c01087c2 <printx>
c01089ab:	83 c4 20             	add    $0x20,%esp
c01089ae:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01089b5:	00 00 00 
c01089b8:	83 ec 0c             	sub    $0xc,%esp
c01089bb:	68 00 b6 10 c0       	push   $0xc010b600
c01089c0:	e8 c7 76 ff ff       	call   c010008c <disp_str>
c01089c5:	83 c4 10             	add    $0x10,%esp
c01089c8:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01089cd:	83 ec 0c             	sub    $0xc,%esp
c01089d0:	50                   	push   %eax
c01089d1:	e8 14 e7 ff ff       	call   c01070ea <disp_int>
c01089d6:	83 c4 10             	add    $0x10,%esp
c01089d9:	83 ec 0c             	sub    $0xc,%esp
c01089dc:	68 02 b6 10 c0       	push   $0xc010b602
c01089e1:	e8 a6 76 ff ff       	call   c010008c <disp_str>
c01089e6:	83 c4 10             	add    $0x10,%esp
c01089e9:	83 ec 0c             	sub    $0xc,%esp
c01089ec:	68 ab bd 10 c0       	push   $0xc010bdab
c01089f1:	e8 db fe ff ff       	call   c01088d1 <spin>
c01089f6:	83 c4 10             	add    $0x10,%esp
c01089f9:	90                   	nop
c01089fa:	c9                   	leave  
c01089fb:	c3                   	ret    

c01089fc <dead_lock>:
c01089fc:	55                   	push   %ebp
c01089fd:	89 e5                	mov    %esp,%ebp
c01089ff:	b8 00 00 00 00       	mov    $0x0,%eax
c0108a04:	5d                   	pop    %ebp
c0108a05:	c3                   	ret    

c0108a06 <sys_send_msg>:
c0108a06:	55                   	push   %ebp
c0108a07:	89 e5                	mov    %esp,%ebp
c0108a09:	83 ec 58             	sub    $0x58,%esp
c0108a0c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108a13:	83 ec 0c             	sub    $0xc,%esp
c0108a16:	ff 75 0c             	pushl  0xc(%ebp)
c0108a19:	e8 28 ae ff ff       	call   c0103846 <pid2proc>
c0108a1e:	83 c4 10             	add    $0x10,%esp
c0108a21:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108a24:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a28:	74 2c                	je     c0108a56 <sys_send_msg+0x50>
c0108a2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a2d:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108a33:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108a38:	74 1c                	je     c0108a56 <sys_send_msg+0x50>
c0108a3a:	68 5c 05 00 00       	push   $0x55c
c0108a3f:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a44:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a49:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108a4e:	e8 c2 fe ff ff       	call   c0108915 <assertion_failure>
c0108a53:	83 c4 10             	add    $0x10,%esp
c0108a56:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a59:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108a5f:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108a64:	74 1c                	je     c0108a82 <sys_send_msg+0x7c>
c0108a66:	68 5e 05 00 00       	push   $0x55e
c0108a6b:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a70:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a75:	68 20 be 10 c0       	push   $0xc010be20
c0108a7a:	e8 96 fe ff ff       	call   c0108915 <assertion_failure>
c0108a7f:	83 c4 10             	add    $0x10,%esp
c0108a82:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a86:	75 22                	jne    c0108aaa <sys_send_msg+0xa4>
c0108a88:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a8c:	75 1c                	jne    c0108aaa <sys_send_msg+0xa4>
c0108a8e:	68 61 05 00 00       	push   $0x561
c0108a93:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a98:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a9d:	68 43 be 10 c0       	push   $0xc010be43
c0108aa2:	e8 6e fe ff ff       	call   c0108915 <assertion_failure>
c0108aa7:	83 c4 10             	add    $0x10,%esp
c0108aaa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108aad:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ab4:	84 c0                	test   %al,%al
c0108ab6:	74 65                	je     c0108b1d <sys_send_msg+0x117>
c0108ab8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108abb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ac2:	3c 01                	cmp    $0x1,%al
c0108ac4:	74 57                	je     c0108b1d <sys_send_msg+0x117>
c0108ac6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ac9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ad0:	3c 02                	cmp    $0x2,%al
c0108ad2:	74 49                	je     c0108b1d <sys_send_msg+0x117>
c0108ad4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ad7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ade:	3c 03                	cmp    $0x3,%al
c0108ae0:	74 3b                	je     c0108b1d <sys_send_msg+0x117>
c0108ae2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ae5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108aec:	3c 04                	cmp    $0x4,%al
c0108aee:	74 2d                	je     c0108b1d <sys_send_msg+0x117>
c0108af0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108af3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108afa:	0f be c0             	movsbl %al,%eax
c0108afd:	83 ec 0c             	sub    $0xc,%esp
c0108b00:	68 65 05 00 00       	push   $0x565
c0108b05:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b0a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b0f:	50                   	push   %eax
c0108b10:	68 54 be 10 c0       	push   $0xc010be54
c0108b15:	e8 6d fe ff ff       	call   c0108987 <assertion_failure2>
c0108b1a:	83 c4 20             	add    $0x20,%esp
c0108b1d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b20:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b27:	84 c0                	test   %al,%al
c0108b29:	74 65                	je     c0108b90 <sys_send_msg+0x18a>
c0108b2b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b2e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b35:	3c 01                	cmp    $0x1,%al
c0108b37:	74 57                	je     c0108b90 <sys_send_msg+0x18a>
c0108b39:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b3c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b43:	3c 02                	cmp    $0x2,%al
c0108b45:	74 49                	je     c0108b90 <sys_send_msg+0x18a>
c0108b47:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b4a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b51:	3c 03                	cmp    $0x3,%al
c0108b53:	74 3b                	je     c0108b90 <sys_send_msg+0x18a>
c0108b55:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b58:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b5f:	3c 04                	cmp    $0x4,%al
c0108b61:	74 2d                	je     c0108b90 <sys_send_msg+0x18a>
c0108b63:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b66:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b6d:	0f be c0             	movsbl %al,%eax
c0108b70:	83 ec 0c             	sub    $0xc,%esp
c0108b73:	68 68 05 00 00       	push   $0x568
c0108b78:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b7d:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b82:	50                   	push   %eax
c0108b83:	68 f0 be 10 c0       	push   $0xc010bef0
c0108b88:	e8 fa fd ff ff       	call   c0108987 <assertion_failure2>
c0108b8d:	83 c4 20             	add    $0x20,%esp
c0108b90:	83 ec 0c             	sub    $0xc,%esp
c0108b93:	ff 75 10             	pushl  0x10(%ebp)
c0108b96:	e8 31 ad ff ff       	call   c01038cc <proc2pid>
c0108b9b:	83 c4 10             	add    $0x10,%esp
c0108b9e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108ba1:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108ba8:	8b 45 08             	mov    0x8(%ebp),%eax
c0108bab:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108bae:	83 ec 08             	sub    $0x8,%esp
c0108bb1:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108bb4:	ff 75 dc             	pushl  -0x24(%ebp)
c0108bb7:	e8 a6 d3 ff ff       	call   c0105f62 <get_physical_address_proc>
c0108bbc:	83 c4 10             	add    $0x10,%esp
c0108bbf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108bc2:	83 ec 08             	sub    $0x8,%esp
c0108bc5:	ff 75 e0             	pushl  -0x20(%ebp)
c0108bc8:	ff 75 d8             	pushl  -0x28(%ebp)
c0108bcb:	e8 bf d2 ff ff       	call   c0105e8f <alloc_virtual_memory>
c0108bd0:	83 c4 10             	add    $0x10,%esp
c0108bd3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108bd6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bd9:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108bdf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108be2:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108be9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108bec:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108bef:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108bf2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108bf5:	89 10                	mov    %edx,(%eax)
c0108bf7:	83 ec 08             	sub    $0x8,%esp
c0108bfa:	ff 75 0c             	pushl  0xc(%ebp)
c0108bfd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108c00:	e8 f7 fd ff ff       	call   c01089fc <dead_lock>
c0108c05:	83 c4 10             	add    $0x10,%esp
c0108c08:	83 f8 01             	cmp    $0x1,%eax
c0108c0b:	75 10                	jne    c0108c1d <sys_send_msg+0x217>
c0108c0d:	83 ec 0c             	sub    $0xc,%esp
c0108c10:	68 80 bf 10 c0       	push   $0xc010bf80
c0108c15:	e8 dd fc ff ff       	call   c01088f7 <panic>
c0108c1a:	83 c4 10             	add    $0x10,%esp
c0108c1d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c20:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c27:	3c 02                	cmp    $0x2,%al
c0108c29:	0f 85 ca 01 00 00    	jne    c0108df9 <sys_send_msg+0x3f3>
c0108c2f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c32:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108c38:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108c3b:	74 12                	je     c0108c4f <sys_send_msg+0x249>
c0108c3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c40:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108c46:	83 f8 12             	cmp    $0x12,%eax
c0108c49:	0f 85 aa 01 00 00    	jne    c0108df9 <sys_send_msg+0x3f3>
c0108c4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c52:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108c58:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108c5b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c5e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108c64:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108c67:	83 ec 08             	sub    $0x8,%esp
c0108c6a:	ff 75 0c             	pushl  0xc(%ebp)
c0108c6d:	ff 75 c0             	pushl  -0x40(%ebp)
c0108c70:	e8 ed d2 ff ff       	call   c0105f62 <get_physical_address_proc>
c0108c75:	83 c4 10             	add    $0x10,%esp
c0108c78:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108c7b:	83 ec 08             	sub    $0x8,%esp
c0108c7e:	ff 75 e0             	pushl  -0x20(%ebp)
c0108c81:	ff 75 bc             	pushl  -0x44(%ebp)
c0108c84:	e8 06 d2 ff ff       	call   c0105e8f <alloc_virtual_memory>
c0108c89:	83 c4 10             	add    $0x10,%esp
c0108c8c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108c8f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108c92:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108c95:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108c98:	83 ec 04             	sub    $0x4,%esp
c0108c9b:	51                   	push   %ecx
c0108c9c:	52                   	push   %edx
c0108c9d:	50                   	push   %eax
c0108c9e:	e8 59 e0 ff ff       	call   c0106cfc <Memcpy>
c0108ca3:	83 c4 10             	add    $0x10,%esp
c0108ca6:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108cab:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108cb0:	75 0a                	jne    c0108cbc <sys_send_msg+0x2b6>
c0108cb2:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108cb9:	00 00 00 
c0108cbc:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cbf:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108cc6:	00 00 00 
c0108cc9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ccc:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108cd3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cd6:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108cdd:	00 00 00 
c0108ce0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ce3:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108cea:	00 00 00 
c0108ced:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cf0:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108cf7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cfa:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108d01:	00 00 00 
c0108d04:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d07:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108d0e:	00 00 00 
c0108d11:	83 ec 0c             	sub    $0xc,%esp
c0108d14:	ff 75 e8             	pushl  -0x18(%ebp)
c0108d17:	e8 a0 09 00 00       	call   c01096bc <unblock>
c0108d1c:	83 c4 10             	add    $0x10,%esp
c0108d1f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d22:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d29:	84 c0                	test   %al,%al
c0108d2b:	74 1c                	je     c0108d49 <sys_send_msg+0x343>
c0108d2d:	68 a0 05 00 00       	push   $0x5a0
c0108d32:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d37:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d3c:	68 8b bf 10 c0       	push   $0xc010bf8b
c0108d41:	e8 cf fb ff ff       	call   c0108915 <assertion_failure>
c0108d46:	83 c4 10             	add    $0x10,%esp
c0108d49:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d4c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108d52:	83 f8 21             	cmp    $0x21,%eax
c0108d55:	74 1c                	je     c0108d73 <sys_send_msg+0x36d>
c0108d57:	68 a1 05 00 00       	push   $0x5a1
c0108d5c:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d61:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d66:	68 9f bf 10 c0       	push   $0xc010bf9f
c0108d6b:	e8 a5 fb ff ff       	call   c0108915 <assertion_failure>
c0108d70:	83 c4 10             	add    $0x10,%esp
c0108d73:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d76:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108d7c:	85 c0                	test   %eax,%eax
c0108d7e:	74 1c                	je     c0108d9c <sys_send_msg+0x396>
c0108d80:	68 a3 05 00 00       	push   $0x5a3
c0108d85:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d8a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d8f:	68 bc bf 10 c0       	push   $0xc010bfbc
c0108d94:	e8 7c fb ff ff       	call   c0108915 <assertion_failure>
c0108d99:	83 c4 10             	add    $0x10,%esp
c0108d9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d9f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108da6:	84 c0                	test   %al,%al
c0108da8:	74 1c                	je     c0108dc6 <sys_send_msg+0x3c0>
c0108daa:	68 a4 05 00 00       	push   $0x5a4
c0108daf:	68 61 ba 10 c0       	push   $0xc010ba61
c0108db4:	68 61 ba 10 c0       	push   $0xc010ba61
c0108db9:	68 d1 bf 10 c0       	push   $0xc010bfd1
c0108dbe:	e8 52 fb ff ff       	call   c0108915 <assertion_failure>
c0108dc3:	83 c4 10             	add    $0x10,%esp
c0108dc6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108dc9:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108dcf:	83 f8 21             	cmp    $0x21,%eax
c0108dd2:	0f 84 45 01 00 00    	je     c0108f1d <sys_send_msg+0x517>
c0108dd8:	68 a5 05 00 00       	push   $0x5a5
c0108ddd:	68 61 ba 10 c0       	push   $0xc010ba61
c0108de2:	68 61 ba 10 c0       	push   $0xc010ba61
c0108de7:	68 e8 bf 10 c0       	push   $0xc010bfe8
c0108dec:	e8 24 fb ff ff       	call   c0108915 <assertion_failure>
c0108df1:	83 c4 10             	add    $0x10,%esp
c0108df4:	e9 24 01 00 00       	jmp    c0108f1d <sys_send_msg+0x517>
c0108df9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108e00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e03:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108e06:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e09:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e0f:	85 c0                	test   %eax,%eax
c0108e11:	75 1b                	jne    c0108e2e <sys_send_msg+0x428>
c0108e13:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e16:	8b 55 10             	mov    0x10(%ebp),%edx
c0108e19:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108e1f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e22:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108e29:	00 00 00 
c0108e2c:	eb 3f                	jmp    c0108e6d <sys_send_msg+0x467>
c0108e2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e31:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e37:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e3a:	eb 12                	jmp    c0108e4e <sys_send_msg+0x448>
c0108e3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108e3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108e42:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108e45:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108e4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e4e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108e52:	75 e8                	jne    c0108e3c <sys_send_msg+0x436>
c0108e54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108e57:	8b 55 10             	mov    0x10(%ebp),%edx
c0108e5a:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108e60:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e63:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108e6a:	00 00 00 
c0108e6d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e70:	8b 55 08             	mov    0x8(%ebp),%edx
c0108e73:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108e79:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e7c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108e7f:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108e85:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e88:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108e8f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e92:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e99:	3c 01                	cmp    $0x1,%al
c0108e9b:	74 1c                	je     c0108eb9 <sys_send_msg+0x4b3>
c0108e9d:	68 c7 05 00 00       	push   $0x5c7
c0108ea2:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ea7:	68 61 ba 10 c0       	push   $0xc010ba61
c0108eac:	68 0c c0 10 c0       	push   $0xc010c00c
c0108eb1:	e8 5f fa ff ff       	call   c0108915 <assertion_failure>
c0108eb6:	83 c4 10             	add    $0x10,%esp
c0108eb9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ebc:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108ec2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108ec5:	74 1c                	je     c0108ee3 <sys_send_msg+0x4dd>
c0108ec7:	68 c8 05 00 00       	push   $0x5c8
c0108ecc:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ed1:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ed6:	68 28 c0 10 c0       	push   $0xc010c028
c0108edb:	e8 35 fa ff ff       	call   c0108915 <assertion_failure>
c0108ee0:	83 c4 10             	add    $0x10,%esp
c0108ee3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ee6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108eec:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108eef:	74 1c                	je     c0108f0d <sys_send_msg+0x507>
c0108ef1:	68 c9 05 00 00       	push   $0x5c9
c0108ef6:	68 61 ba 10 c0       	push   $0xc010ba61
c0108efb:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f00:	68 4a c0 10 c0       	push   $0xc010c04a
c0108f05:	e8 0b fa ff ff       	call   c0108915 <assertion_failure>
c0108f0a:	83 c4 10             	add    $0x10,%esp
c0108f0d:	83 ec 0c             	sub    $0xc,%esp
c0108f10:	ff 75 10             	pushl  0x10(%ebp)
c0108f13:	e8 68 07 00 00       	call   c0109680 <block>
c0108f18:	83 c4 10             	add    $0x10,%esp
c0108f1b:	eb 01                	jmp    c0108f1e <sys_send_msg+0x518>
c0108f1d:	90                   	nop
c0108f1e:	b8 00 00 00 00       	mov    $0x0,%eax
c0108f23:	c9                   	leave  
c0108f24:	c3                   	ret    

c0108f25 <sys_receive_msg>:
c0108f25:	55                   	push   %ebp
c0108f26:	89 e5                	mov    %esp,%ebp
c0108f28:	83 ec 58             	sub    $0x58,%esp
c0108f2b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108f32:	83 ec 0c             	sub    $0xc,%esp
c0108f35:	ff 75 0c             	pushl  0xc(%ebp)
c0108f38:	e8 09 a9 ff ff       	call   c0103846 <pid2proc>
c0108f3d:	83 c4 10             	add    $0x10,%esp
c0108f40:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108f43:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108f47:	74 2c                	je     c0108f75 <sys_receive_msg+0x50>
c0108f49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f4c:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108f52:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108f57:	74 1c                	je     c0108f75 <sys_receive_msg+0x50>
c0108f59:	68 dd 05 00 00       	push   $0x5dd
c0108f5e:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f63:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f68:	68 20 be 10 c0       	push   $0xc010be20
c0108f6d:	e8 a3 f9 ff ff       	call   c0108915 <assertion_failure>
c0108f72:	83 c4 10             	add    $0x10,%esp
c0108f75:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f78:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108f7e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108f83:	74 1c                	je     c0108fa1 <sys_receive_msg+0x7c>
c0108f85:	68 df 05 00 00       	push   $0x5df
c0108f8a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f8f:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f94:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108f99:	e8 77 f9 ff ff       	call   c0108915 <assertion_failure>
c0108f9e:	83 c4 10             	add    $0x10,%esp
c0108fa1:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fa4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fab:	84 c0                	test   %al,%al
c0108fad:	74 65                	je     c0109014 <sys_receive_msg+0xef>
c0108faf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fb2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fb9:	3c 01                	cmp    $0x1,%al
c0108fbb:	74 57                	je     c0109014 <sys_receive_msg+0xef>
c0108fbd:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fc0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fc7:	3c 02                	cmp    $0x2,%al
c0108fc9:	74 49                	je     c0109014 <sys_receive_msg+0xef>
c0108fcb:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fce:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fd5:	3c 03                	cmp    $0x3,%al
c0108fd7:	74 3b                	je     c0109014 <sys_receive_msg+0xef>
c0108fd9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fdc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fe3:	3c 04                	cmp    $0x4,%al
c0108fe5:	74 2d                	je     c0109014 <sys_receive_msg+0xef>
c0108fe7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fea:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ff1:	0f be c0             	movsbl %al,%eax
c0108ff4:	83 ec 0c             	sub    $0xc,%esp
c0108ff7:	68 e2 05 00 00       	push   $0x5e2
c0108ffc:	68 61 ba 10 c0       	push   $0xc010ba61
c0109001:	68 61 ba 10 c0       	push   $0xc010ba61
c0109006:	50                   	push   %eax
c0109007:	68 54 be 10 c0       	push   $0xc010be54
c010900c:	e8 76 f9 ff ff       	call   c0108987 <assertion_failure2>
c0109011:	83 c4 20             	add    $0x20,%esp
c0109014:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109018:	74 73                	je     c010908d <sys_receive_msg+0x168>
c010901a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010901d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109024:	84 c0                	test   %al,%al
c0109026:	74 65                	je     c010908d <sys_receive_msg+0x168>
c0109028:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010902b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109032:	3c 01                	cmp    $0x1,%al
c0109034:	74 57                	je     c010908d <sys_receive_msg+0x168>
c0109036:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109039:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109040:	3c 02                	cmp    $0x2,%al
c0109042:	74 49                	je     c010908d <sys_receive_msg+0x168>
c0109044:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109047:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010904e:	3c 03                	cmp    $0x3,%al
c0109050:	74 3b                	je     c010908d <sys_receive_msg+0x168>
c0109052:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109055:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010905c:	3c 04                	cmp    $0x4,%al
c010905e:	74 2d                	je     c010908d <sys_receive_msg+0x168>
c0109060:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109063:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010906a:	0f be c0             	movsbl %al,%eax
c010906d:	83 ec 0c             	sub    $0xc,%esp
c0109070:	68 e6 05 00 00       	push   $0x5e6
c0109075:	68 61 ba 10 c0       	push   $0xc010ba61
c010907a:	68 61 ba 10 c0       	push   $0xc010ba61
c010907f:	50                   	push   %eax
c0109080:	68 f0 be 10 c0       	push   $0xc010bef0
c0109085:	e8 fd f8 ff ff       	call   c0108987 <assertion_failure2>
c010908a:	83 c4 20             	add    $0x20,%esp
c010908d:	83 ec 0c             	sub    $0xc,%esp
c0109090:	ff 75 10             	pushl  0x10(%ebp)
c0109093:	e8 34 a8 ff ff       	call   c01038cc <proc2pid>
c0109098:	83 c4 10             	add    $0x10,%esp
c010909b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010909e:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c01090a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01090a8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01090ab:	8b 45 10             	mov    0x10(%ebp),%eax
c01090ae:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01090b4:	83 ec 08             	sub    $0x8,%esp
c01090b7:	50                   	push   %eax
c01090b8:	ff 75 d8             	pushl  -0x28(%ebp)
c01090bb:	e8 a2 ce ff ff       	call   c0105f62 <get_physical_address_proc>
c01090c0:	83 c4 10             	add    $0x10,%esp
c01090c3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01090c6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01090cd:	8b 45 10             	mov    0x10(%ebp),%eax
c01090d0:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c01090d6:	85 c0                	test   %eax,%eax
c01090d8:	0f 84 c5 00 00 00    	je     c01091a3 <sys_receive_msg+0x27e>
c01090de:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01090e2:	74 0d                	je     c01090f1 <sys_receive_msg+0x1cc>
c01090e4:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c01090eb:	0f 85 b2 00 00 00    	jne    c01091a3 <sys_receive_msg+0x27e>
c01090f1:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c01090f8:	83 ec 0c             	sub    $0xc,%esp
c01090fb:	ff 75 d0             	pushl  -0x30(%ebp)
c01090fe:	e8 49 85 ff ff       	call   c010164c <sys_malloc>
c0109103:	83 c4 10             	add    $0x10,%esp
c0109106:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109109:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010910c:	83 ec 04             	sub    $0x4,%esp
c010910f:	50                   	push   %eax
c0109110:	6a 00                	push   $0x0
c0109112:	ff 75 cc             	pushl  -0x34(%ebp)
c0109115:	e8 b5 30 00 00       	call   c010c1cf <Memset>
c010911a:	83 c4 10             	add    $0x10,%esp
c010911d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109120:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109126:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109129:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109130:	83 ec 08             	sub    $0x8,%esp
c0109133:	ff 75 d0             	pushl  -0x30(%ebp)
c0109136:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109139:	e8 51 cd ff ff       	call   c0105e8f <alloc_virtual_memory>
c010913e:	83 c4 10             	add    $0x10,%esp
c0109141:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0109144:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0109147:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010914a:	83 ec 04             	sub    $0x4,%esp
c010914d:	52                   	push   %edx
c010914e:	ff 75 cc             	pushl  -0x34(%ebp)
c0109151:	50                   	push   %eax
c0109152:	e8 a5 db ff ff       	call   c0106cfc <Memcpy>
c0109157:	83 c4 10             	add    $0x10,%esp
c010915a:	8b 45 10             	mov    0x10(%ebp),%eax
c010915d:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109164:	00 00 00 
c0109167:	8b 45 10             	mov    0x10(%ebp),%eax
c010916a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109171:	00 00 00 
c0109174:	8b 45 10             	mov    0x10(%ebp),%eax
c0109177:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010917e:	00 00 00 
c0109181:	8b 45 10             	mov    0x10(%ebp),%eax
c0109184:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010918b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0109192:	83 ec 08             	sub    $0x8,%esp
c0109195:	ff 75 d0             	pushl  -0x30(%ebp)
c0109198:	ff 75 cc             	pushl  -0x34(%ebp)
c010919b:	e8 c1 84 ff ff       	call   c0101661 <sys_free>
c01091a0:	83 c4 10             	add    $0x10,%esp
c01091a3:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c01091a7:	0f 84 d4 03 00 00    	je     c0109581 <sys_receive_msg+0x65c>
c01091ad:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01091b1:	75 26                	jne    c01091d9 <sys_receive_msg+0x2b4>
c01091b3:	8b 45 10             	mov    0x10(%ebp),%eax
c01091b6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01091bc:	85 c0                	test   %eax,%eax
c01091be:	0f 84 8a 00 00 00    	je     c010924e <sys_receive_msg+0x329>
c01091c4:	8b 45 10             	mov    0x10(%ebp),%eax
c01091c7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01091cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01091d0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01091d7:	eb 75                	jmp    c010924e <sys_receive_msg+0x329>
c01091d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01091dd:	78 6f                	js     c010924e <sys_receive_msg+0x329>
c01091df:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c01091e3:	7f 69                	jg     c010924e <sys_receive_msg+0x329>
c01091e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091e8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091ef:	3c 01                	cmp    $0x1,%al
c01091f1:	75 5b                	jne    c010924e <sys_receive_msg+0x329>
c01091f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091f6:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01091fc:	83 f8 12             	cmp    $0x12,%eax
c01091ff:	74 0e                	je     c010920f <sys_receive_msg+0x2ea>
c0109201:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109204:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010920a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c010920d:	75 3f                	jne    c010924e <sys_receive_msg+0x329>
c010920f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109212:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109218:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010921b:	eb 2b                	jmp    c0109248 <sys_receive_msg+0x323>
c010921d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109220:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109223:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109226:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010922c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010922f:	39 c2                	cmp    %eax,%edx
c0109231:	75 09                	jne    c010923c <sys_receive_msg+0x317>
c0109233:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010923a:	eb 12                	jmp    c010924e <sys_receive_msg+0x329>
c010923c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010923f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0109245:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109248:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010924c:	75 cf                	jne    c010921d <sys_receive_msg+0x2f8>
c010924e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0109252:	0f 85 4e 02 00 00    	jne    c01094a6 <sys_receive_msg+0x581>
c0109258:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010925b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010925e:	83 ec 08             	sub    $0x8,%esp
c0109261:	ff 75 dc             	pushl  -0x24(%ebp)
c0109264:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109267:	e8 23 cc ff ff       	call   c0105e8f <alloc_virtual_memory>
c010926c:	83 c4 10             	add    $0x10,%esp
c010926f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0109272:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109275:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010927b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010927e:	83 ec 0c             	sub    $0xc,%esp
c0109281:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109284:	e8 43 a6 ff ff       	call   c01038cc <proc2pid>
c0109289:	83 c4 10             	add    $0x10,%esp
c010928c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010928f:	83 ec 08             	sub    $0x8,%esp
c0109292:	ff 75 b8             	pushl  -0x48(%ebp)
c0109295:	ff 75 bc             	pushl  -0x44(%ebp)
c0109298:	e8 c5 cc ff ff       	call   c0105f62 <get_physical_address_proc>
c010929d:	83 c4 10             	add    $0x10,%esp
c01092a0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01092a3:	83 ec 08             	sub    $0x8,%esp
c01092a6:	ff 75 dc             	pushl  -0x24(%ebp)
c01092a9:	ff 75 b4             	pushl  -0x4c(%ebp)
c01092ac:	e8 de cb ff ff       	call   c0105e8f <alloc_virtual_memory>
c01092b1:	83 c4 10             	add    $0x10,%esp
c01092b4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01092b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01092ba:	83 ec 04             	sub    $0x4,%esp
c01092bd:	50                   	push   %eax
c01092be:	ff 75 b0             	pushl  -0x50(%ebp)
c01092c1:	ff 75 c0             	pushl  -0x40(%ebp)
c01092c4:	e8 33 da ff ff       	call   c0106cfc <Memcpy>
c01092c9:	83 c4 10             	add    $0x10,%esp
c01092cc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01092cf:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01092d2:	8b 45 10             	mov    0x10(%ebp),%eax
c01092d5:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01092db:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01092de:	75 21                	jne    c0109301 <sys_receive_msg+0x3dc>
c01092e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092e3:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c01092e9:	8b 45 10             	mov    0x10(%ebp),%eax
c01092ec:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c01092f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092f5:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01092fc:	00 00 00 
c01092ff:	eb 1f                	jmp    c0109320 <sys_receive_msg+0x3fb>
c0109301:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109304:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010930a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010930d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109313:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109316:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010931d:	00 00 00 
c0109320:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109323:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010932a:	00 00 00 
c010932d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109330:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109337:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010933a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109341:	00 00 00 
c0109344:	8b 45 10             	mov    0x10(%ebp),%eax
c0109347:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010934e:	00 00 00 
c0109351:	8b 45 10             	mov    0x10(%ebp),%eax
c0109354:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010935b:	00 00 00 
c010935e:	8b 45 10             	mov    0x10(%ebp),%eax
c0109361:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109368:	00 00 00 
c010936b:	83 ec 0c             	sub    $0xc,%esp
c010936e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109371:	e8 46 03 00 00       	call   c01096bc <unblock>
c0109376:	83 c4 10             	add    $0x10,%esp
c0109379:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010937c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109382:	85 c0                	test   %eax,%eax
c0109384:	74 1c                	je     c01093a2 <sys_receive_msg+0x47d>
c0109386:	68 56 06 00 00       	push   $0x656
c010938b:	68 61 ba 10 c0       	push   $0xc010ba61
c0109390:	68 61 ba 10 c0       	push   $0xc010ba61
c0109395:	68 5f c0 10 c0       	push   $0xc010c05f
c010939a:	e8 76 f5 ff ff       	call   c0108915 <assertion_failure>
c010939f:	83 c4 10             	add    $0x10,%esp
c01093a2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093a5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01093ac:	84 c0                	test   %al,%al
c01093ae:	74 1c                	je     c01093cc <sys_receive_msg+0x4a7>
c01093b0:	68 57 06 00 00       	push   $0x657
c01093b5:	68 61 ba 10 c0       	push   $0xc010ba61
c01093ba:	68 61 ba 10 c0       	push   $0xc010ba61
c01093bf:	68 77 c0 10 c0       	push   $0xc010c077
c01093c4:	e8 4c f5 ff ff       	call   c0108915 <assertion_failure>
c01093c9:	83 c4 10             	add    $0x10,%esp
c01093cc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093cf:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01093d5:	83 f8 21             	cmp    $0x21,%eax
c01093d8:	74 1c                	je     c01093f6 <sys_receive_msg+0x4d1>
c01093da:	68 58 06 00 00       	push   $0x658
c01093df:	68 61 ba 10 c0       	push   $0xc010ba61
c01093e4:	68 61 ba 10 c0       	push   $0xc010ba61
c01093e9:	68 90 c0 10 c0       	push   $0xc010c090
c01093ee:	e8 22 f5 ff ff       	call   c0108915 <assertion_failure>
c01093f3:	83 c4 10             	add    $0x10,%esp
c01093f6:	8b 45 10             	mov    0x10(%ebp),%eax
c01093f9:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01093ff:	85 c0                	test   %eax,%eax
c0109401:	74 1c                	je     c010941f <sys_receive_msg+0x4fa>
c0109403:	68 5a 06 00 00       	push   $0x65a
c0109408:	68 61 ba 10 c0       	push   $0xc010ba61
c010940d:	68 61 ba 10 c0       	push   $0xc010ba61
c0109412:	68 bc bf 10 c0       	push   $0xc010bfbc
c0109417:	e8 f9 f4 ff ff       	call   c0108915 <assertion_failure>
c010941c:	83 c4 10             	add    $0x10,%esp
c010941f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109422:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109429:	84 c0                	test   %al,%al
c010942b:	74 1c                	je     c0109449 <sys_receive_msg+0x524>
c010942d:	68 5b 06 00 00       	push   $0x65b
c0109432:	68 61 ba 10 c0       	push   $0xc010ba61
c0109437:	68 61 ba 10 c0       	push   $0xc010ba61
c010943c:	68 d1 bf 10 c0       	push   $0xc010bfd1
c0109441:	e8 cf f4 ff ff       	call   c0108915 <assertion_failure>
c0109446:	83 c4 10             	add    $0x10,%esp
c0109449:	8b 45 10             	mov    0x10(%ebp),%eax
c010944c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109452:	83 f8 21             	cmp    $0x21,%eax
c0109455:	74 1c                	je     c0109473 <sys_receive_msg+0x54e>
c0109457:	68 5c 06 00 00       	push   $0x65c
c010945c:	68 61 ba 10 c0       	push   $0xc010ba61
c0109461:	68 61 ba 10 c0       	push   $0xc010ba61
c0109466:	68 e8 bf 10 c0       	push   $0xc010bfe8
c010946b:	e8 a5 f4 ff ff       	call   c0108915 <assertion_failure>
c0109470:	83 c4 10             	add    $0x10,%esp
c0109473:	8b 45 10             	mov    0x10(%ebp),%eax
c0109476:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010947c:	83 f8 21             	cmp    $0x21,%eax
c010947f:	0f 84 f5 00 00 00    	je     c010957a <sys_receive_msg+0x655>
c0109485:	68 5d 06 00 00       	push   $0x65d
c010948a:	68 61 ba 10 c0       	push   $0xc010ba61
c010948f:	68 61 ba 10 c0       	push   $0xc010ba61
c0109494:	68 b4 c0 10 c0       	push   $0xc010c0b4
c0109499:	e8 77 f4 ff ff       	call   c0108915 <assertion_failure>
c010949e:	83 c4 10             	add    $0x10,%esp
c01094a1:	e9 d4 00 00 00       	jmp    c010957a <sys_receive_msg+0x655>
c01094a6:	8b 45 10             	mov    0x10(%ebp),%eax
c01094a9:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c01094b0:	8b 45 10             	mov    0x10(%ebp),%eax
c01094b3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094ba:	3c 02                	cmp    $0x2,%al
c01094bc:	74 1c                	je     c01094da <sys_receive_msg+0x5b5>
c01094be:	68 62 06 00 00       	push   $0x662
c01094c3:	68 61 ba 10 c0       	push   $0xc010ba61
c01094c8:	68 61 ba 10 c0       	push   $0xc010ba61
c01094cd:	68 d3 c0 10 c0       	push   $0xc010c0d3
c01094d2:	e8 3e f4 ff ff       	call   c0108915 <assertion_failure>
c01094d7:	83 c4 10             	add    $0x10,%esp
c01094da:	8b 45 10             	mov    0x10(%ebp),%eax
c01094dd:	8b 55 08             	mov    0x8(%ebp),%edx
c01094e0:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c01094e6:	8b 45 10             	mov    0x10(%ebp),%eax
c01094e9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094f0:	3c 02                	cmp    $0x2,%al
c01094f2:	74 1c                	je     c0109510 <sys_receive_msg+0x5eb>
c01094f4:	68 64 06 00 00       	push   $0x664
c01094f9:	68 61 ba 10 c0       	push   $0xc010ba61
c01094fe:	68 61 ba 10 c0       	push   $0xc010ba61
c0109503:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109508:	e8 08 f4 ff ff       	call   c0108915 <assertion_failure>
c010950d:	83 c4 10             	add    $0x10,%esp
c0109510:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109514:	75 0f                	jne    c0109525 <sys_receive_msg+0x600>
c0109516:	8b 45 10             	mov    0x10(%ebp),%eax
c0109519:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c0109520:	00 00 00 
c0109523:	eb 0c                	jmp    c0109531 <sys_receive_msg+0x60c>
c0109525:	8b 45 10             	mov    0x10(%ebp),%eax
c0109528:	8b 55 0c             	mov    0xc(%ebp),%edx
c010952b:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0109531:	8b 45 10             	mov    0x10(%ebp),%eax
c0109534:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010953b:	3c 02                	cmp    $0x2,%al
c010953d:	74 2d                	je     c010956c <sys_receive_msg+0x647>
c010953f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109542:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109549:	0f be c0             	movsbl %al,%eax
c010954c:	83 ec 0c             	sub    $0xc,%esp
c010954f:	68 6f 06 00 00       	push   $0x66f
c0109554:	68 61 ba 10 c0       	push   $0xc010ba61
c0109559:	68 61 ba 10 c0       	push   $0xc010ba61
c010955e:	50                   	push   %eax
c010955f:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109564:	e8 1e f4 ff ff       	call   c0108987 <assertion_failure2>
c0109569:	83 c4 20             	add    $0x20,%esp
c010956c:	83 ec 0c             	sub    $0xc,%esp
c010956f:	ff 75 10             	pushl  0x10(%ebp)
c0109572:	e8 09 01 00 00       	call   c0109680 <block>
c0109577:	83 c4 10             	add    $0x10,%esp
c010957a:	b8 00 00 00 00       	mov    $0x0,%eax
c010957f:	eb 02                	jmp    c0109583 <sys_receive_msg+0x65e>
c0109581:	90                   	nop
c0109582:	90                   	nop
c0109583:	c9                   	leave  
c0109584:	c3                   	ret    

c0109585 <send_rec>:
c0109585:	55                   	push   %ebp
c0109586:	89 e5                	mov    %esp,%ebp
c0109588:	83 ec 18             	sub    $0x18,%esp
c010958b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010958e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109591:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109598:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c010959c:	74 28                	je     c01095c6 <send_rec+0x41>
c010959e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01095a2:	74 22                	je     c01095c6 <send_rec+0x41>
c01095a4:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01095a8:	74 1c                	je     c01095c6 <send_rec+0x41>
c01095aa:	68 81 06 00 00       	push   $0x681
c01095af:	68 61 ba 10 c0       	push   $0xc010ba61
c01095b4:	68 61 ba 10 c0       	push   $0xc010ba61
c01095b9:	68 f4 c0 10 c0       	push   $0xc010c0f4
c01095be:	e8 52 f3 ff ff       	call   c0108915 <assertion_failure>
c01095c3:	83 c4 10             	add    $0x10,%esp
c01095c6:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01095ca:	75 14                	jne    c01095e0 <send_rec+0x5b>
c01095cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01095cf:	83 ec 04             	sub    $0x4,%esp
c01095d2:	50                   	push   %eax
c01095d3:	6a 00                	push   $0x0
c01095d5:	ff 75 0c             	pushl  0xc(%ebp)
c01095d8:	e8 f2 2b 00 00       	call   c010c1cf <Memset>
c01095dd:	83 c4 10             	add    $0x10,%esp
c01095e0:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01095e4:	74 23                	je     c0109609 <send_rec+0x84>
c01095e6:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01095ea:	74 34                	je     c0109620 <send_rec+0x9b>
c01095ec:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01095f0:	75 74                	jne    c0109666 <send_rec+0xe1>
c01095f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095f5:	83 ec 08             	sub    $0x8,%esp
c01095f8:	ff 75 10             	pushl  0x10(%ebp)
c01095fb:	50                   	push   %eax
c01095fc:	e8 1f 80 ff ff       	call   c0101620 <send_msg>
c0109601:	83 c4 10             	add    $0x10,%esp
c0109604:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109607:	eb 70                	jmp    c0109679 <send_rec+0xf4>
c0109609:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010960c:	83 ec 08             	sub    $0x8,%esp
c010960f:	ff 75 10             	pushl  0x10(%ebp)
c0109612:	50                   	push   %eax
c0109613:	e8 1e 80 ff ff       	call   c0101636 <receive_msg>
c0109618:	83 c4 10             	add    $0x10,%esp
c010961b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010961e:	eb 59                	jmp    c0109679 <send_rec+0xf4>
c0109620:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109623:	83 ec 08             	sub    $0x8,%esp
c0109626:	ff 75 10             	pushl  0x10(%ebp)
c0109629:	50                   	push   %eax
c010962a:	e8 f1 7f ff ff       	call   c0101620 <send_msg>
c010962f:	83 c4 10             	add    $0x10,%esp
c0109632:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109635:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0109639:	75 3d                	jne    c0109678 <send_rec+0xf3>
c010963b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010963e:	83 ec 04             	sub    $0x4,%esp
c0109641:	50                   	push   %eax
c0109642:	6a 00                	push   $0x0
c0109644:	ff 75 0c             	pushl  0xc(%ebp)
c0109647:	e8 83 2b 00 00       	call   c010c1cf <Memset>
c010964c:	83 c4 10             	add    $0x10,%esp
c010964f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109652:	83 ec 08             	sub    $0x8,%esp
c0109655:	ff 75 10             	pushl  0x10(%ebp)
c0109658:	50                   	push   %eax
c0109659:	e8 d8 7f ff ff       	call   c0101636 <receive_msg>
c010965e:	83 c4 10             	add    $0x10,%esp
c0109661:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109664:	eb 12                	jmp    c0109678 <send_rec+0xf3>
c0109666:	83 ec 0c             	sub    $0xc,%esp
c0109669:	68 30 c1 10 c0       	push   $0xc010c130
c010966e:	e8 84 f2 ff ff       	call   c01088f7 <panic>
c0109673:	83 c4 10             	add    $0x10,%esp
c0109676:	eb 01                	jmp    c0109679 <send_rec+0xf4>
c0109678:	90                   	nop
c0109679:	b8 00 00 00 00       	mov    $0x0,%eax
c010967e:	c9                   	leave  
c010967f:	c3                   	ret    

c0109680 <block>:
c0109680:	55                   	push   %ebp
c0109681:	89 e5                	mov    %esp,%ebp
c0109683:	83 ec 08             	sub    $0x8,%esp
c0109686:	8b 45 08             	mov    0x8(%ebp),%eax
c0109689:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109690:	84 c0                	test   %al,%al
c0109692:	75 1c                	jne    c01096b0 <block+0x30>
c0109694:	68 b0 06 00 00       	push   $0x6b0
c0109699:	68 61 ba 10 c0       	push   $0xc010ba61
c010969e:	68 61 ba 10 c0       	push   $0xc010ba61
c01096a3:	68 45 c1 10 c0       	push   $0xc010c145
c01096a8:	e8 68 f2 ff ff       	call   c0108915 <assertion_failure>
c01096ad:	83 c4 10             	add    $0x10,%esp
c01096b0:	e8 13 a0 ff ff       	call   c01036c8 <schedule_process>
c01096b5:	b8 00 00 00 00       	mov    $0x0,%eax
c01096ba:	c9                   	leave  
c01096bb:	c3                   	ret    

c01096bc <unblock>:
c01096bc:	55                   	push   %ebp
c01096bd:	89 e5                	mov    %esp,%ebp
c01096bf:	83 ec 08             	sub    $0x8,%esp
c01096c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01096c5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096cc:	84 c0                	test   %al,%al
c01096ce:	74 1c                	je     c01096ec <unblock+0x30>
c01096d0:	68 b9 06 00 00       	push   $0x6b9
c01096d5:	68 61 ba 10 c0       	push   $0xc010ba61
c01096da:	68 61 ba 10 c0       	push   $0xc010ba61
c01096df:	68 5d c1 10 c0       	push   $0xc010c15d
c01096e4:	e8 2c f2 ff ff       	call   c0108915 <assertion_failure>
c01096e9:	83 c4 10             	add    $0x10,%esp
c01096ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01096ef:	05 60 02 00 00       	add    $0x260,%eax
c01096f4:	83 ec 08             	sub    $0x8,%esp
c01096f7:	50                   	push   %eax
c01096f8:	68 ec fd 10 c0       	push   $0xc010fdec
c01096fd:	e8 ce 0a 00 00       	call   c010a1d0 <appendToDoubleLinkList>
c0109702:	83 c4 10             	add    $0x10,%esp
c0109705:	b8 00 00 00 00       	mov    $0x0,%eax
c010970a:	c9                   	leave  
c010970b:	c3                   	ret    

c010970c <get_ticks_ipc>:
c010970c:	55                   	push   %ebp
c010970d:	89 e5                	mov    %esp,%ebp
c010970f:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109715:	83 ec 04             	sub    $0x4,%esp
c0109718:	6a 7c                	push   $0x7c
c010971a:	6a 00                	push   $0x0
c010971c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109722:	50                   	push   %eax
c0109723:	e8 a7 2a 00 00       	call   c010c1cf <Memset>
c0109728:	83 c4 10             	add    $0x10,%esp
c010972b:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109732:	00 00 00 
c0109735:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010973c:	83 ec 04             	sub    $0x4,%esp
c010973f:	6a 01                	push   $0x1
c0109741:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109747:	50                   	push   %eax
c0109748:	6a 03                	push   $0x3
c010974a:	e8 36 fe ff ff       	call   c0109585 <send_rec>
c010974f:	83 c4 10             	add    $0x10,%esp
c0109752:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109755:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010975b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010975e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109761:	c9                   	leave  
c0109762:	c3                   	ret    

c0109763 <itoa>:
c0109763:	55                   	push   %ebp
c0109764:	89 e5                	mov    %esp,%ebp
c0109766:	53                   	push   %ebx
c0109767:	83 ec 14             	sub    $0x14,%esp
c010976a:	8b 45 08             	mov    0x8(%ebp),%eax
c010976d:	99                   	cltd   
c010976e:	f7 7d 10             	idivl  0x10(%ebp)
c0109771:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109774:	8b 45 08             	mov    0x8(%ebp),%eax
c0109777:	99                   	cltd   
c0109778:	f7 7d 10             	idivl  0x10(%ebp)
c010977b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010977e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109782:	74 14                	je     c0109798 <itoa+0x35>
c0109784:	83 ec 04             	sub    $0x4,%esp
c0109787:	ff 75 10             	pushl  0x10(%ebp)
c010978a:	ff 75 0c             	pushl  0xc(%ebp)
c010978d:	ff 75 f0             	pushl  -0x10(%ebp)
c0109790:	e8 ce ff ff ff       	call   c0109763 <itoa>
c0109795:	83 c4 10             	add    $0x10,%esp
c0109798:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010979b:	8d 58 30             	lea    0x30(%eax),%ebx
c010979e:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097a1:	8b 00                	mov    (%eax),%eax
c01097a3:	8d 48 01             	lea    0x1(%eax),%ecx
c01097a6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01097a9:	89 0a                	mov    %ecx,(%edx)
c01097ab:	89 da                	mov    %ebx,%edx
c01097ad:	88 10                	mov    %dl,(%eax)
c01097af:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097b2:	8b 00                	mov    (%eax),%eax
c01097b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01097b7:	c9                   	leave  
c01097b8:	c3                   	ret    

c01097b9 <i2a>:
c01097b9:	55                   	push   %ebp
c01097ba:	89 e5                	mov    %esp,%ebp
c01097bc:	53                   	push   %ebx
c01097bd:	83 ec 14             	sub    $0x14,%esp
c01097c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01097c3:	99                   	cltd   
c01097c4:	f7 7d 0c             	idivl  0xc(%ebp)
c01097c7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01097ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01097cd:	99                   	cltd   
c01097ce:	f7 7d 0c             	idivl  0xc(%ebp)
c01097d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01097d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01097d8:	74 14                	je     c01097ee <i2a+0x35>
c01097da:	83 ec 04             	sub    $0x4,%esp
c01097dd:	ff 75 10             	pushl  0x10(%ebp)
c01097e0:	ff 75 0c             	pushl  0xc(%ebp)
c01097e3:	ff 75 f0             	pushl  -0x10(%ebp)
c01097e6:	e8 ce ff ff ff       	call   c01097b9 <i2a>
c01097eb:	83 c4 10             	add    $0x10,%esp
c01097ee:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01097f2:	7f 0a                	jg     c01097fe <i2a+0x45>
c01097f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097f7:	83 c0 30             	add    $0x30,%eax
c01097fa:	89 c3                	mov    %eax,%ebx
c01097fc:	eb 08                	jmp    c0109806 <i2a+0x4d>
c01097fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109801:	83 c0 37             	add    $0x37,%eax
c0109804:	89 c3                	mov    %eax,%ebx
c0109806:	8b 45 10             	mov    0x10(%ebp),%eax
c0109809:	8b 00                	mov    (%eax),%eax
c010980b:	8d 48 01             	lea    0x1(%eax),%ecx
c010980e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109811:	89 0a                	mov    %ecx,(%edx)
c0109813:	88 18                	mov    %bl,(%eax)
c0109815:	8b 45 10             	mov    0x10(%ebp),%eax
c0109818:	8b 00                	mov    (%eax),%eax
c010981a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010981d:	c9                   	leave  
c010981e:	c3                   	ret    

c010981f <inform_int>:
c010981f:	55                   	push   %ebp
c0109820:	89 e5                	mov    %esp,%ebp
c0109822:	83 ec 18             	sub    $0x18,%esp
c0109825:	83 ec 0c             	sub    $0xc,%esp
c0109828:	ff 75 08             	pushl  0x8(%ebp)
c010982b:	e8 16 a0 ff ff       	call   c0103846 <pid2proc>
c0109830:	83 c4 10             	add    $0x10,%esp
c0109833:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109836:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109839:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109840:	0f be c0             	movsbl %al,%eax
c0109843:	83 e0 02             	and    $0x2,%eax
c0109846:	85 c0                	test   %eax,%eax
c0109848:	0f 84 8e 00 00 00    	je     c01098dc <inform_int+0xbd>
c010984e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109851:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109857:	3d 13 02 00 00       	cmp    $0x213,%eax
c010985c:	74 0e                	je     c010986c <inform_int+0x4d>
c010985e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109861:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109867:	83 f8 12             	cmp    $0x12,%eax
c010986a:	75 7d                	jne    c01098e9 <inform_int+0xca>
c010986c:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109873:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109876:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010987c:	83 ec 08             	sub    $0x8,%esp
c010987f:	ff 75 f0             	pushl  -0x10(%ebp)
c0109882:	50                   	push   %eax
c0109883:	e8 07 c6 ff ff       	call   c0105e8f <alloc_virtual_memory>
c0109888:	83 c4 10             	add    $0x10,%esp
c010988b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010988e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109891:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109897:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010989a:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c01098a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098a4:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c01098ab:	00 00 00 
c01098ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098b1:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01098b8:	00 00 00 
c01098bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01098c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098c5:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01098cc:	83 ec 0c             	sub    $0xc,%esp
c01098cf:	ff 75 f4             	pushl  -0xc(%ebp)
c01098d2:	e8 e5 fd ff ff       	call   c01096bc <unblock>
c01098d7:	83 c4 10             	add    $0x10,%esp
c01098da:	eb 0d                	jmp    c01098e9 <inform_int+0xca>
c01098dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098df:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c01098e6:	00 00 00 
c01098e9:	90                   	nop
c01098ea:	c9                   	leave  
c01098eb:	c3                   	ret    

c01098ec <strcmp>:
c01098ec:	55                   	push   %ebp
c01098ed:	89 e5                	mov    %esp,%ebp
c01098ef:	83 ec 10             	sub    $0x10,%esp
c01098f2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01098f6:	74 06                	je     c01098fe <strcmp+0x12>
c01098f8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01098fc:	75 08                	jne    c0109906 <strcmp+0x1a>
c01098fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0109901:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109904:	eb 53                	jmp    c0109959 <strcmp+0x6d>
c0109906:	8b 45 08             	mov    0x8(%ebp),%eax
c0109909:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010990c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010990f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109912:	eb 18                	jmp    c010992c <strcmp+0x40>
c0109914:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109917:	0f b6 10             	movzbl (%eax),%edx
c010991a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010991d:	0f b6 00             	movzbl (%eax),%eax
c0109920:	38 c2                	cmp    %al,%dl
c0109922:	75 1e                	jne    c0109942 <strcmp+0x56>
c0109924:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0109928:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010992c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010992f:	0f b6 00             	movzbl (%eax),%eax
c0109932:	84 c0                	test   %al,%al
c0109934:	74 0d                	je     c0109943 <strcmp+0x57>
c0109936:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109939:	0f b6 00             	movzbl (%eax),%eax
c010993c:	84 c0                	test   %al,%al
c010993e:	75 d4                	jne    c0109914 <strcmp+0x28>
c0109940:	eb 01                	jmp    c0109943 <strcmp+0x57>
c0109942:	90                   	nop
c0109943:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109946:	0f b6 00             	movzbl (%eax),%eax
c0109949:	0f be d0             	movsbl %al,%edx
c010994c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010994f:	0f b6 00             	movzbl (%eax),%eax
c0109952:	0f be c0             	movsbl %al,%eax
c0109955:	29 c2                	sub    %eax,%edx
c0109957:	89 d0                	mov    %edx,%eax
c0109959:	c9                   	leave  
c010995a:	c3                   	ret    

c010995b <create_user_process_address_space>:
c010995b:	55                   	push   %ebp
c010995c:	89 e5                	mov    %esp,%ebp
c010995e:	83 ec 18             	sub    $0x18,%esp
c0109961:	83 ec 08             	sub    $0x8,%esp
c0109964:	6a 00                	push   $0x0
c0109966:	6a 01                	push   $0x1
c0109968:	e8 5a c8 ff ff       	call   c01061c7 <alloc_memory>
c010996d:	83 c4 10             	add    $0x10,%esp
c0109970:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109973:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109976:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c010997d:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109984:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109987:	05 ff 0f 00 00       	add    $0xfff,%eax
c010998c:	c1 e8 0c             	shr    $0xc,%eax
c010998f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109992:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109995:	83 c0 07             	add    $0x7,%eax
c0109998:	c1 e8 03             	shr    $0x3,%eax
c010999b:	89 c2                	mov    %eax,%edx
c010999d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099a0:	89 50 04             	mov    %edx,0x4(%eax)
c01099a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099a6:	8b 40 04             	mov    0x4(%eax),%eax
c01099a9:	05 ff 0f 00 00       	add    $0xfff,%eax
c01099ae:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01099b4:	85 c0                	test   %eax,%eax
c01099b6:	0f 48 c2             	cmovs  %edx,%eax
c01099b9:	c1 f8 0c             	sar    $0xc,%eax
c01099bc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01099bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01099c2:	83 ec 08             	sub    $0x8,%esp
c01099c5:	6a 00                	push   $0x0
c01099c7:	50                   	push   %eax
c01099c8:	e8 fa c7 ff ff       	call   c01061c7 <alloc_memory>
c01099cd:	83 c4 10             	add    $0x10,%esp
c01099d0:	89 c2                	mov    %eax,%edx
c01099d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099d5:	89 10                	mov    %edx,(%eax)
c01099d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099da:	83 ec 0c             	sub    $0xc,%esp
c01099dd:	50                   	push   %eax
c01099de:	e8 b6 bf ff ff       	call   c0105999 <init_bitmap>
c01099e3:	83 c4 10             	add    $0x10,%esp
c01099e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099e9:	c9                   	leave  
c01099ea:	c3                   	ret    

c01099eb <user_process>:
c01099eb:	55                   	push   %ebp
c01099ec:	89 e5                	mov    %esp,%ebp
c01099ee:	83 ec 38             	sub    $0x38,%esp
c01099f1:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c01099f8:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c01099ff:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109a06:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0109a0a:	75 0e                	jne    c0109a1a <user_process+0x2f>
c0109a0c:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109a12:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109a18:	eb 0c                	jmp    c0109a26 <user_process+0x3b>
c0109a1a:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109a20:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109a26:	e8 c3 69 ff ff       	call   c01003ee <get_running_thread_pcb>
c0109a2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109a2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a31:	8b 55 14             	mov    0x14(%ebp),%edx
c0109a34:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109a3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a3d:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109a43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a46:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109a4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a4f:	05 00 10 00 00       	add    $0x1000,%eax
c0109a54:	89 c2                	mov    %eax,%edx
c0109a56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a59:	89 10                	mov    %edx,(%eax)
c0109a5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a5e:	8b 00                	mov    (%eax),%eax
c0109a60:	83 e8 44             	sub    $0x44,%eax
c0109a63:	89 c2                	mov    %eax,%edx
c0109a65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a68:	89 10                	mov    %edx,(%eax)
c0109a6a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a6d:	8b 00                	mov    (%eax),%eax
c0109a6f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109a72:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109a76:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109a7c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109a80:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109a84:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109a88:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109a8c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109a90:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109a94:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109a9a:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109a9e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109aa1:	89 50 34             	mov    %edx,0x34(%eax)
c0109aa4:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109aa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109aab:	89 50 0c             	mov    %edx,0xc(%eax)
c0109aae:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ab2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ab5:	89 50 04             	mov    %edx,0x4(%eax)
c0109ab8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109abc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109abf:	89 50 08             	mov    %edx,0x8(%eax)
c0109ac2:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ac6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ac9:	89 50 40             	mov    %edx,0x40(%eax)
c0109acc:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109ad0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ad3:	89 10                	mov    %edx,(%eax)
c0109ad5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ad8:	8b 55 08             	mov    0x8(%ebp),%edx
c0109adb:	89 50 30             	mov    %edx,0x30(%eax)
c0109ade:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109ae2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ae5:	89 50 38             	mov    %edx,0x38(%eax)
c0109ae8:	83 ec 08             	sub    $0x8,%esp
c0109aeb:	6a 01                	push   $0x1
c0109aed:	68 00 f0 ff bf       	push   $0xbffff000
c0109af2:	e8 08 c6 ff ff       	call   c01060ff <alloc_physical_memory>
c0109af7:	83 c4 10             	add    $0x10,%esp
c0109afa:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109b00:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b03:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109b06:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b09:	83 ec 0c             	sub    $0xc,%esp
c0109b0c:	50                   	push   %eax
c0109b0d:	e8 af 67 ff ff       	call   c01002c1 <restart>
c0109b12:	83 c4 10             	add    $0x10,%esp
c0109b15:	90                   	nop
c0109b16:	c9                   	leave  
c0109b17:	c3                   	ret    

c0109b18 <clone_pcb>:
c0109b18:	55                   	push   %ebp
c0109b19:	89 e5                	mov    %esp,%ebp
c0109b1b:	83 ec 38             	sub    $0x38,%esp
c0109b1e:	83 ec 08             	sub    $0x8,%esp
c0109b21:	6a 00                	push   $0x0
c0109b23:	6a 01                	push   $0x1
c0109b25:	e8 9d c6 ff ff       	call   c01061c7 <alloc_memory>
c0109b2a:	83 c4 10             	add    $0x10,%esp
c0109b2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109b30:	83 ec 04             	sub    $0x4,%esp
c0109b33:	68 00 10 00 00       	push   $0x1000
c0109b38:	6a 00                	push   $0x0
c0109b3a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b3d:	e8 8d 26 00 00       	call   c010c1cf <Memset>
c0109b42:	83 c4 10             	add    $0x10,%esp
c0109b45:	83 ec 04             	sub    $0x4,%esp
c0109b48:	68 00 10 00 00       	push   $0x1000
c0109b4d:	ff 75 08             	pushl  0x8(%ebp)
c0109b50:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b53:	e8 a4 d1 ff ff       	call   c0106cfc <Memcpy>
c0109b58:	83 c4 10             	add    $0x10,%esp
c0109b5b:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0109b60:	8d 50 01             	lea    0x1(%eax),%edx
c0109b63:	89 15 c8 06 11 c0    	mov    %edx,0xc01106c8
c0109b69:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109b6c:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109b72:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b75:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109b7b:	89 c2                	mov    %eax,%edx
c0109b7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b80:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109b86:	83 ec 08             	sub    $0x8,%esp
c0109b89:	6a 00                	push   $0x0
c0109b8b:	6a 01                	push   $0x1
c0109b8d:	e8 35 c6 ff ff       	call   c01061c7 <alloc_memory>
c0109b92:	83 c4 10             	add    $0x10,%esp
c0109b95:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109b98:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b9b:	05 00 0c 00 00       	add    $0xc00,%eax
c0109ba0:	83 ec 04             	sub    $0x4,%esp
c0109ba3:	68 00 04 00 00       	push   $0x400
c0109ba8:	68 00 fc ff ff       	push   $0xfffffc00
c0109bad:	50                   	push   %eax
c0109bae:	e8 49 d1 ff ff       	call   c0106cfc <Memcpy>
c0109bb3:	83 c4 10             	add    $0x10,%esp
c0109bb6:	83 ec 0c             	sub    $0xc,%esp
c0109bb9:	ff 75 f0             	pushl  -0x10(%ebp)
c0109bbc:	e8 1d c4 ff ff       	call   c0105fde <get_physical_address>
c0109bc1:	83 c4 10             	add    $0x10,%esp
c0109bc4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109bc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bca:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109bcf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109bd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109bd5:	83 c8 07             	or     $0x7,%eax
c0109bd8:	89 c2                	mov    %eax,%edx
c0109bda:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109bdd:	89 10                	mov    %edx,(%eax)
c0109bdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109be2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109be5:	89 50 08             	mov    %edx,0x8(%eax)
c0109be8:	e8 6e fd ff ff       	call   c010995b <create_user_process_address_space>
c0109bed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109bf0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bf6:	89 50 0c             	mov    %edx,0xc(%eax)
c0109bf9:	8b 45 08             	mov    0x8(%ebp),%eax
c0109bfc:	8b 40 0c             	mov    0xc(%eax),%eax
c0109bff:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109c02:	83 ec 04             	sub    $0x4,%esp
c0109c05:	6a 0c                	push   $0xc
c0109c07:	ff 75 e0             	pushl  -0x20(%ebp)
c0109c0a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109c0d:	e8 ea d0 ff ff       	call   c0106cfc <Memcpy>
c0109c12:	83 c4 10             	add    $0x10,%esp
c0109c15:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109c1c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109c1f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109c24:	c1 e8 0c             	shr    $0xc,%eax
c0109c27:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109c2a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109c2d:	83 c0 07             	add    $0x7,%eax
c0109c30:	c1 e8 03             	shr    $0x3,%eax
c0109c33:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109c36:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109c39:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109c3c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109c3f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109c44:	c1 e8 0c             	shr    $0xc,%eax
c0109c47:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109c4a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109c4d:	83 ec 08             	sub    $0x8,%esp
c0109c50:	6a 00                	push   $0x0
c0109c52:	50                   	push   %eax
c0109c53:	e8 6f c5 ff ff       	call   c01061c7 <alloc_memory>
c0109c58:	83 c4 10             	add    $0x10,%esp
c0109c5b:	89 c2                	mov    %eax,%edx
c0109c5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c60:	89 10                	mov    %edx,(%eax)
c0109c62:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109c65:	c1 e0 0c             	shl    $0xc,%eax
c0109c68:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109c6b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c6e:	8b 10                	mov    (%eax),%edx
c0109c70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c73:	8b 00                	mov    (%eax),%eax
c0109c75:	83 ec 04             	sub    $0x4,%esp
c0109c78:	ff 75 cc             	pushl  -0x34(%ebp)
c0109c7b:	52                   	push   %edx
c0109c7c:	50                   	push   %eax
c0109c7d:	e8 7a d0 ff ff       	call   c0106cfc <Memcpy>
c0109c82:	83 c4 10             	add    $0x10,%esp
c0109c85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c88:	c9                   	leave  
c0109c89:	c3                   	ret    

c0109c8a <build_body_stack>:
c0109c8a:	55                   	push   %ebp
c0109c8b:	89 e5                	mov    %esp,%ebp
c0109c8d:	83 ec 48             	sub    $0x48,%esp
c0109c90:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c93:	8b 40 0c             	mov    0xc(%eax),%eax
c0109c96:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c99:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c9c:	8b 50 04             	mov    0x4(%eax),%edx
c0109c9f:	8b 00                	mov    (%eax),%eax
c0109ca1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109ca4:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109ca7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109caa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109cad:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109cb0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109cb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cb6:	8b 40 08             	mov    0x8(%eax),%eax
c0109cb9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109cbc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109cc3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109cca:	e8 c9 cf ff ff       	call   c0106c98 <intr_disable>
c0109ccf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109cd2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109cd9:	e9 c2 00 00 00       	jmp    c0109da0 <build_body_stack+0x116>
c0109cde:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109ce1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ce4:	01 d0                	add    %edx,%eax
c0109ce6:	0f b6 00             	movzbl (%eax),%eax
c0109ce9:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109cec:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109cf3:	e9 9a 00 00 00       	jmp    c0109d92 <build_body_stack+0x108>
c0109cf8:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109cfc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109cff:	89 c1                	mov    %eax,%ecx
c0109d01:	d3 fa                	sar    %cl,%edx
c0109d03:	89 d0                	mov    %edx,%eax
c0109d05:	83 e0 01             	and    $0x1,%eax
c0109d08:	85 c0                	test   %eax,%eax
c0109d0a:	75 06                	jne    c0109d12 <build_body_stack+0x88>
c0109d0c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109d10:	eb 7c                	jmp    c0109d8e <build_body_stack+0x104>
c0109d12:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d15:	8b 40 08             	mov    0x8(%eax),%eax
c0109d18:	83 ec 0c             	sub    $0xc,%esp
c0109d1b:	50                   	push   %eax
c0109d1c:	e8 b1 66 ff ff       	call   c01003d2 <update_cr3>
c0109d21:	83 c4 10             	add    $0x10,%esp
c0109d24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d27:	c1 e0 0c             	shl    $0xc,%eax
c0109d2a:	89 c2                	mov    %eax,%edx
c0109d2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109d2f:	01 d0                	add    %edx,%eax
c0109d31:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109d34:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109d37:	8b 45 10             	mov    0x10(%ebp),%eax
c0109d3a:	83 ec 04             	sub    $0x4,%esp
c0109d3d:	68 00 10 00 00       	push   $0x1000
c0109d42:	52                   	push   %edx
c0109d43:	50                   	push   %eax
c0109d44:	e8 b3 cf ff ff       	call   c0106cfc <Memcpy>
c0109d49:	83 c4 10             	add    $0x10,%esp
c0109d4c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109d4f:	8b 40 08             	mov    0x8(%eax),%eax
c0109d52:	83 ec 0c             	sub    $0xc,%esp
c0109d55:	50                   	push   %eax
c0109d56:	e8 77 66 ff ff       	call   c01003d2 <update_cr3>
c0109d5b:	83 c4 10             	add    $0x10,%esp
c0109d5e:	83 ec 08             	sub    $0x8,%esp
c0109d61:	ff 75 cc             	pushl  -0x34(%ebp)
c0109d64:	6a 01                	push   $0x1
c0109d66:	e8 be c4 ff ff       	call   c0106229 <get_a_virtual_page>
c0109d6b:	83 c4 10             	add    $0x10,%esp
c0109d6e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109d71:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109d74:	83 ec 04             	sub    $0x4,%esp
c0109d77:	68 00 10 00 00       	push   $0x1000
c0109d7c:	52                   	push   %edx
c0109d7d:	50                   	push   %eax
c0109d7e:	e8 79 cf ff ff       	call   c0106cfc <Memcpy>
c0109d83:	83 c4 10             	add    $0x10,%esp
c0109d86:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109d8a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109d8e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109d92:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109d96:	0f 8e 5c ff ff ff    	jle    c0109cf8 <build_body_stack+0x6e>
c0109d9c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109da0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109da3:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109da6:	0f 87 32 ff ff ff    	ja     c0109cde <build_body_stack+0x54>
c0109dac:	83 ec 0c             	sub    $0xc,%esp
c0109daf:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109db2:	e8 0a cf ff ff       	call   c0106cc1 <intr_set_status>
c0109db7:	83 c4 10             	add    $0x10,%esp
c0109dba:	90                   	nop
c0109dbb:	c9                   	leave  
c0109dbc:	c3                   	ret    

c0109dbd <build_process_kernel_stack>:
c0109dbd:	55                   	push   %ebp
c0109dbe:	89 e5                	mov    %esp,%ebp
c0109dc0:	83 ec 28             	sub    $0x28,%esp
c0109dc3:	e8 d0 ce ff ff       	call   c0106c98 <intr_disable>
c0109dc8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109dcb:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dce:	05 00 10 00 00       	add    $0x1000,%eax
c0109dd3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109dd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dd9:	8b 00                	mov    (%eax),%eax
c0109ddb:	83 f8 38             	cmp    $0x38,%eax
c0109dde:	74 06                	je     c0109de6 <build_process_kernel_stack+0x29>
c0109de0:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109de4:	eb f0                	jmp    c0109dd6 <build_process_kernel_stack+0x19>
c0109de6:	90                   	nop
c0109de7:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dea:	05 00 10 00 00       	add    $0x1000,%eax
c0109def:	89 c2                	mov    %eax,%edx
c0109df1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109df4:	89 50 04             	mov    %edx,0x4(%eax)
c0109df7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dfa:	83 c0 2c             	add    $0x2c,%eax
c0109dfd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109e00:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e03:	83 e8 04             	sub    $0x4,%eax
c0109e06:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109e09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e0c:	83 e8 08             	sub    $0x8,%eax
c0109e0f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e15:	83 e8 0c             	sub    $0xc,%eax
c0109e18:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109e1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e1e:	83 e8 10             	sub    $0x10,%eax
c0109e21:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109e24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e27:	83 e8 14             	sub    $0x14,%eax
c0109e2a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109e2d:	ba b2 02 10 c0       	mov    $0xc01002b2,%edx
c0109e32:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e35:	89 10                	mov    %edx,(%eax)
c0109e37:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e3a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109e40:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e43:	8b 10                	mov    (%eax),%edx
c0109e45:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e48:	89 10                	mov    %edx,(%eax)
c0109e4a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e4d:	8b 10                	mov    (%eax),%edx
c0109e4f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e52:	89 10                	mov    %edx,(%eax)
c0109e54:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e57:	8b 10                	mov    (%eax),%edx
c0109e59:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e5c:	89 10                	mov    %edx,(%eax)
c0109e5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e61:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109e67:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e6a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109e6d:	89 10                	mov    %edx,(%eax)
c0109e6f:	83 ec 0c             	sub    $0xc,%esp
c0109e72:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e75:	e8 47 ce ff ff       	call   c0106cc1 <intr_set_status>
c0109e7a:	83 c4 10             	add    $0x10,%esp
c0109e7d:	90                   	nop
c0109e7e:	c9                   	leave  
c0109e7f:	c3                   	ret    

c0109e80 <fork_process>:
c0109e80:	55                   	push   %ebp
c0109e81:	89 e5                	mov    %esp,%ebp
c0109e83:	83 ec 18             	sub    $0x18,%esp
c0109e86:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e89:	83 ec 0c             	sub    $0xc,%esp
c0109e8c:	50                   	push   %eax
c0109e8d:	e8 b4 99 ff ff       	call   c0103846 <pid2proc>
c0109e92:	83 c4 10             	add    $0x10,%esp
c0109e95:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e98:	83 ec 0c             	sub    $0xc,%esp
c0109e9b:	ff 75 f4             	pushl  -0xc(%ebp)
c0109e9e:	e8 75 fc ff ff       	call   c0109b18 <clone_pcb>
c0109ea3:	83 c4 10             	add    $0x10,%esp
c0109ea6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109ea9:	83 ec 08             	sub    $0x8,%esp
c0109eac:	6a 00                	push   $0x0
c0109eae:	6a 01                	push   $0x1
c0109eb0:	e8 12 c3 ff ff       	call   c01061c7 <alloc_memory>
c0109eb5:	83 c4 10             	add    $0x10,%esp
c0109eb8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109ebb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109ebe:	83 ec 04             	sub    $0x4,%esp
c0109ec1:	68 00 10 00 00       	push   $0x1000
c0109ec6:	6a 00                	push   $0x0
c0109ec8:	50                   	push   %eax
c0109ec9:	e8 01 23 00 00       	call   c010c1cf <Memset>
c0109ece:	83 c4 10             	add    $0x10,%esp
c0109ed1:	83 ec 04             	sub    $0x4,%esp
c0109ed4:	ff 75 ec             	pushl  -0x14(%ebp)
c0109ed7:	ff 75 f0             	pushl  -0x10(%ebp)
c0109eda:	ff 75 f4             	pushl  -0xc(%ebp)
c0109edd:	e8 a8 fd ff ff       	call   c0109c8a <build_body_stack>
c0109ee2:	83 c4 10             	add    $0x10,%esp
c0109ee5:	83 ec 0c             	sub    $0xc,%esp
c0109ee8:	ff 75 f0             	pushl  -0x10(%ebp)
c0109eeb:	e8 cd fe ff ff       	call   c0109dbd <build_process_kernel_stack>
c0109ef0:	83 c4 10             	add    $0x10,%esp
c0109ef3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ef6:	05 6a 02 00 00       	add    $0x26a,%eax
c0109efb:	83 ec 08             	sub    $0x8,%esp
c0109efe:	50                   	push   %eax
c0109eff:	68 04 0f 11 c0       	push   $0xc0110f04
c0109f04:	e8 c7 02 00 00       	call   c010a1d0 <appendToDoubleLinkList>
c0109f09:	83 c4 10             	add    $0x10,%esp
c0109f0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f0f:	c9                   	leave  
c0109f10:	c3                   	ret    

c0109f11 <process_execute>:
c0109f11:	55                   	push   %ebp
c0109f12:	89 e5                	mov    %esp,%ebp
c0109f14:	83 ec 28             	sub    $0x28,%esp
c0109f17:	e8 ca 04 00 00       	call   c010a3e6 <thread_init>
c0109f1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109f1f:	83 ec 0c             	sub    $0xc,%esp
c0109f22:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f25:	e8 69 05 00 00       	call   c010a493 <thread_create>
c0109f2a:	83 c4 10             	add    $0x10,%esp
c0109f2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f30:	05 28 01 00 00       	add    $0x128,%eax
c0109f35:	83 ec 08             	sub    $0x8,%esp
c0109f38:	ff 75 10             	pushl  0x10(%ebp)
c0109f3b:	50                   	push   %eax
c0109f3c:	e8 ad 22 00 00       	call   c010c1ee <Strcpy>
c0109f41:	83 c4 10             	add    $0x10,%esp
c0109f44:	83 ec 08             	sub    $0x8,%esp
c0109f47:	6a 00                	push   $0x0
c0109f49:	6a 01                	push   $0x1
c0109f4b:	e8 77 c2 ff ff       	call   c01061c7 <alloc_memory>
c0109f50:	83 c4 10             	add    $0x10,%esp
c0109f53:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109f56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f59:	05 00 0c 00 00       	add    $0xc00,%eax
c0109f5e:	83 ec 04             	sub    $0x4,%esp
c0109f61:	68 00 04 00 00       	push   $0x400
c0109f66:	68 00 fc ff ff       	push   $0xfffffc00
c0109f6b:	50                   	push   %eax
c0109f6c:	e8 8b cd ff ff       	call   c0106cfc <Memcpy>
c0109f71:	83 c4 10             	add    $0x10,%esp
c0109f74:	83 ec 0c             	sub    $0xc,%esp
c0109f77:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f7a:	e8 5f c0 ff ff       	call   c0105fde <get_physical_address>
c0109f7f:	83 c4 10             	add    $0x10,%esp
c0109f82:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109f85:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f88:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109f8d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109f90:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109f93:	83 c8 07             	or     $0x7,%eax
c0109f96:	89 c2                	mov    %eax,%edx
c0109f98:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109f9b:	89 10                	mov    %edx,(%eax)
c0109f9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fa0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109fa3:	89 50 08             	mov    %edx,0x8(%eax)
c0109fa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fa9:	83 c0 10             	add    $0x10,%eax
c0109fac:	83 ec 0c             	sub    $0xc,%esp
c0109faf:	50                   	push   %eax
c0109fb0:	e8 c8 c7 ff ff       	call   c010677d <init_memory_block_desc>
c0109fb5:	83 c4 10             	add    $0x10,%esp
c0109fb8:	e8 9e f9 ff ff       	call   c010995b <create_user_process_address_space>
c0109fbd:	89 c2                	mov    %eax,%edx
c0109fbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fc2:	89 50 0c             	mov    %edx,0xc(%eax)
c0109fc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fc8:	8b 00                	mov    (%eax),%eax
c0109fca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109fcd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fd0:	c7 40 10 eb 99 10 c0 	movl   $0xc01099eb,0x10(%eax)
c0109fd7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fda:	8b 55 08             	mov    0x8(%ebp),%edx
c0109fdd:	89 50 18             	mov    %edx,0x18(%eax)
c0109fe0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fe3:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109fe6:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109fe9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fec:	8b 55 14             	mov    0x14(%ebp),%edx
c0109fef:	89 50 20             	mov    %edx,0x20(%eax)
c0109ff2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ff5:	8b 55 18             	mov    0x18(%ebp),%edx
c0109ff8:	89 50 24             	mov    %edx,0x24(%eax)
c0109ffb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109ffe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a001:	89 50 28             	mov    %edx,0x28(%eax)
c010a004:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a007:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a00d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a010:	8b 10                	mov    (%eax),%edx
c010a012:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a015:	89 50 04             	mov    %edx,0x4(%eax)
c010a018:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a01b:	8b 50 04             	mov    0x4(%eax),%edx
c010a01e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a021:	89 50 08             	mov    %edx,0x8(%eax)
c010a024:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a027:	8b 50 08             	mov    0x8(%eax),%edx
c010a02a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a02d:	89 50 0c             	mov    %edx,0xc(%eax)
c010a030:	83 ec 0c             	sub    $0xc,%esp
c010a033:	68 ec fd 10 c0       	push   $0xc010fdec
c010a038:	e8 96 00 00 00       	call   c010a0d3 <isListEmpty>
c010a03d:	83 c4 10             	add    $0x10,%esp
c010a040:	e8 53 cc ff ff       	call   c0106c98 <intr_disable>
c010a045:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a048:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a04b:	05 60 02 00 00       	add    $0x260,%eax
c010a050:	83 ec 08             	sub    $0x8,%esp
c010a053:	50                   	push   %eax
c010a054:	68 ec fd 10 c0       	push   $0xc010fdec
c010a059:	e8 72 01 00 00       	call   c010a1d0 <appendToDoubleLinkList>
c010a05e:	83 c4 10             	add    $0x10,%esp
c010a061:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a064:	05 6a 02 00 00       	add    $0x26a,%eax
c010a069:	83 ec 08             	sub    $0x8,%esp
c010a06c:	50                   	push   %eax
c010a06d:	68 04 0f 11 c0       	push   $0xc0110f04
c010a072:	e8 59 01 00 00       	call   c010a1d0 <appendToDoubleLinkList>
c010a077:	83 c4 10             	add    $0x10,%esp
c010a07a:	83 ec 0c             	sub    $0xc,%esp
c010a07d:	ff 75 e0             	pushl  -0x20(%ebp)
c010a080:	e8 3c cc ff ff       	call   c0106cc1 <intr_set_status>
c010a085:	83 c4 10             	add    $0x10,%esp
c010a088:	90                   	nop
c010a089:	c9                   	leave  
c010a08a:	c3                   	ret    
c010a08b:	66 90                	xchg   %ax,%ax
c010a08d:	66 90                	xchg   %ax,%ax
c010a08f:	90                   	nop

c010a090 <switch_to>:
c010a090:	56                   	push   %esi
c010a091:	57                   	push   %edi
c010a092:	53                   	push   %ebx
c010a093:	55                   	push   %ebp
c010a094:	89 e5                	mov    %esp,%ebp
c010a096:	8b 45 14             	mov    0x14(%ebp),%eax
c010a099:	89 20                	mov    %esp,(%eax)
c010a09b:	8b 45 18             	mov    0x18(%ebp),%eax
c010a09e:	8b 20                	mov    (%eax),%esp
c010a0a0:	5d                   	pop    %ebp
c010a0a1:	5b                   	pop    %ebx
c010a0a2:	5f                   	pop    %edi
c010a0a3:	5e                   	pop    %esi
c010a0a4:	c3                   	ret    

c010a0a5 <initDoubleLinkList>:
c010a0a5:	55                   	push   %ebp
c010a0a6:	89 e5                	mov    %esp,%ebp
c010a0a8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0ab:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a0b1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0b4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a0bb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0be:	8d 50 08             	lea    0x8(%eax),%edx
c010a0c1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0c4:	89 50 04             	mov    %edx,0x4(%eax)
c010a0c7:	8b 55 08             	mov    0x8(%ebp),%edx
c010a0ca:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0cd:	89 50 08             	mov    %edx,0x8(%eax)
c010a0d0:	90                   	nop
c010a0d1:	5d                   	pop    %ebp
c010a0d2:	c3                   	ret    

c010a0d3 <isListEmpty>:
c010a0d3:	55                   	push   %ebp
c010a0d4:	89 e5                	mov    %esp,%ebp
c010a0d6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0d9:	8b 40 04             	mov    0x4(%eax),%eax
c010a0dc:	8b 55 08             	mov    0x8(%ebp),%edx
c010a0df:	83 c2 08             	add    $0x8,%edx
c010a0e2:	39 d0                	cmp    %edx,%eax
c010a0e4:	75 07                	jne    c010a0ed <isListEmpty+0x1a>
c010a0e6:	b8 01 00 00 00       	mov    $0x1,%eax
c010a0eb:	eb 05                	jmp    c010a0f2 <isListEmpty+0x1f>
c010a0ed:	b8 00 00 00 00       	mov    $0x0,%eax
c010a0f2:	5d                   	pop    %ebp
c010a0f3:	c3                   	ret    

c010a0f4 <findElementInList>:
c010a0f4:	55                   	push   %ebp
c010a0f5:	89 e5                	mov    %esp,%ebp
c010a0f7:	83 ec 28             	sub    $0x28,%esp
c010a0fa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a0fe:	75 19                	jne    c010a119 <findElementInList+0x25>
c010a100:	6a 60                	push   $0x60
c010a102:	68 75 c1 10 c0       	push   $0xc010c175
c010a107:	68 75 c1 10 c0       	push   $0xc010c175
c010a10c:	68 88 c1 10 c0       	push   $0xc010c188
c010a111:	e8 ff e7 ff ff       	call   c0108915 <assertion_failure>
c010a116:	83 c4 10             	add    $0x10,%esp
c010a119:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a11d:	75 19                	jne    c010a138 <findElementInList+0x44>
c010a11f:	6a 61                	push   $0x61
c010a121:	68 75 c1 10 c0       	push   $0xc010c175
c010a126:	68 75 c1 10 c0       	push   $0xc010c175
c010a12b:	68 94 c1 10 c0       	push   $0xc010c194
c010a130:	e8 e0 e7 ff ff       	call   c0108915 <assertion_failure>
c010a135:	83 c4 10             	add    $0x10,%esp
c010a138:	e8 5b cb ff ff       	call   c0106c98 <intr_disable>
c010a13d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a140:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a147:	8b 45 08             	mov    0x8(%ebp),%eax
c010a14a:	8b 40 08             	mov    0x8(%eax),%eax
c010a14d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a150:	8b 45 08             	mov    0x8(%ebp),%eax
c010a153:	8b 40 04             	mov    0x4(%eax),%eax
c010a156:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a159:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a15d:	75 07                	jne    c010a166 <findElementInList+0x72>
c010a15f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a164:	eb 68                	jmp    c010a1ce <findElementInList+0xda>
c010a166:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a169:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a16c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a16f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a172:	c1 f8 03             	sar    $0x3,%eax
c010a175:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a178:	eb 36                	jmp    c010a1b0 <findElementInList+0xbc>
c010a17a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a17d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a180:	75 07                	jne    c010a189 <findElementInList+0x95>
c010a182:	b8 01 00 00 00       	mov    $0x1,%eax
c010a187:	eb 45                	jmp    c010a1ce <findElementInList+0xda>
c010a189:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a18d:	75 07                	jne    c010a196 <findElementInList+0xa2>
c010a18f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a194:	eb 38                	jmp    c010a1ce <findElementInList+0xda>
c010a196:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a199:	8b 40 04             	mov    0x4(%eax),%eax
c010a19c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a19f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a1a3:	75 07                	jne    c010a1ac <findElementInList+0xb8>
c010a1a5:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1aa:	eb 22                	jmp    c010a1ce <findElementInList+0xda>
c010a1ac:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a1b0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1b3:	83 c0 08             	add    $0x8,%eax
c010a1b6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a1b9:	75 bf                	jne    c010a17a <findElementInList+0x86>
c010a1bb:	83 ec 0c             	sub    $0xc,%esp
c010a1be:	ff 75 ec             	pushl  -0x14(%ebp)
c010a1c1:	e8 fb ca ff ff       	call   c0106cc1 <intr_set_status>
c010a1c6:	83 c4 10             	add    $0x10,%esp
c010a1c9:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1ce:	c9                   	leave  
c010a1cf:	c3                   	ret    

c010a1d0 <appendToDoubleLinkList>:
c010a1d0:	55                   	push   %ebp
c010a1d1:	89 e5                	mov    %esp,%ebp
c010a1d3:	83 ec 18             	sub    $0x18,%esp
c010a1d6:	83 ec 08             	sub    $0x8,%esp
c010a1d9:	ff 75 0c             	pushl  0xc(%ebp)
c010a1dc:	ff 75 08             	pushl  0x8(%ebp)
c010a1df:	e8 10 ff ff ff       	call   c010a0f4 <findElementInList>
c010a1e4:	83 c4 10             	add    $0x10,%esp
c010a1e7:	3c 01                	cmp    $0x1,%al
c010a1e9:	0f 84 c2 00 00 00    	je     c010a2b1 <appendToDoubleLinkList+0xe1>
c010a1ef:	e8 a4 ca ff ff       	call   c0106c98 <intr_disable>
c010a1f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a1f7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a1fb:	75 1c                	jne    c010a219 <appendToDoubleLinkList+0x49>
c010a1fd:	68 9e 00 00 00       	push   $0x9e
c010a202:	68 75 c1 10 c0       	push   $0xc010c175
c010a207:	68 75 c1 10 c0       	push   $0xc010c175
c010a20c:	68 88 c1 10 c0       	push   $0xc010c188
c010a211:	e8 ff e6 ff ff       	call   c0108915 <assertion_failure>
c010a216:	83 c4 10             	add    $0x10,%esp
c010a219:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a21d:	75 1c                	jne    c010a23b <appendToDoubleLinkList+0x6b>
c010a21f:	68 9f 00 00 00       	push   $0x9f
c010a224:	68 75 c1 10 c0       	push   $0xc010c175
c010a229:	68 75 c1 10 c0       	push   $0xc010c175
c010a22e:	68 94 c1 10 c0       	push   $0xc010c194
c010a233:	e8 dd e6 ff ff       	call   c0108915 <assertion_failure>
c010a238:	83 c4 10             	add    $0x10,%esp
c010a23b:	83 ec 08             	sub    $0x8,%esp
c010a23e:	ff 75 0c             	pushl  0xc(%ebp)
c010a241:	ff 75 08             	pushl  0x8(%ebp)
c010a244:	e8 ab fe ff ff       	call   c010a0f4 <findElementInList>
c010a249:	83 c4 10             	add    $0x10,%esp
c010a24c:	3c 01                	cmp    $0x1,%al
c010a24e:	74 64                	je     c010a2b4 <appendToDoubleLinkList+0xe4>
c010a250:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a253:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a256:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a259:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a260:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a263:	8b 50 04             	mov    0x4(%eax),%edx
c010a266:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a269:	89 10                	mov    %edx,(%eax)
c010a26b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a26e:	8b 50 08             	mov    0x8(%eax),%edx
c010a271:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a274:	89 10                	mov    %edx,(%eax)
c010a276:	8b 45 08             	mov    0x8(%ebp),%eax
c010a279:	8b 40 08             	mov    0x8(%eax),%eax
c010a27c:	85 c0                	test   %eax,%eax
c010a27e:	74 0c                	je     c010a28c <appendToDoubleLinkList+0xbc>
c010a280:	8b 45 08             	mov    0x8(%ebp),%eax
c010a283:	8b 40 08             	mov    0x8(%eax),%eax
c010a286:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a289:	89 50 04             	mov    %edx,0x4(%eax)
c010a28c:	8b 45 08             	mov    0x8(%ebp),%eax
c010a28f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a292:	89 50 08             	mov    %edx,0x8(%eax)
c010a295:	8b 45 08             	mov    0x8(%ebp),%eax
c010a298:	8d 50 08             	lea    0x8(%eax),%edx
c010a29b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a29e:	89 50 04             	mov    %edx,0x4(%eax)
c010a2a1:	83 ec 0c             	sub    $0xc,%esp
c010a2a4:	ff 75 f4             	pushl  -0xc(%ebp)
c010a2a7:	e8 15 ca ff ff       	call   c0106cc1 <intr_set_status>
c010a2ac:	83 c4 10             	add    $0x10,%esp
c010a2af:	eb 04                	jmp    c010a2b5 <appendToDoubleLinkList+0xe5>
c010a2b1:	90                   	nop
c010a2b2:	eb 01                	jmp    c010a2b5 <appendToDoubleLinkList+0xe5>
c010a2b4:	90                   	nop
c010a2b5:	c9                   	leave  
c010a2b6:	c3                   	ret    

c010a2b7 <insertToDoubleLinkList>:
c010a2b7:	55                   	push   %ebp
c010a2b8:	89 e5                	mov    %esp,%ebp
c010a2ba:	83 ec 18             	sub    $0x18,%esp
c010a2bd:	83 ec 08             	sub    $0x8,%esp
c010a2c0:	ff 75 0c             	pushl  0xc(%ebp)
c010a2c3:	ff 75 08             	pushl  0x8(%ebp)
c010a2c6:	e8 29 fe ff ff       	call   c010a0f4 <findElementInList>
c010a2cb:	83 c4 10             	add    $0x10,%esp
c010a2ce:	3c 01                	cmp    $0x1,%al
c010a2d0:	74 65                	je     c010a337 <insertToDoubleLinkList+0x80>
c010a2d2:	e8 c1 c9 ff ff       	call   c0106c98 <intr_disable>
c010a2d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a2da:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a2dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2e3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a2ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2ed:	8b 50 04             	mov    0x4(%eax),%edx
c010a2f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2f3:	89 10                	mov    %edx,(%eax)
c010a2f5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2f8:	8b 50 04             	mov    0x4(%eax),%edx
c010a2fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2fe:	89 50 04             	mov    %edx,0x4(%eax)
c010a301:	8b 45 08             	mov    0x8(%ebp),%eax
c010a304:	8b 40 04             	mov    0x4(%eax),%eax
c010a307:	85 c0                	test   %eax,%eax
c010a309:	74 0b                	je     c010a316 <insertToDoubleLinkList+0x5f>
c010a30b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a30e:	8b 40 04             	mov    0x4(%eax),%eax
c010a311:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a314:	89 10                	mov    %edx,(%eax)
c010a316:	8b 45 08             	mov    0x8(%ebp),%eax
c010a319:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a31c:	89 50 04             	mov    %edx,0x4(%eax)
c010a31f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a322:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a325:	89 10                	mov    %edx,(%eax)
c010a327:	83 ec 0c             	sub    $0xc,%esp
c010a32a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a32d:	e8 8f c9 ff ff       	call   c0106cc1 <intr_set_status>
c010a332:	83 c4 10             	add    $0x10,%esp
c010a335:	eb 01                	jmp    c010a338 <insertToDoubleLinkList+0x81>
c010a337:	90                   	nop
c010a338:	c9                   	leave  
c010a339:	c3                   	ret    

c010a33a <popFromDoubleLinkList>:
c010a33a:	55                   	push   %ebp
c010a33b:	89 e5                	mov    %esp,%ebp
c010a33d:	83 ec 18             	sub    $0x18,%esp
c010a340:	e8 53 c9 ff ff       	call   c0106c98 <intr_disable>
c010a345:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a348:	83 ec 0c             	sub    $0xc,%esp
c010a34b:	ff 75 08             	pushl  0x8(%ebp)
c010a34e:	e8 80 fd ff ff       	call   c010a0d3 <isListEmpty>
c010a353:	83 c4 10             	add    $0x10,%esp
c010a356:	3c 01                	cmp    $0x1,%al
c010a358:	75 07                	jne    c010a361 <popFromDoubleLinkList+0x27>
c010a35a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a35f:	eb 6b                	jmp    c010a3cc <popFromDoubleLinkList+0x92>
c010a361:	8b 45 08             	mov    0x8(%ebp),%eax
c010a364:	8b 40 08             	mov    0x8(%eax),%eax
c010a367:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a36a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a36d:	8b 40 08             	mov    0x8(%eax),%eax
c010a370:	85 c0                	test   %eax,%eax
c010a372:	75 07                	jne    c010a37b <popFromDoubleLinkList+0x41>
c010a374:	b8 00 00 00 00       	mov    $0x0,%eax
c010a379:	eb 51                	jmp    c010a3cc <popFromDoubleLinkList+0x92>
c010a37b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a37e:	8b 40 08             	mov    0x8(%eax),%eax
c010a381:	8b 00                	mov    (%eax),%eax
c010a383:	85 c0                	test   %eax,%eax
c010a385:	74 11                	je     c010a398 <popFromDoubleLinkList+0x5e>
c010a387:	8b 45 08             	mov    0x8(%ebp),%eax
c010a38a:	8b 40 08             	mov    0x8(%eax),%eax
c010a38d:	8b 00                	mov    (%eax),%eax
c010a38f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a392:	83 c2 08             	add    $0x8,%edx
c010a395:	89 50 04             	mov    %edx,0x4(%eax)
c010a398:	8b 45 08             	mov    0x8(%ebp),%eax
c010a39b:	8b 40 08             	mov    0x8(%eax),%eax
c010a39e:	8b 10                	mov    (%eax),%edx
c010a3a0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3a3:	89 50 08             	mov    %edx,0x8(%eax)
c010a3a6:	83 ec 0c             	sub    $0xc,%esp
c010a3a9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a3ac:	e8 10 c9 ff ff       	call   c0106cc1 <intr_set_status>
c010a3b1:	83 c4 10             	add    $0x10,%esp
c010a3b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3b7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a3be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3c1:	8b 50 04             	mov    0x4(%eax),%edx
c010a3c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3c7:	89 10                	mov    %edx,(%eax)
c010a3c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3cc:	c9                   	leave  
c010a3cd:	c3                   	ret    

c010a3ce <kernel_thread>:
c010a3ce:	55                   	push   %ebp
c010a3cf:	89 e5                	mov    %esp,%ebp
c010a3d1:	83 ec 08             	sub    $0x8,%esp
c010a3d4:	fb                   	sti    
c010a3d5:	83 ec 0c             	sub    $0xc,%esp
c010a3d8:	ff 75 0c             	pushl  0xc(%ebp)
c010a3db:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3de:	ff d0                	call   *%eax
c010a3e0:	83 c4 10             	add    $0x10,%esp
c010a3e3:	90                   	nop
c010a3e4:	c9                   	leave  
c010a3e5:	c3                   	ret    

c010a3e6 <thread_init>:
c010a3e6:	55                   	push   %ebp
c010a3e7:	89 e5                	mov    %esp,%ebp
c010a3e9:	83 ec 18             	sub    $0x18,%esp
c010a3ec:	83 ec 08             	sub    $0x8,%esp
c010a3ef:	6a 00                	push   $0x0
c010a3f1:	6a 01                	push   $0x1
c010a3f3:	e8 cf bd ff ff       	call   c01061c7 <alloc_memory>
c010a3f8:	83 c4 10             	add    $0x10,%esp
c010a3fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a3fe:	83 ec 04             	sub    $0x4,%esp
c010a401:	68 00 10 00 00       	push   $0x1000
c010a406:	6a 00                	push   $0x0
c010a408:	ff 75 f4             	pushl  -0xc(%ebp)
c010a40b:	e8 bf 1d 00 00       	call   c010c1cf <Memset>
c010a410:	83 c4 10             	add    $0x10,%esp
c010a413:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a416:	05 00 10 00 00       	add    $0x1000,%eax
c010a41b:	89 c2                	mov    %eax,%edx
c010a41d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a420:	89 10                	mov    %edx,(%eax)
c010a422:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a425:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a42c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a42f:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a436:	ff ff ff 
c010a439:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a43c:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a443:	00 00 00 
c010a446:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a449:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a44f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a452:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a458:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a45d:	83 c0 01             	add    $0x1,%eax
c010a460:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a465:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a46b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a46e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a474:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a477:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a47e:	00 00 00 
c010a481:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a484:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a48b:	cd ab 99 
c010a48e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a491:	c9                   	leave  
c010a492:	c3                   	ret    

c010a493 <thread_create>:
c010a493:	55                   	push   %ebp
c010a494:	89 e5                	mov    %esp,%ebp
c010a496:	83 ec 10             	sub    $0x10,%esp
c010a499:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a4a0:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a4a7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4aa:	8b 00                	mov    (%eax),%eax
c010a4ac:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a4af:	89 c2                	mov    %eax,%edx
c010a4b1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4b4:	89 10                	mov    %edx,(%eax)
c010a4b6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4b9:	8b 00                	mov    (%eax),%eax
c010a4bb:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a4be:	89 c2                	mov    %eax,%edx
c010a4c0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4c3:	89 10                	mov    %edx,(%eax)
c010a4c5:	90                   	nop
c010a4c6:	c9                   	leave  
c010a4c7:	c3                   	ret    

c010a4c8 <thread_start>:
c010a4c8:	55                   	push   %ebp
c010a4c9:	89 e5                	mov    %esp,%ebp
c010a4cb:	83 ec 18             	sub    $0x18,%esp
c010a4ce:	e8 13 ff ff ff       	call   c010a3e6 <thread_init>
c010a4d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a4d6:	83 ec 0c             	sub    $0xc,%esp
c010a4d9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a4dc:	e8 b2 ff ff ff       	call   c010a493 <thread_create>
c010a4e1:	83 c4 10             	add    $0x10,%esp
c010a4e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4e7:	05 28 01 00 00       	add    $0x128,%eax
c010a4ec:	83 ec 08             	sub    $0x8,%esp
c010a4ef:	ff 75 10             	pushl  0x10(%ebp)
c010a4f2:	50                   	push   %eax
c010a4f3:	e8 f6 1c 00 00       	call   c010c1ee <Strcpy>
c010a4f8:	83 c4 10             	add    $0x10,%esp
c010a4fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4fe:	8b 00                	mov    (%eax),%eax
c010a500:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a503:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a506:	c7 40 10 ce a3 10 c0 	movl   $0xc010a3ce,0x10(%eax)
c010a50d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a510:	8b 55 08             	mov    0x8(%ebp),%edx
c010a513:	89 50 18             	mov    %edx,0x18(%eax)
c010a516:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a519:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a51c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a51f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a522:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a528:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a52b:	8b 10                	mov    (%eax),%edx
c010a52d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a530:	89 50 04             	mov    %edx,0x4(%eax)
c010a533:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a536:	8b 50 04             	mov    0x4(%eax),%edx
c010a539:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a53c:	89 50 08             	mov    %edx,0x8(%eax)
c010a53f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a542:	8b 50 08             	mov    0x8(%eax),%edx
c010a545:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a548:	89 50 0c             	mov    %edx,0xc(%eax)
c010a54b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a54e:	05 60 02 00 00       	add    $0x260,%eax
c010a553:	83 ec 08             	sub    $0x8,%esp
c010a556:	50                   	push   %eax
c010a557:	68 ec fd 10 c0       	push   $0xc010fdec
c010a55c:	e8 6f fc ff ff       	call   c010a1d0 <appendToDoubleLinkList>
c010a561:	83 c4 10             	add    $0x10,%esp
c010a564:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a567:	05 6a 02 00 00       	add    $0x26a,%eax
c010a56c:	83 ec 08             	sub    $0x8,%esp
c010a56f:	50                   	push   %eax
c010a570:	68 04 0f 11 c0       	push   $0xc0110f04
c010a575:	e8 56 fc ff ff       	call   c010a1d0 <appendToDoubleLinkList>
c010a57a:	83 c4 10             	add    $0x10,%esp
c010a57d:	90                   	nop
c010a57e:	c9                   	leave  
c010a57f:	c3                   	ret    

c010a580 <Buf>:
	...

c010a596 <My_Buf>:
c010a596:	48                   	dec    %eax
c010a597:	65 6c                	gs insb (%dx),%es:(%edi)
c010a599:	6c                   	insb   (%dx),%es:(%edi)
c010a59a:	6f                   	outsl  %ds:(%esi),(%dx)
c010a59b:	2c 57                	sub    $0x57,%al
c010a59d:	6f                   	outsl  %ds:(%esi),(%dx)
c010a59e:	72 6c                	jb     c010a60c <DriverInitialize+0x69>
c010a5a0:	64 5c                	fs pop %esp
c010a5a2:	30                   	.byte 0x30

c010a5a3 <DriverInitialize>:
c010a5a3:	66 87 db             	xchg   %bx,%bx
c010a5a6:	56                   	push   %esi
c010a5a7:	57                   	push   %edi
c010a5a8:	53                   	push   %ebx
c010a5a9:	55                   	push   %ebp
c010a5aa:	51                   	push   %ecx
c010a5ab:	89 e5                	mov    %esp,%ebp
c010a5ad:	b0 21                	mov    $0x21,%al
c010a5af:	66 ba 00 03          	mov    $0x300,%dx
c010a5b3:	ee                   	out    %al,(%dx)
c010a5b4:	b0 59                	mov    $0x59,%al
c010a5b6:	66 ba 0e 03          	mov    $0x30e,%dx
c010a5ba:	ee                   	out    %al,(%dx)
c010a5bb:	66 ba 0a 03          	mov    $0x30a,%dx
c010a5bf:	30 c0                	xor    %al,%al
c010a5c1:	ee                   	out    %al,(%dx)
c010a5c2:	66 ba 0b 03          	mov    $0x30b,%dx
c010a5c6:	ee                   	out    %al,(%dx)
c010a5c7:	b0 10                	mov    $0x10,%al
c010a5c9:	66 ba 0c 03          	mov    $0x30c,%dx
c010a5cd:	ee                   	out    %al,(%dx)
c010a5ce:	b0 20                	mov    $0x20,%al
c010a5d0:	66 ba 04 03          	mov    $0x304,%dx
c010a5d4:	ee                   	out    %al,(%dx)
c010a5d5:	b0 02                	mov    $0x2,%al
c010a5d7:	66 ba 0d 03          	mov    $0x30d,%dx
c010a5db:	ee                   	out    %al,(%dx)
c010a5dc:	b0 40                	mov    $0x40,%al
c010a5de:	66 ba 01 03          	mov    $0x301,%dx
c010a5e2:	ee                   	out    %al,(%dx)
c010a5e3:	66 ba 03 03          	mov    $0x303,%dx
c010a5e7:	ee                   	out    %al,(%dx)
c010a5e8:	b0 60                	mov    $0x60,%al
c010a5ea:	66 ba 02 03          	mov    $0x302,%dx
c010a5ee:	ee                   	out    %al,(%dx)
c010a5ef:	b0 61                	mov    $0x61,%al
c010a5f1:	66 ba 00 03          	mov    $0x300,%dx
c010a5f5:	ee                   	out    %al,(%dx)
c010a5f6:	b0 40                	mov    $0x40,%al
c010a5f8:	66 ba 07 03          	mov    $0x307,%dx
c010a5fc:	ee                   	out    %al,(%dx)
c010a5fd:	b0 22                	mov    $0x22,%al
c010a5ff:	66 ba 00 03          	mov    $0x300,%dx
c010a603:	ee                   	out    %al,(%dx)
c010a604:	b0 ff                	mov    $0xff,%al
c010a606:	66 ba 07 03          	mov    $0x307,%dx
c010a60a:	ee                   	out    %al,(%dx)
c010a60b:	b0 fb                	mov    $0xfb,%al
c010a60d:	66 87 db             	xchg   %bx,%bx
c010a610:	66 ba 0f 03          	mov    $0x30f,%dx
c010a614:	ee                   	out    %al,(%dx)
c010a615:	66 ba 0d 03          	mov    $0x30d,%dx
c010a619:	b0 00                	mov    $0x0,%al
c010a61b:	ee                   	out    %al,(%dx)
c010a61c:	89 ec                	mov    %ebp,%esp
c010a61e:	59                   	pop    %ecx
c010a61f:	5d                   	pop    %ebp
c010a620:	5b                   	pop    %ebx
c010a621:	5f                   	pop    %edi
c010a622:	5e                   	pop    %esi
c010a623:	c3                   	ret    

c010a624 <SetPageStart>:
c010a624:	66 ba 08 03          	mov    $0x308,%dx
c010a628:	66 31 c0             	xor    %ax,%ax
c010a62b:	66 b8 00 40          	mov    $0x4000,%ax
c010a62f:	ee                   	out    %al,(%dx)
c010a630:	66 ba 09 03          	mov    $0x309,%dx
c010a634:	66 25 00 ff          	and    $0xff00,%ax
c010a638:	66 c1 e8 08          	shr    $0x8,%ax
c010a63c:	ee                   	out    %al,(%dx)
c010a63d:	c3                   	ret    

c010a63e <DriverSend>:
c010a63e:	56                   	push   %esi
c010a63f:	57                   	push   %edi
c010a640:	53                   	push   %ebx
c010a641:	55                   	push   %ebp
c010a642:	51                   	push   %ecx
c010a643:	89 e5                	mov    %esp,%ebp
c010a645:	66 ba 00 03          	mov    $0x300,%dx
c010a649:	ec                   	in     (%dx),%al
c010a64a:	3c 26                	cmp    $0x26,%al
c010a64c:	74 55                	je     c010a6a3 <QueueIt>
c010a64e:	66 51                	push   %cx
c010a650:	66 87 db             	xchg   %bx,%bx
c010a653:	24 3f                	and    $0x3f,%al
c010a655:	ee                   	out    %al,(%dx)
c010a656:	66 ba 08 03          	mov    $0x308,%dx
c010a65a:	66 31 c0             	xor    %ax,%ax
c010a65d:	66 b8 00 40          	mov    $0x4000,%ax
c010a661:	ee                   	out    %al,(%dx)
c010a662:	66 ba 09 03          	mov    $0x309,%dx
c010a666:	66 25 00 ff          	and    $0xff00,%ax
c010a66a:	66 c1 e8 08          	shr    $0x8,%ax
c010a66e:	ee                   	out    %al,(%dx)
c010a66f:	ff 75 18             	pushl  0x18(%ebp)
c010a672:	e8 3d 00 00 00       	call   c010a6b4 <PCtoNIC>
c010a677:	83 c4 04             	add    $0x4,%esp
c010a67a:	66 ba 04 03          	mov    $0x304,%dx
c010a67e:	b0 40                	mov    $0x40,%al
c010a680:	66 b8 00 40          	mov    $0x4000,%ax
c010a684:	66 c1 e8 08          	shr    $0x8,%ax
c010a688:	66 ef                	out    %ax,(%dx)
c010a68a:	66 59                	pop    %cx
c010a68c:	66 ba 05 03          	mov    $0x305,%dx
c010a690:	88 c8                	mov    %cl,%al
c010a692:	ee                   	out    %al,(%dx)
c010a693:	66 ba 06 03          	mov    $0x306,%dx
c010a697:	88 e8                	mov    %ch,%al
c010a699:	ee                   	out    %al,(%dx)
c010a69a:	66 ba 00 03          	mov    $0x300,%dx
c010a69e:	b0 26                	mov    $0x26,%al
c010a6a0:	ee                   	out    %al,(%dx)
c010a6a1:	eb 01                	jmp    c010a6a4 <Finished>

c010a6a3 <QueueIt>:
c010a6a3:	90                   	nop

c010a6a4 <Finished>:
c010a6a4:	89 ec                	mov    %ebp,%esp
c010a6a6:	59                   	pop    %ecx
c010a6a7:	5d                   	pop    %ebp
c010a6a8:	5b                   	pop    %ebx
c010a6a9:	5f                   	pop    %edi
c010a6aa:	5e                   	pop    %esi
c010a6ab:	c3                   	ret    

c010a6ac <MyEnd>:
c010a6ac:	89 ec                	mov    %ebp,%esp
c010a6ae:	59                   	pop    %ecx
c010a6af:	5d                   	pop    %ebp
c010a6b0:	5b                   	pop    %ebx
c010a6b1:	5f                   	pop    %edi
c010a6b2:	5e                   	pop    %esi
c010a6b3:	c3                   	ret    

c010a6b4 <PCtoNIC>:
c010a6b4:	56                   	push   %esi
c010a6b5:	57                   	push   %edi
c010a6b6:	53                   	push   %ebx
c010a6b7:	55                   	push   %ebp
c010a6b8:	51                   	push   %ecx
c010a6b9:	89 e5                	mov    %esp,%ebp
c010a6bb:	66 bb 16 00          	mov    $0x16,%bx
c010a6bf:	66 ba 0a 03          	mov    $0x30a,%dx
c010a6c3:	88 d8                	mov    %bl,%al
c010a6c5:	ee                   	out    %al,(%dx)
c010a6c6:	66 ba 0b 03          	mov    $0x30b,%dx
c010a6ca:	88 f8                	mov    %bh,%al
c010a6cc:	ee                   	out    %al,(%dx)
c010a6cd:	66 ba 00 03          	mov    $0x300,%dx
c010a6d1:	b0 12                	mov    $0x12,%al
c010a6d3:	ee                   	out    %al,(%dx)
c010a6d4:	66 ba 10 03          	mov    $0x310,%dx
c010a6d8:	66 b9 16 00          	mov    $0x16,%cx
c010a6dc:	66 d1 e9             	shr    %cx
c010a6df:	66 b8 59 00          	mov    $0x59,%ax
c010a6e3:	31 f6                	xor    %esi,%esi
c010a6e5:	8b 74 24 18          	mov    0x18(%esp),%esi
c010a6e9:	e8 36 ff ff ff       	call   c010a624 <SetPageStart>
c010a6ee:	66 ba 10 03          	mov    $0x310,%dx
c010a6f2:	66 87 db             	xchg   %bx,%bx

c010a6f5 <Writing_Word>:
c010a6f5:	66 31 c0             	xor    %ax,%ax
c010a6f8:	66 ad                	lods   %ds:(%esi),%ax
c010a6fa:	66 ef                	out    %ax,(%dx)
c010a6fc:	e2 f7                	loop   c010a6f5 <Writing_Word>
c010a6fe:	66 87 db             	xchg   %bx,%bx
c010a701:	66 b9 00 00          	mov    $0x0,%cx
c010a705:	66 ba 07 03          	mov    $0x307,%dx

c010a709 <CheckDMA>:
c010a709:	ec                   	in     (%dx),%al
c010a70a:	a8 40                	test   $0x40,%al
c010a70c:	75 02                	jne    c010a710 <toNICEND>
c010a70e:	eb f9                	jmp    c010a709 <CheckDMA>

c010a710 <toNICEND>:
c010a710:	66 ba 07 03          	mov    $0x307,%dx
c010a714:	b0 40                	mov    $0x40,%al
c010a716:	ee                   	out    %al,(%dx)
c010a717:	f8                   	clc    
c010a718:	89 ec                	mov    %ebp,%esp
c010a71a:	59                   	pop    %ecx
c010a71b:	5d                   	pop    %ebp
c010a71c:	5b                   	pop    %ebx
c010a71d:	5f                   	pop    %edi
c010a71e:	5e                   	pop    %esi
c010a71f:	c3                   	ret    

c010a720 <NICtoPC>:
c010a720:	66 87 db             	xchg   %bx,%bx
c010a723:	56                   	push   %esi
c010a724:	57                   	push   %edi
c010a725:	53                   	push   %ebx
c010a726:	55                   	push   %ebp
c010a727:	51                   	push   %ecx
c010a728:	89 e5                	mov    %esp,%ebp
c010a72a:	66 bb 16 00          	mov    $0x16,%bx
c010a72e:	66 ba 0a 03          	mov    $0x30a,%dx
c010a732:	88 d8                	mov    %bl,%al
c010a734:	ee                   	out    %al,(%dx)
c010a735:	66 ba 0b 03          	mov    $0x30b,%dx
c010a739:	88 f8                	mov    %bh,%al
c010a73b:	ee                   	out    %al,(%dx)
c010a73c:	66 ba 00 03          	mov    $0x300,%dx
c010a740:	b0 0a                	mov    $0xa,%al
c010a742:	ee                   	out    %al,(%dx)
c010a743:	66 ba 10 03          	mov    $0x310,%dx
c010a747:	e8 d8 fe ff ff       	call   c010a624 <SetPageStart>
c010a74c:	66 ba 10 03          	mov    $0x310,%dx
c010a750:	66 b9 16 00          	mov    $0x16,%cx
c010a754:	66 d1 e9             	shr    %cx
c010a757:	bf 80 a5 10 c0       	mov    $0xc010a580,%edi

c010a75c <READING_Word_NICtoPC>:
c010a75c:	31 c0                	xor    %eax,%eax
c010a75e:	66 ed                	in     (%dx),%ax
c010a760:	66 ab                	stos   %ax,%es:(%edi)
c010a762:	e2 f8                	loop   c010a75c <READING_Word_NICtoPC>
c010a764:	b8 80 a5 10 c0       	mov    $0xc010a580,%eax
c010a769:	50                   	push   %eax
c010a76a:	e8 1d 59 ff ff       	call   c010008c <disp_str>
c010a76f:	83 c4 04             	add    $0x4,%esp
c010a772:	66 ba 07 03          	mov    $0x307,%dx

c010a776 <CheckDMA_NICtoPC>:
c010a776:	ec                   	in     (%dx),%al
c010a777:	a8 40                	test   $0x40,%al
c010a779:	75 02                	jne    c010a77d <ReadEnd>
c010a77b:	eb f9                	jmp    c010a776 <CheckDMA_NICtoPC>

c010a77d <ReadEnd>:
c010a77d:	ee                   	out    %al,(%dx)
c010a77e:	89 ec                	mov    %ebp,%esp
c010a780:	59                   	pop    %ecx
c010a781:	5d                   	pop    %ebp
c010a782:	5b                   	pop    %ebx
c010a783:	5f                   	pop    %edi
c010a784:	5e                   	pop    %esi
c010a785:	c3                   	ret    
