
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
c010001e:	0f 01 05 d4 06 11 c0 	sgdtl  0xc01106d4
c0100025:	e8 01 3f 00 00       	call   c0103f2b <ReloadGDT>
c010002a:	0f 01 15 d4 06 11 c0 	lgdtl  0xc01106d4
c0100031:	0f 01 1d 88 f7 10 c0 	lidtl  0xc010f788
c0100038:	0f a8                	push   %gs
c010003a:	0f a9                	pop    %gs
c010003c:	ea 43 00 10 c0 08 00 	ljmp   $0x8,$0xc0100043

c0100043 <csinit>:
c0100043:	31 c0                	xor    %eax,%eax
c0100045:	66 b8 40 00          	mov    $0x40,%ax
c0100049:	0f 00 d8             	ltr    %ax
c010004c:	31 c0                	xor    %eax,%eax
c010004e:	e9 04 04 00 00       	jmp    c0100457 <kernel_main>
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

c010008c <disp_str_len>:
c010008c:	56                   	push   %esi
c010008d:	57                   	push   %edi
c010008e:	53                   	push   %ebx
c010008f:	55                   	push   %ebp
c0100090:	51                   	push   %ecx
c0100091:	89 e5                	mov    %esp,%ebp
c0100093:	b4 0d                	mov    $0xd,%ah
c0100095:	8b 75 18             	mov    0x18(%ebp),%esi
c0100098:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
c010009b:	8b 3d a4 f7 10 c0    	mov    0xc010f7a4,%edi

c01000a1 <disp_str_len.1>:
c01000a1:	ac                   	lods   %ds:(%esi),%al
c01000a2:	49                   	dec    %ecx
c01000a3:	85 c9                	test   %ecx,%ecx
c01000a5:	74 24                	je     c01000cb <disp_str_len.4>
c01000a7:	3c 0a                	cmp    $0xa,%al
c01000a9:	75 11                	jne    c01000bc <disp_str_len.3>
c01000ab:	50                   	push   %eax
c01000ac:	89 f8                	mov    %edi,%eax
c01000ae:	b3 a0                	mov    $0xa0,%bl
c01000b0:	f6 f3                	div    %bl
c01000b2:	40                   	inc    %eax
c01000b3:	b3 a0                	mov    $0xa0,%bl
c01000b5:	f6 e3                	mul    %bl
c01000b7:	89 c7                	mov    %eax,%edi
c01000b9:	58                   	pop    %eax
c01000ba:	eb e5                	jmp    c01000a1 <disp_str_len.1>

c01000bc <disp_str_len.3>:
c01000bc:	65 88 07             	mov    %al,%gs:(%edi)
c01000bf:	83 c7 01             	add    $0x1,%edi
c01000c2:	65 c6 07 20          	movb   $0x20,%gs:(%edi)
c01000c6:	83 c7 01             	add    $0x1,%edi
c01000c9:	eb d6                	jmp    c01000a1 <disp_str_len.1>

c01000cb <disp_str_len.4>:
c01000cb:	89 3d a4 f7 10 c0    	mov    %edi,0xc010f7a4
c01000d1:	89 ec                	mov    %ebp,%esp
c01000d3:	59                   	pop    %ecx
c01000d4:	5d                   	pop    %ebp
c01000d5:	5b                   	pop    %ebx
c01000d6:	5f                   	pop    %edi
c01000d7:	5e                   	pop    %esi
c01000d8:	c3                   	ret    

c01000d9 <disp_str>:
c01000d9:	55                   	push   %ebp
c01000da:	89 e5                	mov    %esp,%ebp
c01000dc:	b4 0d                	mov    $0xd,%ah
c01000de:	8b 75 08             	mov    0x8(%ebp),%esi
c01000e1:	8b 3d a4 f7 10 c0    	mov    0xc010f7a4,%edi

c01000e7 <disp_str.1>:
c01000e7:	ac                   	lods   %ds:(%esi),%al
c01000e8:	84 c0                	test   %al,%al
c01000ea:	74 1e                	je     c010010a <disp_str.4>
c01000ec:	3c 0a                	cmp    $0xa,%al
c01000ee:	75 11                	jne    c0100101 <disp_str.3>
c01000f0:	50                   	push   %eax
c01000f1:	89 f8                	mov    %edi,%eax
c01000f3:	b3 a0                	mov    $0xa0,%bl
c01000f5:	f6 f3                	div    %bl
c01000f7:	40                   	inc    %eax
c01000f8:	b3 a0                	mov    $0xa0,%bl
c01000fa:	f6 e3                	mul    %bl
c01000fc:	89 c7                	mov    %eax,%edi
c01000fe:	58                   	pop    %eax
c01000ff:	eb e6                	jmp    c01000e7 <disp_str.1>

c0100101 <disp_str.3>:
c0100101:	65 66 89 07          	mov    %ax,%gs:(%edi)
c0100105:	83 c7 02             	add    $0x2,%edi
c0100108:	eb dd                	jmp    c01000e7 <disp_str.1>

c010010a <disp_str.4>:
c010010a:	89 3d a4 f7 10 c0    	mov    %edi,0xc010f7a4
c0100110:	89 ec                	mov    %ebp,%esp
c0100112:	5d                   	pop    %ebp
c0100113:	c3                   	ret    

c0100114 <disp_str_colour>:
c0100114:	55                   	push   %ebp
c0100115:	89 e5                	mov    %esp,%ebp
c0100117:	8b 75 08             	mov    0x8(%ebp),%esi
c010011a:	8a 65 0c             	mov    0xc(%ebp),%ah
c010011d:	8b 3d a4 f7 10 c0    	mov    0xc010f7a4,%edi

c0100123 <disp_str_colour.1>:
c0100123:	ac                   	lods   %ds:(%esi),%al
c0100124:	84 c0                	test   %al,%al
c0100126:	74 1e                	je     c0100146 <disp_str_colour.4>
c0100128:	3c 0a                	cmp    $0xa,%al
c010012a:	75 11                	jne    c010013d <disp_str_colour.3>
c010012c:	50                   	push   %eax
c010012d:	89 f8                	mov    %edi,%eax
c010012f:	b3 a0                	mov    $0xa0,%bl
c0100131:	f6 f3                	div    %bl
c0100133:	40                   	inc    %eax
c0100134:	b3 a0                	mov    $0xa0,%bl
c0100136:	f6 e3                	mul    %bl
c0100138:	89 c7                	mov    %eax,%edi
c010013a:	58                   	pop    %eax
c010013b:	eb e6                	jmp    c0100123 <disp_str_colour.1>

c010013d <disp_str_colour.3>:
c010013d:	65 66 89 07          	mov    %ax,%gs:(%edi)
c0100141:	83 c7 02             	add    $0x2,%edi
c0100144:	eb dd                	jmp    c0100123 <disp_str_colour.1>

c0100146 <disp_str_colour.4>:
c0100146:	89 3d a4 f7 10 c0    	mov    %edi,0xc010f7a4
c010014c:	89 ec                	mov    %ebp,%esp
c010014e:	5d                   	pop    %ebp
c010014f:	c3                   	ret    

c0100150 <divide_zero_fault>:
c0100150:	6a ff                	push   $0xffffffff
c0100152:	6a 00                	push   $0x0
c0100154:	eb 5f                	jmp    c01001b5 <exception>

c0100156 <single_step_fault>:
c0100156:	6a ff                	push   $0xffffffff
c0100158:	6a 01                	push   $0x1
c010015a:	eb 59                	jmp    c01001b5 <exception>

c010015c <non_maskable_interrupt>:
c010015c:	6a ff                	push   $0xffffffff
c010015e:	6a 02                	push   $0x2
c0100160:	eb 53                	jmp    c01001b5 <exception>

c0100162 <breakpoint_trap>:
c0100162:	6a ff                	push   $0xffffffff
c0100164:	6a 03                	push   $0x3
c0100166:	eb 4d                	jmp    c01001b5 <exception>

c0100168 <overflow_trap>:
c0100168:	6a ff                	push   $0xffffffff
c010016a:	6a 04                	push   $0x4
c010016c:	eb 47                	jmp    c01001b5 <exception>

c010016e <bound_range_exceeded_fault>:
c010016e:	6a ff                	push   $0xffffffff
c0100170:	6a 05                	push   $0x5
c0100172:	eb 41                	jmp    c01001b5 <exception>

c0100174 <invalid_opcode_fault>:
c0100174:	6a ff                	push   $0xffffffff
c0100176:	6a 06                	push   $0x6
c0100178:	eb 3b                	jmp    c01001b5 <exception>

c010017a <coprocessor_not_available_fault>:
c010017a:	6a ff                	push   $0xffffffff
c010017c:	6a 07                	push   $0x7
c010017e:	eb 35                	jmp    c01001b5 <exception>

c0100180 <double_fault_exception_abort>:
c0100180:	6a 08                	push   $0x8
c0100182:	eb 31                	jmp    c01001b5 <exception>

c0100184 <coprocessor_segment_overrun>:
c0100184:	6a ff                	push   $0xffffffff
c0100186:	6a 09                	push   $0x9
c0100188:	eb 2b                	jmp    c01001b5 <exception>

c010018a <invalid_task_state_segment_fault>:
c010018a:	6a 0a                	push   $0xa
c010018c:	eb 27                	jmp    c01001b5 <exception>

c010018e <segment_not_present_fault>:
c010018e:	6a 0b                	push   $0xb
c0100190:	eb 23                	jmp    c01001b5 <exception>

c0100192 <stack_exception_fault>:
c0100192:	6a 0c                	push   $0xc
c0100194:	eb 1f                	jmp    c01001b5 <exception>

c0100196 <general_protection_exception_fault>:
c0100196:	6a 0d                	push   $0xd
c0100198:	e8 d3 73 00 00       	call   c0107570 <exception_handler>
c010019d:	83 c4 08             	add    $0x8,%esp
c01001a0:	cf                   	iret   

c01001a1 <page_fault>:
c01001a1:	6a 0e                	push   $0xe
c01001a3:	eb 10                	jmp    c01001b5 <exception>

c01001a5 <coprocessor_error_fault>:
c01001a5:	6a ff                	push   $0xffffffff
c01001a7:	6a 10                	push   $0x10
c01001a9:	eb 0a                	jmp    c01001b5 <exception>

c01001ab <align_check_fault>:
c01001ab:	6a 11                	push   $0x11
c01001ad:	eb 06                	jmp    c01001b5 <exception>

c01001af <simd_float_exception_fault>:
c01001af:	6a ff                	push   $0xffffffff
c01001b1:	6a 12                	push   $0x12
c01001b3:	eb 00                	jmp    c01001b5 <exception>

c01001b5 <exception>:
c01001b5:	e8 b6 73 00 00       	call   c0107570 <exception_handler>
c01001ba:	83 c4 08             	add    $0x8,%esp
c01001bd:	f4                   	hlt    

c01001be <hwint0>:
c01001be:	60                   	pusha  
c01001bf:	1e                   	push   %ds
c01001c0:	06                   	push   %es
c01001c1:	0f a0                	push   %fs
c01001c3:	0f a8                	push   %gs
c01001c5:	66 8c d2             	mov    %ss,%dx
c01001c8:	8e da                	mov    %edx,%ds
c01001ca:	8e c2                	mov    %edx,%es
c01001cc:	8e e2                	mov    %edx,%fs
c01001ce:	b0 20                	mov    $0x20,%al
c01001d0:	e6 20                	out    %al,$0x20
c01001d2:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c01001d8:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01001df:	75 00                	jne    c01001e1 <hwint0.1>

c01001e1 <hwint0.1>:
c01001e1:	fb                   	sti    
c01001e2:	60                   	pusha  
c01001e3:	e8 0d 39 00 00       	call   c0103af5 <clock_handler>
c01001e8:	61                   	popa   
c01001e9:	e9 35 01 00 00       	jmp    c0100323 <reenter_restore>

c01001ee <hwint1>:
c01001ee:	60                   	pusha  
c01001ef:	1e                   	push   %ds
c01001f0:	06                   	push   %es
c01001f1:	0f a0                	push   %fs
c01001f3:	0f a8                	push   %gs
c01001f5:	66 8c d2             	mov    %ss,%dx
c01001f8:	8e da                	mov    %edx,%ds
c01001fa:	8e c2                	mov    %edx,%es
c01001fc:	8e e2                	mov    %edx,%fs
c01001fe:	b0 fa                	mov    $0xfa,%al
c0100200:	e6 21                	out    %al,$0x21
c0100202:	b0 20                	mov    $0x20,%al
c0100204:	e6 20                	out    %al,$0x20
c0100206:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c010020c:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100213:	75 00                	jne    c0100215 <hwint1.1>

c0100215 <hwint1.1>:
c0100215:	fb                   	sti    
c0100216:	e8 65 48 00 00       	call   c0104a80 <keyboard_handler>
c010021b:	b0 f8                	mov    $0xf8,%al
c010021d:	e6 21                	out    %al,$0x21
c010021f:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100226:	0f 85 f7 00 00 00    	jne    c0100323 <reenter_restore>
c010022c:	e9 f2 00 00 00       	jmp    c0100323 <reenter_restore>

c0100231 <hwint14>:
c0100231:	60                   	pusha  
c0100232:	1e                   	push   %ds
c0100233:	06                   	push   %es
c0100234:	0f a0                	push   %fs
c0100236:	0f a8                	push   %gs
c0100238:	66 8c d2             	mov    %ss,%dx
c010023b:	8e da                	mov    %edx,%ds
c010023d:	8e c2                	mov    %edx,%es
c010023f:	8e e2                	mov    %edx,%fs
c0100241:	b0 fb                	mov    $0xfb,%al
c0100243:	e6 a1                	out    %al,$0xa1
c0100245:	b0 20                	mov    $0x20,%al
c0100247:	e6 20                	out    %al,$0x20
c0100249:	90                   	nop
c010024a:	e6 a0                	out    %al,$0xa0
c010024c:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c0100252:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100259:	75 00                	jne    c010025b <hwint14.1>

c010025b <hwint14.1>:
c010025b:	fb                   	sti    
c010025c:	e8 48 12 00 00       	call   c01014a9 <hd_handler>
c0100261:	b0 bb                	mov    $0xbb,%al
c0100263:	e6 a1                	out    %al,$0xa1
c0100265:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010026c:	0f 85 b1 00 00 00    	jne    c0100323 <reenter_restore>
c0100272:	e9 ac 00 00 00       	jmp    c0100323 <reenter_restore>

c0100277 <hwint10>:
c0100277:	60                   	pusha  
c0100278:	1e                   	push   %ds
c0100279:	06                   	push   %es
c010027a:	0f a0                	push   %fs
c010027c:	0f a8                	push   %gs
c010027e:	66 8c d2             	mov    %ss,%dx
c0100281:	8e da                	mov    %edx,%ds
c0100283:	8e c2                	mov    %edx,%es
c0100285:	8e e2                	mov    %edx,%fs
c0100287:	b0 bf                	mov    $0xbf,%al
c0100289:	e6 a1                	out    %al,$0xa1
c010028b:	b0 20                	mov    $0x20,%al
c010028d:	e6 20                	out    %al,$0x20
c010028f:	90                   	nop
c0100290:	e6 a0                	out    %al,$0xa0
c0100292:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c0100298:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010029f:	75 00                	jne    c01002a1 <hwint10.1>

c01002a1 <hwint10.1>:
c01002a1:	fb                   	sti    
c01002a2:	60                   	pusha  
c01002a3:	e8 6b 12 00 00       	call   c0101513 <net_handler>
c01002a8:	61                   	popa   
c01002a9:	90                   	nop
c01002aa:	90                   	nop
c01002ab:	b0 bb                	mov    $0xbb,%al
c01002ad:	e6 a1                	out    %al,$0xa1
c01002af:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01002b6:	75 6b                	jne    c0100323 <reenter_restore>
c01002b8:	eb 69                	jmp    c0100323 <reenter_restore>

c01002ba <sys_call>:
c01002ba:	60                   	pusha  
c01002bb:	1e                   	push   %ds
c01002bc:	06                   	push   %es
c01002bd:	0f a0                	push   %fs
c01002bf:	0f a8                	push   %gs
c01002c1:	89 e6                	mov    %esp,%esi
c01002c3:	89 e5                	mov    %esp,%ebp
c01002c5:	66 8c d2             	mov    %ss,%dx
c01002c8:	8e da                	mov    %edx,%ds
c01002ca:	8e c2                	mov    %edx,%es
c01002cc:	8e e2                	mov    %edx,%fs
c01002ce:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c01002d4:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01002db:	75 00                	jne    c01002dd <sys_call.1>

c01002dd <sys_call.1>:
c01002dd:	fb                   	sti    
c01002de:	56                   	push   %esi
c01002df:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c01002e5:	53                   	push   %ebx
c01002e6:	51                   	push   %ecx
c01002e7:	ff 14 85 2c e1 10 c0 	call   *-0x3fef1ed4(,%eax,4)
c01002ee:	83 c4 0c             	add    $0xc,%esp
c01002f1:	5e                   	pop    %esi
c01002f2:	89 45 2c             	mov    %eax,0x2c(%ebp)
c01002f5:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01002fc:	75 25                	jne    c0100323 <reenter_restore>
c01002fe:	eb 23                	jmp    c0100323 <reenter_restore>

c0100300 <fork_restart>:
c0100300:	fa                   	cli    
c0100301:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c0100307:	0f a9                	pop    %gs
c0100309:	0f a1                	pop    %fs
c010030b:	07                   	pop    %es
c010030c:	1f                   	pop    %ds
c010030d:	61                   	popa   
c010030e:	cf                   	iret   

c010030f <restart>:
c010030f:	fa                   	cli    
c0100310:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c0100316:	89 e5                	mov    %esp,%ebp
c0100318:	8b 65 04             	mov    0x4(%ebp),%esp
c010031b:	0f a9                	pop    %gs
c010031d:	0f a1                	pop    %fs
c010031f:	07                   	pop    %es
c0100320:	1f                   	pop    %ds
c0100321:	61                   	popa   
c0100322:	cf                   	iret   

c0100323 <reenter_restore>:
c0100323:	fa                   	cli    
c0100324:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c010032a:	0f a9                	pop    %gs
c010032c:	0f a1                	pop    %fs
c010032e:	07                   	pop    %es
c010032f:	1f                   	pop    %ds
c0100330:	61                   	popa   
c0100331:	cf                   	iret   

c0100332 <in_byte>:
c0100332:	31 d2                	xor    %edx,%edx
c0100334:	8b 54 24 04          	mov    0x4(%esp),%edx
c0100338:	31 c0                	xor    %eax,%eax
c010033a:	ec                   	in     (%dx),%al
c010033b:	90                   	nop
c010033c:	90                   	nop
c010033d:	c3                   	ret    

c010033e <out_byte>:
c010033e:	31 d2                	xor    %edx,%edx
c0100340:	31 c0                	xor    %eax,%eax
c0100342:	8b 54 24 04          	mov    0x4(%esp),%edx
c0100346:	8a 44 24 08          	mov    0x8(%esp),%al
c010034a:	ee                   	out    %al,(%dx)
c010034b:	90                   	nop
c010034c:	90                   	nop
c010034d:	c3                   	ret    

c010034e <in_byte2>:
c010034e:	55                   	push   %ebp
c010034f:	89 e5                	mov    %esp,%ebp
c0100351:	52                   	push   %edx
c0100352:	31 d2                	xor    %edx,%edx
c0100354:	66 8b 55 08          	mov    0x8(%ebp),%dx
c0100358:	31 c0                	xor    %eax,%eax
c010035a:	ec                   	in     (%dx),%al
c010035b:	90                   	nop
c010035c:	90                   	nop
c010035d:	5b                   	pop    %ebx
c010035e:	5d                   	pop    %ebp
c010035f:	c3                   	ret    

c0100360 <disable_int>:
c0100360:	fa                   	cli    
c0100361:	c3                   	ret    

c0100362 <enable_int>:
c0100362:	fb                   	sti    
c0100363:	c3                   	ret    

c0100364 <check_tss_esp0>:
c0100364:	55                   	push   %ebp
c0100365:	89 e5                	mov    %esp,%ebp
c0100367:	8b 45 08             	mov    0x8(%ebp),%eax
c010036a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010036d:	83 c0 44             	add    $0x44,%eax
c0100370:	8b 15 44 06 11 c0    	mov    0xc0110644,%edx
c0100376:	39 d0                	cmp    %edx,%eax
c0100378:	74 7c                	je     c01003f6 <check_tss_esp0.2>

c010037a <check_tss_esp0.1>:
c010037a:	50                   	push   %eax
c010037b:	52                   	push   %edx
c010037c:	68 10 e0 10 c0       	push   $0xc010e010
c0100381:	e8 53 fd ff ff       	call   c01000d9 <disp_str>
c0100386:	83 c4 04             	add    $0x4,%esp
c0100389:	5a                   	pop    %edx
c010038a:	58                   	pop    %eax
c010038b:	52                   	push   %edx
c010038c:	50                   	push   %eax
c010038d:	53                   	push   %ebx
c010038e:	e8 77 70 00 00       	call   c010740a <disp_int>
c0100393:	83 c4 04             	add    $0x4,%esp
c0100396:	58                   	pop    %eax
c0100397:	5a                   	pop    %edx
c0100398:	52                   	push   %edx
c0100399:	50                   	push   %eax
c010039a:	e8 6b 70 00 00       	call   c010740a <disp_int>
c010039f:	58                   	pop    %eax
c01003a0:	5a                   	pop    %edx
c01003a1:	52                   	push   %edx
c01003a2:	50                   	push   %eax
c01003a3:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c01003a9:	e8 5c 70 00 00       	call   c010740a <disp_int>
c01003ae:	83 c4 04             	add    $0x4,%esp
c01003b1:	58                   	pop    %eax
c01003b2:	5a                   	pop    %edx
c01003b3:	52                   	push   %edx
c01003b4:	50                   	push   %eax
c01003b5:	ff 72 ec             	pushl  -0x14(%edx)
c01003b8:	e8 4d 70 00 00       	call   c010740a <disp_int>
c01003bd:	83 c4 04             	add    $0x4,%esp
c01003c0:	58                   	pop    %eax
c01003c1:	5a                   	pop    %edx
c01003c2:	52                   	push   %edx
c01003c3:	50                   	push   %eax
c01003c4:	ff 70 ec             	pushl  -0x14(%eax)
c01003c7:	e8 3e 70 00 00       	call   c010740a <disp_int>
c01003cc:	83 c4 04             	add    $0x4,%esp
c01003cf:	58                   	pop    %eax
c01003d0:	5a                   	pop    %edx
c01003d1:	52                   	push   %edx
c01003d2:	50                   	push   %eax
c01003d3:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c01003d9:	e8 2c 70 00 00       	call   c010740a <disp_int>
c01003de:	83 c4 04             	add    $0x4,%esp
c01003e1:	58                   	pop    %eax
c01003e2:	5a                   	pop    %edx
c01003e3:	52                   	push   %edx
c01003e4:	50                   	push   %eax
c01003e5:	68 60 f7 10 c0       	push   $0xc010f760
c01003ea:	e8 1b 70 00 00       	call   c010740a <disp_int>
c01003ef:	83 c4 04             	add    $0x4,%esp
c01003f2:	58                   	pop    %eax
c01003f3:	5a                   	pop    %edx
c01003f4:	5d                   	pop    %ebp
c01003f5:	c3                   	ret    

c01003f6 <check_tss_esp0.2>:
c01003f6:	5d                   	pop    %ebp
c01003f7:	c3                   	ret    

c01003f8 <enable_8259A_casecade_irq>:
c01003f8:	9c                   	pushf  
c01003f9:	fa                   	cli    
c01003fa:	e4 21                	in     $0x21,%al
c01003fc:	24 fb                	and    $0xfb,%al
c01003fe:	e6 21                	out    %al,$0x21
c0100400:	9d                   	popf   
c0100401:	c3                   	ret    

c0100402 <disable_8259A_casecade_irq>:
c0100402:	9c                   	pushf  
c0100403:	fa                   	cli    
c0100404:	e4 21                	in     $0x21,%al
c0100406:	0c 04                	or     $0x4,%al
c0100408:	e6 21                	out    %al,$0x21
c010040a:	9c                   	pushf  
c010040b:	c3                   	ret    

c010040c <enable_8259A_slave_winchester_irq>:
c010040c:	9c                   	pushf  
c010040d:	fa                   	cli    
c010040e:	e4 a1                	in     $0xa1,%al
c0100410:	24 bf                	and    $0xbf,%al
c0100412:	e6 a1                	out    %al,$0xa1
c0100414:	9d                   	popf   
c0100415:	c3                   	ret    

c0100416 <disable_8259A_slave_winchester_irq>:
c0100416:	9c                   	pushf  
c0100417:	fa                   	cli    
c0100418:	e4 a1                	in     $0xa1,%al
c010041a:	0c 40                	or     $0x40,%al
c010041c:	e6 a1                	out    %al,$0xa1
c010041e:	9d                   	popf   
c010041f:	c3                   	ret    

c0100420 <update_cr3>:
c0100420:	55                   	push   %ebp
c0100421:	89 e5                	mov    %esp,%ebp
c0100423:	8b 45 08             	mov    0x8(%ebp),%eax
c0100426:	0f 22 d8             	mov    %eax,%cr3
c0100429:	89 ec                	mov    %ebp,%esp
c010042b:	5d                   	pop    %ebp
c010042c:	c3                   	ret    

c010042d <update_tss>:
c010042d:	55                   	push   %ebp
c010042e:	89 e5                	mov    %esp,%ebp
c0100430:	8b 45 08             	mov    0x8(%ebp),%eax
c0100433:	a3 44 06 11 c0       	mov    %eax,0xc0110644
c0100438:	89 ec                	mov    %ebp,%esp
c010043a:	5d                   	pop    %ebp
c010043b:	c3                   	ret    

c010043c <get_running_thread_pcb>:
c010043c:	89 e0                	mov    %esp,%eax
c010043e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100443:	c3                   	ret    

c0100444 <sys_call_test>:
c0100444:	9c                   	pushf  
c0100445:	9d                   	popf   
c0100446:	c3                   	ret    

c0100447 <enable_8259A_slave_net_irq>:
c0100447:	9c                   	pushf  
c0100448:	fa                   	cli    
c0100449:	66 87 db             	xchg   %bx,%bx
c010044c:	30 c0                	xor    %al,%al
c010044e:	e4 a1                	in     $0xa1,%al
c0100450:	24 fb                	and    $0xfb,%al
c0100452:	e6 a1                	out    %al,$0xa1
c0100454:	9d                   	popf   
c0100455:	fb                   	sti    
c0100456:	c3                   	ret    

c0100457 <kernel_main>:
c0100457:	55                   	push   %ebp
c0100458:	89 e5                	mov    %esp,%ebp
c010045a:	83 ec 18             	sub    $0x18,%esp
c010045d:	e8 7b 01 00 00       	call   c01005dd <init>
c0100462:	c7 45 f4 0f 00 00 00 	movl   $0xf,-0xc(%ebp)
c0100469:	e8 ce ff ff ff       	call   c010043c <get_running_thread_pcb>
c010046e:	a3 e0 0e 11 c0       	mov    %eax,0xc0110ee0
c0100473:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100476:	8d 50 02             	lea    0x2(%eax),%edx
c0100479:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010047e:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0100484:	8b 15 e0 0e 11 c0    	mov    0xc0110ee0,%edx
c010048a:	8b 80 1c 01 00 00    	mov    0x11c(%eax),%eax
c0100490:	89 82 18 01 00 00    	mov    %eax,0x118(%edx)
c0100496:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010049b:	8b 15 28 0f 11 c0    	mov    0xc0110f28,%edx
c01004a1:	89 50 08             	mov    %edx,0x8(%eax)
c01004a4:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004a9:	05 28 01 00 00       	add    $0x128,%eax
c01004ae:	83 ec 08             	sub    $0x8,%esp
c01004b1:	68 00 b0 10 c0       	push   $0xc010b000
c01004b6:	50                   	push   %eax
c01004b7:	e8 b2 bd 00 00       	call   c010c26e <Strcpy>
c01004bc:	83 c4 10             	add    $0x10,%esp
c01004bf:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004c4:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01004c9:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004ce:	05 60 02 00 00       	add    $0x260,%eax
c01004d3:	83 ec 08             	sub    $0x8,%esp
c01004d6:	50                   	push   %eax
c01004d7:	68 ec fd 10 c0       	push   $0xc010fdec
c01004dc:	e8 0f a0 00 00       	call   c010a4f0 <appendToDoubleLinkList>
c01004e1:	83 c4 10             	add    $0x10,%esp
c01004e4:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004e9:	05 6a 02 00 00       	add    $0x26a,%eax
c01004ee:	83 ec 08             	sub    $0x8,%esp
c01004f1:	50                   	push   %eax
c01004f2:	68 ec fd 10 c0       	push   $0xc010fdec
c01004f7:	e8 f4 9f 00 00       	call   c010a4f0 <appendToDoubleLinkList>
c01004fc:	83 c4 10             	add    $0x10,%esp
c01004ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100502:	83 ec 0c             	sub    $0xc,%esp
c0100505:	50                   	push   %eax
c0100506:	6a 00                	push   $0x0
c0100508:	68 0c b0 10 c0       	push   $0xc010b00c
c010050d:	68 13 b0 10 c0       	push   $0xc010b013
c0100512:	68 e7 54 10 c0       	push   $0xc01054e7
c0100517:	e8 15 9d 00 00       	call   c010a231 <process_execute>
c010051c:	83 c4 20             	add    $0x20,%esp
c010051f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100522:	83 ec 0c             	sub    $0xc,%esp
c0100525:	50                   	push   %eax
c0100526:	6a 00                	push   $0x0
c0100528:	68 1c b0 10 c0       	push   $0xc010b01c
c010052d:	68 24 b0 10 c0       	push   $0xc010b024
c0100532:	68 99 19 10 c0       	push   $0xc0101999
c0100537:	e8 f5 9c 00 00       	call   c010a231 <process_execute>
c010053c:	83 c4 20             	add    $0x20,%esp
c010053f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100542:	83 ec 0c             	sub    $0xc,%esp
c0100545:	50                   	push   %eax
c0100546:	6a 00                	push   $0x0
c0100548:	68 2d b0 10 c0       	push   $0xc010b02d
c010054d:	68 34 b0 10 c0       	push   $0xc010b034
c0100552:	68 21 08 10 c0       	push   $0xc0100821
c0100557:	e8 d5 9c 00 00       	call   c010a231 <process_execute>
c010055c:	83 c4 20             	add    $0x20,%esp
c010055f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100562:	83 ec 0c             	sub    $0xc,%esp
c0100565:	50                   	push   %eax
c0100566:	6a 00                	push   $0x0
c0100568:	68 3d b0 10 c0       	push   $0xc010b03d
c010056d:	68 45 b0 10 c0       	push   $0xc010b045
c0100572:	68 7d 49 10 c0       	push   $0xc010497d
c0100577:	e8 b5 9c 00 00       	call   c010a231 <process_execute>
c010057c:	83 c4 20             	add    $0x20,%esp
c010057f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100582:	83 e8 02             	sub    $0x2,%eax
c0100585:	83 ec 0c             	sub    $0xc,%esp
c0100588:	50                   	push   %eax
c0100589:	6a 01                	push   $0x1
c010058b:	68 4f b0 10 c0       	push   $0xc010b04f
c0100590:	68 59 b0 10 c0       	push   $0xc010b059
c0100595:	68 3e 07 10 c0       	push   $0xc010073e
c010059a:	e8 92 9c 00 00       	call   c010a231 <process_execute>
c010059f:	83 c4 20             	add    $0x20,%esp
c01005a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01005a5:	83 e8 03             	sub    $0x3,%eax
c01005a8:	83 ec 0c             	sub    $0xc,%esp
c01005ab:	50                   	push   %eax
c01005ac:	6a 01                	push   $0x1
c01005ae:	68 66 b0 10 c0       	push   $0xc010b066
c01005b3:	68 70 b0 10 c0       	push   $0xc010b070
c01005b8:	68 09 08 10 c0       	push   $0xc0100809
c01005bd:	e8 6f 9c 00 00       	call   c010a231 <process_execute>
c01005c2:	83 c4 20             	add    $0x20,%esp
c01005c5:	83 ec 0c             	sub    $0xc,%esp
c01005c8:	68 7d b0 10 c0       	push   $0xc010b07d
c01005cd:	e8 07 fb ff ff       	call   c01000d9 <disp_str>
c01005d2:	83 c4 10             	add    $0x10,%esp
c01005d5:	fb                   	sti    
c01005d6:	e8 53 69 00 00       	call   c0106f2e <stop_here>
c01005db:	eb f9                	jmp    c01005d6 <kernel_main+0x17f>

c01005dd <init>:
c01005dd:	55                   	push   %ebp
c01005de:	89 e5                	mov    %esp,%ebp
c01005e0:	83 ec 08             	sub    $0x8,%esp
c01005e3:	c7 05 28 0f 11 c0 00 	movl   $0x400000,0xc0110f28
c01005ea:	00 40 00 
c01005ed:	c7 05 a8 f7 10 c0 63 	movl   $0x63,0xc010f7a8
c01005f4:	00 00 00 
c01005f7:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01005fe:	00 00 00 
c0100601:	c7 05 90 f7 10 c0 00 	movl   $0x0,0xc010f790
c0100608:	00 00 00 
c010060b:	c7 05 cc 06 11 c0 64 	movl   $0x64,0xc01106cc
c0100612:	00 00 00 
c0100615:	c7 05 fc fd 10 c0 09 	movl   $0x9,0xc010fdfc
c010061c:	00 00 00 
c010061f:	c7 05 c0 fb 10 c0 00 	movl   $0x0,0xc010fbc0
c0100626:	00 00 00 
c0100629:	c6 05 c0 06 11 c0 40 	movb   $0x40,0xc01106c0
c0100630:	83 ec 0c             	sub    $0xc,%esp
c0100633:	68 87 b0 10 c0       	push   $0xc010b087
c0100638:	e8 9c fa ff ff       	call   c01000d9 <disp_str>
c010063d:	83 c4 10             	add    $0x10,%esp
c0100640:	e8 15 73 00 00       	call   c010795a <init_keyboard>
c0100645:	83 ec 0c             	sub    $0xc,%esp
c0100648:	68 00 00 00 04       	push   $0x4000000
c010064d:	e8 93 67 00 00       	call   c0106de5 <init_memory>
c0100652:	83 c4 10             	add    $0x10,%esp
c0100655:	83 ec 0c             	sub    $0xc,%esp
c0100658:	68 ec fd 10 c0       	push   $0xc010fdec
c010065d:	e8 63 9d 00 00       	call   c010a3c5 <initDoubleLinkList>
c0100662:	83 c4 10             	add    $0x10,%esp
c0100665:	83 ec 0c             	sub    $0xc,%esp
c0100668:	68 04 0f 11 c0       	push   $0xc0110f04
c010066d:	e8 53 9d 00 00       	call   c010a3c5 <initDoubleLinkList>
c0100672:	83 c4 10             	add    $0x10,%esp
c0100675:	90                   	nop
c0100676:	c9                   	leave  
c0100677:	c3                   	ret    

c0100678 <kernel_thread_a>:
c0100678:	55                   	push   %ebp
c0100679:	89 e5                	mov    %esp,%ebp
c010067b:	83 ec 18             	sub    $0x18,%esp
c010067e:	83 ec 0c             	sub    $0xc,%esp
c0100681:	ff 75 08             	pushl  0x8(%ebp)
c0100684:	e8 50 fa ff ff       	call   c01000d9 <disp_str>
c0100689:	83 c4 10             	add    $0x10,%esp
c010068c:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100691:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100694:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010069b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010069e:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c01006a3:	83 ec 0c             	sub    $0xc,%esp
c01006a6:	68 8d b0 10 c0       	push   $0xc010b08d
c01006ab:	e8 29 fa ff ff       	call   c01000d9 <disp_str>
c01006b0:	83 c4 10             	add    $0x10,%esp
c01006b3:	83 ec 0c             	sub    $0xc,%esp
c01006b6:	68 96 b0 10 c0       	push   $0xc010b096
c01006bb:	e8 19 fa ff ff       	call   c01000d9 <disp_str>
c01006c0:	83 c4 10             	add    $0x10,%esp
c01006c3:	eb d6                	jmp    c010069b <kernel_thread_a+0x23>

c01006c5 <kernel_thread_b>:
c01006c5:	55                   	push   %ebp
c01006c6:	89 e5                	mov    %esp,%ebp
c01006c8:	83 ec 18             	sub    $0x18,%esp
c01006cb:	83 ec 0c             	sub    $0xc,%esp
c01006ce:	ff 75 08             	pushl  0x8(%ebp)
c01006d1:	e8 03 fa ff ff       	call   c01000d9 <disp_str>
c01006d6:	83 c4 10             	add    $0x10,%esp
c01006d9:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c01006de:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01006e1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01006e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01006eb:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c01006f0:	83 ec 0c             	sub    $0xc,%esp
c01006f3:	68 98 b0 10 c0       	push   $0xc010b098
c01006f8:	e8 dc f9 ff ff       	call   c01000d9 <disp_str>
c01006fd:	83 c4 10             	add    $0x10,%esp
c0100700:	83 ec 0c             	sub    $0xc,%esp
c0100703:	68 96 b0 10 c0       	push   $0xc010b096
c0100708:	e8 cc f9 ff ff       	call   c01000d9 <disp_str>
c010070d:	83 c4 10             	add    $0x10,%esp
c0100710:	eb d6                	jmp    c01006e8 <kernel_thread_b+0x23>

c0100712 <kernel_thread_c>:
c0100712:	55                   	push   %ebp
c0100713:	89 e5                	mov    %esp,%ebp
c0100715:	83 ec 08             	sub    $0x8,%esp
c0100718:	83 ec 0c             	sub    $0xc,%esp
c010071b:	ff 75 08             	pushl  0x8(%ebp)
c010071e:	e8 b6 f9 ff ff       	call   c01000d9 <disp_str>
c0100723:	83 c4 10             	add    $0x10,%esp
c0100726:	eb fe                	jmp    c0100726 <kernel_thread_c+0x14>

c0100728 <kernel_thread_d>:
c0100728:	55                   	push   %ebp
c0100729:	89 e5                	mov    %esp,%ebp
c010072b:	83 ec 08             	sub    $0x8,%esp
c010072e:	83 ec 0c             	sub    $0xc,%esp
c0100731:	ff 75 08             	pushl  0x8(%ebp)
c0100734:	e8 a0 f9 ff ff       	call   c01000d9 <disp_str>
c0100739:	83 c4 10             	add    $0x10,%esp
c010073c:	eb fe                	jmp    c010073c <kernel_thread_d+0x14>

c010073e <user_proc_a>:
c010073e:	55                   	push   %ebp
c010073f:	89 e5                	mov    %esp,%ebp
c0100741:	83 ec 18             	sub    $0x18,%esp
c0100744:	83 ec 0c             	sub    $0xc,%esp
c0100747:	68 a4 b0 10 c0       	push   $0xc010b0a4
c010074c:	e8 88 f9 ff ff       	call   c01000d9 <disp_str>
c0100751:	83 c4 10             	add    $0x10,%esp
c0100754:	c6 05 d1 06 11 c0 00 	movb   $0x0,0xc01106d1
c010075b:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
c0100762:	83 ec 0c             	sub    $0xc,%esp
c0100765:	ff 75 f0             	pushl  -0x10(%ebp)
c0100768:	e8 ff 11 00 00       	call   c010196c <sys_malloc>
c010076d:	83 c4 10             	add    $0x10,%esp
c0100770:	a3 bc 06 11 c0       	mov    %eax,0xc01106bc
c0100775:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100778:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c010077d:	83 ec 04             	sub    $0x4,%esp
c0100780:	52                   	push   %edx
c0100781:	6a 00                	push   $0x0
c0100783:	50                   	push   %eax
c0100784:	e8 c6 ba 00 00       	call   c010c24f <Memset>
c0100789:	83 c4 10             	add    $0x10,%esp
c010078c:	c7 45 ec c3 b0 10 c0 	movl   $0xc010b0c3,-0x14(%ebp)
c0100793:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100798:	83 ec 08             	sub    $0x8,%esp
c010079b:	ff 75 ec             	pushl  -0x14(%ebp)
c010079e:	50                   	push   %eax
c010079f:	e8 ca ba 00 00       	call   c010c26e <Strcpy>
c01007a4:	83 c4 10             	add    $0x10,%esp
c01007a7:	c6 05 d1 06 11 c0 04 	movb   $0x4,0xc01106d1
c01007ae:	e8 10 a1 00 00       	call   c010a8c3 <DriverInitialize>
c01007b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01007ba:	eb 15                	jmp    c01007d1 <user_proc_a+0x93>
c01007bc:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c01007c1:	83 ec 0c             	sub    $0xc,%esp
c01007c4:	50                   	push   %eax
c01007c5:	e8 ab a1 00 00       	call   c010a975 <DriverSend>
c01007ca:	83 c4 10             	add    $0x10,%esp
c01007cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01007d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01007d5:	7e e5                	jle    c01007bc <user_proc_a+0x7e>
c01007d7:	83 ec 0c             	sub    $0xc,%esp
c01007da:	68 da b0 10 c0       	push   $0xc010b0da
c01007df:	e8 f5 f8 ff ff       	call   c01000d9 <disp_str>
c01007e4:	83 c4 10             	add    $0x10,%esp
c01007e7:	83 ec 0c             	sub    $0xc,%esp
c01007ea:	68 ed b0 10 c0       	push   $0xc010b0ed
c01007ef:	e8 e5 f8 ff ff       	call   c01000d9 <disp_str>
c01007f4:	83 c4 10             	add    $0x10,%esp
c01007f7:	83 ec 0c             	sub    $0xc,%esp
c01007fa:	68 00 b1 10 c0       	push   $0xc010b100
c01007ff:	e8 d5 f8 ff ff       	call   c01000d9 <disp_str>
c0100804:	83 c4 10             	add    $0x10,%esp
c0100807:	eb fe                	jmp    c0100807 <user_proc_a+0xc9>

c0100809 <user_proc_b>:
c0100809:	55                   	push   %ebp
c010080a:	89 e5                	mov    %esp,%ebp
c010080c:	83 ec 08             	sub    $0x8,%esp
c010080f:	83 ec 0c             	sub    $0xc,%esp
c0100812:	68 14 b1 10 c0       	push   $0xc010b114
c0100817:	e8 bd f8 ff ff       	call   c01000d9 <disp_str>
c010081c:	83 c4 10             	add    $0x10,%esp
c010081f:	eb fe                	jmp    c010081f <user_proc_b+0x16>

c0100821 <TaskHD>:
c0100821:	55                   	push   %ebp
c0100822:	89 e5                	mov    %esp,%ebp
c0100824:	83 ec 18             	sub    $0x18,%esp
c0100827:	e8 10 fc ff ff       	call   c010043c <get_running_thread_pcb>
c010082c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010082f:	e8 32 00 00 00       	call   c0100866 <init_hd>
c0100834:	83 ec 0c             	sub    $0xc,%esp
c0100837:	6a 7c                	push   $0x7c
c0100839:	e8 2e 11 00 00       	call   c010196c <sys_malloc>
c010083e:	83 c4 10             	add    $0x10,%esp
c0100841:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100844:	83 ec 04             	sub    $0x4,%esp
c0100847:	6a 7c                	push   $0x7c
c0100849:	6a 00                	push   $0x0
c010084b:	ff 75 f0             	pushl  -0x10(%ebp)
c010084e:	e8 fc b9 00 00       	call   c010c24f <Memset>
c0100853:	83 c4 10             	add    $0x10,%esp
c0100856:	83 ec 0c             	sub    $0xc,%esp
c0100859:	ff 75 f0             	pushl  -0x10(%ebp)
c010085c:	e8 1f 00 00 00       	call   c0100880 <hd_handle>
c0100861:	83 c4 10             	add    $0x10,%esp
c0100864:	eb de                	jmp    c0100844 <TaskHD+0x23>

c0100866 <init_hd>:
c0100866:	55                   	push   %ebp
c0100867:	89 e5                	mov    %esp,%ebp
c0100869:	83 ec 18             	sub    $0x18,%esp
c010086c:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0100873:	e8 80 fb ff ff       	call   c01003f8 <enable_8259A_casecade_irq>
c0100878:	e8 8f fb ff ff       	call   c010040c <enable_8259A_slave_winchester_irq>
c010087d:	90                   	nop
c010087e:	c9                   	leave  
c010087f:	c3                   	ret    

c0100880 <hd_handle>:
c0100880:	55                   	push   %ebp
c0100881:	89 e5                	mov    %esp,%ebp
c0100883:	83 ec 18             	sub    $0x18,%esp
c0100886:	83 ec 04             	sub    $0x4,%esp
c0100889:	6a 12                	push   $0x12
c010088b:	ff 75 08             	pushl  0x8(%ebp)
c010088e:	6a 02                	push   $0x2
c0100890:	e8 10 90 00 00       	call   c01098a5 <send_rec>
c0100895:	83 c4 10             	add    $0x10,%esp
c0100898:	8b 45 08             	mov    0x8(%ebp),%eax
c010089b:	8b 40 78             	mov    0x78(%eax),%eax
c010089e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01008a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01008a5:	0f 84 d4 00 00 00    	je     c010097f <hd_handle+0xff>
c01008ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01008ae:	8b 00                	mov    (%eax),%eax
c01008b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01008b3:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008b7:	74 28                	je     c01008e1 <hd_handle+0x61>
c01008b9:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008bd:	74 22                	je     c01008e1 <hd_handle+0x61>
c01008bf:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008c3:	74 1c                	je     c01008e1 <hd_handle+0x61>
c01008c5:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008c9:	74 16                	je     c01008e1 <hd_handle+0x61>
c01008cb:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008d2:	74 0d                	je     c01008e1 <hd_handle+0x61>
c01008d4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01008db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008de:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01008e1:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008e5:	74 34                	je     c010091b <hd_handle+0x9b>
c01008e7:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008eb:	74 2e                	je     c010091b <hd_handle+0x9b>
c01008ed:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008f1:	74 28                	je     c010091b <hd_handle+0x9b>
c01008f3:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008f7:	74 22                	je     c010091b <hd_handle+0x9b>
c01008f9:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100900:	74 19                	je     c010091b <hd_handle+0x9b>
c0100902:	6a 70                	push   $0x70
c0100904:	68 34 b1 10 c0       	push   $0xc010b134
c0100909:	68 34 b1 10 c0       	push   $0xc010b134
c010090e:	68 3c b1 10 c0       	push   $0xc010b13c
c0100913:	e8 1d 83 00 00       	call   c0108c35 <assertion_failure>
c0100918:	83 c4 10             	add    $0x10,%esp
c010091b:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010091f:	74 2c                	je     c010094d <hd_handle+0xcd>
c0100921:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100925:	77 0e                	ja     c0100935 <hd_handle+0xb5>
c0100927:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010092b:	74 19                	je     c0100946 <hd_handle+0xc6>
c010092d:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100931:	74 1a                	je     c010094d <hd_handle+0xcd>
c0100933:	eb 37                	jmp    c010096c <hd_handle+0xec>
c0100935:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100939:	74 22                	je     c010095d <hd_handle+0xdd>
c010093b:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100942:	74 3e                	je     c0100982 <hd_handle+0x102>
c0100944:	eb 26                	jmp    c010096c <hd_handle+0xec>
c0100946:	e8 e6 06 00 00       	call   c0101031 <hd_open>
c010094b:	eb 36                	jmp    c0100983 <hd_handle+0x103>
c010094d:	83 ec 0c             	sub    $0xc,%esp
c0100950:	ff 75 08             	pushl  0x8(%ebp)
c0100953:	e8 b2 08 00 00       	call   c010120a <hd_rdwt>
c0100958:	83 c4 10             	add    $0x10,%esp
c010095b:	eb 26                	jmp    c0100983 <hd_handle+0x103>
c010095d:	83 ec 0c             	sub    $0xc,%esp
c0100960:	6a 00                	push   $0x0
c0100962:	e8 71 07 00 00       	call   c01010d8 <get_hd_ioctl>
c0100967:	83 c4 10             	add    $0x10,%esp
c010096a:	eb 17                	jmp    c0100983 <hd_handle+0x103>
c010096c:	83 ec 0c             	sub    $0xc,%esp
c010096f:	68 96 b1 10 c0       	push   $0xc010b196
c0100974:	e8 78 82 00 00       	call   c0108bf1 <spin>
c0100979:	83 c4 10             	add    $0x10,%esp
c010097c:	90                   	nop
c010097d:	eb 04                	jmp    c0100983 <hd_handle+0x103>
c010097f:	90                   	nop
c0100980:	eb 01                	jmp    c0100983 <hd_handle+0x103>
c0100982:	90                   	nop
c0100983:	c9                   	leave  
c0100984:	c3                   	ret    

c0100985 <hd_cmd_out>:
c0100985:	55                   	push   %ebp
c0100986:	89 e5                	mov    %esp,%ebp
c0100988:	83 ec 08             	sub    $0x8,%esp
c010098b:	83 ec 04             	sub    $0x4,%esp
c010098e:	68 18 73 01 00       	push   $0x17318
c0100993:	6a 00                	push   $0x0
c0100995:	68 80 00 00 00       	push   $0x80
c010099a:	e8 19 0e 00 00       	call   c01017b8 <waitfor>
c010099f:	83 c4 10             	add    $0x10,%esp
c01009a2:	85 c0                	test   %eax,%eax
c01009a4:	75 10                	jne    c01009b6 <hd_cmd_out+0x31>
c01009a6:	83 ec 0c             	sub    $0xc,%esp
c01009a9:	68 a8 b1 10 c0       	push   $0xc010b1a8
c01009ae:	e8 64 82 00 00       	call   c0108c17 <panic>
c01009b3:	83 c4 10             	add    $0x10,%esp
c01009b6:	83 ec 08             	sub    $0x8,%esp
c01009b9:	6a 00                	push   $0x0
c01009bb:	68 f6 03 00 00       	push   $0x3f6
c01009c0:	e8 79 f9 ff ff       	call   c010033e <out_byte>
c01009c5:	83 c4 10             	add    $0x10,%esp
c01009c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01009cb:	0f b6 00             	movzbl (%eax),%eax
c01009ce:	0f b6 c0             	movzbl %al,%eax
c01009d1:	83 ec 08             	sub    $0x8,%esp
c01009d4:	50                   	push   %eax
c01009d5:	68 f1 01 00 00       	push   $0x1f1
c01009da:	e8 5f f9 ff ff       	call   c010033e <out_byte>
c01009df:	83 c4 10             	add    $0x10,%esp
c01009e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01009e5:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01009e9:	0f b6 c0             	movzbl %al,%eax
c01009ec:	83 ec 08             	sub    $0x8,%esp
c01009ef:	50                   	push   %eax
c01009f0:	68 f2 01 00 00       	push   $0x1f2
c01009f5:	e8 44 f9 ff ff       	call   c010033e <out_byte>
c01009fa:	83 c4 10             	add    $0x10,%esp
c01009fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a00:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0100a04:	0f b6 c0             	movzbl %al,%eax
c0100a07:	83 ec 08             	sub    $0x8,%esp
c0100a0a:	50                   	push   %eax
c0100a0b:	68 f3 01 00 00       	push   $0x1f3
c0100a10:	e8 29 f9 ff ff       	call   c010033e <out_byte>
c0100a15:	83 c4 10             	add    $0x10,%esp
c0100a18:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a1b:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0100a1f:	0f b6 c0             	movzbl %al,%eax
c0100a22:	83 ec 08             	sub    $0x8,%esp
c0100a25:	50                   	push   %eax
c0100a26:	68 f4 01 00 00       	push   $0x1f4
c0100a2b:	e8 0e f9 ff ff       	call   c010033e <out_byte>
c0100a30:	83 c4 10             	add    $0x10,%esp
c0100a33:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a36:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100a3a:	0f b6 c0             	movzbl %al,%eax
c0100a3d:	83 ec 08             	sub    $0x8,%esp
c0100a40:	50                   	push   %eax
c0100a41:	68 f5 01 00 00       	push   $0x1f5
c0100a46:	e8 f3 f8 ff ff       	call   c010033e <out_byte>
c0100a4b:	83 c4 10             	add    $0x10,%esp
c0100a4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a51:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0100a55:	0f b6 c0             	movzbl %al,%eax
c0100a58:	83 ec 08             	sub    $0x8,%esp
c0100a5b:	50                   	push   %eax
c0100a5c:	68 f6 01 00 00       	push   $0x1f6
c0100a61:	e8 d8 f8 ff ff       	call   c010033e <out_byte>
c0100a66:	83 c4 10             	add    $0x10,%esp
c0100a69:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a6c:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100a70:	0f b6 c0             	movzbl %al,%eax
c0100a73:	83 ec 08             	sub    $0x8,%esp
c0100a76:	50                   	push   %eax
c0100a77:	68 f7 01 00 00       	push   $0x1f7
c0100a7c:	e8 bd f8 ff ff       	call   c010033e <out_byte>
c0100a81:	83 c4 10             	add    $0x10,%esp
c0100a84:	90                   	nop
c0100a85:	c9                   	leave  
c0100a86:	c3                   	ret    

c0100a87 <hd_identify>:
c0100a87:	55                   	push   %ebp
c0100a88:	89 e5                	mov    %esp,%ebp
c0100a8a:	53                   	push   %ebx
c0100a8b:	83 ec 24             	sub    $0x24,%esp
c0100a8e:	89 e0                	mov    %esp,%eax
c0100a90:	89 c3                	mov    %eax,%ebx
c0100a92:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0100a96:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100a9a:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100a9e:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100aa2:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0100aa6:	8b 45 08             	mov    0x8(%ebp),%eax
c0100aa9:	c1 e0 04             	shl    $0x4,%eax
c0100aac:	83 c8 e0             	or     $0xffffffe0,%eax
c0100aaf:	88 45 ea             	mov    %al,-0x16(%ebp)
c0100ab2:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0100ab6:	83 ec 0c             	sub    $0xc,%esp
c0100ab9:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100abc:	50                   	push   %eax
c0100abd:	e8 c3 fe ff ff       	call   c0100985 <hd_cmd_out>
c0100ac2:	83 c4 10             	add    $0x10,%esp
c0100ac5:	e8 f0 06 00 00       	call   c01011ba <interrupt_wait>
c0100aca:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100ad1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ad4:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100ad7:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100ada:	89 c2                	mov    %eax,%edx
c0100adc:	b8 10 00 00 00       	mov    $0x10,%eax
c0100ae1:	83 e8 01             	sub    $0x1,%eax
c0100ae4:	01 d0                	add    %edx,%eax
c0100ae6:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100aeb:	ba 00 00 00 00       	mov    $0x0,%edx
c0100af0:	f7 f1                	div    %ecx
c0100af2:	6b c0 10             	imul   $0x10,%eax,%eax
c0100af5:	29 c4                	sub    %eax,%esp
c0100af7:	89 e0                	mov    %esp,%eax
c0100af9:	83 c0 00             	add    $0x0,%eax
c0100afc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100aff:	83 ec 04             	sub    $0x4,%esp
c0100b02:	ff 75 f4             	pushl  -0xc(%ebp)
c0100b05:	6a 00                	push   $0x0
c0100b07:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b0a:	e8 40 b7 00 00       	call   c010c24f <Memset>
c0100b0f:	83 c4 10             	add    $0x10,%esp
c0100b12:	83 ec 04             	sub    $0x4,%esp
c0100b15:	ff 75 f4             	pushl  -0xc(%ebp)
c0100b18:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b1b:	68 f0 01 00 00       	push   $0x1f0
c0100b20:	e8 7e b7 00 00       	call   c010c2a3 <read_port>
c0100b25:	83 c4 10             	add    $0x10,%esp
c0100b28:	83 ec 0c             	sub    $0xc,%esp
c0100b2b:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b2e:	e8 0b 00 00 00       	call   c0100b3e <print_hdinfo>
c0100b33:	83 c4 10             	add    $0x10,%esp
c0100b36:	89 dc                	mov    %ebx,%esp
c0100b38:	90                   	nop
c0100b39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b3c:	c9                   	leave  
c0100b3d:	c3                   	ret    

c0100b3e <print_hdinfo>:
c0100b3e:	55                   	push   %ebp
c0100b3f:	89 e5                	mov    %esp,%ebp
c0100b41:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100b47:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100b4d:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100b53:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100b5a:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100b61:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100b68:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100b6f:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100b76:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100b7c:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100b82:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100b89:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100b90:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100b97:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100b9e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100ba5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100bac:	e9 8f 00 00 00       	jmp    c0100c40 <print_hdinfo+0x102>
c0100bb1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100bb8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100bbb:	89 d0                	mov    %edx,%eax
c0100bbd:	01 c0                	add    %eax,%eax
c0100bbf:	01 d0                	add    %edx,%eax
c0100bc1:	c1 e0 03             	shl    $0x3,%eax
c0100bc4:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100bc7:	01 c8                	add    %ecx,%eax
c0100bc9:	83 e8 44             	sub    $0x44,%eax
c0100bcc:	0f b7 00             	movzwl (%eax),%eax
c0100bcf:	0f b7 c0             	movzwl %ax,%eax
c0100bd2:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100bd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bd8:	01 d0                	add    %edx,%eax
c0100bda:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100bdd:	eb 30                	jmp    c0100c0f <print_hdinfo+0xd1>
c0100bdf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100be2:	8d 50 01             	lea    0x1(%eax),%edx
c0100be5:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100be8:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100beb:	83 c2 01             	add    $0x1,%edx
c0100bee:	0f b6 00             	movzbl (%eax),%eax
c0100bf1:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100bf5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bf8:	8d 50 01             	lea    0x1(%eax),%edx
c0100bfb:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100bfe:	0f b6 00             	movzbl (%eax),%eax
c0100c01:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100c04:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100c07:	01 ca                	add    %ecx,%edx
c0100c09:	88 02                	mov    %al,(%edx)
c0100c0b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100c0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100c12:	89 d0                	mov    %edx,%eax
c0100c14:	01 c0                	add    %eax,%eax
c0100c16:	01 d0                	add    %edx,%eax
c0100c18:	c1 e0 03             	shl    $0x3,%eax
c0100c1b:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100c1e:	01 c8                	add    %ecx,%eax
c0100c20:	83 e8 42             	sub    $0x42,%eax
c0100c23:	0f b7 00             	movzwl (%eax),%eax
c0100c26:	66 d1 e8             	shr    %ax
c0100c29:	0f b7 c0             	movzwl %ax,%eax
c0100c2c:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100c2f:	7c ae                	jl     c0100bdf <print_hdinfo+0xa1>
c0100c31:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100c34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c37:	01 d0                	add    %edx,%eax
c0100c39:	c6 00 00             	movb   $0x0,(%eax)
c0100c3c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100c40:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100c44:	0f 8e 67 ff ff ff    	jle    c0100bb1 <print_hdinfo+0x73>
c0100c4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c4d:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100c51:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100c55:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100c59:	66 c1 e8 08          	shr    $0x8,%ax
c0100c5d:	66 85 c0             	test   %ax,%ax
c0100c60:	0f 95 c0             	setne  %al
c0100c63:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100c66:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100c6d:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100c73:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100c77:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100c7b:	75 15                	jne    c0100c92 <print_hdinfo+0x154>
c0100c7d:	83 ec 08             	sub    $0x8,%esp
c0100c80:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100c83:	50                   	push   %eax
c0100c84:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c87:	50                   	push   %eax
c0100c88:	e8 e1 b5 00 00       	call   c010c26e <Strcpy>
c0100c8d:	83 c4 10             	add    $0x10,%esp
c0100c90:	eb 13                	jmp    c0100ca5 <print_hdinfo+0x167>
c0100c92:	83 ec 08             	sub    $0x8,%esp
c0100c95:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c98:	50                   	push   %eax
c0100c99:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c9c:	50                   	push   %eax
c0100c9d:	e8 cc b5 00 00       	call   c010c26e <Strcpy>
c0100ca2:	83 c4 10             	add    $0x10,%esp
c0100ca5:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ca8:	83 c0 7a             	add    $0x7a,%eax
c0100cab:	0f b7 00             	movzwl (%eax),%eax
c0100cae:	0f b7 d0             	movzwl %ax,%edx
c0100cb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cb4:	83 c0 78             	add    $0x78,%eax
c0100cb7:	0f b7 00             	movzwl (%eax),%eax
c0100cba:	0f b7 c0             	movzwl %ax,%eax
c0100cbd:	83 c0 10             	add    $0x10,%eax
c0100cc0:	89 c1                	mov    %eax,%ecx
c0100cc2:	d3 e2                	shl    %cl,%edx
c0100cc4:	89 d0                	mov    %edx,%eax
c0100cc6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100cc9:	90                   	nop
c0100cca:	c9                   	leave  
c0100ccb:	c3                   	ret    

c0100ccc <print_dpt_entry>:
c0100ccc:	55                   	push   %ebp
c0100ccd:	89 e5                	mov    %esp,%ebp
c0100ccf:	83 ec 08             	sub    $0x8,%esp
c0100cd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cd5:	8b 40 08             	mov    0x8(%eax),%eax
c0100cd8:	83 ec 08             	sub    $0x8,%esp
c0100cdb:	50                   	push   %eax
c0100cdc:	68 b2 b1 10 c0       	push   $0xc010b1b2
c0100ce1:	e8 f2 7b 00 00       	call   c01088d8 <Printf>
c0100ce6:	83 c4 10             	add    $0x10,%esp
c0100ce9:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cec:	8b 40 0c             	mov    0xc(%eax),%eax
c0100cef:	83 ec 08             	sub    $0x8,%esp
c0100cf2:	50                   	push   %eax
c0100cf3:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100cf8:	e8 db 7b 00 00       	call   c01088d8 <Printf>
c0100cfd:	83 c4 10             	add    $0x10,%esp
c0100d00:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d03:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100d07:	0f b6 c0             	movzbl %al,%eax
c0100d0a:	83 ec 08             	sub    $0x8,%esp
c0100d0d:	50                   	push   %eax
c0100d0e:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100d13:	e8 c0 7b 00 00       	call   c01088d8 <Printf>
c0100d18:	83 c4 10             	add    $0x10,%esp
c0100d1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d1e:	0f b6 00             	movzbl (%eax),%eax
c0100d21:	0f b6 c0             	movzbl %al,%eax
c0100d24:	83 ec 08             	sub    $0x8,%esp
c0100d27:	50                   	push   %eax
c0100d28:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100d2d:	e8 a6 7b 00 00       	call   c01088d8 <Printf>
c0100d32:	83 c4 10             	add    $0x10,%esp
c0100d35:	90                   	nop
c0100d36:	c9                   	leave  
c0100d37:	c3                   	ret    

c0100d38 <get_partition_table>:
c0100d38:	55                   	push   %ebp
c0100d39:	89 e5                	mov    %esp,%ebp
c0100d3b:	53                   	push   %ebx
c0100d3c:	83 ec 24             	sub    $0x24,%esp
c0100d3f:	89 e0                	mov    %esp,%eax
c0100d41:	89 c3                	mov    %eax,%ebx
c0100d43:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100d47:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100d4b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d4e:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100d51:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d54:	c1 f8 08             	sar    $0x8,%eax
c0100d57:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100d5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d5d:	c1 f8 10             	sar    $0x10,%eax
c0100d60:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100d63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d66:	c1 f8 18             	sar    $0x18,%eax
c0100d69:	89 c2                	mov    %eax,%edx
c0100d6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d6e:	c1 e0 04             	shl    $0x4,%eax
c0100d71:	09 d0                	or     %edx,%eax
c0100d73:	83 c8 e0             	or     $0xffffffe0,%eax
c0100d76:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100d79:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100d7d:	83 ec 0c             	sub    $0xc,%esp
c0100d80:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100d83:	50                   	push   %eax
c0100d84:	e8 fc fb ff ff       	call   c0100985 <hd_cmd_out>
c0100d89:	83 c4 10             	add    $0x10,%esp
c0100d8c:	e8 29 04 00 00       	call   c01011ba <interrupt_wait>
c0100d91:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100d98:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d9b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100d9e:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100da1:	89 c2                	mov    %eax,%edx
c0100da3:	b8 10 00 00 00       	mov    $0x10,%eax
c0100da8:	83 e8 01             	sub    $0x1,%eax
c0100dab:	01 d0                	add    %edx,%eax
c0100dad:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100db2:	ba 00 00 00 00       	mov    $0x0,%edx
c0100db7:	f7 f1                	div    %ecx
c0100db9:	6b c0 10             	imul   $0x10,%eax,%eax
c0100dbc:	29 c4                	sub    %eax,%esp
c0100dbe:	89 e0                	mov    %esp,%eax
c0100dc0:	83 c0 00             	add    $0x0,%eax
c0100dc3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100dc6:	83 ec 04             	sub    $0x4,%esp
c0100dc9:	ff 75 f4             	pushl  -0xc(%ebp)
c0100dcc:	6a 00                	push   $0x0
c0100dce:	ff 75 ec             	pushl  -0x14(%ebp)
c0100dd1:	e8 79 b4 00 00       	call   c010c24f <Memset>
c0100dd6:	83 c4 10             	add    $0x10,%esp
c0100dd9:	83 ec 04             	sub    $0x4,%esp
c0100ddc:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ddf:	ff 75 ec             	pushl  -0x14(%ebp)
c0100de2:	68 f0 01 00 00       	push   $0x1f0
c0100de7:	e8 b7 b4 00 00       	call   c010c2a3 <read_port>
c0100dec:	83 c4 10             	add    $0x10,%esp
c0100def:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100df2:	05 be 01 00 00       	add    $0x1be,%eax
c0100df7:	83 ec 04             	sub    $0x4,%esp
c0100dfa:	6a 40                	push   $0x40
c0100dfc:	50                   	push   %eax
c0100dfd:	ff 75 10             	pushl  0x10(%ebp)
c0100e00:	e8 17 62 00 00       	call   c010701c <Memcpy>
c0100e05:	83 c4 10             	add    $0x10,%esp
c0100e08:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100e0f:	89 dc                	mov    %ebx,%esp
c0100e11:	90                   	nop
c0100e12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100e15:	c9                   	leave  
c0100e16:	c3                   	ret    

c0100e17 <partition>:
c0100e17:	55                   	push   %ebp
c0100e18:	89 e5                	mov    %esp,%ebp
c0100e1a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100e20:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100e23:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100e26:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100e2a:	7f 19                	jg     c0100e45 <partition+0x2e>
c0100e2c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100e2f:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100e34:	89 c8                	mov    %ecx,%eax
c0100e36:	f7 ea                	imul   %edx
c0100e38:	d1 fa                	sar    %edx
c0100e3a:	89 c8                	mov    %ecx,%eax
c0100e3c:	c1 f8 1f             	sar    $0x1f,%eax
c0100e3f:	29 c2                	sub    %eax,%edx
c0100e41:	89 d0                	mov    %edx,%eax
c0100e43:	eb 11                	jmp    c0100e56 <partition+0x3f>
c0100e45:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e48:	83 e8 10             	sub    $0x10,%eax
c0100e4b:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100e4e:	85 c0                	test   %eax,%eax
c0100e50:	0f 48 c2             	cmovs  %edx,%eax
c0100e53:	c1 f8 06             	sar    $0x6,%eax
c0100e56:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100e59:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100e5d:	0f 85 cc 00 00 00    	jne    c0100f2f <partition+0x118>
c0100e63:	83 ec 04             	sub    $0x4,%esp
c0100e66:	6a 40                	push   $0x40
c0100e68:	6a 00                	push   $0x0
c0100e6a:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e6d:	50                   	push   %eax
c0100e6e:	e8 dc b3 00 00       	call   c010c24f <Memset>
c0100e73:	83 c4 10             	add    $0x10,%esp
c0100e76:	83 ec 04             	sub    $0x4,%esp
c0100e79:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e7c:	50                   	push   %eax
c0100e7d:	6a 00                	push   $0x0
c0100e7f:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e82:	e8 b1 fe ff ff       	call   c0100d38 <get_partition_table>
c0100e87:	83 c4 10             	add    $0x10,%esp
c0100e8a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e91:	e9 8a 00 00 00       	jmp    c0100f20 <partition+0x109>
c0100e96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e99:	83 c0 01             	add    $0x1,%eax
c0100e9c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ea2:	c1 e0 04             	shl    $0x4,%eax
c0100ea5:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ea8:	01 c8                	add    %ecx,%eax
c0100eaa:	83 e8 5c             	sub    $0x5c,%eax
c0100ead:	8b 00                	mov    (%eax),%eax
c0100eaf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100eb2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100eb5:	c1 e1 03             	shl    $0x3,%ecx
c0100eb8:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ebe:	01 ca                	add    %ecx,%edx
c0100ec0:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100ec6:	89 02                	mov    %eax,(%edx)
c0100ec8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ecb:	c1 e0 04             	shl    $0x4,%eax
c0100ece:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ed1:	01 c8                	add    %ecx,%eax
c0100ed3:	83 e8 58             	sub    $0x58,%eax
c0100ed6:	8b 00                	mov    (%eax),%eax
c0100ed8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100edb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100ede:	c1 e1 03             	shl    $0x3,%ecx
c0100ee1:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ee7:	01 ca                	add    %ecx,%edx
c0100ee9:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100eef:	89 02                	mov    %eax,(%edx)
c0100ef1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ef4:	c1 e0 04             	shl    $0x4,%eax
c0100ef7:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100efa:	01 c8                	add    %ecx,%eax
c0100efc:	83 e8 60             	sub    $0x60,%eax
c0100eff:	0f b6 00             	movzbl (%eax),%eax
c0100f02:	3c 05                	cmp    $0x5,%al
c0100f04:	75 16                	jne    c0100f1c <partition+0x105>
c0100f06:	8b 55 08             	mov    0x8(%ebp),%edx
c0100f09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f0c:	01 d0                	add    %edx,%eax
c0100f0e:	83 ec 08             	sub    $0x8,%esp
c0100f11:	6a 01                	push   $0x1
c0100f13:	50                   	push   %eax
c0100f14:	e8 fe fe ff ff       	call   c0100e17 <partition>
c0100f19:	83 c4 10             	add    $0x10,%esp
c0100f1c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100f20:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100f24:	0f 8e 6c ff ff ff    	jle    c0100e96 <partition+0x7f>
c0100f2a:	e9 ff 00 00 00       	jmp    c010102e <partition+0x217>
c0100f2f:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100f33:	0f 85 f5 00 00 00    	jne    c010102e <partition+0x217>
c0100f39:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f3c:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100f41:	89 c8                	mov    %ecx,%eax
c0100f43:	f7 ea                	imul   %edx
c0100f45:	d1 fa                	sar    %edx
c0100f47:	89 c8                	mov    %ecx,%eax
c0100f49:	c1 f8 1f             	sar    $0x1f,%eax
c0100f4c:	29 c2                	sub    %eax,%edx
c0100f4e:	89 d0                	mov    %edx,%eax
c0100f50:	c1 e0 02             	shl    $0x2,%eax
c0100f53:	01 d0                	add    %edx,%eax
c0100f55:	29 c1                	sub    %eax,%ecx
c0100f57:	89 c8                	mov    %ecx,%eax
c0100f59:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100f5c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100f5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f62:	c1 e2 03             	shl    $0x3,%edx
c0100f65:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f6b:	01 d0                	add    %edx,%eax
c0100f6d:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f72:	8b 00                	mov    (%eax),%eax
c0100f74:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100f77:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f7d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100f80:	83 e8 01             	sub    $0x1,%eax
c0100f83:	c1 e0 04             	shl    $0x4,%eax
c0100f86:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100f89:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100f90:	e9 8c 00 00 00       	jmp    c0101021 <partition+0x20a>
c0100f95:	83 ec 04             	sub    $0x4,%esp
c0100f98:	6a 40                	push   $0x40
c0100f9a:	6a 00                	push   $0x0
c0100f9c:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f9f:	50                   	push   %eax
c0100fa0:	e8 aa b2 00 00       	call   c010c24f <Memset>
c0100fa5:	83 c4 10             	add    $0x10,%esp
c0100fa8:	83 ec 04             	sub    $0x4,%esp
c0100fab:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100fae:	50                   	push   %eax
c0100faf:	ff 75 f0             	pushl  -0x10(%ebp)
c0100fb2:	ff 75 e8             	pushl  -0x18(%ebp)
c0100fb5:	e8 7e fd ff ff       	call   c0100d38 <get_partition_table>
c0100fba:	83 c4 10             	add    $0x10,%esp
c0100fbd:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100fc0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fc3:	01 d0                	add    %edx,%eax
c0100fc5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100fc8:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100fcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100fce:	01 c2                	add    %eax,%edx
c0100fd0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100fd3:	8d 48 04             	lea    0x4(%eax),%ecx
c0100fd6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100fd9:	c1 e1 03             	shl    $0x3,%ecx
c0100fdc:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100fe2:	01 c8                	add    %ecx,%eax
c0100fe4:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100fe9:	89 10                	mov    %edx,(%eax)
c0100feb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100fee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100ff1:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100ff4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100ff7:	c1 e1 03             	shl    $0x3,%ecx
c0100ffa:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0101000:	01 ca                	add    %ecx,%edx
c0101002:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0101008:	89 02                	mov    %eax,(%edx)
c010100a:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c010100e:	84 c0                	test   %al,%al
c0101010:	74 1b                	je     c010102d <partition+0x216>
c0101012:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0101015:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101018:	01 d0                	add    %edx,%eax
c010101a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010101d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101021:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0101025:	0f 8e 6a ff ff ff    	jle    c0100f95 <partition+0x17e>
c010102b:	eb 01                	jmp    c010102e <partition+0x217>
c010102d:	90                   	nop
c010102e:	90                   	nop
c010102f:	c9                   	leave  
c0101030:	c3                   	ret    

c0101031 <hd_open>:
c0101031:	55                   	push   %ebp
c0101032:	89 e5                	mov    %esp,%ebp
c0101034:	83 ec 18             	sub    $0x18,%esp
c0101037:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010103e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101041:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101047:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c010104c:	8b 00                	mov    (%eax),%eax
c010104e:	8d 50 01             	lea    0x1(%eax),%edx
c0101051:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101054:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010105a:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c010105f:	89 10                	mov    %edx,(%eax)
c0101061:	83 ec 0c             	sub    $0xc,%esp
c0101064:	6a 00                	push   $0x0
c0101066:	e8 1c fa ff ff       	call   c0100a87 <hd_identify>
c010106b:	83 c4 10             	add    $0x10,%esp
c010106e:	83 ec 08             	sub    $0x8,%esp
c0101071:	6a 00                	push   $0x0
c0101073:	6a 00                	push   $0x0
c0101075:	e8 9d fd ff ff       	call   c0100e17 <partition>
c010107a:	83 c4 10             	add    $0x10,%esp
c010107d:	83 ec 0c             	sub    $0xc,%esp
c0101080:	6a 7c                	push   $0x7c
c0101082:	e8 e5 08 00 00       	call   c010196c <sys_malloc>
c0101087:	83 c4 10             	add    $0x10,%esp
c010108a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010108d:	83 ec 04             	sub    $0x4,%esp
c0101090:	6a 7c                	push   $0x7c
c0101092:	6a 00                	push   $0x0
c0101094:	ff 75 f0             	pushl  -0x10(%ebp)
c0101097:	e8 b3 b1 00 00       	call   c010c24f <Memset>
c010109c:	83 c4 10             	add    $0x10,%esp
c010109f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01010a2:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01010a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01010ac:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01010b3:	83 ec 04             	sub    $0x4,%esp
c01010b6:	6a 02                	push   $0x2
c01010b8:	ff 75 f0             	pushl  -0x10(%ebp)
c01010bb:	6a 01                	push   $0x1
c01010bd:	e8 e3 87 00 00       	call   c01098a5 <send_rec>
c01010c2:	83 c4 10             	add    $0x10,%esp
c01010c5:	83 ec 08             	sub    $0x8,%esp
c01010c8:	6a 7c                	push   $0x7c
c01010ca:	ff 75 f0             	pushl  -0x10(%ebp)
c01010cd:	e8 af 08 00 00       	call   c0101981 <sys_free>
c01010d2:	83 c4 10             	add    $0x10,%esp
c01010d5:	90                   	nop
c01010d6:	c9                   	leave  
c01010d7:	c3                   	ret    

c01010d8 <get_hd_ioctl>:
c01010d8:	55                   	push   %ebp
c01010d9:	89 e5                	mov    %esp,%ebp
c01010db:	83 ec 18             	sub    $0x18,%esp
c01010de:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c01010e2:	7f 19                	jg     c01010fd <get_hd_ioctl+0x25>
c01010e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01010e7:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01010ec:	89 c8                	mov    %ecx,%eax
c01010ee:	f7 ea                	imul   %edx
c01010f0:	d1 fa                	sar    %edx
c01010f2:	89 c8                	mov    %ecx,%eax
c01010f4:	c1 f8 1f             	sar    $0x1f,%eax
c01010f7:	29 c2                	sub    %eax,%edx
c01010f9:	89 d0                	mov    %edx,%eax
c01010fb:	eb 11                	jmp    c010110e <get_hd_ioctl+0x36>
c01010fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0101100:	83 e8 10             	sub    $0x10,%eax
c0101103:	8d 50 3f             	lea    0x3f(%eax),%edx
c0101106:	85 c0                	test   %eax,%eax
c0101108:	0f 48 c2             	cmovs  %edx,%eax
c010110b:	c1 f8 06             	sar    $0x6,%eax
c010110e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101111:	8b 55 08             	mov    0x8(%ebp),%edx
c0101114:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101117:	c1 e2 03             	shl    $0x3,%edx
c010111a:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101120:	01 d0                	add    %edx,%eax
c0101122:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c0101127:	8b 00                	mov    (%eax),%eax
c0101129:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010112c:	83 ec 0c             	sub    $0xc,%esp
c010112f:	6a 7c                	push   $0x7c
c0101131:	e8 36 08 00 00       	call   c010196c <sys_malloc>
c0101136:	83 c4 10             	add    $0x10,%esp
c0101139:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010113c:	83 ec 04             	sub    $0x4,%esp
c010113f:	6a 7c                	push   $0x7c
c0101141:	6a 00                	push   $0x0
c0101143:	ff 75 ec             	pushl  -0x14(%ebp)
c0101146:	e8 04 b1 00 00       	call   c010c24f <Memset>
c010114b:	83 c4 10             	add    $0x10,%esp
c010114e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101151:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101158:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010115b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101162:	83 ec 04             	sub    $0x4,%esp
c0101165:	6a 02                	push   $0x2
c0101167:	ff 75 ec             	pushl  -0x14(%ebp)
c010116a:	6a 01                	push   $0x1
c010116c:	e8 34 87 00 00       	call   c01098a5 <send_rec>
c0101171:	83 c4 10             	add    $0x10,%esp
c0101174:	83 ec 08             	sub    $0x8,%esp
c0101177:	6a 7c                	push   $0x7c
c0101179:	ff 75 ec             	pushl  -0x14(%ebp)
c010117c:	e8 00 08 00 00       	call   c0101981 <sys_free>
c0101181:	83 c4 10             	add    $0x10,%esp
c0101184:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101187:	c9                   	leave  
c0101188:	c3                   	ret    

c0101189 <wait_for>:
c0101189:	55                   	push   %ebp
c010118a:	89 e5                	mov    %esp,%ebp
c010118c:	83 ec 08             	sub    $0x8,%esp
c010118f:	83 ec 04             	sub    $0x4,%esp
c0101192:	68 50 c3 00 00       	push   $0xc350
c0101197:	6a 08                	push   $0x8
c0101199:	6a 08                	push   $0x8
c010119b:	e8 18 06 00 00       	call   c01017b8 <waitfor>
c01011a0:	83 c4 10             	add    $0x10,%esp
c01011a3:	85 c0                	test   %eax,%eax
c01011a5:	75 10                	jne    c01011b7 <wait_for+0x2e>
c01011a7:	83 ec 0c             	sub    $0xc,%esp
c01011aa:	68 e4 b1 10 c0       	push   $0xc010b1e4
c01011af:	e8 63 7a 00 00       	call   c0108c17 <panic>
c01011b4:	83 c4 10             	add    $0x10,%esp
c01011b7:	90                   	nop
c01011b8:	c9                   	leave  
c01011b9:	c3                   	ret    

c01011ba <interrupt_wait>:
c01011ba:	55                   	push   %ebp
c01011bb:	89 e5                	mov    %esp,%ebp
c01011bd:	83 ec 18             	sub    $0x18,%esp
c01011c0:	83 ec 0c             	sub    $0xc,%esp
c01011c3:	6a 7c                	push   $0x7c
c01011c5:	e8 a2 07 00 00       	call   c010196c <sys_malloc>
c01011ca:	83 c4 10             	add    $0x10,%esp
c01011cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01011d0:	83 ec 04             	sub    $0x4,%esp
c01011d3:	6a 7c                	push   $0x7c
c01011d5:	6a 00                	push   $0x0
c01011d7:	ff 75 f4             	pushl  -0xc(%ebp)
c01011da:	e8 70 b0 00 00       	call   c010c24f <Memset>
c01011df:	83 c4 10             	add    $0x10,%esp
c01011e2:	83 ec 04             	sub    $0x4,%esp
c01011e5:	68 13 02 00 00       	push   $0x213
c01011ea:	ff 75 f4             	pushl  -0xc(%ebp)
c01011ed:	6a 02                	push   $0x2
c01011ef:	e8 b1 86 00 00       	call   c01098a5 <send_rec>
c01011f4:	83 c4 10             	add    $0x10,%esp
c01011f7:	83 ec 08             	sub    $0x8,%esp
c01011fa:	6a 7c                	push   $0x7c
c01011fc:	ff 75 f4             	pushl  -0xc(%ebp)
c01011ff:	e8 7d 07 00 00       	call   c0101981 <sys_free>
c0101204:	83 c4 10             	add    $0x10,%esp
c0101207:	90                   	nop
c0101208:	c9                   	leave  
c0101209:	c3                   	ret    

c010120a <hd_rdwt>:
c010120a:	55                   	push   %ebp
c010120b:	89 e5                	mov    %esp,%ebp
c010120d:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c0101213:	8b 45 08             	mov    0x8(%ebp),%eax
c0101216:	8b 40 18             	mov    0x18(%eax),%eax
c0101219:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010121c:	8b 45 08             	mov    0x8(%ebp),%eax
c010121f:	8b 40 14             	mov    0x14(%eax),%eax
c0101222:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101225:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0101229:	7f 19                	jg     c0101244 <hd_rdwt+0x3a>
c010122b:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c010122e:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101233:	89 c8                	mov    %ecx,%eax
c0101235:	f7 ea                	imul   %edx
c0101237:	d1 fa                	sar    %edx
c0101239:	89 c8                	mov    %ecx,%eax
c010123b:	c1 f8 1f             	sar    $0x1f,%eax
c010123e:	29 c2                	sub    %eax,%edx
c0101240:	89 d0                	mov    %edx,%eax
c0101242:	eb 11                	jmp    c0101255 <hd_rdwt+0x4b>
c0101244:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101247:	83 e8 10             	sub    $0x10,%eax
c010124a:	8d 50 3f             	lea    0x3f(%eax),%edx
c010124d:	85 c0                	test   %eax,%eax
c010124f:	0f 48 c2             	cmovs  %edx,%eax
c0101252:	c1 f8 06             	sar    $0x6,%eax
c0101255:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101258:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010125b:	8d 50 f0             	lea    -0x10(%eax),%edx
c010125e:	89 d0                	mov    %edx,%eax
c0101260:	c1 f8 1f             	sar    $0x1f,%eax
c0101263:	c1 e8 1a             	shr    $0x1a,%eax
c0101266:	01 c2                	add    %eax,%edx
c0101268:	83 e2 3f             	and    $0x3f,%edx
c010126b:	29 c2                	sub    %eax,%edx
c010126d:	89 d0                	mov    %edx,%eax
c010126f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101272:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101275:	c1 e8 09             	shr    $0x9,%eax
c0101278:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010127b:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c010127f:	7f 1a                	jg     c010129b <hd_rdwt+0x91>
c0101281:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101284:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101287:	c1 e2 03             	shl    $0x3,%edx
c010128a:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101290:	01 d0                	add    %edx,%eax
c0101292:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101297:	8b 00                	mov    (%eax),%eax
c0101299:	eb 1b                	jmp    c01012b6 <hd_rdwt+0xac>
c010129b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010129e:	8d 50 04             	lea    0x4(%eax),%edx
c01012a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01012a4:	c1 e2 03             	shl    $0x3,%edx
c01012a7:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01012ad:	01 d0                	add    %edx,%eax
c01012af:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c01012b4:	8b 00                	mov    (%eax),%eax
c01012b6:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01012b9:	01 d0                	add    %edx,%eax
c01012bb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01012be:	8b 45 08             	mov    0x8(%ebp),%eax
c01012c1:	8b 40 0c             	mov    0xc(%eax),%eax
c01012c4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01012c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012ca:	05 ff 01 00 00       	add    $0x1ff,%eax
c01012cf:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01012d5:	85 c0                	test   %eax,%eax
c01012d7:	0f 48 c2             	cmovs  %edx,%eax
c01012da:	c1 f8 09             	sar    $0x9,%eax
c01012dd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01012e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01012e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01012e9:	8b 40 10             	mov    0x10(%eax),%eax
c01012ec:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01012ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01012f2:	8b 00                	mov    (%eax),%eax
c01012f4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01012f7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012fa:	83 ec 08             	sub    $0x8,%esp
c01012fd:	50                   	push   %eax
c01012fe:	ff 75 d0             	pushl  -0x30(%ebp)
c0101301:	e8 a9 4e 00 00       	call   c01061af <alloc_virtual_memory>
c0101306:	83 c4 10             	add    $0x10,%esp
c0101309:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010130c:	8b 45 08             	mov    0x8(%ebp),%eax
c010130f:	8b 40 78             	mov    0x78(%eax),%eax
c0101312:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101315:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101319:	74 22                	je     c010133d <hd_rdwt+0x133>
c010131b:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c010131f:	74 1c                	je     c010133d <hd_rdwt+0x133>
c0101321:	68 ba 01 00 00       	push   $0x1ba
c0101326:	68 34 b1 10 c0       	push   $0xc010b134
c010132b:	68 34 b1 10 c0       	push   $0xc010b134
c0101330:	68 f6 b1 10 c0       	push   $0xc010b1f6
c0101335:	e8 fb 78 00 00       	call   c0108c35 <assertion_failure>
c010133a:	83 c4 10             	add    $0x10,%esp
c010133d:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0101341:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0101344:	88 45 be             	mov    %al,-0x42(%ebp)
c0101347:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010134a:	88 45 bf             	mov    %al,-0x41(%ebp)
c010134d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101350:	c1 f8 08             	sar    $0x8,%eax
c0101353:	88 45 c0             	mov    %al,-0x40(%ebp)
c0101356:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101359:	c1 f8 10             	sar    $0x10,%eax
c010135c:	88 45 c1             	mov    %al,-0x3f(%ebp)
c010135f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101362:	c1 f8 18             	sar    $0x18,%eax
c0101365:	83 e0 0f             	and    $0xf,%eax
c0101368:	83 c8 e0             	or     $0xffffffe0,%eax
c010136b:	88 45 c2             	mov    %al,-0x3e(%ebp)
c010136e:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101372:	75 07                	jne    c010137b <hd_rdwt+0x171>
c0101374:	b8 20 00 00 00       	mov    $0x20,%eax
c0101379:	eb 05                	jmp    c0101380 <hd_rdwt+0x176>
c010137b:	b8 30 00 00 00       	mov    $0x30,%eax
c0101380:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0101383:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101387:	3c 20                	cmp    $0x20,%al
c0101389:	74 24                	je     c01013af <hd_rdwt+0x1a5>
c010138b:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010138f:	3c 30                	cmp    $0x30,%al
c0101391:	74 1c                	je     c01013af <hd_rdwt+0x1a5>
c0101393:	68 c8 01 00 00       	push   $0x1c8
c0101398:	68 34 b1 10 c0       	push   $0xc010b134
c010139d:	68 34 b1 10 c0       	push   $0xc010b134
c01013a2:	68 14 b2 10 c0       	push   $0xc010b214
c01013a7:	e8 89 78 00 00       	call   c0108c35 <assertion_failure>
c01013ac:	83 c4 10             	add    $0x10,%esp
c01013af:	83 ec 0c             	sub    $0xc,%esp
c01013b2:	8d 45 bd             	lea    -0x43(%ebp),%eax
c01013b5:	50                   	push   %eax
c01013b6:	e8 ca f5 ff ff       	call   c0100985 <hd_cmd_out>
c01013bb:	83 c4 10             	add    $0x10,%esp
c01013be:	e9 9c 00 00 00       	jmp    c010145f <hd_rdwt+0x255>
c01013c3:	b8 00 02 00 00       	mov    $0x200,%eax
c01013c8:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c01013cf:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c01013d3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01013d6:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01013da:	75 51                	jne    c010142d <hd_rdwt+0x223>
c01013dc:	e8 a8 fd ff ff       	call   c0101189 <wait_for>
c01013e1:	e8 d4 fd ff ff       	call   c01011ba <interrupt_wait>
c01013e6:	83 ec 04             	sub    $0x4,%esp
c01013e9:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013ec:	6a 00                	push   $0x0
c01013ee:	68 80 11 11 c0       	push   $0xc0111180
c01013f3:	e8 57 ae 00 00       	call   c010c24f <Memset>
c01013f8:	83 c4 10             	add    $0x10,%esp
c01013fb:	83 ec 04             	sub    $0x4,%esp
c01013fe:	68 00 02 00 00       	push   $0x200
c0101403:	68 80 11 11 c0       	push   $0xc0111180
c0101408:	68 f0 01 00 00       	push   $0x1f0
c010140d:	e8 91 ae 00 00       	call   c010c2a3 <read_port>
c0101412:	83 c4 10             	add    $0x10,%esp
c0101415:	83 ec 04             	sub    $0x4,%esp
c0101418:	ff 75 c4             	pushl  -0x3c(%ebp)
c010141b:	68 80 11 11 c0       	push   $0xc0111180
c0101420:	ff 75 f0             	pushl  -0x10(%ebp)
c0101423:	e8 f4 5b 00 00       	call   c010701c <Memcpy>
c0101428:	83 c4 10             	add    $0x10,%esp
c010142b:	eb 26                	jmp    c0101453 <hd_rdwt+0x249>
c010142d:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101431:	75 20                	jne    c0101453 <hd_rdwt+0x249>
c0101433:	e8 51 fd ff ff       	call   c0101189 <wait_for>
c0101438:	83 ec 04             	sub    $0x4,%esp
c010143b:	ff 75 c4             	pushl  -0x3c(%ebp)
c010143e:	ff 75 f0             	pushl  -0x10(%ebp)
c0101441:	68 f0 01 00 00       	push   $0x1f0
c0101446:	e8 6c ae 00 00       	call   c010c2b7 <write_port>
c010144b:	83 c4 10             	add    $0x10,%esp
c010144e:	e8 67 fd ff ff       	call   c01011ba <interrupt_wait>
c0101453:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101456:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101459:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010145c:	01 45 f0             	add    %eax,-0x10(%ebp)
c010145f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101463:	0f 85 5a ff ff ff    	jne    c01013c3 <hd_rdwt+0x1b9>
c0101469:	83 ec 04             	sub    $0x4,%esp
c010146c:	6a 7c                	push   $0x7c
c010146e:	6a 00                	push   $0x0
c0101470:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101476:	50                   	push   %eax
c0101477:	e8 d3 ad 00 00       	call   c010c24f <Memset>
c010147c:	83 c4 10             	add    $0x10,%esp
c010147f:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0101486:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c010148d:	00 00 00 
c0101490:	83 ec 04             	sub    $0x4,%esp
c0101493:	6a 02                	push   $0x2
c0101495:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010149b:	50                   	push   %eax
c010149c:	6a 01                	push   $0x1
c010149e:	e8 02 84 00 00       	call   c01098a5 <send_rec>
c01014a3:	83 c4 10             	add    $0x10,%esp
c01014a6:	90                   	nop
c01014a7:	c9                   	leave  
c01014a8:	c3                   	ret    

c01014a9 <hd_handler>:
c01014a9:	55                   	push   %ebp
c01014aa:	89 e5                	mov    %esp,%ebp
c01014ac:	83 ec 18             	sub    $0x18,%esp
c01014af:	83 ec 0c             	sub    $0xc,%esp
c01014b2:	68 f7 01 00 00       	push   $0x1f7
c01014b7:	e8 76 ee ff ff       	call   c0100332 <in_byte>
c01014bc:	83 c4 10             	add    $0x10,%esp
c01014bf:	0f b6 c0             	movzbl %al,%eax
c01014c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01014c5:	83 ec 0c             	sub    $0xc,%esp
c01014c8:	6a 03                	push   $0x3
c01014ca:	e8 70 86 00 00       	call   c0109b3f <inform_int>
c01014cf:	83 c4 10             	add    $0x10,%esp
c01014d2:	90                   	nop
c01014d3:	c9                   	leave  
c01014d4:	c3                   	ret    

c01014d5 <debug_ticks>:
c01014d5:	55                   	push   %ebp
c01014d6:	89 e5                	mov    %esp,%ebp
c01014d8:	83 ec 08             	sub    $0x8,%esp
c01014db:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01014e0:	83 c0 01             	add    $0x1,%eax
c01014e3:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c01014e8:	c7 05 a4 f7 10 c0 ae 	movl   $0x1ae,0xc010f7a4
c01014ef:	01 00 00 
c01014f2:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01014f7:	83 ec 0c             	sub    $0xc,%esp
c01014fa:	50                   	push   %eax
c01014fb:	e8 0a 5f 00 00       	call   c010740a <disp_int>
c0101500:	83 c4 10             	add    $0x10,%esp
c0101503:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0101508:	83 f8 01             	cmp    $0x1,%eax
c010150b:	75 03                	jne    c0101510 <debug_ticks+0x3b>
c010150d:	66 87 db             	xchg   %bx,%bx
c0101510:	90                   	nop
c0101511:	c9                   	leave  
c0101512:	c3                   	ret    

c0101513 <net_handler>:
c0101513:	55                   	push   %ebp
c0101514:	89 e5                	mov    %esp,%ebp
c0101516:	83 ec 58             	sub    $0x58,%esp
c0101519:	e8 3a 95 00 00       	call   c010aa58 <get_interrupt_status>
c010151e:	88 45 b7             	mov    %al,-0x49(%ebp)
c0101521:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
c0101525:	83 ec 04             	sub    $0x4,%esp
c0101528:	6a 01                	push   $0x1
c010152a:	8d 45 b7             	lea    -0x49(%ebp),%eax
c010152d:	50                   	push   %eax
c010152e:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0101531:	50                   	push   %eax
c0101532:	e8 e5 5a 00 00       	call   c010701c <Memcpy>
c0101537:	83 c4 10             	add    $0x10,%esp
c010153a:	c7 45 d8 00 01 00 00 	movl   $0x100,-0x28(%ebp)
c0101541:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
c0101545:	83 e0 01             	and    $0x1,%eax
c0101548:	84 c0                	test   %al,%al
c010154a:	0f 84 17 02 00 00    	je     c0101767 <net_handler+0x254>
c0101550:	83 ec 0c             	sub    $0xc,%esp
c0101553:	68 48 b2 10 c0       	push   $0xc010b248
c0101558:	e8 7c eb ff ff       	call   c01000d9 <disp_str>
c010155d:	83 c4 10             	add    $0x10,%esp
c0101560:	83 ec 0c             	sub    $0xc,%esp
c0101563:	68 6e b2 10 c0       	push   $0xc010b26e
c0101568:	e8 6c eb ff ff       	call   c01000d9 <disp_str>
c010156d:	83 c4 10             	add    $0x10,%esp
c0101570:	c7 45 d4 00 40 00 00 	movl   $0x4000,-0x2c(%ebp)
c0101577:	e8 0b 95 00 00       	call   c010aa87 <get_curr_page>
c010157c:	88 45 d3             	mov    %al,-0x2d(%ebp)
c010157f:	83 ec 0c             	sub    $0xc,%esp
c0101582:	68 7f b2 10 c0       	push   $0xc010b27f
c0101587:	e8 4d eb ff ff       	call   c01000d9 <disp_str>
c010158c:	83 c4 10             	add    $0x10,%esp
c010158f:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c0101593:	83 ec 0c             	sub    $0xc,%esp
c0101596:	50                   	push   %eax
c0101597:	e8 6e 5e 00 00       	call   c010740a <disp_int>
c010159c:	83 c4 10             	add    $0x10,%esp
c010159f:	83 ec 0c             	sub    $0xc,%esp
c01015a2:	68 81 b2 10 c0       	push   $0xc010b281
c01015a7:	e8 2d eb ff ff       	call   c01000d9 <disp_str>
c01015ac:	83 c4 10             	add    $0x10,%esp
c01015af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01015b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01015bd:	0f b6 05 c0 06 11 c0 	movzbl 0xc01106c0,%eax
c01015c4:	88 45 d2             	mov    %al,-0x2e(%ebp)
c01015c7:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01015cb:	88 45 d1             	mov    %al,-0x2f(%ebp)
c01015ce:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
c01015d2:	a2 c0 06 11 c0       	mov    %al,0xc01106c0
c01015d7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01015de:	0f b6 45 d2          	movzbl -0x2e(%ebp),%eax
c01015e2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01015e5:	e9 a1 00 00 00       	jmp    c010168b <net_handler+0x178>
c01015ea:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01015ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01015f1:	83 ec 0c             	sub    $0xc,%esp
c01015f4:	50                   	push   %eax
c01015f5:	e8 72 03 00 00       	call   c010196c <sys_malloc>
c01015fa:	83 c4 10             	add    $0x10,%esp
c01015fd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101600:	83 ec 04             	sub    $0x4,%esp
c0101603:	ff 75 d8             	pushl  -0x28(%ebp)
c0101606:	6a 00                	push   $0x0
c0101608:	ff 75 cc             	pushl  -0x34(%ebp)
c010160b:	e8 3f ac 00 00       	call   c010c24f <Memset>
c0101610:	83 c4 10             	add    $0x10,%esp
c0101613:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101616:	c1 e0 08             	shl    $0x8,%eax
c0101619:	83 ec 0c             	sub    $0xc,%esp
c010161c:	50                   	push   %eax
c010161d:	e8 2b 93 00 00       	call   c010a94d <SetPageStart>
c0101622:	83 c4 10             	add    $0x10,%esp
c0101625:	83 ec 0c             	sub    $0xc,%esp
c0101628:	ff 75 cc             	pushl  -0x34(%ebp)
c010162b:	e8 74 94 00 00       	call   c010aaa4 <NICtoPC>
c0101630:	83 c4 10             	add    $0x10,%esp
c0101633:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101636:	c7 45 c4 08 00 00 00 	movl   $0x8,-0x3c(%ebp)
c010163d:	83 ec 0c             	sub    $0xc,%esp
c0101640:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101643:	e8 24 03 00 00       	call   c010196c <sys_malloc>
c0101648:	83 c4 10             	add    $0x10,%esp
c010164b:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010164e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101651:	83 ec 04             	sub    $0x4,%esp
c0101654:	50                   	push   %eax
c0101655:	6a 00                	push   $0x0
c0101657:	ff 75 c0             	pushl  -0x40(%ebp)
c010165a:	e8 f0 ab 00 00       	call   c010c24f <Memset>
c010165f:	83 c4 10             	add    $0x10,%esp
c0101662:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0101665:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0101668:	89 10                	mov    %edx,(%eax)
c010166a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010166e:	75 08                	jne    c0101678 <net_handler+0x165>
c0101670:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0101673:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101676:	eb 09                	jmp    c0101681 <net_handler+0x16e>
c0101678:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010167b:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010167e:	89 50 04             	mov    %edx,0x4(%eax)
c0101681:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0101684:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101687:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010168b:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
c010168f:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0101692:	0f 8c 52 ff ff ff    	jl     c01015ea <net_handler+0xd7>
c0101698:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010169b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010169e:	0f af c2             	imul   %edx,%eax
c01016a1:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01016a4:	83 ec 0c             	sub    $0xc,%esp
c01016a7:	ff 75 bc             	pushl  -0x44(%ebp)
c01016aa:	e8 bd 02 00 00       	call   c010196c <sys_malloc>
c01016af:	83 c4 10             	add    $0x10,%esp
c01016b2:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01016b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01016bb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01016c2:	eb 30                	jmp    c01016f4 <net_handler+0x1e1>
c01016c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01016c7:	8b 00                	mov    (%eax),%eax
c01016c9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01016cc:	89 d1                	mov    %edx,%ecx
c01016ce:	0f af 4d e0          	imul   -0x20(%ebp),%ecx
c01016d2:	8b 55 b8             	mov    -0x48(%ebp),%edx
c01016d5:	01 ca                	add    %ecx,%edx
c01016d7:	83 ec 04             	sub    $0x4,%esp
c01016da:	ff 75 d8             	pushl  -0x28(%ebp)
c01016dd:	50                   	push   %eax
c01016de:	52                   	push   %edx
c01016df:	e8 38 59 00 00       	call   c010701c <Memcpy>
c01016e4:	83 c4 10             	add    $0x10,%esp
c01016e7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01016eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01016ee:	8b 40 04             	mov    0x4(%eax),%eax
c01016f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01016f4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01016f8:	75 ca                	jne    c01016c4 <net_handler+0x1b1>
c01016fa:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0101701:	eb 2e                	jmp    c0101731 <net_handler+0x21e>
c0101703:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101706:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0101709:	01 d0                	add    %edx,%eax
c010170b:	0f b6 00             	movzbl (%eax),%eax
c010170e:	0f b6 c0             	movzbl %al,%eax
c0101711:	83 ec 0c             	sub    $0xc,%esp
c0101714:	50                   	push   %eax
c0101715:	e8 f0 5c 00 00       	call   c010740a <disp_int>
c010171a:	83 c4 10             	add    $0x10,%esp
c010171d:	83 ec 0c             	sub    $0xc,%esp
c0101720:	68 84 b2 10 c0       	push   $0xc010b284
c0101725:	e8 af e9 ff ff       	call   c01000d9 <disp_str>
c010172a:	83 c4 10             	add    $0x10,%esp
c010172d:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0101731:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101734:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0101737:	77 ca                	ja     c0101703 <net_handler+0x1f0>
c0101739:	83 ec 0c             	sub    $0xc,%esp
c010173c:	ff 75 b8             	pushl  -0x48(%ebp)
c010173f:	e8 95 e9 ff ff       	call   c01000d9 <disp_str>
c0101744:	83 c4 10             	add    $0x10,%esp
c0101747:	83 ec 0c             	sub    $0xc,%esp
c010174a:	68 86 b2 10 c0       	push   $0xc010b286
c010174f:	e8 85 e9 ff ff       	call   c01000d9 <disp_str>
c0101754:	83 c4 10             	add    $0x10,%esp
c0101757:	83 ec 0c             	sub    $0xc,%esp
c010175a:	68 86 b2 10 c0       	push   $0xc010b286
c010175f:	e8 75 e9 ff ff       	call   c01000d9 <disp_str>
c0101764:	83 c4 10             	add    $0x10,%esp
c0101767:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
c010176b:	83 e0 40             	and    $0x40,%eax
c010176e:	84 c0                	test   %al,%al
c0101770:	74 30                	je     c01017a2 <net_handler+0x28f>
c0101772:	83 ec 0c             	sub    $0xc,%esp
c0101775:	68 88 b2 10 c0       	push   $0xc010b288
c010177a:	e8 5a e9 ff ff       	call   c01000d9 <disp_str>
c010177f:	83 c4 10             	add    $0x10,%esp
c0101782:	83 ec 0c             	sub    $0xc,%esp
c0101785:	68 ad b2 10 c0       	push   $0xc010b2ad
c010178a:	e8 4a e9 ff ff       	call   c01000d9 <disp_str>
c010178f:	83 c4 10             	add    $0x10,%esp
c0101792:	83 ec 0c             	sub    $0xc,%esp
c0101795:	68 bc b2 10 c0       	push   $0xc010b2bc
c010179a:	e8 3a e9 ff ff       	call   c01000d9 <disp_str>
c010179f:	83 c4 10             	add    $0x10,%esp
c01017a2:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
c01017a6:	0f b6 c0             	movzbl %al,%eax
c01017a9:	83 ec 0c             	sub    $0xc,%esp
c01017ac:	50                   	push   %eax
c01017ad:	e8 bc 92 00 00       	call   c010aa6e <set_interrupt_status>
c01017b2:	83 c4 10             	add    $0x10,%esp
c01017b5:	90                   	nop
c01017b6:	c9                   	leave  
c01017b7:	c3                   	ret    

c01017b8 <waitfor>:
c01017b8:	55                   	push   %ebp
c01017b9:	89 e5                	mov    %esp,%ebp
c01017bb:	83 ec 18             	sub    $0x18,%esp
c01017be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01017c5:	eb 26                	jmp    c01017ed <waitfor+0x35>
c01017c7:	83 ec 0c             	sub    $0xc,%esp
c01017ca:	68 f7 01 00 00       	push   $0x1f7
c01017cf:	e8 5e eb ff ff       	call   c0100332 <in_byte>
c01017d4:	83 c4 10             	add    $0x10,%esp
c01017d7:	0f b6 c0             	movzbl %al,%eax
c01017da:	23 45 08             	and    0x8(%ebp),%eax
c01017dd:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01017e0:	75 07                	jne    c01017e9 <waitfor+0x31>
c01017e2:	b8 01 00 00 00       	mov    $0x1,%eax
c01017e7:	eb 11                	jmp    c01017fa <waitfor+0x42>
c01017e9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01017ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017f0:	3b 45 10             	cmp    0x10(%ebp),%eax
c01017f3:	7c d2                	jl     c01017c7 <waitfor+0xf>
c01017f5:	b8 00 00 00 00       	mov    $0x0,%eax
c01017fa:	c9                   	leave  
c01017fb:	c3                   	ret    

c01017fc <print_hd_info>:
c01017fc:	55                   	push   %ebp
c01017fd:	89 e5                	mov    %esp,%ebp
c01017ff:	83 ec 18             	sub    $0x18,%esp
c0101802:	83 ec 0c             	sub    $0xc,%esp
c0101805:	68 e1 b2 10 c0       	push   $0xc010b2e1
c010180a:	e8 c9 70 00 00       	call   c01088d8 <Printf>
c010180f:	83 c4 10             	add    $0x10,%esp
c0101812:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101819:	eb 3b                	jmp    c0101856 <print_hd_info+0x5a>
c010181b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010181e:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101825:	85 c0                	test   %eax,%eax
c0101827:	74 28                	je     c0101851 <print_hd_info+0x55>
c0101829:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010182c:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101833:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101836:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c010183d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101840:	52                   	push   %edx
c0101841:	50                   	push   %eax
c0101842:	68 fe b2 10 c0       	push   $0xc010b2fe
c0101847:	e8 8c 70 00 00       	call   c01088d8 <Printf>
c010184c:	83 c4 10             	add    $0x10,%esp
c010184f:	eb 01                	jmp    c0101852 <print_hd_info+0x56>
c0101851:	90                   	nop
c0101852:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101856:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c010185a:	7e bf                	jle    c010181b <print_hd_info+0x1f>
c010185c:	83 ec 0c             	sub    $0xc,%esp
c010185f:	68 16 b3 10 c0       	push   $0xc010b316
c0101864:	e8 6f 70 00 00       	call   c01088d8 <Printf>
c0101869:	83 c4 10             	add    $0x10,%esp
c010186c:	83 ec 0c             	sub    $0xc,%esp
c010186f:	68 31 b3 10 c0       	push   $0xc010b331
c0101874:	e8 5f 70 00 00       	call   c01088d8 <Printf>
c0101879:	83 c4 10             	add    $0x10,%esp
c010187c:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0101883:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010188a:	eb 44                	jmp    c01018d0 <print_hd_info+0xd4>
c010188c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010188f:	83 c0 04             	add    $0x4,%eax
c0101892:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101899:	85 c0                	test   %eax,%eax
c010189b:	74 2e                	je     c01018cb <print_hd_info+0xcf>
c010189d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01018a0:	83 c0 04             	add    $0x4,%eax
c01018a3:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01018aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01018ad:	83 c0 04             	add    $0x4,%eax
c01018b0:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01018b7:	ff 75 f0             	pushl  -0x10(%ebp)
c01018ba:	52                   	push   %edx
c01018bb:	50                   	push   %eax
c01018bc:	68 fe b2 10 c0       	push   $0xc010b2fe
c01018c1:	e8 12 70 00 00       	call   c01088d8 <Printf>
c01018c6:	83 c4 10             	add    $0x10,%esp
c01018c9:	eb 01                	jmp    c01018cc <print_hd_info+0xd0>
c01018cb:	90                   	nop
c01018cc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01018d0:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01018d4:	7e b6                	jle    c010188c <print_hd_info+0x90>
c01018d6:	83 ec 0c             	sub    $0xc,%esp
c01018d9:	68 4e b3 10 c0       	push   $0xc010b34e
c01018de:	e8 f5 6f 00 00       	call   c01088d8 <Printf>
c01018e3:	83 c4 10             	add    $0x10,%esp
c01018e6:	90                   	nop
c01018e7:	c9                   	leave  
c01018e8:	c3                   	ret    

c01018e9 <is_empty>:
c01018e9:	55                   	push   %ebp
c01018ea:	89 e5                	mov    %esp,%ebp
c01018ec:	83 ec 10             	sub    $0x10,%esp
c01018ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01018f6:	eb 1a                	jmp    c0101912 <is_empty+0x29>
c01018f8:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01018fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01018fe:	01 d0                	add    %edx,%eax
c0101900:	0f b6 00             	movzbl (%eax),%eax
c0101903:	84 c0                	test   %al,%al
c0101905:	74 07                	je     c010190e <is_empty+0x25>
c0101907:	b8 00 00 00 00       	mov    $0x0,%eax
c010190c:	eb 11                	jmp    c010191f <is_empty+0x36>
c010190e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0101912:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101915:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101918:	7c de                	jl     c01018f8 <is_empty+0xf>
c010191a:	b8 01 00 00 00       	mov    $0x1,%eax
c010191f:	c9                   	leave  
c0101920:	c3                   	ret    
c0101921:	66 90                	xchg   %ax,%ax
c0101923:	66 90                	xchg   %ax,%ax
c0101925:	66 90                	xchg   %ax,%ax
c0101927:	66 90                	xchg   %ax,%ax
c0101929:	66 90                	xchg   %ax,%ax
c010192b:	66 90                	xchg   %ax,%ax
c010192d:	66 90                	xchg   %ax,%ax
c010192f:	90                   	nop

c0101930 <write_debug>:
c0101930:	b8 02 00 00 00       	mov    $0x2,%eax
c0101935:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101939:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010193d:	cd 90                	int    $0x90
c010193f:	c3                   	ret    

c0101940 <send_msg>:
c0101940:	55                   	push   %ebp
c0101941:	89 e5                	mov    %esp,%ebp
c0101943:	53                   	push   %ebx
c0101944:	51                   	push   %ecx
c0101945:	b8 03 00 00 00       	mov    $0x3,%eax
c010194a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010194d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101950:	cd 90                	int    $0x90
c0101952:	59                   	pop    %ecx
c0101953:	5b                   	pop    %ebx
c0101954:	5d                   	pop    %ebp
c0101955:	c3                   	ret    

c0101956 <receive_msg>:
c0101956:	55                   	push   %ebp
c0101957:	89 e5                	mov    %esp,%ebp
c0101959:	53                   	push   %ebx
c010195a:	51                   	push   %ecx
c010195b:	b8 04 00 00 00       	mov    $0x4,%eax
c0101960:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101963:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101966:	cd 90                	int    $0x90
c0101968:	59                   	pop    %ecx
c0101969:	5b                   	pop    %ebx
c010196a:	5d                   	pop    %ebp
c010196b:	c3                   	ret    

c010196c <sys_malloc>:
c010196c:	56                   	push   %esi
c010196d:	57                   	push   %edi
c010196e:	53                   	push   %ebx
c010196f:	55                   	push   %ebp
c0101970:	89 e5                	mov    %esp,%ebp
c0101972:	b8 05 00 00 00       	mov    $0x5,%eax
c0101977:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010197a:	cd 90                	int    $0x90
c010197c:	5d                   	pop    %ebp
c010197d:	5b                   	pop    %ebx
c010197e:	5f                   	pop    %edi
c010197f:	5e                   	pop    %esi
c0101980:	c3                   	ret    

c0101981 <sys_free>:
c0101981:	56                   	push   %esi
c0101982:	57                   	push   %edi
c0101983:	53                   	push   %ebx
c0101984:	55                   	push   %ebp
c0101985:	89 e5                	mov    %esp,%ebp
c0101987:	b8 06 00 00 00       	mov    $0x6,%eax
c010198c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010198f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0101992:	cd 90                	int    $0x90
c0101994:	5d                   	pop    %ebp
c0101995:	5b                   	pop    %ebx
c0101996:	5f                   	pop    %edi
c0101997:	5e                   	pop    %esi
c0101998:	c3                   	ret    

c0101999 <task_fs>:
c0101999:	55                   	push   %ebp
c010199a:	89 e5                	mov    %esp,%ebp
c010199c:	83 ec 28             	sub    $0x28,%esp
c010199f:	e8 bb 08 00 00       	call   c010225f <init_fs>
c01019a4:	83 ec 0c             	sub    $0xc,%esp
c01019a7:	6a 7c                	push   $0x7c
c01019a9:	e8 be ff ff ff       	call   c010196c <sys_malloc>
c01019ae:	83 c4 10             	add    $0x10,%esp
c01019b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01019b4:	83 ec 0c             	sub    $0xc,%esp
c01019b7:	6a 7c                	push   $0x7c
c01019b9:	e8 ae ff ff ff       	call   c010196c <sys_malloc>
c01019be:	83 c4 10             	add    $0x10,%esp
c01019c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01019c4:	83 ec 04             	sub    $0x4,%esp
c01019c7:	6a 7c                	push   $0x7c
c01019c9:	6a 00                	push   $0x0
c01019cb:	ff 75 f4             	pushl  -0xc(%ebp)
c01019ce:	e8 7c a8 00 00       	call   c010c24f <Memset>
c01019d3:	83 c4 10             	add    $0x10,%esp
c01019d6:	83 ec 04             	sub    $0x4,%esp
c01019d9:	6a 12                	push   $0x12
c01019db:	ff 75 f4             	pushl  -0xc(%ebp)
c01019de:	6a 02                	push   $0x2
c01019e0:	e8 c0 7e 00 00       	call   c01098a5 <send_rec>
c01019e5:	83 c4 10             	add    $0x10,%esp
c01019e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019eb:	8b 40 78             	mov    0x78(%eax),%eax
c01019ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01019f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019f4:	8b 00                	mov    (%eax),%eax
c01019f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01019f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019fc:	8b 40 50             	mov    0x50(%eax),%eax
c01019ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a05:	8b 40 68             	mov    0x68(%eax),%eax
c0101a08:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101a0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a0e:	8b 00                	mov    (%eax),%eax
c0101a10:	85 c0                	test   %eax,%eax
c0101a12:	75 07                	jne    c0101a1b <task_fs+0x82>
c0101a14:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0101a1b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101a22:	83 ec 0c             	sub    $0xc,%esp
c0101a25:	ff 75 e8             	pushl  -0x18(%ebp)
c0101a28:	e8 39 21 00 00       	call   c0103b66 <pid2proc>
c0101a2d:	83 c4 10             	add    $0x10,%esp
c0101a30:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101a35:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101a39:	74 37                	je     c0101a72 <task_fs+0xd9>
c0101a3b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101a3f:	74 31                	je     c0101a72 <task_fs+0xd9>
c0101a41:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101a45:	74 2b                	je     c0101a72 <task_fs+0xd9>
c0101a47:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0101a4b:	74 25                	je     c0101a72 <task_fs+0xd9>
c0101a4d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101a51:	74 1f                	je     c0101a72 <task_fs+0xd9>
c0101a53:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101a57:	74 19                	je     c0101a72 <task_fs+0xd9>
c0101a59:	6a 7a                	push   $0x7a
c0101a5b:	68 70 b3 10 c0       	push   $0xc010b370
c0101a60:	68 70 b3 10 c0       	push   $0xc010b370
c0101a65:	68 80 b3 10 c0       	push   $0xc010b380
c0101a6a:	e8 c6 71 00 00       	call   c0108c35 <assertion_failure>
c0101a6f:	83 c4 10             	add    $0x10,%esp
c0101a72:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101a76:	74 3a                	je     c0101ab2 <task_fs+0x119>
c0101a78:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101a7c:	7f 19                	jg     c0101a97 <task_fs+0xfe>
c0101a7e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101a82:	0f 84 10 01 00 00    	je     c0101b98 <task_fs+0x1ff>
c0101a88:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101a8c:	0f 84 a1 00 00 00    	je     c0101b33 <task_fs+0x19a>
c0101a92:	e9 ef 00 00 00       	jmp    c0101b86 <task_fs+0x1ed>
c0101a97:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101a9b:	74 50                	je     c0101aed <task_fs+0x154>
c0101a9d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101aa1:	0f 84 c6 00 00 00    	je     c0101b6d <task_fs+0x1d4>
c0101aa7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0101aab:	74 40                	je     c0101aed <task_fs+0x154>
c0101aad:	e9 d4 00 00 00       	jmp    c0101b86 <task_fs+0x1ed>
c0101ab2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ab5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101abc:	83 ec 0c             	sub    $0xc,%esp
c0101abf:	ff 75 f4             	pushl  -0xc(%ebp)
c0101ac2:	e8 ec 07 00 00       	call   c01022b3 <do_open>
c0101ac7:	83 c4 10             	add    $0x10,%esp
c0101aca:	89 c2                	mov    %eax,%edx
c0101acc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101acf:	89 50 50             	mov    %edx,0x50(%eax)
c0101ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ad5:	8b 00                	mov    (%eax),%eax
c0101ad7:	83 ec 04             	sub    $0x4,%esp
c0101ada:	50                   	push   %eax
c0101adb:	ff 75 f4             	pushl  -0xc(%ebp)
c0101ade:	6a 01                	push   $0x1
c0101ae0:	e8 c0 7d 00 00       	call   c01098a5 <send_rec>
c0101ae5:	83 c4 10             	add    $0x10,%esp
c0101ae8:	e9 b2 00 00 00       	jmp    c0101b9f <task_fs+0x206>
c0101aed:	83 ec 0c             	sub    $0xc,%esp
c0101af0:	ff 75 f4             	pushl  -0xc(%ebp)
c0101af3:	e8 19 19 00 00       	call   c0103411 <do_rdwt>
c0101af8:	83 c4 10             	add    $0x10,%esp
c0101afb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101afe:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101b02:	0f 84 96 00 00 00    	je     c0101b9e <task_fs+0x205>
c0101b08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b0b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101b12:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b18:	89 50 60             	mov    %edx,0x60(%eax)
c0101b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b1e:	8b 00                	mov    (%eax),%eax
c0101b20:	83 ec 04             	sub    $0x4,%esp
c0101b23:	50                   	push   %eax
c0101b24:	ff 75 f4             	pushl  -0xc(%ebp)
c0101b27:	6a 01                	push   $0x1
c0101b29:	e8 77 7d 00 00       	call   c01098a5 <send_rec>
c0101b2e:	83 c4 10             	add    $0x10,%esp
c0101b31:	eb 6b                	jmp    c0101b9e <task_fs+0x205>
c0101b33:	83 ec 0c             	sub    $0xc,%esp
c0101b36:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101b39:	e8 f0 1d 00 00       	call   c010392e <do_close>
c0101b3e:	83 c4 10             	add    $0x10,%esp
c0101b41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b44:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101b4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b4e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101b55:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b58:	8b 00                	mov    (%eax),%eax
c0101b5a:	83 ec 04             	sub    $0x4,%esp
c0101b5d:	50                   	push   %eax
c0101b5e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101b61:	6a 01                	push   $0x1
c0101b63:	e8 3d 7d 00 00       	call   c01098a5 <send_rec>
c0101b68:	83 c4 10             	add    $0x10,%esp
c0101b6b:	eb 32                	jmp    c0101b9f <task_fs+0x206>
c0101b6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b70:	8b 40 68             	mov    0x68(%eax),%eax
c0101b73:	83 ec 04             	sub    $0x4,%esp
c0101b76:	50                   	push   %eax
c0101b77:	ff 75 f4             	pushl  -0xc(%ebp)
c0101b7a:	6a 01                	push   $0x1
c0101b7c:	e8 24 7d 00 00       	call   c01098a5 <send_rec>
c0101b81:	83 c4 10             	add    $0x10,%esp
c0101b84:	eb 19                	jmp    c0101b9f <task_fs+0x206>
c0101b86:	83 ec 0c             	sub    $0xc,%esp
c0101b89:	68 e3 b3 10 c0       	push   $0xc010b3e3
c0101b8e:	e8 84 70 00 00       	call   c0108c17 <panic>
c0101b93:	83 c4 10             	add    $0x10,%esp
c0101b96:	eb 07                	jmp    c0101b9f <task_fs+0x206>
c0101b98:	90                   	nop
c0101b99:	e9 26 fe ff ff       	jmp    c01019c4 <task_fs+0x2b>
c0101b9e:	90                   	nop
c0101b9f:	e9 20 fe ff ff       	jmp    c01019c4 <task_fs+0x2b>

c0101ba4 <rd_wt>:
c0101ba4:	55                   	push   %ebp
c0101ba5:	89 e5                	mov    %esp,%ebp
c0101ba7:	83 ec 18             	sub    $0x18,%esp
c0101baa:	83 ec 0c             	sub    $0xc,%esp
c0101bad:	6a 7c                	push   $0x7c
c0101baf:	e8 b8 fd ff ff       	call   c010196c <sys_malloc>
c0101bb4:	83 c4 10             	add    $0x10,%esp
c0101bb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101bba:	83 ec 04             	sub    $0x4,%esp
c0101bbd:	6a 7c                	push   $0x7c
c0101bbf:	6a 00                	push   $0x0
c0101bc1:	ff 75 f4             	pushl  -0xc(%ebp)
c0101bc4:	e8 86 a6 00 00       	call   c010c24f <Memset>
c0101bc9:	83 c4 10             	add    $0x10,%esp
c0101bcc:	8b 55 18             	mov    0x18(%ebp),%edx
c0101bcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bd2:	89 50 78             	mov    %edx,0x78(%eax)
c0101bd5:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101bd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bdb:	89 50 14             	mov    %edx,0x14(%eax)
c0101bde:	8b 55 10             	mov    0x10(%ebp),%edx
c0101be1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101be4:	89 50 10             	mov    %edx,0x10(%eax)
c0101be7:	8b 55 14             	mov    0x14(%ebp),%edx
c0101bea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bed:	89 50 0c             	mov    %edx,0xc(%eax)
c0101bf0:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bf3:	c1 e0 09             	shl    $0x9,%eax
c0101bf6:	89 c2                	mov    %eax,%edx
c0101bf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101bfb:	89 50 18             	mov    %edx,0x18(%eax)
c0101bfe:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101c02:	74 22                	je     c0101c26 <rd_wt+0x82>
c0101c04:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101c08:	74 1c                	je     c0101c26 <rd_wt+0x82>
c0101c0a:	68 b1 00 00 00       	push   $0xb1
c0101c0f:	68 70 b3 10 c0       	push   $0xc010b370
c0101c14:	68 70 b3 10 c0       	push   $0xc010b370
c0101c19:	68 f6 b3 10 c0       	push   $0xc010b3f6
c0101c1e:	e8 12 70 00 00       	call   c0108c35 <assertion_failure>
c0101c23:	83 c4 10             	add    $0x10,%esp
c0101c26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c29:	8b 40 78             	mov    0x78(%eax),%eax
c0101c2c:	83 f8 07             	cmp    $0x7,%eax
c0101c2f:	74 27                	je     c0101c58 <rd_wt+0xb4>
c0101c31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101c34:	8b 40 78             	mov    0x78(%eax),%eax
c0101c37:	83 f8 0a             	cmp    $0xa,%eax
c0101c3a:	74 1c                	je     c0101c58 <rd_wt+0xb4>
c0101c3c:	68 b2 00 00 00       	push   $0xb2
c0101c41:	68 70 b3 10 c0       	push   $0xc010b370
c0101c46:	68 70 b3 10 c0       	push   $0xc010b370
c0101c4b:	68 14 b4 10 c0       	push   $0xc010b414
c0101c50:	e8 e0 6f 00 00       	call   c0108c35 <assertion_failure>
c0101c55:	83 c4 10             	add    $0x10,%esp
c0101c58:	83 ec 04             	sub    $0x4,%esp
c0101c5b:	6a 03                	push   $0x3
c0101c5d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101c60:	6a 03                	push   $0x3
c0101c62:	e8 3e 7c 00 00       	call   c01098a5 <send_rec>
c0101c67:	83 c4 10             	add    $0x10,%esp
c0101c6a:	83 ec 08             	sub    $0x8,%esp
c0101c6d:	6a 7c                	push   $0x7c
c0101c6f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101c72:	e8 0a fd ff ff       	call   c0101981 <sys_free>
c0101c77:	83 c4 10             	add    $0x10,%esp
c0101c7a:	90                   	nop
c0101c7b:	c9                   	leave  
c0101c7c:	c3                   	ret    

c0101c7d <mkfs>:
c0101c7d:	55                   	push   %ebp
c0101c7e:	89 e5                	mov    %esp,%ebp
c0101c80:	57                   	push   %edi
c0101c81:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101c87:	83 ec 0c             	sub    $0xc,%esp
c0101c8a:	68 00 80 00 00       	push   $0x8000
c0101c8f:	e8 d8 fc ff ff       	call   c010196c <sys_malloc>
c0101c94:	83 c4 10             	add    $0x10,%esp
c0101c97:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c0101c9c:	83 ec 0c             	sub    $0xc,%esp
c0101c9f:	6a 24                	push   $0x24
c0101ca1:	e8 c6 fc ff ff       	call   c010196c <sys_malloc>
c0101ca6:	83 c4 10             	add    $0x10,%esp
c0101ca9:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c0101cae:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101cb3:	83 ec 0c             	sub    $0xc,%esp
c0101cb6:	50                   	push   %eax
c0101cb7:	e8 42 46 00 00       	call   c01062fe <get_physical_address>
c0101cbc:	83 c4 10             	add    $0x10,%esp
c0101cbf:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101cc4:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101cc9:	83 ec 0c             	sub    $0xc,%esp
c0101ccc:	50                   	push   %eax
c0101ccd:	e8 2c 46 00 00       	call   c01062fe <get_physical_address>
c0101cd2:	83 c4 10             	add    $0x10,%esp
c0101cd5:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c0101cda:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101cdf:	83 ec 04             	sub    $0x4,%esp
c0101ce2:	68 00 02 00 00       	push   $0x200
c0101ce7:	6a 00                	push   $0x0
c0101ce9:	50                   	push   %eax
c0101cea:	e8 60 a5 00 00       	call   c010c24f <Memset>
c0101cef:	83 c4 10             	add    $0x10,%esp
c0101cf2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101cf7:	83 ec 0c             	sub    $0xc,%esp
c0101cfa:	6a 0a                	push   $0xa
c0101cfc:	68 00 02 00 00       	push   $0x200
c0101d01:	50                   	push   %eax
c0101d02:	6a 20                	push   $0x20
c0101d04:	6a 00                	push   $0x0
c0101d06:	e8 99 fe ff ff       	call   c0101ba4 <rd_wt>
c0101d0b:	83 c4 20             	add    $0x20,%esp
c0101d0e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d13:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101d16:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101d19:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101d20:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101d23:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0101d2a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101d2d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101d34:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101d37:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101d3e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101d41:	8b 40 04             	mov    0x4(%eax),%eax
c0101d44:	8d 50 02             	lea    0x2(%eax),%edx
c0101d47:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101d4a:	8b 40 08             	mov    0x8(%eax),%eax
c0101d4d:	01 c2                	add    %eax,%edx
c0101d4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101d52:	8b 40 0c             	mov    0xc(%eax),%eax
c0101d55:	01 c2                	add    %eax,%edx
c0101d57:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101d5a:	89 10                	mov    %edx,(%eax)
c0101d5c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101d63:	b8 00 02 00 00       	mov    $0x200,%eax
c0101d68:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101d6b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101d71:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101d74:	01 ca                	add    %ecx,%edx
c0101d76:	83 ec 04             	sub    $0x4,%esp
c0101d79:	50                   	push   %eax
c0101d7a:	6a 80                	push   $0xffffff80
c0101d7c:	52                   	push   %edx
c0101d7d:	e8 cd a4 00 00       	call   c010c24f <Memset>
c0101d82:	83 c4 10             	add    $0x10,%esp
c0101d85:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d8a:	83 ec 0c             	sub    $0xc,%esp
c0101d8d:	6a 0a                	push   $0xa
c0101d8f:	68 00 02 00 00       	push   $0x200
c0101d94:	50                   	push   %eax
c0101d95:	6a 20                	push   $0x20
c0101d97:	6a 01                	push   $0x1
c0101d99:	e8 06 fe ff ff       	call   c0101ba4 <rd_wt>
c0101d9e:	83 c4 20             	add    $0x20,%esp
c0101da1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101da4:	8b 10                	mov    (%eax),%edx
c0101da6:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101da9:	8b 50 04             	mov    0x4(%eax),%edx
c0101dac:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101daf:	8b 50 08             	mov    0x8(%eax),%edx
c0101db2:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101db5:	8b 50 0c             	mov    0xc(%eax),%edx
c0101db8:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101dbb:	8b 50 10             	mov    0x10(%eax),%edx
c0101dbe:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101dc1:	8b 50 14             	mov    0x14(%eax),%edx
c0101dc4:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101dc7:	8b 50 18             	mov    0x18(%eax),%edx
c0101dca:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101dcd:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101dd0:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101dd3:	8b 40 20             	mov    0x20(%eax),%eax
c0101dd6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101dd9:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101ddd:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101de1:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101de6:	83 ec 04             	sub    $0x4,%esp
c0101de9:	6a 01                	push   $0x1
c0101deb:	52                   	push   %edx
c0101dec:	50                   	push   %eax
c0101ded:	e8 5d a4 00 00       	call   c010c24f <Memset>
c0101df2:	83 c4 10             	add    $0x10,%esp
c0101df5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101dfa:	83 c0 01             	add    $0x1,%eax
c0101dfd:	83 ec 04             	sub    $0x4,%esp
c0101e00:	68 ff 01 00 00       	push   $0x1ff
c0101e05:	6a 80                	push   $0xffffff80
c0101e07:	50                   	push   %eax
c0101e08:	e8 42 a4 00 00       	call   c010c24f <Memset>
c0101e0d:	83 c4 10             	add    $0x10,%esp
c0101e10:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e15:	83 ec 0c             	sub    $0xc,%esp
c0101e18:	6a 0a                	push   $0xa
c0101e1a:	68 00 02 00 00       	push   $0x200
c0101e1f:	50                   	push   %eax
c0101e20:	6a 20                	push   $0x20
c0101e22:	6a 02                	push   $0x2
c0101e24:	e8 7b fd ff ff       	call   c0101ba4 <rd_wt>
c0101e29:	83 c4 20             	add    $0x20,%esp
c0101e2c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101e33:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101e38:	83 ec 04             	sub    $0x4,%esp
c0101e3b:	68 00 02 00 00       	push   $0x200
c0101e40:	6a ff                	push   $0xffffffff
c0101e42:	50                   	push   %eax
c0101e43:	e8 07 a4 00 00       	call   c010c24f <Memset>
c0101e48:	83 c4 10             	add    $0x10,%esp
c0101e4b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e50:	83 ec 0c             	sub    $0xc,%esp
c0101e53:	6a 0a                	push   $0xa
c0101e55:	68 00 02 00 00       	push   $0x200
c0101e5a:	50                   	push   %eax
c0101e5b:	6a 20                	push   $0x20
c0101e5d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101e60:	e8 3f fd ff ff       	call   c0101ba4 <rd_wt>
c0101e65:	83 c4 20             	add    $0x20,%esp
c0101e68:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101e6d:	83 ec 04             	sub    $0x4,%esp
c0101e70:	6a 01                	push   $0x1
c0101e72:	6a 01                	push   $0x1
c0101e74:	50                   	push   %eax
c0101e75:	e8 d5 a3 00 00       	call   c010c24f <Memset>
c0101e7a:	83 c4 10             	add    $0x10,%esp
c0101e7d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101e82:	83 c0 01             	add    $0x1,%eax
c0101e85:	83 ec 04             	sub    $0x4,%esp
c0101e88:	68 ff 01 00 00       	push   $0x1ff
c0101e8d:	6a 00                	push   $0x0
c0101e8f:	50                   	push   %eax
c0101e90:	e8 ba a3 00 00       	call   c010c24f <Memset>
c0101e95:	83 c4 10             	add    $0x10,%esp
c0101e98:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e9d:	89 c2                	mov    %eax,%edx
c0101e9f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101ea2:	83 c0 01             	add    $0x1,%eax
c0101ea5:	83 ec 0c             	sub    $0xc,%esp
c0101ea8:	6a 0a                	push   $0xa
c0101eaa:	68 00 02 00 00       	push   $0x200
c0101eaf:	52                   	push   %edx
c0101eb0:	6a 20                	push   $0x20
c0101eb2:	50                   	push   %eax
c0101eb3:	e8 ec fc ff ff       	call   c0101ba4 <rd_wt>
c0101eb8:	83 c4 20             	add    $0x20,%esp
c0101ebb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101ebe:	83 e8 02             	sub    $0x2,%eax
c0101ec1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101ec4:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101ecb:	eb 04                	jmp    c0101ed1 <mkfs+0x254>
c0101ecd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101ed1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101ed4:	83 c0 01             	add    $0x1,%eax
c0101ed7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101eda:	7e f1                	jle    c0101ecd <mkfs+0x250>
c0101edc:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101ee1:	89 c2                	mov    %eax,%edx
c0101ee3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101ee6:	83 c0 03             	add    $0x3,%eax
c0101ee9:	83 ec 0c             	sub    $0xc,%esp
c0101eec:	6a 0a                	push   $0xa
c0101eee:	68 00 02 00 00       	push   $0x200
c0101ef3:	52                   	push   %edx
c0101ef4:	6a 20                	push   $0x20
c0101ef6:	50                   	push   %eax
c0101ef7:	e8 a8 fc ff ff       	call   c0101ba4 <rd_wt>
c0101efc:	83 c4 20             	add    $0x20,%esp
c0101eff:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101f04:	89 c2                	mov    %eax,%edx
c0101f06:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101f09:	83 c0 03             	add    $0x3,%eax
c0101f0c:	83 ec 0c             	sub    $0xc,%esp
c0101f0f:	6a 07                	push   $0x7
c0101f11:	68 00 02 00 00       	push   $0x200
c0101f16:	52                   	push   %edx
c0101f17:	6a 20                	push   $0x20
c0101f19:	50                   	push   %eax
c0101f1a:	e8 85 fc ff ff       	call   c0101ba4 <rd_wt>
c0101f1f:	83 c4 20             	add    $0x20,%esp
c0101f22:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101f27:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101f2a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f2d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101f33:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f36:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101f3d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101f40:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f43:	89 50 08             	mov    %edx,0x8(%eax)
c0101f46:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f49:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101f50:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f53:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101f5a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f5d:	8b 10                	mov    (%eax),%edx
c0101f5f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101f65:	8b 50 04             	mov    0x4(%eax),%edx
c0101f68:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101f6e:	8b 50 08             	mov    0x8(%eax),%edx
c0101f71:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101f77:	8b 50 0c             	mov    0xc(%eax),%edx
c0101f7a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101f80:	8b 50 10             	mov    0x10(%eax),%edx
c0101f83:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101f89:	8b 50 14             	mov    0x14(%eax),%edx
c0101f8c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101f92:	8b 50 18             	mov    0x18(%eax),%edx
c0101f95:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101f9b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101f9e:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101fa4:	8b 50 20             	mov    0x20(%eax),%edx
c0101fa7:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101fad:	8b 40 24             	mov    0x24(%eax),%eax
c0101fb0:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101fb5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101fbc:	eb 4c                	jmp    c010200a <mkfs+0x38d>
c0101fbe:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101fc3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101fc6:	83 c2 01             	add    $0x1,%edx
c0101fc9:	c1 e2 05             	shl    $0x5,%edx
c0101fcc:	01 d0                	add    %edx,%eax
c0101fce:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101fd1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101fd4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101fda:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101fdd:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101fe4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101fe7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101fee:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101ff5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101ff8:	c1 e0 08             	shl    $0x8,%eax
c0101ffb:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101ffe:	89 c2                	mov    %eax,%edx
c0102000:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102003:	89 50 08             	mov    %edx,0x8(%eax)
c0102006:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010200a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c010200e:	7e ae                	jle    c0101fbe <mkfs+0x341>
c0102010:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0102017:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c010201d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102022:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0102027:	89 d7                	mov    %edx,%edi
c0102029:	f3 ab                	rep stos %eax,%es:(%edi)
c010202b:	c7 85 70 ff ff ff 3c 	movl   $0xc010b43c,-0x90(%ebp)
c0102032:	b4 10 c0 
c0102035:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010203c:	eb 54                	jmp    c0102092 <mkfs+0x415>
c010203e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102043:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102046:	83 c2 04             	add    $0x4,%edx
c0102049:	c1 e2 05             	shl    $0x5,%edx
c010204c:	01 d0                	add    %edx,%eax
c010204e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102051:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102054:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010205a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010205d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0102064:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102067:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010206a:	83 c2 01             	add    $0x1,%edx
c010206d:	c1 e2 0b             	shl    $0xb,%edx
c0102070:	01 c2                	add    %eax,%edx
c0102072:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102075:	89 50 08             	mov    %edx,0x8(%eax)
c0102078:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010207b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0102082:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102085:	8d 50 05             	lea    0x5(%eax),%edx
c0102088:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010208b:	89 50 10             	mov    %edx,0x10(%eax)
c010208e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102092:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102095:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0102098:	7c a4                	jl     c010203e <mkfs+0x3c1>
c010209a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010209f:	89 c2                	mov    %eax,%edx
c01020a1:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01020a4:	83 c0 03             	add    $0x3,%eax
c01020a7:	83 ec 0c             	sub    $0xc,%esp
c01020aa:	6a 0a                	push   $0xa
c01020ac:	68 00 02 00 00       	push   $0x200
c01020b1:	52                   	push   %edx
c01020b2:	6a 20                	push   $0x20
c01020b4:	50                   	push   %eax
c01020b5:	e8 ea fa ff ff       	call   c0101ba4 <rd_wt>
c01020ba:	83 c4 20             	add    $0x20,%esp
c01020bd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01020c2:	89 c2                	mov    %eax,%edx
c01020c4:	8b 45 98             	mov    -0x68(%ebp),%eax
c01020c7:	83 ec 0c             	sub    $0xc,%esp
c01020ca:	6a 07                	push   $0x7
c01020cc:	68 00 02 00 00       	push   $0x200
c01020d1:	52                   	push   %edx
c01020d2:	6a 20                	push   $0x20
c01020d4:	50                   	push   %eax
c01020d5:	e8 ca fa ff ff       	call   c0101ba4 <rd_wt>
c01020da:	83 c4 20             	add    $0x20,%esp
c01020dd:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c01020e4:	00 00 00 
c01020e7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c01020ee:	2e 00 
c01020f0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01020f5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01020f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01020fb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0102101:	83 ec 0c             	sub    $0xc,%esp
c0102104:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c010210a:	50                   	push   %eax
c010210b:	e8 78 a1 00 00       	call   c010c288 <Strlen>
c0102110:	83 c4 10             	add    $0x10,%esp
c0102113:	89 c1                	mov    %eax,%ecx
c0102115:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102118:	8d 50 04             	lea    0x4(%eax),%edx
c010211b:	83 ec 04             	sub    $0x4,%esp
c010211e:	51                   	push   %ecx
c010211f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0102125:	50                   	push   %eax
c0102126:	52                   	push   %edx
c0102127:	e8 f0 4e 00 00       	call   c010701c <Memcpy>
c010212c:	83 c4 10             	add    $0x10,%esp
c010212f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0102135:	b8 00 00 00 00       	mov    $0x0,%eax
c010213a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c010213f:	89 d7                	mov    %edx,%edi
c0102141:	f3 ab                	rep stos %eax,%es:(%edi)
c0102143:	c7 85 34 ff ff ff 48 	movl   $0xc010b448,-0xcc(%ebp)
c010214a:	b4 10 c0 
c010214d:	c7 85 38 ff ff ff 51 	movl   $0xc010b451,-0xc8(%ebp)
c0102154:	b4 10 c0 
c0102157:	c7 85 3c ff ff ff 5a 	movl   $0xc010b45a,-0xc4(%ebp)
c010215e:	b4 10 c0 
c0102161:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0102168:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010216f:	eb 49                	jmp    c01021ba <mkfs+0x53d>
c0102171:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0102175:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102178:	8d 50 02             	lea    0x2(%eax),%edx
c010217b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010217e:	89 10                	mov    %edx,(%eax)
c0102180:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102183:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c010218a:	83 ec 0c             	sub    $0xc,%esp
c010218d:	50                   	push   %eax
c010218e:	e8 f5 a0 00 00       	call   c010c288 <Strlen>
c0102193:	83 c4 10             	add    $0x10,%esp
c0102196:	89 c1                	mov    %eax,%ecx
c0102198:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010219b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c01021a2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01021a5:	83 c2 04             	add    $0x4,%edx
c01021a8:	83 ec 04             	sub    $0x4,%esp
c01021ab:	51                   	push   %ecx
c01021ac:	50                   	push   %eax
c01021ad:	52                   	push   %edx
c01021ae:	e8 69 4e 00 00       	call   c010701c <Memcpy>
c01021b3:	83 c4 10             	add    $0x10,%esp
c01021b6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01021ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01021bd:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c01021c0:	7c af                	jl     c0102171 <mkfs+0x4f4>
c01021c2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01021c9:	eb 66                	jmp    c0102231 <mkfs+0x5b4>
c01021cb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01021ce:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c01021d5:	83 ec 0c             	sub    $0xc,%esp
c01021d8:	50                   	push   %eax
c01021d9:	e8 aa a0 00 00       	call   c010c288 <Strlen>
c01021de:	83 c4 10             	add    $0x10,%esp
c01021e1:	85 c0                	test   %eax,%eax
c01021e3:	74 47                	je     c010222c <mkfs+0x5af>
c01021e5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c01021e9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01021ec:	8d 50 05             	lea    0x5(%eax),%edx
c01021ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021f2:	89 10                	mov    %edx,(%eax)
c01021f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01021f7:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c01021fe:	83 ec 0c             	sub    $0xc,%esp
c0102201:	50                   	push   %eax
c0102202:	e8 81 a0 00 00       	call   c010c288 <Strlen>
c0102207:	83 c4 10             	add    $0x10,%esp
c010220a:	89 c1                	mov    %eax,%ecx
c010220c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010220f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0102216:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102219:	83 c2 04             	add    $0x4,%edx
c010221c:	83 ec 04             	sub    $0x4,%esp
c010221f:	51                   	push   %ecx
c0102220:	50                   	push   %eax
c0102221:	52                   	push   %edx
c0102222:	e8 f5 4d 00 00       	call   c010701c <Memcpy>
c0102227:	83 c4 10             	add    $0x10,%esp
c010222a:	eb 01                	jmp    c010222d <mkfs+0x5b0>
c010222c:	90                   	nop
c010222d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0102231:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102234:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0102237:	7c 92                	jl     c01021cb <mkfs+0x54e>
c0102239:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010223e:	89 c2                	mov    %eax,%edx
c0102240:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102243:	83 ec 0c             	sub    $0xc,%esp
c0102246:	6a 0a                	push   $0xa
c0102248:	68 00 02 00 00       	push   $0x200
c010224d:	52                   	push   %edx
c010224e:	6a 20                	push   $0x20
c0102250:	50                   	push   %eax
c0102251:	e8 4e f9 ff ff       	call   c0101ba4 <rd_wt>
c0102256:	83 c4 20             	add    $0x20,%esp
c0102259:	90                   	nop
c010225a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c010225d:	c9                   	leave  
c010225e:	c3                   	ret    

c010225f <init_fs>:
c010225f:	55                   	push   %ebp
c0102260:	89 e5                	mov    %esp,%ebp
c0102262:	83 ec 18             	sub    $0x18,%esp
c0102265:	83 ec 0c             	sub    $0xc,%esp
c0102268:	6a 7c                	push   $0x7c
c010226a:	e8 fd f6 ff ff       	call   c010196c <sys_malloc>
c010226f:	83 c4 10             	add    $0x10,%esp
c0102272:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102275:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102278:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c010227f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102282:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0102289:	83 ec 04             	sub    $0x4,%esp
c010228c:	6a 03                	push   $0x3
c010228e:	ff 75 f4             	pushl  -0xc(%ebp)
c0102291:	6a 03                	push   $0x3
c0102293:	e8 0d 76 00 00       	call   c01098a5 <send_rec>
c0102298:	83 c4 10             	add    $0x10,%esp
c010229b:	e8 dd f9 ff ff       	call   c0101c7d <mkfs>
c01022a0:	83 ec 08             	sub    $0x8,%esp
c01022a3:	6a 7c                	push   $0x7c
c01022a5:	ff 75 f4             	pushl  -0xc(%ebp)
c01022a8:	e8 d4 f6 ff ff       	call   c0101981 <sys_free>
c01022ad:	83 c4 10             	add    $0x10,%esp
c01022b0:	90                   	nop
c01022b1:	c9                   	leave  
c01022b2:	c3                   	ret    

c01022b3 <do_open>:
c01022b3:	55                   	push   %ebp
c01022b4:	89 e5                	mov    %esp,%ebp
c01022b6:	83 ec 68             	sub    $0x68,%esp
c01022b9:	83 ec 04             	sub    $0x4,%esp
c01022bc:	6a 0c                	push   $0xc
c01022be:	6a 00                	push   $0x0
c01022c0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01022c3:	50                   	push   %eax
c01022c4:	e8 86 9f 00 00       	call   c010c24f <Memset>
c01022c9:	83 c4 10             	add    $0x10,%esp
c01022cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01022cf:	8b 40 44             	mov    0x44(%eax),%eax
c01022d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01022d5:	83 ec 08             	sub    $0x8,%esp
c01022d8:	6a 0c                	push   $0xc
c01022da:	ff 75 e4             	pushl  -0x1c(%ebp)
c01022dd:	e8 cd 3e 00 00       	call   c01061af <alloc_virtual_memory>
c01022e2:	83 c4 10             	add    $0x10,%esp
c01022e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01022e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01022eb:	8b 40 40             	mov    0x40(%eax),%eax
c01022ee:	89 c2                	mov    %eax,%edx
c01022f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01022f3:	83 ec 04             	sub    $0x4,%esp
c01022f6:	52                   	push   %edx
c01022f7:	50                   	push   %eax
c01022f8:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01022fb:	50                   	push   %eax
c01022fc:	e8 1b 4d 00 00       	call   c010701c <Memcpy>
c0102301:	83 c4 10             	add    $0x10,%esp
c0102304:	8b 45 08             	mov    0x8(%ebp),%eax
c0102307:	8b 40 40             	mov    0x40(%eax),%eax
c010230a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c010230f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102312:	8b 40 74             	mov    0x74(%eax),%eax
c0102315:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102318:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c010231f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102326:	eb 1f                	jmp    c0102347 <do_open+0x94>
c0102328:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010232d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102330:	83 c2 4c             	add    $0x4c,%edx
c0102333:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0102337:	85 c0                	test   %eax,%eax
c0102339:	75 08                	jne    c0102343 <do_open+0x90>
c010233b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010233e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102341:	eb 0a                	jmp    c010234d <do_open+0x9a>
c0102343:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102347:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c010234b:	7e db                	jle    c0102328 <do_open+0x75>
c010234d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0102351:	75 1c                	jne    c010236f <do_open+0xbc>
c0102353:	68 c6 01 00 00       	push   $0x1c6
c0102358:	68 70 b3 10 c0       	push   $0xc010b370
c010235d:	68 70 b3 10 c0       	push   $0xc010b370
c0102362:	68 63 b4 10 c0       	push   $0xc010b463
c0102367:	e8 c9 68 00 00       	call   c0108c35 <assertion_failure>
c010236c:	83 c4 10             	add    $0x10,%esp
c010236f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0102376:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010237d:	eb 1d                	jmp    c010239c <do_open+0xe9>
c010237f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102382:	c1 e0 04             	shl    $0x4,%eax
c0102385:	05 88 13 11 c0       	add    $0xc0111388,%eax
c010238a:	8b 00                	mov    (%eax),%eax
c010238c:	85 c0                	test   %eax,%eax
c010238e:	75 08                	jne    c0102398 <do_open+0xe5>
c0102390:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102393:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102396:	eb 0a                	jmp    c01023a2 <do_open+0xef>
c0102398:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010239c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c01023a0:	7e dd                	jle    c010237f <do_open+0xcc>
c01023a2:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c01023a6:	75 1c                	jne    c01023c4 <do_open+0x111>
c01023a8:	68 d2 01 00 00       	push   $0x1d2
c01023ad:	68 70 b3 10 c0       	push   $0xc010b370
c01023b2:	68 70 b3 10 c0       	push   $0xc010b370
c01023b7:	68 6b b4 10 c0       	push   $0xc010b46b
c01023bc:	e8 74 68 00 00       	call   c0108c35 <assertion_failure>
c01023c1:	83 c4 10             	add    $0x10,%esp
c01023c4:	83 ec 0c             	sub    $0xc,%esp
c01023c7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01023ca:	50                   	push   %eax
c01023cb:	e8 d2 00 00 00       	call   c01024a2 <search_file>
c01023d0:	83 c4 10             	add    $0x10,%esp
c01023d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01023d6:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01023da:	75 2b                	jne    c0102407 <do_open+0x154>
c01023dc:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c01023e0:	7e 10                	jle    c01023f2 <do_open+0x13f>
c01023e2:	83 ec 0c             	sub    $0xc,%esp
c01023e5:	68 73 b4 10 c0       	push   $0xc010b473
c01023ea:	e8 28 68 00 00       	call   c0108c17 <panic>
c01023ef:	83 c4 10             	add    $0x10,%esp
c01023f2:	83 ec 08             	sub    $0x8,%esp
c01023f5:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01023f8:	50                   	push   %eax
c01023f9:	8d 45 9c             	lea    -0x64(%ebp),%eax
c01023fc:	50                   	push   %eax
c01023fd:	e8 60 04 00 00       	call   c0102862 <create_file>
c0102402:	83 c4 10             	add    $0x10,%esp
c0102405:	eb 25                	jmp    c010242c <do_open+0x179>
c0102407:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010240b:	75 0a                	jne    c0102417 <do_open+0x164>
c010240d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102412:	e9 89 00 00 00       	jmp    c01024a0 <do_open+0x1ed>
c0102417:	83 ec 08             	sub    $0x8,%esp
c010241a:	ff 75 d8             	pushl  -0x28(%ebp)
c010241d:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0102420:	50                   	push   %eax
c0102421:	e8 7a 02 00 00       	call   c01026a0 <get_inode>
c0102426:	83 c4 10             	add    $0x10,%esp
c0102429:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010242c:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0102431:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102434:	c1 e2 04             	shl    $0x4,%edx
c0102437:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010243d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102440:	83 c2 4c             	add    $0x4c,%edx
c0102443:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102447:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010244a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010244d:	c1 e2 04             	shl    $0x4,%edx
c0102450:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102456:	89 02                	mov    %eax,(%edx)
c0102458:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010245b:	c1 e0 04             	shl    $0x4,%eax
c010245e:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102463:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102469:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010246c:	c1 e0 04             	shl    $0x4,%eax
c010246f:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102474:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010247a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010247d:	c1 e0 04             	shl    $0x4,%eax
c0102480:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102485:	8b 00                	mov    (%eax),%eax
c0102487:	8d 50 01             	lea    0x1(%eax),%edx
c010248a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010248d:	c1 e0 04             	shl    $0x4,%eax
c0102490:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102495:	89 10                	mov    %edx,(%eax)
c0102497:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010249a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010249d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01024a0:	c9                   	leave  
c01024a1:	c3                   	ret    

c01024a2 <search_file>:
c01024a2:	55                   	push   %ebp
c01024a3:	89 e5                	mov    %esp,%ebp
c01024a5:	83 ec 68             	sub    $0x68,%esp
c01024a8:	83 ec 04             	sub    $0x4,%esp
c01024ab:	6a 0c                	push   $0xc
c01024ad:	6a 00                	push   $0x0
c01024af:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01024b2:	50                   	push   %eax
c01024b3:	e8 97 9d 00 00       	call   c010c24f <Memset>
c01024b8:	83 c4 10             	add    $0x10,%esp
c01024bb:	83 ec 04             	sub    $0x4,%esp
c01024be:	6a 28                	push   $0x28
c01024c0:	6a 00                	push   $0x0
c01024c2:	8d 45 98             	lea    -0x68(%ebp),%eax
c01024c5:	50                   	push   %eax
c01024c6:	e8 84 9d 00 00       	call   c010c24f <Memset>
c01024cb:	83 c4 10             	add    $0x10,%esp
c01024ce:	83 ec 04             	sub    $0x4,%esp
c01024d1:	8d 45 98             	lea    -0x68(%ebp),%eax
c01024d4:	50                   	push   %eax
c01024d5:	ff 75 08             	pushl  0x8(%ebp)
c01024d8:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01024db:	50                   	push   %eax
c01024dc:	e8 f3 00 00 00       	call   c01025d4 <strip_path>
c01024e1:	83 c4 10             	add    $0x10,%esp
c01024e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01024e7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c01024eb:	75 0a                	jne    c01024f7 <search_file+0x55>
c01024ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01024f2:	e9 db 00 00 00       	jmp    c01025d2 <search_file+0x130>
c01024f7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01024fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01024fd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102500:	05 00 02 00 00       	add    $0x200,%eax
c0102505:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010250b:	85 c0                	test   %eax,%eax
c010250d:	0f 48 c2             	cmovs  %edx,%eax
c0102510:	c1 f8 09             	sar    $0x9,%eax
c0102513:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102516:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102519:	c1 e8 04             	shr    $0x4,%eax
c010251c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010251f:	e8 5c 14 00 00       	call   c0103980 <get_super_block>
c0102524:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102527:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010252a:	8b 00                	mov    (%eax),%eax
c010252c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010252f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102536:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010253d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102544:	eb 7b                	jmp    c01025c1 <search_file+0x11f>
c0102546:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010254b:	89 c1                	mov    %eax,%ecx
c010254d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102550:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102553:	01 d0                	add    %edx,%eax
c0102555:	83 ec 0c             	sub    $0xc,%esp
c0102558:	6a 07                	push   $0x7
c010255a:	68 00 02 00 00       	push   $0x200
c010255f:	51                   	push   %ecx
c0102560:	ff 75 cc             	pushl  -0x34(%ebp)
c0102563:	50                   	push   %eax
c0102564:	e8 3b f6 ff ff       	call   c0101ba4 <rd_wt>
c0102569:	83 c4 20             	add    $0x20,%esp
c010256c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102571:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102574:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010257b:	eb 35                	jmp    c01025b2 <search_file+0x110>
c010257d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102581:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102584:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102587:	7f 33                	jg     c01025bc <search_file+0x11a>
c0102589:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010258c:	83 c0 04             	add    $0x4,%eax
c010258f:	83 ec 08             	sub    $0x8,%esp
c0102592:	50                   	push   %eax
c0102593:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102596:	50                   	push   %eax
c0102597:	e8 70 76 00 00       	call   c0109c0c <strcmp>
c010259c:	83 c4 10             	add    $0x10,%esp
c010259f:	85 c0                	test   %eax,%eax
c01025a1:	75 07                	jne    c01025aa <search_file+0x108>
c01025a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01025a6:	8b 00                	mov    (%eax),%eax
c01025a8:	eb 28                	jmp    c01025d2 <search_file+0x130>
c01025aa:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01025ae:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c01025b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01025b5:	83 f8 1f             	cmp    $0x1f,%eax
c01025b8:	76 c3                	jbe    c010257d <search_file+0xdb>
c01025ba:	eb 01                	jmp    c01025bd <search_file+0x11b>
c01025bc:	90                   	nop
c01025bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01025c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025c4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c01025c7:	0f 8c 79 ff ff ff    	jl     c0102546 <search_file+0xa4>
c01025cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01025d2:	c9                   	leave  
c01025d3:	c3                   	ret    

c01025d4 <strip_path>:
c01025d4:	55                   	push   %ebp
c01025d5:	89 e5                	mov    %esp,%ebp
c01025d7:	83 ec 10             	sub    $0x10,%esp
c01025da:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01025de:	75 0a                	jne    c01025ea <strip_path+0x16>
c01025e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01025e5:	e9 b4 00 00 00       	jmp    c010269e <strip_path+0xca>
c01025ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01025f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025f3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01025f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01025f9:	0f b6 00             	movzbl (%eax),%eax
c01025fc:	3c 2f                	cmp    $0x2f,%al
c01025fe:	75 2d                	jne    c010262d <strip_path+0x59>
c0102600:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102604:	eb 27                	jmp    c010262d <strip_path+0x59>
c0102606:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102609:	0f b6 00             	movzbl (%eax),%eax
c010260c:	3c 2f                	cmp    $0x2f,%al
c010260e:	75 0a                	jne    c010261a <strip_path+0x46>
c0102610:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102615:	e9 84 00 00 00       	jmp    c010269e <strip_path+0xca>
c010261a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010261d:	0f b6 10             	movzbl (%eax),%edx
c0102620:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102623:	88 10                	mov    %dl,(%eax)
c0102625:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102629:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010262d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102630:	0f b6 00             	movzbl (%eax),%eax
c0102633:	84 c0                	test   %al,%al
c0102635:	75 cf                	jne    c0102606 <strip_path+0x32>
c0102637:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010263a:	c6 00 00             	movb   $0x0,(%eax)
c010263d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102640:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102646:	89 10                	mov    %edx,(%eax)
c0102648:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010264e:	89 50 04             	mov    %edx,0x4(%eax)
c0102651:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102657:	89 50 08             	mov    %edx,0x8(%eax)
c010265a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102660:	89 50 0c             	mov    %edx,0xc(%eax)
c0102663:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102669:	89 50 10             	mov    %edx,0x10(%eax)
c010266c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102672:	89 50 14             	mov    %edx,0x14(%eax)
c0102675:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010267b:	89 50 18             	mov    %edx,0x18(%eax)
c010267e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102684:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102687:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010268d:	89 50 20             	mov    %edx,0x20(%eax)
c0102690:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102696:	89 50 24             	mov    %edx,0x24(%eax)
c0102699:	b8 00 00 00 00       	mov    $0x0,%eax
c010269e:	c9                   	leave  
c010269f:	c3                   	ret    

c01026a0 <get_inode>:
c01026a0:	55                   	push   %ebp
c01026a1:	89 e5                	mov    %esp,%ebp
c01026a3:	56                   	push   %esi
c01026a4:	53                   	push   %ebx
c01026a5:	83 ec 20             	sub    $0x20,%esp
c01026a8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01026ac:	75 0a                	jne    c01026b8 <get_inode+0x18>
c01026ae:	b8 00 00 00 00       	mov    $0x0,%eax
c01026b3:	e9 a3 01 00 00       	jmp    c010285b <get_inode+0x1bb>
c01026b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01026bf:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c01026c6:	eb 69                	jmp    c0102731 <get_inode+0x91>
c01026c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026cb:	8b 40 24             	mov    0x24(%eax),%eax
c01026ce:	85 c0                	test   %eax,%eax
c01026d0:	7e 53                	jle    c0102725 <get_inode+0x85>
c01026d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026d5:	8b 40 10             	mov    0x10(%eax),%eax
c01026d8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01026db:	75 50                	jne    c010272d <get_inode+0x8d>
c01026dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01026e0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01026e3:	8b 0a                	mov    (%edx),%ecx
c01026e5:	89 08                	mov    %ecx,(%eax)
c01026e7:	8b 4a 04             	mov    0x4(%edx),%ecx
c01026ea:	89 48 04             	mov    %ecx,0x4(%eax)
c01026ed:	8b 4a 08             	mov    0x8(%edx),%ecx
c01026f0:	89 48 08             	mov    %ecx,0x8(%eax)
c01026f3:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01026f6:	89 48 0c             	mov    %ecx,0xc(%eax)
c01026f9:	8b 4a 10             	mov    0x10(%edx),%ecx
c01026fc:	89 48 10             	mov    %ecx,0x10(%eax)
c01026ff:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102702:	89 48 14             	mov    %ecx,0x14(%eax)
c0102705:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102708:	89 48 18             	mov    %ecx,0x18(%eax)
c010270b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010270e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102711:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102714:	89 48 20             	mov    %ecx,0x20(%eax)
c0102717:	8b 52 24             	mov    0x24(%edx),%edx
c010271a:	89 50 24             	mov    %edx,0x24(%eax)
c010271d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102720:	e9 36 01 00 00       	jmp    c010285b <get_inode+0x1bb>
c0102725:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102728:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010272b:	eb 0d                	jmp    c010273a <get_inode+0x9a>
c010272d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102731:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102738:	76 8e                	jbe    c01026c8 <get_inode+0x28>
c010273a:	e8 41 12 00 00       	call   c0103980 <get_super_block>
c010273f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102742:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102749:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010274c:	8b 40 04             	mov    0x4(%eax),%eax
c010274f:	8d 50 02             	lea    0x2(%eax),%edx
c0102752:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102755:	8b 40 08             	mov    0x8(%eax),%eax
c0102758:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010275b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010275e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102761:	b8 00 02 00 00       	mov    $0x200,%eax
c0102766:	99                   	cltd   
c0102767:	f7 7d e8             	idivl  -0x18(%ebp)
c010276a:	89 c6                	mov    %eax,%esi
c010276c:	89 c8                	mov    %ecx,%eax
c010276e:	99                   	cltd   
c010276f:	f7 fe                	idiv   %esi
c0102771:	01 d8                	add    %ebx,%eax
c0102773:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102776:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010277d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102782:	83 ec 0c             	sub    $0xc,%esp
c0102785:	6a 07                	push   $0x7
c0102787:	68 00 02 00 00       	push   $0x200
c010278c:	50                   	push   %eax
c010278d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102790:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102793:	e8 0c f4 ff ff       	call   c0101ba4 <rd_wt>
c0102798:	83 c4 20             	add    $0x20,%esp
c010279b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010279e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01027a1:	b8 00 02 00 00       	mov    $0x200,%eax
c01027a6:	99                   	cltd   
c01027a7:	f7 7d e8             	idivl  -0x18(%ebp)
c01027aa:	89 c3                	mov    %eax,%ebx
c01027ac:	89 c8                	mov    %ecx,%eax
c01027ae:	99                   	cltd   
c01027af:	f7 fb                	idiv   %ebx
c01027b1:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01027b4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01027ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01027bd:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c01027c1:	01 d0                	add    %edx,%eax
c01027c3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01027c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027c9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01027cc:	8b 0a                	mov    (%edx),%ecx
c01027ce:	89 08                	mov    %ecx,(%eax)
c01027d0:	8b 4a 04             	mov    0x4(%edx),%ecx
c01027d3:	89 48 04             	mov    %ecx,0x4(%eax)
c01027d6:	8b 4a 08             	mov    0x8(%edx),%ecx
c01027d9:	89 48 08             	mov    %ecx,0x8(%eax)
c01027dc:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01027df:	89 48 0c             	mov    %ecx,0xc(%eax)
c01027e2:	8b 4a 10             	mov    0x10(%edx),%ecx
c01027e5:	89 48 10             	mov    %ecx,0x10(%eax)
c01027e8:	8b 4a 14             	mov    0x14(%edx),%ecx
c01027eb:	89 48 14             	mov    %ecx,0x14(%eax)
c01027ee:	8b 4a 18             	mov    0x18(%edx),%ecx
c01027f1:	89 48 18             	mov    %ecx,0x18(%eax)
c01027f4:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01027f7:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01027fa:	8b 4a 20             	mov    0x20(%edx),%ecx
c01027fd:	89 48 20             	mov    %ecx,0x20(%eax)
c0102800:	8b 52 24             	mov    0x24(%edx),%edx
c0102803:	89 50 24             	mov    %edx,0x24(%eax)
c0102806:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102809:	8b 55 0c             	mov    0xc(%ebp),%edx
c010280c:	89 50 10             	mov    %edx,0x10(%eax)
c010280f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102812:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102815:	89 50 20             	mov    %edx,0x20(%eax)
c0102818:	8b 45 08             	mov    0x8(%ebp),%eax
c010281b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010281e:	8b 0a                	mov    (%edx),%ecx
c0102820:	89 08                	mov    %ecx,(%eax)
c0102822:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102825:	89 48 04             	mov    %ecx,0x4(%eax)
c0102828:	8b 4a 08             	mov    0x8(%edx),%ecx
c010282b:	89 48 08             	mov    %ecx,0x8(%eax)
c010282e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102831:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102834:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102837:	89 48 10             	mov    %ecx,0x10(%eax)
c010283a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010283d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102840:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102843:	89 48 18             	mov    %ecx,0x18(%eax)
c0102846:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102849:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010284c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010284f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102852:	8b 52 24             	mov    0x24(%edx),%edx
c0102855:	89 50 24             	mov    %edx,0x24(%eax)
c0102858:	8b 45 08             	mov    0x8(%ebp),%eax
c010285b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010285e:	5b                   	pop    %ebx
c010285f:	5e                   	pop    %esi
c0102860:	5d                   	pop    %ebp
c0102861:	c3                   	ret    

c0102862 <create_file>:
c0102862:	55                   	push   %ebp
c0102863:	89 e5                	mov    %esp,%ebp
c0102865:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010286b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010286e:	50                   	push   %eax
c010286f:	ff 75 0c             	pushl  0xc(%ebp)
c0102872:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102875:	50                   	push   %eax
c0102876:	e8 59 fd ff ff       	call   c01025d4 <strip_path>
c010287b:	83 c4 0c             	add    $0xc,%esp
c010287e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102881:	75 0a                	jne    c010288d <create_file+0x2b>
c0102883:	b8 00 00 00 00       	mov    $0x0,%eax
c0102888:	e9 de 00 00 00       	jmp    c010296b <create_file+0x109>
c010288d:	e8 db 00 00 00       	call   c010296d <alloc_imap_bit>
c0102892:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102895:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102899:	75 0a                	jne    c01028a5 <create_file+0x43>
c010289b:	b8 00 00 00 00       	mov    $0x0,%eax
c01028a0:	e9 c6 00 00 00       	jmp    c010296b <create_file+0x109>
c01028a5:	e8 d6 10 00 00       	call   c0103980 <get_super_block>
c01028aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01028ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028b0:	8b 40 10             	mov    0x10(%eax),%eax
c01028b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01028b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01028b9:	83 ec 08             	sub    $0x8,%esp
c01028bc:	50                   	push   %eax
c01028bd:	ff 75 f4             	pushl  -0xc(%ebp)
c01028c0:	e8 a5 01 00 00       	call   c0102a6a <alloc_smap_bit>
c01028c5:	83 c4 10             	add    $0x10,%esp
c01028c8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01028cb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01028cf:	75 0a                	jne    c01028db <create_file+0x79>
c01028d1:	b8 00 00 00 00       	mov    $0x0,%eax
c01028d6:	e9 90 00 00 00       	jmp    c010296b <create_file+0x109>
c01028db:	83 ec 04             	sub    $0x4,%esp
c01028de:	ff 75 e8             	pushl  -0x18(%ebp)
c01028e1:	ff 75 f4             	pushl  -0xc(%ebp)
c01028e4:	8d 45 84             	lea    -0x7c(%ebp),%eax
c01028e7:	50                   	push   %eax
c01028e8:	e8 1e 03 00 00       	call   c0102c0b <new_inode>
c01028ed:	83 c4 10             	add    $0x10,%esp
c01028f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01028f3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01028f7:	75 07                	jne    c0102900 <create_file+0x9e>
c01028f9:	b8 00 00 00 00       	mov    $0x0,%eax
c01028fe:	eb 6b                	jmp    c010296b <create_file+0x109>
c0102900:	ff 75 f4             	pushl  -0xc(%ebp)
c0102903:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102906:	50                   	push   %eax
c0102907:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010290a:	50                   	push   %eax
c010290b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102911:	50                   	push   %eax
c0102912:	e8 12 04 00 00       	call   c0102d29 <new_dir_entry>
c0102917:	83 c4 10             	add    $0x10,%esp
c010291a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010291d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102921:	75 07                	jne    c010292a <create_file+0xc8>
c0102923:	b8 00 00 00 00       	mov    $0x0,%eax
c0102928:	eb 41                	jmp    c010296b <create_file+0x109>
c010292a:	8b 45 08             	mov    0x8(%ebp),%eax
c010292d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102930:	89 10                	mov    %edx,(%eax)
c0102932:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102935:	89 50 04             	mov    %edx,0x4(%eax)
c0102938:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010293b:	89 50 08             	mov    %edx,0x8(%eax)
c010293e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102941:	89 50 0c             	mov    %edx,0xc(%eax)
c0102944:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102947:	89 50 10             	mov    %edx,0x10(%eax)
c010294a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010294d:	89 50 14             	mov    %edx,0x14(%eax)
c0102950:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102953:	89 50 18             	mov    %edx,0x18(%eax)
c0102956:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102959:	89 50 1c             	mov    %edx,0x1c(%eax)
c010295c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010295f:	89 50 20             	mov    %edx,0x20(%eax)
c0102962:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102965:	89 50 24             	mov    %edx,0x24(%eax)
c0102968:	8b 45 08             	mov    0x8(%ebp),%eax
c010296b:	c9                   	leave  
c010296c:	c3                   	ret    

c010296d <alloc_imap_bit>:
c010296d:	55                   	push   %ebp
c010296e:	89 e5                	mov    %esp,%ebp
c0102970:	53                   	push   %ebx
c0102971:	83 ec 24             	sub    $0x24,%esp
c0102974:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010297b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102982:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102987:	83 ec 0c             	sub    $0xc,%esp
c010298a:	6a 07                	push   $0x7
c010298c:	68 00 02 00 00       	push   $0x200
c0102991:	50                   	push   %eax
c0102992:	ff 75 e8             	pushl  -0x18(%ebp)
c0102995:	ff 75 ec             	pushl  -0x14(%ebp)
c0102998:	e8 07 f2 ff ff       	call   c0101ba4 <rd_wt>
c010299d:	83 c4 20             	add    $0x20,%esp
c01029a0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01029a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01029ae:	e9 a5 00 00 00       	jmp    c0102a58 <alloc_imap_bit+0xeb>
c01029b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01029ba:	e9 8b 00 00 00       	jmp    c0102a4a <alloc_imap_bit+0xdd>
c01029bf:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01029c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029c8:	01 d0                	add    %edx,%eax
c01029ca:	0f b6 00             	movzbl (%eax),%eax
c01029cd:	0f be d0             	movsbl %al,%edx
c01029d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029d3:	89 c1                	mov    %eax,%ecx
c01029d5:	d3 fa                	sar    %cl,%edx
c01029d7:	89 d0                	mov    %edx,%eax
c01029d9:	83 e0 01             	and    $0x1,%eax
c01029dc:	85 c0                	test   %eax,%eax
c01029de:	74 06                	je     c01029e6 <alloc_imap_bit+0x79>
c01029e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01029e4:	eb 64                	jmp    c0102a4a <alloc_imap_bit+0xdd>
c01029e6:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01029ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029ef:	01 d0                	add    %edx,%eax
c01029f1:	0f b6 18             	movzbl (%eax),%ebx
c01029f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029f7:	ba 01 00 00 00       	mov    $0x1,%edx
c01029fc:	89 c1                	mov    %eax,%ecx
c01029fe:	d3 e2                	shl    %cl,%edx
c0102a00:	89 d0                	mov    %edx,%eax
c0102a02:	89 c1                	mov    %eax,%ecx
c0102a04:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102a0d:	01 d0                	add    %edx,%eax
c0102a0f:	09 cb                	or     %ecx,%ebx
c0102a11:	89 da                	mov    %ebx,%edx
c0102a13:	88 10                	mov    %dl,(%eax)
c0102a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102a18:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0102a1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a22:	01 d0                	add    %edx,%eax
c0102a24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102a27:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a2c:	83 ec 0c             	sub    $0xc,%esp
c0102a2f:	6a 0a                	push   $0xa
c0102a31:	68 00 02 00 00       	push   $0x200
c0102a36:	50                   	push   %eax
c0102a37:	ff 75 e8             	pushl  -0x18(%ebp)
c0102a3a:	ff 75 ec             	pushl  -0x14(%ebp)
c0102a3d:	e8 62 f1 ff ff       	call   c0101ba4 <rd_wt>
c0102a42:	83 c4 20             	add    $0x20,%esp
c0102a45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102a48:	eb 1b                	jmp    c0102a65 <alloc_imap_bit+0xf8>
c0102a4a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c0102a4e:	0f 8e 6b ff ff ff    	jle    c01029bf <alloc_imap_bit+0x52>
c0102a54:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102a58:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0102a5f:	0f 8e 4e ff ff ff    	jle    c01029b3 <alloc_imap_bit+0x46>
c0102a65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102a68:	c9                   	leave  
c0102a69:	c3                   	ret    

c0102a6a <alloc_smap_bit>:
c0102a6a:	55                   	push   %ebp
c0102a6b:	89 e5                	mov    %esp,%ebp
c0102a6d:	53                   	push   %ebx
c0102a6e:	83 ec 34             	sub    $0x34,%esp
c0102a71:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102a75:	75 1c                	jne    c0102a93 <alloc_smap_bit+0x29>
c0102a77:	68 fd 02 00 00       	push   $0x2fd
c0102a7c:	68 70 b3 10 c0       	push   $0xc010b370
c0102a81:	68 70 b3 10 c0       	push   $0xc010b370
c0102a86:	68 80 b4 10 c0       	push   $0xc010b480
c0102a8b:	e8 a5 61 00 00       	call   c0108c35 <assertion_failure>
c0102a90:	83 c4 10             	add    $0x10,%esp
c0102a93:	e8 e8 0e 00 00       	call   c0103980 <get_super_block>
c0102a98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102a9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102a9e:	8b 40 08             	mov    0x8(%eax),%eax
c0102aa1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102aa4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102aa7:	8b 40 04             	mov    0x4(%eax),%eax
c0102aaa:	83 c0 02             	add    $0x2,%eax
c0102aad:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102ab0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102ab7:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0102abe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102ac5:	e9 20 01 00 00       	jmp    c0102bea <alloc_smap_bit+0x180>
c0102aca:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102acd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ad0:	01 d0                	add    %edx,%eax
c0102ad2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102ad5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ada:	83 ec 0c             	sub    $0xc,%esp
c0102add:	6a 07                	push   $0x7
c0102adf:	68 00 02 00 00       	push   $0x200
c0102ae4:	50                   	push   %eax
c0102ae5:	ff 75 d8             	pushl  -0x28(%ebp)
c0102ae8:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102aeb:	e8 b4 f0 ff ff       	call   c0101ba4 <rd_wt>
c0102af0:	83 c4 20             	add    $0x20,%esp
c0102af3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102afa:	e9 b0 00 00 00       	jmp    c0102baf <alloc_smap_bit+0x145>
c0102aff:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102b06:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102b0a:	0f 85 8c 00 00 00    	jne    c0102b9c <alloc_smap_bit+0x132>
c0102b10:	eb 45                	jmp    c0102b57 <alloc_smap_bit+0xed>
c0102b12:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102b18:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b1b:	01 d0                	add    %edx,%eax
c0102b1d:	0f b6 00             	movzbl (%eax),%eax
c0102b20:	0f be d0             	movsbl %al,%edx
c0102b23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b26:	89 c1                	mov    %eax,%ecx
c0102b28:	d3 fa                	sar    %cl,%edx
c0102b2a:	89 d0                	mov    %edx,%eax
c0102b2c:	83 e0 01             	and    $0x1,%eax
c0102b2f:	85 c0                	test   %eax,%eax
c0102b31:	74 06                	je     c0102b39 <alloc_smap_bit+0xcf>
c0102b33:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102b37:	eb 1e                	jmp    c0102b57 <alloc_smap_bit+0xed>
c0102b39:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b3c:	c1 e0 09             	shl    $0x9,%eax
c0102b3f:	89 c2                	mov    %eax,%edx
c0102b41:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b44:	01 d0                	add    %edx,%eax
c0102b46:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0102b4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b50:	01 d0                	add    %edx,%eax
c0102b52:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102b55:	eb 06                	jmp    c0102b5d <alloc_smap_bit+0xf3>
c0102b57:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102b5b:	7e b5                	jle    c0102b12 <alloc_smap_bit+0xa8>
c0102b5d:	eb 3d                	jmp    c0102b9c <alloc_smap_bit+0x132>
c0102b5f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102b63:	74 45                	je     c0102baa <alloc_smap_bit+0x140>
c0102b65:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102b6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b6e:	01 d0                	add    %edx,%eax
c0102b70:	0f b6 18             	movzbl (%eax),%ebx
c0102b73:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b76:	ba 01 00 00 00       	mov    $0x1,%edx
c0102b7b:	89 c1                	mov    %eax,%ecx
c0102b7d:	d3 e2                	shl    %cl,%edx
c0102b7f:	89 d0                	mov    %edx,%eax
c0102b81:	89 c1                	mov    %eax,%ecx
c0102b83:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102b89:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b8c:	01 d0                	add    %edx,%eax
c0102b8e:	09 cb                	or     %ecx,%ebx
c0102b90:	89 da                	mov    %ebx,%edx
c0102b92:	88 10                	mov    %dl,(%eax)
c0102b94:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102b98:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102b9c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102ba0:	74 09                	je     c0102bab <alloc_smap_bit+0x141>
c0102ba2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102ba6:	7e b7                	jle    c0102b5f <alloc_smap_bit+0xf5>
c0102ba8:	eb 01                	jmp    c0102bab <alloc_smap_bit+0x141>
c0102baa:	90                   	nop
c0102bab:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102baf:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102bb6:	0f 8e 43 ff ff ff    	jle    c0102aff <alloc_smap_bit+0x95>
c0102bbc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102bc0:	74 1e                	je     c0102be0 <alloc_smap_bit+0x176>
c0102bc2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102bc7:	83 ec 0c             	sub    $0xc,%esp
c0102bca:	6a 0a                	push   $0xa
c0102bcc:	68 00 02 00 00       	push   $0x200
c0102bd1:	50                   	push   %eax
c0102bd2:	ff 75 d8             	pushl  -0x28(%ebp)
c0102bd5:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102bd8:	e8 c7 ef ff ff       	call   c0101ba4 <rd_wt>
c0102bdd:	83 c4 20             	add    $0x20,%esp
c0102be0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102be4:	74 12                	je     c0102bf8 <alloc_smap_bit+0x18e>
c0102be6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102bea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102bed:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102bf0:	0f 8c d4 fe ff ff    	jl     c0102aca <alloc_smap_bit+0x60>
c0102bf6:	eb 01                	jmp    c0102bf9 <alloc_smap_bit+0x18f>
c0102bf8:	90                   	nop
c0102bf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102bfc:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102bff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102c02:	8b 00                	mov    (%eax),%eax
c0102c04:	01 d0                	add    %edx,%eax
c0102c06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102c09:	c9                   	leave  
c0102c0a:	c3                   	ret    

c0102c0b <new_inode>:
c0102c0b:	55                   	push   %ebp
c0102c0c:	89 e5                	mov    %esp,%ebp
c0102c0e:	83 ec 38             	sub    $0x38,%esp
c0102c11:	83 ec 08             	sub    $0x8,%esp
c0102c14:	ff 75 0c             	pushl  0xc(%ebp)
c0102c17:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0102c1a:	50                   	push   %eax
c0102c1b:	e8 80 fa ff ff       	call   c01026a0 <get_inode>
c0102c20:	83 c4 10             	add    $0x10,%esp
c0102c23:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102c26:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102c2a:	75 0a                	jne    c0102c36 <new_inode+0x2b>
c0102c2c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102c31:	e9 f1 00 00 00       	jmp    c0102d27 <new_inode+0x11c>
c0102c36:	8b 45 10             	mov    0x10(%ebp),%eax
c0102c39:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102c3c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102c43:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0102c4a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102c51:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c54:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102c57:	83 ec 0c             	sub    $0xc,%esp
c0102c5a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0102c5d:	50                   	push   %eax
c0102c5e:	e8 39 0b 00 00       	call   c010379c <sync_inode>
c0102c63:	83 c4 10             	add    $0x10,%esp
c0102c66:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0102c6d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102c74:	eb 1d                	jmp    c0102c93 <new_inode+0x88>
c0102c76:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102c79:	89 d0                	mov    %edx,%eax
c0102c7b:	c1 e0 02             	shl    $0x2,%eax
c0102c7e:	01 d0                	add    %edx,%eax
c0102c80:	c1 e0 03             	shl    $0x3,%eax
c0102c83:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102c88:	8b 00                	mov    (%eax),%eax
c0102c8a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0102c8d:	74 0c                	je     c0102c9b <new_inode+0x90>
c0102c8f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102c93:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102c97:	7e dd                	jle    c0102c76 <new_inode+0x6b>
c0102c99:	eb 01                	jmp    c0102c9c <new_inode+0x91>
c0102c9b:	90                   	nop
c0102c9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102c9f:	89 d0                	mov    %edx,%eax
c0102ca1:	c1 e0 02             	shl    $0x2,%eax
c0102ca4:	01 d0                	add    %edx,%eax
c0102ca6:	c1 e0 03             	shl    $0x3,%eax
c0102ca9:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c0102cae:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102cb1:	89 10                	mov    %edx,(%eax)
c0102cb3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102cb6:	89 50 04             	mov    %edx,0x4(%eax)
c0102cb9:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102cbc:	89 50 08             	mov    %edx,0x8(%eax)
c0102cbf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102cc2:	89 50 0c             	mov    %edx,0xc(%eax)
c0102cc5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102cc8:	89 50 10             	mov    %edx,0x10(%eax)
c0102ccb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102cce:	89 50 14             	mov    %edx,0x14(%eax)
c0102cd1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102cd4:	89 50 18             	mov    %edx,0x18(%eax)
c0102cd7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102cda:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102cdd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102ce0:	89 50 20             	mov    %edx,0x20(%eax)
c0102ce3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102ce6:	89 50 24             	mov    %edx,0x24(%eax)
c0102ce9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cec:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102cef:	89 10                	mov    %edx,(%eax)
c0102cf1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102cf4:	89 50 04             	mov    %edx,0x4(%eax)
c0102cf7:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102cfa:	89 50 08             	mov    %edx,0x8(%eax)
c0102cfd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102d00:	89 50 0c             	mov    %edx,0xc(%eax)
c0102d03:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102d06:	89 50 10             	mov    %edx,0x10(%eax)
c0102d09:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102d0c:	89 50 14             	mov    %edx,0x14(%eax)
c0102d0f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102d12:	89 50 18             	mov    %edx,0x18(%eax)
c0102d15:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102d18:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102d1b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102d1e:	89 50 20             	mov    %edx,0x20(%eax)
c0102d21:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102d24:	89 50 24             	mov    %edx,0x24(%eax)
c0102d27:	c9                   	leave  
c0102d28:	c3                   	ret    

c0102d29 <new_dir_entry>:
c0102d29:	55                   	push   %ebp
c0102d2a:	89 e5                	mov    %esp,%ebp
c0102d2c:	83 ec 48             	sub    $0x48,%esp
c0102d2f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102d36:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d39:	8b 40 04             	mov    0x4(%eax),%eax
c0102d3c:	99                   	cltd   
c0102d3d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102d40:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102d43:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d46:	8b 40 0c             	mov    0xc(%eax),%eax
c0102d49:	99                   	cltd   
c0102d4a:	f7 7d dc             	idivl  -0x24(%ebp)
c0102d4d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102d50:	e8 2b 0c 00 00       	call   c0103980 <get_super_block>
c0102d55:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102d58:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102d5b:	8b 00                	mov    (%eax),%eax
c0102d5d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102d60:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d63:	8b 40 0c             	mov    0xc(%eax),%eax
c0102d66:	05 00 02 00 00       	add    $0x200,%eax
c0102d6b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102d71:	85 c0                	test   %eax,%eax
c0102d73:	0f 48 c2             	cmovs  %edx,%eax
c0102d76:	c1 f8 09             	sar    $0x9,%eax
c0102d79:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102d7c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102d83:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102d8a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102d91:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102d98:	eb 7f                	jmp    c0102e19 <new_dir_entry+0xf0>
c0102d9a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d9f:	89 c1                	mov    %eax,%ecx
c0102da1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102da4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102da7:	01 d0                	add    %edx,%eax
c0102da9:	83 ec 0c             	sub    $0xc,%esp
c0102dac:	6a 07                	push   $0x7
c0102dae:	68 00 02 00 00       	push   $0x200
c0102db3:	51                   	push   %ecx
c0102db4:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102db7:	50                   	push   %eax
c0102db8:	e8 e7 ed ff ff       	call   c0101ba4 <rd_wt>
c0102dbd:	83 c4 20             	add    $0x20,%esp
c0102dc0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102dc5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102dc8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102dcf:	eb 25                	jmp    c0102df6 <new_dir_entry+0xcd>
c0102dd1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102dd5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102dd8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102ddb:	7f 29                	jg     c0102e06 <new_dir_entry+0xdd>
c0102ddd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102de0:	8b 00                	mov    (%eax),%eax
c0102de2:	85 c0                	test   %eax,%eax
c0102de4:	75 08                	jne    c0102dee <new_dir_entry+0xc5>
c0102de6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102de9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102dec:	eb 19                	jmp    c0102e07 <new_dir_entry+0xde>
c0102dee:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102df2:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102df6:	b8 00 02 00 00       	mov    $0x200,%eax
c0102dfb:	99                   	cltd   
c0102dfc:	f7 7d dc             	idivl  -0x24(%ebp)
c0102dff:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102e02:	7c cd                	jl     c0102dd1 <new_dir_entry+0xa8>
c0102e04:	eb 01                	jmp    c0102e07 <new_dir_entry+0xde>
c0102e06:	90                   	nop
c0102e07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102e0a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102e0d:	7f 16                	jg     c0102e25 <new_dir_entry+0xfc>
c0102e0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102e13:	75 10                	jne    c0102e25 <new_dir_entry+0xfc>
c0102e15:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102e19:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102e1c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102e1f:	0f 8c 75 ff ff ff    	jl     c0102d9a <new_dir_entry+0x71>
c0102e25:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102e28:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102e2b:	75 0a                	jne    c0102e37 <new_dir_entry+0x10e>
c0102e2d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102e32:	e9 fc 00 00 00       	jmp    c0102f33 <new_dir_entry+0x20a>
c0102e37:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102e3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102e42:	75 1e                	jne    c0102e62 <new_dir_entry+0x139>
c0102e44:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e47:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102e4a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e4d:	8b 50 04             	mov    0x4(%eax),%edx
c0102e50:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102e53:	01 c2                	add    %eax,%edx
c0102e55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e58:	89 50 04             	mov    %edx,0x4(%eax)
c0102e5b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102e62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e65:	8b 55 14             	mov    0x14(%ebp),%edx
c0102e68:	89 10                	mov    %edx,(%eax)
c0102e6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e6d:	83 c0 04             	add    $0x4,%eax
c0102e70:	83 ec 08             	sub    $0x8,%esp
c0102e73:	ff 75 10             	pushl  0x10(%ebp)
c0102e76:	50                   	push   %eax
c0102e77:	e8 f2 93 00 00       	call   c010c26e <Strcpy>
c0102e7c:	83 c4 10             	add    $0x10,%esp
c0102e7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e82:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102e85:	8b 0a                	mov    (%edx),%ecx
c0102e87:	89 08                	mov    %ecx,(%eax)
c0102e89:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102e8c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102e8f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102e92:	89 48 08             	mov    %ecx,0x8(%eax)
c0102e95:	8b 52 0c             	mov    0xc(%edx),%edx
c0102e98:	89 50 0c             	mov    %edx,0xc(%eax)
c0102e9b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ea0:	89 c1                	mov    %eax,%ecx
c0102ea2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102ea5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102ea8:	01 d0                	add    %edx,%eax
c0102eaa:	83 ec 0c             	sub    $0xc,%esp
c0102ead:	6a 0a                	push   $0xa
c0102eaf:	68 00 02 00 00       	push   $0x200
c0102eb4:	51                   	push   %ecx
c0102eb5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102eb8:	50                   	push   %eax
c0102eb9:	e8 e6 ec ff ff       	call   c0101ba4 <rd_wt>
c0102ebe:	83 c4 20             	add    $0x20,%esp
c0102ec1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102ec5:	74 69                	je     c0102f30 <new_dir_entry+0x207>
c0102ec7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102eca:	8b 10                	mov    (%eax),%edx
c0102ecc:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102ed2:	8b 50 04             	mov    0x4(%eax),%edx
c0102ed5:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102edb:	8b 50 08             	mov    0x8(%eax),%edx
c0102ede:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102ee4:	8b 50 0c             	mov    0xc(%eax),%edx
c0102ee7:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102eed:	8b 50 10             	mov    0x10(%eax),%edx
c0102ef0:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102ef6:	8b 50 14             	mov    0x14(%eax),%edx
c0102ef9:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102eff:	8b 50 18             	mov    0x18(%eax),%edx
c0102f02:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102f08:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102f0b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102f11:	8b 50 20             	mov    0x20(%eax),%edx
c0102f14:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102f1a:	8b 40 24             	mov    0x24(%eax),%eax
c0102f1d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102f22:	83 ec 0c             	sub    $0xc,%esp
c0102f25:	ff 75 0c             	pushl  0xc(%ebp)
c0102f28:	e8 6f 08 00 00       	call   c010379c <sync_inode>
c0102f2d:	83 c4 10             	add    $0x10,%esp
c0102f30:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f33:	c9                   	leave  
c0102f34:	c3                   	ret    

c0102f35 <do_unlink>:
c0102f35:	55                   	push   %ebp
c0102f36:	89 e5                	mov    %esp,%ebp
c0102f38:	53                   	push   %ebx
c0102f39:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102f3f:	83 ec 08             	sub    $0x8,%esp
c0102f42:	ff 75 08             	pushl  0x8(%ebp)
c0102f45:	68 95 b4 10 c0       	push   $0xc010b495
c0102f4a:	e8 bd 6c 00 00       	call   c0109c0c <strcmp>
c0102f4f:	83 c4 10             	add    $0x10,%esp
c0102f52:	85 c0                	test   %eax,%eax
c0102f54:	75 10                	jne    c0102f66 <do_unlink+0x31>
c0102f56:	83 ec 0c             	sub    $0xc,%esp
c0102f59:	68 97 b4 10 c0       	push   $0xc010b497
c0102f5e:	e8 b4 5c 00 00       	call   c0108c17 <panic>
c0102f63:	83 c4 10             	add    $0x10,%esp
c0102f66:	83 ec 0c             	sub    $0xc,%esp
c0102f69:	ff 75 08             	pushl  0x8(%ebp)
c0102f6c:	e8 31 f5 ff ff       	call   c01024a2 <search_file>
c0102f71:	83 c4 10             	add    $0x10,%esp
c0102f74:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102f77:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102f7b:	75 10                	jne    c0102f8d <do_unlink+0x58>
c0102f7d:	83 ec 0c             	sub    $0xc,%esp
c0102f80:	68 b3 b4 10 c0       	push   $0xc010b4b3
c0102f85:	e8 8d 5c 00 00       	call   c0108c17 <panic>
c0102f8a:	83 c4 10             	add    $0x10,%esp
c0102f8d:	83 ec 08             	sub    $0x8,%esp
c0102f90:	ff 75 d0             	pushl  -0x30(%ebp)
c0102f93:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102f99:	50                   	push   %eax
c0102f9a:	e8 01 f7 ff ff       	call   c01026a0 <get_inode>
c0102f9f:	83 c4 10             	add    $0x10,%esp
c0102fa2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102fa5:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102fa9:	75 10                	jne    c0102fbb <do_unlink+0x86>
c0102fab:	83 ec 0c             	sub    $0xc,%esp
c0102fae:	68 b3 b4 10 c0       	push   $0xc010b4b3
c0102fb3:	e8 5f 5c 00 00       	call   c0108c17 <panic>
c0102fb8:	83 c4 10             	add    $0x10,%esp
c0102fbb:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102fbe:	85 c0                	test   %eax,%eax
c0102fc0:	7e 10                	jle    c0102fd2 <do_unlink+0x9d>
c0102fc2:	83 ec 0c             	sub    $0xc,%esp
c0102fc5:	68 cc b4 10 c0       	push   $0xc010b4cc
c0102fca:	e8 48 5c 00 00       	call   c0108c17 <panic>
c0102fcf:	83 c4 10             	add    $0x10,%esp
c0102fd2:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102fd8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102fdb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102fde:	8d 50 07             	lea    0x7(%eax),%edx
c0102fe1:	85 c0                	test   %eax,%eax
c0102fe3:	0f 48 c2             	cmovs  %edx,%eax
c0102fe6:	c1 f8 03             	sar    $0x3,%eax
c0102fe9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102fec:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102fef:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102ff5:	85 c0                	test   %eax,%eax
c0102ff7:	0f 48 c2             	cmovs  %edx,%eax
c0102ffa:	c1 f8 09             	sar    $0x9,%eax
c0102ffd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103000:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0103003:	99                   	cltd   
c0103004:	c1 ea 1d             	shr    $0x1d,%edx
c0103007:	01 d0                	add    %edx,%eax
c0103009:	83 e0 07             	and    $0x7,%eax
c010300c:	29 d0                	sub    %edx,%eax
c010300e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103011:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0103018:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010301d:	89 c2                	mov    %eax,%edx
c010301f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103022:	83 c0 02             	add    $0x2,%eax
c0103025:	83 ec 0c             	sub    $0xc,%esp
c0103028:	6a 07                	push   $0x7
c010302a:	68 00 02 00 00       	push   $0x200
c010302f:	52                   	push   %edx
c0103030:	ff 75 b8             	pushl  -0x48(%ebp)
c0103033:	50                   	push   %eax
c0103034:	e8 6b eb ff ff       	call   c0101ba4 <rd_wt>
c0103039:	83 c4 20             	add    $0x20,%esp
c010303c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103042:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103045:	01 d0                	add    %edx,%eax
c0103047:	0f b6 10             	movzbl (%eax),%edx
c010304a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010304d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0103052:	89 c1                	mov    %eax,%ecx
c0103054:	d3 e3                	shl    %cl,%ebx
c0103056:	89 d8                	mov    %ebx,%eax
c0103058:	f7 d0                	not    %eax
c010305a:	89 c3                	mov    %eax,%ebx
c010305c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0103062:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103065:	01 c8                	add    %ecx,%eax
c0103067:	21 da                	and    %ebx,%edx
c0103069:	88 10                	mov    %dl,(%eax)
c010306b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103070:	89 c2                	mov    %eax,%edx
c0103072:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103075:	83 c0 02             	add    $0x2,%eax
c0103078:	83 ec 0c             	sub    $0xc,%esp
c010307b:	6a 0a                	push   $0xa
c010307d:	68 00 02 00 00       	push   $0x200
c0103082:	52                   	push   %edx
c0103083:	ff 75 b8             	pushl  -0x48(%ebp)
c0103086:	50                   	push   %eax
c0103087:	e8 18 eb ff ff       	call   c0101ba4 <rd_wt>
c010308c:	83 c4 20             	add    $0x20,%esp
c010308f:	e8 ec 08 00 00       	call   c0103980 <get_super_block>
c0103094:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103097:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c010309d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01030a0:	8b 00                	mov    (%eax),%eax
c01030a2:	29 c2                	sub    %eax,%edx
c01030a4:	89 d0                	mov    %edx,%eax
c01030a6:	83 c0 01             	add    $0x1,%eax
c01030a9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01030ac:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01030af:	8d 50 07             	lea    0x7(%eax),%edx
c01030b2:	85 c0                	test   %eax,%eax
c01030b4:	0f 48 c2             	cmovs  %edx,%eax
c01030b7:	c1 f8 03             	sar    $0x3,%eax
c01030ba:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01030bd:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01030c0:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01030c6:	85 c0                	test   %eax,%eax
c01030c8:	0f 48 c2             	cmovs  %edx,%eax
c01030cb:	c1 f8 09             	sar    $0x9,%eax
c01030ce:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01030d1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01030d4:	99                   	cltd   
c01030d5:	c1 ea 1d             	shr    $0x1d,%edx
c01030d8:	01 d0                	add    %edx,%eax
c01030da:	83 e0 07             	and    $0x7,%eax
c01030dd:	29 d0                	sub    %edx,%eax
c01030df:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01030e2:	b8 08 00 00 00       	mov    $0x8,%eax
c01030e7:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c01030ea:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01030ed:	29 c2                	sub    %eax,%edx
c01030ef:	89 d0                	mov    %edx,%eax
c01030f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01030f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01030f7:	8d 50 07             	lea    0x7(%eax),%edx
c01030fa:	85 c0                	test   %eax,%eax
c01030fc:	0f 48 c2             	cmovs  %edx,%eax
c01030ff:	c1 f8 03             	sar    $0x3,%eax
c0103102:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0103105:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010310a:	89 c1                	mov    %eax,%ecx
c010310c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010310f:	8b 40 04             	mov    0x4(%eax),%eax
c0103112:	8d 50 02             	lea    0x2(%eax),%edx
c0103115:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103118:	01 d0                	add    %edx,%eax
c010311a:	83 ec 0c             	sub    $0xc,%esp
c010311d:	6a 07                	push   $0x7
c010311f:	68 00 02 00 00       	push   $0x200
c0103124:	51                   	push   %ecx
c0103125:	ff 75 b8             	pushl  -0x48(%ebp)
c0103128:	50                   	push   %eax
c0103129:	e8 76 ea ff ff       	call   c0101ba4 <rd_wt>
c010312e:	83 c4 20             	add    $0x20,%esp
c0103131:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103137:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010313a:	01 d0                	add    %edx,%eax
c010313c:	0f b6 10             	movzbl (%eax),%edx
c010313f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103142:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0103147:	89 c1                	mov    %eax,%ecx
c0103149:	d3 e3                	shl    %cl,%ebx
c010314b:	89 d8                	mov    %ebx,%eax
c010314d:	f7 d0                	not    %eax
c010314f:	89 c3                	mov    %eax,%ebx
c0103151:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0103157:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010315a:	01 c8                	add    %ecx,%eax
c010315c:	21 da                	and    %ebx,%edx
c010315e:	88 10                	mov    %dl,(%eax)
c0103160:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103167:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010316a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010316d:	eb 6b                	jmp    c01031da <do_unlink+0x2a5>
c010316f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0103176:	75 4c                	jne    c01031c4 <do_unlink+0x28f>
c0103178:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010317f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103184:	83 ec 0c             	sub    $0xc,%esp
c0103187:	6a 0a                	push   $0xa
c0103189:	68 00 02 00 00       	push   $0x200
c010318e:	50                   	push   %eax
c010318f:	ff 75 b8             	pushl  -0x48(%ebp)
c0103192:	ff 75 ec             	pushl  -0x14(%ebp)
c0103195:	e8 0a ea ff ff       	call   c0101ba4 <rd_wt>
c010319a:	83 c4 20             	add    $0x20,%esp
c010319d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01031a2:	89 c1                	mov    %eax,%ecx
c01031a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01031a7:	8d 50 01             	lea    0x1(%eax),%edx
c01031aa:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01031ad:	83 ec 0c             	sub    $0xc,%esp
c01031b0:	6a 07                	push   $0x7
c01031b2:	68 00 02 00 00       	push   $0x200
c01031b7:	51                   	push   %ecx
c01031b8:	ff 75 b8             	pushl  -0x48(%ebp)
c01031bb:	50                   	push   %eax
c01031bc:	e8 e3 e9 ff ff       	call   c0101ba4 <rd_wt>
c01031c1:	83 c4 20             	add    $0x20,%esp
c01031c4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01031ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01031cd:	01 d0                	add    %edx,%eax
c01031cf:	c6 00 00             	movb   $0x0,(%eax)
c01031d2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01031d6:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c01031da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01031dd:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c01031e0:	7c 8d                	jl     c010316f <do_unlink+0x23a>
c01031e2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c01031e9:	75 4c                	jne    c0103237 <do_unlink+0x302>
c01031eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01031f2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01031f7:	83 ec 0c             	sub    $0xc,%esp
c01031fa:	6a 0a                	push   $0xa
c01031fc:	68 00 02 00 00       	push   $0x200
c0103201:	50                   	push   %eax
c0103202:	ff 75 b8             	pushl  -0x48(%ebp)
c0103205:	ff 75 ec             	pushl  -0x14(%ebp)
c0103208:	e8 97 e9 ff ff       	call   c0101ba4 <rd_wt>
c010320d:	83 c4 20             	add    $0x20,%esp
c0103210:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103215:	89 c1                	mov    %eax,%ecx
c0103217:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010321a:	8d 50 01             	lea    0x1(%eax),%edx
c010321d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0103220:	83 ec 0c             	sub    $0xc,%esp
c0103223:	6a 07                	push   $0x7
c0103225:	68 00 02 00 00       	push   $0x200
c010322a:	51                   	push   %ecx
c010322b:	ff 75 b8             	pushl  -0x48(%ebp)
c010322e:	50                   	push   %eax
c010322f:	e8 70 e9 ff ff       	call   c0101ba4 <rd_wt>
c0103234:	83 c4 20             	add    $0x20,%esp
c0103237:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010323d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103240:	01 d0                	add    %edx,%eax
c0103242:	0f b6 10             	movzbl (%eax),%edx
c0103245:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103248:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c010324d:	89 c1                	mov    %eax,%ecx
c010324f:	d3 e3                	shl    %cl,%ebx
c0103251:	89 d8                	mov    %ebx,%eax
c0103253:	89 c3                	mov    %eax,%ebx
c0103255:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c010325b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010325e:	01 c8                	add    %ecx,%eax
c0103260:	21 da                	and    %ebx,%edx
c0103262:	88 10                	mov    %dl,(%eax)
c0103264:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103269:	83 ec 0c             	sub    $0xc,%esp
c010326c:	6a 0a                	push   $0xa
c010326e:	68 00 02 00 00       	push   $0x200
c0103273:	50                   	push   %eax
c0103274:	ff 75 b8             	pushl  -0x48(%ebp)
c0103277:	ff 75 ec             	pushl  -0x14(%ebp)
c010327a:	e8 25 e9 ff ff       	call   c0101ba4 <rd_wt>
c010327f:	83 c4 20             	add    $0x20,%esp
c0103282:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0103289:	00 00 00 
c010328c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0103293:	00 00 00 
c0103296:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c010329d:	00 00 00 
c01032a0:	83 ec 0c             	sub    $0xc,%esp
c01032a3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c01032a9:	50                   	push   %eax
c01032aa:	e8 ed 04 00 00       	call   c010379c <sync_inode>
c01032af:	83 c4 10             	add    $0x10,%esp
c01032b2:	83 ec 0c             	sub    $0xc,%esp
c01032b5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c01032bb:	50                   	push   %eax
c01032bc:	e8 2f 06 00 00       	call   c01038f0 <put_inode>
c01032c1:	83 c4 10             	add    $0x10,%esp
c01032c4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01032c7:	8b 00                	mov    (%eax),%eax
c01032c9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01032cc:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c01032d3:	8b 45 98             	mov    -0x68(%ebp),%eax
c01032d6:	8b 40 04             	mov    0x4(%eax),%eax
c01032d9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01032dc:	8b 45 98             	mov    -0x68(%ebp),%eax
c01032df:	8b 40 0c             	mov    0xc(%eax),%eax
c01032e2:	89 45 90             	mov    %eax,-0x70(%ebp)
c01032e5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01032e8:	c1 e8 04             	shr    $0x4,%eax
c01032eb:	89 45 8c             	mov    %eax,-0x74(%ebp)
c01032ee:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01032f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01032fc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0103303:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010330a:	e9 a5 00 00 00       	jmp    c01033b4 <do_unlink+0x47f>
c010330f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103314:	89 c1                	mov    %eax,%ecx
c0103316:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0103319:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010331c:	01 d0                	add    %edx,%eax
c010331e:	83 ec 0c             	sub    $0xc,%esp
c0103321:	6a 07                	push   $0x7
c0103323:	68 00 02 00 00       	push   $0x200
c0103328:	51                   	push   %ecx
c0103329:	ff 75 b8             	pushl  -0x48(%ebp)
c010332c:	50                   	push   %eax
c010332d:	e8 72 e8 ff ff       	call   c0101ba4 <rd_wt>
c0103332:	83 c4 20             	add    $0x20,%esp
c0103335:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010333a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010333d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0103344:	eb 51                	jmp    c0103397 <do_unlink+0x462>
c0103346:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010334a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010334d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103350:	7f 4f                	jg     c01033a1 <do_unlink+0x46c>
c0103352:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103355:	83 c0 10             	add    $0x10,%eax
c0103358:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010335b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010335e:	83 c0 04             	add    $0x4,%eax
c0103361:	83 ec 08             	sub    $0x8,%esp
c0103364:	ff 75 08             	pushl  0x8(%ebp)
c0103367:	50                   	push   %eax
c0103368:	e8 9f 68 00 00       	call   c0109c0c <strcmp>
c010336d:	83 c4 10             	add    $0x10,%esp
c0103370:	85 c0                	test   %eax,%eax
c0103372:	75 1b                	jne    c010338f <do_unlink+0x45a>
c0103374:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c010337b:	83 ec 04             	sub    $0x4,%esp
c010337e:	6a 10                	push   $0x10
c0103380:	6a 00                	push   $0x0
c0103382:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103385:	e8 c5 8e 00 00       	call   c010c24f <Memset>
c010338a:	83 c4 10             	add    $0x10,%esp
c010338d:	eb 13                	jmp    c01033a2 <do_unlink+0x46d>
c010338f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0103393:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0103397:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010339a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010339d:	7c a7                	jl     c0103346 <do_unlink+0x411>
c010339f:	eb 01                	jmp    c01033a2 <do_unlink+0x46d>
c01033a1:	90                   	nop
c01033a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01033a5:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01033a8:	7f 16                	jg     c01033c0 <do_unlink+0x48b>
c01033aa:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01033ae:	75 10                	jne    c01033c0 <do_unlink+0x48b>
c01033b0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c01033b4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033b7:	3b 45 90             	cmp    -0x70(%ebp),%eax
c01033ba:	0f 8c 4f ff ff ff    	jl     c010330f <do_unlink+0x3da>
c01033c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01033c3:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01033c6:	75 17                	jne    c01033df <do_unlink+0x4aa>
c01033c8:	8b 45 98             	mov    -0x68(%ebp),%eax
c01033cb:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01033ce:	89 50 04             	mov    %edx,0x4(%eax)
c01033d1:	83 ec 0c             	sub    $0xc,%esp
c01033d4:	ff 75 98             	pushl  -0x68(%ebp)
c01033d7:	e8 c0 03 00 00       	call   c010379c <sync_inode>
c01033dc:	83 c4 10             	add    $0x10,%esp
c01033df:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01033e3:	74 26                	je     c010340b <do_unlink+0x4d6>
c01033e5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01033ea:	89 c1                	mov    %eax,%ecx
c01033ec:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01033ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01033f2:	01 d0                	add    %edx,%eax
c01033f4:	83 ec 0c             	sub    $0xc,%esp
c01033f7:	6a 0a                	push   $0xa
c01033f9:	68 00 02 00 00       	push   $0x200
c01033fe:	51                   	push   %ecx
c01033ff:	ff 75 b8             	pushl  -0x48(%ebp)
c0103402:	50                   	push   %eax
c0103403:	e8 9c e7 ff ff       	call   c0101ba4 <rd_wt>
c0103408:	83 c4 20             	add    $0x20,%esp
c010340b:	90                   	nop
c010340c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010340f:	c9                   	leave  
c0103410:	c3                   	ret    

c0103411 <do_rdwt>:
c0103411:	55                   	push   %ebp
c0103412:	89 e5                	mov    %esp,%ebp
c0103414:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010341a:	8b 45 08             	mov    0x8(%ebp),%eax
c010341d:	8b 40 78             	mov    0x78(%eax),%eax
c0103420:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103423:	8b 45 08             	mov    0x8(%ebp),%eax
c0103426:	8b 40 60             	mov    0x60(%eax),%eax
c0103429:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010342c:	8b 45 08             	mov    0x8(%ebp),%eax
c010342f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103432:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103435:	8b 45 08             	mov    0x8(%ebp),%eax
c0103438:	8b 00                	mov    (%eax),%eax
c010343a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010343d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103440:	8b 40 10             	mov    0x10(%eax),%eax
c0103443:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103446:	8b 45 08             	mov    0x8(%ebp),%eax
c0103449:	8b 40 50             	mov    0x50(%eax),%eax
c010344c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010344f:	83 ec 0c             	sub    $0xc,%esp
c0103452:	ff 75 d0             	pushl  -0x30(%ebp)
c0103455:	e8 0c 07 00 00       	call   c0103b66 <pid2proc>
c010345a:	83 c4 10             	add    $0x10,%esp
c010345d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103460:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103463:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0103466:	83 c2 4c             	add    $0x4c,%edx
c0103469:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010346d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103470:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103473:	8b 40 08             	mov    0x8(%eax),%eax
c0103476:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103479:	8b 45 08             	mov    0x8(%ebp),%eax
c010347c:	8b 00                	mov    (%eax),%eax
c010347e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103481:	83 ec 08             	sub    $0x8,%esp
c0103484:	ff 75 bc             	pushl  -0x44(%ebp)
c0103487:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010348d:	50                   	push   %eax
c010348e:	e8 0d f2 ff ff       	call   c01026a0 <get_inode>
c0103493:	83 c4 10             	add    $0x10,%esp
c0103496:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103499:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010349d:	75 10                	jne    c01034af <do_rdwt+0x9e>
c010349f:	83 ec 0c             	sub    $0xc,%esp
c01034a2:	68 04 b5 10 c0       	push   $0xc010b504
c01034a7:	e8 6b 57 00 00       	call   c0108c17 <panic>
c01034ac:	83 c4 10             	add    $0x10,%esp
c01034af:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01034b5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01034b8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01034bb:	8b 40 04             	mov    0x4(%eax),%eax
c01034be:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01034c1:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01034c5:	74 22                	je     c01034e9 <do_rdwt+0xd8>
c01034c7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01034cb:	74 1c                	je     c01034e9 <do_rdwt+0xd8>
c01034cd:	68 a8 04 00 00       	push   $0x4a8
c01034d2:	68 70 b3 10 c0       	push   $0xc010b370
c01034d7:	68 70 b3 10 c0       	push   $0xc010b370
c01034dc:	68 14 b5 10 c0       	push   $0xc010b514
c01034e1:	e8 4f 57 00 00       	call   c0108c35 <assertion_failure>
c01034e6:	83 c4 10             	add    $0x10,%esp
c01034e9:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c01034ef:	83 f8 01             	cmp    $0x1,%eax
c01034f2:	0f 85 86 00 00 00    	jne    c010357e <do_rdwt+0x16d>
c01034f8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01034fc:	75 09                	jne    c0103507 <do_rdwt+0xf6>
c01034fe:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103505:	eb 0d                	jmp    c0103514 <do_rdwt+0x103>
c0103507:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010350b:	75 07                	jne    c0103514 <do_rdwt+0x103>
c010350d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103514:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103517:	8b 45 08             	mov    0x8(%ebp),%eax
c010351a:	89 50 78             	mov    %edx,0x78(%eax)
c010351d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103520:	8b 45 08             	mov    0x8(%ebp),%eax
c0103523:	89 50 68             	mov    %edx,0x68(%eax)
c0103526:	83 ec 04             	sub    $0x4,%esp
c0103529:	6a 04                	push   $0x4
c010352b:	ff 75 08             	pushl  0x8(%ebp)
c010352e:	6a 03                	push   $0x3
c0103530:	e8 70 63 00 00       	call   c01098a5 <send_rec>
c0103535:	83 c4 10             	add    $0x10,%esp
c0103538:	8b 45 08             	mov    0x8(%ebp),%eax
c010353b:	8b 40 78             	mov    0x78(%eax),%eax
c010353e:	83 f8 66             	cmp    $0x66,%eax
c0103541:	75 13                	jne    c0103556 <do_rdwt+0x145>
c0103543:	83 ec 04             	sub    $0x4,%esp
c0103546:	ff 75 b8             	pushl  -0x48(%ebp)
c0103549:	ff 75 08             	pushl  0x8(%ebp)
c010354c:	6a 01                	push   $0x1
c010354e:	e8 52 63 00 00       	call   c01098a5 <send_rec>
c0103553:	83 c4 10             	add    $0x10,%esp
c0103556:	8b 45 08             	mov    0x8(%ebp),%eax
c0103559:	8b 40 78             	mov    0x78(%eax),%eax
c010355c:	83 f8 65             	cmp    $0x65,%eax
c010355f:	75 13                	jne    c0103574 <do_rdwt+0x163>
c0103561:	83 ec 04             	sub    $0x4,%esp
c0103564:	ff 75 b8             	pushl  -0x48(%ebp)
c0103567:	ff 75 08             	pushl  0x8(%ebp)
c010356a:	6a 01                	push   $0x1
c010356c:	e8 34 63 00 00       	call   c01098a5 <send_rec>
c0103571:	83 c4 10             	add    $0x10,%esp
c0103574:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103579:	e9 1c 02 00 00       	jmp    c010379a <do_rdwt+0x389>
c010357e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103582:	75 18                	jne    c010359c <do_rdwt+0x18b>
c0103584:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010358a:	c1 e0 09             	shl    $0x9,%eax
c010358d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103590:	75 0a                	jne    c010359c <do_rdwt+0x18b>
c0103592:	b8 00 00 00 00       	mov    $0x0,%eax
c0103597:	e9 fe 01 00 00       	jmp    c010379a <do_rdwt+0x389>
c010359c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01035a0:	75 14                	jne    c01035b6 <do_rdwt+0x1a5>
c01035a2:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01035a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01035a8:	01 d0                	add    %edx,%eax
c01035aa:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01035ad:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c01035b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01035b4:	eb 19                	jmp    c01035cf <do_rdwt+0x1be>
c01035b6:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01035b9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01035bc:	01 c2                	add    %eax,%edx
c01035be:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01035c4:	c1 e0 09             	shl    $0x9,%eax
c01035c7:	39 c2                	cmp    %eax,%edx
c01035c9:	0f 4e c2             	cmovle %edx,%eax
c01035cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01035cf:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01035d2:	99                   	cltd   
c01035d3:	c1 ea 17             	shr    $0x17,%edx
c01035d6:	01 d0                	add    %edx,%eax
c01035d8:	25 ff 01 00 00       	and    $0x1ff,%eax
c01035dd:	29 d0                	sub    %edx,%eax
c01035df:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01035e2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01035e8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01035eb:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01035f1:	85 c0                	test   %eax,%eax
c01035f3:	0f 48 c1             	cmovs  %ecx,%eax
c01035f6:	c1 f8 09             	sar    $0x9,%eax
c01035f9:	01 d0                	add    %edx,%eax
c01035fb:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01035fe:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103604:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103607:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010360d:	85 c0                	test   %eax,%eax
c010360f:	0f 48 c1             	cmovs  %ecx,%eax
c0103612:	c1 f8 09             	sar    $0x9,%eax
c0103615:	01 d0                	add    %edx,%eax
c0103617:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010361a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010361d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103620:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103625:	39 d0                	cmp    %edx,%eax
c0103627:	7d 0b                	jge    c0103634 <do_rdwt+0x223>
c0103629:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010362c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010362f:	83 c0 01             	add    $0x1,%eax
c0103632:	eb 05                	jmp    c0103639 <do_rdwt+0x228>
c0103634:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103639:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010363c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010363f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103642:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103649:	8b 45 08             	mov    0x8(%ebp),%eax
c010364c:	8b 00                	mov    (%eax),%eax
c010364e:	83 ec 0c             	sub    $0xc,%esp
c0103651:	50                   	push   %eax
c0103652:	e8 0f 05 00 00       	call   c0103b66 <pid2proc>
c0103657:	83 c4 10             	add    $0x10,%esp
c010365a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010365d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103660:	83 ec 08             	sub    $0x8,%esp
c0103663:	50                   	push   %eax
c0103664:	ff 75 cc             	pushl  -0x34(%ebp)
c0103667:	e8 43 2b 00 00       	call   c01061af <alloc_virtual_memory>
c010366c:	83 c4 10             	add    $0x10,%esp
c010366f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103672:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103675:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103678:	e9 c5 00 00 00       	jmp    c0103742 <do_rdwt+0x331>
c010367d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103680:	c1 e0 09             	shl    $0x9,%eax
c0103683:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103686:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103689:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010368d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103690:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103697:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010369b:	75 46                	jne    c01036e3 <do_rdwt+0x2d2>
c010369d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01036a0:	c1 e0 09             	shl    $0x9,%eax
c01036a3:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01036a9:	83 ec 0c             	sub    $0xc,%esp
c01036ac:	6a 07                	push   $0x7
c01036ae:	50                   	push   %eax
c01036af:	52                   	push   %edx
c01036b0:	ff 75 90             	pushl  -0x70(%ebp)
c01036b3:	ff 75 e0             	pushl  -0x20(%ebp)
c01036b6:	e8 e9 e4 ff ff       	call   c0101ba4 <rd_wt>
c01036bb:	83 c4 20             	add    $0x20,%esp
c01036be:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01036c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01036c7:	01 d0                	add    %edx,%eax
c01036c9:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01036cc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01036cf:	01 ca                	add    %ecx,%edx
c01036d1:	83 ec 04             	sub    $0x4,%esp
c01036d4:	ff 75 94             	pushl  -0x6c(%ebp)
c01036d7:	50                   	push   %eax
c01036d8:	52                   	push   %edx
c01036d9:	e8 3e 39 00 00       	call   c010701c <Memcpy>
c01036de:	83 c4 10             	add    $0x10,%esp
c01036e1:	eb 46                	jmp    c0103729 <do_rdwt+0x318>
c01036e3:	8b 55 98             	mov    -0x68(%ebp),%edx
c01036e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01036e9:	01 d0                	add    %edx,%eax
c01036eb:	89 c1                	mov    %eax,%ecx
c01036ed:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01036f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01036f6:	01 d0                	add    %edx,%eax
c01036f8:	83 ec 04             	sub    $0x4,%esp
c01036fb:	ff 75 94             	pushl  -0x6c(%ebp)
c01036fe:	51                   	push   %ecx
c01036ff:	50                   	push   %eax
c0103700:	e8 17 39 00 00       	call   c010701c <Memcpy>
c0103705:	83 c4 10             	add    $0x10,%esp
c0103708:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010370b:	c1 e0 09             	shl    $0x9,%eax
c010370e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103714:	83 ec 0c             	sub    $0xc,%esp
c0103717:	6a 0a                	push   $0xa
c0103719:	50                   	push   %eax
c010371a:	52                   	push   %edx
c010371b:	ff 75 90             	pushl  -0x70(%ebp)
c010371e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103721:	e8 7e e4 ff ff       	call   c0101ba4 <rd_wt>
c0103726:	83 c4 20             	add    $0x20,%esp
c0103729:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010372c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010372f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103732:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103735:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010373c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010373f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103742:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103745:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103748:	7f 0a                	jg     c0103754 <do_rdwt+0x343>
c010374a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010374e:	0f 85 29 ff ff ff    	jne    c010367d <do_rdwt+0x26c>
c0103754:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103757:	8b 50 04             	mov    0x4(%eax),%edx
c010375a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010375d:	01 c2                	add    %eax,%edx
c010375f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103762:	89 50 04             	mov    %edx,0x4(%eax)
c0103765:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103768:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010376b:	01 c2                	add    %eax,%edx
c010376d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103773:	39 c2                	cmp    %eax,%edx
c0103775:	7e 20                	jle    c0103797 <do_rdwt+0x386>
c0103777:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010377a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010377d:	01 d0                	add    %edx,%eax
c010377f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103785:	83 ec 0c             	sub    $0xc,%esp
c0103788:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010378e:	50                   	push   %eax
c010378f:	e8 08 00 00 00       	call   c010379c <sync_inode>
c0103794:	83 c4 10             	add    $0x10,%esp
c0103797:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010379a:	c9                   	leave  
c010379b:	c3                   	ret    

c010379c <sync_inode>:
c010379c:	55                   	push   %ebp
c010379d:	89 e5                	mov    %esp,%ebp
c010379f:	53                   	push   %ebx
c01037a0:	83 ec 34             	sub    $0x34,%esp
c01037a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01037aa:	eb 74                	jmp    c0103820 <sync_inode+0x84>
c01037ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01037af:	89 d0                	mov    %edx,%eax
c01037b1:	c1 e0 02             	shl    $0x2,%eax
c01037b4:	01 d0                	add    %edx,%eax
c01037b6:	c1 e0 03             	shl    $0x3,%eax
c01037b9:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01037be:	8b 10                	mov    (%eax),%edx
c01037c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01037c3:	8b 40 10             	mov    0x10(%eax),%eax
c01037c6:	39 c2                	cmp    %eax,%edx
c01037c8:	75 52                	jne    c010381c <sync_inode+0x80>
c01037ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01037cd:	89 d0                	mov    %edx,%eax
c01037cf:	c1 e0 02             	shl    $0x2,%eax
c01037d2:	01 d0                	add    %edx,%eax
c01037d4:	c1 e0 03             	shl    $0x3,%eax
c01037d7:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c01037dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01037e0:	8b 08                	mov    (%eax),%ecx
c01037e2:	89 0a                	mov    %ecx,(%edx)
c01037e4:	8b 48 04             	mov    0x4(%eax),%ecx
c01037e7:	89 4a 04             	mov    %ecx,0x4(%edx)
c01037ea:	8b 48 08             	mov    0x8(%eax),%ecx
c01037ed:	89 4a 08             	mov    %ecx,0x8(%edx)
c01037f0:	8b 48 0c             	mov    0xc(%eax),%ecx
c01037f3:	89 4a 0c             	mov    %ecx,0xc(%edx)
c01037f6:	8b 48 10             	mov    0x10(%eax),%ecx
c01037f9:	89 4a 10             	mov    %ecx,0x10(%edx)
c01037fc:	8b 48 14             	mov    0x14(%eax),%ecx
c01037ff:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103802:	8b 48 18             	mov    0x18(%eax),%ecx
c0103805:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103808:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010380b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010380e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103811:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103814:	8b 40 24             	mov    0x24(%eax),%eax
c0103817:	89 42 24             	mov    %eax,0x24(%edx)
c010381a:	eb 0a                	jmp    c0103826 <sync_inode+0x8a>
c010381c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103820:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103824:	7e 86                	jle    c01037ac <sync_inode+0x10>
c0103826:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010382d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103830:	8b 40 10             	mov    0x10(%eax),%eax
c0103833:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103836:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103839:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010383c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103841:	99                   	cltd   
c0103842:	f7 7d f0             	idivl  -0x10(%ebp)
c0103845:	89 c3                	mov    %eax,%ebx
c0103847:	89 c8                	mov    %ecx,%eax
c0103849:	99                   	cltd   
c010384a:	f7 fb                	idiv   %ebx
c010384c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010384f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103852:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103855:	b8 00 02 00 00       	mov    $0x200,%eax
c010385a:	99                   	cltd   
c010385b:	f7 7d f0             	idivl  -0x10(%ebp)
c010385e:	89 c3                	mov    %eax,%ebx
c0103860:	89 c8                	mov    %ecx,%eax
c0103862:	99                   	cltd   
c0103863:	f7 fb                	idiv   %ebx
c0103865:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103868:	8b 45 08             	mov    0x8(%ebp),%eax
c010386b:	8b 40 20             	mov    0x20(%eax),%eax
c010386e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103871:	e8 0a 01 00 00       	call   c0103980 <get_super_block>
c0103876:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103879:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010387c:	8b 40 04             	mov    0x4(%eax),%eax
c010387f:	8d 50 02             	lea    0x2(%eax),%edx
c0103882:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103885:	8b 40 08             	mov    0x8(%eax),%eax
c0103888:	01 c2                	add    %eax,%edx
c010388a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010388d:	01 d0                	add    %edx,%eax
c010388f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103892:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103897:	83 ec 0c             	sub    $0xc,%esp
c010389a:	6a 07                	push   $0x7
c010389c:	68 00 02 00 00       	push   $0x200
c01038a1:	50                   	push   %eax
c01038a2:	ff 75 e0             	pushl  -0x20(%ebp)
c01038a5:	ff 75 d8             	pushl  -0x28(%ebp)
c01038a8:	e8 f7 e2 ff ff       	call   c0101ba4 <rd_wt>
c01038ad:	83 c4 20             	add    $0x20,%esp
c01038b0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01038b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01038b8:	83 ec 04             	sub    $0x4,%esp
c01038bb:	ff 75 f0             	pushl  -0x10(%ebp)
c01038be:	ff 75 08             	pushl  0x8(%ebp)
c01038c1:	ff 75 d4             	pushl  -0x2c(%ebp)
c01038c4:	e8 53 37 00 00       	call   c010701c <Memcpy>
c01038c9:	83 c4 10             	add    $0x10,%esp
c01038cc:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01038d1:	83 ec 0c             	sub    $0xc,%esp
c01038d4:	6a 0a                	push   $0xa
c01038d6:	68 00 02 00 00       	push   $0x200
c01038db:	50                   	push   %eax
c01038dc:	ff 75 e0             	pushl  -0x20(%ebp)
c01038df:	ff 75 d8             	pushl  -0x28(%ebp)
c01038e2:	e8 bd e2 ff ff       	call   c0101ba4 <rd_wt>
c01038e7:	83 c4 20             	add    $0x20,%esp
c01038ea:	90                   	nop
c01038eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01038ee:	c9                   	leave  
c01038ef:	c3                   	ret    

c01038f0 <put_inode>:
c01038f0:	55                   	push   %ebp
c01038f1:	89 e5                	mov    %esp,%ebp
c01038f3:	83 ec 08             	sub    $0x8,%esp
c01038f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01038f9:	8b 40 24             	mov    0x24(%eax),%eax
c01038fc:	85 c0                	test   %eax,%eax
c01038fe:	7f 1c                	jg     c010391c <put_inode+0x2c>
c0103900:	68 4d 05 00 00       	push   $0x54d
c0103905:	68 70 b3 10 c0       	push   $0xc010b370
c010390a:	68 70 b3 10 c0       	push   $0xc010b370
c010390f:	68 48 b5 10 c0       	push   $0xc010b548
c0103914:	e8 1c 53 00 00       	call   c0108c35 <assertion_failure>
c0103919:	83 c4 10             	add    $0x10,%esp
c010391c:	8b 45 08             	mov    0x8(%ebp),%eax
c010391f:	8b 40 24             	mov    0x24(%eax),%eax
c0103922:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103925:	8b 45 08             	mov    0x8(%ebp),%eax
c0103928:	89 50 24             	mov    %edx,0x24(%eax)
c010392b:	90                   	nop
c010392c:	c9                   	leave  
c010392d:	c3                   	ret    

c010392e <do_close>:
c010392e:	55                   	push   %ebp
c010392f:	89 e5                	mov    %esp,%ebp
c0103931:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103936:	8b 55 08             	mov    0x8(%ebp),%edx
c0103939:	83 c2 4c             	add    $0x4c,%edx
c010393c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103940:	8b 50 0c             	mov    0xc(%eax),%edx
c0103943:	83 ea 01             	sub    $0x1,%edx
c0103946:	89 50 0c             	mov    %edx,0xc(%eax)
c0103949:	8b 40 0c             	mov    0xc(%eax),%eax
c010394c:	85 c0                	test   %eax,%eax
c010394e:	75 16                	jne    c0103966 <do_close+0x38>
c0103950:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103955:	8b 55 08             	mov    0x8(%ebp),%edx
c0103958:	83 c2 4c             	add    $0x4c,%edx
c010395b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010395f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103966:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010396b:	8b 55 08             	mov    0x8(%ebp),%edx
c010396e:	83 c2 4c             	add    $0x4c,%edx
c0103971:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103978:	00 
c0103979:	b8 00 00 00 00       	mov    $0x0,%eax
c010397e:	5d                   	pop    %ebp
c010397f:	c3                   	ret    

c0103980 <get_super_block>:
c0103980:	55                   	push   %ebp
c0103981:	89 e5                	mov    %esp,%ebp
c0103983:	83 ec 08             	sub    $0x8,%esp
c0103986:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010398b:	83 ec 0c             	sub    $0xc,%esp
c010398e:	6a 07                	push   $0x7
c0103990:	68 00 02 00 00       	push   $0x200
c0103995:	50                   	push   %eax
c0103996:	6a 20                	push   $0x20
c0103998:	6a 01                	push   $0x1
c010399a:	e8 05 e2 ff ff       	call   c0101ba4 <rd_wt>
c010399f:	83 c4 20             	add    $0x20,%esp
c01039a2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01039a8:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01039ad:	8b 0a                	mov    (%edx),%ecx
c01039af:	89 08                	mov    %ecx,(%eax)
c01039b1:	8b 4a 04             	mov    0x4(%edx),%ecx
c01039b4:	89 48 04             	mov    %ecx,0x4(%eax)
c01039b7:	8b 4a 08             	mov    0x8(%edx),%ecx
c01039ba:	89 48 08             	mov    %ecx,0x8(%eax)
c01039bd:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01039c0:	89 48 0c             	mov    %ecx,0xc(%eax)
c01039c3:	8b 4a 10             	mov    0x10(%edx),%ecx
c01039c6:	89 48 10             	mov    %ecx,0x10(%eax)
c01039c9:	8b 4a 14             	mov    0x14(%edx),%ecx
c01039cc:	89 48 14             	mov    %ecx,0x14(%eax)
c01039cf:	8b 4a 18             	mov    0x18(%edx),%ecx
c01039d2:	89 48 18             	mov    %ecx,0x18(%eax)
c01039d5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01039d8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01039db:	8b 52 20             	mov    0x20(%edx),%edx
c01039de:	89 50 20             	mov    %edx,0x20(%eax)
c01039e1:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01039e6:	c9                   	leave  
c01039e7:	c3                   	ret    

c01039e8 <schedule_process>:
c01039e8:	55                   	push   %ebp
c01039e9:	89 e5                	mov    %esp,%ebp
c01039eb:	83 ec 18             	sub    $0x18,%esp
c01039ee:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c01039f5:	e8 42 ca ff ff       	call   c010043c <get_running_thread_pcb>
c01039fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01039fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a00:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103a07:	84 c0                	test   %al,%al
c0103a09:	75 35                	jne    c0103a40 <schedule_process+0x58>
c0103a0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a0e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103a14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a17:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0103a1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a20:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103a27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a2a:	05 60 02 00 00       	add    $0x260,%eax
c0103a2f:	83 ec 08             	sub    $0x8,%esp
c0103a32:	50                   	push   %eax
c0103a33:	68 ec fd 10 c0       	push   $0xc010fdec
c0103a38:	e8 9a 6b 00 00       	call   c010a5d7 <insertToDoubleLinkList>
c0103a3d:	83 c4 10             	add    $0x10,%esp
c0103a40:	83 ec 0c             	sub    $0xc,%esp
c0103a43:	68 ec fd 10 c0       	push   $0xc010fdec
c0103a48:	e8 a6 69 00 00       	call   c010a3f3 <isListEmpty>
c0103a4d:	83 c4 10             	add    $0x10,%esp
c0103a50:	84 c0                	test   %al,%al
c0103a52:	74 19                	je     c0103a6d <schedule_process+0x85>
c0103a54:	6a 1e                	push   $0x1e
c0103a56:	68 57 b5 10 c0       	push   $0xc010b557
c0103a5b:	68 57 b5 10 c0       	push   $0xc010b557
c0103a60:	68 61 b5 10 c0       	push   $0xc010b561
c0103a65:	e8 cb 51 00 00       	call   c0108c35 <assertion_failure>
c0103a6a:	83 c4 10             	add    $0x10,%esp
c0103a6d:	83 ec 0c             	sub    $0xc,%esp
c0103a70:	68 ec fd 10 c0       	push   $0xc010fdec
c0103a75:	e8 e0 6b 00 00       	call   c010a65a <popFromDoubleLinkList>
c0103a7a:	83 c4 10             	add    $0x10,%esp
c0103a7d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103a80:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103a83:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103a88:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103a8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a8e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103a95:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a98:	8b 50 08             	mov    0x8(%eax),%edx
c0103a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a9e:	39 c2                	cmp    %eax,%edx
c0103aa0:	74 28                	je     c0103aca <schedule_process+0xe2>
c0103aa2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103aa5:	05 00 10 00 00       	add    $0x1000,%eax
c0103aaa:	83 ec 0c             	sub    $0xc,%esp
c0103aad:	50                   	push   %eax
c0103aae:	e8 7a c9 ff ff       	call   c010042d <update_tss>
c0103ab3:	83 c4 10             	add    $0x10,%esp
c0103ab6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103ab9:	8b 40 08             	mov    0x8(%eax),%eax
c0103abc:	83 ec 0c             	sub    $0xc,%esp
c0103abf:	50                   	push   %eax
c0103ac0:	e8 5b c9 ff ff       	call   c0100420 <update_cr3>
c0103ac5:	83 c4 10             	add    $0x10,%esp
c0103ac8:	eb 0f                	jmp    c0103ad9 <schedule_process+0xf1>
c0103aca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103acd:	83 ec 0c             	sub    $0xc,%esp
c0103ad0:	50                   	push   %eax
c0103ad1:	e8 4a c9 ff ff       	call   c0100420 <update_cr3>
c0103ad6:	83 c4 10             	add    $0x10,%esp
c0103ad9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103adc:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103ae1:	83 ec 08             	sub    $0x8,%esp
c0103ae4:	ff 75 e8             	pushl  -0x18(%ebp)
c0103ae7:	ff 75 f0             	pushl  -0x10(%ebp)
c0103aea:	e8 c1 68 00 00       	call   c010a3b0 <switch_to>
c0103aef:	83 c4 10             	add    $0x10,%esp
c0103af2:	90                   	nop
c0103af3:	c9                   	leave  
c0103af4:	c3                   	ret    

c0103af5 <clock_handler>:
c0103af5:	55                   	push   %ebp
c0103af6:	89 e5                	mov    %esp,%ebp
c0103af8:	83 ec 18             	sub    $0x18,%esp
c0103afb:	e8 3c c9 ff ff       	call   c010043c <get_running_thread_pcb>
c0103b00:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103b03:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0103b08:	85 c0                	test   %eax,%eax
c0103b0a:	74 0d                	je     c0103b19 <clock_handler+0x24>
c0103b0c:	83 ec 0c             	sub    $0xc,%esp
c0103b0f:	6a 04                	push   $0x4
c0103b11:	e8 29 60 00 00       	call   c0109b3f <inform_int>
c0103b16:	83 c4 10             	add    $0x10,%esp
c0103b19:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103b1e:	83 f8 64             	cmp    $0x64,%eax
c0103b21:	75 0c                	jne    c0103b2f <clock_handler+0x3a>
c0103b23:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c0103b2a:	00 00 00 
c0103b2d:	eb 0a                	jmp    c0103b39 <clock_handler+0x44>
c0103b2f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103b34:	83 f8 01             	cmp    $0x1,%eax
c0103b37:	75 2a                	jne    c0103b63 <clock_handler+0x6e>
c0103b39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b3c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103b42:	85 c0                	test   %eax,%eax
c0103b44:	74 16                	je     c0103b5c <clock_handler+0x67>
c0103b46:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c0103b4b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103b51:	83 ea 01             	sub    $0x1,%edx
c0103b54:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0103b5a:	eb 08                	jmp    c0103b64 <clock_handler+0x6f>
c0103b5c:	e8 87 fe ff ff       	call   c01039e8 <schedule_process>
c0103b61:	eb 01                	jmp    c0103b64 <clock_handler+0x6f>
c0103b63:	90                   	nop
c0103b64:	c9                   	leave  
c0103b65:	c3                   	ret    

c0103b66 <pid2proc>:
c0103b66:	55                   	push   %ebp
c0103b67:	89 e5                	mov    %esp,%ebp
c0103b69:	83 ec 20             	sub    $0x20,%esp
c0103b6c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103b73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103b7a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c0103b7f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103b85:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103b88:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103b8b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103b90:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103b96:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103b99:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0103b9c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103ba1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103ba4:	eb 36                	jmp    c0103bdc <pid2proc+0x76>
c0103ba6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ba9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103bae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103bb1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103bb5:	75 07                	jne    c0103bbe <pid2proc+0x58>
c0103bb7:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c0103bbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103bc1:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103bc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bca:	39 c2                	cmp    %eax,%edx
c0103bcc:	75 05                	jne    c0103bd3 <pid2proc+0x6d>
c0103bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103bd1:	eb 17                	jmp    c0103bea <pid2proc+0x84>
c0103bd3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bd6:	8b 40 04             	mov    0x4(%eax),%eax
c0103bd9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103bdc:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103be3:	75 c1                	jne    c0103ba6 <pid2proc+0x40>
c0103be5:	b8 00 00 00 00       	mov    $0x0,%eax
c0103bea:	c9                   	leave  
c0103beb:	c3                   	ret    

c0103bec <proc2pid>:
c0103bec:	55                   	push   %ebp
c0103bed:	89 e5                	mov    %esp,%ebp
c0103bef:	83 ec 10             	sub    $0x10,%esp
c0103bf2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bf5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0103bfb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103bfe:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c01:	c9                   	leave  
c0103c02:	c3                   	ret    

c0103c03 <InitDescriptor>:
c0103c03:	55                   	push   %ebp
c0103c04:	89 e5                	mov    %esp,%ebp
c0103c06:	83 ec 04             	sub    $0x4,%esp
c0103c09:	8b 45 14             	mov    0x14(%ebp),%eax
c0103c0c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103c10:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c13:	89 c2                	mov    %eax,%edx
c0103c15:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c18:	66 89 10             	mov    %dx,(%eax)
c0103c1b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c1e:	89 c2                	mov    %eax,%edx
c0103c20:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c23:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103c27:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c2a:	c1 e8 10             	shr    $0x10,%eax
c0103c2d:	89 c2                	mov    %eax,%edx
c0103c2f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c32:	88 50 04             	mov    %dl,0x4(%eax)
c0103c35:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103c39:	89 c2                	mov    %eax,%edx
c0103c3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c3e:	88 50 05             	mov    %dl,0x5(%eax)
c0103c41:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103c45:	66 c1 e8 08          	shr    $0x8,%ax
c0103c49:	c1 e0 04             	shl    $0x4,%eax
c0103c4c:	89 c2                	mov    %eax,%edx
c0103c4e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c51:	c1 e8 10             	shr    $0x10,%eax
c0103c54:	83 e0 0f             	and    $0xf,%eax
c0103c57:	09 c2                	or     %eax,%edx
c0103c59:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c5c:	88 50 06             	mov    %dl,0x6(%eax)
c0103c5f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c62:	c1 e8 18             	shr    $0x18,%eax
c0103c65:	89 c2                	mov    %eax,%edx
c0103c67:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c6a:	88 50 07             	mov    %dl,0x7(%eax)
c0103c6d:	90                   	nop
c0103c6e:	c9                   	leave  
c0103c6f:	c3                   	ret    

c0103c70 <Seg2PhyAddr>:
c0103c70:	55                   	push   %ebp
c0103c71:	89 e5                	mov    %esp,%ebp
c0103c73:	83 ec 10             	sub    $0x10,%esp
c0103c76:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c79:	c1 e8 03             	shr    $0x3,%eax
c0103c7c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103c83:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c0103c8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103c8d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103c90:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103c94:	0f b7 c0             	movzwl %ax,%eax
c0103c97:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103c9b:	0f b6 d2             	movzbl %dl,%edx
c0103c9e:	c1 e2 10             	shl    $0x10,%edx
c0103ca1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103ca7:	09 d0                	or     %edx,%eax
c0103ca9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103cac:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103caf:	c9                   	leave  
c0103cb0:	c3                   	ret    

c0103cb1 <Seg2PhyAddrLDT>:
c0103cb1:	55                   	push   %ebp
c0103cb2:	89 e5                	mov    %esp,%ebp
c0103cb4:	83 ec 10             	sub    $0x10,%esp
c0103cb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cba:	c1 e8 03             	shr    $0x3,%eax
c0103cbd:	89 c2                	mov    %eax,%edx
c0103cbf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103cc2:	83 c2 20             	add    $0x20,%edx
c0103cc5:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103cc9:	8b 02                	mov    (%edx),%eax
c0103ccb:	8b 52 04             	mov    0x4(%edx),%edx
c0103cce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103cd1:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103cd4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103cd8:	0f b7 c0             	movzwl %ax,%eax
c0103cdb:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103cdf:	0f b6 d2             	movzbl %dl,%edx
c0103ce2:	c1 e2 10             	shl    $0x10,%edx
c0103ce5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103ceb:	09 d0                	or     %edx,%eax
c0103ced:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103cf0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103cf3:	c9                   	leave  
c0103cf4:	c3                   	ret    

c0103cf5 <VirAddr2PhyAddr>:
c0103cf5:	55                   	push   %ebp
c0103cf6:	89 e5                	mov    %esp,%ebp
c0103cf8:	83 ec 10             	sub    $0x10,%esp
c0103cfb:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103cfe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d01:	01 d0                	add    %edx,%eax
c0103d03:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103d06:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103d09:	c9                   	leave  
c0103d0a:	c3                   	ret    

c0103d0b <v2l>:
c0103d0b:	55                   	push   %ebp
c0103d0c:	89 e5                	mov    %esp,%ebp
c0103d0e:	83 ec 18             	sub    $0x18,%esp
c0103d11:	83 ec 0c             	sub    $0xc,%esp
c0103d14:	ff 75 08             	pushl  0x8(%ebp)
c0103d17:	e8 4a fe ff ff       	call   c0103b66 <pid2proc>
c0103d1c:	83 c4 10             	add    $0x10,%esp
c0103d1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103d22:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103d29:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103d2c:	83 ec 08             	sub    $0x8,%esp
c0103d2f:	ff 75 f4             	pushl  -0xc(%ebp)
c0103d32:	50                   	push   %eax
c0103d33:	e8 79 ff ff ff       	call   c0103cb1 <Seg2PhyAddrLDT>
c0103d38:	83 c4 10             	add    $0x10,%esp
c0103d3b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103d3e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103d41:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d44:	01 d0                	add    %edx,%eax
c0103d46:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103d49:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103d4c:	c9                   	leave  
c0103d4d:	c3                   	ret    

c0103d4e <init_propt>:
c0103d4e:	55                   	push   %ebp
c0103d4f:	89 e5                	mov    %esp,%ebp
c0103d51:	83 ec 38             	sub    $0x38,%esp
c0103d54:	6a 0e                	push   $0xe
c0103d56:	6a 08                	push   $0x8
c0103d58:	68 be 01 10 c0       	push   $0xc01001be
c0103d5d:	6a 20                	push   $0x20
c0103d5f:	e8 6b 01 00 00       	call   c0103ecf <InitInterruptDesc>
c0103d64:	83 c4 10             	add    $0x10,%esp
c0103d67:	6a 0e                	push   $0xe
c0103d69:	6a 08                	push   $0x8
c0103d6b:	68 ee 01 10 c0       	push   $0xc01001ee
c0103d70:	6a 21                	push   $0x21
c0103d72:	e8 58 01 00 00       	call   c0103ecf <InitInterruptDesc>
c0103d77:	83 c4 10             	add    $0x10,%esp
c0103d7a:	6a 0e                	push   $0xe
c0103d7c:	6a 08                	push   $0x8
c0103d7e:	68 31 02 10 c0       	push   $0xc0100231
c0103d83:	6a 2e                	push   $0x2e
c0103d85:	e8 45 01 00 00       	call   c0103ecf <InitInterruptDesc>
c0103d8a:	83 c4 10             	add    $0x10,%esp
c0103d8d:	6a 0e                	push   $0xe
c0103d8f:	6a 08                	push   $0x8
c0103d91:	68 77 02 10 c0       	push   $0xc0100277
c0103d96:	6a 2a                	push   $0x2a
c0103d98:	e8 32 01 00 00       	call   c0103ecf <InitInterruptDesc>
c0103d9d:	83 c4 10             	add    $0x10,%esp
c0103da0:	83 ec 04             	sub    $0x4,%esp
c0103da3:	68 e0 15 00 00       	push   $0x15e0
c0103da8:	6a 00                	push   $0x0
c0103daa:	68 00 22 18 c0       	push   $0xc0182200
c0103daf:	e8 9b 84 00 00       	call   c010c24f <Memset>
c0103db4:	83 c4 10             	add    $0x10,%esp
c0103db7:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103dbe:	83 ec 04             	sub    $0x4,%esp
c0103dc1:	ff 75 f4             	pushl  -0xc(%ebp)
c0103dc4:	6a 00                	push   $0x0
c0103dc6:	68 40 06 11 c0       	push   $0xc0110640
c0103dcb:	e8 7f 84 00 00       	call   c010c24f <Memset>
c0103dd0:	83 c4 10             	add    $0x10,%esp
c0103dd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103dd6:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103ddb:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103de2:	00 00 00 
c0103de5:	83 ec 0c             	sub    $0xc,%esp
c0103de8:	6a 30                	push   $0x30
c0103dea:	e8 81 fe ff ff       	call   c0103c70 <Seg2PhyAddr>
c0103def:	83 c4 10             	add    $0x10,%esp
c0103df2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103df5:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103dfc:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103e03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103e06:	0f b7 d0             	movzwl %ax,%edx
c0103e09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103e0c:	83 e8 01             	sub    $0x1,%eax
c0103e0f:	89 c1                	mov    %eax,%ecx
c0103e11:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103e14:	52                   	push   %edx
c0103e15:	51                   	push   %ecx
c0103e16:	50                   	push   %eax
c0103e17:	68 00 f8 10 c0       	push   $0xc010f800
c0103e1c:	e8 e2 fd ff ff       	call   c0103c03 <InitDescriptor>
c0103e21:	83 c4 10             	add    $0x10,%esp
c0103e24:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103e2b:	68 f2 00 00 00       	push   $0xf2
c0103e30:	68 ff ff 00 00       	push   $0xffff
c0103e35:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103e38:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103e3d:	e8 c1 fd ff ff       	call   c0103c03 <InitDescriptor>
c0103e42:	83 c4 10             	add    $0x10,%esp
c0103e45:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103e4c:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103e53:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103e5a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103e5d:	0f b7 c0             	movzwl %ax,%eax
c0103e60:	50                   	push   %eax
c0103e61:	ff 75 d8             	pushl  -0x28(%ebp)
c0103e64:	6a 00                	push   $0x0
c0103e66:	68 08 f8 10 c0       	push   $0xc010f808
c0103e6b:	e8 93 fd ff ff       	call   c0103c03 <InitDescriptor>
c0103e70:	83 c4 10             	add    $0x10,%esp
c0103e73:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103e76:	0f b7 c0             	movzwl %ax,%eax
c0103e79:	50                   	push   %eax
c0103e7a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103e7d:	6a 00                	push   $0x0
c0103e7f:	68 10 f8 10 c0       	push   $0xc010f810
c0103e84:	e8 7a fd ff ff       	call   c0103c03 <InitDescriptor>
c0103e89:	83 c4 10             	add    $0x10,%esp
c0103e8c:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103e93:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103e9a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103e9d:	0f b7 c0             	movzwl %ax,%eax
c0103ea0:	50                   	push   %eax
c0103ea1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103ea4:	6a 00                	push   $0x0
c0103ea6:	68 18 f8 10 c0       	push   $0xc010f818
c0103eab:	e8 53 fd ff ff       	call   c0103c03 <InitDescriptor>
c0103eb0:	83 c4 10             	add    $0x10,%esp
c0103eb3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103eb6:	0f b7 c0             	movzwl %ax,%eax
c0103eb9:	50                   	push   %eax
c0103eba:	ff 75 d8             	pushl  -0x28(%ebp)
c0103ebd:	6a 00                	push   $0x0
c0103ebf:	68 20 f8 10 c0       	push   $0xc010f820
c0103ec4:	e8 3a fd ff ff       	call   c0103c03 <InitDescriptor>
c0103ec9:	83 c4 10             	add    $0x10,%esp
c0103ecc:	90                   	nop
c0103ecd:	c9                   	leave  
c0103ece:	c3                   	ret    

c0103ecf <InitInterruptDesc>:
c0103ecf:	55                   	push   %ebp
c0103ed0:	89 e5                	mov    %esp,%ebp
c0103ed2:	83 ec 10             	sub    $0x10,%esp
c0103ed5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ed8:	c1 e0 03             	shl    $0x3,%eax
c0103edb:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103ee0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103ee3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ee6:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103eea:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103eed:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103ef0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103ef3:	89 c2                	mov    %eax,%edx
c0103ef5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ef8:	66 89 10             	mov    %dx,(%eax)
c0103efb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103efe:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103f04:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103f07:	c1 f8 10             	sar    $0x10,%eax
c0103f0a:	89 c2                	mov    %eax,%edx
c0103f0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103f0f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103f13:	8b 45 10             	mov    0x10(%ebp),%eax
c0103f16:	c1 e0 04             	shl    $0x4,%eax
c0103f19:	89 c2                	mov    %eax,%edx
c0103f1b:	8b 45 14             	mov    0x14(%ebp),%eax
c0103f1e:	09 d0                	or     %edx,%eax
c0103f20:	89 c2                	mov    %eax,%edx
c0103f22:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103f25:	88 50 05             	mov    %dl,0x5(%eax)
c0103f28:	90                   	nop
c0103f29:	c9                   	leave  
c0103f2a:	c3                   	ret    

c0103f2b <ReloadGDT>:
c0103f2b:	55                   	push   %ebp
c0103f2c:	89 e5                	mov    %esp,%ebp
c0103f2e:	83 ec 28             	sub    $0x28,%esp
c0103f31:	b8 d4 06 11 c0       	mov    $0xc01106d4,%eax
c0103f36:	0f b7 00             	movzwl (%eax),%eax
c0103f39:	98                   	cwtl   
c0103f3a:	ba d6 06 11 c0       	mov    $0xc01106d6,%edx
c0103f3f:	8b 12                	mov    (%edx),%edx
c0103f41:	83 ec 04             	sub    $0x4,%esp
c0103f44:	50                   	push   %eax
c0103f45:	52                   	push   %edx
c0103f46:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103f4b:	e8 d1 82 00 00       	call   c010c221 <Memcpy2>
c0103f50:	83 c4 10             	add    $0x10,%esp
c0103f53:	c7 45 f0 d4 06 11 c0 	movl   $0xc01106d4,-0x10(%ebp)
c0103f5a:	c7 45 ec d6 06 11 c0 	movl   $0xc01106d6,-0x14(%ebp)
c0103f61:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103f64:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103f69:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103f6e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103f71:	89 10                	mov    %edx,(%eax)
c0103f73:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103f7a:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103f81:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103f84:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103f89:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103f8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103f91:	89 10                	mov    %edx,(%eax)
c0103f93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103f9a:	eb 04                	jmp    c0103fa0 <ReloadGDT+0x75>
c0103f9c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103fa0:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103fa7:	7e f3                	jle    c0103f9c <ReloadGDT+0x71>
c0103fa9:	e8 a9 37 00 00       	call   c0107757 <init_internal_interrupt>
c0103fae:	e8 9b fd ff ff       	call   c0103d4e <init_propt>
c0103fb3:	90                   	nop
c0103fb4:	c9                   	leave  
c0103fb5:	c3                   	ret    

c0103fb6 <select_console>:
c0103fb6:	55                   	push   %ebp
c0103fb7:	89 e5                	mov    %esp,%ebp
c0103fb9:	83 ec 18             	sub    $0x18,%esp
c0103fbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fbf:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103fc2:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103fc6:	75 27                	jne    c0103fef <select_console+0x39>
c0103fc8:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103fcc:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103fd2:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103fd7:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103fdc:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103fe1:	83 ec 0c             	sub    $0xc,%esp
c0103fe4:	50                   	push   %eax
c0103fe5:	e8 08 00 00 00       	call   c0103ff2 <flush>
c0103fea:	83 c4 10             	add    $0x10,%esp
c0103fed:	eb 01                	jmp    c0103ff0 <select_console+0x3a>
c0103fef:	90                   	nop
c0103ff0:	c9                   	leave  
c0103ff1:	c3                   	ret    

c0103ff2 <flush>:
c0103ff2:	55                   	push   %ebp
c0103ff3:	89 e5                	mov    %esp,%ebp
c0103ff5:	83 ec 08             	sub    $0x8,%esp
c0103ff8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ffb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104001:	8b 40 0c             	mov    0xc(%eax),%eax
c0104004:	83 ec 0c             	sub    $0xc,%esp
c0104007:	50                   	push   %eax
c0104008:	e8 1e 00 00 00       	call   c010402b <set_cursor>
c010400d:	83 c4 10             	add    $0x10,%esp
c0104010:	8b 45 08             	mov    0x8(%ebp),%eax
c0104013:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104019:	8b 40 08             	mov    0x8(%eax),%eax
c010401c:	83 ec 0c             	sub    $0xc,%esp
c010401f:	50                   	push   %eax
c0104020:	e8 64 00 00 00       	call   c0104089 <set_console_start_video_addr>
c0104025:	83 c4 10             	add    $0x10,%esp
c0104028:	90                   	nop
c0104029:	c9                   	leave  
c010402a:	c3                   	ret    

c010402b <set_cursor>:
c010402b:	55                   	push   %ebp
c010402c:	89 e5                	mov    %esp,%ebp
c010402e:	83 ec 08             	sub    $0x8,%esp
c0104031:	83 ec 08             	sub    $0x8,%esp
c0104034:	6a 0e                	push   $0xe
c0104036:	68 d4 03 00 00       	push   $0x3d4
c010403b:	e8 fe c2 ff ff       	call   c010033e <out_byte>
c0104040:	83 c4 10             	add    $0x10,%esp
c0104043:	8b 45 08             	mov    0x8(%ebp),%eax
c0104046:	c1 e8 08             	shr    $0x8,%eax
c0104049:	0f b7 c0             	movzwl %ax,%eax
c010404c:	83 ec 08             	sub    $0x8,%esp
c010404f:	50                   	push   %eax
c0104050:	68 d5 03 00 00       	push   $0x3d5
c0104055:	e8 e4 c2 ff ff       	call   c010033e <out_byte>
c010405a:	83 c4 10             	add    $0x10,%esp
c010405d:	83 ec 08             	sub    $0x8,%esp
c0104060:	6a 0f                	push   $0xf
c0104062:	68 d4 03 00 00       	push   $0x3d4
c0104067:	e8 d2 c2 ff ff       	call   c010033e <out_byte>
c010406c:	83 c4 10             	add    $0x10,%esp
c010406f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104072:	0f b7 c0             	movzwl %ax,%eax
c0104075:	83 ec 08             	sub    $0x8,%esp
c0104078:	50                   	push   %eax
c0104079:	68 d5 03 00 00       	push   $0x3d5
c010407e:	e8 bb c2 ff ff       	call   c010033e <out_byte>
c0104083:	83 c4 10             	add    $0x10,%esp
c0104086:	90                   	nop
c0104087:	c9                   	leave  
c0104088:	c3                   	ret    

c0104089 <set_console_start_video_addr>:
c0104089:	55                   	push   %ebp
c010408a:	89 e5                	mov    %esp,%ebp
c010408c:	83 ec 08             	sub    $0x8,%esp
c010408f:	83 ec 08             	sub    $0x8,%esp
c0104092:	6a 0c                	push   $0xc
c0104094:	68 d4 03 00 00       	push   $0x3d4
c0104099:	e8 a0 c2 ff ff       	call   c010033e <out_byte>
c010409e:	83 c4 10             	add    $0x10,%esp
c01040a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01040a4:	c1 e8 08             	shr    $0x8,%eax
c01040a7:	0f b7 c0             	movzwl %ax,%eax
c01040aa:	83 ec 08             	sub    $0x8,%esp
c01040ad:	50                   	push   %eax
c01040ae:	68 d5 03 00 00       	push   $0x3d5
c01040b3:	e8 86 c2 ff ff       	call   c010033e <out_byte>
c01040b8:	83 c4 10             	add    $0x10,%esp
c01040bb:	83 ec 08             	sub    $0x8,%esp
c01040be:	6a 0d                	push   $0xd
c01040c0:	68 d4 03 00 00       	push   $0x3d4
c01040c5:	e8 74 c2 ff ff       	call   c010033e <out_byte>
c01040ca:	83 c4 10             	add    $0x10,%esp
c01040cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01040d0:	0f b7 c0             	movzwl %ax,%eax
c01040d3:	83 ec 08             	sub    $0x8,%esp
c01040d6:	50                   	push   %eax
c01040d7:	68 d5 03 00 00       	push   $0x3d5
c01040dc:	e8 5d c2 ff ff       	call   c010033e <out_byte>
c01040e1:	83 c4 10             	add    $0x10,%esp
c01040e4:	90                   	nop
c01040e5:	c9                   	leave  
c01040e6:	c3                   	ret    

c01040e7 <put_key>:
c01040e7:	55                   	push   %ebp
c01040e8:	89 e5                	mov    %esp,%ebp
c01040ea:	83 ec 04             	sub    $0x4,%esp
c01040ed:	8b 45 0c             	mov    0xc(%ebp),%eax
c01040f0:	88 45 fc             	mov    %al,-0x4(%ebp)
c01040f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01040f6:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01040fc:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104101:	77 4d                	ja     c0104150 <put_key+0x69>
c0104103:	8b 45 08             	mov    0x8(%ebp),%eax
c0104106:	8b 00                	mov    (%eax),%eax
c0104108:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c010410c:	89 10                	mov    %edx,(%eax)
c010410e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104111:	8b 00                	mov    (%eax),%eax
c0104113:	8d 50 04             	lea    0x4(%eax),%edx
c0104116:	8b 45 08             	mov    0x8(%ebp),%eax
c0104119:	89 10                	mov    %edx,(%eax)
c010411b:	8b 45 08             	mov    0x8(%ebp),%eax
c010411e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104124:	8d 50 01             	lea    0x1(%eax),%edx
c0104127:	8b 45 08             	mov    0x8(%ebp),%eax
c010412a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104130:	8b 45 08             	mov    0x8(%ebp),%eax
c0104133:	8b 00                	mov    (%eax),%eax
c0104135:	8b 55 08             	mov    0x8(%ebp),%edx
c0104138:	83 c2 08             	add    $0x8,%edx
c010413b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0104141:	39 d0                	cmp    %edx,%eax
c0104143:	75 0b                	jne    c0104150 <put_key+0x69>
c0104145:	8b 45 08             	mov    0x8(%ebp),%eax
c0104148:	8d 50 08             	lea    0x8(%eax),%edx
c010414b:	8b 45 08             	mov    0x8(%ebp),%eax
c010414e:	89 10                	mov    %edx,(%eax)
c0104150:	90                   	nop
c0104151:	c9                   	leave  
c0104152:	c3                   	ret    

c0104153 <scroll_up>:
c0104153:	55                   	push   %ebp
c0104154:	89 e5                	mov    %esp,%ebp
c0104156:	83 ec 08             	sub    $0x8,%esp
c0104159:	8b 45 08             	mov    0x8(%ebp),%eax
c010415c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104162:	8b 40 08             	mov    0x8(%eax),%eax
c0104165:	8d 50 b0             	lea    -0x50(%eax),%edx
c0104168:	8b 45 08             	mov    0x8(%ebp),%eax
c010416b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104171:	8b 00                	mov    (%eax),%eax
c0104173:	39 c2                	cmp    %eax,%edx
c0104175:	76 1b                	jbe    c0104192 <scroll_up+0x3f>
c0104177:	8b 45 08             	mov    0x8(%ebp),%eax
c010417a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104180:	8b 40 08             	mov    0x8(%eax),%eax
c0104183:	83 e8 50             	sub    $0x50,%eax
c0104186:	83 ec 0c             	sub    $0xc,%esp
c0104189:	50                   	push   %eax
c010418a:	e8 fa fe ff ff       	call   c0104089 <set_console_start_video_addr>
c010418f:	83 c4 10             	add    $0x10,%esp
c0104192:	90                   	nop
c0104193:	c9                   	leave  
c0104194:	c3                   	ret    

c0104195 <scroll_down>:
c0104195:	55                   	push   %ebp
c0104196:	89 e5                	mov    %esp,%ebp
c0104198:	83 ec 08             	sub    $0x8,%esp
c010419b:	8b 45 08             	mov    0x8(%ebp),%eax
c010419e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041a4:	8b 40 08             	mov    0x8(%eax),%eax
c01041a7:	8d 48 50             	lea    0x50(%eax),%ecx
c01041aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ad:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041b3:	8b 10                	mov    (%eax),%edx
c01041b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01041b8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041be:	8b 40 04             	mov    0x4(%eax),%eax
c01041c1:	01 d0                	add    %edx,%eax
c01041c3:	39 c1                	cmp    %eax,%ecx
c01041c5:	73 36                	jae    c01041fd <scroll_down+0x68>
c01041c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041d0:	8b 40 08             	mov    0x8(%eax),%eax
c01041d3:	83 c0 50             	add    $0x50,%eax
c01041d6:	83 ec 0c             	sub    $0xc,%esp
c01041d9:	50                   	push   %eax
c01041da:	e8 aa fe ff ff       	call   c0104089 <set_console_start_video_addr>
c01041df:	83 c4 10             	add    $0x10,%esp
c01041e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01041e5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041eb:	8b 50 08             	mov    0x8(%eax),%edx
c01041ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01041f1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041f7:	83 c2 50             	add    $0x50,%edx
c01041fa:	89 50 08             	mov    %edx,0x8(%eax)
c01041fd:	90                   	nop
c01041fe:	c9                   	leave  
c01041ff:	c3                   	ret    

c0104200 <out_char>:
c0104200:	55                   	push   %ebp
c0104201:	89 e5                	mov    %esp,%ebp
c0104203:	83 ec 28             	sub    $0x28,%esp
c0104206:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104209:	88 45 e4             	mov    %al,-0x1c(%ebp)
c010420c:	e8 a7 2d 00 00       	call   c0106fb8 <intr_disable>
c0104211:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104214:	8b 45 08             	mov    0x8(%ebp),%eax
c0104217:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010421d:	8b 40 0c             	mov    0xc(%eax),%eax
c0104220:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0104225:	01 c0                	add    %eax,%eax
c0104227:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010422a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c010422e:	83 f8 08             	cmp    $0x8,%eax
c0104231:	0f 84 8d 00 00 00    	je     c01042c4 <out_char+0xc4>
c0104237:	83 f8 0a             	cmp    $0xa,%eax
c010423a:	0f 85 c9 00 00 00    	jne    c0104309 <out_char+0x109>
c0104240:	8b 45 08             	mov    0x8(%ebp),%eax
c0104243:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104249:	8b 50 0c             	mov    0xc(%eax),%edx
c010424c:	8b 45 08             	mov    0x8(%ebp),%eax
c010424f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104255:	8b 08                	mov    (%eax),%ecx
c0104257:	8b 45 08             	mov    0x8(%ebp),%eax
c010425a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104260:	8b 40 04             	mov    0x4(%eax),%eax
c0104263:	01 c8                	add    %ecx,%eax
c0104265:	83 e8 50             	sub    $0x50,%eax
c0104268:	39 c2                	cmp    %eax,%edx
c010426a:	0f 83 f4 00 00 00    	jae    c0104364 <out_char+0x164>
c0104270:	8b 45 08             	mov    0x8(%ebp),%eax
c0104273:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104279:	8b 08                	mov    (%eax),%ecx
c010427b:	8b 45 08             	mov    0x8(%ebp),%eax
c010427e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104284:	8b 50 0c             	mov    0xc(%eax),%edx
c0104287:	8b 45 08             	mov    0x8(%ebp),%eax
c010428a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104290:	8b 00                	mov    (%eax),%eax
c0104292:	29 c2                	sub    %eax,%edx
c0104294:	89 d0                	mov    %edx,%eax
c0104296:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c010429b:	f7 e2                	mul    %edx
c010429d:	89 d0                	mov    %edx,%eax
c010429f:	c1 e8 06             	shr    $0x6,%eax
c01042a2:	8d 50 01             	lea    0x1(%eax),%edx
c01042a5:	89 d0                	mov    %edx,%eax
c01042a7:	c1 e0 02             	shl    $0x2,%eax
c01042aa:	01 d0                	add    %edx,%eax
c01042ac:	c1 e0 04             	shl    $0x4,%eax
c01042af:	89 c2                	mov    %eax,%edx
c01042b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01042b4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01042ba:	01 ca                	add    %ecx,%edx
c01042bc:	89 50 0c             	mov    %edx,0xc(%eax)
c01042bf:	e9 a0 00 00 00       	jmp    c0104364 <out_char+0x164>
c01042c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01042c7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01042cd:	8b 50 0c             	mov    0xc(%eax),%edx
c01042d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01042d3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01042d9:	8b 00                	mov    (%eax),%eax
c01042db:	39 c2                	cmp    %eax,%edx
c01042dd:	0f 86 84 00 00 00    	jbe    c0104367 <out_char+0x167>
c01042e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01042e6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01042ec:	8b 50 0c             	mov    0xc(%eax),%edx
c01042ef:	83 ea 01             	sub    $0x1,%edx
c01042f2:	89 50 0c             	mov    %edx,0xc(%eax)
c01042f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01042f8:	83 e8 02             	sub    $0x2,%eax
c01042fb:	c6 00 20             	movb   $0x20,(%eax)
c01042fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104301:	83 e8 01             	sub    $0x1,%eax
c0104304:	c6 00 00             	movb   $0x0,(%eax)
c0104307:	eb 5e                	jmp    c0104367 <out_char+0x167>
c0104309:	8b 45 08             	mov    0x8(%ebp),%eax
c010430c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104312:	8b 40 0c             	mov    0xc(%eax),%eax
c0104315:	8d 48 01             	lea    0x1(%eax),%ecx
c0104318:	8b 45 08             	mov    0x8(%ebp),%eax
c010431b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104321:	8b 10                	mov    (%eax),%edx
c0104323:	8b 45 08             	mov    0x8(%ebp),%eax
c0104326:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010432c:	8b 40 04             	mov    0x4(%eax),%eax
c010432f:	01 d0                	add    %edx,%eax
c0104331:	39 c1                	cmp    %eax,%ecx
c0104333:	73 35                	jae    c010436a <out_char+0x16a>
c0104335:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104338:	8d 50 01             	lea    0x1(%eax),%edx
c010433b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010433e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0104342:	88 10                	mov    %dl,(%eax)
c0104344:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104347:	8d 50 01             	lea    0x1(%eax),%edx
c010434a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010434d:	c6 00 0a             	movb   $0xa,(%eax)
c0104350:	8b 45 08             	mov    0x8(%ebp),%eax
c0104353:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104359:	8b 50 0c             	mov    0xc(%eax),%edx
c010435c:	83 c2 01             	add    $0x1,%edx
c010435f:	89 50 0c             	mov    %edx,0xc(%eax)
c0104362:	eb 06                	jmp    c010436a <out_char+0x16a>
c0104364:	90                   	nop
c0104365:	eb 14                	jmp    c010437b <out_char+0x17b>
c0104367:	90                   	nop
c0104368:	eb 11                	jmp    c010437b <out_char+0x17b>
c010436a:	90                   	nop
c010436b:	eb 0e                	jmp    c010437b <out_char+0x17b>
c010436d:	83 ec 0c             	sub    $0xc,%esp
c0104370:	ff 75 08             	pushl  0x8(%ebp)
c0104373:	e8 1d fe ff ff       	call   c0104195 <scroll_down>
c0104378:	83 c4 10             	add    $0x10,%esp
c010437b:	8b 45 08             	mov    0x8(%ebp),%eax
c010437e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104384:	8b 50 0c             	mov    0xc(%eax),%edx
c0104387:	8b 45 08             	mov    0x8(%ebp),%eax
c010438a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104390:	8b 40 08             	mov    0x8(%eax),%eax
c0104393:	29 c2                	sub    %eax,%edx
c0104395:	89 d0                	mov    %edx,%eax
c0104397:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c010439c:	77 cf                	ja     c010436d <out_char+0x16d>
c010439e:	83 ec 0c             	sub    $0xc,%esp
c01043a1:	ff 75 08             	pushl  0x8(%ebp)
c01043a4:	e8 49 fc ff ff       	call   c0103ff2 <flush>
c01043a9:	83 c4 10             	add    $0x10,%esp
c01043ac:	83 ec 0c             	sub    $0xc,%esp
c01043af:	ff 75 f4             	pushl  -0xc(%ebp)
c01043b2:	e8 2a 2c 00 00       	call   c0106fe1 <intr_set_status>
c01043b7:	83 c4 10             	add    $0x10,%esp
c01043ba:	90                   	nop
c01043bb:	c9                   	leave  
c01043bc:	c3                   	ret    

c01043bd <tty_dev_read>:
c01043bd:	55                   	push   %ebp
c01043be:	89 e5                	mov    %esp,%ebp
c01043c0:	83 ec 08             	sub    $0x8,%esp
c01043c3:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01043c8:	39 45 08             	cmp    %eax,0x8(%ebp)
c01043cb:	75 17                	jne    c01043e4 <tty_dev_read+0x27>
c01043cd:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01043d2:	85 c0                	test   %eax,%eax
c01043d4:	7e 0e                	jle    c01043e4 <tty_dev_read+0x27>
c01043d6:	83 ec 0c             	sub    $0xc,%esp
c01043d9:	ff 75 08             	pushl  0x8(%ebp)
c01043dc:	e8 89 07 00 00       	call   c0104b6a <keyboard_read>
c01043e1:	83 c4 10             	add    $0x10,%esp
c01043e4:	90                   	nop
c01043e5:	c9                   	leave  
c01043e6:	c3                   	ret    

c01043e7 <tty_dev_write>:
c01043e7:	55                   	push   %ebp
c01043e8:	89 e5                	mov    %esp,%ebp
c01043ea:	83 ec 28             	sub    $0x28,%esp
c01043ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01043f0:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01043f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01043f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104400:	e9 88 01 00 00       	jmp    c010458d <tty_dev_write+0x1a6>
c0104405:	8b 45 08             	mov    0x8(%ebp),%eax
c0104408:	8b 40 04             	mov    0x4(%eax),%eax
c010440b:	8b 00                	mov    (%eax),%eax
c010440d:	88 45 e7             	mov    %al,-0x19(%ebp)
c0104410:	8b 45 08             	mov    0x8(%ebp),%eax
c0104413:	8b 40 04             	mov    0x4(%eax),%eax
c0104416:	8d 50 04             	lea    0x4(%eax),%edx
c0104419:	8b 45 08             	mov    0x8(%ebp),%eax
c010441c:	89 50 04             	mov    %edx,0x4(%eax)
c010441f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104422:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104428:	8d 50 ff             	lea    -0x1(%eax),%edx
c010442b:	8b 45 08             	mov    0x8(%ebp),%eax
c010442e:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104434:	8b 45 08             	mov    0x8(%ebp),%eax
c0104437:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010443d:	8d 50 01             	lea    0x1(%eax),%edx
c0104440:	8b 45 08             	mov    0x8(%ebp),%eax
c0104443:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104449:	8b 45 08             	mov    0x8(%ebp),%eax
c010444c:	8b 40 04             	mov    0x4(%eax),%eax
c010444f:	8b 55 08             	mov    0x8(%ebp),%edx
c0104452:	83 c2 08             	add    $0x8,%edx
c0104455:	81 c2 00 08 00 00    	add    $0x800,%edx
c010445b:	39 d0                	cmp    %edx,%eax
c010445d:	75 0c                	jne    c010446b <tty_dev_write+0x84>
c010445f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104462:	8d 50 08             	lea    0x8(%eax),%edx
c0104465:	8b 45 08             	mov    0x8(%ebp),%eax
c0104468:	89 50 04             	mov    %edx,0x4(%eax)
c010446b:	8b 45 08             	mov    0x8(%ebp),%eax
c010446e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104474:	85 c0                	test   %eax,%eax
c0104476:	0f 84 11 01 00 00    	je     c010458d <tty_dev_write+0x1a6>
c010447c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104480:	3c 20                	cmp    $0x20,%al
c0104482:	76 08                	jbe    c010448c <tty_dev_write+0xa5>
c0104484:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104488:	3c 7e                	cmp    $0x7e,%al
c010448a:	76 10                	jbe    c010449c <tty_dev_write+0xb5>
c010448c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104490:	3c 20                	cmp    $0x20,%al
c0104492:	74 08                	je     c010449c <tty_dev_write+0xb5>
c0104494:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104498:	84 c0                	test   %al,%al
c010449a:	75 58                	jne    c01044f4 <tty_dev_write+0x10d>
c010449c:	8b 45 08             	mov    0x8(%ebp),%eax
c010449f:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c01044a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01044a8:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01044ae:	01 d0                	add    %edx,%eax
c01044b0:	83 e8 01             	sub    $0x1,%eax
c01044b3:	89 c2                	mov    %eax,%edx
c01044b5:	83 ec 04             	sub    $0x4,%esp
c01044b8:	6a 01                	push   $0x1
c01044ba:	8d 45 e7             	lea    -0x19(%ebp),%eax
c01044bd:	50                   	push   %eax
c01044be:	52                   	push   %edx
c01044bf:	e8 58 2b 00 00       	call   c010701c <Memcpy>
c01044c4:	83 c4 10             	add    $0x10,%esp
c01044c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01044ca:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01044d0:	8d 50 ff             	lea    -0x1(%eax),%edx
c01044d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01044d6:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01044dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01044e0:	0f b6 c0             	movzbl %al,%eax
c01044e3:	83 ec 08             	sub    $0x8,%esp
c01044e6:	50                   	push   %eax
c01044e7:	ff 75 08             	pushl  0x8(%ebp)
c01044ea:	e8 11 fd ff ff       	call   c0104200 <out_char>
c01044ef:	83 c4 10             	add    $0x10,%esp
c01044f2:	eb 7c                	jmp    c0104570 <tty_dev_write+0x189>
c01044f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01044f8:	3c 08                	cmp    $0x8,%al
c01044fa:	75 42                	jne    c010453e <tty_dev_write+0x157>
c01044fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01044ff:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104505:	8d 50 01             	lea    0x1(%eax),%edx
c0104508:	8b 45 08             	mov    0x8(%ebp),%eax
c010450b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104511:	8b 45 08             	mov    0x8(%ebp),%eax
c0104514:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010451a:	8d 50 fe             	lea    -0x2(%eax),%edx
c010451d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104520:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104526:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010452a:	0f b6 c0             	movzbl %al,%eax
c010452d:	83 ec 08             	sub    $0x8,%esp
c0104530:	50                   	push   %eax
c0104531:	ff 75 08             	pushl  0x8(%ebp)
c0104534:	e8 c7 fc ff ff       	call   c0104200 <out_char>
c0104539:	83 c4 10             	add    $0x10,%esp
c010453c:	eb 32                	jmp    c0104570 <tty_dev_write+0x189>
c010453e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104542:	3c 0a                	cmp    $0xa,%al
c0104544:	75 2a                	jne    c0104570 <tty_dev_write+0x189>
c0104546:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010454a:	0f b6 c0             	movzbl %al,%eax
c010454d:	83 ec 08             	sub    $0x8,%esp
c0104550:	50                   	push   %eax
c0104551:	ff 75 08             	pushl  0x8(%ebp)
c0104554:	e8 a7 fc ff ff       	call   c0104200 <out_char>
c0104559:	83 c4 10             	add    $0x10,%esp
c010455c:	8b 45 08             	mov    0x8(%ebp),%eax
c010455f:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0104566:	00 00 00 
c0104569:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104570:	8b 45 08             	mov    0x8(%ebp),%eax
c0104573:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104579:	8b 45 08             	mov    0x8(%ebp),%eax
c010457c:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0104582:	39 c2                	cmp    %eax,%edx
c0104584:	75 07                	jne    c010458d <tty_dev_write+0x1a6>
c0104586:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010458d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104590:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104596:	85 c0                	test   %eax,%eax
c0104598:	0f 85 67 fe ff ff    	jne    c0104405 <tty_dev_write+0x1e>
c010459e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01045a2:	74 6d                	je     c0104611 <tty_dev_write+0x22a>
c01045a4:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c01045ab:	83 ec 0c             	sub    $0xc,%esp
c01045ae:	ff 75 ec             	pushl  -0x14(%ebp)
c01045b1:	e8 b6 d3 ff ff       	call   c010196c <sys_malloc>
c01045b6:	83 c4 10             	add    $0x10,%esp
c01045b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01045bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01045bf:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c01045c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01045c9:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01045cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01045d2:	89 50 60             	mov    %edx,0x60(%eax)
c01045d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01045d8:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c01045de:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01045e1:	89 50 68             	mov    %edx,0x68(%eax)
c01045e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01045e7:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01045ed:	83 ec 04             	sub    $0x4,%esp
c01045f0:	50                   	push   %eax
c01045f1:	ff 75 e8             	pushl  -0x18(%ebp)
c01045f4:	6a 01                	push   $0x1
c01045f6:	e8 aa 52 00 00       	call   c01098a5 <send_rec>
c01045fb:	83 c4 10             	add    $0x10,%esp
c01045fe:	83 ec 08             	sub    $0x8,%esp
c0104601:	ff 75 ec             	pushl  -0x14(%ebp)
c0104604:	ff 75 e8             	pushl  -0x18(%ebp)
c0104607:	e8 75 d3 ff ff       	call   c0101981 <sys_free>
c010460c:	83 c4 10             	add    $0x10,%esp
c010460f:	eb 01                	jmp    c0104612 <tty_dev_write+0x22b>
c0104611:	90                   	nop
c0104612:	c9                   	leave  
c0104613:	c3                   	ret    

c0104614 <tty_do_read>:
c0104614:	55                   	push   %ebp
c0104615:	89 e5                	mov    %esp,%ebp
c0104617:	83 ec 08             	sub    $0x8,%esp
c010461a:	8b 45 08             	mov    0x8(%ebp),%eax
c010461d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104624:	00 00 00 
c0104627:	8b 45 0c             	mov    0xc(%ebp),%eax
c010462a:	8b 50 68             	mov    0x68(%eax),%edx
c010462d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104630:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104636:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104639:	8b 00                	mov    (%eax),%eax
c010463b:	89 c2                	mov    %eax,%edx
c010463d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104640:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0104646:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104649:	8b 50 60             	mov    0x60(%eax),%edx
c010464c:	8b 45 08             	mov    0x8(%ebp),%eax
c010464f:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104655:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104658:	8b 50 60             	mov    0x60(%eax),%edx
c010465b:	8b 45 08             	mov    0x8(%ebp),%eax
c010465e:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0104664:	8b 45 08             	mov    0x8(%ebp),%eax
c0104667:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c010466d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104670:	8b 40 10             	mov    0x10(%eax),%eax
c0104673:	83 ec 08             	sub    $0x8,%esp
c0104676:	52                   	push   %edx
c0104677:	50                   	push   %eax
c0104678:	e8 32 1b 00 00       	call   c01061af <alloc_virtual_memory>
c010467d:	83 c4 10             	add    $0x10,%esp
c0104680:	89 c2                	mov    %eax,%edx
c0104682:	8b 45 08             	mov    0x8(%ebp),%eax
c0104685:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c010468b:	8b 45 08             	mov    0x8(%ebp),%eax
c010468e:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104694:	83 f8 02             	cmp    $0x2,%eax
c0104697:	74 1c                	je     c01046b5 <tty_do_read+0xa1>
c0104699:	68 3b 01 00 00       	push   $0x13b
c010469e:	68 7d b5 10 c0       	push   $0xc010b57d
c01046a3:	68 7d b5 10 c0       	push   $0xc010b57d
c01046a8:	68 87 b5 10 c0       	push   $0xc010b587
c01046ad:	e8 83 45 00 00       	call   c0108c35 <assertion_failure>
c01046b2:	83 c4 10             	add    $0x10,%esp
c01046b5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01046b8:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c01046bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01046c2:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01046c8:	83 ec 04             	sub    $0x4,%esp
c01046cb:	50                   	push   %eax
c01046cc:	ff 75 0c             	pushl  0xc(%ebp)
c01046cf:	6a 01                	push   $0x1
c01046d1:	e8 cf 51 00 00       	call   c01098a5 <send_rec>
c01046d6:	83 c4 10             	add    $0x10,%esp
c01046d9:	90                   	nop
c01046da:	c9                   	leave  
c01046db:	c3                   	ret    

c01046dc <tty_do_write>:
c01046dc:	55                   	push   %ebp
c01046dd:	89 e5                	mov    %esp,%ebp
c01046df:	53                   	push   %ebx
c01046e0:	83 ec 24             	sub    $0x24,%esp
c01046e3:	89 e0                	mov    %esp,%eax
c01046e5:	89 c3                	mov    %eax,%ebx
c01046e7:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c01046ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01046f1:	8d 50 ff             	lea    -0x1(%eax),%edx
c01046f4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01046f7:	89 c2                	mov    %eax,%edx
c01046f9:	b8 10 00 00 00       	mov    $0x10,%eax
c01046fe:	83 e8 01             	sub    $0x1,%eax
c0104701:	01 d0                	add    %edx,%eax
c0104703:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104708:	ba 00 00 00 00       	mov    $0x0,%edx
c010470d:	f7 f1                	div    %ecx
c010470f:	6b c0 10             	imul   $0x10,%eax,%eax
c0104712:	29 c4                	sub    %eax,%esp
c0104714:	89 e0                	mov    %esp,%eax
c0104716:	83 c0 00             	add    $0x0,%eax
c0104719:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010471c:	83 ec 04             	sub    $0x4,%esp
c010471f:	ff 75 e8             	pushl  -0x18(%ebp)
c0104722:	6a 00                	push   $0x0
c0104724:	ff 75 e0             	pushl  -0x20(%ebp)
c0104727:	e8 23 7b 00 00       	call   c010c24f <Memset>
c010472c:	83 c4 10             	add    $0x10,%esp
c010472f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104732:	8b 40 60             	mov    0x60(%eax),%eax
c0104735:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104738:	8b 45 08             	mov    0x8(%ebp),%eax
c010473b:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104742:	00 00 00 
c0104745:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104748:	8b 45 0c             	mov    0xc(%ebp),%eax
c010474b:	8b 40 10             	mov    0x10(%eax),%eax
c010474e:	83 ec 08             	sub    $0x8,%esp
c0104751:	52                   	push   %edx
c0104752:	50                   	push   %eax
c0104753:	e8 57 1a 00 00       	call   c01061af <alloc_virtual_memory>
c0104758:	83 c4 10             	add    $0x10,%esp
c010475b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010475e:	eb 7e                	jmp    c01047de <tty_do_write+0x102>
c0104760:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104763:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0104766:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c010476a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010476d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104770:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104776:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104779:	01 d0                	add    %edx,%eax
c010477b:	83 ec 04             	sub    $0x4,%esp
c010477e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104781:	50                   	push   %eax
c0104782:	ff 75 e0             	pushl  -0x20(%ebp)
c0104785:	e8 92 28 00 00       	call   c010701c <Memcpy>
c010478a:	83 c4 10             	add    $0x10,%esp
c010478d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104790:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104793:	8b 45 08             	mov    0x8(%ebp),%eax
c0104796:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010479c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010479f:	01 c2                	add    %eax,%edx
c01047a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01047a4:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01047aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01047b1:	eb 25                	jmp    c01047d8 <tty_do_write+0xfc>
c01047b3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01047b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01047b9:	01 d0                	add    %edx,%eax
c01047bb:	0f b6 00             	movzbl (%eax),%eax
c01047be:	0f b6 c0             	movzbl %al,%eax
c01047c1:	83 ec 08             	sub    $0x8,%esp
c01047c4:	50                   	push   %eax
c01047c5:	ff 75 08             	pushl  0x8(%ebp)
c01047c8:	e8 33 fa ff ff       	call   c0104200 <out_char>
c01047cd:	83 c4 10             	add    $0x10,%esp
c01047d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01047d4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c01047d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01047dc:	75 d5                	jne    c01047b3 <tty_do_write+0xd7>
c01047de:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01047e2:	0f 85 78 ff ff ff    	jne    c0104760 <tty_do_write+0x84>
c01047e8:	83 ec 0c             	sub    $0xc,%esp
c01047eb:	6a 7c                	push   $0x7c
c01047ed:	e8 7a d1 ff ff       	call   c010196c <sys_malloc>
c01047f2:	83 c4 10             	add    $0x10,%esp
c01047f5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01047f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01047fb:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104802:	8b 45 08             	mov    0x8(%ebp),%eax
c0104805:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010480b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010480e:	89 50 58             	mov    %edx,0x58(%eax)
c0104811:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104814:	8b 00                	mov    (%eax),%eax
c0104816:	83 ec 04             	sub    $0x4,%esp
c0104819:	50                   	push   %eax
c010481a:	ff 75 d8             	pushl  -0x28(%ebp)
c010481d:	6a 01                	push   $0x1
c010481f:	e8 81 50 00 00       	call   c01098a5 <send_rec>
c0104824:	83 c4 10             	add    $0x10,%esp
c0104827:	83 ec 08             	sub    $0x8,%esp
c010482a:	6a 7c                	push   $0x7c
c010482c:	ff 75 d8             	pushl  -0x28(%ebp)
c010482f:	e8 4d d1 ff ff       	call   c0101981 <sys_free>
c0104834:	83 c4 10             	add    $0x10,%esp
c0104837:	89 dc                	mov    %ebx,%esp
c0104839:	90                   	nop
c010483a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010483d:	c9                   	leave  
c010483e:	c3                   	ret    

c010483f <init_screen>:
c010483f:	55                   	push   %ebp
c0104840:	89 e5                	mov    %esp,%ebp
c0104842:	83 ec 10             	sub    $0x10,%esp
c0104845:	8b 45 08             	mov    0x8(%ebp),%eax
c0104848:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010484d:	c1 f8 03             	sar    $0x3,%eax
c0104850:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104856:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104859:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010485c:	c1 e0 04             	shl    $0x4,%eax
c010485f:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c0104865:	8b 45 08             	mov    0x8(%ebp),%eax
c0104868:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c010486e:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104875:	8b 45 08             	mov    0x8(%ebp),%eax
c0104878:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010487e:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0104881:	89 50 04             	mov    %edx,0x4(%eax)
c0104884:	8b 45 08             	mov    0x8(%ebp),%eax
c0104887:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010488d:	8b 50 04             	mov    0x4(%eax),%edx
c0104890:	8b 45 08             	mov    0x8(%ebp),%eax
c0104893:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104899:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010489d:	89 10                	mov    %edx,(%eax)
c010489f:	8b 45 08             	mov    0x8(%ebp),%eax
c01048a2:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c01048a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01048ab:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01048b1:	8b 12                	mov    (%edx),%edx
c01048b3:	89 50 08             	mov    %edx,0x8(%eax)
c01048b6:	8b 55 08             	mov    0x8(%ebp),%edx
c01048b9:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c01048bf:	8b 40 08             	mov    0x8(%eax),%eax
c01048c2:	89 42 0c             	mov    %eax,0xc(%edx)
c01048c5:	90                   	nop
c01048c6:	c9                   	leave  
c01048c7:	c3                   	ret    

c01048c8 <init_tty>:
c01048c8:	55                   	push   %ebp
c01048c9:	89 e5                	mov    %esp,%ebp
c01048cb:	83 ec 18             	sub    $0x18,%esp
c01048ce:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01048d5:	e9 92 00 00 00       	jmp    c010496c <init_tty+0xa4>
c01048da:	83 ec 04             	sub    $0x4,%esp
c01048dd:	68 28 08 00 00       	push   $0x828
c01048e2:	6a 00                	push   $0x0
c01048e4:	ff 75 f4             	pushl  -0xc(%ebp)
c01048e7:	e8 63 79 00 00       	call   c010c24f <Memset>
c01048ec:	83 c4 10             	add    $0x10,%esp
c01048ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01048f2:	8d 50 08             	lea    0x8(%eax),%edx
c01048f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01048f8:	89 50 04             	mov    %edx,0x4(%eax)
c01048fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01048fe:	8b 50 04             	mov    0x4(%eax),%edx
c0104901:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104904:	89 10                	mov    %edx,(%eax)
c0104906:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104909:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0104910:	00 00 00 
c0104913:	83 ec 0c             	sub    $0xc,%esp
c0104916:	ff 75 f4             	pushl  -0xc(%ebp)
c0104919:	e8 21 ff ff ff       	call   c010483f <init_screen>
c010491e:	83 c4 10             	add    $0x10,%esp
c0104921:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104924:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104929:	85 c0                	test   %eax,%eax
c010492b:	7e 38                	jle    c0104965 <init_tty+0x9d>
c010492d:	83 ec 08             	sub    $0x8,%esp
c0104930:	6a 23                	push   $0x23
c0104932:	ff 75 f4             	pushl  -0xc(%ebp)
c0104935:	e8 c6 f8 ff ff       	call   c0104200 <out_char>
c010493a:	83 c4 10             	add    $0x10,%esp
c010493d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104940:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0104945:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010494a:	c1 f8 03             	sar    $0x3,%eax
c010494d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104953:	0f b6 c0             	movzbl %al,%eax
c0104956:	83 ec 08             	sub    $0x8,%esp
c0104959:	50                   	push   %eax
c010495a:	ff 75 f4             	pushl  -0xc(%ebp)
c010495d:	e8 9e f8 ff ff       	call   c0104200 <out_char>
c0104962:	83 c4 10             	add    $0x10,%esp
c0104965:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010496c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104971:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104974:	0f 82 60 ff ff ff    	jb     c01048da <init_tty+0x12>
c010497a:	90                   	nop
c010497b:	c9                   	leave  
c010497c:	c3                   	ret    

c010497d <TaskTTY>:
c010497d:	55                   	push   %ebp
c010497e:	89 e5                	mov    %esp,%ebp
c0104980:	83 ec 28             	sub    $0x28,%esp
c0104983:	e8 40 ff ff ff       	call   c01048c8 <init_tty>
c0104988:	83 ec 0c             	sub    $0xc,%esp
c010498b:	6a 00                	push   $0x0
c010498d:	e8 24 f6 ff ff       	call   c0103fb6 <select_console>
c0104992:	83 c4 10             	add    $0x10,%esp
c0104995:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010499c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01049a3:	83 ec 0c             	sub    $0xc,%esp
c01049a6:	6a 7c                	push   $0x7c
c01049a8:	e8 bf cf ff ff       	call   c010196c <sys_malloc>
c01049ad:	83 c4 10             	add    $0x10,%esp
c01049b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01049b3:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01049ba:	eb 30                	jmp    c01049ec <TaskTTY+0x6f>
c01049bc:	83 ec 0c             	sub    $0xc,%esp
c01049bf:	ff 75 f4             	pushl  -0xc(%ebp)
c01049c2:	e8 f6 f9 ff ff       	call   c01043bd <tty_dev_read>
c01049c7:	83 c4 10             	add    $0x10,%esp
c01049ca:	83 ec 0c             	sub    $0xc,%esp
c01049cd:	ff 75 f4             	pushl  -0xc(%ebp)
c01049d0:	e8 12 fa ff ff       	call   c01043e7 <tty_dev_write>
c01049d5:	83 c4 10             	add    $0x10,%esp
c01049d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01049db:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01049e1:	85 c0                	test   %eax,%eax
c01049e3:	75 d7                	jne    c01049bc <TaskTTY+0x3f>
c01049e5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01049ec:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01049f1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01049f4:	72 c6                	jb     c01049bc <TaskTTY+0x3f>
c01049f6:	83 ec 04             	sub    $0x4,%esp
c01049f9:	6a 12                	push   $0x12
c01049fb:	ff 75 e8             	pushl  -0x18(%ebp)
c01049fe:	6a 02                	push   $0x2
c0104a00:	e8 a0 4e 00 00       	call   c01098a5 <send_rec>
c0104a05:	83 c4 10             	add    $0x10,%esp
c0104a08:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104a0b:	8b 40 78             	mov    0x78(%eax),%eax
c0104a0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104a11:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104a18:	74 28                	je     c0104a42 <TaskTTY+0xc5>
c0104a1a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104a21:	7f 0b                	jg     c0104a2e <TaskTTY+0xb1>
c0104a23:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0104a2a:	74 4e                	je     c0104a7a <TaskTTY+0xfd>
c0104a2c:	eb 4d                	jmp    c0104a7b <TaskTTY+0xfe>
c0104a2e:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104a35:	74 21                	je     c0104a58 <TaskTTY+0xdb>
c0104a37:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0104a3e:	74 2e                	je     c0104a6e <TaskTTY+0xf1>
c0104a40:	eb 39                	jmp    c0104a7b <TaskTTY+0xfe>
c0104a42:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104a47:	83 ec 08             	sub    $0x8,%esp
c0104a4a:	ff 75 e8             	pushl  -0x18(%ebp)
c0104a4d:	50                   	push   %eax
c0104a4e:	e8 c1 fb ff ff       	call   c0104614 <tty_do_read>
c0104a53:	83 c4 10             	add    $0x10,%esp
c0104a56:	eb 23                	jmp    c0104a7b <TaskTTY+0xfe>
c0104a58:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104a5d:	83 ec 08             	sub    $0x8,%esp
c0104a60:	ff 75 e8             	pushl  -0x18(%ebp)
c0104a63:	50                   	push   %eax
c0104a64:	e8 73 fc ff ff       	call   c01046dc <tty_do_write>
c0104a69:	83 c4 10             	add    $0x10,%esp
c0104a6c:	eb 0d                	jmp    c0104a7b <TaskTTY+0xfe>
c0104a6e:	c7 05 c8 06 11 c0 00 	movl   $0x0,0xc01106c8
c0104a75:	00 00 00 
c0104a78:	eb 01                	jmp    c0104a7b <TaskTTY+0xfe>
c0104a7a:	90                   	nop
c0104a7b:	e9 33 ff ff ff       	jmp    c01049b3 <TaskTTY+0x36>

c0104a80 <keyboard_handler>:
c0104a80:	55                   	push   %ebp
c0104a81:	89 e5                	mov    %esp,%ebp
c0104a83:	83 ec 18             	sub    $0x18,%esp
c0104a86:	c7 05 c8 06 11 c0 01 	movl   $0x1,0xc01106c8
c0104a8d:	00 00 00 
c0104a90:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104a97:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104a9c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104aa1:	7f 5e                	jg     c0104b01 <keyboard_handler+0x81>
c0104aa3:	e8 b8 b8 ff ff       	call   c0100360 <disable_int>
c0104aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104aab:	0f b7 c0             	movzwl %ax,%eax
c0104aae:	83 ec 0c             	sub    $0xc,%esp
c0104ab1:	50                   	push   %eax
c0104ab2:	e8 7b b8 ff ff       	call   c0100332 <in_byte>
c0104ab7:	83 c4 10             	add    $0x10,%esp
c0104aba:	88 45 f3             	mov    %al,-0xd(%ebp)
c0104abd:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104ac2:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104ac6:	88 10                	mov    %dl,(%eax)
c0104ac8:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104acd:	83 c0 01             	add    $0x1,%eax
c0104ad0:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104ad5:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104ada:	83 c0 01             	add    $0x1,%eax
c0104add:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104ae2:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104ae7:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104aec:	39 d0                	cmp    %edx,%eax
c0104aee:	72 0a                	jb     c0104afa <keyboard_handler+0x7a>
c0104af0:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104af7:	fb 10 c0 
c0104afa:	e8 63 b8 ff ff       	call   c0100362 <enable_int>
c0104aff:	eb 01                	jmp    c0104b02 <keyboard_handler+0x82>
c0104b01:	90                   	nop
c0104b02:	c9                   	leave  
c0104b03:	c3                   	ret    

c0104b04 <read_from_keyboard_buf>:
c0104b04:	55                   	push   %ebp
c0104b05:	89 e5                	mov    %esp,%ebp
c0104b07:	83 ec 18             	sub    $0x18,%esp
c0104b0a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0104b0e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104b13:	85 c0                	test   %eax,%eax
c0104b15:	7f 06                	jg     c0104b1d <read_from_keyboard_buf+0x19>
c0104b17:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104b1b:	eb 4b                	jmp    c0104b68 <read_from_keyboard_buf+0x64>
c0104b1d:	e8 3e b8 ff ff       	call   c0100360 <disable_int>
c0104b22:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104b27:	0f b6 00             	movzbl (%eax),%eax
c0104b2a:	88 45 f7             	mov    %al,-0x9(%ebp)
c0104b2d:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104b32:	83 c0 01             	add    $0x1,%eax
c0104b35:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c0104b3a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104b3f:	83 e8 01             	sub    $0x1,%eax
c0104b42:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104b47:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104b4c:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104b51:	39 d0                	cmp    %edx,%eax
c0104b53:	72 0a                	jb     c0104b5f <read_from_keyboard_buf+0x5b>
c0104b55:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c0104b5c:	fb 10 c0 
c0104b5f:	e8 fe b7 ff ff       	call   c0100362 <enable_int>
c0104b64:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104b68:	c9                   	leave  
c0104b69:	c3                   	ret    

c0104b6a <keyboard_read>:
c0104b6a:	55                   	push   %ebp
c0104b6b:	89 e5                	mov    %esp,%ebp
c0104b6d:	83 ec 28             	sub    $0x28,%esp
c0104b70:	90                   	nop
c0104b71:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104b76:	85 c0                	test   %eax,%eax
c0104b78:	7e f7                	jle    c0104b71 <keyboard_read+0x7>
c0104b7a:	e8 85 ff ff ff       	call   c0104b04 <read_from_keyboard_buf>
c0104b7f:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104b82:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104b89:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0104b8d:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104b91:	75 5a                	jne    c0104bed <keyboard_read+0x83>
c0104b93:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104b97:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0104b9b:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0104b9f:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104ba3:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104ba7:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0104bab:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0104baf:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104bb6:	eb 20                	jmp    c0104bd8 <keyboard_read+0x6e>
c0104bb8:	e8 47 ff ff ff       	call   c0104b04 <read_from_keyboard_buf>
c0104bbd:	89 c1                	mov    %eax,%ecx
c0104bbf:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104bc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104bc5:	01 d0                	add    %edx,%eax
c0104bc7:	0f b6 00             	movzbl (%eax),%eax
c0104bca:	38 c1                	cmp    %al,%cl
c0104bcc:	74 06                	je     c0104bd4 <keyboard_read+0x6a>
c0104bce:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0104bd2:	eb 0a                	jmp    c0104bde <keyboard_read+0x74>
c0104bd4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104bd8:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0104bdc:	7e da                	jle    c0104bb8 <keyboard_read+0x4e>
c0104bde:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0104be2:	74 68                	je     c0104c4c <keyboard_read+0xe2>
c0104be4:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0104beb:	eb 5f                	jmp    c0104c4c <keyboard_read+0xe2>
c0104bed:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104bf1:	75 59                	jne    c0104c4c <keyboard_read+0xe2>
c0104bf3:	e8 0c ff ff ff       	call   c0104b04 <read_from_keyboard_buf>
c0104bf8:	3c 2a                	cmp    $0x2a,%al
c0104bfa:	75 1d                	jne    c0104c19 <keyboard_read+0xaf>
c0104bfc:	e8 03 ff ff ff       	call   c0104b04 <read_from_keyboard_buf>
c0104c01:	3c e0                	cmp    $0xe0,%al
c0104c03:	75 14                	jne    c0104c19 <keyboard_read+0xaf>
c0104c05:	e8 fa fe ff ff       	call   c0104b04 <read_from_keyboard_buf>
c0104c0a:	3c 37                	cmp    $0x37,%al
c0104c0c:	75 0b                	jne    c0104c19 <keyboard_read+0xaf>
c0104c0e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104c15:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104c19:	e8 e6 fe ff ff       	call   c0104b04 <read_from_keyboard_buf>
c0104c1e:	3c b7                	cmp    $0xb7,%al
c0104c20:	75 1d                	jne    c0104c3f <keyboard_read+0xd5>
c0104c22:	e8 dd fe ff ff       	call   c0104b04 <read_from_keyboard_buf>
c0104c27:	3c e0                	cmp    $0xe0,%al
c0104c29:	75 14                	jne    c0104c3f <keyboard_read+0xd5>
c0104c2b:	e8 d4 fe ff ff       	call   c0104b04 <read_from_keyboard_buf>
c0104c30:	3c aa                	cmp    $0xaa,%al
c0104c32:	75 0b                	jne    c0104c3f <keyboard_read+0xd5>
c0104c34:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104c3b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0104c3f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104c43:	75 07                	jne    c0104c4c <keyboard_read+0xe2>
c0104c45:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c0104c4c:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104c53:	0f 84 8d 00 00 00    	je     c0104ce6 <keyboard_read+0x17c>
c0104c59:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0104c60:	0f 84 80 00 00 00    	je     c0104ce6 <keyboard_read+0x17c>
c0104c66:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0104c6a:	0f 94 c2             	sete   %dl
c0104c6d:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104c71:	0f 94 c0             	sete   %al
c0104c74:	09 d0                	or     %edx,%eax
c0104c76:	84 c0                	test   %al,%al
c0104c78:	74 07                	je     c0104c81 <keyboard_read+0x117>
c0104c7a:	c6 05 d0 06 11 c0 01 	movb   $0x1,0xc01106d0
c0104c81:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104c85:	f7 d0                	not    %eax
c0104c87:	c0 e8 07             	shr    $0x7,%al
c0104c8a:	88 45 e9             	mov    %al,-0x17(%ebp)
c0104c8d:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104c91:	74 53                	je     c0104ce6 <keyboard_read+0x17c>
c0104c93:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104c97:	74 4d                	je     c0104ce6 <keyboard_read+0x17c>
c0104c99:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0104c9d:	0f b6 05 d0 06 11 c0 	movzbl 0xc01106d0,%eax
c0104ca4:	3c 01                	cmp    $0x1,%al
c0104ca6:	75 04                	jne    c0104cac <keyboard_read+0x142>
c0104ca8:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104cac:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104cb3:	84 c0                	test   %al,%al
c0104cb5:	74 04                	je     c0104cbb <keyboard_read+0x151>
c0104cb7:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104cbb:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0104cbf:	89 d0                	mov    %edx,%eax
c0104cc1:	01 c0                	add    %eax,%eax
c0104cc3:	01 c2                	add    %eax,%edx
c0104cc5:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104cc9:	01 d0                	add    %edx,%eax
c0104ccb:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c0104cd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104cd5:	83 ec 08             	sub    $0x8,%esp
c0104cd8:	ff 75 f4             	pushl  -0xc(%ebp)
c0104cdb:	ff 75 08             	pushl  0x8(%ebp)
c0104cde:	e8 1a 00 00 00       	call   c0104cfd <in_process>
c0104ce3:	83 c4 10             	add    $0x10,%esp
c0104ce6:	90                   	nop
c0104ce7:	c9                   	leave  
c0104ce8:	c3                   	ret    

c0104ce9 <init_keyboard_handler>:
c0104ce9:	55                   	push   %ebp
c0104cea:	89 e5                	mov    %esp,%ebp
c0104cec:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104cf3:	c6 05 d0 06 11 c0 00 	movb   $0x0,0xc01106d0
c0104cfa:	90                   	nop
c0104cfb:	5d                   	pop    %ebp
c0104cfc:	c3                   	ret    

c0104cfd <in_process>:
c0104cfd:	55                   	push   %ebp
c0104cfe:	89 e5                	mov    %esp,%ebp
c0104d00:	83 ec 18             	sub    $0x18,%esp
c0104d03:	83 ec 04             	sub    $0x4,%esp
c0104d06:	6a 02                	push   $0x2
c0104d08:	6a 00                	push   $0x0
c0104d0a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0104d0d:	50                   	push   %eax
c0104d0e:	e8 3c 75 00 00       	call   c010c24f <Memset>
c0104d13:	83 c4 10             	add    $0x10,%esp
c0104d16:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104d19:	25 00 01 00 00       	and    $0x100,%eax
c0104d1e:	85 c0                	test   %eax,%eax
c0104d20:	75 28                	jne    c0104d4a <in_process+0x4d>
c0104d22:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104d25:	0f b6 c0             	movzbl %al,%eax
c0104d28:	83 ec 08             	sub    $0x8,%esp
c0104d2b:	50                   	push   %eax
c0104d2c:	ff 75 08             	pushl  0x8(%ebp)
c0104d2f:	e8 b3 f3 ff ff       	call   c01040e7 <put_key>
c0104d34:	83 c4 10             	add    $0x10,%esp
c0104d37:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104d3e:	c6 05 d0 06 11 c0 00 	movb   $0x0,0xc01106d0
c0104d45:	e9 42 01 00 00       	jmp    c0104e8c <in_process+0x18f>
c0104d4a:	0f b6 05 d0 06 11 c0 	movzbl 0xc01106d0,%eax
c0104d51:	84 c0                	test   %al,%al
c0104d53:	0f 84 a9 00 00 00    	je     c0104e02 <in_process+0x105>
c0104d59:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104d5d:	0f 84 9f 00 00 00    	je     c0104e02 <in_process+0x105>
c0104d63:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104d67:	0f 84 95 00 00 00    	je     c0104e02 <in_process+0x105>
c0104d6d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104d74:	74 64                	je     c0104dda <in_process+0xdd>
c0104d76:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104d7d:	77 0b                	ja     c0104d8a <in_process+0x8d>
c0104d7f:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104d86:	74 64                	je     c0104dec <in_process+0xef>
c0104d88:	eb 73                	jmp    c0104dfd <in_process+0x100>
c0104d8a:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104d91:	74 0b                	je     c0104d9e <in_process+0xa1>
c0104d93:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104d9a:	74 20                	je     c0104dbc <in_process+0xbf>
c0104d9c:	eb 5f                	jmp    c0104dfd <in_process+0x100>
c0104d9e:	83 ec 0c             	sub    $0xc,%esp
c0104da1:	ff 75 08             	pushl  0x8(%ebp)
c0104da4:	e8 aa f3 ff ff       	call   c0104153 <scroll_up>
c0104da9:	83 c4 10             	add    $0x10,%esp
c0104dac:	c6 05 d0 06 11 c0 00 	movb   $0x0,0xc01106d0
c0104db3:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104dba:	eb 41                	jmp    c0104dfd <in_process+0x100>
c0104dbc:	83 ec 0c             	sub    $0xc,%esp
c0104dbf:	ff 75 08             	pushl  0x8(%ebp)
c0104dc2:	e8 ce f3 ff ff       	call   c0104195 <scroll_down>
c0104dc7:	83 c4 10             	add    $0x10,%esp
c0104dca:	c6 05 d0 06 11 c0 00 	movb   $0x0,0xc01106d0
c0104dd1:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104dd8:	eb 23                	jmp    c0104dfd <in_process+0x100>
c0104dda:	83 ec 08             	sub    $0x8,%esp
c0104ddd:	6a 0a                	push   $0xa
c0104ddf:	ff 75 08             	pushl  0x8(%ebp)
c0104de2:	e8 19 f4 ff ff       	call   c0104200 <out_char>
c0104de7:	83 c4 10             	add    $0x10,%esp
c0104dea:	eb 11                	jmp    c0104dfd <in_process+0x100>
c0104dec:	83 ec 08             	sub    $0x8,%esp
c0104def:	6a 08                	push   $0x8
c0104df1:	ff 75 08             	pushl  0x8(%ebp)
c0104df4:	e8 07 f4 ff ff       	call   c0104200 <out_char>
c0104df9:	83 c4 10             	add    $0x10,%esp
c0104dfc:	90                   	nop
c0104dfd:	e9 8a 00 00 00       	jmp    c0104e8c <in_process+0x18f>
c0104e02:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104e09:	74 55                	je     c0104e60 <in_process+0x163>
c0104e0b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104e12:	77 14                	ja     c0104e28 <in_process+0x12b>
c0104e14:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104e1b:	74 31                	je     c0104e4e <in_process+0x151>
c0104e1d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104e24:	74 16                	je     c0104e3c <in_process+0x13f>
c0104e26:	eb 64                	jmp    c0104e8c <in_process+0x18f>
c0104e28:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104e2f:	74 3e                	je     c0104e6f <in_process+0x172>
c0104e31:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104e38:	74 44                	je     c0104e7e <in_process+0x181>
c0104e3a:	eb 50                	jmp    c0104e8c <in_process+0x18f>
c0104e3c:	83 ec 08             	sub    $0x8,%esp
c0104e3f:	6a 0a                	push   $0xa
c0104e41:	ff 75 08             	pushl  0x8(%ebp)
c0104e44:	e8 9e f2 ff ff       	call   c01040e7 <put_key>
c0104e49:	83 c4 10             	add    $0x10,%esp
c0104e4c:	eb 3e                	jmp    c0104e8c <in_process+0x18f>
c0104e4e:	83 ec 08             	sub    $0x8,%esp
c0104e51:	6a 08                	push   $0x8
c0104e53:	ff 75 08             	pushl  0x8(%ebp)
c0104e56:	e8 8c f2 ff ff       	call   c01040e7 <put_key>
c0104e5b:	83 c4 10             	add    $0x10,%esp
c0104e5e:	eb 2c                	jmp    c0104e8c <in_process+0x18f>
c0104e60:	83 ec 0c             	sub    $0xc,%esp
c0104e63:	6a 00                	push   $0x0
c0104e65:	e8 4c f1 ff ff       	call   c0103fb6 <select_console>
c0104e6a:	83 c4 10             	add    $0x10,%esp
c0104e6d:	eb 1d                	jmp    c0104e8c <in_process+0x18f>
c0104e6f:	83 ec 0c             	sub    $0xc,%esp
c0104e72:	6a 01                	push   $0x1
c0104e74:	e8 3d f1 ff ff       	call   c0103fb6 <select_console>
c0104e79:	83 c4 10             	add    $0x10,%esp
c0104e7c:	eb 0e                	jmp    c0104e8c <in_process+0x18f>
c0104e7e:	83 ec 0c             	sub    $0xc,%esp
c0104e81:	6a 02                	push   $0x2
c0104e83:	e8 2e f1 ff ff       	call   c0103fb6 <select_console>
c0104e88:	83 c4 10             	add    $0x10,%esp
c0104e8b:	90                   	nop
c0104e8c:	90                   	nop
c0104e8d:	c9                   	leave  
c0104e8e:	c3                   	ret    

c0104e8f <open>:
c0104e8f:	55                   	push   %ebp
c0104e90:	89 e5                	mov    %esp,%ebp
c0104e92:	83 ec 18             	sub    $0x18,%esp
c0104e95:	83 ec 0c             	sub    $0xc,%esp
c0104e98:	6a 7c                	push   $0x7c
c0104e9a:	e8 cd ca ff ff       	call   c010196c <sys_malloc>
c0104e9f:	83 c4 10             	add    $0x10,%esp
c0104ea2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104ea5:	83 ec 04             	sub    $0x4,%esp
c0104ea8:	6a 7c                	push   $0x7c
c0104eaa:	6a 00                	push   $0x0
c0104eac:	ff 75 f4             	pushl  -0xc(%ebp)
c0104eaf:	e8 9b 73 00 00       	call   c010c24f <Memset>
c0104eb4:	83 c4 10             	add    $0x10,%esp
c0104eb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104eba:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104ec1:	83 ec 0c             	sub    $0xc,%esp
c0104ec4:	ff 75 08             	pushl  0x8(%ebp)
c0104ec7:	e8 32 14 00 00       	call   c01062fe <get_physical_address>
c0104ecc:	83 c4 10             	add    $0x10,%esp
c0104ecf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104ed2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ed5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ed8:	89 50 44             	mov    %edx,0x44(%eax)
c0104edb:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104ede:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ee1:	89 50 74             	mov    %edx,0x74(%eax)
c0104ee4:	83 ec 0c             	sub    $0xc,%esp
c0104ee7:	ff 75 08             	pushl  0x8(%ebp)
c0104eea:	e8 99 73 00 00       	call   c010c288 <Strlen>
c0104eef:	83 c4 10             	add    $0x10,%esp
c0104ef2:	89 c2                	mov    %eax,%edx
c0104ef4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ef7:	89 50 40             	mov    %edx,0x40(%eax)
c0104efa:	83 ec 04             	sub    $0x4,%esp
c0104efd:	6a 02                	push   $0x2
c0104eff:	ff 75 f4             	pushl  -0xc(%ebp)
c0104f02:	6a 03                	push   $0x3
c0104f04:	e8 9c 49 00 00       	call   c01098a5 <send_rec>
c0104f09:	83 c4 10             	add    $0x10,%esp
c0104f0c:	83 ec 08             	sub    $0x8,%esp
c0104f0f:	6a 7c                	push   $0x7c
c0104f11:	ff 75 f4             	pushl  -0xc(%ebp)
c0104f14:	e8 68 ca ff ff       	call   c0101981 <sys_free>
c0104f19:	83 c4 10             	add    $0x10,%esp
c0104f1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104f1f:	8b 40 50             	mov    0x50(%eax),%eax
c0104f22:	c9                   	leave  
c0104f23:	c3                   	ret    

c0104f24 <read>:
c0104f24:	55                   	push   %ebp
c0104f25:	89 e5                	mov    %esp,%ebp
c0104f27:	83 ec 38             	sub    $0x38,%esp
c0104f2a:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104f31:	83 ec 0c             	sub    $0xc,%esp
c0104f34:	ff 75 dc             	pushl  -0x24(%ebp)
c0104f37:	e8 30 ca ff ff       	call   c010196c <sys_malloc>
c0104f3c:	83 c4 10             	add    $0x10,%esp
c0104f3f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104f42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104f45:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104f4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104f4d:	83 ec 0c             	sub    $0xc,%esp
c0104f50:	ff 75 0c             	pushl  0xc(%ebp)
c0104f53:	e8 a6 13 00 00       	call   c01062fe <get_physical_address>
c0104f58:	83 c4 10             	add    $0x10,%esp
c0104f5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f61:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104f66:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104f69:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104f6c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104f71:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104f74:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104f7b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104f82:	8b 55 10             	mov    0x10(%ebp),%edx
c0104f85:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f88:	01 d0                	add    %edx,%eax
c0104f8a:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104f8d:	0f 83 a8 00 00 00    	jae    c010503b <read+0x117>
c0104f93:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104f96:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104f99:	05 00 10 00 00       	add    $0x1000,%eax
c0104f9e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104fa1:	8b 45 10             	mov    0x10(%ebp),%eax
c0104fa4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104fa7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104faa:	83 ec 04             	sub    $0x4,%esp
c0104fad:	50                   	push   %eax
c0104fae:	6a 00                	push   $0x0
c0104fb0:	ff 75 d8             	pushl  -0x28(%ebp)
c0104fb3:	e8 97 72 00 00       	call   c010c24f <Memset>
c0104fb8:	83 c4 10             	add    $0x10,%esp
c0104fbb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fbe:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104fc5:	8b 55 08             	mov    0x8(%ebp),%edx
c0104fc8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fcb:	89 50 50             	mov    %edx,0x50(%eax)
c0104fce:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fd1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104fd4:	89 50 10             	mov    %edx,0x10(%eax)
c0104fd7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fda:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104fdd:	89 50 60             	mov    %edx,0x60(%eax)
c0104fe0:	83 ec 04             	sub    $0x4,%esp
c0104fe3:	6a 02                	push   $0x2
c0104fe5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104fe8:	6a 03                	push   $0x3
c0104fea:	e8 b6 48 00 00       	call   c01098a5 <send_rec>
c0104fef:	83 c4 10             	add    $0x10,%esp
c0104ff2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ff5:	8b 40 60             	mov    0x60(%eax),%eax
c0104ff8:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104ffb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104ffe:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0105001:	8b 45 10             	mov    0x10(%ebp),%eax
c0105004:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0105007:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010500a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010500d:	89 45 10             	mov    %eax,0x10(%ebp)
c0105010:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0105017:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c010501e:	83 ec 0c             	sub    $0xc,%esp
c0105021:	ff 75 f4             	pushl  -0xc(%ebp)
c0105024:	e8 d5 12 00 00       	call   c01062fe <get_physical_address>
c0105029:	83 c4 10             	add    $0x10,%esp
c010502c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010502f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105033:	0f 85 6e ff ff ff    	jne    c0104fa7 <read+0x83>
c0105039:	eb 54                	jmp    c010508f <read+0x16b>
c010503b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010503e:	83 ec 04             	sub    $0x4,%esp
c0105041:	50                   	push   %eax
c0105042:	6a 00                	push   $0x0
c0105044:	ff 75 d8             	pushl  -0x28(%ebp)
c0105047:	e8 03 72 00 00       	call   c010c24f <Memset>
c010504c:	83 c4 10             	add    $0x10,%esp
c010504f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105052:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0105059:	8b 55 08             	mov    0x8(%ebp),%edx
c010505c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010505f:	89 50 50             	mov    %edx,0x50(%eax)
c0105062:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105065:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105068:	89 50 10             	mov    %edx,0x10(%eax)
c010506b:	8b 55 10             	mov    0x10(%ebp),%edx
c010506e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105071:	89 50 60             	mov    %edx,0x60(%eax)
c0105074:	83 ec 04             	sub    $0x4,%esp
c0105077:	6a 02                	push   $0x2
c0105079:	ff 75 d8             	pushl  -0x28(%ebp)
c010507c:	6a 03                	push   $0x3
c010507e:	e8 22 48 00 00       	call   c01098a5 <send_rec>
c0105083:	83 c4 10             	add    $0x10,%esp
c0105086:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105089:	8b 40 60             	mov    0x60(%eax),%eax
c010508c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010508f:	83 ec 08             	sub    $0x8,%esp
c0105092:	ff 75 dc             	pushl  -0x24(%ebp)
c0105095:	ff 75 d8             	pushl  -0x28(%ebp)
c0105098:	e8 e4 c8 ff ff       	call   c0101981 <sys_free>
c010509d:	83 c4 10             	add    $0x10,%esp
c01050a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01050a3:	c9                   	leave  
c01050a4:	c3                   	ret    

c01050a5 <write>:
c01050a5:	55                   	push   %ebp
c01050a6:	89 e5                	mov    %esp,%ebp
c01050a8:	83 ec 18             	sub    $0x18,%esp
c01050ab:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c01050b2:	83 ec 0c             	sub    $0xc,%esp
c01050b5:	ff 75 f4             	pushl  -0xc(%ebp)
c01050b8:	e8 af c8 ff ff       	call   c010196c <sys_malloc>
c01050bd:	83 c4 10             	add    $0x10,%esp
c01050c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050c3:	83 ec 0c             	sub    $0xc,%esp
c01050c6:	ff 75 0c             	pushl  0xc(%ebp)
c01050c9:	e8 30 12 00 00       	call   c01062fe <get_physical_address>
c01050ce:	83 c4 10             	add    $0x10,%esp
c01050d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01050d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050d7:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c01050de:	8b 55 08             	mov    0x8(%ebp),%edx
c01050e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050e4:	89 50 50             	mov    %edx,0x50(%eax)
c01050e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050ea:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01050ed:	89 50 10             	mov    %edx,0x10(%eax)
c01050f0:	8b 55 10             	mov    0x10(%ebp),%edx
c01050f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050f6:	89 50 60             	mov    %edx,0x60(%eax)
c01050f9:	83 ec 04             	sub    $0x4,%esp
c01050fc:	6a 02                	push   $0x2
c01050fe:	ff 75 f0             	pushl  -0x10(%ebp)
c0105101:	6a 03                	push   $0x3
c0105103:	e8 9d 47 00 00       	call   c01098a5 <send_rec>
c0105108:	83 c4 10             	add    $0x10,%esp
c010510b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010510e:	8b 40 60             	mov    0x60(%eax),%eax
c0105111:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105114:	83 ec 08             	sub    $0x8,%esp
c0105117:	ff 75 f4             	pushl  -0xc(%ebp)
c010511a:	ff 75 f0             	pushl  -0x10(%ebp)
c010511d:	e8 5f c8 ff ff       	call   c0101981 <sys_free>
c0105122:	83 c4 10             	add    $0x10,%esp
c0105125:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105128:	c9                   	leave  
c0105129:	c3                   	ret    

c010512a <close>:
c010512a:	55                   	push   %ebp
c010512b:	89 e5                	mov    %esp,%ebp
c010512d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105133:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010513a:	8b 45 08             	mov    0x8(%ebp),%eax
c010513d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105140:	83 ec 04             	sub    $0x4,%esp
c0105143:	6a 02                	push   $0x2
c0105145:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c010514b:	50                   	push   %eax
c010514c:	6a 03                	push   $0x3
c010514e:	e8 52 47 00 00       	call   c01098a5 <send_rec>
c0105153:	83 c4 10             	add    $0x10,%esp
c0105156:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105159:	83 f8 65             	cmp    $0x65,%eax
c010515c:	74 19                	je     c0105177 <close+0x4d>
c010515e:	6a 13                	push   $0x13
c0105160:	68 9f b5 10 c0       	push   $0xc010b59f
c0105165:	68 9f b5 10 c0       	push   $0xc010b59f
c010516a:	68 ab b5 10 c0       	push   $0xc010b5ab
c010516f:	e8 c1 3a 00 00       	call   c0108c35 <assertion_failure>
c0105174:	83 c4 10             	add    $0x10,%esp
c0105177:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010517a:	c9                   	leave  
c010517b:	c3                   	ret    

c010517c <wait>:
c010517c:	55                   	push   %ebp
c010517d:	89 e5                	mov    %esp,%ebp
c010517f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105185:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c010518c:	83 ec 04             	sub    $0x4,%esp
c010518f:	6a 01                	push   $0x1
c0105191:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105197:	50                   	push   %eax
c0105198:	6a 03                	push   $0x3
c010519a:	e8 06 47 00 00       	call   c01098a5 <send_rec>
c010519f:	83 c4 10             	add    $0x10,%esp
c01051a2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01051a5:	89 c2                	mov    %eax,%edx
c01051a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01051aa:	89 10                	mov    %edx,(%eax)
c01051ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01051af:	83 f8 21             	cmp    $0x21,%eax
c01051b2:	74 05                	je     c01051b9 <wait+0x3d>
c01051b4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01051b7:	eb 05                	jmp    c01051be <wait+0x42>
c01051b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01051be:	c9                   	leave  
c01051bf:	c3                   	ret    

c01051c0 <exit>:
c01051c0:	55                   	push   %ebp
c01051c1:	89 e5                	mov    %esp,%ebp
c01051c3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01051c9:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c01051d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01051d3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01051d6:	83 ec 04             	sub    $0x4,%esp
c01051d9:	6a 01                	push   $0x1
c01051db:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01051e1:	50                   	push   %eax
c01051e2:	6a 03                	push   $0x3
c01051e4:	e8 bc 46 00 00       	call   c01098a5 <send_rec>
c01051e9:	83 c4 10             	add    $0x10,%esp
c01051ec:	90                   	nop
c01051ed:	c9                   	leave  
c01051ee:	c3                   	ret    

c01051ef <fork>:
c01051ef:	55                   	push   %ebp
c01051f0:	89 e5                	mov    %esp,%ebp
c01051f2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01051f8:	83 ec 04             	sub    $0x4,%esp
c01051fb:	6a 7c                	push   $0x7c
c01051fd:	6a 00                	push   $0x0
c01051ff:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105205:	50                   	push   %eax
c0105206:	e8 44 70 00 00       	call   c010c24f <Memset>
c010520b:	83 c4 10             	add    $0x10,%esp
c010520e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0105215:	83 ec 04             	sub    $0x4,%esp
c0105218:	6a 01                	push   $0x1
c010521a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105220:	50                   	push   %eax
c0105221:	6a 03                	push   $0x3
c0105223:	e8 7d 46 00 00       	call   c01098a5 <send_rec>
c0105228:	83 c4 10             	add    $0x10,%esp
c010522b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0105232:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105235:	c9                   	leave  
c0105236:	c3                   	ret    

c0105237 <getpid>:
c0105237:	55                   	push   %ebp
c0105238:	89 e5                	mov    %esp,%ebp
c010523a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105240:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0105247:	83 ec 04             	sub    $0x4,%esp
c010524a:	6a 05                	push   $0x5
c010524c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105252:	50                   	push   %eax
c0105253:	6a 03                	push   $0x3
c0105255:	e8 4b 46 00 00       	call   c01098a5 <send_rec>
c010525a:	83 c4 10             	add    $0x10,%esp
c010525d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105260:	c9                   	leave  
c0105261:	c3                   	ret    

c0105262 <exec>:
c0105262:	55                   	push   %ebp
c0105263:	89 e5                	mov    %esp,%ebp
c0105265:	81 ec 88 00 00 00    	sub    $0x88,%esp
c010526b:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0105272:	8b 45 08             	mov    0x8(%ebp),%eax
c0105275:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0105278:	83 ec 0c             	sub    $0xc,%esp
c010527b:	ff 75 08             	pushl  0x8(%ebp)
c010527e:	e8 05 70 00 00       	call   c010c288 <Strlen>
c0105283:	83 c4 10             	add    $0x10,%esp
c0105286:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0105289:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0105290:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0105297:	83 ec 04             	sub    $0x4,%esp
c010529a:	6a 01                	push   $0x1
c010529c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01052a2:	50                   	push   %eax
c01052a3:	6a 03                	push   $0x3
c01052a5:	e8 fb 45 00 00       	call   c01098a5 <send_rec>
c01052aa:	83 c4 10             	add    $0x10,%esp
c01052ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01052b0:	83 f8 65             	cmp    $0x65,%eax
c01052b3:	74 19                	je     c01052ce <exec+0x6c>
c01052b5:	6a 19                	push   $0x19
c01052b7:	68 c3 b5 10 c0       	push   $0xc010b5c3
c01052bc:	68 c3 b5 10 c0       	push   $0xc010b5c3
c01052c1:	68 ce b5 10 c0       	push   $0xc010b5ce
c01052c6:	e8 6a 39 00 00       	call   c0108c35 <assertion_failure>
c01052cb:	83 c4 10             	add    $0x10,%esp
c01052ce:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01052d1:	c9                   	leave  
c01052d2:	c3                   	ret    

c01052d3 <execv>:
c01052d3:	55                   	push   %ebp
c01052d4:	89 e5                	mov    %esp,%ebp
c01052d6:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c01052dc:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c01052e3:	83 ec 0c             	sub    $0xc,%esp
c01052e6:	ff 75 e0             	pushl  -0x20(%ebp)
c01052e9:	e8 7e c6 ff ff       	call   c010196c <sys_malloc>
c01052ee:	83 c4 10             	add    $0x10,%esp
c01052f1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01052f4:	66 87 db             	xchg   %bx,%bx
c01052f7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01052fa:	83 ec 04             	sub    $0x4,%esp
c01052fd:	50                   	push   %eax
c01052fe:	6a 00                	push   $0x0
c0105300:	ff 75 dc             	pushl  -0x24(%ebp)
c0105303:	e8 47 6f 00 00       	call   c010c24f <Memset>
c0105308:	83 c4 10             	add    $0x10,%esp
c010530b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010530e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105311:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105318:	eb 23                	jmp    c010533d <execv+0x6a>
c010531a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010531d:	8b 00                	mov    (%eax),%eax
c010531f:	83 ec 08             	sub    $0x8,%esp
c0105322:	50                   	push   %eax
c0105323:	68 e6 b5 10 c0       	push   $0xc010b5e6
c0105328:	e8 ab 35 00 00       	call   c01088d8 <Printf>
c010532d:	83 c4 10             	add    $0x10,%esp
c0105330:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0105334:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105337:	83 c0 04             	add    $0x4,%eax
c010533a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010533d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105340:	8b 00                	mov    (%eax),%eax
c0105342:	85 c0                	test   %eax,%eax
c0105344:	75 d4                	jne    c010531a <execv+0x47>
c0105346:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105349:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010534c:	01 d0                	add    %edx,%eax
c010534e:	c6 00 00             	movb   $0x0,(%eax)
c0105351:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105354:	83 c0 04             	add    $0x4,%eax
c0105357:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010535a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010535d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105360:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105363:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105366:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010536d:	eb 5b                	jmp    c01053ca <execv+0xf7>
c010536f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105372:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105375:	01 c2                	add    %eax,%edx
c0105377:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010537a:	89 10                	mov    %edx,(%eax)
c010537c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010537f:	8b 00                	mov    (%eax),%eax
c0105381:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0105384:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0105387:	01 ca                	add    %ecx,%edx
c0105389:	83 ec 08             	sub    $0x8,%esp
c010538c:	50                   	push   %eax
c010538d:	52                   	push   %edx
c010538e:	e8 db 6e 00 00       	call   c010c26e <Strcpy>
c0105393:	83 c4 10             	add    $0x10,%esp
c0105396:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105399:	8b 00                	mov    (%eax),%eax
c010539b:	83 ec 0c             	sub    $0xc,%esp
c010539e:	50                   	push   %eax
c010539f:	e8 e4 6e 00 00       	call   c010c288 <Strlen>
c01053a4:	83 c4 10             	add    $0x10,%esp
c01053a7:	01 45 f0             	add    %eax,-0x10(%ebp)
c01053aa:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01053ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01053b0:	01 d0                	add    %edx,%eax
c01053b2:	c6 00 00             	movb   $0x0,(%eax)
c01053b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01053b8:	83 c0 01             	add    $0x1,%eax
c01053bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01053be:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c01053c2:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c01053c6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01053ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01053cd:	8b 00                	mov    (%eax),%eax
c01053cf:	85 c0                	test   %eax,%eax
c01053d1:	75 9c                	jne    c010536f <execv+0x9c>
c01053d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01053d6:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c01053db:	29 c2                	sub    %eax,%edx
c01053dd:	89 d0                	mov    %edx,%eax
c01053df:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01053e2:	83 ec 0c             	sub    $0xc,%esp
c01053e5:	ff 75 08             	pushl  0x8(%ebp)
c01053e8:	e8 11 0f 00 00       	call   c01062fe <get_physical_address>
c01053ed:	83 c4 10             	add    $0x10,%esp
c01053f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01053f3:	83 ec 0c             	sub    $0xc,%esp
c01053f6:	ff 75 dc             	pushl  -0x24(%ebp)
c01053f9:	e8 00 0f 00 00       	call   c01062fe <get_physical_address>
c01053fe:	83 c4 10             	add    $0x10,%esp
c0105401:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105404:	83 ec 0c             	sub    $0xc,%esp
c0105407:	ff 75 d8             	pushl  -0x28(%ebp)
c010540a:	e8 ef 0e 00 00       	call   c01062fe <get_physical_address>
c010540f:	83 c4 10             	add    $0x10,%esp
c0105412:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105415:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c010541c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010541f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105422:	83 ec 0c             	sub    $0xc,%esp
c0105425:	ff 75 08             	pushl  0x8(%ebp)
c0105428:	e8 5b 6e 00 00       	call   c010c288 <Strlen>
c010542d:	83 c4 10             	add    $0x10,%esp
c0105430:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105433:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105436:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010543c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010543f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105445:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105448:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010544e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105451:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105457:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010545a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105460:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105463:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105466:	29 c2                	sub    %eax,%edx
c0105468:	89 d0                	mov    %edx,%eax
c010546a:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0105470:	83 ec 04             	sub    $0x4,%esp
c0105473:	6a 01                	push   $0x1
c0105475:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c010547b:	50                   	push   %eax
c010547c:	6a 03                	push   $0x3
c010547e:	e8 22 44 00 00       	call   c01098a5 <send_rec>
c0105483:	83 c4 10             	add    $0x10,%esp
c0105486:	83 ec 08             	sub    $0x8,%esp
c0105489:	68 00 04 00 00       	push   $0x400
c010548e:	ff 75 dc             	pushl  -0x24(%ebp)
c0105491:	e8 eb c4 ff ff       	call   c0101981 <sys_free>
c0105496:	83 c4 10             	add    $0x10,%esp
c0105499:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010549c:	83 f8 65             	cmp    $0x65,%eax
c010549f:	74 1c                	je     c01054bd <execv+0x1ea>
c01054a1:	68 95 00 00 00       	push   $0x95
c01054a6:	68 c3 b5 10 c0       	push   $0xc010b5c3
c01054ab:	68 c3 b5 10 c0       	push   $0xc010b5c3
c01054b0:	68 ce b5 10 c0       	push   $0xc010b5ce
c01054b5:	e8 7b 37 00 00       	call   c0108c35 <assertion_failure>
c01054ba:	83 c4 10             	add    $0x10,%esp
c01054bd:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01054c0:	c9                   	leave  
c01054c1:	c3                   	ret    

c01054c2 <execl>:
c01054c2:	55                   	push   %ebp
c01054c3:	89 e5                	mov    %esp,%ebp
c01054c5:	83 ec 18             	sub    $0x18,%esp
c01054c8:	8d 45 0c             	lea    0xc(%ebp),%eax
c01054cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01054ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01054d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01054d4:	83 ec 08             	sub    $0x8,%esp
c01054d7:	ff 75 f0             	pushl  -0x10(%ebp)
c01054da:	ff 75 08             	pushl  0x8(%ebp)
c01054dd:	e8 f1 fd ff ff       	call   c01052d3 <execv>
c01054e2:	83 c4 10             	add    $0x10,%esp
c01054e5:	c9                   	leave  
c01054e6:	c3                   	ret    

c01054e7 <TaskMM>:
c01054e7:	55                   	push   %ebp
c01054e8:	89 e5                	mov    %esp,%ebp
c01054ea:	83 ec 28             	sub    $0x28,%esp
c01054ed:	83 ec 0c             	sub    $0xc,%esp
c01054f0:	6a 7c                	push   $0x7c
c01054f2:	e8 75 c4 ff ff       	call   c010196c <sys_malloc>
c01054f7:	83 c4 10             	add    $0x10,%esp
c01054fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01054fd:	83 ec 0c             	sub    $0xc,%esp
c0105500:	6a 7c                	push   $0x7c
c0105502:	e8 65 c4 ff ff       	call   c010196c <sys_malloc>
c0105507:	83 c4 10             	add    $0x10,%esp
c010550a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010550d:	83 ec 04             	sub    $0x4,%esp
c0105510:	6a 12                	push   $0x12
c0105512:	ff 75 f0             	pushl  -0x10(%ebp)
c0105515:	6a 02                	push   $0x2
c0105517:	e8 89 43 00 00       	call   c01098a5 <send_rec>
c010551c:	83 c4 10             	add    $0x10,%esp
c010551f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105522:	8b 40 78             	mov    0x78(%eax),%eax
c0105525:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105528:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010552b:	8b 00                	mov    (%eax),%eax
c010552d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105530:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105537:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010553a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0105541:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105544:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c010554b:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c010554f:	74 4e                	je     c010559f <TaskMM+0xb8>
c0105551:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105555:	7f 08                	jg     c010555f <TaskMM+0x78>
c0105557:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c010555b:	74 28                	je     c0105585 <TaskMM+0x9e>
c010555d:	eb 71                	jmp    c01055d0 <TaskMM+0xe9>
c010555f:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0105563:	74 08                	je     c010556d <TaskMM+0x86>
c0105565:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0105569:	74 4e                	je     c01055b9 <TaskMM+0xd2>
c010556b:	eb 63                	jmp    c01055d0 <TaskMM+0xe9>
c010556d:	83 ec 0c             	sub    $0xc,%esp
c0105570:	ff 75 f0             	pushl  -0x10(%ebp)
c0105573:	e8 d0 04 00 00       	call   c0105a48 <do_fork>
c0105578:	83 c4 10             	add    $0x10,%esp
c010557b:	89 c2                	mov    %eax,%edx
c010557d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105580:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105583:	eb 5c                	jmp    c01055e1 <TaskMM+0xfa>
c0105585:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010558c:	66 87 db             	xchg   %bx,%bx
c010558f:	83 ec 0c             	sub    $0xc,%esp
c0105592:	ff 75 f0             	pushl  -0x10(%ebp)
c0105595:	e8 95 00 00 00       	call   c010562f <do_exec>
c010559a:	83 c4 10             	add    $0x10,%esp
c010559d:	eb 42                	jmp    c01055e1 <TaskMM+0xfa>
c010559f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01055a6:	83 ec 08             	sub    $0x8,%esp
c01055a9:	ff 75 e0             	pushl  -0x20(%ebp)
c01055ac:	ff 75 f0             	pushl  -0x10(%ebp)
c01055af:	e8 02 05 00 00       	call   c0105ab6 <do_exit>
c01055b4:	83 c4 10             	add    $0x10,%esp
c01055b7:	eb 28                	jmp    c01055e1 <TaskMM+0xfa>
c01055b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01055c0:	83 ec 0c             	sub    $0xc,%esp
c01055c3:	ff 75 f0             	pushl  -0x10(%ebp)
c01055c6:	e8 75 05 00 00       	call   c0105b40 <do_wait>
c01055cb:	83 c4 10             	add    $0x10,%esp
c01055ce:	eb 11                	jmp    c01055e1 <TaskMM+0xfa>
c01055d0:	83 ec 0c             	sub    $0xc,%esp
c01055d3:	68 f0 b5 10 c0       	push   $0xc010b5f0
c01055d8:	e8 3a 36 00 00       	call   c0108c17 <panic>
c01055dd:	83 c4 10             	add    $0x10,%esp
c01055e0:	90                   	nop
c01055e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01055e5:	0f 84 22 ff ff ff    	je     c010550d <TaskMM+0x26>
c01055eb:	83 ec 0c             	sub    $0xc,%esp
c01055ee:	6a 03                	push   $0x3
c01055f0:	e8 af 31 00 00       	call   c01087a4 <delay>
c01055f5:	83 c4 10             	add    $0x10,%esp
c01055f8:	83 ec 04             	sub    $0x4,%esp
c01055fb:	ff 75 e4             	pushl  -0x1c(%ebp)
c01055fe:	ff 75 ec             	pushl  -0x14(%ebp)
c0105601:	6a 01                	push   $0x1
c0105603:	e8 9d 42 00 00       	call   c01098a5 <send_rec>
c0105608:	83 c4 10             	add    $0x10,%esp
c010560b:	e9 fd fe ff ff       	jmp    c010550d <TaskMM+0x26>

c0105610 <alloc_mem>:
c0105610:	55                   	push   %ebp
c0105611:	89 e5                	mov    %esp,%ebp
c0105613:	83 ec 10             	sub    $0x10,%esp
c0105616:	8b 45 08             	mov    0x8(%ebp),%eax
c0105619:	83 e8 08             	sub    $0x8,%eax
c010561c:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0105622:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105627:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010562a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010562d:	c9                   	leave  
c010562e:	c3                   	ret    

c010562f <do_exec>:
c010562f:	55                   	push   %ebp
c0105630:	89 e5                	mov    %esp,%ebp
c0105632:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105638:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010563f:	65 76 5f 
c0105642:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c0105649:	74 79 31 
c010564c:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105653:	00 00 
c0105655:	83 ec 08             	sub    $0x8,%esp
c0105658:	6a 00                	push   $0x0
c010565a:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c0105660:	50                   	push   %eax
c0105661:	e8 29 f8 ff ff       	call   c0104e8f <open>
c0105666:	83 c4 10             	add    $0x10,%esp
c0105669:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010566c:	8b 45 08             	mov    0x8(%ebp),%eax
c010566f:	8b 00                	mov    (%eax),%eax
c0105671:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105674:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c010567b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010567e:	83 ec 0c             	sub    $0xc,%esp
c0105681:	50                   	push   %eax
c0105682:	e8 e5 c2 ff ff       	call   c010196c <sys_malloc>
c0105687:	83 c4 10             	add    $0x10,%esp
c010568a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010568d:	83 ec 04             	sub    $0x4,%esp
c0105690:	ff 75 d0             	pushl  -0x30(%ebp)
c0105693:	6a 00                	push   $0x0
c0105695:	ff 75 cc             	pushl  -0x34(%ebp)
c0105698:	e8 b2 6b 00 00       	call   c010c24f <Memset>
c010569d:	83 c4 10             	add    $0x10,%esp
c01056a0:	83 ec 04             	sub    $0x4,%esp
c01056a3:	6a 0c                	push   $0xc
c01056a5:	6a 00                	push   $0x0
c01056a7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01056ad:	50                   	push   %eax
c01056ae:	e8 9c 6b 00 00       	call   c010c24f <Memset>
c01056b3:	83 c4 10             	add    $0x10,%esp
c01056b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01056b9:	8b 40 44             	mov    0x44(%eax),%eax
c01056bc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01056bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01056c2:	8b 40 40             	mov    0x40(%eax),%eax
c01056c5:	83 ec 08             	sub    $0x8,%esp
c01056c8:	50                   	push   %eax
c01056c9:	ff 75 c8             	pushl  -0x38(%ebp)
c01056cc:	e8 de 0a 00 00       	call   c01061af <alloc_virtual_memory>
c01056d1:	83 c4 10             	add    $0x10,%esp
c01056d4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01056d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01056da:	8b 40 40             	mov    0x40(%eax),%eax
c01056dd:	89 c2                	mov    %eax,%edx
c01056df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01056e2:	83 ec 04             	sub    $0x4,%esp
c01056e5:	52                   	push   %edx
c01056e6:	50                   	push   %eax
c01056e7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01056ed:	50                   	push   %eax
c01056ee:	e8 29 19 00 00       	call   c010701c <Memcpy>
c01056f3:	83 c4 10             	add    $0x10,%esp
c01056f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01056f9:	8b 40 40             	mov    0x40(%eax),%eax
c01056fc:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105703:	00 
c0105704:	83 ec 08             	sub    $0x8,%esp
c0105707:	6a 00                	push   $0x0
c0105709:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010570f:	50                   	push   %eax
c0105710:	e8 7a f7 ff ff       	call   c0104e8f <open>
c0105715:	83 c4 10             	add    $0x10,%esp
c0105718:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010571b:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010571f:	75 15                	jne    c0105736 <do_exec+0x107>
c0105721:	83 ec 0c             	sub    $0xc,%esp
c0105724:	68 01 b6 10 c0       	push   $0xc010b601
c0105729:	e8 aa 31 00 00       	call   c01088d8 <Printf>
c010572e:	83 c4 10             	add    $0x10,%esp
c0105731:	e9 10 03 00 00       	jmp    c0105a46 <do_exec+0x417>
c0105736:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010573d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105740:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105743:	01 d0                	add    %edx,%eax
c0105745:	83 ec 04             	sub    $0x4,%esp
c0105748:	68 00 10 00 00       	push   $0x1000
c010574d:	50                   	push   %eax
c010574e:	ff 75 c0             	pushl  -0x40(%ebp)
c0105751:	e8 ce f7 ff ff       	call   c0104f24 <read>
c0105756:	83 c4 10             	add    $0x10,%esp
c0105759:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010575c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010575f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0105762:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0105766:	74 0a                	je     c0105772 <do_exec+0x143>
c0105768:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010576b:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c010576e:	7d 05                	jge    c0105775 <do_exec+0x146>
c0105770:	eb cb                	jmp    c010573d <do_exec+0x10e>
c0105772:	90                   	nop
c0105773:	eb 01                	jmp    c0105776 <do_exec+0x147>
c0105775:	90                   	nop
c0105776:	83 ec 0c             	sub    $0xc,%esp
c0105779:	ff 75 c0             	pushl  -0x40(%ebp)
c010577c:	e8 a9 f9 ff ff       	call   c010512a <close>
c0105781:	83 c4 10             	add    $0x10,%esp
c0105784:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105787:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010578a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010578d:	8b 40 18             	mov    0x18(%eax),%eax
c0105790:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105793:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010579a:	e9 04 01 00 00       	jmp    c01058a3 <do_exec+0x274>
c010579f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01057a2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c01057a6:	0f b7 d0             	movzwl %ax,%edx
c01057a9:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01057ac:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c01057b0:	0f b7 c0             	movzwl %ax,%eax
c01057b3:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c01057b7:	01 c2                	add    %eax,%edx
c01057b9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01057bc:	01 d0                	add    %edx,%eax
c01057be:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01057c1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01057c4:	8b 40 10             	mov    0x10(%eax),%eax
c01057c7:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01057ca:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01057cd:	05 ff 0f 00 00       	add    $0xfff,%eax
c01057d2:	c1 e8 0c             	shr    $0xc,%eax
c01057d5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01057d8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01057db:	8b 40 08             	mov    0x8(%eax),%eax
c01057de:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01057e1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01057e8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01057eb:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c01057ee:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01057f1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01057f4:	8b 50 04             	mov    0x4(%eax),%edx
c01057f7:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01057fa:	01 d0                	add    %edx,%eax
c01057fc:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01057ff:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105803:	0f 84 95 00 00 00    	je     c010589e <do_exec+0x26f>
c0105809:	83 ec 04             	sub    $0x4,%esp
c010580c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010580f:	ff 75 a8             	pushl  -0x58(%ebp)
c0105812:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105815:	e8 a0 07 00 00       	call   c0105fba <get_virtual_address_start_with_addr>
c010581a:	83 c4 10             	add    $0x10,%esp
c010581d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105820:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105823:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105826:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010582d:	eb 41                	jmp    c0105870 <do_exec+0x241>
c010582f:	83 ec 08             	sub    $0x8,%esp
c0105832:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105835:	ff 75 e8             	pushl  -0x18(%ebp)
c0105838:	e8 f3 0a 00 00       	call   c0106330 <alloc_physical_memory_of_proc>
c010583d:	83 c4 10             	add    $0x10,%esp
c0105840:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105843:	83 ec 08             	sub    $0x8,%esp
c0105846:	68 00 10 00 00       	push   $0x1000
c010584b:	ff 75 94             	pushl  -0x6c(%ebp)
c010584e:	e8 5c 09 00 00       	call   c01061af <alloc_virtual_memory>
c0105853:	83 c4 10             	add    $0x10,%esp
c0105856:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105859:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010585d:	75 06                	jne    c0105865 <do_exec+0x236>
c010585f:	8b 45 90             	mov    -0x70(%ebp),%eax
c0105862:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105865:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c010586c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0105870:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105873:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105876:	77 b7                	ja     c010582f <do_exec+0x200>
c0105878:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010587b:	8b 40 10             	mov    0x10(%eax),%eax
c010587e:	89 c1                	mov    %eax,%ecx
c0105880:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105883:	8b 50 04             	mov    0x4(%eax),%edx
c0105886:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105889:	01 c2                	add    %eax,%edx
c010588b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010588e:	83 ec 04             	sub    $0x4,%esp
c0105891:	51                   	push   %ecx
c0105892:	52                   	push   %edx
c0105893:	50                   	push   %eax
c0105894:	e8 83 17 00 00       	call   c010701c <Memcpy>
c0105899:	83 c4 10             	add    $0x10,%esp
c010589c:	eb 01                	jmp    c010589f <do_exec+0x270>
c010589e:	90                   	nop
c010589f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01058a3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01058a6:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01058aa:	0f b7 c0             	movzwl %ax,%eax
c01058ad:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01058b0:	0f 8c e9 fe ff ff    	jl     c010579f <do_exec+0x170>
c01058b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01058b9:	8b 40 10             	mov    0x10(%eax),%eax
c01058bc:	89 45 8c             	mov    %eax,-0x74(%ebp)
c01058bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01058c2:	8b 40 1c             	mov    0x1c(%eax),%eax
c01058c5:	89 45 88             	mov    %eax,-0x78(%ebp)
c01058c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01058cb:	8b 40 24             	mov    0x24(%eax),%eax
c01058ce:	89 45 84             	mov    %eax,-0x7c(%ebp)
c01058d1:	83 ec 0c             	sub    $0xc,%esp
c01058d4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01058d7:	e8 8a e2 ff ff       	call   c0103b66 <pid2proc>
c01058dc:	83 c4 10             	add    $0x10,%esp
c01058df:	89 45 80             	mov    %eax,-0x80(%ebp)
c01058e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01058e5:	8b 40 10             	mov    0x10(%eax),%eax
c01058e8:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01058ee:	83 ec 08             	sub    $0x8,%esp
c01058f1:	ff 75 88             	pushl  -0x78(%ebp)
c01058f4:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c01058fa:	e8 b0 08 00 00       	call   c01061af <alloc_virtual_memory>
c01058ff:	83 c4 10             	add    $0x10,%esp
c0105902:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105908:	8b 45 08             	mov    0x8(%ebp),%eax
c010590b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010590e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105914:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010591b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0105921:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105924:	eb 1a                	jmp    c0105940 <do_exec+0x311>
c0105926:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010592a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010592d:	8b 10                	mov    (%eax),%edx
c010592f:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105935:	01 c2                	add    %eax,%edx
c0105937:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010593a:	89 10                	mov    %edx,(%eax)
c010593c:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0105940:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105943:	8b 00                	mov    (%eax),%eax
c0105945:	85 c0                	test   %eax,%eax
c0105947:	75 dd                	jne    c0105926 <do_exec+0x2f7>
c0105949:	83 ec 0c             	sub    $0xc,%esp
c010594c:	ff 75 84             	pushl  -0x7c(%ebp)
c010594f:	e8 5b 08 00 00       	call   c01061af <alloc_virtual_memory>
c0105954:	83 c4 10             	add    $0x10,%esp
c0105957:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010595d:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c0105963:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0105969:	83 ec 04             	sub    $0x4,%esp
c010596c:	ff 75 88             	pushl  -0x78(%ebp)
c010596f:	52                   	push   %edx
c0105970:	50                   	push   %eax
c0105971:	e8 a6 16 00 00       	call   c010701c <Memcpy>
c0105976:	83 c4 10             	add    $0x10,%esp
c0105979:	8b 45 08             	mov    0x8(%ebp),%eax
c010597c:	8b 40 28             	mov    0x28(%eax),%eax
c010597f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105985:	83 ec 08             	sub    $0x8,%esp
c0105988:	ff 75 d4             	pushl  -0x2c(%ebp)
c010598b:	ff 75 80             	pushl  -0x80(%ebp)
c010598e:	e8 ef 08 00 00       	call   c0106282 <get_physical_address_proc>
c0105993:	83 c4 10             	add    $0x10,%esp
c0105996:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c010599c:	83 ec 08             	sub    $0x8,%esp
c010599f:	68 00 10 00 00       	push   $0x1000
c01059a4:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c01059aa:	e8 00 08 00 00       	call   c01061af <alloc_virtual_memory>
c01059af:	83 c4 10             	add    $0x10,%esp
c01059b2:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c01059b8:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c01059be:	05 bc 0f 00 00       	add    $0xfbc,%eax
c01059c3:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01059c9:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01059cf:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01059d5:	89 50 20             	mov    %edx,0x20(%eax)
c01059d8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01059db:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01059e1:	89 50 28             	mov    %edx,0x28(%eax)
c01059e4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01059e7:	8b 40 18             	mov    0x18(%eax),%eax
c01059ea:	89 c2                	mov    %eax,%edx
c01059ec:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01059f2:	89 50 30             	mov    %edx,0x30(%eax)
c01059f5:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01059fb:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105a01:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105a04:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105a07:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0105a0e:	00 00 00 
c0105a11:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105a18:	00 00 00 
c0105a1b:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0105a22:	00 00 00 
c0105a25:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c0105a2c:	00 00 00 
c0105a2f:	83 ec 04             	sub    $0x4,%esp
c0105a32:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105a35:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c0105a3b:	50                   	push   %eax
c0105a3c:	6a 01                	push   $0x1
c0105a3e:	e8 62 3e 00 00       	call   c01098a5 <send_rec>
c0105a43:	83 c4 10             	add    $0x10,%esp
c0105a46:	c9                   	leave  
c0105a47:	c3                   	ret    

c0105a48 <do_fork>:
c0105a48:	55                   	push   %ebp
c0105a49:	89 e5                	mov    %esp,%ebp
c0105a4b:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0105a51:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a54:	8b 00                	mov    (%eax),%eax
c0105a56:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a59:	83 ec 0c             	sub    $0xc,%esp
c0105a5c:	ff 75 f4             	pushl  -0xc(%ebp)
c0105a5f:	e8 3c 47 00 00       	call   c010a1a0 <fork_process>
c0105a64:	83 c4 10             	add    $0x10,%esp
c0105a67:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a6d:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105a73:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a79:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0105a7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a82:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105a85:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0105a8c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105a93:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0105a9a:	83 ec 04             	sub    $0x4,%esp
c0105a9d:	ff 75 ec             	pushl  -0x14(%ebp)
c0105aa0:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105aa6:	50                   	push   %eax
c0105aa7:	6a 01                	push   $0x1
c0105aa9:	e8 f7 3d 00 00       	call   c01098a5 <send_rec>
c0105aae:	83 c4 10             	add    $0x10,%esp
c0105ab1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ab4:	c9                   	leave  
c0105ab5:	c3                   	ret    

c0105ab6 <do_exit>:
c0105ab6:	55                   	push   %ebp
c0105ab7:	89 e5                	mov    %esp,%ebp
c0105ab9:	83 ec 18             	sub    $0x18,%esp
c0105abc:	8b 45 08             	mov    0x8(%ebp),%eax
c0105abf:	8b 00                	mov    (%eax),%eax
c0105ac1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ac4:	83 ec 0c             	sub    $0xc,%esp
c0105ac7:	ff 75 f4             	pushl  -0xc(%ebp)
c0105aca:	e8 97 e0 ff ff       	call   c0103b66 <pid2proc>
c0105acf:	83 c4 10             	add    $0x10,%esp
c0105ad2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ad5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ad8:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105ade:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ae1:	83 ec 0c             	sub    $0xc,%esp
c0105ae4:	ff 75 ec             	pushl  -0x14(%ebp)
c0105ae7:	e8 7a e0 ff ff       	call   c0103b66 <pid2proc>
c0105aec:	83 c4 10             	add    $0x10,%esp
c0105aef:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105af2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105af6:	74 45                	je     c0105b3d <do_exit+0x87>
c0105af8:	8b 45 08             	mov    0x8(%ebp),%eax
c0105afb:	8b 40 54             	mov    0x54(%eax),%eax
c0105afe:	89 c2                	mov    %eax,%edx
c0105b00:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b03:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105b09:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b0c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105b13:	3c 04                	cmp    $0x4,%al
c0105b15:	75 1a                	jne    c0105b31 <do_exit+0x7b>
c0105b17:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b1a:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105b21:	83 ec 0c             	sub    $0xc,%esp
c0105b24:	ff 75 f0             	pushl  -0x10(%ebp)
c0105b27:	e8 33 01 00 00       	call   c0105c5f <cleanup>
c0105b2c:	83 c4 10             	add    $0x10,%esp
c0105b2f:	eb 0d                	jmp    c0105b3e <do_exit+0x88>
c0105b31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b34:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0105b3b:	eb 01                	jmp    c0105b3e <do_exit+0x88>
c0105b3d:	90                   	nop
c0105b3e:	c9                   	leave  
c0105b3f:	c3                   	ret    

c0105b40 <do_wait>:
c0105b40:	55                   	push   %ebp
c0105b41:	89 e5                	mov    %esp,%ebp
c0105b43:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0105b49:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b4c:	8b 00                	mov    (%eax),%eax
c0105b4e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b51:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105b58:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105b5f:	83 ec 0c             	sub    $0xc,%esp
c0105b62:	ff 75 ec             	pushl  -0x14(%ebp)
c0105b65:	e8 fc df ff ff       	call   c0103b66 <pid2proc>
c0105b6a:	83 c4 10             	add    $0x10,%esp
c0105b6d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105b70:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105b74:	75 19                	jne    c0105b8f <do_wait+0x4f>
c0105b76:	6a 58                	push   $0x58
c0105b78:	68 11 b6 10 c0       	push   $0xc010b611
c0105b7d:	68 11 b6 10 c0       	push   $0xc010b611
c0105b82:	68 1f b6 10 c0       	push   $0xc010b61f
c0105b87:	e8 a9 30 00 00       	call   c0108c35 <assertion_failure>
c0105b8c:	83 c4 10             	add    $0x10,%esp
c0105b8f:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105b94:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c0105b9a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105b9d:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105ba0:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105ba5:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c0105bab:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105bae:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105bb1:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105bb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105bb9:	eb 5b                	jmp    c0105c16 <do_wait+0xd6>
c0105bbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105bbe:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105bc3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105bc6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105bc9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105bcf:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0105bd2:	74 0b                	je     c0105bdf <do_wait+0x9f>
c0105bd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105bd7:	8b 40 04             	mov    0x4(%eax),%eax
c0105bda:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105bdd:	eb 37                	jmp    c0105c16 <do_wait+0xd6>
c0105bdf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105be3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105be6:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105bed:	3c 03                	cmp    $0x3,%al
c0105bef:	74 0b                	je     c0105bfc <do_wait+0xbc>
c0105bf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105bf4:	8b 40 04             	mov    0x4(%eax),%eax
c0105bf7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105bfa:	eb 1a                	jmp    c0105c16 <do_wait+0xd6>
c0105bfc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105bff:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105c06:	83 ec 0c             	sub    $0xc,%esp
c0105c09:	ff 75 e8             	pushl  -0x18(%ebp)
c0105c0c:	e8 4e 00 00 00       	call   c0105c5f <cleanup>
c0105c11:	83 c4 10             	add    $0x10,%esp
c0105c14:	eb 47                	jmp    c0105c5d <do_wait+0x11d>
c0105c16:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c0105c1d:	75 9c                	jne    c0105bbb <do_wait+0x7b>
c0105c1f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105c23:	74 0c                	je     c0105c31 <do_wait+0xf1>
c0105c25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105c28:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c0105c2f:	eb 2c                	jmp    c0105c5d <do_wait+0x11d>
c0105c31:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105c38:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0105c3f:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105c46:	83 ec 04             	sub    $0x4,%esp
c0105c49:	ff 75 ec             	pushl  -0x14(%ebp)
c0105c4c:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c0105c52:	50                   	push   %eax
c0105c53:	6a 01                	push   $0x1
c0105c55:	e8 4b 3c 00 00       	call   c01098a5 <send_rec>
c0105c5a:	83 c4 10             	add    $0x10,%esp
c0105c5d:	c9                   	leave  
c0105c5e:	c3                   	ret    

c0105c5f <cleanup>:
c0105c5f:	55                   	push   %ebp
c0105c60:	89 e5                	mov    %esp,%ebp
c0105c62:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105c68:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0105c6f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105c76:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c79:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105c7f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c82:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c85:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0105c8b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105c8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c91:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105c97:	83 ec 04             	sub    $0x4,%esp
c0105c9a:	50                   	push   %eax
c0105c9b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105ca1:	50                   	push   %eax
c0105ca2:	6a 01                	push   $0x1
c0105ca4:	e8 fc 3b 00 00       	call   c01098a5 <send_rec>
c0105ca9:	83 c4 10             	add    $0x10,%esp
c0105cac:	8b 45 08             	mov    0x8(%ebp),%eax
c0105caf:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105cb6:	90                   	nop
c0105cb7:	c9                   	leave  
c0105cb8:	c3                   	ret    

c0105cb9 <init_bitmap>:
c0105cb9:	55                   	push   %ebp
c0105cba:	89 e5                	mov    %esp,%ebp
c0105cbc:	83 ec 08             	sub    $0x8,%esp
c0105cbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cc2:	8b 50 04             	mov    0x4(%eax),%edx
c0105cc5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cc8:	8b 00                	mov    (%eax),%eax
c0105cca:	83 ec 04             	sub    $0x4,%esp
c0105ccd:	52                   	push   %edx
c0105cce:	6a 00                	push   $0x0
c0105cd0:	50                   	push   %eax
c0105cd1:	e8 79 65 00 00       	call   c010c24f <Memset>
c0105cd6:	83 c4 10             	add    $0x10,%esp
c0105cd9:	90                   	nop
c0105cda:	c9                   	leave  
c0105cdb:	c3                   	ret    

c0105cdc <test_bit_val>:
c0105cdc:	55                   	push   %ebp
c0105cdd:	89 e5                	mov    %esp,%ebp
c0105cdf:	53                   	push   %ebx
c0105ce0:	83 ec 10             	sub    $0x10,%esp
c0105ce3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ce6:	8d 50 07             	lea    0x7(%eax),%edx
c0105ce9:	85 c0                	test   %eax,%eax
c0105ceb:	0f 48 c2             	cmovs  %edx,%eax
c0105cee:	c1 f8 03             	sar    $0x3,%eax
c0105cf1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105cf4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105cf7:	99                   	cltd   
c0105cf8:	c1 ea 1d             	shr    $0x1d,%edx
c0105cfb:	01 d0                	add    %edx,%eax
c0105cfd:	83 e0 07             	and    $0x7,%eax
c0105d00:	29 d0                	sub    %edx,%eax
c0105d02:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d05:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d08:	8b 10                	mov    (%eax),%edx
c0105d0a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105d0d:	01 d0                	add    %edx,%eax
c0105d0f:	0f b6 00             	movzbl (%eax),%eax
c0105d12:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105d15:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105d19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d1c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105d21:	89 c1                	mov    %eax,%ecx
c0105d23:	d3 e3                	shl    %cl,%ebx
c0105d25:	89 d8                	mov    %ebx,%eax
c0105d27:	21 c2                	and    %eax,%edx
c0105d29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d2c:	89 c1                	mov    %eax,%ecx
c0105d2e:	d3 fa                	sar    %cl,%edx
c0105d30:	89 d0                	mov    %edx,%eax
c0105d32:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d35:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105d39:	0f 9f c0             	setg   %al
c0105d3c:	0f b6 c0             	movzbl %al,%eax
c0105d3f:	83 c4 10             	add    $0x10,%esp
c0105d42:	5b                   	pop    %ebx
c0105d43:	5d                   	pop    %ebp
c0105d44:	c3                   	ret    

c0105d45 <set_bit_val>:
c0105d45:	55                   	push   %ebp
c0105d46:	89 e5                	mov    %esp,%ebp
c0105d48:	83 ec 10             	sub    $0x10,%esp
c0105d4b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d4e:	8d 50 07             	lea    0x7(%eax),%edx
c0105d51:	85 c0                	test   %eax,%eax
c0105d53:	0f 48 c2             	cmovs  %edx,%eax
c0105d56:	c1 f8 03             	sar    $0x3,%eax
c0105d59:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105d5c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d5f:	99                   	cltd   
c0105d60:	c1 ea 1d             	shr    $0x1d,%edx
c0105d63:	01 d0                	add    %edx,%eax
c0105d65:	83 e0 07             	and    $0x7,%eax
c0105d68:	29 d0                	sub    %edx,%eax
c0105d6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d70:	8b 10                	mov    (%eax),%edx
c0105d72:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105d75:	01 d0                	add    %edx,%eax
c0105d77:	0f b6 00             	movzbl (%eax),%eax
c0105d7a:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105d7d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105d81:	7e 13                	jle    c0105d96 <set_bit_val+0x51>
c0105d83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d86:	ba 01 00 00 00       	mov    $0x1,%edx
c0105d8b:	89 c1                	mov    %eax,%ecx
c0105d8d:	d3 e2                	shl    %cl,%edx
c0105d8f:	89 d0                	mov    %edx,%eax
c0105d91:	08 45 ff             	or     %al,-0x1(%ebp)
c0105d94:	eb 13                	jmp    c0105da9 <set_bit_val+0x64>
c0105d96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d99:	ba 01 00 00 00       	mov    $0x1,%edx
c0105d9e:	89 c1                	mov    %eax,%ecx
c0105da0:	d3 e2                	shl    %cl,%edx
c0105da2:	89 d0                	mov    %edx,%eax
c0105da4:	f7 d0                	not    %eax
c0105da6:	20 45 ff             	and    %al,-0x1(%ebp)
c0105da9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dac:	8b 10                	mov    (%eax),%edx
c0105dae:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105db1:	01 c2                	add    %eax,%edx
c0105db3:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105db7:	88 02                	mov    %al,(%edx)
c0105db9:	b8 01 00 00 00       	mov    $0x1,%eax
c0105dbe:	c9                   	leave  
c0105dbf:	c3                   	ret    

c0105dc0 <set_bits>:
c0105dc0:	55                   	push   %ebp
c0105dc1:	89 e5                	mov    %esp,%ebp
c0105dc3:	83 ec 10             	sub    $0x10,%esp
c0105dc6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105dcd:	eb 1c                	jmp    c0105deb <set_bits+0x2b>
c0105dcf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105dd2:	8d 50 01             	lea    0x1(%eax),%edx
c0105dd5:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105dd8:	ff 75 10             	pushl  0x10(%ebp)
c0105ddb:	50                   	push   %eax
c0105ddc:	ff 75 08             	pushl  0x8(%ebp)
c0105ddf:	e8 61 ff ff ff       	call   c0105d45 <set_bit_val>
c0105de4:	83 c4 0c             	add    $0xc,%esp
c0105de7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105deb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105dee:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105df1:	7c dc                	jl     c0105dcf <set_bits+0xf>
c0105df3:	b8 01 00 00 00       	mov    $0x1,%eax
c0105df8:	c9                   	leave  
c0105df9:	c3                   	ret    

c0105dfa <get_first_free_bit>:
c0105dfa:	55                   	push   %ebp
c0105dfb:	89 e5                	mov    %esp,%ebp
c0105dfd:	83 ec 10             	sub    $0x10,%esp
c0105e00:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e03:	8b 40 04             	mov    0x4(%eax),%eax
c0105e06:	c1 e0 03             	shl    $0x3,%eax
c0105e09:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105e0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105e12:	eb 1b                	jmp    c0105e2f <get_first_free_bit+0x35>
c0105e14:	ff 75 fc             	pushl  -0x4(%ebp)
c0105e17:	ff 75 08             	pushl  0x8(%ebp)
c0105e1a:	e8 bd fe ff ff       	call   c0105cdc <test_bit_val>
c0105e1f:	83 c4 08             	add    $0x8,%esp
c0105e22:	85 c0                	test   %eax,%eax
c0105e24:	75 05                	jne    c0105e2b <get_first_free_bit+0x31>
c0105e26:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105e29:	eb 11                	jmp    c0105e3c <get_first_free_bit+0x42>
c0105e2b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105e2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105e32:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105e35:	7c dd                	jl     c0105e14 <get_first_free_bit+0x1a>
c0105e37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105e3c:	c9                   	leave  
c0105e3d:	c3                   	ret    

c0105e3e <get_bits>:
c0105e3e:	55                   	push   %ebp
c0105e3f:	89 e5                	mov    %esp,%ebp
c0105e41:	83 ec 20             	sub    $0x20,%esp
c0105e44:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105e4b:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e4e:	ff 75 08             	pushl  0x8(%ebp)
c0105e51:	e8 a4 ff ff ff       	call   c0105dfa <get_first_free_bit>
c0105e56:	83 c4 08             	add    $0x8,%esp
c0105e59:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e5f:	8b 40 04             	mov    0x4(%eax),%eax
c0105e62:	c1 e0 03             	shl    $0x3,%eax
c0105e65:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e68:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e6b:	83 e8 01             	sub    $0x1,%eax
c0105e6e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105e71:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105e75:	75 08                	jne    c0105e7f <get_bits+0x41>
c0105e77:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e7a:	e9 85 00 00 00       	jmp    c0105f04 <get_bits+0xc6>
c0105e7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e82:	83 c0 01             	add    $0x1,%eax
c0105e85:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105e88:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e8e:	eb 58                	jmp    c0105ee8 <get_bits+0xaa>
c0105e90:	ff 75 f8             	pushl  -0x8(%ebp)
c0105e93:	ff 75 08             	pushl  0x8(%ebp)
c0105e96:	e8 41 fe ff ff       	call   c0105cdc <test_bit_val>
c0105e9b:	83 c4 08             	add    $0x8,%esp
c0105e9e:	85 c0                	test   %eax,%eax
c0105ea0:	75 0a                	jne    c0105eac <get_bits+0x6e>
c0105ea2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105ea6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105eaa:	eb 2b                	jmp    c0105ed7 <get_bits+0x99>
c0105eac:	6a 00                	push   $0x0
c0105eae:	ff 75 08             	pushl  0x8(%ebp)
c0105eb1:	e8 44 ff ff ff       	call   c0105dfa <get_first_free_bit>
c0105eb6:	83 c4 08             	add    $0x8,%esp
c0105eb9:	83 c0 01             	add    $0x1,%eax
c0105ebc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ebf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ec2:	83 c0 01             	add    $0x1,%eax
c0105ec5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105ec8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105ecb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ece:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ed1:	83 e8 01             	sub    $0x1,%eax
c0105ed4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105ed7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105eda:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105edd:	7c 09                	jl     c0105ee8 <get_bits+0xaa>
c0105edf:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105ee6:	eb 0d                	jmp    c0105ef5 <get_bits+0xb7>
c0105ee8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105eeb:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105eee:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105ef1:	85 c0                	test   %eax,%eax
c0105ef3:	7f 9b                	jg     c0105e90 <get_bits+0x52>
c0105ef5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105ef8:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105efb:	83 c0 01             	add    $0x1,%eax
c0105efe:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105f01:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105f04:	c9                   	leave  
c0105f05:	c3                   	ret    

c0105f06 <get_a_page>:
c0105f06:	55                   	push   %ebp
c0105f07:	89 e5                	mov    %esp,%ebp
c0105f09:	83 ec 28             	sub    $0x28,%esp
c0105f0c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105f10:	75 22                	jne    c0105f34 <get_a_page+0x2e>
c0105f12:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105f17:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f1a:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105f1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f22:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105f27:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f2a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105f2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f32:	eb 20                	jmp    c0105f54 <get_a_page+0x4e>
c0105f34:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105f39:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f3c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105f41:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f44:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105f49:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f4c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105f51:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f54:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105f57:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105f5a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f5d:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105f60:	6a 01                	push   $0x1
c0105f62:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105f65:	50                   	push   %eax
c0105f66:	e8 d3 fe ff ff       	call   c0105e3e <get_bits>
c0105f6b:	83 c4 08             	add    $0x8,%esp
c0105f6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f71:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105f75:	75 1c                	jne    c0105f93 <get_a_page+0x8d>
c0105f77:	68 84 00 00 00       	push   $0x84
c0105f7c:	68 32 b6 10 c0       	push   $0xc010b632
c0105f81:	68 32 b6 10 c0       	push   $0xc010b632
c0105f86:	68 3c b6 10 c0       	push   $0xc010b63c
c0105f8b:	e8 a5 2c 00 00       	call   c0108c35 <assertion_failure>
c0105f90:	83 c4 10             	add    $0x10,%esp
c0105f93:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105f96:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105f99:	c1 e2 0c             	shl    $0xc,%edx
c0105f9c:	01 d0                	add    %edx,%eax
c0105f9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fa1:	83 ec 04             	sub    $0x4,%esp
c0105fa4:	6a 01                	push   $0x1
c0105fa6:	ff 75 f4             	pushl  -0xc(%ebp)
c0105fa9:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105fac:	50                   	push   %eax
c0105fad:	e8 93 fd ff ff       	call   c0105d45 <set_bit_val>
c0105fb2:	83 c4 10             	add    $0x10,%esp
c0105fb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fb8:	c9                   	leave  
c0105fb9:	c3                   	ret    

c0105fba <get_virtual_address_start_with_addr>:
c0105fba:	55                   	push   %ebp
c0105fbb:	89 e5                	mov    %esp,%ebp
c0105fbd:	83 ec 38             	sub    $0x38,%esp
c0105fc0:	e8 77 a4 ff ff       	call   c010043c <get_running_thread_pcb>
c0105fc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fc8:	83 ec 0c             	sub    $0xc,%esp
c0105fcb:	ff 75 10             	pushl  0x10(%ebp)
c0105fce:	e8 93 db ff ff       	call   c0103b66 <pid2proc>
c0105fd3:	83 c4 10             	add    $0x10,%esp
c0105fd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fdc:	8b 40 0c             	mov    0xc(%eax),%eax
c0105fdf:	83 ec 04             	sub    $0x4,%esp
c0105fe2:	6a 0c                	push   $0xc
c0105fe4:	50                   	push   %eax
c0105fe5:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105fe8:	50                   	push   %eax
c0105fe9:	e8 2e 10 00 00       	call   c010701c <Memcpy>
c0105fee:	83 c4 10             	add    $0x10,%esp
c0105ff1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105ff4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105ff7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105ffa:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105ffd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106000:	8b 55 08             	mov    0x8(%ebp),%edx
c0106003:	29 c2                	sub    %eax,%edx
c0106005:	89 d0                	mov    %edx,%eax
c0106007:	c1 e8 0c             	shr    $0xc,%eax
c010600a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010600d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0106011:	79 1c                	jns    c010602f <get_virtual_address_start_with_addr+0x75>
c0106013:	68 97 00 00 00       	push   $0x97
c0106018:	68 32 b6 10 c0       	push   $0xc010b632
c010601d:	68 32 b6 10 c0       	push   $0xc010b632
c0106022:	68 48 b6 10 c0       	push   $0xc010b648
c0106027:	e8 09 2c 00 00       	call   c0108c35 <assertion_failure>
c010602c:	83 c4 10             	add    $0x10,%esp
c010602f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106032:	50                   	push   %eax
c0106033:	6a 01                	push   $0x1
c0106035:	ff 75 ec             	pushl  -0x14(%ebp)
c0106038:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c010603b:	50                   	push   %eax
c010603c:	e8 7f fd ff ff       	call   c0105dc0 <set_bits>
c0106041:	83 c4 10             	add    $0x10,%esp
c0106044:	8b 45 08             	mov    0x8(%ebp),%eax
c0106047:	25 ff 0f 00 00       	and    $0xfff,%eax
c010604c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010604f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106052:	c9                   	leave  
c0106053:	c3                   	ret    

c0106054 <get_virtual_address>:
c0106054:	55                   	push   %ebp
c0106055:	89 e5                	mov    %esp,%ebp
c0106057:	83 ec 28             	sub    $0x28,%esp
c010605a:	e8 dd a3 ff ff       	call   c010043c <get_running_thread_pcb>
c010605f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106062:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106066:	75 1a                	jne    c0106082 <get_virtual_address+0x2e>
c0106068:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010606d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106070:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106075:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106078:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010607d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106080:	eb 18                	jmp    c010609a <get_virtual_address+0x46>
c0106082:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106085:	8b 40 0c             	mov    0xc(%eax),%eax
c0106088:	83 ec 04             	sub    $0x4,%esp
c010608b:	6a 0c                	push   $0xc
c010608d:	50                   	push   %eax
c010608e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0106091:	50                   	push   %eax
c0106092:	e8 85 0f 00 00       	call   c010701c <Memcpy>
c0106097:	83 c4 10             	add    $0x10,%esp
c010609a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010609d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01060a0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01060a3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01060a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01060a9:	83 ec 08             	sub    $0x8,%esp
c01060ac:	50                   	push   %eax
c01060ad:	8d 45 d8             	lea    -0x28(%ebp),%eax
c01060b0:	50                   	push   %eax
c01060b1:	e8 88 fd ff ff       	call   c0105e3e <get_bits>
c01060b6:	83 c4 10             	add    $0x10,%esp
c01060b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01060bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01060bf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01060c2:	c1 e2 0c             	shl    $0xc,%edx
c01060c5:	01 d0                	add    %edx,%eax
c01060c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01060ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01060cd:	50                   	push   %eax
c01060ce:	6a 01                	push   $0x1
c01060d0:	ff 75 f0             	pushl  -0x10(%ebp)
c01060d3:	8d 45 d8             	lea    -0x28(%ebp),%eax
c01060d6:	50                   	push   %eax
c01060d7:	e8 e4 fc ff ff       	call   c0105dc0 <set_bits>
c01060dc:	83 c4 10             	add    $0x10,%esp
c01060df:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060e2:	c9                   	leave  
c01060e3:	c3                   	ret    

c01060e4 <ptr_pde>:
c01060e4:	55                   	push   %ebp
c01060e5:	89 e5                	mov    %esp,%ebp
c01060e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01060ea:	c1 e8 16             	shr    $0x16,%eax
c01060ed:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c01060f2:	c1 e0 02             	shl    $0x2,%eax
c01060f5:	5d                   	pop    %ebp
c01060f6:	c3                   	ret    

c01060f7 <ptr_pte>:
c01060f7:	55                   	push   %ebp
c01060f8:	89 e5                	mov    %esp,%ebp
c01060fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01060fd:	c1 e8 0a             	shr    $0xa,%eax
c0106100:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0106105:	89 c2                	mov    %eax,%edx
c0106107:	8b 45 08             	mov    0x8(%ebp),%eax
c010610a:	c1 e8 0c             	shr    $0xc,%eax
c010610d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0106112:	c1 e0 02             	shl    $0x2,%eax
c0106115:	01 d0                	add    %edx,%eax
c0106117:	2d 00 00 40 00       	sub    $0x400000,%eax
c010611c:	5d                   	pop    %ebp
c010611d:	c3                   	ret    

c010611e <add_map_entry>:
c010611e:	55                   	push   %ebp
c010611f:	89 e5                	mov    %esp,%ebp
c0106121:	83 ec 18             	sub    $0x18,%esp
c0106124:	ff 75 08             	pushl  0x8(%ebp)
c0106127:	e8 b8 ff ff ff       	call   c01060e4 <ptr_pde>
c010612c:	83 c4 04             	add    $0x4,%esp
c010612f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106132:	ff 75 08             	pushl  0x8(%ebp)
c0106135:	e8 bd ff ff ff       	call   c01060f7 <ptr_pte>
c010613a:	83 c4 04             	add    $0x4,%esp
c010613d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106140:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106143:	8b 00                	mov    (%eax),%eax
c0106145:	83 e0 01             	and    $0x1,%eax
c0106148:	85 c0                	test   %eax,%eax
c010614a:	74 1b                	je     c0106167 <add_map_entry+0x49>
c010614c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010614f:	8b 00                	mov    (%eax),%eax
c0106151:	83 e0 01             	and    $0x1,%eax
c0106154:	85 c0                	test   %eax,%eax
c0106156:	75 54                	jne    c01061ac <add_map_entry+0x8e>
c0106158:	8b 45 0c             	mov    0xc(%ebp),%eax
c010615b:	83 c8 07             	or     $0x7,%eax
c010615e:	89 c2                	mov    %eax,%edx
c0106160:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106163:	89 10                	mov    %edx,(%eax)
c0106165:	eb 45                	jmp    c01061ac <add_map_entry+0x8e>
c0106167:	83 ec 0c             	sub    $0xc,%esp
c010616a:	6a 00                	push   $0x0
c010616c:	e8 95 fd ff ff       	call   c0105f06 <get_a_page>
c0106171:	83 c4 10             	add    $0x10,%esp
c0106174:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106177:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010617a:	83 c8 07             	or     $0x7,%eax
c010617d:	89 c2                	mov    %eax,%edx
c010617f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106182:	89 10                	mov    %edx,(%eax)
c0106184:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106187:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010618c:	83 ec 04             	sub    $0x4,%esp
c010618f:	68 00 10 00 00       	push   $0x1000
c0106194:	6a 00                	push   $0x0
c0106196:	50                   	push   %eax
c0106197:	e8 b3 60 00 00       	call   c010c24f <Memset>
c010619c:	83 c4 10             	add    $0x10,%esp
c010619f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01061a2:	83 c8 07             	or     $0x7,%eax
c01061a5:	89 c2                	mov    %eax,%edx
c01061a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01061aa:	89 10                	mov    %edx,(%eax)
c01061ac:	90                   	nop
c01061ad:	c9                   	leave  
c01061ae:	c3                   	ret    

c01061af <alloc_virtual_memory>:
c01061af:	55                   	push   %ebp
c01061b0:	89 e5                	mov    %esp,%ebp
c01061b2:	83 ec 28             	sub    $0x28,%esp
c01061b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01061b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01061bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01061c3:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01061c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01061c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01061cc:	01 45 e4             	add    %eax,-0x1c(%ebp)
c01061cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01061d2:	05 ff 0f 00 00       	add    $0xfff,%eax
c01061d7:	c1 e8 0c             	shr    $0xc,%eax
c01061da:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01061dd:	e8 5a a2 ff ff       	call   c010043c <get_running_thread_pcb>
c01061e2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01061e5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01061e8:	8b 50 08             	mov    0x8(%eax),%edx
c01061eb:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01061f0:	39 c2                	cmp    %eax,%edx
c01061f2:	75 09                	jne    c01061fd <alloc_virtual_memory+0x4e>
c01061f4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01061fb:	eb 07                	jmp    c0106204 <alloc_virtual_memory+0x55>
c01061fd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106204:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010620b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106212:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0106219:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106220:	eb 47                	jmp    c0106269 <alloc_virtual_memory+0xba>
c0106222:	83 ec 08             	sub    $0x8,%esp
c0106225:	ff 75 f0             	pushl  -0x10(%ebp)
c0106228:	6a 01                	push   $0x1
c010622a:	e8 25 fe ff ff       	call   c0106054 <get_virtual_address>
c010622f:	83 c4 10             	add    $0x10,%esp
c0106232:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106235:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0106239:	74 13                	je     c010624e <alloc_virtual_memory+0x9f>
c010623b:	83 ec 0c             	sub    $0xc,%esp
c010623e:	ff 75 f0             	pushl  -0x10(%ebp)
c0106241:	e8 c0 fc ff ff       	call   c0105f06 <get_a_page>
c0106246:	83 c4 10             	add    $0x10,%esp
c0106249:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010624c:	eb 06                	jmp    c0106254 <alloc_virtual_memory+0xa5>
c010624e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106251:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106254:	83 ec 08             	sub    $0x8,%esp
c0106257:	ff 75 f4             	pushl  -0xc(%ebp)
c010625a:	ff 75 d8             	pushl  -0x28(%ebp)
c010625d:	e8 bc fe ff ff       	call   c010611e <add_map_entry>
c0106262:	83 c4 10             	add    $0x10,%esp
c0106265:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106269:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010626c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c010626f:	72 b1                	jb     c0106222 <alloc_virtual_memory+0x73>
c0106271:	8b 45 08             	mov    0x8(%ebp),%eax
c0106274:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106279:	89 c2                	mov    %eax,%edx
c010627b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010627e:	01 d0                	add    %edx,%eax
c0106280:	c9                   	leave  
c0106281:	c3                   	ret    

c0106282 <get_physical_address_proc>:
c0106282:	55                   	push   %ebp
c0106283:	89 e5                	mov    %esp,%ebp
c0106285:	83 ec 18             	sub    $0x18,%esp
c0106288:	e8 d3 a0 ff ff       	call   c0100360 <disable_int>
c010628d:	e8 aa a1 ff ff       	call   c010043c <get_running_thread_pcb>
c0106292:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106295:	83 ec 0c             	sub    $0xc,%esp
c0106298:	ff 75 0c             	pushl  0xc(%ebp)
c010629b:	e8 c6 d8 ff ff       	call   c0103b66 <pid2proc>
c01062a0:	83 c4 10             	add    $0x10,%esp
c01062a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01062a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01062a9:	8b 40 08             	mov    0x8(%eax),%eax
c01062ac:	83 ec 0c             	sub    $0xc,%esp
c01062af:	50                   	push   %eax
c01062b0:	e8 6b a1 ff ff       	call   c0100420 <update_cr3>
c01062b5:	83 c4 10             	add    $0x10,%esp
c01062b8:	83 ec 0c             	sub    $0xc,%esp
c01062bb:	ff 75 08             	pushl  0x8(%ebp)
c01062be:	e8 34 fe ff ff       	call   c01060f7 <ptr_pte>
c01062c3:	83 c4 10             	add    $0x10,%esp
c01062c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01062c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062cc:	8b 00                	mov    (%eax),%eax
c01062ce:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01062d3:	89 c2                	mov    %eax,%edx
c01062d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01062d8:	25 ff 0f 00 00       	and    $0xfff,%eax
c01062dd:	09 d0                	or     %edx,%eax
c01062df:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01062e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01062e5:	8b 40 08             	mov    0x8(%eax),%eax
c01062e8:	83 ec 0c             	sub    $0xc,%esp
c01062eb:	50                   	push   %eax
c01062ec:	e8 2f a1 ff ff       	call   c0100420 <update_cr3>
c01062f1:	83 c4 10             	add    $0x10,%esp
c01062f4:	e8 69 a0 ff ff       	call   c0100362 <enable_int>
c01062f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01062fc:	c9                   	leave  
c01062fd:	c3                   	ret    

c01062fe <get_physical_address>:
c01062fe:	55                   	push   %ebp
c01062ff:	89 e5                	mov    %esp,%ebp
c0106301:	83 ec 10             	sub    $0x10,%esp
c0106304:	ff 75 08             	pushl  0x8(%ebp)
c0106307:	e8 eb fd ff ff       	call   c01060f7 <ptr_pte>
c010630c:	83 c4 04             	add    $0x4,%esp
c010630f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106312:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106315:	8b 00                	mov    (%eax),%eax
c0106317:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010631c:	89 c2                	mov    %eax,%edx
c010631e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106321:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106326:	09 d0                	or     %edx,%eax
c0106328:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010632b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010632e:	c9                   	leave  
c010632f:	c3                   	ret    

c0106330 <alloc_physical_memory_of_proc>:
c0106330:	55                   	push   %ebp
c0106331:	89 e5                	mov    %esp,%ebp
c0106333:	83 ec 48             	sub    $0x48,%esp
c0106336:	e8 25 a0 ff ff       	call   c0100360 <disable_int>
c010633b:	8b 45 08             	mov    0x8(%ebp),%eax
c010633e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106343:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106346:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010634d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106350:	83 ec 0c             	sub    $0xc,%esp
c0106353:	50                   	push   %eax
c0106354:	e8 0d d8 ff ff       	call   c0103b66 <pid2proc>
c0106359:	83 c4 10             	add    $0x10,%esp
c010635c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010635f:	e8 d8 a0 ff ff       	call   c010043c <get_running_thread_pcb>
c0106364:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106367:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010636a:	8b 40 0c             	mov    0xc(%eax),%eax
c010636d:	83 ec 04             	sub    $0x4,%esp
c0106370:	6a 0c                	push   $0xc
c0106372:	50                   	push   %eax
c0106373:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106376:	50                   	push   %eax
c0106377:	e8 a0 0c 00 00       	call   c010701c <Memcpy>
c010637c:	83 c4 10             	add    $0x10,%esp
c010637f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106382:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0106385:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106388:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010638b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010638e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106391:	29 c2                	sub    %eax,%edx
c0106393:	89 d0                	mov    %edx,%eax
c0106395:	c1 e8 0c             	shr    $0xc,%eax
c0106398:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010639b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010639e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01063a1:	c1 e2 0c             	shl    $0xc,%edx
c01063a4:	01 d0                	add    %edx,%eax
c01063a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01063a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01063ac:	6a 01                	push   $0x1
c01063ae:	6a 01                	push   $0x1
c01063b0:	50                   	push   %eax
c01063b1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01063b4:	50                   	push   %eax
c01063b5:	e8 06 fa ff ff       	call   c0105dc0 <set_bits>
c01063ba:	83 c4 10             	add    $0x10,%esp
c01063bd:	83 ec 0c             	sub    $0xc,%esp
c01063c0:	ff 75 f0             	pushl  -0x10(%ebp)
c01063c3:	e8 3e fb ff ff       	call   c0105f06 <get_a_page>
c01063c8:	83 c4 10             	add    $0x10,%esp
c01063cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01063ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01063d1:	25 ff 0f 00 00       	and    $0xfff,%eax
c01063d6:	89 c2                	mov    %eax,%edx
c01063d8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01063db:	01 d0                	add    %edx,%eax
c01063dd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01063e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063e3:	8b 40 08             	mov    0x8(%eax),%eax
c01063e6:	83 ec 0c             	sub    $0xc,%esp
c01063e9:	50                   	push   %eax
c01063ea:	e8 31 a0 ff ff       	call   c0100420 <update_cr3>
c01063ef:	83 c4 10             	add    $0x10,%esp
c01063f2:	83 ec 08             	sub    $0x8,%esp
c01063f5:	ff 75 dc             	pushl  -0x24(%ebp)
c01063f8:	ff 75 f4             	pushl  -0xc(%ebp)
c01063fb:	e8 1e fd ff ff       	call   c010611e <add_map_entry>
c0106400:	83 c4 10             	add    $0x10,%esp
c0106403:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106406:	8b 40 08             	mov    0x8(%eax),%eax
c0106409:	83 ec 0c             	sub    $0xc,%esp
c010640c:	50                   	push   %eax
c010640d:	e8 0e a0 ff ff       	call   c0100420 <update_cr3>
c0106412:	83 c4 10             	add    $0x10,%esp
c0106415:	e8 48 9f ff ff       	call   c0100362 <enable_int>
c010641a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010641d:	c9                   	leave  
c010641e:	c3                   	ret    

c010641f <alloc_physical_memory>:
c010641f:	55                   	push   %ebp
c0106420:	89 e5                	mov    %esp,%ebp
c0106422:	83 ec 38             	sub    $0x38,%esp
c0106425:	8b 45 08             	mov    0x8(%ebp),%eax
c0106428:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010642d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106430:	e8 07 a0 ff ff       	call   c010043c <get_running_thread_pcb>
c0106435:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106438:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010643c:	75 1a                	jne    c0106458 <alloc_physical_memory+0x39>
c010643e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106443:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106446:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010644b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010644e:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106453:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106456:	eb 18                	jmp    c0106470 <alloc_physical_memory+0x51>
c0106458:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010645b:	8b 40 0c             	mov    0xc(%eax),%eax
c010645e:	83 ec 04             	sub    $0x4,%esp
c0106461:	6a 0c                	push   $0xc
c0106463:	50                   	push   %eax
c0106464:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0106467:	50                   	push   %eax
c0106468:	e8 af 0b 00 00       	call   c010701c <Memcpy>
c010646d:	83 c4 10             	add    $0x10,%esp
c0106470:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106473:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106476:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106479:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010647c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010647f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106482:	29 c2                	sub    %eax,%edx
c0106484:	89 d0                	mov    %edx,%eax
c0106486:	c1 e8 0c             	shr    $0xc,%eax
c0106489:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010648c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010648f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106492:	c1 e2 0c             	shl    $0xc,%edx
c0106495:	01 d0                	add    %edx,%eax
c0106497:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010649a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010649d:	6a 01                	push   $0x1
c010649f:	6a 01                	push   $0x1
c01064a1:	50                   	push   %eax
c01064a2:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01064a5:	50                   	push   %eax
c01064a6:	e8 15 f9 ff ff       	call   c0105dc0 <set_bits>
c01064ab:	83 c4 10             	add    $0x10,%esp
c01064ae:	83 ec 0c             	sub    $0xc,%esp
c01064b1:	ff 75 0c             	pushl  0xc(%ebp)
c01064b4:	e8 4d fa ff ff       	call   c0105f06 <get_a_page>
c01064b9:	83 c4 10             	add    $0x10,%esp
c01064bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01064bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01064c2:	25 ff 0f 00 00       	and    $0xfff,%eax
c01064c7:	89 c2                	mov    %eax,%edx
c01064c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01064cc:	01 d0                	add    %edx,%eax
c01064ce:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01064d1:	83 ec 08             	sub    $0x8,%esp
c01064d4:	ff 75 e4             	pushl  -0x1c(%ebp)
c01064d7:	ff 75 f4             	pushl  -0xc(%ebp)
c01064da:	e8 3f fc ff ff       	call   c010611e <add_map_entry>
c01064df:	83 c4 10             	add    $0x10,%esp
c01064e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01064e5:	c9                   	leave  
c01064e6:	c3                   	ret    

c01064e7 <alloc_memory>:
c01064e7:	55                   	push   %ebp
c01064e8:	89 e5                	mov    %esp,%ebp
c01064ea:	83 ec 18             	sub    $0x18,%esp
c01064ed:	83 ec 08             	sub    $0x8,%esp
c01064f0:	ff 75 0c             	pushl  0xc(%ebp)
c01064f3:	ff 75 08             	pushl  0x8(%ebp)
c01064f6:	e8 59 fb ff ff       	call   c0106054 <get_virtual_address>
c01064fb:	83 c4 10             	add    $0x10,%esp
c01064fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106501:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106504:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106509:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010650c:	eb 29                	jmp    c0106537 <alloc_memory+0x50>
c010650e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106515:	83 ec 0c             	sub    $0xc,%esp
c0106518:	ff 75 0c             	pushl  0xc(%ebp)
c010651b:	e8 e6 f9 ff ff       	call   c0105f06 <get_a_page>
c0106520:	83 c4 10             	add    $0x10,%esp
c0106523:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106526:	83 ec 08             	sub    $0x8,%esp
c0106529:	ff 75 ec             	pushl  -0x14(%ebp)
c010652c:	ff 75 f4             	pushl  -0xc(%ebp)
c010652f:	e8 ea fb ff ff       	call   c010611e <add_map_entry>
c0106534:	83 c4 10             	add    $0x10,%esp
c0106537:	8b 45 08             	mov    0x8(%ebp),%eax
c010653a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010653d:	89 55 08             	mov    %edx,0x8(%ebp)
c0106540:	85 c0                	test   %eax,%eax
c0106542:	75 ca                	jne    c010650e <alloc_memory+0x27>
c0106544:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106547:	c9                   	leave  
c0106548:	c3                   	ret    

c0106549 <get_a_virtual_page>:
c0106549:	55                   	push   %ebp
c010654a:	89 e5                	mov    %esp,%ebp
c010654c:	83 ec 18             	sub    $0x18,%esp
c010654f:	83 ec 0c             	sub    $0xc,%esp
c0106552:	ff 75 08             	pushl  0x8(%ebp)
c0106555:	e8 ac f9 ff ff       	call   c0105f06 <get_a_page>
c010655a:	83 c4 10             	add    $0x10,%esp
c010655d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106560:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106563:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106568:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010656b:	83 ec 08             	sub    $0x8,%esp
c010656e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106571:	ff 75 f0             	pushl  -0x10(%ebp)
c0106574:	e8 a5 fb ff ff       	call   c010611e <add_map_entry>
c0106579:	83 c4 10             	add    $0x10,%esp
c010657c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010657f:	c9                   	leave  
c0106580:	c3                   	ret    

c0106581 <block2arena>:
c0106581:	55                   	push   %ebp
c0106582:	89 e5                	mov    %esp,%ebp
c0106584:	83 ec 10             	sub    $0x10,%esp
c0106587:	8b 45 08             	mov    0x8(%ebp),%eax
c010658a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010658f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106592:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106595:	c9                   	leave  
c0106596:	c3                   	ret    

c0106597 <sys_malloc2>:
c0106597:	55                   	push   %ebp
c0106598:	89 e5                	mov    %esp,%ebp
c010659a:	83 ec 68             	sub    $0x68,%esp
c010659d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01065a4:	e8 93 9e ff ff       	call   c010043c <get_running_thread_pcb>
c01065a9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01065ac:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01065af:	8b 50 08             	mov    0x8(%eax),%edx
c01065b2:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01065b7:	39 c2                	cmp    %eax,%edx
c01065b9:	75 10                	jne    c01065cb <sys_malloc2+0x34>
c01065bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01065c2:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c01065c9:	eb 10                	jmp    c01065db <sys_malloc2+0x44>
c01065cb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01065d2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01065d5:	83 c0 10             	add    $0x10,%eax
c01065d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01065db:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c01065e2:	76 52                	jbe    c0106636 <sys_malloc2+0x9f>
c01065e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01065e7:	05 0b 10 00 00       	add    $0x100b,%eax
c01065ec:	c1 e8 0c             	shr    $0xc,%eax
c01065ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01065f2:	83 ec 08             	sub    $0x8,%esp
c01065f5:	ff 75 f0             	pushl  -0x10(%ebp)
c01065f8:	ff 75 d8             	pushl  -0x28(%ebp)
c01065fb:	e8 e7 fe ff ff       	call   c01064e7 <alloc_memory>
c0106600:	83 c4 10             	add    $0x10,%esp
c0106603:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106606:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106609:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010660c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010660f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106615:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106618:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010661f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106622:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106626:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106629:	05 90 00 00 00       	add    $0x90,%eax
c010662e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106631:	e9 f0 01 00 00       	jmp    c0106826 <sys_malloc2+0x28f>
c0106636:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010663d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106644:	eb 26                	jmp    c010666c <sys_malloc2+0xd5>
c0106646:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106649:	89 d0                	mov    %edx,%eax
c010664b:	01 c0                	add    %eax,%eax
c010664d:	01 d0                	add    %edx,%eax
c010664f:	c1 e0 03             	shl    $0x3,%eax
c0106652:	89 c2                	mov    %eax,%edx
c0106654:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106657:	01 d0                	add    %edx,%eax
c0106659:	8b 00                	mov    (%eax),%eax
c010665b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010665e:	77 08                	ja     c0106668 <sys_malloc2+0xd1>
c0106660:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106663:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106666:	eb 0a                	jmp    c0106672 <sys_malloc2+0xdb>
c0106668:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010666c:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0106670:	7e d4                	jle    c0106646 <sys_malloc2+0xaf>
c0106672:	83 ec 08             	sub    $0x8,%esp
c0106675:	ff 75 f0             	pushl  -0x10(%ebp)
c0106678:	6a 01                	push   $0x1
c010667a:	e8 68 fe ff ff       	call   c01064e7 <alloc_memory>
c010667f:	83 c4 10             	add    $0x10,%esp
c0106682:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106685:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106688:	89 d0                	mov    %edx,%eax
c010668a:	01 c0                	add    %eax,%eax
c010668c:	01 d0                	add    %edx,%eax
c010668e:	c1 e0 03             	shl    $0x3,%eax
c0106691:	89 c2                	mov    %eax,%edx
c0106693:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106696:	01 d0                	add    %edx,%eax
c0106698:	83 ec 04             	sub    $0x4,%esp
c010669b:	6a 18                	push   $0x18
c010669d:	50                   	push   %eax
c010669e:	ff 75 cc             	pushl  -0x34(%ebp)
c01066a1:	e8 76 09 00 00       	call   c010701c <Memcpy>
c01066a6:	83 c4 10             	add    $0x10,%esp
c01066a9:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01066b0:	e8 03 09 00 00       	call   c0106fb8 <intr_disable>
c01066b5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01066b8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01066bb:	89 d0                	mov    %edx,%eax
c01066bd:	01 c0                	add    %eax,%eax
c01066bf:	01 d0                	add    %edx,%eax
c01066c1:	c1 e0 03             	shl    $0x3,%eax
c01066c4:	89 c2                	mov    %eax,%edx
c01066c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01066c9:	01 d0                	add    %edx,%eax
c01066cb:	83 c0 08             	add    $0x8,%eax
c01066ce:	83 ec 0c             	sub    $0xc,%esp
c01066d1:	50                   	push   %eax
c01066d2:	e8 1c 3d 00 00       	call   c010a3f3 <isListEmpty>
c01066d7:	83 c4 10             	add    $0x10,%esp
c01066da:	3c 01                	cmp    $0x1,%al
c01066dc:	0f 85 c1 00 00 00    	jne    c01067a3 <sys_malloc2+0x20c>
c01066e2:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c01066e9:	83 ec 08             	sub    $0x8,%esp
c01066ec:	ff 75 f0             	pushl  -0x10(%ebp)
c01066ef:	6a 01                	push   $0x1
c01066f1:	e8 f1 fd ff ff       	call   c01064e7 <alloc_memory>
c01066f6:	83 c4 10             	add    $0x10,%esp
c01066f9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01066fc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01066ff:	83 ec 0c             	sub    $0xc,%esp
c0106702:	50                   	push   %eax
c0106703:	e8 79 fe ff ff       	call   c0106581 <block2arena>
c0106708:	83 c4 10             	add    $0x10,%esp
c010670b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010670e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106711:	89 d0                	mov    %edx,%eax
c0106713:	01 c0                	add    %eax,%eax
c0106715:	01 d0                	add    %edx,%eax
c0106717:	c1 e0 03             	shl    $0x3,%eax
c010671a:	89 c2                	mov    %eax,%edx
c010671c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010671f:	01 d0                	add    %edx,%eax
c0106721:	8b 50 04             	mov    0x4(%eax),%edx
c0106724:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106727:	89 50 04             	mov    %edx,0x4(%eax)
c010672a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010672d:	8b 00                	mov    (%eax),%eax
c010672f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106732:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106739:	b8 00 10 00 00       	mov    $0x1000,%eax
c010673e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0106741:	ba 00 00 00 00       	mov    $0x0,%edx
c0106746:	f7 75 b8             	divl   -0x48(%ebp)
c0106749:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010674c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010674f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0106752:	01 d0                	add    %edx,%eax
c0106754:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106757:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010675e:	eb 3b                	jmp    c010679b <sys_malloc2+0x204>
c0106760:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106763:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0106767:	89 c2                	mov    %eax,%edx
c0106769:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010676c:	01 d0                	add    %edx,%eax
c010676e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106771:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106774:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106777:	89 d0                	mov    %edx,%eax
c0106779:	01 c0                	add    %eax,%eax
c010677b:	01 d0                	add    %edx,%eax
c010677d:	c1 e0 03             	shl    $0x3,%eax
c0106780:	89 c2                	mov    %eax,%edx
c0106782:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106785:	01 d0                	add    %edx,%eax
c0106787:	83 c0 08             	add    $0x8,%eax
c010678a:	83 ec 08             	sub    $0x8,%esp
c010678d:	51                   	push   %ecx
c010678e:	50                   	push   %eax
c010678f:	e8 5c 3d 00 00       	call   c010a4f0 <appendToDoubleLinkList>
c0106794:	83 c4 10             	add    $0x10,%esp
c0106797:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010679b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010679e:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01067a1:	77 bd                	ja     c0106760 <sys_malloc2+0x1c9>
c01067a3:	83 ec 0c             	sub    $0xc,%esp
c01067a6:	ff 75 c4             	pushl  -0x3c(%ebp)
c01067a9:	e8 33 08 00 00       	call   c0106fe1 <intr_set_status>
c01067ae:	83 c4 10             	add    $0x10,%esp
c01067b1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01067b4:	89 d0                	mov    %edx,%eax
c01067b6:	01 c0                	add    %eax,%eax
c01067b8:	01 d0                	add    %edx,%eax
c01067ba:	c1 e0 03             	shl    $0x3,%eax
c01067bd:	89 c2                	mov    %eax,%edx
c01067bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01067c2:	01 d0                	add    %edx,%eax
c01067c4:	83 c0 08             	add    $0x8,%eax
c01067c7:	83 ec 0c             	sub    $0xc,%esp
c01067ca:	50                   	push   %eax
c01067cb:	e8 8a 3e 00 00       	call   c010a65a <popFromDoubleLinkList>
c01067d0:	83 c4 10             	add    $0x10,%esp
c01067d3:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01067d6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01067d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01067dc:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c01067e0:	75 1c                	jne    c01067fe <sys_malloc2+0x267>
c01067e2:	68 ef 01 00 00       	push   $0x1ef
c01067e7:	68 32 b6 10 c0       	push   $0xc010b632
c01067ec:	68 32 b6 10 c0       	push   $0xc010b632
c01067f1:	68 53 b6 10 c0       	push   $0xc010b653
c01067f6:	e8 3a 24 00 00       	call   c0108c35 <assertion_failure>
c01067fb:	83 c4 10             	add    $0x10,%esp
c01067fe:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106801:	83 ec 0c             	sub    $0xc,%esp
c0106804:	50                   	push   %eax
c0106805:	e8 77 fd ff ff       	call   c0106581 <block2arena>
c010680a:	83 c4 10             	add    $0x10,%esp
c010680d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106810:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106813:	8b 40 04             	mov    0x4(%eax),%eax
c0106816:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106819:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010681c:	89 50 04             	mov    %edx,0x4(%eax)
c010681f:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106826:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010682a:	75 1c                	jne    c0106848 <sys_malloc2+0x2b1>
c010682c:	68 f6 01 00 00       	push   $0x1f6
c0106831:	68 32 b6 10 c0       	push   $0xc010b632
c0106836:	68 32 b6 10 c0       	push   $0xc010b632
c010683b:	68 65 b6 10 c0       	push   $0xc010b665
c0106840:	e8 f0 23 00 00       	call   c0108c35 <assertion_failure>
c0106845:	83 c4 10             	add    $0x10,%esp
c0106848:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010684b:	c9                   	leave  
c010684c:	c3                   	ret    

c010684d <remove_map_entry>:
c010684d:	55                   	push   %ebp
c010684e:	89 e5                	mov    %esp,%ebp
c0106850:	83 ec 10             	sub    $0x10,%esp
c0106853:	ff 75 08             	pushl  0x8(%ebp)
c0106856:	e8 9c f8 ff ff       	call   c01060f7 <ptr_pte>
c010685b:	83 c4 04             	add    $0x4,%esp
c010685e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106861:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106864:	8b 10                	mov    (%eax),%edx
c0106866:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106869:	89 10                	mov    %edx,(%eax)
c010686b:	90                   	nop
c010686c:	c9                   	leave  
c010686d:	c3                   	ret    

c010686e <free_a_page>:
c010686e:	55                   	push   %ebp
c010686f:	89 e5                	mov    %esp,%ebp
c0106871:	83 ec 20             	sub    $0x20,%esp
c0106874:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106878:	75 21                	jne    c010689b <free_a_page+0x2d>
c010687a:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010687f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106882:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106887:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010688a:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010688f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106892:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106899:	eb 1f                	jmp    c01068ba <free_a_page+0x4c>
c010689b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01068a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01068a3:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01068a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01068ab:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01068b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01068b3:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c01068ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01068bd:	c1 e8 0c             	shr    $0xc,%eax
c01068c0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01068c3:	6a 00                	push   $0x0
c01068c5:	ff 75 f8             	pushl  -0x8(%ebp)
c01068c8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01068cb:	50                   	push   %eax
c01068cc:	e8 74 f4 ff ff       	call   c0105d45 <set_bit_val>
c01068d1:	83 c4 0c             	add    $0xc,%esp
c01068d4:	ff 75 08             	pushl  0x8(%ebp)
c01068d7:	e8 22 fa ff ff       	call   c01062fe <get_physical_address>
c01068dc:	83 c4 04             	add    $0x4,%esp
c01068df:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01068e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01068e5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068eb:	85 c0                	test   %eax,%eax
c01068ed:	0f 48 c2             	cmovs  %edx,%eax
c01068f0:	c1 f8 0c             	sar    $0xc,%eax
c01068f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01068f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01068f9:	6a 00                	push   $0x0
c01068fb:	ff 75 f0             	pushl  -0x10(%ebp)
c01068fe:	50                   	push   %eax
c01068ff:	e8 41 f4 ff ff       	call   c0105d45 <set_bit_val>
c0106904:	83 c4 0c             	add    $0xc,%esp
c0106907:	ff 75 08             	pushl  0x8(%ebp)
c010690a:	e8 3e ff ff ff       	call   c010684d <remove_map_entry>
c010690f:	83 c4 04             	add    $0x4,%esp
c0106912:	90                   	nop
c0106913:	c9                   	leave  
c0106914:	c3                   	ret    

c0106915 <sys_free2>:
c0106915:	55                   	push   %ebp
c0106916:	89 e5                	mov    %esp,%ebp
c0106918:	83 ec 58             	sub    $0x58,%esp
c010691b:	e8 1c 9b ff ff       	call   c010043c <get_running_thread_pcb>
c0106920:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106923:	e8 90 06 00 00       	call   c0106fb8 <intr_disable>
c0106928:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010692b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010692e:	8b 50 08             	mov    0x8(%eax),%edx
c0106931:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106936:	39 c2                	cmp    %eax,%edx
c0106938:	75 10                	jne    c010694a <sys_free2+0x35>
c010693a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106941:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c0106948:	eb 10                	jmp    c010695a <sys_free2+0x45>
c010694a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106951:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106954:	83 c0 10             	add    $0x10,%eax
c0106957:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010695a:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0106961:	76 4d                	jbe    c01069b0 <sys_free2+0x9b>
c0106963:	8b 45 08             	mov    0x8(%ebp),%eax
c0106966:	83 e8 0c             	sub    $0xc,%eax
c0106969:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010696c:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0106970:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106973:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106978:	c1 e8 0c             	shr    $0xc,%eax
c010697b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010697e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106985:	eb 1c                	jmp    c01069a3 <sys_free2+0x8e>
c0106987:	83 ec 08             	sub    $0x8,%esp
c010698a:	ff 75 f4             	pushl  -0xc(%ebp)
c010698d:	ff 75 ec             	pushl  -0x14(%ebp)
c0106990:	e8 d9 fe ff ff       	call   c010686e <free_a_page>
c0106995:	83 c4 10             	add    $0x10,%esp
c0106998:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010699f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01069a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01069a6:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c01069a9:	77 dc                	ja     c0106987 <sys_free2+0x72>
c01069ab:	e9 dc 00 00 00       	jmp    c0106a8c <sys_free2+0x177>
c01069b0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01069b7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01069be:	eb 26                	jmp    c01069e6 <sys_free2+0xd1>
c01069c0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01069c3:	89 d0                	mov    %edx,%eax
c01069c5:	01 c0                	add    %eax,%eax
c01069c7:	01 d0                	add    %edx,%eax
c01069c9:	c1 e0 03             	shl    $0x3,%eax
c01069cc:	89 c2                	mov    %eax,%edx
c01069ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01069d1:	01 d0                	add    %edx,%eax
c01069d3:	8b 00                	mov    (%eax),%eax
c01069d5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01069d8:	77 08                	ja     c01069e2 <sys_free2+0xcd>
c01069da:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01069dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01069e0:	eb 0a                	jmp    c01069ec <sys_free2+0xd7>
c01069e2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01069e6:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c01069ea:	7e d4                	jle    c01069c0 <sys_free2+0xab>
c01069ec:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01069ef:	89 d0                	mov    %edx,%eax
c01069f1:	01 c0                	add    %eax,%eax
c01069f3:	01 d0                	add    %edx,%eax
c01069f5:	c1 e0 03             	shl    $0x3,%eax
c01069f8:	89 c2                	mov    %eax,%edx
c01069fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01069fd:	01 d0                	add    %edx,%eax
c01069ff:	8b 10                	mov    (%eax),%edx
c0106a01:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106a04:	8b 50 04             	mov    0x4(%eax),%edx
c0106a07:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0106a0a:	8b 50 08             	mov    0x8(%eax),%edx
c0106a0d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106a10:	8b 50 0c             	mov    0xc(%eax),%edx
c0106a13:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106a16:	8b 50 10             	mov    0x10(%eax),%edx
c0106a19:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0106a1c:	8b 40 14             	mov    0x14(%eax),%eax
c0106a1f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106a22:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a25:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106a28:	83 ec 0c             	sub    $0xc,%esp
c0106a2b:	ff 75 d0             	pushl  -0x30(%ebp)
c0106a2e:	e8 4e fb ff ff       	call   c0106581 <block2arena>
c0106a33:	83 c4 10             	add    $0x10,%esp
c0106a36:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106a39:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106a3c:	89 d0                	mov    %edx,%eax
c0106a3e:	01 c0                	add    %eax,%eax
c0106a40:	01 d0                	add    %edx,%eax
c0106a42:	c1 e0 03             	shl    $0x3,%eax
c0106a45:	89 c2                	mov    %eax,%edx
c0106a47:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106a4a:	01 d0                	add    %edx,%eax
c0106a4c:	83 c0 08             	add    $0x8,%eax
c0106a4f:	83 ec 08             	sub    $0x8,%esp
c0106a52:	ff 75 d0             	pushl  -0x30(%ebp)
c0106a55:	50                   	push   %eax
c0106a56:	e8 95 3a 00 00       	call   c010a4f0 <appendToDoubleLinkList>
c0106a5b:	83 c4 10             	add    $0x10,%esp
c0106a5e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106a61:	8b 40 04             	mov    0x4(%eax),%eax
c0106a64:	8d 50 01             	lea    0x1(%eax),%edx
c0106a67:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106a6a:	89 50 04             	mov    %edx,0x4(%eax)
c0106a6d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106a70:	8b 50 04             	mov    0x4(%eax),%edx
c0106a73:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106a76:	39 c2                	cmp    %eax,%edx
c0106a78:	75 12                	jne    c0106a8c <sys_free2+0x177>
c0106a7a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106a7d:	83 ec 08             	sub    $0x8,%esp
c0106a80:	ff 75 f4             	pushl  -0xc(%ebp)
c0106a83:	50                   	push   %eax
c0106a84:	e8 e5 fd ff ff       	call   c010686e <free_a_page>
c0106a89:	83 c4 10             	add    $0x10,%esp
c0106a8c:	83 ec 0c             	sub    $0xc,%esp
c0106a8f:	ff 75 d8             	pushl  -0x28(%ebp)
c0106a92:	e8 4a 05 00 00       	call   c0106fe1 <intr_set_status>
c0106a97:	83 c4 10             	add    $0x10,%esp
c0106a9a:	90                   	nop
c0106a9b:	c9                   	leave  
c0106a9c:	c3                   	ret    

c0106a9d <init_memory_block_desc>:
c0106a9d:	55                   	push   %ebp
c0106a9e:	89 e5                	mov    %esp,%ebp
c0106aa0:	83 ec 18             	sub    $0x18,%esp
c0106aa3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106aaa:	e9 b2 00 00 00       	jmp    c0106b61 <init_memory_block_desc+0xc4>
c0106aaf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106ab3:	75 1b                	jne    c0106ad0 <init_memory_block_desc+0x33>
c0106ab5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106ab8:	89 d0                	mov    %edx,%eax
c0106aba:	01 c0                	add    %eax,%eax
c0106abc:	01 d0                	add    %edx,%eax
c0106abe:	c1 e0 03             	shl    $0x3,%eax
c0106ac1:	89 c2                	mov    %eax,%edx
c0106ac3:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ac6:	01 d0                	add    %edx,%eax
c0106ac8:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0106ace:	eb 2e                	jmp    c0106afe <init_memory_block_desc+0x61>
c0106ad0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106ad3:	89 d0                	mov    %edx,%eax
c0106ad5:	01 c0                	add    %eax,%eax
c0106ad7:	01 d0                	add    %edx,%eax
c0106ad9:	c1 e0 03             	shl    $0x3,%eax
c0106adc:	8d 50 e8             	lea    -0x18(%eax),%edx
c0106adf:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ae2:	01 d0                	add    %edx,%eax
c0106ae4:	8b 08                	mov    (%eax),%ecx
c0106ae6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106ae9:	89 d0                	mov    %edx,%eax
c0106aeb:	01 c0                	add    %eax,%eax
c0106aed:	01 d0                	add    %edx,%eax
c0106aef:	c1 e0 03             	shl    $0x3,%eax
c0106af2:	89 c2                	mov    %eax,%edx
c0106af4:	8b 45 08             	mov    0x8(%ebp),%eax
c0106af7:	01 d0                	add    %edx,%eax
c0106af9:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0106afc:	89 10                	mov    %edx,(%eax)
c0106afe:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b01:	89 d0                	mov    %edx,%eax
c0106b03:	01 c0                	add    %eax,%eax
c0106b05:	01 d0                	add    %edx,%eax
c0106b07:	c1 e0 03             	shl    $0x3,%eax
c0106b0a:	89 c2                	mov    %eax,%edx
c0106b0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b0f:	01 d0                	add    %edx,%eax
c0106b11:	8b 00                	mov    (%eax),%eax
c0106b13:	89 c1                	mov    %eax,%ecx
c0106b15:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0106b1a:	ba 00 00 00 00       	mov    $0x0,%edx
c0106b1f:	f7 f1                	div    %ecx
c0106b21:	89 c1                	mov    %eax,%ecx
c0106b23:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b26:	89 d0                	mov    %edx,%eax
c0106b28:	01 c0                	add    %eax,%eax
c0106b2a:	01 d0                	add    %edx,%eax
c0106b2c:	c1 e0 03             	shl    $0x3,%eax
c0106b2f:	89 c2                	mov    %eax,%edx
c0106b31:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b34:	01 d0                	add    %edx,%eax
c0106b36:	89 ca                	mov    %ecx,%edx
c0106b38:	89 50 04             	mov    %edx,0x4(%eax)
c0106b3b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b3e:	89 d0                	mov    %edx,%eax
c0106b40:	01 c0                	add    %eax,%eax
c0106b42:	01 d0                	add    %edx,%eax
c0106b44:	c1 e0 03             	shl    $0x3,%eax
c0106b47:	89 c2                	mov    %eax,%edx
c0106b49:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b4c:	01 d0                	add    %edx,%eax
c0106b4e:	83 c0 08             	add    $0x8,%eax
c0106b51:	83 ec 0c             	sub    $0xc,%esp
c0106b54:	50                   	push   %eax
c0106b55:	e8 6b 38 00 00       	call   c010a3c5 <initDoubleLinkList>
c0106b5a:	83 c4 10             	add    $0x10,%esp
c0106b5d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0106b61:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0106b65:	0f 8e 44 ff ff ff    	jle    c0106aaf <init_memory_block_desc+0x12>
c0106b6b:	90                   	nop
c0106b6c:	c9                   	leave  
c0106b6d:	c3                   	ret    

c0106b6e <init_memory2>:
c0106b6e:	55                   	push   %ebp
c0106b6f:	89 e5                	mov    %esp,%ebp
c0106b71:	83 ec 38             	sub    $0x38,%esp
c0106b74:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0106b7b:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106b82:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106b85:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106b8a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b8d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106b92:	29 c2                	sub    %eax,%edx
c0106b94:	89 d0                	mov    %edx,%eax
c0106b96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b9c:	89 c2                	mov    %eax,%edx
c0106b9e:	c1 ea 1f             	shr    $0x1f,%edx
c0106ba1:	01 d0                	add    %edx,%eax
c0106ba3:	d1 f8                	sar    %eax
c0106ba5:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106baa:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106baf:	83 ec 0c             	sub    $0xc,%esp
c0106bb2:	50                   	push   %eax
c0106bb3:	e8 52 08 00 00       	call   c010740a <disp_int>
c0106bb8:	83 c4 10             	add    $0x10,%esp
c0106bbb:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106bc0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106bc3:	29 c2                	sub    %eax,%edx
c0106bc5:	89 d0                	mov    %edx,%eax
c0106bc7:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c0106bcc:	83 ec 0c             	sub    $0xc,%esp
c0106bcf:	68 71 b6 10 c0       	push   $0xc010b671
c0106bd4:	e8 00 95 ff ff       	call   c01000d9 <disp_str>
c0106bd9:	83 c4 10             	add    $0x10,%esp
c0106bdc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106be1:	83 ec 0c             	sub    $0xc,%esp
c0106be4:	50                   	push   %eax
c0106be5:	e8 20 08 00 00       	call   c010740a <disp_int>
c0106bea:	83 c4 10             	add    $0x10,%esp
c0106bed:	83 ec 0c             	sub    $0xc,%esp
c0106bf0:	68 71 b6 10 c0       	push   $0xc010b671
c0106bf5:	e8 df 94 ff ff       	call   c01000d9 <disp_str>
c0106bfa:	83 c4 10             	add    $0x10,%esp
c0106bfd:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106c02:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106c07:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106c0d:	85 c0                	test   %eax,%eax
c0106c0f:	0f 48 c2             	cmovs  %edx,%eax
c0106c12:	c1 f8 0c             	sar    $0xc,%eax
c0106c15:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106c18:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106c1b:	83 c0 07             	add    $0x7,%eax
c0106c1e:	8d 50 07             	lea    0x7(%eax),%edx
c0106c21:	85 c0                	test   %eax,%eax
c0106c23:	0f 48 c2             	cmovs  %edx,%eax
c0106c26:	c1 f8 03             	sar    $0x3,%eax
c0106c29:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106c2e:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106c33:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106c38:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106c3d:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106c43:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106c48:	83 ec 04             	sub    $0x4,%esp
c0106c4b:	52                   	push   %edx
c0106c4c:	6a 00                	push   $0x0
c0106c4e:	50                   	push   %eax
c0106c4f:	e8 fb 55 00 00       	call   c010c24f <Memset>
c0106c54:	83 c4 10             	add    $0x10,%esp
c0106c57:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0106c5c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106c61:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106c67:	85 c0                	test   %eax,%eax
c0106c69:	0f 48 c2             	cmovs  %edx,%eax
c0106c6c:	c1 f8 0c             	sar    $0xc,%eax
c0106c6f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106c72:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106c75:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106c78:	ff 75 e8             	pushl  -0x18(%ebp)
c0106c7b:	6a 01                	push   $0x1
c0106c7d:	6a 00                	push   $0x0
c0106c7f:	68 ac 06 11 c0       	push   $0xc01106ac
c0106c84:	e8 37 f1 ff ff       	call   c0105dc0 <set_bits>
c0106c89:	83 c4 10             	add    $0x10,%esp
c0106c8c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106c91:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106c96:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106c9c:	85 c0                	test   %eax,%eax
c0106c9e:	0f 48 c2             	cmovs  %edx,%eax
c0106ca1:	c1 f8 0c             	sar    $0xc,%eax
c0106ca4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106ca7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106caa:	83 c0 07             	add    $0x7,%eax
c0106cad:	8d 50 07             	lea    0x7(%eax),%edx
c0106cb0:	85 c0                	test   %eax,%eax
c0106cb2:	0f 48 c2             	cmovs  %edx,%eax
c0106cb5:	c1 f8 03             	sar    $0x3,%eax
c0106cb8:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106cbd:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106cc2:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106cc8:	01 d0                	add    %edx,%eax
c0106cca:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106ccf:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106cd5:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106cda:	83 ec 04             	sub    $0x4,%esp
c0106cdd:	52                   	push   %edx
c0106cde:	6a 00                	push   $0x0
c0106ce0:	50                   	push   %eax
c0106ce1:	e8 69 55 00 00       	call   c010c24f <Memset>
c0106ce6:	83 c4 10             	add    $0x10,%esp
c0106ce9:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106cee:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106cf3:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106cf9:	85 c0                	test   %eax,%eax
c0106cfb:	0f 48 c2             	cmovs  %edx,%eax
c0106cfe:	c1 f8 0c             	sar    $0xc,%eax
c0106d01:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106d04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106d07:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106d0a:	ff 75 e8             	pushl  -0x18(%ebp)
c0106d0d:	6a 01                	push   $0x1
c0106d0f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106d12:	68 ac 06 11 c0       	push   $0xc01106ac
c0106d17:	e8 a4 f0 ff ff       	call   c0105dc0 <set_bits>
c0106d1c:	83 c4 10             	add    $0x10,%esp
c0106d1f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106d26:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106d29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106d2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106d2f:	83 c0 07             	add    $0x7,%eax
c0106d32:	8d 50 07             	lea    0x7(%eax),%edx
c0106d35:	85 c0                	test   %eax,%eax
c0106d37:	0f 48 c2             	cmovs  %edx,%eax
c0106d3a:	c1 f8 03             	sar    $0x3,%eax
c0106d3d:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106d42:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106d47:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106d4d:	01 c2                	add    %eax,%edx
c0106d4f:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106d54:	01 d0                	add    %edx,%eax
c0106d56:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106d5b:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106d61:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106d66:	83 ec 04             	sub    $0x4,%esp
c0106d69:	52                   	push   %edx
c0106d6a:	6a 00                	push   $0x0
c0106d6c:	50                   	push   %eax
c0106d6d:	e8 dd 54 00 00       	call   c010c24f <Memset>
c0106d72:	83 c4 10             	add    $0x10,%esp
c0106d75:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106d78:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d7b:	01 d0                	add    %edx,%eax
c0106d7d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106d80:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106d85:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106d8a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106d90:	85 c0                	test   %eax,%eax
c0106d92:	0f 48 c2             	cmovs  %edx,%eax
c0106d95:	c1 f8 0c             	sar    $0xc,%eax
c0106d98:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106d9b:	ff 75 e8             	pushl  -0x18(%ebp)
c0106d9e:	6a 01                	push   $0x1
c0106da0:	ff 75 e0             	pushl  -0x20(%ebp)
c0106da3:	68 ac 06 11 c0       	push   $0xc01106ac
c0106da8:	e8 13 f0 ff ff       	call   c0105dc0 <set_bits>
c0106dad:	83 c4 10             	add    $0x10,%esp
c0106db0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106db3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106db6:	01 d0                	add    %edx,%eax
c0106db8:	c1 e0 0c             	shl    $0xc,%eax
c0106dbb:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106dc0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106dc3:	83 c0 02             	add    $0x2,%eax
c0106dc6:	c1 e0 0c             	shl    $0xc,%eax
c0106dc9:	89 c2                	mov    %eax,%edx
c0106dcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106dce:	01 d0                	add    %edx,%eax
c0106dd0:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106dd5:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106ddc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ddf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106de2:	90                   	nop
c0106de3:	c9                   	leave  
c0106de4:	c3                   	ret    

c0106de5 <init_memory>:
c0106de5:	55                   	push   %ebp
c0106de6:	89 e5                	mov    %esp,%ebp
c0106de8:	83 ec 38             	sub    $0x38,%esp
c0106deb:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106df2:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106df9:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106e00:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106e03:	05 00 00 40 00       	add    $0x400000,%eax
c0106e08:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106e0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e0e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106e11:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106e17:	85 c0                	test   %eax,%eax
c0106e19:	0f 48 c2             	cmovs  %edx,%eax
c0106e1c:	c1 f8 0c             	sar    $0xc,%eax
c0106e1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106e22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106e25:	89 c2                	mov    %eax,%edx
c0106e27:	c1 ea 1f             	shr    $0x1f,%edx
c0106e2a:	01 d0                	add    %edx,%eax
c0106e2c:	d1 f8                	sar    %eax
c0106e2e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106e31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106e34:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106e37:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106e3a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106e3d:	8d 50 07             	lea    0x7(%eax),%edx
c0106e40:	85 c0                	test   %eax,%eax
c0106e42:	0f 48 c2             	cmovs  %edx,%eax
c0106e45:	c1 f8 03             	sar    $0x3,%eax
c0106e48:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106e4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106e4e:	8d 50 07             	lea    0x7(%eax),%edx
c0106e51:	85 c0                	test   %eax,%eax
c0106e53:	0f 48 c2             	cmovs  %edx,%eax
c0106e56:	c1 f8 03             	sar    $0x3,%eax
c0106e59:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106e5c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106e5f:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106e64:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106e69:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106e6c:	c1 e2 0c             	shl    $0xc,%edx
c0106e6f:	01 d0                	add    %edx,%eax
c0106e71:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106e76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e79:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106e7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106e81:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106e86:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106e8b:	83 ec 04             	sub    $0x4,%esp
c0106e8e:	ff 75 d8             	pushl  -0x28(%ebp)
c0106e91:	6a 00                	push   $0x0
c0106e93:	50                   	push   %eax
c0106e94:	e8 b6 53 00 00       	call   c010c24f <Memset>
c0106e99:	83 c4 10             	add    $0x10,%esp
c0106e9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106e9f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ea2:	01 d0                	add    %edx,%eax
c0106ea4:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106ea9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106eac:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106eb1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106eb6:	83 ec 04             	sub    $0x4,%esp
c0106eb9:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106ebc:	6a 00                	push   $0x0
c0106ebe:	50                   	push   %eax
c0106ebf:	e8 8b 53 00 00       	call   c010c24f <Memset>
c0106ec4:	83 c4 10             	add    $0x10,%esp
c0106ec7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106eca:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106ecf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106ed2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ed5:	01 c2                	add    %eax,%edx
c0106ed7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106eda:	01 d0                	add    %edx,%eax
c0106edc:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106ee1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106ee4:	05 00 00 10 00       	add    $0x100000,%eax
c0106ee9:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106eee:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106ef3:	83 ec 04             	sub    $0x4,%esp
c0106ef6:	ff 75 d8             	pushl  -0x28(%ebp)
c0106ef9:	6a 00                	push   $0x0
c0106efb:	50                   	push   %eax
c0106efc:	e8 4e 53 00 00       	call   c010c24f <Memset>
c0106f01:	83 c4 10             	add    $0x10,%esp
c0106f04:	83 ec 04             	sub    $0x4,%esp
c0106f07:	68 f0 00 00 00       	push   $0xf0
c0106f0c:	6a 00                	push   $0x0
c0106f0e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106f13:	e8 37 53 00 00       	call   c010c24f <Memset>
c0106f18:	83 c4 10             	add    $0x10,%esp
c0106f1b:	83 ec 0c             	sub    $0xc,%esp
c0106f1e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106f23:	e8 75 fb ff ff       	call   c0106a9d <init_memory_block_desc>
c0106f28:	83 c4 10             	add    $0x10,%esp
c0106f2b:	90                   	nop
c0106f2c:	c9                   	leave  
c0106f2d:	c3                   	ret    

c0106f2e <stop_here>:
c0106f2e:	55                   	push   %ebp
c0106f2f:	89 e5                	mov    %esp,%ebp
c0106f31:	83 ec 08             	sub    $0x8,%esp
c0106f34:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106f3b:	00 00 00 
c0106f3e:	83 ec 0c             	sub    $0xc,%esp
c0106f41:	68 80 b6 10 c0       	push   $0xc010b680
c0106f46:	e8 8e 91 ff ff       	call   c01000d9 <disp_str>
c0106f4b:	83 c4 10             	add    $0x10,%esp
c0106f4e:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106f53:	83 ec 0c             	sub    $0xc,%esp
c0106f56:	50                   	push   %eax
c0106f57:	e8 ae 04 00 00       	call   c010740a <disp_int>
c0106f5c:	83 c4 10             	add    $0x10,%esp
c0106f5f:	83 ec 0c             	sub    $0xc,%esp
c0106f62:	68 82 b6 10 c0       	push   $0xc010b682
c0106f67:	e8 6d 91 ff ff       	call   c01000d9 <disp_str>
c0106f6c:	83 c4 10             	add    $0x10,%esp
c0106f6f:	90                   	nop
c0106f70:	c9                   	leave  
c0106f71:	c3                   	ret    

c0106f72 <catch_error>:
c0106f72:	55                   	push   %ebp
c0106f73:	89 e5                	mov    %esp,%ebp
c0106f75:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106f7a:	83 c0 01             	add    $0x1,%eax
c0106f7d:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106f82:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106f87:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106f8c:	90                   	nop
c0106f8d:	5d                   	pop    %ebp
c0106f8e:	c3                   	ret    

c0106f8f <intr_enable>:
c0106f8f:	55                   	push   %ebp
c0106f90:	89 e5                	mov    %esp,%ebp
c0106f92:	83 ec 18             	sub    $0x18,%esp
c0106f95:	e8 65 00 00 00       	call   c0106fff <intr_get_status>
c0106f9a:	83 f8 01             	cmp    $0x1,%eax
c0106f9d:	75 0c                	jne    c0106fab <intr_enable+0x1c>
c0106f9f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106fa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fa9:	eb 0b                	jmp    c0106fb6 <intr_enable+0x27>
c0106fab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106fb2:	fb                   	sti    
c0106fb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fb6:	c9                   	leave  
c0106fb7:	c3                   	ret    

c0106fb8 <intr_disable>:
c0106fb8:	55                   	push   %ebp
c0106fb9:	89 e5                	mov    %esp,%ebp
c0106fbb:	83 ec 18             	sub    $0x18,%esp
c0106fbe:	e8 3c 00 00 00       	call   c0106fff <intr_get_status>
c0106fc3:	83 f8 01             	cmp    $0x1,%eax
c0106fc6:	75 0d                	jne    c0106fd5 <intr_disable+0x1d>
c0106fc8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106fcf:	fa                   	cli    
c0106fd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fd3:	eb 0a                	jmp    c0106fdf <intr_disable+0x27>
c0106fd5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106fdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fdf:	c9                   	leave  
c0106fe0:	c3                   	ret    

c0106fe1 <intr_set_status>:
c0106fe1:	55                   	push   %ebp
c0106fe2:	89 e5                	mov    %esp,%ebp
c0106fe4:	83 ec 08             	sub    $0x8,%esp
c0106fe7:	8b 45 08             	mov    0x8(%ebp),%eax
c0106fea:	83 e0 01             	and    $0x1,%eax
c0106fed:	85 c0                	test   %eax,%eax
c0106fef:	74 07                	je     c0106ff8 <intr_set_status+0x17>
c0106ff1:	e8 99 ff ff ff       	call   c0106f8f <intr_enable>
c0106ff6:	eb 05                	jmp    c0106ffd <intr_set_status+0x1c>
c0106ff8:	e8 bb ff ff ff       	call   c0106fb8 <intr_disable>
c0106ffd:	c9                   	leave  
c0106ffe:	c3                   	ret    

c0106fff <intr_get_status>:
c0106fff:	55                   	push   %ebp
c0107000:	89 e5                	mov    %esp,%ebp
c0107002:	83 ec 10             	sub    $0x10,%esp
c0107005:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010700c:	9c                   	pushf  
c010700d:	58                   	pop    %eax
c010700e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107011:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107014:	c1 e8 09             	shr    $0x9,%eax
c0107017:	83 e0 01             	and    $0x1,%eax
c010701a:	c9                   	leave  
c010701b:	c3                   	ret    

c010701c <Memcpy>:
c010701c:	55                   	push   %ebp
c010701d:	89 e5                	mov    %esp,%ebp
c010701f:	83 ec 18             	sub    $0x18,%esp
c0107022:	e8 91 ff ff ff       	call   c0106fb8 <intr_disable>
c0107027:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010702a:	83 ec 04             	sub    $0x4,%esp
c010702d:	ff 75 10             	pushl  0x10(%ebp)
c0107030:	ff 75 0c             	pushl  0xc(%ebp)
c0107033:	ff 75 08             	pushl  0x8(%ebp)
c0107036:	e8 e6 51 00 00       	call   c010c221 <Memcpy2>
c010703b:	83 c4 10             	add    $0x10,%esp
c010703e:	83 ec 0c             	sub    $0xc,%esp
c0107041:	ff 75 f4             	pushl  -0xc(%ebp)
c0107044:	e8 98 ff ff ff       	call   c0106fe1 <intr_set_status>
c0107049:	83 c4 10             	add    $0x10,%esp
c010704c:	90                   	nop
c010704d:	c9                   	leave  
c010704e:	c3                   	ret    

c010704f <untar>:
c010704f:	55                   	push   %ebp
c0107050:	89 e5                	mov    %esp,%ebp
c0107052:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0107058:	83 ec 08             	sub    $0x8,%esp
c010705b:	6a 00                	push   $0x0
c010705d:	ff 75 08             	pushl  0x8(%ebp)
c0107060:	e8 2a de ff ff       	call   c0104e8f <open>
c0107065:	83 c4 10             	add    $0x10,%esp
c0107068:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010706b:	83 ec 0c             	sub    $0xc,%esp
c010706e:	68 84 b6 10 c0       	push   $0xc010b684
c0107073:	e8 60 18 00 00       	call   c01088d8 <Printf>
c0107078:	83 c4 10             	add    $0x10,%esp
c010707b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107082:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0107089:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107090:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0107097:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010709e:	e9 63 02 00 00       	jmp    c0107306 <untar+0x2b7>
c01070a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01070a7:	7e 58                	jle    c0107101 <untar+0xb2>
c01070a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01070ac:	05 ff 01 00 00       	add    $0x1ff,%eax
c01070b1:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01070b7:	85 c0                	test   %eax,%eax
c01070b9:	0f 48 c2             	cmovs  %edx,%eax
c01070bc:	c1 f8 09             	sar    $0x9,%eax
c01070bf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01070c2:	83 ec 04             	sub    $0x4,%esp
c01070c5:	68 00 02 00 00       	push   $0x200
c01070ca:	6a 00                	push   $0x0
c01070cc:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c01070d2:	50                   	push   %eax
c01070d3:	e8 77 51 00 00       	call   c010c24f <Memset>
c01070d8:	83 c4 10             	add    $0x10,%esp
c01070db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01070de:	c1 e0 09             	shl    $0x9,%eax
c01070e1:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01070e4:	83 ec 04             	sub    $0x4,%esp
c01070e7:	50                   	push   %eax
c01070e8:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c01070ee:	50                   	push   %eax
c01070ef:	ff 75 e4             	pushl  -0x1c(%ebp)
c01070f2:	e8 2d de ff ff       	call   c0104f24 <read>
c01070f7:	83 c4 10             	add    $0x10,%esp
c01070fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107101:	83 ec 04             	sub    $0x4,%esp
c0107104:	68 00 02 00 00       	push   $0x200
c0107109:	6a 00                	push   $0x0
c010710b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0107111:	50                   	push   %eax
c0107112:	e8 38 51 00 00       	call   c010c24f <Memset>
c0107117:	83 c4 10             	add    $0x10,%esp
c010711a:	83 ec 04             	sub    $0x4,%esp
c010711d:	68 00 02 00 00       	push   $0x200
c0107122:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0107128:	50                   	push   %eax
c0107129:	ff 75 e4             	pushl  -0x1c(%ebp)
c010712c:	e8 f3 dd ff ff       	call   c0104f24 <read>
c0107131:	83 c4 10             	add    $0x10,%esp
c0107134:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107137:	83 ec 0c             	sub    $0xc,%esp
c010713a:	68 96 b6 10 c0       	push   $0xc010b696
c010713f:	e8 94 17 00 00       	call   c01088d8 <Printf>
c0107144:	83 c4 10             	add    $0x10,%esp
c0107147:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c010714b:	0f 84 c1 01 00 00    	je     c0107312 <untar+0x2c3>
c0107151:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107154:	01 45 f4             	add    %eax,-0xc(%ebp)
c0107157:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010715e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0107164:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107167:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010716a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010716d:	83 ec 08             	sub    $0x8,%esp
c0107170:	6a 07                	push   $0x7
c0107172:	ff 75 cc             	pushl  -0x34(%ebp)
c0107175:	e8 15 dd ff ff       	call   c0104e8f <open>
c010717a:	83 c4 10             	add    $0x10,%esp
c010717d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107180:	83 ec 0c             	sub    $0xc,%esp
c0107183:	68 a8 b6 10 c0       	push   $0xc010b6a8
c0107188:	e8 4b 17 00 00       	call   c01088d8 <Printf>
c010718d:	83 c4 10             	add    $0x10,%esp
c0107190:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107197:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010719a:	83 c0 7c             	add    $0x7c,%eax
c010719d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01071a0:	83 ec 0c             	sub    $0xc,%esp
c01071a3:	ff 75 cc             	pushl  -0x34(%ebp)
c01071a6:	e8 dd 50 00 00       	call   c010c288 <Strlen>
c01071ab:	83 c4 10             	add    $0x10,%esp
c01071ae:	85 c0                	test   %eax,%eax
c01071b0:	75 28                	jne    c01071da <untar+0x18b>
c01071b2:	83 ec 0c             	sub    $0xc,%esp
c01071b5:	ff 75 c4             	pushl  -0x3c(%ebp)
c01071b8:	e8 cb 50 00 00       	call   c010c288 <Strlen>
c01071bd:	83 c4 10             	add    $0x10,%esp
c01071c0:	85 c0                	test   %eax,%eax
c01071c2:	75 16                	jne    c01071da <untar+0x18b>
c01071c4:	83 ec 0c             	sub    $0xc,%esp
c01071c7:	68 ba b6 10 c0       	push   $0xc010b6ba
c01071cc:	e8 07 17 00 00       	call   c01088d8 <Printf>
c01071d1:	83 c4 10             	add    $0x10,%esp
c01071d4:	90                   	nop
c01071d5:	e9 39 01 00 00       	jmp    c0107313 <untar+0x2c4>
c01071da:	83 ec 0c             	sub    $0xc,%esp
c01071dd:	68 c1 b6 10 c0       	push   $0xc010b6c1
c01071e2:	e8 f1 16 00 00       	call   c01088d8 <Printf>
c01071e7:	83 c4 10             	add    $0x10,%esp
c01071ea:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01071ed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01071f0:	eb 1f                	jmp    c0107211 <untar+0x1c2>
c01071f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01071f5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01071fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01071ff:	0f b6 00             	movzbl (%eax),%eax
c0107202:	0f be c0             	movsbl %al,%eax
c0107205:	83 e8 30             	sub    $0x30,%eax
c0107208:	01 d0                	add    %edx,%eax
c010720a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010720d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0107211:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107214:	0f b6 00             	movzbl (%eax),%eax
c0107217:	84 c0                	test   %al,%al
c0107219:	75 d7                	jne    c01071f2 <untar+0x1a3>
c010721b:	83 ec 0c             	sub    $0xc,%esp
c010721e:	68 cf b6 10 c0       	push   $0xc010b6cf
c0107223:	e8 b0 16 00 00       	call   c01088d8 <Printf>
c0107228:	83 c4 10             	add    $0x10,%esp
c010722b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010722e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107231:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0107238:	83 ec 08             	sub    $0x8,%esp
c010723b:	ff 75 c0             	pushl  -0x40(%ebp)
c010723e:	68 dd b6 10 c0       	push   $0xc010b6dd
c0107243:	e8 90 16 00 00       	call   c01088d8 <Printf>
c0107248:	83 c4 10             	add    $0x10,%esp
c010724b:	83 ec 08             	sub    $0x8,%esp
c010724e:	ff 75 c0             	pushl  -0x40(%ebp)
c0107251:	68 ef b6 10 c0       	push   $0xc010b6ef
c0107256:	e8 7d 16 00 00       	call   c01088d8 <Printf>
c010725b:	83 c4 10             	add    $0x10,%esp
c010725e:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0107261:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0107264:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0107268:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010726b:	e8 02 fd ff ff       	call   c0106f72 <catch_error>
c0107270:	83 ec 04             	sub    $0x4,%esp
c0107273:	ff 75 b8             	pushl  -0x48(%ebp)
c0107276:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c010727c:	50                   	push   %eax
c010727d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107280:	e8 9f dc ff ff       	call   c0104f24 <read>
c0107285:	83 c4 10             	add    $0x10,%esp
c0107288:	01 45 f4             	add    %eax,-0xc(%ebp)
c010728b:	83 ec 04             	sub    $0x4,%esp
c010728e:	ff 75 b8             	pushl  -0x48(%ebp)
c0107291:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0107297:	50                   	push   %eax
c0107298:	ff 75 c8             	pushl  -0x38(%ebp)
c010729b:	e8 05 de ff ff       	call   c01050a5 <write>
c01072a0:	83 c4 10             	add    $0x10,%esp
c01072a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01072a6:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c01072a9:	7d 02                	jge    c01072ad <untar+0x25e>
c01072ab:	eb be                	jmp    c010726b <untar+0x21c>
c01072ad:	90                   	nop
c01072ae:	83 ec 08             	sub    $0x8,%esp
c01072b1:	ff 75 f4             	pushl  -0xc(%ebp)
c01072b4:	68 01 b7 10 c0       	push   $0xc010b701
c01072b9:	e8 1a 16 00 00       	call   c01088d8 <Printf>
c01072be:	83 c4 10             	add    $0x10,%esp
c01072c1:	83 ec 08             	sub    $0x8,%esp
c01072c4:	ff 75 c0             	pushl  -0x40(%ebp)
c01072c7:	68 13 b7 10 c0       	push   $0xc010b713
c01072cc:	e8 07 16 00 00       	call   c01088d8 <Printf>
c01072d1:	83 c4 10             	add    $0x10,%esp
c01072d4:	83 ec 0c             	sub    $0xc,%esp
c01072d7:	68 24 b7 10 c0       	push   $0xc010b724
c01072dc:	e8 f7 15 00 00       	call   c01088d8 <Printf>
c01072e1:	83 c4 10             	add    $0x10,%esp
c01072e4:	83 ec 0c             	sub    $0xc,%esp
c01072e7:	ff 75 c8             	pushl  -0x38(%ebp)
c01072ea:	e8 3b de ff ff       	call   c010512a <close>
c01072ef:	83 c4 10             	add    $0x10,%esp
c01072f2:	83 ec 0c             	sub    $0xc,%esp
c01072f5:	68 32 b7 10 c0       	push   $0xc010b732
c01072fa:	e8 d9 15 00 00       	call   c01088d8 <Printf>
c01072ff:	83 c4 10             	add    $0x10,%esp
c0107302:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0107306:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010730a:	0f 8f 93 fd ff ff    	jg     c01070a3 <untar+0x54>
c0107310:	eb 01                	jmp    c0107313 <untar+0x2c4>
c0107312:	90                   	nop
c0107313:	83 ec 0c             	sub    $0xc,%esp
c0107316:	68 3f b7 10 c0       	push   $0xc010b73f
c010731b:	e8 b8 15 00 00       	call   c01088d8 <Printf>
c0107320:	83 c4 10             	add    $0x10,%esp
c0107323:	83 ec 0c             	sub    $0xc,%esp
c0107326:	68 51 b7 10 c0       	push   $0xc010b751
c010732b:	e8 a8 15 00 00       	call   c01088d8 <Printf>
c0107330:	83 c4 10             	add    $0x10,%esp
c0107333:	83 ec 0c             	sub    $0xc,%esp
c0107336:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107339:	e8 ec dd ff ff       	call   c010512a <close>
c010733e:	83 c4 10             	add    $0x10,%esp
c0107341:	83 ec 0c             	sub    $0xc,%esp
c0107344:	68 61 b7 10 c0       	push   $0xc010b761
c0107349:	e8 8a 15 00 00       	call   c01088d8 <Printf>
c010734e:	83 c4 10             	add    $0x10,%esp
c0107351:	83 ec 0c             	sub    $0xc,%esp
c0107354:	68 74 b7 10 c0       	push   $0xc010b774
c0107359:	e8 7a 15 00 00       	call   c01088d8 <Printf>
c010735e:	83 c4 10             	add    $0x10,%esp
c0107361:	90                   	nop
c0107362:	c9                   	leave  
c0107363:	c3                   	ret    

c0107364 <atoi>:
c0107364:	55                   	push   %ebp
c0107365:	89 e5                	mov    %esp,%ebp
c0107367:	83 ec 10             	sub    $0x10,%esp
c010736a:	8b 45 08             	mov    0x8(%ebp),%eax
c010736d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107370:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107373:	8d 50 01             	lea    0x1(%eax),%edx
c0107376:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107379:	c6 00 30             	movb   $0x30,(%eax)
c010737c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010737f:	8d 50 01             	lea    0x1(%eax),%edx
c0107382:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107385:	c6 00 78             	movb   $0x78,(%eax)
c0107388:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c010738c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0107390:	75 0e                	jne    c01073a0 <atoi+0x3c>
c0107392:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107395:	8d 50 01             	lea    0x1(%eax),%edx
c0107398:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010739b:	c6 00 30             	movb   $0x30,(%eax)
c010739e:	eb 61                	jmp    c0107401 <atoi+0x9d>
c01073a0:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c01073a7:	eb 52                	jmp    c01073fb <atoi+0x97>
c01073a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01073ac:	8b 55 0c             	mov    0xc(%ebp),%edx
c01073af:	89 c1                	mov    %eax,%ecx
c01073b1:	d3 fa                	sar    %cl,%edx
c01073b3:	89 d0                	mov    %edx,%eax
c01073b5:	83 e0 0f             	and    $0xf,%eax
c01073b8:	88 45 fb             	mov    %al,-0x5(%ebp)
c01073bb:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c01073bf:	75 06                	jne    c01073c7 <atoi+0x63>
c01073c1:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c01073c5:	74 2f                	je     c01073f6 <atoi+0x92>
c01073c7:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c01073cb:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01073cf:	83 c0 30             	add    $0x30,%eax
c01073d2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01073d5:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c01073d9:	7e 0a                	jle    c01073e5 <atoi+0x81>
c01073db:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01073df:	83 c0 07             	add    $0x7,%eax
c01073e2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01073e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01073e8:	8d 50 01             	lea    0x1(%eax),%edx
c01073eb:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01073ee:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c01073f2:	88 10                	mov    %dl,(%eax)
c01073f4:	eb 01                	jmp    c01073f7 <atoi+0x93>
c01073f6:	90                   	nop
c01073f7:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c01073fb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01073ff:	79 a8                	jns    c01073a9 <atoi+0x45>
c0107401:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107404:	c6 00 00             	movb   $0x0,(%eax)
c0107407:	90                   	nop
c0107408:	c9                   	leave  
c0107409:	c3                   	ret    

c010740a <disp_int>:
c010740a:	55                   	push   %ebp
c010740b:	89 e5                	mov    %esp,%ebp
c010740d:	83 ec 18             	sub    $0x18,%esp
c0107410:	ff 75 08             	pushl  0x8(%ebp)
c0107413:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107416:	50                   	push   %eax
c0107417:	e8 48 ff ff ff       	call   c0107364 <atoi>
c010741c:	83 c4 08             	add    $0x8,%esp
c010741f:	83 ec 08             	sub    $0x8,%esp
c0107422:	6a 0b                	push   $0xb
c0107424:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107427:	50                   	push   %eax
c0107428:	e8 e7 8c ff ff       	call   c0100114 <disp_str_colour>
c010742d:	83 c4 10             	add    $0x10,%esp
c0107430:	90                   	nop
c0107431:	c9                   	leave  
c0107432:	c3                   	ret    

c0107433 <do_page_fault>:
c0107433:	55                   	push   %ebp
c0107434:	89 e5                	mov    %esp,%ebp
c0107436:	83 ec 28             	sub    $0x28,%esp
c0107439:	0f 20 d0             	mov    %cr2,%eax
c010743c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010743f:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107446:	00 00 00 
c0107449:	83 ec 0c             	sub    $0xc,%esp
c010744c:	68 7f b7 10 c0       	push   $0xc010b77f
c0107451:	e8 83 8c ff ff       	call   c01000d9 <disp_str>
c0107456:	83 c4 10             	add    $0x10,%esp
c0107459:	83 ec 0c             	sub    $0xc,%esp
c010745c:	68 8e b7 10 c0       	push   $0xc010b78e
c0107461:	e8 73 8c ff ff       	call   c01000d9 <disp_str>
c0107466:	83 c4 10             	add    $0x10,%esp
c0107469:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010746c:	83 ec 0c             	sub    $0xc,%esp
c010746f:	50                   	push   %eax
c0107470:	e8 95 ff ff ff       	call   c010740a <disp_int>
c0107475:	83 c4 10             	add    $0x10,%esp
c0107478:	83 ec 0c             	sub    $0xc,%esp
c010747b:	68 93 b7 10 c0       	push   $0xc010b793
c0107480:	e8 54 8c ff ff       	call   c01000d9 <disp_str>
c0107485:	83 c4 10             	add    $0x10,%esp
c0107488:	83 ec 0c             	sub    $0xc,%esp
c010748b:	ff 75 f4             	pushl  -0xc(%ebp)
c010748e:	e8 51 ec ff ff       	call   c01060e4 <ptr_pde>
c0107493:	83 c4 10             	add    $0x10,%esp
c0107496:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107499:	83 ec 0c             	sub    $0xc,%esp
c010749c:	ff 75 f4             	pushl  -0xc(%ebp)
c010749f:	e8 53 ec ff ff       	call   c01060f7 <ptr_pte>
c01074a4:	83 c4 10             	add    $0x10,%esp
c01074a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01074aa:	83 ec 0c             	sub    $0xc,%esp
c01074ad:	68 95 b7 10 c0       	push   $0xc010b795
c01074b2:	e8 22 8c ff ff       	call   c01000d9 <disp_str>
c01074b7:	83 c4 10             	add    $0x10,%esp
c01074ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01074bd:	83 ec 0c             	sub    $0xc,%esp
c01074c0:	50                   	push   %eax
c01074c1:	e8 44 ff ff ff       	call   c010740a <disp_int>
c01074c6:	83 c4 10             	add    $0x10,%esp
c01074c9:	83 ec 0c             	sub    $0xc,%esp
c01074cc:	68 9a b7 10 c0       	push   $0xc010b79a
c01074d1:	e8 03 8c ff ff       	call   c01000d9 <disp_str>
c01074d6:	83 c4 10             	add    $0x10,%esp
c01074d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01074dc:	8b 00                	mov    (%eax),%eax
c01074de:	83 ec 0c             	sub    $0xc,%esp
c01074e1:	50                   	push   %eax
c01074e2:	e8 23 ff ff ff       	call   c010740a <disp_int>
c01074e7:	83 c4 10             	add    $0x10,%esp
c01074ea:	83 ec 0c             	sub    $0xc,%esp
c01074ed:	68 93 b7 10 c0       	push   $0xc010b793
c01074f2:	e8 e2 8b ff ff       	call   c01000d9 <disp_str>
c01074f7:	83 c4 10             	add    $0x10,%esp
c01074fa:	83 ec 0c             	sub    $0xc,%esp
c01074fd:	68 a3 b7 10 c0       	push   $0xc010b7a3
c0107502:	e8 d2 8b ff ff       	call   c01000d9 <disp_str>
c0107507:	83 c4 10             	add    $0x10,%esp
c010750a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010750d:	83 ec 0c             	sub    $0xc,%esp
c0107510:	50                   	push   %eax
c0107511:	e8 f4 fe ff ff       	call   c010740a <disp_int>
c0107516:	83 c4 10             	add    $0x10,%esp
c0107519:	83 ec 0c             	sub    $0xc,%esp
c010751c:	68 a8 b7 10 c0       	push   $0xc010b7a8
c0107521:	e8 b3 8b ff ff       	call   c01000d9 <disp_str>
c0107526:	83 c4 10             	add    $0x10,%esp
c0107529:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010752c:	8b 00                	mov    (%eax),%eax
c010752e:	83 ec 0c             	sub    $0xc,%esp
c0107531:	50                   	push   %eax
c0107532:	e8 d3 fe ff ff       	call   c010740a <disp_int>
c0107537:	83 c4 10             	add    $0x10,%esp
c010753a:	83 ec 0c             	sub    $0xc,%esp
c010753d:	68 93 b7 10 c0       	push   $0xc010b793
c0107542:	e8 92 8b ff ff       	call   c01000d9 <disp_str>
c0107547:	83 c4 10             	add    $0x10,%esp
c010754a:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0107551:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107554:	8b 00                	mov    (%eax),%eax
c0107556:	83 e0 01             	and    $0x1,%eax
c0107559:	85 c0                	test   %eax,%eax
c010755b:	74 09                	je     c0107566 <do_page_fault+0x133>
c010755d:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0107564:	eb 07                	jmp    c010756d <do_page_fault+0x13a>
c0107566:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010756d:	90                   	nop
c010756e:	c9                   	leave  
c010756f:	c3                   	ret    

c0107570 <exception_handler>:
c0107570:	55                   	push   %ebp
c0107571:	89 e5                	mov    %esp,%ebp
c0107573:	57                   	push   %edi
c0107574:	56                   	push   %esi
c0107575:	53                   	push   %ebx
c0107576:	83 ec 6c             	sub    $0x6c,%esp
c0107579:	8d 45 8c             	lea    -0x74(%ebp),%eax
c010757c:	bb 20 ba 10 c0       	mov    $0xc010ba20,%ebx
c0107581:	ba 13 00 00 00       	mov    $0x13,%edx
c0107586:	89 c7                	mov    %eax,%edi
c0107588:	89 de                	mov    %ebx,%esi
c010758a:	89 d1                	mov    %edx,%ecx
c010758c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010758e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107595:	eb 04                	jmp    c010759b <exception_handler+0x2b>
c0107597:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010759b:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c01075a2:	7e f3                	jle    c0107597 <exception_handler+0x27>
c01075a4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01075ab:	00 00 00 
c01075ae:	83 ec 0c             	sub    $0xc,%esp
c01075b1:	68 b1 b7 10 c0       	push   $0xc010b7b1
c01075b6:	e8 1e 8b ff ff       	call   c01000d9 <disp_str>
c01075bb:	83 c4 10             	add    $0x10,%esp
c01075be:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c01075c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01075c8:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c01075cc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01075cf:	83 ec 0c             	sub    $0xc,%esp
c01075d2:	ff 75 dc             	pushl  -0x24(%ebp)
c01075d5:	e8 ff 8a ff ff       	call   c01000d9 <disp_str>
c01075da:	83 c4 10             	add    $0x10,%esp
c01075dd:	83 ec 0c             	sub    $0xc,%esp
c01075e0:	68 bf b7 10 c0       	push   $0xc010b7bf
c01075e5:	e8 ef 8a ff ff       	call   c01000d9 <disp_str>
c01075ea:	83 c4 10             	add    $0x10,%esp
c01075ed:	83 ec 0c             	sub    $0xc,%esp
c01075f0:	68 c2 b7 10 c0       	push   $0xc010b7c2
c01075f5:	e8 df 8a ff ff       	call   c01000d9 <disp_str>
c01075fa:	83 c4 10             	add    $0x10,%esp
c01075fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0107600:	83 ec 0c             	sub    $0xc,%esp
c0107603:	50                   	push   %eax
c0107604:	e8 01 fe ff ff       	call   c010740a <disp_int>
c0107609:	83 c4 10             	add    $0x10,%esp
c010760c:	83 ec 0c             	sub    $0xc,%esp
c010760f:	68 bf b7 10 c0       	push   $0xc010b7bf
c0107614:	e8 c0 8a ff ff       	call   c01000d9 <disp_str>
c0107619:	83 c4 10             	add    $0x10,%esp
c010761c:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107620:	74 2f                	je     c0107651 <exception_handler+0xe1>
c0107622:	83 ec 0c             	sub    $0xc,%esp
c0107625:	68 ca b7 10 c0       	push   $0xc010b7ca
c010762a:	e8 aa 8a ff ff       	call   c01000d9 <disp_str>
c010762f:	83 c4 10             	add    $0x10,%esp
c0107632:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107635:	83 ec 0c             	sub    $0xc,%esp
c0107638:	50                   	push   %eax
c0107639:	e8 cc fd ff ff       	call   c010740a <disp_int>
c010763e:	83 c4 10             	add    $0x10,%esp
c0107641:	83 ec 0c             	sub    $0xc,%esp
c0107644:	68 bf b7 10 c0       	push   $0xc010b7bf
c0107649:	e8 8b 8a ff ff       	call   c01000d9 <disp_str>
c010764e:	83 c4 10             	add    $0x10,%esp
c0107651:	83 ec 0c             	sub    $0xc,%esp
c0107654:	68 d4 b7 10 c0       	push   $0xc010b7d4
c0107659:	e8 7b 8a ff ff       	call   c01000d9 <disp_str>
c010765e:	83 c4 10             	add    $0x10,%esp
c0107661:	83 ec 0c             	sub    $0xc,%esp
c0107664:	ff 75 14             	pushl  0x14(%ebp)
c0107667:	e8 9e fd ff ff       	call   c010740a <disp_int>
c010766c:	83 c4 10             	add    $0x10,%esp
c010766f:	83 ec 0c             	sub    $0xc,%esp
c0107672:	68 bf b7 10 c0       	push   $0xc010b7bf
c0107677:	e8 5d 8a ff ff       	call   c01000d9 <disp_str>
c010767c:	83 c4 10             	add    $0x10,%esp
c010767f:	83 ec 0c             	sub    $0xc,%esp
c0107682:	68 d8 b7 10 c0       	push   $0xc010b7d8
c0107687:	e8 4d 8a ff ff       	call   c01000d9 <disp_str>
c010768c:	83 c4 10             	add    $0x10,%esp
c010768f:	8b 45 10             	mov    0x10(%ebp),%eax
c0107692:	83 ec 0c             	sub    $0xc,%esp
c0107695:	50                   	push   %eax
c0107696:	e8 6f fd ff ff       	call   c010740a <disp_int>
c010769b:	83 c4 10             	add    $0x10,%esp
c010769e:	83 ec 0c             	sub    $0xc,%esp
c01076a1:	68 bf b7 10 c0       	push   $0xc010b7bf
c01076a6:	e8 2e 8a ff ff       	call   c01000d9 <disp_str>
c01076ab:	83 c4 10             	add    $0x10,%esp
c01076ae:	83 ec 0c             	sub    $0xc,%esp
c01076b1:	68 dd b7 10 c0       	push   $0xc010b7dd
c01076b6:	e8 1e 8a ff ff       	call   c01000d9 <disp_str>
c01076bb:	83 c4 10             	add    $0x10,%esp
c01076be:	83 ec 0c             	sub    $0xc,%esp
c01076c1:	ff 75 18             	pushl  0x18(%ebp)
c01076c4:	e8 41 fd ff ff       	call   c010740a <disp_int>
c01076c9:	83 c4 10             	add    $0x10,%esp
c01076cc:	83 ec 0c             	sub    $0xc,%esp
c01076cf:	68 bf b7 10 c0       	push   $0xc010b7bf
c01076d4:	e8 00 8a ff ff       	call   c01000d9 <disp_str>
c01076d9:	83 c4 10             	add    $0x10,%esp
c01076dc:	83 ec 0c             	sub    $0xc,%esp
c01076df:	68 e8 b7 10 c0       	push   $0xc010b7e8
c01076e4:	e8 f0 89 ff ff       	call   c01000d9 <disp_str>
c01076e9:	83 c4 10             	add    $0x10,%esp
c01076ec:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c01076f0:	75 45                	jne    c0107737 <exception_handler+0x1c7>
c01076f2:	0f 20 d0             	mov    %cr2,%eax
c01076f5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01076f8:	83 ec 0c             	sub    $0xc,%esp
c01076fb:	68 07 b8 10 c0       	push   $0xc010b807
c0107700:	e8 d4 89 ff ff       	call   c01000d9 <disp_str>
c0107705:	83 c4 10             	add    $0x10,%esp
c0107708:	83 ec 0c             	sub    $0xc,%esp
c010770b:	68 8e b7 10 c0       	push   $0xc010b78e
c0107710:	e8 c4 89 ff ff       	call   c01000d9 <disp_str>
c0107715:	83 c4 10             	add    $0x10,%esp
c0107718:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010771b:	83 ec 0c             	sub    $0xc,%esp
c010771e:	50                   	push   %eax
c010771f:	e8 e6 fc ff ff       	call   c010740a <disp_int>
c0107724:	83 c4 10             	add    $0x10,%esp
c0107727:	83 ec 0c             	sub    $0xc,%esp
c010772a:	68 93 b7 10 c0       	push   $0xc010b793
c010772f:	e8 a5 89 ff ff       	call   c01000d9 <disp_str>
c0107734:	83 c4 10             	add    $0x10,%esp
c0107737:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c010773b:	75 11                	jne    c010774e <exception_handler+0x1de>
c010773d:	83 ec 0c             	sub    $0xc,%esp
c0107740:	68 13 b8 10 c0       	push   $0xc010b813
c0107745:	e8 8f 89 ff ff       	call   c01000d9 <disp_str>
c010774a:	83 c4 10             	add    $0x10,%esp
c010774d:	90                   	nop
c010774e:	90                   	nop
c010774f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107752:	5b                   	pop    %ebx
c0107753:	5e                   	pop    %esi
c0107754:	5f                   	pop    %edi
c0107755:	5d                   	pop    %ebp
c0107756:	c3                   	ret    

c0107757 <init_internal_interrupt>:
c0107757:	55                   	push   %ebp
c0107758:	89 e5                	mov    %esp,%ebp
c010775a:	83 ec 08             	sub    $0x8,%esp
c010775d:	6a 0e                	push   $0xe
c010775f:	6a 08                	push   $0x8
c0107761:	68 50 01 10 c0       	push   $0xc0100150
c0107766:	6a 00                	push   $0x0
c0107768:	e8 62 c7 ff ff       	call   c0103ecf <InitInterruptDesc>
c010776d:	83 c4 10             	add    $0x10,%esp
c0107770:	6a 0e                	push   $0xe
c0107772:	6a 08                	push   $0x8
c0107774:	68 56 01 10 c0       	push   $0xc0100156
c0107779:	6a 01                	push   $0x1
c010777b:	e8 4f c7 ff ff       	call   c0103ecf <InitInterruptDesc>
c0107780:	83 c4 10             	add    $0x10,%esp
c0107783:	6a 0e                	push   $0xe
c0107785:	6a 08                	push   $0x8
c0107787:	68 5c 01 10 c0       	push   $0xc010015c
c010778c:	6a 02                	push   $0x2
c010778e:	e8 3c c7 ff ff       	call   c0103ecf <InitInterruptDesc>
c0107793:	83 c4 10             	add    $0x10,%esp
c0107796:	6a 0e                	push   $0xe
c0107798:	6a 08                	push   $0x8
c010779a:	68 62 01 10 c0       	push   $0xc0100162
c010779f:	6a 03                	push   $0x3
c01077a1:	e8 29 c7 ff ff       	call   c0103ecf <InitInterruptDesc>
c01077a6:	83 c4 10             	add    $0x10,%esp
c01077a9:	6a 0e                	push   $0xe
c01077ab:	6a 08                	push   $0x8
c01077ad:	68 68 01 10 c0       	push   $0xc0100168
c01077b2:	6a 04                	push   $0x4
c01077b4:	e8 16 c7 ff ff       	call   c0103ecf <InitInterruptDesc>
c01077b9:	83 c4 10             	add    $0x10,%esp
c01077bc:	6a 0e                	push   $0xe
c01077be:	6a 08                	push   $0x8
c01077c0:	68 6e 01 10 c0       	push   $0xc010016e
c01077c5:	6a 05                	push   $0x5
c01077c7:	e8 03 c7 ff ff       	call   c0103ecf <InitInterruptDesc>
c01077cc:	83 c4 10             	add    $0x10,%esp
c01077cf:	6a 0e                	push   $0xe
c01077d1:	6a 08                	push   $0x8
c01077d3:	68 74 01 10 c0       	push   $0xc0100174
c01077d8:	6a 06                	push   $0x6
c01077da:	e8 f0 c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c01077df:	83 c4 10             	add    $0x10,%esp
c01077e2:	6a 0e                	push   $0xe
c01077e4:	6a 08                	push   $0x8
c01077e6:	68 7a 01 10 c0       	push   $0xc010017a
c01077eb:	6a 07                	push   $0x7
c01077ed:	e8 dd c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c01077f2:	83 c4 10             	add    $0x10,%esp
c01077f5:	6a 0e                	push   $0xe
c01077f7:	6a 08                	push   $0x8
c01077f9:	68 80 01 10 c0       	push   $0xc0100180
c01077fe:	6a 08                	push   $0x8
c0107800:	e8 ca c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c0107805:	83 c4 10             	add    $0x10,%esp
c0107808:	6a 0e                	push   $0xe
c010780a:	6a 08                	push   $0x8
c010780c:	68 84 01 10 c0       	push   $0xc0100184
c0107811:	6a 09                	push   $0x9
c0107813:	e8 b7 c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c0107818:	83 c4 10             	add    $0x10,%esp
c010781b:	6a 0e                	push   $0xe
c010781d:	6a 08                	push   $0x8
c010781f:	68 8a 01 10 c0       	push   $0xc010018a
c0107824:	6a 0a                	push   $0xa
c0107826:	e8 a4 c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c010782b:	83 c4 10             	add    $0x10,%esp
c010782e:	6a 0e                	push   $0xe
c0107830:	6a 08                	push   $0x8
c0107832:	68 8e 01 10 c0       	push   $0xc010018e
c0107837:	6a 0b                	push   $0xb
c0107839:	e8 91 c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c010783e:	83 c4 10             	add    $0x10,%esp
c0107841:	6a 0e                	push   $0xe
c0107843:	6a 08                	push   $0x8
c0107845:	68 92 01 10 c0       	push   $0xc0100192
c010784a:	6a 0c                	push   $0xc
c010784c:	e8 7e c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c0107851:	83 c4 10             	add    $0x10,%esp
c0107854:	6a 0e                	push   $0xe
c0107856:	6a 08                	push   $0x8
c0107858:	68 96 01 10 c0       	push   $0xc0100196
c010785d:	6a 0d                	push   $0xd
c010785f:	e8 6b c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c0107864:	83 c4 10             	add    $0x10,%esp
c0107867:	6a 0e                	push   $0xe
c0107869:	6a 08                	push   $0x8
c010786b:	68 a1 01 10 c0       	push   $0xc01001a1
c0107870:	6a 0e                	push   $0xe
c0107872:	e8 58 c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c0107877:	83 c4 10             	add    $0x10,%esp
c010787a:	6a 0e                	push   $0xe
c010787c:	6a 08                	push   $0x8
c010787e:	68 a5 01 10 c0       	push   $0xc01001a5
c0107883:	6a 10                	push   $0x10
c0107885:	e8 45 c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c010788a:	83 c4 10             	add    $0x10,%esp
c010788d:	6a 0e                	push   $0xe
c010788f:	6a 08                	push   $0x8
c0107891:	68 ab 01 10 c0       	push   $0xc01001ab
c0107896:	6a 11                	push   $0x11
c0107898:	e8 32 c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c010789d:	83 c4 10             	add    $0x10,%esp
c01078a0:	6a 0e                	push   $0xe
c01078a2:	6a 08                	push   $0x8
c01078a4:	68 af 01 10 c0       	push   $0xc01001af
c01078a9:	6a 12                	push   $0x12
c01078ab:	e8 1f c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c01078b0:	83 c4 10             	add    $0x10,%esp
c01078b3:	6a 0e                	push   $0xe
c01078b5:	6a 0e                	push   $0xe
c01078b7:	68 ba 02 10 c0       	push   $0xc01002ba
c01078bc:	68 90 00 00 00       	push   $0x90
c01078c1:	e8 09 c6 ff ff       	call   c0103ecf <InitInterruptDesc>
c01078c6:	83 c4 10             	add    $0x10,%esp
c01078c9:	90                   	nop
c01078ca:	c9                   	leave  
c01078cb:	c3                   	ret    

c01078cc <spurious_irq>:
c01078cc:	55                   	push   %ebp
c01078cd:	89 e5                	mov    %esp,%ebp
c01078cf:	83 ec 08             	sub    $0x8,%esp
c01078d2:	83 ec 08             	sub    $0x8,%esp
c01078d5:	6a 0b                	push   $0xb
c01078d7:	68 6c ba 10 c0       	push   $0xc010ba6c
c01078dc:	e8 33 88 ff ff       	call   c0100114 <disp_str_colour>
c01078e1:	83 c4 10             	add    $0x10,%esp
c01078e4:	83 ec 0c             	sub    $0xc,%esp
c01078e7:	ff 75 08             	pushl  0x8(%ebp)
c01078ea:	e8 1b fb ff ff       	call   c010740a <disp_int>
c01078ef:	83 c4 10             	add    $0x10,%esp
c01078f2:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01078f7:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01078fd:	83 c0 01             	add    $0x1,%eax
c0107900:	83 d2 00             	adc    $0x0,%edx
c0107903:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107908:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010790e:	83 ec 0c             	sub    $0xc,%esp
c0107911:	68 80 b6 10 c0       	push   $0xc010b680
c0107916:	e8 be 87 ff ff       	call   c01000d9 <disp_str>
c010791b:	83 c4 10             	add    $0x10,%esp
c010791e:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107923:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107929:	83 ec 0c             	sub    $0xc,%esp
c010792c:	50                   	push   %eax
c010792d:	e8 d8 fa ff ff       	call   c010740a <disp_int>
c0107932:	83 c4 10             	add    $0x10,%esp
c0107935:	83 ec 0c             	sub    $0xc,%esp
c0107938:	68 82 b6 10 c0       	push   $0xc010b682
c010793d:	e8 97 87 ff ff       	call   c01000d9 <disp_str>
c0107942:	83 c4 10             	add    $0x10,%esp
c0107945:	83 ec 08             	sub    $0x8,%esp
c0107948:	6a 0c                	push   $0xc
c010794a:	68 94 ba 10 c0       	push   $0xc010ba94
c010794f:	e8 c0 87 ff ff       	call   c0100114 <disp_str_colour>
c0107954:	83 c4 10             	add    $0x10,%esp
c0107957:	90                   	nop
c0107958:	c9                   	leave  
c0107959:	c3                   	ret    

c010795a <init_keyboard>:
c010795a:	55                   	push   %ebp
c010795b:	89 e5                	mov    %esp,%ebp
c010795d:	83 ec 08             	sub    $0x8,%esp
c0107960:	83 ec 04             	sub    $0x4,%esp
c0107963:	68 00 02 00 00       	push   $0x200
c0107968:	6a 00                	push   $0x0
c010796a:	68 ec fb 10 c0       	push   $0xc010fbec
c010796f:	e8 db 48 00 00       	call   c010c24f <Memset>
c0107974:	83 c4 10             	add    $0x10,%esp
c0107977:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010797e:	fb 10 c0 
c0107981:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107986:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010798b:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c0107992:	00 00 00 
c0107995:	e8 4f d3 ff ff       	call   c0104ce9 <init_keyboard_handler>
c010799a:	90                   	nop
c010799b:	c9                   	leave  
c010799c:	c3                   	ret    

c010799d <TestTTY>:
c010799d:	55                   	push   %ebp
c010799e:	89 e5                	mov    %esp,%ebp
c01079a0:	83 ec 28             	sub    $0x28,%esp
c01079a3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01079aa:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01079b1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01079b7:	83 ec 08             	sub    $0x8,%esp
c01079ba:	6a 02                	push   $0x2
c01079bc:	8d 45 de             	lea    -0x22(%ebp),%eax
c01079bf:	50                   	push   %eax
c01079c0:	e8 ca d4 ff ff       	call   c0104e8f <open>
c01079c5:	83 c4 10             	add    $0x10,%esp
c01079c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01079cb:	83 ec 08             	sub    $0x8,%esp
c01079ce:	6a 02                	push   $0x2
c01079d0:	8d 45 de             	lea    -0x22(%ebp),%eax
c01079d3:	50                   	push   %eax
c01079d4:	e8 b6 d4 ff ff       	call   c0104e8f <open>
c01079d9:	83 c4 10             	add    $0x10,%esp
c01079dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01079df:	83 ec 0c             	sub    $0xc,%esp
c01079e2:	68 b9 ba 10 c0       	push   $0xc010bab9
c01079e7:	e8 ec 0e 00 00       	call   c01088d8 <Printf>
c01079ec:	83 c4 10             	add    $0x10,%esp
c01079ef:	83 ec 0c             	sub    $0xc,%esp
c01079f2:	6a 0a                	push   $0xa
c01079f4:	e8 73 9f ff ff       	call   c010196c <sys_malloc>
c01079f9:	83 c4 10             	add    $0x10,%esp
c01079fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01079ff:	83 ec 04             	sub    $0x4,%esp
c0107a02:	6a 0a                	push   $0xa
c0107a04:	6a 00                	push   $0x0
c0107a06:	ff 75 ec             	pushl  -0x14(%ebp)
c0107a09:	e8 41 48 00 00       	call   c010c24f <Memset>
c0107a0e:	83 c4 10             	add    $0x10,%esp
c0107a11:	83 ec 04             	sub    $0x4,%esp
c0107a14:	6a 0a                	push   $0xa
c0107a16:	ff 75 ec             	pushl  -0x14(%ebp)
c0107a19:	ff 75 f0             	pushl  -0x10(%ebp)
c0107a1c:	e8 03 d5 ff ff       	call   c0104f24 <read>
c0107a21:	83 c4 10             	add    $0x10,%esp
c0107a24:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107a27:	83 ec 08             	sub    $0x8,%esp
c0107a2a:	ff 75 ec             	pushl  -0x14(%ebp)
c0107a2d:	68 cb ba 10 c0       	push   $0xc010bacb
c0107a32:	e8 a1 0e 00 00       	call   c01088d8 <Printf>
c0107a37:	83 c4 10             	add    $0x10,%esp
c0107a3a:	eb c3                	jmp    c01079ff <TestTTY+0x62>

c0107a3c <TestReadReturnValue>:
c0107a3c:	55                   	push   %ebp
c0107a3d:	89 e5                	mov    %esp,%ebp
c0107a3f:	81 ec 18 02 00 00    	sub    $0x218,%esp
c0107a45:	c7 45 f4 d5 ba 10 c0 	movl   $0xc010bad5,-0xc(%ebp)
c0107a4c:	83 ec 08             	sub    $0x8,%esp
c0107a4f:	6a 00                	push   $0x0
c0107a51:	ff 75 f4             	pushl  -0xc(%ebp)
c0107a54:	e8 36 d4 ff ff       	call   c0104e8f <open>
c0107a59:	83 c4 10             	add    $0x10,%esp
c0107a5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107a5f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107a66:	83 ec 04             	sub    $0x4,%esp
c0107a69:	68 cb 00 00 00       	push   $0xcb
c0107a6e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0107a74:	50                   	push   %eax
c0107a75:	ff 75 f0             	pushl  -0x10(%ebp)
c0107a78:	e8 a7 d4 ff ff       	call   c0104f24 <read>
c0107a7d:	83 c4 10             	add    $0x10,%esp
c0107a80:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107a83:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c0107a8a:	74 1c                	je     c0107aa8 <TestReadReturnValue+0x6c>
c0107a8c:	68 08 02 00 00       	push   $0x208
c0107a91:	68 e1 ba 10 c0       	push   $0xc010bae1
c0107a96:	68 e1 ba 10 c0       	push   $0xc010bae1
c0107a9b:	68 f1 ba 10 c0       	push   $0xc010baf1
c0107aa0:	e8 90 11 00 00       	call   c0108c35 <assertion_failure>
c0107aa5:	83 c4 10             	add    $0x10,%esp
c0107aa8:	83 ec 0c             	sub    $0xc,%esp
c0107aab:	ff 75 f0             	pushl  -0x10(%ebp)
c0107aae:	e8 77 d6 ff ff       	call   c010512a <close>
c0107ab3:	83 c4 10             	add    $0x10,%esp
c0107ab6:	90                   	nop
c0107ab7:	c9                   	leave  
c0107ab8:	c3                   	ret    

c0107ab9 <TestWriteReturnValue>:
c0107ab9:	55                   	push   %ebp
c0107aba:	89 e5                	mov    %esp,%ebp
c0107abc:	81 ec 28 02 00 00    	sub    $0x228,%esp
c0107ac2:	c7 45 f4 fc ba 10 c0 	movl   $0xc010bafc,-0xc(%ebp)
c0107ac9:	83 ec 08             	sub    $0x8,%esp
c0107acc:	6a 07                	push   $0x7
c0107ace:	ff 75 f4             	pushl  -0xc(%ebp)
c0107ad1:	e8 b9 d3 ff ff       	call   c0104e8f <open>
c0107ad6:	83 c4 10             	add    $0x10,%esp
c0107ad9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107adc:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c0107ae0:	75 1c                	jne    c0107afe <TestWriteReturnValue+0x45>
c0107ae2:	68 12 02 00 00       	push   $0x212
c0107ae7:	68 e1 ba 10 c0       	push   $0xc010bae1
c0107aec:	68 e1 ba 10 c0       	push   $0xc010bae1
c0107af1:	68 09 bb 10 c0       	push   $0xc010bb09
c0107af6:	e8 3a 11 00 00       	call   c0108c35 <assertion_failure>
c0107afb:	83 c4 10             	add    $0x10,%esp
c0107afe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107b05:	c7 45 e8 14 bb 10 c0 	movl   $0xc010bb14,-0x18(%ebp)
c0107b0c:	83 ec 0c             	sub    $0xc,%esp
c0107b0f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107b12:	e8 71 47 00 00       	call   c010c288 <Strlen>
c0107b17:	83 c4 10             	add    $0x10,%esp
c0107b1a:	83 ec 04             	sub    $0x4,%esp
c0107b1d:	50                   	push   %eax
c0107b1e:	ff 75 e8             	pushl  -0x18(%ebp)
c0107b21:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107b27:	50                   	push   %eax
c0107b28:	e8 ef f4 ff ff       	call   c010701c <Memcpy>
c0107b2d:	83 c4 10             	add    $0x10,%esp
c0107b30:	83 ec 04             	sub    $0x4,%esp
c0107b33:	68 ff 01 00 00       	push   $0x1ff
c0107b38:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107b3e:	50                   	push   %eax
c0107b3f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107b42:	e8 5e d5 ff ff       	call   c01050a5 <write>
c0107b47:	83 c4 10             	add    $0x10,%esp
c0107b4a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107b4d:	83 ec 0c             	sub    $0xc,%esp
c0107b50:	ff 75 e8             	pushl  -0x18(%ebp)
c0107b53:	e8 30 47 00 00       	call   c010c288 <Strlen>
c0107b58:	83 c4 10             	add    $0x10,%esp
c0107b5b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0107b5e:	74 1c                	je     c0107b7c <TestWriteReturnValue+0xc3>
c0107b60:	68 1c 02 00 00       	push   $0x21c
c0107b65:	68 e1 ba 10 c0       	push   $0xc010bae1
c0107b6a:	68 e1 ba 10 c0       	push   $0xc010bae1
c0107b6f:	68 47 bb 10 c0       	push   $0xc010bb47
c0107b74:	e8 bc 10 00 00       	call   c0108c35 <assertion_failure>
c0107b79:	83 c4 10             	add    $0x10,%esp
c0107b7c:	83 ec 0c             	sub    $0xc,%esp
c0107b7f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107b82:	e8 a3 d5 ff ff       	call   c010512a <close>
c0107b87:	83 c4 10             	add    $0x10,%esp
c0107b8a:	90                   	nop
c0107b8b:	c9                   	leave  
c0107b8c:	c3                   	ret    

c0107b8d <TestFS2>:
c0107b8d:	55                   	push   %ebp
c0107b8e:	89 e5                	mov    %esp,%ebp
c0107b90:	83 ec 08             	sub    $0x8,%esp
c0107b93:	e8 21 ff ff ff       	call   c0107ab9 <TestWriteReturnValue>
c0107b98:	90                   	nop
c0107b99:	c9                   	leave  
c0107b9a:	c3                   	ret    

c0107b9b <TestFS>:
c0107b9b:	55                   	push   %ebp
c0107b9c:	89 e5                	mov    %esp,%ebp
c0107b9e:	57                   	push   %edi
c0107b9f:	56                   	push   %esi
c0107ba0:	53                   	push   %ebx
c0107ba1:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c0107ba7:	83 ec 0c             	sub    $0xc,%esp
c0107baa:	68 5a bb 10 c0       	push   $0xc010bb5a
c0107baf:	e8 25 85 ff ff       	call   c01000d9 <disp_str>
c0107bb4:	83 c4 10             	add    $0x10,%esp
c0107bb7:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c0107bbe:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107bc5:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c0107bcb:	83 ec 08             	sub    $0x8,%esp
c0107bce:	6a 02                	push   $0x2
c0107bd0:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107bd3:	50                   	push   %eax
c0107bd4:	e8 b6 d2 ff ff       	call   c0104e8f <open>
c0107bd9:	83 c4 10             	add    $0x10,%esp
c0107bdc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107bdf:	83 ec 08             	sub    $0x8,%esp
c0107be2:	6a 02                	push   $0x2
c0107be4:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107be7:	50                   	push   %eax
c0107be8:	e8 a2 d2 ff ff       	call   c0104e8f <open>
c0107bed:	83 c4 10             	add    $0x10,%esp
c0107bf0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107bf3:	83 ec 0c             	sub    $0xc,%esp
c0107bf6:	68 b9 ba 10 c0       	push   $0xc010bab9
c0107bfb:	e8 d8 0c 00 00       	call   c01088d8 <Printf>
c0107c00:	83 c4 10             	add    $0x10,%esp
c0107c03:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c0107c0a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c0107c0e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c0107c15:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c0107c19:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c0107c20:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c0107c27:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c0107c2d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c0107c34:	83 ec 0c             	sub    $0xc,%esp
c0107c37:	68 62 bb 10 c0       	push   $0xc010bb62
c0107c3c:	e8 97 0c 00 00       	call   c01088d8 <Printf>
c0107c41:	83 c4 10             	add    $0x10,%esp
c0107c44:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c0107c48:	0f 85 e6 03 00 00    	jne    c0108034 <TestFS+0x499>
c0107c4e:	83 ec 08             	sub    $0x8,%esp
c0107c51:	6a 07                	push   $0x7
c0107c53:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107c56:	50                   	push   %eax
c0107c57:	e8 33 d2 ff ff       	call   c0104e8f <open>
c0107c5c:	83 c4 10             	add    $0x10,%esp
c0107c5f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107c62:	83 ec 08             	sub    $0x8,%esp
c0107c65:	ff 75 d0             	pushl  -0x30(%ebp)
c0107c68:	68 7a bb 10 c0       	push   $0xc010bb7a
c0107c6d:	e8 66 0c 00 00       	call   c01088d8 <Printf>
c0107c72:	83 c4 10             	add    $0x10,%esp
c0107c75:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107c7c:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107c83:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c0107c8a:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107c91:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107c98:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c0107c9f:	83 ec 0c             	sub    $0xc,%esp
c0107ca2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107ca5:	50                   	push   %eax
c0107ca6:	e8 dd 45 00 00       	call   c010c288 <Strlen>
c0107cab:	83 c4 10             	add    $0x10,%esp
c0107cae:	83 ec 04             	sub    $0x4,%esp
c0107cb1:	50                   	push   %eax
c0107cb2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107cb5:	50                   	push   %eax
c0107cb6:	ff 75 d0             	pushl  -0x30(%ebp)
c0107cb9:	e8 e7 d3 ff ff       	call   c01050a5 <write>
c0107cbe:	83 c4 10             	add    $0x10,%esp
c0107cc1:	83 ec 0c             	sub    $0xc,%esp
c0107cc4:	ff 75 d0             	pushl  -0x30(%ebp)
c0107cc7:	e8 5e d4 ff ff       	call   c010512a <close>
c0107ccc:	83 c4 10             	add    $0x10,%esp
c0107ccf:	83 ec 08             	sub    $0x8,%esp
c0107cd2:	6a 00                	push   $0x0
c0107cd4:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107cd7:	50                   	push   %eax
c0107cd8:	e8 b2 d1 ff ff       	call   c0104e8f <open>
c0107cdd:	83 c4 10             	add    $0x10,%esp
c0107ce0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107ce3:	83 ec 04             	sub    $0x4,%esp
c0107ce6:	6a 14                	push   $0x14
c0107ce8:	6a 00                	push   $0x0
c0107cea:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107cf0:	50                   	push   %eax
c0107cf1:	e8 59 45 00 00       	call   c010c24f <Memset>
c0107cf6:	83 c4 10             	add    $0x10,%esp
c0107cf9:	83 ec 04             	sub    $0x4,%esp
c0107cfc:	6a 12                	push   $0x12
c0107cfe:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107d04:	50                   	push   %eax
c0107d05:	ff 75 d0             	pushl  -0x30(%ebp)
c0107d08:	e8 17 d2 ff ff       	call   c0104f24 <read>
c0107d0d:	83 c4 10             	add    $0x10,%esp
c0107d10:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107d13:	83 ec 08             	sub    $0x8,%esp
c0107d16:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107d1c:	50                   	push   %eax
c0107d1d:	68 83 bb 10 c0       	push   $0xc010bb83
c0107d22:	e8 b1 0b 00 00       	call   c01088d8 <Printf>
c0107d27:	83 c4 10             	add    $0x10,%esp
c0107d2a:	83 ec 0c             	sub    $0xc,%esp
c0107d2d:	6a 0a                	push   $0xa
c0107d2f:	e8 70 0a 00 00       	call   c01087a4 <delay>
c0107d34:	83 c4 10             	add    $0x10,%esp
c0107d37:	83 ec 08             	sub    $0x8,%esp
c0107d3a:	6a 07                	push   $0x7
c0107d3c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107d3f:	50                   	push   %eax
c0107d40:	e8 4a d1 ff ff       	call   c0104e8f <open>
c0107d45:	83 c4 10             	add    $0x10,%esp
c0107d48:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107d4b:	83 ec 08             	sub    $0x8,%esp
c0107d4e:	ff 75 c8             	pushl  -0x38(%ebp)
c0107d51:	68 8e bb 10 c0       	push   $0xc010bb8e
c0107d56:	e8 7d 0b 00 00       	call   c01088d8 <Printf>
c0107d5b:	83 c4 10             	add    $0x10,%esp
c0107d5e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107d65:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107d6b:	bb c4 bb 10 c0       	mov    $0xc010bbc4,%ebx
c0107d70:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107d75:	8b 0b                	mov    (%ebx),%ecx
c0107d77:	89 08                	mov    %ecx,(%eax)
c0107d79:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107d7d:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107d81:	8d 78 04             	lea    0x4(%eax),%edi
c0107d84:	83 e7 fc             	and    $0xfffffffc,%edi
c0107d87:	29 f8                	sub    %edi,%eax
c0107d89:	29 c3                	sub    %eax,%ebx
c0107d8b:	01 c2                	add    %eax,%edx
c0107d8d:	83 e2 fc             	and    $0xfffffffc,%edx
c0107d90:	89 d0                	mov    %edx,%eax
c0107d92:	c1 e8 02             	shr    $0x2,%eax
c0107d95:	89 de                	mov    %ebx,%esi
c0107d97:	89 c1                	mov    %eax,%ecx
c0107d99:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107d9b:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107da2:	00 00 00 
c0107da5:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107dac:	00 00 00 
c0107daf:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107db6:	83 ec 0c             	sub    $0xc,%esp
c0107db9:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107dbf:	50                   	push   %eax
c0107dc0:	e8 c3 44 00 00       	call   c010c288 <Strlen>
c0107dc5:	83 c4 10             	add    $0x10,%esp
c0107dc8:	83 ec 04             	sub    $0x4,%esp
c0107dcb:	50                   	push   %eax
c0107dcc:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107dd2:	50                   	push   %eax
c0107dd3:	ff 75 c8             	pushl  -0x38(%ebp)
c0107dd6:	e8 ca d2 ff ff       	call   c01050a5 <write>
c0107ddb:	83 c4 10             	add    $0x10,%esp
c0107dde:	83 ec 0c             	sub    $0xc,%esp
c0107de1:	ff 75 c8             	pushl  -0x38(%ebp)
c0107de4:	e8 41 d3 ff ff       	call   c010512a <close>
c0107de9:	83 c4 10             	add    $0x10,%esp
c0107dec:	83 ec 08             	sub    $0x8,%esp
c0107def:	6a 00                	push   $0x0
c0107df1:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107df4:	50                   	push   %eax
c0107df5:	e8 95 d0 ff ff       	call   c0104e8f <open>
c0107dfa:	83 c4 10             	add    $0x10,%esp
c0107dfd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107e00:	83 ec 04             	sub    $0x4,%esp
c0107e03:	68 c8 00 00 00       	push   $0xc8
c0107e08:	6a 00                	push   $0x0
c0107e0a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107e10:	50                   	push   %eax
c0107e11:	e8 39 44 00 00       	call   c010c24f <Memset>
c0107e16:	83 c4 10             	add    $0x10,%esp
c0107e19:	83 ec 0c             	sub    $0xc,%esp
c0107e1c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107e22:	50                   	push   %eax
c0107e23:	e8 60 44 00 00       	call   c010c288 <Strlen>
c0107e28:	83 c4 10             	add    $0x10,%esp
c0107e2b:	83 ec 04             	sub    $0x4,%esp
c0107e2e:	50                   	push   %eax
c0107e2f:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107e35:	50                   	push   %eax
c0107e36:	ff 75 c8             	pushl  -0x38(%ebp)
c0107e39:	e8 e6 d0 ff ff       	call   c0104f24 <read>
c0107e3e:	83 c4 10             	add    $0x10,%esp
c0107e41:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107e44:	83 ec 08             	sub    $0x8,%esp
c0107e47:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107e4d:	50                   	push   %eax
c0107e4e:	68 98 bb 10 c0       	push   $0xc010bb98
c0107e53:	e8 80 0a 00 00       	call   c01088d8 <Printf>
c0107e58:	83 c4 10             	add    $0x10,%esp
c0107e5b:	83 ec 08             	sub    $0x8,%esp
c0107e5e:	6a 07                	push   $0x7
c0107e60:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107e63:	50                   	push   %eax
c0107e64:	e8 26 d0 ff ff       	call   c0104e8f <open>
c0107e69:	83 c4 10             	add    $0x10,%esp
c0107e6c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107e6f:	83 ec 08             	sub    $0x8,%esp
c0107e72:	ff 75 c8             	pushl  -0x38(%ebp)
c0107e75:	68 8e bb 10 c0       	push   $0xc010bb8e
c0107e7a:	e8 59 0a 00 00       	call   c01088d8 <Printf>
c0107e7f:	83 c4 10             	add    $0x10,%esp
c0107e82:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107e89:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107e90:	20 77 69 
c0107e93:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107e9a:	6c 20 73 
c0107e9d:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107ea4:	63 63 65 
c0107ea7:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107eae:	73 20 61 
c0107eb1:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107eb8:	20 6c 61 
c0107ebb:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107ec2:	74 2e 00 
c0107ec5:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107ecc:	00 00 00 
c0107ecf:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107ed6:	00 00 
c0107ed8:	83 ec 0c             	sub    $0xc,%esp
c0107edb:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107ee1:	50                   	push   %eax
c0107ee2:	e8 a1 43 00 00       	call   c010c288 <Strlen>
c0107ee7:	83 c4 10             	add    $0x10,%esp
c0107eea:	83 ec 04             	sub    $0x4,%esp
c0107eed:	50                   	push   %eax
c0107eee:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107ef4:	50                   	push   %eax
c0107ef5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107ef8:	e8 a8 d1 ff ff       	call   c01050a5 <write>
c0107efd:	83 c4 10             	add    $0x10,%esp
c0107f00:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107f07:	eb 7e                	jmp    c0107f87 <TestFS+0x3ec>
c0107f09:	83 ec 0c             	sub    $0xc,%esp
c0107f0c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107f0f:	e8 16 d2 ff ff       	call   c010512a <close>
c0107f14:	83 c4 10             	add    $0x10,%esp
c0107f17:	83 ec 08             	sub    $0x8,%esp
c0107f1a:	6a 00                	push   $0x0
c0107f1c:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107f1f:	50                   	push   %eax
c0107f20:	e8 6a cf ff ff       	call   c0104e8f <open>
c0107f25:	83 c4 10             	add    $0x10,%esp
c0107f28:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107f2b:	83 ec 04             	sub    $0x4,%esp
c0107f2e:	6a 1e                	push   $0x1e
c0107f30:	6a 00                	push   $0x0
c0107f32:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107f38:	50                   	push   %eax
c0107f39:	e8 11 43 00 00       	call   c010c24f <Memset>
c0107f3e:	83 c4 10             	add    $0x10,%esp
c0107f41:	83 ec 0c             	sub    $0xc,%esp
c0107f44:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107f4a:	50                   	push   %eax
c0107f4b:	e8 38 43 00 00       	call   c010c288 <Strlen>
c0107f50:	83 c4 10             	add    $0x10,%esp
c0107f53:	83 ec 04             	sub    $0x4,%esp
c0107f56:	50                   	push   %eax
c0107f57:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107f5d:	50                   	push   %eax
c0107f5e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107f61:	e8 be cf ff ff       	call   c0104f24 <read>
c0107f66:	83 c4 10             	add    $0x10,%esp
c0107f69:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107f6c:	83 ec 08             	sub    $0x8,%esp
c0107f6f:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107f75:	50                   	push   %eax
c0107f76:	68 a3 bb 10 c0       	push   $0xc010bba3
c0107f7b:	e8 58 09 00 00       	call   c01088d8 <Printf>
c0107f80:	83 c4 10             	add    $0x10,%esp
c0107f83:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107f87:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107f8b:	0f 8e 78 ff ff ff    	jle    c0107f09 <TestFS+0x36e>
c0107f91:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107f98:	6e 73 74 
c0107f9b:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107fa2:	6c 6c 2e 
c0107fa5:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107fac:	61 72 00 
c0107faf:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107fb6:	00 00 00 
c0107fb9:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107fc0:	00 00 00 
c0107fc3:	83 ec 08             	sub    $0x8,%esp
c0107fc6:	6a 00                	push   $0x0
c0107fc8:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107fce:	50                   	push   %eax
c0107fcf:	e8 bb ce ff ff       	call   c0104e8f <open>
c0107fd4:	83 c4 10             	add    $0x10,%esp
c0107fd7:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107fda:	83 ec 08             	sub    $0x8,%esp
c0107fdd:	ff 75 bc             	pushl  -0x44(%ebp)
c0107fe0:	68 ae bb 10 c0       	push   $0xc010bbae
c0107fe5:	e8 ee 08 00 00       	call   c01088d8 <Printf>
c0107fea:	83 c4 10             	add    $0x10,%esp
c0107fed:	83 ec 04             	sub    $0x4,%esp
c0107ff0:	6a 28                	push   $0x28
c0107ff2:	6a 00                	push   $0x0
c0107ff4:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107ffa:	50                   	push   %eax
c0107ffb:	e8 4f 42 00 00       	call   c010c24f <Memset>
c0108000:	83 c4 10             	add    $0x10,%esp
c0108003:	83 ec 04             	sub    $0x4,%esp
c0108006:	6a 28                	push   $0x28
c0108008:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c010800e:	50                   	push   %eax
c010800f:	ff 75 bc             	pushl  -0x44(%ebp)
c0108012:	e8 0d cf ff ff       	call   c0104f24 <read>
c0108017:	83 c4 10             	add    $0x10,%esp
c010801a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010801d:	83 ec 08             	sub    $0x8,%esp
c0108020:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0108026:	50                   	push   %eax
c0108027:	68 b8 bb 10 c0       	push   $0xc010bbb8
c010802c:	e8 a7 08 00 00       	call   c01088d8 <Printf>
c0108031:	83 c4 10             	add    $0x10,%esp
c0108034:	90                   	nop
c0108035:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0108038:	5b                   	pop    %ebx
c0108039:	5e                   	pop    %esi
c010803a:	5f                   	pop    %edi
c010803b:	5d                   	pop    %ebp
c010803c:	c3                   	ret    

c010803d <wait_exit>:
c010803d:	55                   	push   %ebp
c010803e:	89 e5                	mov    %esp,%ebp
c0108040:	83 ec 28             	sub    $0x28,%esp
c0108043:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c010804a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0108051:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0108057:	83 ec 08             	sub    $0x8,%esp
c010805a:	6a 02                	push   $0x2
c010805c:	8d 45 de             	lea    -0x22(%ebp),%eax
c010805f:	50                   	push   %eax
c0108060:	e8 2a ce ff ff       	call   c0104e8f <open>
c0108065:	83 c4 10             	add    $0x10,%esp
c0108068:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010806b:	83 ec 08             	sub    $0x8,%esp
c010806e:	6a 02                	push   $0x2
c0108070:	8d 45 de             	lea    -0x22(%ebp),%eax
c0108073:	50                   	push   %eax
c0108074:	e8 16 ce ff ff       	call   c0104e8f <open>
c0108079:	83 c4 10             	add    $0x10,%esp
c010807c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010807f:	e8 6b d1 ff ff       	call   c01051ef <fork>
c0108084:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108087:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010808b:	7e 35                	jle    c01080c2 <wait_exit+0x85>
c010808d:	83 ec 0c             	sub    $0xc,%esp
c0108090:	68 8c bc 10 c0       	push   $0xc010bc8c
c0108095:	e8 3e 08 00 00       	call   c01088d8 <Printf>
c010809a:	83 c4 10             	add    $0x10,%esp
c010809d:	83 ec 0c             	sub    $0xc,%esp
c01080a0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c01080a3:	50                   	push   %eax
c01080a4:	e8 d3 d0 ff ff       	call   c010517c <wait>
c01080a9:	83 c4 10             	add    $0x10,%esp
c01080ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01080af:	83 ec 08             	sub    $0x8,%esp
c01080b2:	50                   	push   %eax
c01080b3:	68 a4 bc 10 c0       	push   $0xc010bca4
c01080b8:	e8 1b 08 00 00       	call   c01088d8 <Printf>
c01080bd:	83 c4 10             	add    $0x10,%esp
c01080c0:	eb fe                	jmp    c01080c0 <wait_exit+0x83>
c01080c2:	83 ec 0c             	sub    $0xc,%esp
c01080c5:	68 bf bc 10 c0       	push   $0xc010bcbf
c01080ca:	e8 09 08 00 00       	call   c01088d8 <Printf>
c01080cf:	83 c4 10             	add    $0x10,%esp
c01080d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01080d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01080dc:	8d 50 01             	lea    0x1(%eax),%edx
c01080df:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01080e2:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c01080e7:	7f 02                	jg     c01080eb <wait_exit+0xae>
c01080e9:	eb ee                	jmp    c01080d9 <wait_exit+0x9c>
c01080eb:	90                   	nop
c01080ec:	83 ec 0c             	sub    $0xc,%esp
c01080ef:	68 cb bc 10 c0       	push   $0xc010bccb
c01080f4:	e8 df 07 00 00       	call   c01088d8 <Printf>
c01080f9:	83 c4 10             	add    $0x10,%esp
c01080fc:	83 ec 0c             	sub    $0xc,%esp
c01080ff:	68 d9 bc 10 c0       	push   $0xc010bcd9
c0108104:	e8 cf 07 00 00       	call   c01088d8 <Printf>
c0108109:	83 c4 10             	add    $0x10,%esp
c010810c:	83 ec 0c             	sub    $0xc,%esp
c010810f:	68 e8 bc 10 c0       	push   $0xc010bce8
c0108114:	e8 bf 07 00 00       	call   c01088d8 <Printf>
c0108119:	83 c4 10             	add    $0x10,%esp
c010811c:	83 ec 0c             	sub    $0xc,%esp
c010811f:	6a 5a                	push   $0x5a
c0108121:	e8 9a d0 ff ff       	call   c01051c0 <exit>
c0108126:	83 c4 10             	add    $0x10,%esp
c0108129:	83 ec 0c             	sub    $0xc,%esp
c010812c:	68 f7 bc 10 c0       	push   $0xc010bcf7
c0108131:	e8 a2 07 00 00       	call   c01088d8 <Printf>
c0108136:	83 c4 10             	add    $0x10,%esp
c0108139:	eb fe                	jmp    c0108139 <wait_exit+0xfc>

c010813b <INIT_fork>:
c010813b:	55                   	push   %ebp
c010813c:	89 e5                	mov    %esp,%ebp
c010813e:	83 ec 78             	sub    $0x78,%esp
c0108141:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0108148:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c010814f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0108155:	83 ec 08             	sub    $0x8,%esp
c0108158:	6a 02                	push   $0x2
c010815a:	8d 45 de             	lea    -0x22(%ebp),%eax
c010815d:	50                   	push   %eax
c010815e:	e8 2c cd ff ff       	call   c0104e8f <open>
c0108163:	83 c4 10             	add    $0x10,%esp
c0108166:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108169:	83 ec 08             	sub    $0x8,%esp
c010816c:	6a 02                	push   $0x2
c010816e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0108171:	50                   	push   %eax
c0108172:	e8 18 cd ff ff       	call   c0104e8f <open>
c0108177:	83 c4 10             	add    $0x10,%esp
c010817a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010817d:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0108184:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c010818b:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0108192:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0108199:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c01081a0:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c01081a7:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c01081ae:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c01081b5:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c01081bc:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c01081c3:	83 ec 0c             	sub    $0xc,%esp
c01081c6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01081c9:	50                   	push   %eax
c01081ca:	e8 09 07 00 00       	call   c01088d8 <Printf>
c01081cf:	83 c4 10             	add    $0x10,%esp
c01081d2:	83 ec 0c             	sub    $0xc,%esp
c01081d5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01081d8:	50                   	push   %eax
c01081d9:	e8 aa 40 00 00       	call   c010c288 <Strlen>
c01081de:	83 c4 10             	add    $0x10,%esp
c01081e1:	83 ec 04             	sub    $0x4,%esp
c01081e4:	50                   	push   %eax
c01081e5:	6a 00                	push   $0x0
c01081e7:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01081ea:	50                   	push   %eax
c01081eb:	e8 5f 40 00 00       	call   c010c24f <Memset>
c01081f0:	83 c4 10             	add    $0x10,%esp
c01081f3:	83 ec 04             	sub    $0x4,%esp
c01081f6:	6a 28                	push   $0x28
c01081f8:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01081fb:	50                   	push   %eax
c01081fc:	ff 75 f0             	pushl  -0x10(%ebp)
c01081ff:	e8 20 cd ff ff       	call   c0104f24 <read>
c0108204:	83 c4 10             	add    $0x10,%esp
c0108207:	83 ec 0c             	sub    $0xc,%esp
c010820a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010820d:	50                   	push   %eax
c010820e:	e8 c5 06 00 00       	call   c01088d8 <Printf>
c0108213:	83 c4 10             	add    $0x10,%esp
c0108216:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010821d:	e8 cd cf ff ff       	call   c01051ef <fork>
c0108222:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108225:	83 ec 0c             	sub    $0xc,%esp
c0108228:	6a 01                	push   $0x1
c010822a:	e8 75 05 00 00       	call   c01087a4 <delay>
c010822f:	83 c4 10             	add    $0x10,%esp
c0108232:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108236:	0f 8e cd 00 00 00    	jle    c0108309 <INIT_fork+0x1ce>
c010823c:	83 ec 08             	sub    $0x8,%esp
c010823f:	ff 75 e8             	pushl  -0x18(%ebp)
c0108242:	68 05 bd 10 c0       	push   $0xc010bd05
c0108247:	e8 8c 06 00 00       	call   c01088d8 <Printf>
c010824c:	83 c4 10             	add    $0x10,%esp
c010824f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0108253:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c010825a:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0108261:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0108268:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c010826f:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0108276:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c010827d:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0108284:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c010828b:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108292:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108299:	83 ec 0c             	sub    $0xc,%esp
c010829c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010829f:	50                   	push   %eax
c01082a0:	e8 e3 3f 00 00       	call   c010c288 <Strlen>
c01082a5:	83 c4 10             	add    $0x10,%esp
c01082a8:	83 ec 04             	sub    $0x4,%esp
c01082ab:	50                   	push   %eax
c01082ac:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082af:	50                   	push   %eax
c01082b0:	ff 75 f4             	pushl  -0xc(%ebp)
c01082b3:	e8 ed cd ff ff       	call   c01050a5 <write>
c01082b8:	83 c4 10             	add    $0x10,%esp
c01082bb:	e8 b2 ec ff ff       	call   c0106f72 <catch_error>
c01082c0:	83 ec 0c             	sub    $0xc,%esp
c01082c3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082c6:	50                   	push   %eax
c01082c7:	e8 bc 3f 00 00       	call   c010c288 <Strlen>
c01082cc:	83 c4 10             	add    $0x10,%esp
c01082cf:	83 ec 04             	sub    $0x4,%esp
c01082d2:	50                   	push   %eax
c01082d3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082d6:	50                   	push   %eax
c01082d7:	ff 75 f4             	pushl  -0xc(%ebp)
c01082da:	e8 c6 cd ff ff       	call   c01050a5 <write>
c01082df:	83 c4 10             	add    $0x10,%esp
c01082e2:	83 ec 0c             	sub    $0xc,%esp
c01082e5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082e8:	50                   	push   %eax
c01082e9:	e8 9a 3f 00 00       	call   c010c288 <Strlen>
c01082ee:	83 c4 10             	add    $0x10,%esp
c01082f1:	83 ec 04             	sub    $0x4,%esp
c01082f4:	50                   	push   %eax
c01082f5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082f8:	50                   	push   %eax
c01082f9:	ff 75 f4             	pushl  -0xc(%ebp)
c01082fc:	e8 a4 cd ff ff       	call   c01050a5 <write>
c0108301:	83 c4 10             	add    $0x10,%esp
c0108304:	e9 d6 00 00 00       	jmp    c01083df <INIT_fork+0x2a4>
c0108309:	83 ec 08             	sub    $0x8,%esp
c010830c:	ff 75 e8             	pushl  -0x18(%ebp)
c010830f:	68 05 bd 10 c0       	push   $0xc010bd05
c0108314:	e8 bf 05 00 00       	call   c01088d8 <Printf>
c0108319:	83 c4 10             	add    $0x10,%esp
c010831c:	83 ec 0c             	sub    $0xc,%esp
c010831f:	6a 01                	push   $0x1
c0108321:	e8 7e 04 00 00       	call   c01087a4 <delay>
c0108326:	83 c4 10             	add    $0x10,%esp
c0108329:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010832d:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0108331:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0108338:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c010833f:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0108346:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c010834d:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0108354:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c010835b:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0108362:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0108369:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108370:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108377:	83 ec 0c             	sub    $0xc,%esp
c010837a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010837d:	50                   	push   %eax
c010837e:	e8 05 3f 00 00       	call   c010c288 <Strlen>
c0108383:	83 c4 10             	add    $0x10,%esp
c0108386:	83 ec 04             	sub    $0x4,%esp
c0108389:	50                   	push   %eax
c010838a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010838d:	50                   	push   %eax
c010838e:	ff 75 f4             	pushl  -0xc(%ebp)
c0108391:	e8 0f cd ff ff       	call   c01050a5 <write>
c0108396:	83 c4 10             	add    $0x10,%esp
c0108399:	83 ec 0c             	sub    $0xc,%esp
c010839c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010839f:	50                   	push   %eax
c01083a0:	e8 e3 3e 00 00       	call   c010c288 <Strlen>
c01083a5:	83 c4 10             	add    $0x10,%esp
c01083a8:	83 ec 04             	sub    $0x4,%esp
c01083ab:	50                   	push   %eax
c01083ac:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01083af:	50                   	push   %eax
c01083b0:	ff 75 f4             	pushl  -0xc(%ebp)
c01083b3:	e8 ed cc ff ff       	call   c01050a5 <write>
c01083b8:	83 c4 10             	add    $0x10,%esp
c01083bb:	83 ec 0c             	sub    $0xc,%esp
c01083be:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01083c1:	50                   	push   %eax
c01083c2:	e8 c1 3e 00 00       	call   c010c288 <Strlen>
c01083c7:	83 c4 10             	add    $0x10,%esp
c01083ca:	83 ec 04             	sub    $0x4,%esp
c01083cd:	50                   	push   %eax
c01083ce:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01083d1:	50                   	push   %eax
c01083d2:	ff 75 f4             	pushl  -0xc(%ebp)
c01083d5:	e8 cb cc ff ff       	call   c01050a5 <write>
c01083da:	83 c4 10             	add    $0x10,%esp
c01083dd:	eb fe                	jmp    c01083dd <INIT_fork+0x2a2>
c01083df:	83 ec 04             	sub    $0x4,%esp
c01083e2:	6a 28                	push   $0x28
c01083e4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01083e7:	50                   	push   %eax
c01083e8:	ff 75 f0             	pushl  -0x10(%ebp)
c01083eb:	e8 34 cb ff ff       	call   c0104f24 <read>
c01083f0:	83 c4 10             	add    $0x10,%esp
c01083f3:	83 ec 0c             	sub    $0xc,%esp
c01083f6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01083f9:	50                   	push   %eax
c01083fa:	e8 d9 04 00 00       	call   c01088d8 <Printf>
c01083ff:	83 c4 10             	add    $0x10,%esp
c0108402:	83 ec 0c             	sub    $0xc,%esp
c0108405:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108408:	50                   	push   %eax
c0108409:	e8 ca 04 00 00       	call   c01088d8 <Printf>
c010840e:	83 c4 10             	add    $0x10,%esp
c0108411:	83 ec 0c             	sub    $0xc,%esp
c0108414:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108417:	50                   	push   %eax
c0108418:	e8 bb 04 00 00       	call   c01088d8 <Printf>
c010841d:	83 c4 10             	add    $0x10,%esp
c0108420:	83 ec 0c             	sub    $0xc,%esp
c0108423:	68 0f bd 10 c0       	push   $0xc010bd0f
c0108428:	e8 c4 07 00 00       	call   c0108bf1 <spin>
c010842d:	83 c4 10             	add    $0x10,%esp
c0108430:	90                   	nop
c0108431:	c9                   	leave  
c0108432:	c3                   	ret    

c0108433 <simple_shell>:
c0108433:	55                   	push   %ebp
c0108434:	89 e5                	mov    %esp,%ebp
c0108436:	57                   	push   %edi
c0108437:	83 ec 64             	sub    $0x64,%esp
c010843a:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0108441:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0108448:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c010844e:	83 ec 08             	sub    $0x8,%esp
c0108451:	6a 02                	push   $0x2
c0108453:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108456:	50                   	push   %eax
c0108457:	e8 33 ca ff ff       	call   c0104e8f <open>
c010845c:	83 c4 10             	add    $0x10,%esp
c010845f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108462:	83 ec 08             	sub    $0x8,%esp
c0108465:	6a 02                	push   $0x2
c0108467:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c010846a:	50                   	push   %eax
c010846b:	e8 1f ca ff ff       	call   c0104e8f <open>
c0108470:	83 c4 10             	add    $0x10,%esp
c0108473:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108476:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0108479:	b8 00 00 00 00       	mov    $0x0,%eax
c010847e:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0108483:	89 d7                	mov    %edx,%edi
c0108485:	f3 ab                	rep stos %eax,%es:(%edi)
c0108487:	c7 45 a8 17 bd 10 c0 	movl   $0xc010bd17,-0x58(%ebp)
c010848e:	c7 45 ac 1c bd 10 c0 	movl   $0xc010bd1c,-0x54(%ebp)
c0108495:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010849c:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c01084a3:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c01084aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01084ad:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c01084b4:	00 
c01084b5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01084b8:	85 c0                	test   %eax,%eax
c01084ba:	75 1c                	jne    c01084d8 <simple_shell+0xa5>
c01084bc:	68 0e 03 00 00       	push   $0x30e
c01084c1:	68 e1 ba 10 c0       	push   $0xc010bae1
c01084c6:	68 e1 ba 10 c0       	push   $0xc010bae1
c01084cb:	68 22 bd 10 c0       	push   $0xc010bd22
c01084d0:	e8 60 07 00 00       	call   c0108c35 <assertion_failure>
c01084d5:	83 c4 10             	add    $0x10,%esp
c01084d8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01084db:	83 ec 08             	sub    $0x8,%esp
c01084de:	6a 02                	push   $0x2
c01084e0:	50                   	push   %eax
c01084e1:	e8 a9 c9 ff ff       	call   c0104e8f <open>
c01084e6:	83 c4 10             	add    $0x10,%esp
c01084e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01084ec:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c01084f0:	75 4b                	jne    c010853d <simple_shell+0x10a>
c01084f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084f9:	eb 26                	jmp    c0108521 <simple_shell+0xee>
c01084fb:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01084fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108501:	01 d0                	add    %edx,%eax
c0108503:	0f b6 00             	movzbl (%eax),%eax
c0108506:	0f be c0             	movsbl %al,%eax
c0108509:	83 ec 04             	sub    $0x4,%esp
c010850c:	50                   	push   %eax
c010850d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108510:	68 31 bd 10 c0       	push   $0xc010bd31
c0108515:	e8 be 03 00 00       	call   c01088d8 <Printf>
c010851a:	83 c4 10             	add    $0x10,%esp
c010851d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108521:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0108525:	7e d4                	jle    c01084fb <simple_shell+0xc8>
c0108527:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010852a:	83 ec 08             	sub    $0x8,%esp
c010852d:	50                   	push   %eax
c010852e:	68 38 bd 10 c0       	push   $0xc010bd38
c0108533:	e8 a0 03 00 00       	call   c01088d8 <Printf>
c0108538:	83 c4 10             	add    $0x10,%esp
c010853b:	eb 78                	jmp    c01085b5 <simple_shell+0x182>
c010853d:	83 ec 0c             	sub    $0xc,%esp
c0108540:	68 3e bd 10 c0       	push   $0xc010bd3e
c0108545:	e8 8e 03 00 00       	call   c01088d8 <Printf>
c010854a:	83 c4 10             	add    $0x10,%esp
c010854d:	e8 9d cc ff ff       	call   c01051ef <fork>
c0108552:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108555:	83 ec 0c             	sub    $0xc,%esp
c0108558:	68 53 bd 10 c0       	push   $0xc010bd53
c010855d:	e8 76 03 00 00       	call   c01088d8 <Printf>
c0108562:	83 c4 10             	add    $0x10,%esp
c0108565:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0108569:	7e 11                	jle    c010857c <simple_shell+0x149>
c010856b:	83 ec 0c             	sub    $0xc,%esp
c010856e:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0108571:	50                   	push   %eax
c0108572:	e8 05 cc ff ff       	call   c010517c <wait>
c0108577:	83 c4 10             	add    $0x10,%esp
c010857a:	eb 39                	jmp    c01085b5 <simple_shell+0x182>
c010857c:	83 ec 0c             	sub    $0xc,%esp
c010857f:	68 68 bd 10 c0       	push   $0xc010bd68
c0108584:	e8 4f 03 00 00       	call   c01088d8 <Printf>
c0108589:	83 c4 10             	add    $0x10,%esp
c010858c:	83 ec 0c             	sub    $0xc,%esp
c010858f:	ff 75 e0             	pushl  -0x20(%ebp)
c0108592:	e8 93 cb ff ff       	call   c010512a <close>
c0108597:	83 c4 10             	add    $0x10,%esp
c010859a:	6a 00                	push   $0x0
c010859c:	68 1c bd 10 c0       	push   $0xc010bd1c
c01085a1:	68 17 bd 10 c0       	push   $0xc010bd17
c01085a6:	68 84 bd 10 c0       	push   $0xc010bd84
c01085ab:	e8 12 cf ff ff       	call   c01054c2 <execl>
c01085b0:	83 c4 10             	add    $0x10,%esp
c01085b3:	eb fe                	jmp    c01085b3 <simple_shell+0x180>
c01085b5:	8b 7d fc             	mov    -0x4(%ebp),%edi
c01085b8:	c9                   	leave  
c01085b9:	c3                   	ret    

c01085ba <test_shell>:
c01085ba:	55                   	push   %ebp
c01085bb:	89 e5                	mov    %esp,%ebp
c01085bd:	83 ec 38             	sub    $0x38,%esp
c01085c0:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c01085c7:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c01085ce:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c01085d4:	83 ec 08             	sub    $0x8,%esp
c01085d7:	6a 02                	push   $0x2
c01085d9:	8d 45 ea             	lea    -0x16(%ebp),%eax
c01085dc:	50                   	push   %eax
c01085dd:	e8 ad c8 ff ff       	call   c0104e8f <open>
c01085e2:	83 c4 10             	add    $0x10,%esp
c01085e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085e8:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c01085ef:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c01085f6:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c01085fd:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108604:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010860b:	83 ec 0c             	sub    $0xc,%esp
c010860e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108611:	50                   	push   %eax
c0108612:	e8 38 ea ff ff       	call   c010704f <untar>
c0108617:	83 c4 10             	add    $0x10,%esp
c010861a:	e8 14 fe ff ff       	call   c0108433 <simple_shell>
c010861f:	90                   	nop
c0108620:	c9                   	leave  
c0108621:	c3                   	ret    

c0108622 <test_exec>:
c0108622:	55                   	push   %ebp
c0108623:	89 e5                	mov    %esp,%ebp
c0108625:	83 ec 38             	sub    $0x38,%esp
c0108628:	83 ec 0c             	sub    $0xc,%esp
c010862b:	68 8a bd 10 c0       	push   $0xc010bd8a
c0108630:	e8 a4 7a ff ff       	call   c01000d9 <disp_str>
c0108635:	83 c4 10             	add    $0x10,%esp
c0108638:	83 ec 0c             	sub    $0xc,%esp
c010863b:	68 9c bd 10 c0       	push   $0xc010bd9c
c0108640:	e8 94 7a ff ff       	call   c01000d9 <disp_str>
c0108645:	83 c4 10             	add    $0x10,%esp
c0108648:	83 ec 0c             	sub    $0xc,%esp
c010864b:	6a 07                	push   $0x7
c010864d:	e8 b8 ed ff ff       	call   c010740a <disp_int>
c0108652:	83 c4 10             	add    $0x10,%esp
c0108655:	83 ec 0c             	sub    $0xc,%esp
c0108658:	68 80 b6 10 c0       	push   $0xc010b680
c010865d:	e8 77 7a ff ff       	call   c01000d9 <disp_str>
c0108662:	83 c4 10             	add    $0x10,%esp
c0108665:	83 ec 0c             	sub    $0xc,%esp
c0108668:	68 82 b6 10 c0       	push   $0xc010b682
c010866d:	e8 67 7a ff ff       	call   c01000d9 <disp_str>
c0108672:	83 c4 10             	add    $0x10,%esp
c0108675:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c010867c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108683:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0108689:	83 ec 08             	sub    $0x8,%esp
c010868c:	6a 02                	push   $0x2
c010868e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108691:	50                   	push   %eax
c0108692:	e8 f8 c7 ff ff       	call   c0104e8f <open>
c0108697:	83 c4 10             	add    $0x10,%esp
c010869a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010869d:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c01086a4:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c01086ab:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c01086b2:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c01086b9:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01086c0:	83 ec 0c             	sub    $0xc,%esp
c01086c3:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01086c6:	50                   	push   %eax
c01086c7:	e8 83 e9 ff ff       	call   c010704f <untar>
c01086cc:	83 c4 10             	add    $0x10,%esp
c01086cf:	83 ec 08             	sub    $0x8,%esp
c01086d2:	6a 00                	push   $0x0
c01086d4:	68 af bd 10 c0       	push   $0xc010bdaf
c01086d9:	68 b3 bd 10 c0       	push   $0xc010bdb3
c01086de:	68 1c bd 10 c0       	push   $0xc010bd1c
c01086e3:	68 17 bd 10 c0       	push   $0xc010bd17
c01086e8:	68 84 bd 10 c0       	push   $0xc010bd84
c01086ed:	e8 d0 cd ff ff       	call   c01054c2 <execl>
c01086f2:	83 c4 20             	add    $0x20,%esp
c01086f5:	e8 34 e8 ff ff       	call   c0106f2e <stop_here>
c01086fa:	e8 f0 ca ff ff       	call   c01051ef <fork>
c01086ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108702:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108706:	7e 25                	jle    c010872d <test_exec+0x10b>
c0108708:	83 ec 0c             	sub    $0xc,%esp
c010870b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c010870e:	50                   	push   %eax
c010870f:	e8 68 ca ff ff       	call   c010517c <wait>
c0108714:	83 c4 10             	add    $0x10,%esp
c0108717:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010871a:	83 ec 08             	sub    $0x8,%esp
c010871d:	50                   	push   %eax
c010871e:	68 b9 bd 10 c0       	push   $0xc010bdb9
c0108723:	e8 b0 01 00 00       	call   c01088d8 <Printf>
c0108728:	83 c4 10             	add    $0x10,%esp
c010872b:	eb 33                	jmp    c0108760 <test_exec+0x13e>
c010872d:	83 ec 0c             	sub    $0xc,%esp
c0108730:	68 cb bd 10 c0       	push   $0xc010bdcb
c0108735:	e8 9e 01 00 00       	call   c01088d8 <Printf>
c010873a:	83 c4 10             	add    $0x10,%esp
c010873d:	83 ec 0c             	sub    $0xc,%esp
c0108740:	6a 00                	push   $0x0
c0108742:	68 b3 bd 10 c0       	push   $0xc010bdb3
c0108747:	68 1c bd 10 c0       	push   $0xc010bd1c
c010874c:	68 17 bd 10 c0       	push   $0xc010bd17
c0108751:	68 84 bd 10 c0       	push   $0xc010bd84
c0108756:	e8 67 cd ff ff       	call   c01054c2 <execl>
c010875b:	83 c4 20             	add    $0x20,%esp
c010875e:	eb fe                	jmp    c010875e <test_exec+0x13c>
c0108760:	c9                   	leave  
c0108761:	c3                   	ret    

c0108762 <INIT>:
c0108762:	55                   	push   %ebp
c0108763:	89 e5                	mov    %esp,%ebp
c0108765:	83 ec 08             	sub    $0x8,%esp
c0108768:	e8 4d fe ff ff       	call   c01085ba <test_shell>
c010876d:	eb fe                	jmp    c010876d <INIT+0xb>

c010876f <TestA>:
c010876f:	55                   	push   %ebp
c0108770:	89 e5                	mov    %esp,%ebp
c0108772:	83 ec 08             	sub    $0x8,%esp
c0108775:	83 ec 0c             	sub    $0xc,%esp
c0108778:	6a 05                	push   $0x5
c010877a:	e8 8b ec ff ff       	call   c010740a <disp_int>
c010877f:	83 c4 10             	add    $0x10,%esp
c0108782:	83 ec 0c             	sub    $0xc,%esp
c0108785:	68 93 b7 10 c0       	push   $0xc010b793
c010878a:	e8 4a 79 ff ff       	call   c01000d9 <disp_str>
c010878f:	83 c4 10             	add    $0x10,%esp
c0108792:	83 ec 0c             	sub    $0xc,%esp
c0108795:	68 d9 bd 10 c0       	push   $0xc010bdd9
c010879a:	e8 3a 79 ff ff       	call   c01000d9 <disp_str>
c010879f:	83 c4 10             	add    $0x10,%esp
c01087a2:	eb fe                	jmp    c01087a2 <TestA+0x33>

c01087a4 <delay>:
c01087a4:	55                   	push   %ebp
c01087a5:	89 e5                	mov    %esp,%ebp
c01087a7:	83 ec 10             	sub    $0x10,%esp
c01087aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01087b1:	eb 2a                	jmp    c01087dd <delay+0x39>
c01087b3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01087ba:	eb 17                	jmp    c01087d3 <delay+0x2f>
c01087bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01087c3:	eb 04                	jmp    c01087c9 <delay+0x25>
c01087c5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01087c9:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01087cd:	7e f6                	jle    c01087c5 <delay+0x21>
c01087cf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01087d3:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c01087d7:	7e e3                	jle    c01087bc <delay+0x18>
c01087d9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01087dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01087e0:	3b 45 08             	cmp    0x8(%ebp),%eax
c01087e3:	7c ce                	jl     c01087b3 <delay+0xf>
c01087e5:	90                   	nop
c01087e6:	c9                   	leave  
c01087e7:	c3                   	ret    

c01087e8 <TestB>:
c01087e8:	55                   	push   %ebp
c01087e9:	89 e5                	mov    %esp,%ebp
c01087eb:	83 ec 08             	sub    $0x8,%esp
c01087ee:	83 ec 0c             	sub    $0xc,%esp
c01087f1:	68 e0 bd 10 c0       	push   $0xc010bde0
c01087f6:	e8 de 78 ff ff       	call   c01000d9 <disp_str>
c01087fb:	83 c4 10             	add    $0x10,%esp
c01087fe:	eb fe                	jmp    c01087fe <TestB+0x16>

c0108800 <TestC>:
c0108800:	55                   	push   %ebp
c0108801:	89 e5                	mov    %esp,%ebp
c0108803:	83 ec 18             	sub    $0x18,%esp
c0108806:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010880d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108811:	77 1a                	ja     c010882d <TestC+0x2d>
c0108813:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010881a:	83 ec 08             	sub    $0x8,%esp
c010881d:	ff 75 f0             	pushl  -0x10(%ebp)
c0108820:	68 e3 bd 10 c0       	push   $0xc010bde3
c0108825:	e8 ae 00 00 00       	call   c01088d8 <Printf>
c010882a:	83 c4 10             	add    $0x10,%esp
c010882d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108831:	eb da                	jmp    c010880d <TestC+0xd>

c0108833 <sys_get_ticks>:
c0108833:	55                   	push   %ebp
c0108834:	89 e5                	mov    %esp,%ebp
c0108836:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010883b:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108841:	5d                   	pop    %ebp
c0108842:	c3                   	ret    

c0108843 <sys_write>:
c0108843:	55                   	push   %ebp
c0108844:	89 e5                	mov    %esp,%ebp
c0108846:	83 ec 18             	sub    $0x18,%esp
c0108849:	8b 45 10             	mov    0x10(%ebp),%eax
c010884c:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108852:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108858:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010885d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108860:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108863:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108866:	8b 45 08             	mov    0x8(%ebp),%eax
c0108869:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010886c:	eb 20                	jmp    c010888e <sys_write+0x4b>
c010886e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108871:	0f b6 00             	movzbl (%eax),%eax
c0108874:	0f b6 c0             	movzbl %al,%eax
c0108877:	83 ec 08             	sub    $0x8,%esp
c010887a:	50                   	push   %eax
c010887b:	ff 75 ec             	pushl  -0x14(%ebp)
c010887e:	e8 7d b9 ff ff       	call   c0104200 <out_char>
c0108883:	83 c4 10             	add    $0x10,%esp
c0108886:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010888a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c010888e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108892:	7f da                	jg     c010886e <sys_write+0x2b>
c0108894:	90                   	nop
c0108895:	c9                   	leave  
c0108896:	c3                   	ret    

c0108897 <milli_delay>:
c0108897:	55                   	push   %ebp
c0108898:	89 e5                	mov    %esp,%ebp
c010889a:	83 ec 18             	sub    $0x18,%esp
c010889d:	e8 8a 11 00 00       	call   c0109a2c <get_ticks_ipc>
c01088a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01088a5:	90                   	nop
c01088a6:	e8 81 11 00 00       	call   c0109a2c <get_ticks_ipc>
c01088ab:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01088ae:	89 c1                	mov    %eax,%ecx
c01088b0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c01088b5:	89 c8                	mov    %ecx,%eax
c01088b7:	f7 ea                	imul   %edx
c01088b9:	c1 fa 05             	sar    $0x5,%edx
c01088bc:	89 c8                	mov    %ecx,%eax
c01088be:	c1 f8 1f             	sar    $0x1f,%eax
c01088c1:	29 c2                	sub    %eax,%edx
c01088c3:	89 d0                	mov    %edx,%eax
c01088c5:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c01088cb:	39 45 08             	cmp    %eax,0x8(%ebp)
c01088ce:	77 d6                	ja     c01088a6 <milli_delay+0xf>
c01088d0:	90                   	nop
c01088d1:	c9                   	leave  
c01088d2:	c3                   	ret    

c01088d3 <TaskSys>:
c01088d3:	55                   	push   %ebp
c01088d4:	89 e5                	mov    %esp,%ebp
c01088d6:	eb fe                	jmp    c01088d6 <TaskSys+0x3>

c01088d8 <Printf>:
c01088d8:	55                   	push   %ebp
c01088d9:	89 e5                	mov    %esp,%ebp
c01088db:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01088e1:	83 ec 04             	sub    $0x4,%esp
c01088e4:	68 00 01 00 00       	push   $0x100
c01088e9:	6a 00                	push   $0x0
c01088eb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01088f1:	50                   	push   %eax
c01088f2:	e8 58 39 00 00       	call   c010c24f <Memset>
c01088f7:	83 c4 10             	add    $0x10,%esp
c01088fa:	8d 45 0c             	lea    0xc(%ebp),%eax
c01088fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108900:	8b 45 08             	mov    0x8(%ebp),%eax
c0108903:	83 ec 04             	sub    $0x4,%esp
c0108906:	ff 75 f4             	pushl  -0xc(%ebp)
c0108909:	50                   	push   %eax
c010890a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108910:	50                   	push   %eax
c0108911:	e8 20 00 00 00       	call   c0108936 <vsprintf>
c0108916:	83 c4 10             	add    $0x10,%esp
c0108919:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010891c:	83 ec 04             	sub    $0x4,%esp
c010891f:	ff 75 f0             	pushl  -0x10(%ebp)
c0108922:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108928:	50                   	push   %eax
c0108929:	6a 00                	push   $0x0
c010892b:	e8 75 c7 ff ff       	call   c01050a5 <write>
c0108930:	83 c4 10             	add    $0x10,%esp
c0108933:	90                   	nop
c0108934:	c9                   	leave  
c0108935:	c3                   	ret    

c0108936 <vsprintf>:
c0108936:	55                   	push   %ebp
c0108937:	89 e5                	mov    %esp,%ebp
c0108939:	81 ec 68 02 00 00    	sub    $0x268,%esp
c010893f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108945:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010894b:	83 ec 04             	sub    $0x4,%esp
c010894e:	6a 40                	push   $0x40
c0108950:	6a 00                	push   $0x0
c0108952:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108958:	50                   	push   %eax
c0108959:	e8 f1 38 00 00       	call   c010c24f <Memset>
c010895e:	83 c4 10             	add    $0x10,%esp
c0108961:	8b 45 10             	mov    0x10(%ebp),%eax
c0108964:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108967:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010896e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108971:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108974:	e9 53 01 00 00       	jmp    c0108acc <vsprintf+0x196>
c0108979:	8b 45 0c             	mov    0xc(%ebp),%eax
c010897c:	0f b6 00             	movzbl (%eax),%eax
c010897f:	3c 25                	cmp    $0x25,%al
c0108981:	74 16                	je     c0108999 <vsprintf+0x63>
c0108983:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108986:	8d 50 01             	lea    0x1(%eax),%edx
c0108989:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010898c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010898f:	0f b6 12             	movzbl (%edx),%edx
c0108992:	88 10                	mov    %dl,(%eax)
c0108994:	e9 2f 01 00 00       	jmp    c0108ac8 <vsprintf+0x192>
c0108999:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010899d:	8b 45 0c             	mov    0xc(%ebp),%eax
c01089a0:	0f b6 00             	movzbl (%eax),%eax
c01089a3:	0f be c0             	movsbl %al,%eax
c01089a6:	83 f8 64             	cmp    $0x64,%eax
c01089a9:	74 26                	je     c01089d1 <vsprintf+0x9b>
c01089ab:	83 f8 64             	cmp    $0x64,%eax
c01089ae:	7f 0e                	jg     c01089be <vsprintf+0x88>
c01089b0:	83 f8 63             	cmp    $0x63,%eax
c01089b3:	0f 84 f2 00 00 00    	je     c0108aab <vsprintf+0x175>
c01089b9:	e9 0a 01 00 00       	jmp    c0108ac8 <vsprintf+0x192>
c01089be:	83 f8 73             	cmp    $0x73,%eax
c01089c1:	0f 84 b0 00 00 00    	je     c0108a77 <vsprintf+0x141>
c01089c7:	83 f8 78             	cmp    $0x78,%eax
c01089ca:	74 5d                	je     c0108a29 <vsprintf+0xf3>
c01089cc:	e9 f7 00 00 00       	jmp    c0108ac8 <vsprintf+0x192>
c01089d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01089d4:	8b 00                	mov    (%eax),%eax
c01089d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01089d9:	83 ec 04             	sub    $0x4,%esp
c01089dc:	6a 0a                	push   $0xa
c01089de:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01089e4:	50                   	push   %eax
c01089e5:	ff 75 e8             	pushl  -0x18(%ebp)
c01089e8:	e8 96 10 00 00       	call   c0109a83 <itoa>
c01089ed:	83 c4 10             	add    $0x10,%esp
c01089f0:	83 ec 08             	sub    $0x8,%esp
c01089f3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01089f9:	50                   	push   %eax
c01089fa:	ff 75 f4             	pushl  -0xc(%ebp)
c01089fd:	e8 6c 38 00 00       	call   c010c26e <Strcpy>
c0108a02:	83 c4 10             	add    $0x10,%esp
c0108a05:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108a09:	83 ec 0c             	sub    $0xc,%esp
c0108a0c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108a12:	50                   	push   %eax
c0108a13:	e8 70 38 00 00       	call   c010c288 <Strlen>
c0108a18:	83 c4 10             	add    $0x10,%esp
c0108a1b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108a1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108a21:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108a24:	e9 9f 00 00 00       	jmp    c0108ac8 <vsprintf+0x192>
c0108a29:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108a2c:	8b 00                	mov    (%eax),%eax
c0108a2e:	83 ec 08             	sub    $0x8,%esp
c0108a31:	50                   	push   %eax
c0108a32:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108a38:	50                   	push   %eax
c0108a39:	e8 26 e9 ff ff       	call   c0107364 <atoi>
c0108a3e:	83 c4 10             	add    $0x10,%esp
c0108a41:	83 ec 08             	sub    $0x8,%esp
c0108a44:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108a4a:	50                   	push   %eax
c0108a4b:	ff 75 f4             	pushl  -0xc(%ebp)
c0108a4e:	e8 1b 38 00 00       	call   c010c26e <Strcpy>
c0108a53:	83 c4 10             	add    $0x10,%esp
c0108a56:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108a5a:	83 ec 0c             	sub    $0xc,%esp
c0108a5d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108a63:	50                   	push   %eax
c0108a64:	e8 1f 38 00 00       	call   c010c288 <Strlen>
c0108a69:	83 c4 10             	add    $0x10,%esp
c0108a6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108a6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108a72:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108a75:	eb 51                	jmp    c0108ac8 <vsprintf+0x192>
c0108a77:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108a7a:	8b 00                	mov    (%eax),%eax
c0108a7c:	83 ec 08             	sub    $0x8,%esp
c0108a7f:	50                   	push   %eax
c0108a80:	ff 75 f4             	pushl  -0xc(%ebp)
c0108a83:	e8 e6 37 00 00       	call   c010c26e <Strcpy>
c0108a88:	83 c4 10             	add    $0x10,%esp
c0108a8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108a8e:	8b 00                	mov    (%eax),%eax
c0108a90:	83 ec 0c             	sub    $0xc,%esp
c0108a93:	50                   	push   %eax
c0108a94:	e8 ef 37 00 00       	call   c010c288 <Strlen>
c0108a99:	83 c4 10             	add    $0x10,%esp
c0108a9c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108a9f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108aa3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108aa6:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108aa9:	eb 1d                	jmp    c0108ac8 <vsprintf+0x192>
c0108aab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108aae:	0f b6 10             	movzbl (%eax),%edx
c0108ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108ab4:	88 10                	mov    %dl,(%eax)
c0108ab6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108aba:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0108ac1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108ac4:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108ac7:	90                   	nop
c0108ac8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108acc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108acf:	0f b6 00             	movzbl (%eax),%eax
c0108ad2:	84 c0                	test   %al,%al
c0108ad4:	0f 85 9f fe ff ff    	jne    c0108979 <vsprintf+0x43>
c0108ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108add:	2b 45 08             	sub    0x8(%ebp),%eax
c0108ae0:	c9                   	leave  
c0108ae1:	c3                   	ret    

c0108ae2 <printx>:
c0108ae2:	55                   	push   %ebp
c0108ae3:	89 e5                	mov    %esp,%ebp
c0108ae5:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108aeb:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108aee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108af1:	8b 45 08             	mov    0x8(%ebp),%eax
c0108af4:	83 ec 04             	sub    $0x4,%esp
c0108af7:	ff 75 f4             	pushl  -0xc(%ebp)
c0108afa:	50                   	push   %eax
c0108afb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108b01:	50                   	push   %eax
c0108b02:	e8 2f fe ff ff       	call   c0108936 <vsprintf>
c0108b07:	83 c4 10             	add    $0x10,%esp
c0108b0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108b0d:	83 ec 08             	sub    $0x8,%esp
c0108b10:	ff 75 f0             	pushl  -0x10(%ebp)
c0108b13:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108b19:	50                   	push   %eax
c0108b1a:	e8 11 8e ff ff       	call   c0101930 <write_debug>
c0108b1f:	83 c4 10             	add    $0x10,%esp
c0108b22:	90                   	nop
c0108b23:	c9                   	leave  
c0108b24:	c3                   	ret    

c0108b25 <sys_printx>:
c0108b25:	55                   	push   %ebp
c0108b26:	89 e5                	mov    %esp,%ebp
c0108b28:	83 ec 28             	sub    $0x28,%esp
c0108b2b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108b30:	85 c0                	test   %eax,%eax
c0108b32:	75 15                	jne    c0108b49 <sys_printx+0x24>
c0108b34:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b37:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108b3d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108b40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108b47:	eb 10                	jmp    c0108b59 <sys_printx+0x34>
c0108b49:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108b4e:	85 c0                	test   %eax,%eax
c0108b50:	74 07                	je     c0108b59 <sys_printx+0x34>
c0108b52:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108b59:	8b 55 08             	mov    0x8(%ebp),%edx
c0108b5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108b5f:	01 d0                	add    %edx,%eax
c0108b61:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108b64:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b67:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108b6d:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108b73:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108b78:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108b7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b7e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108b81:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b84:	0f b6 00             	movzbl (%eax),%eax
c0108b87:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0108b8a:	eb 3a                	jmp    c0108bc6 <sys_printx+0xa1>
c0108b8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b8f:	0f b6 00             	movzbl (%eax),%eax
c0108b92:	3c 3b                	cmp    $0x3b,%al
c0108b94:	74 0a                	je     c0108ba0 <sys_printx+0x7b>
c0108b96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b99:	0f b6 00             	movzbl (%eax),%eax
c0108b9c:	3c 3a                	cmp    $0x3a,%al
c0108b9e:	75 06                	jne    c0108ba6 <sys_printx+0x81>
c0108ba0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108ba4:	eb 20                	jmp    c0108bc6 <sys_printx+0xa1>
c0108ba6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ba9:	0f b6 00             	movzbl (%eax),%eax
c0108bac:	0f b6 c0             	movzbl %al,%eax
c0108baf:	83 ec 08             	sub    $0x8,%esp
c0108bb2:	50                   	push   %eax
c0108bb3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108bb6:	e8 45 b6 ff ff       	call   c0104200 <out_char>
c0108bbb:	83 c4 10             	add    $0x10,%esp
c0108bbe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108bc2:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0108bc6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108bca:	7f c0                	jg     c0108b8c <sys_printx+0x67>
c0108bcc:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108bd0:	75 10                	jne    c0108be2 <sys_printx+0xbd>
c0108bd2:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108bd7:	85 c0                	test   %eax,%eax
c0108bd9:	74 13                	je     c0108bee <sys_printx+0xc9>
c0108bdb:	e8 80 77 ff ff       	call   c0100360 <disable_int>
c0108be0:	eb 0c                	jmp    c0108bee <sys_printx+0xc9>
c0108be2:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0108be6:	75 06                	jne    c0108bee <sys_printx+0xc9>
c0108be8:	e8 73 77 ff ff       	call   c0100360 <disable_int>
c0108bed:	90                   	nop
c0108bee:	90                   	nop
c0108bef:	c9                   	leave  
c0108bf0:	c3                   	ret    

c0108bf1 <spin>:
c0108bf1:	55                   	push   %ebp
c0108bf2:	89 e5                	mov    %esp,%ebp
c0108bf4:	83 ec 08             	sub    $0x8,%esp
c0108bf7:	83 ec 0c             	sub    $0xc,%esp
c0108bfa:	ff 75 08             	pushl  0x8(%ebp)
c0108bfd:	e8 d7 74 ff ff       	call   c01000d9 <disp_str>
c0108c02:	83 c4 10             	add    $0x10,%esp
c0108c05:	83 ec 0c             	sub    $0xc,%esp
c0108c08:	68 93 b7 10 c0       	push   $0xc010b793
c0108c0d:	e8 c7 74 ff ff       	call   c01000d9 <disp_str>
c0108c12:	83 c4 10             	add    $0x10,%esp
c0108c15:	eb fe                	jmp    c0108c15 <spin+0x24>

c0108c17 <panic>:
c0108c17:	55                   	push   %ebp
c0108c18:	89 e5                	mov    %esp,%ebp
c0108c1a:	83 ec 08             	sub    $0x8,%esp
c0108c1d:	83 ec 04             	sub    $0x4,%esp
c0108c20:	ff 75 08             	pushl  0x8(%ebp)
c0108c23:	6a 3a                	push   $0x3a
c0108c25:	68 f0 bd 10 c0       	push   $0xc010bdf0
c0108c2a:	e8 b3 fe ff ff       	call   c0108ae2 <printx>
c0108c2f:	83 c4 10             	add    $0x10,%esp
c0108c32:	90                   	nop
c0108c33:	c9                   	leave  
c0108c34:	c3                   	ret    

c0108c35 <assertion_failure>:
c0108c35:	55                   	push   %ebp
c0108c36:	89 e5                	mov    %esp,%ebp
c0108c38:	83 ec 08             	sub    $0x8,%esp
c0108c3b:	83 ec 08             	sub    $0x8,%esp
c0108c3e:	ff 75 14             	pushl  0x14(%ebp)
c0108c41:	ff 75 10             	pushl  0x10(%ebp)
c0108c44:	ff 75 0c             	pushl  0xc(%ebp)
c0108c47:	ff 75 08             	pushl  0x8(%ebp)
c0108c4a:	6a 3b                	push   $0x3b
c0108c4c:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108c51:	e8 8c fe ff ff       	call   c0108ae2 <printx>
c0108c56:	83 c4 20             	add    $0x20,%esp
c0108c59:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108c60:	00 00 00 
c0108c63:	83 ec 0c             	sub    $0xc,%esp
c0108c66:	68 80 b6 10 c0       	push   $0xc010b680
c0108c6b:	e8 69 74 ff ff       	call   c01000d9 <disp_str>
c0108c70:	83 c4 10             	add    $0x10,%esp
c0108c73:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108c78:	83 ec 0c             	sub    $0xc,%esp
c0108c7b:	50                   	push   %eax
c0108c7c:	e8 89 e7 ff ff       	call   c010740a <disp_int>
c0108c81:	83 c4 10             	add    $0x10,%esp
c0108c84:	83 ec 0c             	sub    $0xc,%esp
c0108c87:	68 82 b6 10 c0       	push   $0xc010b682
c0108c8c:	e8 48 74 ff ff       	call   c01000d9 <disp_str>
c0108c91:	83 c4 10             	add    $0x10,%esp
c0108c94:	83 ec 0c             	sub    $0xc,%esp
c0108c97:	68 2b be 10 c0       	push   $0xc010be2b
c0108c9c:	e8 50 ff ff ff       	call   c0108bf1 <spin>
c0108ca1:	83 c4 10             	add    $0x10,%esp
c0108ca4:	90                   	nop
c0108ca5:	c9                   	leave  
c0108ca6:	c3                   	ret    

c0108ca7 <assertion_failure2>:
c0108ca7:	55                   	push   %ebp
c0108ca8:	89 e5                	mov    %esp,%ebp
c0108caa:	83 ec 08             	sub    $0x8,%esp
c0108cad:	83 ec 04             	sub    $0x4,%esp
c0108cb0:	ff 75 18             	pushl  0x18(%ebp)
c0108cb3:	ff 75 14             	pushl  0x14(%ebp)
c0108cb6:	ff 75 10             	pushl  0x10(%ebp)
c0108cb9:	ff 75 0c             	pushl  0xc(%ebp)
c0108cbc:	ff 75 08             	pushl  0x8(%ebp)
c0108cbf:	6a 3b                	push   $0x3b
c0108cc1:	68 38 be 10 c0       	push   $0xc010be38
c0108cc6:	e8 17 fe ff ff       	call   c0108ae2 <printx>
c0108ccb:	83 c4 20             	add    $0x20,%esp
c0108cce:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108cd5:	00 00 00 
c0108cd8:	83 ec 0c             	sub    $0xc,%esp
c0108cdb:	68 80 b6 10 c0       	push   $0xc010b680
c0108ce0:	e8 f4 73 ff ff       	call   c01000d9 <disp_str>
c0108ce5:	83 c4 10             	add    $0x10,%esp
c0108ce8:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108ced:	83 ec 0c             	sub    $0xc,%esp
c0108cf0:	50                   	push   %eax
c0108cf1:	e8 14 e7 ff ff       	call   c010740a <disp_int>
c0108cf6:	83 c4 10             	add    $0x10,%esp
c0108cf9:	83 ec 0c             	sub    $0xc,%esp
c0108cfc:	68 82 b6 10 c0       	push   $0xc010b682
c0108d01:	e8 d3 73 ff ff       	call   c01000d9 <disp_str>
c0108d06:	83 c4 10             	add    $0x10,%esp
c0108d09:	83 ec 0c             	sub    $0xc,%esp
c0108d0c:	68 2b be 10 c0       	push   $0xc010be2b
c0108d11:	e8 db fe ff ff       	call   c0108bf1 <spin>
c0108d16:	83 c4 10             	add    $0x10,%esp
c0108d19:	90                   	nop
c0108d1a:	c9                   	leave  
c0108d1b:	c3                   	ret    

c0108d1c <dead_lock>:
c0108d1c:	55                   	push   %ebp
c0108d1d:	89 e5                	mov    %esp,%ebp
c0108d1f:	b8 00 00 00 00       	mov    $0x0,%eax
c0108d24:	5d                   	pop    %ebp
c0108d25:	c3                   	ret    

c0108d26 <sys_send_msg>:
c0108d26:	55                   	push   %ebp
c0108d27:	89 e5                	mov    %esp,%ebp
c0108d29:	83 ec 58             	sub    $0x58,%esp
c0108d2c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108d33:	83 ec 0c             	sub    $0xc,%esp
c0108d36:	ff 75 0c             	pushl  0xc(%ebp)
c0108d39:	e8 28 ae ff ff       	call   c0103b66 <pid2proc>
c0108d3e:	83 c4 10             	add    $0x10,%esp
c0108d41:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108d44:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108d48:	74 2c                	je     c0108d76 <sys_send_msg+0x50>
c0108d4a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d4d:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108d53:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108d58:	74 1c                	je     c0108d76 <sys_send_msg+0x50>
c0108d5a:	68 5c 05 00 00       	push   $0x55c
c0108d5f:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108d64:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108d69:	68 78 be 10 c0       	push   $0xc010be78
c0108d6e:	e8 c2 fe ff ff       	call   c0108c35 <assertion_failure>
c0108d73:	83 c4 10             	add    $0x10,%esp
c0108d76:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d79:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108d7f:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108d84:	74 1c                	je     c0108da2 <sys_send_msg+0x7c>
c0108d86:	68 5e 05 00 00       	push   $0x55e
c0108d8b:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108d90:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108d95:	68 a0 be 10 c0       	push   $0xc010bea0
c0108d9a:	e8 96 fe ff ff       	call   c0108c35 <assertion_failure>
c0108d9f:	83 c4 10             	add    $0x10,%esp
c0108da2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108da6:	75 22                	jne    c0108dca <sys_send_msg+0xa4>
c0108da8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108dac:	75 1c                	jne    c0108dca <sys_send_msg+0xa4>
c0108dae:	68 61 05 00 00       	push   $0x561
c0108db3:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108db8:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108dbd:	68 c3 be 10 c0       	push   $0xc010bec3
c0108dc2:	e8 6e fe ff ff       	call   c0108c35 <assertion_failure>
c0108dc7:	83 c4 10             	add    $0x10,%esp
c0108dca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108dcd:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dd4:	84 c0                	test   %al,%al
c0108dd6:	74 65                	je     c0108e3d <sys_send_msg+0x117>
c0108dd8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ddb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108de2:	3c 01                	cmp    $0x1,%al
c0108de4:	74 57                	je     c0108e3d <sys_send_msg+0x117>
c0108de6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108de9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108df0:	3c 02                	cmp    $0x2,%al
c0108df2:	74 49                	je     c0108e3d <sys_send_msg+0x117>
c0108df4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108df7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dfe:	3c 03                	cmp    $0x3,%al
c0108e00:	74 3b                	je     c0108e3d <sys_send_msg+0x117>
c0108e02:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e05:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e0c:	3c 04                	cmp    $0x4,%al
c0108e0e:	74 2d                	je     c0108e3d <sys_send_msg+0x117>
c0108e10:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e13:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e1a:	0f be c0             	movsbl %al,%eax
c0108e1d:	83 ec 0c             	sub    $0xc,%esp
c0108e20:	68 65 05 00 00       	push   $0x565
c0108e25:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108e2a:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108e2f:	50                   	push   %eax
c0108e30:	68 d4 be 10 c0       	push   $0xc010bed4
c0108e35:	e8 6d fe ff ff       	call   c0108ca7 <assertion_failure2>
c0108e3a:	83 c4 20             	add    $0x20,%esp
c0108e3d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e40:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e47:	84 c0                	test   %al,%al
c0108e49:	74 65                	je     c0108eb0 <sys_send_msg+0x18a>
c0108e4b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e4e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e55:	3c 01                	cmp    $0x1,%al
c0108e57:	74 57                	je     c0108eb0 <sys_send_msg+0x18a>
c0108e59:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e5c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e63:	3c 02                	cmp    $0x2,%al
c0108e65:	74 49                	je     c0108eb0 <sys_send_msg+0x18a>
c0108e67:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e6a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e71:	3c 03                	cmp    $0x3,%al
c0108e73:	74 3b                	je     c0108eb0 <sys_send_msg+0x18a>
c0108e75:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e78:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e7f:	3c 04                	cmp    $0x4,%al
c0108e81:	74 2d                	je     c0108eb0 <sys_send_msg+0x18a>
c0108e83:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e86:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e8d:	0f be c0             	movsbl %al,%eax
c0108e90:	83 ec 0c             	sub    $0xc,%esp
c0108e93:	68 68 05 00 00       	push   $0x568
c0108e98:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108e9d:	68 e1 ba 10 c0       	push   $0xc010bae1
c0108ea2:	50                   	push   %eax
c0108ea3:	68 70 bf 10 c0       	push   $0xc010bf70
c0108ea8:	e8 fa fd ff ff       	call   c0108ca7 <assertion_failure2>
c0108ead:	83 c4 20             	add    $0x20,%esp
c0108eb0:	83 ec 0c             	sub    $0xc,%esp
c0108eb3:	ff 75 10             	pushl  0x10(%ebp)
c0108eb6:	e8 31 ad ff ff       	call   c0103bec <proc2pid>
c0108ebb:	83 c4 10             	add    $0x10,%esp
c0108ebe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108ec1:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108ec8:	8b 45 08             	mov    0x8(%ebp),%eax
c0108ecb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108ece:	83 ec 08             	sub    $0x8,%esp
c0108ed1:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108ed4:	ff 75 dc             	pushl  -0x24(%ebp)
c0108ed7:	e8 a6 d3 ff ff       	call   c0106282 <get_physical_address_proc>
c0108edc:	83 c4 10             	add    $0x10,%esp
c0108edf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108ee2:	83 ec 08             	sub    $0x8,%esp
c0108ee5:	ff 75 e0             	pushl  -0x20(%ebp)
c0108ee8:	ff 75 d8             	pushl  -0x28(%ebp)
c0108eeb:	e8 bf d2 ff ff       	call   c01061af <alloc_virtual_memory>
c0108ef0:	83 c4 10             	add    $0x10,%esp
c0108ef3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108ef6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ef9:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108eff:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108f02:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108f09:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108f0c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108f0f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108f12:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108f15:	89 10                	mov    %edx,(%eax)
c0108f17:	83 ec 08             	sub    $0x8,%esp
c0108f1a:	ff 75 0c             	pushl  0xc(%ebp)
c0108f1d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108f20:	e8 f7 fd ff ff       	call   c0108d1c <dead_lock>
c0108f25:	83 c4 10             	add    $0x10,%esp
c0108f28:	83 f8 01             	cmp    $0x1,%eax
c0108f2b:	75 10                	jne    c0108f3d <sys_send_msg+0x217>
c0108f2d:	83 ec 0c             	sub    $0xc,%esp
c0108f30:	68 00 c0 10 c0       	push   $0xc010c000
c0108f35:	e8 dd fc ff ff       	call   c0108c17 <panic>
c0108f3a:	83 c4 10             	add    $0x10,%esp
c0108f3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f40:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f47:	3c 02                	cmp    $0x2,%al
c0108f49:	0f 85 ca 01 00 00    	jne    c0109119 <sys_send_msg+0x3f3>
c0108f4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f52:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108f58:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108f5b:	74 12                	je     c0108f6f <sys_send_msg+0x249>
c0108f5d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f60:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108f66:	83 f8 12             	cmp    $0x12,%eax
c0108f69:	0f 85 aa 01 00 00    	jne    c0109119 <sys_send_msg+0x3f3>
c0108f6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f72:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108f78:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108f7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f7e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108f84:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108f87:	83 ec 08             	sub    $0x8,%esp
c0108f8a:	ff 75 0c             	pushl  0xc(%ebp)
c0108f8d:	ff 75 c0             	pushl  -0x40(%ebp)
c0108f90:	e8 ed d2 ff ff       	call   c0106282 <get_physical_address_proc>
c0108f95:	83 c4 10             	add    $0x10,%esp
c0108f98:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108f9b:	83 ec 08             	sub    $0x8,%esp
c0108f9e:	ff 75 e0             	pushl  -0x20(%ebp)
c0108fa1:	ff 75 bc             	pushl  -0x44(%ebp)
c0108fa4:	e8 06 d2 ff ff       	call   c01061af <alloc_virtual_memory>
c0108fa9:	83 c4 10             	add    $0x10,%esp
c0108fac:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108faf:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108fb2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108fb5:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108fb8:	83 ec 04             	sub    $0x4,%esp
c0108fbb:	51                   	push   %ecx
c0108fbc:	52                   	push   %edx
c0108fbd:	50                   	push   %eax
c0108fbe:	e8 59 e0 ff ff       	call   c010701c <Memcpy>
c0108fc3:	83 c4 10             	add    $0x10,%esp
c0108fc6:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108fcb:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108fd0:	75 0a                	jne    c0108fdc <sys_send_msg+0x2b6>
c0108fd2:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108fd9:	00 00 00 
c0108fdc:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fdf:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108fe6:	00 00 00 
c0108fe9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fec:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108ff3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ff6:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108ffd:	00 00 00 
c0109000:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109003:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010900a:	00 00 00 
c010900d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109010:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109017:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010901a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109021:	00 00 00 
c0109024:	8b 45 10             	mov    0x10(%ebp),%eax
c0109027:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010902e:	00 00 00 
c0109031:	83 ec 0c             	sub    $0xc,%esp
c0109034:	ff 75 e8             	pushl  -0x18(%ebp)
c0109037:	e8 a0 09 00 00       	call   c01099dc <unblock>
c010903c:	83 c4 10             	add    $0x10,%esp
c010903f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109042:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109049:	84 c0                	test   %al,%al
c010904b:	74 1c                	je     c0109069 <sys_send_msg+0x343>
c010904d:	68 a0 05 00 00       	push   $0x5a0
c0109052:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109057:	68 e1 ba 10 c0       	push   $0xc010bae1
c010905c:	68 0b c0 10 c0       	push   $0xc010c00b
c0109061:	e8 cf fb ff ff       	call   c0108c35 <assertion_failure>
c0109066:	83 c4 10             	add    $0x10,%esp
c0109069:	8b 45 10             	mov    0x10(%ebp),%eax
c010906c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109072:	83 f8 21             	cmp    $0x21,%eax
c0109075:	74 1c                	je     c0109093 <sys_send_msg+0x36d>
c0109077:	68 a1 05 00 00       	push   $0x5a1
c010907c:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109081:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109086:	68 1f c0 10 c0       	push   $0xc010c01f
c010908b:	e8 a5 fb ff ff       	call   c0108c35 <assertion_failure>
c0109090:	83 c4 10             	add    $0x10,%esp
c0109093:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109096:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010909c:	85 c0                	test   %eax,%eax
c010909e:	74 1c                	je     c01090bc <sys_send_msg+0x396>
c01090a0:	68 a3 05 00 00       	push   $0x5a3
c01090a5:	68 e1 ba 10 c0       	push   $0xc010bae1
c01090aa:	68 e1 ba 10 c0       	push   $0xc010bae1
c01090af:	68 3c c0 10 c0       	push   $0xc010c03c
c01090b4:	e8 7c fb ff ff       	call   c0108c35 <assertion_failure>
c01090b9:	83 c4 10             	add    $0x10,%esp
c01090bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01090bf:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090c6:	84 c0                	test   %al,%al
c01090c8:	74 1c                	je     c01090e6 <sys_send_msg+0x3c0>
c01090ca:	68 a4 05 00 00       	push   $0x5a4
c01090cf:	68 e1 ba 10 c0       	push   $0xc010bae1
c01090d4:	68 e1 ba 10 c0       	push   $0xc010bae1
c01090d9:	68 51 c0 10 c0       	push   $0xc010c051
c01090de:	e8 52 fb ff ff       	call   c0108c35 <assertion_failure>
c01090e3:	83 c4 10             	add    $0x10,%esp
c01090e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01090e9:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01090ef:	83 f8 21             	cmp    $0x21,%eax
c01090f2:	0f 84 45 01 00 00    	je     c010923d <sys_send_msg+0x517>
c01090f8:	68 a5 05 00 00       	push   $0x5a5
c01090fd:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109102:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109107:	68 68 c0 10 c0       	push   $0xc010c068
c010910c:	e8 24 fb ff ff       	call   c0108c35 <assertion_failure>
c0109111:	83 c4 10             	add    $0x10,%esp
c0109114:	e9 24 01 00 00       	jmp    c010923d <sys_send_msg+0x517>
c0109119:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109120:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109123:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0109126:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109129:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010912f:	85 c0                	test   %eax,%eax
c0109131:	75 1b                	jne    c010914e <sys_send_msg+0x428>
c0109133:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109136:	8b 55 10             	mov    0x10(%ebp),%edx
c0109139:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010913f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109142:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0109149:	00 00 00 
c010914c:	eb 3f                	jmp    c010918d <sys_send_msg+0x467>
c010914e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109151:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109157:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010915a:	eb 12                	jmp    c010916e <sys_send_msg+0x448>
c010915c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010915f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109162:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109165:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c010916b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010916e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109172:	75 e8                	jne    c010915c <sys_send_msg+0x436>
c0109174:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109177:	8b 55 10             	mov    0x10(%ebp),%edx
c010917a:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109180:	8b 45 10             	mov    0x10(%ebp),%eax
c0109183:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010918a:	00 00 00 
c010918d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109190:	8b 55 08             	mov    0x8(%ebp),%edx
c0109193:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109199:	8b 45 10             	mov    0x10(%ebp),%eax
c010919c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010919f:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c01091a5:	8b 45 10             	mov    0x10(%ebp),%eax
c01091a8:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c01091af:	8b 45 10             	mov    0x10(%ebp),%eax
c01091b2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091b9:	3c 01                	cmp    $0x1,%al
c01091bb:	74 1c                	je     c01091d9 <sys_send_msg+0x4b3>
c01091bd:	68 c7 05 00 00       	push   $0x5c7
c01091c2:	68 e1 ba 10 c0       	push   $0xc010bae1
c01091c7:	68 e1 ba 10 c0       	push   $0xc010bae1
c01091cc:	68 8c c0 10 c0       	push   $0xc010c08c
c01091d1:	e8 5f fa ff ff       	call   c0108c35 <assertion_failure>
c01091d6:	83 c4 10             	add    $0x10,%esp
c01091d9:	8b 45 10             	mov    0x10(%ebp),%eax
c01091dc:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01091e2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01091e5:	74 1c                	je     c0109203 <sys_send_msg+0x4dd>
c01091e7:	68 c8 05 00 00       	push   $0x5c8
c01091ec:	68 e1 ba 10 c0       	push   $0xc010bae1
c01091f1:	68 e1 ba 10 c0       	push   $0xc010bae1
c01091f6:	68 a8 c0 10 c0       	push   $0xc010c0a8
c01091fb:	e8 35 fa ff ff       	call   c0108c35 <assertion_failure>
c0109200:	83 c4 10             	add    $0x10,%esp
c0109203:	8b 45 10             	mov    0x10(%ebp),%eax
c0109206:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010920c:	39 45 08             	cmp    %eax,0x8(%ebp)
c010920f:	74 1c                	je     c010922d <sys_send_msg+0x507>
c0109211:	68 c9 05 00 00       	push   $0x5c9
c0109216:	68 e1 ba 10 c0       	push   $0xc010bae1
c010921b:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109220:	68 ca c0 10 c0       	push   $0xc010c0ca
c0109225:	e8 0b fa ff ff       	call   c0108c35 <assertion_failure>
c010922a:	83 c4 10             	add    $0x10,%esp
c010922d:	83 ec 0c             	sub    $0xc,%esp
c0109230:	ff 75 10             	pushl  0x10(%ebp)
c0109233:	e8 68 07 00 00       	call   c01099a0 <block>
c0109238:	83 c4 10             	add    $0x10,%esp
c010923b:	eb 01                	jmp    c010923e <sys_send_msg+0x518>
c010923d:	90                   	nop
c010923e:	b8 00 00 00 00       	mov    $0x0,%eax
c0109243:	c9                   	leave  
c0109244:	c3                   	ret    

c0109245 <sys_receive_msg>:
c0109245:	55                   	push   %ebp
c0109246:	89 e5                	mov    %esp,%ebp
c0109248:	83 ec 58             	sub    $0x58,%esp
c010924b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109252:	83 ec 0c             	sub    $0xc,%esp
c0109255:	ff 75 0c             	pushl  0xc(%ebp)
c0109258:	e8 09 a9 ff ff       	call   c0103b66 <pid2proc>
c010925d:	83 c4 10             	add    $0x10,%esp
c0109260:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109263:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109267:	74 2c                	je     c0109295 <sys_receive_msg+0x50>
c0109269:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010926c:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0109272:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0109277:	74 1c                	je     c0109295 <sys_receive_msg+0x50>
c0109279:	68 dd 05 00 00       	push   $0x5dd
c010927e:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109283:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109288:	68 a0 be 10 c0       	push   $0xc010bea0
c010928d:	e8 a3 f9 ff ff       	call   c0108c35 <assertion_failure>
c0109292:	83 c4 10             	add    $0x10,%esp
c0109295:	8b 45 10             	mov    0x10(%ebp),%eax
c0109298:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c010929e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01092a3:	74 1c                	je     c01092c1 <sys_receive_msg+0x7c>
c01092a5:	68 df 05 00 00       	push   $0x5df
c01092aa:	68 e1 ba 10 c0       	push   $0xc010bae1
c01092af:	68 e1 ba 10 c0       	push   $0xc010bae1
c01092b4:	68 78 be 10 c0       	push   $0xc010be78
c01092b9:	e8 77 f9 ff ff       	call   c0108c35 <assertion_failure>
c01092be:	83 c4 10             	add    $0x10,%esp
c01092c1:	8b 45 10             	mov    0x10(%ebp),%eax
c01092c4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092cb:	84 c0                	test   %al,%al
c01092cd:	74 65                	je     c0109334 <sys_receive_msg+0xef>
c01092cf:	8b 45 10             	mov    0x10(%ebp),%eax
c01092d2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092d9:	3c 01                	cmp    $0x1,%al
c01092db:	74 57                	je     c0109334 <sys_receive_msg+0xef>
c01092dd:	8b 45 10             	mov    0x10(%ebp),%eax
c01092e0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092e7:	3c 02                	cmp    $0x2,%al
c01092e9:	74 49                	je     c0109334 <sys_receive_msg+0xef>
c01092eb:	8b 45 10             	mov    0x10(%ebp),%eax
c01092ee:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092f5:	3c 03                	cmp    $0x3,%al
c01092f7:	74 3b                	je     c0109334 <sys_receive_msg+0xef>
c01092f9:	8b 45 10             	mov    0x10(%ebp),%eax
c01092fc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109303:	3c 04                	cmp    $0x4,%al
c0109305:	74 2d                	je     c0109334 <sys_receive_msg+0xef>
c0109307:	8b 45 10             	mov    0x10(%ebp),%eax
c010930a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109311:	0f be c0             	movsbl %al,%eax
c0109314:	83 ec 0c             	sub    $0xc,%esp
c0109317:	68 e2 05 00 00       	push   $0x5e2
c010931c:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109321:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109326:	50                   	push   %eax
c0109327:	68 d4 be 10 c0       	push   $0xc010bed4
c010932c:	e8 76 f9 ff ff       	call   c0108ca7 <assertion_failure2>
c0109331:	83 c4 20             	add    $0x20,%esp
c0109334:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109338:	74 73                	je     c01093ad <sys_receive_msg+0x168>
c010933a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010933d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109344:	84 c0                	test   %al,%al
c0109346:	74 65                	je     c01093ad <sys_receive_msg+0x168>
c0109348:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010934b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109352:	3c 01                	cmp    $0x1,%al
c0109354:	74 57                	je     c01093ad <sys_receive_msg+0x168>
c0109356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109359:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109360:	3c 02                	cmp    $0x2,%al
c0109362:	74 49                	je     c01093ad <sys_receive_msg+0x168>
c0109364:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109367:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010936e:	3c 03                	cmp    $0x3,%al
c0109370:	74 3b                	je     c01093ad <sys_receive_msg+0x168>
c0109372:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109375:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010937c:	3c 04                	cmp    $0x4,%al
c010937e:	74 2d                	je     c01093ad <sys_receive_msg+0x168>
c0109380:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109383:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010938a:	0f be c0             	movsbl %al,%eax
c010938d:	83 ec 0c             	sub    $0xc,%esp
c0109390:	68 e6 05 00 00       	push   $0x5e6
c0109395:	68 e1 ba 10 c0       	push   $0xc010bae1
c010939a:	68 e1 ba 10 c0       	push   $0xc010bae1
c010939f:	50                   	push   %eax
c01093a0:	68 70 bf 10 c0       	push   $0xc010bf70
c01093a5:	e8 fd f8 ff ff       	call   c0108ca7 <assertion_failure2>
c01093aa:	83 c4 20             	add    $0x20,%esp
c01093ad:	83 ec 0c             	sub    $0xc,%esp
c01093b0:	ff 75 10             	pushl  0x10(%ebp)
c01093b3:	e8 34 a8 ff ff       	call   c0103bec <proc2pid>
c01093b8:	83 c4 10             	add    $0x10,%esp
c01093bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01093be:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c01093c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01093c8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01093cb:	8b 45 10             	mov    0x10(%ebp),%eax
c01093ce:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01093d4:	83 ec 08             	sub    $0x8,%esp
c01093d7:	50                   	push   %eax
c01093d8:	ff 75 d8             	pushl  -0x28(%ebp)
c01093db:	e8 a2 ce ff ff       	call   c0106282 <get_physical_address_proc>
c01093e0:	83 c4 10             	add    $0x10,%esp
c01093e3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01093e6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01093ed:	8b 45 10             	mov    0x10(%ebp),%eax
c01093f0:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c01093f6:	85 c0                	test   %eax,%eax
c01093f8:	0f 84 c5 00 00 00    	je     c01094c3 <sys_receive_msg+0x27e>
c01093fe:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109402:	74 0d                	je     c0109411 <sys_receive_msg+0x1cc>
c0109404:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010940b:	0f 85 b2 00 00 00    	jne    c01094c3 <sys_receive_msg+0x27e>
c0109411:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0109418:	83 ec 0c             	sub    $0xc,%esp
c010941b:	ff 75 d0             	pushl  -0x30(%ebp)
c010941e:	e8 49 85 ff ff       	call   c010196c <sys_malloc>
c0109423:	83 c4 10             	add    $0x10,%esp
c0109426:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109429:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010942c:	83 ec 04             	sub    $0x4,%esp
c010942f:	50                   	push   %eax
c0109430:	6a 00                	push   $0x0
c0109432:	ff 75 cc             	pushl  -0x34(%ebp)
c0109435:	e8 15 2e 00 00       	call   c010c24f <Memset>
c010943a:	83 c4 10             	add    $0x10,%esp
c010943d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109440:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109446:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109449:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109450:	83 ec 08             	sub    $0x8,%esp
c0109453:	ff 75 d0             	pushl  -0x30(%ebp)
c0109456:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109459:	e8 51 cd ff ff       	call   c01061af <alloc_virtual_memory>
c010945e:	83 c4 10             	add    $0x10,%esp
c0109461:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0109464:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0109467:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010946a:	83 ec 04             	sub    $0x4,%esp
c010946d:	52                   	push   %edx
c010946e:	ff 75 cc             	pushl  -0x34(%ebp)
c0109471:	50                   	push   %eax
c0109472:	e8 a5 db ff ff       	call   c010701c <Memcpy>
c0109477:	83 c4 10             	add    $0x10,%esp
c010947a:	8b 45 10             	mov    0x10(%ebp),%eax
c010947d:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109484:	00 00 00 
c0109487:	8b 45 10             	mov    0x10(%ebp),%eax
c010948a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109491:	00 00 00 
c0109494:	8b 45 10             	mov    0x10(%ebp),%eax
c0109497:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010949e:	00 00 00 
c01094a1:	8b 45 10             	mov    0x10(%ebp),%eax
c01094a4:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01094ab:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01094b2:	83 ec 08             	sub    $0x8,%esp
c01094b5:	ff 75 d0             	pushl  -0x30(%ebp)
c01094b8:	ff 75 cc             	pushl  -0x34(%ebp)
c01094bb:	e8 c1 84 ff ff       	call   c0101981 <sys_free>
c01094c0:	83 c4 10             	add    $0x10,%esp
c01094c3:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c01094c7:	0f 84 d4 03 00 00    	je     c01098a1 <sys_receive_msg+0x65c>
c01094cd:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01094d1:	75 26                	jne    c01094f9 <sys_receive_msg+0x2b4>
c01094d3:	8b 45 10             	mov    0x10(%ebp),%eax
c01094d6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01094dc:	85 c0                	test   %eax,%eax
c01094de:	0f 84 8a 00 00 00    	je     c010956e <sys_receive_msg+0x329>
c01094e4:	8b 45 10             	mov    0x10(%ebp),%eax
c01094e7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01094ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01094f0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01094f7:	eb 75                	jmp    c010956e <sys_receive_msg+0x329>
c01094f9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01094fd:	78 6f                	js     c010956e <sys_receive_msg+0x329>
c01094ff:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109503:	7f 69                	jg     c010956e <sys_receive_msg+0x329>
c0109505:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109508:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010950f:	3c 01                	cmp    $0x1,%al
c0109511:	75 5b                	jne    c010956e <sys_receive_msg+0x329>
c0109513:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109516:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010951c:	83 f8 12             	cmp    $0x12,%eax
c010951f:	74 0e                	je     c010952f <sys_receive_msg+0x2ea>
c0109521:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109524:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010952a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c010952d:	75 3f                	jne    c010956e <sys_receive_msg+0x329>
c010952f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109532:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109538:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010953b:	eb 2b                	jmp    c0109568 <sys_receive_msg+0x323>
c010953d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109540:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109543:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109546:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010954c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010954f:	39 c2                	cmp    %eax,%edx
c0109551:	75 09                	jne    c010955c <sys_receive_msg+0x317>
c0109553:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010955a:	eb 12                	jmp    c010956e <sys_receive_msg+0x329>
c010955c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010955f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0109565:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109568:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010956c:	75 cf                	jne    c010953d <sys_receive_msg+0x2f8>
c010956e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0109572:	0f 85 4e 02 00 00    	jne    c01097c6 <sys_receive_msg+0x581>
c0109578:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010957b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010957e:	83 ec 08             	sub    $0x8,%esp
c0109581:	ff 75 dc             	pushl  -0x24(%ebp)
c0109584:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109587:	e8 23 cc ff ff       	call   c01061af <alloc_virtual_memory>
c010958c:	83 c4 10             	add    $0x10,%esp
c010958f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0109592:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109595:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010959b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010959e:	83 ec 0c             	sub    $0xc,%esp
c01095a1:	ff 75 c4             	pushl  -0x3c(%ebp)
c01095a4:	e8 43 a6 ff ff       	call   c0103bec <proc2pid>
c01095a9:	83 c4 10             	add    $0x10,%esp
c01095ac:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01095af:	83 ec 08             	sub    $0x8,%esp
c01095b2:	ff 75 b8             	pushl  -0x48(%ebp)
c01095b5:	ff 75 bc             	pushl  -0x44(%ebp)
c01095b8:	e8 c5 cc ff ff       	call   c0106282 <get_physical_address_proc>
c01095bd:	83 c4 10             	add    $0x10,%esp
c01095c0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01095c3:	83 ec 08             	sub    $0x8,%esp
c01095c6:	ff 75 dc             	pushl  -0x24(%ebp)
c01095c9:	ff 75 b4             	pushl  -0x4c(%ebp)
c01095cc:	e8 de cb ff ff       	call   c01061af <alloc_virtual_memory>
c01095d1:	83 c4 10             	add    $0x10,%esp
c01095d4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01095d7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01095da:	83 ec 04             	sub    $0x4,%esp
c01095dd:	50                   	push   %eax
c01095de:	ff 75 b0             	pushl  -0x50(%ebp)
c01095e1:	ff 75 c0             	pushl  -0x40(%ebp)
c01095e4:	e8 33 da ff ff       	call   c010701c <Memcpy>
c01095e9:	83 c4 10             	add    $0x10,%esp
c01095ec:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01095ef:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01095f2:	8b 45 10             	mov    0x10(%ebp),%eax
c01095f5:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01095fb:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01095fe:	75 21                	jne    c0109621 <sys_receive_msg+0x3dc>
c0109600:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109603:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109609:	8b 45 10             	mov    0x10(%ebp),%eax
c010960c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109612:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109615:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010961c:	00 00 00 
c010961f:	eb 1f                	jmp    c0109640 <sys_receive_msg+0x3fb>
c0109621:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109624:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010962a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010962d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109633:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109636:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010963d:	00 00 00 
c0109640:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109643:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010964a:	00 00 00 
c010964d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109650:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109657:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010965a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109661:	00 00 00 
c0109664:	8b 45 10             	mov    0x10(%ebp),%eax
c0109667:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010966e:	00 00 00 
c0109671:	8b 45 10             	mov    0x10(%ebp),%eax
c0109674:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010967b:	00 00 00 
c010967e:	8b 45 10             	mov    0x10(%ebp),%eax
c0109681:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109688:	00 00 00 
c010968b:	83 ec 0c             	sub    $0xc,%esp
c010968e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109691:	e8 46 03 00 00       	call   c01099dc <unblock>
c0109696:	83 c4 10             	add    $0x10,%esp
c0109699:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010969c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01096a2:	85 c0                	test   %eax,%eax
c01096a4:	74 1c                	je     c01096c2 <sys_receive_msg+0x47d>
c01096a6:	68 56 06 00 00       	push   $0x656
c01096ab:	68 e1 ba 10 c0       	push   $0xc010bae1
c01096b0:	68 e1 ba 10 c0       	push   $0xc010bae1
c01096b5:	68 df c0 10 c0       	push   $0xc010c0df
c01096ba:	e8 76 f5 ff ff       	call   c0108c35 <assertion_failure>
c01096bf:	83 c4 10             	add    $0x10,%esp
c01096c2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01096c5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096cc:	84 c0                	test   %al,%al
c01096ce:	74 1c                	je     c01096ec <sys_receive_msg+0x4a7>
c01096d0:	68 57 06 00 00       	push   $0x657
c01096d5:	68 e1 ba 10 c0       	push   $0xc010bae1
c01096da:	68 e1 ba 10 c0       	push   $0xc010bae1
c01096df:	68 f7 c0 10 c0       	push   $0xc010c0f7
c01096e4:	e8 4c f5 ff ff       	call   c0108c35 <assertion_failure>
c01096e9:	83 c4 10             	add    $0x10,%esp
c01096ec:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01096ef:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01096f5:	83 f8 21             	cmp    $0x21,%eax
c01096f8:	74 1c                	je     c0109716 <sys_receive_msg+0x4d1>
c01096fa:	68 58 06 00 00       	push   $0x658
c01096ff:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109704:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109709:	68 10 c1 10 c0       	push   $0xc010c110
c010970e:	e8 22 f5 ff ff       	call   c0108c35 <assertion_failure>
c0109713:	83 c4 10             	add    $0x10,%esp
c0109716:	8b 45 10             	mov    0x10(%ebp),%eax
c0109719:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010971f:	85 c0                	test   %eax,%eax
c0109721:	74 1c                	je     c010973f <sys_receive_msg+0x4fa>
c0109723:	68 5a 06 00 00       	push   $0x65a
c0109728:	68 e1 ba 10 c0       	push   $0xc010bae1
c010972d:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109732:	68 3c c0 10 c0       	push   $0xc010c03c
c0109737:	e8 f9 f4 ff ff       	call   c0108c35 <assertion_failure>
c010973c:	83 c4 10             	add    $0x10,%esp
c010973f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109742:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109749:	84 c0                	test   %al,%al
c010974b:	74 1c                	je     c0109769 <sys_receive_msg+0x524>
c010974d:	68 5b 06 00 00       	push   $0x65b
c0109752:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109757:	68 e1 ba 10 c0       	push   $0xc010bae1
c010975c:	68 51 c0 10 c0       	push   $0xc010c051
c0109761:	e8 cf f4 ff ff       	call   c0108c35 <assertion_failure>
c0109766:	83 c4 10             	add    $0x10,%esp
c0109769:	8b 45 10             	mov    0x10(%ebp),%eax
c010976c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109772:	83 f8 21             	cmp    $0x21,%eax
c0109775:	74 1c                	je     c0109793 <sys_receive_msg+0x54e>
c0109777:	68 5c 06 00 00       	push   $0x65c
c010977c:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109781:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109786:	68 68 c0 10 c0       	push   $0xc010c068
c010978b:	e8 a5 f4 ff ff       	call   c0108c35 <assertion_failure>
c0109790:	83 c4 10             	add    $0x10,%esp
c0109793:	8b 45 10             	mov    0x10(%ebp),%eax
c0109796:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010979c:	83 f8 21             	cmp    $0x21,%eax
c010979f:	0f 84 f5 00 00 00    	je     c010989a <sys_receive_msg+0x655>
c01097a5:	68 5d 06 00 00       	push   $0x65d
c01097aa:	68 e1 ba 10 c0       	push   $0xc010bae1
c01097af:	68 e1 ba 10 c0       	push   $0xc010bae1
c01097b4:	68 34 c1 10 c0       	push   $0xc010c134
c01097b9:	e8 77 f4 ff ff       	call   c0108c35 <assertion_failure>
c01097be:	83 c4 10             	add    $0x10,%esp
c01097c1:	e9 d4 00 00 00       	jmp    c010989a <sys_receive_msg+0x655>
c01097c6:	8b 45 10             	mov    0x10(%ebp),%eax
c01097c9:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c01097d0:	8b 45 10             	mov    0x10(%ebp),%eax
c01097d3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01097da:	3c 02                	cmp    $0x2,%al
c01097dc:	74 1c                	je     c01097fa <sys_receive_msg+0x5b5>
c01097de:	68 62 06 00 00       	push   $0x662
c01097e3:	68 e1 ba 10 c0       	push   $0xc010bae1
c01097e8:	68 e1 ba 10 c0       	push   $0xc010bae1
c01097ed:	68 53 c1 10 c0       	push   $0xc010c153
c01097f2:	e8 3e f4 ff ff       	call   c0108c35 <assertion_failure>
c01097f7:	83 c4 10             	add    $0x10,%esp
c01097fa:	8b 45 10             	mov    0x10(%ebp),%eax
c01097fd:	8b 55 08             	mov    0x8(%ebp),%edx
c0109800:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109806:	8b 45 10             	mov    0x10(%ebp),%eax
c0109809:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109810:	3c 02                	cmp    $0x2,%al
c0109812:	74 1c                	je     c0109830 <sys_receive_msg+0x5eb>
c0109814:	68 64 06 00 00       	push   $0x664
c0109819:	68 e1 ba 10 c0       	push   $0xc010bae1
c010981e:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109823:	68 53 c1 10 c0       	push   $0xc010c153
c0109828:	e8 08 f4 ff ff       	call   c0108c35 <assertion_failure>
c010982d:	83 c4 10             	add    $0x10,%esp
c0109830:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109834:	75 0f                	jne    c0109845 <sys_receive_msg+0x600>
c0109836:	8b 45 10             	mov    0x10(%ebp),%eax
c0109839:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c0109840:	00 00 00 
c0109843:	eb 0c                	jmp    c0109851 <sys_receive_msg+0x60c>
c0109845:	8b 45 10             	mov    0x10(%ebp),%eax
c0109848:	8b 55 0c             	mov    0xc(%ebp),%edx
c010984b:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0109851:	8b 45 10             	mov    0x10(%ebp),%eax
c0109854:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010985b:	3c 02                	cmp    $0x2,%al
c010985d:	74 2d                	je     c010988c <sys_receive_msg+0x647>
c010985f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109862:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109869:	0f be c0             	movsbl %al,%eax
c010986c:	83 ec 0c             	sub    $0xc,%esp
c010986f:	68 6f 06 00 00       	push   $0x66f
c0109874:	68 e1 ba 10 c0       	push   $0xc010bae1
c0109879:	68 e1 ba 10 c0       	push   $0xc010bae1
c010987e:	50                   	push   %eax
c010987f:	68 53 c1 10 c0       	push   $0xc010c153
c0109884:	e8 1e f4 ff ff       	call   c0108ca7 <assertion_failure2>
c0109889:	83 c4 20             	add    $0x20,%esp
c010988c:	83 ec 0c             	sub    $0xc,%esp
c010988f:	ff 75 10             	pushl  0x10(%ebp)
c0109892:	e8 09 01 00 00       	call   c01099a0 <block>
c0109897:	83 c4 10             	add    $0x10,%esp
c010989a:	b8 00 00 00 00       	mov    $0x0,%eax
c010989f:	eb 02                	jmp    c01098a3 <sys_receive_msg+0x65e>
c01098a1:	90                   	nop
c01098a2:	90                   	nop
c01098a3:	c9                   	leave  
c01098a4:	c3                   	ret    

c01098a5 <send_rec>:
c01098a5:	55                   	push   %ebp
c01098a6:	89 e5                	mov    %esp,%ebp
c01098a8:	83 ec 18             	sub    $0x18,%esp
c01098ab:	8b 45 0c             	mov    0xc(%ebp),%eax
c01098ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01098b1:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01098b8:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01098bc:	74 28                	je     c01098e6 <send_rec+0x41>
c01098be:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01098c2:	74 22                	je     c01098e6 <send_rec+0x41>
c01098c4:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01098c8:	74 1c                	je     c01098e6 <send_rec+0x41>
c01098ca:	68 81 06 00 00       	push   $0x681
c01098cf:	68 e1 ba 10 c0       	push   $0xc010bae1
c01098d4:	68 e1 ba 10 c0       	push   $0xc010bae1
c01098d9:	68 74 c1 10 c0       	push   $0xc010c174
c01098de:	e8 52 f3 ff ff       	call   c0108c35 <assertion_failure>
c01098e3:	83 c4 10             	add    $0x10,%esp
c01098e6:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01098ea:	75 14                	jne    c0109900 <send_rec+0x5b>
c01098ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01098ef:	83 ec 04             	sub    $0x4,%esp
c01098f2:	50                   	push   %eax
c01098f3:	6a 00                	push   $0x0
c01098f5:	ff 75 0c             	pushl  0xc(%ebp)
c01098f8:	e8 52 29 00 00       	call   c010c24f <Memset>
c01098fd:	83 c4 10             	add    $0x10,%esp
c0109900:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109904:	74 23                	je     c0109929 <send_rec+0x84>
c0109906:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010990a:	74 34                	je     c0109940 <send_rec+0x9b>
c010990c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109910:	75 74                	jne    c0109986 <send_rec+0xe1>
c0109912:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109915:	83 ec 08             	sub    $0x8,%esp
c0109918:	ff 75 10             	pushl  0x10(%ebp)
c010991b:	50                   	push   %eax
c010991c:	e8 1f 80 ff ff       	call   c0101940 <send_msg>
c0109921:	83 c4 10             	add    $0x10,%esp
c0109924:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109927:	eb 70                	jmp    c0109999 <send_rec+0xf4>
c0109929:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010992c:	83 ec 08             	sub    $0x8,%esp
c010992f:	ff 75 10             	pushl  0x10(%ebp)
c0109932:	50                   	push   %eax
c0109933:	e8 1e 80 ff ff       	call   c0101956 <receive_msg>
c0109938:	83 c4 10             	add    $0x10,%esp
c010993b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010993e:	eb 59                	jmp    c0109999 <send_rec+0xf4>
c0109940:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109943:	83 ec 08             	sub    $0x8,%esp
c0109946:	ff 75 10             	pushl  0x10(%ebp)
c0109949:	50                   	push   %eax
c010994a:	e8 f1 7f ff ff       	call   c0101940 <send_msg>
c010994f:	83 c4 10             	add    $0x10,%esp
c0109952:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109955:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0109959:	75 3d                	jne    c0109998 <send_rec+0xf3>
c010995b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010995e:	83 ec 04             	sub    $0x4,%esp
c0109961:	50                   	push   %eax
c0109962:	6a 00                	push   $0x0
c0109964:	ff 75 0c             	pushl  0xc(%ebp)
c0109967:	e8 e3 28 00 00       	call   c010c24f <Memset>
c010996c:	83 c4 10             	add    $0x10,%esp
c010996f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109972:	83 ec 08             	sub    $0x8,%esp
c0109975:	ff 75 10             	pushl  0x10(%ebp)
c0109978:	50                   	push   %eax
c0109979:	e8 d8 7f ff ff       	call   c0101956 <receive_msg>
c010997e:	83 c4 10             	add    $0x10,%esp
c0109981:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109984:	eb 12                	jmp    c0109998 <send_rec+0xf3>
c0109986:	83 ec 0c             	sub    $0xc,%esp
c0109989:	68 b0 c1 10 c0       	push   $0xc010c1b0
c010998e:	e8 84 f2 ff ff       	call   c0108c17 <panic>
c0109993:	83 c4 10             	add    $0x10,%esp
c0109996:	eb 01                	jmp    c0109999 <send_rec+0xf4>
c0109998:	90                   	nop
c0109999:	b8 00 00 00 00       	mov    $0x0,%eax
c010999e:	c9                   	leave  
c010999f:	c3                   	ret    

c01099a0 <block>:
c01099a0:	55                   	push   %ebp
c01099a1:	89 e5                	mov    %esp,%ebp
c01099a3:	83 ec 08             	sub    $0x8,%esp
c01099a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01099a9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01099b0:	84 c0                	test   %al,%al
c01099b2:	75 1c                	jne    c01099d0 <block+0x30>
c01099b4:	68 b0 06 00 00       	push   $0x6b0
c01099b9:	68 e1 ba 10 c0       	push   $0xc010bae1
c01099be:	68 e1 ba 10 c0       	push   $0xc010bae1
c01099c3:	68 c5 c1 10 c0       	push   $0xc010c1c5
c01099c8:	e8 68 f2 ff ff       	call   c0108c35 <assertion_failure>
c01099cd:	83 c4 10             	add    $0x10,%esp
c01099d0:	e8 13 a0 ff ff       	call   c01039e8 <schedule_process>
c01099d5:	b8 00 00 00 00       	mov    $0x0,%eax
c01099da:	c9                   	leave  
c01099db:	c3                   	ret    

c01099dc <unblock>:
c01099dc:	55                   	push   %ebp
c01099dd:	89 e5                	mov    %esp,%ebp
c01099df:	83 ec 08             	sub    $0x8,%esp
c01099e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01099e5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01099ec:	84 c0                	test   %al,%al
c01099ee:	74 1c                	je     c0109a0c <unblock+0x30>
c01099f0:	68 b9 06 00 00       	push   $0x6b9
c01099f5:	68 e1 ba 10 c0       	push   $0xc010bae1
c01099fa:	68 e1 ba 10 c0       	push   $0xc010bae1
c01099ff:	68 dd c1 10 c0       	push   $0xc010c1dd
c0109a04:	e8 2c f2 ff ff       	call   c0108c35 <assertion_failure>
c0109a09:	83 c4 10             	add    $0x10,%esp
c0109a0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a0f:	05 60 02 00 00       	add    $0x260,%eax
c0109a14:	83 ec 08             	sub    $0x8,%esp
c0109a17:	50                   	push   %eax
c0109a18:	68 ec fd 10 c0       	push   $0xc010fdec
c0109a1d:	e8 ce 0a 00 00       	call   c010a4f0 <appendToDoubleLinkList>
c0109a22:	83 c4 10             	add    $0x10,%esp
c0109a25:	b8 00 00 00 00       	mov    $0x0,%eax
c0109a2a:	c9                   	leave  
c0109a2b:	c3                   	ret    

c0109a2c <get_ticks_ipc>:
c0109a2c:	55                   	push   %ebp
c0109a2d:	89 e5                	mov    %esp,%ebp
c0109a2f:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109a35:	83 ec 04             	sub    $0x4,%esp
c0109a38:	6a 7c                	push   $0x7c
c0109a3a:	6a 00                	push   $0x0
c0109a3c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109a42:	50                   	push   %eax
c0109a43:	e8 07 28 00 00       	call   c010c24f <Memset>
c0109a48:	83 c4 10             	add    $0x10,%esp
c0109a4b:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109a52:	00 00 00 
c0109a55:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0109a5c:	83 ec 04             	sub    $0x4,%esp
c0109a5f:	6a 01                	push   $0x1
c0109a61:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109a67:	50                   	push   %eax
c0109a68:	6a 03                	push   $0x3
c0109a6a:	e8 36 fe ff ff       	call   c01098a5 <send_rec>
c0109a6f:	83 c4 10             	add    $0x10,%esp
c0109a72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109a75:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0109a7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109a81:	c9                   	leave  
c0109a82:	c3                   	ret    

c0109a83 <itoa>:
c0109a83:	55                   	push   %ebp
c0109a84:	89 e5                	mov    %esp,%ebp
c0109a86:	53                   	push   %ebx
c0109a87:	83 ec 14             	sub    $0x14,%esp
c0109a8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a8d:	99                   	cltd   
c0109a8e:	f7 7d 10             	idivl  0x10(%ebp)
c0109a91:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109a94:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a97:	99                   	cltd   
c0109a98:	f7 7d 10             	idivl  0x10(%ebp)
c0109a9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a9e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109aa2:	74 14                	je     c0109ab8 <itoa+0x35>
c0109aa4:	83 ec 04             	sub    $0x4,%esp
c0109aa7:	ff 75 10             	pushl  0x10(%ebp)
c0109aaa:	ff 75 0c             	pushl  0xc(%ebp)
c0109aad:	ff 75 f0             	pushl  -0x10(%ebp)
c0109ab0:	e8 ce ff ff ff       	call   c0109a83 <itoa>
c0109ab5:	83 c4 10             	add    $0x10,%esp
c0109ab8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109abb:	8d 58 30             	lea    0x30(%eax),%ebx
c0109abe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109ac1:	8b 00                	mov    (%eax),%eax
c0109ac3:	8d 48 01             	lea    0x1(%eax),%ecx
c0109ac6:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109ac9:	89 0a                	mov    %ecx,(%edx)
c0109acb:	89 da                	mov    %ebx,%edx
c0109acd:	88 10                	mov    %dl,(%eax)
c0109acf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109ad2:	8b 00                	mov    (%eax),%eax
c0109ad4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109ad7:	c9                   	leave  
c0109ad8:	c3                   	ret    

c0109ad9 <i2a>:
c0109ad9:	55                   	push   %ebp
c0109ada:	89 e5                	mov    %esp,%ebp
c0109adc:	53                   	push   %ebx
c0109add:	83 ec 14             	sub    $0x14,%esp
c0109ae0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ae3:	99                   	cltd   
c0109ae4:	f7 7d 0c             	idivl  0xc(%ebp)
c0109ae7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109aea:	8b 45 08             	mov    0x8(%ebp),%eax
c0109aed:	99                   	cltd   
c0109aee:	f7 7d 0c             	idivl  0xc(%ebp)
c0109af1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109af4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109af8:	74 14                	je     c0109b0e <i2a+0x35>
c0109afa:	83 ec 04             	sub    $0x4,%esp
c0109afd:	ff 75 10             	pushl  0x10(%ebp)
c0109b00:	ff 75 0c             	pushl  0xc(%ebp)
c0109b03:	ff 75 f0             	pushl  -0x10(%ebp)
c0109b06:	e8 ce ff ff ff       	call   c0109ad9 <i2a>
c0109b0b:	83 c4 10             	add    $0x10,%esp
c0109b0e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109b12:	7f 0a                	jg     c0109b1e <i2a+0x45>
c0109b14:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b17:	83 c0 30             	add    $0x30,%eax
c0109b1a:	89 c3                	mov    %eax,%ebx
c0109b1c:	eb 08                	jmp    c0109b26 <i2a+0x4d>
c0109b1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b21:	83 c0 37             	add    $0x37,%eax
c0109b24:	89 c3                	mov    %eax,%ebx
c0109b26:	8b 45 10             	mov    0x10(%ebp),%eax
c0109b29:	8b 00                	mov    (%eax),%eax
c0109b2b:	8d 48 01             	lea    0x1(%eax),%ecx
c0109b2e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109b31:	89 0a                	mov    %ecx,(%edx)
c0109b33:	88 18                	mov    %bl,(%eax)
c0109b35:	8b 45 10             	mov    0x10(%ebp),%eax
c0109b38:	8b 00                	mov    (%eax),%eax
c0109b3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109b3d:	c9                   	leave  
c0109b3e:	c3                   	ret    

c0109b3f <inform_int>:
c0109b3f:	55                   	push   %ebp
c0109b40:	89 e5                	mov    %esp,%ebp
c0109b42:	83 ec 18             	sub    $0x18,%esp
c0109b45:	83 ec 0c             	sub    $0xc,%esp
c0109b48:	ff 75 08             	pushl  0x8(%ebp)
c0109b4b:	e8 16 a0 ff ff       	call   c0103b66 <pid2proc>
c0109b50:	83 c4 10             	add    $0x10,%esp
c0109b53:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109b56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b59:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109b60:	0f be c0             	movsbl %al,%eax
c0109b63:	83 e0 02             	and    $0x2,%eax
c0109b66:	85 c0                	test   %eax,%eax
c0109b68:	0f 84 8e 00 00 00    	je     c0109bfc <inform_int+0xbd>
c0109b6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b71:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109b77:	3d 13 02 00 00       	cmp    $0x213,%eax
c0109b7c:	74 0e                	je     c0109b8c <inform_int+0x4d>
c0109b7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b81:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109b87:	83 f8 12             	cmp    $0x12,%eax
c0109b8a:	75 7d                	jne    c0109c09 <inform_int+0xca>
c0109b8c:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b96:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109b9c:	83 ec 08             	sub    $0x8,%esp
c0109b9f:	ff 75 f0             	pushl  -0x10(%ebp)
c0109ba2:	50                   	push   %eax
c0109ba3:	e8 07 c6 ff ff       	call   c01061af <alloc_virtual_memory>
c0109ba8:	83 c4 10             	add    $0x10,%esp
c0109bab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109bae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109bb1:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109bb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109bba:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bc4:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109bcb:	00 00 00 
c0109bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bd1:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109bd8:	00 00 00 
c0109bdb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109be2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109be5:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109bec:	83 ec 0c             	sub    $0xc,%esp
c0109bef:	ff 75 f4             	pushl  -0xc(%ebp)
c0109bf2:	e8 e5 fd ff ff       	call   c01099dc <unblock>
c0109bf7:	83 c4 10             	add    $0x10,%esp
c0109bfa:	eb 0d                	jmp    c0109c09 <inform_int+0xca>
c0109bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bff:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109c06:	00 00 00 
c0109c09:	90                   	nop
c0109c0a:	c9                   	leave  
c0109c0b:	c3                   	ret    

c0109c0c <strcmp>:
c0109c0c:	55                   	push   %ebp
c0109c0d:	89 e5                	mov    %esp,%ebp
c0109c0f:	83 ec 10             	sub    $0x10,%esp
c0109c12:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109c16:	74 06                	je     c0109c1e <strcmp+0x12>
c0109c18:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109c1c:	75 08                	jne    c0109c26 <strcmp+0x1a>
c0109c1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c21:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109c24:	eb 53                	jmp    c0109c79 <strcmp+0x6d>
c0109c26:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c29:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0109c2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109c2f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109c32:	eb 18                	jmp    c0109c4c <strcmp+0x40>
c0109c34:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109c37:	0f b6 10             	movzbl (%eax),%edx
c0109c3a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109c3d:	0f b6 00             	movzbl (%eax),%eax
c0109c40:	38 c2                	cmp    %al,%dl
c0109c42:	75 1e                	jne    c0109c62 <strcmp+0x56>
c0109c44:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0109c48:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0109c4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109c4f:	0f b6 00             	movzbl (%eax),%eax
c0109c52:	84 c0                	test   %al,%al
c0109c54:	74 0d                	je     c0109c63 <strcmp+0x57>
c0109c56:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109c59:	0f b6 00             	movzbl (%eax),%eax
c0109c5c:	84 c0                	test   %al,%al
c0109c5e:	75 d4                	jne    c0109c34 <strcmp+0x28>
c0109c60:	eb 01                	jmp    c0109c63 <strcmp+0x57>
c0109c62:	90                   	nop
c0109c63:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109c66:	0f b6 00             	movzbl (%eax),%eax
c0109c69:	0f be d0             	movsbl %al,%edx
c0109c6c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109c6f:	0f b6 00             	movzbl (%eax),%eax
c0109c72:	0f be c0             	movsbl %al,%eax
c0109c75:	29 c2                	sub    %eax,%edx
c0109c77:	89 d0                	mov    %edx,%eax
c0109c79:	c9                   	leave  
c0109c7a:	c3                   	ret    

c0109c7b <create_user_process_address_space>:
c0109c7b:	55                   	push   %ebp
c0109c7c:	89 e5                	mov    %esp,%ebp
c0109c7e:	83 ec 18             	sub    $0x18,%esp
c0109c81:	83 ec 08             	sub    $0x8,%esp
c0109c84:	6a 00                	push   $0x0
c0109c86:	6a 01                	push   $0x1
c0109c88:	e8 5a c8 ff ff       	call   c01064e7 <alloc_memory>
c0109c8d:	83 c4 10             	add    $0x10,%esp
c0109c90:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109c93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c96:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109c9d:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109ca4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ca7:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109cac:	c1 e8 0c             	shr    $0xc,%eax
c0109caf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109cb2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109cb5:	83 c0 07             	add    $0x7,%eax
c0109cb8:	c1 e8 03             	shr    $0x3,%eax
c0109cbb:	89 c2                	mov    %eax,%edx
c0109cbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cc0:	89 50 04             	mov    %edx,0x4(%eax)
c0109cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cc6:	8b 40 04             	mov    0x4(%eax),%eax
c0109cc9:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109cce:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0109cd4:	85 c0                	test   %eax,%eax
c0109cd6:	0f 48 c2             	cmovs  %edx,%eax
c0109cd9:	c1 f8 0c             	sar    $0xc,%eax
c0109cdc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109cdf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109ce2:	83 ec 08             	sub    $0x8,%esp
c0109ce5:	6a 00                	push   $0x0
c0109ce7:	50                   	push   %eax
c0109ce8:	e8 fa c7 ff ff       	call   c01064e7 <alloc_memory>
c0109ced:	83 c4 10             	add    $0x10,%esp
c0109cf0:	89 c2                	mov    %eax,%edx
c0109cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cf5:	89 10                	mov    %edx,(%eax)
c0109cf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cfa:	83 ec 0c             	sub    $0xc,%esp
c0109cfd:	50                   	push   %eax
c0109cfe:	e8 b6 bf ff ff       	call   c0105cb9 <init_bitmap>
c0109d03:	83 c4 10             	add    $0x10,%esp
c0109d06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d09:	c9                   	leave  
c0109d0a:	c3                   	ret    

c0109d0b <user_process>:
c0109d0b:	55                   	push   %ebp
c0109d0c:	89 e5                	mov    %esp,%ebp
c0109d0e:	83 ec 38             	sub    $0x38,%esp
c0109d11:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109d18:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109d1f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109d26:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0109d2a:	75 0e                	jne    c0109d3a <user_process+0x2f>
c0109d2c:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109d32:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109d38:	eb 0c                	jmp    c0109d46 <user_process+0x3b>
c0109d3a:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109d40:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109d46:	e8 f1 66 ff ff       	call   c010043c <get_running_thread_pcb>
c0109d4b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109d4e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d51:	8b 55 14             	mov    0x14(%ebp),%edx
c0109d54:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109d5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d5d:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109d63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d66:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109d6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d6f:	05 00 10 00 00       	add    $0x1000,%eax
c0109d74:	89 c2                	mov    %eax,%edx
c0109d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d79:	89 10                	mov    %edx,(%eax)
c0109d7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d7e:	8b 00                	mov    (%eax),%eax
c0109d80:	83 e8 44             	sub    $0x44,%eax
c0109d83:	89 c2                	mov    %eax,%edx
c0109d85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d88:	89 10                	mov    %edx,(%eax)
c0109d8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d8d:	8b 00                	mov    (%eax),%eax
c0109d8f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109d92:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109d96:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109d9c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109da0:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109da4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109da8:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109dac:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109db0:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109db4:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109dba:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109dbe:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109dc1:	89 50 34             	mov    %edx,0x34(%eax)
c0109dc4:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109dc8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109dcb:	89 50 0c             	mov    %edx,0xc(%eax)
c0109dce:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109dd2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109dd5:	89 50 04             	mov    %edx,0x4(%eax)
c0109dd8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ddc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ddf:	89 50 08             	mov    %edx,0x8(%eax)
c0109de2:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109de6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109de9:	89 50 40             	mov    %edx,0x40(%eax)
c0109dec:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109df0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109df3:	89 10                	mov    %edx,(%eax)
c0109df5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109df8:	8b 55 08             	mov    0x8(%ebp),%edx
c0109dfb:	89 50 30             	mov    %edx,0x30(%eax)
c0109dfe:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109e02:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e05:	89 50 38             	mov    %edx,0x38(%eax)
c0109e08:	83 ec 08             	sub    $0x8,%esp
c0109e0b:	6a 01                	push   $0x1
c0109e0d:	68 00 f0 ff bf       	push   $0xbffff000
c0109e12:	e8 08 c6 ff ff       	call   c010641f <alloc_physical_memory>
c0109e17:	83 c4 10             	add    $0x10,%esp
c0109e1a:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109e20:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e23:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109e26:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e29:	83 ec 0c             	sub    $0xc,%esp
c0109e2c:	50                   	push   %eax
c0109e2d:	e8 dd 64 ff ff       	call   c010030f <restart>
c0109e32:	83 c4 10             	add    $0x10,%esp
c0109e35:	90                   	nop
c0109e36:	c9                   	leave  
c0109e37:	c3                   	ret    

c0109e38 <clone_pcb>:
c0109e38:	55                   	push   %ebp
c0109e39:	89 e5                	mov    %esp,%ebp
c0109e3b:	83 ec 38             	sub    $0x38,%esp
c0109e3e:	83 ec 08             	sub    $0x8,%esp
c0109e41:	6a 00                	push   $0x0
c0109e43:	6a 01                	push   $0x1
c0109e45:	e8 9d c6 ff ff       	call   c01064e7 <alloc_memory>
c0109e4a:	83 c4 10             	add    $0x10,%esp
c0109e4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e50:	83 ec 04             	sub    $0x4,%esp
c0109e53:	68 00 10 00 00       	push   $0x1000
c0109e58:	6a 00                	push   $0x0
c0109e5a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109e5d:	e8 ed 23 00 00       	call   c010c24f <Memset>
c0109e62:	83 c4 10             	add    $0x10,%esp
c0109e65:	83 ec 04             	sub    $0x4,%esp
c0109e68:	68 00 10 00 00       	push   $0x1000
c0109e6d:	ff 75 08             	pushl  0x8(%ebp)
c0109e70:	ff 75 f4             	pushl  -0xc(%ebp)
c0109e73:	e8 a4 d1 ff ff       	call   c010701c <Memcpy>
c0109e78:	83 c4 10             	add    $0x10,%esp
c0109e7b:	a1 cc 06 11 c0       	mov    0xc01106cc,%eax
c0109e80:	8d 50 01             	lea    0x1(%eax),%edx
c0109e83:	89 15 cc 06 11 c0    	mov    %edx,0xc01106cc
c0109e89:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109e8c:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109e92:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e95:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109e9b:	89 c2                	mov    %eax,%edx
c0109e9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ea0:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109ea6:	83 ec 08             	sub    $0x8,%esp
c0109ea9:	6a 00                	push   $0x0
c0109eab:	6a 01                	push   $0x1
c0109ead:	e8 35 c6 ff ff       	call   c01064e7 <alloc_memory>
c0109eb2:	83 c4 10             	add    $0x10,%esp
c0109eb5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109eb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ebb:	05 00 0c 00 00       	add    $0xc00,%eax
c0109ec0:	83 ec 04             	sub    $0x4,%esp
c0109ec3:	68 00 04 00 00       	push   $0x400
c0109ec8:	68 00 fc ff ff       	push   $0xfffffc00
c0109ecd:	50                   	push   %eax
c0109ece:	e8 49 d1 ff ff       	call   c010701c <Memcpy>
c0109ed3:	83 c4 10             	add    $0x10,%esp
c0109ed6:	83 ec 0c             	sub    $0xc,%esp
c0109ed9:	ff 75 f0             	pushl  -0x10(%ebp)
c0109edc:	e8 1d c4 ff ff       	call   c01062fe <get_physical_address>
c0109ee1:	83 c4 10             	add    $0x10,%esp
c0109ee4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109ee7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109eea:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109eef:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109ef2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109ef5:	83 c8 07             	or     $0x7,%eax
c0109ef8:	89 c2                	mov    %eax,%edx
c0109efa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109efd:	89 10                	mov    %edx,(%eax)
c0109eff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f02:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109f05:	89 50 08             	mov    %edx,0x8(%eax)
c0109f08:	e8 6e fd ff ff       	call   c0109c7b <create_user_process_address_space>
c0109f0d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109f10:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109f13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f16:	89 50 0c             	mov    %edx,0xc(%eax)
c0109f19:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f1c:	8b 40 0c             	mov    0xc(%eax),%eax
c0109f1f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109f22:	83 ec 04             	sub    $0x4,%esp
c0109f25:	6a 0c                	push   $0xc
c0109f27:	ff 75 e0             	pushl  -0x20(%ebp)
c0109f2a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109f2d:	e8 ea d0 ff ff       	call   c010701c <Memcpy>
c0109f32:	83 c4 10             	add    $0x10,%esp
c0109f35:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109f3c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109f3f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109f44:	c1 e8 0c             	shr    $0xc,%eax
c0109f47:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109f4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109f4d:	83 c0 07             	add    $0x7,%eax
c0109f50:	c1 e8 03             	shr    $0x3,%eax
c0109f53:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109f56:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109f59:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109f5c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109f5f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109f64:	c1 e8 0c             	shr    $0xc,%eax
c0109f67:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109f6a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109f6d:	83 ec 08             	sub    $0x8,%esp
c0109f70:	6a 00                	push   $0x0
c0109f72:	50                   	push   %eax
c0109f73:	e8 6f c5 ff ff       	call   c01064e7 <alloc_memory>
c0109f78:	83 c4 10             	add    $0x10,%esp
c0109f7b:	89 c2                	mov    %eax,%edx
c0109f7d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f80:	89 10                	mov    %edx,(%eax)
c0109f82:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109f85:	c1 e0 0c             	shl    $0xc,%eax
c0109f88:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109f8b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109f8e:	8b 10                	mov    (%eax),%edx
c0109f90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f93:	8b 00                	mov    (%eax),%eax
c0109f95:	83 ec 04             	sub    $0x4,%esp
c0109f98:	ff 75 cc             	pushl  -0x34(%ebp)
c0109f9b:	52                   	push   %edx
c0109f9c:	50                   	push   %eax
c0109f9d:	e8 7a d0 ff ff       	call   c010701c <Memcpy>
c0109fa2:	83 c4 10             	add    $0x10,%esp
c0109fa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fa8:	c9                   	leave  
c0109fa9:	c3                   	ret    

c0109faa <build_body_stack>:
c0109faa:	55                   	push   %ebp
c0109fab:	89 e5                	mov    %esp,%ebp
c0109fad:	83 ec 48             	sub    $0x48,%esp
c0109fb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109fb3:	8b 40 0c             	mov    0xc(%eax),%eax
c0109fb6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109fb9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fbc:	8b 50 04             	mov    0x4(%eax),%edx
c0109fbf:	8b 00                	mov    (%eax),%eax
c0109fc1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109fc4:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109fc7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109fca:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109fcd:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109fd0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109fd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fd6:	8b 40 08             	mov    0x8(%eax),%eax
c0109fd9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109fdc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109fe3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109fea:	e8 c9 cf ff ff       	call   c0106fb8 <intr_disable>
c0109fef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109ff2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109ff9:	e9 c2 00 00 00       	jmp    c010a0c0 <build_body_stack+0x116>
c0109ffe:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010a001:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010a004:	01 d0                	add    %edx,%eax
c010a006:	0f b6 00             	movzbl (%eax),%eax
c010a009:	88 45 d3             	mov    %al,-0x2d(%ebp)
c010a00c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010a013:	e9 9a 00 00 00       	jmp    c010a0b2 <build_body_stack+0x108>
c010a018:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c010a01c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a01f:	89 c1                	mov    %eax,%ecx
c010a021:	d3 fa                	sar    %cl,%edx
c010a023:	89 d0                	mov    %edx,%eax
c010a025:	83 e0 01             	and    $0x1,%eax
c010a028:	85 c0                	test   %eax,%eax
c010a02a:	75 06                	jne    c010a032 <build_body_stack+0x88>
c010a02c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a030:	eb 7c                	jmp    c010a0ae <build_body_stack+0x104>
c010a032:	8b 45 08             	mov    0x8(%ebp),%eax
c010a035:	8b 40 08             	mov    0x8(%eax),%eax
c010a038:	83 ec 0c             	sub    $0xc,%esp
c010a03b:	50                   	push   %eax
c010a03c:	e8 df 63 ff ff       	call   c0100420 <update_cr3>
c010a041:	83 c4 10             	add    $0x10,%esp
c010a044:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a047:	c1 e0 0c             	shl    $0xc,%eax
c010a04a:	89 c2                	mov    %eax,%edx
c010a04c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010a04f:	01 d0                	add    %edx,%eax
c010a051:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010a054:	8b 55 cc             	mov    -0x34(%ebp),%edx
c010a057:	8b 45 10             	mov    0x10(%ebp),%eax
c010a05a:	83 ec 04             	sub    $0x4,%esp
c010a05d:	68 00 10 00 00       	push   $0x1000
c010a062:	52                   	push   %edx
c010a063:	50                   	push   %eax
c010a064:	e8 b3 cf ff ff       	call   c010701c <Memcpy>
c010a069:	83 c4 10             	add    $0x10,%esp
c010a06c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a06f:	8b 40 08             	mov    0x8(%eax),%eax
c010a072:	83 ec 0c             	sub    $0xc,%esp
c010a075:	50                   	push   %eax
c010a076:	e8 a5 63 ff ff       	call   c0100420 <update_cr3>
c010a07b:	83 c4 10             	add    $0x10,%esp
c010a07e:	83 ec 08             	sub    $0x8,%esp
c010a081:	ff 75 cc             	pushl  -0x34(%ebp)
c010a084:	6a 01                	push   $0x1
c010a086:	e8 be c4 ff ff       	call   c0106549 <get_a_virtual_page>
c010a08b:	83 c4 10             	add    $0x10,%esp
c010a08e:	8b 55 10             	mov    0x10(%ebp),%edx
c010a091:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010a094:	83 ec 04             	sub    $0x4,%esp
c010a097:	68 00 10 00 00       	push   $0x1000
c010a09c:	52                   	push   %edx
c010a09d:	50                   	push   %eax
c010a09e:	e8 79 cf ff ff       	call   c010701c <Memcpy>
c010a0a3:	83 c4 10             	add    $0x10,%esp
c010a0a6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a0aa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010a0ae:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010a0b2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010a0b6:	0f 8e 5c ff ff ff    	jle    c010a018 <build_body_stack+0x6e>
c010a0bc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010a0c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a0c3:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c010a0c6:	0f 87 32 ff ff ff    	ja     c0109ffe <build_body_stack+0x54>
c010a0cc:	83 ec 0c             	sub    $0xc,%esp
c010a0cf:	ff 75 d4             	pushl  -0x2c(%ebp)
c010a0d2:	e8 0a cf ff ff       	call   c0106fe1 <intr_set_status>
c010a0d7:	83 c4 10             	add    $0x10,%esp
c010a0da:	90                   	nop
c010a0db:	c9                   	leave  
c010a0dc:	c3                   	ret    

c010a0dd <build_process_kernel_stack>:
c010a0dd:	55                   	push   %ebp
c010a0de:	89 e5                	mov    %esp,%ebp
c010a0e0:	83 ec 28             	sub    $0x28,%esp
c010a0e3:	e8 d0 ce ff ff       	call   c0106fb8 <intr_disable>
c010a0e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a0eb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0ee:	05 00 10 00 00       	add    $0x1000,%eax
c010a0f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a0f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0f9:	8b 00                	mov    (%eax),%eax
c010a0fb:	83 f8 38             	cmp    $0x38,%eax
c010a0fe:	74 06                	je     c010a106 <build_process_kernel_stack+0x29>
c010a100:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010a104:	eb f0                	jmp    c010a0f6 <build_process_kernel_stack+0x19>
c010a106:	90                   	nop
c010a107:	8b 45 08             	mov    0x8(%ebp),%eax
c010a10a:	05 00 10 00 00       	add    $0x1000,%eax
c010a10f:	89 c2                	mov    %eax,%edx
c010a111:	8b 45 08             	mov    0x8(%ebp),%eax
c010a114:	89 50 04             	mov    %edx,0x4(%eax)
c010a117:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a11a:	83 c0 2c             	add    $0x2c,%eax
c010a11d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a120:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a123:	83 e8 04             	sub    $0x4,%eax
c010a126:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a129:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a12c:	83 e8 08             	sub    $0x8,%eax
c010a12f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a132:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a135:	83 e8 0c             	sub    $0xc,%eax
c010a138:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a13b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a13e:	83 e8 10             	sub    $0x10,%eax
c010a141:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010a144:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a147:	83 e8 14             	sub    $0x14,%eax
c010a14a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010a14d:	ba 00 03 10 c0       	mov    $0xc0100300,%edx
c010a152:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a155:	89 10                	mov    %edx,(%eax)
c010a157:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010a15a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a160:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010a163:	8b 10                	mov    (%eax),%edx
c010a165:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010a168:	89 10                	mov    %edx,(%eax)
c010a16a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010a16d:	8b 10                	mov    (%eax),%edx
c010a16f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010a172:	89 10                	mov    %edx,(%eax)
c010a174:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010a177:	8b 10                	mov    (%eax),%edx
c010a179:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a17c:	89 10                	mov    %edx,(%eax)
c010a17e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a181:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a187:	8b 45 08             	mov    0x8(%ebp),%eax
c010a18a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010a18d:	89 10                	mov    %edx,(%eax)
c010a18f:	83 ec 0c             	sub    $0xc,%esp
c010a192:	ff 75 f0             	pushl  -0x10(%ebp)
c010a195:	e8 47 ce ff ff       	call   c0106fe1 <intr_set_status>
c010a19a:	83 c4 10             	add    $0x10,%esp
c010a19d:	90                   	nop
c010a19e:	c9                   	leave  
c010a19f:	c3                   	ret    

c010a1a0 <fork_process>:
c010a1a0:	55                   	push   %ebp
c010a1a1:	89 e5                	mov    %esp,%ebp
c010a1a3:	83 ec 18             	sub    $0x18,%esp
c010a1a6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1a9:	83 ec 0c             	sub    $0xc,%esp
c010a1ac:	50                   	push   %eax
c010a1ad:	e8 b4 99 ff ff       	call   c0103b66 <pid2proc>
c010a1b2:	83 c4 10             	add    $0x10,%esp
c010a1b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a1b8:	83 ec 0c             	sub    $0xc,%esp
c010a1bb:	ff 75 f4             	pushl  -0xc(%ebp)
c010a1be:	e8 75 fc ff ff       	call   c0109e38 <clone_pcb>
c010a1c3:	83 c4 10             	add    $0x10,%esp
c010a1c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a1c9:	83 ec 08             	sub    $0x8,%esp
c010a1cc:	6a 00                	push   $0x0
c010a1ce:	6a 01                	push   $0x1
c010a1d0:	e8 12 c3 ff ff       	call   c01064e7 <alloc_memory>
c010a1d5:	83 c4 10             	add    $0x10,%esp
c010a1d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a1db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a1de:	83 ec 04             	sub    $0x4,%esp
c010a1e1:	68 00 10 00 00       	push   $0x1000
c010a1e6:	6a 00                	push   $0x0
c010a1e8:	50                   	push   %eax
c010a1e9:	e8 61 20 00 00       	call   c010c24f <Memset>
c010a1ee:	83 c4 10             	add    $0x10,%esp
c010a1f1:	83 ec 04             	sub    $0x4,%esp
c010a1f4:	ff 75 ec             	pushl  -0x14(%ebp)
c010a1f7:	ff 75 f0             	pushl  -0x10(%ebp)
c010a1fa:	ff 75 f4             	pushl  -0xc(%ebp)
c010a1fd:	e8 a8 fd ff ff       	call   c0109faa <build_body_stack>
c010a202:	83 c4 10             	add    $0x10,%esp
c010a205:	83 ec 0c             	sub    $0xc,%esp
c010a208:	ff 75 f0             	pushl  -0x10(%ebp)
c010a20b:	e8 cd fe ff ff       	call   c010a0dd <build_process_kernel_stack>
c010a210:	83 c4 10             	add    $0x10,%esp
c010a213:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a216:	05 6a 02 00 00       	add    $0x26a,%eax
c010a21b:	83 ec 08             	sub    $0x8,%esp
c010a21e:	50                   	push   %eax
c010a21f:	68 04 0f 11 c0       	push   $0xc0110f04
c010a224:	e8 c7 02 00 00       	call   c010a4f0 <appendToDoubleLinkList>
c010a229:	83 c4 10             	add    $0x10,%esp
c010a22c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a22f:	c9                   	leave  
c010a230:	c3                   	ret    

c010a231 <process_execute>:
c010a231:	55                   	push   %ebp
c010a232:	89 e5                	mov    %esp,%ebp
c010a234:	83 ec 28             	sub    $0x28,%esp
c010a237:	e8 ca 04 00 00       	call   c010a706 <thread_init>
c010a23c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a23f:	83 ec 0c             	sub    $0xc,%esp
c010a242:	ff 75 f4             	pushl  -0xc(%ebp)
c010a245:	e8 69 05 00 00       	call   c010a7b3 <thread_create>
c010a24a:	83 c4 10             	add    $0x10,%esp
c010a24d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a250:	05 28 01 00 00       	add    $0x128,%eax
c010a255:	83 ec 08             	sub    $0x8,%esp
c010a258:	ff 75 10             	pushl  0x10(%ebp)
c010a25b:	50                   	push   %eax
c010a25c:	e8 0d 20 00 00       	call   c010c26e <Strcpy>
c010a261:	83 c4 10             	add    $0x10,%esp
c010a264:	83 ec 08             	sub    $0x8,%esp
c010a267:	6a 00                	push   $0x0
c010a269:	6a 01                	push   $0x1
c010a26b:	e8 77 c2 ff ff       	call   c01064e7 <alloc_memory>
c010a270:	83 c4 10             	add    $0x10,%esp
c010a273:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a276:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a279:	05 00 0c 00 00       	add    $0xc00,%eax
c010a27e:	83 ec 04             	sub    $0x4,%esp
c010a281:	68 00 04 00 00       	push   $0x400
c010a286:	68 00 fc ff ff       	push   $0xfffffc00
c010a28b:	50                   	push   %eax
c010a28c:	e8 8b cd ff ff       	call   c010701c <Memcpy>
c010a291:	83 c4 10             	add    $0x10,%esp
c010a294:	83 ec 0c             	sub    $0xc,%esp
c010a297:	ff 75 f0             	pushl  -0x10(%ebp)
c010a29a:	e8 5f c0 ff ff       	call   c01062fe <get_physical_address>
c010a29f:	83 c4 10             	add    $0x10,%esp
c010a2a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a2a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2a8:	05 fc 0f 00 00       	add    $0xffc,%eax
c010a2ad:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a2b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a2b3:	83 c8 07             	or     $0x7,%eax
c010a2b6:	89 c2                	mov    %eax,%edx
c010a2b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a2bb:	89 10                	mov    %edx,(%eax)
c010a2bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2c0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010a2c3:	89 50 08             	mov    %edx,0x8(%eax)
c010a2c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2c9:	83 c0 10             	add    $0x10,%eax
c010a2cc:	83 ec 0c             	sub    $0xc,%esp
c010a2cf:	50                   	push   %eax
c010a2d0:	e8 c8 c7 ff ff       	call   c0106a9d <init_memory_block_desc>
c010a2d5:	83 c4 10             	add    $0x10,%esp
c010a2d8:	e8 9e f9 ff ff       	call   c0109c7b <create_user_process_address_space>
c010a2dd:	89 c2                	mov    %eax,%edx
c010a2df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2e2:	89 50 0c             	mov    %edx,0xc(%eax)
c010a2e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2e8:	8b 00                	mov    (%eax),%eax
c010a2ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a2ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a2f0:	c7 40 10 0b 9d 10 c0 	movl   $0xc0109d0b,0x10(%eax)
c010a2f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a2fa:	8b 55 08             	mov    0x8(%ebp),%edx
c010a2fd:	89 50 18             	mov    %edx,0x18(%eax)
c010a300:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a303:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a306:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a309:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a30c:	8b 55 14             	mov    0x14(%ebp),%edx
c010a30f:	89 50 20             	mov    %edx,0x20(%eax)
c010a312:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a315:	8b 55 18             	mov    0x18(%ebp),%edx
c010a318:	89 50 24             	mov    %edx,0x24(%eax)
c010a31b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010a31e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a321:	89 50 28             	mov    %edx,0x28(%eax)
c010a324:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a327:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a32d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a330:	8b 10                	mov    (%eax),%edx
c010a332:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a335:	89 50 04             	mov    %edx,0x4(%eax)
c010a338:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a33b:	8b 50 04             	mov    0x4(%eax),%edx
c010a33e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a341:	89 50 08             	mov    %edx,0x8(%eax)
c010a344:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a347:	8b 50 08             	mov    0x8(%eax),%edx
c010a34a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a34d:	89 50 0c             	mov    %edx,0xc(%eax)
c010a350:	83 ec 0c             	sub    $0xc,%esp
c010a353:	68 ec fd 10 c0       	push   $0xc010fdec
c010a358:	e8 96 00 00 00       	call   c010a3f3 <isListEmpty>
c010a35d:	83 c4 10             	add    $0x10,%esp
c010a360:	e8 53 cc ff ff       	call   c0106fb8 <intr_disable>
c010a365:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a368:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a36b:	05 60 02 00 00       	add    $0x260,%eax
c010a370:	83 ec 08             	sub    $0x8,%esp
c010a373:	50                   	push   %eax
c010a374:	68 ec fd 10 c0       	push   $0xc010fdec
c010a379:	e8 72 01 00 00       	call   c010a4f0 <appendToDoubleLinkList>
c010a37e:	83 c4 10             	add    $0x10,%esp
c010a381:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a384:	05 6a 02 00 00       	add    $0x26a,%eax
c010a389:	83 ec 08             	sub    $0x8,%esp
c010a38c:	50                   	push   %eax
c010a38d:	68 04 0f 11 c0       	push   $0xc0110f04
c010a392:	e8 59 01 00 00       	call   c010a4f0 <appendToDoubleLinkList>
c010a397:	83 c4 10             	add    $0x10,%esp
c010a39a:	83 ec 0c             	sub    $0xc,%esp
c010a39d:	ff 75 e0             	pushl  -0x20(%ebp)
c010a3a0:	e8 3c cc ff ff       	call   c0106fe1 <intr_set_status>
c010a3a5:	83 c4 10             	add    $0x10,%esp
c010a3a8:	90                   	nop
c010a3a9:	c9                   	leave  
c010a3aa:	c3                   	ret    
c010a3ab:	66 90                	xchg   %ax,%ax
c010a3ad:	66 90                	xchg   %ax,%ax
c010a3af:	90                   	nop

c010a3b0 <switch_to>:
c010a3b0:	56                   	push   %esi
c010a3b1:	57                   	push   %edi
c010a3b2:	53                   	push   %ebx
c010a3b3:	55                   	push   %ebp
c010a3b4:	89 e5                	mov    %esp,%ebp
c010a3b6:	8b 45 14             	mov    0x14(%ebp),%eax
c010a3b9:	89 20                	mov    %esp,(%eax)
c010a3bb:	8b 45 18             	mov    0x18(%ebp),%eax
c010a3be:	8b 20                	mov    (%eax),%esp
c010a3c0:	5d                   	pop    %ebp
c010a3c1:	5b                   	pop    %ebx
c010a3c2:	5f                   	pop    %edi
c010a3c3:	5e                   	pop    %esi
c010a3c4:	c3                   	ret    

c010a3c5 <initDoubleLinkList>:
c010a3c5:	55                   	push   %ebp
c010a3c6:	89 e5                	mov    %esp,%ebp
c010a3c8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3cb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a3d1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3d4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a3db:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3de:	8d 50 08             	lea    0x8(%eax),%edx
c010a3e1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3e4:	89 50 04             	mov    %edx,0x4(%eax)
c010a3e7:	8b 55 08             	mov    0x8(%ebp),%edx
c010a3ea:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3ed:	89 50 08             	mov    %edx,0x8(%eax)
c010a3f0:	90                   	nop
c010a3f1:	5d                   	pop    %ebp
c010a3f2:	c3                   	ret    

c010a3f3 <isListEmpty>:
c010a3f3:	55                   	push   %ebp
c010a3f4:	89 e5                	mov    %esp,%ebp
c010a3f6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3f9:	8b 40 04             	mov    0x4(%eax),%eax
c010a3fc:	8b 55 08             	mov    0x8(%ebp),%edx
c010a3ff:	83 c2 08             	add    $0x8,%edx
c010a402:	39 d0                	cmp    %edx,%eax
c010a404:	75 07                	jne    c010a40d <isListEmpty+0x1a>
c010a406:	b8 01 00 00 00       	mov    $0x1,%eax
c010a40b:	eb 05                	jmp    c010a412 <isListEmpty+0x1f>
c010a40d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a412:	5d                   	pop    %ebp
c010a413:	c3                   	ret    

c010a414 <findElementInList>:
c010a414:	55                   	push   %ebp
c010a415:	89 e5                	mov    %esp,%ebp
c010a417:	83 ec 28             	sub    $0x28,%esp
c010a41a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a41e:	75 19                	jne    c010a439 <findElementInList+0x25>
c010a420:	6a 60                	push   $0x60
c010a422:	68 f5 c1 10 c0       	push   $0xc010c1f5
c010a427:	68 f5 c1 10 c0       	push   $0xc010c1f5
c010a42c:	68 08 c2 10 c0       	push   $0xc010c208
c010a431:	e8 ff e7 ff ff       	call   c0108c35 <assertion_failure>
c010a436:	83 c4 10             	add    $0x10,%esp
c010a439:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a43d:	75 19                	jne    c010a458 <findElementInList+0x44>
c010a43f:	6a 61                	push   $0x61
c010a441:	68 f5 c1 10 c0       	push   $0xc010c1f5
c010a446:	68 f5 c1 10 c0       	push   $0xc010c1f5
c010a44b:	68 14 c2 10 c0       	push   $0xc010c214
c010a450:	e8 e0 e7 ff ff       	call   c0108c35 <assertion_failure>
c010a455:	83 c4 10             	add    $0x10,%esp
c010a458:	e8 5b cb ff ff       	call   c0106fb8 <intr_disable>
c010a45d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a460:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a467:	8b 45 08             	mov    0x8(%ebp),%eax
c010a46a:	8b 40 08             	mov    0x8(%eax),%eax
c010a46d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a470:	8b 45 08             	mov    0x8(%ebp),%eax
c010a473:	8b 40 04             	mov    0x4(%eax),%eax
c010a476:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a479:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a47d:	75 07                	jne    c010a486 <findElementInList+0x72>
c010a47f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a484:	eb 68                	jmp    c010a4ee <findElementInList+0xda>
c010a486:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a489:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a48c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a48f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a492:	c1 f8 03             	sar    $0x3,%eax
c010a495:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a498:	eb 36                	jmp    c010a4d0 <findElementInList+0xbc>
c010a49a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a49d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a4a0:	75 07                	jne    c010a4a9 <findElementInList+0x95>
c010a4a2:	b8 01 00 00 00       	mov    $0x1,%eax
c010a4a7:	eb 45                	jmp    c010a4ee <findElementInList+0xda>
c010a4a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a4ad:	75 07                	jne    c010a4b6 <findElementInList+0xa2>
c010a4af:	b8 00 00 00 00       	mov    $0x0,%eax
c010a4b4:	eb 38                	jmp    c010a4ee <findElementInList+0xda>
c010a4b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4b9:	8b 40 04             	mov    0x4(%eax),%eax
c010a4bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a4bf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a4c3:	75 07                	jne    c010a4cc <findElementInList+0xb8>
c010a4c5:	b8 00 00 00 00       	mov    $0x0,%eax
c010a4ca:	eb 22                	jmp    c010a4ee <findElementInList+0xda>
c010a4cc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a4d0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4d3:	83 c0 08             	add    $0x8,%eax
c010a4d6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a4d9:	75 bf                	jne    c010a49a <findElementInList+0x86>
c010a4db:	83 ec 0c             	sub    $0xc,%esp
c010a4de:	ff 75 ec             	pushl  -0x14(%ebp)
c010a4e1:	e8 fb ca ff ff       	call   c0106fe1 <intr_set_status>
c010a4e6:	83 c4 10             	add    $0x10,%esp
c010a4e9:	b8 00 00 00 00       	mov    $0x0,%eax
c010a4ee:	c9                   	leave  
c010a4ef:	c3                   	ret    

c010a4f0 <appendToDoubleLinkList>:
c010a4f0:	55                   	push   %ebp
c010a4f1:	89 e5                	mov    %esp,%ebp
c010a4f3:	83 ec 18             	sub    $0x18,%esp
c010a4f6:	83 ec 08             	sub    $0x8,%esp
c010a4f9:	ff 75 0c             	pushl  0xc(%ebp)
c010a4fc:	ff 75 08             	pushl  0x8(%ebp)
c010a4ff:	e8 10 ff ff ff       	call   c010a414 <findElementInList>
c010a504:	83 c4 10             	add    $0x10,%esp
c010a507:	3c 01                	cmp    $0x1,%al
c010a509:	0f 84 c2 00 00 00    	je     c010a5d1 <appendToDoubleLinkList+0xe1>
c010a50f:	e8 a4 ca ff ff       	call   c0106fb8 <intr_disable>
c010a514:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a517:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a51b:	75 1c                	jne    c010a539 <appendToDoubleLinkList+0x49>
c010a51d:	68 9e 00 00 00       	push   $0x9e
c010a522:	68 f5 c1 10 c0       	push   $0xc010c1f5
c010a527:	68 f5 c1 10 c0       	push   $0xc010c1f5
c010a52c:	68 08 c2 10 c0       	push   $0xc010c208
c010a531:	e8 ff e6 ff ff       	call   c0108c35 <assertion_failure>
c010a536:	83 c4 10             	add    $0x10,%esp
c010a539:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a53d:	75 1c                	jne    c010a55b <appendToDoubleLinkList+0x6b>
c010a53f:	68 9f 00 00 00       	push   $0x9f
c010a544:	68 f5 c1 10 c0       	push   $0xc010c1f5
c010a549:	68 f5 c1 10 c0       	push   $0xc010c1f5
c010a54e:	68 14 c2 10 c0       	push   $0xc010c214
c010a553:	e8 dd e6 ff ff       	call   c0108c35 <assertion_failure>
c010a558:	83 c4 10             	add    $0x10,%esp
c010a55b:	83 ec 08             	sub    $0x8,%esp
c010a55e:	ff 75 0c             	pushl  0xc(%ebp)
c010a561:	ff 75 08             	pushl  0x8(%ebp)
c010a564:	e8 ab fe ff ff       	call   c010a414 <findElementInList>
c010a569:	83 c4 10             	add    $0x10,%esp
c010a56c:	3c 01                	cmp    $0x1,%al
c010a56e:	74 64                	je     c010a5d4 <appendToDoubleLinkList+0xe4>
c010a570:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a573:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a576:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a579:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a580:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a583:	8b 50 04             	mov    0x4(%eax),%edx
c010a586:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a589:	89 10                	mov    %edx,(%eax)
c010a58b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a58e:	8b 50 08             	mov    0x8(%eax),%edx
c010a591:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a594:	89 10                	mov    %edx,(%eax)
c010a596:	8b 45 08             	mov    0x8(%ebp),%eax
c010a599:	8b 40 08             	mov    0x8(%eax),%eax
c010a59c:	85 c0                	test   %eax,%eax
c010a59e:	74 0c                	je     c010a5ac <appendToDoubleLinkList+0xbc>
c010a5a0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5a3:	8b 40 08             	mov    0x8(%eax),%eax
c010a5a6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a5a9:	89 50 04             	mov    %edx,0x4(%eax)
c010a5ac:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5af:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a5b2:	89 50 08             	mov    %edx,0x8(%eax)
c010a5b5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5b8:	8d 50 08             	lea    0x8(%eax),%edx
c010a5bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5be:	89 50 04             	mov    %edx,0x4(%eax)
c010a5c1:	83 ec 0c             	sub    $0xc,%esp
c010a5c4:	ff 75 f4             	pushl  -0xc(%ebp)
c010a5c7:	e8 15 ca ff ff       	call   c0106fe1 <intr_set_status>
c010a5cc:	83 c4 10             	add    $0x10,%esp
c010a5cf:	eb 04                	jmp    c010a5d5 <appendToDoubleLinkList+0xe5>
c010a5d1:	90                   	nop
c010a5d2:	eb 01                	jmp    c010a5d5 <appendToDoubleLinkList+0xe5>
c010a5d4:	90                   	nop
c010a5d5:	c9                   	leave  
c010a5d6:	c3                   	ret    

c010a5d7 <insertToDoubleLinkList>:
c010a5d7:	55                   	push   %ebp
c010a5d8:	89 e5                	mov    %esp,%ebp
c010a5da:	83 ec 18             	sub    $0x18,%esp
c010a5dd:	83 ec 08             	sub    $0x8,%esp
c010a5e0:	ff 75 0c             	pushl  0xc(%ebp)
c010a5e3:	ff 75 08             	pushl  0x8(%ebp)
c010a5e6:	e8 29 fe ff ff       	call   c010a414 <findElementInList>
c010a5eb:	83 c4 10             	add    $0x10,%esp
c010a5ee:	3c 01                	cmp    $0x1,%al
c010a5f0:	74 65                	je     c010a657 <insertToDoubleLinkList+0x80>
c010a5f2:	e8 c1 c9 ff ff       	call   c0106fb8 <intr_disable>
c010a5f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a5fa:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a5fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a600:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a603:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a60a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a60d:	8b 50 04             	mov    0x4(%eax),%edx
c010a610:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a613:	89 10                	mov    %edx,(%eax)
c010a615:	8b 45 08             	mov    0x8(%ebp),%eax
c010a618:	8b 50 04             	mov    0x4(%eax),%edx
c010a61b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a61e:	89 50 04             	mov    %edx,0x4(%eax)
c010a621:	8b 45 08             	mov    0x8(%ebp),%eax
c010a624:	8b 40 04             	mov    0x4(%eax),%eax
c010a627:	85 c0                	test   %eax,%eax
c010a629:	74 0b                	je     c010a636 <insertToDoubleLinkList+0x5f>
c010a62b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a62e:	8b 40 04             	mov    0x4(%eax),%eax
c010a631:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a634:	89 10                	mov    %edx,(%eax)
c010a636:	8b 45 08             	mov    0x8(%ebp),%eax
c010a639:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a63c:	89 50 04             	mov    %edx,0x4(%eax)
c010a63f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a642:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a645:	89 10                	mov    %edx,(%eax)
c010a647:	83 ec 0c             	sub    $0xc,%esp
c010a64a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a64d:	e8 8f c9 ff ff       	call   c0106fe1 <intr_set_status>
c010a652:	83 c4 10             	add    $0x10,%esp
c010a655:	eb 01                	jmp    c010a658 <insertToDoubleLinkList+0x81>
c010a657:	90                   	nop
c010a658:	c9                   	leave  
c010a659:	c3                   	ret    

c010a65a <popFromDoubleLinkList>:
c010a65a:	55                   	push   %ebp
c010a65b:	89 e5                	mov    %esp,%ebp
c010a65d:	83 ec 18             	sub    $0x18,%esp
c010a660:	e8 53 c9 ff ff       	call   c0106fb8 <intr_disable>
c010a665:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a668:	83 ec 0c             	sub    $0xc,%esp
c010a66b:	ff 75 08             	pushl  0x8(%ebp)
c010a66e:	e8 80 fd ff ff       	call   c010a3f3 <isListEmpty>
c010a673:	83 c4 10             	add    $0x10,%esp
c010a676:	3c 01                	cmp    $0x1,%al
c010a678:	75 07                	jne    c010a681 <popFromDoubleLinkList+0x27>
c010a67a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a67f:	eb 6b                	jmp    c010a6ec <popFromDoubleLinkList+0x92>
c010a681:	8b 45 08             	mov    0x8(%ebp),%eax
c010a684:	8b 40 08             	mov    0x8(%eax),%eax
c010a687:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a68a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a68d:	8b 40 08             	mov    0x8(%eax),%eax
c010a690:	85 c0                	test   %eax,%eax
c010a692:	75 07                	jne    c010a69b <popFromDoubleLinkList+0x41>
c010a694:	b8 00 00 00 00       	mov    $0x0,%eax
c010a699:	eb 51                	jmp    c010a6ec <popFromDoubleLinkList+0x92>
c010a69b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a69e:	8b 40 08             	mov    0x8(%eax),%eax
c010a6a1:	8b 00                	mov    (%eax),%eax
c010a6a3:	85 c0                	test   %eax,%eax
c010a6a5:	74 11                	je     c010a6b8 <popFromDoubleLinkList+0x5e>
c010a6a7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a6aa:	8b 40 08             	mov    0x8(%eax),%eax
c010a6ad:	8b 00                	mov    (%eax),%eax
c010a6af:	8b 55 08             	mov    0x8(%ebp),%edx
c010a6b2:	83 c2 08             	add    $0x8,%edx
c010a6b5:	89 50 04             	mov    %edx,0x4(%eax)
c010a6b8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a6bb:	8b 40 08             	mov    0x8(%eax),%eax
c010a6be:	8b 10                	mov    (%eax),%edx
c010a6c0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a6c3:	89 50 08             	mov    %edx,0x8(%eax)
c010a6c6:	83 ec 0c             	sub    $0xc,%esp
c010a6c9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a6cc:	e8 10 c9 ff ff       	call   c0106fe1 <intr_set_status>
c010a6d1:	83 c4 10             	add    $0x10,%esp
c010a6d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6d7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a6de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6e1:	8b 50 04             	mov    0x4(%eax),%edx
c010a6e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6e7:	89 10                	mov    %edx,(%eax)
c010a6e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6ec:	c9                   	leave  
c010a6ed:	c3                   	ret    

c010a6ee <kernel_thread>:
c010a6ee:	55                   	push   %ebp
c010a6ef:	89 e5                	mov    %esp,%ebp
c010a6f1:	83 ec 08             	sub    $0x8,%esp
c010a6f4:	fb                   	sti    
c010a6f5:	83 ec 0c             	sub    $0xc,%esp
c010a6f8:	ff 75 0c             	pushl  0xc(%ebp)
c010a6fb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a6fe:	ff d0                	call   *%eax
c010a700:	83 c4 10             	add    $0x10,%esp
c010a703:	90                   	nop
c010a704:	c9                   	leave  
c010a705:	c3                   	ret    

c010a706 <thread_init>:
c010a706:	55                   	push   %ebp
c010a707:	89 e5                	mov    %esp,%ebp
c010a709:	83 ec 18             	sub    $0x18,%esp
c010a70c:	83 ec 08             	sub    $0x8,%esp
c010a70f:	6a 00                	push   $0x0
c010a711:	6a 01                	push   $0x1
c010a713:	e8 cf bd ff ff       	call   c01064e7 <alloc_memory>
c010a718:	83 c4 10             	add    $0x10,%esp
c010a71b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a71e:	83 ec 04             	sub    $0x4,%esp
c010a721:	68 00 10 00 00       	push   $0x1000
c010a726:	6a 00                	push   $0x0
c010a728:	ff 75 f4             	pushl  -0xc(%ebp)
c010a72b:	e8 1f 1b 00 00       	call   c010c24f <Memset>
c010a730:	83 c4 10             	add    $0x10,%esp
c010a733:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a736:	05 00 10 00 00       	add    $0x1000,%eax
c010a73b:	89 c2                	mov    %eax,%edx
c010a73d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a740:	89 10                	mov    %edx,(%eax)
c010a742:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a745:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a74c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a74f:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a756:	ff ff ff 
c010a759:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a75c:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a763:	00 00 00 
c010a766:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a769:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a76f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a772:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a778:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a77d:	83 c0 01             	add    $0x1,%eax
c010a780:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a785:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a78b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a78e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a794:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a797:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a79e:	00 00 00 
c010a7a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a7a4:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a7ab:	cd ab 99 
c010a7ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a7b1:	c9                   	leave  
c010a7b2:	c3                   	ret    

c010a7b3 <thread_create>:
c010a7b3:	55                   	push   %ebp
c010a7b4:	89 e5                	mov    %esp,%ebp
c010a7b6:	83 ec 10             	sub    $0x10,%esp
c010a7b9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a7c0:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a7c7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a7ca:	8b 00                	mov    (%eax),%eax
c010a7cc:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a7cf:	89 c2                	mov    %eax,%edx
c010a7d1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a7d4:	89 10                	mov    %edx,(%eax)
c010a7d6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a7d9:	8b 00                	mov    (%eax),%eax
c010a7db:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a7de:	89 c2                	mov    %eax,%edx
c010a7e0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a7e3:	89 10                	mov    %edx,(%eax)
c010a7e5:	90                   	nop
c010a7e6:	c9                   	leave  
c010a7e7:	c3                   	ret    

c010a7e8 <thread_start>:
c010a7e8:	55                   	push   %ebp
c010a7e9:	89 e5                	mov    %esp,%ebp
c010a7eb:	83 ec 18             	sub    $0x18,%esp
c010a7ee:	e8 13 ff ff ff       	call   c010a706 <thread_init>
c010a7f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a7f6:	83 ec 0c             	sub    $0xc,%esp
c010a7f9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a7fc:	e8 b2 ff ff ff       	call   c010a7b3 <thread_create>
c010a801:	83 c4 10             	add    $0x10,%esp
c010a804:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a807:	05 28 01 00 00       	add    $0x128,%eax
c010a80c:	83 ec 08             	sub    $0x8,%esp
c010a80f:	ff 75 10             	pushl  0x10(%ebp)
c010a812:	50                   	push   %eax
c010a813:	e8 56 1a 00 00       	call   c010c26e <Strcpy>
c010a818:	83 c4 10             	add    $0x10,%esp
c010a81b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a81e:	8b 00                	mov    (%eax),%eax
c010a820:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a823:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a826:	c7 40 10 ee a6 10 c0 	movl   $0xc010a6ee,0x10(%eax)
c010a82d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a830:	8b 55 08             	mov    0x8(%ebp),%edx
c010a833:	89 50 18             	mov    %edx,0x18(%eax)
c010a836:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a839:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a83c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a83f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a842:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a848:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a84b:	8b 10                	mov    (%eax),%edx
c010a84d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a850:	89 50 04             	mov    %edx,0x4(%eax)
c010a853:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a856:	8b 50 04             	mov    0x4(%eax),%edx
c010a859:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a85c:	89 50 08             	mov    %edx,0x8(%eax)
c010a85f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a862:	8b 50 08             	mov    0x8(%eax),%edx
c010a865:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a868:	89 50 0c             	mov    %edx,0xc(%eax)
c010a86b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a86e:	05 60 02 00 00       	add    $0x260,%eax
c010a873:	83 ec 08             	sub    $0x8,%esp
c010a876:	50                   	push   %eax
c010a877:	68 ec fd 10 c0       	push   $0xc010fdec
c010a87c:	e8 6f fc ff ff       	call   c010a4f0 <appendToDoubleLinkList>
c010a881:	83 c4 10             	add    $0x10,%esp
c010a884:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a887:	05 6a 02 00 00       	add    $0x26a,%eax
c010a88c:	83 ec 08             	sub    $0x8,%esp
c010a88f:	50                   	push   %eax
c010a890:	68 04 0f 11 c0       	push   $0xc0110f04
c010a895:	e8 56 fc ff ff       	call   c010a4f0 <appendToDoubleLinkList>
c010a89a:	83 c4 10             	add    $0x10,%esp
c010a89d:	90                   	nop
c010a89e:	c9                   	leave  
c010a89f:	c3                   	ret    

c010a8a0 <Buf>:
	...

c010a8b6 <My_Buf>:
c010a8b6:	48                   	dec    %eax
c010a8b7:	65 6c                	gs insb (%dx),%es:(%edi)
c010a8b9:	6c                   	insb   (%dx),%es:(%edi)
c010a8ba:	6f                   	outsl  %ds:(%esi),(%dx)
c010a8bb:	2c 57                	sub    $0x57,%al
c010a8bd:	6f                   	outsl  %ds:(%esi),(%dx)
c010a8be:	72 6c                	jb     c010a92c <DriverInitialize+0x69>
c010a8c0:	64 5c                	fs pop %esp
c010a8c2:	30                   	.byte 0x30

c010a8c3 <DriverInitialize>:
c010a8c3:	56                   	push   %esi
c010a8c4:	57                   	push   %edi
c010a8c5:	53                   	push   %ebx
c010a8c6:	55                   	push   %ebp
c010a8c7:	51                   	push   %ecx
c010a8c8:	89 e5                	mov    %esp,%ebp
c010a8ca:	b0 21                	mov    $0x21,%al
c010a8cc:	66 ba 00 03          	mov    $0x300,%dx
c010a8d0:	ee                   	out    %al,(%dx)
c010a8d1:	b0 59                	mov    $0x59,%al
c010a8d3:	66 ba 0e 03          	mov    $0x30e,%dx
c010a8d7:	ee                   	out    %al,(%dx)
c010a8d8:	66 ba 0a 03          	mov    $0x30a,%dx
c010a8dc:	66 31 c0             	xor    %ax,%ax
c010a8df:	b0 00                	mov    $0x0,%al
c010a8e1:	ee                   	out    %al,(%dx)
c010a8e2:	66 ba 0b 03          	mov    $0x30b,%dx
c010a8e6:	b0 01                	mov    $0x1,%al
c010a8e8:	ee                   	out    %al,(%dx)
c010a8e9:	b0 10                	mov    $0x10,%al
c010a8eb:	66 ba 0c 03          	mov    $0x30c,%dx
c010a8ef:	ee                   	out    %al,(%dx)
c010a8f0:	b0 20                	mov    $0x20,%al
c010a8f2:	66 ba 04 03          	mov    $0x304,%dx
c010a8f6:	ee                   	out    %al,(%dx)
c010a8f7:	b0 02                	mov    $0x2,%al
c010a8f9:	66 ba 0d 03          	mov    $0x30d,%dx
c010a8fd:	ee                   	out    %al,(%dx)
c010a8fe:	b0 40                	mov    $0x40,%al
c010a900:	66 ba 01 03          	mov    $0x301,%dx
c010a904:	ee                   	out    %al,(%dx)
c010a905:	66 ba 03 03          	mov    $0x303,%dx
c010a909:	ee                   	out    %al,(%dx)
c010a90a:	b0 60                	mov    $0x60,%al
c010a90c:	66 ba 02 03          	mov    $0x302,%dx
c010a910:	ee                   	out    %al,(%dx)
c010a911:	b0 61                	mov    $0x61,%al
c010a913:	66 ba 00 03          	mov    $0x300,%dx
c010a917:	ee                   	out    %al,(%dx)
c010a918:	b0 40                	mov    $0x40,%al
c010a91a:	66 ba 07 03          	mov    $0x307,%dx
c010a91e:	ee                   	out    %al,(%dx)
c010a91f:	b0 22                	mov    $0x22,%al
c010a921:	66 ba 00 03          	mov    $0x300,%dx
c010a925:	ee                   	out    %al,(%dx)
c010a926:	b0 ff                	mov    $0xff,%al
c010a928:	66 ba 07 03          	mov    $0x307,%dx
c010a92c:	ee                   	out    %al,(%dx)
c010a92d:	b0 fb                	mov    $0xfb,%al
c010a92f:	66 ba 0f 03          	mov    $0x30f,%dx
c010a933:	ee                   	out    %al,(%dx)
c010a934:	66 ba 0d 03          	mov    $0x30d,%dx
c010a938:	b0 00                	mov    $0x0,%al
c010a93a:	ee                   	out    %al,(%dx)
c010a93b:	68 00 40 00 00       	push   $0x4000
c010a940:	e8 08 00 00 00       	call   c010a94d <SetPageStart>
c010a945:	89 ec                	mov    %ebp,%esp
c010a947:	59                   	pop    %ecx
c010a948:	5d                   	pop    %ebp
c010a949:	5b                   	pop    %ebx
c010a94a:	5f                   	pop    %edi
c010a94b:	5e                   	pop    %esi
c010a94c:	c3                   	ret    

c010a94d <SetPageStart>:
c010a94d:	56                   	push   %esi
c010a94e:	57                   	push   %edi
c010a94f:	53                   	push   %ebx
c010a950:	55                   	push   %ebp
c010a951:	51                   	push   %ecx
c010a952:	89 e5                	mov    %esp,%ebp
c010a954:	66 ba 08 03          	mov    $0x308,%dx
c010a958:	66 31 c0             	xor    %ax,%ax
c010a95b:	66 8b 45 18          	mov    0x18(%ebp),%ax
c010a95f:	ee                   	out    %al,(%dx)
c010a960:	66 ba 09 03          	mov    $0x309,%dx
c010a964:	66 25 00 ff          	and    $0xff00,%ax
c010a968:	66 c1 e8 08          	shr    $0x8,%ax
c010a96c:	ee                   	out    %al,(%dx)
c010a96d:	89 ec                	mov    %ebp,%esp
c010a96f:	59                   	pop    %ecx
c010a970:	5d                   	pop    %ebp
c010a971:	5b                   	pop    %ebx
c010a972:	5f                   	pop    %edi
c010a973:	5e                   	pop    %esi
c010a974:	c3                   	ret    

c010a975 <DriverSend>:
c010a975:	56                   	push   %esi
c010a976:	57                   	push   %edi
c010a977:	53                   	push   %ebx
c010a978:	55                   	push   %ebp
c010a979:	51                   	push   %ecx
c010a97a:	89 e5                	mov    %esp,%ebp
c010a97c:	66 ba 00 03          	mov    $0x300,%dx
c010a980:	ec                   	in     (%dx),%al
c010a981:	3c 26                	cmp    $0x26,%al
c010a983:	74 54                	je     c010a9d9 <QueueIt>
c010a985:	66 51                	push   %cx
c010a987:	24 3f                	and    $0x3f,%al
c010a989:	ee                   	out    %al,(%dx)
c010a98a:	66 ba 08 03          	mov    $0x308,%dx
c010a98e:	66 31 c0             	xor    %ax,%ax
c010a991:	66 b8 00 40          	mov    $0x4000,%ax
c010a995:	ee                   	out    %al,(%dx)
c010a996:	66 ba 09 03          	mov    $0x309,%dx
c010a99a:	66 25 00 ff          	and    $0xff00,%ax
c010a99e:	66 c1 e8 08          	shr    $0x8,%ax
c010a9a2:	ee                   	out    %al,(%dx)
c010a9a3:	ff 75 18             	pushl  0x18(%ebp)
c010a9a6:	e8 3f 00 00 00       	call   c010a9ea <PCtoNIC>
c010a9ab:	83 c4 04             	add    $0x4,%esp
c010a9ae:	eb 2a                	jmp    c010a9da <Finished>
c010a9b0:	66 ba 04 03          	mov    $0x304,%dx
c010a9b4:	b0 40                	mov    $0x40,%al
c010a9b6:	66 b8 00 40          	mov    $0x4000,%ax
c010a9ba:	66 c1 e8 08          	shr    $0x8,%ax
c010a9be:	66 ef                	out    %ax,(%dx)
c010a9c0:	66 59                	pop    %cx
c010a9c2:	66 ba 05 03          	mov    $0x305,%dx
c010a9c6:	88 c8                	mov    %cl,%al
c010a9c8:	ee                   	out    %al,(%dx)
c010a9c9:	66 ba 06 03          	mov    $0x306,%dx
c010a9cd:	88 e8                	mov    %ch,%al
c010a9cf:	ee                   	out    %al,(%dx)
c010a9d0:	66 ba 00 03          	mov    $0x300,%dx
c010a9d4:	b0 26                	mov    $0x26,%al
c010a9d6:	ee                   	out    %al,(%dx)
c010a9d7:	eb 01                	jmp    c010a9da <Finished>

c010a9d9 <QueueIt>:
c010a9d9:	90                   	nop

c010a9da <Finished>:
c010a9da:	89 ec                	mov    %ebp,%esp
c010a9dc:	59                   	pop    %ecx
c010a9dd:	5d                   	pop    %ebp
c010a9de:	5b                   	pop    %ebx
c010a9df:	5f                   	pop    %edi
c010a9e0:	5e                   	pop    %esi
c010a9e1:	c3                   	ret    

c010a9e2 <MyEnd>:
c010a9e2:	89 ec                	mov    %ebp,%esp
c010a9e4:	59                   	pop    %ecx
c010a9e5:	5d                   	pop    %ebp
c010a9e6:	5b                   	pop    %ebx
c010a9e7:	5f                   	pop    %edi
c010a9e8:	5e                   	pop    %esi
c010a9e9:	c3                   	ret    

c010a9ea <PCtoNIC>:
c010a9ea:	56                   	push   %esi
c010a9eb:	57                   	push   %edi
c010a9ec:	53                   	push   %ebx
c010a9ed:	55                   	push   %ebp
c010a9ee:	51                   	push   %ecx
c010a9ef:	89 e5                	mov    %esp,%ebp
c010a9f1:	66 bb 20 00          	mov    $0x20,%bx
c010a9f5:	66 ba 0a 03          	mov    $0x30a,%dx
c010a9f9:	88 d8                	mov    %bl,%al
c010a9fb:	ee                   	out    %al,(%dx)
c010a9fc:	66 ba 0b 03          	mov    $0x30b,%dx
c010aa00:	88 f8                	mov    %bh,%al
c010aa02:	ee                   	out    %al,(%dx)
c010aa03:	66 ba 00 03          	mov    $0x300,%dx
c010aa07:	b0 12                	mov    $0x12,%al
c010aa09:	ee                   	out    %al,(%dx)
c010aa0a:	66 ba 10 03          	mov    $0x310,%dx
c010aa0e:	66 b9 20 00          	mov    $0x20,%cx
c010aa12:	66 d1 e9             	shr    %cx
c010aa15:	66 b8 59 00          	mov    $0x59,%ax
c010aa19:	31 f6                	xor    %esi,%esi
c010aa1b:	8b 74 24 18          	mov    0x18(%esp),%esi
c010aa1f:	68 00 40 00 00       	push   $0x4000
c010aa24:	e8 24 ff ff ff       	call   c010a94d <SetPageStart>
c010aa29:	83 c4 04             	add    $0x4,%esp
c010aa2c:	66 ba 10 03          	mov    $0x310,%dx

c010aa30 <Writing_Word>:
c010aa30:	66 31 c0             	xor    %ax,%ax
c010aa33:	66 ad                	lods   %ds:(%esi),%ax
c010aa35:	66 ef                	out    %ax,(%dx)
c010aa37:	e2 f7                	loop   c010aa30 <Writing_Word>
c010aa39:	66 b9 00 00          	mov    $0x0,%cx
c010aa3d:	66 ba 07 03          	mov    $0x307,%dx

c010aa41 <CheckDMA>:
c010aa41:	ec                   	in     (%dx),%al
c010aa42:	a8 40                	test   $0x40,%al
c010aa44:	75 02                	jne    c010aa48 <toNICEND>
c010aa46:	eb f9                	jmp    c010aa41 <CheckDMA>

c010aa48 <toNICEND>:
c010aa48:	66 ba 07 03          	mov    $0x307,%dx
c010aa4c:	b0 0f                	mov    $0xf,%al
c010aa4e:	ee                   	out    %al,(%dx)
c010aa4f:	f8                   	clc    
c010aa50:	89 ec                	mov    %ebp,%esp
c010aa52:	59                   	pop    %ecx
c010aa53:	5d                   	pop    %ebp
c010aa54:	5b                   	pop    %ebx
c010aa55:	5f                   	pop    %edi
c010aa56:	5e                   	pop    %esi
c010aa57:	c3                   	ret    

c010aa58 <get_interrupt_status>:
c010aa58:	56                   	push   %esi
c010aa59:	57                   	push   %edi
c010aa5a:	53                   	push   %ebx
c010aa5b:	55                   	push   %ebp
c010aa5c:	51                   	push   %ecx
c010aa5d:	89 e5                	mov    %esp,%ebp
c010aa5f:	66 ba 07 03          	mov    $0x307,%dx
c010aa63:	31 c0                	xor    %eax,%eax
c010aa65:	ec                   	in     (%dx),%al
c010aa66:	89 ec                	mov    %ebp,%esp
c010aa68:	59                   	pop    %ecx
c010aa69:	5d                   	pop    %ebp
c010aa6a:	5b                   	pop    %ebx
c010aa6b:	5f                   	pop    %edi
c010aa6c:	5e                   	pop    %esi
c010aa6d:	c3                   	ret    

c010aa6e <set_interrupt_status>:
c010aa6e:	56                   	push   %esi
c010aa6f:	57                   	push   %edi
c010aa70:	53                   	push   %ebx
c010aa71:	55                   	push   %ebp
c010aa72:	51                   	push   %ecx
c010aa73:	89 e5                	mov    %esp,%ebp
c010aa75:	66 ba 07 03          	mov    $0x307,%dx
c010aa79:	31 c0                	xor    %eax,%eax
c010aa7b:	8b 45 18             	mov    0x18(%ebp),%eax
c010aa7e:	ee                   	out    %al,(%dx)
c010aa7f:	89 ec                	mov    %ebp,%esp
c010aa81:	59                   	pop    %ecx
c010aa82:	5d                   	pop    %ebp
c010aa83:	5b                   	pop    %ebx
c010aa84:	5f                   	pop    %edi
c010aa85:	5e                   	pop    %esi
c010aa86:	c3                   	ret    

c010aa87 <get_curr_page>:
c010aa87:	56                   	push   %esi
c010aa88:	57                   	push   %edi
c010aa89:	53                   	push   %ebx
c010aa8a:	55                   	push   %ebp
c010aa8b:	51                   	push   %ecx
c010aa8c:	89 e5                	mov    %esp,%ebp
c010aa8e:	b0 61                	mov    $0x61,%al
c010aa90:	66 ba 00 03          	mov    $0x300,%dx
c010aa94:	ee                   	out    %al,(%dx)
c010aa95:	66 ba 07 03          	mov    $0x307,%dx
c010aa99:	31 c0                	xor    %eax,%eax
c010aa9b:	ec                   	in     (%dx),%al
c010aa9c:	89 ec                	mov    %ebp,%esp
c010aa9e:	59                   	pop    %ecx
c010aa9f:	5d                   	pop    %ebp
c010aaa0:	5b                   	pop    %ebx
c010aaa1:	5f                   	pop    %edi
c010aaa2:	5e                   	pop    %esi
c010aaa3:	c3                   	ret    

c010aaa4 <NICtoPC>:
c010aaa4:	56                   	push   %esi
c010aaa5:	57                   	push   %edi
c010aaa6:	53                   	push   %ebx
c010aaa7:	55                   	push   %ebp
c010aaa8:	51                   	push   %ecx
c010aaa9:	89 e5                	mov    %esp,%ebp
c010aaab:	66 bb 00 01          	mov    $0x100,%bx
c010aaaf:	66 ba 0a 03          	mov    $0x30a,%dx
c010aab3:	88 d8                	mov    %bl,%al
c010aab5:	ee                   	out    %al,(%dx)
c010aab6:	66 ba 0b 03          	mov    $0x30b,%dx
c010aaba:	88 f8                	mov    %bh,%al
c010aabc:	ee                   	out    %al,(%dx)
c010aabd:	66 ba 00 03          	mov    $0x300,%dx
c010aac1:	b0 0a                	mov    $0xa,%al
c010aac3:	ee                   	out    %al,(%dx)
c010aac4:	66 ba 10 03          	mov    $0x310,%dx
c010aac8:	66 ba 10 03          	mov    $0x310,%dx
c010aacc:	66 b9 00 01          	mov    $0x100,%cx
c010aad0:	66 d1 e9             	shr    %cx
c010aad3:	bf a0 a8 10 c0       	mov    $0xc010a8a0,%edi
c010aad8:	8b 7d 18             	mov    0x18(%ebp),%edi

c010aadb <READING_Word_NICtoPC>:
c010aadb:	31 c0                	xor    %eax,%eax
c010aadd:	66 ba 10 03          	mov    $0x310,%dx
c010aae1:	66 ed                	in     (%dx),%ax
c010aae3:	66 ab                	stos   %ax,%es:(%edi)
c010aae5:	e2 f4                	loop   c010aadb <READING_Word_NICtoPC>
c010aae7:	66 ba 07 03          	mov    $0x307,%dx

c010aaeb <CheckDMA_NICtoPC>:
c010aaeb:	ec                   	in     (%dx),%al
c010aaec:	a8 40                	test   $0x40,%al
c010aaee:	75 02                	jne    c010aaf2 <ReadEnd>
c010aaf0:	eb f9                	jmp    c010aaeb <CheckDMA_NICtoPC>

c010aaf2 <ReadEnd>:
c010aaf2:	ee                   	out    %al,(%dx)
c010aaf3:	b8 20 00 00 00       	mov    $0x20,%eax
c010aaf8:	89 ec                	mov    %ebp,%esp
c010aafa:	59                   	pop    %ecx
c010aafb:	5d                   	pop    %ebp
c010aafc:	5b                   	pop    %ebx
c010aafd:	5f                   	pop    %edi
c010aafe:	5e                   	pop    %esi
c010aaff:	c3                   	ret    
