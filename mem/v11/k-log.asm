
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
c0100025:	e8 41 3e 00 00       	call   c0103e6b <ReloadGDT>
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
c0100198:	e8 13 73 00 00       	call   c01074b0 <exception_handler>
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
c01001b5:	e8 f6 72 00 00       	call   c01074b0 <exception_handler>
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
c01001e3:	e8 4d 38 00 00       	call   c0103a35 <clock_handler>
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
c0100216:	e8 a5 47 00 00       	call   c01049c0 <keyboard_handler>
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
c010038e:	e8 b7 6f 00 00       	call   c010734a <disp_int>
c0100393:	83 c4 04             	add    $0x4,%esp
c0100396:	58                   	pop    %eax
c0100397:	5a                   	pop    %edx
c0100398:	52                   	push   %edx
c0100399:	50                   	push   %eax
c010039a:	e8 ab 6f 00 00       	call   c010734a <disp_int>
c010039f:	58                   	pop    %eax
c01003a0:	5a                   	pop    %edx
c01003a1:	52                   	push   %edx
c01003a2:	50                   	push   %eax
c01003a3:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c01003a9:	e8 9c 6f 00 00       	call   c010734a <disp_int>
c01003ae:	83 c4 04             	add    $0x4,%esp
c01003b1:	58                   	pop    %eax
c01003b2:	5a                   	pop    %edx
c01003b3:	52                   	push   %edx
c01003b4:	50                   	push   %eax
c01003b5:	ff 72 ec             	pushl  -0x14(%edx)
c01003b8:	e8 8d 6f 00 00       	call   c010734a <disp_int>
c01003bd:	83 c4 04             	add    $0x4,%esp
c01003c0:	58                   	pop    %eax
c01003c1:	5a                   	pop    %edx
c01003c2:	52                   	push   %edx
c01003c3:	50                   	push   %eax
c01003c4:	ff 70 ec             	pushl  -0x14(%eax)
c01003c7:	e8 7e 6f 00 00       	call   c010734a <disp_int>
c01003cc:	83 c4 04             	add    $0x4,%esp
c01003cf:	58                   	pop    %eax
c01003d0:	5a                   	pop    %edx
c01003d1:	52                   	push   %edx
c01003d2:	50                   	push   %eax
c01003d3:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c01003d9:	e8 6c 6f 00 00       	call   c010734a <disp_int>
c01003de:	83 c4 04             	add    $0x4,%esp
c01003e1:	58                   	pop    %eax
c01003e2:	5a                   	pop    %edx
c01003e3:	52                   	push   %edx
c01003e4:	50                   	push   %eax
c01003e5:	68 60 f7 10 c0       	push   $0xc010f760
c01003ea:	e8 5b 6f 00 00       	call   c010734a <disp_int>
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
c01004dc:	e8 4f 9f 00 00       	call   c010a430 <appendToDoubleLinkList>
c01004e1:	83 c4 10             	add    $0x10,%esp
c01004e4:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01004e9:	05 6a 02 00 00       	add    $0x26a,%eax
c01004ee:	83 ec 08             	sub    $0x8,%esp
c01004f1:	50                   	push   %eax
c01004f2:	68 ec fd 10 c0       	push   $0xc010fdec
c01004f7:	e8 34 9f 00 00       	call   c010a430 <appendToDoubleLinkList>
c01004fc:	83 c4 10             	add    $0x10,%esp
c01004ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100502:	83 ec 0c             	sub    $0xc,%esp
c0100505:	50                   	push   %eax
c0100506:	6a 00                	push   $0x0
c0100508:	68 0c b0 10 c0       	push   $0xc010b00c
c010050d:	68 13 b0 10 c0       	push   $0xc010b013
c0100512:	68 27 54 10 c0       	push   $0xc0105427
c0100517:	e8 55 9c 00 00       	call   c010a171 <process_execute>
c010051c:	83 c4 20             	add    $0x20,%esp
c010051f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100522:	83 ec 0c             	sub    $0xc,%esp
c0100525:	50                   	push   %eax
c0100526:	6a 00                	push   $0x0
c0100528:	68 1c b0 10 c0       	push   $0xc010b01c
c010052d:	68 24 b0 10 c0       	push   $0xc010b024
c0100532:	68 d9 18 10 c0       	push   $0xc01018d9
c0100537:	e8 35 9c 00 00       	call   c010a171 <process_execute>
c010053c:	83 c4 20             	add    $0x20,%esp
c010053f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100542:	83 ec 0c             	sub    $0xc,%esp
c0100545:	50                   	push   %eax
c0100546:	6a 00                	push   $0x0
c0100548:	68 2d b0 10 c0       	push   $0xc010b02d
c010054d:	68 34 b0 10 c0       	push   $0xc010b034
c0100552:	68 21 08 10 c0       	push   $0xc0100821
c0100557:	e8 15 9c 00 00       	call   c010a171 <process_execute>
c010055c:	83 c4 20             	add    $0x20,%esp
c010055f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100562:	83 ec 0c             	sub    $0xc,%esp
c0100565:	50                   	push   %eax
c0100566:	6a 00                	push   $0x0
c0100568:	68 3d b0 10 c0       	push   $0xc010b03d
c010056d:	68 45 b0 10 c0       	push   $0xc010b045
c0100572:	68 bd 48 10 c0       	push   $0xc01048bd
c0100577:	e8 f5 9b 00 00       	call   c010a171 <process_execute>
c010057c:	83 c4 20             	add    $0x20,%esp
c010057f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100582:	83 e8 02             	sub    $0x2,%eax
c0100585:	83 ec 0c             	sub    $0xc,%esp
c0100588:	50                   	push   %eax
c0100589:	6a 01                	push   $0x1
c010058b:	68 4f b0 10 c0       	push   $0xc010b04f
c0100590:	68 59 b0 10 c0       	push   $0xc010b059
c0100595:	68 3e 07 10 c0       	push   $0xc010073e
c010059a:	e8 d2 9b 00 00       	call   c010a171 <process_execute>
c010059f:	83 c4 20             	add    $0x20,%esp
c01005a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01005a5:	83 e8 03             	sub    $0x3,%eax
c01005a8:	83 ec 0c             	sub    $0xc,%esp
c01005ab:	50                   	push   %eax
c01005ac:	6a 01                	push   $0x1
c01005ae:	68 66 b0 10 c0       	push   $0xc010b066
c01005b3:	68 70 b0 10 c0       	push   $0xc010b070
c01005b8:	68 09 08 10 c0       	push   $0xc0100809
c01005bd:	e8 af 9b 00 00       	call   c010a171 <process_execute>
c01005c2:	83 c4 20             	add    $0x20,%esp
c01005c5:	83 ec 0c             	sub    $0xc,%esp
c01005c8:	68 7d b0 10 c0       	push   $0xc010b07d
c01005cd:	e8 07 fb ff ff       	call   c01000d9 <disp_str>
c01005d2:	83 c4 10             	add    $0x10,%esp
c01005d5:	fb                   	sti    
c01005d6:	e8 93 68 00 00       	call   c0106e6e <stop_here>
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
c0100640:	e8 55 72 00 00       	call   c010789a <init_keyboard>
c0100645:	83 ec 0c             	sub    $0xc,%esp
c0100648:	68 00 00 00 04       	push   $0x4000000
c010064d:	e8 d3 66 00 00       	call   c0106d25 <init_memory>
c0100652:	83 c4 10             	add    $0x10,%esp
c0100655:	83 ec 0c             	sub    $0xc,%esp
c0100658:	68 ec fd 10 c0       	push   $0xc010fdec
c010065d:	e8 a3 9c 00 00       	call   c010a305 <initDoubleLinkList>
c0100662:	83 c4 10             	add    $0x10,%esp
c0100665:	83 ec 0c             	sub    $0xc,%esp
c0100668:	68 04 0f 11 c0       	push   $0xc0110f04
c010066d:	e8 93 9c 00 00       	call   c010a305 <initDoubleLinkList>
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
c0100768:	e8 3f 11 00 00       	call   c01018ac <sys_malloc>
c010076d:	83 c4 10             	add    $0x10,%esp
c0100770:	a3 bc 06 11 c0       	mov    %eax,0xc01106bc
c0100775:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100778:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c010077d:	83 ec 04             	sub    $0x4,%esp
c0100780:	52                   	push   %edx
c0100781:	6a 00                	push   $0x0
c0100783:	50                   	push   %eax
c0100784:	e8 e6 ba 00 00       	call   c010c26f <Memset>
c0100789:	83 c4 10             	add    $0x10,%esp
c010078c:	c7 45 ec c3 b0 10 c0 	movl   $0xc010b0c3,-0x14(%ebp)
c0100793:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100798:	83 ec 08             	sub    $0x8,%esp
c010079b:	ff 75 ec             	pushl  -0x14(%ebp)
c010079e:	50                   	push   %eax
c010079f:	e8 ea ba 00 00       	call   c010c28e <Strcpy>
c01007a4:	83 c4 10             	add    $0x10,%esp
c01007a7:	c6 05 d1 06 11 c0 04 	movb   $0x4,0xc01106d1
c01007ae:	e8 50 a0 00 00       	call   c010a803 <DriverInitialize>
c01007b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01007ba:	eb 15                	jmp    c01007d1 <user_proc_a+0x93>
c01007bc:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c01007c1:	83 ec 0c             	sub    $0xc,%esp
c01007c4:	50                   	push   %eax
c01007c5:	e8 eb a0 00 00       	call   c010a8b5 <DriverSend>
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
c0100839:	e8 6e 10 00 00       	call   c01018ac <sys_malloc>
c010083e:	83 c4 10             	add    $0x10,%esp
c0100841:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100844:	83 ec 04             	sub    $0x4,%esp
c0100847:	6a 7c                	push   $0x7c
c0100849:	6a 00                	push   $0x0
c010084b:	ff 75 f0             	pushl  -0x10(%ebp)
c010084e:	e8 1c ba 00 00       	call   c010c26f <Memset>
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
c0100890:	e8 50 8f 00 00       	call   c01097e5 <send_rec>
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
c0100913:	e8 5d 82 00 00       	call   c0108b75 <assertion_failure>
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
c0100974:	e8 b8 81 00 00       	call   c0108b31 <spin>
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
c010099a:	e8 66 0d 00 00       	call   c0101705 <waitfor>
c010099f:	83 c4 10             	add    $0x10,%esp
c01009a2:	85 c0                	test   %eax,%eax
c01009a4:	75 10                	jne    c01009b6 <hd_cmd_out+0x31>
c01009a6:	83 ec 0c             	sub    $0xc,%esp
c01009a9:	68 a8 b1 10 c0       	push   $0xc010b1a8
c01009ae:	e8 a4 81 00 00       	call   c0108b57 <panic>
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
c0100b0a:	e8 60 b7 00 00       	call   c010c26f <Memset>
c0100b0f:	83 c4 10             	add    $0x10,%esp
c0100b12:	83 ec 04             	sub    $0x4,%esp
c0100b15:	ff 75 f4             	pushl  -0xc(%ebp)
c0100b18:	ff 75 ec             	pushl  -0x14(%ebp)
c0100b1b:	68 f0 01 00 00       	push   $0x1f0
c0100b20:	e8 9e b7 00 00       	call   c010c2c3 <read_port>
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
c0100c88:	e8 01 b6 00 00       	call   c010c28e <Strcpy>
c0100c8d:	83 c4 10             	add    $0x10,%esp
c0100c90:	eb 13                	jmp    c0100ca5 <print_hdinfo+0x167>
c0100c92:	83 ec 08             	sub    $0x8,%esp
c0100c95:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c98:	50                   	push   %eax
c0100c99:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c9c:	50                   	push   %eax
c0100c9d:	e8 ec b5 00 00       	call   c010c28e <Strcpy>
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
c0100ce1:	e8 32 7b 00 00       	call   c0108818 <Printf>
c0100ce6:	83 c4 10             	add    $0x10,%esp
c0100ce9:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cec:	8b 40 0c             	mov    0xc(%eax),%eax
c0100cef:	83 ec 08             	sub    $0x8,%esp
c0100cf2:	50                   	push   %eax
c0100cf3:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100cf8:	e8 1b 7b 00 00       	call   c0108818 <Printf>
c0100cfd:	83 c4 10             	add    $0x10,%esp
c0100d00:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d03:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100d07:	0f b6 c0             	movzbl %al,%eax
c0100d0a:	83 ec 08             	sub    $0x8,%esp
c0100d0d:	50                   	push   %eax
c0100d0e:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100d13:	e8 00 7b 00 00       	call   c0108818 <Printf>
c0100d18:	83 c4 10             	add    $0x10,%esp
c0100d1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d1e:	0f b6 00             	movzbl (%eax),%eax
c0100d21:	0f b6 c0             	movzbl %al,%eax
c0100d24:	83 ec 08             	sub    $0x8,%esp
c0100d27:	50                   	push   %eax
c0100d28:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100d2d:	e8 e6 7a 00 00       	call   c0108818 <Printf>
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
c0100dd1:	e8 99 b4 00 00       	call   c010c26f <Memset>
c0100dd6:	83 c4 10             	add    $0x10,%esp
c0100dd9:	83 ec 04             	sub    $0x4,%esp
c0100ddc:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ddf:	ff 75 ec             	pushl  -0x14(%ebp)
c0100de2:	68 f0 01 00 00       	push   $0x1f0
c0100de7:	e8 d7 b4 00 00       	call   c010c2c3 <read_port>
c0100dec:	83 c4 10             	add    $0x10,%esp
c0100def:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100df2:	05 be 01 00 00       	add    $0x1be,%eax
c0100df7:	83 ec 04             	sub    $0x4,%esp
c0100dfa:	6a 40                	push   $0x40
c0100dfc:	50                   	push   %eax
c0100dfd:	ff 75 10             	pushl  0x10(%ebp)
c0100e00:	e8 57 61 00 00       	call   c0106f5c <Memcpy>
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
c0100e6e:	e8 fc b3 00 00       	call   c010c26f <Memset>
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
c0100fa0:	e8 ca b2 00 00       	call   c010c26f <Memset>
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
c0101082:	e8 25 08 00 00       	call   c01018ac <sys_malloc>
c0101087:	83 c4 10             	add    $0x10,%esp
c010108a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010108d:	83 ec 04             	sub    $0x4,%esp
c0101090:	6a 7c                	push   $0x7c
c0101092:	6a 00                	push   $0x0
c0101094:	ff 75 f0             	pushl  -0x10(%ebp)
c0101097:	e8 d3 b1 00 00       	call   c010c26f <Memset>
c010109c:	83 c4 10             	add    $0x10,%esp
c010109f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01010a2:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01010a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01010ac:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01010b3:	83 ec 04             	sub    $0x4,%esp
c01010b6:	6a 02                	push   $0x2
c01010b8:	ff 75 f0             	pushl  -0x10(%ebp)
c01010bb:	6a 01                	push   $0x1
c01010bd:	e8 23 87 00 00       	call   c01097e5 <send_rec>
c01010c2:	83 c4 10             	add    $0x10,%esp
c01010c5:	83 ec 08             	sub    $0x8,%esp
c01010c8:	6a 7c                	push   $0x7c
c01010ca:	ff 75 f0             	pushl  -0x10(%ebp)
c01010cd:	e8 ef 07 00 00       	call   c01018c1 <sys_free>
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
c0101131:	e8 76 07 00 00       	call   c01018ac <sys_malloc>
c0101136:	83 c4 10             	add    $0x10,%esp
c0101139:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010113c:	83 ec 04             	sub    $0x4,%esp
c010113f:	6a 7c                	push   $0x7c
c0101141:	6a 00                	push   $0x0
c0101143:	ff 75 ec             	pushl  -0x14(%ebp)
c0101146:	e8 24 b1 00 00       	call   c010c26f <Memset>
c010114b:	83 c4 10             	add    $0x10,%esp
c010114e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101151:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101158:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010115b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101162:	83 ec 04             	sub    $0x4,%esp
c0101165:	6a 02                	push   $0x2
c0101167:	ff 75 ec             	pushl  -0x14(%ebp)
c010116a:	6a 01                	push   $0x1
c010116c:	e8 74 86 00 00       	call   c01097e5 <send_rec>
c0101171:	83 c4 10             	add    $0x10,%esp
c0101174:	83 ec 08             	sub    $0x8,%esp
c0101177:	6a 7c                	push   $0x7c
c0101179:	ff 75 ec             	pushl  -0x14(%ebp)
c010117c:	e8 40 07 00 00       	call   c01018c1 <sys_free>
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
c010119b:	e8 65 05 00 00       	call   c0101705 <waitfor>
c01011a0:	83 c4 10             	add    $0x10,%esp
c01011a3:	85 c0                	test   %eax,%eax
c01011a5:	75 10                	jne    c01011b7 <wait_for+0x2e>
c01011a7:	83 ec 0c             	sub    $0xc,%esp
c01011aa:	68 e4 b1 10 c0       	push   $0xc010b1e4
c01011af:	e8 a3 79 00 00       	call   c0108b57 <panic>
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
c01011c5:	e8 e2 06 00 00       	call   c01018ac <sys_malloc>
c01011ca:	83 c4 10             	add    $0x10,%esp
c01011cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01011d0:	83 ec 04             	sub    $0x4,%esp
c01011d3:	6a 7c                	push   $0x7c
c01011d5:	6a 00                	push   $0x0
c01011d7:	ff 75 f4             	pushl  -0xc(%ebp)
c01011da:	e8 90 b0 00 00       	call   c010c26f <Memset>
c01011df:	83 c4 10             	add    $0x10,%esp
c01011e2:	83 ec 04             	sub    $0x4,%esp
c01011e5:	68 13 02 00 00       	push   $0x213
c01011ea:	ff 75 f4             	pushl  -0xc(%ebp)
c01011ed:	6a 02                	push   $0x2
c01011ef:	e8 f1 85 00 00       	call   c01097e5 <send_rec>
c01011f4:	83 c4 10             	add    $0x10,%esp
c01011f7:	83 ec 08             	sub    $0x8,%esp
c01011fa:	6a 7c                	push   $0x7c
c01011fc:	ff 75 f4             	pushl  -0xc(%ebp)
c01011ff:	e8 bd 06 00 00       	call   c01018c1 <sys_free>
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
c0101301:	e8 e9 4d 00 00       	call   c01060ef <alloc_virtual_memory>
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
c0101335:	e8 3b 78 00 00       	call   c0108b75 <assertion_failure>
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
c01013a7:	e8 c9 77 00 00       	call   c0108b75 <assertion_failure>
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
c01013f3:	e8 77 ae 00 00       	call   c010c26f <Memset>
c01013f8:	83 c4 10             	add    $0x10,%esp
c01013fb:	83 ec 04             	sub    $0x4,%esp
c01013fe:	68 00 02 00 00       	push   $0x200
c0101403:	68 80 11 11 c0       	push   $0xc0111180
c0101408:	68 f0 01 00 00       	push   $0x1f0
c010140d:	e8 b1 ae 00 00       	call   c010c2c3 <read_port>
c0101412:	83 c4 10             	add    $0x10,%esp
c0101415:	83 ec 04             	sub    $0x4,%esp
c0101418:	ff 75 c4             	pushl  -0x3c(%ebp)
c010141b:	68 80 11 11 c0       	push   $0xc0111180
c0101420:	ff 75 f0             	pushl  -0x10(%ebp)
c0101423:	e8 34 5b 00 00       	call   c0106f5c <Memcpy>
c0101428:	83 c4 10             	add    $0x10,%esp
c010142b:	eb 26                	jmp    c0101453 <hd_rdwt+0x249>
c010142d:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101431:	75 20                	jne    c0101453 <hd_rdwt+0x249>
c0101433:	e8 51 fd ff ff       	call   c0101189 <wait_for>
c0101438:	83 ec 04             	sub    $0x4,%esp
c010143b:	ff 75 c4             	pushl  -0x3c(%ebp)
c010143e:	ff 75 f0             	pushl  -0x10(%ebp)
c0101441:	68 f0 01 00 00       	push   $0x1f0
c0101446:	e8 8c ae 00 00       	call   c010c2d7 <write_port>
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
c0101477:	e8 f3 ad 00 00       	call   c010c26f <Memset>
c010147c:	83 c4 10             	add    $0x10,%esp
c010147f:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0101486:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c010148d:	00 00 00 
c0101490:	83 ec 04             	sub    $0x4,%esp
c0101493:	6a 02                	push   $0x2
c0101495:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010149b:	50                   	push   %eax
c010149c:	6a 01                	push   $0x1
c010149e:	e8 42 83 00 00       	call   c01097e5 <send_rec>
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
c01014ca:	e8 b0 85 00 00       	call   c0109a7f <inform_int>
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
c01014fb:	e8 4a 5e 00 00       	call   c010734a <disp_int>
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
c0101516:	83 ec 28             	sub    $0x28,%esp
c0101519:	e8 7a 94 00 00       	call   c010a998 <get_interrupt_status>
c010151e:	88 45 db             	mov    %al,-0x25(%ebp)
c0101521:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
c0101525:	83 ec 04             	sub    $0x4,%esp
c0101528:	6a 01                	push   $0x1
c010152a:	8d 45 db             	lea    -0x25(%ebp),%eax
c010152d:	50                   	push   %eax
c010152e:	8d 45 da             	lea    -0x26(%ebp),%eax
c0101531:	50                   	push   %eax
c0101532:	e8 25 5a 00 00       	call   c0106f5c <Memcpy>
c0101537:	83 c4 10             	add    $0x10,%esp
c010153a:	c7 45 ec 00 01 00 00 	movl   $0x100,-0x14(%ebp)
c0101541:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101544:	83 ec 0c             	sub    $0xc,%esp
c0101547:	50                   	push   %eax
c0101548:	e8 5f 03 00 00       	call   c01018ac <sys_malloc>
c010154d:	83 c4 10             	add    $0x10,%esp
c0101550:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101553:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
c0101557:	83 e0 01             	and    $0x1,%eax
c010155a:	84 c0                	test   %al,%al
c010155c:	0f 84 52 01 00 00    	je     c01016b4 <net_handler+0x1a1>
c0101562:	83 ec 0c             	sub    $0xc,%esp
c0101565:	68 48 b2 10 c0       	push   $0xc010b248
c010156a:	e8 6a eb ff ff       	call   c01000d9 <disp_str>
c010156f:	83 c4 10             	add    $0x10,%esp
c0101572:	83 ec 0c             	sub    $0xc,%esp
c0101575:	68 6e b2 10 c0       	push   $0xc010b26e
c010157a:	e8 5a eb ff ff       	call   c01000d9 <disp_str>
c010157f:	83 c4 10             	add    $0x10,%esp
c0101582:	c7 45 e4 00 40 00 00 	movl   $0x4000,-0x1c(%ebp)
c0101589:	e8 39 94 00 00       	call   c010a9c7 <get_curr_page>
c010158e:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0101591:	83 ec 0c             	sub    $0xc,%esp
c0101594:	68 7f b2 10 c0       	push   $0xc010b27f
c0101599:	e8 3b eb ff ff       	call   c01000d9 <disp_str>
c010159e:	83 c4 10             	add    $0x10,%esp
c01015a1:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01015a5:	83 ec 0c             	sub    $0xc,%esp
c01015a8:	50                   	push   %eax
c01015a9:	e8 9c 5d 00 00       	call   c010734a <disp_int>
c01015ae:	83 c4 10             	add    $0x10,%esp
c01015b1:	83 ec 0c             	sub    $0xc,%esp
c01015b4:	68 81 b2 10 c0       	push   $0xc010b281
c01015b9:	e8 1b eb ff ff       	call   c01000d9 <disp_str>
c01015be:	83 c4 10             	add    $0x10,%esp
c01015c1:	0f b6 05 c0 06 11 c0 	movzbl 0xc01106c0,%eax
c01015c8:	88 45 e2             	mov    %al,-0x1e(%ebp)
c01015cb:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01015cf:	88 45 e1             	mov    %al,-0x1f(%ebp)
c01015d2:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
c01015d6:	a2 c0 06 11 c0       	mov    %al,0xc01106c0
c01015db:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
c01015df:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01015e2:	e9 b0 00 00 00       	jmp    c0101697 <net_handler+0x184>
c01015e7:	83 ec 04             	sub    $0x4,%esp
c01015ea:	ff 75 ec             	pushl  -0x14(%ebp)
c01015ed:	6a 00                	push   $0x0
c01015ef:	ff 75 e8             	pushl  -0x18(%ebp)
c01015f2:	e8 78 ac 00 00       	call   c010c26f <Memset>
c01015f7:	83 c4 10             	add    $0x10,%esp
c01015fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015fd:	c1 e0 08             	shl    $0x8,%eax
c0101600:	83 ec 0c             	sub    $0xc,%esp
c0101603:	50                   	push   %eax
c0101604:	e8 84 92 00 00       	call   c010a88d <SetPageStart>
c0101609:	83 c4 10             	add    $0x10,%esp
c010160c:	83 ec 0c             	sub    $0xc,%esp
c010160f:	ff 75 e8             	pushl  -0x18(%ebp)
c0101612:	e8 cd 93 00 00       	call   c010a9e4 <NICtoPC>
c0101617:	83 c4 10             	add    $0x10,%esp
c010161a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010161d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101620:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101623:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010162a:	eb 2e                	jmp    c010165a <net_handler+0x147>
c010162c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010162f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101632:	01 d0                	add    %edx,%eax
c0101634:	0f b6 00             	movzbl (%eax),%eax
c0101637:	0f b6 c0             	movzbl %al,%eax
c010163a:	83 ec 0c             	sub    $0xc,%esp
c010163d:	50                   	push   %eax
c010163e:	e8 07 5d 00 00       	call   c010734a <disp_int>
c0101643:	83 c4 10             	add    $0x10,%esp
c0101646:	83 ec 0c             	sub    $0xc,%esp
c0101649:	68 84 b2 10 c0       	push   $0xc010b284
c010164e:	e8 86 ea ff ff       	call   c01000d9 <disp_str>
c0101653:	83 c4 10             	add    $0x10,%esp
c0101656:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010165a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010165d:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0101660:	77 ca                	ja     c010162c <net_handler+0x119>
c0101662:	83 ec 08             	sub    $0x8,%esp
c0101665:	ff 75 dc             	pushl  -0x24(%ebp)
c0101668:	ff 75 e8             	pushl  -0x18(%ebp)
c010166b:	e8 1c ea ff ff       	call   c010008c <disp_str_len>
c0101670:	83 c4 10             	add    $0x10,%esp
c0101673:	83 ec 0c             	sub    $0xc,%esp
c0101676:	68 86 b2 10 c0       	push   $0xc010b286
c010167b:	e8 59 ea ff ff       	call   c01000d9 <disp_str>
c0101680:	83 c4 10             	add    $0x10,%esp
c0101683:	83 ec 0c             	sub    $0xc,%esp
c0101686:	68 86 b2 10 c0       	push   $0xc010b286
c010168b:	e8 49 ea ff ff       	call   c01000d9 <disp_str>
c0101690:	83 c4 10             	add    $0x10,%esp
c0101693:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101697:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
c010169b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c010169e:	0f 8c 43 ff ff ff    	jl     c01015e7 <net_handler+0xd4>
c01016a4:	83 ec 0c             	sub    $0xc,%esp
c01016a7:	68 88 b2 10 c0       	push   $0xc010b288
c01016ac:	e8 28 ea ff ff       	call   c01000d9 <disp_str>
c01016b1:	83 c4 10             	add    $0x10,%esp
c01016b4:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
c01016b8:	83 e0 40             	and    $0x40,%eax
c01016bb:	84 c0                	test   %al,%al
c01016bd:	74 30                	je     c01016ef <net_handler+0x1dc>
c01016bf:	83 ec 0c             	sub    $0xc,%esp
c01016c2:	68 ac b2 10 c0       	push   $0xc010b2ac
c01016c7:	e8 0d ea ff ff       	call   c01000d9 <disp_str>
c01016cc:	83 c4 10             	add    $0x10,%esp
c01016cf:	83 ec 0c             	sub    $0xc,%esp
c01016d2:	68 d1 b2 10 c0       	push   $0xc010b2d1
c01016d7:	e8 fd e9 ff ff       	call   c01000d9 <disp_str>
c01016dc:	83 c4 10             	add    $0x10,%esp
c01016df:	83 ec 0c             	sub    $0xc,%esp
c01016e2:	68 e0 b2 10 c0       	push   $0xc010b2e0
c01016e7:	e8 ed e9 ff ff       	call   c01000d9 <disp_str>
c01016ec:	83 c4 10             	add    $0x10,%esp
c01016ef:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
c01016f3:	0f b6 c0             	movzbl %al,%eax
c01016f6:	83 ec 0c             	sub    $0xc,%esp
c01016f9:	50                   	push   %eax
c01016fa:	e8 af 92 00 00       	call   c010a9ae <set_interrupt_status>
c01016ff:	83 c4 10             	add    $0x10,%esp
c0101702:	90                   	nop
c0101703:	c9                   	leave  
c0101704:	c3                   	ret    

c0101705 <waitfor>:
c0101705:	55                   	push   %ebp
c0101706:	89 e5                	mov    %esp,%ebp
c0101708:	83 ec 18             	sub    $0x18,%esp
c010170b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101712:	eb 26                	jmp    c010173a <waitfor+0x35>
c0101714:	83 ec 0c             	sub    $0xc,%esp
c0101717:	68 f7 01 00 00       	push   $0x1f7
c010171c:	e8 11 ec ff ff       	call   c0100332 <in_byte>
c0101721:	83 c4 10             	add    $0x10,%esp
c0101724:	0f b6 c0             	movzbl %al,%eax
c0101727:	23 45 08             	and    0x8(%ebp),%eax
c010172a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010172d:	75 07                	jne    c0101736 <waitfor+0x31>
c010172f:	b8 01 00 00 00       	mov    $0x1,%eax
c0101734:	eb 11                	jmp    c0101747 <waitfor+0x42>
c0101736:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010173a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010173d:	3b 45 10             	cmp    0x10(%ebp),%eax
c0101740:	7c d2                	jl     c0101714 <waitfor+0xf>
c0101742:	b8 00 00 00 00       	mov    $0x0,%eax
c0101747:	c9                   	leave  
c0101748:	c3                   	ret    

c0101749 <print_hd_info>:
c0101749:	55                   	push   %ebp
c010174a:	89 e5                	mov    %esp,%ebp
c010174c:	83 ec 18             	sub    $0x18,%esp
c010174f:	83 ec 0c             	sub    $0xc,%esp
c0101752:	68 05 b3 10 c0       	push   $0xc010b305
c0101757:	e8 bc 70 00 00       	call   c0108818 <Printf>
c010175c:	83 c4 10             	add    $0x10,%esp
c010175f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101766:	eb 3b                	jmp    c01017a3 <print_hd_info+0x5a>
c0101768:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010176b:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101772:	85 c0                	test   %eax,%eax
c0101774:	74 28                	je     c010179e <print_hd_info+0x55>
c0101776:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101779:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101780:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101783:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c010178a:	ff 75 f4             	pushl  -0xc(%ebp)
c010178d:	52                   	push   %edx
c010178e:	50                   	push   %eax
c010178f:	68 22 b3 10 c0       	push   $0xc010b322
c0101794:	e8 7f 70 00 00       	call   c0108818 <Printf>
c0101799:	83 c4 10             	add    $0x10,%esp
c010179c:	eb 01                	jmp    c010179f <print_hd_info+0x56>
c010179e:	90                   	nop
c010179f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01017a3:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c01017a7:	7e bf                	jle    c0101768 <print_hd_info+0x1f>
c01017a9:	83 ec 0c             	sub    $0xc,%esp
c01017ac:	68 3a b3 10 c0       	push   $0xc010b33a
c01017b1:	e8 62 70 00 00       	call   c0108818 <Printf>
c01017b6:	83 c4 10             	add    $0x10,%esp
c01017b9:	83 ec 0c             	sub    $0xc,%esp
c01017bc:	68 55 b3 10 c0       	push   $0xc010b355
c01017c1:	e8 52 70 00 00       	call   c0108818 <Printf>
c01017c6:	83 c4 10             	add    $0x10,%esp
c01017c9:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c01017d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01017d7:	eb 44                	jmp    c010181d <print_hd_info+0xd4>
c01017d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017dc:	83 c0 04             	add    $0x4,%eax
c01017df:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01017e6:	85 c0                	test   %eax,%eax
c01017e8:	74 2e                	je     c0101818 <print_hd_info+0xcf>
c01017ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017ed:	83 c0 04             	add    $0x4,%eax
c01017f0:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01017f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01017fa:	83 c0 04             	add    $0x4,%eax
c01017fd:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101804:	ff 75 f0             	pushl  -0x10(%ebp)
c0101807:	52                   	push   %edx
c0101808:	50                   	push   %eax
c0101809:	68 22 b3 10 c0       	push   $0xc010b322
c010180e:	e8 05 70 00 00       	call   c0108818 <Printf>
c0101813:	83 c4 10             	add    $0x10,%esp
c0101816:	eb 01                	jmp    c0101819 <print_hd_info+0xd0>
c0101818:	90                   	nop
c0101819:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010181d:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101821:	7e b6                	jle    c01017d9 <print_hd_info+0x90>
c0101823:	83 ec 0c             	sub    $0xc,%esp
c0101826:	68 72 b3 10 c0       	push   $0xc010b372
c010182b:	e8 e8 6f 00 00       	call   c0108818 <Printf>
c0101830:	83 c4 10             	add    $0x10,%esp
c0101833:	90                   	nop
c0101834:	c9                   	leave  
c0101835:	c3                   	ret    

c0101836 <is_empty>:
c0101836:	55                   	push   %ebp
c0101837:	89 e5                	mov    %esp,%ebp
c0101839:	83 ec 10             	sub    $0x10,%esp
c010183c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0101843:	eb 1a                	jmp    c010185f <is_empty+0x29>
c0101845:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0101848:	8b 45 08             	mov    0x8(%ebp),%eax
c010184b:	01 d0                	add    %edx,%eax
c010184d:	0f b6 00             	movzbl (%eax),%eax
c0101850:	84 c0                	test   %al,%al
c0101852:	74 07                	je     c010185b <is_empty+0x25>
c0101854:	b8 00 00 00 00       	mov    $0x0,%eax
c0101859:	eb 11                	jmp    c010186c <is_empty+0x36>
c010185b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010185f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101862:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101865:	7c de                	jl     c0101845 <is_empty+0xf>
c0101867:	b8 01 00 00 00       	mov    $0x1,%eax
c010186c:	c9                   	leave  
c010186d:	c3                   	ret    
c010186e:	66 90                	xchg   %ax,%ax

c0101870 <write_debug>:
c0101870:	b8 02 00 00 00       	mov    $0x2,%eax
c0101875:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101879:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010187d:	cd 90                	int    $0x90
c010187f:	c3                   	ret    

c0101880 <send_msg>:
c0101880:	55                   	push   %ebp
c0101881:	89 e5                	mov    %esp,%ebp
c0101883:	53                   	push   %ebx
c0101884:	51                   	push   %ecx
c0101885:	b8 03 00 00 00       	mov    $0x3,%eax
c010188a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010188d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101890:	cd 90                	int    $0x90
c0101892:	59                   	pop    %ecx
c0101893:	5b                   	pop    %ebx
c0101894:	5d                   	pop    %ebp
c0101895:	c3                   	ret    

c0101896 <receive_msg>:
c0101896:	55                   	push   %ebp
c0101897:	89 e5                	mov    %esp,%ebp
c0101899:	53                   	push   %ebx
c010189a:	51                   	push   %ecx
c010189b:	b8 04 00 00 00       	mov    $0x4,%eax
c01018a0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01018a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01018a6:	cd 90                	int    $0x90
c01018a8:	59                   	pop    %ecx
c01018a9:	5b                   	pop    %ebx
c01018aa:	5d                   	pop    %ebp
c01018ab:	c3                   	ret    

c01018ac <sys_malloc>:
c01018ac:	56                   	push   %esi
c01018ad:	57                   	push   %edi
c01018ae:	53                   	push   %ebx
c01018af:	55                   	push   %ebp
c01018b0:	89 e5                	mov    %esp,%ebp
c01018b2:	b8 05 00 00 00       	mov    $0x5,%eax
c01018b7:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01018ba:	cd 90                	int    $0x90
c01018bc:	5d                   	pop    %ebp
c01018bd:	5b                   	pop    %ebx
c01018be:	5f                   	pop    %edi
c01018bf:	5e                   	pop    %esi
c01018c0:	c3                   	ret    

c01018c1 <sys_free>:
c01018c1:	56                   	push   %esi
c01018c2:	57                   	push   %edi
c01018c3:	53                   	push   %ebx
c01018c4:	55                   	push   %ebp
c01018c5:	89 e5                	mov    %esp,%ebp
c01018c7:	b8 06 00 00 00       	mov    $0x6,%eax
c01018cc:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01018cf:	8b 5d 18             	mov    0x18(%ebp),%ebx
c01018d2:	cd 90                	int    $0x90
c01018d4:	5d                   	pop    %ebp
c01018d5:	5b                   	pop    %ebx
c01018d6:	5f                   	pop    %edi
c01018d7:	5e                   	pop    %esi
c01018d8:	c3                   	ret    

c01018d9 <task_fs>:
c01018d9:	55                   	push   %ebp
c01018da:	89 e5                	mov    %esp,%ebp
c01018dc:	83 ec 28             	sub    $0x28,%esp
c01018df:	e8 bb 08 00 00       	call   c010219f <init_fs>
c01018e4:	83 ec 0c             	sub    $0xc,%esp
c01018e7:	6a 7c                	push   $0x7c
c01018e9:	e8 be ff ff ff       	call   c01018ac <sys_malloc>
c01018ee:	83 c4 10             	add    $0x10,%esp
c01018f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01018f4:	83 ec 0c             	sub    $0xc,%esp
c01018f7:	6a 7c                	push   $0x7c
c01018f9:	e8 ae ff ff ff       	call   c01018ac <sys_malloc>
c01018fe:	83 c4 10             	add    $0x10,%esp
c0101901:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101904:	83 ec 04             	sub    $0x4,%esp
c0101907:	6a 7c                	push   $0x7c
c0101909:	6a 00                	push   $0x0
c010190b:	ff 75 f4             	pushl  -0xc(%ebp)
c010190e:	e8 5c a9 00 00       	call   c010c26f <Memset>
c0101913:	83 c4 10             	add    $0x10,%esp
c0101916:	83 ec 04             	sub    $0x4,%esp
c0101919:	6a 12                	push   $0x12
c010191b:	ff 75 f4             	pushl  -0xc(%ebp)
c010191e:	6a 02                	push   $0x2
c0101920:	e8 c0 7e 00 00       	call   c01097e5 <send_rec>
c0101925:	83 c4 10             	add    $0x10,%esp
c0101928:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010192b:	8b 40 78             	mov    0x78(%eax),%eax
c010192e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101931:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101934:	8b 00                	mov    (%eax),%eax
c0101936:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101939:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010193c:	8b 40 50             	mov    0x50(%eax),%eax
c010193f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101942:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101945:	8b 40 68             	mov    0x68(%eax),%eax
c0101948:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010194b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010194e:	8b 00                	mov    (%eax),%eax
c0101950:	85 c0                	test   %eax,%eax
c0101952:	75 07                	jne    c010195b <task_fs+0x82>
c0101954:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010195b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101962:	83 ec 0c             	sub    $0xc,%esp
c0101965:	ff 75 e8             	pushl  -0x18(%ebp)
c0101968:	e8 39 21 00 00       	call   c0103aa6 <pid2proc>
c010196d:	83 c4 10             	add    $0x10,%esp
c0101970:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101975:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101979:	74 37                	je     c01019b2 <task_fs+0xd9>
c010197b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010197f:	74 31                	je     c01019b2 <task_fs+0xd9>
c0101981:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101985:	74 2b                	je     c01019b2 <task_fs+0xd9>
c0101987:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010198b:	74 25                	je     c01019b2 <task_fs+0xd9>
c010198d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101991:	74 1f                	je     c01019b2 <task_fs+0xd9>
c0101993:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101997:	74 19                	je     c01019b2 <task_fs+0xd9>
c0101999:	6a 7a                	push   $0x7a
c010199b:	68 94 b3 10 c0       	push   $0xc010b394
c01019a0:	68 94 b3 10 c0       	push   $0xc010b394
c01019a5:	68 a4 b3 10 c0       	push   $0xc010b3a4
c01019aa:	e8 c6 71 00 00       	call   c0108b75 <assertion_failure>
c01019af:	83 c4 10             	add    $0x10,%esp
c01019b2:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01019b6:	74 3a                	je     c01019f2 <task_fs+0x119>
c01019b8:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01019bc:	7f 19                	jg     c01019d7 <task_fs+0xfe>
c01019be:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01019c2:	0f 84 10 01 00 00    	je     c0101ad8 <task_fs+0x1ff>
c01019c8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01019cc:	0f 84 a1 00 00 00    	je     c0101a73 <task_fs+0x19a>
c01019d2:	e9 ef 00 00 00       	jmp    c0101ac6 <task_fs+0x1ed>
c01019d7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01019db:	74 50                	je     c0101a2d <task_fs+0x154>
c01019dd:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01019e1:	0f 84 c6 00 00 00    	je     c0101aad <task_fs+0x1d4>
c01019e7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01019eb:	74 40                	je     c0101a2d <task_fs+0x154>
c01019ed:	e9 d4 00 00 00       	jmp    c0101ac6 <task_fs+0x1ed>
c01019f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019f5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01019fc:	83 ec 0c             	sub    $0xc,%esp
c01019ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a02:	e8 ec 07 00 00       	call   c01021f3 <do_open>
c0101a07:	83 c4 10             	add    $0x10,%esp
c0101a0a:	89 c2                	mov    %eax,%edx
c0101a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a0f:	89 50 50             	mov    %edx,0x50(%eax)
c0101a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a15:	8b 00                	mov    (%eax),%eax
c0101a17:	83 ec 04             	sub    $0x4,%esp
c0101a1a:	50                   	push   %eax
c0101a1b:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a1e:	6a 01                	push   $0x1
c0101a20:	e8 c0 7d 00 00       	call   c01097e5 <send_rec>
c0101a25:	83 c4 10             	add    $0x10,%esp
c0101a28:	e9 b2 00 00 00       	jmp    c0101adf <task_fs+0x206>
c0101a2d:	83 ec 0c             	sub    $0xc,%esp
c0101a30:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a33:	e8 19 19 00 00       	call   c0103351 <do_rdwt>
c0101a38:	83 c4 10             	add    $0x10,%esp
c0101a3b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101a3e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101a42:	0f 84 96 00 00 00    	je     c0101ade <task_fs+0x205>
c0101a48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a4b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101a52:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a58:	89 50 60             	mov    %edx,0x60(%eax)
c0101a5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a5e:	8b 00                	mov    (%eax),%eax
c0101a60:	83 ec 04             	sub    $0x4,%esp
c0101a63:	50                   	push   %eax
c0101a64:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a67:	6a 01                	push   $0x1
c0101a69:	e8 77 7d 00 00       	call   c01097e5 <send_rec>
c0101a6e:	83 c4 10             	add    $0x10,%esp
c0101a71:	eb 6b                	jmp    c0101ade <task_fs+0x205>
c0101a73:	83 ec 0c             	sub    $0xc,%esp
c0101a76:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101a79:	e8 f0 1d 00 00       	call   c010386e <do_close>
c0101a7e:	83 c4 10             	add    $0x10,%esp
c0101a81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a84:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a8e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101a95:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101a98:	8b 00                	mov    (%eax),%eax
c0101a9a:	83 ec 04             	sub    $0x4,%esp
c0101a9d:	50                   	push   %eax
c0101a9e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101aa1:	6a 01                	push   $0x1
c0101aa3:	e8 3d 7d 00 00       	call   c01097e5 <send_rec>
c0101aa8:	83 c4 10             	add    $0x10,%esp
c0101aab:	eb 32                	jmp    c0101adf <task_fs+0x206>
c0101aad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ab0:	8b 40 68             	mov    0x68(%eax),%eax
c0101ab3:	83 ec 04             	sub    $0x4,%esp
c0101ab6:	50                   	push   %eax
c0101ab7:	ff 75 f4             	pushl  -0xc(%ebp)
c0101aba:	6a 01                	push   $0x1
c0101abc:	e8 24 7d 00 00       	call   c01097e5 <send_rec>
c0101ac1:	83 c4 10             	add    $0x10,%esp
c0101ac4:	eb 19                	jmp    c0101adf <task_fs+0x206>
c0101ac6:	83 ec 0c             	sub    $0xc,%esp
c0101ac9:	68 07 b4 10 c0       	push   $0xc010b407
c0101ace:	e8 84 70 00 00       	call   c0108b57 <panic>
c0101ad3:	83 c4 10             	add    $0x10,%esp
c0101ad6:	eb 07                	jmp    c0101adf <task_fs+0x206>
c0101ad8:	90                   	nop
c0101ad9:	e9 26 fe ff ff       	jmp    c0101904 <task_fs+0x2b>
c0101ade:	90                   	nop
c0101adf:	e9 20 fe ff ff       	jmp    c0101904 <task_fs+0x2b>

c0101ae4 <rd_wt>:
c0101ae4:	55                   	push   %ebp
c0101ae5:	89 e5                	mov    %esp,%ebp
c0101ae7:	83 ec 18             	sub    $0x18,%esp
c0101aea:	83 ec 0c             	sub    $0xc,%esp
c0101aed:	6a 7c                	push   $0x7c
c0101aef:	e8 b8 fd ff ff       	call   c01018ac <sys_malloc>
c0101af4:	83 c4 10             	add    $0x10,%esp
c0101af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101afa:	83 ec 04             	sub    $0x4,%esp
c0101afd:	6a 7c                	push   $0x7c
c0101aff:	6a 00                	push   $0x0
c0101b01:	ff 75 f4             	pushl  -0xc(%ebp)
c0101b04:	e8 66 a7 00 00       	call   c010c26f <Memset>
c0101b09:	83 c4 10             	add    $0x10,%esp
c0101b0c:	8b 55 18             	mov    0x18(%ebp),%edx
c0101b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b12:	89 50 78             	mov    %edx,0x78(%eax)
c0101b15:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101b18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b1b:	89 50 14             	mov    %edx,0x14(%eax)
c0101b1e:	8b 55 10             	mov    0x10(%ebp),%edx
c0101b21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b24:	89 50 10             	mov    %edx,0x10(%eax)
c0101b27:	8b 55 14             	mov    0x14(%ebp),%edx
c0101b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b2d:	89 50 0c             	mov    %edx,0xc(%eax)
c0101b30:	8b 45 08             	mov    0x8(%ebp),%eax
c0101b33:	c1 e0 09             	shl    $0x9,%eax
c0101b36:	89 c2                	mov    %eax,%edx
c0101b38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b3b:	89 50 18             	mov    %edx,0x18(%eax)
c0101b3e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101b42:	74 22                	je     c0101b66 <rd_wt+0x82>
c0101b44:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101b48:	74 1c                	je     c0101b66 <rd_wt+0x82>
c0101b4a:	68 b1 00 00 00       	push   $0xb1
c0101b4f:	68 94 b3 10 c0       	push   $0xc010b394
c0101b54:	68 94 b3 10 c0       	push   $0xc010b394
c0101b59:	68 1a b4 10 c0       	push   $0xc010b41a
c0101b5e:	e8 12 70 00 00       	call   c0108b75 <assertion_failure>
c0101b63:	83 c4 10             	add    $0x10,%esp
c0101b66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b69:	8b 40 78             	mov    0x78(%eax),%eax
c0101b6c:	83 f8 07             	cmp    $0x7,%eax
c0101b6f:	74 27                	je     c0101b98 <rd_wt+0xb4>
c0101b71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101b74:	8b 40 78             	mov    0x78(%eax),%eax
c0101b77:	83 f8 0a             	cmp    $0xa,%eax
c0101b7a:	74 1c                	je     c0101b98 <rd_wt+0xb4>
c0101b7c:	68 b2 00 00 00       	push   $0xb2
c0101b81:	68 94 b3 10 c0       	push   $0xc010b394
c0101b86:	68 94 b3 10 c0       	push   $0xc010b394
c0101b8b:	68 38 b4 10 c0       	push   $0xc010b438
c0101b90:	e8 e0 6f 00 00       	call   c0108b75 <assertion_failure>
c0101b95:	83 c4 10             	add    $0x10,%esp
c0101b98:	83 ec 04             	sub    $0x4,%esp
c0101b9b:	6a 03                	push   $0x3
c0101b9d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101ba0:	6a 03                	push   $0x3
c0101ba2:	e8 3e 7c 00 00       	call   c01097e5 <send_rec>
c0101ba7:	83 c4 10             	add    $0x10,%esp
c0101baa:	83 ec 08             	sub    $0x8,%esp
c0101bad:	6a 7c                	push   $0x7c
c0101baf:	ff 75 f4             	pushl  -0xc(%ebp)
c0101bb2:	e8 0a fd ff ff       	call   c01018c1 <sys_free>
c0101bb7:	83 c4 10             	add    $0x10,%esp
c0101bba:	90                   	nop
c0101bbb:	c9                   	leave  
c0101bbc:	c3                   	ret    

c0101bbd <mkfs>:
c0101bbd:	55                   	push   %ebp
c0101bbe:	89 e5                	mov    %esp,%ebp
c0101bc0:	57                   	push   %edi
c0101bc1:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101bc7:	83 ec 0c             	sub    $0xc,%esp
c0101bca:	68 00 80 00 00       	push   $0x8000
c0101bcf:	e8 d8 fc ff ff       	call   c01018ac <sys_malloc>
c0101bd4:	83 c4 10             	add    $0x10,%esp
c0101bd7:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c0101bdc:	83 ec 0c             	sub    $0xc,%esp
c0101bdf:	6a 24                	push   $0x24
c0101be1:	e8 c6 fc ff ff       	call   c01018ac <sys_malloc>
c0101be6:	83 c4 10             	add    $0x10,%esp
c0101be9:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c0101bee:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101bf3:	83 ec 0c             	sub    $0xc,%esp
c0101bf6:	50                   	push   %eax
c0101bf7:	e8 42 46 00 00       	call   c010623e <get_physical_address>
c0101bfc:	83 c4 10             	add    $0x10,%esp
c0101bff:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101c04:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101c09:	83 ec 0c             	sub    $0xc,%esp
c0101c0c:	50                   	push   %eax
c0101c0d:	e8 2c 46 00 00       	call   c010623e <get_physical_address>
c0101c12:	83 c4 10             	add    $0x10,%esp
c0101c15:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c0101c1a:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c1f:	83 ec 04             	sub    $0x4,%esp
c0101c22:	68 00 02 00 00       	push   $0x200
c0101c27:	6a 00                	push   $0x0
c0101c29:	50                   	push   %eax
c0101c2a:	e8 40 a6 00 00       	call   c010c26f <Memset>
c0101c2f:	83 c4 10             	add    $0x10,%esp
c0101c32:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c37:	83 ec 0c             	sub    $0xc,%esp
c0101c3a:	6a 0a                	push   $0xa
c0101c3c:	68 00 02 00 00       	push   $0x200
c0101c41:	50                   	push   %eax
c0101c42:	6a 20                	push   $0x20
c0101c44:	6a 00                	push   $0x0
c0101c46:	e8 99 fe ff ff       	call   c0101ae4 <rd_wt>
c0101c4b:	83 c4 20             	add    $0x20,%esp
c0101c4e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c53:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101c56:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c59:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101c60:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c63:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0101c6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c6d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101c74:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c77:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101c7e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c81:	8b 40 04             	mov    0x4(%eax),%eax
c0101c84:	8d 50 02             	lea    0x2(%eax),%edx
c0101c87:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c8a:	8b 40 08             	mov    0x8(%eax),%eax
c0101c8d:	01 c2                	add    %eax,%edx
c0101c8f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c92:	8b 40 0c             	mov    0xc(%eax),%eax
c0101c95:	01 c2                	add    %eax,%edx
c0101c97:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101c9a:	89 10                	mov    %edx,(%eax)
c0101c9c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101ca3:	b8 00 02 00 00       	mov    $0x200,%eax
c0101ca8:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101cab:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101cb1:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101cb4:	01 ca                	add    %ecx,%edx
c0101cb6:	83 ec 04             	sub    $0x4,%esp
c0101cb9:	50                   	push   %eax
c0101cba:	6a 80                	push   $0xffffff80
c0101cbc:	52                   	push   %edx
c0101cbd:	e8 ad a5 00 00       	call   c010c26f <Memset>
c0101cc2:	83 c4 10             	add    $0x10,%esp
c0101cc5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101cca:	83 ec 0c             	sub    $0xc,%esp
c0101ccd:	6a 0a                	push   $0xa
c0101ccf:	68 00 02 00 00       	push   $0x200
c0101cd4:	50                   	push   %eax
c0101cd5:	6a 20                	push   $0x20
c0101cd7:	6a 01                	push   $0x1
c0101cd9:	e8 06 fe ff ff       	call   c0101ae4 <rd_wt>
c0101cde:	83 c4 20             	add    $0x20,%esp
c0101ce1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ce4:	8b 10                	mov    (%eax),%edx
c0101ce6:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101ce9:	8b 50 04             	mov    0x4(%eax),%edx
c0101cec:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101cef:	8b 50 08             	mov    0x8(%eax),%edx
c0101cf2:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101cf5:	8b 50 0c             	mov    0xc(%eax),%edx
c0101cf8:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101cfb:	8b 50 10             	mov    0x10(%eax),%edx
c0101cfe:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101d01:	8b 50 14             	mov    0x14(%eax),%edx
c0101d04:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101d07:	8b 50 18             	mov    0x18(%eax),%edx
c0101d0a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101d0d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101d10:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101d13:	8b 40 20             	mov    0x20(%eax),%eax
c0101d16:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101d19:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101d1d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101d21:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d26:	83 ec 04             	sub    $0x4,%esp
c0101d29:	6a 01                	push   $0x1
c0101d2b:	52                   	push   %edx
c0101d2c:	50                   	push   %eax
c0101d2d:	e8 3d a5 00 00       	call   c010c26f <Memset>
c0101d32:	83 c4 10             	add    $0x10,%esp
c0101d35:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d3a:	83 c0 01             	add    $0x1,%eax
c0101d3d:	83 ec 04             	sub    $0x4,%esp
c0101d40:	68 ff 01 00 00       	push   $0x1ff
c0101d45:	6a 80                	push   $0xffffff80
c0101d47:	50                   	push   %eax
c0101d48:	e8 22 a5 00 00       	call   c010c26f <Memset>
c0101d4d:	83 c4 10             	add    $0x10,%esp
c0101d50:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d55:	83 ec 0c             	sub    $0xc,%esp
c0101d58:	6a 0a                	push   $0xa
c0101d5a:	68 00 02 00 00       	push   $0x200
c0101d5f:	50                   	push   %eax
c0101d60:	6a 20                	push   $0x20
c0101d62:	6a 02                	push   $0x2
c0101d64:	e8 7b fd ff ff       	call   c0101ae4 <rd_wt>
c0101d69:	83 c4 20             	add    $0x20,%esp
c0101d6c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101d73:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d78:	83 ec 04             	sub    $0x4,%esp
c0101d7b:	68 00 02 00 00       	push   $0x200
c0101d80:	6a ff                	push   $0xffffffff
c0101d82:	50                   	push   %eax
c0101d83:	e8 e7 a4 00 00       	call   c010c26f <Memset>
c0101d88:	83 c4 10             	add    $0x10,%esp
c0101d8b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d90:	83 ec 0c             	sub    $0xc,%esp
c0101d93:	6a 0a                	push   $0xa
c0101d95:	68 00 02 00 00       	push   $0x200
c0101d9a:	50                   	push   %eax
c0101d9b:	6a 20                	push   $0x20
c0101d9d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101da0:	e8 3f fd ff ff       	call   c0101ae4 <rd_wt>
c0101da5:	83 c4 20             	add    $0x20,%esp
c0101da8:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101dad:	83 ec 04             	sub    $0x4,%esp
c0101db0:	6a 01                	push   $0x1
c0101db2:	6a 01                	push   $0x1
c0101db4:	50                   	push   %eax
c0101db5:	e8 b5 a4 00 00       	call   c010c26f <Memset>
c0101dba:	83 c4 10             	add    $0x10,%esp
c0101dbd:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101dc2:	83 c0 01             	add    $0x1,%eax
c0101dc5:	83 ec 04             	sub    $0x4,%esp
c0101dc8:	68 ff 01 00 00       	push   $0x1ff
c0101dcd:	6a 00                	push   $0x0
c0101dcf:	50                   	push   %eax
c0101dd0:	e8 9a a4 00 00       	call   c010c26f <Memset>
c0101dd5:	83 c4 10             	add    $0x10,%esp
c0101dd8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101ddd:	89 c2                	mov    %eax,%edx
c0101ddf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101de2:	83 c0 01             	add    $0x1,%eax
c0101de5:	83 ec 0c             	sub    $0xc,%esp
c0101de8:	6a 0a                	push   $0xa
c0101dea:	68 00 02 00 00       	push   $0x200
c0101def:	52                   	push   %edx
c0101df0:	6a 20                	push   $0x20
c0101df2:	50                   	push   %eax
c0101df3:	e8 ec fc ff ff       	call   c0101ae4 <rd_wt>
c0101df8:	83 c4 20             	add    $0x20,%esp
c0101dfb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101dfe:	83 e8 02             	sub    $0x2,%eax
c0101e01:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101e04:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101e0b:	eb 04                	jmp    c0101e11 <mkfs+0x254>
c0101e0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101e11:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101e14:	83 c0 01             	add    $0x1,%eax
c0101e17:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101e1a:	7e f1                	jle    c0101e0d <mkfs+0x250>
c0101e1c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e21:	89 c2                	mov    %eax,%edx
c0101e23:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101e26:	83 c0 03             	add    $0x3,%eax
c0101e29:	83 ec 0c             	sub    $0xc,%esp
c0101e2c:	6a 0a                	push   $0xa
c0101e2e:	68 00 02 00 00       	push   $0x200
c0101e33:	52                   	push   %edx
c0101e34:	6a 20                	push   $0x20
c0101e36:	50                   	push   %eax
c0101e37:	e8 a8 fc ff ff       	call   c0101ae4 <rd_wt>
c0101e3c:	83 c4 20             	add    $0x20,%esp
c0101e3f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e44:	89 c2                	mov    %eax,%edx
c0101e46:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101e49:	83 c0 03             	add    $0x3,%eax
c0101e4c:	83 ec 0c             	sub    $0xc,%esp
c0101e4f:	6a 07                	push   $0x7
c0101e51:	68 00 02 00 00       	push   $0x200
c0101e56:	52                   	push   %edx
c0101e57:	6a 20                	push   $0x20
c0101e59:	50                   	push   %eax
c0101e5a:	e8 85 fc ff ff       	call   c0101ae4 <rd_wt>
c0101e5f:	83 c4 20             	add    $0x20,%esp
c0101e62:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101e67:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101e6a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e6d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101e73:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e76:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101e7d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101e80:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e83:	89 50 08             	mov    %edx,0x8(%eax)
c0101e86:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e89:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101e90:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e93:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101e9a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e9d:	8b 10                	mov    (%eax),%edx
c0101e9f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101ea5:	8b 50 04             	mov    0x4(%eax),%edx
c0101ea8:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101eae:	8b 50 08             	mov    0x8(%eax),%edx
c0101eb1:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101eb7:	8b 50 0c             	mov    0xc(%eax),%edx
c0101eba:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101ec0:	8b 50 10             	mov    0x10(%eax),%edx
c0101ec3:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101ec9:	8b 50 14             	mov    0x14(%eax),%edx
c0101ecc:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101ed2:	8b 50 18             	mov    0x18(%eax),%edx
c0101ed5:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101edb:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101ede:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101ee4:	8b 50 20             	mov    0x20(%eax),%edx
c0101ee7:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101eed:	8b 40 24             	mov    0x24(%eax),%eax
c0101ef0:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101ef5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101efc:	eb 4c                	jmp    c0101f4a <mkfs+0x38d>
c0101efe:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101f03:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101f06:	83 c2 01             	add    $0x1,%edx
c0101f09:	c1 e2 05             	shl    $0x5,%edx
c0101f0c:	01 d0                	add    %edx,%eax
c0101f0e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101f11:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f14:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101f1a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f1d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101f24:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f27:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101f2e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101f35:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101f38:	c1 e0 08             	shl    $0x8,%eax
c0101f3b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101f3e:	89 c2                	mov    %eax,%edx
c0101f40:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f43:	89 50 08             	mov    %edx,0x8(%eax)
c0101f46:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101f4a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101f4e:	7e ae                	jle    c0101efe <mkfs+0x341>
c0101f50:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101f57:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101f5d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101f62:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101f67:	89 d7                	mov    %edx,%edi
c0101f69:	f3 ab                	rep stos %eax,%es:(%edi)
c0101f6b:	c7 85 70 ff ff ff 60 	movl   $0xc010b460,-0x90(%ebp)
c0101f72:	b4 10 c0 
c0101f75:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101f7c:	eb 54                	jmp    c0101fd2 <mkfs+0x415>
c0101f7e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101f83:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101f86:	83 c2 04             	add    $0x4,%edx
c0101f89:	c1 e2 05             	shl    $0x5,%edx
c0101f8c:	01 d0                	add    %edx,%eax
c0101f8e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101f91:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f94:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101f9a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101f9d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101fa4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101fa7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101faa:	83 c2 01             	add    $0x1,%edx
c0101fad:	c1 e2 0b             	shl    $0xb,%edx
c0101fb0:	01 c2                	add    %eax,%edx
c0101fb2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101fb5:	89 50 08             	mov    %edx,0x8(%eax)
c0101fb8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101fbb:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101fc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101fc5:	8d 50 05             	lea    0x5(%eax),%edx
c0101fc8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101fcb:	89 50 10             	mov    %edx,0x10(%eax)
c0101fce:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101fd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101fd5:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101fd8:	7c a4                	jl     c0101f7e <mkfs+0x3c1>
c0101fda:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101fdf:	89 c2                	mov    %eax,%edx
c0101fe1:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101fe4:	83 c0 03             	add    $0x3,%eax
c0101fe7:	83 ec 0c             	sub    $0xc,%esp
c0101fea:	6a 0a                	push   $0xa
c0101fec:	68 00 02 00 00       	push   $0x200
c0101ff1:	52                   	push   %edx
c0101ff2:	6a 20                	push   $0x20
c0101ff4:	50                   	push   %eax
c0101ff5:	e8 ea fa ff ff       	call   c0101ae4 <rd_wt>
c0101ffa:	83 c4 20             	add    $0x20,%esp
c0101ffd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102002:	89 c2                	mov    %eax,%edx
c0102004:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102007:	83 ec 0c             	sub    $0xc,%esp
c010200a:	6a 07                	push   $0x7
c010200c:	68 00 02 00 00       	push   $0x200
c0102011:	52                   	push   %edx
c0102012:	6a 20                	push   $0x20
c0102014:	50                   	push   %eax
c0102015:	e8 ca fa ff ff       	call   c0101ae4 <rd_wt>
c010201a:	83 c4 20             	add    $0x20,%esp
c010201d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0102024:	00 00 00 
c0102027:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c010202e:	2e 00 
c0102030:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102035:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0102038:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010203b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0102041:	83 ec 0c             	sub    $0xc,%esp
c0102044:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c010204a:	50                   	push   %eax
c010204b:	e8 58 a2 00 00       	call   c010c2a8 <Strlen>
c0102050:	83 c4 10             	add    $0x10,%esp
c0102053:	89 c1                	mov    %eax,%ecx
c0102055:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102058:	8d 50 04             	lea    0x4(%eax),%edx
c010205b:	83 ec 04             	sub    $0x4,%esp
c010205e:	51                   	push   %ecx
c010205f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0102065:	50                   	push   %eax
c0102066:	52                   	push   %edx
c0102067:	e8 f0 4e 00 00       	call   c0106f5c <Memcpy>
c010206c:	83 c4 10             	add    $0x10,%esp
c010206f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0102075:	b8 00 00 00 00       	mov    $0x0,%eax
c010207a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c010207f:	89 d7                	mov    %edx,%edi
c0102081:	f3 ab                	rep stos %eax,%es:(%edi)
c0102083:	c7 85 34 ff ff ff 6c 	movl   $0xc010b46c,-0xcc(%ebp)
c010208a:	b4 10 c0 
c010208d:	c7 85 38 ff ff ff 75 	movl   $0xc010b475,-0xc8(%ebp)
c0102094:	b4 10 c0 
c0102097:	c7 85 3c ff ff ff 7e 	movl   $0xc010b47e,-0xc4(%ebp)
c010209e:	b4 10 c0 
c01020a1:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c01020a8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01020af:	eb 49                	jmp    c01020fa <mkfs+0x53d>
c01020b1:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c01020b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01020b8:	8d 50 02             	lea    0x2(%eax),%edx
c01020bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01020be:	89 10                	mov    %edx,(%eax)
c01020c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01020c3:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c01020ca:	83 ec 0c             	sub    $0xc,%esp
c01020cd:	50                   	push   %eax
c01020ce:	e8 d5 a1 00 00       	call   c010c2a8 <Strlen>
c01020d3:	83 c4 10             	add    $0x10,%esp
c01020d6:	89 c1                	mov    %eax,%ecx
c01020d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01020db:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c01020e2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01020e5:	83 c2 04             	add    $0x4,%edx
c01020e8:	83 ec 04             	sub    $0x4,%esp
c01020eb:	51                   	push   %ecx
c01020ec:	50                   	push   %eax
c01020ed:	52                   	push   %edx
c01020ee:	e8 69 4e 00 00       	call   c0106f5c <Memcpy>
c01020f3:	83 c4 10             	add    $0x10,%esp
c01020f6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01020fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01020fd:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0102100:	7c af                	jl     c01020b1 <mkfs+0x4f4>
c0102102:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102109:	eb 66                	jmp    c0102171 <mkfs+0x5b4>
c010210b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010210e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0102115:	83 ec 0c             	sub    $0xc,%esp
c0102118:	50                   	push   %eax
c0102119:	e8 8a a1 00 00       	call   c010c2a8 <Strlen>
c010211e:	83 c4 10             	add    $0x10,%esp
c0102121:	85 c0                	test   %eax,%eax
c0102123:	74 47                	je     c010216c <mkfs+0x5af>
c0102125:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0102129:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010212c:	8d 50 05             	lea    0x5(%eax),%edx
c010212f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102132:	89 10                	mov    %edx,(%eax)
c0102134:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102137:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c010213e:	83 ec 0c             	sub    $0xc,%esp
c0102141:	50                   	push   %eax
c0102142:	e8 61 a1 00 00       	call   c010c2a8 <Strlen>
c0102147:	83 c4 10             	add    $0x10,%esp
c010214a:	89 c1                	mov    %eax,%ecx
c010214c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010214f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0102156:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102159:	83 c2 04             	add    $0x4,%edx
c010215c:	83 ec 04             	sub    $0x4,%esp
c010215f:	51                   	push   %ecx
c0102160:	50                   	push   %eax
c0102161:	52                   	push   %edx
c0102162:	e8 f5 4d 00 00       	call   c0106f5c <Memcpy>
c0102167:	83 c4 10             	add    $0x10,%esp
c010216a:	eb 01                	jmp    c010216d <mkfs+0x5b0>
c010216c:	90                   	nop
c010216d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0102171:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102174:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0102177:	7c 92                	jl     c010210b <mkfs+0x54e>
c0102179:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010217e:	89 c2                	mov    %eax,%edx
c0102180:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102183:	83 ec 0c             	sub    $0xc,%esp
c0102186:	6a 0a                	push   $0xa
c0102188:	68 00 02 00 00       	push   $0x200
c010218d:	52                   	push   %edx
c010218e:	6a 20                	push   $0x20
c0102190:	50                   	push   %eax
c0102191:	e8 4e f9 ff ff       	call   c0101ae4 <rd_wt>
c0102196:	83 c4 20             	add    $0x20,%esp
c0102199:	90                   	nop
c010219a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c010219d:	c9                   	leave  
c010219e:	c3                   	ret    

c010219f <init_fs>:
c010219f:	55                   	push   %ebp
c01021a0:	89 e5                	mov    %esp,%ebp
c01021a2:	83 ec 18             	sub    $0x18,%esp
c01021a5:	83 ec 0c             	sub    $0xc,%esp
c01021a8:	6a 7c                	push   $0x7c
c01021aa:	e8 fd f6 ff ff       	call   c01018ac <sys_malloc>
c01021af:	83 c4 10             	add    $0x10,%esp
c01021b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01021b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01021b8:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c01021bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01021c2:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c01021c9:	83 ec 04             	sub    $0x4,%esp
c01021cc:	6a 03                	push   $0x3
c01021ce:	ff 75 f4             	pushl  -0xc(%ebp)
c01021d1:	6a 03                	push   $0x3
c01021d3:	e8 0d 76 00 00       	call   c01097e5 <send_rec>
c01021d8:	83 c4 10             	add    $0x10,%esp
c01021db:	e8 dd f9 ff ff       	call   c0101bbd <mkfs>
c01021e0:	83 ec 08             	sub    $0x8,%esp
c01021e3:	6a 7c                	push   $0x7c
c01021e5:	ff 75 f4             	pushl  -0xc(%ebp)
c01021e8:	e8 d4 f6 ff ff       	call   c01018c1 <sys_free>
c01021ed:	83 c4 10             	add    $0x10,%esp
c01021f0:	90                   	nop
c01021f1:	c9                   	leave  
c01021f2:	c3                   	ret    

c01021f3 <do_open>:
c01021f3:	55                   	push   %ebp
c01021f4:	89 e5                	mov    %esp,%ebp
c01021f6:	83 ec 68             	sub    $0x68,%esp
c01021f9:	83 ec 04             	sub    $0x4,%esp
c01021fc:	6a 0c                	push   $0xc
c01021fe:	6a 00                	push   $0x0
c0102200:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102203:	50                   	push   %eax
c0102204:	e8 66 a0 00 00       	call   c010c26f <Memset>
c0102209:	83 c4 10             	add    $0x10,%esp
c010220c:	8b 45 08             	mov    0x8(%ebp),%eax
c010220f:	8b 40 44             	mov    0x44(%eax),%eax
c0102212:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102215:	83 ec 08             	sub    $0x8,%esp
c0102218:	6a 0c                	push   $0xc
c010221a:	ff 75 e4             	pushl  -0x1c(%ebp)
c010221d:	e8 cd 3e 00 00       	call   c01060ef <alloc_virtual_memory>
c0102222:	83 c4 10             	add    $0x10,%esp
c0102225:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102228:	8b 45 08             	mov    0x8(%ebp),%eax
c010222b:	8b 40 40             	mov    0x40(%eax),%eax
c010222e:	89 c2                	mov    %eax,%edx
c0102230:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102233:	83 ec 04             	sub    $0x4,%esp
c0102236:	52                   	push   %edx
c0102237:	50                   	push   %eax
c0102238:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010223b:	50                   	push   %eax
c010223c:	e8 1b 4d 00 00       	call   c0106f5c <Memcpy>
c0102241:	83 c4 10             	add    $0x10,%esp
c0102244:	8b 45 08             	mov    0x8(%ebp),%eax
c0102247:	8b 40 40             	mov    0x40(%eax),%eax
c010224a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c010224f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102252:	8b 40 74             	mov    0x74(%eax),%eax
c0102255:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102258:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c010225f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102266:	eb 1f                	jmp    c0102287 <do_open+0x94>
c0102268:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010226d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102270:	83 c2 4c             	add    $0x4c,%edx
c0102273:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0102277:	85 c0                	test   %eax,%eax
c0102279:	75 08                	jne    c0102283 <do_open+0x90>
c010227b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010227e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102281:	eb 0a                	jmp    c010228d <do_open+0x9a>
c0102283:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102287:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c010228b:	7e db                	jle    c0102268 <do_open+0x75>
c010228d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0102291:	75 1c                	jne    c01022af <do_open+0xbc>
c0102293:	68 c6 01 00 00       	push   $0x1c6
c0102298:	68 94 b3 10 c0       	push   $0xc010b394
c010229d:	68 94 b3 10 c0       	push   $0xc010b394
c01022a2:	68 87 b4 10 c0       	push   $0xc010b487
c01022a7:	e8 c9 68 00 00       	call   c0108b75 <assertion_failure>
c01022ac:	83 c4 10             	add    $0x10,%esp
c01022af:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c01022b6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01022bd:	eb 1d                	jmp    c01022dc <do_open+0xe9>
c01022bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022c2:	c1 e0 04             	shl    $0x4,%eax
c01022c5:	05 88 13 11 c0       	add    $0xc0111388,%eax
c01022ca:	8b 00                	mov    (%eax),%eax
c01022cc:	85 c0                	test   %eax,%eax
c01022ce:	75 08                	jne    c01022d8 <do_open+0xe5>
c01022d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01022d6:	eb 0a                	jmp    c01022e2 <do_open+0xef>
c01022d8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01022dc:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c01022e0:	7e dd                	jle    c01022bf <do_open+0xcc>
c01022e2:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c01022e6:	75 1c                	jne    c0102304 <do_open+0x111>
c01022e8:	68 d2 01 00 00       	push   $0x1d2
c01022ed:	68 94 b3 10 c0       	push   $0xc010b394
c01022f2:	68 94 b3 10 c0       	push   $0xc010b394
c01022f7:	68 8f b4 10 c0       	push   $0xc010b48f
c01022fc:	e8 74 68 00 00       	call   c0108b75 <assertion_failure>
c0102301:	83 c4 10             	add    $0x10,%esp
c0102304:	83 ec 0c             	sub    $0xc,%esp
c0102307:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010230a:	50                   	push   %eax
c010230b:	e8 d2 00 00 00       	call   c01023e2 <search_file>
c0102310:	83 c4 10             	add    $0x10,%esp
c0102313:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102316:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010231a:	75 2b                	jne    c0102347 <do_open+0x154>
c010231c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0102320:	7e 10                	jle    c0102332 <do_open+0x13f>
c0102322:	83 ec 0c             	sub    $0xc,%esp
c0102325:	68 97 b4 10 c0       	push   $0xc010b497
c010232a:	e8 28 68 00 00       	call   c0108b57 <panic>
c010232f:	83 c4 10             	add    $0x10,%esp
c0102332:	83 ec 08             	sub    $0x8,%esp
c0102335:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102338:	50                   	push   %eax
c0102339:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010233c:	50                   	push   %eax
c010233d:	e8 60 04 00 00       	call   c01027a2 <create_file>
c0102342:	83 c4 10             	add    $0x10,%esp
c0102345:	eb 25                	jmp    c010236c <do_open+0x179>
c0102347:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010234b:	75 0a                	jne    c0102357 <do_open+0x164>
c010234d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102352:	e9 89 00 00 00       	jmp    c01023e0 <do_open+0x1ed>
c0102357:	83 ec 08             	sub    $0x8,%esp
c010235a:	ff 75 d8             	pushl  -0x28(%ebp)
c010235d:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0102360:	50                   	push   %eax
c0102361:	e8 7a 02 00 00       	call   c01025e0 <get_inode>
c0102366:	83 c4 10             	add    $0x10,%esp
c0102369:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010236c:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0102371:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102374:	c1 e2 04             	shl    $0x4,%edx
c0102377:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010237d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102380:	83 c2 4c             	add    $0x4c,%edx
c0102383:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102387:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010238a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010238d:	c1 e2 04             	shl    $0x4,%edx
c0102390:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102396:	89 02                	mov    %eax,(%edx)
c0102398:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010239b:	c1 e0 04             	shl    $0x4,%eax
c010239e:	05 84 13 11 c0       	add    $0xc0111384,%eax
c01023a3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01023a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023ac:	c1 e0 04             	shl    $0x4,%eax
c01023af:	05 80 13 11 c0       	add    $0xc0111380,%eax
c01023b4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01023ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023bd:	c1 e0 04             	shl    $0x4,%eax
c01023c0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01023c5:	8b 00                	mov    (%eax),%eax
c01023c7:	8d 50 01             	lea    0x1(%eax),%edx
c01023ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023cd:	c1 e0 04             	shl    $0x4,%eax
c01023d0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01023d5:	89 10                	mov    %edx,(%eax)
c01023d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023da:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01023dd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01023e0:	c9                   	leave  
c01023e1:	c3                   	ret    

c01023e2 <search_file>:
c01023e2:	55                   	push   %ebp
c01023e3:	89 e5                	mov    %esp,%ebp
c01023e5:	83 ec 68             	sub    $0x68,%esp
c01023e8:	83 ec 04             	sub    $0x4,%esp
c01023eb:	6a 0c                	push   $0xc
c01023ed:	6a 00                	push   $0x0
c01023ef:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01023f2:	50                   	push   %eax
c01023f3:	e8 77 9e 00 00       	call   c010c26f <Memset>
c01023f8:	83 c4 10             	add    $0x10,%esp
c01023fb:	83 ec 04             	sub    $0x4,%esp
c01023fe:	6a 28                	push   $0x28
c0102400:	6a 00                	push   $0x0
c0102402:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102405:	50                   	push   %eax
c0102406:	e8 64 9e 00 00       	call   c010c26f <Memset>
c010240b:	83 c4 10             	add    $0x10,%esp
c010240e:	83 ec 04             	sub    $0x4,%esp
c0102411:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102414:	50                   	push   %eax
c0102415:	ff 75 08             	pushl  0x8(%ebp)
c0102418:	8d 45 c0             	lea    -0x40(%ebp),%eax
c010241b:	50                   	push   %eax
c010241c:	e8 f3 00 00 00       	call   c0102514 <strip_path>
c0102421:	83 c4 10             	add    $0x10,%esp
c0102424:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102427:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c010242b:	75 0a                	jne    c0102437 <search_file+0x55>
c010242d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102432:	e9 db 00 00 00       	jmp    c0102512 <search_file+0x130>
c0102437:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010243a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010243d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102440:	05 00 02 00 00       	add    $0x200,%eax
c0102445:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010244b:	85 c0                	test   %eax,%eax
c010244d:	0f 48 c2             	cmovs  %edx,%eax
c0102450:	c1 f8 09             	sar    $0x9,%eax
c0102453:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102456:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102459:	c1 e8 04             	shr    $0x4,%eax
c010245c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010245f:	e8 5c 14 00 00       	call   c01038c0 <get_super_block>
c0102464:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102467:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010246a:	8b 00                	mov    (%eax),%eax
c010246c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010246f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102476:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010247d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102484:	eb 7b                	jmp    c0102501 <search_file+0x11f>
c0102486:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010248b:	89 c1                	mov    %eax,%ecx
c010248d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102490:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102493:	01 d0                	add    %edx,%eax
c0102495:	83 ec 0c             	sub    $0xc,%esp
c0102498:	6a 07                	push   $0x7
c010249a:	68 00 02 00 00       	push   $0x200
c010249f:	51                   	push   %ecx
c01024a0:	ff 75 cc             	pushl  -0x34(%ebp)
c01024a3:	50                   	push   %eax
c01024a4:	e8 3b f6 ff ff       	call   c0101ae4 <rd_wt>
c01024a9:	83 c4 20             	add    $0x20,%esp
c01024ac:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01024b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01024b4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01024bb:	eb 35                	jmp    c01024f2 <search_file+0x110>
c01024bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01024c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024c4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01024c7:	7f 33                	jg     c01024fc <search_file+0x11a>
c01024c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024cc:	83 c0 04             	add    $0x4,%eax
c01024cf:	83 ec 08             	sub    $0x8,%esp
c01024d2:	50                   	push   %eax
c01024d3:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01024d6:	50                   	push   %eax
c01024d7:	e8 70 76 00 00       	call   c0109b4c <strcmp>
c01024dc:	83 c4 10             	add    $0x10,%esp
c01024df:	85 c0                	test   %eax,%eax
c01024e1:	75 07                	jne    c01024ea <search_file+0x108>
c01024e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024e6:	8b 00                	mov    (%eax),%eax
c01024e8:	eb 28                	jmp    c0102512 <search_file+0x130>
c01024ea:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01024ee:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c01024f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01024f5:	83 f8 1f             	cmp    $0x1f,%eax
c01024f8:	76 c3                	jbe    c01024bd <search_file+0xdb>
c01024fa:	eb 01                	jmp    c01024fd <search_file+0x11b>
c01024fc:	90                   	nop
c01024fd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102501:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102504:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102507:	0f 8c 79 ff ff ff    	jl     c0102486 <search_file+0xa4>
c010250d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102512:	c9                   	leave  
c0102513:	c3                   	ret    

c0102514 <strip_path>:
c0102514:	55                   	push   %ebp
c0102515:	89 e5                	mov    %esp,%ebp
c0102517:	83 ec 10             	sub    $0x10,%esp
c010251a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010251e:	75 0a                	jne    c010252a <strip_path+0x16>
c0102520:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102525:	e9 b4 00 00 00       	jmp    c01025de <strip_path+0xca>
c010252a:	8b 45 08             	mov    0x8(%ebp),%eax
c010252d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102530:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102533:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102536:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102539:	0f b6 00             	movzbl (%eax),%eax
c010253c:	3c 2f                	cmp    $0x2f,%al
c010253e:	75 2d                	jne    c010256d <strip_path+0x59>
c0102540:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102544:	eb 27                	jmp    c010256d <strip_path+0x59>
c0102546:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102549:	0f b6 00             	movzbl (%eax),%eax
c010254c:	3c 2f                	cmp    $0x2f,%al
c010254e:	75 0a                	jne    c010255a <strip_path+0x46>
c0102550:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102555:	e9 84 00 00 00       	jmp    c01025de <strip_path+0xca>
c010255a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010255d:	0f b6 10             	movzbl (%eax),%edx
c0102560:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102563:	88 10                	mov    %dl,(%eax)
c0102565:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102569:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010256d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102570:	0f b6 00             	movzbl (%eax),%eax
c0102573:	84 c0                	test   %al,%al
c0102575:	75 cf                	jne    c0102546 <strip_path+0x32>
c0102577:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010257a:	c6 00 00             	movb   $0x0,(%eax)
c010257d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102580:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102586:	89 10                	mov    %edx,(%eax)
c0102588:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010258e:	89 50 04             	mov    %edx,0x4(%eax)
c0102591:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102597:	89 50 08             	mov    %edx,0x8(%eax)
c010259a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c01025a0:	89 50 0c             	mov    %edx,0xc(%eax)
c01025a3:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c01025a9:	89 50 10             	mov    %edx,0x10(%eax)
c01025ac:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c01025b2:	89 50 14             	mov    %edx,0x14(%eax)
c01025b5:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c01025bb:	89 50 18             	mov    %edx,0x18(%eax)
c01025be:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c01025c4:	89 50 1c             	mov    %edx,0x1c(%eax)
c01025c7:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c01025cd:	89 50 20             	mov    %edx,0x20(%eax)
c01025d0:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c01025d6:	89 50 24             	mov    %edx,0x24(%eax)
c01025d9:	b8 00 00 00 00       	mov    $0x0,%eax
c01025de:	c9                   	leave  
c01025df:	c3                   	ret    

c01025e0 <get_inode>:
c01025e0:	55                   	push   %ebp
c01025e1:	89 e5                	mov    %esp,%ebp
c01025e3:	56                   	push   %esi
c01025e4:	53                   	push   %ebx
c01025e5:	83 ec 20             	sub    $0x20,%esp
c01025e8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01025ec:	75 0a                	jne    c01025f8 <get_inode+0x18>
c01025ee:	b8 00 00 00 00       	mov    $0x0,%eax
c01025f3:	e9 a3 01 00 00       	jmp    c010279b <get_inode+0x1bb>
c01025f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01025ff:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102606:	eb 69                	jmp    c0102671 <get_inode+0x91>
c0102608:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010260b:	8b 40 24             	mov    0x24(%eax),%eax
c010260e:	85 c0                	test   %eax,%eax
c0102610:	7e 53                	jle    c0102665 <get_inode+0x85>
c0102612:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102615:	8b 40 10             	mov    0x10(%eax),%eax
c0102618:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010261b:	75 50                	jne    c010266d <get_inode+0x8d>
c010261d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102620:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102623:	8b 0a                	mov    (%edx),%ecx
c0102625:	89 08                	mov    %ecx,(%eax)
c0102627:	8b 4a 04             	mov    0x4(%edx),%ecx
c010262a:	89 48 04             	mov    %ecx,0x4(%eax)
c010262d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102630:	89 48 08             	mov    %ecx,0x8(%eax)
c0102633:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102636:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102639:	8b 4a 10             	mov    0x10(%edx),%ecx
c010263c:	89 48 10             	mov    %ecx,0x10(%eax)
c010263f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102642:	89 48 14             	mov    %ecx,0x14(%eax)
c0102645:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102648:	89 48 18             	mov    %ecx,0x18(%eax)
c010264b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010264e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102651:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102654:	89 48 20             	mov    %ecx,0x20(%eax)
c0102657:	8b 52 24             	mov    0x24(%edx),%edx
c010265a:	89 50 24             	mov    %edx,0x24(%eax)
c010265d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102660:	e9 36 01 00 00       	jmp    c010279b <get_inode+0x1bb>
c0102665:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102668:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010266b:	eb 0d                	jmp    c010267a <get_inode+0x9a>
c010266d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102671:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102678:	76 8e                	jbe    c0102608 <get_inode+0x28>
c010267a:	e8 41 12 00 00       	call   c01038c0 <get_super_block>
c010267f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102682:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102689:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010268c:	8b 40 04             	mov    0x4(%eax),%eax
c010268f:	8d 50 02             	lea    0x2(%eax),%edx
c0102692:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102695:	8b 40 08             	mov    0x8(%eax),%eax
c0102698:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010269b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010269e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01026a1:	b8 00 02 00 00       	mov    $0x200,%eax
c01026a6:	99                   	cltd   
c01026a7:	f7 7d e8             	idivl  -0x18(%ebp)
c01026aa:	89 c6                	mov    %eax,%esi
c01026ac:	89 c8                	mov    %ecx,%eax
c01026ae:	99                   	cltd   
c01026af:	f7 fe                	idiv   %esi
c01026b1:	01 d8                	add    %ebx,%eax
c01026b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01026b6:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c01026bd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01026c2:	83 ec 0c             	sub    $0xc,%esp
c01026c5:	6a 07                	push   $0x7
c01026c7:	68 00 02 00 00       	push   $0x200
c01026cc:	50                   	push   %eax
c01026cd:	ff 75 e0             	pushl  -0x20(%ebp)
c01026d0:	ff 75 e4             	pushl  -0x1c(%ebp)
c01026d3:	e8 0c f4 ff ff       	call   c0101ae4 <rd_wt>
c01026d8:	83 c4 20             	add    $0x20,%esp
c01026db:	8b 45 0c             	mov    0xc(%ebp),%eax
c01026de:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01026e1:	b8 00 02 00 00       	mov    $0x200,%eax
c01026e6:	99                   	cltd   
c01026e7:	f7 7d e8             	idivl  -0x18(%ebp)
c01026ea:	89 c3                	mov    %eax,%ebx
c01026ec:	89 c8                	mov    %ecx,%eax
c01026ee:	99                   	cltd   
c01026ef:	f7 fb                	idiv   %ebx
c01026f1:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01026f4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01026fd:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102701:	01 d0                	add    %edx,%eax
c0102703:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102706:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102709:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010270c:	8b 0a                	mov    (%edx),%ecx
c010270e:	89 08                	mov    %ecx,(%eax)
c0102710:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102713:	89 48 04             	mov    %ecx,0x4(%eax)
c0102716:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102719:	89 48 08             	mov    %ecx,0x8(%eax)
c010271c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010271f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102722:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102725:	89 48 10             	mov    %ecx,0x10(%eax)
c0102728:	8b 4a 14             	mov    0x14(%edx),%ecx
c010272b:	89 48 14             	mov    %ecx,0x14(%eax)
c010272e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102731:	89 48 18             	mov    %ecx,0x18(%eax)
c0102734:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102737:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010273a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010273d:	89 48 20             	mov    %ecx,0x20(%eax)
c0102740:	8b 52 24             	mov    0x24(%edx),%edx
c0102743:	89 50 24             	mov    %edx,0x24(%eax)
c0102746:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102749:	8b 55 0c             	mov    0xc(%ebp),%edx
c010274c:	89 50 10             	mov    %edx,0x10(%eax)
c010274f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102752:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102755:	89 50 20             	mov    %edx,0x20(%eax)
c0102758:	8b 45 08             	mov    0x8(%ebp),%eax
c010275b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010275e:	8b 0a                	mov    (%edx),%ecx
c0102760:	89 08                	mov    %ecx,(%eax)
c0102762:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102765:	89 48 04             	mov    %ecx,0x4(%eax)
c0102768:	8b 4a 08             	mov    0x8(%edx),%ecx
c010276b:	89 48 08             	mov    %ecx,0x8(%eax)
c010276e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102771:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102774:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102777:	89 48 10             	mov    %ecx,0x10(%eax)
c010277a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010277d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102780:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102783:	89 48 18             	mov    %ecx,0x18(%eax)
c0102786:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102789:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010278c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010278f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102792:	8b 52 24             	mov    0x24(%edx),%edx
c0102795:	89 50 24             	mov    %edx,0x24(%eax)
c0102798:	8b 45 08             	mov    0x8(%ebp),%eax
c010279b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010279e:	5b                   	pop    %ebx
c010279f:	5e                   	pop    %esi
c01027a0:	5d                   	pop    %ebp
c01027a1:	c3                   	ret    

c01027a2 <create_file>:
c01027a2:	55                   	push   %ebp
c01027a3:	89 e5                	mov    %esp,%ebp
c01027a5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01027ab:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01027ae:	50                   	push   %eax
c01027af:	ff 75 0c             	pushl  0xc(%ebp)
c01027b2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01027b5:	50                   	push   %eax
c01027b6:	e8 59 fd ff ff       	call   c0102514 <strip_path>
c01027bb:	83 c4 0c             	add    $0xc,%esp
c01027be:	83 f8 ff             	cmp    $0xffffffff,%eax
c01027c1:	75 0a                	jne    c01027cd <create_file+0x2b>
c01027c3:	b8 00 00 00 00       	mov    $0x0,%eax
c01027c8:	e9 de 00 00 00       	jmp    c01028ab <create_file+0x109>
c01027cd:	e8 db 00 00 00       	call   c01028ad <alloc_imap_bit>
c01027d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01027d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01027d9:	75 0a                	jne    c01027e5 <create_file+0x43>
c01027db:	b8 00 00 00 00       	mov    $0x0,%eax
c01027e0:	e9 c6 00 00 00       	jmp    c01028ab <create_file+0x109>
c01027e5:	e8 d6 10 00 00       	call   c01038c0 <get_super_block>
c01027ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01027ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027f0:	8b 40 10             	mov    0x10(%eax),%eax
c01027f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01027f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027f9:	83 ec 08             	sub    $0x8,%esp
c01027fc:	50                   	push   %eax
c01027fd:	ff 75 f4             	pushl  -0xc(%ebp)
c0102800:	e8 a5 01 00 00       	call   c01029aa <alloc_smap_bit>
c0102805:	83 c4 10             	add    $0x10,%esp
c0102808:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010280b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010280f:	75 0a                	jne    c010281b <create_file+0x79>
c0102811:	b8 00 00 00 00       	mov    $0x0,%eax
c0102816:	e9 90 00 00 00       	jmp    c01028ab <create_file+0x109>
c010281b:	83 ec 04             	sub    $0x4,%esp
c010281e:	ff 75 e8             	pushl  -0x18(%ebp)
c0102821:	ff 75 f4             	pushl  -0xc(%ebp)
c0102824:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0102827:	50                   	push   %eax
c0102828:	e8 1e 03 00 00       	call   c0102b4b <new_inode>
c010282d:	83 c4 10             	add    $0x10,%esp
c0102830:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102833:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102837:	75 07                	jne    c0102840 <create_file+0x9e>
c0102839:	b8 00 00 00 00       	mov    $0x0,%eax
c010283e:	eb 6b                	jmp    c01028ab <create_file+0x109>
c0102840:	ff 75 f4             	pushl  -0xc(%ebp)
c0102843:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102846:	50                   	push   %eax
c0102847:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010284a:	50                   	push   %eax
c010284b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102851:	50                   	push   %eax
c0102852:	e8 12 04 00 00       	call   c0102c69 <new_dir_entry>
c0102857:	83 c4 10             	add    $0x10,%esp
c010285a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010285d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102861:	75 07                	jne    c010286a <create_file+0xc8>
c0102863:	b8 00 00 00 00       	mov    $0x0,%eax
c0102868:	eb 41                	jmp    c01028ab <create_file+0x109>
c010286a:	8b 45 08             	mov    0x8(%ebp),%eax
c010286d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102870:	89 10                	mov    %edx,(%eax)
c0102872:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102875:	89 50 04             	mov    %edx,0x4(%eax)
c0102878:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010287b:	89 50 08             	mov    %edx,0x8(%eax)
c010287e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102881:	89 50 0c             	mov    %edx,0xc(%eax)
c0102884:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102887:	89 50 10             	mov    %edx,0x10(%eax)
c010288a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010288d:	89 50 14             	mov    %edx,0x14(%eax)
c0102890:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102893:	89 50 18             	mov    %edx,0x18(%eax)
c0102896:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102899:	89 50 1c             	mov    %edx,0x1c(%eax)
c010289c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010289f:	89 50 20             	mov    %edx,0x20(%eax)
c01028a2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01028a5:	89 50 24             	mov    %edx,0x24(%eax)
c01028a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01028ab:	c9                   	leave  
c01028ac:	c3                   	ret    

c01028ad <alloc_imap_bit>:
c01028ad:	55                   	push   %ebp
c01028ae:	89 e5                	mov    %esp,%ebp
c01028b0:	53                   	push   %ebx
c01028b1:	83 ec 24             	sub    $0x24,%esp
c01028b4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01028bb:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01028c2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01028c7:	83 ec 0c             	sub    $0xc,%esp
c01028ca:	6a 07                	push   $0x7
c01028cc:	68 00 02 00 00       	push   $0x200
c01028d1:	50                   	push   %eax
c01028d2:	ff 75 e8             	pushl  -0x18(%ebp)
c01028d5:	ff 75 ec             	pushl  -0x14(%ebp)
c01028d8:	e8 07 f2 ff ff       	call   c0101ae4 <rd_wt>
c01028dd:	83 c4 20             	add    $0x20,%esp
c01028e0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01028e7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01028ee:	e9 a5 00 00 00       	jmp    c0102998 <alloc_imap_bit+0xeb>
c01028f3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01028fa:	e9 8b 00 00 00       	jmp    c010298a <alloc_imap_bit+0xdd>
c01028ff:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102905:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102908:	01 d0                	add    %edx,%eax
c010290a:	0f b6 00             	movzbl (%eax),%eax
c010290d:	0f be d0             	movsbl %al,%edx
c0102910:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102913:	89 c1                	mov    %eax,%ecx
c0102915:	d3 fa                	sar    %cl,%edx
c0102917:	89 d0                	mov    %edx,%eax
c0102919:	83 e0 01             	and    $0x1,%eax
c010291c:	85 c0                	test   %eax,%eax
c010291e:	74 06                	je     c0102926 <alloc_imap_bit+0x79>
c0102920:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102924:	eb 64                	jmp    c010298a <alloc_imap_bit+0xdd>
c0102926:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010292c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010292f:	01 d0                	add    %edx,%eax
c0102931:	0f b6 18             	movzbl (%eax),%ebx
c0102934:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102937:	ba 01 00 00 00       	mov    $0x1,%edx
c010293c:	89 c1                	mov    %eax,%ecx
c010293e:	d3 e2                	shl    %cl,%edx
c0102940:	89 d0                	mov    %edx,%eax
c0102942:	89 c1                	mov    %eax,%ecx
c0102944:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010294a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010294d:	01 d0                	add    %edx,%eax
c010294f:	09 cb                	or     %ecx,%ebx
c0102951:	89 da                	mov    %ebx,%edx
c0102953:	88 10                	mov    %dl,(%eax)
c0102955:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102958:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010295f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102962:	01 d0                	add    %edx,%eax
c0102964:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102967:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010296c:	83 ec 0c             	sub    $0xc,%esp
c010296f:	6a 0a                	push   $0xa
c0102971:	68 00 02 00 00       	push   $0x200
c0102976:	50                   	push   %eax
c0102977:	ff 75 e8             	pushl  -0x18(%ebp)
c010297a:	ff 75 ec             	pushl  -0x14(%ebp)
c010297d:	e8 62 f1 ff ff       	call   c0101ae4 <rd_wt>
c0102982:	83 c4 20             	add    $0x20,%esp
c0102985:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102988:	eb 1b                	jmp    c01029a5 <alloc_imap_bit+0xf8>
c010298a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010298e:	0f 8e 6b ff ff ff    	jle    c01028ff <alloc_imap_bit+0x52>
c0102994:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102998:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010299f:	0f 8e 4e ff ff ff    	jle    c01028f3 <alloc_imap_bit+0x46>
c01029a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01029a8:	c9                   	leave  
c01029a9:	c3                   	ret    

c01029aa <alloc_smap_bit>:
c01029aa:	55                   	push   %ebp
c01029ab:	89 e5                	mov    %esp,%ebp
c01029ad:	53                   	push   %ebx
c01029ae:	83 ec 34             	sub    $0x34,%esp
c01029b1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01029b5:	75 1c                	jne    c01029d3 <alloc_smap_bit+0x29>
c01029b7:	68 fd 02 00 00       	push   $0x2fd
c01029bc:	68 94 b3 10 c0       	push   $0xc010b394
c01029c1:	68 94 b3 10 c0       	push   $0xc010b394
c01029c6:	68 a4 b4 10 c0       	push   $0xc010b4a4
c01029cb:	e8 a5 61 00 00       	call   c0108b75 <assertion_failure>
c01029d0:	83 c4 10             	add    $0x10,%esp
c01029d3:	e8 e8 0e 00 00       	call   c01038c0 <get_super_block>
c01029d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01029db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01029de:	8b 40 08             	mov    0x8(%eax),%eax
c01029e1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01029e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01029e7:	8b 40 04             	mov    0x4(%eax),%eax
c01029ea:	83 c0 02             	add    $0x2,%eax
c01029ed:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01029f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01029f7:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c01029fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102a05:	e9 20 01 00 00       	jmp    c0102b2a <alloc_smap_bit+0x180>
c0102a0a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102a0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a10:	01 d0                	add    %edx,%eax
c0102a12:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102a15:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a1a:	83 ec 0c             	sub    $0xc,%esp
c0102a1d:	6a 07                	push   $0x7
c0102a1f:	68 00 02 00 00       	push   $0x200
c0102a24:	50                   	push   %eax
c0102a25:	ff 75 d8             	pushl  -0x28(%ebp)
c0102a28:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102a2b:	e8 b4 f0 ff ff       	call   c0101ae4 <rd_wt>
c0102a30:	83 c4 20             	add    $0x20,%esp
c0102a33:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102a3a:	e9 b0 00 00 00       	jmp    c0102aef <alloc_smap_bit+0x145>
c0102a3f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102a46:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102a4a:	0f 85 8c 00 00 00    	jne    c0102adc <alloc_smap_bit+0x132>
c0102a50:	eb 45                	jmp    c0102a97 <alloc_smap_bit+0xed>
c0102a52:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102a58:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a5b:	01 d0                	add    %edx,%eax
c0102a5d:	0f b6 00             	movzbl (%eax),%eax
c0102a60:	0f be d0             	movsbl %al,%edx
c0102a63:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a66:	89 c1                	mov    %eax,%ecx
c0102a68:	d3 fa                	sar    %cl,%edx
c0102a6a:	89 d0                	mov    %edx,%eax
c0102a6c:	83 e0 01             	and    $0x1,%eax
c0102a6f:	85 c0                	test   %eax,%eax
c0102a71:	74 06                	je     c0102a79 <alloc_smap_bit+0xcf>
c0102a73:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102a77:	eb 1e                	jmp    c0102a97 <alloc_smap_bit+0xed>
c0102a79:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a7c:	c1 e0 09             	shl    $0x9,%eax
c0102a7f:	89 c2                	mov    %eax,%edx
c0102a81:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a84:	01 d0                	add    %edx,%eax
c0102a86:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0102a8d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a90:	01 d0                	add    %edx,%eax
c0102a92:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102a95:	eb 06                	jmp    c0102a9d <alloc_smap_bit+0xf3>
c0102a97:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102a9b:	7e b5                	jle    c0102a52 <alloc_smap_bit+0xa8>
c0102a9d:	eb 3d                	jmp    c0102adc <alloc_smap_bit+0x132>
c0102a9f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102aa3:	74 45                	je     c0102aea <alloc_smap_bit+0x140>
c0102aa5:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102aab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102aae:	01 d0                	add    %edx,%eax
c0102ab0:	0f b6 18             	movzbl (%eax),%ebx
c0102ab3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102ab6:	ba 01 00 00 00       	mov    $0x1,%edx
c0102abb:	89 c1                	mov    %eax,%ecx
c0102abd:	d3 e2                	shl    %cl,%edx
c0102abf:	89 d0                	mov    %edx,%eax
c0102ac1:	89 c1                	mov    %eax,%ecx
c0102ac3:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102ac9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102acc:	01 d0                	add    %edx,%eax
c0102ace:	09 cb                	or     %ecx,%ebx
c0102ad0:	89 da                	mov    %ebx,%edx
c0102ad2:	88 10                	mov    %dl,(%eax)
c0102ad4:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102ad8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102adc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102ae0:	74 09                	je     c0102aeb <alloc_smap_bit+0x141>
c0102ae2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102ae6:	7e b7                	jle    c0102a9f <alloc_smap_bit+0xf5>
c0102ae8:	eb 01                	jmp    c0102aeb <alloc_smap_bit+0x141>
c0102aea:	90                   	nop
c0102aeb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102aef:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102af6:	0f 8e 43 ff ff ff    	jle    c0102a3f <alloc_smap_bit+0x95>
c0102afc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102b00:	74 1e                	je     c0102b20 <alloc_smap_bit+0x176>
c0102b02:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102b07:	83 ec 0c             	sub    $0xc,%esp
c0102b0a:	6a 0a                	push   $0xa
c0102b0c:	68 00 02 00 00       	push   $0x200
c0102b11:	50                   	push   %eax
c0102b12:	ff 75 d8             	pushl  -0x28(%ebp)
c0102b15:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102b18:	e8 c7 ef ff ff       	call   c0101ae4 <rd_wt>
c0102b1d:	83 c4 20             	add    $0x20,%esp
c0102b20:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102b24:	74 12                	je     c0102b38 <alloc_smap_bit+0x18e>
c0102b26:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102b2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b2d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102b30:	0f 8c d4 fe ff ff    	jl     c0102a0a <alloc_smap_bit+0x60>
c0102b36:	eb 01                	jmp    c0102b39 <alloc_smap_bit+0x18f>
c0102b38:	90                   	nop
c0102b39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b3c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0102b3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102b42:	8b 00                	mov    (%eax),%eax
c0102b44:	01 d0                	add    %edx,%eax
c0102b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102b49:	c9                   	leave  
c0102b4a:	c3                   	ret    

c0102b4b <new_inode>:
c0102b4b:	55                   	push   %ebp
c0102b4c:	89 e5                	mov    %esp,%ebp
c0102b4e:	83 ec 38             	sub    $0x38,%esp
c0102b51:	83 ec 08             	sub    $0x8,%esp
c0102b54:	ff 75 0c             	pushl  0xc(%ebp)
c0102b57:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0102b5a:	50                   	push   %eax
c0102b5b:	e8 80 fa ff ff       	call   c01025e0 <get_inode>
c0102b60:	83 c4 10             	add    $0x10,%esp
c0102b63:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102b66:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0102b6a:	75 0a                	jne    c0102b76 <new_inode+0x2b>
c0102b6c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102b71:	e9 f1 00 00 00       	jmp    c0102c67 <new_inode+0x11c>
c0102b76:	8b 45 10             	mov    0x10(%ebp),%eax
c0102b79:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102b7c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102b83:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0102b8a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102b91:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b94:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102b97:	83 ec 0c             	sub    $0xc,%esp
c0102b9a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0102b9d:	50                   	push   %eax
c0102b9e:	e8 39 0b 00 00       	call   c01036dc <sync_inode>
c0102ba3:	83 c4 10             	add    $0x10,%esp
c0102ba6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0102bad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102bb4:	eb 1d                	jmp    c0102bd3 <new_inode+0x88>
c0102bb6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102bb9:	89 d0                	mov    %edx,%eax
c0102bbb:	c1 e0 02             	shl    $0x2,%eax
c0102bbe:	01 d0                	add    %edx,%eax
c0102bc0:	c1 e0 03             	shl    $0x3,%eax
c0102bc3:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102bc8:	8b 00                	mov    (%eax),%eax
c0102bca:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0102bcd:	74 0c                	je     c0102bdb <new_inode+0x90>
c0102bcf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102bd3:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102bd7:	7e dd                	jle    c0102bb6 <new_inode+0x6b>
c0102bd9:	eb 01                	jmp    c0102bdc <new_inode+0x91>
c0102bdb:	90                   	nop
c0102bdc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102bdf:	89 d0                	mov    %edx,%eax
c0102be1:	c1 e0 02             	shl    $0x2,%eax
c0102be4:	01 d0                	add    %edx,%eax
c0102be6:	c1 e0 03             	shl    $0x3,%eax
c0102be9:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c0102bee:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102bf1:	89 10                	mov    %edx,(%eax)
c0102bf3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102bf6:	89 50 04             	mov    %edx,0x4(%eax)
c0102bf9:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102bfc:	89 50 08             	mov    %edx,0x8(%eax)
c0102bff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102c02:	89 50 0c             	mov    %edx,0xc(%eax)
c0102c05:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102c08:	89 50 10             	mov    %edx,0x10(%eax)
c0102c0b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102c0e:	89 50 14             	mov    %edx,0x14(%eax)
c0102c11:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102c14:	89 50 18             	mov    %edx,0x18(%eax)
c0102c17:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102c1a:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102c1d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102c20:	89 50 20             	mov    %edx,0x20(%eax)
c0102c23:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102c26:	89 50 24             	mov    %edx,0x24(%eax)
c0102c29:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c2c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102c2f:	89 10                	mov    %edx,(%eax)
c0102c31:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102c34:	89 50 04             	mov    %edx,0x4(%eax)
c0102c37:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102c3a:	89 50 08             	mov    %edx,0x8(%eax)
c0102c3d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102c40:	89 50 0c             	mov    %edx,0xc(%eax)
c0102c43:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102c46:	89 50 10             	mov    %edx,0x10(%eax)
c0102c49:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102c4c:	89 50 14             	mov    %edx,0x14(%eax)
c0102c4f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102c52:	89 50 18             	mov    %edx,0x18(%eax)
c0102c55:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102c58:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102c5b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102c5e:	89 50 20             	mov    %edx,0x20(%eax)
c0102c61:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102c64:	89 50 24             	mov    %edx,0x24(%eax)
c0102c67:	c9                   	leave  
c0102c68:	c3                   	ret    

c0102c69 <new_dir_entry>:
c0102c69:	55                   	push   %ebp
c0102c6a:	89 e5                	mov    %esp,%ebp
c0102c6c:	83 ec 48             	sub    $0x48,%esp
c0102c6f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102c76:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c79:	8b 40 04             	mov    0x4(%eax),%eax
c0102c7c:	99                   	cltd   
c0102c7d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102c80:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102c83:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c86:	8b 40 0c             	mov    0xc(%eax),%eax
c0102c89:	99                   	cltd   
c0102c8a:	f7 7d dc             	idivl  -0x24(%ebp)
c0102c8d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102c90:	e8 2b 0c 00 00       	call   c01038c0 <get_super_block>
c0102c95:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102c98:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102c9b:	8b 00                	mov    (%eax),%eax
c0102c9d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102ca0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ca3:	8b 40 0c             	mov    0xc(%eax),%eax
c0102ca6:	05 00 02 00 00       	add    $0x200,%eax
c0102cab:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102cb1:	85 c0                	test   %eax,%eax
c0102cb3:	0f 48 c2             	cmovs  %edx,%eax
c0102cb6:	c1 f8 09             	sar    $0x9,%eax
c0102cb9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102cbc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102cc3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102cca:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102cd1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102cd8:	eb 7f                	jmp    c0102d59 <new_dir_entry+0xf0>
c0102cda:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102cdf:	89 c1                	mov    %eax,%ecx
c0102ce1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102ce4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102ce7:	01 d0                	add    %edx,%eax
c0102ce9:	83 ec 0c             	sub    $0xc,%esp
c0102cec:	6a 07                	push   $0x7
c0102cee:	68 00 02 00 00       	push   $0x200
c0102cf3:	51                   	push   %ecx
c0102cf4:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102cf7:	50                   	push   %eax
c0102cf8:	e8 e7 ed ff ff       	call   c0101ae4 <rd_wt>
c0102cfd:	83 c4 20             	add    $0x20,%esp
c0102d00:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102d05:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102d08:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102d0f:	eb 25                	jmp    c0102d36 <new_dir_entry+0xcd>
c0102d11:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102d15:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d18:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102d1b:	7f 29                	jg     c0102d46 <new_dir_entry+0xdd>
c0102d1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d20:	8b 00                	mov    (%eax),%eax
c0102d22:	85 c0                	test   %eax,%eax
c0102d24:	75 08                	jne    c0102d2e <new_dir_entry+0xc5>
c0102d26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d29:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102d2c:	eb 19                	jmp    c0102d47 <new_dir_entry+0xde>
c0102d2e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102d32:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102d36:	b8 00 02 00 00       	mov    $0x200,%eax
c0102d3b:	99                   	cltd   
c0102d3c:	f7 7d dc             	idivl  -0x24(%ebp)
c0102d3f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102d42:	7c cd                	jl     c0102d11 <new_dir_entry+0xa8>
c0102d44:	eb 01                	jmp    c0102d47 <new_dir_entry+0xde>
c0102d46:	90                   	nop
c0102d47:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d4a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102d4d:	7f 16                	jg     c0102d65 <new_dir_entry+0xfc>
c0102d4f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102d53:	75 10                	jne    c0102d65 <new_dir_entry+0xfc>
c0102d55:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102d59:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102d5c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102d5f:	0f 8c 75 ff ff ff    	jl     c0102cda <new_dir_entry+0x71>
c0102d65:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102d68:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102d6b:	75 0a                	jne    c0102d77 <new_dir_entry+0x10e>
c0102d6d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102d72:	e9 fc 00 00 00       	jmp    c0102e73 <new_dir_entry+0x20a>
c0102d77:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102d7e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102d82:	75 1e                	jne    c0102da2 <new_dir_entry+0x139>
c0102d84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d87:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102d8a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d8d:	8b 50 04             	mov    0x4(%eax),%edx
c0102d90:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102d93:	01 c2                	add    %eax,%edx
c0102d95:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d98:	89 50 04             	mov    %edx,0x4(%eax)
c0102d9b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102da5:	8b 55 14             	mov    0x14(%ebp),%edx
c0102da8:	89 10                	mov    %edx,(%eax)
c0102daa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102dad:	83 c0 04             	add    $0x4,%eax
c0102db0:	83 ec 08             	sub    $0x8,%esp
c0102db3:	ff 75 10             	pushl  0x10(%ebp)
c0102db6:	50                   	push   %eax
c0102db7:	e8 d2 94 00 00       	call   c010c28e <Strcpy>
c0102dbc:	83 c4 10             	add    $0x10,%esp
c0102dbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dc2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102dc5:	8b 0a                	mov    (%edx),%ecx
c0102dc7:	89 08                	mov    %ecx,(%eax)
c0102dc9:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102dcc:	89 48 04             	mov    %ecx,0x4(%eax)
c0102dcf:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102dd2:	89 48 08             	mov    %ecx,0x8(%eax)
c0102dd5:	8b 52 0c             	mov    0xc(%edx),%edx
c0102dd8:	89 50 0c             	mov    %edx,0xc(%eax)
c0102ddb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102de0:	89 c1                	mov    %eax,%ecx
c0102de2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102de5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102de8:	01 d0                	add    %edx,%eax
c0102dea:	83 ec 0c             	sub    $0xc,%esp
c0102ded:	6a 0a                	push   $0xa
c0102def:	68 00 02 00 00       	push   $0x200
c0102df4:	51                   	push   %ecx
c0102df5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102df8:	50                   	push   %eax
c0102df9:	e8 e6 ec ff ff       	call   c0101ae4 <rd_wt>
c0102dfe:	83 c4 20             	add    $0x20,%esp
c0102e01:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102e05:	74 69                	je     c0102e70 <new_dir_entry+0x207>
c0102e07:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e0a:	8b 10                	mov    (%eax),%edx
c0102e0c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102e12:	8b 50 04             	mov    0x4(%eax),%edx
c0102e15:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102e1b:	8b 50 08             	mov    0x8(%eax),%edx
c0102e1e:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102e24:	8b 50 0c             	mov    0xc(%eax),%edx
c0102e27:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102e2d:	8b 50 10             	mov    0x10(%eax),%edx
c0102e30:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102e36:	8b 50 14             	mov    0x14(%eax),%edx
c0102e39:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102e3f:	8b 50 18             	mov    0x18(%eax),%edx
c0102e42:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102e48:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102e4b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102e51:	8b 50 20             	mov    0x20(%eax),%edx
c0102e54:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102e5a:	8b 40 24             	mov    0x24(%eax),%eax
c0102e5d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102e62:	83 ec 0c             	sub    $0xc,%esp
c0102e65:	ff 75 0c             	pushl  0xc(%ebp)
c0102e68:	e8 6f 08 00 00       	call   c01036dc <sync_inode>
c0102e6d:	83 c4 10             	add    $0x10,%esp
c0102e70:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e73:	c9                   	leave  
c0102e74:	c3                   	ret    

c0102e75 <do_unlink>:
c0102e75:	55                   	push   %ebp
c0102e76:	89 e5                	mov    %esp,%ebp
c0102e78:	53                   	push   %ebx
c0102e79:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102e7f:	83 ec 08             	sub    $0x8,%esp
c0102e82:	ff 75 08             	pushl  0x8(%ebp)
c0102e85:	68 b9 b4 10 c0       	push   $0xc010b4b9
c0102e8a:	e8 bd 6c 00 00       	call   c0109b4c <strcmp>
c0102e8f:	83 c4 10             	add    $0x10,%esp
c0102e92:	85 c0                	test   %eax,%eax
c0102e94:	75 10                	jne    c0102ea6 <do_unlink+0x31>
c0102e96:	83 ec 0c             	sub    $0xc,%esp
c0102e99:	68 bb b4 10 c0       	push   $0xc010b4bb
c0102e9e:	e8 b4 5c 00 00       	call   c0108b57 <panic>
c0102ea3:	83 c4 10             	add    $0x10,%esp
c0102ea6:	83 ec 0c             	sub    $0xc,%esp
c0102ea9:	ff 75 08             	pushl  0x8(%ebp)
c0102eac:	e8 31 f5 ff ff       	call   c01023e2 <search_file>
c0102eb1:	83 c4 10             	add    $0x10,%esp
c0102eb4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102eb7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102ebb:	75 10                	jne    c0102ecd <do_unlink+0x58>
c0102ebd:	83 ec 0c             	sub    $0xc,%esp
c0102ec0:	68 d7 b4 10 c0       	push   $0xc010b4d7
c0102ec5:	e8 8d 5c 00 00       	call   c0108b57 <panic>
c0102eca:	83 c4 10             	add    $0x10,%esp
c0102ecd:	83 ec 08             	sub    $0x8,%esp
c0102ed0:	ff 75 d0             	pushl  -0x30(%ebp)
c0102ed3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102ed9:	50                   	push   %eax
c0102eda:	e8 01 f7 ff ff       	call   c01025e0 <get_inode>
c0102edf:	83 c4 10             	add    $0x10,%esp
c0102ee2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102ee5:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102ee9:	75 10                	jne    c0102efb <do_unlink+0x86>
c0102eeb:	83 ec 0c             	sub    $0xc,%esp
c0102eee:	68 d7 b4 10 c0       	push   $0xc010b4d7
c0102ef3:	e8 5f 5c 00 00       	call   c0108b57 <panic>
c0102ef8:	83 c4 10             	add    $0x10,%esp
c0102efb:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102efe:	85 c0                	test   %eax,%eax
c0102f00:	7e 10                	jle    c0102f12 <do_unlink+0x9d>
c0102f02:	83 ec 0c             	sub    $0xc,%esp
c0102f05:	68 f0 b4 10 c0       	push   $0xc010b4f0
c0102f0a:	e8 48 5c 00 00       	call   c0108b57 <panic>
c0102f0f:	83 c4 10             	add    $0x10,%esp
c0102f12:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102f18:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102f1b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102f1e:	8d 50 07             	lea    0x7(%eax),%edx
c0102f21:	85 c0                	test   %eax,%eax
c0102f23:	0f 48 c2             	cmovs  %edx,%eax
c0102f26:	c1 f8 03             	sar    $0x3,%eax
c0102f29:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102f2c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102f2f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102f35:	85 c0                	test   %eax,%eax
c0102f37:	0f 48 c2             	cmovs  %edx,%eax
c0102f3a:	c1 f8 09             	sar    $0x9,%eax
c0102f3d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102f40:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102f43:	99                   	cltd   
c0102f44:	c1 ea 1d             	shr    $0x1d,%edx
c0102f47:	01 d0                	add    %edx,%eax
c0102f49:	83 e0 07             	and    $0x7,%eax
c0102f4c:	29 d0                	sub    %edx,%eax
c0102f4e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102f51:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102f58:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f5d:	89 c2                	mov    %eax,%edx
c0102f5f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102f62:	83 c0 02             	add    $0x2,%eax
c0102f65:	83 ec 0c             	sub    $0xc,%esp
c0102f68:	6a 07                	push   $0x7
c0102f6a:	68 00 02 00 00       	push   $0x200
c0102f6f:	52                   	push   %edx
c0102f70:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f73:	50                   	push   %eax
c0102f74:	e8 6b eb ff ff       	call   c0101ae4 <rd_wt>
c0102f79:	83 c4 20             	add    $0x20,%esp
c0102f7c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102f82:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102f85:	01 d0                	add    %edx,%eax
c0102f87:	0f b6 10             	movzbl (%eax),%edx
c0102f8a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102f8d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102f92:	89 c1                	mov    %eax,%ecx
c0102f94:	d3 e3                	shl    %cl,%ebx
c0102f96:	89 d8                	mov    %ebx,%eax
c0102f98:	f7 d0                	not    %eax
c0102f9a:	89 c3                	mov    %eax,%ebx
c0102f9c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102fa2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102fa5:	01 c8                	add    %ecx,%eax
c0102fa7:	21 da                	and    %ebx,%edx
c0102fa9:	88 10                	mov    %dl,(%eax)
c0102fab:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102fb0:	89 c2                	mov    %eax,%edx
c0102fb2:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102fb5:	83 c0 02             	add    $0x2,%eax
c0102fb8:	83 ec 0c             	sub    $0xc,%esp
c0102fbb:	6a 0a                	push   $0xa
c0102fbd:	68 00 02 00 00       	push   $0x200
c0102fc2:	52                   	push   %edx
c0102fc3:	ff 75 b8             	pushl  -0x48(%ebp)
c0102fc6:	50                   	push   %eax
c0102fc7:	e8 18 eb ff ff       	call   c0101ae4 <rd_wt>
c0102fcc:	83 c4 20             	add    $0x20,%esp
c0102fcf:	e8 ec 08 00 00       	call   c01038c0 <get_super_block>
c0102fd4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102fd7:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102fdd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102fe0:	8b 00                	mov    (%eax),%eax
c0102fe2:	29 c2                	sub    %eax,%edx
c0102fe4:	89 d0                	mov    %edx,%eax
c0102fe6:	83 c0 01             	add    $0x1,%eax
c0102fe9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102fec:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102fef:	8d 50 07             	lea    0x7(%eax),%edx
c0102ff2:	85 c0                	test   %eax,%eax
c0102ff4:	0f 48 c2             	cmovs  %edx,%eax
c0102ff7:	c1 f8 03             	sar    $0x3,%eax
c0102ffa:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102ffd:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103000:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0103006:	85 c0                	test   %eax,%eax
c0103008:	0f 48 c2             	cmovs  %edx,%eax
c010300b:	c1 f8 09             	sar    $0x9,%eax
c010300e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0103011:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103014:	99                   	cltd   
c0103015:	c1 ea 1d             	shr    $0x1d,%edx
c0103018:	01 d0                	add    %edx,%eax
c010301a:	83 e0 07             	and    $0x7,%eax
c010301d:	29 d0                	sub    %edx,%eax
c010301f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103022:	b8 08 00 00 00       	mov    $0x8,%eax
c0103027:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010302a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c010302d:	29 c2                	sub    %eax,%edx
c010302f:	89 d0                	mov    %edx,%eax
c0103031:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103034:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103037:	8d 50 07             	lea    0x7(%eax),%edx
c010303a:	85 c0                	test   %eax,%eax
c010303c:	0f 48 c2             	cmovs  %edx,%eax
c010303f:	c1 f8 03             	sar    $0x3,%eax
c0103042:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0103045:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010304a:	89 c1                	mov    %eax,%ecx
c010304c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010304f:	8b 40 04             	mov    0x4(%eax),%eax
c0103052:	8d 50 02             	lea    0x2(%eax),%edx
c0103055:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103058:	01 d0                	add    %edx,%eax
c010305a:	83 ec 0c             	sub    $0xc,%esp
c010305d:	6a 07                	push   $0x7
c010305f:	68 00 02 00 00       	push   $0x200
c0103064:	51                   	push   %ecx
c0103065:	ff 75 b8             	pushl  -0x48(%ebp)
c0103068:	50                   	push   %eax
c0103069:	e8 76 ea ff ff       	call   c0101ae4 <rd_wt>
c010306e:	83 c4 20             	add    $0x20,%esp
c0103071:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103077:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010307a:	01 d0                	add    %edx,%eax
c010307c:	0f b6 10             	movzbl (%eax),%edx
c010307f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103082:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0103087:	89 c1                	mov    %eax,%ecx
c0103089:	d3 e3                	shl    %cl,%ebx
c010308b:	89 d8                	mov    %ebx,%eax
c010308d:	f7 d0                	not    %eax
c010308f:	89 c3                	mov    %eax,%ebx
c0103091:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0103097:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010309a:	01 c8                	add    %ecx,%eax
c010309c:	21 da                	and    %ebx,%edx
c010309e:	88 10                	mov    %dl,(%eax)
c01030a0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01030a7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01030aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01030ad:	eb 6b                	jmp    c010311a <do_unlink+0x2a5>
c01030af:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c01030b6:	75 4c                	jne    c0103104 <do_unlink+0x28f>
c01030b8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01030bf:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030c4:	83 ec 0c             	sub    $0xc,%esp
c01030c7:	6a 0a                	push   $0xa
c01030c9:	68 00 02 00 00       	push   $0x200
c01030ce:	50                   	push   %eax
c01030cf:	ff 75 b8             	pushl  -0x48(%ebp)
c01030d2:	ff 75 ec             	pushl  -0x14(%ebp)
c01030d5:	e8 0a ea ff ff       	call   c0101ae4 <rd_wt>
c01030da:	83 c4 20             	add    $0x20,%esp
c01030dd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030e2:	89 c1                	mov    %eax,%ecx
c01030e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01030e7:	8d 50 01             	lea    0x1(%eax),%edx
c01030ea:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01030ed:	83 ec 0c             	sub    $0xc,%esp
c01030f0:	6a 07                	push   $0x7
c01030f2:	68 00 02 00 00       	push   $0x200
c01030f7:	51                   	push   %ecx
c01030f8:	ff 75 b8             	pushl  -0x48(%ebp)
c01030fb:	50                   	push   %eax
c01030fc:	e8 e3 e9 ff ff       	call   c0101ae4 <rd_wt>
c0103101:	83 c4 20             	add    $0x20,%esp
c0103104:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010310a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010310d:	01 d0                	add    %edx,%eax
c010310f:	c6 00 00             	movb   $0x0,(%eax)
c0103112:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0103116:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c010311a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010311d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0103120:	7c 8d                	jl     c01030af <do_unlink+0x23a>
c0103122:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0103129:	75 4c                	jne    c0103177 <do_unlink+0x302>
c010312b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0103132:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103137:	83 ec 0c             	sub    $0xc,%esp
c010313a:	6a 0a                	push   $0xa
c010313c:	68 00 02 00 00       	push   $0x200
c0103141:	50                   	push   %eax
c0103142:	ff 75 b8             	pushl  -0x48(%ebp)
c0103145:	ff 75 ec             	pushl  -0x14(%ebp)
c0103148:	e8 97 e9 ff ff       	call   c0101ae4 <rd_wt>
c010314d:	83 c4 20             	add    $0x20,%esp
c0103150:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103155:	89 c1                	mov    %eax,%ecx
c0103157:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010315a:	8d 50 01             	lea    0x1(%eax),%edx
c010315d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0103160:	83 ec 0c             	sub    $0xc,%esp
c0103163:	6a 07                	push   $0x7
c0103165:	68 00 02 00 00       	push   $0x200
c010316a:	51                   	push   %ecx
c010316b:	ff 75 b8             	pushl  -0x48(%ebp)
c010316e:	50                   	push   %eax
c010316f:	e8 70 e9 ff ff       	call   c0101ae4 <rd_wt>
c0103174:	83 c4 20             	add    $0x20,%esp
c0103177:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010317d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103180:	01 d0                	add    %edx,%eax
c0103182:	0f b6 10             	movzbl (%eax),%edx
c0103185:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103188:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c010318d:	89 c1                	mov    %eax,%ecx
c010318f:	d3 e3                	shl    %cl,%ebx
c0103191:	89 d8                	mov    %ebx,%eax
c0103193:	89 c3                	mov    %eax,%ebx
c0103195:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c010319b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010319e:	01 c8                	add    %ecx,%eax
c01031a0:	21 da                	and    %ebx,%edx
c01031a2:	88 10                	mov    %dl,(%eax)
c01031a4:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01031a9:	83 ec 0c             	sub    $0xc,%esp
c01031ac:	6a 0a                	push   $0xa
c01031ae:	68 00 02 00 00       	push   $0x200
c01031b3:	50                   	push   %eax
c01031b4:	ff 75 b8             	pushl  -0x48(%ebp)
c01031b7:	ff 75 ec             	pushl  -0x14(%ebp)
c01031ba:	e8 25 e9 ff ff       	call   c0101ae4 <rd_wt>
c01031bf:	83 c4 20             	add    $0x20,%esp
c01031c2:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c01031c9:	00 00 00 
c01031cc:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c01031d3:	00 00 00 
c01031d6:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c01031dd:	00 00 00 
c01031e0:	83 ec 0c             	sub    $0xc,%esp
c01031e3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c01031e9:	50                   	push   %eax
c01031ea:	e8 ed 04 00 00       	call   c01036dc <sync_inode>
c01031ef:	83 c4 10             	add    $0x10,%esp
c01031f2:	83 ec 0c             	sub    $0xc,%esp
c01031f5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c01031fb:	50                   	push   %eax
c01031fc:	e8 2f 06 00 00       	call   c0103830 <put_inode>
c0103201:	83 c4 10             	add    $0x10,%esp
c0103204:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103207:	8b 00                	mov    (%eax),%eax
c0103209:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010320c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0103213:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103216:	8b 40 04             	mov    0x4(%eax),%eax
c0103219:	89 45 94             	mov    %eax,-0x6c(%ebp)
c010321c:	8b 45 98             	mov    -0x68(%ebp),%eax
c010321f:	8b 40 0c             	mov    0xc(%eax),%eax
c0103222:	89 45 90             	mov    %eax,-0x70(%ebp)
c0103225:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103228:	c1 e8 04             	shr    $0x4,%eax
c010322b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010322e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0103235:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010323c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0103243:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010324a:	e9 a5 00 00 00       	jmp    c01032f4 <do_unlink+0x47f>
c010324f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103254:	89 c1                	mov    %eax,%ecx
c0103256:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0103259:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010325c:	01 d0                	add    %edx,%eax
c010325e:	83 ec 0c             	sub    $0xc,%esp
c0103261:	6a 07                	push   $0x7
c0103263:	68 00 02 00 00       	push   $0x200
c0103268:	51                   	push   %ecx
c0103269:	ff 75 b8             	pushl  -0x48(%ebp)
c010326c:	50                   	push   %eax
c010326d:	e8 72 e8 ff ff       	call   c0101ae4 <rd_wt>
c0103272:	83 c4 20             	add    $0x20,%esp
c0103275:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010327a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010327d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0103284:	eb 51                	jmp    c01032d7 <do_unlink+0x462>
c0103286:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010328a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010328d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103290:	7f 4f                	jg     c01032e1 <do_unlink+0x46c>
c0103292:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103295:	83 c0 10             	add    $0x10,%eax
c0103298:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010329b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010329e:	83 c0 04             	add    $0x4,%eax
c01032a1:	83 ec 08             	sub    $0x8,%esp
c01032a4:	ff 75 08             	pushl  0x8(%ebp)
c01032a7:	50                   	push   %eax
c01032a8:	e8 9f 68 00 00       	call   c0109b4c <strcmp>
c01032ad:	83 c4 10             	add    $0x10,%esp
c01032b0:	85 c0                	test   %eax,%eax
c01032b2:	75 1b                	jne    c01032cf <do_unlink+0x45a>
c01032b4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01032bb:	83 ec 04             	sub    $0x4,%esp
c01032be:	6a 10                	push   $0x10
c01032c0:	6a 00                	push   $0x0
c01032c2:	ff 75 d4             	pushl  -0x2c(%ebp)
c01032c5:	e8 a5 8f 00 00       	call   c010c26f <Memset>
c01032ca:	83 c4 10             	add    $0x10,%esp
c01032cd:	eb 13                	jmp    c01032e2 <do_unlink+0x46d>
c01032cf:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c01032d3:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c01032d7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01032da:	3b 45 90             	cmp    -0x70(%ebp),%eax
c01032dd:	7c a7                	jl     c0103286 <do_unlink+0x411>
c01032df:	eb 01                	jmp    c01032e2 <do_unlink+0x46d>
c01032e1:	90                   	nop
c01032e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01032e5:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01032e8:	7f 16                	jg     c0103300 <do_unlink+0x48b>
c01032ea:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01032ee:	75 10                	jne    c0103300 <do_unlink+0x48b>
c01032f0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c01032f4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032f7:	3b 45 90             	cmp    -0x70(%ebp),%eax
c01032fa:	0f 8c 4f ff ff ff    	jl     c010324f <do_unlink+0x3da>
c0103300:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103303:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103306:	75 17                	jne    c010331f <do_unlink+0x4aa>
c0103308:	8b 45 98             	mov    -0x68(%ebp),%eax
c010330b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010330e:	89 50 04             	mov    %edx,0x4(%eax)
c0103311:	83 ec 0c             	sub    $0xc,%esp
c0103314:	ff 75 98             	pushl  -0x68(%ebp)
c0103317:	e8 c0 03 00 00       	call   c01036dc <sync_inode>
c010331c:	83 c4 10             	add    $0x10,%esp
c010331f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0103323:	74 26                	je     c010334b <do_unlink+0x4d6>
c0103325:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010332a:	89 c1                	mov    %eax,%ecx
c010332c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c010332f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103332:	01 d0                	add    %edx,%eax
c0103334:	83 ec 0c             	sub    $0xc,%esp
c0103337:	6a 0a                	push   $0xa
c0103339:	68 00 02 00 00       	push   $0x200
c010333e:	51                   	push   %ecx
c010333f:	ff 75 b8             	pushl  -0x48(%ebp)
c0103342:	50                   	push   %eax
c0103343:	e8 9c e7 ff ff       	call   c0101ae4 <rd_wt>
c0103348:	83 c4 20             	add    $0x20,%esp
c010334b:	90                   	nop
c010334c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010334f:	c9                   	leave  
c0103350:	c3                   	ret    

c0103351 <do_rdwt>:
c0103351:	55                   	push   %ebp
c0103352:	89 e5                	mov    %esp,%ebp
c0103354:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010335a:	8b 45 08             	mov    0x8(%ebp),%eax
c010335d:	8b 40 78             	mov    0x78(%eax),%eax
c0103360:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103363:	8b 45 08             	mov    0x8(%ebp),%eax
c0103366:	8b 40 60             	mov    0x60(%eax),%eax
c0103369:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010336c:	8b 45 08             	mov    0x8(%ebp),%eax
c010336f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103372:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103375:	8b 45 08             	mov    0x8(%ebp),%eax
c0103378:	8b 00                	mov    (%eax),%eax
c010337a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010337d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103380:	8b 40 10             	mov    0x10(%eax),%eax
c0103383:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103386:	8b 45 08             	mov    0x8(%ebp),%eax
c0103389:	8b 40 50             	mov    0x50(%eax),%eax
c010338c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010338f:	83 ec 0c             	sub    $0xc,%esp
c0103392:	ff 75 d0             	pushl  -0x30(%ebp)
c0103395:	e8 0c 07 00 00       	call   c0103aa6 <pid2proc>
c010339a:	83 c4 10             	add    $0x10,%esp
c010339d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01033a0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01033a3:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01033a6:	83 c2 4c             	add    $0x4c,%edx
c01033a9:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01033ad:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01033b0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01033b3:	8b 40 08             	mov    0x8(%eax),%eax
c01033b6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01033b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01033bc:	8b 00                	mov    (%eax),%eax
c01033be:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01033c1:	83 ec 08             	sub    $0x8,%esp
c01033c4:	ff 75 bc             	pushl  -0x44(%ebp)
c01033c7:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01033cd:	50                   	push   %eax
c01033ce:	e8 0d f2 ff ff       	call   c01025e0 <get_inode>
c01033d3:	83 c4 10             	add    $0x10,%esp
c01033d6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01033d9:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c01033dd:	75 10                	jne    c01033ef <do_rdwt+0x9e>
c01033df:	83 ec 0c             	sub    $0xc,%esp
c01033e2:	68 28 b5 10 c0       	push   $0xc010b528
c01033e7:	e8 6b 57 00 00       	call   c0108b57 <panic>
c01033ec:	83 c4 10             	add    $0x10,%esp
c01033ef:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01033f5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01033f8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01033fb:	8b 40 04             	mov    0x4(%eax),%eax
c01033fe:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103401:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103405:	74 22                	je     c0103429 <do_rdwt+0xd8>
c0103407:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010340b:	74 1c                	je     c0103429 <do_rdwt+0xd8>
c010340d:	68 a8 04 00 00       	push   $0x4a8
c0103412:	68 94 b3 10 c0       	push   $0xc010b394
c0103417:	68 94 b3 10 c0       	push   $0xc010b394
c010341c:	68 38 b5 10 c0       	push   $0xc010b538
c0103421:	e8 4f 57 00 00       	call   c0108b75 <assertion_failure>
c0103426:	83 c4 10             	add    $0x10,%esp
c0103429:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c010342f:	83 f8 01             	cmp    $0x1,%eax
c0103432:	0f 85 86 00 00 00    	jne    c01034be <do_rdwt+0x16d>
c0103438:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010343c:	75 09                	jne    c0103447 <do_rdwt+0xf6>
c010343e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103445:	eb 0d                	jmp    c0103454 <do_rdwt+0x103>
c0103447:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010344b:	75 07                	jne    c0103454 <do_rdwt+0x103>
c010344d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103454:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103457:	8b 45 08             	mov    0x8(%ebp),%eax
c010345a:	89 50 78             	mov    %edx,0x78(%eax)
c010345d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103460:	8b 45 08             	mov    0x8(%ebp),%eax
c0103463:	89 50 68             	mov    %edx,0x68(%eax)
c0103466:	83 ec 04             	sub    $0x4,%esp
c0103469:	6a 04                	push   $0x4
c010346b:	ff 75 08             	pushl  0x8(%ebp)
c010346e:	6a 03                	push   $0x3
c0103470:	e8 70 63 00 00       	call   c01097e5 <send_rec>
c0103475:	83 c4 10             	add    $0x10,%esp
c0103478:	8b 45 08             	mov    0x8(%ebp),%eax
c010347b:	8b 40 78             	mov    0x78(%eax),%eax
c010347e:	83 f8 66             	cmp    $0x66,%eax
c0103481:	75 13                	jne    c0103496 <do_rdwt+0x145>
c0103483:	83 ec 04             	sub    $0x4,%esp
c0103486:	ff 75 b8             	pushl  -0x48(%ebp)
c0103489:	ff 75 08             	pushl  0x8(%ebp)
c010348c:	6a 01                	push   $0x1
c010348e:	e8 52 63 00 00       	call   c01097e5 <send_rec>
c0103493:	83 c4 10             	add    $0x10,%esp
c0103496:	8b 45 08             	mov    0x8(%ebp),%eax
c0103499:	8b 40 78             	mov    0x78(%eax),%eax
c010349c:	83 f8 65             	cmp    $0x65,%eax
c010349f:	75 13                	jne    c01034b4 <do_rdwt+0x163>
c01034a1:	83 ec 04             	sub    $0x4,%esp
c01034a4:	ff 75 b8             	pushl  -0x48(%ebp)
c01034a7:	ff 75 08             	pushl  0x8(%ebp)
c01034aa:	6a 01                	push   $0x1
c01034ac:	e8 34 63 00 00       	call   c01097e5 <send_rec>
c01034b1:	83 c4 10             	add    $0x10,%esp
c01034b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01034b9:	e9 1c 02 00 00       	jmp    c01036da <do_rdwt+0x389>
c01034be:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01034c2:	75 18                	jne    c01034dc <do_rdwt+0x18b>
c01034c4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01034ca:	c1 e0 09             	shl    $0x9,%eax
c01034cd:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c01034d0:	75 0a                	jne    c01034dc <do_rdwt+0x18b>
c01034d2:	b8 00 00 00 00       	mov    $0x0,%eax
c01034d7:	e9 fe 01 00 00       	jmp    c01036da <do_rdwt+0x389>
c01034dc:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01034e0:	75 14                	jne    c01034f6 <do_rdwt+0x1a5>
c01034e2:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01034e5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034e8:	01 d0                	add    %edx,%eax
c01034ea:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01034ed:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c01034f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01034f4:	eb 19                	jmp    c010350f <do_rdwt+0x1be>
c01034f6:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01034f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034fc:	01 c2                	add    %eax,%edx
c01034fe:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103504:	c1 e0 09             	shl    $0x9,%eax
c0103507:	39 c2                	cmp    %eax,%edx
c0103509:	0f 4e c2             	cmovle %edx,%eax
c010350c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010350f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103512:	99                   	cltd   
c0103513:	c1 ea 17             	shr    $0x17,%edx
c0103516:	01 d0                	add    %edx,%eax
c0103518:	25 ff 01 00 00       	and    $0x1ff,%eax
c010351d:	29 d0                	sub    %edx,%eax
c010351f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103522:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103528:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010352b:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103531:	85 c0                	test   %eax,%eax
c0103533:	0f 48 c1             	cmovs  %ecx,%eax
c0103536:	c1 f8 09             	sar    $0x9,%eax
c0103539:	01 d0                	add    %edx,%eax
c010353b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010353e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103544:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103547:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010354d:	85 c0                	test   %eax,%eax
c010354f:	0f 48 c1             	cmovs  %ecx,%eax
c0103552:	c1 f8 09             	sar    $0x9,%eax
c0103555:	01 d0                	add    %edx,%eax
c0103557:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010355a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010355d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103560:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103565:	39 d0                	cmp    %edx,%eax
c0103567:	7d 0b                	jge    c0103574 <do_rdwt+0x223>
c0103569:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010356c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010356f:	83 c0 01             	add    $0x1,%eax
c0103572:	eb 05                	jmp    c0103579 <do_rdwt+0x228>
c0103574:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103579:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010357c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010357f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103582:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103589:	8b 45 08             	mov    0x8(%ebp),%eax
c010358c:	8b 00                	mov    (%eax),%eax
c010358e:	83 ec 0c             	sub    $0xc,%esp
c0103591:	50                   	push   %eax
c0103592:	e8 0f 05 00 00       	call   c0103aa6 <pid2proc>
c0103597:	83 c4 10             	add    $0x10,%esp
c010359a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010359d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01035a0:	83 ec 08             	sub    $0x8,%esp
c01035a3:	50                   	push   %eax
c01035a4:	ff 75 cc             	pushl  -0x34(%ebp)
c01035a7:	e8 43 2b 00 00       	call   c01060ef <alloc_virtual_memory>
c01035ac:	83 c4 10             	add    $0x10,%esp
c01035af:	89 45 98             	mov    %eax,-0x68(%ebp)
c01035b2:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01035b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01035b8:	e9 c5 00 00 00       	jmp    c0103682 <do_rdwt+0x331>
c01035bd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01035c0:	c1 e0 09             	shl    $0x9,%eax
c01035c3:	2b 45 ec             	sub    -0x14(%ebp),%eax
c01035c6:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c01035c9:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c01035cd:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01035d0:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c01035d7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01035db:	75 46                	jne    c0103623 <do_rdwt+0x2d2>
c01035dd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01035e0:	c1 e0 09             	shl    $0x9,%eax
c01035e3:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01035e9:	83 ec 0c             	sub    $0xc,%esp
c01035ec:	6a 07                	push   $0x7
c01035ee:	50                   	push   %eax
c01035ef:	52                   	push   %edx
c01035f0:	ff 75 90             	pushl  -0x70(%ebp)
c01035f3:	ff 75 e0             	pushl  -0x20(%ebp)
c01035f6:	e8 e9 e4 ff ff       	call   c0101ae4 <rd_wt>
c01035fb:	83 c4 20             	add    $0x20,%esp
c01035fe:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103604:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103607:	01 d0                	add    %edx,%eax
c0103609:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010360c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010360f:	01 ca                	add    %ecx,%edx
c0103611:	83 ec 04             	sub    $0x4,%esp
c0103614:	ff 75 94             	pushl  -0x6c(%ebp)
c0103617:	50                   	push   %eax
c0103618:	52                   	push   %edx
c0103619:	e8 3e 39 00 00       	call   c0106f5c <Memcpy>
c010361e:	83 c4 10             	add    $0x10,%esp
c0103621:	eb 46                	jmp    c0103669 <do_rdwt+0x318>
c0103623:	8b 55 98             	mov    -0x68(%ebp),%edx
c0103626:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103629:	01 d0                	add    %edx,%eax
c010362b:	89 c1                	mov    %eax,%ecx
c010362d:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103633:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103636:	01 d0                	add    %edx,%eax
c0103638:	83 ec 04             	sub    $0x4,%esp
c010363b:	ff 75 94             	pushl  -0x6c(%ebp)
c010363e:	51                   	push   %ecx
c010363f:	50                   	push   %eax
c0103640:	e8 17 39 00 00       	call   c0106f5c <Memcpy>
c0103645:	83 c4 10             	add    $0x10,%esp
c0103648:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010364b:	c1 e0 09             	shl    $0x9,%eax
c010364e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103654:	83 ec 0c             	sub    $0xc,%esp
c0103657:	6a 0a                	push   $0xa
c0103659:	50                   	push   %eax
c010365a:	52                   	push   %edx
c010365b:	ff 75 90             	pushl  -0x70(%ebp)
c010365e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103661:	e8 7e e4 ff ff       	call   c0101ae4 <rd_wt>
c0103666:	83 c4 20             	add    $0x20,%esp
c0103669:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010366c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010366f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103672:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103675:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010367c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010367f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103682:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103685:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103688:	7f 0a                	jg     c0103694 <do_rdwt+0x343>
c010368a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010368e:	0f 85 29 ff ff ff    	jne    c01035bd <do_rdwt+0x26c>
c0103694:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103697:	8b 50 04             	mov    0x4(%eax),%edx
c010369a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010369d:	01 c2                	add    %eax,%edx
c010369f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01036a2:	89 50 04             	mov    %edx,0x4(%eax)
c01036a5:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01036a8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01036ab:	01 c2                	add    %eax,%edx
c01036ad:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01036b3:	39 c2                	cmp    %eax,%edx
c01036b5:	7e 20                	jle    c01036d7 <do_rdwt+0x386>
c01036b7:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01036ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01036bd:	01 d0                	add    %edx,%eax
c01036bf:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01036c5:	83 ec 0c             	sub    $0xc,%esp
c01036c8:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01036ce:	50                   	push   %eax
c01036cf:	e8 08 00 00 00       	call   c01036dc <sync_inode>
c01036d4:	83 c4 10             	add    $0x10,%esp
c01036d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01036da:	c9                   	leave  
c01036db:	c3                   	ret    

c01036dc <sync_inode>:
c01036dc:	55                   	push   %ebp
c01036dd:	89 e5                	mov    %esp,%ebp
c01036df:	53                   	push   %ebx
c01036e0:	83 ec 34             	sub    $0x34,%esp
c01036e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01036ea:	eb 74                	jmp    c0103760 <sync_inode+0x84>
c01036ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01036ef:	89 d0                	mov    %edx,%eax
c01036f1:	c1 e0 02             	shl    $0x2,%eax
c01036f4:	01 d0                	add    %edx,%eax
c01036f6:	c1 e0 03             	shl    $0x3,%eax
c01036f9:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01036fe:	8b 10                	mov    (%eax),%edx
c0103700:	8b 45 08             	mov    0x8(%ebp),%eax
c0103703:	8b 40 10             	mov    0x10(%eax),%eax
c0103706:	39 c2                	cmp    %eax,%edx
c0103708:	75 52                	jne    c010375c <sync_inode+0x80>
c010370a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010370d:	89 d0                	mov    %edx,%eax
c010370f:	c1 e0 02             	shl    $0x2,%eax
c0103712:	01 d0                	add    %edx,%eax
c0103714:	c1 e0 03             	shl    $0x3,%eax
c0103717:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c010371d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103720:	8b 08                	mov    (%eax),%ecx
c0103722:	89 0a                	mov    %ecx,(%edx)
c0103724:	8b 48 04             	mov    0x4(%eax),%ecx
c0103727:	89 4a 04             	mov    %ecx,0x4(%edx)
c010372a:	8b 48 08             	mov    0x8(%eax),%ecx
c010372d:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103730:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103733:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103736:	8b 48 10             	mov    0x10(%eax),%ecx
c0103739:	89 4a 10             	mov    %ecx,0x10(%edx)
c010373c:	8b 48 14             	mov    0x14(%eax),%ecx
c010373f:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103742:	8b 48 18             	mov    0x18(%eax),%ecx
c0103745:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103748:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010374b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010374e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103751:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103754:	8b 40 24             	mov    0x24(%eax),%eax
c0103757:	89 42 24             	mov    %eax,0x24(%edx)
c010375a:	eb 0a                	jmp    c0103766 <sync_inode+0x8a>
c010375c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103760:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103764:	7e 86                	jle    c01036ec <sync_inode+0x10>
c0103766:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010376d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103770:	8b 40 10             	mov    0x10(%eax),%eax
c0103773:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103776:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103779:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010377c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103781:	99                   	cltd   
c0103782:	f7 7d f0             	idivl  -0x10(%ebp)
c0103785:	89 c3                	mov    %eax,%ebx
c0103787:	89 c8                	mov    %ecx,%eax
c0103789:	99                   	cltd   
c010378a:	f7 fb                	idiv   %ebx
c010378c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010378f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103792:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103795:	b8 00 02 00 00       	mov    $0x200,%eax
c010379a:	99                   	cltd   
c010379b:	f7 7d f0             	idivl  -0x10(%ebp)
c010379e:	89 c3                	mov    %eax,%ebx
c01037a0:	89 c8                	mov    %ecx,%eax
c01037a2:	99                   	cltd   
c01037a3:	f7 fb                	idiv   %ebx
c01037a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01037a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01037ab:	8b 40 20             	mov    0x20(%eax),%eax
c01037ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01037b1:	e8 0a 01 00 00       	call   c01038c0 <get_super_block>
c01037b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01037b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01037bc:	8b 40 04             	mov    0x4(%eax),%eax
c01037bf:	8d 50 02             	lea    0x2(%eax),%edx
c01037c2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01037c5:	8b 40 08             	mov    0x8(%eax),%eax
c01037c8:	01 c2                	add    %eax,%edx
c01037ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01037cd:	01 d0                	add    %edx,%eax
c01037cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01037d2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01037d7:	83 ec 0c             	sub    $0xc,%esp
c01037da:	6a 07                	push   $0x7
c01037dc:	68 00 02 00 00       	push   $0x200
c01037e1:	50                   	push   %eax
c01037e2:	ff 75 e0             	pushl  -0x20(%ebp)
c01037e5:	ff 75 d8             	pushl  -0x28(%ebp)
c01037e8:	e8 f7 e2 ff ff       	call   c0101ae4 <rd_wt>
c01037ed:	83 c4 20             	add    $0x20,%esp
c01037f0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01037f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01037f8:	83 ec 04             	sub    $0x4,%esp
c01037fb:	ff 75 f0             	pushl  -0x10(%ebp)
c01037fe:	ff 75 08             	pushl  0x8(%ebp)
c0103801:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103804:	e8 53 37 00 00       	call   c0106f5c <Memcpy>
c0103809:	83 c4 10             	add    $0x10,%esp
c010380c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103811:	83 ec 0c             	sub    $0xc,%esp
c0103814:	6a 0a                	push   $0xa
c0103816:	68 00 02 00 00       	push   $0x200
c010381b:	50                   	push   %eax
c010381c:	ff 75 e0             	pushl  -0x20(%ebp)
c010381f:	ff 75 d8             	pushl  -0x28(%ebp)
c0103822:	e8 bd e2 ff ff       	call   c0101ae4 <rd_wt>
c0103827:	83 c4 20             	add    $0x20,%esp
c010382a:	90                   	nop
c010382b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010382e:	c9                   	leave  
c010382f:	c3                   	ret    

c0103830 <put_inode>:
c0103830:	55                   	push   %ebp
c0103831:	89 e5                	mov    %esp,%ebp
c0103833:	83 ec 08             	sub    $0x8,%esp
c0103836:	8b 45 08             	mov    0x8(%ebp),%eax
c0103839:	8b 40 24             	mov    0x24(%eax),%eax
c010383c:	85 c0                	test   %eax,%eax
c010383e:	7f 1c                	jg     c010385c <put_inode+0x2c>
c0103840:	68 4d 05 00 00       	push   $0x54d
c0103845:	68 94 b3 10 c0       	push   $0xc010b394
c010384a:	68 94 b3 10 c0       	push   $0xc010b394
c010384f:	68 6c b5 10 c0       	push   $0xc010b56c
c0103854:	e8 1c 53 00 00       	call   c0108b75 <assertion_failure>
c0103859:	83 c4 10             	add    $0x10,%esp
c010385c:	8b 45 08             	mov    0x8(%ebp),%eax
c010385f:	8b 40 24             	mov    0x24(%eax),%eax
c0103862:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103865:	8b 45 08             	mov    0x8(%ebp),%eax
c0103868:	89 50 24             	mov    %edx,0x24(%eax)
c010386b:	90                   	nop
c010386c:	c9                   	leave  
c010386d:	c3                   	ret    

c010386e <do_close>:
c010386e:	55                   	push   %ebp
c010386f:	89 e5                	mov    %esp,%ebp
c0103871:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103876:	8b 55 08             	mov    0x8(%ebp),%edx
c0103879:	83 c2 4c             	add    $0x4c,%edx
c010387c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103880:	8b 50 0c             	mov    0xc(%eax),%edx
c0103883:	83 ea 01             	sub    $0x1,%edx
c0103886:	89 50 0c             	mov    %edx,0xc(%eax)
c0103889:	8b 40 0c             	mov    0xc(%eax),%eax
c010388c:	85 c0                	test   %eax,%eax
c010388e:	75 16                	jne    c01038a6 <do_close+0x38>
c0103890:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103895:	8b 55 08             	mov    0x8(%ebp),%edx
c0103898:	83 c2 4c             	add    $0x4c,%edx
c010389b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010389f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01038a6:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01038ab:	8b 55 08             	mov    0x8(%ebp),%edx
c01038ae:	83 c2 4c             	add    $0x4c,%edx
c01038b1:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c01038b8:	00 
c01038b9:	b8 00 00 00 00       	mov    $0x0,%eax
c01038be:	5d                   	pop    %ebp
c01038bf:	c3                   	ret    

c01038c0 <get_super_block>:
c01038c0:	55                   	push   %ebp
c01038c1:	89 e5                	mov    %esp,%ebp
c01038c3:	83 ec 08             	sub    $0x8,%esp
c01038c6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01038cb:	83 ec 0c             	sub    $0xc,%esp
c01038ce:	6a 07                	push   $0x7
c01038d0:	68 00 02 00 00       	push   $0x200
c01038d5:	50                   	push   %eax
c01038d6:	6a 20                	push   $0x20
c01038d8:	6a 01                	push   $0x1
c01038da:	e8 05 e2 ff ff       	call   c0101ae4 <rd_wt>
c01038df:	83 c4 20             	add    $0x20,%esp
c01038e2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01038e8:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01038ed:	8b 0a                	mov    (%edx),%ecx
c01038ef:	89 08                	mov    %ecx,(%eax)
c01038f1:	8b 4a 04             	mov    0x4(%edx),%ecx
c01038f4:	89 48 04             	mov    %ecx,0x4(%eax)
c01038f7:	8b 4a 08             	mov    0x8(%edx),%ecx
c01038fa:	89 48 08             	mov    %ecx,0x8(%eax)
c01038fd:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103900:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103903:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103906:	89 48 10             	mov    %ecx,0x10(%eax)
c0103909:	8b 4a 14             	mov    0x14(%edx),%ecx
c010390c:	89 48 14             	mov    %ecx,0x14(%eax)
c010390f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0103912:	89 48 18             	mov    %ecx,0x18(%eax)
c0103915:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0103918:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010391b:	8b 52 20             	mov    0x20(%edx),%edx
c010391e:	89 50 20             	mov    %edx,0x20(%eax)
c0103921:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0103926:	c9                   	leave  
c0103927:	c3                   	ret    

c0103928 <schedule_process>:
c0103928:	55                   	push   %ebp
c0103929:	89 e5                	mov    %esp,%ebp
c010392b:	83 ec 18             	sub    $0x18,%esp
c010392e:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103935:	e8 02 cb ff ff       	call   c010043c <get_running_thread_pcb>
c010393a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010393d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103940:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103947:	84 c0                	test   %al,%al
c0103949:	75 35                	jne    c0103980 <schedule_process+0x58>
c010394b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010394e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103954:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103957:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010395d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103960:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103967:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010396a:	05 60 02 00 00       	add    $0x260,%eax
c010396f:	83 ec 08             	sub    $0x8,%esp
c0103972:	50                   	push   %eax
c0103973:	68 ec fd 10 c0       	push   $0xc010fdec
c0103978:	e8 9a 6b 00 00       	call   c010a517 <insertToDoubleLinkList>
c010397d:	83 c4 10             	add    $0x10,%esp
c0103980:	83 ec 0c             	sub    $0xc,%esp
c0103983:	68 ec fd 10 c0       	push   $0xc010fdec
c0103988:	e8 a6 69 00 00       	call   c010a333 <isListEmpty>
c010398d:	83 c4 10             	add    $0x10,%esp
c0103990:	84 c0                	test   %al,%al
c0103992:	74 19                	je     c01039ad <schedule_process+0x85>
c0103994:	6a 1e                	push   $0x1e
c0103996:	68 7b b5 10 c0       	push   $0xc010b57b
c010399b:	68 7b b5 10 c0       	push   $0xc010b57b
c01039a0:	68 85 b5 10 c0       	push   $0xc010b585
c01039a5:	e8 cb 51 00 00       	call   c0108b75 <assertion_failure>
c01039aa:	83 c4 10             	add    $0x10,%esp
c01039ad:	83 ec 0c             	sub    $0xc,%esp
c01039b0:	68 ec fd 10 c0       	push   $0xc010fdec
c01039b5:	e8 e0 6b 00 00       	call   c010a59a <popFromDoubleLinkList>
c01039ba:	83 c4 10             	add    $0x10,%esp
c01039bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01039c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01039c3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01039c8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01039cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039ce:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01039d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039d8:	8b 50 08             	mov    0x8(%eax),%edx
c01039db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01039de:	39 c2                	cmp    %eax,%edx
c01039e0:	74 28                	je     c0103a0a <schedule_process+0xe2>
c01039e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039e5:	05 00 10 00 00       	add    $0x1000,%eax
c01039ea:	83 ec 0c             	sub    $0xc,%esp
c01039ed:	50                   	push   %eax
c01039ee:	e8 3a ca ff ff       	call   c010042d <update_tss>
c01039f3:	83 c4 10             	add    $0x10,%esp
c01039f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039f9:	8b 40 08             	mov    0x8(%eax),%eax
c01039fc:	83 ec 0c             	sub    $0xc,%esp
c01039ff:	50                   	push   %eax
c0103a00:	e8 1b ca ff ff       	call   c0100420 <update_cr3>
c0103a05:	83 c4 10             	add    $0x10,%esp
c0103a08:	eb 0f                	jmp    c0103a19 <schedule_process+0xf1>
c0103a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a0d:	83 ec 0c             	sub    $0xc,%esp
c0103a10:	50                   	push   %eax
c0103a11:	e8 0a ca ff ff       	call   c0100420 <update_cr3>
c0103a16:	83 c4 10             	add    $0x10,%esp
c0103a19:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a1c:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103a21:	83 ec 08             	sub    $0x8,%esp
c0103a24:	ff 75 e8             	pushl  -0x18(%ebp)
c0103a27:	ff 75 f0             	pushl  -0x10(%ebp)
c0103a2a:	e8 c1 68 00 00       	call   c010a2f0 <switch_to>
c0103a2f:	83 c4 10             	add    $0x10,%esp
c0103a32:	90                   	nop
c0103a33:	c9                   	leave  
c0103a34:	c3                   	ret    

c0103a35 <clock_handler>:
c0103a35:	55                   	push   %ebp
c0103a36:	89 e5                	mov    %esp,%ebp
c0103a38:	83 ec 18             	sub    $0x18,%esp
c0103a3b:	e8 fc c9 ff ff       	call   c010043c <get_running_thread_pcb>
c0103a40:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a43:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0103a48:	85 c0                	test   %eax,%eax
c0103a4a:	74 0d                	je     c0103a59 <clock_handler+0x24>
c0103a4c:	83 ec 0c             	sub    $0xc,%esp
c0103a4f:	6a 04                	push   $0x4
c0103a51:	e8 29 60 00 00       	call   c0109a7f <inform_int>
c0103a56:	83 c4 10             	add    $0x10,%esp
c0103a59:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103a5e:	83 f8 64             	cmp    $0x64,%eax
c0103a61:	75 0c                	jne    c0103a6f <clock_handler+0x3a>
c0103a63:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c0103a6a:	00 00 00 
c0103a6d:	eb 0a                	jmp    c0103a79 <clock_handler+0x44>
c0103a6f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103a74:	83 f8 01             	cmp    $0x1,%eax
c0103a77:	75 2a                	jne    c0103aa3 <clock_handler+0x6e>
c0103a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a7c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103a82:	85 c0                	test   %eax,%eax
c0103a84:	74 16                	je     c0103a9c <clock_handler+0x67>
c0103a86:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c0103a8b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103a91:	83 ea 01             	sub    $0x1,%edx
c0103a94:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0103a9a:	eb 08                	jmp    c0103aa4 <clock_handler+0x6f>
c0103a9c:	e8 87 fe ff ff       	call   c0103928 <schedule_process>
c0103aa1:	eb 01                	jmp    c0103aa4 <clock_handler+0x6f>
c0103aa3:	90                   	nop
c0103aa4:	c9                   	leave  
c0103aa5:	c3                   	ret    

c0103aa6 <pid2proc>:
c0103aa6:	55                   	push   %ebp
c0103aa7:	89 e5                	mov    %esp,%ebp
c0103aa9:	83 ec 20             	sub    $0x20,%esp
c0103aac:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103ab3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103aba:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c0103abf:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103ac5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103ac8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103acb:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103ad0:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103ad6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103ad9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0103adc:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103ae1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103ae4:	eb 36                	jmp    c0103b1c <pid2proc+0x76>
c0103ae6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ae9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103aee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103af1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103af5:	75 07                	jne    c0103afe <pid2proc+0x58>
c0103af7:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c0103afe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b01:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103b07:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b0a:	39 c2                	cmp    %eax,%edx
c0103b0c:	75 05                	jne    c0103b13 <pid2proc+0x6d>
c0103b0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b11:	eb 17                	jmp    c0103b2a <pid2proc+0x84>
c0103b13:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b16:	8b 40 04             	mov    0x4(%eax),%eax
c0103b19:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103b1c:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103b23:	75 c1                	jne    c0103ae6 <pid2proc+0x40>
c0103b25:	b8 00 00 00 00       	mov    $0x0,%eax
c0103b2a:	c9                   	leave  
c0103b2b:	c3                   	ret    

c0103b2c <proc2pid>:
c0103b2c:	55                   	push   %ebp
c0103b2d:	89 e5                	mov    %esp,%ebp
c0103b2f:	83 ec 10             	sub    $0x10,%esp
c0103b32:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b35:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0103b3b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103b3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b41:	c9                   	leave  
c0103b42:	c3                   	ret    

c0103b43 <InitDescriptor>:
c0103b43:	55                   	push   %ebp
c0103b44:	89 e5                	mov    %esp,%ebp
c0103b46:	83 ec 04             	sub    $0x4,%esp
c0103b49:	8b 45 14             	mov    0x14(%ebp),%eax
c0103b4c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103b50:	8b 45 10             	mov    0x10(%ebp),%eax
c0103b53:	89 c2                	mov    %eax,%edx
c0103b55:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b58:	66 89 10             	mov    %dx,(%eax)
c0103b5b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b5e:	89 c2                	mov    %eax,%edx
c0103b60:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b63:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103b67:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b6a:	c1 e8 10             	shr    $0x10,%eax
c0103b6d:	89 c2                	mov    %eax,%edx
c0103b6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b72:	88 50 04             	mov    %dl,0x4(%eax)
c0103b75:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103b79:	89 c2                	mov    %eax,%edx
c0103b7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b7e:	88 50 05             	mov    %dl,0x5(%eax)
c0103b81:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103b85:	66 c1 e8 08          	shr    $0x8,%ax
c0103b89:	c1 e0 04             	shl    $0x4,%eax
c0103b8c:	89 c2                	mov    %eax,%edx
c0103b8e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103b91:	c1 e8 10             	shr    $0x10,%eax
c0103b94:	83 e0 0f             	and    $0xf,%eax
c0103b97:	09 c2                	or     %eax,%edx
c0103b99:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b9c:	88 50 06             	mov    %dl,0x6(%eax)
c0103b9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ba2:	c1 e8 18             	shr    $0x18,%eax
c0103ba5:	89 c2                	mov    %eax,%edx
c0103ba7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103baa:	88 50 07             	mov    %dl,0x7(%eax)
c0103bad:	90                   	nop
c0103bae:	c9                   	leave  
c0103baf:	c3                   	ret    

c0103bb0 <Seg2PhyAddr>:
c0103bb0:	55                   	push   %ebp
c0103bb1:	89 e5                	mov    %esp,%ebp
c0103bb3:	83 ec 10             	sub    $0x10,%esp
c0103bb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bb9:	c1 e8 03             	shr    $0x3,%eax
c0103bbc:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103bc3:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c0103bca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103bcd:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103bd0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103bd4:	0f b7 c0             	movzwl %ax,%eax
c0103bd7:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103bdb:	0f b6 d2             	movzbl %dl,%edx
c0103bde:	c1 e2 10             	shl    $0x10,%edx
c0103be1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103be7:	09 d0                	or     %edx,%eax
c0103be9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103bec:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bef:	c9                   	leave  
c0103bf0:	c3                   	ret    

c0103bf1 <Seg2PhyAddrLDT>:
c0103bf1:	55                   	push   %ebp
c0103bf2:	89 e5                	mov    %esp,%ebp
c0103bf4:	83 ec 10             	sub    $0x10,%esp
c0103bf7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bfa:	c1 e8 03             	shr    $0x3,%eax
c0103bfd:	89 c2                	mov    %eax,%edx
c0103bff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c02:	83 c2 20             	add    $0x20,%edx
c0103c05:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103c09:	8b 02                	mov    (%edx),%eax
c0103c0b:	8b 52 04             	mov    0x4(%edx),%edx
c0103c0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103c11:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103c14:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103c18:	0f b7 c0             	movzwl %ax,%eax
c0103c1b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103c1f:	0f b6 d2             	movzbl %dl,%edx
c0103c22:	c1 e2 10             	shl    $0x10,%edx
c0103c25:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103c2b:	09 d0                	or     %edx,%eax
c0103c2d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103c30:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c33:	c9                   	leave  
c0103c34:	c3                   	ret    

c0103c35 <VirAddr2PhyAddr>:
c0103c35:	55                   	push   %ebp
c0103c36:	89 e5                	mov    %esp,%ebp
c0103c38:	83 ec 10             	sub    $0x10,%esp
c0103c3b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103c3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c41:	01 d0                	add    %edx,%eax
c0103c43:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103c46:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c49:	c9                   	leave  
c0103c4a:	c3                   	ret    

c0103c4b <v2l>:
c0103c4b:	55                   	push   %ebp
c0103c4c:	89 e5                	mov    %esp,%ebp
c0103c4e:	83 ec 18             	sub    $0x18,%esp
c0103c51:	83 ec 0c             	sub    $0xc,%esp
c0103c54:	ff 75 08             	pushl  0x8(%ebp)
c0103c57:	e8 4a fe ff ff       	call   c0103aa6 <pid2proc>
c0103c5c:	83 c4 10             	add    $0x10,%esp
c0103c5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103c62:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103c69:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103c6c:	83 ec 08             	sub    $0x8,%esp
c0103c6f:	ff 75 f4             	pushl  -0xc(%ebp)
c0103c72:	50                   	push   %eax
c0103c73:	e8 79 ff ff ff       	call   c0103bf1 <Seg2PhyAddrLDT>
c0103c78:	83 c4 10             	add    $0x10,%esp
c0103c7b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103c7e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103c81:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c84:	01 d0                	add    %edx,%eax
c0103c86:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103c89:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c8c:	c9                   	leave  
c0103c8d:	c3                   	ret    

c0103c8e <init_propt>:
c0103c8e:	55                   	push   %ebp
c0103c8f:	89 e5                	mov    %esp,%ebp
c0103c91:	83 ec 38             	sub    $0x38,%esp
c0103c94:	6a 0e                	push   $0xe
c0103c96:	6a 08                	push   $0x8
c0103c98:	68 be 01 10 c0       	push   $0xc01001be
c0103c9d:	6a 20                	push   $0x20
c0103c9f:	e8 6b 01 00 00       	call   c0103e0f <InitInterruptDesc>
c0103ca4:	83 c4 10             	add    $0x10,%esp
c0103ca7:	6a 0e                	push   $0xe
c0103ca9:	6a 08                	push   $0x8
c0103cab:	68 ee 01 10 c0       	push   $0xc01001ee
c0103cb0:	6a 21                	push   $0x21
c0103cb2:	e8 58 01 00 00       	call   c0103e0f <InitInterruptDesc>
c0103cb7:	83 c4 10             	add    $0x10,%esp
c0103cba:	6a 0e                	push   $0xe
c0103cbc:	6a 08                	push   $0x8
c0103cbe:	68 31 02 10 c0       	push   $0xc0100231
c0103cc3:	6a 2e                	push   $0x2e
c0103cc5:	e8 45 01 00 00       	call   c0103e0f <InitInterruptDesc>
c0103cca:	83 c4 10             	add    $0x10,%esp
c0103ccd:	6a 0e                	push   $0xe
c0103ccf:	6a 08                	push   $0x8
c0103cd1:	68 77 02 10 c0       	push   $0xc0100277
c0103cd6:	6a 2a                	push   $0x2a
c0103cd8:	e8 32 01 00 00       	call   c0103e0f <InitInterruptDesc>
c0103cdd:	83 c4 10             	add    $0x10,%esp
c0103ce0:	83 ec 04             	sub    $0x4,%esp
c0103ce3:	68 e0 15 00 00       	push   $0x15e0
c0103ce8:	6a 00                	push   $0x0
c0103cea:	68 00 22 18 c0       	push   $0xc0182200
c0103cef:	e8 7b 85 00 00       	call   c010c26f <Memset>
c0103cf4:	83 c4 10             	add    $0x10,%esp
c0103cf7:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103cfe:	83 ec 04             	sub    $0x4,%esp
c0103d01:	ff 75 f4             	pushl  -0xc(%ebp)
c0103d04:	6a 00                	push   $0x0
c0103d06:	68 40 06 11 c0       	push   $0xc0110640
c0103d0b:	e8 5f 85 00 00       	call   c010c26f <Memset>
c0103d10:	83 c4 10             	add    $0x10,%esp
c0103d13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103d16:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103d1b:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103d22:	00 00 00 
c0103d25:	83 ec 0c             	sub    $0xc,%esp
c0103d28:	6a 30                	push   $0x30
c0103d2a:	e8 81 fe ff ff       	call   c0103bb0 <Seg2PhyAddr>
c0103d2f:	83 c4 10             	add    $0x10,%esp
c0103d32:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103d35:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103d3c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103d43:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103d46:	0f b7 d0             	movzwl %ax,%edx
c0103d49:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103d4c:	83 e8 01             	sub    $0x1,%eax
c0103d4f:	89 c1                	mov    %eax,%ecx
c0103d51:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103d54:	52                   	push   %edx
c0103d55:	51                   	push   %ecx
c0103d56:	50                   	push   %eax
c0103d57:	68 00 f8 10 c0       	push   $0xc010f800
c0103d5c:	e8 e2 fd ff ff       	call   c0103b43 <InitDescriptor>
c0103d61:	83 c4 10             	add    $0x10,%esp
c0103d64:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103d6b:	68 f2 00 00 00       	push   $0xf2
c0103d70:	68 ff ff 00 00       	push   $0xffff
c0103d75:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103d78:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103d7d:	e8 c1 fd ff ff       	call   c0103b43 <InitDescriptor>
c0103d82:	83 c4 10             	add    $0x10,%esp
c0103d85:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103d8c:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103d93:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103d9a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103d9d:	0f b7 c0             	movzwl %ax,%eax
c0103da0:	50                   	push   %eax
c0103da1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103da4:	6a 00                	push   $0x0
c0103da6:	68 08 f8 10 c0       	push   $0xc010f808
c0103dab:	e8 93 fd ff ff       	call   c0103b43 <InitDescriptor>
c0103db0:	83 c4 10             	add    $0x10,%esp
c0103db3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103db6:	0f b7 c0             	movzwl %ax,%eax
c0103db9:	50                   	push   %eax
c0103dba:	ff 75 d8             	pushl  -0x28(%ebp)
c0103dbd:	6a 00                	push   $0x0
c0103dbf:	68 10 f8 10 c0       	push   $0xc010f810
c0103dc4:	e8 7a fd ff ff       	call   c0103b43 <InitDescriptor>
c0103dc9:	83 c4 10             	add    $0x10,%esp
c0103dcc:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103dd3:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103dda:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103ddd:	0f b7 c0             	movzwl %ax,%eax
c0103de0:	50                   	push   %eax
c0103de1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103de4:	6a 00                	push   $0x0
c0103de6:	68 18 f8 10 c0       	push   $0xc010f818
c0103deb:	e8 53 fd ff ff       	call   c0103b43 <InitDescriptor>
c0103df0:	83 c4 10             	add    $0x10,%esp
c0103df3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103df6:	0f b7 c0             	movzwl %ax,%eax
c0103df9:	50                   	push   %eax
c0103dfa:	ff 75 d8             	pushl  -0x28(%ebp)
c0103dfd:	6a 00                	push   $0x0
c0103dff:	68 20 f8 10 c0       	push   $0xc010f820
c0103e04:	e8 3a fd ff ff       	call   c0103b43 <InitDescriptor>
c0103e09:	83 c4 10             	add    $0x10,%esp
c0103e0c:	90                   	nop
c0103e0d:	c9                   	leave  
c0103e0e:	c3                   	ret    

c0103e0f <InitInterruptDesc>:
c0103e0f:	55                   	push   %ebp
c0103e10:	89 e5                	mov    %esp,%ebp
c0103e12:	83 ec 10             	sub    $0x10,%esp
c0103e15:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e18:	c1 e0 03             	shl    $0x3,%eax
c0103e1b:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103e20:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103e23:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e26:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103e2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103e2d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103e30:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103e33:	89 c2                	mov    %eax,%edx
c0103e35:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e38:	66 89 10             	mov    %dx,(%eax)
c0103e3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e3e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103e44:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103e47:	c1 f8 10             	sar    $0x10,%eax
c0103e4a:	89 c2                	mov    %eax,%edx
c0103e4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e4f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103e53:	8b 45 10             	mov    0x10(%ebp),%eax
c0103e56:	c1 e0 04             	shl    $0x4,%eax
c0103e59:	89 c2                	mov    %eax,%edx
c0103e5b:	8b 45 14             	mov    0x14(%ebp),%eax
c0103e5e:	09 d0                	or     %edx,%eax
c0103e60:	89 c2                	mov    %eax,%edx
c0103e62:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103e65:	88 50 05             	mov    %dl,0x5(%eax)
c0103e68:	90                   	nop
c0103e69:	c9                   	leave  
c0103e6a:	c3                   	ret    

c0103e6b <ReloadGDT>:
c0103e6b:	55                   	push   %ebp
c0103e6c:	89 e5                	mov    %esp,%ebp
c0103e6e:	83 ec 28             	sub    $0x28,%esp
c0103e71:	b8 d4 06 11 c0       	mov    $0xc01106d4,%eax
c0103e76:	0f b7 00             	movzwl (%eax),%eax
c0103e79:	98                   	cwtl   
c0103e7a:	ba d6 06 11 c0       	mov    $0xc01106d6,%edx
c0103e7f:	8b 12                	mov    (%edx),%edx
c0103e81:	83 ec 04             	sub    $0x4,%esp
c0103e84:	50                   	push   %eax
c0103e85:	52                   	push   %edx
c0103e86:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103e8b:	e8 b1 83 00 00       	call   c010c241 <Memcpy2>
c0103e90:	83 c4 10             	add    $0x10,%esp
c0103e93:	c7 45 f0 d4 06 11 c0 	movl   $0xc01106d4,-0x10(%ebp)
c0103e9a:	c7 45 ec d6 06 11 c0 	movl   $0xc01106d6,-0x14(%ebp)
c0103ea1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ea4:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103ea9:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103eae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103eb1:	89 10                	mov    %edx,(%eax)
c0103eb3:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103eba:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103ec1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103ec4:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103ec9:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103ece:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103ed1:	89 10                	mov    %edx,(%eax)
c0103ed3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103eda:	eb 04                	jmp    c0103ee0 <ReloadGDT+0x75>
c0103edc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103ee0:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103ee7:	7e f3                	jle    c0103edc <ReloadGDT+0x71>
c0103ee9:	e8 a9 37 00 00       	call   c0107697 <init_internal_interrupt>
c0103eee:	e8 9b fd ff ff       	call   c0103c8e <init_propt>
c0103ef3:	90                   	nop
c0103ef4:	c9                   	leave  
c0103ef5:	c3                   	ret    

c0103ef6 <select_console>:
c0103ef6:	55                   	push   %ebp
c0103ef7:	89 e5                	mov    %esp,%ebp
c0103ef9:	83 ec 18             	sub    $0x18,%esp
c0103efc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eff:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103f02:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103f06:	75 27                	jne    c0103f2f <select_console+0x39>
c0103f08:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103f0c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103f12:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103f17:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103f1c:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103f21:	83 ec 0c             	sub    $0xc,%esp
c0103f24:	50                   	push   %eax
c0103f25:	e8 08 00 00 00       	call   c0103f32 <flush>
c0103f2a:	83 c4 10             	add    $0x10,%esp
c0103f2d:	eb 01                	jmp    c0103f30 <select_console+0x3a>
c0103f2f:	90                   	nop
c0103f30:	c9                   	leave  
c0103f31:	c3                   	ret    

c0103f32 <flush>:
c0103f32:	55                   	push   %ebp
c0103f33:	89 e5                	mov    %esp,%ebp
c0103f35:	83 ec 08             	sub    $0x8,%esp
c0103f38:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f3b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f41:	8b 40 0c             	mov    0xc(%eax),%eax
c0103f44:	83 ec 0c             	sub    $0xc,%esp
c0103f47:	50                   	push   %eax
c0103f48:	e8 1e 00 00 00       	call   c0103f6b <set_cursor>
c0103f4d:	83 c4 10             	add    $0x10,%esp
c0103f50:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f53:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f59:	8b 40 08             	mov    0x8(%eax),%eax
c0103f5c:	83 ec 0c             	sub    $0xc,%esp
c0103f5f:	50                   	push   %eax
c0103f60:	e8 64 00 00 00       	call   c0103fc9 <set_console_start_video_addr>
c0103f65:	83 c4 10             	add    $0x10,%esp
c0103f68:	90                   	nop
c0103f69:	c9                   	leave  
c0103f6a:	c3                   	ret    

c0103f6b <set_cursor>:
c0103f6b:	55                   	push   %ebp
c0103f6c:	89 e5                	mov    %esp,%ebp
c0103f6e:	83 ec 08             	sub    $0x8,%esp
c0103f71:	83 ec 08             	sub    $0x8,%esp
c0103f74:	6a 0e                	push   $0xe
c0103f76:	68 d4 03 00 00       	push   $0x3d4
c0103f7b:	e8 be c3 ff ff       	call   c010033e <out_byte>
c0103f80:	83 c4 10             	add    $0x10,%esp
c0103f83:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f86:	c1 e8 08             	shr    $0x8,%eax
c0103f89:	0f b7 c0             	movzwl %ax,%eax
c0103f8c:	83 ec 08             	sub    $0x8,%esp
c0103f8f:	50                   	push   %eax
c0103f90:	68 d5 03 00 00       	push   $0x3d5
c0103f95:	e8 a4 c3 ff ff       	call   c010033e <out_byte>
c0103f9a:	83 c4 10             	add    $0x10,%esp
c0103f9d:	83 ec 08             	sub    $0x8,%esp
c0103fa0:	6a 0f                	push   $0xf
c0103fa2:	68 d4 03 00 00       	push   $0x3d4
c0103fa7:	e8 92 c3 ff ff       	call   c010033e <out_byte>
c0103fac:	83 c4 10             	add    $0x10,%esp
c0103faf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fb2:	0f b7 c0             	movzwl %ax,%eax
c0103fb5:	83 ec 08             	sub    $0x8,%esp
c0103fb8:	50                   	push   %eax
c0103fb9:	68 d5 03 00 00       	push   $0x3d5
c0103fbe:	e8 7b c3 ff ff       	call   c010033e <out_byte>
c0103fc3:	83 c4 10             	add    $0x10,%esp
c0103fc6:	90                   	nop
c0103fc7:	c9                   	leave  
c0103fc8:	c3                   	ret    

c0103fc9 <set_console_start_video_addr>:
c0103fc9:	55                   	push   %ebp
c0103fca:	89 e5                	mov    %esp,%ebp
c0103fcc:	83 ec 08             	sub    $0x8,%esp
c0103fcf:	83 ec 08             	sub    $0x8,%esp
c0103fd2:	6a 0c                	push   $0xc
c0103fd4:	68 d4 03 00 00       	push   $0x3d4
c0103fd9:	e8 60 c3 ff ff       	call   c010033e <out_byte>
c0103fde:	83 c4 10             	add    $0x10,%esp
c0103fe1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fe4:	c1 e8 08             	shr    $0x8,%eax
c0103fe7:	0f b7 c0             	movzwl %ax,%eax
c0103fea:	83 ec 08             	sub    $0x8,%esp
c0103fed:	50                   	push   %eax
c0103fee:	68 d5 03 00 00       	push   $0x3d5
c0103ff3:	e8 46 c3 ff ff       	call   c010033e <out_byte>
c0103ff8:	83 c4 10             	add    $0x10,%esp
c0103ffb:	83 ec 08             	sub    $0x8,%esp
c0103ffe:	6a 0d                	push   $0xd
c0104000:	68 d4 03 00 00       	push   $0x3d4
c0104005:	e8 34 c3 ff ff       	call   c010033e <out_byte>
c010400a:	83 c4 10             	add    $0x10,%esp
c010400d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104010:	0f b7 c0             	movzwl %ax,%eax
c0104013:	83 ec 08             	sub    $0x8,%esp
c0104016:	50                   	push   %eax
c0104017:	68 d5 03 00 00       	push   $0x3d5
c010401c:	e8 1d c3 ff ff       	call   c010033e <out_byte>
c0104021:	83 c4 10             	add    $0x10,%esp
c0104024:	90                   	nop
c0104025:	c9                   	leave  
c0104026:	c3                   	ret    

c0104027 <put_key>:
c0104027:	55                   	push   %ebp
c0104028:	89 e5                	mov    %esp,%ebp
c010402a:	83 ec 04             	sub    $0x4,%esp
c010402d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104030:	88 45 fc             	mov    %al,-0x4(%ebp)
c0104033:	8b 45 08             	mov    0x8(%ebp),%eax
c0104036:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c010403c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104041:	77 4d                	ja     c0104090 <put_key+0x69>
c0104043:	8b 45 08             	mov    0x8(%ebp),%eax
c0104046:	8b 00                	mov    (%eax),%eax
c0104048:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c010404c:	89 10                	mov    %edx,(%eax)
c010404e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104051:	8b 00                	mov    (%eax),%eax
c0104053:	8d 50 04             	lea    0x4(%eax),%edx
c0104056:	8b 45 08             	mov    0x8(%ebp),%eax
c0104059:	89 10                	mov    %edx,(%eax)
c010405b:	8b 45 08             	mov    0x8(%ebp),%eax
c010405e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104064:	8d 50 01             	lea    0x1(%eax),%edx
c0104067:	8b 45 08             	mov    0x8(%ebp),%eax
c010406a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104070:	8b 45 08             	mov    0x8(%ebp),%eax
c0104073:	8b 00                	mov    (%eax),%eax
c0104075:	8b 55 08             	mov    0x8(%ebp),%edx
c0104078:	83 c2 08             	add    $0x8,%edx
c010407b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0104081:	39 d0                	cmp    %edx,%eax
c0104083:	75 0b                	jne    c0104090 <put_key+0x69>
c0104085:	8b 45 08             	mov    0x8(%ebp),%eax
c0104088:	8d 50 08             	lea    0x8(%eax),%edx
c010408b:	8b 45 08             	mov    0x8(%ebp),%eax
c010408e:	89 10                	mov    %edx,(%eax)
c0104090:	90                   	nop
c0104091:	c9                   	leave  
c0104092:	c3                   	ret    

c0104093 <scroll_up>:
c0104093:	55                   	push   %ebp
c0104094:	89 e5                	mov    %esp,%ebp
c0104096:	83 ec 08             	sub    $0x8,%esp
c0104099:	8b 45 08             	mov    0x8(%ebp),%eax
c010409c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040a2:	8b 40 08             	mov    0x8(%eax),%eax
c01040a5:	8d 50 b0             	lea    -0x50(%eax),%edx
c01040a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ab:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040b1:	8b 00                	mov    (%eax),%eax
c01040b3:	39 c2                	cmp    %eax,%edx
c01040b5:	76 1b                	jbe    c01040d2 <scroll_up+0x3f>
c01040b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ba:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040c0:	8b 40 08             	mov    0x8(%eax),%eax
c01040c3:	83 e8 50             	sub    $0x50,%eax
c01040c6:	83 ec 0c             	sub    $0xc,%esp
c01040c9:	50                   	push   %eax
c01040ca:	e8 fa fe ff ff       	call   c0103fc9 <set_console_start_video_addr>
c01040cf:	83 c4 10             	add    $0x10,%esp
c01040d2:	90                   	nop
c01040d3:	c9                   	leave  
c01040d4:	c3                   	ret    

c01040d5 <scroll_down>:
c01040d5:	55                   	push   %ebp
c01040d6:	89 e5                	mov    %esp,%ebp
c01040d8:	83 ec 08             	sub    $0x8,%esp
c01040db:	8b 45 08             	mov    0x8(%ebp),%eax
c01040de:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040e4:	8b 40 08             	mov    0x8(%eax),%eax
c01040e7:	8d 48 50             	lea    0x50(%eax),%ecx
c01040ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ed:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040f3:	8b 10                	mov    (%eax),%edx
c01040f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01040f8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040fe:	8b 40 04             	mov    0x4(%eax),%eax
c0104101:	01 d0                	add    %edx,%eax
c0104103:	39 c1                	cmp    %eax,%ecx
c0104105:	73 36                	jae    c010413d <scroll_down+0x68>
c0104107:	8b 45 08             	mov    0x8(%ebp),%eax
c010410a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104110:	8b 40 08             	mov    0x8(%eax),%eax
c0104113:	83 c0 50             	add    $0x50,%eax
c0104116:	83 ec 0c             	sub    $0xc,%esp
c0104119:	50                   	push   %eax
c010411a:	e8 aa fe ff ff       	call   c0103fc9 <set_console_start_video_addr>
c010411f:	83 c4 10             	add    $0x10,%esp
c0104122:	8b 45 08             	mov    0x8(%ebp),%eax
c0104125:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010412b:	8b 50 08             	mov    0x8(%eax),%edx
c010412e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104131:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104137:	83 c2 50             	add    $0x50,%edx
c010413a:	89 50 08             	mov    %edx,0x8(%eax)
c010413d:	90                   	nop
c010413e:	c9                   	leave  
c010413f:	c3                   	ret    

c0104140 <out_char>:
c0104140:	55                   	push   %ebp
c0104141:	89 e5                	mov    %esp,%ebp
c0104143:	83 ec 28             	sub    $0x28,%esp
c0104146:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104149:	88 45 e4             	mov    %al,-0x1c(%ebp)
c010414c:	e8 a7 2d 00 00       	call   c0106ef8 <intr_disable>
c0104151:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104154:	8b 45 08             	mov    0x8(%ebp),%eax
c0104157:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010415d:	8b 40 0c             	mov    0xc(%eax),%eax
c0104160:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0104165:	01 c0                	add    %eax,%eax
c0104167:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010416a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c010416e:	83 f8 08             	cmp    $0x8,%eax
c0104171:	0f 84 8d 00 00 00    	je     c0104204 <out_char+0xc4>
c0104177:	83 f8 0a             	cmp    $0xa,%eax
c010417a:	0f 85 c9 00 00 00    	jne    c0104249 <out_char+0x109>
c0104180:	8b 45 08             	mov    0x8(%ebp),%eax
c0104183:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104189:	8b 50 0c             	mov    0xc(%eax),%edx
c010418c:	8b 45 08             	mov    0x8(%ebp),%eax
c010418f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104195:	8b 08                	mov    (%eax),%ecx
c0104197:	8b 45 08             	mov    0x8(%ebp),%eax
c010419a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041a0:	8b 40 04             	mov    0x4(%eax),%eax
c01041a3:	01 c8                	add    %ecx,%eax
c01041a5:	83 e8 50             	sub    $0x50,%eax
c01041a8:	39 c2                	cmp    %eax,%edx
c01041aa:	0f 83 f4 00 00 00    	jae    c01042a4 <out_char+0x164>
c01041b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01041b3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041b9:	8b 08                	mov    (%eax),%ecx
c01041bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01041be:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041c4:	8b 50 0c             	mov    0xc(%eax),%edx
c01041c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041d0:	8b 00                	mov    (%eax),%eax
c01041d2:	29 c2                	sub    %eax,%edx
c01041d4:	89 d0                	mov    %edx,%eax
c01041d6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c01041db:	f7 e2                	mul    %edx
c01041dd:	89 d0                	mov    %edx,%eax
c01041df:	c1 e8 06             	shr    $0x6,%eax
c01041e2:	8d 50 01             	lea    0x1(%eax),%edx
c01041e5:	89 d0                	mov    %edx,%eax
c01041e7:	c1 e0 02             	shl    $0x2,%eax
c01041ea:	01 d0                	add    %edx,%eax
c01041ec:	c1 e0 04             	shl    $0x4,%eax
c01041ef:	89 c2                	mov    %eax,%edx
c01041f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01041f4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01041fa:	01 ca                	add    %ecx,%edx
c01041fc:	89 50 0c             	mov    %edx,0xc(%eax)
c01041ff:	e9 a0 00 00 00       	jmp    c01042a4 <out_char+0x164>
c0104204:	8b 45 08             	mov    0x8(%ebp),%eax
c0104207:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010420d:	8b 50 0c             	mov    0xc(%eax),%edx
c0104210:	8b 45 08             	mov    0x8(%ebp),%eax
c0104213:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104219:	8b 00                	mov    (%eax),%eax
c010421b:	39 c2                	cmp    %eax,%edx
c010421d:	0f 86 84 00 00 00    	jbe    c01042a7 <out_char+0x167>
c0104223:	8b 45 08             	mov    0x8(%ebp),%eax
c0104226:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010422c:	8b 50 0c             	mov    0xc(%eax),%edx
c010422f:	83 ea 01             	sub    $0x1,%edx
c0104232:	89 50 0c             	mov    %edx,0xc(%eax)
c0104235:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104238:	83 e8 02             	sub    $0x2,%eax
c010423b:	c6 00 20             	movb   $0x20,(%eax)
c010423e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104241:	83 e8 01             	sub    $0x1,%eax
c0104244:	c6 00 00             	movb   $0x0,(%eax)
c0104247:	eb 5e                	jmp    c01042a7 <out_char+0x167>
c0104249:	8b 45 08             	mov    0x8(%ebp),%eax
c010424c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104252:	8b 40 0c             	mov    0xc(%eax),%eax
c0104255:	8d 48 01             	lea    0x1(%eax),%ecx
c0104258:	8b 45 08             	mov    0x8(%ebp),%eax
c010425b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104261:	8b 10                	mov    (%eax),%edx
c0104263:	8b 45 08             	mov    0x8(%ebp),%eax
c0104266:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010426c:	8b 40 04             	mov    0x4(%eax),%eax
c010426f:	01 d0                	add    %edx,%eax
c0104271:	39 c1                	cmp    %eax,%ecx
c0104273:	73 35                	jae    c01042aa <out_char+0x16a>
c0104275:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104278:	8d 50 01             	lea    0x1(%eax),%edx
c010427b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010427e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0104282:	88 10                	mov    %dl,(%eax)
c0104284:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104287:	8d 50 01             	lea    0x1(%eax),%edx
c010428a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010428d:	c6 00 0a             	movb   $0xa,(%eax)
c0104290:	8b 45 08             	mov    0x8(%ebp),%eax
c0104293:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104299:	8b 50 0c             	mov    0xc(%eax),%edx
c010429c:	83 c2 01             	add    $0x1,%edx
c010429f:	89 50 0c             	mov    %edx,0xc(%eax)
c01042a2:	eb 06                	jmp    c01042aa <out_char+0x16a>
c01042a4:	90                   	nop
c01042a5:	eb 14                	jmp    c01042bb <out_char+0x17b>
c01042a7:	90                   	nop
c01042a8:	eb 11                	jmp    c01042bb <out_char+0x17b>
c01042aa:	90                   	nop
c01042ab:	eb 0e                	jmp    c01042bb <out_char+0x17b>
c01042ad:	83 ec 0c             	sub    $0xc,%esp
c01042b0:	ff 75 08             	pushl  0x8(%ebp)
c01042b3:	e8 1d fe ff ff       	call   c01040d5 <scroll_down>
c01042b8:	83 c4 10             	add    $0x10,%esp
c01042bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01042be:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01042c4:	8b 50 0c             	mov    0xc(%eax),%edx
c01042c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01042ca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01042d0:	8b 40 08             	mov    0x8(%eax),%eax
c01042d3:	29 c2                	sub    %eax,%edx
c01042d5:	89 d0                	mov    %edx,%eax
c01042d7:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c01042dc:	77 cf                	ja     c01042ad <out_char+0x16d>
c01042de:	83 ec 0c             	sub    $0xc,%esp
c01042e1:	ff 75 08             	pushl  0x8(%ebp)
c01042e4:	e8 49 fc ff ff       	call   c0103f32 <flush>
c01042e9:	83 c4 10             	add    $0x10,%esp
c01042ec:	83 ec 0c             	sub    $0xc,%esp
c01042ef:	ff 75 f4             	pushl  -0xc(%ebp)
c01042f2:	e8 2a 2c 00 00       	call   c0106f21 <intr_set_status>
c01042f7:	83 c4 10             	add    $0x10,%esp
c01042fa:	90                   	nop
c01042fb:	c9                   	leave  
c01042fc:	c3                   	ret    

c01042fd <tty_dev_read>:
c01042fd:	55                   	push   %ebp
c01042fe:	89 e5                	mov    %esp,%ebp
c0104300:	83 ec 08             	sub    $0x8,%esp
c0104303:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104308:	39 45 08             	cmp    %eax,0x8(%ebp)
c010430b:	75 17                	jne    c0104324 <tty_dev_read+0x27>
c010430d:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104312:	85 c0                	test   %eax,%eax
c0104314:	7e 0e                	jle    c0104324 <tty_dev_read+0x27>
c0104316:	83 ec 0c             	sub    $0xc,%esp
c0104319:	ff 75 08             	pushl  0x8(%ebp)
c010431c:	e8 89 07 00 00       	call   c0104aaa <keyboard_read>
c0104321:	83 c4 10             	add    $0x10,%esp
c0104324:	90                   	nop
c0104325:	c9                   	leave  
c0104326:	c3                   	ret    

c0104327 <tty_dev_write>:
c0104327:	55                   	push   %ebp
c0104328:	89 e5                	mov    %esp,%ebp
c010432a:	83 ec 28             	sub    $0x28,%esp
c010432d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104330:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104336:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104339:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104340:	e9 88 01 00 00       	jmp    c01044cd <tty_dev_write+0x1a6>
c0104345:	8b 45 08             	mov    0x8(%ebp),%eax
c0104348:	8b 40 04             	mov    0x4(%eax),%eax
c010434b:	8b 00                	mov    (%eax),%eax
c010434d:	88 45 e7             	mov    %al,-0x19(%ebp)
c0104350:	8b 45 08             	mov    0x8(%ebp),%eax
c0104353:	8b 40 04             	mov    0x4(%eax),%eax
c0104356:	8d 50 04             	lea    0x4(%eax),%edx
c0104359:	8b 45 08             	mov    0x8(%ebp),%eax
c010435c:	89 50 04             	mov    %edx,0x4(%eax)
c010435f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104362:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104368:	8d 50 ff             	lea    -0x1(%eax),%edx
c010436b:	8b 45 08             	mov    0x8(%ebp),%eax
c010436e:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104374:	8b 45 08             	mov    0x8(%ebp),%eax
c0104377:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010437d:	8d 50 01             	lea    0x1(%eax),%edx
c0104380:	8b 45 08             	mov    0x8(%ebp),%eax
c0104383:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104389:	8b 45 08             	mov    0x8(%ebp),%eax
c010438c:	8b 40 04             	mov    0x4(%eax),%eax
c010438f:	8b 55 08             	mov    0x8(%ebp),%edx
c0104392:	83 c2 08             	add    $0x8,%edx
c0104395:	81 c2 00 08 00 00    	add    $0x800,%edx
c010439b:	39 d0                	cmp    %edx,%eax
c010439d:	75 0c                	jne    c01043ab <tty_dev_write+0x84>
c010439f:	8b 45 08             	mov    0x8(%ebp),%eax
c01043a2:	8d 50 08             	lea    0x8(%eax),%edx
c01043a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01043a8:	89 50 04             	mov    %edx,0x4(%eax)
c01043ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01043ae:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01043b4:	85 c0                	test   %eax,%eax
c01043b6:	0f 84 11 01 00 00    	je     c01044cd <tty_dev_write+0x1a6>
c01043bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043c0:	3c 20                	cmp    $0x20,%al
c01043c2:	76 08                	jbe    c01043cc <tty_dev_write+0xa5>
c01043c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043c8:	3c 7e                	cmp    $0x7e,%al
c01043ca:	76 10                	jbe    c01043dc <tty_dev_write+0xb5>
c01043cc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043d0:	3c 20                	cmp    $0x20,%al
c01043d2:	74 08                	je     c01043dc <tty_dev_write+0xb5>
c01043d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01043d8:	84 c0                	test   %al,%al
c01043da:	75 58                	jne    c0104434 <tty_dev_write+0x10d>
c01043dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01043df:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c01043e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01043e8:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01043ee:	01 d0                	add    %edx,%eax
c01043f0:	83 e8 01             	sub    $0x1,%eax
c01043f3:	89 c2                	mov    %eax,%edx
c01043f5:	83 ec 04             	sub    $0x4,%esp
c01043f8:	6a 01                	push   $0x1
c01043fa:	8d 45 e7             	lea    -0x19(%ebp),%eax
c01043fd:	50                   	push   %eax
c01043fe:	52                   	push   %edx
c01043ff:	e8 58 2b 00 00       	call   c0106f5c <Memcpy>
c0104404:	83 c4 10             	add    $0x10,%esp
c0104407:	8b 45 08             	mov    0x8(%ebp),%eax
c010440a:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104410:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104413:	8b 45 08             	mov    0x8(%ebp),%eax
c0104416:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c010441c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104420:	0f b6 c0             	movzbl %al,%eax
c0104423:	83 ec 08             	sub    $0x8,%esp
c0104426:	50                   	push   %eax
c0104427:	ff 75 08             	pushl  0x8(%ebp)
c010442a:	e8 11 fd ff ff       	call   c0104140 <out_char>
c010442f:	83 c4 10             	add    $0x10,%esp
c0104432:	eb 7c                	jmp    c01044b0 <tty_dev_write+0x189>
c0104434:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104438:	3c 08                	cmp    $0x8,%al
c010443a:	75 42                	jne    c010447e <tty_dev_write+0x157>
c010443c:	8b 45 08             	mov    0x8(%ebp),%eax
c010443f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104445:	8d 50 01             	lea    0x1(%eax),%edx
c0104448:	8b 45 08             	mov    0x8(%ebp),%eax
c010444b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104451:	8b 45 08             	mov    0x8(%ebp),%eax
c0104454:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010445a:	8d 50 fe             	lea    -0x2(%eax),%edx
c010445d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104460:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104466:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010446a:	0f b6 c0             	movzbl %al,%eax
c010446d:	83 ec 08             	sub    $0x8,%esp
c0104470:	50                   	push   %eax
c0104471:	ff 75 08             	pushl  0x8(%ebp)
c0104474:	e8 c7 fc ff ff       	call   c0104140 <out_char>
c0104479:	83 c4 10             	add    $0x10,%esp
c010447c:	eb 32                	jmp    c01044b0 <tty_dev_write+0x189>
c010447e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104482:	3c 0a                	cmp    $0xa,%al
c0104484:	75 2a                	jne    c01044b0 <tty_dev_write+0x189>
c0104486:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010448a:	0f b6 c0             	movzbl %al,%eax
c010448d:	83 ec 08             	sub    $0x8,%esp
c0104490:	50                   	push   %eax
c0104491:	ff 75 08             	pushl  0x8(%ebp)
c0104494:	e8 a7 fc ff ff       	call   c0104140 <out_char>
c0104499:	83 c4 10             	add    $0x10,%esp
c010449c:	8b 45 08             	mov    0x8(%ebp),%eax
c010449f:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c01044a6:	00 00 00 
c01044a9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01044b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01044b3:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01044b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01044bc:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c01044c2:	39 c2                	cmp    %eax,%edx
c01044c4:	75 07                	jne    c01044cd <tty_dev_write+0x1a6>
c01044c6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01044cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01044d0:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01044d6:	85 c0                	test   %eax,%eax
c01044d8:	0f 85 67 fe ff ff    	jne    c0104345 <tty_dev_write+0x1e>
c01044de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01044e2:	74 6d                	je     c0104551 <tty_dev_write+0x22a>
c01044e4:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c01044eb:	83 ec 0c             	sub    $0xc,%esp
c01044ee:	ff 75 ec             	pushl  -0x14(%ebp)
c01044f1:	e8 b6 d3 ff ff       	call   c01018ac <sys_malloc>
c01044f6:	83 c4 10             	add    $0x10,%esp
c01044f9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01044fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01044ff:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104506:	8b 45 08             	mov    0x8(%ebp),%eax
c0104509:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010450f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104512:	89 50 60             	mov    %edx,0x60(%eax)
c0104515:	8b 45 08             	mov    0x8(%ebp),%eax
c0104518:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010451e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104521:	89 50 68             	mov    %edx,0x68(%eax)
c0104524:	8b 45 08             	mov    0x8(%ebp),%eax
c0104527:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010452d:	83 ec 04             	sub    $0x4,%esp
c0104530:	50                   	push   %eax
c0104531:	ff 75 e8             	pushl  -0x18(%ebp)
c0104534:	6a 01                	push   $0x1
c0104536:	e8 aa 52 00 00       	call   c01097e5 <send_rec>
c010453b:	83 c4 10             	add    $0x10,%esp
c010453e:	83 ec 08             	sub    $0x8,%esp
c0104541:	ff 75 ec             	pushl  -0x14(%ebp)
c0104544:	ff 75 e8             	pushl  -0x18(%ebp)
c0104547:	e8 75 d3 ff ff       	call   c01018c1 <sys_free>
c010454c:	83 c4 10             	add    $0x10,%esp
c010454f:	eb 01                	jmp    c0104552 <tty_dev_write+0x22b>
c0104551:	90                   	nop
c0104552:	c9                   	leave  
c0104553:	c3                   	ret    

c0104554 <tty_do_read>:
c0104554:	55                   	push   %ebp
c0104555:	89 e5                	mov    %esp,%ebp
c0104557:	83 ec 08             	sub    $0x8,%esp
c010455a:	8b 45 08             	mov    0x8(%ebp),%eax
c010455d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104564:	00 00 00 
c0104567:	8b 45 0c             	mov    0xc(%ebp),%eax
c010456a:	8b 50 68             	mov    0x68(%eax),%edx
c010456d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104570:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104576:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104579:	8b 00                	mov    (%eax),%eax
c010457b:	89 c2                	mov    %eax,%edx
c010457d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104580:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0104586:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104589:	8b 50 60             	mov    0x60(%eax),%edx
c010458c:	8b 45 08             	mov    0x8(%ebp),%eax
c010458f:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104595:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104598:	8b 50 60             	mov    0x60(%eax),%edx
c010459b:	8b 45 08             	mov    0x8(%ebp),%eax
c010459e:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c01045a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01045a7:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c01045ad:	8b 45 0c             	mov    0xc(%ebp),%eax
c01045b0:	8b 40 10             	mov    0x10(%eax),%eax
c01045b3:	83 ec 08             	sub    $0x8,%esp
c01045b6:	52                   	push   %edx
c01045b7:	50                   	push   %eax
c01045b8:	e8 32 1b 00 00       	call   c01060ef <alloc_virtual_memory>
c01045bd:	83 c4 10             	add    $0x10,%esp
c01045c0:	89 c2                	mov    %eax,%edx
c01045c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01045c5:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c01045cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01045ce:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01045d4:	83 f8 02             	cmp    $0x2,%eax
c01045d7:	74 1c                	je     c01045f5 <tty_do_read+0xa1>
c01045d9:	68 3b 01 00 00       	push   $0x13b
c01045de:	68 a1 b5 10 c0       	push   $0xc010b5a1
c01045e3:	68 a1 b5 10 c0       	push   $0xc010b5a1
c01045e8:	68 ab b5 10 c0       	push   $0xc010b5ab
c01045ed:	e8 83 45 00 00       	call   c0108b75 <assertion_failure>
c01045f2:	83 c4 10             	add    $0x10,%esp
c01045f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01045f8:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c01045ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0104602:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104608:	83 ec 04             	sub    $0x4,%esp
c010460b:	50                   	push   %eax
c010460c:	ff 75 0c             	pushl  0xc(%ebp)
c010460f:	6a 01                	push   $0x1
c0104611:	e8 cf 51 00 00       	call   c01097e5 <send_rec>
c0104616:	83 c4 10             	add    $0x10,%esp
c0104619:	90                   	nop
c010461a:	c9                   	leave  
c010461b:	c3                   	ret    

c010461c <tty_do_write>:
c010461c:	55                   	push   %ebp
c010461d:	89 e5                	mov    %esp,%ebp
c010461f:	53                   	push   %ebx
c0104620:	83 ec 24             	sub    $0x24,%esp
c0104623:	89 e0                	mov    %esp,%eax
c0104625:	89 c3                	mov    %eax,%ebx
c0104627:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010462e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104631:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104634:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104637:	89 c2                	mov    %eax,%edx
c0104639:	b8 10 00 00 00       	mov    $0x10,%eax
c010463e:	83 e8 01             	sub    $0x1,%eax
c0104641:	01 d0                	add    %edx,%eax
c0104643:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104648:	ba 00 00 00 00       	mov    $0x0,%edx
c010464d:	f7 f1                	div    %ecx
c010464f:	6b c0 10             	imul   $0x10,%eax,%eax
c0104652:	29 c4                	sub    %eax,%esp
c0104654:	89 e0                	mov    %esp,%eax
c0104656:	83 c0 00             	add    $0x0,%eax
c0104659:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010465c:	83 ec 04             	sub    $0x4,%esp
c010465f:	ff 75 e8             	pushl  -0x18(%ebp)
c0104662:	6a 00                	push   $0x0
c0104664:	ff 75 e0             	pushl  -0x20(%ebp)
c0104667:	e8 03 7c 00 00       	call   c010c26f <Memset>
c010466c:	83 c4 10             	add    $0x10,%esp
c010466f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104672:	8b 40 60             	mov    0x60(%eax),%eax
c0104675:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104678:	8b 45 08             	mov    0x8(%ebp),%eax
c010467b:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104682:	00 00 00 
c0104685:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104688:	8b 45 0c             	mov    0xc(%ebp),%eax
c010468b:	8b 40 10             	mov    0x10(%eax),%eax
c010468e:	83 ec 08             	sub    $0x8,%esp
c0104691:	52                   	push   %edx
c0104692:	50                   	push   %eax
c0104693:	e8 57 1a 00 00       	call   c01060ef <alloc_virtual_memory>
c0104698:	83 c4 10             	add    $0x10,%esp
c010469b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010469e:	eb 7e                	jmp    c010471e <tty_do_write+0x102>
c01046a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01046a3:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01046a6:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c01046aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01046ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01046b0:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01046b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01046b9:	01 d0                	add    %edx,%eax
c01046bb:	83 ec 04             	sub    $0x4,%esp
c01046be:	ff 75 f0             	pushl  -0x10(%ebp)
c01046c1:	50                   	push   %eax
c01046c2:	ff 75 e0             	pushl  -0x20(%ebp)
c01046c5:	e8 92 28 00 00       	call   c0106f5c <Memcpy>
c01046ca:	83 c4 10             	add    $0x10,%esp
c01046cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01046d0:	29 45 ec             	sub    %eax,-0x14(%ebp)
c01046d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01046d6:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01046dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01046df:	01 c2                	add    %eax,%edx
c01046e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01046e4:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01046ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01046f1:	eb 25                	jmp    c0104718 <tty_do_write+0xfc>
c01046f3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01046f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046f9:	01 d0                	add    %edx,%eax
c01046fb:	0f b6 00             	movzbl (%eax),%eax
c01046fe:	0f b6 c0             	movzbl %al,%eax
c0104701:	83 ec 08             	sub    $0x8,%esp
c0104704:	50                   	push   %eax
c0104705:	ff 75 08             	pushl  0x8(%ebp)
c0104708:	e8 33 fa ff ff       	call   c0104140 <out_char>
c010470d:	83 c4 10             	add    $0x10,%esp
c0104710:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104714:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104718:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010471c:	75 d5                	jne    c01046f3 <tty_do_write+0xd7>
c010471e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0104722:	0f 85 78 ff ff ff    	jne    c01046a0 <tty_do_write+0x84>
c0104728:	83 ec 0c             	sub    $0xc,%esp
c010472b:	6a 7c                	push   $0x7c
c010472d:	e8 7a d1 ff ff       	call   c01018ac <sys_malloc>
c0104732:	83 c4 10             	add    $0x10,%esp
c0104735:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104738:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010473b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104742:	8b 45 08             	mov    0x8(%ebp),%eax
c0104745:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010474b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010474e:	89 50 58             	mov    %edx,0x58(%eax)
c0104751:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104754:	8b 00                	mov    (%eax),%eax
c0104756:	83 ec 04             	sub    $0x4,%esp
c0104759:	50                   	push   %eax
c010475a:	ff 75 d8             	pushl  -0x28(%ebp)
c010475d:	6a 01                	push   $0x1
c010475f:	e8 81 50 00 00       	call   c01097e5 <send_rec>
c0104764:	83 c4 10             	add    $0x10,%esp
c0104767:	83 ec 08             	sub    $0x8,%esp
c010476a:	6a 7c                	push   $0x7c
c010476c:	ff 75 d8             	pushl  -0x28(%ebp)
c010476f:	e8 4d d1 ff ff       	call   c01018c1 <sys_free>
c0104774:	83 c4 10             	add    $0x10,%esp
c0104777:	89 dc                	mov    %ebx,%esp
c0104779:	90                   	nop
c010477a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010477d:	c9                   	leave  
c010477e:	c3                   	ret    

c010477f <init_screen>:
c010477f:	55                   	push   %ebp
c0104780:	89 e5                	mov    %esp,%ebp
c0104782:	83 ec 10             	sub    $0x10,%esp
c0104785:	8b 45 08             	mov    0x8(%ebp),%eax
c0104788:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010478d:	c1 f8 03             	sar    $0x3,%eax
c0104790:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104796:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104799:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010479c:	c1 e0 04             	shl    $0x4,%eax
c010479f:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c01047a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01047a8:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c01047ae:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c01047b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01047b8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01047be:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01047c1:	89 50 04             	mov    %edx,0x4(%eax)
c01047c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01047c7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01047cd:	8b 50 04             	mov    0x4(%eax),%edx
c01047d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01047d3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01047d9:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c01047dd:	89 10                	mov    %edx,(%eax)
c01047df:	8b 45 08             	mov    0x8(%ebp),%eax
c01047e2:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c01047e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01047eb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01047f1:	8b 12                	mov    (%edx),%edx
c01047f3:	89 50 08             	mov    %edx,0x8(%eax)
c01047f6:	8b 55 08             	mov    0x8(%ebp),%edx
c01047f9:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c01047ff:	8b 40 08             	mov    0x8(%eax),%eax
c0104802:	89 42 0c             	mov    %eax,0xc(%edx)
c0104805:	90                   	nop
c0104806:	c9                   	leave  
c0104807:	c3                   	ret    

c0104808 <init_tty>:
c0104808:	55                   	push   %ebp
c0104809:	89 e5                	mov    %esp,%ebp
c010480b:	83 ec 18             	sub    $0x18,%esp
c010480e:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104815:	e9 92 00 00 00       	jmp    c01048ac <init_tty+0xa4>
c010481a:	83 ec 04             	sub    $0x4,%esp
c010481d:	68 28 08 00 00       	push   $0x828
c0104822:	6a 00                	push   $0x0
c0104824:	ff 75 f4             	pushl  -0xc(%ebp)
c0104827:	e8 43 7a 00 00       	call   c010c26f <Memset>
c010482c:	83 c4 10             	add    $0x10,%esp
c010482f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104832:	8d 50 08             	lea    0x8(%eax),%edx
c0104835:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104838:	89 50 04             	mov    %edx,0x4(%eax)
c010483b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010483e:	8b 50 04             	mov    0x4(%eax),%edx
c0104841:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104844:	89 10                	mov    %edx,(%eax)
c0104846:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104849:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0104850:	00 00 00 
c0104853:	83 ec 0c             	sub    $0xc,%esp
c0104856:	ff 75 f4             	pushl  -0xc(%ebp)
c0104859:	e8 21 ff ff ff       	call   c010477f <init_screen>
c010485e:	83 c4 10             	add    $0x10,%esp
c0104861:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104864:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104869:	85 c0                	test   %eax,%eax
c010486b:	7e 38                	jle    c01048a5 <init_tty+0x9d>
c010486d:	83 ec 08             	sub    $0x8,%esp
c0104870:	6a 23                	push   $0x23
c0104872:	ff 75 f4             	pushl  -0xc(%ebp)
c0104875:	e8 c6 f8 ff ff       	call   c0104140 <out_char>
c010487a:	83 c4 10             	add    $0x10,%esp
c010487d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104880:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0104885:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010488a:	c1 f8 03             	sar    $0x3,%eax
c010488d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104893:	0f b6 c0             	movzbl %al,%eax
c0104896:	83 ec 08             	sub    $0x8,%esp
c0104899:	50                   	push   %eax
c010489a:	ff 75 f4             	pushl  -0xc(%ebp)
c010489d:	e8 9e f8 ff ff       	call   c0104140 <out_char>
c01048a2:	83 c4 10             	add    $0x10,%esp
c01048a5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01048ac:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01048b1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01048b4:	0f 82 60 ff ff ff    	jb     c010481a <init_tty+0x12>
c01048ba:	90                   	nop
c01048bb:	c9                   	leave  
c01048bc:	c3                   	ret    

c01048bd <TaskTTY>:
c01048bd:	55                   	push   %ebp
c01048be:	89 e5                	mov    %esp,%ebp
c01048c0:	83 ec 28             	sub    $0x28,%esp
c01048c3:	e8 40 ff ff ff       	call   c0104808 <init_tty>
c01048c8:	83 ec 0c             	sub    $0xc,%esp
c01048cb:	6a 00                	push   $0x0
c01048cd:	e8 24 f6 ff ff       	call   c0103ef6 <select_console>
c01048d2:	83 c4 10             	add    $0x10,%esp
c01048d5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01048dc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01048e3:	83 ec 0c             	sub    $0xc,%esp
c01048e6:	6a 7c                	push   $0x7c
c01048e8:	e8 bf cf ff ff       	call   c01018ac <sys_malloc>
c01048ed:	83 c4 10             	add    $0x10,%esp
c01048f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01048f3:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01048fa:	eb 30                	jmp    c010492c <TaskTTY+0x6f>
c01048fc:	83 ec 0c             	sub    $0xc,%esp
c01048ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0104902:	e8 f6 f9 ff ff       	call   c01042fd <tty_dev_read>
c0104907:	83 c4 10             	add    $0x10,%esp
c010490a:	83 ec 0c             	sub    $0xc,%esp
c010490d:	ff 75 f4             	pushl  -0xc(%ebp)
c0104910:	e8 12 fa ff ff       	call   c0104327 <tty_dev_write>
c0104915:	83 c4 10             	add    $0x10,%esp
c0104918:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010491b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104921:	85 c0                	test   %eax,%eax
c0104923:	75 d7                	jne    c01048fc <TaskTTY+0x3f>
c0104925:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010492c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104931:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104934:	72 c6                	jb     c01048fc <TaskTTY+0x3f>
c0104936:	83 ec 04             	sub    $0x4,%esp
c0104939:	6a 12                	push   $0x12
c010493b:	ff 75 e8             	pushl  -0x18(%ebp)
c010493e:	6a 02                	push   $0x2
c0104940:	e8 a0 4e 00 00       	call   c01097e5 <send_rec>
c0104945:	83 c4 10             	add    $0x10,%esp
c0104948:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010494b:	8b 40 78             	mov    0x78(%eax),%eax
c010494e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104951:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104958:	74 28                	je     c0104982 <TaskTTY+0xc5>
c010495a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104961:	7f 0b                	jg     c010496e <TaskTTY+0xb1>
c0104963:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c010496a:	74 4e                	je     c01049ba <TaskTTY+0xfd>
c010496c:	eb 4d                	jmp    c01049bb <TaskTTY+0xfe>
c010496e:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104975:	74 21                	je     c0104998 <TaskTTY+0xdb>
c0104977:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c010497e:	74 2e                	je     c01049ae <TaskTTY+0xf1>
c0104980:	eb 39                	jmp    c01049bb <TaskTTY+0xfe>
c0104982:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104987:	83 ec 08             	sub    $0x8,%esp
c010498a:	ff 75 e8             	pushl  -0x18(%ebp)
c010498d:	50                   	push   %eax
c010498e:	e8 c1 fb ff ff       	call   c0104554 <tty_do_read>
c0104993:	83 c4 10             	add    $0x10,%esp
c0104996:	eb 23                	jmp    c01049bb <TaskTTY+0xfe>
c0104998:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c010499d:	83 ec 08             	sub    $0x8,%esp
c01049a0:	ff 75 e8             	pushl  -0x18(%ebp)
c01049a3:	50                   	push   %eax
c01049a4:	e8 73 fc ff ff       	call   c010461c <tty_do_write>
c01049a9:	83 c4 10             	add    $0x10,%esp
c01049ac:	eb 0d                	jmp    c01049bb <TaskTTY+0xfe>
c01049ae:	c7 05 c8 06 11 c0 00 	movl   $0x0,0xc01106c8
c01049b5:	00 00 00 
c01049b8:	eb 01                	jmp    c01049bb <TaskTTY+0xfe>
c01049ba:	90                   	nop
c01049bb:	e9 33 ff ff ff       	jmp    c01048f3 <TaskTTY+0x36>

c01049c0 <keyboard_handler>:
c01049c0:	55                   	push   %ebp
c01049c1:	89 e5                	mov    %esp,%ebp
c01049c3:	83 ec 18             	sub    $0x18,%esp
c01049c6:	c7 05 c8 06 11 c0 01 	movl   $0x1,0xc01106c8
c01049cd:	00 00 00 
c01049d0:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c01049d7:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01049dc:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c01049e1:	7f 5e                	jg     c0104a41 <keyboard_handler+0x81>
c01049e3:	e8 78 b9 ff ff       	call   c0100360 <disable_int>
c01049e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01049eb:	0f b7 c0             	movzwl %ax,%eax
c01049ee:	83 ec 0c             	sub    $0xc,%esp
c01049f1:	50                   	push   %eax
c01049f2:	e8 3b b9 ff ff       	call   c0100332 <in_byte>
c01049f7:	83 c4 10             	add    $0x10,%esp
c01049fa:	88 45 f3             	mov    %al,-0xd(%ebp)
c01049fd:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104a02:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104a06:	88 10                	mov    %dl,(%eax)
c0104a08:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104a0d:	83 c0 01             	add    $0x1,%eax
c0104a10:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104a15:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104a1a:	83 c0 01             	add    $0x1,%eax
c0104a1d:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104a22:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104a27:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104a2c:	39 d0                	cmp    %edx,%eax
c0104a2e:	72 0a                	jb     c0104a3a <keyboard_handler+0x7a>
c0104a30:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104a37:	fb 10 c0 
c0104a3a:	e8 23 b9 ff ff       	call   c0100362 <enable_int>
c0104a3f:	eb 01                	jmp    c0104a42 <keyboard_handler+0x82>
c0104a41:	90                   	nop
c0104a42:	c9                   	leave  
c0104a43:	c3                   	ret    

c0104a44 <read_from_keyboard_buf>:
c0104a44:	55                   	push   %ebp
c0104a45:	89 e5                	mov    %esp,%ebp
c0104a47:	83 ec 18             	sub    $0x18,%esp
c0104a4a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0104a4e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104a53:	85 c0                	test   %eax,%eax
c0104a55:	7f 06                	jg     c0104a5d <read_from_keyboard_buf+0x19>
c0104a57:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104a5b:	eb 4b                	jmp    c0104aa8 <read_from_keyboard_buf+0x64>
c0104a5d:	e8 fe b8 ff ff       	call   c0100360 <disable_int>
c0104a62:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104a67:	0f b6 00             	movzbl (%eax),%eax
c0104a6a:	88 45 f7             	mov    %al,-0x9(%ebp)
c0104a6d:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104a72:	83 c0 01             	add    $0x1,%eax
c0104a75:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c0104a7a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104a7f:	83 e8 01             	sub    $0x1,%eax
c0104a82:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104a87:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104a8c:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104a91:	39 d0                	cmp    %edx,%eax
c0104a93:	72 0a                	jb     c0104a9f <read_from_keyboard_buf+0x5b>
c0104a95:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c0104a9c:	fb 10 c0 
c0104a9f:	e8 be b8 ff ff       	call   c0100362 <enable_int>
c0104aa4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104aa8:	c9                   	leave  
c0104aa9:	c3                   	ret    

c0104aaa <keyboard_read>:
c0104aaa:	55                   	push   %ebp
c0104aab:	89 e5                	mov    %esp,%ebp
c0104aad:	83 ec 28             	sub    $0x28,%esp
c0104ab0:	90                   	nop
c0104ab1:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104ab6:	85 c0                	test   %eax,%eax
c0104ab8:	7e f7                	jle    c0104ab1 <keyboard_read+0x7>
c0104aba:	e8 85 ff ff ff       	call   c0104a44 <read_from_keyboard_buf>
c0104abf:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104ac2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104ac9:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0104acd:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104ad1:	75 5a                	jne    c0104b2d <keyboard_read+0x83>
c0104ad3:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104ad7:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0104adb:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0104adf:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104ae3:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104ae7:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0104aeb:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0104aef:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104af6:	eb 20                	jmp    c0104b18 <keyboard_read+0x6e>
c0104af8:	e8 47 ff ff ff       	call   c0104a44 <read_from_keyboard_buf>
c0104afd:	89 c1                	mov    %eax,%ecx
c0104aff:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104b02:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104b05:	01 d0                	add    %edx,%eax
c0104b07:	0f b6 00             	movzbl (%eax),%eax
c0104b0a:	38 c1                	cmp    %al,%cl
c0104b0c:	74 06                	je     c0104b14 <keyboard_read+0x6a>
c0104b0e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0104b12:	eb 0a                	jmp    c0104b1e <keyboard_read+0x74>
c0104b14:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104b18:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0104b1c:	7e da                	jle    c0104af8 <keyboard_read+0x4e>
c0104b1e:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0104b22:	74 68                	je     c0104b8c <keyboard_read+0xe2>
c0104b24:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0104b2b:	eb 5f                	jmp    c0104b8c <keyboard_read+0xe2>
c0104b2d:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104b31:	75 59                	jne    c0104b8c <keyboard_read+0xe2>
c0104b33:	e8 0c ff ff ff       	call   c0104a44 <read_from_keyboard_buf>
c0104b38:	3c 2a                	cmp    $0x2a,%al
c0104b3a:	75 1d                	jne    c0104b59 <keyboard_read+0xaf>
c0104b3c:	e8 03 ff ff ff       	call   c0104a44 <read_from_keyboard_buf>
c0104b41:	3c e0                	cmp    $0xe0,%al
c0104b43:	75 14                	jne    c0104b59 <keyboard_read+0xaf>
c0104b45:	e8 fa fe ff ff       	call   c0104a44 <read_from_keyboard_buf>
c0104b4a:	3c 37                	cmp    $0x37,%al
c0104b4c:	75 0b                	jne    c0104b59 <keyboard_read+0xaf>
c0104b4e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104b55:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104b59:	e8 e6 fe ff ff       	call   c0104a44 <read_from_keyboard_buf>
c0104b5e:	3c b7                	cmp    $0xb7,%al
c0104b60:	75 1d                	jne    c0104b7f <keyboard_read+0xd5>
c0104b62:	e8 dd fe ff ff       	call   c0104a44 <read_from_keyboard_buf>
c0104b67:	3c e0                	cmp    $0xe0,%al
c0104b69:	75 14                	jne    c0104b7f <keyboard_read+0xd5>
c0104b6b:	e8 d4 fe ff ff       	call   c0104a44 <read_from_keyboard_buf>
c0104b70:	3c aa                	cmp    $0xaa,%al
c0104b72:	75 0b                	jne    c0104b7f <keyboard_read+0xd5>
c0104b74:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104b7b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0104b7f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104b83:	75 07                	jne    c0104b8c <keyboard_read+0xe2>
c0104b85:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c0104b8c:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104b93:	0f 84 8d 00 00 00    	je     c0104c26 <keyboard_read+0x17c>
c0104b99:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0104ba0:	0f 84 80 00 00 00    	je     c0104c26 <keyboard_read+0x17c>
c0104ba6:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0104baa:	0f 94 c2             	sete   %dl
c0104bad:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104bb1:	0f 94 c0             	sete   %al
c0104bb4:	09 d0                	or     %edx,%eax
c0104bb6:	84 c0                	test   %al,%al
c0104bb8:	74 07                	je     c0104bc1 <keyboard_read+0x117>
c0104bba:	c6 05 d0 06 11 c0 01 	movb   $0x1,0xc01106d0
c0104bc1:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104bc5:	f7 d0                	not    %eax
c0104bc7:	c0 e8 07             	shr    $0x7,%al
c0104bca:	88 45 e9             	mov    %al,-0x17(%ebp)
c0104bcd:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104bd1:	74 53                	je     c0104c26 <keyboard_read+0x17c>
c0104bd3:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104bd7:	74 4d                	je     c0104c26 <keyboard_read+0x17c>
c0104bd9:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0104bdd:	0f b6 05 d0 06 11 c0 	movzbl 0xc01106d0,%eax
c0104be4:	3c 01                	cmp    $0x1,%al
c0104be6:	75 04                	jne    c0104bec <keyboard_read+0x142>
c0104be8:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104bec:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104bf3:	84 c0                	test   %al,%al
c0104bf5:	74 04                	je     c0104bfb <keyboard_read+0x151>
c0104bf7:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104bfb:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0104bff:	89 d0                	mov    %edx,%eax
c0104c01:	01 c0                	add    %eax,%eax
c0104c03:	01 c2                	add    %eax,%edx
c0104c05:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104c09:	01 d0                	add    %edx,%eax
c0104c0b:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c0104c12:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104c15:	83 ec 08             	sub    $0x8,%esp
c0104c18:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c1b:	ff 75 08             	pushl  0x8(%ebp)
c0104c1e:	e8 1a 00 00 00       	call   c0104c3d <in_process>
c0104c23:	83 c4 10             	add    $0x10,%esp
c0104c26:	90                   	nop
c0104c27:	c9                   	leave  
c0104c28:	c3                   	ret    

c0104c29 <init_keyboard_handler>:
c0104c29:	55                   	push   %ebp
c0104c2a:	89 e5                	mov    %esp,%ebp
c0104c2c:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104c33:	c6 05 d0 06 11 c0 00 	movb   $0x0,0xc01106d0
c0104c3a:	90                   	nop
c0104c3b:	5d                   	pop    %ebp
c0104c3c:	c3                   	ret    

c0104c3d <in_process>:
c0104c3d:	55                   	push   %ebp
c0104c3e:	89 e5                	mov    %esp,%ebp
c0104c40:	83 ec 18             	sub    $0x18,%esp
c0104c43:	83 ec 04             	sub    $0x4,%esp
c0104c46:	6a 02                	push   $0x2
c0104c48:	6a 00                	push   $0x0
c0104c4a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0104c4d:	50                   	push   %eax
c0104c4e:	e8 1c 76 00 00       	call   c010c26f <Memset>
c0104c53:	83 c4 10             	add    $0x10,%esp
c0104c56:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104c59:	25 00 01 00 00       	and    $0x100,%eax
c0104c5e:	85 c0                	test   %eax,%eax
c0104c60:	75 28                	jne    c0104c8a <in_process+0x4d>
c0104c62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104c65:	0f b6 c0             	movzbl %al,%eax
c0104c68:	83 ec 08             	sub    $0x8,%esp
c0104c6b:	50                   	push   %eax
c0104c6c:	ff 75 08             	pushl  0x8(%ebp)
c0104c6f:	e8 b3 f3 ff ff       	call   c0104027 <put_key>
c0104c74:	83 c4 10             	add    $0x10,%esp
c0104c77:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104c7e:	c6 05 d0 06 11 c0 00 	movb   $0x0,0xc01106d0
c0104c85:	e9 42 01 00 00       	jmp    c0104dcc <in_process+0x18f>
c0104c8a:	0f b6 05 d0 06 11 c0 	movzbl 0xc01106d0,%eax
c0104c91:	84 c0                	test   %al,%al
c0104c93:	0f 84 a9 00 00 00    	je     c0104d42 <in_process+0x105>
c0104c99:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104c9d:	0f 84 9f 00 00 00    	je     c0104d42 <in_process+0x105>
c0104ca3:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104ca7:	0f 84 95 00 00 00    	je     c0104d42 <in_process+0x105>
c0104cad:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104cb4:	74 64                	je     c0104d1a <in_process+0xdd>
c0104cb6:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104cbd:	77 0b                	ja     c0104cca <in_process+0x8d>
c0104cbf:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104cc6:	74 64                	je     c0104d2c <in_process+0xef>
c0104cc8:	eb 73                	jmp    c0104d3d <in_process+0x100>
c0104cca:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104cd1:	74 0b                	je     c0104cde <in_process+0xa1>
c0104cd3:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104cda:	74 20                	je     c0104cfc <in_process+0xbf>
c0104cdc:	eb 5f                	jmp    c0104d3d <in_process+0x100>
c0104cde:	83 ec 0c             	sub    $0xc,%esp
c0104ce1:	ff 75 08             	pushl  0x8(%ebp)
c0104ce4:	e8 aa f3 ff ff       	call   c0104093 <scroll_up>
c0104ce9:	83 c4 10             	add    $0x10,%esp
c0104cec:	c6 05 d0 06 11 c0 00 	movb   $0x0,0xc01106d0
c0104cf3:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104cfa:	eb 41                	jmp    c0104d3d <in_process+0x100>
c0104cfc:	83 ec 0c             	sub    $0xc,%esp
c0104cff:	ff 75 08             	pushl  0x8(%ebp)
c0104d02:	e8 ce f3 ff ff       	call   c01040d5 <scroll_down>
c0104d07:	83 c4 10             	add    $0x10,%esp
c0104d0a:	c6 05 d0 06 11 c0 00 	movb   $0x0,0xc01106d0
c0104d11:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104d18:	eb 23                	jmp    c0104d3d <in_process+0x100>
c0104d1a:	83 ec 08             	sub    $0x8,%esp
c0104d1d:	6a 0a                	push   $0xa
c0104d1f:	ff 75 08             	pushl  0x8(%ebp)
c0104d22:	e8 19 f4 ff ff       	call   c0104140 <out_char>
c0104d27:	83 c4 10             	add    $0x10,%esp
c0104d2a:	eb 11                	jmp    c0104d3d <in_process+0x100>
c0104d2c:	83 ec 08             	sub    $0x8,%esp
c0104d2f:	6a 08                	push   $0x8
c0104d31:	ff 75 08             	pushl  0x8(%ebp)
c0104d34:	e8 07 f4 ff ff       	call   c0104140 <out_char>
c0104d39:	83 c4 10             	add    $0x10,%esp
c0104d3c:	90                   	nop
c0104d3d:	e9 8a 00 00 00       	jmp    c0104dcc <in_process+0x18f>
c0104d42:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104d49:	74 55                	je     c0104da0 <in_process+0x163>
c0104d4b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104d52:	77 14                	ja     c0104d68 <in_process+0x12b>
c0104d54:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104d5b:	74 31                	je     c0104d8e <in_process+0x151>
c0104d5d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104d64:	74 16                	je     c0104d7c <in_process+0x13f>
c0104d66:	eb 64                	jmp    c0104dcc <in_process+0x18f>
c0104d68:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104d6f:	74 3e                	je     c0104daf <in_process+0x172>
c0104d71:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104d78:	74 44                	je     c0104dbe <in_process+0x181>
c0104d7a:	eb 50                	jmp    c0104dcc <in_process+0x18f>
c0104d7c:	83 ec 08             	sub    $0x8,%esp
c0104d7f:	6a 0a                	push   $0xa
c0104d81:	ff 75 08             	pushl  0x8(%ebp)
c0104d84:	e8 9e f2 ff ff       	call   c0104027 <put_key>
c0104d89:	83 c4 10             	add    $0x10,%esp
c0104d8c:	eb 3e                	jmp    c0104dcc <in_process+0x18f>
c0104d8e:	83 ec 08             	sub    $0x8,%esp
c0104d91:	6a 08                	push   $0x8
c0104d93:	ff 75 08             	pushl  0x8(%ebp)
c0104d96:	e8 8c f2 ff ff       	call   c0104027 <put_key>
c0104d9b:	83 c4 10             	add    $0x10,%esp
c0104d9e:	eb 2c                	jmp    c0104dcc <in_process+0x18f>
c0104da0:	83 ec 0c             	sub    $0xc,%esp
c0104da3:	6a 00                	push   $0x0
c0104da5:	e8 4c f1 ff ff       	call   c0103ef6 <select_console>
c0104daa:	83 c4 10             	add    $0x10,%esp
c0104dad:	eb 1d                	jmp    c0104dcc <in_process+0x18f>
c0104daf:	83 ec 0c             	sub    $0xc,%esp
c0104db2:	6a 01                	push   $0x1
c0104db4:	e8 3d f1 ff ff       	call   c0103ef6 <select_console>
c0104db9:	83 c4 10             	add    $0x10,%esp
c0104dbc:	eb 0e                	jmp    c0104dcc <in_process+0x18f>
c0104dbe:	83 ec 0c             	sub    $0xc,%esp
c0104dc1:	6a 02                	push   $0x2
c0104dc3:	e8 2e f1 ff ff       	call   c0103ef6 <select_console>
c0104dc8:	83 c4 10             	add    $0x10,%esp
c0104dcb:	90                   	nop
c0104dcc:	90                   	nop
c0104dcd:	c9                   	leave  
c0104dce:	c3                   	ret    

c0104dcf <open>:
c0104dcf:	55                   	push   %ebp
c0104dd0:	89 e5                	mov    %esp,%ebp
c0104dd2:	83 ec 18             	sub    $0x18,%esp
c0104dd5:	83 ec 0c             	sub    $0xc,%esp
c0104dd8:	6a 7c                	push   $0x7c
c0104dda:	e8 cd ca ff ff       	call   c01018ac <sys_malloc>
c0104ddf:	83 c4 10             	add    $0x10,%esp
c0104de2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104de5:	83 ec 04             	sub    $0x4,%esp
c0104de8:	6a 7c                	push   $0x7c
c0104dea:	6a 00                	push   $0x0
c0104dec:	ff 75 f4             	pushl  -0xc(%ebp)
c0104def:	e8 7b 74 00 00       	call   c010c26f <Memset>
c0104df4:	83 c4 10             	add    $0x10,%esp
c0104df7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104dfa:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104e01:	83 ec 0c             	sub    $0xc,%esp
c0104e04:	ff 75 08             	pushl  0x8(%ebp)
c0104e07:	e8 32 14 00 00       	call   c010623e <get_physical_address>
c0104e0c:	83 c4 10             	add    $0x10,%esp
c0104e0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104e12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e15:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104e18:	89 50 44             	mov    %edx,0x44(%eax)
c0104e1b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104e1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e21:	89 50 74             	mov    %edx,0x74(%eax)
c0104e24:	83 ec 0c             	sub    $0xc,%esp
c0104e27:	ff 75 08             	pushl  0x8(%ebp)
c0104e2a:	e8 79 74 00 00       	call   c010c2a8 <Strlen>
c0104e2f:	83 c4 10             	add    $0x10,%esp
c0104e32:	89 c2                	mov    %eax,%edx
c0104e34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e37:	89 50 40             	mov    %edx,0x40(%eax)
c0104e3a:	83 ec 04             	sub    $0x4,%esp
c0104e3d:	6a 02                	push   $0x2
c0104e3f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e42:	6a 03                	push   $0x3
c0104e44:	e8 9c 49 00 00       	call   c01097e5 <send_rec>
c0104e49:	83 c4 10             	add    $0x10,%esp
c0104e4c:	83 ec 08             	sub    $0x8,%esp
c0104e4f:	6a 7c                	push   $0x7c
c0104e51:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e54:	e8 68 ca ff ff       	call   c01018c1 <sys_free>
c0104e59:	83 c4 10             	add    $0x10,%esp
c0104e5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e5f:	8b 40 50             	mov    0x50(%eax),%eax
c0104e62:	c9                   	leave  
c0104e63:	c3                   	ret    

c0104e64 <read>:
c0104e64:	55                   	push   %ebp
c0104e65:	89 e5                	mov    %esp,%ebp
c0104e67:	83 ec 38             	sub    $0x38,%esp
c0104e6a:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104e71:	83 ec 0c             	sub    $0xc,%esp
c0104e74:	ff 75 dc             	pushl  -0x24(%ebp)
c0104e77:	e8 30 ca ff ff       	call   c01018ac <sys_malloc>
c0104e7c:	83 c4 10             	add    $0x10,%esp
c0104e7f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104e82:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104e85:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104e8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104e8d:	83 ec 0c             	sub    $0xc,%esp
c0104e90:	ff 75 0c             	pushl  0xc(%ebp)
c0104e93:	e8 a6 13 00 00       	call   c010623e <get_physical_address>
c0104e98:	83 c4 10             	add    $0x10,%esp
c0104e9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104e9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ea1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104ea6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104ea9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104eac:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104eb1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104eb4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104ebb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104ec2:	8b 55 10             	mov    0x10(%ebp),%edx
c0104ec5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ec8:	01 d0                	add    %edx,%eax
c0104eca:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104ecd:	0f 83 a8 00 00 00    	jae    c0104f7b <read+0x117>
c0104ed3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104ed6:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104ed9:	05 00 10 00 00       	add    $0x1000,%eax
c0104ede:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104ee1:	8b 45 10             	mov    0x10(%ebp),%eax
c0104ee4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104ee7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104eea:	83 ec 04             	sub    $0x4,%esp
c0104eed:	50                   	push   %eax
c0104eee:	6a 00                	push   $0x0
c0104ef0:	ff 75 d8             	pushl  -0x28(%ebp)
c0104ef3:	e8 77 73 00 00       	call   c010c26f <Memset>
c0104ef8:	83 c4 10             	add    $0x10,%esp
c0104efb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104efe:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104f05:	8b 55 08             	mov    0x8(%ebp),%edx
c0104f08:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f0b:	89 50 50             	mov    %edx,0x50(%eax)
c0104f0e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f11:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f14:	89 50 10             	mov    %edx,0x10(%eax)
c0104f17:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f1a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104f1d:	89 50 60             	mov    %edx,0x60(%eax)
c0104f20:	83 ec 04             	sub    $0x4,%esp
c0104f23:	6a 02                	push   $0x2
c0104f25:	ff 75 d8             	pushl  -0x28(%ebp)
c0104f28:	6a 03                	push   $0x3
c0104f2a:	e8 b6 48 00 00       	call   c01097e5 <send_rec>
c0104f2f:	83 c4 10             	add    $0x10,%esp
c0104f32:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f35:	8b 40 60             	mov    0x60(%eax),%eax
c0104f38:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104f3b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104f3e:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104f41:	8b 45 10             	mov    0x10(%ebp),%eax
c0104f44:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104f47:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104f4a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104f4d:	89 45 10             	mov    %eax,0x10(%ebp)
c0104f50:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104f57:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104f5e:	83 ec 0c             	sub    $0xc,%esp
c0104f61:	ff 75 f4             	pushl  -0xc(%ebp)
c0104f64:	e8 d5 12 00 00       	call   c010623e <get_physical_address>
c0104f69:	83 c4 10             	add    $0x10,%esp
c0104f6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f6f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104f73:	0f 85 6e ff ff ff    	jne    c0104ee7 <read+0x83>
c0104f79:	eb 54                	jmp    c0104fcf <read+0x16b>
c0104f7b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f7e:	83 ec 04             	sub    $0x4,%esp
c0104f81:	50                   	push   %eax
c0104f82:	6a 00                	push   $0x0
c0104f84:	ff 75 d8             	pushl  -0x28(%ebp)
c0104f87:	e8 e3 72 00 00       	call   c010c26f <Memset>
c0104f8c:	83 c4 10             	add    $0x10,%esp
c0104f8f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f92:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104f99:	8b 55 08             	mov    0x8(%ebp),%edx
c0104f9c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f9f:	89 50 50             	mov    %edx,0x50(%eax)
c0104fa2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fa5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104fa8:	89 50 10             	mov    %edx,0x10(%eax)
c0104fab:	8b 55 10             	mov    0x10(%ebp),%edx
c0104fae:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fb1:	89 50 60             	mov    %edx,0x60(%eax)
c0104fb4:	83 ec 04             	sub    $0x4,%esp
c0104fb7:	6a 02                	push   $0x2
c0104fb9:	ff 75 d8             	pushl  -0x28(%ebp)
c0104fbc:	6a 03                	push   $0x3
c0104fbe:	e8 22 48 00 00       	call   c01097e5 <send_rec>
c0104fc3:	83 c4 10             	add    $0x10,%esp
c0104fc6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fc9:	8b 40 60             	mov    0x60(%eax),%eax
c0104fcc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104fcf:	83 ec 08             	sub    $0x8,%esp
c0104fd2:	ff 75 dc             	pushl  -0x24(%ebp)
c0104fd5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104fd8:	e8 e4 c8 ff ff       	call   c01018c1 <sys_free>
c0104fdd:	83 c4 10             	add    $0x10,%esp
c0104fe0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104fe3:	c9                   	leave  
c0104fe4:	c3                   	ret    

c0104fe5 <write>:
c0104fe5:	55                   	push   %ebp
c0104fe6:	89 e5                	mov    %esp,%ebp
c0104fe8:	83 ec 18             	sub    $0x18,%esp
c0104feb:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104ff2:	83 ec 0c             	sub    $0xc,%esp
c0104ff5:	ff 75 f4             	pushl  -0xc(%ebp)
c0104ff8:	e8 af c8 ff ff       	call   c01018ac <sys_malloc>
c0104ffd:	83 c4 10             	add    $0x10,%esp
c0105000:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105003:	83 ec 0c             	sub    $0xc,%esp
c0105006:	ff 75 0c             	pushl  0xc(%ebp)
c0105009:	e8 30 12 00 00       	call   c010623e <get_physical_address>
c010500e:	83 c4 10             	add    $0x10,%esp
c0105011:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105014:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105017:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c010501e:	8b 55 08             	mov    0x8(%ebp),%edx
c0105021:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105024:	89 50 50             	mov    %edx,0x50(%eax)
c0105027:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010502a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010502d:	89 50 10             	mov    %edx,0x10(%eax)
c0105030:	8b 55 10             	mov    0x10(%ebp),%edx
c0105033:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105036:	89 50 60             	mov    %edx,0x60(%eax)
c0105039:	83 ec 04             	sub    $0x4,%esp
c010503c:	6a 02                	push   $0x2
c010503e:	ff 75 f0             	pushl  -0x10(%ebp)
c0105041:	6a 03                	push   $0x3
c0105043:	e8 9d 47 00 00       	call   c01097e5 <send_rec>
c0105048:	83 c4 10             	add    $0x10,%esp
c010504b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010504e:	8b 40 60             	mov    0x60(%eax),%eax
c0105051:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105054:	83 ec 08             	sub    $0x8,%esp
c0105057:	ff 75 f4             	pushl  -0xc(%ebp)
c010505a:	ff 75 f0             	pushl  -0x10(%ebp)
c010505d:	e8 5f c8 ff ff       	call   c01018c1 <sys_free>
c0105062:	83 c4 10             	add    $0x10,%esp
c0105065:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105068:	c9                   	leave  
c0105069:	c3                   	ret    

c010506a <close>:
c010506a:	55                   	push   %ebp
c010506b:	89 e5                	mov    %esp,%ebp
c010506d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105073:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010507a:	8b 45 08             	mov    0x8(%ebp),%eax
c010507d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105080:	83 ec 04             	sub    $0x4,%esp
c0105083:	6a 02                	push   $0x2
c0105085:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c010508b:	50                   	push   %eax
c010508c:	6a 03                	push   $0x3
c010508e:	e8 52 47 00 00       	call   c01097e5 <send_rec>
c0105093:	83 c4 10             	add    $0x10,%esp
c0105096:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105099:	83 f8 65             	cmp    $0x65,%eax
c010509c:	74 19                	je     c01050b7 <close+0x4d>
c010509e:	6a 13                	push   $0x13
c01050a0:	68 c3 b5 10 c0       	push   $0xc010b5c3
c01050a5:	68 c3 b5 10 c0       	push   $0xc010b5c3
c01050aa:	68 cf b5 10 c0       	push   $0xc010b5cf
c01050af:	e8 c1 3a 00 00       	call   c0108b75 <assertion_failure>
c01050b4:	83 c4 10             	add    $0x10,%esp
c01050b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01050ba:	c9                   	leave  
c01050bb:	c3                   	ret    

c01050bc <wait>:
c01050bc:	55                   	push   %ebp
c01050bd:	89 e5                	mov    %esp,%ebp
c01050bf:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01050c5:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c01050cc:	83 ec 04             	sub    $0x4,%esp
c01050cf:	6a 01                	push   $0x1
c01050d1:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01050d7:	50                   	push   %eax
c01050d8:	6a 03                	push   $0x3
c01050da:	e8 06 47 00 00       	call   c01097e5 <send_rec>
c01050df:	83 c4 10             	add    $0x10,%esp
c01050e2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01050e5:	89 c2                	mov    %eax,%edx
c01050e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01050ea:	89 10                	mov    %edx,(%eax)
c01050ec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01050ef:	83 f8 21             	cmp    $0x21,%eax
c01050f2:	74 05                	je     c01050f9 <wait+0x3d>
c01050f4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01050f7:	eb 05                	jmp    c01050fe <wait+0x42>
c01050f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01050fe:	c9                   	leave  
c01050ff:	c3                   	ret    

c0105100 <exit>:
c0105100:	55                   	push   %ebp
c0105101:	89 e5                	mov    %esp,%ebp
c0105103:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105109:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0105110:	8b 45 08             	mov    0x8(%ebp),%eax
c0105113:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105116:	83 ec 04             	sub    $0x4,%esp
c0105119:	6a 01                	push   $0x1
c010511b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105121:	50                   	push   %eax
c0105122:	6a 03                	push   $0x3
c0105124:	e8 bc 46 00 00       	call   c01097e5 <send_rec>
c0105129:	83 c4 10             	add    $0x10,%esp
c010512c:	90                   	nop
c010512d:	c9                   	leave  
c010512e:	c3                   	ret    

c010512f <fork>:
c010512f:	55                   	push   %ebp
c0105130:	89 e5                	mov    %esp,%ebp
c0105132:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105138:	83 ec 04             	sub    $0x4,%esp
c010513b:	6a 7c                	push   $0x7c
c010513d:	6a 00                	push   $0x0
c010513f:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105145:	50                   	push   %eax
c0105146:	e8 24 71 00 00       	call   c010c26f <Memset>
c010514b:	83 c4 10             	add    $0x10,%esp
c010514e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0105155:	83 ec 04             	sub    $0x4,%esp
c0105158:	6a 01                	push   $0x1
c010515a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105160:	50                   	push   %eax
c0105161:	6a 03                	push   $0x3
c0105163:	e8 7d 46 00 00       	call   c01097e5 <send_rec>
c0105168:	83 c4 10             	add    $0x10,%esp
c010516b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0105172:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105175:	c9                   	leave  
c0105176:	c3                   	ret    

c0105177 <getpid>:
c0105177:	55                   	push   %ebp
c0105178:	89 e5                	mov    %esp,%ebp
c010517a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105180:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0105187:	83 ec 04             	sub    $0x4,%esp
c010518a:	6a 05                	push   $0x5
c010518c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105192:	50                   	push   %eax
c0105193:	6a 03                	push   $0x3
c0105195:	e8 4b 46 00 00       	call   c01097e5 <send_rec>
c010519a:	83 c4 10             	add    $0x10,%esp
c010519d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01051a0:	c9                   	leave  
c01051a1:	c3                   	ret    

c01051a2 <exec>:
c01051a2:	55                   	push   %ebp
c01051a3:	89 e5                	mov    %esp,%ebp
c01051a5:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01051ab:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c01051b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01051b5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01051b8:	83 ec 0c             	sub    $0xc,%esp
c01051bb:	ff 75 08             	pushl  0x8(%ebp)
c01051be:	e8 e5 70 00 00       	call   c010c2a8 <Strlen>
c01051c3:	83 c4 10             	add    $0x10,%esp
c01051c6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01051c9:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c01051d0:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c01051d7:	83 ec 04             	sub    $0x4,%esp
c01051da:	6a 01                	push   $0x1
c01051dc:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01051e2:	50                   	push   %eax
c01051e3:	6a 03                	push   $0x3
c01051e5:	e8 fb 45 00 00       	call   c01097e5 <send_rec>
c01051ea:	83 c4 10             	add    $0x10,%esp
c01051ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01051f0:	83 f8 65             	cmp    $0x65,%eax
c01051f3:	74 19                	je     c010520e <exec+0x6c>
c01051f5:	6a 19                	push   $0x19
c01051f7:	68 e7 b5 10 c0       	push   $0xc010b5e7
c01051fc:	68 e7 b5 10 c0       	push   $0xc010b5e7
c0105201:	68 f2 b5 10 c0       	push   $0xc010b5f2
c0105206:	e8 6a 39 00 00       	call   c0108b75 <assertion_failure>
c010520b:	83 c4 10             	add    $0x10,%esp
c010520e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105211:	c9                   	leave  
c0105212:	c3                   	ret    

c0105213 <execv>:
c0105213:	55                   	push   %ebp
c0105214:	89 e5                	mov    %esp,%ebp
c0105216:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c010521c:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0105223:	83 ec 0c             	sub    $0xc,%esp
c0105226:	ff 75 e0             	pushl  -0x20(%ebp)
c0105229:	e8 7e c6 ff ff       	call   c01018ac <sys_malloc>
c010522e:	83 c4 10             	add    $0x10,%esp
c0105231:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105234:	66 87 db             	xchg   %bx,%bx
c0105237:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010523a:	83 ec 04             	sub    $0x4,%esp
c010523d:	50                   	push   %eax
c010523e:	6a 00                	push   $0x0
c0105240:	ff 75 dc             	pushl  -0x24(%ebp)
c0105243:	e8 27 70 00 00       	call   c010c26f <Memset>
c0105248:	83 c4 10             	add    $0x10,%esp
c010524b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010524e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105251:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105258:	eb 23                	jmp    c010527d <execv+0x6a>
c010525a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010525d:	8b 00                	mov    (%eax),%eax
c010525f:	83 ec 08             	sub    $0x8,%esp
c0105262:	50                   	push   %eax
c0105263:	68 0a b6 10 c0       	push   $0xc010b60a
c0105268:	e8 ab 35 00 00       	call   c0108818 <Printf>
c010526d:	83 c4 10             	add    $0x10,%esp
c0105270:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0105274:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105277:	83 c0 04             	add    $0x4,%eax
c010527a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010527d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105280:	8b 00                	mov    (%eax),%eax
c0105282:	85 c0                	test   %eax,%eax
c0105284:	75 d4                	jne    c010525a <execv+0x47>
c0105286:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105289:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010528c:	01 d0                	add    %edx,%eax
c010528e:	c6 00 00             	movb   $0x0,(%eax)
c0105291:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105294:	83 c0 04             	add    $0x4,%eax
c0105297:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010529a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010529d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01052a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01052a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01052a6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01052ad:	eb 5b                	jmp    c010530a <execv+0xf7>
c01052af:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01052b2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01052b5:	01 c2                	add    %eax,%edx
c01052b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01052ba:	89 10                	mov    %edx,(%eax)
c01052bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01052bf:	8b 00                	mov    (%eax),%eax
c01052c1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c01052c4:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01052c7:	01 ca                	add    %ecx,%edx
c01052c9:	83 ec 08             	sub    $0x8,%esp
c01052cc:	50                   	push   %eax
c01052cd:	52                   	push   %edx
c01052ce:	e8 bb 6f 00 00       	call   c010c28e <Strcpy>
c01052d3:	83 c4 10             	add    $0x10,%esp
c01052d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01052d9:	8b 00                	mov    (%eax),%eax
c01052db:	83 ec 0c             	sub    $0xc,%esp
c01052de:	50                   	push   %eax
c01052df:	e8 c4 6f 00 00       	call   c010c2a8 <Strlen>
c01052e4:	83 c4 10             	add    $0x10,%esp
c01052e7:	01 45 f0             	add    %eax,-0x10(%ebp)
c01052ea:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01052ed:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01052f0:	01 d0                	add    %edx,%eax
c01052f2:	c6 00 00             	movb   $0x0,(%eax)
c01052f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01052f8:	83 c0 01             	add    $0x1,%eax
c01052fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01052fe:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0105302:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0105306:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010530a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010530d:	8b 00                	mov    (%eax),%eax
c010530f:	85 c0                	test   %eax,%eax
c0105311:	75 9c                	jne    c01052af <execv+0x9c>
c0105313:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105316:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c010531b:	29 c2                	sub    %eax,%edx
c010531d:	89 d0                	mov    %edx,%eax
c010531f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105322:	83 ec 0c             	sub    $0xc,%esp
c0105325:	ff 75 08             	pushl  0x8(%ebp)
c0105328:	e8 11 0f 00 00       	call   c010623e <get_physical_address>
c010532d:	83 c4 10             	add    $0x10,%esp
c0105330:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105333:	83 ec 0c             	sub    $0xc,%esp
c0105336:	ff 75 dc             	pushl  -0x24(%ebp)
c0105339:	e8 00 0f 00 00       	call   c010623e <get_physical_address>
c010533e:	83 c4 10             	add    $0x10,%esp
c0105341:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105344:	83 ec 0c             	sub    $0xc,%esp
c0105347:	ff 75 d8             	pushl  -0x28(%ebp)
c010534a:	e8 ef 0e 00 00       	call   c010623e <get_physical_address>
c010534f:	83 c4 10             	add    $0x10,%esp
c0105352:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105355:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c010535c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010535f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105362:	83 ec 0c             	sub    $0xc,%esp
c0105365:	ff 75 08             	pushl  0x8(%ebp)
c0105368:	e8 3b 6f 00 00       	call   c010c2a8 <Strlen>
c010536d:	83 c4 10             	add    $0x10,%esp
c0105370:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105373:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105376:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010537c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010537f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105385:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105388:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010538e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105391:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105397:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010539a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01053a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01053a3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01053a6:	29 c2                	sub    %eax,%edx
c01053a8:	89 d0                	mov    %edx,%eax
c01053aa:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01053b0:	83 ec 04             	sub    $0x4,%esp
c01053b3:	6a 01                	push   $0x1
c01053b5:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c01053bb:	50                   	push   %eax
c01053bc:	6a 03                	push   $0x3
c01053be:	e8 22 44 00 00       	call   c01097e5 <send_rec>
c01053c3:	83 c4 10             	add    $0x10,%esp
c01053c6:	83 ec 08             	sub    $0x8,%esp
c01053c9:	68 00 04 00 00       	push   $0x400
c01053ce:	ff 75 dc             	pushl  -0x24(%ebp)
c01053d1:	e8 eb c4 ff ff       	call   c01018c1 <sys_free>
c01053d6:	83 c4 10             	add    $0x10,%esp
c01053d9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01053dc:	83 f8 65             	cmp    $0x65,%eax
c01053df:	74 1c                	je     c01053fd <execv+0x1ea>
c01053e1:	68 95 00 00 00       	push   $0x95
c01053e6:	68 e7 b5 10 c0       	push   $0xc010b5e7
c01053eb:	68 e7 b5 10 c0       	push   $0xc010b5e7
c01053f0:	68 f2 b5 10 c0       	push   $0xc010b5f2
c01053f5:	e8 7b 37 00 00       	call   c0108b75 <assertion_failure>
c01053fa:	83 c4 10             	add    $0x10,%esp
c01053fd:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0105400:	c9                   	leave  
c0105401:	c3                   	ret    

c0105402 <execl>:
c0105402:	55                   	push   %ebp
c0105403:	89 e5                	mov    %esp,%ebp
c0105405:	83 ec 18             	sub    $0x18,%esp
c0105408:	8d 45 0c             	lea    0xc(%ebp),%eax
c010540b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010540e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105411:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105414:	83 ec 08             	sub    $0x8,%esp
c0105417:	ff 75 f0             	pushl  -0x10(%ebp)
c010541a:	ff 75 08             	pushl  0x8(%ebp)
c010541d:	e8 f1 fd ff ff       	call   c0105213 <execv>
c0105422:	83 c4 10             	add    $0x10,%esp
c0105425:	c9                   	leave  
c0105426:	c3                   	ret    

c0105427 <TaskMM>:
c0105427:	55                   	push   %ebp
c0105428:	89 e5                	mov    %esp,%ebp
c010542a:	83 ec 28             	sub    $0x28,%esp
c010542d:	83 ec 0c             	sub    $0xc,%esp
c0105430:	6a 7c                	push   $0x7c
c0105432:	e8 75 c4 ff ff       	call   c01018ac <sys_malloc>
c0105437:	83 c4 10             	add    $0x10,%esp
c010543a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010543d:	83 ec 0c             	sub    $0xc,%esp
c0105440:	6a 7c                	push   $0x7c
c0105442:	e8 65 c4 ff ff       	call   c01018ac <sys_malloc>
c0105447:	83 c4 10             	add    $0x10,%esp
c010544a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010544d:	83 ec 04             	sub    $0x4,%esp
c0105450:	6a 12                	push   $0x12
c0105452:	ff 75 f0             	pushl  -0x10(%ebp)
c0105455:	6a 02                	push   $0x2
c0105457:	e8 89 43 00 00       	call   c01097e5 <send_rec>
c010545c:	83 c4 10             	add    $0x10,%esp
c010545f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105462:	8b 40 78             	mov    0x78(%eax),%eax
c0105465:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105468:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010546b:	8b 00                	mov    (%eax),%eax
c010546d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105470:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105477:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010547a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0105481:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105484:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c010548b:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c010548f:	74 4e                	je     c01054df <TaskMM+0xb8>
c0105491:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105495:	7f 08                	jg     c010549f <TaskMM+0x78>
c0105497:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c010549b:	74 28                	je     c01054c5 <TaskMM+0x9e>
c010549d:	eb 71                	jmp    c0105510 <TaskMM+0xe9>
c010549f:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c01054a3:	74 08                	je     c01054ad <TaskMM+0x86>
c01054a5:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01054a9:	74 4e                	je     c01054f9 <TaskMM+0xd2>
c01054ab:	eb 63                	jmp    c0105510 <TaskMM+0xe9>
c01054ad:	83 ec 0c             	sub    $0xc,%esp
c01054b0:	ff 75 f0             	pushl  -0x10(%ebp)
c01054b3:	e8 d0 04 00 00       	call   c0105988 <do_fork>
c01054b8:	83 c4 10             	add    $0x10,%esp
c01054bb:	89 c2                	mov    %eax,%edx
c01054bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01054c0:	89 50 5c             	mov    %edx,0x5c(%eax)
c01054c3:	eb 5c                	jmp    c0105521 <TaskMM+0xfa>
c01054c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01054cc:	66 87 db             	xchg   %bx,%bx
c01054cf:	83 ec 0c             	sub    $0xc,%esp
c01054d2:	ff 75 f0             	pushl  -0x10(%ebp)
c01054d5:	e8 95 00 00 00       	call   c010556f <do_exec>
c01054da:	83 c4 10             	add    $0x10,%esp
c01054dd:	eb 42                	jmp    c0105521 <TaskMM+0xfa>
c01054df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01054e6:	83 ec 08             	sub    $0x8,%esp
c01054e9:	ff 75 e0             	pushl  -0x20(%ebp)
c01054ec:	ff 75 f0             	pushl  -0x10(%ebp)
c01054ef:	e8 02 05 00 00       	call   c01059f6 <do_exit>
c01054f4:	83 c4 10             	add    $0x10,%esp
c01054f7:	eb 28                	jmp    c0105521 <TaskMM+0xfa>
c01054f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105500:	83 ec 0c             	sub    $0xc,%esp
c0105503:	ff 75 f0             	pushl  -0x10(%ebp)
c0105506:	e8 75 05 00 00       	call   c0105a80 <do_wait>
c010550b:	83 c4 10             	add    $0x10,%esp
c010550e:	eb 11                	jmp    c0105521 <TaskMM+0xfa>
c0105510:	83 ec 0c             	sub    $0xc,%esp
c0105513:	68 14 b6 10 c0       	push   $0xc010b614
c0105518:	e8 3a 36 00 00       	call   c0108b57 <panic>
c010551d:	83 c4 10             	add    $0x10,%esp
c0105520:	90                   	nop
c0105521:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105525:	0f 84 22 ff ff ff    	je     c010544d <TaskMM+0x26>
c010552b:	83 ec 0c             	sub    $0xc,%esp
c010552e:	6a 03                	push   $0x3
c0105530:	e8 af 31 00 00       	call   c01086e4 <delay>
c0105535:	83 c4 10             	add    $0x10,%esp
c0105538:	83 ec 04             	sub    $0x4,%esp
c010553b:	ff 75 e4             	pushl  -0x1c(%ebp)
c010553e:	ff 75 ec             	pushl  -0x14(%ebp)
c0105541:	6a 01                	push   $0x1
c0105543:	e8 9d 42 00 00       	call   c01097e5 <send_rec>
c0105548:	83 c4 10             	add    $0x10,%esp
c010554b:	e9 fd fe ff ff       	jmp    c010544d <TaskMM+0x26>

c0105550 <alloc_mem>:
c0105550:	55                   	push   %ebp
c0105551:	89 e5                	mov    %esp,%ebp
c0105553:	83 ec 10             	sub    $0x10,%esp
c0105556:	8b 45 08             	mov    0x8(%ebp),%eax
c0105559:	83 e8 08             	sub    $0x8,%eax
c010555c:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0105562:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105567:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010556a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010556d:	c9                   	leave  
c010556e:	c3                   	ret    

c010556f <do_exec>:
c010556f:	55                   	push   %ebp
c0105570:	89 e5                	mov    %esp,%ebp
c0105572:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105578:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010557f:	65 76 5f 
c0105582:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c0105589:	74 79 31 
c010558c:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105593:	00 00 
c0105595:	83 ec 08             	sub    $0x8,%esp
c0105598:	6a 00                	push   $0x0
c010559a:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c01055a0:	50                   	push   %eax
c01055a1:	e8 29 f8 ff ff       	call   c0104dcf <open>
c01055a6:	83 c4 10             	add    $0x10,%esp
c01055a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01055ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01055af:	8b 00                	mov    (%eax),%eax
c01055b1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01055b4:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c01055bb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01055be:	83 ec 0c             	sub    $0xc,%esp
c01055c1:	50                   	push   %eax
c01055c2:	e8 e5 c2 ff ff       	call   c01018ac <sys_malloc>
c01055c7:	83 c4 10             	add    $0x10,%esp
c01055ca:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01055cd:	83 ec 04             	sub    $0x4,%esp
c01055d0:	ff 75 d0             	pushl  -0x30(%ebp)
c01055d3:	6a 00                	push   $0x0
c01055d5:	ff 75 cc             	pushl  -0x34(%ebp)
c01055d8:	e8 92 6c 00 00       	call   c010c26f <Memset>
c01055dd:	83 c4 10             	add    $0x10,%esp
c01055e0:	83 ec 04             	sub    $0x4,%esp
c01055e3:	6a 0c                	push   $0xc
c01055e5:	6a 00                	push   $0x0
c01055e7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01055ed:	50                   	push   %eax
c01055ee:	e8 7c 6c 00 00       	call   c010c26f <Memset>
c01055f3:	83 c4 10             	add    $0x10,%esp
c01055f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01055f9:	8b 40 44             	mov    0x44(%eax),%eax
c01055fc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01055ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0105602:	8b 40 40             	mov    0x40(%eax),%eax
c0105605:	83 ec 08             	sub    $0x8,%esp
c0105608:	50                   	push   %eax
c0105609:	ff 75 c8             	pushl  -0x38(%ebp)
c010560c:	e8 de 0a 00 00       	call   c01060ef <alloc_virtual_memory>
c0105611:	83 c4 10             	add    $0x10,%esp
c0105614:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105617:	8b 45 08             	mov    0x8(%ebp),%eax
c010561a:	8b 40 40             	mov    0x40(%eax),%eax
c010561d:	89 c2                	mov    %eax,%edx
c010561f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105622:	83 ec 04             	sub    $0x4,%esp
c0105625:	52                   	push   %edx
c0105626:	50                   	push   %eax
c0105627:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010562d:	50                   	push   %eax
c010562e:	e8 29 19 00 00       	call   c0106f5c <Memcpy>
c0105633:	83 c4 10             	add    $0x10,%esp
c0105636:	8b 45 08             	mov    0x8(%ebp),%eax
c0105639:	8b 40 40             	mov    0x40(%eax),%eax
c010563c:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105643:	00 
c0105644:	83 ec 08             	sub    $0x8,%esp
c0105647:	6a 00                	push   $0x0
c0105649:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010564f:	50                   	push   %eax
c0105650:	e8 7a f7 ff ff       	call   c0104dcf <open>
c0105655:	83 c4 10             	add    $0x10,%esp
c0105658:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010565b:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010565f:	75 15                	jne    c0105676 <do_exec+0x107>
c0105661:	83 ec 0c             	sub    $0xc,%esp
c0105664:	68 25 b6 10 c0       	push   $0xc010b625
c0105669:	e8 aa 31 00 00       	call   c0108818 <Printf>
c010566e:	83 c4 10             	add    $0x10,%esp
c0105671:	e9 10 03 00 00       	jmp    c0105986 <do_exec+0x417>
c0105676:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010567d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105680:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105683:	01 d0                	add    %edx,%eax
c0105685:	83 ec 04             	sub    $0x4,%esp
c0105688:	68 00 10 00 00       	push   $0x1000
c010568d:	50                   	push   %eax
c010568e:	ff 75 c0             	pushl  -0x40(%ebp)
c0105691:	e8 ce f7 ff ff       	call   c0104e64 <read>
c0105696:	83 c4 10             	add    $0x10,%esp
c0105699:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010569c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010569f:	01 45 f4             	add    %eax,-0xc(%ebp)
c01056a2:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01056a6:	74 0a                	je     c01056b2 <do_exec+0x143>
c01056a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01056ab:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c01056ae:	7d 05                	jge    c01056b5 <do_exec+0x146>
c01056b0:	eb cb                	jmp    c010567d <do_exec+0x10e>
c01056b2:	90                   	nop
c01056b3:	eb 01                	jmp    c01056b6 <do_exec+0x147>
c01056b5:	90                   	nop
c01056b6:	83 ec 0c             	sub    $0xc,%esp
c01056b9:	ff 75 c0             	pushl  -0x40(%ebp)
c01056bc:	e8 a9 f9 ff ff       	call   c010506a <close>
c01056c1:	83 c4 10             	add    $0x10,%esp
c01056c4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01056c7:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01056ca:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056cd:	8b 40 18             	mov    0x18(%eax),%eax
c01056d0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01056d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01056da:	e9 04 01 00 00       	jmp    c01057e3 <do_exec+0x274>
c01056df:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056e2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c01056e6:	0f b7 d0             	movzwl %ax,%edx
c01056e9:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056ec:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c01056f0:	0f b7 c0             	movzwl %ax,%eax
c01056f3:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c01056f7:	01 c2                	add    %eax,%edx
c01056f9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01056fc:	01 d0                	add    %edx,%eax
c01056fe:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0105701:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105704:	8b 40 10             	mov    0x10(%eax),%eax
c0105707:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010570a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010570d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105712:	c1 e8 0c             	shr    $0xc,%eax
c0105715:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105718:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010571b:	8b 40 08             	mov    0x8(%eax),%eax
c010571e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0105721:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105728:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010572b:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010572e:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0105731:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105734:	8b 50 04             	mov    0x4(%eax),%edx
c0105737:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010573a:	01 d0                	add    %edx,%eax
c010573c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010573f:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105743:	0f 84 95 00 00 00    	je     c01057de <do_exec+0x26f>
c0105749:	83 ec 04             	sub    $0x4,%esp
c010574c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010574f:	ff 75 a8             	pushl  -0x58(%ebp)
c0105752:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105755:	e8 a0 07 00 00       	call   c0105efa <get_virtual_address_start_with_addr>
c010575a:	83 c4 10             	add    $0x10,%esp
c010575d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105760:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105763:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105766:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010576d:	eb 41                	jmp    c01057b0 <do_exec+0x241>
c010576f:	83 ec 08             	sub    $0x8,%esp
c0105772:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105775:	ff 75 e8             	pushl  -0x18(%ebp)
c0105778:	e8 f3 0a 00 00       	call   c0106270 <alloc_physical_memory_of_proc>
c010577d:	83 c4 10             	add    $0x10,%esp
c0105780:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105783:	83 ec 08             	sub    $0x8,%esp
c0105786:	68 00 10 00 00       	push   $0x1000
c010578b:	ff 75 94             	pushl  -0x6c(%ebp)
c010578e:	e8 5c 09 00 00       	call   c01060ef <alloc_virtual_memory>
c0105793:	83 c4 10             	add    $0x10,%esp
c0105796:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105799:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010579d:	75 06                	jne    c01057a5 <do_exec+0x236>
c010579f:	8b 45 90             	mov    -0x70(%ebp),%eax
c01057a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01057a5:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c01057ac:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01057b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01057b3:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c01057b6:	77 b7                	ja     c010576f <do_exec+0x200>
c01057b8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01057bb:	8b 40 10             	mov    0x10(%eax),%eax
c01057be:	89 c1                	mov    %eax,%ecx
c01057c0:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01057c3:	8b 50 04             	mov    0x4(%eax),%edx
c01057c6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01057c9:	01 c2                	add    %eax,%edx
c01057cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01057ce:	83 ec 04             	sub    $0x4,%esp
c01057d1:	51                   	push   %ecx
c01057d2:	52                   	push   %edx
c01057d3:	50                   	push   %eax
c01057d4:	e8 83 17 00 00       	call   c0106f5c <Memcpy>
c01057d9:	83 c4 10             	add    $0x10,%esp
c01057dc:	eb 01                	jmp    c01057df <do_exec+0x270>
c01057de:	90                   	nop
c01057df:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01057e3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01057e6:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01057ea:	0f b7 c0             	movzwl %ax,%eax
c01057ed:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01057f0:	0f 8c e9 fe ff ff    	jl     c01056df <do_exec+0x170>
c01057f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01057f9:	8b 40 10             	mov    0x10(%eax),%eax
c01057fc:	89 45 8c             	mov    %eax,-0x74(%ebp)
c01057ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0105802:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105805:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105808:	8b 45 08             	mov    0x8(%ebp),%eax
c010580b:	8b 40 24             	mov    0x24(%eax),%eax
c010580e:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0105811:	83 ec 0c             	sub    $0xc,%esp
c0105814:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105817:	e8 8a e2 ff ff       	call   c0103aa6 <pid2proc>
c010581c:	83 c4 10             	add    $0x10,%esp
c010581f:	89 45 80             	mov    %eax,-0x80(%ebp)
c0105822:	8b 45 08             	mov    0x8(%ebp),%eax
c0105825:	8b 40 10             	mov    0x10(%eax),%eax
c0105828:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010582e:	83 ec 08             	sub    $0x8,%esp
c0105831:	ff 75 88             	pushl  -0x78(%ebp)
c0105834:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c010583a:	e8 b0 08 00 00       	call   c01060ef <alloc_virtual_memory>
c010583f:	83 c4 10             	add    $0x10,%esp
c0105842:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105848:	8b 45 08             	mov    0x8(%ebp),%eax
c010584b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010584e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105854:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010585b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0105861:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105864:	eb 1a                	jmp    c0105880 <do_exec+0x311>
c0105866:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010586a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010586d:	8b 10                	mov    (%eax),%edx
c010586f:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105875:	01 c2                	add    %eax,%edx
c0105877:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010587a:	89 10                	mov    %edx,(%eax)
c010587c:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0105880:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105883:	8b 00                	mov    (%eax),%eax
c0105885:	85 c0                	test   %eax,%eax
c0105887:	75 dd                	jne    c0105866 <do_exec+0x2f7>
c0105889:	83 ec 0c             	sub    $0xc,%esp
c010588c:	ff 75 84             	pushl  -0x7c(%ebp)
c010588f:	e8 5b 08 00 00       	call   c01060ef <alloc_virtual_memory>
c0105894:	83 c4 10             	add    $0x10,%esp
c0105897:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010589d:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01058a3:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01058a9:	83 ec 04             	sub    $0x4,%esp
c01058ac:	ff 75 88             	pushl  -0x78(%ebp)
c01058af:	52                   	push   %edx
c01058b0:	50                   	push   %eax
c01058b1:	e8 a6 16 00 00       	call   c0106f5c <Memcpy>
c01058b6:	83 c4 10             	add    $0x10,%esp
c01058b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01058bc:	8b 40 28             	mov    0x28(%eax),%eax
c01058bf:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01058c5:	83 ec 08             	sub    $0x8,%esp
c01058c8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01058cb:	ff 75 80             	pushl  -0x80(%ebp)
c01058ce:	e8 ef 08 00 00       	call   c01061c2 <get_physical_address_proc>
c01058d3:	83 c4 10             	add    $0x10,%esp
c01058d6:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c01058dc:	83 ec 08             	sub    $0x8,%esp
c01058df:	68 00 10 00 00       	push   $0x1000
c01058e4:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c01058ea:	e8 00 08 00 00       	call   c01060ef <alloc_virtual_memory>
c01058ef:	83 c4 10             	add    $0x10,%esp
c01058f2:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c01058f8:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c01058fe:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105903:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105909:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010590f:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105915:	89 50 20             	mov    %edx,0x20(%eax)
c0105918:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010591b:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105921:	89 50 28             	mov    %edx,0x28(%eax)
c0105924:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105927:	8b 40 18             	mov    0x18(%eax),%eax
c010592a:	89 c2                	mov    %eax,%edx
c010592c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105932:	89 50 30             	mov    %edx,0x30(%eax)
c0105935:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010593b:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105941:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105944:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105947:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010594e:	00 00 00 
c0105951:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105958:	00 00 00 
c010595b:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0105962:	00 00 00 
c0105965:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c010596c:	00 00 00 
c010596f:	83 ec 04             	sub    $0x4,%esp
c0105972:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105975:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c010597b:	50                   	push   %eax
c010597c:	6a 01                	push   $0x1
c010597e:	e8 62 3e 00 00       	call   c01097e5 <send_rec>
c0105983:	83 c4 10             	add    $0x10,%esp
c0105986:	c9                   	leave  
c0105987:	c3                   	ret    

c0105988 <do_fork>:
c0105988:	55                   	push   %ebp
c0105989:	89 e5                	mov    %esp,%ebp
c010598b:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0105991:	8b 45 08             	mov    0x8(%ebp),%eax
c0105994:	8b 00                	mov    (%eax),%eax
c0105996:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105999:	83 ec 0c             	sub    $0xc,%esp
c010599c:	ff 75 f4             	pushl  -0xc(%ebp)
c010599f:	e8 3c 47 00 00       	call   c010a0e0 <fork_process>
c01059a4:	83 c4 10             	add    $0x10,%esp
c01059a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01059aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01059ad:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01059b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01059b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01059b9:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01059bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01059c2:	89 50 5c             	mov    %edx,0x5c(%eax)
c01059c5:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c01059cc:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01059d3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01059da:	83 ec 04             	sub    $0x4,%esp
c01059dd:	ff 75 ec             	pushl  -0x14(%ebp)
c01059e0:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c01059e6:	50                   	push   %eax
c01059e7:	6a 01                	push   $0x1
c01059e9:	e8 f7 3d 00 00       	call   c01097e5 <send_rec>
c01059ee:	83 c4 10             	add    $0x10,%esp
c01059f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01059f4:	c9                   	leave  
c01059f5:	c3                   	ret    

c01059f6 <do_exit>:
c01059f6:	55                   	push   %ebp
c01059f7:	89 e5                	mov    %esp,%ebp
c01059f9:	83 ec 18             	sub    $0x18,%esp
c01059fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01059ff:	8b 00                	mov    (%eax),%eax
c0105a01:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a04:	83 ec 0c             	sub    $0xc,%esp
c0105a07:	ff 75 f4             	pushl  -0xc(%ebp)
c0105a0a:	e8 97 e0 ff ff       	call   c0103aa6 <pid2proc>
c0105a0f:	83 c4 10             	add    $0x10,%esp
c0105a12:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a18:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105a1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a21:	83 ec 0c             	sub    $0xc,%esp
c0105a24:	ff 75 ec             	pushl  -0x14(%ebp)
c0105a27:	e8 7a e0 ff ff       	call   c0103aa6 <pid2proc>
c0105a2c:	83 c4 10             	add    $0x10,%esp
c0105a2f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105a32:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105a36:	74 45                	je     c0105a7d <do_exit+0x87>
c0105a38:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a3b:	8b 40 54             	mov    0x54(%eax),%eax
c0105a3e:	89 c2                	mov    %eax,%edx
c0105a40:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a43:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105a49:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105a4c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105a53:	3c 04                	cmp    $0x4,%al
c0105a55:	75 1a                	jne    c0105a71 <do_exit+0x7b>
c0105a57:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105a5a:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105a61:	83 ec 0c             	sub    $0xc,%esp
c0105a64:	ff 75 f0             	pushl  -0x10(%ebp)
c0105a67:	e8 33 01 00 00       	call   c0105b9f <cleanup>
c0105a6c:	83 c4 10             	add    $0x10,%esp
c0105a6f:	eb 0d                	jmp    c0105a7e <do_exit+0x88>
c0105a71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a74:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0105a7b:	eb 01                	jmp    c0105a7e <do_exit+0x88>
c0105a7d:	90                   	nop
c0105a7e:	c9                   	leave  
c0105a7f:	c3                   	ret    

c0105a80 <do_wait>:
c0105a80:	55                   	push   %ebp
c0105a81:	89 e5                	mov    %esp,%ebp
c0105a83:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0105a89:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a8c:	8b 00                	mov    (%eax),%eax
c0105a8e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a91:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105a98:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105a9f:	83 ec 0c             	sub    $0xc,%esp
c0105aa2:	ff 75 ec             	pushl  -0x14(%ebp)
c0105aa5:	e8 fc df ff ff       	call   c0103aa6 <pid2proc>
c0105aaa:	83 c4 10             	add    $0x10,%esp
c0105aad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ab0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105ab4:	75 19                	jne    c0105acf <do_wait+0x4f>
c0105ab6:	6a 58                	push   $0x58
c0105ab8:	68 35 b6 10 c0       	push   $0xc010b635
c0105abd:	68 35 b6 10 c0       	push   $0xc010b635
c0105ac2:	68 43 b6 10 c0       	push   $0xc010b643
c0105ac7:	e8 a9 30 00 00       	call   c0108b75 <assertion_failure>
c0105acc:	83 c4 10             	add    $0x10,%esp
c0105acf:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105ad4:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c0105ada:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105add:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105ae0:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105ae5:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c0105aeb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105aee:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105af1:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105af6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105af9:	eb 5b                	jmp    c0105b56 <do_wait+0xd6>
c0105afb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105afe:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105b03:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b06:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b09:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105b0f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0105b12:	74 0b                	je     c0105b1f <do_wait+0x9f>
c0105b14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b17:	8b 40 04             	mov    0x4(%eax),%eax
c0105b1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b1d:	eb 37                	jmp    c0105b56 <do_wait+0xd6>
c0105b1f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105b23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b26:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105b2d:	3c 03                	cmp    $0x3,%al
c0105b2f:	74 0b                	je     c0105b3c <do_wait+0xbc>
c0105b31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b34:	8b 40 04             	mov    0x4(%eax),%eax
c0105b37:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b3a:	eb 1a                	jmp    c0105b56 <do_wait+0xd6>
c0105b3c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105b3f:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105b46:	83 ec 0c             	sub    $0xc,%esp
c0105b49:	ff 75 e8             	pushl  -0x18(%ebp)
c0105b4c:	e8 4e 00 00 00       	call   c0105b9f <cleanup>
c0105b51:	83 c4 10             	add    $0x10,%esp
c0105b54:	eb 47                	jmp    c0105b9d <do_wait+0x11d>
c0105b56:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c0105b5d:	75 9c                	jne    c0105afb <do_wait+0x7b>
c0105b5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105b63:	74 0c                	je     c0105b71 <do_wait+0xf1>
c0105b65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105b68:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c0105b6f:	eb 2c                	jmp    c0105b9d <do_wait+0x11d>
c0105b71:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105b78:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0105b7f:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105b86:	83 ec 04             	sub    $0x4,%esp
c0105b89:	ff 75 ec             	pushl  -0x14(%ebp)
c0105b8c:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c0105b92:	50                   	push   %eax
c0105b93:	6a 01                	push   $0x1
c0105b95:	e8 4b 3c 00 00       	call   c01097e5 <send_rec>
c0105b9a:	83 c4 10             	add    $0x10,%esp
c0105b9d:	c9                   	leave  
c0105b9e:	c3                   	ret    

c0105b9f <cleanup>:
c0105b9f:	55                   	push   %ebp
c0105ba0:	89 e5                	mov    %esp,%ebp
c0105ba2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105ba8:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0105baf:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105bb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bb9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105bbf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105bc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bc5:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0105bcb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105bce:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bd1:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105bd7:	83 ec 04             	sub    $0x4,%esp
c0105bda:	50                   	push   %eax
c0105bdb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105be1:	50                   	push   %eax
c0105be2:	6a 01                	push   $0x1
c0105be4:	e8 fc 3b 00 00       	call   c01097e5 <send_rec>
c0105be9:	83 c4 10             	add    $0x10,%esp
c0105bec:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bef:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105bf6:	90                   	nop
c0105bf7:	c9                   	leave  
c0105bf8:	c3                   	ret    

c0105bf9 <init_bitmap>:
c0105bf9:	55                   	push   %ebp
c0105bfa:	89 e5                	mov    %esp,%ebp
c0105bfc:	83 ec 08             	sub    $0x8,%esp
c0105bff:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c02:	8b 50 04             	mov    0x4(%eax),%edx
c0105c05:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c08:	8b 00                	mov    (%eax),%eax
c0105c0a:	83 ec 04             	sub    $0x4,%esp
c0105c0d:	52                   	push   %edx
c0105c0e:	6a 00                	push   $0x0
c0105c10:	50                   	push   %eax
c0105c11:	e8 59 66 00 00       	call   c010c26f <Memset>
c0105c16:	83 c4 10             	add    $0x10,%esp
c0105c19:	90                   	nop
c0105c1a:	c9                   	leave  
c0105c1b:	c3                   	ret    

c0105c1c <test_bit_val>:
c0105c1c:	55                   	push   %ebp
c0105c1d:	89 e5                	mov    %esp,%ebp
c0105c1f:	53                   	push   %ebx
c0105c20:	83 ec 10             	sub    $0x10,%esp
c0105c23:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c26:	8d 50 07             	lea    0x7(%eax),%edx
c0105c29:	85 c0                	test   %eax,%eax
c0105c2b:	0f 48 c2             	cmovs  %edx,%eax
c0105c2e:	c1 f8 03             	sar    $0x3,%eax
c0105c31:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c34:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c37:	99                   	cltd   
c0105c38:	c1 ea 1d             	shr    $0x1d,%edx
c0105c3b:	01 d0                	add    %edx,%eax
c0105c3d:	83 e0 07             	and    $0x7,%eax
c0105c40:	29 d0                	sub    %edx,%eax
c0105c42:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c45:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c48:	8b 10                	mov    (%eax),%edx
c0105c4a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c4d:	01 d0                	add    %edx,%eax
c0105c4f:	0f b6 00             	movzbl (%eax),%eax
c0105c52:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105c55:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105c59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c5c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105c61:	89 c1                	mov    %eax,%ecx
c0105c63:	d3 e3                	shl    %cl,%ebx
c0105c65:	89 d8                	mov    %ebx,%eax
c0105c67:	21 c2                	and    %eax,%edx
c0105c69:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c6c:	89 c1                	mov    %eax,%ecx
c0105c6e:	d3 fa                	sar    %cl,%edx
c0105c70:	89 d0                	mov    %edx,%eax
c0105c72:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c75:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105c79:	0f 9f c0             	setg   %al
c0105c7c:	0f b6 c0             	movzbl %al,%eax
c0105c7f:	83 c4 10             	add    $0x10,%esp
c0105c82:	5b                   	pop    %ebx
c0105c83:	5d                   	pop    %ebp
c0105c84:	c3                   	ret    

c0105c85 <set_bit_val>:
c0105c85:	55                   	push   %ebp
c0105c86:	89 e5                	mov    %esp,%ebp
c0105c88:	83 ec 10             	sub    $0x10,%esp
c0105c8b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c8e:	8d 50 07             	lea    0x7(%eax),%edx
c0105c91:	85 c0                	test   %eax,%eax
c0105c93:	0f 48 c2             	cmovs  %edx,%eax
c0105c96:	c1 f8 03             	sar    $0x3,%eax
c0105c99:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c9c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c9f:	99                   	cltd   
c0105ca0:	c1 ea 1d             	shr    $0x1d,%edx
c0105ca3:	01 d0                	add    %edx,%eax
c0105ca5:	83 e0 07             	and    $0x7,%eax
c0105ca8:	29 d0                	sub    %edx,%eax
c0105caa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cad:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cb0:	8b 10                	mov    (%eax),%edx
c0105cb2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105cb5:	01 d0                	add    %edx,%eax
c0105cb7:	0f b6 00             	movzbl (%eax),%eax
c0105cba:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105cbd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105cc1:	7e 13                	jle    c0105cd6 <set_bit_val+0x51>
c0105cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105cc6:	ba 01 00 00 00       	mov    $0x1,%edx
c0105ccb:	89 c1                	mov    %eax,%ecx
c0105ccd:	d3 e2                	shl    %cl,%edx
c0105ccf:	89 d0                	mov    %edx,%eax
c0105cd1:	08 45 ff             	or     %al,-0x1(%ebp)
c0105cd4:	eb 13                	jmp    c0105ce9 <set_bit_val+0x64>
c0105cd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105cd9:	ba 01 00 00 00       	mov    $0x1,%edx
c0105cde:	89 c1                	mov    %eax,%ecx
c0105ce0:	d3 e2                	shl    %cl,%edx
c0105ce2:	89 d0                	mov    %edx,%eax
c0105ce4:	f7 d0                	not    %eax
c0105ce6:	20 45 ff             	and    %al,-0x1(%ebp)
c0105ce9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cec:	8b 10                	mov    (%eax),%edx
c0105cee:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105cf1:	01 c2                	add    %eax,%edx
c0105cf3:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105cf7:	88 02                	mov    %al,(%edx)
c0105cf9:	b8 01 00 00 00       	mov    $0x1,%eax
c0105cfe:	c9                   	leave  
c0105cff:	c3                   	ret    

c0105d00 <set_bits>:
c0105d00:	55                   	push   %ebp
c0105d01:	89 e5                	mov    %esp,%ebp
c0105d03:	83 ec 10             	sub    $0x10,%esp
c0105d06:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105d0d:	eb 1c                	jmp    c0105d2b <set_bits+0x2b>
c0105d0f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d12:	8d 50 01             	lea    0x1(%eax),%edx
c0105d15:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105d18:	ff 75 10             	pushl  0x10(%ebp)
c0105d1b:	50                   	push   %eax
c0105d1c:	ff 75 08             	pushl  0x8(%ebp)
c0105d1f:	e8 61 ff ff ff       	call   c0105c85 <set_bit_val>
c0105d24:	83 c4 0c             	add    $0xc,%esp
c0105d27:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105d2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105d2e:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105d31:	7c dc                	jl     c0105d0f <set_bits+0xf>
c0105d33:	b8 01 00 00 00       	mov    $0x1,%eax
c0105d38:	c9                   	leave  
c0105d39:	c3                   	ret    

c0105d3a <get_first_free_bit>:
c0105d3a:	55                   	push   %ebp
c0105d3b:	89 e5                	mov    %esp,%ebp
c0105d3d:	83 ec 10             	sub    $0x10,%esp
c0105d40:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d43:	8b 40 04             	mov    0x4(%eax),%eax
c0105d46:	c1 e0 03             	shl    $0x3,%eax
c0105d49:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105d4c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d4f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105d52:	eb 1b                	jmp    c0105d6f <get_first_free_bit+0x35>
c0105d54:	ff 75 fc             	pushl  -0x4(%ebp)
c0105d57:	ff 75 08             	pushl  0x8(%ebp)
c0105d5a:	e8 bd fe ff ff       	call   c0105c1c <test_bit_val>
c0105d5f:	83 c4 08             	add    $0x8,%esp
c0105d62:	85 c0                	test   %eax,%eax
c0105d64:	75 05                	jne    c0105d6b <get_first_free_bit+0x31>
c0105d66:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105d69:	eb 11                	jmp    c0105d7c <get_first_free_bit+0x42>
c0105d6b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105d6f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105d72:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105d75:	7c dd                	jl     c0105d54 <get_first_free_bit+0x1a>
c0105d77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105d7c:	c9                   	leave  
c0105d7d:	c3                   	ret    

c0105d7e <get_bits>:
c0105d7e:	55                   	push   %ebp
c0105d7f:	89 e5                	mov    %esp,%ebp
c0105d81:	83 ec 20             	sub    $0x20,%esp
c0105d84:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105d8b:	ff 75 f0             	pushl  -0x10(%ebp)
c0105d8e:	ff 75 08             	pushl  0x8(%ebp)
c0105d91:	e8 a4 ff ff ff       	call   c0105d3a <get_first_free_bit>
c0105d96:	83 c4 08             	add    $0x8,%esp
c0105d99:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d9f:	8b 40 04             	mov    0x4(%eax),%eax
c0105da2:	c1 e0 03             	shl    $0x3,%eax
c0105da5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105da8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105dab:	83 e8 01             	sub    $0x1,%eax
c0105dae:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105db1:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105db5:	75 08                	jne    c0105dbf <get_bits+0x41>
c0105db7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105dba:	e9 85 00 00 00       	jmp    c0105e44 <get_bits+0xc6>
c0105dbf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105dc2:	83 c0 01             	add    $0x1,%eax
c0105dc5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105dc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105dcb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105dce:	eb 58                	jmp    c0105e28 <get_bits+0xaa>
c0105dd0:	ff 75 f8             	pushl  -0x8(%ebp)
c0105dd3:	ff 75 08             	pushl  0x8(%ebp)
c0105dd6:	e8 41 fe ff ff       	call   c0105c1c <test_bit_val>
c0105ddb:	83 c4 08             	add    $0x8,%esp
c0105dde:	85 c0                	test   %eax,%eax
c0105de0:	75 0a                	jne    c0105dec <get_bits+0x6e>
c0105de2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105de6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105dea:	eb 2b                	jmp    c0105e17 <get_bits+0x99>
c0105dec:	6a 00                	push   $0x0
c0105dee:	ff 75 08             	pushl  0x8(%ebp)
c0105df1:	e8 44 ff ff ff       	call   c0105d3a <get_first_free_bit>
c0105df6:	83 c4 08             	add    $0x8,%esp
c0105df9:	83 c0 01             	add    $0x1,%eax
c0105dfc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105dff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e02:	83 c0 01             	add    $0x1,%eax
c0105e05:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105e08:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105e0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e0e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e11:	83 e8 01             	sub    $0x1,%eax
c0105e14:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105e17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e1a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105e1d:	7c 09                	jl     c0105e28 <get_bits+0xaa>
c0105e1f:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105e26:	eb 0d                	jmp    c0105e35 <get_bits+0xb7>
c0105e28:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105e2b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105e2e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105e31:	85 c0                	test   %eax,%eax
c0105e33:	7f 9b                	jg     c0105dd0 <get_bits+0x52>
c0105e35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e38:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105e3b:	83 c0 01             	add    $0x1,%eax
c0105e3e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105e41:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105e44:	c9                   	leave  
c0105e45:	c3                   	ret    

c0105e46 <get_a_page>:
c0105e46:	55                   	push   %ebp
c0105e47:	89 e5                	mov    %esp,%ebp
c0105e49:	83 ec 28             	sub    $0x28,%esp
c0105e4c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105e50:	75 22                	jne    c0105e74 <get_a_page+0x2e>
c0105e52:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105e57:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e5a:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105e5f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e62:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105e67:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e6a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105e6f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e72:	eb 20                	jmp    c0105e94 <get_a_page+0x4e>
c0105e74:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105e79:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e7c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105e81:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e84:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105e89:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e8c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105e91:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e94:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105e97:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e9a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105e9d:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105ea0:	6a 01                	push   $0x1
c0105ea2:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105ea5:	50                   	push   %eax
c0105ea6:	e8 d3 fe ff ff       	call   c0105d7e <get_bits>
c0105eab:	83 c4 08             	add    $0x8,%esp
c0105eae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105eb1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105eb5:	75 1c                	jne    c0105ed3 <get_a_page+0x8d>
c0105eb7:	68 84 00 00 00       	push   $0x84
c0105ebc:	68 56 b6 10 c0       	push   $0xc010b656
c0105ec1:	68 56 b6 10 c0       	push   $0xc010b656
c0105ec6:	68 60 b6 10 c0       	push   $0xc010b660
c0105ecb:	e8 a5 2c 00 00       	call   c0108b75 <assertion_failure>
c0105ed0:	83 c4 10             	add    $0x10,%esp
c0105ed3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105ed6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105ed9:	c1 e2 0c             	shl    $0xc,%edx
c0105edc:	01 d0                	add    %edx,%eax
c0105ede:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ee1:	83 ec 04             	sub    $0x4,%esp
c0105ee4:	6a 01                	push   $0x1
c0105ee6:	ff 75 f4             	pushl  -0xc(%ebp)
c0105ee9:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105eec:	50                   	push   %eax
c0105eed:	e8 93 fd ff ff       	call   c0105c85 <set_bit_val>
c0105ef2:	83 c4 10             	add    $0x10,%esp
c0105ef5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ef8:	c9                   	leave  
c0105ef9:	c3                   	ret    

c0105efa <get_virtual_address_start_with_addr>:
c0105efa:	55                   	push   %ebp
c0105efb:	89 e5                	mov    %esp,%ebp
c0105efd:	83 ec 38             	sub    $0x38,%esp
c0105f00:	e8 37 a5 ff ff       	call   c010043c <get_running_thread_pcb>
c0105f05:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f08:	83 ec 0c             	sub    $0xc,%esp
c0105f0b:	ff 75 10             	pushl  0x10(%ebp)
c0105f0e:	e8 93 db ff ff       	call   c0103aa6 <pid2proc>
c0105f13:	83 c4 10             	add    $0x10,%esp
c0105f16:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105f19:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f1c:	8b 40 0c             	mov    0xc(%eax),%eax
c0105f1f:	83 ec 04             	sub    $0x4,%esp
c0105f22:	6a 0c                	push   $0xc
c0105f24:	50                   	push   %eax
c0105f25:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105f28:	50                   	push   %eax
c0105f29:	e8 2e 10 00 00       	call   c0106f5c <Memcpy>
c0105f2e:	83 c4 10             	add    $0x10,%esp
c0105f31:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f34:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105f37:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105f3a:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105f3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f40:	8b 55 08             	mov    0x8(%ebp),%edx
c0105f43:	29 c2                	sub    %eax,%edx
c0105f45:	89 d0                	mov    %edx,%eax
c0105f47:	c1 e8 0c             	shr    $0xc,%eax
c0105f4a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f4d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105f51:	79 1c                	jns    c0105f6f <get_virtual_address_start_with_addr+0x75>
c0105f53:	68 97 00 00 00       	push   $0x97
c0105f58:	68 56 b6 10 c0       	push   $0xc010b656
c0105f5d:	68 56 b6 10 c0       	push   $0xc010b656
c0105f62:	68 6c b6 10 c0       	push   $0xc010b66c
c0105f67:	e8 09 2c 00 00       	call   c0108b75 <assertion_failure>
c0105f6c:	83 c4 10             	add    $0x10,%esp
c0105f6f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f72:	50                   	push   %eax
c0105f73:	6a 01                	push   $0x1
c0105f75:	ff 75 ec             	pushl  -0x14(%ebp)
c0105f78:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105f7b:	50                   	push   %eax
c0105f7c:	e8 7f fd ff ff       	call   c0105d00 <set_bits>
c0105f81:	83 c4 10             	add    $0x10,%esp
c0105f84:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f87:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105f92:	c9                   	leave  
c0105f93:	c3                   	ret    

c0105f94 <get_virtual_address>:
c0105f94:	55                   	push   %ebp
c0105f95:	89 e5                	mov    %esp,%ebp
c0105f97:	83 ec 28             	sub    $0x28,%esp
c0105f9a:	e8 9d a4 ff ff       	call   c010043c <get_running_thread_pcb>
c0105f9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fa2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105fa6:	75 1a                	jne    c0105fc2 <get_virtual_address+0x2e>
c0105fa8:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105fad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105fb0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105fb5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105fb8:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105fbd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105fc0:	eb 18                	jmp    c0105fda <get_virtual_address+0x46>
c0105fc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105fc5:	8b 40 0c             	mov    0xc(%eax),%eax
c0105fc8:	83 ec 04             	sub    $0x4,%esp
c0105fcb:	6a 0c                	push   $0xc
c0105fcd:	50                   	push   %eax
c0105fce:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105fd1:	50                   	push   %eax
c0105fd2:	e8 85 0f 00 00       	call   c0106f5c <Memcpy>
c0105fd7:	83 c4 10             	add    $0x10,%esp
c0105fda:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105fdd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105fe0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105fe3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105fe6:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fe9:	83 ec 08             	sub    $0x8,%esp
c0105fec:	50                   	push   %eax
c0105fed:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105ff0:	50                   	push   %eax
c0105ff1:	e8 88 fd ff ff       	call   c0105d7e <get_bits>
c0105ff6:	83 c4 10             	add    $0x10,%esp
c0105ff9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ffc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105fff:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106002:	c1 e2 0c             	shl    $0xc,%edx
c0106005:	01 d0                	add    %edx,%eax
c0106007:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010600a:	8b 45 08             	mov    0x8(%ebp),%eax
c010600d:	50                   	push   %eax
c010600e:	6a 01                	push   $0x1
c0106010:	ff 75 f0             	pushl  -0x10(%ebp)
c0106013:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0106016:	50                   	push   %eax
c0106017:	e8 e4 fc ff ff       	call   c0105d00 <set_bits>
c010601c:	83 c4 10             	add    $0x10,%esp
c010601f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106022:	c9                   	leave  
c0106023:	c3                   	ret    

c0106024 <ptr_pde>:
c0106024:	55                   	push   %ebp
c0106025:	89 e5                	mov    %esp,%ebp
c0106027:	8b 45 08             	mov    0x8(%ebp),%eax
c010602a:	c1 e8 16             	shr    $0x16,%eax
c010602d:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0106032:	c1 e0 02             	shl    $0x2,%eax
c0106035:	5d                   	pop    %ebp
c0106036:	c3                   	ret    

c0106037 <ptr_pte>:
c0106037:	55                   	push   %ebp
c0106038:	89 e5                	mov    %esp,%ebp
c010603a:	8b 45 08             	mov    0x8(%ebp),%eax
c010603d:	c1 e8 0a             	shr    $0xa,%eax
c0106040:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0106045:	89 c2                	mov    %eax,%edx
c0106047:	8b 45 08             	mov    0x8(%ebp),%eax
c010604a:	c1 e8 0c             	shr    $0xc,%eax
c010604d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0106052:	c1 e0 02             	shl    $0x2,%eax
c0106055:	01 d0                	add    %edx,%eax
c0106057:	2d 00 00 40 00       	sub    $0x400000,%eax
c010605c:	5d                   	pop    %ebp
c010605d:	c3                   	ret    

c010605e <add_map_entry>:
c010605e:	55                   	push   %ebp
c010605f:	89 e5                	mov    %esp,%ebp
c0106061:	83 ec 18             	sub    $0x18,%esp
c0106064:	ff 75 08             	pushl  0x8(%ebp)
c0106067:	e8 b8 ff ff ff       	call   c0106024 <ptr_pde>
c010606c:	83 c4 04             	add    $0x4,%esp
c010606f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106072:	ff 75 08             	pushl  0x8(%ebp)
c0106075:	e8 bd ff ff ff       	call   c0106037 <ptr_pte>
c010607a:	83 c4 04             	add    $0x4,%esp
c010607d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106080:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106083:	8b 00                	mov    (%eax),%eax
c0106085:	83 e0 01             	and    $0x1,%eax
c0106088:	85 c0                	test   %eax,%eax
c010608a:	74 1b                	je     c01060a7 <add_map_entry+0x49>
c010608c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010608f:	8b 00                	mov    (%eax),%eax
c0106091:	83 e0 01             	and    $0x1,%eax
c0106094:	85 c0                	test   %eax,%eax
c0106096:	75 54                	jne    c01060ec <add_map_entry+0x8e>
c0106098:	8b 45 0c             	mov    0xc(%ebp),%eax
c010609b:	83 c8 07             	or     $0x7,%eax
c010609e:	89 c2                	mov    %eax,%edx
c01060a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060a3:	89 10                	mov    %edx,(%eax)
c01060a5:	eb 45                	jmp    c01060ec <add_map_entry+0x8e>
c01060a7:	83 ec 0c             	sub    $0xc,%esp
c01060aa:	6a 00                	push   $0x0
c01060ac:	e8 95 fd ff ff       	call   c0105e46 <get_a_page>
c01060b1:	83 c4 10             	add    $0x10,%esp
c01060b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01060b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060ba:	83 c8 07             	or     $0x7,%eax
c01060bd:	89 c2                	mov    %eax,%edx
c01060bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01060c2:	89 10                	mov    %edx,(%eax)
c01060c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060c7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060cc:	83 ec 04             	sub    $0x4,%esp
c01060cf:	68 00 10 00 00       	push   $0x1000
c01060d4:	6a 00                	push   $0x0
c01060d6:	50                   	push   %eax
c01060d7:	e8 93 61 00 00       	call   c010c26f <Memset>
c01060dc:	83 c4 10             	add    $0x10,%esp
c01060df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01060e2:	83 c8 07             	or     $0x7,%eax
c01060e5:	89 c2                	mov    %eax,%edx
c01060e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060ea:	89 10                	mov    %edx,(%eax)
c01060ec:	90                   	nop
c01060ed:	c9                   	leave  
c01060ee:	c3                   	ret    

c01060ef <alloc_virtual_memory>:
c01060ef:	55                   	push   %ebp
c01060f0:	89 e5                	mov    %esp,%ebp
c01060f2:	83 ec 28             	sub    $0x28,%esp
c01060f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01060f8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106100:	8b 45 08             	mov    0x8(%ebp),%eax
c0106103:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106106:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106109:	8b 45 0c             	mov    0xc(%ebp),%eax
c010610c:	01 45 e4             	add    %eax,-0x1c(%ebp)
c010610f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106112:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106117:	c1 e8 0c             	shr    $0xc,%eax
c010611a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010611d:	e8 1a a3 ff ff       	call   c010043c <get_running_thread_pcb>
c0106122:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106125:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106128:	8b 50 08             	mov    0x8(%eax),%edx
c010612b:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106130:	39 c2                	cmp    %eax,%edx
c0106132:	75 09                	jne    c010613d <alloc_virtual_memory+0x4e>
c0106134:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010613b:	eb 07                	jmp    c0106144 <alloc_virtual_memory+0x55>
c010613d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106144:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010614b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106152:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0106159:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106160:	eb 47                	jmp    c01061a9 <alloc_virtual_memory+0xba>
c0106162:	83 ec 08             	sub    $0x8,%esp
c0106165:	ff 75 f0             	pushl  -0x10(%ebp)
c0106168:	6a 01                	push   $0x1
c010616a:	e8 25 fe ff ff       	call   c0105f94 <get_virtual_address>
c010616f:	83 c4 10             	add    $0x10,%esp
c0106172:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106175:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0106179:	74 13                	je     c010618e <alloc_virtual_memory+0x9f>
c010617b:	83 ec 0c             	sub    $0xc,%esp
c010617e:	ff 75 f0             	pushl  -0x10(%ebp)
c0106181:	e8 c0 fc ff ff       	call   c0105e46 <get_a_page>
c0106186:	83 c4 10             	add    $0x10,%esp
c0106189:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010618c:	eb 06                	jmp    c0106194 <alloc_virtual_memory+0xa5>
c010618e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106191:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106194:	83 ec 08             	sub    $0x8,%esp
c0106197:	ff 75 f4             	pushl  -0xc(%ebp)
c010619a:	ff 75 d8             	pushl  -0x28(%ebp)
c010619d:	e8 bc fe ff ff       	call   c010605e <add_map_entry>
c01061a2:	83 c4 10             	add    $0x10,%esp
c01061a5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01061a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01061ac:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c01061af:	72 b1                	jb     c0106162 <alloc_virtual_memory+0x73>
c01061b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01061b4:	25 ff 0f 00 00       	and    $0xfff,%eax
c01061b9:	89 c2                	mov    %eax,%edx
c01061bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061be:	01 d0                	add    %edx,%eax
c01061c0:	c9                   	leave  
c01061c1:	c3                   	ret    

c01061c2 <get_physical_address_proc>:
c01061c2:	55                   	push   %ebp
c01061c3:	89 e5                	mov    %esp,%ebp
c01061c5:	83 ec 18             	sub    $0x18,%esp
c01061c8:	e8 93 a1 ff ff       	call   c0100360 <disable_int>
c01061cd:	e8 6a a2 ff ff       	call   c010043c <get_running_thread_pcb>
c01061d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061d5:	83 ec 0c             	sub    $0xc,%esp
c01061d8:	ff 75 0c             	pushl  0xc(%ebp)
c01061db:	e8 c6 d8 ff ff       	call   c0103aa6 <pid2proc>
c01061e0:	83 c4 10             	add    $0x10,%esp
c01061e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01061e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01061e9:	8b 40 08             	mov    0x8(%eax),%eax
c01061ec:	83 ec 0c             	sub    $0xc,%esp
c01061ef:	50                   	push   %eax
c01061f0:	e8 2b a2 ff ff       	call   c0100420 <update_cr3>
c01061f5:	83 c4 10             	add    $0x10,%esp
c01061f8:	83 ec 0c             	sub    $0xc,%esp
c01061fb:	ff 75 08             	pushl  0x8(%ebp)
c01061fe:	e8 34 fe ff ff       	call   c0106037 <ptr_pte>
c0106203:	83 c4 10             	add    $0x10,%esp
c0106206:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106209:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010620c:	8b 00                	mov    (%eax),%eax
c010620e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106213:	89 c2                	mov    %eax,%edx
c0106215:	8b 45 08             	mov    0x8(%ebp),%eax
c0106218:	25 ff 0f 00 00       	and    $0xfff,%eax
c010621d:	09 d0                	or     %edx,%eax
c010621f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106222:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106225:	8b 40 08             	mov    0x8(%eax),%eax
c0106228:	83 ec 0c             	sub    $0xc,%esp
c010622b:	50                   	push   %eax
c010622c:	e8 ef a1 ff ff       	call   c0100420 <update_cr3>
c0106231:	83 c4 10             	add    $0x10,%esp
c0106234:	e8 29 a1 ff ff       	call   c0100362 <enable_int>
c0106239:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010623c:	c9                   	leave  
c010623d:	c3                   	ret    

c010623e <get_physical_address>:
c010623e:	55                   	push   %ebp
c010623f:	89 e5                	mov    %esp,%ebp
c0106241:	83 ec 10             	sub    $0x10,%esp
c0106244:	ff 75 08             	pushl  0x8(%ebp)
c0106247:	e8 eb fd ff ff       	call   c0106037 <ptr_pte>
c010624c:	83 c4 04             	add    $0x4,%esp
c010624f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106252:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106255:	8b 00                	mov    (%eax),%eax
c0106257:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010625c:	89 c2                	mov    %eax,%edx
c010625e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106261:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106266:	09 d0                	or     %edx,%eax
c0106268:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010626b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010626e:	c9                   	leave  
c010626f:	c3                   	ret    

c0106270 <alloc_physical_memory_of_proc>:
c0106270:	55                   	push   %ebp
c0106271:	89 e5                	mov    %esp,%ebp
c0106273:	83 ec 48             	sub    $0x48,%esp
c0106276:	e8 e5 a0 ff ff       	call   c0100360 <disable_int>
c010627b:	8b 45 08             	mov    0x8(%ebp),%eax
c010627e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106283:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106286:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010628d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106290:	83 ec 0c             	sub    $0xc,%esp
c0106293:	50                   	push   %eax
c0106294:	e8 0d d8 ff ff       	call   c0103aa6 <pid2proc>
c0106299:	83 c4 10             	add    $0x10,%esp
c010629c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010629f:	e8 98 a1 ff ff       	call   c010043c <get_running_thread_pcb>
c01062a4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01062a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062aa:	8b 40 0c             	mov    0xc(%eax),%eax
c01062ad:	83 ec 04             	sub    $0x4,%esp
c01062b0:	6a 0c                	push   $0xc
c01062b2:	50                   	push   %eax
c01062b3:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01062b6:	50                   	push   %eax
c01062b7:	e8 a0 0c 00 00       	call   c0106f5c <Memcpy>
c01062bc:	83 c4 10             	add    $0x10,%esp
c01062bf:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01062c2:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01062c5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01062c8:	89 55 c8             	mov    %edx,-0x38(%ebp)
c01062cb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01062ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01062d1:	29 c2                	sub    %eax,%edx
c01062d3:	89 d0                	mov    %edx,%eax
c01062d5:	c1 e8 0c             	shr    $0xc,%eax
c01062d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01062db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01062de:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01062e1:	c1 e2 0c             	shl    $0xc,%edx
c01062e4:	01 d0                	add    %edx,%eax
c01062e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01062e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01062ec:	6a 01                	push   $0x1
c01062ee:	6a 01                	push   $0x1
c01062f0:	50                   	push   %eax
c01062f1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01062f4:	50                   	push   %eax
c01062f5:	e8 06 fa ff ff       	call   c0105d00 <set_bits>
c01062fa:	83 c4 10             	add    $0x10,%esp
c01062fd:	83 ec 0c             	sub    $0xc,%esp
c0106300:	ff 75 f0             	pushl  -0x10(%ebp)
c0106303:	e8 3e fb ff ff       	call   c0105e46 <get_a_page>
c0106308:	83 c4 10             	add    $0x10,%esp
c010630b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010630e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106311:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106316:	89 c2                	mov    %eax,%edx
c0106318:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010631b:	01 d0                	add    %edx,%eax
c010631d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106320:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106323:	8b 40 08             	mov    0x8(%eax),%eax
c0106326:	83 ec 0c             	sub    $0xc,%esp
c0106329:	50                   	push   %eax
c010632a:	e8 f1 a0 ff ff       	call   c0100420 <update_cr3>
c010632f:	83 c4 10             	add    $0x10,%esp
c0106332:	83 ec 08             	sub    $0x8,%esp
c0106335:	ff 75 dc             	pushl  -0x24(%ebp)
c0106338:	ff 75 f4             	pushl  -0xc(%ebp)
c010633b:	e8 1e fd ff ff       	call   c010605e <add_map_entry>
c0106340:	83 c4 10             	add    $0x10,%esp
c0106343:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106346:	8b 40 08             	mov    0x8(%eax),%eax
c0106349:	83 ec 0c             	sub    $0xc,%esp
c010634c:	50                   	push   %eax
c010634d:	e8 ce a0 ff ff       	call   c0100420 <update_cr3>
c0106352:	83 c4 10             	add    $0x10,%esp
c0106355:	e8 08 a0 ff ff       	call   c0100362 <enable_int>
c010635a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010635d:	c9                   	leave  
c010635e:	c3                   	ret    

c010635f <alloc_physical_memory>:
c010635f:	55                   	push   %ebp
c0106360:	89 e5                	mov    %esp,%ebp
c0106362:	83 ec 38             	sub    $0x38,%esp
c0106365:	8b 45 08             	mov    0x8(%ebp),%eax
c0106368:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010636d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106370:	e8 c7 a0 ff ff       	call   c010043c <get_running_thread_pcb>
c0106375:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106378:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010637c:	75 1a                	jne    c0106398 <alloc_physical_memory+0x39>
c010637e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106383:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106386:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010638b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010638e:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106393:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106396:	eb 18                	jmp    c01063b0 <alloc_physical_memory+0x51>
c0106398:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010639b:	8b 40 0c             	mov    0xc(%eax),%eax
c010639e:	83 ec 04             	sub    $0x4,%esp
c01063a1:	6a 0c                	push   $0xc
c01063a3:	50                   	push   %eax
c01063a4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c01063a7:	50                   	push   %eax
c01063a8:	e8 af 0b 00 00       	call   c0106f5c <Memcpy>
c01063ad:	83 c4 10             	add    $0x10,%esp
c01063b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01063b3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01063b6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01063b9:	89 55 d0             	mov    %edx,-0x30(%ebp)
c01063bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01063bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01063c2:	29 c2                	sub    %eax,%edx
c01063c4:	89 d0                	mov    %edx,%eax
c01063c6:	c1 e8 0c             	shr    $0xc,%eax
c01063c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01063cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01063cf:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01063d2:	c1 e2 0c             	shl    $0xc,%edx
c01063d5:	01 d0                	add    %edx,%eax
c01063d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01063da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063dd:	6a 01                	push   $0x1
c01063df:	6a 01                	push   $0x1
c01063e1:	50                   	push   %eax
c01063e2:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01063e5:	50                   	push   %eax
c01063e6:	e8 15 f9 ff ff       	call   c0105d00 <set_bits>
c01063eb:	83 c4 10             	add    $0x10,%esp
c01063ee:	83 ec 0c             	sub    $0xc,%esp
c01063f1:	ff 75 0c             	pushl  0xc(%ebp)
c01063f4:	e8 4d fa ff ff       	call   c0105e46 <get_a_page>
c01063f9:	83 c4 10             	add    $0x10,%esp
c01063fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01063ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0106402:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106407:	89 c2                	mov    %eax,%edx
c0106409:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010640c:	01 d0                	add    %edx,%eax
c010640e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106411:	83 ec 08             	sub    $0x8,%esp
c0106414:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106417:	ff 75 f4             	pushl  -0xc(%ebp)
c010641a:	e8 3f fc ff ff       	call   c010605e <add_map_entry>
c010641f:	83 c4 10             	add    $0x10,%esp
c0106422:	8b 45 08             	mov    0x8(%ebp),%eax
c0106425:	c9                   	leave  
c0106426:	c3                   	ret    

c0106427 <alloc_memory>:
c0106427:	55                   	push   %ebp
c0106428:	89 e5                	mov    %esp,%ebp
c010642a:	83 ec 18             	sub    $0x18,%esp
c010642d:	83 ec 08             	sub    $0x8,%esp
c0106430:	ff 75 0c             	pushl  0xc(%ebp)
c0106433:	ff 75 08             	pushl  0x8(%ebp)
c0106436:	e8 59 fb ff ff       	call   c0105f94 <get_virtual_address>
c010643b:	83 c4 10             	add    $0x10,%esp
c010643e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106441:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106444:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106449:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010644c:	eb 29                	jmp    c0106477 <alloc_memory+0x50>
c010644e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106455:	83 ec 0c             	sub    $0xc,%esp
c0106458:	ff 75 0c             	pushl  0xc(%ebp)
c010645b:	e8 e6 f9 ff ff       	call   c0105e46 <get_a_page>
c0106460:	83 c4 10             	add    $0x10,%esp
c0106463:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106466:	83 ec 08             	sub    $0x8,%esp
c0106469:	ff 75 ec             	pushl  -0x14(%ebp)
c010646c:	ff 75 f4             	pushl  -0xc(%ebp)
c010646f:	e8 ea fb ff ff       	call   c010605e <add_map_entry>
c0106474:	83 c4 10             	add    $0x10,%esp
c0106477:	8b 45 08             	mov    0x8(%ebp),%eax
c010647a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010647d:	89 55 08             	mov    %edx,0x8(%ebp)
c0106480:	85 c0                	test   %eax,%eax
c0106482:	75 ca                	jne    c010644e <alloc_memory+0x27>
c0106484:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106487:	c9                   	leave  
c0106488:	c3                   	ret    

c0106489 <get_a_virtual_page>:
c0106489:	55                   	push   %ebp
c010648a:	89 e5                	mov    %esp,%ebp
c010648c:	83 ec 18             	sub    $0x18,%esp
c010648f:	83 ec 0c             	sub    $0xc,%esp
c0106492:	ff 75 08             	pushl  0x8(%ebp)
c0106495:	e8 ac f9 ff ff       	call   c0105e46 <get_a_page>
c010649a:	83 c4 10             	add    $0x10,%esp
c010649d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01064a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01064a3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01064a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01064ab:	83 ec 08             	sub    $0x8,%esp
c01064ae:	ff 75 f4             	pushl  -0xc(%ebp)
c01064b1:	ff 75 f0             	pushl  -0x10(%ebp)
c01064b4:	e8 a5 fb ff ff       	call   c010605e <add_map_entry>
c01064b9:	83 c4 10             	add    $0x10,%esp
c01064bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01064bf:	c9                   	leave  
c01064c0:	c3                   	ret    

c01064c1 <block2arena>:
c01064c1:	55                   	push   %ebp
c01064c2:	89 e5                	mov    %esp,%ebp
c01064c4:	83 ec 10             	sub    $0x10,%esp
c01064c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01064ca:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01064cf:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01064d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01064d5:	c9                   	leave  
c01064d6:	c3                   	ret    

c01064d7 <sys_malloc2>:
c01064d7:	55                   	push   %ebp
c01064d8:	89 e5                	mov    %esp,%ebp
c01064da:	83 ec 68             	sub    $0x68,%esp
c01064dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01064e4:	e8 53 9f ff ff       	call   c010043c <get_running_thread_pcb>
c01064e9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01064ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01064ef:	8b 50 08             	mov    0x8(%eax),%edx
c01064f2:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01064f7:	39 c2                	cmp    %eax,%edx
c01064f9:	75 10                	jne    c010650b <sys_malloc2+0x34>
c01064fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106502:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106509:	eb 10                	jmp    c010651b <sys_malloc2+0x44>
c010650b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106512:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106515:	83 c0 10             	add    $0x10,%eax
c0106518:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010651b:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0106522:	76 52                	jbe    c0106576 <sys_malloc2+0x9f>
c0106524:	8b 45 08             	mov    0x8(%ebp),%eax
c0106527:	05 0b 10 00 00       	add    $0x100b,%eax
c010652c:	c1 e8 0c             	shr    $0xc,%eax
c010652f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106532:	83 ec 08             	sub    $0x8,%esp
c0106535:	ff 75 f0             	pushl  -0x10(%ebp)
c0106538:	ff 75 d8             	pushl  -0x28(%ebp)
c010653b:	e8 e7 fe ff ff       	call   c0106427 <alloc_memory>
c0106540:	83 c4 10             	add    $0x10,%esp
c0106543:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106546:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106549:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010654c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010654f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106555:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106558:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010655f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106562:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106566:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106569:	05 90 00 00 00       	add    $0x90,%eax
c010656e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106571:	e9 f0 01 00 00       	jmp    c0106766 <sys_malloc2+0x28f>
c0106576:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010657d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106584:	eb 26                	jmp    c01065ac <sys_malloc2+0xd5>
c0106586:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106589:	89 d0                	mov    %edx,%eax
c010658b:	01 c0                	add    %eax,%eax
c010658d:	01 d0                	add    %edx,%eax
c010658f:	c1 e0 03             	shl    $0x3,%eax
c0106592:	89 c2                	mov    %eax,%edx
c0106594:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106597:	01 d0                	add    %edx,%eax
c0106599:	8b 00                	mov    (%eax),%eax
c010659b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010659e:	77 08                	ja     c01065a8 <sys_malloc2+0xd1>
c01065a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01065a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01065a6:	eb 0a                	jmp    c01065b2 <sys_malloc2+0xdb>
c01065a8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01065ac:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c01065b0:	7e d4                	jle    c0106586 <sys_malloc2+0xaf>
c01065b2:	83 ec 08             	sub    $0x8,%esp
c01065b5:	ff 75 f0             	pushl  -0x10(%ebp)
c01065b8:	6a 01                	push   $0x1
c01065ba:	e8 68 fe ff ff       	call   c0106427 <alloc_memory>
c01065bf:	83 c4 10             	add    $0x10,%esp
c01065c2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01065c5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01065c8:	89 d0                	mov    %edx,%eax
c01065ca:	01 c0                	add    %eax,%eax
c01065cc:	01 d0                	add    %edx,%eax
c01065ce:	c1 e0 03             	shl    $0x3,%eax
c01065d1:	89 c2                	mov    %eax,%edx
c01065d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01065d6:	01 d0                	add    %edx,%eax
c01065d8:	83 ec 04             	sub    $0x4,%esp
c01065db:	6a 18                	push   $0x18
c01065dd:	50                   	push   %eax
c01065de:	ff 75 cc             	pushl  -0x34(%ebp)
c01065e1:	e8 76 09 00 00       	call   c0106f5c <Memcpy>
c01065e6:	83 c4 10             	add    $0x10,%esp
c01065e9:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01065f0:	e8 03 09 00 00       	call   c0106ef8 <intr_disable>
c01065f5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01065f8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01065fb:	89 d0                	mov    %edx,%eax
c01065fd:	01 c0                	add    %eax,%eax
c01065ff:	01 d0                	add    %edx,%eax
c0106601:	c1 e0 03             	shl    $0x3,%eax
c0106604:	89 c2                	mov    %eax,%edx
c0106606:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106609:	01 d0                	add    %edx,%eax
c010660b:	83 c0 08             	add    $0x8,%eax
c010660e:	83 ec 0c             	sub    $0xc,%esp
c0106611:	50                   	push   %eax
c0106612:	e8 1c 3d 00 00       	call   c010a333 <isListEmpty>
c0106617:	83 c4 10             	add    $0x10,%esp
c010661a:	3c 01                	cmp    $0x1,%al
c010661c:	0f 85 c1 00 00 00    	jne    c01066e3 <sys_malloc2+0x20c>
c0106622:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106629:	83 ec 08             	sub    $0x8,%esp
c010662c:	ff 75 f0             	pushl  -0x10(%ebp)
c010662f:	6a 01                	push   $0x1
c0106631:	e8 f1 fd ff ff       	call   c0106427 <alloc_memory>
c0106636:	83 c4 10             	add    $0x10,%esp
c0106639:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010663c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010663f:	83 ec 0c             	sub    $0xc,%esp
c0106642:	50                   	push   %eax
c0106643:	e8 79 fe ff ff       	call   c01064c1 <block2arena>
c0106648:	83 c4 10             	add    $0x10,%esp
c010664b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010664e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106651:	89 d0                	mov    %edx,%eax
c0106653:	01 c0                	add    %eax,%eax
c0106655:	01 d0                	add    %edx,%eax
c0106657:	c1 e0 03             	shl    $0x3,%eax
c010665a:	89 c2                	mov    %eax,%edx
c010665c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010665f:	01 d0                	add    %edx,%eax
c0106661:	8b 50 04             	mov    0x4(%eax),%edx
c0106664:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106667:	89 50 04             	mov    %edx,0x4(%eax)
c010666a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010666d:	8b 00                	mov    (%eax),%eax
c010666f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106672:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106679:	b8 00 10 00 00       	mov    $0x1000,%eax
c010667e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0106681:	ba 00 00 00 00       	mov    $0x0,%edx
c0106686:	f7 75 b8             	divl   -0x48(%ebp)
c0106689:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010668c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010668f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0106692:	01 d0                	add    %edx,%eax
c0106694:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106697:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010669e:	eb 3b                	jmp    c01066db <sys_malloc2+0x204>
c01066a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01066a3:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c01066a7:	89 c2                	mov    %eax,%edx
c01066a9:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01066ac:	01 d0                	add    %edx,%eax
c01066ae:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01066b1:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01066b4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01066b7:	89 d0                	mov    %edx,%eax
c01066b9:	01 c0                	add    %eax,%eax
c01066bb:	01 d0                	add    %edx,%eax
c01066bd:	c1 e0 03             	shl    $0x3,%eax
c01066c0:	89 c2                	mov    %eax,%edx
c01066c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01066c5:	01 d0                	add    %edx,%eax
c01066c7:	83 c0 08             	add    $0x8,%eax
c01066ca:	83 ec 08             	sub    $0x8,%esp
c01066cd:	51                   	push   %ecx
c01066ce:	50                   	push   %eax
c01066cf:	e8 5c 3d 00 00       	call   c010a430 <appendToDoubleLinkList>
c01066d4:	83 c4 10             	add    $0x10,%esp
c01066d7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01066db:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01066de:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01066e1:	77 bd                	ja     c01066a0 <sys_malloc2+0x1c9>
c01066e3:	83 ec 0c             	sub    $0xc,%esp
c01066e6:	ff 75 c4             	pushl  -0x3c(%ebp)
c01066e9:	e8 33 08 00 00       	call   c0106f21 <intr_set_status>
c01066ee:	83 c4 10             	add    $0x10,%esp
c01066f1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01066f4:	89 d0                	mov    %edx,%eax
c01066f6:	01 c0                	add    %eax,%eax
c01066f8:	01 d0                	add    %edx,%eax
c01066fa:	c1 e0 03             	shl    $0x3,%eax
c01066fd:	89 c2                	mov    %eax,%edx
c01066ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106702:	01 d0                	add    %edx,%eax
c0106704:	83 c0 08             	add    $0x8,%eax
c0106707:	83 ec 0c             	sub    $0xc,%esp
c010670a:	50                   	push   %eax
c010670b:	e8 8a 3e 00 00       	call   c010a59a <popFromDoubleLinkList>
c0106710:	83 c4 10             	add    $0x10,%esp
c0106713:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106716:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106719:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010671c:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0106720:	75 1c                	jne    c010673e <sys_malloc2+0x267>
c0106722:	68 ef 01 00 00       	push   $0x1ef
c0106727:	68 56 b6 10 c0       	push   $0xc010b656
c010672c:	68 56 b6 10 c0       	push   $0xc010b656
c0106731:	68 77 b6 10 c0       	push   $0xc010b677
c0106736:	e8 3a 24 00 00       	call   c0108b75 <assertion_failure>
c010673b:	83 c4 10             	add    $0x10,%esp
c010673e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106741:	83 ec 0c             	sub    $0xc,%esp
c0106744:	50                   	push   %eax
c0106745:	e8 77 fd ff ff       	call   c01064c1 <block2arena>
c010674a:	83 c4 10             	add    $0x10,%esp
c010674d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106750:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106753:	8b 40 04             	mov    0x4(%eax),%eax
c0106756:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106759:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010675c:	89 50 04             	mov    %edx,0x4(%eax)
c010675f:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106766:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010676a:	75 1c                	jne    c0106788 <sys_malloc2+0x2b1>
c010676c:	68 f6 01 00 00       	push   $0x1f6
c0106771:	68 56 b6 10 c0       	push   $0xc010b656
c0106776:	68 56 b6 10 c0       	push   $0xc010b656
c010677b:	68 89 b6 10 c0       	push   $0xc010b689
c0106780:	e8 f0 23 00 00       	call   c0108b75 <assertion_failure>
c0106785:	83 c4 10             	add    $0x10,%esp
c0106788:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010678b:	c9                   	leave  
c010678c:	c3                   	ret    

c010678d <remove_map_entry>:
c010678d:	55                   	push   %ebp
c010678e:	89 e5                	mov    %esp,%ebp
c0106790:	83 ec 10             	sub    $0x10,%esp
c0106793:	ff 75 08             	pushl  0x8(%ebp)
c0106796:	e8 9c f8 ff ff       	call   c0106037 <ptr_pte>
c010679b:	83 c4 04             	add    $0x4,%esp
c010679e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01067a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01067a4:	8b 10                	mov    (%eax),%edx
c01067a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01067a9:	89 10                	mov    %edx,(%eax)
c01067ab:	90                   	nop
c01067ac:	c9                   	leave  
c01067ad:	c3                   	ret    

c01067ae <free_a_page>:
c01067ae:	55                   	push   %ebp
c01067af:	89 e5                	mov    %esp,%ebp
c01067b1:	83 ec 20             	sub    $0x20,%esp
c01067b4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01067b8:	75 21                	jne    c01067db <free_a_page+0x2d>
c01067ba:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01067bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01067c2:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01067c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01067ca:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01067cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067d2:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c01067d9:	eb 1f                	jmp    c01067fa <free_a_page+0x4c>
c01067db:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01067e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01067e3:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01067e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01067eb:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01067f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067f3:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c01067fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01067fd:	c1 e8 0c             	shr    $0xc,%eax
c0106800:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106803:	6a 00                	push   $0x0
c0106805:	ff 75 f8             	pushl  -0x8(%ebp)
c0106808:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c010680b:	50                   	push   %eax
c010680c:	e8 74 f4 ff ff       	call   c0105c85 <set_bit_val>
c0106811:	83 c4 0c             	add    $0xc,%esp
c0106814:	ff 75 08             	pushl  0x8(%ebp)
c0106817:	e8 22 fa ff ff       	call   c010623e <get_physical_address>
c010681c:	83 c4 04             	add    $0x4,%esp
c010681f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106822:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106825:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010682b:	85 c0                	test   %eax,%eax
c010682d:	0f 48 c2             	cmovs  %edx,%eax
c0106830:	c1 f8 0c             	sar    $0xc,%eax
c0106833:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106836:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106839:	6a 00                	push   $0x0
c010683b:	ff 75 f0             	pushl  -0x10(%ebp)
c010683e:	50                   	push   %eax
c010683f:	e8 41 f4 ff ff       	call   c0105c85 <set_bit_val>
c0106844:	83 c4 0c             	add    $0xc,%esp
c0106847:	ff 75 08             	pushl  0x8(%ebp)
c010684a:	e8 3e ff ff ff       	call   c010678d <remove_map_entry>
c010684f:	83 c4 04             	add    $0x4,%esp
c0106852:	90                   	nop
c0106853:	c9                   	leave  
c0106854:	c3                   	ret    

c0106855 <sys_free2>:
c0106855:	55                   	push   %ebp
c0106856:	89 e5                	mov    %esp,%ebp
c0106858:	83 ec 58             	sub    $0x58,%esp
c010685b:	e8 dc 9b ff ff       	call   c010043c <get_running_thread_pcb>
c0106860:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106863:	e8 90 06 00 00       	call   c0106ef8 <intr_disable>
c0106868:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010686b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010686e:	8b 50 08             	mov    0x8(%eax),%edx
c0106871:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106876:	39 c2                	cmp    %eax,%edx
c0106878:	75 10                	jne    c010688a <sys_free2+0x35>
c010687a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106881:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c0106888:	eb 10                	jmp    c010689a <sys_free2+0x45>
c010688a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106891:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106894:	83 c0 10             	add    $0x10,%eax
c0106897:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010689a:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c01068a1:	76 4d                	jbe    c01068f0 <sys_free2+0x9b>
c01068a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01068a6:	83 e8 0c             	sub    $0xc,%eax
c01068a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01068ac:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c01068b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01068b3:	05 ff 0f 00 00       	add    $0xfff,%eax
c01068b8:	c1 e8 0c             	shr    $0xc,%eax
c01068bb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01068be:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01068c5:	eb 1c                	jmp    c01068e3 <sys_free2+0x8e>
c01068c7:	83 ec 08             	sub    $0x8,%esp
c01068ca:	ff 75 f4             	pushl  -0xc(%ebp)
c01068cd:	ff 75 ec             	pushl  -0x14(%ebp)
c01068d0:	e8 d9 fe ff ff       	call   c01067ae <free_a_page>
c01068d5:	83 c4 10             	add    $0x10,%esp
c01068d8:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c01068df:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01068e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01068e6:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c01068e9:	77 dc                	ja     c01068c7 <sys_free2+0x72>
c01068eb:	e9 dc 00 00 00       	jmp    c01069cc <sys_free2+0x177>
c01068f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01068f7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01068fe:	eb 26                	jmp    c0106926 <sys_free2+0xd1>
c0106900:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106903:	89 d0                	mov    %edx,%eax
c0106905:	01 c0                	add    %eax,%eax
c0106907:	01 d0                	add    %edx,%eax
c0106909:	c1 e0 03             	shl    $0x3,%eax
c010690c:	89 c2                	mov    %eax,%edx
c010690e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106911:	01 d0                	add    %edx,%eax
c0106913:	8b 00                	mov    (%eax),%eax
c0106915:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106918:	77 08                	ja     c0106922 <sys_free2+0xcd>
c010691a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010691d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106920:	eb 0a                	jmp    c010692c <sys_free2+0xd7>
c0106922:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106926:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c010692a:	7e d4                	jle    c0106900 <sys_free2+0xab>
c010692c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010692f:	89 d0                	mov    %edx,%eax
c0106931:	01 c0                	add    %eax,%eax
c0106933:	01 d0                	add    %edx,%eax
c0106935:	c1 e0 03             	shl    $0x3,%eax
c0106938:	89 c2                	mov    %eax,%edx
c010693a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010693d:	01 d0                	add    %edx,%eax
c010693f:	8b 10                	mov    (%eax),%edx
c0106941:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106944:	8b 50 04             	mov    0x4(%eax),%edx
c0106947:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010694a:	8b 50 08             	mov    0x8(%eax),%edx
c010694d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106950:	8b 50 0c             	mov    0xc(%eax),%edx
c0106953:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106956:	8b 50 10             	mov    0x10(%eax),%edx
c0106959:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010695c:	8b 40 14             	mov    0x14(%eax),%eax
c010695f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106962:	8b 45 08             	mov    0x8(%ebp),%eax
c0106965:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106968:	83 ec 0c             	sub    $0xc,%esp
c010696b:	ff 75 d0             	pushl  -0x30(%ebp)
c010696e:	e8 4e fb ff ff       	call   c01064c1 <block2arena>
c0106973:	83 c4 10             	add    $0x10,%esp
c0106976:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106979:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010697c:	89 d0                	mov    %edx,%eax
c010697e:	01 c0                	add    %eax,%eax
c0106980:	01 d0                	add    %edx,%eax
c0106982:	c1 e0 03             	shl    $0x3,%eax
c0106985:	89 c2                	mov    %eax,%edx
c0106987:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010698a:	01 d0                	add    %edx,%eax
c010698c:	83 c0 08             	add    $0x8,%eax
c010698f:	83 ec 08             	sub    $0x8,%esp
c0106992:	ff 75 d0             	pushl  -0x30(%ebp)
c0106995:	50                   	push   %eax
c0106996:	e8 95 3a 00 00       	call   c010a430 <appendToDoubleLinkList>
c010699b:	83 c4 10             	add    $0x10,%esp
c010699e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01069a1:	8b 40 04             	mov    0x4(%eax),%eax
c01069a4:	8d 50 01             	lea    0x1(%eax),%edx
c01069a7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01069aa:	89 50 04             	mov    %edx,0x4(%eax)
c01069ad:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01069b0:	8b 50 04             	mov    0x4(%eax),%edx
c01069b3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01069b6:	39 c2                	cmp    %eax,%edx
c01069b8:	75 12                	jne    c01069cc <sys_free2+0x177>
c01069ba:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01069bd:	83 ec 08             	sub    $0x8,%esp
c01069c0:	ff 75 f4             	pushl  -0xc(%ebp)
c01069c3:	50                   	push   %eax
c01069c4:	e8 e5 fd ff ff       	call   c01067ae <free_a_page>
c01069c9:	83 c4 10             	add    $0x10,%esp
c01069cc:	83 ec 0c             	sub    $0xc,%esp
c01069cf:	ff 75 d8             	pushl  -0x28(%ebp)
c01069d2:	e8 4a 05 00 00       	call   c0106f21 <intr_set_status>
c01069d7:	83 c4 10             	add    $0x10,%esp
c01069da:	90                   	nop
c01069db:	c9                   	leave  
c01069dc:	c3                   	ret    

c01069dd <init_memory_block_desc>:
c01069dd:	55                   	push   %ebp
c01069de:	89 e5                	mov    %esp,%ebp
c01069e0:	83 ec 18             	sub    $0x18,%esp
c01069e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01069ea:	e9 b2 00 00 00       	jmp    c0106aa1 <init_memory_block_desc+0xc4>
c01069ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01069f3:	75 1b                	jne    c0106a10 <init_memory_block_desc+0x33>
c01069f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01069f8:	89 d0                	mov    %edx,%eax
c01069fa:	01 c0                	add    %eax,%eax
c01069fc:	01 d0                	add    %edx,%eax
c01069fe:	c1 e0 03             	shl    $0x3,%eax
c0106a01:	89 c2                	mov    %eax,%edx
c0106a03:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a06:	01 d0                	add    %edx,%eax
c0106a08:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0106a0e:	eb 2e                	jmp    c0106a3e <init_memory_block_desc+0x61>
c0106a10:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a13:	89 d0                	mov    %edx,%eax
c0106a15:	01 c0                	add    %eax,%eax
c0106a17:	01 d0                	add    %edx,%eax
c0106a19:	c1 e0 03             	shl    $0x3,%eax
c0106a1c:	8d 50 e8             	lea    -0x18(%eax),%edx
c0106a1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a22:	01 d0                	add    %edx,%eax
c0106a24:	8b 08                	mov    (%eax),%ecx
c0106a26:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a29:	89 d0                	mov    %edx,%eax
c0106a2b:	01 c0                	add    %eax,%eax
c0106a2d:	01 d0                	add    %edx,%eax
c0106a2f:	c1 e0 03             	shl    $0x3,%eax
c0106a32:	89 c2                	mov    %eax,%edx
c0106a34:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a37:	01 d0                	add    %edx,%eax
c0106a39:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0106a3c:	89 10                	mov    %edx,(%eax)
c0106a3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a41:	89 d0                	mov    %edx,%eax
c0106a43:	01 c0                	add    %eax,%eax
c0106a45:	01 d0                	add    %edx,%eax
c0106a47:	c1 e0 03             	shl    $0x3,%eax
c0106a4a:	89 c2                	mov    %eax,%edx
c0106a4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a4f:	01 d0                	add    %edx,%eax
c0106a51:	8b 00                	mov    (%eax),%eax
c0106a53:	89 c1                	mov    %eax,%ecx
c0106a55:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0106a5a:	ba 00 00 00 00       	mov    $0x0,%edx
c0106a5f:	f7 f1                	div    %ecx
c0106a61:	89 c1                	mov    %eax,%ecx
c0106a63:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a66:	89 d0                	mov    %edx,%eax
c0106a68:	01 c0                	add    %eax,%eax
c0106a6a:	01 d0                	add    %edx,%eax
c0106a6c:	c1 e0 03             	shl    $0x3,%eax
c0106a6f:	89 c2                	mov    %eax,%edx
c0106a71:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a74:	01 d0                	add    %edx,%eax
c0106a76:	89 ca                	mov    %ecx,%edx
c0106a78:	89 50 04             	mov    %edx,0x4(%eax)
c0106a7b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a7e:	89 d0                	mov    %edx,%eax
c0106a80:	01 c0                	add    %eax,%eax
c0106a82:	01 d0                	add    %edx,%eax
c0106a84:	c1 e0 03             	shl    $0x3,%eax
c0106a87:	89 c2                	mov    %eax,%edx
c0106a89:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a8c:	01 d0                	add    %edx,%eax
c0106a8e:	83 c0 08             	add    $0x8,%eax
c0106a91:	83 ec 0c             	sub    $0xc,%esp
c0106a94:	50                   	push   %eax
c0106a95:	e8 6b 38 00 00       	call   c010a305 <initDoubleLinkList>
c0106a9a:	83 c4 10             	add    $0x10,%esp
c0106a9d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0106aa1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0106aa5:	0f 8e 44 ff ff ff    	jle    c01069ef <init_memory_block_desc+0x12>
c0106aab:	90                   	nop
c0106aac:	c9                   	leave  
c0106aad:	c3                   	ret    

c0106aae <init_memory2>:
c0106aae:	55                   	push   %ebp
c0106aaf:	89 e5                	mov    %esp,%ebp
c0106ab1:	83 ec 38             	sub    $0x38,%esp
c0106ab4:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0106abb:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106ac2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106ac5:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106aca:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106acd:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106ad2:	29 c2                	sub    %eax,%edx
c0106ad4:	89 d0                	mov    %edx,%eax
c0106ad6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106ad9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106adc:	89 c2                	mov    %eax,%edx
c0106ade:	c1 ea 1f             	shr    $0x1f,%edx
c0106ae1:	01 d0                	add    %edx,%eax
c0106ae3:	d1 f8                	sar    %eax
c0106ae5:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106aea:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106aef:	83 ec 0c             	sub    $0xc,%esp
c0106af2:	50                   	push   %eax
c0106af3:	e8 52 08 00 00       	call   c010734a <disp_int>
c0106af8:	83 c4 10             	add    $0x10,%esp
c0106afb:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106b00:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b03:	29 c2                	sub    %eax,%edx
c0106b05:	89 d0                	mov    %edx,%eax
c0106b07:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c0106b0c:	83 ec 0c             	sub    $0xc,%esp
c0106b0f:	68 95 b6 10 c0       	push   $0xc010b695
c0106b14:	e8 c0 95 ff ff       	call   c01000d9 <disp_str>
c0106b19:	83 c4 10             	add    $0x10,%esp
c0106b1c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106b21:	83 ec 0c             	sub    $0xc,%esp
c0106b24:	50                   	push   %eax
c0106b25:	e8 20 08 00 00       	call   c010734a <disp_int>
c0106b2a:	83 c4 10             	add    $0x10,%esp
c0106b2d:	83 ec 0c             	sub    $0xc,%esp
c0106b30:	68 95 b6 10 c0       	push   $0xc010b695
c0106b35:	e8 9f 95 ff ff       	call   c01000d9 <disp_str>
c0106b3a:	83 c4 10             	add    $0x10,%esp
c0106b3d:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106b42:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106b47:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106b4d:	85 c0                	test   %eax,%eax
c0106b4f:	0f 48 c2             	cmovs  %edx,%eax
c0106b52:	c1 f8 0c             	sar    $0xc,%eax
c0106b55:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106b58:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106b5b:	83 c0 07             	add    $0x7,%eax
c0106b5e:	8d 50 07             	lea    0x7(%eax),%edx
c0106b61:	85 c0                	test   %eax,%eax
c0106b63:	0f 48 c2             	cmovs  %edx,%eax
c0106b66:	c1 f8 03             	sar    $0x3,%eax
c0106b69:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106b6e:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106b73:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106b78:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106b7d:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106b83:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106b88:	83 ec 04             	sub    $0x4,%esp
c0106b8b:	52                   	push   %edx
c0106b8c:	6a 00                	push   $0x0
c0106b8e:	50                   	push   %eax
c0106b8f:	e8 db 56 00 00       	call   c010c26f <Memset>
c0106b94:	83 c4 10             	add    $0x10,%esp
c0106b97:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0106b9c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106ba1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106ba7:	85 c0                	test   %eax,%eax
c0106ba9:	0f 48 c2             	cmovs  %edx,%eax
c0106bac:	c1 f8 0c             	sar    $0xc,%eax
c0106baf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106bb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106bb5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106bb8:	ff 75 e8             	pushl  -0x18(%ebp)
c0106bbb:	6a 01                	push   $0x1
c0106bbd:	6a 00                	push   $0x0
c0106bbf:	68 ac 06 11 c0       	push   $0xc01106ac
c0106bc4:	e8 37 f1 ff ff       	call   c0105d00 <set_bits>
c0106bc9:	83 c4 10             	add    $0x10,%esp
c0106bcc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106bd1:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106bd6:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106bdc:	85 c0                	test   %eax,%eax
c0106bde:	0f 48 c2             	cmovs  %edx,%eax
c0106be1:	c1 f8 0c             	sar    $0xc,%eax
c0106be4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106be7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106bea:	83 c0 07             	add    $0x7,%eax
c0106bed:	8d 50 07             	lea    0x7(%eax),%edx
c0106bf0:	85 c0                	test   %eax,%eax
c0106bf2:	0f 48 c2             	cmovs  %edx,%eax
c0106bf5:	c1 f8 03             	sar    $0x3,%eax
c0106bf8:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106bfd:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106c02:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106c08:	01 d0                	add    %edx,%eax
c0106c0a:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106c0f:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106c15:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106c1a:	83 ec 04             	sub    $0x4,%esp
c0106c1d:	52                   	push   %edx
c0106c1e:	6a 00                	push   $0x0
c0106c20:	50                   	push   %eax
c0106c21:	e8 49 56 00 00       	call   c010c26f <Memset>
c0106c26:	83 c4 10             	add    $0x10,%esp
c0106c29:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106c2e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106c33:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106c39:	85 c0                	test   %eax,%eax
c0106c3b:	0f 48 c2             	cmovs  %edx,%eax
c0106c3e:	c1 f8 0c             	sar    $0xc,%eax
c0106c41:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106c44:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106c47:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106c4a:	ff 75 e8             	pushl  -0x18(%ebp)
c0106c4d:	6a 01                	push   $0x1
c0106c4f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106c52:	68 ac 06 11 c0       	push   $0xc01106ac
c0106c57:	e8 a4 f0 ff ff       	call   c0105d00 <set_bits>
c0106c5c:	83 c4 10             	add    $0x10,%esp
c0106c5f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106c66:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106c69:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106c6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106c6f:	83 c0 07             	add    $0x7,%eax
c0106c72:	8d 50 07             	lea    0x7(%eax),%edx
c0106c75:	85 c0                	test   %eax,%eax
c0106c77:	0f 48 c2             	cmovs  %edx,%eax
c0106c7a:	c1 f8 03             	sar    $0x3,%eax
c0106c7d:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106c82:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106c87:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106c8d:	01 c2                	add    %eax,%edx
c0106c8f:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106c94:	01 d0                	add    %edx,%eax
c0106c96:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106c9b:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106ca1:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106ca6:	83 ec 04             	sub    $0x4,%esp
c0106ca9:	52                   	push   %edx
c0106caa:	6a 00                	push   $0x0
c0106cac:	50                   	push   %eax
c0106cad:	e8 bd 55 00 00       	call   c010c26f <Memset>
c0106cb2:	83 c4 10             	add    $0x10,%esp
c0106cb5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106cb8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106cbb:	01 d0                	add    %edx,%eax
c0106cbd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106cc0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106cc5:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106cca:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106cd0:	85 c0                	test   %eax,%eax
c0106cd2:	0f 48 c2             	cmovs  %edx,%eax
c0106cd5:	c1 f8 0c             	sar    $0xc,%eax
c0106cd8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106cdb:	ff 75 e8             	pushl  -0x18(%ebp)
c0106cde:	6a 01                	push   $0x1
c0106ce0:	ff 75 e0             	pushl  -0x20(%ebp)
c0106ce3:	68 ac 06 11 c0       	push   $0xc01106ac
c0106ce8:	e8 13 f0 ff ff       	call   c0105d00 <set_bits>
c0106ced:	83 c4 10             	add    $0x10,%esp
c0106cf0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106cf3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106cf6:	01 d0                	add    %edx,%eax
c0106cf8:	c1 e0 0c             	shl    $0xc,%eax
c0106cfb:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106d00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d03:	83 c0 02             	add    $0x2,%eax
c0106d06:	c1 e0 0c             	shl    $0xc,%eax
c0106d09:	89 c2                	mov    %eax,%edx
c0106d0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106d0e:	01 d0                	add    %edx,%eax
c0106d10:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106d15:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106d1c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106d1f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106d22:	90                   	nop
c0106d23:	c9                   	leave  
c0106d24:	c3                   	ret    

c0106d25 <init_memory>:
c0106d25:	55                   	push   %ebp
c0106d26:	89 e5                	mov    %esp,%ebp
c0106d28:	83 ec 38             	sub    $0x38,%esp
c0106d2b:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106d32:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106d39:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106d40:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106d43:	05 00 00 40 00       	add    $0x400000,%eax
c0106d48:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106d4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106d4e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106d51:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106d57:	85 c0                	test   %eax,%eax
c0106d59:	0f 48 c2             	cmovs  %edx,%eax
c0106d5c:	c1 f8 0c             	sar    $0xc,%eax
c0106d5f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106d62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106d65:	89 c2                	mov    %eax,%edx
c0106d67:	c1 ea 1f             	shr    $0x1f,%edx
c0106d6a:	01 d0                	add    %edx,%eax
c0106d6c:	d1 f8                	sar    %eax
c0106d6e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106d71:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106d74:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106d77:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106d7a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106d7d:	8d 50 07             	lea    0x7(%eax),%edx
c0106d80:	85 c0                	test   %eax,%eax
c0106d82:	0f 48 c2             	cmovs  %edx,%eax
c0106d85:	c1 f8 03             	sar    $0x3,%eax
c0106d88:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106d8b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106d8e:	8d 50 07             	lea    0x7(%eax),%edx
c0106d91:	85 c0                	test   %eax,%eax
c0106d93:	0f 48 c2             	cmovs  %edx,%eax
c0106d96:	c1 f8 03             	sar    $0x3,%eax
c0106d99:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106d9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d9f:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106da4:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106da9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106dac:	c1 e2 0c             	shl    $0xc,%edx
c0106daf:	01 d0                	add    %edx,%eax
c0106db1:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106db6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106db9:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106dbe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106dc1:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106dc6:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106dcb:	83 ec 04             	sub    $0x4,%esp
c0106dce:	ff 75 d8             	pushl  -0x28(%ebp)
c0106dd1:	6a 00                	push   $0x0
c0106dd3:	50                   	push   %eax
c0106dd4:	e8 96 54 00 00       	call   c010c26f <Memset>
c0106dd9:	83 c4 10             	add    $0x10,%esp
c0106ddc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106ddf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106de2:	01 d0                	add    %edx,%eax
c0106de4:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106de9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106dec:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106df1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106df6:	83 ec 04             	sub    $0x4,%esp
c0106df9:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106dfc:	6a 00                	push   $0x0
c0106dfe:	50                   	push   %eax
c0106dff:	e8 6b 54 00 00       	call   c010c26f <Memset>
c0106e04:	83 c4 10             	add    $0x10,%esp
c0106e07:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106e0a:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106e0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106e12:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106e15:	01 c2                	add    %eax,%edx
c0106e17:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106e1a:	01 d0                	add    %edx,%eax
c0106e1c:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106e21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106e24:	05 00 00 10 00       	add    $0x100000,%eax
c0106e29:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106e2e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106e33:	83 ec 04             	sub    $0x4,%esp
c0106e36:	ff 75 d8             	pushl  -0x28(%ebp)
c0106e39:	6a 00                	push   $0x0
c0106e3b:	50                   	push   %eax
c0106e3c:	e8 2e 54 00 00       	call   c010c26f <Memset>
c0106e41:	83 c4 10             	add    $0x10,%esp
c0106e44:	83 ec 04             	sub    $0x4,%esp
c0106e47:	68 f0 00 00 00       	push   $0xf0
c0106e4c:	6a 00                	push   $0x0
c0106e4e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106e53:	e8 17 54 00 00       	call   c010c26f <Memset>
c0106e58:	83 c4 10             	add    $0x10,%esp
c0106e5b:	83 ec 0c             	sub    $0xc,%esp
c0106e5e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106e63:	e8 75 fb ff ff       	call   c01069dd <init_memory_block_desc>
c0106e68:	83 c4 10             	add    $0x10,%esp
c0106e6b:	90                   	nop
c0106e6c:	c9                   	leave  
c0106e6d:	c3                   	ret    

c0106e6e <stop_here>:
c0106e6e:	55                   	push   %ebp
c0106e6f:	89 e5                	mov    %esp,%ebp
c0106e71:	83 ec 08             	sub    $0x8,%esp
c0106e74:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106e7b:	00 00 00 
c0106e7e:	83 ec 0c             	sub    $0xc,%esp
c0106e81:	68 a0 b6 10 c0       	push   $0xc010b6a0
c0106e86:	e8 4e 92 ff ff       	call   c01000d9 <disp_str>
c0106e8b:	83 c4 10             	add    $0x10,%esp
c0106e8e:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106e93:	83 ec 0c             	sub    $0xc,%esp
c0106e96:	50                   	push   %eax
c0106e97:	e8 ae 04 00 00       	call   c010734a <disp_int>
c0106e9c:	83 c4 10             	add    $0x10,%esp
c0106e9f:	83 ec 0c             	sub    $0xc,%esp
c0106ea2:	68 a2 b6 10 c0       	push   $0xc010b6a2
c0106ea7:	e8 2d 92 ff ff       	call   c01000d9 <disp_str>
c0106eac:	83 c4 10             	add    $0x10,%esp
c0106eaf:	90                   	nop
c0106eb0:	c9                   	leave  
c0106eb1:	c3                   	ret    

c0106eb2 <catch_error>:
c0106eb2:	55                   	push   %ebp
c0106eb3:	89 e5                	mov    %esp,%ebp
c0106eb5:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106eba:	83 c0 01             	add    $0x1,%eax
c0106ebd:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106ec2:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106ec7:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106ecc:	90                   	nop
c0106ecd:	5d                   	pop    %ebp
c0106ece:	c3                   	ret    

c0106ecf <intr_enable>:
c0106ecf:	55                   	push   %ebp
c0106ed0:	89 e5                	mov    %esp,%ebp
c0106ed2:	83 ec 18             	sub    $0x18,%esp
c0106ed5:	e8 65 00 00 00       	call   c0106f3f <intr_get_status>
c0106eda:	83 f8 01             	cmp    $0x1,%eax
c0106edd:	75 0c                	jne    c0106eeb <intr_enable+0x1c>
c0106edf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106ee6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ee9:	eb 0b                	jmp    c0106ef6 <intr_enable+0x27>
c0106eeb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106ef2:	fb                   	sti    
c0106ef3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ef6:	c9                   	leave  
c0106ef7:	c3                   	ret    

c0106ef8 <intr_disable>:
c0106ef8:	55                   	push   %ebp
c0106ef9:	89 e5                	mov    %esp,%ebp
c0106efb:	83 ec 18             	sub    $0x18,%esp
c0106efe:	e8 3c 00 00 00       	call   c0106f3f <intr_get_status>
c0106f03:	83 f8 01             	cmp    $0x1,%eax
c0106f06:	75 0d                	jne    c0106f15 <intr_disable+0x1d>
c0106f08:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106f0f:	fa                   	cli    
c0106f10:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f13:	eb 0a                	jmp    c0106f1f <intr_disable+0x27>
c0106f15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106f1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f1f:	c9                   	leave  
c0106f20:	c3                   	ret    

c0106f21 <intr_set_status>:
c0106f21:	55                   	push   %ebp
c0106f22:	89 e5                	mov    %esp,%ebp
c0106f24:	83 ec 08             	sub    $0x8,%esp
c0106f27:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f2a:	83 e0 01             	and    $0x1,%eax
c0106f2d:	85 c0                	test   %eax,%eax
c0106f2f:	74 07                	je     c0106f38 <intr_set_status+0x17>
c0106f31:	e8 99 ff ff ff       	call   c0106ecf <intr_enable>
c0106f36:	eb 05                	jmp    c0106f3d <intr_set_status+0x1c>
c0106f38:	e8 bb ff ff ff       	call   c0106ef8 <intr_disable>
c0106f3d:	c9                   	leave  
c0106f3e:	c3                   	ret    

c0106f3f <intr_get_status>:
c0106f3f:	55                   	push   %ebp
c0106f40:	89 e5                	mov    %esp,%ebp
c0106f42:	83 ec 10             	sub    $0x10,%esp
c0106f45:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106f4c:	9c                   	pushf  
c0106f4d:	58                   	pop    %eax
c0106f4e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106f51:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f54:	c1 e8 09             	shr    $0x9,%eax
c0106f57:	83 e0 01             	and    $0x1,%eax
c0106f5a:	c9                   	leave  
c0106f5b:	c3                   	ret    

c0106f5c <Memcpy>:
c0106f5c:	55                   	push   %ebp
c0106f5d:	89 e5                	mov    %esp,%ebp
c0106f5f:	83 ec 18             	sub    $0x18,%esp
c0106f62:	e8 91 ff ff ff       	call   c0106ef8 <intr_disable>
c0106f67:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106f6a:	83 ec 04             	sub    $0x4,%esp
c0106f6d:	ff 75 10             	pushl  0x10(%ebp)
c0106f70:	ff 75 0c             	pushl  0xc(%ebp)
c0106f73:	ff 75 08             	pushl  0x8(%ebp)
c0106f76:	e8 c6 52 00 00       	call   c010c241 <Memcpy2>
c0106f7b:	83 c4 10             	add    $0x10,%esp
c0106f7e:	83 ec 0c             	sub    $0xc,%esp
c0106f81:	ff 75 f4             	pushl  -0xc(%ebp)
c0106f84:	e8 98 ff ff ff       	call   c0106f21 <intr_set_status>
c0106f89:	83 c4 10             	add    $0x10,%esp
c0106f8c:	90                   	nop
c0106f8d:	c9                   	leave  
c0106f8e:	c3                   	ret    

c0106f8f <untar>:
c0106f8f:	55                   	push   %ebp
c0106f90:	89 e5                	mov    %esp,%ebp
c0106f92:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106f98:	83 ec 08             	sub    $0x8,%esp
c0106f9b:	6a 00                	push   $0x0
c0106f9d:	ff 75 08             	pushl  0x8(%ebp)
c0106fa0:	e8 2a de ff ff       	call   c0104dcf <open>
c0106fa5:	83 c4 10             	add    $0x10,%esp
c0106fa8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106fab:	83 ec 0c             	sub    $0xc,%esp
c0106fae:	68 a4 b6 10 c0       	push   $0xc010b6a4
c0106fb3:	e8 60 18 00 00       	call   c0108818 <Printf>
c0106fb8:	83 c4 10             	add    $0x10,%esp
c0106fbb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106fc2:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106fc9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106fd0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106fd7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106fde:	e9 63 02 00 00       	jmp    c0107246 <untar+0x2b7>
c0106fe3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106fe7:	7e 58                	jle    c0107041 <untar+0xb2>
c0106fe9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fec:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106ff1:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106ff7:	85 c0                	test   %eax,%eax
c0106ff9:	0f 48 c2             	cmovs  %edx,%eax
c0106ffc:	c1 f8 09             	sar    $0x9,%eax
c0106fff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107002:	83 ec 04             	sub    $0x4,%esp
c0107005:	68 00 02 00 00       	push   $0x200
c010700a:	6a 00                	push   $0x0
c010700c:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0107012:	50                   	push   %eax
c0107013:	e8 57 52 00 00       	call   c010c26f <Memset>
c0107018:	83 c4 10             	add    $0x10,%esp
c010701b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010701e:	c1 e0 09             	shl    $0x9,%eax
c0107021:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0107024:	83 ec 04             	sub    $0x4,%esp
c0107027:	50                   	push   %eax
c0107028:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c010702e:	50                   	push   %eax
c010702f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107032:	e8 2d de ff ff       	call   c0104e64 <read>
c0107037:	83 c4 10             	add    $0x10,%esp
c010703a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107041:	83 ec 04             	sub    $0x4,%esp
c0107044:	68 00 02 00 00       	push   $0x200
c0107049:	6a 00                	push   $0x0
c010704b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0107051:	50                   	push   %eax
c0107052:	e8 18 52 00 00       	call   c010c26f <Memset>
c0107057:	83 c4 10             	add    $0x10,%esp
c010705a:	83 ec 04             	sub    $0x4,%esp
c010705d:	68 00 02 00 00       	push   $0x200
c0107062:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0107068:	50                   	push   %eax
c0107069:	ff 75 e4             	pushl  -0x1c(%ebp)
c010706c:	e8 f3 dd ff ff       	call   c0104e64 <read>
c0107071:	83 c4 10             	add    $0x10,%esp
c0107074:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107077:	83 ec 0c             	sub    $0xc,%esp
c010707a:	68 b6 b6 10 c0       	push   $0xc010b6b6
c010707f:	e8 94 17 00 00       	call   c0108818 <Printf>
c0107084:	83 c4 10             	add    $0x10,%esp
c0107087:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c010708b:	0f 84 c1 01 00 00    	je     c0107252 <untar+0x2c3>
c0107091:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107094:	01 45 f4             	add    %eax,-0xc(%ebp)
c0107097:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010709e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c01070a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01070a7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01070aa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01070ad:	83 ec 08             	sub    $0x8,%esp
c01070b0:	6a 07                	push   $0x7
c01070b2:	ff 75 cc             	pushl  -0x34(%ebp)
c01070b5:	e8 15 dd ff ff       	call   c0104dcf <open>
c01070ba:	83 c4 10             	add    $0x10,%esp
c01070bd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01070c0:	83 ec 0c             	sub    $0xc,%esp
c01070c3:	68 c8 b6 10 c0       	push   $0xc010b6c8
c01070c8:	e8 4b 17 00 00       	call   c0108818 <Printf>
c01070cd:	83 c4 10             	add    $0x10,%esp
c01070d0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01070d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01070da:	83 c0 7c             	add    $0x7c,%eax
c01070dd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01070e0:	83 ec 0c             	sub    $0xc,%esp
c01070e3:	ff 75 cc             	pushl  -0x34(%ebp)
c01070e6:	e8 bd 51 00 00       	call   c010c2a8 <Strlen>
c01070eb:	83 c4 10             	add    $0x10,%esp
c01070ee:	85 c0                	test   %eax,%eax
c01070f0:	75 28                	jne    c010711a <untar+0x18b>
c01070f2:	83 ec 0c             	sub    $0xc,%esp
c01070f5:	ff 75 c4             	pushl  -0x3c(%ebp)
c01070f8:	e8 ab 51 00 00       	call   c010c2a8 <Strlen>
c01070fd:	83 c4 10             	add    $0x10,%esp
c0107100:	85 c0                	test   %eax,%eax
c0107102:	75 16                	jne    c010711a <untar+0x18b>
c0107104:	83 ec 0c             	sub    $0xc,%esp
c0107107:	68 da b6 10 c0       	push   $0xc010b6da
c010710c:	e8 07 17 00 00       	call   c0108818 <Printf>
c0107111:	83 c4 10             	add    $0x10,%esp
c0107114:	90                   	nop
c0107115:	e9 39 01 00 00       	jmp    c0107253 <untar+0x2c4>
c010711a:	83 ec 0c             	sub    $0xc,%esp
c010711d:	68 e1 b6 10 c0       	push   $0xc010b6e1
c0107122:	e8 f1 16 00 00       	call   c0108818 <Printf>
c0107127:	83 c4 10             	add    $0x10,%esp
c010712a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010712d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107130:	eb 1f                	jmp    c0107151 <untar+0x1c2>
c0107132:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107135:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010713c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010713f:	0f b6 00             	movzbl (%eax),%eax
c0107142:	0f be c0             	movsbl %al,%eax
c0107145:	83 e8 30             	sub    $0x30,%eax
c0107148:	01 d0                	add    %edx,%eax
c010714a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010714d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0107151:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107154:	0f b6 00             	movzbl (%eax),%eax
c0107157:	84 c0                	test   %al,%al
c0107159:	75 d7                	jne    c0107132 <untar+0x1a3>
c010715b:	83 ec 0c             	sub    $0xc,%esp
c010715e:	68 ef b6 10 c0       	push   $0xc010b6ef
c0107163:	e8 b0 16 00 00       	call   c0108818 <Printf>
c0107168:	83 c4 10             	add    $0x10,%esp
c010716b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010716e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107171:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0107178:	83 ec 08             	sub    $0x8,%esp
c010717b:	ff 75 c0             	pushl  -0x40(%ebp)
c010717e:	68 fd b6 10 c0       	push   $0xc010b6fd
c0107183:	e8 90 16 00 00       	call   c0108818 <Printf>
c0107188:	83 c4 10             	add    $0x10,%esp
c010718b:	83 ec 08             	sub    $0x8,%esp
c010718e:	ff 75 c0             	pushl  -0x40(%ebp)
c0107191:	68 0f b7 10 c0       	push   $0xc010b70f
c0107196:	e8 7d 16 00 00       	call   c0108818 <Printf>
c010719b:	83 c4 10             	add    $0x10,%esp
c010719e:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01071a1:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c01071a4:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c01071a8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01071ab:	e8 02 fd ff ff       	call   c0106eb2 <catch_error>
c01071b0:	83 ec 04             	sub    $0x4,%esp
c01071b3:	ff 75 b8             	pushl  -0x48(%ebp)
c01071b6:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c01071bc:	50                   	push   %eax
c01071bd:	ff 75 e4             	pushl  -0x1c(%ebp)
c01071c0:	e8 9f dc ff ff       	call   c0104e64 <read>
c01071c5:	83 c4 10             	add    $0x10,%esp
c01071c8:	01 45 f4             	add    %eax,-0xc(%ebp)
c01071cb:	83 ec 04             	sub    $0x4,%esp
c01071ce:	ff 75 b8             	pushl  -0x48(%ebp)
c01071d1:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c01071d7:	50                   	push   %eax
c01071d8:	ff 75 c8             	pushl  -0x38(%ebp)
c01071db:	e8 05 de ff ff       	call   c0104fe5 <write>
c01071e0:	83 c4 10             	add    $0x10,%esp
c01071e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01071e6:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c01071e9:	7d 02                	jge    c01071ed <untar+0x25e>
c01071eb:	eb be                	jmp    c01071ab <untar+0x21c>
c01071ed:	90                   	nop
c01071ee:	83 ec 08             	sub    $0x8,%esp
c01071f1:	ff 75 f4             	pushl  -0xc(%ebp)
c01071f4:	68 21 b7 10 c0       	push   $0xc010b721
c01071f9:	e8 1a 16 00 00       	call   c0108818 <Printf>
c01071fe:	83 c4 10             	add    $0x10,%esp
c0107201:	83 ec 08             	sub    $0x8,%esp
c0107204:	ff 75 c0             	pushl  -0x40(%ebp)
c0107207:	68 33 b7 10 c0       	push   $0xc010b733
c010720c:	e8 07 16 00 00       	call   c0108818 <Printf>
c0107211:	83 c4 10             	add    $0x10,%esp
c0107214:	83 ec 0c             	sub    $0xc,%esp
c0107217:	68 44 b7 10 c0       	push   $0xc010b744
c010721c:	e8 f7 15 00 00       	call   c0108818 <Printf>
c0107221:	83 c4 10             	add    $0x10,%esp
c0107224:	83 ec 0c             	sub    $0xc,%esp
c0107227:	ff 75 c8             	pushl  -0x38(%ebp)
c010722a:	e8 3b de ff ff       	call   c010506a <close>
c010722f:	83 c4 10             	add    $0x10,%esp
c0107232:	83 ec 0c             	sub    $0xc,%esp
c0107235:	68 52 b7 10 c0       	push   $0xc010b752
c010723a:	e8 d9 15 00 00       	call   c0108818 <Printf>
c010723f:	83 c4 10             	add    $0x10,%esp
c0107242:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0107246:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010724a:	0f 8f 93 fd ff ff    	jg     c0106fe3 <untar+0x54>
c0107250:	eb 01                	jmp    c0107253 <untar+0x2c4>
c0107252:	90                   	nop
c0107253:	83 ec 0c             	sub    $0xc,%esp
c0107256:	68 5f b7 10 c0       	push   $0xc010b75f
c010725b:	e8 b8 15 00 00       	call   c0108818 <Printf>
c0107260:	83 c4 10             	add    $0x10,%esp
c0107263:	83 ec 0c             	sub    $0xc,%esp
c0107266:	68 71 b7 10 c0       	push   $0xc010b771
c010726b:	e8 a8 15 00 00       	call   c0108818 <Printf>
c0107270:	83 c4 10             	add    $0x10,%esp
c0107273:	83 ec 0c             	sub    $0xc,%esp
c0107276:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107279:	e8 ec dd ff ff       	call   c010506a <close>
c010727e:	83 c4 10             	add    $0x10,%esp
c0107281:	83 ec 0c             	sub    $0xc,%esp
c0107284:	68 81 b7 10 c0       	push   $0xc010b781
c0107289:	e8 8a 15 00 00       	call   c0108818 <Printf>
c010728e:	83 c4 10             	add    $0x10,%esp
c0107291:	83 ec 0c             	sub    $0xc,%esp
c0107294:	68 94 b7 10 c0       	push   $0xc010b794
c0107299:	e8 7a 15 00 00       	call   c0108818 <Printf>
c010729e:	83 c4 10             	add    $0x10,%esp
c01072a1:	90                   	nop
c01072a2:	c9                   	leave  
c01072a3:	c3                   	ret    

c01072a4 <atoi>:
c01072a4:	55                   	push   %ebp
c01072a5:	89 e5                	mov    %esp,%ebp
c01072a7:	83 ec 10             	sub    $0x10,%esp
c01072aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01072ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01072b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01072b3:	8d 50 01             	lea    0x1(%eax),%edx
c01072b6:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01072b9:	c6 00 30             	movb   $0x30,(%eax)
c01072bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01072bf:	8d 50 01             	lea    0x1(%eax),%edx
c01072c2:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01072c5:	c6 00 78             	movb   $0x78,(%eax)
c01072c8:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c01072cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01072d0:	75 0e                	jne    c01072e0 <atoi+0x3c>
c01072d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01072d5:	8d 50 01             	lea    0x1(%eax),%edx
c01072d8:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01072db:	c6 00 30             	movb   $0x30,(%eax)
c01072de:	eb 61                	jmp    c0107341 <atoi+0x9d>
c01072e0:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c01072e7:	eb 52                	jmp    c010733b <atoi+0x97>
c01072e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01072ec:	8b 55 0c             	mov    0xc(%ebp),%edx
c01072ef:	89 c1                	mov    %eax,%ecx
c01072f1:	d3 fa                	sar    %cl,%edx
c01072f3:	89 d0                	mov    %edx,%eax
c01072f5:	83 e0 0f             	and    $0xf,%eax
c01072f8:	88 45 fb             	mov    %al,-0x5(%ebp)
c01072fb:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c01072ff:	75 06                	jne    c0107307 <atoi+0x63>
c0107301:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0107305:	74 2f                	je     c0107336 <atoi+0x92>
c0107307:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c010730b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010730f:	83 c0 30             	add    $0x30,%eax
c0107312:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107315:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0107319:	7e 0a                	jle    c0107325 <atoi+0x81>
c010731b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010731f:	83 c0 07             	add    $0x7,%eax
c0107322:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107325:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107328:	8d 50 01             	lea    0x1(%eax),%edx
c010732b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010732e:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0107332:	88 10                	mov    %dl,(%eax)
c0107334:	eb 01                	jmp    c0107337 <atoi+0x93>
c0107336:	90                   	nop
c0107337:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010733b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010733f:	79 a8                	jns    c01072e9 <atoi+0x45>
c0107341:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107344:	c6 00 00             	movb   $0x0,(%eax)
c0107347:	90                   	nop
c0107348:	c9                   	leave  
c0107349:	c3                   	ret    

c010734a <disp_int>:
c010734a:	55                   	push   %ebp
c010734b:	89 e5                	mov    %esp,%ebp
c010734d:	83 ec 18             	sub    $0x18,%esp
c0107350:	ff 75 08             	pushl  0x8(%ebp)
c0107353:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107356:	50                   	push   %eax
c0107357:	e8 48 ff ff ff       	call   c01072a4 <atoi>
c010735c:	83 c4 08             	add    $0x8,%esp
c010735f:	83 ec 08             	sub    $0x8,%esp
c0107362:	6a 0b                	push   $0xb
c0107364:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107367:	50                   	push   %eax
c0107368:	e8 a7 8d ff ff       	call   c0100114 <disp_str_colour>
c010736d:	83 c4 10             	add    $0x10,%esp
c0107370:	90                   	nop
c0107371:	c9                   	leave  
c0107372:	c3                   	ret    

c0107373 <do_page_fault>:
c0107373:	55                   	push   %ebp
c0107374:	89 e5                	mov    %esp,%ebp
c0107376:	83 ec 28             	sub    $0x28,%esp
c0107379:	0f 20 d0             	mov    %cr2,%eax
c010737c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010737f:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107386:	00 00 00 
c0107389:	83 ec 0c             	sub    $0xc,%esp
c010738c:	68 9f b7 10 c0       	push   $0xc010b79f
c0107391:	e8 43 8d ff ff       	call   c01000d9 <disp_str>
c0107396:	83 c4 10             	add    $0x10,%esp
c0107399:	83 ec 0c             	sub    $0xc,%esp
c010739c:	68 ae b7 10 c0       	push   $0xc010b7ae
c01073a1:	e8 33 8d ff ff       	call   c01000d9 <disp_str>
c01073a6:	83 c4 10             	add    $0x10,%esp
c01073a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01073ac:	83 ec 0c             	sub    $0xc,%esp
c01073af:	50                   	push   %eax
c01073b0:	e8 95 ff ff ff       	call   c010734a <disp_int>
c01073b5:	83 c4 10             	add    $0x10,%esp
c01073b8:	83 ec 0c             	sub    $0xc,%esp
c01073bb:	68 b3 b7 10 c0       	push   $0xc010b7b3
c01073c0:	e8 14 8d ff ff       	call   c01000d9 <disp_str>
c01073c5:	83 c4 10             	add    $0x10,%esp
c01073c8:	83 ec 0c             	sub    $0xc,%esp
c01073cb:	ff 75 f4             	pushl  -0xc(%ebp)
c01073ce:	e8 51 ec ff ff       	call   c0106024 <ptr_pde>
c01073d3:	83 c4 10             	add    $0x10,%esp
c01073d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01073d9:	83 ec 0c             	sub    $0xc,%esp
c01073dc:	ff 75 f4             	pushl  -0xc(%ebp)
c01073df:	e8 53 ec ff ff       	call   c0106037 <ptr_pte>
c01073e4:	83 c4 10             	add    $0x10,%esp
c01073e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01073ea:	83 ec 0c             	sub    $0xc,%esp
c01073ed:	68 b5 b7 10 c0       	push   $0xc010b7b5
c01073f2:	e8 e2 8c ff ff       	call   c01000d9 <disp_str>
c01073f7:	83 c4 10             	add    $0x10,%esp
c01073fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01073fd:	83 ec 0c             	sub    $0xc,%esp
c0107400:	50                   	push   %eax
c0107401:	e8 44 ff ff ff       	call   c010734a <disp_int>
c0107406:	83 c4 10             	add    $0x10,%esp
c0107409:	83 ec 0c             	sub    $0xc,%esp
c010740c:	68 ba b7 10 c0       	push   $0xc010b7ba
c0107411:	e8 c3 8c ff ff       	call   c01000d9 <disp_str>
c0107416:	83 c4 10             	add    $0x10,%esp
c0107419:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010741c:	8b 00                	mov    (%eax),%eax
c010741e:	83 ec 0c             	sub    $0xc,%esp
c0107421:	50                   	push   %eax
c0107422:	e8 23 ff ff ff       	call   c010734a <disp_int>
c0107427:	83 c4 10             	add    $0x10,%esp
c010742a:	83 ec 0c             	sub    $0xc,%esp
c010742d:	68 b3 b7 10 c0       	push   $0xc010b7b3
c0107432:	e8 a2 8c ff ff       	call   c01000d9 <disp_str>
c0107437:	83 c4 10             	add    $0x10,%esp
c010743a:	83 ec 0c             	sub    $0xc,%esp
c010743d:	68 c3 b7 10 c0       	push   $0xc010b7c3
c0107442:	e8 92 8c ff ff       	call   c01000d9 <disp_str>
c0107447:	83 c4 10             	add    $0x10,%esp
c010744a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010744d:	83 ec 0c             	sub    $0xc,%esp
c0107450:	50                   	push   %eax
c0107451:	e8 f4 fe ff ff       	call   c010734a <disp_int>
c0107456:	83 c4 10             	add    $0x10,%esp
c0107459:	83 ec 0c             	sub    $0xc,%esp
c010745c:	68 c8 b7 10 c0       	push   $0xc010b7c8
c0107461:	e8 73 8c ff ff       	call   c01000d9 <disp_str>
c0107466:	83 c4 10             	add    $0x10,%esp
c0107469:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010746c:	8b 00                	mov    (%eax),%eax
c010746e:	83 ec 0c             	sub    $0xc,%esp
c0107471:	50                   	push   %eax
c0107472:	e8 d3 fe ff ff       	call   c010734a <disp_int>
c0107477:	83 c4 10             	add    $0x10,%esp
c010747a:	83 ec 0c             	sub    $0xc,%esp
c010747d:	68 b3 b7 10 c0       	push   $0xc010b7b3
c0107482:	e8 52 8c ff ff       	call   c01000d9 <disp_str>
c0107487:	83 c4 10             	add    $0x10,%esp
c010748a:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0107491:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107494:	8b 00                	mov    (%eax),%eax
c0107496:	83 e0 01             	and    $0x1,%eax
c0107499:	85 c0                	test   %eax,%eax
c010749b:	74 09                	je     c01074a6 <do_page_fault+0x133>
c010749d:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c01074a4:	eb 07                	jmp    c01074ad <do_page_fault+0x13a>
c01074a6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01074ad:	90                   	nop
c01074ae:	c9                   	leave  
c01074af:	c3                   	ret    

c01074b0 <exception_handler>:
c01074b0:	55                   	push   %ebp
c01074b1:	89 e5                	mov    %esp,%ebp
c01074b3:	57                   	push   %edi
c01074b4:	56                   	push   %esi
c01074b5:	53                   	push   %ebx
c01074b6:	83 ec 6c             	sub    $0x6c,%esp
c01074b9:	8d 45 8c             	lea    -0x74(%ebp),%eax
c01074bc:	bb 40 ba 10 c0       	mov    $0xc010ba40,%ebx
c01074c1:	ba 13 00 00 00       	mov    $0x13,%edx
c01074c6:	89 c7                	mov    %eax,%edi
c01074c8:	89 de                	mov    %ebx,%esi
c01074ca:	89 d1                	mov    %edx,%ecx
c01074cc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01074ce:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01074d5:	eb 04                	jmp    c01074db <exception_handler+0x2b>
c01074d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01074db:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c01074e2:	7e f3                	jle    c01074d7 <exception_handler+0x27>
c01074e4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01074eb:	00 00 00 
c01074ee:	83 ec 0c             	sub    $0xc,%esp
c01074f1:	68 d1 b7 10 c0       	push   $0xc010b7d1
c01074f6:	e8 de 8b ff ff       	call   c01000d9 <disp_str>
c01074fb:	83 c4 10             	add    $0x10,%esp
c01074fe:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107505:	8b 45 08             	mov    0x8(%ebp),%eax
c0107508:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c010750c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010750f:	83 ec 0c             	sub    $0xc,%esp
c0107512:	ff 75 dc             	pushl  -0x24(%ebp)
c0107515:	e8 bf 8b ff ff       	call   c01000d9 <disp_str>
c010751a:	83 c4 10             	add    $0x10,%esp
c010751d:	83 ec 0c             	sub    $0xc,%esp
c0107520:	68 df b7 10 c0       	push   $0xc010b7df
c0107525:	e8 af 8b ff ff       	call   c01000d9 <disp_str>
c010752a:	83 c4 10             	add    $0x10,%esp
c010752d:	83 ec 0c             	sub    $0xc,%esp
c0107530:	68 e2 b7 10 c0       	push   $0xc010b7e2
c0107535:	e8 9f 8b ff ff       	call   c01000d9 <disp_str>
c010753a:	83 c4 10             	add    $0x10,%esp
c010753d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107540:	83 ec 0c             	sub    $0xc,%esp
c0107543:	50                   	push   %eax
c0107544:	e8 01 fe ff ff       	call   c010734a <disp_int>
c0107549:	83 c4 10             	add    $0x10,%esp
c010754c:	83 ec 0c             	sub    $0xc,%esp
c010754f:	68 df b7 10 c0       	push   $0xc010b7df
c0107554:	e8 80 8b ff ff       	call   c01000d9 <disp_str>
c0107559:	83 c4 10             	add    $0x10,%esp
c010755c:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107560:	74 2f                	je     c0107591 <exception_handler+0xe1>
c0107562:	83 ec 0c             	sub    $0xc,%esp
c0107565:	68 ea b7 10 c0       	push   $0xc010b7ea
c010756a:	e8 6a 8b ff ff       	call   c01000d9 <disp_str>
c010756f:	83 c4 10             	add    $0x10,%esp
c0107572:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107575:	83 ec 0c             	sub    $0xc,%esp
c0107578:	50                   	push   %eax
c0107579:	e8 cc fd ff ff       	call   c010734a <disp_int>
c010757e:	83 c4 10             	add    $0x10,%esp
c0107581:	83 ec 0c             	sub    $0xc,%esp
c0107584:	68 df b7 10 c0       	push   $0xc010b7df
c0107589:	e8 4b 8b ff ff       	call   c01000d9 <disp_str>
c010758e:	83 c4 10             	add    $0x10,%esp
c0107591:	83 ec 0c             	sub    $0xc,%esp
c0107594:	68 f4 b7 10 c0       	push   $0xc010b7f4
c0107599:	e8 3b 8b ff ff       	call   c01000d9 <disp_str>
c010759e:	83 c4 10             	add    $0x10,%esp
c01075a1:	83 ec 0c             	sub    $0xc,%esp
c01075a4:	ff 75 14             	pushl  0x14(%ebp)
c01075a7:	e8 9e fd ff ff       	call   c010734a <disp_int>
c01075ac:	83 c4 10             	add    $0x10,%esp
c01075af:	83 ec 0c             	sub    $0xc,%esp
c01075b2:	68 df b7 10 c0       	push   $0xc010b7df
c01075b7:	e8 1d 8b ff ff       	call   c01000d9 <disp_str>
c01075bc:	83 c4 10             	add    $0x10,%esp
c01075bf:	83 ec 0c             	sub    $0xc,%esp
c01075c2:	68 f8 b7 10 c0       	push   $0xc010b7f8
c01075c7:	e8 0d 8b ff ff       	call   c01000d9 <disp_str>
c01075cc:	83 c4 10             	add    $0x10,%esp
c01075cf:	8b 45 10             	mov    0x10(%ebp),%eax
c01075d2:	83 ec 0c             	sub    $0xc,%esp
c01075d5:	50                   	push   %eax
c01075d6:	e8 6f fd ff ff       	call   c010734a <disp_int>
c01075db:	83 c4 10             	add    $0x10,%esp
c01075de:	83 ec 0c             	sub    $0xc,%esp
c01075e1:	68 df b7 10 c0       	push   $0xc010b7df
c01075e6:	e8 ee 8a ff ff       	call   c01000d9 <disp_str>
c01075eb:	83 c4 10             	add    $0x10,%esp
c01075ee:	83 ec 0c             	sub    $0xc,%esp
c01075f1:	68 fd b7 10 c0       	push   $0xc010b7fd
c01075f6:	e8 de 8a ff ff       	call   c01000d9 <disp_str>
c01075fb:	83 c4 10             	add    $0x10,%esp
c01075fe:	83 ec 0c             	sub    $0xc,%esp
c0107601:	ff 75 18             	pushl  0x18(%ebp)
c0107604:	e8 41 fd ff ff       	call   c010734a <disp_int>
c0107609:	83 c4 10             	add    $0x10,%esp
c010760c:	83 ec 0c             	sub    $0xc,%esp
c010760f:	68 df b7 10 c0       	push   $0xc010b7df
c0107614:	e8 c0 8a ff ff       	call   c01000d9 <disp_str>
c0107619:	83 c4 10             	add    $0x10,%esp
c010761c:	83 ec 0c             	sub    $0xc,%esp
c010761f:	68 08 b8 10 c0       	push   $0xc010b808
c0107624:	e8 b0 8a ff ff       	call   c01000d9 <disp_str>
c0107629:	83 c4 10             	add    $0x10,%esp
c010762c:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0107630:	75 45                	jne    c0107677 <exception_handler+0x1c7>
c0107632:	0f 20 d0             	mov    %cr2,%eax
c0107635:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107638:	83 ec 0c             	sub    $0xc,%esp
c010763b:	68 27 b8 10 c0       	push   $0xc010b827
c0107640:	e8 94 8a ff ff       	call   c01000d9 <disp_str>
c0107645:	83 c4 10             	add    $0x10,%esp
c0107648:	83 ec 0c             	sub    $0xc,%esp
c010764b:	68 ae b7 10 c0       	push   $0xc010b7ae
c0107650:	e8 84 8a ff ff       	call   c01000d9 <disp_str>
c0107655:	83 c4 10             	add    $0x10,%esp
c0107658:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010765b:	83 ec 0c             	sub    $0xc,%esp
c010765e:	50                   	push   %eax
c010765f:	e8 e6 fc ff ff       	call   c010734a <disp_int>
c0107664:	83 c4 10             	add    $0x10,%esp
c0107667:	83 ec 0c             	sub    $0xc,%esp
c010766a:	68 b3 b7 10 c0       	push   $0xc010b7b3
c010766f:	e8 65 8a ff ff       	call   c01000d9 <disp_str>
c0107674:	83 c4 10             	add    $0x10,%esp
c0107677:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c010767b:	75 11                	jne    c010768e <exception_handler+0x1de>
c010767d:	83 ec 0c             	sub    $0xc,%esp
c0107680:	68 33 b8 10 c0       	push   $0xc010b833
c0107685:	e8 4f 8a ff ff       	call   c01000d9 <disp_str>
c010768a:	83 c4 10             	add    $0x10,%esp
c010768d:	90                   	nop
c010768e:	90                   	nop
c010768f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107692:	5b                   	pop    %ebx
c0107693:	5e                   	pop    %esi
c0107694:	5f                   	pop    %edi
c0107695:	5d                   	pop    %ebp
c0107696:	c3                   	ret    

c0107697 <init_internal_interrupt>:
c0107697:	55                   	push   %ebp
c0107698:	89 e5                	mov    %esp,%ebp
c010769a:	83 ec 08             	sub    $0x8,%esp
c010769d:	6a 0e                	push   $0xe
c010769f:	6a 08                	push   $0x8
c01076a1:	68 50 01 10 c0       	push   $0xc0100150
c01076a6:	6a 00                	push   $0x0
c01076a8:	e8 62 c7 ff ff       	call   c0103e0f <InitInterruptDesc>
c01076ad:	83 c4 10             	add    $0x10,%esp
c01076b0:	6a 0e                	push   $0xe
c01076b2:	6a 08                	push   $0x8
c01076b4:	68 56 01 10 c0       	push   $0xc0100156
c01076b9:	6a 01                	push   $0x1
c01076bb:	e8 4f c7 ff ff       	call   c0103e0f <InitInterruptDesc>
c01076c0:	83 c4 10             	add    $0x10,%esp
c01076c3:	6a 0e                	push   $0xe
c01076c5:	6a 08                	push   $0x8
c01076c7:	68 5c 01 10 c0       	push   $0xc010015c
c01076cc:	6a 02                	push   $0x2
c01076ce:	e8 3c c7 ff ff       	call   c0103e0f <InitInterruptDesc>
c01076d3:	83 c4 10             	add    $0x10,%esp
c01076d6:	6a 0e                	push   $0xe
c01076d8:	6a 08                	push   $0x8
c01076da:	68 62 01 10 c0       	push   $0xc0100162
c01076df:	6a 03                	push   $0x3
c01076e1:	e8 29 c7 ff ff       	call   c0103e0f <InitInterruptDesc>
c01076e6:	83 c4 10             	add    $0x10,%esp
c01076e9:	6a 0e                	push   $0xe
c01076eb:	6a 08                	push   $0x8
c01076ed:	68 68 01 10 c0       	push   $0xc0100168
c01076f2:	6a 04                	push   $0x4
c01076f4:	e8 16 c7 ff ff       	call   c0103e0f <InitInterruptDesc>
c01076f9:	83 c4 10             	add    $0x10,%esp
c01076fc:	6a 0e                	push   $0xe
c01076fe:	6a 08                	push   $0x8
c0107700:	68 6e 01 10 c0       	push   $0xc010016e
c0107705:	6a 05                	push   $0x5
c0107707:	e8 03 c7 ff ff       	call   c0103e0f <InitInterruptDesc>
c010770c:	83 c4 10             	add    $0x10,%esp
c010770f:	6a 0e                	push   $0xe
c0107711:	6a 08                	push   $0x8
c0107713:	68 74 01 10 c0       	push   $0xc0100174
c0107718:	6a 06                	push   $0x6
c010771a:	e8 f0 c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c010771f:	83 c4 10             	add    $0x10,%esp
c0107722:	6a 0e                	push   $0xe
c0107724:	6a 08                	push   $0x8
c0107726:	68 7a 01 10 c0       	push   $0xc010017a
c010772b:	6a 07                	push   $0x7
c010772d:	e8 dd c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c0107732:	83 c4 10             	add    $0x10,%esp
c0107735:	6a 0e                	push   $0xe
c0107737:	6a 08                	push   $0x8
c0107739:	68 80 01 10 c0       	push   $0xc0100180
c010773e:	6a 08                	push   $0x8
c0107740:	e8 ca c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c0107745:	83 c4 10             	add    $0x10,%esp
c0107748:	6a 0e                	push   $0xe
c010774a:	6a 08                	push   $0x8
c010774c:	68 84 01 10 c0       	push   $0xc0100184
c0107751:	6a 09                	push   $0x9
c0107753:	e8 b7 c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c0107758:	83 c4 10             	add    $0x10,%esp
c010775b:	6a 0e                	push   $0xe
c010775d:	6a 08                	push   $0x8
c010775f:	68 8a 01 10 c0       	push   $0xc010018a
c0107764:	6a 0a                	push   $0xa
c0107766:	e8 a4 c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c010776b:	83 c4 10             	add    $0x10,%esp
c010776e:	6a 0e                	push   $0xe
c0107770:	6a 08                	push   $0x8
c0107772:	68 8e 01 10 c0       	push   $0xc010018e
c0107777:	6a 0b                	push   $0xb
c0107779:	e8 91 c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c010777e:	83 c4 10             	add    $0x10,%esp
c0107781:	6a 0e                	push   $0xe
c0107783:	6a 08                	push   $0x8
c0107785:	68 92 01 10 c0       	push   $0xc0100192
c010778a:	6a 0c                	push   $0xc
c010778c:	e8 7e c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c0107791:	83 c4 10             	add    $0x10,%esp
c0107794:	6a 0e                	push   $0xe
c0107796:	6a 08                	push   $0x8
c0107798:	68 96 01 10 c0       	push   $0xc0100196
c010779d:	6a 0d                	push   $0xd
c010779f:	e8 6b c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c01077a4:	83 c4 10             	add    $0x10,%esp
c01077a7:	6a 0e                	push   $0xe
c01077a9:	6a 08                	push   $0x8
c01077ab:	68 a1 01 10 c0       	push   $0xc01001a1
c01077b0:	6a 0e                	push   $0xe
c01077b2:	e8 58 c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c01077b7:	83 c4 10             	add    $0x10,%esp
c01077ba:	6a 0e                	push   $0xe
c01077bc:	6a 08                	push   $0x8
c01077be:	68 a5 01 10 c0       	push   $0xc01001a5
c01077c3:	6a 10                	push   $0x10
c01077c5:	e8 45 c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c01077ca:	83 c4 10             	add    $0x10,%esp
c01077cd:	6a 0e                	push   $0xe
c01077cf:	6a 08                	push   $0x8
c01077d1:	68 ab 01 10 c0       	push   $0xc01001ab
c01077d6:	6a 11                	push   $0x11
c01077d8:	e8 32 c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c01077dd:	83 c4 10             	add    $0x10,%esp
c01077e0:	6a 0e                	push   $0xe
c01077e2:	6a 08                	push   $0x8
c01077e4:	68 af 01 10 c0       	push   $0xc01001af
c01077e9:	6a 12                	push   $0x12
c01077eb:	e8 1f c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c01077f0:	83 c4 10             	add    $0x10,%esp
c01077f3:	6a 0e                	push   $0xe
c01077f5:	6a 0e                	push   $0xe
c01077f7:	68 ba 02 10 c0       	push   $0xc01002ba
c01077fc:	68 90 00 00 00       	push   $0x90
c0107801:	e8 09 c6 ff ff       	call   c0103e0f <InitInterruptDesc>
c0107806:	83 c4 10             	add    $0x10,%esp
c0107809:	90                   	nop
c010780a:	c9                   	leave  
c010780b:	c3                   	ret    

c010780c <spurious_irq>:
c010780c:	55                   	push   %ebp
c010780d:	89 e5                	mov    %esp,%ebp
c010780f:	83 ec 08             	sub    $0x8,%esp
c0107812:	83 ec 08             	sub    $0x8,%esp
c0107815:	6a 0b                	push   $0xb
c0107817:	68 8c ba 10 c0       	push   $0xc010ba8c
c010781c:	e8 f3 88 ff ff       	call   c0100114 <disp_str_colour>
c0107821:	83 c4 10             	add    $0x10,%esp
c0107824:	83 ec 0c             	sub    $0xc,%esp
c0107827:	ff 75 08             	pushl  0x8(%ebp)
c010782a:	e8 1b fb ff ff       	call   c010734a <disp_int>
c010782f:	83 c4 10             	add    $0x10,%esp
c0107832:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107837:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010783d:	83 c0 01             	add    $0x1,%eax
c0107840:	83 d2 00             	adc    $0x0,%edx
c0107843:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107848:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010784e:	83 ec 0c             	sub    $0xc,%esp
c0107851:	68 a0 b6 10 c0       	push   $0xc010b6a0
c0107856:	e8 7e 88 ff ff       	call   c01000d9 <disp_str>
c010785b:	83 c4 10             	add    $0x10,%esp
c010785e:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107863:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107869:	83 ec 0c             	sub    $0xc,%esp
c010786c:	50                   	push   %eax
c010786d:	e8 d8 fa ff ff       	call   c010734a <disp_int>
c0107872:	83 c4 10             	add    $0x10,%esp
c0107875:	83 ec 0c             	sub    $0xc,%esp
c0107878:	68 a2 b6 10 c0       	push   $0xc010b6a2
c010787d:	e8 57 88 ff ff       	call   c01000d9 <disp_str>
c0107882:	83 c4 10             	add    $0x10,%esp
c0107885:	83 ec 08             	sub    $0x8,%esp
c0107888:	6a 0c                	push   $0xc
c010788a:	68 b4 ba 10 c0       	push   $0xc010bab4
c010788f:	e8 80 88 ff ff       	call   c0100114 <disp_str_colour>
c0107894:	83 c4 10             	add    $0x10,%esp
c0107897:	90                   	nop
c0107898:	c9                   	leave  
c0107899:	c3                   	ret    

c010789a <init_keyboard>:
c010789a:	55                   	push   %ebp
c010789b:	89 e5                	mov    %esp,%ebp
c010789d:	83 ec 08             	sub    $0x8,%esp
c01078a0:	83 ec 04             	sub    $0x4,%esp
c01078a3:	68 00 02 00 00       	push   $0x200
c01078a8:	6a 00                	push   $0x0
c01078aa:	68 ec fb 10 c0       	push   $0xc010fbec
c01078af:	e8 bb 49 00 00       	call   c010c26f <Memset>
c01078b4:	83 c4 10             	add    $0x10,%esp
c01078b7:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01078be:	fb 10 c0 
c01078c1:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01078c6:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01078cb:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c01078d2:	00 00 00 
c01078d5:	e8 4f d3 ff ff       	call   c0104c29 <init_keyboard_handler>
c01078da:	90                   	nop
c01078db:	c9                   	leave  
c01078dc:	c3                   	ret    

c01078dd <TestTTY>:
c01078dd:	55                   	push   %ebp
c01078de:	89 e5                	mov    %esp,%ebp
c01078e0:	83 ec 28             	sub    $0x28,%esp
c01078e3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01078ea:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01078f1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01078f7:	83 ec 08             	sub    $0x8,%esp
c01078fa:	6a 02                	push   $0x2
c01078fc:	8d 45 de             	lea    -0x22(%ebp),%eax
c01078ff:	50                   	push   %eax
c0107900:	e8 ca d4 ff ff       	call   c0104dcf <open>
c0107905:	83 c4 10             	add    $0x10,%esp
c0107908:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010790b:	83 ec 08             	sub    $0x8,%esp
c010790e:	6a 02                	push   $0x2
c0107910:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107913:	50                   	push   %eax
c0107914:	e8 b6 d4 ff ff       	call   c0104dcf <open>
c0107919:	83 c4 10             	add    $0x10,%esp
c010791c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010791f:	83 ec 0c             	sub    $0xc,%esp
c0107922:	68 d9 ba 10 c0       	push   $0xc010bad9
c0107927:	e8 ec 0e 00 00       	call   c0108818 <Printf>
c010792c:	83 c4 10             	add    $0x10,%esp
c010792f:	83 ec 0c             	sub    $0xc,%esp
c0107932:	6a 0a                	push   $0xa
c0107934:	e8 73 9f ff ff       	call   c01018ac <sys_malloc>
c0107939:	83 c4 10             	add    $0x10,%esp
c010793c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010793f:	83 ec 04             	sub    $0x4,%esp
c0107942:	6a 0a                	push   $0xa
c0107944:	6a 00                	push   $0x0
c0107946:	ff 75 ec             	pushl  -0x14(%ebp)
c0107949:	e8 21 49 00 00       	call   c010c26f <Memset>
c010794e:	83 c4 10             	add    $0x10,%esp
c0107951:	83 ec 04             	sub    $0x4,%esp
c0107954:	6a 0a                	push   $0xa
c0107956:	ff 75 ec             	pushl  -0x14(%ebp)
c0107959:	ff 75 f0             	pushl  -0x10(%ebp)
c010795c:	e8 03 d5 ff ff       	call   c0104e64 <read>
c0107961:	83 c4 10             	add    $0x10,%esp
c0107964:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107967:	83 ec 08             	sub    $0x8,%esp
c010796a:	ff 75 ec             	pushl  -0x14(%ebp)
c010796d:	68 eb ba 10 c0       	push   $0xc010baeb
c0107972:	e8 a1 0e 00 00       	call   c0108818 <Printf>
c0107977:	83 c4 10             	add    $0x10,%esp
c010797a:	eb c3                	jmp    c010793f <TestTTY+0x62>

c010797c <TestReadReturnValue>:
c010797c:	55                   	push   %ebp
c010797d:	89 e5                	mov    %esp,%ebp
c010797f:	81 ec 18 02 00 00    	sub    $0x218,%esp
c0107985:	c7 45 f4 f5 ba 10 c0 	movl   $0xc010baf5,-0xc(%ebp)
c010798c:	83 ec 08             	sub    $0x8,%esp
c010798f:	6a 00                	push   $0x0
c0107991:	ff 75 f4             	pushl  -0xc(%ebp)
c0107994:	e8 36 d4 ff ff       	call   c0104dcf <open>
c0107999:	83 c4 10             	add    $0x10,%esp
c010799c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010799f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01079a6:	83 ec 04             	sub    $0x4,%esp
c01079a9:	68 cb 00 00 00       	push   $0xcb
c01079ae:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01079b4:	50                   	push   %eax
c01079b5:	ff 75 f0             	pushl  -0x10(%ebp)
c01079b8:	e8 a7 d4 ff ff       	call   c0104e64 <read>
c01079bd:	83 c4 10             	add    $0x10,%esp
c01079c0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01079c3:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c01079ca:	74 1c                	je     c01079e8 <TestReadReturnValue+0x6c>
c01079cc:	68 08 02 00 00       	push   $0x208
c01079d1:	68 01 bb 10 c0       	push   $0xc010bb01
c01079d6:	68 01 bb 10 c0       	push   $0xc010bb01
c01079db:	68 11 bb 10 c0       	push   $0xc010bb11
c01079e0:	e8 90 11 00 00       	call   c0108b75 <assertion_failure>
c01079e5:	83 c4 10             	add    $0x10,%esp
c01079e8:	83 ec 0c             	sub    $0xc,%esp
c01079eb:	ff 75 f0             	pushl  -0x10(%ebp)
c01079ee:	e8 77 d6 ff ff       	call   c010506a <close>
c01079f3:	83 c4 10             	add    $0x10,%esp
c01079f6:	90                   	nop
c01079f7:	c9                   	leave  
c01079f8:	c3                   	ret    

c01079f9 <TestWriteReturnValue>:
c01079f9:	55                   	push   %ebp
c01079fa:	89 e5                	mov    %esp,%ebp
c01079fc:	81 ec 28 02 00 00    	sub    $0x228,%esp
c0107a02:	c7 45 f4 1c bb 10 c0 	movl   $0xc010bb1c,-0xc(%ebp)
c0107a09:	83 ec 08             	sub    $0x8,%esp
c0107a0c:	6a 07                	push   $0x7
c0107a0e:	ff 75 f4             	pushl  -0xc(%ebp)
c0107a11:	e8 b9 d3 ff ff       	call   c0104dcf <open>
c0107a16:	83 c4 10             	add    $0x10,%esp
c0107a19:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107a1c:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c0107a20:	75 1c                	jne    c0107a3e <TestWriteReturnValue+0x45>
c0107a22:	68 12 02 00 00       	push   $0x212
c0107a27:	68 01 bb 10 c0       	push   $0xc010bb01
c0107a2c:	68 01 bb 10 c0       	push   $0xc010bb01
c0107a31:	68 29 bb 10 c0       	push   $0xc010bb29
c0107a36:	e8 3a 11 00 00       	call   c0108b75 <assertion_failure>
c0107a3b:	83 c4 10             	add    $0x10,%esp
c0107a3e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107a45:	c7 45 e8 34 bb 10 c0 	movl   $0xc010bb34,-0x18(%ebp)
c0107a4c:	83 ec 0c             	sub    $0xc,%esp
c0107a4f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107a52:	e8 51 48 00 00       	call   c010c2a8 <Strlen>
c0107a57:	83 c4 10             	add    $0x10,%esp
c0107a5a:	83 ec 04             	sub    $0x4,%esp
c0107a5d:	50                   	push   %eax
c0107a5e:	ff 75 e8             	pushl  -0x18(%ebp)
c0107a61:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107a67:	50                   	push   %eax
c0107a68:	e8 ef f4 ff ff       	call   c0106f5c <Memcpy>
c0107a6d:	83 c4 10             	add    $0x10,%esp
c0107a70:	83 ec 04             	sub    $0x4,%esp
c0107a73:	68 ff 01 00 00       	push   $0x1ff
c0107a78:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107a7e:	50                   	push   %eax
c0107a7f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107a82:	e8 5e d5 ff ff       	call   c0104fe5 <write>
c0107a87:	83 c4 10             	add    $0x10,%esp
c0107a8a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107a8d:	83 ec 0c             	sub    $0xc,%esp
c0107a90:	ff 75 e8             	pushl  -0x18(%ebp)
c0107a93:	e8 10 48 00 00       	call   c010c2a8 <Strlen>
c0107a98:	83 c4 10             	add    $0x10,%esp
c0107a9b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0107a9e:	74 1c                	je     c0107abc <TestWriteReturnValue+0xc3>
c0107aa0:	68 1c 02 00 00       	push   $0x21c
c0107aa5:	68 01 bb 10 c0       	push   $0xc010bb01
c0107aaa:	68 01 bb 10 c0       	push   $0xc010bb01
c0107aaf:	68 67 bb 10 c0       	push   $0xc010bb67
c0107ab4:	e8 bc 10 00 00       	call   c0108b75 <assertion_failure>
c0107ab9:	83 c4 10             	add    $0x10,%esp
c0107abc:	83 ec 0c             	sub    $0xc,%esp
c0107abf:	ff 75 f0             	pushl  -0x10(%ebp)
c0107ac2:	e8 a3 d5 ff ff       	call   c010506a <close>
c0107ac7:	83 c4 10             	add    $0x10,%esp
c0107aca:	90                   	nop
c0107acb:	c9                   	leave  
c0107acc:	c3                   	ret    

c0107acd <TestFS2>:
c0107acd:	55                   	push   %ebp
c0107ace:	89 e5                	mov    %esp,%ebp
c0107ad0:	83 ec 08             	sub    $0x8,%esp
c0107ad3:	e8 21 ff ff ff       	call   c01079f9 <TestWriteReturnValue>
c0107ad8:	90                   	nop
c0107ad9:	c9                   	leave  
c0107ada:	c3                   	ret    

c0107adb <TestFS>:
c0107adb:	55                   	push   %ebp
c0107adc:	89 e5                	mov    %esp,%ebp
c0107ade:	57                   	push   %edi
c0107adf:	56                   	push   %esi
c0107ae0:	53                   	push   %ebx
c0107ae1:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c0107ae7:	83 ec 0c             	sub    $0xc,%esp
c0107aea:	68 7a bb 10 c0       	push   $0xc010bb7a
c0107aef:	e8 e5 85 ff ff       	call   c01000d9 <disp_str>
c0107af4:	83 c4 10             	add    $0x10,%esp
c0107af7:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c0107afe:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107b05:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c0107b0b:	83 ec 08             	sub    $0x8,%esp
c0107b0e:	6a 02                	push   $0x2
c0107b10:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107b13:	50                   	push   %eax
c0107b14:	e8 b6 d2 ff ff       	call   c0104dcf <open>
c0107b19:	83 c4 10             	add    $0x10,%esp
c0107b1c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107b1f:	83 ec 08             	sub    $0x8,%esp
c0107b22:	6a 02                	push   $0x2
c0107b24:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107b27:	50                   	push   %eax
c0107b28:	e8 a2 d2 ff ff       	call   c0104dcf <open>
c0107b2d:	83 c4 10             	add    $0x10,%esp
c0107b30:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107b33:	83 ec 0c             	sub    $0xc,%esp
c0107b36:	68 d9 ba 10 c0       	push   $0xc010bad9
c0107b3b:	e8 d8 0c 00 00       	call   c0108818 <Printf>
c0107b40:	83 c4 10             	add    $0x10,%esp
c0107b43:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c0107b4a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c0107b4e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c0107b55:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c0107b59:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c0107b60:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c0107b67:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c0107b6d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c0107b74:	83 ec 0c             	sub    $0xc,%esp
c0107b77:	68 82 bb 10 c0       	push   $0xc010bb82
c0107b7c:	e8 97 0c 00 00       	call   c0108818 <Printf>
c0107b81:	83 c4 10             	add    $0x10,%esp
c0107b84:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c0107b88:	0f 85 e6 03 00 00    	jne    c0107f74 <TestFS+0x499>
c0107b8e:	83 ec 08             	sub    $0x8,%esp
c0107b91:	6a 07                	push   $0x7
c0107b93:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107b96:	50                   	push   %eax
c0107b97:	e8 33 d2 ff ff       	call   c0104dcf <open>
c0107b9c:	83 c4 10             	add    $0x10,%esp
c0107b9f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107ba2:	83 ec 08             	sub    $0x8,%esp
c0107ba5:	ff 75 d0             	pushl  -0x30(%ebp)
c0107ba8:	68 9a bb 10 c0       	push   $0xc010bb9a
c0107bad:	e8 66 0c 00 00       	call   c0108818 <Printf>
c0107bb2:	83 c4 10             	add    $0x10,%esp
c0107bb5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107bbc:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107bc3:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c0107bca:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107bd1:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107bd8:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c0107bdf:	83 ec 0c             	sub    $0xc,%esp
c0107be2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107be5:	50                   	push   %eax
c0107be6:	e8 bd 46 00 00       	call   c010c2a8 <Strlen>
c0107beb:	83 c4 10             	add    $0x10,%esp
c0107bee:	83 ec 04             	sub    $0x4,%esp
c0107bf1:	50                   	push   %eax
c0107bf2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107bf5:	50                   	push   %eax
c0107bf6:	ff 75 d0             	pushl  -0x30(%ebp)
c0107bf9:	e8 e7 d3 ff ff       	call   c0104fe5 <write>
c0107bfe:	83 c4 10             	add    $0x10,%esp
c0107c01:	83 ec 0c             	sub    $0xc,%esp
c0107c04:	ff 75 d0             	pushl  -0x30(%ebp)
c0107c07:	e8 5e d4 ff ff       	call   c010506a <close>
c0107c0c:	83 c4 10             	add    $0x10,%esp
c0107c0f:	83 ec 08             	sub    $0x8,%esp
c0107c12:	6a 00                	push   $0x0
c0107c14:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107c17:	50                   	push   %eax
c0107c18:	e8 b2 d1 ff ff       	call   c0104dcf <open>
c0107c1d:	83 c4 10             	add    $0x10,%esp
c0107c20:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107c23:	83 ec 04             	sub    $0x4,%esp
c0107c26:	6a 14                	push   $0x14
c0107c28:	6a 00                	push   $0x0
c0107c2a:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107c30:	50                   	push   %eax
c0107c31:	e8 39 46 00 00       	call   c010c26f <Memset>
c0107c36:	83 c4 10             	add    $0x10,%esp
c0107c39:	83 ec 04             	sub    $0x4,%esp
c0107c3c:	6a 12                	push   $0x12
c0107c3e:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107c44:	50                   	push   %eax
c0107c45:	ff 75 d0             	pushl  -0x30(%ebp)
c0107c48:	e8 17 d2 ff ff       	call   c0104e64 <read>
c0107c4d:	83 c4 10             	add    $0x10,%esp
c0107c50:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107c53:	83 ec 08             	sub    $0x8,%esp
c0107c56:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107c5c:	50                   	push   %eax
c0107c5d:	68 a3 bb 10 c0       	push   $0xc010bba3
c0107c62:	e8 b1 0b 00 00       	call   c0108818 <Printf>
c0107c67:	83 c4 10             	add    $0x10,%esp
c0107c6a:	83 ec 0c             	sub    $0xc,%esp
c0107c6d:	6a 0a                	push   $0xa
c0107c6f:	e8 70 0a 00 00       	call   c01086e4 <delay>
c0107c74:	83 c4 10             	add    $0x10,%esp
c0107c77:	83 ec 08             	sub    $0x8,%esp
c0107c7a:	6a 07                	push   $0x7
c0107c7c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107c7f:	50                   	push   %eax
c0107c80:	e8 4a d1 ff ff       	call   c0104dcf <open>
c0107c85:	83 c4 10             	add    $0x10,%esp
c0107c88:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107c8b:	83 ec 08             	sub    $0x8,%esp
c0107c8e:	ff 75 c8             	pushl  -0x38(%ebp)
c0107c91:	68 ae bb 10 c0       	push   $0xc010bbae
c0107c96:	e8 7d 0b 00 00       	call   c0108818 <Printf>
c0107c9b:	83 c4 10             	add    $0x10,%esp
c0107c9e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107ca5:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107cab:	bb e4 bb 10 c0       	mov    $0xc010bbe4,%ebx
c0107cb0:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107cb5:	8b 0b                	mov    (%ebx),%ecx
c0107cb7:	89 08                	mov    %ecx,(%eax)
c0107cb9:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107cbd:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107cc1:	8d 78 04             	lea    0x4(%eax),%edi
c0107cc4:	83 e7 fc             	and    $0xfffffffc,%edi
c0107cc7:	29 f8                	sub    %edi,%eax
c0107cc9:	29 c3                	sub    %eax,%ebx
c0107ccb:	01 c2                	add    %eax,%edx
c0107ccd:	83 e2 fc             	and    $0xfffffffc,%edx
c0107cd0:	89 d0                	mov    %edx,%eax
c0107cd2:	c1 e8 02             	shr    $0x2,%eax
c0107cd5:	89 de                	mov    %ebx,%esi
c0107cd7:	89 c1                	mov    %eax,%ecx
c0107cd9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107cdb:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107ce2:	00 00 00 
c0107ce5:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107cec:	00 00 00 
c0107cef:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107cf6:	83 ec 0c             	sub    $0xc,%esp
c0107cf9:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107cff:	50                   	push   %eax
c0107d00:	e8 a3 45 00 00       	call   c010c2a8 <Strlen>
c0107d05:	83 c4 10             	add    $0x10,%esp
c0107d08:	83 ec 04             	sub    $0x4,%esp
c0107d0b:	50                   	push   %eax
c0107d0c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107d12:	50                   	push   %eax
c0107d13:	ff 75 c8             	pushl  -0x38(%ebp)
c0107d16:	e8 ca d2 ff ff       	call   c0104fe5 <write>
c0107d1b:	83 c4 10             	add    $0x10,%esp
c0107d1e:	83 ec 0c             	sub    $0xc,%esp
c0107d21:	ff 75 c8             	pushl  -0x38(%ebp)
c0107d24:	e8 41 d3 ff ff       	call   c010506a <close>
c0107d29:	83 c4 10             	add    $0x10,%esp
c0107d2c:	83 ec 08             	sub    $0x8,%esp
c0107d2f:	6a 00                	push   $0x0
c0107d31:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107d34:	50                   	push   %eax
c0107d35:	e8 95 d0 ff ff       	call   c0104dcf <open>
c0107d3a:	83 c4 10             	add    $0x10,%esp
c0107d3d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107d40:	83 ec 04             	sub    $0x4,%esp
c0107d43:	68 c8 00 00 00       	push   $0xc8
c0107d48:	6a 00                	push   $0x0
c0107d4a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107d50:	50                   	push   %eax
c0107d51:	e8 19 45 00 00       	call   c010c26f <Memset>
c0107d56:	83 c4 10             	add    $0x10,%esp
c0107d59:	83 ec 0c             	sub    $0xc,%esp
c0107d5c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107d62:	50                   	push   %eax
c0107d63:	e8 40 45 00 00       	call   c010c2a8 <Strlen>
c0107d68:	83 c4 10             	add    $0x10,%esp
c0107d6b:	83 ec 04             	sub    $0x4,%esp
c0107d6e:	50                   	push   %eax
c0107d6f:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107d75:	50                   	push   %eax
c0107d76:	ff 75 c8             	pushl  -0x38(%ebp)
c0107d79:	e8 e6 d0 ff ff       	call   c0104e64 <read>
c0107d7e:	83 c4 10             	add    $0x10,%esp
c0107d81:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107d84:	83 ec 08             	sub    $0x8,%esp
c0107d87:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107d8d:	50                   	push   %eax
c0107d8e:	68 b8 bb 10 c0       	push   $0xc010bbb8
c0107d93:	e8 80 0a 00 00       	call   c0108818 <Printf>
c0107d98:	83 c4 10             	add    $0x10,%esp
c0107d9b:	83 ec 08             	sub    $0x8,%esp
c0107d9e:	6a 07                	push   $0x7
c0107da0:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107da3:	50                   	push   %eax
c0107da4:	e8 26 d0 ff ff       	call   c0104dcf <open>
c0107da9:	83 c4 10             	add    $0x10,%esp
c0107dac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107daf:	83 ec 08             	sub    $0x8,%esp
c0107db2:	ff 75 c8             	pushl  -0x38(%ebp)
c0107db5:	68 ae bb 10 c0       	push   $0xc010bbae
c0107dba:	e8 59 0a 00 00       	call   c0108818 <Printf>
c0107dbf:	83 c4 10             	add    $0x10,%esp
c0107dc2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107dc9:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107dd0:	20 77 69 
c0107dd3:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107dda:	6c 20 73 
c0107ddd:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107de4:	63 63 65 
c0107de7:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107dee:	73 20 61 
c0107df1:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107df8:	20 6c 61 
c0107dfb:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107e02:	74 2e 00 
c0107e05:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107e0c:	00 00 00 
c0107e0f:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107e16:	00 00 
c0107e18:	83 ec 0c             	sub    $0xc,%esp
c0107e1b:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107e21:	50                   	push   %eax
c0107e22:	e8 81 44 00 00       	call   c010c2a8 <Strlen>
c0107e27:	83 c4 10             	add    $0x10,%esp
c0107e2a:	83 ec 04             	sub    $0x4,%esp
c0107e2d:	50                   	push   %eax
c0107e2e:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107e34:	50                   	push   %eax
c0107e35:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107e38:	e8 a8 d1 ff ff       	call   c0104fe5 <write>
c0107e3d:	83 c4 10             	add    $0x10,%esp
c0107e40:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107e47:	eb 7e                	jmp    c0107ec7 <TestFS+0x3ec>
c0107e49:	83 ec 0c             	sub    $0xc,%esp
c0107e4c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107e4f:	e8 16 d2 ff ff       	call   c010506a <close>
c0107e54:	83 c4 10             	add    $0x10,%esp
c0107e57:	83 ec 08             	sub    $0x8,%esp
c0107e5a:	6a 00                	push   $0x0
c0107e5c:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107e5f:	50                   	push   %eax
c0107e60:	e8 6a cf ff ff       	call   c0104dcf <open>
c0107e65:	83 c4 10             	add    $0x10,%esp
c0107e68:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107e6b:	83 ec 04             	sub    $0x4,%esp
c0107e6e:	6a 1e                	push   $0x1e
c0107e70:	6a 00                	push   $0x0
c0107e72:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107e78:	50                   	push   %eax
c0107e79:	e8 f1 43 00 00       	call   c010c26f <Memset>
c0107e7e:	83 c4 10             	add    $0x10,%esp
c0107e81:	83 ec 0c             	sub    $0xc,%esp
c0107e84:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107e8a:	50                   	push   %eax
c0107e8b:	e8 18 44 00 00       	call   c010c2a8 <Strlen>
c0107e90:	83 c4 10             	add    $0x10,%esp
c0107e93:	83 ec 04             	sub    $0x4,%esp
c0107e96:	50                   	push   %eax
c0107e97:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107e9d:	50                   	push   %eax
c0107e9e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107ea1:	e8 be cf ff ff       	call   c0104e64 <read>
c0107ea6:	83 c4 10             	add    $0x10,%esp
c0107ea9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107eac:	83 ec 08             	sub    $0x8,%esp
c0107eaf:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107eb5:	50                   	push   %eax
c0107eb6:	68 c3 bb 10 c0       	push   $0xc010bbc3
c0107ebb:	e8 58 09 00 00       	call   c0108818 <Printf>
c0107ec0:	83 c4 10             	add    $0x10,%esp
c0107ec3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107ec7:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107ecb:	0f 8e 78 ff ff ff    	jle    c0107e49 <TestFS+0x36e>
c0107ed1:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107ed8:	6e 73 74 
c0107edb:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107ee2:	6c 6c 2e 
c0107ee5:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107eec:	61 72 00 
c0107eef:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107ef6:	00 00 00 
c0107ef9:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107f00:	00 00 00 
c0107f03:	83 ec 08             	sub    $0x8,%esp
c0107f06:	6a 00                	push   $0x0
c0107f08:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107f0e:	50                   	push   %eax
c0107f0f:	e8 bb ce ff ff       	call   c0104dcf <open>
c0107f14:	83 c4 10             	add    $0x10,%esp
c0107f17:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107f1a:	83 ec 08             	sub    $0x8,%esp
c0107f1d:	ff 75 bc             	pushl  -0x44(%ebp)
c0107f20:	68 ce bb 10 c0       	push   $0xc010bbce
c0107f25:	e8 ee 08 00 00       	call   c0108818 <Printf>
c0107f2a:	83 c4 10             	add    $0x10,%esp
c0107f2d:	83 ec 04             	sub    $0x4,%esp
c0107f30:	6a 28                	push   $0x28
c0107f32:	6a 00                	push   $0x0
c0107f34:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107f3a:	50                   	push   %eax
c0107f3b:	e8 2f 43 00 00       	call   c010c26f <Memset>
c0107f40:	83 c4 10             	add    $0x10,%esp
c0107f43:	83 ec 04             	sub    $0x4,%esp
c0107f46:	6a 28                	push   $0x28
c0107f48:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107f4e:	50                   	push   %eax
c0107f4f:	ff 75 bc             	pushl  -0x44(%ebp)
c0107f52:	e8 0d cf ff ff       	call   c0104e64 <read>
c0107f57:	83 c4 10             	add    $0x10,%esp
c0107f5a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107f5d:	83 ec 08             	sub    $0x8,%esp
c0107f60:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107f66:	50                   	push   %eax
c0107f67:	68 d8 bb 10 c0       	push   $0xc010bbd8
c0107f6c:	e8 a7 08 00 00       	call   c0108818 <Printf>
c0107f71:	83 c4 10             	add    $0x10,%esp
c0107f74:	90                   	nop
c0107f75:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107f78:	5b                   	pop    %ebx
c0107f79:	5e                   	pop    %esi
c0107f7a:	5f                   	pop    %edi
c0107f7b:	5d                   	pop    %ebp
c0107f7c:	c3                   	ret    

c0107f7d <wait_exit>:
c0107f7d:	55                   	push   %ebp
c0107f7e:	89 e5                	mov    %esp,%ebp
c0107f80:	83 ec 28             	sub    $0x28,%esp
c0107f83:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107f8a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107f91:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107f97:	83 ec 08             	sub    $0x8,%esp
c0107f9a:	6a 02                	push   $0x2
c0107f9c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107f9f:	50                   	push   %eax
c0107fa0:	e8 2a ce ff ff       	call   c0104dcf <open>
c0107fa5:	83 c4 10             	add    $0x10,%esp
c0107fa8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107fab:	83 ec 08             	sub    $0x8,%esp
c0107fae:	6a 02                	push   $0x2
c0107fb0:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107fb3:	50                   	push   %eax
c0107fb4:	e8 16 ce ff ff       	call   c0104dcf <open>
c0107fb9:	83 c4 10             	add    $0x10,%esp
c0107fbc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107fbf:	e8 6b d1 ff ff       	call   c010512f <fork>
c0107fc4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107fc7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107fcb:	7e 35                	jle    c0108002 <wait_exit+0x85>
c0107fcd:	83 ec 0c             	sub    $0xc,%esp
c0107fd0:	68 ac bc 10 c0       	push   $0xc010bcac
c0107fd5:	e8 3e 08 00 00       	call   c0108818 <Printf>
c0107fda:	83 c4 10             	add    $0x10,%esp
c0107fdd:	83 ec 0c             	sub    $0xc,%esp
c0107fe0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107fe3:	50                   	push   %eax
c0107fe4:	e8 d3 d0 ff ff       	call   c01050bc <wait>
c0107fe9:	83 c4 10             	add    $0x10,%esp
c0107fec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107fef:	83 ec 08             	sub    $0x8,%esp
c0107ff2:	50                   	push   %eax
c0107ff3:	68 c4 bc 10 c0       	push   $0xc010bcc4
c0107ff8:	e8 1b 08 00 00       	call   c0108818 <Printf>
c0107ffd:	83 c4 10             	add    $0x10,%esp
c0108000:	eb fe                	jmp    c0108000 <wait_exit+0x83>
c0108002:	83 ec 0c             	sub    $0xc,%esp
c0108005:	68 df bc 10 c0       	push   $0xc010bcdf
c010800a:	e8 09 08 00 00       	call   c0108818 <Printf>
c010800f:	83 c4 10             	add    $0x10,%esp
c0108012:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108019:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010801c:	8d 50 01             	lea    0x1(%eax),%edx
c010801f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0108022:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0108027:	7f 02                	jg     c010802b <wait_exit+0xae>
c0108029:	eb ee                	jmp    c0108019 <wait_exit+0x9c>
c010802b:	90                   	nop
c010802c:	83 ec 0c             	sub    $0xc,%esp
c010802f:	68 eb bc 10 c0       	push   $0xc010bceb
c0108034:	e8 df 07 00 00       	call   c0108818 <Printf>
c0108039:	83 c4 10             	add    $0x10,%esp
c010803c:	83 ec 0c             	sub    $0xc,%esp
c010803f:	68 f9 bc 10 c0       	push   $0xc010bcf9
c0108044:	e8 cf 07 00 00       	call   c0108818 <Printf>
c0108049:	83 c4 10             	add    $0x10,%esp
c010804c:	83 ec 0c             	sub    $0xc,%esp
c010804f:	68 08 bd 10 c0       	push   $0xc010bd08
c0108054:	e8 bf 07 00 00       	call   c0108818 <Printf>
c0108059:	83 c4 10             	add    $0x10,%esp
c010805c:	83 ec 0c             	sub    $0xc,%esp
c010805f:	6a 5a                	push   $0x5a
c0108061:	e8 9a d0 ff ff       	call   c0105100 <exit>
c0108066:	83 c4 10             	add    $0x10,%esp
c0108069:	83 ec 0c             	sub    $0xc,%esp
c010806c:	68 17 bd 10 c0       	push   $0xc010bd17
c0108071:	e8 a2 07 00 00       	call   c0108818 <Printf>
c0108076:	83 c4 10             	add    $0x10,%esp
c0108079:	eb fe                	jmp    c0108079 <wait_exit+0xfc>

c010807b <INIT_fork>:
c010807b:	55                   	push   %ebp
c010807c:	89 e5                	mov    %esp,%ebp
c010807e:	83 ec 78             	sub    $0x78,%esp
c0108081:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0108088:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c010808f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0108095:	83 ec 08             	sub    $0x8,%esp
c0108098:	6a 02                	push   $0x2
c010809a:	8d 45 de             	lea    -0x22(%ebp),%eax
c010809d:	50                   	push   %eax
c010809e:	e8 2c cd ff ff       	call   c0104dcf <open>
c01080a3:	83 c4 10             	add    $0x10,%esp
c01080a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01080a9:	83 ec 08             	sub    $0x8,%esp
c01080ac:	6a 02                	push   $0x2
c01080ae:	8d 45 de             	lea    -0x22(%ebp),%eax
c01080b1:	50                   	push   %eax
c01080b2:	e8 18 cd ff ff       	call   c0104dcf <open>
c01080b7:	83 c4 10             	add    $0x10,%esp
c01080ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01080bd:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c01080c4:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c01080cb:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c01080d2:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c01080d9:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c01080e0:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c01080e7:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c01080ee:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c01080f5:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c01080fc:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0108103:	83 ec 0c             	sub    $0xc,%esp
c0108106:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108109:	50                   	push   %eax
c010810a:	e8 09 07 00 00       	call   c0108818 <Printf>
c010810f:	83 c4 10             	add    $0x10,%esp
c0108112:	83 ec 0c             	sub    $0xc,%esp
c0108115:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108118:	50                   	push   %eax
c0108119:	e8 8a 41 00 00       	call   c010c2a8 <Strlen>
c010811e:	83 c4 10             	add    $0x10,%esp
c0108121:	83 ec 04             	sub    $0x4,%esp
c0108124:	50                   	push   %eax
c0108125:	6a 00                	push   $0x0
c0108127:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010812a:	50                   	push   %eax
c010812b:	e8 3f 41 00 00       	call   c010c26f <Memset>
c0108130:	83 c4 10             	add    $0x10,%esp
c0108133:	83 ec 04             	sub    $0x4,%esp
c0108136:	6a 28                	push   $0x28
c0108138:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010813b:	50                   	push   %eax
c010813c:	ff 75 f0             	pushl  -0x10(%ebp)
c010813f:	e8 20 cd ff ff       	call   c0104e64 <read>
c0108144:	83 c4 10             	add    $0x10,%esp
c0108147:	83 ec 0c             	sub    $0xc,%esp
c010814a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c010814d:	50                   	push   %eax
c010814e:	e8 c5 06 00 00       	call   c0108818 <Printf>
c0108153:	83 c4 10             	add    $0x10,%esp
c0108156:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010815d:	e8 cd cf ff ff       	call   c010512f <fork>
c0108162:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108165:	83 ec 0c             	sub    $0xc,%esp
c0108168:	6a 01                	push   $0x1
c010816a:	e8 75 05 00 00       	call   c01086e4 <delay>
c010816f:	83 c4 10             	add    $0x10,%esp
c0108172:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108176:	0f 8e cd 00 00 00    	jle    c0108249 <INIT_fork+0x1ce>
c010817c:	83 ec 08             	sub    $0x8,%esp
c010817f:	ff 75 e8             	pushl  -0x18(%ebp)
c0108182:	68 25 bd 10 c0       	push   $0xc010bd25
c0108187:	e8 8c 06 00 00       	call   c0108818 <Printf>
c010818c:	83 c4 10             	add    $0x10,%esp
c010818f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0108193:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c010819a:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c01081a1:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c01081a8:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c01081af:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c01081b6:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c01081bd:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c01081c4:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c01081cb:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c01081d2:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c01081d9:	83 ec 0c             	sub    $0xc,%esp
c01081dc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01081df:	50                   	push   %eax
c01081e0:	e8 c3 40 00 00       	call   c010c2a8 <Strlen>
c01081e5:	83 c4 10             	add    $0x10,%esp
c01081e8:	83 ec 04             	sub    $0x4,%esp
c01081eb:	50                   	push   %eax
c01081ec:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01081ef:	50                   	push   %eax
c01081f0:	ff 75 f4             	pushl  -0xc(%ebp)
c01081f3:	e8 ed cd ff ff       	call   c0104fe5 <write>
c01081f8:	83 c4 10             	add    $0x10,%esp
c01081fb:	e8 b2 ec ff ff       	call   c0106eb2 <catch_error>
c0108200:	83 ec 0c             	sub    $0xc,%esp
c0108203:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108206:	50                   	push   %eax
c0108207:	e8 9c 40 00 00       	call   c010c2a8 <Strlen>
c010820c:	83 c4 10             	add    $0x10,%esp
c010820f:	83 ec 04             	sub    $0x4,%esp
c0108212:	50                   	push   %eax
c0108213:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108216:	50                   	push   %eax
c0108217:	ff 75 f4             	pushl  -0xc(%ebp)
c010821a:	e8 c6 cd ff ff       	call   c0104fe5 <write>
c010821f:	83 c4 10             	add    $0x10,%esp
c0108222:	83 ec 0c             	sub    $0xc,%esp
c0108225:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108228:	50                   	push   %eax
c0108229:	e8 7a 40 00 00       	call   c010c2a8 <Strlen>
c010822e:	83 c4 10             	add    $0x10,%esp
c0108231:	83 ec 04             	sub    $0x4,%esp
c0108234:	50                   	push   %eax
c0108235:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108238:	50                   	push   %eax
c0108239:	ff 75 f4             	pushl  -0xc(%ebp)
c010823c:	e8 a4 cd ff ff       	call   c0104fe5 <write>
c0108241:	83 c4 10             	add    $0x10,%esp
c0108244:	e9 d6 00 00 00       	jmp    c010831f <INIT_fork+0x2a4>
c0108249:	83 ec 08             	sub    $0x8,%esp
c010824c:	ff 75 e8             	pushl  -0x18(%ebp)
c010824f:	68 25 bd 10 c0       	push   $0xc010bd25
c0108254:	e8 bf 05 00 00       	call   c0108818 <Printf>
c0108259:	83 c4 10             	add    $0x10,%esp
c010825c:	83 ec 0c             	sub    $0xc,%esp
c010825f:	6a 01                	push   $0x1
c0108261:	e8 7e 04 00 00       	call   c01086e4 <delay>
c0108266:	83 c4 10             	add    $0x10,%esp
c0108269:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010826d:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0108271:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0108278:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c010827f:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0108286:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c010828d:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0108294:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c010829b:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c01082a2:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c01082a9:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c01082b0:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c01082b7:	83 ec 0c             	sub    $0xc,%esp
c01082ba:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082bd:	50                   	push   %eax
c01082be:	e8 e5 3f 00 00       	call   c010c2a8 <Strlen>
c01082c3:	83 c4 10             	add    $0x10,%esp
c01082c6:	83 ec 04             	sub    $0x4,%esp
c01082c9:	50                   	push   %eax
c01082ca:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082cd:	50                   	push   %eax
c01082ce:	ff 75 f4             	pushl  -0xc(%ebp)
c01082d1:	e8 0f cd ff ff       	call   c0104fe5 <write>
c01082d6:	83 c4 10             	add    $0x10,%esp
c01082d9:	83 ec 0c             	sub    $0xc,%esp
c01082dc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082df:	50                   	push   %eax
c01082e0:	e8 c3 3f 00 00       	call   c010c2a8 <Strlen>
c01082e5:	83 c4 10             	add    $0x10,%esp
c01082e8:	83 ec 04             	sub    $0x4,%esp
c01082eb:	50                   	push   %eax
c01082ec:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01082ef:	50                   	push   %eax
c01082f0:	ff 75 f4             	pushl  -0xc(%ebp)
c01082f3:	e8 ed cc ff ff       	call   c0104fe5 <write>
c01082f8:	83 c4 10             	add    $0x10,%esp
c01082fb:	83 ec 0c             	sub    $0xc,%esp
c01082fe:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108301:	50                   	push   %eax
c0108302:	e8 a1 3f 00 00       	call   c010c2a8 <Strlen>
c0108307:	83 c4 10             	add    $0x10,%esp
c010830a:	83 ec 04             	sub    $0x4,%esp
c010830d:	50                   	push   %eax
c010830e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108311:	50                   	push   %eax
c0108312:	ff 75 f4             	pushl  -0xc(%ebp)
c0108315:	e8 cb cc ff ff       	call   c0104fe5 <write>
c010831a:	83 c4 10             	add    $0x10,%esp
c010831d:	eb fe                	jmp    c010831d <INIT_fork+0x2a2>
c010831f:	83 ec 04             	sub    $0x4,%esp
c0108322:	6a 28                	push   $0x28
c0108324:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108327:	50                   	push   %eax
c0108328:	ff 75 f0             	pushl  -0x10(%ebp)
c010832b:	e8 34 cb ff ff       	call   c0104e64 <read>
c0108330:	83 c4 10             	add    $0x10,%esp
c0108333:	83 ec 0c             	sub    $0xc,%esp
c0108336:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108339:	50                   	push   %eax
c010833a:	e8 d9 04 00 00       	call   c0108818 <Printf>
c010833f:	83 c4 10             	add    $0x10,%esp
c0108342:	83 ec 0c             	sub    $0xc,%esp
c0108345:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108348:	50                   	push   %eax
c0108349:	e8 ca 04 00 00       	call   c0108818 <Printf>
c010834e:	83 c4 10             	add    $0x10,%esp
c0108351:	83 ec 0c             	sub    $0xc,%esp
c0108354:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108357:	50                   	push   %eax
c0108358:	e8 bb 04 00 00       	call   c0108818 <Printf>
c010835d:	83 c4 10             	add    $0x10,%esp
c0108360:	83 ec 0c             	sub    $0xc,%esp
c0108363:	68 2f bd 10 c0       	push   $0xc010bd2f
c0108368:	e8 c4 07 00 00       	call   c0108b31 <spin>
c010836d:	83 c4 10             	add    $0x10,%esp
c0108370:	90                   	nop
c0108371:	c9                   	leave  
c0108372:	c3                   	ret    

c0108373 <simple_shell>:
c0108373:	55                   	push   %ebp
c0108374:	89 e5                	mov    %esp,%ebp
c0108376:	57                   	push   %edi
c0108377:	83 ec 64             	sub    $0x64,%esp
c010837a:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0108381:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0108388:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c010838e:	83 ec 08             	sub    $0x8,%esp
c0108391:	6a 02                	push   $0x2
c0108393:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108396:	50                   	push   %eax
c0108397:	e8 33 ca ff ff       	call   c0104dcf <open>
c010839c:	83 c4 10             	add    $0x10,%esp
c010839f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01083a2:	83 ec 08             	sub    $0x8,%esp
c01083a5:	6a 02                	push   $0x2
c01083a7:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01083aa:	50                   	push   %eax
c01083ab:	e8 1f ca ff ff       	call   c0104dcf <open>
c01083b0:	83 c4 10             	add    $0x10,%esp
c01083b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01083b6:	8d 55 a8             	lea    -0x58(%ebp),%edx
c01083b9:	b8 00 00 00 00       	mov    $0x0,%eax
c01083be:	b9 0a 00 00 00       	mov    $0xa,%ecx
c01083c3:	89 d7                	mov    %edx,%edi
c01083c5:	f3 ab                	rep stos %eax,%es:(%edi)
c01083c7:	c7 45 a8 37 bd 10 c0 	movl   $0xc010bd37,-0x58(%ebp)
c01083ce:	c7 45 ac 3c bd 10 c0 	movl   $0xc010bd3c,-0x54(%ebp)
c01083d5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01083dc:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c01083e3:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c01083ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01083ed:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c01083f4:	00 
c01083f5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01083f8:	85 c0                	test   %eax,%eax
c01083fa:	75 1c                	jne    c0108418 <simple_shell+0xa5>
c01083fc:	68 0e 03 00 00       	push   $0x30e
c0108401:	68 01 bb 10 c0       	push   $0xc010bb01
c0108406:	68 01 bb 10 c0       	push   $0xc010bb01
c010840b:	68 42 bd 10 c0       	push   $0xc010bd42
c0108410:	e8 60 07 00 00       	call   c0108b75 <assertion_failure>
c0108415:	83 c4 10             	add    $0x10,%esp
c0108418:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010841b:	83 ec 08             	sub    $0x8,%esp
c010841e:	6a 02                	push   $0x2
c0108420:	50                   	push   %eax
c0108421:	e8 a9 c9 ff ff       	call   c0104dcf <open>
c0108426:	83 c4 10             	add    $0x10,%esp
c0108429:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010842c:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0108430:	75 4b                	jne    c010847d <simple_shell+0x10a>
c0108432:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108439:	eb 26                	jmp    c0108461 <simple_shell+0xee>
c010843b:	8b 55 a8             	mov    -0x58(%ebp),%edx
c010843e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108441:	01 d0                	add    %edx,%eax
c0108443:	0f b6 00             	movzbl (%eax),%eax
c0108446:	0f be c0             	movsbl %al,%eax
c0108449:	83 ec 04             	sub    $0x4,%esp
c010844c:	50                   	push   %eax
c010844d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108450:	68 51 bd 10 c0       	push   $0xc010bd51
c0108455:	e8 be 03 00 00       	call   c0108818 <Printf>
c010845a:	83 c4 10             	add    $0x10,%esp
c010845d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108461:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0108465:	7e d4                	jle    c010843b <simple_shell+0xc8>
c0108467:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010846a:	83 ec 08             	sub    $0x8,%esp
c010846d:	50                   	push   %eax
c010846e:	68 58 bd 10 c0       	push   $0xc010bd58
c0108473:	e8 a0 03 00 00       	call   c0108818 <Printf>
c0108478:	83 c4 10             	add    $0x10,%esp
c010847b:	eb 78                	jmp    c01084f5 <simple_shell+0x182>
c010847d:	83 ec 0c             	sub    $0xc,%esp
c0108480:	68 5e bd 10 c0       	push   $0xc010bd5e
c0108485:	e8 8e 03 00 00       	call   c0108818 <Printf>
c010848a:	83 c4 10             	add    $0x10,%esp
c010848d:	e8 9d cc ff ff       	call   c010512f <fork>
c0108492:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108495:	83 ec 0c             	sub    $0xc,%esp
c0108498:	68 73 bd 10 c0       	push   $0xc010bd73
c010849d:	e8 76 03 00 00       	call   c0108818 <Printf>
c01084a2:	83 c4 10             	add    $0x10,%esp
c01084a5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01084a9:	7e 11                	jle    c01084bc <simple_shell+0x149>
c01084ab:	83 ec 0c             	sub    $0xc,%esp
c01084ae:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c01084b1:	50                   	push   %eax
c01084b2:	e8 05 cc ff ff       	call   c01050bc <wait>
c01084b7:	83 c4 10             	add    $0x10,%esp
c01084ba:	eb 39                	jmp    c01084f5 <simple_shell+0x182>
c01084bc:	83 ec 0c             	sub    $0xc,%esp
c01084bf:	68 88 bd 10 c0       	push   $0xc010bd88
c01084c4:	e8 4f 03 00 00       	call   c0108818 <Printf>
c01084c9:	83 c4 10             	add    $0x10,%esp
c01084cc:	83 ec 0c             	sub    $0xc,%esp
c01084cf:	ff 75 e0             	pushl  -0x20(%ebp)
c01084d2:	e8 93 cb ff ff       	call   c010506a <close>
c01084d7:	83 c4 10             	add    $0x10,%esp
c01084da:	6a 00                	push   $0x0
c01084dc:	68 3c bd 10 c0       	push   $0xc010bd3c
c01084e1:	68 37 bd 10 c0       	push   $0xc010bd37
c01084e6:	68 a4 bd 10 c0       	push   $0xc010bda4
c01084eb:	e8 12 cf ff ff       	call   c0105402 <execl>
c01084f0:	83 c4 10             	add    $0x10,%esp
c01084f3:	eb fe                	jmp    c01084f3 <simple_shell+0x180>
c01084f5:	8b 7d fc             	mov    -0x4(%ebp),%edi
c01084f8:	c9                   	leave  
c01084f9:	c3                   	ret    

c01084fa <test_shell>:
c01084fa:	55                   	push   %ebp
c01084fb:	89 e5                	mov    %esp,%ebp
c01084fd:	83 ec 38             	sub    $0x38,%esp
c0108500:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0108507:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c010850e:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0108514:	83 ec 08             	sub    $0x8,%esp
c0108517:	6a 02                	push   $0x2
c0108519:	8d 45 ea             	lea    -0x16(%ebp),%eax
c010851c:	50                   	push   %eax
c010851d:	e8 ad c8 ff ff       	call   c0104dcf <open>
c0108522:	83 c4 10             	add    $0x10,%esp
c0108525:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108528:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c010852f:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0108536:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c010853d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108544:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010854b:	83 ec 0c             	sub    $0xc,%esp
c010854e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108551:	50                   	push   %eax
c0108552:	e8 38 ea ff ff       	call   c0106f8f <untar>
c0108557:	83 c4 10             	add    $0x10,%esp
c010855a:	e8 14 fe ff ff       	call   c0108373 <simple_shell>
c010855f:	90                   	nop
c0108560:	c9                   	leave  
c0108561:	c3                   	ret    

c0108562 <test_exec>:
c0108562:	55                   	push   %ebp
c0108563:	89 e5                	mov    %esp,%ebp
c0108565:	83 ec 38             	sub    $0x38,%esp
c0108568:	83 ec 0c             	sub    $0xc,%esp
c010856b:	68 aa bd 10 c0       	push   $0xc010bdaa
c0108570:	e8 64 7b ff ff       	call   c01000d9 <disp_str>
c0108575:	83 c4 10             	add    $0x10,%esp
c0108578:	83 ec 0c             	sub    $0xc,%esp
c010857b:	68 bc bd 10 c0       	push   $0xc010bdbc
c0108580:	e8 54 7b ff ff       	call   c01000d9 <disp_str>
c0108585:	83 c4 10             	add    $0x10,%esp
c0108588:	83 ec 0c             	sub    $0xc,%esp
c010858b:	6a 07                	push   $0x7
c010858d:	e8 b8 ed ff ff       	call   c010734a <disp_int>
c0108592:	83 c4 10             	add    $0x10,%esp
c0108595:	83 ec 0c             	sub    $0xc,%esp
c0108598:	68 a0 b6 10 c0       	push   $0xc010b6a0
c010859d:	e8 37 7b ff ff       	call   c01000d9 <disp_str>
c01085a2:	83 c4 10             	add    $0x10,%esp
c01085a5:	83 ec 0c             	sub    $0xc,%esp
c01085a8:	68 a2 b6 10 c0       	push   $0xc010b6a2
c01085ad:	e8 27 7b ff ff       	call   c01000d9 <disp_str>
c01085b2:	83 c4 10             	add    $0x10,%esp
c01085b5:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c01085bc:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c01085c3:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c01085c9:	83 ec 08             	sub    $0x8,%esp
c01085cc:	6a 02                	push   $0x2
c01085ce:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c01085d1:	50                   	push   %eax
c01085d2:	e8 f8 c7 ff ff       	call   c0104dcf <open>
c01085d7:	83 c4 10             	add    $0x10,%esp
c01085da:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085dd:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c01085e4:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c01085eb:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c01085f2:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c01085f9:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108600:	83 ec 0c             	sub    $0xc,%esp
c0108603:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108606:	50                   	push   %eax
c0108607:	e8 83 e9 ff ff       	call   c0106f8f <untar>
c010860c:	83 c4 10             	add    $0x10,%esp
c010860f:	83 ec 08             	sub    $0x8,%esp
c0108612:	6a 00                	push   $0x0
c0108614:	68 cf bd 10 c0       	push   $0xc010bdcf
c0108619:	68 d3 bd 10 c0       	push   $0xc010bdd3
c010861e:	68 3c bd 10 c0       	push   $0xc010bd3c
c0108623:	68 37 bd 10 c0       	push   $0xc010bd37
c0108628:	68 a4 bd 10 c0       	push   $0xc010bda4
c010862d:	e8 d0 cd ff ff       	call   c0105402 <execl>
c0108632:	83 c4 20             	add    $0x20,%esp
c0108635:	e8 34 e8 ff ff       	call   c0106e6e <stop_here>
c010863a:	e8 f0 ca ff ff       	call   c010512f <fork>
c010863f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108642:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108646:	7e 25                	jle    c010866d <test_exec+0x10b>
c0108648:	83 ec 0c             	sub    $0xc,%esp
c010864b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c010864e:	50                   	push   %eax
c010864f:	e8 68 ca ff ff       	call   c01050bc <wait>
c0108654:	83 c4 10             	add    $0x10,%esp
c0108657:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010865a:	83 ec 08             	sub    $0x8,%esp
c010865d:	50                   	push   %eax
c010865e:	68 d9 bd 10 c0       	push   $0xc010bdd9
c0108663:	e8 b0 01 00 00       	call   c0108818 <Printf>
c0108668:	83 c4 10             	add    $0x10,%esp
c010866b:	eb 33                	jmp    c01086a0 <test_exec+0x13e>
c010866d:	83 ec 0c             	sub    $0xc,%esp
c0108670:	68 eb bd 10 c0       	push   $0xc010bdeb
c0108675:	e8 9e 01 00 00       	call   c0108818 <Printf>
c010867a:	83 c4 10             	add    $0x10,%esp
c010867d:	83 ec 0c             	sub    $0xc,%esp
c0108680:	6a 00                	push   $0x0
c0108682:	68 d3 bd 10 c0       	push   $0xc010bdd3
c0108687:	68 3c bd 10 c0       	push   $0xc010bd3c
c010868c:	68 37 bd 10 c0       	push   $0xc010bd37
c0108691:	68 a4 bd 10 c0       	push   $0xc010bda4
c0108696:	e8 67 cd ff ff       	call   c0105402 <execl>
c010869b:	83 c4 20             	add    $0x20,%esp
c010869e:	eb fe                	jmp    c010869e <test_exec+0x13c>
c01086a0:	c9                   	leave  
c01086a1:	c3                   	ret    

c01086a2 <INIT>:
c01086a2:	55                   	push   %ebp
c01086a3:	89 e5                	mov    %esp,%ebp
c01086a5:	83 ec 08             	sub    $0x8,%esp
c01086a8:	e8 4d fe ff ff       	call   c01084fa <test_shell>
c01086ad:	eb fe                	jmp    c01086ad <INIT+0xb>

c01086af <TestA>:
c01086af:	55                   	push   %ebp
c01086b0:	89 e5                	mov    %esp,%ebp
c01086b2:	83 ec 08             	sub    $0x8,%esp
c01086b5:	83 ec 0c             	sub    $0xc,%esp
c01086b8:	6a 05                	push   $0x5
c01086ba:	e8 8b ec ff ff       	call   c010734a <disp_int>
c01086bf:	83 c4 10             	add    $0x10,%esp
c01086c2:	83 ec 0c             	sub    $0xc,%esp
c01086c5:	68 b3 b7 10 c0       	push   $0xc010b7b3
c01086ca:	e8 0a 7a ff ff       	call   c01000d9 <disp_str>
c01086cf:	83 c4 10             	add    $0x10,%esp
c01086d2:	83 ec 0c             	sub    $0xc,%esp
c01086d5:	68 f9 bd 10 c0       	push   $0xc010bdf9
c01086da:	e8 fa 79 ff ff       	call   c01000d9 <disp_str>
c01086df:	83 c4 10             	add    $0x10,%esp
c01086e2:	eb fe                	jmp    c01086e2 <TestA+0x33>

c01086e4 <delay>:
c01086e4:	55                   	push   %ebp
c01086e5:	89 e5                	mov    %esp,%ebp
c01086e7:	83 ec 10             	sub    $0x10,%esp
c01086ea:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01086f1:	eb 2a                	jmp    c010871d <delay+0x39>
c01086f3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01086fa:	eb 17                	jmp    c0108713 <delay+0x2f>
c01086fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108703:	eb 04                	jmp    c0108709 <delay+0x25>
c0108705:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108709:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c010870d:	7e f6                	jle    c0108705 <delay+0x21>
c010870f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0108713:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0108717:	7e e3                	jle    c01086fc <delay+0x18>
c0108719:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010871d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108720:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108723:	7c ce                	jl     c01086f3 <delay+0xf>
c0108725:	90                   	nop
c0108726:	c9                   	leave  
c0108727:	c3                   	ret    

c0108728 <TestB>:
c0108728:	55                   	push   %ebp
c0108729:	89 e5                	mov    %esp,%ebp
c010872b:	83 ec 08             	sub    $0x8,%esp
c010872e:	83 ec 0c             	sub    $0xc,%esp
c0108731:	68 00 be 10 c0       	push   $0xc010be00
c0108736:	e8 9e 79 ff ff       	call   c01000d9 <disp_str>
c010873b:	83 c4 10             	add    $0x10,%esp
c010873e:	eb fe                	jmp    c010873e <TestB+0x16>

c0108740 <TestC>:
c0108740:	55                   	push   %ebp
c0108741:	89 e5                	mov    %esp,%ebp
c0108743:	83 ec 18             	sub    $0x18,%esp
c0108746:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010874d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108751:	77 1a                	ja     c010876d <TestC+0x2d>
c0108753:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010875a:	83 ec 08             	sub    $0x8,%esp
c010875d:	ff 75 f0             	pushl  -0x10(%ebp)
c0108760:	68 03 be 10 c0       	push   $0xc010be03
c0108765:	e8 ae 00 00 00       	call   c0108818 <Printf>
c010876a:	83 c4 10             	add    $0x10,%esp
c010876d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108771:	eb da                	jmp    c010874d <TestC+0xd>

c0108773 <sys_get_ticks>:
c0108773:	55                   	push   %ebp
c0108774:	89 e5                	mov    %esp,%ebp
c0108776:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010877b:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108781:	5d                   	pop    %ebp
c0108782:	c3                   	ret    

c0108783 <sys_write>:
c0108783:	55                   	push   %ebp
c0108784:	89 e5                	mov    %esp,%ebp
c0108786:	83 ec 18             	sub    $0x18,%esp
c0108789:	8b 45 10             	mov    0x10(%ebp),%eax
c010878c:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108792:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108798:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010879d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01087a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01087a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01087a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01087a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01087ac:	eb 20                	jmp    c01087ce <sys_write+0x4b>
c01087ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087b1:	0f b6 00             	movzbl (%eax),%eax
c01087b4:	0f b6 c0             	movzbl %al,%eax
c01087b7:	83 ec 08             	sub    $0x8,%esp
c01087ba:	50                   	push   %eax
c01087bb:	ff 75 ec             	pushl  -0x14(%ebp)
c01087be:	e8 7d b9 ff ff       	call   c0104140 <out_char>
c01087c3:	83 c4 10             	add    $0x10,%esp
c01087c6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01087ca:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c01087ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01087d2:	7f da                	jg     c01087ae <sys_write+0x2b>
c01087d4:	90                   	nop
c01087d5:	c9                   	leave  
c01087d6:	c3                   	ret    

c01087d7 <milli_delay>:
c01087d7:	55                   	push   %ebp
c01087d8:	89 e5                	mov    %esp,%ebp
c01087da:	83 ec 18             	sub    $0x18,%esp
c01087dd:	e8 8a 11 00 00       	call   c010996c <get_ticks_ipc>
c01087e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01087e5:	90                   	nop
c01087e6:	e8 81 11 00 00       	call   c010996c <get_ticks_ipc>
c01087eb:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01087ee:	89 c1                	mov    %eax,%ecx
c01087f0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c01087f5:	89 c8                	mov    %ecx,%eax
c01087f7:	f7 ea                	imul   %edx
c01087f9:	c1 fa 05             	sar    $0x5,%edx
c01087fc:	89 c8                	mov    %ecx,%eax
c01087fe:	c1 f8 1f             	sar    $0x1f,%eax
c0108801:	29 c2                	sub    %eax,%edx
c0108803:	89 d0                	mov    %edx,%eax
c0108805:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c010880b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010880e:	77 d6                	ja     c01087e6 <milli_delay+0xf>
c0108810:	90                   	nop
c0108811:	c9                   	leave  
c0108812:	c3                   	ret    

c0108813 <TaskSys>:
c0108813:	55                   	push   %ebp
c0108814:	89 e5                	mov    %esp,%ebp
c0108816:	eb fe                	jmp    c0108816 <TaskSys+0x3>

c0108818 <Printf>:
c0108818:	55                   	push   %ebp
c0108819:	89 e5                	mov    %esp,%ebp
c010881b:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108821:	83 ec 04             	sub    $0x4,%esp
c0108824:	68 00 01 00 00       	push   $0x100
c0108829:	6a 00                	push   $0x0
c010882b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108831:	50                   	push   %eax
c0108832:	e8 38 3a 00 00       	call   c010c26f <Memset>
c0108837:	83 c4 10             	add    $0x10,%esp
c010883a:	8d 45 0c             	lea    0xc(%ebp),%eax
c010883d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108840:	8b 45 08             	mov    0x8(%ebp),%eax
c0108843:	83 ec 04             	sub    $0x4,%esp
c0108846:	ff 75 f4             	pushl  -0xc(%ebp)
c0108849:	50                   	push   %eax
c010884a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108850:	50                   	push   %eax
c0108851:	e8 20 00 00 00       	call   c0108876 <vsprintf>
c0108856:	83 c4 10             	add    $0x10,%esp
c0108859:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010885c:	83 ec 04             	sub    $0x4,%esp
c010885f:	ff 75 f0             	pushl  -0x10(%ebp)
c0108862:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108868:	50                   	push   %eax
c0108869:	6a 00                	push   $0x0
c010886b:	e8 75 c7 ff ff       	call   c0104fe5 <write>
c0108870:	83 c4 10             	add    $0x10,%esp
c0108873:	90                   	nop
c0108874:	c9                   	leave  
c0108875:	c3                   	ret    

c0108876 <vsprintf>:
c0108876:	55                   	push   %ebp
c0108877:	89 e5                	mov    %esp,%ebp
c0108879:	81 ec 68 02 00 00    	sub    $0x268,%esp
c010887f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108885:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010888b:	83 ec 04             	sub    $0x4,%esp
c010888e:	6a 40                	push   $0x40
c0108890:	6a 00                	push   $0x0
c0108892:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108898:	50                   	push   %eax
c0108899:	e8 d1 39 00 00       	call   c010c26f <Memset>
c010889e:	83 c4 10             	add    $0x10,%esp
c01088a1:	8b 45 10             	mov    0x10(%ebp),%eax
c01088a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01088a7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01088ae:	8b 45 08             	mov    0x8(%ebp),%eax
c01088b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01088b4:	e9 53 01 00 00       	jmp    c0108a0c <vsprintf+0x196>
c01088b9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01088bc:	0f b6 00             	movzbl (%eax),%eax
c01088bf:	3c 25                	cmp    $0x25,%al
c01088c1:	74 16                	je     c01088d9 <vsprintf+0x63>
c01088c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01088c6:	8d 50 01             	lea    0x1(%eax),%edx
c01088c9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01088cc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01088cf:	0f b6 12             	movzbl (%edx),%edx
c01088d2:	88 10                	mov    %dl,(%eax)
c01088d4:	e9 2f 01 00 00       	jmp    c0108a08 <vsprintf+0x192>
c01088d9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01088dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01088e0:	0f b6 00             	movzbl (%eax),%eax
c01088e3:	0f be c0             	movsbl %al,%eax
c01088e6:	83 f8 64             	cmp    $0x64,%eax
c01088e9:	74 26                	je     c0108911 <vsprintf+0x9b>
c01088eb:	83 f8 64             	cmp    $0x64,%eax
c01088ee:	7f 0e                	jg     c01088fe <vsprintf+0x88>
c01088f0:	83 f8 63             	cmp    $0x63,%eax
c01088f3:	0f 84 f2 00 00 00    	je     c01089eb <vsprintf+0x175>
c01088f9:	e9 0a 01 00 00       	jmp    c0108a08 <vsprintf+0x192>
c01088fe:	83 f8 73             	cmp    $0x73,%eax
c0108901:	0f 84 b0 00 00 00    	je     c01089b7 <vsprintf+0x141>
c0108907:	83 f8 78             	cmp    $0x78,%eax
c010890a:	74 5d                	je     c0108969 <vsprintf+0xf3>
c010890c:	e9 f7 00 00 00       	jmp    c0108a08 <vsprintf+0x192>
c0108911:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108914:	8b 00                	mov    (%eax),%eax
c0108916:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108919:	83 ec 04             	sub    $0x4,%esp
c010891c:	6a 0a                	push   $0xa
c010891e:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0108924:	50                   	push   %eax
c0108925:	ff 75 e8             	pushl  -0x18(%ebp)
c0108928:	e8 96 10 00 00       	call   c01099c3 <itoa>
c010892d:	83 c4 10             	add    $0x10,%esp
c0108930:	83 ec 08             	sub    $0x8,%esp
c0108933:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108939:	50                   	push   %eax
c010893a:	ff 75 f4             	pushl  -0xc(%ebp)
c010893d:	e8 4c 39 00 00       	call   c010c28e <Strcpy>
c0108942:	83 c4 10             	add    $0x10,%esp
c0108945:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108949:	83 ec 0c             	sub    $0xc,%esp
c010894c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108952:	50                   	push   %eax
c0108953:	e8 50 39 00 00       	call   c010c2a8 <Strlen>
c0108958:	83 c4 10             	add    $0x10,%esp
c010895b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010895e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108961:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108964:	e9 9f 00 00 00       	jmp    c0108a08 <vsprintf+0x192>
c0108969:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010896c:	8b 00                	mov    (%eax),%eax
c010896e:	83 ec 08             	sub    $0x8,%esp
c0108971:	50                   	push   %eax
c0108972:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108978:	50                   	push   %eax
c0108979:	e8 26 e9 ff ff       	call   c01072a4 <atoi>
c010897e:	83 c4 10             	add    $0x10,%esp
c0108981:	83 ec 08             	sub    $0x8,%esp
c0108984:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010898a:	50                   	push   %eax
c010898b:	ff 75 f4             	pushl  -0xc(%ebp)
c010898e:	e8 fb 38 00 00       	call   c010c28e <Strcpy>
c0108993:	83 c4 10             	add    $0x10,%esp
c0108996:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010899a:	83 ec 0c             	sub    $0xc,%esp
c010899d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01089a3:	50                   	push   %eax
c01089a4:	e8 ff 38 00 00       	call   c010c2a8 <Strlen>
c01089a9:	83 c4 10             	add    $0x10,%esp
c01089ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01089af:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01089b2:	01 45 f4             	add    %eax,-0xc(%ebp)
c01089b5:	eb 51                	jmp    c0108a08 <vsprintf+0x192>
c01089b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01089ba:	8b 00                	mov    (%eax),%eax
c01089bc:	83 ec 08             	sub    $0x8,%esp
c01089bf:	50                   	push   %eax
c01089c0:	ff 75 f4             	pushl  -0xc(%ebp)
c01089c3:	e8 c6 38 00 00       	call   c010c28e <Strcpy>
c01089c8:	83 c4 10             	add    $0x10,%esp
c01089cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01089ce:	8b 00                	mov    (%eax),%eax
c01089d0:	83 ec 0c             	sub    $0xc,%esp
c01089d3:	50                   	push   %eax
c01089d4:	e8 cf 38 00 00       	call   c010c2a8 <Strlen>
c01089d9:	83 c4 10             	add    $0x10,%esp
c01089dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01089df:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01089e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01089e6:	01 45 f4             	add    %eax,-0xc(%ebp)
c01089e9:	eb 1d                	jmp    c0108a08 <vsprintf+0x192>
c01089eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01089ee:	0f b6 10             	movzbl (%eax),%edx
c01089f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01089f4:	88 10                	mov    %dl,(%eax)
c01089f6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01089fa:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0108a01:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108a04:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108a07:	90                   	nop
c0108a08:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108a0f:	0f b6 00             	movzbl (%eax),%eax
c0108a12:	84 c0                	test   %al,%al
c0108a14:	0f 85 9f fe ff ff    	jne    c01088b9 <vsprintf+0x43>
c0108a1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108a1d:	2b 45 08             	sub    0x8(%ebp),%eax
c0108a20:	c9                   	leave  
c0108a21:	c3                   	ret    

c0108a22 <printx>:
c0108a22:	55                   	push   %ebp
c0108a23:	89 e5                	mov    %esp,%ebp
c0108a25:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108a2b:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108a2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108a31:	8b 45 08             	mov    0x8(%ebp),%eax
c0108a34:	83 ec 04             	sub    $0x4,%esp
c0108a37:	ff 75 f4             	pushl  -0xc(%ebp)
c0108a3a:	50                   	push   %eax
c0108a3b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108a41:	50                   	push   %eax
c0108a42:	e8 2f fe ff ff       	call   c0108876 <vsprintf>
c0108a47:	83 c4 10             	add    $0x10,%esp
c0108a4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108a4d:	83 ec 08             	sub    $0x8,%esp
c0108a50:	ff 75 f0             	pushl  -0x10(%ebp)
c0108a53:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108a59:	50                   	push   %eax
c0108a5a:	e8 11 8e ff ff       	call   c0101870 <write_debug>
c0108a5f:	83 c4 10             	add    $0x10,%esp
c0108a62:	90                   	nop
c0108a63:	c9                   	leave  
c0108a64:	c3                   	ret    

c0108a65 <sys_printx>:
c0108a65:	55                   	push   %ebp
c0108a66:	89 e5                	mov    %esp,%ebp
c0108a68:	83 ec 28             	sub    $0x28,%esp
c0108a6b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108a70:	85 c0                	test   %eax,%eax
c0108a72:	75 15                	jne    c0108a89 <sys_printx+0x24>
c0108a74:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a77:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108a7d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108a80:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108a87:	eb 10                	jmp    c0108a99 <sys_printx+0x34>
c0108a89:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108a8e:	85 c0                	test   %eax,%eax
c0108a90:	74 07                	je     c0108a99 <sys_printx+0x34>
c0108a92:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108a99:	8b 55 08             	mov    0x8(%ebp),%edx
c0108a9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108a9f:	01 d0                	add    %edx,%eax
c0108aa1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108aa4:	8b 45 10             	mov    0x10(%ebp),%eax
c0108aa7:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108aad:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108ab3:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108ab8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108abb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108abe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108ac1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ac4:	0f b6 00             	movzbl (%eax),%eax
c0108ac7:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0108aca:	eb 3a                	jmp    c0108b06 <sys_printx+0xa1>
c0108acc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108acf:	0f b6 00             	movzbl (%eax),%eax
c0108ad2:	3c 3b                	cmp    $0x3b,%al
c0108ad4:	74 0a                	je     c0108ae0 <sys_printx+0x7b>
c0108ad6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ad9:	0f b6 00             	movzbl (%eax),%eax
c0108adc:	3c 3a                	cmp    $0x3a,%al
c0108ade:	75 06                	jne    c0108ae6 <sys_printx+0x81>
c0108ae0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108ae4:	eb 20                	jmp    c0108b06 <sys_printx+0xa1>
c0108ae6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ae9:	0f b6 00             	movzbl (%eax),%eax
c0108aec:	0f b6 c0             	movzbl %al,%eax
c0108aef:	83 ec 08             	sub    $0x8,%esp
c0108af2:	50                   	push   %eax
c0108af3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108af6:	e8 45 b6 ff ff       	call   c0104140 <out_char>
c0108afb:	83 c4 10             	add    $0x10,%esp
c0108afe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108b02:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0108b06:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108b0a:	7f c0                	jg     c0108acc <sys_printx+0x67>
c0108b0c:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108b10:	75 10                	jne    c0108b22 <sys_printx+0xbd>
c0108b12:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108b17:	85 c0                	test   %eax,%eax
c0108b19:	74 13                	je     c0108b2e <sys_printx+0xc9>
c0108b1b:	e8 40 78 ff ff       	call   c0100360 <disable_int>
c0108b20:	eb 0c                	jmp    c0108b2e <sys_printx+0xc9>
c0108b22:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0108b26:	75 06                	jne    c0108b2e <sys_printx+0xc9>
c0108b28:	e8 33 78 ff ff       	call   c0100360 <disable_int>
c0108b2d:	90                   	nop
c0108b2e:	90                   	nop
c0108b2f:	c9                   	leave  
c0108b30:	c3                   	ret    

c0108b31 <spin>:
c0108b31:	55                   	push   %ebp
c0108b32:	89 e5                	mov    %esp,%ebp
c0108b34:	83 ec 08             	sub    $0x8,%esp
c0108b37:	83 ec 0c             	sub    $0xc,%esp
c0108b3a:	ff 75 08             	pushl  0x8(%ebp)
c0108b3d:	e8 97 75 ff ff       	call   c01000d9 <disp_str>
c0108b42:	83 c4 10             	add    $0x10,%esp
c0108b45:	83 ec 0c             	sub    $0xc,%esp
c0108b48:	68 b3 b7 10 c0       	push   $0xc010b7b3
c0108b4d:	e8 87 75 ff ff       	call   c01000d9 <disp_str>
c0108b52:	83 c4 10             	add    $0x10,%esp
c0108b55:	eb fe                	jmp    c0108b55 <spin+0x24>

c0108b57 <panic>:
c0108b57:	55                   	push   %ebp
c0108b58:	89 e5                	mov    %esp,%ebp
c0108b5a:	83 ec 08             	sub    $0x8,%esp
c0108b5d:	83 ec 04             	sub    $0x4,%esp
c0108b60:	ff 75 08             	pushl  0x8(%ebp)
c0108b63:	6a 3a                	push   $0x3a
c0108b65:	68 10 be 10 c0       	push   $0xc010be10
c0108b6a:	e8 b3 fe ff ff       	call   c0108a22 <printx>
c0108b6f:	83 c4 10             	add    $0x10,%esp
c0108b72:	90                   	nop
c0108b73:	c9                   	leave  
c0108b74:	c3                   	ret    

c0108b75 <assertion_failure>:
c0108b75:	55                   	push   %ebp
c0108b76:	89 e5                	mov    %esp,%ebp
c0108b78:	83 ec 08             	sub    $0x8,%esp
c0108b7b:	83 ec 08             	sub    $0x8,%esp
c0108b7e:	ff 75 14             	pushl  0x14(%ebp)
c0108b81:	ff 75 10             	pushl  0x10(%ebp)
c0108b84:	ff 75 0c             	pushl  0xc(%ebp)
c0108b87:	ff 75 08             	pushl  0x8(%ebp)
c0108b8a:	6a 3b                	push   $0x3b
c0108b8c:	68 18 be 10 c0       	push   $0xc010be18
c0108b91:	e8 8c fe ff ff       	call   c0108a22 <printx>
c0108b96:	83 c4 20             	add    $0x20,%esp
c0108b99:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108ba0:	00 00 00 
c0108ba3:	83 ec 0c             	sub    $0xc,%esp
c0108ba6:	68 a0 b6 10 c0       	push   $0xc010b6a0
c0108bab:	e8 29 75 ff ff       	call   c01000d9 <disp_str>
c0108bb0:	83 c4 10             	add    $0x10,%esp
c0108bb3:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108bb8:	83 ec 0c             	sub    $0xc,%esp
c0108bbb:	50                   	push   %eax
c0108bbc:	e8 89 e7 ff ff       	call   c010734a <disp_int>
c0108bc1:	83 c4 10             	add    $0x10,%esp
c0108bc4:	83 ec 0c             	sub    $0xc,%esp
c0108bc7:	68 a2 b6 10 c0       	push   $0xc010b6a2
c0108bcc:	e8 08 75 ff ff       	call   c01000d9 <disp_str>
c0108bd1:	83 c4 10             	add    $0x10,%esp
c0108bd4:	83 ec 0c             	sub    $0xc,%esp
c0108bd7:	68 4b be 10 c0       	push   $0xc010be4b
c0108bdc:	e8 50 ff ff ff       	call   c0108b31 <spin>
c0108be1:	83 c4 10             	add    $0x10,%esp
c0108be4:	90                   	nop
c0108be5:	c9                   	leave  
c0108be6:	c3                   	ret    

c0108be7 <assertion_failure2>:
c0108be7:	55                   	push   %ebp
c0108be8:	89 e5                	mov    %esp,%ebp
c0108bea:	83 ec 08             	sub    $0x8,%esp
c0108bed:	83 ec 04             	sub    $0x4,%esp
c0108bf0:	ff 75 18             	pushl  0x18(%ebp)
c0108bf3:	ff 75 14             	pushl  0x14(%ebp)
c0108bf6:	ff 75 10             	pushl  0x10(%ebp)
c0108bf9:	ff 75 0c             	pushl  0xc(%ebp)
c0108bfc:	ff 75 08             	pushl  0x8(%ebp)
c0108bff:	6a 3b                	push   $0x3b
c0108c01:	68 58 be 10 c0       	push   $0xc010be58
c0108c06:	e8 17 fe ff ff       	call   c0108a22 <printx>
c0108c0b:	83 c4 20             	add    $0x20,%esp
c0108c0e:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108c15:	00 00 00 
c0108c18:	83 ec 0c             	sub    $0xc,%esp
c0108c1b:	68 a0 b6 10 c0       	push   $0xc010b6a0
c0108c20:	e8 b4 74 ff ff       	call   c01000d9 <disp_str>
c0108c25:	83 c4 10             	add    $0x10,%esp
c0108c28:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108c2d:	83 ec 0c             	sub    $0xc,%esp
c0108c30:	50                   	push   %eax
c0108c31:	e8 14 e7 ff ff       	call   c010734a <disp_int>
c0108c36:	83 c4 10             	add    $0x10,%esp
c0108c39:	83 ec 0c             	sub    $0xc,%esp
c0108c3c:	68 a2 b6 10 c0       	push   $0xc010b6a2
c0108c41:	e8 93 74 ff ff       	call   c01000d9 <disp_str>
c0108c46:	83 c4 10             	add    $0x10,%esp
c0108c49:	83 ec 0c             	sub    $0xc,%esp
c0108c4c:	68 4b be 10 c0       	push   $0xc010be4b
c0108c51:	e8 db fe ff ff       	call   c0108b31 <spin>
c0108c56:	83 c4 10             	add    $0x10,%esp
c0108c59:	90                   	nop
c0108c5a:	c9                   	leave  
c0108c5b:	c3                   	ret    

c0108c5c <dead_lock>:
c0108c5c:	55                   	push   %ebp
c0108c5d:	89 e5                	mov    %esp,%ebp
c0108c5f:	b8 00 00 00 00       	mov    $0x0,%eax
c0108c64:	5d                   	pop    %ebp
c0108c65:	c3                   	ret    

c0108c66 <sys_send_msg>:
c0108c66:	55                   	push   %ebp
c0108c67:	89 e5                	mov    %esp,%ebp
c0108c69:	83 ec 58             	sub    $0x58,%esp
c0108c6c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108c73:	83 ec 0c             	sub    $0xc,%esp
c0108c76:	ff 75 0c             	pushl  0xc(%ebp)
c0108c79:	e8 28 ae ff ff       	call   c0103aa6 <pid2proc>
c0108c7e:	83 c4 10             	add    $0x10,%esp
c0108c81:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108c84:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108c88:	74 2c                	je     c0108cb6 <sys_send_msg+0x50>
c0108c8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c8d:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108c93:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108c98:	74 1c                	je     c0108cb6 <sys_send_msg+0x50>
c0108c9a:	68 5c 05 00 00       	push   $0x55c
c0108c9f:	68 01 bb 10 c0       	push   $0xc010bb01
c0108ca4:	68 01 bb 10 c0       	push   $0xc010bb01
c0108ca9:	68 98 be 10 c0       	push   $0xc010be98
c0108cae:	e8 c2 fe ff ff       	call   c0108b75 <assertion_failure>
c0108cb3:	83 c4 10             	add    $0x10,%esp
c0108cb6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cb9:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108cbf:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108cc4:	74 1c                	je     c0108ce2 <sys_send_msg+0x7c>
c0108cc6:	68 5e 05 00 00       	push   $0x55e
c0108ccb:	68 01 bb 10 c0       	push   $0xc010bb01
c0108cd0:	68 01 bb 10 c0       	push   $0xc010bb01
c0108cd5:	68 c0 be 10 c0       	push   $0xc010bec0
c0108cda:	e8 96 fe ff ff       	call   c0108b75 <assertion_failure>
c0108cdf:	83 c4 10             	add    $0x10,%esp
c0108ce2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108ce6:	75 22                	jne    c0108d0a <sys_send_msg+0xa4>
c0108ce8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108cec:	75 1c                	jne    c0108d0a <sys_send_msg+0xa4>
c0108cee:	68 61 05 00 00       	push   $0x561
c0108cf3:	68 01 bb 10 c0       	push   $0xc010bb01
c0108cf8:	68 01 bb 10 c0       	push   $0xc010bb01
c0108cfd:	68 e3 be 10 c0       	push   $0xc010bee3
c0108d02:	e8 6e fe ff ff       	call   c0108b75 <assertion_failure>
c0108d07:	83 c4 10             	add    $0x10,%esp
c0108d0a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d0d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d14:	84 c0                	test   %al,%al
c0108d16:	74 65                	je     c0108d7d <sys_send_msg+0x117>
c0108d18:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d1b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d22:	3c 01                	cmp    $0x1,%al
c0108d24:	74 57                	je     c0108d7d <sys_send_msg+0x117>
c0108d26:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d29:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d30:	3c 02                	cmp    $0x2,%al
c0108d32:	74 49                	je     c0108d7d <sys_send_msg+0x117>
c0108d34:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d37:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d3e:	3c 03                	cmp    $0x3,%al
c0108d40:	74 3b                	je     c0108d7d <sys_send_msg+0x117>
c0108d42:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d45:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d4c:	3c 04                	cmp    $0x4,%al
c0108d4e:	74 2d                	je     c0108d7d <sys_send_msg+0x117>
c0108d50:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d53:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d5a:	0f be c0             	movsbl %al,%eax
c0108d5d:	83 ec 0c             	sub    $0xc,%esp
c0108d60:	68 65 05 00 00       	push   $0x565
c0108d65:	68 01 bb 10 c0       	push   $0xc010bb01
c0108d6a:	68 01 bb 10 c0       	push   $0xc010bb01
c0108d6f:	50                   	push   %eax
c0108d70:	68 f4 be 10 c0       	push   $0xc010bef4
c0108d75:	e8 6d fe ff ff       	call   c0108be7 <assertion_failure2>
c0108d7a:	83 c4 20             	add    $0x20,%esp
c0108d7d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d80:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d87:	84 c0                	test   %al,%al
c0108d89:	74 65                	je     c0108df0 <sys_send_msg+0x18a>
c0108d8b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d8e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d95:	3c 01                	cmp    $0x1,%al
c0108d97:	74 57                	je     c0108df0 <sys_send_msg+0x18a>
c0108d99:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d9c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108da3:	3c 02                	cmp    $0x2,%al
c0108da5:	74 49                	je     c0108df0 <sys_send_msg+0x18a>
c0108da7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108daa:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108db1:	3c 03                	cmp    $0x3,%al
c0108db3:	74 3b                	je     c0108df0 <sys_send_msg+0x18a>
c0108db5:	8b 45 10             	mov    0x10(%ebp),%eax
c0108db8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dbf:	3c 04                	cmp    $0x4,%al
c0108dc1:	74 2d                	je     c0108df0 <sys_send_msg+0x18a>
c0108dc3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108dc6:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dcd:	0f be c0             	movsbl %al,%eax
c0108dd0:	83 ec 0c             	sub    $0xc,%esp
c0108dd3:	68 68 05 00 00       	push   $0x568
c0108dd8:	68 01 bb 10 c0       	push   $0xc010bb01
c0108ddd:	68 01 bb 10 c0       	push   $0xc010bb01
c0108de2:	50                   	push   %eax
c0108de3:	68 90 bf 10 c0       	push   $0xc010bf90
c0108de8:	e8 fa fd ff ff       	call   c0108be7 <assertion_failure2>
c0108ded:	83 c4 20             	add    $0x20,%esp
c0108df0:	83 ec 0c             	sub    $0xc,%esp
c0108df3:	ff 75 10             	pushl  0x10(%ebp)
c0108df6:	e8 31 ad ff ff       	call   c0103b2c <proc2pid>
c0108dfb:	83 c4 10             	add    $0x10,%esp
c0108dfe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108e01:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108e08:	8b 45 08             	mov    0x8(%ebp),%eax
c0108e0b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108e0e:	83 ec 08             	sub    $0x8,%esp
c0108e11:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108e14:	ff 75 dc             	pushl  -0x24(%ebp)
c0108e17:	e8 a6 d3 ff ff       	call   c01061c2 <get_physical_address_proc>
c0108e1c:	83 c4 10             	add    $0x10,%esp
c0108e1f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108e22:	83 ec 08             	sub    $0x8,%esp
c0108e25:	ff 75 e0             	pushl  -0x20(%ebp)
c0108e28:	ff 75 d8             	pushl  -0x28(%ebp)
c0108e2b:	e8 bf d2 ff ff       	call   c01060ef <alloc_virtual_memory>
c0108e30:	83 c4 10             	add    $0x10,%esp
c0108e33:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108e36:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e39:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108e3f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108e42:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108e49:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108e4c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108e4f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108e52:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108e55:	89 10                	mov    %edx,(%eax)
c0108e57:	83 ec 08             	sub    $0x8,%esp
c0108e5a:	ff 75 0c             	pushl  0xc(%ebp)
c0108e5d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108e60:	e8 f7 fd ff ff       	call   c0108c5c <dead_lock>
c0108e65:	83 c4 10             	add    $0x10,%esp
c0108e68:	83 f8 01             	cmp    $0x1,%eax
c0108e6b:	75 10                	jne    c0108e7d <sys_send_msg+0x217>
c0108e6d:	83 ec 0c             	sub    $0xc,%esp
c0108e70:	68 20 c0 10 c0       	push   $0xc010c020
c0108e75:	e8 dd fc ff ff       	call   c0108b57 <panic>
c0108e7a:	83 c4 10             	add    $0x10,%esp
c0108e7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e80:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e87:	3c 02                	cmp    $0x2,%al
c0108e89:	0f 85 ca 01 00 00    	jne    c0109059 <sys_send_msg+0x3f3>
c0108e8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e92:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108e98:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108e9b:	74 12                	je     c0108eaf <sys_send_msg+0x249>
c0108e9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ea0:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108ea6:	83 f8 12             	cmp    $0x12,%eax
c0108ea9:	0f 85 aa 01 00 00    	jne    c0109059 <sys_send_msg+0x3f3>
c0108eaf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108eb2:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108eb8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108ebb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ebe:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108ec4:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108ec7:	83 ec 08             	sub    $0x8,%esp
c0108eca:	ff 75 0c             	pushl  0xc(%ebp)
c0108ecd:	ff 75 c0             	pushl  -0x40(%ebp)
c0108ed0:	e8 ed d2 ff ff       	call   c01061c2 <get_physical_address_proc>
c0108ed5:	83 c4 10             	add    $0x10,%esp
c0108ed8:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108edb:	83 ec 08             	sub    $0x8,%esp
c0108ede:	ff 75 e0             	pushl  -0x20(%ebp)
c0108ee1:	ff 75 bc             	pushl  -0x44(%ebp)
c0108ee4:	e8 06 d2 ff ff       	call   c01060ef <alloc_virtual_memory>
c0108ee9:	83 c4 10             	add    $0x10,%esp
c0108eec:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108eef:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108ef2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108ef5:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108ef8:	83 ec 04             	sub    $0x4,%esp
c0108efb:	51                   	push   %ecx
c0108efc:	52                   	push   %edx
c0108efd:	50                   	push   %eax
c0108efe:	e8 59 e0 ff ff       	call   c0106f5c <Memcpy>
c0108f03:	83 c4 10             	add    $0x10,%esp
c0108f06:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108f0b:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108f10:	75 0a                	jne    c0108f1c <sys_send_msg+0x2b6>
c0108f12:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108f19:	00 00 00 
c0108f1c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f1f:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108f26:	00 00 00 
c0108f29:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f2c:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108f33:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f36:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108f3d:	00 00 00 
c0108f40:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f43:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108f4a:	00 00 00 
c0108f4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f50:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108f57:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108f5a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108f61:	00 00 00 
c0108f64:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f67:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108f6e:	00 00 00 
c0108f71:	83 ec 0c             	sub    $0xc,%esp
c0108f74:	ff 75 e8             	pushl  -0x18(%ebp)
c0108f77:	e8 a0 09 00 00       	call   c010991c <unblock>
c0108f7c:	83 c4 10             	add    $0x10,%esp
c0108f7f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f82:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f89:	84 c0                	test   %al,%al
c0108f8b:	74 1c                	je     c0108fa9 <sys_send_msg+0x343>
c0108f8d:	68 a0 05 00 00       	push   $0x5a0
c0108f92:	68 01 bb 10 c0       	push   $0xc010bb01
c0108f97:	68 01 bb 10 c0       	push   $0xc010bb01
c0108f9c:	68 2b c0 10 c0       	push   $0xc010c02b
c0108fa1:	e8 cf fb ff ff       	call   c0108b75 <assertion_failure>
c0108fa6:	83 c4 10             	add    $0x10,%esp
c0108fa9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fac:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108fb2:	83 f8 21             	cmp    $0x21,%eax
c0108fb5:	74 1c                	je     c0108fd3 <sys_send_msg+0x36d>
c0108fb7:	68 a1 05 00 00       	push   $0x5a1
c0108fbc:	68 01 bb 10 c0       	push   $0xc010bb01
c0108fc1:	68 01 bb 10 c0       	push   $0xc010bb01
c0108fc6:	68 3f c0 10 c0       	push   $0xc010c03f
c0108fcb:	e8 a5 fb ff ff       	call   c0108b75 <assertion_failure>
c0108fd0:	83 c4 10             	add    $0x10,%esp
c0108fd3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108fd6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108fdc:	85 c0                	test   %eax,%eax
c0108fde:	74 1c                	je     c0108ffc <sys_send_msg+0x396>
c0108fe0:	68 a3 05 00 00       	push   $0x5a3
c0108fe5:	68 01 bb 10 c0       	push   $0xc010bb01
c0108fea:	68 01 bb 10 c0       	push   $0xc010bb01
c0108fef:	68 5c c0 10 c0       	push   $0xc010c05c
c0108ff4:	e8 7c fb ff ff       	call   c0108b75 <assertion_failure>
c0108ff9:	83 c4 10             	add    $0x10,%esp
c0108ffc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108fff:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109006:	84 c0                	test   %al,%al
c0109008:	74 1c                	je     c0109026 <sys_send_msg+0x3c0>
c010900a:	68 a4 05 00 00       	push   $0x5a4
c010900f:	68 01 bb 10 c0       	push   $0xc010bb01
c0109014:	68 01 bb 10 c0       	push   $0xc010bb01
c0109019:	68 71 c0 10 c0       	push   $0xc010c071
c010901e:	e8 52 fb ff ff       	call   c0108b75 <assertion_failure>
c0109023:	83 c4 10             	add    $0x10,%esp
c0109026:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109029:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c010902f:	83 f8 21             	cmp    $0x21,%eax
c0109032:	0f 84 45 01 00 00    	je     c010917d <sys_send_msg+0x517>
c0109038:	68 a5 05 00 00       	push   $0x5a5
c010903d:	68 01 bb 10 c0       	push   $0xc010bb01
c0109042:	68 01 bb 10 c0       	push   $0xc010bb01
c0109047:	68 88 c0 10 c0       	push   $0xc010c088
c010904c:	e8 24 fb ff ff       	call   c0108b75 <assertion_failure>
c0109051:	83 c4 10             	add    $0x10,%esp
c0109054:	e9 24 01 00 00       	jmp    c010917d <sys_send_msg+0x517>
c0109059:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109060:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109063:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0109066:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109069:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010906f:	85 c0                	test   %eax,%eax
c0109071:	75 1b                	jne    c010908e <sys_send_msg+0x428>
c0109073:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109076:	8b 55 10             	mov    0x10(%ebp),%edx
c0109079:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010907f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109082:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0109089:	00 00 00 
c010908c:	eb 3f                	jmp    c01090cd <sys_send_msg+0x467>
c010908e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109091:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109097:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010909a:	eb 12                	jmp    c01090ae <sys_send_msg+0x448>
c010909c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010909f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01090a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01090a5:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c01090ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01090ae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01090b2:	75 e8                	jne    c010909c <sys_send_msg+0x436>
c01090b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01090b7:	8b 55 10             	mov    0x10(%ebp),%edx
c01090ba:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c01090c0:	8b 45 10             	mov    0x10(%ebp),%eax
c01090c3:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01090ca:	00 00 00 
c01090cd:	8b 45 10             	mov    0x10(%ebp),%eax
c01090d0:	8b 55 08             	mov    0x8(%ebp),%edx
c01090d3:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c01090d9:	8b 45 10             	mov    0x10(%ebp),%eax
c01090dc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01090df:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c01090e5:	8b 45 10             	mov    0x10(%ebp),%eax
c01090e8:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c01090ef:	8b 45 10             	mov    0x10(%ebp),%eax
c01090f2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090f9:	3c 01                	cmp    $0x1,%al
c01090fb:	74 1c                	je     c0109119 <sys_send_msg+0x4b3>
c01090fd:	68 c7 05 00 00       	push   $0x5c7
c0109102:	68 01 bb 10 c0       	push   $0xc010bb01
c0109107:	68 01 bb 10 c0       	push   $0xc010bb01
c010910c:	68 ac c0 10 c0       	push   $0xc010c0ac
c0109111:	e8 5f fa ff ff       	call   c0108b75 <assertion_failure>
c0109116:	83 c4 10             	add    $0x10,%esp
c0109119:	8b 45 10             	mov    0x10(%ebp),%eax
c010911c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109122:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0109125:	74 1c                	je     c0109143 <sys_send_msg+0x4dd>
c0109127:	68 c8 05 00 00       	push   $0x5c8
c010912c:	68 01 bb 10 c0       	push   $0xc010bb01
c0109131:	68 01 bb 10 c0       	push   $0xc010bb01
c0109136:	68 c8 c0 10 c0       	push   $0xc010c0c8
c010913b:	e8 35 fa ff ff       	call   c0108b75 <assertion_failure>
c0109140:	83 c4 10             	add    $0x10,%esp
c0109143:	8b 45 10             	mov    0x10(%ebp),%eax
c0109146:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010914c:	39 45 08             	cmp    %eax,0x8(%ebp)
c010914f:	74 1c                	je     c010916d <sys_send_msg+0x507>
c0109151:	68 c9 05 00 00       	push   $0x5c9
c0109156:	68 01 bb 10 c0       	push   $0xc010bb01
c010915b:	68 01 bb 10 c0       	push   $0xc010bb01
c0109160:	68 ea c0 10 c0       	push   $0xc010c0ea
c0109165:	e8 0b fa ff ff       	call   c0108b75 <assertion_failure>
c010916a:	83 c4 10             	add    $0x10,%esp
c010916d:	83 ec 0c             	sub    $0xc,%esp
c0109170:	ff 75 10             	pushl  0x10(%ebp)
c0109173:	e8 68 07 00 00       	call   c01098e0 <block>
c0109178:	83 c4 10             	add    $0x10,%esp
c010917b:	eb 01                	jmp    c010917e <sys_send_msg+0x518>
c010917d:	90                   	nop
c010917e:	b8 00 00 00 00       	mov    $0x0,%eax
c0109183:	c9                   	leave  
c0109184:	c3                   	ret    

c0109185 <sys_receive_msg>:
c0109185:	55                   	push   %ebp
c0109186:	89 e5                	mov    %esp,%ebp
c0109188:	83 ec 58             	sub    $0x58,%esp
c010918b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109192:	83 ec 0c             	sub    $0xc,%esp
c0109195:	ff 75 0c             	pushl  0xc(%ebp)
c0109198:	e8 09 a9 ff ff       	call   c0103aa6 <pid2proc>
c010919d:	83 c4 10             	add    $0x10,%esp
c01091a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01091a3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01091a7:	74 2c                	je     c01091d5 <sys_receive_msg+0x50>
c01091a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091ac:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01091b2:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01091b7:	74 1c                	je     c01091d5 <sys_receive_msg+0x50>
c01091b9:	68 dd 05 00 00       	push   $0x5dd
c01091be:	68 01 bb 10 c0       	push   $0xc010bb01
c01091c3:	68 01 bb 10 c0       	push   $0xc010bb01
c01091c8:	68 c0 be 10 c0       	push   $0xc010bec0
c01091cd:	e8 a3 f9 ff ff       	call   c0108b75 <assertion_failure>
c01091d2:	83 c4 10             	add    $0x10,%esp
c01091d5:	8b 45 10             	mov    0x10(%ebp),%eax
c01091d8:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01091de:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01091e3:	74 1c                	je     c0109201 <sys_receive_msg+0x7c>
c01091e5:	68 df 05 00 00       	push   $0x5df
c01091ea:	68 01 bb 10 c0       	push   $0xc010bb01
c01091ef:	68 01 bb 10 c0       	push   $0xc010bb01
c01091f4:	68 98 be 10 c0       	push   $0xc010be98
c01091f9:	e8 77 f9 ff ff       	call   c0108b75 <assertion_failure>
c01091fe:	83 c4 10             	add    $0x10,%esp
c0109201:	8b 45 10             	mov    0x10(%ebp),%eax
c0109204:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010920b:	84 c0                	test   %al,%al
c010920d:	74 65                	je     c0109274 <sys_receive_msg+0xef>
c010920f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109212:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109219:	3c 01                	cmp    $0x1,%al
c010921b:	74 57                	je     c0109274 <sys_receive_msg+0xef>
c010921d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109220:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109227:	3c 02                	cmp    $0x2,%al
c0109229:	74 49                	je     c0109274 <sys_receive_msg+0xef>
c010922b:	8b 45 10             	mov    0x10(%ebp),%eax
c010922e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109235:	3c 03                	cmp    $0x3,%al
c0109237:	74 3b                	je     c0109274 <sys_receive_msg+0xef>
c0109239:	8b 45 10             	mov    0x10(%ebp),%eax
c010923c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109243:	3c 04                	cmp    $0x4,%al
c0109245:	74 2d                	je     c0109274 <sys_receive_msg+0xef>
c0109247:	8b 45 10             	mov    0x10(%ebp),%eax
c010924a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109251:	0f be c0             	movsbl %al,%eax
c0109254:	83 ec 0c             	sub    $0xc,%esp
c0109257:	68 e2 05 00 00       	push   $0x5e2
c010925c:	68 01 bb 10 c0       	push   $0xc010bb01
c0109261:	68 01 bb 10 c0       	push   $0xc010bb01
c0109266:	50                   	push   %eax
c0109267:	68 f4 be 10 c0       	push   $0xc010bef4
c010926c:	e8 76 f9 ff ff       	call   c0108be7 <assertion_failure2>
c0109271:	83 c4 20             	add    $0x20,%esp
c0109274:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109278:	74 73                	je     c01092ed <sys_receive_msg+0x168>
c010927a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010927d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109284:	84 c0                	test   %al,%al
c0109286:	74 65                	je     c01092ed <sys_receive_msg+0x168>
c0109288:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010928b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109292:	3c 01                	cmp    $0x1,%al
c0109294:	74 57                	je     c01092ed <sys_receive_msg+0x168>
c0109296:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109299:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092a0:	3c 02                	cmp    $0x2,%al
c01092a2:	74 49                	je     c01092ed <sys_receive_msg+0x168>
c01092a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01092a7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092ae:	3c 03                	cmp    $0x3,%al
c01092b0:	74 3b                	je     c01092ed <sys_receive_msg+0x168>
c01092b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01092b5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092bc:	3c 04                	cmp    $0x4,%al
c01092be:	74 2d                	je     c01092ed <sys_receive_msg+0x168>
c01092c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01092c3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092ca:	0f be c0             	movsbl %al,%eax
c01092cd:	83 ec 0c             	sub    $0xc,%esp
c01092d0:	68 e6 05 00 00       	push   $0x5e6
c01092d5:	68 01 bb 10 c0       	push   $0xc010bb01
c01092da:	68 01 bb 10 c0       	push   $0xc010bb01
c01092df:	50                   	push   %eax
c01092e0:	68 90 bf 10 c0       	push   $0xc010bf90
c01092e5:	e8 fd f8 ff ff       	call   c0108be7 <assertion_failure2>
c01092ea:	83 c4 20             	add    $0x20,%esp
c01092ed:	83 ec 0c             	sub    $0xc,%esp
c01092f0:	ff 75 10             	pushl  0x10(%ebp)
c01092f3:	e8 34 a8 ff ff       	call   c0103b2c <proc2pid>
c01092f8:	83 c4 10             	add    $0x10,%esp
c01092fb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01092fe:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0109305:	8b 45 08             	mov    0x8(%ebp),%eax
c0109308:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010930b:	8b 45 10             	mov    0x10(%ebp),%eax
c010930e:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109314:	83 ec 08             	sub    $0x8,%esp
c0109317:	50                   	push   %eax
c0109318:	ff 75 d8             	pushl  -0x28(%ebp)
c010931b:	e8 a2 ce ff ff       	call   c01061c2 <get_physical_address_proc>
c0109320:	83 c4 10             	add    $0x10,%esp
c0109323:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109326:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010932d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109330:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109336:	85 c0                	test   %eax,%eax
c0109338:	0f 84 c5 00 00 00    	je     c0109403 <sys_receive_msg+0x27e>
c010933e:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109342:	74 0d                	je     c0109351 <sys_receive_msg+0x1cc>
c0109344:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010934b:	0f 85 b2 00 00 00    	jne    c0109403 <sys_receive_msg+0x27e>
c0109351:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0109358:	83 ec 0c             	sub    $0xc,%esp
c010935b:	ff 75 d0             	pushl  -0x30(%ebp)
c010935e:	e8 49 85 ff ff       	call   c01018ac <sys_malloc>
c0109363:	83 c4 10             	add    $0x10,%esp
c0109366:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109369:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010936c:	83 ec 04             	sub    $0x4,%esp
c010936f:	50                   	push   %eax
c0109370:	6a 00                	push   $0x0
c0109372:	ff 75 cc             	pushl  -0x34(%ebp)
c0109375:	e8 f5 2e 00 00       	call   c010c26f <Memset>
c010937a:	83 c4 10             	add    $0x10,%esp
c010937d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109380:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109386:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109389:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109390:	83 ec 08             	sub    $0x8,%esp
c0109393:	ff 75 d0             	pushl  -0x30(%ebp)
c0109396:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109399:	e8 51 cd ff ff       	call   c01060ef <alloc_virtual_memory>
c010939e:	83 c4 10             	add    $0x10,%esp
c01093a1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01093a4:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01093a7:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01093aa:	83 ec 04             	sub    $0x4,%esp
c01093ad:	52                   	push   %edx
c01093ae:	ff 75 cc             	pushl  -0x34(%ebp)
c01093b1:	50                   	push   %eax
c01093b2:	e8 a5 db ff ff       	call   c0106f5c <Memcpy>
c01093b7:	83 c4 10             	add    $0x10,%esp
c01093ba:	8b 45 10             	mov    0x10(%ebp),%eax
c01093bd:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c01093c4:	00 00 00 
c01093c7:	8b 45 10             	mov    0x10(%ebp),%eax
c01093ca:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01093d1:	00 00 00 
c01093d4:	8b 45 10             	mov    0x10(%ebp),%eax
c01093d7:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01093de:	00 00 00 
c01093e1:	8b 45 10             	mov    0x10(%ebp),%eax
c01093e4:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01093eb:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01093f2:	83 ec 08             	sub    $0x8,%esp
c01093f5:	ff 75 d0             	pushl  -0x30(%ebp)
c01093f8:	ff 75 cc             	pushl  -0x34(%ebp)
c01093fb:	e8 c1 84 ff ff       	call   c01018c1 <sys_free>
c0109400:	83 c4 10             	add    $0x10,%esp
c0109403:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0109407:	0f 84 d4 03 00 00    	je     c01097e1 <sys_receive_msg+0x65c>
c010940d:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109411:	75 26                	jne    c0109439 <sys_receive_msg+0x2b4>
c0109413:	8b 45 10             	mov    0x10(%ebp),%eax
c0109416:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010941c:	85 c0                	test   %eax,%eax
c010941e:	0f 84 8a 00 00 00    	je     c01094ae <sys_receive_msg+0x329>
c0109424:	8b 45 10             	mov    0x10(%ebp),%eax
c0109427:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010942d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109430:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0109437:	eb 75                	jmp    c01094ae <sys_receive_msg+0x329>
c0109439:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010943d:	78 6f                	js     c01094ae <sys_receive_msg+0x329>
c010943f:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109443:	7f 69                	jg     c01094ae <sys_receive_msg+0x329>
c0109445:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109448:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010944f:	3c 01                	cmp    $0x1,%al
c0109451:	75 5b                	jne    c01094ae <sys_receive_msg+0x329>
c0109453:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109456:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010945c:	83 f8 12             	cmp    $0x12,%eax
c010945f:	74 0e                	je     c010946f <sys_receive_msg+0x2ea>
c0109461:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109464:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010946a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c010946d:	75 3f                	jne    c01094ae <sys_receive_msg+0x329>
c010946f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109472:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109478:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010947b:	eb 2b                	jmp    c01094a8 <sys_receive_msg+0x323>
c010947d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109480:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109483:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109486:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010948c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010948f:	39 c2                	cmp    %eax,%edx
c0109491:	75 09                	jne    c010949c <sys_receive_msg+0x317>
c0109493:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010949a:	eb 12                	jmp    c01094ae <sys_receive_msg+0x329>
c010949c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010949f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c01094a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01094a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01094ac:	75 cf                	jne    c010947d <sys_receive_msg+0x2f8>
c01094ae:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c01094b2:	0f 85 4e 02 00 00    	jne    c0109706 <sys_receive_msg+0x581>
c01094b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01094bb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01094be:	83 ec 08             	sub    $0x8,%esp
c01094c1:	ff 75 dc             	pushl  -0x24(%ebp)
c01094c4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01094c7:	e8 23 cc ff ff       	call   c01060ef <alloc_virtual_memory>
c01094cc:	83 c4 10             	add    $0x10,%esp
c01094cf:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01094d2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01094d5:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01094db:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01094de:	83 ec 0c             	sub    $0xc,%esp
c01094e1:	ff 75 c4             	pushl  -0x3c(%ebp)
c01094e4:	e8 43 a6 ff ff       	call   c0103b2c <proc2pid>
c01094e9:	83 c4 10             	add    $0x10,%esp
c01094ec:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01094ef:	83 ec 08             	sub    $0x8,%esp
c01094f2:	ff 75 b8             	pushl  -0x48(%ebp)
c01094f5:	ff 75 bc             	pushl  -0x44(%ebp)
c01094f8:	e8 c5 cc ff ff       	call   c01061c2 <get_physical_address_proc>
c01094fd:	83 c4 10             	add    $0x10,%esp
c0109500:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0109503:	83 ec 08             	sub    $0x8,%esp
c0109506:	ff 75 dc             	pushl  -0x24(%ebp)
c0109509:	ff 75 b4             	pushl  -0x4c(%ebp)
c010950c:	e8 de cb ff ff       	call   c01060ef <alloc_virtual_memory>
c0109511:	83 c4 10             	add    $0x10,%esp
c0109514:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0109517:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010951a:	83 ec 04             	sub    $0x4,%esp
c010951d:	50                   	push   %eax
c010951e:	ff 75 b0             	pushl  -0x50(%ebp)
c0109521:	ff 75 c0             	pushl  -0x40(%ebp)
c0109524:	e8 33 da ff ff       	call   c0106f5c <Memcpy>
c0109529:	83 c4 10             	add    $0x10,%esp
c010952c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010952f:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0109532:	8b 45 10             	mov    0x10(%ebp),%eax
c0109535:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010953b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010953e:	75 21                	jne    c0109561 <sys_receive_msg+0x3dc>
c0109540:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109543:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109549:	8b 45 10             	mov    0x10(%ebp),%eax
c010954c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109552:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109555:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010955c:	00 00 00 
c010955f:	eb 1f                	jmp    c0109580 <sys_receive_msg+0x3fb>
c0109561:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109564:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010956a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010956d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109573:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109576:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010957d:	00 00 00 
c0109580:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109583:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010958a:	00 00 00 
c010958d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109590:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109597:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010959a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01095a1:	00 00 00 
c01095a4:	8b 45 10             	mov    0x10(%ebp),%eax
c01095a7:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01095ae:	00 00 00 
c01095b1:	8b 45 10             	mov    0x10(%ebp),%eax
c01095b4:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01095bb:	00 00 00 
c01095be:	8b 45 10             	mov    0x10(%ebp),%eax
c01095c1:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01095c8:	00 00 00 
c01095cb:	83 ec 0c             	sub    $0xc,%esp
c01095ce:	ff 75 c4             	pushl  -0x3c(%ebp)
c01095d1:	e8 46 03 00 00       	call   c010991c <unblock>
c01095d6:	83 c4 10             	add    $0x10,%esp
c01095d9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01095dc:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01095e2:	85 c0                	test   %eax,%eax
c01095e4:	74 1c                	je     c0109602 <sys_receive_msg+0x47d>
c01095e6:	68 56 06 00 00       	push   $0x656
c01095eb:	68 01 bb 10 c0       	push   $0xc010bb01
c01095f0:	68 01 bb 10 c0       	push   $0xc010bb01
c01095f5:	68 ff c0 10 c0       	push   $0xc010c0ff
c01095fa:	e8 76 f5 ff ff       	call   c0108b75 <assertion_failure>
c01095ff:	83 c4 10             	add    $0x10,%esp
c0109602:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109605:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010960c:	84 c0                	test   %al,%al
c010960e:	74 1c                	je     c010962c <sys_receive_msg+0x4a7>
c0109610:	68 57 06 00 00       	push   $0x657
c0109615:	68 01 bb 10 c0       	push   $0xc010bb01
c010961a:	68 01 bb 10 c0       	push   $0xc010bb01
c010961f:	68 17 c1 10 c0       	push   $0xc010c117
c0109624:	e8 4c f5 ff ff       	call   c0108b75 <assertion_failure>
c0109629:	83 c4 10             	add    $0x10,%esp
c010962c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010962f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109635:	83 f8 21             	cmp    $0x21,%eax
c0109638:	74 1c                	je     c0109656 <sys_receive_msg+0x4d1>
c010963a:	68 58 06 00 00       	push   $0x658
c010963f:	68 01 bb 10 c0       	push   $0xc010bb01
c0109644:	68 01 bb 10 c0       	push   $0xc010bb01
c0109649:	68 30 c1 10 c0       	push   $0xc010c130
c010964e:	e8 22 f5 ff ff       	call   c0108b75 <assertion_failure>
c0109653:	83 c4 10             	add    $0x10,%esp
c0109656:	8b 45 10             	mov    0x10(%ebp),%eax
c0109659:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010965f:	85 c0                	test   %eax,%eax
c0109661:	74 1c                	je     c010967f <sys_receive_msg+0x4fa>
c0109663:	68 5a 06 00 00       	push   $0x65a
c0109668:	68 01 bb 10 c0       	push   $0xc010bb01
c010966d:	68 01 bb 10 c0       	push   $0xc010bb01
c0109672:	68 5c c0 10 c0       	push   $0xc010c05c
c0109677:	e8 f9 f4 ff ff       	call   c0108b75 <assertion_failure>
c010967c:	83 c4 10             	add    $0x10,%esp
c010967f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109682:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109689:	84 c0                	test   %al,%al
c010968b:	74 1c                	je     c01096a9 <sys_receive_msg+0x524>
c010968d:	68 5b 06 00 00       	push   $0x65b
c0109692:	68 01 bb 10 c0       	push   $0xc010bb01
c0109697:	68 01 bb 10 c0       	push   $0xc010bb01
c010969c:	68 71 c0 10 c0       	push   $0xc010c071
c01096a1:	e8 cf f4 ff ff       	call   c0108b75 <assertion_failure>
c01096a6:	83 c4 10             	add    $0x10,%esp
c01096a9:	8b 45 10             	mov    0x10(%ebp),%eax
c01096ac:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01096b2:	83 f8 21             	cmp    $0x21,%eax
c01096b5:	74 1c                	je     c01096d3 <sys_receive_msg+0x54e>
c01096b7:	68 5c 06 00 00       	push   $0x65c
c01096bc:	68 01 bb 10 c0       	push   $0xc010bb01
c01096c1:	68 01 bb 10 c0       	push   $0xc010bb01
c01096c6:	68 88 c0 10 c0       	push   $0xc010c088
c01096cb:	e8 a5 f4 ff ff       	call   c0108b75 <assertion_failure>
c01096d0:	83 c4 10             	add    $0x10,%esp
c01096d3:	8b 45 10             	mov    0x10(%ebp),%eax
c01096d6:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01096dc:	83 f8 21             	cmp    $0x21,%eax
c01096df:	0f 84 f5 00 00 00    	je     c01097da <sys_receive_msg+0x655>
c01096e5:	68 5d 06 00 00       	push   $0x65d
c01096ea:	68 01 bb 10 c0       	push   $0xc010bb01
c01096ef:	68 01 bb 10 c0       	push   $0xc010bb01
c01096f4:	68 54 c1 10 c0       	push   $0xc010c154
c01096f9:	e8 77 f4 ff ff       	call   c0108b75 <assertion_failure>
c01096fe:	83 c4 10             	add    $0x10,%esp
c0109701:	e9 d4 00 00 00       	jmp    c01097da <sys_receive_msg+0x655>
c0109706:	8b 45 10             	mov    0x10(%ebp),%eax
c0109709:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c0109710:	8b 45 10             	mov    0x10(%ebp),%eax
c0109713:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010971a:	3c 02                	cmp    $0x2,%al
c010971c:	74 1c                	je     c010973a <sys_receive_msg+0x5b5>
c010971e:	68 62 06 00 00       	push   $0x662
c0109723:	68 01 bb 10 c0       	push   $0xc010bb01
c0109728:	68 01 bb 10 c0       	push   $0xc010bb01
c010972d:	68 73 c1 10 c0       	push   $0xc010c173
c0109732:	e8 3e f4 ff ff       	call   c0108b75 <assertion_failure>
c0109737:	83 c4 10             	add    $0x10,%esp
c010973a:	8b 45 10             	mov    0x10(%ebp),%eax
c010973d:	8b 55 08             	mov    0x8(%ebp),%edx
c0109740:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109746:	8b 45 10             	mov    0x10(%ebp),%eax
c0109749:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109750:	3c 02                	cmp    $0x2,%al
c0109752:	74 1c                	je     c0109770 <sys_receive_msg+0x5eb>
c0109754:	68 64 06 00 00       	push   $0x664
c0109759:	68 01 bb 10 c0       	push   $0xc010bb01
c010975e:	68 01 bb 10 c0       	push   $0xc010bb01
c0109763:	68 73 c1 10 c0       	push   $0xc010c173
c0109768:	e8 08 f4 ff ff       	call   c0108b75 <assertion_failure>
c010976d:	83 c4 10             	add    $0x10,%esp
c0109770:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109774:	75 0f                	jne    c0109785 <sys_receive_msg+0x600>
c0109776:	8b 45 10             	mov    0x10(%ebp),%eax
c0109779:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c0109780:	00 00 00 
c0109783:	eb 0c                	jmp    c0109791 <sys_receive_msg+0x60c>
c0109785:	8b 45 10             	mov    0x10(%ebp),%eax
c0109788:	8b 55 0c             	mov    0xc(%ebp),%edx
c010978b:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0109791:	8b 45 10             	mov    0x10(%ebp),%eax
c0109794:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010979b:	3c 02                	cmp    $0x2,%al
c010979d:	74 2d                	je     c01097cc <sys_receive_msg+0x647>
c010979f:	8b 45 10             	mov    0x10(%ebp),%eax
c01097a2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01097a9:	0f be c0             	movsbl %al,%eax
c01097ac:	83 ec 0c             	sub    $0xc,%esp
c01097af:	68 6f 06 00 00       	push   $0x66f
c01097b4:	68 01 bb 10 c0       	push   $0xc010bb01
c01097b9:	68 01 bb 10 c0       	push   $0xc010bb01
c01097be:	50                   	push   %eax
c01097bf:	68 73 c1 10 c0       	push   $0xc010c173
c01097c4:	e8 1e f4 ff ff       	call   c0108be7 <assertion_failure2>
c01097c9:	83 c4 20             	add    $0x20,%esp
c01097cc:	83 ec 0c             	sub    $0xc,%esp
c01097cf:	ff 75 10             	pushl  0x10(%ebp)
c01097d2:	e8 09 01 00 00       	call   c01098e0 <block>
c01097d7:	83 c4 10             	add    $0x10,%esp
c01097da:	b8 00 00 00 00       	mov    $0x0,%eax
c01097df:	eb 02                	jmp    c01097e3 <sys_receive_msg+0x65e>
c01097e1:	90                   	nop
c01097e2:	90                   	nop
c01097e3:	c9                   	leave  
c01097e4:	c3                   	ret    

c01097e5 <send_rec>:
c01097e5:	55                   	push   %ebp
c01097e6:	89 e5                	mov    %esp,%ebp
c01097e8:	83 ec 18             	sub    $0x18,%esp
c01097eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01097f1:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01097f8:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01097fc:	74 28                	je     c0109826 <send_rec+0x41>
c01097fe:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109802:	74 22                	je     c0109826 <send_rec+0x41>
c0109804:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109808:	74 1c                	je     c0109826 <send_rec+0x41>
c010980a:	68 81 06 00 00       	push   $0x681
c010980f:	68 01 bb 10 c0       	push   $0xc010bb01
c0109814:	68 01 bb 10 c0       	push   $0xc010bb01
c0109819:	68 94 c1 10 c0       	push   $0xc010c194
c010981e:	e8 52 f3 ff ff       	call   c0108b75 <assertion_failure>
c0109823:	83 c4 10             	add    $0x10,%esp
c0109826:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010982a:	75 14                	jne    c0109840 <send_rec+0x5b>
c010982c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010982f:	83 ec 04             	sub    $0x4,%esp
c0109832:	50                   	push   %eax
c0109833:	6a 00                	push   $0x0
c0109835:	ff 75 0c             	pushl  0xc(%ebp)
c0109838:	e8 32 2a 00 00       	call   c010c26f <Memset>
c010983d:	83 c4 10             	add    $0x10,%esp
c0109840:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109844:	74 23                	je     c0109869 <send_rec+0x84>
c0109846:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010984a:	74 34                	je     c0109880 <send_rec+0x9b>
c010984c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109850:	75 74                	jne    c01098c6 <send_rec+0xe1>
c0109852:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109855:	83 ec 08             	sub    $0x8,%esp
c0109858:	ff 75 10             	pushl  0x10(%ebp)
c010985b:	50                   	push   %eax
c010985c:	e8 1f 80 ff ff       	call   c0101880 <send_msg>
c0109861:	83 c4 10             	add    $0x10,%esp
c0109864:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109867:	eb 70                	jmp    c01098d9 <send_rec+0xf4>
c0109869:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010986c:	83 ec 08             	sub    $0x8,%esp
c010986f:	ff 75 10             	pushl  0x10(%ebp)
c0109872:	50                   	push   %eax
c0109873:	e8 1e 80 ff ff       	call   c0101896 <receive_msg>
c0109878:	83 c4 10             	add    $0x10,%esp
c010987b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010987e:	eb 59                	jmp    c01098d9 <send_rec+0xf4>
c0109880:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109883:	83 ec 08             	sub    $0x8,%esp
c0109886:	ff 75 10             	pushl  0x10(%ebp)
c0109889:	50                   	push   %eax
c010988a:	e8 f1 7f ff ff       	call   c0101880 <send_msg>
c010988f:	83 c4 10             	add    $0x10,%esp
c0109892:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109895:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0109899:	75 3d                	jne    c01098d8 <send_rec+0xf3>
c010989b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010989e:	83 ec 04             	sub    $0x4,%esp
c01098a1:	50                   	push   %eax
c01098a2:	6a 00                	push   $0x0
c01098a4:	ff 75 0c             	pushl  0xc(%ebp)
c01098a7:	e8 c3 29 00 00       	call   c010c26f <Memset>
c01098ac:	83 c4 10             	add    $0x10,%esp
c01098af:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098b2:	83 ec 08             	sub    $0x8,%esp
c01098b5:	ff 75 10             	pushl  0x10(%ebp)
c01098b8:	50                   	push   %eax
c01098b9:	e8 d8 7f ff ff       	call   c0101896 <receive_msg>
c01098be:	83 c4 10             	add    $0x10,%esp
c01098c1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01098c4:	eb 12                	jmp    c01098d8 <send_rec+0xf3>
c01098c6:	83 ec 0c             	sub    $0xc,%esp
c01098c9:	68 d0 c1 10 c0       	push   $0xc010c1d0
c01098ce:	e8 84 f2 ff ff       	call   c0108b57 <panic>
c01098d3:	83 c4 10             	add    $0x10,%esp
c01098d6:	eb 01                	jmp    c01098d9 <send_rec+0xf4>
c01098d8:	90                   	nop
c01098d9:	b8 00 00 00 00       	mov    $0x0,%eax
c01098de:	c9                   	leave  
c01098df:	c3                   	ret    

c01098e0 <block>:
c01098e0:	55                   	push   %ebp
c01098e1:	89 e5                	mov    %esp,%ebp
c01098e3:	83 ec 08             	sub    $0x8,%esp
c01098e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01098e9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01098f0:	84 c0                	test   %al,%al
c01098f2:	75 1c                	jne    c0109910 <block+0x30>
c01098f4:	68 b0 06 00 00       	push   $0x6b0
c01098f9:	68 01 bb 10 c0       	push   $0xc010bb01
c01098fe:	68 01 bb 10 c0       	push   $0xc010bb01
c0109903:	68 e5 c1 10 c0       	push   $0xc010c1e5
c0109908:	e8 68 f2 ff ff       	call   c0108b75 <assertion_failure>
c010990d:	83 c4 10             	add    $0x10,%esp
c0109910:	e8 13 a0 ff ff       	call   c0103928 <schedule_process>
c0109915:	b8 00 00 00 00       	mov    $0x0,%eax
c010991a:	c9                   	leave  
c010991b:	c3                   	ret    

c010991c <unblock>:
c010991c:	55                   	push   %ebp
c010991d:	89 e5                	mov    %esp,%ebp
c010991f:	83 ec 08             	sub    $0x8,%esp
c0109922:	8b 45 08             	mov    0x8(%ebp),%eax
c0109925:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010992c:	84 c0                	test   %al,%al
c010992e:	74 1c                	je     c010994c <unblock+0x30>
c0109930:	68 b9 06 00 00       	push   $0x6b9
c0109935:	68 01 bb 10 c0       	push   $0xc010bb01
c010993a:	68 01 bb 10 c0       	push   $0xc010bb01
c010993f:	68 fd c1 10 c0       	push   $0xc010c1fd
c0109944:	e8 2c f2 ff ff       	call   c0108b75 <assertion_failure>
c0109949:	83 c4 10             	add    $0x10,%esp
c010994c:	8b 45 08             	mov    0x8(%ebp),%eax
c010994f:	05 60 02 00 00       	add    $0x260,%eax
c0109954:	83 ec 08             	sub    $0x8,%esp
c0109957:	50                   	push   %eax
c0109958:	68 ec fd 10 c0       	push   $0xc010fdec
c010995d:	e8 ce 0a 00 00       	call   c010a430 <appendToDoubleLinkList>
c0109962:	83 c4 10             	add    $0x10,%esp
c0109965:	b8 00 00 00 00       	mov    $0x0,%eax
c010996a:	c9                   	leave  
c010996b:	c3                   	ret    

c010996c <get_ticks_ipc>:
c010996c:	55                   	push   %ebp
c010996d:	89 e5                	mov    %esp,%ebp
c010996f:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109975:	83 ec 04             	sub    $0x4,%esp
c0109978:	6a 7c                	push   $0x7c
c010997a:	6a 00                	push   $0x0
c010997c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109982:	50                   	push   %eax
c0109983:	e8 e7 28 00 00       	call   c010c26f <Memset>
c0109988:	83 c4 10             	add    $0x10,%esp
c010998b:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109992:	00 00 00 
c0109995:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010999c:	83 ec 04             	sub    $0x4,%esp
c010999f:	6a 01                	push   $0x1
c01099a1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01099a7:	50                   	push   %eax
c01099a8:	6a 03                	push   $0x3
c01099aa:	e8 36 fe ff ff       	call   c01097e5 <send_rec>
c01099af:	83 c4 10             	add    $0x10,%esp
c01099b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01099b5:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01099bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01099be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01099c1:	c9                   	leave  
c01099c2:	c3                   	ret    

c01099c3 <itoa>:
c01099c3:	55                   	push   %ebp
c01099c4:	89 e5                	mov    %esp,%ebp
c01099c6:	53                   	push   %ebx
c01099c7:	83 ec 14             	sub    $0x14,%esp
c01099ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01099cd:	99                   	cltd   
c01099ce:	f7 7d 10             	idivl  0x10(%ebp)
c01099d1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01099d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01099d7:	99                   	cltd   
c01099d8:	f7 7d 10             	idivl  0x10(%ebp)
c01099db:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01099de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01099e2:	74 14                	je     c01099f8 <itoa+0x35>
c01099e4:	83 ec 04             	sub    $0x4,%esp
c01099e7:	ff 75 10             	pushl  0x10(%ebp)
c01099ea:	ff 75 0c             	pushl  0xc(%ebp)
c01099ed:	ff 75 f0             	pushl  -0x10(%ebp)
c01099f0:	e8 ce ff ff ff       	call   c01099c3 <itoa>
c01099f5:	83 c4 10             	add    $0x10,%esp
c01099f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099fb:	8d 58 30             	lea    0x30(%eax),%ebx
c01099fe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109a01:	8b 00                	mov    (%eax),%eax
c0109a03:	8d 48 01             	lea    0x1(%eax),%ecx
c0109a06:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109a09:	89 0a                	mov    %ecx,(%edx)
c0109a0b:	89 da                	mov    %ebx,%edx
c0109a0d:	88 10                	mov    %dl,(%eax)
c0109a0f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109a12:	8b 00                	mov    (%eax),%eax
c0109a14:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109a17:	c9                   	leave  
c0109a18:	c3                   	ret    

c0109a19 <i2a>:
c0109a19:	55                   	push   %ebp
c0109a1a:	89 e5                	mov    %esp,%ebp
c0109a1c:	53                   	push   %ebx
c0109a1d:	83 ec 14             	sub    $0x14,%esp
c0109a20:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a23:	99                   	cltd   
c0109a24:	f7 7d 0c             	idivl  0xc(%ebp)
c0109a27:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109a2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a2d:	99                   	cltd   
c0109a2e:	f7 7d 0c             	idivl  0xc(%ebp)
c0109a31:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a34:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109a38:	74 14                	je     c0109a4e <i2a+0x35>
c0109a3a:	83 ec 04             	sub    $0x4,%esp
c0109a3d:	ff 75 10             	pushl  0x10(%ebp)
c0109a40:	ff 75 0c             	pushl  0xc(%ebp)
c0109a43:	ff 75 f0             	pushl  -0x10(%ebp)
c0109a46:	e8 ce ff ff ff       	call   c0109a19 <i2a>
c0109a4b:	83 c4 10             	add    $0x10,%esp
c0109a4e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109a52:	7f 0a                	jg     c0109a5e <i2a+0x45>
c0109a54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a57:	83 c0 30             	add    $0x30,%eax
c0109a5a:	89 c3                	mov    %eax,%ebx
c0109a5c:	eb 08                	jmp    c0109a66 <i2a+0x4d>
c0109a5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a61:	83 c0 37             	add    $0x37,%eax
c0109a64:	89 c3                	mov    %eax,%ebx
c0109a66:	8b 45 10             	mov    0x10(%ebp),%eax
c0109a69:	8b 00                	mov    (%eax),%eax
c0109a6b:	8d 48 01             	lea    0x1(%eax),%ecx
c0109a6e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109a71:	89 0a                	mov    %ecx,(%edx)
c0109a73:	88 18                	mov    %bl,(%eax)
c0109a75:	8b 45 10             	mov    0x10(%ebp),%eax
c0109a78:	8b 00                	mov    (%eax),%eax
c0109a7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109a7d:	c9                   	leave  
c0109a7e:	c3                   	ret    

c0109a7f <inform_int>:
c0109a7f:	55                   	push   %ebp
c0109a80:	89 e5                	mov    %esp,%ebp
c0109a82:	83 ec 18             	sub    $0x18,%esp
c0109a85:	83 ec 0c             	sub    $0xc,%esp
c0109a88:	ff 75 08             	pushl  0x8(%ebp)
c0109a8b:	e8 16 a0 ff ff       	call   c0103aa6 <pid2proc>
c0109a90:	83 c4 10             	add    $0x10,%esp
c0109a93:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a99:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109aa0:	0f be c0             	movsbl %al,%eax
c0109aa3:	83 e0 02             	and    $0x2,%eax
c0109aa6:	85 c0                	test   %eax,%eax
c0109aa8:	0f 84 8e 00 00 00    	je     c0109b3c <inform_int+0xbd>
c0109aae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ab1:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109ab7:	3d 13 02 00 00       	cmp    $0x213,%eax
c0109abc:	74 0e                	je     c0109acc <inform_int+0x4d>
c0109abe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ac1:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109ac7:	83 f8 12             	cmp    $0x12,%eax
c0109aca:	75 7d                	jne    c0109b49 <inform_int+0xca>
c0109acc:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ad6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109adc:	83 ec 08             	sub    $0x8,%esp
c0109adf:	ff 75 f0             	pushl  -0x10(%ebp)
c0109ae2:	50                   	push   %eax
c0109ae3:	e8 07 c6 ff ff       	call   c01060ef <alloc_virtual_memory>
c0109ae8:	83 c4 10             	add    $0x10,%esp
c0109aeb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109aee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109af1:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109af7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109afa:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b04:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109b0b:	00 00 00 
c0109b0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b11:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109b18:	00 00 00 
c0109b1b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109b22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b25:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109b2c:	83 ec 0c             	sub    $0xc,%esp
c0109b2f:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b32:	e8 e5 fd ff ff       	call   c010991c <unblock>
c0109b37:	83 c4 10             	add    $0x10,%esp
c0109b3a:	eb 0d                	jmp    c0109b49 <inform_int+0xca>
c0109b3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b3f:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109b46:	00 00 00 
c0109b49:	90                   	nop
c0109b4a:	c9                   	leave  
c0109b4b:	c3                   	ret    

c0109b4c <strcmp>:
c0109b4c:	55                   	push   %ebp
c0109b4d:	89 e5                	mov    %esp,%ebp
c0109b4f:	83 ec 10             	sub    $0x10,%esp
c0109b52:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109b56:	74 06                	je     c0109b5e <strcmp+0x12>
c0109b58:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109b5c:	75 08                	jne    c0109b66 <strcmp+0x1a>
c0109b5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b61:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109b64:	eb 53                	jmp    c0109bb9 <strcmp+0x6d>
c0109b66:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b69:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0109b6c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109b6f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109b72:	eb 18                	jmp    c0109b8c <strcmp+0x40>
c0109b74:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109b77:	0f b6 10             	movzbl (%eax),%edx
c0109b7a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109b7d:	0f b6 00             	movzbl (%eax),%eax
c0109b80:	38 c2                	cmp    %al,%dl
c0109b82:	75 1e                	jne    c0109ba2 <strcmp+0x56>
c0109b84:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0109b88:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0109b8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109b8f:	0f b6 00             	movzbl (%eax),%eax
c0109b92:	84 c0                	test   %al,%al
c0109b94:	74 0d                	je     c0109ba3 <strcmp+0x57>
c0109b96:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109b99:	0f b6 00             	movzbl (%eax),%eax
c0109b9c:	84 c0                	test   %al,%al
c0109b9e:	75 d4                	jne    c0109b74 <strcmp+0x28>
c0109ba0:	eb 01                	jmp    c0109ba3 <strcmp+0x57>
c0109ba2:	90                   	nop
c0109ba3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109ba6:	0f b6 00             	movzbl (%eax),%eax
c0109ba9:	0f be d0             	movsbl %al,%edx
c0109bac:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109baf:	0f b6 00             	movzbl (%eax),%eax
c0109bb2:	0f be c0             	movsbl %al,%eax
c0109bb5:	29 c2                	sub    %eax,%edx
c0109bb7:	89 d0                	mov    %edx,%eax
c0109bb9:	c9                   	leave  
c0109bba:	c3                   	ret    

c0109bbb <create_user_process_address_space>:
c0109bbb:	55                   	push   %ebp
c0109bbc:	89 e5                	mov    %esp,%ebp
c0109bbe:	83 ec 18             	sub    $0x18,%esp
c0109bc1:	83 ec 08             	sub    $0x8,%esp
c0109bc4:	6a 00                	push   $0x0
c0109bc6:	6a 01                	push   $0x1
c0109bc8:	e8 5a c8 ff ff       	call   c0106427 <alloc_memory>
c0109bcd:	83 c4 10             	add    $0x10,%esp
c0109bd0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109bd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bd6:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109bdd:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109be4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109be7:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109bec:	c1 e8 0c             	shr    $0xc,%eax
c0109bef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109bf2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109bf5:	83 c0 07             	add    $0x7,%eax
c0109bf8:	c1 e8 03             	shr    $0x3,%eax
c0109bfb:	89 c2                	mov    %eax,%edx
c0109bfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c00:	89 50 04             	mov    %edx,0x4(%eax)
c0109c03:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c06:	8b 40 04             	mov    0x4(%eax),%eax
c0109c09:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109c0e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0109c14:	85 c0                	test   %eax,%eax
c0109c16:	0f 48 c2             	cmovs  %edx,%eax
c0109c19:	c1 f8 0c             	sar    $0xc,%eax
c0109c1c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109c1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109c22:	83 ec 08             	sub    $0x8,%esp
c0109c25:	6a 00                	push   $0x0
c0109c27:	50                   	push   %eax
c0109c28:	e8 fa c7 ff ff       	call   c0106427 <alloc_memory>
c0109c2d:	83 c4 10             	add    $0x10,%esp
c0109c30:	89 c2                	mov    %eax,%edx
c0109c32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c35:	89 10                	mov    %edx,(%eax)
c0109c37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c3a:	83 ec 0c             	sub    $0xc,%esp
c0109c3d:	50                   	push   %eax
c0109c3e:	e8 b6 bf ff ff       	call   c0105bf9 <init_bitmap>
c0109c43:	83 c4 10             	add    $0x10,%esp
c0109c46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c49:	c9                   	leave  
c0109c4a:	c3                   	ret    

c0109c4b <user_process>:
c0109c4b:	55                   	push   %ebp
c0109c4c:	89 e5                	mov    %esp,%ebp
c0109c4e:	83 ec 38             	sub    $0x38,%esp
c0109c51:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109c58:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109c5f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109c66:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0109c6a:	75 0e                	jne    c0109c7a <user_process+0x2f>
c0109c6c:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109c72:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109c78:	eb 0c                	jmp    c0109c86 <user_process+0x3b>
c0109c7a:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109c80:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109c86:	e8 b1 67 ff ff       	call   c010043c <get_running_thread_pcb>
c0109c8b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c91:	8b 55 14             	mov    0x14(%ebp),%edx
c0109c94:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109c9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c9d:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109ca3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ca6:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109cac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109caf:	05 00 10 00 00       	add    $0x1000,%eax
c0109cb4:	89 c2                	mov    %eax,%edx
c0109cb6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cb9:	89 10                	mov    %edx,(%eax)
c0109cbb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cbe:	8b 00                	mov    (%eax),%eax
c0109cc0:	83 e8 44             	sub    $0x44,%eax
c0109cc3:	89 c2                	mov    %eax,%edx
c0109cc5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cc8:	89 10                	mov    %edx,(%eax)
c0109cca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ccd:	8b 00                	mov    (%eax),%eax
c0109ccf:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109cd2:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109cd6:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109cdc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109ce0:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109ce4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109ce8:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109cec:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109cf0:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109cf4:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109cfa:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109cfe:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d01:	89 50 34             	mov    %edx,0x34(%eax)
c0109d04:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109d08:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d0b:	89 50 0c             	mov    %edx,0xc(%eax)
c0109d0e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109d12:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d15:	89 50 04             	mov    %edx,0x4(%eax)
c0109d18:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109d1c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d1f:	89 50 08             	mov    %edx,0x8(%eax)
c0109d22:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109d26:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d29:	89 50 40             	mov    %edx,0x40(%eax)
c0109d2c:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109d30:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d33:	89 10                	mov    %edx,(%eax)
c0109d35:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d38:	8b 55 08             	mov    0x8(%ebp),%edx
c0109d3b:	89 50 30             	mov    %edx,0x30(%eax)
c0109d3e:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109d42:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d45:	89 50 38             	mov    %edx,0x38(%eax)
c0109d48:	83 ec 08             	sub    $0x8,%esp
c0109d4b:	6a 01                	push   $0x1
c0109d4d:	68 00 f0 ff bf       	push   $0xbffff000
c0109d52:	e8 08 c6 ff ff       	call   c010635f <alloc_physical_memory>
c0109d57:	83 c4 10             	add    $0x10,%esp
c0109d5a:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109d60:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d63:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109d66:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d69:	83 ec 0c             	sub    $0xc,%esp
c0109d6c:	50                   	push   %eax
c0109d6d:	e8 9d 65 ff ff       	call   c010030f <restart>
c0109d72:	83 c4 10             	add    $0x10,%esp
c0109d75:	90                   	nop
c0109d76:	c9                   	leave  
c0109d77:	c3                   	ret    

c0109d78 <clone_pcb>:
c0109d78:	55                   	push   %ebp
c0109d79:	89 e5                	mov    %esp,%ebp
c0109d7b:	83 ec 38             	sub    $0x38,%esp
c0109d7e:	83 ec 08             	sub    $0x8,%esp
c0109d81:	6a 00                	push   $0x0
c0109d83:	6a 01                	push   $0x1
c0109d85:	e8 9d c6 ff ff       	call   c0106427 <alloc_memory>
c0109d8a:	83 c4 10             	add    $0x10,%esp
c0109d8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109d90:	83 ec 04             	sub    $0x4,%esp
c0109d93:	68 00 10 00 00       	push   $0x1000
c0109d98:	6a 00                	push   $0x0
c0109d9a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109d9d:	e8 cd 24 00 00       	call   c010c26f <Memset>
c0109da2:	83 c4 10             	add    $0x10,%esp
c0109da5:	83 ec 04             	sub    $0x4,%esp
c0109da8:	68 00 10 00 00       	push   $0x1000
c0109dad:	ff 75 08             	pushl  0x8(%ebp)
c0109db0:	ff 75 f4             	pushl  -0xc(%ebp)
c0109db3:	e8 a4 d1 ff ff       	call   c0106f5c <Memcpy>
c0109db8:	83 c4 10             	add    $0x10,%esp
c0109dbb:	a1 cc 06 11 c0       	mov    0xc01106cc,%eax
c0109dc0:	8d 50 01             	lea    0x1(%eax),%edx
c0109dc3:	89 15 cc 06 11 c0    	mov    %edx,0xc01106cc
c0109dc9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109dcc:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109dd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dd5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109ddb:	89 c2                	mov    %eax,%edx
c0109ddd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109de0:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109de6:	83 ec 08             	sub    $0x8,%esp
c0109de9:	6a 00                	push   $0x0
c0109deb:	6a 01                	push   $0x1
c0109ded:	e8 35 c6 ff ff       	call   c0106427 <alloc_memory>
c0109df2:	83 c4 10             	add    $0x10,%esp
c0109df5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109df8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109dfb:	05 00 0c 00 00       	add    $0xc00,%eax
c0109e00:	83 ec 04             	sub    $0x4,%esp
c0109e03:	68 00 04 00 00       	push   $0x400
c0109e08:	68 00 fc ff ff       	push   $0xfffffc00
c0109e0d:	50                   	push   %eax
c0109e0e:	e8 49 d1 ff ff       	call   c0106f5c <Memcpy>
c0109e13:	83 c4 10             	add    $0x10,%esp
c0109e16:	83 ec 0c             	sub    $0xc,%esp
c0109e19:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e1c:	e8 1d c4 ff ff       	call   c010623e <get_physical_address>
c0109e21:	83 c4 10             	add    $0x10,%esp
c0109e24:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109e27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e2a:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109e2f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109e32:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e35:	83 c8 07             	or     $0x7,%eax
c0109e38:	89 c2                	mov    %eax,%edx
c0109e3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e3d:	89 10                	mov    %edx,(%eax)
c0109e3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e42:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109e45:	89 50 08             	mov    %edx,0x8(%eax)
c0109e48:	e8 6e fd ff ff       	call   c0109bbb <create_user_process_address_space>
c0109e4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e50:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109e53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e56:	89 50 0c             	mov    %edx,0xc(%eax)
c0109e59:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e5c:	8b 40 0c             	mov    0xc(%eax),%eax
c0109e5f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109e62:	83 ec 04             	sub    $0x4,%esp
c0109e65:	6a 0c                	push   $0xc
c0109e67:	ff 75 e0             	pushl  -0x20(%ebp)
c0109e6a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109e6d:	e8 ea d0 ff ff       	call   c0106f5c <Memcpy>
c0109e72:	83 c4 10             	add    $0x10,%esp
c0109e75:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109e7c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e7f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109e84:	c1 e8 0c             	shr    $0xc,%eax
c0109e87:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109e8a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e8d:	83 c0 07             	add    $0x7,%eax
c0109e90:	c1 e8 03             	shr    $0x3,%eax
c0109e93:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109e96:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e99:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109e9c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109e9f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109ea4:	c1 e8 0c             	shr    $0xc,%eax
c0109ea7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109eaa:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109ead:	83 ec 08             	sub    $0x8,%esp
c0109eb0:	6a 00                	push   $0x0
c0109eb2:	50                   	push   %eax
c0109eb3:	e8 6f c5 ff ff       	call   c0106427 <alloc_memory>
c0109eb8:	83 c4 10             	add    $0x10,%esp
c0109ebb:	89 c2                	mov    %eax,%edx
c0109ebd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ec0:	89 10                	mov    %edx,(%eax)
c0109ec2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109ec5:	c1 e0 0c             	shl    $0xc,%eax
c0109ec8:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109ecb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ece:	8b 10                	mov    (%eax),%edx
c0109ed0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ed3:	8b 00                	mov    (%eax),%eax
c0109ed5:	83 ec 04             	sub    $0x4,%esp
c0109ed8:	ff 75 cc             	pushl  -0x34(%ebp)
c0109edb:	52                   	push   %edx
c0109edc:	50                   	push   %eax
c0109edd:	e8 7a d0 ff ff       	call   c0106f5c <Memcpy>
c0109ee2:	83 c4 10             	add    $0x10,%esp
c0109ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ee8:	c9                   	leave  
c0109ee9:	c3                   	ret    

c0109eea <build_body_stack>:
c0109eea:	55                   	push   %ebp
c0109eeb:	89 e5                	mov    %esp,%ebp
c0109eed:	83 ec 48             	sub    $0x48,%esp
c0109ef0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ef3:	8b 40 0c             	mov    0xc(%eax),%eax
c0109ef6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109ef9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109efc:	8b 50 04             	mov    0x4(%eax),%edx
c0109eff:	8b 00                	mov    (%eax),%eax
c0109f01:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109f04:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109f07:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109f0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109f0d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109f10:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109f13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f16:	8b 40 08             	mov    0x8(%eax),%eax
c0109f19:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109f1c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109f23:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109f2a:	e8 c9 cf ff ff       	call   c0106ef8 <intr_disable>
c0109f2f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109f32:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109f39:	e9 c2 00 00 00       	jmp    c010a000 <build_body_stack+0x116>
c0109f3e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109f41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109f44:	01 d0                	add    %edx,%eax
c0109f46:	0f b6 00             	movzbl (%eax),%eax
c0109f49:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109f4c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109f53:	e9 9a 00 00 00       	jmp    c0109ff2 <build_body_stack+0x108>
c0109f58:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109f5c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109f5f:	89 c1                	mov    %eax,%ecx
c0109f61:	d3 fa                	sar    %cl,%edx
c0109f63:	89 d0                	mov    %edx,%eax
c0109f65:	83 e0 01             	and    $0x1,%eax
c0109f68:	85 c0                	test   %eax,%eax
c0109f6a:	75 06                	jne    c0109f72 <build_body_stack+0x88>
c0109f6c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109f70:	eb 7c                	jmp    c0109fee <build_body_stack+0x104>
c0109f72:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f75:	8b 40 08             	mov    0x8(%eax),%eax
c0109f78:	83 ec 0c             	sub    $0xc,%esp
c0109f7b:	50                   	push   %eax
c0109f7c:	e8 9f 64 ff ff       	call   c0100420 <update_cr3>
c0109f81:	83 c4 10             	add    $0x10,%esp
c0109f84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f87:	c1 e0 0c             	shl    $0xc,%eax
c0109f8a:	89 c2                	mov    %eax,%edx
c0109f8c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109f8f:	01 d0                	add    %edx,%eax
c0109f91:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109f94:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109f97:	8b 45 10             	mov    0x10(%ebp),%eax
c0109f9a:	83 ec 04             	sub    $0x4,%esp
c0109f9d:	68 00 10 00 00       	push   $0x1000
c0109fa2:	52                   	push   %edx
c0109fa3:	50                   	push   %eax
c0109fa4:	e8 b3 cf ff ff       	call   c0106f5c <Memcpy>
c0109fa9:	83 c4 10             	add    $0x10,%esp
c0109fac:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109faf:	8b 40 08             	mov    0x8(%eax),%eax
c0109fb2:	83 ec 0c             	sub    $0xc,%esp
c0109fb5:	50                   	push   %eax
c0109fb6:	e8 65 64 ff ff       	call   c0100420 <update_cr3>
c0109fbb:	83 c4 10             	add    $0x10,%esp
c0109fbe:	83 ec 08             	sub    $0x8,%esp
c0109fc1:	ff 75 cc             	pushl  -0x34(%ebp)
c0109fc4:	6a 01                	push   $0x1
c0109fc6:	e8 be c4 ff ff       	call   c0106489 <get_a_virtual_page>
c0109fcb:	83 c4 10             	add    $0x10,%esp
c0109fce:	8b 55 10             	mov    0x10(%ebp),%edx
c0109fd1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109fd4:	83 ec 04             	sub    $0x4,%esp
c0109fd7:	68 00 10 00 00       	push   $0x1000
c0109fdc:	52                   	push   %edx
c0109fdd:	50                   	push   %eax
c0109fde:	e8 79 cf ff ff       	call   c0106f5c <Memcpy>
c0109fe3:	83 c4 10             	add    $0x10,%esp
c0109fe6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109fea:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109fee:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109ff2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109ff6:	0f 8e 5c ff ff ff    	jle    c0109f58 <build_body_stack+0x6e>
c0109ffc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010a000:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a003:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c010a006:	0f 87 32 ff ff ff    	ja     c0109f3e <build_body_stack+0x54>
c010a00c:	83 ec 0c             	sub    $0xc,%esp
c010a00f:	ff 75 d4             	pushl  -0x2c(%ebp)
c010a012:	e8 0a cf ff ff       	call   c0106f21 <intr_set_status>
c010a017:	83 c4 10             	add    $0x10,%esp
c010a01a:	90                   	nop
c010a01b:	c9                   	leave  
c010a01c:	c3                   	ret    

c010a01d <build_process_kernel_stack>:
c010a01d:	55                   	push   %ebp
c010a01e:	89 e5                	mov    %esp,%ebp
c010a020:	83 ec 28             	sub    $0x28,%esp
c010a023:	e8 d0 ce ff ff       	call   c0106ef8 <intr_disable>
c010a028:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a02b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a02e:	05 00 10 00 00       	add    $0x1000,%eax
c010a033:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a036:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a039:	8b 00                	mov    (%eax),%eax
c010a03b:	83 f8 38             	cmp    $0x38,%eax
c010a03e:	74 06                	je     c010a046 <build_process_kernel_stack+0x29>
c010a040:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010a044:	eb f0                	jmp    c010a036 <build_process_kernel_stack+0x19>
c010a046:	90                   	nop
c010a047:	8b 45 08             	mov    0x8(%ebp),%eax
c010a04a:	05 00 10 00 00       	add    $0x1000,%eax
c010a04f:	89 c2                	mov    %eax,%edx
c010a051:	8b 45 08             	mov    0x8(%ebp),%eax
c010a054:	89 50 04             	mov    %edx,0x4(%eax)
c010a057:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a05a:	83 c0 2c             	add    $0x2c,%eax
c010a05d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a060:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a063:	83 e8 04             	sub    $0x4,%eax
c010a066:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a069:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a06c:	83 e8 08             	sub    $0x8,%eax
c010a06f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a072:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a075:	83 e8 0c             	sub    $0xc,%eax
c010a078:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a07b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a07e:	83 e8 10             	sub    $0x10,%eax
c010a081:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010a084:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a087:	83 e8 14             	sub    $0x14,%eax
c010a08a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010a08d:	ba 00 03 10 c0       	mov    $0xc0100300,%edx
c010a092:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a095:	89 10                	mov    %edx,(%eax)
c010a097:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010a09a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a0a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010a0a3:	8b 10                	mov    (%eax),%edx
c010a0a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010a0a8:	89 10                	mov    %edx,(%eax)
c010a0aa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010a0ad:	8b 10                	mov    (%eax),%edx
c010a0af:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010a0b2:	89 10                	mov    %edx,(%eax)
c010a0b4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010a0b7:	8b 10                	mov    (%eax),%edx
c010a0b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0bc:	89 10                	mov    %edx,(%eax)
c010a0be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a0c1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a0c7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0ca:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010a0cd:	89 10                	mov    %edx,(%eax)
c010a0cf:	83 ec 0c             	sub    $0xc,%esp
c010a0d2:	ff 75 f0             	pushl  -0x10(%ebp)
c010a0d5:	e8 47 ce ff ff       	call   c0106f21 <intr_set_status>
c010a0da:	83 c4 10             	add    $0x10,%esp
c010a0dd:	90                   	nop
c010a0de:	c9                   	leave  
c010a0df:	c3                   	ret    

c010a0e0 <fork_process>:
c010a0e0:	55                   	push   %ebp
c010a0e1:	89 e5                	mov    %esp,%ebp
c010a0e3:	83 ec 18             	sub    $0x18,%esp
c010a0e6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0e9:	83 ec 0c             	sub    $0xc,%esp
c010a0ec:	50                   	push   %eax
c010a0ed:	e8 b4 99 ff ff       	call   c0103aa6 <pid2proc>
c010a0f2:	83 c4 10             	add    $0x10,%esp
c010a0f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a0f8:	83 ec 0c             	sub    $0xc,%esp
c010a0fb:	ff 75 f4             	pushl  -0xc(%ebp)
c010a0fe:	e8 75 fc ff ff       	call   c0109d78 <clone_pcb>
c010a103:	83 c4 10             	add    $0x10,%esp
c010a106:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a109:	83 ec 08             	sub    $0x8,%esp
c010a10c:	6a 00                	push   $0x0
c010a10e:	6a 01                	push   $0x1
c010a110:	e8 12 c3 ff ff       	call   c0106427 <alloc_memory>
c010a115:	83 c4 10             	add    $0x10,%esp
c010a118:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a11b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a11e:	83 ec 04             	sub    $0x4,%esp
c010a121:	68 00 10 00 00       	push   $0x1000
c010a126:	6a 00                	push   $0x0
c010a128:	50                   	push   %eax
c010a129:	e8 41 21 00 00       	call   c010c26f <Memset>
c010a12e:	83 c4 10             	add    $0x10,%esp
c010a131:	83 ec 04             	sub    $0x4,%esp
c010a134:	ff 75 ec             	pushl  -0x14(%ebp)
c010a137:	ff 75 f0             	pushl  -0x10(%ebp)
c010a13a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a13d:	e8 a8 fd ff ff       	call   c0109eea <build_body_stack>
c010a142:	83 c4 10             	add    $0x10,%esp
c010a145:	83 ec 0c             	sub    $0xc,%esp
c010a148:	ff 75 f0             	pushl  -0x10(%ebp)
c010a14b:	e8 cd fe ff ff       	call   c010a01d <build_process_kernel_stack>
c010a150:	83 c4 10             	add    $0x10,%esp
c010a153:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a156:	05 6a 02 00 00       	add    $0x26a,%eax
c010a15b:	83 ec 08             	sub    $0x8,%esp
c010a15e:	50                   	push   %eax
c010a15f:	68 04 0f 11 c0       	push   $0xc0110f04
c010a164:	e8 c7 02 00 00       	call   c010a430 <appendToDoubleLinkList>
c010a169:	83 c4 10             	add    $0x10,%esp
c010a16c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a16f:	c9                   	leave  
c010a170:	c3                   	ret    

c010a171 <process_execute>:
c010a171:	55                   	push   %ebp
c010a172:	89 e5                	mov    %esp,%ebp
c010a174:	83 ec 28             	sub    $0x28,%esp
c010a177:	e8 ca 04 00 00       	call   c010a646 <thread_init>
c010a17c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a17f:	83 ec 0c             	sub    $0xc,%esp
c010a182:	ff 75 f4             	pushl  -0xc(%ebp)
c010a185:	e8 69 05 00 00       	call   c010a6f3 <thread_create>
c010a18a:	83 c4 10             	add    $0x10,%esp
c010a18d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a190:	05 28 01 00 00       	add    $0x128,%eax
c010a195:	83 ec 08             	sub    $0x8,%esp
c010a198:	ff 75 10             	pushl  0x10(%ebp)
c010a19b:	50                   	push   %eax
c010a19c:	e8 ed 20 00 00       	call   c010c28e <Strcpy>
c010a1a1:	83 c4 10             	add    $0x10,%esp
c010a1a4:	83 ec 08             	sub    $0x8,%esp
c010a1a7:	6a 00                	push   $0x0
c010a1a9:	6a 01                	push   $0x1
c010a1ab:	e8 77 c2 ff ff       	call   c0106427 <alloc_memory>
c010a1b0:	83 c4 10             	add    $0x10,%esp
c010a1b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a1b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1b9:	05 00 0c 00 00       	add    $0xc00,%eax
c010a1be:	83 ec 04             	sub    $0x4,%esp
c010a1c1:	68 00 04 00 00       	push   $0x400
c010a1c6:	68 00 fc ff ff       	push   $0xfffffc00
c010a1cb:	50                   	push   %eax
c010a1cc:	e8 8b cd ff ff       	call   c0106f5c <Memcpy>
c010a1d1:	83 c4 10             	add    $0x10,%esp
c010a1d4:	83 ec 0c             	sub    $0xc,%esp
c010a1d7:	ff 75 f0             	pushl  -0x10(%ebp)
c010a1da:	e8 5f c0 ff ff       	call   c010623e <get_physical_address>
c010a1df:	83 c4 10             	add    $0x10,%esp
c010a1e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a1e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1e8:	05 fc 0f 00 00       	add    $0xffc,%eax
c010a1ed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a1f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a1f3:	83 c8 07             	or     $0x7,%eax
c010a1f6:	89 c2                	mov    %eax,%edx
c010a1f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a1fb:	89 10                	mov    %edx,(%eax)
c010a1fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a200:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010a203:	89 50 08             	mov    %edx,0x8(%eax)
c010a206:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a209:	83 c0 10             	add    $0x10,%eax
c010a20c:	83 ec 0c             	sub    $0xc,%esp
c010a20f:	50                   	push   %eax
c010a210:	e8 c8 c7 ff ff       	call   c01069dd <init_memory_block_desc>
c010a215:	83 c4 10             	add    $0x10,%esp
c010a218:	e8 9e f9 ff ff       	call   c0109bbb <create_user_process_address_space>
c010a21d:	89 c2                	mov    %eax,%edx
c010a21f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a222:	89 50 0c             	mov    %edx,0xc(%eax)
c010a225:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a228:	8b 00                	mov    (%eax),%eax
c010a22a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a22d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a230:	c7 40 10 4b 9c 10 c0 	movl   $0xc0109c4b,0x10(%eax)
c010a237:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a23a:	8b 55 08             	mov    0x8(%ebp),%edx
c010a23d:	89 50 18             	mov    %edx,0x18(%eax)
c010a240:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a243:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a246:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a249:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a24c:	8b 55 14             	mov    0x14(%ebp),%edx
c010a24f:	89 50 20             	mov    %edx,0x20(%eax)
c010a252:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a255:	8b 55 18             	mov    0x18(%ebp),%edx
c010a258:	89 50 24             	mov    %edx,0x24(%eax)
c010a25b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010a25e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a261:	89 50 28             	mov    %edx,0x28(%eax)
c010a264:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a267:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a26d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a270:	8b 10                	mov    (%eax),%edx
c010a272:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a275:	89 50 04             	mov    %edx,0x4(%eax)
c010a278:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a27b:	8b 50 04             	mov    0x4(%eax),%edx
c010a27e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a281:	89 50 08             	mov    %edx,0x8(%eax)
c010a284:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a287:	8b 50 08             	mov    0x8(%eax),%edx
c010a28a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a28d:	89 50 0c             	mov    %edx,0xc(%eax)
c010a290:	83 ec 0c             	sub    $0xc,%esp
c010a293:	68 ec fd 10 c0       	push   $0xc010fdec
c010a298:	e8 96 00 00 00       	call   c010a333 <isListEmpty>
c010a29d:	83 c4 10             	add    $0x10,%esp
c010a2a0:	e8 53 cc ff ff       	call   c0106ef8 <intr_disable>
c010a2a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a2a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2ab:	05 60 02 00 00       	add    $0x260,%eax
c010a2b0:	83 ec 08             	sub    $0x8,%esp
c010a2b3:	50                   	push   %eax
c010a2b4:	68 ec fd 10 c0       	push   $0xc010fdec
c010a2b9:	e8 72 01 00 00       	call   c010a430 <appendToDoubleLinkList>
c010a2be:	83 c4 10             	add    $0x10,%esp
c010a2c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2c4:	05 6a 02 00 00       	add    $0x26a,%eax
c010a2c9:	83 ec 08             	sub    $0x8,%esp
c010a2cc:	50                   	push   %eax
c010a2cd:	68 04 0f 11 c0       	push   $0xc0110f04
c010a2d2:	e8 59 01 00 00       	call   c010a430 <appendToDoubleLinkList>
c010a2d7:	83 c4 10             	add    $0x10,%esp
c010a2da:	83 ec 0c             	sub    $0xc,%esp
c010a2dd:	ff 75 e0             	pushl  -0x20(%ebp)
c010a2e0:	e8 3c cc ff ff       	call   c0106f21 <intr_set_status>
c010a2e5:	83 c4 10             	add    $0x10,%esp
c010a2e8:	90                   	nop
c010a2e9:	c9                   	leave  
c010a2ea:	c3                   	ret    
c010a2eb:	66 90                	xchg   %ax,%ax
c010a2ed:	66 90                	xchg   %ax,%ax
c010a2ef:	90                   	nop

c010a2f0 <switch_to>:
c010a2f0:	56                   	push   %esi
c010a2f1:	57                   	push   %edi
c010a2f2:	53                   	push   %ebx
c010a2f3:	55                   	push   %ebp
c010a2f4:	89 e5                	mov    %esp,%ebp
c010a2f6:	8b 45 14             	mov    0x14(%ebp),%eax
c010a2f9:	89 20                	mov    %esp,(%eax)
c010a2fb:	8b 45 18             	mov    0x18(%ebp),%eax
c010a2fe:	8b 20                	mov    (%eax),%esp
c010a300:	5d                   	pop    %ebp
c010a301:	5b                   	pop    %ebx
c010a302:	5f                   	pop    %edi
c010a303:	5e                   	pop    %esi
c010a304:	c3                   	ret    

c010a305 <initDoubleLinkList>:
c010a305:	55                   	push   %ebp
c010a306:	89 e5                	mov    %esp,%ebp
c010a308:	8b 45 08             	mov    0x8(%ebp),%eax
c010a30b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a311:	8b 45 08             	mov    0x8(%ebp),%eax
c010a314:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a31b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a31e:	8d 50 08             	lea    0x8(%eax),%edx
c010a321:	8b 45 08             	mov    0x8(%ebp),%eax
c010a324:	89 50 04             	mov    %edx,0x4(%eax)
c010a327:	8b 55 08             	mov    0x8(%ebp),%edx
c010a32a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a32d:	89 50 08             	mov    %edx,0x8(%eax)
c010a330:	90                   	nop
c010a331:	5d                   	pop    %ebp
c010a332:	c3                   	ret    

c010a333 <isListEmpty>:
c010a333:	55                   	push   %ebp
c010a334:	89 e5                	mov    %esp,%ebp
c010a336:	8b 45 08             	mov    0x8(%ebp),%eax
c010a339:	8b 40 04             	mov    0x4(%eax),%eax
c010a33c:	8b 55 08             	mov    0x8(%ebp),%edx
c010a33f:	83 c2 08             	add    $0x8,%edx
c010a342:	39 d0                	cmp    %edx,%eax
c010a344:	75 07                	jne    c010a34d <isListEmpty+0x1a>
c010a346:	b8 01 00 00 00       	mov    $0x1,%eax
c010a34b:	eb 05                	jmp    c010a352 <isListEmpty+0x1f>
c010a34d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a352:	5d                   	pop    %ebp
c010a353:	c3                   	ret    

c010a354 <findElementInList>:
c010a354:	55                   	push   %ebp
c010a355:	89 e5                	mov    %esp,%ebp
c010a357:	83 ec 28             	sub    $0x28,%esp
c010a35a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a35e:	75 19                	jne    c010a379 <findElementInList+0x25>
c010a360:	6a 60                	push   $0x60
c010a362:	68 15 c2 10 c0       	push   $0xc010c215
c010a367:	68 15 c2 10 c0       	push   $0xc010c215
c010a36c:	68 28 c2 10 c0       	push   $0xc010c228
c010a371:	e8 ff e7 ff ff       	call   c0108b75 <assertion_failure>
c010a376:	83 c4 10             	add    $0x10,%esp
c010a379:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a37d:	75 19                	jne    c010a398 <findElementInList+0x44>
c010a37f:	6a 61                	push   $0x61
c010a381:	68 15 c2 10 c0       	push   $0xc010c215
c010a386:	68 15 c2 10 c0       	push   $0xc010c215
c010a38b:	68 34 c2 10 c0       	push   $0xc010c234
c010a390:	e8 e0 e7 ff ff       	call   c0108b75 <assertion_failure>
c010a395:	83 c4 10             	add    $0x10,%esp
c010a398:	e8 5b cb ff ff       	call   c0106ef8 <intr_disable>
c010a39d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a3a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a3a7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3aa:	8b 40 08             	mov    0x8(%eax),%eax
c010a3ad:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a3b0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3b3:	8b 40 04             	mov    0x4(%eax),%eax
c010a3b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a3b9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a3bd:	75 07                	jne    c010a3c6 <findElementInList+0x72>
c010a3bf:	b8 00 00 00 00       	mov    $0x0,%eax
c010a3c4:	eb 68                	jmp    c010a42e <findElementInList+0xda>
c010a3c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a3c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a3cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a3cf:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a3d2:	c1 f8 03             	sar    $0x3,%eax
c010a3d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a3d8:	eb 36                	jmp    c010a410 <findElementInList+0xbc>
c010a3da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a3dd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a3e0:	75 07                	jne    c010a3e9 <findElementInList+0x95>
c010a3e2:	b8 01 00 00 00       	mov    $0x1,%eax
c010a3e7:	eb 45                	jmp    c010a42e <findElementInList+0xda>
c010a3e9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a3ed:	75 07                	jne    c010a3f6 <findElementInList+0xa2>
c010a3ef:	b8 00 00 00 00       	mov    $0x0,%eax
c010a3f4:	eb 38                	jmp    c010a42e <findElementInList+0xda>
c010a3f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3f9:	8b 40 04             	mov    0x4(%eax),%eax
c010a3fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a3ff:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a403:	75 07                	jne    c010a40c <findElementInList+0xb8>
c010a405:	b8 00 00 00 00       	mov    $0x0,%eax
c010a40a:	eb 22                	jmp    c010a42e <findElementInList+0xda>
c010a40c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a410:	8b 45 08             	mov    0x8(%ebp),%eax
c010a413:	83 c0 08             	add    $0x8,%eax
c010a416:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a419:	75 bf                	jne    c010a3da <findElementInList+0x86>
c010a41b:	83 ec 0c             	sub    $0xc,%esp
c010a41e:	ff 75 ec             	pushl  -0x14(%ebp)
c010a421:	e8 fb ca ff ff       	call   c0106f21 <intr_set_status>
c010a426:	83 c4 10             	add    $0x10,%esp
c010a429:	b8 00 00 00 00       	mov    $0x0,%eax
c010a42e:	c9                   	leave  
c010a42f:	c3                   	ret    

c010a430 <appendToDoubleLinkList>:
c010a430:	55                   	push   %ebp
c010a431:	89 e5                	mov    %esp,%ebp
c010a433:	83 ec 18             	sub    $0x18,%esp
c010a436:	83 ec 08             	sub    $0x8,%esp
c010a439:	ff 75 0c             	pushl  0xc(%ebp)
c010a43c:	ff 75 08             	pushl  0x8(%ebp)
c010a43f:	e8 10 ff ff ff       	call   c010a354 <findElementInList>
c010a444:	83 c4 10             	add    $0x10,%esp
c010a447:	3c 01                	cmp    $0x1,%al
c010a449:	0f 84 c2 00 00 00    	je     c010a511 <appendToDoubleLinkList+0xe1>
c010a44f:	e8 a4 ca ff ff       	call   c0106ef8 <intr_disable>
c010a454:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a457:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a45b:	75 1c                	jne    c010a479 <appendToDoubleLinkList+0x49>
c010a45d:	68 9e 00 00 00       	push   $0x9e
c010a462:	68 15 c2 10 c0       	push   $0xc010c215
c010a467:	68 15 c2 10 c0       	push   $0xc010c215
c010a46c:	68 28 c2 10 c0       	push   $0xc010c228
c010a471:	e8 ff e6 ff ff       	call   c0108b75 <assertion_failure>
c010a476:	83 c4 10             	add    $0x10,%esp
c010a479:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a47d:	75 1c                	jne    c010a49b <appendToDoubleLinkList+0x6b>
c010a47f:	68 9f 00 00 00       	push   $0x9f
c010a484:	68 15 c2 10 c0       	push   $0xc010c215
c010a489:	68 15 c2 10 c0       	push   $0xc010c215
c010a48e:	68 34 c2 10 c0       	push   $0xc010c234
c010a493:	e8 dd e6 ff ff       	call   c0108b75 <assertion_failure>
c010a498:	83 c4 10             	add    $0x10,%esp
c010a49b:	83 ec 08             	sub    $0x8,%esp
c010a49e:	ff 75 0c             	pushl  0xc(%ebp)
c010a4a1:	ff 75 08             	pushl  0x8(%ebp)
c010a4a4:	e8 ab fe ff ff       	call   c010a354 <findElementInList>
c010a4a9:	83 c4 10             	add    $0x10,%esp
c010a4ac:	3c 01                	cmp    $0x1,%al
c010a4ae:	74 64                	je     c010a514 <appendToDoubleLinkList+0xe4>
c010a4b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a4b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a4b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4b9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a4c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4c3:	8b 50 04             	mov    0x4(%eax),%edx
c010a4c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4c9:	89 10                	mov    %edx,(%eax)
c010a4cb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4ce:	8b 50 08             	mov    0x8(%eax),%edx
c010a4d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4d4:	89 10                	mov    %edx,(%eax)
c010a4d6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4d9:	8b 40 08             	mov    0x8(%eax),%eax
c010a4dc:	85 c0                	test   %eax,%eax
c010a4de:	74 0c                	je     c010a4ec <appendToDoubleLinkList+0xbc>
c010a4e0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4e3:	8b 40 08             	mov    0x8(%eax),%eax
c010a4e6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a4e9:	89 50 04             	mov    %edx,0x4(%eax)
c010a4ec:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4ef:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a4f2:	89 50 08             	mov    %edx,0x8(%eax)
c010a4f5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4f8:	8d 50 08             	lea    0x8(%eax),%edx
c010a4fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4fe:	89 50 04             	mov    %edx,0x4(%eax)
c010a501:	83 ec 0c             	sub    $0xc,%esp
c010a504:	ff 75 f4             	pushl  -0xc(%ebp)
c010a507:	e8 15 ca ff ff       	call   c0106f21 <intr_set_status>
c010a50c:	83 c4 10             	add    $0x10,%esp
c010a50f:	eb 04                	jmp    c010a515 <appendToDoubleLinkList+0xe5>
c010a511:	90                   	nop
c010a512:	eb 01                	jmp    c010a515 <appendToDoubleLinkList+0xe5>
c010a514:	90                   	nop
c010a515:	c9                   	leave  
c010a516:	c3                   	ret    

c010a517 <insertToDoubleLinkList>:
c010a517:	55                   	push   %ebp
c010a518:	89 e5                	mov    %esp,%ebp
c010a51a:	83 ec 18             	sub    $0x18,%esp
c010a51d:	83 ec 08             	sub    $0x8,%esp
c010a520:	ff 75 0c             	pushl  0xc(%ebp)
c010a523:	ff 75 08             	pushl  0x8(%ebp)
c010a526:	e8 29 fe ff ff       	call   c010a354 <findElementInList>
c010a52b:	83 c4 10             	add    $0x10,%esp
c010a52e:	3c 01                	cmp    $0x1,%al
c010a530:	74 65                	je     c010a597 <insertToDoubleLinkList+0x80>
c010a532:	e8 c1 c9 ff ff       	call   c0106ef8 <intr_disable>
c010a537:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a53a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a53d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a540:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a543:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a54a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a54d:	8b 50 04             	mov    0x4(%eax),%edx
c010a550:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a553:	89 10                	mov    %edx,(%eax)
c010a555:	8b 45 08             	mov    0x8(%ebp),%eax
c010a558:	8b 50 04             	mov    0x4(%eax),%edx
c010a55b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a55e:	89 50 04             	mov    %edx,0x4(%eax)
c010a561:	8b 45 08             	mov    0x8(%ebp),%eax
c010a564:	8b 40 04             	mov    0x4(%eax),%eax
c010a567:	85 c0                	test   %eax,%eax
c010a569:	74 0b                	je     c010a576 <insertToDoubleLinkList+0x5f>
c010a56b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a56e:	8b 40 04             	mov    0x4(%eax),%eax
c010a571:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a574:	89 10                	mov    %edx,(%eax)
c010a576:	8b 45 08             	mov    0x8(%ebp),%eax
c010a579:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a57c:	89 50 04             	mov    %edx,0x4(%eax)
c010a57f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a582:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a585:	89 10                	mov    %edx,(%eax)
c010a587:	83 ec 0c             	sub    $0xc,%esp
c010a58a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a58d:	e8 8f c9 ff ff       	call   c0106f21 <intr_set_status>
c010a592:	83 c4 10             	add    $0x10,%esp
c010a595:	eb 01                	jmp    c010a598 <insertToDoubleLinkList+0x81>
c010a597:	90                   	nop
c010a598:	c9                   	leave  
c010a599:	c3                   	ret    

c010a59a <popFromDoubleLinkList>:
c010a59a:	55                   	push   %ebp
c010a59b:	89 e5                	mov    %esp,%ebp
c010a59d:	83 ec 18             	sub    $0x18,%esp
c010a5a0:	e8 53 c9 ff ff       	call   c0106ef8 <intr_disable>
c010a5a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a5a8:	83 ec 0c             	sub    $0xc,%esp
c010a5ab:	ff 75 08             	pushl  0x8(%ebp)
c010a5ae:	e8 80 fd ff ff       	call   c010a333 <isListEmpty>
c010a5b3:	83 c4 10             	add    $0x10,%esp
c010a5b6:	3c 01                	cmp    $0x1,%al
c010a5b8:	75 07                	jne    c010a5c1 <popFromDoubleLinkList+0x27>
c010a5ba:	b8 00 00 00 00       	mov    $0x0,%eax
c010a5bf:	eb 6b                	jmp    c010a62c <popFromDoubleLinkList+0x92>
c010a5c1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5c4:	8b 40 08             	mov    0x8(%eax),%eax
c010a5c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a5ca:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5cd:	8b 40 08             	mov    0x8(%eax),%eax
c010a5d0:	85 c0                	test   %eax,%eax
c010a5d2:	75 07                	jne    c010a5db <popFromDoubleLinkList+0x41>
c010a5d4:	b8 00 00 00 00       	mov    $0x0,%eax
c010a5d9:	eb 51                	jmp    c010a62c <popFromDoubleLinkList+0x92>
c010a5db:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5de:	8b 40 08             	mov    0x8(%eax),%eax
c010a5e1:	8b 00                	mov    (%eax),%eax
c010a5e3:	85 c0                	test   %eax,%eax
c010a5e5:	74 11                	je     c010a5f8 <popFromDoubleLinkList+0x5e>
c010a5e7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5ea:	8b 40 08             	mov    0x8(%eax),%eax
c010a5ed:	8b 00                	mov    (%eax),%eax
c010a5ef:	8b 55 08             	mov    0x8(%ebp),%edx
c010a5f2:	83 c2 08             	add    $0x8,%edx
c010a5f5:	89 50 04             	mov    %edx,0x4(%eax)
c010a5f8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a5fb:	8b 40 08             	mov    0x8(%eax),%eax
c010a5fe:	8b 10                	mov    (%eax),%edx
c010a600:	8b 45 08             	mov    0x8(%ebp),%eax
c010a603:	89 50 08             	mov    %edx,0x8(%eax)
c010a606:	83 ec 0c             	sub    $0xc,%esp
c010a609:	ff 75 f4             	pushl  -0xc(%ebp)
c010a60c:	e8 10 c9 ff ff       	call   c0106f21 <intr_set_status>
c010a611:	83 c4 10             	add    $0x10,%esp
c010a614:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a617:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a61e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a621:	8b 50 04             	mov    0x4(%eax),%edx
c010a624:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a627:	89 10                	mov    %edx,(%eax)
c010a629:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a62c:	c9                   	leave  
c010a62d:	c3                   	ret    

c010a62e <kernel_thread>:
c010a62e:	55                   	push   %ebp
c010a62f:	89 e5                	mov    %esp,%ebp
c010a631:	83 ec 08             	sub    $0x8,%esp
c010a634:	fb                   	sti    
c010a635:	83 ec 0c             	sub    $0xc,%esp
c010a638:	ff 75 0c             	pushl  0xc(%ebp)
c010a63b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a63e:	ff d0                	call   *%eax
c010a640:	83 c4 10             	add    $0x10,%esp
c010a643:	90                   	nop
c010a644:	c9                   	leave  
c010a645:	c3                   	ret    

c010a646 <thread_init>:
c010a646:	55                   	push   %ebp
c010a647:	89 e5                	mov    %esp,%ebp
c010a649:	83 ec 18             	sub    $0x18,%esp
c010a64c:	83 ec 08             	sub    $0x8,%esp
c010a64f:	6a 00                	push   $0x0
c010a651:	6a 01                	push   $0x1
c010a653:	e8 cf bd ff ff       	call   c0106427 <alloc_memory>
c010a658:	83 c4 10             	add    $0x10,%esp
c010a65b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a65e:	83 ec 04             	sub    $0x4,%esp
c010a661:	68 00 10 00 00       	push   $0x1000
c010a666:	6a 00                	push   $0x0
c010a668:	ff 75 f4             	pushl  -0xc(%ebp)
c010a66b:	e8 ff 1b 00 00       	call   c010c26f <Memset>
c010a670:	83 c4 10             	add    $0x10,%esp
c010a673:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a676:	05 00 10 00 00       	add    $0x1000,%eax
c010a67b:	89 c2                	mov    %eax,%edx
c010a67d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a680:	89 10                	mov    %edx,(%eax)
c010a682:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a685:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a68c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a68f:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a696:	ff ff ff 
c010a699:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a69c:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a6a3:	00 00 00 
c010a6a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6a9:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a6af:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6b2:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a6b8:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a6bd:	83 c0 01             	add    $0x1,%eax
c010a6c0:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a6c5:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a6cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6ce:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a6d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6d7:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a6de:	00 00 00 
c010a6e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6e4:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a6eb:	cd ab 99 
c010a6ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a6f1:	c9                   	leave  
c010a6f2:	c3                   	ret    

c010a6f3 <thread_create>:
c010a6f3:	55                   	push   %ebp
c010a6f4:	89 e5                	mov    %esp,%ebp
c010a6f6:	83 ec 10             	sub    $0x10,%esp
c010a6f9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a700:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a707:	8b 45 08             	mov    0x8(%ebp),%eax
c010a70a:	8b 00                	mov    (%eax),%eax
c010a70c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a70f:	89 c2                	mov    %eax,%edx
c010a711:	8b 45 08             	mov    0x8(%ebp),%eax
c010a714:	89 10                	mov    %edx,(%eax)
c010a716:	8b 45 08             	mov    0x8(%ebp),%eax
c010a719:	8b 00                	mov    (%eax),%eax
c010a71b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a71e:	89 c2                	mov    %eax,%edx
c010a720:	8b 45 08             	mov    0x8(%ebp),%eax
c010a723:	89 10                	mov    %edx,(%eax)
c010a725:	90                   	nop
c010a726:	c9                   	leave  
c010a727:	c3                   	ret    

c010a728 <thread_start>:
c010a728:	55                   	push   %ebp
c010a729:	89 e5                	mov    %esp,%ebp
c010a72b:	83 ec 18             	sub    $0x18,%esp
c010a72e:	e8 13 ff ff ff       	call   c010a646 <thread_init>
c010a733:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a736:	83 ec 0c             	sub    $0xc,%esp
c010a739:	ff 75 f4             	pushl  -0xc(%ebp)
c010a73c:	e8 b2 ff ff ff       	call   c010a6f3 <thread_create>
c010a741:	83 c4 10             	add    $0x10,%esp
c010a744:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a747:	05 28 01 00 00       	add    $0x128,%eax
c010a74c:	83 ec 08             	sub    $0x8,%esp
c010a74f:	ff 75 10             	pushl  0x10(%ebp)
c010a752:	50                   	push   %eax
c010a753:	e8 36 1b 00 00       	call   c010c28e <Strcpy>
c010a758:	83 c4 10             	add    $0x10,%esp
c010a75b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a75e:	8b 00                	mov    (%eax),%eax
c010a760:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a763:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a766:	c7 40 10 2e a6 10 c0 	movl   $0xc010a62e,0x10(%eax)
c010a76d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a770:	8b 55 08             	mov    0x8(%ebp),%edx
c010a773:	89 50 18             	mov    %edx,0x18(%eax)
c010a776:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a779:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a77c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a77f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a782:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a788:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a78b:	8b 10                	mov    (%eax),%edx
c010a78d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a790:	89 50 04             	mov    %edx,0x4(%eax)
c010a793:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a796:	8b 50 04             	mov    0x4(%eax),%edx
c010a799:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a79c:	89 50 08             	mov    %edx,0x8(%eax)
c010a79f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a7a2:	8b 50 08             	mov    0x8(%eax),%edx
c010a7a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a7a8:	89 50 0c             	mov    %edx,0xc(%eax)
c010a7ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a7ae:	05 60 02 00 00       	add    $0x260,%eax
c010a7b3:	83 ec 08             	sub    $0x8,%esp
c010a7b6:	50                   	push   %eax
c010a7b7:	68 ec fd 10 c0       	push   $0xc010fdec
c010a7bc:	e8 6f fc ff ff       	call   c010a430 <appendToDoubleLinkList>
c010a7c1:	83 c4 10             	add    $0x10,%esp
c010a7c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a7c7:	05 6a 02 00 00       	add    $0x26a,%eax
c010a7cc:	83 ec 08             	sub    $0x8,%esp
c010a7cf:	50                   	push   %eax
c010a7d0:	68 04 0f 11 c0       	push   $0xc0110f04
c010a7d5:	e8 56 fc ff ff       	call   c010a430 <appendToDoubleLinkList>
c010a7da:	83 c4 10             	add    $0x10,%esp
c010a7dd:	90                   	nop
c010a7de:	c9                   	leave  
c010a7df:	c3                   	ret    

c010a7e0 <Buf>:
	...

c010a7f6 <My_Buf>:
c010a7f6:	48                   	dec    %eax
c010a7f7:	65 6c                	gs insb (%dx),%es:(%edi)
c010a7f9:	6c                   	insb   (%dx),%es:(%edi)
c010a7fa:	6f                   	outsl  %ds:(%esi),(%dx)
c010a7fb:	2c 57                	sub    $0x57,%al
c010a7fd:	6f                   	outsl  %ds:(%esi),(%dx)
c010a7fe:	72 6c                	jb     c010a86c <DriverInitialize+0x69>
c010a800:	64 5c                	fs pop %esp
c010a802:	30                   	.byte 0x30

c010a803 <DriverInitialize>:
c010a803:	56                   	push   %esi
c010a804:	57                   	push   %edi
c010a805:	53                   	push   %ebx
c010a806:	55                   	push   %ebp
c010a807:	51                   	push   %ecx
c010a808:	89 e5                	mov    %esp,%ebp
c010a80a:	b0 21                	mov    $0x21,%al
c010a80c:	66 ba 00 03          	mov    $0x300,%dx
c010a810:	ee                   	out    %al,(%dx)
c010a811:	b0 59                	mov    $0x59,%al
c010a813:	66 ba 0e 03          	mov    $0x30e,%dx
c010a817:	ee                   	out    %al,(%dx)
c010a818:	66 ba 0a 03          	mov    $0x30a,%dx
c010a81c:	66 31 c0             	xor    %ax,%ax
c010a81f:	b0 00                	mov    $0x0,%al
c010a821:	ee                   	out    %al,(%dx)
c010a822:	66 ba 0b 03          	mov    $0x30b,%dx
c010a826:	b0 01                	mov    $0x1,%al
c010a828:	ee                   	out    %al,(%dx)
c010a829:	b0 10                	mov    $0x10,%al
c010a82b:	66 ba 0c 03          	mov    $0x30c,%dx
c010a82f:	ee                   	out    %al,(%dx)
c010a830:	b0 20                	mov    $0x20,%al
c010a832:	66 ba 04 03          	mov    $0x304,%dx
c010a836:	ee                   	out    %al,(%dx)
c010a837:	b0 02                	mov    $0x2,%al
c010a839:	66 ba 0d 03          	mov    $0x30d,%dx
c010a83d:	ee                   	out    %al,(%dx)
c010a83e:	b0 40                	mov    $0x40,%al
c010a840:	66 ba 01 03          	mov    $0x301,%dx
c010a844:	ee                   	out    %al,(%dx)
c010a845:	66 ba 03 03          	mov    $0x303,%dx
c010a849:	ee                   	out    %al,(%dx)
c010a84a:	b0 60                	mov    $0x60,%al
c010a84c:	66 ba 02 03          	mov    $0x302,%dx
c010a850:	ee                   	out    %al,(%dx)
c010a851:	b0 61                	mov    $0x61,%al
c010a853:	66 ba 00 03          	mov    $0x300,%dx
c010a857:	ee                   	out    %al,(%dx)
c010a858:	b0 40                	mov    $0x40,%al
c010a85a:	66 ba 07 03          	mov    $0x307,%dx
c010a85e:	ee                   	out    %al,(%dx)
c010a85f:	b0 22                	mov    $0x22,%al
c010a861:	66 ba 00 03          	mov    $0x300,%dx
c010a865:	ee                   	out    %al,(%dx)
c010a866:	b0 ff                	mov    $0xff,%al
c010a868:	66 ba 07 03          	mov    $0x307,%dx
c010a86c:	ee                   	out    %al,(%dx)
c010a86d:	b0 fb                	mov    $0xfb,%al
c010a86f:	66 ba 0f 03          	mov    $0x30f,%dx
c010a873:	ee                   	out    %al,(%dx)
c010a874:	66 ba 0d 03          	mov    $0x30d,%dx
c010a878:	b0 00                	mov    $0x0,%al
c010a87a:	ee                   	out    %al,(%dx)
c010a87b:	68 00 40 00 00       	push   $0x4000
c010a880:	e8 08 00 00 00       	call   c010a88d <SetPageStart>
c010a885:	89 ec                	mov    %ebp,%esp
c010a887:	59                   	pop    %ecx
c010a888:	5d                   	pop    %ebp
c010a889:	5b                   	pop    %ebx
c010a88a:	5f                   	pop    %edi
c010a88b:	5e                   	pop    %esi
c010a88c:	c3                   	ret    

c010a88d <SetPageStart>:
c010a88d:	56                   	push   %esi
c010a88e:	57                   	push   %edi
c010a88f:	53                   	push   %ebx
c010a890:	55                   	push   %ebp
c010a891:	51                   	push   %ecx
c010a892:	89 e5                	mov    %esp,%ebp
c010a894:	66 ba 08 03          	mov    $0x308,%dx
c010a898:	66 31 c0             	xor    %ax,%ax
c010a89b:	66 8b 45 18          	mov    0x18(%ebp),%ax
c010a89f:	ee                   	out    %al,(%dx)
c010a8a0:	66 ba 09 03          	mov    $0x309,%dx
c010a8a4:	66 25 00 ff          	and    $0xff00,%ax
c010a8a8:	66 c1 e8 08          	shr    $0x8,%ax
c010a8ac:	ee                   	out    %al,(%dx)
c010a8ad:	89 ec                	mov    %ebp,%esp
c010a8af:	59                   	pop    %ecx
c010a8b0:	5d                   	pop    %ebp
c010a8b1:	5b                   	pop    %ebx
c010a8b2:	5f                   	pop    %edi
c010a8b3:	5e                   	pop    %esi
c010a8b4:	c3                   	ret    

c010a8b5 <DriverSend>:
c010a8b5:	56                   	push   %esi
c010a8b6:	57                   	push   %edi
c010a8b7:	53                   	push   %ebx
c010a8b8:	55                   	push   %ebp
c010a8b9:	51                   	push   %ecx
c010a8ba:	89 e5                	mov    %esp,%ebp
c010a8bc:	66 ba 00 03          	mov    $0x300,%dx
c010a8c0:	ec                   	in     (%dx),%al
c010a8c1:	3c 26                	cmp    $0x26,%al
c010a8c3:	74 54                	je     c010a919 <QueueIt>
c010a8c5:	66 51                	push   %cx
c010a8c7:	24 3f                	and    $0x3f,%al
c010a8c9:	ee                   	out    %al,(%dx)
c010a8ca:	66 ba 08 03          	mov    $0x308,%dx
c010a8ce:	66 31 c0             	xor    %ax,%ax
c010a8d1:	66 b8 00 40          	mov    $0x4000,%ax
c010a8d5:	ee                   	out    %al,(%dx)
c010a8d6:	66 ba 09 03          	mov    $0x309,%dx
c010a8da:	66 25 00 ff          	and    $0xff00,%ax
c010a8de:	66 c1 e8 08          	shr    $0x8,%ax
c010a8e2:	ee                   	out    %al,(%dx)
c010a8e3:	ff 75 18             	pushl  0x18(%ebp)
c010a8e6:	e8 3f 00 00 00       	call   c010a92a <PCtoNIC>
c010a8eb:	83 c4 04             	add    $0x4,%esp
c010a8ee:	eb 2a                	jmp    c010a91a <Finished>
c010a8f0:	66 ba 04 03          	mov    $0x304,%dx
c010a8f4:	b0 40                	mov    $0x40,%al
c010a8f6:	66 b8 00 40          	mov    $0x4000,%ax
c010a8fa:	66 c1 e8 08          	shr    $0x8,%ax
c010a8fe:	66 ef                	out    %ax,(%dx)
c010a900:	66 59                	pop    %cx
c010a902:	66 ba 05 03          	mov    $0x305,%dx
c010a906:	88 c8                	mov    %cl,%al
c010a908:	ee                   	out    %al,(%dx)
c010a909:	66 ba 06 03          	mov    $0x306,%dx
c010a90d:	88 e8                	mov    %ch,%al
c010a90f:	ee                   	out    %al,(%dx)
c010a910:	66 ba 00 03          	mov    $0x300,%dx
c010a914:	b0 26                	mov    $0x26,%al
c010a916:	ee                   	out    %al,(%dx)
c010a917:	eb 01                	jmp    c010a91a <Finished>

c010a919 <QueueIt>:
c010a919:	90                   	nop

c010a91a <Finished>:
c010a91a:	89 ec                	mov    %ebp,%esp
c010a91c:	59                   	pop    %ecx
c010a91d:	5d                   	pop    %ebp
c010a91e:	5b                   	pop    %ebx
c010a91f:	5f                   	pop    %edi
c010a920:	5e                   	pop    %esi
c010a921:	c3                   	ret    

c010a922 <MyEnd>:
c010a922:	89 ec                	mov    %ebp,%esp
c010a924:	59                   	pop    %ecx
c010a925:	5d                   	pop    %ebp
c010a926:	5b                   	pop    %ebx
c010a927:	5f                   	pop    %edi
c010a928:	5e                   	pop    %esi
c010a929:	c3                   	ret    

c010a92a <PCtoNIC>:
c010a92a:	56                   	push   %esi
c010a92b:	57                   	push   %edi
c010a92c:	53                   	push   %ebx
c010a92d:	55                   	push   %ebp
c010a92e:	51                   	push   %ecx
c010a92f:	89 e5                	mov    %esp,%ebp
c010a931:	66 bb 20 00          	mov    $0x20,%bx
c010a935:	66 ba 0a 03          	mov    $0x30a,%dx
c010a939:	88 d8                	mov    %bl,%al
c010a93b:	ee                   	out    %al,(%dx)
c010a93c:	66 ba 0b 03          	mov    $0x30b,%dx
c010a940:	88 f8                	mov    %bh,%al
c010a942:	ee                   	out    %al,(%dx)
c010a943:	66 ba 00 03          	mov    $0x300,%dx
c010a947:	b0 12                	mov    $0x12,%al
c010a949:	ee                   	out    %al,(%dx)
c010a94a:	66 ba 10 03          	mov    $0x310,%dx
c010a94e:	66 b9 20 00          	mov    $0x20,%cx
c010a952:	66 d1 e9             	shr    %cx
c010a955:	66 b8 59 00          	mov    $0x59,%ax
c010a959:	31 f6                	xor    %esi,%esi
c010a95b:	8b 74 24 18          	mov    0x18(%esp),%esi
c010a95f:	68 00 40 00 00       	push   $0x4000
c010a964:	e8 24 ff ff ff       	call   c010a88d <SetPageStart>
c010a969:	83 c4 04             	add    $0x4,%esp
c010a96c:	66 ba 10 03          	mov    $0x310,%dx

c010a970 <Writing_Word>:
c010a970:	66 31 c0             	xor    %ax,%ax
c010a973:	66 ad                	lods   %ds:(%esi),%ax
c010a975:	66 ef                	out    %ax,(%dx)
c010a977:	e2 f7                	loop   c010a970 <Writing_Word>
c010a979:	66 b9 00 00          	mov    $0x0,%cx
c010a97d:	66 ba 07 03          	mov    $0x307,%dx

c010a981 <CheckDMA>:
c010a981:	ec                   	in     (%dx),%al
c010a982:	a8 40                	test   $0x40,%al
c010a984:	75 02                	jne    c010a988 <toNICEND>
c010a986:	eb f9                	jmp    c010a981 <CheckDMA>

c010a988 <toNICEND>:
c010a988:	66 ba 07 03          	mov    $0x307,%dx
c010a98c:	b0 0f                	mov    $0xf,%al
c010a98e:	ee                   	out    %al,(%dx)
c010a98f:	f8                   	clc    
c010a990:	89 ec                	mov    %ebp,%esp
c010a992:	59                   	pop    %ecx
c010a993:	5d                   	pop    %ebp
c010a994:	5b                   	pop    %ebx
c010a995:	5f                   	pop    %edi
c010a996:	5e                   	pop    %esi
c010a997:	c3                   	ret    

c010a998 <get_interrupt_status>:
c010a998:	56                   	push   %esi
c010a999:	57                   	push   %edi
c010a99a:	53                   	push   %ebx
c010a99b:	55                   	push   %ebp
c010a99c:	51                   	push   %ecx
c010a99d:	89 e5                	mov    %esp,%ebp
c010a99f:	66 ba 07 03          	mov    $0x307,%dx
c010a9a3:	31 c0                	xor    %eax,%eax
c010a9a5:	ec                   	in     (%dx),%al
c010a9a6:	89 ec                	mov    %ebp,%esp
c010a9a8:	59                   	pop    %ecx
c010a9a9:	5d                   	pop    %ebp
c010a9aa:	5b                   	pop    %ebx
c010a9ab:	5f                   	pop    %edi
c010a9ac:	5e                   	pop    %esi
c010a9ad:	c3                   	ret    

c010a9ae <set_interrupt_status>:
c010a9ae:	56                   	push   %esi
c010a9af:	57                   	push   %edi
c010a9b0:	53                   	push   %ebx
c010a9b1:	55                   	push   %ebp
c010a9b2:	51                   	push   %ecx
c010a9b3:	89 e5                	mov    %esp,%ebp
c010a9b5:	66 ba 07 03          	mov    $0x307,%dx
c010a9b9:	31 c0                	xor    %eax,%eax
c010a9bb:	8b 45 18             	mov    0x18(%ebp),%eax
c010a9be:	ee                   	out    %al,(%dx)
c010a9bf:	89 ec                	mov    %ebp,%esp
c010a9c1:	59                   	pop    %ecx
c010a9c2:	5d                   	pop    %ebp
c010a9c3:	5b                   	pop    %ebx
c010a9c4:	5f                   	pop    %edi
c010a9c5:	5e                   	pop    %esi
c010a9c6:	c3                   	ret    

c010a9c7 <get_curr_page>:
c010a9c7:	56                   	push   %esi
c010a9c8:	57                   	push   %edi
c010a9c9:	53                   	push   %ebx
c010a9ca:	55                   	push   %ebp
c010a9cb:	51                   	push   %ecx
c010a9cc:	89 e5                	mov    %esp,%ebp
c010a9ce:	b0 61                	mov    $0x61,%al
c010a9d0:	66 ba 00 03          	mov    $0x300,%dx
c010a9d4:	ee                   	out    %al,(%dx)
c010a9d5:	66 ba 07 03          	mov    $0x307,%dx
c010a9d9:	31 c0                	xor    %eax,%eax
c010a9db:	ec                   	in     (%dx),%al
c010a9dc:	89 ec                	mov    %ebp,%esp
c010a9de:	59                   	pop    %ecx
c010a9df:	5d                   	pop    %ebp
c010a9e0:	5b                   	pop    %ebx
c010a9e1:	5f                   	pop    %edi
c010a9e2:	5e                   	pop    %esi
c010a9e3:	c3                   	ret    

c010a9e4 <NICtoPC>:
c010a9e4:	56                   	push   %esi
c010a9e5:	57                   	push   %edi
c010a9e6:	53                   	push   %ebx
c010a9e7:	55                   	push   %ebp
c010a9e8:	51                   	push   %ecx
c010a9e9:	89 e5                	mov    %esp,%ebp
c010a9eb:	66 bb 00 01          	mov    $0x100,%bx
c010a9ef:	66 ba 0a 03          	mov    $0x30a,%dx
c010a9f3:	88 d8                	mov    %bl,%al
c010a9f5:	ee                   	out    %al,(%dx)
c010a9f6:	66 ba 0b 03          	mov    $0x30b,%dx
c010a9fa:	88 f8                	mov    %bh,%al
c010a9fc:	ee                   	out    %al,(%dx)
c010a9fd:	66 ba 00 03          	mov    $0x300,%dx
c010aa01:	b0 0a                	mov    $0xa,%al
c010aa03:	ee                   	out    %al,(%dx)
c010aa04:	66 ba 10 03          	mov    $0x310,%dx
c010aa08:	66 ba 10 03          	mov    $0x310,%dx
c010aa0c:	66 b9 00 01          	mov    $0x100,%cx
c010aa10:	66 d1 e9             	shr    %cx
c010aa13:	bf e0 a7 10 c0       	mov    $0xc010a7e0,%edi
c010aa18:	8b 7d 18             	mov    0x18(%ebp),%edi

c010aa1b <READING_Word_NICtoPC>:
c010aa1b:	31 c0                	xor    %eax,%eax
c010aa1d:	66 ba 10 03          	mov    $0x310,%dx
c010aa21:	66 ed                	in     (%dx),%ax
c010aa23:	66 ab                	stos   %ax,%es:(%edi)
c010aa25:	e2 f4                	loop   c010aa1b <READING_Word_NICtoPC>
c010aa27:	66 ba 07 03          	mov    $0x307,%dx

c010aa2b <CheckDMA_NICtoPC>:
c010aa2b:	ec                   	in     (%dx),%al
c010aa2c:	a8 40                	test   $0x40,%al
c010aa2e:	75 02                	jne    c010aa32 <ReadEnd>
c010aa30:	eb f9                	jmp    c010aa2b <CheckDMA_NICtoPC>

c010aa32 <ReadEnd>:
c010aa32:	ee                   	out    %al,(%dx)
c010aa33:	b8 20 00 00 00       	mov    $0x20,%eax
c010aa38:	89 ec                	mov    %ebp,%esp
c010aa3a:	59                   	pop    %ecx
c010aa3b:	5d                   	pop    %ebp
c010aa3c:	5b                   	pop    %ebx
c010aa3d:	5f                   	pop    %edi
c010aa3e:	5e                   	pop    %esi
c010aa3f:	c3                   	ret    
