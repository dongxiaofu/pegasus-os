
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
c0100025:	e8 21 3e 00 00       	call   c0103e4b <ReloadGDT>
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
c0100198:	e8 f3 72 00 00       	call   c0107490 <exception_handler>
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
c01001b5:	e8 d6 72 00 00       	call   c0107490 <exception_handler>
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
c01001e3:	e8 2d 38 00 00       	call   c0103a15 <clock_handler>
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
c0100216:	e8 85 47 00 00       	call   c01049a0 <keyboard_handler>
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
c010025c:	e8 41 12 00 00       	call   c01014a2 <hd_handler>
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
c01002a3:	e8 64 12 00 00       	call   c010150c <net_handler>
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
c010038e:	e8 97 6f 00 00       	call   c010732a <disp_int>
c0100393:	83 c4 04             	add    $0x4,%esp
c0100396:	58                   	pop    %eax
c0100397:	5a                   	pop    %edx
c0100398:	52                   	push   %edx
c0100399:	50                   	push   %eax
c010039a:	e8 8b 6f 00 00       	call   c010732a <disp_int>
c010039f:	58                   	pop    %eax
c01003a0:	5a                   	pop    %edx
c01003a1:	52                   	push   %edx
c01003a2:	50                   	push   %eax
c01003a3:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c01003a9:	e8 7c 6f 00 00       	call   c010732a <disp_int>
c01003ae:	83 c4 04             	add    $0x4,%esp
c01003b1:	58                   	pop    %eax
c01003b2:	5a                   	pop    %edx
c01003b3:	52                   	push   %edx
c01003b4:	50                   	push   %eax
c01003b5:	ff 72 ec             	pushl  -0x14(%edx)
c01003b8:	e8 6d 6f 00 00       	call   c010732a <disp_int>
c01003bd:	83 c4 04             	add    $0x4,%esp
c01003c0:	58                   	pop    %eax
c01003c1:	5a                   	pop    %edx
c01003c2:	52                   	push   %edx
c01003c3:	50                   	push   %eax
c01003c4:	ff 70 ec             	pushl  -0x14(%eax)
c01003c7:	e8 5e 6f 00 00       	call   c010732a <disp_int>
c01003cc:	83 c4 04             	add    $0x4,%esp
c01003cf:	58                   	pop    %eax
c01003d0:	5a                   	pop    %edx
c01003d1:	52                   	push   %edx
c01003d2:	50                   	push   %eax
c01003d3:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c01003d9:	e8 4c 6f 00 00       	call   c010732a <disp_int>
c01003de:	83 c4 04             	add    $0x4,%esp
c01003e1:	58                   	pop    %eax
c01003e2:	5a                   	pop    %edx
c01003e3:	52                   	push   %edx
c01003e4:	50                   	push   %eax
c01003e5:	68 60 f7 10 c0       	push   $0xc010f760
c01003ea:	e8 3b 6f 00 00       	call   c010732a <disp_int>
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
c01004b7:	e8 d2 bd 00 00       	call   c010c28e <Strcpy>
c01004bc:	83 c4 10             	add    $0x10,%esp
c01004bf:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004c4:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01004c9:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004ce:	05 60 02 00 00       	add    $0x260,%eax
c01004d3:	83 ec 08             	sub    $0x8,%esp
c01004d6:	50                   	push   %eax
c01004d7:	68 ec fd 10 c0       	push   $0xc010fdec
c01004dc:	e8 2f 9f 00 00       	call   c010a410 <appendToDoubleLinkList>
c01004e1:	83 c4 10             	add    $0x10,%esp
c01004e4:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004e9:	05 6a 02 00 00       	add    $0x26a,%eax
c01004ee:	83 ec 08             	sub    $0x8,%esp
c01004f1:	50                   	push   %eax
c01004f2:	68 ec fd 10 c0       	push   $0xc010fdec
c01004f7:	e8 14 9f 00 00       	call   c010a410 <appendToDoubleLinkList>
c01004fc:	83 c4 10             	add    $0x10,%esp
c01004ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100502:	83 ec 0c             	sub    $0xc,%esp
c0100505:	50                   	push   %eax
c0100506:	6a 00                	push   $0x0
c0100508:	68 0c b0 10 c0       	push   $0xc010b00c
c010050d:	68 13 b0 10 c0       	push   $0xc010b013
c0100512:	68 07 54 10 c0       	push   $0xc0105407
c0100517:	e8 35 9c 00 00       	call   c010a151 <process_execute>
c010051c:	83 c4 20             	add    $0x20,%esp
c010051f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100522:	83 ec 0c             	sub    $0xc,%esp
c0100525:	50                   	push   %eax
c0100526:	6a 00                	push   $0x0
c0100528:	68 1c b0 10 c0       	push   $0xc010b01c
c010052d:	68 24 b0 10 c0       	push   $0xc010b024
c0100532:	68 b9 18 10 c0       	push   $0xc01018b9
c0100537:	e8 15 9c 00 00       	call   c010a151 <process_execute>
c010053c:	83 c4 20             	add    $0x20,%esp
c010053f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100542:	83 ec 0c             	sub    $0xc,%esp
c0100545:	50                   	push   %eax
c0100546:	6a 00                	push   $0x0
c0100548:	68 2d b0 10 c0       	push   $0xc010b02d
c010054d:	68 34 b0 10 c0       	push   $0xc010b034
c0100552:	68 1a 08 10 c0       	push   $0xc010081a
c0100557:	e8 f5 9b 00 00       	call   c010a151 <process_execute>
c010055c:	83 c4 20             	add    $0x20,%esp
c010055f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100562:	83 ec 0c             	sub    $0xc,%esp
c0100565:	50                   	push   %eax
c0100566:	6a 00                	push   $0x0
c0100568:	68 3d b0 10 c0       	push   $0xc010b03d
c010056d:	68 45 b0 10 c0       	push   $0xc010b045
c0100572:	68 9d 48 10 c0       	push   $0xc010489d
c0100577:	e8 d5 9b 00 00       	call   c010a151 <process_execute>
c010057c:	83 c4 20             	add    $0x20,%esp
c010057f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100582:	83 e8 02             	sub    $0x2,%eax
c0100585:	83 ec 0c             	sub    $0xc,%esp
c0100588:	50                   	push   %eax
c0100589:	6a 01                	push   $0x1
c010058b:	68 4f b0 10 c0       	push   $0xc010b04f
c0100590:	68 59 b0 10 c0       	push   $0xc010b059
c0100595:	68 37 07 10 c0       	push   $0xc0100737
c010059a:	e8 b2 9b 00 00       	call   c010a151 <process_execute>
c010059f:	83 c4 20             	add    $0x20,%esp
c01005a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01005a5:	83 e8 03             	sub    $0x3,%eax
c01005a8:	83 ec 0c             	sub    $0xc,%esp
c01005ab:	50                   	push   %eax
c01005ac:	6a 01                	push   $0x1
c01005ae:	68 66 b0 10 c0       	push   $0xc010b066
c01005b3:	68 70 b0 10 c0       	push   $0xc010b070
c01005b8:	68 02 08 10 c0       	push   $0xc0100802
c01005bd:	e8 8f 9b 00 00       	call   c010a151 <process_execute>
c01005c2:	83 c4 20             	add    $0x20,%esp
c01005c5:	83 ec 0c             	sub    $0xc,%esp
c01005c8:	68 7d b0 10 c0       	push   $0xc010b07d
c01005cd:	e8 07 fb ff ff       	call   c01000d9 <disp_str>
c01005d2:	83 c4 10             	add    $0x10,%esp
c01005d5:	fb                   	sti    
c01005d6:	e8 73 68 00 00       	call   c0106e4e <stop_here>
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
c010060b:	c7 05 c8 06 11 c0 64 	movl   $0x64,0xc01106c8
c0100612:	00 00 00 
c0100615:	c7 05 fc fd 10 c0 09 	movl   $0x9,0xc010fdfc
c010061c:	00 00 00 
c010061f:	c7 05 c0 fb 10 c0 00 	movl   $0x0,0xc010fbc0
c0100626:	00 00 00 
c0100629:	83 ec 0c             	sub    $0xc,%esp
c010062c:	68 87 b0 10 c0       	push   $0xc010b087
c0100631:	e8 a3 fa ff ff       	call   c01000d9 <disp_str>
c0100636:	83 c4 10             	add    $0x10,%esp
c0100639:	e8 3c 72 00 00       	call   c010787a <init_keyboard>
c010063e:	83 ec 0c             	sub    $0xc,%esp
c0100641:	68 00 00 00 04       	push   $0x4000000
c0100646:	e8 ba 66 00 00       	call   c0106d05 <init_memory>
c010064b:	83 c4 10             	add    $0x10,%esp
c010064e:	83 ec 0c             	sub    $0xc,%esp
c0100651:	68 ec fd 10 c0       	push   $0xc010fdec
c0100656:	e8 8a 9c 00 00       	call   c010a2e5 <initDoubleLinkList>
c010065b:	83 c4 10             	add    $0x10,%esp
c010065e:	83 ec 0c             	sub    $0xc,%esp
c0100661:	68 04 0f 11 c0       	push   $0xc0110f04
c0100666:	e8 7a 9c 00 00       	call   c010a2e5 <initDoubleLinkList>
c010066b:	83 c4 10             	add    $0x10,%esp
c010066e:	90                   	nop
c010066f:	c9                   	leave  
c0100670:	c3                   	ret    

c0100671 <kernel_thread_a>:
c0100671:	55                   	push   %ebp
c0100672:	89 e5                	mov    %esp,%ebp
c0100674:	83 ec 18             	sub    $0x18,%esp
c0100677:	83 ec 0c             	sub    $0xc,%esp
c010067a:	ff 75 08             	pushl  0x8(%ebp)
c010067d:	e8 57 fa ff ff       	call   c01000d9 <disp_str>
c0100682:	83 c4 10             	add    $0x10,%esp
c0100685:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c010068a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010068d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100694:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100697:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c010069c:	83 ec 0c             	sub    $0xc,%esp
c010069f:	68 8d b0 10 c0       	push   $0xc010b08d
c01006a4:	e8 30 fa ff ff       	call   c01000d9 <disp_str>
c01006a9:	83 c4 10             	add    $0x10,%esp
c01006ac:	83 ec 0c             	sub    $0xc,%esp
c01006af:	68 96 b0 10 c0       	push   $0xc010b096
c01006b4:	e8 20 fa ff ff       	call   c01000d9 <disp_str>
c01006b9:	83 c4 10             	add    $0x10,%esp
c01006bc:	eb d6                	jmp    c0100694 <kernel_thread_a+0x23>

c01006be <kernel_thread_b>:
c01006be:	55                   	push   %ebp
c01006bf:	89 e5                	mov    %esp,%ebp
c01006c1:	83 ec 18             	sub    $0x18,%esp
c01006c4:	83 ec 0c             	sub    $0xc,%esp
c01006c7:	ff 75 08             	pushl  0x8(%ebp)
c01006ca:	e8 0a fa ff ff       	call   c01000d9 <disp_str>
c01006cf:	83 c4 10             	add    $0x10,%esp
c01006d2:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c01006d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01006da:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01006e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01006e4:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c01006e9:	83 ec 0c             	sub    $0xc,%esp
c01006ec:	68 98 b0 10 c0       	push   $0xc010b098
c01006f1:	e8 e3 f9 ff ff       	call   c01000d9 <disp_str>
c01006f6:	83 c4 10             	add    $0x10,%esp
c01006f9:	83 ec 0c             	sub    $0xc,%esp
c01006fc:	68 96 b0 10 c0       	push   $0xc010b096
c0100701:	e8 d3 f9 ff ff       	call   c01000d9 <disp_str>
c0100706:	83 c4 10             	add    $0x10,%esp
c0100709:	eb d6                	jmp    c01006e1 <kernel_thread_b+0x23>

c010070b <kernel_thread_c>:
c010070b:	55                   	push   %ebp
c010070c:	89 e5                	mov    %esp,%ebp
c010070e:	83 ec 08             	sub    $0x8,%esp
c0100711:	83 ec 0c             	sub    $0xc,%esp
c0100714:	ff 75 08             	pushl  0x8(%ebp)
c0100717:	e8 bd f9 ff ff       	call   c01000d9 <disp_str>
c010071c:	83 c4 10             	add    $0x10,%esp
c010071f:	eb fe                	jmp    c010071f <kernel_thread_c+0x14>

c0100721 <kernel_thread_d>:
c0100721:	55                   	push   %ebp
c0100722:	89 e5                	mov    %esp,%ebp
c0100724:	83 ec 08             	sub    $0x8,%esp
c0100727:	83 ec 0c             	sub    $0xc,%esp
c010072a:	ff 75 08             	pushl  0x8(%ebp)
c010072d:	e8 a7 f9 ff ff       	call   c01000d9 <disp_str>
c0100732:	83 c4 10             	add    $0x10,%esp
c0100735:	eb fe                	jmp    c0100735 <kernel_thread_d+0x14>

c0100737 <user_proc_a>:
c0100737:	55                   	push   %ebp
c0100738:	89 e5                	mov    %esp,%ebp
c010073a:	83 ec 18             	sub    $0x18,%esp
c010073d:	83 ec 0c             	sub    $0xc,%esp
c0100740:	68 a4 b0 10 c0       	push   $0xc010b0a4
c0100745:	e8 8f f9 ff ff       	call   c01000d9 <disp_str>
c010074a:	83 c4 10             	add    $0x10,%esp
c010074d:	c6 05 cd 06 11 c0 00 	movb   $0x0,0xc01106cd
c0100754:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
c010075b:	83 ec 0c             	sub    $0xc,%esp
c010075e:	ff 75 f0             	pushl  -0x10(%ebp)
c0100761:	e8 26 11 00 00       	call   c010188c <sys_malloc>
c0100766:	83 c4 10             	add    $0x10,%esp
c0100769:	a3 bc 06 11 c0       	mov    %eax,0xc01106bc
c010076e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100771:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100776:	83 ec 04             	sub    $0x4,%esp
c0100779:	52                   	push   %edx
c010077a:	6a 00                	push   $0x0
c010077c:	50                   	push   %eax
c010077d:	e8 ed ba 00 00       	call   c010c26f <Memset>
c0100782:	83 c4 10             	add    $0x10,%esp
c0100785:	c7 45 ec c3 b0 10 c0 	movl   $0xc010b0c3,-0x14(%ebp)
c010078c:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100791:	83 ec 08             	sub    $0x8,%esp
c0100794:	ff 75 ec             	pushl  -0x14(%ebp)
c0100797:	50                   	push   %eax
c0100798:	e8 f1 ba 00 00       	call   c010c28e <Strcpy>
c010079d:	83 c4 10             	add    $0x10,%esp
c01007a0:	c6 05 cd 06 11 c0 04 	movb   $0x4,0xc01106cd
c01007a7:	e8 37 a0 00 00       	call   c010a7e3 <DriverInitialize>
c01007ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01007b3:	eb 15                	jmp    c01007ca <user_proc_a+0x93>
c01007b5:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c01007ba:	83 ec 0c             	sub    $0xc,%esp
c01007bd:	50                   	push   %eax
c01007be:	e8 d2 a0 00 00       	call   c010a895 <DriverSend>
c01007c3:	83 c4 10             	add    $0x10,%esp
c01007c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01007ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01007ce:	7e e5                	jle    c01007b5 <user_proc_a+0x7e>
c01007d0:	83 ec 0c             	sub    $0xc,%esp
c01007d3:	68 da b0 10 c0       	push   $0xc010b0da
c01007d8:	e8 fc f8 ff ff       	call   c01000d9 <disp_str>
c01007dd:	83 c4 10             	add    $0x10,%esp
c01007e0:	83 ec 0c             	sub    $0xc,%esp
c01007e3:	68 ed b0 10 c0       	push   $0xc010b0ed
c01007e8:	e8 ec f8 ff ff       	call   c01000d9 <disp_str>
c01007ed:	83 c4 10             	add    $0x10,%esp
c01007f0:	83 ec 0c             	sub    $0xc,%esp
c01007f3:	68 00 b1 10 c0       	push   $0xc010b100
c01007f8:	e8 dc f8 ff ff       	call   c01000d9 <disp_str>
c01007fd:	83 c4 10             	add    $0x10,%esp
c0100800:	eb fe                	jmp    c0100800 <user_proc_a+0xc9>

c0100802 <user_proc_b>:
c0100802:	55                   	push   %ebp
c0100803:	89 e5                	mov    %esp,%ebp
c0100805:	83 ec 08             	sub    $0x8,%esp
c0100808:	83 ec 0c             	sub    $0xc,%esp
c010080b:	68 14 b1 10 c0       	push   $0xc010b114
c0100810:	e8 c4 f8 ff ff       	call   c01000d9 <disp_str>
c0100815:	83 c4 10             	add    $0x10,%esp
c0100818:	eb fe                	jmp    c0100818 <user_proc_b+0x16>

c010081a <TaskHD>:
c010081a:	55                   	push   %ebp
c010081b:	89 e5                	mov    %esp,%ebp
c010081d:	83 ec 18             	sub    $0x18,%esp
c0100820:	e8 17 fc ff ff       	call   c010043c <get_running_thread_pcb>
c0100825:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100828:	e8 32 00 00 00       	call   c010085f <init_hd>
c010082d:	83 ec 0c             	sub    $0xc,%esp
c0100830:	6a 7c                	push   $0x7c
c0100832:	e8 55 10 00 00       	call   c010188c <sys_malloc>
c0100837:	83 c4 10             	add    $0x10,%esp
c010083a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010083d:	83 ec 04             	sub    $0x4,%esp
c0100840:	6a 7c                	push   $0x7c
c0100842:	6a 00                	push   $0x0
c0100844:	ff 75 f0             	pushl  -0x10(%ebp)
c0100847:	e8 23 ba 00 00       	call   c010c26f <Memset>
c010084c:	83 c4 10             	add    $0x10,%esp
c010084f:	83 ec 0c             	sub    $0xc,%esp
c0100852:	ff 75 f0             	pushl  -0x10(%ebp)
c0100855:	e8 1f 00 00 00       	call   c0100879 <hd_handle>
c010085a:	83 c4 10             	add    $0x10,%esp
c010085d:	eb de                	jmp    c010083d <TaskHD+0x23>

c010085f <init_hd>:
c010085f:	55                   	push   %ebp
c0100860:	89 e5                	mov    %esp,%ebp
c0100862:	83 ec 18             	sub    $0x18,%esp
c0100865:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c010086c:	e8 87 fb ff ff       	call   c01003f8 <enable_8259A_casecade_irq>
c0100871:	e8 96 fb ff ff       	call   c010040c <enable_8259A_slave_winchester_irq>
c0100876:	90                   	nop
c0100877:	c9                   	leave  
c0100878:	c3                   	ret    

c0100879 <hd_handle>:
c0100879:	55                   	push   %ebp
c010087a:	89 e5                	mov    %esp,%ebp
c010087c:	83 ec 18             	sub    $0x18,%esp
c010087f:	83 ec 04             	sub    $0x4,%esp
c0100882:	6a 12                	push   $0x12
c0100884:	ff 75 08             	pushl  0x8(%ebp)
c0100887:	6a 02                	push   $0x2
c0100889:	e8 37 8f 00 00       	call   c01097c5 <send_rec>
c010088e:	83 c4 10             	add    $0x10,%esp
c0100891:	8b 45 08             	mov    0x8(%ebp),%eax
c0100894:	8b 40 78             	mov    0x78(%eax),%eax
c0100897:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010089a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010089e:	0f 84 d4 00 00 00    	je     c0100978 <hd_handle+0xff>
c01008a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01008a7:	8b 00                	mov    (%eax),%eax
c01008a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01008ac:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008b0:	74 28                	je     c01008da <hd_handle+0x61>
c01008b2:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008b6:	74 22                	je     c01008da <hd_handle+0x61>
c01008b8:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008bc:	74 1c                	je     c01008da <hd_handle+0x61>
c01008be:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008c2:	74 16                	je     c01008da <hd_handle+0x61>
c01008c4:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008cb:	74 0d                	je     c01008da <hd_handle+0x61>
c01008cd:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01008d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01008da:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008de:	74 34                	je     c0100914 <hd_handle+0x9b>
c01008e0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008e4:	74 2e                	je     c0100914 <hd_handle+0x9b>
c01008e6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008ea:	74 28                	je     c0100914 <hd_handle+0x9b>
c01008ec:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008f0:	74 22                	je     c0100914 <hd_handle+0x9b>
c01008f2:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008f9:	74 19                	je     c0100914 <hd_handle+0x9b>
c01008fb:	6a 70                	push   $0x70
c01008fd:	68 34 b1 10 c0       	push   $0xc010b134
c0100902:	68 34 b1 10 c0       	push   $0xc010b134
c0100907:	68 3c b1 10 c0       	push   $0xc010b13c
c010090c:	e8 44 82 00 00       	call   c0108b55 <assertion_failure>
c0100911:	83 c4 10             	add    $0x10,%esp
c0100914:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100918:	74 2c                	je     c0100946 <hd_handle+0xcd>
c010091a:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010091e:	77 0e                	ja     c010092e <hd_handle+0xb5>
c0100920:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100924:	74 19                	je     c010093f <hd_handle+0xc6>
c0100926:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c010092a:	74 1a                	je     c0100946 <hd_handle+0xcd>
c010092c:	eb 37                	jmp    c0100965 <hd_handle+0xec>
c010092e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100932:	74 22                	je     c0100956 <hd_handle+0xdd>
c0100934:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c010093b:	74 3e                	je     c010097b <hd_handle+0x102>
c010093d:	eb 26                	jmp    c0100965 <hd_handle+0xec>
c010093f:	e8 e6 06 00 00       	call   c010102a <hd_open>
c0100944:	eb 36                	jmp    c010097c <hd_handle+0x103>
c0100946:	83 ec 0c             	sub    $0xc,%esp
c0100949:	ff 75 08             	pushl  0x8(%ebp)
c010094c:	e8 b2 08 00 00       	call   c0101203 <hd_rdwt>
c0100951:	83 c4 10             	add    $0x10,%esp
c0100954:	eb 26                	jmp    c010097c <hd_handle+0x103>
c0100956:	83 ec 0c             	sub    $0xc,%esp
c0100959:	6a 00                	push   $0x0
c010095b:	e8 71 07 00 00       	call   c01010d1 <get_hd_ioctl>
c0100960:	83 c4 10             	add    $0x10,%esp
c0100963:	eb 17                	jmp    c010097c <hd_handle+0x103>
c0100965:	83 ec 0c             	sub    $0xc,%esp
c0100968:	68 96 b1 10 c0       	push   $0xc010b196
c010096d:	e8 9f 81 00 00       	call   c0108b11 <spin>
c0100972:	83 c4 10             	add    $0x10,%esp
c0100975:	90                   	nop
c0100976:	eb 04                	jmp    c010097c <hd_handle+0x103>
c0100978:	90                   	nop
c0100979:	eb 01                	jmp    c010097c <hd_handle+0x103>
c010097b:	90                   	nop
c010097c:	c9                   	leave  
c010097d:	c3                   	ret    

c010097e <hd_cmd_out>:
c010097e:	55                   	push   %ebp
c010097f:	89 e5                	mov    %esp,%ebp
c0100981:	83 ec 08             	sub    $0x8,%esp
c0100984:	83 ec 04             	sub    $0x4,%esp
c0100987:	68 18 73 01 00       	push   $0x17318
c010098c:	6a 00                	push   $0x0
c010098e:	68 80 00 00 00       	push   $0x80
c0100993:	e8 4f 0d 00 00       	call   c01016e7 <waitfor>
c0100998:	83 c4 10             	add    $0x10,%esp
c010099b:	85 c0                	test   %eax,%eax
c010099d:	75 10                	jne    c01009af <hd_cmd_out+0x31>
c010099f:	83 ec 0c             	sub    $0xc,%esp
c01009a2:	68 a8 b1 10 c0       	push   $0xc010b1a8
c01009a7:	e8 8b 81 00 00       	call   c0108b37 <panic>
c01009ac:	83 c4 10             	add    $0x10,%esp
c01009af:	83 ec 08             	sub    $0x8,%esp
c01009b2:	6a 00                	push   $0x0
c01009b4:	68 f6 03 00 00       	push   $0x3f6
c01009b9:	e8 80 f9 ff ff       	call   c010033e <out_byte>
c01009be:	83 c4 10             	add    $0x10,%esp
c01009c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01009c4:	0f b6 00             	movzbl (%eax),%eax
c01009c7:	0f b6 c0             	movzbl %al,%eax
c01009ca:	83 ec 08             	sub    $0x8,%esp
c01009cd:	50                   	push   %eax
c01009ce:	68 f1 01 00 00       	push   $0x1f1
c01009d3:	e8 66 f9 ff ff       	call   c010033e <out_byte>
c01009d8:	83 c4 10             	add    $0x10,%esp
c01009db:	8b 45 08             	mov    0x8(%ebp),%eax
c01009de:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01009e2:	0f b6 c0             	movzbl %al,%eax
c01009e5:	83 ec 08             	sub    $0x8,%esp
c01009e8:	50                   	push   %eax
c01009e9:	68 f2 01 00 00       	push   $0x1f2
c01009ee:	e8 4b f9 ff ff       	call   c010033e <out_byte>
c01009f3:	83 c4 10             	add    $0x10,%esp
c01009f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01009f9:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c01009fd:	0f b6 c0             	movzbl %al,%eax
c0100a00:	83 ec 08             	sub    $0x8,%esp
c0100a03:	50                   	push   %eax
c0100a04:	68 f3 01 00 00       	push   $0x1f3
c0100a09:	e8 30 f9 ff ff       	call   c010033e <out_byte>
c0100a0e:	83 c4 10             	add    $0x10,%esp
c0100a11:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a14:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0100a18:	0f b6 c0             	movzbl %al,%eax
c0100a1b:	83 ec 08             	sub    $0x8,%esp
c0100a1e:	50                   	push   %eax
c0100a1f:	68 f4 01 00 00       	push   $0x1f4
c0100a24:	e8 15 f9 ff ff       	call   c010033e <out_byte>
c0100a29:	83 c4 10             	add    $0x10,%esp
c0100a2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a2f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100a33:	0f b6 c0             	movzbl %al,%eax
c0100a36:	83 ec 08             	sub    $0x8,%esp
c0100a39:	50                   	push   %eax
c0100a3a:	68 f5 01 00 00       	push   $0x1f5
c0100a3f:	e8 fa f8 ff ff       	call   c010033e <out_byte>
c0100a44:	83 c4 10             	add    $0x10,%esp
c0100a47:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a4a:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0100a4e:	0f b6 c0             	movzbl %al,%eax
c0100a51:	83 ec 08             	sub    $0x8,%esp
c0100a54:	50                   	push   %eax
c0100a55:	68 f6 01 00 00       	push   $0x1f6
c0100a5a:	e8 df f8 ff ff       	call   c010033e <out_byte>
c0100a5f:	83 c4 10             	add    $0x10,%esp
c0100a62:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a65:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100a69:	0f b6 c0             	movzbl %al,%eax
c0100a6c:	83 ec 08             	sub    $0x8,%esp
c0100a6f:	50                   	push   %eax
c0100a70:	68 f7 01 00 00       	push   $0x1f7
c0100a75:	e8 c4 f8 ff ff       	call   c010033e <out_byte>
c0100a7a:	83 c4 10             	add    $0x10,%esp
c0100a7d:	90                   	nop
c0100a7e:	c9                   	leave  
c0100a7f:	c3                   	ret    

c0100a80 <hd_identify>:
c0100a80:	55                   	push   %ebp
c0100a81:	89 e5                	mov    %esp,%ebp
c0100a83:	53                   	push   %ebx
c0100a84:	83 ec 24             	sub    $0x24,%esp
c0100a87:	89 e0                	mov    %esp,%eax
c0100a89:	89 c3                	mov    %eax,%ebx
c0100a8b:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0100a8f:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100a93:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100a97:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100a9b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0100a9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100aa2:	c1 e0 04             	shl    $0x4,%eax
c0100aa5:	83 c8 e0             	or     $0xffffffe0,%eax
c0100aa8:	88 45 ea             	mov    %al,-0x16(%ebp)
c0100aab:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0100aaf:	83 ec 0c             	sub    $0xc,%esp
c0100ab2:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100ab5:	50                   	push   %eax
c0100ab6:	e8 c3 fe ff ff       	call   c010097e <hd_cmd_out>
c0100abb:	83 c4 10             	add    $0x10,%esp
c0100abe:	e8 f0 06 00 00       	call   c01011b3 <interrupt_wait>
c0100ac3:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100aca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100acd:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100ad0:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100ad3:	89 c2                	mov    %eax,%edx
c0100ad5:	b8 10 00 00 00       	mov    $0x10,%eax
c0100ada:	83 e8 01             	sub    $0x1,%eax
c0100add:	01 d0                	add    %edx,%eax
c0100adf:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100ae4:	ba 00 00 00 00       	mov    $0x0,%edx
c0100ae9:	f7 f1                	div    %ecx
c0100aeb:	6b c0 10             	imul   $0x10,%eax,%eax
c0100aee:	29 c4                	sub    %eax,%esp
c0100af0:	89 e0                	mov    %esp,%eax
c0100af2:	83 c0 00             	add    $0x0,%eax
c0100af5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100af8:	83 ec 04             	sub    $0x4,%esp
c0100afb:	ff 75 f4             	pushl  -0xc(%ebp)
c0100afe:	6a 00                	push   $0x0
c0100b00:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b03:	e8 67 b7 00 00       	call   c010c26f <Memset>
c0100b08:	83 c4 10             	add    $0x10,%esp
c0100b0b:	83 ec 04             	sub    $0x4,%esp
c0100b0e:	ff 75 f4             	pushl  -0xc(%ebp)
c0100b11:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b14:	68 f0 01 00 00       	push   $0x1f0
c0100b19:	e8 a5 b7 00 00       	call   c010c2c3 <read_port>
c0100b1e:	83 c4 10             	add    $0x10,%esp
c0100b21:	83 ec 0c             	sub    $0xc,%esp
c0100b24:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b27:	e8 0b 00 00 00       	call   c0100b37 <print_hdinfo>
c0100b2c:	83 c4 10             	add    $0x10,%esp
c0100b2f:	89 dc                	mov    %ebx,%esp
c0100b31:	90                   	nop
c0100b32:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b35:	c9                   	leave  
c0100b36:	c3                   	ret    

c0100b37 <print_hdinfo>:
c0100b37:	55                   	push   %ebp
c0100b38:	89 e5                	mov    %esp,%ebp
c0100b3a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100b40:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100b46:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100b4c:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100b53:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100b5a:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100b61:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100b68:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100b6f:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100b75:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100b7b:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100b82:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100b89:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100b90:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100b97:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100b9e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100ba5:	e9 8f 00 00 00       	jmp    c0100c39 <print_hdinfo+0x102>
c0100baa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100bb1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100bb4:	89 d0                	mov    %edx,%eax
c0100bb6:	01 c0                	add    %eax,%eax
c0100bb8:	01 d0                	add    %edx,%eax
c0100bba:	c1 e0 03             	shl    $0x3,%eax
c0100bbd:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100bc0:	01 c8                	add    %ecx,%eax
c0100bc2:	83 e8 44             	sub    $0x44,%eax
c0100bc5:	0f b7 00             	movzwl (%eax),%eax
c0100bc8:	0f b7 c0             	movzwl %ax,%eax
c0100bcb:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100bce:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bd1:	01 d0                	add    %edx,%eax
c0100bd3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100bd6:	eb 30                	jmp    c0100c08 <print_hdinfo+0xd1>
c0100bd8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bdb:	8d 50 01             	lea    0x1(%eax),%edx
c0100bde:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100be1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100be4:	83 c2 01             	add    $0x1,%edx
c0100be7:	0f b6 00             	movzbl (%eax),%eax
c0100bea:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100bee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bf1:	8d 50 01             	lea    0x1(%eax),%edx
c0100bf4:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100bf7:	0f b6 00             	movzbl (%eax),%eax
c0100bfa:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100bfd:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100c00:	01 ca                	add    %ecx,%edx
c0100c02:	88 02                	mov    %al,(%edx)
c0100c04:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100c08:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100c0b:	89 d0                	mov    %edx,%eax
c0100c0d:	01 c0                	add    %eax,%eax
c0100c0f:	01 d0                	add    %edx,%eax
c0100c11:	c1 e0 03             	shl    $0x3,%eax
c0100c14:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100c17:	01 c8                	add    %ecx,%eax
c0100c19:	83 e8 42             	sub    $0x42,%eax
c0100c1c:	0f b7 00             	movzwl (%eax),%eax
c0100c1f:	66 d1 e8             	shr    %ax
c0100c22:	0f b7 c0             	movzwl %ax,%eax
c0100c25:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100c28:	7c ae                	jl     c0100bd8 <print_hdinfo+0xa1>
c0100c2a:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100c2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c30:	01 d0                	add    %edx,%eax
c0100c32:	c6 00 00             	movb   $0x0,(%eax)
c0100c35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100c39:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100c3d:	0f 8e 67 ff ff ff    	jle    c0100baa <print_hdinfo+0x73>
c0100c43:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c46:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100c4a:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100c4e:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100c52:	66 c1 e8 08          	shr    $0x8,%ax
c0100c56:	66 85 c0             	test   %ax,%ax
c0100c59:	0f 95 c0             	setne  %al
c0100c5c:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100c5f:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100c66:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100c6c:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100c70:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100c74:	75 15                	jne    c0100c8b <print_hdinfo+0x154>
c0100c76:	83 ec 08             	sub    $0x8,%esp
c0100c79:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100c7c:	50                   	push   %eax
c0100c7d:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c80:	50                   	push   %eax
c0100c81:	e8 08 b6 00 00       	call   c010c28e <Strcpy>
c0100c86:	83 c4 10             	add    $0x10,%esp
c0100c89:	eb 13                	jmp    c0100c9e <print_hdinfo+0x167>
c0100c8b:	83 ec 08             	sub    $0x8,%esp
c0100c8e:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c91:	50                   	push   %eax
c0100c92:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c95:	50                   	push   %eax
c0100c96:	e8 f3 b5 00 00       	call   c010c28e <Strcpy>
c0100c9b:	83 c4 10             	add    $0x10,%esp
c0100c9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ca1:	83 c0 7a             	add    $0x7a,%eax
c0100ca4:	0f b7 00             	movzwl (%eax),%eax
c0100ca7:	0f b7 d0             	movzwl %ax,%edx
c0100caa:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cad:	83 c0 78             	add    $0x78,%eax
c0100cb0:	0f b7 00             	movzwl (%eax),%eax
c0100cb3:	0f b7 c0             	movzwl %ax,%eax
c0100cb6:	83 c0 10             	add    $0x10,%eax
c0100cb9:	89 c1                	mov    %eax,%ecx
c0100cbb:	d3 e2                	shl    %cl,%edx
c0100cbd:	89 d0                	mov    %edx,%eax
c0100cbf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100cc2:	90                   	nop
c0100cc3:	c9                   	leave  
c0100cc4:	c3                   	ret    

c0100cc5 <print_dpt_entry>:
c0100cc5:	55                   	push   %ebp
c0100cc6:	89 e5                	mov    %esp,%ebp
c0100cc8:	83 ec 08             	sub    $0x8,%esp
c0100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cce:	8b 40 08             	mov    0x8(%eax),%eax
c0100cd1:	83 ec 08             	sub    $0x8,%esp
c0100cd4:	50                   	push   %eax
c0100cd5:	68 b2 b1 10 c0       	push   $0xc010b1b2
c0100cda:	e8 19 7b 00 00       	call   c01087f8 <Printf>
c0100cdf:	83 c4 10             	add    $0x10,%esp
c0100ce2:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ce5:	8b 40 0c             	mov    0xc(%eax),%eax
c0100ce8:	83 ec 08             	sub    $0x8,%esp
c0100ceb:	50                   	push   %eax
c0100cec:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100cf1:	e8 02 7b 00 00       	call   c01087f8 <Printf>
c0100cf6:	83 c4 10             	add    $0x10,%esp
c0100cf9:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cfc:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100d00:	0f b6 c0             	movzbl %al,%eax
c0100d03:	83 ec 08             	sub    $0x8,%esp
c0100d06:	50                   	push   %eax
c0100d07:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100d0c:	e8 e7 7a 00 00       	call   c01087f8 <Printf>
c0100d11:	83 c4 10             	add    $0x10,%esp
c0100d14:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d17:	0f b6 00             	movzbl (%eax),%eax
c0100d1a:	0f b6 c0             	movzbl %al,%eax
c0100d1d:	83 ec 08             	sub    $0x8,%esp
c0100d20:	50                   	push   %eax
c0100d21:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100d26:	e8 cd 7a 00 00       	call   c01087f8 <Printf>
c0100d2b:	83 c4 10             	add    $0x10,%esp
c0100d2e:	90                   	nop
c0100d2f:	c9                   	leave  
c0100d30:	c3                   	ret    

c0100d31 <get_partition_table>:
c0100d31:	55                   	push   %ebp
c0100d32:	89 e5                	mov    %esp,%ebp
c0100d34:	53                   	push   %ebx
c0100d35:	83 ec 24             	sub    $0x24,%esp
c0100d38:	89 e0                	mov    %esp,%eax
c0100d3a:	89 c3                	mov    %eax,%ebx
c0100d3c:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100d40:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100d44:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d47:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100d4a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d4d:	c1 f8 08             	sar    $0x8,%eax
c0100d50:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100d53:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d56:	c1 f8 10             	sar    $0x10,%eax
c0100d59:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100d5c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d5f:	c1 f8 18             	sar    $0x18,%eax
c0100d62:	89 c2                	mov    %eax,%edx
c0100d64:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d67:	c1 e0 04             	shl    $0x4,%eax
c0100d6a:	09 d0                	or     %edx,%eax
c0100d6c:	83 c8 e0             	or     $0xffffffe0,%eax
c0100d6f:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100d72:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100d76:	83 ec 0c             	sub    $0xc,%esp
c0100d79:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100d7c:	50                   	push   %eax
c0100d7d:	e8 fc fb ff ff       	call   c010097e <hd_cmd_out>
c0100d82:	83 c4 10             	add    $0x10,%esp
c0100d85:	e8 29 04 00 00       	call   c01011b3 <interrupt_wait>
c0100d8a:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100d91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d94:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100d97:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100d9a:	89 c2                	mov    %eax,%edx
c0100d9c:	b8 10 00 00 00       	mov    $0x10,%eax
c0100da1:	83 e8 01             	sub    $0x1,%eax
c0100da4:	01 d0                	add    %edx,%eax
c0100da6:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100dab:	ba 00 00 00 00       	mov    $0x0,%edx
c0100db0:	f7 f1                	div    %ecx
c0100db2:	6b c0 10             	imul   $0x10,%eax,%eax
c0100db5:	29 c4                	sub    %eax,%esp
c0100db7:	89 e0                	mov    %esp,%eax
c0100db9:	83 c0 00             	add    $0x0,%eax
c0100dbc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100dbf:	83 ec 04             	sub    $0x4,%esp
c0100dc2:	ff 75 f4             	pushl  -0xc(%ebp)
c0100dc5:	6a 00                	push   $0x0
c0100dc7:	ff 75 ec             	pushl  -0x14(%ebp)
c0100dca:	e8 a0 b4 00 00       	call   c010c26f <Memset>
c0100dcf:	83 c4 10             	add    $0x10,%esp
c0100dd2:	83 ec 04             	sub    $0x4,%esp
c0100dd5:	ff 75 f4             	pushl  -0xc(%ebp)
c0100dd8:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ddb:	68 f0 01 00 00       	push   $0x1f0
c0100de0:	e8 de b4 00 00       	call   c010c2c3 <read_port>
c0100de5:	83 c4 10             	add    $0x10,%esp
c0100de8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100deb:	05 be 01 00 00       	add    $0x1be,%eax
c0100df0:	83 ec 04             	sub    $0x4,%esp
c0100df3:	6a 40                	push   $0x40
c0100df5:	50                   	push   %eax
c0100df6:	ff 75 10             	pushl  0x10(%ebp)
c0100df9:	e8 3e 61 00 00       	call   c0106f3c <Memcpy>
c0100dfe:	83 c4 10             	add    $0x10,%esp
c0100e01:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100e08:	89 dc                	mov    %ebx,%esp
c0100e0a:	90                   	nop
c0100e0b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100e0e:	c9                   	leave  
c0100e0f:	c3                   	ret    

c0100e10 <partition>:
c0100e10:	55                   	push   %ebp
c0100e11:	89 e5                	mov    %esp,%ebp
c0100e13:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100e19:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100e1c:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100e1f:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100e23:	7f 19                	jg     c0100e3e <partition+0x2e>
c0100e25:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100e28:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100e2d:	89 c8                	mov    %ecx,%eax
c0100e2f:	f7 ea                	imul   %edx
c0100e31:	d1 fa                	sar    %edx
c0100e33:	89 c8                	mov    %ecx,%eax
c0100e35:	c1 f8 1f             	sar    $0x1f,%eax
c0100e38:	29 c2                	sub    %eax,%edx
c0100e3a:	89 d0                	mov    %edx,%eax
c0100e3c:	eb 11                	jmp    c0100e4f <partition+0x3f>
c0100e3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e41:	83 e8 10             	sub    $0x10,%eax
c0100e44:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100e47:	85 c0                	test   %eax,%eax
c0100e49:	0f 48 c2             	cmovs  %edx,%eax
c0100e4c:	c1 f8 06             	sar    $0x6,%eax
c0100e4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100e52:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100e56:	0f 85 cc 00 00 00    	jne    c0100f28 <partition+0x118>
c0100e5c:	83 ec 04             	sub    $0x4,%esp
c0100e5f:	6a 40                	push   $0x40
c0100e61:	6a 00                	push   $0x0
c0100e63:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e66:	50                   	push   %eax
c0100e67:	e8 03 b4 00 00       	call   c010c26f <Memset>
c0100e6c:	83 c4 10             	add    $0x10,%esp
c0100e6f:	83 ec 04             	sub    $0x4,%esp
c0100e72:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e75:	50                   	push   %eax
c0100e76:	6a 00                	push   $0x0
c0100e78:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e7b:	e8 b1 fe ff ff       	call   c0100d31 <get_partition_table>
c0100e80:	83 c4 10             	add    $0x10,%esp
c0100e83:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e8a:	e9 8a 00 00 00       	jmp    c0100f19 <partition+0x109>
c0100e8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e92:	83 c0 01             	add    $0x1,%eax
c0100e95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100e98:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e9b:	c1 e0 04             	shl    $0x4,%eax
c0100e9e:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ea1:	01 c8                	add    %ecx,%eax
c0100ea3:	83 e8 5c             	sub    $0x5c,%eax
c0100ea6:	8b 00                	mov    (%eax),%eax
c0100ea8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100eab:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100eae:	c1 e1 03             	shl    $0x3,%ecx
c0100eb1:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100eb7:	01 ca                	add    %ecx,%edx
c0100eb9:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100ebf:	89 02                	mov    %eax,(%edx)
c0100ec1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ec4:	c1 e0 04             	shl    $0x4,%eax
c0100ec7:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100eca:	01 c8                	add    %ecx,%eax
c0100ecc:	83 e8 58             	sub    $0x58,%eax
c0100ecf:	8b 00                	mov    (%eax),%eax
c0100ed1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100ed4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100ed7:	c1 e1 03             	shl    $0x3,%ecx
c0100eda:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ee0:	01 ca                	add    %ecx,%edx
c0100ee2:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100ee8:	89 02                	mov    %eax,(%edx)
c0100eea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100eed:	c1 e0 04             	shl    $0x4,%eax
c0100ef0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ef3:	01 c8                	add    %ecx,%eax
c0100ef5:	83 e8 60             	sub    $0x60,%eax
c0100ef8:	0f b6 00             	movzbl (%eax),%eax
c0100efb:	3c 05                	cmp    $0x5,%al
c0100efd:	75 16                	jne    c0100f15 <partition+0x105>
c0100eff:	8b 55 08             	mov    0x8(%ebp),%edx
c0100f02:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f05:	01 d0                	add    %edx,%eax
c0100f07:	83 ec 08             	sub    $0x8,%esp
c0100f0a:	6a 01                	push   $0x1
c0100f0c:	50                   	push   %eax
c0100f0d:	e8 fe fe ff ff       	call   c0100e10 <partition>
c0100f12:	83 c4 10             	add    $0x10,%esp
c0100f15:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100f19:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100f1d:	0f 8e 6c ff ff ff    	jle    c0100e8f <partition+0x7f>
c0100f23:	e9 ff 00 00 00       	jmp    c0101027 <partition+0x217>
c0100f28:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100f2c:	0f 85 f5 00 00 00    	jne    c0101027 <partition+0x217>
c0100f32:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f35:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100f3a:	89 c8                	mov    %ecx,%eax
c0100f3c:	f7 ea                	imul   %edx
c0100f3e:	d1 fa                	sar    %edx
c0100f40:	89 c8                	mov    %ecx,%eax
c0100f42:	c1 f8 1f             	sar    $0x1f,%eax
c0100f45:	29 c2                	sub    %eax,%edx
c0100f47:	89 d0                	mov    %edx,%eax
c0100f49:	c1 e0 02             	shl    $0x2,%eax
c0100f4c:	01 d0                	add    %edx,%eax
c0100f4e:	29 c1                	sub    %eax,%ecx
c0100f50:	89 c8                	mov    %ecx,%eax
c0100f52:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100f55:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100f58:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f5b:	c1 e2 03             	shl    $0x3,%edx
c0100f5e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f64:	01 d0                	add    %edx,%eax
c0100f66:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f6b:	8b 00                	mov    (%eax),%eax
c0100f6d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100f70:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f73:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f76:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100f79:	83 e8 01             	sub    $0x1,%eax
c0100f7c:	c1 e0 04             	shl    $0x4,%eax
c0100f7f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100f82:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100f89:	e9 8c 00 00 00       	jmp    c010101a <partition+0x20a>
c0100f8e:	83 ec 04             	sub    $0x4,%esp
c0100f91:	6a 40                	push   $0x40
c0100f93:	6a 00                	push   $0x0
c0100f95:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f98:	50                   	push   %eax
c0100f99:	e8 d1 b2 00 00       	call   c010c26f <Memset>
c0100f9e:	83 c4 10             	add    $0x10,%esp
c0100fa1:	83 ec 04             	sub    $0x4,%esp
c0100fa4:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100fa7:	50                   	push   %eax
c0100fa8:	ff 75 f0             	pushl  -0x10(%ebp)
c0100fab:	ff 75 e8             	pushl  -0x18(%ebp)
c0100fae:	e8 7e fd ff ff       	call   c0100d31 <get_partition_table>
c0100fb3:	83 c4 10             	add    $0x10,%esp
c0100fb6:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100fb9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fbc:	01 d0                	add    %edx,%eax
c0100fbe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100fc1:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100fc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100fc7:	01 c2                	add    %eax,%edx
c0100fc9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100fcc:	8d 48 04             	lea    0x4(%eax),%ecx
c0100fcf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100fd2:	c1 e1 03             	shl    $0x3,%ecx
c0100fd5:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100fdb:	01 c8                	add    %ecx,%eax
c0100fdd:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100fe2:	89 10                	mov    %edx,(%eax)
c0100fe4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100fe7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100fea:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100fed:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100ff0:	c1 e1 03             	shl    $0x3,%ecx
c0100ff3:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ff9:	01 ca                	add    %ecx,%edx
c0100ffb:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0101001:	89 02                	mov    %eax,(%edx)
c0101003:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0101007:	84 c0                	test   %al,%al
c0101009:	74 1b                	je     c0101026 <partition+0x216>
c010100b:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010100e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101011:	01 d0                	add    %edx,%eax
c0101013:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101016:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010101a:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c010101e:	0f 8e 6a ff ff ff    	jle    c0100f8e <partition+0x17e>
c0101024:	eb 01                	jmp    c0101027 <partition+0x217>
c0101026:	90                   	nop
c0101027:	90                   	nop
c0101028:	c9                   	leave  
c0101029:	c3                   	ret    

c010102a <hd_open>:
c010102a:	55                   	push   %ebp
c010102b:	89 e5                	mov    %esp,%ebp
c010102d:	83 ec 18             	sub    $0x18,%esp
c0101030:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101037:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010103a:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101040:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0101045:	8b 00                	mov    (%eax),%eax
c0101047:	8d 50 01             	lea    0x1(%eax),%edx
c010104a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010104d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101053:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0101058:	89 10                	mov    %edx,(%eax)
c010105a:	83 ec 0c             	sub    $0xc,%esp
c010105d:	6a 00                	push   $0x0
c010105f:	e8 1c fa ff ff       	call   c0100a80 <hd_identify>
c0101064:	83 c4 10             	add    $0x10,%esp
c0101067:	83 ec 08             	sub    $0x8,%esp
c010106a:	6a 00                	push   $0x0
c010106c:	6a 00                	push   $0x0
c010106e:	e8 9d fd ff ff       	call   c0100e10 <partition>
c0101073:	83 c4 10             	add    $0x10,%esp
c0101076:	83 ec 0c             	sub    $0xc,%esp
c0101079:	6a 7c                	push   $0x7c
c010107b:	e8 0c 08 00 00       	call   c010188c <sys_malloc>
c0101080:	83 c4 10             	add    $0x10,%esp
c0101083:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101086:	83 ec 04             	sub    $0x4,%esp
c0101089:	6a 7c                	push   $0x7c
c010108b:	6a 00                	push   $0x0
c010108d:	ff 75 f0             	pushl  -0x10(%ebp)
c0101090:	e8 da b1 00 00       	call   c010c26f <Memset>
c0101095:	83 c4 10             	add    $0x10,%esp
c0101098:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010109b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01010a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01010a5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01010ac:	83 ec 04             	sub    $0x4,%esp
c01010af:	6a 02                	push   $0x2
c01010b1:	ff 75 f0             	pushl  -0x10(%ebp)
c01010b4:	6a 01                	push   $0x1
c01010b6:	e8 0a 87 00 00       	call   c01097c5 <send_rec>
c01010bb:	83 c4 10             	add    $0x10,%esp
c01010be:	83 ec 08             	sub    $0x8,%esp
c01010c1:	6a 7c                	push   $0x7c
c01010c3:	ff 75 f0             	pushl  -0x10(%ebp)
c01010c6:	e8 d6 07 00 00       	call   c01018a1 <sys_free>
c01010cb:	83 c4 10             	add    $0x10,%esp
c01010ce:	90                   	nop
c01010cf:	c9                   	leave  
c01010d0:	c3                   	ret    

c01010d1 <get_hd_ioctl>:
c01010d1:	55                   	push   %ebp
c01010d2:	89 e5                	mov    %esp,%ebp
c01010d4:	83 ec 18             	sub    $0x18,%esp
c01010d7:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c01010db:	7f 19                	jg     c01010f6 <get_hd_ioctl+0x25>
c01010dd:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01010e0:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01010e5:	89 c8                	mov    %ecx,%eax
c01010e7:	f7 ea                	imul   %edx
c01010e9:	d1 fa                	sar    %edx
c01010eb:	89 c8                	mov    %ecx,%eax
c01010ed:	c1 f8 1f             	sar    $0x1f,%eax
c01010f0:	29 c2                	sub    %eax,%edx
c01010f2:	89 d0                	mov    %edx,%eax
c01010f4:	eb 11                	jmp    c0101107 <get_hd_ioctl+0x36>
c01010f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01010f9:	83 e8 10             	sub    $0x10,%eax
c01010fc:	8d 50 3f             	lea    0x3f(%eax),%edx
c01010ff:	85 c0                	test   %eax,%eax
c0101101:	0f 48 c2             	cmovs  %edx,%eax
c0101104:	c1 f8 06             	sar    $0x6,%eax
c0101107:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010110a:	8b 55 08             	mov    0x8(%ebp),%edx
c010110d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101110:	c1 e2 03             	shl    $0x3,%edx
c0101113:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101119:	01 d0                	add    %edx,%eax
c010111b:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c0101120:	8b 00                	mov    (%eax),%eax
c0101122:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101125:	83 ec 0c             	sub    $0xc,%esp
c0101128:	6a 7c                	push   $0x7c
c010112a:	e8 5d 07 00 00       	call   c010188c <sys_malloc>
c010112f:	83 c4 10             	add    $0x10,%esp
c0101132:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101135:	83 ec 04             	sub    $0x4,%esp
c0101138:	6a 7c                	push   $0x7c
c010113a:	6a 00                	push   $0x0
c010113c:	ff 75 ec             	pushl  -0x14(%ebp)
c010113f:	e8 2b b1 00 00       	call   c010c26f <Memset>
c0101144:	83 c4 10             	add    $0x10,%esp
c0101147:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010114a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101151:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101154:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010115b:	83 ec 04             	sub    $0x4,%esp
c010115e:	6a 02                	push   $0x2
c0101160:	ff 75 ec             	pushl  -0x14(%ebp)
c0101163:	6a 01                	push   $0x1
c0101165:	e8 5b 86 00 00       	call   c01097c5 <send_rec>
c010116a:	83 c4 10             	add    $0x10,%esp
c010116d:	83 ec 08             	sub    $0x8,%esp
c0101170:	6a 7c                	push   $0x7c
c0101172:	ff 75 ec             	pushl  -0x14(%ebp)
c0101175:	e8 27 07 00 00       	call   c01018a1 <sys_free>
c010117a:	83 c4 10             	add    $0x10,%esp
c010117d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101180:	c9                   	leave  
c0101181:	c3                   	ret    

c0101182 <wait_for>:
c0101182:	55                   	push   %ebp
c0101183:	89 e5                	mov    %esp,%ebp
c0101185:	83 ec 08             	sub    $0x8,%esp
c0101188:	83 ec 04             	sub    $0x4,%esp
c010118b:	68 50 c3 00 00       	push   $0xc350
c0101190:	6a 08                	push   $0x8
c0101192:	6a 08                	push   $0x8
c0101194:	e8 4e 05 00 00       	call   c01016e7 <waitfor>
c0101199:	83 c4 10             	add    $0x10,%esp
c010119c:	85 c0                	test   %eax,%eax
c010119e:	75 10                	jne    c01011b0 <wait_for+0x2e>
c01011a0:	83 ec 0c             	sub    $0xc,%esp
c01011a3:	68 e4 b1 10 c0       	push   $0xc010b1e4
c01011a8:	e8 8a 79 00 00       	call   c0108b37 <panic>
c01011ad:	83 c4 10             	add    $0x10,%esp
c01011b0:	90                   	nop
c01011b1:	c9                   	leave  
c01011b2:	c3                   	ret    

c01011b3 <interrupt_wait>:
c01011b3:	55                   	push   %ebp
c01011b4:	89 e5                	mov    %esp,%ebp
c01011b6:	83 ec 18             	sub    $0x18,%esp
c01011b9:	83 ec 0c             	sub    $0xc,%esp
c01011bc:	6a 7c                	push   $0x7c
c01011be:	e8 c9 06 00 00       	call   c010188c <sys_malloc>
c01011c3:	83 c4 10             	add    $0x10,%esp
c01011c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01011c9:	83 ec 04             	sub    $0x4,%esp
c01011cc:	6a 7c                	push   $0x7c
c01011ce:	6a 00                	push   $0x0
c01011d0:	ff 75 f4             	pushl  -0xc(%ebp)
c01011d3:	e8 97 b0 00 00       	call   c010c26f <Memset>
c01011d8:	83 c4 10             	add    $0x10,%esp
c01011db:	83 ec 04             	sub    $0x4,%esp
c01011de:	68 13 02 00 00       	push   $0x213
c01011e3:	ff 75 f4             	pushl  -0xc(%ebp)
c01011e6:	6a 02                	push   $0x2
c01011e8:	e8 d8 85 00 00       	call   c01097c5 <send_rec>
c01011ed:	83 c4 10             	add    $0x10,%esp
c01011f0:	83 ec 08             	sub    $0x8,%esp
c01011f3:	6a 7c                	push   $0x7c
c01011f5:	ff 75 f4             	pushl  -0xc(%ebp)
c01011f8:	e8 a4 06 00 00       	call   c01018a1 <sys_free>
c01011fd:	83 c4 10             	add    $0x10,%esp
c0101200:	90                   	nop
c0101201:	c9                   	leave  
c0101202:	c3                   	ret    

c0101203 <hd_rdwt>:
c0101203:	55                   	push   %ebp
c0101204:	89 e5                	mov    %esp,%ebp
c0101206:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c010120c:	8b 45 08             	mov    0x8(%ebp),%eax
c010120f:	8b 40 18             	mov    0x18(%eax),%eax
c0101212:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101215:	8b 45 08             	mov    0x8(%ebp),%eax
c0101218:	8b 40 14             	mov    0x14(%eax),%eax
c010121b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010121e:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0101222:	7f 19                	jg     c010123d <hd_rdwt+0x3a>
c0101224:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0101227:	ba 67 66 66 66       	mov    $0x66666667,%edx
c010122c:	89 c8                	mov    %ecx,%eax
c010122e:	f7 ea                	imul   %edx
c0101230:	d1 fa                	sar    %edx
c0101232:	89 c8                	mov    %ecx,%eax
c0101234:	c1 f8 1f             	sar    $0x1f,%eax
c0101237:	29 c2                	sub    %eax,%edx
c0101239:	89 d0                	mov    %edx,%eax
c010123b:	eb 11                	jmp    c010124e <hd_rdwt+0x4b>
c010123d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101240:	83 e8 10             	sub    $0x10,%eax
c0101243:	8d 50 3f             	lea    0x3f(%eax),%edx
c0101246:	85 c0                	test   %eax,%eax
c0101248:	0f 48 c2             	cmovs  %edx,%eax
c010124b:	c1 f8 06             	sar    $0x6,%eax
c010124e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101251:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101254:	8d 50 f0             	lea    -0x10(%eax),%edx
c0101257:	89 d0                	mov    %edx,%eax
c0101259:	c1 f8 1f             	sar    $0x1f,%eax
c010125c:	c1 e8 1a             	shr    $0x1a,%eax
c010125f:	01 c2                	add    %eax,%edx
c0101261:	83 e2 3f             	and    $0x3f,%edx
c0101264:	29 c2                	sub    %eax,%edx
c0101266:	89 d0                	mov    %edx,%eax
c0101268:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010126b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010126e:	c1 e8 09             	shr    $0x9,%eax
c0101271:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101274:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0101278:	7f 1a                	jg     c0101294 <hd_rdwt+0x91>
c010127a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010127d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101280:	c1 e2 03             	shl    $0x3,%edx
c0101283:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101289:	01 d0                	add    %edx,%eax
c010128b:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101290:	8b 00                	mov    (%eax),%eax
c0101292:	eb 1b                	jmp    c01012af <hd_rdwt+0xac>
c0101294:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101297:	8d 50 04             	lea    0x4(%eax),%edx
c010129a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010129d:	c1 e2 03             	shl    $0x3,%edx
c01012a0:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01012a6:	01 d0                	add    %edx,%eax
c01012a8:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c01012ad:	8b 00                	mov    (%eax),%eax
c01012af:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01012b2:	01 d0                	add    %edx,%eax
c01012b4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01012b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01012ba:	8b 40 0c             	mov    0xc(%eax),%eax
c01012bd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01012c0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012c3:	05 ff 01 00 00       	add    $0x1ff,%eax
c01012c8:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01012ce:	85 c0                	test   %eax,%eax
c01012d0:	0f 48 c2             	cmovs  %edx,%eax
c01012d3:	c1 f8 09             	sar    $0x9,%eax
c01012d6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01012d9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01012df:	8b 45 08             	mov    0x8(%ebp),%eax
c01012e2:	8b 40 10             	mov    0x10(%eax),%eax
c01012e5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01012e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01012eb:	8b 00                	mov    (%eax),%eax
c01012ed:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01012f0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012f3:	83 ec 08             	sub    $0x8,%esp
c01012f6:	50                   	push   %eax
c01012f7:	ff 75 d0             	pushl  -0x30(%ebp)
c01012fa:	e8 d0 4d 00 00       	call   c01060cf <alloc_virtual_memory>
c01012ff:	83 c4 10             	add    $0x10,%esp
c0101302:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101305:	8b 45 08             	mov    0x8(%ebp),%eax
c0101308:	8b 40 78             	mov    0x78(%eax),%eax
c010130b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010130e:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101312:	74 22                	je     c0101336 <hd_rdwt+0x133>
c0101314:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101318:	74 1c                	je     c0101336 <hd_rdwt+0x133>
c010131a:	68 ba 01 00 00       	push   $0x1ba
c010131f:	68 34 b1 10 c0       	push   $0xc010b134
c0101324:	68 34 b1 10 c0       	push   $0xc010b134
c0101329:	68 f6 b1 10 c0       	push   $0xc010b1f6
c010132e:	e8 22 78 00 00       	call   c0108b55 <assertion_failure>
c0101333:	83 c4 10             	add    $0x10,%esp
c0101336:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c010133a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010133d:	88 45 be             	mov    %al,-0x42(%ebp)
c0101340:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101343:	88 45 bf             	mov    %al,-0x41(%ebp)
c0101346:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101349:	c1 f8 08             	sar    $0x8,%eax
c010134c:	88 45 c0             	mov    %al,-0x40(%ebp)
c010134f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101352:	c1 f8 10             	sar    $0x10,%eax
c0101355:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0101358:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010135b:	c1 f8 18             	sar    $0x18,%eax
c010135e:	83 e0 0f             	and    $0xf,%eax
c0101361:	83 c8 e0             	or     $0xffffffe0,%eax
c0101364:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0101367:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c010136b:	75 07                	jne    c0101374 <hd_rdwt+0x171>
c010136d:	b8 20 00 00 00       	mov    $0x20,%eax
c0101372:	eb 05                	jmp    c0101379 <hd_rdwt+0x176>
c0101374:	b8 30 00 00 00       	mov    $0x30,%eax
c0101379:	88 45 c3             	mov    %al,-0x3d(%ebp)
c010137c:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101380:	3c 20                	cmp    $0x20,%al
c0101382:	74 24                	je     c01013a8 <hd_rdwt+0x1a5>
c0101384:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101388:	3c 30                	cmp    $0x30,%al
c010138a:	74 1c                	je     c01013a8 <hd_rdwt+0x1a5>
c010138c:	68 c8 01 00 00       	push   $0x1c8
c0101391:	68 34 b1 10 c0       	push   $0xc010b134
c0101396:	68 34 b1 10 c0       	push   $0xc010b134
c010139b:	68 14 b2 10 c0       	push   $0xc010b214
c01013a0:	e8 b0 77 00 00       	call   c0108b55 <assertion_failure>
c01013a5:	83 c4 10             	add    $0x10,%esp
c01013a8:	83 ec 0c             	sub    $0xc,%esp
c01013ab:	8d 45 bd             	lea    -0x43(%ebp),%eax
c01013ae:	50                   	push   %eax
c01013af:	e8 ca f5 ff ff       	call   c010097e <hd_cmd_out>
c01013b4:	83 c4 10             	add    $0x10,%esp
c01013b7:	e9 9c 00 00 00       	jmp    c0101458 <hd_rdwt+0x255>
c01013bc:	b8 00 02 00 00       	mov    $0x200,%eax
c01013c1:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c01013c8:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c01013cc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01013cf:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01013d3:	75 51                	jne    c0101426 <hd_rdwt+0x223>
c01013d5:	e8 a8 fd ff ff       	call   c0101182 <wait_for>
c01013da:	e8 d4 fd ff ff       	call   c01011b3 <interrupt_wait>
c01013df:	83 ec 04             	sub    $0x4,%esp
c01013e2:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013e5:	6a 00                	push   $0x0
c01013e7:	68 80 11 11 c0       	push   $0xc0111180
c01013ec:	e8 7e ae 00 00       	call   c010c26f <Memset>
c01013f1:	83 c4 10             	add    $0x10,%esp
c01013f4:	83 ec 04             	sub    $0x4,%esp
c01013f7:	68 00 02 00 00       	push   $0x200
c01013fc:	68 80 11 11 c0       	push   $0xc0111180
c0101401:	68 f0 01 00 00       	push   $0x1f0
c0101406:	e8 b8 ae 00 00       	call   c010c2c3 <read_port>
c010140b:	83 c4 10             	add    $0x10,%esp
c010140e:	83 ec 04             	sub    $0x4,%esp
c0101411:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101414:	68 80 11 11 c0       	push   $0xc0111180
c0101419:	ff 75 f0             	pushl  -0x10(%ebp)
c010141c:	e8 1b 5b 00 00       	call   c0106f3c <Memcpy>
c0101421:	83 c4 10             	add    $0x10,%esp
c0101424:	eb 26                	jmp    c010144c <hd_rdwt+0x249>
c0101426:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c010142a:	75 20                	jne    c010144c <hd_rdwt+0x249>
c010142c:	e8 51 fd ff ff       	call   c0101182 <wait_for>
c0101431:	83 ec 04             	sub    $0x4,%esp
c0101434:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101437:	ff 75 f0             	pushl  -0x10(%ebp)
c010143a:	68 f0 01 00 00       	push   $0x1f0
c010143f:	e8 93 ae 00 00       	call   c010c2d7 <write_port>
c0101444:	83 c4 10             	add    $0x10,%esp
c0101447:	e8 67 fd ff ff       	call   c01011b3 <interrupt_wait>
c010144c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010144f:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101452:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101455:	01 45 f0             	add    %eax,-0x10(%ebp)
c0101458:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010145c:	0f 85 5a ff ff ff    	jne    c01013bc <hd_rdwt+0x1b9>
c0101462:	83 ec 04             	sub    $0x4,%esp
c0101465:	6a 7c                	push   $0x7c
c0101467:	6a 00                	push   $0x0
c0101469:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010146f:	50                   	push   %eax
c0101470:	e8 fa ad 00 00       	call   c010c26f <Memset>
c0101475:	83 c4 10             	add    $0x10,%esp
c0101478:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c010147f:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101486:	00 00 00 
c0101489:	83 ec 04             	sub    $0x4,%esp
c010148c:	6a 02                	push   $0x2
c010148e:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101494:	50                   	push   %eax
c0101495:	6a 01                	push   $0x1
c0101497:	e8 29 83 00 00       	call   c01097c5 <send_rec>
c010149c:	83 c4 10             	add    $0x10,%esp
c010149f:	90                   	nop
c01014a0:	c9                   	leave  
c01014a1:	c3                   	ret    

c01014a2 <hd_handler>:
c01014a2:	55                   	push   %ebp
c01014a3:	89 e5                	mov    %esp,%ebp
c01014a5:	83 ec 18             	sub    $0x18,%esp
c01014a8:	83 ec 0c             	sub    $0xc,%esp
c01014ab:	68 f7 01 00 00       	push   $0x1f7
c01014b0:	e8 7d ee ff ff       	call   c0100332 <in_byte>
c01014b5:	83 c4 10             	add    $0x10,%esp
c01014b8:	0f b6 c0             	movzbl %al,%eax
c01014bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01014be:	83 ec 0c             	sub    $0xc,%esp
c01014c1:	6a 03                	push   $0x3
c01014c3:	e8 97 85 00 00       	call   c0109a5f <inform_int>
c01014c8:	83 c4 10             	add    $0x10,%esp
c01014cb:	90                   	nop
c01014cc:	c9                   	leave  
c01014cd:	c3                   	ret    

c01014ce <debug_ticks>:
c01014ce:	55                   	push   %ebp
c01014cf:	89 e5                	mov    %esp,%ebp
c01014d1:	83 ec 08             	sub    $0x8,%esp
c01014d4:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01014d9:	83 c0 01             	add    $0x1,%eax
c01014dc:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c01014e1:	c7 05 a4 f7 10 c0 ae 	movl   $0x1ae,0xc010f7a4
c01014e8:	01 00 00 
c01014eb:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01014f0:	83 ec 0c             	sub    $0xc,%esp
c01014f3:	50                   	push   %eax
c01014f4:	e8 31 5e 00 00       	call   c010732a <disp_int>
c01014f9:	83 c4 10             	add    $0x10,%esp
c01014fc:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0101501:	83 f8 01             	cmp    $0x1,%eax
c0101504:	75 03                	jne    c0101509 <debug_ticks+0x3b>
c0101506:	66 87 db             	xchg   %bx,%bx
c0101509:	90                   	nop
c010150a:	c9                   	leave  
c010150b:	c3                   	ret    

c010150c <net_handler>:
c010150c:	55                   	push   %ebp
c010150d:	89 e5                	mov    %esp,%ebp
c010150f:	83 ec 28             	sub    $0x28,%esp
c0101512:	e8 61 94 00 00       	call   c010a978 <get_interrupt_status>
c0101517:	88 45 db             	mov    %al,-0x25(%ebp)
c010151a:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
c010151e:	83 ec 04             	sub    $0x4,%esp
c0101521:	6a 01                	push   $0x1
c0101523:	8d 45 db             	lea    -0x25(%ebp),%eax
c0101526:	50                   	push   %eax
c0101527:	8d 45 da             	lea    -0x26(%ebp),%eax
c010152a:	50                   	push   %eax
c010152b:	e8 0c 5a 00 00       	call   c0106f3c <Memcpy>
c0101530:	83 c4 10             	add    $0x10,%esp
c0101533:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010153a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010153d:	83 ec 0c             	sub    $0xc,%esp
c0101540:	50                   	push   %eax
c0101541:	e8 46 03 00 00       	call   c010188c <sys_malloc>
c0101546:	83 c4 10             	add    $0x10,%esp
c0101549:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010154c:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
c0101550:	83 e0 01             	and    $0x1,%eax
c0101553:	84 c0                	test   %al,%al
c0101555:	0f 84 3b 01 00 00    	je     c0101696 <net_handler+0x18a>
c010155b:	83 ec 0c             	sub    $0xc,%esp
c010155e:	68 48 b2 10 c0       	push   $0xc010b248
c0101563:	e8 71 eb ff ff       	call   c01000d9 <disp_str>
c0101568:	83 c4 10             	add    $0x10,%esp
c010156b:	83 ec 0c             	sub    $0xc,%esp
c010156e:	68 6e b2 10 c0       	push   $0xc010b26e
c0101573:	e8 61 eb ff ff       	call   c01000d9 <disp_str>
c0101578:	83 c4 10             	add    $0x10,%esp
c010157b:	c7 45 f4 00 40 00 00 	movl   $0x4000,-0xc(%ebp)
c0101582:	e8 20 94 00 00       	call   c010a9a7 <get_curr_page>
c0101587:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010158a:	83 ec 0c             	sub    $0xc,%esp
c010158d:	68 7f b2 10 c0       	push   $0xc010b27f
c0101592:	e8 42 eb ff ff       	call   c01000d9 <disp_str>
c0101597:	83 c4 10             	add    $0x10,%esp
c010159a:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c010159e:	83 ec 0c             	sub    $0xc,%esp
c01015a1:	50                   	push   %eax
c01015a2:	e8 83 5d 00 00       	call   c010732a <disp_int>
c01015a7:	83 c4 10             	add    $0x10,%esp
c01015aa:	83 ec 0c             	sub    $0xc,%esp
c01015ad:	68 81 b2 10 c0       	push   $0xc010b281
c01015b2:	e8 22 eb ff ff       	call   c01000d9 <disp_str>
c01015b7:	83 c4 10             	add    $0x10,%esp
c01015ba:	66 87 db             	xchg   %bx,%bx
c01015bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01015c4:	e9 b3 00 00 00       	jmp    c010167c <net_handler+0x170>
c01015c9:	83 ec 04             	sub    $0x4,%esp
c01015cc:	ff 75 e8             	pushl  -0x18(%ebp)
c01015cf:	6a 00                	push   $0x0
c01015d1:	ff 75 e4             	pushl  -0x1c(%ebp)
c01015d4:	e8 96 ac 00 00       	call   c010c26f <Memset>
c01015d9:	83 c4 10             	add    $0x10,%esp
c01015dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01015df:	01 45 f4             	add    %eax,-0xc(%ebp)
c01015e2:	83 ec 0c             	sub    $0xc,%esp
c01015e5:	ff 75 f4             	pushl  -0xc(%ebp)
c01015e8:	e8 80 92 00 00       	call   c010a86d <SetPageStart>
c01015ed:	83 c4 10             	add    $0x10,%esp
c01015f0:	83 ec 0c             	sub    $0xc,%esp
c01015f3:	ff 75 e4             	pushl  -0x1c(%ebp)
c01015f6:	e8 c9 93 00 00       	call   c010a9c4 <NICtoPC>
c01015fb:	83 c4 10             	add    $0x10,%esp
c01015fe:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101601:	c7 45 dc 40 00 00 00 	movl   $0x40,-0x24(%ebp)
c0101608:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010160f:	eb 2e                	jmp    c010163f <net_handler+0x133>
c0101611:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101614:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101617:	01 d0                	add    %edx,%eax
c0101619:	0f b6 00             	movzbl (%eax),%eax
c010161c:	0f b6 c0             	movzbl %al,%eax
c010161f:	83 ec 0c             	sub    $0xc,%esp
c0101622:	50                   	push   %eax
c0101623:	e8 02 5d 00 00       	call   c010732a <disp_int>
c0101628:	83 c4 10             	add    $0x10,%esp
c010162b:	83 ec 0c             	sub    $0xc,%esp
c010162e:	68 84 b2 10 c0       	push   $0xc010b284
c0101633:	e8 a1 ea ff ff       	call   c01000d9 <disp_str>
c0101638:	83 c4 10             	add    $0x10,%esp
c010163b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010163f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101642:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0101645:	77 ca                	ja     c0101611 <net_handler+0x105>
c0101647:	83 ec 08             	sub    $0x8,%esp
c010164a:	ff 75 dc             	pushl  -0x24(%ebp)
c010164d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101650:	e8 37 ea ff ff       	call   c010008c <disp_str_len>
c0101655:	83 c4 10             	add    $0x10,%esp
c0101658:	83 ec 0c             	sub    $0xc,%esp
c010165b:	68 86 b2 10 c0       	push   $0xc010b286
c0101660:	e8 74 ea ff ff       	call   c01000d9 <disp_str>
c0101665:	83 c4 10             	add    $0x10,%esp
c0101668:	83 ec 0c             	sub    $0xc,%esp
c010166b:	68 86 b2 10 c0       	push   $0xc010b286
c0101670:	e8 64 ea ff ff       	call   c01000d9 <disp_str>
c0101675:	83 c4 10             	add    $0x10,%esp
c0101678:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010167c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0101680:	0f 88 43 ff ff ff    	js     c01015c9 <net_handler+0xbd>
c0101686:	83 ec 0c             	sub    $0xc,%esp
c0101689:	68 88 b2 10 c0       	push   $0xc010b288
c010168e:	e8 46 ea ff ff       	call   c01000d9 <disp_str>
c0101693:	83 c4 10             	add    $0x10,%esp
c0101696:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
c010169a:	83 e0 40             	and    $0x40,%eax
c010169d:	84 c0                	test   %al,%al
c010169f:	74 30                	je     c01016d1 <net_handler+0x1c5>
c01016a1:	83 ec 0c             	sub    $0xc,%esp
c01016a4:	68 ac b2 10 c0       	push   $0xc010b2ac
c01016a9:	e8 2b ea ff ff       	call   c01000d9 <disp_str>
c01016ae:	83 c4 10             	add    $0x10,%esp
c01016b1:	83 ec 0c             	sub    $0xc,%esp
c01016b4:	68 d1 b2 10 c0       	push   $0xc010b2d1
c01016b9:	e8 1b ea ff ff       	call   c01000d9 <disp_str>
c01016be:	83 c4 10             	add    $0x10,%esp
c01016c1:	83 ec 0c             	sub    $0xc,%esp
c01016c4:	68 e0 b2 10 c0       	push   $0xc010b2e0
c01016c9:	e8 0b ea ff ff       	call   c01000d9 <disp_str>
c01016ce:	83 c4 10             	add    $0x10,%esp
c01016d1:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01016d5:	0f b6 c0             	movzbl %al,%eax
c01016d8:	83 ec 0c             	sub    $0xc,%esp
c01016db:	50                   	push   %eax
c01016dc:	e8 ad 92 00 00       	call   c010a98e <set_interrupt_status>
c01016e1:	83 c4 10             	add    $0x10,%esp
c01016e4:	90                   	nop
c01016e5:	c9                   	leave  
c01016e6:	c3                   	ret    

c01016e7 <waitfor>:
c01016e7:	55                   	push   %ebp
c01016e8:	89 e5                	mov    %esp,%ebp
c01016ea:	83 ec 18             	sub    $0x18,%esp
c01016ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01016f4:	eb 26                	jmp    c010171c <waitfor+0x35>
c01016f6:	83 ec 0c             	sub    $0xc,%esp
c01016f9:	68 f7 01 00 00       	push   $0x1f7
c01016fe:	e8 2f ec ff ff       	call   c0100332 <in_byte>
c0101703:	83 c4 10             	add    $0x10,%esp
c0101706:	0f b6 c0             	movzbl %al,%eax
c0101709:	23 45 08             	and    0x8(%ebp),%eax
c010170c:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010170f:	75 07                	jne    c0101718 <waitfor+0x31>
c0101711:	b8 01 00 00 00       	mov    $0x1,%eax
c0101716:	eb 11                	jmp    c0101729 <waitfor+0x42>
c0101718:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010171c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010171f:	3b 45 10             	cmp    0x10(%ebp),%eax
c0101722:	7c d2                	jl     c01016f6 <waitfor+0xf>
c0101724:	b8 00 00 00 00       	mov    $0x0,%eax
c0101729:	c9                   	leave  
c010172a:	c3                   	ret    

c010172b <print_hd_info>:
c010172b:	55                   	push   %ebp
c010172c:	89 e5                	mov    %esp,%ebp
c010172e:	83 ec 18             	sub    $0x18,%esp
c0101731:	83 ec 0c             	sub    $0xc,%esp
c0101734:	68 05 b3 10 c0       	push   $0xc010b305
c0101739:	e8 ba 70 00 00       	call   c01087f8 <Printf>
c010173e:	83 c4 10             	add    $0x10,%esp
c0101741:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101748:	eb 3b                	jmp    c0101785 <print_hd_info+0x5a>
c010174a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010174d:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101754:	85 c0                	test   %eax,%eax
c0101756:	74 28                	je     c0101780 <print_hd_info+0x55>
c0101758:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010175b:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101762:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101765:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c010176c:	ff 75 f4             	pushl  -0xc(%ebp)
c010176f:	52                   	push   %edx
c0101770:	50                   	push   %eax
c0101771:	68 22 b3 10 c0       	push   $0xc010b322
c0101776:	e8 7d 70 00 00       	call   c01087f8 <Printf>
c010177b:	83 c4 10             	add    $0x10,%esp
c010177e:	eb 01                	jmp    c0101781 <print_hd_info+0x56>
c0101780:	90                   	nop
c0101781:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101785:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0101789:	7e bf                	jle    c010174a <print_hd_info+0x1f>
c010178b:	83 ec 0c             	sub    $0xc,%esp
c010178e:	68 3a b3 10 c0       	push   $0xc010b33a
c0101793:	e8 60 70 00 00       	call   c01087f8 <Printf>
c0101798:	83 c4 10             	add    $0x10,%esp
c010179b:	83 ec 0c             	sub    $0xc,%esp
c010179e:	68 55 b3 10 c0       	push   $0xc010b355
c01017a3:	e8 50 70 00 00       	call   c01087f8 <Printf>
c01017a8:	83 c4 10             	add    $0x10,%esp
c01017ab:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c01017b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01017b9:	eb 44                	jmp    c01017ff <print_hd_info+0xd4>
c01017bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017be:	83 c0 04             	add    $0x4,%eax
c01017c1:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01017c8:	85 c0                	test   %eax,%eax
c01017ca:	74 2e                	je     c01017fa <print_hd_info+0xcf>
c01017cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017cf:	83 c0 04             	add    $0x4,%eax
c01017d2:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01017d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017dc:	83 c0 04             	add    $0x4,%eax
c01017df:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01017e6:	ff 75 f0             	pushl  -0x10(%ebp)
c01017e9:	52                   	push   %edx
c01017ea:	50                   	push   %eax
c01017eb:	68 22 b3 10 c0       	push   $0xc010b322
c01017f0:	e8 03 70 00 00       	call   c01087f8 <Printf>
c01017f5:	83 c4 10             	add    $0x10,%esp
c01017f8:	eb 01                	jmp    c01017fb <print_hd_info+0xd0>
c01017fa:	90                   	nop
c01017fb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01017ff:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101803:	7e b6                	jle    c01017bb <print_hd_info+0x90>
c0101805:	83 ec 0c             	sub    $0xc,%esp
c0101808:	68 72 b3 10 c0       	push   $0xc010b372
c010180d:	e8 e6 6f 00 00       	call   c01087f8 <Printf>
c0101812:	83 c4 10             	add    $0x10,%esp
c0101815:	90                   	nop
c0101816:	c9                   	leave  
c0101817:	c3                   	ret    

c0101818 <is_empty>:
c0101818:	55                   	push   %ebp
c0101819:	89 e5                	mov    %esp,%ebp
c010181b:	83 ec 10             	sub    $0x10,%esp
c010181e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0101825:	eb 1a                	jmp    c0101841 <is_empty+0x29>
c0101827:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010182a:	8b 45 08             	mov    0x8(%ebp),%eax
c010182d:	01 d0                	add    %edx,%eax
c010182f:	0f b6 00             	movzbl (%eax),%eax
c0101832:	84 c0                	test   %al,%al
c0101834:	74 07                	je     c010183d <is_empty+0x25>
c0101836:	b8 00 00 00 00       	mov    $0x0,%eax
c010183b:	eb 11                	jmp    c010184e <is_empty+0x36>
c010183d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0101841:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101844:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101847:	7c de                	jl     c0101827 <is_empty+0xf>
c0101849:	b8 01 00 00 00       	mov    $0x1,%eax
c010184e:	c9                   	leave  
c010184f:	c3                   	ret    

c0101850 <write_debug>:
c0101850:	b8 02 00 00 00       	mov    $0x2,%eax
c0101855:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101859:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010185d:	cd 90                	int    $0x90
c010185f:	c3                   	ret    

c0101860 <send_msg>:
c0101860:	55                   	push   %ebp
c0101861:	89 e5                	mov    %esp,%ebp
c0101863:	53                   	push   %ebx
c0101864:	51                   	push   %ecx
c0101865:	b8 03 00 00 00       	mov    $0x3,%eax
c010186a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010186d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101870:	cd 90                	int    $0x90
c0101872:	59                   	pop    %ecx
c0101873:	5b                   	pop    %ebx
c0101874:	5d                   	pop    %ebp
c0101875:	c3                   	ret    

c0101876 <receive_msg>:
c0101876:	55                   	push   %ebp
c0101877:	89 e5                	mov    %esp,%ebp
c0101879:	53                   	push   %ebx
c010187a:	51                   	push   %ecx
c010187b:	b8 04 00 00 00       	mov    $0x4,%eax
c0101880:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101883:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101886:	cd 90                	int    $0x90
c0101888:	59                   	pop    %ecx
c0101889:	5b                   	pop    %ebx
c010188a:	5d                   	pop    %ebp
c010188b:	c3                   	ret    

c010188c <sys_malloc>:
c010188c:	56                   	push   %esi
c010188d:	57                   	push   %edi
c010188e:	53                   	push   %ebx
c010188f:	55                   	push   %ebp
c0101890:	89 e5                	mov    %esp,%ebp
c0101892:	b8 05 00 00 00       	mov    $0x5,%eax
c0101897:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010189a:	cd 90                	int    $0x90
c010189c:	5d                   	pop    %ebp
c010189d:	5b                   	pop    %ebx
c010189e:	5f                   	pop    %edi
c010189f:	5e                   	pop    %esi
c01018a0:	c3                   	ret    

c01018a1 <sys_free>:
c01018a1:	56                   	push   %esi
c01018a2:	57                   	push   %edi
c01018a3:	53                   	push   %ebx
c01018a4:	55                   	push   %ebp
c01018a5:	89 e5                	mov    %esp,%ebp
c01018a7:	b8 06 00 00 00       	mov    $0x6,%eax
c01018ac:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01018af:	8b 5d 18             	mov    0x18(%ebp),%ebx
c01018b2:	cd 90                	int    $0x90
c01018b4:	5d                   	pop    %ebp
c01018b5:	5b                   	pop    %ebx
c01018b6:	5f                   	pop    %edi
c01018b7:	5e                   	pop    %esi
c01018b8:	c3                   	ret    

c01018b9 <task_fs>:
c01018b9:	55                   	push   %ebp
c01018ba:	89 e5                	mov    %esp,%ebp
c01018bc:	83 ec 28             	sub    $0x28,%esp
c01018bf:	e8 bb 08 00 00       	call   c010217f <init_fs>
c01018c4:	83 ec 0c             	sub    $0xc,%esp
c01018c7:	6a 7c                	push   $0x7c
c01018c9:	e8 be ff ff ff       	call   c010188c <sys_malloc>
c01018ce:	83 c4 10             	add    $0x10,%esp
c01018d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01018d4:	83 ec 0c             	sub    $0xc,%esp
c01018d7:	6a 7c                	push   $0x7c
c01018d9:	e8 ae ff ff ff       	call   c010188c <sys_malloc>
c01018de:	83 c4 10             	add    $0x10,%esp
c01018e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01018e4:	83 ec 04             	sub    $0x4,%esp
c01018e7:	6a 7c                	push   $0x7c
c01018e9:	6a 00                	push   $0x0
c01018eb:	ff 75 f4             	pushl  -0xc(%ebp)
c01018ee:	e8 7c a9 00 00       	call   c010c26f <Memset>
c01018f3:	83 c4 10             	add    $0x10,%esp
c01018f6:	83 ec 04             	sub    $0x4,%esp
c01018f9:	6a 12                	push   $0x12
c01018fb:	ff 75 f4             	pushl  -0xc(%ebp)
c01018fe:	6a 02                	push   $0x2
c0101900:	e8 c0 7e 00 00       	call   c01097c5 <send_rec>
c0101905:	83 c4 10             	add    $0x10,%esp
c0101908:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010190b:	8b 40 78             	mov    0x78(%eax),%eax
c010190e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101911:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101914:	8b 00                	mov    (%eax),%eax
c0101916:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101919:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010191c:	8b 40 50             	mov    0x50(%eax),%eax
c010191f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101922:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101925:	8b 40 68             	mov    0x68(%eax),%eax
c0101928:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010192b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010192e:	8b 00                	mov    (%eax),%eax
c0101930:	85 c0                	test   %eax,%eax
c0101932:	75 07                	jne    c010193b <task_fs+0x82>
c0101934:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010193b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101942:	83 ec 0c             	sub    $0xc,%esp
c0101945:	ff 75 e8             	pushl  -0x18(%ebp)
c0101948:	e8 39 21 00 00       	call   c0103a86 <pid2proc>
c010194d:	83 c4 10             	add    $0x10,%esp
c0101950:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101955:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101959:	74 37                	je     c0101992 <task_fs+0xd9>
c010195b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010195f:	74 31                	je     c0101992 <task_fs+0xd9>
c0101961:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101965:	74 2b                	je     c0101992 <task_fs+0xd9>
c0101967:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010196b:	74 25                	je     c0101992 <task_fs+0xd9>
c010196d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101971:	74 1f                	je     c0101992 <task_fs+0xd9>
c0101973:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101977:	74 19                	je     c0101992 <task_fs+0xd9>
c0101979:	6a 7a                	push   $0x7a
c010197b:	68 94 b3 10 c0       	push   $0xc010b394
c0101980:	68 94 b3 10 c0       	push   $0xc010b394
c0101985:	68 a4 b3 10 c0       	push   $0xc010b3a4
c010198a:	e8 c6 71 00 00       	call   c0108b55 <assertion_failure>
c010198f:	83 c4 10             	add    $0x10,%esp
c0101992:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101996:	74 3a                	je     c01019d2 <task_fs+0x119>
c0101998:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010199c:	7f 19                	jg     c01019b7 <task_fs+0xfe>
c010199e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01019a2:	0f 84 10 01 00 00    	je     c0101ab8 <task_fs+0x1ff>
c01019a8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01019ac:	0f 84 a1 00 00 00    	je     c0101a53 <task_fs+0x19a>
c01019b2:	e9 ef 00 00 00       	jmp    c0101aa6 <task_fs+0x1ed>
c01019b7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01019bb:	74 50                	je     c0101a0d <task_fs+0x154>
c01019bd:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01019c1:	0f 84 c6 00 00 00    	je     c0101a8d <task_fs+0x1d4>
c01019c7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01019cb:	74 40                	je     c0101a0d <task_fs+0x154>
c01019cd:	e9 d4 00 00 00       	jmp    c0101aa6 <task_fs+0x1ed>
c01019d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019d5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01019dc:	83 ec 0c             	sub    $0xc,%esp
c01019df:	ff 75 f4             	pushl  -0xc(%ebp)
c01019e2:	e8 ec 07 00 00       	call   c01021d3 <do_open>
c01019e7:	83 c4 10             	add    $0x10,%esp
c01019ea:	89 c2                	mov    %eax,%edx
c01019ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019ef:	89 50 50             	mov    %edx,0x50(%eax)
c01019f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019f5:	8b 00                	mov    (%eax),%eax
c01019f7:	83 ec 04             	sub    $0x4,%esp
c01019fa:	50                   	push   %eax
c01019fb:	ff 75 f4             	pushl  -0xc(%ebp)
c01019fe:	6a 01                	push   $0x1
c0101a00:	e8 c0 7d 00 00       	call   c01097c5 <send_rec>
c0101a05:	83 c4 10             	add    $0x10,%esp
c0101a08:	e9 b2 00 00 00       	jmp    c0101abf <task_fs+0x206>
c0101a0d:	83 ec 0c             	sub    $0xc,%esp
c0101a10:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a13:	e8 19 19 00 00       	call   c0103331 <do_rdwt>
c0101a18:	83 c4 10             	add    $0x10,%esp
c0101a1b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101a1e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101a22:	0f 84 96 00 00 00    	je     c0101abe <task_fs+0x205>
c0101a28:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a2b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101a32:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101a35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a38:	89 50 60             	mov    %edx,0x60(%eax)
c0101a3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a3e:	8b 00                	mov    (%eax),%eax
c0101a40:	83 ec 04             	sub    $0x4,%esp
c0101a43:	50                   	push   %eax
c0101a44:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a47:	6a 01                	push   $0x1
c0101a49:	e8 77 7d 00 00       	call   c01097c5 <send_rec>
c0101a4e:	83 c4 10             	add    $0x10,%esp
c0101a51:	eb 6b                	jmp    c0101abe <task_fs+0x205>
c0101a53:	83 ec 0c             	sub    $0xc,%esp
c0101a56:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101a59:	e8 f0 1d 00 00       	call   c010384e <do_close>
c0101a5e:	83 c4 10             	add    $0x10,%esp
c0101a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a64:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a6e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101a75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a78:	8b 00                	mov    (%eax),%eax
c0101a7a:	83 ec 04             	sub    $0x4,%esp
c0101a7d:	50                   	push   %eax
c0101a7e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a81:	6a 01                	push   $0x1
c0101a83:	e8 3d 7d 00 00       	call   c01097c5 <send_rec>
c0101a88:	83 c4 10             	add    $0x10,%esp
c0101a8b:	eb 32                	jmp    c0101abf <task_fs+0x206>
c0101a8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a90:	8b 40 68             	mov    0x68(%eax),%eax
c0101a93:	83 ec 04             	sub    $0x4,%esp
c0101a96:	50                   	push   %eax
c0101a97:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a9a:	6a 01                	push   $0x1
c0101a9c:	e8 24 7d 00 00       	call   c01097c5 <send_rec>
c0101aa1:	83 c4 10             	add    $0x10,%esp
c0101aa4:	eb 19                	jmp    c0101abf <task_fs+0x206>
c0101aa6:	83 ec 0c             	sub    $0xc,%esp
c0101aa9:	68 07 b4 10 c0       	push   $0xc010b407
c0101aae:	e8 84 70 00 00       	call   c0108b37 <panic>
c0101ab3:	83 c4 10             	add    $0x10,%esp
c0101ab6:	eb 07                	jmp    c0101abf <task_fs+0x206>
c0101ab8:	90                   	nop
c0101ab9:	e9 26 fe ff ff       	jmp    c01018e4 <task_fs+0x2b>
c0101abe:	90                   	nop
c0101abf:	e9 20 fe ff ff       	jmp    c01018e4 <task_fs+0x2b>

c0101ac4 <rd_wt>:
c0101ac4:	55                   	push   %ebp
c0101ac5:	89 e5                	mov    %esp,%ebp
c0101ac7:	83 ec 18             	sub    $0x18,%esp
c0101aca:	83 ec 0c             	sub    $0xc,%esp
c0101acd:	6a 7c                	push   $0x7c
c0101acf:	e8 b8 fd ff ff       	call   c010188c <sys_malloc>
c0101ad4:	83 c4 10             	add    $0x10,%esp
c0101ad7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101ada:	83 ec 04             	sub    $0x4,%esp
c0101add:	6a 7c                	push   $0x7c
c0101adf:	6a 00                	push   $0x0
c0101ae1:	ff 75 f4             	pushl  -0xc(%ebp)
c0101ae4:	e8 86 a7 00 00       	call   c010c26f <Memset>
c0101ae9:	83 c4 10             	add    $0x10,%esp
c0101aec:	8b 55 18             	mov    0x18(%ebp),%edx
c0101aef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101af2:	89 50 78             	mov    %edx,0x78(%eax)
c0101af5:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101af8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101afb:	89 50 14             	mov    %edx,0x14(%eax)
c0101afe:	8b 55 10             	mov    0x10(%ebp),%edx
c0101b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b04:	89 50 10             	mov    %edx,0x10(%eax)
c0101b07:	8b 55 14             	mov    0x14(%ebp),%edx
c0101b0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b0d:	89 50 0c             	mov    %edx,0xc(%eax)
c0101b10:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b13:	c1 e0 09             	shl    $0x9,%eax
c0101b16:	89 c2                	mov    %eax,%edx
c0101b18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b1b:	89 50 18             	mov    %edx,0x18(%eax)
c0101b1e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101b22:	74 22                	je     c0101b46 <rd_wt+0x82>
c0101b24:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101b28:	74 1c                	je     c0101b46 <rd_wt+0x82>
c0101b2a:	68 b1 00 00 00       	push   $0xb1
c0101b2f:	68 94 b3 10 c0       	push   $0xc010b394
c0101b34:	68 94 b3 10 c0       	push   $0xc010b394
c0101b39:	68 1a b4 10 c0       	push   $0xc010b41a
c0101b3e:	e8 12 70 00 00       	call   c0108b55 <assertion_failure>
c0101b43:	83 c4 10             	add    $0x10,%esp
c0101b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b49:	8b 40 78             	mov    0x78(%eax),%eax
c0101b4c:	83 f8 07             	cmp    $0x7,%eax
c0101b4f:	74 27                	je     c0101b78 <rd_wt+0xb4>
c0101b51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b54:	8b 40 78             	mov    0x78(%eax),%eax
c0101b57:	83 f8 0a             	cmp    $0xa,%eax
c0101b5a:	74 1c                	je     c0101b78 <rd_wt+0xb4>
c0101b5c:	68 b2 00 00 00       	push   $0xb2
c0101b61:	68 94 b3 10 c0       	push   $0xc010b394
c0101b66:	68 94 b3 10 c0       	push   $0xc010b394
c0101b6b:	68 38 b4 10 c0       	push   $0xc010b438
c0101b70:	e8 e0 6f 00 00       	call   c0108b55 <assertion_failure>
c0101b75:	83 c4 10             	add    $0x10,%esp
c0101b78:	83 ec 04             	sub    $0x4,%esp
c0101b7b:	6a 03                	push   $0x3
c0101b7d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101b80:	6a 03                	push   $0x3
c0101b82:	e8 3e 7c 00 00       	call   c01097c5 <send_rec>
c0101b87:	83 c4 10             	add    $0x10,%esp
c0101b8a:	83 ec 08             	sub    $0x8,%esp
c0101b8d:	6a 7c                	push   $0x7c
c0101b8f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101b92:	e8 0a fd ff ff       	call   c01018a1 <sys_free>
c0101b97:	83 c4 10             	add    $0x10,%esp
c0101b9a:	90                   	nop
c0101b9b:	c9                   	leave  
c0101b9c:	c3                   	ret    

c0101b9d <mkfs>:
c0101b9d:	55                   	push   %ebp
c0101b9e:	89 e5                	mov    %esp,%ebp
c0101ba0:	57                   	push   %edi
c0101ba1:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101ba7:	83 ec 0c             	sub    $0xc,%esp
c0101baa:	68 00 80 00 00       	push   $0x8000
c0101baf:	e8 d8 fc ff ff       	call   c010188c <sys_malloc>
c0101bb4:	83 c4 10             	add    $0x10,%esp
c0101bb7:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c0101bbc:	83 ec 0c             	sub    $0xc,%esp
c0101bbf:	6a 24                	push   $0x24
c0101bc1:	e8 c6 fc ff ff       	call   c010188c <sys_malloc>
c0101bc6:	83 c4 10             	add    $0x10,%esp
c0101bc9:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c0101bce:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101bd3:	83 ec 0c             	sub    $0xc,%esp
c0101bd6:	50                   	push   %eax
c0101bd7:	e8 42 46 00 00       	call   c010621e <get_physical_address>
c0101bdc:	83 c4 10             	add    $0x10,%esp
c0101bdf:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101be4:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101be9:	83 ec 0c             	sub    $0xc,%esp
c0101bec:	50                   	push   %eax
c0101bed:	e8 2c 46 00 00       	call   c010621e <get_physical_address>
c0101bf2:	83 c4 10             	add    $0x10,%esp
c0101bf5:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c0101bfa:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101bff:	83 ec 04             	sub    $0x4,%esp
c0101c02:	68 00 02 00 00       	push   $0x200
c0101c07:	6a 00                	push   $0x0
c0101c09:	50                   	push   %eax
c0101c0a:	e8 60 a6 00 00       	call   c010c26f <Memset>
c0101c0f:	83 c4 10             	add    $0x10,%esp
c0101c12:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c17:	83 ec 0c             	sub    $0xc,%esp
c0101c1a:	6a 0a                	push   $0xa
c0101c1c:	68 00 02 00 00       	push   $0x200
c0101c21:	50                   	push   %eax
c0101c22:	6a 20                	push   $0x20
c0101c24:	6a 00                	push   $0x0
c0101c26:	e8 99 fe ff ff       	call   c0101ac4 <rd_wt>
c0101c2b:	83 c4 20             	add    $0x20,%esp
c0101c2e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c33:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101c36:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c39:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101c40:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c43:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0101c4a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c4d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101c54:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c57:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101c5e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c61:	8b 40 04             	mov    0x4(%eax),%eax
c0101c64:	8d 50 02             	lea    0x2(%eax),%edx
c0101c67:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c6a:	8b 40 08             	mov    0x8(%eax),%eax
c0101c6d:	01 c2                	add    %eax,%edx
c0101c6f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c72:	8b 40 0c             	mov    0xc(%eax),%eax
c0101c75:	01 c2                	add    %eax,%edx
c0101c77:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c7a:	89 10                	mov    %edx,(%eax)
c0101c7c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101c83:	b8 00 02 00 00       	mov    $0x200,%eax
c0101c88:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101c8b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101c91:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101c94:	01 ca                	add    %ecx,%edx
c0101c96:	83 ec 04             	sub    $0x4,%esp
c0101c99:	50                   	push   %eax
c0101c9a:	6a 80                	push   $0xffffff80
c0101c9c:	52                   	push   %edx
c0101c9d:	e8 cd a5 00 00       	call   c010c26f <Memset>
c0101ca2:	83 c4 10             	add    $0x10,%esp
c0101ca5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101caa:	83 ec 0c             	sub    $0xc,%esp
c0101cad:	6a 0a                	push   $0xa
c0101caf:	68 00 02 00 00       	push   $0x200
c0101cb4:	50                   	push   %eax
c0101cb5:	6a 20                	push   $0x20
c0101cb7:	6a 01                	push   $0x1
c0101cb9:	e8 06 fe ff ff       	call   c0101ac4 <rd_wt>
c0101cbe:	83 c4 20             	add    $0x20,%esp
c0101cc1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101cc4:	8b 10                	mov    (%eax),%edx
c0101cc6:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101cc9:	8b 50 04             	mov    0x4(%eax),%edx
c0101ccc:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101ccf:	8b 50 08             	mov    0x8(%eax),%edx
c0101cd2:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101cd5:	8b 50 0c             	mov    0xc(%eax),%edx
c0101cd8:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101cdb:	8b 50 10             	mov    0x10(%eax),%edx
c0101cde:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101ce1:	8b 50 14             	mov    0x14(%eax),%edx
c0101ce4:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101ce7:	8b 50 18             	mov    0x18(%eax),%edx
c0101cea:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101ced:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101cf0:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101cf3:	8b 40 20             	mov    0x20(%eax),%eax
c0101cf6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101cf9:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101cfd:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101d01:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d06:	83 ec 04             	sub    $0x4,%esp
c0101d09:	6a 01                	push   $0x1
c0101d0b:	52                   	push   %edx
c0101d0c:	50                   	push   %eax
c0101d0d:	e8 5d a5 00 00       	call   c010c26f <Memset>
c0101d12:	83 c4 10             	add    $0x10,%esp
c0101d15:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d1a:	83 c0 01             	add    $0x1,%eax
c0101d1d:	83 ec 04             	sub    $0x4,%esp
c0101d20:	68 ff 01 00 00       	push   $0x1ff
c0101d25:	6a 80                	push   $0xffffff80
c0101d27:	50                   	push   %eax
c0101d28:	e8 42 a5 00 00       	call   c010c26f <Memset>
c0101d2d:	83 c4 10             	add    $0x10,%esp
c0101d30:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d35:	83 ec 0c             	sub    $0xc,%esp
c0101d38:	6a 0a                	push   $0xa
c0101d3a:	68 00 02 00 00       	push   $0x200
c0101d3f:	50                   	push   %eax
c0101d40:	6a 20                	push   $0x20
c0101d42:	6a 02                	push   $0x2
c0101d44:	e8 7b fd ff ff       	call   c0101ac4 <rd_wt>
c0101d49:	83 c4 20             	add    $0x20,%esp
c0101d4c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101d53:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d58:	83 ec 04             	sub    $0x4,%esp
c0101d5b:	68 00 02 00 00       	push   $0x200
c0101d60:	6a ff                	push   $0xffffffff
c0101d62:	50                   	push   %eax
c0101d63:	e8 07 a5 00 00       	call   c010c26f <Memset>
c0101d68:	83 c4 10             	add    $0x10,%esp
c0101d6b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d70:	83 ec 0c             	sub    $0xc,%esp
c0101d73:	6a 0a                	push   $0xa
c0101d75:	68 00 02 00 00       	push   $0x200
c0101d7a:	50                   	push   %eax
c0101d7b:	6a 20                	push   $0x20
c0101d7d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101d80:	e8 3f fd ff ff       	call   c0101ac4 <rd_wt>
c0101d85:	83 c4 20             	add    $0x20,%esp
c0101d88:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d8d:	83 ec 04             	sub    $0x4,%esp
c0101d90:	6a 01                	push   $0x1
c0101d92:	6a 01                	push   $0x1
c0101d94:	50                   	push   %eax
c0101d95:	e8 d5 a4 00 00       	call   c010c26f <Memset>
c0101d9a:	83 c4 10             	add    $0x10,%esp
c0101d9d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101da2:	83 c0 01             	add    $0x1,%eax
c0101da5:	83 ec 04             	sub    $0x4,%esp
c0101da8:	68 ff 01 00 00       	push   $0x1ff
c0101dad:	6a 00                	push   $0x0
c0101daf:	50                   	push   %eax
c0101db0:	e8 ba a4 00 00       	call   c010c26f <Memset>
c0101db5:	83 c4 10             	add    $0x10,%esp
c0101db8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101dbd:	89 c2                	mov    %eax,%edx
c0101dbf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101dc2:	83 c0 01             	add    $0x1,%eax
c0101dc5:	83 ec 0c             	sub    $0xc,%esp
c0101dc8:	6a 0a                	push   $0xa
c0101dca:	68 00 02 00 00       	push   $0x200
c0101dcf:	52                   	push   %edx
c0101dd0:	6a 20                	push   $0x20
c0101dd2:	50                   	push   %eax
c0101dd3:	e8 ec fc ff ff       	call   c0101ac4 <rd_wt>
c0101dd8:	83 c4 20             	add    $0x20,%esp
c0101ddb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101dde:	83 e8 02             	sub    $0x2,%eax
c0101de1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101de4:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101deb:	eb 04                	jmp    c0101df1 <mkfs+0x254>
c0101ded:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101df1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101df4:	83 c0 01             	add    $0x1,%eax
c0101df7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101dfa:	7e f1                	jle    c0101ded <mkfs+0x250>
c0101dfc:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e01:	89 c2                	mov    %eax,%edx
c0101e03:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101e06:	83 c0 03             	add    $0x3,%eax
c0101e09:	83 ec 0c             	sub    $0xc,%esp
c0101e0c:	6a 0a                	push   $0xa
c0101e0e:	68 00 02 00 00       	push   $0x200
c0101e13:	52                   	push   %edx
c0101e14:	6a 20                	push   $0x20
c0101e16:	50                   	push   %eax
c0101e17:	e8 a8 fc ff ff       	call   c0101ac4 <rd_wt>
c0101e1c:	83 c4 20             	add    $0x20,%esp
c0101e1f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e24:	89 c2                	mov    %eax,%edx
c0101e26:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101e29:	83 c0 03             	add    $0x3,%eax
c0101e2c:	83 ec 0c             	sub    $0xc,%esp
c0101e2f:	6a 07                	push   $0x7
c0101e31:	68 00 02 00 00       	push   $0x200
c0101e36:	52                   	push   %edx
c0101e37:	6a 20                	push   $0x20
c0101e39:	50                   	push   %eax
c0101e3a:	e8 85 fc ff ff       	call   c0101ac4 <rd_wt>
c0101e3f:	83 c4 20             	add    $0x20,%esp
c0101e42:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101e47:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101e4a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e4d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101e53:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e56:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101e5d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101e60:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e63:	89 50 08             	mov    %edx,0x8(%eax)
c0101e66:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e69:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101e70:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e73:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101e7a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e7d:	8b 10                	mov    (%eax),%edx
c0101e7f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101e85:	8b 50 04             	mov    0x4(%eax),%edx
c0101e88:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101e8e:	8b 50 08             	mov    0x8(%eax),%edx
c0101e91:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101e97:	8b 50 0c             	mov    0xc(%eax),%edx
c0101e9a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101ea0:	8b 50 10             	mov    0x10(%eax),%edx
c0101ea3:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101ea9:	8b 50 14             	mov    0x14(%eax),%edx
c0101eac:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101eb2:	8b 50 18             	mov    0x18(%eax),%edx
c0101eb5:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101ebb:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101ebe:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101ec4:	8b 50 20             	mov    0x20(%eax),%edx
c0101ec7:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101ecd:	8b 40 24             	mov    0x24(%eax),%eax
c0101ed0:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101ed5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101edc:	eb 4c                	jmp    c0101f2a <mkfs+0x38d>
c0101ede:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ee3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101ee6:	83 c2 01             	add    $0x1,%edx
c0101ee9:	c1 e2 05             	shl    $0x5,%edx
c0101eec:	01 d0                	add    %edx,%eax
c0101eee:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101ef1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ef4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101efa:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101efd:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101f04:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f07:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101f0e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101f15:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101f18:	c1 e0 08             	shl    $0x8,%eax
c0101f1b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101f1e:	89 c2                	mov    %eax,%edx
c0101f20:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f23:	89 50 08             	mov    %edx,0x8(%eax)
c0101f26:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101f2a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101f2e:	7e ae                	jle    c0101ede <mkfs+0x341>
c0101f30:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101f37:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101f3d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101f42:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101f47:	89 d7                	mov    %edx,%edi
c0101f49:	f3 ab                	rep stos %eax,%es:(%edi)
c0101f4b:	c7 85 70 ff ff ff 60 	movl   $0xc010b460,-0x90(%ebp)
c0101f52:	b4 10 c0 
c0101f55:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101f5c:	eb 54                	jmp    c0101fb2 <mkfs+0x415>
c0101f5e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101f63:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101f66:	83 c2 04             	add    $0x4,%edx
c0101f69:	c1 e2 05             	shl    $0x5,%edx
c0101f6c:	01 d0                	add    %edx,%eax
c0101f6e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101f71:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f74:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101f7a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f7d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101f84:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101f87:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101f8a:	83 c2 01             	add    $0x1,%edx
c0101f8d:	c1 e2 0b             	shl    $0xb,%edx
c0101f90:	01 c2                	add    %eax,%edx
c0101f92:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f95:	89 50 08             	mov    %edx,0x8(%eax)
c0101f98:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f9b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101fa2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101fa5:	8d 50 05             	lea    0x5(%eax),%edx
c0101fa8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101fab:	89 50 10             	mov    %edx,0x10(%eax)
c0101fae:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101fb2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101fb5:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101fb8:	7c a4                	jl     c0101f5e <mkfs+0x3c1>
c0101fba:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101fbf:	89 c2                	mov    %eax,%edx
c0101fc1:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101fc4:	83 c0 03             	add    $0x3,%eax
c0101fc7:	83 ec 0c             	sub    $0xc,%esp
c0101fca:	6a 0a                	push   $0xa
c0101fcc:	68 00 02 00 00       	push   $0x200
c0101fd1:	52                   	push   %edx
c0101fd2:	6a 20                	push   $0x20
c0101fd4:	50                   	push   %eax
c0101fd5:	e8 ea fa ff ff       	call   c0101ac4 <rd_wt>
c0101fda:	83 c4 20             	add    $0x20,%esp
c0101fdd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101fe2:	89 c2                	mov    %eax,%edx
c0101fe4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101fe7:	83 ec 0c             	sub    $0xc,%esp
c0101fea:	6a 07                	push   $0x7
c0101fec:	68 00 02 00 00       	push   $0x200
c0101ff1:	52                   	push   %edx
c0101ff2:	6a 20                	push   $0x20
c0101ff4:	50                   	push   %eax
c0101ff5:	e8 ca fa ff ff       	call   c0101ac4 <rd_wt>
c0101ffa:	83 c4 20             	add    $0x20,%esp
c0101ffd:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0102004:	00 00 00 
c0102007:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c010200e:	2e 00 
c0102010:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102015:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0102018:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010201b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0102021:	83 ec 0c             	sub    $0xc,%esp
c0102024:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c010202a:	50                   	push   %eax
c010202b:	e8 78 a2 00 00       	call   c010c2a8 <Strlen>
c0102030:	83 c4 10             	add    $0x10,%esp
c0102033:	89 c1                	mov    %eax,%ecx
c0102035:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102038:	8d 50 04             	lea    0x4(%eax),%edx
c010203b:	83 ec 04             	sub    $0x4,%esp
c010203e:	51                   	push   %ecx
c010203f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0102045:	50                   	push   %eax
c0102046:	52                   	push   %edx
c0102047:	e8 f0 4e 00 00       	call   c0106f3c <Memcpy>
c010204c:	83 c4 10             	add    $0x10,%esp
c010204f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0102055:	b8 00 00 00 00       	mov    $0x0,%eax
c010205a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c010205f:	89 d7                	mov    %edx,%edi
c0102061:	f3 ab                	rep stos %eax,%es:(%edi)
c0102063:	c7 85 34 ff ff ff 6c 	movl   $0xc010b46c,-0xcc(%ebp)
c010206a:	b4 10 c0 
c010206d:	c7 85 38 ff ff ff 75 	movl   $0xc010b475,-0xc8(%ebp)
c0102074:	b4 10 c0 
c0102077:	c7 85 3c ff ff ff 7e 	movl   $0xc010b47e,-0xc4(%ebp)
c010207e:	b4 10 c0 
c0102081:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0102088:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010208f:	eb 49                	jmp    c01020da <mkfs+0x53d>
c0102091:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0102095:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102098:	8d 50 02             	lea    0x2(%eax),%edx
c010209b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010209e:	89 10                	mov    %edx,(%eax)
c01020a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01020a3:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c01020aa:	83 ec 0c             	sub    $0xc,%esp
c01020ad:	50                   	push   %eax
c01020ae:	e8 f5 a1 00 00       	call   c010c2a8 <Strlen>
c01020b3:	83 c4 10             	add    $0x10,%esp
c01020b6:	89 c1                	mov    %eax,%ecx
c01020b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01020bb:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c01020c2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01020c5:	83 c2 04             	add    $0x4,%edx
c01020c8:	83 ec 04             	sub    $0x4,%esp
c01020cb:	51                   	push   %ecx
c01020cc:	50                   	push   %eax
c01020cd:	52                   	push   %edx
c01020ce:	e8 69 4e 00 00       	call   c0106f3c <Memcpy>
c01020d3:	83 c4 10             	add    $0x10,%esp
c01020d6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01020da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01020dd:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c01020e0:	7c af                	jl     c0102091 <mkfs+0x4f4>
c01020e2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01020e9:	eb 66                	jmp    c0102151 <mkfs+0x5b4>
c01020eb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01020ee:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c01020f5:	83 ec 0c             	sub    $0xc,%esp
c01020f8:	50                   	push   %eax
c01020f9:	e8 aa a1 00 00       	call   c010c2a8 <Strlen>
c01020fe:	83 c4 10             	add    $0x10,%esp
c0102101:	85 c0                	test   %eax,%eax
c0102103:	74 47                	je     c010214c <mkfs+0x5af>
c0102105:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0102109:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010210c:	8d 50 05             	lea    0x5(%eax),%edx
c010210f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102112:	89 10                	mov    %edx,(%eax)
c0102114:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102117:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c010211e:	83 ec 0c             	sub    $0xc,%esp
c0102121:	50                   	push   %eax
c0102122:	e8 81 a1 00 00       	call   c010c2a8 <Strlen>
c0102127:	83 c4 10             	add    $0x10,%esp
c010212a:	89 c1                	mov    %eax,%ecx
c010212c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010212f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0102136:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102139:	83 c2 04             	add    $0x4,%edx
c010213c:	83 ec 04             	sub    $0x4,%esp
c010213f:	51                   	push   %ecx
c0102140:	50                   	push   %eax
c0102141:	52                   	push   %edx
c0102142:	e8 f5 4d 00 00       	call   c0106f3c <Memcpy>
c0102147:	83 c4 10             	add    $0x10,%esp
c010214a:	eb 01                	jmp    c010214d <mkfs+0x5b0>
c010214c:	90                   	nop
c010214d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0102151:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102154:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0102157:	7c 92                	jl     c01020eb <mkfs+0x54e>
c0102159:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010215e:	89 c2                	mov    %eax,%edx
c0102160:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102163:	83 ec 0c             	sub    $0xc,%esp
c0102166:	6a 0a                	push   $0xa
c0102168:	68 00 02 00 00       	push   $0x200
c010216d:	52                   	push   %edx
c010216e:	6a 20                	push   $0x20
c0102170:	50                   	push   %eax
c0102171:	e8 4e f9 ff ff       	call   c0101ac4 <rd_wt>
c0102176:	83 c4 20             	add    $0x20,%esp
c0102179:	90                   	nop
c010217a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c010217d:	c9                   	leave  
c010217e:	c3                   	ret    

c010217f <init_fs>:
c010217f:	55                   	push   %ebp
c0102180:	89 e5                	mov    %esp,%ebp
c0102182:	83 ec 18             	sub    $0x18,%esp
c0102185:	83 ec 0c             	sub    $0xc,%esp
c0102188:	6a 7c                	push   $0x7c
c010218a:	e8 fd f6 ff ff       	call   c010188c <sys_malloc>
c010218f:	83 c4 10             	add    $0x10,%esp
c0102192:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102195:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102198:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c010219f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01021a2:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c01021a9:	83 ec 04             	sub    $0x4,%esp
c01021ac:	6a 03                	push   $0x3
c01021ae:	ff 75 f4             	pushl  -0xc(%ebp)
c01021b1:	6a 03                	push   $0x3
c01021b3:	e8 0d 76 00 00       	call   c01097c5 <send_rec>
c01021b8:	83 c4 10             	add    $0x10,%esp
c01021bb:	e8 dd f9 ff ff       	call   c0101b9d <mkfs>
c01021c0:	83 ec 08             	sub    $0x8,%esp
c01021c3:	6a 7c                	push   $0x7c
c01021c5:	ff 75 f4             	pushl  -0xc(%ebp)
c01021c8:	e8 d4 f6 ff ff       	call   c01018a1 <sys_free>
c01021cd:	83 c4 10             	add    $0x10,%esp
c01021d0:	90                   	nop
c01021d1:	c9                   	leave  
c01021d2:	c3                   	ret    

c01021d3 <do_open>:
c01021d3:	55                   	push   %ebp
c01021d4:	89 e5                	mov    %esp,%ebp
c01021d6:	83 ec 68             	sub    $0x68,%esp
c01021d9:	83 ec 04             	sub    $0x4,%esp
c01021dc:	6a 0c                	push   $0xc
c01021de:	6a 00                	push   $0x0
c01021e0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01021e3:	50                   	push   %eax
c01021e4:	e8 86 a0 00 00       	call   c010c26f <Memset>
c01021e9:	83 c4 10             	add    $0x10,%esp
c01021ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01021ef:	8b 40 44             	mov    0x44(%eax),%eax
c01021f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01021f5:	83 ec 08             	sub    $0x8,%esp
c01021f8:	6a 0c                	push   $0xc
c01021fa:	ff 75 e4             	pushl  -0x1c(%ebp)
c01021fd:	e8 cd 3e 00 00       	call   c01060cf <alloc_virtual_memory>
c0102202:	83 c4 10             	add    $0x10,%esp
c0102205:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102208:	8b 45 08             	mov    0x8(%ebp),%eax
c010220b:	8b 40 40             	mov    0x40(%eax),%eax
c010220e:	89 c2                	mov    %eax,%edx
c0102210:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102213:	83 ec 04             	sub    $0x4,%esp
c0102216:	52                   	push   %edx
c0102217:	50                   	push   %eax
c0102218:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010221b:	50                   	push   %eax
c010221c:	e8 1b 4d 00 00       	call   c0106f3c <Memcpy>
c0102221:	83 c4 10             	add    $0x10,%esp
c0102224:	8b 45 08             	mov    0x8(%ebp),%eax
c0102227:	8b 40 40             	mov    0x40(%eax),%eax
c010222a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c010222f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102232:	8b 40 74             	mov    0x74(%eax),%eax
c0102235:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102238:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c010223f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102246:	eb 1f                	jmp    c0102267 <do_open+0x94>
c0102248:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010224d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102250:	83 c2 4c             	add    $0x4c,%edx
c0102253:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0102257:	85 c0                	test   %eax,%eax
c0102259:	75 08                	jne    c0102263 <do_open+0x90>
c010225b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010225e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102261:	eb 0a                	jmp    c010226d <do_open+0x9a>
c0102263:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102267:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c010226b:	7e db                	jle    c0102248 <do_open+0x75>
c010226d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0102271:	75 1c                	jne    c010228f <do_open+0xbc>
c0102273:	68 c6 01 00 00       	push   $0x1c6
c0102278:	68 94 b3 10 c0       	push   $0xc010b394
c010227d:	68 94 b3 10 c0       	push   $0xc010b394
c0102282:	68 87 b4 10 c0       	push   $0xc010b487
c0102287:	e8 c9 68 00 00       	call   c0108b55 <assertion_failure>
c010228c:	83 c4 10             	add    $0x10,%esp
c010228f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0102296:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010229d:	eb 1d                	jmp    c01022bc <do_open+0xe9>
c010229f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022a2:	c1 e0 04             	shl    $0x4,%eax
c01022a5:	05 88 13 11 c0       	add    $0xc0111388,%eax
c01022aa:	8b 00                	mov    (%eax),%eax
c01022ac:	85 c0                	test   %eax,%eax
c01022ae:	75 08                	jne    c01022b8 <do_open+0xe5>
c01022b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01022b6:	eb 0a                	jmp    c01022c2 <do_open+0xef>
c01022b8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01022bc:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c01022c0:	7e dd                	jle    c010229f <do_open+0xcc>
c01022c2:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c01022c6:	75 1c                	jne    c01022e4 <do_open+0x111>
c01022c8:	68 d2 01 00 00       	push   $0x1d2
c01022cd:	68 94 b3 10 c0       	push   $0xc010b394
c01022d2:	68 94 b3 10 c0       	push   $0xc010b394
c01022d7:	68 8f b4 10 c0       	push   $0xc010b48f
c01022dc:	e8 74 68 00 00       	call   c0108b55 <assertion_failure>
c01022e1:	83 c4 10             	add    $0x10,%esp
c01022e4:	83 ec 0c             	sub    $0xc,%esp
c01022e7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01022ea:	50                   	push   %eax
c01022eb:	e8 d2 00 00 00       	call   c01023c2 <search_file>
c01022f0:	83 c4 10             	add    $0x10,%esp
c01022f3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01022f6:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01022fa:	75 2b                	jne    c0102327 <do_open+0x154>
c01022fc:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0102300:	7e 10                	jle    c0102312 <do_open+0x13f>
c0102302:	83 ec 0c             	sub    $0xc,%esp
c0102305:	68 97 b4 10 c0       	push   $0xc010b497
c010230a:	e8 28 68 00 00       	call   c0108b37 <panic>
c010230f:	83 c4 10             	add    $0x10,%esp
c0102312:	83 ec 08             	sub    $0x8,%esp
c0102315:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102318:	50                   	push   %eax
c0102319:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010231c:	50                   	push   %eax
c010231d:	e8 60 04 00 00       	call   c0102782 <create_file>
c0102322:	83 c4 10             	add    $0x10,%esp
c0102325:	eb 25                	jmp    c010234c <do_open+0x179>
c0102327:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010232b:	75 0a                	jne    c0102337 <do_open+0x164>
c010232d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102332:	e9 89 00 00 00       	jmp    c01023c0 <do_open+0x1ed>
c0102337:	83 ec 08             	sub    $0x8,%esp
c010233a:	ff 75 d8             	pushl  -0x28(%ebp)
c010233d:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0102340:	50                   	push   %eax
c0102341:	e8 7a 02 00 00       	call   c01025c0 <get_inode>
c0102346:	83 c4 10             	add    $0x10,%esp
c0102349:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010234c:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0102351:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102354:	c1 e2 04             	shl    $0x4,%edx
c0102357:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010235d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102360:	83 c2 4c             	add    $0x4c,%edx
c0102363:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102367:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010236a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010236d:	c1 e2 04             	shl    $0x4,%edx
c0102370:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102376:	89 02                	mov    %eax,(%edx)
c0102378:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010237b:	c1 e0 04             	shl    $0x4,%eax
c010237e:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102383:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102389:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010238c:	c1 e0 04             	shl    $0x4,%eax
c010238f:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102394:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010239a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010239d:	c1 e0 04             	shl    $0x4,%eax
c01023a0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01023a5:	8b 00                	mov    (%eax),%eax
c01023a7:	8d 50 01             	lea    0x1(%eax),%edx
c01023aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023ad:	c1 e0 04             	shl    $0x4,%eax
c01023b0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01023b5:	89 10                	mov    %edx,(%eax)
c01023b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023ba:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01023bd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01023c0:	c9                   	leave  
c01023c1:	c3                   	ret    

c01023c2 <search_file>:
c01023c2:	55                   	push   %ebp
c01023c3:	89 e5                	mov    %esp,%ebp
c01023c5:	83 ec 68             	sub    $0x68,%esp
c01023c8:	83 ec 04             	sub    $0x4,%esp
c01023cb:	6a 0c                	push   $0xc
c01023cd:	6a 00                	push   $0x0
c01023cf:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01023d2:	50                   	push   %eax
c01023d3:	e8 97 9e 00 00       	call   c010c26f <Memset>
c01023d8:	83 c4 10             	add    $0x10,%esp
c01023db:	83 ec 04             	sub    $0x4,%esp
c01023de:	6a 28                	push   $0x28
c01023e0:	6a 00                	push   $0x0
c01023e2:	8d 45 98             	lea    -0x68(%ebp),%eax
c01023e5:	50                   	push   %eax
c01023e6:	e8 84 9e 00 00       	call   c010c26f <Memset>
c01023eb:	83 c4 10             	add    $0x10,%esp
c01023ee:	83 ec 04             	sub    $0x4,%esp
c01023f1:	8d 45 98             	lea    -0x68(%ebp),%eax
c01023f4:	50                   	push   %eax
c01023f5:	ff 75 08             	pushl  0x8(%ebp)
c01023f8:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01023fb:	50                   	push   %eax
c01023fc:	e8 f3 00 00 00       	call   c01024f4 <strip_path>
c0102401:	83 c4 10             	add    $0x10,%esp
c0102404:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102407:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c010240b:	75 0a                	jne    c0102417 <search_file+0x55>
c010240d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102412:	e9 db 00 00 00       	jmp    c01024f2 <search_file+0x130>
c0102417:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010241a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010241d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102420:	05 00 02 00 00       	add    $0x200,%eax
c0102425:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010242b:	85 c0                	test   %eax,%eax
c010242d:	0f 48 c2             	cmovs  %edx,%eax
c0102430:	c1 f8 09             	sar    $0x9,%eax
c0102433:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102436:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102439:	c1 e8 04             	shr    $0x4,%eax
c010243c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010243f:	e8 5c 14 00 00       	call   c01038a0 <get_super_block>
c0102444:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102447:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010244a:	8b 00                	mov    (%eax),%eax
c010244c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010244f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102456:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010245d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102464:	eb 7b                	jmp    c01024e1 <search_file+0x11f>
c0102466:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010246b:	89 c1                	mov    %eax,%ecx
c010246d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102470:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102473:	01 d0                	add    %edx,%eax
c0102475:	83 ec 0c             	sub    $0xc,%esp
c0102478:	6a 07                	push   $0x7
c010247a:	68 00 02 00 00       	push   $0x200
c010247f:	51                   	push   %ecx
c0102480:	ff 75 cc             	pushl  -0x34(%ebp)
c0102483:	50                   	push   %eax
c0102484:	e8 3b f6 ff ff       	call   c0101ac4 <rd_wt>
c0102489:	83 c4 20             	add    $0x20,%esp
c010248c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102491:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102494:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010249b:	eb 35                	jmp    c01024d2 <search_file+0x110>
c010249d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01024a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024a4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01024a7:	7f 33                	jg     c01024dc <search_file+0x11a>
c01024a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024ac:	83 c0 04             	add    $0x4,%eax
c01024af:	83 ec 08             	sub    $0x8,%esp
c01024b2:	50                   	push   %eax
c01024b3:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01024b6:	50                   	push   %eax
c01024b7:	e8 70 76 00 00       	call   c0109b2c <strcmp>
c01024bc:	83 c4 10             	add    $0x10,%esp
c01024bf:	85 c0                	test   %eax,%eax
c01024c1:	75 07                	jne    c01024ca <search_file+0x108>
c01024c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024c6:	8b 00                	mov    (%eax),%eax
c01024c8:	eb 28                	jmp    c01024f2 <search_file+0x130>
c01024ca:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01024ce:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c01024d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01024d5:	83 f8 1f             	cmp    $0x1f,%eax
c01024d8:	76 c3                	jbe    c010249d <search_file+0xdb>
c01024da:	eb 01                	jmp    c01024dd <search_file+0x11b>
c01024dc:	90                   	nop
c01024dd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01024e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024e4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c01024e7:	0f 8c 79 ff ff ff    	jl     c0102466 <search_file+0xa4>
c01024ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01024f2:	c9                   	leave  
c01024f3:	c3                   	ret    

c01024f4 <strip_path>:
c01024f4:	55                   	push   %ebp
c01024f5:	89 e5                	mov    %esp,%ebp
c01024f7:	83 ec 10             	sub    $0x10,%esp
c01024fa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01024fe:	75 0a                	jne    c010250a <strip_path+0x16>
c0102500:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102505:	e9 b4 00 00 00       	jmp    c01025be <strip_path+0xca>
c010250a:	8b 45 08             	mov    0x8(%ebp),%eax
c010250d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102510:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102513:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102516:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102519:	0f b6 00             	movzbl (%eax),%eax
c010251c:	3c 2f                	cmp    $0x2f,%al
c010251e:	75 2d                	jne    c010254d <strip_path+0x59>
c0102520:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102524:	eb 27                	jmp    c010254d <strip_path+0x59>
c0102526:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102529:	0f b6 00             	movzbl (%eax),%eax
c010252c:	3c 2f                	cmp    $0x2f,%al
c010252e:	75 0a                	jne    c010253a <strip_path+0x46>
c0102530:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102535:	e9 84 00 00 00       	jmp    c01025be <strip_path+0xca>
c010253a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010253d:	0f b6 10             	movzbl (%eax),%edx
c0102540:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102543:	88 10                	mov    %dl,(%eax)
c0102545:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102549:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010254d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102550:	0f b6 00             	movzbl (%eax),%eax
c0102553:	84 c0                	test   %al,%al
c0102555:	75 cf                	jne    c0102526 <strip_path+0x32>
c0102557:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010255a:	c6 00 00             	movb   $0x0,(%eax)
c010255d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102560:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102566:	89 10                	mov    %edx,(%eax)
c0102568:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010256e:	89 50 04             	mov    %edx,0x4(%eax)
c0102571:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102577:	89 50 08             	mov    %edx,0x8(%eax)
c010257a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102580:	89 50 0c             	mov    %edx,0xc(%eax)
c0102583:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102589:	89 50 10             	mov    %edx,0x10(%eax)
c010258c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102592:	89 50 14             	mov    %edx,0x14(%eax)
c0102595:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010259b:	89 50 18             	mov    %edx,0x18(%eax)
c010259e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c01025a4:	89 50 1c             	mov    %edx,0x1c(%eax)
c01025a7:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c01025ad:	89 50 20             	mov    %edx,0x20(%eax)
c01025b0:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c01025b6:	89 50 24             	mov    %edx,0x24(%eax)
c01025b9:	b8 00 00 00 00       	mov    $0x0,%eax
c01025be:	c9                   	leave  
c01025bf:	c3                   	ret    

c01025c0 <get_inode>:
c01025c0:	55                   	push   %ebp
c01025c1:	89 e5                	mov    %esp,%ebp
c01025c3:	56                   	push   %esi
c01025c4:	53                   	push   %ebx
c01025c5:	83 ec 20             	sub    $0x20,%esp
c01025c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01025cc:	75 0a                	jne    c01025d8 <get_inode+0x18>
c01025ce:	b8 00 00 00 00       	mov    $0x0,%eax
c01025d3:	e9 a3 01 00 00       	jmp    c010277b <get_inode+0x1bb>
c01025d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01025df:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c01025e6:	eb 69                	jmp    c0102651 <get_inode+0x91>
c01025e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025eb:	8b 40 24             	mov    0x24(%eax),%eax
c01025ee:	85 c0                	test   %eax,%eax
c01025f0:	7e 53                	jle    c0102645 <get_inode+0x85>
c01025f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025f5:	8b 40 10             	mov    0x10(%eax),%eax
c01025f8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01025fb:	75 50                	jne    c010264d <get_inode+0x8d>
c01025fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102600:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102603:	8b 0a                	mov    (%edx),%ecx
c0102605:	89 08                	mov    %ecx,(%eax)
c0102607:	8b 4a 04             	mov    0x4(%edx),%ecx
c010260a:	89 48 04             	mov    %ecx,0x4(%eax)
c010260d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102610:	89 48 08             	mov    %ecx,0x8(%eax)
c0102613:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102616:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102619:	8b 4a 10             	mov    0x10(%edx),%ecx
c010261c:	89 48 10             	mov    %ecx,0x10(%eax)
c010261f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102622:	89 48 14             	mov    %ecx,0x14(%eax)
c0102625:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102628:	89 48 18             	mov    %ecx,0x18(%eax)
c010262b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010262e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102631:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102634:	89 48 20             	mov    %ecx,0x20(%eax)
c0102637:	8b 52 24             	mov    0x24(%edx),%edx
c010263a:	89 50 24             	mov    %edx,0x24(%eax)
c010263d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102640:	e9 36 01 00 00       	jmp    c010277b <get_inode+0x1bb>
c0102645:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102648:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010264b:	eb 0d                	jmp    c010265a <get_inode+0x9a>
c010264d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102651:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102658:	76 8e                	jbe    c01025e8 <get_inode+0x28>
c010265a:	e8 41 12 00 00       	call   c01038a0 <get_super_block>
c010265f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102662:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102669:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010266c:	8b 40 04             	mov    0x4(%eax),%eax
c010266f:	8d 50 02             	lea    0x2(%eax),%edx
c0102672:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102675:	8b 40 08             	mov    0x8(%eax),%eax
c0102678:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010267b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010267e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102681:	b8 00 02 00 00       	mov    $0x200,%eax
c0102686:	99                   	cltd   
c0102687:	f7 7d e8             	idivl  -0x18(%ebp)
c010268a:	89 c6                	mov    %eax,%esi
c010268c:	89 c8                	mov    %ecx,%eax
c010268e:	99                   	cltd   
c010268f:	f7 fe                	idiv   %esi
c0102691:	01 d8                	add    %ebx,%eax
c0102693:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102696:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010269d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01026a2:	83 ec 0c             	sub    $0xc,%esp
c01026a5:	6a 07                	push   $0x7
c01026a7:	68 00 02 00 00       	push   $0x200
c01026ac:	50                   	push   %eax
c01026ad:	ff 75 e0             	pushl  -0x20(%ebp)
c01026b0:	ff 75 e4             	pushl  -0x1c(%ebp)
c01026b3:	e8 0c f4 ff ff       	call   c0101ac4 <rd_wt>
c01026b8:	83 c4 20             	add    $0x20,%esp
c01026bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026be:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01026c1:	b8 00 02 00 00       	mov    $0x200,%eax
c01026c6:	99                   	cltd   
c01026c7:	f7 7d e8             	idivl  -0x18(%ebp)
c01026ca:	89 c3                	mov    %eax,%ebx
c01026cc:	89 c8                	mov    %ecx,%eax
c01026ce:	99                   	cltd   
c01026cf:	f7 fb                	idiv   %ebx
c01026d1:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01026d4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026da:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01026dd:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c01026e1:	01 d0                	add    %edx,%eax
c01026e3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01026e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026e9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01026ec:	8b 0a                	mov    (%edx),%ecx
c01026ee:	89 08                	mov    %ecx,(%eax)
c01026f0:	8b 4a 04             	mov    0x4(%edx),%ecx
c01026f3:	89 48 04             	mov    %ecx,0x4(%eax)
c01026f6:	8b 4a 08             	mov    0x8(%edx),%ecx
c01026f9:	89 48 08             	mov    %ecx,0x8(%eax)
c01026fc:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01026ff:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102702:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102705:	89 48 10             	mov    %ecx,0x10(%eax)
c0102708:	8b 4a 14             	mov    0x14(%edx),%ecx
c010270b:	89 48 14             	mov    %ecx,0x14(%eax)
c010270e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102711:	89 48 18             	mov    %ecx,0x18(%eax)
c0102714:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102717:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010271a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010271d:	89 48 20             	mov    %ecx,0x20(%eax)
c0102720:	8b 52 24             	mov    0x24(%edx),%edx
c0102723:	89 50 24             	mov    %edx,0x24(%eax)
c0102726:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102729:	8b 55 0c             	mov    0xc(%ebp),%edx
c010272c:	89 50 10             	mov    %edx,0x10(%eax)
c010272f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102732:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102735:	89 50 20             	mov    %edx,0x20(%eax)
c0102738:	8b 45 08             	mov    0x8(%ebp),%eax
c010273b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010273e:	8b 0a                	mov    (%edx),%ecx
c0102740:	89 08                	mov    %ecx,(%eax)
c0102742:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102745:	89 48 04             	mov    %ecx,0x4(%eax)
c0102748:	8b 4a 08             	mov    0x8(%edx),%ecx
c010274b:	89 48 08             	mov    %ecx,0x8(%eax)
c010274e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102751:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102754:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102757:	89 48 10             	mov    %ecx,0x10(%eax)
c010275a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010275d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102760:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102763:	89 48 18             	mov    %ecx,0x18(%eax)
c0102766:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102769:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010276c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010276f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102772:	8b 52 24             	mov    0x24(%edx),%edx
c0102775:	89 50 24             	mov    %edx,0x24(%eax)
c0102778:	8b 45 08             	mov    0x8(%ebp),%eax
c010277b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010277e:	5b                   	pop    %ebx
c010277f:	5e                   	pop    %esi
c0102780:	5d                   	pop    %ebp
c0102781:	c3                   	ret    

c0102782 <create_file>:
c0102782:	55                   	push   %ebp
c0102783:	89 e5                	mov    %esp,%ebp
c0102785:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010278b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010278e:	50                   	push   %eax
c010278f:	ff 75 0c             	pushl  0xc(%ebp)
c0102792:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102795:	50                   	push   %eax
c0102796:	e8 59 fd ff ff       	call   c01024f4 <strip_path>
c010279b:	83 c4 0c             	add    $0xc,%esp
c010279e:	83 f8 ff             	cmp    $0xffffffff,%eax
c01027a1:	75 0a                	jne    c01027ad <create_file+0x2b>
c01027a3:	b8 00 00 00 00       	mov    $0x0,%eax
c01027a8:	e9 de 00 00 00       	jmp    c010288b <create_file+0x109>
c01027ad:	e8 db 00 00 00       	call   c010288d <alloc_imap_bit>
c01027b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01027b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01027b9:	75 0a                	jne    c01027c5 <create_file+0x43>
c01027bb:	b8 00 00 00 00       	mov    $0x0,%eax
c01027c0:	e9 c6 00 00 00       	jmp    c010288b <create_file+0x109>
c01027c5:	e8 d6 10 00 00       	call   c01038a0 <get_super_block>
c01027ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01027cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027d0:	8b 40 10             	mov    0x10(%eax),%eax
c01027d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01027d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027d9:	83 ec 08             	sub    $0x8,%esp
c01027dc:	50                   	push   %eax
c01027dd:	ff 75 f4             	pushl  -0xc(%ebp)
c01027e0:	e8 a5 01 00 00       	call   c010298a <alloc_smap_bit>
c01027e5:	83 c4 10             	add    $0x10,%esp
c01027e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01027eb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01027ef:	75 0a                	jne    c01027fb <create_file+0x79>
c01027f1:	b8 00 00 00 00       	mov    $0x0,%eax
c01027f6:	e9 90 00 00 00       	jmp    c010288b <create_file+0x109>
c01027fb:	83 ec 04             	sub    $0x4,%esp
c01027fe:	ff 75 e8             	pushl  -0x18(%ebp)
c0102801:	ff 75 f4             	pushl  -0xc(%ebp)
c0102804:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0102807:	50                   	push   %eax
c0102808:	e8 1e 03 00 00       	call   c0102b2b <new_inode>
c010280d:	83 c4 10             	add    $0x10,%esp
c0102810:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102813:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102817:	75 07                	jne    c0102820 <create_file+0x9e>
c0102819:	b8 00 00 00 00       	mov    $0x0,%eax
c010281e:	eb 6b                	jmp    c010288b <create_file+0x109>
c0102820:	ff 75 f4             	pushl  -0xc(%ebp)
c0102823:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102826:	50                   	push   %eax
c0102827:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010282a:	50                   	push   %eax
c010282b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102831:	50                   	push   %eax
c0102832:	e8 12 04 00 00       	call   c0102c49 <new_dir_entry>
c0102837:	83 c4 10             	add    $0x10,%esp
c010283a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010283d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102841:	75 07                	jne    c010284a <create_file+0xc8>
c0102843:	b8 00 00 00 00       	mov    $0x0,%eax
c0102848:	eb 41                	jmp    c010288b <create_file+0x109>
c010284a:	8b 45 08             	mov    0x8(%ebp),%eax
c010284d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102850:	89 10                	mov    %edx,(%eax)
c0102852:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102855:	89 50 04             	mov    %edx,0x4(%eax)
c0102858:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010285b:	89 50 08             	mov    %edx,0x8(%eax)
c010285e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102861:	89 50 0c             	mov    %edx,0xc(%eax)
c0102864:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102867:	89 50 10             	mov    %edx,0x10(%eax)
c010286a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010286d:	89 50 14             	mov    %edx,0x14(%eax)
c0102870:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102873:	89 50 18             	mov    %edx,0x18(%eax)
c0102876:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102879:	89 50 1c             	mov    %edx,0x1c(%eax)
c010287c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010287f:	89 50 20             	mov    %edx,0x20(%eax)
c0102882:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102885:	89 50 24             	mov    %edx,0x24(%eax)
c0102888:	8b 45 08             	mov    0x8(%ebp),%eax
c010288b:	c9                   	leave  
c010288c:	c3                   	ret    

c010288d <alloc_imap_bit>:
c010288d:	55                   	push   %ebp
c010288e:	89 e5                	mov    %esp,%ebp
c0102890:	53                   	push   %ebx
c0102891:	83 ec 24             	sub    $0x24,%esp
c0102894:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010289b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01028a2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01028a7:	83 ec 0c             	sub    $0xc,%esp
c01028aa:	6a 07                	push   $0x7
c01028ac:	68 00 02 00 00       	push   $0x200
c01028b1:	50                   	push   %eax
c01028b2:	ff 75 e8             	pushl  -0x18(%ebp)
c01028b5:	ff 75 ec             	pushl  -0x14(%ebp)
c01028b8:	e8 07 f2 ff ff       	call   c0101ac4 <rd_wt>
c01028bd:	83 c4 20             	add    $0x20,%esp
c01028c0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01028c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01028ce:	e9 a5 00 00 00       	jmp    c0102978 <alloc_imap_bit+0xeb>
c01028d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01028da:	e9 8b 00 00 00       	jmp    c010296a <alloc_imap_bit+0xdd>
c01028df:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01028e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028e8:	01 d0                	add    %edx,%eax
c01028ea:	0f b6 00             	movzbl (%eax),%eax
c01028ed:	0f be d0             	movsbl %al,%edx
c01028f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028f3:	89 c1                	mov    %eax,%ecx
c01028f5:	d3 fa                	sar    %cl,%edx
c01028f7:	89 d0                	mov    %edx,%eax
c01028f9:	83 e0 01             	and    $0x1,%eax
c01028fc:	85 c0                	test   %eax,%eax
c01028fe:	74 06                	je     c0102906 <alloc_imap_bit+0x79>
c0102900:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102904:	eb 64                	jmp    c010296a <alloc_imap_bit+0xdd>
c0102906:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010290c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010290f:	01 d0                	add    %edx,%eax
c0102911:	0f b6 18             	movzbl (%eax),%ebx
c0102914:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102917:	ba 01 00 00 00       	mov    $0x1,%edx
c010291c:	89 c1                	mov    %eax,%ecx
c010291e:	d3 e2                	shl    %cl,%edx
c0102920:	89 d0                	mov    %edx,%eax
c0102922:	89 c1                	mov    %eax,%ecx
c0102924:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010292a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010292d:	01 d0                	add    %edx,%eax
c010292f:	09 cb                	or     %ecx,%ebx
c0102931:	89 da                	mov    %ebx,%edx
c0102933:	88 10                	mov    %dl,(%eax)
c0102935:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102938:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010293f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102942:	01 d0                	add    %edx,%eax
c0102944:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102947:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010294c:	83 ec 0c             	sub    $0xc,%esp
c010294f:	6a 0a                	push   $0xa
c0102951:	68 00 02 00 00       	push   $0x200
c0102956:	50                   	push   %eax
c0102957:	ff 75 e8             	pushl  -0x18(%ebp)
c010295a:	ff 75 ec             	pushl  -0x14(%ebp)
c010295d:	e8 62 f1 ff ff       	call   c0101ac4 <rd_wt>
c0102962:	83 c4 20             	add    $0x20,%esp
c0102965:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102968:	eb 1b                	jmp    c0102985 <alloc_imap_bit+0xf8>
c010296a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010296e:	0f 8e 6b ff ff ff    	jle    c01028df <alloc_imap_bit+0x52>
c0102974:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102978:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010297f:	0f 8e 4e ff ff ff    	jle    c01028d3 <alloc_imap_bit+0x46>
c0102985:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102988:	c9                   	leave  
c0102989:	c3                   	ret    

c010298a <alloc_smap_bit>:
c010298a:	55                   	push   %ebp
c010298b:	89 e5                	mov    %esp,%ebp
c010298d:	53                   	push   %ebx
c010298e:	83 ec 34             	sub    $0x34,%esp
c0102991:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102995:	75 1c                	jne    c01029b3 <alloc_smap_bit+0x29>
c0102997:	68 fd 02 00 00       	push   $0x2fd
c010299c:	68 94 b3 10 c0       	push   $0xc010b394
c01029a1:	68 94 b3 10 c0       	push   $0xc010b394
c01029a6:	68 a4 b4 10 c0       	push   $0xc010b4a4
c01029ab:	e8 a5 61 00 00       	call   c0108b55 <assertion_failure>
c01029b0:	83 c4 10             	add    $0x10,%esp
c01029b3:	e8 e8 0e 00 00       	call   c01038a0 <get_super_block>
c01029b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01029bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01029be:	8b 40 08             	mov    0x8(%eax),%eax
c01029c1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01029c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01029c7:	8b 40 04             	mov    0x4(%eax),%eax
c01029ca:	83 c0 02             	add    $0x2,%eax
c01029cd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01029d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01029d7:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c01029de:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01029e5:	e9 20 01 00 00       	jmp    c0102b0a <alloc_smap_bit+0x180>
c01029ea:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01029ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029f0:	01 d0                	add    %edx,%eax
c01029f2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01029f5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01029fa:	83 ec 0c             	sub    $0xc,%esp
c01029fd:	6a 07                	push   $0x7
c01029ff:	68 00 02 00 00       	push   $0x200
c0102a04:	50                   	push   %eax
c0102a05:	ff 75 d8             	pushl  -0x28(%ebp)
c0102a08:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102a0b:	e8 b4 f0 ff ff       	call   c0101ac4 <rd_wt>
c0102a10:	83 c4 20             	add    $0x20,%esp
c0102a13:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102a1a:	e9 b0 00 00 00       	jmp    c0102acf <alloc_smap_bit+0x145>
c0102a1f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102a26:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102a2a:	0f 85 8c 00 00 00    	jne    c0102abc <alloc_smap_bit+0x132>
c0102a30:	eb 45                	jmp    c0102a77 <alloc_smap_bit+0xed>
c0102a32:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102a38:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a3b:	01 d0                	add    %edx,%eax
c0102a3d:	0f b6 00             	movzbl (%eax),%eax
c0102a40:	0f be d0             	movsbl %al,%edx
c0102a43:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a46:	89 c1                	mov    %eax,%ecx
c0102a48:	d3 fa                	sar    %cl,%edx
c0102a4a:	89 d0                	mov    %edx,%eax
c0102a4c:	83 e0 01             	and    $0x1,%eax
c0102a4f:	85 c0                	test   %eax,%eax
c0102a51:	74 06                	je     c0102a59 <alloc_smap_bit+0xcf>
c0102a53:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102a57:	eb 1e                	jmp    c0102a77 <alloc_smap_bit+0xed>
c0102a59:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a5c:	c1 e0 09             	shl    $0x9,%eax
c0102a5f:	89 c2                	mov    %eax,%edx
c0102a61:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a64:	01 d0                	add    %edx,%eax
c0102a66:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0102a6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a70:	01 d0                	add    %edx,%eax
c0102a72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102a75:	eb 06                	jmp    c0102a7d <alloc_smap_bit+0xf3>
c0102a77:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102a7b:	7e b5                	jle    c0102a32 <alloc_smap_bit+0xa8>
c0102a7d:	eb 3d                	jmp    c0102abc <alloc_smap_bit+0x132>
c0102a7f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102a83:	74 45                	je     c0102aca <alloc_smap_bit+0x140>
c0102a85:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102a8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a8e:	01 d0                	add    %edx,%eax
c0102a90:	0f b6 18             	movzbl (%eax),%ebx
c0102a93:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a96:	ba 01 00 00 00       	mov    $0x1,%edx
c0102a9b:	89 c1                	mov    %eax,%ecx
c0102a9d:	d3 e2                	shl    %cl,%edx
c0102a9f:	89 d0                	mov    %edx,%eax
c0102aa1:	89 c1                	mov    %eax,%ecx
c0102aa3:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102aa9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102aac:	01 d0                	add    %edx,%eax
c0102aae:	09 cb                	or     %ecx,%ebx
c0102ab0:	89 da                	mov    %ebx,%edx
c0102ab2:	88 10                	mov    %dl,(%eax)
c0102ab4:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102ab8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102abc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102ac0:	74 09                	je     c0102acb <alloc_smap_bit+0x141>
c0102ac2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102ac6:	7e b7                	jle    c0102a7f <alloc_smap_bit+0xf5>
c0102ac8:	eb 01                	jmp    c0102acb <alloc_smap_bit+0x141>
c0102aca:	90                   	nop
c0102acb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102acf:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102ad6:	0f 8e 43 ff ff ff    	jle    c0102a1f <alloc_smap_bit+0x95>
c0102adc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102ae0:	74 1e                	je     c0102b00 <alloc_smap_bit+0x176>
c0102ae2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ae7:	83 ec 0c             	sub    $0xc,%esp
c0102aea:	6a 0a                	push   $0xa
c0102aec:	68 00 02 00 00       	push   $0x200
c0102af1:	50                   	push   %eax
c0102af2:	ff 75 d8             	pushl  -0x28(%ebp)
c0102af5:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102af8:	e8 c7 ef ff ff       	call   c0101ac4 <rd_wt>
c0102afd:	83 c4 20             	add    $0x20,%esp
c0102b00:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102b04:	74 12                	je     c0102b18 <alloc_smap_bit+0x18e>
c0102b06:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102b0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b0d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102b10:	0f 8c d4 fe ff ff    	jl     c01029ea <alloc_smap_bit+0x60>
c0102b16:	eb 01                	jmp    c0102b19 <alloc_smap_bit+0x18f>
c0102b18:	90                   	nop
c0102b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b1c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102b1f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102b22:	8b 00                	mov    (%eax),%eax
c0102b24:	01 d0                	add    %edx,%eax
c0102b26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102b29:	c9                   	leave  
c0102b2a:	c3                   	ret    

c0102b2b <new_inode>:
c0102b2b:	55                   	push   %ebp
c0102b2c:	89 e5                	mov    %esp,%ebp
c0102b2e:	83 ec 38             	sub    $0x38,%esp
c0102b31:	83 ec 08             	sub    $0x8,%esp
c0102b34:	ff 75 0c             	pushl  0xc(%ebp)
c0102b37:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0102b3a:	50                   	push   %eax
c0102b3b:	e8 80 fa ff ff       	call   c01025c0 <get_inode>
c0102b40:	83 c4 10             	add    $0x10,%esp
c0102b43:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102b46:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102b4a:	75 0a                	jne    c0102b56 <new_inode+0x2b>
c0102b4c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102b51:	e9 f1 00 00 00       	jmp    c0102c47 <new_inode+0x11c>
c0102b56:	8b 45 10             	mov    0x10(%ebp),%eax
c0102b59:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102b5c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102b63:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0102b6a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102b71:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b74:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102b77:	83 ec 0c             	sub    $0xc,%esp
c0102b7a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0102b7d:	50                   	push   %eax
c0102b7e:	e8 39 0b 00 00       	call   c01036bc <sync_inode>
c0102b83:	83 c4 10             	add    $0x10,%esp
c0102b86:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0102b8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102b94:	eb 1d                	jmp    c0102bb3 <new_inode+0x88>
c0102b96:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102b99:	89 d0                	mov    %edx,%eax
c0102b9b:	c1 e0 02             	shl    $0x2,%eax
c0102b9e:	01 d0                	add    %edx,%eax
c0102ba0:	c1 e0 03             	shl    $0x3,%eax
c0102ba3:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102ba8:	8b 00                	mov    (%eax),%eax
c0102baa:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0102bad:	74 0c                	je     c0102bbb <new_inode+0x90>
c0102baf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102bb3:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102bb7:	7e dd                	jle    c0102b96 <new_inode+0x6b>
c0102bb9:	eb 01                	jmp    c0102bbc <new_inode+0x91>
c0102bbb:	90                   	nop
c0102bbc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102bbf:	89 d0                	mov    %edx,%eax
c0102bc1:	c1 e0 02             	shl    $0x2,%eax
c0102bc4:	01 d0                	add    %edx,%eax
c0102bc6:	c1 e0 03             	shl    $0x3,%eax
c0102bc9:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c0102bce:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102bd1:	89 10                	mov    %edx,(%eax)
c0102bd3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102bd6:	89 50 04             	mov    %edx,0x4(%eax)
c0102bd9:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102bdc:	89 50 08             	mov    %edx,0x8(%eax)
c0102bdf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102be2:	89 50 0c             	mov    %edx,0xc(%eax)
c0102be5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102be8:	89 50 10             	mov    %edx,0x10(%eax)
c0102beb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102bee:	89 50 14             	mov    %edx,0x14(%eax)
c0102bf1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102bf4:	89 50 18             	mov    %edx,0x18(%eax)
c0102bf7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102bfa:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102bfd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102c00:	89 50 20             	mov    %edx,0x20(%eax)
c0102c03:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102c06:	89 50 24             	mov    %edx,0x24(%eax)
c0102c09:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c0c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102c0f:	89 10                	mov    %edx,(%eax)
c0102c11:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102c14:	89 50 04             	mov    %edx,0x4(%eax)
c0102c17:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102c1a:	89 50 08             	mov    %edx,0x8(%eax)
c0102c1d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102c20:	89 50 0c             	mov    %edx,0xc(%eax)
c0102c23:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102c26:	89 50 10             	mov    %edx,0x10(%eax)
c0102c29:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102c2c:	89 50 14             	mov    %edx,0x14(%eax)
c0102c2f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102c32:	89 50 18             	mov    %edx,0x18(%eax)
c0102c35:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102c38:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102c3b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102c3e:	89 50 20             	mov    %edx,0x20(%eax)
c0102c41:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102c44:	89 50 24             	mov    %edx,0x24(%eax)
c0102c47:	c9                   	leave  
c0102c48:	c3                   	ret    

c0102c49 <new_dir_entry>:
c0102c49:	55                   	push   %ebp
c0102c4a:	89 e5                	mov    %esp,%ebp
c0102c4c:	83 ec 48             	sub    $0x48,%esp
c0102c4f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102c56:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c59:	8b 40 04             	mov    0x4(%eax),%eax
c0102c5c:	99                   	cltd   
c0102c5d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102c60:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102c63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c66:	8b 40 0c             	mov    0xc(%eax),%eax
c0102c69:	99                   	cltd   
c0102c6a:	f7 7d dc             	idivl  -0x24(%ebp)
c0102c6d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102c70:	e8 2b 0c 00 00       	call   c01038a0 <get_super_block>
c0102c75:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102c78:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102c7b:	8b 00                	mov    (%eax),%eax
c0102c7d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102c80:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c83:	8b 40 0c             	mov    0xc(%eax),%eax
c0102c86:	05 00 02 00 00       	add    $0x200,%eax
c0102c8b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102c91:	85 c0                	test   %eax,%eax
c0102c93:	0f 48 c2             	cmovs  %edx,%eax
c0102c96:	c1 f8 09             	sar    $0x9,%eax
c0102c99:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102c9c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102ca3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102caa:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102cb1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102cb8:	eb 7f                	jmp    c0102d39 <new_dir_entry+0xf0>
c0102cba:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102cbf:	89 c1                	mov    %eax,%ecx
c0102cc1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102cc4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102cc7:	01 d0                	add    %edx,%eax
c0102cc9:	83 ec 0c             	sub    $0xc,%esp
c0102ccc:	6a 07                	push   $0x7
c0102cce:	68 00 02 00 00       	push   $0x200
c0102cd3:	51                   	push   %ecx
c0102cd4:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102cd7:	50                   	push   %eax
c0102cd8:	e8 e7 ed ff ff       	call   c0101ac4 <rd_wt>
c0102cdd:	83 c4 20             	add    $0x20,%esp
c0102ce0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102ce5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102ce8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102cef:	eb 25                	jmp    c0102d16 <new_dir_entry+0xcd>
c0102cf1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102cf5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102cf8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102cfb:	7f 29                	jg     c0102d26 <new_dir_entry+0xdd>
c0102cfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d00:	8b 00                	mov    (%eax),%eax
c0102d02:	85 c0                	test   %eax,%eax
c0102d04:	75 08                	jne    c0102d0e <new_dir_entry+0xc5>
c0102d06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d09:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102d0c:	eb 19                	jmp    c0102d27 <new_dir_entry+0xde>
c0102d0e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102d12:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102d16:	b8 00 02 00 00       	mov    $0x200,%eax
c0102d1b:	99                   	cltd   
c0102d1c:	f7 7d dc             	idivl  -0x24(%ebp)
c0102d1f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102d22:	7c cd                	jl     c0102cf1 <new_dir_entry+0xa8>
c0102d24:	eb 01                	jmp    c0102d27 <new_dir_entry+0xde>
c0102d26:	90                   	nop
c0102d27:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d2a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102d2d:	7f 16                	jg     c0102d45 <new_dir_entry+0xfc>
c0102d2f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102d33:	75 10                	jne    c0102d45 <new_dir_entry+0xfc>
c0102d35:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102d39:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102d3c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102d3f:	0f 8c 75 ff ff ff    	jl     c0102cba <new_dir_entry+0x71>
c0102d45:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102d48:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102d4b:	75 0a                	jne    c0102d57 <new_dir_entry+0x10e>
c0102d4d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102d52:	e9 fc 00 00 00       	jmp    c0102e53 <new_dir_entry+0x20a>
c0102d57:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102d5e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102d62:	75 1e                	jne    c0102d82 <new_dir_entry+0x139>
c0102d64:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d67:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102d6a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d6d:	8b 50 04             	mov    0x4(%eax),%edx
c0102d70:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102d73:	01 c2                	add    %eax,%edx
c0102d75:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d78:	89 50 04             	mov    %edx,0x4(%eax)
c0102d7b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d85:	8b 55 14             	mov    0x14(%ebp),%edx
c0102d88:	89 10                	mov    %edx,(%eax)
c0102d8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d8d:	83 c0 04             	add    $0x4,%eax
c0102d90:	83 ec 08             	sub    $0x8,%esp
c0102d93:	ff 75 10             	pushl  0x10(%ebp)
c0102d96:	50                   	push   %eax
c0102d97:	e8 f2 94 00 00       	call   c010c28e <Strcpy>
c0102d9c:	83 c4 10             	add    $0x10,%esp
c0102d9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102da2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102da5:	8b 0a                	mov    (%edx),%ecx
c0102da7:	89 08                	mov    %ecx,(%eax)
c0102da9:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102dac:	89 48 04             	mov    %ecx,0x4(%eax)
c0102daf:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102db2:	89 48 08             	mov    %ecx,0x8(%eax)
c0102db5:	8b 52 0c             	mov    0xc(%edx),%edx
c0102db8:	89 50 0c             	mov    %edx,0xc(%eax)
c0102dbb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102dc0:	89 c1                	mov    %eax,%ecx
c0102dc2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102dc5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102dc8:	01 d0                	add    %edx,%eax
c0102dca:	83 ec 0c             	sub    $0xc,%esp
c0102dcd:	6a 0a                	push   $0xa
c0102dcf:	68 00 02 00 00       	push   $0x200
c0102dd4:	51                   	push   %ecx
c0102dd5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102dd8:	50                   	push   %eax
c0102dd9:	e8 e6 ec ff ff       	call   c0101ac4 <rd_wt>
c0102dde:	83 c4 20             	add    $0x20,%esp
c0102de1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102de5:	74 69                	je     c0102e50 <new_dir_entry+0x207>
c0102de7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102dea:	8b 10                	mov    (%eax),%edx
c0102dec:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102df2:	8b 50 04             	mov    0x4(%eax),%edx
c0102df5:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102dfb:	8b 50 08             	mov    0x8(%eax),%edx
c0102dfe:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102e04:	8b 50 0c             	mov    0xc(%eax),%edx
c0102e07:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102e0d:	8b 50 10             	mov    0x10(%eax),%edx
c0102e10:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102e16:	8b 50 14             	mov    0x14(%eax),%edx
c0102e19:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102e1f:	8b 50 18             	mov    0x18(%eax),%edx
c0102e22:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102e28:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102e2b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102e31:	8b 50 20             	mov    0x20(%eax),%edx
c0102e34:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102e3a:	8b 40 24             	mov    0x24(%eax),%eax
c0102e3d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102e42:	83 ec 0c             	sub    $0xc,%esp
c0102e45:	ff 75 0c             	pushl  0xc(%ebp)
c0102e48:	e8 6f 08 00 00       	call   c01036bc <sync_inode>
c0102e4d:	83 c4 10             	add    $0x10,%esp
c0102e50:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e53:	c9                   	leave  
c0102e54:	c3                   	ret    

c0102e55 <do_unlink>:
c0102e55:	55                   	push   %ebp
c0102e56:	89 e5                	mov    %esp,%ebp
c0102e58:	53                   	push   %ebx
c0102e59:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102e5f:	83 ec 08             	sub    $0x8,%esp
c0102e62:	ff 75 08             	pushl  0x8(%ebp)
c0102e65:	68 b9 b4 10 c0       	push   $0xc010b4b9
c0102e6a:	e8 bd 6c 00 00       	call   c0109b2c <strcmp>
c0102e6f:	83 c4 10             	add    $0x10,%esp
c0102e72:	85 c0                	test   %eax,%eax
c0102e74:	75 10                	jne    c0102e86 <do_unlink+0x31>
c0102e76:	83 ec 0c             	sub    $0xc,%esp
c0102e79:	68 bb b4 10 c0       	push   $0xc010b4bb
c0102e7e:	e8 b4 5c 00 00       	call   c0108b37 <panic>
c0102e83:	83 c4 10             	add    $0x10,%esp
c0102e86:	83 ec 0c             	sub    $0xc,%esp
c0102e89:	ff 75 08             	pushl  0x8(%ebp)
c0102e8c:	e8 31 f5 ff ff       	call   c01023c2 <search_file>
c0102e91:	83 c4 10             	add    $0x10,%esp
c0102e94:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102e97:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102e9b:	75 10                	jne    c0102ead <do_unlink+0x58>
c0102e9d:	83 ec 0c             	sub    $0xc,%esp
c0102ea0:	68 d7 b4 10 c0       	push   $0xc010b4d7
c0102ea5:	e8 8d 5c 00 00       	call   c0108b37 <panic>
c0102eaa:	83 c4 10             	add    $0x10,%esp
c0102ead:	83 ec 08             	sub    $0x8,%esp
c0102eb0:	ff 75 d0             	pushl  -0x30(%ebp)
c0102eb3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102eb9:	50                   	push   %eax
c0102eba:	e8 01 f7 ff ff       	call   c01025c0 <get_inode>
c0102ebf:	83 c4 10             	add    $0x10,%esp
c0102ec2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102ec5:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102ec9:	75 10                	jne    c0102edb <do_unlink+0x86>
c0102ecb:	83 ec 0c             	sub    $0xc,%esp
c0102ece:	68 d7 b4 10 c0       	push   $0xc010b4d7
c0102ed3:	e8 5f 5c 00 00       	call   c0108b37 <panic>
c0102ed8:	83 c4 10             	add    $0x10,%esp
c0102edb:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102ede:	85 c0                	test   %eax,%eax
c0102ee0:	7e 10                	jle    c0102ef2 <do_unlink+0x9d>
c0102ee2:	83 ec 0c             	sub    $0xc,%esp
c0102ee5:	68 f0 b4 10 c0       	push   $0xc010b4f0
c0102eea:	e8 48 5c 00 00       	call   c0108b37 <panic>
c0102eef:	83 c4 10             	add    $0x10,%esp
c0102ef2:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102ef8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102efb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102efe:	8d 50 07             	lea    0x7(%eax),%edx
c0102f01:	85 c0                	test   %eax,%eax
c0102f03:	0f 48 c2             	cmovs  %edx,%eax
c0102f06:	c1 f8 03             	sar    $0x3,%eax
c0102f09:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102f0c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102f0f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102f15:	85 c0                	test   %eax,%eax
c0102f17:	0f 48 c2             	cmovs  %edx,%eax
c0102f1a:	c1 f8 09             	sar    $0x9,%eax
c0102f1d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102f20:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102f23:	99                   	cltd   
c0102f24:	c1 ea 1d             	shr    $0x1d,%edx
c0102f27:	01 d0                	add    %edx,%eax
c0102f29:	83 e0 07             	and    $0x7,%eax
c0102f2c:	29 d0                	sub    %edx,%eax
c0102f2e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102f31:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102f38:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f3d:	89 c2                	mov    %eax,%edx
c0102f3f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102f42:	83 c0 02             	add    $0x2,%eax
c0102f45:	83 ec 0c             	sub    $0xc,%esp
c0102f48:	6a 07                	push   $0x7
c0102f4a:	68 00 02 00 00       	push   $0x200
c0102f4f:	52                   	push   %edx
c0102f50:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f53:	50                   	push   %eax
c0102f54:	e8 6b eb ff ff       	call   c0101ac4 <rd_wt>
c0102f59:	83 c4 20             	add    $0x20,%esp
c0102f5c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102f62:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102f65:	01 d0                	add    %edx,%eax
c0102f67:	0f b6 10             	movzbl (%eax),%edx
c0102f6a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102f6d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102f72:	89 c1                	mov    %eax,%ecx
c0102f74:	d3 e3                	shl    %cl,%ebx
c0102f76:	89 d8                	mov    %ebx,%eax
c0102f78:	f7 d0                	not    %eax
c0102f7a:	89 c3                	mov    %eax,%ebx
c0102f7c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102f82:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102f85:	01 c8                	add    %ecx,%eax
c0102f87:	21 da                	and    %ebx,%edx
c0102f89:	88 10                	mov    %dl,(%eax)
c0102f8b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f90:	89 c2                	mov    %eax,%edx
c0102f92:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102f95:	83 c0 02             	add    $0x2,%eax
c0102f98:	83 ec 0c             	sub    $0xc,%esp
c0102f9b:	6a 0a                	push   $0xa
c0102f9d:	68 00 02 00 00       	push   $0x200
c0102fa2:	52                   	push   %edx
c0102fa3:	ff 75 b8             	pushl  -0x48(%ebp)
c0102fa6:	50                   	push   %eax
c0102fa7:	e8 18 eb ff ff       	call   c0101ac4 <rd_wt>
c0102fac:	83 c4 20             	add    $0x20,%esp
c0102faf:	e8 ec 08 00 00       	call   c01038a0 <get_super_block>
c0102fb4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102fb7:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102fbd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102fc0:	8b 00                	mov    (%eax),%eax
c0102fc2:	29 c2                	sub    %eax,%edx
c0102fc4:	89 d0                	mov    %edx,%eax
c0102fc6:	83 c0 01             	add    $0x1,%eax
c0102fc9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102fcc:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102fcf:	8d 50 07             	lea    0x7(%eax),%edx
c0102fd2:	85 c0                	test   %eax,%eax
c0102fd4:	0f 48 c2             	cmovs  %edx,%eax
c0102fd7:	c1 f8 03             	sar    $0x3,%eax
c0102fda:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102fdd:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102fe0:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102fe6:	85 c0                	test   %eax,%eax
c0102fe8:	0f 48 c2             	cmovs  %edx,%eax
c0102feb:	c1 f8 09             	sar    $0x9,%eax
c0102fee:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102ff1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102ff4:	99                   	cltd   
c0102ff5:	c1 ea 1d             	shr    $0x1d,%edx
c0102ff8:	01 d0                	add    %edx,%eax
c0102ffa:	83 e0 07             	and    $0x7,%eax
c0102ffd:	29 d0                	sub    %edx,%eax
c0102fff:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103002:	b8 08 00 00 00       	mov    $0x8,%eax
c0103007:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010300a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010300d:	29 c2                	sub    %eax,%edx
c010300f:	89 d0                	mov    %edx,%eax
c0103011:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103014:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103017:	8d 50 07             	lea    0x7(%eax),%edx
c010301a:	85 c0                	test   %eax,%eax
c010301c:	0f 48 c2             	cmovs  %edx,%eax
c010301f:	c1 f8 03             	sar    $0x3,%eax
c0103022:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0103025:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010302a:	89 c1                	mov    %eax,%ecx
c010302c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010302f:	8b 40 04             	mov    0x4(%eax),%eax
c0103032:	8d 50 02             	lea    0x2(%eax),%edx
c0103035:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103038:	01 d0                	add    %edx,%eax
c010303a:	83 ec 0c             	sub    $0xc,%esp
c010303d:	6a 07                	push   $0x7
c010303f:	68 00 02 00 00       	push   $0x200
c0103044:	51                   	push   %ecx
c0103045:	ff 75 b8             	pushl  -0x48(%ebp)
c0103048:	50                   	push   %eax
c0103049:	e8 76 ea ff ff       	call   c0101ac4 <rd_wt>
c010304e:	83 c4 20             	add    $0x20,%esp
c0103051:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103057:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010305a:	01 d0                	add    %edx,%eax
c010305c:	0f b6 10             	movzbl (%eax),%edx
c010305f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103062:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0103067:	89 c1                	mov    %eax,%ecx
c0103069:	d3 e3                	shl    %cl,%ebx
c010306b:	89 d8                	mov    %ebx,%eax
c010306d:	f7 d0                	not    %eax
c010306f:	89 c3                	mov    %eax,%ebx
c0103071:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0103077:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010307a:	01 c8                	add    %ecx,%eax
c010307c:	21 da                	and    %ebx,%edx
c010307e:	88 10                	mov    %dl,(%eax)
c0103080:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103087:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010308a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010308d:	eb 6b                	jmp    c01030fa <do_unlink+0x2a5>
c010308f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0103096:	75 4c                	jne    c01030e4 <do_unlink+0x28f>
c0103098:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010309f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030a4:	83 ec 0c             	sub    $0xc,%esp
c01030a7:	6a 0a                	push   $0xa
c01030a9:	68 00 02 00 00       	push   $0x200
c01030ae:	50                   	push   %eax
c01030af:	ff 75 b8             	pushl  -0x48(%ebp)
c01030b2:	ff 75 ec             	pushl  -0x14(%ebp)
c01030b5:	e8 0a ea ff ff       	call   c0101ac4 <rd_wt>
c01030ba:	83 c4 20             	add    $0x20,%esp
c01030bd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030c2:	89 c1                	mov    %eax,%ecx
c01030c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01030c7:	8d 50 01             	lea    0x1(%eax),%edx
c01030ca:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01030cd:	83 ec 0c             	sub    $0xc,%esp
c01030d0:	6a 07                	push   $0x7
c01030d2:	68 00 02 00 00       	push   $0x200
c01030d7:	51                   	push   %ecx
c01030d8:	ff 75 b8             	pushl  -0x48(%ebp)
c01030db:	50                   	push   %eax
c01030dc:	e8 e3 e9 ff ff       	call   c0101ac4 <rd_wt>
c01030e1:	83 c4 20             	add    $0x20,%esp
c01030e4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01030ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030ed:	01 d0                	add    %edx,%eax
c01030ef:	c6 00 00             	movb   $0x0,(%eax)
c01030f2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01030f6:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c01030fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030fd:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0103100:	7c 8d                	jl     c010308f <do_unlink+0x23a>
c0103102:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0103109:	75 4c                	jne    c0103157 <do_unlink+0x302>
c010310b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0103112:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103117:	83 ec 0c             	sub    $0xc,%esp
c010311a:	6a 0a                	push   $0xa
c010311c:	68 00 02 00 00       	push   $0x200
c0103121:	50                   	push   %eax
c0103122:	ff 75 b8             	pushl  -0x48(%ebp)
c0103125:	ff 75 ec             	pushl  -0x14(%ebp)
c0103128:	e8 97 e9 ff ff       	call   c0101ac4 <rd_wt>
c010312d:	83 c4 20             	add    $0x20,%esp
c0103130:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103135:	89 c1                	mov    %eax,%ecx
c0103137:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010313a:	8d 50 01             	lea    0x1(%eax),%edx
c010313d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0103140:	83 ec 0c             	sub    $0xc,%esp
c0103143:	6a 07                	push   $0x7
c0103145:	68 00 02 00 00       	push   $0x200
c010314a:	51                   	push   %ecx
c010314b:	ff 75 b8             	pushl  -0x48(%ebp)
c010314e:	50                   	push   %eax
c010314f:	e8 70 e9 ff ff       	call   c0101ac4 <rd_wt>
c0103154:	83 c4 20             	add    $0x20,%esp
c0103157:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010315d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103160:	01 d0                	add    %edx,%eax
c0103162:	0f b6 10             	movzbl (%eax),%edx
c0103165:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103168:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c010316d:	89 c1                	mov    %eax,%ecx
c010316f:	d3 e3                	shl    %cl,%ebx
c0103171:	89 d8                	mov    %ebx,%eax
c0103173:	89 c3                	mov    %eax,%ebx
c0103175:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c010317b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010317e:	01 c8                	add    %ecx,%eax
c0103180:	21 da                	and    %ebx,%edx
c0103182:	88 10                	mov    %dl,(%eax)
c0103184:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103189:	83 ec 0c             	sub    $0xc,%esp
c010318c:	6a 0a                	push   $0xa
c010318e:	68 00 02 00 00       	push   $0x200
c0103193:	50                   	push   %eax
c0103194:	ff 75 b8             	pushl  -0x48(%ebp)
c0103197:	ff 75 ec             	pushl  -0x14(%ebp)
c010319a:	e8 25 e9 ff ff       	call   c0101ac4 <rd_wt>
c010319f:	83 c4 20             	add    $0x20,%esp
c01031a2:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c01031a9:	00 00 00 
c01031ac:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c01031b3:	00 00 00 
c01031b6:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c01031bd:	00 00 00 
c01031c0:	83 ec 0c             	sub    $0xc,%esp
c01031c3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c01031c9:	50                   	push   %eax
c01031ca:	e8 ed 04 00 00       	call   c01036bc <sync_inode>
c01031cf:	83 c4 10             	add    $0x10,%esp
c01031d2:	83 ec 0c             	sub    $0xc,%esp
c01031d5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c01031db:	50                   	push   %eax
c01031dc:	e8 2f 06 00 00       	call   c0103810 <put_inode>
c01031e1:	83 c4 10             	add    $0x10,%esp
c01031e4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01031e7:	8b 00                	mov    (%eax),%eax
c01031e9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01031ec:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c01031f3:	8b 45 98             	mov    -0x68(%ebp),%eax
c01031f6:	8b 40 04             	mov    0x4(%eax),%eax
c01031f9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01031fc:	8b 45 98             	mov    -0x68(%ebp),%eax
c01031ff:	8b 40 0c             	mov    0xc(%eax),%eax
c0103202:	89 45 90             	mov    %eax,-0x70(%ebp)
c0103205:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103208:	c1 e8 04             	shr    $0x4,%eax
c010320b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010320e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0103215:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010321c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0103223:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010322a:	e9 a5 00 00 00       	jmp    c01032d4 <do_unlink+0x47f>
c010322f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103234:	89 c1                	mov    %eax,%ecx
c0103236:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0103239:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010323c:	01 d0                	add    %edx,%eax
c010323e:	83 ec 0c             	sub    $0xc,%esp
c0103241:	6a 07                	push   $0x7
c0103243:	68 00 02 00 00       	push   $0x200
c0103248:	51                   	push   %ecx
c0103249:	ff 75 b8             	pushl  -0x48(%ebp)
c010324c:	50                   	push   %eax
c010324d:	e8 72 e8 ff ff       	call   c0101ac4 <rd_wt>
c0103252:	83 c4 20             	add    $0x20,%esp
c0103255:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010325a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010325d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0103264:	eb 51                	jmp    c01032b7 <do_unlink+0x462>
c0103266:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010326a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010326d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103270:	7f 4f                	jg     c01032c1 <do_unlink+0x46c>
c0103272:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103275:	83 c0 10             	add    $0x10,%eax
c0103278:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010327b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010327e:	83 c0 04             	add    $0x4,%eax
c0103281:	83 ec 08             	sub    $0x8,%esp
c0103284:	ff 75 08             	pushl  0x8(%ebp)
c0103287:	50                   	push   %eax
c0103288:	e8 9f 68 00 00       	call   c0109b2c <strcmp>
c010328d:	83 c4 10             	add    $0x10,%esp
c0103290:	85 c0                	test   %eax,%eax
c0103292:	75 1b                	jne    c01032af <do_unlink+0x45a>
c0103294:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c010329b:	83 ec 04             	sub    $0x4,%esp
c010329e:	6a 10                	push   $0x10
c01032a0:	6a 00                	push   $0x0
c01032a2:	ff 75 d4             	pushl  -0x2c(%ebp)
c01032a5:	e8 c5 8f 00 00       	call   c010c26f <Memset>
c01032aa:	83 c4 10             	add    $0x10,%esp
c01032ad:	eb 13                	jmp    c01032c2 <do_unlink+0x46d>
c01032af:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c01032b3:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c01032b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01032ba:	3b 45 90             	cmp    -0x70(%ebp),%eax
c01032bd:	7c a7                	jl     c0103266 <do_unlink+0x411>
c01032bf:	eb 01                	jmp    c01032c2 <do_unlink+0x46d>
c01032c1:	90                   	nop
c01032c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01032c5:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01032c8:	7f 16                	jg     c01032e0 <do_unlink+0x48b>
c01032ca:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01032ce:	75 10                	jne    c01032e0 <do_unlink+0x48b>
c01032d0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c01032d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032d7:	3b 45 90             	cmp    -0x70(%ebp),%eax
c01032da:	0f 8c 4f ff ff ff    	jl     c010322f <do_unlink+0x3da>
c01032e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01032e3:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01032e6:	75 17                	jne    c01032ff <do_unlink+0x4aa>
c01032e8:	8b 45 98             	mov    -0x68(%ebp),%eax
c01032eb:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01032ee:	89 50 04             	mov    %edx,0x4(%eax)
c01032f1:	83 ec 0c             	sub    $0xc,%esp
c01032f4:	ff 75 98             	pushl  -0x68(%ebp)
c01032f7:	e8 c0 03 00 00       	call   c01036bc <sync_inode>
c01032fc:	83 c4 10             	add    $0x10,%esp
c01032ff:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0103303:	74 26                	je     c010332b <do_unlink+0x4d6>
c0103305:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010330a:	89 c1                	mov    %eax,%ecx
c010330c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c010330f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103312:	01 d0                	add    %edx,%eax
c0103314:	83 ec 0c             	sub    $0xc,%esp
c0103317:	6a 0a                	push   $0xa
c0103319:	68 00 02 00 00       	push   $0x200
c010331e:	51                   	push   %ecx
c010331f:	ff 75 b8             	pushl  -0x48(%ebp)
c0103322:	50                   	push   %eax
c0103323:	e8 9c e7 ff ff       	call   c0101ac4 <rd_wt>
c0103328:	83 c4 20             	add    $0x20,%esp
c010332b:	90                   	nop
c010332c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010332f:	c9                   	leave  
c0103330:	c3                   	ret    

c0103331 <do_rdwt>:
c0103331:	55                   	push   %ebp
c0103332:	89 e5                	mov    %esp,%ebp
c0103334:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010333a:	8b 45 08             	mov    0x8(%ebp),%eax
c010333d:	8b 40 78             	mov    0x78(%eax),%eax
c0103340:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103343:	8b 45 08             	mov    0x8(%ebp),%eax
c0103346:	8b 40 60             	mov    0x60(%eax),%eax
c0103349:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010334c:	8b 45 08             	mov    0x8(%ebp),%eax
c010334f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103352:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103355:	8b 45 08             	mov    0x8(%ebp),%eax
c0103358:	8b 00                	mov    (%eax),%eax
c010335a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010335d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103360:	8b 40 10             	mov    0x10(%eax),%eax
c0103363:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103366:	8b 45 08             	mov    0x8(%ebp),%eax
c0103369:	8b 40 50             	mov    0x50(%eax),%eax
c010336c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010336f:	83 ec 0c             	sub    $0xc,%esp
c0103372:	ff 75 d0             	pushl  -0x30(%ebp)
c0103375:	e8 0c 07 00 00       	call   c0103a86 <pid2proc>
c010337a:	83 c4 10             	add    $0x10,%esp
c010337d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103380:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103383:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0103386:	83 c2 4c             	add    $0x4c,%edx
c0103389:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010338d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103390:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103393:	8b 40 08             	mov    0x8(%eax),%eax
c0103396:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103399:	8b 45 08             	mov    0x8(%ebp),%eax
c010339c:	8b 00                	mov    (%eax),%eax
c010339e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01033a1:	83 ec 08             	sub    $0x8,%esp
c01033a4:	ff 75 bc             	pushl  -0x44(%ebp)
c01033a7:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01033ad:	50                   	push   %eax
c01033ae:	e8 0d f2 ff ff       	call   c01025c0 <get_inode>
c01033b3:	83 c4 10             	add    $0x10,%esp
c01033b6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01033b9:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c01033bd:	75 10                	jne    c01033cf <do_rdwt+0x9e>
c01033bf:	83 ec 0c             	sub    $0xc,%esp
c01033c2:	68 28 b5 10 c0       	push   $0xc010b528
c01033c7:	e8 6b 57 00 00       	call   c0108b37 <panic>
c01033cc:	83 c4 10             	add    $0x10,%esp
c01033cf:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01033d5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01033d8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01033db:	8b 40 04             	mov    0x4(%eax),%eax
c01033de:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01033e1:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01033e5:	74 22                	je     c0103409 <do_rdwt+0xd8>
c01033e7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01033eb:	74 1c                	je     c0103409 <do_rdwt+0xd8>
c01033ed:	68 a8 04 00 00       	push   $0x4a8
c01033f2:	68 94 b3 10 c0       	push   $0xc010b394
c01033f7:	68 94 b3 10 c0       	push   $0xc010b394
c01033fc:	68 38 b5 10 c0       	push   $0xc010b538
c0103401:	e8 4f 57 00 00       	call   c0108b55 <assertion_failure>
c0103406:	83 c4 10             	add    $0x10,%esp
c0103409:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c010340f:	83 f8 01             	cmp    $0x1,%eax
c0103412:	0f 85 86 00 00 00    	jne    c010349e <do_rdwt+0x16d>
c0103418:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010341c:	75 09                	jne    c0103427 <do_rdwt+0xf6>
c010341e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103425:	eb 0d                	jmp    c0103434 <do_rdwt+0x103>
c0103427:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010342b:	75 07                	jne    c0103434 <do_rdwt+0x103>
c010342d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103434:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103437:	8b 45 08             	mov    0x8(%ebp),%eax
c010343a:	89 50 78             	mov    %edx,0x78(%eax)
c010343d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103440:	8b 45 08             	mov    0x8(%ebp),%eax
c0103443:	89 50 68             	mov    %edx,0x68(%eax)
c0103446:	83 ec 04             	sub    $0x4,%esp
c0103449:	6a 04                	push   $0x4
c010344b:	ff 75 08             	pushl  0x8(%ebp)
c010344e:	6a 03                	push   $0x3
c0103450:	e8 70 63 00 00       	call   c01097c5 <send_rec>
c0103455:	83 c4 10             	add    $0x10,%esp
c0103458:	8b 45 08             	mov    0x8(%ebp),%eax
c010345b:	8b 40 78             	mov    0x78(%eax),%eax
c010345e:	83 f8 66             	cmp    $0x66,%eax
c0103461:	75 13                	jne    c0103476 <do_rdwt+0x145>
c0103463:	83 ec 04             	sub    $0x4,%esp
c0103466:	ff 75 b8             	pushl  -0x48(%ebp)
c0103469:	ff 75 08             	pushl  0x8(%ebp)
c010346c:	6a 01                	push   $0x1
c010346e:	e8 52 63 00 00       	call   c01097c5 <send_rec>
c0103473:	83 c4 10             	add    $0x10,%esp
c0103476:	8b 45 08             	mov    0x8(%ebp),%eax
c0103479:	8b 40 78             	mov    0x78(%eax),%eax
c010347c:	83 f8 65             	cmp    $0x65,%eax
c010347f:	75 13                	jne    c0103494 <do_rdwt+0x163>
c0103481:	83 ec 04             	sub    $0x4,%esp
c0103484:	ff 75 b8             	pushl  -0x48(%ebp)
c0103487:	ff 75 08             	pushl  0x8(%ebp)
c010348a:	6a 01                	push   $0x1
c010348c:	e8 34 63 00 00       	call   c01097c5 <send_rec>
c0103491:	83 c4 10             	add    $0x10,%esp
c0103494:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103499:	e9 1c 02 00 00       	jmp    c01036ba <do_rdwt+0x389>
c010349e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01034a2:	75 18                	jne    c01034bc <do_rdwt+0x18b>
c01034a4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01034aa:	c1 e0 09             	shl    $0x9,%eax
c01034ad:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c01034b0:	75 0a                	jne    c01034bc <do_rdwt+0x18b>
c01034b2:	b8 00 00 00 00       	mov    $0x0,%eax
c01034b7:	e9 fe 01 00 00       	jmp    c01036ba <do_rdwt+0x389>
c01034bc:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01034c0:	75 14                	jne    c01034d6 <do_rdwt+0x1a5>
c01034c2:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01034c5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034c8:	01 d0                	add    %edx,%eax
c01034ca:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01034cd:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c01034d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01034d4:	eb 19                	jmp    c01034ef <do_rdwt+0x1be>
c01034d6:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01034d9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034dc:	01 c2                	add    %eax,%edx
c01034de:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01034e4:	c1 e0 09             	shl    $0x9,%eax
c01034e7:	39 c2                	cmp    %eax,%edx
c01034e9:	0f 4e c2             	cmovle %edx,%eax
c01034ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01034ef:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01034f2:	99                   	cltd   
c01034f3:	c1 ea 17             	shr    $0x17,%edx
c01034f6:	01 d0                	add    %edx,%eax
c01034f8:	25 ff 01 00 00       	and    $0x1ff,%eax
c01034fd:	29 d0                	sub    %edx,%eax
c01034ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103502:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103508:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010350b:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103511:	85 c0                	test   %eax,%eax
c0103513:	0f 48 c1             	cmovs  %ecx,%eax
c0103516:	c1 f8 09             	sar    $0x9,%eax
c0103519:	01 d0                	add    %edx,%eax
c010351b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010351e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103524:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103527:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010352d:	85 c0                	test   %eax,%eax
c010352f:	0f 48 c1             	cmovs  %ecx,%eax
c0103532:	c1 f8 09             	sar    $0x9,%eax
c0103535:	01 d0                	add    %edx,%eax
c0103537:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010353a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010353d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103540:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103545:	39 d0                	cmp    %edx,%eax
c0103547:	7d 0b                	jge    c0103554 <do_rdwt+0x223>
c0103549:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010354c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010354f:	83 c0 01             	add    $0x1,%eax
c0103552:	eb 05                	jmp    c0103559 <do_rdwt+0x228>
c0103554:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103559:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010355c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010355f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103562:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103569:	8b 45 08             	mov    0x8(%ebp),%eax
c010356c:	8b 00                	mov    (%eax),%eax
c010356e:	83 ec 0c             	sub    $0xc,%esp
c0103571:	50                   	push   %eax
c0103572:	e8 0f 05 00 00       	call   c0103a86 <pid2proc>
c0103577:	83 c4 10             	add    $0x10,%esp
c010357a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010357d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103580:	83 ec 08             	sub    $0x8,%esp
c0103583:	50                   	push   %eax
c0103584:	ff 75 cc             	pushl  -0x34(%ebp)
c0103587:	e8 43 2b 00 00       	call   c01060cf <alloc_virtual_memory>
c010358c:	83 c4 10             	add    $0x10,%esp
c010358f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103592:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103595:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103598:	e9 c5 00 00 00       	jmp    c0103662 <do_rdwt+0x331>
c010359d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01035a0:	c1 e0 09             	shl    $0x9,%eax
c01035a3:	2b 45 ec             	sub    -0x14(%ebp),%eax
c01035a6:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c01035a9:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c01035ad:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01035b0:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c01035b7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01035bb:	75 46                	jne    c0103603 <do_rdwt+0x2d2>
c01035bd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01035c0:	c1 e0 09             	shl    $0x9,%eax
c01035c3:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01035c9:	83 ec 0c             	sub    $0xc,%esp
c01035cc:	6a 07                	push   $0x7
c01035ce:	50                   	push   %eax
c01035cf:	52                   	push   %edx
c01035d0:	ff 75 90             	pushl  -0x70(%ebp)
c01035d3:	ff 75 e0             	pushl  -0x20(%ebp)
c01035d6:	e8 e9 e4 ff ff       	call   c0101ac4 <rd_wt>
c01035db:	83 c4 20             	add    $0x20,%esp
c01035de:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01035e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01035e7:	01 d0                	add    %edx,%eax
c01035e9:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01035ec:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01035ef:	01 ca                	add    %ecx,%edx
c01035f1:	83 ec 04             	sub    $0x4,%esp
c01035f4:	ff 75 94             	pushl  -0x6c(%ebp)
c01035f7:	50                   	push   %eax
c01035f8:	52                   	push   %edx
c01035f9:	e8 3e 39 00 00       	call   c0106f3c <Memcpy>
c01035fe:	83 c4 10             	add    $0x10,%esp
c0103601:	eb 46                	jmp    c0103649 <do_rdwt+0x318>
c0103603:	8b 55 98             	mov    -0x68(%ebp),%edx
c0103606:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103609:	01 d0                	add    %edx,%eax
c010360b:	89 c1                	mov    %eax,%ecx
c010360d:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103613:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103616:	01 d0                	add    %edx,%eax
c0103618:	83 ec 04             	sub    $0x4,%esp
c010361b:	ff 75 94             	pushl  -0x6c(%ebp)
c010361e:	51                   	push   %ecx
c010361f:	50                   	push   %eax
c0103620:	e8 17 39 00 00       	call   c0106f3c <Memcpy>
c0103625:	83 c4 10             	add    $0x10,%esp
c0103628:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010362b:	c1 e0 09             	shl    $0x9,%eax
c010362e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103634:	83 ec 0c             	sub    $0xc,%esp
c0103637:	6a 0a                	push   $0xa
c0103639:	50                   	push   %eax
c010363a:	52                   	push   %edx
c010363b:	ff 75 90             	pushl  -0x70(%ebp)
c010363e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103641:	e8 7e e4 ff ff       	call   c0101ac4 <rd_wt>
c0103646:	83 c4 20             	add    $0x20,%esp
c0103649:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010364c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010364f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103652:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103655:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010365c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010365f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103662:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103665:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103668:	7f 0a                	jg     c0103674 <do_rdwt+0x343>
c010366a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010366e:	0f 85 29 ff ff ff    	jne    c010359d <do_rdwt+0x26c>
c0103674:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103677:	8b 50 04             	mov    0x4(%eax),%edx
c010367a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010367d:	01 c2                	add    %eax,%edx
c010367f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103682:	89 50 04             	mov    %edx,0x4(%eax)
c0103685:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103688:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010368b:	01 c2                	add    %eax,%edx
c010368d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103693:	39 c2                	cmp    %eax,%edx
c0103695:	7e 20                	jle    c01036b7 <do_rdwt+0x386>
c0103697:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010369a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010369d:	01 d0                	add    %edx,%eax
c010369f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01036a5:	83 ec 0c             	sub    $0xc,%esp
c01036a8:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01036ae:	50                   	push   %eax
c01036af:	e8 08 00 00 00       	call   c01036bc <sync_inode>
c01036b4:	83 c4 10             	add    $0x10,%esp
c01036b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01036ba:	c9                   	leave  
c01036bb:	c3                   	ret    

c01036bc <sync_inode>:
c01036bc:	55                   	push   %ebp
c01036bd:	89 e5                	mov    %esp,%ebp
c01036bf:	53                   	push   %ebx
c01036c0:	83 ec 34             	sub    $0x34,%esp
c01036c3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01036ca:	eb 74                	jmp    c0103740 <sync_inode+0x84>
c01036cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01036cf:	89 d0                	mov    %edx,%eax
c01036d1:	c1 e0 02             	shl    $0x2,%eax
c01036d4:	01 d0                	add    %edx,%eax
c01036d6:	c1 e0 03             	shl    $0x3,%eax
c01036d9:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01036de:	8b 10                	mov    (%eax),%edx
c01036e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01036e3:	8b 40 10             	mov    0x10(%eax),%eax
c01036e6:	39 c2                	cmp    %eax,%edx
c01036e8:	75 52                	jne    c010373c <sync_inode+0x80>
c01036ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01036ed:	89 d0                	mov    %edx,%eax
c01036ef:	c1 e0 02             	shl    $0x2,%eax
c01036f2:	01 d0                	add    %edx,%eax
c01036f4:	c1 e0 03             	shl    $0x3,%eax
c01036f7:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c01036fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103700:	8b 08                	mov    (%eax),%ecx
c0103702:	89 0a                	mov    %ecx,(%edx)
c0103704:	8b 48 04             	mov    0x4(%eax),%ecx
c0103707:	89 4a 04             	mov    %ecx,0x4(%edx)
c010370a:	8b 48 08             	mov    0x8(%eax),%ecx
c010370d:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103710:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103713:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103716:	8b 48 10             	mov    0x10(%eax),%ecx
c0103719:	89 4a 10             	mov    %ecx,0x10(%edx)
c010371c:	8b 48 14             	mov    0x14(%eax),%ecx
c010371f:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103722:	8b 48 18             	mov    0x18(%eax),%ecx
c0103725:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103728:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010372b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010372e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103731:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103734:	8b 40 24             	mov    0x24(%eax),%eax
c0103737:	89 42 24             	mov    %eax,0x24(%edx)
c010373a:	eb 0a                	jmp    c0103746 <sync_inode+0x8a>
c010373c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103740:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103744:	7e 86                	jle    c01036cc <sync_inode+0x10>
c0103746:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010374d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103750:	8b 40 10             	mov    0x10(%eax),%eax
c0103753:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103756:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103759:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010375c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103761:	99                   	cltd   
c0103762:	f7 7d f0             	idivl  -0x10(%ebp)
c0103765:	89 c3                	mov    %eax,%ebx
c0103767:	89 c8                	mov    %ecx,%eax
c0103769:	99                   	cltd   
c010376a:	f7 fb                	idiv   %ebx
c010376c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010376f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103772:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103775:	b8 00 02 00 00       	mov    $0x200,%eax
c010377a:	99                   	cltd   
c010377b:	f7 7d f0             	idivl  -0x10(%ebp)
c010377e:	89 c3                	mov    %eax,%ebx
c0103780:	89 c8                	mov    %ecx,%eax
c0103782:	99                   	cltd   
c0103783:	f7 fb                	idiv   %ebx
c0103785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103788:	8b 45 08             	mov    0x8(%ebp),%eax
c010378b:	8b 40 20             	mov    0x20(%eax),%eax
c010378e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103791:	e8 0a 01 00 00       	call   c01038a0 <get_super_block>
c0103796:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103799:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010379c:	8b 40 04             	mov    0x4(%eax),%eax
c010379f:	8d 50 02             	lea    0x2(%eax),%edx
c01037a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01037a5:	8b 40 08             	mov    0x8(%eax),%eax
c01037a8:	01 c2                	add    %eax,%edx
c01037aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01037ad:	01 d0                	add    %edx,%eax
c01037af:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01037b2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01037b7:	83 ec 0c             	sub    $0xc,%esp
c01037ba:	6a 07                	push   $0x7
c01037bc:	68 00 02 00 00       	push   $0x200
c01037c1:	50                   	push   %eax
c01037c2:	ff 75 e0             	pushl  -0x20(%ebp)
c01037c5:	ff 75 d8             	pushl  -0x28(%ebp)
c01037c8:	e8 f7 e2 ff ff       	call   c0101ac4 <rd_wt>
c01037cd:	83 c4 20             	add    $0x20,%esp
c01037d0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01037d5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01037d8:	83 ec 04             	sub    $0x4,%esp
c01037db:	ff 75 f0             	pushl  -0x10(%ebp)
c01037de:	ff 75 08             	pushl  0x8(%ebp)
c01037e1:	ff 75 d4             	pushl  -0x2c(%ebp)
c01037e4:	e8 53 37 00 00       	call   c0106f3c <Memcpy>
c01037e9:	83 c4 10             	add    $0x10,%esp
c01037ec:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01037f1:	83 ec 0c             	sub    $0xc,%esp
c01037f4:	6a 0a                	push   $0xa
c01037f6:	68 00 02 00 00       	push   $0x200
c01037fb:	50                   	push   %eax
c01037fc:	ff 75 e0             	pushl  -0x20(%ebp)
c01037ff:	ff 75 d8             	pushl  -0x28(%ebp)
c0103802:	e8 bd e2 ff ff       	call   c0101ac4 <rd_wt>
c0103807:	83 c4 20             	add    $0x20,%esp
c010380a:	90                   	nop
c010380b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010380e:	c9                   	leave  
c010380f:	c3                   	ret    

c0103810 <put_inode>:
c0103810:	55                   	push   %ebp
c0103811:	89 e5                	mov    %esp,%ebp
c0103813:	83 ec 08             	sub    $0x8,%esp
c0103816:	8b 45 08             	mov    0x8(%ebp),%eax
c0103819:	8b 40 24             	mov    0x24(%eax),%eax
c010381c:	85 c0                	test   %eax,%eax
c010381e:	7f 1c                	jg     c010383c <put_inode+0x2c>
c0103820:	68 4d 05 00 00       	push   $0x54d
c0103825:	68 94 b3 10 c0       	push   $0xc010b394
c010382a:	68 94 b3 10 c0       	push   $0xc010b394
c010382f:	68 6c b5 10 c0       	push   $0xc010b56c
c0103834:	e8 1c 53 00 00       	call   c0108b55 <assertion_failure>
c0103839:	83 c4 10             	add    $0x10,%esp
c010383c:	8b 45 08             	mov    0x8(%ebp),%eax
c010383f:	8b 40 24             	mov    0x24(%eax),%eax
c0103842:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103845:	8b 45 08             	mov    0x8(%ebp),%eax
c0103848:	89 50 24             	mov    %edx,0x24(%eax)
c010384b:	90                   	nop
c010384c:	c9                   	leave  
c010384d:	c3                   	ret    

c010384e <do_close>:
c010384e:	55                   	push   %ebp
c010384f:	89 e5                	mov    %esp,%ebp
c0103851:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103856:	8b 55 08             	mov    0x8(%ebp),%edx
c0103859:	83 c2 4c             	add    $0x4c,%edx
c010385c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103860:	8b 50 0c             	mov    0xc(%eax),%edx
c0103863:	83 ea 01             	sub    $0x1,%edx
c0103866:	89 50 0c             	mov    %edx,0xc(%eax)
c0103869:	8b 40 0c             	mov    0xc(%eax),%eax
c010386c:	85 c0                	test   %eax,%eax
c010386e:	75 16                	jne    c0103886 <do_close+0x38>
c0103870:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103875:	8b 55 08             	mov    0x8(%ebp),%edx
c0103878:	83 c2 4c             	add    $0x4c,%edx
c010387b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010387f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103886:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010388b:	8b 55 08             	mov    0x8(%ebp),%edx
c010388e:	83 c2 4c             	add    $0x4c,%edx
c0103891:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103898:	00 
c0103899:	b8 00 00 00 00       	mov    $0x0,%eax
c010389e:	5d                   	pop    %ebp
c010389f:	c3                   	ret    

c01038a0 <get_super_block>:
c01038a0:	55                   	push   %ebp
c01038a1:	89 e5                	mov    %esp,%ebp
c01038a3:	83 ec 08             	sub    $0x8,%esp
c01038a6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01038ab:	83 ec 0c             	sub    $0xc,%esp
c01038ae:	6a 07                	push   $0x7
c01038b0:	68 00 02 00 00       	push   $0x200
c01038b5:	50                   	push   %eax
c01038b6:	6a 20                	push   $0x20
c01038b8:	6a 01                	push   $0x1
c01038ba:	e8 05 e2 ff ff       	call   c0101ac4 <rd_wt>
c01038bf:	83 c4 20             	add    $0x20,%esp
c01038c2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01038c8:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01038cd:	8b 0a                	mov    (%edx),%ecx
c01038cf:	89 08                	mov    %ecx,(%eax)
c01038d1:	8b 4a 04             	mov    0x4(%edx),%ecx
c01038d4:	89 48 04             	mov    %ecx,0x4(%eax)
c01038d7:	8b 4a 08             	mov    0x8(%edx),%ecx
c01038da:	89 48 08             	mov    %ecx,0x8(%eax)
c01038dd:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01038e0:	89 48 0c             	mov    %ecx,0xc(%eax)
c01038e3:	8b 4a 10             	mov    0x10(%edx),%ecx
c01038e6:	89 48 10             	mov    %ecx,0x10(%eax)
c01038e9:	8b 4a 14             	mov    0x14(%edx),%ecx
c01038ec:	89 48 14             	mov    %ecx,0x14(%eax)
c01038ef:	8b 4a 18             	mov    0x18(%edx),%ecx
c01038f2:	89 48 18             	mov    %ecx,0x18(%eax)
c01038f5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01038f8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01038fb:	8b 52 20             	mov    0x20(%edx),%edx
c01038fe:	89 50 20             	mov    %edx,0x20(%eax)
c0103901:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0103906:	c9                   	leave  
c0103907:	c3                   	ret    

c0103908 <schedule_process>:
c0103908:	55                   	push   %ebp
c0103909:	89 e5                	mov    %esp,%ebp
c010390b:	83 ec 18             	sub    $0x18,%esp
c010390e:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103915:	e8 22 cb ff ff       	call   c010043c <get_running_thread_pcb>
c010391a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010391d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103920:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103927:	84 c0                	test   %al,%al
c0103929:	75 35                	jne    c0103960 <schedule_process+0x58>
c010392b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010392e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103934:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103937:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010393d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103940:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103947:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010394a:	05 60 02 00 00       	add    $0x260,%eax
c010394f:	83 ec 08             	sub    $0x8,%esp
c0103952:	50                   	push   %eax
c0103953:	68 ec fd 10 c0       	push   $0xc010fdec
c0103958:	e8 9a 6b 00 00       	call   c010a4f7 <insertToDoubleLinkList>
c010395d:	83 c4 10             	add    $0x10,%esp
c0103960:	83 ec 0c             	sub    $0xc,%esp
c0103963:	68 ec fd 10 c0       	push   $0xc010fdec
c0103968:	e8 a6 69 00 00       	call   c010a313 <isListEmpty>
c010396d:	83 c4 10             	add    $0x10,%esp
c0103970:	84 c0                	test   %al,%al
c0103972:	74 19                	je     c010398d <schedule_process+0x85>
c0103974:	6a 1e                	push   $0x1e
c0103976:	68 7b b5 10 c0       	push   $0xc010b57b
c010397b:	68 7b b5 10 c0       	push   $0xc010b57b
c0103980:	68 85 b5 10 c0       	push   $0xc010b585
c0103985:	e8 cb 51 00 00       	call   c0108b55 <assertion_failure>
c010398a:	83 c4 10             	add    $0x10,%esp
c010398d:	83 ec 0c             	sub    $0xc,%esp
c0103990:	68 ec fd 10 c0       	push   $0xc010fdec
c0103995:	e8 e0 6b 00 00       	call   c010a57a <popFromDoubleLinkList>
c010399a:	83 c4 10             	add    $0x10,%esp
c010399d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01039a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01039a3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01039a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01039ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039ae:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01039b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039b8:	8b 50 08             	mov    0x8(%eax),%edx
c01039bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01039be:	39 c2                	cmp    %eax,%edx
c01039c0:	74 28                	je     c01039ea <schedule_process+0xe2>
c01039c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039c5:	05 00 10 00 00       	add    $0x1000,%eax
c01039ca:	83 ec 0c             	sub    $0xc,%esp
c01039cd:	50                   	push   %eax
c01039ce:	e8 5a ca ff ff       	call   c010042d <update_tss>
c01039d3:	83 c4 10             	add    $0x10,%esp
c01039d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039d9:	8b 40 08             	mov    0x8(%eax),%eax
c01039dc:	83 ec 0c             	sub    $0xc,%esp
c01039df:	50                   	push   %eax
c01039e0:	e8 3b ca ff ff       	call   c0100420 <update_cr3>
c01039e5:	83 c4 10             	add    $0x10,%esp
c01039e8:	eb 0f                	jmp    c01039f9 <schedule_process+0xf1>
c01039ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01039ed:	83 ec 0c             	sub    $0xc,%esp
c01039f0:	50                   	push   %eax
c01039f1:	e8 2a ca ff ff       	call   c0100420 <update_cr3>
c01039f6:	83 c4 10             	add    $0x10,%esp
c01039f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039fc:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103a01:	83 ec 08             	sub    $0x8,%esp
c0103a04:	ff 75 e8             	pushl  -0x18(%ebp)
c0103a07:	ff 75 f0             	pushl  -0x10(%ebp)
c0103a0a:	e8 c1 68 00 00       	call   c010a2d0 <switch_to>
c0103a0f:	83 c4 10             	add    $0x10,%esp
c0103a12:	90                   	nop
c0103a13:	c9                   	leave  
c0103a14:	c3                   	ret    

c0103a15 <clock_handler>:
c0103a15:	55                   	push   %ebp
c0103a16:	89 e5                	mov    %esp,%ebp
c0103a18:	83 ec 18             	sub    $0x18,%esp
c0103a1b:	e8 1c ca ff ff       	call   c010043c <get_running_thread_pcb>
c0103a20:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a23:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0103a28:	85 c0                	test   %eax,%eax
c0103a2a:	74 0d                	je     c0103a39 <clock_handler+0x24>
c0103a2c:	83 ec 0c             	sub    $0xc,%esp
c0103a2f:	6a 04                	push   $0x4
c0103a31:	e8 29 60 00 00       	call   c0109a5f <inform_int>
c0103a36:	83 c4 10             	add    $0x10,%esp
c0103a39:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103a3e:	83 f8 64             	cmp    $0x64,%eax
c0103a41:	75 0c                	jne    c0103a4f <clock_handler+0x3a>
c0103a43:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c0103a4a:	00 00 00 
c0103a4d:	eb 0a                	jmp    c0103a59 <clock_handler+0x44>
c0103a4f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103a54:	83 f8 01             	cmp    $0x1,%eax
c0103a57:	75 2a                	jne    c0103a83 <clock_handler+0x6e>
c0103a59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a5c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103a62:	85 c0                	test   %eax,%eax
c0103a64:	74 16                	je     c0103a7c <clock_handler+0x67>
c0103a66:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c0103a6b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103a71:	83 ea 01             	sub    $0x1,%edx
c0103a74:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0103a7a:	eb 08                	jmp    c0103a84 <clock_handler+0x6f>
c0103a7c:	e8 87 fe ff ff       	call   c0103908 <schedule_process>
c0103a81:	eb 01                	jmp    c0103a84 <clock_handler+0x6f>
c0103a83:	90                   	nop
c0103a84:	c9                   	leave  
c0103a85:	c3                   	ret    

c0103a86 <pid2proc>:
c0103a86:	55                   	push   %ebp
c0103a87:	89 e5                	mov    %esp,%ebp
c0103a89:	83 ec 20             	sub    $0x20,%esp
c0103a8c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103a93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103a9a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c0103a9f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103aa5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103aa8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103aab:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103ab0:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103ab6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103ab9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0103abc:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103ac1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103ac4:	eb 36                	jmp    c0103afc <pid2proc+0x76>
c0103ac6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ac9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103ace:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103ad1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103ad5:	75 07                	jne    c0103ade <pid2proc+0x58>
c0103ad7:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c0103ade:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103ae1:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103ae7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103aea:	39 c2                	cmp    %eax,%edx
c0103aec:	75 05                	jne    c0103af3 <pid2proc+0x6d>
c0103aee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103af1:	eb 17                	jmp    c0103b0a <pid2proc+0x84>
c0103af3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103af6:	8b 40 04             	mov    0x4(%eax),%eax
c0103af9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103afc:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103b03:	75 c1                	jne    c0103ac6 <pid2proc+0x40>
c0103b05:	b8 00 00 00 00       	mov    $0x0,%eax
c0103b0a:	c9                   	leave  
c0103b0b:	c3                   	ret    

c0103b0c <proc2pid>:
c0103b0c:	55                   	push   %ebp
c0103b0d:	89 e5                	mov    %esp,%ebp
c0103b0f:	83 ec 10             	sub    $0x10,%esp
c0103b12:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b15:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0103b1b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103b1e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b21:	c9                   	leave  
c0103b22:	c3                   	ret    

c0103b23 <InitDescriptor>:
c0103b23:	55                   	push   %ebp
c0103b24:	89 e5                	mov    %esp,%ebp
c0103b26:	83 ec 04             	sub    $0x4,%esp
c0103b29:	8b 45 14             	mov    0x14(%ebp),%eax
c0103b2c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103b30:	8b 45 10             	mov    0x10(%ebp),%eax
c0103b33:	89 c2                	mov    %eax,%edx
c0103b35:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b38:	66 89 10             	mov    %dx,(%eax)
c0103b3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b3e:	89 c2                	mov    %eax,%edx
c0103b40:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b43:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103b47:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b4a:	c1 e8 10             	shr    $0x10,%eax
c0103b4d:	89 c2                	mov    %eax,%edx
c0103b4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b52:	88 50 04             	mov    %dl,0x4(%eax)
c0103b55:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103b59:	89 c2                	mov    %eax,%edx
c0103b5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b5e:	88 50 05             	mov    %dl,0x5(%eax)
c0103b61:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103b65:	66 c1 e8 08          	shr    $0x8,%ax
c0103b69:	c1 e0 04             	shl    $0x4,%eax
c0103b6c:	89 c2                	mov    %eax,%edx
c0103b6e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103b71:	c1 e8 10             	shr    $0x10,%eax
c0103b74:	83 e0 0f             	and    $0xf,%eax
c0103b77:	09 c2                	or     %eax,%edx
c0103b79:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b7c:	88 50 06             	mov    %dl,0x6(%eax)
c0103b7f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b82:	c1 e8 18             	shr    $0x18,%eax
c0103b85:	89 c2                	mov    %eax,%edx
c0103b87:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b8a:	88 50 07             	mov    %dl,0x7(%eax)
c0103b8d:	90                   	nop
c0103b8e:	c9                   	leave  
c0103b8f:	c3                   	ret    

c0103b90 <Seg2PhyAddr>:
c0103b90:	55                   	push   %ebp
c0103b91:	89 e5                	mov    %esp,%ebp
c0103b93:	83 ec 10             	sub    $0x10,%esp
c0103b96:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b99:	c1 e8 03             	shr    $0x3,%eax
c0103b9c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103ba3:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c0103baa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103bad:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103bb0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103bb4:	0f b7 c0             	movzwl %ax,%eax
c0103bb7:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103bbb:	0f b6 d2             	movzbl %dl,%edx
c0103bbe:	c1 e2 10             	shl    $0x10,%edx
c0103bc1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103bc7:	09 d0                	or     %edx,%eax
c0103bc9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103bcc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bcf:	c9                   	leave  
c0103bd0:	c3                   	ret    

c0103bd1 <Seg2PhyAddrLDT>:
c0103bd1:	55                   	push   %ebp
c0103bd2:	89 e5                	mov    %esp,%ebp
c0103bd4:	83 ec 10             	sub    $0x10,%esp
c0103bd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bda:	c1 e8 03             	shr    $0x3,%eax
c0103bdd:	89 c2                	mov    %eax,%edx
c0103bdf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103be2:	83 c2 20             	add    $0x20,%edx
c0103be5:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103be9:	8b 02                	mov    (%edx),%eax
c0103beb:	8b 52 04             	mov    0x4(%edx),%edx
c0103bee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103bf1:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103bf4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103bf8:	0f b7 c0             	movzwl %ax,%eax
c0103bfb:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103bff:	0f b6 d2             	movzbl %dl,%edx
c0103c02:	c1 e2 10             	shl    $0x10,%edx
c0103c05:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103c0b:	09 d0                	or     %edx,%eax
c0103c0d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103c10:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c13:	c9                   	leave  
c0103c14:	c3                   	ret    

c0103c15 <VirAddr2PhyAddr>:
c0103c15:	55                   	push   %ebp
c0103c16:	89 e5                	mov    %esp,%ebp
c0103c18:	83 ec 10             	sub    $0x10,%esp
c0103c1b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103c1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c21:	01 d0                	add    %edx,%eax
c0103c23:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103c26:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c29:	c9                   	leave  
c0103c2a:	c3                   	ret    

c0103c2b <v2l>:
c0103c2b:	55                   	push   %ebp
c0103c2c:	89 e5                	mov    %esp,%ebp
c0103c2e:	83 ec 18             	sub    $0x18,%esp
c0103c31:	83 ec 0c             	sub    $0xc,%esp
c0103c34:	ff 75 08             	pushl  0x8(%ebp)
c0103c37:	e8 4a fe ff ff       	call   c0103a86 <pid2proc>
c0103c3c:	83 c4 10             	add    $0x10,%esp
c0103c3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103c42:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103c49:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103c4c:	83 ec 08             	sub    $0x8,%esp
c0103c4f:	ff 75 f4             	pushl  -0xc(%ebp)
c0103c52:	50                   	push   %eax
c0103c53:	e8 79 ff ff ff       	call   c0103bd1 <Seg2PhyAddrLDT>
c0103c58:	83 c4 10             	add    $0x10,%esp
c0103c5b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103c5e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103c61:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c64:	01 d0                	add    %edx,%eax
c0103c66:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103c69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c6c:	c9                   	leave  
c0103c6d:	c3                   	ret    

c0103c6e <init_propt>:
c0103c6e:	55                   	push   %ebp
c0103c6f:	89 e5                	mov    %esp,%ebp
c0103c71:	83 ec 38             	sub    $0x38,%esp
c0103c74:	6a 0e                	push   $0xe
c0103c76:	6a 08                	push   $0x8
c0103c78:	68 be 01 10 c0       	push   $0xc01001be
c0103c7d:	6a 20                	push   $0x20
c0103c7f:	e8 6b 01 00 00       	call   c0103def <InitInterruptDesc>
c0103c84:	83 c4 10             	add    $0x10,%esp
c0103c87:	6a 0e                	push   $0xe
c0103c89:	6a 08                	push   $0x8
c0103c8b:	68 ee 01 10 c0       	push   $0xc01001ee
c0103c90:	6a 21                	push   $0x21
c0103c92:	e8 58 01 00 00       	call   c0103def <InitInterruptDesc>
c0103c97:	83 c4 10             	add    $0x10,%esp
c0103c9a:	6a 0e                	push   $0xe
c0103c9c:	6a 08                	push   $0x8
c0103c9e:	68 31 02 10 c0       	push   $0xc0100231
c0103ca3:	6a 2e                	push   $0x2e
c0103ca5:	e8 45 01 00 00       	call   c0103def <InitInterruptDesc>
c0103caa:	83 c4 10             	add    $0x10,%esp
c0103cad:	6a 0e                	push   $0xe
c0103caf:	6a 08                	push   $0x8
c0103cb1:	68 77 02 10 c0       	push   $0xc0100277
c0103cb6:	6a 2a                	push   $0x2a
c0103cb8:	e8 32 01 00 00       	call   c0103def <InitInterruptDesc>
c0103cbd:	83 c4 10             	add    $0x10,%esp
c0103cc0:	83 ec 04             	sub    $0x4,%esp
c0103cc3:	68 e0 15 00 00       	push   $0x15e0
c0103cc8:	6a 00                	push   $0x0
c0103cca:	68 00 22 18 c0       	push   $0xc0182200
c0103ccf:	e8 9b 85 00 00       	call   c010c26f <Memset>
c0103cd4:	83 c4 10             	add    $0x10,%esp
c0103cd7:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103cde:	83 ec 04             	sub    $0x4,%esp
c0103ce1:	ff 75 f4             	pushl  -0xc(%ebp)
c0103ce4:	6a 00                	push   $0x0
c0103ce6:	68 40 06 11 c0       	push   $0xc0110640
c0103ceb:	e8 7f 85 00 00       	call   c010c26f <Memset>
c0103cf0:	83 c4 10             	add    $0x10,%esp
c0103cf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103cf6:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103cfb:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103d02:	00 00 00 
c0103d05:	83 ec 0c             	sub    $0xc,%esp
c0103d08:	6a 30                	push   $0x30
c0103d0a:	e8 81 fe ff ff       	call   c0103b90 <Seg2PhyAddr>
c0103d0f:	83 c4 10             	add    $0x10,%esp
c0103d12:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103d15:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103d1c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103d23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103d26:	0f b7 d0             	movzwl %ax,%edx
c0103d29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103d2c:	83 e8 01             	sub    $0x1,%eax
c0103d2f:	89 c1                	mov    %eax,%ecx
c0103d31:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103d34:	52                   	push   %edx
c0103d35:	51                   	push   %ecx
c0103d36:	50                   	push   %eax
c0103d37:	68 00 f8 10 c0       	push   $0xc010f800
c0103d3c:	e8 e2 fd ff ff       	call   c0103b23 <InitDescriptor>
c0103d41:	83 c4 10             	add    $0x10,%esp
c0103d44:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103d4b:	68 f2 00 00 00       	push   $0xf2
c0103d50:	68 ff ff 00 00       	push   $0xffff
c0103d55:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103d58:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103d5d:	e8 c1 fd ff ff       	call   c0103b23 <InitDescriptor>
c0103d62:	83 c4 10             	add    $0x10,%esp
c0103d65:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103d6c:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103d73:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103d7a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103d7d:	0f b7 c0             	movzwl %ax,%eax
c0103d80:	50                   	push   %eax
c0103d81:	ff 75 d8             	pushl  -0x28(%ebp)
c0103d84:	6a 00                	push   $0x0
c0103d86:	68 08 f8 10 c0       	push   $0xc010f808
c0103d8b:	e8 93 fd ff ff       	call   c0103b23 <InitDescriptor>
c0103d90:	83 c4 10             	add    $0x10,%esp
c0103d93:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103d96:	0f b7 c0             	movzwl %ax,%eax
c0103d99:	50                   	push   %eax
c0103d9a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103d9d:	6a 00                	push   $0x0
c0103d9f:	68 10 f8 10 c0       	push   $0xc010f810
c0103da4:	e8 7a fd ff ff       	call   c0103b23 <InitDescriptor>
c0103da9:	83 c4 10             	add    $0x10,%esp
c0103dac:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103db3:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103dba:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103dbd:	0f b7 c0             	movzwl %ax,%eax
c0103dc0:	50                   	push   %eax
c0103dc1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103dc4:	6a 00                	push   $0x0
c0103dc6:	68 18 f8 10 c0       	push   $0xc010f818
c0103dcb:	e8 53 fd ff ff       	call   c0103b23 <InitDescriptor>
c0103dd0:	83 c4 10             	add    $0x10,%esp
c0103dd3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103dd6:	0f b7 c0             	movzwl %ax,%eax
c0103dd9:	50                   	push   %eax
c0103dda:	ff 75 d8             	pushl  -0x28(%ebp)
c0103ddd:	6a 00                	push   $0x0
c0103ddf:	68 20 f8 10 c0       	push   $0xc010f820
c0103de4:	e8 3a fd ff ff       	call   c0103b23 <InitDescriptor>
c0103de9:	83 c4 10             	add    $0x10,%esp
c0103dec:	90                   	nop
c0103ded:	c9                   	leave  
c0103dee:	c3                   	ret    

c0103def <InitInterruptDesc>:
c0103def:	55                   	push   %ebp
c0103df0:	89 e5                	mov    %esp,%ebp
c0103df2:	83 ec 10             	sub    $0x10,%esp
c0103df5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df8:	c1 e0 03             	shl    $0x3,%eax
c0103dfb:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103e00:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103e03:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e06:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103e0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103e0d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103e10:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103e13:	89 c2                	mov    %eax,%edx
c0103e15:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e18:	66 89 10             	mov    %dx,(%eax)
c0103e1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e1e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103e24:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103e27:	c1 f8 10             	sar    $0x10,%eax
c0103e2a:	89 c2                	mov    %eax,%edx
c0103e2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e2f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103e33:	8b 45 10             	mov    0x10(%ebp),%eax
c0103e36:	c1 e0 04             	shl    $0x4,%eax
c0103e39:	89 c2                	mov    %eax,%edx
c0103e3b:	8b 45 14             	mov    0x14(%ebp),%eax
c0103e3e:	09 d0                	or     %edx,%eax
c0103e40:	89 c2                	mov    %eax,%edx
c0103e42:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e45:	88 50 05             	mov    %dl,0x5(%eax)
c0103e48:	90                   	nop
c0103e49:	c9                   	leave  
c0103e4a:	c3                   	ret    

c0103e4b <ReloadGDT>:
c0103e4b:	55                   	push   %ebp
c0103e4c:	89 e5                	mov    %esp,%ebp
c0103e4e:	83 ec 28             	sub    $0x28,%esp
c0103e51:	b8 d0 06 11 c0       	mov    $0xc01106d0,%eax
c0103e56:	0f b7 00             	movzwl (%eax),%eax
c0103e59:	98                   	cwtl   
c0103e5a:	ba d2 06 11 c0       	mov    $0xc01106d2,%edx
c0103e5f:	8b 12                	mov    (%edx),%edx
c0103e61:	83 ec 04             	sub    $0x4,%esp
c0103e64:	50                   	push   %eax
c0103e65:	52                   	push   %edx
c0103e66:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103e6b:	e8 d1 83 00 00       	call   c010c241 <Memcpy2>
c0103e70:	83 c4 10             	add    $0x10,%esp
c0103e73:	c7 45 f0 d0 06 11 c0 	movl   $0xc01106d0,-0x10(%ebp)
c0103e7a:	c7 45 ec d2 06 11 c0 	movl   $0xc01106d2,-0x14(%ebp)
c0103e81:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103e84:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103e89:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103e8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103e91:	89 10                	mov    %edx,(%eax)
c0103e93:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103e9a:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103ea1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103ea4:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103ea9:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103eae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103eb1:	89 10                	mov    %edx,(%eax)
c0103eb3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103eba:	eb 04                	jmp    c0103ec0 <ReloadGDT+0x75>
c0103ebc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103ec0:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103ec7:	7e f3                	jle    c0103ebc <ReloadGDT+0x71>
c0103ec9:	e8 a9 37 00 00       	call   c0107677 <init_internal_interrupt>
c0103ece:	e8 9b fd ff ff       	call   c0103c6e <init_propt>
c0103ed3:	90                   	nop
c0103ed4:	c9                   	leave  
c0103ed5:	c3                   	ret    

c0103ed6 <select_console>:
c0103ed6:	55                   	push   %ebp
c0103ed7:	89 e5                	mov    %esp,%ebp
c0103ed9:	83 ec 18             	sub    $0x18,%esp
c0103edc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103edf:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103ee2:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103ee6:	75 27                	jne    c0103f0f <select_console+0x39>
c0103ee8:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103eec:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103ef2:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103ef7:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103efc:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103f01:	83 ec 0c             	sub    $0xc,%esp
c0103f04:	50                   	push   %eax
c0103f05:	e8 08 00 00 00       	call   c0103f12 <flush>
c0103f0a:	83 c4 10             	add    $0x10,%esp
c0103f0d:	eb 01                	jmp    c0103f10 <select_console+0x3a>
c0103f0f:	90                   	nop
c0103f10:	c9                   	leave  
c0103f11:	c3                   	ret    

c0103f12 <flush>:
c0103f12:	55                   	push   %ebp
c0103f13:	89 e5                	mov    %esp,%ebp
c0103f15:	83 ec 08             	sub    $0x8,%esp
c0103f18:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f1b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f21:	8b 40 0c             	mov    0xc(%eax),%eax
c0103f24:	83 ec 0c             	sub    $0xc,%esp
c0103f27:	50                   	push   %eax
c0103f28:	e8 1e 00 00 00       	call   c0103f4b <set_cursor>
c0103f2d:	83 c4 10             	add    $0x10,%esp
c0103f30:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f33:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f39:	8b 40 08             	mov    0x8(%eax),%eax
c0103f3c:	83 ec 0c             	sub    $0xc,%esp
c0103f3f:	50                   	push   %eax
c0103f40:	e8 64 00 00 00       	call   c0103fa9 <set_console_start_video_addr>
c0103f45:	83 c4 10             	add    $0x10,%esp
c0103f48:	90                   	nop
c0103f49:	c9                   	leave  
c0103f4a:	c3                   	ret    

c0103f4b <set_cursor>:
c0103f4b:	55                   	push   %ebp
c0103f4c:	89 e5                	mov    %esp,%ebp
c0103f4e:	83 ec 08             	sub    $0x8,%esp
c0103f51:	83 ec 08             	sub    $0x8,%esp
c0103f54:	6a 0e                	push   $0xe
c0103f56:	68 d4 03 00 00       	push   $0x3d4
c0103f5b:	e8 de c3 ff ff       	call   c010033e <out_byte>
c0103f60:	83 c4 10             	add    $0x10,%esp
c0103f63:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f66:	c1 e8 08             	shr    $0x8,%eax
c0103f69:	0f b7 c0             	movzwl %ax,%eax
c0103f6c:	83 ec 08             	sub    $0x8,%esp
c0103f6f:	50                   	push   %eax
c0103f70:	68 d5 03 00 00       	push   $0x3d5
c0103f75:	e8 c4 c3 ff ff       	call   c010033e <out_byte>
c0103f7a:	83 c4 10             	add    $0x10,%esp
c0103f7d:	83 ec 08             	sub    $0x8,%esp
c0103f80:	6a 0f                	push   $0xf
c0103f82:	68 d4 03 00 00       	push   $0x3d4
c0103f87:	e8 b2 c3 ff ff       	call   c010033e <out_byte>
c0103f8c:	83 c4 10             	add    $0x10,%esp
c0103f8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f92:	0f b7 c0             	movzwl %ax,%eax
c0103f95:	83 ec 08             	sub    $0x8,%esp
c0103f98:	50                   	push   %eax
c0103f99:	68 d5 03 00 00       	push   $0x3d5
c0103f9e:	e8 9b c3 ff ff       	call   c010033e <out_byte>
c0103fa3:	83 c4 10             	add    $0x10,%esp
c0103fa6:	90                   	nop
c0103fa7:	c9                   	leave  
c0103fa8:	c3                   	ret    

c0103fa9 <set_console_start_video_addr>:
c0103fa9:	55                   	push   %ebp
c0103faa:	89 e5                	mov    %esp,%ebp
c0103fac:	83 ec 08             	sub    $0x8,%esp
c0103faf:	83 ec 08             	sub    $0x8,%esp
c0103fb2:	6a 0c                	push   $0xc
c0103fb4:	68 d4 03 00 00       	push   $0x3d4
c0103fb9:	e8 80 c3 ff ff       	call   c010033e <out_byte>
c0103fbe:	83 c4 10             	add    $0x10,%esp
c0103fc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fc4:	c1 e8 08             	shr    $0x8,%eax
c0103fc7:	0f b7 c0             	movzwl %ax,%eax
c0103fca:	83 ec 08             	sub    $0x8,%esp
c0103fcd:	50                   	push   %eax
c0103fce:	68 d5 03 00 00       	push   $0x3d5
c0103fd3:	e8 66 c3 ff ff       	call   c010033e <out_byte>
c0103fd8:	83 c4 10             	add    $0x10,%esp
c0103fdb:	83 ec 08             	sub    $0x8,%esp
c0103fde:	6a 0d                	push   $0xd
c0103fe0:	68 d4 03 00 00       	push   $0x3d4
c0103fe5:	e8 54 c3 ff ff       	call   c010033e <out_byte>
c0103fea:	83 c4 10             	add    $0x10,%esp
c0103fed:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff0:	0f b7 c0             	movzwl %ax,%eax
c0103ff3:	83 ec 08             	sub    $0x8,%esp
c0103ff6:	50                   	push   %eax
c0103ff7:	68 d5 03 00 00       	push   $0x3d5
c0103ffc:	e8 3d c3 ff ff       	call   c010033e <out_byte>
c0104001:	83 c4 10             	add    $0x10,%esp
c0104004:	90                   	nop
c0104005:	c9                   	leave  
c0104006:	c3                   	ret    

c0104007 <put_key>:
c0104007:	55                   	push   %ebp
c0104008:	89 e5                	mov    %esp,%ebp
c010400a:	83 ec 04             	sub    $0x4,%esp
c010400d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104010:	88 45 fc             	mov    %al,-0x4(%ebp)
c0104013:	8b 45 08             	mov    0x8(%ebp),%eax
c0104016:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c010401c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104021:	77 4d                	ja     c0104070 <put_key+0x69>
c0104023:	8b 45 08             	mov    0x8(%ebp),%eax
c0104026:	8b 00                	mov    (%eax),%eax
c0104028:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c010402c:	89 10                	mov    %edx,(%eax)
c010402e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104031:	8b 00                	mov    (%eax),%eax
c0104033:	8d 50 04             	lea    0x4(%eax),%edx
c0104036:	8b 45 08             	mov    0x8(%ebp),%eax
c0104039:	89 10                	mov    %edx,(%eax)
c010403b:	8b 45 08             	mov    0x8(%ebp),%eax
c010403e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104044:	8d 50 01             	lea    0x1(%eax),%edx
c0104047:	8b 45 08             	mov    0x8(%ebp),%eax
c010404a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104050:	8b 45 08             	mov    0x8(%ebp),%eax
c0104053:	8b 00                	mov    (%eax),%eax
c0104055:	8b 55 08             	mov    0x8(%ebp),%edx
c0104058:	83 c2 08             	add    $0x8,%edx
c010405b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0104061:	39 d0                	cmp    %edx,%eax
c0104063:	75 0b                	jne    c0104070 <put_key+0x69>
c0104065:	8b 45 08             	mov    0x8(%ebp),%eax
c0104068:	8d 50 08             	lea    0x8(%eax),%edx
c010406b:	8b 45 08             	mov    0x8(%ebp),%eax
c010406e:	89 10                	mov    %edx,(%eax)
c0104070:	90                   	nop
c0104071:	c9                   	leave  
c0104072:	c3                   	ret    

c0104073 <scroll_up>:
c0104073:	55                   	push   %ebp
c0104074:	89 e5                	mov    %esp,%ebp
c0104076:	83 ec 08             	sub    $0x8,%esp
c0104079:	8b 45 08             	mov    0x8(%ebp),%eax
c010407c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104082:	8b 40 08             	mov    0x8(%eax),%eax
c0104085:	8d 50 b0             	lea    -0x50(%eax),%edx
c0104088:	8b 45 08             	mov    0x8(%ebp),%eax
c010408b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104091:	8b 00                	mov    (%eax),%eax
c0104093:	39 c2                	cmp    %eax,%edx
c0104095:	76 1b                	jbe    c01040b2 <scroll_up+0x3f>
c0104097:	8b 45 08             	mov    0x8(%ebp),%eax
c010409a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040a0:	8b 40 08             	mov    0x8(%eax),%eax
c01040a3:	83 e8 50             	sub    $0x50,%eax
c01040a6:	83 ec 0c             	sub    $0xc,%esp
c01040a9:	50                   	push   %eax
c01040aa:	e8 fa fe ff ff       	call   c0103fa9 <set_console_start_video_addr>
c01040af:	83 c4 10             	add    $0x10,%esp
c01040b2:	90                   	nop
c01040b3:	c9                   	leave  
c01040b4:	c3                   	ret    

c01040b5 <scroll_down>:
c01040b5:	55                   	push   %ebp
c01040b6:	89 e5                	mov    %esp,%ebp
c01040b8:	83 ec 08             	sub    $0x8,%esp
c01040bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01040be:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040c4:	8b 40 08             	mov    0x8(%eax),%eax
c01040c7:	8d 48 50             	lea    0x50(%eax),%ecx
c01040ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01040cd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040d3:	8b 10                	mov    (%eax),%edx
c01040d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01040d8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040de:	8b 40 04             	mov    0x4(%eax),%eax
c01040e1:	01 d0                	add    %edx,%eax
c01040e3:	39 c1                	cmp    %eax,%ecx
c01040e5:	73 36                	jae    c010411d <scroll_down+0x68>
c01040e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ea:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040f0:	8b 40 08             	mov    0x8(%eax),%eax
c01040f3:	83 c0 50             	add    $0x50,%eax
c01040f6:	83 ec 0c             	sub    $0xc,%esp
c01040f9:	50                   	push   %eax
c01040fa:	e8 aa fe ff ff       	call   c0103fa9 <set_console_start_video_addr>
c01040ff:	83 c4 10             	add    $0x10,%esp
c0104102:	8b 45 08             	mov    0x8(%ebp),%eax
c0104105:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010410b:	8b 50 08             	mov    0x8(%eax),%edx
c010410e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104111:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104117:	83 c2 50             	add    $0x50,%edx
c010411a:	89 50 08             	mov    %edx,0x8(%eax)
c010411d:	90                   	nop
c010411e:	c9                   	leave  
c010411f:	c3                   	ret    

c0104120 <out_char>:
c0104120:	55                   	push   %ebp
c0104121:	89 e5                	mov    %esp,%ebp
c0104123:	83 ec 28             	sub    $0x28,%esp
c0104126:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104129:	88 45 e4             	mov    %al,-0x1c(%ebp)
c010412c:	e8 a7 2d 00 00       	call   c0106ed8 <intr_disable>
c0104131:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104134:	8b 45 08             	mov    0x8(%ebp),%eax
c0104137:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010413d:	8b 40 0c             	mov    0xc(%eax),%eax
c0104140:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0104145:	01 c0                	add    %eax,%eax
c0104147:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010414a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c010414e:	83 f8 08             	cmp    $0x8,%eax
c0104151:	0f 84 8d 00 00 00    	je     c01041e4 <out_char+0xc4>
c0104157:	83 f8 0a             	cmp    $0xa,%eax
c010415a:	0f 85 c9 00 00 00    	jne    c0104229 <out_char+0x109>
c0104160:	8b 45 08             	mov    0x8(%ebp),%eax
c0104163:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104169:	8b 50 0c             	mov    0xc(%eax),%edx
c010416c:	8b 45 08             	mov    0x8(%ebp),%eax
c010416f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104175:	8b 08                	mov    (%eax),%ecx
c0104177:	8b 45 08             	mov    0x8(%ebp),%eax
c010417a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104180:	8b 40 04             	mov    0x4(%eax),%eax
c0104183:	01 c8                	add    %ecx,%eax
c0104185:	83 e8 50             	sub    $0x50,%eax
c0104188:	39 c2                	cmp    %eax,%edx
c010418a:	0f 83 f4 00 00 00    	jae    c0104284 <out_char+0x164>
c0104190:	8b 45 08             	mov    0x8(%ebp),%eax
c0104193:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104199:	8b 08                	mov    (%eax),%ecx
c010419b:	8b 45 08             	mov    0x8(%ebp),%eax
c010419e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041a4:	8b 50 0c             	mov    0xc(%eax),%edx
c01041a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041aa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041b0:	8b 00                	mov    (%eax),%eax
c01041b2:	29 c2                	sub    %eax,%edx
c01041b4:	89 d0                	mov    %edx,%eax
c01041b6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c01041bb:	f7 e2                	mul    %edx
c01041bd:	89 d0                	mov    %edx,%eax
c01041bf:	c1 e8 06             	shr    $0x6,%eax
c01041c2:	8d 50 01             	lea    0x1(%eax),%edx
c01041c5:	89 d0                	mov    %edx,%eax
c01041c7:	c1 e0 02             	shl    $0x2,%eax
c01041ca:	01 d0                	add    %edx,%eax
c01041cc:	c1 e0 04             	shl    $0x4,%eax
c01041cf:	89 c2                	mov    %eax,%edx
c01041d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01041d4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041da:	01 ca                	add    %ecx,%edx
c01041dc:	89 50 0c             	mov    %edx,0xc(%eax)
c01041df:	e9 a0 00 00 00       	jmp    c0104284 <out_char+0x164>
c01041e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01041e7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041ed:	8b 50 0c             	mov    0xc(%eax),%edx
c01041f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01041f3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041f9:	8b 00                	mov    (%eax),%eax
c01041fb:	39 c2                	cmp    %eax,%edx
c01041fd:	0f 86 84 00 00 00    	jbe    c0104287 <out_char+0x167>
c0104203:	8b 45 08             	mov    0x8(%ebp),%eax
c0104206:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010420c:	8b 50 0c             	mov    0xc(%eax),%edx
c010420f:	83 ea 01             	sub    $0x1,%edx
c0104212:	89 50 0c             	mov    %edx,0xc(%eax)
c0104215:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104218:	83 e8 02             	sub    $0x2,%eax
c010421b:	c6 00 20             	movb   $0x20,(%eax)
c010421e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104221:	83 e8 01             	sub    $0x1,%eax
c0104224:	c6 00 00             	movb   $0x0,(%eax)
c0104227:	eb 5e                	jmp    c0104287 <out_char+0x167>
c0104229:	8b 45 08             	mov    0x8(%ebp),%eax
c010422c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104232:	8b 40 0c             	mov    0xc(%eax),%eax
c0104235:	8d 48 01             	lea    0x1(%eax),%ecx
c0104238:	8b 45 08             	mov    0x8(%ebp),%eax
c010423b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104241:	8b 10                	mov    (%eax),%edx
c0104243:	8b 45 08             	mov    0x8(%ebp),%eax
c0104246:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010424c:	8b 40 04             	mov    0x4(%eax),%eax
c010424f:	01 d0                	add    %edx,%eax
c0104251:	39 c1                	cmp    %eax,%ecx
c0104253:	73 35                	jae    c010428a <out_char+0x16a>
c0104255:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104258:	8d 50 01             	lea    0x1(%eax),%edx
c010425b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010425e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0104262:	88 10                	mov    %dl,(%eax)
c0104264:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104267:	8d 50 01             	lea    0x1(%eax),%edx
c010426a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010426d:	c6 00 0a             	movb   $0xa,(%eax)
c0104270:	8b 45 08             	mov    0x8(%ebp),%eax
c0104273:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104279:	8b 50 0c             	mov    0xc(%eax),%edx
c010427c:	83 c2 01             	add    $0x1,%edx
c010427f:	89 50 0c             	mov    %edx,0xc(%eax)
c0104282:	eb 06                	jmp    c010428a <out_char+0x16a>
c0104284:	90                   	nop
c0104285:	eb 14                	jmp    c010429b <out_char+0x17b>
c0104287:	90                   	nop
c0104288:	eb 11                	jmp    c010429b <out_char+0x17b>
c010428a:	90                   	nop
c010428b:	eb 0e                	jmp    c010429b <out_char+0x17b>
c010428d:	83 ec 0c             	sub    $0xc,%esp
c0104290:	ff 75 08             	pushl  0x8(%ebp)
c0104293:	e8 1d fe ff ff       	call   c01040b5 <scroll_down>
c0104298:	83 c4 10             	add    $0x10,%esp
c010429b:	8b 45 08             	mov    0x8(%ebp),%eax
c010429e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01042a4:	8b 50 0c             	mov    0xc(%eax),%edx
c01042a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01042aa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01042b0:	8b 40 08             	mov    0x8(%eax),%eax
c01042b3:	29 c2                	sub    %eax,%edx
c01042b5:	89 d0                	mov    %edx,%eax
c01042b7:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c01042bc:	77 cf                	ja     c010428d <out_char+0x16d>
c01042be:	83 ec 0c             	sub    $0xc,%esp
c01042c1:	ff 75 08             	pushl  0x8(%ebp)
c01042c4:	e8 49 fc ff ff       	call   c0103f12 <flush>
c01042c9:	83 c4 10             	add    $0x10,%esp
c01042cc:	83 ec 0c             	sub    $0xc,%esp
c01042cf:	ff 75 f4             	pushl  -0xc(%ebp)
c01042d2:	e8 2a 2c 00 00       	call   c0106f01 <intr_set_status>
c01042d7:	83 c4 10             	add    $0x10,%esp
c01042da:	90                   	nop
c01042db:	c9                   	leave  
c01042dc:	c3                   	ret    

c01042dd <tty_dev_read>:
c01042dd:	55                   	push   %ebp
c01042de:	89 e5                	mov    %esp,%ebp
c01042e0:	83 ec 08             	sub    $0x8,%esp
c01042e3:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01042e8:	39 45 08             	cmp    %eax,0x8(%ebp)
c01042eb:	75 17                	jne    c0104304 <tty_dev_read+0x27>
c01042ed:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01042f2:	85 c0                	test   %eax,%eax
c01042f4:	7e 0e                	jle    c0104304 <tty_dev_read+0x27>
c01042f6:	83 ec 0c             	sub    $0xc,%esp
c01042f9:	ff 75 08             	pushl  0x8(%ebp)
c01042fc:	e8 89 07 00 00       	call   c0104a8a <keyboard_read>
c0104301:	83 c4 10             	add    $0x10,%esp
c0104304:	90                   	nop
c0104305:	c9                   	leave  
c0104306:	c3                   	ret    

c0104307 <tty_dev_write>:
c0104307:	55                   	push   %ebp
c0104308:	89 e5                	mov    %esp,%ebp
c010430a:	83 ec 28             	sub    $0x28,%esp
c010430d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104310:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104316:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104319:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104320:	e9 88 01 00 00       	jmp    c01044ad <tty_dev_write+0x1a6>
c0104325:	8b 45 08             	mov    0x8(%ebp),%eax
c0104328:	8b 40 04             	mov    0x4(%eax),%eax
c010432b:	8b 00                	mov    (%eax),%eax
c010432d:	88 45 e7             	mov    %al,-0x19(%ebp)
c0104330:	8b 45 08             	mov    0x8(%ebp),%eax
c0104333:	8b 40 04             	mov    0x4(%eax),%eax
c0104336:	8d 50 04             	lea    0x4(%eax),%edx
c0104339:	8b 45 08             	mov    0x8(%ebp),%eax
c010433c:	89 50 04             	mov    %edx,0x4(%eax)
c010433f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104342:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104348:	8d 50 ff             	lea    -0x1(%eax),%edx
c010434b:	8b 45 08             	mov    0x8(%ebp),%eax
c010434e:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104354:	8b 45 08             	mov    0x8(%ebp),%eax
c0104357:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010435d:	8d 50 01             	lea    0x1(%eax),%edx
c0104360:	8b 45 08             	mov    0x8(%ebp),%eax
c0104363:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104369:	8b 45 08             	mov    0x8(%ebp),%eax
c010436c:	8b 40 04             	mov    0x4(%eax),%eax
c010436f:	8b 55 08             	mov    0x8(%ebp),%edx
c0104372:	83 c2 08             	add    $0x8,%edx
c0104375:	81 c2 00 08 00 00    	add    $0x800,%edx
c010437b:	39 d0                	cmp    %edx,%eax
c010437d:	75 0c                	jne    c010438b <tty_dev_write+0x84>
c010437f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104382:	8d 50 08             	lea    0x8(%eax),%edx
c0104385:	8b 45 08             	mov    0x8(%ebp),%eax
c0104388:	89 50 04             	mov    %edx,0x4(%eax)
c010438b:	8b 45 08             	mov    0x8(%ebp),%eax
c010438e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104394:	85 c0                	test   %eax,%eax
c0104396:	0f 84 11 01 00 00    	je     c01044ad <tty_dev_write+0x1a6>
c010439c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043a0:	3c 20                	cmp    $0x20,%al
c01043a2:	76 08                	jbe    c01043ac <tty_dev_write+0xa5>
c01043a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043a8:	3c 7e                	cmp    $0x7e,%al
c01043aa:	76 10                	jbe    c01043bc <tty_dev_write+0xb5>
c01043ac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043b0:	3c 20                	cmp    $0x20,%al
c01043b2:	74 08                	je     c01043bc <tty_dev_write+0xb5>
c01043b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043b8:	84 c0                	test   %al,%al
c01043ba:	75 58                	jne    c0104414 <tty_dev_write+0x10d>
c01043bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01043bf:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c01043c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01043c8:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01043ce:	01 d0                	add    %edx,%eax
c01043d0:	83 e8 01             	sub    $0x1,%eax
c01043d3:	89 c2                	mov    %eax,%edx
c01043d5:	83 ec 04             	sub    $0x4,%esp
c01043d8:	6a 01                	push   $0x1
c01043da:	8d 45 e7             	lea    -0x19(%ebp),%eax
c01043dd:	50                   	push   %eax
c01043de:	52                   	push   %edx
c01043df:	e8 58 2b 00 00       	call   c0106f3c <Memcpy>
c01043e4:	83 c4 10             	add    $0x10,%esp
c01043e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01043ea:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01043f0:	8d 50 ff             	lea    -0x1(%eax),%edx
c01043f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01043f6:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01043fc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104400:	0f b6 c0             	movzbl %al,%eax
c0104403:	83 ec 08             	sub    $0x8,%esp
c0104406:	50                   	push   %eax
c0104407:	ff 75 08             	pushl  0x8(%ebp)
c010440a:	e8 11 fd ff ff       	call   c0104120 <out_char>
c010440f:	83 c4 10             	add    $0x10,%esp
c0104412:	eb 7c                	jmp    c0104490 <tty_dev_write+0x189>
c0104414:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104418:	3c 08                	cmp    $0x8,%al
c010441a:	75 42                	jne    c010445e <tty_dev_write+0x157>
c010441c:	8b 45 08             	mov    0x8(%ebp),%eax
c010441f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104425:	8d 50 01             	lea    0x1(%eax),%edx
c0104428:	8b 45 08             	mov    0x8(%ebp),%eax
c010442b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104431:	8b 45 08             	mov    0x8(%ebp),%eax
c0104434:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010443a:	8d 50 fe             	lea    -0x2(%eax),%edx
c010443d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104440:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104446:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010444a:	0f b6 c0             	movzbl %al,%eax
c010444d:	83 ec 08             	sub    $0x8,%esp
c0104450:	50                   	push   %eax
c0104451:	ff 75 08             	pushl  0x8(%ebp)
c0104454:	e8 c7 fc ff ff       	call   c0104120 <out_char>
c0104459:	83 c4 10             	add    $0x10,%esp
c010445c:	eb 32                	jmp    c0104490 <tty_dev_write+0x189>
c010445e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104462:	3c 0a                	cmp    $0xa,%al
c0104464:	75 2a                	jne    c0104490 <tty_dev_write+0x189>
c0104466:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010446a:	0f b6 c0             	movzbl %al,%eax
c010446d:	83 ec 08             	sub    $0x8,%esp
c0104470:	50                   	push   %eax
c0104471:	ff 75 08             	pushl  0x8(%ebp)
c0104474:	e8 a7 fc ff ff       	call   c0104120 <out_char>
c0104479:	83 c4 10             	add    $0x10,%esp
c010447c:	8b 45 08             	mov    0x8(%ebp),%eax
c010447f:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0104486:	00 00 00 
c0104489:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104490:	8b 45 08             	mov    0x8(%ebp),%eax
c0104493:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104499:	8b 45 08             	mov    0x8(%ebp),%eax
c010449c:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c01044a2:	39 c2                	cmp    %eax,%edx
c01044a4:	75 07                	jne    c01044ad <tty_dev_write+0x1a6>
c01044a6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01044ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01044b0:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01044b6:	85 c0                	test   %eax,%eax
c01044b8:	0f 85 67 fe ff ff    	jne    c0104325 <tty_dev_write+0x1e>
c01044be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01044c2:	74 6d                	je     c0104531 <tty_dev_write+0x22a>
c01044c4:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c01044cb:	83 ec 0c             	sub    $0xc,%esp
c01044ce:	ff 75 ec             	pushl  -0x14(%ebp)
c01044d1:	e8 b6 d3 ff ff       	call   c010188c <sys_malloc>
c01044d6:	83 c4 10             	add    $0x10,%esp
c01044d9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01044dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01044df:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c01044e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01044e9:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01044ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01044f2:	89 50 60             	mov    %edx,0x60(%eax)
c01044f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01044f8:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c01044fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104501:	89 50 68             	mov    %edx,0x68(%eax)
c0104504:	8b 45 08             	mov    0x8(%ebp),%eax
c0104507:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010450d:	83 ec 04             	sub    $0x4,%esp
c0104510:	50                   	push   %eax
c0104511:	ff 75 e8             	pushl  -0x18(%ebp)
c0104514:	6a 01                	push   $0x1
c0104516:	e8 aa 52 00 00       	call   c01097c5 <send_rec>
c010451b:	83 c4 10             	add    $0x10,%esp
c010451e:	83 ec 08             	sub    $0x8,%esp
c0104521:	ff 75 ec             	pushl  -0x14(%ebp)
c0104524:	ff 75 e8             	pushl  -0x18(%ebp)
c0104527:	e8 75 d3 ff ff       	call   c01018a1 <sys_free>
c010452c:	83 c4 10             	add    $0x10,%esp
c010452f:	eb 01                	jmp    c0104532 <tty_dev_write+0x22b>
c0104531:	90                   	nop
c0104532:	c9                   	leave  
c0104533:	c3                   	ret    

c0104534 <tty_do_read>:
c0104534:	55                   	push   %ebp
c0104535:	89 e5                	mov    %esp,%ebp
c0104537:	83 ec 08             	sub    $0x8,%esp
c010453a:	8b 45 08             	mov    0x8(%ebp),%eax
c010453d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104544:	00 00 00 
c0104547:	8b 45 0c             	mov    0xc(%ebp),%eax
c010454a:	8b 50 68             	mov    0x68(%eax),%edx
c010454d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104550:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104556:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104559:	8b 00                	mov    (%eax),%eax
c010455b:	89 c2                	mov    %eax,%edx
c010455d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104560:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0104566:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104569:	8b 50 60             	mov    0x60(%eax),%edx
c010456c:	8b 45 08             	mov    0x8(%ebp),%eax
c010456f:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104575:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104578:	8b 50 60             	mov    0x60(%eax),%edx
c010457b:	8b 45 08             	mov    0x8(%ebp),%eax
c010457e:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0104584:	8b 45 08             	mov    0x8(%ebp),%eax
c0104587:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c010458d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104590:	8b 40 10             	mov    0x10(%eax),%eax
c0104593:	83 ec 08             	sub    $0x8,%esp
c0104596:	52                   	push   %edx
c0104597:	50                   	push   %eax
c0104598:	e8 32 1b 00 00       	call   c01060cf <alloc_virtual_memory>
c010459d:	83 c4 10             	add    $0x10,%esp
c01045a0:	89 c2                	mov    %eax,%edx
c01045a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01045a5:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c01045ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01045ae:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01045b4:	83 f8 02             	cmp    $0x2,%eax
c01045b7:	74 1c                	je     c01045d5 <tty_do_read+0xa1>
c01045b9:	68 3b 01 00 00       	push   $0x13b
c01045be:	68 a1 b5 10 c0       	push   $0xc010b5a1
c01045c3:	68 a1 b5 10 c0       	push   $0xc010b5a1
c01045c8:	68 ab b5 10 c0       	push   $0xc010b5ab
c01045cd:	e8 83 45 00 00       	call   c0108b55 <assertion_failure>
c01045d2:	83 c4 10             	add    $0x10,%esp
c01045d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01045d8:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c01045df:	8b 45 08             	mov    0x8(%ebp),%eax
c01045e2:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01045e8:	83 ec 04             	sub    $0x4,%esp
c01045eb:	50                   	push   %eax
c01045ec:	ff 75 0c             	pushl  0xc(%ebp)
c01045ef:	6a 01                	push   $0x1
c01045f1:	e8 cf 51 00 00       	call   c01097c5 <send_rec>
c01045f6:	83 c4 10             	add    $0x10,%esp
c01045f9:	90                   	nop
c01045fa:	c9                   	leave  
c01045fb:	c3                   	ret    

c01045fc <tty_do_write>:
c01045fc:	55                   	push   %ebp
c01045fd:	89 e5                	mov    %esp,%ebp
c01045ff:	53                   	push   %ebx
c0104600:	83 ec 24             	sub    $0x24,%esp
c0104603:	89 e0                	mov    %esp,%eax
c0104605:	89 c3                	mov    %eax,%ebx
c0104607:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010460e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104611:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104614:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104617:	89 c2                	mov    %eax,%edx
c0104619:	b8 10 00 00 00       	mov    $0x10,%eax
c010461e:	83 e8 01             	sub    $0x1,%eax
c0104621:	01 d0                	add    %edx,%eax
c0104623:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104628:	ba 00 00 00 00       	mov    $0x0,%edx
c010462d:	f7 f1                	div    %ecx
c010462f:	6b c0 10             	imul   $0x10,%eax,%eax
c0104632:	29 c4                	sub    %eax,%esp
c0104634:	89 e0                	mov    %esp,%eax
c0104636:	83 c0 00             	add    $0x0,%eax
c0104639:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010463c:	83 ec 04             	sub    $0x4,%esp
c010463f:	ff 75 e8             	pushl  -0x18(%ebp)
c0104642:	6a 00                	push   $0x0
c0104644:	ff 75 e0             	pushl  -0x20(%ebp)
c0104647:	e8 23 7c 00 00       	call   c010c26f <Memset>
c010464c:	83 c4 10             	add    $0x10,%esp
c010464f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104652:	8b 40 60             	mov    0x60(%eax),%eax
c0104655:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104658:	8b 45 08             	mov    0x8(%ebp),%eax
c010465b:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104662:	00 00 00 
c0104665:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104668:	8b 45 0c             	mov    0xc(%ebp),%eax
c010466b:	8b 40 10             	mov    0x10(%eax),%eax
c010466e:	83 ec 08             	sub    $0x8,%esp
c0104671:	52                   	push   %edx
c0104672:	50                   	push   %eax
c0104673:	e8 57 1a 00 00       	call   c01060cf <alloc_virtual_memory>
c0104678:	83 c4 10             	add    $0x10,%esp
c010467b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010467e:	eb 7e                	jmp    c01046fe <tty_do_write+0x102>
c0104680:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104683:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0104686:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c010468a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010468d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104690:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104696:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104699:	01 d0                	add    %edx,%eax
c010469b:	83 ec 04             	sub    $0x4,%esp
c010469e:	ff 75 f0             	pushl  -0x10(%ebp)
c01046a1:	50                   	push   %eax
c01046a2:	ff 75 e0             	pushl  -0x20(%ebp)
c01046a5:	e8 92 28 00 00       	call   c0106f3c <Memcpy>
c01046aa:	83 c4 10             	add    $0x10,%esp
c01046ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01046b0:	29 45 ec             	sub    %eax,-0x14(%ebp)
c01046b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01046b6:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01046bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01046bf:	01 c2                	add    %eax,%edx
c01046c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01046c4:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01046ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01046d1:	eb 25                	jmp    c01046f8 <tty_do_write+0xfc>
c01046d3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01046d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046d9:	01 d0                	add    %edx,%eax
c01046db:	0f b6 00             	movzbl (%eax),%eax
c01046de:	0f b6 c0             	movzbl %al,%eax
c01046e1:	83 ec 08             	sub    $0x8,%esp
c01046e4:	50                   	push   %eax
c01046e5:	ff 75 08             	pushl  0x8(%ebp)
c01046e8:	e8 33 fa ff ff       	call   c0104120 <out_char>
c01046ed:	83 c4 10             	add    $0x10,%esp
c01046f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01046f4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c01046f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01046fc:	75 d5                	jne    c01046d3 <tty_do_write+0xd7>
c01046fe:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0104702:	0f 85 78 ff ff ff    	jne    c0104680 <tty_do_write+0x84>
c0104708:	83 ec 0c             	sub    $0xc,%esp
c010470b:	6a 7c                	push   $0x7c
c010470d:	e8 7a d1 ff ff       	call   c010188c <sys_malloc>
c0104712:	83 c4 10             	add    $0x10,%esp
c0104715:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104718:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010471b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104722:	8b 45 08             	mov    0x8(%ebp),%eax
c0104725:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010472b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010472e:	89 50 58             	mov    %edx,0x58(%eax)
c0104731:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104734:	8b 00                	mov    (%eax),%eax
c0104736:	83 ec 04             	sub    $0x4,%esp
c0104739:	50                   	push   %eax
c010473a:	ff 75 d8             	pushl  -0x28(%ebp)
c010473d:	6a 01                	push   $0x1
c010473f:	e8 81 50 00 00       	call   c01097c5 <send_rec>
c0104744:	83 c4 10             	add    $0x10,%esp
c0104747:	83 ec 08             	sub    $0x8,%esp
c010474a:	6a 7c                	push   $0x7c
c010474c:	ff 75 d8             	pushl  -0x28(%ebp)
c010474f:	e8 4d d1 ff ff       	call   c01018a1 <sys_free>
c0104754:	83 c4 10             	add    $0x10,%esp
c0104757:	89 dc                	mov    %ebx,%esp
c0104759:	90                   	nop
c010475a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010475d:	c9                   	leave  
c010475e:	c3                   	ret    

c010475f <init_screen>:
c010475f:	55                   	push   %ebp
c0104760:	89 e5                	mov    %esp,%ebp
c0104762:	83 ec 10             	sub    $0x10,%esp
c0104765:	8b 45 08             	mov    0x8(%ebp),%eax
c0104768:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010476d:	c1 f8 03             	sar    $0x3,%eax
c0104770:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104776:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104779:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010477c:	c1 e0 04             	shl    $0x4,%eax
c010477f:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c0104785:	8b 45 08             	mov    0x8(%ebp),%eax
c0104788:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c010478e:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104795:	8b 45 08             	mov    0x8(%ebp),%eax
c0104798:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010479e:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01047a1:	89 50 04             	mov    %edx,0x4(%eax)
c01047a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01047a7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01047ad:	8b 50 04             	mov    0x4(%eax),%edx
c01047b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01047b3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01047b9:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c01047bd:	89 10                	mov    %edx,(%eax)
c01047bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01047c2:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c01047c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01047cb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01047d1:	8b 12                	mov    (%edx),%edx
c01047d3:	89 50 08             	mov    %edx,0x8(%eax)
c01047d6:	8b 55 08             	mov    0x8(%ebp),%edx
c01047d9:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c01047df:	8b 40 08             	mov    0x8(%eax),%eax
c01047e2:	89 42 0c             	mov    %eax,0xc(%edx)
c01047e5:	90                   	nop
c01047e6:	c9                   	leave  
c01047e7:	c3                   	ret    

c01047e8 <init_tty>:
c01047e8:	55                   	push   %ebp
c01047e9:	89 e5                	mov    %esp,%ebp
c01047eb:	83 ec 18             	sub    $0x18,%esp
c01047ee:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01047f5:	e9 92 00 00 00       	jmp    c010488c <init_tty+0xa4>
c01047fa:	83 ec 04             	sub    $0x4,%esp
c01047fd:	68 28 08 00 00       	push   $0x828
c0104802:	6a 00                	push   $0x0
c0104804:	ff 75 f4             	pushl  -0xc(%ebp)
c0104807:	e8 63 7a 00 00       	call   c010c26f <Memset>
c010480c:	83 c4 10             	add    $0x10,%esp
c010480f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104812:	8d 50 08             	lea    0x8(%eax),%edx
c0104815:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104818:	89 50 04             	mov    %edx,0x4(%eax)
c010481b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010481e:	8b 50 04             	mov    0x4(%eax),%edx
c0104821:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104824:	89 10                	mov    %edx,(%eax)
c0104826:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104829:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0104830:	00 00 00 
c0104833:	83 ec 0c             	sub    $0xc,%esp
c0104836:	ff 75 f4             	pushl  -0xc(%ebp)
c0104839:	e8 21 ff ff ff       	call   c010475f <init_screen>
c010483e:	83 c4 10             	add    $0x10,%esp
c0104841:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104844:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104849:	85 c0                	test   %eax,%eax
c010484b:	7e 38                	jle    c0104885 <init_tty+0x9d>
c010484d:	83 ec 08             	sub    $0x8,%esp
c0104850:	6a 23                	push   $0x23
c0104852:	ff 75 f4             	pushl  -0xc(%ebp)
c0104855:	e8 c6 f8 ff ff       	call   c0104120 <out_char>
c010485a:	83 c4 10             	add    $0x10,%esp
c010485d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104860:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0104865:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010486a:	c1 f8 03             	sar    $0x3,%eax
c010486d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104873:	0f b6 c0             	movzbl %al,%eax
c0104876:	83 ec 08             	sub    $0x8,%esp
c0104879:	50                   	push   %eax
c010487a:	ff 75 f4             	pushl  -0xc(%ebp)
c010487d:	e8 9e f8 ff ff       	call   c0104120 <out_char>
c0104882:	83 c4 10             	add    $0x10,%esp
c0104885:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010488c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104891:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104894:	0f 82 60 ff ff ff    	jb     c01047fa <init_tty+0x12>
c010489a:	90                   	nop
c010489b:	c9                   	leave  
c010489c:	c3                   	ret    

c010489d <TaskTTY>:
c010489d:	55                   	push   %ebp
c010489e:	89 e5                	mov    %esp,%ebp
c01048a0:	83 ec 28             	sub    $0x28,%esp
c01048a3:	e8 40 ff ff ff       	call   c01047e8 <init_tty>
c01048a8:	83 ec 0c             	sub    $0xc,%esp
c01048ab:	6a 00                	push   $0x0
c01048ad:	e8 24 f6 ff ff       	call   c0103ed6 <select_console>
c01048b2:	83 c4 10             	add    $0x10,%esp
c01048b5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01048bc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01048c3:	83 ec 0c             	sub    $0xc,%esp
c01048c6:	6a 7c                	push   $0x7c
c01048c8:	e8 bf cf ff ff       	call   c010188c <sys_malloc>
c01048cd:	83 c4 10             	add    $0x10,%esp
c01048d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01048d3:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01048da:	eb 30                	jmp    c010490c <TaskTTY+0x6f>
c01048dc:	83 ec 0c             	sub    $0xc,%esp
c01048df:	ff 75 f4             	pushl  -0xc(%ebp)
c01048e2:	e8 f6 f9 ff ff       	call   c01042dd <tty_dev_read>
c01048e7:	83 c4 10             	add    $0x10,%esp
c01048ea:	83 ec 0c             	sub    $0xc,%esp
c01048ed:	ff 75 f4             	pushl  -0xc(%ebp)
c01048f0:	e8 12 fa ff ff       	call   c0104307 <tty_dev_write>
c01048f5:	83 c4 10             	add    $0x10,%esp
c01048f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01048fb:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104901:	85 c0                	test   %eax,%eax
c0104903:	75 d7                	jne    c01048dc <TaskTTY+0x3f>
c0104905:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010490c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104911:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104914:	72 c6                	jb     c01048dc <TaskTTY+0x3f>
c0104916:	83 ec 04             	sub    $0x4,%esp
c0104919:	6a 12                	push   $0x12
c010491b:	ff 75 e8             	pushl  -0x18(%ebp)
c010491e:	6a 02                	push   $0x2
c0104920:	e8 a0 4e 00 00       	call   c01097c5 <send_rec>
c0104925:	83 c4 10             	add    $0x10,%esp
c0104928:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010492b:	8b 40 78             	mov    0x78(%eax),%eax
c010492e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104931:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104938:	74 28                	je     c0104962 <TaskTTY+0xc5>
c010493a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104941:	7f 0b                	jg     c010494e <TaskTTY+0xb1>
c0104943:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c010494a:	74 4e                	je     c010499a <TaskTTY+0xfd>
c010494c:	eb 4d                	jmp    c010499b <TaskTTY+0xfe>
c010494e:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104955:	74 21                	je     c0104978 <TaskTTY+0xdb>
c0104957:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c010495e:	74 2e                	je     c010498e <TaskTTY+0xf1>
c0104960:	eb 39                	jmp    c010499b <TaskTTY+0xfe>
c0104962:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104967:	83 ec 08             	sub    $0x8,%esp
c010496a:	ff 75 e8             	pushl  -0x18(%ebp)
c010496d:	50                   	push   %eax
c010496e:	e8 c1 fb ff ff       	call   c0104534 <tty_do_read>
c0104973:	83 c4 10             	add    $0x10,%esp
c0104976:	eb 23                	jmp    c010499b <TaskTTY+0xfe>
c0104978:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c010497d:	83 ec 08             	sub    $0x8,%esp
c0104980:	ff 75 e8             	pushl  -0x18(%ebp)
c0104983:	50                   	push   %eax
c0104984:	e8 73 fc ff ff       	call   c01045fc <tty_do_write>
c0104989:	83 c4 10             	add    $0x10,%esp
c010498c:	eb 0d                	jmp    c010499b <TaskTTY+0xfe>
c010498e:	c7 05 c4 06 11 c0 00 	movl   $0x0,0xc01106c4
c0104995:	00 00 00 
c0104998:	eb 01                	jmp    c010499b <TaskTTY+0xfe>
c010499a:	90                   	nop
c010499b:	e9 33 ff ff ff       	jmp    c01048d3 <TaskTTY+0x36>

c01049a0 <keyboard_handler>:
c01049a0:	55                   	push   %ebp
c01049a1:	89 e5                	mov    %esp,%ebp
c01049a3:	83 ec 18             	sub    $0x18,%esp
c01049a6:	c7 05 c4 06 11 c0 01 	movl   $0x1,0xc01106c4
c01049ad:	00 00 00 
c01049b0:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c01049b7:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01049bc:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c01049c1:	7f 5e                	jg     c0104a21 <keyboard_handler+0x81>
c01049c3:	e8 98 b9 ff ff       	call   c0100360 <disable_int>
c01049c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01049cb:	0f b7 c0             	movzwl %ax,%eax
c01049ce:	83 ec 0c             	sub    $0xc,%esp
c01049d1:	50                   	push   %eax
c01049d2:	e8 5b b9 ff ff       	call   c0100332 <in_byte>
c01049d7:	83 c4 10             	add    $0x10,%esp
c01049da:	88 45 f3             	mov    %al,-0xd(%ebp)
c01049dd:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01049e2:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c01049e6:	88 10                	mov    %dl,(%eax)
c01049e8:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01049ed:	83 c0 01             	add    $0x1,%eax
c01049f0:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c01049f5:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01049fa:	83 c0 01             	add    $0x1,%eax
c01049fd:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104a02:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104a07:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104a0c:	39 d0                	cmp    %edx,%eax
c0104a0e:	72 0a                	jb     c0104a1a <keyboard_handler+0x7a>
c0104a10:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104a17:	fb 10 c0 
c0104a1a:	e8 43 b9 ff ff       	call   c0100362 <enable_int>
c0104a1f:	eb 01                	jmp    c0104a22 <keyboard_handler+0x82>
c0104a21:	90                   	nop
c0104a22:	c9                   	leave  
c0104a23:	c3                   	ret    

c0104a24 <read_from_keyboard_buf>:
c0104a24:	55                   	push   %ebp
c0104a25:	89 e5                	mov    %esp,%ebp
c0104a27:	83 ec 18             	sub    $0x18,%esp
c0104a2a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0104a2e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104a33:	85 c0                	test   %eax,%eax
c0104a35:	7f 06                	jg     c0104a3d <read_from_keyboard_buf+0x19>
c0104a37:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104a3b:	eb 4b                	jmp    c0104a88 <read_from_keyboard_buf+0x64>
c0104a3d:	e8 1e b9 ff ff       	call   c0100360 <disable_int>
c0104a42:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104a47:	0f b6 00             	movzbl (%eax),%eax
c0104a4a:	88 45 f7             	mov    %al,-0x9(%ebp)
c0104a4d:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104a52:	83 c0 01             	add    $0x1,%eax
c0104a55:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c0104a5a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104a5f:	83 e8 01             	sub    $0x1,%eax
c0104a62:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104a67:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104a6c:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104a71:	39 d0                	cmp    %edx,%eax
c0104a73:	72 0a                	jb     c0104a7f <read_from_keyboard_buf+0x5b>
c0104a75:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c0104a7c:	fb 10 c0 
c0104a7f:	e8 de b8 ff ff       	call   c0100362 <enable_int>
c0104a84:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104a88:	c9                   	leave  
c0104a89:	c3                   	ret    

c0104a8a <keyboard_read>:
c0104a8a:	55                   	push   %ebp
c0104a8b:	89 e5                	mov    %esp,%ebp
c0104a8d:	83 ec 28             	sub    $0x28,%esp
c0104a90:	90                   	nop
c0104a91:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104a96:	85 c0                	test   %eax,%eax
c0104a98:	7e f7                	jle    c0104a91 <keyboard_read+0x7>
c0104a9a:	e8 85 ff ff ff       	call   c0104a24 <read_from_keyboard_buf>
c0104a9f:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104aa2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104aa9:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0104aad:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104ab1:	75 5a                	jne    c0104b0d <keyboard_read+0x83>
c0104ab3:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104ab7:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0104abb:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0104abf:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104ac3:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104ac7:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0104acb:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0104acf:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104ad6:	eb 20                	jmp    c0104af8 <keyboard_read+0x6e>
c0104ad8:	e8 47 ff ff ff       	call   c0104a24 <read_from_keyboard_buf>
c0104add:	89 c1                	mov    %eax,%ecx
c0104adf:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104ae2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104ae5:	01 d0                	add    %edx,%eax
c0104ae7:	0f b6 00             	movzbl (%eax),%eax
c0104aea:	38 c1                	cmp    %al,%cl
c0104aec:	74 06                	je     c0104af4 <keyboard_read+0x6a>
c0104aee:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0104af2:	eb 0a                	jmp    c0104afe <keyboard_read+0x74>
c0104af4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104af8:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0104afc:	7e da                	jle    c0104ad8 <keyboard_read+0x4e>
c0104afe:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0104b02:	74 68                	je     c0104b6c <keyboard_read+0xe2>
c0104b04:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0104b0b:	eb 5f                	jmp    c0104b6c <keyboard_read+0xe2>
c0104b0d:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104b11:	75 59                	jne    c0104b6c <keyboard_read+0xe2>
c0104b13:	e8 0c ff ff ff       	call   c0104a24 <read_from_keyboard_buf>
c0104b18:	3c 2a                	cmp    $0x2a,%al
c0104b1a:	75 1d                	jne    c0104b39 <keyboard_read+0xaf>
c0104b1c:	e8 03 ff ff ff       	call   c0104a24 <read_from_keyboard_buf>
c0104b21:	3c e0                	cmp    $0xe0,%al
c0104b23:	75 14                	jne    c0104b39 <keyboard_read+0xaf>
c0104b25:	e8 fa fe ff ff       	call   c0104a24 <read_from_keyboard_buf>
c0104b2a:	3c 37                	cmp    $0x37,%al
c0104b2c:	75 0b                	jne    c0104b39 <keyboard_read+0xaf>
c0104b2e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104b35:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104b39:	e8 e6 fe ff ff       	call   c0104a24 <read_from_keyboard_buf>
c0104b3e:	3c b7                	cmp    $0xb7,%al
c0104b40:	75 1d                	jne    c0104b5f <keyboard_read+0xd5>
c0104b42:	e8 dd fe ff ff       	call   c0104a24 <read_from_keyboard_buf>
c0104b47:	3c e0                	cmp    $0xe0,%al
c0104b49:	75 14                	jne    c0104b5f <keyboard_read+0xd5>
c0104b4b:	e8 d4 fe ff ff       	call   c0104a24 <read_from_keyboard_buf>
c0104b50:	3c aa                	cmp    $0xaa,%al
c0104b52:	75 0b                	jne    c0104b5f <keyboard_read+0xd5>
c0104b54:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104b5b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0104b5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104b63:	75 07                	jne    c0104b6c <keyboard_read+0xe2>
c0104b65:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c0104b6c:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104b73:	0f 84 8d 00 00 00    	je     c0104c06 <keyboard_read+0x17c>
c0104b79:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0104b80:	0f 84 80 00 00 00    	je     c0104c06 <keyboard_read+0x17c>
c0104b86:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0104b8a:	0f 94 c2             	sete   %dl
c0104b8d:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104b91:	0f 94 c0             	sete   %al
c0104b94:	09 d0                	or     %edx,%eax
c0104b96:	84 c0                	test   %al,%al
c0104b98:	74 07                	je     c0104ba1 <keyboard_read+0x117>
c0104b9a:	c6 05 cc 06 11 c0 01 	movb   $0x1,0xc01106cc
c0104ba1:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104ba5:	f7 d0                	not    %eax
c0104ba7:	c0 e8 07             	shr    $0x7,%al
c0104baa:	88 45 e9             	mov    %al,-0x17(%ebp)
c0104bad:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104bb1:	74 53                	je     c0104c06 <keyboard_read+0x17c>
c0104bb3:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104bb7:	74 4d                	je     c0104c06 <keyboard_read+0x17c>
c0104bb9:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0104bbd:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104bc4:	3c 01                	cmp    $0x1,%al
c0104bc6:	75 04                	jne    c0104bcc <keyboard_read+0x142>
c0104bc8:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104bcc:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104bd3:	84 c0                	test   %al,%al
c0104bd5:	74 04                	je     c0104bdb <keyboard_read+0x151>
c0104bd7:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104bdb:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0104bdf:	89 d0                	mov    %edx,%eax
c0104be1:	01 c0                	add    %eax,%eax
c0104be3:	01 c2                	add    %eax,%edx
c0104be5:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104be9:	01 d0                	add    %edx,%eax
c0104beb:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c0104bf2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104bf5:	83 ec 08             	sub    $0x8,%esp
c0104bf8:	ff 75 f4             	pushl  -0xc(%ebp)
c0104bfb:	ff 75 08             	pushl  0x8(%ebp)
c0104bfe:	e8 1a 00 00 00       	call   c0104c1d <in_process>
c0104c03:	83 c4 10             	add    $0x10,%esp
c0104c06:	90                   	nop
c0104c07:	c9                   	leave  
c0104c08:	c3                   	ret    

c0104c09 <init_keyboard_handler>:
c0104c09:	55                   	push   %ebp
c0104c0a:	89 e5                	mov    %esp,%ebp
c0104c0c:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104c13:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104c1a:	90                   	nop
c0104c1b:	5d                   	pop    %ebp
c0104c1c:	c3                   	ret    

c0104c1d <in_process>:
c0104c1d:	55                   	push   %ebp
c0104c1e:	89 e5                	mov    %esp,%ebp
c0104c20:	83 ec 18             	sub    $0x18,%esp
c0104c23:	83 ec 04             	sub    $0x4,%esp
c0104c26:	6a 02                	push   $0x2
c0104c28:	6a 00                	push   $0x0
c0104c2a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0104c2d:	50                   	push   %eax
c0104c2e:	e8 3c 76 00 00       	call   c010c26f <Memset>
c0104c33:	83 c4 10             	add    $0x10,%esp
c0104c36:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104c39:	25 00 01 00 00       	and    $0x100,%eax
c0104c3e:	85 c0                	test   %eax,%eax
c0104c40:	75 28                	jne    c0104c6a <in_process+0x4d>
c0104c42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104c45:	0f b6 c0             	movzbl %al,%eax
c0104c48:	83 ec 08             	sub    $0x8,%esp
c0104c4b:	50                   	push   %eax
c0104c4c:	ff 75 08             	pushl  0x8(%ebp)
c0104c4f:	e8 b3 f3 ff ff       	call   c0104007 <put_key>
c0104c54:	83 c4 10             	add    $0x10,%esp
c0104c57:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104c5e:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104c65:	e9 42 01 00 00       	jmp    c0104dac <in_process+0x18f>
c0104c6a:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104c71:	84 c0                	test   %al,%al
c0104c73:	0f 84 a9 00 00 00    	je     c0104d22 <in_process+0x105>
c0104c79:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104c7d:	0f 84 9f 00 00 00    	je     c0104d22 <in_process+0x105>
c0104c83:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104c87:	0f 84 95 00 00 00    	je     c0104d22 <in_process+0x105>
c0104c8d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104c94:	74 64                	je     c0104cfa <in_process+0xdd>
c0104c96:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104c9d:	77 0b                	ja     c0104caa <in_process+0x8d>
c0104c9f:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104ca6:	74 64                	je     c0104d0c <in_process+0xef>
c0104ca8:	eb 73                	jmp    c0104d1d <in_process+0x100>
c0104caa:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104cb1:	74 0b                	je     c0104cbe <in_process+0xa1>
c0104cb3:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104cba:	74 20                	je     c0104cdc <in_process+0xbf>
c0104cbc:	eb 5f                	jmp    c0104d1d <in_process+0x100>
c0104cbe:	83 ec 0c             	sub    $0xc,%esp
c0104cc1:	ff 75 08             	pushl  0x8(%ebp)
c0104cc4:	e8 aa f3 ff ff       	call   c0104073 <scroll_up>
c0104cc9:	83 c4 10             	add    $0x10,%esp
c0104ccc:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104cd3:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104cda:	eb 41                	jmp    c0104d1d <in_process+0x100>
c0104cdc:	83 ec 0c             	sub    $0xc,%esp
c0104cdf:	ff 75 08             	pushl  0x8(%ebp)
c0104ce2:	e8 ce f3 ff ff       	call   c01040b5 <scroll_down>
c0104ce7:	83 c4 10             	add    $0x10,%esp
c0104cea:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104cf1:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104cf8:	eb 23                	jmp    c0104d1d <in_process+0x100>
c0104cfa:	83 ec 08             	sub    $0x8,%esp
c0104cfd:	6a 0a                	push   $0xa
c0104cff:	ff 75 08             	pushl  0x8(%ebp)
c0104d02:	e8 19 f4 ff ff       	call   c0104120 <out_char>
c0104d07:	83 c4 10             	add    $0x10,%esp
c0104d0a:	eb 11                	jmp    c0104d1d <in_process+0x100>
c0104d0c:	83 ec 08             	sub    $0x8,%esp
c0104d0f:	6a 08                	push   $0x8
c0104d11:	ff 75 08             	pushl  0x8(%ebp)
c0104d14:	e8 07 f4 ff ff       	call   c0104120 <out_char>
c0104d19:	83 c4 10             	add    $0x10,%esp
c0104d1c:	90                   	nop
c0104d1d:	e9 8a 00 00 00       	jmp    c0104dac <in_process+0x18f>
c0104d22:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104d29:	74 55                	je     c0104d80 <in_process+0x163>
c0104d2b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104d32:	77 14                	ja     c0104d48 <in_process+0x12b>
c0104d34:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104d3b:	74 31                	je     c0104d6e <in_process+0x151>
c0104d3d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104d44:	74 16                	je     c0104d5c <in_process+0x13f>
c0104d46:	eb 64                	jmp    c0104dac <in_process+0x18f>
c0104d48:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104d4f:	74 3e                	je     c0104d8f <in_process+0x172>
c0104d51:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104d58:	74 44                	je     c0104d9e <in_process+0x181>
c0104d5a:	eb 50                	jmp    c0104dac <in_process+0x18f>
c0104d5c:	83 ec 08             	sub    $0x8,%esp
c0104d5f:	6a 0a                	push   $0xa
c0104d61:	ff 75 08             	pushl  0x8(%ebp)
c0104d64:	e8 9e f2 ff ff       	call   c0104007 <put_key>
c0104d69:	83 c4 10             	add    $0x10,%esp
c0104d6c:	eb 3e                	jmp    c0104dac <in_process+0x18f>
c0104d6e:	83 ec 08             	sub    $0x8,%esp
c0104d71:	6a 08                	push   $0x8
c0104d73:	ff 75 08             	pushl  0x8(%ebp)
c0104d76:	e8 8c f2 ff ff       	call   c0104007 <put_key>
c0104d7b:	83 c4 10             	add    $0x10,%esp
c0104d7e:	eb 2c                	jmp    c0104dac <in_process+0x18f>
c0104d80:	83 ec 0c             	sub    $0xc,%esp
c0104d83:	6a 00                	push   $0x0
c0104d85:	e8 4c f1 ff ff       	call   c0103ed6 <select_console>
c0104d8a:	83 c4 10             	add    $0x10,%esp
c0104d8d:	eb 1d                	jmp    c0104dac <in_process+0x18f>
c0104d8f:	83 ec 0c             	sub    $0xc,%esp
c0104d92:	6a 01                	push   $0x1
c0104d94:	e8 3d f1 ff ff       	call   c0103ed6 <select_console>
c0104d99:	83 c4 10             	add    $0x10,%esp
c0104d9c:	eb 0e                	jmp    c0104dac <in_process+0x18f>
c0104d9e:	83 ec 0c             	sub    $0xc,%esp
c0104da1:	6a 02                	push   $0x2
c0104da3:	e8 2e f1 ff ff       	call   c0103ed6 <select_console>
c0104da8:	83 c4 10             	add    $0x10,%esp
c0104dab:	90                   	nop
c0104dac:	90                   	nop
c0104dad:	c9                   	leave  
c0104dae:	c3                   	ret    

c0104daf <open>:
c0104daf:	55                   	push   %ebp
c0104db0:	89 e5                	mov    %esp,%ebp
c0104db2:	83 ec 18             	sub    $0x18,%esp
c0104db5:	83 ec 0c             	sub    $0xc,%esp
c0104db8:	6a 7c                	push   $0x7c
c0104dba:	e8 cd ca ff ff       	call   c010188c <sys_malloc>
c0104dbf:	83 c4 10             	add    $0x10,%esp
c0104dc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104dc5:	83 ec 04             	sub    $0x4,%esp
c0104dc8:	6a 7c                	push   $0x7c
c0104dca:	6a 00                	push   $0x0
c0104dcc:	ff 75 f4             	pushl  -0xc(%ebp)
c0104dcf:	e8 9b 74 00 00       	call   c010c26f <Memset>
c0104dd4:	83 c4 10             	add    $0x10,%esp
c0104dd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104dda:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104de1:	83 ec 0c             	sub    $0xc,%esp
c0104de4:	ff 75 08             	pushl  0x8(%ebp)
c0104de7:	e8 32 14 00 00       	call   c010621e <get_physical_address>
c0104dec:	83 c4 10             	add    $0x10,%esp
c0104def:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104df2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104df5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104df8:	89 50 44             	mov    %edx,0x44(%eax)
c0104dfb:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104dfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e01:	89 50 74             	mov    %edx,0x74(%eax)
c0104e04:	83 ec 0c             	sub    $0xc,%esp
c0104e07:	ff 75 08             	pushl  0x8(%ebp)
c0104e0a:	e8 99 74 00 00       	call   c010c2a8 <Strlen>
c0104e0f:	83 c4 10             	add    $0x10,%esp
c0104e12:	89 c2                	mov    %eax,%edx
c0104e14:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e17:	89 50 40             	mov    %edx,0x40(%eax)
c0104e1a:	83 ec 04             	sub    $0x4,%esp
c0104e1d:	6a 02                	push   $0x2
c0104e1f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e22:	6a 03                	push   $0x3
c0104e24:	e8 9c 49 00 00       	call   c01097c5 <send_rec>
c0104e29:	83 c4 10             	add    $0x10,%esp
c0104e2c:	83 ec 08             	sub    $0x8,%esp
c0104e2f:	6a 7c                	push   $0x7c
c0104e31:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e34:	e8 68 ca ff ff       	call   c01018a1 <sys_free>
c0104e39:	83 c4 10             	add    $0x10,%esp
c0104e3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e3f:	8b 40 50             	mov    0x50(%eax),%eax
c0104e42:	c9                   	leave  
c0104e43:	c3                   	ret    

c0104e44 <read>:
c0104e44:	55                   	push   %ebp
c0104e45:	89 e5                	mov    %esp,%ebp
c0104e47:	83 ec 38             	sub    $0x38,%esp
c0104e4a:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104e51:	83 ec 0c             	sub    $0xc,%esp
c0104e54:	ff 75 dc             	pushl  -0x24(%ebp)
c0104e57:	e8 30 ca ff ff       	call   c010188c <sys_malloc>
c0104e5c:	83 c4 10             	add    $0x10,%esp
c0104e5f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104e62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104e65:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104e6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104e6d:	83 ec 0c             	sub    $0xc,%esp
c0104e70:	ff 75 0c             	pushl  0xc(%ebp)
c0104e73:	e8 a6 13 00 00       	call   c010621e <get_physical_address>
c0104e78:	83 c4 10             	add    $0x10,%esp
c0104e7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104e7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e81:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104e86:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104e89:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104e8c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104e91:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104e94:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104e9b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104ea2:	8b 55 10             	mov    0x10(%ebp),%edx
c0104ea5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ea8:	01 d0                	add    %edx,%eax
c0104eaa:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104ead:	0f 83 a8 00 00 00    	jae    c0104f5b <read+0x117>
c0104eb3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104eb6:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104eb9:	05 00 10 00 00       	add    $0x1000,%eax
c0104ebe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104ec1:	8b 45 10             	mov    0x10(%ebp),%eax
c0104ec4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104ec7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104eca:	83 ec 04             	sub    $0x4,%esp
c0104ecd:	50                   	push   %eax
c0104ece:	6a 00                	push   $0x0
c0104ed0:	ff 75 d8             	pushl  -0x28(%ebp)
c0104ed3:	e8 97 73 00 00       	call   c010c26f <Memset>
c0104ed8:	83 c4 10             	add    $0x10,%esp
c0104edb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ede:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104ee5:	8b 55 08             	mov    0x8(%ebp),%edx
c0104ee8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104eeb:	89 50 50             	mov    %edx,0x50(%eax)
c0104eee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ef1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ef4:	89 50 10             	mov    %edx,0x10(%eax)
c0104ef7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104efa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104efd:	89 50 60             	mov    %edx,0x60(%eax)
c0104f00:	83 ec 04             	sub    $0x4,%esp
c0104f03:	6a 02                	push   $0x2
c0104f05:	ff 75 d8             	pushl  -0x28(%ebp)
c0104f08:	6a 03                	push   $0x3
c0104f0a:	e8 b6 48 00 00       	call   c01097c5 <send_rec>
c0104f0f:	83 c4 10             	add    $0x10,%esp
c0104f12:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f15:	8b 40 60             	mov    0x60(%eax),%eax
c0104f18:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104f1b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104f1e:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104f21:	8b 45 10             	mov    0x10(%ebp),%eax
c0104f24:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104f27:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104f2a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104f2d:	89 45 10             	mov    %eax,0x10(%ebp)
c0104f30:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104f37:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104f3e:	83 ec 0c             	sub    $0xc,%esp
c0104f41:	ff 75 f4             	pushl  -0xc(%ebp)
c0104f44:	e8 d5 12 00 00       	call   c010621e <get_physical_address>
c0104f49:	83 c4 10             	add    $0x10,%esp
c0104f4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f4f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104f53:	0f 85 6e ff ff ff    	jne    c0104ec7 <read+0x83>
c0104f59:	eb 54                	jmp    c0104faf <read+0x16b>
c0104f5b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f5e:	83 ec 04             	sub    $0x4,%esp
c0104f61:	50                   	push   %eax
c0104f62:	6a 00                	push   $0x0
c0104f64:	ff 75 d8             	pushl  -0x28(%ebp)
c0104f67:	e8 03 73 00 00       	call   c010c26f <Memset>
c0104f6c:	83 c4 10             	add    $0x10,%esp
c0104f6f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f72:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104f79:	8b 55 08             	mov    0x8(%ebp),%edx
c0104f7c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f7f:	89 50 50             	mov    %edx,0x50(%eax)
c0104f82:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f85:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f88:	89 50 10             	mov    %edx,0x10(%eax)
c0104f8b:	8b 55 10             	mov    0x10(%ebp),%edx
c0104f8e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f91:	89 50 60             	mov    %edx,0x60(%eax)
c0104f94:	83 ec 04             	sub    $0x4,%esp
c0104f97:	6a 02                	push   $0x2
c0104f99:	ff 75 d8             	pushl  -0x28(%ebp)
c0104f9c:	6a 03                	push   $0x3
c0104f9e:	e8 22 48 00 00       	call   c01097c5 <send_rec>
c0104fa3:	83 c4 10             	add    $0x10,%esp
c0104fa6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fa9:	8b 40 60             	mov    0x60(%eax),%eax
c0104fac:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104faf:	83 ec 08             	sub    $0x8,%esp
c0104fb2:	ff 75 dc             	pushl  -0x24(%ebp)
c0104fb5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104fb8:	e8 e4 c8 ff ff       	call   c01018a1 <sys_free>
c0104fbd:	83 c4 10             	add    $0x10,%esp
c0104fc0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104fc3:	c9                   	leave  
c0104fc4:	c3                   	ret    

c0104fc5 <write>:
c0104fc5:	55                   	push   %ebp
c0104fc6:	89 e5                	mov    %esp,%ebp
c0104fc8:	83 ec 18             	sub    $0x18,%esp
c0104fcb:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104fd2:	83 ec 0c             	sub    $0xc,%esp
c0104fd5:	ff 75 f4             	pushl  -0xc(%ebp)
c0104fd8:	e8 af c8 ff ff       	call   c010188c <sys_malloc>
c0104fdd:	83 c4 10             	add    $0x10,%esp
c0104fe0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104fe3:	83 ec 0c             	sub    $0xc,%esp
c0104fe6:	ff 75 0c             	pushl  0xc(%ebp)
c0104fe9:	e8 30 12 00 00       	call   c010621e <get_physical_address>
c0104fee:	83 c4 10             	add    $0x10,%esp
c0104ff1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104ff4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ff7:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104ffe:	8b 55 08             	mov    0x8(%ebp),%edx
c0105001:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105004:	89 50 50             	mov    %edx,0x50(%eax)
c0105007:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010500a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010500d:	89 50 10             	mov    %edx,0x10(%eax)
c0105010:	8b 55 10             	mov    0x10(%ebp),%edx
c0105013:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105016:	89 50 60             	mov    %edx,0x60(%eax)
c0105019:	83 ec 04             	sub    $0x4,%esp
c010501c:	6a 02                	push   $0x2
c010501e:	ff 75 f0             	pushl  -0x10(%ebp)
c0105021:	6a 03                	push   $0x3
c0105023:	e8 9d 47 00 00       	call   c01097c5 <send_rec>
c0105028:	83 c4 10             	add    $0x10,%esp
c010502b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010502e:	8b 40 60             	mov    0x60(%eax),%eax
c0105031:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105034:	83 ec 08             	sub    $0x8,%esp
c0105037:	ff 75 f4             	pushl  -0xc(%ebp)
c010503a:	ff 75 f0             	pushl  -0x10(%ebp)
c010503d:	e8 5f c8 ff ff       	call   c01018a1 <sys_free>
c0105042:	83 c4 10             	add    $0x10,%esp
c0105045:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105048:	c9                   	leave  
c0105049:	c3                   	ret    

c010504a <close>:
c010504a:	55                   	push   %ebp
c010504b:	89 e5                	mov    %esp,%ebp
c010504d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105053:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010505a:	8b 45 08             	mov    0x8(%ebp),%eax
c010505d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105060:	83 ec 04             	sub    $0x4,%esp
c0105063:	6a 02                	push   $0x2
c0105065:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c010506b:	50                   	push   %eax
c010506c:	6a 03                	push   $0x3
c010506e:	e8 52 47 00 00       	call   c01097c5 <send_rec>
c0105073:	83 c4 10             	add    $0x10,%esp
c0105076:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105079:	83 f8 65             	cmp    $0x65,%eax
c010507c:	74 19                	je     c0105097 <close+0x4d>
c010507e:	6a 13                	push   $0x13
c0105080:	68 c3 b5 10 c0       	push   $0xc010b5c3
c0105085:	68 c3 b5 10 c0       	push   $0xc010b5c3
c010508a:	68 cf b5 10 c0       	push   $0xc010b5cf
c010508f:	e8 c1 3a 00 00       	call   c0108b55 <assertion_failure>
c0105094:	83 c4 10             	add    $0x10,%esp
c0105097:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010509a:	c9                   	leave  
c010509b:	c3                   	ret    

c010509c <wait>:
c010509c:	55                   	push   %ebp
c010509d:	89 e5                	mov    %esp,%ebp
c010509f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01050a5:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c01050ac:	83 ec 04             	sub    $0x4,%esp
c01050af:	6a 01                	push   $0x1
c01050b1:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01050b7:	50                   	push   %eax
c01050b8:	6a 03                	push   $0x3
c01050ba:	e8 06 47 00 00       	call   c01097c5 <send_rec>
c01050bf:	83 c4 10             	add    $0x10,%esp
c01050c2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01050c5:	89 c2                	mov    %eax,%edx
c01050c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01050ca:	89 10                	mov    %edx,(%eax)
c01050cc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01050cf:	83 f8 21             	cmp    $0x21,%eax
c01050d2:	74 05                	je     c01050d9 <wait+0x3d>
c01050d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01050d7:	eb 05                	jmp    c01050de <wait+0x42>
c01050d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01050de:	c9                   	leave  
c01050df:	c3                   	ret    

c01050e0 <exit>:
c01050e0:	55                   	push   %ebp
c01050e1:	89 e5                	mov    %esp,%ebp
c01050e3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01050e9:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c01050f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01050f3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01050f6:	83 ec 04             	sub    $0x4,%esp
c01050f9:	6a 01                	push   $0x1
c01050fb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105101:	50                   	push   %eax
c0105102:	6a 03                	push   $0x3
c0105104:	e8 bc 46 00 00       	call   c01097c5 <send_rec>
c0105109:	83 c4 10             	add    $0x10,%esp
c010510c:	90                   	nop
c010510d:	c9                   	leave  
c010510e:	c3                   	ret    

c010510f <fork>:
c010510f:	55                   	push   %ebp
c0105110:	89 e5                	mov    %esp,%ebp
c0105112:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105118:	83 ec 04             	sub    $0x4,%esp
c010511b:	6a 7c                	push   $0x7c
c010511d:	6a 00                	push   $0x0
c010511f:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105125:	50                   	push   %eax
c0105126:	e8 44 71 00 00       	call   c010c26f <Memset>
c010512b:	83 c4 10             	add    $0x10,%esp
c010512e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0105135:	83 ec 04             	sub    $0x4,%esp
c0105138:	6a 01                	push   $0x1
c010513a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105140:	50                   	push   %eax
c0105141:	6a 03                	push   $0x3
c0105143:	e8 7d 46 00 00       	call   c01097c5 <send_rec>
c0105148:	83 c4 10             	add    $0x10,%esp
c010514b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0105152:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105155:	c9                   	leave  
c0105156:	c3                   	ret    

c0105157 <getpid>:
c0105157:	55                   	push   %ebp
c0105158:	89 e5                	mov    %esp,%ebp
c010515a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105160:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0105167:	83 ec 04             	sub    $0x4,%esp
c010516a:	6a 05                	push   $0x5
c010516c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105172:	50                   	push   %eax
c0105173:	6a 03                	push   $0x3
c0105175:	e8 4b 46 00 00       	call   c01097c5 <send_rec>
c010517a:	83 c4 10             	add    $0x10,%esp
c010517d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105180:	c9                   	leave  
c0105181:	c3                   	ret    

c0105182 <exec>:
c0105182:	55                   	push   %ebp
c0105183:	89 e5                	mov    %esp,%ebp
c0105185:	81 ec 88 00 00 00    	sub    $0x88,%esp
c010518b:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0105192:	8b 45 08             	mov    0x8(%ebp),%eax
c0105195:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0105198:	83 ec 0c             	sub    $0xc,%esp
c010519b:	ff 75 08             	pushl  0x8(%ebp)
c010519e:	e8 05 71 00 00       	call   c010c2a8 <Strlen>
c01051a3:	83 c4 10             	add    $0x10,%esp
c01051a6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01051a9:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c01051b0:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c01051b7:	83 ec 04             	sub    $0x4,%esp
c01051ba:	6a 01                	push   $0x1
c01051bc:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01051c2:	50                   	push   %eax
c01051c3:	6a 03                	push   $0x3
c01051c5:	e8 fb 45 00 00       	call   c01097c5 <send_rec>
c01051ca:	83 c4 10             	add    $0x10,%esp
c01051cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01051d0:	83 f8 65             	cmp    $0x65,%eax
c01051d3:	74 19                	je     c01051ee <exec+0x6c>
c01051d5:	6a 19                	push   $0x19
c01051d7:	68 e7 b5 10 c0       	push   $0xc010b5e7
c01051dc:	68 e7 b5 10 c0       	push   $0xc010b5e7
c01051e1:	68 f2 b5 10 c0       	push   $0xc010b5f2
c01051e6:	e8 6a 39 00 00       	call   c0108b55 <assertion_failure>
c01051eb:	83 c4 10             	add    $0x10,%esp
c01051ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01051f1:	c9                   	leave  
c01051f2:	c3                   	ret    

c01051f3 <execv>:
c01051f3:	55                   	push   %ebp
c01051f4:	89 e5                	mov    %esp,%ebp
c01051f6:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c01051fc:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0105203:	83 ec 0c             	sub    $0xc,%esp
c0105206:	ff 75 e0             	pushl  -0x20(%ebp)
c0105209:	e8 7e c6 ff ff       	call   c010188c <sys_malloc>
c010520e:	83 c4 10             	add    $0x10,%esp
c0105211:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105214:	66 87 db             	xchg   %bx,%bx
c0105217:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010521a:	83 ec 04             	sub    $0x4,%esp
c010521d:	50                   	push   %eax
c010521e:	6a 00                	push   $0x0
c0105220:	ff 75 dc             	pushl  -0x24(%ebp)
c0105223:	e8 47 70 00 00       	call   c010c26f <Memset>
c0105228:	83 c4 10             	add    $0x10,%esp
c010522b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010522e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105231:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105238:	eb 23                	jmp    c010525d <execv+0x6a>
c010523a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010523d:	8b 00                	mov    (%eax),%eax
c010523f:	83 ec 08             	sub    $0x8,%esp
c0105242:	50                   	push   %eax
c0105243:	68 0a b6 10 c0       	push   $0xc010b60a
c0105248:	e8 ab 35 00 00       	call   c01087f8 <Printf>
c010524d:	83 c4 10             	add    $0x10,%esp
c0105250:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0105254:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105257:	83 c0 04             	add    $0x4,%eax
c010525a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010525d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105260:	8b 00                	mov    (%eax),%eax
c0105262:	85 c0                	test   %eax,%eax
c0105264:	75 d4                	jne    c010523a <execv+0x47>
c0105266:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105269:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010526c:	01 d0                	add    %edx,%eax
c010526e:	c6 00 00             	movb   $0x0,(%eax)
c0105271:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105274:	83 c0 04             	add    $0x4,%eax
c0105277:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010527a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010527d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105280:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105283:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105286:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010528d:	eb 5b                	jmp    c01052ea <execv+0xf7>
c010528f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105292:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105295:	01 c2                	add    %eax,%edx
c0105297:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010529a:	89 10                	mov    %edx,(%eax)
c010529c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010529f:	8b 00                	mov    (%eax),%eax
c01052a1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c01052a4:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01052a7:	01 ca                	add    %ecx,%edx
c01052a9:	83 ec 08             	sub    $0x8,%esp
c01052ac:	50                   	push   %eax
c01052ad:	52                   	push   %edx
c01052ae:	e8 db 6f 00 00       	call   c010c28e <Strcpy>
c01052b3:	83 c4 10             	add    $0x10,%esp
c01052b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01052b9:	8b 00                	mov    (%eax),%eax
c01052bb:	83 ec 0c             	sub    $0xc,%esp
c01052be:	50                   	push   %eax
c01052bf:	e8 e4 6f 00 00       	call   c010c2a8 <Strlen>
c01052c4:	83 c4 10             	add    $0x10,%esp
c01052c7:	01 45 f0             	add    %eax,-0x10(%ebp)
c01052ca:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01052cd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01052d0:	01 d0                	add    %edx,%eax
c01052d2:	c6 00 00             	movb   $0x0,(%eax)
c01052d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01052d8:	83 c0 01             	add    $0x1,%eax
c01052db:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01052de:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c01052e2:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c01052e6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01052ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01052ed:	8b 00                	mov    (%eax),%eax
c01052ef:	85 c0                	test   %eax,%eax
c01052f1:	75 9c                	jne    c010528f <execv+0x9c>
c01052f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01052f6:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c01052fb:	29 c2                	sub    %eax,%edx
c01052fd:	89 d0                	mov    %edx,%eax
c01052ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105302:	83 ec 0c             	sub    $0xc,%esp
c0105305:	ff 75 08             	pushl  0x8(%ebp)
c0105308:	e8 11 0f 00 00       	call   c010621e <get_physical_address>
c010530d:	83 c4 10             	add    $0x10,%esp
c0105310:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105313:	83 ec 0c             	sub    $0xc,%esp
c0105316:	ff 75 dc             	pushl  -0x24(%ebp)
c0105319:	e8 00 0f 00 00       	call   c010621e <get_physical_address>
c010531e:	83 c4 10             	add    $0x10,%esp
c0105321:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105324:	83 ec 0c             	sub    $0xc,%esp
c0105327:	ff 75 d8             	pushl  -0x28(%ebp)
c010532a:	e8 ef 0e 00 00       	call   c010621e <get_physical_address>
c010532f:	83 c4 10             	add    $0x10,%esp
c0105332:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105335:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c010533c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010533f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105342:	83 ec 0c             	sub    $0xc,%esp
c0105345:	ff 75 08             	pushl  0x8(%ebp)
c0105348:	e8 5b 6f 00 00       	call   c010c2a8 <Strlen>
c010534d:	83 c4 10             	add    $0x10,%esp
c0105350:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105353:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105356:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010535c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010535f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105365:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105368:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010536e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105371:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105377:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010537a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105380:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105383:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105386:	29 c2                	sub    %eax,%edx
c0105388:	89 d0                	mov    %edx,%eax
c010538a:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0105390:	83 ec 04             	sub    $0x4,%esp
c0105393:	6a 01                	push   $0x1
c0105395:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c010539b:	50                   	push   %eax
c010539c:	6a 03                	push   $0x3
c010539e:	e8 22 44 00 00       	call   c01097c5 <send_rec>
c01053a3:	83 c4 10             	add    $0x10,%esp
c01053a6:	83 ec 08             	sub    $0x8,%esp
c01053a9:	68 00 04 00 00       	push   $0x400
c01053ae:	ff 75 dc             	pushl  -0x24(%ebp)
c01053b1:	e8 eb c4 ff ff       	call   c01018a1 <sys_free>
c01053b6:	83 c4 10             	add    $0x10,%esp
c01053b9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01053bc:	83 f8 65             	cmp    $0x65,%eax
c01053bf:	74 1c                	je     c01053dd <execv+0x1ea>
c01053c1:	68 95 00 00 00       	push   $0x95
c01053c6:	68 e7 b5 10 c0       	push   $0xc010b5e7
c01053cb:	68 e7 b5 10 c0       	push   $0xc010b5e7
c01053d0:	68 f2 b5 10 c0       	push   $0xc010b5f2
c01053d5:	e8 7b 37 00 00       	call   c0108b55 <assertion_failure>
c01053da:	83 c4 10             	add    $0x10,%esp
c01053dd:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01053e0:	c9                   	leave  
c01053e1:	c3                   	ret    

c01053e2 <execl>:
c01053e2:	55                   	push   %ebp
c01053e3:	89 e5                	mov    %esp,%ebp
c01053e5:	83 ec 18             	sub    $0x18,%esp
c01053e8:	8d 45 0c             	lea    0xc(%ebp),%eax
c01053eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01053ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01053f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01053f4:	83 ec 08             	sub    $0x8,%esp
c01053f7:	ff 75 f0             	pushl  -0x10(%ebp)
c01053fa:	ff 75 08             	pushl  0x8(%ebp)
c01053fd:	e8 f1 fd ff ff       	call   c01051f3 <execv>
c0105402:	83 c4 10             	add    $0x10,%esp
c0105405:	c9                   	leave  
c0105406:	c3                   	ret    

c0105407 <TaskMM>:
c0105407:	55                   	push   %ebp
c0105408:	89 e5                	mov    %esp,%ebp
c010540a:	83 ec 28             	sub    $0x28,%esp
c010540d:	83 ec 0c             	sub    $0xc,%esp
c0105410:	6a 7c                	push   $0x7c
c0105412:	e8 75 c4 ff ff       	call   c010188c <sys_malloc>
c0105417:	83 c4 10             	add    $0x10,%esp
c010541a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010541d:	83 ec 0c             	sub    $0xc,%esp
c0105420:	6a 7c                	push   $0x7c
c0105422:	e8 65 c4 ff ff       	call   c010188c <sys_malloc>
c0105427:	83 c4 10             	add    $0x10,%esp
c010542a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010542d:	83 ec 04             	sub    $0x4,%esp
c0105430:	6a 12                	push   $0x12
c0105432:	ff 75 f0             	pushl  -0x10(%ebp)
c0105435:	6a 02                	push   $0x2
c0105437:	e8 89 43 00 00       	call   c01097c5 <send_rec>
c010543c:	83 c4 10             	add    $0x10,%esp
c010543f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105442:	8b 40 78             	mov    0x78(%eax),%eax
c0105445:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105448:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010544b:	8b 00                	mov    (%eax),%eax
c010544d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105450:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105457:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010545a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0105461:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105464:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c010546b:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c010546f:	74 4e                	je     c01054bf <TaskMM+0xb8>
c0105471:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105475:	7f 08                	jg     c010547f <TaskMM+0x78>
c0105477:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c010547b:	74 28                	je     c01054a5 <TaskMM+0x9e>
c010547d:	eb 71                	jmp    c01054f0 <TaskMM+0xe9>
c010547f:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0105483:	74 08                	je     c010548d <TaskMM+0x86>
c0105485:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0105489:	74 4e                	je     c01054d9 <TaskMM+0xd2>
c010548b:	eb 63                	jmp    c01054f0 <TaskMM+0xe9>
c010548d:	83 ec 0c             	sub    $0xc,%esp
c0105490:	ff 75 f0             	pushl  -0x10(%ebp)
c0105493:	e8 d0 04 00 00       	call   c0105968 <do_fork>
c0105498:	83 c4 10             	add    $0x10,%esp
c010549b:	89 c2                	mov    %eax,%edx
c010549d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01054a0:	89 50 5c             	mov    %edx,0x5c(%eax)
c01054a3:	eb 5c                	jmp    c0105501 <TaskMM+0xfa>
c01054a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01054ac:	66 87 db             	xchg   %bx,%bx
c01054af:	83 ec 0c             	sub    $0xc,%esp
c01054b2:	ff 75 f0             	pushl  -0x10(%ebp)
c01054b5:	e8 95 00 00 00       	call   c010554f <do_exec>
c01054ba:	83 c4 10             	add    $0x10,%esp
c01054bd:	eb 42                	jmp    c0105501 <TaskMM+0xfa>
c01054bf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01054c6:	83 ec 08             	sub    $0x8,%esp
c01054c9:	ff 75 e0             	pushl  -0x20(%ebp)
c01054cc:	ff 75 f0             	pushl  -0x10(%ebp)
c01054cf:	e8 02 05 00 00       	call   c01059d6 <do_exit>
c01054d4:	83 c4 10             	add    $0x10,%esp
c01054d7:	eb 28                	jmp    c0105501 <TaskMM+0xfa>
c01054d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01054e0:	83 ec 0c             	sub    $0xc,%esp
c01054e3:	ff 75 f0             	pushl  -0x10(%ebp)
c01054e6:	e8 75 05 00 00       	call   c0105a60 <do_wait>
c01054eb:	83 c4 10             	add    $0x10,%esp
c01054ee:	eb 11                	jmp    c0105501 <TaskMM+0xfa>
c01054f0:	83 ec 0c             	sub    $0xc,%esp
c01054f3:	68 14 b6 10 c0       	push   $0xc010b614
c01054f8:	e8 3a 36 00 00       	call   c0108b37 <panic>
c01054fd:	83 c4 10             	add    $0x10,%esp
c0105500:	90                   	nop
c0105501:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105505:	0f 84 22 ff ff ff    	je     c010542d <TaskMM+0x26>
c010550b:	83 ec 0c             	sub    $0xc,%esp
c010550e:	6a 03                	push   $0x3
c0105510:	e8 af 31 00 00       	call   c01086c4 <delay>
c0105515:	83 c4 10             	add    $0x10,%esp
c0105518:	83 ec 04             	sub    $0x4,%esp
c010551b:	ff 75 e4             	pushl  -0x1c(%ebp)
c010551e:	ff 75 ec             	pushl  -0x14(%ebp)
c0105521:	6a 01                	push   $0x1
c0105523:	e8 9d 42 00 00       	call   c01097c5 <send_rec>
c0105528:	83 c4 10             	add    $0x10,%esp
c010552b:	e9 fd fe ff ff       	jmp    c010542d <TaskMM+0x26>

c0105530 <alloc_mem>:
c0105530:	55                   	push   %ebp
c0105531:	89 e5                	mov    %esp,%ebp
c0105533:	83 ec 10             	sub    $0x10,%esp
c0105536:	8b 45 08             	mov    0x8(%ebp),%eax
c0105539:	83 e8 08             	sub    $0x8,%eax
c010553c:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0105542:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105547:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010554a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010554d:	c9                   	leave  
c010554e:	c3                   	ret    

c010554f <do_exec>:
c010554f:	55                   	push   %ebp
c0105550:	89 e5                	mov    %esp,%ebp
c0105552:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105558:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010555f:	65 76 5f 
c0105562:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c0105569:	74 79 31 
c010556c:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105573:	00 00 
c0105575:	83 ec 08             	sub    $0x8,%esp
c0105578:	6a 00                	push   $0x0
c010557a:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c0105580:	50                   	push   %eax
c0105581:	e8 29 f8 ff ff       	call   c0104daf <open>
c0105586:	83 c4 10             	add    $0x10,%esp
c0105589:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010558c:	8b 45 08             	mov    0x8(%ebp),%eax
c010558f:	8b 00                	mov    (%eax),%eax
c0105591:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105594:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c010559b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010559e:	83 ec 0c             	sub    $0xc,%esp
c01055a1:	50                   	push   %eax
c01055a2:	e8 e5 c2 ff ff       	call   c010188c <sys_malloc>
c01055a7:	83 c4 10             	add    $0x10,%esp
c01055aa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01055ad:	83 ec 04             	sub    $0x4,%esp
c01055b0:	ff 75 d0             	pushl  -0x30(%ebp)
c01055b3:	6a 00                	push   $0x0
c01055b5:	ff 75 cc             	pushl  -0x34(%ebp)
c01055b8:	e8 b2 6c 00 00       	call   c010c26f <Memset>
c01055bd:	83 c4 10             	add    $0x10,%esp
c01055c0:	83 ec 04             	sub    $0x4,%esp
c01055c3:	6a 0c                	push   $0xc
c01055c5:	6a 00                	push   $0x0
c01055c7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01055cd:	50                   	push   %eax
c01055ce:	e8 9c 6c 00 00       	call   c010c26f <Memset>
c01055d3:	83 c4 10             	add    $0x10,%esp
c01055d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01055d9:	8b 40 44             	mov    0x44(%eax),%eax
c01055dc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01055df:	8b 45 08             	mov    0x8(%ebp),%eax
c01055e2:	8b 40 40             	mov    0x40(%eax),%eax
c01055e5:	83 ec 08             	sub    $0x8,%esp
c01055e8:	50                   	push   %eax
c01055e9:	ff 75 c8             	pushl  -0x38(%ebp)
c01055ec:	e8 de 0a 00 00       	call   c01060cf <alloc_virtual_memory>
c01055f1:	83 c4 10             	add    $0x10,%esp
c01055f4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01055f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01055fa:	8b 40 40             	mov    0x40(%eax),%eax
c01055fd:	89 c2                	mov    %eax,%edx
c01055ff:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105602:	83 ec 04             	sub    $0x4,%esp
c0105605:	52                   	push   %edx
c0105606:	50                   	push   %eax
c0105607:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010560d:	50                   	push   %eax
c010560e:	e8 29 19 00 00       	call   c0106f3c <Memcpy>
c0105613:	83 c4 10             	add    $0x10,%esp
c0105616:	8b 45 08             	mov    0x8(%ebp),%eax
c0105619:	8b 40 40             	mov    0x40(%eax),%eax
c010561c:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105623:	00 
c0105624:	83 ec 08             	sub    $0x8,%esp
c0105627:	6a 00                	push   $0x0
c0105629:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010562f:	50                   	push   %eax
c0105630:	e8 7a f7 ff ff       	call   c0104daf <open>
c0105635:	83 c4 10             	add    $0x10,%esp
c0105638:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010563b:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010563f:	75 15                	jne    c0105656 <do_exec+0x107>
c0105641:	83 ec 0c             	sub    $0xc,%esp
c0105644:	68 25 b6 10 c0       	push   $0xc010b625
c0105649:	e8 aa 31 00 00       	call   c01087f8 <Printf>
c010564e:	83 c4 10             	add    $0x10,%esp
c0105651:	e9 10 03 00 00       	jmp    c0105966 <do_exec+0x417>
c0105656:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010565d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105660:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105663:	01 d0                	add    %edx,%eax
c0105665:	83 ec 04             	sub    $0x4,%esp
c0105668:	68 00 10 00 00       	push   $0x1000
c010566d:	50                   	push   %eax
c010566e:	ff 75 c0             	pushl  -0x40(%ebp)
c0105671:	e8 ce f7 ff ff       	call   c0104e44 <read>
c0105676:	83 c4 10             	add    $0x10,%esp
c0105679:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010567c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010567f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0105682:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0105686:	74 0a                	je     c0105692 <do_exec+0x143>
c0105688:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010568b:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c010568e:	7d 05                	jge    c0105695 <do_exec+0x146>
c0105690:	eb cb                	jmp    c010565d <do_exec+0x10e>
c0105692:	90                   	nop
c0105693:	eb 01                	jmp    c0105696 <do_exec+0x147>
c0105695:	90                   	nop
c0105696:	83 ec 0c             	sub    $0xc,%esp
c0105699:	ff 75 c0             	pushl  -0x40(%ebp)
c010569c:	e8 a9 f9 ff ff       	call   c010504a <close>
c01056a1:	83 c4 10             	add    $0x10,%esp
c01056a4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01056a7:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01056aa:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056ad:	8b 40 18             	mov    0x18(%eax),%eax
c01056b0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01056b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01056ba:	e9 04 01 00 00       	jmp    c01057c3 <do_exec+0x274>
c01056bf:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056c2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c01056c6:	0f b7 d0             	movzwl %ax,%edx
c01056c9:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056cc:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c01056d0:	0f b7 c0             	movzwl %ax,%eax
c01056d3:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c01056d7:	01 c2                	add    %eax,%edx
c01056d9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01056dc:	01 d0                	add    %edx,%eax
c01056de:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01056e1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01056e4:	8b 40 10             	mov    0x10(%eax),%eax
c01056e7:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01056ea:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01056ed:	05 ff 0f 00 00       	add    $0xfff,%eax
c01056f2:	c1 e8 0c             	shr    $0xc,%eax
c01056f5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01056f8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01056fb:	8b 40 08             	mov    0x8(%eax),%eax
c01056fe:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0105701:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105708:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010570b:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010570e:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0105711:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105714:	8b 50 04             	mov    0x4(%eax),%edx
c0105717:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010571a:	01 d0                	add    %edx,%eax
c010571c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010571f:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105723:	0f 84 95 00 00 00    	je     c01057be <do_exec+0x26f>
c0105729:	83 ec 04             	sub    $0x4,%esp
c010572c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010572f:	ff 75 a8             	pushl  -0x58(%ebp)
c0105732:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105735:	e8 a0 07 00 00       	call   c0105eda <get_virtual_address_start_with_addr>
c010573a:	83 c4 10             	add    $0x10,%esp
c010573d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105740:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105743:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105746:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010574d:	eb 41                	jmp    c0105790 <do_exec+0x241>
c010574f:	83 ec 08             	sub    $0x8,%esp
c0105752:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105755:	ff 75 e8             	pushl  -0x18(%ebp)
c0105758:	e8 f3 0a 00 00       	call   c0106250 <alloc_physical_memory_of_proc>
c010575d:	83 c4 10             	add    $0x10,%esp
c0105760:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105763:	83 ec 08             	sub    $0x8,%esp
c0105766:	68 00 10 00 00       	push   $0x1000
c010576b:	ff 75 94             	pushl  -0x6c(%ebp)
c010576e:	e8 5c 09 00 00       	call   c01060cf <alloc_virtual_memory>
c0105773:	83 c4 10             	add    $0x10,%esp
c0105776:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105779:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010577d:	75 06                	jne    c0105785 <do_exec+0x236>
c010577f:	8b 45 90             	mov    -0x70(%ebp),%eax
c0105782:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105785:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c010578c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0105790:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105793:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105796:	77 b7                	ja     c010574f <do_exec+0x200>
c0105798:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010579b:	8b 40 10             	mov    0x10(%eax),%eax
c010579e:	89 c1                	mov    %eax,%ecx
c01057a0:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01057a3:	8b 50 04             	mov    0x4(%eax),%edx
c01057a6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01057a9:	01 c2                	add    %eax,%edx
c01057ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01057ae:	83 ec 04             	sub    $0x4,%esp
c01057b1:	51                   	push   %ecx
c01057b2:	52                   	push   %edx
c01057b3:	50                   	push   %eax
c01057b4:	e8 83 17 00 00       	call   c0106f3c <Memcpy>
c01057b9:	83 c4 10             	add    $0x10,%esp
c01057bc:	eb 01                	jmp    c01057bf <do_exec+0x270>
c01057be:	90                   	nop
c01057bf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01057c3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01057c6:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01057ca:	0f b7 c0             	movzwl %ax,%eax
c01057cd:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01057d0:	0f 8c e9 fe ff ff    	jl     c01056bf <do_exec+0x170>
c01057d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01057d9:	8b 40 10             	mov    0x10(%eax),%eax
c01057dc:	89 45 8c             	mov    %eax,-0x74(%ebp)
c01057df:	8b 45 08             	mov    0x8(%ebp),%eax
c01057e2:	8b 40 1c             	mov    0x1c(%eax),%eax
c01057e5:	89 45 88             	mov    %eax,-0x78(%ebp)
c01057e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01057eb:	8b 40 24             	mov    0x24(%eax),%eax
c01057ee:	89 45 84             	mov    %eax,-0x7c(%ebp)
c01057f1:	83 ec 0c             	sub    $0xc,%esp
c01057f4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01057f7:	e8 8a e2 ff ff       	call   c0103a86 <pid2proc>
c01057fc:	83 c4 10             	add    $0x10,%esp
c01057ff:	89 45 80             	mov    %eax,-0x80(%ebp)
c0105802:	8b 45 08             	mov    0x8(%ebp),%eax
c0105805:	8b 40 10             	mov    0x10(%eax),%eax
c0105808:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010580e:	83 ec 08             	sub    $0x8,%esp
c0105811:	ff 75 88             	pushl  -0x78(%ebp)
c0105814:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c010581a:	e8 b0 08 00 00       	call   c01060cf <alloc_virtual_memory>
c010581f:	83 c4 10             	add    $0x10,%esp
c0105822:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105828:	8b 45 08             	mov    0x8(%ebp),%eax
c010582b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010582e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105834:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010583b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0105841:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105844:	eb 1a                	jmp    c0105860 <do_exec+0x311>
c0105846:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010584a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010584d:	8b 10                	mov    (%eax),%edx
c010584f:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105855:	01 c2                	add    %eax,%edx
c0105857:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010585a:	89 10                	mov    %edx,(%eax)
c010585c:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0105860:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105863:	8b 00                	mov    (%eax),%eax
c0105865:	85 c0                	test   %eax,%eax
c0105867:	75 dd                	jne    c0105846 <do_exec+0x2f7>
c0105869:	83 ec 0c             	sub    $0xc,%esp
c010586c:	ff 75 84             	pushl  -0x7c(%ebp)
c010586f:	e8 5b 08 00 00       	call   c01060cf <alloc_virtual_memory>
c0105874:	83 c4 10             	add    $0x10,%esp
c0105877:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010587d:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c0105883:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0105889:	83 ec 04             	sub    $0x4,%esp
c010588c:	ff 75 88             	pushl  -0x78(%ebp)
c010588f:	52                   	push   %edx
c0105890:	50                   	push   %eax
c0105891:	e8 a6 16 00 00       	call   c0106f3c <Memcpy>
c0105896:	83 c4 10             	add    $0x10,%esp
c0105899:	8b 45 08             	mov    0x8(%ebp),%eax
c010589c:	8b 40 28             	mov    0x28(%eax),%eax
c010589f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01058a5:	83 ec 08             	sub    $0x8,%esp
c01058a8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01058ab:	ff 75 80             	pushl  -0x80(%ebp)
c01058ae:	e8 ef 08 00 00       	call   c01061a2 <get_physical_address_proc>
c01058b3:	83 c4 10             	add    $0x10,%esp
c01058b6:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c01058bc:	83 ec 08             	sub    $0x8,%esp
c01058bf:	68 00 10 00 00       	push   $0x1000
c01058c4:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c01058ca:	e8 00 08 00 00       	call   c01060cf <alloc_virtual_memory>
c01058cf:	83 c4 10             	add    $0x10,%esp
c01058d2:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c01058d8:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c01058de:	05 bc 0f 00 00       	add    $0xfbc,%eax
c01058e3:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01058e9:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01058ef:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01058f5:	89 50 20             	mov    %edx,0x20(%eax)
c01058f8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01058fb:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105901:	89 50 28             	mov    %edx,0x28(%eax)
c0105904:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105907:	8b 40 18             	mov    0x18(%eax),%eax
c010590a:	89 c2                	mov    %eax,%edx
c010590c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105912:	89 50 30             	mov    %edx,0x30(%eax)
c0105915:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010591b:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105921:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105924:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105927:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010592e:	00 00 00 
c0105931:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105938:	00 00 00 
c010593b:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0105942:	00 00 00 
c0105945:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c010594c:	00 00 00 
c010594f:	83 ec 04             	sub    $0x4,%esp
c0105952:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105955:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c010595b:	50                   	push   %eax
c010595c:	6a 01                	push   $0x1
c010595e:	e8 62 3e 00 00       	call   c01097c5 <send_rec>
c0105963:	83 c4 10             	add    $0x10,%esp
c0105966:	c9                   	leave  
c0105967:	c3                   	ret    

c0105968 <do_fork>:
c0105968:	55                   	push   %ebp
c0105969:	89 e5                	mov    %esp,%ebp
c010596b:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0105971:	8b 45 08             	mov    0x8(%ebp),%eax
c0105974:	8b 00                	mov    (%eax),%eax
c0105976:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105979:	83 ec 0c             	sub    $0xc,%esp
c010597c:	ff 75 f4             	pushl  -0xc(%ebp)
c010597f:	e8 3c 47 00 00       	call   c010a0c0 <fork_process>
c0105984:	83 c4 10             	add    $0x10,%esp
c0105987:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010598a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010598d:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105993:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105996:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105999:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010599f:	8b 45 08             	mov    0x8(%ebp),%eax
c01059a2:	89 50 5c             	mov    %edx,0x5c(%eax)
c01059a5:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c01059ac:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01059b3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01059ba:	83 ec 04             	sub    $0x4,%esp
c01059bd:	ff 75 ec             	pushl  -0x14(%ebp)
c01059c0:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c01059c6:	50                   	push   %eax
c01059c7:	6a 01                	push   $0x1
c01059c9:	e8 f7 3d 00 00       	call   c01097c5 <send_rec>
c01059ce:	83 c4 10             	add    $0x10,%esp
c01059d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01059d4:	c9                   	leave  
c01059d5:	c3                   	ret    

c01059d6 <do_exit>:
c01059d6:	55                   	push   %ebp
c01059d7:	89 e5                	mov    %esp,%ebp
c01059d9:	83 ec 18             	sub    $0x18,%esp
c01059dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01059df:	8b 00                	mov    (%eax),%eax
c01059e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01059e4:	83 ec 0c             	sub    $0xc,%esp
c01059e7:	ff 75 f4             	pushl  -0xc(%ebp)
c01059ea:	e8 97 e0 ff ff       	call   c0103a86 <pid2proc>
c01059ef:	83 c4 10             	add    $0x10,%esp
c01059f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01059f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01059f8:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01059fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a01:	83 ec 0c             	sub    $0xc,%esp
c0105a04:	ff 75 ec             	pushl  -0x14(%ebp)
c0105a07:	e8 7a e0 ff ff       	call   c0103a86 <pid2proc>
c0105a0c:	83 c4 10             	add    $0x10,%esp
c0105a0f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105a12:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105a16:	74 45                	je     c0105a5d <do_exit+0x87>
c0105a18:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a1b:	8b 40 54             	mov    0x54(%eax),%eax
c0105a1e:	89 c2                	mov    %eax,%edx
c0105a20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a23:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105a29:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105a2c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105a33:	3c 04                	cmp    $0x4,%al
c0105a35:	75 1a                	jne    c0105a51 <do_exit+0x7b>
c0105a37:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105a3a:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105a41:	83 ec 0c             	sub    $0xc,%esp
c0105a44:	ff 75 f0             	pushl  -0x10(%ebp)
c0105a47:	e8 33 01 00 00       	call   c0105b7f <cleanup>
c0105a4c:	83 c4 10             	add    $0x10,%esp
c0105a4f:	eb 0d                	jmp    c0105a5e <do_exit+0x88>
c0105a51:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a54:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0105a5b:	eb 01                	jmp    c0105a5e <do_exit+0x88>
c0105a5d:	90                   	nop
c0105a5e:	c9                   	leave  
c0105a5f:	c3                   	ret    

c0105a60 <do_wait>:
c0105a60:	55                   	push   %ebp
c0105a61:	89 e5                	mov    %esp,%ebp
c0105a63:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0105a69:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a6c:	8b 00                	mov    (%eax),%eax
c0105a6e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a71:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105a78:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105a7f:	83 ec 0c             	sub    $0xc,%esp
c0105a82:	ff 75 ec             	pushl  -0x14(%ebp)
c0105a85:	e8 fc df ff ff       	call   c0103a86 <pid2proc>
c0105a8a:	83 c4 10             	add    $0x10,%esp
c0105a8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105a90:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105a94:	75 19                	jne    c0105aaf <do_wait+0x4f>
c0105a96:	6a 58                	push   $0x58
c0105a98:	68 35 b6 10 c0       	push   $0xc010b635
c0105a9d:	68 35 b6 10 c0       	push   $0xc010b635
c0105aa2:	68 43 b6 10 c0       	push   $0xc010b643
c0105aa7:	e8 a9 30 00 00       	call   c0108b55 <assertion_failure>
c0105aac:	83 c4 10             	add    $0x10,%esp
c0105aaf:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105ab4:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c0105aba:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105abd:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105ac0:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105ac5:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c0105acb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105ace:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105ad1:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105ad6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ad9:	eb 5b                	jmp    c0105b36 <do_wait+0xd6>
c0105adb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ade:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ae3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ae6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105ae9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105aef:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0105af2:	74 0b                	je     c0105aff <do_wait+0x9f>
c0105af4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105af7:	8b 40 04             	mov    0x4(%eax),%eax
c0105afa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105afd:	eb 37                	jmp    c0105b36 <do_wait+0xd6>
c0105aff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105b03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b06:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105b0d:	3c 03                	cmp    $0x3,%al
c0105b0f:	74 0b                	je     c0105b1c <do_wait+0xbc>
c0105b11:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b14:	8b 40 04             	mov    0x4(%eax),%eax
c0105b17:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b1a:	eb 1a                	jmp    c0105b36 <do_wait+0xd6>
c0105b1c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105b1f:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105b26:	83 ec 0c             	sub    $0xc,%esp
c0105b29:	ff 75 e8             	pushl  -0x18(%ebp)
c0105b2c:	e8 4e 00 00 00       	call   c0105b7f <cleanup>
c0105b31:	83 c4 10             	add    $0x10,%esp
c0105b34:	eb 47                	jmp    c0105b7d <do_wait+0x11d>
c0105b36:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c0105b3d:	75 9c                	jne    c0105adb <do_wait+0x7b>
c0105b3f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105b43:	74 0c                	je     c0105b51 <do_wait+0xf1>
c0105b45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105b48:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c0105b4f:	eb 2c                	jmp    c0105b7d <do_wait+0x11d>
c0105b51:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105b58:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0105b5f:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105b66:	83 ec 04             	sub    $0x4,%esp
c0105b69:	ff 75 ec             	pushl  -0x14(%ebp)
c0105b6c:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c0105b72:	50                   	push   %eax
c0105b73:	6a 01                	push   $0x1
c0105b75:	e8 4b 3c 00 00       	call   c01097c5 <send_rec>
c0105b7a:	83 c4 10             	add    $0x10,%esp
c0105b7d:	c9                   	leave  
c0105b7e:	c3                   	ret    

c0105b7f <cleanup>:
c0105b7f:	55                   	push   %ebp
c0105b80:	89 e5                	mov    %esp,%ebp
c0105b82:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105b88:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0105b8f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105b96:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b99:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105b9f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105ba2:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ba5:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0105bab:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105bae:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bb1:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105bb7:	83 ec 04             	sub    $0x4,%esp
c0105bba:	50                   	push   %eax
c0105bbb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105bc1:	50                   	push   %eax
c0105bc2:	6a 01                	push   $0x1
c0105bc4:	e8 fc 3b 00 00       	call   c01097c5 <send_rec>
c0105bc9:	83 c4 10             	add    $0x10,%esp
c0105bcc:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bcf:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105bd6:	90                   	nop
c0105bd7:	c9                   	leave  
c0105bd8:	c3                   	ret    

c0105bd9 <init_bitmap>:
c0105bd9:	55                   	push   %ebp
c0105bda:	89 e5                	mov    %esp,%ebp
c0105bdc:	83 ec 08             	sub    $0x8,%esp
c0105bdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0105be2:	8b 50 04             	mov    0x4(%eax),%edx
c0105be5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105be8:	8b 00                	mov    (%eax),%eax
c0105bea:	83 ec 04             	sub    $0x4,%esp
c0105bed:	52                   	push   %edx
c0105bee:	6a 00                	push   $0x0
c0105bf0:	50                   	push   %eax
c0105bf1:	e8 79 66 00 00       	call   c010c26f <Memset>
c0105bf6:	83 c4 10             	add    $0x10,%esp
c0105bf9:	90                   	nop
c0105bfa:	c9                   	leave  
c0105bfb:	c3                   	ret    

c0105bfc <test_bit_val>:
c0105bfc:	55                   	push   %ebp
c0105bfd:	89 e5                	mov    %esp,%ebp
c0105bff:	53                   	push   %ebx
c0105c00:	83 ec 10             	sub    $0x10,%esp
c0105c03:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c06:	8d 50 07             	lea    0x7(%eax),%edx
c0105c09:	85 c0                	test   %eax,%eax
c0105c0b:	0f 48 c2             	cmovs  %edx,%eax
c0105c0e:	c1 f8 03             	sar    $0x3,%eax
c0105c11:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c14:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c17:	99                   	cltd   
c0105c18:	c1 ea 1d             	shr    $0x1d,%edx
c0105c1b:	01 d0                	add    %edx,%eax
c0105c1d:	83 e0 07             	and    $0x7,%eax
c0105c20:	29 d0                	sub    %edx,%eax
c0105c22:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c25:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c28:	8b 10                	mov    (%eax),%edx
c0105c2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c2d:	01 d0                	add    %edx,%eax
c0105c2f:	0f b6 00             	movzbl (%eax),%eax
c0105c32:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105c35:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105c39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c3c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105c41:	89 c1                	mov    %eax,%ecx
c0105c43:	d3 e3                	shl    %cl,%ebx
c0105c45:	89 d8                	mov    %ebx,%eax
c0105c47:	21 c2                	and    %eax,%edx
c0105c49:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c4c:	89 c1                	mov    %eax,%ecx
c0105c4e:	d3 fa                	sar    %cl,%edx
c0105c50:	89 d0                	mov    %edx,%eax
c0105c52:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c55:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105c59:	0f 9f c0             	setg   %al
c0105c5c:	0f b6 c0             	movzbl %al,%eax
c0105c5f:	83 c4 10             	add    $0x10,%esp
c0105c62:	5b                   	pop    %ebx
c0105c63:	5d                   	pop    %ebp
c0105c64:	c3                   	ret    

c0105c65 <set_bit_val>:
c0105c65:	55                   	push   %ebp
c0105c66:	89 e5                	mov    %esp,%ebp
c0105c68:	83 ec 10             	sub    $0x10,%esp
c0105c6b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c6e:	8d 50 07             	lea    0x7(%eax),%edx
c0105c71:	85 c0                	test   %eax,%eax
c0105c73:	0f 48 c2             	cmovs  %edx,%eax
c0105c76:	c1 f8 03             	sar    $0x3,%eax
c0105c79:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c7c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c7f:	99                   	cltd   
c0105c80:	c1 ea 1d             	shr    $0x1d,%edx
c0105c83:	01 d0                	add    %edx,%eax
c0105c85:	83 e0 07             	and    $0x7,%eax
c0105c88:	29 d0                	sub    %edx,%eax
c0105c8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c90:	8b 10                	mov    (%eax),%edx
c0105c92:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c95:	01 d0                	add    %edx,%eax
c0105c97:	0f b6 00             	movzbl (%eax),%eax
c0105c9a:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105c9d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105ca1:	7e 13                	jle    c0105cb6 <set_bit_val+0x51>
c0105ca3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105ca6:	ba 01 00 00 00       	mov    $0x1,%edx
c0105cab:	89 c1                	mov    %eax,%ecx
c0105cad:	d3 e2                	shl    %cl,%edx
c0105caf:	89 d0                	mov    %edx,%eax
c0105cb1:	08 45 ff             	or     %al,-0x1(%ebp)
c0105cb4:	eb 13                	jmp    c0105cc9 <set_bit_val+0x64>
c0105cb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105cb9:	ba 01 00 00 00       	mov    $0x1,%edx
c0105cbe:	89 c1                	mov    %eax,%ecx
c0105cc0:	d3 e2                	shl    %cl,%edx
c0105cc2:	89 d0                	mov    %edx,%eax
c0105cc4:	f7 d0                	not    %eax
c0105cc6:	20 45 ff             	and    %al,-0x1(%ebp)
c0105cc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ccc:	8b 10                	mov    (%eax),%edx
c0105cce:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105cd1:	01 c2                	add    %eax,%edx
c0105cd3:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105cd7:	88 02                	mov    %al,(%edx)
c0105cd9:	b8 01 00 00 00       	mov    $0x1,%eax
c0105cde:	c9                   	leave  
c0105cdf:	c3                   	ret    

c0105ce0 <set_bits>:
c0105ce0:	55                   	push   %ebp
c0105ce1:	89 e5                	mov    %esp,%ebp
c0105ce3:	83 ec 10             	sub    $0x10,%esp
c0105ce6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105ced:	eb 1c                	jmp    c0105d0b <set_bits+0x2b>
c0105cef:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105cf2:	8d 50 01             	lea    0x1(%eax),%edx
c0105cf5:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105cf8:	ff 75 10             	pushl  0x10(%ebp)
c0105cfb:	50                   	push   %eax
c0105cfc:	ff 75 08             	pushl  0x8(%ebp)
c0105cff:	e8 61 ff ff ff       	call   c0105c65 <set_bit_val>
c0105d04:	83 c4 0c             	add    $0xc,%esp
c0105d07:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105d0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105d0e:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105d11:	7c dc                	jl     c0105cef <set_bits+0xf>
c0105d13:	b8 01 00 00 00       	mov    $0x1,%eax
c0105d18:	c9                   	leave  
c0105d19:	c3                   	ret    

c0105d1a <get_first_free_bit>:
c0105d1a:	55                   	push   %ebp
c0105d1b:	89 e5                	mov    %esp,%ebp
c0105d1d:	83 ec 10             	sub    $0x10,%esp
c0105d20:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d23:	8b 40 04             	mov    0x4(%eax),%eax
c0105d26:	c1 e0 03             	shl    $0x3,%eax
c0105d29:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105d2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d2f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105d32:	eb 1b                	jmp    c0105d4f <get_first_free_bit+0x35>
c0105d34:	ff 75 fc             	pushl  -0x4(%ebp)
c0105d37:	ff 75 08             	pushl  0x8(%ebp)
c0105d3a:	e8 bd fe ff ff       	call   c0105bfc <test_bit_val>
c0105d3f:	83 c4 08             	add    $0x8,%esp
c0105d42:	85 c0                	test   %eax,%eax
c0105d44:	75 05                	jne    c0105d4b <get_first_free_bit+0x31>
c0105d46:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105d49:	eb 11                	jmp    c0105d5c <get_first_free_bit+0x42>
c0105d4b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105d4f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105d52:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105d55:	7c dd                	jl     c0105d34 <get_first_free_bit+0x1a>
c0105d57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105d5c:	c9                   	leave  
c0105d5d:	c3                   	ret    

c0105d5e <get_bits>:
c0105d5e:	55                   	push   %ebp
c0105d5f:	89 e5                	mov    %esp,%ebp
c0105d61:	83 ec 20             	sub    $0x20,%esp
c0105d64:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105d6b:	ff 75 f0             	pushl  -0x10(%ebp)
c0105d6e:	ff 75 08             	pushl  0x8(%ebp)
c0105d71:	e8 a4 ff ff ff       	call   c0105d1a <get_first_free_bit>
c0105d76:	83 c4 08             	add    $0x8,%esp
c0105d79:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d7f:	8b 40 04             	mov    0x4(%eax),%eax
c0105d82:	c1 e0 03             	shl    $0x3,%eax
c0105d85:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d88:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d8b:	83 e8 01             	sub    $0x1,%eax
c0105d8e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105d91:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105d95:	75 08                	jne    c0105d9f <get_bits+0x41>
c0105d97:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d9a:	e9 85 00 00 00       	jmp    c0105e24 <get_bits+0xc6>
c0105d9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105da2:	83 c0 01             	add    $0x1,%eax
c0105da5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105da8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105dab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105dae:	eb 58                	jmp    c0105e08 <get_bits+0xaa>
c0105db0:	ff 75 f8             	pushl  -0x8(%ebp)
c0105db3:	ff 75 08             	pushl  0x8(%ebp)
c0105db6:	e8 41 fe ff ff       	call   c0105bfc <test_bit_val>
c0105dbb:	83 c4 08             	add    $0x8,%esp
c0105dbe:	85 c0                	test   %eax,%eax
c0105dc0:	75 0a                	jne    c0105dcc <get_bits+0x6e>
c0105dc2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105dc6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105dca:	eb 2b                	jmp    c0105df7 <get_bits+0x99>
c0105dcc:	6a 00                	push   $0x0
c0105dce:	ff 75 08             	pushl  0x8(%ebp)
c0105dd1:	e8 44 ff ff ff       	call   c0105d1a <get_first_free_bit>
c0105dd6:	83 c4 08             	add    $0x8,%esp
c0105dd9:	83 c0 01             	add    $0x1,%eax
c0105ddc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ddf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105de2:	83 c0 01             	add    $0x1,%eax
c0105de5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105de8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105deb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105dee:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105df1:	83 e8 01             	sub    $0x1,%eax
c0105df4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105df7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105dfa:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105dfd:	7c 09                	jl     c0105e08 <get_bits+0xaa>
c0105dff:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105e06:	eb 0d                	jmp    c0105e15 <get_bits+0xb7>
c0105e08:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105e0b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105e0e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105e11:	85 c0                	test   %eax,%eax
c0105e13:	7f 9b                	jg     c0105db0 <get_bits+0x52>
c0105e15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e18:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105e1b:	83 c0 01             	add    $0x1,%eax
c0105e1e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105e21:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105e24:	c9                   	leave  
c0105e25:	c3                   	ret    

c0105e26 <get_a_page>:
c0105e26:	55                   	push   %ebp
c0105e27:	89 e5                	mov    %esp,%ebp
c0105e29:	83 ec 28             	sub    $0x28,%esp
c0105e2c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105e30:	75 22                	jne    c0105e54 <get_a_page+0x2e>
c0105e32:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105e37:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e3a:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105e3f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e42:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105e47:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e4a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105e4f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e52:	eb 20                	jmp    c0105e74 <get_a_page+0x4e>
c0105e54:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105e59:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e5c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105e61:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e64:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105e69:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e6c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105e71:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e74:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105e77:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e7a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105e7d:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105e80:	6a 01                	push   $0x1
c0105e82:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105e85:	50                   	push   %eax
c0105e86:	e8 d3 fe ff ff       	call   c0105d5e <get_bits>
c0105e8b:	83 c4 08             	add    $0x8,%esp
c0105e8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e91:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105e95:	75 1c                	jne    c0105eb3 <get_a_page+0x8d>
c0105e97:	68 84 00 00 00       	push   $0x84
c0105e9c:	68 56 b6 10 c0       	push   $0xc010b656
c0105ea1:	68 56 b6 10 c0       	push   $0xc010b656
c0105ea6:	68 60 b6 10 c0       	push   $0xc010b660
c0105eab:	e8 a5 2c 00 00       	call   c0108b55 <assertion_failure>
c0105eb0:	83 c4 10             	add    $0x10,%esp
c0105eb3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105eb6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105eb9:	c1 e2 0c             	shl    $0xc,%edx
c0105ebc:	01 d0                	add    %edx,%eax
c0105ebe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ec1:	83 ec 04             	sub    $0x4,%esp
c0105ec4:	6a 01                	push   $0x1
c0105ec6:	ff 75 f4             	pushl  -0xc(%ebp)
c0105ec9:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105ecc:	50                   	push   %eax
c0105ecd:	e8 93 fd ff ff       	call   c0105c65 <set_bit_val>
c0105ed2:	83 c4 10             	add    $0x10,%esp
c0105ed5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ed8:	c9                   	leave  
c0105ed9:	c3                   	ret    

c0105eda <get_virtual_address_start_with_addr>:
c0105eda:	55                   	push   %ebp
c0105edb:	89 e5                	mov    %esp,%ebp
c0105edd:	83 ec 38             	sub    $0x38,%esp
c0105ee0:	e8 57 a5 ff ff       	call   c010043c <get_running_thread_pcb>
c0105ee5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ee8:	83 ec 0c             	sub    $0xc,%esp
c0105eeb:	ff 75 10             	pushl  0x10(%ebp)
c0105eee:	e8 93 db ff ff       	call   c0103a86 <pid2proc>
c0105ef3:	83 c4 10             	add    $0x10,%esp
c0105ef6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ef9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105efc:	8b 40 0c             	mov    0xc(%eax),%eax
c0105eff:	83 ec 04             	sub    $0x4,%esp
c0105f02:	6a 0c                	push   $0xc
c0105f04:	50                   	push   %eax
c0105f05:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105f08:	50                   	push   %eax
c0105f09:	e8 2e 10 00 00       	call   c0106f3c <Memcpy>
c0105f0e:	83 c4 10             	add    $0x10,%esp
c0105f11:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f14:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105f17:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105f1a:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105f1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f20:	8b 55 08             	mov    0x8(%ebp),%edx
c0105f23:	29 c2                	sub    %eax,%edx
c0105f25:	89 d0                	mov    %edx,%eax
c0105f27:	c1 e8 0c             	shr    $0xc,%eax
c0105f2a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f2d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105f31:	79 1c                	jns    c0105f4f <get_virtual_address_start_with_addr+0x75>
c0105f33:	68 97 00 00 00       	push   $0x97
c0105f38:	68 56 b6 10 c0       	push   $0xc010b656
c0105f3d:	68 56 b6 10 c0       	push   $0xc010b656
c0105f42:	68 6c b6 10 c0       	push   $0xc010b66c
c0105f47:	e8 09 2c 00 00       	call   c0108b55 <assertion_failure>
c0105f4c:	83 c4 10             	add    $0x10,%esp
c0105f4f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f52:	50                   	push   %eax
c0105f53:	6a 01                	push   $0x1
c0105f55:	ff 75 ec             	pushl  -0x14(%ebp)
c0105f58:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105f5b:	50                   	push   %eax
c0105f5c:	e8 7f fd ff ff       	call   c0105ce0 <set_bits>
c0105f61:	83 c4 10             	add    $0x10,%esp
c0105f64:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f67:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f6c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105f72:	c9                   	leave  
c0105f73:	c3                   	ret    

c0105f74 <get_virtual_address>:
c0105f74:	55                   	push   %ebp
c0105f75:	89 e5                	mov    %esp,%ebp
c0105f77:	83 ec 28             	sub    $0x28,%esp
c0105f7a:	e8 bd a4 ff ff       	call   c010043c <get_running_thread_pcb>
c0105f7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f82:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105f86:	75 1a                	jne    c0105fa2 <get_virtual_address+0x2e>
c0105f88:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105f8d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f90:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105f95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f98:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105f9d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105fa0:	eb 18                	jmp    c0105fba <get_virtual_address+0x46>
c0105fa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105fa5:	8b 40 0c             	mov    0xc(%eax),%eax
c0105fa8:	83 ec 04             	sub    $0x4,%esp
c0105fab:	6a 0c                	push   $0xc
c0105fad:	50                   	push   %eax
c0105fae:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105fb1:	50                   	push   %eax
c0105fb2:	e8 85 0f 00 00       	call   c0106f3c <Memcpy>
c0105fb7:	83 c4 10             	add    $0x10,%esp
c0105fba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105fbd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105fc0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105fc3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105fc6:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fc9:	83 ec 08             	sub    $0x8,%esp
c0105fcc:	50                   	push   %eax
c0105fcd:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105fd0:	50                   	push   %eax
c0105fd1:	e8 88 fd ff ff       	call   c0105d5e <get_bits>
c0105fd6:	83 c4 10             	add    $0x10,%esp
c0105fd9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fdc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105fdf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105fe2:	c1 e2 0c             	shl    $0xc,%edx
c0105fe5:	01 d0                	add    %edx,%eax
c0105fe7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fea:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fed:	50                   	push   %eax
c0105fee:	6a 01                	push   $0x1
c0105ff0:	ff 75 f0             	pushl  -0x10(%ebp)
c0105ff3:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105ff6:	50                   	push   %eax
c0105ff7:	e8 e4 fc ff ff       	call   c0105ce0 <set_bits>
c0105ffc:	83 c4 10             	add    $0x10,%esp
c0105fff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106002:	c9                   	leave  
c0106003:	c3                   	ret    

c0106004 <ptr_pde>:
c0106004:	55                   	push   %ebp
c0106005:	89 e5                	mov    %esp,%ebp
c0106007:	8b 45 08             	mov    0x8(%ebp),%eax
c010600a:	c1 e8 16             	shr    $0x16,%eax
c010600d:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0106012:	c1 e0 02             	shl    $0x2,%eax
c0106015:	5d                   	pop    %ebp
c0106016:	c3                   	ret    

c0106017 <ptr_pte>:
c0106017:	55                   	push   %ebp
c0106018:	89 e5                	mov    %esp,%ebp
c010601a:	8b 45 08             	mov    0x8(%ebp),%eax
c010601d:	c1 e8 0a             	shr    $0xa,%eax
c0106020:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0106025:	89 c2                	mov    %eax,%edx
c0106027:	8b 45 08             	mov    0x8(%ebp),%eax
c010602a:	c1 e8 0c             	shr    $0xc,%eax
c010602d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0106032:	c1 e0 02             	shl    $0x2,%eax
c0106035:	01 d0                	add    %edx,%eax
c0106037:	2d 00 00 40 00       	sub    $0x400000,%eax
c010603c:	5d                   	pop    %ebp
c010603d:	c3                   	ret    

c010603e <add_map_entry>:
c010603e:	55                   	push   %ebp
c010603f:	89 e5                	mov    %esp,%ebp
c0106041:	83 ec 18             	sub    $0x18,%esp
c0106044:	ff 75 08             	pushl  0x8(%ebp)
c0106047:	e8 b8 ff ff ff       	call   c0106004 <ptr_pde>
c010604c:	83 c4 04             	add    $0x4,%esp
c010604f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106052:	ff 75 08             	pushl  0x8(%ebp)
c0106055:	e8 bd ff ff ff       	call   c0106017 <ptr_pte>
c010605a:	83 c4 04             	add    $0x4,%esp
c010605d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106060:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106063:	8b 00                	mov    (%eax),%eax
c0106065:	83 e0 01             	and    $0x1,%eax
c0106068:	85 c0                	test   %eax,%eax
c010606a:	74 1b                	je     c0106087 <add_map_entry+0x49>
c010606c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010606f:	8b 00                	mov    (%eax),%eax
c0106071:	83 e0 01             	and    $0x1,%eax
c0106074:	85 c0                	test   %eax,%eax
c0106076:	75 54                	jne    c01060cc <add_map_entry+0x8e>
c0106078:	8b 45 0c             	mov    0xc(%ebp),%eax
c010607b:	83 c8 07             	or     $0x7,%eax
c010607e:	89 c2                	mov    %eax,%edx
c0106080:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106083:	89 10                	mov    %edx,(%eax)
c0106085:	eb 45                	jmp    c01060cc <add_map_entry+0x8e>
c0106087:	83 ec 0c             	sub    $0xc,%esp
c010608a:	6a 00                	push   $0x0
c010608c:	e8 95 fd ff ff       	call   c0105e26 <get_a_page>
c0106091:	83 c4 10             	add    $0x10,%esp
c0106094:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106097:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010609a:	83 c8 07             	or     $0x7,%eax
c010609d:	89 c2                	mov    %eax,%edx
c010609f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01060a2:	89 10                	mov    %edx,(%eax)
c01060a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060a7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060ac:	83 ec 04             	sub    $0x4,%esp
c01060af:	68 00 10 00 00       	push   $0x1000
c01060b4:	6a 00                	push   $0x0
c01060b6:	50                   	push   %eax
c01060b7:	e8 b3 61 00 00       	call   c010c26f <Memset>
c01060bc:	83 c4 10             	add    $0x10,%esp
c01060bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01060c2:	83 c8 07             	or     $0x7,%eax
c01060c5:	89 c2                	mov    %eax,%edx
c01060c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060ca:	89 10                	mov    %edx,(%eax)
c01060cc:	90                   	nop
c01060cd:	c9                   	leave  
c01060ce:	c3                   	ret    

c01060cf <alloc_virtual_memory>:
c01060cf:	55                   	push   %ebp
c01060d0:	89 e5                	mov    %esp,%ebp
c01060d2:	83 ec 28             	sub    $0x28,%esp
c01060d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01060d8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01060e3:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01060e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01060e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01060ec:	01 45 e4             	add    %eax,-0x1c(%ebp)
c01060ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01060f2:	05 ff 0f 00 00       	add    $0xfff,%eax
c01060f7:	c1 e8 0c             	shr    $0xc,%eax
c01060fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01060fd:	e8 3a a3 ff ff       	call   c010043c <get_running_thread_pcb>
c0106102:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106105:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106108:	8b 50 08             	mov    0x8(%eax),%edx
c010610b:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106110:	39 c2                	cmp    %eax,%edx
c0106112:	75 09                	jne    c010611d <alloc_virtual_memory+0x4e>
c0106114:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010611b:	eb 07                	jmp    c0106124 <alloc_virtual_memory+0x55>
c010611d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106124:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010612b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106132:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0106139:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106140:	eb 47                	jmp    c0106189 <alloc_virtual_memory+0xba>
c0106142:	83 ec 08             	sub    $0x8,%esp
c0106145:	ff 75 f0             	pushl  -0x10(%ebp)
c0106148:	6a 01                	push   $0x1
c010614a:	e8 25 fe ff ff       	call   c0105f74 <get_virtual_address>
c010614f:	83 c4 10             	add    $0x10,%esp
c0106152:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106155:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0106159:	74 13                	je     c010616e <alloc_virtual_memory+0x9f>
c010615b:	83 ec 0c             	sub    $0xc,%esp
c010615e:	ff 75 f0             	pushl  -0x10(%ebp)
c0106161:	e8 c0 fc ff ff       	call   c0105e26 <get_a_page>
c0106166:	83 c4 10             	add    $0x10,%esp
c0106169:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010616c:	eb 06                	jmp    c0106174 <alloc_virtual_memory+0xa5>
c010616e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106171:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106174:	83 ec 08             	sub    $0x8,%esp
c0106177:	ff 75 f4             	pushl  -0xc(%ebp)
c010617a:	ff 75 d8             	pushl  -0x28(%ebp)
c010617d:	e8 bc fe ff ff       	call   c010603e <add_map_entry>
c0106182:	83 c4 10             	add    $0x10,%esp
c0106185:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106189:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010618c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c010618f:	72 b1                	jb     c0106142 <alloc_virtual_memory+0x73>
c0106191:	8b 45 08             	mov    0x8(%ebp),%eax
c0106194:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106199:	89 c2                	mov    %eax,%edx
c010619b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010619e:	01 d0                	add    %edx,%eax
c01061a0:	c9                   	leave  
c01061a1:	c3                   	ret    

c01061a2 <get_physical_address_proc>:
c01061a2:	55                   	push   %ebp
c01061a3:	89 e5                	mov    %esp,%ebp
c01061a5:	83 ec 18             	sub    $0x18,%esp
c01061a8:	e8 b3 a1 ff ff       	call   c0100360 <disable_int>
c01061ad:	e8 8a a2 ff ff       	call   c010043c <get_running_thread_pcb>
c01061b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061b5:	83 ec 0c             	sub    $0xc,%esp
c01061b8:	ff 75 0c             	pushl  0xc(%ebp)
c01061bb:	e8 c6 d8 ff ff       	call   c0103a86 <pid2proc>
c01061c0:	83 c4 10             	add    $0x10,%esp
c01061c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01061c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01061c9:	8b 40 08             	mov    0x8(%eax),%eax
c01061cc:	83 ec 0c             	sub    $0xc,%esp
c01061cf:	50                   	push   %eax
c01061d0:	e8 4b a2 ff ff       	call   c0100420 <update_cr3>
c01061d5:	83 c4 10             	add    $0x10,%esp
c01061d8:	83 ec 0c             	sub    $0xc,%esp
c01061db:	ff 75 08             	pushl  0x8(%ebp)
c01061de:	e8 34 fe ff ff       	call   c0106017 <ptr_pte>
c01061e3:	83 c4 10             	add    $0x10,%esp
c01061e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01061e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061ec:	8b 00                	mov    (%eax),%eax
c01061ee:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01061f3:	89 c2                	mov    %eax,%edx
c01061f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01061f8:	25 ff 0f 00 00       	and    $0xfff,%eax
c01061fd:	09 d0                	or     %edx,%eax
c01061ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106202:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106205:	8b 40 08             	mov    0x8(%eax),%eax
c0106208:	83 ec 0c             	sub    $0xc,%esp
c010620b:	50                   	push   %eax
c010620c:	e8 0f a2 ff ff       	call   c0100420 <update_cr3>
c0106211:	83 c4 10             	add    $0x10,%esp
c0106214:	e8 49 a1 ff ff       	call   c0100362 <enable_int>
c0106219:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010621c:	c9                   	leave  
c010621d:	c3                   	ret    

c010621e <get_physical_address>:
c010621e:	55                   	push   %ebp
c010621f:	89 e5                	mov    %esp,%ebp
c0106221:	83 ec 10             	sub    $0x10,%esp
c0106224:	ff 75 08             	pushl  0x8(%ebp)
c0106227:	e8 eb fd ff ff       	call   c0106017 <ptr_pte>
c010622c:	83 c4 04             	add    $0x4,%esp
c010622f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106232:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106235:	8b 00                	mov    (%eax),%eax
c0106237:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010623c:	89 c2                	mov    %eax,%edx
c010623e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106241:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106246:	09 d0                	or     %edx,%eax
c0106248:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010624b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010624e:	c9                   	leave  
c010624f:	c3                   	ret    

c0106250 <alloc_physical_memory_of_proc>:
c0106250:	55                   	push   %ebp
c0106251:	89 e5                	mov    %esp,%ebp
c0106253:	83 ec 48             	sub    $0x48,%esp
c0106256:	e8 05 a1 ff ff       	call   c0100360 <disable_int>
c010625b:	8b 45 08             	mov    0x8(%ebp),%eax
c010625e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106263:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106266:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010626d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106270:	83 ec 0c             	sub    $0xc,%esp
c0106273:	50                   	push   %eax
c0106274:	e8 0d d8 ff ff       	call   c0103a86 <pid2proc>
c0106279:	83 c4 10             	add    $0x10,%esp
c010627c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010627f:	e8 b8 a1 ff ff       	call   c010043c <get_running_thread_pcb>
c0106284:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106287:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010628a:	8b 40 0c             	mov    0xc(%eax),%eax
c010628d:	83 ec 04             	sub    $0x4,%esp
c0106290:	6a 0c                	push   $0xc
c0106292:	50                   	push   %eax
c0106293:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106296:	50                   	push   %eax
c0106297:	e8 a0 0c 00 00       	call   c0106f3c <Memcpy>
c010629c:	83 c4 10             	add    $0x10,%esp
c010629f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01062a2:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01062a5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01062a8:	89 55 c8             	mov    %edx,-0x38(%ebp)
c01062ab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01062ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01062b1:	29 c2                	sub    %eax,%edx
c01062b3:	89 d0                	mov    %edx,%eax
c01062b5:	c1 e8 0c             	shr    $0xc,%eax
c01062b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01062bb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01062be:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01062c1:	c1 e2 0c             	shl    $0xc,%edx
c01062c4:	01 d0                	add    %edx,%eax
c01062c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01062c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01062cc:	6a 01                	push   $0x1
c01062ce:	6a 01                	push   $0x1
c01062d0:	50                   	push   %eax
c01062d1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01062d4:	50                   	push   %eax
c01062d5:	e8 06 fa ff ff       	call   c0105ce0 <set_bits>
c01062da:	83 c4 10             	add    $0x10,%esp
c01062dd:	83 ec 0c             	sub    $0xc,%esp
c01062e0:	ff 75 f0             	pushl  -0x10(%ebp)
c01062e3:	e8 3e fb ff ff       	call   c0105e26 <get_a_page>
c01062e8:	83 c4 10             	add    $0x10,%esp
c01062eb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01062ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01062f1:	25 ff 0f 00 00       	and    $0xfff,%eax
c01062f6:	89 c2                	mov    %eax,%edx
c01062f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062fb:	01 d0                	add    %edx,%eax
c01062fd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106300:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106303:	8b 40 08             	mov    0x8(%eax),%eax
c0106306:	83 ec 0c             	sub    $0xc,%esp
c0106309:	50                   	push   %eax
c010630a:	e8 11 a1 ff ff       	call   c0100420 <update_cr3>
c010630f:	83 c4 10             	add    $0x10,%esp
c0106312:	83 ec 08             	sub    $0x8,%esp
c0106315:	ff 75 dc             	pushl  -0x24(%ebp)
c0106318:	ff 75 f4             	pushl  -0xc(%ebp)
c010631b:	e8 1e fd ff ff       	call   c010603e <add_map_entry>
c0106320:	83 c4 10             	add    $0x10,%esp
c0106323:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106326:	8b 40 08             	mov    0x8(%eax),%eax
c0106329:	83 ec 0c             	sub    $0xc,%esp
c010632c:	50                   	push   %eax
c010632d:	e8 ee a0 ff ff       	call   c0100420 <update_cr3>
c0106332:	83 c4 10             	add    $0x10,%esp
c0106335:	e8 28 a0 ff ff       	call   c0100362 <enable_int>
c010633a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010633d:	c9                   	leave  
c010633e:	c3                   	ret    

c010633f <alloc_physical_memory>:
c010633f:	55                   	push   %ebp
c0106340:	89 e5                	mov    %esp,%ebp
c0106342:	83 ec 38             	sub    $0x38,%esp
c0106345:	8b 45 08             	mov    0x8(%ebp),%eax
c0106348:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010634d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106350:	e8 e7 a0 ff ff       	call   c010043c <get_running_thread_pcb>
c0106355:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106358:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010635c:	75 1a                	jne    c0106378 <alloc_physical_memory+0x39>
c010635e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106363:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106366:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010636b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010636e:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106373:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106376:	eb 18                	jmp    c0106390 <alloc_physical_memory+0x51>
c0106378:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010637b:	8b 40 0c             	mov    0xc(%eax),%eax
c010637e:	83 ec 04             	sub    $0x4,%esp
c0106381:	6a 0c                	push   $0xc
c0106383:	50                   	push   %eax
c0106384:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0106387:	50                   	push   %eax
c0106388:	e8 af 0b 00 00       	call   c0106f3c <Memcpy>
c010638d:	83 c4 10             	add    $0x10,%esp
c0106390:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106393:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106396:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106399:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010639c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010639f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01063a2:	29 c2                	sub    %eax,%edx
c01063a4:	89 d0                	mov    %edx,%eax
c01063a6:	c1 e8 0c             	shr    $0xc,%eax
c01063a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01063ac:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01063af:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01063b2:	c1 e2 0c             	shl    $0xc,%edx
c01063b5:	01 d0                	add    %edx,%eax
c01063b7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01063ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063bd:	6a 01                	push   $0x1
c01063bf:	6a 01                	push   $0x1
c01063c1:	50                   	push   %eax
c01063c2:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01063c5:	50                   	push   %eax
c01063c6:	e8 15 f9 ff ff       	call   c0105ce0 <set_bits>
c01063cb:	83 c4 10             	add    $0x10,%esp
c01063ce:	83 ec 0c             	sub    $0xc,%esp
c01063d1:	ff 75 0c             	pushl  0xc(%ebp)
c01063d4:	e8 4d fa ff ff       	call   c0105e26 <get_a_page>
c01063d9:	83 c4 10             	add    $0x10,%esp
c01063dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01063df:	8b 45 08             	mov    0x8(%ebp),%eax
c01063e2:	25 ff 0f 00 00       	and    $0xfff,%eax
c01063e7:	89 c2                	mov    %eax,%edx
c01063e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01063ec:	01 d0                	add    %edx,%eax
c01063ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01063f1:	83 ec 08             	sub    $0x8,%esp
c01063f4:	ff 75 e4             	pushl  -0x1c(%ebp)
c01063f7:	ff 75 f4             	pushl  -0xc(%ebp)
c01063fa:	e8 3f fc ff ff       	call   c010603e <add_map_entry>
c01063ff:	83 c4 10             	add    $0x10,%esp
c0106402:	8b 45 08             	mov    0x8(%ebp),%eax
c0106405:	c9                   	leave  
c0106406:	c3                   	ret    

c0106407 <alloc_memory>:
c0106407:	55                   	push   %ebp
c0106408:	89 e5                	mov    %esp,%ebp
c010640a:	83 ec 18             	sub    $0x18,%esp
c010640d:	83 ec 08             	sub    $0x8,%esp
c0106410:	ff 75 0c             	pushl  0xc(%ebp)
c0106413:	ff 75 08             	pushl  0x8(%ebp)
c0106416:	e8 59 fb ff ff       	call   c0105f74 <get_virtual_address>
c010641b:	83 c4 10             	add    $0x10,%esp
c010641e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106421:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106424:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106429:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010642c:	eb 29                	jmp    c0106457 <alloc_memory+0x50>
c010642e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106435:	83 ec 0c             	sub    $0xc,%esp
c0106438:	ff 75 0c             	pushl  0xc(%ebp)
c010643b:	e8 e6 f9 ff ff       	call   c0105e26 <get_a_page>
c0106440:	83 c4 10             	add    $0x10,%esp
c0106443:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106446:	83 ec 08             	sub    $0x8,%esp
c0106449:	ff 75 ec             	pushl  -0x14(%ebp)
c010644c:	ff 75 f4             	pushl  -0xc(%ebp)
c010644f:	e8 ea fb ff ff       	call   c010603e <add_map_entry>
c0106454:	83 c4 10             	add    $0x10,%esp
c0106457:	8b 45 08             	mov    0x8(%ebp),%eax
c010645a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010645d:	89 55 08             	mov    %edx,0x8(%ebp)
c0106460:	85 c0                	test   %eax,%eax
c0106462:	75 ca                	jne    c010642e <alloc_memory+0x27>
c0106464:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106467:	c9                   	leave  
c0106468:	c3                   	ret    

c0106469 <get_a_virtual_page>:
c0106469:	55                   	push   %ebp
c010646a:	89 e5                	mov    %esp,%ebp
c010646c:	83 ec 18             	sub    $0x18,%esp
c010646f:	83 ec 0c             	sub    $0xc,%esp
c0106472:	ff 75 08             	pushl  0x8(%ebp)
c0106475:	e8 ac f9 ff ff       	call   c0105e26 <get_a_page>
c010647a:	83 c4 10             	add    $0x10,%esp
c010647d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106480:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106483:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106488:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010648b:	83 ec 08             	sub    $0x8,%esp
c010648e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106491:	ff 75 f0             	pushl  -0x10(%ebp)
c0106494:	e8 a5 fb ff ff       	call   c010603e <add_map_entry>
c0106499:	83 c4 10             	add    $0x10,%esp
c010649c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010649f:	c9                   	leave  
c01064a0:	c3                   	ret    

c01064a1 <block2arena>:
c01064a1:	55                   	push   %ebp
c01064a2:	89 e5                	mov    %esp,%ebp
c01064a4:	83 ec 10             	sub    $0x10,%esp
c01064a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01064aa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01064af:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01064b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01064b5:	c9                   	leave  
c01064b6:	c3                   	ret    

c01064b7 <sys_malloc2>:
c01064b7:	55                   	push   %ebp
c01064b8:	89 e5                	mov    %esp,%ebp
c01064ba:	83 ec 68             	sub    $0x68,%esp
c01064bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01064c4:	e8 73 9f ff ff       	call   c010043c <get_running_thread_pcb>
c01064c9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01064cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01064cf:	8b 50 08             	mov    0x8(%eax),%edx
c01064d2:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01064d7:	39 c2                	cmp    %eax,%edx
c01064d9:	75 10                	jne    c01064eb <sys_malloc2+0x34>
c01064db:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01064e2:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c01064e9:	eb 10                	jmp    c01064fb <sys_malloc2+0x44>
c01064eb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01064f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01064f5:	83 c0 10             	add    $0x10,%eax
c01064f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01064fb:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0106502:	76 52                	jbe    c0106556 <sys_malloc2+0x9f>
c0106504:	8b 45 08             	mov    0x8(%ebp),%eax
c0106507:	05 0b 10 00 00       	add    $0x100b,%eax
c010650c:	c1 e8 0c             	shr    $0xc,%eax
c010650f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106512:	83 ec 08             	sub    $0x8,%esp
c0106515:	ff 75 f0             	pushl  -0x10(%ebp)
c0106518:	ff 75 d8             	pushl  -0x28(%ebp)
c010651b:	e8 e7 fe ff ff       	call   c0106407 <alloc_memory>
c0106520:	83 c4 10             	add    $0x10,%esp
c0106523:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106526:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106529:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010652c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010652f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106535:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106538:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010653f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106542:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106546:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106549:	05 90 00 00 00       	add    $0x90,%eax
c010654e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106551:	e9 f0 01 00 00       	jmp    c0106746 <sys_malloc2+0x28f>
c0106556:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010655d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106564:	eb 26                	jmp    c010658c <sys_malloc2+0xd5>
c0106566:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106569:	89 d0                	mov    %edx,%eax
c010656b:	01 c0                	add    %eax,%eax
c010656d:	01 d0                	add    %edx,%eax
c010656f:	c1 e0 03             	shl    $0x3,%eax
c0106572:	89 c2                	mov    %eax,%edx
c0106574:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106577:	01 d0                	add    %edx,%eax
c0106579:	8b 00                	mov    (%eax),%eax
c010657b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010657e:	77 08                	ja     c0106588 <sys_malloc2+0xd1>
c0106580:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106583:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106586:	eb 0a                	jmp    c0106592 <sys_malloc2+0xdb>
c0106588:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010658c:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0106590:	7e d4                	jle    c0106566 <sys_malloc2+0xaf>
c0106592:	83 ec 08             	sub    $0x8,%esp
c0106595:	ff 75 f0             	pushl  -0x10(%ebp)
c0106598:	6a 01                	push   $0x1
c010659a:	e8 68 fe ff ff       	call   c0106407 <alloc_memory>
c010659f:	83 c4 10             	add    $0x10,%esp
c01065a2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01065a5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01065a8:	89 d0                	mov    %edx,%eax
c01065aa:	01 c0                	add    %eax,%eax
c01065ac:	01 d0                	add    %edx,%eax
c01065ae:	c1 e0 03             	shl    $0x3,%eax
c01065b1:	89 c2                	mov    %eax,%edx
c01065b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01065b6:	01 d0                	add    %edx,%eax
c01065b8:	83 ec 04             	sub    $0x4,%esp
c01065bb:	6a 18                	push   $0x18
c01065bd:	50                   	push   %eax
c01065be:	ff 75 cc             	pushl  -0x34(%ebp)
c01065c1:	e8 76 09 00 00       	call   c0106f3c <Memcpy>
c01065c6:	83 c4 10             	add    $0x10,%esp
c01065c9:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01065d0:	e8 03 09 00 00       	call   c0106ed8 <intr_disable>
c01065d5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01065d8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01065db:	89 d0                	mov    %edx,%eax
c01065dd:	01 c0                	add    %eax,%eax
c01065df:	01 d0                	add    %edx,%eax
c01065e1:	c1 e0 03             	shl    $0x3,%eax
c01065e4:	89 c2                	mov    %eax,%edx
c01065e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01065e9:	01 d0                	add    %edx,%eax
c01065eb:	83 c0 08             	add    $0x8,%eax
c01065ee:	83 ec 0c             	sub    $0xc,%esp
c01065f1:	50                   	push   %eax
c01065f2:	e8 1c 3d 00 00       	call   c010a313 <isListEmpty>
c01065f7:	83 c4 10             	add    $0x10,%esp
c01065fa:	3c 01                	cmp    $0x1,%al
c01065fc:	0f 85 c1 00 00 00    	jne    c01066c3 <sys_malloc2+0x20c>
c0106602:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106609:	83 ec 08             	sub    $0x8,%esp
c010660c:	ff 75 f0             	pushl  -0x10(%ebp)
c010660f:	6a 01                	push   $0x1
c0106611:	e8 f1 fd ff ff       	call   c0106407 <alloc_memory>
c0106616:	83 c4 10             	add    $0x10,%esp
c0106619:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010661c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010661f:	83 ec 0c             	sub    $0xc,%esp
c0106622:	50                   	push   %eax
c0106623:	e8 79 fe ff ff       	call   c01064a1 <block2arena>
c0106628:	83 c4 10             	add    $0x10,%esp
c010662b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010662e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106631:	89 d0                	mov    %edx,%eax
c0106633:	01 c0                	add    %eax,%eax
c0106635:	01 d0                	add    %edx,%eax
c0106637:	c1 e0 03             	shl    $0x3,%eax
c010663a:	89 c2                	mov    %eax,%edx
c010663c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010663f:	01 d0                	add    %edx,%eax
c0106641:	8b 50 04             	mov    0x4(%eax),%edx
c0106644:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106647:	89 50 04             	mov    %edx,0x4(%eax)
c010664a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010664d:	8b 00                	mov    (%eax),%eax
c010664f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106652:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106659:	b8 00 10 00 00       	mov    $0x1000,%eax
c010665e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0106661:	ba 00 00 00 00       	mov    $0x0,%edx
c0106666:	f7 75 b8             	divl   -0x48(%ebp)
c0106669:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010666c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010666f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0106672:	01 d0                	add    %edx,%eax
c0106674:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106677:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010667e:	eb 3b                	jmp    c01066bb <sys_malloc2+0x204>
c0106680:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106683:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0106687:	89 c2                	mov    %eax,%edx
c0106689:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010668c:	01 d0                	add    %edx,%eax
c010668e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106691:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106694:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106697:	89 d0                	mov    %edx,%eax
c0106699:	01 c0                	add    %eax,%eax
c010669b:	01 d0                	add    %edx,%eax
c010669d:	c1 e0 03             	shl    $0x3,%eax
c01066a0:	89 c2                	mov    %eax,%edx
c01066a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01066a5:	01 d0                	add    %edx,%eax
c01066a7:	83 c0 08             	add    $0x8,%eax
c01066aa:	83 ec 08             	sub    $0x8,%esp
c01066ad:	51                   	push   %ecx
c01066ae:	50                   	push   %eax
c01066af:	e8 5c 3d 00 00       	call   c010a410 <appendToDoubleLinkList>
c01066b4:	83 c4 10             	add    $0x10,%esp
c01066b7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01066bb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01066be:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01066c1:	77 bd                	ja     c0106680 <sys_malloc2+0x1c9>
c01066c3:	83 ec 0c             	sub    $0xc,%esp
c01066c6:	ff 75 c4             	pushl  -0x3c(%ebp)
c01066c9:	e8 33 08 00 00       	call   c0106f01 <intr_set_status>
c01066ce:	83 c4 10             	add    $0x10,%esp
c01066d1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01066d4:	89 d0                	mov    %edx,%eax
c01066d6:	01 c0                	add    %eax,%eax
c01066d8:	01 d0                	add    %edx,%eax
c01066da:	c1 e0 03             	shl    $0x3,%eax
c01066dd:	89 c2                	mov    %eax,%edx
c01066df:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01066e2:	01 d0                	add    %edx,%eax
c01066e4:	83 c0 08             	add    $0x8,%eax
c01066e7:	83 ec 0c             	sub    $0xc,%esp
c01066ea:	50                   	push   %eax
c01066eb:	e8 8a 3e 00 00       	call   c010a57a <popFromDoubleLinkList>
c01066f0:	83 c4 10             	add    $0x10,%esp
c01066f3:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01066f6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01066f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01066fc:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0106700:	75 1c                	jne    c010671e <sys_malloc2+0x267>
c0106702:	68 ef 01 00 00       	push   $0x1ef
c0106707:	68 56 b6 10 c0       	push   $0xc010b656
c010670c:	68 56 b6 10 c0       	push   $0xc010b656
c0106711:	68 77 b6 10 c0       	push   $0xc010b677
c0106716:	e8 3a 24 00 00       	call   c0108b55 <assertion_failure>
c010671b:	83 c4 10             	add    $0x10,%esp
c010671e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106721:	83 ec 0c             	sub    $0xc,%esp
c0106724:	50                   	push   %eax
c0106725:	e8 77 fd ff ff       	call   c01064a1 <block2arena>
c010672a:	83 c4 10             	add    $0x10,%esp
c010672d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106730:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106733:	8b 40 04             	mov    0x4(%eax),%eax
c0106736:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106739:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010673c:	89 50 04             	mov    %edx,0x4(%eax)
c010673f:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106746:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010674a:	75 1c                	jne    c0106768 <sys_malloc2+0x2b1>
c010674c:	68 f6 01 00 00       	push   $0x1f6
c0106751:	68 56 b6 10 c0       	push   $0xc010b656
c0106756:	68 56 b6 10 c0       	push   $0xc010b656
c010675b:	68 89 b6 10 c0       	push   $0xc010b689
c0106760:	e8 f0 23 00 00       	call   c0108b55 <assertion_failure>
c0106765:	83 c4 10             	add    $0x10,%esp
c0106768:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010676b:	c9                   	leave  
c010676c:	c3                   	ret    

c010676d <remove_map_entry>:
c010676d:	55                   	push   %ebp
c010676e:	89 e5                	mov    %esp,%ebp
c0106770:	83 ec 10             	sub    $0x10,%esp
c0106773:	ff 75 08             	pushl  0x8(%ebp)
c0106776:	e8 9c f8 ff ff       	call   c0106017 <ptr_pte>
c010677b:	83 c4 04             	add    $0x4,%esp
c010677e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106781:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106784:	8b 10                	mov    (%eax),%edx
c0106786:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106789:	89 10                	mov    %edx,(%eax)
c010678b:	90                   	nop
c010678c:	c9                   	leave  
c010678d:	c3                   	ret    

c010678e <free_a_page>:
c010678e:	55                   	push   %ebp
c010678f:	89 e5                	mov    %esp,%ebp
c0106791:	83 ec 20             	sub    $0x20,%esp
c0106794:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106798:	75 21                	jne    c01067bb <free_a_page+0x2d>
c010679a:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010679f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01067a2:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01067a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01067aa:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01067af:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067b2:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c01067b9:	eb 1f                	jmp    c01067da <free_a_page+0x4c>
c01067bb:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01067c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01067c3:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01067c8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01067cb:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01067d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067d3:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c01067da:	8b 45 08             	mov    0x8(%ebp),%eax
c01067dd:	c1 e8 0c             	shr    $0xc,%eax
c01067e0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01067e3:	6a 00                	push   $0x0
c01067e5:	ff 75 f8             	pushl  -0x8(%ebp)
c01067e8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01067eb:	50                   	push   %eax
c01067ec:	e8 74 f4 ff ff       	call   c0105c65 <set_bit_val>
c01067f1:	83 c4 0c             	add    $0xc,%esp
c01067f4:	ff 75 08             	pushl  0x8(%ebp)
c01067f7:	e8 22 fa ff ff       	call   c010621e <get_physical_address>
c01067fc:	83 c4 04             	add    $0x4,%esp
c01067ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106802:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106805:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010680b:	85 c0                	test   %eax,%eax
c010680d:	0f 48 c2             	cmovs  %edx,%eax
c0106810:	c1 f8 0c             	sar    $0xc,%eax
c0106813:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106816:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106819:	6a 00                	push   $0x0
c010681b:	ff 75 f0             	pushl  -0x10(%ebp)
c010681e:	50                   	push   %eax
c010681f:	e8 41 f4 ff ff       	call   c0105c65 <set_bit_val>
c0106824:	83 c4 0c             	add    $0xc,%esp
c0106827:	ff 75 08             	pushl  0x8(%ebp)
c010682a:	e8 3e ff ff ff       	call   c010676d <remove_map_entry>
c010682f:	83 c4 04             	add    $0x4,%esp
c0106832:	90                   	nop
c0106833:	c9                   	leave  
c0106834:	c3                   	ret    

c0106835 <sys_free2>:
c0106835:	55                   	push   %ebp
c0106836:	89 e5                	mov    %esp,%ebp
c0106838:	83 ec 58             	sub    $0x58,%esp
c010683b:	e8 fc 9b ff ff       	call   c010043c <get_running_thread_pcb>
c0106840:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106843:	e8 90 06 00 00       	call   c0106ed8 <intr_disable>
c0106848:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010684b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010684e:	8b 50 08             	mov    0x8(%eax),%edx
c0106851:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106856:	39 c2                	cmp    %eax,%edx
c0106858:	75 10                	jne    c010686a <sys_free2+0x35>
c010685a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106861:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c0106868:	eb 10                	jmp    c010687a <sys_free2+0x45>
c010686a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106871:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106874:	83 c0 10             	add    $0x10,%eax
c0106877:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010687a:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0106881:	76 4d                	jbe    c01068d0 <sys_free2+0x9b>
c0106883:	8b 45 08             	mov    0x8(%ebp),%eax
c0106886:	83 e8 0c             	sub    $0xc,%eax
c0106889:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010688c:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0106890:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106893:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106898:	c1 e8 0c             	shr    $0xc,%eax
c010689b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010689e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01068a5:	eb 1c                	jmp    c01068c3 <sys_free2+0x8e>
c01068a7:	83 ec 08             	sub    $0x8,%esp
c01068aa:	ff 75 f4             	pushl  -0xc(%ebp)
c01068ad:	ff 75 ec             	pushl  -0x14(%ebp)
c01068b0:	e8 d9 fe ff ff       	call   c010678e <free_a_page>
c01068b5:	83 c4 10             	add    $0x10,%esp
c01068b8:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c01068bf:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01068c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01068c6:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c01068c9:	77 dc                	ja     c01068a7 <sys_free2+0x72>
c01068cb:	e9 dc 00 00 00       	jmp    c01069ac <sys_free2+0x177>
c01068d0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01068d7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01068de:	eb 26                	jmp    c0106906 <sys_free2+0xd1>
c01068e0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01068e3:	89 d0                	mov    %edx,%eax
c01068e5:	01 c0                	add    %eax,%eax
c01068e7:	01 d0                	add    %edx,%eax
c01068e9:	c1 e0 03             	shl    $0x3,%eax
c01068ec:	89 c2                	mov    %eax,%edx
c01068ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01068f1:	01 d0                	add    %edx,%eax
c01068f3:	8b 00                	mov    (%eax),%eax
c01068f5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01068f8:	77 08                	ja     c0106902 <sys_free2+0xcd>
c01068fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01068fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106900:	eb 0a                	jmp    c010690c <sys_free2+0xd7>
c0106902:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106906:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c010690a:	7e d4                	jle    c01068e0 <sys_free2+0xab>
c010690c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010690f:	89 d0                	mov    %edx,%eax
c0106911:	01 c0                	add    %eax,%eax
c0106913:	01 d0                	add    %edx,%eax
c0106915:	c1 e0 03             	shl    $0x3,%eax
c0106918:	89 c2                	mov    %eax,%edx
c010691a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010691d:	01 d0                	add    %edx,%eax
c010691f:	8b 10                	mov    (%eax),%edx
c0106921:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106924:	8b 50 04             	mov    0x4(%eax),%edx
c0106927:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010692a:	8b 50 08             	mov    0x8(%eax),%edx
c010692d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106930:	8b 50 0c             	mov    0xc(%eax),%edx
c0106933:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106936:	8b 50 10             	mov    0x10(%eax),%edx
c0106939:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010693c:	8b 40 14             	mov    0x14(%eax),%eax
c010693f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106942:	8b 45 08             	mov    0x8(%ebp),%eax
c0106945:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106948:	83 ec 0c             	sub    $0xc,%esp
c010694b:	ff 75 d0             	pushl  -0x30(%ebp)
c010694e:	e8 4e fb ff ff       	call   c01064a1 <block2arena>
c0106953:	83 c4 10             	add    $0x10,%esp
c0106956:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106959:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010695c:	89 d0                	mov    %edx,%eax
c010695e:	01 c0                	add    %eax,%eax
c0106960:	01 d0                	add    %edx,%eax
c0106962:	c1 e0 03             	shl    $0x3,%eax
c0106965:	89 c2                	mov    %eax,%edx
c0106967:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010696a:	01 d0                	add    %edx,%eax
c010696c:	83 c0 08             	add    $0x8,%eax
c010696f:	83 ec 08             	sub    $0x8,%esp
c0106972:	ff 75 d0             	pushl  -0x30(%ebp)
c0106975:	50                   	push   %eax
c0106976:	e8 95 3a 00 00       	call   c010a410 <appendToDoubleLinkList>
c010697b:	83 c4 10             	add    $0x10,%esp
c010697e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106981:	8b 40 04             	mov    0x4(%eax),%eax
c0106984:	8d 50 01             	lea    0x1(%eax),%edx
c0106987:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010698a:	89 50 04             	mov    %edx,0x4(%eax)
c010698d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106990:	8b 50 04             	mov    0x4(%eax),%edx
c0106993:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106996:	39 c2                	cmp    %eax,%edx
c0106998:	75 12                	jne    c01069ac <sys_free2+0x177>
c010699a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010699d:	83 ec 08             	sub    $0x8,%esp
c01069a0:	ff 75 f4             	pushl  -0xc(%ebp)
c01069a3:	50                   	push   %eax
c01069a4:	e8 e5 fd ff ff       	call   c010678e <free_a_page>
c01069a9:	83 c4 10             	add    $0x10,%esp
c01069ac:	83 ec 0c             	sub    $0xc,%esp
c01069af:	ff 75 d8             	pushl  -0x28(%ebp)
c01069b2:	e8 4a 05 00 00       	call   c0106f01 <intr_set_status>
c01069b7:	83 c4 10             	add    $0x10,%esp
c01069ba:	90                   	nop
c01069bb:	c9                   	leave  
c01069bc:	c3                   	ret    

c01069bd <init_memory_block_desc>:
c01069bd:	55                   	push   %ebp
c01069be:	89 e5                	mov    %esp,%ebp
c01069c0:	83 ec 18             	sub    $0x18,%esp
c01069c3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01069ca:	e9 b2 00 00 00       	jmp    c0106a81 <init_memory_block_desc+0xc4>
c01069cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01069d3:	75 1b                	jne    c01069f0 <init_memory_block_desc+0x33>
c01069d5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01069d8:	89 d0                	mov    %edx,%eax
c01069da:	01 c0                	add    %eax,%eax
c01069dc:	01 d0                	add    %edx,%eax
c01069de:	c1 e0 03             	shl    $0x3,%eax
c01069e1:	89 c2                	mov    %eax,%edx
c01069e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01069e6:	01 d0                	add    %edx,%eax
c01069e8:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c01069ee:	eb 2e                	jmp    c0106a1e <init_memory_block_desc+0x61>
c01069f0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01069f3:	89 d0                	mov    %edx,%eax
c01069f5:	01 c0                	add    %eax,%eax
c01069f7:	01 d0                	add    %edx,%eax
c01069f9:	c1 e0 03             	shl    $0x3,%eax
c01069fc:	8d 50 e8             	lea    -0x18(%eax),%edx
c01069ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a02:	01 d0                	add    %edx,%eax
c0106a04:	8b 08                	mov    (%eax),%ecx
c0106a06:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a09:	89 d0                	mov    %edx,%eax
c0106a0b:	01 c0                	add    %eax,%eax
c0106a0d:	01 d0                	add    %edx,%eax
c0106a0f:	c1 e0 03             	shl    $0x3,%eax
c0106a12:	89 c2                	mov    %eax,%edx
c0106a14:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a17:	01 d0                	add    %edx,%eax
c0106a19:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0106a1c:	89 10                	mov    %edx,(%eax)
c0106a1e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a21:	89 d0                	mov    %edx,%eax
c0106a23:	01 c0                	add    %eax,%eax
c0106a25:	01 d0                	add    %edx,%eax
c0106a27:	c1 e0 03             	shl    $0x3,%eax
c0106a2a:	89 c2                	mov    %eax,%edx
c0106a2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a2f:	01 d0                	add    %edx,%eax
c0106a31:	8b 00                	mov    (%eax),%eax
c0106a33:	89 c1                	mov    %eax,%ecx
c0106a35:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0106a3a:	ba 00 00 00 00       	mov    $0x0,%edx
c0106a3f:	f7 f1                	div    %ecx
c0106a41:	89 c1                	mov    %eax,%ecx
c0106a43:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a46:	89 d0                	mov    %edx,%eax
c0106a48:	01 c0                	add    %eax,%eax
c0106a4a:	01 d0                	add    %edx,%eax
c0106a4c:	c1 e0 03             	shl    $0x3,%eax
c0106a4f:	89 c2                	mov    %eax,%edx
c0106a51:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a54:	01 d0                	add    %edx,%eax
c0106a56:	89 ca                	mov    %ecx,%edx
c0106a58:	89 50 04             	mov    %edx,0x4(%eax)
c0106a5b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a5e:	89 d0                	mov    %edx,%eax
c0106a60:	01 c0                	add    %eax,%eax
c0106a62:	01 d0                	add    %edx,%eax
c0106a64:	c1 e0 03             	shl    $0x3,%eax
c0106a67:	89 c2                	mov    %eax,%edx
c0106a69:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a6c:	01 d0                	add    %edx,%eax
c0106a6e:	83 c0 08             	add    $0x8,%eax
c0106a71:	83 ec 0c             	sub    $0xc,%esp
c0106a74:	50                   	push   %eax
c0106a75:	e8 6b 38 00 00       	call   c010a2e5 <initDoubleLinkList>
c0106a7a:	83 c4 10             	add    $0x10,%esp
c0106a7d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0106a81:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0106a85:	0f 8e 44 ff ff ff    	jle    c01069cf <init_memory_block_desc+0x12>
c0106a8b:	90                   	nop
c0106a8c:	c9                   	leave  
c0106a8d:	c3                   	ret    

c0106a8e <init_memory2>:
c0106a8e:	55                   	push   %ebp
c0106a8f:	89 e5                	mov    %esp,%ebp
c0106a91:	83 ec 38             	sub    $0x38,%esp
c0106a94:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0106a9b:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106aa2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106aa5:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106aaa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106aad:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106ab2:	29 c2                	sub    %eax,%edx
c0106ab4:	89 d0                	mov    %edx,%eax
c0106ab6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106ab9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106abc:	89 c2                	mov    %eax,%edx
c0106abe:	c1 ea 1f             	shr    $0x1f,%edx
c0106ac1:	01 d0                	add    %edx,%eax
c0106ac3:	d1 f8                	sar    %eax
c0106ac5:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106aca:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106acf:	83 ec 0c             	sub    $0xc,%esp
c0106ad2:	50                   	push   %eax
c0106ad3:	e8 52 08 00 00       	call   c010732a <disp_int>
c0106ad8:	83 c4 10             	add    $0x10,%esp
c0106adb:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106ae0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106ae3:	29 c2                	sub    %eax,%edx
c0106ae5:	89 d0                	mov    %edx,%eax
c0106ae7:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c0106aec:	83 ec 0c             	sub    $0xc,%esp
c0106aef:	68 95 b6 10 c0       	push   $0xc010b695
c0106af4:	e8 e0 95 ff ff       	call   c01000d9 <disp_str>
c0106af9:	83 c4 10             	add    $0x10,%esp
c0106afc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106b01:	83 ec 0c             	sub    $0xc,%esp
c0106b04:	50                   	push   %eax
c0106b05:	e8 20 08 00 00       	call   c010732a <disp_int>
c0106b0a:	83 c4 10             	add    $0x10,%esp
c0106b0d:	83 ec 0c             	sub    $0xc,%esp
c0106b10:	68 95 b6 10 c0       	push   $0xc010b695
c0106b15:	e8 bf 95 ff ff       	call   c01000d9 <disp_str>
c0106b1a:	83 c4 10             	add    $0x10,%esp
c0106b1d:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106b22:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106b27:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106b2d:	85 c0                	test   %eax,%eax
c0106b2f:	0f 48 c2             	cmovs  %edx,%eax
c0106b32:	c1 f8 0c             	sar    $0xc,%eax
c0106b35:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106b38:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106b3b:	83 c0 07             	add    $0x7,%eax
c0106b3e:	8d 50 07             	lea    0x7(%eax),%edx
c0106b41:	85 c0                	test   %eax,%eax
c0106b43:	0f 48 c2             	cmovs  %edx,%eax
c0106b46:	c1 f8 03             	sar    $0x3,%eax
c0106b49:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106b4e:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106b53:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106b58:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106b5d:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106b63:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106b68:	83 ec 04             	sub    $0x4,%esp
c0106b6b:	52                   	push   %edx
c0106b6c:	6a 00                	push   $0x0
c0106b6e:	50                   	push   %eax
c0106b6f:	e8 fb 56 00 00       	call   c010c26f <Memset>
c0106b74:	83 c4 10             	add    $0x10,%esp
c0106b77:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0106b7c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106b81:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106b87:	85 c0                	test   %eax,%eax
c0106b89:	0f 48 c2             	cmovs  %edx,%eax
c0106b8c:	c1 f8 0c             	sar    $0xc,%eax
c0106b8f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b92:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106b98:	ff 75 e8             	pushl  -0x18(%ebp)
c0106b9b:	6a 01                	push   $0x1
c0106b9d:	6a 00                	push   $0x0
c0106b9f:	68 ac 06 11 c0       	push   $0xc01106ac
c0106ba4:	e8 37 f1 ff ff       	call   c0105ce0 <set_bits>
c0106ba9:	83 c4 10             	add    $0x10,%esp
c0106bac:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106bb1:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106bb6:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106bbc:	85 c0                	test   %eax,%eax
c0106bbe:	0f 48 c2             	cmovs  %edx,%eax
c0106bc1:	c1 f8 0c             	sar    $0xc,%eax
c0106bc4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106bc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106bca:	83 c0 07             	add    $0x7,%eax
c0106bcd:	8d 50 07             	lea    0x7(%eax),%edx
c0106bd0:	85 c0                	test   %eax,%eax
c0106bd2:	0f 48 c2             	cmovs  %edx,%eax
c0106bd5:	c1 f8 03             	sar    $0x3,%eax
c0106bd8:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106bdd:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106be2:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106be8:	01 d0                	add    %edx,%eax
c0106bea:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106bef:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106bf5:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106bfa:	83 ec 04             	sub    $0x4,%esp
c0106bfd:	52                   	push   %edx
c0106bfe:	6a 00                	push   $0x0
c0106c00:	50                   	push   %eax
c0106c01:	e8 69 56 00 00       	call   c010c26f <Memset>
c0106c06:	83 c4 10             	add    $0x10,%esp
c0106c09:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106c0e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106c13:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106c19:	85 c0                	test   %eax,%eax
c0106c1b:	0f 48 c2             	cmovs  %edx,%eax
c0106c1e:	c1 f8 0c             	sar    $0xc,%eax
c0106c21:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106c24:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106c27:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106c2a:	ff 75 e8             	pushl  -0x18(%ebp)
c0106c2d:	6a 01                	push   $0x1
c0106c2f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106c32:	68 ac 06 11 c0       	push   $0xc01106ac
c0106c37:	e8 a4 f0 ff ff       	call   c0105ce0 <set_bits>
c0106c3c:	83 c4 10             	add    $0x10,%esp
c0106c3f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106c46:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106c49:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106c4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106c4f:	83 c0 07             	add    $0x7,%eax
c0106c52:	8d 50 07             	lea    0x7(%eax),%edx
c0106c55:	85 c0                	test   %eax,%eax
c0106c57:	0f 48 c2             	cmovs  %edx,%eax
c0106c5a:	c1 f8 03             	sar    $0x3,%eax
c0106c5d:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106c62:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106c67:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106c6d:	01 c2                	add    %eax,%edx
c0106c6f:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106c74:	01 d0                	add    %edx,%eax
c0106c76:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106c7b:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106c81:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106c86:	83 ec 04             	sub    $0x4,%esp
c0106c89:	52                   	push   %edx
c0106c8a:	6a 00                	push   $0x0
c0106c8c:	50                   	push   %eax
c0106c8d:	e8 dd 55 00 00       	call   c010c26f <Memset>
c0106c92:	83 c4 10             	add    $0x10,%esp
c0106c95:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106c98:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106c9b:	01 d0                	add    %edx,%eax
c0106c9d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106ca0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106ca5:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106caa:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106cb0:	85 c0                	test   %eax,%eax
c0106cb2:	0f 48 c2             	cmovs  %edx,%eax
c0106cb5:	c1 f8 0c             	sar    $0xc,%eax
c0106cb8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106cbb:	ff 75 e8             	pushl  -0x18(%ebp)
c0106cbe:	6a 01                	push   $0x1
c0106cc0:	ff 75 e0             	pushl  -0x20(%ebp)
c0106cc3:	68 ac 06 11 c0       	push   $0xc01106ac
c0106cc8:	e8 13 f0 ff ff       	call   c0105ce0 <set_bits>
c0106ccd:	83 c4 10             	add    $0x10,%esp
c0106cd0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106cd3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106cd6:	01 d0                	add    %edx,%eax
c0106cd8:	c1 e0 0c             	shl    $0xc,%eax
c0106cdb:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106ce0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ce3:	83 c0 02             	add    $0x2,%eax
c0106ce6:	c1 e0 0c             	shl    $0xc,%eax
c0106ce9:	89 c2                	mov    %eax,%edx
c0106ceb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106cee:	01 d0                	add    %edx,%eax
c0106cf0:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106cf5:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106cfc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106cff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106d02:	90                   	nop
c0106d03:	c9                   	leave  
c0106d04:	c3                   	ret    

c0106d05 <init_memory>:
c0106d05:	55                   	push   %ebp
c0106d06:	89 e5                	mov    %esp,%ebp
c0106d08:	83 ec 38             	sub    $0x38,%esp
c0106d0b:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106d12:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106d19:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106d20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106d23:	05 00 00 40 00       	add    $0x400000,%eax
c0106d28:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106d2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106d2e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106d31:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106d37:	85 c0                	test   %eax,%eax
c0106d39:	0f 48 c2             	cmovs  %edx,%eax
c0106d3c:	c1 f8 0c             	sar    $0xc,%eax
c0106d3f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106d42:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106d45:	89 c2                	mov    %eax,%edx
c0106d47:	c1 ea 1f             	shr    $0x1f,%edx
c0106d4a:	01 d0                	add    %edx,%eax
c0106d4c:	d1 f8                	sar    %eax
c0106d4e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106d51:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106d54:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106d57:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106d5a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106d5d:	8d 50 07             	lea    0x7(%eax),%edx
c0106d60:	85 c0                	test   %eax,%eax
c0106d62:	0f 48 c2             	cmovs  %edx,%eax
c0106d65:	c1 f8 03             	sar    $0x3,%eax
c0106d68:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106d6b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106d6e:	8d 50 07             	lea    0x7(%eax),%edx
c0106d71:	85 c0                	test   %eax,%eax
c0106d73:	0f 48 c2             	cmovs  %edx,%eax
c0106d76:	c1 f8 03             	sar    $0x3,%eax
c0106d79:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106d7c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d7f:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106d84:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106d89:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106d8c:	c1 e2 0c             	shl    $0xc,%edx
c0106d8f:	01 d0                	add    %edx,%eax
c0106d91:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106d96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d99:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106d9e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106da1:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106da6:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106dab:	83 ec 04             	sub    $0x4,%esp
c0106dae:	ff 75 d8             	pushl  -0x28(%ebp)
c0106db1:	6a 00                	push   $0x0
c0106db3:	50                   	push   %eax
c0106db4:	e8 b6 54 00 00       	call   c010c26f <Memset>
c0106db9:	83 c4 10             	add    $0x10,%esp
c0106dbc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106dbf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106dc2:	01 d0                	add    %edx,%eax
c0106dc4:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106dc9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106dcc:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106dd1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106dd6:	83 ec 04             	sub    $0x4,%esp
c0106dd9:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106ddc:	6a 00                	push   $0x0
c0106dde:	50                   	push   %eax
c0106ddf:	e8 8b 54 00 00       	call   c010c26f <Memset>
c0106de4:	83 c4 10             	add    $0x10,%esp
c0106de7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106dea:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106def:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106df2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106df5:	01 c2                	add    %eax,%edx
c0106df7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106dfa:	01 d0                	add    %edx,%eax
c0106dfc:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106e01:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106e04:	05 00 00 10 00       	add    $0x100000,%eax
c0106e09:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106e0e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106e13:	83 ec 04             	sub    $0x4,%esp
c0106e16:	ff 75 d8             	pushl  -0x28(%ebp)
c0106e19:	6a 00                	push   $0x0
c0106e1b:	50                   	push   %eax
c0106e1c:	e8 4e 54 00 00       	call   c010c26f <Memset>
c0106e21:	83 c4 10             	add    $0x10,%esp
c0106e24:	83 ec 04             	sub    $0x4,%esp
c0106e27:	68 f0 00 00 00       	push   $0xf0
c0106e2c:	6a 00                	push   $0x0
c0106e2e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106e33:	e8 37 54 00 00       	call   c010c26f <Memset>
c0106e38:	83 c4 10             	add    $0x10,%esp
c0106e3b:	83 ec 0c             	sub    $0xc,%esp
c0106e3e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106e43:	e8 75 fb ff ff       	call   c01069bd <init_memory_block_desc>
c0106e48:	83 c4 10             	add    $0x10,%esp
c0106e4b:	90                   	nop
c0106e4c:	c9                   	leave  
c0106e4d:	c3                   	ret    

c0106e4e <stop_here>:
c0106e4e:	55                   	push   %ebp
c0106e4f:	89 e5                	mov    %esp,%ebp
c0106e51:	83 ec 08             	sub    $0x8,%esp
c0106e54:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106e5b:	00 00 00 
c0106e5e:	83 ec 0c             	sub    $0xc,%esp
c0106e61:	68 a0 b6 10 c0       	push   $0xc010b6a0
c0106e66:	e8 6e 92 ff ff       	call   c01000d9 <disp_str>
c0106e6b:	83 c4 10             	add    $0x10,%esp
c0106e6e:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106e73:	83 ec 0c             	sub    $0xc,%esp
c0106e76:	50                   	push   %eax
c0106e77:	e8 ae 04 00 00       	call   c010732a <disp_int>
c0106e7c:	83 c4 10             	add    $0x10,%esp
c0106e7f:	83 ec 0c             	sub    $0xc,%esp
c0106e82:	68 a2 b6 10 c0       	push   $0xc010b6a2
c0106e87:	e8 4d 92 ff ff       	call   c01000d9 <disp_str>
c0106e8c:	83 c4 10             	add    $0x10,%esp
c0106e8f:	90                   	nop
c0106e90:	c9                   	leave  
c0106e91:	c3                   	ret    

c0106e92 <catch_error>:
c0106e92:	55                   	push   %ebp
c0106e93:	89 e5                	mov    %esp,%ebp
c0106e95:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106e9a:	83 c0 01             	add    $0x1,%eax
c0106e9d:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106ea2:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106ea7:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106eac:	90                   	nop
c0106ead:	5d                   	pop    %ebp
c0106eae:	c3                   	ret    

c0106eaf <intr_enable>:
c0106eaf:	55                   	push   %ebp
c0106eb0:	89 e5                	mov    %esp,%ebp
c0106eb2:	83 ec 18             	sub    $0x18,%esp
c0106eb5:	e8 65 00 00 00       	call   c0106f1f <intr_get_status>
c0106eba:	83 f8 01             	cmp    $0x1,%eax
c0106ebd:	75 0c                	jne    c0106ecb <intr_enable+0x1c>
c0106ebf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106ec6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ec9:	eb 0b                	jmp    c0106ed6 <intr_enable+0x27>
c0106ecb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106ed2:	fb                   	sti    
c0106ed3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ed6:	c9                   	leave  
c0106ed7:	c3                   	ret    

c0106ed8 <intr_disable>:
c0106ed8:	55                   	push   %ebp
c0106ed9:	89 e5                	mov    %esp,%ebp
c0106edb:	83 ec 18             	sub    $0x18,%esp
c0106ede:	e8 3c 00 00 00       	call   c0106f1f <intr_get_status>
c0106ee3:	83 f8 01             	cmp    $0x1,%eax
c0106ee6:	75 0d                	jne    c0106ef5 <intr_disable+0x1d>
c0106ee8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106eef:	fa                   	cli    
c0106ef0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ef3:	eb 0a                	jmp    c0106eff <intr_disable+0x27>
c0106ef5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106efc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106eff:	c9                   	leave  
c0106f00:	c3                   	ret    

c0106f01 <intr_set_status>:
c0106f01:	55                   	push   %ebp
c0106f02:	89 e5                	mov    %esp,%ebp
c0106f04:	83 ec 08             	sub    $0x8,%esp
c0106f07:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f0a:	83 e0 01             	and    $0x1,%eax
c0106f0d:	85 c0                	test   %eax,%eax
c0106f0f:	74 07                	je     c0106f18 <intr_set_status+0x17>
c0106f11:	e8 99 ff ff ff       	call   c0106eaf <intr_enable>
c0106f16:	eb 05                	jmp    c0106f1d <intr_set_status+0x1c>
c0106f18:	e8 bb ff ff ff       	call   c0106ed8 <intr_disable>
c0106f1d:	c9                   	leave  
c0106f1e:	c3                   	ret    

c0106f1f <intr_get_status>:
c0106f1f:	55                   	push   %ebp
c0106f20:	89 e5                	mov    %esp,%ebp
c0106f22:	83 ec 10             	sub    $0x10,%esp
c0106f25:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106f2c:	9c                   	pushf  
c0106f2d:	58                   	pop    %eax
c0106f2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106f31:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f34:	c1 e8 09             	shr    $0x9,%eax
c0106f37:	83 e0 01             	and    $0x1,%eax
c0106f3a:	c9                   	leave  
c0106f3b:	c3                   	ret    

c0106f3c <Memcpy>:
c0106f3c:	55                   	push   %ebp
c0106f3d:	89 e5                	mov    %esp,%ebp
c0106f3f:	83 ec 18             	sub    $0x18,%esp
c0106f42:	e8 91 ff ff ff       	call   c0106ed8 <intr_disable>
c0106f47:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106f4a:	83 ec 04             	sub    $0x4,%esp
c0106f4d:	ff 75 10             	pushl  0x10(%ebp)
c0106f50:	ff 75 0c             	pushl  0xc(%ebp)
c0106f53:	ff 75 08             	pushl  0x8(%ebp)
c0106f56:	e8 e6 52 00 00       	call   c010c241 <Memcpy2>
c0106f5b:	83 c4 10             	add    $0x10,%esp
c0106f5e:	83 ec 0c             	sub    $0xc,%esp
c0106f61:	ff 75 f4             	pushl  -0xc(%ebp)
c0106f64:	e8 98 ff ff ff       	call   c0106f01 <intr_set_status>
c0106f69:	83 c4 10             	add    $0x10,%esp
c0106f6c:	90                   	nop
c0106f6d:	c9                   	leave  
c0106f6e:	c3                   	ret    

c0106f6f <untar>:
c0106f6f:	55                   	push   %ebp
c0106f70:	89 e5                	mov    %esp,%ebp
c0106f72:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106f78:	83 ec 08             	sub    $0x8,%esp
c0106f7b:	6a 00                	push   $0x0
c0106f7d:	ff 75 08             	pushl  0x8(%ebp)
c0106f80:	e8 2a de ff ff       	call   c0104daf <open>
c0106f85:	83 c4 10             	add    $0x10,%esp
c0106f88:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106f8b:	83 ec 0c             	sub    $0xc,%esp
c0106f8e:	68 a4 b6 10 c0       	push   $0xc010b6a4
c0106f93:	e8 60 18 00 00       	call   c01087f8 <Printf>
c0106f98:	83 c4 10             	add    $0x10,%esp
c0106f9b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106fa2:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106fa9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106fb0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106fb7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106fbe:	e9 63 02 00 00       	jmp    c0107226 <untar+0x2b7>
c0106fc3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106fc7:	7e 58                	jle    c0107021 <untar+0xb2>
c0106fc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fcc:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106fd1:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106fd7:	85 c0                	test   %eax,%eax
c0106fd9:	0f 48 c2             	cmovs  %edx,%eax
c0106fdc:	c1 f8 09             	sar    $0x9,%eax
c0106fdf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106fe2:	83 ec 04             	sub    $0x4,%esp
c0106fe5:	68 00 02 00 00       	push   $0x200
c0106fea:	6a 00                	push   $0x0
c0106fec:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106ff2:	50                   	push   %eax
c0106ff3:	e8 77 52 00 00       	call   c010c26f <Memset>
c0106ff8:	83 c4 10             	add    $0x10,%esp
c0106ffb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106ffe:	c1 e0 09             	shl    $0x9,%eax
c0107001:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0107004:	83 ec 04             	sub    $0x4,%esp
c0107007:	50                   	push   %eax
c0107008:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c010700e:	50                   	push   %eax
c010700f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107012:	e8 2d de ff ff       	call   c0104e44 <read>
c0107017:	83 c4 10             	add    $0x10,%esp
c010701a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107021:	83 ec 04             	sub    $0x4,%esp
c0107024:	68 00 02 00 00       	push   $0x200
c0107029:	6a 00                	push   $0x0
c010702b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0107031:	50                   	push   %eax
c0107032:	e8 38 52 00 00       	call   c010c26f <Memset>
c0107037:	83 c4 10             	add    $0x10,%esp
c010703a:	83 ec 04             	sub    $0x4,%esp
c010703d:	68 00 02 00 00       	push   $0x200
c0107042:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0107048:	50                   	push   %eax
c0107049:	ff 75 e4             	pushl  -0x1c(%ebp)
c010704c:	e8 f3 dd ff ff       	call   c0104e44 <read>
c0107051:	83 c4 10             	add    $0x10,%esp
c0107054:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107057:	83 ec 0c             	sub    $0xc,%esp
c010705a:	68 b6 b6 10 c0       	push   $0xc010b6b6
c010705f:	e8 94 17 00 00       	call   c01087f8 <Printf>
c0107064:	83 c4 10             	add    $0x10,%esp
c0107067:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c010706b:	0f 84 c1 01 00 00    	je     c0107232 <untar+0x2c3>
c0107071:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107074:	01 45 f4             	add    %eax,-0xc(%ebp)
c0107077:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010707e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0107084:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107087:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010708a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010708d:	83 ec 08             	sub    $0x8,%esp
c0107090:	6a 07                	push   $0x7
c0107092:	ff 75 cc             	pushl  -0x34(%ebp)
c0107095:	e8 15 dd ff ff       	call   c0104daf <open>
c010709a:	83 c4 10             	add    $0x10,%esp
c010709d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01070a0:	83 ec 0c             	sub    $0xc,%esp
c01070a3:	68 c8 b6 10 c0       	push   $0xc010b6c8
c01070a8:	e8 4b 17 00 00       	call   c01087f8 <Printf>
c01070ad:	83 c4 10             	add    $0x10,%esp
c01070b0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01070b7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01070ba:	83 c0 7c             	add    $0x7c,%eax
c01070bd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01070c0:	83 ec 0c             	sub    $0xc,%esp
c01070c3:	ff 75 cc             	pushl  -0x34(%ebp)
c01070c6:	e8 dd 51 00 00       	call   c010c2a8 <Strlen>
c01070cb:	83 c4 10             	add    $0x10,%esp
c01070ce:	85 c0                	test   %eax,%eax
c01070d0:	75 28                	jne    c01070fa <untar+0x18b>
c01070d2:	83 ec 0c             	sub    $0xc,%esp
c01070d5:	ff 75 c4             	pushl  -0x3c(%ebp)
c01070d8:	e8 cb 51 00 00       	call   c010c2a8 <Strlen>
c01070dd:	83 c4 10             	add    $0x10,%esp
c01070e0:	85 c0                	test   %eax,%eax
c01070e2:	75 16                	jne    c01070fa <untar+0x18b>
c01070e4:	83 ec 0c             	sub    $0xc,%esp
c01070e7:	68 da b6 10 c0       	push   $0xc010b6da
c01070ec:	e8 07 17 00 00       	call   c01087f8 <Printf>
c01070f1:	83 c4 10             	add    $0x10,%esp
c01070f4:	90                   	nop
c01070f5:	e9 39 01 00 00       	jmp    c0107233 <untar+0x2c4>
c01070fa:	83 ec 0c             	sub    $0xc,%esp
c01070fd:	68 e1 b6 10 c0       	push   $0xc010b6e1
c0107102:	e8 f1 16 00 00       	call   c01087f8 <Printf>
c0107107:	83 c4 10             	add    $0x10,%esp
c010710a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010710d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107110:	eb 1f                	jmp    c0107131 <untar+0x1c2>
c0107112:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107115:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010711c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010711f:	0f b6 00             	movzbl (%eax),%eax
c0107122:	0f be c0             	movsbl %al,%eax
c0107125:	83 e8 30             	sub    $0x30,%eax
c0107128:	01 d0                	add    %edx,%eax
c010712a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010712d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0107131:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107134:	0f b6 00             	movzbl (%eax),%eax
c0107137:	84 c0                	test   %al,%al
c0107139:	75 d7                	jne    c0107112 <untar+0x1a3>
c010713b:	83 ec 0c             	sub    $0xc,%esp
c010713e:	68 ef b6 10 c0       	push   $0xc010b6ef
c0107143:	e8 b0 16 00 00       	call   c01087f8 <Printf>
c0107148:	83 c4 10             	add    $0x10,%esp
c010714b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010714e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107151:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0107158:	83 ec 08             	sub    $0x8,%esp
c010715b:	ff 75 c0             	pushl  -0x40(%ebp)
c010715e:	68 fd b6 10 c0       	push   $0xc010b6fd
c0107163:	e8 90 16 00 00       	call   c01087f8 <Printf>
c0107168:	83 c4 10             	add    $0x10,%esp
c010716b:	83 ec 08             	sub    $0x8,%esp
c010716e:	ff 75 c0             	pushl  -0x40(%ebp)
c0107171:	68 0f b7 10 c0       	push   $0xc010b70f
c0107176:	e8 7d 16 00 00       	call   c01087f8 <Printf>
c010717b:	83 c4 10             	add    $0x10,%esp
c010717e:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0107181:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0107184:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0107188:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010718b:	e8 02 fd ff ff       	call   c0106e92 <catch_error>
c0107190:	83 ec 04             	sub    $0x4,%esp
c0107193:	ff 75 b8             	pushl  -0x48(%ebp)
c0107196:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c010719c:	50                   	push   %eax
c010719d:	ff 75 e4             	pushl  -0x1c(%ebp)
c01071a0:	e8 9f dc ff ff       	call   c0104e44 <read>
c01071a5:	83 c4 10             	add    $0x10,%esp
c01071a8:	01 45 f4             	add    %eax,-0xc(%ebp)
c01071ab:	83 ec 04             	sub    $0x4,%esp
c01071ae:	ff 75 b8             	pushl  -0x48(%ebp)
c01071b1:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c01071b7:	50                   	push   %eax
c01071b8:	ff 75 c8             	pushl  -0x38(%ebp)
c01071bb:	e8 05 de ff ff       	call   c0104fc5 <write>
c01071c0:	83 c4 10             	add    $0x10,%esp
c01071c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01071c6:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c01071c9:	7d 02                	jge    c01071cd <untar+0x25e>
c01071cb:	eb be                	jmp    c010718b <untar+0x21c>
c01071cd:	90                   	nop
c01071ce:	83 ec 08             	sub    $0x8,%esp
c01071d1:	ff 75 f4             	pushl  -0xc(%ebp)
c01071d4:	68 21 b7 10 c0       	push   $0xc010b721
c01071d9:	e8 1a 16 00 00       	call   c01087f8 <Printf>
c01071de:	83 c4 10             	add    $0x10,%esp
c01071e1:	83 ec 08             	sub    $0x8,%esp
c01071e4:	ff 75 c0             	pushl  -0x40(%ebp)
c01071e7:	68 33 b7 10 c0       	push   $0xc010b733
c01071ec:	e8 07 16 00 00       	call   c01087f8 <Printf>
c01071f1:	83 c4 10             	add    $0x10,%esp
c01071f4:	83 ec 0c             	sub    $0xc,%esp
c01071f7:	68 44 b7 10 c0       	push   $0xc010b744
c01071fc:	e8 f7 15 00 00       	call   c01087f8 <Printf>
c0107201:	83 c4 10             	add    $0x10,%esp
c0107204:	83 ec 0c             	sub    $0xc,%esp
c0107207:	ff 75 c8             	pushl  -0x38(%ebp)
c010720a:	e8 3b de ff ff       	call   c010504a <close>
c010720f:	83 c4 10             	add    $0x10,%esp
c0107212:	83 ec 0c             	sub    $0xc,%esp
c0107215:	68 52 b7 10 c0       	push   $0xc010b752
c010721a:	e8 d9 15 00 00       	call   c01087f8 <Printf>
c010721f:	83 c4 10             	add    $0x10,%esp
c0107222:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0107226:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010722a:	0f 8f 93 fd ff ff    	jg     c0106fc3 <untar+0x54>
c0107230:	eb 01                	jmp    c0107233 <untar+0x2c4>
c0107232:	90                   	nop
c0107233:	83 ec 0c             	sub    $0xc,%esp
c0107236:	68 5f b7 10 c0       	push   $0xc010b75f
c010723b:	e8 b8 15 00 00       	call   c01087f8 <Printf>
c0107240:	83 c4 10             	add    $0x10,%esp
c0107243:	83 ec 0c             	sub    $0xc,%esp
c0107246:	68 71 b7 10 c0       	push   $0xc010b771
c010724b:	e8 a8 15 00 00       	call   c01087f8 <Printf>
c0107250:	83 c4 10             	add    $0x10,%esp
c0107253:	83 ec 0c             	sub    $0xc,%esp
c0107256:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107259:	e8 ec dd ff ff       	call   c010504a <close>
c010725e:	83 c4 10             	add    $0x10,%esp
c0107261:	83 ec 0c             	sub    $0xc,%esp
c0107264:	68 81 b7 10 c0       	push   $0xc010b781
c0107269:	e8 8a 15 00 00       	call   c01087f8 <Printf>
c010726e:	83 c4 10             	add    $0x10,%esp
c0107271:	83 ec 0c             	sub    $0xc,%esp
c0107274:	68 94 b7 10 c0       	push   $0xc010b794
c0107279:	e8 7a 15 00 00       	call   c01087f8 <Printf>
c010727e:	83 c4 10             	add    $0x10,%esp
c0107281:	90                   	nop
c0107282:	c9                   	leave  
c0107283:	c3                   	ret    

c0107284 <atoi>:
c0107284:	55                   	push   %ebp
c0107285:	89 e5                	mov    %esp,%ebp
c0107287:	83 ec 10             	sub    $0x10,%esp
c010728a:	8b 45 08             	mov    0x8(%ebp),%eax
c010728d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107290:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107293:	8d 50 01             	lea    0x1(%eax),%edx
c0107296:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107299:	c6 00 30             	movb   $0x30,(%eax)
c010729c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010729f:	8d 50 01             	lea    0x1(%eax),%edx
c01072a2:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01072a5:	c6 00 78             	movb   $0x78,(%eax)
c01072a8:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c01072ac:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01072b0:	75 0e                	jne    c01072c0 <atoi+0x3c>
c01072b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01072b5:	8d 50 01             	lea    0x1(%eax),%edx
c01072b8:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01072bb:	c6 00 30             	movb   $0x30,(%eax)
c01072be:	eb 61                	jmp    c0107321 <atoi+0x9d>
c01072c0:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c01072c7:	eb 52                	jmp    c010731b <atoi+0x97>
c01072c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01072cc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01072cf:	89 c1                	mov    %eax,%ecx
c01072d1:	d3 fa                	sar    %cl,%edx
c01072d3:	89 d0                	mov    %edx,%eax
c01072d5:	83 e0 0f             	and    $0xf,%eax
c01072d8:	88 45 fb             	mov    %al,-0x5(%ebp)
c01072db:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c01072df:	75 06                	jne    c01072e7 <atoi+0x63>
c01072e1:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c01072e5:	74 2f                	je     c0107316 <atoi+0x92>
c01072e7:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c01072eb:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01072ef:	83 c0 30             	add    $0x30,%eax
c01072f2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01072f5:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c01072f9:	7e 0a                	jle    c0107305 <atoi+0x81>
c01072fb:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01072ff:	83 c0 07             	add    $0x7,%eax
c0107302:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107305:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107308:	8d 50 01             	lea    0x1(%eax),%edx
c010730b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010730e:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0107312:	88 10                	mov    %dl,(%eax)
c0107314:	eb 01                	jmp    c0107317 <atoi+0x93>
c0107316:	90                   	nop
c0107317:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010731b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010731f:	79 a8                	jns    c01072c9 <atoi+0x45>
c0107321:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107324:	c6 00 00             	movb   $0x0,(%eax)
c0107327:	90                   	nop
c0107328:	c9                   	leave  
c0107329:	c3                   	ret    

c010732a <disp_int>:
c010732a:	55                   	push   %ebp
c010732b:	89 e5                	mov    %esp,%ebp
c010732d:	83 ec 18             	sub    $0x18,%esp
c0107330:	ff 75 08             	pushl  0x8(%ebp)
c0107333:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107336:	50                   	push   %eax
c0107337:	e8 48 ff ff ff       	call   c0107284 <atoi>
c010733c:	83 c4 08             	add    $0x8,%esp
c010733f:	83 ec 08             	sub    $0x8,%esp
c0107342:	6a 0b                	push   $0xb
c0107344:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107347:	50                   	push   %eax
c0107348:	e8 c7 8d ff ff       	call   c0100114 <disp_str_colour>
c010734d:	83 c4 10             	add    $0x10,%esp
c0107350:	90                   	nop
c0107351:	c9                   	leave  
c0107352:	c3                   	ret    

c0107353 <do_page_fault>:
c0107353:	55                   	push   %ebp
c0107354:	89 e5                	mov    %esp,%ebp
c0107356:	83 ec 28             	sub    $0x28,%esp
c0107359:	0f 20 d0             	mov    %cr2,%eax
c010735c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010735f:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107366:	00 00 00 
c0107369:	83 ec 0c             	sub    $0xc,%esp
c010736c:	68 9f b7 10 c0       	push   $0xc010b79f
c0107371:	e8 63 8d ff ff       	call   c01000d9 <disp_str>
c0107376:	83 c4 10             	add    $0x10,%esp
c0107379:	83 ec 0c             	sub    $0xc,%esp
c010737c:	68 ae b7 10 c0       	push   $0xc010b7ae
c0107381:	e8 53 8d ff ff       	call   c01000d9 <disp_str>
c0107386:	83 c4 10             	add    $0x10,%esp
c0107389:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010738c:	83 ec 0c             	sub    $0xc,%esp
c010738f:	50                   	push   %eax
c0107390:	e8 95 ff ff ff       	call   c010732a <disp_int>
c0107395:	83 c4 10             	add    $0x10,%esp
c0107398:	83 ec 0c             	sub    $0xc,%esp
c010739b:	68 b3 b7 10 c0       	push   $0xc010b7b3
c01073a0:	e8 34 8d ff ff       	call   c01000d9 <disp_str>
c01073a5:	83 c4 10             	add    $0x10,%esp
c01073a8:	83 ec 0c             	sub    $0xc,%esp
c01073ab:	ff 75 f4             	pushl  -0xc(%ebp)
c01073ae:	e8 51 ec ff ff       	call   c0106004 <ptr_pde>
c01073b3:	83 c4 10             	add    $0x10,%esp
c01073b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01073b9:	83 ec 0c             	sub    $0xc,%esp
c01073bc:	ff 75 f4             	pushl  -0xc(%ebp)
c01073bf:	e8 53 ec ff ff       	call   c0106017 <ptr_pte>
c01073c4:	83 c4 10             	add    $0x10,%esp
c01073c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01073ca:	83 ec 0c             	sub    $0xc,%esp
c01073cd:	68 b5 b7 10 c0       	push   $0xc010b7b5
c01073d2:	e8 02 8d ff ff       	call   c01000d9 <disp_str>
c01073d7:	83 c4 10             	add    $0x10,%esp
c01073da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01073dd:	83 ec 0c             	sub    $0xc,%esp
c01073e0:	50                   	push   %eax
c01073e1:	e8 44 ff ff ff       	call   c010732a <disp_int>
c01073e6:	83 c4 10             	add    $0x10,%esp
c01073e9:	83 ec 0c             	sub    $0xc,%esp
c01073ec:	68 ba b7 10 c0       	push   $0xc010b7ba
c01073f1:	e8 e3 8c ff ff       	call   c01000d9 <disp_str>
c01073f6:	83 c4 10             	add    $0x10,%esp
c01073f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01073fc:	8b 00                	mov    (%eax),%eax
c01073fe:	83 ec 0c             	sub    $0xc,%esp
c0107401:	50                   	push   %eax
c0107402:	e8 23 ff ff ff       	call   c010732a <disp_int>
c0107407:	83 c4 10             	add    $0x10,%esp
c010740a:	83 ec 0c             	sub    $0xc,%esp
c010740d:	68 b3 b7 10 c0       	push   $0xc010b7b3
c0107412:	e8 c2 8c ff ff       	call   c01000d9 <disp_str>
c0107417:	83 c4 10             	add    $0x10,%esp
c010741a:	83 ec 0c             	sub    $0xc,%esp
c010741d:	68 c3 b7 10 c0       	push   $0xc010b7c3
c0107422:	e8 b2 8c ff ff       	call   c01000d9 <disp_str>
c0107427:	83 c4 10             	add    $0x10,%esp
c010742a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010742d:	83 ec 0c             	sub    $0xc,%esp
c0107430:	50                   	push   %eax
c0107431:	e8 f4 fe ff ff       	call   c010732a <disp_int>
c0107436:	83 c4 10             	add    $0x10,%esp
c0107439:	83 ec 0c             	sub    $0xc,%esp
c010743c:	68 c8 b7 10 c0       	push   $0xc010b7c8
c0107441:	e8 93 8c ff ff       	call   c01000d9 <disp_str>
c0107446:	83 c4 10             	add    $0x10,%esp
c0107449:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010744c:	8b 00                	mov    (%eax),%eax
c010744e:	83 ec 0c             	sub    $0xc,%esp
c0107451:	50                   	push   %eax
c0107452:	e8 d3 fe ff ff       	call   c010732a <disp_int>
c0107457:	83 c4 10             	add    $0x10,%esp
c010745a:	83 ec 0c             	sub    $0xc,%esp
c010745d:	68 b3 b7 10 c0       	push   $0xc010b7b3
c0107462:	e8 72 8c ff ff       	call   c01000d9 <disp_str>
c0107467:	83 c4 10             	add    $0x10,%esp
c010746a:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0107471:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107474:	8b 00                	mov    (%eax),%eax
c0107476:	83 e0 01             	and    $0x1,%eax
c0107479:	85 c0                	test   %eax,%eax
c010747b:	74 09                	je     c0107486 <do_page_fault+0x133>
c010747d:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0107484:	eb 07                	jmp    c010748d <do_page_fault+0x13a>
c0107486:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010748d:	90                   	nop
c010748e:	c9                   	leave  
c010748f:	c3                   	ret    

c0107490 <exception_handler>:
c0107490:	55                   	push   %ebp
c0107491:	89 e5                	mov    %esp,%ebp
c0107493:	57                   	push   %edi
c0107494:	56                   	push   %esi
c0107495:	53                   	push   %ebx
c0107496:	83 ec 6c             	sub    $0x6c,%esp
c0107499:	8d 45 8c             	lea    -0x74(%ebp),%eax
c010749c:	bb 40 ba 10 c0       	mov    $0xc010ba40,%ebx
c01074a1:	ba 13 00 00 00       	mov    $0x13,%edx
c01074a6:	89 c7                	mov    %eax,%edi
c01074a8:	89 de                	mov    %ebx,%esi
c01074aa:	89 d1                	mov    %edx,%ecx
c01074ac:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01074ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01074b5:	eb 04                	jmp    c01074bb <exception_handler+0x2b>
c01074b7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01074bb:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c01074c2:	7e f3                	jle    c01074b7 <exception_handler+0x27>
c01074c4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01074cb:	00 00 00 
c01074ce:	83 ec 0c             	sub    $0xc,%esp
c01074d1:	68 d1 b7 10 c0       	push   $0xc010b7d1
c01074d6:	e8 fe 8b ff ff       	call   c01000d9 <disp_str>
c01074db:	83 c4 10             	add    $0x10,%esp
c01074de:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c01074e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01074e8:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c01074ec:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01074ef:	83 ec 0c             	sub    $0xc,%esp
c01074f2:	ff 75 dc             	pushl  -0x24(%ebp)
c01074f5:	e8 df 8b ff ff       	call   c01000d9 <disp_str>
c01074fa:	83 c4 10             	add    $0x10,%esp
c01074fd:	83 ec 0c             	sub    $0xc,%esp
c0107500:	68 df b7 10 c0       	push   $0xc010b7df
c0107505:	e8 cf 8b ff ff       	call   c01000d9 <disp_str>
c010750a:	83 c4 10             	add    $0x10,%esp
c010750d:	83 ec 0c             	sub    $0xc,%esp
c0107510:	68 e2 b7 10 c0       	push   $0xc010b7e2
c0107515:	e8 bf 8b ff ff       	call   c01000d9 <disp_str>
c010751a:	83 c4 10             	add    $0x10,%esp
c010751d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107520:	83 ec 0c             	sub    $0xc,%esp
c0107523:	50                   	push   %eax
c0107524:	e8 01 fe ff ff       	call   c010732a <disp_int>
c0107529:	83 c4 10             	add    $0x10,%esp
c010752c:	83 ec 0c             	sub    $0xc,%esp
c010752f:	68 df b7 10 c0       	push   $0xc010b7df
c0107534:	e8 a0 8b ff ff       	call   c01000d9 <disp_str>
c0107539:	83 c4 10             	add    $0x10,%esp
c010753c:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107540:	74 2f                	je     c0107571 <exception_handler+0xe1>
c0107542:	83 ec 0c             	sub    $0xc,%esp
c0107545:	68 ea b7 10 c0       	push   $0xc010b7ea
c010754a:	e8 8a 8b ff ff       	call   c01000d9 <disp_str>
c010754f:	83 c4 10             	add    $0x10,%esp
c0107552:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107555:	83 ec 0c             	sub    $0xc,%esp
c0107558:	50                   	push   %eax
c0107559:	e8 cc fd ff ff       	call   c010732a <disp_int>
c010755e:	83 c4 10             	add    $0x10,%esp
c0107561:	83 ec 0c             	sub    $0xc,%esp
c0107564:	68 df b7 10 c0       	push   $0xc010b7df
c0107569:	e8 6b 8b ff ff       	call   c01000d9 <disp_str>
c010756e:	83 c4 10             	add    $0x10,%esp
c0107571:	83 ec 0c             	sub    $0xc,%esp
c0107574:	68 f4 b7 10 c0       	push   $0xc010b7f4
c0107579:	e8 5b 8b ff ff       	call   c01000d9 <disp_str>
c010757e:	83 c4 10             	add    $0x10,%esp
c0107581:	83 ec 0c             	sub    $0xc,%esp
c0107584:	ff 75 14             	pushl  0x14(%ebp)
c0107587:	e8 9e fd ff ff       	call   c010732a <disp_int>
c010758c:	83 c4 10             	add    $0x10,%esp
c010758f:	83 ec 0c             	sub    $0xc,%esp
c0107592:	68 df b7 10 c0       	push   $0xc010b7df
c0107597:	e8 3d 8b ff ff       	call   c01000d9 <disp_str>
c010759c:	83 c4 10             	add    $0x10,%esp
c010759f:	83 ec 0c             	sub    $0xc,%esp
c01075a2:	68 f8 b7 10 c0       	push   $0xc010b7f8
c01075a7:	e8 2d 8b ff ff       	call   c01000d9 <disp_str>
c01075ac:	83 c4 10             	add    $0x10,%esp
c01075af:	8b 45 10             	mov    0x10(%ebp),%eax
c01075b2:	83 ec 0c             	sub    $0xc,%esp
c01075b5:	50                   	push   %eax
c01075b6:	e8 6f fd ff ff       	call   c010732a <disp_int>
c01075bb:	83 c4 10             	add    $0x10,%esp
c01075be:	83 ec 0c             	sub    $0xc,%esp
c01075c1:	68 df b7 10 c0       	push   $0xc010b7df
c01075c6:	e8 0e 8b ff ff       	call   c01000d9 <disp_str>
c01075cb:	83 c4 10             	add    $0x10,%esp
c01075ce:	83 ec 0c             	sub    $0xc,%esp
c01075d1:	68 fd b7 10 c0       	push   $0xc010b7fd
c01075d6:	e8 fe 8a ff ff       	call   c01000d9 <disp_str>
c01075db:	83 c4 10             	add    $0x10,%esp
c01075de:	83 ec 0c             	sub    $0xc,%esp
c01075e1:	ff 75 18             	pushl  0x18(%ebp)
c01075e4:	e8 41 fd ff ff       	call   c010732a <disp_int>
c01075e9:	83 c4 10             	add    $0x10,%esp
c01075ec:	83 ec 0c             	sub    $0xc,%esp
c01075ef:	68 df b7 10 c0       	push   $0xc010b7df
c01075f4:	e8 e0 8a ff ff       	call   c01000d9 <disp_str>
c01075f9:	83 c4 10             	add    $0x10,%esp
c01075fc:	83 ec 0c             	sub    $0xc,%esp
c01075ff:	68 08 b8 10 c0       	push   $0xc010b808
c0107604:	e8 d0 8a ff ff       	call   c01000d9 <disp_str>
c0107609:	83 c4 10             	add    $0x10,%esp
c010760c:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0107610:	75 45                	jne    c0107657 <exception_handler+0x1c7>
c0107612:	0f 20 d0             	mov    %cr2,%eax
c0107615:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107618:	83 ec 0c             	sub    $0xc,%esp
c010761b:	68 27 b8 10 c0       	push   $0xc010b827
c0107620:	e8 b4 8a ff ff       	call   c01000d9 <disp_str>
c0107625:	83 c4 10             	add    $0x10,%esp
c0107628:	83 ec 0c             	sub    $0xc,%esp
c010762b:	68 ae b7 10 c0       	push   $0xc010b7ae
c0107630:	e8 a4 8a ff ff       	call   c01000d9 <disp_str>
c0107635:	83 c4 10             	add    $0x10,%esp
c0107638:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010763b:	83 ec 0c             	sub    $0xc,%esp
c010763e:	50                   	push   %eax
c010763f:	e8 e6 fc ff ff       	call   c010732a <disp_int>
c0107644:	83 c4 10             	add    $0x10,%esp
c0107647:	83 ec 0c             	sub    $0xc,%esp
c010764a:	68 b3 b7 10 c0       	push   $0xc010b7b3
c010764f:	e8 85 8a ff ff       	call   c01000d9 <disp_str>
c0107654:	83 c4 10             	add    $0x10,%esp
c0107657:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c010765b:	75 11                	jne    c010766e <exception_handler+0x1de>
c010765d:	83 ec 0c             	sub    $0xc,%esp
c0107660:	68 33 b8 10 c0       	push   $0xc010b833
c0107665:	e8 6f 8a ff ff       	call   c01000d9 <disp_str>
c010766a:	83 c4 10             	add    $0x10,%esp
c010766d:	90                   	nop
c010766e:	90                   	nop
c010766f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107672:	5b                   	pop    %ebx
c0107673:	5e                   	pop    %esi
c0107674:	5f                   	pop    %edi
c0107675:	5d                   	pop    %ebp
c0107676:	c3                   	ret    

c0107677 <init_internal_interrupt>:
c0107677:	55                   	push   %ebp
c0107678:	89 e5                	mov    %esp,%ebp
c010767a:	83 ec 08             	sub    $0x8,%esp
c010767d:	6a 0e                	push   $0xe
c010767f:	6a 08                	push   $0x8
c0107681:	68 50 01 10 c0       	push   $0xc0100150
c0107686:	6a 00                	push   $0x0
c0107688:	e8 62 c7 ff ff       	call   c0103def <InitInterruptDesc>
c010768d:	83 c4 10             	add    $0x10,%esp
c0107690:	6a 0e                	push   $0xe
c0107692:	6a 08                	push   $0x8
c0107694:	68 56 01 10 c0       	push   $0xc0100156
c0107699:	6a 01                	push   $0x1
c010769b:	e8 4f c7 ff ff       	call   c0103def <InitInterruptDesc>
c01076a0:	83 c4 10             	add    $0x10,%esp
c01076a3:	6a 0e                	push   $0xe
c01076a5:	6a 08                	push   $0x8
c01076a7:	68 5c 01 10 c0       	push   $0xc010015c
c01076ac:	6a 02                	push   $0x2
c01076ae:	e8 3c c7 ff ff       	call   c0103def <InitInterruptDesc>
c01076b3:	83 c4 10             	add    $0x10,%esp
c01076b6:	6a 0e                	push   $0xe
c01076b8:	6a 08                	push   $0x8
c01076ba:	68 62 01 10 c0       	push   $0xc0100162
c01076bf:	6a 03                	push   $0x3
c01076c1:	e8 29 c7 ff ff       	call   c0103def <InitInterruptDesc>
c01076c6:	83 c4 10             	add    $0x10,%esp
c01076c9:	6a 0e                	push   $0xe
c01076cb:	6a 08                	push   $0x8
c01076cd:	68 68 01 10 c0       	push   $0xc0100168
c01076d2:	6a 04                	push   $0x4
c01076d4:	e8 16 c7 ff ff       	call   c0103def <InitInterruptDesc>
c01076d9:	83 c4 10             	add    $0x10,%esp
c01076dc:	6a 0e                	push   $0xe
c01076de:	6a 08                	push   $0x8
c01076e0:	68 6e 01 10 c0       	push   $0xc010016e
c01076e5:	6a 05                	push   $0x5
c01076e7:	e8 03 c7 ff ff       	call   c0103def <InitInterruptDesc>
c01076ec:	83 c4 10             	add    $0x10,%esp
c01076ef:	6a 0e                	push   $0xe
c01076f1:	6a 08                	push   $0x8
c01076f3:	68 74 01 10 c0       	push   $0xc0100174
c01076f8:	6a 06                	push   $0x6
c01076fa:	e8 f0 c6 ff ff       	call   c0103def <InitInterruptDesc>
c01076ff:	83 c4 10             	add    $0x10,%esp
c0107702:	6a 0e                	push   $0xe
c0107704:	6a 08                	push   $0x8
c0107706:	68 7a 01 10 c0       	push   $0xc010017a
c010770b:	6a 07                	push   $0x7
c010770d:	e8 dd c6 ff ff       	call   c0103def <InitInterruptDesc>
c0107712:	83 c4 10             	add    $0x10,%esp
c0107715:	6a 0e                	push   $0xe
c0107717:	6a 08                	push   $0x8
c0107719:	68 80 01 10 c0       	push   $0xc0100180
c010771e:	6a 08                	push   $0x8
c0107720:	e8 ca c6 ff ff       	call   c0103def <InitInterruptDesc>
c0107725:	83 c4 10             	add    $0x10,%esp
c0107728:	6a 0e                	push   $0xe
c010772a:	6a 08                	push   $0x8
c010772c:	68 84 01 10 c0       	push   $0xc0100184
c0107731:	6a 09                	push   $0x9
c0107733:	e8 b7 c6 ff ff       	call   c0103def <InitInterruptDesc>
c0107738:	83 c4 10             	add    $0x10,%esp
c010773b:	6a 0e                	push   $0xe
c010773d:	6a 08                	push   $0x8
c010773f:	68 8a 01 10 c0       	push   $0xc010018a
c0107744:	6a 0a                	push   $0xa
c0107746:	e8 a4 c6 ff ff       	call   c0103def <InitInterruptDesc>
c010774b:	83 c4 10             	add    $0x10,%esp
c010774e:	6a 0e                	push   $0xe
c0107750:	6a 08                	push   $0x8
c0107752:	68 8e 01 10 c0       	push   $0xc010018e
c0107757:	6a 0b                	push   $0xb
c0107759:	e8 91 c6 ff ff       	call   c0103def <InitInterruptDesc>
c010775e:	83 c4 10             	add    $0x10,%esp
c0107761:	6a 0e                	push   $0xe
c0107763:	6a 08                	push   $0x8
c0107765:	68 92 01 10 c0       	push   $0xc0100192
c010776a:	6a 0c                	push   $0xc
c010776c:	e8 7e c6 ff ff       	call   c0103def <InitInterruptDesc>
c0107771:	83 c4 10             	add    $0x10,%esp
c0107774:	6a 0e                	push   $0xe
c0107776:	6a 08                	push   $0x8
c0107778:	68 96 01 10 c0       	push   $0xc0100196
c010777d:	6a 0d                	push   $0xd
c010777f:	e8 6b c6 ff ff       	call   c0103def <InitInterruptDesc>
c0107784:	83 c4 10             	add    $0x10,%esp
c0107787:	6a 0e                	push   $0xe
c0107789:	6a 08                	push   $0x8
c010778b:	68 a1 01 10 c0       	push   $0xc01001a1
c0107790:	6a 0e                	push   $0xe
c0107792:	e8 58 c6 ff ff       	call   c0103def <InitInterruptDesc>
c0107797:	83 c4 10             	add    $0x10,%esp
c010779a:	6a 0e                	push   $0xe
c010779c:	6a 08                	push   $0x8
c010779e:	68 a5 01 10 c0       	push   $0xc01001a5
c01077a3:	6a 10                	push   $0x10
c01077a5:	e8 45 c6 ff ff       	call   c0103def <InitInterruptDesc>
c01077aa:	83 c4 10             	add    $0x10,%esp
c01077ad:	6a 0e                	push   $0xe
c01077af:	6a 08                	push   $0x8
c01077b1:	68 ab 01 10 c0       	push   $0xc01001ab
c01077b6:	6a 11                	push   $0x11
c01077b8:	e8 32 c6 ff ff       	call   c0103def <InitInterruptDesc>
c01077bd:	83 c4 10             	add    $0x10,%esp
c01077c0:	6a 0e                	push   $0xe
c01077c2:	6a 08                	push   $0x8
c01077c4:	68 af 01 10 c0       	push   $0xc01001af
c01077c9:	6a 12                	push   $0x12
c01077cb:	e8 1f c6 ff ff       	call   c0103def <InitInterruptDesc>
c01077d0:	83 c4 10             	add    $0x10,%esp
c01077d3:	6a 0e                	push   $0xe
c01077d5:	6a 0e                	push   $0xe
c01077d7:	68 ba 02 10 c0       	push   $0xc01002ba
c01077dc:	68 90 00 00 00       	push   $0x90
c01077e1:	e8 09 c6 ff ff       	call   c0103def <InitInterruptDesc>
c01077e6:	83 c4 10             	add    $0x10,%esp
c01077e9:	90                   	nop
c01077ea:	c9                   	leave  
c01077eb:	c3                   	ret    

c01077ec <spurious_irq>:
c01077ec:	55                   	push   %ebp
c01077ed:	89 e5                	mov    %esp,%ebp
c01077ef:	83 ec 08             	sub    $0x8,%esp
c01077f2:	83 ec 08             	sub    $0x8,%esp
c01077f5:	6a 0b                	push   $0xb
c01077f7:	68 8c ba 10 c0       	push   $0xc010ba8c
c01077fc:	e8 13 89 ff ff       	call   c0100114 <disp_str_colour>
c0107801:	83 c4 10             	add    $0x10,%esp
c0107804:	83 ec 0c             	sub    $0xc,%esp
c0107807:	ff 75 08             	pushl  0x8(%ebp)
c010780a:	e8 1b fb ff ff       	call   c010732a <disp_int>
c010780f:	83 c4 10             	add    $0x10,%esp
c0107812:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107817:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010781d:	83 c0 01             	add    $0x1,%eax
c0107820:	83 d2 00             	adc    $0x0,%edx
c0107823:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107828:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010782e:	83 ec 0c             	sub    $0xc,%esp
c0107831:	68 a0 b6 10 c0       	push   $0xc010b6a0
c0107836:	e8 9e 88 ff ff       	call   c01000d9 <disp_str>
c010783b:	83 c4 10             	add    $0x10,%esp
c010783e:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107843:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107849:	83 ec 0c             	sub    $0xc,%esp
c010784c:	50                   	push   %eax
c010784d:	e8 d8 fa ff ff       	call   c010732a <disp_int>
c0107852:	83 c4 10             	add    $0x10,%esp
c0107855:	83 ec 0c             	sub    $0xc,%esp
c0107858:	68 a2 b6 10 c0       	push   $0xc010b6a2
c010785d:	e8 77 88 ff ff       	call   c01000d9 <disp_str>
c0107862:	83 c4 10             	add    $0x10,%esp
c0107865:	83 ec 08             	sub    $0x8,%esp
c0107868:	6a 0c                	push   $0xc
c010786a:	68 b4 ba 10 c0       	push   $0xc010bab4
c010786f:	e8 a0 88 ff ff       	call   c0100114 <disp_str_colour>
c0107874:	83 c4 10             	add    $0x10,%esp
c0107877:	90                   	nop
c0107878:	c9                   	leave  
c0107879:	c3                   	ret    

c010787a <init_keyboard>:
c010787a:	55                   	push   %ebp
c010787b:	89 e5                	mov    %esp,%ebp
c010787d:	83 ec 08             	sub    $0x8,%esp
c0107880:	83 ec 04             	sub    $0x4,%esp
c0107883:	68 00 02 00 00       	push   $0x200
c0107888:	6a 00                	push   $0x0
c010788a:	68 ec fb 10 c0       	push   $0xc010fbec
c010788f:	e8 db 49 00 00       	call   c010c26f <Memset>
c0107894:	83 c4 10             	add    $0x10,%esp
c0107897:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010789e:	fb 10 c0 
c01078a1:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01078a6:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01078ab:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c01078b2:	00 00 00 
c01078b5:	e8 4f d3 ff ff       	call   c0104c09 <init_keyboard_handler>
c01078ba:	90                   	nop
c01078bb:	c9                   	leave  
c01078bc:	c3                   	ret    

c01078bd <TestTTY>:
c01078bd:	55                   	push   %ebp
c01078be:	89 e5                	mov    %esp,%ebp
c01078c0:	83 ec 28             	sub    $0x28,%esp
c01078c3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01078ca:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01078d1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01078d7:	83 ec 08             	sub    $0x8,%esp
c01078da:	6a 02                	push   $0x2
c01078dc:	8d 45 de             	lea    -0x22(%ebp),%eax
c01078df:	50                   	push   %eax
c01078e0:	e8 ca d4 ff ff       	call   c0104daf <open>
c01078e5:	83 c4 10             	add    $0x10,%esp
c01078e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01078eb:	83 ec 08             	sub    $0x8,%esp
c01078ee:	6a 02                	push   $0x2
c01078f0:	8d 45 de             	lea    -0x22(%ebp),%eax
c01078f3:	50                   	push   %eax
c01078f4:	e8 b6 d4 ff ff       	call   c0104daf <open>
c01078f9:	83 c4 10             	add    $0x10,%esp
c01078fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01078ff:	83 ec 0c             	sub    $0xc,%esp
c0107902:	68 d9 ba 10 c0       	push   $0xc010bad9
c0107907:	e8 ec 0e 00 00       	call   c01087f8 <Printf>
c010790c:	83 c4 10             	add    $0x10,%esp
c010790f:	83 ec 0c             	sub    $0xc,%esp
c0107912:	6a 0a                	push   $0xa
c0107914:	e8 73 9f ff ff       	call   c010188c <sys_malloc>
c0107919:	83 c4 10             	add    $0x10,%esp
c010791c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010791f:	83 ec 04             	sub    $0x4,%esp
c0107922:	6a 0a                	push   $0xa
c0107924:	6a 00                	push   $0x0
c0107926:	ff 75 ec             	pushl  -0x14(%ebp)
c0107929:	e8 41 49 00 00       	call   c010c26f <Memset>
c010792e:	83 c4 10             	add    $0x10,%esp
c0107931:	83 ec 04             	sub    $0x4,%esp
c0107934:	6a 0a                	push   $0xa
c0107936:	ff 75 ec             	pushl  -0x14(%ebp)
c0107939:	ff 75 f0             	pushl  -0x10(%ebp)
c010793c:	e8 03 d5 ff ff       	call   c0104e44 <read>
c0107941:	83 c4 10             	add    $0x10,%esp
c0107944:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107947:	83 ec 08             	sub    $0x8,%esp
c010794a:	ff 75 ec             	pushl  -0x14(%ebp)
c010794d:	68 eb ba 10 c0       	push   $0xc010baeb
c0107952:	e8 a1 0e 00 00       	call   c01087f8 <Printf>
c0107957:	83 c4 10             	add    $0x10,%esp
c010795a:	eb c3                	jmp    c010791f <TestTTY+0x62>

c010795c <TestReadReturnValue>:
c010795c:	55                   	push   %ebp
c010795d:	89 e5                	mov    %esp,%ebp
c010795f:	81 ec 18 02 00 00    	sub    $0x218,%esp
c0107965:	c7 45 f4 f5 ba 10 c0 	movl   $0xc010baf5,-0xc(%ebp)
c010796c:	83 ec 08             	sub    $0x8,%esp
c010796f:	6a 00                	push   $0x0
c0107971:	ff 75 f4             	pushl  -0xc(%ebp)
c0107974:	e8 36 d4 ff ff       	call   c0104daf <open>
c0107979:	83 c4 10             	add    $0x10,%esp
c010797c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010797f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107986:	83 ec 04             	sub    $0x4,%esp
c0107989:	68 cb 00 00 00       	push   $0xcb
c010798e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0107994:	50                   	push   %eax
c0107995:	ff 75 f0             	pushl  -0x10(%ebp)
c0107998:	e8 a7 d4 ff ff       	call   c0104e44 <read>
c010799d:	83 c4 10             	add    $0x10,%esp
c01079a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01079a3:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c01079aa:	74 1c                	je     c01079c8 <TestReadReturnValue+0x6c>
c01079ac:	68 08 02 00 00       	push   $0x208
c01079b1:	68 01 bb 10 c0       	push   $0xc010bb01
c01079b6:	68 01 bb 10 c0       	push   $0xc010bb01
c01079bb:	68 11 bb 10 c0       	push   $0xc010bb11
c01079c0:	e8 90 11 00 00       	call   c0108b55 <assertion_failure>
c01079c5:	83 c4 10             	add    $0x10,%esp
c01079c8:	83 ec 0c             	sub    $0xc,%esp
c01079cb:	ff 75 f0             	pushl  -0x10(%ebp)
c01079ce:	e8 77 d6 ff ff       	call   c010504a <close>
c01079d3:	83 c4 10             	add    $0x10,%esp
c01079d6:	90                   	nop
c01079d7:	c9                   	leave  
c01079d8:	c3                   	ret    

c01079d9 <TestWriteReturnValue>:
c01079d9:	55                   	push   %ebp
c01079da:	89 e5                	mov    %esp,%ebp
c01079dc:	81 ec 28 02 00 00    	sub    $0x228,%esp
c01079e2:	c7 45 f4 1c bb 10 c0 	movl   $0xc010bb1c,-0xc(%ebp)
c01079e9:	83 ec 08             	sub    $0x8,%esp
c01079ec:	6a 07                	push   $0x7
c01079ee:	ff 75 f4             	pushl  -0xc(%ebp)
c01079f1:	e8 b9 d3 ff ff       	call   c0104daf <open>
c01079f6:	83 c4 10             	add    $0x10,%esp
c01079f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01079fc:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c0107a00:	75 1c                	jne    c0107a1e <TestWriteReturnValue+0x45>
c0107a02:	68 12 02 00 00       	push   $0x212
c0107a07:	68 01 bb 10 c0       	push   $0xc010bb01
c0107a0c:	68 01 bb 10 c0       	push   $0xc010bb01
c0107a11:	68 29 bb 10 c0       	push   $0xc010bb29
c0107a16:	e8 3a 11 00 00       	call   c0108b55 <assertion_failure>
c0107a1b:	83 c4 10             	add    $0x10,%esp
c0107a1e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107a25:	c7 45 e8 34 bb 10 c0 	movl   $0xc010bb34,-0x18(%ebp)
c0107a2c:	83 ec 0c             	sub    $0xc,%esp
c0107a2f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107a32:	e8 71 48 00 00       	call   c010c2a8 <Strlen>
c0107a37:	83 c4 10             	add    $0x10,%esp
c0107a3a:	83 ec 04             	sub    $0x4,%esp
c0107a3d:	50                   	push   %eax
c0107a3e:	ff 75 e8             	pushl  -0x18(%ebp)
c0107a41:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107a47:	50                   	push   %eax
c0107a48:	e8 ef f4 ff ff       	call   c0106f3c <Memcpy>
c0107a4d:	83 c4 10             	add    $0x10,%esp
c0107a50:	83 ec 04             	sub    $0x4,%esp
c0107a53:	68 ff 01 00 00       	push   $0x1ff
c0107a58:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107a5e:	50                   	push   %eax
c0107a5f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107a62:	e8 5e d5 ff ff       	call   c0104fc5 <write>
c0107a67:	83 c4 10             	add    $0x10,%esp
c0107a6a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107a6d:	83 ec 0c             	sub    $0xc,%esp
c0107a70:	ff 75 e8             	pushl  -0x18(%ebp)
c0107a73:	e8 30 48 00 00       	call   c010c2a8 <Strlen>
c0107a78:	83 c4 10             	add    $0x10,%esp
c0107a7b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0107a7e:	74 1c                	je     c0107a9c <TestWriteReturnValue+0xc3>
c0107a80:	68 1c 02 00 00       	push   $0x21c
c0107a85:	68 01 bb 10 c0       	push   $0xc010bb01
c0107a8a:	68 01 bb 10 c0       	push   $0xc010bb01
c0107a8f:	68 67 bb 10 c0       	push   $0xc010bb67
c0107a94:	e8 bc 10 00 00       	call   c0108b55 <assertion_failure>
c0107a99:	83 c4 10             	add    $0x10,%esp
c0107a9c:	83 ec 0c             	sub    $0xc,%esp
c0107a9f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107aa2:	e8 a3 d5 ff ff       	call   c010504a <close>
c0107aa7:	83 c4 10             	add    $0x10,%esp
c0107aaa:	90                   	nop
c0107aab:	c9                   	leave  
c0107aac:	c3                   	ret    

c0107aad <TestFS2>:
c0107aad:	55                   	push   %ebp
c0107aae:	89 e5                	mov    %esp,%ebp
c0107ab0:	83 ec 08             	sub    $0x8,%esp
c0107ab3:	e8 21 ff ff ff       	call   c01079d9 <TestWriteReturnValue>
c0107ab8:	90                   	nop
c0107ab9:	c9                   	leave  
c0107aba:	c3                   	ret    

c0107abb <TestFS>:
c0107abb:	55                   	push   %ebp
c0107abc:	89 e5                	mov    %esp,%ebp
c0107abe:	57                   	push   %edi
c0107abf:	56                   	push   %esi
c0107ac0:	53                   	push   %ebx
c0107ac1:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c0107ac7:	83 ec 0c             	sub    $0xc,%esp
c0107aca:	68 7a bb 10 c0       	push   $0xc010bb7a
c0107acf:	e8 05 86 ff ff       	call   c01000d9 <disp_str>
c0107ad4:	83 c4 10             	add    $0x10,%esp
c0107ad7:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c0107ade:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107ae5:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c0107aeb:	83 ec 08             	sub    $0x8,%esp
c0107aee:	6a 02                	push   $0x2
c0107af0:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107af3:	50                   	push   %eax
c0107af4:	e8 b6 d2 ff ff       	call   c0104daf <open>
c0107af9:	83 c4 10             	add    $0x10,%esp
c0107afc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107aff:	83 ec 08             	sub    $0x8,%esp
c0107b02:	6a 02                	push   $0x2
c0107b04:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107b07:	50                   	push   %eax
c0107b08:	e8 a2 d2 ff ff       	call   c0104daf <open>
c0107b0d:	83 c4 10             	add    $0x10,%esp
c0107b10:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107b13:	83 ec 0c             	sub    $0xc,%esp
c0107b16:	68 d9 ba 10 c0       	push   $0xc010bad9
c0107b1b:	e8 d8 0c 00 00       	call   c01087f8 <Printf>
c0107b20:	83 c4 10             	add    $0x10,%esp
c0107b23:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c0107b2a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c0107b2e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c0107b35:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c0107b39:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c0107b40:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c0107b47:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c0107b4d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c0107b54:	83 ec 0c             	sub    $0xc,%esp
c0107b57:	68 82 bb 10 c0       	push   $0xc010bb82
c0107b5c:	e8 97 0c 00 00       	call   c01087f8 <Printf>
c0107b61:	83 c4 10             	add    $0x10,%esp
c0107b64:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c0107b68:	0f 85 e6 03 00 00    	jne    c0107f54 <TestFS+0x499>
c0107b6e:	83 ec 08             	sub    $0x8,%esp
c0107b71:	6a 07                	push   $0x7
c0107b73:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107b76:	50                   	push   %eax
c0107b77:	e8 33 d2 ff ff       	call   c0104daf <open>
c0107b7c:	83 c4 10             	add    $0x10,%esp
c0107b7f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107b82:	83 ec 08             	sub    $0x8,%esp
c0107b85:	ff 75 d0             	pushl  -0x30(%ebp)
c0107b88:	68 9a bb 10 c0       	push   $0xc010bb9a
c0107b8d:	e8 66 0c 00 00       	call   c01087f8 <Printf>
c0107b92:	83 c4 10             	add    $0x10,%esp
c0107b95:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107b9c:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107ba3:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c0107baa:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107bb1:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107bb8:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c0107bbf:	83 ec 0c             	sub    $0xc,%esp
c0107bc2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107bc5:	50                   	push   %eax
c0107bc6:	e8 dd 46 00 00       	call   c010c2a8 <Strlen>
c0107bcb:	83 c4 10             	add    $0x10,%esp
c0107bce:	83 ec 04             	sub    $0x4,%esp
c0107bd1:	50                   	push   %eax
c0107bd2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107bd5:	50                   	push   %eax
c0107bd6:	ff 75 d0             	pushl  -0x30(%ebp)
c0107bd9:	e8 e7 d3 ff ff       	call   c0104fc5 <write>
c0107bde:	83 c4 10             	add    $0x10,%esp
c0107be1:	83 ec 0c             	sub    $0xc,%esp
c0107be4:	ff 75 d0             	pushl  -0x30(%ebp)
c0107be7:	e8 5e d4 ff ff       	call   c010504a <close>
c0107bec:	83 c4 10             	add    $0x10,%esp
c0107bef:	83 ec 08             	sub    $0x8,%esp
c0107bf2:	6a 00                	push   $0x0
c0107bf4:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107bf7:	50                   	push   %eax
c0107bf8:	e8 b2 d1 ff ff       	call   c0104daf <open>
c0107bfd:	83 c4 10             	add    $0x10,%esp
c0107c00:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107c03:	83 ec 04             	sub    $0x4,%esp
c0107c06:	6a 14                	push   $0x14
c0107c08:	6a 00                	push   $0x0
c0107c0a:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107c10:	50                   	push   %eax
c0107c11:	e8 59 46 00 00       	call   c010c26f <Memset>
c0107c16:	83 c4 10             	add    $0x10,%esp
c0107c19:	83 ec 04             	sub    $0x4,%esp
c0107c1c:	6a 12                	push   $0x12
c0107c1e:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107c24:	50                   	push   %eax
c0107c25:	ff 75 d0             	pushl  -0x30(%ebp)
c0107c28:	e8 17 d2 ff ff       	call   c0104e44 <read>
c0107c2d:	83 c4 10             	add    $0x10,%esp
c0107c30:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107c33:	83 ec 08             	sub    $0x8,%esp
c0107c36:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107c3c:	50                   	push   %eax
c0107c3d:	68 a3 bb 10 c0       	push   $0xc010bba3
c0107c42:	e8 b1 0b 00 00       	call   c01087f8 <Printf>
c0107c47:	83 c4 10             	add    $0x10,%esp
c0107c4a:	83 ec 0c             	sub    $0xc,%esp
c0107c4d:	6a 0a                	push   $0xa
c0107c4f:	e8 70 0a 00 00       	call   c01086c4 <delay>
c0107c54:	83 c4 10             	add    $0x10,%esp
c0107c57:	83 ec 08             	sub    $0x8,%esp
c0107c5a:	6a 07                	push   $0x7
c0107c5c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107c5f:	50                   	push   %eax
c0107c60:	e8 4a d1 ff ff       	call   c0104daf <open>
c0107c65:	83 c4 10             	add    $0x10,%esp
c0107c68:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107c6b:	83 ec 08             	sub    $0x8,%esp
c0107c6e:	ff 75 c8             	pushl  -0x38(%ebp)
c0107c71:	68 ae bb 10 c0       	push   $0xc010bbae
c0107c76:	e8 7d 0b 00 00       	call   c01087f8 <Printf>
c0107c7b:	83 c4 10             	add    $0x10,%esp
c0107c7e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107c85:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107c8b:	bb e4 bb 10 c0       	mov    $0xc010bbe4,%ebx
c0107c90:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107c95:	8b 0b                	mov    (%ebx),%ecx
c0107c97:	89 08                	mov    %ecx,(%eax)
c0107c99:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107c9d:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107ca1:	8d 78 04             	lea    0x4(%eax),%edi
c0107ca4:	83 e7 fc             	and    $0xfffffffc,%edi
c0107ca7:	29 f8                	sub    %edi,%eax
c0107ca9:	29 c3                	sub    %eax,%ebx
c0107cab:	01 c2                	add    %eax,%edx
c0107cad:	83 e2 fc             	and    $0xfffffffc,%edx
c0107cb0:	89 d0                	mov    %edx,%eax
c0107cb2:	c1 e8 02             	shr    $0x2,%eax
c0107cb5:	89 de                	mov    %ebx,%esi
c0107cb7:	89 c1                	mov    %eax,%ecx
c0107cb9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107cbb:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107cc2:	00 00 00 
c0107cc5:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107ccc:	00 00 00 
c0107ccf:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107cd6:	83 ec 0c             	sub    $0xc,%esp
c0107cd9:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107cdf:	50                   	push   %eax
c0107ce0:	e8 c3 45 00 00       	call   c010c2a8 <Strlen>
c0107ce5:	83 c4 10             	add    $0x10,%esp
c0107ce8:	83 ec 04             	sub    $0x4,%esp
c0107ceb:	50                   	push   %eax
c0107cec:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107cf2:	50                   	push   %eax
c0107cf3:	ff 75 c8             	pushl  -0x38(%ebp)
c0107cf6:	e8 ca d2 ff ff       	call   c0104fc5 <write>
c0107cfb:	83 c4 10             	add    $0x10,%esp
c0107cfe:	83 ec 0c             	sub    $0xc,%esp
c0107d01:	ff 75 c8             	pushl  -0x38(%ebp)
c0107d04:	e8 41 d3 ff ff       	call   c010504a <close>
c0107d09:	83 c4 10             	add    $0x10,%esp
c0107d0c:	83 ec 08             	sub    $0x8,%esp
c0107d0f:	6a 00                	push   $0x0
c0107d11:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107d14:	50                   	push   %eax
c0107d15:	e8 95 d0 ff ff       	call   c0104daf <open>
c0107d1a:	83 c4 10             	add    $0x10,%esp
c0107d1d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107d20:	83 ec 04             	sub    $0x4,%esp
c0107d23:	68 c8 00 00 00       	push   $0xc8
c0107d28:	6a 00                	push   $0x0
c0107d2a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107d30:	50                   	push   %eax
c0107d31:	e8 39 45 00 00       	call   c010c26f <Memset>
c0107d36:	83 c4 10             	add    $0x10,%esp
c0107d39:	83 ec 0c             	sub    $0xc,%esp
c0107d3c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107d42:	50                   	push   %eax
c0107d43:	e8 60 45 00 00       	call   c010c2a8 <Strlen>
c0107d48:	83 c4 10             	add    $0x10,%esp
c0107d4b:	83 ec 04             	sub    $0x4,%esp
c0107d4e:	50                   	push   %eax
c0107d4f:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107d55:	50                   	push   %eax
c0107d56:	ff 75 c8             	pushl  -0x38(%ebp)
c0107d59:	e8 e6 d0 ff ff       	call   c0104e44 <read>
c0107d5e:	83 c4 10             	add    $0x10,%esp
c0107d61:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107d64:	83 ec 08             	sub    $0x8,%esp
c0107d67:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107d6d:	50                   	push   %eax
c0107d6e:	68 b8 bb 10 c0       	push   $0xc010bbb8
c0107d73:	e8 80 0a 00 00       	call   c01087f8 <Printf>
c0107d78:	83 c4 10             	add    $0x10,%esp
c0107d7b:	83 ec 08             	sub    $0x8,%esp
c0107d7e:	6a 07                	push   $0x7
c0107d80:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107d83:	50                   	push   %eax
c0107d84:	e8 26 d0 ff ff       	call   c0104daf <open>
c0107d89:	83 c4 10             	add    $0x10,%esp
c0107d8c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107d8f:	83 ec 08             	sub    $0x8,%esp
c0107d92:	ff 75 c8             	pushl  -0x38(%ebp)
c0107d95:	68 ae bb 10 c0       	push   $0xc010bbae
c0107d9a:	e8 59 0a 00 00       	call   c01087f8 <Printf>
c0107d9f:	83 c4 10             	add    $0x10,%esp
c0107da2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107da9:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107db0:	20 77 69 
c0107db3:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107dba:	6c 20 73 
c0107dbd:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107dc4:	63 63 65 
c0107dc7:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107dce:	73 20 61 
c0107dd1:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107dd8:	20 6c 61 
c0107ddb:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107de2:	74 2e 00 
c0107de5:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107dec:	00 00 00 
c0107def:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107df6:	00 00 
c0107df8:	83 ec 0c             	sub    $0xc,%esp
c0107dfb:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107e01:	50                   	push   %eax
c0107e02:	e8 a1 44 00 00       	call   c010c2a8 <Strlen>
c0107e07:	83 c4 10             	add    $0x10,%esp
c0107e0a:	83 ec 04             	sub    $0x4,%esp
c0107e0d:	50                   	push   %eax
c0107e0e:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107e14:	50                   	push   %eax
c0107e15:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107e18:	e8 a8 d1 ff ff       	call   c0104fc5 <write>
c0107e1d:	83 c4 10             	add    $0x10,%esp
c0107e20:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107e27:	eb 7e                	jmp    c0107ea7 <TestFS+0x3ec>
c0107e29:	83 ec 0c             	sub    $0xc,%esp
c0107e2c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107e2f:	e8 16 d2 ff ff       	call   c010504a <close>
c0107e34:	83 c4 10             	add    $0x10,%esp
c0107e37:	83 ec 08             	sub    $0x8,%esp
c0107e3a:	6a 00                	push   $0x0
c0107e3c:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107e3f:	50                   	push   %eax
c0107e40:	e8 6a cf ff ff       	call   c0104daf <open>
c0107e45:	83 c4 10             	add    $0x10,%esp
c0107e48:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107e4b:	83 ec 04             	sub    $0x4,%esp
c0107e4e:	6a 1e                	push   $0x1e
c0107e50:	6a 00                	push   $0x0
c0107e52:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107e58:	50                   	push   %eax
c0107e59:	e8 11 44 00 00       	call   c010c26f <Memset>
c0107e5e:	83 c4 10             	add    $0x10,%esp
c0107e61:	83 ec 0c             	sub    $0xc,%esp
c0107e64:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107e6a:	50                   	push   %eax
c0107e6b:	e8 38 44 00 00       	call   c010c2a8 <Strlen>
c0107e70:	83 c4 10             	add    $0x10,%esp
c0107e73:	83 ec 04             	sub    $0x4,%esp
c0107e76:	50                   	push   %eax
c0107e77:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107e7d:	50                   	push   %eax
c0107e7e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107e81:	e8 be cf ff ff       	call   c0104e44 <read>
c0107e86:	83 c4 10             	add    $0x10,%esp
c0107e89:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107e8c:	83 ec 08             	sub    $0x8,%esp
c0107e8f:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107e95:	50                   	push   %eax
c0107e96:	68 c3 bb 10 c0       	push   $0xc010bbc3
c0107e9b:	e8 58 09 00 00       	call   c01087f8 <Printf>
c0107ea0:	83 c4 10             	add    $0x10,%esp
c0107ea3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107ea7:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107eab:	0f 8e 78 ff ff ff    	jle    c0107e29 <TestFS+0x36e>
c0107eb1:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107eb8:	6e 73 74 
c0107ebb:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107ec2:	6c 6c 2e 
c0107ec5:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107ecc:	61 72 00 
c0107ecf:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107ed6:	00 00 00 
c0107ed9:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107ee0:	00 00 00 
c0107ee3:	83 ec 08             	sub    $0x8,%esp
c0107ee6:	6a 00                	push   $0x0
c0107ee8:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107eee:	50                   	push   %eax
c0107eef:	e8 bb ce ff ff       	call   c0104daf <open>
c0107ef4:	83 c4 10             	add    $0x10,%esp
c0107ef7:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107efa:	83 ec 08             	sub    $0x8,%esp
c0107efd:	ff 75 bc             	pushl  -0x44(%ebp)
c0107f00:	68 ce bb 10 c0       	push   $0xc010bbce
c0107f05:	e8 ee 08 00 00       	call   c01087f8 <Printf>
c0107f0a:	83 c4 10             	add    $0x10,%esp
c0107f0d:	83 ec 04             	sub    $0x4,%esp
c0107f10:	6a 28                	push   $0x28
c0107f12:	6a 00                	push   $0x0
c0107f14:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107f1a:	50                   	push   %eax
c0107f1b:	e8 4f 43 00 00       	call   c010c26f <Memset>
c0107f20:	83 c4 10             	add    $0x10,%esp
c0107f23:	83 ec 04             	sub    $0x4,%esp
c0107f26:	6a 28                	push   $0x28
c0107f28:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107f2e:	50                   	push   %eax
c0107f2f:	ff 75 bc             	pushl  -0x44(%ebp)
c0107f32:	e8 0d cf ff ff       	call   c0104e44 <read>
c0107f37:	83 c4 10             	add    $0x10,%esp
c0107f3a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107f3d:	83 ec 08             	sub    $0x8,%esp
c0107f40:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107f46:	50                   	push   %eax
c0107f47:	68 d8 bb 10 c0       	push   $0xc010bbd8
c0107f4c:	e8 a7 08 00 00       	call   c01087f8 <Printf>
c0107f51:	83 c4 10             	add    $0x10,%esp
c0107f54:	90                   	nop
c0107f55:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107f58:	5b                   	pop    %ebx
c0107f59:	5e                   	pop    %esi
c0107f5a:	5f                   	pop    %edi
c0107f5b:	5d                   	pop    %ebp
c0107f5c:	c3                   	ret    

c0107f5d <wait_exit>:
c0107f5d:	55                   	push   %ebp
c0107f5e:	89 e5                	mov    %esp,%ebp
c0107f60:	83 ec 28             	sub    $0x28,%esp
c0107f63:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107f6a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107f71:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107f77:	83 ec 08             	sub    $0x8,%esp
c0107f7a:	6a 02                	push   $0x2
c0107f7c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107f7f:	50                   	push   %eax
c0107f80:	e8 2a ce ff ff       	call   c0104daf <open>
c0107f85:	83 c4 10             	add    $0x10,%esp
c0107f88:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107f8b:	83 ec 08             	sub    $0x8,%esp
c0107f8e:	6a 02                	push   $0x2
c0107f90:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107f93:	50                   	push   %eax
c0107f94:	e8 16 ce ff ff       	call   c0104daf <open>
c0107f99:	83 c4 10             	add    $0x10,%esp
c0107f9c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107f9f:	e8 6b d1 ff ff       	call   c010510f <fork>
c0107fa4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107fa7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107fab:	7e 35                	jle    c0107fe2 <wait_exit+0x85>
c0107fad:	83 ec 0c             	sub    $0xc,%esp
c0107fb0:	68 ac bc 10 c0       	push   $0xc010bcac
c0107fb5:	e8 3e 08 00 00       	call   c01087f8 <Printf>
c0107fba:	83 c4 10             	add    $0x10,%esp
c0107fbd:	83 ec 0c             	sub    $0xc,%esp
c0107fc0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107fc3:	50                   	push   %eax
c0107fc4:	e8 d3 d0 ff ff       	call   c010509c <wait>
c0107fc9:	83 c4 10             	add    $0x10,%esp
c0107fcc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107fcf:	83 ec 08             	sub    $0x8,%esp
c0107fd2:	50                   	push   %eax
c0107fd3:	68 c4 bc 10 c0       	push   $0xc010bcc4
c0107fd8:	e8 1b 08 00 00       	call   c01087f8 <Printf>
c0107fdd:	83 c4 10             	add    $0x10,%esp
c0107fe0:	eb fe                	jmp    c0107fe0 <wait_exit+0x83>
c0107fe2:	83 ec 0c             	sub    $0xc,%esp
c0107fe5:	68 df bc 10 c0       	push   $0xc010bcdf
c0107fea:	e8 09 08 00 00       	call   c01087f8 <Printf>
c0107fef:	83 c4 10             	add    $0x10,%esp
c0107ff2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107ff9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107ffc:	8d 50 01             	lea    0x1(%eax),%edx
c0107fff:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0108002:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0108007:	7f 02                	jg     c010800b <wait_exit+0xae>
c0108009:	eb ee                	jmp    c0107ff9 <wait_exit+0x9c>
c010800b:	90                   	nop
c010800c:	83 ec 0c             	sub    $0xc,%esp
c010800f:	68 eb bc 10 c0       	push   $0xc010bceb
c0108014:	e8 df 07 00 00       	call   c01087f8 <Printf>
c0108019:	83 c4 10             	add    $0x10,%esp
c010801c:	83 ec 0c             	sub    $0xc,%esp
c010801f:	68 f9 bc 10 c0       	push   $0xc010bcf9
c0108024:	e8 cf 07 00 00       	call   c01087f8 <Printf>
c0108029:	83 c4 10             	add    $0x10,%esp
c010802c:	83 ec 0c             	sub    $0xc,%esp
c010802f:	68 08 bd 10 c0       	push   $0xc010bd08
c0108034:	e8 bf 07 00 00       	call   c01087f8 <Printf>
c0108039:	83 c4 10             	add    $0x10,%esp
c010803c:	83 ec 0c             	sub    $0xc,%esp
c010803f:	6a 5a                	push   $0x5a
c0108041:	e8 9a d0 ff ff       	call   c01050e0 <exit>
c0108046:	83 c4 10             	add    $0x10,%esp
c0108049:	83 ec 0c             	sub    $0xc,%esp
c010804c:	68 17 bd 10 c0       	push   $0xc010bd17
c0108051:	e8 a2 07 00 00       	call   c01087f8 <Printf>
c0108056:	83 c4 10             	add    $0x10,%esp
c0108059:	eb fe                	jmp    c0108059 <wait_exit+0xfc>

c010805b <INIT_fork>:
c010805b:	55                   	push   %ebp
c010805c:	89 e5                	mov    %esp,%ebp
c010805e:	83 ec 78             	sub    $0x78,%esp
c0108061:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0108068:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c010806f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0108075:	83 ec 08             	sub    $0x8,%esp
c0108078:	6a 02                	push   $0x2
c010807a:	8d 45 de             	lea    -0x22(%ebp),%eax
c010807d:	50                   	push   %eax
c010807e:	e8 2c cd ff ff       	call   c0104daf <open>
c0108083:	83 c4 10             	add    $0x10,%esp
c0108086:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108089:	83 ec 08             	sub    $0x8,%esp
c010808c:	6a 02                	push   $0x2
c010808e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0108091:	50                   	push   %eax
c0108092:	e8 18 cd ff ff       	call   c0104daf <open>
c0108097:	83 c4 10             	add    $0x10,%esp
c010809a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010809d:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c01080a4:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c01080ab:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c01080b2:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c01080b9:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c01080c0:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c01080c7:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c01080ce:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c01080d5:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c01080dc:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c01080e3:	83 ec 0c             	sub    $0xc,%esp
c01080e6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080e9:	50                   	push   %eax
c01080ea:	e8 09 07 00 00       	call   c01087f8 <Printf>
c01080ef:	83 c4 10             	add    $0x10,%esp
c01080f2:	83 ec 0c             	sub    $0xc,%esp
c01080f5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080f8:	50                   	push   %eax
c01080f9:	e8 aa 41 00 00       	call   c010c2a8 <Strlen>
c01080fe:	83 c4 10             	add    $0x10,%esp
c0108101:	83 ec 04             	sub    $0x4,%esp
c0108104:	50                   	push   %eax
c0108105:	6a 00                	push   $0x0
c0108107:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010810a:	50                   	push   %eax
c010810b:	e8 5f 41 00 00       	call   c010c26f <Memset>
c0108110:	83 c4 10             	add    $0x10,%esp
c0108113:	83 ec 04             	sub    $0x4,%esp
c0108116:	6a 28                	push   $0x28
c0108118:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010811b:	50                   	push   %eax
c010811c:	ff 75 f0             	pushl  -0x10(%ebp)
c010811f:	e8 20 cd ff ff       	call   c0104e44 <read>
c0108124:	83 c4 10             	add    $0x10,%esp
c0108127:	83 ec 0c             	sub    $0xc,%esp
c010812a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010812d:	50                   	push   %eax
c010812e:	e8 c5 06 00 00       	call   c01087f8 <Printf>
c0108133:	83 c4 10             	add    $0x10,%esp
c0108136:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010813d:	e8 cd cf ff ff       	call   c010510f <fork>
c0108142:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108145:	83 ec 0c             	sub    $0xc,%esp
c0108148:	6a 01                	push   $0x1
c010814a:	e8 75 05 00 00       	call   c01086c4 <delay>
c010814f:	83 c4 10             	add    $0x10,%esp
c0108152:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108156:	0f 8e cd 00 00 00    	jle    c0108229 <INIT_fork+0x1ce>
c010815c:	83 ec 08             	sub    $0x8,%esp
c010815f:	ff 75 e8             	pushl  -0x18(%ebp)
c0108162:	68 25 bd 10 c0       	push   $0xc010bd25
c0108167:	e8 8c 06 00 00       	call   c01087f8 <Printf>
c010816c:	83 c4 10             	add    $0x10,%esp
c010816f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0108173:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c010817a:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0108181:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0108188:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c010818f:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0108196:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c010819d:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c01081a4:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c01081ab:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c01081b2:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c01081b9:	83 ec 0c             	sub    $0xc,%esp
c01081bc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01081bf:	50                   	push   %eax
c01081c0:	e8 e3 40 00 00       	call   c010c2a8 <Strlen>
c01081c5:	83 c4 10             	add    $0x10,%esp
c01081c8:	83 ec 04             	sub    $0x4,%esp
c01081cb:	50                   	push   %eax
c01081cc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01081cf:	50                   	push   %eax
c01081d0:	ff 75 f4             	pushl  -0xc(%ebp)
c01081d3:	e8 ed cd ff ff       	call   c0104fc5 <write>
c01081d8:	83 c4 10             	add    $0x10,%esp
c01081db:	e8 b2 ec ff ff       	call   c0106e92 <catch_error>
c01081e0:	83 ec 0c             	sub    $0xc,%esp
c01081e3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01081e6:	50                   	push   %eax
c01081e7:	e8 bc 40 00 00       	call   c010c2a8 <Strlen>
c01081ec:	83 c4 10             	add    $0x10,%esp
c01081ef:	83 ec 04             	sub    $0x4,%esp
c01081f2:	50                   	push   %eax
c01081f3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01081f6:	50                   	push   %eax
c01081f7:	ff 75 f4             	pushl  -0xc(%ebp)
c01081fa:	e8 c6 cd ff ff       	call   c0104fc5 <write>
c01081ff:	83 c4 10             	add    $0x10,%esp
c0108202:	83 ec 0c             	sub    $0xc,%esp
c0108205:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108208:	50                   	push   %eax
c0108209:	e8 9a 40 00 00       	call   c010c2a8 <Strlen>
c010820e:	83 c4 10             	add    $0x10,%esp
c0108211:	83 ec 04             	sub    $0x4,%esp
c0108214:	50                   	push   %eax
c0108215:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108218:	50                   	push   %eax
c0108219:	ff 75 f4             	pushl  -0xc(%ebp)
c010821c:	e8 a4 cd ff ff       	call   c0104fc5 <write>
c0108221:	83 c4 10             	add    $0x10,%esp
c0108224:	e9 d6 00 00 00       	jmp    c01082ff <INIT_fork+0x2a4>
c0108229:	83 ec 08             	sub    $0x8,%esp
c010822c:	ff 75 e8             	pushl  -0x18(%ebp)
c010822f:	68 25 bd 10 c0       	push   $0xc010bd25
c0108234:	e8 bf 05 00 00       	call   c01087f8 <Printf>
c0108239:	83 c4 10             	add    $0x10,%esp
c010823c:	83 ec 0c             	sub    $0xc,%esp
c010823f:	6a 01                	push   $0x1
c0108241:	e8 7e 04 00 00       	call   c01086c4 <delay>
c0108246:	83 c4 10             	add    $0x10,%esp
c0108249:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010824d:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0108251:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0108258:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c010825f:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0108266:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c010826d:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0108274:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c010827b:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0108282:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0108289:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108290:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108297:	83 ec 0c             	sub    $0xc,%esp
c010829a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010829d:	50                   	push   %eax
c010829e:	e8 05 40 00 00       	call   c010c2a8 <Strlen>
c01082a3:	83 c4 10             	add    $0x10,%esp
c01082a6:	83 ec 04             	sub    $0x4,%esp
c01082a9:	50                   	push   %eax
c01082aa:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082ad:	50                   	push   %eax
c01082ae:	ff 75 f4             	pushl  -0xc(%ebp)
c01082b1:	e8 0f cd ff ff       	call   c0104fc5 <write>
c01082b6:	83 c4 10             	add    $0x10,%esp
c01082b9:	83 ec 0c             	sub    $0xc,%esp
c01082bc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082bf:	50                   	push   %eax
c01082c0:	e8 e3 3f 00 00       	call   c010c2a8 <Strlen>
c01082c5:	83 c4 10             	add    $0x10,%esp
c01082c8:	83 ec 04             	sub    $0x4,%esp
c01082cb:	50                   	push   %eax
c01082cc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082cf:	50                   	push   %eax
c01082d0:	ff 75 f4             	pushl  -0xc(%ebp)
c01082d3:	e8 ed cc ff ff       	call   c0104fc5 <write>
c01082d8:	83 c4 10             	add    $0x10,%esp
c01082db:	83 ec 0c             	sub    $0xc,%esp
c01082de:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082e1:	50                   	push   %eax
c01082e2:	e8 c1 3f 00 00       	call   c010c2a8 <Strlen>
c01082e7:	83 c4 10             	add    $0x10,%esp
c01082ea:	83 ec 04             	sub    $0x4,%esp
c01082ed:	50                   	push   %eax
c01082ee:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082f1:	50                   	push   %eax
c01082f2:	ff 75 f4             	pushl  -0xc(%ebp)
c01082f5:	e8 cb cc ff ff       	call   c0104fc5 <write>
c01082fa:	83 c4 10             	add    $0x10,%esp
c01082fd:	eb fe                	jmp    c01082fd <INIT_fork+0x2a2>
c01082ff:	83 ec 04             	sub    $0x4,%esp
c0108302:	6a 28                	push   $0x28
c0108304:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108307:	50                   	push   %eax
c0108308:	ff 75 f0             	pushl  -0x10(%ebp)
c010830b:	e8 34 cb ff ff       	call   c0104e44 <read>
c0108310:	83 c4 10             	add    $0x10,%esp
c0108313:	83 ec 0c             	sub    $0xc,%esp
c0108316:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108319:	50                   	push   %eax
c010831a:	e8 d9 04 00 00       	call   c01087f8 <Printf>
c010831f:	83 c4 10             	add    $0x10,%esp
c0108322:	83 ec 0c             	sub    $0xc,%esp
c0108325:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108328:	50                   	push   %eax
c0108329:	e8 ca 04 00 00       	call   c01087f8 <Printf>
c010832e:	83 c4 10             	add    $0x10,%esp
c0108331:	83 ec 0c             	sub    $0xc,%esp
c0108334:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108337:	50                   	push   %eax
c0108338:	e8 bb 04 00 00       	call   c01087f8 <Printf>
c010833d:	83 c4 10             	add    $0x10,%esp
c0108340:	83 ec 0c             	sub    $0xc,%esp
c0108343:	68 2f bd 10 c0       	push   $0xc010bd2f
c0108348:	e8 c4 07 00 00       	call   c0108b11 <spin>
c010834d:	83 c4 10             	add    $0x10,%esp
c0108350:	90                   	nop
c0108351:	c9                   	leave  
c0108352:	c3                   	ret    

c0108353 <simple_shell>:
c0108353:	55                   	push   %ebp
c0108354:	89 e5                	mov    %esp,%ebp
c0108356:	57                   	push   %edi
c0108357:	83 ec 64             	sub    $0x64,%esp
c010835a:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0108361:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0108368:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c010836e:	83 ec 08             	sub    $0x8,%esp
c0108371:	6a 02                	push   $0x2
c0108373:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108376:	50                   	push   %eax
c0108377:	e8 33 ca ff ff       	call   c0104daf <open>
c010837c:	83 c4 10             	add    $0x10,%esp
c010837f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108382:	83 ec 08             	sub    $0x8,%esp
c0108385:	6a 02                	push   $0x2
c0108387:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c010838a:	50                   	push   %eax
c010838b:	e8 1f ca ff ff       	call   c0104daf <open>
c0108390:	83 c4 10             	add    $0x10,%esp
c0108393:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108396:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0108399:	b8 00 00 00 00       	mov    $0x0,%eax
c010839e:	b9 0a 00 00 00       	mov    $0xa,%ecx
c01083a3:	89 d7                	mov    %edx,%edi
c01083a5:	f3 ab                	rep stos %eax,%es:(%edi)
c01083a7:	c7 45 a8 37 bd 10 c0 	movl   $0xc010bd37,-0x58(%ebp)
c01083ae:	c7 45 ac 3c bd 10 c0 	movl   $0xc010bd3c,-0x54(%ebp)
c01083b5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01083bc:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c01083c3:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c01083ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01083cd:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c01083d4:	00 
c01083d5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01083d8:	85 c0                	test   %eax,%eax
c01083da:	75 1c                	jne    c01083f8 <simple_shell+0xa5>
c01083dc:	68 0e 03 00 00       	push   $0x30e
c01083e1:	68 01 bb 10 c0       	push   $0xc010bb01
c01083e6:	68 01 bb 10 c0       	push   $0xc010bb01
c01083eb:	68 42 bd 10 c0       	push   $0xc010bd42
c01083f0:	e8 60 07 00 00       	call   c0108b55 <assertion_failure>
c01083f5:	83 c4 10             	add    $0x10,%esp
c01083f8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01083fb:	83 ec 08             	sub    $0x8,%esp
c01083fe:	6a 02                	push   $0x2
c0108400:	50                   	push   %eax
c0108401:	e8 a9 c9 ff ff       	call   c0104daf <open>
c0108406:	83 c4 10             	add    $0x10,%esp
c0108409:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010840c:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0108410:	75 4b                	jne    c010845d <simple_shell+0x10a>
c0108412:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108419:	eb 26                	jmp    c0108441 <simple_shell+0xee>
c010841b:	8b 55 a8             	mov    -0x58(%ebp),%edx
c010841e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108421:	01 d0                	add    %edx,%eax
c0108423:	0f b6 00             	movzbl (%eax),%eax
c0108426:	0f be c0             	movsbl %al,%eax
c0108429:	83 ec 04             	sub    $0x4,%esp
c010842c:	50                   	push   %eax
c010842d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108430:	68 51 bd 10 c0       	push   $0xc010bd51
c0108435:	e8 be 03 00 00       	call   c01087f8 <Printf>
c010843a:	83 c4 10             	add    $0x10,%esp
c010843d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108441:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0108445:	7e d4                	jle    c010841b <simple_shell+0xc8>
c0108447:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010844a:	83 ec 08             	sub    $0x8,%esp
c010844d:	50                   	push   %eax
c010844e:	68 58 bd 10 c0       	push   $0xc010bd58
c0108453:	e8 a0 03 00 00       	call   c01087f8 <Printf>
c0108458:	83 c4 10             	add    $0x10,%esp
c010845b:	eb 78                	jmp    c01084d5 <simple_shell+0x182>
c010845d:	83 ec 0c             	sub    $0xc,%esp
c0108460:	68 5e bd 10 c0       	push   $0xc010bd5e
c0108465:	e8 8e 03 00 00       	call   c01087f8 <Printf>
c010846a:	83 c4 10             	add    $0x10,%esp
c010846d:	e8 9d cc ff ff       	call   c010510f <fork>
c0108472:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108475:	83 ec 0c             	sub    $0xc,%esp
c0108478:	68 73 bd 10 c0       	push   $0xc010bd73
c010847d:	e8 76 03 00 00       	call   c01087f8 <Printf>
c0108482:	83 c4 10             	add    $0x10,%esp
c0108485:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0108489:	7e 11                	jle    c010849c <simple_shell+0x149>
c010848b:	83 ec 0c             	sub    $0xc,%esp
c010848e:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0108491:	50                   	push   %eax
c0108492:	e8 05 cc ff ff       	call   c010509c <wait>
c0108497:	83 c4 10             	add    $0x10,%esp
c010849a:	eb 39                	jmp    c01084d5 <simple_shell+0x182>
c010849c:	83 ec 0c             	sub    $0xc,%esp
c010849f:	68 88 bd 10 c0       	push   $0xc010bd88
c01084a4:	e8 4f 03 00 00       	call   c01087f8 <Printf>
c01084a9:	83 c4 10             	add    $0x10,%esp
c01084ac:	83 ec 0c             	sub    $0xc,%esp
c01084af:	ff 75 e0             	pushl  -0x20(%ebp)
c01084b2:	e8 93 cb ff ff       	call   c010504a <close>
c01084b7:	83 c4 10             	add    $0x10,%esp
c01084ba:	6a 00                	push   $0x0
c01084bc:	68 3c bd 10 c0       	push   $0xc010bd3c
c01084c1:	68 37 bd 10 c0       	push   $0xc010bd37
c01084c6:	68 a4 bd 10 c0       	push   $0xc010bda4
c01084cb:	e8 12 cf ff ff       	call   c01053e2 <execl>
c01084d0:	83 c4 10             	add    $0x10,%esp
c01084d3:	eb fe                	jmp    c01084d3 <simple_shell+0x180>
c01084d5:	8b 7d fc             	mov    -0x4(%ebp),%edi
c01084d8:	c9                   	leave  
c01084d9:	c3                   	ret    

c01084da <test_shell>:
c01084da:	55                   	push   %ebp
c01084db:	89 e5                	mov    %esp,%ebp
c01084dd:	83 ec 38             	sub    $0x38,%esp
c01084e0:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c01084e7:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c01084ee:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c01084f4:	83 ec 08             	sub    $0x8,%esp
c01084f7:	6a 02                	push   $0x2
c01084f9:	8d 45 ea             	lea    -0x16(%ebp),%eax
c01084fc:	50                   	push   %eax
c01084fd:	e8 ad c8 ff ff       	call   c0104daf <open>
c0108502:	83 c4 10             	add    $0x10,%esp
c0108505:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108508:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c010850f:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0108516:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c010851d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108524:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010852b:	83 ec 0c             	sub    $0xc,%esp
c010852e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108531:	50                   	push   %eax
c0108532:	e8 38 ea ff ff       	call   c0106f6f <untar>
c0108537:	83 c4 10             	add    $0x10,%esp
c010853a:	e8 14 fe ff ff       	call   c0108353 <simple_shell>
c010853f:	90                   	nop
c0108540:	c9                   	leave  
c0108541:	c3                   	ret    

c0108542 <test_exec>:
c0108542:	55                   	push   %ebp
c0108543:	89 e5                	mov    %esp,%ebp
c0108545:	83 ec 38             	sub    $0x38,%esp
c0108548:	83 ec 0c             	sub    $0xc,%esp
c010854b:	68 aa bd 10 c0       	push   $0xc010bdaa
c0108550:	e8 84 7b ff ff       	call   c01000d9 <disp_str>
c0108555:	83 c4 10             	add    $0x10,%esp
c0108558:	83 ec 0c             	sub    $0xc,%esp
c010855b:	68 bc bd 10 c0       	push   $0xc010bdbc
c0108560:	e8 74 7b ff ff       	call   c01000d9 <disp_str>
c0108565:	83 c4 10             	add    $0x10,%esp
c0108568:	83 ec 0c             	sub    $0xc,%esp
c010856b:	6a 07                	push   $0x7
c010856d:	e8 b8 ed ff ff       	call   c010732a <disp_int>
c0108572:	83 c4 10             	add    $0x10,%esp
c0108575:	83 ec 0c             	sub    $0xc,%esp
c0108578:	68 a0 b6 10 c0       	push   $0xc010b6a0
c010857d:	e8 57 7b ff ff       	call   c01000d9 <disp_str>
c0108582:	83 c4 10             	add    $0x10,%esp
c0108585:	83 ec 0c             	sub    $0xc,%esp
c0108588:	68 a2 b6 10 c0       	push   $0xc010b6a2
c010858d:	e8 47 7b ff ff       	call   c01000d9 <disp_str>
c0108592:	83 c4 10             	add    $0x10,%esp
c0108595:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c010859c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c01085a3:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c01085a9:	83 ec 08             	sub    $0x8,%esp
c01085ac:	6a 02                	push   $0x2
c01085ae:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c01085b1:	50                   	push   %eax
c01085b2:	e8 f8 c7 ff ff       	call   c0104daf <open>
c01085b7:	83 c4 10             	add    $0x10,%esp
c01085ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085bd:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c01085c4:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c01085cb:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c01085d2:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c01085d9:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01085e0:	83 ec 0c             	sub    $0xc,%esp
c01085e3:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01085e6:	50                   	push   %eax
c01085e7:	e8 83 e9 ff ff       	call   c0106f6f <untar>
c01085ec:	83 c4 10             	add    $0x10,%esp
c01085ef:	83 ec 08             	sub    $0x8,%esp
c01085f2:	6a 00                	push   $0x0
c01085f4:	68 cf bd 10 c0       	push   $0xc010bdcf
c01085f9:	68 d3 bd 10 c0       	push   $0xc010bdd3
c01085fe:	68 3c bd 10 c0       	push   $0xc010bd3c
c0108603:	68 37 bd 10 c0       	push   $0xc010bd37
c0108608:	68 a4 bd 10 c0       	push   $0xc010bda4
c010860d:	e8 d0 cd ff ff       	call   c01053e2 <execl>
c0108612:	83 c4 20             	add    $0x20,%esp
c0108615:	e8 34 e8 ff ff       	call   c0106e4e <stop_here>
c010861a:	e8 f0 ca ff ff       	call   c010510f <fork>
c010861f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108622:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108626:	7e 25                	jle    c010864d <test_exec+0x10b>
c0108628:	83 ec 0c             	sub    $0xc,%esp
c010862b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c010862e:	50                   	push   %eax
c010862f:	e8 68 ca ff ff       	call   c010509c <wait>
c0108634:	83 c4 10             	add    $0x10,%esp
c0108637:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010863a:	83 ec 08             	sub    $0x8,%esp
c010863d:	50                   	push   %eax
c010863e:	68 d9 bd 10 c0       	push   $0xc010bdd9
c0108643:	e8 b0 01 00 00       	call   c01087f8 <Printf>
c0108648:	83 c4 10             	add    $0x10,%esp
c010864b:	eb 33                	jmp    c0108680 <test_exec+0x13e>
c010864d:	83 ec 0c             	sub    $0xc,%esp
c0108650:	68 eb bd 10 c0       	push   $0xc010bdeb
c0108655:	e8 9e 01 00 00       	call   c01087f8 <Printf>
c010865a:	83 c4 10             	add    $0x10,%esp
c010865d:	83 ec 0c             	sub    $0xc,%esp
c0108660:	6a 00                	push   $0x0
c0108662:	68 d3 bd 10 c0       	push   $0xc010bdd3
c0108667:	68 3c bd 10 c0       	push   $0xc010bd3c
c010866c:	68 37 bd 10 c0       	push   $0xc010bd37
c0108671:	68 a4 bd 10 c0       	push   $0xc010bda4
c0108676:	e8 67 cd ff ff       	call   c01053e2 <execl>
c010867b:	83 c4 20             	add    $0x20,%esp
c010867e:	eb fe                	jmp    c010867e <test_exec+0x13c>
c0108680:	c9                   	leave  
c0108681:	c3                   	ret    

c0108682 <INIT>:
c0108682:	55                   	push   %ebp
c0108683:	89 e5                	mov    %esp,%ebp
c0108685:	83 ec 08             	sub    $0x8,%esp
c0108688:	e8 4d fe ff ff       	call   c01084da <test_shell>
c010868d:	eb fe                	jmp    c010868d <INIT+0xb>

c010868f <TestA>:
c010868f:	55                   	push   %ebp
c0108690:	89 e5                	mov    %esp,%ebp
c0108692:	83 ec 08             	sub    $0x8,%esp
c0108695:	83 ec 0c             	sub    $0xc,%esp
c0108698:	6a 05                	push   $0x5
c010869a:	e8 8b ec ff ff       	call   c010732a <disp_int>
c010869f:	83 c4 10             	add    $0x10,%esp
c01086a2:	83 ec 0c             	sub    $0xc,%esp
c01086a5:	68 b3 b7 10 c0       	push   $0xc010b7b3
c01086aa:	e8 2a 7a ff ff       	call   c01000d9 <disp_str>
c01086af:	83 c4 10             	add    $0x10,%esp
c01086b2:	83 ec 0c             	sub    $0xc,%esp
c01086b5:	68 f9 bd 10 c0       	push   $0xc010bdf9
c01086ba:	e8 1a 7a ff ff       	call   c01000d9 <disp_str>
c01086bf:	83 c4 10             	add    $0x10,%esp
c01086c2:	eb fe                	jmp    c01086c2 <TestA+0x33>

c01086c4 <delay>:
c01086c4:	55                   	push   %ebp
c01086c5:	89 e5                	mov    %esp,%ebp
c01086c7:	83 ec 10             	sub    $0x10,%esp
c01086ca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01086d1:	eb 2a                	jmp    c01086fd <delay+0x39>
c01086d3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01086da:	eb 17                	jmp    c01086f3 <delay+0x2f>
c01086dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01086e3:	eb 04                	jmp    c01086e9 <delay+0x25>
c01086e5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01086e9:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01086ed:	7e f6                	jle    c01086e5 <delay+0x21>
c01086ef:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01086f3:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c01086f7:	7e e3                	jle    c01086dc <delay+0x18>
c01086f9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01086fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108700:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108703:	7c ce                	jl     c01086d3 <delay+0xf>
c0108705:	90                   	nop
c0108706:	c9                   	leave  
c0108707:	c3                   	ret    

c0108708 <TestB>:
c0108708:	55                   	push   %ebp
c0108709:	89 e5                	mov    %esp,%ebp
c010870b:	83 ec 08             	sub    $0x8,%esp
c010870e:	83 ec 0c             	sub    $0xc,%esp
c0108711:	68 00 be 10 c0       	push   $0xc010be00
c0108716:	e8 be 79 ff ff       	call   c01000d9 <disp_str>
c010871b:	83 c4 10             	add    $0x10,%esp
c010871e:	eb fe                	jmp    c010871e <TestB+0x16>

c0108720 <TestC>:
c0108720:	55                   	push   %ebp
c0108721:	89 e5                	mov    %esp,%ebp
c0108723:	83 ec 18             	sub    $0x18,%esp
c0108726:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010872d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108731:	77 1a                	ja     c010874d <TestC+0x2d>
c0108733:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010873a:	83 ec 08             	sub    $0x8,%esp
c010873d:	ff 75 f0             	pushl  -0x10(%ebp)
c0108740:	68 03 be 10 c0       	push   $0xc010be03
c0108745:	e8 ae 00 00 00       	call   c01087f8 <Printf>
c010874a:	83 c4 10             	add    $0x10,%esp
c010874d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108751:	eb da                	jmp    c010872d <TestC+0xd>

c0108753 <sys_get_ticks>:
c0108753:	55                   	push   %ebp
c0108754:	89 e5                	mov    %esp,%ebp
c0108756:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010875b:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108761:	5d                   	pop    %ebp
c0108762:	c3                   	ret    

c0108763 <sys_write>:
c0108763:	55                   	push   %ebp
c0108764:	89 e5                	mov    %esp,%ebp
c0108766:	83 ec 18             	sub    $0x18,%esp
c0108769:	8b 45 10             	mov    0x10(%ebp),%eax
c010876c:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108772:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108778:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010877d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108780:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108783:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108786:	8b 45 08             	mov    0x8(%ebp),%eax
c0108789:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010878c:	eb 20                	jmp    c01087ae <sys_write+0x4b>
c010878e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108791:	0f b6 00             	movzbl (%eax),%eax
c0108794:	0f b6 c0             	movzbl %al,%eax
c0108797:	83 ec 08             	sub    $0x8,%esp
c010879a:	50                   	push   %eax
c010879b:	ff 75 ec             	pushl  -0x14(%ebp)
c010879e:	e8 7d b9 ff ff       	call   c0104120 <out_char>
c01087a3:	83 c4 10             	add    $0x10,%esp
c01087a6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01087aa:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c01087ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01087b2:	7f da                	jg     c010878e <sys_write+0x2b>
c01087b4:	90                   	nop
c01087b5:	c9                   	leave  
c01087b6:	c3                   	ret    

c01087b7 <milli_delay>:
c01087b7:	55                   	push   %ebp
c01087b8:	89 e5                	mov    %esp,%ebp
c01087ba:	83 ec 18             	sub    $0x18,%esp
c01087bd:	e8 8a 11 00 00       	call   c010994c <get_ticks_ipc>
c01087c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01087c5:	90                   	nop
c01087c6:	e8 81 11 00 00       	call   c010994c <get_ticks_ipc>
c01087cb:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01087ce:	89 c1                	mov    %eax,%ecx
c01087d0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c01087d5:	89 c8                	mov    %ecx,%eax
c01087d7:	f7 ea                	imul   %edx
c01087d9:	c1 fa 05             	sar    $0x5,%edx
c01087dc:	89 c8                	mov    %ecx,%eax
c01087de:	c1 f8 1f             	sar    $0x1f,%eax
c01087e1:	29 c2                	sub    %eax,%edx
c01087e3:	89 d0                	mov    %edx,%eax
c01087e5:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c01087eb:	39 45 08             	cmp    %eax,0x8(%ebp)
c01087ee:	77 d6                	ja     c01087c6 <milli_delay+0xf>
c01087f0:	90                   	nop
c01087f1:	c9                   	leave  
c01087f2:	c3                   	ret    

c01087f3 <TaskSys>:
c01087f3:	55                   	push   %ebp
c01087f4:	89 e5                	mov    %esp,%ebp
c01087f6:	eb fe                	jmp    c01087f6 <TaskSys+0x3>

c01087f8 <Printf>:
c01087f8:	55                   	push   %ebp
c01087f9:	89 e5                	mov    %esp,%ebp
c01087fb:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108801:	83 ec 04             	sub    $0x4,%esp
c0108804:	68 00 01 00 00       	push   $0x100
c0108809:	6a 00                	push   $0x0
c010880b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108811:	50                   	push   %eax
c0108812:	e8 58 3a 00 00       	call   c010c26f <Memset>
c0108817:	83 c4 10             	add    $0x10,%esp
c010881a:	8d 45 0c             	lea    0xc(%ebp),%eax
c010881d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108820:	8b 45 08             	mov    0x8(%ebp),%eax
c0108823:	83 ec 04             	sub    $0x4,%esp
c0108826:	ff 75 f4             	pushl  -0xc(%ebp)
c0108829:	50                   	push   %eax
c010882a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108830:	50                   	push   %eax
c0108831:	e8 20 00 00 00       	call   c0108856 <vsprintf>
c0108836:	83 c4 10             	add    $0x10,%esp
c0108839:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010883c:	83 ec 04             	sub    $0x4,%esp
c010883f:	ff 75 f0             	pushl  -0x10(%ebp)
c0108842:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108848:	50                   	push   %eax
c0108849:	6a 00                	push   $0x0
c010884b:	e8 75 c7 ff ff       	call   c0104fc5 <write>
c0108850:	83 c4 10             	add    $0x10,%esp
c0108853:	90                   	nop
c0108854:	c9                   	leave  
c0108855:	c3                   	ret    

c0108856 <vsprintf>:
c0108856:	55                   	push   %ebp
c0108857:	89 e5                	mov    %esp,%ebp
c0108859:	81 ec 68 02 00 00    	sub    $0x268,%esp
c010885f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108865:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010886b:	83 ec 04             	sub    $0x4,%esp
c010886e:	6a 40                	push   $0x40
c0108870:	6a 00                	push   $0x0
c0108872:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108878:	50                   	push   %eax
c0108879:	e8 f1 39 00 00       	call   c010c26f <Memset>
c010887e:	83 c4 10             	add    $0x10,%esp
c0108881:	8b 45 10             	mov    0x10(%ebp),%eax
c0108884:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108887:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010888e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108891:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108894:	e9 53 01 00 00       	jmp    c01089ec <vsprintf+0x196>
c0108899:	8b 45 0c             	mov    0xc(%ebp),%eax
c010889c:	0f b6 00             	movzbl (%eax),%eax
c010889f:	3c 25                	cmp    $0x25,%al
c01088a1:	74 16                	je     c01088b9 <vsprintf+0x63>
c01088a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01088a6:	8d 50 01             	lea    0x1(%eax),%edx
c01088a9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01088ac:	8b 55 0c             	mov    0xc(%ebp),%edx
c01088af:	0f b6 12             	movzbl (%edx),%edx
c01088b2:	88 10                	mov    %dl,(%eax)
c01088b4:	e9 2f 01 00 00       	jmp    c01089e8 <vsprintf+0x192>
c01088b9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01088bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01088c0:	0f b6 00             	movzbl (%eax),%eax
c01088c3:	0f be c0             	movsbl %al,%eax
c01088c6:	83 f8 64             	cmp    $0x64,%eax
c01088c9:	74 26                	je     c01088f1 <vsprintf+0x9b>
c01088cb:	83 f8 64             	cmp    $0x64,%eax
c01088ce:	7f 0e                	jg     c01088de <vsprintf+0x88>
c01088d0:	83 f8 63             	cmp    $0x63,%eax
c01088d3:	0f 84 f2 00 00 00    	je     c01089cb <vsprintf+0x175>
c01088d9:	e9 0a 01 00 00       	jmp    c01089e8 <vsprintf+0x192>
c01088de:	83 f8 73             	cmp    $0x73,%eax
c01088e1:	0f 84 b0 00 00 00    	je     c0108997 <vsprintf+0x141>
c01088e7:	83 f8 78             	cmp    $0x78,%eax
c01088ea:	74 5d                	je     c0108949 <vsprintf+0xf3>
c01088ec:	e9 f7 00 00 00       	jmp    c01089e8 <vsprintf+0x192>
c01088f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01088f4:	8b 00                	mov    (%eax),%eax
c01088f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01088f9:	83 ec 04             	sub    $0x4,%esp
c01088fc:	6a 0a                	push   $0xa
c01088fe:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0108904:	50                   	push   %eax
c0108905:	ff 75 e8             	pushl  -0x18(%ebp)
c0108908:	e8 96 10 00 00       	call   c01099a3 <itoa>
c010890d:	83 c4 10             	add    $0x10,%esp
c0108910:	83 ec 08             	sub    $0x8,%esp
c0108913:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108919:	50                   	push   %eax
c010891a:	ff 75 f4             	pushl  -0xc(%ebp)
c010891d:	e8 6c 39 00 00       	call   c010c28e <Strcpy>
c0108922:	83 c4 10             	add    $0x10,%esp
c0108925:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108929:	83 ec 0c             	sub    $0xc,%esp
c010892c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108932:	50                   	push   %eax
c0108933:	e8 70 39 00 00       	call   c010c2a8 <Strlen>
c0108938:	83 c4 10             	add    $0x10,%esp
c010893b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010893e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108941:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108944:	e9 9f 00 00 00       	jmp    c01089e8 <vsprintf+0x192>
c0108949:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010894c:	8b 00                	mov    (%eax),%eax
c010894e:	83 ec 08             	sub    $0x8,%esp
c0108951:	50                   	push   %eax
c0108952:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108958:	50                   	push   %eax
c0108959:	e8 26 e9 ff ff       	call   c0107284 <atoi>
c010895e:	83 c4 10             	add    $0x10,%esp
c0108961:	83 ec 08             	sub    $0x8,%esp
c0108964:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010896a:	50                   	push   %eax
c010896b:	ff 75 f4             	pushl  -0xc(%ebp)
c010896e:	e8 1b 39 00 00       	call   c010c28e <Strcpy>
c0108973:	83 c4 10             	add    $0x10,%esp
c0108976:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010897a:	83 ec 0c             	sub    $0xc,%esp
c010897d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108983:	50                   	push   %eax
c0108984:	e8 1f 39 00 00       	call   c010c2a8 <Strlen>
c0108989:	83 c4 10             	add    $0x10,%esp
c010898c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010898f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108992:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108995:	eb 51                	jmp    c01089e8 <vsprintf+0x192>
c0108997:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010899a:	8b 00                	mov    (%eax),%eax
c010899c:	83 ec 08             	sub    $0x8,%esp
c010899f:	50                   	push   %eax
c01089a0:	ff 75 f4             	pushl  -0xc(%ebp)
c01089a3:	e8 e6 38 00 00       	call   c010c28e <Strcpy>
c01089a8:	83 c4 10             	add    $0x10,%esp
c01089ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01089ae:	8b 00                	mov    (%eax),%eax
c01089b0:	83 ec 0c             	sub    $0xc,%esp
c01089b3:	50                   	push   %eax
c01089b4:	e8 ef 38 00 00       	call   c010c2a8 <Strlen>
c01089b9:	83 c4 10             	add    $0x10,%esp
c01089bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01089bf:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01089c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01089c6:	01 45 f4             	add    %eax,-0xc(%ebp)
c01089c9:	eb 1d                	jmp    c01089e8 <vsprintf+0x192>
c01089cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01089ce:	0f b6 10             	movzbl (%eax),%edx
c01089d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01089d4:	88 10                	mov    %dl,(%eax)
c01089d6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01089da:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01089e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01089e4:	01 45 f4             	add    %eax,-0xc(%ebp)
c01089e7:	90                   	nop
c01089e8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01089ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c01089ef:	0f b6 00             	movzbl (%eax),%eax
c01089f2:	84 c0                	test   %al,%al
c01089f4:	0f 85 9f fe ff ff    	jne    c0108899 <vsprintf+0x43>
c01089fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01089fd:	2b 45 08             	sub    0x8(%ebp),%eax
c0108a00:	c9                   	leave  
c0108a01:	c3                   	ret    

c0108a02 <printx>:
c0108a02:	55                   	push   %ebp
c0108a03:	89 e5                	mov    %esp,%ebp
c0108a05:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108a0b:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108a0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108a11:	8b 45 08             	mov    0x8(%ebp),%eax
c0108a14:	83 ec 04             	sub    $0x4,%esp
c0108a17:	ff 75 f4             	pushl  -0xc(%ebp)
c0108a1a:	50                   	push   %eax
c0108a1b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108a21:	50                   	push   %eax
c0108a22:	e8 2f fe ff ff       	call   c0108856 <vsprintf>
c0108a27:	83 c4 10             	add    $0x10,%esp
c0108a2a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108a2d:	83 ec 08             	sub    $0x8,%esp
c0108a30:	ff 75 f0             	pushl  -0x10(%ebp)
c0108a33:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108a39:	50                   	push   %eax
c0108a3a:	e8 11 8e ff ff       	call   c0101850 <write_debug>
c0108a3f:	83 c4 10             	add    $0x10,%esp
c0108a42:	90                   	nop
c0108a43:	c9                   	leave  
c0108a44:	c3                   	ret    

c0108a45 <sys_printx>:
c0108a45:	55                   	push   %ebp
c0108a46:	89 e5                	mov    %esp,%ebp
c0108a48:	83 ec 28             	sub    $0x28,%esp
c0108a4b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108a50:	85 c0                	test   %eax,%eax
c0108a52:	75 15                	jne    c0108a69 <sys_printx+0x24>
c0108a54:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a57:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108a5d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108a60:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108a67:	eb 10                	jmp    c0108a79 <sys_printx+0x34>
c0108a69:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108a6e:	85 c0                	test   %eax,%eax
c0108a70:	74 07                	je     c0108a79 <sys_printx+0x34>
c0108a72:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108a79:	8b 55 08             	mov    0x8(%ebp),%edx
c0108a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108a7f:	01 d0                	add    %edx,%eax
c0108a81:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108a84:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a87:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108a8d:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108a93:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108a98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108a9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108aa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108aa4:	0f b6 00             	movzbl (%eax),%eax
c0108aa7:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0108aaa:	eb 3a                	jmp    c0108ae6 <sys_printx+0xa1>
c0108aac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108aaf:	0f b6 00             	movzbl (%eax),%eax
c0108ab2:	3c 3b                	cmp    $0x3b,%al
c0108ab4:	74 0a                	je     c0108ac0 <sys_printx+0x7b>
c0108ab6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ab9:	0f b6 00             	movzbl (%eax),%eax
c0108abc:	3c 3a                	cmp    $0x3a,%al
c0108abe:	75 06                	jne    c0108ac6 <sys_printx+0x81>
c0108ac0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108ac4:	eb 20                	jmp    c0108ae6 <sys_printx+0xa1>
c0108ac6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ac9:	0f b6 00             	movzbl (%eax),%eax
c0108acc:	0f b6 c0             	movzbl %al,%eax
c0108acf:	83 ec 08             	sub    $0x8,%esp
c0108ad2:	50                   	push   %eax
c0108ad3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108ad6:	e8 45 b6 ff ff       	call   c0104120 <out_char>
c0108adb:	83 c4 10             	add    $0x10,%esp
c0108ade:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108ae2:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0108ae6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108aea:	7f c0                	jg     c0108aac <sys_printx+0x67>
c0108aec:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108af0:	75 10                	jne    c0108b02 <sys_printx+0xbd>
c0108af2:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108af7:	85 c0                	test   %eax,%eax
c0108af9:	74 13                	je     c0108b0e <sys_printx+0xc9>
c0108afb:	e8 60 78 ff ff       	call   c0100360 <disable_int>
c0108b00:	eb 0c                	jmp    c0108b0e <sys_printx+0xc9>
c0108b02:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0108b06:	75 06                	jne    c0108b0e <sys_printx+0xc9>
c0108b08:	e8 53 78 ff ff       	call   c0100360 <disable_int>
c0108b0d:	90                   	nop
c0108b0e:	90                   	nop
c0108b0f:	c9                   	leave  
c0108b10:	c3                   	ret    

c0108b11 <spin>:
c0108b11:	55                   	push   %ebp
c0108b12:	89 e5                	mov    %esp,%ebp
c0108b14:	83 ec 08             	sub    $0x8,%esp
c0108b17:	83 ec 0c             	sub    $0xc,%esp
c0108b1a:	ff 75 08             	pushl  0x8(%ebp)
c0108b1d:	e8 b7 75 ff ff       	call   c01000d9 <disp_str>
c0108b22:	83 c4 10             	add    $0x10,%esp
c0108b25:	83 ec 0c             	sub    $0xc,%esp
c0108b28:	68 b3 b7 10 c0       	push   $0xc010b7b3
c0108b2d:	e8 a7 75 ff ff       	call   c01000d9 <disp_str>
c0108b32:	83 c4 10             	add    $0x10,%esp
c0108b35:	eb fe                	jmp    c0108b35 <spin+0x24>

c0108b37 <panic>:
c0108b37:	55                   	push   %ebp
c0108b38:	89 e5                	mov    %esp,%ebp
c0108b3a:	83 ec 08             	sub    $0x8,%esp
c0108b3d:	83 ec 04             	sub    $0x4,%esp
c0108b40:	ff 75 08             	pushl  0x8(%ebp)
c0108b43:	6a 3a                	push   $0x3a
c0108b45:	68 10 be 10 c0       	push   $0xc010be10
c0108b4a:	e8 b3 fe ff ff       	call   c0108a02 <printx>
c0108b4f:	83 c4 10             	add    $0x10,%esp
c0108b52:	90                   	nop
c0108b53:	c9                   	leave  
c0108b54:	c3                   	ret    

c0108b55 <assertion_failure>:
c0108b55:	55                   	push   %ebp
c0108b56:	89 e5                	mov    %esp,%ebp
c0108b58:	83 ec 08             	sub    $0x8,%esp
c0108b5b:	83 ec 08             	sub    $0x8,%esp
c0108b5e:	ff 75 14             	pushl  0x14(%ebp)
c0108b61:	ff 75 10             	pushl  0x10(%ebp)
c0108b64:	ff 75 0c             	pushl  0xc(%ebp)
c0108b67:	ff 75 08             	pushl  0x8(%ebp)
c0108b6a:	6a 3b                	push   $0x3b
c0108b6c:	68 18 be 10 c0       	push   $0xc010be18
c0108b71:	e8 8c fe ff ff       	call   c0108a02 <printx>
c0108b76:	83 c4 20             	add    $0x20,%esp
c0108b79:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108b80:	00 00 00 
c0108b83:	83 ec 0c             	sub    $0xc,%esp
c0108b86:	68 a0 b6 10 c0       	push   $0xc010b6a0
c0108b8b:	e8 49 75 ff ff       	call   c01000d9 <disp_str>
c0108b90:	83 c4 10             	add    $0x10,%esp
c0108b93:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108b98:	83 ec 0c             	sub    $0xc,%esp
c0108b9b:	50                   	push   %eax
c0108b9c:	e8 89 e7 ff ff       	call   c010732a <disp_int>
c0108ba1:	83 c4 10             	add    $0x10,%esp
c0108ba4:	83 ec 0c             	sub    $0xc,%esp
c0108ba7:	68 a2 b6 10 c0       	push   $0xc010b6a2
c0108bac:	e8 28 75 ff ff       	call   c01000d9 <disp_str>
c0108bb1:	83 c4 10             	add    $0x10,%esp
c0108bb4:	83 ec 0c             	sub    $0xc,%esp
c0108bb7:	68 4b be 10 c0       	push   $0xc010be4b
c0108bbc:	e8 50 ff ff ff       	call   c0108b11 <spin>
c0108bc1:	83 c4 10             	add    $0x10,%esp
c0108bc4:	90                   	nop
c0108bc5:	c9                   	leave  
c0108bc6:	c3                   	ret    

c0108bc7 <assertion_failure2>:
c0108bc7:	55                   	push   %ebp
c0108bc8:	89 e5                	mov    %esp,%ebp
c0108bca:	83 ec 08             	sub    $0x8,%esp
c0108bcd:	83 ec 04             	sub    $0x4,%esp
c0108bd0:	ff 75 18             	pushl  0x18(%ebp)
c0108bd3:	ff 75 14             	pushl  0x14(%ebp)
c0108bd6:	ff 75 10             	pushl  0x10(%ebp)
c0108bd9:	ff 75 0c             	pushl  0xc(%ebp)
c0108bdc:	ff 75 08             	pushl  0x8(%ebp)
c0108bdf:	6a 3b                	push   $0x3b
c0108be1:	68 58 be 10 c0       	push   $0xc010be58
c0108be6:	e8 17 fe ff ff       	call   c0108a02 <printx>
c0108beb:	83 c4 20             	add    $0x20,%esp
c0108bee:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108bf5:	00 00 00 
c0108bf8:	83 ec 0c             	sub    $0xc,%esp
c0108bfb:	68 a0 b6 10 c0       	push   $0xc010b6a0
c0108c00:	e8 d4 74 ff ff       	call   c01000d9 <disp_str>
c0108c05:	83 c4 10             	add    $0x10,%esp
c0108c08:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108c0d:	83 ec 0c             	sub    $0xc,%esp
c0108c10:	50                   	push   %eax
c0108c11:	e8 14 e7 ff ff       	call   c010732a <disp_int>
c0108c16:	83 c4 10             	add    $0x10,%esp
c0108c19:	83 ec 0c             	sub    $0xc,%esp
c0108c1c:	68 a2 b6 10 c0       	push   $0xc010b6a2
c0108c21:	e8 b3 74 ff ff       	call   c01000d9 <disp_str>
c0108c26:	83 c4 10             	add    $0x10,%esp
c0108c29:	83 ec 0c             	sub    $0xc,%esp
c0108c2c:	68 4b be 10 c0       	push   $0xc010be4b
c0108c31:	e8 db fe ff ff       	call   c0108b11 <spin>
c0108c36:	83 c4 10             	add    $0x10,%esp
c0108c39:	90                   	nop
c0108c3a:	c9                   	leave  
c0108c3b:	c3                   	ret    

c0108c3c <dead_lock>:
c0108c3c:	55                   	push   %ebp
c0108c3d:	89 e5                	mov    %esp,%ebp
c0108c3f:	b8 00 00 00 00       	mov    $0x0,%eax
c0108c44:	5d                   	pop    %ebp
c0108c45:	c3                   	ret    

c0108c46 <sys_send_msg>:
c0108c46:	55                   	push   %ebp
c0108c47:	89 e5                	mov    %esp,%ebp
c0108c49:	83 ec 58             	sub    $0x58,%esp
c0108c4c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108c53:	83 ec 0c             	sub    $0xc,%esp
c0108c56:	ff 75 0c             	pushl  0xc(%ebp)
c0108c59:	e8 28 ae ff ff       	call   c0103a86 <pid2proc>
c0108c5e:	83 c4 10             	add    $0x10,%esp
c0108c61:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108c64:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108c68:	74 2c                	je     c0108c96 <sys_send_msg+0x50>
c0108c6a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c6d:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108c73:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108c78:	74 1c                	je     c0108c96 <sys_send_msg+0x50>
c0108c7a:	68 5c 05 00 00       	push   $0x55c
c0108c7f:	68 01 bb 10 c0       	push   $0xc010bb01
c0108c84:	68 01 bb 10 c0       	push   $0xc010bb01
c0108c89:	68 98 be 10 c0       	push   $0xc010be98
c0108c8e:	e8 c2 fe ff ff       	call   c0108b55 <assertion_failure>
c0108c93:	83 c4 10             	add    $0x10,%esp
c0108c96:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c99:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108c9f:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108ca4:	74 1c                	je     c0108cc2 <sys_send_msg+0x7c>
c0108ca6:	68 5e 05 00 00       	push   $0x55e
c0108cab:	68 01 bb 10 c0       	push   $0xc010bb01
c0108cb0:	68 01 bb 10 c0       	push   $0xc010bb01
c0108cb5:	68 c0 be 10 c0       	push   $0xc010bec0
c0108cba:	e8 96 fe ff ff       	call   c0108b55 <assertion_failure>
c0108cbf:	83 c4 10             	add    $0x10,%esp
c0108cc2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108cc6:	75 22                	jne    c0108cea <sys_send_msg+0xa4>
c0108cc8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108ccc:	75 1c                	jne    c0108cea <sys_send_msg+0xa4>
c0108cce:	68 61 05 00 00       	push   $0x561
c0108cd3:	68 01 bb 10 c0       	push   $0xc010bb01
c0108cd8:	68 01 bb 10 c0       	push   $0xc010bb01
c0108cdd:	68 e3 be 10 c0       	push   $0xc010bee3
c0108ce2:	e8 6e fe ff ff       	call   c0108b55 <assertion_failure>
c0108ce7:	83 c4 10             	add    $0x10,%esp
c0108cea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ced:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cf4:	84 c0                	test   %al,%al
c0108cf6:	74 65                	je     c0108d5d <sys_send_msg+0x117>
c0108cf8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cfb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d02:	3c 01                	cmp    $0x1,%al
c0108d04:	74 57                	je     c0108d5d <sys_send_msg+0x117>
c0108d06:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d09:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d10:	3c 02                	cmp    $0x2,%al
c0108d12:	74 49                	je     c0108d5d <sys_send_msg+0x117>
c0108d14:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d17:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d1e:	3c 03                	cmp    $0x3,%al
c0108d20:	74 3b                	je     c0108d5d <sys_send_msg+0x117>
c0108d22:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d25:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d2c:	3c 04                	cmp    $0x4,%al
c0108d2e:	74 2d                	je     c0108d5d <sys_send_msg+0x117>
c0108d30:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d33:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d3a:	0f be c0             	movsbl %al,%eax
c0108d3d:	83 ec 0c             	sub    $0xc,%esp
c0108d40:	68 65 05 00 00       	push   $0x565
c0108d45:	68 01 bb 10 c0       	push   $0xc010bb01
c0108d4a:	68 01 bb 10 c0       	push   $0xc010bb01
c0108d4f:	50                   	push   %eax
c0108d50:	68 f4 be 10 c0       	push   $0xc010bef4
c0108d55:	e8 6d fe ff ff       	call   c0108bc7 <assertion_failure2>
c0108d5a:	83 c4 20             	add    $0x20,%esp
c0108d5d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d60:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d67:	84 c0                	test   %al,%al
c0108d69:	74 65                	je     c0108dd0 <sys_send_msg+0x18a>
c0108d6b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d6e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d75:	3c 01                	cmp    $0x1,%al
c0108d77:	74 57                	je     c0108dd0 <sys_send_msg+0x18a>
c0108d79:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d7c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d83:	3c 02                	cmp    $0x2,%al
c0108d85:	74 49                	je     c0108dd0 <sys_send_msg+0x18a>
c0108d87:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d8a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d91:	3c 03                	cmp    $0x3,%al
c0108d93:	74 3b                	je     c0108dd0 <sys_send_msg+0x18a>
c0108d95:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d98:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d9f:	3c 04                	cmp    $0x4,%al
c0108da1:	74 2d                	je     c0108dd0 <sys_send_msg+0x18a>
c0108da3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108da6:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dad:	0f be c0             	movsbl %al,%eax
c0108db0:	83 ec 0c             	sub    $0xc,%esp
c0108db3:	68 68 05 00 00       	push   $0x568
c0108db8:	68 01 bb 10 c0       	push   $0xc010bb01
c0108dbd:	68 01 bb 10 c0       	push   $0xc010bb01
c0108dc2:	50                   	push   %eax
c0108dc3:	68 90 bf 10 c0       	push   $0xc010bf90
c0108dc8:	e8 fa fd ff ff       	call   c0108bc7 <assertion_failure2>
c0108dcd:	83 c4 20             	add    $0x20,%esp
c0108dd0:	83 ec 0c             	sub    $0xc,%esp
c0108dd3:	ff 75 10             	pushl  0x10(%ebp)
c0108dd6:	e8 31 ad ff ff       	call   c0103b0c <proc2pid>
c0108ddb:	83 c4 10             	add    $0x10,%esp
c0108dde:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108de1:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108de8:	8b 45 08             	mov    0x8(%ebp),%eax
c0108deb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108dee:	83 ec 08             	sub    $0x8,%esp
c0108df1:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108df4:	ff 75 dc             	pushl  -0x24(%ebp)
c0108df7:	e8 a6 d3 ff ff       	call   c01061a2 <get_physical_address_proc>
c0108dfc:	83 c4 10             	add    $0x10,%esp
c0108dff:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108e02:	83 ec 08             	sub    $0x8,%esp
c0108e05:	ff 75 e0             	pushl  -0x20(%ebp)
c0108e08:	ff 75 d8             	pushl  -0x28(%ebp)
c0108e0b:	e8 bf d2 ff ff       	call   c01060cf <alloc_virtual_memory>
c0108e10:	83 c4 10             	add    $0x10,%esp
c0108e13:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108e16:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e19:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108e1f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108e22:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108e29:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108e2c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108e2f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108e32:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108e35:	89 10                	mov    %edx,(%eax)
c0108e37:	83 ec 08             	sub    $0x8,%esp
c0108e3a:	ff 75 0c             	pushl  0xc(%ebp)
c0108e3d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108e40:	e8 f7 fd ff ff       	call   c0108c3c <dead_lock>
c0108e45:	83 c4 10             	add    $0x10,%esp
c0108e48:	83 f8 01             	cmp    $0x1,%eax
c0108e4b:	75 10                	jne    c0108e5d <sys_send_msg+0x217>
c0108e4d:	83 ec 0c             	sub    $0xc,%esp
c0108e50:	68 20 c0 10 c0       	push   $0xc010c020
c0108e55:	e8 dd fc ff ff       	call   c0108b37 <panic>
c0108e5a:	83 c4 10             	add    $0x10,%esp
c0108e5d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e60:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e67:	3c 02                	cmp    $0x2,%al
c0108e69:	0f 85 ca 01 00 00    	jne    c0109039 <sys_send_msg+0x3f3>
c0108e6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e72:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108e78:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108e7b:	74 12                	je     c0108e8f <sys_send_msg+0x249>
c0108e7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e80:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108e86:	83 f8 12             	cmp    $0x12,%eax
c0108e89:	0f 85 aa 01 00 00    	jne    c0109039 <sys_send_msg+0x3f3>
c0108e8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e92:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108e98:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108e9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e9e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108ea4:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108ea7:	83 ec 08             	sub    $0x8,%esp
c0108eaa:	ff 75 0c             	pushl  0xc(%ebp)
c0108ead:	ff 75 c0             	pushl  -0x40(%ebp)
c0108eb0:	e8 ed d2 ff ff       	call   c01061a2 <get_physical_address_proc>
c0108eb5:	83 c4 10             	add    $0x10,%esp
c0108eb8:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108ebb:	83 ec 08             	sub    $0x8,%esp
c0108ebe:	ff 75 e0             	pushl  -0x20(%ebp)
c0108ec1:	ff 75 bc             	pushl  -0x44(%ebp)
c0108ec4:	e8 06 d2 ff ff       	call   c01060cf <alloc_virtual_memory>
c0108ec9:	83 c4 10             	add    $0x10,%esp
c0108ecc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108ecf:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108ed2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108ed5:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108ed8:	83 ec 04             	sub    $0x4,%esp
c0108edb:	51                   	push   %ecx
c0108edc:	52                   	push   %edx
c0108edd:	50                   	push   %eax
c0108ede:	e8 59 e0 ff ff       	call   c0106f3c <Memcpy>
c0108ee3:	83 c4 10             	add    $0x10,%esp
c0108ee6:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108eeb:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108ef0:	75 0a                	jne    c0108efc <sys_send_msg+0x2b6>
c0108ef2:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108ef9:	00 00 00 
c0108efc:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eff:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108f06:	00 00 00 
c0108f09:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f0c:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108f13:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f16:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108f1d:	00 00 00 
c0108f20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f23:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108f2a:	00 00 00 
c0108f2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f30:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108f37:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f3a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108f41:	00 00 00 
c0108f44:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f47:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108f4e:	00 00 00 
c0108f51:	83 ec 0c             	sub    $0xc,%esp
c0108f54:	ff 75 e8             	pushl  -0x18(%ebp)
c0108f57:	e8 a0 09 00 00       	call   c01098fc <unblock>
c0108f5c:	83 c4 10             	add    $0x10,%esp
c0108f5f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f62:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f69:	84 c0                	test   %al,%al
c0108f6b:	74 1c                	je     c0108f89 <sys_send_msg+0x343>
c0108f6d:	68 a0 05 00 00       	push   $0x5a0
c0108f72:	68 01 bb 10 c0       	push   $0xc010bb01
c0108f77:	68 01 bb 10 c0       	push   $0xc010bb01
c0108f7c:	68 2b c0 10 c0       	push   $0xc010c02b
c0108f81:	e8 cf fb ff ff       	call   c0108b55 <assertion_failure>
c0108f86:	83 c4 10             	add    $0x10,%esp
c0108f89:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f8c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108f92:	83 f8 21             	cmp    $0x21,%eax
c0108f95:	74 1c                	je     c0108fb3 <sys_send_msg+0x36d>
c0108f97:	68 a1 05 00 00       	push   $0x5a1
c0108f9c:	68 01 bb 10 c0       	push   $0xc010bb01
c0108fa1:	68 01 bb 10 c0       	push   $0xc010bb01
c0108fa6:	68 3f c0 10 c0       	push   $0xc010c03f
c0108fab:	e8 a5 fb ff ff       	call   c0108b55 <assertion_failure>
c0108fb0:	83 c4 10             	add    $0x10,%esp
c0108fb3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108fb6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108fbc:	85 c0                	test   %eax,%eax
c0108fbe:	74 1c                	je     c0108fdc <sys_send_msg+0x396>
c0108fc0:	68 a3 05 00 00       	push   $0x5a3
c0108fc5:	68 01 bb 10 c0       	push   $0xc010bb01
c0108fca:	68 01 bb 10 c0       	push   $0xc010bb01
c0108fcf:	68 5c c0 10 c0       	push   $0xc010c05c
c0108fd4:	e8 7c fb ff ff       	call   c0108b55 <assertion_failure>
c0108fd9:	83 c4 10             	add    $0x10,%esp
c0108fdc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108fdf:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fe6:	84 c0                	test   %al,%al
c0108fe8:	74 1c                	je     c0109006 <sys_send_msg+0x3c0>
c0108fea:	68 a4 05 00 00       	push   $0x5a4
c0108fef:	68 01 bb 10 c0       	push   $0xc010bb01
c0108ff4:	68 01 bb 10 c0       	push   $0xc010bb01
c0108ff9:	68 71 c0 10 c0       	push   $0xc010c071
c0108ffe:	e8 52 fb ff ff       	call   c0108b55 <assertion_failure>
c0109003:	83 c4 10             	add    $0x10,%esp
c0109006:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109009:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c010900f:	83 f8 21             	cmp    $0x21,%eax
c0109012:	0f 84 45 01 00 00    	je     c010915d <sys_send_msg+0x517>
c0109018:	68 a5 05 00 00       	push   $0x5a5
c010901d:	68 01 bb 10 c0       	push   $0xc010bb01
c0109022:	68 01 bb 10 c0       	push   $0xc010bb01
c0109027:	68 88 c0 10 c0       	push   $0xc010c088
c010902c:	e8 24 fb ff ff       	call   c0108b55 <assertion_failure>
c0109031:	83 c4 10             	add    $0x10,%esp
c0109034:	e9 24 01 00 00       	jmp    c010915d <sys_send_msg+0x517>
c0109039:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109040:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109043:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0109046:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109049:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010904f:	85 c0                	test   %eax,%eax
c0109051:	75 1b                	jne    c010906e <sys_send_msg+0x428>
c0109053:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109056:	8b 55 10             	mov    0x10(%ebp),%edx
c0109059:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010905f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109062:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0109069:	00 00 00 
c010906c:	eb 3f                	jmp    c01090ad <sys_send_msg+0x467>
c010906e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109071:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109077:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010907a:	eb 12                	jmp    c010908e <sys_send_msg+0x448>
c010907c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010907f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109082:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109085:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c010908b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010908e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109092:	75 e8                	jne    c010907c <sys_send_msg+0x436>
c0109094:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109097:	8b 55 10             	mov    0x10(%ebp),%edx
c010909a:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c01090a0:	8b 45 10             	mov    0x10(%ebp),%eax
c01090a3:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01090aa:	00 00 00 
c01090ad:	8b 45 10             	mov    0x10(%ebp),%eax
c01090b0:	8b 55 08             	mov    0x8(%ebp),%edx
c01090b3:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c01090b9:	8b 45 10             	mov    0x10(%ebp),%eax
c01090bc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01090bf:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c01090c5:	8b 45 10             	mov    0x10(%ebp),%eax
c01090c8:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c01090cf:	8b 45 10             	mov    0x10(%ebp),%eax
c01090d2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090d9:	3c 01                	cmp    $0x1,%al
c01090db:	74 1c                	je     c01090f9 <sys_send_msg+0x4b3>
c01090dd:	68 c7 05 00 00       	push   $0x5c7
c01090e2:	68 01 bb 10 c0       	push   $0xc010bb01
c01090e7:	68 01 bb 10 c0       	push   $0xc010bb01
c01090ec:	68 ac c0 10 c0       	push   $0xc010c0ac
c01090f1:	e8 5f fa ff ff       	call   c0108b55 <assertion_failure>
c01090f6:	83 c4 10             	add    $0x10,%esp
c01090f9:	8b 45 10             	mov    0x10(%ebp),%eax
c01090fc:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109102:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0109105:	74 1c                	je     c0109123 <sys_send_msg+0x4dd>
c0109107:	68 c8 05 00 00       	push   $0x5c8
c010910c:	68 01 bb 10 c0       	push   $0xc010bb01
c0109111:	68 01 bb 10 c0       	push   $0xc010bb01
c0109116:	68 c8 c0 10 c0       	push   $0xc010c0c8
c010911b:	e8 35 fa ff ff       	call   c0108b55 <assertion_failure>
c0109120:	83 c4 10             	add    $0x10,%esp
c0109123:	8b 45 10             	mov    0x10(%ebp),%eax
c0109126:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010912c:	39 45 08             	cmp    %eax,0x8(%ebp)
c010912f:	74 1c                	je     c010914d <sys_send_msg+0x507>
c0109131:	68 c9 05 00 00       	push   $0x5c9
c0109136:	68 01 bb 10 c0       	push   $0xc010bb01
c010913b:	68 01 bb 10 c0       	push   $0xc010bb01
c0109140:	68 ea c0 10 c0       	push   $0xc010c0ea
c0109145:	e8 0b fa ff ff       	call   c0108b55 <assertion_failure>
c010914a:	83 c4 10             	add    $0x10,%esp
c010914d:	83 ec 0c             	sub    $0xc,%esp
c0109150:	ff 75 10             	pushl  0x10(%ebp)
c0109153:	e8 68 07 00 00       	call   c01098c0 <block>
c0109158:	83 c4 10             	add    $0x10,%esp
c010915b:	eb 01                	jmp    c010915e <sys_send_msg+0x518>
c010915d:	90                   	nop
c010915e:	b8 00 00 00 00       	mov    $0x0,%eax
c0109163:	c9                   	leave  
c0109164:	c3                   	ret    

c0109165 <sys_receive_msg>:
c0109165:	55                   	push   %ebp
c0109166:	89 e5                	mov    %esp,%ebp
c0109168:	83 ec 58             	sub    $0x58,%esp
c010916b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109172:	83 ec 0c             	sub    $0xc,%esp
c0109175:	ff 75 0c             	pushl  0xc(%ebp)
c0109178:	e8 09 a9 ff ff       	call   c0103a86 <pid2proc>
c010917d:	83 c4 10             	add    $0x10,%esp
c0109180:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109183:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109187:	74 2c                	je     c01091b5 <sys_receive_msg+0x50>
c0109189:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010918c:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0109192:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0109197:	74 1c                	je     c01091b5 <sys_receive_msg+0x50>
c0109199:	68 dd 05 00 00       	push   $0x5dd
c010919e:	68 01 bb 10 c0       	push   $0xc010bb01
c01091a3:	68 01 bb 10 c0       	push   $0xc010bb01
c01091a8:	68 c0 be 10 c0       	push   $0xc010bec0
c01091ad:	e8 a3 f9 ff ff       	call   c0108b55 <assertion_failure>
c01091b2:	83 c4 10             	add    $0x10,%esp
c01091b5:	8b 45 10             	mov    0x10(%ebp),%eax
c01091b8:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01091be:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01091c3:	74 1c                	je     c01091e1 <sys_receive_msg+0x7c>
c01091c5:	68 df 05 00 00       	push   $0x5df
c01091ca:	68 01 bb 10 c0       	push   $0xc010bb01
c01091cf:	68 01 bb 10 c0       	push   $0xc010bb01
c01091d4:	68 98 be 10 c0       	push   $0xc010be98
c01091d9:	e8 77 f9 ff ff       	call   c0108b55 <assertion_failure>
c01091de:	83 c4 10             	add    $0x10,%esp
c01091e1:	8b 45 10             	mov    0x10(%ebp),%eax
c01091e4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091eb:	84 c0                	test   %al,%al
c01091ed:	74 65                	je     c0109254 <sys_receive_msg+0xef>
c01091ef:	8b 45 10             	mov    0x10(%ebp),%eax
c01091f2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091f9:	3c 01                	cmp    $0x1,%al
c01091fb:	74 57                	je     c0109254 <sys_receive_msg+0xef>
c01091fd:	8b 45 10             	mov    0x10(%ebp),%eax
c0109200:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109207:	3c 02                	cmp    $0x2,%al
c0109209:	74 49                	je     c0109254 <sys_receive_msg+0xef>
c010920b:	8b 45 10             	mov    0x10(%ebp),%eax
c010920e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109215:	3c 03                	cmp    $0x3,%al
c0109217:	74 3b                	je     c0109254 <sys_receive_msg+0xef>
c0109219:	8b 45 10             	mov    0x10(%ebp),%eax
c010921c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109223:	3c 04                	cmp    $0x4,%al
c0109225:	74 2d                	je     c0109254 <sys_receive_msg+0xef>
c0109227:	8b 45 10             	mov    0x10(%ebp),%eax
c010922a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109231:	0f be c0             	movsbl %al,%eax
c0109234:	83 ec 0c             	sub    $0xc,%esp
c0109237:	68 e2 05 00 00       	push   $0x5e2
c010923c:	68 01 bb 10 c0       	push   $0xc010bb01
c0109241:	68 01 bb 10 c0       	push   $0xc010bb01
c0109246:	50                   	push   %eax
c0109247:	68 f4 be 10 c0       	push   $0xc010bef4
c010924c:	e8 76 f9 ff ff       	call   c0108bc7 <assertion_failure2>
c0109251:	83 c4 20             	add    $0x20,%esp
c0109254:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109258:	74 73                	je     c01092cd <sys_receive_msg+0x168>
c010925a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010925d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109264:	84 c0                	test   %al,%al
c0109266:	74 65                	je     c01092cd <sys_receive_msg+0x168>
c0109268:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010926b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109272:	3c 01                	cmp    $0x1,%al
c0109274:	74 57                	je     c01092cd <sys_receive_msg+0x168>
c0109276:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109279:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109280:	3c 02                	cmp    $0x2,%al
c0109282:	74 49                	je     c01092cd <sys_receive_msg+0x168>
c0109284:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109287:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010928e:	3c 03                	cmp    $0x3,%al
c0109290:	74 3b                	je     c01092cd <sys_receive_msg+0x168>
c0109292:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109295:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010929c:	3c 04                	cmp    $0x4,%al
c010929e:	74 2d                	je     c01092cd <sys_receive_msg+0x168>
c01092a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01092a3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092aa:	0f be c0             	movsbl %al,%eax
c01092ad:	83 ec 0c             	sub    $0xc,%esp
c01092b0:	68 e6 05 00 00       	push   $0x5e6
c01092b5:	68 01 bb 10 c0       	push   $0xc010bb01
c01092ba:	68 01 bb 10 c0       	push   $0xc010bb01
c01092bf:	50                   	push   %eax
c01092c0:	68 90 bf 10 c0       	push   $0xc010bf90
c01092c5:	e8 fd f8 ff ff       	call   c0108bc7 <assertion_failure2>
c01092ca:	83 c4 20             	add    $0x20,%esp
c01092cd:	83 ec 0c             	sub    $0xc,%esp
c01092d0:	ff 75 10             	pushl  0x10(%ebp)
c01092d3:	e8 34 a8 ff ff       	call   c0103b0c <proc2pid>
c01092d8:	83 c4 10             	add    $0x10,%esp
c01092db:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01092de:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c01092e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01092e8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01092eb:	8b 45 10             	mov    0x10(%ebp),%eax
c01092ee:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01092f4:	83 ec 08             	sub    $0x8,%esp
c01092f7:	50                   	push   %eax
c01092f8:	ff 75 d8             	pushl  -0x28(%ebp)
c01092fb:	e8 a2 ce ff ff       	call   c01061a2 <get_physical_address_proc>
c0109300:	83 c4 10             	add    $0x10,%esp
c0109303:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109306:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010930d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109310:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109316:	85 c0                	test   %eax,%eax
c0109318:	0f 84 c5 00 00 00    	je     c01093e3 <sys_receive_msg+0x27e>
c010931e:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109322:	74 0d                	je     c0109331 <sys_receive_msg+0x1cc>
c0109324:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010932b:	0f 85 b2 00 00 00    	jne    c01093e3 <sys_receive_msg+0x27e>
c0109331:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0109338:	83 ec 0c             	sub    $0xc,%esp
c010933b:	ff 75 d0             	pushl  -0x30(%ebp)
c010933e:	e8 49 85 ff ff       	call   c010188c <sys_malloc>
c0109343:	83 c4 10             	add    $0x10,%esp
c0109346:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109349:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010934c:	83 ec 04             	sub    $0x4,%esp
c010934f:	50                   	push   %eax
c0109350:	6a 00                	push   $0x0
c0109352:	ff 75 cc             	pushl  -0x34(%ebp)
c0109355:	e8 15 2f 00 00       	call   c010c26f <Memset>
c010935a:	83 c4 10             	add    $0x10,%esp
c010935d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109360:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109366:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109369:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109370:	83 ec 08             	sub    $0x8,%esp
c0109373:	ff 75 d0             	pushl  -0x30(%ebp)
c0109376:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109379:	e8 51 cd ff ff       	call   c01060cf <alloc_virtual_memory>
c010937e:	83 c4 10             	add    $0x10,%esp
c0109381:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0109384:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0109387:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010938a:	83 ec 04             	sub    $0x4,%esp
c010938d:	52                   	push   %edx
c010938e:	ff 75 cc             	pushl  -0x34(%ebp)
c0109391:	50                   	push   %eax
c0109392:	e8 a5 db ff ff       	call   c0106f3c <Memcpy>
c0109397:	83 c4 10             	add    $0x10,%esp
c010939a:	8b 45 10             	mov    0x10(%ebp),%eax
c010939d:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c01093a4:	00 00 00 
c01093a7:	8b 45 10             	mov    0x10(%ebp),%eax
c01093aa:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01093b1:	00 00 00 
c01093b4:	8b 45 10             	mov    0x10(%ebp),%eax
c01093b7:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01093be:	00 00 00 
c01093c1:	8b 45 10             	mov    0x10(%ebp),%eax
c01093c4:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01093cb:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01093d2:	83 ec 08             	sub    $0x8,%esp
c01093d5:	ff 75 d0             	pushl  -0x30(%ebp)
c01093d8:	ff 75 cc             	pushl  -0x34(%ebp)
c01093db:	e8 c1 84 ff ff       	call   c01018a1 <sys_free>
c01093e0:	83 c4 10             	add    $0x10,%esp
c01093e3:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c01093e7:	0f 84 d4 03 00 00    	je     c01097c1 <sys_receive_msg+0x65c>
c01093ed:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01093f1:	75 26                	jne    c0109419 <sys_receive_msg+0x2b4>
c01093f3:	8b 45 10             	mov    0x10(%ebp),%eax
c01093f6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01093fc:	85 c0                	test   %eax,%eax
c01093fe:	0f 84 8a 00 00 00    	je     c010948e <sys_receive_msg+0x329>
c0109404:	8b 45 10             	mov    0x10(%ebp),%eax
c0109407:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010940d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109410:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0109417:	eb 75                	jmp    c010948e <sys_receive_msg+0x329>
c0109419:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010941d:	78 6f                	js     c010948e <sys_receive_msg+0x329>
c010941f:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109423:	7f 69                	jg     c010948e <sys_receive_msg+0x329>
c0109425:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109428:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010942f:	3c 01                	cmp    $0x1,%al
c0109431:	75 5b                	jne    c010948e <sys_receive_msg+0x329>
c0109433:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109436:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010943c:	83 f8 12             	cmp    $0x12,%eax
c010943f:	74 0e                	je     c010944f <sys_receive_msg+0x2ea>
c0109441:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109444:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010944a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c010944d:	75 3f                	jne    c010948e <sys_receive_msg+0x329>
c010944f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109452:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109458:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010945b:	eb 2b                	jmp    c0109488 <sys_receive_msg+0x323>
c010945d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109460:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109463:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109466:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010946c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010946f:	39 c2                	cmp    %eax,%edx
c0109471:	75 09                	jne    c010947c <sys_receive_msg+0x317>
c0109473:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010947a:	eb 12                	jmp    c010948e <sys_receive_msg+0x329>
c010947c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010947f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0109485:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109488:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010948c:	75 cf                	jne    c010945d <sys_receive_msg+0x2f8>
c010948e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0109492:	0f 85 4e 02 00 00    	jne    c01096e6 <sys_receive_msg+0x581>
c0109498:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010949b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010949e:	83 ec 08             	sub    $0x8,%esp
c01094a1:	ff 75 dc             	pushl  -0x24(%ebp)
c01094a4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01094a7:	e8 23 cc ff ff       	call   c01060cf <alloc_virtual_memory>
c01094ac:	83 c4 10             	add    $0x10,%esp
c01094af:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01094b2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01094b5:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01094bb:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01094be:	83 ec 0c             	sub    $0xc,%esp
c01094c1:	ff 75 c4             	pushl  -0x3c(%ebp)
c01094c4:	e8 43 a6 ff ff       	call   c0103b0c <proc2pid>
c01094c9:	83 c4 10             	add    $0x10,%esp
c01094cc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01094cf:	83 ec 08             	sub    $0x8,%esp
c01094d2:	ff 75 b8             	pushl  -0x48(%ebp)
c01094d5:	ff 75 bc             	pushl  -0x44(%ebp)
c01094d8:	e8 c5 cc ff ff       	call   c01061a2 <get_physical_address_proc>
c01094dd:	83 c4 10             	add    $0x10,%esp
c01094e0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01094e3:	83 ec 08             	sub    $0x8,%esp
c01094e6:	ff 75 dc             	pushl  -0x24(%ebp)
c01094e9:	ff 75 b4             	pushl  -0x4c(%ebp)
c01094ec:	e8 de cb ff ff       	call   c01060cf <alloc_virtual_memory>
c01094f1:	83 c4 10             	add    $0x10,%esp
c01094f4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01094f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01094fa:	83 ec 04             	sub    $0x4,%esp
c01094fd:	50                   	push   %eax
c01094fe:	ff 75 b0             	pushl  -0x50(%ebp)
c0109501:	ff 75 c0             	pushl  -0x40(%ebp)
c0109504:	e8 33 da ff ff       	call   c0106f3c <Memcpy>
c0109509:	83 c4 10             	add    $0x10,%esp
c010950c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010950f:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0109512:	8b 45 10             	mov    0x10(%ebp),%eax
c0109515:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010951b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010951e:	75 21                	jne    c0109541 <sys_receive_msg+0x3dc>
c0109520:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109523:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109529:	8b 45 10             	mov    0x10(%ebp),%eax
c010952c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109532:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109535:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010953c:	00 00 00 
c010953f:	eb 1f                	jmp    c0109560 <sys_receive_msg+0x3fb>
c0109541:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109544:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010954a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010954d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109553:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109556:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010955d:	00 00 00 
c0109560:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109563:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010956a:	00 00 00 
c010956d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109570:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109577:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010957a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109581:	00 00 00 
c0109584:	8b 45 10             	mov    0x10(%ebp),%eax
c0109587:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010958e:	00 00 00 
c0109591:	8b 45 10             	mov    0x10(%ebp),%eax
c0109594:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010959b:	00 00 00 
c010959e:	8b 45 10             	mov    0x10(%ebp),%eax
c01095a1:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01095a8:	00 00 00 
c01095ab:	83 ec 0c             	sub    $0xc,%esp
c01095ae:	ff 75 c4             	pushl  -0x3c(%ebp)
c01095b1:	e8 46 03 00 00       	call   c01098fc <unblock>
c01095b6:	83 c4 10             	add    $0x10,%esp
c01095b9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01095bc:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01095c2:	85 c0                	test   %eax,%eax
c01095c4:	74 1c                	je     c01095e2 <sys_receive_msg+0x47d>
c01095c6:	68 56 06 00 00       	push   $0x656
c01095cb:	68 01 bb 10 c0       	push   $0xc010bb01
c01095d0:	68 01 bb 10 c0       	push   $0xc010bb01
c01095d5:	68 ff c0 10 c0       	push   $0xc010c0ff
c01095da:	e8 76 f5 ff ff       	call   c0108b55 <assertion_failure>
c01095df:	83 c4 10             	add    $0x10,%esp
c01095e2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01095e5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01095ec:	84 c0                	test   %al,%al
c01095ee:	74 1c                	je     c010960c <sys_receive_msg+0x4a7>
c01095f0:	68 57 06 00 00       	push   $0x657
c01095f5:	68 01 bb 10 c0       	push   $0xc010bb01
c01095fa:	68 01 bb 10 c0       	push   $0xc010bb01
c01095ff:	68 17 c1 10 c0       	push   $0xc010c117
c0109604:	e8 4c f5 ff ff       	call   c0108b55 <assertion_failure>
c0109609:	83 c4 10             	add    $0x10,%esp
c010960c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010960f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109615:	83 f8 21             	cmp    $0x21,%eax
c0109618:	74 1c                	je     c0109636 <sys_receive_msg+0x4d1>
c010961a:	68 58 06 00 00       	push   $0x658
c010961f:	68 01 bb 10 c0       	push   $0xc010bb01
c0109624:	68 01 bb 10 c0       	push   $0xc010bb01
c0109629:	68 30 c1 10 c0       	push   $0xc010c130
c010962e:	e8 22 f5 ff ff       	call   c0108b55 <assertion_failure>
c0109633:	83 c4 10             	add    $0x10,%esp
c0109636:	8b 45 10             	mov    0x10(%ebp),%eax
c0109639:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010963f:	85 c0                	test   %eax,%eax
c0109641:	74 1c                	je     c010965f <sys_receive_msg+0x4fa>
c0109643:	68 5a 06 00 00       	push   $0x65a
c0109648:	68 01 bb 10 c0       	push   $0xc010bb01
c010964d:	68 01 bb 10 c0       	push   $0xc010bb01
c0109652:	68 5c c0 10 c0       	push   $0xc010c05c
c0109657:	e8 f9 f4 ff ff       	call   c0108b55 <assertion_failure>
c010965c:	83 c4 10             	add    $0x10,%esp
c010965f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109662:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109669:	84 c0                	test   %al,%al
c010966b:	74 1c                	je     c0109689 <sys_receive_msg+0x524>
c010966d:	68 5b 06 00 00       	push   $0x65b
c0109672:	68 01 bb 10 c0       	push   $0xc010bb01
c0109677:	68 01 bb 10 c0       	push   $0xc010bb01
c010967c:	68 71 c0 10 c0       	push   $0xc010c071
c0109681:	e8 cf f4 ff ff       	call   c0108b55 <assertion_failure>
c0109686:	83 c4 10             	add    $0x10,%esp
c0109689:	8b 45 10             	mov    0x10(%ebp),%eax
c010968c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109692:	83 f8 21             	cmp    $0x21,%eax
c0109695:	74 1c                	je     c01096b3 <sys_receive_msg+0x54e>
c0109697:	68 5c 06 00 00       	push   $0x65c
c010969c:	68 01 bb 10 c0       	push   $0xc010bb01
c01096a1:	68 01 bb 10 c0       	push   $0xc010bb01
c01096a6:	68 88 c0 10 c0       	push   $0xc010c088
c01096ab:	e8 a5 f4 ff ff       	call   c0108b55 <assertion_failure>
c01096b0:	83 c4 10             	add    $0x10,%esp
c01096b3:	8b 45 10             	mov    0x10(%ebp),%eax
c01096b6:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01096bc:	83 f8 21             	cmp    $0x21,%eax
c01096bf:	0f 84 f5 00 00 00    	je     c01097ba <sys_receive_msg+0x655>
c01096c5:	68 5d 06 00 00       	push   $0x65d
c01096ca:	68 01 bb 10 c0       	push   $0xc010bb01
c01096cf:	68 01 bb 10 c0       	push   $0xc010bb01
c01096d4:	68 54 c1 10 c0       	push   $0xc010c154
c01096d9:	e8 77 f4 ff ff       	call   c0108b55 <assertion_failure>
c01096de:	83 c4 10             	add    $0x10,%esp
c01096e1:	e9 d4 00 00 00       	jmp    c01097ba <sys_receive_msg+0x655>
c01096e6:	8b 45 10             	mov    0x10(%ebp),%eax
c01096e9:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c01096f0:	8b 45 10             	mov    0x10(%ebp),%eax
c01096f3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096fa:	3c 02                	cmp    $0x2,%al
c01096fc:	74 1c                	je     c010971a <sys_receive_msg+0x5b5>
c01096fe:	68 62 06 00 00       	push   $0x662
c0109703:	68 01 bb 10 c0       	push   $0xc010bb01
c0109708:	68 01 bb 10 c0       	push   $0xc010bb01
c010970d:	68 73 c1 10 c0       	push   $0xc010c173
c0109712:	e8 3e f4 ff ff       	call   c0108b55 <assertion_failure>
c0109717:	83 c4 10             	add    $0x10,%esp
c010971a:	8b 45 10             	mov    0x10(%ebp),%eax
c010971d:	8b 55 08             	mov    0x8(%ebp),%edx
c0109720:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109726:	8b 45 10             	mov    0x10(%ebp),%eax
c0109729:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109730:	3c 02                	cmp    $0x2,%al
c0109732:	74 1c                	je     c0109750 <sys_receive_msg+0x5eb>
c0109734:	68 64 06 00 00       	push   $0x664
c0109739:	68 01 bb 10 c0       	push   $0xc010bb01
c010973e:	68 01 bb 10 c0       	push   $0xc010bb01
c0109743:	68 73 c1 10 c0       	push   $0xc010c173
c0109748:	e8 08 f4 ff ff       	call   c0108b55 <assertion_failure>
c010974d:	83 c4 10             	add    $0x10,%esp
c0109750:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109754:	75 0f                	jne    c0109765 <sys_receive_msg+0x600>
c0109756:	8b 45 10             	mov    0x10(%ebp),%eax
c0109759:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c0109760:	00 00 00 
c0109763:	eb 0c                	jmp    c0109771 <sys_receive_msg+0x60c>
c0109765:	8b 45 10             	mov    0x10(%ebp),%eax
c0109768:	8b 55 0c             	mov    0xc(%ebp),%edx
c010976b:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0109771:	8b 45 10             	mov    0x10(%ebp),%eax
c0109774:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010977b:	3c 02                	cmp    $0x2,%al
c010977d:	74 2d                	je     c01097ac <sys_receive_msg+0x647>
c010977f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109782:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109789:	0f be c0             	movsbl %al,%eax
c010978c:	83 ec 0c             	sub    $0xc,%esp
c010978f:	68 6f 06 00 00       	push   $0x66f
c0109794:	68 01 bb 10 c0       	push   $0xc010bb01
c0109799:	68 01 bb 10 c0       	push   $0xc010bb01
c010979e:	50                   	push   %eax
c010979f:	68 73 c1 10 c0       	push   $0xc010c173
c01097a4:	e8 1e f4 ff ff       	call   c0108bc7 <assertion_failure2>
c01097a9:	83 c4 20             	add    $0x20,%esp
c01097ac:	83 ec 0c             	sub    $0xc,%esp
c01097af:	ff 75 10             	pushl  0x10(%ebp)
c01097b2:	e8 09 01 00 00       	call   c01098c0 <block>
c01097b7:	83 c4 10             	add    $0x10,%esp
c01097ba:	b8 00 00 00 00       	mov    $0x0,%eax
c01097bf:	eb 02                	jmp    c01097c3 <sys_receive_msg+0x65e>
c01097c1:	90                   	nop
c01097c2:	90                   	nop
c01097c3:	c9                   	leave  
c01097c4:	c3                   	ret    

c01097c5 <send_rec>:
c01097c5:	55                   	push   %ebp
c01097c6:	89 e5                	mov    %esp,%ebp
c01097c8:	83 ec 18             	sub    $0x18,%esp
c01097cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01097d1:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01097d8:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01097dc:	74 28                	je     c0109806 <send_rec+0x41>
c01097de:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01097e2:	74 22                	je     c0109806 <send_rec+0x41>
c01097e4:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01097e8:	74 1c                	je     c0109806 <send_rec+0x41>
c01097ea:	68 81 06 00 00       	push   $0x681
c01097ef:	68 01 bb 10 c0       	push   $0xc010bb01
c01097f4:	68 01 bb 10 c0       	push   $0xc010bb01
c01097f9:	68 94 c1 10 c0       	push   $0xc010c194
c01097fe:	e8 52 f3 ff ff       	call   c0108b55 <assertion_failure>
c0109803:	83 c4 10             	add    $0x10,%esp
c0109806:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010980a:	75 14                	jne    c0109820 <send_rec+0x5b>
c010980c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010980f:	83 ec 04             	sub    $0x4,%esp
c0109812:	50                   	push   %eax
c0109813:	6a 00                	push   $0x0
c0109815:	ff 75 0c             	pushl  0xc(%ebp)
c0109818:	e8 52 2a 00 00       	call   c010c26f <Memset>
c010981d:	83 c4 10             	add    $0x10,%esp
c0109820:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109824:	74 23                	je     c0109849 <send_rec+0x84>
c0109826:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010982a:	74 34                	je     c0109860 <send_rec+0x9b>
c010982c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109830:	75 74                	jne    c01098a6 <send_rec+0xe1>
c0109832:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109835:	83 ec 08             	sub    $0x8,%esp
c0109838:	ff 75 10             	pushl  0x10(%ebp)
c010983b:	50                   	push   %eax
c010983c:	e8 1f 80 ff ff       	call   c0101860 <send_msg>
c0109841:	83 c4 10             	add    $0x10,%esp
c0109844:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109847:	eb 70                	jmp    c01098b9 <send_rec+0xf4>
c0109849:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010984c:	83 ec 08             	sub    $0x8,%esp
c010984f:	ff 75 10             	pushl  0x10(%ebp)
c0109852:	50                   	push   %eax
c0109853:	e8 1e 80 ff ff       	call   c0101876 <receive_msg>
c0109858:	83 c4 10             	add    $0x10,%esp
c010985b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010985e:	eb 59                	jmp    c01098b9 <send_rec+0xf4>
c0109860:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109863:	83 ec 08             	sub    $0x8,%esp
c0109866:	ff 75 10             	pushl  0x10(%ebp)
c0109869:	50                   	push   %eax
c010986a:	e8 f1 7f ff ff       	call   c0101860 <send_msg>
c010986f:	83 c4 10             	add    $0x10,%esp
c0109872:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109875:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0109879:	75 3d                	jne    c01098b8 <send_rec+0xf3>
c010987b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010987e:	83 ec 04             	sub    $0x4,%esp
c0109881:	50                   	push   %eax
c0109882:	6a 00                	push   $0x0
c0109884:	ff 75 0c             	pushl  0xc(%ebp)
c0109887:	e8 e3 29 00 00       	call   c010c26f <Memset>
c010988c:	83 c4 10             	add    $0x10,%esp
c010988f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109892:	83 ec 08             	sub    $0x8,%esp
c0109895:	ff 75 10             	pushl  0x10(%ebp)
c0109898:	50                   	push   %eax
c0109899:	e8 d8 7f ff ff       	call   c0101876 <receive_msg>
c010989e:	83 c4 10             	add    $0x10,%esp
c01098a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01098a4:	eb 12                	jmp    c01098b8 <send_rec+0xf3>
c01098a6:	83 ec 0c             	sub    $0xc,%esp
c01098a9:	68 d0 c1 10 c0       	push   $0xc010c1d0
c01098ae:	e8 84 f2 ff ff       	call   c0108b37 <panic>
c01098b3:	83 c4 10             	add    $0x10,%esp
c01098b6:	eb 01                	jmp    c01098b9 <send_rec+0xf4>
c01098b8:	90                   	nop
c01098b9:	b8 00 00 00 00       	mov    $0x0,%eax
c01098be:	c9                   	leave  
c01098bf:	c3                   	ret    

c01098c0 <block>:
c01098c0:	55                   	push   %ebp
c01098c1:	89 e5                	mov    %esp,%ebp
c01098c3:	83 ec 08             	sub    $0x8,%esp
c01098c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01098c9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01098d0:	84 c0                	test   %al,%al
c01098d2:	75 1c                	jne    c01098f0 <block+0x30>
c01098d4:	68 b0 06 00 00       	push   $0x6b0
c01098d9:	68 01 bb 10 c0       	push   $0xc010bb01
c01098de:	68 01 bb 10 c0       	push   $0xc010bb01
c01098e3:	68 e5 c1 10 c0       	push   $0xc010c1e5
c01098e8:	e8 68 f2 ff ff       	call   c0108b55 <assertion_failure>
c01098ed:	83 c4 10             	add    $0x10,%esp
c01098f0:	e8 13 a0 ff ff       	call   c0103908 <schedule_process>
c01098f5:	b8 00 00 00 00       	mov    $0x0,%eax
c01098fa:	c9                   	leave  
c01098fb:	c3                   	ret    

c01098fc <unblock>:
c01098fc:	55                   	push   %ebp
c01098fd:	89 e5                	mov    %esp,%ebp
c01098ff:	83 ec 08             	sub    $0x8,%esp
c0109902:	8b 45 08             	mov    0x8(%ebp),%eax
c0109905:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010990c:	84 c0                	test   %al,%al
c010990e:	74 1c                	je     c010992c <unblock+0x30>
c0109910:	68 b9 06 00 00       	push   $0x6b9
c0109915:	68 01 bb 10 c0       	push   $0xc010bb01
c010991a:	68 01 bb 10 c0       	push   $0xc010bb01
c010991f:	68 fd c1 10 c0       	push   $0xc010c1fd
c0109924:	e8 2c f2 ff ff       	call   c0108b55 <assertion_failure>
c0109929:	83 c4 10             	add    $0x10,%esp
c010992c:	8b 45 08             	mov    0x8(%ebp),%eax
c010992f:	05 60 02 00 00       	add    $0x260,%eax
c0109934:	83 ec 08             	sub    $0x8,%esp
c0109937:	50                   	push   %eax
c0109938:	68 ec fd 10 c0       	push   $0xc010fdec
c010993d:	e8 ce 0a 00 00       	call   c010a410 <appendToDoubleLinkList>
c0109942:	83 c4 10             	add    $0x10,%esp
c0109945:	b8 00 00 00 00       	mov    $0x0,%eax
c010994a:	c9                   	leave  
c010994b:	c3                   	ret    

c010994c <get_ticks_ipc>:
c010994c:	55                   	push   %ebp
c010994d:	89 e5                	mov    %esp,%ebp
c010994f:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109955:	83 ec 04             	sub    $0x4,%esp
c0109958:	6a 7c                	push   $0x7c
c010995a:	6a 00                	push   $0x0
c010995c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109962:	50                   	push   %eax
c0109963:	e8 07 29 00 00       	call   c010c26f <Memset>
c0109968:	83 c4 10             	add    $0x10,%esp
c010996b:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109972:	00 00 00 
c0109975:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010997c:	83 ec 04             	sub    $0x4,%esp
c010997f:	6a 01                	push   $0x1
c0109981:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109987:	50                   	push   %eax
c0109988:	6a 03                	push   $0x3
c010998a:	e8 36 fe ff ff       	call   c01097c5 <send_rec>
c010998f:	83 c4 10             	add    $0x10,%esp
c0109992:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109995:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010999b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010999e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01099a1:	c9                   	leave  
c01099a2:	c3                   	ret    

c01099a3 <itoa>:
c01099a3:	55                   	push   %ebp
c01099a4:	89 e5                	mov    %esp,%ebp
c01099a6:	53                   	push   %ebx
c01099a7:	83 ec 14             	sub    $0x14,%esp
c01099aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01099ad:	99                   	cltd   
c01099ae:	f7 7d 10             	idivl  0x10(%ebp)
c01099b1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01099b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01099b7:	99                   	cltd   
c01099b8:	f7 7d 10             	idivl  0x10(%ebp)
c01099bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01099be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01099c2:	74 14                	je     c01099d8 <itoa+0x35>
c01099c4:	83 ec 04             	sub    $0x4,%esp
c01099c7:	ff 75 10             	pushl  0x10(%ebp)
c01099ca:	ff 75 0c             	pushl  0xc(%ebp)
c01099cd:	ff 75 f0             	pushl  -0x10(%ebp)
c01099d0:	e8 ce ff ff ff       	call   c01099a3 <itoa>
c01099d5:	83 c4 10             	add    $0x10,%esp
c01099d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099db:	8d 58 30             	lea    0x30(%eax),%ebx
c01099de:	8b 45 0c             	mov    0xc(%ebp),%eax
c01099e1:	8b 00                	mov    (%eax),%eax
c01099e3:	8d 48 01             	lea    0x1(%eax),%ecx
c01099e6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01099e9:	89 0a                	mov    %ecx,(%edx)
c01099eb:	89 da                	mov    %ebx,%edx
c01099ed:	88 10                	mov    %dl,(%eax)
c01099ef:	8b 45 0c             	mov    0xc(%ebp),%eax
c01099f2:	8b 00                	mov    (%eax),%eax
c01099f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01099f7:	c9                   	leave  
c01099f8:	c3                   	ret    

c01099f9 <i2a>:
c01099f9:	55                   	push   %ebp
c01099fa:	89 e5                	mov    %esp,%ebp
c01099fc:	53                   	push   %ebx
c01099fd:	83 ec 14             	sub    $0x14,%esp
c0109a00:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a03:	99                   	cltd   
c0109a04:	f7 7d 0c             	idivl  0xc(%ebp)
c0109a07:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109a0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a0d:	99                   	cltd   
c0109a0e:	f7 7d 0c             	idivl  0xc(%ebp)
c0109a11:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a14:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109a18:	74 14                	je     c0109a2e <i2a+0x35>
c0109a1a:	83 ec 04             	sub    $0x4,%esp
c0109a1d:	ff 75 10             	pushl  0x10(%ebp)
c0109a20:	ff 75 0c             	pushl  0xc(%ebp)
c0109a23:	ff 75 f0             	pushl  -0x10(%ebp)
c0109a26:	e8 ce ff ff ff       	call   c01099f9 <i2a>
c0109a2b:	83 c4 10             	add    $0x10,%esp
c0109a2e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109a32:	7f 0a                	jg     c0109a3e <i2a+0x45>
c0109a34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a37:	83 c0 30             	add    $0x30,%eax
c0109a3a:	89 c3                	mov    %eax,%ebx
c0109a3c:	eb 08                	jmp    c0109a46 <i2a+0x4d>
c0109a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a41:	83 c0 37             	add    $0x37,%eax
c0109a44:	89 c3                	mov    %eax,%ebx
c0109a46:	8b 45 10             	mov    0x10(%ebp),%eax
c0109a49:	8b 00                	mov    (%eax),%eax
c0109a4b:	8d 48 01             	lea    0x1(%eax),%ecx
c0109a4e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109a51:	89 0a                	mov    %ecx,(%edx)
c0109a53:	88 18                	mov    %bl,(%eax)
c0109a55:	8b 45 10             	mov    0x10(%ebp),%eax
c0109a58:	8b 00                	mov    (%eax),%eax
c0109a5a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109a5d:	c9                   	leave  
c0109a5e:	c3                   	ret    

c0109a5f <inform_int>:
c0109a5f:	55                   	push   %ebp
c0109a60:	89 e5                	mov    %esp,%ebp
c0109a62:	83 ec 18             	sub    $0x18,%esp
c0109a65:	83 ec 0c             	sub    $0xc,%esp
c0109a68:	ff 75 08             	pushl  0x8(%ebp)
c0109a6b:	e8 16 a0 ff ff       	call   c0103a86 <pid2proc>
c0109a70:	83 c4 10             	add    $0x10,%esp
c0109a73:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a79:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109a80:	0f be c0             	movsbl %al,%eax
c0109a83:	83 e0 02             	and    $0x2,%eax
c0109a86:	85 c0                	test   %eax,%eax
c0109a88:	0f 84 8e 00 00 00    	je     c0109b1c <inform_int+0xbd>
c0109a8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a91:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109a97:	3d 13 02 00 00       	cmp    $0x213,%eax
c0109a9c:	74 0e                	je     c0109aac <inform_int+0x4d>
c0109a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109aa1:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109aa7:	83 f8 12             	cmp    $0x12,%eax
c0109aaa:	75 7d                	jne    c0109b29 <inform_int+0xca>
c0109aac:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109ab3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ab6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109abc:	83 ec 08             	sub    $0x8,%esp
c0109abf:	ff 75 f0             	pushl  -0x10(%ebp)
c0109ac2:	50                   	push   %eax
c0109ac3:	e8 07 c6 ff ff       	call   c01060cf <alloc_virtual_memory>
c0109ac8:	83 c4 10             	add    $0x10,%esp
c0109acb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109ace:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109ad1:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109ad7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109ada:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109ae1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ae4:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109aeb:	00 00 00 
c0109aee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109af1:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109af8:	00 00 00 
c0109afb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109b02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b05:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109b0c:	83 ec 0c             	sub    $0xc,%esp
c0109b0f:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b12:	e8 e5 fd ff ff       	call   c01098fc <unblock>
c0109b17:	83 c4 10             	add    $0x10,%esp
c0109b1a:	eb 0d                	jmp    c0109b29 <inform_int+0xca>
c0109b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b1f:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109b26:	00 00 00 
c0109b29:	90                   	nop
c0109b2a:	c9                   	leave  
c0109b2b:	c3                   	ret    

c0109b2c <strcmp>:
c0109b2c:	55                   	push   %ebp
c0109b2d:	89 e5                	mov    %esp,%ebp
c0109b2f:	83 ec 10             	sub    $0x10,%esp
c0109b32:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109b36:	74 06                	je     c0109b3e <strcmp+0x12>
c0109b38:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109b3c:	75 08                	jne    c0109b46 <strcmp+0x1a>
c0109b3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b41:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109b44:	eb 53                	jmp    c0109b99 <strcmp+0x6d>
c0109b46:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b49:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0109b4c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109b4f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109b52:	eb 18                	jmp    c0109b6c <strcmp+0x40>
c0109b54:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109b57:	0f b6 10             	movzbl (%eax),%edx
c0109b5a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109b5d:	0f b6 00             	movzbl (%eax),%eax
c0109b60:	38 c2                	cmp    %al,%dl
c0109b62:	75 1e                	jne    c0109b82 <strcmp+0x56>
c0109b64:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0109b68:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0109b6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109b6f:	0f b6 00             	movzbl (%eax),%eax
c0109b72:	84 c0                	test   %al,%al
c0109b74:	74 0d                	je     c0109b83 <strcmp+0x57>
c0109b76:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109b79:	0f b6 00             	movzbl (%eax),%eax
c0109b7c:	84 c0                	test   %al,%al
c0109b7e:	75 d4                	jne    c0109b54 <strcmp+0x28>
c0109b80:	eb 01                	jmp    c0109b83 <strcmp+0x57>
c0109b82:	90                   	nop
c0109b83:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109b86:	0f b6 00             	movzbl (%eax),%eax
c0109b89:	0f be d0             	movsbl %al,%edx
c0109b8c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109b8f:	0f b6 00             	movzbl (%eax),%eax
c0109b92:	0f be c0             	movsbl %al,%eax
c0109b95:	29 c2                	sub    %eax,%edx
c0109b97:	89 d0                	mov    %edx,%eax
c0109b99:	c9                   	leave  
c0109b9a:	c3                   	ret    

c0109b9b <create_user_process_address_space>:
c0109b9b:	55                   	push   %ebp
c0109b9c:	89 e5                	mov    %esp,%ebp
c0109b9e:	83 ec 18             	sub    $0x18,%esp
c0109ba1:	83 ec 08             	sub    $0x8,%esp
c0109ba4:	6a 00                	push   $0x0
c0109ba6:	6a 01                	push   $0x1
c0109ba8:	e8 5a c8 ff ff       	call   c0106407 <alloc_memory>
c0109bad:	83 c4 10             	add    $0x10,%esp
c0109bb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109bb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bb6:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109bbd:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bc7:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109bcc:	c1 e8 0c             	shr    $0xc,%eax
c0109bcf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109bd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109bd5:	83 c0 07             	add    $0x7,%eax
c0109bd8:	c1 e8 03             	shr    $0x3,%eax
c0109bdb:	89 c2                	mov    %eax,%edx
c0109bdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109be0:	89 50 04             	mov    %edx,0x4(%eax)
c0109be3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109be6:	8b 40 04             	mov    0x4(%eax),%eax
c0109be9:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109bee:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0109bf4:	85 c0                	test   %eax,%eax
c0109bf6:	0f 48 c2             	cmovs  %edx,%eax
c0109bf9:	c1 f8 0c             	sar    $0xc,%eax
c0109bfc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109bff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109c02:	83 ec 08             	sub    $0x8,%esp
c0109c05:	6a 00                	push   $0x0
c0109c07:	50                   	push   %eax
c0109c08:	e8 fa c7 ff ff       	call   c0106407 <alloc_memory>
c0109c0d:	83 c4 10             	add    $0x10,%esp
c0109c10:	89 c2                	mov    %eax,%edx
c0109c12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c15:	89 10                	mov    %edx,(%eax)
c0109c17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c1a:	83 ec 0c             	sub    $0xc,%esp
c0109c1d:	50                   	push   %eax
c0109c1e:	e8 b6 bf ff ff       	call   c0105bd9 <init_bitmap>
c0109c23:	83 c4 10             	add    $0x10,%esp
c0109c26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c29:	c9                   	leave  
c0109c2a:	c3                   	ret    

c0109c2b <user_process>:
c0109c2b:	55                   	push   %ebp
c0109c2c:	89 e5                	mov    %esp,%ebp
c0109c2e:	83 ec 38             	sub    $0x38,%esp
c0109c31:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109c38:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109c3f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109c46:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0109c4a:	75 0e                	jne    c0109c5a <user_process+0x2f>
c0109c4c:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109c52:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109c58:	eb 0c                	jmp    c0109c66 <user_process+0x3b>
c0109c5a:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109c60:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109c66:	e8 d1 67 ff ff       	call   c010043c <get_running_thread_pcb>
c0109c6b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c71:	8b 55 14             	mov    0x14(%ebp),%edx
c0109c74:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109c7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c7d:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109c83:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c86:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109c8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c8f:	05 00 10 00 00       	add    $0x1000,%eax
c0109c94:	89 c2                	mov    %eax,%edx
c0109c96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c99:	89 10                	mov    %edx,(%eax)
c0109c9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c9e:	8b 00                	mov    (%eax),%eax
c0109ca0:	83 e8 44             	sub    $0x44,%eax
c0109ca3:	89 c2                	mov    %eax,%edx
c0109ca5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ca8:	89 10                	mov    %edx,(%eax)
c0109caa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cad:	8b 00                	mov    (%eax),%eax
c0109caf:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109cb2:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109cb6:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109cbc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109cc0:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109cc4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109cc8:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109ccc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109cd0:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109cd4:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109cda:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109cde:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ce1:	89 50 34             	mov    %edx,0x34(%eax)
c0109ce4:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ce8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ceb:	89 50 0c             	mov    %edx,0xc(%eax)
c0109cee:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109cf2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109cf5:	89 50 04             	mov    %edx,0x4(%eax)
c0109cf8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109cfc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109cff:	89 50 08             	mov    %edx,0x8(%eax)
c0109d02:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109d06:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d09:	89 50 40             	mov    %edx,0x40(%eax)
c0109d0c:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109d10:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d13:	89 10                	mov    %edx,(%eax)
c0109d15:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d18:	8b 55 08             	mov    0x8(%ebp),%edx
c0109d1b:	89 50 30             	mov    %edx,0x30(%eax)
c0109d1e:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109d22:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d25:	89 50 38             	mov    %edx,0x38(%eax)
c0109d28:	83 ec 08             	sub    $0x8,%esp
c0109d2b:	6a 01                	push   $0x1
c0109d2d:	68 00 f0 ff bf       	push   $0xbffff000
c0109d32:	e8 08 c6 ff ff       	call   c010633f <alloc_physical_memory>
c0109d37:	83 c4 10             	add    $0x10,%esp
c0109d3a:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109d40:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d43:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109d46:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d49:	83 ec 0c             	sub    $0xc,%esp
c0109d4c:	50                   	push   %eax
c0109d4d:	e8 bd 65 ff ff       	call   c010030f <restart>
c0109d52:	83 c4 10             	add    $0x10,%esp
c0109d55:	90                   	nop
c0109d56:	c9                   	leave  
c0109d57:	c3                   	ret    

c0109d58 <clone_pcb>:
c0109d58:	55                   	push   %ebp
c0109d59:	89 e5                	mov    %esp,%ebp
c0109d5b:	83 ec 38             	sub    $0x38,%esp
c0109d5e:	83 ec 08             	sub    $0x8,%esp
c0109d61:	6a 00                	push   $0x0
c0109d63:	6a 01                	push   $0x1
c0109d65:	e8 9d c6 ff ff       	call   c0106407 <alloc_memory>
c0109d6a:	83 c4 10             	add    $0x10,%esp
c0109d6d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109d70:	83 ec 04             	sub    $0x4,%esp
c0109d73:	68 00 10 00 00       	push   $0x1000
c0109d78:	6a 00                	push   $0x0
c0109d7a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109d7d:	e8 ed 24 00 00       	call   c010c26f <Memset>
c0109d82:	83 c4 10             	add    $0x10,%esp
c0109d85:	83 ec 04             	sub    $0x4,%esp
c0109d88:	68 00 10 00 00       	push   $0x1000
c0109d8d:	ff 75 08             	pushl  0x8(%ebp)
c0109d90:	ff 75 f4             	pushl  -0xc(%ebp)
c0109d93:	e8 a4 d1 ff ff       	call   c0106f3c <Memcpy>
c0109d98:	83 c4 10             	add    $0x10,%esp
c0109d9b:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0109da0:	8d 50 01             	lea    0x1(%eax),%edx
c0109da3:	89 15 c8 06 11 c0    	mov    %edx,0xc01106c8
c0109da9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109dac:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109db2:	8b 45 08             	mov    0x8(%ebp),%eax
c0109db5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109dbb:	89 c2                	mov    %eax,%edx
c0109dbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dc0:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109dc6:	83 ec 08             	sub    $0x8,%esp
c0109dc9:	6a 00                	push   $0x0
c0109dcb:	6a 01                	push   $0x1
c0109dcd:	e8 35 c6 ff ff       	call   c0106407 <alloc_memory>
c0109dd2:	83 c4 10             	add    $0x10,%esp
c0109dd5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109dd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ddb:	05 00 0c 00 00       	add    $0xc00,%eax
c0109de0:	83 ec 04             	sub    $0x4,%esp
c0109de3:	68 00 04 00 00       	push   $0x400
c0109de8:	68 00 fc ff ff       	push   $0xfffffc00
c0109ded:	50                   	push   %eax
c0109dee:	e8 49 d1 ff ff       	call   c0106f3c <Memcpy>
c0109df3:	83 c4 10             	add    $0x10,%esp
c0109df6:	83 ec 0c             	sub    $0xc,%esp
c0109df9:	ff 75 f0             	pushl  -0x10(%ebp)
c0109dfc:	e8 1d c4 ff ff       	call   c010621e <get_physical_address>
c0109e01:	83 c4 10             	add    $0x10,%esp
c0109e04:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109e07:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e0a:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109e0f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109e12:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e15:	83 c8 07             	or     $0x7,%eax
c0109e18:	89 c2                	mov    %eax,%edx
c0109e1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e1d:	89 10                	mov    %edx,(%eax)
c0109e1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e22:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109e25:	89 50 08             	mov    %edx,0x8(%eax)
c0109e28:	e8 6e fd ff ff       	call   c0109b9b <create_user_process_address_space>
c0109e2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e30:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109e33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e36:	89 50 0c             	mov    %edx,0xc(%eax)
c0109e39:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e3c:	8b 40 0c             	mov    0xc(%eax),%eax
c0109e3f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109e42:	83 ec 04             	sub    $0x4,%esp
c0109e45:	6a 0c                	push   $0xc
c0109e47:	ff 75 e0             	pushl  -0x20(%ebp)
c0109e4a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109e4d:	e8 ea d0 ff ff       	call   c0106f3c <Memcpy>
c0109e52:	83 c4 10             	add    $0x10,%esp
c0109e55:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109e5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e5f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109e64:	c1 e8 0c             	shr    $0xc,%eax
c0109e67:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109e6a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e6d:	83 c0 07             	add    $0x7,%eax
c0109e70:	c1 e8 03             	shr    $0x3,%eax
c0109e73:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109e76:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e79:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109e7c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109e7f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109e84:	c1 e8 0c             	shr    $0xc,%eax
c0109e87:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109e8a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109e8d:	83 ec 08             	sub    $0x8,%esp
c0109e90:	6a 00                	push   $0x0
c0109e92:	50                   	push   %eax
c0109e93:	e8 6f c5 ff ff       	call   c0106407 <alloc_memory>
c0109e98:	83 c4 10             	add    $0x10,%esp
c0109e9b:	89 c2                	mov    %eax,%edx
c0109e9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ea0:	89 10                	mov    %edx,(%eax)
c0109ea2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109ea5:	c1 e0 0c             	shl    $0xc,%eax
c0109ea8:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109eab:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109eae:	8b 10                	mov    (%eax),%edx
c0109eb0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109eb3:	8b 00                	mov    (%eax),%eax
c0109eb5:	83 ec 04             	sub    $0x4,%esp
c0109eb8:	ff 75 cc             	pushl  -0x34(%ebp)
c0109ebb:	52                   	push   %edx
c0109ebc:	50                   	push   %eax
c0109ebd:	e8 7a d0 ff ff       	call   c0106f3c <Memcpy>
c0109ec2:	83 c4 10             	add    $0x10,%esp
c0109ec5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ec8:	c9                   	leave  
c0109ec9:	c3                   	ret    

c0109eca <build_body_stack>:
c0109eca:	55                   	push   %ebp
c0109ecb:	89 e5                	mov    %esp,%ebp
c0109ecd:	83 ec 48             	sub    $0x48,%esp
c0109ed0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ed3:	8b 40 0c             	mov    0xc(%eax),%eax
c0109ed6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109ed9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109edc:	8b 50 04             	mov    0x4(%eax),%edx
c0109edf:	8b 00                	mov    (%eax),%eax
c0109ee1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109ee4:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109ee7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109eea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109eed:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109ef0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109ef3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ef6:	8b 40 08             	mov    0x8(%eax),%eax
c0109ef9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109efc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109f03:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109f0a:	e8 c9 cf ff ff       	call   c0106ed8 <intr_disable>
c0109f0f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109f12:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109f19:	e9 c2 00 00 00       	jmp    c0109fe0 <build_body_stack+0x116>
c0109f1e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109f21:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109f24:	01 d0                	add    %edx,%eax
c0109f26:	0f b6 00             	movzbl (%eax),%eax
c0109f29:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109f2c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109f33:	e9 9a 00 00 00       	jmp    c0109fd2 <build_body_stack+0x108>
c0109f38:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109f3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109f3f:	89 c1                	mov    %eax,%ecx
c0109f41:	d3 fa                	sar    %cl,%edx
c0109f43:	89 d0                	mov    %edx,%eax
c0109f45:	83 e0 01             	and    $0x1,%eax
c0109f48:	85 c0                	test   %eax,%eax
c0109f4a:	75 06                	jne    c0109f52 <build_body_stack+0x88>
c0109f4c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109f50:	eb 7c                	jmp    c0109fce <build_body_stack+0x104>
c0109f52:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f55:	8b 40 08             	mov    0x8(%eax),%eax
c0109f58:	83 ec 0c             	sub    $0xc,%esp
c0109f5b:	50                   	push   %eax
c0109f5c:	e8 bf 64 ff ff       	call   c0100420 <update_cr3>
c0109f61:	83 c4 10             	add    $0x10,%esp
c0109f64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f67:	c1 e0 0c             	shl    $0xc,%eax
c0109f6a:	89 c2                	mov    %eax,%edx
c0109f6c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109f6f:	01 d0                	add    %edx,%eax
c0109f71:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109f74:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109f77:	8b 45 10             	mov    0x10(%ebp),%eax
c0109f7a:	83 ec 04             	sub    $0x4,%esp
c0109f7d:	68 00 10 00 00       	push   $0x1000
c0109f82:	52                   	push   %edx
c0109f83:	50                   	push   %eax
c0109f84:	e8 b3 cf ff ff       	call   c0106f3c <Memcpy>
c0109f89:	83 c4 10             	add    $0x10,%esp
c0109f8c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109f8f:	8b 40 08             	mov    0x8(%eax),%eax
c0109f92:	83 ec 0c             	sub    $0xc,%esp
c0109f95:	50                   	push   %eax
c0109f96:	e8 85 64 ff ff       	call   c0100420 <update_cr3>
c0109f9b:	83 c4 10             	add    $0x10,%esp
c0109f9e:	83 ec 08             	sub    $0x8,%esp
c0109fa1:	ff 75 cc             	pushl  -0x34(%ebp)
c0109fa4:	6a 01                	push   $0x1
c0109fa6:	e8 be c4 ff ff       	call   c0106469 <get_a_virtual_page>
c0109fab:	83 c4 10             	add    $0x10,%esp
c0109fae:	8b 55 10             	mov    0x10(%ebp),%edx
c0109fb1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109fb4:	83 ec 04             	sub    $0x4,%esp
c0109fb7:	68 00 10 00 00       	push   $0x1000
c0109fbc:	52                   	push   %edx
c0109fbd:	50                   	push   %eax
c0109fbe:	e8 79 cf ff ff       	call   c0106f3c <Memcpy>
c0109fc3:	83 c4 10             	add    $0x10,%esp
c0109fc6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109fca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109fce:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109fd2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109fd6:	0f 8e 5c ff ff ff    	jle    c0109f38 <build_body_stack+0x6e>
c0109fdc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109fe0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109fe3:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109fe6:	0f 87 32 ff ff ff    	ja     c0109f1e <build_body_stack+0x54>
c0109fec:	83 ec 0c             	sub    $0xc,%esp
c0109fef:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109ff2:	e8 0a cf ff ff       	call   c0106f01 <intr_set_status>
c0109ff7:	83 c4 10             	add    $0x10,%esp
c0109ffa:	90                   	nop
c0109ffb:	c9                   	leave  
c0109ffc:	c3                   	ret    

c0109ffd <build_process_kernel_stack>:
c0109ffd:	55                   	push   %ebp
c0109ffe:	89 e5                	mov    %esp,%ebp
c010a000:	83 ec 28             	sub    $0x28,%esp
c010a003:	e8 d0 ce ff ff       	call   c0106ed8 <intr_disable>
c010a008:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a00b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a00e:	05 00 10 00 00       	add    $0x1000,%eax
c010a013:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a016:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a019:	8b 00                	mov    (%eax),%eax
c010a01b:	83 f8 38             	cmp    $0x38,%eax
c010a01e:	74 06                	je     c010a026 <build_process_kernel_stack+0x29>
c010a020:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010a024:	eb f0                	jmp    c010a016 <build_process_kernel_stack+0x19>
c010a026:	90                   	nop
c010a027:	8b 45 08             	mov    0x8(%ebp),%eax
c010a02a:	05 00 10 00 00       	add    $0x1000,%eax
c010a02f:	89 c2                	mov    %eax,%edx
c010a031:	8b 45 08             	mov    0x8(%ebp),%eax
c010a034:	89 50 04             	mov    %edx,0x4(%eax)
c010a037:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a03a:	83 c0 2c             	add    $0x2c,%eax
c010a03d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a040:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a043:	83 e8 04             	sub    $0x4,%eax
c010a046:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a049:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a04c:	83 e8 08             	sub    $0x8,%eax
c010a04f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a052:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a055:	83 e8 0c             	sub    $0xc,%eax
c010a058:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a05b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a05e:	83 e8 10             	sub    $0x10,%eax
c010a061:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010a064:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a067:	83 e8 14             	sub    $0x14,%eax
c010a06a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010a06d:	ba 00 03 10 c0       	mov    $0xc0100300,%edx
c010a072:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a075:	89 10                	mov    %edx,(%eax)
c010a077:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010a07a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a080:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010a083:	8b 10                	mov    (%eax),%edx
c010a085:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010a088:	89 10                	mov    %edx,(%eax)
c010a08a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010a08d:	8b 10                	mov    (%eax),%edx
c010a08f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010a092:	89 10                	mov    %edx,(%eax)
c010a094:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010a097:	8b 10                	mov    (%eax),%edx
c010a099:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a09c:	89 10                	mov    %edx,(%eax)
c010a09e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a0a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a0a7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0aa:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010a0ad:	89 10                	mov    %edx,(%eax)
c010a0af:	83 ec 0c             	sub    $0xc,%esp
c010a0b2:	ff 75 f0             	pushl  -0x10(%ebp)
c010a0b5:	e8 47 ce ff ff       	call   c0106f01 <intr_set_status>
c010a0ba:	83 c4 10             	add    $0x10,%esp
c010a0bd:	90                   	nop
c010a0be:	c9                   	leave  
c010a0bf:	c3                   	ret    

c010a0c0 <fork_process>:
c010a0c0:	55                   	push   %ebp
c010a0c1:	89 e5                	mov    %esp,%ebp
c010a0c3:	83 ec 18             	sub    $0x18,%esp
c010a0c6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0c9:	83 ec 0c             	sub    $0xc,%esp
c010a0cc:	50                   	push   %eax
c010a0cd:	e8 b4 99 ff ff       	call   c0103a86 <pid2proc>
c010a0d2:	83 c4 10             	add    $0x10,%esp
c010a0d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a0d8:	83 ec 0c             	sub    $0xc,%esp
c010a0db:	ff 75 f4             	pushl  -0xc(%ebp)
c010a0de:	e8 75 fc ff ff       	call   c0109d58 <clone_pcb>
c010a0e3:	83 c4 10             	add    $0x10,%esp
c010a0e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a0e9:	83 ec 08             	sub    $0x8,%esp
c010a0ec:	6a 00                	push   $0x0
c010a0ee:	6a 01                	push   $0x1
c010a0f0:	e8 12 c3 ff ff       	call   c0106407 <alloc_memory>
c010a0f5:	83 c4 10             	add    $0x10,%esp
c010a0f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a0fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a0fe:	83 ec 04             	sub    $0x4,%esp
c010a101:	68 00 10 00 00       	push   $0x1000
c010a106:	6a 00                	push   $0x0
c010a108:	50                   	push   %eax
c010a109:	e8 61 21 00 00       	call   c010c26f <Memset>
c010a10e:	83 c4 10             	add    $0x10,%esp
c010a111:	83 ec 04             	sub    $0x4,%esp
c010a114:	ff 75 ec             	pushl  -0x14(%ebp)
c010a117:	ff 75 f0             	pushl  -0x10(%ebp)
c010a11a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a11d:	e8 a8 fd ff ff       	call   c0109eca <build_body_stack>
c010a122:	83 c4 10             	add    $0x10,%esp
c010a125:	83 ec 0c             	sub    $0xc,%esp
c010a128:	ff 75 f0             	pushl  -0x10(%ebp)
c010a12b:	e8 cd fe ff ff       	call   c0109ffd <build_process_kernel_stack>
c010a130:	83 c4 10             	add    $0x10,%esp
c010a133:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a136:	05 6a 02 00 00       	add    $0x26a,%eax
c010a13b:	83 ec 08             	sub    $0x8,%esp
c010a13e:	50                   	push   %eax
c010a13f:	68 04 0f 11 c0       	push   $0xc0110f04
c010a144:	e8 c7 02 00 00       	call   c010a410 <appendToDoubleLinkList>
c010a149:	83 c4 10             	add    $0x10,%esp
c010a14c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a14f:	c9                   	leave  
c010a150:	c3                   	ret    

c010a151 <process_execute>:
c010a151:	55                   	push   %ebp
c010a152:	89 e5                	mov    %esp,%ebp
c010a154:	83 ec 28             	sub    $0x28,%esp
c010a157:	e8 ca 04 00 00       	call   c010a626 <thread_init>
c010a15c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a15f:	83 ec 0c             	sub    $0xc,%esp
c010a162:	ff 75 f4             	pushl  -0xc(%ebp)
c010a165:	e8 69 05 00 00       	call   c010a6d3 <thread_create>
c010a16a:	83 c4 10             	add    $0x10,%esp
c010a16d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a170:	05 28 01 00 00       	add    $0x128,%eax
c010a175:	83 ec 08             	sub    $0x8,%esp
c010a178:	ff 75 10             	pushl  0x10(%ebp)
c010a17b:	50                   	push   %eax
c010a17c:	e8 0d 21 00 00       	call   c010c28e <Strcpy>
c010a181:	83 c4 10             	add    $0x10,%esp
c010a184:	83 ec 08             	sub    $0x8,%esp
c010a187:	6a 00                	push   $0x0
c010a189:	6a 01                	push   $0x1
c010a18b:	e8 77 c2 ff ff       	call   c0106407 <alloc_memory>
c010a190:	83 c4 10             	add    $0x10,%esp
c010a193:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a196:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a199:	05 00 0c 00 00       	add    $0xc00,%eax
c010a19e:	83 ec 04             	sub    $0x4,%esp
c010a1a1:	68 00 04 00 00       	push   $0x400
c010a1a6:	68 00 fc ff ff       	push   $0xfffffc00
c010a1ab:	50                   	push   %eax
c010a1ac:	e8 8b cd ff ff       	call   c0106f3c <Memcpy>
c010a1b1:	83 c4 10             	add    $0x10,%esp
c010a1b4:	83 ec 0c             	sub    $0xc,%esp
c010a1b7:	ff 75 f0             	pushl  -0x10(%ebp)
c010a1ba:	e8 5f c0 ff ff       	call   c010621e <get_physical_address>
c010a1bf:	83 c4 10             	add    $0x10,%esp
c010a1c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a1c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1c8:	05 fc 0f 00 00       	add    $0xffc,%eax
c010a1cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a1d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a1d3:	83 c8 07             	or     $0x7,%eax
c010a1d6:	89 c2                	mov    %eax,%edx
c010a1d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a1db:	89 10                	mov    %edx,(%eax)
c010a1dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a1e0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010a1e3:	89 50 08             	mov    %edx,0x8(%eax)
c010a1e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a1e9:	83 c0 10             	add    $0x10,%eax
c010a1ec:	83 ec 0c             	sub    $0xc,%esp
c010a1ef:	50                   	push   %eax
c010a1f0:	e8 c8 c7 ff ff       	call   c01069bd <init_memory_block_desc>
c010a1f5:	83 c4 10             	add    $0x10,%esp
c010a1f8:	e8 9e f9 ff ff       	call   c0109b9b <create_user_process_address_space>
c010a1fd:	89 c2                	mov    %eax,%edx
c010a1ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a202:	89 50 0c             	mov    %edx,0xc(%eax)
c010a205:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a208:	8b 00                	mov    (%eax),%eax
c010a20a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a20d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a210:	c7 40 10 2b 9c 10 c0 	movl   $0xc0109c2b,0x10(%eax)
c010a217:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a21a:	8b 55 08             	mov    0x8(%ebp),%edx
c010a21d:	89 50 18             	mov    %edx,0x18(%eax)
c010a220:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a223:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a226:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a229:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a22c:	8b 55 14             	mov    0x14(%ebp),%edx
c010a22f:	89 50 20             	mov    %edx,0x20(%eax)
c010a232:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a235:	8b 55 18             	mov    0x18(%ebp),%edx
c010a238:	89 50 24             	mov    %edx,0x24(%eax)
c010a23b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010a23e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a241:	89 50 28             	mov    %edx,0x28(%eax)
c010a244:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a247:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a24d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a250:	8b 10                	mov    (%eax),%edx
c010a252:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a255:	89 50 04             	mov    %edx,0x4(%eax)
c010a258:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a25b:	8b 50 04             	mov    0x4(%eax),%edx
c010a25e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a261:	89 50 08             	mov    %edx,0x8(%eax)
c010a264:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a267:	8b 50 08             	mov    0x8(%eax),%edx
c010a26a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a26d:	89 50 0c             	mov    %edx,0xc(%eax)
c010a270:	83 ec 0c             	sub    $0xc,%esp
c010a273:	68 ec fd 10 c0       	push   $0xc010fdec
c010a278:	e8 96 00 00 00       	call   c010a313 <isListEmpty>
c010a27d:	83 c4 10             	add    $0x10,%esp
c010a280:	e8 53 cc ff ff       	call   c0106ed8 <intr_disable>
c010a285:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a288:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a28b:	05 60 02 00 00       	add    $0x260,%eax
c010a290:	83 ec 08             	sub    $0x8,%esp
c010a293:	50                   	push   %eax
c010a294:	68 ec fd 10 c0       	push   $0xc010fdec
c010a299:	e8 72 01 00 00       	call   c010a410 <appendToDoubleLinkList>
c010a29e:	83 c4 10             	add    $0x10,%esp
c010a2a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2a4:	05 6a 02 00 00       	add    $0x26a,%eax
c010a2a9:	83 ec 08             	sub    $0x8,%esp
c010a2ac:	50                   	push   %eax
c010a2ad:	68 04 0f 11 c0       	push   $0xc0110f04
c010a2b2:	e8 59 01 00 00       	call   c010a410 <appendToDoubleLinkList>
c010a2b7:	83 c4 10             	add    $0x10,%esp
c010a2ba:	83 ec 0c             	sub    $0xc,%esp
c010a2bd:	ff 75 e0             	pushl  -0x20(%ebp)
c010a2c0:	e8 3c cc ff ff       	call   c0106f01 <intr_set_status>
c010a2c5:	83 c4 10             	add    $0x10,%esp
c010a2c8:	90                   	nop
c010a2c9:	c9                   	leave  
c010a2ca:	c3                   	ret    
c010a2cb:	66 90                	xchg   %ax,%ax
c010a2cd:	66 90                	xchg   %ax,%ax
c010a2cf:	90                   	nop

c010a2d0 <switch_to>:
c010a2d0:	56                   	push   %esi
c010a2d1:	57                   	push   %edi
c010a2d2:	53                   	push   %ebx
c010a2d3:	55                   	push   %ebp
c010a2d4:	89 e5                	mov    %esp,%ebp
c010a2d6:	8b 45 14             	mov    0x14(%ebp),%eax
c010a2d9:	89 20                	mov    %esp,(%eax)
c010a2db:	8b 45 18             	mov    0x18(%ebp),%eax
c010a2de:	8b 20                	mov    (%eax),%esp
c010a2e0:	5d                   	pop    %ebp
c010a2e1:	5b                   	pop    %ebx
c010a2e2:	5f                   	pop    %edi
c010a2e3:	5e                   	pop    %esi
c010a2e4:	c3                   	ret    

c010a2e5 <initDoubleLinkList>:
c010a2e5:	55                   	push   %ebp
c010a2e6:	89 e5                	mov    %esp,%ebp
c010a2e8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2eb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a2f1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2f4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a2fb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2fe:	8d 50 08             	lea    0x8(%eax),%edx
c010a301:	8b 45 08             	mov    0x8(%ebp),%eax
c010a304:	89 50 04             	mov    %edx,0x4(%eax)
c010a307:	8b 55 08             	mov    0x8(%ebp),%edx
c010a30a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a30d:	89 50 08             	mov    %edx,0x8(%eax)
c010a310:	90                   	nop
c010a311:	5d                   	pop    %ebp
c010a312:	c3                   	ret    

c010a313 <isListEmpty>:
c010a313:	55                   	push   %ebp
c010a314:	89 e5                	mov    %esp,%ebp
c010a316:	8b 45 08             	mov    0x8(%ebp),%eax
c010a319:	8b 40 04             	mov    0x4(%eax),%eax
c010a31c:	8b 55 08             	mov    0x8(%ebp),%edx
c010a31f:	83 c2 08             	add    $0x8,%edx
c010a322:	39 d0                	cmp    %edx,%eax
c010a324:	75 07                	jne    c010a32d <isListEmpty+0x1a>
c010a326:	b8 01 00 00 00       	mov    $0x1,%eax
c010a32b:	eb 05                	jmp    c010a332 <isListEmpty+0x1f>
c010a32d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a332:	5d                   	pop    %ebp
c010a333:	c3                   	ret    

c010a334 <findElementInList>:
c010a334:	55                   	push   %ebp
c010a335:	89 e5                	mov    %esp,%ebp
c010a337:	83 ec 28             	sub    $0x28,%esp
c010a33a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a33e:	75 19                	jne    c010a359 <findElementInList+0x25>
c010a340:	6a 60                	push   $0x60
c010a342:	68 15 c2 10 c0       	push   $0xc010c215
c010a347:	68 15 c2 10 c0       	push   $0xc010c215
c010a34c:	68 28 c2 10 c0       	push   $0xc010c228
c010a351:	e8 ff e7 ff ff       	call   c0108b55 <assertion_failure>
c010a356:	83 c4 10             	add    $0x10,%esp
c010a359:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a35d:	75 19                	jne    c010a378 <findElementInList+0x44>
c010a35f:	6a 61                	push   $0x61
c010a361:	68 15 c2 10 c0       	push   $0xc010c215
c010a366:	68 15 c2 10 c0       	push   $0xc010c215
c010a36b:	68 34 c2 10 c0       	push   $0xc010c234
c010a370:	e8 e0 e7 ff ff       	call   c0108b55 <assertion_failure>
c010a375:	83 c4 10             	add    $0x10,%esp
c010a378:	e8 5b cb ff ff       	call   c0106ed8 <intr_disable>
c010a37d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a380:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a387:	8b 45 08             	mov    0x8(%ebp),%eax
c010a38a:	8b 40 08             	mov    0x8(%eax),%eax
c010a38d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a390:	8b 45 08             	mov    0x8(%ebp),%eax
c010a393:	8b 40 04             	mov    0x4(%eax),%eax
c010a396:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a399:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a39d:	75 07                	jne    c010a3a6 <findElementInList+0x72>
c010a39f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a3a4:	eb 68                	jmp    c010a40e <findElementInList+0xda>
c010a3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a3a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a3ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a3af:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a3b2:	c1 f8 03             	sar    $0x3,%eax
c010a3b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a3b8:	eb 36                	jmp    c010a3f0 <findElementInList+0xbc>
c010a3ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a3bd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a3c0:	75 07                	jne    c010a3c9 <findElementInList+0x95>
c010a3c2:	b8 01 00 00 00       	mov    $0x1,%eax
c010a3c7:	eb 45                	jmp    c010a40e <findElementInList+0xda>
c010a3c9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a3cd:	75 07                	jne    c010a3d6 <findElementInList+0xa2>
c010a3cf:	b8 00 00 00 00       	mov    $0x0,%eax
c010a3d4:	eb 38                	jmp    c010a40e <findElementInList+0xda>
c010a3d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3d9:	8b 40 04             	mov    0x4(%eax),%eax
c010a3dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a3df:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a3e3:	75 07                	jne    c010a3ec <findElementInList+0xb8>
c010a3e5:	b8 00 00 00 00       	mov    $0x0,%eax
c010a3ea:	eb 22                	jmp    c010a40e <findElementInList+0xda>
c010a3ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a3f0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3f3:	83 c0 08             	add    $0x8,%eax
c010a3f6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a3f9:	75 bf                	jne    c010a3ba <findElementInList+0x86>
c010a3fb:	83 ec 0c             	sub    $0xc,%esp
c010a3fe:	ff 75 ec             	pushl  -0x14(%ebp)
c010a401:	e8 fb ca ff ff       	call   c0106f01 <intr_set_status>
c010a406:	83 c4 10             	add    $0x10,%esp
c010a409:	b8 00 00 00 00       	mov    $0x0,%eax
c010a40e:	c9                   	leave  
c010a40f:	c3                   	ret    

c010a410 <appendToDoubleLinkList>:
c010a410:	55                   	push   %ebp
c010a411:	89 e5                	mov    %esp,%ebp
c010a413:	83 ec 18             	sub    $0x18,%esp
c010a416:	83 ec 08             	sub    $0x8,%esp
c010a419:	ff 75 0c             	pushl  0xc(%ebp)
c010a41c:	ff 75 08             	pushl  0x8(%ebp)
c010a41f:	e8 10 ff ff ff       	call   c010a334 <findElementInList>
c010a424:	83 c4 10             	add    $0x10,%esp
c010a427:	3c 01                	cmp    $0x1,%al
c010a429:	0f 84 c2 00 00 00    	je     c010a4f1 <appendToDoubleLinkList+0xe1>
c010a42f:	e8 a4 ca ff ff       	call   c0106ed8 <intr_disable>
c010a434:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a437:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a43b:	75 1c                	jne    c010a459 <appendToDoubleLinkList+0x49>
c010a43d:	68 9e 00 00 00       	push   $0x9e
c010a442:	68 15 c2 10 c0       	push   $0xc010c215
c010a447:	68 15 c2 10 c0       	push   $0xc010c215
c010a44c:	68 28 c2 10 c0       	push   $0xc010c228
c010a451:	e8 ff e6 ff ff       	call   c0108b55 <assertion_failure>
c010a456:	83 c4 10             	add    $0x10,%esp
c010a459:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a45d:	75 1c                	jne    c010a47b <appendToDoubleLinkList+0x6b>
c010a45f:	68 9f 00 00 00       	push   $0x9f
c010a464:	68 15 c2 10 c0       	push   $0xc010c215
c010a469:	68 15 c2 10 c0       	push   $0xc010c215
c010a46e:	68 34 c2 10 c0       	push   $0xc010c234
c010a473:	e8 dd e6 ff ff       	call   c0108b55 <assertion_failure>
c010a478:	83 c4 10             	add    $0x10,%esp
c010a47b:	83 ec 08             	sub    $0x8,%esp
c010a47e:	ff 75 0c             	pushl  0xc(%ebp)
c010a481:	ff 75 08             	pushl  0x8(%ebp)
c010a484:	e8 ab fe ff ff       	call   c010a334 <findElementInList>
c010a489:	83 c4 10             	add    $0x10,%esp
c010a48c:	3c 01                	cmp    $0x1,%al
c010a48e:	74 64                	je     c010a4f4 <appendToDoubleLinkList+0xe4>
c010a490:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a493:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a496:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a499:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a4a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4a3:	8b 50 04             	mov    0x4(%eax),%edx
c010a4a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4a9:	89 10                	mov    %edx,(%eax)
c010a4ab:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4ae:	8b 50 08             	mov    0x8(%eax),%edx
c010a4b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4b4:	89 10                	mov    %edx,(%eax)
c010a4b6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4b9:	8b 40 08             	mov    0x8(%eax),%eax
c010a4bc:	85 c0                	test   %eax,%eax
c010a4be:	74 0c                	je     c010a4cc <appendToDoubleLinkList+0xbc>
c010a4c0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4c3:	8b 40 08             	mov    0x8(%eax),%eax
c010a4c6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a4c9:	89 50 04             	mov    %edx,0x4(%eax)
c010a4cc:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4cf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a4d2:	89 50 08             	mov    %edx,0x8(%eax)
c010a4d5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4d8:	8d 50 08             	lea    0x8(%eax),%edx
c010a4db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4de:	89 50 04             	mov    %edx,0x4(%eax)
c010a4e1:	83 ec 0c             	sub    $0xc,%esp
c010a4e4:	ff 75 f4             	pushl  -0xc(%ebp)
c010a4e7:	e8 15 ca ff ff       	call   c0106f01 <intr_set_status>
c010a4ec:	83 c4 10             	add    $0x10,%esp
c010a4ef:	eb 04                	jmp    c010a4f5 <appendToDoubleLinkList+0xe5>
c010a4f1:	90                   	nop
c010a4f2:	eb 01                	jmp    c010a4f5 <appendToDoubleLinkList+0xe5>
c010a4f4:	90                   	nop
c010a4f5:	c9                   	leave  
c010a4f6:	c3                   	ret    

c010a4f7 <insertToDoubleLinkList>:
c010a4f7:	55                   	push   %ebp
c010a4f8:	89 e5                	mov    %esp,%ebp
c010a4fa:	83 ec 18             	sub    $0x18,%esp
c010a4fd:	83 ec 08             	sub    $0x8,%esp
c010a500:	ff 75 0c             	pushl  0xc(%ebp)
c010a503:	ff 75 08             	pushl  0x8(%ebp)
c010a506:	e8 29 fe ff ff       	call   c010a334 <findElementInList>
c010a50b:	83 c4 10             	add    $0x10,%esp
c010a50e:	3c 01                	cmp    $0x1,%al
c010a510:	74 65                	je     c010a577 <insertToDoubleLinkList+0x80>
c010a512:	e8 c1 c9 ff ff       	call   c0106ed8 <intr_disable>
c010a517:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a51a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a51d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a520:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a523:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a52a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a52d:	8b 50 04             	mov    0x4(%eax),%edx
c010a530:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a533:	89 10                	mov    %edx,(%eax)
c010a535:	8b 45 08             	mov    0x8(%ebp),%eax
c010a538:	8b 50 04             	mov    0x4(%eax),%edx
c010a53b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a53e:	89 50 04             	mov    %edx,0x4(%eax)
c010a541:	8b 45 08             	mov    0x8(%ebp),%eax
c010a544:	8b 40 04             	mov    0x4(%eax),%eax
c010a547:	85 c0                	test   %eax,%eax
c010a549:	74 0b                	je     c010a556 <insertToDoubleLinkList+0x5f>
c010a54b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a54e:	8b 40 04             	mov    0x4(%eax),%eax
c010a551:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a554:	89 10                	mov    %edx,(%eax)
c010a556:	8b 45 08             	mov    0x8(%ebp),%eax
c010a559:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a55c:	89 50 04             	mov    %edx,0x4(%eax)
c010a55f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a562:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a565:	89 10                	mov    %edx,(%eax)
c010a567:	83 ec 0c             	sub    $0xc,%esp
c010a56a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a56d:	e8 8f c9 ff ff       	call   c0106f01 <intr_set_status>
c010a572:	83 c4 10             	add    $0x10,%esp
c010a575:	eb 01                	jmp    c010a578 <insertToDoubleLinkList+0x81>
c010a577:	90                   	nop
c010a578:	c9                   	leave  
c010a579:	c3                   	ret    

c010a57a <popFromDoubleLinkList>:
c010a57a:	55                   	push   %ebp
c010a57b:	89 e5                	mov    %esp,%ebp
c010a57d:	83 ec 18             	sub    $0x18,%esp
c010a580:	e8 53 c9 ff ff       	call   c0106ed8 <intr_disable>
c010a585:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a588:	83 ec 0c             	sub    $0xc,%esp
c010a58b:	ff 75 08             	pushl  0x8(%ebp)
c010a58e:	e8 80 fd ff ff       	call   c010a313 <isListEmpty>
c010a593:	83 c4 10             	add    $0x10,%esp
c010a596:	3c 01                	cmp    $0x1,%al
c010a598:	75 07                	jne    c010a5a1 <popFromDoubleLinkList+0x27>
c010a59a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a59f:	eb 6b                	jmp    c010a60c <popFromDoubleLinkList+0x92>
c010a5a1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5a4:	8b 40 08             	mov    0x8(%eax),%eax
c010a5a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a5aa:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5ad:	8b 40 08             	mov    0x8(%eax),%eax
c010a5b0:	85 c0                	test   %eax,%eax
c010a5b2:	75 07                	jne    c010a5bb <popFromDoubleLinkList+0x41>
c010a5b4:	b8 00 00 00 00       	mov    $0x0,%eax
c010a5b9:	eb 51                	jmp    c010a60c <popFromDoubleLinkList+0x92>
c010a5bb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5be:	8b 40 08             	mov    0x8(%eax),%eax
c010a5c1:	8b 00                	mov    (%eax),%eax
c010a5c3:	85 c0                	test   %eax,%eax
c010a5c5:	74 11                	je     c010a5d8 <popFromDoubleLinkList+0x5e>
c010a5c7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5ca:	8b 40 08             	mov    0x8(%eax),%eax
c010a5cd:	8b 00                	mov    (%eax),%eax
c010a5cf:	8b 55 08             	mov    0x8(%ebp),%edx
c010a5d2:	83 c2 08             	add    $0x8,%edx
c010a5d5:	89 50 04             	mov    %edx,0x4(%eax)
c010a5d8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5db:	8b 40 08             	mov    0x8(%eax),%eax
c010a5de:	8b 10                	mov    (%eax),%edx
c010a5e0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5e3:	89 50 08             	mov    %edx,0x8(%eax)
c010a5e6:	83 ec 0c             	sub    $0xc,%esp
c010a5e9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a5ec:	e8 10 c9 ff ff       	call   c0106f01 <intr_set_status>
c010a5f1:	83 c4 10             	add    $0x10,%esp
c010a5f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5f7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a5fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a601:	8b 50 04             	mov    0x4(%eax),%edx
c010a604:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a607:	89 10                	mov    %edx,(%eax)
c010a609:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a60c:	c9                   	leave  
c010a60d:	c3                   	ret    

c010a60e <kernel_thread>:
c010a60e:	55                   	push   %ebp
c010a60f:	89 e5                	mov    %esp,%ebp
c010a611:	83 ec 08             	sub    $0x8,%esp
c010a614:	fb                   	sti    
c010a615:	83 ec 0c             	sub    $0xc,%esp
c010a618:	ff 75 0c             	pushl  0xc(%ebp)
c010a61b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a61e:	ff d0                	call   *%eax
c010a620:	83 c4 10             	add    $0x10,%esp
c010a623:	90                   	nop
c010a624:	c9                   	leave  
c010a625:	c3                   	ret    

c010a626 <thread_init>:
c010a626:	55                   	push   %ebp
c010a627:	89 e5                	mov    %esp,%ebp
c010a629:	83 ec 18             	sub    $0x18,%esp
c010a62c:	83 ec 08             	sub    $0x8,%esp
c010a62f:	6a 00                	push   $0x0
c010a631:	6a 01                	push   $0x1
c010a633:	e8 cf bd ff ff       	call   c0106407 <alloc_memory>
c010a638:	83 c4 10             	add    $0x10,%esp
c010a63b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a63e:	83 ec 04             	sub    $0x4,%esp
c010a641:	68 00 10 00 00       	push   $0x1000
c010a646:	6a 00                	push   $0x0
c010a648:	ff 75 f4             	pushl  -0xc(%ebp)
c010a64b:	e8 1f 1c 00 00       	call   c010c26f <Memset>
c010a650:	83 c4 10             	add    $0x10,%esp
c010a653:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a656:	05 00 10 00 00       	add    $0x1000,%eax
c010a65b:	89 c2                	mov    %eax,%edx
c010a65d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a660:	89 10                	mov    %edx,(%eax)
c010a662:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a665:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a66c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a66f:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a676:	ff ff ff 
c010a679:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a67c:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a683:	00 00 00 
c010a686:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a689:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a68f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a692:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a698:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a69d:	83 c0 01             	add    $0x1,%eax
c010a6a0:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a6a5:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a6ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6ae:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a6b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6b7:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a6be:	00 00 00 
c010a6c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6c4:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a6cb:	cd ab 99 
c010a6ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6d1:	c9                   	leave  
c010a6d2:	c3                   	ret    

c010a6d3 <thread_create>:
c010a6d3:	55                   	push   %ebp
c010a6d4:	89 e5                	mov    %esp,%ebp
c010a6d6:	83 ec 10             	sub    $0x10,%esp
c010a6d9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a6e0:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a6e7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a6ea:	8b 00                	mov    (%eax),%eax
c010a6ec:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a6ef:	89 c2                	mov    %eax,%edx
c010a6f1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a6f4:	89 10                	mov    %edx,(%eax)
c010a6f6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a6f9:	8b 00                	mov    (%eax),%eax
c010a6fb:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a6fe:	89 c2                	mov    %eax,%edx
c010a700:	8b 45 08             	mov    0x8(%ebp),%eax
c010a703:	89 10                	mov    %edx,(%eax)
c010a705:	90                   	nop
c010a706:	c9                   	leave  
c010a707:	c3                   	ret    

c010a708 <thread_start>:
c010a708:	55                   	push   %ebp
c010a709:	89 e5                	mov    %esp,%ebp
c010a70b:	83 ec 18             	sub    $0x18,%esp
c010a70e:	e8 13 ff ff ff       	call   c010a626 <thread_init>
c010a713:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a716:	83 ec 0c             	sub    $0xc,%esp
c010a719:	ff 75 f4             	pushl  -0xc(%ebp)
c010a71c:	e8 b2 ff ff ff       	call   c010a6d3 <thread_create>
c010a721:	83 c4 10             	add    $0x10,%esp
c010a724:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a727:	05 28 01 00 00       	add    $0x128,%eax
c010a72c:	83 ec 08             	sub    $0x8,%esp
c010a72f:	ff 75 10             	pushl  0x10(%ebp)
c010a732:	50                   	push   %eax
c010a733:	e8 56 1b 00 00       	call   c010c28e <Strcpy>
c010a738:	83 c4 10             	add    $0x10,%esp
c010a73b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a73e:	8b 00                	mov    (%eax),%eax
c010a740:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a743:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a746:	c7 40 10 0e a6 10 c0 	movl   $0xc010a60e,0x10(%eax)
c010a74d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a750:	8b 55 08             	mov    0x8(%ebp),%edx
c010a753:	89 50 18             	mov    %edx,0x18(%eax)
c010a756:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a759:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a75c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a75f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a762:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a768:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a76b:	8b 10                	mov    (%eax),%edx
c010a76d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a770:	89 50 04             	mov    %edx,0x4(%eax)
c010a773:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a776:	8b 50 04             	mov    0x4(%eax),%edx
c010a779:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a77c:	89 50 08             	mov    %edx,0x8(%eax)
c010a77f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a782:	8b 50 08             	mov    0x8(%eax),%edx
c010a785:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a788:	89 50 0c             	mov    %edx,0xc(%eax)
c010a78b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a78e:	05 60 02 00 00       	add    $0x260,%eax
c010a793:	83 ec 08             	sub    $0x8,%esp
c010a796:	50                   	push   %eax
c010a797:	68 ec fd 10 c0       	push   $0xc010fdec
c010a79c:	e8 6f fc ff ff       	call   c010a410 <appendToDoubleLinkList>
c010a7a1:	83 c4 10             	add    $0x10,%esp
c010a7a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a7a7:	05 6a 02 00 00       	add    $0x26a,%eax
c010a7ac:	83 ec 08             	sub    $0x8,%esp
c010a7af:	50                   	push   %eax
c010a7b0:	68 04 0f 11 c0       	push   $0xc0110f04
c010a7b5:	e8 56 fc ff ff       	call   c010a410 <appendToDoubleLinkList>
c010a7ba:	83 c4 10             	add    $0x10,%esp
c010a7bd:	90                   	nop
c010a7be:	c9                   	leave  
c010a7bf:	c3                   	ret    

c010a7c0 <Buf>:
	...

c010a7d6 <My_Buf>:
c010a7d6:	48                   	dec    %eax
c010a7d7:	65 6c                	gs insb (%dx),%es:(%edi)
c010a7d9:	6c                   	insb   (%dx),%es:(%edi)
c010a7da:	6f                   	outsl  %ds:(%esi),(%dx)
c010a7db:	2c 57                	sub    $0x57,%al
c010a7dd:	6f                   	outsl  %ds:(%esi),(%dx)
c010a7de:	72 6c                	jb     c010a84c <DriverInitialize+0x69>
c010a7e0:	64 5c                	fs pop %esp
c010a7e2:	30                   	.byte 0x30

c010a7e3 <DriverInitialize>:
c010a7e3:	56                   	push   %esi
c010a7e4:	57                   	push   %edi
c010a7e5:	53                   	push   %ebx
c010a7e6:	55                   	push   %ebp
c010a7e7:	51                   	push   %ecx
c010a7e8:	89 e5                	mov    %esp,%ebp
c010a7ea:	b0 21                	mov    $0x21,%al
c010a7ec:	66 ba 00 03          	mov    $0x300,%dx
c010a7f0:	ee                   	out    %al,(%dx)
c010a7f1:	b0 59                	mov    $0x59,%al
c010a7f3:	66 ba 0e 03          	mov    $0x30e,%dx
c010a7f7:	ee                   	out    %al,(%dx)
c010a7f8:	66 ba 0a 03          	mov    $0x30a,%dx
c010a7fc:	66 31 c0             	xor    %ax,%ax
c010a7ff:	b0 00                	mov    $0x0,%al
c010a801:	ee                   	out    %al,(%dx)
c010a802:	66 ba 0b 03          	mov    $0x30b,%dx
c010a806:	b0 01                	mov    $0x1,%al
c010a808:	ee                   	out    %al,(%dx)
c010a809:	b0 10                	mov    $0x10,%al
c010a80b:	66 ba 0c 03          	mov    $0x30c,%dx
c010a80f:	ee                   	out    %al,(%dx)
c010a810:	b0 20                	mov    $0x20,%al
c010a812:	66 ba 04 03          	mov    $0x304,%dx
c010a816:	ee                   	out    %al,(%dx)
c010a817:	b0 02                	mov    $0x2,%al
c010a819:	66 ba 0d 03          	mov    $0x30d,%dx
c010a81d:	ee                   	out    %al,(%dx)
c010a81e:	b0 40                	mov    $0x40,%al
c010a820:	66 ba 01 03          	mov    $0x301,%dx
c010a824:	ee                   	out    %al,(%dx)
c010a825:	66 ba 03 03          	mov    $0x303,%dx
c010a829:	ee                   	out    %al,(%dx)
c010a82a:	b0 60                	mov    $0x60,%al
c010a82c:	66 ba 02 03          	mov    $0x302,%dx
c010a830:	ee                   	out    %al,(%dx)
c010a831:	b0 61                	mov    $0x61,%al
c010a833:	66 ba 00 03          	mov    $0x300,%dx
c010a837:	ee                   	out    %al,(%dx)
c010a838:	b0 40                	mov    $0x40,%al
c010a83a:	66 ba 07 03          	mov    $0x307,%dx
c010a83e:	ee                   	out    %al,(%dx)
c010a83f:	b0 22                	mov    $0x22,%al
c010a841:	66 ba 00 03          	mov    $0x300,%dx
c010a845:	ee                   	out    %al,(%dx)
c010a846:	b0 ff                	mov    $0xff,%al
c010a848:	66 ba 07 03          	mov    $0x307,%dx
c010a84c:	ee                   	out    %al,(%dx)
c010a84d:	b0 fb                	mov    $0xfb,%al
c010a84f:	66 ba 0f 03          	mov    $0x30f,%dx
c010a853:	ee                   	out    %al,(%dx)
c010a854:	66 ba 0d 03          	mov    $0x30d,%dx
c010a858:	b0 00                	mov    $0x0,%al
c010a85a:	ee                   	out    %al,(%dx)
c010a85b:	68 00 40 00 00       	push   $0x4000
c010a860:	e8 08 00 00 00       	call   c010a86d <SetPageStart>
c010a865:	89 ec                	mov    %ebp,%esp
c010a867:	59                   	pop    %ecx
c010a868:	5d                   	pop    %ebp
c010a869:	5b                   	pop    %ebx
c010a86a:	5f                   	pop    %edi
c010a86b:	5e                   	pop    %esi
c010a86c:	c3                   	ret    

c010a86d <SetPageStart>:
c010a86d:	56                   	push   %esi
c010a86e:	57                   	push   %edi
c010a86f:	53                   	push   %ebx
c010a870:	55                   	push   %ebp
c010a871:	51                   	push   %ecx
c010a872:	89 e5                	mov    %esp,%ebp
c010a874:	66 ba 08 03          	mov    $0x308,%dx
c010a878:	66 31 c0             	xor    %ax,%ax
c010a87b:	66 8b 45 18          	mov    0x18(%ebp),%ax
c010a87f:	ee                   	out    %al,(%dx)
c010a880:	66 ba 09 03          	mov    $0x309,%dx
c010a884:	66 25 00 ff          	and    $0xff00,%ax
c010a888:	66 c1 e8 08          	shr    $0x8,%ax
c010a88c:	ee                   	out    %al,(%dx)
c010a88d:	89 ec                	mov    %ebp,%esp
c010a88f:	59                   	pop    %ecx
c010a890:	5d                   	pop    %ebp
c010a891:	5b                   	pop    %ebx
c010a892:	5f                   	pop    %edi
c010a893:	5e                   	pop    %esi
c010a894:	c3                   	ret    

c010a895 <DriverSend>:
c010a895:	56                   	push   %esi
c010a896:	57                   	push   %edi
c010a897:	53                   	push   %ebx
c010a898:	55                   	push   %ebp
c010a899:	51                   	push   %ecx
c010a89a:	89 e5                	mov    %esp,%ebp
c010a89c:	66 ba 00 03          	mov    $0x300,%dx
c010a8a0:	ec                   	in     (%dx),%al
c010a8a1:	3c 26                	cmp    $0x26,%al
c010a8a3:	74 54                	je     c010a8f9 <QueueIt>
c010a8a5:	66 51                	push   %cx
c010a8a7:	24 3f                	and    $0x3f,%al
c010a8a9:	ee                   	out    %al,(%dx)
c010a8aa:	66 ba 08 03          	mov    $0x308,%dx
c010a8ae:	66 31 c0             	xor    %ax,%ax
c010a8b1:	66 b8 00 40          	mov    $0x4000,%ax
c010a8b5:	ee                   	out    %al,(%dx)
c010a8b6:	66 ba 09 03          	mov    $0x309,%dx
c010a8ba:	66 25 00 ff          	and    $0xff00,%ax
c010a8be:	66 c1 e8 08          	shr    $0x8,%ax
c010a8c2:	ee                   	out    %al,(%dx)
c010a8c3:	ff 75 18             	pushl  0x18(%ebp)
c010a8c6:	e8 3f 00 00 00       	call   c010a90a <PCtoNIC>
c010a8cb:	83 c4 04             	add    $0x4,%esp
c010a8ce:	eb 2a                	jmp    c010a8fa <Finished>
c010a8d0:	66 ba 04 03          	mov    $0x304,%dx
c010a8d4:	b0 40                	mov    $0x40,%al
c010a8d6:	66 b8 00 40          	mov    $0x4000,%ax
c010a8da:	66 c1 e8 08          	shr    $0x8,%ax
c010a8de:	66 ef                	out    %ax,(%dx)
c010a8e0:	66 59                	pop    %cx
c010a8e2:	66 ba 05 03          	mov    $0x305,%dx
c010a8e6:	88 c8                	mov    %cl,%al
c010a8e8:	ee                   	out    %al,(%dx)
c010a8e9:	66 ba 06 03          	mov    $0x306,%dx
c010a8ed:	88 e8                	mov    %ch,%al
c010a8ef:	ee                   	out    %al,(%dx)
c010a8f0:	66 ba 00 03          	mov    $0x300,%dx
c010a8f4:	b0 26                	mov    $0x26,%al
c010a8f6:	ee                   	out    %al,(%dx)
c010a8f7:	eb 01                	jmp    c010a8fa <Finished>

c010a8f9 <QueueIt>:
c010a8f9:	90                   	nop

c010a8fa <Finished>:
c010a8fa:	89 ec                	mov    %ebp,%esp
c010a8fc:	59                   	pop    %ecx
c010a8fd:	5d                   	pop    %ebp
c010a8fe:	5b                   	pop    %ebx
c010a8ff:	5f                   	pop    %edi
c010a900:	5e                   	pop    %esi
c010a901:	c3                   	ret    

c010a902 <MyEnd>:
c010a902:	89 ec                	mov    %ebp,%esp
c010a904:	59                   	pop    %ecx
c010a905:	5d                   	pop    %ebp
c010a906:	5b                   	pop    %ebx
c010a907:	5f                   	pop    %edi
c010a908:	5e                   	pop    %esi
c010a909:	c3                   	ret    

c010a90a <PCtoNIC>:
c010a90a:	56                   	push   %esi
c010a90b:	57                   	push   %edi
c010a90c:	53                   	push   %ebx
c010a90d:	55                   	push   %ebp
c010a90e:	51                   	push   %ecx
c010a90f:	89 e5                	mov    %esp,%ebp
c010a911:	66 bb 20 00          	mov    $0x20,%bx
c010a915:	66 ba 0a 03          	mov    $0x30a,%dx
c010a919:	88 d8                	mov    %bl,%al
c010a91b:	ee                   	out    %al,(%dx)
c010a91c:	66 ba 0b 03          	mov    $0x30b,%dx
c010a920:	88 f8                	mov    %bh,%al
c010a922:	ee                   	out    %al,(%dx)
c010a923:	66 ba 00 03          	mov    $0x300,%dx
c010a927:	b0 12                	mov    $0x12,%al
c010a929:	ee                   	out    %al,(%dx)
c010a92a:	66 ba 10 03          	mov    $0x310,%dx
c010a92e:	66 b9 20 00          	mov    $0x20,%cx
c010a932:	66 d1 e9             	shr    %cx
c010a935:	66 b8 59 00          	mov    $0x59,%ax
c010a939:	31 f6                	xor    %esi,%esi
c010a93b:	8b 74 24 18          	mov    0x18(%esp),%esi
c010a93f:	68 00 40 00 00       	push   $0x4000
c010a944:	e8 24 ff ff ff       	call   c010a86d <SetPageStart>
c010a949:	83 c4 04             	add    $0x4,%esp
c010a94c:	66 ba 10 03          	mov    $0x310,%dx

c010a950 <Writing_Word>:
c010a950:	66 31 c0             	xor    %ax,%ax
c010a953:	66 ad                	lods   %ds:(%esi),%ax
c010a955:	66 ef                	out    %ax,(%dx)
c010a957:	e2 f7                	loop   c010a950 <Writing_Word>
c010a959:	66 b9 00 00          	mov    $0x0,%cx
c010a95d:	66 ba 07 03          	mov    $0x307,%dx

c010a961 <CheckDMA>:
c010a961:	ec                   	in     (%dx),%al
c010a962:	a8 40                	test   $0x40,%al
c010a964:	75 02                	jne    c010a968 <toNICEND>
c010a966:	eb f9                	jmp    c010a961 <CheckDMA>

c010a968 <toNICEND>:
c010a968:	66 ba 07 03          	mov    $0x307,%dx
c010a96c:	b0 0f                	mov    $0xf,%al
c010a96e:	ee                   	out    %al,(%dx)
c010a96f:	f8                   	clc    
c010a970:	89 ec                	mov    %ebp,%esp
c010a972:	59                   	pop    %ecx
c010a973:	5d                   	pop    %ebp
c010a974:	5b                   	pop    %ebx
c010a975:	5f                   	pop    %edi
c010a976:	5e                   	pop    %esi
c010a977:	c3                   	ret    

c010a978 <get_interrupt_status>:
c010a978:	56                   	push   %esi
c010a979:	57                   	push   %edi
c010a97a:	53                   	push   %ebx
c010a97b:	55                   	push   %ebp
c010a97c:	51                   	push   %ecx
c010a97d:	89 e5                	mov    %esp,%ebp
c010a97f:	66 ba 07 03          	mov    $0x307,%dx
c010a983:	31 c0                	xor    %eax,%eax
c010a985:	ec                   	in     (%dx),%al
c010a986:	89 ec                	mov    %ebp,%esp
c010a988:	59                   	pop    %ecx
c010a989:	5d                   	pop    %ebp
c010a98a:	5b                   	pop    %ebx
c010a98b:	5f                   	pop    %edi
c010a98c:	5e                   	pop    %esi
c010a98d:	c3                   	ret    

c010a98e <set_interrupt_status>:
c010a98e:	56                   	push   %esi
c010a98f:	57                   	push   %edi
c010a990:	53                   	push   %ebx
c010a991:	55                   	push   %ebp
c010a992:	51                   	push   %ecx
c010a993:	89 e5                	mov    %esp,%ebp
c010a995:	66 ba 07 03          	mov    $0x307,%dx
c010a999:	31 c0                	xor    %eax,%eax
c010a99b:	8b 45 18             	mov    0x18(%ebp),%eax
c010a99e:	ee                   	out    %al,(%dx)
c010a99f:	89 ec                	mov    %ebp,%esp
c010a9a1:	59                   	pop    %ecx
c010a9a2:	5d                   	pop    %ebp
c010a9a3:	5b                   	pop    %ebx
c010a9a4:	5f                   	pop    %edi
c010a9a5:	5e                   	pop    %esi
c010a9a6:	c3                   	ret    

c010a9a7 <get_curr_page>:
c010a9a7:	56                   	push   %esi
c010a9a8:	57                   	push   %edi
c010a9a9:	53                   	push   %ebx
c010a9aa:	55                   	push   %ebp
c010a9ab:	51                   	push   %ecx
c010a9ac:	89 e5                	mov    %esp,%ebp
c010a9ae:	b0 61                	mov    $0x61,%al
c010a9b0:	66 ba 00 03          	mov    $0x300,%dx
c010a9b4:	ee                   	out    %al,(%dx)
c010a9b5:	66 ba 07 03          	mov    $0x307,%dx
c010a9b9:	31 c0                	xor    %eax,%eax
c010a9bb:	ec                   	in     (%dx),%al
c010a9bc:	89 ec                	mov    %ebp,%esp
c010a9be:	59                   	pop    %ecx
c010a9bf:	5d                   	pop    %ebp
c010a9c0:	5b                   	pop    %ebx
c010a9c1:	5f                   	pop    %edi
c010a9c2:	5e                   	pop    %esi
c010a9c3:	c3                   	ret    

c010a9c4 <NICtoPC>:
c010a9c4:	56                   	push   %esi
c010a9c5:	57                   	push   %edi
c010a9c6:	53                   	push   %ebx
c010a9c7:	55                   	push   %ebp
c010a9c8:	51                   	push   %ecx
c010a9c9:	89 e5                	mov    %esp,%ebp
c010a9cb:	66 bb 80 00          	mov    $0x80,%bx
c010a9cf:	66 ba 0a 03          	mov    $0x30a,%dx
c010a9d3:	88 d8                	mov    %bl,%al
c010a9d5:	ee                   	out    %al,(%dx)
c010a9d6:	66 ba 0b 03          	mov    $0x30b,%dx
c010a9da:	88 f8                	mov    %bh,%al
c010a9dc:	ee                   	out    %al,(%dx)
c010a9dd:	66 ba 00 03          	mov    $0x300,%dx
c010a9e1:	b0 0a                	mov    $0xa,%al
c010a9e3:	ee                   	out    %al,(%dx)
c010a9e4:	66 ba 10 03          	mov    $0x310,%dx
c010a9e8:	66 ba 10 03          	mov    $0x310,%dx
c010a9ec:	66 b9 80 00          	mov    $0x80,%cx
c010a9f0:	66 d1 e9             	shr    %cx
c010a9f3:	bf c0 a7 10 c0       	mov    $0xc010a7c0,%edi
c010a9f8:	8b 7d 18             	mov    0x18(%ebp),%edi

c010a9fb <READING_Word_NICtoPC>:
c010a9fb:	31 c0                	xor    %eax,%eax
c010a9fd:	66 ba 10 03          	mov    $0x310,%dx
c010aa01:	66 ed                	in     (%dx),%ax
c010aa03:	66 ab                	stos   %ax,%es:(%edi)
c010aa05:	e2 f4                	loop   c010a9fb <READING_Word_NICtoPC>
c010aa07:	66 ba 07 03          	mov    $0x307,%dx

c010aa0b <CheckDMA_NICtoPC>:
c010aa0b:	ec                   	in     (%dx),%al
c010aa0c:	a8 40                	test   $0x40,%al
c010aa0e:	75 02                	jne    c010aa12 <ReadEnd>
c010aa10:	eb f9                	jmp    c010aa0b <CheckDMA_NICtoPC>

c010aa12 <ReadEnd>:
c010aa12:	ee                   	out    %al,(%dx)
c010aa13:	b8 20 00 00 00       	mov    $0x20,%eax
c010aa18:	89 ec                	mov    %ebp,%esp
c010aa1a:	59                   	pop    %ecx
c010aa1b:	5d                   	pop    %ebp
c010aa1c:	5b                   	pop    %ebx
c010aa1d:	5f                   	pop    %edi
c010aa1e:	5e                   	pop    %esi
c010aa1f:	c3                   	ret    
