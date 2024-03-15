
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
c0100025:	e8 61 3d 00 00       	call   c0103d8b <ReloadGDT>
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
c0100198:	e8 33 72 00 00       	call   c01073d0 <exception_handler>
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
c01001b5:	e8 16 72 00 00       	call   c01073d0 <exception_handler>
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
c01001e3:	e8 6d 37 00 00       	call   c0103955 <clock_handler>
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
c0100216:	e8 c5 46 00 00       	call   c01048e0 <keyboard_handler>
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
c010025c:	e8 30 12 00 00       	call   c0101491 <hd_handler>
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
c01002a3:	e8 53 12 00 00       	call   c01014fb <net_handler>
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
c010038e:	e8 d7 6e 00 00       	call   c010726a <disp_int>
c0100393:	83 c4 04             	add    $0x4,%esp
c0100396:	58                   	pop    %eax
c0100397:	5a                   	pop    %edx
c0100398:	52                   	push   %edx
c0100399:	50                   	push   %eax
c010039a:	e8 cb 6e 00 00       	call   c010726a <disp_int>
c010039f:	58                   	pop    %eax
c01003a0:	5a                   	pop    %edx
c01003a1:	52                   	push   %edx
c01003a2:	50                   	push   %eax
c01003a3:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c01003a9:	e8 bc 6e 00 00       	call   c010726a <disp_int>
c01003ae:	83 c4 04             	add    $0x4,%esp
c01003b1:	58                   	pop    %eax
c01003b2:	5a                   	pop    %edx
c01003b3:	52                   	push   %edx
c01003b4:	50                   	push   %eax
c01003b5:	ff 72 ec             	pushl  -0x14(%edx)
c01003b8:	e8 ad 6e 00 00       	call   c010726a <disp_int>
c01003bd:	83 c4 04             	add    $0x4,%esp
c01003c0:	58                   	pop    %eax
c01003c1:	5a                   	pop    %edx
c01003c2:	52                   	push   %edx
c01003c3:	50                   	push   %eax
c01003c4:	ff 70 ec             	pushl  -0x14(%eax)
c01003c7:	e8 9e 6e 00 00       	call   c010726a <disp_int>
c01003cc:	83 c4 04             	add    $0x4,%esp
c01003cf:	58                   	pop    %eax
c01003d0:	5a                   	pop    %edx
c01003d1:	52                   	push   %edx
c01003d2:	50                   	push   %eax
c01003d3:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c01003d9:	e8 8c 6e 00 00       	call   c010726a <disp_int>
c01003de:	83 c4 04             	add    $0x4,%esp
c01003e1:	58                   	pop    %eax
c01003e2:	5a                   	pop    %edx
c01003e3:	52                   	push   %edx
c01003e4:	50                   	push   %eax
c01003e5:	68 60 f7 10 c0       	push   $0xc010f760
c01003ea:	e8 7b 6e 00 00       	call   c010726a <disp_int>
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
c01004b7:	e8 12 bd 00 00       	call   c010c1ce <Strcpy>
c01004bc:	83 c4 10             	add    $0x10,%esp
c01004bf:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004c4:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01004c9:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004ce:	05 60 02 00 00       	add    $0x260,%eax
c01004d3:	83 ec 08             	sub    $0x8,%esp
c01004d6:	50                   	push   %eax
c01004d7:	68 ec fd 10 c0       	push   $0xc010fdec
c01004dc:	e8 6f 9e 00 00       	call   c010a350 <appendToDoubleLinkList>
c01004e1:	83 c4 10             	add    $0x10,%esp
c01004e4:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004e9:	05 6a 02 00 00       	add    $0x26a,%eax
c01004ee:	83 ec 08             	sub    $0x8,%esp
c01004f1:	50                   	push   %eax
c01004f2:	68 ec fd 10 c0       	push   $0xc010fdec
c01004f7:	e8 54 9e 00 00       	call   c010a350 <appendToDoubleLinkList>
c01004fc:	83 c4 10             	add    $0x10,%esp
c01004ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100502:	83 ec 0c             	sub    $0xc,%esp
c0100505:	50                   	push   %eax
c0100506:	6a 00                	push   $0x0
c0100508:	68 0c b0 10 c0       	push   $0xc010b00c
c010050d:	68 13 b0 10 c0       	push   $0xc010b013
c0100512:	68 47 53 10 c0       	push   $0xc0105347
c0100517:	e8 75 9b 00 00       	call   c010a091 <process_execute>
c010051c:	83 c4 20             	add    $0x20,%esp
c010051f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100522:	83 ec 0c             	sub    $0xc,%esp
c0100525:	50                   	push   %eax
c0100526:	6a 00                	push   $0x0
c0100528:	68 1c b0 10 c0       	push   $0xc010b01c
c010052d:	68 24 b0 10 c0       	push   $0xc010b024
c0100532:	68 f9 17 10 c0       	push   $0xc01017f9
c0100537:	e8 55 9b 00 00       	call   c010a091 <process_execute>
c010053c:	83 c4 20             	add    $0x20,%esp
c010053f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100542:	83 ec 0c             	sub    $0xc,%esp
c0100545:	50                   	push   %eax
c0100546:	6a 00                	push   $0x0
c0100548:	68 2d b0 10 c0       	push   $0xc010b02d
c010054d:	68 34 b0 10 c0       	push   $0xc010b034
c0100552:	68 09 08 10 c0       	push   $0xc0100809
c0100557:	e8 35 9b 00 00       	call   c010a091 <process_execute>
c010055c:	83 c4 20             	add    $0x20,%esp
c010055f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100562:	83 ec 0c             	sub    $0xc,%esp
c0100565:	50                   	push   %eax
c0100566:	6a 00                	push   $0x0
c0100568:	68 3d b0 10 c0       	push   $0xc010b03d
c010056d:	68 45 b0 10 c0       	push   $0xc010b045
c0100572:	68 dd 47 10 c0       	push   $0xc01047dd
c0100577:	e8 15 9b 00 00       	call   c010a091 <process_execute>
c010057c:	83 c4 20             	add    $0x20,%esp
c010057f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100582:	83 e8 02             	sub    $0x2,%eax
c0100585:	83 ec 0c             	sub    $0xc,%esp
c0100588:	50                   	push   %eax
c0100589:	6a 01                	push   $0x1
c010058b:	68 4f b0 10 c0       	push   $0xc010b04f
c0100590:	68 59 b0 10 c0       	push   $0xc010b059
c0100595:	68 37 07 10 c0       	push   $0xc0100737
c010059a:	e8 f2 9a 00 00       	call   c010a091 <process_execute>
c010059f:	83 c4 20             	add    $0x20,%esp
c01005a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01005a5:	83 e8 03             	sub    $0x3,%eax
c01005a8:	83 ec 0c             	sub    $0xc,%esp
c01005ab:	50                   	push   %eax
c01005ac:	6a 01                	push   $0x1
c01005ae:	68 66 b0 10 c0       	push   $0xc010b066
c01005b3:	68 70 b0 10 c0       	push   $0xc010b070
c01005b8:	68 f1 07 10 c0       	push   $0xc01007f1
c01005bd:	e8 cf 9a 00 00       	call   c010a091 <process_execute>
c01005c2:	83 c4 20             	add    $0x20,%esp
c01005c5:	83 ec 0c             	sub    $0xc,%esp
c01005c8:	68 7d b0 10 c0       	push   $0xc010b07d
c01005cd:	e8 07 fb ff ff       	call   c01000d9 <disp_str>
c01005d2:	83 c4 10             	add    $0x10,%esp
c01005d5:	fb                   	sti    
c01005d6:	e8 b3 67 00 00       	call   c0106d8e <stop_here>
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
c0100639:	e8 7c 71 00 00       	call   c01077ba <init_keyboard>
c010063e:	83 ec 0c             	sub    $0xc,%esp
c0100641:	68 00 00 00 04       	push   $0x4000000
c0100646:	e8 fa 65 00 00       	call   c0106c45 <init_memory>
c010064b:	83 c4 10             	add    $0x10,%esp
c010064e:	83 ec 0c             	sub    $0xc,%esp
c0100651:	68 ec fd 10 c0       	push   $0xc010fdec
c0100656:	e8 ca 9b 00 00       	call   c010a225 <initDoubleLinkList>
c010065b:	83 c4 10             	add    $0x10,%esp
c010065e:	83 ec 0c             	sub    $0xc,%esp
c0100661:	68 04 0f 11 c0       	push   $0xc0110f04
c0100666:	e8 ba 9b 00 00       	call   c010a225 <initDoubleLinkList>
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
c0100761:	e8 66 10 00 00       	call   c01017cc <sys_malloc>
c0100766:	83 c4 10             	add    $0x10,%esp
c0100769:	a3 bc 06 11 c0       	mov    %eax,0xc01106bc
c010076e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100771:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100776:	83 ec 04             	sub    $0x4,%esp
c0100779:	52                   	push   %edx
c010077a:	6a 00                	push   $0x0
c010077c:	50                   	push   %eax
c010077d:	e8 2d ba 00 00       	call   c010c1af <Memset>
c0100782:	83 c4 10             	add    $0x10,%esp
c0100785:	c7 45 ec c3 b0 10 c0 	movl   $0xc010b0c3,-0x14(%ebp)
c010078c:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100791:	83 ec 08             	sub    $0x8,%esp
c0100794:	ff 75 ec             	pushl  -0x14(%ebp)
c0100797:	50                   	push   %eax
c0100798:	e8 31 ba 00 00       	call   c010c1ce <Strcpy>
c010079d:	83 c4 10             	add    $0x10,%esp
c01007a0:	c6 05 cd 06 11 c0 04 	movb   $0x4,0xc01106cd
c01007a7:	e8 77 9f 00 00       	call   c010a723 <DriverInitialize>
c01007ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01007b3:	eb 04                	jmp    c01007b9 <user_proc_a+0x82>
c01007b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01007b9:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c01007bd:	7e f6                	jle    c01007b5 <user_proc_a+0x7e>
c01007bf:	83 ec 0c             	sub    $0xc,%esp
c01007c2:	68 da b0 10 c0       	push   $0xc010b0da
c01007c7:	e8 0d f9 ff ff       	call   c01000d9 <disp_str>
c01007cc:	83 c4 10             	add    $0x10,%esp
c01007cf:	83 ec 0c             	sub    $0xc,%esp
c01007d2:	68 ed b0 10 c0       	push   $0xc010b0ed
c01007d7:	e8 fd f8 ff ff       	call   c01000d9 <disp_str>
c01007dc:	83 c4 10             	add    $0x10,%esp
c01007df:	83 ec 0c             	sub    $0xc,%esp
c01007e2:	68 00 b1 10 c0       	push   $0xc010b100
c01007e7:	e8 ed f8 ff ff       	call   c01000d9 <disp_str>
c01007ec:	83 c4 10             	add    $0x10,%esp
c01007ef:	eb fe                	jmp    c01007ef <user_proc_a+0xb8>

c01007f1 <user_proc_b>:
c01007f1:	55                   	push   %ebp
c01007f2:	89 e5                	mov    %esp,%ebp
c01007f4:	83 ec 08             	sub    $0x8,%esp
c01007f7:	83 ec 0c             	sub    $0xc,%esp
c01007fa:	68 14 b1 10 c0       	push   $0xc010b114
c01007ff:	e8 d5 f8 ff ff       	call   c01000d9 <disp_str>
c0100804:	83 c4 10             	add    $0x10,%esp
c0100807:	eb fe                	jmp    c0100807 <user_proc_b+0x16>

c0100809 <TaskHD>:
c0100809:	55                   	push   %ebp
c010080a:	89 e5                	mov    %esp,%ebp
c010080c:	83 ec 18             	sub    $0x18,%esp
c010080f:	e8 28 fc ff ff       	call   c010043c <get_running_thread_pcb>
c0100814:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100817:	e8 32 00 00 00       	call   c010084e <init_hd>
c010081c:	83 ec 0c             	sub    $0xc,%esp
c010081f:	6a 7c                	push   $0x7c
c0100821:	e8 a6 0f 00 00       	call   c01017cc <sys_malloc>
c0100826:	83 c4 10             	add    $0x10,%esp
c0100829:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010082c:	83 ec 04             	sub    $0x4,%esp
c010082f:	6a 7c                	push   $0x7c
c0100831:	6a 00                	push   $0x0
c0100833:	ff 75 f0             	pushl  -0x10(%ebp)
c0100836:	e8 74 b9 00 00       	call   c010c1af <Memset>
c010083b:	83 c4 10             	add    $0x10,%esp
c010083e:	83 ec 0c             	sub    $0xc,%esp
c0100841:	ff 75 f0             	pushl  -0x10(%ebp)
c0100844:	e8 1f 00 00 00       	call   c0100868 <hd_handle>
c0100849:	83 c4 10             	add    $0x10,%esp
c010084c:	eb de                	jmp    c010082c <TaskHD+0x23>

c010084e <init_hd>:
c010084e:	55                   	push   %ebp
c010084f:	89 e5                	mov    %esp,%ebp
c0100851:	83 ec 18             	sub    $0x18,%esp
c0100854:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c010085b:	e8 98 fb ff ff       	call   c01003f8 <enable_8259A_casecade_irq>
c0100860:	e8 a7 fb ff ff       	call   c010040c <enable_8259A_slave_winchester_irq>
c0100865:	90                   	nop
c0100866:	c9                   	leave  
c0100867:	c3                   	ret    

c0100868 <hd_handle>:
c0100868:	55                   	push   %ebp
c0100869:	89 e5                	mov    %esp,%ebp
c010086b:	83 ec 18             	sub    $0x18,%esp
c010086e:	83 ec 04             	sub    $0x4,%esp
c0100871:	6a 12                	push   $0x12
c0100873:	ff 75 08             	pushl  0x8(%ebp)
c0100876:	6a 02                	push   $0x2
c0100878:	e8 88 8e 00 00       	call   c0109705 <send_rec>
c010087d:	83 c4 10             	add    $0x10,%esp
c0100880:	8b 45 08             	mov    0x8(%ebp),%eax
c0100883:	8b 40 78             	mov    0x78(%eax),%eax
c0100886:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100889:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010088d:	0f 84 d4 00 00 00    	je     c0100967 <hd_handle+0xff>
c0100893:	8b 45 08             	mov    0x8(%ebp),%eax
c0100896:	8b 00                	mov    (%eax),%eax
c0100898:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010089b:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010089f:	74 28                	je     c01008c9 <hd_handle+0x61>
c01008a1:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008a5:	74 22                	je     c01008c9 <hd_handle+0x61>
c01008a7:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008ab:	74 1c                	je     c01008c9 <hd_handle+0x61>
c01008ad:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008b1:	74 16                	je     c01008c9 <hd_handle+0x61>
c01008b3:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008ba:	74 0d                	je     c01008c9 <hd_handle+0x61>
c01008bc:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01008c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01008c9:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008cd:	74 34                	je     c0100903 <hd_handle+0x9b>
c01008cf:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008d3:	74 2e                	je     c0100903 <hd_handle+0x9b>
c01008d5:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008d9:	74 28                	je     c0100903 <hd_handle+0x9b>
c01008db:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008df:	74 22                	je     c0100903 <hd_handle+0x9b>
c01008e1:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008e8:	74 19                	je     c0100903 <hd_handle+0x9b>
c01008ea:	6a 70                	push   $0x70
c01008ec:	68 34 b1 10 c0       	push   $0xc010b134
c01008f1:	68 34 b1 10 c0       	push   $0xc010b134
c01008f6:	68 3c b1 10 c0       	push   $0xc010b13c
c01008fb:	e8 95 81 00 00       	call   c0108a95 <assertion_failure>
c0100900:	83 c4 10             	add    $0x10,%esp
c0100903:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100907:	74 2c                	je     c0100935 <hd_handle+0xcd>
c0100909:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010090d:	77 0e                	ja     c010091d <hd_handle+0xb5>
c010090f:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100913:	74 19                	je     c010092e <hd_handle+0xc6>
c0100915:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100919:	74 1a                	je     c0100935 <hd_handle+0xcd>
c010091b:	eb 37                	jmp    c0100954 <hd_handle+0xec>
c010091d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100921:	74 22                	je     c0100945 <hd_handle+0xdd>
c0100923:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c010092a:	74 3e                	je     c010096a <hd_handle+0x102>
c010092c:	eb 26                	jmp    c0100954 <hd_handle+0xec>
c010092e:	e8 e6 06 00 00       	call   c0101019 <hd_open>
c0100933:	eb 36                	jmp    c010096b <hd_handle+0x103>
c0100935:	83 ec 0c             	sub    $0xc,%esp
c0100938:	ff 75 08             	pushl  0x8(%ebp)
c010093b:	e8 b2 08 00 00       	call   c01011f2 <hd_rdwt>
c0100940:	83 c4 10             	add    $0x10,%esp
c0100943:	eb 26                	jmp    c010096b <hd_handle+0x103>
c0100945:	83 ec 0c             	sub    $0xc,%esp
c0100948:	6a 00                	push   $0x0
c010094a:	e8 71 07 00 00       	call   c01010c0 <get_hd_ioctl>
c010094f:	83 c4 10             	add    $0x10,%esp
c0100952:	eb 17                	jmp    c010096b <hd_handle+0x103>
c0100954:	83 ec 0c             	sub    $0xc,%esp
c0100957:	68 96 b1 10 c0       	push   $0xc010b196
c010095c:	e8 f0 80 00 00       	call   c0108a51 <spin>
c0100961:	83 c4 10             	add    $0x10,%esp
c0100964:	90                   	nop
c0100965:	eb 04                	jmp    c010096b <hd_handle+0x103>
c0100967:	90                   	nop
c0100968:	eb 01                	jmp    c010096b <hd_handle+0x103>
c010096a:	90                   	nop
c010096b:	c9                   	leave  
c010096c:	c3                   	ret    

c010096d <hd_cmd_out>:
c010096d:	55                   	push   %ebp
c010096e:	89 e5                	mov    %esp,%ebp
c0100970:	83 ec 08             	sub    $0x8,%esp
c0100973:	83 ec 04             	sub    $0x4,%esp
c0100976:	68 18 73 01 00       	push   $0x17318
c010097b:	6a 00                	push   $0x0
c010097d:	68 80 00 00 00       	push   $0x80
c0100982:	e8 9d 0c 00 00       	call   c0101624 <waitfor>
c0100987:	83 c4 10             	add    $0x10,%esp
c010098a:	85 c0                	test   %eax,%eax
c010098c:	75 10                	jne    c010099e <hd_cmd_out+0x31>
c010098e:	83 ec 0c             	sub    $0xc,%esp
c0100991:	68 a8 b1 10 c0       	push   $0xc010b1a8
c0100996:	e8 dc 80 00 00       	call   c0108a77 <panic>
c010099b:	83 c4 10             	add    $0x10,%esp
c010099e:	83 ec 08             	sub    $0x8,%esp
c01009a1:	6a 00                	push   $0x0
c01009a3:	68 f6 03 00 00       	push   $0x3f6
c01009a8:	e8 91 f9 ff ff       	call   c010033e <out_byte>
c01009ad:	83 c4 10             	add    $0x10,%esp
c01009b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01009b3:	0f b6 00             	movzbl (%eax),%eax
c01009b6:	0f b6 c0             	movzbl %al,%eax
c01009b9:	83 ec 08             	sub    $0x8,%esp
c01009bc:	50                   	push   %eax
c01009bd:	68 f1 01 00 00       	push   $0x1f1
c01009c2:	e8 77 f9 ff ff       	call   c010033e <out_byte>
c01009c7:	83 c4 10             	add    $0x10,%esp
c01009ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01009cd:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01009d1:	0f b6 c0             	movzbl %al,%eax
c01009d4:	83 ec 08             	sub    $0x8,%esp
c01009d7:	50                   	push   %eax
c01009d8:	68 f2 01 00 00       	push   $0x1f2
c01009dd:	e8 5c f9 ff ff       	call   c010033e <out_byte>
c01009e2:	83 c4 10             	add    $0x10,%esp
c01009e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01009e8:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c01009ec:	0f b6 c0             	movzbl %al,%eax
c01009ef:	83 ec 08             	sub    $0x8,%esp
c01009f2:	50                   	push   %eax
c01009f3:	68 f3 01 00 00       	push   $0x1f3
c01009f8:	e8 41 f9 ff ff       	call   c010033e <out_byte>
c01009fd:	83 c4 10             	add    $0x10,%esp
c0100a00:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a03:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0100a07:	0f b6 c0             	movzbl %al,%eax
c0100a0a:	83 ec 08             	sub    $0x8,%esp
c0100a0d:	50                   	push   %eax
c0100a0e:	68 f4 01 00 00       	push   $0x1f4
c0100a13:	e8 26 f9 ff ff       	call   c010033e <out_byte>
c0100a18:	83 c4 10             	add    $0x10,%esp
c0100a1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a1e:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100a22:	0f b6 c0             	movzbl %al,%eax
c0100a25:	83 ec 08             	sub    $0x8,%esp
c0100a28:	50                   	push   %eax
c0100a29:	68 f5 01 00 00       	push   $0x1f5
c0100a2e:	e8 0b f9 ff ff       	call   c010033e <out_byte>
c0100a33:	83 c4 10             	add    $0x10,%esp
c0100a36:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a39:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0100a3d:	0f b6 c0             	movzbl %al,%eax
c0100a40:	83 ec 08             	sub    $0x8,%esp
c0100a43:	50                   	push   %eax
c0100a44:	68 f6 01 00 00       	push   $0x1f6
c0100a49:	e8 f0 f8 ff ff       	call   c010033e <out_byte>
c0100a4e:	83 c4 10             	add    $0x10,%esp
c0100a51:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a54:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100a58:	0f b6 c0             	movzbl %al,%eax
c0100a5b:	83 ec 08             	sub    $0x8,%esp
c0100a5e:	50                   	push   %eax
c0100a5f:	68 f7 01 00 00       	push   $0x1f7
c0100a64:	e8 d5 f8 ff ff       	call   c010033e <out_byte>
c0100a69:	83 c4 10             	add    $0x10,%esp
c0100a6c:	90                   	nop
c0100a6d:	c9                   	leave  
c0100a6e:	c3                   	ret    

c0100a6f <hd_identify>:
c0100a6f:	55                   	push   %ebp
c0100a70:	89 e5                	mov    %esp,%ebp
c0100a72:	53                   	push   %ebx
c0100a73:	83 ec 24             	sub    $0x24,%esp
c0100a76:	89 e0                	mov    %esp,%eax
c0100a78:	89 c3                	mov    %eax,%ebx
c0100a7a:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0100a7e:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100a82:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100a86:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100a8a:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0100a8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a91:	c1 e0 04             	shl    $0x4,%eax
c0100a94:	83 c8 e0             	or     $0xffffffe0,%eax
c0100a97:	88 45 ea             	mov    %al,-0x16(%ebp)
c0100a9a:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0100a9e:	83 ec 0c             	sub    $0xc,%esp
c0100aa1:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100aa4:	50                   	push   %eax
c0100aa5:	e8 c3 fe ff ff       	call   c010096d <hd_cmd_out>
c0100aaa:	83 c4 10             	add    $0x10,%esp
c0100aad:	e8 f0 06 00 00       	call   c01011a2 <interrupt_wait>
c0100ab2:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100ab9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100abc:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100abf:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100ac2:	89 c2                	mov    %eax,%edx
c0100ac4:	b8 10 00 00 00       	mov    $0x10,%eax
c0100ac9:	83 e8 01             	sub    $0x1,%eax
c0100acc:	01 d0                	add    %edx,%eax
c0100ace:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100ad3:	ba 00 00 00 00       	mov    $0x0,%edx
c0100ad8:	f7 f1                	div    %ecx
c0100ada:	6b c0 10             	imul   $0x10,%eax,%eax
c0100add:	29 c4                	sub    %eax,%esp
c0100adf:	89 e0                	mov    %esp,%eax
c0100ae1:	83 c0 00             	add    $0x0,%eax
c0100ae4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100ae7:	83 ec 04             	sub    $0x4,%esp
c0100aea:	ff 75 f4             	pushl  -0xc(%ebp)
c0100aed:	6a 00                	push   $0x0
c0100aef:	ff 75 ec             	pushl  -0x14(%ebp)
c0100af2:	e8 b8 b6 00 00       	call   c010c1af <Memset>
c0100af7:	83 c4 10             	add    $0x10,%esp
c0100afa:	83 ec 04             	sub    $0x4,%esp
c0100afd:	ff 75 f4             	pushl  -0xc(%ebp)
c0100b00:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b03:	68 f0 01 00 00       	push   $0x1f0
c0100b08:	e8 f6 b6 00 00       	call   c010c203 <read_port>
c0100b0d:	83 c4 10             	add    $0x10,%esp
c0100b10:	83 ec 0c             	sub    $0xc,%esp
c0100b13:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b16:	e8 0b 00 00 00       	call   c0100b26 <print_hdinfo>
c0100b1b:	83 c4 10             	add    $0x10,%esp
c0100b1e:	89 dc                	mov    %ebx,%esp
c0100b20:	90                   	nop
c0100b21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b24:	c9                   	leave  
c0100b25:	c3                   	ret    

c0100b26 <print_hdinfo>:
c0100b26:	55                   	push   %ebp
c0100b27:	89 e5                	mov    %esp,%ebp
c0100b29:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100b2f:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100b35:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100b3b:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100b42:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100b49:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100b50:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100b57:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100b5e:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100b64:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100b6a:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100b71:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100b78:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100b7f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100b86:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100b8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100b94:	e9 8f 00 00 00       	jmp    c0100c28 <print_hdinfo+0x102>
c0100b99:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100ba0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100ba3:	89 d0                	mov    %edx,%eax
c0100ba5:	01 c0                	add    %eax,%eax
c0100ba7:	01 d0                	add    %edx,%eax
c0100ba9:	c1 e0 03             	shl    $0x3,%eax
c0100bac:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100baf:	01 c8                	add    %ecx,%eax
c0100bb1:	83 e8 44             	sub    $0x44,%eax
c0100bb4:	0f b7 00             	movzwl (%eax),%eax
c0100bb7:	0f b7 c0             	movzwl %ax,%eax
c0100bba:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100bbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bc0:	01 d0                	add    %edx,%eax
c0100bc2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100bc5:	eb 30                	jmp    c0100bf7 <print_hdinfo+0xd1>
c0100bc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bca:	8d 50 01             	lea    0x1(%eax),%edx
c0100bcd:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100bd0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100bd3:	83 c2 01             	add    $0x1,%edx
c0100bd6:	0f b6 00             	movzbl (%eax),%eax
c0100bd9:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100bdd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100be0:	8d 50 01             	lea    0x1(%eax),%edx
c0100be3:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100be6:	0f b6 00             	movzbl (%eax),%eax
c0100be9:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100bec:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100bef:	01 ca                	add    %ecx,%edx
c0100bf1:	88 02                	mov    %al,(%edx)
c0100bf3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100bf7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100bfa:	89 d0                	mov    %edx,%eax
c0100bfc:	01 c0                	add    %eax,%eax
c0100bfe:	01 d0                	add    %edx,%eax
c0100c00:	c1 e0 03             	shl    $0x3,%eax
c0100c03:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100c06:	01 c8                	add    %ecx,%eax
c0100c08:	83 e8 42             	sub    $0x42,%eax
c0100c0b:	0f b7 00             	movzwl (%eax),%eax
c0100c0e:	66 d1 e8             	shr    %ax
c0100c11:	0f b7 c0             	movzwl %ax,%eax
c0100c14:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100c17:	7c ae                	jl     c0100bc7 <print_hdinfo+0xa1>
c0100c19:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100c1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100c1f:	01 d0                	add    %edx,%eax
c0100c21:	c6 00 00             	movb   $0x0,(%eax)
c0100c24:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100c28:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100c2c:	0f 8e 67 ff ff ff    	jle    c0100b99 <print_hdinfo+0x73>
c0100c32:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c35:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100c39:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100c3d:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100c41:	66 c1 e8 08          	shr    $0x8,%ax
c0100c45:	66 85 c0             	test   %ax,%ax
c0100c48:	0f 95 c0             	setne  %al
c0100c4b:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100c4e:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100c55:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100c5b:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100c5f:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100c63:	75 15                	jne    c0100c7a <print_hdinfo+0x154>
c0100c65:	83 ec 08             	sub    $0x8,%esp
c0100c68:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100c6b:	50                   	push   %eax
c0100c6c:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c6f:	50                   	push   %eax
c0100c70:	e8 59 b5 00 00       	call   c010c1ce <Strcpy>
c0100c75:	83 c4 10             	add    $0x10,%esp
c0100c78:	eb 13                	jmp    c0100c8d <print_hdinfo+0x167>
c0100c7a:	83 ec 08             	sub    $0x8,%esp
c0100c7d:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c80:	50                   	push   %eax
c0100c81:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c84:	50                   	push   %eax
c0100c85:	e8 44 b5 00 00       	call   c010c1ce <Strcpy>
c0100c8a:	83 c4 10             	add    $0x10,%esp
c0100c8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c90:	83 c0 7a             	add    $0x7a,%eax
c0100c93:	0f b7 00             	movzwl (%eax),%eax
c0100c96:	0f b7 d0             	movzwl %ax,%edx
c0100c99:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c9c:	83 c0 78             	add    $0x78,%eax
c0100c9f:	0f b7 00             	movzwl (%eax),%eax
c0100ca2:	0f b7 c0             	movzwl %ax,%eax
c0100ca5:	83 c0 10             	add    $0x10,%eax
c0100ca8:	89 c1                	mov    %eax,%ecx
c0100caa:	d3 e2                	shl    %cl,%edx
c0100cac:	89 d0                	mov    %edx,%eax
c0100cae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100cb1:	90                   	nop
c0100cb2:	c9                   	leave  
c0100cb3:	c3                   	ret    

c0100cb4 <print_dpt_entry>:
c0100cb4:	55                   	push   %ebp
c0100cb5:	89 e5                	mov    %esp,%ebp
c0100cb7:	83 ec 08             	sub    $0x8,%esp
c0100cba:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cbd:	8b 40 08             	mov    0x8(%eax),%eax
c0100cc0:	83 ec 08             	sub    $0x8,%esp
c0100cc3:	50                   	push   %eax
c0100cc4:	68 b2 b1 10 c0       	push   $0xc010b1b2
c0100cc9:	e8 6a 7a 00 00       	call   c0108738 <Printf>
c0100cce:	83 c4 10             	add    $0x10,%esp
c0100cd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cd4:	8b 40 0c             	mov    0xc(%eax),%eax
c0100cd7:	83 ec 08             	sub    $0x8,%esp
c0100cda:	50                   	push   %eax
c0100cdb:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100ce0:	e8 53 7a 00 00       	call   c0108738 <Printf>
c0100ce5:	83 c4 10             	add    $0x10,%esp
c0100ce8:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ceb:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100cef:	0f b6 c0             	movzbl %al,%eax
c0100cf2:	83 ec 08             	sub    $0x8,%esp
c0100cf5:	50                   	push   %eax
c0100cf6:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100cfb:	e8 38 7a 00 00       	call   c0108738 <Printf>
c0100d00:	83 c4 10             	add    $0x10,%esp
c0100d03:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d06:	0f b6 00             	movzbl (%eax),%eax
c0100d09:	0f b6 c0             	movzbl %al,%eax
c0100d0c:	83 ec 08             	sub    $0x8,%esp
c0100d0f:	50                   	push   %eax
c0100d10:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100d15:	e8 1e 7a 00 00       	call   c0108738 <Printf>
c0100d1a:	83 c4 10             	add    $0x10,%esp
c0100d1d:	90                   	nop
c0100d1e:	c9                   	leave  
c0100d1f:	c3                   	ret    

c0100d20 <get_partition_table>:
c0100d20:	55                   	push   %ebp
c0100d21:	89 e5                	mov    %esp,%ebp
c0100d23:	53                   	push   %ebx
c0100d24:	83 ec 24             	sub    $0x24,%esp
c0100d27:	89 e0                	mov    %esp,%eax
c0100d29:	89 c3                	mov    %eax,%ebx
c0100d2b:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100d2f:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100d33:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d36:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100d39:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d3c:	c1 f8 08             	sar    $0x8,%eax
c0100d3f:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100d42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d45:	c1 f8 10             	sar    $0x10,%eax
c0100d48:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100d4b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d4e:	c1 f8 18             	sar    $0x18,%eax
c0100d51:	89 c2                	mov    %eax,%edx
c0100d53:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d56:	c1 e0 04             	shl    $0x4,%eax
c0100d59:	09 d0                	or     %edx,%eax
c0100d5b:	83 c8 e0             	or     $0xffffffe0,%eax
c0100d5e:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100d61:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100d65:	83 ec 0c             	sub    $0xc,%esp
c0100d68:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100d6b:	50                   	push   %eax
c0100d6c:	e8 fc fb ff ff       	call   c010096d <hd_cmd_out>
c0100d71:	83 c4 10             	add    $0x10,%esp
c0100d74:	e8 29 04 00 00       	call   c01011a2 <interrupt_wait>
c0100d79:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100d80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d83:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100d86:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100d89:	89 c2                	mov    %eax,%edx
c0100d8b:	b8 10 00 00 00       	mov    $0x10,%eax
c0100d90:	83 e8 01             	sub    $0x1,%eax
c0100d93:	01 d0                	add    %edx,%eax
c0100d95:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100d9a:	ba 00 00 00 00       	mov    $0x0,%edx
c0100d9f:	f7 f1                	div    %ecx
c0100da1:	6b c0 10             	imul   $0x10,%eax,%eax
c0100da4:	29 c4                	sub    %eax,%esp
c0100da6:	89 e0                	mov    %esp,%eax
c0100da8:	83 c0 00             	add    $0x0,%eax
c0100dab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100dae:	83 ec 04             	sub    $0x4,%esp
c0100db1:	ff 75 f4             	pushl  -0xc(%ebp)
c0100db4:	6a 00                	push   $0x0
c0100db6:	ff 75 ec             	pushl  -0x14(%ebp)
c0100db9:	e8 f1 b3 00 00       	call   c010c1af <Memset>
c0100dbe:	83 c4 10             	add    $0x10,%esp
c0100dc1:	83 ec 04             	sub    $0x4,%esp
c0100dc4:	ff 75 f4             	pushl  -0xc(%ebp)
c0100dc7:	ff 75 ec             	pushl  -0x14(%ebp)
c0100dca:	68 f0 01 00 00       	push   $0x1f0
c0100dcf:	e8 2f b4 00 00       	call   c010c203 <read_port>
c0100dd4:	83 c4 10             	add    $0x10,%esp
c0100dd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100dda:	05 be 01 00 00       	add    $0x1be,%eax
c0100ddf:	83 ec 04             	sub    $0x4,%esp
c0100de2:	6a 40                	push   $0x40
c0100de4:	50                   	push   %eax
c0100de5:	ff 75 10             	pushl  0x10(%ebp)
c0100de8:	e8 8f 60 00 00       	call   c0106e7c <Memcpy>
c0100ded:	83 c4 10             	add    $0x10,%esp
c0100df0:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100df7:	89 dc                	mov    %ebx,%esp
c0100df9:	90                   	nop
c0100dfa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100dfd:	c9                   	leave  
c0100dfe:	c3                   	ret    

c0100dff <partition>:
c0100dff:	55                   	push   %ebp
c0100e00:	89 e5                	mov    %esp,%ebp
c0100e02:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100e08:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100e0b:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100e0e:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100e12:	7f 19                	jg     c0100e2d <partition+0x2e>
c0100e14:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100e17:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100e1c:	89 c8                	mov    %ecx,%eax
c0100e1e:	f7 ea                	imul   %edx
c0100e20:	d1 fa                	sar    %edx
c0100e22:	89 c8                	mov    %ecx,%eax
c0100e24:	c1 f8 1f             	sar    $0x1f,%eax
c0100e27:	29 c2                	sub    %eax,%edx
c0100e29:	89 d0                	mov    %edx,%eax
c0100e2b:	eb 11                	jmp    c0100e3e <partition+0x3f>
c0100e2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e30:	83 e8 10             	sub    $0x10,%eax
c0100e33:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100e36:	85 c0                	test   %eax,%eax
c0100e38:	0f 48 c2             	cmovs  %edx,%eax
c0100e3b:	c1 f8 06             	sar    $0x6,%eax
c0100e3e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100e41:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100e45:	0f 85 cc 00 00 00    	jne    c0100f17 <partition+0x118>
c0100e4b:	83 ec 04             	sub    $0x4,%esp
c0100e4e:	6a 40                	push   $0x40
c0100e50:	6a 00                	push   $0x0
c0100e52:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e55:	50                   	push   %eax
c0100e56:	e8 54 b3 00 00       	call   c010c1af <Memset>
c0100e5b:	83 c4 10             	add    $0x10,%esp
c0100e5e:	83 ec 04             	sub    $0x4,%esp
c0100e61:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e64:	50                   	push   %eax
c0100e65:	6a 00                	push   $0x0
c0100e67:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e6a:	e8 b1 fe ff ff       	call   c0100d20 <get_partition_table>
c0100e6f:	83 c4 10             	add    $0x10,%esp
c0100e72:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e79:	e9 8a 00 00 00       	jmp    c0100f08 <partition+0x109>
c0100e7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e81:	83 c0 01             	add    $0x1,%eax
c0100e84:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100e87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e8a:	c1 e0 04             	shl    $0x4,%eax
c0100e8d:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e90:	01 c8                	add    %ecx,%eax
c0100e92:	83 e8 5c             	sub    $0x5c,%eax
c0100e95:	8b 00                	mov    (%eax),%eax
c0100e97:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e9a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e9d:	c1 e1 03             	shl    $0x3,%ecx
c0100ea0:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ea6:	01 ca                	add    %ecx,%edx
c0100ea8:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100eae:	89 02                	mov    %eax,(%edx)
c0100eb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100eb3:	c1 e0 04             	shl    $0x4,%eax
c0100eb6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100eb9:	01 c8                	add    %ecx,%eax
c0100ebb:	83 e8 58             	sub    $0x58,%eax
c0100ebe:	8b 00                	mov    (%eax),%eax
c0100ec0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100ec3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100ec6:	c1 e1 03             	shl    $0x3,%ecx
c0100ec9:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ecf:	01 ca                	add    %ecx,%edx
c0100ed1:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100ed7:	89 02                	mov    %eax,(%edx)
c0100ed9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100edc:	c1 e0 04             	shl    $0x4,%eax
c0100edf:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ee2:	01 c8                	add    %ecx,%eax
c0100ee4:	83 e8 60             	sub    $0x60,%eax
c0100ee7:	0f b6 00             	movzbl (%eax),%eax
c0100eea:	3c 05                	cmp    $0x5,%al
c0100eec:	75 16                	jne    c0100f04 <partition+0x105>
c0100eee:	8b 55 08             	mov    0x8(%ebp),%edx
c0100ef1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ef4:	01 d0                	add    %edx,%eax
c0100ef6:	83 ec 08             	sub    $0x8,%esp
c0100ef9:	6a 01                	push   $0x1
c0100efb:	50                   	push   %eax
c0100efc:	e8 fe fe ff ff       	call   c0100dff <partition>
c0100f01:	83 c4 10             	add    $0x10,%esp
c0100f04:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100f08:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100f0c:	0f 8e 6c ff ff ff    	jle    c0100e7e <partition+0x7f>
c0100f12:	e9 ff 00 00 00       	jmp    c0101016 <partition+0x217>
c0100f17:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100f1b:	0f 85 f5 00 00 00    	jne    c0101016 <partition+0x217>
c0100f21:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f24:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100f29:	89 c8                	mov    %ecx,%eax
c0100f2b:	f7 ea                	imul   %edx
c0100f2d:	d1 fa                	sar    %edx
c0100f2f:	89 c8                	mov    %ecx,%eax
c0100f31:	c1 f8 1f             	sar    $0x1f,%eax
c0100f34:	29 c2                	sub    %eax,%edx
c0100f36:	89 d0                	mov    %edx,%eax
c0100f38:	c1 e0 02             	shl    $0x2,%eax
c0100f3b:	01 d0                	add    %edx,%eax
c0100f3d:	29 c1                	sub    %eax,%ecx
c0100f3f:	89 c8                	mov    %ecx,%eax
c0100f41:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100f44:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100f47:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f4a:	c1 e2 03             	shl    $0x3,%edx
c0100f4d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f53:	01 d0                	add    %edx,%eax
c0100f55:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f5a:	8b 00                	mov    (%eax),%eax
c0100f5c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100f5f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f62:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f65:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100f68:	83 e8 01             	sub    $0x1,%eax
c0100f6b:	c1 e0 04             	shl    $0x4,%eax
c0100f6e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100f71:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100f78:	e9 8c 00 00 00       	jmp    c0101009 <partition+0x20a>
c0100f7d:	83 ec 04             	sub    $0x4,%esp
c0100f80:	6a 40                	push   $0x40
c0100f82:	6a 00                	push   $0x0
c0100f84:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f87:	50                   	push   %eax
c0100f88:	e8 22 b2 00 00       	call   c010c1af <Memset>
c0100f8d:	83 c4 10             	add    $0x10,%esp
c0100f90:	83 ec 04             	sub    $0x4,%esp
c0100f93:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f96:	50                   	push   %eax
c0100f97:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f9a:	ff 75 e8             	pushl  -0x18(%ebp)
c0100f9d:	e8 7e fd ff ff       	call   c0100d20 <get_partition_table>
c0100fa2:	83 c4 10             	add    $0x10,%esp
c0100fa5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100fa8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fab:	01 d0                	add    %edx,%eax
c0100fad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100fb0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100fb6:	01 c2                	add    %eax,%edx
c0100fb8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100fbb:	8d 48 04             	lea    0x4(%eax),%ecx
c0100fbe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100fc1:	c1 e1 03             	shl    $0x3,%ecx
c0100fc4:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100fca:	01 c8                	add    %ecx,%eax
c0100fcc:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100fd1:	89 10                	mov    %edx,(%eax)
c0100fd3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100fd6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100fd9:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100fdc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100fdf:	c1 e1 03             	shl    $0x3,%ecx
c0100fe2:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100fe8:	01 ca                	add    %ecx,%edx
c0100fea:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100ff0:	89 02                	mov    %eax,(%edx)
c0100ff2:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100ff6:	84 c0                	test   %al,%al
c0100ff8:	74 1b                	je     c0101015 <partition+0x216>
c0100ffa:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100ffd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101000:	01 d0                	add    %edx,%eax
c0101002:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101005:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101009:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c010100d:	0f 8e 6a ff ff ff    	jle    c0100f7d <partition+0x17e>
c0101013:	eb 01                	jmp    c0101016 <partition+0x217>
c0101015:	90                   	nop
c0101016:	90                   	nop
c0101017:	c9                   	leave  
c0101018:	c3                   	ret    

c0101019 <hd_open>:
c0101019:	55                   	push   %ebp
c010101a:	89 e5                	mov    %esp,%ebp
c010101c:	83 ec 18             	sub    $0x18,%esp
c010101f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101026:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101029:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010102f:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0101034:	8b 00                	mov    (%eax),%eax
c0101036:	8d 50 01             	lea    0x1(%eax),%edx
c0101039:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010103c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101042:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0101047:	89 10                	mov    %edx,(%eax)
c0101049:	83 ec 0c             	sub    $0xc,%esp
c010104c:	6a 00                	push   $0x0
c010104e:	e8 1c fa ff ff       	call   c0100a6f <hd_identify>
c0101053:	83 c4 10             	add    $0x10,%esp
c0101056:	83 ec 08             	sub    $0x8,%esp
c0101059:	6a 00                	push   $0x0
c010105b:	6a 00                	push   $0x0
c010105d:	e8 9d fd ff ff       	call   c0100dff <partition>
c0101062:	83 c4 10             	add    $0x10,%esp
c0101065:	83 ec 0c             	sub    $0xc,%esp
c0101068:	6a 7c                	push   $0x7c
c010106a:	e8 5d 07 00 00       	call   c01017cc <sys_malloc>
c010106f:	83 c4 10             	add    $0x10,%esp
c0101072:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101075:	83 ec 04             	sub    $0x4,%esp
c0101078:	6a 7c                	push   $0x7c
c010107a:	6a 00                	push   $0x0
c010107c:	ff 75 f0             	pushl  -0x10(%ebp)
c010107f:	e8 2b b1 00 00       	call   c010c1af <Memset>
c0101084:	83 c4 10             	add    $0x10,%esp
c0101087:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010108a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101091:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101094:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010109b:	83 ec 04             	sub    $0x4,%esp
c010109e:	6a 02                	push   $0x2
c01010a0:	ff 75 f0             	pushl  -0x10(%ebp)
c01010a3:	6a 01                	push   $0x1
c01010a5:	e8 5b 86 00 00       	call   c0109705 <send_rec>
c01010aa:	83 c4 10             	add    $0x10,%esp
c01010ad:	83 ec 08             	sub    $0x8,%esp
c01010b0:	6a 7c                	push   $0x7c
c01010b2:	ff 75 f0             	pushl  -0x10(%ebp)
c01010b5:	e8 27 07 00 00       	call   c01017e1 <sys_free>
c01010ba:	83 c4 10             	add    $0x10,%esp
c01010bd:	90                   	nop
c01010be:	c9                   	leave  
c01010bf:	c3                   	ret    

c01010c0 <get_hd_ioctl>:
c01010c0:	55                   	push   %ebp
c01010c1:	89 e5                	mov    %esp,%ebp
c01010c3:	83 ec 18             	sub    $0x18,%esp
c01010c6:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c01010ca:	7f 19                	jg     c01010e5 <get_hd_ioctl+0x25>
c01010cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01010cf:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01010d4:	89 c8                	mov    %ecx,%eax
c01010d6:	f7 ea                	imul   %edx
c01010d8:	d1 fa                	sar    %edx
c01010da:	89 c8                	mov    %ecx,%eax
c01010dc:	c1 f8 1f             	sar    $0x1f,%eax
c01010df:	29 c2                	sub    %eax,%edx
c01010e1:	89 d0                	mov    %edx,%eax
c01010e3:	eb 11                	jmp    c01010f6 <get_hd_ioctl+0x36>
c01010e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01010e8:	83 e8 10             	sub    $0x10,%eax
c01010eb:	8d 50 3f             	lea    0x3f(%eax),%edx
c01010ee:	85 c0                	test   %eax,%eax
c01010f0:	0f 48 c2             	cmovs  %edx,%eax
c01010f3:	c1 f8 06             	sar    $0x6,%eax
c01010f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010f9:	8b 55 08             	mov    0x8(%ebp),%edx
c01010fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010ff:	c1 e2 03             	shl    $0x3,%edx
c0101102:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101108:	01 d0                	add    %edx,%eax
c010110a:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c010110f:	8b 00                	mov    (%eax),%eax
c0101111:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101114:	83 ec 0c             	sub    $0xc,%esp
c0101117:	6a 7c                	push   $0x7c
c0101119:	e8 ae 06 00 00       	call   c01017cc <sys_malloc>
c010111e:	83 c4 10             	add    $0x10,%esp
c0101121:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101124:	83 ec 04             	sub    $0x4,%esp
c0101127:	6a 7c                	push   $0x7c
c0101129:	6a 00                	push   $0x0
c010112b:	ff 75 ec             	pushl  -0x14(%ebp)
c010112e:	e8 7c b0 00 00       	call   c010c1af <Memset>
c0101133:	83 c4 10             	add    $0x10,%esp
c0101136:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101139:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101140:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101143:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010114a:	83 ec 04             	sub    $0x4,%esp
c010114d:	6a 02                	push   $0x2
c010114f:	ff 75 ec             	pushl  -0x14(%ebp)
c0101152:	6a 01                	push   $0x1
c0101154:	e8 ac 85 00 00       	call   c0109705 <send_rec>
c0101159:	83 c4 10             	add    $0x10,%esp
c010115c:	83 ec 08             	sub    $0x8,%esp
c010115f:	6a 7c                	push   $0x7c
c0101161:	ff 75 ec             	pushl  -0x14(%ebp)
c0101164:	e8 78 06 00 00       	call   c01017e1 <sys_free>
c0101169:	83 c4 10             	add    $0x10,%esp
c010116c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010116f:	c9                   	leave  
c0101170:	c3                   	ret    

c0101171 <wait_for>:
c0101171:	55                   	push   %ebp
c0101172:	89 e5                	mov    %esp,%ebp
c0101174:	83 ec 08             	sub    $0x8,%esp
c0101177:	83 ec 04             	sub    $0x4,%esp
c010117a:	68 50 c3 00 00       	push   $0xc350
c010117f:	6a 08                	push   $0x8
c0101181:	6a 08                	push   $0x8
c0101183:	e8 9c 04 00 00       	call   c0101624 <waitfor>
c0101188:	83 c4 10             	add    $0x10,%esp
c010118b:	85 c0                	test   %eax,%eax
c010118d:	75 10                	jne    c010119f <wait_for+0x2e>
c010118f:	83 ec 0c             	sub    $0xc,%esp
c0101192:	68 e4 b1 10 c0       	push   $0xc010b1e4
c0101197:	e8 db 78 00 00       	call   c0108a77 <panic>
c010119c:	83 c4 10             	add    $0x10,%esp
c010119f:	90                   	nop
c01011a0:	c9                   	leave  
c01011a1:	c3                   	ret    

c01011a2 <interrupt_wait>:
c01011a2:	55                   	push   %ebp
c01011a3:	89 e5                	mov    %esp,%ebp
c01011a5:	83 ec 18             	sub    $0x18,%esp
c01011a8:	83 ec 0c             	sub    $0xc,%esp
c01011ab:	6a 7c                	push   $0x7c
c01011ad:	e8 1a 06 00 00       	call   c01017cc <sys_malloc>
c01011b2:	83 c4 10             	add    $0x10,%esp
c01011b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01011b8:	83 ec 04             	sub    $0x4,%esp
c01011bb:	6a 7c                	push   $0x7c
c01011bd:	6a 00                	push   $0x0
c01011bf:	ff 75 f4             	pushl  -0xc(%ebp)
c01011c2:	e8 e8 af 00 00       	call   c010c1af <Memset>
c01011c7:	83 c4 10             	add    $0x10,%esp
c01011ca:	83 ec 04             	sub    $0x4,%esp
c01011cd:	68 13 02 00 00       	push   $0x213
c01011d2:	ff 75 f4             	pushl  -0xc(%ebp)
c01011d5:	6a 02                	push   $0x2
c01011d7:	e8 29 85 00 00       	call   c0109705 <send_rec>
c01011dc:	83 c4 10             	add    $0x10,%esp
c01011df:	83 ec 08             	sub    $0x8,%esp
c01011e2:	6a 7c                	push   $0x7c
c01011e4:	ff 75 f4             	pushl  -0xc(%ebp)
c01011e7:	e8 f5 05 00 00       	call   c01017e1 <sys_free>
c01011ec:	83 c4 10             	add    $0x10,%esp
c01011ef:	90                   	nop
c01011f0:	c9                   	leave  
c01011f1:	c3                   	ret    

c01011f2 <hd_rdwt>:
c01011f2:	55                   	push   %ebp
c01011f3:	89 e5                	mov    %esp,%ebp
c01011f5:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c01011fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01011fe:	8b 40 18             	mov    0x18(%eax),%eax
c0101201:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101204:	8b 45 08             	mov    0x8(%ebp),%eax
c0101207:	8b 40 14             	mov    0x14(%eax),%eax
c010120a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010120d:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0101211:	7f 19                	jg     c010122c <hd_rdwt+0x3a>
c0101213:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0101216:	ba 67 66 66 66       	mov    $0x66666667,%edx
c010121b:	89 c8                	mov    %ecx,%eax
c010121d:	f7 ea                	imul   %edx
c010121f:	d1 fa                	sar    %edx
c0101221:	89 c8                	mov    %ecx,%eax
c0101223:	c1 f8 1f             	sar    $0x1f,%eax
c0101226:	29 c2                	sub    %eax,%edx
c0101228:	89 d0                	mov    %edx,%eax
c010122a:	eb 11                	jmp    c010123d <hd_rdwt+0x4b>
c010122c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010122f:	83 e8 10             	sub    $0x10,%eax
c0101232:	8d 50 3f             	lea    0x3f(%eax),%edx
c0101235:	85 c0                	test   %eax,%eax
c0101237:	0f 48 c2             	cmovs  %edx,%eax
c010123a:	c1 f8 06             	sar    $0x6,%eax
c010123d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101240:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101243:	8d 50 f0             	lea    -0x10(%eax),%edx
c0101246:	89 d0                	mov    %edx,%eax
c0101248:	c1 f8 1f             	sar    $0x1f,%eax
c010124b:	c1 e8 1a             	shr    $0x1a,%eax
c010124e:	01 c2                	add    %eax,%edx
c0101250:	83 e2 3f             	and    $0x3f,%edx
c0101253:	29 c2                	sub    %eax,%edx
c0101255:	89 d0                	mov    %edx,%eax
c0101257:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010125a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010125d:	c1 e8 09             	shr    $0x9,%eax
c0101260:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101263:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0101267:	7f 1a                	jg     c0101283 <hd_rdwt+0x91>
c0101269:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010126c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010126f:	c1 e2 03             	shl    $0x3,%edx
c0101272:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101278:	01 d0                	add    %edx,%eax
c010127a:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010127f:	8b 00                	mov    (%eax),%eax
c0101281:	eb 1b                	jmp    c010129e <hd_rdwt+0xac>
c0101283:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101286:	8d 50 04             	lea    0x4(%eax),%edx
c0101289:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010128c:	c1 e2 03             	shl    $0x3,%edx
c010128f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101295:	01 d0                	add    %edx,%eax
c0101297:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010129c:	8b 00                	mov    (%eax),%eax
c010129e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01012a1:	01 d0                	add    %edx,%eax
c01012a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01012a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01012a9:	8b 40 0c             	mov    0xc(%eax),%eax
c01012ac:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01012af:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012b2:	05 ff 01 00 00       	add    $0x1ff,%eax
c01012b7:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01012bd:	85 c0                	test   %eax,%eax
c01012bf:	0f 48 c2             	cmovs  %edx,%eax
c01012c2:	c1 f8 09             	sar    $0x9,%eax
c01012c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01012c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01012ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01012d1:	8b 40 10             	mov    0x10(%eax),%eax
c01012d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01012d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01012da:	8b 00                	mov    (%eax),%eax
c01012dc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01012df:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012e2:	83 ec 08             	sub    $0x8,%esp
c01012e5:	50                   	push   %eax
c01012e6:	ff 75 d0             	pushl  -0x30(%ebp)
c01012e9:	e8 21 4d 00 00       	call   c010600f <alloc_virtual_memory>
c01012ee:	83 c4 10             	add    $0x10,%esp
c01012f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01012f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01012f7:	8b 40 78             	mov    0x78(%eax),%eax
c01012fa:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01012fd:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101301:	74 22                	je     c0101325 <hd_rdwt+0x133>
c0101303:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101307:	74 1c                	je     c0101325 <hd_rdwt+0x133>
c0101309:	68 ba 01 00 00       	push   $0x1ba
c010130e:	68 34 b1 10 c0       	push   $0xc010b134
c0101313:	68 34 b1 10 c0       	push   $0xc010b134
c0101318:	68 f6 b1 10 c0       	push   $0xc010b1f6
c010131d:	e8 73 77 00 00       	call   c0108a95 <assertion_failure>
c0101322:	83 c4 10             	add    $0x10,%esp
c0101325:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0101329:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010132c:	88 45 be             	mov    %al,-0x42(%ebp)
c010132f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101332:	88 45 bf             	mov    %al,-0x41(%ebp)
c0101335:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101338:	c1 f8 08             	sar    $0x8,%eax
c010133b:	88 45 c0             	mov    %al,-0x40(%ebp)
c010133e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101341:	c1 f8 10             	sar    $0x10,%eax
c0101344:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0101347:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010134a:	c1 f8 18             	sar    $0x18,%eax
c010134d:	83 e0 0f             	and    $0xf,%eax
c0101350:	83 c8 e0             	or     $0xffffffe0,%eax
c0101353:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0101356:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c010135a:	75 07                	jne    c0101363 <hd_rdwt+0x171>
c010135c:	b8 20 00 00 00       	mov    $0x20,%eax
c0101361:	eb 05                	jmp    c0101368 <hd_rdwt+0x176>
c0101363:	b8 30 00 00 00       	mov    $0x30,%eax
c0101368:	88 45 c3             	mov    %al,-0x3d(%ebp)
c010136b:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010136f:	3c 20                	cmp    $0x20,%al
c0101371:	74 24                	je     c0101397 <hd_rdwt+0x1a5>
c0101373:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101377:	3c 30                	cmp    $0x30,%al
c0101379:	74 1c                	je     c0101397 <hd_rdwt+0x1a5>
c010137b:	68 c8 01 00 00       	push   $0x1c8
c0101380:	68 34 b1 10 c0       	push   $0xc010b134
c0101385:	68 34 b1 10 c0       	push   $0xc010b134
c010138a:	68 14 b2 10 c0       	push   $0xc010b214
c010138f:	e8 01 77 00 00       	call   c0108a95 <assertion_failure>
c0101394:	83 c4 10             	add    $0x10,%esp
c0101397:	83 ec 0c             	sub    $0xc,%esp
c010139a:	8d 45 bd             	lea    -0x43(%ebp),%eax
c010139d:	50                   	push   %eax
c010139e:	e8 ca f5 ff ff       	call   c010096d <hd_cmd_out>
c01013a3:	83 c4 10             	add    $0x10,%esp
c01013a6:	e9 9c 00 00 00       	jmp    c0101447 <hd_rdwt+0x255>
c01013ab:	b8 00 02 00 00       	mov    $0x200,%eax
c01013b0:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c01013b7:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c01013bb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01013be:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01013c2:	75 51                	jne    c0101415 <hd_rdwt+0x223>
c01013c4:	e8 a8 fd ff ff       	call   c0101171 <wait_for>
c01013c9:	e8 d4 fd ff ff       	call   c01011a2 <interrupt_wait>
c01013ce:	83 ec 04             	sub    $0x4,%esp
c01013d1:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013d4:	6a 00                	push   $0x0
c01013d6:	68 80 11 11 c0       	push   $0xc0111180
c01013db:	e8 cf ad 00 00       	call   c010c1af <Memset>
c01013e0:	83 c4 10             	add    $0x10,%esp
c01013e3:	83 ec 04             	sub    $0x4,%esp
c01013e6:	68 00 02 00 00       	push   $0x200
c01013eb:	68 80 11 11 c0       	push   $0xc0111180
c01013f0:	68 f0 01 00 00       	push   $0x1f0
c01013f5:	e8 09 ae 00 00       	call   c010c203 <read_port>
c01013fa:	83 c4 10             	add    $0x10,%esp
c01013fd:	83 ec 04             	sub    $0x4,%esp
c0101400:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101403:	68 80 11 11 c0       	push   $0xc0111180
c0101408:	ff 75 f0             	pushl  -0x10(%ebp)
c010140b:	e8 6c 5a 00 00       	call   c0106e7c <Memcpy>
c0101410:	83 c4 10             	add    $0x10,%esp
c0101413:	eb 26                	jmp    c010143b <hd_rdwt+0x249>
c0101415:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101419:	75 20                	jne    c010143b <hd_rdwt+0x249>
c010141b:	e8 51 fd ff ff       	call   c0101171 <wait_for>
c0101420:	83 ec 04             	sub    $0x4,%esp
c0101423:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101426:	ff 75 f0             	pushl  -0x10(%ebp)
c0101429:	68 f0 01 00 00       	push   $0x1f0
c010142e:	e8 e4 ad 00 00       	call   c010c217 <write_port>
c0101433:	83 c4 10             	add    $0x10,%esp
c0101436:	e8 67 fd ff ff       	call   c01011a2 <interrupt_wait>
c010143b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010143e:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101441:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101444:	01 45 f0             	add    %eax,-0x10(%ebp)
c0101447:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010144b:	0f 85 5a ff ff ff    	jne    c01013ab <hd_rdwt+0x1b9>
c0101451:	83 ec 04             	sub    $0x4,%esp
c0101454:	6a 7c                	push   $0x7c
c0101456:	6a 00                	push   $0x0
c0101458:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010145e:	50                   	push   %eax
c010145f:	e8 4b ad 00 00       	call   c010c1af <Memset>
c0101464:	83 c4 10             	add    $0x10,%esp
c0101467:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c010146e:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101475:	00 00 00 
c0101478:	83 ec 04             	sub    $0x4,%esp
c010147b:	6a 02                	push   $0x2
c010147d:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101483:	50                   	push   %eax
c0101484:	6a 01                	push   $0x1
c0101486:	e8 7a 82 00 00       	call   c0109705 <send_rec>
c010148b:	83 c4 10             	add    $0x10,%esp
c010148e:	90                   	nop
c010148f:	c9                   	leave  
c0101490:	c3                   	ret    

c0101491 <hd_handler>:
c0101491:	55                   	push   %ebp
c0101492:	89 e5                	mov    %esp,%ebp
c0101494:	83 ec 18             	sub    $0x18,%esp
c0101497:	83 ec 0c             	sub    $0xc,%esp
c010149a:	68 f7 01 00 00       	push   $0x1f7
c010149f:	e8 8e ee ff ff       	call   c0100332 <in_byte>
c01014a4:	83 c4 10             	add    $0x10,%esp
c01014a7:	0f b6 c0             	movzbl %al,%eax
c01014aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01014ad:	83 ec 0c             	sub    $0xc,%esp
c01014b0:	6a 03                	push   $0x3
c01014b2:	e8 e8 84 00 00       	call   c010999f <inform_int>
c01014b7:	83 c4 10             	add    $0x10,%esp
c01014ba:	90                   	nop
c01014bb:	c9                   	leave  
c01014bc:	c3                   	ret    

c01014bd <debug_ticks>:
c01014bd:	55                   	push   %ebp
c01014be:	89 e5                	mov    %esp,%ebp
c01014c0:	83 ec 08             	sub    $0x8,%esp
c01014c3:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01014c8:	83 c0 01             	add    $0x1,%eax
c01014cb:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c01014d0:	c7 05 a4 f7 10 c0 ae 	movl   $0x1ae,0xc010f7a4
c01014d7:	01 00 00 
c01014da:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01014df:	83 ec 0c             	sub    $0xc,%esp
c01014e2:	50                   	push   %eax
c01014e3:	e8 82 5d 00 00       	call   c010726a <disp_int>
c01014e8:	83 c4 10             	add    $0x10,%esp
c01014eb:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01014f0:	83 f8 01             	cmp    $0x1,%eax
c01014f3:	75 03                	jne    c01014f8 <debug_ticks+0x3b>
c01014f5:	66 87 db             	xchg   %bx,%bx
c01014f8:	90                   	nop
c01014f9:	c9                   	leave  
c01014fa:	c3                   	ret    

c01014fb <net_handler>:
c01014fb:	55                   	push   %ebp
c01014fc:	89 e5                	mov    %esp,%ebp
c01014fe:	83 ec 28             	sub    $0x28,%esp
c0101501:	e8 af 93 00 00       	call   c010a8b5 <get_interrupt_status>
c0101506:	88 45 df             	mov    %al,-0x21(%ebp)
c0101509:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
c010150d:	83 ec 04             	sub    $0x4,%esp
c0101510:	6a 01                	push   $0x1
c0101512:	8d 45 df             	lea    -0x21(%ebp),%eax
c0101515:	50                   	push   %eax
c0101516:	8d 45 de             	lea    -0x22(%ebp),%eax
c0101519:	50                   	push   %eax
c010151a:	e8 5d 59 00 00       	call   c0106e7c <Memcpy>
c010151f:	83 c4 10             	add    $0x10,%esp
c0101522:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c0101529:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010152c:	83 ec 0c             	sub    $0xc,%esp
c010152f:	50                   	push   %eax
c0101530:	e8 97 02 00 00       	call   c01017cc <sys_malloc>
c0101535:	83 c4 10             	add    $0x10,%esp
c0101538:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010153b:	c7 45 f4 00 40 00 00 	movl   $0x4000,-0xc(%ebp)
c0101542:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101549:	e9 b3 00 00 00       	jmp    c0101601 <net_handler+0x106>
c010154e:	83 ec 04             	sub    $0x4,%esp
c0101551:	ff 75 e8             	pushl  -0x18(%ebp)
c0101554:	6a 00                	push   $0x0
c0101556:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101559:	e8 51 ac 00 00       	call   c010c1af <Memset>
c010155e:	83 c4 10             	add    $0x10,%esp
c0101561:	83 ec 0c             	sub    $0xc,%esp
c0101564:	ff 75 f4             	pushl  -0xc(%ebp)
c0101567:	e8 41 92 00 00       	call   c010a7ad <SetPageStart>
c010156c:	83 c4 10             	add    $0x10,%esp
c010156f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101572:	01 45 f4             	add    %eax,-0xc(%ebp)
c0101575:	83 ec 0c             	sub    $0xc,%esp
c0101578:	ff 75 e4             	pushl  -0x1c(%ebp)
c010157b:	e8 64 93 00 00       	call   c010a8e4 <NICtoPC>
c0101580:	83 c4 10             	add    $0x10,%esp
c0101583:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101586:	c7 45 e0 40 00 00 00 	movl   $0x40,-0x20(%ebp)
c010158d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101594:	eb 2e                	jmp    c01015c4 <net_handler+0xc9>
c0101596:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101599:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010159c:	01 d0                	add    %edx,%eax
c010159e:	0f b6 00             	movzbl (%eax),%eax
c01015a1:	0f b6 c0             	movzbl %al,%eax
c01015a4:	83 ec 0c             	sub    $0xc,%esp
c01015a7:	50                   	push   %eax
c01015a8:	e8 bd 5c 00 00       	call   c010726a <disp_int>
c01015ad:	83 c4 10             	add    $0x10,%esp
c01015b0:	83 ec 0c             	sub    $0xc,%esp
c01015b3:	68 48 b2 10 c0       	push   $0xc010b248
c01015b8:	e8 1c eb ff ff       	call   c01000d9 <disp_str>
c01015bd:	83 c4 10             	add    $0x10,%esp
c01015c0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01015c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01015c7:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c01015ca:	77 ca                	ja     c0101596 <net_handler+0x9b>
c01015cc:	83 ec 08             	sub    $0x8,%esp
c01015cf:	ff 75 e0             	pushl  -0x20(%ebp)
c01015d2:	ff 75 e4             	pushl  -0x1c(%ebp)
c01015d5:	e8 b2 ea ff ff       	call   c010008c <disp_str_len>
c01015da:	83 c4 10             	add    $0x10,%esp
c01015dd:	83 ec 0c             	sub    $0xc,%esp
c01015e0:	68 4a b2 10 c0       	push   $0xc010b24a
c01015e5:	e8 ef ea ff ff       	call   c01000d9 <disp_str>
c01015ea:	83 c4 10             	add    $0x10,%esp
c01015ed:	83 ec 0c             	sub    $0xc,%esp
c01015f0:	68 4a b2 10 c0       	push   $0xc010b24a
c01015f5:	e8 df ea ff ff       	call   c01000d9 <disp_str>
c01015fa:	83 c4 10             	add    $0x10,%esp
c01015fd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101601:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c0101605:	0f 8e 43 ff ff ff    	jle    c010154e <net_handler+0x53>
c010160b:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
c010160f:	0f b6 c0             	movzbl %al,%eax
c0101612:	83 ec 0c             	sub    $0xc,%esp
c0101615:	50                   	push   %eax
c0101616:	e8 b0 92 00 00       	call   c010a8cb <set_interrupt_status>
c010161b:	83 c4 10             	add    $0x10,%esp
c010161e:	66 87 db             	xchg   %bx,%bx
c0101621:	90                   	nop
c0101622:	c9                   	leave  
c0101623:	c3                   	ret    

c0101624 <waitfor>:
c0101624:	55                   	push   %ebp
c0101625:	89 e5                	mov    %esp,%ebp
c0101627:	83 ec 18             	sub    $0x18,%esp
c010162a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101631:	eb 26                	jmp    c0101659 <waitfor+0x35>
c0101633:	83 ec 0c             	sub    $0xc,%esp
c0101636:	68 f7 01 00 00       	push   $0x1f7
c010163b:	e8 f2 ec ff ff       	call   c0100332 <in_byte>
c0101640:	83 c4 10             	add    $0x10,%esp
c0101643:	0f b6 c0             	movzbl %al,%eax
c0101646:	23 45 08             	and    0x8(%ebp),%eax
c0101649:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010164c:	75 07                	jne    c0101655 <waitfor+0x31>
c010164e:	b8 01 00 00 00       	mov    $0x1,%eax
c0101653:	eb 11                	jmp    c0101666 <waitfor+0x42>
c0101655:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101659:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010165c:	3b 45 10             	cmp    0x10(%ebp),%eax
c010165f:	7c d2                	jl     c0101633 <waitfor+0xf>
c0101661:	b8 00 00 00 00       	mov    $0x0,%eax
c0101666:	c9                   	leave  
c0101667:	c3                   	ret    

c0101668 <print_hd_info>:
c0101668:	55                   	push   %ebp
c0101669:	89 e5                	mov    %esp,%ebp
c010166b:	83 ec 18             	sub    $0x18,%esp
c010166e:	83 ec 0c             	sub    $0xc,%esp
c0101671:	68 4c b2 10 c0       	push   $0xc010b24c
c0101676:	e8 bd 70 00 00       	call   c0108738 <Printf>
c010167b:	83 c4 10             	add    $0x10,%esp
c010167e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101685:	eb 3b                	jmp    c01016c2 <print_hd_info+0x5a>
c0101687:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010168a:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101691:	85 c0                	test   %eax,%eax
c0101693:	74 28                	je     c01016bd <print_hd_info+0x55>
c0101695:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101698:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c010169f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016a2:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01016a9:	ff 75 f4             	pushl  -0xc(%ebp)
c01016ac:	52                   	push   %edx
c01016ad:	50                   	push   %eax
c01016ae:	68 69 b2 10 c0       	push   $0xc010b269
c01016b3:	e8 80 70 00 00       	call   c0108738 <Printf>
c01016b8:	83 c4 10             	add    $0x10,%esp
c01016bb:	eb 01                	jmp    c01016be <print_hd_info+0x56>
c01016bd:	90                   	nop
c01016be:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01016c2:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c01016c6:	7e bf                	jle    c0101687 <print_hd_info+0x1f>
c01016c8:	83 ec 0c             	sub    $0xc,%esp
c01016cb:	68 81 b2 10 c0       	push   $0xc010b281
c01016d0:	e8 63 70 00 00       	call   c0108738 <Printf>
c01016d5:	83 c4 10             	add    $0x10,%esp
c01016d8:	83 ec 0c             	sub    $0xc,%esp
c01016db:	68 9c b2 10 c0       	push   $0xc010b29c
c01016e0:	e8 53 70 00 00       	call   c0108738 <Printf>
c01016e5:	83 c4 10             	add    $0x10,%esp
c01016e8:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c01016ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01016f6:	eb 44                	jmp    c010173c <print_hd_info+0xd4>
c01016f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01016fb:	83 c0 04             	add    $0x4,%eax
c01016fe:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101705:	85 c0                	test   %eax,%eax
c0101707:	74 2e                	je     c0101737 <print_hd_info+0xcf>
c0101709:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010170c:	83 c0 04             	add    $0x4,%eax
c010170f:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101716:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101719:	83 c0 04             	add    $0x4,%eax
c010171c:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101723:	ff 75 f0             	pushl  -0x10(%ebp)
c0101726:	52                   	push   %edx
c0101727:	50                   	push   %eax
c0101728:	68 69 b2 10 c0       	push   $0xc010b269
c010172d:	e8 06 70 00 00       	call   c0108738 <Printf>
c0101732:	83 c4 10             	add    $0x10,%esp
c0101735:	eb 01                	jmp    c0101738 <print_hd_info+0xd0>
c0101737:	90                   	nop
c0101738:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010173c:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101740:	7e b6                	jle    c01016f8 <print_hd_info+0x90>
c0101742:	83 ec 0c             	sub    $0xc,%esp
c0101745:	68 b9 b2 10 c0       	push   $0xc010b2b9
c010174a:	e8 e9 6f 00 00       	call   c0108738 <Printf>
c010174f:	83 c4 10             	add    $0x10,%esp
c0101752:	90                   	nop
c0101753:	c9                   	leave  
c0101754:	c3                   	ret    

c0101755 <is_empty>:
c0101755:	55                   	push   %ebp
c0101756:	89 e5                	mov    %esp,%ebp
c0101758:	83 ec 10             	sub    $0x10,%esp
c010175b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0101762:	eb 1a                	jmp    c010177e <is_empty+0x29>
c0101764:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0101767:	8b 45 08             	mov    0x8(%ebp),%eax
c010176a:	01 d0                	add    %edx,%eax
c010176c:	0f b6 00             	movzbl (%eax),%eax
c010176f:	84 c0                	test   %al,%al
c0101771:	74 07                	je     c010177a <is_empty+0x25>
c0101773:	b8 00 00 00 00       	mov    $0x0,%eax
c0101778:	eb 11                	jmp    c010178b <is_empty+0x36>
c010177a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010177e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101781:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101784:	7c de                	jl     c0101764 <is_empty+0xf>
c0101786:	b8 01 00 00 00       	mov    $0x1,%eax
c010178b:	c9                   	leave  
c010178c:	c3                   	ret    
c010178d:	66 90                	xchg   %ax,%ax
c010178f:	90                   	nop

c0101790 <write_debug>:
c0101790:	b8 02 00 00 00       	mov    $0x2,%eax
c0101795:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101799:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010179d:	cd 90                	int    $0x90
c010179f:	c3                   	ret    

c01017a0 <send_msg>:
c01017a0:	55                   	push   %ebp
c01017a1:	89 e5                	mov    %esp,%ebp
c01017a3:	53                   	push   %ebx
c01017a4:	51                   	push   %ecx
c01017a5:	b8 03 00 00 00       	mov    $0x3,%eax
c01017aa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01017ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01017b0:	cd 90                	int    $0x90
c01017b2:	59                   	pop    %ecx
c01017b3:	5b                   	pop    %ebx
c01017b4:	5d                   	pop    %ebp
c01017b5:	c3                   	ret    

c01017b6 <receive_msg>:
c01017b6:	55                   	push   %ebp
c01017b7:	89 e5                	mov    %esp,%ebp
c01017b9:	53                   	push   %ebx
c01017ba:	51                   	push   %ecx
c01017bb:	b8 04 00 00 00       	mov    $0x4,%eax
c01017c0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01017c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01017c6:	cd 90                	int    $0x90
c01017c8:	59                   	pop    %ecx
c01017c9:	5b                   	pop    %ebx
c01017ca:	5d                   	pop    %ebp
c01017cb:	c3                   	ret    

c01017cc <sys_malloc>:
c01017cc:	56                   	push   %esi
c01017cd:	57                   	push   %edi
c01017ce:	53                   	push   %ebx
c01017cf:	55                   	push   %ebp
c01017d0:	89 e5                	mov    %esp,%ebp
c01017d2:	b8 05 00 00 00       	mov    $0x5,%eax
c01017d7:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01017da:	cd 90                	int    $0x90
c01017dc:	5d                   	pop    %ebp
c01017dd:	5b                   	pop    %ebx
c01017de:	5f                   	pop    %edi
c01017df:	5e                   	pop    %esi
c01017e0:	c3                   	ret    

c01017e1 <sys_free>:
c01017e1:	56                   	push   %esi
c01017e2:	57                   	push   %edi
c01017e3:	53                   	push   %ebx
c01017e4:	55                   	push   %ebp
c01017e5:	89 e5                	mov    %esp,%ebp
c01017e7:	b8 06 00 00 00       	mov    $0x6,%eax
c01017ec:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01017ef:	8b 5d 18             	mov    0x18(%ebp),%ebx
c01017f2:	cd 90                	int    $0x90
c01017f4:	5d                   	pop    %ebp
c01017f5:	5b                   	pop    %ebx
c01017f6:	5f                   	pop    %edi
c01017f7:	5e                   	pop    %esi
c01017f8:	c3                   	ret    

c01017f9 <task_fs>:
c01017f9:	55                   	push   %ebp
c01017fa:	89 e5                	mov    %esp,%ebp
c01017fc:	83 ec 28             	sub    $0x28,%esp
c01017ff:	e8 bb 08 00 00       	call   c01020bf <init_fs>
c0101804:	83 ec 0c             	sub    $0xc,%esp
c0101807:	6a 7c                	push   $0x7c
c0101809:	e8 be ff ff ff       	call   c01017cc <sys_malloc>
c010180e:	83 c4 10             	add    $0x10,%esp
c0101811:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101814:	83 ec 0c             	sub    $0xc,%esp
c0101817:	6a 7c                	push   $0x7c
c0101819:	e8 ae ff ff ff       	call   c01017cc <sys_malloc>
c010181e:	83 c4 10             	add    $0x10,%esp
c0101821:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101824:	83 ec 04             	sub    $0x4,%esp
c0101827:	6a 7c                	push   $0x7c
c0101829:	6a 00                	push   $0x0
c010182b:	ff 75 f4             	pushl  -0xc(%ebp)
c010182e:	e8 7c a9 00 00       	call   c010c1af <Memset>
c0101833:	83 c4 10             	add    $0x10,%esp
c0101836:	83 ec 04             	sub    $0x4,%esp
c0101839:	6a 12                	push   $0x12
c010183b:	ff 75 f4             	pushl  -0xc(%ebp)
c010183e:	6a 02                	push   $0x2
c0101840:	e8 c0 7e 00 00       	call   c0109705 <send_rec>
c0101845:	83 c4 10             	add    $0x10,%esp
c0101848:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010184b:	8b 40 78             	mov    0x78(%eax),%eax
c010184e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101851:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101854:	8b 00                	mov    (%eax),%eax
c0101856:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101859:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010185c:	8b 40 50             	mov    0x50(%eax),%eax
c010185f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101862:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101865:	8b 40 68             	mov    0x68(%eax),%eax
c0101868:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010186b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010186e:	8b 00                	mov    (%eax),%eax
c0101870:	85 c0                	test   %eax,%eax
c0101872:	75 07                	jne    c010187b <task_fs+0x82>
c0101874:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010187b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101882:	83 ec 0c             	sub    $0xc,%esp
c0101885:	ff 75 e8             	pushl  -0x18(%ebp)
c0101888:	e8 39 21 00 00       	call   c01039c6 <pid2proc>
c010188d:	83 c4 10             	add    $0x10,%esp
c0101890:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101895:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101899:	74 37                	je     c01018d2 <task_fs+0xd9>
c010189b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010189f:	74 31                	je     c01018d2 <task_fs+0xd9>
c01018a1:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01018a5:	74 2b                	je     c01018d2 <task_fs+0xd9>
c01018a7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01018ab:	74 25                	je     c01018d2 <task_fs+0xd9>
c01018ad:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01018b1:	74 1f                	je     c01018d2 <task_fs+0xd9>
c01018b3:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01018b7:	74 19                	je     c01018d2 <task_fs+0xd9>
c01018b9:	6a 7a                	push   $0x7a
c01018bb:	68 d8 b2 10 c0       	push   $0xc010b2d8
c01018c0:	68 d8 b2 10 c0       	push   $0xc010b2d8
c01018c5:	68 e8 b2 10 c0       	push   $0xc010b2e8
c01018ca:	e8 c6 71 00 00       	call   c0108a95 <assertion_failure>
c01018cf:	83 c4 10             	add    $0x10,%esp
c01018d2:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01018d6:	74 3a                	je     c0101912 <task_fs+0x119>
c01018d8:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01018dc:	7f 19                	jg     c01018f7 <task_fs+0xfe>
c01018de:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01018e2:	0f 84 10 01 00 00    	je     c01019f8 <task_fs+0x1ff>
c01018e8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01018ec:	0f 84 a1 00 00 00    	je     c0101993 <task_fs+0x19a>
c01018f2:	e9 ef 00 00 00       	jmp    c01019e6 <task_fs+0x1ed>
c01018f7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01018fb:	74 50                	je     c010194d <task_fs+0x154>
c01018fd:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101901:	0f 84 c6 00 00 00    	je     c01019cd <task_fs+0x1d4>
c0101907:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010190b:	74 40                	je     c010194d <task_fs+0x154>
c010190d:	e9 d4 00 00 00       	jmp    c01019e6 <task_fs+0x1ed>
c0101912:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101915:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010191c:	83 ec 0c             	sub    $0xc,%esp
c010191f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101922:	e8 ec 07 00 00       	call   c0102113 <do_open>
c0101927:	83 c4 10             	add    $0x10,%esp
c010192a:	89 c2                	mov    %eax,%edx
c010192c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010192f:	89 50 50             	mov    %edx,0x50(%eax)
c0101932:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101935:	8b 00                	mov    (%eax),%eax
c0101937:	83 ec 04             	sub    $0x4,%esp
c010193a:	50                   	push   %eax
c010193b:	ff 75 f4             	pushl  -0xc(%ebp)
c010193e:	6a 01                	push   $0x1
c0101940:	e8 c0 7d 00 00       	call   c0109705 <send_rec>
c0101945:	83 c4 10             	add    $0x10,%esp
c0101948:	e9 b2 00 00 00       	jmp    c01019ff <task_fs+0x206>
c010194d:	83 ec 0c             	sub    $0xc,%esp
c0101950:	ff 75 f4             	pushl  -0xc(%ebp)
c0101953:	e8 19 19 00 00       	call   c0103271 <do_rdwt>
c0101958:	83 c4 10             	add    $0x10,%esp
c010195b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010195e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101962:	0f 84 96 00 00 00    	je     c01019fe <task_fs+0x205>
c0101968:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010196b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101972:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101975:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101978:	89 50 60             	mov    %edx,0x60(%eax)
c010197b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010197e:	8b 00                	mov    (%eax),%eax
c0101980:	83 ec 04             	sub    $0x4,%esp
c0101983:	50                   	push   %eax
c0101984:	ff 75 f4             	pushl  -0xc(%ebp)
c0101987:	6a 01                	push   $0x1
c0101989:	e8 77 7d 00 00       	call   c0109705 <send_rec>
c010198e:	83 c4 10             	add    $0x10,%esp
c0101991:	eb 6b                	jmp    c01019fe <task_fs+0x205>
c0101993:	83 ec 0c             	sub    $0xc,%esp
c0101996:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101999:	e8 f0 1d 00 00       	call   c010378e <do_close>
c010199e:	83 c4 10             	add    $0x10,%esp
c01019a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019a4:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01019ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019ae:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01019b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019b8:	8b 00                	mov    (%eax),%eax
c01019ba:	83 ec 04             	sub    $0x4,%esp
c01019bd:	50                   	push   %eax
c01019be:	ff 75 f4             	pushl  -0xc(%ebp)
c01019c1:	6a 01                	push   $0x1
c01019c3:	e8 3d 7d 00 00       	call   c0109705 <send_rec>
c01019c8:	83 c4 10             	add    $0x10,%esp
c01019cb:	eb 32                	jmp    c01019ff <task_fs+0x206>
c01019cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019d0:	8b 40 68             	mov    0x68(%eax),%eax
c01019d3:	83 ec 04             	sub    $0x4,%esp
c01019d6:	50                   	push   %eax
c01019d7:	ff 75 f4             	pushl  -0xc(%ebp)
c01019da:	6a 01                	push   $0x1
c01019dc:	e8 24 7d 00 00       	call   c0109705 <send_rec>
c01019e1:	83 c4 10             	add    $0x10,%esp
c01019e4:	eb 19                	jmp    c01019ff <task_fs+0x206>
c01019e6:	83 ec 0c             	sub    $0xc,%esp
c01019e9:	68 4b b3 10 c0       	push   $0xc010b34b
c01019ee:	e8 84 70 00 00       	call   c0108a77 <panic>
c01019f3:	83 c4 10             	add    $0x10,%esp
c01019f6:	eb 07                	jmp    c01019ff <task_fs+0x206>
c01019f8:	90                   	nop
c01019f9:	e9 26 fe ff ff       	jmp    c0101824 <task_fs+0x2b>
c01019fe:	90                   	nop
c01019ff:	e9 20 fe ff ff       	jmp    c0101824 <task_fs+0x2b>

c0101a04 <rd_wt>:
c0101a04:	55                   	push   %ebp
c0101a05:	89 e5                	mov    %esp,%ebp
c0101a07:	83 ec 18             	sub    $0x18,%esp
c0101a0a:	83 ec 0c             	sub    $0xc,%esp
c0101a0d:	6a 7c                	push   $0x7c
c0101a0f:	e8 b8 fd ff ff       	call   c01017cc <sys_malloc>
c0101a14:	83 c4 10             	add    $0x10,%esp
c0101a17:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101a1a:	83 ec 04             	sub    $0x4,%esp
c0101a1d:	6a 7c                	push   $0x7c
c0101a1f:	6a 00                	push   $0x0
c0101a21:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a24:	e8 86 a7 00 00       	call   c010c1af <Memset>
c0101a29:	83 c4 10             	add    $0x10,%esp
c0101a2c:	8b 55 18             	mov    0x18(%ebp),%edx
c0101a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a32:	89 50 78             	mov    %edx,0x78(%eax)
c0101a35:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a3b:	89 50 14             	mov    %edx,0x14(%eax)
c0101a3e:	8b 55 10             	mov    0x10(%ebp),%edx
c0101a41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a44:	89 50 10             	mov    %edx,0x10(%eax)
c0101a47:	8b 55 14             	mov    0x14(%ebp),%edx
c0101a4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a4d:	89 50 0c             	mov    %edx,0xc(%eax)
c0101a50:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a53:	c1 e0 09             	shl    $0x9,%eax
c0101a56:	89 c2                	mov    %eax,%edx
c0101a58:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a5b:	89 50 18             	mov    %edx,0x18(%eax)
c0101a5e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101a62:	74 22                	je     c0101a86 <rd_wt+0x82>
c0101a64:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101a68:	74 1c                	je     c0101a86 <rd_wt+0x82>
c0101a6a:	68 b1 00 00 00       	push   $0xb1
c0101a6f:	68 d8 b2 10 c0       	push   $0xc010b2d8
c0101a74:	68 d8 b2 10 c0       	push   $0xc010b2d8
c0101a79:	68 5e b3 10 c0       	push   $0xc010b35e
c0101a7e:	e8 12 70 00 00       	call   c0108a95 <assertion_failure>
c0101a83:	83 c4 10             	add    $0x10,%esp
c0101a86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a89:	8b 40 78             	mov    0x78(%eax),%eax
c0101a8c:	83 f8 07             	cmp    $0x7,%eax
c0101a8f:	74 27                	je     c0101ab8 <rd_wt+0xb4>
c0101a91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a94:	8b 40 78             	mov    0x78(%eax),%eax
c0101a97:	83 f8 0a             	cmp    $0xa,%eax
c0101a9a:	74 1c                	je     c0101ab8 <rd_wt+0xb4>
c0101a9c:	68 b2 00 00 00       	push   $0xb2
c0101aa1:	68 d8 b2 10 c0       	push   $0xc010b2d8
c0101aa6:	68 d8 b2 10 c0       	push   $0xc010b2d8
c0101aab:	68 7c b3 10 c0       	push   $0xc010b37c
c0101ab0:	e8 e0 6f 00 00       	call   c0108a95 <assertion_failure>
c0101ab5:	83 c4 10             	add    $0x10,%esp
c0101ab8:	83 ec 04             	sub    $0x4,%esp
c0101abb:	6a 03                	push   $0x3
c0101abd:	ff 75 f4             	pushl  -0xc(%ebp)
c0101ac0:	6a 03                	push   $0x3
c0101ac2:	e8 3e 7c 00 00       	call   c0109705 <send_rec>
c0101ac7:	83 c4 10             	add    $0x10,%esp
c0101aca:	83 ec 08             	sub    $0x8,%esp
c0101acd:	6a 7c                	push   $0x7c
c0101acf:	ff 75 f4             	pushl  -0xc(%ebp)
c0101ad2:	e8 0a fd ff ff       	call   c01017e1 <sys_free>
c0101ad7:	83 c4 10             	add    $0x10,%esp
c0101ada:	90                   	nop
c0101adb:	c9                   	leave  
c0101adc:	c3                   	ret    

c0101add <mkfs>:
c0101add:	55                   	push   %ebp
c0101ade:	89 e5                	mov    %esp,%ebp
c0101ae0:	57                   	push   %edi
c0101ae1:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101ae7:	83 ec 0c             	sub    $0xc,%esp
c0101aea:	68 00 80 00 00       	push   $0x8000
c0101aef:	e8 d8 fc ff ff       	call   c01017cc <sys_malloc>
c0101af4:	83 c4 10             	add    $0x10,%esp
c0101af7:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c0101afc:	83 ec 0c             	sub    $0xc,%esp
c0101aff:	6a 24                	push   $0x24
c0101b01:	e8 c6 fc ff ff       	call   c01017cc <sys_malloc>
c0101b06:	83 c4 10             	add    $0x10,%esp
c0101b09:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c0101b0e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b13:	83 ec 0c             	sub    $0xc,%esp
c0101b16:	50                   	push   %eax
c0101b17:	e8 42 46 00 00       	call   c010615e <get_physical_address>
c0101b1c:	83 c4 10             	add    $0x10,%esp
c0101b1f:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101b24:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101b29:	83 ec 0c             	sub    $0xc,%esp
c0101b2c:	50                   	push   %eax
c0101b2d:	e8 2c 46 00 00       	call   c010615e <get_physical_address>
c0101b32:	83 c4 10             	add    $0x10,%esp
c0101b35:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c0101b3a:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b3f:	83 ec 04             	sub    $0x4,%esp
c0101b42:	68 00 02 00 00       	push   $0x200
c0101b47:	6a 00                	push   $0x0
c0101b49:	50                   	push   %eax
c0101b4a:	e8 60 a6 00 00       	call   c010c1af <Memset>
c0101b4f:	83 c4 10             	add    $0x10,%esp
c0101b52:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b57:	83 ec 0c             	sub    $0xc,%esp
c0101b5a:	6a 0a                	push   $0xa
c0101b5c:	68 00 02 00 00       	push   $0x200
c0101b61:	50                   	push   %eax
c0101b62:	6a 20                	push   $0x20
c0101b64:	6a 00                	push   $0x0
c0101b66:	e8 99 fe ff ff       	call   c0101a04 <rd_wt>
c0101b6b:	83 c4 20             	add    $0x20,%esp
c0101b6e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b73:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101b76:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101b79:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101b80:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101b83:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0101b8a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101b8d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101b94:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101b97:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101b9e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ba1:	8b 40 04             	mov    0x4(%eax),%eax
c0101ba4:	8d 50 02             	lea    0x2(%eax),%edx
c0101ba7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101baa:	8b 40 08             	mov    0x8(%eax),%eax
c0101bad:	01 c2                	add    %eax,%edx
c0101baf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101bb2:	8b 40 0c             	mov    0xc(%eax),%eax
c0101bb5:	01 c2                	add    %eax,%edx
c0101bb7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101bba:	89 10                	mov    %edx,(%eax)
c0101bbc:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101bc3:	b8 00 02 00 00       	mov    $0x200,%eax
c0101bc8:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101bcb:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101bd1:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101bd4:	01 ca                	add    %ecx,%edx
c0101bd6:	83 ec 04             	sub    $0x4,%esp
c0101bd9:	50                   	push   %eax
c0101bda:	6a 80                	push   $0xffffff80
c0101bdc:	52                   	push   %edx
c0101bdd:	e8 cd a5 00 00       	call   c010c1af <Memset>
c0101be2:	83 c4 10             	add    $0x10,%esp
c0101be5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101bea:	83 ec 0c             	sub    $0xc,%esp
c0101bed:	6a 0a                	push   $0xa
c0101bef:	68 00 02 00 00       	push   $0x200
c0101bf4:	50                   	push   %eax
c0101bf5:	6a 20                	push   $0x20
c0101bf7:	6a 01                	push   $0x1
c0101bf9:	e8 06 fe ff ff       	call   c0101a04 <rd_wt>
c0101bfe:	83 c4 20             	add    $0x20,%esp
c0101c01:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c04:	8b 10                	mov    (%eax),%edx
c0101c06:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101c09:	8b 50 04             	mov    0x4(%eax),%edx
c0101c0c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101c0f:	8b 50 08             	mov    0x8(%eax),%edx
c0101c12:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101c15:	8b 50 0c             	mov    0xc(%eax),%edx
c0101c18:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101c1b:	8b 50 10             	mov    0x10(%eax),%edx
c0101c1e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101c21:	8b 50 14             	mov    0x14(%eax),%edx
c0101c24:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101c27:	8b 50 18             	mov    0x18(%eax),%edx
c0101c2a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101c2d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101c30:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101c33:	8b 40 20             	mov    0x20(%eax),%eax
c0101c36:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101c39:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101c3d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101c41:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c46:	83 ec 04             	sub    $0x4,%esp
c0101c49:	6a 01                	push   $0x1
c0101c4b:	52                   	push   %edx
c0101c4c:	50                   	push   %eax
c0101c4d:	e8 5d a5 00 00       	call   c010c1af <Memset>
c0101c52:	83 c4 10             	add    $0x10,%esp
c0101c55:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c5a:	83 c0 01             	add    $0x1,%eax
c0101c5d:	83 ec 04             	sub    $0x4,%esp
c0101c60:	68 ff 01 00 00       	push   $0x1ff
c0101c65:	6a 80                	push   $0xffffff80
c0101c67:	50                   	push   %eax
c0101c68:	e8 42 a5 00 00       	call   c010c1af <Memset>
c0101c6d:	83 c4 10             	add    $0x10,%esp
c0101c70:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c75:	83 ec 0c             	sub    $0xc,%esp
c0101c78:	6a 0a                	push   $0xa
c0101c7a:	68 00 02 00 00       	push   $0x200
c0101c7f:	50                   	push   %eax
c0101c80:	6a 20                	push   $0x20
c0101c82:	6a 02                	push   $0x2
c0101c84:	e8 7b fd ff ff       	call   c0101a04 <rd_wt>
c0101c89:	83 c4 20             	add    $0x20,%esp
c0101c8c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101c93:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c98:	83 ec 04             	sub    $0x4,%esp
c0101c9b:	68 00 02 00 00       	push   $0x200
c0101ca0:	6a ff                	push   $0xffffffff
c0101ca2:	50                   	push   %eax
c0101ca3:	e8 07 a5 00 00       	call   c010c1af <Memset>
c0101ca8:	83 c4 10             	add    $0x10,%esp
c0101cab:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101cb0:	83 ec 0c             	sub    $0xc,%esp
c0101cb3:	6a 0a                	push   $0xa
c0101cb5:	68 00 02 00 00       	push   $0x200
c0101cba:	50                   	push   %eax
c0101cbb:	6a 20                	push   $0x20
c0101cbd:	ff 75 d0             	pushl  -0x30(%ebp)
c0101cc0:	e8 3f fd ff ff       	call   c0101a04 <rd_wt>
c0101cc5:	83 c4 20             	add    $0x20,%esp
c0101cc8:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ccd:	83 ec 04             	sub    $0x4,%esp
c0101cd0:	6a 01                	push   $0x1
c0101cd2:	6a 01                	push   $0x1
c0101cd4:	50                   	push   %eax
c0101cd5:	e8 d5 a4 00 00       	call   c010c1af <Memset>
c0101cda:	83 c4 10             	add    $0x10,%esp
c0101cdd:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ce2:	83 c0 01             	add    $0x1,%eax
c0101ce5:	83 ec 04             	sub    $0x4,%esp
c0101ce8:	68 ff 01 00 00       	push   $0x1ff
c0101ced:	6a 00                	push   $0x0
c0101cef:	50                   	push   %eax
c0101cf0:	e8 ba a4 00 00       	call   c010c1af <Memset>
c0101cf5:	83 c4 10             	add    $0x10,%esp
c0101cf8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101cfd:	89 c2                	mov    %eax,%edx
c0101cff:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101d02:	83 c0 01             	add    $0x1,%eax
c0101d05:	83 ec 0c             	sub    $0xc,%esp
c0101d08:	6a 0a                	push   $0xa
c0101d0a:	68 00 02 00 00       	push   $0x200
c0101d0f:	52                   	push   %edx
c0101d10:	6a 20                	push   $0x20
c0101d12:	50                   	push   %eax
c0101d13:	e8 ec fc ff ff       	call   c0101a04 <rd_wt>
c0101d18:	83 c4 20             	add    $0x20,%esp
c0101d1b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101d1e:	83 e8 02             	sub    $0x2,%eax
c0101d21:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101d24:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101d2b:	eb 04                	jmp    c0101d31 <mkfs+0x254>
c0101d2d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101d31:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101d34:	83 c0 01             	add    $0x1,%eax
c0101d37:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101d3a:	7e f1                	jle    c0101d2d <mkfs+0x250>
c0101d3c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d41:	89 c2                	mov    %eax,%edx
c0101d43:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101d46:	83 c0 03             	add    $0x3,%eax
c0101d49:	83 ec 0c             	sub    $0xc,%esp
c0101d4c:	6a 0a                	push   $0xa
c0101d4e:	68 00 02 00 00       	push   $0x200
c0101d53:	52                   	push   %edx
c0101d54:	6a 20                	push   $0x20
c0101d56:	50                   	push   %eax
c0101d57:	e8 a8 fc ff ff       	call   c0101a04 <rd_wt>
c0101d5c:	83 c4 20             	add    $0x20,%esp
c0101d5f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d64:	89 c2                	mov    %eax,%edx
c0101d66:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101d69:	83 c0 03             	add    $0x3,%eax
c0101d6c:	83 ec 0c             	sub    $0xc,%esp
c0101d6f:	6a 07                	push   $0x7
c0101d71:	68 00 02 00 00       	push   $0x200
c0101d76:	52                   	push   %edx
c0101d77:	6a 20                	push   $0x20
c0101d79:	50                   	push   %eax
c0101d7a:	e8 85 fc ff ff       	call   c0101a04 <rd_wt>
c0101d7f:	83 c4 20             	add    $0x20,%esp
c0101d82:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d87:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101d8a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d8d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101d93:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d96:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101d9d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101da0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101da3:	89 50 08             	mov    %edx,0x8(%eax)
c0101da6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101da9:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101db0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101db3:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101dba:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101dbd:	8b 10                	mov    (%eax),%edx
c0101dbf:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101dc5:	8b 50 04             	mov    0x4(%eax),%edx
c0101dc8:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101dce:	8b 50 08             	mov    0x8(%eax),%edx
c0101dd1:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101dd7:	8b 50 0c             	mov    0xc(%eax),%edx
c0101dda:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101de0:	8b 50 10             	mov    0x10(%eax),%edx
c0101de3:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101de9:	8b 50 14             	mov    0x14(%eax),%edx
c0101dec:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101df2:	8b 50 18             	mov    0x18(%eax),%edx
c0101df5:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101dfb:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101dfe:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101e04:	8b 50 20             	mov    0x20(%eax),%edx
c0101e07:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101e0d:	8b 40 24             	mov    0x24(%eax),%eax
c0101e10:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101e15:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101e1c:	eb 4c                	jmp    c0101e6a <mkfs+0x38d>
c0101e1e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101e23:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101e26:	83 c2 01             	add    $0x1,%edx
c0101e29:	c1 e2 05             	shl    $0x5,%edx
c0101e2c:	01 d0                	add    %edx,%eax
c0101e2e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101e31:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e34:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101e3a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e3d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101e44:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e47:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101e4e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101e55:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101e58:	c1 e0 08             	shl    $0x8,%eax
c0101e5b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101e5e:	89 c2                	mov    %eax,%edx
c0101e60:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e63:	89 50 08             	mov    %edx,0x8(%eax)
c0101e66:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101e6a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101e6e:	7e ae                	jle    c0101e1e <mkfs+0x341>
c0101e70:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101e77:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101e7d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101e82:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101e87:	89 d7                	mov    %edx,%edi
c0101e89:	f3 ab                	rep stos %eax,%es:(%edi)
c0101e8b:	c7 85 70 ff ff ff a4 	movl   $0xc010b3a4,-0x90(%ebp)
c0101e92:	b3 10 c0 
c0101e95:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101e9c:	eb 54                	jmp    c0101ef2 <mkfs+0x415>
c0101e9e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ea3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101ea6:	83 c2 04             	add    $0x4,%edx
c0101ea9:	c1 e2 05             	shl    $0x5,%edx
c0101eac:	01 d0                	add    %edx,%eax
c0101eae:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101eb1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101eb4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101eba:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ebd:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101ec4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101ec7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101eca:	83 c2 01             	add    $0x1,%edx
c0101ecd:	c1 e2 0b             	shl    $0xb,%edx
c0101ed0:	01 c2                	add    %eax,%edx
c0101ed2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ed5:	89 50 08             	mov    %edx,0x8(%eax)
c0101ed8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101edb:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101ee2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101ee5:	8d 50 05             	lea    0x5(%eax),%edx
c0101ee8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101eeb:	89 50 10             	mov    %edx,0x10(%eax)
c0101eee:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101ef2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101ef5:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101ef8:	7c a4                	jl     c0101e9e <mkfs+0x3c1>
c0101efa:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101eff:	89 c2                	mov    %eax,%edx
c0101f01:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101f04:	83 c0 03             	add    $0x3,%eax
c0101f07:	83 ec 0c             	sub    $0xc,%esp
c0101f0a:	6a 0a                	push   $0xa
c0101f0c:	68 00 02 00 00       	push   $0x200
c0101f11:	52                   	push   %edx
c0101f12:	6a 20                	push   $0x20
c0101f14:	50                   	push   %eax
c0101f15:	e8 ea fa ff ff       	call   c0101a04 <rd_wt>
c0101f1a:	83 c4 20             	add    $0x20,%esp
c0101f1d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101f22:	89 c2                	mov    %eax,%edx
c0101f24:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101f27:	83 ec 0c             	sub    $0xc,%esp
c0101f2a:	6a 07                	push   $0x7
c0101f2c:	68 00 02 00 00       	push   $0x200
c0101f31:	52                   	push   %edx
c0101f32:	6a 20                	push   $0x20
c0101f34:	50                   	push   %eax
c0101f35:	e8 ca fa ff ff       	call   c0101a04 <rd_wt>
c0101f3a:	83 c4 20             	add    $0x20,%esp
c0101f3d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101f44:	00 00 00 
c0101f47:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101f4e:	2e 00 
c0101f50:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101f55:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101f58:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f5b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101f61:	83 ec 0c             	sub    $0xc,%esp
c0101f64:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101f6a:	50                   	push   %eax
c0101f6b:	e8 78 a2 00 00       	call   c010c1e8 <Strlen>
c0101f70:	83 c4 10             	add    $0x10,%esp
c0101f73:	89 c1                	mov    %eax,%ecx
c0101f75:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f78:	8d 50 04             	lea    0x4(%eax),%edx
c0101f7b:	83 ec 04             	sub    $0x4,%esp
c0101f7e:	51                   	push   %ecx
c0101f7f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101f85:	50                   	push   %eax
c0101f86:	52                   	push   %edx
c0101f87:	e8 f0 4e 00 00       	call   c0106e7c <Memcpy>
c0101f8c:	83 c4 10             	add    $0x10,%esp
c0101f8f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101f95:	b8 00 00 00 00       	mov    $0x0,%eax
c0101f9a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101f9f:	89 d7                	mov    %edx,%edi
c0101fa1:	f3 ab                	rep stos %eax,%es:(%edi)
c0101fa3:	c7 85 34 ff ff ff b0 	movl   $0xc010b3b0,-0xcc(%ebp)
c0101faa:	b3 10 c0 
c0101fad:	c7 85 38 ff ff ff b9 	movl   $0xc010b3b9,-0xc8(%ebp)
c0101fb4:	b3 10 c0 
c0101fb7:	c7 85 3c ff ff ff c2 	movl   $0xc010b3c2,-0xc4(%ebp)
c0101fbe:	b3 10 c0 
c0101fc1:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101fc8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101fcf:	eb 49                	jmp    c010201a <mkfs+0x53d>
c0101fd1:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101fd5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101fd8:	8d 50 02             	lea    0x2(%eax),%edx
c0101fdb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101fde:	89 10                	mov    %edx,(%eax)
c0101fe0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101fe3:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101fea:	83 ec 0c             	sub    $0xc,%esp
c0101fed:	50                   	push   %eax
c0101fee:	e8 f5 a1 00 00       	call   c010c1e8 <Strlen>
c0101ff3:	83 c4 10             	add    $0x10,%esp
c0101ff6:	89 c1                	mov    %eax,%ecx
c0101ff8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101ffb:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0102002:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102005:	83 c2 04             	add    $0x4,%edx
c0102008:	83 ec 04             	sub    $0x4,%esp
c010200b:	51                   	push   %ecx
c010200c:	50                   	push   %eax
c010200d:	52                   	push   %edx
c010200e:	e8 69 4e 00 00       	call   c0106e7c <Memcpy>
c0102013:	83 c4 10             	add    $0x10,%esp
c0102016:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010201a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010201d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0102020:	7c af                	jl     c0101fd1 <mkfs+0x4f4>
c0102022:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102029:	eb 66                	jmp    c0102091 <mkfs+0x5b4>
c010202b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010202e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0102035:	83 ec 0c             	sub    $0xc,%esp
c0102038:	50                   	push   %eax
c0102039:	e8 aa a1 00 00       	call   c010c1e8 <Strlen>
c010203e:	83 c4 10             	add    $0x10,%esp
c0102041:	85 c0                	test   %eax,%eax
c0102043:	74 47                	je     c010208c <mkfs+0x5af>
c0102045:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0102049:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010204c:	8d 50 05             	lea    0x5(%eax),%edx
c010204f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102052:	89 10                	mov    %edx,(%eax)
c0102054:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102057:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c010205e:	83 ec 0c             	sub    $0xc,%esp
c0102061:	50                   	push   %eax
c0102062:	e8 81 a1 00 00       	call   c010c1e8 <Strlen>
c0102067:	83 c4 10             	add    $0x10,%esp
c010206a:	89 c1                	mov    %eax,%ecx
c010206c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010206f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0102076:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102079:	83 c2 04             	add    $0x4,%edx
c010207c:	83 ec 04             	sub    $0x4,%esp
c010207f:	51                   	push   %ecx
c0102080:	50                   	push   %eax
c0102081:	52                   	push   %edx
c0102082:	e8 f5 4d 00 00       	call   c0106e7c <Memcpy>
c0102087:	83 c4 10             	add    $0x10,%esp
c010208a:	eb 01                	jmp    c010208d <mkfs+0x5b0>
c010208c:	90                   	nop
c010208d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0102091:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102094:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0102097:	7c 92                	jl     c010202b <mkfs+0x54e>
c0102099:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010209e:	89 c2                	mov    %eax,%edx
c01020a0:	8b 45 98             	mov    -0x68(%ebp),%eax
c01020a3:	83 ec 0c             	sub    $0xc,%esp
c01020a6:	6a 0a                	push   $0xa
c01020a8:	68 00 02 00 00       	push   $0x200
c01020ad:	52                   	push   %edx
c01020ae:	6a 20                	push   $0x20
c01020b0:	50                   	push   %eax
c01020b1:	e8 4e f9 ff ff       	call   c0101a04 <rd_wt>
c01020b6:	83 c4 20             	add    $0x20,%esp
c01020b9:	90                   	nop
c01020ba:	8b 7d fc             	mov    -0x4(%ebp),%edi
c01020bd:	c9                   	leave  
c01020be:	c3                   	ret    

c01020bf <init_fs>:
c01020bf:	55                   	push   %ebp
c01020c0:	89 e5                	mov    %esp,%ebp
c01020c2:	83 ec 18             	sub    $0x18,%esp
c01020c5:	83 ec 0c             	sub    $0xc,%esp
c01020c8:	6a 7c                	push   $0x7c
c01020ca:	e8 fd f6 ff ff       	call   c01017cc <sys_malloc>
c01020cf:	83 c4 10             	add    $0x10,%esp
c01020d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01020d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020d8:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c01020df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020e2:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c01020e9:	83 ec 04             	sub    $0x4,%esp
c01020ec:	6a 03                	push   $0x3
c01020ee:	ff 75 f4             	pushl  -0xc(%ebp)
c01020f1:	6a 03                	push   $0x3
c01020f3:	e8 0d 76 00 00       	call   c0109705 <send_rec>
c01020f8:	83 c4 10             	add    $0x10,%esp
c01020fb:	e8 dd f9 ff ff       	call   c0101add <mkfs>
c0102100:	83 ec 08             	sub    $0x8,%esp
c0102103:	6a 7c                	push   $0x7c
c0102105:	ff 75 f4             	pushl  -0xc(%ebp)
c0102108:	e8 d4 f6 ff ff       	call   c01017e1 <sys_free>
c010210d:	83 c4 10             	add    $0x10,%esp
c0102110:	90                   	nop
c0102111:	c9                   	leave  
c0102112:	c3                   	ret    

c0102113 <do_open>:
c0102113:	55                   	push   %ebp
c0102114:	89 e5                	mov    %esp,%ebp
c0102116:	83 ec 68             	sub    $0x68,%esp
c0102119:	83 ec 04             	sub    $0x4,%esp
c010211c:	6a 0c                	push   $0xc
c010211e:	6a 00                	push   $0x0
c0102120:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102123:	50                   	push   %eax
c0102124:	e8 86 a0 00 00       	call   c010c1af <Memset>
c0102129:	83 c4 10             	add    $0x10,%esp
c010212c:	8b 45 08             	mov    0x8(%ebp),%eax
c010212f:	8b 40 44             	mov    0x44(%eax),%eax
c0102132:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102135:	83 ec 08             	sub    $0x8,%esp
c0102138:	6a 0c                	push   $0xc
c010213a:	ff 75 e4             	pushl  -0x1c(%ebp)
c010213d:	e8 cd 3e 00 00       	call   c010600f <alloc_virtual_memory>
c0102142:	83 c4 10             	add    $0x10,%esp
c0102145:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102148:	8b 45 08             	mov    0x8(%ebp),%eax
c010214b:	8b 40 40             	mov    0x40(%eax),%eax
c010214e:	89 c2                	mov    %eax,%edx
c0102150:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102153:	83 ec 04             	sub    $0x4,%esp
c0102156:	52                   	push   %edx
c0102157:	50                   	push   %eax
c0102158:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010215b:	50                   	push   %eax
c010215c:	e8 1b 4d 00 00       	call   c0106e7c <Memcpy>
c0102161:	83 c4 10             	add    $0x10,%esp
c0102164:	8b 45 08             	mov    0x8(%ebp),%eax
c0102167:	8b 40 40             	mov    0x40(%eax),%eax
c010216a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c010216f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102172:	8b 40 74             	mov    0x74(%eax),%eax
c0102175:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102178:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c010217f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102186:	eb 1f                	jmp    c01021a7 <do_open+0x94>
c0102188:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010218d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102190:	83 c2 4c             	add    $0x4c,%edx
c0102193:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0102197:	85 c0                	test   %eax,%eax
c0102199:	75 08                	jne    c01021a3 <do_open+0x90>
c010219b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010219e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01021a1:	eb 0a                	jmp    c01021ad <do_open+0x9a>
c01021a3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01021a7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01021ab:	7e db                	jle    c0102188 <do_open+0x75>
c01021ad:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c01021b1:	75 1c                	jne    c01021cf <do_open+0xbc>
c01021b3:	68 c6 01 00 00       	push   $0x1c6
c01021b8:	68 d8 b2 10 c0       	push   $0xc010b2d8
c01021bd:	68 d8 b2 10 c0       	push   $0xc010b2d8
c01021c2:	68 cb b3 10 c0       	push   $0xc010b3cb
c01021c7:	e8 c9 68 00 00       	call   c0108a95 <assertion_failure>
c01021cc:	83 c4 10             	add    $0x10,%esp
c01021cf:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c01021d6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01021dd:	eb 1d                	jmp    c01021fc <do_open+0xe9>
c01021df:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021e2:	c1 e0 04             	shl    $0x4,%eax
c01021e5:	05 88 13 11 c0       	add    $0xc0111388,%eax
c01021ea:	8b 00                	mov    (%eax),%eax
c01021ec:	85 c0                	test   %eax,%eax
c01021ee:	75 08                	jne    c01021f8 <do_open+0xe5>
c01021f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01021f6:	eb 0a                	jmp    c0102202 <do_open+0xef>
c01021f8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01021fc:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0102200:	7e dd                	jle    c01021df <do_open+0xcc>
c0102202:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0102206:	75 1c                	jne    c0102224 <do_open+0x111>
c0102208:	68 d2 01 00 00       	push   $0x1d2
c010220d:	68 d8 b2 10 c0       	push   $0xc010b2d8
c0102212:	68 d8 b2 10 c0       	push   $0xc010b2d8
c0102217:	68 d3 b3 10 c0       	push   $0xc010b3d3
c010221c:	e8 74 68 00 00       	call   c0108a95 <assertion_failure>
c0102221:	83 c4 10             	add    $0x10,%esp
c0102224:	83 ec 0c             	sub    $0xc,%esp
c0102227:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010222a:	50                   	push   %eax
c010222b:	e8 d2 00 00 00       	call   c0102302 <search_file>
c0102230:	83 c4 10             	add    $0x10,%esp
c0102233:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102236:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010223a:	75 2b                	jne    c0102267 <do_open+0x154>
c010223c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0102240:	7e 10                	jle    c0102252 <do_open+0x13f>
c0102242:	83 ec 0c             	sub    $0xc,%esp
c0102245:	68 db b3 10 c0       	push   $0xc010b3db
c010224a:	e8 28 68 00 00       	call   c0108a77 <panic>
c010224f:	83 c4 10             	add    $0x10,%esp
c0102252:	83 ec 08             	sub    $0x8,%esp
c0102255:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102258:	50                   	push   %eax
c0102259:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010225c:	50                   	push   %eax
c010225d:	e8 60 04 00 00       	call   c01026c2 <create_file>
c0102262:	83 c4 10             	add    $0x10,%esp
c0102265:	eb 25                	jmp    c010228c <do_open+0x179>
c0102267:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010226b:	75 0a                	jne    c0102277 <do_open+0x164>
c010226d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102272:	e9 89 00 00 00       	jmp    c0102300 <do_open+0x1ed>
c0102277:	83 ec 08             	sub    $0x8,%esp
c010227a:	ff 75 d8             	pushl  -0x28(%ebp)
c010227d:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0102280:	50                   	push   %eax
c0102281:	e8 7a 02 00 00       	call   c0102500 <get_inode>
c0102286:	83 c4 10             	add    $0x10,%esp
c0102289:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010228c:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0102291:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102294:	c1 e2 04             	shl    $0x4,%edx
c0102297:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010229d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01022a0:	83 c2 4c             	add    $0x4c,%edx
c01022a3:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c01022a7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01022aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01022ad:	c1 e2 04             	shl    $0x4,%edx
c01022b0:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c01022b6:	89 02                	mov    %eax,(%edx)
c01022b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022bb:	c1 e0 04             	shl    $0x4,%eax
c01022be:	05 84 13 11 c0       	add    $0xc0111384,%eax
c01022c3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01022c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022cc:	c1 e0 04             	shl    $0x4,%eax
c01022cf:	05 80 13 11 c0       	add    $0xc0111380,%eax
c01022d4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01022da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022dd:	c1 e0 04             	shl    $0x4,%eax
c01022e0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01022e5:	8b 00                	mov    (%eax),%eax
c01022e7:	8d 50 01             	lea    0x1(%eax),%edx
c01022ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022ed:	c1 e0 04             	shl    $0x4,%eax
c01022f0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01022f5:	89 10                	mov    %edx,(%eax)
c01022f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01022fa:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01022fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102300:	c9                   	leave  
c0102301:	c3                   	ret    

c0102302 <search_file>:
c0102302:	55                   	push   %ebp
c0102303:	89 e5                	mov    %esp,%ebp
c0102305:	83 ec 68             	sub    $0x68,%esp
c0102308:	83 ec 04             	sub    $0x4,%esp
c010230b:	6a 0c                	push   $0xc
c010230d:	6a 00                	push   $0x0
c010230f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102312:	50                   	push   %eax
c0102313:	e8 97 9e 00 00       	call   c010c1af <Memset>
c0102318:	83 c4 10             	add    $0x10,%esp
c010231b:	83 ec 04             	sub    $0x4,%esp
c010231e:	6a 28                	push   $0x28
c0102320:	6a 00                	push   $0x0
c0102322:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102325:	50                   	push   %eax
c0102326:	e8 84 9e 00 00       	call   c010c1af <Memset>
c010232b:	83 c4 10             	add    $0x10,%esp
c010232e:	83 ec 04             	sub    $0x4,%esp
c0102331:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102334:	50                   	push   %eax
c0102335:	ff 75 08             	pushl  0x8(%ebp)
c0102338:	8d 45 c0             	lea    -0x40(%ebp),%eax
c010233b:	50                   	push   %eax
c010233c:	e8 f3 00 00 00       	call   c0102434 <strip_path>
c0102341:	83 c4 10             	add    $0x10,%esp
c0102344:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102347:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c010234b:	75 0a                	jne    c0102357 <search_file+0x55>
c010234d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102352:	e9 db 00 00 00       	jmp    c0102432 <search_file+0x130>
c0102357:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010235a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010235d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102360:	05 00 02 00 00       	add    $0x200,%eax
c0102365:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010236b:	85 c0                	test   %eax,%eax
c010236d:	0f 48 c2             	cmovs  %edx,%eax
c0102370:	c1 f8 09             	sar    $0x9,%eax
c0102373:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102376:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102379:	c1 e8 04             	shr    $0x4,%eax
c010237c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010237f:	e8 5c 14 00 00       	call   c01037e0 <get_super_block>
c0102384:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102387:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010238a:	8b 00                	mov    (%eax),%eax
c010238c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010238f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102396:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010239d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01023a4:	eb 7b                	jmp    c0102421 <search_file+0x11f>
c01023a6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01023ab:	89 c1                	mov    %eax,%ecx
c01023ad:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01023b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023b3:	01 d0                	add    %edx,%eax
c01023b5:	83 ec 0c             	sub    $0xc,%esp
c01023b8:	6a 07                	push   $0x7
c01023ba:	68 00 02 00 00       	push   $0x200
c01023bf:	51                   	push   %ecx
c01023c0:	ff 75 cc             	pushl  -0x34(%ebp)
c01023c3:	50                   	push   %eax
c01023c4:	e8 3b f6 ff ff       	call   c0101a04 <rd_wt>
c01023c9:	83 c4 20             	add    $0x20,%esp
c01023cc:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01023d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01023d4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01023db:	eb 35                	jmp    c0102412 <search_file+0x110>
c01023dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01023e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023e4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01023e7:	7f 33                	jg     c010241c <search_file+0x11a>
c01023e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023ec:	83 c0 04             	add    $0x4,%eax
c01023ef:	83 ec 08             	sub    $0x8,%esp
c01023f2:	50                   	push   %eax
c01023f3:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01023f6:	50                   	push   %eax
c01023f7:	e8 70 76 00 00       	call   c0109a6c <strcmp>
c01023fc:	83 c4 10             	add    $0x10,%esp
c01023ff:	85 c0                	test   %eax,%eax
c0102401:	75 07                	jne    c010240a <search_file+0x108>
c0102403:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102406:	8b 00                	mov    (%eax),%eax
c0102408:	eb 28                	jmp    c0102432 <search_file+0x130>
c010240a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010240e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0102412:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102415:	83 f8 1f             	cmp    $0x1f,%eax
c0102418:	76 c3                	jbe    c01023dd <search_file+0xdb>
c010241a:	eb 01                	jmp    c010241d <search_file+0x11b>
c010241c:	90                   	nop
c010241d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102421:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102424:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102427:	0f 8c 79 ff ff ff    	jl     c01023a6 <search_file+0xa4>
c010242d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102432:	c9                   	leave  
c0102433:	c3                   	ret    

c0102434 <strip_path>:
c0102434:	55                   	push   %ebp
c0102435:	89 e5                	mov    %esp,%ebp
c0102437:	83 ec 10             	sub    $0x10,%esp
c010243a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010243e:	75 0a                	jne    c010244a <strip_path+0x16>
c0102440:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102445:	e9 b4 00 00 00       	jmp    c01024fe <strip_path+0xca>
c010244a:	8b 45 08             	mov    0x8(%ebp),%eax
c010244d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102450:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102453:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102456:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102459:	0f b6 00             	movzbl (%eax),%eax
c010245c:	3c 2f                	cmp    $0x2f,%al
c010245e:	75 2d                	jne    c010248d <strip_path+0x59>
c0102460:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102464:	eb 27                	jmp    c010248d <strip_path+0x59>
c0102466:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102469:	0f b6 00             	movzbl (%eax),%eax
c010246c:	3c 2f                	cmp    $0x2f,%al
c010246e:	75 0a                	jne    c010247a <strip_path+0x46>
c0102470:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102475:	e9 84 00 00 00       	jmp    c01024fe <strip_path+0xca>
c010247a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010247d:	0f b6 10             	movzbl (%eax),%edx
c0102480:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102483:	88 10                	mov    %dl,(%eax)
c0102485:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102489:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010248d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102490:	0f b6 00             	movzbl (%eax),%eax
c0102493:	84 c0                	test   %al,%al
c0102495:	75 cf                	jne    c0102466 <strip_path+0x32>
c0102497:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010249a:	c6 00 00             	movb   $0x0,(%eax)
c010249d:	8b 45 10             	mov    0x10(%ebp),%eax
c01024a0:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c01024a6:	89 10                	mov    %edx,(%eax)
c01024a8:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c01024ae:	89 50 04             	mov    %edx,0x4(%eax)
c01024b1:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c01024b7:	89 50 08             	mov    %edx,0x8(%eax)
c01024ba:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c01024c0:	89 50 0c             	mov    %edx,0xc(%eax)
c01024c3:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c01024c9:	89 50 10             	mov    %edx,0x10(%eax)
c01024cc:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c01024d2:	89 50 14             	mov    %edx,0x14(%eax)
c01024d5:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c01024db:	89 50 18             	mov    %edx,0x18(%eax)
c01024de:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c01024e4:	89 50 1c             	mov    %edx,0x1c(%eax)
c01024e7:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c01024ed:	89 50 20             	mov    %edx,0x20(%eax)
c01024f0:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c01024f6:	89 50 24             	mov    %edx,0x24(%eax)
c01024f9:	b8 00 00 00 00       	mov    $0x0,%eax
c01024fe:	c9                   	leave  
c01024ff:	c3                   	ret    

c0102500 <get_inode>:
c0102500:	55                   	push   %ebp
c0102501:	89 e5                	mov    %esp,%ebp
c0102503:	56                   	push   %esi
c0102504:	53                   	push   %ebx
c0102505:	83 ec 20             	sub    $0x20,%esp
c0102508:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010250c:	75 0a                	jne    c0102518 <get_inode+0x18>
c010250e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102513:	e9 a3 01 00 00       	jmp    c01026bb <get_inode+0x1bb>
c0102518:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010251f:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102526:	eb 69                	jmp    c0102591 <get_inode+0x91>
c0102528:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010252b:	8b 40 24             	mov    0x24(%eax),%eax
c010252e:	85 c0                	test   %eax,%eax
c0102530:	7e 53                	jle    c0102585 <get_inode+0x85>
c0102532:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102535:	8b 40 10             	mov    0x10(%eax),%eax
c0102538:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010253b:	75 50                	jne    c010258d <get_inode+0x8d>
c010253d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102540:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102543:	8b 0a                	mov    (%edx),%ecx
c0102545:	89 08                	mov    %ecx,(%eax)
c0102547:	8b 4a 04             	mov    0x4(%edx),%ecx
c010254a:	89 48 04             	mov    %ecx,0x4(%eax)
c010254d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102550:	89 48 08             	mov    %ecx,0x8(%eax)
c0102553:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102556:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102559:	8b 4a 10             	mov    0x10(%edx),%ecx
c010255c:	89 48 10             	mov    %ecx,0x10(%eax)
c010255f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102562:	89 48 14             	mov    %ecx,0x14(%eax)
c0102565:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102568:	89 48 18             	mov    %ecx,0x18(%eax)
c010256b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010256e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102571:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102574:	89 48 20             	mov    %ecx,0x20(%eax)
c0102577:	8b 52 24             	mov    0x24(%edx),%edx
c010257a:	89 50 24             	mov    %edx,0x24(%eax)
c010257d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102580:	e9 36 01 00 00       	jmp    c01026bb <get_inode+0x1bb>
c0102585:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102588:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010258b:	eb 0d                	jmp    c010259a <get_inode+0x9a>
c010258d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102591:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102598:	76 8e                	jbe    c0102528 <get_inode+0x28>
c010259a:	e8 41 12 00 00       	call   c01037e0 <get_super_block>
c010259f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01025a2:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01025a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01025ac:	8b 40 04             	mov    0x4(%eax),%eax
c01025af:	8d 50 02             	lea    0x2(%eax),%edx
c01025b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01025b5:	8b 40 08             	mov    0x8(%eax),%eax
c01025b8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01025bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025be:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01025c1:	b8 00 02 00 00       	mov    $0x200,%eax
c01025c6:	99                   	cltd   
c01025c7:	f7 7d e8             	idivl  -0x18(%ebp)
c01025ca:	89 c6                	mov    %eax,%esi
c01025cc:	89 c8                	mov    %ecx,%eax
c01025ce:	99                   	cltd   
c01025cf:	f7 fe                	idiv   %esi
c01025d1:	01 d8                	add    %ebx,%eax
c01025d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01025d6:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c01025dd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01025e2:	83 ec 0c             	sub    $0xc,%esp
c01025e5:	6a 07                	push   $0x7
c01025e7:	68 00 02 00 00       	push   $0x200
c01025ec:	50                   	push   %eax
c01025ed:	ff 75 e0             	pushl  -0x20(%ebp)
c01025f0:	ff 75 e4             	pushl  -0x1c(%ebp)
c01025f3:	e8 0c f4 ff ff       	call   c0101a04 <rd_wt>
c01025f8:	83 c4 20             	add    $0x20,%esp
c01025fb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025fe:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102601:	b8 00 02 00 00       	mov    $0x200,%eax
c0102606:	99                   	cltd   
c0102607:	f7 7d e8             	idivl  -0x18(%ebp)
c010260a:	89 c3                	mov    %eax,%ebx
c010260c:	89 c8                	mov    %ecx,%eax
c010260e:	99                   	cltd   
c010260f:	f7 fb                	idiv   %ebx
c0102611:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0102614:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010261a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010261d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102621:	01 d0                	add    %edx,%eax
c0102623:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102626:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102629:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010262c:	8b 0a                	mov    (%edx),%ecx
c010262e:	89 08                	mov    %ecx,(%eax)
c0102630:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102633:	89 48 04             	mov    %ecx,0x4(%eax)
c0102636:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102639:	89 48 08             	mov    %ecx,0x8(%eax)
c010263c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010263f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102642:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102645:	89 48 10             	mov    %ecx,0x10(%eax)
c0102648:	8b 4a 14             	mov    0x14(%edx),%ecx
c010264b:	89 48 14             	mov    %ecx,0x14(%eax)
c010264e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102651:	89 48 18             	mov    %ecx,0x18(%eax)
c0102654:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102657:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010265a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010265d:	89 48 20             	mov    %ecx,0x20(%eax)
c0102660:	8b 52 24             	mov    0x24(%edx),%edx
c0102663:	89 50 24             	mov    %edx,0x24(%eax)
c0102666:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102669:	8b 55 0c             	mov    0xc(%ebp),%edx
c010266c:	89 50 10             	mov    %edx,0x10(%eax)
c010266f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102672:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102675:	89 50 20             	mov    %edx,0x20(%eax)
c0102678:	8b 45 08             	mov    0x8(%ebp),%eax
c010267b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010267e:	8b 0a                	mov    (%edx),%ecx
c0102680:	89 08                	mov    %ecx,(%eax)
c0102682:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102685:	89 48 04             	mov    %ecx,0x4(%eax)
c0102688:	8b 4a 08             	mov    0x8(%edx),%ecx
c010268b:	89 48 08             	mov    %ecx,0x8(%eax)
c010268e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102691:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102694:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102697:	89 48 10             	mov    %ecx,0x10(%eax)
c010269a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010269d:	89 48 14             	mov    %ecx,0x14(%eax)
c01026a0:	8b 4a 18             	mov    0x18(%edx),%ecx
c01026a3:	89 48 18             	mov    %ecx,0x18(%eax)
c01026a6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01026a9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01026ac:	8b 4a 20             	mov    0x20(%edx),%ecx
c01026af:	89 48 20             	mov    %ecx,0x20(%eax)
c01026b2:	8b 52 24             	mov    0x24(%edx),%edx
c01026b5:	89 50 24             	mov    %edx,0x24(%eax)
c01026b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01026bb:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01026be:	5b                   	pop    %ebx
c01026bf:	5e                   	pop    %esi
c01026c0:	5d                   	pop    %ebp
c01026c1:	c3                   	ret    

c01026c2 <create_file>:
c01026c2:	55                   	push   %ebp
c01026c3:	89 e5                	mov    %esp,%ebp
c01026c5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01026cb:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01026ce:	50                   	push   %eax
c01026cf:	ff 75 0c             	pushl  0xc(%ebp)
c01026d2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01026d5:	50                   	push   %eax
c01026d6:	e8 59 fd ff ff       	call   c0102434 <strip_path>
c01026db:	83 c4 0c             	add    $0xc,%esp
c01026de:	83 f8 ff             	cmp    $0xffffffff,%eax
c01026e1:	75 0a                	jne    c01026ed <create_file+0x2b>
c01026e3:	b8 00 00 00 00       	mov    $0x0,%eax
c01026e8:	e9 de 00 00 00       	jmp    c01027cb <create_file+0x109>
c01026ed:	e8 db 00 00 00       	call   c01027cd <alloc_imap_bit>
c01026f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01026f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01026f9:	75 0a                	jne    c0102705 <create_file+0x43>
c01026fb:	b8 00 00 00 00       	mov    $0x0,%eax
c0102700:	e9 c6 00 00 00       	jmp    c01027cb <create_file+0x109>
c0102705:	e8 d6 10 00 00       	call   c01037e0 <get_super_block>
c010270a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010270d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102710:	8b 40 10             	mov    0x10(%eax),%eax
c0102713:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102716:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102719:	83 ec 08             	sub    $0x8,%esp
c010271c:	50                   	push   %eax
c010271d:	ff 75 f4             	pushl  -0xc(%ebp)
c0102720:	e8 a5 01 00 00       	call   c01028ca <alloc_smap_bit>
c0102725:	83 c4 10             	add    $0x10,%esp
c0102728:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010272b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010272f:	75 0a                	jne    c010273b <create_file+0x79>
c0102731:	b8 00 00 00 00       	mov    $0x0,%eax
c0102736:	e9 90 00 00 00       	jmp    c01027cb <create_file+0x109>
c010273b:	83 ec 04             	sub    $0x4,%esp
c010273e:	ff 75 e8             	pushl  -0x18(%ebp)
c0102741:	ff 75 f4             	pushl  -0xc(%ebp)
c0102744:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0102747:	50                   	push   %eax
c0102748:	e8 1e 03 00 00       	call   c0102a6b <new_inode>
c010274d:	83 c4 10             	add    $0x10,%esp
c0102750:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102753:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102757:	75 07                	jne    c0102760 <create_file+0x9e>
c0102759:	b8 00 00 00 00       	mov    $0x0,%eax
c010275e:	eb 6b                	jmp    c01027cb <create_file+0x109>
c0102760:	ff 75 f4             	pushl  -0xc(%ebp)
c0102763:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102766:	50                   	push   %eax
c0102767:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010276a:	50                   	push   %eax
c010276b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102771:	50                   	push   %eax
c0102772:	e8 12 04 00 00       	call   c0102b89 <new_dir_entry>
c0102777:	83 c4 10             	add    $0x10,%esp
c010277a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010277d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102781:	75 07                	jne    c010278a <create_file+0xc8>
c0102783:	b8 00 00 00 00       	mov    $0x0,%eax
c0102788:	eb 41                	jmp    c01027cb <create_file+0x109>
c010278a:	8b 45 08             	mov    0x8(%ebp),%eax
c010278d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102790:	89 10                	mov    %edx,(%eax)
c0102792:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102795:	89 50 04             	mov    %edx,0x4(%eax)
c0102798:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010279b:	89 50 08             	mov    %edx,0x8(%eax)
c010279e:	8b 55 90             	mov    -0x70(%ebp),%edx
c01027a1:	89 50 0c             	mov    %edx,0xc(%eax)
c01027a4:	8b 55 94             	mov    -0x6c(%ebp),%edx
c01027a7:	89 50 10             	mov    %edx,0x10(%eax)
c01027aa:	8b 55 98             	mov    -0x68(%ebp),%edx
c01027ad:	89 50 14             	mov    %edx,0x14(%eax)
c01027b0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01027b3:	89 50 18             	mov    %edx,0x18(%eax)
c01027b6:	8b 55 a0             	mov    -0x60(%ebp),%edx
c01027b9:	89 50 1c             	mov    %edx,0x1c(%eax)
c01027bc:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c01027bf:	89 50 20             	mov    %edx,0x20(%eax)
c01027c2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01027c5:	89 50 24             	mov    %edx,0x24(%eax)
c01027c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01027cb:	c9                   	leave  
c01027cc:	c3                   	ret    

c01027cd <alloc_imap_bit>:
c01027cd:	55                   	push   %ebp
c01027ce:	89 e5                	mov    %esp,%ebp
c01027d0:	53                   	push   %ebx
c01027d1:	83 ec 24             	sub    $0x24,%esp
c01027d4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01027db:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01027e2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01027e7:	83 ec 0c             	sub    $0xc,%esp
c01027ea:	6a 07                	push   $0x7
c01027ec:	68 00 02 00 00       	push   $0x200
c01027f1:	50                   	push   %eax
c01027f2:	ff 75 e8             	pushl  -0x18(%ebp)
c01027f5:	ff 75 ec             	pushl  -0x14(%ebp)
c01027f8:	e8 07 f2 ff ff       	call   c0101a04 <rd_wt>
c01027fd:	83 c4 20             	add    $0x20,%esp
c0102800:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102807:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010280e:	e9 a5 00 00 00       	jmp    c01028b8 <alloc_imap_bit+0xeb>
c0102813:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010281a:	e9 8b 00 00 00       	jmp    c01028aa <alloc_imap_bit+0xdd>
c010281f:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102825:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102828:	01 d0                	add    %edx,%eax
c010282a:	0f b6 00             	movzbl (%eax),%eax
c010282d:	0f be d0             	movsbl %al,%edx
c0102830:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102833:	89 c1                	mov    %eax,%ecx
c0102835:	d3 fa                	sar    %cl,%edx
c0102837:	89 d0                	mov    %edx,%eax
c0102839:	83 e0 01             	and    $0x1,%eax
c010283c:	85 c0                	test   %eax,%eax
c010283e:	74 06                	je     c0102846 <alloc_imap_bit+0x79>
c0102840:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102844:	eb 64                	jmp    c01028aa <alloc_imap_bit+0xdd>
c0102846:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010284c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010284f:	01 d0                	add    %edx,%eax
c0102851:	0f b6 18             	movzbl (%eax),%ebx
c0102854:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102857:	ba 01 00 00 00       	mov    $0x1,%edx
c010285c:	89 c1                	mov    %eax,%ecx
c010285e:	d3 e2                	shl    %cl,%edx
c0102860:	89 d0                	mov    %edx,%eax
c0102862:	89 c1                	mov    %eax,%ecx
c0102864:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010286a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010286d:	01 d0                	add    %edx,%eax
c010286f:	09 cb                	or     %ecx,%ebx
c0102871:	89 da                	mov    %ebx,%edx
c0102873:	88 10                	mov    %dl,(%eax)
c0102875:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102878:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010287f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102882:	01 d0                	add    %edx,%eax
c0102884:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102887:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010288c:	83 ec 0c             	sub    $0xc,%esp
c010288f:	6a 0a                	push   $0xa
c0102891:	68 00 02 00 00       	push   $0x200
c0102896:	50                   	push   %eax
c0102897:	ff 75 e8             	pushl  -0x18(%ebp)
c010289a:	ff 75 ec             	pushl  -0x14(%ebp)
c010289d:	e8 62 f1 ff ff       	call   c0101a04 <rd_wt>
c01028a2:	83 c4 20             	add    $0x20,%esp
c01028a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01028a8:	eb 1b                	jmp    c01028c5 <alloc_imap_bit+0xf8>
c01028aa:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c01028ae:	0f 8e 6b ff ff ff    	jle    c010281f <alloc_imap_bit+0x52>
c01028b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01028b8:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c01028bf:	0f 8e 4e ff ff ff    	jle    c0102813 <alloc_imap_bit+0x46>
c01028c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01028c8:	c9                   	leave  
c01028c9:	c3                   	ret    

c01028ca <alloc_smap_bit>:
c01028ca:	55                   	push   %ebp
c01028cb:	89 e5                	mov    %esp,%ebp
c01028cd:	53                   	push   %ebx
c01028ce:	83 ec 34             	sub    $0x34,%esp
c01028d1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01028d5:	75 1c                	jne    c01028f3 <alloc_smap_bit+0x29>
c01028d7:	68 fd 02 00 00       	push   $0x2fd
c01028dc:	68 d8 b2 10 c0       	push   $0xc010b2d8
c01028e1:	68 d8 b2 10 c0       	push   $0xc010b2d8
c01028e6:	68 e8 b3 10 c0       	push   $0xc010b3e8
c01028eb:	e8 a5 61 00 00       	call   c0108a95 <assertion_failure>
c01028f0:	83 c4 10             	add    $0x10,%esp
c01028f3:	e8 e8 0e 00 00       	call   c01037e0 <get_super_block>
c01028f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01028fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01028fe:	8b 40 08             	mov    0x8(%eax),%eax
c0102901:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102904:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102907:	8b 40 04             	mov    0x4(%eax),%eax
c010290a:	83 c0 02             	add    $0x2,%eax
c010290d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102917:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c010291e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102925:	e9 20 01 00 00       	jmp    c0102a4a <alloc_smap_bit+0x180>
c010292a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010292d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102930:	01 d0                	add    %edx,%eax
c0102932:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102935:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010293a:	83 ec 0c             	sub    $0xc,%esp
c010293d:	6a 07                	push   $0x7
c010293f:	68 00 02 00 00       	push   $0x200
c0102944:	50                   	push   %eax
c0102945:	ff 75 d8             	pushl  -0x28(%ebp)
c0102948:	ff 75 d4             	pushl  -0x2c(%ebp)
c010294b:	e8 b4 f0 ff ff       	call   c0101a04 <rd_wt>
c0102950:	83 c4 20             	add    $0x20,%esp
c0102953:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010295a:	e9 b0 00 00 00       	jmp    c0102a0f <alloc_smap_bit+0x145>
c010295f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102966:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010296a:	0f 85 8c 00 00 00    	jne    c01029fc <alloc_smap_bit+0x132>
c0102970:	eb 45                	jmp    c01029b7 <alloc_smap_bit+0xed>
c0102972:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102978:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010297b:	01 d0                	add    %edx,%eax
c010297d:	0f b6 00             	movzbl (%eax),%eax
c0102980:	0f be d0             	movsbl %al,%edx
c0102983:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102986:	89 c1                	mov    %eax,%ecx
c0102988:	d3 fa                	sar    %cl,%edx
c010298a:	89 d0                	mov    %edx,%eax
c010298c:	83 e0 01             	and    $0x1,%eax
c010298f:	85 c0                	test   %eax,%eax
c0102991:	74 06                	je     c0102999 <alloc_smap_bit+0xcf>
c0102993:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102997:	eb 1e                	jmp    c01029b7 <alloc_smap_bit+0xed>
c0102999:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010299c:	c1 e0 09             	shl    $0x9,%eax
c010299f:	89 c2                	mov    %eax,%edx
c01029a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029a4:	01 d0                	add    %edx,%eax
c01029a6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01029ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01029b0:	01 d0                	add    %edx,%eax
c01029b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01029b5:	eb 06                	jmp    c01029bd <alloc_smap_bit+0xf3>
c01029b7:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c01029bb:	7e b5                	jle    c0102972 <alloc_smap_bit+0xa8>
c01029bd:	eb 3d                	jmp    c01029fc <alloc_smap_bit+0x132>
c01029bf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01029c3:	74 45                	je     c0102a0a <alloc_smap_bit+0x140>
c01029c5:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01029cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029ce:	01 d0                	add    %edx,%eax
c01029d0:	0f b6 18             	movzbl (%eax),%ebx
c01029d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01029d6:	ba 01 00 00 00       	mov    $0x1,%edx
c01029db:	89 c1                	mov    %eax,%ecx
c01029dd:	d3 e2                	shl    %cl,%edx
c01029df:	89 d0                	mov    %edx,%eax
c01029e1:	89 c1                	mov    %eax,%ecx
c01029e3:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01029e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029ec:	01 d0                	add    %edx,%eax
c01029ee:	09 cb                	or     %ecx,%ebx
c01029f0:	89 da                	mov    %ebx,%edx
c01029f2:	88 10                	mov    %dl,(%eax)
c01029f4:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01029f8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01029fc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102a00:	74 09                	je     c0102a0b <alloc_smap_bit+0x141>
c0102a02:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102a06:	7e b7                	jle    c01029bf <alloc_smap_bit+0xf5>
c0102a08:	eb 01                	jmp    c0102a0b <alloc_smap_bit+0x141>
c0102a0a:	90                   	nop
c0102a0b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102a0f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102a16:	0f 8e 43 ff ff ff    	jle    c010295f <alloc_smap_bit+0x95>
c0102a1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102a20:	74 1e                	je     c0102a40 <alloc_smap_bit+0x176>
c0102a22:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a27:	83 ec 0c             	sub    $0xc,%esp
c0102a2a:	6a 0a                	push   $0xa
c0102a2c:	68 00 02 00 00       	push   $0x200
c0102a31:	50                   	push   %eax
c0102a32:	ff 75 d8             	pushl  -0x28(%ebp)
c0102a35:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102a38:	e8 c7 ef ff ff       	call   c0101a04 <rd_wt>
c0102a3d:	83 c4 20             	add    $0x20,%esp
c0102a40:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102a44:	74 12                	je     c0102a58 <alloc_smap_bit+0x18e>
c0102a46:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102a4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a4d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102a50:	0f 8c d4 fe ff ff    	jl     c010292a <alloc_smap_bit+0x60>
c0102a56:	eb 01                	jmp    c0102a59 <alloc_smap_bit+0x18f>
c0102a58:	90                   	nop
c0102a59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102a5c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102a5f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102a62:	8b 00                	mov    (%eax),%eax
c0102a64:	01 d0                	add    %edx,%eax
c0102a66:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102a69:	c9                   	leave  
c0102a6a:	c3                   	ret    

c0102a6b <new_inode>:
c0102a6b:	55                   	push   %ebp
c0102a6c:	89 e5                	mov    %esp,%ebp
c0102a6e:	83 ec 38             	sub    $0x38,%esp
c0102a71:	83 ec 08             	sub    $0x8,%esp
c0102a74:	ff 75 0c             	pushl  0xc(%ebp)
c0102a77:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0102a7a:	50                   	push   %eax
c0102a7b:	e8 80 fa ff ff       	call   c0102500 <get_inode>
c0102a80:	83 c4 10             	add    $0x10,%esp
c0102a83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102a86:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102a8a:	75 0a                	jne    c0102a96 <new_inode+0x2b>
c0102a8c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102a91:	e9 f1 00 00 00       	jmp    c0102b87 <new_inode+0x11c>
c0102a96:	8b 45 10             	mov    0x10(%ebp),%eax
c0102a99:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102a9c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102aa3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0102aaa:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102ab1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ab4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102ab7:	83 ec 0c             	sub    $0xc,%esp
c0102aba:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0102abd:	50                   	push   %eax
c0102abe:	e8 39 0b 00 00       	call   c01035fc <sync_inode>
c0102ac3:	83 c4 10             	add    $0x10,%esp
c0102ac6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0102acd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102ad4:	eb 1d                	jmp    c0102af3 <new_inode+0x88>
c0102ad6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102ad9:	89 d0                	mov    %edx,%eax
c0102adb:	c1 e0 02             	shl    $0x2,%eax
c0102ade:	01 d0                	add    %edx,%eax
c0102ae0:	c1 e0 03             	shl    $0x3,%eax
c0102ae3:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102ae8:	8b 00                	mov    (%eax),%eax
c0102aea:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0102aed:	74 0c                	je     c0102afb <new_inode+0x90>
c0102aef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102af3:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102af7:	7e dd                	jle    c0102ad6 <new_inode+0x6b>
c0102af9:	eb 01                	jmp    c0102afc <new_inode+0x91>
c0102afb:	90                   	nop
c0102afc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102aff:	89 d0                	mov    %edx,%eax
c0102b01:	c1 e0 02             	shl    $0x2,%eax
c0102b04:	01 d0                	add    %edx,%eax
c0102b06:	c1 e0 03             	shl    $0x3,%eax
c0102b09:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c0102b0e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102b11:	89 10                	mov    %edx,(%eax)
c0102b13:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102b16:	89 50 04             	mov    %edx,0x4(%eax)
c0102b19:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102b1c:	89 50 08             	mov    %edx,0x8(%eax)
c0102b1f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102b22:	89 50 0c             	mov    %edx,0xc(%eax)
c0102b25:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102b28:	89 50 10             	mov    %edx,0x10(%eax)
c0102b2b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102b2e:	89 50 14             	mov    %edx,0x14(%eax)
c0102b31:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102b34:	89 50 18             	mov    %edx,0x18(%eax)
c0102b37:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102b3a:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102b3d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102b40:	89 50 20             	mov    %edx,0x20(%eax)
c0102b43:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102b46:	89 50 24             	mov    %edx,0x24(%eax)
c0102b49:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b4c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102b4f:	89 10                	mov    %edx,(%eax)
c0102b51:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102b54:	89 50 04             	mov    %edx,0x4(%eax)
c0102b57:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102b5a:	89 50 08             	mov    %edx,0x8(%eax)
c0102b5d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102b60:	89 50 0c             	mov    %edx,0xc(%eax)
c0102b63:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102b66:	89 50 10             	mov    %edx,0x10(%eax)
c0102b69:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102b6c:	89 50 14             	mov    %edx,0x14(%eax)
c0102b6f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102b72:	89 50 18             	mov    %edx,0x18(%eax)
c0102b75:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102b78:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102b7b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102b7e:	89 50 20             	mov    %edx,0x20(%eax)
c0102b81:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102b84:	89 50 24             	mov    %edx,0x24(%eax)
c0102b87:	c9                   	leave  
c0102b88:	c3                   	ret    

c0102b89 <new_dir_entry>:
c0102b89:	55                   	push   %ebp
c0102b8a:	89 e5                	mov    %esp,%ebp
c0102b8c:	83 ec 48             	sub    $0x48,%esp
c0102b8f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102b96:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b99:	8b 40 04             	mov    0x4(%eax),%eax
c0102b9c:	99                   	cltd   
c0102b9d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102ba0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102ba3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ba6:	8b 40 0c             	mov    0xc(%eax),%eax
c0102ba9:	99                   	cltd   
c0102baa:	f7 7d dc             	idivl  -0x24(%ebp)
c0102bad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102bb0:	e8 2b 0c 00 00       	call   c01037e0 <get_super_block>
c0102bb5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102bb8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102bbb:	8b 00                	mov    (%eax),%eax
c0102bbd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102bc0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bc3:	8b 40 0c             	mov    0xc(%eax),%eax
c0102bc6:	05 00 02 00 00       	add    $0x200,%eax
c0102bcb:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102bd1:	85 c0                	test   %eax,%eax
c0102bd3:	0f 48 c2             	cmovs  %edx,%eax
c0102bd6:	c1 f8 09             	sar    $0x9,%eax
c0102bd9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102bdc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102be3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102bea:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102bf1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102bf8:	eb 7f                	jmp    c0102c79 <new_dir_entry+0xf0>
c0102bfa:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102bff:	89 c1                	mov    %eax,%ecx
c0102c01:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102c04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102c07:	01 d0                	add    %edx,%eax
c0102c09:	83 ec 0c             	sub    $0xc,%esp
c0102c0c:	6a 07                	push   $0x7
c0102c0e:	68 00 02 00 00       	push   $0x200
c0102c13:	51                   	push   %ecx
c0102c14:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102c17:	50                   	push   %eax
c0102c18:	e8 e7 ed ff ff       	call   c0101a04 <rd_wt>
c0102c1d:	83 c4 20             	add    $0x20,%esp
c0102c20:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102c25:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102c28:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102c2f:	eb 25                	jmp    c0102c56 <new_dir_entry+0xcd>
c0102c31:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102c35:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102c38:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102c3b:	7f 29                	jg     c0102c66 <new_dir_entry+0xdd>
c0102c3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102c40:	8b 00                	mov    (%eax),%eax
c0102c42:	85 c0                	test   %eax,%eax
c0102c44:	75 08                	jne    c0102c4e <new_dir_entry+0xc5>
c0102c46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102c49:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102c4c:	eb 19                	jmp    c0102c67 <new_dir_entry+0xde>
c0102c4e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102c52:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102c56:	b8 00 02 00 00       	mov    $0x200,%eax
c0102c5b:	99                   	cltd   
c0102c5c:	f7 7d dc             	idivl  -0x24(%ebp)
c0102c5f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102c62:	7c cd                	jl     c0102c31 <new_dir_entry+0xa8>
c0102c64:	eb 01                	jmp    c0102c67 <new_dir_entry+0xde>
c0102c66:	90                   	nop
c0102c67:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102c6a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102c6d:	7f 16                	jg     c0102c85 <new_dir_entry+0xfc>
c0102c6f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102c73:	75 10                	jne    c0102c85 <new_dir_entry+0xfc>
c0102c75:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102c79:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102c7c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102c7f:	0f 8c 75 ff ff ff    	jl     c0102bfa <new_dir_entry+0x71>
c0102c85:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102c88:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102c8b:	75 0a                	jne    c0102c97 <new_dir_entry+0x10e>
c0102c8d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102c92:	e9 fc 00 00 00       	jmp    c0102d93 <new_dir_entry+0x20a>
c0102c97:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102c9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102ca2:	75 1e                	jne    c0102cc2 <new_dir_entry+0x139>
c0102ca4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ca7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102caa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cad:	8b 50 04             	mov    0x4(%eax),%edx
c0102cb0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102cb3:	01 c2                	add    %eax,%edx
c0102cb5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102cb8:	89 50 04             	mov    %edx,0x4(%eax)
c0102cbb:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102cc5:	8b 55 14             	mov    0x14(%ebp),%edx
c0102cc8:	89 10                	mov    %edx,(%eax)
c0102cca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102ccd:	83 c0 04             	add    $0x4,%eax
c0102cd0:	83 ec 08             	sub    $0x8,%esp
c0102cd3:	ff 75 10             	pushl  0x10(%ebp)
c0102cd6:	50                   	push   %eax
c0102cd7:	e8 f2 94 00 00       	call   c010c1ce <Strcpy>
c0102cdc:	83 c4 10             	add    $0x10,%esp
c0102cdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ce2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102ce5:	8b 0a                	mov    (%edx),%ecx
c0102ce7:	89 08                	mov    %ecx,(%eax)
c0102ce9:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102cec:	89 48 04             	mov    %ecx,0x4(%eax)
c0102cef:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102cf2:	89 48 08             	mov    %ecx,0x8(%eax)
c0102cf5:	8b 52 0c             	mov    0xc(%edx),%edx
c0102cf8:	89 50 0c             	mov    %edx,0xc(%eax)
c0102cfb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d00:	89 c1                	mov    %eax,%ecx
c0102d02:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102d05:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102d08:	01 d0                	add    %edx,%eax
c0102d0a:	83 ec 0c             	sub    $0xc,%esp
c0102d0d:	6a 0a                	push   $0xa
c0102d0f:	68 00 02 00 00       	push   $0x200
c0102d14:	51                   	push   %ecx
c0102d15:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102d18:	50                   	push   %eax
c0102d19:	e8 e6 ec ff ff       	call   c0101a04 <rd_wt>
c0102d1e:	83 c4 20             	add    $0x20,%esp
c0102d21:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102d25:	74 69                	je     c0102d90 <new_dir_entry+0x207>
c0102d27:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d2a:	8b 10                	mov    (%eax),%edx
c0102d2c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102d32:	8b 50 04             	mov    0x4(%eax),%edx
c0102d35:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102d3b:	8b 50 08             	mov    0x8(%eax),%edx
c0102d3e:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102d44:	8b 50 0c             	mov    0xc(%eax),%edx
c0102d47:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102d4d:	8b 50 10             	mov    0x10(%eax),%edx
c0102d50:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102d56:	8b 50 14             	mov    0x14(%eax),%edx
c0102d59:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102d5f:	8b 50 18             	mov    0x18(%eax),%edx
c0102d62:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102d68:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102d6b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102d71:	8b 50 20             	mov    0x20(%eax),%edx
c0102d74:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102d7a:	8b 40 24             	mov    0x24(%eax),%eax
c0102d7d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102d82:	83 ec 0c             	sub    $0xc,%esp
c0102d85:	ff 75 0c             	pushl  0xc(%ebp)
c0102d88:	e8 6f 08 00 00       	call   c01035fc <sync_inode>
c0102d8d:	83 c4 10             	add    $0x10,%esp
c0102d90:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d93:	c9                   	leave  
c0102d94:	c3                   	ret    

c0102d95 <do_unlink>:
c0102d95:	55                   	push   %ebp
c0102d96:	89 e5                	mov    %esp,%ebp
c0102d98:	53                   	push   %ebx
c0102d99:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102d9f:	83 ec 08             	sub    $0x8,%esp
c0102da2:	ff 75 08             	pushl  0x8(%ebp)
c0102da5:	68 fd b3 10 c0       	push   $0xc010b3fd
c0102daa:	e8 bd 6c 00 00       	call   c0109a6c <strcmp>
c0102daf:	83 c4 10             	add    $0x10,%esp
c0102db2:	85 c0                	test   %eax,%eax
c0102db4:	75 10                	jne    c0102dc6 <do_unlink+0x31>
c0102db6:	83 ec 0c             	sub    $0xc,%esp
c0102db9:	68 ff b3 10 c0       	push   $0xc010b3ff
c0102dbe:	e8 b4 5c 00 00       	call   c0108a77 <panic>
c0102dc3:	83 c4 10             	add    $0x10,%esp
c0102dc6:	83 ec 0c             	sub    $0xc,%esp
c0102dc9:	ff 75 08             	pushl  0x8(%ebp)
c0102dcc:	e8 31 f5 ff ff       	call   c0102302 <search_file>
c0102dd1:	83 c4 10             	add    $0x10,%esp
c0102dd4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102dd7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102ddb:	75 10                	jne    c0102ded <do_unlink+0x58>
c0102ddd:	83 ec 0c             	sub    $0xc,%esp
c0102de0:	68 1b b4 10 c0       	push   $0xc010b41b
c0102de5:	e8 8d 5c 00 00       	call   c0108a77 <panic>
c0102dea:	83 c4 10             	add    $0x10,%esp
c0102ded:	83 ec 08             	sub    $0x8,%esp
c0102df0:	ff 75 d0             	pushl  -0x30(%ebp)
c0102df3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102df9:	50                   	push   %eax
c0102dfa:	e8 01 f7 ff ff       	call   c0102500 <get_inode>
c0102dff:	83 c4 10             	add    $0x10,%esp
c0102e02:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102e05:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102e09:	75 10                	jne    c0102e1b <do_unlink+0x86>
c0102e0b:	83 ec 0c             	sub    $0xc,%esp
c0102e0e:	68 1b b4 10 c0       	push   $0xc010b41b
c0102e13:	e8 5f 5c 00 00       	call   c0108a77 <panic>
c0102e18:	83 c4 10             	add    $0x10,%esp
c0102e1b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102e1e:	85 c0                	test   %eax,%eax
c0102e20:	7e 10                	jle    c0102e32 <do_unlink+0x9d>
c0102e22:	83 ec 0c             	sub    $0xc,%esp
c0102e25:	68 34 b4 10 c0       	push   $0xc010b434
c0102e2a:	e8 48 5c 00 00       	call   c0108a77 <panic>
c0102e2f:	83 c4 10             	add    $0x10,%esp
c0102e32:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102e38:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102e3b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102e3e:	8d 50 07             	lea    0x7(%eax),%edx
c0102e41:	85 c0                	test   %eax,%eax
c0102e43:	0f 48 c2             	cmovs  %edx,%eax
c0102e46:	c1 f8 03             	sar    $0x3,%eax
c0102e49:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102e4c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102e4f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102e55:	85 c0                	test   %eax,%eax
c0102e57:	0f 48 c2             	cmovs  %edx,%eax
c0102e5a:	c1 f8 09             	sar    $0x9,%eax
c0102e5d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102e60:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102e63:	99                   	cltd   
c0102e64:	c1 ea 1d             	shr    $0x1d,%edx
c0102e67:	01 d0                	add    %edx,%eax
c0102e69:	83 e0 07             	and    $0x7,%eax
c0102e6c:	29 d0                	sub    %edx,%eax
c0102e6e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102e71:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102e78:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e7d:	89 c2                	mov    %eax,%edx
c0102e7f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102e82:	83 c0 02             	add    $0x2,%eax
c0102e85:	83 ec 0c             	sub    $0xc,%esp
c0102e88:	6a 07                	push   $0x7
c0102e8a:	68 00 02 00 00       	push   $0x200
c0102e8f:	52                   	push   %edx
c0102e90:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e93:	50                   	push   %eax
c0102e94:	e8 6b eb ff ff       	call   c0101a04 <rd_wt>
c0102e99:	83 c4 20             	add    $0x20,%esp
c0102e9c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102ea2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102ea5:	01 d0                	add    %edx,%eax
c0102ea7:	0f b6 10             	movzbl (%eax),%edx
c0102eaa:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102ead:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102eb2:	89 c1                	mov    %eax,%ecx
c0102eb4:	d3 e3                	shl    %cl,%ebx
c0102eb6:	89 d8                	mov    %ebx,%eax
c0102eb8:	f7 d0                	not    %eax
c0102eba:	89 c3                	mov    %eax,%ebx
c0102ebc:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102ec2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102ec5:	01 c8                	add    %ecx,%eax
c0102ec7:	21 da                	and    %ebx,%edx
c0102ec9:	88 10                	mov    %dl,(%eax)
c0102ecb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ed0:	89 c2                	mov    %eax,%edx
c0102ed2:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102ed5:	83 c0 02             	add    $0x2,%eax
c0102ed8:	83 ec 0c             	sub    $0xc,%esp
c0102edb:	6a 0a                	push   $0xa
c0102edd:	68 00 02 00 00       	push   $0x200
c0102ee2:	52                   	push   %edx
c0102ee3:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ee6:	50                   	push   %eax
c0102ee7:	e8 18 eb ff ff       	call   c0101a04 <rd_wt>
c0102eec:	83 c4 20             	add    $0x20,%esp
c0102eef:	e8 ec 08 00 00       	call   c01037e0 <get_super_block>
c0102ef4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102ef7:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102efd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102f00:	8b 00                	mov    (%eax),%eax
c0102f02:	29 c2                	sub    %eax,%edx
c0102f04:	89 d0                	mov    %edx,%eax
c0102f06:	83 c0 01             	add    $0x1,%eax
c0102f09:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102f0c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102f0f:	8d 50 07             	lea    0x7(%eax),%edx
c0102f12:	85 c0                	test   %eax,%eax
c0102f14:	0f 48 c2             	cmovs  %edx,%eax
c0102f17:	c1 f8 03             	sar    $0x3,%eax
c0102f1a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102f1d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102f20:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102f26:	85 c0                	test   %eax,%eax
c0102f28:	0f 48 c2             	cmovs  %edx,%eax
c0102f2b:	c1 f8 09             	sar    $0x9,%eax
c0102f2e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102f31:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102f34:	99                   	cltd   
c0102f35:	c1 ea 1d             	shr    $0x1d,%edx
c0102f38:	01 d0                	add    %edx,%eax
c0102f3a:	83 e0 07             	and    $0x7,%eax
c0102f3d:	29 d0                	sub    %edx,%eax
c0102f3f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102f42:	b8 08 00 00 00       	mov    $0x8,%eax
c0102f47:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102f4a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102f4d:	29 c2                	sub    %eax,%edx
c0102f4f:	89 d0                	mov    %edx,%eax
c0102f51:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102f54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102f57:	8d 50 07             	lea    0x7(%eax),%edx
c0102f5a:	85 c0                	test   %eax,%eax
c0102f5c:	0f 48 c2             	cmovs  %edx,%eax
c0102f5f:	c1 f8 03             	sar    $0x3,%eax
c0102f62:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102f65:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f6a:	89 c1                	mov    %eax,%ecx
c0102f6c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102f6f:	8b 40 04             	mov    0x4(%eax),%eax
c0102f72:	8d 50 02             	lea    0x2(%eax),%edx
c0102f75:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102f78:	01 d0                	add    %edx,%eax
c0102f7a:	83 ec 0c             	sub    $0xc,%esp
c0102f7d:	6a 07                	push   $0x7
c0102f7f:	68 00 02 00 00       	push   $0x200
c0102f84:	51                   	push   %ecx
c0102f85:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f88:	50                   	push   %eax
c0102f89:	e8 76 ea ff ff       	call   c0101a04 <rd_wt>
c0102f8e:	83 c4 20             	add    $0x20,%esp
c0102f91:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102f97:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102f9a:	01 d0                	add    %edx,%eax
c0102f9c:	0f b6 10             	movzbl (%eax),%edx
c0102f9f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102fa2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102fa7:	89 c1                	mov    %eax,%ecx
c0102fa9:	d3 e3                	shl    %cl,%ebx
c0102fab:	89 d8                	mov    %ebx,%eax
c0102fad:	f7 d0                	not    %eax
c0102faf:	89 c3                	mov    %eax,%ebx
c0102fb1:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102fb7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102fba:	01 c8                	add    %ecx,%eax
c0102fbc:	21 da                	and    %ebx,%edx
c0102fbe:	88 10                	mov    %dl,(%eax)
c0102fc0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102fc7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102fca:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102fcd:	eb 6b                	jmp    c010303a <do_unlink+0x2a5>
c0102fcf:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102fd6:	75 4c                	jne    c0103024 <do_unlink+0x28f>
c0102fd8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102fdf:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102fe4:	83 ec 0c             	sub    $0xc,%esp
c0102fe7:	6a 0a                	push   $0xa
c0102fe9:	68 00 02 00 00       	push   $0x200
c0102fee:	50                   	push   %eax
c0102fef:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ff2:	ff 75 ec             	pushl  -0x14(%ebp)
c0102ff5:	e8 0a ea ff ff       	call   c0101a04 <rd_wt>
c0102ffa:	83 c4 20             	add    $0x20,%esp
c0102ffd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103002:	89 c1                	mov    %eax,%ecx
c0103004:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103007:	8d 50 01             	lea    0x1(%eax),%edx
c010300a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c010300d:	83 ec 0c             	sub    $0xc,%esp
c0103010:	6a 07                	push   $0x7
c0103012:	68 00 02 00 00       	push   $0x200
c0103017:	51                   	push   %ecx
c0103018:	ff 75 b8             	pushl  -0x48(%ebp)
c010301b:	50                   	push   %eax
c010301c:	e8 e3 e9 ff ff       	call   c0101a04 <rd_wt>
c0103021:	83 c4 20             	add    $0x20,%esp
c0103024:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010302a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010302d:	01 d0                	add    %edx,%eax
c010302f:	c6 00 00             	movb   $0x0,(%eax)
c0103032:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0103036:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c010303a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010303d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0103040:	7c 8d                	jl     c0102fcf <do_unlink+0x23a>
c0103042:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0103049:	75 4c                	jne    c0103097 <do_unlink+0x302>
c010304b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0103052:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103057:	83 ec 0c             	sub    $0xc,%esp
c010305a:	6a 0a                	push   $0xa
c010305c:	68 00 02 00 00       	push   $0x200
c0103061:	50                   	push   %eax
c0103062:	ff 75 b8             	pushl  -0x48(%ebp)
c0103065:	ff 75 ec             	pushl  -0x14(%ebp)
c0103068:	e8 97 e9 ff ff       	call   c0101a04 <rd_wt>
c010306d:	83 c4 20             	add    $0x20,%esp
c0103070:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103075:	89 c1                	mov    %eax,%ecx
c0103077:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010307a:	8d 50 01             	lea    0x1(%eax),%edx
c010307d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0103080:	83 ec 0c             	sub    $0xc,%esp
c0103083:	6a 07                	push   $0x7
c0103085:	68 00 02 00 00       	push   $0x200
c010308a:	51                   	push   %ecx
c010308b:	ff 75 b8             	pushl  -0x48(%ebp)
c010308e:	50                   	push   %eax
c010308f:	e8 70 e9 ff ff       	call   c0101a04 <rd_wt>
c0103094:	83 c4 20             	add    $0x20,%esp
c0103097:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010309d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030a0:	01 d0                	add    %edx,%eax
c01030a2:	0f b6 10             	movzbl (%eax),%edx
c01030a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01030a8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c01030ad:	89 c1                	mov    %eax,%ecx
c01030af:	d3 e3                	shl    %cl,%ebx
c01030b1:	89 d8                	mov    %ebx,%eax
c01030b3:	89 c3                	mov    %eax,%ebx
c01030b5:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c01030bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030be:	01 c8                	add    %ecx,%eax
c01030c0:	21 da                	and    %ebx,%edx
c01030c2:	88 10                	mov    %dl,(%eax)
c01030c4:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030c9:	83 ec 0c             	sub    $0xc,%esp
c01030cc:	6a 0a                	push   $0xa
c01030ce:	68 00 02 00 00       	push   $0x200
c01030d3:	50                   	push   %eax
c01030d4:	ff 75 b8             	pushl  -0x48(%ebp)
c01030d7:	ff 75 ec             	pushl  -0x14(%ebp)
c01030da:	e8 25 e9 ff ff       	call   c0101a04 <rd_wt>
c01030df:	83 c4 20             	add    $0x20,%esp
c01030e2:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c01030e9:	00 00 00 
c01030ec:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c01030f3:	00 00 00 
c01030f6:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c01030fd:	00 00 00 
c0103100:	83 ec 0c             	sub    $0xc,%esp
c0103103:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0103109:	50                   	push   %eax
c010310a:	e8 ed 04 00 00       	call   c01035fc <sync_inode>
c010310f:	83 c4 10             	add    $0x10,%esp
c0103112:	83 ec 0c             	sub    $0xc,%esp
c0103115:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c010311b:	50                   	push   %eax
c010311c:	e8 2f 06 00 00       	call   c0103750 <put_inode>
c0103121:	83 c4 10             	add    $0x10,%esp
c0103124:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103127:	8b 00                	mov    (%eax),%eax
c0103129:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010312c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0103133:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103136:	8b 40 04             	mov    0x4(%eax),%eax
c0103139:	89 45 94             	mov    %eax,-0x6c(%ebp)
c010313c:	8b 45 98             	mov    -0x68(%ebp),%eax
c010313f:	8b 40 0c             	mov    0xc(%eax),%eax
c0103142:	89 45 90             	mov    %eax,-0x70(%ebp)
c0103145:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103148:	c1 e8 04             	shr    $0x4,%eax
c010314b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010314e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0103155:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010315c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0103163:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010316a:	e9 a5 00 00 00       	jmp    c0103214 <do_unlink+0x47f>
c010316f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103174:	89 c1                	mov    %eax,%ecx
c0103176:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0103179:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010317c:	01 d0                	add    %edx,%eax
c010317e:	83 ec 0c             	sub    $0xc,%esp
c0103181:	6a 07                	push   $0x7
c0103183:	68 00 02 00 00       	push   $0x200
c0103188:	51                   	push   %ecx
c0103189:	ff 75 b8             	pushl  -0x48(%ebp)
c010318c:	50                   	push   %eax
c010318d:	e8 72 e8 ff ff       	call   c0101a04 <rd_wt>
c0103192:	83 c4 20             	add    $0x20,%esp
c0103195:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010319a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010319d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c01031a4:	eb 51                	jmp    c01031f7 <do_unlink+0x462>
c01031a6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01031aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01031ad:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01031b0:	7f 4f                	jg     c0103201 <do_unlink+0x46c>
c01031b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01031b5:	83 c0 10             	add    $0x10,%eax
c01031b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01031bb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01031be:	83 c0 04             	add    $0x4,%eax
c01031c1:	83 ec 08             	sub    $0x8,%esp
c01031c4:	ff 75 08             	pushl  0x8(%ebp)
c01031c7:	50                   	push   %eax
c01031c8:	e8 9f 68 00 00       	call   c0109a6c <strcmp>
c01031cd:	83 c4 10             	add    $0x10,%esp
c01031d0:	85 c0                	test   %eax,%eax
c01031d2:	75 1b                	jne    c01031ef <do_unlink+0x45a>
c01031d4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01031db:	83 ec 04             	sub    $0x4,%esp
c01031de:	6a 10                	push   $0x10
c01031e0:	6a 00                	push   $0x0
c01031e2:	ff 75 d4             	pushl  -0x2c(%ebp)
c01031e5:	e8 c5 8f 00 00       	call   c010c1af <Memset>
c01031ea:	83 c4 10             	add    $0x10,%esp
c01031ed:	eb 13                	jmp    c0103202 <do_unlink+0x46d>
c01031ef:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c01031f3:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c01031f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01031fa:	3b 45 90             	cmp    -0x70(%ebp),%eax
c01031fd:	7c a7                	jl     c01031a6 <do_unlink+0x411>
c01031ff:	eb 01                	jmp    c0103202 <do_unlink+0x46d>
c0103201:	90                   	nop
c0103202:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103205:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103208:	7f 16                	jg     c0103220 <do_unlink+0x48b>
c010320a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010320e:	75 10                	jne    c0103220 <do_unlink+0x48b>
c0103210:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0103214:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103217:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010321a:	0f 8c 4f ff ff ff    	jl     c010316f <do_unlink+0x3da>
c0103220:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103223:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103226:	75 17                	jne    c010323f <do_unlink+0x4aa>
c0103228:	8b 45 98             	mov    -0x68(%ebp),%eax
c010322b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010322e:	89 50 04             	mov    %edx,0x4(%eax)
c0103231:	83 ec 0c             	sub    $0xc,%esp
c0103234:	ff 75 98             	pushl  -0x68(%ebp)
c0103237:	e8 c0 03 00 00       	call   c01035fc <sync_inode>
c010323c:	83 c4 10             	add    $0x10,%esp
c010323f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0103243:	74 26                	je     c010326b <do_unlink+0x4d6>
c0103245:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010324a:	89 c1                	mov    %eax,%ecx
c010324c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c010324f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103252:	01 d0                	add    %edx,%eax
c0103254:	83 ec 0c             	sub    $0xc,%esp
c0103257:	6a 0a                	push   $0xa
c0103259:	68 00 02 00 00       	push   $0x200
c010325e:	51                   	push   %ecx
c010325f:	ff 75 b8             	pushl  -0x48(%ebp)
c0103262:	50                   	push   %eax
c0103263:	e8 9c e7 ff ff       	call   c0101a04 <rd_wt>
c0103268:	83 c4 20             	add    $0x20,%esp
c010326b:	90                   	nop
c010326c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010326f:	c9                   	leave  
c0103270:	c3                   	ret    

c0103271 <do_rdwt>:
c0103271:	55                   	push   %ebp
c0103272:	89 e5                	mov    %esp,%ebp
c0103274:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010327a:	8b 45 08             	mov    0x8(%ebp),%eax
c010327d:	8b 40 78             	mov    0x78(%eax),%eax
c0103280:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103283:	8b 45 08             	mov    0x8(%ebp),%eax
c0103286:	8b 40 60             	mov    0x60(%eax),%eax
c0103289:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010328c:	8b 45 08             	mov    0x8(%ebp),%eax
c010328f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103292:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103295:	8b 45 08             	mov    0x8(%ebp),%eax
c0103298:	8b 00                	mov    (%eax),%eax
c010329a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010329d:	8b 45 08             	mov    0x8(%ebp),%eax
c01032a0:	8b 40 10             	mov    0x10(%eax),%eax
c01032a3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01032a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01032a9:	8b 40 50             	mov    0x50(%eax),%eax
c01032ac:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01032af:	83 ec 0c             	sub    $0xc,%esp
c01032b2:	ff 75 d0             	pushl  -0x30(%ebp)
c01032b5:	e8 0c 07 00 00       	call   c01039c6 <pid2proc>
c01032ba:	83 c4 10             	add    $0x10,%esp
c01032bd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01032c0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01032c3:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01032c6:	83 c2 4c             	add    $0x4c,%edx
c01032c9:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01032cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01032d0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01032d3:	8b 40 08             	mov    0x8(%eax),%eax
c01032d6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01032d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01032dc:	8b 00                	mov    (%eax),%eax
c01032de:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01032e1:	83 ec 08             	sub    $0x8,%esp
c01032e4:	ff 75 bc             	pushl  -0x44(%ebp)
c01032e7:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01032ed:	50                   	push   %eax
c01032ee:	e8 0d f2 ff ff       	call   c0102500 <get_inode>
c01032f3:	83 c4 10             	add    $0x10,%esp
c01032f6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01032f9:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c01032fd:	75 10                	jne    c010330f <do_rdwt+0x9e>
c01032ff:	83 ec 0c             	sub    $0xc,%esp
c0103302:	68 6c b4 10 c0       	push   $0xc010b46c
c0103307:	e8 6b 57 00 00       	call   c0108a77 <panic>
c010330c:	83 c4 10             	add    $0x10,%esp
c010330f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103315:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103318:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010331b:	8b 40 04             	mov    0x4(%eax),%eax
c010331e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103321:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103325:	74 22                	je     c0103349 <do_rdwt+0xd8>
c0103327:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010332b:	74 1c                	je     c0103349 <do_rdwt+0xd8>
c010332d:	68 a8 04 00 00       	push   $0x4a8
c0103332:	68 d8 b2 10 c0       	push   $0xc010b2d8
c0103337:	68 d8 b2 10 c0       	push   $0xc010b2d8
c010333c:	68 7c b4 10 c0       	push   $0xc010b47c
c0103341:	e8 4f 57 00 00       	call   c0108a95 <assertion_failure>
c0103346:	83 c4 10             	add    $0x10,%esp
c0103349:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c010334f:	83 f8 01             	cmp    $0x1,%eax
c0103352:	0f 85 86 00 00 00    	jne    c01033de <do_rdwt+0x16d>
c0103358:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010335c:	75 09                	jne    c0103367 <do_rdwt+0xf6>
c010335e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103365:	eb 0d                	jmp    c0103374 <do_rdwt+0x103>
c0103367:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010336b:	75 07                	jne    c0103374 <do_rdwt+0x103>
c010336d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103374:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103377:	8b 45 08             	mov    0x8(%ebp),%eax
c010337a:	89 50 78             	mov    %edx,0x78(%eax)
c010337d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103380:	8b 45 08             	mov    0x8(%ebp),%eax
c0103383:	89 50 68             	mov    %edx,0x68(%eax)
c0103386:	83 ec 04             	sub    $0x4,%esp
c0103389:	6a 04                	push   $0x4
c010338b:	ff 75 08             	pushl  0x8(%ebp)
c010338e:	6a 03                	push   $0x3
c0103390:	e8 70 63 00 00       	call   c0109705 <send_rec>
c0103395:	83 c4 10             	add    $0x10,%esp
c0103398:	8b 45 08             	mov    0x8(%ebp),%eax
c010339b:	8b 40 78             	mov    0x78(%eax),%eax
c010339e:	83 f8 66             	cmp    $0x66,%eax
c01033a1:	75 13                	jne    c01033b6 <do_rdwt+0x145>
c01033a3:	83 ec 04             	sub    $0x4,%esp
c01033a6:	ff 75 b8             	pushl  -0x48(%ebp)
c01033a9:	ff 75 08             	pushl  0x8(%ebp)
c01033ac:	6a 01                	push   $0x1
c01033ae:	e8 52 63 00 00       	call   c0109705 <send_rec>
c01033b3:	83 c4 10             	add    $0x10,%esp
c01033b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01033b9:	8b 40 78             	mov    0x78(%eax),%eax
c01033bc:	83 f8 65             	cmp    $0x65,%eax
c01033bf:	75 13                	jne    c01033d4 <do_rdwt+0x163>
c01033c1:	83 ec 04             	sub    $0x4,%esp
c01033c4:	ff 75 b8             	pushl  -0x48(%ebp)
c01033c7:	ff 75 08             	pushl  0x8(%ebp)
c01033ca:	6a 01                	push   $0x1
c01033cc:	e8 34 63 00 00       	call   c0109705 <send_rec>
c01033d1:	83 c4 10             	add    $0x10,%esp
c01033d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01033d9:	e9 1c 02 00 00       	jmp    c01035fa <do_rdwt+0x389>
c01033de:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01033e2:	75 18                	jne    c01033fc <do_rdwt+0x18b>
c01033e4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01033ea:	c1 e0 09             	shl    $0x9,%eax
c01033ed:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c01033f0:	75 0a                	jne    c01033fc <do_rdwt+0x18b>
c01033f2:	b8 00 00 00 00       	mov    $0x0,%eax
c01033f7:	e9 fe 01 00 00       	jmp    c01035fa <do_rdwt+0x389>
c01033fc:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103400:	75 14                	jne    c0103416 <do_rdwt+0x1a5>
c0103402:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103405:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103408:	01 d0                	add    %edx,%eax
c010340a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010340d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0103411:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103414:	eb 19                	jmp    c010342f <do_rdwt+0x1be>
c0103416:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103419:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010341c:	01 c2                	add    %eax,%edx
c010341e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103424:	c1 e0 09             	shl    $0x9,%eax
c0103427:	39 c2                	cmp    %eax,%edx
c0103429:	0f 4e c2             	cmovle %edx,%eax
c010342c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010342f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103432:	99                   	cltd   
c0103433:	c1 ea 17             	shr    $0x17,%edx
c0103436:	01 d0                	add    %edx,%eax
c0103438:	25 ff 01 00 00       	and    $0x1ff,%eax
c010343d:	29 d0                	sub    %edx,%eax
c010343f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103442:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103448:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010344b:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103451:	85 c0                	test   %eax,%eax
c0103453:	0f 48 c1             	cmovs  %ecx,%eax
c0103456:	c1 f8 09             	sar    $0x9,%eax
c0103459:	01 d0                	add    %edx,%eax
c010345b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010345e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103464:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103467:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010346d:	85 c0                	test   %eax,%eax
c010346f:	0f 48 c1             	cmovs  %ecx,%eax
c0103472:	c1 f8 09             	sar    $0x9,%eax
c0103475:	01 d0                	add    %edx,%eax
c0103477:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010347a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010347d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103480:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103485:	39 d0                	cmp    %edx,%eax
c0103487:	7d 0b                	jge    c0103494 <do_rdwt+0x223>
c0103489:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010348c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010348f:	83 c0 01             	add    $0x1,%eax
c0103492:	eb 05                	jmp    c0103499 <do_rdwt+0x228>
c0103494:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103499:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010349c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010349f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01034a2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01034a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01034ac:	8b 00                	mov    (%eax),%eax
c01034ae:	83 ec 0c             	sub    $0xc,%esp
c01034b1:	50                   	push   %eax
c01034b2:	e8 0f 05 00 00       	call   c01039c6 <pid2proc>
c01034b7:	83 c4 10             	add    $0x10,%esp
c01034ba:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01034bd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034c0:	83 ec 08             	sub    $0x8,%esp
c01034c3:	50                   	push   %eax
c01034c4:	ff 75 cc             	pushl  -0x34(%ebp)
c01034c7:	e8 43 2b 00 00       	call   c010600f <alloc_virtual_memory>
c01034cc:	83 c4 10             	add    $0x10,%esp
c01034cf:	89 45 98             	mov    %eax,-0x68(%ebp)
c01034d2:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01034d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01034d8:	e9 c5 00 00 00       	jmp    c01035a2 <do_rdwt+0x331>
c01034dd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01034e0:	c1 e0 09             	shl    $0x9,%eax
c01034e3:	2b 45 ec             	sub    -0x14(%ebp),%eax
c01034e6:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c01034e9:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c01034ed:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01034f0:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c01034f7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01034fb:	75 46                	jne    c0103543 <do_rdwt+0x2d2>
c01034fd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103500:	c1 e0 09             	shl    $0x9,%eax
c0103503:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103509:	83 ec 0c             	sub    $0xc,%esp
c010350c:	6a 07                	push   $0x7
c010350e:	50                   	push   %eax
c010350f:	52                   	push   %edx
c0103510:	ff 75 90             	pushl  -0x70(%ebp)
c0103513:	ff 75 e0             	pushl  -0x20(%ebp)
c0103516:	e8 e9 e4 ff ff       	call   c0101a04 <rd_wt>
c010351b:	83 c4 20             	add    $0x20,%esp
c010351e:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103524:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103527:	01 d0                	add    %edx,%eax
c0103529:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010352c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010352f:	01 ca                	add    %ecx,%edx
c0103531:	83 ec 04             	sub    $0x4,%esp
c0103534:	ff 75 94             	pushl  -0x6c(%ebp)
c0103537:	50                   	push   %eax
c0103538:	52                   	push   %edx
c0103539:	e8 3e 39 00 00       	call   c0106e7c <Memcpy>
c010353e:	83 c4 10             	add    $0x10,%esp
c0103541:	eb 46                	jmp    c0103589 <do_rdwt+0x318>
c0103543:	8b 55 98             	mov    -0x68(%ebp),%edx
c0103546:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103549:	01 d0                	add    %edx,%eax
c010354b:	89 c1                	mov    %eax,%ecx
c010354d:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103553:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103556:	01 d0                	add    %edx,%eax
c0103558:	83 ec 04             	sub    $0x4,%esp
c010355b:	ff 75 94             	pushl  -0x6c(%ebp)
c010355e:	51                   	push   %ecx
c010355f:	50                   	push   %eax
c0103560:	e8 17 39 00 00       	call   c0106e7c <Memcpy>
c0103565:	83 c4 10             	add    $0x10,%esp
c0103568:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010356b:	c1 e0 09             	shl    $0x9,%eax
c010356e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103574:	83 ec 0c             	sub    $0xc,%esp
c0103577:	6a 0a                	push   $0xa
c0103579:	50                   	push   %eax
c010357a:	52                   	push   %edx
c010357b:	ff 75 90             	pushl  -0x70(%ebp)
c010357e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103581:	e8 7e e4 ff ff       	call   c0101a04 <rd_wt>
c0103586:	83 c4 20             	add    $0x20,%esp
c0103589:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010358c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010358f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103592:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103595:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010359c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010359f:	01 45 e0             	add    %eax,-0x20(%ebp)
c01035a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01035a5:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c01035a8:	7f 0a                	jg     c01035b4 <do_rdwt+0x343>
c01035aa:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01035ae:	0f 85 29 ff ff ff    	jne    c01034dd <do_rdwt+0x26c>
c01035b4:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01035b7:	8b 50 04             	mov    0x4(%eax),%edx
c01035ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01035bd:	01 c2                	add    %eax,%edx
c01035bf:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01035c2:	89 50 04             	mov    %edx,0x4(%eax)
c01035c5:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01035c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01035cb:	01 c2                	add    %eax,%edx
c01035cd:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01035d3:	39 c2                	cmp    %eax,%edx
c01035d5:	7e 20                	jle    c01035f7 <do_rdwt+0x386>
c01035d7:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01035da:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01035dd:	01 d0                	add    %edx,%eax
c01035df:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01035e5:	83 ec 0c             	sub    $0xc,%esp
c01035e8:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01035ee:	50                   	push   %eax
c01035ef:	e8 08 00 00 00       	call   c01035fc <sync_inode>
c01035f4:	83 c4 10             	add    $0x10,%esp
c01035f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01035fa:	c9                   	leave  
c01035fb:	c3                   	ret    

c01035fc <sync_inode>:
c01035fc:	55                   	push   %ebp
c01035fd:	89 e5                	mov    %esp,%ebp
c01035ff:	53                   	push   %ebx
c0103600:	83 ec 34             	sub    $0x34,%esp
c0103603:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010360a:	eb 74                	jmp    c0103680 <sync_inode+0x84>
c010360c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010360f:	89 d0                	mov    %edx,%eax
c0103611:	c1 e0 02             	shl    $0x2,%eax
c0103614:	01 d0                	add    %edx,%eax
c0103616:	c1 e0 03             	shl    $0x3,%eax
c0103619:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c010361e:	8b 10                	mov    (%eax),%edx
c0103620:	8b 45 08             	mov    0x8(%ebp),%eax
c0103623:	8b 40 10             	mov    0x10(%eax),%eax
c0103626:	39 c2                	cmp    %eax,%edx
c0103628:	75 52                	jne    c010367c <sync_inode+0x80>
c010362a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010362d:	89 d0                	mov    %edx,%eax
c010362f:	c1 e0 02             	shl    $0x2,%eax
c0103632:	01 d0                	add    %edx,%eax
c0103634:	c1 e0 03             	shl    $0x3,%eax
c0103637:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c010363d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103640:	8b 08                	mov    (%eax),%ecx
c0103642:	89 0a                	mov    %ecx,(%edx)
c0103644:	8b 48 04             	mov    0x4(%eax),%ecx
c0103647:	89 4a 04             	mov    %ecx,0x4(%edx)
c010364a:	8b 48 08             	mov    0x8(%eax),%ecx
c010364d:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103650:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103653:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103656:	8b 48 10             	mov    0x10(%eax),%ecx
c0103659:	89 4a 10             	mov    %ecx,0x10(%edx)
c010365c:	8b 48 14             	mov    0x14(%eax),%ecx
c010365f:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103662:	8b 48 18             	mov    0x18(%eax),%ecx
c0103665:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103668:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010366b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010366e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103671:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103674:	8b 40 24             	mov    0x24(%eax),%eax
c0103677:	89 42 24             	mov    %eax,0x24(%edx)
c010367a:	eb 0a                	jmp    c0103686 <sync_inode+0x8a>
c010367c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103680:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103684:	7e 86                	jle    c010360c <sync_inode+0x10>
c0103686:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010368d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103690:	8b 40 10             	mov    0x10(%eax),%eax
c0103693:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103696:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103699:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010369c:	b8 00 02 00 00       	mov    $0x200,%eax
c01036a1:	99                   	cltd   
c01036a2:	f7 7d f0             	idivl  -0x10(%ebp)
c01036a5:	89 c3                	mov    %eax,%ebx
c01036a7:	89 c8                	mov    %ecx,%eax
c01036a9:	99                   	cltd   
c01036aa:	f7 fb                	idiv   %ebx
c01036ac:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01036af:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01036b2:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01036b5:	b8 00 02 00 00       	mov    $0x200,%eax
c01036ba:	99                   	cltd   
c01036bb:	f7 7d f0             	idivl  -0x10(%ebp)
c01036be:	89 c3                	mov    %eax,%ebx
c01036c0:	89 c8                	mov    %ecx,%eax
c01036c2:	99                   	cltd   
c01036c3:	f7 fb                	idiv   %ebx
c01036c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01036c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01036cb:	8b 40 20             	mov    0x20(%eax),%eax
c01036ce:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01036d1:	e8 0a 01 00 00       	call   c01037e0 <get_super_block>
c01036d6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01036d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01036dc:	8b 40 04             	mov    0x4(%eax),%eax
c01036df:	8d 50 02             	lea    0x2(%eax),%edx
c01036e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01036e5:	8b 40 08             	mov    0x8(%eax),%eax
c01036e8:	01 c2                	add    %eax,%edx
c01036ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01036ed:	01 d0                	add    %edx,%eax
c01036ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01036f2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01036f7:	83 ec 0c             	sub    $0xc,%esp
c01036fa:	6a 07                	push   $0x7
c01036fc:	68 00 02 00 00       	push   $0x200
c0103701:	50                   	push   %eax
c0103702:	ff 75 e0             	pushl  -0x20(%ebp)
c0103705:	ff 75 d8             	pushl  -0x28(%ebp)
c0103708:	e8 f7 e2 ff ff       	call   c0101a04 <rd_wt>
c010370d:	83 c4 20             	add    $0x20,%esp
c0103710:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0103715:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103718:	83 ec 04             	sub    $0x4,%esp
c010371b:	ff 75 f0             	pushl  -0x10(%ebp)
c010371e:	ff 75 08             	pushl  0x8(%ebp)
c0103721:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103724:	e8 53 37 00 00       	call   c0106e7c <Memcpy>
c0103729:	83 c4 10             	add    $0x10,%esp
c010372c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103731:	83 ec 0c             	sub    $0xc,%esp
c0103734:	6a 0a                	push   $0xa
c0103736:	68 00 02 00 00       	push   $0x200
c010373b:	50                   	push   %eax
c010373c:	ff 75 e0             	pushl  -0x20(%ebp)
c010373f:	ff 75 d8             	pushl  -0x28(%ebp)
c0103742:	e8 bd e2 ff ff       	call   c0101a04 <rd_wt>
c0103747:	83 c4 20             	add    $0x20,%esp
c010374a:	90                   	nop
c010374b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010374e:	c9                   	leave  
c010374f:	c3                   	ret    

c0103750 <put_inode>:
c0103750:	55                   	push   %ebp
c0103751:	89 e5                	mov    %esp,%ebp
c0103753:	83 ec 08             	sub    $0x8,%esp
c0103756:	8b 45 08             	mov    0x8(%ebp),%eax
c0103759:	8b 40 24             	mov    0x24(%eax),%eax
c010375c:	85 c0                	test   %eax,%eax
c010375e:	7f 1c                	jg     c010377c <put_inode+0x2c>
c0103760:	68 4d 05 00 00       	push   $0x54d
c0103765:	68 d8 b2 10 c0       	push   $0xc010b2d8
c010376a:	68 d8 b2 10 c0       	push   $0xc010b2d8
c010376f:	68 b0 b4 10 c0       	push   $0xc010b4b0
c0103774:	e8 1c 53 00 00       	call   c0108a95 <assertion_failure>
c0103779:	83 c4 10             	add    $0x10,%esp
c010377c:	8b 45 08             	mov    0x8(%ebp),%eax
c010377f:	8b 40 24             	mov    0x24(%eax),%eax
c0103782:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103785:	8b 45 08             	mov    0x8(%ebp),%eax
c0103788:	89 50 24             	mov    %edx,0x24(%eax)
c010378b:	90                   	nop
c010378c:	c9                   	leave  
c010378d:	c3                   	ret    

c010378e <do_close>:
c010378e:	55                   	push   %ebp
c010378f:	89 e5                	mov    %esp,%ebp
c0103791:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103796:	8b 55 08             	mov    0x8(%ebp),%edx
c0103799:	83 c2 4c             	add    $0x4c,%edx
c010379c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01037a0:	8b 50 0c             	mov    0xc(%eax),%edx
c01037a3:	83 ea 01             	sub    $0x1,%edx
c01037a6:	89 50 0c             	mov    %edx,0xc(%eax)
c01037a9:	8b 40 0c             	mov    0xc(%eax),%eax
c01037ac:	85 c0                	test   %eax,%eax
c01037ae:	75 16                	jne    c01037c6 <do_close+0x38>
c01037b0:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01037b5:	8b 55 08             	mov    0x8(%ebp),%edx
c01037b8:	83 c2 4c             	add    $0x4c,%edx
c01037bb:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01037bf:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01037c6:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01037cb:	8b 55 08             	mov    0x8(%ebp),%edx
c01037ce:	83 c2 4c             	add    $0x4c,%edx
c01037d1:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c01037d8:	00 
c01037d9:	b8 00 00 00 00       	mov    $0x0,%eax
c01037de:	5d                   	pop    %ebp
c01037df:	c3                   	ret    

c01037e0 <get_super_block>:
c01037e0:	55                   	push   %ebp
c01037e1:	89 e5                	mov    %esp,%ebp
c01037e3:	83 ec 08             	sub    $0x8,%esp
c01037e6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01037eb:	83 ec 0c             	sub    $0xc,%esp
c01037ee:	6a 07                	push   $0x7
c01037f0:	68 00 02 00 00       	push   $0x200
c01037f5:	50                   	push   %eax
c01037f6:	6a 20                	push   $0x20
c01037f8:	6a 01                	push   $0x1
c01037fa:	e8 05 e2 ff ff       	call   c0101a04 <rd_wt>
c01037ff:	83 c4 20             	add    $0x20,%esp
c0103802:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103808:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010380d:	8b 0a                	mov    (%edx),%ecx
c010380f:	89 08                	mov    %ecx,(%eax)
c0103811:	8b 4a 04             	mov    0x4(%edx),%ecx
c0103814:	89 48 04             	mov    %ecx,0x4(%eax)
c0103817:	8b 4a 08             	mov    0x8(%edx),%ecx
c010381a:	89 48 08             	mov    %ecx,0x8(%eax)
c010381d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103820:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103823:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103826:	89 48 10             	mov    %ecx,0x10(%eax)
c0103829:	8b 4a 14             	mov    0x14(%edx),%ecx
c010382c:	89 48 14             	mov    %ecx,0x14(%eax)
c010382f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0103832:	89 48 18             	mov    %ecx,0x18(%eax)
c0103835:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0103838:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010383b:	8b 52 20             	mov    0x20(%edx),%edx
c010383e:	89 50 20             	mov    %edx,0x20(%eax)
c0103841:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0103846:	c9                   	leave  
c0103847:	c3                   	ret    

c0103848 <schedule_process>:
c0103848:	55                   	push   %ebp
c0103849:	89 e5                	mov    %esp,%ebp
c010384b:	83 ec 18             	sub    $0x18,%esp
c010384e:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103855:	e8 e2 cb ff ff       	call   c010043c <get_running_thread_pcb>
c010385a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010385d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103860:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103867:	84 c0                	test   %al,%al
c0103869:	75 35                	jne    c01038a0 <schedule_process+0x58>
c010386b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010386e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103874:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103877:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010387d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103880:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103887:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010388a:	05 60 02 00 00       	add    $0x260,%eax
c010388f:	83 ec 08             	sub    $0x8,%esp
c0103892:	50                   	push   %eax
c0103893:	68 ec fd 10 c0       	push   $0xc010fdec
c0103898:	e8 9a 6b 00 00       	call   c010a437 <insertToDoubleLinkList>
c010389d:	83 c4 10             	add    $0x10,%esp
c01038a0:	83 ec 0c             	sub    $0xc,%esp
c01038a3:	68 ec fd 10 c0       	push   $0xc010fdec
c01038a8:	e8 a6 69 00 00       	call   c010a253 <isListEmpty>
c01038ad:	83 c4 10             	add    $0x10,%esp
c01038b0:	84 c0                	test   %al,%al
c01038b2:	74 19                	je     c01038cd <schedule_process+0x85>
c01038b4:	6a 1e                	push   $0x1e
c01038b6:	68 bf b4 10 c0       	push   $0xc010b4bf
c01038bb:	68 bf b4 10 c0       	push   $0xc010b4bf
c01038c0:	68 c9 b4 10 c0       	push   $0xc010b4c9
c01038c5:	e8 cb 51 00 00       	call   c0108a95 <assertion_failure>
c01038ca:	83 c4 10             	add    $0x10,%esp
c01038cd:	83 ec 0c             	sub    $0xc,%esp
c01038d0:	68 ec fd 10 c0       	push   $0xc010fdec
c01038d5:	e8 e0 6b 00 00       	call   c010a4ba <popFromDoubleLinkList>
c01038da:	83 c4 10             	add    $0x10,%esp
c01038dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01038e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01038e3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01038e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01038eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01038ee:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01038f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01038f8:	8b 50 08             	mov    0x8(%eax),%edx
c01038fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038fe:	39 c2                	cmp    %eax,%edx
c0103900:	74 28                	je     c010392a <schedule_process+0xe2>
c0103902:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103905:	05 00 10 00 00       	add    $0x1000,%eax
c010390a:	83 ec 0c             	sub    $0xc,%esp
c010390d:	50                   	push   %eax
c010390e:	e8 1a cb ff ff       	call   c010042d <update_tss>
c0103913:	83 c4 10             	add    $0x10,%esp
c0103916:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103919:	8b 40 08             	mov    0x8(%eax),%eax
c010391c:	83 ec 0c             	sub    $0xc,%esp
c010391f:	50                   	push   %eax
c0103920:	e8 fb ca ff ff       	call   c0100420 <update_cr3>
c0103925:	83 c4 10             	add    $0x10,%esp
c0103928:	eb 0f                	jmp    c0103939 <schedule_process+0xf1>
c010392a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010392d:	83 ec 0c             	sub    $0xc,%esp
c0103930:	50                   	push   %eax
c0103931:	e8 ea ca ff ff       	call   c0100420 <update_cr3>
c0103936:	83 c4 10             	add    $0x10,%esp
c0103939:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010393c:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103941:	83 ec 08             	sub    $0x8,%esp
c0103944:	ff 75 e8             	pushl  -0x18(%ebp)
c0103947:	ff 75 f0             	pushl  -0x10(%ebp)
c010394a:	e8 c1 68 00 00       	call   c010a210 <switch_to>
c010394f:	83 c4 10             	add    $0x10,%esp
c0103952:	90                   	nop
c0103953:	c9                   	leave  
c0103954:	c3                   	ret    

c0103955 <clock_handler>:
c0103955:	55                   	push   %ebp
c0103956:	89 e5                	mov    %esp,%ebp
c0103958:	83 ec 18             	sub    $0x18,%esp
c010395b:	e8 dc ca ff ff       	call   c010043c <get_running_thread_pcb>
c0103960:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103963:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0103968:	85 c0                	test   %eax,%eax
c010396a:	74 0d                	je     c0103979 <clock_handler+0x24>
c010396c:	83 ec 0c             	sub    $0xc,%esp
c010396f:	6a 04                	push   $0x4
c0103971:	e8 29 60 00 00       	call   c010999f <inform_int>
c0103976:	83 c4 10             	add    $0x10,%esp
c0103979:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010397e:	83 f8 64             	cmp    $0x64,%eax
c0103981:	75 0c                	jne    c010398f <clock_handler+0x3a>
c0103983:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c010398a:	00 00 00 
c010398d:	eb 0a                	jmp    c0103999 <clock_handler+0x44>
c010398f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103994:	83 f8 01             	cmp    $0x1,%eax
c0103997:	75 2a                	jne    c01039c3 <clock_handler+0x6e>
c0103999:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010399c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c01039a2:	85 c0                	test   %eax,%eax
c01039a4:	74 16                	je     c01039bc <clock_handler+0x67>
c01039a6:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c01039ab:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01039b1:	83 ea 01             	sub    $0x1,%edx
c01039b4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01039ba:	eb 08                	jmp    c01039c4 <clock_handler+0x6f>
c01039bc:	e8 87 fe ff ff       	call   c0103848 <schedule_process>
c01039c1:	eb 01                	jmp    c01039c4 <clock_handler+0x6f>
c01039c3:	90                   	nop
c01039c4:	c9                   	leave  
c01039c5:	c3                   	ret    

c01039c6 <pid2proc>:
c01039c6:	55                   	push   %ebp
c01039c7:	89 e5                	mov    %esp,%ebp
c01039c9:	83 ec 20             	sub    $0x20,%esp
c01039cc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01039d3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01039da:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c01039df:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c01039e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01039e8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01039eb:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c01039f0:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c01039f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01039f9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01039fc:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103a01:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a04:	eb 36                	jmp    c0103a3c <pid2proc+0x76>
c0103a06:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a09:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103a0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a11:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103a15:	75 07                	jne    c0103a1e <pid2proc+0x58>
c0103a17:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c0103a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a21:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103a27:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a2a:	39 c2                	cmp    %eax,%edx
c0103a2c:	75 05                	jne    c0103a33 <pid2proc+0x6d>
c0103a2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a31:	eb 17                	jmp    c0103a4a <pid2proc+0x84>
c0103a33:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a36:	8b 40 04             	mov    0x4(%eax),%eax
c0103a39:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a3c:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103a43:	75 c1                	jne    c0103a06 <pid2proc+0x40>
c0103a45:	b8 00 00 00 00       	mov    $0x0,%eax
c0103a4a:	c9                   	leave  
c0103a4b:	c3                   	ret    

c0103a4c <proc2pid>:
c0103a4c:	55                   	push   %ebp
c0103a4d:	89 e5                	mov    %esp,%ebp
c0103a4f:	83 ec 10             	sub    $0x10,%esp
c0103a52:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a55:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0103a5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a61:	c9                   	leave  
c0103a62:	c3                   	ret    

c0103a63 <InitDescriptor>:
c0103a63:	55                   	push   %ebp
c0103a64:	89 e5                	mov    %esp,%ebp
c0103a66:	83 ec 04             	sub    $0x4,%esp
c0103a69:	8b 45 14             	mov    0x14(%ebp),%eax
c0103a6c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103a70:	8b 45 10             	mov    0x10(%ebp),%eax
c0103a73:	89 c2                	mov    %eax,%edx
c0103a75:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a78:	66 89 10             	mov    %dx,(%eax)
c0103a7b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a7e:	89 c2                	mov    %eax,%edx
c0103a80:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a83:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103a87:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a8a:	c1 e8 10             	shr    $0x10,%eax
c0103a8d:	89 c2                	mov    %eax,%edx
c0103a8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a92:	88 50 04             	mov    %dl,0x4(%eax)
c0103a95:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103a99:	89 c2                	mov    %eax,%edx
c0103a9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a9e:	88 50 05             	mov    %dl,0x5(%eax)
c0103aa1:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103aa5:	66 c1 e8 08          	shr    $0x8,%ax
c0103aa9:	c1 e0 04             	shl    $0x4,%eax
c0103aac:	89 c2                	mov    %eax,%edx
c0103aae:	8b 45 10             	mov    0x10(%ebp),%eax
c0103ab1:	c1 e8 10             	shr    $0x10,%eax
c0103ab4:	83 e0 0f             	and    $0xf,%eax
c0103ab7:	09 c2                	or     %eax,%edx
c0103ab9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103abc:	88 50 06             	mov    %dl,0x6(%eax)
c0103abf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ac2:	c1 e8 18             	shr    $0x18,%eax
c0103ac5:	89 c2                	mov    %eax,%edx
c0103ac7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103aca:	88 50 07             	mov    %dl,0x7(%eax)
c0103acd:	90                   	nop
c0103ace:	c9                   	leave  
c0103acf:	c3                   	ret    

c0103ad0 <Seg2PhyAddr>:
c0103ad0:	55                   	push   %ebp
c0103ad1:	89 e5                	mov    %esp,%ebp
c0103ad3:	83 ec 10             	sub    $0x10,%esp
c0103ad6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ad9:	c1 e8 03             	shr    $0x3,%eax
c0103adc:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103ae3:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c0103aea:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103aed:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103af0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103af4:	0f b7 c0             	movzwl %ax,%eax
c0103af7:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103afb:	0f b6 d2             	movzbl %dl,%edx
c0103afe:	c1 e2 10             	shl    $0x10,%edx
c0103b01:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103b07:	09 d0                	or     %edx,%eax
c0103b09:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103b0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b0f:	c9                   	leave  
c0103b10:	c3                   	ret    

c0103b11 <Seg2PhyAddrLDT>:
c0103b11:	55                   	push   %ebp
c0103b12:	89 e5                	mov    %esp,%ebp
c0103b14:	83 ec 10             	sub    $0x10,%esp
c0103b17:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b1a:	c1 e8 03             	shr    $0x3,%eax
c0103b1d:	89 c2                	mov    %eax,%edx
c0103b1f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b22:	83 c2 20             	add    $0x20,%edx
c0103b25:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103b29:	8b 02                	mov    (%edx),%eax
c0103b2b:	8b 52 04             	mov    0x4(%edx),%edx
c0103b2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103b31:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103b34:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103b38:	0f b7 c0             	movzwl %ax,%eax
c0103b3b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103b3f:	0f b6 d2             	movzbl %dl,%edx
c0103b42:	c1 e2 10             	shl    $0x10,%edx
c0103b45:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103b4b:	09 d0                	or     %edx,%eax
c0103b4d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103b50:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b53:	c9                   	leave  
c0103b54:	c3                   	ret    

c0103b55 <VirAddr2PhyAddr>:
c0103b55:	55                   	push   %ebp
c0103b56:	89 e5                	mov    %esp,%ebp
c0103b58:	83 ec 10             	sub    $0x10,%esp
c0103b5b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103b5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b61:	01 d0                	add    %edx,%eax
c0103b63:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103b66:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b69:	c9                   	leave  
c0103b6a:	c3                   	ret    

c0103b6b <v2l>:
c0103b6b:	55                   	push   %ebp
c0103b6c:	89 e5                	mov    %esp,%ebp
c0103b6e:	83 ec 18             	sub    $0x18,%esp
c0103b71:	83 ec 0c             	sub    $0xc,%esp
c0103b74:	ff 75 08             	pushl  0x8(%ebp)
c0103b77:	e8 4a fe ff ff       	call   c01039c6 <pid2proc>
c0103b7c:	83 c4 10             	add    $0x10,%esp
c0103b7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103b82:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103b89:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103b8c:	83 ec 08             	sub    $0x8,%esp
c0103b8f:	ff 75 f4             	pushl  -0xc(%ebp)
c0103b92:	50                   	push   %eax
c0103b93:	e8 79 ff ff ff       	call   c0103b11 <Seg2PhyAddrLDT>
c0103b98:	83 c4 10             	add    $0x10,%esp
c0103b9b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103b9e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103ba1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ba4:	01 d0                	add    %edx,%eax
c0103ba6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103ba9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103bac:	c9                   	leave  
c0103bad:	c3                   	ret    

c0103bae <init_propt>:
c0103bae:	55                   	push   %ebp
c0103baf:	89 e5                	mov    %esp,%ebp
c0103bb1:	83 ec 38             	sub    $0x38,%esp
c0103bb4:	6a 0e                	push   $0xe
c0103bb6:	6a 08                	push   $0x8
c0103bb8:	68 be 01 10 c0       	push   $0xc01001be
c0103bbd:	6a 20                	push   $0x20
c0103bbf:	e8 6b 01 00 00       	call   c0103d2f <InitInterruptDesc>
c0103bc4:	83 c4 10             	add    $0x10,%esp
c0103bc7:	6a 0e                	push   $0xe
c0103bc9:	6a 08                	push   $0x8
c0103bcb:	68 ee 01 10 c0       	push   $0xc01001ee
c0103bd0:	6a 21                	push   $0x21
c0103bd2:	e8 58 01 00 00       	call   c0103d2f <InitInterruptDesc>
c0103bd7:	83 c4 10             	add    $0x10,%esp
c0103bda:	6a 0e                	push   $0xe
c0103bdc:	6a 08                	push   $0x8
c0103bde:	68 31 02 10 c0       	push   $0xc0100231
c0103be3:	6a 2e                	push   $0x2e
c0103be5:	e8 45 01 00 00       	call   c0103d2f <InitInterruptDesc>
c0103bea:	83 c4 10             	add    $0x10,%esp
c0103bed:	6a 0e                	push   $0xe
c0103bef:	6a 08                	push   $0x8
c0103bf1:	68 77 02 10 c0       	push   $0xc0100277
c0103bf6:	6a 2a                	push   $0x2a
c0103bf8:	e8 32 01 00 00       	call   c0103d2f <InitInterruptDesc>
c0103bfd:	83 c4 10             	add    $0x10,%esp
c0103c00:	83 ec 04             	sub    $0x4,%esp
c0103c03:	68 e0 15 00 00       	push   $0x15e0
c0103c08:	6a 00                	push   $0x0
c0103c0a:	68 00 22 18 c0       	push   $0xc0182200
c0103c0f:	e8 9b 85 00 00       	call   c010c1af <Memset>
c0103c14:	83 c4 10             	add    $0x10,%esp
c0103c17:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103c1e:	83 ec 04             	sub    $0x4,%esp
c0103c21:	ff 75 f4             	pushl  -0xc(%ebp)
c0103c24:	6a 00                	push   $0x0
c0103c26:	68 40 06 11 c0       	push   $0xc0110640
c0103c2b:	e8 7f 85 00 00       	call   c010c1af <Memset>
c0103c30:	83 c4 10             	add    $0x10,%esp
c0103c33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103c36:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103c3b:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103c42:	00 00 00 
c0103c45:	83 ec 0c             	sub    $0xc,%esp
c0103c48:	6a 30                	push   $0x30
c0103c4a:	e8 81 fe ff ff       	call   c0103ad0 <Seg2PhyAddr>
c0103c4f:	83 c4 10             	add    $0x10,%esp
c0103c52:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103c55:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103c5c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103c63:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c66:	0f b7 d0             	movzwl %ax,%edx
c0103c69:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103c6c:	83 e8 01             	sub    $0x1,%eax
c0103c6f:	89 c1                	mov    %eax,%ecx
c0103c71:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103c74:	52                   	push   %edx
c0103c75:	51                   	push   %ecx
c0103c76:	50                   	push   %eax
c0103c77:	68 00 f8 10 c0       	push   $0xc010f800
c0103c7c:	e8 e2 fd ff ff       	call   c0103a63 <InitDescriptor>
c0103c81:	83 c4 10             	add    $0x10,%esp
c0103c84:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103c8b:	68 f2 00 00 00       	push   $0xf2
c0103c90:	68 ff ff 00 00       	push   $0xffff
c0103c95:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103c98:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103c9d:	e8 c1 fd ff ff       	call   c0103a63 <InitDescriptor>
c0103ca2:	83 c4 10             	add    $0x10,%esp
c0103ca5:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103cac:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103cb3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103cba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103cbd:	0f b7 c0             	movzwl %ax,%eax
c0103cc0:	50                   	push   %eax
c0103cc1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103cc4:	6a 00                	push   $0x0
c0103cc6:	68 08 f8 10 c0       	push   $0xc010f808
c0103ccb:	e8 93 fd ff ff       	call   c0103a63 <InitDescriptor>
c0103cd0:	83 c4 10             	add    $0x10,%esp
c0103cd3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103cd6:	0f b7 c0             	movzwl %ax,%eax
c0103cd9:	50                   	push   %eax
c0103cda:	ff 75 d8             	pushl  -0x28(%ebp)
c0103cdd:	6a 00                	push   $0x0
c0103cdf:	68 10 f8 10 c0       	push   $0xc010f810
c0103ce4:	e8 7a fd ff ff       	call   c0103a63 <InitDescriptor>
c0103ce9:	83 c4 10             	add    $0x10,%esp
c0103cec:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103cf3:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103cfa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103cfd:	0f b7 c0             	movzwl %ax,%eax
c0103d00:	50                   	push   %eax
c0103d01:	ff 75 d8             	pushl  -0x28(%ebp)
c0103d04:	6a 00                	push   $0x0
c0103d06:	68 18 f8 10 c0       	push   $0xc010f818
c0103d0b:	e8 53 fd ff ff       	call   c0103a63 <InitDescriptor>
c0103d10:	83 c4 10             	add    $0x10,%esp
c0103d13:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103d16:	0f b7 c0             	movzwl %ax,%eax
c0103d19:	50                   	push   %eax
c0103d1a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103d1d:	6a 00                	push   $0x0
c0103d1f:	68 20 f8 10 c0       	push   $0xc010f820
c0103d24:	e8 3a fd ff ff       	call   c0103a63 <InitDescriptor>
c0103d29:	83 c4 10             	add    $0x10,%esp
c0103d2c:	90                   	nop
c0103d2d:	c9                   	leave  
c0103d2e:	c3                   	ret    

c0103d2f <InitInterruptDesc>:
c0103d2f:	55                   	push   %ebp
c0103d30:	89 e5                	mov    %esp,%ebp
c0103d32:	83 ec 10             	sub    $0x10,%esp
c0103d35:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d38:	c1 e0 03             	shl    $0x3,%eax
c0103d3b:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103d40:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103d43:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103d46:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103d4a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d4d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103d50:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103d53:	89 c2                	mov    %eax,%edx
c0103d55:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103d58:	66 89 10             	mov    %dx,(%eax)
c0103d5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103d5e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103d64:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103d67:	c1 f8 10             	sar    $0x10,%eax
c0103d6a:	89 c2                	mov    %eax,%edx
c0103d6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103d6f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103d73:	8b 45 10             	mov    0x10(%ebp),%eax
c0103d76:	c1 e0 04             	shl    $0x4,%eax
c0103d79:	89 c2                	mov    %eax,%edx
c0103d7b:	8b 45 14             	mov    0x14(%ebp),%eax
c0103d7e:	09 d0                	or     %edx,%eax
c0103d80:	89 c2                	mov    %eax,%edx
c0103d82:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103d85:	88 50 05             	mov    %dl,0x5(%eax)
c0103d88:	90                   	nop
c0103d89:	c9                   	leave  
c0103d8a:	c3                   	ret    

c0103d8b <ReloadGDT>:
c0103d8b:	55                   	push   %ebp
c0103d8c:	89 e5                	mov    %esp,%ebp
c0103d8e:	83 ec 28             	sub    $0x28,%esp
c0103d91:	b8 d0 06 11 c0       	mov    $0xc01106d0,%eax
c0103d96:	0f b7 00             	movzwl (%eax),%eax
c0103d99:	98                   	cwtl   
c0103d9a:	ba d2 06 11 c0       	mov    $0xc01106d2,%edx
c0103d9f:	8b 12                	mov    (%edx),%edx
c0103da1:	83 ec 04             	sub    $0x4,%esp
c0103da4:	50                   	push   %eax
c0103da5:	52                   	push   %edx
c0103da6:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103dab:	e8 d1 83 00 00       	call   c010c181 <Memcpy2>
c0103db0:	83 c4 10             	add    $0x10,%esp
c0103db3:	c7 45 f0 d0 06 11 c0 	movl   $0xc01106d0,-0x10(%ebp)
c0103dba:	c7 45 ec d2 06 11 c0 	movl   $0xc01106d2,-0x14(%ebp)
c0103dc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103dc4:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103dc9:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103dce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103dd1:	89 10                	mov    %edx,(%eax)
c0103dd3:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103dda:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103de1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103de4:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103de9:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103dee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103df1:	89 10                	mov    %edx,(%eax)
c0103df3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103dfa:	eb 04                	jmp    c0103e00 <ReloadGDT+0x75>
c0103dfc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103e00:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103e07:	7e f3                	jle    c0103dfc <ReloadGDT+0x71>
c0103e09:	e8 a9 37 00 00       	call   c01075b7 <init_internal_interrupt>
c0103e0e:	e8 9b fd ff ff       	call   c0103bae <init_propt>
c0103e13:	90                   	nop
c0103e14:	c9                   	leave  
c0103e15:	c3                   	ret    

c0103e16 <select_console>:
c0103e16:	55                   	push   %ebp
c0103e17:	89 e5                	mov    %esp,%ebp
c0103e19:	83 ec 18             	sub    $0x18,%esp
c0103e1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e1f:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103e22:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103e26:	75 27                	jne    c0103e4f <select_console+0x39>
c0103e28:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103e2c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103e32:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103e37:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103e3c:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103e41:	83 ec 0c             	sub    $0xc,%esp
c0103e44:	50                   	push   %eax
c0103e45:	e8 08 00 00 00       	call   c0103e52 <flush>
c0103e4a:	83 c4 10             	add    $0x10,%esp
c0103e4d:	eb 01                	jmp    c0103e50 <select_console+0x3a>
c0103e4f:	90                   	nop
c0103e50:	c9                   	leave  
c0103e51:	c3                   	ret    

c0103e52 <flush>:
c0103e52:	55                   	push   %ebp
c0103e53:	89 e5                	mov    %esp,%ebp
c0103e55:	83 ec 08             	sub    $0x8,%esp
c0103e58:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e5b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e61:	8b 40 0c             	mov    0xc(%eax),%eax
c0103e64:	83 ec 0c             	sub    $0xc,%esp
c0103e67:	50                   	push   %eax
c0103e68:	e8 1e 00 00 00       	call   c0103e8b <set_cursor>
c0103e6d:	83 c4 10             	add    $0x10,%esp
c0103e70:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e73:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e79:	8b 40 08             	mov    0x8(%eax),%eax
c0103e7c:	83 ec 0c             	sub    $0xc,%esp
c0103e7f:	50                   	push   %eax
c0103e80:	e8 64 00 00 00       	call   c0103ee9 <set_console_start_video_addr>
c0103e85:	83 c4 10             	add    $0x10,%esp
c0103e88:	90                   	nop
c0103e89:	c9                   	leave  
c0103e8a:	c3                   	ret    

c0103e8b <set_cursor>:
c0103e8b:	55                   	push   %ebp
c0103e8c:	89 e5                	mov    %esp,%ebp
c0103e8e:	83 ec 08             	sub    $0x8,%esp
c0103e91:	83 ec 08             	sub    $0x8,%esp
c0103e94:	6a 0e                	push   $0xe
c0103e96:	68 d4 03 00 00       	push   $0x3d4
c0103e9b:	e8 9e c4 ff ff       	call   c010033e <out_byte>
c0103ea0:	83 c4 10             	add    $0x10,%esp
c0103ea3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ea6:	c1 e8 08             	shr    $0x8,%eax
c0103ea9:	0f b7 c0             	movzwl %ax,%eax
c0103eac:	83 ec 08             	sub    $0x8,%esp
c0103eaf:	50                   	push   %eax
c0103eb0:	68 d5 03 00 00       	push   $0x3d5
c0103eb5:	e8 84 c4 ff ff       	call   c010033e <out_byte>
c0103eba:	83 c4 10             	add    $0x10,%esp
c0103ebd:	83 ec 08             	sub    $0x8,%esp
c0103ec0:	6a 0f                	push   $0xf
c0103ec2:	68 d4 03 00 00       	push   $0x3d4
c0103ec7:	e8 72 c4 ff ff       	call   c010033e <out_byte>
c0103ecc:	83 c4 10             	add    $0x10,%esp
c0103ecf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ed2:	0f b7 c0             	movzwl %ax,%eax
c0103ed5:	83 ec 08             	sub    $0x8,%esp
c0103ed8:	50                   	push   %eax
c0103ed9:	68 d5 03 00 00       	push   $0x3d5
c0103ede:	e8 5b c4 ff ff       	call   c010033e <out_byte>
c0103ee3:	83 c4 10             	add    $0x10,%esp
c0103ee6:	90                   	nop
c0103ee7:	c9                   	leave  
c0103ee8:	c3                   	ret    

c0103ee9 <set_console_start_video_addr>:
c0103ee9:	55                   	push   %ebp
c0103eea:	89 e5                	mov    %esp,%ebp
c0103eec:	83 ec 08             	sub    $0x8,%esp
c0103eef:	83 ec 08             	sub    $0x8,%esp
c0103ef2:	6a 0c                	push   $0xc
c0103ef4:	68 d4 03 00 00       	push   $0x3d4
c0103ef9:	e8 40 c4 ff ff       	call   c010033e <out_byte>
c0103efe:	83 c4 10             	add    $0x10,%esp
c0103f01:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f04:	c1 e8 08             	shr    $0x8,%eax
c0103f07:	0f b7 c0             	movzwl %ax,%eax
c0103f0a:	83 ec 08             	sub    $0x8,%esp
c0103f0d:	50                   	push   %eax
c0103f0e:	68 d5 03 00 00       	push   $0x3d5
c0103f13:	e8 26 c4 ff ff       	call   c010033e <out_byte>
c0103f18:	83 c4 10             	add    $0x10,%esp
c0103f1b:	83 ec 08             	sub    $0x8,%esp
c0103f1e:	6a 0d                	push   $0xd
c0103f20:	68 d4 03 00 00       	push   $0x3d4
c0103f25:	e8 14 c4 ff ff       	call   c010033e <out_byte>
c0103f2a:	83 c4 10             	add    $0x10,%esp
c0103f2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f30:	0f b7 c0             	movzwl %ax,%eax
c0103f33:	83 ec 08             	sub    $0x8,%esp
c0103f36:	50                   	push   %eax
c0103f37:	68 d5 03 00 00       	push   $0x3d5
c0103f3c:	e8 fd c3 ff ff       	call   c010033e <out_byte>
c0103f41:	83 c4 10             	add    $0x10,%esp
c0103f44:	90                   	nop
c0103f45:	c9                   	leave  
c0103f46:	c3                   	ret    

c0103f47 <put_key>:
c0103f47:	55                   	push   %ebp
c0103f48:	89 e5                	mov    %esp,%ebp
c0103f4a:	83 ec 04             	sub    $0x4,%esp
c0103f4d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103f50:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103f53:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f56:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103f5c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103f61:	77 4d                	ja     c0103fb0 <put_key+0x69>
c0103f63:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f66:	8b 00                	mov    (%eax),%eax
c0103f68:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103f6c:	89 10                	mov    %edx,(%eax)
c0103f6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f71:	8b 00                	mov    (%eax),%eax
c0103f73:	8d 50 04             	lea    0x4(%eax),%edx
c0103f76:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f79:	89 10                	mov    %edx,(%eax)
c0103f7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f7e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103f84:	8d 50 01             	lea    0x1(%eax),%edx
c0103f87:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f8a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103f90:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f93:	8b 00                	mov    (%eax),%eax
c0103f95:	8b 55 08             	mov    0x8(%ebp),%edx
c0103f98:	83 c2 08             	add    $0x8,%edx
c0103f9b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103fa1:	39 d0                	cmp    %edx,%eax
c0103fa3:	75 0b                	jne    c0103fb0 <put_key+0x69>
c0103fa5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fa8:	8d 50 08             	lea    0x8(%eax),%edx
c0103fab:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fae:	89 10                	mov    %edx,(%eax)
c0103fb0:	90                   	nop
c0103fb1:	c9                   	leave  
c0103fb2:	c3                   	ret    

c0103fb3 <scroll_up>:
c0103fb3:	55                   	push   %ebp
c0103fb4:	89 e5                	mov    %esp,%ebp
c0103fb6:	83 ec 08             	sub    $0x8,%esp
c0103fb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fbc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fc2:	8b 40 08             	mov    0x8(%eax),%eax
c0103fc5:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103fc8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fcb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fd1:	8b 00                	mov    (%eax),%eax
c0103fd3:	39 c2                	cmp    %eax,%edx
c0103fd5:	76 1b                	jbe    c0103ff2 <scroll_up+0x3f>
c0103fd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fda:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fe0:	8b 40 08             	mov    0x8(%eax),%eax
c0103fe3:	83 e8 50             	sub    $0x50,%eax
c0103fe6:	83 ec 0c             	sub    $0xc,%esp
c0103fe9:	50                   	push   %eax
c0103fea:	e8 fa fe ff ff       	call   c0103ee9 <set_console_start_video_addr>
c0103fef:	83 c4 10             	add    $0x10,%esp
c0103ff2:	90                   	nop
c0103ff3:	c9                   	leave  
c0103ff4:	c3                   	ret    

c0103ff5 <scroll_down>:
c0103ff5:	55                   	push   %ebp
c0103ff6:	89 e5                	mov    %esp,%ebp
c0103ff8:	83 ec 08             	sub    $0x8,%esp
c0103ffb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ffe:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104004:	8b 40 08             	mov    0x8(%eax),%eax
c0104007:	8d 48 50             	lea    0x50(%eax),%ecx
c010400a:	8b 45 08             	mov    0x8(%ebp),%eax
c010400d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104013:	8b 10                	mov    (%eax),%edx
c0104015:	8b 45 08             	mov    0x8(%ebp),%eax
c0104018:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010401e:	8b 40 04             	mov    0x4(%eax),%eax
c0104021:	01 d0                	add    %edx,%eax
c0104023:	39 c1                	cmp    %eax,%ecx
c0104025:	73 36                	jae    c010405d <scroll_down+0x68>
c0104027:	8b 45 08             	mov    0x8(%ebp),%eax
c010402a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104030:	8b 40 08             	mov    0x8(%eax),%eax
c0104033:	83 c0 50             	add    $0x50,%eax
c0104036:	83 ec 0c             	sub    $0xc,%esp
c0104039:	50                   	push   %eax
c010403a:	e8 aa fe ff ff       	call   c0103ee9 <set_console_start_video_addr>
c010403f:	83 c4 10             	add    $0x10,%esp
c0104042:	8b 45 08             	mov    0x8(%ebp),%eax
c0104045:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010404b:	8b 50 08             	mov    0x8(%eax),%edx
c010404e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104051:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104057:	83 c2 50             	add    $0x50,%edx
c010405a:	89 50 08             	mov    %edx,0x8(%eax)
c010405d:	90                   	nop
c010405e:	c9                   	leave  
c010405f:	c3                   	ret    

c0104060 <out_char>:
c0104060:	55                   	push   %ebp
c0104061:	89 e5                	mov    %esp,%ebp
c0104063:	83 ec 28             	sub    $0x28,%esp
c0104066:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104069:	88 45 e4             	mov    %al,-0x1c(%ebp)
c010406c:	e8 a7 2d 00 00       	call   c0106e18 <intr_disable>
c0104071:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104074:	8b 45 08             	mov    0x8(%ebp),%eax
c0104077:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010407d:	8b 40 0c             	mov    0xc(%eax),%eax
c0104080:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0104085:	01 c0                	add    %eax,%eax
c0104087:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010408a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c010408e:	83 f8 08             	cmp    $0x8,%eax
c0104091:	0f 84 8d 00 00 00    	je     c0104124 <out_char+0xc4>
c0104097:	83 f8 0a             	cmp    $0xa,%eax
c010409a:	0f 85 c9 00 00 00    	jne    c0104169 <out_char+0x109>
c01040a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01040a3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040a9:	8b 50 0c             	mov    0xc(%eax),%edx
c01040ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01040af:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040b5:	8b 08                	mov    (%eax),%ecx
c01040b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ba:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040c0:	8b 40 04             	mov    0x4(%eax),%eax
c01040c3:	01 c8                	add    %ecx,%eax
c01040c5:	83 e8 50             	sub    $0x50,%eax
c01040c8:	39 c2                	cmp    %eax,%edx
c01040ca:	0f 83 f4 00 00 00    	jae    c01041c4 <out_char+0x164>
c01040d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01040d3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040d9:	8b 08                	mov    (%eax),%ecx
c01040db:	8b 45 08             	mov    0x8(%ebp),%eax
c01040de:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040e4:	8b 50 0c             	mov    0xc(%eax),%edx
c01040e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ea:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040f0:	8b 00                	mov    (%eax),%eax
c01040f2:	29 c2                	sub    %eax,%edx
c01040f4:	89 d0                	mov    %edx,%eax
c01040f6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c01040fb:	f7 e2                	mul    %edx
c01040fd:	89 d0                	mov    %edx,%eax
c01040ff:	c1 e8 06             	shr    $0x6,%eax
c0104102:	8d 50 01             	lea    0x1(%eax),%edx
c0104105:	89 d0                	mov    %edx,%eax
c0104107:	c1 e0 02             	shl    $0x2,%eax
c010410a:	01 d0                	add    %edx,%eax
c010410c:	c1 e0 04             	shl    $0x4,%eax
c010410f:	89 c2                	mov    %eax,%edx
c0104111:	8b 45 08             	mov    0x8(%ebp),%eax
c0104114:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010411a:	01 ca                	add    %ecx,%edx
c010411c:	89 50 0c             	mov    %edx,0xc(%eax)
c010411f:	e9 a0 00 00 00       	jmp    c01041c4 <out_char+0x164>
c0104124:	8b 45 08             	mov    0x8(%ebp),%eax
c0104127:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010412d:	8b 50 0c             	mov    0xc(%eax),%edx
c0104130:	8b 45 08             	mov    0x8(%ebp),%eax
c0104133:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104139:	8b 00                	mov    (%eax),%eax
c010413b:	39 c2                	cmp    %eax,%edx
c010413d:	0f 86 84 00 00 00    	jbe    c01041c7 <out_char+0x167>
c0104143:	8b 45 08             	mov    0x8(%ebp),%eax
c0104146:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010414c:	8b 50 0c             	mov    0xc(%eax),%edx
c010414f:	83 ea 01             	sub    $0x1,%edx
c0104152:	89 50 0c             	mov    %edx,0xc(%eax)
c0104155:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104158:	83 e8 02             	sub    $0x2,%eax
c010415b:	c6 00 20             	movb   $0x20,(%eax)
c010415e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104161:	83 e8 01             	sub    $0x1,%eax
c0104164:	c6 00 00             	movb   $0x0,(%eax)
c0104167:	eb 5e                	jmp    c01041c7 <out_char+0x167>
c0104169:	8b 45 08             	mov    0x8(%ebp),%eax
c010416c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104172:	8b 40 0c             	mov    0xc(%eax),%eax
c0104175:	8d 48 01             	lea    0x1(%eax),%ecx
c0104178:	8b 45 08             	mov    0x8(%ebp),%eax
c010417b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104181:	8b 10                	mov    (%eax),%edx
c0104183:	8b 45 08             	mov    0x8(%ebp),%eax
c0104186:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010418c:	8b 40 04             	mov    0x4(%eax),%eax
c010418f:	01 d0                	add    %edx,%eax
c0104191:	39 c1                	cmp    %eax,%ecx
c0104193:	73 35                	jae    c01041ca <out_char+0x16a>
c0104195:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104198:	8d 50 01             	lea    0x1(%eax),%edx
c010419b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010419e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c01041a2:	88 10                	mov    %dl,(%eax)
c01041a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01041a7:	8d 50 01             	lea    0x1(%eax),%edx
c01041aa:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01041ad:	c6 00 0a             	movb   $0xa,(%eax)
c01041b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01041b3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041b9:	8b 50 0c             	mov    0xc(%eax),%edx
c01041bc:	83 c2 01             	add    $0x1,%edx
c01041bf:	89 50 0c             	mov    %edx,0xc(%eax)
c01041c2:	eb 06                	jmp    c01041ca <out_char+0x16a>
c01041c4:	90                   	nop
c01041c5:	eb 14                	jmp    c01041db <out_char+0x17b>
c01041c7:	90                   	nop
c01041c8:	eb 11                	jmp    c01041db <out_char+0x17b>
c01041ca:	90                   	nop
c01041cb:	eb 0e                	jmp    c01041db <out_char+0x17b>
c01041cd:	83 ec 0c             	sub    $0xc,%esp
c01041d0:	ff 75 08             	pushl  0x8(%ebp)
c01041d3:	e8 1d fe ff ff       	call   c0103ff5 <scroll_down>
c01041d8:	83 c4 10             	add    $0x10,%esp
c01041db:	8b 45 08             	mov    0x8(%ebp),%eax
c01041de:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041e4:	8b 50 0c             	mov    0xc(%eax),%edx
c01041e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ea:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041f0:	8b 40 08             	mov    0x8(%eax),%eax
c01041f3:	29 c2                	sub    %eax,%edx
c01041f5:	89 d0                	mov    %edx,%eax
c01041f7:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c01041fc:	77 cf                	ja     c01041cd <out_char+0x16d>
c01041fe:	83 ec 0c             	sub    $0xc,%esp
c0104201:	ff 75 08             	pushl  0x8(%ebp)
c0104204:	e8 49 fc ff ff       	call   c0103e52 <flush>
c0104209:	83 c4 10             	add    $0x10,%esp
c010420c:	83 ec 0c             	sub    $0xc,%esp
c010420f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104212:	e8 2a 2c 00 00       	call   c0106e41 <intr_set_status>
c0104217:	83 c4 10             	add    $0x10,%esp
c010421a:	90                   	nop
c010421b:	c9                   	leave  
c010421c:	c3                   	ret    

c010421d <tty_dev_read>:
c010421d:	55                   	push   %ebp
c010421e:	89 e5                	mov    %esp,%ebp
c0104220:	83 ec 08             	sub    $0x8,%esp
c0104223:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104228:	39 45 08             	cmp    %eax,0x8(%ebp)
c010422b:	75 17                	jne    c0104244 <tty_dev_read+0x27>
c010422d:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104232:	85 c0                	test   %eax,%eax
c0104234:	7e 0e                	jle    c0104244 <tty_dev_read+0x27>
c0104236:	83 ec 0c             	sub    $0xc,%esp
c0104239:	ff 75 08             	pushl  0x8(%ebp)
c010423c:	e8 89 07 00 00       	call   c01049ca <keyboard_read>
c0104241:	83 c4 10             	add    $0x10,%esp
c0104244:	90                   	nop
c0104245:	c9                   	leave  
c0104246:	c3                   	ret    

c0104247 <tty_dev_write>:
c0104247:	55                   	push   %ebp
c0104248:	89 e5                	mov    %esp,%ebp
c010424a:	83 ec 28             	sub    $0x28,%esp
c010424d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104250:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104256:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104259:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104260:	e9 88 01 00 00       	jmp    c01043ed <tty_dev_write+0x1a6>
c0104265:	8b 45 08             	mov    0x8(%ebp),%eax
c0104268:	8b 40 04             	mov    0x4(%eax),%eax
c010426b:	8b 00                	mov    (%eax),%eax
c010426d:	88 45 e7             	mov    %al,-0x19(%ebp)
c0104270:	8b 45 08             	mov    0x8(%ebp),%eax
c0104273:	8b 40 04             	mov    0x4(%eax),%eax
c0104276:	8d 50 04             	lea    0x4(%eax),%edx
c0104279:	8b 45 08             	mov    0x8(%ebp),%eax
c010427c:	89 50 04             	mov    %edx,0x4(%eax)
c010427f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104282:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104288:	8d 50 ff             	lea    -0x1(%eax),%edx
c010428b:	8b 45 08             	mov    0x8(%ebp),%eax
c010428e:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104294:	8b 45 08             	mov    0x8(%ebp),%eax
c0104297:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010429d:	8d 50 01             	lea    0x1(%eax),%edx
c01042a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a3:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01042a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01042ac:	8b 40 04             	mov    0x4(%eax),%eax
c01042af:	8b 55 08             	mov    0x8(%ebp),%edx
c01042b2:	83 c2 08             	add    $0x8,%edx
c01042b5:	81 c2 00 08 00 00    	add    $0x800,%edx
c01042bb:	39 d0                	cmp    %edx,%eax
c01042bd:	75 0c                	jne    c01042cb <tty_dev_write+0x84>
c01042bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01042c2:	8d 50 08             	lea    0x8(%eax),%edx
c01042c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01042c8:	89 50 04             	mov    %edx,0x4(%eax)
c01042cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01042ce:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01042d4:	85 c0                	test   %eax,%eax
c01042d6:	0f 84 11 01 00 00    	je     c01043ed <tty_dev_write+0x1a6>
c01042dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042e0:	3c 20                	cmp    $0x20,%al
c01042e2:	76 08                	jbe    c01042ec <tty_dev_write+0xa5>
c01042e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042e8:	3c 7e                	cmp    $0x7e,%al
c01042ea:	76 10                	jbe    c01042fc <tty_dev_write+0xb5>
c01042ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042f0:	3c 20                	cmp    $0x20,%al
c01042f2:	74 08                	je     c01042fc <tty_dev_write+0xb5>
c01042f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042f8:	84 c0                	test   %al,%al
c01042fa:	75 58                	jne    c0104354 <tty_dev_write+0x10d>
c01042fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01042ff:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104305:	8b 45 08             	mov    0x8(%ebp),%eax
c0104308:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010430e:	01 d0                	add    %edx,%eax
c0104310:	83 e8 01             	sub    $0x1,%eax
c0104313:	89 c2                	mov    %eax,%edx
c0104315:	83 ec 04             	sub    $0x4,%esp
c0104318:	6a 01                	push   $0x1
c010431a:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010431d:	50                   	push   %eax
c010431e:	52                   	push   %edx
c010431f:	e8 58 2b 00 00       	call   c0106e7c <Memcpy>
c0104324:	83 c4 10             	add    $0x10,%esp
c0104327:	8b 45 08             	mov    0x8(%ebp),%eax
c010432a:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104330:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104333:	8b 45 08             	mov    0x8(%ebp),%eax
c0104336:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c010433c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104340:	0f b6 c0             	movzbl %al,%eax
c0104343:	83 ec 08             	sub    $0x8,%esp
c0104346:	50                   	push   %eax
c0104347:	ff 75 08             	pushl  0x8(%ebp)
c010434a:	e8 11 fd ff ff       	call   c0104060 <out_char>
c010434f:	83 c4 10             	add    $0x10,%esp
c0104352:	eb 7c                	jmp    c01043d0 <tty_dev_write+0x189>
c0104354:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104358:	3c 08                	cmp    $0x8,%al
c010435a:	75 42                	jne    c010439e <tty_dev_write+0x157>
c010435c:	8b 45 08             	mov    0x8(%ebp),%eax
c010435f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104365:	8d 50 01             	lea    0x1(%eax),%edx
c0104368:	8b 45 08             	mov    0x8(%ebp),%eax
c010436b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104371:	8b 45 08             	mov    0x8(%ebp),%eax
c0104374:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010437a:	8d 50 fe             	lea    -0x2(%eax),%edx
c010437d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104380:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104386:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010438a:	0f b6 c0             	movzbl %al,%eax
c010438d:	83 ec 08             	sub    $0x8,%esp
c0104390:	50                   	push   %eax
c0104391:	ff 75 08             	pushl  0x8(%ebp)
c0104394:	e8 c7 fc ff ff       	call   c0104060 <out_char>
c0104399:	83 c4 10             	add    $0x10,%esp
c010439c:	eb 32                	jmp    c01043d0 <tty_dev_write+0x189>
c010439e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043a2:	3c 0a                	cmp    $0xa,%al
c01043a4:	75 2a                	jne    c01043d0 <tty_dev_write+0x189>
c01043a6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043aa:	0f b6 c0             	movzbl %al,%eax
c01043ad:	83 ec 08             	sub    $0x8,%esp
c01043b0:	50                   	push   %eax
c01043b1:	ff 75 08             	pushl  0x8(%ebp)
c01043b4:	e8 a7 fc ff ff       	call   c0104060 <out_char>
c01043b9:	83 c4 10             	add    $0x10,%esp
c01043bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01043bf:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c01043c6:	00 00 00 
c01043c9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01043d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01043d3:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01043d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01043dc:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c01043e2:	39 c2                	cmp    %eax,%edx
c01043e4:	75 07                	jne    c01043ed <tty_dev_write+0x1a6>
c01043e6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01043ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01043f0:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01043f6:	85 c0                	test   %eax,%eax
c01043f8:	0f 85 67 fe ff ff    	jne    c0104265 <tty_dev_write+0x1e>
c01043fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104402:	74 6d                	je     c0104471 <tty_dev_write+0x22a>
c0104404:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c010440b:	83 ec 0c             	sub    $0xc,%esp
c010440e:	ff 75 ec             	pushl  -0x14(%ebp)
c0104411:	e8 b6 d3 ff ff       	call   c01017cc <sys_malloc>
c0104416:	83 c4 10             	add    $0x10,%esp
c0104419:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010441c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010441f:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104426:	8b 45 08             	mov    0x8(%ebp),%eax
c0104429:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010442f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104432:	89 50 60             	mov    %edx,0x60(%eax)
c0104435:	8b 45 08             	mov    0x8(%ebp),%eax
c0104438:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010443e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104441:	89 50 68             	mov    %edx,0x68(%eax)
c0104444:	8b 45 08             	mov    0x8(%ebp),%eax
c0104447:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010444d:	83 ec 04             	sub    $0x4,%esp
c0104450:	50                   	push   %eax
c0104451:	ff 75 e8             	pushl  -0x18(%ebp)
c0104454:	6a 01                	push   $0x1
c0104456:	e8 aa 52 00 00       	call   c0109705 <send_rec>
c010445b:	83 c4 10             	add    $0x10,%esp
c010445e:	83 ec 08             	sub    $0x8,%esp
c0104461:	ff 75 ec             	pushl  -0x14(%ebp)
c0104464:	ff 75 e8             	pushl  -0x18(%ebp)
c0104467:	e8 75 d3 ff ff       	call   c01017e1 <sys_free>
c010446c:	83 c4 10             	add    $0x10,%esp
c010446f:	eb 01                	jmp    c0104472 <tty_dev_write+0x22b>
c0104471:	90                   	nop
c0104472:	c9                   	leave  
c0104473:	c3                   	ret    

c0104474 <tty_do_read>:
c0104474:	55                   	push   %ebp
c0104475:	89 e5                	mov    %esp,%ebp
c0104477:	83 ec 08             	sub    $0x8,%esp
c010447a:	8b 45 08             	mov    0x8(%ebp),%eax
c010447d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104484:	00 00 00 
c0104487:	8b 45 0c             	mov    0xc(%ebp),%eax
c010448a:	8b 50 68             	mov    0x68(%eax),%edx
c010448d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104490:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104496:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104499:	8b 00                	mov    (%eax),%eax
c010449b:	89 c2                	mov    %eax,%edx
c010449d:	8b 45 08             	mov    0x8(%ebp),%eax
c01044a0:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c01044a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01044a9:	8b 50 60             	mov    0x60(%eax),%edx
c01044ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01044af:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01044b5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01044b8:	8b 50 60             	mov    0x60(%eax),%edx
c01044bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01044be:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c01044c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01044c7:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c01044cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01044d0:	8b 40 10             	mov    0x10(%eax),%eax
c01044d3:	83 ec 08             	sub    $0x8,%esp
c01044d6:	52                   	push   %edx
c01044d7:	50                   	push   %eax
c01044d8:	e8 32 1b 00 00       	call   c010600f <alloc_virtual_memory>
c01044dd:	83 c4 10             	add    $0x10,%esp
c01044e0:	89 c2                	mov    %eax,%edx
c01044e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01044e5:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c01044eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01044ee:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01044f4:	83 f8 02             	cmp    $0x2,%eax
c01044f7:	74 1c                	je     c0104515 <tty_do_read+0xa1>
c01044f9:	68 3b 01 00 00       	push   $0x13b
c01044fe:	68 e5 b4 10 c0       	push   $0xc010b4e5
c0104503:	68 e5 b4 10 c0       	push   $0xc010b4e5
c0104508:	68 ef b4 10 c0       	push   $0xc010b4ef
c010450d:	e8 83 45 00 00       	call   c0108a95 <assertion_failure>
c0104512:	83 c4 10             	add    $0x10,%esp
c0104515:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104518:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010451f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104522:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104528:	83 ec 04             	sub    $0x4,%esp
c010452b:	50                   	push   %eax
c010452c:	ff 75 0c             	pushl  0xc(%ebp)
c010452f:	6a 01                	push   $0x1
c0104531:	e8 cf 51 00 00       	call   c0109705 <send_rec>
c0104536:	83 c4 10             	add    $0x10,%esp
c0104539:	90                   	nop
c010453a:	c9                   	leave  
c010453b:	c3                   	ret    

c010453c <tty_do_write>:
c010453c:	55                   	push   %ebp
c010453d:	89 e5                	mov    %esp,%ebp
c010453f:	53                   	push   %ebx
c0104540:	83 ec 24             	sub    $0x24,%esp
c0104543:	89 e0                	mov    %esp,%eax
c0104545:	89 c3                	mov    %eax,%ebx
c0104547:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010454e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104551:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104554:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104557:	89 c2                	mov    %eax,%edx
c0104559:	b8 10 00 00 00       	mov    $0x10,%eax
c010455e:	83 e8 01             	sub    $0x1,%eax
c0104561:	01 d0                	add    %edx,%eax
c0104563:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104568:	ba 00 00 00 00       	mov    $0x0,%edx
c010456d:	f7 f1                	div    %ecx
c010456f:	6b c0 10             	imul   $0x10,%eax,%eax
c0104572:	29 c4                	sub    %eax,%esp
c0104574:	89 e0                	mov    %esp,%eax
c0104576:	83 c0 00             	add    $0x0,%eax
c0104579:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010457c:	83 ec 04             	sub    $0x4,%esp
c010457f:	ff 75 e8             	pushl  -0x18(%ebp)
c0104582:	6a 00                	push   $0x0
c0104584:	ff 75 e0             	pushl  -0x20(%ebp)
c0104587:	e8 23 7c 00 00       	call   c010c1af <Memset>
c010458c:	83 c4 10             	add    $0x10,%esp
c010458f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104592:	8b 40 60             	mov    0x60(%eax),%eax
c0104595:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104598:	8b 45 08             	mov    0x8(%ebp),%eax
c010459b:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01045a2:	00 00 00 
c01045a5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01045a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01045ab:	8b 40 10             	mov    0x10(%eax),%eax
c01045ae:	83 ec 08             	sub    $0x8,%esp
c01045b1:	52                   	push   %edx
c01045b2:	50                   	push   %eax
c01045b3:	e8 57 1a 00 00       	call   c010600f <alloc_virtual_memory>
c01045b8:	83 c4 10             	add    $0x10,%esp
c01045bb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01045be:	eb 7e                	jmp    c010463e <tty_do_write+0x102>
c01045c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01045c3:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01045c6:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c01045ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01045cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01045d0:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01045d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01045d9:	01 d0                	add    %edx,%eax
c01045db:	83 ec 04             	sub    $0x4,%esp
c01045de:	ff 75 f0             	pushl  -0x10(%ebp)
c01045e1:	50                   	push   %eax
c01045e2:	ff 75 e0             	pushl  -0x20(%ebp)
c01045e5:	e8 92 28 00 00       	call   c0106e7c <Memcpy>
c01045ea:	83 c4 10             	add    $0x10,%esp
c01045ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01045f0:	29 45 ec             	sub    %eax,-0x14(%ebp)
c01045f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01045f6:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01045fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01045ff:	01 c2                	add    %eax,%edx
c0104601:	8b 45 08             	mov    0x8(%ebp),%eax
c0104604:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c010460a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104611:	eb 25                	jmp    c0104638 <tty_do_write+0xfc>
c0104613:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104616:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104619:	01 d0                	add    %edx,%eax
c010461b:	0f b6 00             	movzbl (%eax),%eax
c010461e:	0f b6 c0             	movzbl %al,%eax
c0104621:	83 ec 08             	sub    $0x8,%esp
c0104624:	50                   	push   %eax
c0104625:	ff 75 08             	pushl  0x8(%ebp)
c0104628:	e8 33 fa ff ff       	call   c0104060 <out_char>
c010462d:	83 c4 10             	add    $0x10,%esp
c0104630:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104634:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104638:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010463c:	75 d5                	jne    c0104613 <tty_do_write+0xd7>
c010463e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0104642:	0f 85 78 ff ff ff    	jne    c01045c0 <tty_do_write+0x84>
c0104648:	83 ec 0c             	sub    $0xc,%esp
c010464b:	6a 7c                	push   $0x7c
c010464d:	e8 7a d1 ff ff       	call   c01017cc <sys_malloc>
c0104652:	83 c4 10             	add    $0x10,%esp
c0104655:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104658:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010465b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104662:	8b 45 08             	mov    0x8(%ebp),%eax
c0104665:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010466b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010466e:	89 50 58             	mov    %edx,0x58(%eax)
c0104671:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104674:	8b 00                	mov    (%eax),%eax
c0104676:	83 ec 04             	sub    $0x4,%esp
c0104679:	50                   	push   %eax
c010467a:	ff 75 d8             	pushl  -0x28(%ebp)
c010467d:	6a 01                	push   $0x1
c010467f:	e8 81 50 00 00       	call   c0109705 <send_rec>
c0104684:	83 c4 10             	add    $0x10,%esp
c0104687:	83 ec 08             	sub    $0x8,%esp
c010468a:	6a 7c                	push   $0x7c
c010468c:	ff 75 d8             	pushl  -0x28(%ebp)
c010468f:	e8 4d d1 ff ff       	call   c01017e1 <sys_free>
c0104694:	83 c4 10             	add    $0x10,%esp
c0104697:	89 dc                	mov    %ebx,%esp
c0104699:	90                   	nop
c010469a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010469d:	c9                   	leave  
c010469e:	c3                   	ret    

c010469f <init_screen>:
c010469f:	55                   	push   %ebp
c01046a0:	89 e5                	mov    %esp,%ebp
c01046a2:	83 ec 10             	sub    $0x10,%esp
c01046a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01046a8:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01046ad:	c1 f8 03             	sar    $0x3,%eax
c01046b0:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01046b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01046b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01046bc:	c1 e0 04             	shl    $0x4,%eax
c01046bf:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c01046c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01046c8:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c01046ce:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c01046d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01046d8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01046de:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01046e1:	89 50 04             	mov    %edx,0x4(%eax)
c01046e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01046e7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01046ed:	8b 50 04             	mov    0x4(%eax),%edx
c01046f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01046f3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01046f9:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c01046fd:	89 10                	mov    %edx,(%eax)
c01046ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0104702:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104708:	8b 45 08             	mov    0x8(%ebp),%eax
c010470b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104711:	8b 12                	mov    (%edx),%edx
c0104713:	89 50 08             	mov    %edx,0x8(%eax)
c0104716:	8b 55 08             	mov    0x8(%ebp),%edx
c0104719:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010471f:	8b 40 08             	mov    0x8(%eax),%eax
c0104722:	89 42 0c             	mov    %eax,0xc(%edx)
c0104725:	90                   	nop
c0104726:	c9                   	leave  
c0104727:	c3                   	ret    

c0104728 <init_tty>:
c0104728:	55                   	push   %ebp
c0104729:	89 e5                	mov    %esp,%ebp
c010472b:	83 ec 18             	sub    $0x18,%esp
c010472e:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104735:	e9 92 00 00 00       	jmp    c01047cc <init_tty+0xa4>
c010473a:	83 ec 04             	sub    $0x4,%esp
c010473d:	68 28 08 00 00       	push   $0x828
c0104742:	6a 00                	push   $0x0
c0104744:	ff 75 f4             	pushl  -0xc(%ebp)
c0104747:	e8 63 7a 00 00       	call   c010c1af <Memset>
c010474c:	83 c4 10             	add    $0x10,%esp
c010474f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104752:	8d 50 08             	lea    0x8(%eax),%edx
c0104755:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104758:	89 50 04             	mov    %edx,0x4(%eax)
c010475b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010475e:	8b 50 04             	mov    0x4(%eax),%edx
c0104761:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104764:	89 10                	mov    %edx,(%eax)
c0104766:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104769:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0104770:	00 00 00 
c0104773:	83 ec 0c             	sub    $0xc,%esp
c0104776:	ff 75 f4             	pushl  -0xc(%ebp)
c0104779:	e8 21 ff ff ff       	call   c010469f <init_screen>
c010477e:	83 c4 10             	add    $0x10,%esp
c0104781:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104784:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104789:	85 c0                	test   %eax,%eax
c010478b:	7e 38                	jle    c01047c5 <init_tty+0x9d>
c010478d:	83 ec 08             	sub    $0x8,%esp
c0104790:	6a 23                	push   $0x23
c0104792:	ff 75 f4             	pushl  -0xc(%ebp)
c0104795:	e8 c6 f8 ff ff       	call   c0104060 <out_char>
c010479a:	83 c4 10             	add    $0x10,%esp
c010479d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01047a0:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c01047a5:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01047aa:	c1 f8 03             	sar    $0x3,%eax
c01047ad:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01047b3:	0f b6 c0             	movzbl %al,%eax
c01047b6:	83 ec 08             	sub    $0x8,%esp
c01047b9:	50                   	push   %eax
c01047ba:	ff 75 f4             	pushl  -0xc(%ebp)
c01047bd:	e8 9e f8 ff ff       	call   c0104060 <out_char>
c01047c2:	83 c4 10             	add    $0x10,%esp
c01047c5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01047cc:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01047d1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01047d4:	0f 82 60 ff ff ff    	jb     c010473a <init_tty+0x12>
c01047da:	90                   	nop
c01047db:	c9                   	leave  
c01047dc:	c3                   	ret    

c01047dd <TaskTTY>:
c01047dd:	55                   	push   %ebp
c01047de:	89 e5                	mov    %esp,%ebp
c01047e0:	83 ec 28             	sub    $0x28,%esp
c01047e3:	e8 40 ff ff ff       	call   c0104728 <init_tty>
c01047e8:	83 ec 0c             	sub    $0xc,%esp
c01047eb:	6a 00                	push   $0x0
c01047ed:	e8 24 f6 ff ff       	call   c0103e16 <select_console>
c01047f2:	83 c4 10             	add    $0x10,%esp
c01047f5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01047fc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104803:	83 ec 0c             	sub    $0xc,%esp
c0104806:	6a 7c                	push   $0x7c
c0104808:	e8 bf cf ff ff       	call   c01017cc <sys_malloc>
c010480d:	83 c4 10             	add    $0x10,%esp
c0104810:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104813:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c010481a:	eb 30                	jmp    c010484c <TaskTTY+0x6f>
c010481c:	83 ec 0c             	sub    $0xc,%esp
c010481f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104822:	e8 f6 f9 ff ff       	call   c010421d <tty_dev_read>
c0104827:	83 c4 10             	add    $0x10,%esp
c010482a:	83 ec 0c             	sub    $0xc,%esp
c010482d:	ff 75 f4             	pushl  -0xc(%ebp)
c0104830:	e8 12 fa ff ff       	call   c0104247 <tty_dev_write>
c0104835:	83 c4 10             	add    $0x10,%esp
c0104838:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010483b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104841:	85 c0                	test   %eax,%eax
c0104843:	75 d7                	jne    c010481c <TaskTTY+0x3f>
c0104845:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010484c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104851:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104854:	72 c6                	jb     c010481c <TaskTTY+0x3f>
c0104856:	83 ec 04             	sub    $0x4,%esp
c0104859:	6a 12                	push   $0x12
c010485b:	ff 75 e8             	pushl  -0x18(%ebp)
c010485e:	6a 02                	push   $0x2
c0104860:	e8 a0 4e 00 00       	call   c0109705 <send_rec>
c0104865:	83 c4 10             	add    $0x10,%esp
c0104868:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010486b:	8b 40 78             	mov    0x78(%eax),%eax
c010486e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104871:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104878:	74 28                	je     c01048a2 <TaskTTY+0xc5>
c010487a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104881:	7f 0b                	jg     c010488e <TaskTTY+0xb1>
c0104883:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c010488a:	74 4e                	je     c01048da <TaskTTY+0xfd>
c010488c:	eb 4d                	jmp    c01048db <TaskTTY+0xfe>
c010488e:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104895:	74 21                	je     c01048b8 <TaskTTY+0xdb>
c0104897:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c010489e:	74 2e                	je     c01048ce <TaskTTY+0xf1>
c01048a0:	eb 39                	jmp    c01048db <TaskTTY+0xfe>
c01048a2:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01048a7:	83 ec 08             	sub    $0x8,%esp
c01048aa:	ff 75 e8             	pushl  -0x18(%ebp)
c01048ad:	50                   	push   %eax
c01048ae:	e8 c1 fb ff ff       	call   c0104474 <tty_do_read>
c01048b3:	83 c4 10             	add    $0x10,%esp
c01048b6:	eb 23                	jmp    c01048db <TaskTTY+0xfe>
c01048b8:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01048bd:	83 ec 08             	sub    $0x8,%esp
c01048c0:	ff 75 e8             	pushl  -0x18(%ebp)
c01048c3:	50                   	push   %eax
c01048c4:	e8 73 fc ff ff       	call   c010453c <tty_do_write>
c01048c9:	83 c4 10             	add    $0x10,%esp
c01048cc:	eb 0d                	jmp    c01048db <TaskTTY+0xfe>
c01048ce:	c7 05 c4 06 11 c0 00 	movl   $0x0,0xc01106c4
c01048d5:	00 00 00 
c01048d8:	eb 01                	jmp    c01048db <TaskTTY+0xfe>
c01048da:	90                   	nop
c01048db:	e9 33 ff ff ff       	jmp    c0104813 <TaskTTY+0x36>

c01048e0 <keyboard_handler>:
c01048e0:	55                   	push   %ebp
c01048e1:	89 e5                	mov    %esp,%ebp
c01048e3:	83 ec 18             	sub    $0x18,%esp
c01048e6:	c7 05 c4 06 11 c0 01 	movl   $0x1,0xc01106c4
c01048ed:	00 00 00 
c01048f0:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c01048f7:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01048fc:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104901:	7f 5e                	jg     c0104961 <keyboard_handler+0x81>
c0104903:	e8 58 ba ff ff       	call   c0100360 <disable_int>
c0104908:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010490b:	0f b7 c0             	movzwl %ax,%eax
c010490e:	83 ec 0c             	sub    $0xc,%esp
c0104911:	50                   	push   %eax
c0104912:	e8 1b ba ff ff       	call   c0100332 <in_byte>
c0104917:	83 c4 10             	add    $0x10,%esp
c010491a:	88 45 f3             	mov    %al,-0xd(%ebp)
c010491d:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104922:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104926:	88 10                	mov    %dl,(%eax)
c0104928:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010492d:	83 c0 01             	add    $0x1,%eax
c0104930:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104935:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010493a:	83 c0 01             	add    $0x1,%eax
c010493d:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104942:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104947:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c010494c:	39 d0                	cmp    %edx,%eax
c010494e:	72 0a                	jb     c010495a <keyboard_handler+0x7a>
c0104950:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104957:	fb 10 c0 
c010495a:	e8 03 ba ff ff       	call   c0100362 <enable_int>
c010495f:	eb 01                	jmp    c0104962 <keyboard_handler+0x82>
c0104961:	90                   	nop
c0104962:	c9                   	leave  
c0104963:	c3                   	ret    

c0104964 <read_from_keyboard_buf>:
c0104964:	55                   	push   %ebp
c0104965:	89 e5                	mov    %esp,%ebp
c0104967:	83 ec 18             	sub    $0x18,%esp
c010496a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c010496e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104973:	85 c0                	test   %eax,%eax
c0104975:	7f 06                	jg     c010497d <read_from_keyboard_buf+0x19>
c0104977:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c010497b:	eb 4b                	jmp    c01049c8 <read_from_keyboard_buf+0x64>
c010497d:	e8 de b9 ff ff       	call   c0100360 <disable_int>
c0104982:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104987:	0f b6 00             	movzbl (%eax),%eax
c010498a:	88 45 f7             	mov    %al,-0x9(%ebp)
c010498d:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104992:	83 c0 01             	add    $0x1,%eax
c0104995:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010499a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010499f:	83 e8 01             	sub    $0x1,%eax
c01049a2:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01049a7:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01049ac:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01049b1:	39 d0                	cmp    %edx,%eax
c01049b3:	72 0a                	jb     c01049bf <read_from_keyboard_buf+0x5b>
c01049b5:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c01049bc:	fb 10 c0 
c01049bf:	e8 9e b9 ff ff       	call   c0100362 <enable_int>
c01049c4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01049c8:	c9                   	leave  
c01049c9:	c3                   	ret    

c01049ca <keyboard_read>:
c01049ca:	55                   	push   %ebp
c01049cb:	89 e5                	mov    %esp,%ebp
c01049cd:	83 ec 28             	sub    $0x28,%esp
c01049d0:	90                   	nop
c01049d1:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01049d6:	85 c0                	test   %eax,%eax
c01049d8:	7e f7                	jle    c01049d1 <keyboard_read+0x7>
c01049da:	e8 85 ff ff ff       	call   c0104964 <read_from_keyboard_buf>
c01049df:	88 45 ea             	mov    %al,-0x16(%ebp)
c01049e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01049e9:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01049ed:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c01049f1:	75 5a                	jne    c0104a4d <keyboard_read+0x83>
c01049f3:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c01049f7:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c01049fb:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c01049ff:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104a03:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104a07:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0104a0b:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0104a0f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104a16:	eb 20                	jmp    c0104a38 <keyboard_read+0x6e>
c0104a18:	e8 47 ff ff ff       	call   c0104964 <read_from_keyboard_buf>
c0104a1d:	89 c1                	mov    %eax,%ecx
c0104a1f:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104a22:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104a25:	01 d0                	add    %edx,%eax
c0104a27:	0f b6 00             	movzbl (%eax),%eax
c0104a2a:	38 c1                	cmp    %al,%cl
c0104a2c:	74 06                	je     c0104a34 <keyboard_read+0x6a>
c0104a2e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0104a32:	eb 0a                	jmp    c0104a3e <keyboard_read+0x74>
c0104a34:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104a38:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0104a3c:	7e da                	jle    c0104a18 <keyboard_read+0x4e>
c0104a3e:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0104a42:	74 68                	je     c0104aac <keyboard_read+0xe2>
c0104a44:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0104a4b:	eb 5f                	jmp    c0104aac <keyboard_read+0xe2>
c0104a4d:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104a51:	75 59                	jne    c0104aac <keyboard_read+0xe2>
c0104a53:	e8 0c ff ff ff       	call   c0104964 <read_from_keyboard_buf>
c0104a58:	3c 2a                	cmp    $0x2a,%al
c0104a5a:	75 1d                	jne    c0104a79 <keyboard_read+0xaf>
c0104a5c:	e8 03 ff ff ff       	call   c0104964 <read_from_keyboard_buf>
c0104a61:	3c e0                	cmp    $0xe0,%al
c0104a63:	75 14                	jne    c0104a79 <keyboard_read+0xaf>
c0104a65:	e8 fa fe ff ff       	call   c0104964 <read_from_keyboard_buf>
c0104a6a:	3c 37                	cmp    $0x37,%al
c0104a6c:	75 0b                	jne    c0104a79 <keyboard_read+0xaf>
c0104a6e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104a75:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104a79:	e8 e6 fe ff ff       	call   c0104964 <read_from_keyboard_buf>
c0104a7e:	3c b7                	cmp    $0xb7,%al
c0104a80:	75 1d                	jne    c0104a9f <keyboard_read+0xd5>
c0104a82:	e8 dd fe ff ff       	call   c0104964 <read_from_keyboard_buf>
c0104a87:	3c e0                	cmp    $0xe0,%al
c0104a89:	75 14                	jne    c0104a9f <keyboard_read+0xd5>
c0104a8b:	e8 d4 fe ff ff       	call   c0104964 <read_from_keyboard_buf>
c0104a90:	3c aa                	cmp    $0xaa,%al
c0104a92:	75 0b                	jne    c0104a9f <keyboard_read+0xd5>
c0104a94:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104a9b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0104a9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104aa3:	75 07                	jne    c0104aac <keyboard_read+0xe2>
c0104aa5:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c0104aac:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104ab3:	0f 84 8d 00 00 00    	je     c0104b46 <keyboard_read+0x17c>
c0104ab9:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0104ac0:	0f 84 80 00 00 00    	je     c0104b46 <keyboard_read+0x17c>
c0104ac6:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0104aca:	0f 94 c2             	sete   %dl
c0104acd:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104ad1:	0f 94 c0             	sete   %al
c0104ad4:	09 d0                	or     %edx,%eax
c0104ad6:	84 c0                	test   %al,%al
c0104ad8:	74 07                	je     c0104ae1 <keyboard_read+0x117>
c0104ada:	c6 05 cc 06 11 c0 01 	movb   $0x1,0xc01106cc
c0104ae1:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104ae5:	f7 d0                	not    %eax
c0104ae7:	c0 e8 07             	shr    $0x7,%al
c0104aea:	88 45 e9             	mov    %al,-0x17(%ebp)
c0104aed:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104af1:	74 53                	je     c0104b46 <keyboard_read+0x17c>
c0104af3:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104af7:	74 4d                	je     c0104b46 <keyboard_read+0x17c>
c0104af9:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0104afd:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104b04:	3c 01                	cmp    $0x1,%al
c0104b06:	75 04                	jne    c0104b0c <keyboard_read+0x142>
c0104b08:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104b0c:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104b13:	84 c0                	test   %al,%al
c0104b15:	74 04                	je     c0104b1b <keyboard_read+0x151>
c0104b17:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104b1b:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0104b1f:	89 d0                	mov    %edx,%eax
c0104b21:	01 c0                	add    %eax,%eax
c0104b23:	01 c2                	add    %eax,%edx
c0104b25:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104b29:	01 d0                	add    %edx,%eax
c0104b2b:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c0104b32:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104b35:	83 ec 08             	sub    $0x8,%esp
c0104b38:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b3b:	ff 75 08             	pushl  0x8(%ebp)
c0104b3e:	e8 1a 00 00 00       	call   c0104b5d <in_process>
c0104b43:	83 c4 10             	add    $0x10,%esp
c0104b46:	90                   	nop
c0104b47:	c9                   	leave  
c0104b48:	c3                   	ret    

c0104b49 <init_keyboard_handler>:
c0104b49:	55                   	push   %ebp
c0104b4a:	89 e5                	mov    %esp,%ebp
c0104b4c:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104b53:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104b5a:	90                   	nop
c0104b5b:	5d                   	pop    %ebp
c0104b5c:	c3                   	ret    

c0104b5d <in_process>:
c0104b5d:	55                   	push   %ebp
c0104b5e:	89 e5                	mov    %esp,%ebp
c0104b60:	83 ec 18             	sub    $0x18,%esp
c0104b63:	83 ec 04             	sub    $0x4,%esp
c0104b66:	6a 02                	push   $0x2
c0104b68:	6a 00                	push   $0x0
c0104b6a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0104b6d:	50                   	push   %eax
c0104b6e:	e8 3c 76 00 00       	call   c010c1af <Memset>
c0104b73:	83 c4 10             	add    $0x10,%esp
c0104b76:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104b79:	25 00 01 00 00       	and    $0x100,%eax
c0104b7e:	85 c0                	test   %eax,%eax
c0104b80:	75 28                	jne    c0104baa <in_process+0x4d>
c0104b82:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104b85:	0f b6 c0             	movzbl %al,%eax
c0104b88:	83 ec 08             	sub    $0x8,%esp
c0104b8b:	50                   	push   %eax
c0104b8c:	ff 75 08             	pushl  0x8(%ebp)
c0104b8f:	e8 b3 f3 ff ff       	call   c0103f47 <put_key>
c0104b94:	83 c4 10             	add    $0x10,%esp
c0104b97:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104b9e:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104ba5:	e9 42 01 00 00       	jmp    c0104cec <in_process+0x18f>
c0104baa:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104bb1:	84 c0                	test   %al,%al
c0104bb3:	0f 84 a9 00 00 00    	je     c0104c62 <in_process+0x105>
c0104bb9:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104bbd:	0f 84 9f 00 00 00    	je     c0104c62 <in_process+0x105>
c0104bc3:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104bc7:	0f 84 95 00 00 00    	je     c0104c62 <in_process+0x105>
c0104bcd:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104bd4:	74 64                	je     c0104c3a <in_process+0xdd>
c0104bd6:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104bdd:	77 0b                	ja     c0104bea <in_process+0x8d>
c0104bdf:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104be6:	74 64                	je     c0104c4c <in_process+0xef>
c0104be8:	eb 73                	jmp    c0104c5d <in_process+0x100>
c0104bea:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104bf1:	74 0b                	je     c0104bfe <in_process+0xa1>
c0104bf3:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104bfa:	74 20                	je     c0104c1c <in_process+0xbf>
c0104bfc:	eb 5f                	jmp    c0104c5d <in_process+0x100>
c0104bfe:	83 ec 0c             	sub    $0xc,%esp
c0104c01:	ff 75 08             	pushl  0x8(%ebp)
c0104c04:	e8 aa f3 ff ff       	call   c0103fb3 <scroll_up>
c0104c09:	83 c4 10             	add    $0x10,%esp
c0104c0c:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104c13:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104c1a:	eb 41                	jmp    c0104c5d <in_process+0x100>
c0104c1c:	83 ec 0c             	sub    $0xc,%esp
c0104c1f:	ff 75 08             	pushl  0x8(%ebp)
c0104c22:	e8 ce f3 ff ff       	call   c0103ff5 <scroll_down>
c0104c27:	83 c4 10             	add    $0x10,%esp
c0104c2a:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104c31:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104c38:	eb 23                	jmp    c0104c5d <in_process+0x100>
c0104c3a:	83 ec 08             	sub    $0x8,%esp
c0104c3d:	6a 0a                	push   $0xa
c0104c3f:	ff 75 08             	pushl  0x8(%ebp)
c0104c42:	e8 19 f4 ff ff       	call   c0104060 <out_char>
c0104c47:	83 c4 10             	add    $0x10,%esp
c0104c4a:	eb 11                	jmp    c0104c5d <in_process+0x100>
c0104c4c:	83 ec 08             	sub    $0x8,%esp
c0104c4f:	6a 08                	push   $0x8
c0104c51:	ff 75 08             	pushl  0x8(%ebp)
c0104c54:	e8 07 f4 ff ff       	call   c0104060 <out_char>
c0104c59:	83 c4 10             	add    $0x10,%esp
c0104c5c:	90                   	nop
c0104c5d:	e9 8a 00 00 00       	jmp    c0104cec <in_process+0x18f>
c0104c62:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104c69:	74 55                	je     c0104cc0 <in_process+0x163>
c0104c6b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104c72:	77 14                	ja     c0104c88 <in_process+0x12b>
c0104c74:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104c7b:	74 31                	je     c0104cae <in_process+0x151>
c0104c7d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104c84:	74 16                	je     c0104c9c <in_process+0x13f>
c0104c86:	eb 64                	jmp    c0104cec <in_process+0x18f>
c0104c88:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104c8f:	74 3e                	je     c0104ccf <in_process+0x172>
c0104c91:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104c98:	74 44                	je     c0104cde <in_process+0x181>
c0104c9a:	eb 50                	jmp    c0104cec <in_process+0x18f>
c0104c9c:	83 ec 08             	sub    $0x8,%esp
c0104c9f:	6a 0a                	push   $0xa
c0104ca1:	ff 75 08             	pushl  0x8(%ebp)
c0104ca4:	e8 9e f2 ff ff       	call   c0103f47 <put_key>
c0104ca9:	83 c4 10             	add    $0x10,%esp
c0104cac:	eb 3e                	jmp    c0104cec <in_process+0x18f>
c0104cae:	83 ec 08             	sub    $0x8,%esp
c0104cb1:	6a 08                	push   $0x8
c0104cb3:	ff 75 08             	pushl  0x8(%ebp)
c0104cb6:	e8 8c f2 ff ff       	call   c0103f47 <put_key>
c0104cbb:	83 c4 10             	add    $0x10,%esp
c0104cbe:	eb 2c                	jmp    c0104cec <in_process+0x18f>
c0104cc0:	83 ec 0c             	sub    $0xc,%esp
c0104cc3:	6a 00                	push   $0x0
c0104cc5:	e8 4c f1 ff ff       	call   c0103e16 <select_console>
c0104cca:	83 c4 10             	add    $0x10,%esp
c0104ccd:	eb 1d                	jmp    c0104cec <in_process+0x18f>
c0104ccf:	83 ec 0c             	sub    $0xc,%esp
c0104cd2:	6a 01                	push   $0x1
c0104cd4:	e8 3d f1 ff ff       	call   c0103e16 <select_console>
c0104cd9:	83 c4 10             	add    $0x10,%esp
c0104cdc:	eb 0e                	jmp    c0104cec <in_process+0x18f>
c0104cde:	83 ec 0c             	sub    $0xc,%esp
c0104ce1:	6a 02                	push   $0x2
c0104ce3:	e8 2e f1 ff ff       	call   c0103e16 <select_console>
c0104ce8:	83 c4 10             	add    $0x10,%esp
c0104ceb:	90                   	nop
c0104cec:	90                   	nop
c0104ced:	c9                   	leave  
c0104cee:	c3                   	ret    

c0104cef <open>:
c0104cef:	55                   	push   %ebp
c0104cf0:	89 e5                	mov    %esp,%ebp
c0104cf2:	83 ec 18             	sub    $0x18,%esp
c0104cf5:	83 ec 0c             	sub    $0xc,%esp
c0104cf8:	6a 7c                	push   $0x7c
c0104cfa:	e8 cd ca ff ff       	call   c01017cc <sys_malloc>
c0104cff:	83 c4 10             	add    $0x10,%esp
c0104d02:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104d05:	83 ec 04             	sub    $0x4,%esp
c0104d08:	6a 7c                	push   $0x7c
c0104d0a:	6a 00                	push   $0x0
c0104d0c:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d0f:	e8 9b 74 00 00       	call   c010c1af <Memset>
c0104d14:	83 c4 10             	add    $0x10,%esp
c0104d17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d1a:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104d21:	83 ec 0c             	sub    $0xc,%esp
c0104d24:	ff 75 08             	pushl  0x8(%ebp)
c0104d27:	e8 32 14 00 00       	call   c010615e <get_physical_address>
c0104d2c:	83 c4 10             	add    $0x10,%esp
c0104d2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104d32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d35:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104d38:	89 50 44             	mov    %edx,0x44(%eax)
c0104d3b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104d3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d41:	89 50 74             	mov    %edx,0x74(%eax)
c0104d44:	83 ec 0c             	sub    $0xc,%esp
c0104d47:	ff 75 08             	pushl  0x8(%ebp)
c0104d4a:	e8 99 74 00 00       	call   c010c1e8 <Strlen>
c0104d4f:	83 c4 10             	add    $0x10,%esp
c0104d52:	89 c2                	mov    %eax,%edx
c0104d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d57:	89 50 40             	mov    %edx,0x40(%eax)
c0104d5a:	83 ec 04             	sub    $0x4,%esp
c0104d5d:	6a 02                	push   $0x2
c0104d5f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d62:	6a 03                	push   $0x3
c0104d64:	e8 9c 49 00 00       	call   c0109705 <send_rec>
c0104d69:	83 c4 10             	add    $0x10,%esp
c0104d6c:	83 ec 08             	sub    $0x8,%esp
c0104d6f:	6a 7c                	push   $0x7c
c0104d71:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d74:	e8 68 ca ff ff       	call   c01017e1 <sys_free>
c0104d79:	83 c4 10             	add    $0x10,%esp
c0104d7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d7f:	8b 40 50             	mov    0x50(%eax),%eax
c0104d82:	c9                   	leave  
c0104d83:	c3                   	ret    

c0104d84 <read>:
c0104d84:	55                   	push   %ebp
c0104d85:	89 e5                	mov    %esp,%ebp
c0104d87:	83 ec 38             	sub    $0x38,%esp
c0104d8a:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104d91:	83 ec 0c             	sub    $0xc,%esp
c0104d94:	ff 75 dc             	pushl  -0x24(%ebp)
c0104d97:	e8 30 ca ff ff       	call   c01017cc <sys_malloc>
c0104d9c:	83 c4 10             	add    $0x10,%esp
c0104d9f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104da2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104da5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104daa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104dad:	83 ec 0c             	sub    $0xc,%esp
c0104db0:	ff 75 0c             	pushl  0xc(%ebp)
c0104db3:	e8 a6 13 00 00       	call   c010615e <get_physical_address>
c0104db8:	83 c4 10             	add    $0x10,%esp
c0104dbb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104dbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dc1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104dc6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104dc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104dcc:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104dd1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104dd4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104ddb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104de2:	8b 55 10             	mov    0x10(%ebp),%edx
c0104de5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104de8:	01 d0                	add    %edx,%eax
c0104dea:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104ded:	0f 83 a8 00 00 00    	jae    c0104e9b <read+0x117>
c0104df3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104df6:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104df9:	05 00 10 00 00       	add    $0x1000,%eax
c0104dfe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104e01:	8b 45 10             	mov    0x10(%ebp),%eax
c0104e04:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104e07:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104e0a:	83 ec 04             	sub    $0x4,%esp
c0104e0d:	50                   	push   %eax
c0104e0e:	6a 00                	push   $0x0
c0104e10:	ff 75 d8             	pushl  -0x28(%ebp)
c0104e13:	e8 97 73 00 00       	call   c010c1af <Memset>
c0104e18:	83 c4 10             	add    $0x10,%esp
c0104e1b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e1e:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104e25:	8b 55 08             	mov    0x8(%ebp),%edx
c0104e28:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e2b:	89 50 50             	mov    %edx,0x50(%eax)
c0104e2e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e31:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104e34:	89 50 10             	mov    %edx,0x10(%eax)
c0104e37:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e3a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104e3d:	89 50 60             	mov    %edx,0x60(%eax)
c0104e40:	83 ec 04             	sub    $0x4,%esp
c0104e43:	6a 02                	push   $0x2
c0104e45:	ff 75 d8             	pushl  -0x28(%ebp)
c0104e48:	6a 03                	push   $0x3
c0104e4a:	e8 b6 48 00 00       	call   c0109705 <send_rec>
c0104e4f:	83 c4 10             	add    $0x10,%esp
c0104e52:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e55:	8b 40 60             	mov    0x60(%eax),%eax
c0104e58:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104e5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104e5e:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104e61:	8b 45 10             	mov    0x10(%ebp),%eax
c0104e64:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104e67:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104e6a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104e6d:	89 45 10             	mov    %eax,0x10(%ebp)
c0104e70:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104e77:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104e7e:	83 ec 0c             	sub    $0xc,%esp
c0104e81:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e84:	e8 d5 12 00 00       	call   c010615e <get_physical_address>
c0104e89:	83 c4 10             	add    $0x10,%esp
c0104e8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104e8f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104e93:	0f 85 6e ff ff ff    	jne    c0104e07 <read+0x83>
c0104e99:	eb 54                	jmp    c0104eef <read+0x16b>
c0104e9b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104e9e:	83 ec 04             	sub    $0x4,%esp
c0104ea1:	50                   	push   %eax
c0104ea2:	6a 00                	push   $0x0
c0104ea4:	ff 75 d8             	pushl  -0x28(%ebp)
c0104ea7:	e8 03 73 00 00       	call   c010c1af <Memset>
c0104eac:	83 c4 10             	add    $0x10,%esp
c0104eaf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104eb2:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104eb9:	8b 55 08             	mov    0x8(%ebp),%edx
c0104ebc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ebf:	89 50 50             	mov    %edx,0x50(%eax)
c0104ec2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ec5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ec8:	89 50 10             	mov    %edx,0x10(%eax)
c0104ecb:	8b 55 10             	mov    0x10(%ebp),%edx
c0104ece:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ed1:	89 50 60             	mov    %edx,0x60(%eax)
c0104ed4:	83 ec 04             	sub    $0x4,%esp
c0104ed7:	6a 02                	push   $0x2
c0104ed9:	ff 75 d8             	pushl  -0x28(%ebp)
c0104edc:	6a 03                	push   $0x3
c0104ede:	e8 22 48 00 00       	call   c0109705 <send_rec>
c0104ee3:	83 c4 10             	add    $0x10,%esp
c0104ee6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ee9:	8b 40 60             	mov    0x60(%eax),%eax
c0104eec:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104eef:	83 ec 08             	sub    $0x8,%esp
c0104ef2:	ff 75 dc             	pushl  -0x24(%ebp)
c0104ef5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104ef8:	e8 e4 c8 ff ff       	call   c01017e1 <sys_free>
c0104efd:	83 c4 10             	add    $0x10,%esp
c0104f00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f03:	c9                   	leave  
c0104f04:	c3                   	ret    

c0104f05 <write>:
c0104f05:	55                   	push   %ebp
c0104f06:	89 e5                	mov    %esp,%ebp
c0104f08:	83 ec 18             	sub    $0x18,%esp
c0104f0b:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104f12:	83 ec 0c             	sub    $0xc,%esp
c0104f15:	ff 75 f4             	pushl  -0xc(%ebp)
c0104f18:	e8 af c8 ff ff       	call   c01017cc <sys_malloc>
c0104f1d:	83 c4 10             	add    $0x10,%esp
c0104f20:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f23:	83 ec 0c             	sub    $0xc,%esp
c0104f26:	ff 75 0c             	pushl  0xc(%ebp)
c0104f29:	e8 30 12 00 00       	call   c010615e <get_physical_address>
c0104f2e:	83 c4 10             	add    $0x10,%esp
c0104f31:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104f34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f37:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104f3e:	8b 55 08             	mov    0x8(%ebp),%edx
c0104f41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f44:	89 50 50             	mov    %edx,0x50(%eax)
c0104f47:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f4a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104f4d:	89 50 10             	mov    %edx,0x10(%eax)
c0104f50:	8b 55 10             	mov    0x10(%ebp),%edx
c0104f53:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f56:	89 50 60             	mov    %edx,0x60(%eax)
c0104f59:	83 ec 04             	sub    $0x4,%esp
c0104f5c:	6a 02                	push   $0x2
c0104f5e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104f61:	6a 03                	push   $0x3
c0104f63:	e8 9d 47 00 00       	call   c0109705 <send_rec>
c0104f68:	83 c4 10             	add    $0x10,%esp
c0104f6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f6e:	8b 40 60             	mov    0x60(%eax),%eax
c0104f71:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104f74:	83 ec 08             	sub    $0x8,%esp
c0104f77:	ff 75 f4             	pushl  -0xc(%ebp)
c0104f7a:	ff 75 f0             	pushl  -0x10(%ebp)
c0104f7d:	e8 5f c8 ff ff       	call   c01017e1 <sys_free>
c0104f82:	83 c4 10             	add    $0x10,%esp
c0104f85:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f88:	c9                   	leave  
c0104f89:	c3                   	ret    

c0104f8a <close>:
c0104f8a:	55                   	push   %ebp
c0104f8b:	89 e5                	mov    %esp,%ebp
c0104f8d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f93:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104f9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f9d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104fa0:	83 ec 04             	sub    $0x4,%esp
c0104fa3:	6a 02                	push   $0x2
c0104fa5:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104fab:	50                   	push   %eax
c0104fac:	6a 03                	push   $0x3
c0104fae:	e8 52 47 00 00       	call   c0109705 <send_rec>
c0104fb3:	83 c4 10             	add    $0x10,%esp
c0104fb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104fb9:	83 f8 65             	cmp    $0x65,%eax
c0104fbc:	74 19                	je     c0104fd7 <close+0x4d>
c0104fbe:	6a 13                	push   $0x13
c0104fc0:	68 07 b5 10 c0       	push   $0xc010b507
c0104fc5:	68 07 b5 10 c0       	push   $0xc010b507
c0104fca:	68 13 b5 10 c0       	push   $0xc010b513
c0104fcf:	e8 c1 3a 00 00       	call   c0108a95 <assertion_failure>
c0104fd4:	83 c4 10             	add    $0x10,%esp
c0104fd7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104fda:	c9                   	leave  
c0104fdb:	c3                   	ret    

c0104fdc <wait>:
c0104fdc:	55                   	push   %ebp
c0104fdd:	89 e5                	mov    %esp,%ebp
c0104fdf:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104fe5:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104fec:	83 ec 04             	sub    $0x4,%esp
c0104fef:	6a 01                	push   $0x1
c0104ff1:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ff7:	50                   	push   %eax
c0104ff8:	6a 03                	push   $0x3
c0104ffa:	e8 06 47 00 00       	call   c0109705 <send_rec>
c0104fff:	83 c4 10             	add    $0x10,%esp
c0105002:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105005:	89 c2                	mov    %eax,%edx
c0105007:	8b 45 08             	mov    0x8(%ebp),%eax
c010500a:	89 10                	mov    %edx,(%eax)
c010500c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010500f:	83 f8 21             	cmp    $0x21,%eax
c0105012:	74 05                	je     c0105019 <wait+0x3d>
c0105014:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105017:	eb 05                	jmp    c010501e <wait+0x42>
c0105019:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010501e:	c9                   	leave  
c010501f:	c3                   	ret    

c0105020 <exit>:
c0105020:	55                   	push   %ebp
c0105021:	89 e5                	mov    %esp,%ebp
c0105023:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105029:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0105030:	8b 45 08             	mov    0x8(%ebp),%eax
c0105033:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105036:	83 ec 04             	sub    $0x4,%esp
c0105039:	6a 01                	push   $0x1
c010503b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105041:	50                   	push   %eax
c0105042:	6a 03                	push   $0x3
c0105044:	e8 bc 46 00 00       	call   c0109705 <send_rec>
c0105049:	83 c4 10             	add    $0x10,%esp
c010504c:	90                   	nop
c010504d:	c9                   	leave  
c010504e:	c3                   	ret    

c010504f <fork>:
c010504f:	55                   	push   %ebp
c0105050:	89 e5                	mov    %esp,%ebp
c0105052:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105058:	83 ec 04             	sub    $0x4,%esp
c010505b:	6a 7c                	push   $0x7c
c010505d:	6a 00                	push   $0x0
c010505f:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105065:	50                   	push   %eax
c0105066:	e8 44 71 00 00       	call   c010c1af <Memset>
c010506b:	83 c4 10             	add    $0x10,%esp
c010506e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0105075:	83 ec 04             	sub    $0x4,%esp
c0105078:	6a 01                	push   $0x1
c010507a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105080:	50                   	push   %eax
c0105081:	6a 03                	push   $0x3
c0105083:	e8 7d 46 00 00       	call   c0109705 <send_rec>
c0105088:	83 c4 10             	add    $0x10,%esp
c010508b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0105092:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105095:	c9                   	leave  
c0105096:	c3                   	ret    

c0105097 <getpid>:
c0105097:	55                   	push   %ebp
c0105098:	89 e5                	mov    %esp,%ebp
c010509a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01050a0:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c01050a7:	83 ec 04             	sub    $0x4,%esp
c01050aa:	6a 05                	push   $0x5
c01050ac:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01050b2:	50                   	push   %eax
c01050b3:	6a 03                	push   $0x3
c01050b5:	e8 4b 46 00 00       	call   c0109705 <send_rec>
c01050ba:	83 c4 10             	add    $0x10,%esp
c01050bd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01050c0:	c9                   	leave  
c01050c1:	c3                   	ret    

c01050c2 <exec>:
c01050c2:	55                   	push   %ebp
c01050c3:	89 e5                	mov    %esp,%ebp
c01050c5:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01050cb:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c01050d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01050d5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01050d8:	83 ec 0c             	sub    $0xc,%esp
c01050db:	ff 75 08             	pushl  0x8(%ebp)
c01050de:	e8 05 71 00 00       	call   c010c1e8 <Strlen>
c01050e3:	83 c4 10             	add    $0x10,%esp
c01050e6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01050e9:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c01050f0:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c01050f7:	83 ec 04             	sub    $0x4,%esp
c01050fa:	6a 01                	push   $0x1
c01050fc:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105102:	50                   	push   %eax
c0105103:	6a 03                	push   $0x3
c0105105:	e8 fb 45 00 00       	call   c0109705 <send_rec>
c010510a:	83 c4 10             	add    $0x10,%esp
c010510d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105110:	83 f8 65             	cmp    $0x65,%eax
c0105113:	74 19                	je     c010512e <exec+0x6c>
c0105115:	6a 19                	push   $0x19
c0105117:	68 2b b5 10 c0       	push   $0xc010b52b
c010511c:	68 2b b5 10 c0       	push   $0xc010b52b
c0105121:	68 36 b5 10 c0       	push   $0xc010b536
c0105126:	e8 6a 39 00 00       	call   c0108a95 <assertion_failure>
c010512b:	83 c4 10             	add    $0x10,%esp
c010512e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105131:	c9                   	leave  
c0105132:	c3                   	ret    

c0105133 <execv>:
c0105133:	55                   	push   %ebp
c0105134:	89 e5                	mov    %esp,%ebp
c0105136:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c010513c:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0105143:	83 ec 0c             	sub    $0xc,%esp
c0105146:	ff 75 e0             	pushl  -0x20(%ebp)
c0105149:	e8 7e c6 ff ff       	call   c01017cc <sys_malloc>
c010514e:	83 c4 10             	add    $0x10,%esp
c0105151:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105154:	66 87 db             	xchg   %bx,%bx
c0105157:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010515a:	83 ec 04             	sub    $0x4,%esp
c010515d:	50                   	push   %eax
c010515e:	6a 00                	push   $0x0
c0105160:	ff 75 dc             	pushl  -0x24(%ebp)
c0105163:	e8 47 70 00 00       	call   c010c1af <Memset>
c0105168:	83 c4 10             	add    $0x10,%esp
c010516b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010516e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105171:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105178:	eb 23                	jmp    c010519d <execv+0x6a>
c010517a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010517d:	8b 00                	mov    (%eax),%eax
c010517f:	83 ec 08             	sub    $0x8,%esp
c0105182:	50                   	push   %eax
c0105183:	68 4e b5 10 c0       	push   $0xc010b54e
c0105188:	e8 ab 35 00 00       	call   c0108738 <Printf>
c010518d:	83 c4 10             	add    $0x10,%esp
c0105190:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0105194:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105197:	83 c0 04             	add    $0x4,%eax
c010519a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010519d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01051a0:	8b 00                	mov    (%eax),%eax
c01051a2:	85 c0                	test   %eax,%eax
c01051a4:	75 d4                	jne    c010517a <execv+0x47>
c01051a6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01051a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01051ac:	01 d0                	add    %edx,%eax
c01051ae:	c6 00 00             	movb   $0x0,(%eax)
c01051b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01051b4:	83 c0 04             	add    $0x4,%eax
c01051b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01051ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01051bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01051c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01051c3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01051c6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01051cd:	eb 5b                	jmp    c010522a <execv+0xf7>
c01051cf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01051d2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01051d5:	01 c2                	add    %eax,%edx
c01051d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01051da:	89 10                	mov    %edx,(%eax)
c01051dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01051df:	8b 00                	mov    (%eax),%eax
c01051e1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c01051e4:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01051e7:	01 ca                	add    %ecx,%edx
c01051e9:	83 ec 08             	sub    $0x8,%esp
c01051ec:	50                   	push   %eax
c01051ed:	52                   	push   %edx
c01051ee:	e8 db 6f 00 00       	call   c010c1ce <Strcpy>
c01051f3:	83 c4 10             	add    $0x10,%esp
c01051f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01051f9:	8b 00                	mov    (%eax),%eax
c01051fb:	83 ec 0c             	sub    $0xc,%esp
c01051fe:	50                   	push   %eax
c01051ff:	e8 e4 6f 00 00       	call   c010c1e8 <Strlen>
c0105204:	83 c4 10             	add    $0x10,%esp
c0105207:	01 45 f0             	add    %eax,-0x10(%ebp)
c010520a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010520d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105210:	01 d0                	add    %edx,%eax
c0105212:	c6 00 00             	movb   $0x0,(%eax)
c0105215:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105218:	83 c0 01             	add    $0x1,%eax
c010521b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010521e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0105222:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0105226:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010522a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010522d:	8b 00                	mov    (%eax),%eax
c010522f:	85 c0                	test   %eax,%eax
c0105231:	75 9c                	jne    c01051cf <execv+0x9c>
c0105233:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105236:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c010523b:	29 c2                	sub    %eax,%edx
c010523d:	89 d0                	mov    %edx,%eax
c010523f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105242:	83 ec 0c             	sub    $0xc,%esp
c0105245:	ff 75 08             	pushl  0x8(%ebp)
c0105248:	e8 11 0f 00 00       	call   c010615e <get_physical_address>
c010524d:	83 c4 10             	add    $0x10,%esp
c0105250:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105253:	83 ec 0c             	sub    $0xc,%esp
c0105256:	ff 75 dc             	pushl  -0x24(%ebp)
c0105259:	e8 00 0f 00 00       	call   c010615e <get_physical_address>
c010525e:	83 c4 10             	add    $0x10,%esp
c0105261:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105264:	83 ec 0c             	sub    $0xc,%esp
c0105267:	ff 75 d8             	pushl  -0x28(%ebp)
c010526a:	e8 ef 0e 00 00       	call   c010615e <get_physical_address>
c010526f:	83 c4 10             	add    $0x10,%esp
c0105272:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105275:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c010527c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010527f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105282:	83 ec 0c             	sub    $0xc,%esp
c0105285:	ff 75 08             	pushl  0x8(%ebp)
c0105288:	e8 5b 6f 00 00       	call   c010c1e8 <Strlen>
c010528d:	83 c4 10             	add    $0x10,%esp
c0105290:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105293:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105296:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010529c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010529f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01052a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01052a8:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01052ae:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01052b1:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01052b7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01052ba:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01052c0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01052c3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01052c6:	29 c2                	sub    %eax,%edx
c01052c8:	89 d0                	mov    %edx,%eax
c01052ca:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01052d0:	83 ec 04             	sub    $0x4,%esp
c01052d3:	6a 01                	push   $0x1
c01052d5:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c01052db:	50                   	push   %eax
c01052dc:	6a 03                	push   $0x3
c01052de:	e8 22 44 00 00       	call   c0109705 <send_rec>
c01052e3:	83 c4 10             	add    $0x10,%esp
c01052e6:	83 ec 08             	sub    $0x8,%esp
c01052e9:	68 00 04 00 00       	push   $0x400
c01052ee:	ff 75 dc             	pushl  -0x24(%ebp)
c01052f1:	e8 eb c4 ff ff       	call   c01017e1 <sys_free>
c01052f6:	83 c4 10             	add    $0x10,%esp
c01052f9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01052fc:	83 f8 65             	cmp    $0x65,%eax
c01052ff:	74 1c                	je     c010531d <execv+0x1ea>
c0105301:	68 95 00 00 00       	push   $0x95
c0105306:	68 2b b5 10 c0       	push   $0xc010b52b
c010530b:	68 2b b5 10 c0       	push   $0xc010b52b
c0105310:	68 36 b5 10 c0       	push   $0xc010b536
c0105315:	e8 7b 37 00 00       	call   c0108a95 <assertion_failure>
c010531a:	83 c4 10             	add    $0x10,%esp
c010531d:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0105320:	c9                   	leave  
c0105321:	c3                   	ret    

c0105322 <execl>:
c0105322:	55                   	push   %ebp
c0105323:	89 e5                	mov    %esp,%ebp
c0105325:	83 ec 18             	sub    $0x18,%esp
c0105328:	8d 45 0c             	lea    0xc(%ebp),%eax
c010532b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010532e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105331:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105334:	83 ec 08             	sub    $0x8,%esp
c0105337:	ff 75 f0             	pushl  -0x10(%ebp)
c010533a:	ff 75 08             	pushl  0x8(%ebp)
c010533d:	e8 f1 fd ff ff       	call   c0105133 <execv>
c0105342:	83 c4 10             	add    $0x10,%esp
c0105345:	c9                   	leave  
c0105346:	c3                   	ret    

c0105347 <TaskMM>:
c0105347:	55                   	push   %ebp
c0105348:	89 e5                	mov    %esp,%ebp
c010534a:	83 ec 28             	sub    $0x28,%esp
c010534d:	83 ec 0c             	sub    $0xc,%esp
c0105350:	6a 7c                	push   $0x7c
c0105352:	e8 75 c4 ff ff       	call   c01017cc <sys_malloc>
c0105357:	83 c4 10             	add    $0x10,%esp
c010535a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010535d:	83 ec 0c             	sub    $0xc,%esp
c0105360:	6a 7c                	push   $0x7c
c0105362:	e8 65 c4 ff ff       	call   c01017cc <sys_malloc>
c0105367:	83 c4 10             	add    $0x10,%esp
c010536a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010536d:	83 ec 04             	sub    $0x4,%esp
c0105370:	6a 12                	push   $0x12
c0105372:	ff 75 f0             	pushl  -0x10(%ebp)
c0105375:	6a 02                	push   $0x2
c0105377:	e8 89 43 00 00       	call   c0109705 <send_rec>
c010537c:	83 c4 10             	add    $0x10,%esp
c010537f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105382:	8b 40 78             	mov    0x78(%eax),%eax
c0105385:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105388:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010538b:	8b 00                	mov    (%eax),%eax
c010538d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105390:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105397:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010539a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01053a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01053a4:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01053ab:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01053af:	74 4e                	je     c01053ff <TaskMM+0xb8>
c01053b1:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01053b5:	7f 08                	jg     c01053bf <TaskMM+0x78>
c01053b7:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c01053bb:	74 28                	je     c01053e5 <TaskMM+0x9e>
c01053bd:	eb 71                	jmp    c0105430 <TaskMM+0xe9>
c01053bf:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c01053c3:	74 08                	je     c01053cd <TaskMM+0x86>
c01053c5:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01053c9:	74 4e                	je     c0105419 <TaskMM+0xd2>
c01053cb:	eb 63                	jmp    c0105430 <TaskMM+0xe9>
c01053cd:	83 ec 0c             	sub    $0xc,%esp
c01053d0:	ff 75 f0             	pushl  -0x10(%ebp)
c01053d3:	e8 d0 04 00 00       	call   c01058a8 <do_fork>
c01053d8:	83 c4 10             	add    $0x10,%esp
c01053db:	89 c2                	mov    %eax,%edx
c01053dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01053e0:	89 50 5c             	mov    %edx,0x5c(%eax)
c01053e3:	eb 5c                	jmp    c0105441 <TaskMM+0xfa>
c01053e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01053ec:	66 87 db             	xchg   %bx,%bx
c01053ef:	83 ec 0c             	sub    $0xc,%esp
c01053f2:	ff 75 f0             	pushl  -0x10(%ebp)
c01053f5:	e8 95 00 00 00       	call   c010548f <do_exec>
c01053fa:	83 c4 10             	add    $0x10,%esp
c01053fd:	eb 42                	jmp    c0105441 <TaskMM+0xfa>
c01053ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105406:	83 ec 08             	sub    $0x8,%esp
c0105409:	ff 75 e0             	pushl  -0x20(%ebp)
c010540c:	ff 75 f0             	pushl  -0x10(%ebp)
c010540f:	e8 02 05 00 00       	call   c0105916 <do_exit>
c0105414:	83 c4 10             	add    $0x10,%esp
c0105417:	eb 28                	jmp    c0105441 <TaskMM+0xfa>
c0105419:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105420:	83 ec 0c             	sub    $0xc,%esp
c0105423:	ff 75 f0             	pushl  -0x10(%ebp)
c0105426:	e8 75 05 00 00       	call   c01059a0 <do_wait>
c010542b:	83 c4 10             	add    $0x10,%esp
c010542e:	eb 11                	jmp    c0105441 <TaskMM+0xfa>
c0105430:	83 ec 0c             	sub    $0xc,%esp
c0105433:	68 58 b5 10 c0       	push   $0xc010b558
c0105438:	e8 3a 36 00 00       	call   c0108a77 <panic>
c010543d:	83 c4 10             	add    $0x10,%esp
c0105440:	90                   	nop
c0105441:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105445:	0f 84 22 ff ff ff    	je     c010536d <TaskMM+0x26>
c010544b:	83 ec 0c             	sub    $0xc,%esp
c010544e:	6a 03                	push   $0x3
c0105450:	e8 af 31 00 00       	call   c0108604 <delay>
c0105455:	83 c4 10             	add    $0x10,%esp
c0105458:	83 ec 04             	sub    $0x4,%esp
c010545b:	ff 75 e4             	pushl  -0x1c(%ebp)
c010545e:	ff 75 ec             	pushl  -0x14(%ebp)
c0105461:	6a 01                	push   $0x1
c0105463:	e8 9d 42 00 00       	call   c0109705 <send_rec>
c0105468:	83 c4 10             	add    $0x10,%esp
c010546b:	e9 fd fe ff ff       	jmp    c010536d <TaskMM+0x26>

c0105470 <alloc_mem>:
c0105470:	55                   	push   %ebp
c0105471:	89 e5                	mov    %esp,%ebp
c0105473:	83 ec 10             	sub    $0x10,%esp
c0105476:	8b 45 08             	mov    0x8(%ebp),%eax
c0105479:	83 e8 08             	sub    $0x8,%eax
c010547c:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0105482:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105487:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010548a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010548d:	c9                   	leave  
c010548e:	c3                   	ret    

c010548f <do_exec>:
c010548f:	55                   	push   %ebp
c0105490:	89 e5                	mov    %esp,%ebp
c0105492:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105498:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010549f:	65 76 5f 
c01054a2:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c01054a9:	74 79 31 
c01054ac:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c01054b3:	00 00 
c01054b5:	83 ec 08             	sub    $0x8,%esp
c01054b8:	6a 00                	push   $0x0
c01054ba:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c01054c0:	50                   	push   %eax
c01054c1:	e8 29 f8 ff ff       	call   c0104cef <open>
c01054c6:	83 c4 10             	add    $0x10,%esp
c01054c9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01054cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01054cf:	8b 00                	mov    (%eax),%eax
c01054d1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01054d4:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c01054db:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01054de:	83 ec 0c             	sub    $0xc,%esp
c01054e1:	50                   	push   %eax
c01054e2:	e8 e5 c2 ff ff       	call   c01017cc <sys_malloc>
c01054e7:	83 c4 10             	add    $0x10,%esp
c01054ea:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01054ed:	83 ec 04             	sub    $0x4,%esp
c01054f0:	ff 75 d0             	pushl  -0x30(%ebp)
c01054f3:	6a 00                	push   $0x0
c01054f5:	ff 75 cc             	pushl  -0x34(%ebp)
c01054f8:	e8 b2 6c 00 00       	call   c010c1af <Memset>
c01054fd:	83 c4 10             	add    $0x10,%esp
c0105500:	83 ec 04             	sub    $0x4,%esp
c0105503:	6a 0c                	push   $0xc
c0105505:	6a 00                	push   $0x0
c0105507:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010550d:	50                   	push   %eax
c010550e:	e8 9c 6c 00 00       	call   c010c1af <Memset>
c0105513:	83 c4 10             	add    $0x10,%esp
c0105516:	8b 45 08             	mov    0x8(%ebp),%eax
c0105519:	8b 40 44             	mov    0x44(%eax),%eax
c010551c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010551f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105522:	8b 40 40             	mov    0x40(%eax),%eax
c0105525:	83 ec 08             	sub    $0x8,%esp
c0105528:	50                   	push   %eax
c0105529:	ff 75 c8             	pushl  -0x38(%ebp)
c010552c:	e8 de 0a 00 00       	call   c010600f <alloc_virtual_memory>
c0105531:	83 c4 10             	add    $0x10,%esp
c0105534:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105537:	8b 45 08             	mov    0x8(%ebp),%eax
c010553a:	8b 40 40             	mov    0x40(%eax),%eax
c010553d:	89 c2                	mov    %eax,%edx
c010553f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105542:	83 ec 04             	sub    $0x4,%esp
c0105545:	52                   	push   %edx
c0105546:	50                   	push   %eax
c0105547:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010554d:	50                   	push   %eax
c010554e:	e8 29 19 00 00       	call   c0106e7c <Memcpy>
c0105553:	83 c4 10             	add    $0x10,%esp
c0105556:	8b 45 08             	mov    0x8(%ebp),%eax
c0105559:	8b 40 40             	mov    0x40(%eax),%eax
c010555c:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105563:	00 
c0105564:	83 ec 08             	sub    $0x8,%esp
c0105567:	6a 00                	push   $0x0
c0105569:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010556f:	50                   	push   %eax
c0105570:	e8 7a f7 ff ff       	call   c0104cef <open>
c0105575:	83 c4 10             	add    $0x10,%esp
c0105578:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010557b:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010557f:	75 15                	jne    c0105596 <do_exec+0x107>
c0105581:	83 ec 0c             	sub    $0xc,%esp
c0105584:	68 69 b5 10 c0       	push   $0xc010b569
c0105589:	e8 aa 31 00 00       	call   c0108738 <Printf>
c010558e:	83 c4 10             	add    $0x10,%esp
c0105591:	e9 10 03 00 00       	jmp    c01058a6 <do_exec+0x417>
c0105596:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010559d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01055a0:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01055a3:	01 d0                	add    %edx,%eax
c01055a5:	83 ec 04             	sub    $0x4,%esp
c01055a8:	68 00 10 00 00       	push   $0x1000
c01055ad:	50                   	push   %eax
c01055ae:	ff 75 c0             	pushl  -0x40(%ebp)
c01055b1:	e8 ce f7 ff ff       	call   c0104d84 <read>
c01055b6:	83 c4 10             	add    $0x10,%esp
c01055b9:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01055bc:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01055bf:	01 45 f4             	add    %eax,-0xc(%ebp)
c01055c2:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01055c6:	74 0a                	je     c01055d2 <do_exec+0x143>
c01055c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01055cb:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c01055ce:	7d 05                	jge    c01055d5 <do_exec+0x146>
c01055d0:	eb cb                	jmp    c010559d <do_exec+0x10e>
c01055d2:	90                   	nop
c01055d3:	eb 01                	jmp    c01055d6 <do_exec+0x147>
c01055d5:	90                   	nop
c01055d6:	83 ec 0c             	sub    $0xc,%esp
c01055d9:	ff 75 c0             	pushl  -0x40(%ebp)
c01055dc:	e8 a9 f9 ff ff       	call   c0104f8a <close>
c01055e1:	83 c4 10             	add    $0x10,%esp
c01055e4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01055e7:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01055ea:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01055ed:	8b 40 18             	mov    0x18(%eax),%eax
c01055f0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01055f3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01055fa:	e9 04 01 00 00       	jmp    c0105703 <do_exec+0x274>
c01055ff:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105602:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105606:	0f b7 d0             	movzwl %ax,%edx
c0105609:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010560c:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0105610:	0f b7 c0             	movzwl %ax,%eax
c0105613:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105617:	01 c2                	add    %eax,%edx
c0105619:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010561c:	01 d0                	add    %edx,%eax
c010561e:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0105621:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105624:	8b 40 10             	mov    0x10(%eax),%eax
c0105627:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010562a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010562d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105632:	c1 e8 0c             	shr    $0xc,%eax
c0105635:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105638:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010563b:	8b 40 08             	mov    0x8(%eax),%eax
c010563e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0105641:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105648:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010564b:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010564e:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0105651:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105654:	8b 50 04             	mov    0x4(%eax),%edx
c0105657:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010565a:	01 d0                	add    %edx,%eax
c010565c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010565f:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105663:	0f 84 95 00 00 00    	je     c01056fe <do_exec+0x26f>
c0105669:	83 ec 04             	sub    $0x4,%esp
c010566c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010566f:	ff 75 a8             	pushl  -0x58(%ebp)
c0105672:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105675:	e8 a0 07 00 00       	call   c0105e1a <get_virtual_address_start_with_addr>
c010567a:	83 c4 10             	add    $0x10,%esp
c010567d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105680:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105683:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105686:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010568d:	eb 41                	jmp    c01056d0 <do_exec+0x241>
c010568f:	83 ec 08             	sub    $0x8,%esp
c0105692:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105695:	ff 75 e8             	pushl  -0x18(%ebp)
c0105698:	e8 f3 0a 00 00       	call   c0106190 <alloc_physical_memory_of_proc>
c010569d:	83 c4 10             	add    $0x10,%esp
c01056a0:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01056a3:	83 ec 08             	sub    $0x8,%esp
c01056a6:	68 00 10 00 00       	push   $0x1000
c01056ab:	ff 75 94             	pushl  -0x6c(%ebp)
c01056ae:	e8 5c 09 00 00       	call   c010600f <alloc_virtual_memory>
c01056b3:	83 c4 10             	add    $0x10,%esp
c01056b6:	89 45 90             	mov    %eax,-0x70(%ebp)
c01056b9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01056bd:	75 06                	jne    c01056c5 <do_exec+0x236>
c01056bf:	8b 45 90             	mov    -0x70(%ebp),%eax
c01056c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01056c5:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c01056cc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01056d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01056d3:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c01056d6:	77 b7                	ja     c010568f <do_exec+0x200>
c01056d8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01056db:	8b 40 10             	mov    0x10(%eax),%eax
c01056de:	89 c1                	mov    %eax,%ecx
c01056e0:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01056e3:	8b 50 04             	mov    0x4(%eax),%edx
c01056e6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01056e9:	01 c2                	add    %eax,%edx
c01056eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01056ee:	83 ec 04             	sub    $0x4,%esp
c01056f1:	51                   	push   %ecx
c01056f2:	52                   	push   %edx
c01056f3:	50                   	push   %eax
c01056f4:	e8 83 17 00 00       	call   c0106e7c <Memcpy>
c01056f9:	83 c4 10             	add    $0x10,%esp
c01056fc:	eb 01                	jmp    c01056ff <do_exec+0x270>
c01056fe:	90                   	nop
c01056ff:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105703:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105706:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c010570a:	0f b7 c0             	movzwl %ax,%eax
c010570d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0105710:	0f 8c e9 fe ff ff    	jl     c01055ff <do_exec+0x170>
c0105716:	8b 45 08             	mov    0x8(%ebp),%eax
c0105719:	8b 40 10             	mov    0x10(%eax),%eax
c010571c:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010571f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105722:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105725:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105728:	8b 45 08             	mov    0x8(%ebp),%eax
c010572b:	8b 40 24             	mov    0x24(%eax),%eax
c010572e:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0105731:	83 ec 0c             	sub    $0xc,%esp
c0105734:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105737:	e8 8a e2 ff ff       	call   c01039c6 <pid2proc>
c010573c:	83 c4 10             	add    $0x10,%esp
c010573f:	89 45 80             	mov    %eax,-0x80(%ebp)
c0105742:	8b 45 08             	mov    0x8(%ebp),%eax
c0105745:	8b 40 10             	mov    0x10(%eax),%eax
c0105748:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010574e:	83 ec 08             	sub    $0x8,%esp
c0105751:	ff 75 88             	pushl  -0x78(%ebp)
c0105754:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c010575a:	e8 b0 08 00 00       	call   c010600f <alloc_virtual_memory>
c010575f:	83 c4 10             	add    $0x10,%esp
c0105762:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105768:	8b 45 08             	mov    0x8(%ebp),%eax
c010576b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010576e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105774:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010577b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0105781:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105784:	eb 1a                	jmp    c01057a0 <do_exec+0x311>
c0105786:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010578a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010578d:	8b 10                	mov    (%eax),%edx
c010578f:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105795:	01 c2                	add    %eax,%edx
c0105797:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010579a:	89 10                	mov    %edx,(%eax)
c010579c:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c01057a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01057a3:	8b 00                	mov    (%eax),%eax
c01057a5:	85 c0                	test   %eax,%eax
c01057a7:	75 dd                	jne    c0105786 <do_exec+0x2f7>
c01057a9:	83 ec 0c             	sub    $0xc,%esp
c01057ac:	ff 75 84             	pushl  -0x7c(%ebp)
c01057af:	e8 5b 08 00 00       	call   c010600f <alloc_virtual_memory>
c01057b4:	83 c4 10             	add    $0x10,%esp
c01057b7:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01057bd:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01057c3:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01057c9:	83 ec 04             	sub    $0x4,%esp
c01057cc:	ff 75 88             	pushl  -0x78(%ebp)
c01057cf:	52                   	push   %edx
c01057d0:	50                   	push   %eax
c01057d1:	e8 a6 16 00 00       	call   c0106e7c <Memcpy>
c01057d6:	83 c4 10             	add    $0x10,%esp
c01057d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01057dc:	8b 40 28             	mov    0x28(%eax),%eax
c01057df:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01057e5:	83 ec 08             	sub    $0x8,%esp
c01057e8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01057eb:	ff 75 80             	pushl  -0x80(%ebp)
c01057ee:	e8 ef 08 00 00       	call   c01060e2 <get_physical_address_proc>
c01057f3:	83 c4 10             	add    $0x10,%esp
c01057f6:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c01057fc:	83 ec 08             	sub    $0x8,%esp
c01057ff:	68 00 10 00 00       	push   $0x1000
c0105804:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c010580a:	e8 00 08 00 00       	call   c010600f <alloc_virtual_memory>
c010580f:	83 c4 10             	add    $0x10,%esp
c0105812:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105818:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010581e:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105823:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105829:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010582f:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105835:	89 50 20             	mov    %edx,0x20(%eax)
c0105838:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010583b:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105841:	89 50 28             	mov    %edx,0x28(%eax)
c0105844:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105847:	8b 40 18             	mov    0x18(%eax),%eax
c010584a:	89 c2                	mov    %eax,%edx
c010584c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105852:	89 50 30             	mov    %edx,0x30(%eax)
c0105855:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010585b:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105861:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105864:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105867:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010586e:	00 00 00 
c0105871:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105878:	00 00 00 
c010587b:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0105882:	00 00 00 
c0105885:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c010588c:	00 00 00 
c010588f:	83 ec 04             	sub    $0x4,%esp
c0105892:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105895:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c010589b:	50                   	push   %eax
c010589c:	6a 01                	push   $0x1
c010589e:	e8 62 3e 00 00       	call   c0109705 <send_rec>
c01058a3:	83 c4 10             	add    $0x10,%esp
c01058a6:	c9                   	leave  
c01058a7:	c3                   	ret    

c01058a8 <do_fork>:
c01058a8:	55                   	push   %ebp
c01058a9:	89 e5                	mov    %esp,%ebp
c01058ab:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01058b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01058b4:	8b 00                	mov    (%eax),%eax
c01058b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01058b9:	83 ec 0c             	sub    $0xc,%esp
c01058bc:	ff 75 f4             	pushl  -0xc(%ebp)
c01058bf:	e8 3c 47 00 00       	call   c010a000 <fork_process>
c01058c4:	83 c4 10             	add    $0x10,%esp
c01058c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058cd:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01058d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01058d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058d9:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01058df:	8b 45 08             	mov    0x8(%ebp),%eax
c01058e2:	89 50 5c             	mov    %edx,0x5c(%eax)
c01058e5:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c01058ec:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01058f3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01058fa:	83 ec 04             	sub    $0x4,%esp
c01058fd:	ff 75 ec             	pushl  -0x14(%ebp)
c0105900:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105906:	50                   	push   %eax
c0105907:	6a 01                	push   $0x1
c0105909:	e8 f7 3d 00 00       	call   c0109705 <send_rec>
c010590e:	83 c4 10             	add    $0x10,%esp
c0105911:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105914:	c9                   	leave  
c0105915:	c3                   	ret    

c0105916 <do_exit>:
c0105916:	55                   	push   %ebp
c0105917:	89 e5                	mov    %esp,%ebp
c0105919:	83 ec 18             	sub    $0x18,%esp
c010591c:	8b 45 08             	mov    0x8(%ebp),%eax
c010591f:	8b 00                	mov    (%eax),%eax
c0105921:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105924:	83 ec 0c             	sub    $0xc,%esp
c0105927:	ff 75 f4             	pushl  -0xc(%ebp)
c010592a:	e8 97 e0 ff ff       	call   c01039c6 <pid2proc>
c010592f:	83 c4 10             	add    $0x10,%esp
c0105932:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105935:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105938:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010593e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105941:	83 ec 0c             	sub    $0xc,%esp
c0105944:	ff 75 ec             	pushl  -0x14(%ebp)
c0105947:	e8 7a e0 ff ff       	call   c01039c6 <pid2proc>
c010594c:	83 c4 10             	add    $0x10,%esp
c010594f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105952:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105956:	74 45                	je     c010599d <do_exit+0x87>
c0105958:	8b 45 08             	mov    0x8(%ebp),%eax
c010595b:	8b 40 54             	mov    0x54(%eax),%eax
c010595e:	89 c2                	mov    %eax,%edx
c0105960:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105963:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105969:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010596c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105973:	3c 04                	cmp    $0x4,%al
c0105975:	75 1a                	jne    c0105991 <do_exit+0x7b>
c0105977:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010597a:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105981:	83 ec 0c             	sub    $0xc,%esp
c0105984:	ff 75 f0             	pushl  -0x10(%ebp)
c0105987:	e8 33 01 00 00       	call   c0105abf <cleanup>
c010598c:	83 c4 10             	add    $0x10,%esp
c010598f:	eb 0d                	jmp    c010599e <do_exit+0x88>
c0105991:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105994:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c010599b:	eb 01                	jmp    c010599e <do_exit+0x88>
c010599d:	90                   	nop
c010599e:	c9                   	leave  
c010599f:	c3                   	ret    

c01059a0 <do_wait>:
c01059a0:	55                   	push   %ebp
c01059a1:	89 e5                	mov    %esp,%ebp
c01059a3:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c01059a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01059ac:	8b 00                	mov    (%eax),%eax
c01059ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01059b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01059b8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01059bf:	83 ec 0c             	sub    $0xc,%esp
c01059c2:	ff 75 ec             	pushl  -0x14(%ebp)
c01059c5:	e8 fc df ff ff       	call   c01039c6 <pid2proc>
c01059ca:	83 c4 10             	add    $0x10,%esp
c01059cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01059d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01059d4:	75 19                	jne    c01059ef <do_wait+0x4f>
c01059d6:	6a 58                	push   $0x58
c01059d8:	68 79 b5 10 c0       	push   $0xc010b579
c01059dd:	68 79 b5 10 c0       	push   $0xc010b579
c01059e2:	68 87 b5 10 c0       	push   $0xc010b587
c01059e7:	e8 a9 30 00 00       	call   c0108a95 <assertion_failure>
c01059ec:	83 c4 10             	add    $0x10,%esp
c01059ef:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c01059f4:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c01059fa:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01059fd:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105a00:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105a05:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c0105a0b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105a0e:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105a11:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105a16:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a19:	eb 5b                	jmp    c0105a76 <do_wait+0xd6>
c0105a1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a1e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105a23:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105a26:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105a29:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105a2f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0105a32:	74 0b                	je     c0105a3f <do_wait+0x9f>
c0105a34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a37:	8b 40 04             	mov    0x4(%eax),%eax
c0105a3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a3d:	eb 37                	jmp    c0105a76 <do_wait+0xd6>
c0105a3f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105a43:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105a46:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105a4d:	3c 03                	cmp    $0x3,%al
c0105a4f:	74 0b                	je     c0105a5c <do_wait+0xbc>
c0105a51:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a54:	8b 40 04             	mov    0x4(%eax),%eax
c0105a57:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a5a:	eb 1a                	jmp    c0105a76 <do_wait+0xd6>
c0105a5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105a5f:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105a66:	83 ec 0c             	sub    $0xc,%esp
c0105a69:	ff 75 e8             	pushl  -0x18(%ebp)
c0105a6c:	e8 4e 00 00 00       	call   c0105abf <cleanup>
c0105a71:	83 c4 10             	add    $0x10,%esp
c0105a74:	eb 47                	jmp    c0105abd <do_wait+0x11d>
c0105a76:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c0105a7d:	75 9c                	jne    c0105a1b <do_wait+0x7b>
c0105a7f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105a83:	74 0c                	je     c0105a91 <do_wait+0xf1>
c0105a85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105a88:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c0105a8f:	eb 2c                	jmp    c0105abd <do_wait+0x11d>
c0105a91:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105a98:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0105a9f:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105aa6:	83 ec 04             	sub    $0x4,%esp
c0105aa9:	ff 75 ec             	pushl  -0x14(%ebp)
c0105aac:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c0105ab2:	50                   	push   %eax
c0105ab3:	6a 01                	push   $0x1
c0105ab5:	e8 4b 3c 00 00       	call   c0109705 <send_rec>
c0105aba:	83 c4 10             	add    $0x10,%esp
c0105abd:	c9                   	leave  
c0105abe:	c3                   	ret    

c0105abf <cleanup>:
c0105abf:	55                   	push   %ebp
c0105ac0:	89 e5                	mov    %esp,%ebp
c0105ac2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105ac8:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0105acf:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105ad6:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ad9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105adf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105ae2:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ae5:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0105aeb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105aee:	8b 45 08             	mov    0x8(%ebp),%eax
c0105af1:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105af7:	83 ec 04             	sub    $0x4,%esp
c0105afa:	50                   	push   %eax
c0105afb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105b01:	50                   	push   %eax
c0105b02:	6a 01                	push   $0x1
c0105b04:	e8 fc 3b 00 00       	call   c0109705 <send_rec>
c0105b09:	83 c4 10             	add    $0x10,%esp
c0105b0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b0f:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105b16:	90                   	nop
c0105b17:	c9                   	leave  
c0105b18:	c3                   	ret    

c0105b19 <init_bitmap>:
c0105b19:	55                   	push   %ebp
c0105b1a:	89 e5                	mov    %esp,%ebp
c0105b1c:	83 ec 08             	sub    $0x8,%esp
c0105b1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b22:	8b 50 04             	mov    0x4(%eax),%edx
c0105b25:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b28:	8b 00                	mov    (%eax),%eax
c0105b2a:	83 ec 04             	sub    $0x4,%esp
c0105b2d:	52                   	push   %edx
c0105b2e:	6a 00                	push   $0x0
c0105b30:	50                   	push   %eax
c0105b31:	e8 79 66 00 00       	call   c010c1af <Memset>
c0105b36:	83 c4 10             	add    $0x10,%esp
c0105b39:	90                   	nop
c0105b3a:	c9                   	leave  
c0105b3b:	c3                   	ret    

c0105b3c <test_bit_val>:
c0105b3c:	55                   	push   %ebp
c0105b3d:	89 e5                	mov    %esp,%ebp
c0105b3f:	53                   	push   %ebx
c0105b40:	83 ec 10             	sub    $0x10,%esp
c0105b43:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b46:	8d 50 07             	lea    0x7(%eax),%edx
c0105b49:	85 c0                	test   %eax,%eax
c0105b4b:	0f 48 c2             	cmovs  %edx,%eax
c0105b4e:	c1 f8 03             	sar    $0x3,%eax
c0105b51:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b54:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b57:	99                   	cltd   
c0105b58:	c1 ea 1d             	shr    $0x1d,%edx
c0105b5b:	01 d0                	add    %edx,%eax
c0105b5d:	83 e0 07             	and    $0x7,%eax
c0105b60:	29 d0                	sub    %edx,%eax
c0105b62:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b65:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b68:	8b 10                	mov    (%eax),%edx
c0105b6a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105b6d:	01 d0                	add    %edx,%eax
c0105b6f:	0f b6 00             	movzbl (%eax),%eax
c0105b72:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105b75:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105b79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b7c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105b81:	89 c1                	mov    %eax,%ecx
c0105b83:	d3 e3                	shl    %cl,%ebx
c0105b85:	89 d8                	mov    %ebx,%eax
c0105b87:	21 c2                	and    %eax,%edx
c0105b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b8c:	89 c1                	mov    %eax,%ecx
c0105b8e:	d3 fa                	sar    %cl,%edx
c0105b90:	89 d0                	mov    %edx,%eax
c0105b92:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b95:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105b99:	0f 9f c0             	setg   %al
c0105b9c:	0f b6 c0             	movzbl %al,%eax
c0105b9f:	83 c4 10             	add    $0x10,%esp
c0105ba2:	5b                   	pop    %ebx
c0105ba3:	5d                   	pop    %ebp
c0105ba4:	c3                   	ret    

c0105ba5 <set_bit_val>:
c0105ba5:	55                   	push   %ebp
c0105ba6:	89 e5                	mov    %esp,%ebp
c0105ba8:	83 ec 10             	sub    $0x10,%esp
c0105bab:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105bae:	8d 50 07             	lea    0x7(%eax),%edx
c0105bb1:	85 c0                	test   %eax,%eax
c0105bb3:	0f 48 c2             	cmovs  %edx,%eax
c0105bb6:	c1 f8 03             	sar    $0x3,%eax
c0105bb9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105bbc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105bbf:	99                   	cltd   
c0105bc0:	c1 ea 1d             	shr    $0x1d,%edx
c0105bc3:	01 d0                	add    %edx,%eax
c0105bc5:	83 e0 07             	and    $0x7,%eax
c0105bc8:	29 d0                	sub    %edx,%eax
c0105bca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105bcd:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bd0:	8b 10                	mov    (%eax),%edx
c0105bd2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105bd5:	01 d0                	add    %edx,%eax
c0105bd7:	0f b6 00             	movzbl (%eax),%eax
c0105bda:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105bdd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105be1:	7e 13                	jle    c0105bf6 <set_bit_val+0x51>
c0105be3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105be6:	ba 01 00 00 00       	mov    $0x1,%edx
c0105beb:	89 c1                	mov    %eax,%ecx
c0105bed:	d3 e2                	shl    %cl,%edx
c0105bef:	89 d0                	mov    %edx,%eax
c0105bf1:	08 45 ff             	or     %al,-0x1(%ebp)
c0105bf4:	eb 13                	jmp    c0105c09 <set_bit_val+0x64>
c0105bf6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bf9:	ba 01 00 00 00       	mov    $0x1,%edx
c0105bfe:	89 c1                	mov    %eax,%ecx
c0105c00:	d3 e2                	shl    %cl,%edx
c0105c02:	89 d0                	mov    %edx,%eax
c0105c04:	f7 d0                	not    %eax
c0105c06:	20 45 ff             	and    %al,-0x1(%ebp)
c0105c09:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c0c:	8b 10                	mov    (%eax),%edx
c0105c0e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c11:	01 c2                	add    %eax,%edx
c0105c13:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105c17:	88 02                	mov    %al,(%edx)
c0105c19:	b8 01 00 00 00       	mov    $0x1,%eax
c0105c1e:	c9                   	leave  
c0105c1f:	c3                   	ret    

c0105c20 <set_bits>:
c0105c20:	55                   	push   %ebp
c0105c21:	89 e5                	mov    %esp,%ebp
c0105c23:	83 ec 10             	sub    $0x10,%esp
c0105c26:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105c2d:	eb 1c                	jmp    c0105c4b <set_bits+0x2b>
c0105c2f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c32:	8d 50 01             	lea    0x1(%eax),%edx
c0105c35:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105c38:	ff 75 10             	pushl  0x10(%ebp)
c0105c3b:	50                   	push   %eax
c0105c3c:	ff 75 08             	pushl  0x8(%ebp)
c0105c3f:	e8 61 ff ff ff       	call   c0105ba5 <set_bit_val>
c0105c44:	83 c4 0c             	add    $0xc,%esp
c0105c47:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105c4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105c4e:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105c51:	7c dc                	jl     c0105c2f <set_bits+0xf>
c0105c53:	b8 01 00 00 00       	mov    $0x1,%eax
c0105c58:	c9                   	leave  
c0105c59:	c3                   	ret    

c0105c5a <get_first_free_bit>:
c0105c5a:	55                   	push   %ebp
c0105c5b:	89 e5                	mov    %esp,%ebp
c0105c5d:	83 ec 10             	sub    $0x10,%esp
c0105c60:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c63:	8b 40 04             	mov    0x4(%eax),%eax
c0105c66:	c1 e0 03             	shl    $0x3,%eax
c0105c69:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c6c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c6f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105c72:	eb 1b                	jmp    c0105c8f <get_first_free_bit+0x35>
c0105c74:	ff 75 fc             	pushl  -0x4(%ebp)
c0105c77:	ff 75 08             	pushl  0x8(%ebp)
c0105c7a:	e8 bd fe ff ff       	call   c0105b3c <test_bit_val>
c0105c7f:	83 c4 08             	add    $0x8,%esp
c0105c82:	85 c0                	test   %eax,%eax
c0105c84:	75 05                	jne    c0105c8b <get_first_free_bit+0x31>
c0105c86:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105c89:	eb 11                	jmp    c0105c9c <get_first_free_bit+0x42>
c0105c8b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105c8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105c92:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105c95:	7c dd                	jl     c0105c74 <get_first_free_bit+0x1a>
c0105c97:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105c9c:	c9                   	leave  
c0105c9d:	c3                   	ret    

c0105c9e <get_bits>:
c0105c9e:	55                   	push   %ebp
c0105c9f:	89 e5                	mov    %esp,%ebp
c0105ca1:	83 ec 20             	sub    $0x20,%esp
c0105ca4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105cab:	ff 75 f0             	pushl  -0x10(%ebp)
c0105cae:	ff 75 08             	pushl  0x8(%ebp)
c0105cb1:	e8 a4 ff ff ff       	call   c0105c5a <get_first_free_bit>
c0105cb6:	83 c4 08             	add    $0x8,%esp
c0105cb9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105cbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cbf:	8b 40 04             	mov    0x4(%eax),%eax
c0105cc2:	c1 e0 03             	shl    $0x3,%eax
c0105cc5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105cc8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ccb:	83 e8 01             	sub    $0x1,%eax
c0105cce:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105cd1:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105cd5:	75 08                	jne    c0105cdf <get_bits+0x41>
c0105cd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105cda:	e9 85 00 00 00       	jmp    c0105d64 <get_bits+0xc6>
c0105cdf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ce2:	83 c0 01             	add    $0x1,%eax
c0105ce5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105ce8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ceb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cee:	eb 58                	jmp    c0105d48 <get_bits+0xaa>
c0105cf0:	ff 75 f8             	pushl  -0x8(%ebp)
c0105cf3:	ff 75 08             	pushl  0x8(%ebp)
c0105cf6:	e8 41 fe ff ff       	call   c0105b3c <test_bit_val>
c0105cfb:	83 c4 08             	add    $0x8,%esp
c0105cfe:	85 c0                	test   %eax,%eax
c0105d00:	75 0a                	jne    c0105d0c <get_bits+0x6e>
c0105d02:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105d06:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105d0a:	eb 2b                	jmp    c0105d37 <get_bits+0x99>
c0105d0c:	6a 00                	push   $0x0
c0105d0e:	ff 75 08             	pushl  0x8(%ebp)
c0105d11:	e8 44 ff ff ff       	call   c0105c5a <get_first_free_bit>
c0105d16:	83 c4 08             	add    $0x8,%esp
c0105d19:	83 c0 01             	add    $0x1,%eax
c0105d1c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d22:	83 c0 01             	add    $0x1,%eax
c0105d25:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105d28:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105d2b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d2e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d31:	83 e8 01             	sub    $0x1,%eax
c0105d34:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105d37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d3a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105d3d:	7c 09                	jl     c0105d48 <get_bits+0xaa>
c0105d3f:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105d46:	eb 0d                	jmp    c0105d55 <get_bits+0xb7>
c0105d48:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105d4b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105d4e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105d51:	85 c0                	test   %eax,%eax
c0105d53:	7f 9b                	jg     c0105cf0 <get_bits+0x52>
c0105d55:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d58:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105d5b:	83 c0 01             	add    $0x1,%eax
c0105d5e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105d61:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105d64:	c9                   	leave  
c0105d65:	c3                   	ret    

c0105d66 <get_a_page>:
c0105d66:	55                   	push   %ebp
c0105d67:	89 e5                	mov    %esp,%ebp
c0105d69:	83 ec 28             	sub    $0x28,%esp
c0105d6c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105d70:	75 22                	jne    c0105d94 <get_a_page+0x2e>
c0105d72:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105d77:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d7a:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105d7f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d82:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105d87:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d8a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105d8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d92:	eb 20                	jmp    c0105db4 <get_a_page+0x4e>
c0105d94:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105d99:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d9c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105da1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105da4:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105da9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105dac:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105db1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105db4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105db7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105dba:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105dbd:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105dc0:	6a 01                	push   $0x1
c0105dc2:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105dc5:	50                   	push   %eax
c0105dc6:	e8 d3 fe ff ff       	call   c0105c9e <get_bits>
c0105dcb:	83 c4 08             	add    $0x8,%esp
c0105dce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105dd1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105dd5:	75 1c                	jne    c0105df3 <get_a_page+0x8d>
c0105dd7:	68 84 00 00 00       	push   $0x84
c0105ddc:	68 9a b5 10 c0       	push   $0xc010b59a
c0105de1:	68 9a b5 10 c0       	push   $0xc010b59a
c0105de6:	68 a4 b5 10 c0       	push   $0xc010b5a4
c0105deb:	e8 a5 2c 00 00       	call   c0108a95 <assertion_failure>
c0105df0:	83 c4 10             	add    $0x10,%esp
c0105df3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105df6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105df9:	c1 e2 0c             	shl    $0xc,%edx
c0105dfc:	01 d0                	add    %edx,%eax
c0105dfe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e01:	83 ec 04             	sub    $0x4,%esp
c0105e04:	6a 01                	push   $0x1
c0105e06:	ff 75 f4             	pushl  -0xc(%ebp)
c0105e09:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105e0c:	50                   	push   %eax
c0105e0d:	e8 93 fd ff ff       	call   c0105ba5 <set_bit_val>
c0105e12:	83 c4 10             	add    $0x10,%esp
c0105e15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e18:	c9                   	leave  
c0105e19:	c3                   	ret    

c0105e1a <get_virtual_address_start_with_addr>:
c0105e1a:	55                   	push   %ebp
c0105e1b:	89 e5                	mov    %esp,%ebp
c0105e1d:	83 ec 38             	sub    $0x38,%esp
c0105e20:	e8 17 a6 ff ff       	call   c010043c <get_running_thread_pcb>
c0105e25:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e28:	83 ec 0c             	sub    $0xc,%esp
c0105e2b:	ff 75 10             	pushl  0x10(%ebp)
c0105e2e:	e8 93 db ff ff       	call   c01039c6 <pid2proc>
c0105e33:	83 c4 10             	add    $0x10,%esp
c0105e36:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e39:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e3c:	8b 40 0c             	mov    0xc(%eax),%eax
c0105e3f:	83 ec 04             	sub    $0x4,%esp
c0105e42:	6a 0c                	push   $0xc
c0105e44:	50                   	push   %eax
c0105e45:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105e48:	50                   	push   %eax
c0105e49:	e8 2e 10 00 00       	call   c0106e7c <Memcpy>
c0105e4e:	83 c4 10             	add    $0x10,%esp
c0105e51:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105e54:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105e57:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105e5a:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105e5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105e60:	8b 55 08             	mov    0x8(%ebp),%edx
c0105e63:	29 c2                	sub    %eax,%edx
c0105e65:	89 d0                	mov    %edx,%eax
c0105e67:	c1 e8 0c             	shr    $0xc,%eax
c0105e6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e6d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105e71:	79 1c                	jns    c0105e8f <get_virtual_address_start_with_addr+0x75>
c0105e73:	68 97 00 00 00       	push   $0x97
c0105e78:	68 9a b5 10 c0       	push   $0xc010b59a
c0105e7d:	68 9a b5 10 c0       	push   $0xc010b59a
c0105e82:	68 b0 b5 10 c0       	push   $0xc010b5b0
c0105e87:	e8 09 2c 00 00       	call   c0108a95 <assertion_failure>
c0105e8c:	83 c4 10             	add    $0x10,%esp
c0105e8f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e92:	50                   	push   %eax
c0105e93:	6a 01                	push   $0x1
c0105e95:	ff 75 ec             	pushl  -0x14(%ebp)
c0105e98:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105e9b:	50                   	push   %eax
c0105e9c:	e8 7f fd ff ff       	call   c0105c20 <set_bits>
c0105ea1:	83 c4 10             	add    $0x10,%esp
c0105ea4:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ea7:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105eac:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105eaf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105eb2:	c9                   	leave  
c0105eb3:	c3                   	ret    

c0105eb4 <get_virtual_address>:
c0105eb4:	55                   	push   %ebp
c0105eb5:	89 e5                	mov    %esp,%ebp
c0105eb7:	83 ec 28             	sub    $0x28,%esp
c0105eba:	e8 7d a5 ff ff       	call   c010043c <get_running_thread_pcb>
c0105ebf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ec2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105ec6:	75 1a                	jne    c0105ee2 <get_virtual_address+0x2e>
c0105ec8:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105ecd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ed0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105ed5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ed8:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105edd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ee0:	eb 18                	jmp    c0105efa <get_virtual_address+0x46>
c0105ee2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105ee5:	8b 40 0c             	mov    0xc(%eax),%eax
c0105ee8:	83 ec 04             	sub    $0x4,%esp
c0105eeb:	6a 0c                	push   $0xc
c0105eed:	50                   	push   %eax
c0105eee:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105ef1:	50                   	push   %eax
c0105ef2:	e8 85 0f 00 00       	call   c0106e7c <Memcpy>
c0105ef7:	83 c4 10             	add    $0x10,%esp
c0105efa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105efd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105f00:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f03:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105f06:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f09:	83 ec 08             	sub    $0x8,%esp
c0105f0c:	50                   	push   %eax
c0105f0d:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105f10:	50                   	push   %eax
c0105f11:	e8 88 fd ff ff       	call   c0105c9e <get_bits>
c0105f16:	83 c4 10             	add    $0x10,%esp
c0105f19:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105f1c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105f1f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105f22:	c1 e2 0c             	shl    $0xc,%edx
c0105f25:	01 d0                	add    %edx,%eax
c0105f27:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f2d:	50                   	push   %eax
c0105f2e:	6a 01                	push   $0x1
c0105f30:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f33:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105f36:	50                   	push   %eax
c0105f37:	e8 e4 fc ff ff       	call   c0105c20 <set_bits>
c0105f3c:	83 c4 10             	add    $0x10,%esp
c0105f3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f42:	c9                   	leave  
c0105f43:	c3                   	ret    

c0105f44 <ptr_pde>:
c0105f44:	55                   	push   %ebp
c0105f45:	89 e5                	mov    %esp,%ebp
c0105f47:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f4a:	c1 e8 16             	shr    $0x16,%eax
c0105f4d:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105f52:	c1 e0 02             	shl    $0x2,%eax
c0105f55:	5d                   	pop    %ebp
c0105f56:	c3                   	ret    

c0105f57 <ptr_pte>:
c0105f57:	55                   	push   %ebp
c0105f58:	89 e5                	mov    %esp,%ebp
c0105f5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f5d:	c1 e8 0a             	shr    $0xa,%eax
c0105f60:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105f65:	89 c2                	mov    %eax,%edx
c0105f67:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f6a:	c1 e8 0c             	shr    $0xc,%eax
c0105f6d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105f72:	c1 e0 02             	shl    $0x2,%eax
c0105f75:	01 d0                	add    %edx,%eax
c0105f77:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105f7c:	5d                   	pop    %ebp
c0105f7d:	c3                   	ret    

c0105f7e <add_map_entry>:
c0105f7e:	55                   	push   %ebp
c0105f7f:	89 e5                	mov    %esp,%ebp
c0105f81:	83 ec 18             	sub    $0x18,%esp
c0105f84:	ff 75 08             	pushl  0x8(%ebp)
c0105f87:	e8 b8 ff ff ff       	call   c0105f44 <ptr_pde>
c0105f8c:	83 c4 04             	add    $0x4,%esp
c0105f8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f92:	ff 75 08             	pushl  0x8(%ebp)
c0105f95:	e8 bd ff ff ff       	call   c0105f57 <ptr_pte>
c0105f9a:	83 c4 04             	add    $0x4,%esp
c0105f9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105fa3:	8b 00                	mov    (%eax),%eax
c0105fa5:	83 e0 01             	and    $0x1,%eax
c0105fa8:	85 c0                	test   %eax,%eax
c0105faa:	74 1b                	je     c0105fc7 <add_map_entry+0x49>
c0105fac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105faf:	8b 00                	mov    (%eax),%eax
c0105fb1:	83 e0 01             	and    $0x1,%eax
c0105fb4:	85 c0                	test   %eax,%eax
c0105fb6:	75 54                	jne    c010600c <add_map_entry+0x8e>
c0105fb8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105fbb:	83 c8 07             	or     $0x7,%eax
c0105fbe:	89 c2                	mov    %eax,%edx
c0105fc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fc3:	89 10                	mov    %edx,(%eax)
c0105fc5:	eb 45                	jmp    c010600c <add_map_entry+0x8e>
c0105fc7:	83 ec 0c             	sub    $0xc,%esp
c0105fca:	6a 00                	push   $0x0
c0105fcc:	e8 95 fd ff ff       	call   c0105d66 <get_a_page>
c0105fd1:	83 c4 10             	add    $0x10,%esp
c0105fd4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105fda:	83 c8 07             	or     $0x7,%eax
c0105fdd:	89 c2                	mov    %eax,%edx
c0105fdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105fe2:	89 10                	mov    %edx,(%eax)
c0105fe4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fe7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105fec:	83 ec 04             	sub    $0x4,%esp
c0105fef:	68 00 10 00 00       	push   $0x1000
c0105ff4:	6a 00                	push   $0x0
c0105ff6:	50                   	push   %eax
c0105ff7:	e8 b3 61 00 00       	call   c010c1af <Memset>
c0105ffc:	83 c4 10             	add    $0x10,%esp
c0105fff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106002:	83 c8 07             	or     $0x7,%eax
c0106005:	89 c2                	mov    %eax,%edx
c0106007:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010600a:	89 10                	mov    %edx,(%eax)
c010600c:	90                   	nop
c010600d:	c9                   	leave  
c010600e:	c3                   	ret    

c010600f <alloc_virtual_memory>:
c010600f:	55                   	push   %ebp
c0106010:	89 e5                	mov    %esp,%ebp
c0106012:	83 ec 28             	sub    $0x28,%esp
c0106015:	8b 45 08             	mov    0x8(%ebp),%eax
c0106018:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010601d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106020:	8b 45 08             	mov    0x8(%ebp),%eax
c0106023:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106026:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106029:	8b 45 0c             	mov    0xc(%ebp),%eax
c010602c:	01 45 e4             	add    %eax,-0x1c(%ebp)
c010602f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106032:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106037:	c1 e8 0c             	shr    $0xc,%eax
c010603a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010603d:	e8 fa a3 ff ff       	call   c010043c <get_running_thread_pcb>
c0106042:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106045:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106048:	8b 50 08             	mov    0x8(%eax),%edx
c010604b:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106050:	39 c2                	cmp    %eax,%edx
c0106052:	75 09                	jne    c010605d <alloc_virtual_memory+0x4e>
c0106054:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010605b:	eb 07                	jmp    c0106064 <alloc_virtual_memory+0x55>
c010605d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106064:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010606b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106072:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0106079:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106080:	eb 47                	jmp    c01060c9 <alloc_virtual_memory+0xba>
c0106082:	83 ec 08             	sub    $0x8,%esp
c0106085:	ff 75 f0             	pushl  -0x10(%ebp)
c0106088:	6a 01                	push   $0x1
c010608a:	e8 25 fe ff ff       	call   c0105eb4 <get_virtual_address>
c010608f:	83 c4 10             	add    $0x10,%esp
c0106092:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106095:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0106099:	74 13                	je     c01060ae <alloc_virtual_memory+0x9f>
c010609b:	83 ec 0c             	sub    $0xc,%esp
c010609e:	ff 75 f0             	pushl  -0x10(%ebp)
c01060a1:	e8 c0 fc ff ff       	call   c0105d66 <get_a_page>
c01060a6:	83 c4 10             	add    $0x10,%esp
c01060a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060ac:	eb 06                	jmp    c01060b4 <alloc_virtual_memory+0xa5>
c01060ae:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01060b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01060b4:	83 ec 08             	sub    $0x8,%esp
c01060b7:	ff 75 f4             	pushl  -0xc(%ebp)
c01060ba:	ff 75 d8             	pushl  -0x28(%ebp)
c01060bd:	e8 bc fe ff ff       	call   c0105f7e <add_map_entry>
c01060c2:	83 c4 10             	add    $0x10,%esp
c01060c5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01060c9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01060cc:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c01060cf:	72 b1                	jb     c0106082 <alloc_virtual_memory+0x73>
c01060d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01060d4:	25 ff 0f 00 00       	and    $0xfff,%eax
c01060d9:	89 c2                	mov    %eax,%edx
c01060db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060de:	01 d0                	add    %edx,%eax
c01060e0:	c9                   	leave  
c01060e1:	c3                   	ret    

c01060e2 <get_physical_address_proc>:
c01060e2:	55                   	push   %ebp
c01060e3:	89 e5                	mov    %esp,%ebp
c01060e5:	83 ec 18             	sub    $0x18,%esp
c01060e8:	e8 73 a2 ff ff       	call   c0100360 <disable_int>
c01060ed:	e8 4a a3 ff ff       	call   c010043c <get_running_thread_pcb>
c01060f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060f5:	83 ec 0c             	sub    $0xc,%esp
c01060f8:	ff 75 0c             	pushl  0xc(%ebp)
c01060fb:	e8 c6 d8 ff ff       	call   c01039c6 <pid2proc>
c0106100:	83 c4 10             	add    $0x10,%esp
c0106103:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106106:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106109:	8b 40 08             	mov    0x8(%eax),%eax
c010610c:	83 ec 0c             	sub    $0xc,%esp
c010610f:	50                   	push   %eax
c0106110:	e8 0b a3 ff ff       	call   c0100420 <update_cr3>
c0106115:	83 c4 10             	add    $0x10,%esp
c0106118:	83 ec 0c             	sub    $0xc,%esp
c010611b:	ff 75 08             	pushl  0x8(%ebp)
c010611e:	e8 34 fe ff ff       	call   c0105f57 <ptr_pte>
c0106123:	83 c4 10             	add    $0x10,%esp
c0106126:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106129:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010612c:	8b 00                	mov    (%eax),%eax
c010612e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106133:	89 c2                	mov    %eax,%edx
c0106135:	8b 45 08             	mov    0x8(%ebp),%eax
c0106138:	25 ff 0f 00 00       	and    $0xfff,%eax
c010613d:	09 d0                	or     %edx,%eax
c010613f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106142:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106145:	8b 40 08             	mov    0x8(%eax),%eax
c0106148:	83 ec 0c             	sub    $0xc,%esp
c010614b:	50                   	push   %eax
c010614c:	e8 cf a2 ff ff       	call   c0100420 <update_cr3>
c0106151:	83 c4 10             	add    $0x10,%esp
c0106154:	e8 09 a2 ff ff       	call   c0100362 <enable_int>
c0106159:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010615c:	c9                   	leave  
c010615d:	c3                   	ret    

c010615e <get_physical_address>:
c010615e:	55                   	push   %ebp
c010615f:	89 e5                	mov    %esp,%ebp
c0106161:	83 ec 10             	sub    $0x10,%esp
c0106164:	ff 75 08             	pushl  0x8(%ebp)
c0106167:	e8 eb fd ff ff       	call   c0105f57 <ptr_pte>
c010616c:	83 c4 04             	add    $0x4,%esp
c010616f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106172:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106175:	8b 00                	mov    (%eax),%eax
c0106177:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010617c:	89 c2                	mov    %eax,%edx
c010617e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106181:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106186:	09 d0                	or     %edx,%eax
c0106188:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010618b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010618e:	c9                   	leave  
c010618f:	c3                   	ret    

c0106190 <alloc_physical_memory_of_proc>:
c0106190:	55                   	push   %ebp
c0106191:	89 e5                	mov    %esp,%ebp
c0106193:	83 ec 48             	sub    $0x48,%esp
c0106196:	e8 c5 a1 ff ff       	call   c0100360 <disable_int>
c010619b:	8b 45 08             	mov    0x8(%ebp),%eax
c010619e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01061a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061a6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01061ad:	8b 45 0c             	mov    0xc(%ebp),%eax
c01061b0:	83 ec 0c             	sub    $0xc,%esp
c01061b3:	50                   	push   %eax
c01061b4:	e8 0d d8 ff ff       	call   c01039c6 <pid2proc>
c01061b9:	83 c4 10             	add    $0x10,%esp
c01061bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01061bf:	e8 78 a2 ff ff       	call   c010043c <get_running_thread_pcb>
c01061c4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01061c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061ca:	8b 40 0c             	mov    0xc(%eax),%eax
c01061cd:	83 ec 04             	sub    $0x4,%esp
c01061d0:	6a 0c                	push   $0xc
c01061d2:	50                   	push   %eax
c01061d3:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01061d6:	50                   	push   %eax
c01061d7:	e8 a0 0c 00 00       	call   c0106e7c <Memcpy>
c01061dc:	83 c4 10             	add    $0x10,%esp
c01061df:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01061e2:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01061e5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01061e8:	89 55 c8             	mov    %edx,-0x38(%ebp)
c01061eb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01061ee:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01061f1:	29 c2                	sub    %eax,%edx
c01061f3:	89 d0                	mov    %edx,%eax
c01061f5:	c1 e8 0c             	shr    $0xc,%eax
c01061f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01061fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01061fe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106201:	c1 e2 0c             	shl    $0xc,%edx
c0106204:	01 d0                	add    %edx,%eax
c0106206:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106209:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010620c:	6a 01                	push   $0x1
c010620e:	6a 01                	push   $0x1
c0106210:	50                   	push   %eax
c0106211:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0106214:	50                   	push   %eax
c0106215:	e8 06 fa ff ff       	call   c0105c20 <set_bits>
c010621a:	83 c4 10             	add    $0x10,%esp
c010621d:	83 ec 0c             	sub    $0xc,%esp
c0106220:	ff 75 f0             	pushl  -0x10(%ebp)
c0106223:	e8 3e fb ff ff       	call   c0105d66 <get_a_page>
c0106228:	83 c4 10             	add    $0x10,%esp
c010622b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010622e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106231:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106236:	89 c2                	mov    %eax,%edx
c0106238:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010623b:	01 d0                	add    %edx,%eax
c010623d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106240:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106243:	8b 40 08             	mov    0x8(%eax),%eax
c0106246:	83 ec 0c             	sub    $0xc,%esp
c0106249:	50                   	push   %eax
c010624a:	e8 d1 a1 ff ff       	call   c0100420 <update_cr3>
c010624f:	83 c4 10             	add    $0x10,%esp
c0106252:	83 ec 08             	sub    $0x8,%esp
c0106255:	ff 75 dc             	pushl  -0x24(%ebp)
c0106258:	ff 75 f4             	pushl  -0xc(%ebp)
c010625b:	e8 1e fd ff ff       	call   c0105f7e <add_map_entry>
c0106260:	83 c4 10             	add    $0x10,%esp
c0106263:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106266:	8b 40 08             	mov    0x8(%eax),%eax
c0106269:	83 ec 0c             	sub    $0xc,%esp
c010626c:	50                   	push   %eax
c010626d:	e8 ae a1 ff ff       	call   c0100420 <update_cr3>
c0106272:	83 c4 10             	add    $0x10,%esp
c0106275:	e8 e8 a0 ff ff       	call   c0100362 <enable_int>
c010627a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010627d:	c9                   	leave  
c010627e:	c3                   	ret    

c010627f <alloc_physical_memory>:
c010627f:	55                   	push   %ebp
c0106280:	89 e5                	mov    %esp,%ebp
c0106282:	83 ec 38             	sub    $0x38,%esp
c0106285:	8b 45 08             	mov    0x8(%ebp),%eax
c0106288:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010628d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106290:	e8 a7 a1 ff ff       	call   c010043c <get_running_thread_pcb>
c0106295:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106298:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010629c:	75 1a                	jne    c01062b8 <alloc_physical_memory+0x39>
c010629e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01062a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01062a6:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01062ab:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01062ae:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01062b3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01062b6:	eb 18                	jmp    c01062d0 <alloc_physical_memory+0x51>
c01062b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01062bb:	8b 40 0c             	mov    0xc(%eax),%eax
c01062be:	83 ec 04             	sub    $0x4,%esp
c01062c1:	6a 0c                	push   $0xc
c01062c3:	50                   	push   %eax
c01062c4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c01062c7:	50                   	push   %eax
c01062c8:	e8 af 0b 00 00       	call   c0106e7c <Memcpy>
c01062cd:	83 c4 10             	add    $0x10,%esp
c01062d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01062d3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01062d6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01062d9:	89 55 d0             	mov    %edx,-0x30(%ebp)
c01062dc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062df:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01062e2:	29 c2                	sub    %eax,%edx
c01062e4:	89 d0                	mov    %edx,%eax
c01062e6:	c1 e8 0c             	shr    $0xc,%eax
c01062e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01062ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062ef:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01062f2:	c1 e2 0c             	shl    $0xc,%edx
c01062f5:	01 d0                	add    %edx,%eax
c01062f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01062fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062fd:	6a 01                	push   $0x1
c01062ff:	6a 01                	push   $0x1
c0106301:	50                   	push   %eax
c0106302:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106305:	50                   	push   %eax
c0106306:	e8 15 f9 ff ff       	call   c0105c20 <set_bits>
c010630b:	83 c4 10             	add    $0x10,%esp
c010630e:	83 ec 0c             	sub    $0xc,%esp
c0106311:	ff 75 0c             	pushl  0xc(%ebp)
c0106314:	e8 4d fa ff ff       	call   c0105d66 <get_a_page>
c0106319:	83 c4 10             	add    $0x10,%esp
c010631c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010631f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106322:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106327:	89 c2                	mov    %eax,%edx
c0106329:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010632c:	01 d0                	add    %edx,%eax
c010632e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106331:	83 ec 08             	sub    $0x8,%esp
c0106334:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106337:	ff 75 f4             	pushl  -0xc(%ebp)
c010633a:	e8 3f fc ff ff       	call   c0105f7e <add_map_entry>
c010633f:	83 c4 10             	add    $0x10,%esp
c0106342:	8b 45 08             	mov    0x8(%ebp),%eax
c0106345:	c9                   	leave  
c0106346:	c3                   	ret    

c0106347 <alloc_memory>:
c0106347:	55                   	push   %ebp
c0106348:	89 e5                	mov    %esp,%ebp
c010634a:	83 ec 18             	sub    $0x18,%esp
c010634d:	83 ec 08             	sub    $0x8,%esp
c0106350:	ff 75 0c             	pushl  0xc(%ebp)
c0106353:	ff 75 08             	pushl  0x8(%ebp)
c0106356:	e8 59 fb ff ff       	call   c0105eb4 <get_virtual_address>
c010635b:	83 c4 10             	add    $0x10,%esp
c010635e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106361:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106364:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106369:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010636c:	eb 29                	jmp    c0106397 <alloc_memory+0x50>
c010636e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106375:	83 ec 0c             	sub    $0xc,%esp
c0106378:	ff 75 0c             	pushl  0xc(%ebp)
c010637b:	e8 e6 f9 ff ff       	call   c0105d66 <get_a_page>
c0106380:	83 c4 10             	add    $0x10,%esp
c0106383:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106386:	83 ec 08             	sub    $0x8,%esp
c0106389:	ff 75 ec             	pushl  -0x14(%ebp)
c010638c:	ff 75 f4             	pushl  -0xc(%ebp)
c010638f:	e8 ea fb ff ff       	call   c0105f7e <add_map_entry>
c0106394:	83 c4 10             	add    $0x10,%esp
c0106397:	8b 45 08             	mov    0x8(%ebp),%eax
c010639a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010639d:	89 55 08             	mov    %edx,0x8(%ebp)
c01063a0:	85 c0                	test   %eax,%eax
c01063a2:	75 ca                	jne    c010636e <alloc_memory+0x27>
c01063a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01063a7:	c9                   	leave  
c01063a8:	c3                   	ret    

c01063a9 <get_a_virtual_page>:
c01063a9:	55                   	push   %ebp
c01063aa:	89 e5                	mov    %esp,%ebp
c01063ac:	83 ec 18             	sub    $0x18,%esp
c01063af:	83 ec 0c             	sub    $0xc,%esp
c01063b2:	ff 75 08             	pushl  0x8(%ebp)
c01063b5:	e8 ac f9 ff ff       	call   c0105d66 <get_a_page>
c01063ba:	83 c4 10             	add    $0x10,%esp
c01063bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01063c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01063c3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01063c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01063cb:	83 ec 08             	sub    $0x8,%esp
c01063ce:	ff 75 f4             	pushl  -0xc(%ebp)
c01063d1:	ff 75 f0             	pushl  -0x10(%ebp)
c01063d4:	e8 a5 fb ff ff       	call   c0105f7e <add_map_entry>
c01063d9:	83 c4 10             	add    $0x10,%esp
c01063dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01063df:	c9                   	leave  
c01063e0:	c3                   	ret    

c01063e1 <block2arena>:
c01063e1:	55                   	push   %ebp
c01063e2:	89 e5                	mov    %esp,%ebp
c01063e4:	83 ec 10             	sub    $0x10,%esp
c01063e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01063ea:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01063ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01063f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01063f5:	c9                   	leave  
c01063f6:	c3                   	ret    

c01063f7 <sys_malloc2>:
c01063f7:	55                   	push   %ebp
c01063f8:	89 e5                	mov    %esp,%ebp
c01063fa:	83 ec 68             	sub    $0x68,%esp
c01063fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106404:	e8 33 a0 ff ff       	call   c010043c <get_running_thread_pcb>
c0106409:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010640c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010640f:	8b 50 08             	mov    0x8(%eax),%edx
c0106412:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106417:	39 c2                	cmp    %eax,%edx
c0106419:	75 10                	jne    c010642b <sys_malloc2+0x34>
c010641b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106422:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106429:	eb 10                	jmp    c010643b <sys_malloc2+0x44>
c010642b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106432:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106435:	83 c0 10             	add    $0x10,%eax
c0106438:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010643b:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0106442:	76 52                	jbe    c0106496 <sys_malloc2+0x9f>
c0106444:	8b 45 08             	mov    0x8(%ebp),%eax
c0106447:	05 0b 10 00 00       	add    $0x100b,%eax
c010644c:	c1 e8 0c             	shr    $0xc,%eax
c010644f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106452:	83 ec 08             	sub    $0x8,%esp
c0106455:	ff 75 f0             	pushl  -0x10(%ebp)
c0106458:	ff 75 d8             	pushl  -0x28(%ebp)
c010645b:	e8 e7 fe ff ff       	call   c0106347 <alloc_memory>
c0106460:	83 c4 10             	add    $0x10,%esp
c0106463:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106466:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106469:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010646c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010646f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106475:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106478:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010647f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106482:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106486:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106489:	05 90 00 00 00       	add    $0x90,%eax
c010648e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106491:	e9 f0 01 00 00       	jmp    c0106686 <sys_malloc2+0x28f>
c0106496:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010649d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01064a4:	eb 26                	jmp    c01064cc <sys_malloc2+0xd5>
c01064a6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01064a9:	89 d0                	mov    %edx,%eax
c01064ab:	01 c0                	add    %eax,%eax
c01064ad:	01 d0                	add    %edx,%eax
c01064af:	c1 e0 03             	shl    $0x3,%eax
c01064b2:	89 c2                	mov    %eax,%edx
c01064b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01064b7:	01 d0                	add    %edx,%eax
c01064b9:	8b 00                	mov    (%eax),%eax
c01064bb:	39 45 08             	cmp    %eax,0x8(%ebp)
c01064be:	77 08                	ja     c01064c8 <sys_malloc2+0xd1>
c01064c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01064c3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01064c6:	eb 0a                	jmp    c01064d2 <sys_malloc2+0xdb>
c01064c8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01064cc:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c01064d0:	7e d4                	jle    c01064a6 <sys_malloc2+0xaf>
c01064d2:	83 ec 08             	sub    $0x8,%esp
c01064d5:	ff 75 f0             	pushl  -0x10(%ebp)
c01064d8:	6a 01                	push   $0x1
c01064da:	e8 68 fe ff ff       	call   c0106347 <alloc_memory>
c01064df:	83 c4 10             	add    $0x10,%esp
c01064e2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01064e5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01064e8:	89 d0                	mov    %edx,%eax
c01064ea:	01 c0                	add    %eax,%eax
c01064ec:	01 d0                	add    %edx,%eax
c01064ee:	c1 e0 03             	shl    $0x3,%eax
c01064f1:	89 c2                	mov    %eax,%edx
c01064f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01064f6:	01 d0                	add    %edx,%eax
c01064f8:	83 ec 04             	sub    $0x4,%esp
c01064fb:	6a 18                	push   $0x18
c01064fd:	50                   	push   %eax
c01064fe:	ff 75 cc             	pushl  -0x34(%ebp)
c0106501:	e8 76 09 00 00       	call   c0106e7c <Memcpy>
c0106506:	83 c4 10             	add    $0x10,%esp
c0106509:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0106510:	e8 03 09 00 00       	call   c0106e18 <intr_disable>
c0106515:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106518:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010651b:	89 d0                	mov    %edx,%eax
c010651d:	01 c0                	add    %eax,%eax
c010651f:	01 d0                	add    %edx,%eax
c0106521:	c1 e0 03             	shl    $0x3,%eax
c0106524:	89 c2                	mov    %eax,%edx
c0106526:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106529:	01 d0                	add    %edx,%eax
c010652b:	83 c0 08             	add    $0x8,%eax
c010652e:	83 ec 0c             	sub    $0xc,%esp
c0106531:	50                   	push   %eax
c0106532:	e8 1c 3d 00 00       	call   c010a253 <isListEmpty>
c0106537:	83 c4 10             	add    $0x10,%esp
c010653a:	3c 01                	cmp    $0x1,%al
c010653c:	0f 85 c1 00 00 00    	jne    c0106603 <sys_malloc2+0x20c>
c0106542:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106549:	83 ec 08             	sub    $0x8,%esp
c010654c:	ff 75 f0             	pushl  -0x10(%ebp)
c010654f:	6a 01                	push   $0x1
c0106551:	e8 f1 fd ff ff       	call   c0106347 <alloc_memory>
c0106556:	83 c4 10             	add    $0x10,%esp
c0106559:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010655c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010655f:	83 ec 0c             	sub    $0xc,%esp
c0106562:	50                   	push   %eax
c0106563:	e8 79 fe ff ff       	call   c01063e1 <block2arena>
c0106568:	83 c4 10             	add    $0x10,%esp
c010656b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010656e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106571:	89 d0                	mov    %edx,%eax
c0106573:	01 c0                	add    %eax,%eax
c0106575:	01 d0                	add    %edx,%eax
c0106577:	c1 e0 03             	shl    $0x3,%eax
c010657a:	89 c2                	mov    %eax,%edx
c010657c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010657f:	01 d0                	add    %edx,%eax
c0106581:	8b 50 04             	mov    0x4(%eax),%edx
c0106584:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106587:	89 50 04             	mov    %edx,0x4(%eax)
c010658a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010658d:	8b 00                	mov    (%eax),%eax
c010658f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106592:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106599:	b8 00 10 00 00       	mov    $0x1000,%eax
c010659e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c01065a1:	ba 00 00 00 00       	mov    $0x0,%edx
c01065a6:	f7 75 b8             	divl   -0x48(%ebp)
c01065a9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01065ac:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01065af:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01065b2:	01 d0                	add    %edx,%eax
c01065b4:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01065b7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01065be:	eb 3b                	jmp    c01065fb <sys_malloc2+0x204>
c01065c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01065c3:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c01065c7:	89 c2                	mov    %eax,%edx
c01065c9:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01065cc:	01 d0                	add    %edx,%eax
c01065ce:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01065d1:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01065d4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01065d7:	89 d0                	mov    %edx,%eax
c01065d9:	01 c0                	add    %eax,%eax
c01065db:	01 d0                	add    %edx,%eax
c01065dd:	c1 e0 03             	shl    $0x3,%eax
c01065e0:	89 c2                	mov    %eax,%edx
c01065e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01065e5:	01 d0                	add    %edx,%eax
c01065e7:	83 c0 08             	add    $0x8,%eax
c01065ea:	83 ec 08             	sub    $0x8,%esp
c01065ed:	51                   	push   %ecx
c01065ee:	50                   	push   %eax
c01065ef:	e8 5c 3d 00 00       	call   c010a350 <appendToDoubleLinkList>
c01065f4:	83 c4 10             	add    $0x10,%esp
c01065f7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01065fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01065fe:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0106601:	77 bd                	ja     c01065c0 <sys_malloc2+0x1c9>
c0106603:	83 ec 0c             	sub    $0xc,%esp
c0106606:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106609:	e8 33 08 00 00       	call   c0106e41 <intr_set_status>
c010660e:	83 c4 10             	add    $0x10,%esp
c0106611:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106614:	89 d0                	mov    %edx,%eax
c0106616:	01 c0                	add    %eax,%eax
c0106618:	01 d0                	add    %edx,%eax
c010661a:	c1 e0 03             	shl    $0x3,%eax
c010661d:	89 c2                	mov    %eax,%edx
c010661f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106622:	01 d0                	add    %edx,%eax
c0106624:	83 c0 08             	add    $0x8,%eax
c0106627:	83 ec 0c             	sub    $0xc,%esp
c010662a:	50                   	push   %eax
c010662b:	e8 8a 3e 00 00       	call   c010a4ba <popFromDoubleLinkList>
c0106630:	83 c4 10             	add    $0x10,%esp
c0106633:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106636:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106639:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010663c:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0106640:	75 1c                	jne    c010665e <sys_malloc2+0x267>
c0106642:	68 ef 01 00 00       	push   $0x1ef
c0106647:	68 9a b5 10 c0       	push   $0xc010b59a
c010664c:	68 9a b5 10 c0       	push   $0xc010b59a
c0106651:	68 bb b5 10 c0       	push   $0xc010b5bb
c0106656:	e8 3a 24 00 00       	call   c0108a95 <assertion_failure>
c010665b:	83 c4 10             	add    $0x10,%esp
c010665e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106661:	83 ec 0c             	sub    $0xc,%esp
c0106664:	50                   	push   %eax
c0106665:	e8 77 fd ff ff       	call   c01063e1 <block2arena>
c010666a:	83 c4 10             	add    $0x10,%esp
c010666d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106670:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106673:	8b 40 04             	mov    0x4(%eax),%eax
c0106676:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106679:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010667c:	89 50 04             	mov    %edx,0x4(%eax)
c010667f:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106686:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010668a:	75 1c                	jne    c01066a8 <sys_malloc2+0x2b1>
c010668c:	68 f6 01 00 00       	push   $0x1f6
c0106691:	68 9a b5 10 c0       	push   $0xc010b59a
c0106696:	68 9a b5 10 c0       	push   $0xc010b59a
c010669b:	68 cd b5 10 c0       	push   $0xc010b5cd
c01066a0:	e8 f0 23 00 00       	call   c0108a95 <assertion_failure>
c01066a5:	83 c4 10             	add    $0x10,%esp
c01066a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01066ab:	c9                   	leave  
c01066ac:	c3                   	ret    

c01066ad <remove_map_entry>:
c01066ad:	55                   	push   %ebp
c01066ae:	89 e5                	mov    %esp,%ebp
c01066b0:	83 ec 10             	sub    $0x10,%esp
c01066b3:	ff 75 08             	pushl  0x8(%ebp)
c01066b6:	e8 9c f8 ff ff       	call   c0105f57 <ptr_pte>
c01066bb:	83 c4 04             	add    $0x4,%esp
c01066be:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01066c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01066c4:	8b 10                	mov    (%eax),%edx
c01066c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01066c9:	89 10                	mov    %edx,(%eax)
c01066cb:	90                   	nop
c01066cc:	c9                   	leave  
c01066cd:	c3                   	ret    

c01066ce <free_a_page>:
c01066ce:	55                   	push   %ebp
c01066cf:	89 e5                	mov    %esp,%ebp
c01066d1:	83 ec 20             	sub    $0x20,%esp
c01066d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01066d8:	75 21                	jne    c01066fb <free_a_page+0x2d>
c01066da:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01066df:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01066e2:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01066e7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01066ea:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01066ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01066f2:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c01066f9:	eb 1f                	jmp    c010671a <free_a_page+0x4c>
c01066fb:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106700:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106703:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106708:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010670b:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106710:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106713:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c010671a:	8b 45 08             	mov    0x8(%ebp),%eax
c010671d:	c1 e8 0c             	shr    $0xc,%eax
c0106720:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106723:	6a 00                	push   $0x0
c0106725:	ff 75 f8             	pushl  -0x8(%ebp)
c0106728:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c010672b:	50                   	push   %eax
c010672c:	e8 74 f4 ff ff       	call   c0105ba5 <set_bit_val>
c0106731:	83 c4 0c             	add    $0xc,%esp
c0106734:	ff 75 08             	pushl  0x8(%ebp)
c0106737:	e8 22 fa ff ff       	call   c010615e <get_physical_address>
c010673c:	83 c4 04             	add    $0x4,%esp
c010673f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106742:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106745:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010674b:	85 c0                	test   %eax,%eax
c010674d:	0f 48 c2             	cmovs  %edx,%eax
c0106750:	c1 f8 0c             	sar    $0xc,%eax
c0106753:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106756:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106759:	6a 00                	push   $0x0
c010675b:	ff 75 f0             	pushl  -0x10(%ebp)
c010675e:	50                   	push   %eax
c010675f:	e8 41 f4 ff ff       	call   c0105ba5 <set_bit_val>
c0106764:	83 c4 0c             	add    $0xc,%esp
c0106767:	ff 75 08             	pushl  0x8(%ebp)
c010676a:	e8 3e ff ff ff       	call   c01066ad <remove_map_entry>
c010676f:	83 c4 04             	add    $0x4,%esp
c0106772:	90                   	nop
c0106773:	c9                   	leave  
c0106774:	c3                   	ret    

c0106775 <sys_free2>:
c0106775:	55                   	push   %ebp
c0106776:	89 e5                	mov    %esp,%ebp
c0106778:	83 ec 58             	sub    $0x58,%esp
c010677b:	e8 bc 9c ff ff       	call   c010043c <get_running_thread_pcb>
c0106780:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106783:	e8 90 06 00 00       	call   c0106e18 <intr_disable>
c0106788:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010678b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010678e:	8b 50 08             	mov    0x8(%eax),%edx
c0106791:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106796:	39 c2                	cmp    %eax,%edx
c0106798:	75 10                	jne    c01067aa <sys_free2+0x35>
c010679a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01067a1:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c01067a8:	eb 10                	jmp    c01067ba <sys_free2+0x45>
c01067aa:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01067b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01067b4:	83 c0 10             	add    $0x10,%eax
c01067b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01067ba:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c01067c1:	76 4d                	jbe    c0106810 <sys_free2+0x9b>
c01067c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01067c6:	83 e8 0c             	sub    $0xc,%eax
c01067c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067cc:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c01067d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01067d3:	05 ff 0f 00 00       	add    $0xfff,%eax
c01067d8:	c1 e8 0c             	shr    $0xc,%eax
c01067db:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01067de:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01067e5:	eb 1c                	jmp    c0106803 <sys_free2+0x8e>
c01067e7:	83 ec 08             	sub    $0x8,%esp
c01067ea:	ff 75 f4             	pushl  -0xc(%ebp)
c01067ed:	ff 75 ec             	pushl  -0x14(%ebp)
c01067f0:	e8 d9 fe ff ff       	call   c01066ce <free_a_page>
c01067f5:	83 c4 10             	add    $0x10,%esp
c01067f8:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c01067ff:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106803:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106806:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106809:	77 dc                	ja     c01067e7 <sys_free2+0x72>
c010680b:	e9 dc 00 00 00       	jmp    c01068ec <sys_free2+0x177>
c0106810:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106817:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010681e:	eb 26                	jmp    c0106846 <sys_free2+0xd1>
c0106820:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106823:	89 d0                	mov    %edx,%eax
c0106825:	01 c0                	add    %eax,%eax
c0106827:	01 d0                	add    %edx,%eax
c0106829:	c1 e0 03             	shl    $0x3,%eax
c010682c:	89 c2                	mov    %eax,%edx
c010682e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106831:	01 d0                	add    %edx,%eax
c0106833:	8b 00                	mov    (%eax),%eax
c0106835:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106838:	77 08                	ja     c0106842 <sys_free2+0xcd>
c010683a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010683d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106840:	eb 0a                	jmp    c010684c <sys_free2+0xd7>
c0106842:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106846:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c010684a:	7e d4                	jle    c0106820 <sys_free2+0xab>
c010684c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010684f:	89 d0                	mov    %edx,%eax
c0106851:	01 c0                	add    %eax,%eax
c0106853:	01 d0                	add    %edx,%eax
c0106855:	c1 e0 03             	shl    $0x3,%eax
c0106858:	89 c2                	mov    %eax,%edx
c010685a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010685d:	01 d0                	add    %edx,%eax
c010685f:	8b 10                	mov    (%eax),%edx
c0106861:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106864:	8b 50 04             	mov    0x4(%eax),%edx
c0106867:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010686a:	8b 50 08             	mov    0x8(%eax),%edx
c010686d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106870:	8b 50 0c             	mov    0xc(%eax),%edx
c0106873:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106876:	8b 50 10             	mov    0x10(%eax),%edx
c0106879:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010687c:	8b 40 14             	mov    0x14(%eax),%eax
c010687f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106882:	8b 45 08             	mov    0x8(%ebp),%eax
c0106885:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106888:	83 ec 0c             	sub    $0xc,%esp
c010688b:	ff 75 d0             	pushl  -0x30(%ebp)
c010688e:	e8 4e fb ff ff       	call   c01063e1 <block2arena>
c0106893:	83 c4 10             	add    $0x10,%esp
c0106896:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106899:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010689c:	89 d0                	mov    %edx,%eax
c010689e:	01 c0                	add    %eax,%eax
c01068a0:	01 d0                	add    %edx,%eax
c01068a2:	c1 e0 03             	shl    $0x3,%eax
c01068a5:	89 c2                	mov    %eax,%edx
c01068a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01068aa:	01 d0                	add    %edx,%eax
c01068ac:	83 c0 08             	add    $0x8,%eax
c01068af:	83 ec 08             	sub    $0x8,%esp
c01068b2:	ff 75 d0             	pushl  -0x30(%ebp)
c01068b5:	50                   	push   %eax
c01068b6:	e8 95 3a 00 00       	call   c010a350 <appendToDoubleLinkList>
c01068bb:	83 c4 10             	add    $0x10,%esp
c01068be:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01068c1:	8b 40 04             	mov    0x4(%eax),%eax
c01068c4:	8d 50 01             	lea    0x1(%eax),%edx
c01068c7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01068ca:	89 50 04             	mov    %edx,0x4(%eax)
c01068cd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01068d0:	8b 50 04             	mov    0x4(%eax),%edx
c01068d3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01068d6:	39 c2                	cmp    %eax,%edx
c01068d8:	75 12                	jne    c01068ec <sys_free2+0x177>
c01068da:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01068dd:	83 ec 08             	sub    $0x8,%esp
c01068e0:	ff 75 f4             	pushl  -0xc(%ebp)
c01068e3:	50                   	push   %eax
c01068e4:	e8 e5 fd ff ff       	call   c01066ce <free_a_page>
c01068e9:	83 c4 10             	add    $0x10,%esp
c01068ec:	83 ec 0c             	sub    $0xc,%esp
c01068ef:	ff 75 d8             	pushl  -0x28(%ebp)
c01068f2:	e8 4a 05 00 00       	call   c0106e41 <intr_set_status>
c01068f7:	83 c4 10             	add    $0x10,%esp
c01068fa:	90                   	nop
c01068fb:	c9                   	leave  
c01068fc:	c3                   	ret    

c01068fd <init_memory_block_desc>:
c01068fd:	55                   	push   %ebp
c01068fe:	89 e5                	mov    %esp,%ebp
c0106900:	83 ec 18             	sub    $0x18,%esp
c0106903:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010690a:	e9 b2 00 00 00       	jmp    c01069c1 <init_memory_block_desc+0xc4>
c010690f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106913:	75 1b                	jne    c0106930 <init_memory_block_desc+0x33>
c0106915:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106918:	89 d0                	mov    %edx,%eax
c010691a:	01 c0                	add    %eax,%eax
c010691c:	01 d0                	add    %edx,%eax
c010691e:	c1 e0 03             	shl    $0x3,%eax
c0106921:	89 c2                	mov    %eax,%edx
c0106923:	8b 45 08             	mov    0x8(%ebp),%eax
c0106926:	01 d0                	add    %edx,%eax
c0106928:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010692e:	eb 2e                	jmp    c010695e <init_memory_block_desc+0x61>
c0106930:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106933:	89 d0                	mov    %edx,%eax
c0106935:	01 c0                	add    %eax,%eax
c0106937:	01 d0                	add    %edx,%eax
c0106939:	c1 e0 03             	shl    $0x3,%eax
c010693c:	8d 50 e8             	lea    -0x18(%eax),%edx
c010693f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106942:	01 d0                	add    %edx,%eax
c0106944:	8b 08                	mov    (%eax),%ecx
c0106946:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106949:	89 d0                	mov    %edx,%eax
c010694b:	01 c0                	add    %eax,%eax
c010694d:	01 d0                	add    %edx,%eax
c010694f:	c1 e0 03             	shl    $0x3,%eax
c0106952:	89 c2                	mov    %eax,%edx
c0106954:	8b 45 08             	mov    0x8(%ebp),%eax
c0106957:	01 d0                	add    %edx,%eax
c0106959:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c010695c:	89 10                	mov    %edx,(%eax)
c010695e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106961:	89 d0                	mov    %edx,%eax
c0106963:	01 c0                	add    %eax,%eax
c0106965:	01 d0                	add    %edx,%eax
c0106967:	c1 e0 03             	shl    $0x3,%eax
c010696a:	89 c2                	mov    %eax,%edx
c010696c:	8b 45 08             	mov    0x8(%ebp),%eax
c010696f:	01 d0                	add    %edx,%eax
c0106971:	8b 00                	mov    (%eax),%eax
c0106973:	89 c1                	mov    %eax,%ecx
c0106975:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c010697a:	ba 00 00 00 00       	mov    $0x0,%edx
c010697f:	f7 f1                	div    %ecx
c0106981:	89 c1                	mov    %eax,%ecx
c0106983:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106986:	89 d0                	mov    %edx,%eax
c0106988:	01 c0                	add    %eax,%eax
c010698a:	01 d0                	add    %edx,%eax
c010698c:	c1 e0 03             	shl    $0x3,%eax
c010698f:	89 c2                	mov    %eax,%edx
c0106991:	8b 45 08             	mov    0x8(%ebp),%eax
c0106994:	01 d0                	add    %edx,%eax
c0106996:	89 ca                	mov    %ecx,%edx
c0106998:	89 50 04             	mov    %edx,0x4(%eax)
c010699b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010699e:	89 d0                	mov    %edx,%eax
c01069a0:	01 c0                	add    %eax,%eax
c01069a2:	01 d0                	add    %edx,%eax
c01069a4:	c1 e0 03             	shl    $0x3,%eax
c01069a7:	89 c2                	mov    %eax,%edx
c01069a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01069ac:	01 d0                	add    %edx,%eax
c01069ae:	83 c0 08             	add    $0x8,%eax
c01069b1:	83 ec 0c             	sub    $0xc,%esp
c01069b4:	50                   	push   %eax
c01069b5:	e8 6b 38 00 00       	call   c010a225 <initDoubleLinkList>
c01069ba:	83 c4 10             	add    $0x10,%esp
c01069bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01069c1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01069c5:	0f 8e 44 ff ff ff    	jle    c010690f <init_memory_block_desc+0x12>
c01069cb:	90                   	nop
c01069cc:	c9                   	leave  
c01069cd:	c3                   	ret    

c01069ce <init_memory2>:
c01069ce:	55                   	push   %ebp
c01069cf:	89 e5                	mov    %esp,%ebp
c01069d1:	83 ec 38             	sub    $0x38,%esp
c01069d4:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c01069db:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c01069e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01069e5:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c01069ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01069ed:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01069f2:	29 c2                	sub    %eax,%edx
c01069f4:	89 d0                	mov    %edx,%eax
c01069f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01069f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01069fc:	89 c2                	mov    %eax,%edx
c01069fe:	c1 ea 1f             	shr    $0x1f,%edx
c0106a01:	01 d0                	add    %edx,%eax
c0106a03:	d1 f8                	sar    %eax
c0106a05:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106a0a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106a0f:	83 ec 0c             	sub    $0xc,%esp
c0106a12:	50                   	push   %eax
c0106a13:	e8 52 08 00 00       	call   c010726a <disp_int>
c0106a18:	83 c4 10             	add    $0x10,%esp
c0106a1b:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106a20:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a23:	29 c2                	sub    %eax,%edx
c0106a25:	89 d0                	mov    %edx,%eax
c0106a27:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c0106a2c:	83 ec 0c             	sub    $0xc,%esp
c0106a2f:	68 d9 b5 10 c0       	push   $0xc010b5d9
c0106a34:	e8 a0 96 ff ff       	call   c01000d9 <disp_str>
c0106a39:	83 c4 10             	add    $0x10,%esp
c0106a3c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106a41:	83 ec 0c             	sub    $0xc,%esp
c0106a44:	50                   	push   %eax
c0106a45:	e8 20 08 00 00       	call   c010726a <disp_int>
c0106a4a:	83 c4 10             	add    $0x10,%esp
c0106a4d:	83 ec 0c             	sub    $0xc,%esp
c0106a50:	68 d9 b5 10 c0       	push   $0xc010b5d9
c0106a55:	e8 7f 96 ff ff       	call   c01000d9 <disp_str>
c0106a5a:	83 c4 10             	add    $0x10,%esp
c0106a5d:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106a62:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a67:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a6d:	85 c0                	test   %eax,%eax
c0106a6f:	0f 48 c2             	cmovs  %edx,%eax
c0106a72:	c1 f8 0c             	sar    $0xc,%eax
c0106a75:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106a78:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106a7b:	83 c0 07             	add    $0x7,%eax
c0106a7e:	8d 50 07             	lea    0x7(%eax),%edx
c0106a81:	85 c0                	test   %eax,%eax
c0106a83:	0f 48 c2             	cmovs  %edx,%eax
c0106a86:	c1 f8 03             	sar    $0x3,%eax
c0106a89:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106a8e:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106a93:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106a98:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106a9d:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106aa3:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106aa8:	83 ec 04             	sub    $0x4,%esp
c0106aab:	52                   	push   %edx
c0106aac:	6a 00                	push   $0x0
c0106aae:	50                   	push   %eax
c0106aaf:	e8 fb 56 00 00       	call   c010c1af <Memset>
c0106ab4:	83 c4 10             	add    $0x10,%esp
c0106ab7:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0106abc:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106ac1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106ac7:	85 c0                	test   %eax,%eax
c0106ac9:	0f 48 c2             	cmovs  %edx,%eax
c0106acc:	c1 f8 0c             	sar    $0xc,%eax
c0106acf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106ad2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ad5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106ad8:	ff 75 e8             	pushl  -0x18(%ebp)
c0106adb:	6a 01                	push   $0x1
c0106add:	6a 00                	push   $0x0
c0106adf:	68 ac 06 11 c0       	push   $0xc01106ac
c0106ae4:	e8 37 f1 ff ff       	call   c0105c20 <set_bits>
c0106ae9:	83 c4 10             	add    $0x10,%esp
c0106aec:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106af1:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106af6:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106afc:	85 c0                	test   %eax,%eax
c0106afe:	0f 48 c2             	cmovs  %edx,%eax
c0106b01:	c1 f8 0c             	sar    $0xc,%eax
c0106b04:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106b07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106b0a:	83 c0 07             	add    $0x7,%eax
c0106b0d:	8d 50 07             	lea    0x7(%eax),%edx
c0106b10:	85 c0                	test   %eax,%eax
c0106b12:	0f 48 c2             	cmovs  %edx,%eax
c0106b15:	c1 f8 03             	sar    $0x3,%eax
c0106b18:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106b1d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106b22:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106b28:	01 d0                	add    %edx,%eax
c0106b2a:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106b2f:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106b35:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106b3a:	83 ec 04             	sub    $0x4,%esp
c0106b3d:	52                   	push   %edx
c0106b3e:	6a 00                	push   $0x0
c0106b40:	50                   	push   %eax
c0106b41:	e8 69 56 00 00       	call   c010c1af <Memset>
c0106b46:	83 c4 10             	add    $0x10,%esp
c0106b49:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106b4e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106b53:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106b59:	85 c0                	test   %eax,%eax
c0106b5b:	0f 48 c2             	cmovs  %edx,%eax
c0106b5e:	c1 f8 0c             	sar    $0xc,%eax
c0106b61:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106b67:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106b6a:	ff 75 e8             	pushl  -0x18(%ebp)
c0106b6d:	6a 01                	push   $0x1
c0106b6f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106b72:	68 ac 06 11 c0       	push   $0xc01106ac
c0106b77:	e8 a4 f0 ff ff       	call   c0105c20 <set_bits>
c0106b7c:	83 c4 10             	add    $0x10,%esp
c0106b7f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106b86:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106b89:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106b8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106b8f:	83 c0 07             	add    $0x7,%eax
c0106b92:	8d 50 07             	lea    0x7(%eax),%edx
c0106b95:	85 c0                	test   %eax,%eax
c0106b97:	0f 48 c2             	cmovs  %edx,%eax
c0106b9a:	c1 f8 03             	sar    $0x3,%eax
c0106b9d:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106ba2:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106ba7:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106bad:	01 c2                	add    %eax,%edx
c0106baf:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106bb4:	01 d0                	add    %edx,%eax
c0106bb6:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106bbb:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106bc1:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106bc6:	83 ec 04             	sub    $0x4,%esp
c0106bc9:	52                   	push   %edx
c0106bca:	6a 00                	push   $0x0
c0106bcc:	50                   	push   %eax
c0106bcd:	e8 dd 55 00 00       	call   c010c1af <Memset>
c0106bd2:	83 c4 10             	add    $0x10,%esp
c0106bd5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106bd8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106bdb:	01 d0                	add    %edx,%eax
c0106bdd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106be0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106be5:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106bea:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106bf0:	85 c0                	test   %eax,%eax
c0106bf2:	0f 48 c2             	cmovs  %edx,%eax
c0106bf5:	c1 f8 0c             	sar    $0xc,%eax
c0106bf8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106bfb:	ff 75 e8             	pushl  -0x18(%ebp)
c0106bfe:	6a 01                	push   $0x1
c0106c00:	ff 75 e0             	pushl  -0x20(%ebp)
c0106c03:	68 ac 06 11 c0       	push   $0xc01106ac
c0106c08:	e8 13 f0 ff ff       	call   c0105c20 <set_bits>
c0106c0d:	83 c4 10             	add    $0x10,%esp
c0106c10:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106c13:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106c16:	01 d0                	add    %edx,%eax
c0106c18:	c1 e0 0c             	shl    $0xc,%eax
c0106c1b:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106c20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106c23:	83 c0 02             	add    $0x2,%eax
c0106c26:	c1 e0 0c             	shl    $0xc,%eax
c0106c29:	89 c2                	mov    %eax,%edx
c0106c2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106c2e:	01 d0                	add    %edx,%eax
c0106c30:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106c35:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106c3c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106c3f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106c42:	90                   	nop
c0106c43:	c9                   	leave  
c0106c44:	c3                   	ret    

c0106c45 <init_memory>:
c0106c45:	55                   	push   %ebp
c0106c46:	89 e5                	mov    %esp,%ebp
c0106c48:	83 ec 38             	sub    $0x38,%esp
c0106c4b:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106c52:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106c59:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106c60:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106c63:	05 00 00 40 00       	add    $0x400000,%eax
c0106c68:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106c6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106c6e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106c71:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106c77:	85 c0                	test   %eax,%eax
c0106c79:	0f 48 c2             	cmovs  %edx,%eax
c0106c7c:	c1 f8 0c             	sar    $0xc,%eax
c0106c7f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106c82:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106c85:	89 c2                	mov    %eax,%edx
c0106c87:	c1 ea 1f             	shr    $0x1f,%edx
c0106c8a:	01 d0                	add    %edx,%eax
c0106c8c:	d1 f8                	sar    %eax
c0106c8e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106c91:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106c94:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106c97:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106c9a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106c9d:	8d 50 07             	lea    0x7(%eax),%edx
c0106ca0:	85 c0                	test   %eax,%eax
c0106ca2:	0f 48 c2             	cmovs  %edx,%eax
c0106ca5:	c1 f8 03             	sar    $0x3,%eax
c0106ca8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106cab:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106cae:	8d 50 07             	lea    0x7(%eax),%edx
c0106cb1:	85 c0                	test   %eax,%eax
c0106cb3:	0f 48 c2             	cmovs  %edx,%eax
c0106cb6:	c1 f8 03             	sar    $0x3,%eax
c0106cb9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106cbc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106cbf:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106cc4:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106cc9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106ccc:	c1 e2 0c             	shl    $0xc,%edx
c0106ccf:	01 d0                	add    %edx,%eax
c0106cd1:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106cd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cd9:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106cde:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ce1:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106ce6:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106ceb:	83 ec 04             	sub    $0x4,%esp
c0106cee:	ff 75 d8             	pushl  -0x28(%ebp)
c0106cf1:	6a 00                	push   $0x0
c0106cf3:	50                   	push   %eax
c0106cf4:	e8 b6 54 00 00       	call   c010c1af <Memset>
c0106cf9:	83 c4 10             	add    $0x10,%esp
c0106cfc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106cff:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106d02:	01 d0                	add    %edx,%eax
c0106d04:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106d09:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106d0c:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106d11:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106d16:	83 ec 04             	sub    $0x4,%esp
c0106d19:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106d1c:	6a 00                	push   $0x0
c0106d1e:	50                   	push   %eax
c0106d1f:	e8 8b 54 00 00       	call   c010c1af <Memset>
c0106d24:	83 c4 10             	add    $0x10,%esp
c0106d27:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106d2a:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106d2f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106d32:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106d35:	01 c2                	add    %eax,%edx
c0106d37:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106d3a:	01 d0                	add    %edx,%eax
c0106d3c:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106d41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106d44:	05 00 00 10 00       	add    $0x100000,%eax
c0106d49:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106d4e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106d53:	83 ec 04             	sub    $0x4,%esp
c0106d56:	ff 75 d8             	pushl  -0x28(%ebp)
c0106d59:	6a 00                	push   $0x0
c0106d5b:	50                   	push   %eax
c0106d5c:	e8 4e 54 00 00       	call   c010c1af <Memset>
c0106d61:	83 c4 10             	add    $0x10,%esp
c0106d64:	83 ec 04             	sub    $0x4,%esp
c0106d67:	68 f0 00 00 00       	push   $0xf0
c0106d6c:	6a 00                	push   $0x0
c0106d6e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106d73:	e8 37 54 00 00       	call   c010c1af <Memset>
c0106d78:	83 c4 10             	add    $0x10,%esp
c0106d7b:	83 ec 0c             	sub    $0xc,%esp
c0106d7e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106d83:	e8 75 fb ff ff       	call   c01068fd <init_memory_block_desc>
c0106d88:	83 c4 10             	add    $0x10,%esp
c0106d8b:	90                   	nop
c0106d8c:	c9                   	leave  
c0106d8d:	c3                   	ret    

c0106d8e <stop_here>:
c0106d8e:	55                   	push   %ebp
c0106d8f:	89 e5                	mov    %esp,%ebp
c0106d91:	83 ec 08             	sub    $0x8,%esp
c0106d94:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106d9b:	00 00 00 
c0106d9e:	83 ec 0c             	sub    $0xc,%esp
c0106da1:	68 e0 b5 10 c0       	push   $0xc010b5e0
c0106da6:	e8 2e 93 ff ff       	call   c01000d9 <disp_str>
c0106dab:	83 c4 10             	add    $0x10,%esp
c0106dae:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106db3:	83 ec 0c             	sub    $0xc,%esp
c0106db6:	50                   	push   %eax
c0106db7:	e8 ae 04 00 00       	call   c010726a <disp_int>
c0106dbc:	83 c4 10             	add    $0x10,%esp
c0106dbf:	83 ec 0c             	sub    $0xc,%esp
c0106dc2:	68 e2 b5 10 c0       	push   $0xc010b5e2
c0106dc7:	e8 0d 93 ff ff       	call   c01000d9 <disp_str>
c0106dcc:	83 c4 10             	add    $0x10,%esp
c0106dcf:	90                   	nop
c0106dd0:	c9                   	leave  
c0106dd1:	c3                   	ret    

c0106dd2 <catch_error>:
c0106dd2:	55                   	push   %ebp
c0106dd3:	89 e5                	mov    %esp,%ebp
c0106dd5:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106dda:	83 c0 01             	add    $0x1,%eax
c0106ddd:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106de2:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106de7:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106dec:	90                   	nop
c0106ded:	5d                   	pop    %ebp
c0106dee:	c3                   	ret    

c0106def <intr_enable>:
c0106def:	55                   	push   %ebp
c0106df0:	89 e5                	mov    %esp,%ebp
c0106df2:	83 ec 18             	sub    $0x18,%esp
c0106df5:	e8 65 00 00 00       	call   c0106e5f <intr_get_status>
c0106dfa:	83 f8 01             	cmp    $0x1,%eax
c0106dfd:	75 0c                	jne    c0106e0b <intr_enable+0x1c>
c0106dff:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106e06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e09:	eb 0b                	jmp    c0106e16 <intr_enable+0x27>
c0106e0b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106e12:	fb                   	sti    
c0106e13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e16:	c9                   	leave  
c0106e17:	c3                   	ret    

c0106e18 <intr_disable>:
c0106e18:	55                   	push   %ebp
c0106e19:	89 e5                	mov    %esp,%ebp
c0106e1b:	83 ec 18             	sub    $0x18,%esp
c0106e1e:	e8 3c 00 00 00       	call   c0106e5f <intr_get_status>
c0106e23:	83 f8 01             	cmp    $0x1,%eax
c0106e26:	75 0d                	jne    c0106e35 <intr_disable+0x1d>
c0106e28:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106e2f:	fa                   	cli    
c0106e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e33:	eb 0a                	jmp    c0106e3f <intr_disable+0x27>
c0106e35:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106e3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e3f:	c9                   	leave  
c0106e40:	c3                   	ret    

c0106e41 <intr_set_status>:
c0106e41:	55                   	push   %ebp
c0106e42:	89 e5                	mov    %esp,%ebp
c0106e44:	83 ec 08             	sub    $0x8,%esp
c0106e47:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e4a:	83 e0 01             	and    $0x1,%eax
c0106e4d:	85 c0                	test   %eax,%eax
c0106e4f:	74 07                	je     c0106e58 <intr_set_status+0x17>
c0106e51:	e8 99 ff ff ff       	call   c0106def <intr_enable>
c0106e56:	eb 05                	jmp    c0106e5d <intr_set_status+0x1c>
c0106e58:	e8 bb ff ff ff       	call   c0106e18 <intr_disable>
c0106e5d:	c9                   	leave  
c0106e5e:	c3                   	ret    

c0106e5f <intr_get_status>:
c0106e5f:	55                   	push   %ebp
c0106e60:	89 e5                	mov    %esp,%ebp
c0106e62:	83 ec 10             	sub    $0x10,%esp
c0106e65:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106e6c:	9c                   	pushf  
c0106e6d:	58                   	pop    %eax
c0106e6e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106e71:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106e74:	c1 e8 09             	shr    $0x9,%eax
c0106e77:	83 e0 01             	and    $0x1,%eax
c0106e7a:	c9                   	leave  
c0106e7b:	c3                   	ret    

c0106e7c <Memcpy>:
c0106e7c:	55                   	push   %ebp
c0106e7d:	89 e5                	mov    %esp,%ebp
c0106e7f:	83 ec 18             	sub    $0x18,%esp
c0106e82:	e8 91 ff ff ff       	call   c0106e18 <intr_disable>
c0106e87:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106e8a:	83 ec 04             	sub    $0x4,%esp
c0106e8d:	ff 75 10             	pushl  0x10(%ebp)
c0106e90:	ff 75 0c             	pushl  0xc(%ebp)
c0106e93:	ff 75 08             	pushl  0x8(%ebp)
c0106e96:	e8 e6 52 00 00       	call   c010c181 <Memcpy2>
c0106e9b:	83 c4 10             	add    $0x10,%esp
c0106e9e:	83 ec 0c             	sub    $0xc,%esp
c0106ea1:	ff 75 f4             	pushl  -0xc(%ebp)
c0106ea4:	e8 98 ff ff ff       	call   c0106e41 <intr_set_status>
c0106ea9:	83 c4 10             	add    $0x10,%esp
c0106eac:	90                   	nop
c0106ead:	c9                   	leave  
c0106eae:	c3                   	ret    

c0106eaf <untar>:
c0106eaf:	55                   	push   %ebp
c0106eb0:	89 e5                	mov    %esp,%ebp
c0106eb2:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106eb8:	83 ec 08             	sub    $0x8,%esp
c0106ebb:	6a 00                	push   $0x0
c0106ebd:	ff 75 08             	pushl  0x8(%ebp)
c0106ec0:	e8 2a de ff ff       	call   c0104cef <open>
c0106ec5:	83 c4 10             	add    $0x10,%esp
c0106ec8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106ecb:	83 ec 0c             	sub    $0xc,%esp
c0106ece:	68 e4 b5 10 c0       	push   $0xc010b5e4
c0106ed3:	e8 60 18 00 00       	call   c0108738 <Printf>
c0106ed8:	83 c4 10             	add    $0x10,%esp
c0106edb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106ee2:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106ee9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106ef0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106ef7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106efe:	e9 63 02 00 00       	jmp    c0107166 <untar+0x2b7>
c0106f03:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106f07:	7e 58                	jle    c0106f61 <untar+0xb2>
c0106f09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f0c:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106f11:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106f17:	85 c0                	test   %eax,%eax
c0106f19:	0f 48 c2             	cmovs  %edx,%eax
c0106f1c:	c1 f8 09             	sar    $0x9,%eax
c0106f1f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106f22:	83 ec 04             	sub    $0x4,%esp
c0106f25:	68 00 02 00 00       	push   $0x200
c0106f2a:	6a 00                	push   $0x0
c0106f2c:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106f32:	50                   	push   %eax
c0106f33:	e8 77 52 00 00       	call   c010c1af <Memset>
c0106f38:	83 c4 10             	add    $0x10,%esp
c0106f3b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106f3e:	c1 e0 09             	shl    $0x9,%eax
c0106f41:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106f44:	83 ec 04             	sub    $0x4,%esp
c0106f47:	50                   	push   %eax
c0106f48:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106f4e:	50                   	push   %eax
c0106f4f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106f52:	e8 2d de ff ff       	call   c0104d84 <read>
c0106f57:	83 c4 10             	add    $0x10,%esp
c0106f5a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106f61:	83 ec 04             	sub    $0x4,%esp
c0106f64:	68 00 02 00 00       	push   $0x200
c0106f69:	6a 00                	push   $0x0
c0106f6b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106f71:	50                   	push   %eax
c0106f72:	e8 38 52 00 00       	call   c010c1af <Memset>
c0106f77:	83 c4 10             	add    $0x10,%esp
c0106f7a:	83 ec 04             	sub    $0x4,%esp
c0106f7d:	68 00 02 00 00       	push   $0x200
c0106f82:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106f88:	50                   	push   %eax
c0106f89:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106f8c:	e8 f3 dd ff ff       	call   c0104d84 <read>
c0106f91:	83 c4 10             	add    $0x10,%esp
c0106f94:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106f97:	83 ec 0c             	sub    $0xc,%esp
c0106f9a:	68 f6 b5 10 c0       	push   $0xc010b5f6
c0106f9f:	e8 94 17 00 00       	call   c0108738 <Printf>
c0106fa4:	83 c4 10             	add    $0x10,%esp
c0106fa7:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106fab:	0f 84 c1 01 00 00    	je     c0107172 <untar+0x2c3>
c0106fb1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106fb4:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106fb7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106fbe:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106fc4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106fc7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106fca:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106fcd:	83 ec 08             	sub    $0x8,%esp
c0106fd0:	6a 07                	push   $0x7
c0106fd2:	ff 75 cc             	pushl  -0x34(%ebp)
c0106fd5:	e8 15 dd ff ff       	call   c0104cef <open>
c0106fda:	83 c4 10             	add    $0x10,%esp
c0106fdd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106fe0:	83 ec 0c             	sub    $0xc,%esp
c0106fe3:	68 08 b6 10 c0       	push   $0xc010b608
c0106fe8:	e8 4b 17 00 00       	call   c0108738 <Printf>
c0106fed:	83 c4 10             	add    $0x10,%esp
c0106ff0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106ff7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106ffa:	83 c0 7c             	add    $0x7c,%eax
c0106ffd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107000:	83 ec 0c             	sub    $0xc,%esp
c0107003:	ff 75 cc             	pushl  -0x34(%ebp)
c0107006:	e8 dd 51 00 00       	call   c010c1e8 <Strlen>
c010700b:	83 c4 10             	add    $0x10,%esp
c010700e:	85 c0                	test   %eax,%eax
c0107010:	75 28                	jne    c010703a <untar+0x18b>
c0107012:	83 ec 0c             	sub    $0xc,%esp
c0107015:	ff 75 c4             	pushl  -0x3c(%ebp)
c0107018:	e8 cb 51 00 00       	call   c010c1e8 <Strlen>
c010701d:	83 c4 10             	add    $0x10,%esp
c0107020:	85 c0                	test   %eax,%eax
c0107022:	75 16                	jne    c010703a <untar+0x18b>
c0107024:	83 ec 0c             	sub    $0xc,%esp
c0107027:	68 1a b6 10 c0       	push   $0xc010b61a
c010702c:	e8 07 17 00 00       	call   c0108738 <Printf>
c0107031:	83 c4 10             	add    $0x10,%esp
c0107034:	90                   	nop
c0107035:	e9 39 01 00 00       	jmp    c0107173 <untar+0x2c4>
c010703a:	83 ec 0c             	sub    $0xc,%esp
c010703d:	68 21 b6 10 c0       	push   $0xc010b621
c0107042:	e8 f1 16 00 00       	call   c0108738 <Printf>
c0107047:	83 c4 10             	add    $0x10,%esp
c010704a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010704d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107050:	eb 1f                	jmp    c0107071 <untar+0x1c2>
c0107052:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107055:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010705c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010705f:	0f b6 00             	movzbl (%eax),%eax
c0107062:	0f be c0             	movsbl %al,%eax
c0107065:	83 e8 30             	sub    $0x30,%eax
c0107068:	01 d0                	add    %edx,%eax
c010706a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010706d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0107071:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107074:	0f b6 00             	movzbl (%eax),%eax
c0107077:	84 c0                	test   %al,%al
c0107079:	75 d7                	jne    c0107052 <untar+0x1a3>
c010707b:	83 ec 0c             	sub    $0xc,%esp
c010707e:	68 2f b6 10 c0       	push   $0xc010b62f
c0107083:	e8 b0 16 00 00       	call   c0108738 <Printf>
c0107088:	83 c4 10             	add    $0x10,%esp
c010708b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010708e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107091:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0107098:	83 ec 08             	sub    $0x8,%esp
c010709b:	ff 75 c0             	pushl  -0x40(%ebp)
c010709e:	68 3d b6 10 c0       	push   $0xc010b63d
c01070a3:	e8 90 16 00 00       	call   c0108738 <Printf>
c01070a8:	83 c4 10             	add    $0x10,%esp
c01070ab:	83 ec 08             	sub    $0x8,%esp
c01070ae:	ff 75 c0             	pushl  -0x40(%ebp)
c01070b1:	68 4f b6 10 c0       	push   $0xc010b64f
c01070b6:	e8 7d 16 00 00       	call   c0108738 <Printf>
c01070bb:	83 c4 10             	add    $0x10,%esp
c01070be:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01070c1:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c01070c4:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c01070c8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01070cb:	e8 02 fd ff ff       	call   c0106dd2 <catch_error>
c01070d0:	83 ec 04             	sub    $0x4,%esp
c01070d3:	ff 75 b8             	pushl  -0x48(%ebp)
c01070d6:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c01070dc:	50                   	push   %eax
c01070dd:	ff 75 e4             	pushl  -0x1c(%ebp)
c01070e0:	e8 9f dc ff ff       	call   c0104d84 <read>
c01070e5:	83 c4 10             	add    $0x10,%esp
c01070e8:	01 45 f4             	add    %eax,-0xc(%ebp)
c01070eb:	83 ec 04             	sub    $0x4,%esp
c01070ee:	ff 75 b8             	pushl  -0x48(%ebp)
c01070f1:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c01070f7:	50                   	push   %eax
c01070f8:	ff 75 c8             	pushl  -0x38(%ebp)
c01070fb:	e8 05 de ff ff       	call   c0104f05 <write>
c0107100:	83 c4 10             	add    $0x10,%esp
c0107103:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107106:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0107109:	7d 02                	jge    c010710d <untar+0x25e>
c010710b:	eb be                	jmp    c01070cb <untar+0x21c>
c010710d:	90                   	nop
c010710e:	83 ec 08             	sub    $0x8,%esp
c0107111:	ff 75 f4             	pushl  -0xc(%ebp)
c0107114:	68 61 b6 10 c0       	push   $0xc010b661
c0107119:	e8 1a 16 00 00       	call   c0108738 <Printf>
c010711e:	83 c4 10             	add    $0x10,%esp
c0107121:	83 ec 08             	sub    $0x8,%esp
c0107124:	ff 75 c0             	pushl  -0x40(%ebp)
c0107127:	68 73 b6 10 c0       	push   $0xc010b673
c010712c:	e8 07 16 00 00       	call   c0108738 <Printf>
c0107131:	83 c4 10             	add    $0x10,%esp
c0107134:	83 ec 0c             	sub    $0xc,%esp
c0107137:	68 84 b6 10 c0       	push   $0xc010b684
c010713c:	e8 f7 15 00 00       	call   c0108738 <Printf>
c0107141:	83 c4 10             	add    $0x10,%esp
c0107144:	83 ec 0c             	sub    $0xc,%esp
c0107147:	ff 75 c8             	pushl  -0x38(%ebp)
c010714a:	e8 3b de ff ff       	call   c0104f8a <close>
c010714f:	83 c4 10             	add    $0x10,%esp
c0107152:	83 ec 0c             	sub    $0xc,%esp
c0107155:	68 92 b6 10 c0       	push   $0xc010b692
c010715a:	e8 d9 15 00 00       	call   c0108738 <Printf>
c010715f:	83 c4 10             	add    $0x10,%esp
c0107162:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0107166:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010716a:	0f 8f 93 fd ff ff    	jg     c0106f03 <untar+0x54>
c0107170:	eb 01                	jmp    c0107173 <untar+0x2c4>
c0107172:	90                   	nop
c0107173:	83 ec 0c             	sub    $0xc,%esp
c0107176:	68 9f b6 10 c0       	push   $0xc010b69f
c010717b:	e8 b8 15 00 00       	call   c0108738 <Printf>
c0107180:	83 c4 10             	add    $0x10,%esp
c0107183:	83 ec 0c             	sub    $0xc,%esp
c0107186:	68 b1 b6 10 c0       	push   $0xc010b6b1
c010718b:	e8 a8 15 00 00       	call   c0108738 <Printf>
c0107190:	83 c4 10             	add    $0x10,%esp
c0107193:	83 ec 0c             	sub    $0xc,%esp
c0107196:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107199:	e8 ec dd ff ff       	call   c0104f8a <close>
c010719e:	83 c4 10             	add    $0x10,%esp
c01071a1:	83 ec 0c             	sub    $0xc,%esp
c01071a4:	68 c1 b6 10 c0       	push   $0xc010b6c1
c01071a9:	e8 8a 15 00 00       	call   c0108738 <Printf>
c01071ae:	83 c4 10             	add    $0x10,%esp
c01071b1:	83 ec 0c             	sub    $0xc,%esp
c01071b4:	68 d4 b6 10 c0       	push   $0xc010b6d4
c01071b9:	e8 7a 15 00 00       	call   c0108738 <Printf>
c01071be:	83 c4 10             	add    $0x10,%esp
c01071c1:	90                   	nop
c01071c2:	c9                   	leave  
c01071c3:	c3                   	ret    

c01071c4 <atoi>:
c01071c4:	55                   	push   %ebp
c01071c5:	89 e5                	mov    %esp,%ebp
c01071c7:	83 ec 10             	sub    $0x10,%esp
c01071ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01071cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01071d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01071d3:	8d 50 01             	lea    0x1(%eax),%edx
c01071d6:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01071d9:	c6 00 30             	movb   $0x30,(%eax)
c01071dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01071df:	8d 50 01             	lea    0x1(%eax),%edx
c01071e2:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01071e5:	c6 00 78             	movb   $0x78,(%eax)
c01071e8:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c01071ec:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01071f0:	75 0e                	jne    c0107200 <atoi+0x3c>
c01071f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01071f5:	8d 50 01             	lea    0x1(%eax),%edx
c01071f8:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01071fb:	c6 00 30             	movb   $0x30,(%eax)
c01071fe:	eb 61                	jmp    c0107261 <atoi+0x9d>
c0107200:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0107207:	eb 52                	jmp    c010725b <atoi+0x97>
c0107209:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010720c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010720f:	89 c1                	mov    %eax,%ecx
c0107211:	d3 fa                	sar    %cl,%edx
c0107213:	89 d0                	mov    %edx,%eax
c0107215:	83 e0 0f             	and    $0xf,%eax
c0107218:	88 45 fb             	mov    %al,-0x5(%ebp)
c010721b:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c010721f:	75 06                	jne    c0107227 <atoi+0x63>
c0107221:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0107225:	74 2f                	je     c0107256 <atoi+0x92>
c0107227:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c010722b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010722f:	83 c0 30             	add    $0x30,%eax
c0107232:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107235:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0107239:	7e 0a                	jle    c0107245 <atoi+0x81>
c010723b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010723f:	83 c0 07             	add    $0x7,%eax
c0107242:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107245:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107248:	8d 50 01             	lea    0x1(%eax),%edx
c010724b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010724e:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0107252:	88 10                	mov    %dl,(%eax)
c0107254:	eb 01                	jmp    c0107257 <atoi+0x93>
c0107256:	90                   	nop
c0107257:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010725b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010725f:	79 a8                	jns    c0107209 <atoi+0x45>
c0107261:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107264:	c6 00 00             	movb   $0x0,(%eax)
c0107267:	90                   	nop
c0107268:	c9                   	leave  
c0107269:	c3                   	ret    

c010726a <disp_int>:
c010726a:	55                   	push   %ebp
c010726b:	89 e5                	mov    %esp,%ebp
c010726d:	83 ec 18             	sub    $0x18,%esp
c0107270:	ff 75 08             	pushl  0x8(%ebp)
c0107273:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107276:	50                   	push   %eax
c0107277:	e8 48 ff ff ff       	call   c01071c4 <atoi>
c010727c:	83 c4 08             	add    $0x8,%esp
c010727f:	83 ec 08             	sub    $0x8,%esp
c0107282:	6a 0b                	push   $0xb
c0107284:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107287:	50                   	push   %eax
c0107288:	e8 87 8e ff ff       	call   c0100114 <disp_str_colour>
c010728d:	83 c4 10             	add    $0x10,%esp
c0107290:	90                   	nop
c0107291:	c9                   	leave  
c0107292:	c3                   	ret    

c0107293 <do_page_fault>:
c0107293:	55                   	push   %ebp
c0107294:	89 e5                	mov    %esp,%ebp
c0107296:	83 ec 28             	sub    $0x28,%esp
c0107299:	0f 20 d0             	mov    %cr2,%eax
c010729c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010729f:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01072a6:	00 00 00 
c01072a9:	83 ec 0c             	sub    $0xc,%esp
c01072ac:	68 df b6 10 c0       	push   $0xc010b6df
c01072b1:	e8 23 8e ff ff       	call   c01000d9 <disp_str>
c01072b6:	83 c4 10             	add    $0x10,%esp
c01072b9:	83 ec 0c             	sub    $0xc,%esp
c01072bc:	68 ee b6 10 c0       	push   $0xc010b6ee
c01072c1:	e8 13 8e ff ff       	call   c01000d9 <disp_str>
c01072c6:	83 c4 10             	add    $0x10,%esp
c01072c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01072cc:	83 ec 0c             	sub    $0xc,%esp
c01072cf:	50                   	push   %eax
c01072d0:	e8 95 ff ff ff       	call   c010726a <disp_int>
c01072d5:	83 c4 10             	add    $0x10,%esp
c01072d8:	83 ec 0c             	sub    $0xc,%esp
c01072db:	68 f3 b6 10 c0       	push   $0xc010b6f3
c01072e0:	e8 f4 8d ff ff       	call   c01000d9 <disp_str>
c01072e5:	83 c4 10             	add    $0x10,%esp
c01072e8:	83 ec 0c             	sub    $0xc,%esp
c01072eb:	ff 75 f4             	pushl  -0xc(%ebp)
c01072ee:	e8 51 ec ff ff       	call   c0105f44 <ptr_pde>
c01072f3:	83 c4 10             	add    $0x10,%esp
c01072f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01072f9:	83 ec 0c             	sub    $0xc,%esp
c01072fc:	ff 75 f4             	pushl  -0xc(%ebp)
c01072ff:	e8 53 ec ff ff       	call   c0105f57 <ptr_pte>
c0107304:	83 c4 10             	add    $0x10,%esp
c0107307:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010730a:	83 ec 0c             	sub    $0xc,%esp
c010730d:	68 f5 b6 10 c0       	push   $0xc010b6f5
c0107312:	e8 c2 8d ff ff       	call   c01000d9 <disp_str>
c0107317:	83 c4 10             	add    $0x10,%esp
c010731a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010731d:	83 ec 0c             	sub    $0xc,%esp
c0107320:	50                   	push   %eax
c0107321:	e8 44 ff ff ff       	call   c010726a <disp_int>
c0107326:	83 c4 10             	add    $0x10,%esp
c0107329:	83 ec 0c             	sub    $0xc,%esp
c010732c:	68 fa b6 10 c0       	push   $0xc010b6fa
c0107331:	e8 a3 8d ff ff       	call   c01000d9 <disp_str>
c0107336:	83 c4 10             	add    $0x10,%esp
c0107339:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010733c:	8b 00                	mov    (%eax),%eax
c010733e:	83 ec 0c             	sub    $0xc,%esp
c0107341:	50                   	push   %eax
c0107342:	e8 23 ff ff ff       	call   c010726a <disp_int>
c0107347:	83 c4 10             	add    $0x10,%esp
c010734a:	83 ec 0c             	sub    $0xc,%esp
c010734d:	68 f3 b6 10 c0       	push   $0xc010b6f3
c0107352:	e8 82 8d ff ff       	call   c01000d9 <disp_str>
c0107357:	83 c4 10             	add    $0x10,%esp
c010735a:	83 ec 0c             	sub    $0xc,%esp
c010735d:	68 03 b7 10 c0       	push   $0xc010b703
c0107362:	e8 72 8d ff ff       	call   c01000d9 <disp_str>
c0107367:	83 c4 10             	add    $0x10,%esp
c010736a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010736d:	83 ec 0c             	sub    $0xc,%esp
c0107370:	50                   	push   %eax
c0107371:	e8 f4 fe ff ff       	call   c010726a <disp_int>
c0107376:	83 c4 10             	add    $0x10,%esp
c0107379:	83 ec 0c             	sub    $0xc,%esp
c010737c:	68 08 b7 10 c0       	push   $0xc010b708
c0107381:	e8 53 8d ff ff       	call   c01000d9 <disp_str>
c0107386:	83 c4 10             	add    $0x10,%esp
c0107389:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010738c:	8b 00                	mov    (%eax),%eax
c010738e:	83 ec 0c             	sub    $0xc,%esp
c0107391:	50                   	push   %eax
c0107392:	e8 d3 fe ff ff       	call   c010726a <disp_int>
c0107397:	83 c4 10             	add    $0x10,%esp
c010739a:	83 ec 0c             	sub    $0xc,%esp
c010739d:	68 f3 b6 10 c0       	push   $0xc010b6f3
c01073a2:	e8 32 8d ff ff       	call   c01000d9 <disp_str>
c01073a7:	83 c4 10             	add    $0x10,%esp
c01073aa:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c01073b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01073b4:	8b 00                	mov    (%eax),%eax
c01073b6:	83 e0 01             	and    $0x1,%eax
c01073b9:	85 c0                	test   %eax,%eax
c01073bb:	74 09                	je     c01073c6 <do_page_fault+0x133>
c01073bd:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c01073c4:	eb 07                	jmp    c01073cd <do_page_fault+0x13a>
c01073c6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01073cd:	90                   	nop
c01073ce:	c9                   	leave  
c01073cf:	c3                   	ret    

c01073d0 <exception_handler>:
c01073d0:	55                   	push   %ebp
c01073d1:	89 e5                	mov    %esp,%ebp
c01073d3:	57                   	push   %edi
c01073d4:	56                   	push   %esi
c01073d5:	53                   	push   %ebx
c01073d6:	83 ec 6c             	sub    $0x6c,%esp
c01073d9:	8d 45 8c             	lea    -0x74(%ebp),%eax
c01073dc:	bb 80 b9 10 c0       	mov    $0xc010b980,%ebx
c01073e1:	ba 13 00 00 00       	mov    $0x13,%edx
c01073e6:	89 c7                	mov    %eax,%edi
c01073e8:	89 de                	mov    %ebx,%esi
c01073ea:	89 d1                	mov    %edx,%ecx
c01073ec:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01073ee:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01073f5:	eb 04                	jmp    c01073fb <exception_handler+0x2b>
c01073f7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01073fb:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0107402:	7e f3                	jle    c01073f7 <exception_handler+0x27>
c0107404:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010740b:	00 00 00 
c010740e:	83 ec 0c             	sub    $0xc,%esp
c0107411:	68 11 b7 10 c0       	push   $0xc010b711
c0107416:	e8 be 8c ff ff       	call   c01000d9 <disp_str>
c010741b:	83 c4 10             	add    $0x10,%esp
c010741e:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107425:	8b 45 08             	mov    0x8(%ebp),%eax
c0107428:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c010742c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010742f:	83 ec 0c             	sub    $0xc,%esp
c0107432:	ff 75 dc             	pushl  -0x24(%ebp)
c0107435:	e8 9f 8c ff ff       	call   c01000d9 <disp_str>
c010743a:	83 c4 10             	add    $0x10,%esp
c010743d:	83 ec 0c             	sub    $0xc,%esp
c0107440:	68 1f b7 10 c0       	push   $0xc010b71f
c0107445:	e8 8f 8c ff ff       	call   c01000d9 <disp_str>
c010744a:	83 c4 10             	add    $0x10,%esp
c010744d:	83 ec 0c             	sub    $0xc,%esp
c0107450:	68 22 b7 10 c0       	push   $0xc010b722
c0107455:	e8 7f 8c ff ff       	call   c01000d9 <disp_str>
c010745a:	83 c4 10             	add    $0x10,%esp
c010745d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107460:	83 ec 0c             	sub    $0xc,%esp
c0107463:	50                   	push   %eax
c0107464:	e8 01 fe ff ff       	call   c010726a <disp_int>
c0107469:	83 c4 10             	add    $0x10,%esp
c010746c:	83 ec 0c             	sub    $0xc,%esp
c010746f:	68 1f b7 10 c0       	push   $0xc010b71f
c0107474:	e8 60 8c ff ff       	call   c01000d9 <disp_str>
c0107479:	83 c4 10             	add    $0x10,%esp
c010747c:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107480:	74 2f                	je     c01074b1 <exception_handler+0xe1>
c0107482:	83 ec 0c             	sub    $0xc,%esp
c0107485:	68 2a b7 10 c0       	push   $0xc010b72a
c010748a:	e8 4a 8c ff ff       	call   c01000d9 <disp_str>
c010748f:	83 c4 10             	add    $0x10,%esp
c0107492:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107495:	83 ec 0c             	sub    $0xc,%esp
c0107498:	50                   	push   %eax
c0107499:	e8 cc fd ff ff       	call   c010726a <disp_int>
c010749e:	83 c4 10             	add    $0x10,%esp
c01074a1:	83 ec 0c             	sub    $0xc,%esp
c01074a4:	68 1f b7 10 c0       	push   $0xc010b71f
c01074a9:	e8 2b 8c ff ff       	call   c01000d9 <disp_str>
c01074ae:	83 c4 10             	add    $0x10,%esp
c01074b1:	83 ec 0c             	sub    $0xc,%esp
c01074b4:	68 34 b7 10 c0       	push   $0xc010b734
c01074b9:	e8 1b 8c ff ff       	call   c01000d9 <disp_str>
c01074be:	83 c4 10             	add    $0x10,%esp
c01074c1:	83 ec 0c             	sub    $0xc,%esp
c01074c4:	ff 75 14             	pushl  0x14(%ebp)
c01074c7:	e8 9e fd ff ff       	call   c010726a <disp_int>
c01074cc:	83 c4 10             	add    $0x10,%esp
c01074cf:	83 ec 0c             	sub    $0xc,%esp
c01074d2:	68 1f b7 10 c0       	push   $0xc010b71f
c01074d7:	e8 fd 8b ff ff       	call   c01000d9 <disp_str>
c01074dc:	83 c4 10             	add    $0x10,%esp
c01074df:	83 ec 0c             	sub    $0xc,%esp
c01074e2:	68 38 b7 10 c0       	push   $0xc010b738
c01074e7:	e8 ed 8b ff ff       	call   c01000d9 <disp_str>
c01074ec:	83 c4 10             	add    $0x10,%esp
c01074ef:	8b 45 10             	mov    0x10(%ebp),%eax
c01074f2:	83 ec 0c             	sub    $0xc,%esp
c01074f5:	50                   	push   %eax
c01074f6:	e8 6f fd ff ff       	call   c010726a <disp_int>
c01074fb:	83 c4 10             	add    $0x10,%esp
c01074fe:	83 ec 0c             	sub    $0xc,%esp
c0107501:	68 1f b7 10 c0       	push   $0xc010b71f
c0107506:	e8 ce 8b ff ff       	call   c01000d9 <disp_str>
c010750b:	83 c4 10             	add    $0x10,%esp
c010750e:	83 ec 0c             	sub    $0xc,%esp
c0107511:	68 3d b7 10 c0       	push   $0xc010b73d
c0107516:	e8 be 8b ff ff       	call   c01000d9 <disp_str>
c010751b:	83 c4 10             	add    $0x10,%esp
c010751e:	83 ec 0c             	sub    $0xc,%esp
c0107521:	ff 75 18             	pushl  0x18(%ebp)
c0107524:	e8 41 fd ff ff       	call   c010726a <disp_int>
c0107529:	83 c4 10             	add    $0x10,%esp
c010752c:	83 ec 0c             	sub    $0xc,%esp
c010752f:	68 1f b7 10 c0       	push   $0xc010b71f
c0107534:	e8 a0 8b ff ff       	call   c01000d9 <disp_str>
c0107539:	83 c4 10             	add    $0x10,%esp
c010753c:	83 ec 0c             	sub    $0xc,%esp
c010753f:	68 48 b7 10 c0       	push   $0xc010b748
c0107544:	e8 90 8b ff ff       	call   c01000d9 <disp_str>
c0107549:	83 c4 10             	add    $0x10,%esp
c010754c:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0107550:	75 45                	jne    c0107597 <exception_handler+0x1c7>
c0107552:	0f 20 d0             	mov    %cr2,%eax
c0107555:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107558:	83 ec 0c             	sub    $0xc,%esp
c010755b:	68 67 b7 10 c0       	push   $0xc010b767
c0107560:	e8 74 8b ff ff       	call   c01000d9 <disp_str>
c0107565:	83 c4 10             	add    $0x10,%esp
c0107568:	83 ec 0c             	sub    $0xc,%esp
c010756b:	68 ee b6 10 c0       	push   $0xc010b6ee
c0107570:	e8 64 8b ff ff       	call   c01000d9 <disp_str>
c0107575:	83 c4 10             	add    $0x10,%esp
c0107578:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010757b:	83 ec 0c             	sub    $0xc,%esp
c010757e:	50                   	push   %eax
c010757f:	e8 e6 fc ff ff       	call   c010726a <disp_int>
c0107584:	83 c4 10             	add    $0x10,%esp
c0107587:	83 ec 0c             	sub    $0xc,%esp
c010758a:	68 f3 b6 10 c0       	push   $0xc010b6f3
c010758f:	e8 45 8b ff ff       	call   c01000d9 <disp_str>
c0107594:	83 c4 10             	add    $0x10,%esp
c0107597:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c010759b:	75 11                	jne    c01075ae <exception_handler+0x1de>
c010759d:	83 ec 0c             	sub    $0xc,%esp
c01075a0:	68 73 b7 10 c0       	push   $0xc010b773
c01075a5:	e8 2f 8b ff ff       	call   c01000d9 <disp_str>
c01075aa:	83 c4 10             	add    $0x10,%esp
c01075ad:	90                   	nop
c01075ae:	90                   	nop
c01075af:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01075b2:	5b                   	pop    %ebx
c01075b3:	5e                   	pop    %esi
c01075b4:	5f                   	pop    %edi
c01075b5:	5d                   	pop    %ebp
c01075b6:	c3                   	ret    

c01075b7 <init_internal_interrupt>:
c01075b7:	55                   	push   %ebp
c01075b8:	89 e5                	mov    %esp,%ebp
c01075ba:	83 ec 08             	sub    $0x8,%esp
c01075bd:	6a 0e                	push   $0xe
c01075bf:	6a 08                	push   $0x8
c01075c1:	68 50 01 10 c0       	push   $0xc0100150
c01075c6:	6a 00                	push   $0x0
c01075c8:	e8 62 c7 ff ff       	call   c0103d2f <InitInterruptDesc>
c01075cd:	83 c4 10             	add    $0x10,%esp
c01075d0:	6a 0e                	push   $0xe
c01075d2:	6a 08                	push   $0x8
c01075d4:	68 56 01 10 c0       	push   $0xc0100156
c01075d9:	6a 01                	push   $0x1
c01075db:	e8 4f c7 ff ff       	call   c0103d2f <InitInterruptDesc>
c01075e0:	83 c4 10             	add    $0x10,%esp
c01075e3:	6a 0e                	push   $0xe
c01075e5:	6a 08                	push   $0x8
c01075e7:	68 5c 01 10 c0       	push   $0xc010015c
c01075ec:	6a 02                	push   $0x2
c01075ee:	e8 3c c7 ff ff       	call   c0103d2f <InitInterruptDesc>
c01075f3:	83 c4 10             	add    $0x10,%esp
c01075f6:	6a 0e                	push   $0xe
c01075f8:	6a 08                	push   $0x8
c01075fa:	68 62 01 10 c0       	push   $0xc0100162
c01075ff:	6a 03                	push   $0x3
c0107601:	e8 29 c7 ff ff       	call   c0103d2f <InitInterruptDesc>
c0107606:	83 c4 10             	add    $0x10,%esp
c0107609:	6a 0e                	push   $0xe
c010760b:	6a 08                	push   $0x8
c010760d:	68 68 01 10 c0       	push   $0xc0100168
c0107612:	6a 04                	push   $0x4
c0107614:	e8 16 c7 ff ff       	call   c0103d2f <InitInterruptDesc>
c0107619:	83 c4 10             	add    $0x10,%esp
c010761c:	6a 0e                	push   $0xe
c010761e:	6a 08                	push   $0x8
c0107620:	68 6e 01 10 c0       	push   $0xc010016e
c0107625:	6a 05                	push   $0x5
c0107627:	e8 03 c7 ff ff       	call   c0103d2f <InitInterruptDesc>
c010762c:	83 c4 10             	add    $0x10,%esp
c010762f:	6a 0e                	push   $0xe
c0107631:	6a 08                	push   $0x8
c0107633:	68 74 01 10 c0       	push   $0xc0100174
c0107638:	6a 06                	push   $0x6
c010763a:	e8 f0 c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c010763f:	83 c4 10             	add    $0x10,%esp
c0107642:	6a 0e                	push   $0xe
c0107644:	6a 08                	push   $0x8
c0107646:	68 7a 01 10 c0       	push   $0xc010017a
c010764b:	6a 07                	push   $0x7
c010764d:	e8 dd c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c0107652:	83 c4 10             	add    $0x10,%esp
c0107655:	6a 0e                	push   $0xe
c0107657:	6a 08                	push   $0x8
c0107659:	68 80 01 10 c0       	push   $0xc0100180
c010765e:	6a 08                	push   $0x8
c0107660:	e8 ca c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c0107665:	83 c4 10             	add    $0x10,%esp
c0107668:	6a 0e                	push   $0xe
c010766a:	6a 08                	push   $0x8
c010766c:	68 84 01 10 c0       	push   $0xc0100184
c0107671:	6a 09                	push   $0x9
c0107673:	e8 b7 c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c0107678:	83 c4 10             	add    $0x10,%esp
c010767b:	6a 0e                	push   $0xe
c010767d:	6a 08                	push   $0x8
c010767f:	68 8a 01 10 c0       	push   $0xc010018a
c0107684:	6a 0a                	push   $0xa
c0107686:	e8 a4 c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c010768b:	83 c4 10             	add    $0x10,%esp
c010768e:	6a 0e                	push   $0xe
c0107690:	6a 08                	push   $0x8
c0107692:	68 8e 01 10 c0       	push   $0xc010018e
c0107697:	6a 0b                	push   $0xb
c0107699:	e8 91 c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c010769e:	83 c4 10             	add    $0x10,%esp
c01076a1:	6a 0e                	push   $0xe
c01076a3:	6a 08                	push   $0x8
c01076a5:	68 92 01 10 c0       	push   $0xc0100192
c01076aa:	6a 0c                	push   $0xc
c01076ac:	e8 7e c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c01076b1:	83 c4 10             	add    $0x10,%esp
c01076b4:	6a 0e                	push   $0xe
c01076b6:	6a 08                	push   $0x8
c01076b8:	68 96 01 10 c0       	push   $0xc0100196
c01076bd:	6a 0d                	push   $0xd
c01076bf:	e8 6b c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c01076c4:	83 c4 10             	add    $0x10,%esp
c01076c7:	6a 0e                	push   $0xe
c01076c9:	6a 08                	push   $0x8
c01076cb:	68 a1 01 10 c0       	push   $0xc01001a1
c01076d0:	6a 0e                	push   $0xe
c01076d2:	e8 58 c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c01076d7:	83 c4 10             	add    $0x10,%esp
c01076da:	6a 0e                	push   $0xe
c01076dc:	6a 08                	push   $0x8
c01076de:	68 a5 01 10 c0       	push   $0xc01001a5
c01076e3:	6a 10                	push   $0x10
c01076e5:	e8 45 c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c01076ea:	83 c4 10             	add    $0x10,%esp
c01076ed:	6a 0e                	push   $0xe
c01076ef:	6a 08                	push   $0x8
c01076f1:	68 ab 01 10 c0       	push   $0xc01001ab
c01076f6:	6a 11                	push   $0x11
c01076f8:	e8 32 c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c01076fd:	83 c4 10             	add    $0x10,%esp
c0107700:	6a 0e                	push   $0xe
c0107702:	6a 08                	push   $0x8
c0107704:	68 af 01 10 c0       	push   $0xc01001af
c0107709:	6a 12                	push   $0x12
c010770b:	e8 1f c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c0107710:	83 c4 10             	add    $0x10,%esp
c0107713:	6a 0e                	push   $0xe
c0107715:	6a 0e                	push   $0xe
c0107717:	68 ba 02 10 c0       	push   $0xc01002ba
c010771c:	68 90 00 00 00       	push   $0x90
c0107721:	e8 09 c6 ff ff       	call   c0103d2f <InitInterruptDesc>
c0107726:	83 c4 10             	add    $0x10,%esp
c0107729:	90                   	nop
c010772a:	c9                   	leave  
c010772b:	c3                   	ret    

c010772c <spurious_irq>:
c010772c:	55                   	push   %ebp
c010772d:	89 e5                	mov    %esp,%ebp
c010772f:	83 ec 08             	sub    $0x8,%esp
c0107732:	83 ec 08             	sub    $0x8,%esp
c0107735:	6a 0b                	push   $0xb
c0107737:	68 cc b9 10 c0       	push   $0xc010b9cc
c010773c:	e8 d3 89 ff ff       	call   c0100114 <disp_str_colour>
c0107741:	83 c4 10             	add    $0x10,%esp
c0107744:	83 ec 0c             	sub    $0xc,%esp
c0107747:	ff 75 08             	pushl  0x8(%ebp)
c010774a:	e8 1b fb ff ff       	call   c010726a <disp_int>
c010774f:	83 c4 10             	add    $0x10,%esp
c0107752:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107757:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010775d:	83 c0 01             	add    $0x1,%eax
c0107760:	83 d2 00             	adc    $0x0,%edx
c0107763:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107768:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010776e:	83 ec 0c             	sub    $0xc,%esp
c0107771:	68 e0 b5 10 c0       	push   $0xc010b5e0
c0107776:	e8 5e 89 ff ff       	call   c01000d9 <disp_str>
c010777b:	83 c4 10             	add    $0x10,%esp
c010777e:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107783:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107789:	83 ec 0c             	sub    $0xc,%esp
c010778c:	50                   	push   %eax
c010778d:	e8 d8 fa ff ff       	call   c010726a <disp_int>
c0107792:	83 c4 10             	add    $0x10,%esp
c0107795:	83 ec 0c             	sub    $0xc,%esp
c0107798:	68 e2 b5 10 c0       	push   $0xc010b5e2
c010779d:	e8 37 89 ff ff       	call   c01000d9 <disp_str>
c01077a2:	83 c4 10             	add    $0x10,%esp
c01077a5:	83 ec 08             	sub    $0x8,%esp
c01077a8:	6a 0c                	push   $0xc
c01077aa:	68 f4 b9 10 c0       	push   $0xc010b9f4
c01077af:	e8 60 89 ff ff       	call   c0100114 <disp_str_colour>
c01077b4:	83 c4 10             	add    $0x10,%esp
c01077b7:	90                   	nop
c01077b8:	c9                   	leave  
c01077b9:	c3                   	ret    

c01077ba <init_keyboard>:
c01077ba:	55                   	push   %ebp
c01077bb:	89 e5                	mov    %esp,%ebp
c01077bd:	83 ec 08             	sub    $0x8,%esp
c01077c0:	83 ec 04             	sub    $0x4,%esp
c01077c3:	68 00 02 00 00       	push   $0x200
c01077c8:	6a 00                	push   $0x0
c01077ca:	68 ec fb 10 c0       	push   $0xc010fbec
c01077cf:	e8 db 49 00 00       	call   c010c1af <Memset>
c01077d4:	83 c4 10             	add    $0x10,%esp
c01077d7:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01077de:	fb 10 c0 
c01077e1:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01077e6:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01077eb:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c01077f2:	00 00 00 
c01077f5:	e8 4f d3 ff ff       	call   c0104b49 <init_keyboard_handler>
c01077fa:	90                   	nop
c01077fb:	c9                   	leave  
c01077fc:	c3                   	ret    

c01077fd <TestTTY>:
c01077fd:	55                   	push   %ebp
c01077fe:	89 e5                	mov    %esp,%ebp
c0107800:	83 ec 28             	sub    $0x28,%esp
c0107803:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c010780a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107811:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107817:	83 ec 08             	sub    $0x8,%esp
c010781a:	6a 02                	push   $0x2
c010781c:	8d 45 de             	lea    -0x22(%ebp),%eax
c010781f:	50                   	push   %eax
c0107820:	e8 ca d4 ff ff       	call   c0104cef <open>
c0107825:	83 c4 10             	add    $0x10,%esp
c0107828:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010782b:	83 ec 08             	sub    $0x8,%esp
c010782e:	6a 02                	push   $0x2
c0107830:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107833:	50                   	push   %eax
c0107834:	e8 b6 d4 ff ff       	call   c0104cef <open>
c0107839:	83 c4 10             	add    $0x10,%esp
c010783c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010783f:	83 ec 0c             	sub    $0xc,%esp
c0107842:	68 19 ba 10 c0       	push   $0xc010ba19
c0107847:	e8 ec 0e 00 00       	call   c0108738 <Printf>
c010784c:	83 c4 10             	add    $0x10,%esp
c010784f:	83 ec 0c             	sub    $0xc,%esp
c0107852:	6a 0a                	push   $0xa
c0107854:	e8 73 9f ff ff       	call   c01017cc <sys_malloc>
c0107859:	83 c4 10             	add    $0x10,%esp
c010785c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010785f:	83 ec 04             	sub    $0x4,%esp
c0107862:	6a 0a                	push   $0xa
c0107864:	6a 00                	push   $0x0
c0107866:	ff 75 ec             	pushl  -0x14(%ebp)
c0107869:	e8 41 49 00 00       	call   c010c1af <Memset>
c010786e:	83 c4 10             	add    $0x10,%esp
c0107871:	83 ec 04             	sub    $0x4,%esp
c0107874:	6a 0a                	push   $0xa
c0107876:	ff 75 ec             	pushl  -0x14(%ebp)
c0107879:	ff 75 f0             	pushl  -0x10(%ebp)
c010787c:	e8 03 d5 ff ff       	call   c0104d84 <read>
c0107881:	83 c4 10             	add    $0x10,%esp
c0107884:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107887:	83 ec 08             	sub    $0x8,%esp
c010788a:	ff 75 ec             	pushl  -0x14(%ebp)
c010788d:	68 2b ba 10 c0       	push   $0xc010ba2b
c0107892:	e8 a1 0e 00 00       	call   c0108738 <Printf>
c0107897:	83 c4 10             	add    $0x10,%esp
c010789a:	eb c3                	jmp    c010785f <TestTTY+0x62>

c010789c <TestReadReturnValue>:
c010789c:	55                   	push   %ebp
c010789d:	89 e5                	mov    %esp,%ebp
c010789f:	81 ec 18 02 00 00    	sub    $0x218,%esp
c01078a5:	c7 45 f4 35 ba 10 c0 	movl   $0xc010ba35,-0xc(%ebp)
c01078ac:	83 ec 08             	sub    $0x8,%esp
c01078af:	6a 00                	push   $0x0
c01078b1:	ff 75 f4             	pushl  -0xc(%ebp)
c01078b4:	e8 36 d4 ff ff       	call   c0104cef <open>
c01078b9:	83 c4 10             	add    $0x10,%esp
c01078bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01078bf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01078c6:	83 ec 04             	sub    $0x4,%esp
c01078c9:	68 cb 00 00 00       	push   $0xcb
c01078ce:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01078d4:	50                   	push   %eax
c01078d5:	ff 75 f0             	pushl  -0x10(%ebp)
c01078d8:	e8 a7 d4 ff ff       	call   c0104d84 <read>
c01078dd:	83 c4 10             	add    $0x10,%esp
c01078e0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01078e3:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c01078ea:	74 1c                	je     c0107908 <TestReadReturnValue+0x6c>
c01078ec:	68 08 02 00 00       	push   $0x208
c01078f1:	68 41 ba 10 c0       	push   $0xc010ba41
c01078f6:	68 41 ba 10 c0       	push   $0xc010ba41
c01078fb:	68 51 ba 10 c0       	push   $0xc010ba51
c0107900:	e8 90 11 00 00       	call   c0108a95 <assertion_failure>
c0107905:	83 c4 10             	add    $0x10,%esp
c0107908:	83 ec 0c             	sub    $0xc,%esp
c010790b:	ff 75 f0             	pushl  -0x10(%ebp)
c010790e:	e8 77 d6 ff ff       	call   c0104f8a <close>
c0107913:	83 c4 10             	add    $0x10,%esp
c0107916:	90                   	nop
c0107917:	c9                   	leave  
c0107918:	c3                   	ret    

c0107919 <TestWriteReturnValue>:
c0107919:	55                   	push   %ebp
c010791a:	89 e5                	mov    %esp,%ebp
c010791c:	81 ec 28 02 00 00    	sub    $0x228,%esp
c0107922:	c7 45 f4 5c ba 10 c0 	movl   $0xc010ba5c,-0xc(%ebp)
c0107929:	83 ec 08             	sub    $0x8,%esp
c010792c:	6a 07                	push   $0x7
c010792e:	ff 75 f4             	pushl  -0xc(%ebp)
c0107931:	e8 b9 d3 ff ff       	call   c0104cef <open>
c0107936:	83 c4 10             	add    $0x10,%esp
c0107939:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010793c:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c0107940:	75 1c                	jne    c010795e <TestWriteReturnValue+0x45>
c0107942:	68 12 02 00 00       	push   $0x212
c0107947:	68 41 ba 10 c0       	push   $0xc010ba41
c010794c:	68 41 ba 10 c0       	push   $0xc010ba41
c0107951:	68 69 ba 10 c0       	push   $0xc010ba69
c0107956:	e8 3a 11 00 00       	call   c0108a95 <assertion_failure>
c010795b:	83 c4 10             	add    $0x10,%esp
c010795e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107965:	c7 45 e8 74 ba 10 c0 	movl   $0xc010ba74,-0x18(%ebp)
c010796c:	83 ec 0c             	sub    $0xc,%esp
c010796f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107972:	e8 71 48 00 00       	call   c010c1e8 <Strlen>
c0107977:	83 c4 10             	add    $0x10,%esp
c010797a:	83 ec 04             	sub    $0x4,%esp
c010797d:	50                   	push   %eax
c010797e:	ff 75 e8             	pushl  -0x18(%ebp)
c0107981:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107987:	50                   	push   %eax
c0107988:	e8 ef f4 ff ff       	call   c0106e7c <Memcpy>
c010798d:	83 c4 10             	add    $0x10,%esp
c0107990:	83 ec 04             	sub    $0x4,%esp
c0107993:	68 ff 01 00 00       	push   $0x1ff
c0107998:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c010799e:	50                   	push   %eax
c010799f:	ff 75 f0             	pushl  -0x10(%ebp)
c01079a2:	e8 5e d5 ff ff       	call   c0104f05 <write>
c01079a7:	83 c4 10             	add    $0x10,%esp
c01079aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01079ad:	83 ec 0c             	sub    $0xc,%esp
c01079b0:	ff 75 e8             	pushl  -0x18(%ebp)
c01079b3:	e8 30 48 00 00       	call   c010c1e8 <Strlen>
c01079b8:	83 c4 10             	add    $0x10,%esp
c01079bb:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01079be:	74 1c                	je     c01079dc <TestWriteReturnValue+0xc3>
c01079c0:	68 1c 02 00 00       	push   $0x21c
c01079c5:	68 41 ba 10 c0       	push   $0xc010ba41
c01079ca:	68 41 ba 10 c0       	push   $0xc010ba41
c01079cf:	68 a7 ba 10 c0       	push   $0xc010baa7
c01079d4:	e8 bc 10 00 00       	call   c0108a95 <assertion_failure>
c01079d9:	83 c4 10             	add    $0x10,%esp
c01079dc:	83 ec 0c             	sub    $0xc,%esp
c01079df:	ff 75 f0             	pushl  -0x10(%ebp)
c01079e2:	e8 a3 d5 ff ff       	call   c0104f8a <close>
c01079e7:	83 c4 10             	add    $0x10,%esp
c01079ea:	90                   	nop
c01079eb:	c9                   	leave  
c01079ec:	c3                   	ret    

c01079ed <TestFS2>:
c01079ed:	55                   	push   %ebp
c01079ee:	89 e5                	mov    %esp,%ebp
c01079f0:	83 ec 08             	sub    $0x8,%esp
c01079f3:	e8 21 ff ff ff       	call   c0107919 <TestWriteReturnValue>
c01079f8:	90                   	nop
c01079f9:	c9                   	leave  
c01079fa:	c3                   	ret    

c01079fb <TestFS>:
c01079fb:	55                   	push   %ebp
c01079fc:	89 e5                	mov    %esp,%ebp
c01079fe:	57                   	push   %edi
c01079ff:	56                   	push   %esi
c0107a00:	53                   	push   %ebx
c0107a01:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c0107a07:	83 ec 0c             	sub    $0xc,%esp
c0107a0a:	68 ba ba 10 c0       	push   $0xc010baba
c0107a0f:	e8 c5 86 ff ff       	call   c01000d9 <disp_str>
c0107a14:	83 c4 10             	add    $0x10,%esp
c0107a17:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c0107a1e:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107a25:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c0107a2b:	83 ec 08             	sub    $0x8,%esp
c0107a2e:	6a 02                	push   $0x2
c0107a30:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107a33:	50                   	push   %eax
c0107a34:	e8 b6 d2 ff ff       	call   c0104cef <open>
c0107a39:	83 c4 10             	add    $0x10,%esp
c0107a3c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107a3f:	83 ec 08             	sub    $0x8,%esp
c0107a42:	6a 02                	push   $0x2
c0107a44:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107a47:	50                   	push   %eax
c0107a48:	e8 a2 d2 ff ff       	call   c0104cef <open>
c0107a4d:	83 c4 10             	add    $0x10,%esp
c0107a50:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107a53:	83 ec 0c             	sub    $0xc,%esp
c0107a56:	68 19 ba 10 c0       	push   $0xc010ba19
c0107a5b:	e8 d8 0c 00 00       	call   c0108738 <Printf>
c0107a60:	83 c4 10             	add    $0x10,%esp
c0107a63:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c0107a6a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c0107a6e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c0107a75:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c0107a79:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c0107a80:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c0107a87:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c0107a8d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c0107a94:	83 ec 0c             	sub    $0xc,%esp
c0107a97:	68 c2 ba 10 c0       	push   $0xc010bac2
c0107a9c:	e8 97 0c 00 00       	call   c0108738 <Printf>
c0107aa1:	83 c4 10             	add    $0x10,%esp
c0107aa4:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c0107aa8:	0f 85 e6 03 00 00    	jne    c0107e94 <TestFS+0x499>
c0107aae:	83 ec 08             	sub    $0x8,%esp
c0107ab1:	6a 07                	push   $0x7
c0107ab3:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107ab6:	50                   	push   %eax
c0107ab7:	e8 33 d2 ff ff       	call   c0104cef <open>
c0107abc:	83 c4 10             	add    $0x10,%esp
c0107abf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107ac2:	83 ec 08             	sub    $0x8,%esp
c0107ac5:	ff 75 d0             	pushl  -0x30(%ebp)
c0107ac8:	68 da ba 10 c0       	push   $0xc010bada
c0107acd:	e8 66 0c 00 00       	call   c0108738 <Printf>
c0107ad2:	83 c4 10             	add    $0x10,%esp
c0107ad5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107adc:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107ae3:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c0107aea:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107af1:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107af8:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c0107aff:	83 ec 0c             	sub    $0xc,%esp
c0107b02:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107b05:	50                   	push   %eax
c0107b06:	e8 dd 46 00 00       	call   c010c1e8 <Strlen>
c0107b0b:	83 c4 10             	add    $0x10,%esp
c0107b0e:	83 ec 04             	sub    $0x4,%esp
c0107b11:	50                   	push   %eax
c0107b12:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107b15:	50                   	push   %eax
c0107b16:	ff 75 d0             	pushl  -0x30(%ebp)
c0107b19:	e8 e7 d3 ff ff       	call   c0104f05 <write>
c0107b1e:	83 c4 10             	add    $0x10,%esp
c0107b21:	83 ec 0c             	sub    $0xc,%esp
c0107b24:	ff 75 d0             	pushl  -0x30(%ebp)
c0107b27:	e8 5e d4 ff ff       	call   c0104f8a <close>
c0107b2c:	83 c4 10             	add    $0x10,%esp
c0107b2f:	83 ec 08             	sub    $0x8,%esp
c0107b32:	6a 00                	push   $0x0
c0107b34:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107b37:	50                   	push   %eax
c0107b38:	e8 b2 d1 ff ff       	call   c0104cef <open>
c0107b3d:	83 c4 10             	add    $0x10,%esp
c0107b40:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107b43:	83 ec 04             	sub    $0x4,%esp
c0107b46:	6a 14                	push   $0x14
c0107b48:	6a 00                	push   $0x0
c0107b4a:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107b50:	50                   	push   %eax
c0107b51:	e8 59 46 00 00       	call   c010c1af <Memset>
c0107b56:	83 c4 10             	add    $0x10,%esp
c0107b59:	83 ec 04             	sub    $0x4,%esp
c0107b5c:	6a 12                	push   $0x12
c0107b5e:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107b64:	50                   	push   %eax
c0107b65:	ff 75 d0             	pushl  -0x30(%ebp)
c0107b68:	e8 17 d2 ff ff       	call   c0104d84 <read>
c0107b6d:	83 c4 10             	add    $0x10,%esp
c0107b70:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107b73:	83 ec 08             	sub    $0x8,%esp
c0107b76:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107b7c:	50                   	push   %eax
c0107b7d:	68 e3 ba 10 c0       	push   $0xc010bae3
c0107b82:	e8 b1 0b 00 00       	call   c0108738 <Printf>
c0107b87:	83 c4 10             	add    $0x10,%esp
c0107b8a:	83 ec 0c             	sub    $0xc,%esp
c0107b8d:	6a 0a                	push   $0xa
c0107b8f:	e8 70 0a 00 00       	call   c0108604 <delay>
c0107b94:	83 c4 10             	add    $0x10,%esp
c0107b97:	83 ec 08             	sub    $0x8,%esp
c0107b9a:	6a 07                	push   $0x7
c0107b9c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107b9f:	50                   	push   %eax
c0107ba0:	e8 4a d1 ff ff       	call   c0104cef <open>
c0107ba5:	83 c4 10             	add    $0x10,%esp
c0107ba8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107bab:	83 ec 08             	sub    $0x8,%esp
c0107bae:	ff 75 c8             	pushl  -0x38(%ebp)
c0107bb1:	68 ee ba 10 c0       	push   $0xc010baee
c0107bb6:	e8 7d 0b 00 00       	call   c0108738 <Printf>
c0107bbb:	83 c4 10             	add    $0x10,%esp
c0107bbe:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107bc5:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107bcb:	bb 24 bb 10 c0       	mov    $0xc010bb24,%ebx
c0107bd0:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107bd5:	8b 0b                	mov    (%ebx),%ecx
c0107bd7:	89 08                	mov    %ecx,(%eax)
c0107bd9:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107bdd:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107be1:	8d 78 04             	lea    0x4(%eax),%edi
c0107be4:	83 e7 fc             	and    $0xfffffffc,%edi
c0107be7:	29 f8                	sub    %edi,%eax
c0107be9:	29 c3                	sub    %eax,%ebx
c0107beb:	01 c2                	add    %eax,%edx
c0107bed:	83 e2 fc             	and    $0xfffffffc,%edx
c0107bf0:	89 d0                	mov    %edx,%eax
c0107bf2:	c1 e8 02             	shr    $0x2,%eax
c0107bf5:	89 de                	mov    %ebx,%esi
c0107bf7:	89 c1                	mov    %eax,%ecx
c0107bf9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107bfb:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107c02:	00 00 00 
c0107c05:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107c0c:	00 00 00 
c0107c0f:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107c16:	83 ec 0c             	sub    $0xc,%esp
c0107c19:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107c1f:	50                   	push   %eax
c0107c20:	e8 c3 45 00 00       	call   c010c1e8 <Strlen>
c0107c25:	83 c4 10             	add    $0x10,%esp
c0107c28:	83 ec 04             	sub    $0x4,%esp
c0107c2b:	50                   	push   %eax
c0107c2c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107c32:	50                   	push   %eax
c0107c33:	ff 75 c8             	pushl  -0x38(%ebp)
c0107c36:	e8 ca d2 ff ff       	call   c0104f05 <write>
c0107c3b:	83 c4 10             	add    $0x10,%esp
c0107c3e:	83 ec 0c             	sub    $0xc,%esp
c0107c41:	ff 75 c8             	pushl  -0x38(%ebp)
c0107c44:	e8 41 d3 ff ff       	call   c0104f8a <close>
c0107c49:	83 c4 10             	add    $0x10,%esp
c0107c4c:	83 ec 08             	sub    $0x8,%esp
c0107c4f:	6a 00                	push   $0x0
c0107c51:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107c54:	50                   	push   %eax
c0107c55:	e8 95 d0 ff ff       	call   c0104cef <open>
c0107c5a:	83 c4 10             	add    $0x10,%esp
c0107c5d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107c60:	83 ec 04             	sub    $0x4,%esp
c0107c63:	68 c8 00 00 00       	push   $0xc8
c0107c68:	6a 00                	push   $0x0
c0107c6a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107c70:	50                   	push   %eax
c0107c71:	e8 39 45 00 00       	call   c010c1af <Memset>
c0107c76:	83 c4 10             	add    $0x10,%esp
c0107c79:	83 ec 0c             	sub    $0xc,%esp
c0107c7c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107c82:	50                   	push   %eax
c0107c83:	e8 60 45 00 00       	call   c010c1e8 <Strlen>
c0107c88:	83 c4 10             	add    $0x10,%esp
c0107c8b:	83 ec 04             	sub    $0x4,%esp
c0107c8e:	50                   	push   %eax
c0107c8f:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107c95:	50                   	push   %eax
c0107c96:	ff 75 c8             	pushl  -0x38(%ebp)
c0107c99:	e8 e6 d0 ff ff       	call   c0104d84 <read>
c0107c9e:	83 c4 10             	add    $0x10,%esp
c0107ca1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107ca4:	83 ec 08             	sub    $0x8,%esp
c0107ca7:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107cad:	50                   	push   %eax
c0107cae:	68 f8 ba 10 c0       	push   $0xc010baf8
c0107cb3:	e8 80 0a 00 00       	call   c0108738 <Printf>
c0107cb8:	83 c4 10             	add    $0x10,%esp
c0107cbb:	83 ec 08             	sub    $0x8,%esp
c0107cbe:	6a 07                	push   $0x7
c0107cc0:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107cc3:	50                   	push   %eax
c0107cc4:	e8 26 d0 ff ff       	call   c0104cef <open>
c0107cc9:	83 c4 10             	add    $0x10,%esp
c0107ccc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107ccf:	83 ec 08             	sub    $0x8,%esp
c0107cd2:	ff 75 c8             	pushl  -0x38(%ebp)
c0107cd5:	68 ee ba 10 c0       	push   $0xc010baee
c0107cda:	e8 59 0a 00 00       	call   c0108738 <Printf>
c0107cdf:	83 c4 10             	add    $0x10,%esp
c0107ce2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107ce9:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107cf0:	20 77 69 
c0107cf3:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107cfa:	6c 20 73 
c0107cfd:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107d04:	63 63 65 
c0107d07:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107d0e:	73 20 61 
c0107d11:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107d18:	20 6c 61 
c0107d1b:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107d22:	74 2e 00 
c0107d25:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107d2c:	00 00 00 
c0107d2f:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107d36:	00 00 
c0107d38:	83 ec 0c             	sub    $0xc,%esp
c0107d3b:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107d41:	50                   	push   %eax
c0107d42:	e8 a1 44 00 00       	call   c010c1e8 <Strlen>
c0107d47:	83 c4 10             	add    $0x10,%esp
c0107d4a:	83 ec 04             	sub    $0x4,%esp
c0107d4d:	50                   	push   %eax
c0107d4e:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107d54:	50                   	push   %eax
c0107d55:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107d58:	e8 a8 d1 ff ff       	call   c0104f05 <write>
c0107d5d:	83 c4 10             	add    $0x10,%esp
c0107d60:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107d67:	eb 7e                	jmp    c0107de7 <TestFS+0x3ec>
c0107d69:	83 ec 0c             	sub    $0xc,%esp
c0107d6c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107d6f:	e8 16 d2 ff ff       	call   c0104f8a <close>
c0107d74:	83 c4 10             	add    $0x10,%esp
c0107d77:	83 ec 08             	sub    $0x8,%esp
c0107d7a:	6a 00                	push   $0x0
c0107d7c:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107d7f:	50                   	push   %eax
c0107d80:	e8 6a cf ff ff       	call   c0104cef <open>
c0107d85:	83 c4 10             	add    $0x10,%esp
c0107d88:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107d8b:	83 ec 04             	sub    $0x4,%esp
c0107d8e:	6a 1e                	push   $0x1e
c0107d90:	6a 00                	push   $0x0
c0107d92:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107d98:	50                   	push   %eax
c0107d99:	e8 11 44 00 00       	call   c010c1af <Memset>
c0107d9e:	83 c4 10             	add    $0x10,%esp
c0107da1:	83 ec 0c             	sub    $0xc,%esp
c0107da4:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107daa:	50                   	push   %eax
c0107dab:	e8 38 44 00 00       	call   c010c1e8 <Strlen>
c0107db0:	83 c4 10             	add    $0x10,%esp
c0107db3:	83 ec 04             	sub    $0x4,%esp
c0107db6:	50                   	push   %eax
c0107db7:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107dbd:	50                   	push   %eax
c0107dbe:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107dc1:	e8 be cf ff ff       	call   c0104d84 <read>
c0107dc6:	83 c4 10             	add    $0x10,%esp
c0107dc9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107dcc:	83 ec 08             	sub    $0x8,%esp
c0107dcf:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107dd5:	50                   	push   %eax
c0107dd6:	68 03 bb 10 c0       	push   $0xc010bb03
c0107ddb:	e8 58 09 00 00       	call   c0108738 <Printf>
c0107de0:	83 c4 10             	add    $0x10,%esp
c0107de3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107de7:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107deb:	0f 8e 78 ff ff ff    	jle    c0107d69 <TestFS+0x36e>
c0107df1:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107df8:	6e 73 74 
c0107dfb:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107e02:	6c 6c 2e 
c0107e05:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107e0c:	61 72 00 
c0107e0f:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107e16:	00 00 00 
c0107e19:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107e20:	00 00 00 
c0107e23:	83 ec 08             	sub    $0x8,%esp
c0107e26:	6a 00                	push   $0x0
c0107e28:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107e2e:	50                   	push   %eax
c0107e2f:	e8 bb ce ff ff       	call   c0104cef <open>
c0107e34:	83 c4 10             	add    $0x10,%esp
c0107e37:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107e3a:	83 ec 08             	sub    $0x8,%esp
c0107e3d:	ff 75 bc             	pushl  -0x44(%ebp)
c0107e40:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107e45:	e8 ee 08 00 00       	call   c0108738 <Printf>
c0107e4a:	83 c4 10             	add    $0x10,%esp
c0107e4d:	83 ec 04             	sub    $0x4,%esp
c0107e50:	6a 28                	push   $0x28
c0107e52:	6a 00                	push   $0x0
c0107e54:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107e5a:	50                   	push   %eax
c0107e5b:	e8 4f 43 00 00       	call   c010c1af <Memset>
c0107e60:	83 c4 10             	add    $0x10,%esp
c0107e63:	83 ec 04             	sub    $0x4,%esp
c0107e66:	6a 28                	push   $0x28
c0107e68:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107e6e:	50                   	push   %eax
c0107e6f:	ff 75 bc             	pushl  -0x44(%ebp)
c0107e72:	e8 0d cf ff ff       	call   c0104d84 <read>
c0107e77:	83 c4 10             	add    $0x10,%esp
c0107e7a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107e7d:	83 ec 08             	sub    $0x8,%esp
c0107e80:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107e86:	50                   	push   %eax
c0107e87:	68 18 bb 10 c0       	push   $0xc010bb18
c0107e8c:	e8 a7 08 00 00       	call   c0108738 <Printf>
c0107e91:	83 c4 10             	add    $0x10,%esp
c0107e94:	90                   	nop
c0107e95:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107e98:	5b                   	pop    %ebx
c0107e99:	5e                   	pop    %esi
c0107e9a:	5f                   	pop    %edi
c0107e9b:	5d                   	pop    %ebp
c0107e9c:	c3                   	ret    

c0107e9d <wait_exit>:
c0107e9d:	55                   	push   %ebp
c0107e9e:	89 e5                	mov    %esp,%ebp
c0107ea0:	83 ec 28             	sub    $0x28,%esp
c0107ea3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107eaa:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107eb1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107eb7:	83 ec 08             	sub    $0x8,%esp
c0107eba:	6a 02                	push   $0x2
c0107ebc:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107ebf:	50                   	push   %eax
c0107ec0:	e8 2a ce ff ff       	call   c0104cef <open>
c0107ec5:	83 c4 10             	add    $0x10,%esp
c0107ec8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107ecb:	83 ec 08             	sub    $0x8,%esp
c0107ece:	6a 02                	push   $0x2
c0107ed0:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107ed3:	50                   	push   %eax
c0107ed4:	e8 16 ce ff ff       	call   c0104cef <open>
c0107ed9:	83 c4 10             	add    $0x10,%esp
c0107edc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107edf:	e8 6b d1 ff ff       	call   c010504f <fork>
c0107ee4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107ee7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107eeb:	7e 35                	jle    c0107f22 <wait_exit+0x85>
c0107eed:	83 ec 0c             	sub    $0xc,%esp
c0107ef0:	68 ec bb 10 c0       	push   $0xc010bbec
c0107ef5:	e8 3e 08 00 00       	call   c0108738 <Printf>
c0107efa:	83 c4 10             	add    $0x10,%esp
c0107efd:	83 ec 0c             	sub    $0xc,%esp
c0107f00:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107f03:	50                   	push   %eax
c0107f04:	e8 d3 d0 ff ff       	call   c0104fdc <wait>
c0107f09:	83 c4 10             	add    $0x10,%esp
c0107f0c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107f0f:	83 ec 08             	sub    $0x8,%esp
c0107f12:	50                   	push   %eax
c0107f13:	68 04 bc 10 c0       	push   $0xc010bc04
c0107f18:	e8 1b 08 00 00       	call   c0108738 <Printf>
c0107f1d:	83 c4 10             	add    $0x10,%esp
c0107f20:	eb fe                	jmp    c0107f20 <wait_exit+0x83>
c0107f22:	83 ec 0c             	sub    $0xc,%esp
c0107f25:	68 1f bc 10 c0       	push   $0xc010bc1f
c0107f2a:	e8 09 08 00 00       	call   c0108738 <Printf>
c0107f2f:	83 c4 10             	add    $0x10,%esp
c0107f32:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107f39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107f3c:	8d 50 01             	lea    0x1(%eax),%edx
c0107f3f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107f42:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107f47:	7f 02                	jg     c0107f4b <wait_exit+0xae>
c0107f49:	eb ee                	jmp    c0107f39 <wait_exit+0x9c>
c0107f4b:	90                   	nop
c0107f4c:	83 ec 0c             	sub    $0xc,%esp
c0107f4f:	68 2b bc 10 c0       	push   $0xc010bc2b
c0107f54:	e8 df 07 00 00       	call   c0108738 <Printf>
c0107f59:	83 c4 10             	add    $0x10,%esp
c0107f5c:	83 ec 0c             	sub    $0xc,%esp
c0107f5f:	68 39 bc 10 c0       	push   $0xc010bc39
c0107f64:	e8 cf 07 00 00       	call   c0108738 <Printf>
c0107f69:	83 c4 10             	add    $0x10,%esp
c0107f6c:	83 ec 0c             	sub    $0xc,%esp
c0107f6f:	68 48 bc 10 c0       	push   $0xc010bc48
c0107f74:	e8 bf 07 00 00       	call   c0108738 <Printf>
c0107f79:	83 c4 10             	add    $0x10,%esp
c0107f7c:	83 ec 0c             	sub    $0xc,%esp
c0107f7f:	6a 5a                	push   $0x5a
c0107f81:	e8 9a d0 ff ff       	call   c0105020 <exit>
c0107f86:	83 c4 10             	add    $0x10,%esp
c0107f89:	83 ec 0c             	sub    $0xc,%esp
c0107f8c:	68 57 bc 10 c0       	push   $0xc010bc57
c0107f91:	e8 a2 07 00 00       	call   c0108738 <Printf>
c0107f96:	83 c4 10             	add    $0x10,%esp
c0107f99:	eb fe                	jmp    c0107f99 <wait_exit+0xfc>

c0107f9b <INIT_fork>:
c0107f9b:	55                   	push   %ebp
c0107f9c:	89 e5                	mov    %esp,%ebp
c0107f9e:	83 ec 78             	sub    $0x78,%esp
c0107fa1:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107fa8:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107faf:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107fb5:	83 ec 08             	sub    $0x8,%esp
c0107fb8:	6a 02                	push   $0x2
c0107fba:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107fbd:	50                   	push   %eax
c0107fbe:	e8 2c cd ff ff       	call   c0104cef <open>
c0107fc3:	83 c4 10             	add    $0x10,%esp
c0107fc6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107fc9:	83 ec 08             	sub    $0x8,%esp
c0107fcc:	6a 02                	push   $0x2
c0107fce:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107fd1:	50                   	push   %eax
c0107fd2:	e8 18 cd ff ff       	call   c0104cef <open>
c0107fd7:	83 c4 10             	add    $0x10,%esp
c0107fda:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107fdd:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107fe4:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107feb:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107ff2:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107ff9:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0108000:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0108007:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c010800e:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0108015:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c010801c:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0108023:	83 ec 0c             	sub    $0xc,%esp
c0108026:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108029:	50                   	push   %eax
c010802a:	e8 09 07 00 00       	call   c0108738 <Printf>
c010802f:	83 c4 10             	add    $0x10,%esp
c0108032:	83 ec 0c             	sub    $0xc,%esp
c0108035:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108038:	50                   	push   %eax
c0108039:	e8 aa 41 00 00       	call   c010c1e8 <Strlen>
c010803e:	83 c4 10             	add    $0x10,%esp
c0108041:	83 ec 04             	sub    $0x4,%esp
c0108044:	50                   	push   %eax
c0108045:	6a 00                	push   $0x0
c0108047:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010804a:	50                   	push   %eax
c010804b:	e8 5f 41 00 00       	call   c010c1af <Memset>
c0108050:	83 c4 10             	add    $0x10,%esp
c0108053:	83 ec 04             	sub    $0x4,%esp
c0108056:	6a 28                	push   $0x28
c0108058:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010805b:	50                   	push   %eax
c010805c:	ff 75 f0             	pushl  -0x10(%ebp)
c010805f:	e8 20 cd ff ff       	call   c0104d84 <read>
c0108064:	83 c4 10             	add    $0x10,%esp
c0108067:	83 ec 0c             	sub    $0xc,%esp
c010806a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010806d:	50                   	push   %eax
c010806e:	e8 c5 06 00 00       	call   c0108738 <Printf>
c0108073:	83 c4 10             	add    $0x10,%esp
c0108076:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010807d:	e8 cd cf ff ff       	call   c010504f <fork>
c0108082:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108085:	83 ec 0c             	sub    $0xc,%esp
c0108088:	6a 01                	push   $0x1
c010808a:	e8 75 05 00 00       	call   c0108604 <delay>
c010808f:	83 c4 10             	add    $0x10,%esp
c0108092:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108096:	0f 8e cd 00 00 00    	jle    c0108169 <INIT_fork+0x1ce>
c010809c:	83 ec 08             	sub    $0x8,%esp
c010809f:	ff 75 e8             	pushl  -0x18(%ebp)
c01080a2:	68 65 bc 10 c0       	push   $0xc010bc65
c01080a7:	e8 8c 06 00 00       	call   c0108738 <Printf>
c01080ac:	83 c4 10             	add    $0x10,%esp
c01080af:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01080b3:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c01080ba:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c01080c1:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c01080c8:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c01080cf:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c01080d6:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c01080dd:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c01080e4:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c01080eb:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c01080f2:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c01080f9:	83 ec 0c             	sub    $0xc,%esp
c01080fc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080ff:	50                   	push   %eax
c0108100:	e8 e3 40 00 00       	call   c010c1e8 <Strlen>
c0108105:	83 c4 10             	add    $0x10,%esp
c0108108:	83 ec 04             	sub    $0x4,%esp
c010810b:	50                   	push   %eax
c010810c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010810f:	50                   	push   %eax
c0108110:	ff 75 f4             	pushl  -0xc(%ebp)
c0108113:	e8 ed cd ff ff       	call   c0104f05 <write>
c0108118:	83 c4 10             	add    $0x10,%esp
c010811b:	e8 b2 ec ff ff       	call   c0106dd2 <catch_error>
c0108120:	83 ec 0c             	sub    $0xc,%esp
c0108123:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108126:	50                   	push   %eax
c0108127:	e8 bc 40 00 00       	call   c010c1e8 <Strlen>
c010812c:	83 c4 10             	add    $0x10,%esp
c010812f:	83 ec 04             	sub    $0x4,%esp
c0108132:	50                   	push   %eax
c0108133:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108136:	50                   	push   %eax
c0108137:	ff 75 f4             	pushl  -0xc(%ebp)
c010813a:	e8 c6 cd ff ff       	call   c0104f05 <write>
c010813f:	83 c4 10             	add    $0x10,%esp
c0108142:	83 ec 0c             	sub    $0xc,%esp
c0108145:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108148:	50                   	push   %eax
c0108149:	e8 9a 40 00 00       	call   c010c1e8 <Strlen>
c010814e:	83 c4 10             	add    $0x10,%esp
c0108151:	83 ec 04             	sub    $0x4,%esp
c0108154:	50                   	push   %eax
c0108155:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108158:	50                   	push   %eax
c0108159:	ff 75 f4             	pushl  -0xc(%ebp)
c010815c:	e8 a4 cd ff ff       	call   c0104f05 <write>
c0108161:	83 c4 10             	add    $0x10,%esp
c0108164:	e9 d6 00 00 00       	jmp    c010823f <INIT_fork+0x2a4>
c0108169:	83 ec 08             	sub    $0x8,%esp
c010816c:	ff 75 e8             	pushl  -0x18(%ebp)
c010816f:	68 65 bc 10 c0       	push   $0xc010bc65
c0108174:	e8 bf 05 00 00       	call   c0108738 <Printf>
c0108179:	83 c4 10             	add    $0x10,%esp
c010817c:	83 ec 0c             	sub    $0xc,%esp
c010817f:	6a 01                	push   $0x1
c0108181:	e8 7e 04 00 00       	call   c0108604 <delay>
c0108186:	83 c4 10             	add    $0x10,%esp
c0108189:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010818d:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0108191:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0108198:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c010819f:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c01081a6:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c01081ad:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c01081b4:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c01081bb:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c01081c2:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c01081c9:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c01081d0:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c01081d7:	83 ec 0c             	sub    $0xc,%esp
c01081da:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01081dd:	50                   	push   %eax
c01081de:	e8 05 40 00 00       	call   c010c1e8 <Strlen>
c01081e3:	83 c4 10             	add    $0x10,%esp
c01081e6:	83 ec 04             	sub    $0x4,%esp
c01081e9:	50                   	push   %eax
c01081ea:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01081ed:	50                   	push   %eax
c01081ee:	ff 75 f4             	pushl  -0xc(%ebp)
c01081f1:	e8 0f cd ff ff       	call   c0104f05 <write>
c01081f6:	83 c4 10             	add    $0x10,%esp
c01081f9:	83 ec 0c             	sub    $0xc,%esp
c01081fc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01081ff:	50                   	push   %eax
c0108200:	e8 e3 3f 00 00       	call   c010c1e8 <Strlen>
c0108205:	83 c4 10             	add    $0x10,%esp
c0108208:	83 ec 04             	sub    $0x4,%esp
c010820b:	50                   	push   %eax
c010820c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010820f:	50                   	push   %eax
c0108210:	ff 75 f4             	pushl  -0xc(%ebp)
c0108213:	e8 ed cc ff ff       	call   c0104f05 <write>
c0108218:	83 c4 10             	add    $0x10,%esp
c010821b:	83 ec 0c             	sub    $0xc,%esp
c010821e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108221:	50                   	push   %eax
c0108222:	e8 c1 3f 00 00       	call   c010c1e8 <Strlen>
c0108227:	83 c4 10             	add    $0x10,%esp
c010822a:	83 ec 04             	sub    $0x4,%esp
c010822d:	50                   	push   %eax
c010822e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108231:	50                   	push   %eax
c0108232:	ff 75 f4             	pushl  -0xc(%ebp)
c0108235:	e8 cb cc ff ff       	call   c0104f05 <write>
c010823a:	83 c4 10             	add    $0x10,%esp
c010823d:	eb fe                	jmp    c010823d <INIT_fork+0x2a2>
c010823f:	83 ec 04             	sub    $0x4,%esp
c0108242:	6a 28                	push   $0x28
c0108244:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108247:	50                   	push   %eax
c0108248:	ff 75 f0             	pushl  -0x10(%ebp)
c010824b:	e8 34 cb ff ff       	call   c0104d84 <read>
c0108250:	83 c4 10             	add    $0x10,%esp
c0108253:	83 ec 0c             	sub    $0xc,%esp
c0108256:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108259:	50                   	push   %eax
c010825a:	e8 d9 04 00 00       	call   c0108738 <Printf>
c010825f:	83 c4 10             	add    $0x10,%esp
c0108262:	83 ec 0c             	sub    $0xc,%esp
c0108265:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108268:	50                   	push   %eax
c0108269:	e8 ca 04 00 00       	call   c0108738 <Printf>
c010826e:	83 c4 10             	add    $0x10,%esp
c0108271:	83 ec 0c             	sub    $0xc,%esp
c0108274:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108277:	50                   	push   %eax
c0108278:	e8 bb 04 00 00       	call   c0108738 <Printf>
c010827d:	83 c4 10             	add    $0x10,%esp
c0108280:	83 ec 0c             	sub    $0xc,%esp
c0108283:	68 6f bc 10 c0       	push   $0xc010bc6f
c0108288:	e8 c4 07 00 00       	call   c0108a51 <spin>
c010828d:	83 c4 10             	add    $0x10,%esp
c0108290:	90                   	nop
c0108291:	c9                   	leave  
c0108292:	c3                   	ret    

c0108293 <simple_shell>:
c0108293:	55                   	push   %ebp
c0108294:	89 e5                	mov    %esp,%ebp
c0108296:	57                   	push   %edi
c0108297:	83 ec 64             	sub    $0x64,%esp
c010829a:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c01082a1:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c01082a8:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c01082ae:	83 ec 08             	sub    $0x8,%esp
c01082b1:	6a 02                	push   $0x2
c01082b3:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01082b6:	50                   	push   %eax
c01082b7:	e8 33 ca ff ff       	call   c0104cef <open>
c01082bc:	83 c4 10             	add    $0x10,%esp
c01082bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01082c2:	83 ec 08             	sub    $0x8,%esp
c01082c5:	6a 02                	push   $0x2
c01082c7:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01082ca:	50                   	push   %eax
c01082cb:	e8 1f ca ff ff       	call   c0104cef <open>
c01082d0:	83 c4 10             	add    $0x10,%esp
c01082d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01082d6:	8d 55 a8             	lea    -0x58(%ebp),%edx
c01082d9:	b8 00 00 00 00       	mov    $0x0,%eax
c01082de:	b9 0a 00 00 00       	mov    $0xa,%ecx
c01082e3:	89 d7                	mov    %edx,%edi
c01082e5:	f3 ab                	rep stos %eax,%es:(%edi)
c01082e7:	c7 45 a8 77 bc 10 c0 	movl   $0xc010bc77,-0x58(%ebp)
c01082ee:	c7 45 ac 7c bc 10 c0 	movl   $0xc010bc7c,-0x54(%ebp)
c01082f5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01082fc:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0108303:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c010830a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010830d:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c0108314:	00 
c0108315:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0108318:	85 c0                	test   %eax,%eax
c010831a:	75 1c                	jne    c0108338 <simple_shell+0xa5>
c010831c:	68 0e 03 00 00       	push   $0x30e
c0108321:	68 41 ba 10 c0       	push   $0xc010ba41
c0108326:	68 41 ba 10 c0       	push   $0xc010ba41
c010832b:	68 82 bc 10 c0       	push   $0xc010bc82
c0108330:	e8 60 07 00 00       	call   c0108a95 <assertion_failure>
c0108335:	83 c4 10             	add    $0x10,%esp
c0108338:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010833b:	83 ec 08             	sub    $0x8,%esp
c010833e:	6a 02                	push   $0x2
c0108340:	50                   	push   %eax
c0108341:	e8 a9 c9 ff ff       	call   c0104cef <open>
c0108346:	83 c4 10             	add    $0x10,%esp
c0108349:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010834c:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0108350:	75 4b                	jne    c010839d <simple_shell+0x10a>
c0108352:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108359:	eb 26                	jmp    c0108381 <simple_shell+0xee>
c010835b:	8b 55 a8             	mov    -0x58(%ebp),%edx
c010835e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108361:	01 d0                	add    %edx,%eax
c0108363:	0f b6 00             	movzbl (%eax),%eax
c0108366:	0f be c0             	movsbl %al,%eax
c0108369:	83 ec 04             	sub    $0x4,%esp
c010836c:	50                   	push   %eax
c010836d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108370:	68 91 bc 10 c0       	push   $0xc010bc91
c0108375:	e8 be 03 00 00       	call   c0108738 <Printf>
c010837a:	83 c4 10             	add    $0x10,%esp
c010837d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108381:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0108385:	7e d4                	jle    c010835b <simple_shell+0xc8>
c0108387:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010838a:	83 ec 08             	sub    $0x8,%esp
c010838d:	50                   	push   %eax
c010838e:	68 98 bc 10 c0       	push   $0xc010bc98
c0108393:	e8 a0 03 00 00       	call   c0108738 <Printf>
c0108398:	83 c4 10             	add    $0x10,%esp
c010839b:	eb 78                	jmp    c0108415 <simple_shell+0x182>
c010839d:	83 ec 0c             	sub    $0xc,%esp
c01083a0:	68 9e bc 10 c0       	push   $0xc010bc9e
c01083a5:	e8 8e 03 00 00       	call   c0108738 <Printf>
c01083aa:	83 c4 10             	add    $0x10,%esp
c01083ad:	e8 9d cc ff ff       	call   c010504f <fork>
c01083b2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01083b5:	83 ec 0c             	sub    $0xc,%esp
c01083b8:	68 b3 bc 10 c0       	push   $0xc010bcb3
c01083bd:	e8 76 03 00 00       	call   c0108738 <Printf>
c01083c2:	83 c4 10             	add    $0x10,%esp
c01083c5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01083c9:	7e 11                	jle    c01083dc <simple_shell+0x149>
c01083cb:	83 ec 0c             	sub    $0xc,%esp
c01083ce:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c01083d1:	50                   	push   %eax
c01083d2:	e8 05 cc ff ff       	call   c0104fdc <wait>
c01083d7:	83 c4 10             	add    $0x10,%esp
c01083da:	eb 39                	jmp    c0108415 <simple_shell+0x182>
c01083dc:	83 ec 0c             	sub    $0xc,%esp
c01083df:	68 c8 bc 10 c0       	push   $0xc010bcc8
c01083e4:	e8 4f 03 00 00       	call   c0108738 <Printf>
c01083e9:	83 c4 10             	add    $0x10,%esp
c01083ec:	83 ec 0c             	sub    $0xc,%esp
c01083ef:	ff 75 e0             	pushl  -0x20(%ebp)
c01083f2:	e8 93 cb ff ff       	call   c0104f8a <close>
c01083f7:	83 c4 10             	add    $0x10,%esp
c01083fa:	6a 00                	push   $0x0
c01083fc:	68 7c bc 10 c0       	push   $0xc010bc7c
c0108401:	68 77 bc 10 c0       	push   $0xc010bc77
c0108406:	68 e4 bc 10 c0       	push   $0xc010bce4
c010840b:	e8 12 cf ff ff       	call   c0105322 <execl>
c0108410:	83 c4 10             	add    $0x10,%esp
c0108413:	eb fe                	jmp    c0108413 <simple_shell+0x180>
c0108415:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0108418:	c9                   	leave  
c0108419:	c3                   	ret    

c010841a <test_shell>:
c010841a:	55                   	push   %ebp
c010841b:	89 e5                	mov    %esp,%ebp
c010841d:	83 ec 38             	sub    $0x38,%esp
c0108420:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0108427:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c010842e:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0108434:	83 ec 08             	sub    $0x8,%esp
c0108437:	6a 02                	push   $0x2
c0108439:	8d 45 ea             	lea    -0x16(%ebp),%eax
c010843c:	50                   	push   %eax
c010843d:	e8 ad c8 ff ff       	call   c0104cef <open>
c0108442:	83 c4 10             	add    $0x10,%esp
c0108445:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108448:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c010844f:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0108456:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c010845d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108464:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010846b:	83 ec 0c             	sub    $0xc,%esp
c010846e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108471:	50                   	push   %eax
c0108472:	e8 38 ea ff ff       	call   c0106eaf <untar>
c0108477:	83 c4 10             	add    $0x10,%esp
c010847a:	e8 14 fe ff ff       	call   c0108293 <simple_shell>
c010847f:	90                   	nop
c0108480:	c9                   	leave  
c0108481:	c3                   	ret    

c0108482 <test_exec>:
c0108482:	55                   	push   %ebp
c0108483:	89 e5                	mov    %esp,%ebp
c0108485:	83 ec 38             	sub    $0x38,%esp
c0108488:	83 ec 0c             	sub    $0xc,%esp
c010848b:	68 ea bc 10 c0       	push   $0xc010bcea
c0108490:	e8 44 7c ff ff       	call   c01000d9 <disp_str>
c0108495:	83 c4 10             	add    $0x10,%esp
c0108498:	83 ec 0c             	sub    $0xc,%esp
c010849b:	68 fc bc 10 c0       	push   $0xc010bcfc
c01084a0:	e8 34 7c ff ff       	call   c01000d9 <disp_str>
c01084a5:	83 c4 10             	add    $0x10,%esp
c01084a8:	83 ec 0c             	sub    $0xc,%esp
c01084ab:	6a 07                	push   $0x7
c01084ad:	e8 b8 ed ff ff       	call   c010726a <disp_int>
c01084b2:	83 c4 10             	add    $0x10,%esp
c01084b5:	83 ec 0c             	sub    $0xc,%esp
c01084b8:	68 e0 b5 10 c0       	push   $0xc010b5e0
c01084bd:	e8 17 7c ff ff       	call   c01000d9 <disp_str>
c01084c2:	83 c4 10             	add    $0x10,%esp
c01084c5:	83 ec 0c             	sub    $0xc,%esp
c01084c8:	68 e2 b5 10 c0       	push   $0xc010b5e2
c01084cd:	e8 07 7c ff ff       	call   c01000d9 <disp_str>
c01084d2:	83 c4 10             	add    $0x10,%esp
c01084d5:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c01084dc:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c01084e3:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c01084e9:	83 ec 08             	sub    $0x8,%esp
c01084ec:	6a 02                	push   $0x2
c01084ee:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c01084f1:	50                   	push   %eax
c01084f2:	e8 f8 c7 ff ff       	call   c0104cef <open>
c01084f7:	83 c4 10             	add    $0x10,%esp
c01084fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01084fd:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0108504:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c010850b:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0108512:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0108519:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108520:	83 ec 0c             	sub    $0xc,%esp
c0108523:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108526:	50                   	push   %eax
c0108527:	e8 83 e9 ff ff       	call   c0106eaf <untar>
c010852c:	83 c4 10             	add    $0x10,%esp
c010852f:	83 ec 08             	sub    $0x8,%esp
c0108532:	6a 00                	push   $0x0
c0108534:	68 0f bd 10 c0       	push   $0xc010bd0f
c0108539:	68 13 bd 10 c0       	push   $0xc010bd13
c010853e:	68 7c bc 10 c0       	push   $0xc010bc7c
c0108543:	68 77 bc 10 c0       	push   $0xc010bc77
c0108548:	68 e4 bc 10 c0       	push   $0xc010bce4
c010854d:	e8 d0 cd ff ff       	call   c0105322 <execl>
c0108552:	83 c4 20             	add    $0x20,%esp
c0108555:	e8 34 e8 ff ff       	call   c0106d8e <stop_here>
c010855a:	e8 f0 ca ff ff       	call   c010504f <fork>
c010855f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108562:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108566:	7e 25                	jle    c010858d <test_exec+0x10b>
c0108568:	83 ec 0c             	sub    $0xc,%esp
c010856b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c010856e:	50                   	push   %eax
c010856f:	e8 68 ca ff ff       	call   c0104fdc <wait>
c0108574:	83 c4 10             	add    $0x10,%esp
c0108577:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010857a:	83 ec 08             	sub    $0x8,%esp
c010857d:	50                   	push   %eax
c010857e:	68 19 bd 10 c0       	push   $0xc010bd19
c0108583:	e8 b0 01 00 00       	call   c0108738 <Printf>
c0108588:	83 c4 10             	add    $0x10,%esp
c010858b:	eb 33                	jmp    c01085c0 <test_exec+0x13e>
c010858d:	83 ec 0c             	sub    $0xc,%esp
c0108590:	68 2b bd 10 c0       	push   $0xc010bd2b
c0108595:	e8 9e 01 00 00       	call   c0108738 <Printf>
c010859a:	83 c4 10             	add    $0x10,%esp
c010859d:	83 ec 0c             	sub    $0xc,%esp
c01085a0:	6a 00                	push   $0x0
c01085a2:	68 13 bd 10 c0       	push   $0xc010bd13
c01085a7:	68 7c bc 10 c0       	push   $0xc010bc7c
c01085ac:	68 77 bc 10 c0       	push   $0xc010bc77
c01085b1:	68 e4 bc 10 c0       	push   $0xc010bce4
c01085b6:	e8 67 cd ff ff       	call   c0105322 <execl>
c01085bb:	83 c4 20             	add    $0x20,%esp
c01085be:	eb fe                	jmp    c01085be <test_exec+0x13c>
c01085c0:	c9                   	leave  
c01085c1:	c3                   	ret    

c01085c2 <INIT>:
c01085c2:	55                   	push   %ebp
c01085c3:	89 e5                	mov    %esp,%ebp
c01085c5:	83 ec 08             	sub    $0x8,%esp
c01085c8:	e8 4d fe ff ff       	call   c010841a <test_shell>
c01085cd:	eb fe                	jmp    c01085cd <INIT+0xb>

c01085cf <TestA>:
c01085cf:	55                   	push   %ebp
c01085d0:	89 e5                	mov    %esp,%ebp
c01085d2:	83 ec 08             	sub    $0x8,%esp
c01085d5:	83 ec 0c             	sub    $0xc,%esp
c01085d8:	6a 05                	push   $0x5
c01085da:	e8 8b ec ff ff       	call   c010726a <disp_int>
c01085df:	83 c4 10             	add    $0x10,%esp
c01085e2:	83 ec 0c             	sub    $0xc,%esp
c01085e5:	68 f3 b6 10 c0       	push   $0xc010b6f3
c01085ea:	e8 ea 7a ff ff       	call   c01000d9 <disp_str>
c01085ef:	83 c4 10             	add    $0x10,%esp
c01085f2:	83 ec 0c             	sub    $0xc,%esp
c01085f5:	68 39 bd 10 c0       	push   $0xc010bd39
c01085fa:	e8 da 7a ff ff       	call   c01000d9 <disp_str>
c01085ff:	83 c4 10             	add    $0x10,%esp
c0108602:	eb fe                	jmp    c0108602 <TestA+0x33>

c0108604 <delay>:
c0108604:	55                   	push   %ebp
c0108605:	89 e5                	mov    %esp,%ebp
c0108607:	83 ec 10             	sub    $0x10,%esp
c010860a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108611:	eb 2a                	jmp    c010863d <delay+0x39>
c0108613:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c010861a:	eb 17                	jmp    c0108633 <delay+0x2f>
c010861c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108623:	eb 04                	jmp    c0108629 <delay+0x25>
c0108625:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108629:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c010862d:	7e f6                	jle    c0108625 <delay+0x21>
c010862f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0108633:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0108637:	7e e3                	jle    c010861c <delay+0x18>
c0108639:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010863d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108640:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108643:	7c ce                	jl     c0108613 <delay+0xf>
c0108645:	90                   	nop
c0108646:	c9                   	leave  
c0108647:	c3                   	ret    

c0108648 <TestB>:
c0108648:	55                   	push   %ebp
c0108649:	89 e5                	mov    %esp,%ebp
c010864b:	83 ec 08             	sub    $0x8,%esp
c010864e:	83 ec 0c             	sub    $0xc,%esp
c0108651:	68 40 bd 10 c0       	push   $0xc010bd40
c0108656:	e8 7e 7a ff ff       	call   c01000d9 <disp_str>
c010865b:	83 c4 10             	add    $0x10,%esp
c010865e:	eb fe                	jmp    c010865e <TestB+0x16>

c0108660 <TestC>:
c0108660:	55                   	push   %ebp
c0108661:	89 e5                	mov    %esp,%ebp
c0108663:	83 ec 18             	sub    $0x18,%esp
c0108666:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010866d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108671:	77 1a                	ja     c010868d <TestC+0x2d>
c0108673:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010867a:	83 ec 08             	sub    $0x8,%esp
c010867d:	ff 75 f0             	pushl  -0x10(%ebp)
c0108680:	68 43 bd 10 c0       	push   $0xc010bd43
c0108685:	e8 ae 00 00 00       	call   c0108738 <Printf>
c010868a:	83 c4 10             	add    $0x10,%esp
c010868d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108691:	eb da                	jmp    c010866d <TestC+0xd>

c0108693 <sys_get_ticks>:
c0108693:	55                   	push   %ebp
c0108694:	89 e5                	mov    %esp,%ebp
c0108696:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010869b:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01086a1:	5d                   	pop    %ebp
c01086a2:	c3                   	ret    

c01086a3 <sys_write>:
c01086a3:	55                   	push   %ebp
c01086a4:	89 e5                	mov    %esp,%ebp
c01086a6:	83 ec 18             	sub    $0x18,%esp
c01086a9:	8b 45 10             	mov    0x10(%ebp),%eax
c01086ac:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01086b2:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01086b8:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01086bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01086c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01086c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01086c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01086c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01086cc:	eb 20                	jmp    c01086ee <sys_write+0x4b>
c01086ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086d1:	0f b6 00             	movzbl (%eax),%eax
c01086d4:	0f b6 c0             	movzbl %al,%eax
c01086d7:	83 ec 08             	sub    $0x8,%esp
c01086da:	50                   	push   %eax
c01086db:	ff 75 ec             	pushl  -0x14(%ebp)
c01086de:	e8 7d b9 ff ff       	call   c0104060 <out_char>
c01086e3:	83 c4 10             	add    $0x10,%esp
c01086e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01086ea:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c01086ee:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01086f2:	7f da                	jg     c01086ce <sys_write+0x2b>
c01086f4:	90                   	nop
c01086f5:	c9                   	leave  
c01086f6:	c3                   	ret    

c01086f7 <milli_delay>:
c01086f7:	55                   	push   %ebp
c01086f8:	89 e5                	mov    %esp,%ebp
c01086fa:	83 ec 18             	sub    $0x18,%esp
c01086fd:	e8 8a 11 00 00       	call   c010988c <get_ticks_ipc>
c0108702:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108705:	90                   	nop
c0108706:	e8 81 11 00 00       	call   c010988c <get_ticks_ipc>
c010870b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c010870e:	89 c1                	mov    %eax,%ecx
c0108710:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0108715:	89 c8                	mov    %ecx,%eax
c0108717:	f7 ea                	imul   %edx
c0108719:	c1 fa 05             	sar    $0x5,%edx
c010871c:	89 c8                	mov    %ecx,%eax
c010871e:	c1 f8 1f             	sar    $0x1f,%eax
c0108721:	29 c2                	sub    %eax,%edx
c0108723:	89 d0                	mov    %edx,%eax
c0108725:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c010872b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010872e:	77 d6                	ja     c0108706 <milli_delay+0xf>
c0108730:	90                   	nop
c0108731:	c9                   	leave  
c0108732:	c3                   	ret    

c0108733 <TaskSys>:
c0108733:	55                   	push   %ebp
c0108734:	89 e5                	mov    %esp,%ebp
c0108736:	eb fe                	jmp    c0108736 <TaskSys+0x3>

c0108738 <Printf>:
c0108738:	55                   	push   %ebp
c0108739:	89 e5                	mov    %esp,%ebp
c010873b:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108741:	83 ec 04             	sub    $0x4,%esp
c0108744:	68 00 01 00 00       	push   $0x100
c0108749:	6a 00                	push   $0x0
c010874b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108751:	50                   	push   %eax
c0108752:	e8 58 3a 00 00       	call   c010c1af <Memset>
c0108757:	83 c4 10             	add    $0x10,%esp
c010875a:	8d 45 0c             	lea    0xc(%ebp),%eax
c010875d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108760:	8b 45 08             	mov    0x8(%ebp),%eax
c0108763:	83 ec 04             	sub    $0x4,%esp
c0108766:	ff 75 f4             	pushl  -0xc(%ebp)
c0108769:	50                   	push   %eax
c010876a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108770:	50                   	push   %eax
c0108771:	e8 20 00 00 00       	call   c0108796 <vsprintf>
c0108776:	83 c4 10             	add    $0x10,%esp
c0108779:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010877c:	83 ec 04             	sub    $0x4,%esp
c010877f:	ff 75 f0             	pushl  -0x10(%ebp)
c0108782:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108788:	50                   	push   %eax
c0108789:	6a 00                	push   $0x0
c010878b:	e8 75 c7 ff ff       	call   c0104f05 <write>
c0108790:	83 c4 10             	add    $0x10,%esp
c0108793:	90                   	nop
c0108794:	c9                   	leave  
c0108795:	c3                   	ret    

c0108796 <vsprintf>:
c0108796:	55                   	push   %ebp
c0108797:	89 e5                	mov    %esp,%ebp
c0108799:	81 ec 68 02 00 00    	sub    $0x268,%esp
c010879f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01087a5:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c01087ab:	83 ec 04             	sub    $0x4,%esp
c01087ae:	6a 40                	push   $0x40
c01087b0:	6a 00                	push   $0x0
c01087b2:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01087b8:	50                   	push   %eax
c01087b9:	e8 f1 39 00 00       	call   c010c1af <Memset>
c01087be:	83 c4 10             	add    $0x10,%esp
c01087c1:	8b 45 10             	mov    0x10(%ebp),%eax
c01087c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01087c7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01087ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01087d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01087d4:	e9 53 01 00 00       	jmp    c010892c <vsprintf+0x196>
c01087d9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01087dc:	0f b6 00             	movzbl (%eax),%eax
c01087df:	3c 25                	cmp    $0x25,%al
c01087e1:	74 16                	je     c01087f9 <vsprintf+0x63>
c01087e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01087e6:	8d 50 01             	lea    0x1(%eax),%edx
c01087e9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01087ec:	8b 55 0c             	mov    0xc(%ebp),%edx
c01087ef:	0f b6 12             	movzbl (%edx),%edx
c01087f2:	88 10                	mov    %dl,(%eax)
c01087f4:	e9 2f 01 00 00       	jmp    c0108928 <vsprintf+0x192>
c01087f9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01087fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108800:	0f b6 00             	movzbl (%eax),%eax
c0108803:	0f be c0             	movsbl %al,%eax
c0108806:	83 f8 64             	cmp    $0x64,%eax
c0108809:	74 26                	je     c0108831 <vsprintf+0x9b>
c010880b:	83 f8 64             	cmp    $0x64,%eax
c010880e:	7f 0e                	jg     c010881e <vsprintf+0x88>
c0108810:	83 f8 63             	cmp    $0x63,%eax
c0108813:	0f 84 f2 00 00 00    	je     c010890b <vsprintf+0x175>
c0108819:	e9 0a 01 00 00       	jmp    c0108928 <vsprintf+0x192>
c010881e:	83 f8 73             	cmp    $0x73,%eax
c0108821:	0f 84 b0 00 00 00    	je     c01088d7 <vsprintf+0x141>
c0108827:	83 f8 78             	cmp    $0x78,%eax
c010882a:	74 5d                	je     c0108889 <vsprintf+0xf3>
c010882c:	e9 f7 00 00 00       	jmp    c0108928 <vsprintf+0x192>
c0108831:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108834:	8b 00                	mov    (%eax),%eax
c0108836:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108839:	83 ec 04             	sub    $0x4,%esp
c010883c:	6a 0a                	push   $0xa
c010883e:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0108844:	50                   	push   %eax
c0108845:	ff 75 e8             	pushl  -0x18(%ebp)
c0108848:	e8 96 10 00 00       	call   c01098e3 <itoa>
c010884d:	83 c4 10             	add    $0x10,%esp
c0108850:	83 ec 08             	sub    $0x8,%esp
c0108853:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108859:	50                   	push   %eax
c010885a:	ff 75 f4             	pushl  -0xc(%ebp)
c010885d:	e8 6c 39 00 00       	call   c010c1ce <Strcpy>
c0108862:	83 c4 10             	add    $0x10,%esp
c0108865:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108869:	83 ec 0c             	sub    $0xc,%esp
c010886c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108872:	50                   	push   %eax
c0108873:	e8 70 39 00 00       	call   c010c1e8 <Strlen>
c0108878:	83 c4 10             	add    $0x10,%esp
c010887b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010887e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108881:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108884:	e9 9f 00 00 00       	jmp    c0108928 <vsprintf+0x192>
c0108889:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010888c:	8b 00                	mov    (%eax),%eax
c010888e:	83 ec 08             	sub    $0x8,%esp
c0108891:	50                   	push   %eax
c0108892:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108898:	50                   	push   %eax
c0108899:	e8 26 e9 ff ff       	call   c01071c4 <atoi>
c010889e:	83 c4 10             	add    $0x10,%esp
c01088a1:	83 ec 08             	sub    $0x8,%esp
c01088a4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01088aa:	50                   	push   %eax
c01088ab:	ff 75 f4             	pushl  -0xc(%ebp)
c01088ae:	e8 1b 39 00 00       	call   c010c1ce <Strcpy>
c01088b3:	83 c4 10             	add    $0x10,%esp
c01088b6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01088ba:	83 ec 0c             	sub    $0xc,%esp
c01088bd:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01088c3:	50                   	push   %eax
c01088c4:	e8 1f 39 00 00       	call   c010c1e8 <Strlen>
c01088c9:	83 c4 10             	add    $0x10,%esp
c01088cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01088cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01088d2:	01 45 f4             	add    %eax,-0xc(%ebp)
c01088d5:	eb 51                	jmp    c0108928 <vsprintf+0x192>
c01088d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01088da:	8b 00                	mov    (%eax),%eax
c01088dc:	83 ec 08             	sub    $0x8,%esp
c01088df:	50                   	push   %eax
c01088e0:	ff 75 f4             	pushl  -0xc(%ebp)
c01088e3:	e8 e6 38 00 00       	call   c010c1ce <Strcpy>
c01088e8:	83 c4 10             	add    $0x10,%esp
c01088eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01088ee:	8b 00                	mov    (%eax),%eax
c01088f0:	83 ec 0c             	sub    $0xc,%esp
c01088f3:	50                   	push   %eax
c01088f4:	e8 ef 38 00 00       	call   c010c1e8 <Strlen>
c01088f9:	83 c4 10             	add    $0x10,%esp
c01088fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01088ff:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108903:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108906:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108909:	eb 1d                	jmp    c0108928 <vsprintf+0x192>
c010890b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010890e:	0f b6 10             	movzbl (%eax),%edx
c0108911:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108914:	88 10                	mov    %dl,(%eax)
c0108916:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010891a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0108921:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108924:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108927:	90                   	nop
c0108928:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010892c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010892f:	0f b6 00             	movzbl (%eax),%eax
c0108932:	84 c0                	test   %al,%al
c0108934:	0f 85 9f fe ff ff    	jne    c01087d9 <vsprintf+0x43>
c010893a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010893d:	2b 45 08             	sub    0x8(%ebp),%eax
c0108940:	c9                   	leave  
c0108941:	c3                   	ret    

c0108942 <printx>:
c0108942:	55                   	push   %ebp
c0108943:	89 e5                	mov    %esp,%ebp
c0108945:	81 ec 18 01 00 00    	sub    $0x118,%esp
c010894b:	8d 45 0c             	lea    0xc(%ebp),%eax
c010894e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108951:	8b 45 08             	mov    0x8(%ebp),%eax
c0108954:	83 ec 04             	sub    $0x4,%esp
c0108957:	ff 75 f4             	pushl  -0xc(%ebp)
c010895a:	50                   	push   %eax
c010895b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108961:	50                   	push   %eax
c0108962:	e8 2f fe ff ff       	call   c0108796 <vsprintf>
c0108967:	83 c4 10             	add    $0x10,%esp
c010896a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010896d:	83 ec 08             	sub    $0x8,%esp
c0108970:	ff 75 f0             	pushl  -0x10(%ebp)
c0108973:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108979:	50                   	push   %eax
c010897a:	e8 11 8e ff ff       	call   c0101790 <write_debug>
c010897f:	83 c4 10             	add    $0x10,%esp
c0108982:	90                   	nop
c0108983:	c9                   	leave  
c0108984:	c3                   	ret    

c0108985 <sys_printx>:
c0108985:	55                   	push   %ebp
c0108986:	89 e5                	mov    %esp,%ebp
c0108988:	83 ec 28             	sub    $0x28,%esp
c010898b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108990:	85 c0                	test   %eax,%eax
c0108992:	75 15                	jne    c01089a9 <sys_printx+0x24>
c0108994:	8b 45 10             	mov    0x10(%ebp),%eax
c0108997:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c010899d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01089a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01089a7:	eb 10                	jmp    c01089b9 <sys_printx+0x34>
c01089a9:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01089ae:	85 c0                	test   %eax,%eax
c01089b0:	74 07                	je     c01089b9 <sys_printx+0x34>
c01089b2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01089b9:	8b 55 08             	mov    0x8(%ebp),%edx
c01089bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01089bf:	01 d0                	add    %edx,%eax
c01089c1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01089c4:	8b 45 10             	mov    0x10(%ebp),%eax
c01089c7:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01089cd:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01089d3:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01089d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01089db:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01089de:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01089e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01089e4:	0f b6 00             	movzbl (%eax),%eax
c01089e7:	88 45 e3             	mov    %al,-0x1d(%ebp)
c01089ea:	eb 3a                	jmp    c0108a26 <sys_printx+0xa1>
c01089ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01089ef:	0f b6 00             	movzbl (%eax),%eax
c01089f2:	3c 3b                	cmp    $0x3b,%al
c01089f4:	74 0a                	je     c0108a00 <sys_printx+0x7b>
c01089f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01089f9:	0f b6 00             	movzbl (%eax),%eax
c01089fc:	3c 3a                	cmp    $0x3a,%al
c01089fe:	75 06                	jne    c0108a06 <sys_printx+0x81>
c0108a00:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108a04:	eb 20                	jmp    c0108a26 <sys_printx+0xa1>
c0108a06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108a09:	0f b6 00             	movzbl (%eax),%eax
c0108a0c:	0f b6 c0             	movzbl %al,%eax
c0108a0f:	83 ec 08             	sub    $0x8,%esp
c0108a12:	50                   	push   %eax
c0108a13:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108a16:	e8 45 b6 ff ff       	call   c0104060 <out_char>
c0108a1b:	83 c4 10             	add    $0x10,%esp
c0108a1e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108a22:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0108a26:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108a2a:	7f c0                	jg     c01089ec <sys_printx+0x67>
c0108a2c:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108a30:	75 10                	jne    c0108a42 <sys_printx+0xbd>
c0108a32:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108a37:	85 c0                	test   %eax,%eax
c0108a39:	74 13                	je     c0108a4e <sys_printx+0xc9>
c0108a3b:	e8 20 79 ff ff       	call   c0100360 <disable_int>
c0108a40:	eb 0c                	jmp    c0108a4e <sys_printx+0xc9>
c0108a42:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0108a46:	75 06                	jne    c0108a4e <sys_printx+0xc9>
c0108a48:	e8 13 79 ff ff       	call   c0100360 <disable_int>
c0108a4d:	90                   	nop
c0108a4e:	90                   	nop
c0108a4f:	c9                   	leave  
c0108a50:	c3                   	ret    

c0108a51 <spin>:
c0108a51:	55                   	push   %ebp
c0108a52:	89 e5                	mov    %esp,%ebp
c0108a54:	83 ec 08             	sub    $0x8,%esp
c0108a57:	83 ec 0c             	sub    $0xc,%esp
c0108a5a:	ff 75 08             	pushl  0x8(%ebp)
c0108a5d:	e8 77 76 ff ff       	call   c01000d9 <disp_str>
c0108a62:	83 c4 10             	add    $0x10,%esp
c0108a65:	83 ec 0c             	sub    $0xc,%esp
c0108a68:	68 f3 b6 10 c0       	push   $0xc010b6f3
c0108a6d:	e8 67 76 ff ff       	call   c01000d9 <disp_str>
c0108a72:	83 c4 10             	add    $0x10,%esp
c0108a75:	eb fe                	jmp    c0108a75 <spin+0x24>

c0108a77 <panic>:
c0108a77:	55                   	push   %ebp
c0108a78:	89 e5                	mov    %esp,%ebp
c0108a7a:	83 ec 08             	sub    $0x8,%esp
c0108a7d:	83 ec 04             	sub    $0x4,%esp
c0108a80:	ff 75 08             	pushl  0x8(%ebp)
c0108a83:	6a 3a                	push   $0x3a
c0108a85:	68 50 bd 10 c0       	push   $0xc010bd50
c0108a8a:	e8 b3 fe ff ff       	call   c0108942 <printx>
c0108a8f:	83 c4 10             	add    $0x10,%esp
c0108a92:	90                   	nop
c0108a93:	c9                   	leave  
c0108a94:	c3                   	ret    

c0108a95 <assertion_failure>:
c0108a95:	55                   	push   %ebp
c0108a96:	89 e5                	mov    %esp,%ebp
c0108a98:	83 ec 08             	sub    $0x8,%esp
c0108a9b:	83 ec 08             	sub    $0x8,%esp
c0108a9e:	ff 75 14             	pushl  0x14(%ebp)
c0108aa1:	ff 75 10             	pushl  0x10(%ebp)
c0108aa4:	ff 75 0c             	pushl  0xc(%ebp)
c0108aa7:	ff 75 08             	pushl  0x8(%ebp)
c0108aaa:	6a 3b                	push   $0x3b
c0108aac:	68 58 bd 10 c0       	push   $0xc010bd58
c0108ab1:	e8 8c fe ff ff       	call   c0108942 <printx>
c0108ab6:	83 c4 20             	add    $0x20,%esp
c0108ab9:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108ac0:	00 00 00 
c0108ac3:	83 ec 0c             	sub    $0xc,%esp
c0108ac6:	68 e0 b5 10 c0       	push   $0xc010b5e0
c0108acb:	e8 09 76 ff ff       	call   c01000d9 <disp_str>
c0108ad0:	83 c4 10             	add    $0x10,%esp
c0108ad3:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108ad8:	83 ec 0c             	sub    $0xc,%esp
c0108adb:	50                   	push   %eax
c0108adc:	e8 89 e7 ff ff       	call   c010726a <disp_int>
c0108ae1:	83 c4 10             	add    $0x10,%esp
c0108ae4:	83 ec 0c             	sub    $0xc,%esp
c0108ae7:	68 e2 b5 10 c0       	push   $0xc010b5e2
c0108aec:	e8 e8 75 ff ff       	call   c01000d9 <disp_str>
c0108af1:	83 c4 10             	add    $0x10,%esp
c0108af4:	83 ec 0c             	sub    $0xc,%esp
c0108af7:	68 8b bd 10 c0       	push   $0xc010bd8b
c0108afc:	e8 50 ff ff ff       	call   c0108a51 <spin>
c0108b01:	83 c4 10             	add    $0x10,%esp
c0108b04:	90                   	nop
c0108b05:	c9                   	leave  
c0108b06:	c3                   	ret    

c0108b07 <assertion_failure2>:
c0108b07:	55                   	push   %ebp
c0108b08:	89 e5                	mov    %esp,%ebp
c0108b0a:	83 ec 08             	sub    $0x8,%esp
c0108b0d:	83 ec 04             	sub    $0x4,%esp
c0108b10:	ff 75 18             	pushl  0x18(%ebp)
c0108b13:	ff 75 14             	pushl  0x14(%ebp)
c0108b16:	ff 75 10             	pushl  0x10(%ebp)
c0108b19:	ff 75 0c             	pushl  0xc(%ebp)
c0108b1c:	ff 75 08             	pushl  0x8(%ebp)
c0108b1f:	6a 3b                	push   $0x3b
c0108b21:	68 98 bd 10 c0       	push   $0xc010bd98
c0108b26:	e8 17 fe ff ff       	call   c0108942 <printx>
c0108b2b:	83 c4 20             	add    $0x20,%esp
c0108b2e:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108b35:	00 00 00 
c0108b38:	83 ec 0c             	sub    $0xc,%esp
c0108b3b:	68 e0 b5 10 c0       	push   $0xc010b5e0
c0108b40:	e8 94 75 ff ff       	call   c01000d9 <disp_str>
c0108b45:	83 c4 10             	add    $0x10,%esp
c0108b48:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108b4d:	83 ec 0c             	sub    $0xc,%esp
c0108b50:	50                   	push   %eax
c0108b51:	e8 14 e7 ff ff       	call   c010726a <disp_int>
c0108b56:	83 c4 10             	add    $0x10,%esp
c0108b59:	83 ec 0c             	sub    $0xc,%esp
c0108b5c:	68 e2 b5 10 c0       	push   $0xc010b5e2
c0108b61:	e8 73 75 ff ff       	call   c01000d9 <disp_str>
c0108b66:	83 c4 10             	add    $0x10,%esp
c0108b69:	83 ec 0c             	sub    $0xc,%esp
c0108b6c:	68 8b bd 10 c0       	push   $0xc010bd8b
c0108b71:	e8 db fe ff ff       	call   c0108a51 <spin>
c0108b76:	83 c4 10             	add    $0x10,%esp
c0108b79:	90                   	nop
c0108b7a:	c9                   	leave  
c0108b7b:	c3                   	ret    

c0108b7c <dead_lock>:
c0108b7c:	55                   	push   %ebp
c0108b7d:	89 e5                	mov    %esp,%ebp
c0108b7f:	b8 00 00 00 00       	mov    $0x0,%eax
c0108b84:	5d                   	pop    %ebp
c0108b85:	c3                   	ret    

c0108b86 <sys_send_msg>:
c0108b86:	55                   	push   %ebp
c0108b87:	89 e5                	mov    %esp,%ebp
c0108b89:	83 ec 58             	sub    $0x58,%esp
c0108b8c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108b93:	83 ec 0c             	sub    $0xc,%esp
c0108b96:	ff 75 0c             	pushl  0xc(%ebp)
c0108b99:	e8 28 ae ff ff       	call   c01039c6 <pid2proc>
c0108b9e:	83 c4 10             	add    $0x10,%esp
c0108ba1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108ba4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108ba8:	74 2c                	je     c0108bd6 <sys_send_msg+0x50>
c0108baa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108bad:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108bb3:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108bb8:	74 1c                	je     c0108bd6 <sys_send_msg+0x50>
c0108bba:	68 5c 05 00 00       	push   $0x55c
c0108bbf:	68 41 ba 10 c0       	push   $0xc010ba41
c0108bc4:	68 41 ba 10 c0       	push   $0xc010ba41
c0108bc9:	68 d8 bd 10 c0       	push   $0xc010bdd8
c0108bce:	e8 c2 fe ff ff       	call   c0108a95 <assertion_failure>
c0108bd3:	83 c4 10             	add    $0x10,%esp
c0108bd6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bd9:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108bdf:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108be4:	74 1c                	je     c0108c02 <sys_send_msg+0x7c>
c0108be6:	68 5e 05 00 00       	push   $0x55e
c0108beb:	68 41 ba 10 c0       	push   $0xc010ba41
c0108bf0:	68 41 ba 10 c0       	push   $0xc010ba41
c0108bf5:	68 00 be 10 c0       	push   $0xc010be00
c0108bfa:	e8 96 fe ff ff       	call   c0108a95 <assertion_failure>
c0108bff:	83 c4 10             	add    $0x10,%esp
c0108c02:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108c06:	75 22                	jne    c0108c2a <sys_send_msg+0xa4>
c0108c08:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108c0c:	75 1c                	jne    c0108c2a <sys_send_msg+0xa4>
c0108c0e:	68 61 05 00 00       	push   $0x561
c0108c13:	68 41 ba 10 c0       	push   $0xc010ba41
c0108c18:	68 41 ba 10 c0       	push   $0xc010ba41
c0108c1d:	68 23 be 10 c0       	push   $0xc010be23
c0108c22:	e8 6e fe ff ff       	call   c0108a95 <assertion_failure>
c0108c27:	83 c4 10             	add    $0x10,%esp
c0108c2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c2d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c34:	84 c0                	test   %al,%al
c0108c36:	74 65                	je     c0108c9d <sys_send_msg+0x117>
c0108c38:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c3b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c42:	3c 01                	cmp    $0x1,%al
c0108c44:	74 57                	je     c0108c9d <sys_send_msg+0x117>
c0108c46:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c49:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c50:	3c 02                	cmp    $0x2,%al
c0108c52:	74 49                	je     c0108c9d <sys_send_msg+0x117>
c0108c54:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c57:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c5e:	3c 03                	cmp    $0x3,%al
c0108c60:	74 3b                	je     c0108c9d <sys_send_msg+0x117>
c0108c62:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c65:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c6c:	3c 04                	cmp    $0x4,%al
c0108c6e:	74 2d                	je     c0108c9d <sys_send_msg+0x117>
c0108c70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c73:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c7a:	0f be c0             	movsbl %al,%eax
c0108c7d:	83 ec 0c             	sub    $0xc,%esp
c0108c80:	68 65 05 00 00       	push   $0x565
c0108c85:	68 41 ba 10 c0       	push   $0xc010ba41
c0108c8a:	68 41 ba 10 c0       	push   $0xc010ba41
c0108c8f:	50                   	push   %eax
c0108c90:	68 34 be 10 c0       	push   $0xc010be34
c0108c95:	e8 6d fe ff ff       	call   c0108b07 <assertion_failure2>
c0108c9a:	83 c4 20             	add    $0x20,%esp
c0108c9d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ca0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ca7:	84 c0                	test   %al,%al
c0108ca9:	74 65                	je     c0108d10 <sys_send_msg+0x18a>
c0108cab:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cae:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cb5:	3c 01                	cmp    $0x1,%al
c0108cb7:	74 57                	je     c0108d10 <sys_send_msg+0x18a>
c0108cb9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cbc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cc3:	3c 02                	cmp    $0x2,%al
c0108cc5:	74 49                	je     c0108d10 <sys_send_msg+0x18a>
c0108cc7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cca:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cd1:	3c 03                	cmp    $0x3,%al
c0108cd3:	74 3b                	je     c0108d10 <sys_send_msg+0x18a>
c0108cd5:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cd8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cdf:	3c 04                	cmp    $0x4,%al
c0108ce1:	74 2d                	je     c0108d10 <sys_send_msg+0x18a>
c0108ce3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ce6:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ced:	0f be c0             	movsbl %al,%eax
c0108cf0:	83 ec 0c             	sub    $0xc,%esp
c0108cf3:	68 68 05 00 00       	push   $0x568
c0108cf8:	68 41 ba 10 c0       	push   $0xc010ba41
c0108cfd:	68 41 ba 10 c0       	push   $0xc010ba41
c0108d02:	50                   	push   %eax
c0108d03:	68 d0 be 10 c0       	push   $0xc010bed0
c0108d08:	e8 fa fd ff ff       	call   c0108b07 <assertion_failure2>
c0108d0d:	83 c4 20             	add    $0x20,%esp
c0108d10:	83 ec 0c             	sub    $0xc,%esp
c0108d13:	ff 75 10             	pushl  0x10(%ebp)
c0108d16:	e8 31 ad ff ff       	call   c0103a4c <proc2pid>
c0108d1b:	83 c4 10             	add    $0x10,%esp
c0108d1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108d21:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108d28:	8b 45 08             	mov    0x8(%ebp),%eax
c0108d2b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108d2e:	83 ec 08             	sub    $0x8,%esp
c0108d31:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108d34:	ff 75 dc             	pushl  -0x24(%ebp)
c0108d37:	e8 a6 d3 ff ff       	call   c01060e2 <get_physical_address_proc>
c0108d3c:	83 c4 10             	add    $0x10,%esp
c0108d3f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108d42:	83 ec 08             	sub    $0x8,%esp
c0108d45:	ff 75 e0             	pushl  -0x20(%ebp)
c0108d48:	ff 75 d8             	pushl  -0x28(%ebp)
c0108d4b:	e8 bf d2 ff ff       	call   c010600f <alloc_virtual_memory>
c0108d50:	83 c4 10             	add    $0x10,%esp
c0108d53:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108d56:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d59:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108d5f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108d62:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108d69:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108d6c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108d6f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108d72:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108d75:	89 10                	mov    %edx,(%eax)
c0108d77:	83 ec 08             	sub    $0x8,%esp
c0108d7a:	ff 75 0c             	pushl  0xc(%ebp)
c0108d7d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108d80:	e8 f7 fd ff ff       	call   c0108b7c <dead_lock>
c0108d85:	83 c4 10             	add    $0x10,%esp
c0108d88:	83 f8 01             	cmp    $0x1,%eax
c0108d8b:	75 10                	jne    c0108d9d <sys_send_msg+0x217>
c0108d8d:	83 ec 0c             	sub    $0xc,%esp
c0108d90:	68 60 bf 10 c0       	push   $0xc010bf60
c0108d95:	e8 dd fc ff ff       	call   c0108a77 <panic>
c0108d9a:	83 c4 10             	add    $0x10,%esp
c0108d9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108da0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108da7:	3c 02                	cmp    $0x2,%al
c0108da9:	0f 85 ca 01 00 00    	jne    c0108f79 <sys_send_msg+0x3f3>
c0108daf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108db2:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108db8:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108dbb:	74 12                	je     c0108dcf <sys_send_msg+0x249>
c0108dbd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108dc0:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108dc6:	83 f8 12             	cmp    $0x12,%eax
c0108dc9:	0f 85 aa 01 00 00    	jne    c0108f79 <sys_send_msg+0x3f3>
c0108dcf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108dd2:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108dd8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108ddb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108dde:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108de4:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108de7:	83 ec 08             	sub    $0x8,%esp
c0108dea:	ff 75 0c             	pushl  0xc(%ebp)
c0108ded:	ff 75 c0             	pushl  -0x40(%ebp)
c0108df0:	e8 ed d2 ff ff       	call   c01060e2 <get_physical_address_proc>
c0108df5:	83 c4 10             	add    $0x10,%esp
c0108df8:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108dfb:	83 ec 08             	sub    $0x8,%esp
c0108dfe:	ff 75 e0             	pushl  -0x20(%ebp)
c0108e01:	ff 75 bc             	pushl  -0x44(%ebp)
c0108e04:	e8 06 d2 ff ff       	call   c010600f <alloc_virtual_memory>
c0108e09:	83 c4 10             	add    $0x10,%esp
c0108e0c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108e0f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108e12:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108e15:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108e18:	83 ec 04             	sub    $0x4,%esp
c0108e1b:	51                   	push   %ecx
c0108e1c:	52                   	push   %edx
c0108e1d:	50                   	push   %eax
c0108e1e:	e8 59 e0 ff ff       	call   c0106e7c <Memcpy>
c0108e23:	83 c4 10             	add    $0x10,%esp
c0108e26:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108e2b:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108e30:	75 0a                	jne    c0108e3c <sys_send_msg+0x2b6>
c0108e32:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108e39:	00 00 00 
c0108e3c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e3f:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108e46:	00 00 00 
c0108e49:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e4c:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108e53:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e56:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108e5d:	00 00 00 
c0108e60:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e63:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108e6a:	00 00 00 
c0108e6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e70:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108e77:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e7a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108e81:	00 00 00 
c0108e84:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e87:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108e8e:	00 00 00 
c0108e91:	83 ec 0c             	sub    $0xc,%esp
c0108e94:	ff 75 e8             	pushl  -0x18(%ebp)
c0108e97:	e8 a0 09 00 00       	call   c010983c <unblock>
c0108e9c:	83 c4 10             	add    $0x10,%esp
c0108e9f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ea2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ea9:	84 c0                	test   %al,%al
c0108eab:	74 1c                	je     c0108ec9 <sys_send_msg+0x343>
c0108ead:	68 a0 05 00 00       	push   $0x5a0
c0108eb2:	68 41 ba 10 c0       	push   $0xc010ba41
c0108eb7:	68 41 ba 10 c0       	push   $0xc010ba41
c0108ebc:	68 6b bf 10 c0       	push   $0xc010bf6b
c0108ec1:	e8 cf fb ff ff       	call   c0108a95 <assertion_failure>
c0108ec6:	83 c4 10             	add    $0x10,%esp
c0108ec9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ecc:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108ed2:	83 f8 21             	cmp    $0x21,%eax
c0108ed5:	74 1c                	je     c0108ef3 <sys_send_msg+0x36d>
c0108ed7:	68 a1 05 00 00       	push   $0x5a1
c0108edc:	68 41 ba 10 c0       	push   $0xc010ba41
c0108ee1:	68 41 ba 10 c0       	push   $0xc010ba41
c0108ee6:	68 7f bf 10 c0       	push   $0xc010bf7f
c0108eeb:	e8 a5 fb ff ff       	call   c0108a95 <assertion_failure>
c0108ef0:	83 c4 10             	add    $0x10,%esp
c0108ef3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ef6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108efc:	85 c0                	test   %eax,%eax
c0108efe:	74 1c                	je     c0108f1c <sys_send_msg+0x396>
c0108f00:	68 a3 05 00 00       	push   $0x5a3
c0108f05:	68 41 ba 10 c0       	push   $0xc010ba41
c0108f0a:	68 41 ba 10 c0       	push   $0xc010ba41
c0108f0f:	68 9c bf 10 c0       	push   $0xc010bf9c
c0108f14:	e8 7c fb ff ff       	call   c0108a95 <assertion_failure>
c0108f19:	83 c4 10             	add    $0x10,%esp
c0108f1c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f1f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f26:	84 c0                	test   %al,%al
c0108f28:	74 1c                	je     c0108f46 <sys_send_msg+0x3c0>
c0108f2a:	68 a4 05 00 00       	push   $0x5a4
c0108f2f:	68 41 ba 10 c0       	push   $0xc010ba41
c0108f34:	68 41 ba 10 c0       	push   $0xc010ba41
c0108f39:	68 b1 bf 10 c0       	push   $0xc010bfb1
c0108f3e:	e8 52 fb ff ff       	call   c0108a95 <assertion_failure>
c0108f43:	83 c4 10             	add    $0x10,%esp
c0108f46:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f49:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108f4f:	83 f8 21             	cmp    $0x21,%eax
c0108f52:	0f 84 45 01 00 00    	je     c010909d <sys_send_msg+0x517>
c0108f58:	68 a5 05 00 00       	push   $0x5a5
c0108f5d:	68 41 ba 10 c0       	push   $0xc010ba41
c0108f62:	68 41 ba 10 c0       	push   $0xc010ba41
c0108f67:	68 c8 bf 10 c0       	push   $0xc010bfc8
c0108f6c:	e8 24 fb ff ff       	call   c0108a95 <assertion_failure>
c0108f71:	83 c4 10             	add    $0x10,%esp
c0108f74:	e9 24 01 00 00       	jmp    c010909d <sys_send_msg+0x517>
c0108f79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108f80:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f83:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108f86:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f89:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108f8f:	85 c0                	test   %eax,%eax
c0108f91:	75 1b                	jne    c0108fae <sys_send_msg+0x428>
c0108f93:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f96:	8b 55 10             	mov    0x10(%ebp),%edx
c0108f99:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108f9f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fa2:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108fa9:	00 00 00 
c0108fac:	eb 3f                	jmp    c0108fed <sys_send_msg+0x467>
c0108fae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108fb1:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108fb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108fba:	eb 12                	jmp    c0108fce <sys_send_msg+0x448>
c0108fbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108fbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108fc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108fc5:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108fcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108fce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108fd2:	75 e8                	jne    c0108fbc <sys_send_msg+0x436>
c0108fd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108fd7:	8b 55 10             	mov    0x10(%ebp),%edx
c0108fda:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108fe0:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fe3:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108fea:	00 00 00 
c0108fed:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ff0:	8b 55 08             	mov    0x8(%ebp),%edx
c0108ff3:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108ff9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ffc:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108fff:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0109005:	8b 45 10             	mov    0x10(%ebp),%eax
c0109008:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c010900f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109012:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109019:	3c 01                	cmp    $0x1,%al
c010901b:	74 1c                	je     c0109039 <sys_send_msg+0x4b3>
c010901d:	68 c7 05 00 00       	push   $0x5c7
c0109022:	68 41 ba 10 c0       	push   $0xc010ba41
c0109027:	68 41 ba 10 c0       	push   $0xc010ba41
c010902c:	68 ec bf 10 c0       	push   $0xc010bfec
c0109031:	e8 5f fa ff ff       	call   c0108a95 <assertion_failure>
c0109036:	83 c4 10             	add    $0x10,%esp
c0109039:	8b 45 10             	mov    0x10(%ebp),%eax
c010903c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109042:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0109045:	74 1c                	je     c0109063 <sys_send_msg+0x4dd>
c0109047:	68 c8 05 00 00       	push   $0x5c8
c010904c:	68 41 ba 10 c0       	push   $0xc010ba41
c0109051:	68 41 ba 10 c0       	push   $0xc010ba41
c0109056:	68 08 c0 10 c0       	push   $0xc010c008
c010905b:	e8 35 fa ff ff       	call   c0108a95 <assertion_failure>
c0109060:	83 c4 10             	add    $0x10,%esp
c0109063:	8b 45 10             	mov    0x10(%ebp),%eax
c0109066:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010906c:	39 45 08             	cmp    %eax,0x8(%ebp)
c010906f:	74 1c                	je     c010908d <sys_send_msg+0x507>
c0109071:	68 c9 05 00 00       	push   $0x5c9
c0109076:	68 41 ba 10 c0       	push   $0xc010ba41
c010907b:	68 41 ba 10 c0       	push   $0xc010ba41
c0109080:	68 2a c0 10 c0       	push   $0xc010c02a
c0109085:	e8 0b fa ff ff       	call   c0108a95 <assertion_failure>
c010908a:	83 c4 10             	add    $0x10,%esp
c010908d:	83 ec 0c             	sub    $0xc,%esp
c0109090:	ff 75 10             	pushl  0x10(%ebp)
c0109093:	e8 68 07 00 00       	call   c0109800 <block>
c0109098:	83 c4 10             	add    $0x10,%esp
c010909b:	eb 01                	jmp    c010909e <sys_send_msg+0x518>
c010909d:	90                   	nop
c010909e:	b8 00 00 00 00       	mov    $0x0,%eax
c01090a3:	c9                   	leave  
c01090a4:	c3                   	ret    

c01090a5 <sys_receive_msg>:
c01090a5:	55                   	push   %ebp
c01090a6:	89 e5                	mov    %esp,%ebp
c01090a8:	83 ec 58             	sub    $0x58,%esp
c01090ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01090b2:	83 ec 0c             	sub    $0xc,%esp
c01090b5:	ff 75 0c             	pushl  0xc(%ebp)
c01090b8:	e8 09 a9 ff ff       	call   c01039c6 <pid2proc>
c01090bd:	83 c4 10             	add    $0x10,%esp
c01090c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01090c3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01090c7:	74 2c                	je     c01090f5 <sys_receive_msg+0x50>
c01090c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090cc:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01090d2:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01090d7:	74 1c                	je     c01090f5 <sys_receive_msg+0x50>
c01090d9:	68 dd 05 00 00       	push   $0x5dd
c01090de:	68 41 ba 10 c0       	push   $0xc010ba41
c01090e3:	68 41 ba 10 c0       	push   $0xc010ba41
c01090e8:	68 00 be 10 c0       	push   $0xc010be00
c01090ed:	e8 a3 f9 ff ff       	call   c0108a95 <assertion_failure>
c01090f2:	83 c4 10             	add    $0x10,%esp
c01090f5:	8b 45 10             	mov    0x10(%ebp),%eax
c01090f8:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01090fe:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0109103:	74 1c                	je     c0109121 <sys_receive_msg+0x7c>
c0109105:	68 df 05 00 00       	push   $0x5df
c010910a:	68 41 ba 10 c0       	push   $0xc010ba41
c010910f:	68 41 ba 10 c0       	push   $0xc010ba41
c0109114:	68 d8 bd 10 c0       	push   $0xc010bdd8
c0109119:	e8 77 f9 ff ff       	call   c0108a95 <assertion_failure>
c010911e:	83 c4 10             	add    $0x10,%esp
c0109121:	8b 45 10             	mov    0x10(%ebp),%eax
c0109124:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010912b:	84 c0                	test   %al,%al
c010912d:	74 65                	je     c0109194 <sys_receive_msg+0xef>
c010912f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109132:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109139:	3c 01                	cmp    $0x1,%al
c010913b:	74 57                	je     c0109194 <sys_receive_msg+0xef>
c010913d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109140:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109147:	3c 02                	cmp    $0x2,%al
c0109149:	74 49                	je     c0109194 <sys_receive_msg+0xef>
c010914b:	8b 45 10             	mov    0x10(%ebp),%eax
c010914e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109155:	3c 03                	cmp    $0x3,%al
c0109157:	74 3b                	je     c0109194 <sys_receive_msg+0xef>
c0109159:	8b 45 10             	mov    0x10(%ebp),%eax
c010915c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109163:	3c 04                	cmp    $0x4,%al
c0109165:	74 2d                	je     c0109194 <sys_receive_msg+0xef>
c0109167:	8b 45 10             	mov    0x10(%ebp),%eax
c010916a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109171:	0f be c0             	movsbl %al,%eax
c0109174:	83 ec 0c             	sub    $0xc,%esp
c0109177:	68 e2 05 00 00       	push   $0x5e2
c010917c:	68 41 ba 10 c0       	push   $0xc010ba41
c0109181:	68 41 ba 10 c0       	push   $0xc010ba41
c0109186:	50                   	push   %eax
c0109187:	68 34 be 10 c0       	push   $0xc010be34
c010918c:	e8 76 f9 ff ff       	call   c0108b07 <assertion_failure2>
c0109191:	83 c4 20             	add    $0x20,%esp
c0109194:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109198:	74 73                	je     c010920d <sys_receive_msg+0x168>
c010919a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010919d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091a4:	84 c0                	test   %al,%al
c01091a6:	74 65                	je     c010920d <sys_receive_msg+0x168>
c01091a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091ab:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091b2:	3c 01                	cmp    $0x1,%al
c01091b4:	74 57                	je     c010920d <sys_receive_msg+0x168>
c01091b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091b9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091c0:	3c 02                	cmp    $0x2,%al
c01091c2:	74 49                	je     c010920d <sys_receive_msg+0x168>
c01091c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091c7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091ce:	3c 03                	cmp    $0x3,%al
c01091d0:	74 3b                	je     c010920d <sys_receive_msg+0x168>
c01091d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091d5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091dc:	3c 04                	cmp    $0x4,%al
c01091de:	74 2d                	je     c010920d <sys_receive_msg+0x168>
c01091e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091e3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091ea:	0f be c0             	movsbl %al,%eax
c01091ed:	83 ec 0c             	sub    $0xc,%esp
c01091f0:	68 e6 05 00 00       	push   $0x5e6
c01091f5:	68 41 ba 10 c0       	push   $0xc010ba41
c01091fa:	68 41 ba 10 c0       	push   $0xc010ba41
c01091ff:	50                   	push   %eax
c0109200:	68 d0 be 10 c0       	push   $0xc010bed0
c0109205:	e8 fd f8 ff ff       	call   c0108b07 <assertion_failure2>
c010920a:	83 c4 20             	add    $0x20,%esp
c010920d:	83 ec 0c             	sub    $0xc,%esp
c0109210:	ff 75 10             	pushl  0x10(%ebp)
c0109213:	e8 34 a8 ff ff       	call   c0103a4c <proc2pid>
c0109218:	83 c4 10             	add    $0x10,%esp
c010921b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010921e:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0109225:	8b 45 08             	mov    0x8(%ebp),%eax
c0109228:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010922b:	8b 45 10             	mov    0x10(%ebp),%eax
c010922e:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109234:	83 ec 08             	sub    $0x8,%esp
c0109237:	50                   	push   %eax
c0109238:	ff 75 d8             	pushl  -0x28(%ebp)
c010923b:	e8 a2 ce ff ff       	call   c01060e2 <get_physical_address_proc>
c0109240:	83 c4 10             	add    $0x10,%esp
c0109243:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109246:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010924d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109250:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109256:	85 c0                	test   %eax,%eax
c0109258:	0f 84 c5 00 00 00    	je     c0109323 <sys_receive_msg+0x27e>
c010925e:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109262:	74 0d                	je     c0109271 <sys_receive_msg+0x1cc>
c0109264:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010926b:	0f 85 b2 00 00 00    	jne    c0109323 <sys_receive_msg+0x27e>
c0109271:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0109278:	83 ec 0c             	sub    $0xc,%esp
c010927b:	ff 75 d0             	pushl  -0x30(%ebp)
c010927e:	e8 49 85 ff ff       	call   c01017cc <sys_malloc>
c0109283:	83 c4 10             	add    $0x10,%esp
c0109286:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109289:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010928c:	83 ec 04             	sub    $0x4,%esp
c010928f:	50                   	push   %eax
c0109290:	6a 00                	push   $0x0
c0109292:	ff 75 cc             	pushl  -0x34(%ebp)
c0109295:	e8 15 2f 00 00       	call   c010c1af <Memset>
c010929a:	83 c4 10             	add    $0x10,%esp
c010929d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01092a0:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c01092a6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01092a9:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c01092b0:	83 ec 08             	sub    $0x8,%esp
c01092b3:	ff 75 d0             	pushl  -0x30(%ebp)
c01092b6:	ff 75 d4             	pushl  -0x2c(%ebp)
c01092b9:	e8 51 cd ff ff       	call   c010600f <alloc_virtual_memory>
c01092be:	83 c4 10             	add    $0x10,%esp
c01092c1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01092c4:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01092c7:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01092ca:	83 ec 04             	sub    $0x4,%esp
c01092cd:	52                   	push   %edx
c01092ce:	ff 75 cc             	pushl  -0x34(%ebp)
c01092d1:	50                   	push   %eax
c01092d2:	e8 a5 db ff ff       	call   c0106e7c <Memcpy>
c01092d7:	83 c4 10             	add    $0x10,%esp
c01092da:	8b 45 10             	mov    0x10(%ebp),%eax
c01092dd:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c01092e4:	00 00 00 
c01092e7:	8b 45 10             	mov    0x10(%ebp),%eax
c01092ea:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01092f1:	00 00 00 
c01092f4:	8b 45 10             	mov    0x10(%ebp),%eax
c01092f7:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01092fe:	00 00 00 
c0109301:	8b 45 10             	mov    0x10(%ebp),%eax
c0109304:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010930b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0109312:	83 ec 08             	sub    $0x8,%esp
c0109315:	ff 75 d0             	pushl  -0x30(%ebp)
c0109318:	ff 75 cc             	pushl  -0x34(%ebp)
c010931b:	e8 c1 84 ff ff       	call   c01017e1 <sys_free>
c0109320:	83 c4 10             	add    $0x10,%esp
c0109323:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0109327:	0f 84 d4 03 00 00    	je     c0109701 <sys_receive_msg+0x65c>
c010932d:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109331:	75 26                	jne    c0109359 <sys_receive_msg+0x2b4>
c0109333:	8b 45 10             	mov    0x10(%ebp),%eax
c0109336:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010933c:	85 c0                	test   %eax,%eax
c010933e:	0f 84 8a 00 00 00    	je     c01093ce <sys_receive_msg+0x329>
c0109344:	8b 45 10             	mov    0x10(%ebp),%eax
c0109347:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010934d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109350:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0109357:	eb 75                	jmp    c01093ce <sys_receive_msg+0x329>
c0109359:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010935d:	78 6f                	js     c01093ce <sys_receive_msg+0x329>
c010935f:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109363:	7f 69                	jg     c01093ce <sys_receive_msg+0x329>
c0109365:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109368:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010936f:	3c 01                	cmp    $0x1,%al
c0109371:	75 5b                	jne    c01093ce <sys_receive_msg+0x329>
c0109373:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109376:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010937c:	83 f8 12             	cmp    $0x12,%eax
c010937f:	74 0e                	je     c010938f <sys_receive_msg+0x2ea>
c0109381:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109384:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010938a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c010938d:	75 3f                	jne    c01093ce <sys_receive_msg+0x329>
c010938f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109392:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109398:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010939b:	eb 2b                	jmp    c01093c8 <sys_receive_msg+0x323>
c010939d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01093a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093a6:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01093ac:	8b 45 0c             	mov    0xc(%ebp),%eax
c01093af:	39 c2                	cmp    %eax,%edx
c01093b1:	75 09                	jne    c01093bc <sys_receive_msg+0x317>
c01093b3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01093ba:	eb 12                	jmp    c01093ce <sys_receive_msg+0x329>
c01093bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093bf:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c01093c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01093c8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01093cc:	75 cf                	jne    c010939d <sys_receive_msg+0x2f8>
c01093ce:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c01093d2:	0f 85 4e 02 00 00    	jne    c0109626 <sys_receive_msg+0x581>
c01093d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093db:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01093de:	83 ec 08             	sub    $0x8,%esp
c01093e1:	ff 75 dc             	pushl  -0x24(%ebp)
c01093e4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01093e7:	e8 23 cc ff ff       	call   c010600f <alloc_virtual_memory>
c01093ec:	83 c4 10             	add    $0x10,%esp
c01093ef:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01093f2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093f5:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01093fb:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01093fe:	83 ec 0c             	sub    $0xc,%esp
c0109401:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109404:	e8 43 a6 ff ff       	call   c0103a4c <proc2pid>
c0109409:	83 c4 10             	add    $0x10,%esp
c010940c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010940f:	83 ec 08             	sub    $0x8,%esp
c0109412:	ff 75 b8             	pushl  -0x48(%ebp)
c0109415:	ff 75 bc             	pushl  -0x44(%ebp)
c0109418:	e8 c5 cc ff ff       	call   c01060e2 <get_physical_address_proc>
c010941d:	83 c4 10             	add    $0x10,%esp
c0109420:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0109423:	83 ec 08             	sub    $0x8,%esp
c0109426:	ff 75 dc             	pushl  -0x24(%ebp)
c0109429:	ff 75 b4             	pushl  -0x4c(%ebp)
c010942c:	e8 de cb ff ff       	call   c010600f <alloc_virtual_memory>
c0109431:	83 c4 10             	add    $0x10,%esp
c0109434:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0109437:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010943a:	83 ec 04             	sub    $0x4,%esp
c010943d:	50                   	push   %eax
c010943e:	ff 75 b0             	pushl  -0x50(%ebp)
c0109441:	ff 75 c0             	pushl  -0x40(%ebp)
c0109444:	e8 33 da ff ff       	call   c0106e7c <Memcpy>
c0109449:	83 c4 10             	add    $0x10,%esp
c010944c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010944f:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0109452:	8b 45 10             	mov    0x10(%ebp),%eax
c0109455:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010945b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010945e:	75 21                	jne    c0109481 <sys_receive_msg+0x3dc>
c0109460:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109463:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109469:	8b 45 10             	mov    0x10(%ebp),%eax
c010946c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109472:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109475:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010947c:	00 00 00 
c010947f:	eb 1f                	jmp    c01094a0 <sys_receive_msg+0x3fb>
c0109481:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109484:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010948a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010948d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109493:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109496:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010949d:	00 00 00 
c01094a0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01094a3:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01094aa:	00 00 00 
c01094ad:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01094b0:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01094b7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01094ba:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01094c1:	00 00 00 
c01094c4:	8b 45 10             	mov    0x10(%ebp),%eax
c01094c7:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01094ce:	00 00 00 
c01094d1:	8b 45 10             	mov    0x10(%ebp),%eax
c01094d4:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01094db:	00 00 00 
c01094de:	8b 45 10             	mov    0x10(%ebp),%eax
c01094e1:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01094e8:	00 00 00 
c01094eb:	83 ec 0c             	sub    $0xc,%esp
c01094ee:	ff 75 c4             	pushl  -0x3c(%ebp)
c01094f1:	e8 46 03 00 00       	call   c010983c <unblock>
c01094f6:	83 c4 10             	add    $0x10,%esp
c01094f9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01094fc:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109502:	85 c0                	test   %eax,%eax
c0109504:	74 1c                	je     c0109522 <sys_receive_msg+0x47d>
c0109506:	68 56 06 00 00       	push   $0x656
c010950b:	68 41 ba 10 c0       	push   $0xc010ba41
c0109510:	68 41 ba 10 c0       	push   $0xc010ba41
c0109515:	68 3f c0 10 c0       	push   $0xc010c03f
c010951a:	e8 76 f5 ff ff       	call   c0108a95 <assertion_failure>
c010951f:	83 c4 10             	add    $0x10,%esp
c0109522:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109525:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010952c:	84 c0                	test   %al,%al
c010952e:	74 1c                	je     c010954c <sys_receive_msg+0x4a7>
c0109530:	68 57 06 00 00       	push   $0x657
c0109535:	68 41 ba 10 c0       	push   $0xc010ba41
c010953a:	68 41 ba 10 c0       	push   $0xc010ba41
c010953f:	68 57 c0 10 c0       	push   $0xc010c057
c0109544:	e8 4c f5 ff ff       	call   c0108a95 <assertion_failure>
c0109549:	83 c4 10             	add    $0x10,%esp
c010954c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010954f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109555:	83 f8 21             	cmp    $0x21,%eax
c0109558:	74 1c                	je     c0109576 <sys_receive_msg+0x4d1>
c010955a:	68 58 06 00 00       	push   $0x658
c010955f:	68 41 ba 10 c0       	push   $0xc010ba41
c0109564:	68 41 ba 10 c0       	push   $0xc010ba41
c0109569:	68 70 c0 10 c0       	push   $0xc010c070
c010956e:	e8 22 f5 ff ff       	call   c0108a95 <assertion_failure>
c0109573:	83 c4 10             	add    $0x10,%esp
c0109576:	8b 45 10             	mov    0x10(%ebp),%eax
c0109579:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010957f:	85 c0                	test   %eax,%eax
c0109581:	74 1c                	je     c010959f <sys_receive_msg+0x4fa>
c0109583:	68 5a 06 00 00       	push   $0x65a
c0109588:	68 41 ba 10 c0       	push   $0xc010ba41
c010958d:	68 41 ba 10 c0       	push   $0xc010ba41
c0109592:	68 9c bf 10 c0       	push   $0xc010bf9c
c0109597:	e8 f9 f4 ff ff       	call   c0108a95 <assertion_failure>
c010959c:	83 c4 10             	add    $0x10,%esp
c010959f:	8b 45 10             	mov    0x10(%ebp),%eax
c01095a2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01095a9:	84 c0                	test   %al,%al
c01095ab:	74 1c                	je     c01095c9 <sys_receive_msg+0x524>
c01095ad:	68 5b 06 00 00       	push   $0x65b
c01095b2:	68 41 ba 10 c0       	push   $0xc010ba41
c01095b7:	68 41 ba 10 c0       	push   $0xc010ba41
c01095bc:	68 b1 bf 10 c0       	push   $0xc010bfb1
c01095c1:	e8 cf f4 ff ff       	call   c0108a95 <assertion_failure>
c01095c6:	83 c4 10             	add    $0x10,%esp
c01095c9:	8b 45 10             	mov    0x10(%ebp),%eax
c01095cc:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01095d2:	83 f8 21             	cmp    $0x21,%eax
c01095d5:	74 1c                	je     c01095f3 <sys_receive_msg+0x54e>
c01095d7:	68 5c 06 00 00       	push   $0x65c
c01095dc:	68 41 ba 10 c0       	push   $0xc010ba41
c01095e1:	68 41 ba 10 c0       	push   $0xc010ba41
c01095e6:	68 c8 bf 10 c0       	push   $0xc010bfc8
c01095eb:	e8 a5 f4 ff ff       	call   c0108a95 <assertion_failure>
c01095f0:	83 c4 10             	add    $0x10,%esp
c01095f3:	8b 45 10             	mov    0x10(%ebp),%eax
c01095f6:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01095fc:	83 f8 21             	cmp    $0x21,%eax
c01095ff:	0f 84 f5 00 00 00    	je     c01096fa <sys_receive_msg+0x655>
c0109605:	68 5d 06 00 00       	push   $0x65d
c010960a:	68 41 ba 10 c0       	push   $0xc010ba41
c010960f:	68 41 ba 10 c0       	push   $0xc010ba41
c0109614:	68 94 c0 10 c0       	push   $0xc010c094
c0109619:	e8 77 f4 ff ff       	call   c0108a95 <assertion_failure>
c010961e:	83 c4 10             	add    $0x10,%esp
c0109621:	e9 d4 00 00 00       	jmp    c01096fa <sys_receive_msg+0x655>
c0109626:	8b 45 10             	mov    0x10(%ebp),%eax
c0109629:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c0109630:	8b 45 10             	mov    0x10(%ebp),%eax
c0109633:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010963a:	3c 02                	cmp    $0x2,%al
c010963c:	74 1c                	je     c010965a <sys_receive_msg+0x5b5>
c010963e:	68 62 06 00 00       	push   $0x662
c0109643:	68 41 ba 10 c0       	push   $0xc010ba41
c0109648:	68 41 ba 10 c0       	push   $0xc010ba41
c010964d:	68 b3 c0 10 c0       	push   $0xc010c0b3
c0109652:	e8 3e f4 ff ff       	call   c0108a95 <assertion_failure>
c0109657:	83 c4 10             	add    $0x10,%esp
c010965a:	8b 45 10             	mov    0x10(%ebp),%eax
c010965d:	8b 55 08             	mov    0x8(%ebp),%edx
c0109660:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109666:	8b 45 10             	mov    0x10(%ebp),%eax
c0109669:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109670:	3c 02                	cmp    $0x2,%al
c0109672:	74 1c                	je     c0109690 <sys_receive_msg+0x5eb>
c0109674:	68 64 06 00 00       	push   $0x664
c0109679:	68 41 ba 10 c0       	push   $0xc010ba41
c010967e:	68 41 ba 10 c0       	push   $0xc010ba41
c0109683:	68 b3 c0 10 c0       	push   $0xc010c0b3
c0109688:	e8 08 f4 ff ff       	call   c0108a95 <assertion_failure>
c010968d:	83 c4 10             	add    $0x10,%esp
c0109690:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109694:	75 0f                	jne    c01096a5 <sys_receive_msg+0x600>
c0109696:	8b 45 10             	mov    0x10(%ebp),%eax
c0109699:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c01096a0:	00 00 00 
c01096a3:	eb 0c                	jmp    c01096b1 <sys_receive_msg+0x60c>
c01096a5:	8b 45 10             	mov    0x10(%ebp),%eax
c01096a8:	8b 55 0c             	mov    0xc(%ebp),%edx
c01096ab:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c01096b1:	8b 45 10             	mov    0x10(%ebp),%eax
c01096b4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096bb:	3c 02                	cmp    $0x2,%al
c01096bd:	74 2d                	je     c01096ec <sys_receive_msg+0x647>
c01096bf:	8b 45 10             	mov    0x10(%ebp),%eax
c01096c2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096c9:	0f be c0             	movsbl %al,%eax
c01096cc:	83 ec 0c             	sub    $0xc,%esp
c01096cf:	68 6f 06 00 00       	push   $0x66f
c01096d4:	68 41 ba 10 c0       	push   $0xc010ba41
c01096d9:	68 41 ba 10 c0       	push   $0xc010ba41
c01096de:	50                   	push   %eax
c01096df:	68 b3 c0 10 c0       	push   $0xc010c0b3
c01096e4:	e8 1e f4 ff ff       	call   c0108b07 <assertion_failure2>
c01096e9:	83 c4 20             	add    $0x20,%esp
c01096ec:	83 ec 0c             	sub    $0xc,%esp
c01096ef:	ff 75 10             	pushl  0x10(%ebp)
c01096f2:	e8 09 01 00 00       	call   c0109800 <block>
c01096f7:	83 c4 10             	add    $0x10,%esp
c01096fa:	b8 00 00 00 00       	mov    $0x0,%eax
c01096ff:	eb 02                	jmp    c0109703 <sys_receive_msg+0x65e>
c0109701:	90                   	nop
c0109702:	90                   	nop
c0109703:	c9                   	leave  
c0109704:	c3                   	ret    

c0109705 <send_rec>:
c0109705:	55                   	push   %ebp
c0109706:	89 e5                	mov    %esp,%ebp
c0109708:	83 ec 18             	sub    $0x18,%esp
c010970b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010970e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109711:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109718:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c010971c:	74 28                	je     c0109746 <send_rec+0x41>
c010971e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109722:	74 22                	je     c0109746 <send_rec+0x41>
c0109724:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109728:	74 1c                	je     c0109746 <send_rec+0x41>
c010972a:	68 81 06 00 00       	push   $0x681
c010972f:	68 41 ba 10 c0       	push   $0xc010ba41
c0109734:	68 41 ba 10 c0       	push   $0xc010ba41
c0109739:	68 d4 c0 10 c0       	push   $0xc010c0d4
c010973e:	e8 52 f3 ff ff       	call   c0108a95 <assertion_failure>
c0109743:	83 c4 10             	add    $0x10,%esp
c0109746:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010974a:	75 14                	jne    c0109760 <send_rec+0x5b>
c010974c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010974f:	83 ec 04             	sub    $0x4,%esp
c0109752:	50                   	push   %eax
c0109753:	6a 00                	push   $0x0
c0109755:	ff 75 0c             	pushl  0xc(%ebp)
c0109758:	e8 52 2a 00 00       	call   c010c1af <Memset>
c010975d:	83 c4 10             	add    $0x10,%esp
c0109760:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109764:	74 23                	je     c0109789 <send_rec+0x84>
c0109766:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010976a:	74 34                	je     c01097a0 <send_rec+0x9b>
c010976c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109770:	75 74                	jne    c01097e6 <send_rec+0xe1>
c0109772:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109775:	83 ec 08             	sub    $0x8,%esp
c0109778:	ff 75 10             	pushl  0x10(%ebp)
c010977b:	50                   	push   %eax
c010977c:	e8 1f 80 ff ff       	call   c01017a0 <send_msg>
c0109781:	83 c4 10             	add    $0x10,%esp
c0109784:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109787:	eb 70                	jmp    c01097f9 <send_rec+0xf4>
c0109789:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010978c:	83 ec 08             	sub    $0x8,%esp
c010978f:	ff 75 10             	pushl  0x10(%ebp)
c0109792:	50                   	push   %eax
c0109793:	e8 1e 80 ff ff       	call   c01017b6 <receive_msg>
c0109798:	83 c4 10             	add    $0x10,%esp
c010979b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010979e:	eb 59                	jmp    c01097f9 <send_rec+0xf4>
c01097a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097a3:	83 ec 08             	sub    $0x8,%esp
c01097a6:	ff 75 10             	pushl  0x10(%ebp)
c01097a9:	50                   	push   %eax
c01097aa:	e8 f1 7f ff ff       	call   c01017a0 <send_msg>
c01097af:	83 c4 10             	add    $0x10,%esp
c01097b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01097b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01097b9:	75 3d                	jne    c01097f8 <send_rec+0xf3>
c01097bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01097be:	83 ec 04             	sub    $0x4,%esp
c01097c1:	50                   	push   %eax
c01097c2:	6a 00                	push   $0x0
c01097c4:	ff 75 0c             	pushl  0xc(%ebp)
c01097c7:	e8 e3 29 00 00       	call   c010c1af <Memset>
c01097cc:	83 c4 10             	add    $0x10,%esp
c01097cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097d2:	83 ec 08             	sub    $0x8,%esp
c01097d5:	ff 75 10             	pushl  0x10(%ebp)
c01097d8:	50                   	push   %eax
c01097d9:	e8 d8 7f ff ff       	call   c01017b6 <receive_msg>
c01097de:	83 c4 10             	add    $0x10,%esp
c01097e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01097e4:	eb 12                	jmp    c01097f8 <send_rec+0xf3>
c01097e6:	83 ec 0c             	sub    $0xc,%esp
c01097e9:	68 10 c1 10 c0       	push   $0xc010c110
c01097ee:	e8 84 f2 ff ff       	call   c0108a77 <panic>
c01097f3:	83 c4 10             	add    $0x10,%esp
c01097f6:	eb 01                	jmp    c01097f9 <send_rec+0xf4>
c01097f8:	90                   	nop
c01097f9:	b8 00 00 00 00       	mov    $0x0,%eax
c01097fe:	c9                   	leave  
c01097ff:	c3                   	ret    

c0109800 <block>:
c0109800:	55                   	push   %ebp
c0109801:	89 e5                	mov    %esp,%ebp
c0109803:	83 ec 08             	sub    $0x8,%esp
c0109806:	8b 45 08             	mov    0x8(%ebp),%eax
c0109809:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109810:	84 c0                	test   %al,%al
c0109812:	75 1c                	jne    c0109830 <block+0x30>
c0109814:	68 b0 06 00 00       	push   $0x6b0
c0109819:	68 41 ba 10 c0       	push   $0xc010ba41
c010981e:	68 41 ba 10 c0       	push   $0xc010ba41
c0109823:	68 25 c1 10 c0       	push   $0xc010c125
c0109828:	e8 68 f2 ff ff       	call   c0108a95 <assertion_failure>
c010982d:	83 c4 10             	add    $0x10,%esp
c0109830:	e8 13 a0 ff ff       	call   c0103848 <schedule_process>
c0109835:	b8 00 00 00 00       	mov    $0x0,%eax
c010983a:	c9                   	leave  
c010983b:	c3                   	ret    

c010983c <unblock>:
c010983c:	55                   	push   %ebp
c010983d:	89 e5                	mov    %esp,%ebp
c010983f:	83 ec 08             	sub    $0x8,%esp
c0109842:	8b 45 08             	mov    0x8(%ebp),%eax
c0109845:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010984c:	84 c0                	test   %al,%al
c010984e:	74 1c                	je     c010986c <unblock+0x30>
c0109850:	68 b9 06 00 00       	push   $0x6b9
c0109855:	68 41 ba 10 c0       	push   $0xc010ba41
c010985a:	68 41 ba 10 c0       	push   $0xc010ba41
c010985f:	68 3d c1 10 c0       	push   $0xc010c13d
c0109864:	e8 2c f2 ff ff       	call   c0108a95 <assertion_failure>
c0109869:	83 c4 10             	add    $0x10,%esp
c010986c:	8b 45 08             	mov    0x8(%ebp),%eax
c010986f:	05 60 02 00 00       	add    $0x260,%eax
c0109874:	83 ec 08             	sub    $0x8,%esp
c0109877:	50                   	push   %eax
c0109878:	68 ec fd 10 c0       	push   $0xc010fdec
c010987d:	e8 ce 0a 00 00       	call   c010a350 <appendToDoubleLinkList>
c0109882:	83 c4 10             	add    $0x10,%esp
c0109885:	b8 00 00 00 00       	mov    $0x0,%eax
c010988a:	c9                   	leave  
c010988b:	c3                   	ret    

c010988c <get_ticks_ipc>:
c010988c:	55                   	push   %ebp
c010988d:	89 e5                	mov    %esp,%ebp
c010988f:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109895:	83 ec 04             	sub    $0x4,%esp
c0109898:	6a 7c                	push   $0x7c
c010989a:	6a 00                	push   $0x0
c010989c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01098a2:	50                   	push   %eax
c01098a3:	e8 07 29 00 00       	call   c010c1af <Memset>
c01098a8:	83 c4 10             	add    $0x10,%esp
c01098ab:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c01098b2:	00 00 00 
c01098b5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01098bc:	83 ec 04             	sub    $0x4,%esp
c01098bf:	6a 01                	push   $0x1
c01098c1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01098c7:	50                   	push   %eax
c01098c8:	6a 03                	push   $0x3
c01098ca:	e8 36 fe ff ff       	call   c0109705 <send_rec>
c01098cf:	83 c4 10             	add    $0x10,%esp
c01098d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01098d5:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01098db:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01098de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01098e1:	c9                   	leave  
c01098e2:	c3                   	ret    

c01098e3 <itoa>:
c01098e3:	55                   	push   %ebp
c01098e4:	89 e5                	mov    %esp,%ebp
c01098e6:	53                   	push   %ebx
c01098e7:	83 ec 14             	sub    $0x14,%esp
c01098ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01098ed:	99                   	cltd   
c01098ee:	f7 7d 10             	idivl  0x10(%ebp)
c01098f1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01098f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01098f7:	99                   	cltd   
c01098f8:	f7 7d 10             	idivl  0x10(%ebp)
c01098fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01098fe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109902:	74 14                	je     c0109918 <itoa+0x35>
c0109904:	83 ec 04             	sub    $0x4,%esp
c0109907:	ff 75 10             	pushl  0x10(%ebp)
c010990a:	ff 75 0c             	pushl  0xc(%ebp)
c010990d:	ff 75 f0             	pushl  -0x10(%ebp)
c0109910:	e8 ce ff ff ff       	call   c01098e3 <itoa>
c0109915:	83 c4 10             	add    $0x10,%esp
c0109918:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010991b:	8d 58 30             	lea    0x30(%eax),%ebx
c010991e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109921:	8b 00                	mov    (%eax),%eax
c0109923:	8d 48 01             	lea    0x1(%eax),%ecx
c0109926:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109929:	89 0a                	mov    %ecx,(%edx)
c010992b:	89 da                	mov    %ebx,%edx
c010992d:	88 10                	mov    %dl,(%eax)
c010992f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109932:	8b 00                	mov    (%eax),%eax
c0109934:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109937:	c9                   	leave  
c0109938:	c3                   	ret    

c0109939 <i2a>:
c0109939:	55                   	push   %ebp
c010993a:	89 e5                	mov    %esp,%ebp
c010993c:	53                   	push   %ebx
c010993d:	83 ec 14             	sub    $0x14,%esp
c0109940:	8b 45 08             	mov    0x8(%ebp),%eax
c0109943:	99                   	cltd   
c0109944:	f7 7d 0c             	idivl  0xc(%ebp)
c0109947:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010994a:	8b 45 08             	mov    0x8(%ebp),%eax
c010994d:	99                   	cltd   
c010994e:	f7 7d 0c             	idivl  0xc(%ebp)
c0109951:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109954:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109958:	74 14                	je     c010996e <i2a+0x35>
c010995a:	83 ec 04             	sub    $0x4,%esp
c010995d:	ff 75 10             	pushl  0x10(%ebp)
c0109960:	ff 75 0c             	pushl  0xc(%ebp)
c0109963:	ff 75 f0             	pushl  -0x10(%ebp)
c0109966:	e8 ce ff ff ff       	call   c0109939 <i2a>
c010996b:	83 c4 10             	add    $0x10,%esp
c010996e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109972:	7f 0a                	jg     c010997e <i2a+0x45>
c0109974:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109977:	83 c0 30             	add    $0x30,%eax
c010997a:	89 c3                	mov    %eax,%ebx
c010997c:	eb 08                	jmp    c0109986 <i2a+0x4d>
c010997e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109981:	83 c0 37             	add    $0x37,%eax
c0109984:	89 c3                	mov    %eax,%ebx
c0109986:	8b 45 10             	mov    0x10(%ebp),%eax
c0109989:	8b 00                	mov    (%eax),%eax
c010998b:	8d 48 01             	lea    0x1(%eax),%ecx
c010998e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109991:	89 0a                	mov    %ecx,(%edx)
c0109993:	88 18                	mov    %bl,(%eax)
c0109995:	8b 45 10             	mov    0x10(%ebp),%eax
c0109998:	8b 00                	mov    (%eax),%eax
c010999a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010999d:	c9                   	leave  
c010999e:	c3                   	ret    

c010999f <inform_int>:
c010999f:	55                   	push   %ebp
c01099a0:	89 e5                	mov    %esp,%ebp
c01099a2:	83 ec 18             	sub    $0x18,%esp
c01099a5:	83 ec 0c             	sub    $0xc,%esp
c01099a8:	ff 75 08             	pushl  0x8(%ebp)
c01099ab:	e8 16 a0 ff ff       	call   c01039c6 <pid2proc>
c01099b0:	83 c4 10             	add    $0x10,%esp
c01099b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01099b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099b9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01099c0:	0f be c0             	movsbl %al,%eax
c01099c3:	83 e0 02             	and    $0x2,%eax
c01099c6:	85 c0                	test   %eax,%eax
c01099c8:	0f 84 8e 00 00 00    	je     c0109a5c <inform_int+0xbd>
c01099ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099d1:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01099d7:	3d 13 02 00 00       	cmp    $0x213,%eax
c01099dc:	74 0e                	je     c01099ec <inform_int+0x4d>
c01099de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099e1:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01099e7:	83 f8 12             	cmp    $0x12,%eax
c01099ea:	75 7d                	jne    c0109a69 <inform_int+0xca>
c01099ec:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01099f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099f6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01099fc:	83 ec 08             	sub    $0x8,%esp
c01099ff:	ff 75 f0             	pushl  -0x10(%ebp)
c0109a02:	50                   	push   %eax
c0109a03:	e8 07 c6 ff ff       	call   c010600f <alloc_virtual_memory>
c0109a08:	83 c4 10             	add    $0x10,%esp
c0109a0b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109a0e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109a11:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109a17:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109a1a:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a24:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109a2b:	00 00 00 
c0109a2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a31:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109a38:	00 00 00 
c0109a3b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a45:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109a4c:	83 ec 0c             	sub    $0xc,%esp
c0109a4f:	ff 75 f4             	pushl  -0xc(%ebp)
c0109a52:	e8 e5 fd ff ff       	call   c010983c <unblock>
c0109a57:	83 c4 10             	add    $0x10,%esp
c0109a5a:	eb 0d                	jmp    c0109a69 <inform_int+0xca>
c0109a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a5f:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109a66:	00 00 00 
c0109a69:	90                   	nop
c0109a6a:	c9                   	leave  
c0109a6b:	c3                   	ret    

c0109a6c <strcmp>:
c0109a6c:	55                   	push   %ebp
c0109a6d:	89 e5                	mov    %esp,%ebp
c0109a6f:	83 ec 10             	sub    $0x10,%esp
c0109a72:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109a76:	74 06                	je     c0109a7e <strcmp+0x12>
c0109a78:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109a7c:	75 08                	jne    c0109a86 <strcmp+0x1a>
c0109a7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a81:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109a84:	eb 53                	jmp    c0109ad9 <strcmp+0x6d>
c0109a86:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a89:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0109a8c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109a8f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109a92:	eb 18                	jmp    c0109aac <strcmp+0x40>
c0109a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109a97:	0f b6 10             	movzbl (%eax),%edx
c0109a9a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109a9d:	0f b6 00             	movzbl (%eax),%eax
c0109aa0:	38 c2                	cmp    %al,%dl
c0109aa2:	75 1e                	jne    c0109ac2 <strcmp+0x56>
c0109aa4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0109aa8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0109aac:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109aaf:	0f b6 00             	movzbl (%eax),%eax
c0109ab2:	84 c0                	test   %al,%al
c0109ab4:	74 0d                	je     c0109ac3 <strcmp+0x57>
c0109ab6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109ab9:	0f b6 00             	movzbl (%eax),%eax
c0109abc:	84 c0                	test   %al,%al
c0109abe:	75 d4                	jne    c0109a94 <strcmp+0x28>
c0109ac0:	eb 01                	jmp    c0109ac3 <strcmp+0x57>
c0109ac2:	90                   	nop
c0109ac3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109ac6:	0f b6 00             	movzbl (%eax),%eax
c0109ac9:	0f be d0             	movsbl %al,%edx
c0109acc:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109acf:	0f b6 00             	movzbl (%eax),%eax
c0109ad2:	0f be c0             	movsbl %al,%eax
c0109ad5:	29 c2                	sub    %eax,%edx
c0109ad7:	89 d0                	mov    %edx,%eax
c0109ad9:	c9                   	leave  
c0109ada:	c3                   	ret    

c0109adb <create_user_process_address_space>:
c0109adb:	55                   	push   %ebp
c0109adc:	89 e5                	mov    %esp,%ebp
c0109ade:	83 ec 18             	sub    $0x18,%esp
c0109ae1:	83 ec 08             	sub    $0x8,%esp
c0109ae4:	6a 00                	push   $0x0
c0109ae6:	6a 01                	push   $0x1
c0109ae8:	e8 5a c8 ff ff       	call   c0106347 <alloc_memory>
c0109aed:	83 c4 10             	add    $0x10,%esp
c0109af0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109af3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109af6:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109afd:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109b04:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b07:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109b0c:	c1 e8 0c             	shr    $0xc,%eax
c0109b0f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109b12:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109b15:	83 c0 07             	add    $0x7,%eax
c0109b18:	c1 e8 03             	shr    $0x3,%eax
c0109b1b:	89 c2                	mov    %eax,%edx
c0109b1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b20:	89 50 04             	mov    %edx,0x4(%eax)
c0109b23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b26:	8b 40 04             	mov    0x4(%eax),%eax
c0109b29:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109b2e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0109b34:	85 c0                	test   %eax,%eax
c0109b36:	0f 48 c2             	cmovs  %edx,%eax
c0109b39:	c1 f8 0c             	sar    $0xc,%eax
c0109b3c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109b3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109b42:	83 ec 08             	sub    $0x8,%esp
c0109b45:	6a 00                	push   $0x0
c0109b47:	50                   	push   %eax
c0109b48:	e8 fa c7 ff ff       	call   c0106347 <alloc_memory>
c0109b4d:	83 c4 10             	add    $0x10,%esp
c0109b50:	89 c2                	mov    %eax,%edx
c0109b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b55:	89 10                	mov    %edx,(%eax)
c0109b57:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b5a:	83 ec 0c             	sub    $0xc,%esp
c0109b5d:	50                   	push   %eax
c0109b5e:	e8 b6 bf ff ff       	call   c0105b19 <init_bitmap>
c0109b63:	83 c4 10             	add    $0x10,%esp
c0109b66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b69:	c9                   	leave  
c0109b6a:	c3                   	ret    

c0109b6b <user_process>:
c0109b6b:	55                   	push   %ebp
c0109b6c:	89 e5                	mov    %esp,%ebp
c0109b6e:	83 ec 38             	sub    $0x38,%esp
c0109b71:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109b78:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109b7f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109b86:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0109b8a:	75 0e                	jne    c0109b9a <user_process+0x2f>
c0109b8c:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109b92:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109b98:	eb 0c                	jmp    c0109ba6 <user_process+0x3b>
c0109b9a:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109ba0:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109ba6:	e8 91 68 ff ff       	call   c010043c <get_running_thread_pcb>
c0109bab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109bae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109bb1:	8b 55 14             	mov    0x14(%ebp),%edx
c0109bb4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109bba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109bbd:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109bc3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109bc6:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109bcc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109bcf:	05 00 10 00 00       	add    $0x1000,%eax
c0109bd4:	89 c2                	mov    %eax,%edx
c0109bd6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109bd9:	89 10                	mov    %edx,(%eax)
c0109bdb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109bde:	8b 00                	mov    (%eax),%eax
c0109be0:	83 e8 44             	sub    $0x44,%eax
c0109be3:	89 c2                	mov    %eax,%edx
c0109be5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109be8:	89 10                	mov    %edx,(%eax)
c0109bea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109bed:	8b 00                	mov    (%eax),%eax
c0109bef:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109bf2:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109bf6:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109bfc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109c00:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109c04:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109c08:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109c0c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109c10:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109c14:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109c1a:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109c1e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c21:	89 50 34             	mov    %edx,0x34(%eax)
c0109c24:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109c28:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c2b:	89 50 0c             	mov    %edx,0xc(%eax)
c0109c2e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109c32:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c35:	89 50 04             	mov    %edx,0x4(%eax)
c0109c38:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109c3c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c3f:	89 50 08             	mov    %edx,0x8(%eax)
c0109c42:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109c46:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c49:	89 50 40             	mov    %edx,0x40(%eax)
c0109c4c:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109c50:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c53:	89 10                	mov    %edx,(%eax)
c0109c55:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c58:	8b 55 08             	mov    0x8(%ebp),%edx
c0109c5b:	89 50 30             	mov    %edx,0x30(%eax)
c0109c5e:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109c62:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c65:	89 50 38             	mov    %edx,0x38(%eax)
c0109c68:	83 ec 08             	sub    $0x8,%esp
c0109c6b:	6a 01                	push   $0x1
c0109c6d:	68 00 f0 ff bf       	push   $0xbffff000
c0109c72:	e8 08 c6 ff ff       	call   c010627f <alloc_physical_memory>
c0109c77:	83 c4 10             	add    $0x10,%esp
c0109c7a:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109c80:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c83:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109c86:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c89:	83 ec 0c             	sub    $0xc,%esp
c0109c8c:	50                   	push   %eax
c0109c8d:	e8 7d 66 ff ff       	call   c010030f <restart>
c0109c92:	83 c4 10             	add    $0x10,%esp
c0109c95:	90                   	nop
c0109c96:	c9                   	leave  
c0109c97:	c3                   	ret    

c0109c98 <clone_pcb>:
c0109c98:	55                   	push   %ebp
c0109c99:	89 e5                	mov    %esp,%ebp
c0109c9b:	83 ec 38             	sub    $0x38,%esp
c0109c9e:	83 ec 08             	sub    $0x8,%esp
c0109ca1:	6a 00                	push   $0x0
c0109ca3:	6a 01                	push   $0x1
c0109ca5:	e8 9d c6 ff ff       	call   c0106347 <alloc_memory>
c0109caa:	83 c4 10             	add    $0x10,%esp
c0109cad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109cb0:	83 ec 04             	sub    $0x4,%esp
c0109cb3:	68 00 10 00 00       	push   $0x1000
c0109cb8:	6a 00                	push   $0x0
c0109cba:	ff 75 f4             	pushl  -0xc(%ebp)
c0109cbd:	e8 ed 24 00 00       	call   c010c1af <Memset>
c0109cc2:	83 c4 10             	add    $0x10,%esp
c0109cc5:	83 ec 04             	sub    $0x4,%esp
c0109cc8:	68 00 10 00 00       	push   $0x1000
c0109ccd:	ff 75 08             	pushl  0x8(%ebp)
c0109cd0:	ff 75 f4             	pushl  -0xc(%ebp)
c0109cd3:	e8 a4 d1 ff ff       	call   c0106e7c <Memcpy>
c0109cd8:	83 c4 10             	add    $0x10,%esp
c0109cdb:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0109ce0:	8d 50 01             	lea    0x1(%eax),%edx
c0109ce3:	89 15 c8 06 11 c0    	mov    %edx,0xc01106c8
c0109ce9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109cec:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109cf2:	8b 45 08             	mov    0x8(%ebp),%eax
c0109cf5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109cfb:	89 c2                	mov    %eax,%edx
c0109cfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d00:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109d06:	83 ec 08             	sub    $0x8,%esp
c0109d09:	6a 00                	push   $0x0
c0109d0b:	6a 01                	push   $0x1
c0109d0d:	e8 35 c6 ff ff       	call   c0106347 <alloc_memory>
c0109d12:	83 c4 10             	add    $0x10,%esp
c0109d15:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109d18:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109d1b:	05 00 0c 00 00       	add    $0xc00,%eax
c0109d20:	83 ec 04             	sub    $0x4,%esp
c0109d23:	68 00 04 00 00       	push   $0x400
c0109d28:	68 00 fc ff ff       	push   $0xfffffc00
c0109d2d:	50                   	push   %eax
c0109d2e:	e8 49 d1 ff ff       	call   c0106e7c <Memcpy>
c0109d33:	83 c4 10             	add    $0x10,%esp
c0109d36:	83 ec 0c             	sub    $0xc,%esp
c0109d39:	ff 75 f0             	pushl  -0x10(%ebp)
c0109d3c:	e8 1d c4 ff ff       	call   c010615e <get_physical_address>
c0109d41:	83 c4 10             	add    $0x10,%esp
c0109d44:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109d47:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109d4a:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109d4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109d52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109d55:	83 c8 07             	or     $0x7,%eax
c0109d58:	89 c2                	mov    %eax,%edx
c0109d5a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109d5d:	89 10                	mov    %edx,(%eax)
c0109d5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d62:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109d65:	89 50 08             	mov    %edx,0x8(%eax)
c0109d68:	e8 6e fd ff ff       	call   c0109adb <create_user_process_address_space>
c0109d6d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109d70:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d76:	89 50 0c             	mov    %edx,0xc(%eax)
c0109d79:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d7c:	8b 40 0c             	mov    0xc(%eax),%eax
c0109d7f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109d82:	83 ec 04             	sub    $0x4,%esp
c0109d85:	6a 0c                	push   $0xc
c0109d87:	ff 75 e0             	pushl  -0x20(%ebp)
c0109d8a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109d8d:	e8 ea d0 ff ff       	call   c0106e7c <Memcpy>
c0109d92:	83 c4 10             	add    $0x10,%esp
c0109d95:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109d9c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109d9f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109da4:	c1 e8 0c             	shr    $0xc,%eax
c0109da7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109daa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109dad:	83 c0 07             	add    $0x7,%eax
c0109db0:	c1 e8 03             	shr    $0x3,%eax
c0109db3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109db6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109db9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109dbc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109dbf:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109dc4:	c1 e8 0c             	shr    $0xc,%eax
c0109dc7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109dca:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109dcd:	83 ec 08             	sub    $0x8,%esp
c0109dd0:	6a 00                	push   $0x0
c0109dd2:	50                   	push   %eax
c0109dd3:	e8 6f c5 ff ff       	call   c0106347 <alloc_memory>
c0109dd8:	83 c4 10             	add    $0x10,%esp
c0109ddb:	89 c2                	mov    %eax,%edx
c0109ddd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109de0:	89 10                	mov    %edx,(%eax)
c0109de2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109de5:	c1 e0 0c             	shl    $0xc,%eax
c0109de8:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109deb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109dee:	8b 10                	mov    (%eax),%edx
c0109df0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109df3:	8b 00                	mov    (%eax),%eax
c0109df5:	83 ec 04             	sub    $0x4,%esp
c0109df8:	ff 75 cc             	pushl  -0x34(%ebp)
c0109dfb:	52                   	push   %edx
c0109dfc:	50                   	push   %eax
c0109dfd:	e8 7a d0 ff ff       	call   c0106e7c <Memcpy>
c0109e02:	83 c4 10             	add    $0x10,%esp
c0109e05:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e08:	c9                   	leave  
c0109e09:	c3                   	ret    

c0109e0a <build_body_stack>:
c0109e0a:	55                   	push   %ebp
c0109e0b:	89 e5                	mov    %esp,%ebp
c0109e0d:	83 ec 48             	sub    $0x48,%esp
c0109e10:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e13:	8b 40 0c             	mov    0xc(%eax),%eax
c0109e16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e1c:	8b 50 04             	mov    0x4(%eax),%edx
c0109e1f:	8b 00                	mov    (%eax),%eax
c0109e21:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109e24:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109e27:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109e2a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109e2d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109e30:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109e33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e36:	8b 40 08             	mov    0x8(%eax),%eax
c0109e39:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109e3c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109e43:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109e4a:	e8 c9 cf ff ff       	call   c0106e18 <intr_disable>
c0109e4f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109e52:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109e59:	e9 c2 00 00 00       	jmp    c0109f20 <build_body_stack+0x116>
c0109e5e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109e61:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e64:	01 d0                	add    %edx,%eax
c0109e66:	0f b6 00             	movzbl (%eax),%eax
c0109e69:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109e6c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109e73:	e9 9a 00 00 00       	jmp    c0109f12 <build_body_stack+0x108>
c0109e78:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109e7c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e7f:	89 c1                	mov    %eax,%ecx
c0109e81:	d3 fa                	sar    %cl,%edx
c0109e83:	89 d0                	mov    %edx,%eax
c0109e85:	83 e0 01             	and    $0x1,%eax
c0109e88:	85 c0                	test   %eax,%eax
c0109e8a:	75 06                	jne    c0109e92 <build_body_stack+0x88>
c0109e8c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109e90:	eb 7c                	jmp    c0109f0e <build_body_stack+0x104>
c0109e92:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e95:	8b 40 08             	mov    0x8(%eax),%eax
c0109e98:	83 ec 0c             	sub    $0xc,%esp
c0109e9b:	50                   	push   %eax
c0109e9c:	e8 7f 65 ff ff       	call   c0100420 <update_cr3>
c0109ea1:	83 c4 10             	add    $0x10,%esp
c0109ea4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ea7:	c1 e0 0c             	shl    $0xc,%eax
c0109eaa:	89 c2                	mov    %eax,%edx
c0109eac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109eaf:	01 d0                	add    %edx,%eax
c0109eb1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109eb4:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109eb7:	8b 45 10             	mov    0x10(%ebp),%eax
c0109eba:	83 ec 04             	sub    $0x4,%esp
c0109ebd:	68 00 10 00 00       	push   $0x1000
c0109ec2:	52                   	push   %edx
c0109ec3:	50                   	push   %eax
c0109ec4:	e8 b3 cf ff ff       	call   c0106e7c <Memcpy>
c0109ec9:	83 c4 10             	add    $0x10,%esp
c0109ecc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109ecf:	8b 40 08             	mov    0x8(%eax),%eax
c0109ed2:	83 ec 0c             	sub    $0xc,%esp
c0109ed5:	50                   	push   %eax
c0109ed6:	e8 45 65 ff ff       	call   c0100420 <update_cr3>
c0109edb:	83 c4 10             	add    $0x10,%esp
c0109ede:	83 ec 08             	sub    $0x8,%esp
c0109ee1:	ff 75 cc             	pushl  -0x34(%ebp)
c0109ee4:	6a 01                	push   $0x1
c0109ee6:	e8 be c4 ff ff       	call   c01063a9 <get_a_virtual_page>
c0109eeb:	83 c4 10             	add    $0x10,%esp
c0109eee:	8b 55 10             	mov    0x10(%ebp),%edx
c0109ef1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109ef4:	83 ec 04             	sub    $0x4,%esp
c0109ef7:	68 00 10 00 00       	push   $0x1000
c0109efc:	52                   	push   %edx
c0109efd:	50                   	push   %eax
c0109efe:	e8 79 cf ff ff       	call   c0106e7c <Memcpy>
c0109f03:	83 c4 10             	add    $0x10,%esp
c0109f06:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109f0a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109f0e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109f12:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109f16:	0f 8e 5c ff ff ff    	jle    c0109e78 <build_body_stack+0x6e>
c0109f1c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109f20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109f23:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109f26:	0f 87 32 ff ff ff    	ja     c0109e5e <build_body_stack+0x54>
c0109f2c:	83 ec 0c             	sub    $0xc,%esp
c0109f2f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109f32:	e8 0a cf ff ff       	call   c0106e41 <intr_set_status>
c0109f37:	83 c4 10             	add    $0x10,%esp
c0109f3a:	90                   	nop
c0109f3b:	c9                   	leave  
c0109f3c:	c3                   	ret    

c0109f3d <build_process_kernel_stack>:
c0109f3d:	55                   	push   %ebp
c0109f3e:	89 e5                	mov    %esp,%ebp
c0109f40:	83 ec 28             	sub    $0x28,%esp
c0109f43:	e8 d0 ce ff ff       	call   c0106e18 <intr_disable>
c0109f48:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109f4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f4e:	05 00 10 00 00       	add    $0x1000,%eax
c0109f53:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f59:	8b 00                	mov    (%eax),%eax
c0109f5b:	83 f8 38             	cmp    $0x38,%eax
c0109f5e:	74 06                	je     c0109f66 <build_process_kernel_stack+0x29>
c0109f60:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109f64:	eb f0                	jmp    c0109f56 <build_process_kernel_stack+0x19>
c0109f66:	90                   	nop
c0109f67:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f6a:	05 00 10 00 00       	add    $0x1000,%eax
c0109f6f:	89 c2                	mov    %eax,%edx
c0109f71:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f74:	89 50 04             	mov    %edx,0x4(%eax)
c0109f77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f7a:	83 c0 2c             	add    $0x2c,%eax
c0109f7d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109f80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f83:	83 e8 04             	sub    $0x4,%eax
c0109f86:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109f89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f8c:	83 e8 08             	sub    $0x8,%eax
c0109f8f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109f92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f95:	83 e8 0c             	sub    $0xc,%eax
c0109f98:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109f9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f9e:	83 e8 10             	sub    $0x10,%eax
c0109fa1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109fa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fa7:	83 e8 14             	sub    $0x14,%eax
c0109faa:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109fad:	ba 00 03 10 c0       	mov    $0xc0100300,%edx
c0109fb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109fb5:	89 10                	mov    %edx,(%eax)
c0109fb7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109fba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109fc0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109fc3:	8b 10                	mov    (%eax),%edx
c0109fc5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109fc8:	89 10                	mov    %edx,(%eax)
c0109fca:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109fcd:	8b 10                	mov    (%eax),%edx
c0109fcf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109fd2:	89 10                	mov    %edx,(%eax)
c0109fd4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109fd7:	8b 10                	mov    (%eax),%edx
c0109fd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fdc:	89 10                	mov    %edx,(%eax)
c0109fde:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109fe1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109fe7:	8b 45 08             	mov    0x8(%ebp),%eax
c0109fea:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109fed:	89 10                	mov    %edx,(%eax)
c0109fef:	83 ec 0c             	sub    $0xc,%esp
c0109ff2:	ff 75 f0             	pushl  -0x10(%ebp)
c0109ff5:	e8 47 ce ff ff       	call   c0106e41 <intr_set_status>
c0109ffa:	83 c4 10             	add    $0x10,%esp
c0109ffd:	90                   	nop
c0109ffe:	c9                   	leave  
c0109fff:	c3                   	ret    

c010a000 <fork_process>:
c010a000:	55                   	push   %ebp
c010a001:	89 e5                	mov    %esp,%ebp
c010a003:	83 ec 18             	sub    $0x18,%esp
c010a006:	8b 45 08             	mov    0x8(%ebp),%eax
c010a009:	83 ec 0c             	sub    $0xc,%esp
c010a00c:	50                   	push   %eax
c010a00d:	e8 b4 99 ff ff       	call   c01039c6 <pid2proc>
c010a012:	83 c4 10             	add    $0x10,%esp
c010a015:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a018:	83 ec 0c             	sub    $0xc,%esp
c010a01b:	ff 75 f4             	pushl  -0xc(%ebp)
c010a01e:	e8 75 fc ff ff       	call   c0109c98 <clone_pcb>
c010a023:	83 c4 10             	add    $0x10,%esp
c010a026:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a029:	83 ec 08             	sub    $0x8,%esp
c010a02c:	6a 00                	push   $0x0
c010a02e:	6a 01                	push   $0x1
c010a030:	e8 12 c3 ff ff       	call   c0106347 <alloc_memory>
c010a035:	83 c4 10             	add    $0x10,%esp
c010a038:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a03b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a03e:	83 ec 04             	sub    $0x4,%esp
c010a041:	68 00 10 00 00       	push   $0x1000
c010a046:	6a 00                	push   $0x0
c010a048:	50                   	push   %eax
c010a049:	e8 61 21 00 00       	call   c010c1af <Memset>
c010a04e:	83 c4 10             	add    $0x10,%esp
c010a051:	83 ec 04             	sub    $0x4,%esp
c010a054:	ff 75 ec             	pushl  -0x14(%ebp)
c010a057:	ff 75 f0             	pushl  -0x10(%ebp)
c010a05a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a05d:	e8 a8 fd ff ff       	call   c0109e0a <build_body_stack>
c010a062:	83 c4 10             	add    $0x10,%esp
c010a065:	83 ec 0c             	sub    $0xc,%esp
c010a068:	ff 75 f0             	pushl  -0x10(%ebp)
c010a06b:	e8 cd fe ff ff       	call   c0109f3d <build_process_kernel_stack>
c010a070:	83 c4 10             	add    $0x10,%esp
c010a073:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a076:	05 6a 02 00 00       	add    $0x26a,%eax
c010a07b:	83 ec 08             	sub    $0x8,%esp
c010a07e:	50                   	push   %eax
c010a07f:	68 04 0f 11 c0       	push   $0xc0110f04
c010a084:	e8 c7 02 00 00       	call   c010a350 <appendToDoubleLinkList>
c010a089:	83 c4 10             	add    $0x10,%esp
c010a08c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a08f:	c9                   	leave  
c010a090:	c3                   	ret    

c010a091 <process_execute>:
c010a091:	55                   	push   %ebp
c010a092:	89 e5                	mov    %esp,%ebp
c010a094:	83 ec 28             	sub    $0x28,%esp
c010a097:	e8 ca 04 00 00       	call   c010a566 <thread_init>
c010a09c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a09f:	83 ec 0c             	sub    $0xc,%esp
c010a0a2:	ff 75 f4             	pushl  -0xc(%ebp)
c010a0a5:	e8 69 05 00 00       	call   c010a613 <thread_create>
c010a0aa:	83 c4 10             	add    $0x10,%esp
c010a0ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0b0:	05 28 01 00 00       	add    $0x128,%eax
c010a0b5:	83 ec 08             	sub    $0x8,%esp
c010a0b8:	ff 75 10             	pushl  0x10(%ebp)
c010a0bb:	50                   	push   %eax
c010a0bc:	e8 0d 21 00 00       	call   c010c1ce <Strcpy>
c010a0c1:	83 c4 10             	add    $0x10,%esp
c010a0c4:	83 ec 08             	sub    $0x8,%esp
c010a0c7:	6a 00                	push   $0x0
c010a0c9:	6a 01                	push   $0x1
c010a0cb:	e8 77 c2 ff ff       	call   c0106347 <alloc_memory>
c010a0d0:	83 c4 10             	add    $0x10,%esp
c010a0d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a0d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a0d9:	05 00 0c 00 00       	add    $0xc00,%eax
c010a0de:	83 ec 04             	sub    $0x4,%esp
c010a0e1:	68 00 04 00 00       	push   $0x400
c010a0e6:	68 00 fc ff ff       	push   $0xfffffc00
c010a0eb:	50                   	push   %eax
c010a0ec:	e8 8b cd ff ff       	call   c0106e7c <Memcpy>
c010a0f1:	83 c4 10             	add    $0x10,%esp
c010a0f4:	83 ec 0c             	sub    $0xc,%esp
c010a0f7:	ff 75 f0             	pushl  -0x10(%ebp)
c010a0fa:	e8 5f c0 ff ff       	call   c010615e <get_physical_address>
c010a0ff:	83 c4 10             	add    $0x10,%esp
c010a102:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a105:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a108:	05 fc 0f 00 00       	add    $0xffc,%eax
c010a10d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a110:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a113:	83 c8 07             	or     $0x7,%eax
c010a116:	89 c2                	mov    %eax,%edx
c010a118:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a11b:	89 10                	mov    %edx,(%eax)
c010a11d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a120:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010a123:	89 50 08             	mov    %edx,0x8(%eax)
c010a126:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a129:	83 c0 10             	add    $0x10,%eax
c010a12c:	83 ec 0c             	sub    $0xc,%esp
c010a12f:	50                   	push   %eax
c010a130:	e8 c8 c7 ff ff       	call   c01068fd <init_memory_block_desc>
c010a135:	83 c4 10             	add    $0x10,%esp
c010a138:	e8 9e f9 ff ff       	call   c0109adb <create_user_process_address_space>
c010a13d:	89 c2                	mov    %eax,%edx
c010a13f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a142:	89 50 0c             	mov    %edx,0xc(%eax)
c010a145:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a148:	8b 00                	mov    (%eax),%eax
c010a14a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a14d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a150:	c7 40 10 6b 9b 10 c0 	movl   $0xc0109b6b,0x10(%eax)
c010a157:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a15a:	8b 55 08             	mov    0x8(%ebp),%edx
c010a15d:	89 50 18             	mov    %edx,0x18(%eax)
c010a160:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a163:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a166:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a169:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a16c:	8b 55 14             	mov    0x14(%ebp),%edx
c010a16f:	89 50 20             	mov    %edx,0x20(%eax)
c010a172:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a175:	8b 55 18             	mov    0x18(%ebp),%edx
c010a178:	89 50 24             	mov    %edx,0x24(%eax)
c010a17b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010a17e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a181:	89 50 28             	mov    %edx,0x28(%eax)
c010a184:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a187:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a18d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a190:	8b 10                	mov    (%eax),%edx
c010a192:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a195:	89 50 04             	mov    %edx,0x4(%eax)
c010a198:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a19b:	8b 50 04             	mov    0x4(%eax),%edx
c010a19e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a1a1:	89 50 08             	mov    %edx,0x8(%eax)
c010a1a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a1a7:	8b 50 08             	mov    0x8(%eax),%edx
c010a1aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a1ad:	89 50 0c             	mov    %edx,0xc(%eax)
c010a1b0:	83 ec 0c             	sub    $0xc,%esp
c010a1b3:	68 ec fd 10 c0       	push   $0xc010fdec
c010a1b8:	e8 96 00 00 00       	call   c010a253 <isListEmpty>
c010a1bd:	83 c4 10             	add    $0x10,%esp
c010a1c0:	e8 53 cc ff ff       	call   c0106e18 <intr_disable>
c010a1c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a1c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a1cb:	05 60 02 00 00       	add    $0x260,%eax
c010a1d0:	83 ec 08             	sub    $0x8,%esp
c010a1d3:	50                   	push   %eax
c010a1d4:	68 ec fd 10 c0       	push   $0xc010fdec
c010a1d9:	e8 72 01 00 00       	call   c010a350 <appendToDoubleLinkList>
c010a1de:	83 c4 10             	add    $0x10,%esp
c010a1e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a1e4:	05 6a 02 00 00       	add    $0x26a,%eax
c010a1e9:	83 ec 08             	sub    $0x8,%esp
c010a1ec:	50                   	push   %eax
c010a1ed:	68 04 0f 11 c0       	push   $0xc0110f04
c010a1f2:	e8 59 01 00 00       	call   c010a350 <appendToDoubleLinkList>
c010a1f7:	83 c4 10             	add    $0x10,%esp
c010a1fa:	83 ec 0c             	sub    $0xc,%esp
c010a1fd:	ff 75 e0             	pushl  -0x20(%ebp)
c010a200:	e8 3c cc ff ff       	call   c0106e41 <intr_set_status>
c010a205:	83 c4 10             	add    $0x10,%esp
c010a208:	90                   	nop
c010a209:	c9                   	leave  
c010a20a:	c3                   	ret    
c010a20b:	66 90                	xchg   %ax,%ax
c010a20d:	66 90                	xchg   %ax,%ax
c010a20f:	90                   	nop

c010a210 <switch_to>:
c010a210:	56                   	push   %esi
c010a211:	57                   	push   %edi
c010a212:	53                   	push   %ebx
c010a213:	55                   	push   %ebp
c010a214:	89 e5                	mov    %esp,%ebp
c010a216:	8b 45 14             	mov    0x14(%ebp),%eax
c010a219:	89 20                	mov    %esp,(%eax)
c010a21b:	8b 45 18             	mov    0x18(%ebp),%eax
c010a21e:	8b 20                	mov    (%eax),%esp
c010a220:	5d                   	pop    %ebp
c010a221:	5b                   	pop    %ebx
c010a222:	5f                   	pop    %edi
c010a223:	5e                   	pop    %esi
c010a224:	c3                   	ret    

c010a225 <initDoubleLinkList>:
c010a225:	55                   	push   %ebp
c010a226:	89 e5                	mov    %esp,%ebp
c010a228:	8b 45 08             	mov    0x8(%ebp),%eax
c010a22b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a231:	8b 45 08             	mov    0x8(%ebp),%eax
c010a234:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a23b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a23e:	8d 50 08             	lea    0x8(%eax),%edx
c010a241:	8b 45 08             	mov    0x8(%ebp),%eax
c010a244:	89 50 04             	mov    %edx,0x4(%eax)
c010a247:	8b 55 08             	mov    0x8(%ebp),%edx
c010a24a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a24d:	89 50 08             	mov    %edx,0x8(%eax)
c010a250:	90                   	nop
c010a251:	5d                   	pop    %ebp
c010a252:	c3                   	ret    

c010a253 <isListEmpty>:
c010a253:	55                   	push   %ebp
c010a254:	89 e5                	mov    %esp,%ebp
c010a256:	8b 45 08             	mov    0x8(%ebp),%eax
c010a259:	8b 40 04             	mov    0x4(%eax),%eax
c010a25c:	8b 55 08             	mov    0x8(%ebp),%edx
c010a25f:	83 c2 08             	add    $0x8,%edx
c010a262:	39 d0                	cmp    %edx,%eax
c010a264:	75 07                	jne    c010a26d <isListEmpty+0x1a>
c010a266:	b8 01 00 00 00       	mov    $0x1,%eax
c010a26b:	eb 05                	jmp    c010a272 <isListEmpty+0x1f>
c010a26d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a272:	5d                   	pop    %ebp
c010a273:	c3                   	ret    

c010a274 <findElementInList>:
c010a274:	55                   	push   %ebp
c010a275:	89 e5                	mov    %esp,%ebp
c010a277:	83 ec 28             	sub    $0x28,%esp
c010a27a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a27e:	75 19                	jne    c010a299 <findElementInList+0x25>
c010a280:	6a 60                	push   $0x60
c010a282:	68 55 c1 10 c0       	push   $0xc010c155
c010a287:	68 55 c1 10 c0       	push   $0xc010c155
c010a28c:	68 68 c1 10 c0       	push   $0xc010c168
c010a291:	e8 ff e7 ff ff       	call   c0108a95 <assertion_failure>
c010a296:	83 c4 10             	add    $0x10,%esp
c010a299:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a29d:	75 19                	jne    c010a2b8 <findElementInList+0x44>
c010a29f:	6a 61                	push   $0x61
c010a2a1:	68 55 c1 10 c0       	push   $0xc010c155
c010a2a6:	68 55 c1 10 c0       	push   $0xc010c155
c010a2ab:	68 74 c1 10 c0       	push   $0xc010c174
c010a2b0:	e8 e0 e7 ff ff       	call   c0108a95 <assertion_failure>
c010a2b5:	83 c4 10             	add    $0x10,%esp
c010a2b8:	e8 5b cb ff ff       	call   c0106e18 <intr_disable>
c010a2bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a2c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a2c7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2ca:	8b 40 08             	mov    0x8(%eax),%eax
c010a2cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a2d0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2d3:	8b 40 04             	mov    0x4(%eax),%eax
c010a2d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a2d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a2dd:	75 07                	jne    c010a2e6 <findElementInList+0x72>
c010a2df:	b8 00 00 00 00       	mov    $0x0,%eax
c010a2e4:	eb 68                	jmp    c010a34e <findElementInList+0xda>
c010a2e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a2e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a2ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a2ef:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a2f2:	c1 f8 03             	sar    $0x3,%eax
c010a2f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a2f8:	eb 36                	jmp    c010a330 <findElementInList+0xbc>
c010a2fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a2fd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a300:	75 07                	jne    c010a309 <findElementInList+0x95>
c010a302:	b8 01 00 00 00       	mov    $0x1,%eax
c010a307:	eb 45                	jmp    c010a34e <findElementInList+0xda>
c010a309:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a30d:	75 07                	jne    c010a316 <findElementInList+0xa2>
c010a30f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a314:	eb 38                	jmp    c010a34e <findElementInList+0xda>
c010a316:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a319:	8b 40 04             	mov    0x4(%eax),%eax
c010a31c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a31f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a323:	75 07                	jne    c010a32c <findElementInList+0xb8>
c010a325:	b8 00 00 00 00       	mov    $0x0,%eax
c010a32a:	eb 22                	jmp    c010a34e <findElementInList+0xda>
c010a32c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a330:	8b 45 08             	mov    0x8(%ebp),%eax
c010a333:	83 c0 08             	add    $0x8,%eax
c010a336:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a339:	75 bf                	jne    c010a2fa <findElementInList+0x86>
c010a33b:	83 ec 0c             	sub    $0xc,%esp
c010a33e:	ff 75 ec             	pushl  -0x14(%ebp)
c010a341:	e8 fb ca ff ff       	call   c0106e41 <intr_set_status>
c010a346:	83 c4 10             	add    $0x10,%esp
c010a349:	b8 00 00 00 00       	mov    $0x0,%eax
c010a34e:	c9                   	leave  
c010a34f:	c3                   	ret    

c010a350 <appendToDoubleLinkList>:
c010a350:	55                   	push   %ebp
c010a351:	89 e5                	mov    %esp,%ebp
c010a353:	83 ec 18             	sub    $0x18,%esp
c010a356:	83 ec 08             	sub    $0x8,%esp
c010a359:	ff 75 0c             	pushl  0xc(%ebp)
c010a35c:	ff 75 08             	pushl  0x8(%ebp)
c010a35f:	e8 10 ff ff ff       	call   c010a274 <findElementInList>
c010a364:	83 c4 10             	add    $0x10,%esp
c010a367:	3c 01                	cmp    $0x1,%al
c010a369:	0f 84 c2 00 00 00    	je     c010a431 <appendToDoubleLinkList+0xe1>
c010a36f:	e8 a4 ca ff ff       	call   c0106e18 <intr_disable>
c010a374:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a377:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a37b:	75 1c                	jne    c010a399 <appendToDoubleLinkList+0x49>
c010a37d:	68 9e 00 00 00       	push   $0x9e
c010a382:	68 55 c1 10 c0       	push   $0xc010c155
c010a387:	68 55 c1 10 c0       	push   $0xc010c155
c010a38c:	68 68 c1 10 c0       	push   $0xc010c168
c010a391:	e8 ff e6 ff ff       	call   c0108a95 <assertion_failure>
c010a396:	83 c4 10             	add    $0x10,%esp
c010a399:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a39d:	75 1c                	jne    c010a3bb <appendToDoubleLinkList+0x6b>
c010a39f:	68 9f 00 00 00       	push   $0x9f
c010a3a4:	68 55 c1 10 c0       	push   $0xc010c155
c010a3a9:	68 55 c1 10 c0       	push   $0xc010c155
c010a3ae:	68 74 c1 10 c0       	push   $0xc010c174
c010a3b3:	e8 dd e6 ff ff       	call   c0108a95 <assertion_failure>
c010a3b8:	83 c4 10             	add    $0x10,%esp
c010a3bb:	83 ec 08             	sub    $0x8,%esp
c010a3be:	ff 75 0c             	pushl  0xc(%ebp)
c010a3c1:	ff 75 08             	pushl  0x8(%ebp)
c010a3c4:	e8 ab fe ff ff       	call   c010a274 <findElementInList>
c010a3c9:	83 c4 10             	add    $0x10,%esp
c010a3cc:	3c 01                	cmp    $0x1,%al
c010a3ce:	74 64                	je     c010a434 <appendToDoubleLinkList+0xe4>
c010a3d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a3d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a3d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3d9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a3e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3e3:	8b 50 04             	mov    0x4(%eax),%edx
c010a3e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3e9:	89 10                	mov    %edx,(%eax)
c010a3eb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3ee:	8b 50 08             	mov    0x8(%eax),%edx
c010a3f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3f4:	89 10                	mov    %edx,(%eax)
c010a3f6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3f9:	8b 40 08             	mov    0x8(%eax),%eax
c010a3fc:	85 c0                	test   %eax,%eax
c010a3fe:	74 0c                	je     c010a40c <appendToDoubleLinkList+0xbc>
c010a400:	8b 45 08             	mov    0x8(%ebp),%eax
c010a403:	8b 40 08             	mov    0x8(%eax),%eax
c010a406:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a409:	89 50 04             	mov    %edx,0x4(%eax)
c010a40c:	8b 45 08             	mov    0x8(%ebp),%eax
c010a40f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a412:	89 50 08             	mov    %edx,0x8(%eax)
c010a415:	8b 45 08             	mov    0x8(%ebp),%eax
c010a418:	8d 50 08             	lea    0x8(%eax),%edx
c010a41b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a41e:	89 50 04             	mov    %edx,0x4(%eax)
c010a421:	83 ec 0c             	sub    $0xc,%esp
c010a424:	ff 75 f4             	pushl  -0xc(%ebp)
c010a427:	e8 15 ca ff ff       	call   c0106e41 <intr_set_status>
c010a42c:	83 c4 10             	add    $0x10,%esp
c010a42f:	eb 04                	jmp    c010a435 <appendToDoubleLinkList+0xe5>
c010a431:	90                   	nop
c010a432:	eb 01                	jmp    c010a435 <appendToDoubleLinkList+0xe5>
c010a434:	90                   	nop
c010a435:	c9                   	leave  
c010a436:	c3                   	ret    

c010a437 <insertToDoubleLinkList>:
c010a437:	55                   	push   %ebp
c010a438:	89 e5                	mov    %esp,%ebp
c010a43a:	83 ec 18             	sub    $0x18,%esp
c010a43d:	83 ec 08             	sub    $0x8,%esp
c010a440:	ff 75 0c             	pushl  0xc(%ebp)
c010a443:	ff 75 08             	pushl  0x8(%ebp)
c010a446:	e8 29 fe ff ff       	call   c010a274 <findElementInList>
c010a44b:	83 c4 10             	add    $0x10,%esp
c010a44e:	3c 01                	cmp    $0x1,%al
c010a450:	74 65                	je     c010a4b7 <insertToDoubleLinkList+0x80>
c010a452:	e8 c1 c9 ff ff       	call   c0106e18 <intr_disable>
c010a457:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a45a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a45d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a460:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a463:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a46a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a46d:	8b 50 04             	mov    0x4(%eax),%edx
c010a470:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a473:	89 10                	mov    %edx,(%eax)
c010a475:	8b 45 08             	mov    0x8(%ebp),%eax
c010a478:	8b 50 04             	mov    0x4(%eax),%edx
c010a47b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a47e:	89 50 04             	mov    %edx,0x4(%eax)
c010a481:	8b 45 08             	mov    0x8(%ebp),%eax
c010a484:	8b 40 04             	mov    0x4(%eax),%eax
c010a487:	85 c0                	test   %eax,%eax
c010a489:	74 0b                	je     c010a496 <insertToDoubleLinkList+0x5f>
c010a48b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a48e:	8b 40 04             	mov    0x4(%eax),%eax
c010a491:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a494:	89 10                	mov    %edx,(%eax)
c010a496:	8b 45 08             	mov    0x8(%ebp),%eax
c010a499:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a49c:	89 50 04             	mov    %edx,0x4(%eax)
c010a49f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a4a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4a5:	89 10                	mov    %edx,(%eax)
c010a4a7:	83 ec 0c             	sub    $0xc,%esp
c010a4aa:	ff 75 f4             	pushl  -0xc(%ebp)
c010a4ad:	e8 8f c9 ff ff       	call   c0106e41 <intr_set_status>
c010a4b2:	83 c4 10             	add    $0x10,%esp
c010a4b5:	eb 01                	jmp    c010a4b8 <insertToDoubleLinkList+0x81>
c010a4b7:	90                   	nop
c010a4b8:	c9                   	leave  
c010a4b9:	c3                   	ret    

c010a4ba <popFromDoubleLinkList>:
c010a4ba:	55                   	push   %ebp
c010a4bb:	89 e5                	mov    %esp,%ebp
c010a4bd:	83 ec 18             	sub    $0x18,%esp
c010a4c0:	e8 53 c9 ff ff       	call   c0106e18 <intr_disable>
c010a4c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a4c8:	83 ec 0c             	sub    $0xc,%esp
c010a4cb:	ff 75 08             	pushl  0x8(%ebp)
c010a4ce:	e8 80 fd ff ff       	call   c010a253 <isListEmpty>
c010a4d3:	83 c4 10             	add    $0x10,%esp
c010a4d6:	3c 01                	cmp    $0x1,%al
c010a4d8:	75 07                	jne    c010a4e1 <popFromDoubleLinkList+0x27>
c010a4da:	b8 00 00 00 00       	mov    $0x0,%eax
c010a4df:	eb 6b                	jmp    c010a54c <popFromDoubleLinkList+0x92>
c010a4e1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4e4:	8b 40 08             	mov    0x8(%eax),%eax
c010a4e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a4ea:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4ed:	8b 40 08             	mov    0x8(%eax),%eax
c010a4f0:	85 c0                	test   %eax,%eax
c010a4f2:	75 07                	jne    c010a4fb <popFromDoubleLinkList+0x41>
c010a4f4:	b8 00 00 00 00       	mov    $0x0,%eax
c010a4f9:	eb 51                	jmp    c010a54c <popFromDoubleLinkList+0x92>
c010a4fb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4fe:	8b 40 08             	mov    0x8(%eax),%eax
c010a501:	8b 00                	mov    (%eax),%eax
c010a503:	85 c0                	test   %eax,%eax
c010a505:	74 11                	je     c010a518 <popFromDoubleLinkList+0x5e>
c010a507:	8b 45 08             	mov    0x8(%ebp),%eax
c010a50a:	8b 40 08             	mov    0x8(%eax),%eax
c010a50d:	8b 00                	mov    (%eax),%eax
c010a50f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a512:	83 c2 08             	add    $0x8,%edx
c010a515:	89 50 04             	mov    %edx,0x4(%eax)
c010a518:	8b 45 08             	mov    0x8(%ebp),%eax
c010a51b:	8b 40 08             	mov    0x8(%eax),%eax
c010a51e:	8b 10                	mov    (%eax),%edx
c010a520:	8b 45 08             	mov    0x8(%ebp),%eax
c010a523:	89 50 08             	mov    %edx,0x8(%eax)
c010a526:	83 ec 0c             	sub    $0xc,%esp
c010a529:	ff 75 f4             	pushl  -0xc(%ebp)
c010a52c:	e8 10 c9 ff ff       	call   c0106e41 <intr_set_status>
c010a531:	83 c4 10             	add    $0x10,%esp
c010a534:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a537:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a53e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a541:	8b 50 04             	mov    0x4(%eax),%edx
c010a544:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a547:	89 10                	mov    %edx,(%eax)
c010a549:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a54c:	c9                   	leave  
c010a54d:	c3                   	ret    

c010a54e <kernel_thread>:
c010a54e:	55                   	push   %ebp
c010a54f:	89 e5                	mov    %esp,%ebp
c010a551:	83 ec 08             	sub    $0x8,%esp
c010a554:	fb                   	sti    
c010a555:	83 ec 0c             	sub    $0xc,%esp
c010a558:	ff 75 0c             	pushl  0xc(%ebp)
c010a55b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a55e:	ff d0                	call   *%eax
c010a560:	83 c4 10             	add    $0x10,%esp
c010a563:	90                   	nop
c010a564:	c9                   	leave  
c010a565:	c3                   	ret    

c010a566 <thread_init>:
c010a566:	55                   	push   %ebp
c010a567:	89 e5                	mov    %esp,%ebp
c010a569:	83 ec 18             	sub    $0x18,%esp
c010a56c:	83 ec 08             	sub    $0x8,%esp
c010a56f:	6a 00                	push   $0x0
c010a571:	6a 01                	push   $0x1
c010a573:	e8 cf bd ff ff       	call   c0106347 <alloc_memory>
c010a578:	83 c4 10             	add    $0x10,%esp
c010a57b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a57e:	83 ec 04             	sub    $0x4,%esp
c010a581:	68 00 10 00 00       	push   $0x1000
c010a586:	6a 00                	push   $0x0
c010a588:	ff 75 f4             	pushl  -0xc(%ebp)
c010a58b:	e8 1f 1c 00 00       	call   c010c1af <Memset>
c010a590:	83 c4 10             	add    $0x10,%esp
c010a593:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a596:	05 00 10 00 00       	add    $0x1000,%eax
c010a59b:	89 c2                	mov    %eax,%edx
c010a59d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5a0:	89 10                	mov    %edx,(%eax)
c010a5a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5a5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a5ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5af:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a5b6:	ff ff ff 
c010a5b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5bc:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a5c3:	00 00 00 
c010a5c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5c9:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a5cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5d2:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a5d8:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a5dd:	83 c0 01             	add    $0x1,%eax
c010a5e0:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a5e5:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a5eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5ee:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a5f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5f7:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a5fe:	00 00 00 
c010a601:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a604:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a60b:	cd ab 99 
c010a60e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a611:	c9                   	leave  
c010a612:	c3                   	ret    

c010a613 <thread_create>:
c010a613:	55                   	push   %ebp
c010a614:	89 e5                	mov    %esp,%ebp
c010a616:	83 ec 10             	sub    $0x10,%esp
c010a619:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a620:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a627:	8b 45 08             	mov    0x8(%ebp),%eax
c010a62a:	8b 00                	mov    (%eax),%eax
c010a62c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a62f:	89 c2                	mov    %eax,%edx
c010a631:	8b 45 08             	mov    0x8(%ebp),%eax
c010a634:	89 10                	mov    %edx,(%eax)
c010a636:	8b 45 08             	mov    0x8(%ebp),%eax
c010a639:	8b 00                	mov    (%eax),%eax
c010a63b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a63e:	89 c2                	mov    %eax,%edx
c010a640:	8b 45 08             	mov    0x8(%ebp),%eax
c010a643:	89 10                	mov    %edx,(%eax)
c010a645:	90                   	nop
c010a646:	c9                   	leave  
c010a647:	c3                   	ret    

c010a648 <thread_start>:
c010a648:	55                   	push   %ebp
c010a649:	89 e5                	mov    %esp,%ebp
c010a64b:	83 ec 18             	sub    $0x18,%esp
c010a64e:	e8 13 ff ff ff       	call   c010a566 <thread_init>
c010a653:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a656:	83 ec 0c             	sub    $0xc,%esp
c010a659:	ff 75 f4             	pushl  -0xc(%ebp)
c010a65c:	e8 b2 ff ff ff       	call   c010a613 <thread_create>
c010a661:	83 c4 10             	add    $0x10,%esp
c010a664:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a667:	05 28 01 00 00       	add    $0x128,%eax
c010a66c:	83 ec 08             	sub    $0x8,%esp
c010a66f:	ff 75 10             	pushl  0x10(%ebp)
c010a672:	50                   	push   %eax
c010a673:	e8 56 1b 00 00       	call   c010c1ce <Strcpy>
c010a678:	83 c4 10             	add    $0x10,%esp
c010a67b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a67e:	8b 00                	mov    (%eax),%eax
c010a680:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a683:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a686:	c7 40 10 4e a5 10 c0 	movl   $0xc010a54e,0x10(%eax)
c010a68d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a690:	8b 55 08             	mov    0x8(%ebp),%edx
c010a693:	89 50 18             	mov    %edx,0x18(%eax)
c010a696:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a699:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a69c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a69f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6a2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a6a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6ab:	8b 10                	mov    (%eax),%edx
c010a6ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6b0:	89 50 04             	mov    %edx,0x4(%eax)
c010a6b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6b6:	8b 50 04             	mov    0x4(%eax),%edx
c010a6b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6bc:	89 50 08             	mov    %edx,0x8(%eax)
c010a6bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6c2:	8b 50 08             	mov    0x8(%eax),%edx
c010a6c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a6c8:	89 50 0c             	mov    %edx,0xc(%eax)
c010a6cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6ce:	05 60 02 00 00       	add    $0x260,%eax
c010a6d3:	83 ec 08             	sub    $0x8,%esp
c010a6d6:	50                   	push   %eax
c010a6d7:	68 ec fd 10 c0       	push   $0xc010fdec
c010a6dc:	e8 6f fc ff ff       	call   c010a350 <appendToDoubleLinkList>
c010a6e1:	83 c4 10             	add    $0x10,%esp
c010a6e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6e7:	05 6a 02 00 00       	add    $0x26a,%eax
c010a6ec:	83 ec 08             	sub    $0x8,%esp
c010a6ef:	50                   	push   %eax
c010a6f0:	68 04 0f 11 c0       	push   $0xc0110f04
c010a6f5:	e8 56 fc ff ff       	call   c010a350 <appendToDoubleLinkList>
c010a6fa:	83 c4 10             	add    $0x10,%esp
c010a6fd:	90                   	nop
c010a6fe:	c9                   	leave  
c010a6ff:	c3                   	ret    

c010a700 <Buf>:
	...

c010a716 <My_Buf>:
c010a716:	48                   	dec    %eax
c010a717:	65 6c                	gs insb (%dx),%es:(%edi)
c010a719:	6c                   	insb   (%dx),%es:(%edi)
c010a71a:	6f                   	outsl  %ds:(%esi),(%dx)
c010a71b:	2c 57                	sub    $0x57,%al
c010a71d:	6f                   	outsl  %ds:(%esi),(%dx)
c010a71e:	72 6c                	jb     c010a78c <DriverInitialize+0x69>
c010a720:	64 5c                	fs pop %esp
c010a722:	30                   	.byte 0x30

c010a723 <DriverInitialize>:
c010a723:	56                   	push   %esi
c010a724:	57                   	push   %edi
c010a725:	53                   	push   %ebx
c010a726:	55                   	push   %ebp
c010a727:	51                   	push   %ecx
c010a728:	89 e5                	mov    %esp,%ebp
c010a72a:	b0 21                	mov    $0x21,%al
c010a72c:	66 ba 00 03          	mov    $0x300,%dx
c010a730:	ee                   	out    %al,(%dx)
c010a731:	b0 59                	mov    $0x59,%al
c010a733:	66 ba 0e 03          	mov    $0x30e,%dx
c010a737:	ee                   	out    %al,(%dx)
c010a738:	66 ba 0a 03          	mov    $0x30a,%dx
c010a73c:	66 31 c0             	xor    %ax,%ax
c010a73f:	b0 00                	mov    $0x0,%al
c010a741:	ee                   	out    %al,(%dx)
c010a742:	66 ba 0b 03          	mov    $0x30b,%dx
c010a746:	b0 01                	mov    $0x1,%al
c010a748:	ee                   	out    %al,(%dx)
c010a749:	b0 10                	mov    $0x10,%al
c010a74b:	66 ba 0c 03          	mov    $0x30c,%dx
c010a74f:	ee                   	out    %al,(%dx)
c010a750:	b0 20                	mov    $0x20,%al
c010a752:	66 ba 04 03          	mov    $0x304,%dx
c010a756:	ee                   	out    %al,(%dx)
c010a757:	b0 02                	mov    $0x2,%al
c010a759:	66 ba 0d 03          	mov    $0x30d,%dx
c010a75d:	ee                   	out    %al,(%dx)
c010a75e:	b0 40                	mov    $0x40,%al
c010a760:	66 ba 01 03          	mov    $0x301,%dx
c010a764:	ee                   	out    %al,(%dx)
c010a765:	66 ba 03 03          	mov    $0x303,%dx
c010a769:	ee                   	out    %al,(%dx)
c010a76a:	b0 60                	mov    $0x60,%al
c010a76c:	66 ba 02 03          	mov    $0x302,%dx
c010a770:	ee                   	out    %al,(%dx)
c010a771:	b0 61                	mov    $0x61,%al
c010a773:	66 ba 00 03          	mov    $0x300,%dx
c010a777:	ee                   	out    %al,(%dx)
c010a778:	b0 40                	mov    $0x40,%al
c010a77a:	66 ba 07 03          	mov    $0x307,%dx
c010a77e:	ee                   	out    %al,(%dx)
c010a77f:	b0 22                	mov    $0x22,%al
c010a781:	66 ba 00 03          	mov    $0x300,%dx
c010a785:	ee                   	out    %al,(%dx)
c010a786:	b0 ff                	mov    $0xff,%al
c010a788:	66 ba 07 03          	mov    $0x307,%dx
c010a78c:	ee                   	out    %al,(%dx)
c010a78d:	b0 fb                	mov    $0xfb,%al
c010a78f:	66 ba 0f 03          	mov    $0x30f,%dx
c010a793:	ee                   	out    %al,(%dx)
c010a794:	66 ba 0d 03          	mov    $0x30d,%dx
c010a798:	b0 00                	mov    $0x0,%al
c010a79a:	ee                   	out    %al,(%dx)
c010a79b:	68 00 40 00 00       	push   $0x4000
c010a7a0:	e8 08 00 00 00       	call   c010a7ad <SetPageStart>
c010a7a5:	89 ec                	mov    %ebp,%esp
c010a7a7:	59                   	pop    %ecx
c010a7a8:	5d                   	pop    %ebp
c010a7a9:	5b                   	pop    %ebx
c010a7aa:	5f                   	pop    %edi
c010a7ab:	5e                   	pop    %esi
c010a7ac:	c3                   	ret    

c010a7ad <SetPageStart>:
c010a7ad:	56                   	push   %esi
c010a7ae:	57                   	push   %edi
c010a7af:	53                   	push   %ebx
c010a7b0:	55                   	push   %ebp
c010a7b1:	51                   	push   %ecx
c010a7b2:	89 e5                	mov    %esp,%ebp
c010a7b4:	66 ba 08 03          	mov    $0x308,%dx
c010a7b8:	66 31 c0             	xor    %ax,%ax
c010a7bb:	66 8b 45 18          	mov    0x18(%ebp),%ax
c010a7bf:	ee                   	out    %al,(%dx)
c010a7c0:	66 ba 09 03          	mov    $0x309,%dx
c010a7c4:	66 25 00 ff          	and    $0xff00,%ax
c010a7c8:	66 c1 e8 08          	shr    $0x8,%ax
c010a7cc:	ee                   	out    %al,(%dx)
c010a7cd:	89 ec                	mov    %ebp,%esp
c010a7cf:	59                   	pop    %ecx
c010a7d0:	5d                   	pop    %ebp
c010a7d1:	5b                   	pop    %ebx
c010a7d2:	5f                   	pop    %edi
c010a7d3:	5e                   	pop    %esi
c010a7d4:	c3                   	ret    

c010a7d5 <DriverSend>:
c010a7d5:	56                   	push   %esi
c010a7d6:	57                   	push   %edi
c010a7d7:	53                   	push   %ebx
c010a7d8:	55                   	push   %ebp
c010a7d9:	51                   	push   %ecx
c010a7da:	89 e5                	mov    %esp,%ebp
c010a7dc:	66 ba 00 03          	mov    $0x300,%dx
c010a7e0:	ec                   	in     (%dx),%al
c010a7e1:	3c 26                	cmp    $0x26,%al
c010a7e3:	74 54                	je     c010a839 <QueueIt>
c010a7e5:	66 51                	push   %cx
c010a7e7:	24 3f                	and    $0x3f,%al
c010a7e9:	ee                   	out    %al,(%dx)
c010a7ea:	66 ba 08 03          	mov    $0x308,%dx
c010a7ee:	66 31 c0             	xor    %ax,%ax
c010a7f1:	66 b8 00 40          	mov    $0x4000,%ax
c010a7f5:	ee                   	out    %al,(%dx)
c010a7f6:	66 ba 09 03          	mov    $0x309,%dx
c010a7fa:	66 25 00 ff          	and    $0xff00,%ax
c010a7fe:	66 c1 e8 08          	shr    $0x8,%ax
c010a802:	ee                   	out    %al,(%dx)
c010a803:	ff 75 18             	pushl  0x18(%ebp)
c010a806:	e8 3f 00 00 00       	call   c010a84a <PCtoNIC>
c010a80b:	83 c4 04             	add    $0x4,%esp
c010a80e:	eb 2a                	jmp    c010a83a <Finished>
c010a810:	66 ba 04 03          	mov    $0x304,%dx
c010a814:	b0 40                	mov    $0x40,%al
c010a816:	66 b8 00 40          	mov    $0x4000,%ax
c010a81a:	66 c1 e8 08          	shr    $0x8,%ax
c010a81e:	66 ef                	out    %ax,(%dx)
c010a820:	66 59                	pop    %cx
c010a822:	66 ba 05 03          	mov    $0x305,%dx
c010a826:	88 c8                	mov    %cl,%al
c010a828:	ee                   	out    %al,(%dx)
c010a829:	66 ba 06 03          	mov    $0x306,%dx
c010a82d:	88 e8                	mov    %ch,%al
c010a82f:	ee                   	out    %al,(%dx)
c010a830:	66 ba 00 03          	mov    $0x300,%dx
c010a834:	b0 26                	mov    $0x26,%al
c010a836:	ee                   	out    %al,(%dx)
c010a837:	eb 01                	jmp    c010a83a <Finished>

c010a839 <QueueIt>:
c010a839:	90                   	nop

c010a83a <Finished>:
c010a83a:	89 ec                	mov    %ebp,%esp
c010a83c:	59                   	pop    %ecx
c010a83d:	5d                   	pop    %ebp
c010a83e:	5b                   	pop    %ebx
c010a83f:	5f                   	pop    %edi
c010a840:	5e                   	pop    %esi
c010a841:	c3                   	ret    

c010a842 <MyEnd>:
c010a842:	89 ec                	mov    %ebp,%esp
c010a844:	59                   	pop    %ecx
c010a845:	5d                   	pop    %ebp
c010a846:	5b                   	pop    %ebx
c010a847:	5f                   	pop    %edi
c010a848:	5e                   	pop    %esi
c010a849:	c3                   	ret    

c010a84a <PCtoNIC>:
c010a84a:	56                   	push   %esi
c010a84b:	57                   	push   %edi
c010a84c:	53                   	push   %ebx
c010a84d:	55                   	push   %ebp
c010a84e:	51                   	push   %ecx
c010a84f:	89 e5                	mov    %esp,%ebp
c010a851:	66 bb 20 00          	mov    $0x20,%bx
c010a855:	66 ba 0a 03          	mov    $0x30a,%dx
c010a859:	88 d8                	mov    %bl,%al
c010a85b:	ee                   	out    %al,(%dx)
c010a85c:	66 ba 0b 03          	mov    $0x30b,%dx
c010a860:	88 f8                	mov    %bh,%al
c010a862:	ee                   	out    %al,(%dx)
c010a863:	66 ba 00 03          	mov    $0x300,%dx
c010a867:	b0 12                	mov    $0x12,%al
c010a869:	ee                   	out    %al,(%dx)
c010a86a:	66 ba 10 03          	mov    $0x310,%dx
c010a86e:	66 b9 20 00          	mov    $0x20,%cx
c010a872:	66 d1 e9             	shr    %cx
c010a875:	66 b8 59 00          	mov    $0x59,%ax
c010a879:	31 f6                	xor    %esi,%esi
c010a87b:	8b 74 24 18          	mov    0x18(%esp),%esi
c010a87f:	68 00 40 00 00       	push   $0x4000
c010a884:	e8 24 ff ff ff       	call   c010a7ad <SetPageStart>
c010a889:	66 ba 10 03          	mov    $0x310,%dx

c010a88d <Writing_Word>:
c010a88d:	66 31 c0             	xor    %ax,%ax
c010a890:	66 ad                	lods   %ds:(%esi),%ax
c010a892:	66 ef                	out    %ax,(%dx)
c010a894:	e2 f7                	loop   c010a88d <Writing_Word>
c010a896:	66 b9 00 00          	mov    $0x0,%cx
c010a89a:	66 ba 07 03          	mov    $0x307,%dx

c010a89e <CheckDMA>:
c010a89e:	ec                   	in     (%dx),%al
c010a89f:	a8 40                	test   $0x40,%al
c010a8a1:	75 02                	jne    c010a8a5 <toNICEND>
c010a8a3:	eb f9                	jmp    c010a89e <CheckDMA>

c010a8a5 <toNICEND>:
c010a8a5:	66 ba 07 03          	mov    $0x307,%dx
c010a8a9:	b0 00                	mov    $0x0,%al
c010a8ab:	ee                   	out    %al,(%dx)
c010a8ac:	f8                   	clc    
c010a8ad:	89 ec                	mov    %ebp,%esp
c010a8af:	59                   	pop    %ecx
c010a8b0:	5d                   	pop    %ebp
c010a8b1:	5b                   	pop    %ebx
c010a8b2:	5f                   	pop    %edi
c010a8b3:	5e                   	pop    %esi
c010a8b4:	c3                   	ret    

c010a8b5 <get_interrupt_status>:
c010a8b5:	56                   	push   %esi
c010a8b6:	57                   	push   %edi
c010a8b7:	53                   	push   %ebx
c010a8b8:	55                   	push   %ebp
c010a8b9:	51                   	push   %ecx
c010a8ba:	89 e5                	mov    %esp,%ebp
c010a8bc:	66 ba 07 03          	mov    $0x307,%dx
c010a8c0:	31 c0                	xor    %eax,%eax
c010a8c2:	ec                   	in     (%dx),%al
c010a8c3:	89 ec                	mov    %ebp,%esp
c010a8c5:	59                   	pop    %ecx
c010a8c6:	5d                   	pop    %ebp
c010a8c7:	5b                   	pop    %ebx
c010a8c8:	5f                   	pop    %edi
c010a8c9:	5e                   	pop    %esi
c010a8ca:	c3                   	ret    

c010a8cb <set_interrupt_status>:
c010a8cb:	56                   	push   %esi
c010a8cc:	57                   	push   %edi
c010a8cd:	53                   	push   %ebx
c010a8ce:	55                   	push   %ebp
c010a8cf:	51                   	push   %ecx
c010a8d0:	89 e5                	mov    %esp,%ebp
c010a8d2:	66 ba 07 03          	mov    $0x307,%dx
c010a8d6:	31 c0                	xor    %eax,%eax
c010a8d8:	8b 45 18             	mov    0x18(%ebp),%eax
c010a8db:	ee                   	out    %al,(%dx)
c010a8dc:	89 ec                	mov    %ebp,%esp
c010a8de:	59                   	pop    %ecx
c010a8df:	5d                   	pop    %ebp
c010a8e0:	5b                   	pop    %ebx
c010a8e1:	5f                   	pop    %edi
c010a8e2:	5e                   	pop    %esi
c010a8e3:	c3                   	ret    

c010a8e4 <NICtoPC>:
c010a8e4:	56                   	push   %esi
c010a8e5:	57                   	push   %edi
c010a8e6:	53                   	push   %ebx
c010a8e7:	55                   	push   %ebp
c010a8e8:	51                   	push   %ecx
c010a8e9:	89 e5                	mov    %esp,%ebp
c010a8eb:	66 bb 80 00          	mov    $0x80,%bx
c010a8ef:	66 ba 0a 03          	mov    $0x30a,%dx
c010a8f3:	88 d8                	mov    %bl,%al
c010a8f5:	ee                   	out    %al,(%dx)
c010a8f6:	66 ba 0b 03          	mov    $0x30b,%dx
c010a8fa:	88 f8                	mov    %bh,%al
c010a8fc:	ee                   	out    %al,(%dx)
c010a8fd:	66 ba 00 03          	mov    $0x300,%dx
c010a901:	b0 0a                	mov    $0xa,%al
c010a903:	ee                   	out    %al,(%dx)
c010a904:	66 ba 10 03          	mov    $0x310,%dx
c010a908:	68 00 40 00 00       	push   $0x4000
c010a90d:	e8 9b fe ff ff       	call   c010a7ad <SetPageStart>
c010a912:	66 ba 10 03          	mov    $0x310,%dx
c010a916:	66 b9 80 00          	mov    $0x80,%cx
c010a91a:	66 d1 e9             	shr    %cx
c010a91d:	bf 00 a7 10 c0       	mov    $0xc010a700,%edi
c010a922:	8b 7d 18             	mov    0x18(%ebp),%edi

c010a925 <READING_Word_NICtoPC>:
c010a925:	31 c0                	xor    %eax,%eax
c010a927:	66 ba 10 03          	mov    $0x310,%dx
c010a92b:	66 ed                	in     (%dx),%ax
c010a92d:	66 ab                	stos   %ax,%es:(%edi)
c010a92f:	e2 f4                	loop   c010a925 <READING_Word_NICtoPC>
c010a931:	66 ba 07 03          	mov    $0x307,%dx

c010a935 <CheckDMA_NICtoPC>:
c010a935:	ec                   	in     (%dx),%al
c010a936:	a8 40                	test   $0x40,%al
c010a938:	75 02                	jne    c010a93c <ReadEnd>
c010a93a:	eb f9                	jmp    c010a935 <CheckDMA_NICtoPC>

c010a93c <ReadEnd>:
c010a93c:	ee                   	out    %al,(%dx)
c010a93d:	b8 20 00 00 00       	mov    $0x20,%eax
c010a942:	89 ec                	mov    %ebp,%esp
c010a944:	59                   	pop    %ecx
c010a945:	5d                   	pop    %ebp
c010a946:	5b                   	pop    %ebx
c010a947:	5f                   	pop    %edi
c010a948:	5e                   	pop    %esi
c010a949:	c3                   	ret    
