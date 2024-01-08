
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
c010001e:	0f 01 05 cc 06 11 c0 	sgdtl  0xc01106cc
c0100025:	e8 41 3b 00 00       	call   c0103b6b <ReloadGDT>
c010002a:	0f 01 15 cc 06 11 c0 	lgdtl  0xc01106cc
c0100031:	0f 01 1d 88 f7 10 c0 	lidtl  0xc010f788
c0100038:	0f a8                	push   %gs
c010003a:	0f a9                	pop    %gs
c010003c:	ea 43 00 10 c0 08 00 	ljmp   $0x8,$0xc0100043

c0100043 <csinit>:
c0100043:	31 c0                	xor    %eax,%eax
c0100045:	66 b8 40 00          	mov    $0x40,%ax
c0100049:	0f 00 d8             	ltr    %ax
c010004c:	31 c0                	xor    %eax,%eax
c010004e:	e9 ab 03 00 00       	jmp    c01003fe <kernel_main>
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
c010014b:	e8 60 70 00 00       	call   c01071b0 <exception_handler>
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
c0100168:	e8 43 70 00 00       	call   c01071b0 <exception_handler>
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
c0100195:	e8 9b 35 00 00       	call   c0103735 <clock_handler>
c010019a:	e9 31 01 00 00       	jmp    c01002d0 <reenter_restore>

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
c01001c7:	e8 f4 44 00 00       	call   c01046c0 <keyboard_handler>
c01001cc:	b0 f8                	mov    $0xf8,%al
c01001ce:	e6 21                	out    %al,$0x21
c01001d0:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01001d7:	0f 85 f3 00 00 00    	jne    c01002d0 <reenter_restore>
c01001dd:	e9 ee 00 00 00       	jmp    c01002d0 <reenter_restore>

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
c01001f2:	b0 ff                	mov    $0xff,%al
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
c010020d:	e8 a3 11 00 00       	call   c01013b5 <hd_handler>
c0100212:	b0 bf                	mov    $0xbf,%al
c0100214:	e6 a1                	out    %al,$0xa1
c0100216:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010021d:	0f 85 ad 00 00 00    	jne    c01002d0 <reenter_restore>
c0100223:	e9 a8 00 00 00       	jmp    c01002d0 <reenter_restore>

c0100228 <hwint10>:
c0100228:	60                   	pusha  
c0100229:	1e                   	push   %ds
c010022a:	06                   	push   %es
c010022b:	0f a0                	push   %fs
c010022d:	0f a8                	push   %gs
c010022f:	66 8c d2             	mov    %ss,%dx
c0100232:	8e da                	mov    %edx,%ds
c0100234:	8e c2                	mov    %edx,%es
c0100236:	8e e2                	mov    %edx,%fs
c0100238:	b0 ff                	mov    $0xff,%al
c010023a:	e6 a1                	out    %al,$0xa1
c010023c:	b0 20                	mov    $0x20,%al
c010023e:	e6 20                	out    %al,$0x20
c0100240:	90                   	nop
c0100241:	e6 a0                	out    %al,$0xa0
c0100243:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c0100249:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100250:	75 00                	jne    c0100252 <hwint10.1>

c0100252 <hwint10.1>:
c0100252:	fb                   	sti    
c0100253:	e8 89 11 00 00       	call   c01013e1 <net_handler>
c0100258:	b0 7b                	mov    $0x7b,%al
c010025a:	e6 a1                	out    %al,$0xa1
c010025c:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100263:	75 6b                	jne    c01002d0 <reenter_restore>
c0100265:	eb 69                	jmp    c01002d0 <reenter_restore>

c0100267 <sys_call>:
c0100267:	60                   	pusha  
c0100268:	1e                   	push   %ds
c0100269:	06                   	push   %es
c010026a:	0f a0                	push   %fs
c010026c:	0f a8                	push   %gs
c010026e:	89 e6                	mov    %esp,%esi
c0100270:	89 e5                	mov    %esp,%ebp
c0100272:	66 8c d2             	mov    %ss,%dx
c0100275:	8e da                	mov    %edx,%ds
c0100277:	8e c2                	mov    %edx,%es
c0100279:	8e e2                	mov    %edx,%fs
c010027b:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c0100281:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100288:	75 00                	jne    c010028a <sys_call.1>

c010028a <sys_call.1>:
c010028a:	fb                   	sti    
c010028b:	56                   	push   %esi
c010028c:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100292:	53                   	push   %ebx
c0100293:	51                   	push   %ecx
c0100294:	ff 14 85 2c e1 10 c0 	call   *-0x3fef1ed4(,%eax,4)
c010029b:	83 c4 0c             	add    $0xc,%esp
c010029e:	5e                   	pop    %esi
c010029f:	89 45 2c             	mov    %eax,0x2c(%ebp)
c01002a2:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01002a9:	75 25                	jne    c01002d0 <reenter_restore>
c01002ab:	eb 23                	jmp    c01002d0 <reenter_restore>

c01002ad <fork_restart>:
c01002ad:	fa                   	cli    
c01002ae:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c01002b4:	0f a9                	pop    %gs
c01002b6:	0f a1                	pop    %fs
c01002b8:	07                   	pop    %es
c01002b9:	1f                   	pop    %ds
c01002ba:	61                   	popa   
c01002bb:	cf                   	iret   

c01002bc <restart>:
c01002bc:	fa                   	cli    
c01002bd:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c01002c3:	89 e5                	mov    %esp,%ebp
c01002c5:	8b 65 04             	mov    0x4(%ebp),%esp
c01002c8:	0f a9                	pop    %gs
c01002ca:	0f a1                	pop    %fs
c01002cc:	07                   	pop    %es
c01002cd:	1f                   	pop    %ds
c01002ce:	61                   	popa   
c01002cf:	cf                   	iret   

c01002d0 <reenter_restore>:
c01002d0:	fa                   	cli    
c01002d1:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c01002d7:	0f a9                	pop    %gs
c01002d9:	0f a1                	pop    %fs
c01002db:	07                   	pop    %es
c01002dc:	1f                   	pop    %ds
c01002dd:	61                   	popa   
c01002de:	cf                   	iret   

c01002df <in_byte>:
c01002df:	31 d2                	xor    %edx,%edx
c01002e1:	8b 54 24 04          	mov    0x4(%esp),%edx
c01002e5:	31 c0                	xor    %eax,%eax
c01002e7:	ec                   	in     (%dx),%al
c01002e8:	90                   	nop
c01002e9:	90                   	nop
c01002ea:	c3                   	ret    

c01002eb <out_byte>:
c01002eb:	31 d2                	xor    %edx,%edx
c01002ed:	31 c0                	xor    %eax,%eax
c01002ef:	8b 54 24 04          	mov    0x4(%esp),%edx
c01002f3:	8a 44 24 08          	mov    0x8(%esp),%al
c01002f7:	ee                   	out    %al,(%dx)
c01002f8:	90                   	nop
c01002f9:	90                   	nop
c01002fa:	c3                   	ret    

c01002fb <in_byte2>:
c01002fb:	55                   	push   %ebp
c01002fc:	89 e5                	mov    %esp,%ebp
c01002fe:	52                   	push   %edx
c01002ff:	31 d2                	xor    %edx,%edx
c0100301:	66 8b 55 08          	mov    0x8(%ebp),%dx
c0100305:	31 c0                	xor    %eax,%eax
c0100307:	ec                   	in     (%dx),%al
c0100308:	90                   	nop
c0100309:	90                   	nop
c010030a:	5b                   	pop    %ebx
c010030b:	5d                   	pop    %ebp
c010030c:	c3                   	ret    

c010030d <disable_int>:
c010030d:	fa                   	cli    
c010030e:	c3                   	ret    

c010030f <enable_int>:
c010030f:	fb                   	sti    
c0100310:	c3                   	ret    

c0100311 <check_tss_esp0>:
c0100311:	55                   	push   %ebp
c0100312:	89 e5                	mov    %esp,%ebp
c0100314:	8b 45 08             	mov    0x8(%ebp),%eax
c0100317:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010031a:	83 c0 44             	add    $0x44,%eax
c010031d:	8b 15 44 06 11 c0    	mov    0xc0110644,%edx
c0100323:	39 d0                	cmp    %edx,%eax
c0100325:	74 7c                	je     c01003a3 <check_tss_esp0.2>

c0100327 <check_tss_esp0.1>:
c0100327:	50                   	push   %eax
c0100328:	52                   	push   %edx
c0100329:	68 10 e0 10 c0       	push   $0xc010e010
c010032e:	e8 59 fd ff ff       	call   c010008c <disp_str>
c0100333:	83 c4 04             	add    $0x4,%esp
c0100336:	5a                   	pop    %edx
c0100337:	58                   	pop    %eax
c0100338:	52                   	push   %edx
c0100339:	50                   	push   %eax
c010033a:	53                   	push   %ebx
c010033b:	e8 0a 6d 00 00       	call   c010704a <disp_int>
c0100340:	83 c4 04             	add    $0x4,%esp
c0100343:	58                   	pop    %eax
c0100344:	5a                   	pop    %edx
c0100345:	52                   	push   %edx
c0100346:	50                   	push   %eax
c0100347:	e8 fe 6c 00 00       	call   c010704a <disp_int>
c010034c:	58                   	pop    %eax
c010034d:	5a                   	pop    %edx
c010034e:	52                   	push   %edx
c010034f:	50                   	push   %eax
c0100350:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c0100356:	e8 ef 6c 00 00       	call   c010704a <disp_int>
c010035b:	83 c4 04             	add    $0x4,%esp
c010035e:	58                   	pop    %eax
c010035f:	5a                   	pop    %edx
c0100360:	52                   	push   %edx
c0100361:	50                   	push   %eax
c0100362:	ff 72 ec             	pushl  -0x14(%edx)
c0100365:	e8 e0 6c 00 00       	call   c010704a <disp_int>
c010036a:	83 c4 04             	add    $0x4,%esp
c010036d:	58                   	pop    %eax
c010036e:	5a                   	pop    %edx
c010036f:	52                   	push   %edx
c0100370:	50                   	push   %eax
c0100371:	ff 70 ec             	pushl  -0x14(%eax)
c0100374:	e8 d1 6c 00 00       	call   c010704a <disp_int>
c0100379:	83 c4 04             	add    $0x4,%esp
c010037c:	58                   	pop    %eax
c010037d:	5a                   	pop    %edx
c010037e:	52                   	push   %edx
c010037f:	50                   	push   %eax
c0100380:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100386:	e8 bf 6c 00 00       	call   c010704a <disp_int>
c010038b:	83 c4 04             	add    $0x4,%esp
c010038e:	58                   	pop    %eax
c010038f:	5a                   	pop    %edx
c0100390:	52                   	push   %edx
c0100391:	50                   	push   %eax
c0100392:	68 60 f7 10 c0       	push   $0xc010f760
c0100397:	e8 ae 6c 00 00       	call   c010704a <disp_int>
c010039c:	83 c4 04             	add    $0x4,%esp
c010039f:	58                   	pop    %eax
c01003a0:	5a                   	pop    %edx
c01003a1:	5d                   	pop    %ebp
c01003a2:	c3                   	ret    

c01003a3 <check_tss_esp0.2>:
c01003a3:	5d                   	pop    %ebp
c01003a4:	c3                   	ret    

c01003a5 <enable_8259A_casecade_irq>:
c01003a5:	9c                   	pushf  
c01003a6:	fa                   	cli    
c01003a7:	e4 21                	in     $0x21,%al
c01003a9:	24 fb                	and    $0xfb,%al
c01003ab:	e6 21                	out    %al,$0x21
c01003ad:	9d                   	popf   
c01003ae:	c3                   	ret    

c01003af <disable_8259A_casecade_irq>:
c01003af:	9c                   	pushf  
c01003b0:	fa                   	cli    
c01003b1:	e4 21                	in     $0x21,%al
c01003b3:	0c 04                	or     $0x4,%al
c01003b5:	e6 21                	out    %al,$0x21
c01003b7:	9c                   	pushf  
c01003b8:	c3                   	ret    

c01003b9 <enable_8259A_slave_winchester_irq>:
c01003b9:	9c                   	pushf  
c01003ba:	fa                   	cli    
c01003bb:	e4 a1                	in     $0xa1,%al
c01003bd:	24 bf                	and    $0xbf,%al
c01003bf:	e6 a1                	out    %al,$0xa1
c01003c1:	9d                   	popf   
c01003c2:	c3                   	ret    

c01003c3 <disable_8259A_slave_winchester_irq>:
c01003c3:	9c                   	pushf  
c01003c4:	fa                   	cli    
c01003c5:	e4 a1                	in     $0xa1,%al
c01003c7:	0c 40                	or     $0x40,%al
c01003c9:	e6 a1                	out    %al,$0xa1
c01003cb:	9d                   	popf   
c01003cc:	c3                   	ret    

c01003cd <update_cr3>:
c01003cd:	55                   	push   %ebp
c01003ce:	89 e5                	mov    %esp,%ebp
c01003d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01003d3:	0f 22 d8             	mov    %eax,%cr3
c01003d6:	89 ec                	mov    %ebp,%esp
c01003d8:	5d                   	pop    %ebp
c01003d9:	c3                   	ret    

c01003da <update_tss>:
c01003da:	55                   	push   %ebp
c01003db:	89 e5                	mov    %esp,%ebp
c01003dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01003e0:	a3 44 06 11 c0       	mov    %eax,0xc0110644
c01003e5:	89 ec                	mov    %ebp,%esp
c01003e7:	5d                   	pop    %ebp
c01003e8:	c3                   	ret    

c01003e9 <get_running_thread_pcb>:
c01003e9:	89 e0                	mov    %esp,%eax
c01003eb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01003f0:	c3                   	ret    

c01003f1 <sys_call_test>:
c01003f1:	9c                   	pushf  
c01003f2:	9d                   	popf   
c01003f3:	c3                   	ret    

c01003f4 <enable_8259A_slave_net_irq>:
c01003f4:	9c                   	pushf  
c01003f5:	fa                   	cli    
c01003f6:	e4 a1                	in     $0xa1,%al
c01003f8:	24 7f                	and    $0x7f,%al
c01003fa:	e6 a1                	out    %al,$0xa1
c01003fc:	9d                   	popf   
c01003fd:	c3                   	ret    

c01003fe <kernel_main>:
c01003fe:	55                   	push   %ebp
c01003ff:	89 e5                	mov    %esp,%ebp
c0100401:	83 ec 18             	sub    $0x18,%esp
c0100404:	e8 7b 01 00 00       	call   c0100584 <init>
c0100409:	c7 45 f4 0f 00 00 00 	movl   $0xf,-0xc(%ebp)
c0100410:	e8 d4 ff ff ff       	call   c01003e9 <get_running_thread_pcb>
c0100415:	a3 e0 0e 11 c0       	mov    %eax,0xc0110ee0
c010041a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010041d:	8d 50 02             	lea    0x2(%eax),%edx
c0100420:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100425:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c010042b:	8b 15 e0 0e 11 c0    	mov    0xc0110ee0,%edx
c0100431:	8b 80 1c 01 00 00    	mov    0x11c(%eax),%eax
c0100437:	89 82 18 01 00 00    	mov    %eax,0x118(%edx)
c010043d:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100442:	8b 15 28 0f 11 c0    	mov    0xc0110f28,%edx
c0100448:	89 50 08             	mov    %edx,0x8(%eax)
c010044b:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100450:	05 28 01 00 00       	add    $0x128,%eax
c0100455:	83 ec 08             	sub    $0x8,%esp
c0100458:	68 00 b0 10 c0       	push   $0xc010b000
c010045d:	50                   	push   %eax
c010045e:	e8 27 bd 00 00       	call   c010c18a <Strcpy>
c0100463:	83 c4 10             	add    $0x10,%esp
c0100466:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010046b:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0100470:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100475:	05 60 02 00 00       	add    $0x260,%eax
c010047a:	83 ec 08             	sub    $0x8,%esp
c010047d:	50                   	push   %eax
c010047e:	68 ec fd 10 c0       	push   $0xc010fdec
c0100483:	e8 78 9c 00 00       	call   c010a100 <appendToDoubleLinkList>
c0100488:	83 c4 10             	add    $0x10,%esp
c010048b:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100490:	05 6a 02 00 00       	add    $0x26a,%eax
c0100495:	83 ec 08             	sub    $0x8,%esp
c0100498:	50                   	push   %eax
c0100499:	68 ec fd 10 c0       	push   $0xc010fdec
c010049e:	e8 5d 9c 00 00       	call   c010a100 <appendToDoubleLinkList>
c01004a3:	83 c4 10             	add    $0x10,%esp
c01004a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004a9:	83 ec 0c             	sub    $0xc,%esp
c01004ac:	50                   	push   %eax
c01004ad:	6a 00                	push   $0x0
c01004af:	68 0c b0 10 c0       	push   $0xc010b00c
c01004b4:	68 13 b0 10 c0       	push   $0xc010b013
c01004b9:	68 27 51 10 c0       	push   $0xc0105127
c01004be:	e8 81 99 00 00       	call   c0109e44 <process_execute>
c01004c3:	83 c4 20             	add    $0x20,%esp
c01004c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004c9:	83 ec 0c             	sub    $0xc,%esp
c01004cc:	50                   	push   %eax
c01004cd:	6a 00                	push   $0x0
c01004cf:	68 1c b0 10 c0       	push   $0xc010b01c
c01004d4:	68 24 b0 10 c0       	push   $0xc010b024
c01004d9:	68 d9 15 10 c0       	push   $0xc01015d9
c01004de:	e8 61 99 00 00       	call   c0109e44 <process_execute>
c01004e3:	83 c4 20             	add    $0x20,%esp
c01004e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004e9:	83 ec 0c             	sub    $0xc,%esp
c01004ec:	50                   	push   %eax
c01004ed:	6a 00                	push   $0x0
c01004ef:	68 2d b0 10 c0       	push   $0xc010b02d
c01004f4:	68 34 b0 10 c0       	push   $0xc010b034
c01004f9:	68 2d 07 10 c0       	push   $0xc010072d
c01004fe:	e8 41 99 00 00       	call   c0109e44 <process_execute>
c0100503:	83 c4 20             	add    $0x20,%esp
c0100506:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100509:	83 ec 0c             	sub    $0xc,%esp
c010050c:	50                   	push   %eax
c010050d:	6a 00                	push   $0x0
c010050f:	68 3d b0 10 c0       	push   $0xc010b03d
c0100514:	68 45 b0 10 c0       	push   $0xc010b045
c0100519:	68 bd 45 10 c0       	push   $0xc01045bd
c010051e:	e8 21 99 00 00       	call   c0109e44 <process_execute>
c0100523:	83 c4 20             	add    $0x20,%esp
c0100526:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100529:	83 e8 02             	sub    $0x2,%eax
c010052c:	83 ec 0c             	sub    $0xc,%esp
c010052f:	50                   	push   %eax
c0100530:	6a 01                	push   $0x1
c0100532:	68 4f b0 10 c0       	push   $0xc010b04f
c0100537:	68 59 b0 10 c0       	push   $0xc010b059
c010053c:	68 f8 06 10 c0       	push   $0xc01006f8
c0100541:	e8 fe 98 00 00       	call   c0109e44 <process_execute>
c0100546:	83 c4 20             	add    $0x20,%esp
c0100549:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010054c:	83 e8 03             	sub    $0x3,%eax
c010054f:	83 ec 0c             	sub    $0xc,%esp
c0100552:	50                   	push   %eax
c0100553:	6a 01                	push   $0x1
c0100555:	68 66 b0 10 c0       	push   $0xc010b066
c010055a:	68 70 b0 10 c0       	push   $0xc010b070
c010055f:	68 15 07 10 c0       	push   $0xc0100715
c0100564:	e8 db 98 00 00       	call   c0109e44 <process_execute>
c0100569:	83 c4 20             	add    $0x20,%esp
c010056c:	83 ec 0c             	sub    $0xc,%esp
c010056f:	68 7d b0 10 c0       	push   $0xc010b07d
c0100574:	e8 13 fb ff ff       	call   c010008c <disp_str>
c0100579:	83 c4 10             	add    $0x10,%esp
c010057c:	fb                   	sti    
c010057d:	e8 ec 65 00 00       	call   c0106b6e <stop_here>
c0100582:	eb f9                	jmp    c010057d <kernel_main+0x17f>

c0100584 <init>:
c0100584:	55                   	push   %ebp
c0100585:	89 e5                	mov    %esp,%ebp
c0100587:	83 ec 08             	sub    $0x8,%esp
c010058a:	c7 05 28 0f 11 c0 00 	movl   $0x400000,0xc0110f28
c0100591:	00 40 00 
c0100594:	c7 05 a8 f7 10 c0 63 	movl   $0x63,0xc010f7a8
c010059b:	00 00 00 
c010059e:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01005a5:	00 00 00 
c01005a8:	c7 05 90 f7 10 c0 00 	movl   $0x0,0xc010f790
c01005af:	00 00 00 
c01005b2:	c7 05 c4 06 11 c0 64 	movl   $0x64,0xc01106c4
c01005b9:	00 00 00 
c01005bc:	c7 05 fc fd 10 c0 09 	movl   $0x9,0xc010fdfc
c01005c3:	00 00 00 
c01005c6:	c7 05 c0 fb 10 c0 00 	movl   $0x0,0xc010fbc0
c01005cd:	00 00 00 
c01005d0:	83 ec 0c             	sub    $0xc,%esp
c01005d3:	68 87 b0 10 c0       	push   $0xc010b087
c01005d8:	e8 af fa ff ff       	call   c010008c <disp_str>
c01005dd:	83 c4 10             	add    $0x10,%esp
c01005e0:	e8 b5 6f 00 00       	call   c010759a <init_keyboard>
c01005e5:	83 ec 0c             	sub    $0xc,%esp
c01005e8:	68 00 00 00 04       	push   $0x4000000
c01005ed:	e8 33 64 00 00       	call   c0106a25 <init_memory>
c01005f2:	83 c4 10             	add    $0x10,%esp
c01005f5:	e8 b6 9e 00 00       	call   c010a4b0 <DriverInitialize>
c01005fa:	e8 1e 9f 00 00       	call   c010a51d <DriverSend>
c01005ff:	83 ec 0c             	sub    $0xc,%esp
c0100602:	68 8d b0 10 c0       	push   $0xc010b08d
c0100607:	e8 80 fa ff ff       	call   c010008c <disp_str>
c010060c:	83 c4 10             	add    $0x10,%esp
c010060f:	83 ec 0c             	sub    $0xc,%esp
c0100612:	68 ec fd 10 c0       	push   $0xc010fdec
c0100617:	e8 b9 99 00 00       	call   c0109fd5 <initDoubleLinkList>
c010061c:	83 c4 10             	add    $0x10,%esp
c010061f:	83 ec 0c             	sub    $0xc,%esp
c0100622:	68 04 0f 11 c0       	push   $0xc0110f04
c0100627:	e8 a9 99 00 00       	call   c0109fd5 <initDoubleLinkList>
c010062c:	83 c4 10             	add    $0x10,%esp
c010062f:	90                   	nop
c0100630:	c9                   	leave  
c0100631:	c3                   	ret    

c0100632 <kernel_thread_a>:
c0100632:	55                   	push   %ebp
c0100633:	89 e5                	mov    %esp,%ebp
c0100635:	83 ec 18             	sub    $0x18,%esp
c0100638:	83 ec 0c             	sub    $0xc,%esp
c010063b:	ff 75 08             	pushl  0x8(%ebp)
c010063e:	e8 49 fa ff ff       	call   c010008c <disp_str>
c0100643:	83 c4 10             	add    $0x10,%esp
c0100646:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c010064b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010064e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100655:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100658:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c010065d:	83 ec 0c             	sub    $0xc,%esp
c0100660:	68 9f b0 10 c0       	push   $0xc010b09f
c0100665:	e8 22 fa ff ff       	call   c010008c <disp_str>
c010066a:	83 c4 10             	add    $0x10,%esp
c010066d:	83 ec 0c             	sub    $0xc,%esp
c0100670:	68 a8 b0 10 c0       	push   $0xc010b0a8
c0100675:	e8 12 fa ff ff       	call   c010008c <disp_str>
c010067a:	83 c4 10             	add    $0x10,%esp
c010067d:	eb d6                	jmp    c0100655 <kernel_thread_a+0x23>

c010067f <kernel_thread_b>:
c010067f:	55                   	push   %ebp
c0100680:	89 e5                	mov    %esp,%ebp
c0100682:	83 ec 18             	sub    $0x18,%esp
c0100685:	83 ec 0c             	sub    $0xc,%esp
c0100688:	ff 75 08             	pushl  0x8(%ebp)
c010068b:	e8 fc f9 ff ff       	call   c010008c <disp_str>
c0100690:	83 c4 10             	add    $0x10,%esp
c0100693:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100698:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010069b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01006a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01006a5:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c01006aa:	83 ec 0c             	sub    $0xc,%esp
c01006ad:	68 aa b0 10 c0       	push   $0xc010b0aa
c01006b2:	e8 d5 f9 ff ff       	call   c010008c <disp_str>
c01006b7:	83 c4 10             	add    $0x10,%esp
c01006ba:	83 ec 0c             	sub    $0xc,%esp
c01006bd:	68 a8 b0 10 c0       	push   $0xc010b0a8
c01006c2:	e8 c5 f9 ff ff       	call   c010008c <disp_str>
c01006c7:	83 c4 10             	add    $0x10,%esp
c01006ca:	eb d6                	jmp    c01006a2 <kernel_thread_b+0x23>

c01006cc <kernel_thread_c>:
c01006cc:	55                   	push   %ebp
c01006cd:	89 e5                	mov    %esp,%ebp
c01006cf:	83 ec 08             	sub    $0x8,%esp
c01006d2:	83 ec 0c             	sub    $0xc,%esp
c01006d5:	ff 75 08             	pushl  0x8(%ebp)
c01006d8:	e8 af f9 ff ff       	call   c010008c <disp_str>
c01006dd:	83 c4 10             	add    $0x10,%esp
c01006e0:	eb fe                	jmp    c01006e0 <kernel_thread_c+0x14>

c01006e2 <kernel_thread_d>:
c01006e2:	55                   	push   %ebp
c01006e3:	89 e5                	mov    %esp,%ebp
c01006e5:	83 ec 08             	sub    $0x8,%esp
c01006e8:	83 ec 0c             	sub    $0xc,%esp
c01006eb:	ff 75 08             	pushl  0x8(%ebp)
c01006ee:	e8 99 f9 ff ff       	call   c010008c <disp_str>
c01006f3:	83 c4 10             	add    $0x10,%esp
c01006f6:	eb fe                	jmp    c01006f6 <kernel_thread_d+0x14>

c01006f8 <user_proc_a>:
c01006f8:	55                   	push   %ebp
c01006f9:	89 e5                	mov    %esp,%ebp
c01006fb:	83 ec 08             	sub    $0x8,%esp
c01006fe:	83 ec 0c             	sub    $0xc,%esp
c0100701:	68 b4 b0 10 c0       	push   $0xc010b0b4
c0100706:	e8 81 f9 ff ff       	call   c010008c <disp_str>
c010070b:	83 c4 10             	add    $0x10,%esp
c010070e:	e8 4f 7b 00 00       	call   c0108262 <test_exec>
c0100713:	eb fe                	jmp    c0100713 <user_proc_a+0x1b>

c0100715 <user_proc_b>:
c0100715:	55                   	push   %ebp
c0100716:	89 e5                	mov    %esp,%ebp
c0100718:	83 ec 08             	sub    $0x8,%esp
c010071b:	83 ec 0c             	sub    $0xc,%esp
c010071e:	68 d4 b0 10 c0       	push   $0xc010b0d4
c0100723:	e8 64 f9 ff ff       	call   c010008c <disp_str>
c0100728:	83 c4 10             	add    $0x10,%esp
c010072b:	eb fe                	jmp    c010072b <user_proc_b+0x16>

c010072d <TaskHD>:
c010072d:	55                   	push   %ebp
c010072e:	89 e5                	mov    %esp,%ebp
c0100730:	83 ec 18             	sub    $0x18,%esp
c0100733:	e8 b1 fc ff ff       	call   c01003e9 <get_running_thread_pcb>
c0100738:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010073b:	e8 32 00 00 00       	call   c0100772 <init_hd>
c0100740:	83 ec 0c             	sub    $0xc,%esp
c0100743:	6a 7c                	push   $0x7c
c0100745:	e8 62 0e 00 00       	call   c01015ac <sys_malloc>
c010074a:	83 c4 10             	add    $0x10,%esp
c010074d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100750:	83 ec 04             	sub    $0x4,%esp
c0100753:	6a 7c                	push   $0x7c
c0100755:	6a 00                	push   $0x0
c0100757:	ff 75 f0             	pushl  -0x10(%ebp)
c010075a:	e8 0c ba 00 00       	call   c010c16b <Memset>
c010075f:	83 c4 10             	add    $0x10,%esp
c0100762:	83 ec 0c             	sub    $0xc,%esp
c0100765:	ff 75 f0             	pushl  -0x10(%ebp)
c0100768:	e8 1f 00 00 00       	call   c010078c <hd_handle>
c010076d:	83 c4 10             	add    $0x10,%esp
c0100770:	eb de                	jmp    c0100750 <TaskHD+0x23>

c0100772 <init_hd>:
c0100772:	55                   	push   %ebp
c0100773:	89 e5                	mov    %esp,%ebp
c0100775:	83 ec 18             	sub    $0x18,%esp
c0100778:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c010077f:	e8 21 fc ff ff       	call   c01003a5 <enable_8259A_casecade_irq>
c0100784:	e8 30 fc ff ff       	call   c01003b9 <enable_8259A_slave_winchester_irq>
c0100789:	90                   	nop
c010078a:	c9                   	leave  
c010078b:	c3                   	ret    

c010078c <hd_handle>:
c010078c:	55                   	push   %ebp
c010078d:	89 e5                	mov    %esp,%ebp
c010078f:	83 ec 18             	sub    $0x18,%esp
c0100792:	83 ec 04             	sub    $0x4,%esp
c0100795:	6a 12                	push   $0x12
c0100797:	ff 75 08             	pushl  0x8(%ebp)
c010079a:	6a 02                	push   $0x2
c010079c:	e8 17 8d 00 00       	call   c01094b8 <send_rec>
c01007a1:	83 c4 10             	add    $0x10,%esp
c01007a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01007a7:	8b 40 78             	mov    0x78(%eax),%eax
c01007aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01007ad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01007b1:	0f 84 d4 00 00 00    	je     c010088b <hd_handle+0xff>
c01007b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01007ba:	8b 00                	mov    (%eax),%eax
c01007bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01007bf:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01007c3:	74 28                	je     c01007ed <hd_handle+0x61>
c01007c5:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01007c9:	74 22                	je     c01007ed <hd_handle+0x61>
c01007cb:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01007cf:	74 1c                	je     c01007ed <hd_handle+0x61>
c01007d1:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01007d5:	74 16                	je     c01007ed <hd_handle+0x61>
c01007d7:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01007de:	74 0d                	je     c01007ed <hd_handle+0x61>
c01007e0:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01007e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01007ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01007ed:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01007f1:	74 34                	je     c0100827 <hd_handle+0x9b>
c01007f3:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01007f7:	74 2e                	je     c0100827 <hd_handle+0x9b>
c01007f9:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01007fd:	74 28                	je     c0100827 <hd_handle+0x9b>
c01007ff:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100803:	74 22                	je     c0100827 <hd_handle+0x9b>
c0100805:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c010080c:	74 19                	je     c0100827 <hd_handle+0x9b>
c010080e:	6a 6d                	push   $0x6d
c0100810:	68 f4 b0 10 c0       	push   $0xc010b0f4
c0100815:	68 f4 b0 10 c0       	push   $0xc010b0f4
c010081a:	68 fc b0 10 c0       	push   $0xc010b0fc
c010081f:	e8 24 80 00 00       	call   c0108848 <assertion_failure>
c0100824:	83 c4 10             	add    $0x10,%esp
c0100827:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010082b:	74 2c                	je     c0100859 <hd_handle+0xcd>
c010082d:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100831:	77 0e                	ja     c0100841 <hd_handle+0xb5>
c0100833:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100837:	74 19                	je     c0100852 <hd_handle+0xc6>
c0100839:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c010083d:	74 1a                	je     c0100859 <hd_handle+0xcd>
c010083f:	eb 37                	jmp    c0100878 <hd_handle+0xec>
c0100841:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100845:	74 22                	je     c0100869 <hd_handle+0xdd>
c0100847:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c010084e:	74 3e                	je     c010088e <hd_handle+0x102>
c0100850:	eb 26                	jmp    c0100878 <hd_handle+0xec>
c0100852:	e8 e6 06 00 00       	call   c0100f3d <hd_open>
c0100857:	eb 36                	jmp    c010088f <hd_handle+0x103>
c0100859:	83 ec 0c             	sub    $0xc,%esp
c010085c:	ff 75 08             	pushl  0x8(%ebp)
c010085f:	e8 b2 08 00 00       	call   c0101116 <hd_rdwt>
c0100864:	83 c4 10             	add    $0x10,%esp
c0100867:	eb 26                	jmp    c010088f <hd_handle+0x103>
c0100869:	83 ec 0c             	sub    $0xc,%esp
c010086c:	6a 00                	push   $0x0
c010086e:	e8 71 07 00 00       	call   c0100fe4 <get_hd_ioctl>
c0100873:	83 c4 10             	add    $0x10,%esp
c0100876:	eb 17                	jmp    c010088f <hd_handle+0x103>
c0100878:	83 ec 0c             	sub    $0xc,%esp
c010087b:	68 56 b1 10 c0       	push   $0xc010b156
c0100880:	e8 7f 7f 00 00       	call   c0108804 <spin>
c0100885:	83 c4 10             	add    $0x10,%esp
c0100888:	90                   	nop
c0100889:	eb 04                	jmp    c010088f <hd_handle+0x103>
c010088b:	90                   	nop
c010088c:	eb 01                	jmp    c010088f <hd_handle+0x103>
c010088e:	90                   	nop
c010088f:	c9                   	leave  
c0100890:	c3                   	ret    

c0100891 <hd_cmd_out>:
c0100891:	55                   	push   %ebp
c0100892:	89 e5                	mov    %esp,%ebp
c0100894:	83 ec 08             	sub    $0x8,%esp
c0100897:	83 ec 04             	sub    $0x4,%esp
c010089a:	68 18 73 01 00       	push   $0x17318
c010089f:	6a 00                	push   $0x0
c01008a1:	68 80 00 00 00       	push   $0x80
c01008a6:	e8 52 0b 00 00       	call   c01013fd <waitfor>
c01008ab:	83 c4 10             	add    $0x10,%esp
c01008ae:	85 c0                	test   %eax,%eax
c01008b0:	75 10                	jne    c01008c2 <hd_cmd_out+0x31>
c01008b2:	83 ec 0c             	sub    $0xc,%esp
c01008b5:	68 68 b1 10 c0       	push   $0xc010b168
c01008ba:	e8 6b 7f 00 00       	call   c010882a <panic>
c01008bf:	83 c4 10             	add    $0x10,%esp
c01008c2:	83 ec 08             	sub    $0x8,%esp
c01008c5:	6a 00                	push   $0x0
c01008c7:	68 f6 03 00 00       	push   $0x3f6
c01008cc:	e8 1a fa ff ff       	call   c01002eb <out_byte>
c01008d1:	83 c4 10             	add    $0x10,%esp
c01008d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01008d7:	0f b6 00             	movzbl (%eax),%eax
c01008da:	0f b6 c0             	movzbl %al,%eax
c01008dd:	83 ec 08             	sub    $0x8,%esp
c01008e0:	50                   	push   %eax
c01008e1:	68 f1 01 00 00       	push   $0x1f1
c01008e6:	e8 00 fa ff ff       	call   c01002eb <out_byte>
c01008eb:	83 c4 10             	add    $0x10,%esp
c01008ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01008f1:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01008f5:	0f b6 c0             	movzbl %al,%eax
c01008f8:	83 ec 08             	sub    $0x8,%esp
c01008fb:	50                   	push   %eax
c01008fc:	68 f2 01 00 00       	push   $0x1f2
c0100901:	e8 e5 f9 ff ff       	call   c01002eb <out_byte>
c0100906:	83 c4 10             	add    $0x10,%esp
c0100909:	8b 45 08             	mov    0x8(%ebp),%eax
c010090c:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0100910:	0f b6 c0             	movzbl %al,%eax
c0100913:	83 ec 08             	sub    $0x8,%esp
c0100916:	50                   	push   %eax
c0100917:	68 f3 01 00 00       	push   $0x1f3
c010091c:	e8 ca f9 ff ff       	call   c01002eb <out_byte>
c0100921:	83 c4 10             	add    $0x10,%esp
c0100924:	8b 45 08             	mov    0x8(%ebp),%eax
c0100927:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c010092b:	0f b6 c0             	movzbl %al,%eax
c010092e:	83 ec 08             	sub    $0x8,%esp
c0100931:	50                   	push   %eax
c0100932:	68 f4 01 00 00       	push   $0x1f4
c0100937:	e8 af f9 ff ff       	call   c01002eb <out_byte>
c010093c:	83 c4 10             	add    $0x10,%esp
c010093f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100942:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100946:	0f b6 c0             	movzbl %al,%eax
c0100949:	83 ec 08             	sub    $0x8,%esp
c010094c:	50                   	push   %eax
c010094d:	68 f5 01 00 00       	push   $0x1f5
c0100952:	e8 94 f9 ff ff       	call   c01002eb <out_byte>
c0100957:	83 c4 10             	add    $0x10,%esp
c010095a:	8b 45 08             	mov    0x8(%ebp),%eax
c010095d:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0100961:	0f b6 c0             	movzbl %al,%eax
c0100964:	83 ec 08             	sub    $0x8,%esp
c0100967:	50                   	push   %eax
c0100968:	68 f6 01 00 00       	push   $0x1f6
c010096d:	e8 79 f9 ff ff       	call   c01002eb <out_byte>
c0100972:	83 c4 10             	add    $0x10,%esp
c0100975:	8b 45 08             	mov    0x8(%ebp),%eax
c0100978:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c010097c:	0f b6 c0             	movzbl %al,%eax
c010097f:	83 ec 08             	sub    $0x8,%esp
c0100982:	50                   	push   %eax
c0100983:	68 f7 01 00 00       	push   $0x1f7
c0100988:	e8 5e f9 ff ff       	call   c01002eb <out_byte>
c010098d:	83 c4 10             	add    $0x10,%esp
c0100990:	90                   	nop
c0100991:	c9                   	leave  
c0100992:	c3                   	ret    

c0100993 <hd_identify>:
c0100993:	55                   	push   %ebp
c0100994:	89 e5                	mov    %esp,%ebp
c0100996:	53                   	push   %ebx
c0100997:	83 ec 24             	sub    $0x24,%esp
c010099a:	89 e0                	mov    %esp,%eax
c010099c:	89 c3                	mov    %eax,%ebx
c010099e:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c01009a2:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c01009a6:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c01009aa:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c01009ae:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01009b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01009b5:	c1 e0 04             	shl    $0x4,%eax
c01009b8:	83 c8 e0             	or     $0xffffffe0,%eax
c01009bb:	88 45 ea             	mov    %al,-0x16(%ebp)
c01009be:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c01009c2:	83 ec 0c             	sub    $0xc,%esp
c01009c5:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c01009c8:	50                   	push   %eax
c01009c9:	e8 c3 fe ff ff       	call   c0100891 <hd_cmd_out>
c01009ce:	83 c4 10             	add    $0x10,%esp
c01009d1:	e8 f0 06 00 00       	call   c01010c6 <interrupt_wait>
c01009d6:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c01009dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01009e0:	8d 50 ff             	lea    -0x1(%eax),%edx
c01009e3:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01009e6:	89 c2                	mov    %eax,%edx
c01009e8:	b8 10 00 00 00       	mov    $0x10,%eax
c01009ed:	83 e8 01             	sub    $0x1,%eax
c01009f0:	01 d0                	add    %edx,%eax
c01009f2:	b9 10 00 00 00       	mov    $0x10,%ecx
c01009f7:	ba 00 00 00 00       	mov    $0x0,%edx
c01009fc:	f7 f1                	div    %ecx
c01009fe:	6b c0 10             	imul   $0x10,%eax,%eax
c0100a01:	29 c4                	sub    %eax,%esp
c0100a03:	89 e0                	mov    %esp,%eax
c0100a05:	83 c0 00             	add    $0x0,%eax
c0100a08:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100a0b:	83 ec 04             	sub    $0x4,%esp
c0100a0e:	ff 75 f4             	pushl  -0xc(%ebp)
c0100a11:	6a 00                	push   $0x0
c0100a13:	ff 75 ec             	pushl  -0x14(%ebp)
c0100a16:	e8 50 b7 00 00       	call   c010c16b <Memset>
c0100a1b:	83 c4 10             	add    $0x10,%esp
c0100a1e:	83 ec 04             	sub    $0x4,%esp
c0100a21:	ff 75 f4             	pushl  -0xc(%ebp)
c0100a24:	ff 75 ec             	pushl  -0x14(%ebp)
c0100a27:	68 f0 01 00 00       	push   $0x1f0
c0100a2c:	e8 8e b7 00 00       	call   c010c1bf <read_port>
c0100a31:	83 c4 10             	add    $0x10,%esp
c0100a34:	83 ec 0c             	sub    $0xc,%esp
c0100a37:	ff 75 ec             	pushl  -0x14(%ebp)
c0100a3a:	e8 0b 00 00 00       	call   c0100a4a <print_hdinfo>
c0100a3f:	83 c4 10             	add    $0x10,%esp
c0100a42:	89 dc                	mov    %ebx,%esp
c0100a44:	90                   	nop
c0100a45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100a48:	c9                   	leave  
c0100a49:	c3                   	ret    

c0100a4a <print_hdinfo>:
c0100a4a:	55                   	push   %ebp
c0100a4b:	89 e5                	mov    %esp,%ebp
c0100a4d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100a53:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100a59:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100a5f:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100a66:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100a6d:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100a74:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100a7b:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100a82:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100a88:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100a8e:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100a95:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100a9c:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100aa3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100aaa:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100ab1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100ab8:	e9 8f 00 00 00       	jmp    c0100b4c <print_hdinfo+0x102>
c0100abd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100ac4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100ac7:	89 d0                	mov    %edx,%eax
c0100ac9:	01 c0                	add    %eax,%eax
c0100acb:	01 d0                	add    %edx,%eax
c0100acd:	c1 e0 03             	shl    $0x3,%eax
c0100ad0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ad3:	01 c8                	add    %ecx,%eax
c0100ad5:	83 e8 44             	sub    $0x44,%eax
c0100ad8:	0f b7 00             	movzwl (%eax),%eax
c0100adb:	0f b7 c0             	movzwl %ax,%eax
c0100ade:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100ae1:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ae4:	01 d0                	add    %edx,%eax
c0100ae6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100ae9:	eb 30                	jmp    c0100b1b <print_hdinfo+0xd1>
c0100aeb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100aee:	8d 50 01             	lea    0x1(%eax),%edx
c0100af1:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100af4:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100af7:	83 c2 01             	add    $0x1,%edx
c0100afa:	0f b6 00             	movzbl (%eax),%eax
c0100afd:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100b01:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100b04:	8d 50 01             	lea    0x1(%eax),%edx
c0100b07:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100b0a:	0f b6 00             	movzbl (%eax),%eax
c0100b0d:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100b10:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100b13:	01 ca                	add    %ecx,%edx
c0100b15:	88 02                	mov    %al,(%edx)
c0100b17:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100b1b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100b1e:	89 d0                	mov    %edx,%eax
c0100b20:	01 c0                	add    %eax,%eax
c0100b22:	01 d0                	add    %edx,%eax
c0100b24:	c1 e0 03             	shl    $0x3,%eax
c0100b27:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100b2a:	01 c8                	add    %ecx,%eax
c0100b2c:	83 e8 42             	sub    $0x42,%eax
c0100b2f:	0f b7 00             	movzwl (%eax),%eax
c0100b32:	66 d1 e8             	shr    %ax
c0100b35:	0f b7 c0             	movzwl %ax,%eax
c0100b38:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100b3b:	7c ae                	jl     c0100aeb <print_hdinfo+0xa1>
c0100b3d:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100b40:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100b43:	01 d0                	add    %edx,%eax
c0100b45:	c6 00 00             	movb   $0x0,(%eax)
c0100b48:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100b4c:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100b50:	0f 8e 67 ff ff ff    	jle    c0100abd <print_hdinfo+0x73>
c0100b56:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b59:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100b5d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100b61:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100b65:	66 c1 e8 08          	shr    $0x8,%ax
c0100b69:	66 85 c0             	test   %ax,%ax
c0100b6c:	0f 95 c0             	setne  %al
c0100b6f:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100b72:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100b79:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100b7f:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100b83:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100b87:	75 15                	jne    c0100b9e <print_hdinfo+0x154>
c0100b89:	83 ec 08             	sub    $0x8,%esp
c0100b8c:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100b8f:	50                   	push   %eax
c0100b90:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100b93:	50                   	push   %eax
c0100b94:	e8 f1 b5 00 00       	call   c010c18a <Strcpy>
c0100b99:	83 c4 10             	add    $0x10,%esp
c0100b9c:	eb 13                	jmp    c0100bb1 <print_hdinfo+0x167>
c0100b9e:	83 ec 08             	sub    $0x8,%esp
c0100ba1:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100ba4:	50                   	push   %eax
c0100ba5:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100ba8:	50                   	push   %eax
c0100ba9:	e8 dc b5 00 00       	call   c010c18a <Strcpy>
c0100bae:	83 c4 10             	add    $0x10,%esp
c0100bb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bb4:	83 c0 7a             	add    $0x7a,%eax
c0100bb7:	0f b7 00             	movzwl (%eax),%eax
c0100bba:	0f b7 d0             	movzwl %ax,%edx
c0100bbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bc0:	83 c0 78             	add    $0x78,%eax
c0100bc3:	0f b7 00             	movzwl (%eax),%eax
c0100bc6:	0f b7 c0             	movzwl %ax,%eax
c0100bc9:	83 c0 10             	add    $0x10,%eax
c0100bcc:	89 c1                	mov    %eax,%ecx
c0100bce:	d3 e2                	shl    %cl,%edx
c0100bd0:	89 d0                	mov    %edx,%eax
c0100bd2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100bd5:	90                   	nop
c0100bd6:	c9                   	leave  
c0100bd7:	c3                   	ret    

c0100bd8 <print_dpt_entry>:
c0100bd8:	55                   	push   %ebp
c0100bd9:	89 e5                	mov    %esp,%ebp
c0100bdb:	83 ec 08             	sub    $0x8,%esp
c0100bde:	8b 45 08             	mov    0x8(%ebp),%eax
c0100be1:	8b 40 08             	mov    0x8(%eax),%eax
c0100be4:	83 ec 08             	sub    $0x8,%esp
c0100be7:	50                   	push   %eax
c0100be8:	68 72 b1 10 c0       	push   $0xc010b172
c0100bed:	e8 f9 78 00 00       	call   c01084eb <Printf>
c0100bf2:	83 c4 10             	add    $0x10,%esp
c0100bf5:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bf8:	8b 40 0c             	mov    0xc(%eax),%eax
c0100bfb:	83 ec 08             	sub    $0x8,%esp
c0100bfe:	50                   	push   %eax
c0100bff:	68 7a b1 10 c0       	push   $0xc010b17a
c0100c04:	e8 e2 78 00 00       	call   c01084eb <Printf>
c0100c09:	83 c4 10             	add    $0x10,%esp
c0100c0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c0f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100c13:	0f b6 c0             	movzbl %al,%eax
c0100c16:	83 ec 08             	sub    $0x8,%esp
c0100c19:	50                   	push   %eax
c0100c1a:	68 8b b1 10 c0       	push   $0xc010b18b
c0100c1f:	e8 c7 78 00 00       	call   c01084eb <Printf>
c0100c24:	83 c4 10             	add    $0x10,%esp
c0100c27:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c2a:	0f b6 00             	movzbl (%eax),%eax
c0100c2d:	0f b6 c0             	movzbl %al,%eax
c0100c30:	83 ec 08             	sub    $0x8,%esp
c0100c33:	50                   	push   %eax
c0100c34:	68 99 b1 10 c0       	push   $0xc010b199
c0100c39:	e8 ad 78 00 00       	call   c01084eb <Printf>
c0100c3e:	83 c4 10             	add    $0x10,%esp
c0100c41:	90                   	nop
c0100c42:	c9                   	leave  
c0100c43:	c3                   	ret    

c0100c44 <get_partition_table>:
c0100c44:	55                   	push   %ebp
c0100c45:	89 e5                	mov    %esp,%ebp
c0100c47:	53                   	push   %ebx
c0100c48:	83 ec 24             	sub    $0x24,%esp
c0100c4b:	89 e0                	mov    %esp,%eax
c0100c4d:	89 c3                	mov    %eax,%ebx
c0100c4f:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100c53:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100c57:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c5a:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100c5d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c60:	c1 f8 08             	sar    $0x8,%eax
c0100c63:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100c66:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c69:	c1 f8 10             	sar    $0x10,%eax
c0100c6c:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100c6f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c72:	c1 f8 18             	sar    $0x18,%eax
c0100c75:	89 c2                	mov    %eax,%edx
c0100c77:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c7a:	c1 e0 04             	shl    $0x4,%eax
c0100c7d:	09 d0                	or     %edx,%eax
c0100c7f:	83 c8 e0             	or     $0xffffffe0,%eax
c0100c82:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100c85:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100c89:	83 ec 0c             	sub    $0xc,%esp
c0100c8c:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100c8f:	50                   	push   %eax
c0100c90:	e8 fc fb ff ff       	call   c0100891 <hd_cmd_out>
c0100c95:	83 c4 10             	add    $0x10,%esp
c0100c98:	e8 29 04 00 00       	call   c01010c6 <interrupt_wait>
c0100c9d:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100ca4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ca7:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100caa:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100cad:	89 c2                	mov    %eax,%edx
c0100caf:	b8 10 00 00 00       	mov    $0x10,%eax
c0100cb4:	83 e8 01             	sub    $0x1,%eax
c0100cb7:	01 d0                	add    %edx,%eax
c0100cb9:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100cbe:	ba 00 00 00 00       	mov    $0x0,%edx
c0100cc3:	f7 f1                	div    %ecx
c0100cc5:	6b c0 10             	imul   $0x10,%eax,%eax
c0100cc8:	29 c4                	sub    %eax,%esp
c0100cca:	89 e0                	mov    %esp,%eax
c0100ccc:	83 c0 00             	add    $0x0,%eax
c0100ccf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100cd2:	83 ec 04             	sub    $0x4,%esp
c0100cd5:	ff 75 f4             	pushl  -0xc(%ebp)
c0100cd8:	6a 00                	push   $0x0
c0100cda:	ff 75 ec             	pushl  -0x14(%ebp)
c0100cdd:	e8 89 b4 00 00       	call   c010c16b <Memset>
c0100ce2:	83 c4 10             	add    $0x10,%esp
c0100ce5:	83 ec 04             	sub    $0x4,%esp
c0100ce8:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ceb:	ff 75 ec             	pushl  -0x14(%ebp)
c0100cee:	68 f0 01 00 00       	push   $0x1f0
c0100cf3:	e8 c7 b4 00 00       	call   c010c1bf <read_port>
c0100cf8:	83 c4 10             	add    $0x10,%esp
c0100cfb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100cfe:	05 be 01 00 00       	add    $0x1be,%eax
c0100d03:	83 ec 04             	sub    $0x4,%esp
c0100d06:	6a 40                	push   $0x40
c0100d08:	50                   	push   %eax
c0100d09:	ff 75 10             	pushl  0x10(%ebp)
c0100d0c:	e8 4b 5f 00 00       	call   c0106c5c <Memcpy>
c0100d11:	83 c4 10             	add    $0x10,%esp
c0100d14:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100d1b:	89 dc                	mov    %ebx,%esp
c0100d1d:	90                   	nop
c0100d1e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100d21:	c9                   	leave  
c0100d22:	c3                   	ret    

c0100d23 <partition>:
c0100d23:	55                   	push   %ebp
c0100d24:	89 e5                	mov    %esp,%ebp
c0100d26:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100d2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d2f:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100d32:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100d36:	7f 19                	jg     c0100d51 <partition+0x2e>
c0100d38:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100d3b:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100d40:	89 c8                	mov    %ecx,%eax
c0100d42:	f7 ea                	imul   %edx
c0100d44:	d1 fa                	sar    %edx
c0100d46:	89 c8                	mov    %ecx,%eax
c0100d48:	c1 f8 1f             	sar    $0x1f,%eax
c0100d4b:	29 c2                	sub    %eax,%edx
c0100d4d:	89 d0                	mov    %edx,%eax
c0100d4f:	eb 11                	jmp    c0100d62 <partition+0x3f>
c0100d51:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d54:	83 e8 10             	sub    $0x10,%eax
c0100d57:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100d5a:	85 c0                	test   %eax,%eax
c0100d5c:	0f 48 c2             	cmovs  %edx,%eax
c0100d5f:	c1 f8 06             	sar    $0x6,%eax
c0100d62:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100d65:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100d69:	0f 85 cc 00 00 00    	jne    c0100e3b <partition+0x118>
c0100d6f:	83 ec 04             	sub    $0x4,%esp
c0100d72:	6a 40                	push   $0x40
c0100d74:	6a 00                	push   $0x0
c0100d76:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100d79:	50                   	push   %eax
c0100d7a:	e8 ec b3 00 00       	call   c010c16b <Memset>
c0100d7f:	83 c4 10             	add    $0x10,%esp
c0100d82:	83 ec 04             	sub    $0x4,%esp
c0100d85:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100d88:	50                   	push   %eax
c0100d89:	6a 00                	push   $0x0
c0100d8b:	ff 75 e8             	pushl  -0x18(%ebp)
c0100d8e:	e8 b1 fe ff ff       	call   c0100c44 <get_partition_table>
c0100d93:	83 c4 10             	add    $0x10,%esp
c0100d96:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100d9d:	e9 8a 00 00 00       	jmp    c0100e2c <partition+0x109>
c0100da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100da5:	83 c0 01             	add    $0x1,%eax
c0100da8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100dab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100dae:	c1 e0 04             	shl    $0x4,%eax
c0100db1:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100db4:	01 c8                	add    %ecx,%eax
c0100db6:	83 e8 5c             	sub    $0x5c,%eax
c0100db9:	8b 00                	mov    (%eax),%eax
c0100dbb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100dbe:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100dc1:	c1 e1 03             	shl    $0x3,%ecx
c0100dc4:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100dca:	01 ca                	add    %ecx,%edx
c0100dcc:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100dd2:	89 02                	mov    %eax,(%edx)
c0100dd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100dd7:	c1 e0 04             	shl    $0x4,%eax
c0100dda:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ddd:	01 c8                	add    %ecx,%eax
c0100ddf:	83 e8 58             	sub    $0x58,%eax
c0100de2:	8b 00                	mov    (%eax),%eax
c0100de4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100de7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100dea:	c1 e1 03             	shl    $0x3,%ecx
c0100ded:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100df3:	01 ca                	add    %ecx,%edx
c0100df5:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100dfb:	89 02                	mov    %eax,(%edx)
c0100dfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e00:	c1 e0 04             	shl    $0x4,%eax
c0100e03:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e06:	01 c8                	add    %ecx,%eax
c0100e08:	83 e8 60             	sub    $0x60,%eax
c0100e0b:	0f b6 00             	movzbl (%eax),%eax
c0100e0e:	3c 05                	cmp    $0x5,%al
c0100e10:	75 16                	jne    c0100e28 <partition+0x105>
c0100e12:	8b 55 08             	mov    0x8(%ebp),%edx
c0100e15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100e18:	01 d0                	add    %edx,%eax
c0100e1a:	83 ec 08             	sub    $0x8,%esp
c0100e1d:	6a 01                	push   $0x1
c0100e1f:	50                   	push   %eax
c0100e20:	e8 fe fe ff ff       	call   c0100d23 <partition>
c0100e25:	83 c4 10             	add    $0x10,%esp
c0100e28:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100e2c:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100e30:	0f 8e 6c ff ff ff    	jle    c0100da2 <partition+0x7f>
c0100e36:	e9 ff 00 00 00       	jmp    c0100f3a <partition+0x217>
c0100e3b:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100e3f:	0f 85 f5 00 00 00    	jne    c0100f3a <partition+0x217>
c0100e45:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100e48:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100e4d:	89 c8                	mov    %ecx,%eax
c0100e4f:	f7 ea                	imul   %edx
c0100e51:	d1 fa                	sar    %edx
c0100e53:	89 c8                	mov    %ecx,%eax
c0100e55:	c1 f8 1f             	sar    $0x1f,%eax
c0100e58:	29 c2                	sub    %eax,%edx
c0100e5a:	89 d0                	mov    %edx,%eax
c0100e5c:	c1 e0 02             	shl    $0x2,%eax
c0100e5f:	01 d0                	add    %edx,%eax
c0100e61:	29 c1                	sub    %eax,%ecx
c0100e63:	89 c8                	mov    %ecx,%eax
c0100e65:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100e68:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100e6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e6e:	c1 e2 03             	shl    $0x3,%edx
c0100e71:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100e77:	01 d0                	add    %edx,%eax
c0100e79:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100e7e:	8b 00                	mov    (%eax),%eax
c0100e80:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100e83:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100e86:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100e89:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100e8c:	83 e8 01             	sub    $0x1,%eax
c0100e8f:	c1 e0 04             	shl    $0x4,%eax
c0100e92:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100e95:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100e9c:	e9 8c 00 00 00       	jmp    c0100f2d <partition+0x20a>
c0100ea1:	83 ec 04             	sub    $0x4,%esp
c0100ea4:	6a 40                	push   $0x40
c0100ea6:	6a 00                	push   $0x0
c0100ea8:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100eab:	50                   	push   %eax
c0100eac:	e8 ba b2 00 00       	call   c010c16b <Memset>
c0100eb1:	83 c4 10             	add    $0x10,%esp
c0100eb4:	83 ec 04             	sub    $0x4,%esp
c0100eb7:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100eba:	50                   	push   %eax
c0100ebb:	ff 75 f0             	pushl  -0x10(%ebp)
c0100ebe:	ff 75 e8             	pushl  -0x18(%ebp)
c0100ec1:	e8 7e fd ff ff       	call   c0100c44 <get_partition_table>
c0100ec6:	83 c4 10             	add    $0x10,%esp
c0100ec9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100ecc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ecf:	01 d0                	add    %edx,%eax
c0100ed1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100ed4:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100ed7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100eda:	01 c2                	add    %eax,%edx
c0100edc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100edf:	8d 48 04             	lea    0x4(%eax),%ecx
c0100ee2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100ee5:	c1 e1 03             	shl    $0x3,%ecx
c0100ee8:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100eee:	01 c8                	add    %ecx,%eax
c0100ef0:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100ef5:	89 10                	mov    %edx,(%eax)
c0100ef7:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100efa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100efd:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100f00:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100f03:	c1 e1 03             	shl    $0x3,%ecx
c0100f06:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100f0c:	01 ca                	add    %ecx,%edx
c0100f0e:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100f14:	89 02                	mov    %eax,(%edx)
c0100f16:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100f1a:	84 c0                	test   %al,%al
c0100f1c:	74 1b                	je     c0100f39 <partition+0x216>
c0100f1e:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100f21:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f24:	01 d0                	add    %edx,%eax
c0100f26:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f29:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100f2d:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100f31:	0f 8e 6a ff ff ff    	jle    c0100ea1 <partition+0x17e>
c0100f37:	eb 01                	jmp    c0100f3a <partition+0x217>
c0100f39:	90                   	nop
c0100f3a:	90                   	nop
c0100f3b:	c9                   	leave  
c0100f3c:	c3                   	ret    

c0100f3d <hd_open>:
c0100f3d:	55                   	push   %ebp
c0100f3e:	89 e5                	mov    %esp,%ebp
c0100f40:	83 ec 18             	sub    $0x18,%esp
c0100f43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100f4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f4d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f53:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100f58:	8b 00                	mov    (%eax),%eax
c0100f5a:	8d 50 01             	lea    0x1(%eax),%edx
c0100f5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f60:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f66:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100f6b:	89 10                	mov    %edx,(%eax)
c0100f6d:	83 ec 0c             	sub    $0xc,%esp
c0100f70:	6a 00                	push   $0x0
c0100f72:	e8 1c fa ff ff       	call   c0100993 <hd_identify>
c0100f77:	83 c4 10             	add    $0x10,%esp
c0100f7a:	83 ec 08             	sub    $0x8,%esp
c0100f7d:	6a 00                	push   $0x0
c0100f7f:	6a 00                	push   $0x0
c0100f81:	e8 9d fd ff ff       	call   c0100d23 <partition>
c0100f86:	83 c4 10             	add    $0x10,%esp
c0100f89:	83 ec 0c             	sub    $0xc,%esp
c0100f8c:	6a 7c                	push   $0x7c
c0100f8e:	e8 19 06 00 00       	call   c01015ac <sys_malloc>
c0100f93:	83 c4 10             	add    $0x10,%esp
c0100f96:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f99:	83 ec 04             	sub    $0x4,%esp
c0100f9c:	6a 7c                	push   $0x7c
c0100f9e:	6a 00                	push   $0x0
c0100fa0:	ff 75 f0             	pushl  -0x10(%ebp)
c0100fa3:	e8 c3 b1 00 00       	call   c010c16b <Memset>
c0100fa8:	83 c4 10             	add    $0x10,%esp
c0100fab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100fae:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100fb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100fb8:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100fbf:	83 ec 04             	sub    $0x4,%esp
c0100fc2:	6a 02                	push   $0x2
c0100fc4:	ff 75 f0             	pushl  -0x10(%ebp)
c0100fc7:	6a 01                	push   $0x1
c0100fc9:	e8 ea 84 00 00       	call   c01094b8 <send_rec>
c0100fce:	83 c4 10             	add    $0x10,%esp
c0100fd1:	83 ec 08             	sub    $0x8,%esp
c0100fd4:	6a 7c                	push   $0x7c
c0100fd6:	ff 75 f0             	pushl  -0x10(%ebp)
c0100fd9:	e8 e3 05 00 00       	call   c01015c1 <sys_free>
c0100fde:	83 c4 10             	add    $0x10,%esp
c0100fe1:	90                   	nop
c0100fe2:	c9                   	leave  
c0100fe3:	c3                   	ret    

c0100fe4 <get_hd_ioctl>:
c0100fe4:	55                   	push   %ebp
c0100fe5:	89 e5                	mov    %esp,%ebp
c0100fe7:	83 ec 18             	sub    $0x18,%esp
c0100fea:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100fee:	7f 19                	jg     c0101009 <get_hd_ioctl+0x25>
c0100ff0:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100ff3:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100ff8:	89 c8                	mov    %ecx,%eax
c0100ffa:	f7 ea                	imul   %edx
c0100ffc:	d1 fa                	sar    %edx
c0100ffe:	89 c8                	mov    %ecx,%eax
c0101000:	c1 f8 1f             	sar    $0x1f,%eax
c0101003:	29 c2                	sub    %eax,%edx
c0101005:	89 d0                	mov    %edx,%eax
c0101007:	eb 11                	jmp    c010101a <get_hd_ioctl+0x36>
c0101009:	8b 45 08             	mov    0x8(%ebp),%eax
c010100c:	83 e8 10             	sub    $0x10,%eax
c010100f:	8d 50 3f             	lea    0x3f(%eax),%edx
c0101012:	85 c0                	test   %eax,%eax
c0101014:	0f 48 c2             	cmovs  %edx,%eax
c0101017:	c1 f8 06             	sar    $0x6,%eax
c010101a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010101d:	8b 55 08             	mov    0x8(%ebp),%edx
c0101020:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101023:	c1 e2 03             	shl    $0x3,%edx
c0101026:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010102c:	01 d0                	add    %edx,%eax
c010102e:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c0101033:	8b 00                	mov    (%eax),%eax
c0101035:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101038:	83 ec 0c             	sub    $0xc,%esp
c010103b:	6a 7c                	push   $0x7c
c010103d:	e8 6a 05 00 00       	call   c01015ac <sys_malloc>
c0101042:	83 c4 10             	add    $0x10,%esp
c0101045:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101048:	83 ec 04             	sub    $0x4,%esp
c010104b:	6a 7c                	push   $0x7c
c010104d:	6a 00                	push   $0x0
c010104f:	ff 75 ec             	pushl  -0x14(%ebp)
c0101052:	e8 14 b1 00 00       	call   c010c16b <Memset>
c0101057:	83 c4 10             	add    $0x10,%esp
c010105a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010105d:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101064:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101067:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010106e:	83 ec 04             	sub    $0x4,%esp
c0101071:	6a 02                	push   $0x2
c0101073:	ff 75 ec             	pushl  -0x14(%ebp)
c0101076:	6a 01                	push   $0x1
c0101078:	e8 3b 84 00 00       	call   c01094b8 <send_rec>
c010107d:	83 c4 10             	add    $0x10,%esp
c0101080:	83 ec 08             	sub    $0x8,%esp
c0101083:	6a 7c                	push   $0x7c
c0101085:	ff 75 ec             	pushl  -0x14(%ebp)
c0101088:	e8 34 05 00 00       	call   c01015c1 <sys_free>
c010108d:	83 c4 10             	add    $0x10,%esp
c0101090:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101093:	c9                   	leave  
c0101094:	c3                   	ret    

c0101095 <wait_for>:
c0101095:	55                   	push   %ebp
c0101096:	89 e5                	mov    %esp,%ebp
c0101098:	83 ec 08             	sub    $0x8,%esp
c010109b:	83 ec 04             	sub    $0x4,%esp
c010109e:	68 50 c3 00 00       	push   $0xc350
c01010a3:	6a 08                	push   $0x8
c01010a5:	6a 08                	push   $0x8
c01010a7:	e8 51 03 00 00       	call   c01013fd <waitfor>
c01010ac:	83 c4 10             	add    $0x10,%esp
c01010af:	85 c0                	test   %eax,%eax
c01010b1:	75 10                	jne    c01010c3 <wait_for+0x2e>
c01010b3:	83 ec 0c             	sub    $0xc,%esp
c01010b6:	68 a4 b1 10 c0       	push   $0xc010b1a4
c01010bb:	e8 6a 77 00 00       	call   c010882a <panic>
c01010c0:	83 c4 10             	add    $0x10,%esp
c01010c3:	90                   	nop
c01010c4:	c9                   	leave  
c01010c5:	c3                   	ret    

c01010c6 <interrupt_wait>:
c01010c6:	55                   	push   %ebp
c01010c7:	89 e5                	mov    %esp,%ebp
c01010c9:	83 ec 18             	sub    $0x18,%esp
c01010cc:	83 ec 0c             	sub    $0xc,%esp
c01010cf:	6a 7c                	push   $0x7c
c01010d1:	e8 d6 04 00 00       	call   c01015ac <sys_malloc>
c01010d6:	83 c4 10             	add    $0x10,%esp
c01010d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010dc:	83 ec 04             	sub    $0x4,%esp
c01010df:	6a 7c                	push   $0x7c
c01010e1:	6a 00                	push   $0x0
c01010e3:	ff 75 f4             	pushl  -0xc(%ebp)
c01010e6:	e8 80 b0 00 00       	call   c010c16b <Memset>
c01010eb:	83 c4 10             	add    $0x10,%esp
c01010ee:	83 ec 04             	sub    $0x4,%esp
c01010f1:	68 13 02 00 00       	push   $0x213
c01010f6:	ff 75 f4             	pushl  -0xc(%ebp)
c01010f9:	6a 02                	push   $0x2
c01010fb:	e8 b8 83 00 00       	call   c01094b8 <send_rec>
c0101100:	83 c4 10             	add    $0x10,%esp
c0101103:	83 ec 08             	sub    $0x8,%esp
c0101106:	6a 7c                	push   $0x7c
c0101108:	ff 75 f4             	pushl  -0xc(%ebp)
c010110b:	e8 b1 04 00 00       	call   c01015c1 <sys_free>
c0101110:	83 c4 10             	add    $0x10,%esp
c0101113:	90                   	nop
c0101114:	c9                   	leave  
c0101115:	c3                   	ret    

c0101116 <hd_rdwt>:
c0101116:	55                   	push   %ebp
c0101117:	89 e5                	mov    %esp,%ebp
c0101119:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c010111f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101122:	8b 40 18             	mov    0x18(%eax),%eax
c0101125:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101128:	8b 45 08             	mov    0x8(%ebp),%eax
c010112b:	8b 40 14             	mov    0x14(%eax),%eax
c010112e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101131:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0101135:	7f 19                	jg     c0101150 <hd_rdwt+0x3a>
c0101137:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c010113a:	ba 67 66 66 66       	mov    $0x66666667,%edx
c010113f:	89 c8                	mov    %ecx,%eax
c0101141:	f7 ea                	imul   %edx
c0101143:	d1 fa                	sar    %edx
c0101145:	89 c8                	mov    %ecx,%eax
c0101147:	c1 f8 1f             	sar    $0x1f,%eax
c010114a:	29 c2                	sub    %eax,%edx
c010114c:	89 d0                	mov    %edx,%eax
c010114e:	eb 11                	jmp    c0101161 <hd_rdwt+0x4b>
c0101150:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101153:	83 e8 10             	sub    $0x10,%eax
c0101156:	8d 50 3f             	lea    0x3f(%eax),%edx
c0101159:	85 c0                	test   %eax,%eax
c010115b:	0f 48 c2             	cmovs  %edx,%eax
c010115e:	c1 f8 06             	sar    $0x6,%eax
c0101161:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101164:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101167:	8d 50 f0             	lea    -0x10(%eax),%edx
c010116a:	89 d0                	mov    %edx,%eax
c010116c:	c1 f8 1f             	sar    $0x1f,%eax
c010116f:	c1 e8 1a             	shr    $0x1a,%eax
c0101172:	01 c2                	add    %eax,%edx
c0101174:	83 e2 3f             	and    $0x3f,%edx
c0101177:	29 c2                	sub    %eax,%edx
c0101179:	89 d0                	mov    %edx,%eax
c010117b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010117e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101181:	c1 e8 09             	shr    $0x9,%eax
c0101184:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101187:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c010118b:	7f 1a                	jg     c01011a7 <hd_rdwt+0x91>
c010118d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101190:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101193:	c1 e2 03             	shl    $0x3,%edx
c0101196:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010119c:	01 d0                	add    %edx,%eax
c010119e:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c01011a3:	8b 00                	mov    (%eax),%eax
c01011a5:	eb 1b                	jmp    c01011c2 <hd_rdwt+0xac>
c01011a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01011aa:	8d 50 04             	lea    0x4(%eax),%edx
c01011ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01011b0:	c1 e2 03             	shl    $0x3,%edx
c01011b3:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01011b9:	01 d0                	add    %edx,%eax
c01011bb:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c01011c0:	8b 00                	mov    (%eax),%eax
c01011c2:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01011c5:	01 d0                	add    %edx,%eax
c01011c7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01011ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01011cd:	8b 40 0c             	mov    0xc(%eax),%eax
c01011d0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01011d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01011d6:	05 ff 01 00 00       	add    $0x1ff,%eax
c01011db:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01011e1:	85 c0                	test   %eax,%eax
c01011e3:	0f 48 c2             	cmovs  %edx,%eax
c01011e6:	c1 f8 09             	sar    $0x9,%eax
c01011e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01011ec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01011ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01011f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01011f5:	8b 40 10             	mov    0x10(%eax),%eax
c01011f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01011fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01011fe:	8b 00                	mov    (%eax),%eax
c0101200:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101203:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101206:	83 ec 08             	sub    $0x8,%esp
c0101209:	50                   	push   %eax
c010120a:	ff 75 d0             	pushl  -0x30(%ebp)
c010120d:	e8 dd 4b 00 00       	call   c0105def <alloc_virtual_memory>
c0101212:	83 c4 10             	add    $0x10,%esp
c0101215:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101218:	8b 45 08             	mov    0x8(%ebp),%eax
c010121b:	8b 40 78             	mov    0x78(%eax),%eax
c010121e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101221:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101225:	74 22                	je     c0101249 <hd_rdwt+0x133>
c0101227:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c010122b:	74 1c                	je     c0101249 <hd_rdwt+0x133>
c010122d:	68 b7 01 00 00       	push   $0x1b7
c0101232:	68 f4 b0 10 c0       	push   $0xc010b0f4
c0101237:	68 f4 b0 10 c0       	push   $0xc010b0f4
c010123c:	68 b6 b1 10 c0       	push   $0xc010b1b6
c0101241:	e8 02 76 00 00       	call   c0108848 <assertion_failure>
c0101246:	83 c4 10             	add    $0x10,%esp
c0101249:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c010124d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0101250:	88 45 be             	mov    %al,-0x42(%ebp)
c0101253:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101256:	88 45 bf             	mov    %al,-0x41(%ebp)
c0101259:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010125c:	c1 f8 08             	sar    $0x8,%eax
c010125f:	88 45 c0             	mov    %al,-0x40(%ebp)
c0101262:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101265:	c1 f8 10             	sar    $0x10,%eax
c0101268:	88 45 c1             	mov    %al,-0x3f(%ebp)
c010126b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010126e:	c1 f8 18             	sar    $0x18,%eax
c0101271:	83 e0 0f             	and    $0xf,%eax
c0101274:	83 c8 e0             	or     $0xffffffe0,%eax
c0101277:	88 45 c2             	mov    %al,-0x3e(%ebp)
c010127a:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c010127e:	75 07                	jne    c0101287 <hd_rdwt+0x171>
c0101280:	b8 20 00 00 00       	mov    $0x20,%eax
c0101285:	eb 05                	jmp    c010128c <hd_rdwt+0x176>
c0101287:	b8 30 00 00 00       	mov    $0x30,%eax
c010128c:	88 45 c3             	mov    %al,-0x3d(%ebp)
c010128f:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101293:	3c 20                	cmp    $0x20,%al
c0101295:	74 24                	je     c01012bb <hd_rdwt+0x1a5>
c0101297:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010129b:	3c 30                	cmp    $0x30,%al
c010129d:	74 1c                	je     c01012bb <hd_rdwt+0x1a5>
c010129f:	68 c5 01 00 00       	push   $0x1c5
c01012a4:	68 f4 b0 10 c0       	push   $0xc010b0f4
c01012a9:	68 f4 b0 10 c0       	push   $0xc010b0f4
c01012ae:	68 d4 b1 10 c0       	push   $0xc010b1d4
c01012b3:	e8 90 75 00 00       	call   c0108848 <assertion_failure>
c01012b8:	83 c4 10             	add    $0x10,%esp
c01012bb:	83 ec 0c             	sub    $0xc,%esp
c01012be:	8d 45 bd             	lea    -0x43(%ebp),%eax
c01012c1:	50                   	push   %eax
c01012c2:	e8 ca f5 ff ff       	call   c0100891 <hd_cmd_out>
c01012c7:	83 c4 10             	add    $0x10,%esp
c01012ca:	e9 9c 00 00 00       	jmp    c010136b <hd_rdwt+0x255>
c01012cf:	b8 00 02 00 00       	mov    $0x200,%eax
c01012d4:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c01012db:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c01012df:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01012e2:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01012e6:	75 51                	jne    c0101339 <hd_rdwt+0x223>
c01012e8:	e8 a8 fd ff ff       	call   c0101095 <wait_for>
c01012ed:	e8 d4 fd ff ff       	call   c01010c6 <interrupt_wait>
c01012f2:	83 ec 04             	sub    $0x4,%esp
c01012f5:	ff 75 c4             	pushl  -0x3c(%ebp)
c01012f8:	6a 00                	push   $0x0
c01012fa:	68 80 11 11 c0       	push   $0xc0111180
c01012ff:	e8 67 ae 00 00       	call   c010c16b <Memset>
c0101304:	83 c4 10             	add    $0x10,%esp
c0101307:	83 ec 04             	sub    $0x4,%esp
c010130a:	68 00 02 00 00       	push   $0x200
c010130f:	68 80 11 11 c0       	push   $0xc0111180
c0101314:	68 f0 01 00 00       	push   $0x1f0
c0101319:	e8 a1 ae 00 00       	call   c010c1bf <read_port>
c010131e:	83 c4 10             	add    $0x10,%esp
c0101321:	83 ec 04             	sub    $0x4,%esp
c0101324:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101327:	68 80 11 11 c0       	push   $0xc0111180
c010132c:	ff 75 f0             	pushl  -0x10(%ebp)
c010132f:	e8 28 59 00 00       	call   c0106c5c <Memcpy>
c0101334:	83 c4 10             	add    $0x10,%esp
c0101337:	eb 26                	jmp    c010135f <hd_rdwt+0x249>
c0101339:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c010133d:	75 20                	jne    c010135f <hd_rdwt+0x249>
c010133f:	e8 51 fd ff ff       	call   c0101095 <wait_for>
c0101344:	83 ec 04             	sub    $0x4,%esp
c0101347:	ff 75 c4             	pushl  -0x3c(%ebp)
c010134a:	ff 75 f0             	pushl  -0x10(%ebp)
c010134d:	68 f0 01 00 00       	push   $0x1f0
c0101352:	e8 7c ae 00 00       	call   c010c1d3 <write_port>
c0101357:	83 c4 10             	add    $0x10,%esp
c010135a:	e8 67 fd ff ff       	call   c01010c6 <interrupt_wait>
c010135f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101362:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101365:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101368:	01 45 f0             	add    %eax,-0x10(%ebp)
c010136b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010136f:	0f 85 5a ff ff ff    	jne    c01012cf <hd_rdwt+0x1b9>
c0101375:	83 ec 04             	sub    $0x4,%esp
c0101378:	6a 7c                	push   $0x7c
c010137a:	6a 00                	push   $0x0
c010137c:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101382:	50                   	push   %eax
c0101383:	e8 e3 ad 00 00       	call   c010c16b <Memset>
c0101388:	83 c4 10             	add    $0x10,%esp
c010138b:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0101392:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101399:	00 00 00 
c010139c:	83 ec 04             	sub    $0x4,%esp
c010139f:	6a 02                	push   $0x2
c01013a1:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c01013a7:	50                   	push   %eax
c01013a8:	6a 01                	push   $0x1
c01013aa:	e8 09 81 00 00       	call   c01094b8 <send_rec>
c01013af:	83 c4 10             	add    $0x10,%esp
c01013b2:	90                   	nop
c01013b3:	c9                   	leave  
c01013b4:	c3                   	ret    

c01013b5 <hd_handler>:
c01013b5:	55                   	push   %ebp
c01013b6:	89 e5                	mov    %esp,%ebp
c01013b8:	83 ec 18             	sub    $0x18,%esp
c01013bb:	83 ec 0c             	sub    $0xc,%esp
c01013be:	68 f7 01 00 00       	push   $0x1f7
c01013c3:	e8 17 ef ff ff       	call   c01002df <in_byte>
c01013c8:	83 c4 10             	add    $0x10,%esp
c01013cb:	0f b6 c0             	movzbl %al,%eax
c01013ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01013d1:	83 ec 0c             	sub    $0xc,%esp
c01013d4:	6a 03                	push   $0x3
c01013d6:	e8 77 83 00 00       	call   c0109752 <inform_int>
c01013db:	83 c4 10             	add    $0x10,%esp
c01013de:	90                   	nop
c01013df:	c9                   	leave  
c01013e0:	c3                   	ret    

c01013e1 <net_handler>:
c01013e1:	55                   	push   %ebp
c01013e2:	89 e5                	mov    %esp,%ebp
c01013e4:	83 ec 08             	sub    $0x8,%esp
c01013e7:	83 ec 0c             	sub    $0xc,%esp
c01013ea:	68 08 b2 10 c0       	push   $0xc010b208
c01013ef:	e8 f7 70 00 00       	call   c01084eb <Printf>
c01013f4:	83 c4 10             	add    $0x10,%esp
c01013f7:	66 87 db             	xchg   %bx,%bx
c01013fa:	90                   	nop
c01013fb:	c9                   	leave  
c01013fc:	c3                   	ret    

c01013fd <waitfor>:
c01013fd:	55                   	push   %ebp
c01013fe:	89 e5                	mov    %esp,%ebp
c0101400:	83 ec 18             	sub    $0x18,%esp
c0101403:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010140a:	eb 26                	jmp    c0101432 <waitfor+0x35>
c010140c:	83 ec 0c             	sub    $0xc,%esp
c010140f:	68 f7 01 00 00       	push   $0x1f7
c0101414:	e8 c6 ee ff ff       	call   c01002df <in_byte>
c0101419:	83 c4 10             	add    $0x10,%esp
c010141c:	0f b6 c0             	movzbl %al,%eax
c010141f:	23 45 08             	and    0x8(%ebp),%eax
c0101422:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0101425:	75 07                	jne    c010142e <waitfor+0x31>
c0101427:	b8 01 00 00 00       	mov    $0x1,%eax
c010142c:	eb 11                	jmp    c010143f <waitfor+0x42>
c010142e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101432:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101435:	3b 45 10             	cmp    0x10(%ebp),%eax
c0101438:	7c d2                	jl     c010140c <waitfor+0xf>
c010143a:	b8 00 00 00 00       	mov    $0x0,%eax
c010143f:	c9                   	leave  
c0101440:	c3                   	ret    

c0101441 <print_hd_info>:
c0101441:	55                   	push   %ebp
c0101442:	89 e5                	mov    %esp,%ebp
c0101444:	83 ec 18             	sub    $0x18,%esp
c0101447:	83 ec 0c             	sub    $0xc,%esp
c010144a:	68 2a b2 10 c0       	push   $0xc010b22a
c010144f:	e8 97 70 00 00       	call   c01084eb <Printf>
c0101454:	83 c4 10             	add    $0x10,%esp
c0101457:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010145e:	eb 3b                	jmp    c010149b <print_hd_info+0x5a>
c0101460:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101463:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c010146a:	85 c0                	test   %eax,%eax
c010146c:	74 28                	je     c0101496 <print_hd_info+0x55>
c010146e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101471:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101478:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010147b:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101482:	ff 75 f4             	pushl  -0xc(%ebp)
c0101485:	52                   	push   %edx
c0101486:	50                   	push   %eax
c0101487:	68 47 b2 10 c0       	push   $0xc010b247
c010148c:	e8 5a 70 00 00       	call   c01084eb <Printf>
c0101491:	83 c4 10             	add    $0x10,%esp
c0101494:	eb 01                	jmp    c0101497 <print_hd_info+0x56>
c0101496:	90                   	nop
c0101497:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010149b:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c010149f:	7e bf                	jle    c0101460 <print_hd_info+0x1f>
c01014a1:	83 ec 0c             	sub    $0xc,%esp
c01014a4:	68 5f b2 10 c0       	push   $0xc010b25f
c01014a9:	e8 3d 70 00 00       	call   c01084eb <Printf>
c01014ae:	83 c4 10             	add    $0x10,%esp
c01014b1:	83 ec 0c             	sub    $0xc,%esp
c01014b4:	68 7a b2 10 c0       	push   $0xc010b27a
c01014b9:	e8 2d 70 00 00       	call   c01084eb <Printf>
c01014be:	83 c4 10             	add    $0x10,%esp
c01014c1:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c01014c8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01014cf:	eb 44                	jmp    c0101515 <print_hd_info+0xd4>
c01014d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01014d4:	83 c0 04             	add    $0x4,%eax
c01014d7:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01014de:	85 c0                	test   %eax,%eax
c01014e0:	74 2e                	je     c0101510 <print_hd_info+0xcf>
c01014e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01014e5:	83 c0 04             	add    $0x4,%eax
c01014e8:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01014ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01014f2:	83 c0 04             	add    $0x4,%eax
c01014f5:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01014fc:	ff 75 f0             	pushl  -0x10(%ebp)
c01014ff:	52                   	push   %edx
c0101500:	50                   	push   %eax
c0101501:	68 47 b2 10 c0       	push   $0xc010b247
c0101506:	e8 e0 6f 00 00       	call   c01084eb <Printf>
c010150b:	83 c4 10             	add    $0x10,%esp
c010150e:	eb 01                	jmp    c0101511 <print_hd_info+0xd0>
c0101510:	90                   	nop
c0101511:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101515:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101519:	7e b6                	jle    c01014d1 <print_hd_info+0x90>
c010151b:	83 ec 0c             	sub    $0xc,%esp
c010151e:	68 97 b2 10 c0       	push   $0xc010b297
c0101523:	e8 c3 6f 00 00       	call   c01084eb <Printf>
c0101528:	83 c4 10             	add    $0x10,%esp
c010152b:	90                   	nop
c010152c:	c9                   	leave  
c010152d:	c3                   	ret    

c010152e <is_empty>:
c010152e:	55                   	push   %ebp
c010152f:	89 e5                	mov    %esp,%ebp
c0101531:	83 ec 10             	sub    $0x10,%esp
c0101534:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010153b:	eb 1a                	jmp    c0101557 <is_empty+0x29>
c010153d:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0101540:	8b 45 08             	mov    0x8(%ebp),%eax
c0101543:	01 d0                	add    %edx,%eax
c0101545:	0f b6 00             	movzbl (%eax),%eax
c0101548:	84 c0                	test   %al,%al
c010154a:	74 07                	je     c0101553 <is_empty+0x25>
c010154c:	b8 00 00 00 00       	mov    $0x0,%eax
c0101551:	eb 11                	jmp    c0101564 <is_empty+0x36>
c0101553:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0101557:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010155a:	3b 45 0c             	cmp    0xc(%ebp),%eax
c010155d:	7c de                	jl     c010153d <is_empty+0xf>
c010155f:	b8 01 00 00 00       	mov    $0x1,%eax
c0101564:	c9                   	leave  
c0101565:	c3                   	ret    
c0101566:	66 90                	xchg   %ax,%ax
c0101568:	66 90                	xchg   %ax,%ax
c010156a:	66 90                	xchg   %ax,%ax
c010156c:	66 90                	xchg   %ax,%ax
c010156e:	66 90                	xchg   %ax,%ax

c0101570 <write_debug>:
c0101570:	b8 02 00 00 00       	mov    $0x2,%eax
c0101575:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101579:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010157d:	cd 90                	int    $0x90
c010157f:	c3                   	ret    

c0101580 <send_msg>:
c0101580:	55                   	push   %ebp
c0101581:	89 e5                	mov    %esp,%ebp
c0101583:	53                   	push   %ebx
c0101584:	51                   	push   %ecx
c0101585:	b8 03 00 00 00       	mov    $0x3,%eax
c010158a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010158d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101590:	cd 90                	int    $0x90
c0101592:	59                   	pop    %ecx
c0101593:	5b                   	pop    %ebx
c0101594:	5d                   	pop    %ebp
c0101595:	c3                   	ret    

c0101596 <receive_msg>:
c0101596:	55                   	push   %ebp
c0101597:	89 e5                	mov    %esp,%ebp
c0101599:	53                   	push   %ebx
c010159a:	51                   	push   %ecx
c010159b:	b8 04 00 00 00       	mov    $0x4,%eax
c01015a0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01015a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01015a6:	cd 90                	int    $0x90
c01015a8:	59                   	pop    %ecx
c01015a9:	5b                   	pop    %ebx
c01015aa:	5d                   	pop    %ebp
c01015ab:	c3                   	ret    

c01015ac <sys_malloc>:
c01015ac:	56                   	push   %esi
c01015ad:	57                   	push   %edi
c01015ae:	53                   	push   %ebx
c01015af:	55                   	push   %ebp
c01015b0:	89 e5                	mov    %esp,%ebp
c01015b2:	b8 05 00 00 00       	mov    $0x5,%eax
c01015b7:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01015ba:	cd 90                	int    $0x90
c01015bc:	5d                   	pop    %ebp
c01015bd:	5b                   	pop    %ebx
c01015be:	5f                   	pop    %edi
c01015bf:	5e                   	pop    %esi
c01015c0:	c3                   	ret    

c01015c1 <sys_free>:
c01015c1:	56                   	push   %esi
c01015c2:	57                   	push   %edi
c01015c3:	53                   	push   %ebx
c01015c4:	55                   	push   %ebp
c01015c5:	89 e5                	mov    %esp,%ebp
c01015c7:	b8 06 00 00 00       	mov    $0x6,%eax
c01015cc:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01015cf:	8b 5d 18             	mov    0x18(%ebp),%ebx
c01015d2:	cd 90                	int    $0x90
c01015d4:	5d                   	pop    %ebp
c01015d5:	5b                   	pop    %ebx
c01015d6:	5f                   	pop    %edi
c01015d7:	5e                   	pop    %esi
c01015d8:	c3                   	ret    

c01015d9 <task_fs>:
c01015d9:	55                   	push   %ebp
c01015da:	89 e5                	mov    %esp,%ebp
c01015dc:	83 ec 28             	sub    $0x28,%esp
c01015df:	e8 bb 08 00 00       	call   c0101e9f <init_fs>
c01015e4:	83 ec 0c             	sub    $0xc,%esp
c01015e7:	6a 7c                	push   $0x7c
c01015e9:	e8 be ff ff ff       	call   c01015ac <sys_malloc>
c01015ee:	83 c4 10             	add    $0x10,%esp
c01015f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01015f4:	83 ec 0c             	sub    $0xc,%esp
c01015f7:	6a 7c                	push   $0x7c
c01015f9:	e8 ae ff ff ff       	call   c01015ac <sys_malloc>
c01015fe:	83 c4 10             	add    $0x10,%esp
c0101601:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101604:	83 ec 04             	sub    $0x4,%esp
c0101607:	6a 7c                	push   $0x7c
c0101609:	6a 00                	push   $0x0
c010160b:	ff 75 f4             	pushl  -0xc(%ebp)
c010160e:	e8 58 ab 00 00       	call   c010c16b <Memset>
c0101613:	83 c4 10             	add    $0x10,%esp
c0101616:	83 ec 04             	sub    $0x4,%esp
c0101619:	6a 12                	push   $0x12
c010161b:	ff 75 f4             	pushl  -0xc(%ebp)
c010161e:	6a 02                	push   $0x2
c0101620:	e8 93 7e 00 00       	call   c01094b8 <send_rec>
c0101625:	83 c4 10             	add    $0x10,%esp
c0101628:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010162b:	8b 40 78             	mov    0x78(%eax),%eax
c010162e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101631:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101634:	8b 00                	mov    (%eax),%eax
c0101636:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101639:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010163c:	8b 40 50             	mov    0x50(%eax),%eax
c010163f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101642:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101645:	8b 40 68             	mov    0x68(%eax),%eax
c0101648:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010164b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010164e:	8b 00                	mov    (%eax),%eax
c0101650:	85 c0                	test   %eax,%eax
c0101652:	75 07                	jne    c010165b <task_fs+0x82>
c0101654:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010165b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101662:	83 ec 0c             	sub    $0xc,%esp
c0101665:	ff 75 e8             	pushl  -0x18(%ebp)
c0101668:	e8 39 21 00 00       	call   c01037a6 <pid2proc>
c010166d:	83 c4 10             	add    $0x10,%esp
c0101670:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101675:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101679:	74 37                	je     c01016b2 <task_fs+0xd9>
c010167b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010167f:	74 31                	je     c01016b2 <task_fs+0xd9>
c0101681:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101685:	74 2b                	je     c01016b2 <task_fs+0xd9>
c0101687:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010168b:	74 25                	je     c01016b2 <task_fs+0xd9>
c010168d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101691:	74 1f                	je     c01016b2 <task_fs+0xd9>
c0101693:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101697:	74 19                	je     c01016b2 <task_fs+0xd9>
c0101699:	6a 7a                	push   $0x7a
c010169b:	68 b8 b2 10 c0       	push   $0xc010b2b8
c01016a0:	68 b8 b2 10 c0       	push   $0xc010b2b8
c01016a5:	68 c8 b2 10 c0       	push   $0xc010b2c8
c01016aa:	e8 99 71 00 00       	call   c0108848 <assertion_failure>
c01016af:	83 c4 10             	add    $0x10,%esp
c01016b2:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01016b6:	74 3a                	je     c01016f2 <task_fs+0x119>
c01016b8:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01016bc:	7f 19                	jg     c01016d7 <task_fs+0xfe>
c01016be:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01016c2:	0f 84 10 01 00 00    	je     c01017d8 <task_fs+0x1ff>
c01016c8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01016cc:	0f 84 a1 00 00 00    	je     c0101773 <task_fs+0x19a>
c01016d2:	e9 ef 00 00 00       	jmp    c01017c6 <task_fs+0x1ed>
c01016d7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01016db:	74 50                	je     c010172d <task_fs+0x154>
c01016dd:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01016e1:	0f 84 c6 00 00 00    	je     c01017ad <task_fs+0x1d4>
c01016e7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01016eb:	74 40                	je     c010172d <task_fs+0x154>
c01016ed:	e9 d4 00 00 00       	jmp    c01017c6 <task_fs+0x1ed>
c01016f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016f5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01016fc:	83 ec 0c             	sub    $0xc,%esp
c01016ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0101702:	e8 ec 07 00 00       	call   c0101ef3 <do_open>
c0101707:	83 c4 10             	add    $0x10,%esp
c010170a:	89 c2                	mov    %eax,%edx
c010170c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010170f:	89 50 50             	mov    %edx,0x50(%eax)
c0101712:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101715:	8b 00                	mov    (%eax),%eax
c0101717:	83 ec 04             	sub    $0x4,%esp
c010171a:	50                   	push   %eax
c010171b:	ff 75 f4             	pushl  -0xc(%ebp)
c010171e:	6a 01                	push   $0x1
c0101720:	e8 93 7d 00 00       	call   c01094b8 <send_rec>
c0101725:	83 c4 10             	add    $0x10,%esp
c0101728:	e9 b2 00 00 00       	jmp    c01017df <task_fs+0x206>
c010172d:	83 ec 0c             	sub    $0xc,%esp
c0101730:	ff 75 f4             	pushl  -0xc(%ebp)
c0101733:	e8 19 19 00 00       	call   c0103051 <do_rdwt>
c0101738:	83 c4 10             	add    $0x10,%esp
c010173b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010173e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101742:	0f 84 96 00 00 00    	je     c01017de <task_fs+0x205>
c0101748:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010174b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101752:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101755:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101758:	89 50 60             	mov    %edx,0x60(%eax)
c010175b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010175e:	8b 00                	mov    (%eax),%eax
c0101760:	83 ec 04             	sub    $0x4,%esp
c0101763:	50                   	push   %eax
c0101764:	ff 75 f4             	pushl  -0xc(%ebp)
c0101767:	6a 01                	push   $0x1
c0101769:	e8 4a 7d 00 00       	call   c01094b8 <send_rec>
c010176e:	83 c4 10             	add    $0x10,%esp
c0101771:	eb 6b                	jmp    c01017de <task_fs+0x205>
c0101773:	83 ec 0c             	sub    $0xc,%esp
c0101776:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101779:	e8 f0 1d 00 00       	call   c010356e <do_close>
c010177e:	83 c4 10             	add    $0x10,%esp
c0101781:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101784:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010178b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010178e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101795:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101798:	8b 00                	mov    (%eax),%eax
c010179a:	83 ec 04             	sub    $0x4,%esp
c010179d:	50                   	push   %eax
c010179e:	ff 75 f4             	pushl  -0xc(%ebp)
c01017a1:	6a 01                	push   $0x1
c01017a3:	e8 10 7d 00 00       	call   c01094b8 <send_rec>
c01017a8:	83 c4 10             	add    $0x10,%esp
c01017ab:	eb 32                	jmp    c01017df <task_fs+0x206>
c01017ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017b0:	8b 40 68             	mov    0x68(%eax),%eax
c01017b3:	83 ec 04             	sub    $0x4,%esp
c01017b6:	50                   	push   %eax
c01017b7:	ff 75 f4             	pushl  -0xc(%ebp)
c01017ba:	6a 01                	push   $0x1
c01017bc:	e8 f7 7c 00 00       	call   c01094b8 <send_rec>
c01017c1:	83 c4 10             	add    $0x10,%esp
c01017c4:	eb 19                	jmp    c01017df <task_fs+0x206>
c01017c6:	83 ec 0c             	sub    $0xc,%esp
c01017c9:	68 2b b3 10 c0       	push   $0xc010b32b
c01017ce:	e8 57 70 00 00       	call   c010882a <panic>
c01017d3:	83 c4 10             	add    $0x10,%esp
c01017d6:	eb 07                	jmp    c01017df <task_fs+0x206>
c01017d8:	90                   	nop
c01017d9:	e9 26 fe ff ff       	jmp    c0101604 <task_fs+0x2b>
c01017de:	90                   	nop
c01017df:	e9 20 fe ff ff       	jmp    c0101604 <task_fs+0x2b>

c01017e4 <rd_wt>:
c01017e4:	55                   	push   %ebp
c01017e5:	89 e5                	mov    %esp,%ebp
c01017e7:	83 ec 18             	sub    $0x18,%esp
c01017ea:	83 ec 0c             	sub    $0xc,%esp
c01017ed:	6a 7c                	push   $0x7c
c01017ef:	e8 b8 fd ff ff       	call   c01015ac <sys_malloc>
c01017f4:	83 c4 10             	add    $0x10,%esp
c01017f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01017fa:	83 ec 04             	sub    $0x4,%esp
c01017fd:	6a 7c                	push   $0x7c
c01017ff:	6a 00                	push   $0x0
c0101801:	ff 75 f4             	pushl  -0xc(%ebp)
c0101804:	e8 62 a9 00 00       	call   c010c16b <Memset>
c0101809:	83 c4 10             	add    $0x10,%esp
c010180c:	8b 55 18             	mov    0x18(%ebp),%edx
c010180f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101812:	89 50 78             	mov    %edx,0x78(%eax)
c0101815:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101818:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010181b:	89 50 14             	mov    %edx,0x14(%eax)
c010181e:	8b 55 10             	mov    0x10(%ebp),%edx
c0101821:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101824:	89 50 10             	mov    %edx,0x10(%eax)
c0101827:	8b 55 14             	mov    0x14(%ebp),%edx
c010182a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010182d:	89 50 0c             	mov    %edx,0xc(%eax)
c0101830:	8b 45 08             	mov    0x8(%ebp),%eax
c0101833:	c1 e0 09             	shl    $0x9,%eax
c0101836:	89 c2                	mov    %eax,%edx
c0101838:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010183b:	89 50 18             	mov    %edx,0x18(%eax)
c010183e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101842:	74 22                	je     c0101866 <rd_wt+0x82>
c0101844:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101848:	74 1c                	je     c0101866 <rd_wt+0x82>
c010184a:	68 b1 00 00 00       	push   $0xb1
c010184f:	68 b8 b2 10 c0       	push   $0xc010b2b8
c0101854:	68 b8 b2 10 c0       	push   $0xc010b2b8
c0101859:	68 3e b3 10 c0       	push   $0xc010b33e
c010185e:	e8 e5 6f 00 00       	call   c0108848 <assertion_failure>
c0101863:	83 c4 10             	add    $0x10,%esp
c0101866:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101869:	8b 40 78             	mov    0x78(%eax),%eax
c010186c:	83 f8 07             	cmp    $0x7,%eax
c010186f:	74 27                	je     c0101898 <rd_wt+0xb4>
c0101871:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101874:	8b 40 78             	mov    0x78(%eax),%eax
c0101877:	83 f8 0a             	cmp    $0xa,%eax
c010187a:	74 1c                	je     c0101898 <rd_wt+0xb4>
c010187c:	68 b2 00 00 00       	push   $0xb2
c0101881:	68 b8 b2 10 c0       	push   $0xc010b2b8
c0101886:	68 b8 b2 10 c0       	push   $0xc010b2b8
c010188b:	68 5c b3 10 c0       	push   $0xc010b35c
c0101890:	e8 b3 6f 00 00       	call   c0108848 <assertion_failure>
c0101895:	83 c4 10             	add    $0x10,%esp
c0101898:	83 ec 04             	sub    $0x4,%esp
c010189b:	6a 03                	push   $0x3
c010189d:	ff 75 f4             	pushl  -0xc(%ebp)
c01018a0:	6a 03                	push   $0x3
c01018a2:	e8 11 7c 00 00       	call   c01094b8 <send_rec>
c01018a7:	83 c4 10             	add    $0x10,%esp
c01018aa:	83 ec 08             	sub    $0x8,%esp
c01018ad:	6a 7c                	push   $0x7c
c01018af:	ff 75 f4             	pushl  -0xc(%ebp)
c01018b2:	e8 0a fd ff ff       	call   c01015c1 <sys_free>
c01018b7:	83 c4 10             	add    $0x10,%esp
c01018ba:	90                   	nop
c01018bb:	c9                   	leave  
c01018bc:	c3                   	ret    

c01018bd <mkfs>:
c01018bd:	55                   	push   %ebp
c01018be:	89 e5                	mov    %esp,%ebp
c01018c0:	57                   	push   %edi
c01018c1:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c01018c7:	83 ec 0c             	sub    $0xc,%esp
c01018ca:	68 00 80 00 00       	push   $0x8000
c01018cf:	e8 d8 fc ff ff       	call   c01015ac <sys_malloc>
c01018d4:	83 c4 10             	add    $0x10,%esp
c01018d7:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c01018dc:	83 ec 0c             	sub    $0xc,%esp
c01018df:	6a 24                	push   $0x24
c01018e1:	e8 c6 fc ff ff       	call   c01015ac <sys_malloc>
c01018e6:	83 c4 10             	add    $0x10,%esp
c01018e9:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c01018ee:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01018f3:	83 ec 0c             	sub    $0xc,%esp
c01018f6:	50                   	push   %eax
c01018f7:	e8 42 46 00 00       	call   c0105f3e <get_physical_address>
c01018fc:	83 c4 10             	add    $0x10,%esp
c01018ff:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101904:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101909:	83 ec 0c             	sub    $0xc,%esp
c010190c:	50                   	push   %eax
c010190d:	e8 2c 46 00 00       	call   c0105f3e <get_physical_address>
c0101912:	83 c4 10             	add    $0x10,%esp
c0101915:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c010191a:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010191f:	83 ec 04             	sub    $0x4,%esp
c0101922:	68 00 02 00 00       	push   $0x200
c0101927:	6a 00                	push   $0x0
c0101929:	50                   	push   %eax
c010192a:	e8 3c a8 00 00       	call   c010c16b <Memset>
c010192f:	83 c4 10             	add    $0x10,%esp
c0101932:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101937:	83 ec 0c             	sub    $0xc,%esp
c010193a:	6a 0a                	push   $0xa
c010193c:	68 00 02 00 00       	push   $0x200
c0101941:	50                   	push   %eax
c0101942:	6a 20                	push   $0x20
c0101944:	6a 00                	push   $0x0
c0101946:	e8 99 fe ff ff       	call   c01017e4 <rd_wt>
c010194b:	83 c4 20             	add    $0x20,%esp
c010194e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101953:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101956:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101959:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101960:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101963:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c010196a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010196d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101974:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101977:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c010197e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101981:	8b 40 04             	mov    0x4(%eax),%eax
c0101984:	8d 50 02             	lea    0x2(%eax),%edx
c0101987:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010198a:	8b 40 08             	mov    0x8(%eax),%eax
c010198d:	01 c2                	add    %eax,%edx
c010198f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101992:	8b 40 0c             	mov    0xc(%eax),%eax
c0101995:	01 c2                	add    %eax,%edx
c0101997:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010199a:	89 10                	mov    %edx,(%eax)
c010199c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c01019a3:	b8 00 02 00 00       	mov    $0x200,%eax
c01019a8:	2b 45 d8             	sub    -0x28(%ebp),%eax
c01019ab:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c01019b1:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01019b4:	01 ca                	add    %ecx,%edx
c01019b6:	83 ec 04             	sub    $0x4,%esp
c01019b9:	50                   	push   %eax
c01019ba:	6a 80                	push   $0xffffff80
c01019bc:	52                   	push   %edx
c01019bd:	e8 a9 a7 00 00       	call   c010c16b <Memset>
c01019c2:	83 c4 10             	add    $0x10,%esp
c01019c5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019ca:	83 ec 0c             	sub    $0xc,%esp
c01019cd:	6a 0a                	push   $0xa
c01019cf:	68 00 02 00 00       	push   $0x200
c01019d4:	50                   	push   %eax
c01019d5:	6a 20                	push   $0x20
c01019d7:	6a 01                	push   $0x1
c01019d9:	e8 06 fe ff ff       	call   c01017e4 <rd_wt>
c01019de:	83 c4 20             	add    $0x20,%esp
c01019e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019e4:	8b 10                	mov    (%eax),%edx
c01019e6:	89 55 98             	mov    %edx,-0x68(%ebp)
c01019e9:	8b 50 04             	mov    0x4(%eax),%edx
c01019ec:	89 55 9c             	mov    %edx,-0x64(%ebp)
c01019ef:	8b 50 08             	mov    0x8(%eax),%edx
c01019f2:	89 55 a0             	mov    %edx,-0x60(%ebp)
c01019f5:	8b 50 0c             	mov    0xc(%eax),%edx
c01019f8:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c01019fb:	8b 50 10             	mov    0x10(%eax),%edx
c01019fe:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101a01:	8b 50 14             	mov    0x14(%eax),%edx
c0101a04:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101a07:	8b 50 18             	mov    0x18(%eax),%edx
c0101a0a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101a0d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101a10:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101a13:	8b 40 20             	mov    0x20(%eax),%eax
c0101a16:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101a19:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101a1d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101a21:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a26:	83 ec 04             	sub    $0x4,%esp
c0101a29:	6a 01                	push   $0x1
c0101a2b:	52                   	push   %edx
c0101a2c:	50                   	push   %eax
c0101a2d:	e8 39 a7 00 00       	call   c010c16b <Memset>
c0101a32:	83 c4 10             	add    $0x10,%esp
c0101a35:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a3a:	83 c0 01             	add    $0x1,%eax
c0101a3d:	83 ec 04             	sub    $0x4,%esp
c0101a40:	68 ff 01 00 00       	push   $0x1ff
c0101a45:	6a 80                	push   $0xffffff80
c0101a47:	50                   	push   %eax
c0101a48:	e8 1e a7 00 00       	call   c010c16b <Memset>
c0101a4d:	83 c4 10             	add    $0x10,%esp
c0101a50:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a55:	83 ec 0c             	sub    $0xc,%esp
c0101a58:	6a 0a                	push   $0xa
c0101a5a:	68 00 02 00 00       	push   $0x200
c0101a5f:	50                   	push   %eax
c0101a60:	6a 20                	push   $0x20
c0101a62:	6a 02                	push   $0x2
c0101a64:	e8 7b fd ff ff       	call   c01017e4 <rd_wt>
c0101a69:	83 c4 20             	add    $0x20,%esp
c0101a6c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101a73:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a78:	83 ec 04             	sub    $0x4,%esp
c0101a7b:	68 00 02 00 00       	push   $0x200
c0101a80:	6a ff                	push   $0xffffffff
c0101a82:	50                   	push   %eax
c0101a83:	e8 e3 a6 00 00       	call   c010c16b <Memset>
c0101a88:	83 c4 10             	add    $0x10,%esp
c0101a8b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a90:	83 ec 0c             	sub    $0xc,%esp
c0101a93:	6a 0a                	push   $0xa
c0101a95:	68 00 02 00 00       	push   $0x200
c0101a9a:	50                   	push   %eax
c0101a9b:	6a 20                	push   $0x20
c0101a9d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101aa0:	e8 3f fd ff ff       	call   c01017e4 <rd_wt>
c0101aa5:	83 c4 20             	add    $0x20,%esp
c0101aa8:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101aad:	83 ec 04             	sub    $0x4,%esp
c0101ab0:	6a 01                	push   $0x1
c0101ab2:	6a 01                	push   $0x1
c0101ab4:	50                   	push   %eax
c0101ab5:	e8 b1 a6 00 00       	call   c010c16b <Memset>
c0101aba:	83 c4 10             	add    $0x10,%esp
c0101abd:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ac2:	83 c0 01             	add    $0x1,%eax
c0101ac5:	83 ec 04             	sub    $0x4,%esp
c0101ac8:	68 ff 01 00 00       	push   $0x1ff
c0101acd:	6a 00                	push   $0x0
c0101acf:	50                   	push   %eax
c0101ad0:	e8 96 a6 00 00       	call   c010c16b <Memset>
c0101ad5:	83 c4 10             	add    $0x10,%esp
c0101ad8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101add:	89 c2                	mov    %eax,%edx
c0101adf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101ae2:	83 c0 01             	add    $0x1,%eax
c0101ae5:	83 ec 0c             	sub    $0xc,%esp
c0101ae8:	6a 0a                	push   $0xa
c0101aea:	68 00 02 00 00       	push   $0x200
c0101aef:	52                   	push   %edx
c0101af0:	6a 20                	push   $0x20
c0101af2:	50                   	push   %eax
c0101af3:	e8 ec fc ff ff       	call   c01017e4 <rd_wt>
c0101af8:	83 c4 20             	add    $0x20,%esp
c0101afb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101afe:	83 e8 02             	sub    $0x2,%eax
c0101b01:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101b04:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101b0b:	eb 04                	jmp    c0101b11 <mkfs+0x254>
c0101b0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101b11:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101b14:	83 c0 01             	add    $0x1,%eax
c0101b17:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101b1a:	7e f1                	jle    c0101b0d <mkfs+0x250>
c0101b1c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b21:	89 c2                	mov    %eax,%edx
c0101b23:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101b26:	83 c0 03             	add    $0x3,%eax
c0101b29:	83 ec 0c             	sub    $0xc,%esp
c0101b2c:	6a 0a                	push   $0xa
c0101b2e:	68 00 02 00 00       	push   $0x200
c0101b33:	52                   	push   %edx
c0101b34:	6a 20                	push   $0x20
c0101b36:	50                   	push   %eax
c0101b37:	e8 a8 fc ff ff       	call   c01017e4 <rd_wt>
c0101b3c:	83 c4 20             	add    $0x20,%esp
c0101b3f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b44:	89 c2                	mov    %eax,%edx
c0101b46:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101b49:	83 c0 03             	add    $0x3,%eax
c0101b4c:	83 ec 0c             	sub    $0xc,%esp
c0101b4f:	6a 07                	push   $0x7
c0101b51:	68 00 02 00 00       	push   $0x200
c0101b56:	52                   	push   %edx
c0101b57:	6a 20                	push   $0x20
c0101b59:	50                   	push   %eax
c0101b5a:	e8 85 fc ff ff       	call   c01017e4 <rd_wt>
c0101b5f:	83 c4 20             	add    $0x20,%esp
c0101b62:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b67:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101b6a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b6d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101b73:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b76:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101b7d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101b80:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b83:	89 50 08             	mov    %edx,0x8(%eax)
c0101b86:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b89:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101b90:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b93:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101b9a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b9d:	8b 10                	mov    (%eax),%edx
c0101b9f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101ba5:	8b 50 04             	mov    0x4(%eax),%edx
c0101ba8:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101bae:	8b 50 08             	mov    0x8(%eax),%edx
c0101bb1:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101bb7:	8b 50 0c             	mov    0xc(%eax),%edx
c0101bba:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101bc0:	8b 50 10             	mov    0x10(%eax),%edx
c0101bc3:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101bc9:	8b 50 14             	mov    0x14(%eax),%edx
c0101bcc:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101bd2:	8b 50 18             	mov    0x18(%eax),%edx
c0101bd5:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101bdb:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101bde:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101be4:	8b 50 20             	mov    0x20(%eax),%edx
c0101be7:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101bed:	8b 40 24             	mov    0x24(%eax),%eax
c0101bf0:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101bf5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101bfc:	eb 4c                	jmp    c0101c4a <mkfs+0x38d>
c0101bfe:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c03:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101c06:	83 c2 01             	add    $0x1,%edx
c0101c09:	c1 e2 05             	shl    $0x5,%edx
c0101c0c:	01 d0                	add    %edx,%eax
c0101c0e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101c11:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c14:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101c1a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c1d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101c24:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c27:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101c2e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101c35:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101c38:	c1 e0 08             	shl    $0x8,%eax
c0101c3b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101c3e:	89 c2                	mov    %eax,%edx
c0101c40:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c43:	89 50 08             	mov    %edx,0x8(%eax)
c0101c46:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101c4a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101c4e:	7e ae                	jle    c0101bfe <mkfs+0x341>
c0101c50:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101c57:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101c5d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c62:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101c67:	89 d7                	mov    %edx,%edi
c0101c69:	f3 ab                	rep stos %eax,%es:(%edi)
c0101c6b:	c7 85 70 ff ff ff 84 	movl   $0xc010b384,-0x90(%ebp)
c0101c72:	b3 10 c0 
c0101c75:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101c7c:	eb 54                	jmp    c0101cd2 <mkfs+0x415>
c0101c7e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c83:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101c86:	83 c2 04             	add    $0x4,%edx
c0101c89:	c1 e2 05             	shl    $0x5,%edx
c0101c8c:	01 d0                	add    %edx,%eax
c0101c8e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101c91:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c94:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101c9a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c9d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101ca4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101ca7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101caa:	83 c2 01             	add    $0x1,%edx
c0101cad:	c1 e2 0b             	shl    $0xb,%edx
c0101cb0:	01 c2                	add    %eax,%edx
c0101cb2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cb5:	89 50 08             	mov    %edx,0x8(%eax)
c0101cb8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cbb:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101cc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101cc5:	8d 50 05             	lea    0x5(%eax),%edx
c0101cc8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ccb:	89 50 10             	mov    %edx,0x10(%eax)
c0101cce:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101cd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101cd5:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101cd8:	7c a4                	jl     c0101c7e <mkfs+0x3c1>
c0101cda:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101cdf:	89 c2                	mov    %eax,%edx
c0101ce1:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101ce4:	83 c0 03             	add    $0x3,%eax
c0101ce7:	83 ec 0c             	sub    $0xc,%esp
c0101cea:	6a 0a                	push   $0xa
c0101cec:	68 00 02 00 00       	push   $0x200
c0101cf1:	52                   	push   %edx
c0101cf2:	6a 20                	push   $0x20
c0101cf4:	50                   	push   %eax
c0101cf5:	e8 ea fa ff ff       	call   c01017e4 <rd_wt>
c0101cfa:	83 c4 20             	add    $0x20,%esp
c0101cfd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d02:	89 c2                	mov    %eax,%edx
c0101d04:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101d07:	83 ec 0c             	sub    $0xc,%esp
c0101d0a:	6a 07                	push   $0x7
c0101d0c:	68 00 02 00 00       	push   $0x200
c0101d11:	52                   	push   %edx
c0101d12:	6a 20                	push   $0x20
c0101d14:	50                   	push   %eax
c0101d15:	e8 ca fa ff ff       	call   c01017e4 <rd_wt>
c0101d1a:	83 c4 20             	add    $0x20,%esp
c0101d1d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101d24:	00 00 00 
c0101d27:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101d2e:	2e 00 
c0101d30:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d35:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101d38:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d3b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101d41:	83 ec 0c             	sub    $0xc,%esp
c0101d44:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101d4a:	50                   	push   %eax
c0101d4b:	e8 54 a4 00 00       	call   c010c1a4 <Strlen>
c0101d50:	83 c4 10             	add    $0x10,%esp
c0101d53:	89 c1                	mov    %eax,%ecx
c0101d55:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d58:	8d 50 04             	lea    0x4(%eax),%edx
c0101d5b:	83 ec 04             	sub    $0x4,%esp
c0101d5e:	51                   	push   %ecx
c0101d5f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101d65:	50                   	push   %eax
c0101d66:	52                   	push   %edx
c0101d67:	e8 f0 4e 00 00       	call   c0106c5c <Memcpy>
c0101d6c:	83 c4 10             	add    $0x10,%esp
c0101d6f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101d75:	b8 00 00 00 00       	mov    $0x0,%eax
c0101d7a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101d7f:	89 d7                	mov    %edx,%edi
c0101d81:	f3 ab                	rep stos %eax,%es:(%edi)
c0101d83:	c7 85 34 ff ff ff 90 	movl   $0xc010b390,-0xcc(%ebp)
c0101d8a:	b3 10 c0 
c0101d8d:	c7 85 38 ff ff ff 99 	movl   $0xc010b399,-0xc8(%ebp)
c0101d94:	b3 10 c0 
c0101d97:	c7 85 3c ff ff ff a2 	movl   $0xc010b3a2,-0xc4(%ebp)
c0101d9e:	b3 10 c0 
c0101da1:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101da8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101daf:	eb 49                	jmp    c0101dfa <mkfs+0x53d>
c0101db1:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101db5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101db8:	8d 50 02             	lea    0x2(%eax),%edx
c0101dbb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101dbe:	89 10                	mov    %edx,(%eax)
c0101dc0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101dc3:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101dca:	83 ec 0c             	sub    $0xc,%esp
c0101dcd:	50                   	push   %eax
c0101dce:	e8 d1 a3 00 00       	call   c010c1a4 <Strlen>
c0101dd3:	83 c4 10             	add    $0x10,%esp
c0101dd6:	89 c1                	mov    %eax,%ecx
c0101dd8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101ddb:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101de2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101de5:	83 c2 04             	add    $0x4,%edx
c0101de8:	83 ec 04             	sub    $0x4,%esp
c0101deb:	51                   	push   %ecx
c0101dec:	50                   	push   %eax
c0101ded:	52                   	push   %edx
c0101dee:	e8 69 4e 00 00       	call   c0106c5c <Memcpy>
c0101df3:	83 c4 10             	add    $0x10,%esp
c0101df6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101dfa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101dfd:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101e00:	7c af                	jl     c0101db1 <mkfs+0x4f4>
c0101e02:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101e09:	eb 66                	jmp    c0101e71 <mkfs+0x5b4>
c0101e0b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e0e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101e15:	83 ec 0c             	sub    $0xc,%esp
c0101e18:	50                   	push   %eax
c0101e19:	e8 86 a3 00 00       	call   c010c1a4 <Strlen>
c0101e1e:	83 c4 10             	add    $0x10,%esp
c0101e21:	85 c0                	test   %eax,%eax
c0101e23:	74 47                	je     c0101e6c <mkfs+0x5af>
c0101e25:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101e29:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e2c:	8d 50 05             	lea    0x5(%eax),%edx
c0101e2f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e32:	89 10                	mov    %edx,(%eax)
c0101e34:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e37:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101e3e:	83 ec 0c             	sub    $0xc,%esp
c0101e41:	50                   	push   %eax
c0101e42:	e8 5d a3 00 00       	call   c010c1a4 <Strlen>
c0101e47:	83 c4 10             	add    $0x10,%esp
c0101e4a:	89 c1                	mov    %eax,%ecx
c0101e4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e4f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101e56:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101e59:	83 c2 04             	add    $0x4,%edx
c0101e5c:	83 ec 04             	sub    $0x4,%esp
c0101e5f:	51                   	push   %ecx
c0101e60:	50                   	push   %eax
c0101e61:	52                   	push   %edx
c0101e62:	e8 f5 4d 00 00       	call   c0106c5c <Memcpy>
c0101e67:	83 c4 10             	add    $0x10,%esp
c0101e6a:	eb 01                	jmp    c0101e6d <mkfs+0x5b0>
c0101e6c:	90                   	nop
c0101e6d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101e71:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e74:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101e77:	7c 92                	jl     c0101e0b <mkfs+0x54e>
c0101e79:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e7e:	89 c2                	mov    %eax,%edx
c0101e80:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101e83:	83 ec 0c             	sub    $0xc,%esp
c0101e86:	6a 0a                	push   $0xa
c0101e88:	68 00 02 00 00       	push   $0x200
c0101e8d:	52                   	push   %edx
c0101e8e:	6a 20                	push   $0x20
c0101e90:	50                   	push   %eax
c0101e91:	e8 4e f9 ff ff       	call   c01017e4 <rd_wt>
c0101e96:	83 c4 20             	add    $0x20,%esp
c0101e99:	90                   	nop
c0101e9a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101e9d:	c9                   	leave  
c0101e9e:	c3                   	ret    

c0101e9f <init_fs>:
c0101e9f:	55                   	push   %ebp
c0101ea0:	89 e5                	mov    %esp,%ebp
c0101ea2:	83 ec 18             	sub    $0x18,%esp
c0101ea5:	83 ec 0c             	sub    $0xc,%esp
c0101ea8:	6a 7c                	push   $0x7c
c0101eaa:	e8 fd f6 ff ff       	call   c01015ac <sys_malloc>
c0101eaf:	83 c4 10             	add    $0x10,%esp
c0101eb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101eb8:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101ebf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ec2:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101ec9:	83 ec 04             	sub    $0x4,%esp
c0101ecc:	6a 03                	push   $0x3
c0101ece:	ff 75 f4             	pushl  -0xc(%ebp)
c0101ed1:	6a 03                	push   $0x3
c0101ed3:	e8 e0 75 00 00       	call   c01094b8 <send_rec>
c0101ed8:	83 c4 10             	add    $0x10,%esp
c0101edb:	e8 dd f9 ff ff       	call   c01018bd <mkfs>
c0101ee0:	83 ec 08             	sub    $0x8,%esp
c0101ee3:	6a 7c                	push   $0x7c
c0101ee5:	ff 75 f4             	pushl  -0xc(%ebp)
c0101ee8:	e8 d4 f6 ff ff       	call   c01015c1 <sys_free>
c0101eed:	83 c4 10             	add    $0x10,%esp
c0101ef0:	90                   	nop
c0101ef1:	c9                   	leave  
c0101ef2:	c3                   	ret    

c0101ef3 <do_open>:
c0101ef3:	55                   	push   %ebp
c0101ef4:	89 e5                	mov    %esp,%ebp
c0101ef6:	83 ec 68             	sub    $0x68,%esp
c0101ef9:	83 ec 04             	sub    $0x4,%esp
c0101efc:	6a 0c                	push   $0xc
c0101efe:	6a 00                	push   $0x0
c0101f00:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f03:	50                   	push   %eax
c0101f04:	e8 62 a2 00 00       	call   c010c16b <Memset>
c0101f09:	83 c4 10             	add    $0x10,%esp
c0101f0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f0f:	8b 40 44             	mov    0x44(%eax),%eax
c0101f12:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101f15:	83 ec 08             	sub    $0x8,%esp
c0101f18:	6a 0c                	push   $0xc
c0101f1a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101f1d:	e8 cd 3e 00 00       	call   c0105def <alloc_virtual_memory>
c0101f22:	83 c4 10             	add    $0x10,%esp
c0101f25:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101f28:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f2b:	8b 40 40             	mov    0x40(%eax),%eax
c0101f2e:	89 c2                	mov    %eax,%edx
c0101f30:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f33:	83 ec 04             	sub    $0x4,%esp
c0101f36:	52                   	push   %edx
c0101f37:	50                   	push   %eax
c0101f38:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f3b:	50                   	push   %eax
c0101f3c:	e8 1b 4d 00 00       	call   c0106c5c <Memcpy>
c0101f41:	83 c4 10             	add    $0x10,%esp
c0101f44:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f47:	8b 40 40             	mov    0x40(%eax),%eax
c0101f4a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0101f4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f52:	8b 40 74             	mov    0x74(%eax),%eax
c0101f55:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101f58:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0101f5f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101f66:	eb 1f                	jmp    c0101f87 <do_open+0x94>
c0101f68:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101f6d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101f70:	83 c2 4c             	add    $0x4c,%edx
c0101f73:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0101f77:	85 c0                	test   %eax,%eax
c0101f79:	75 08                	jne    c0101f83 <do_open+0x90>
c0101f7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101f7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101f81:	eb 0a                	jmp    c0101f8d <do_open+0x9a>
c0101f83:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101f87:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101f8b:	7e db                	jle    c0101f68 <do_open+0x75>
c0101f8d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0101f91:	75 1c                	jne    c0101faf <do_open+0xbc>
c0101f93:	68 c6 01 00 00       	push   $0x1c6
c0101f98:	68 b8 b2 10 c0       	push   $0xc010b2b8
c0101f9d:	68 b8 b2 10 c0       	push   $0xc010b2b8
c0101fa2:	68 ab b3 10 c0       	push   $0xc010b3ab
c0101fa7:	e8 9c 68 00 00       	call   c0108848 <assertion_failure>
c0101fac:	83 c4 10             	add    $0x10,%esp
c0101faf:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0101fb6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0101fbd:	eb 1d                	jmp    c0101fdc <do_open+0xe9>
c0101fbf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101fc2:	c1 e0 04             	shl    $0x4,%eax
c0101fc5:	05 88 13 11 c0       	add    $0xc0111388,%eax
c0101fca:	8b 00                	mov    (%eax),%eax
c0101fcc:	85 c0                	test   %eax,%eax
c0101fce:	75 08                	jne    c0101fd8 <do_open+0xe5>
c0101fd0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101fd3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101fd6:	eb 0a                	jmp    c0101fe2 <do_open+0xef>
c0101fd8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0101fdc:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0101fe0:	7e dd                	jle    c0101fbf <do_open+0xcc>
c0101fe2:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0101fe6:	75 1c                	jne    c0102004 <do_open+0x111>
c0101fe8:	68 d2 01 00 00       	push   $0x1d2
c0101fed:	68 b8 b2 10 c0       	push   $0xc010b2b8
c0101ff2:	68 b8 b2 10 c0       	push   $0xc010b2b8
c0101ff7:	68 b3 b3 10 c0       	push   $0xc010b3b3
c0101ffc:	e8 47 68 00 00       	call   c0108848 <assertion_failure>
c0102001:	83 c4 10             	add    $0x10,%esp
c0102004:	83 ec 0c             	sub    $0xc,%esp
c0102007:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010200a:	50                   	push   %eax
c010200b:	e8 d2 00 00 00       	call   c01020e2 <search_file>
c0102010:	83 c4 10             	add    $0x10,%esp
c0102013:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102016:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010201a:	75 2b                	jne    c0102047 <do_open+0x154>
c010201c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0102020:	7e 10                	jle    c0102032 <do_open+0x13f>
c0102022:	83 ec 0c             	sub    $0xc,%esp
c0102025:	68 bb b3 10 c0       	push   $0xc010b3bb
c010202a:	e8 fb 67 00 00       	call   c010882a <panic>
c010202f:	83 c4 10             	add    $0x10,%esp
c0102032:	83 ec 08             	sub    $0x8,%esp
c0102035:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102038:	50                   	push   %eax
c0102039:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010203c:	50                   	push   %eax
c010203d:	e8 60 04 00 00       	call   c01024a2 <create_file>
c0102042:	83 c4 10             	add    $0x10,%esp
c0102045:	eb 25                	jmp    c010206c <do_open+0x179>
c0102047:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010204b:	75 0a                	jne    c0102057 <do_open+0x164>
c010204d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102052:	e9 89 00 00 00       	jmp    c01020e0 <do_open+0x1ed>
c0102057:	83 ec 08             	sub    $0x8,%esp
c010205a:	ff 75 d8             	pushl  -0x28(%ebp)
c010205d:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0102060:	50                   	push   %eax
c0102061:	e8 7a 02 00 00       	call   c01022e0 <get_inode>
c0102066:	83 c4 10             	add    $0x10,%esp
c0102069:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010206c:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0102071:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102074:	c1 e2 04             	shl    $0x4,%edx
c0102077:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010207d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102080:	83 c2 4c             	add    $0x4c,%edx
c0102083:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102087:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010208a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010208d:	c1 e2 04             	shl    $0x4,%edx
c0102090:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102096:	89 02                	mov    %eax,(%edx)
c0102098:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010209b:	c1 e0 04             	shl    $0x4,%eax
c010209e:	05 84 13 11 c0       	add    $0xc0111384,%eax
c01020a3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01020a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01020ac:	c1 e0 04             	shl    $0x4,%eax
c01020af:	05 80 13 11 c0       	add    $0xc0111380,%eax
c01020b4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01020ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01020bd:	c1 e0 04             	shl    $0x4,%eax
c01020c0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01020c5:	8b 00                	mov    (%eax),%eax
c01020c7:	8d 50 01             	lea    0x1(%eax),%edx
c01020ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01020cd:	c1 e0 04             	shl    $0x4,%eax
c01020d0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01020d5:	89 10                	mov    %edx,(%eax)
c01020d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01020da:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01020dd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01020e0:	c9                   	leave  
c01020e1:	c3                   	ret    

c01020e2 <search_file>:
c01020e2:	55                   	push   %ebp
c01020e3:	89 e5                	mov    %esp,%ebp
c01020e5:	83 ec 68             	sub    $0x68,%esp
c01020e8:	83 ec 04             	sub    $0x4,%esp
c01020eb:	6a 0c                	push   $0xc
c01020ed:	6a 00                	push   $0x0
c01020ef:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01020f2:	50                   	push   %eax
c01020f3:	e8 73 a0 00 00       	call   c010c16b <Memset>
c01020f8:	83 c4 10             	add    $0x10,%esp
c01020fb:	83 ec 04             	sub    $0x4,%esp
c01020fe:	6a 28                	push   $0x28
c0102100:	6a 00                	push   $0x0
c0102102:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102105:	50                   	push   %eax
c0102106:	e8 60 a0 00 00       	call   c010c16b <Memset>
c010210b:	83 c4 10             	add    $0x10,%esp
c010210e:	83 ec 04             	sub    $0x4,%esp
c0102111:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102114:	50                   	push   %eax
c0102115:	ff 75 08             	pushl  0x8(%ebp)
c0102118:	8d 45 c0             	lea    -0x40(%ebp),%eax
c010211b:	50                   	push   %eax
c010211c:	e8 f3 00 00 00       	call   c0102214 <strip_path>
c0102121:	83 c4 10             	add    $0x10,%esp
c0102124:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102127:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c010212b:	75 0a                	jne    c0102137 <search_file+0x55>
c010212d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102132:	e9 db 00 00 00       	jmp    c0102212 <search_file+0x130>
c0102137:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010213a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010213d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102140:	05 00 02 00 00       	add    $0x200,%eax
c0102145:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010214b:	85 c0                	test   %eax,%eax
c010214d:	0f 48 c2             	cmovs  %edx,%eax
c0102150:	c1 f8 09             	sar    $0x9,%eax
c0102153:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102156:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102159:	c1 e8 04             	shr    $0x4,%eax
c010215c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010215f:	e8 5c 14 00 00       	call   c01035c0 <get_super_block>
c0102164:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102167:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010216a:	8b 00                	mov    (%eax),%eax
c010216c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010216f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102176:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010217d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102184:	eb 7b                	jmp    c0102201 <search_file+0x11f>
c0102186:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010218b:	89 c1                	mov    %eax,%ecx
c010218d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102190:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102193:	01 d0                	add    %edx,%eax
c0102195:	83 ec 0c             	sub    $0xc,%esp
c0102198:	6a 07                	push   $0x7
c010219a:	68 00 02 00 00       	push   $0x200
c010219f:	51                   	push   %ecx
c01021a0:	ff 75 cc             	pushl  -0x34(%ebp)
c01021a3:	50                   	push   %eax
c01021a4:	e8 3b f6 ff ff       	call   c01017e4 <rd_wt>
c01021a9:	83 c4 20             	add    $0x20,%esp
c01021ac:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01021b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01021b4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01021bb:	eb 35                	jmp    c01021f2 <search_file+0x110>
c01021bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01021c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01021c4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01021c7:	7f 33                	jg     c01021fc <search_file+0x11a>
c01021c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021cc:	83 c0 04             	add    $0x4,%eax
c01021cf:	83 ec 08             	sub    $0x8,%esp
c01021d2:	50                   	push   %eax
c01021d3:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01021d6:	50                   	push   %eax
c01021d7:	e8 43 76 00 00       	call   c010981f <strcmp>
c01021dc:	83 c4 10             	add    $0x10,%esp
c01021df:	85 c0                	test   %eax,%eax
c01021e1:	75 07                	jne    c01021ea <search_file+0x108>
c01021e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021e6:	8b 00                	mov    (%eax),%eax
c01021e8:	eb 28                	jmp    c0102212 <search_file+0x130>
c01021ea:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01021ee:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c01021f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021f5:	83 f8 1f             	cmp    $0x1f,%eax
c01021f8:	76 c3                	jbe    c01021bd <search_file+0xdb>
c01021fa:	eb 01                	jmp    c01021fd <search_file+0x11b>
c01021fc:	90                   	nop
c01021fd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102201:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102204:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102207:	0f 8c 79 ff ff ff    	jl     c0102186 <search_file+0xa4>
c010220d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102212:	c9                   	leave  
c0102213:	c3                   	ret    

c0102214 <strip_path>:
c0102214:	55                   	push   %ebp
c0102215:	89 e5                	mov    %esp,%ebp
c0102217:	83 ec 10             	sub    $0x10,%esp
c010221a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010221e:	75 0a                	jne    c010222a <strip_path+0x16>
c0102220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102225:	e9 b4 00 00 00       	jmp    c01022de <strip_path+0xca>
c010222a:	8b 45 08             	mov    0x8(%ebp),%eax
c010222d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102230:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102233:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102236:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102239:	0f b6 00             	movzbl (%eax),%eax
c010223c:	3c 2f                	cmp    $0x2f,%al
c010223e:	75 2d                	jne    c010226d <strip_path+0x59>
c0102240:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102244:	eb 27                	jmp    c010226d <strip_path+0x59>
c0102246:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102249:	0f b6 00             	movzbl (%eax),%eax
c010224c:	3c 2f                	cmp    $0x2f,%al
c010224e:	75 0a                	jne    c010225a <strip_path+0x46>
c0102250:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102255:	e9 84 00 00 00       	jmp    c01022de <strip_path+0xca>
c010225a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010225d:	0f b6 10             	movzbl (%eax),%edx
c0102260:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102263:	88 10                	mov    %dl,(%eax)
c0102265:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102269:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010226d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102270:	0f b6 00             	movzbl (%eax),%eax
c0102273:	84 c0                	test   %al,%al
c0102275:	75 cf                	jne    c0102246 <strip_path+0x32>
c0102277:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010227a:	c6 00 00             	movb   $0x0,(%eax)
c010227d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102280:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102286:	89 10                	mov    %edx,(%eax)
c0102288:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010228e:	89 50 04             	mov    %edx,0x4(%eax)
c0102291:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102297:	89 50 08             	mov    %edx,0x8(%eax)
c010229a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c01022a0:	89 50 0c             	mov    %edx,0xc(%eax)
c01022a3:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c01022a9:	89 50 10             	mov    %edx,0x10(%eax)
c01022ac:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c01022b2:	89 50 14             	mov    %edx,0x14(%eax)
c01022b5:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c01022bb:	89 50 18             	mov    %edx,0x18(%eax)
c01022be:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c01022c4:	89 50 1c             	mov    %edx,0x1c(%eax)
c01022c7:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c01022cd:	89 50 20             	mov    %edx,0x20(%eax)
c01022d0:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c01022d6:	89 50 24             	mov    %edx,0x24(%eax)
c01022d9:	b8 00 00 00 00       	mov    $0x0,%eax
c01022de:	c9                   	leave  
c01022df:	c3                   	ret    

c01022e0 <get_inode>:
c01022e0:	55                   	push   %ebp
c01022e1:	89 e5                	mov    %esp,%ebp
c01022e3:	56                   	push   %esi
c01022e4:	53                   	push   %ebx
c01022e5:	83 ec 20             	sub    $0x20,%esp
c01022e8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01022ec:	75 0a                	jne    c01022f8 <get_inode+0x18>
c01022ee:	b8 00 00 00 00       	mov    $0x0,%eax
c01022f3:	e9 a3 01 00 00       	jmp    c010249b <get_inode+0x1bb>
c01022f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01022ff:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102306:	eb 69                	jmp    c0102371 <get_inode+0x91>
c0102308:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010230b:	8b 40 24             	mov    0x24(%eax),%eax
c010230e:	85 c0                	test   %eax,%eax
c0102310:	7e 53                	jle    c0102365 <get_inode+0x85>
c0102312:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102315:	8b 40 10             	mov    0x10(%eax),%eax
c0102318:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010231b:	75 50                	jne    c010236d <get_inode+0x8d>
c010231d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102320:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102323:	8b 0a                	mov    (%edx),%ecx
c0102325:	89 08                	mov    %ecx,(%eax)
c0102327:	8b 4a 04             	mov    0x4(%edx),%ecx
c010232a:	89 48 04             	mov    %ecx,0x4(%eax)
c010232d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102330:	89 48 08             	mov    %ecx,0x8(%eax)
c0102333:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102336:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102339:	8b 4a 10             	mov    0x10(%edx),%ecx
c010233c:	89 48 10             	mov    %ecx,0x10(%eax)
c010233f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102342:	89 48 14             	mov    %ecx,0x14(%eax)
c0102345:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102348:	89 48 18             	mov    %ecx,0x18(%eax)
c010234b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010234e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102351:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102354:	89 48 20             	mov    %ecx,0x20(%eax)
c0102357:	8b 52 24             	mov    0x24(%edx),%edx
c010235a:	89 50 24             	mov    %edx,0x24(%eax)
c010235d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102360:	e9 36 01 00 00       	jmp    c010249b <get_inode+0x1bb>
c0102365:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102368:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010236b:	eb 0d                	jmp    c010237a <get_inode+0x9a>
c010236d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102371:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102378:	76 8e                	jbe    c0102308 <get_inode+0x28>
c010237a:	e8 41 12 00 00       	call   c01035c0 <get_super_block>
c010237f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102382:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102389:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010238c:	8b 40 04             	mov    0x4(%eax),%eax
c010238f:	8d 50 02             	lea    0x2(%eax),%edx
c0102392:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102395:	8b 40 08             	mov    0x8(%eax),%eax
c0102398:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010239b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010239e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01023a1:	b8 00 02 00 00       	mov    $0x200,%eax
c01023a6:	99                   	cltd   
c01023a7:	f7 7d e8             	idivl  -0x18(%ebp)
c01023aa:	89 c6                	mov    %eax,%esi
c01023ac:	89 c8                	mov    %ecx,%eax
c01023ae:	99                   	cltd   
c01023af:	f7 fe                	idiv   %esi
c01023b1:	01 d8                	add    %ebx,%eax
c01023b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01023b6:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c01023bd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01023c2:	83 ec 0c             	sub    $0xc,%esp
c01023c5:	6a 07                	push   $0x7
c01023c7:	68 00 02 00 00       	push   $0x200
c01023cc:	50                   	push   %eax
c01023cd:	ff 75 e0             	pushl  -0x20(%ebp)
c01023d0:	ff 75 e4             	pushl  -0x1c(%ebp)
c01023d3:	e8 0c f4 ff ff       	call   c01017e4 <rd_wt>
c01023d8:	83 c4 20             	add    $0x20,%esp
c01023db:	8b 45 0c             	mov    0xc(%ebp),%eax
c01023de:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01023e1:	b8 00 02 00 00       	mov    $0x200,%eax
c01023e6:	99                   	cltd   
c01023e7:	f7 7d e8             	idivl  -0x18(%ebp)
c01023ea:	89 c3                	mov    %eax,%ebx
c01023ec:	89 c8                	mov    %ecx,%eax
c01023ee:	99                   	cltd   
c01023ef:	f7 fb                	idiv   %ebx
c01023f1:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01023f4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01023fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01023fd:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102401:	01 d0                	add    %edx,%eax
c0102403:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102406:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102409:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010240c:	8b 0a                	mov    (%edx),%ecx
c010240e:	89 08                	mov    %ecx,(%eax)
c0102410:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102413:	89 48 04             	mov    %ecx,0x4(%eax)
c0102416:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102419:	89 48 08             	mov    %ecx,0x8(%eax)
c010241c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010241f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102422:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102425:	89 48 10             	mov    %ecx,0x10(%eax)
c0102428:	8b 4a 14             	mov    0x14(%edx),%ecx
c010242b:	89 48 14             	mov    %ecx,0x14(%eax)
c010242e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102431:	89 48 18             	mov    %ecx,0x18(%eax)
c0102434:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102437:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010243a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010243d:	89 48 20             	mov    %ecx,0x20(%eax)
c0102440:	8b 52 24             	mov    0x24(%edx),%edx
c0102443:	89 50 24             	mov    %edx,0x24(%eax)
c0102446:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102449:	8b 55 0c             	mov    0xc(%ebp),%edx
c010244c:	89 50 10             	mov    %edx,0x10(%eax)
c010244f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102452:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102455:	89 50 20             	mov    %edx,0x20(%eax)
c0102458:	8b 45 08             	mov    0x8(%ebp),%eax
c010245b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010245e:	8b 0a                	mov    (%edx),%ecx
c0102460:	89 08                	mov    %ecx,(%eax)
c0102462:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102465:	89 48 04             	mov    %ecx,0x4(%eax)
c0102468:	8b 4a 08             	mov    0x8(%edx),%ecx
c010246b:	89 48 08             	mov    %ecx,0x8(%eax)
c010246e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102471:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102474:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102477:	89 48 10             	mov    %ecx,0x10(%eax)
c010247a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010247d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102480:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102483:	89 48 18             	mov    %ecx,0x18(%eax)
c0102486:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102489:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010248c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010248f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102492:	8b 52 24             	mov    0x24(%edx),%edx
c0102495:	89 50 24             	mov    %edx,0x24(%eax)
c0102498:	8b 45 08             	mov    0x8(%ebp),%eax
c010249b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010249e:	5b                   	pop    %ebx
c010249f:	5e                   	pop    %esi
c01024a0:	5d                   	pop    %ebp
c01024a1:	c3                   	ret    

c01024a2 <create_file>:
c01024a2:	55                   	push   %ebp
c01024a3:	89 e5                	mov    %esp,%ebp
c01024a5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01024ab:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01024ae:	50                   	push   %eax
c01024af:	ff 75 0c             	pushl  0xc(%ebp)
c01024b2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01024b5:	50                   	push   %eax
c01024b6:	e8 59 fd ff ff       	call   c0102214 <strip_path>
c01024bb:	83 c4 0c             	add    $0xc,%esp
c01024be:	83 f8 ff             	cmp    $0xffffffff,%eax
c01024c1:	75 0a                	jne    c01024cd <create_file+0x2b>
c01024c3:	b8 00 00 00 00       	mov    $0x0,%eax
c01024c8:	e9 de 00 00 00       	jmp    c01025ab <create_file+0x109>
c01024cd:	e8 db 00 00 00       	call   c01025ad <alloc_imap_bit>
c01024d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01024d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01024d9:	75 0a                	jne    c01024e5 <create_file+0x43>
c01024db:	b8 00 00 00 00       	mov    $0x0,%eax
c01024e0:	e9 c6 00 00 00       	jmp    c01025ab <create_file+0x109>
c01024e5:	e8 d6 10 00 00       	call   c01035c0 <get_super_block>
c01024ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01024ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024f0:	8b 40 10             	mov    0x10(%eax),%eax
c01024f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01024f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024f9:	83 ec 08             	sub    $0x8,%esp
c01024fc:	50                   	push   %eax
c01024fd:	ff 75 f4             	pushl  -0xc(%ebp)
c0102500:	e8 a5 01 00 00       	call   c01026aa <alloc_smap_bit>
c0102505:	83 c4 10             	add    $0x10,%esp
c0102508:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010250b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010250f:	75 0a                	jne    c010251b <create_file+0x79>
c0102511:	b8 00 00 00 00       	mov    $0x0,%eax
c0102516:	e9 90 00 00 00       	jmp    c01025ab <create_file+0x109>
c010251b:	83 ec 04             	sub    $0x4,%esp
c010251e:	ff 75 e8             	pushl  -0x18(%ebp)
c0102521:	ff 75 f4             	pushl  -0xc(%ebp)
c0102524:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0102527:	50                   	push   %eax
c0102528:	e8 1e 03 00 00       	call   c010284b <new_inode>
c010252d:	83 c4 10             	add    $0x10,%esp
c0102530:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102533:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102537:	75 07                	jne    c0102540 <create_file+0x9e>
c0102539:	b8 00 00 00 00       	mov    $0x0,%eax
c010253e:	eb 6b                	jmp    c01025ab <create_file+0x109>
c0102540:	ff 75 f4             	pushl  -0xc(%ebp)
c0102543:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102546:	50                   	push   %eax
c0102547:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010254a:	50                   	push   %eax
c010254b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102551:	50                   	push   %eax
c0102552:	e8 12 04 00 00       	call   c0102969 <new_dir_entry>
c0102557:	83 c4 10             	add    $0x10,%esp
c010255a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010255d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102561:	75 07                	jne    c010256a <create_file+0xc8>
c0102563:	b8 00 00 00 00       	mov    $0x0,%eax
c0102568:	eb 41                	jmp    c01025ab <create_file+0x109>
c010256a:	8b 45 08             	mov    0x8(%ebp),%eax
c010256d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102570:	89 10                	mov    %edx,(%eax)
c0102572:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102575:	89 50 04             	mov    %edx,0x4(%eax)
c0102578:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010257b:	89 50 08             	mov    %edx,0x8(%eax)
c010257e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102581:	89 50 0c             	mov    %edx,0xc(%eax)
c0102584:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102587:	89 50 10             	mov    %edx,0x10(%eax)
c010258a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010258d:	89 50 14             	mov    %edx,0x14(%eax)
c0102590:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102593:	89 50 18             	mov    %edx,0x18(%eax)
c0102596:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102599:	89 50 1c             	mov    %edx,0x1c(%eax)
c010259c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010259f:	89 50 20             	mov    %edx,0x20(%eax)
c01025a2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01025a5:	89 50 24             	mov    %edx,0x24(%eax)
c01025a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ab:	c9                   	leave  
c01025ac:	c3                   	ret    

c01025ad <alloc_imap_bit>:
c01025ad:	55                   	push   %ebp
c01025ae:	89 e5                	mov    %esp,%ebp
c01025b0:	53                   	push   %ebx
c01025b1:	83 ec 24             	sub    $0x24,%esp
c01025b4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01025bb:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01025c2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01025c7:	83 ec 0c             	sub    $0xc,%esp
c01025ca:	6a 07                	push   $0x7
c01025cc:	68 00 02 00 00       	push   $0x200
c01025d1:	50                   	push   %eax
c01025d2:	ff 75 e8             	pushl  -0x18(%ebp)
c01025d5:	ff 75 ec             	pushl  -0x14(%ebp)
c01025d8:	e8 07 f2 ff ff       	call   c01017e4 <rd_wt>
c01025dd:	83 c4 20             	add    $0x20,%esp
c01025e0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01025e7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01025ee:	e9 a5 00 00 00       	jmp    c0102698 <alloc_imap_bit+0xeb>
c01025f3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01025fa:	e9 8b 00 00 00       	jmp    c010268a <alloc_imap_bit+0xdd>
c01025ff:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102605:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102608:	01 d0                	add    %edx,%eax
c010260a:	0f b6 00             	movzbl (%eax),%eax
c010260d:	0f be d0             	movsbl %al,%edx
c0102610:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102613:	89 c1                	mov    %eax,%ecx
c0102615:	d3 fa                	sar    %cl,%edx
c0102617:	89 d0                	mov    %edx,%eax
c0102619:	83 e0 01             	and    $0x1,%eax
c010261c:	85 c0                	test   %eax,%eax
c010261e:	74 06                	je     c0102626 <alloc_imap_bit+0x79>
c0102620:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102624:	eb 64                	jmp    c010268a <alloc_imap_bit+0xdd>
c0102626:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010262c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010262f:	01 d0                	add    %edx,%eax
c0102631:	0f b6 18             	movzbl (%eax),%ebx
c0102634:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102637:	ba 01 00 00 00       	mov    $0x1,%edx
c010263c:	89 c1                	mov    %eax,%ecx
c010263e:	d3 e2                	shl    %cl,%edx
c0102640:	89 d0                	mov    %edx,%eax
c0102642:	89 c1                	mov    %eax,%ecx
c0102644:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010264a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010264d:	01 d0                	add    %edx,%eax
c010264f:	09 cb                	or     %ecx,%ebx
c0102651:	89 da                	mov    %ebx,%edx
c0102653:	88 10                	mov    %dl,(%eax)
c0102655:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102658:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010265f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102662:	01 d0                	add    %edx,%eax
c0102664:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102667:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010266c:	83 ec 0c             	sub    $0xc,%esp
c010266f:	6a 0a                	push   $0xa
c0102671:	68 00 02 00 00       	push   $0x200
c0102676:	50                   	push   %eax
c0102677:	ff 75 e8             	pushl  -0x18(%ebp)
c010267a:	ff 75 ec             	pushl  -0x14(%ebp)
c010267d:	e8 62 f1 ff ff       	call   c01017e4 <rd_wt>
c0102682:	83 c4 20             	add    $0x20,%esp
c0102685:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102688:	eb 1b                	jmp    c01026a5 <alloc_imap_bit+0xf8>
c010268a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010268e:	0f 8e 6b ff ff ff    	jle    c01025ff <alloc_imap_bit+0x52>
c0102694:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102698:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010269f:	0f 8e 4e ff ff ff    	jle    c01025f3 <alloc_imap_bit+0x46>
c01026a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01026a8:	c9                   	leave  
c01026a9:	c3                   	ret    

c01026aa <alloc_smap_bit>:
c01026aa:	55                   	push   %ebp
c01026ab:	89 e5                	mov    %esp,%ebp
c01026ad:	53                   	push   %ebx
c01026ae:	83 ec 34             	sub    $0x34,%esp
c01026b1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01026b5:	75 1c                	jne    c01026d3 <alloc_smap_bit+0x29>
c01026b7:	68 fd 02 00 00       	push   $0x2fd
c01026bc:	68 b8 b2 10 c0       	push   $0xc010b2b8
c01026c1:	68 b8 b2 10 c0       	push   $0xc010b2b8
c01026c6:	68 c8 b3 10 c0       	push   $0xc010b3c8
c01026cb:	e8 78 61 00 00       	call   c0108848 <assertion_failure>
c01026d0:	83 c4 10             	add    $0x10,%esp
c01026d3:	e8 e8 0e 00 00       	call   c01035c0 <get_super_block>
c01026d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01026db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01026de:	8b 40 08             	mov    0x8(%eax),%eax
c01026e1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01026e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01026e7:	8b 40 04             	mov    0x4(%eax),%eax
c01026ea:	83 c0 02             	add    $0x2,%eax
c01026ed:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01026f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01026f7:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c01026fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102705:	e9 20 01 00 00       	jmp    c010282a <alloc_smap_bit+0x180>
c010270a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010270d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102710:	01 d0                	add    %edx,%eax
c0102712:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102715:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010271a:	83 ec 0c             	sub    $0xc,%esp
c010271d:	6a 07                	push   $0x7
c010271f:	68 00 02 00 00       	push   $0x200
c0102724:	50                   	push   %eax
c0102725:	ff 75 d8             	pushl  -0x28(%ebp)
c0102728:	ff 75 d4             	pushl  -0x2c(%ebp)
c010272b:	e8 b4 f0 ff ff       	call   c01017e4 <rd_wt>
c0102730:	83 c4 20             	add    $0x20,%esp
c0102733:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010273a:	e9 b0 00 00 00       	jmp    c01027ef <alloc_smap_bit+0x145>
c010273f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102746:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010274a:	0f 85 8c 00 00 00    	jne    c01027dc <alloc_smap_bit+0x132>
c0102750:	eb 45                	jmp    c0102797 <alloc_smap_bit+0xed>
c0102752:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102758:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010275b:	01 d0                	add    %edx,%eax
c010275d:	0f b6 00             	movzbl (%eax),%eax
c0102760:	0f be d0             	movsbl %al,%edx
c0102763:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102766:	89 c1                	mov    %eax,%ecx
c0102768:	d3 fa                	sar    %cl,%edx
c010276a:	89 d0                	mov    %edx,%eax
c010276c:	83 e0 01             	and    $0x1,%eax
c010276f:	85 c0                	test   %eax,%eax
c0102771:	74 06                	je     c0102779 <alloc_smap_bit+0xcf>
c0102773:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102777:	eb 1e                	jmp    c0102797 <alloc_smap_bit+0xed>
c0102779:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010277c:	c1 e0 09             	shl    $0x9,%eax
c010277f:	89 c2                	mov    %eax,%edx
c0102781:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102784:	01 d0                	add    %edx,%eax
c0102786:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010278d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102790:	01 d0                	add    %edx,%eax
c0102792:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102795:	eb 06                	jmp    c010279d <alloc_smap_bit+0xf3>
c0102797:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010279b:	7e b5                	jle    c0102752 <alloc_smap_bit+0xa8>
c010279d:	eb 3d                	jmp    c01027dc <alloc_smap_bit+0x132>
c010279f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01027a3:	74 45                	je     c01027ea <alloc_smap_bit+0x140>
c01027a5:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01027ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027ae:	01 d0                	add    %edx,%eax
c01027b0:	0f b6 18             	movzbl (%eax),%ebx
c01027b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01027b6:	ba 01 00 00 00       	mov    $0x1,%edx
c01027bb:	89 c1                	mov    %eax,%ecx
c01027bd:	d3 e2                	shl    %cl,%edx
c01027bf:	89 d0                	mov    %edx,%eax
c01027c1:	89 c1                	mov    %eax,%ecx
c01027c3:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01027c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027cc:	01 d0                	add    %edx,%eax
c01027ce:	09 cb                	or     %ecx,%ebx
c01027d0:	89 da                	mov    %ebx,%edx
c01027d2:	88 10                	mov    %dl,(%eax)
c01027d4:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01027d8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01027dc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01027e0:	74 09                	je     c01027eb <alloc_smap_bit+0x141>
c01027e2:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c01027e6:	7e b7                	jle    c010279f <alloc_smap_bit+0xf5>
c01027e8:	eb 01                	jmp    c01027eb <alloc_smap_bit+0x141>
c01027ea:	90                   	nop
c01027eb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01027ef:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c01027f6:	0f 8e 43 ff ff ff    	jle    c010273f <alloc_smap_bit+0x95>
c01027fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102800:	74 1e                	je     c0102820 <alloc_smap_bit+0x176>
c0102802:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102807:	83 ec 0c             	sub    $0xc,%esp
c010280a:	6a 0a                	push   $0xa
c010280c:	68 00 02 00 00       	push   $0x200
c0102811:	50                   	push   %eax
c0102812:	ff 75 d8             	pushl  -0x28(%ebp)
c0102815:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102818:	e8 c7 ef ff ff       	call   c01017e4 <rd_wt>
c010281d:	83 c4 20             	add    $0x20,%esp
c0102820:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102824:	74 12                	je     c0102838 <alloc_smap_bit+0x18e>
c0102826:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010282a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010282d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102830:	0f 8c d4 fe ff ff    	jl     c010270a <alloc_smap_bit+0x60>
c0102836:	eb 01                	jmp    c0102839 <alloc_smap_bit+0x18f>
c0102838:	90                   	nop
c0102839:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010283c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010283f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102842:	8b 00                	mov    (%eax),%eax
c0102844:	01 d0                	add    %edx,%eax
c0102846:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102849:	c9                   	leave  
c010284a:	c3                   	ret    

c010284b <new_inode>:
c010284b:	55                   	push   %ebp
c010284c:	89 e5                	mov    %esp,%ebp
c010284e:	83 ec 38             	sub    $0x38,%esp
c0102851:	83 ec 08             	sub    $0x8,%esp
c0102854:	ff 75 0c             	pushl  0xc(%ebp)
c0102857:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010285a:	50                   	push   %eax
c010285b:	e8 80 fa ff ff       	call   c01022e0 <get_inode>
c0102860:	83 c4 10             	add    $0x10,%esp
c0102863:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102866:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010286a:	75 0a                	jne    c0102876 <new_inode+0x2b>
c010286c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102871:	e9 f1 00 00 00       	jmp    c0102967 <new_inode+0x11c>
c0102876:	8b 45 10             	mov    0x10(%ebp),%eax
c0102879:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010287c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102883:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010288a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102891:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102894:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102897:	83 ec 0c             	sub    $0xc,%esp
c010289a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010289d:	50                   	push   %eax
c010289e:	e8 39 0b 00 00       	call   c01033dc <sync_inode>
c01028a3:	83 c4 10             	add    $0x10,%esp
c01028a6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01028ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01028b4:	eb 1d                	jmp    c01028d3 <new_inode+0x88>
c01028b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01028b9:	89 d0                	mov    %edx,%eax
c01028bb:	c1 e0 02             	shl    $0x2,%eax
c01028be:	01 d0                	add    %edx,%eax
c01028c0:	c1 e0 03             	shl    $0x3,%eax
c01028c3:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01028c8:	8b 00                	mov    (%eax),%eax
c01028ca:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01028cd:	74 0c                	je     c01028db <new_inode+0x90>
c01028cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01028d3:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c01028d7:	7e dd                	jle    c01028b6 <new_inode+0x6b>
c01028d9:	eb 01                	jmp    c01028dc <new_inode+0x91>
c01028db:	90                   	nop
c01028dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01028df:	89 d0                	mov    %edx,%eax
c01028e1:	c1 e0 02             	shl    $0x2,%eax
c01028e4:	01 d0                	add    %edx,%eax
c01028e6:	c1 e0 03             	shl    $0x3,%eax
c01028e9:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c01028ee:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01028f1:	89 10                	mov    %edx,(%eax)
c01028f3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01028f6:	89 50 04             	mov    %edx,0x4(%eax)
c01028f9:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01028fc:	89 50 08             	mov    %edx,0x8(%eax)
c01028ff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102902:	89 50 0c             	mov    %edx,0xc(%eax)
c0102905:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102908:	89 50 10             	mov    %edx,0x10(%eax)
c010290b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010290e:	89 50 14             	mov    %edx,0x14(%eax)
c0102911:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102914:	89 50 18             	mov    %edx,0x18(%eax)
c0102917:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010291a:	89 50 1c             	mov    %edx,0x1c(%eax)
c010291d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102920:	89 50 20             	mov    %edx,0x20(%eax)
c0102923:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102926:	89 50 24             	mov    %edx,0x24(%eax)
c0102929:	8b 45 08             	mov    0x8(%ebp),%eax
c010292c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c010292f:	89 10                	mov    %edx,(%eax)
c0102931:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102934:	89 50 04             	mov    %edx,0x4(%eax)
c0102937:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010293a:	89 50 08             	mov    %edx,0x8(%eax)
c010293d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102940:	89 50 0c             	mov    %edx,0xc(%eax)
c0102943:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102946:	89 50 10             	mov    %edx,0x10(%eax)
c0102949:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010294c:	89 50 14             	mov    %edx,0x14(%eax)
c010294f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102952:	89 50 18             	mov    %edx,0x18(%eax)
c0102955:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102958:	89 50 1c             	mov    %edx,0x1c(%eax)
c010295b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010295e:	89 50 20             	mov    %edx,0x20(%eax)
c0102961:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102964:	89 50 24             	mov    %edx,0x24(%eax)
c0102967:	c9                   	leave  
c0102968:	c3                   	ret    

c0102969 <new_dir_entry>:
c0102969:	55                   	push   %ebp
c010296a:	89 e5                	mov    %esp,%ebp
c010296c:	83 ec 48             	sub    $0x48,%esp
c010296f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102976:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102979:	8b 40 04             	mov    0x4(%eax),%eax
c010297c:	99                   	cltd   
c010297d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102980:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102983:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102986:	8b 40 0c             	mov    0xc(%eax),%eax
c0102989:	99                   	cltd   
c010298a:	f7 7d dc             	idivl  -0x24(%ebp)
c010298d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102990:	e8 2b 0c 00 00       	call   c01035c0 <get_super_block>
c0102995:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102998:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010299b:	8b 00                	mov    (%eax),%eax
c010299d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01029a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029a3:	8b 40 0c             	mov    0xc(%eax),%eax
c01029a6:	05 00 02 00 00       	add    $0x200,%eax
c01029ab:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01029b1:	85 c0                	test   %eax,%eax
c01029b3:	0f 48 c2             	cmovs  %edx,%eax
c01029b6:	c1 f8 09             	sar    $0x9,%eax
c01029b9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01029bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01029c3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01029ca:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c01029d1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01029d8:	eb 7f                	jmp    c0102a59 <new_dir_entry+0xf0>
c01029da:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01029df:	89 c1                	mov    %eax,%ecx
c01029e1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01029e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01029e7:	01 d0                	add    %edx,%eax
c01029e9:	83 ec 0c             	sub    $0xc,%esp
c01029ec:	6a 07                	push   $0x7
c01029ee:	68 00 02 00 00       	push   $0x200
c01029f3:	51                   	push   %ecx
c01029f4:	ff 75 c4             	pushl  -0x3c(%ebp)
c01029f7:	50                   	push   %eax
c01029f8:	e8 e7 ed ff ff       	call   c01017e4 <rd_wt>
c01029fd:	83 c4 20             	add    $0x20,%esp
c0102a00:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102a05:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102a08:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102a0f:	eb 25                	jmp    c0102a36 <new_dir_entry+0xcd>
c0102a11:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102a15:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a18:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102a1b:	7f 29                	jg     c0102a46 <new_dir_entry+0xdd>
c0102a1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a20:	8b 00                	mov    (%eax),%eax
c0102a22:	85 c0                	test   %eax,%eax
c0102a24:	75 08                	jne    c0102a2e <new_dir_entry+0xc5>
c0102a26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a29:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102a2c:	eb 19                	jmp    c0102a47 <new_dir_entry+0xde>
c0102a2e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102a32:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102a36:	b8 00 02 00 00       	mov    $0x200,%eax
c0102a3b:	99                   	cltd   
c0102a3c:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a3f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102a42:	7c cd                	jl     c0102a11 <new_dir_entry+0xa8>
c0102a44:	eb 01                	jmp    c0102a47 <new_dir_entry+0xde>
c0102a46:	90                   	nop
c0102a47:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a4a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102a4d:	7f 16                	jg     c0102a65 <new_dir_entry+0xfc>
c0102a4f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102a53:	75 10                	jne    c0102a65 <new_dir_entry+0xfc>
c0102a55:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102a59:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a5c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102a5f:	0f 8c 75 ff ff ff    	jl     c01029da <new_dir_entry+0x71>
c0102a65:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102a68:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102a6b:	75 0a                	jne    c0102a77 <new_dir_entry+0x10e>
c0102a6d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102a72:	e9 fc 00 00 00       	jmp    c0102b73 <new_dir_entry+0x20a>
c0102a77:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102a7e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102a82:	75 1e                	jne    c0102aa2 <new_dir_entry+0x139>
c0102a84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a87:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102a8a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a8d:	8b 50 04             	mov    0x4(%eax),%edx
c0102a90:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102a93:	01 c2                	add    %eax,%edx
c0102a95:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a98:	89 50 04             	mov    %edx,0x4(%eax)
c0102a9b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102aa5:	8b 55 14             	mov    0x14(%ebp),%edx
c0102aa8:	89 10                	mov    %edx,(%eax)
c0102aaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102aad:	83 c0 04             	add    $0x4,%eax
c0102ab0:	83 ec 08             	sub    $0x8,%esp
c0102ab3:	ff 75 10             	pushl  0x10(%ebp)
c0102ab6:	50                   	push   %eax
c0102ab7:	e8 ce 96 00 00       	call   c010c18a <Strcpy>
c0102abc:	83 c4 10             	add    $0x10,%esp
c0102abf:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ac2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102ac5:	8b 0a                	mov    (%edx),%ecx
c0102ac7:	89 08                	mov    %ecx,(%eax)
c0102ac9:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102acc:	89 48 04             	mov    %ecx,0x4(%eax)
c0102acf:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102ad2:	89 48 08             	mov    %ecx,0x8(%eax)
c0102ad5:	8b 52 0c             	mov    0xc(%edx),%edx
c0102ad8:	89 50 0c             	mov    %edx,0xc(%eax)
c0102adb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ae0:	89 c1                	mov    %eax,%ecx
c0102ae2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102ae5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102ae8:	01 d0                	add    %edx,%eax
c0102aea:	83 ec 0c             	sub    $0xc,%esp
c0102aed:	6a 0a                	push   $0xa
c0102aef:	68 00 02 00 00       	push   $0x200
c0102af4:	51                   	push   %ecx
c0102af5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102af8:	50                   	push   %eax
c0102af9:	e8 e6 ec ff ff       	call   c01017e4 <rd_wt>
c0102afe:	83 c4 20             	add    $0x20,%esp
c0102b01:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102b05:	74 69                	je     c0102b70 <new_dir_entry+0x207>
c0102b07:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b0a:	8b 10                	mov    (%eax),%edx
c0102b0c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102b12:	8b 50 04             	mov    0x4(%eax),%edx
c0102b15:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102b1b:	8b 50 08             	mov    0x8(%eax),%edx
c0102b1e:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102b24:	8b 50 0c             	mov    0xc(%eax),%edx
c0102b27:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102b2d:	8b 50 10             	mov    0x10(%eax),%edx
c0102b30:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102b36:	8b 50 14             	mov    0x14(%eax),%edx
c0102b39:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102b3f:	8b 50 18             	mov    0x18(%eax),%edx
c0102b42:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102b48:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102b4b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102b51:	8b 50 20             	mov    0x20(%eax),%edx
c0102b54:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102b5a:	8b 40 24             	mov    0x24(%eax),%eax
c0102b5d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102b62:	83 ec 0c             	sub    $0xc,%esp
c0102b65:	ff 75 0c             	pushl  0xc(%ebp)
c0102b68:	e8 6f 08 00 00       	call   c01033dc <sync_inode>
c0102b6d:	83 c4 10             	add    $0x10,%esp
c0102b70:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b73:	c9                   	leave  
c0102b74:	c3                   	ret    

c0102b75 <do_unlink>:
c0102b75:	55                   	push   %ebp
c0102b76:	89 e5                	mov    %esp,%ebp
c0102b78:	53                   	push   %ebx
c0102b79:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102b7f:	83 ec 08             	sub    $0x8,%esp
c0102b82:	ff 75 08             	pushl  0x8(%ebp)
c0102b85:	68 dd b3 10 c0       	push   $0xc010b3dd
c0102b8a:	e8 90 6c 00 00       	call   c010981f <strcmp>
c0102b8f:	83 c4 10             	add    $0x10,%esp
c0102b92:	85 c0                	test   %eax,%eax
c0102b94:	75 10                	jne    c0102ba6 <do_unlink+0x31>
c0102b96:	83 ec 0c             	sub    $0xc,%esp
c0102b99:	68 df b3 10 c0       	push   $0xc010b3df
c0102b9e:	e8 87 5c 00 00       	call   c010882a <panic>
c0102ba3:	83 c4 10             	add    $0x10,%esp
c0102ba6:	83 ec 0c             	sub    $0xc,%esp
c0102ba9:	ff 75 08             	pushl  0x8(%ebp)
c0102bac:	e8 31 f5 ff ff       	call   c01020e2 <search_file>
c0102bb1:	83 c4 10             	add    $0x10,%esp
c0102bb4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102bb7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102bbb:	75 10                	jne    c0102bcd <do_unlink+0x58>
c0102bbd:	83 ec 0c             	sub    $0xc,%esp
c0102bc0:	68 fb b3 10 c0       	push   $0xc010b3fb
c0102bc5:	e8 60 5c 00 00       	call   c010882a <panic>
c0102bca:	83 c4 10             	add    $0x10,%esp
c0102bcd:	83 ec 08             	sub    $0x8,%esp
c0102bd0:	ff 75 d0             	pushl  -0x30(%ebp)
c0102bd3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102bd9:	50                   	push   %eax
c0102bda:	e8 01 f7 ff ff       	call   c01022e0 <get_inode>
c0102bdf:	83 c4 10             	add    $0x10,%esp
c0102be2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102be5:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102be9:	75 10                	jne    c0102bfb <do_unlink+0x86>
c0102beb:	83 ec 0c             	sub    $0xc,%esp
c0102bee:	68 fb b3 10 c0       	push   $0xc010b3fb
c0102bf3:	e8 32 5c 00 00       	call   c010882a <panic>
c0102bf8:	83 c4 10             	add    $0x10,%esp
c0102bfb:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102bfe:	85 c0                	test   %eax,%eax
c0102c00:	7e 10                	jle    c0102c12 <do_unlink+0x9d>
c0102c02:	83 ec 0c             	sub    $0xc,%esp
c0102c05:	68 14 b4 10 c0       	push   $0xc010b414
c0102c0a:	e8 1b 5c 00 00       	call   c010882a <panic>
c0102c0f:	83 c4 10             	add    $0x10,%esp
c0102c12:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102c18:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102c1b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102c1e:	8d 50 07             	lea    0x7(%eax),%edx
c0102c21:	85 c0                	test   %eax,%eax
c0102c23:	0f 48 c2             	cmovs  %edx,%eax
c0102c26:	c1 f8 03             	sar    $0x3,%eax
c0102c29:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102c2c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102c2f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102c35:	85 c0                	test   %eax,%eax
c0102c37:	0f 48 c2             	cmovs  %edx,%eax
c0102c3a:	c1 f8 09             	sar    $0x9,%eax
c0102c3d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102c40:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102c43:	99                   	cltd   
c0102c44:	c1 ea 1d             	shr    $0x1d,%edx
c0102c47:	01 d0                	add    %edx,%eax
c0102c49:	83 e0 07             	and    $0x7,%eax
c0102c4c:	29 d0                	sub    %edx,%eax
c0102c4e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102c51:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102c58:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c5d:	89 c2                	mov    %eax,%edx
c0102c5f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102c62:	83 c0 02             	add    $0x2,%eax
c0102c65:	83 ec 0c             	sub    $0xc,%esp
c0102c68:	6a 07                	push   $0x7
c0102c6a:	68 00 02 00 00       	push   $0x200
c0102c6f:	52                   	push   %edx
c0102c70:	ff 75 b8             	pushl  -0x48(%ebp)
c0102c73:	50                   	push   %eax
c0102c74:	e8 6b eb ff ff       	call   c01017e4 <rd_wt>
c0102c79:	83 c4 20             	add    $0x20,%esp
c0102c7c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102c82:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102c85:	01 d0                	add    %edx,%eax
c0102c87:	0f b6 10             	movzbl (%eax),%edx
c0102c8a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102c8d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102c92:	89 c1                	mov    %eax,%ecx
c0102c94:	d3 e3                	shl    %cl,%ebx
c0102c96:	89 d8                	mov    %ebx,%eax
c0102c98:	f7 d0                	not    %eax
c0102c9a:	89 c3                	mov    %eax,%ebx
c0102c9c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102ca2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102ca5:	01 c8                	add    %ecx,%eax
c0102ca7:	21 da                	and    %ebx,%edx
c0102ca9:	88 10                	mov    %dl,(%eax)
c0102cab:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102cb0:	89 c2                	mov    %eax,%edx
c0102cb2:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102cb5:	83 c0 02             	add    $0x2,%eax
c0102cb8:	83 ec 0c             	sub    $0xc,%esp
c0102cbb:	6a 0a                	push   $0xa
c0102cbd:	68 00 02 00 00       	push   $0x200
c0102cc2:	52                   	push   %edx
c0102cc3:	ff 75 b8             	pushl  -0x48(%ebp)
c0102cc6:	50                   	push   %eax
c0102cc7:	e8 18 eb ff ff       	call   c01017e4 <rd_wt>
c0102ccc:	83 c4 20             	add    $0x20,%esp
c0102ccf:	e8 ec 08 00 00       	call   c01035c0 <get_super_block>
c0102cd4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102cd7:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102cdd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102ce0:	8b 00                	mov    (%eax),%eax
c0102ce2:	29 c2                	sub    %eax,%edx
c0102ce4:	89 d0                	mov    %edx,%eax
c0102ce6:	83 c0 01             	add    $0x1,%eax
c0102ce9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102cec:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102cef:	8d 50 07             	lea    0x7(%eax),%edx
c0102cf2:	85 c0                	test   %eax,%eax
c0102cf4:	0f 48 c2             	cmovs  %edx,%eax
c0102cf7:	c1 f8 03             	sar    $0x3,%eax
c0102cfa:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102cfd:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102d00:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102d06:	85 c0                	test   %eax,%eax
c0102d08:	0f 48 c2             	cmovs  %edx,%eax
c0102d0b:	c1 f8 09             	sar    $0x9,%eax
c0102d0e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102d11:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102d14:	99                   	cltd   
c0102d15:	c1 ea 1d             	shr    $0x1d,%edx
c0102d18:	01 d0                	add    %edx,%eax
c0102d1a:	83 e0 07             	and    $0x7,%eax
c0102d1d:	29 d0                	sub    %edx,%eax
c0102d1f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102d22:	b8 08 00 00 00       	mov    $0x8,%eax
c0102d27:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102d2a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102d2d:	29 c2                	sub    %eax,%edx
c0102d2f:	89 d0                	mov    %edx,%eax
c0102d31:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102d34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d37:	8d 50 07             	lea    0x7(%eax),%edx
c0102d3a:	85 c0                	test   %eax,%eax
c0102d3c:	0f 48 c2             	cmovs  %edx,%eax
c0102d3f:	c1 f8 03             	sar    $0x3,%eax
c0102d42:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102d45:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d4a:	89 c1                	mov    %eax,%ecx
c0102d4c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102d4f:	8b 40 04             	mov    0x4(%eax),%eax
c0102d52:	8d 50 02             	lea    0x2(%eax),%edx
c0102d55:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102d58:	01 d0                	add    %edx,%eax
c0102d5a:	83 ec 0c             	sub    $0xc,%esp
c0102d5d:	6a 07                	push   $0x7
c0102d5f:	68 00 02 00 00       	push   $0x200
c0102d64:	51                   	push   %ecx
c0102d65:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d68:	50                   	push   %eax
c0102d69:	e8 76 ea ff ff       	call   c01017e4 <rd_wt>
c0102d6e:	83 c4 20             	add    $0x20,%esp
c0102d71:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d77:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102d7a:	01 d0                	add    %edx,%eax
c0102d7c:	0f b6 10             	movzbl (%eax),%edx
c0102d7f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102d82:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102d87:	89 c1                	mov    %eax,%ecx
c0102d89:	d3 e3                	shl    %cl,%ebx
c0102d8b:	89 d8                	mov    %ebx,%eax
c0102d8d:	f7 d0                	not    %eax
c0102d8f:	89 c3                	mov    %eax,%ebx
c0102d91:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102d97:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102d9a:	01 c8                	add    %ecx,%eax
c0102d9c:	21 da                	and    %ebx,%edx
c0102d9e:	88 10                	mov    %dl,(%eax)
c0102da0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102da7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102daa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102dad:	eb 6b                	jmp    c0102e1a <do_unlink+0x2a5>
c0102daf:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102db6:	75 4c                	jne    c0102e04 <do_unlink+0x28f>
c0102db8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102dbf:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102dc4:	83 ec 0c             	sub    $0xc,%esp
c0102dc7:	6a 0a                	push   $0xa
c0102dc9:	68 00 02 00 00       	push   $0x200
c0102dce:	50                   	push   %eax
c0102dcf:	ff 75 b8             	pushl  -0x48(%ebp)
c0102dd2:	ff 75 ec             	pushl  -0x14(%ebp)
c0102dd5:	e8 0a ea ff ff       	call   c01017e4 <rd_wt>
c0102dda:	83 c4 20             	add    $0x20,%esp
c0102ddd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102de2:	89 c1                	mov    %eax,%ecx
c0102de4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102de7:	8d 50 01             	lea    0x1(%eax),%edx
c0102dea:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102ded:	83 ec 0c             	sub    $0xc,%esp
c0102df0:	6a 07                	push   $0x7
c0102df2:	68 00 02 00 00       	push   $0x200
c0102df7:	51                   	push   %ecx
c0102df8:	ff 75 b8             	pushl  -0x48(%ebp)
c0102dfb:	50                   	push   %eax
c0102dfc:	e8 e3 e9 ff ff       	call   c01017e4 <rd_wt>
c0102e01:	83 c4 20             	add    $0x20,%esp
c0102e04:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102e0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e0d:	01 d0                	add    %edx,%eax
c0102e0f:	c6 00 00             	movb   $0x0,(%eax)
c0102e12:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102e16:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102e1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e1d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102e20:	7c 8d                	jl     c0102daf <do_unlink+0x23a>
c0102e22:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102e29:	75 4c                	jne    c0102e77 <do_unlink+0x302>
c0102e2b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102e32:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e37:	83 ec 0c             	sub    $0xc,%esp
c0102e3a:	6a 0a                	push   $0xa
c0102e3c:	68 00 02 00 00       	push   $0x200
c0102e41:	50                   	push   %eax
c0102e42:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e45:	ff 75 ec             	pushl  -0x14(%ebp)
c0102e48:	e8 97 e9 ff ff       	call   c01017e4 <rd_wt>
c0102e4d:	83 c4 20             	add    $0x20,%esp
c0102e50:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e55:	89 c1                	mov    %eax,%ecx
c0102e57:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102e5a:	8d 50 01             	lea    0x1(%eax),%edx
c0102e5d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102e60:	83 ec 0c             	sub    $0xc,%esp
c0102e63:	6a 07                	push   $0x7
c0102e65:	68 00 02 00 00       	push   $0x200
c0102e6a:	51                   	push   %ecx
c0102e6b:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e6e:	50                   	push   %eax
c0102e6f:	e8 70 e9 ff ff       	call   c01017e4 <rd_wt>
c0102e74:	83 c4 20             	add    $0x20,%esp
c0102e77:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102e7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e80:	01 d0                	add    %edx,%eax
c0102e82:	0f b6 10             	movzbl (%eax),%edx
c0102e85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e88:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102e8d:	89 c1                	mov    %eax,%ecx
c0102e8f:	d3 e3                	shl    %cl,%ebx
c0102e91:	89 d8                	mov    %ebx,%eax
c0102e93:	89 c3                	mov    %eax,%ebx
c0102e95:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102e9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e9e:	01 c8                	add    %ecx,%eax
c0102ea0:	21 da                	and    %ebx,%edx
c0102ea2:	88 10                	mov    %dl,(%eax)
c0102ea4:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ea9:	83 ec 0c             	sub    $0xc,%esp
c0102eac:	6a 0a                	push   $0xa
c0102eae:	68 00 02 00 00       	push   $0x200
c0102eb3:	50                   	push   %eax
c0102eb4:	ff 75 b8             	pushl  -0x48(%ebp)
c0102eb7:	ff 75 ec             	pushl  -0x14(%ebp)
c0102eba:	e8 25 e9 ff ff       	call   c01017e4 <rd_wt>
c0102ebf:	83 c4 20             	add    $0x20,%esp
c0102ec2:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102ec9:	00 00 00 
c0102ecc:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102ed3:	00 00 00 
c0102ed6:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102edd:	00 00 00 
c0102ee0:	83 ec 0c             	sub    $0xc,%esp
c0102ee3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102ee9:	50                   	push   %eax
c0102eea:	e8 ed 04 00 00       	call   c01033dc <sync_inode>
c0102eef:	83 c4 10             	add    $0x10,%esp
c0102ef2:	83 ec 0c             	sub    $0xc,%esp
c0102ef5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102efb:	50                   	push   %eax
c0102efc:	e8 2f 06 00 00       	call   c0103530 <put_inode>
c0102f01:	83 c4 10             	add    $0x10,%esp
c0102f04:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102f07:	8b 00                	mov    (%eax),%eax
c0102f09:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102f0c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102f13:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102f16:	8b 40 04             	mov    0x4(%eax),%eax
c0102f19:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102f1c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102f1f:	8b 40 0c             	mov    0xc(%eax),%eax
c0102f22:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102f25:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102f28:	c1 e8 04             	shr    $0x4,%eax
c0102f2b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102f2e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102f35:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102f3c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102f43:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0102f4a:	e9 a5 00 00 00       	jmp    c0102ff4 <do_unlink+0x47f>
c0102f4f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f54:	89 c1                	mov    %eax,%ecx
c0102f56:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102f59:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102f5c:	01 d0                	add    %edx,%eax
c0102f5e:	83 ec 0c             	sub    $0xc,%esp
c0102f61:	6a 07                	push   $0x7
c0102f63:	68 00 02 00 00       	push   $0x200
c0102f68:	51                   	push   %ecx
c0102f69:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f6c:	50                   	push   %eax
c0102f6d:	e8 72 e8 ff ff       	call   c01017e4 <rd_wt>
c0102f72:	83 c4 20             	add    $0x20,%esp
c0102f75:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102f7a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102f7d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0102f84:	eb 51                	jmp    c0102fd7 <do_unlink+0x462>
c0102f86:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102f8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f8d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f90:	7f 4f                	jg     c0102fe1 <do_unlink+0x46c>
c0102f92:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102f95:	83 c0 10             	add    $0x10,%eax
c0102f98:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102f9b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0102f9e:	83 c0 04             	add    $0x4,%eax
c0102fa1:	83 ec 08             	sub    $0x8,%esp
c0102fa4:	ff 75 08             	pushl  0x8(%ebp)
c0102fa7:	50                   	push   %eax
c0102fa8:	e8 72 68 00 00       	call   c010981f <strcmp>
c0102fad:	83 c4 10             	add    $0x10,%esp
c0102fb0:	85 c0                	test   %eax,%eax
c0102fb2:	75 1b                	jne    c0102fcf <do_unlink+0x45a>
c0102fb4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0102fbb:	83 ec 04             	sub    $0x4,%esp
c0102fbe:	6a 10                	push   $0x10
c0102fc0:	6a 00                	push   $0x0
c0102fc2:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102fc5:	e8 a1 91 00 00       	call   c010c16b <Memset>
c0102fca:	83 c4 10             	add    $0x10,%esp
c0102fcd:	eb 13                	jmp    c0102fe2 <do_unlink+0x46d>
c0102fcf:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0102fd3:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0102fd7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102fda:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102fdd:	7c a7                	jl     c0102f86 <do_unlink+0x411>
c0102fdf:	eb 01                	jmp    c0102fe2 <do_unlink+0x46d>
c0102fe1:	90                   	nop
c0102fe2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102fe5:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102fe8:	7f 16                	jg     c0103000 <do_unlink+0x48b>
c0102fea:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102fee:	75 10                	jne    c0103000 <do_unlink+0x48b>
c0102ff0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0102ff4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102ff7:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102ffa:	0f 8c 4f ff ff ff    	jl     c0102f4f <do_unlink+0x3da>
c0103000:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103003:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103006:	75 17                	jne    c010301f <do_unlink+0x4aa>
c0103008:	8b 45 98             	mov    -0x68(%ebp),%eax
c010300b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010300e:	89 50 04             	mov    %edx,0x4(%eax)
c0103011:	83 ec 0c             	sub    $0xc,%esp
c0103014:	ff 75 98             	pushl  -0x68(%ebp)
c0103017:	e8 c0 03 00 00       	call   c01033dc <sync_inode>
c010301c:	83 c4 10             	add    $0x10,%esp
c010301f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0103023:	74 26                	je     c010304b <do_unlink+0x4d6>
c0103025:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010302a:	89 c1                	mov    %eax,%ecx
c010302c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c010302f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103032:	01 d0                	add    %edx,%eax
c0103034:	83 ec 0c             	sub    $0xc,%esp
c0103037:	6a 0a                	push   $0xa
c0103039:	68 00 02 00 00       	push   $0x200
c010303e:	51                   	push   %ecx
c010303f:	ff 75 b8             	pushl  -0x48(%ebp)
c0103042:	50                   	push   %eax
c0103043:	e8 9c e7 ff ff       	call   c01017e4 <rd_wt>
c0103048:	83 c4 20             	add    $0x20,%esp
c010304b:	90                   	nop
c010304c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010304f:	c9                   	leave  
c0103050:	c3                   	ret    

c0103051 <do_rdwt>:
c0103051:	55                   	push   %ebp
c0103052:	89 e5                	mov    %esp,%ebp
c0103054:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010305a:	8b 45 08             	mov    0x8(%ebp),%eax
c010305d:	8b 40 78             	mov    0x78(%eax),%eax
c0103060:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103063:	8b 45 08             	mov    0x8(%ebp),%eax
c0103066:	8b 40 60             	mov    0x60(%eax),%eax
c0103069:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010306c:	8b 45 08             	mov    0x8(%ebp),%eax
c010306f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103072:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103075:	8b 45 08             	mov    0x8(%ebp),%eax
c0103078:	8b 00                	mov    (%eax),%eax
c010307a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010307d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103080:	8b 40 10             	mov    0x10(%eax),%eax
c0103083:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103086:	8b 45 08             	mov    0x8(%ebp),%eax
c0103089:	8b 40 50             	mov    0x50(%eax),%eax
c010308c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010308f:	83 ec 0c             	sub    $0xc,%esp
c0103092:	ff 75 d0             	pushl  -0x30(%ebp)
c0103095:	e8 0c 07 00 00       	call   c01037a6 <pid2proc>
c010309a:	83 c4 10             	add    $0x10,%esp
c010309d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01030a0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01030a3:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01030a6:	83 c2 4c             	add    $0x4c,%edx
c01030a9:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01030ad:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01030b0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01030b3:	8b 40 08             	mov    0x8(%eax),%eax
c01030b6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01030b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01030bc:	8b 00                	mov    (%eax),%eax
c01030be:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01030c1:	83 ec 08             	sub    $0x8,%esp
c01030c4:	ff 75 bc             	pushl  -0x44(%ebp)
c01030c7:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01030cd:	50                   	push   %eax
c01030ce:	e8 0d f2 ff ff       	call   c01022e0 <get_inode>
c01030d3:	83 c4 10             	add    $0x10,%esp
c01030d6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01030d9:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c01030dd:	75 10                	jne    c01030ef <do_rdwt+0x9e>
c01030df:	83 ec 0c             	sub    $0xc,%esp
c01030e2:	68 4c b4 10 c0       	push   $0xc010b44c
c01030e7:	e8 3e 57 00 00       	call   c010882a <panic>
c01030ec:	83 c4 10             	add    $0x10,%esp
c01030ef:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01030f5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01030f8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01030fb:	8b 40 04             	mov    0x4(%eax),%eax
c01030fe:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103101:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103105:	74 22                	je     c0103129 <do_rdwt+0xd8>
c0103107:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010310b:	74 1c                	je     c0103129 <do_rdwt+0xd8>
c010310d:	68 a8 04 00 00       	push   $0x4a8
c0103112:	68 b8 b2 10 c0       	push   $0xc010b2b8
c0103117:	68 b8 b2 10 c0       	push   $0xc010b2b8
c010311c:	68 5c b4 10 c0       	push   $0xc010b45c
c0103121:	e8 22 57 00 00       	call   c0108848 <assertion_failure>
c0103126:	83 c4 10             	add    $0x10,%esp
c0103129:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c010312f:	83 f8 01             	cmp    $0x1,%eax
c0103132:	0f 85 86 00 00 00    	jne    c01031be <do_rdwt+0x16d>
c0103138:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010313c:	75 09                	jne    c0103147 <do_rdwt+0xf6>
c010313e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103145:	eb 0d                	jmp    c0103154 <do_rdwt+0x103>
c0103147:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010314b:	75 07                	jne    c0103154 <do_rdwt+0x103>
c010314d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103154:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103157:	8b 45 08             	mov    0x8(%ebp),%eax
c010315a:	89 50 78             	mov    %edx,0x78(%eax)
c010315d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103160:	8b 45 08             	mov    0x8(%ebp),%eax
c0103163:	89 50 68             	mov    %edx,0x68(%eax)
c0103166:	83 ec 04             	sub    $0x4,%esp
c0103169:	6a 04                	push   $0x4
c010316b:	ff 75 08             	pushl  0x8(%ebp)
c010316e:	6a 03                	push   $0x3
c0103170:	e8 43 63 00 00       	call   c01094b8 <send_rec>
c0103175:	83 c4 10             	add    $0x10,%esp
c0103178:	8b 45 08             	mov    0x8(%ebp),%eax
c010317b:	8b 40 78             	mov    0x78(%eax),%eax
c010317e:	83 f8 66             	cmp    $0x66,%eax
c0103181:	75 13                	jne    c0103196 <do_rdwt+0x145>
c0103183:	83 ec 04             	sub    $0x4,%esp
c0103186:	ff 75 b8             	pushl  -0x48(%ebp)
c0103189:	ff 75 08             	pushl  0x8(%ebp)
c010318c:	6a 01                	push   $0x1
c010318e:	e8 25 63 00 00       	call   c01094b8 <send_rec>
c0103193:	83 c4 10             	add    $0x10,%esp
c0103196:	8b 45 08             	mov    0x8(%ebp),%eax
c0103199:	8b 40 78             	mov    0x78(%eax),%eax
c010319c:	83 f8 65             	cmp    $0x65,%eax
c010319f:	75 13                	jne    c01031b4 <do_rdwt+0x163>
c01031a1:	83 ec 04             	sub    $0x4,%esp
c01031a4:	ff 75 b8             	pushl  -0x48(%ebp)
c01031a7:	ff 75 08             	pushl  0x8(%ebp)
c01031aa:	6a 01                	push   $0x1
c01031ac:	e8 07 63 00 00       	call   c01094b8 <send_rec>
c01031b1:	83 c4 10             	add    $0x10,%esp
c01031b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01031b9:	e9 1c 02 00 00       	jmp    c01033da <do_rdwt+0x389>
c01031be:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01031c2:	75 18                	jne    c01031dc <do_rdwt+0x18b>
c01031c4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01031ca:	c1 e0 09             	shl    $0x9,%eax
c01031cd:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c01031d0:	75 0a                	jne    c01031dc <do_rdwt+0x18b>
c01031d2:	b8 00 00 00 00       	mov    $0x0,%eax
c01031d7:	e9 fe 01 00 00       	jmp    c01033da <do_rdwt+0x389>
c01031dc:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01031e0:	75 14                	jne    c01031f6 <do_rdwt+0x1a5>
c01031e2:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01031e5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01031e8:	01 d0                	add    %edx,%eax
c01031ea:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01031ed:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c01031f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01031f4:	eb 19                	jmp    c010320f <do_rdwt+0x1be>
c01031f6:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01031f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01031fc:	01 c2                	add    %eax,%edx
c01031fe:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103204:	c1 e0 09             	shl    $0x9,%eax
c0103207:	39 c2                	cmp    %eax,%edx
c0103209:	0f 4e c2             	cmovle %edx,%eax
c010320c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010320f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103212:	99                   	cltd   
c0103213:	c1 ea 17             	shr    $0x17,%edx
c0103216:	01 d0                	add    %edx,%eax
c0103218:	25 ff 01 00 00       	and    $0x1ff,%eax
c010321d:	29 d0                	sub    %edx,%eax
c010321f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103222:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103228:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010322b:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103231:	85 c0                	test   %eax,%eax
c0103233:	0f 48 c1             	cmovs  %ecx,%eax
c0103236:	c1 f8 09             	sar    $0x9,%eax
c0103239:	01 d0                	add    %edx,%eax
c010323b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010323e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103244:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103247:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010324d:	85 c0                	test   %eax,%eax
c010324f:	0f 48 c1             	cmovs  %ecx,%eax
c0103252:	c1 f8 09             	sar    $0x9,%eax
c0103255:	01 d0                	add    %edx,%eax
c0103257:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010325a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010325d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103260:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103265:	39 d0                	cmp    %edx,%eax
c0103267:	7d 0b                	jge    c0103274 <do_rdwt+0x223>
c0103269:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010326c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010326f:	83 c0 01             	add    $0x1,%eax
c0103272:	eb 05                	jmp    c0103279 <do_rdwt+0x228>
c0103274:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103279:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010327c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010327f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103282:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103289:	8b 45 08             	mov    0x8(%ebp),%eax
c010328c:	8b 00                	mov    (%eax),%eax
c010328e:	83 ec 0c             	sub    $0xc,%esp
c0103291:	50                   	push   %eax
c0103292:	e8 0f 05 00 00       	call   c01037a6 <pid2proc>
c0103297:	83 c4 10             	add    $0x10,%esp
c010329a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010329d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032a0:	83 ec 08             	sub    $0x8,%esp
c01032a3:	50                   	push   %eax
c01032a4:	ff 75 cc             	pushl  -0x34(%ebp)
c01032a7:	e8 43 2b 00 00       	call   c0105def <alloc_virtual_memory>
c01032ac:	83 c4 10             	add    $0x10,%esp
c01032af:	89 45 98             	mov    %eax,-0x68(%ebp)
c01032b2:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01032b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01032b8:	e9 c5 00 00 00       	jmp    c0103382 <do_rdwt+0x331>
c01032bd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01032c0:	c1 e0 09             	shl    $0x9,%eax
c01032c3:	2b 45 ec             	sub    -0x14(%ebp),%eax
c01032c6:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c01032c9:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c01032cd:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01032d0:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c01032d7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01032db:	75 46                	jne    c0103323 <do_rdwt+0x2d2>
c01032dd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01032e0:	c1 e0 09             	shl    $0x9,%eax
c01032e3:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01032e9:	83 ec 0c             	sub    $0xc,%esp
c01032ec:	6a 07                	push   $0x7
c01032ee:	50                   	push   %eax
c01032ef:	52                   	push   %edx
c01032f0:	ff 75 90             	pushl  -0x70(%ebp)
c01032f3:	ff 75 e0             	pushl  -0x20(%ebp)
c01032f6:	e8 e9 e4 ff ff       	call   c01017e4 <rd_wt>
c01032fb:	83 c4 20             	add    $0x20,%esp
c01032fe:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103304:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103307:	01 d0                	add    %edx,%eax
c0103309:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010330c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010330f:	01 ca                	add    %ecx,%edx
c0103311:	83 ec 04             	sub    $0x4,%esp
c0103314:	ff 75 94             	pushl  -0x6c(%ebp)
c0103317:	50                   	push   %eax
c0103318:	52                   	push   %edx
c0103319:	e8 3e 39 00 00       	call   c0106c5c <Memcpy>
c010331e:	83 c4 10             	add    $0x10,%esp
c0103321:	eb 46                	jmp    c0103369 <do_rdwt+0x318>
c0103323:	8b 55 98             	mov    -0x68(%ebp),%edx
c0103326:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103329:	01 d0                	add    %edx,%eax
c010332b:	89 c1                	mov    %eax,%ecx
c010332d:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103333:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103336:	01 d0                	add    %edx,%eax
c0103338:	83 ec 04             	sub    $0x4,%esp
c010333b:	ff 75 94             	pushl  -0x6c(%ebp)
c010333e:	51                   	push   %ecx
c010333f:	50                   	push   %eax
c0103340:	e8 17 39 00 00       	call   c0106c5c <Memcpy>
c0103345:	83 c4 10             	add    $0x10,%esp
c0103348:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010334b:	c1 e0 09             	shl    $0x9,%eax
c010334e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103354:	83 ec 0c             	sub    $0xc,%esp
c0103357:	6a 0a                	push   $0xa
c0103359:	50                   	push   %eax
c010335a:	52                   	push   %edx
c010335b:	ff 75 90             	pushl  -0x70(%ebp)
c010335e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103361:	e8 7e e4 ff ff       	call   c01017e4 <rd_wt>
c0103366:	83 c4 20             	add    $0x20,%esp
c0103369:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010336c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010336f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103372:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103375:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010337c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010337f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103382:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103385:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103388:	7f 0a                	jg     c0103394 <do_rdwt+0x343>
c010338a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010338e:	0f 85 29 ff ff ff    	jne    c01032bd <do_rdwt+0x26c>
c0103394:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103397:	8b 50 04             	mov    0x4(%eax),%edx
c010339a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010339d:	01 c2                	add    %eax,%edx
c010339f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01033a2:	89 50 04             	mov    %edx,0x4(%eax)
c01033a5:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01033a8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033ab:	01 c2                	add    %eax,%edx
c01033ad:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01033b3:	39 c2                	cmp    %eax,%edx
c01033b5:	7e 20                	jle    c01033d7 <do_rdwt+0x386>
c01033b7:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01033ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033bd:	01 d0                	add    %edx,%eax
c01033bf:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01033c5:	83 ec 0c             	sub    $0xc,%esp
c01033c8:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01033ce:	50                   	push   %eax
c01033cf:	e8 08 00 00 00       	call   c01033dc <sync_inode>
c01033d4:	83 c4 10             	add    $0x10,%esp
c01033d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01033da:	c9                   	leave  
c01033db:	c3                   	ret    

c01033dc <sync_inode>:
c01033dc:	55                   	push   %ebp
c01033dd:	89 e5                	mov    %esp,%ebp
c01033df:	53                   	push   %ebx
c01033e0:	83 ec 34             	sub    $0x34,%esp
c01033e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01033ea:	eb 74                	jmp    c0103460 <sync_inode+0x84>
c01033ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01033ef:	89 d0                	mov    %edx,%eax
c01033f1:	c1 e0 02             	shl    $0x2,%eax
c01033f4:	01 d0                	add    %edx,%eax
c01033f6:	c1 e0 03             	shl    $0x3,%eax
c01033f9:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01033fe:	8b 10                	mov    (%eax),%edx
c0103400:	8b 45 08             	mov    0x8(%ebp),%eax
c0103403:	8b 40 10             	mov    0x10(%eax),%eax
c0103406:	39 c2                	cmp    %eax,%edx
c0103408:	75 52                	jne    c010345c <sync_inode+0x80>
c010340a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010340d:	89 d0                	mov    %edx,%eax
c010340f:	c1 e0 02             	shl    $0x2,%eax
c0103412:	01 d0                	add    %edx,%eax
c0103414:	c1 e0 03             	shl    $0x3,%eax
c0103417:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c010341d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103420:	8b 08                	mov    (%eax),%ecx
c0103422:	89 0a                	mov    %ecx,(%edx)
c0103424:	8b 48 04             	mov    0x4(%eax),%ecx
c0103427:	89 4a 04             	mov    %ecx,0x4(%edx)
c010342a:	8b 48 08             	mov    0x8(%eax),%ecx
c010342d:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103430:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103433:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103436:	8b 48 10             	mov    0x10(%eax),%ecx
c0103439:	89 4a 10             	mov    %ecx,0x10(%edx)
c010343c:	8b 48 14             	mov    0x14(%eax),%ecx
c010343f:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103442:	8b 48 18             	mov    0x18(%eax),%ecx
c0103445:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103448:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010344b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010344e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103451:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103454:	8b 40 24             	mov    0x24(%eax),%eax
c0103457:	89 42 24             	mov    %eax,0x24(%edx)
c010345a:	eb 0a                	jmp    c0103466 <sync_inode+0x8a>
c010345c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103460:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103464:	7e 86                	jle    c01033ec <sync_inode+0x10>
c0103466:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010346d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103470:	8b 40 10             	mov    0x10(%eax),%eax
c0103473:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103476:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103479:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010347c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103481:	99                   	cltd   
c0103482:	f7 7d f0             	idivl  -0x10(%ebp)
c0103485:	89 c3                	mov    %eax,%ebx
c0103487:	89 c8                	mov    %ecx,%eax
c0103489:	99                   	cltd   
c010348a:	f7 fb                	idiv   %ebx
c010348c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010348f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103492:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103495:	b8 00 02 00 00       	mov    $0x200,%eax
c010349a:	99                   	cltd   
c010349b:	f7 7d f0             	idivl  -0x10(%ebp)
c010349e:	89 c3                	mov    %eax,%ebx
c01034a0:	89 c8                	mov    %ecx,%eax
c01034a2:	99                   	cltd   
c01034a3:	f7 fb                	idiv   %ebx
c01034a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01034a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01034ab:	8b 40 20             	mov    0x20(%eax),%eax
c01034ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01034b1:	e8 0a 01 00 00       	call   c01035c0 <get_super_block>
c01034b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01034b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01034bc:	8b 40 04             	mov    0x4(%eax),%eax
c01034bf:	8d 50 02             	lea    0x2(%eax),%edx
c01034c2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01034c5:	8b 40 08             	mov    0x8(%eax),%eax
c01034c8:	01 c2                	add    %eax,%edx
c01034ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01034cd:	01 d0                	add    %edx,%eax
c01034cf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01034d2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01034d7:	83 ec 0c             	sub    $0xc,%esp
c01034da:	6a 07                	push   $0x7
c01034dc:	68 00 02 00 00       	push   $0x200
c01034e1:	50                   	push   %eax
c01034e2:	ff 75 e0             	pushl  -0x20(%ebp)
c01034e5:	ff 75 d8             	pushl  -0x28(%ebp)
c01034e8:	e8 f7 e2 ff ff       	call   c01017e4 <rd_wt>
c01034ed:	83 c4 20             	add    $0x20,%esp
c01034f0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01034f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01034f8:	83 ec 04             	sub    $0x4,%esp
c01034fb:	ff 75 f0             	pushl  -0x10(%ebp)
c01034fe:	ff 75 08             	pushl  0x8(%ebp)
c0103501:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103504:	e8 53 37 00 00       	call   c0106c5c <Memcpy>
c0103509:	83 c4 10             	add    $0x10,%esp
c010350c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103511:	83 ec 0c             	sub    $0xc,%esp
c0103514:	6a 0a                	push   $0xa
c0103516:	68 00 02 00 00       	push   $0x200
c010351b:	50                   	push   %eax
c010351c:	ff 75 e0             	pushl  -0x20(%ebp)
c010351f:	ff 75 d8             	pushl  -0x28(%ebp)
c0103522:	e8 bd e2 ff ff       	call   c01017e4 <rd_wt>
c0103527:	83 c4 20             	add    $0x20,%esp
c010352a:	90                   	nop
c010352b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010352e:	c9                   	leave  
c010352f:	c3                   	ret    

c0103530 <put_inode>:
c0103530:	55                   	push   %ebp
c0103531:	89 e5                	mov    %esp,%ebp
c0103533:	83 ec 08             	sub    $0x8,%esp
c0103536:	8b 45 08             	mov    0x8(%ebp),%eax
c0103539:	8b 40 24             	mov    0x24(%eax),%eax
c010353c:	85 c0                	test   %eax,%eax
c010353e:	7f 1c                	jg     c010355c <put_inode+0x2c>
c0103540:	68 4d 05 00 00       	push   $0x54d
c0103545:	68 b8 b2 10 c0       	push   $0xc010b2b8
c010354a:	68 b8 b2 10 c0       	push   $0xc010b2b8
c010354f:	68 90 b4 10 c0       	push   $0xc010b490
c0103554:	e8 ef 52 00 00       	call   c0108848 <assertion_failure>
c0103559:	83 c4 10             	add    $0x10,%esp
c010355c:	8b 45 08             	mov    0x8(%ebp),%eax
c010355f:	8b 40 24             	mov    0x24(%eax),%eax
c0103562:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103565:	8b 45 08             	mov    0x8(%ebp),%eax
c0103568:	89 50 24             	mov    %edx,0x24(%eax)
c010356b:	90                   	nop
c010356c:	c9                   	leave  
c010356d:	c3                   	ret    

c010356e <do_close>:
c010356e:	55                   	push   %ebp
c010356f:	89 e5                	mov    %esp,%ebp
c0103571:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103576:	8b 55 08             	mov    0x8(%ebp),%edx
c0103579:	83 c2 4c             	add    $0x4c,%edx
c010357c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103580:	8b 50 0c             	mov    0xc(%eax),%edx
c0103583:	83 ea 01             	sub    $0x1,%edx
c0103586:	89 50 0c             	mov    %edx,0xc(%eax)
c0103589:	8b 40 0c             	mov    0xc(%eax),%eax
c010358c:	85 c0                	test   %eax,%eax
c010358e:	75 16                	jne    c01035a6 <do_close+0x38>
c0103590:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103595:	8b 55 08             	mov    0x8(%ebp),%edx
c0103598:	83 c2 4c             	add    $0x4c,%edx
c010359b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010359f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01035a6:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01035ab:	8b 55 08             	mov    0x8(%ebp),%edx
c01035ae:	83 c2 4c             	add    $0x4c,%edx
c01035b1:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c01035b8:	00 
c01035b9:	b8 00 00 00 00       	mov    $0x0,%eax
c01035be:	5d                   	pop    %ebp
c01035bf:	c3                   	ret    

c01035c0 <get_super_block>:
c01035c0:	55                   	push   %ebp
c01035c1:	89 e5                	mov    %esp,%ebp
c01035c3:	83 ec 08             	sub    $0x8,%esp
c01035c6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01035cb:	83 ec 0c             	sub    $0xc,%esp
c01035ce:	6a 07                	push   $0x7
c01035d0:	68 00 02 00 00       	push   $0x200
c01035d5:	50                   	push   %eax
c01035d6:	6a 20                	push   $0x20
c01035d8:	6a 01                	push   $0x1
c01035da:	e8 05 e2 ff ff       	call   c01017e4 <rd_wt>
c01035df:	83 c4 20             	add    $0x20,%esp
c01035e2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01035e8:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01035ed:	8b 0a                	mov    (%edx),%ecx
c01035ef:	89 08                	mov    %ecx,(%eax)
c01035f1:	8b 4a 04             	mov    0x4(%edx),%ecx
c01035f4:	89 48 04             	mov    %ecx,0x4(%eax)
c01035f7:	8b 4a 08             	mov    0x8(%edx),%ecx
c01035fa:	89 48 08             	mov    %ecx,0x8(%eax)
c01035fd:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103600:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103603:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103606:	89 48 10             	mov    %ecx,0x10(%eax)
c0103609:	8b 4a 14             	mov    0x14(%edx),%ecx
c010360c:	89 48 14             	mov    %ecx,0x14(%eax)
c010360f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0103612:	89 48 18             	mov    %ecx,0x18(%eax)
c0103615:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0103618:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010361b:	8b 52 20             	mov    0x20(%edx),%edx
c010361e:	89 50 20             	mov    %edx,0x20(%eax)
c0103621:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0103626:	c9                   	leave  
c0103627:	c3                   	ret    

c0103628 <schedule_process>:
c0103628:	55                   	push   %ebp
c0103629:	89 e5                	mov    %esp,%ebp
c010362b:	83 ec 18             	sub    $0x18,%esp
c010362e:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103635:	e8 af cd ff ff       	call   c01003e9 <get_running_thread_pcb>
c010363a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010363d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103640:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103647:	84 c0                	test   %al,%al
c0103649:	75 35                	jne    c0103680 <schedule_process+0x58>
c010364b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010364e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103654:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103657:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010365d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103660:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103667:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010366a:	05 60 02 00 00       	add    $0x260,%eax
c010366f:	83 ec 08             	sub    $0x8,%esp
c0103672:	50                   	push   %eax
c0103673:	68 ec fd 10 c0       	push   $0xc010fdec
c0103678:	e8 6a 6b 00 00       	call   c010a1e7 <insertToDoubleLinkList>
c010367d:	83 c4 10             	add    $0x10,%esp
c0103680:	83 ec 0c             	sub    $0xc,%esp
c0103683:	68 ec fd 10 c0       	push   $0xc010fdec
c0103688:	e8 76 69 00 00       	call   c010a003 <isListEmpty>
c010368d:	83 c4 10             	add    $0x10,%esp
c0103690:	84 c0                	test   %al,%al
c0103692:	74 19                	je     c01036ad <schedule_process+0x85>
c0103694:	6a 1e                	push   $0x1e
c0103696:	68 9f b4 10 c0       	push   $0xc010b49f
c010369b:	68 9f b4 10 c0       	push   $0xc010b49f
c01036a0:	68 a9 b4 10 c0       	push   $0xc010b4a9
c01036a5:	e8 9e 51 00 00       	call   c0108848 <assertion_failure>
c01036aa:	83 c4 10             	add    $0x10,%esp
c01036ad:	83 ec 0c             	sub    $0xc,%esp
c01036b0:	68 ec fd 10 c0       	push   $0xc010fdec
c01036b5:	e8 b0 6b 00 00       	call   c010a26a <popFromDoubleLinkList>
c01036ba:	83 c4 10             	add    $0x10,%esp
c01036bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01036c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01036c3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01036c8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01036cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01036ce:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01036d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01036d8:	8b 50 08             	mov    0x8(%eax),%edx
c01036db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01036de:	39 c2                	cmp    %eax,%edx
c01036e0:	74 28                	je     c010370a <schedule_process+0xe2>
c01036e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01036e5:	05 00 10 00 00       	add    $0x1000,%eax
c01036ea:	83 ec 0c             	sub    $0xc,%esp
c01036ed:	50                   	push   %eax
c01036ee:	e8 e7 cc ff ff       	call   c01003da <update_tss>
c01036f3:	83 c4 10             	add    $0x10,%esp
c01036f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01036f9:	8b 40 08             	mov    0x8(%eax),%eax
c01036fc:	83 ec 0c             	sub    $0xc,%esp
c01036ff:	50                   	push   %eax
c0103700:	e8 c8 cc ff ff       	call   c01003cd <update_cr3>
c0103705:	83 c4 10             	add    $0x10,%esp
c0103708:	eb 0f                	jmp    c0103719 <schedule_process+0xf1>
c010370a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010370d:	83 ec 0c             	sub    $0xc,%esp
c0103710:	50                   	push   %eax
c0103711:	e8 b7 cc ff ff       	call   c01003cd <update_cr3>
c0103716:	83 c4 10             	add    $0x10,%esp
c0103719:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010371c:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103721:	83 ec 08             	sub    $0x8,%esp
c0103724:	ff 75 e8             	pushl  -0x18(%ebp)
c0103727:	ff 75 f0             	pushl  -0x10(%ebp)
c010372a:	e8 91 68 00 00       	call   c0109fc0 <switch_to>
c010372f:	83 c4 10             	add    $0x10,%esp
c0103732:	90                   	nop
c0103733:	c9                   	leave  
c0103734:	c3                   	ret    

c0103735 <clock_handler>:
c0103735:	55                   	push   %ebp
c0103736:	89 e5                	mov    %esp,%ebp
c0103738:	83 ec 18             	sub    $0x18,%esp
c010373b:	e8 a9 cc ff ff       	call   c01003e9 <get_running_thread_pcb>
c0103740:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103743:	a1 c0 06 11 c0       	mov    0xc01106c0,%eax
c0103748:	85 c0                	test   %eax,%eax
c010374a:	74 0d                	je     c0103759 <clock_handler+0x24>
c010374c:	83 ec 0c             	sub    $0xc,%esp
c010374f:	6a 04                	push   $0x4
c0103751:	e8 fc 5f 00 00       	call   c0109752 <inform_int>
c0103756:	83 c4 10             	add    $0x10,%esp
c0103759:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010375e:	83 f8 64             	cmp    $0x64,%eax
c0103761:	75 0c                	jne    c010376f <clock_handler+0x3a>
c0103763:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c010376a:	00 00 00 
c010376d:	eb 0a                	jmp    c0103779 <clock_handler+0x44>
c010376f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103774:	83 f8 01             	cmp    $0x1,%eax
c0103777:	75 2a                	jne    c01037a3 <clock_handler+0x6e>
c0103779:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010377c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103782:	85 c0                	test   %eax,%eax
c0103784:	74 16                	je     c010379c <clock_handler+0x67>
c0103786:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c010378b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103791:	83 ea 01             	sub    $0x1,%edx
c0103794:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010379a:	eb 08                	jmp    c01037a4 <clock_handler+0x6f>
c010379c:	e8 87 fe ff ff       	call   c0103628 <schedule_process>
c01037a1:	eb 01                	jmp    c01037a4 <clock_handler+0x6f>
c01037a3:	90                   	nop
c01037a4:	c9                   	leave  
c01037a5:	c3                   	ret    

c01037a6 <pid2proc>:
c01037a6:	55                   	push   %ebp
c01037a7:	89 e5                	mov    %esp,%ebp
c01037a9:	83 ec 20             	sub    $0x20,%esp
c01037ac:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01037b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01037ba:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c01037bf:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c01037c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01037c8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01037cb:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c01037d0:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c01037d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01037d9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01037dc:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c01037e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01037e4:	eb 36                	jmp    c010381c <pid2proc+0x76>
c01037e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01037e9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01037ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01037f1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01037f5:	75 07                	jne    c01037fe <pid2proc+0x58>
c01037f7:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c01037fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103801:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103807:	8b 45 08             	mov    0x8(%ebp),%eax
c010380a:	39 c2                	cmp    %eax,%edx
c010380c:	75 05                	jne    c0103813 <pid2proc+0x6d>
c010380e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103811:	eb 17                	jmp    c010382a <pid2proc+0x84>
c0103813:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103816:	8b 40 04             	mov    0x4(%eax),%eax
c0103819:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010381c:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103823:	75 c1                	jne    c01037e6 <pid2proc+0x40>
c0103825:	b8 00 00 00 00       	mov    $0x0,%eax
c010382a:	c9                   	leave  
c010382b:	c3                   	ret    

c010382c <proc2pid>:
c010382c:	55                   	push   %ebp
c010382d:	89 e5                	mov    %esp,%ebp
c010382f:	83 ec 10             	sub    $0x10,%esp
c0103832:	8b 45 08             	mov    0x8(%ebp),%eax
c0103835:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c010383b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010383e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103841:	c9                   	leave  
c0103842:	c3                   	ret    

c0103843 <InitDescriptor>:
c0103843:	55                   	push   %ebp
c0103844:	89 e5                	mov    %esp,%ebp
c0103846:	83 ec 04             	sub    $0x4,%esp
c0103849:	8b 45 14             	mov    0x14(%ebp),%eax
c010384c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103850:	8b 45 10             	mov    0x10(%ebp),%eax
c0103853:	89 c2                	mov    %eax,%edx
c0103855:	8b 45 08             	mov    0x8(%ebp),%eax
c0103858:	66 89 10             	mov    %dx,(%eax)
c010385b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010385e:	89 c2                	mov    %eax,%edx
c0103860:	8b 45 08             	mov    0x8(%ebp),%eax
c0103863:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103867:	8b 45 0c             	mov    0xc(%ebp),%eax
c010386a:	c1 e8 10             	shr    $0x10,%eax
c010386d:	89 c2                	mov    %eax,%edx
c010386f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103872:	88 50 04             	mov    %dl,0x4(%eax)
c0103875:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103879:	89 c2                	mov    %eax,%edx
c010387b:	8b 45 08             	mov    0x8(%ebp),%eax
c010387e:	88 50 05             	mov    %dl,0x5(%eax)
c0103881:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103885:	66 c1 e8 08          	shr    $0x8,%ax
c0103889:	c1 e0 04             	shl    $0x4,%eax
c010388c:	89 c2                	mov    %eax,%edx
c010388e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103891:	c1 e8 10             	shr    $0x10,%eax
c0103894:	83 e0 0f             	and    $0xf,%eax
c0103897:	09 c2                	or     %eax,%edx
c0103899:	8b 45 08             	mov    0x8(%ebp),%eax
c010389c:	88 50 06             	mov    %dl,0x6(%eax)
c010389f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038a2:	c1 e8 18             	shr    $0x18,%eax
c01038a5:	89 c2                	mov    %eax,%edx
c01038a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01038aa:	88 50 07             	mov    %dl,0x7(%eax)
c01038ad:	90                   	nop
c01038ae:	c9                   	leave  
c01038af:	c3                   	ret    

c01038b0 <Seg2PhyAddr>:
c01038b0:	55                   	push   %ebp
c01038b1:	89 e5                	mov    %esp,%ebp
c01038b3:	83 ec 10             	sub    $0x10,%esp
c01038b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01038b9:	c1 e8 03             	shr    $0x3,%eax
c01038bc:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c01038c3:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c01038ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01038cd:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01038d0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01038d4:	0f b7 c0             	movzwl %ax,%eax
c01038d7:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c01038db:	0f b6 d2             	movzbl %dl,%edx
c01038de:	c1 e2 10             	shl    $0x10,%edx
c01038e1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c01038e7:	09 d0                	or     %edx,%eax
c01038e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038ef:	c9                   	leave  
c01038f0:	c3                   	ret    

c01038f1 <Seg2PhyAddrLDT>:
c01038f1:	55                   	push   %ebp
c01038f2:	89 e5                	mov    %esp,%ebp
c01038f4:	83 ec 10             	sub    $0x10,%esp
c01038f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01038fa:	c1 e8 03             	shr    $0x3,%eax
c01038fd:	89 c2                	mov    %eax,%edx
c01038ff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103902:	83 c2 20             	add    $0x20,%edx
c0103905:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103909:	8b 02                	mov    (%edx),%eax
c010390b:	8b 52 04             	mov    0x4(%edx),%edx
c010390e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103911:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103914:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103918:	0f b7 c0             	movzwl %ax,%eax
c010391b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010391f:	0f b6 d2             	movzbl %dl,%edx
c0103922:	c1 e2 10             	shl    $0x10,%edx
c0103925:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c010392b:	09 d0                	or     %edx,%eax
c010392d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103930:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103933:	c9                   	leave  
c0103934:	c3                   	ret    

c0103935 <VirAddr2PhyAddr>:
c0103935:	55                   	push   %ebp
c0103936:	89 e5                	mov    %esp,%ebp
c0103938:	83 ec 10             	sub    $0x10,%esp
c010393b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010393e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103941:	01 d0                	add    %edx,%eax
c0103943:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103946:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103949:	c9                   	leave  
c010394a:	c3                   	ret    

c010394b <v2l>:
c010394b:	55                   	push   %ebp
c010394c:	89 e5                	mov    %esp,%ebp
c010394e:	83 ec 18             	sub    $0x18,%esp
c0103951:	83 ec 0c             	sub    $0xc,%esp
c0103954:	ff 75 08             	pushl  0x8(%ebp)
c0103957:	e8 4a fe ff ff       	call   c01037a6 <pid2proc>
c010395c:	83 c4 10             	add    $0x10,%esp
c010395f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103962:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103969:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010396c:	83 ec 08             	sub    $0x8,%esp
c010396f:	ff 75 f4             	pushl  -0xc(%ebp)
c0103972:	50                   	push   %eax
c0103973:	e8 79 ff ff ff       	call   c01038f1 <Seg2PhyAddrLDT>
c0103978:	83 c4 10             	add    $0x10,%esp
c010397b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010397e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103981:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103984:	01 d0                	add    %edx,%eax
c0103986:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103989:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010398c:	c9                   	leave  
c010398d:	c3                   	ret    

c010398e <init_propt>:
c010398e:	55                   	push   %ebp
c010398f:	89 e5                	mov    %esp,%ebp
c0103991:	83 ec 38             	sub    $0x38,%esp
c0103994:	6a 0e                	push   $0xe
c0103996:	6a 08                	push   $0x8
c0103998:	68 71 01 10 c0       	push   $0xc0100171
c010399d:	6a 20                	push   $0x20
c010399f:	e8 6b 01 00 00       	call   c0103b0f <InitInterruptDesc>
c01039a4:	83 c4 10             	add    $0x10,%esp
c01039a7:	6a 0e                	push   $0xe
c01039a9:	6a 08                	push   $0x8
c01039ab:	68 9f 01 10 c0       	push   $0xc010019f
c01039b0:	6a 21                	push   $0x21
c01039b2:	e8 58 01 00 00       	call   c0103b0f <InitInterruptDesc>
c01039b7:	83 c4 10             	add    $0x10,%esp
c01039ba:	6a 0e                	push   $0xe
c01039bc:	6a 08                	push   $0x8
c01039be:	68 e2 01 10 c0       	push   $0xc01001e2
c01039c3:	6a 2e                	push   $0x2e
c01039c5:	e8 45 01 00 00       	call   c0103b0f <InitInterruptDesc>
c01039ca:	83 c4 10             	add    $0x10,%esp
c01039cd:	6a 0e                	push   $0xe
c01039cf:	6a 08                	push   $0x8
c01039d1:	68 28 02 10 c0       	push   $0xc0100228
c01039d6:	6a 2a                	push   $0x2a
c01039d8:	e8 32 01 00 00       	call   c0103b0f <InitInterruptDesc>
c01039dd:	83 c4 10             	add    $0x10,%esp
c01039e0:	83 ec 04             	sub    $0x4,%esp
c01039e3:	68 e0 15 00 00       	push   $0x15e0
c01039e8:	6a 00                	push   $0x0
c01039ea:	68 00 22 18 c0       	push   $0xc0182200
c01039ef:	e8 77 87 00 00       	call   c010c16b <Memset>
c01039f4:	83 c4 10             	add    $0x10,%esp
c01039f7:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c01039fe:	83 ec 04             	sub    $0x4,%esp
c0103a01:	ff 75 f4             	pushl  -0xc(%ebp)
c0103a04:	6a 00                	push   $0x0
c0103a06:	68 40 06 11 c0       	push   $0xc0110640
c0103a0b:	e8 5b 87 00 00       	call   c010c16b <Memset>
c0103a10:	83 c4 10             	add    $0x10,%esp
c0103a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a16:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103a1b:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103a22:	00 00 00 
c0103a25:	83 ec 0c             	sub    $0xc,%esp
c0103a28:	6a 30                	push   $0x30
c0103a2a:	e8 81 fe ff ff       	call   c01038b0 <Seg2PhyAddr>
c0103a2f:	83 c4 10             	add    $0x10,%esp
c0103a32:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103a35:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103a3c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103a43:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a46:	0f b7 d0             	movzwl %ax,%edx
c0103a49:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a4c:	83 e8 01             	sub    $0x1,%eax
c0103a4f:	89 c1                	mov    %eax,%ecx
c0103a51:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103a54:	52                   	push   %edx
c0103a55:	51                   	push   %ecx
c0103a56:	50                   	push   %eax
c0103a57:	68 00 f8 10 c0       	push   $0xc010f800
c0103a5c:	e8 e2 fd ff ff       	call   c0103843 <InitDescriptor>
c0103a61:	83 c4 10             	add    $0x10,%esp
c0103a64:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103a6b:	68 f2 00 00 00       	push   $0xf2
c0103a70:	68 ff ff 00 00       	push   $0xffff
c0103a75:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103a78:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103a7d:	e8 c1 fd ff ff       	call   c0103843 <InitDescriptor>
c0103a82:	83 c4 10             	add    $0x10,%esp
c0103a85:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103a8c:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103a93:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103a9a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103a9d:	0f b7 c0             	movzwl %ax,%eax
c0103aa0:	50                   	push   %eax
c0103aa1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103aa4:	6a 00                	push   $0x0
c0103aa6:	68 08 f8 10 c0       	push   $0xc010f808
c0103aab:	e8 93 fd ff ff       	call   c0103843 <InitDescriptor>
c0103ab0:	83 c4 10             	add    $0x10,%esp
c0103ab3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103ab6:	0f b7 c0             	movzwl %ax,%eax
c0103ab9:	50                   	push   %eax
c0103aba:	ff 75 d8             	pushl  -0x28(%ebp)
c0103abd:	6a 00                	push   $0x0
c0103abf:	68 10 f8 10 c0       	push   $0xc010f810
c0103ac4:	e8 7a fd ff ff       	call   c0103843 <InitDescriptor>
c0103ac9:	83 c4 10             	add    $0x10,%esp
c0103acc:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103ad3:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103ada:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103add:	0f b7 c0             	movzwl %ax,%eax
c0103ae0:	50                   	push   %eax
c0103ae1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103ae4:	6a 00                	push   $0x0
c0103ae6:	68 18 f8 10 c0       	push   $0xc010f818
c0103aeb:	e8 53 fd ff ff       	call   c0103843 <InitDescriptor>
c0103af0:	83 c4 10             	add    $0x10,%esp
c0103af3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103af6:	0f b7 c0             	movzwl %ax,%eax
c0103af9:	50                   	push   %eax
c0103afa:	ff 75 d8             	pushl  -0x28(%ebp)
c0103afd:	6a 00                	push   $0x0
c0103aff:	68 20 f8 10 c0       	push   $0xc010f820
c0103b04:	e8 3a fd ff ff       	call   c0103843 <InitDescriptor>
c0103b09:	83 c4 10             	add    $0x10,%esp
c0103b0c:	90                   	nop
c0103b0d:	c9                   	leave  
c0103b0e:	c3                   	ret    

c0103b0f <InitInterruptDesc>:
c0103b0f:	55                   	push   %ebp
c0103b10:	89 e5                	mov    %esp,%ebp
c0103b12:	83 ec 10             	sub    $0x10,%esp
c0103b15:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b18:	c1 e0 03             	shl    $0x3,%eax
c0103b1b:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103b20:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103b23:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b26:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103b2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b2d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103b30:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103b33:	89 c2                	mov    %eax,%edx
c0103b35:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b38:	66 89 10             	mov    %dx,(%eax)
c0103b3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b3e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103b44:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103b47:	c1 f8 10             	sar    $0x10,%eax
c0103b4a:	89 c2                	mov    %eax,%edx
c0103b4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b4f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103b53:	8b 45 10             	mov    0x10(%ebp),%eax
c0103b56:	c1 e0 04             	shl    $0x4,%eax
c0103b59:	89 c2                	mov    %eax,%edx
c0103b5b:	8b 45 14             	mov    0x14(%ebp),%eax
c0103b5e:	09 d0                	or     %edx,%eax
c0103b60:	89 c2                	mov    %eax,%edx
c0103b62:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b65:	88 50 05             	mov    %dl,0x5(%eax)
c0103b68:	90                   	nop
c0103b69:	c9                   	leave  
c0103b6a:	c3                   	ret    

c0103b6b <ReloadGDT>:
c0103b6b:	55                   	push   %ebp
c0103b6c:	89 e5                	mov    %esp,%ebp
c0103b6e:	83 ec 28             	sub    $0x28,%esp
c0103b71:	b8 cc 06 11 c0       	mov    $0xc01106cc,%eax
c0103b76:	0f b7 00             	movzwl (%eax),%eax
c0103b79:	98                   	cwtl   
c0103b7a:	ba ce 06 11 c0       	mov    $0xc01106ce,%edx
c0103b7f:	8b 12                	mov    (%edx),%edx
c0103b81:	83 ec 04             	sub    $0x4,%esp
c0103b84:	50                   	push   %eax
c0103b85:	52                   	push   %edx
c0103b86:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103b8b:	e8 ad 85 00 00       	call   c010c13d <Memcpy2>
c0103b90:	83 c4 10             	add    $0x10,%esp
c0103b93:	c7 45 f0 cc 06 11 c0 	movl   $0xc01106cc,-0x10(%ebp)
c0103b9a:	c7 45 ec ce 06 11 c0 	movl   $0xc01106ce,-0x14(%ebp)
c0103ba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ba4:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103ba9:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103bae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103bb1:	89 10                	mov    %edx,(%eax)
c0103bb3:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103bba:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103bc1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103bc4:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103bc9:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103bce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103bd1:	89 10                	mov    %edx,(%eax)
c0103bd3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103bda:	eb 04                	jmp    c0103be0 <ReloadGDT+0x75>
c0103bdc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103be0:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103be7:	7e f3                	jle    c0103bdc <ReloadGDT+0x71>
c0103be9:	e8 a9 37 00 00       	call   c0107397 <init_internal_interrupt>
c0103bee:	e8 9b fd ff ff       	call   c010398e <init_propt>
c0103bf3:	90                   	nop
c0103bf4:	c9                   	leave  
c0103bf5:	c3                   	ret    

c0103bf6 <select_console>:
c0103bf6:	55                   	push   %ebp
c0103bf7:	89 e5                	mov    %esp,%ebp
c0103bf9:	83 ec 18             	sub    $0x18,%esp
c0103bfc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bff:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103c02:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103c06:	75 27                	jne    c0103c2f <select_console+0x39>
c0103c08:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103c0c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103c12:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103c17:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103c1c:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103c21:	83 ec 0c             	sub    $0xc,%esp
c0103c24:	50                   	push   %eax
c0103c25:	e8 08 00 00 00       	call   c0103c32 <flush>
c0103c2a:	83 c4 10             	add    $0x10,%esp
c0103c2d:	eb 01                	jmp    c0103c30 <select_console+0x3a>
c0103c2f:	90                   	nop
c0103c30:	c9                   	leave  
c0103c31:	c3                   	ret    

c0103c32 <flush>:
c0103c32:	55                   	push   %ebp
c0103c33:	89 e5                	mov    %esp,%ebp
c0103c35:	83 ec 08             	sub    $0x8,%esp
c0103c38:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c3b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c41:	8b 40 0c             	mov    0xc(%eax),%eax
c0103c44:	83 ec 0c             	sub    $0xc,%esp
c0103c47:	50                   	push   %eax
c0103c48:	e8 1e 00 00 00       	call   c0103c6b <set_cursor>
c0103c4d:	83 c4 10             	add    $0x10,%esp
c0103c50:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c53:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c59:	8b 40 08             	mov    0x8(%eax),%eax
c0103c5c:	83 ec 0c             	sub    $0xc,%esp
c0103c5f:	50                   	push   %eax
c0103c60:	e8 64 00 00 00       	call   c0103cc9 <set_console_start_video_addr>
c0103c65:	83 c4 10             	add    $0x10,%esp
c0103c68:	90                   	nop
c0103c69:	c9                   	leave  
c0103c6a:	c3                   	ret    

c0103c6b <set_cursor>:
c0103c6b:	55                   	push   %ebp
c0103c6c:	89 e5                	mov    %esp,%ebp
c0103c6e:	83 ec 08             	sub    $0x8,%esp
c0103c71:	83 ec 08             	sub    $0x8,%esp
c0103c74:	6a 0e                	push   $0xe
c0103c76:	68 d4 03 00 00       	push   $0x3d4
c0103c7b:	e8 6b c6 ff ff       	call   c01002eb <out_byte>
c0103c80:	83 c4 10             	add    $0x10,%esp
c0103c83:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c86:	c1 e8 08             	shr    $0x8,%eax
c0103c89:	0f b7 c0             	movzwl %ax,%eax
c0103c8c:	83 ec 08             	sub    $0x8,%esp
c0103c8f:	50                   	push   %eax
c0103c90:	68 d5 03 00 00       	push   $0x3d5
c0103c95:	e8 51 c6 ff ff       	call   c01002eb <out_byte>
c0103c9a:	83 c4 10             	add    $0x10,%esp
c0103c9d:	83 ec 08             	sub    $0x8,%esp
c0103ca0:	6a 0f                	push   $0xf
c0103ca2:	68 d4 03 00 00       	push   $0x3d4
c0103ca7:	e8 3f c6 ff ff       	call   c01002eb <out_byte>
c0103cac:	83 c4 10             	add    $0x10,%esp
c0103caf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cb2:	0f b7 c0             	movzwl %ax,%eax
c0103cb5:	83 ec 08             	sub    $0x8,%esp
c0103cb8:	50                   	push   %eax
c0103cb9:	68 d5 03 00 00       	push   $0x3d5
c0103cbe:	e8 28 c6 ff ff       	call   c01002eb <out_byte>
c0103cc3:	83 c4 10             	add    $0x10,%esp
c0103cc6:	90                   	nop
c0103cc7:	c9                   	leave  
c0103cc8:	c3                   	ret    

c0103cc9 <set_console_start_video_addr>:
c0103cc9:	55                   	push   %ebp
c0103cca:	89 e5                	mov    %esp,%ebp
c0103ccc:	83 ec 08             	sub    $0x8,%esp
c0103ccf:	83 ec 08             	sub    $0x8,%esp
c0103cd2:	6a 0c                	push   $0xc
c0103cd4:	68 d4 03 00 00       	push   $0x3d4
c0103cd9:	e8 0d c6 ff ff       	call   c01002eb <out_byte>
c0103cde:	83 c4 10             	add    $0x10,%esp
c0103ce1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ce4:	c1 e8 08             	shr    $0x8,%eax
c0103ce7:	0f b7 c0             	movzwl %ax,%eax
c0103cea:	83 ec 08             	sub    $0x8,%esp
c0103ced:	50                   	push   %eax
c0103cee:	68 d5 03 00 00       	push   $0x3d5
c0103cf3:	e8 f3 c5 ff ff       	call   c01002eb <out_byte>
c0103cf8:	83 c4 10             	add    $0x10,%esp
c0103cfb:	83 ec 08             	sub    $0x8,%esp
c0103cfe:	6a 0d                	push   $0xd
c0103d00:	68 d4 03 00 00       	push   $0x3d4
c0103d05:	e8 e1 c5 ff ff       	call   c01002eb <out_byte>
c0103d0a:	83 c4 10             	add    $0x10,%esp
c0103d0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d10:	0f b7 c0             	movzwl %ax,%eax
c0103d13:	83 ec 08             	sub    $0x8,%esp
c0103d16:	50                   	push   %eax
c0103d17:	68 d5 03 00 00       	push   $0x3d5
c0103d1c:	e8 ca c5 ff ff       	call   c01002eb <out_byte>
c0103d21:	83 c4 10             	add    $0x10,%esp
c0103d24:	90                   	nop
c0103d25:	c9                   	leave  
c0103d26:	c3                   	ret    

c0103d27 <put_key>:
c0103d27:	55                   	push   %ebp
c0103d28:	89 e5                	mov    %esp,%ebp
c0103d2a:	83 ec 04             	sub    $0x4,%esp
c0103d2d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d30:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103d33:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d36:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103d3c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103d41:	77 4d                	ja     c0103d90 <put_key+0x69>
c0103d43:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d46:	8b 00                	mov    (%eax),%eax
c0103d48:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103d4c:	89 10                	mov    %edx,(%eax)
c0103d4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d51:	8b 00                	mov    (%eax),%eax
c0103d53:	8d 50 04             	lea    0x4(%eax),%edx
c0103d56:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d59:	89 10                	mov    %edx,(%eax)
c0103d5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d5e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103d64:	8d 50 01             	lea    0x1(%eax),%edx
c0103d67:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d6a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103d70:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d73:	8b 00                	mov    (%eax),%eax
c0103d75:	8b 55 08             	mov    0x8(%ebp),%edx
c0103d78:	83 c2 08             	add    $0x8,%edx
c0103d7b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103d81:	39 d0                	cmp    %edx,%eax
c0103d83:	75 0b                	jne    c0103d90 <put_key+0x69>
c0103d85:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d88:	8d 50 08             	lea    0x8(%eax),%edx
c0103d8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d8e:	89 10                	mov    %edx,(%eax)
c0103d90:	90                   	nop
c0103d91:	c9                   	leave  
c0103d92:	c3                   	ret    

c0103d93 <scroll_up>:
c0103d93:	55                   	push   %ebp
c0103d94:	89 e5                	mov    %esp,%ebp
c0103d96:	83 ec 08             	sub    $0x8,%esp
c0103d99:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d9c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103da2:	8b 40 08             	mov    0x8(%eax),%eax
c0103da5:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103da8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dab:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103db1:	8b 00                	mov    (%eax),%eax
c0103db3:	39 c2                	cmp    %eax,%edx
c0103db5:	76 1b                	jbe    c0103dd2 <scroll_up+0x3f>
c0103db7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dba:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dc0:	8b 40 08             	mov    0x8(%eax),%eax
c0103dc3:	83 e8 50             	sub    $0x50,%eax
c0103dc6:	83 ec 0c             	sub    $0xc,%esp
c0103dc9:	50                   	push   %eax
c0103dca:	e8 fa fe ff ff       	call   c0103cc9 <set_console_start_video_addr>
c0103dcf:	83 c4 10             	add    $0x10,%esp
c0103dd2:	90                   	nop
c0103dd3:	c9                   	leave  
c0103dd4:	c3                   	ret    

c0103dd5 <scroll_down>:
c0103dd5:	55                   	push   %ebp
c0103dd6:	89 e5                	mov    %esp,%ebp
c0103dd8:	83 ec 08             	sub    $0x8,%esp
c0103ddb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dde:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103de4:	8b 40 08             	mov    0x8(%eax),%eax
c0103de7:	8d 48 50             	lea    0x50(%eax),%ecx
c0103dea:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ded:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103df3:	8b 10                	mov    (%eax),%edx
c0103df5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dfe:	8b 40 04             	mov    0x4(%eax),%eax
c0103e01:	01 d0                	add    %edx,%eax
c0103e03:	39 c1                	cmp    %eax,%ecx
c0103e05:	73 36                	jae    c0103e3d <scroll_down+0x68>
c0103e07:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e0a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e10:	8b 40 08             	mov    0x8(%eax),%eax
c0103e13:	83 c0 50             	add    $0x50,%eax
c0103e16:	83 ec 0c             	sub    $0xc,%esp
c0103e19:	50                   	push   %eax
c0103e1a:	e8 aa fe ff ff       	call   c0103cc9 <set_console_start_video_addr>
c0103e1f:	83 c4 10             	add    $0x10,%esp
c0103e22:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e25:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e2b:	8b 50 08             	mov    0x8(%eax),%edx
c0103e2e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e31:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e37:	83 c2 50             	add    $0x50,%edx
c0103e3a:	89 50 08             	mov    %edx,0x8(%eax)
c0103e3d:	90                   	nop
c0103e3e:	c9                   	leave  
c0103e3f:	c3                   	ret    

c0103e40 <out_char>:
c0103e40:	55                   	push   %ebp
c0103e41:	89 e5                	mov    %esp,%ebp
c0103e43:	83 ec 28             	sub    $0x28,%esp
c0103e46:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103e49:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103e4c:	e8 a7 2d 00 00       	call   c0106bf8 <intr_disable>
c0103e51:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103e54:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e57:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e5d:	8b 40 0c             	mov    0xc(%eax),%eax
c0103e60:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103e65:	01 c0                	add    %eax,%eax
c0103e67:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103e6a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103e6e:	83 f8 08             	cmp    $0x8,%eax
c0103e71:	0f 84 8d 00 00 00    	je     c0103f04 <out_char+0xc4>
c0103e77:	83 f8 0a             	cmp    $0xa,%eax
c0103e7a:	0f 85 c9 00 00 00    	jne    c0103f49 <out_char+0x109>
c0103e80:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e83:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e89:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e8f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e95:	8b 08                	mov    (%eax),%ecx
c0103e97:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e9a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ea0:	8b 40 04             	mov    0x4(%eax),%eax
c0103ea3:	01 c8                	add    %ecx,%eax
c0103ea5:	83 e8 50             	sub    $0x50,%eax
c0103ea8:	39 c2                	cmp    %eax,%edx
c0103eaa:	0f 83 f4 00 00 00    	jae    c0103fa4 <out_char+0x164>
c0103eb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eb9:	8b 08                	mov    (%eax),%ecx
c0103ebb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ebe:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ec4:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ec7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ed0:	8b 00                	mov    (%eax),%eax
c0103ed2:	29 c2                	sub    %eax,%edx
c0103ed4:	89 d0                	mov    %edx,%eax
c0103ed6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103edb:	f7 e2                	mul    %edx
c0103edd:	89 d0                	mov    %edx,%eax
c0103edf:	c1 e8 06             	shr    $0x6,%eax
c0103ee2:	8d 50 01             	lea    0x1(%eax),%edx
c0103ee5:	89 d0                	mov    %edx,%eax
c0103ee7:	c1 e0 02             	shl    $0x2,%eax
c0103eea:	01 d0                	add    %edx,%eax
c0103eec:	c1 e0 04             	shl    $0x4,%eax
c0103eef:	89 c2                	mov    %eax,%edx
c0103ef1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ef4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103efa:	01 ca                	add    %ecx,%edx
c0103efc:	89 50 0c             	mov    %edx,0xc(%eax)
c0103eff:	e9 a0 00 00 00       	jmp    c0103fa4 <out_char+0x164>
c0103f04:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f07:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f0d:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f10:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f13:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f19:	8b 00                	mov    (%eax),%eax
c0103f1b:	39 c2                	cmp    %eax,%edx
c0103f1d:	0f 86 84 00 00 00    	jbe    c0103fa7 <out_char+0x167>
c0103f23:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f26:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f2c:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f2f:	83 ea 01             	sub    $0x1,%edx
c0103f32:	89 50 0c             	mov    %edx,0xc(%eax)
c0103f35:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103f38:	83 e8 02             	sub    $0x2,%eax
c0103f3b:	c6 00 20             	movb   $0x20,(%eax)
c0103f3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103f41:	83 e8 01             	sub    $0x1,%eax
c0103f44:	c6 00 00             	movb   $0x0,(%eax)
c0103f47:	eb 5e                	jmp    c0103fa7 <out_char+0x167>
c0103f49:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f4c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f52:	8b 40 0c             	mov    0xc(%eax),%eax
c0103f55:	8d 48 01             	lea    0x1(%eax),%ecx
c0103f58:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f5b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f61:	8b 10                	mov    (%eax),%edx
c0103f63:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f66:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f6c:	8b 40 04             	mov    0x4(%eax),%eax
c0103f6f:	01 d0                	add    %edx,%eax
c0103f71:	39 c1                	cmp    %eax,%ecx
c0103f73:	73 35                	jae    c0103faa <out_char+0x16a>
c0103f75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103f78:	8d 50 01             	lea    0x1(%eax),%edx
c0103f7b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103f7e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0103f82:	88 10                	mov    %dl,(%eax)
c0103f84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103f87:	8d 50 01             	lea    0x1(%eax),%edx
c0103f8a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103f8d:	c6 00 0a             	movb   $0xa,(%eax)
c0103f90:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f93:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f99:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f9c:	83 c2 01             	add    $0x1,%edx
c0103f9f:	89 50 0c             	mov    %edx,0xc(%eax)
c0103fa2:	eb 06                	jmp    c0103faa <out_char+0x16a>
c0103fa4:	90                   	nop
c0103fa5:	eb 14                	jmp    c0103fbb <out_char+0x17b>
c0103fa7:	90                   	nop
c0103fa8:	eb 11                	jmp    c0103fbb <out_char+0x17b>
c0103faa:	90                   	nop
c0103fab:	eb 0e                	jmp    c0103fbb <out_char+0x17b>
c0103fad:	83 ec 0c             	sub    $0xc,%esp
c0103fb0:	ff 75 08             	pushl  0x8(%ebp)
c0103fb3:	e8 1d fe ff ff       	call   c0103dd5 <scroll_down>
c0103fb8:	83 c4 10             	add    $0x10,%esp
c0103fbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fbe:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fc4:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fd0:	8b 40 08             	mov    0x8(%eax),%eax
c0103fd3:	29 c2                	sub    %eax,%edx
c0103fd5:	89 d0                	mov    %edx,%eax
c0103fd7:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0103fdc:	77 cf                	ja     c0103fad <out_char+0x16d>
c0103fde:	83 ec 0c             	sub    $0xc,%esp
c0103fe1:	ff 75 08             	pushl  0x8(%ebp)
c0103fe4:	e8 49 fc ff ff       	call   c0103c32 <flush>
c0103fe9:	83 c4 10             	add    $0x10,%esp
c0103fec:	83 ec 0c             	sub    $0xc,%esp
c0103fef:	ff 75 f4             	pushl  -0xc(%ebp)
c0103ff2:	e8 2a 2c 00 00       	call   c0106c21 <intr_set_status>
c0103ff7:	83 c4 10             	add    $0x10,%esp
c0103ffa:	90                   	nop
c0103ffb:	c9                   	leave  
c0103ffc:	c3                   	ret    

c0103ffd <tty_dev_read>:
c0103ffd:	55                   	push   %ebp
c0103ffe:	89 e5                	mov    %esp,%ebp
c0104000:	83 ec 08             	sub    $0x8,%esp
c0104003:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104008:	39 45 08             	cmp    %eax,0x8(%ebp)
c010400b:	75 17                	jne    c0104024 <tty_dev_read+0x27>
c010400d:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104012:	85 c0                	test   %eax,%eax
c0104014:	7e 0e                	jle    c0104024 <tty_dev_read+0x27>
c0104016:	83 ec 0c             	sub    $0xc,%esp
c0104019:	ff 75 08             	pushl  0x8(%ebp)
c010401c:	e8 89 07 00 00       	call   c01047aa <keyboard_read>
c0104021:	83 c4 10             	add    $0x10,%esp
c0104024:	90                   	nop
c0104025:	c9                   	leave  
c0104026:	c3                   	ret    

c0104027 <tty_dev_write>:
c0104027:	55                   	push   %ebp
c0104028:	89 e5                	mov    %esp,%ebp
c010402a:	83 ec 28             	sub    $0x28,%esp
c010402d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104030:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104036:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104039:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104040:	e9 88 01 00 00       	jmp    c01041cd <tty_dev_write+0x1a6>
c0104045:	8b 45 08             	mov    0x8(%ebp),%eax
c0104048:	8b 40 04             	mov    0x4(%eax),%eax
c010404b:	8b 00                	mov    (%eax),%eax
c010404d:	88 45 e7             	mov    %al,-0x19(%ebp)
c0104050:	8b 45 08             	mov    0x8(%ebp),%eax
c0104053:	8b 40 04             	mov    0x4(%eax),%eax
c0104056:	8d 50 04             	lea    0x4(%eax),%edx
c0104059:	8b 45 08             	mov    0x8(%ebp),%eax
c010405c:	89 50 04             	mov    %edx,0x4(%eax)
c010405f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104062:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104068:	8d 50 ff             	lea    -0x1(%eax),%edx
c010406b:	8b 45 08             	mov    0x8(%ebp),%eax
c010406e:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104074:	8b 45 08             	mov    0x8(%ebp),%eax
c0104077:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010407d:	8d 50 01             	lea    0x1(%eax),%edx
c0104080:	8b 45 08             	mov    0x8(%ebp),%eax
c0104083:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104089:	8b 45 08             	mov    0x8(%ebp),%eax
c010408c:	8b 40 04             	mov    0x4(%eax),%eax
c010408f:	8b 55 08             	mov    0x8(%ebp),%edx
c0104092:	83 c2 08             	add    $0x8,%edx
c0104095:	81 c2 00 08 00 00    	add    $0x800,%edx
c010409b:	39 d0                	cmp    %edx,%eax
c010409d:	75 0c                	jne    c01040ab <tty_dev_write+0x84>
c010409f:	8b 45 08             	mov    0x8(%ebp),%eax
c01040a2:	8d 50 08             	lea    0x8(%eax),%edx
c01040a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01040a8:	89 50 04             	mov    %edx,0x4(%eax)
c01040ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ae:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01040b4:	85 c0                	test   %eax,%eax
c01040b6:	0f 84 11 01 00 00    	je     c01041cd <tty_dev_write+0x1a6>
c01040bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040c0:	3c 20                	cmp    $0x20,%al
c01040c2:	76 08                	jbe    c01040cc <tty_dev_write+0xa5>
c01040c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040c8:	3c 7e                	cmp    $0x7e,%al
c01040ca:	76 10                	jbe    c01040dc <tty_dev_write+0xb5>
c01040cc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040d0:	3c 20                	cmp    $0x20,%al
c01040d2:	74 08                	je     c01040dc <tty_dev_write+0xb5>
c01040d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040d8:	84 c0                	test   %al,%al
c01040da:	75 58                	jne    c0104134 <tty_dev_write+0x10d>
c01040dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01040df:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c01040e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01040e8:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01040ee:	01 d0                	add    %edx,%eax
c01040f0:	83 e8 01             	sub    $0x1,%eax
c01040f3:	89 c2                	mov    %eax,%edx
c01040f5:	83 ec 04             	sub    $0x4,%esp
c01040f8:	6a 01                	push   $0x1
c01040fa:	8d 45 e7             	lea    -0x19(%ebp),%eax
c01040fd:	50                   	push   %eax
c01040fe:	52                   	push   %edx
c01040ff:	e8 58 2b 00 00       	call   c0106c5c <Memcpy>
c0104104:	83 c4 10             	add    $0x10,%esp
c0104107:	8b 45 08             	mov    0x8(%ebp),%eax
c010410a:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104110:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104113:	8b 45 08             	mov    0x8(%ebp),%eax
c0104116:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c010411c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104120:	0f b6 c0             	movzbl %al,%eax
c0104123:	83 ec 08             	sub    $0x8,%esp
c0104126:	50                   	push   %eax
c0104127:	ff 75 08             	pushl  0x8(%ebp)
c010412a:	e8 11 fd ff ff       	call   c0103e40 <out_char>
c010412f:	83 c4 10             	add    $0x10,%esp
c0104132:	eb 7c                	jmp    c01041b0 <tty_dev_write+0x189>
c0104134:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104138:	3c 08                	cmp    $0x8,%al
c010413a:	75 42                	jne    c010417e <tty_dev_write+0x157>
c010413c:	8b 45 08             	mov    0x8(%ebp),%eax
c010413f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104145:	8d 50 01             	lea    0x1(%eax),%edx
c0104148:	8b 45 08             	mov    0x8(%ebp),%eax
c010414b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104151:	8b 45 08             	mov    0x8(%ebp),%eax
c0104154:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010415a:	8d 50 fe             	lea    -0x2(%eax),%edx
c010415d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104160:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104166:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010416a:	0f b6 c0             	movzbl %al,%eax
c010416d:	83 ec 08             	sub    $0x8,%esp
c0104170:	50                   	push   %eax
c0104171:	ff 75 08             	pushl  0x8(%ebp)
c0104174:	e8 c7 fc ff ff       	call   c0103e40 <out_char>
c0104179:	83 c4 10             	add    $0x10,%esp
c010417c:	eb 32                	jmp    c01041b0 <tty_dev_write+0x189>
c010417e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104182:	3c 0a                	cmp    $0xa,%al
c0104184:	75 2a                	jne    c01041b0 <tty_dev_write+0x189>
c0104186:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010418a:	0f b6 c0             	movzbl %al,%eax
c010418d:	83 ec 08             	sub    $0x8,%esp
c0104190:	50                   	push   %eax
c0104191:	ff 75 08             	pushl  0x8(%ebp)
c0104194:	e8 a7 fc ff ff       	call   c0103e40 <out_char>
c0104199:	83 c4 10             	add    $0x10,%esp
c010419c:	8b 45 08             	mov    0x8(%ebp),%eax
c010419f:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c01041a6:	00 00 00 
c01041a9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01041b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01041b3:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01041b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01041bc:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c01041c2:	39 c2                	cmp    %eax,%edx
c01041c4:	75 07                	jne    c01041cd <tty_dev_write+0x1a6>
c01041c6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01041cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01041d0:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01041d6:	85 c0                	test   %eax,%eax
c01041d8:	0f 85 67 fe ff ff    	jne    c0104045 <tty_dev_write+0x1e>
c01041de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01041e2:	74 6d                	je     c0104251 <tty_dev_write+0x22a>
c01041e4:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c01041eb:	83 ec 0c             	sub    $0xc,%esp
c01041ee:	ff 75 ec             	pushl  -0x14(%ebp)
c01041f1:	e8 b6 d3 ff ff       	call   c01015ac <sys_malloc>
c01041f6:	83 c4 10             	add    $0x10,%esp
c01041f9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01041fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01041ff:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104206:	8b 45 08             	mov    0x8(%ebp),%eax
c0104209:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010420f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104212:	89 50 60             	mov    %edx,0x60(%eax)
c0104215:	8b 45 08             	mov    0x8(%ebp),%eax
c0104218:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010421e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104221:	89 50 68             	mov    %edx,0x68(%eax)
c0104224:	8b 45 08             	mov    0x8(%ebp),%eax
c0104227:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010422d:	83 ec 04             	sub    $0x4,%esp
c0104230:	50                   	push   %eax
c0104231:	ff 75 e8             	pushl  -0x18(%ebp)
c0104234:	6a 01                	push   $0x1
c0104236:	e8 7d 52 00 00       	call   c01094b8 <send_rec>
c010423b:	83 c4 10             	add    $0x10,%esp
c010423e:	83 ec 08             	sub    $0x8,%esp
c0104241:	ff 75 ec             	pushl  -0x14(%ebp)
c0104244:	ff 75 e8             	pushl  -0x18(%ebp)
c0104247:	e8 75 d3 ff ff       	call   c01015c1 <sys_free>
c010424c:	83 c4 10             	add    $0x10,%esp
c010424f:	eb 01                	jmp    c0104252 <tty_dev_write+0x22b>
c0104251:	90                   	nop
c0104252:	c9                   	leave  
c0104253:	c3                   	ret    

c0104254 <tty_do_read>:
c0104254:	55                   	push   %ebp
c0104255:	89 e5                	mov    %esp,%ebp
c0104257:	83 ec 08             	sub    $0x8,%esp
c010425a:	8b 45 08             	mov    0x8(%ebp),%eax
c010425d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104264:	00 00 00 
c0104267:	8b 45 0c             	mov    0xc(%ebp),%eax
c010426a:	8b 50 68             	mov    0x68(%eax),%edx
c010426d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104270:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104276:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104279:	8b 00                	mov    (%eax),%eax
c010427b:	89 c2                	mov    %eax,%edx
c010427d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104280:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0104286:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104289:	8b 50 60             	mov    0x60(%eax),%edx
c010428c:	8b 45 08             	mov    0x8(%ebp),%eax
c010428f:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104295:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104298:	8b 50 60             	mov    0x60(%eax),%edx
c010429b:	8b 45 08             	mov    0x8(%ebp),%eax
c010429e:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c01042a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a7:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c01042ad:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042b0:	8b 40 10             	mov    0x10(%eax),%eax
c01042b3:	83 ec 08             	sub    $0x8,%esp
c01042b6:	52                   	push   %edx
c01042b7:	50                   	push   %eax
c01042b8:	e8 32 1b 00 00       	call   c0105def <alloc_virtual_memory>
c01042bd:	83 c4 10             	add    $0x10,%esp
c01042c0:	89 c2                	mov    %eax,%edx
c01042c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01042c5:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c01042cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01042ce:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01042d4:	83 f8 02             	cmp    $0x2,%eax
c01042d7:	74 1c                	je     c01042f5 <tty_do_read+0xa1>
c01042d9:	68 3b 01 00 00       	push   $0x13b
c01042de:	68 c5 b4 10 c0       	push   $0xc010b4c5
c01042e3:	68 c5 b4 10 c0       	push   $0xc010b4c5
c01042e8:	68 cf b4 10 c0       	push   $0xc010b4cf
c01042ed:	e8 56 45 00 00       	call   c0108848 <assertion_failure>
c01042f2:	83 c4 10             	add    $0x10,%esp
c01042f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042f8:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c01042ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0104302:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104308:	83 ec 04             	sub    $0x4,%esp
c010430b:	50                   	push   %eax
c010430c:	ff 75 0c             	pushl  0xc(%ebp)
c010430f:	6a 01                	push   $0x1
c0104311:	e8 a2 51 00 00       	call   c01094b8 <send_rec>
c0104316:	83 c4 10             	add    $0x10,%esp
c0104319:	90                   	nop
c010431a:	c9                   	leave  
c010431b:	c3                   	ret    

c010431c <tty_do_write>:
c010431c:	55                   	push   %ebp
c010431d:	89 e5                	mov    %esp,%ebp
c010431f:	53                   	push   %ebx
c0104320:	83 ec 24             	sub    $0x24,%esp
c0104323:	89 e0                	mov    %esp,%eax
c0104325:	89 c3                	mov    %eax,%ebx
c0104327:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010432e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104331:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104334:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104337:	89 c2                	mov    %eax,%edx
c0104339:	b8 10 00 00 00       	mov    $0x10,%eax
c010433e:	83 e8 01             	sub    $0x1,%eax
c0104341:	01 d0                	add    %edx,%eax
c0104343:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104348:	ba 00 00 00 00       	mov    $0x0,%edx
c010434d:	f7 f1                	div    %ecx
c010434f:	6b c0 10             	imul   $0x10,%eax,%eax
c0104352:	29 c4                	sub    %eax,%esp
c0104354:	89 e0                	mov    %esp,%eax
c0104356:	83 c0 00             	add    $0x0,%eax
c0104359:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010435c:	83 ec 04             	sub    $0x4,%esp
c010435f:	ff 75 e8             	pushl  -0x18(%ebp)
c0104362:	6a 00                	push   $0x0
c0104364:	ff 75 e0             	pushl  -0x20(%ebp)
c0104367:	e8 ff 7d 00 00       	call   c010c16b <Memset>
c010436c:	83 c4 10             	add    $0x10,%esp
c010436f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104372:	8b 40 60             	mov    0x60(%eax),%eax
c0104375:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104378:	8b 45 08             	mov    0x8(%ebp),%eax
c010437b:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104382:	00 00 00 
c0104385:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104388:	8b 45 0c             	mov    0xc(%ebp),%eax
c010438b:	8b 40 10             	mov    0x10(%eax),%eax
c010438e:	83 ec 08             	sub    $0x8,%esp
c0104391:	52                   	push   %edx
c0104392:	50                   	push   %eax
c0104393:	e8 57 1a 00 00       	call   c0105def <alloc_virtual_memory>
c0104398:	83 c4 10             	add    $0x10,%esp
c010439b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010439e:	eb 7e                	jmp    c010441e <tty_do_write+0x102>
c01043a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01043a3:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01043a6:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c01043aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01043ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01043b0:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01043b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01043b9:	01 d0                	add    %edx,%eax
c01043bb:	83 ec 04             	sub    $0x4,%esp
c01043be:	ff 75 f0             	pushl  -0x10(%ebp)
c01043c1:	50                   	push   %eax
c01043c2:	ff 75 e0             	pushl  -0x20(%ebp)
c01043c5:	e8 92 28 00 00       	call   c0106c5c <Memcpy>
c01043ca:	83 c4 10             	add    $0x10,%esp
c01043cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01043d0:	29 45 ec             	sub    %eax,-0x14(%ebp)
c01043d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01043d6:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01043dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01043df:	01 c2                	add    %eax,%edx
c01043e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01043e4:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01043ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01043f1:	eb 25                	jmp    c0104418 <tty_do_write+0xfc>
c01043f3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01043f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01043f9:	01 d0                	add    %edx,%eax
c01043fb:	0f b6 00             	movzbl (%eax),%eax
c01043fe:	0f b6 c0             	movzbl %al,%eax
c0104401:	83 ec 08             	sub    $0x8,%esp
c0104404:	50                   	push   %eax
c0104405:	ff 75 08             	pushl  0x8(%ebp)
c0104408:	e8 33 fa ff ff       	call   c0103e40 <out_char>
c010440d:	83 c4 10             	add    $0x10,%esp
c0104410:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104414:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104418:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010441c:	75 d5                	jne    c01043f3 <tty_do_write+0xd7>
c010441e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0104422:	0f 85 78 ff ff ff    	jne    c01043a0 <tty_do_write+0x84>
c0104428:	83 ec 0c             	sub    $0xc,%esp
c010442b:	6a 7c                	push   $0x7c
c010442d:	e8 7a d1 ff ff       	call   c01015ac <sys_malloc>
c0104432:	83 c4 10             	add    $0x10,%esp
c0104435:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104438:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010443b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104442:	8b 45 08             	mov    0x8(%ebp),%eax
c0104445:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010444b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010444e:	89 50 58             	mov    %edx,0x58(%eax)
c0104451:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104454:	8b 00                	mov    (%eax),%eax
c0104456:	83 ec 04             	sub    $0x4,%esp
c0104459:	50                   	push   %eax
c010445a:	ff 75 d8             	pushl  -0x28(%ebp)
c010445d:	6a 01                	push   $0x1
c010445f:	e8 54 50 00 00       	call   c01094b8 <send_rec>
c0104464:	83 c4 10             	add    $0x10,%esp
c0104467:	83 ec 08             	sub    $0x8,%esp
c010446a:	6a 7c                	push   $0x7c
c010446c:	ff 75 d8             	pushl  -0x28(%ebp)
c010446f:	e8 4d d1 ff ff       	call   c01015c1 <sys_free>
c0104474:	83 c4 10             	add    $0x10,%esp
c0104477:	89 dc                	mov    %ebx,%esp
c0104479:	90                   	nop
c010447a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010447d:	c9                   	leave  
c010447e:	c3                   	ret    

c010447f <init_screen>:
c010447f:	55                   	push   %ebp
c0104480:	89 e5                	mov    %esp,%ebp
c0104482:	83 ec 10             	sub    $0x10,%esp
c0104485:	8b 45 08             	mov    0x8(%ebp),%eax
c0104488:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010448d:	c1 f8 03             	sar    $0x3,%eax
c0104490:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104496:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104499:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010449c:	c1 e0 04             	shl    $0x4,%eax
c010449f:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c01044a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01044a8:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c01044ae:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c01044b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01044b8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01044be:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01044c1:	89 50 04             	mov    %edx,0x4(%eax)
c01044c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01044c7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01044cd:	8b 50 04             	mov    0x4(%eax),%edx
c01044d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01044d3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01044d9:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c01044dd:	89 10                	mov    %edx,(%eax)
c01044df:	8b 45 08             	mov    0x8(%ebp),%eax
c01044e2:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c01044e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01044eb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01044f1:	8b 12                	mov    (%edx),%edx
c01044f3:	89 50 08             	mov    %edx,0x8(%eax)
c01044f6:	8b 55 08             	mov    0x8(%ebp),%edx
c01044f9:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c01044ff:	8b 40 08             	mov    0x8(%eax),%eax
c0104502:	89 42 0c             	mov    %eax,0xc(%edx)
c0104505:	90                   	nop
c0104506:	c9                   	leave  
c0104507:	c3                   	ret    

c0104508 <init_tty>:
c0104508:	55                   	push   %ebp
c0104509:	89 e5                	mov    %esp,%ebp
c010450b:	83 ec 18             	sub    $0x18,%esp
c010450e:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104515:	e9 92 00 00 00       	jmp    c01045ac <init_tty+0xa4>
c010451a:	83 ec 04             	sub    $0x4,%esp
c010451d:	68 28 08 00 00       	push   $0x828
c0104522:	6a 00                	push   $0x0
c0104524:	ff 75 f4             	pushl  -0xc(%ebp)
c0104527:	e8 3f 7c 00 00       	call   c010c16b <Memset>
c010452c:	83 c4 10             	add    $0x10,%esp
c010452f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104532:	8d 50 08             	lea    0x8(%eax),%edx
c0104535:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104538:	89 50 04             	mov    %edx,0x4(%eax)
c010453b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010453e:	8b 50 04             	mov    0x4(%eax),%edx
c0104541:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104544:	89 10                	mov    %edx,(%eax)
c0104546:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104549:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0104550:	00 00 00 
c0104553:	83 ec 0c             	sub    $0xc,%esp
c0104556:	ff 75 f4             	pushl  -0xc(%ebp)
c0104559:	e8 21 ff ff ff       	call   c010447f <init_screen>
c010455e:	83 c4 10             	add    $0x10,%esp
c0104561:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104564:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104569:	85 c0                	test   %eax,%eax
c010456b:	7e 38                	jle    c01045a5 <init_tty+0x9d>
c010456d:	83 ec 08             	sub    $0x8,%esp
c0104570:	6a 23                	push   $0x23
c0104572:	ff 75 f4             	pushl  -0xc(%ebp)
c0104575:	e8 c6 f8 ff ff       	call   c0103e40 <out_char>
c010457a:	83 c4 10             	add    $0x10,%esp
c010457d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104580:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0104585:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010458a:	c1 f8 03             	sar    $0x3,%eax
c010458d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104593:	0f b6 c0             	movzbl %al,%eax
c0104596:	83 ec 08             	sub    $0x8,%esp
c0104599:	50                   	push   %eax
c010459a:	ff 75 f4             	pushl  -0xc(%ebp)
c010459d:	e8 9e f8 ff ff       	call   c0103e40 <out_char>
c01045a2:	83 c4 10             	add    $0x10,%esp
c01045a5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01045ac:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01045b1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01045b4:	0f 82 60 ff ff ff    	jb     c010451a <init_tty+0x12>
c01045ba:	90                   	nop
c01045bb:	c9                   	leave  
c01045bc:	c3                   	ret    

c01045bd <TaskTTY>:
c01045bd:	55                   	push   %ebp
c01045be:	89 e5                	mov    %esp,%ebp
c01045c0:	83 ec 28             	sub    $0x28,%esp
c01045c3:	e8 40 ff ff ff       	call   c0104508 <init_tty>
c01045c8:	83 ec 0c             	sub    $0xc,%esp
c01045cb:	6a 00                	push   $0x0
c01045cd:	e8 24 f6 ff ff       	call   c0103bf6 <select_console>
c01045d2:	83 c4 10             	add    $0x10,%esp
c01045d5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01045dc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01045e3:	83 ec 0c             	sub    $0xc,%esp
c01045e6:	6a 7c                	push   $0x7c
c01045e8:	e8 bf cf ff ff       	call   c01015ac <sys_malloc>
c01045ed:	83 c4 10             	add    $0x10,%esp
c01045f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01045f3:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01045fa:	eb 30                	jmp    c010462c <TaskTTY+0x6f>
c01045fc:	83 ec 0c             	sub    $0xc,%esp
c01045ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0104602:	e8 f6 f9 ff ff       	call   c0103ffd <tty_dev_read>
c0104607:	83 c4 10             	add    $0x10,%esp
c010460a:	83 ec 0c             	sub    $0xc,%esp
c010460d:	ff 75 f4             	pushl  -0xc(%ebp)
c0104610:	e8 12 fa ff ff       	call   c0104027 <tty_dev_write>
c0104615:	83 c4 10             	add    $0x10,%esp
c0104618:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010461b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104621:	85 c0                	test   %eax,%eax
c0104623:	75 d7                	jne    c01045fc <TaskTTY+0x3f>
c0104625:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010462c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104631:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104634:	72 c6                	jb     c01045fc <TaskTTY+0x3f>
c0104636:	83 ec 04             	sub    $0x4,%esp
c0104639:	6a 12                	push   $0x12
c010463b:	ff 75 e8             	pushl  -0x18(%ebp)
c010463e:	6a 02                	push   $0x2
c0104640:	e8 73 4e 00 00       	call   c01094b8 <send_rec>
c0104645:	83 c4 10             	add    $0x10,%esp
c0104648:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010464b:	8b 40 78             	mov    0x78(%eax),%eax
c010464e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104651:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104658:	74 28                	je     c0104682 <TaskTTY+0xc5>
c010465a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104661:	7f 0b                	jg     c010466e <TaskTTY+0xb1>
c0104663:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c010466a:	74 4e                	je     c01046ba <TaskTTY+0xfd>
c010466c:	eb 4d                	jmp    c01046bb <TaskTTY+0xfe>
c010466e:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104675:	74 21                	je     c0104698 <TaskTTY+0xdb>
c0104677:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c010467e:	74 2e                	je     c01046ae <TaskTTY+0xf1>
c0104680:	eb 39                	jmp    c01046bb <TaskTTY+0xfe>
c0104682:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104687:	83 ec 08             	sub    $0x8,%esp
c010468a:	ff 75 e8             	pushl  -0x18(%ebp)
c010468d:	50                   	push   %eax
c010468e:	e8 c1 fb ff ff       	call   c0104254 <tty_do_read>
c0104693:	83 c4 10             	add    $0x10,%esp
c0104696:	eb 23                	jmp    c01046bb <TaskTTY+0xfe>
c0104698:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c010469d:	83 ec 08             	sub    $0x8,%esp
c01046a0:	ff 75 e8             	pushl  -0x18(%ebp)
c01046a3:	50                   	push   %eax
c01046a4:	e8 73 fc ff ff       	call   c010431c <tty_do_write>
c01046a9:	83 c4 10             	add    $0x10,%esp
c01046ac:	eb 0d                	jmp    c01046bb <TaskTTY+0xfe>
c01046ae:	c7 05 c0 06 11 c0 00 	movl   $0x0,0xc01106c0
c01046b5:	00 00 00 
c01046b8:	eb 01                	jmp    c01046bb <TaskTTY+0xfe>
c01046ba:	90                   	nop
c01046bb:	e9 33 ff ff ff       	jmp    c01045f3 <TaskTTY+0x36>

c01046c0 <keyboard_handler>:
c01046c0:	55                   	push   %ebp
c01046c1:	89 e5                	mov    %esp,%ebp
c01046c3:	83 ec 18             	sub    $0x18,%esp
c01046c6:	c7 05 c0 06 11 c0 01 	movl   $0x1,0xc01106c0
c01046cd:	00 00 00 
c01046d0:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c01046d7:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01046dc:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c01046e1:	7f 5e                	jg     c0104741 <keyboard_handler+0x81>
c01046e3:	e8 25 bc ff ff       	call   c010030d <disable_int>
c01046e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046eb:	0f b7 c0             	movzwl %ax,%eax
c01046ee:	83 ec 0c             	sub    $0xc,%esp
c01046f1:	50                   	push   %eax
c01046f2:	e8 e8 bb ff ff       	call   c01002df <in_byte>
c01046f7:	83 c4 10             	add    $0x10,%esp
c01046fa:	88 45 f3             	mov    %al,-0xd(%ebp)
c01046fd:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104702:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104706:	88 10                	mov    %dl,(%eax)
c0104708:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010470d:	83 c0 01             	add    $0x1,%eax
c0104710:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104715:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010471a:	83 c0 01             	add    $0x1,%eax
c010471d:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104722:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104727:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c010472c:	39 d0                	cmp    %edx,%eax
c010472e:	72 0a                	jb     c010473a <keyboard_handler+0x7a>
c0104730:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104737:	fb 10 c0 
c010473a:	e8 d0 bb ff ff       	call   c010030f <enable_int>
c010473f:	eb 01                	jmp    c0104742 <keyboard_handler+0x82>
c0104741:	90                   	nop
c0104742:	c9                   	leave  
c0104743:	c3                   	ret    

c0104744 <read_from_keyboard_buf>:
c0104744:	55                   	push   %ebp
c0104745:	89 e5                	mov    %esp,%ebp
c0104747:	83 ec 18             	sub    $0x18,%esp
c010474a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c010474e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104753:	85 c0                	test   %eax,%eax
c0104755:	7f 06                	jg     c010475d <read_from_keyboard_buf+0x19>
c0104757:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c010475b:	eb 4b                	jmp    c01047a8 <read_from_keyboard_buf+0x64>
c010475d:	e8 ab bb ff ff       	call   c010030d <disable_int>
c0104762:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104767:	0f b6 00             	movzbl (%eax),%eax
c010476a:	88 45 f7             	mov    %al,-0x9(%ebp)
c010476d:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104772:	83 c0 01             	add    $0x1,%eax
c0104775:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010477a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010477f:	83 e8 01             	sub    $0x1,%eax
c0104782:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104787:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c010478c:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104791:	39 d0                	cmp    %edx,%eax
c0104793:	72 0a                	jb     c010479f <read_from_keyboard_buf+0x5b>
c0104795:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c010479c:	fb 10 c0 
c010479f:	e8 6b bb ff ff       	call   c010030f <enable_int>
c01047a4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01047a8:	c9                   	leave  
c01047a9:	c3                   	ret    

c01047aa <keyboard_read>:
c01047aa:	55                   	push   %ebp
c01047ab:	89 e5                	mov    %esp,%ebp
c01047ad:	83 ec 28             	sub    $0x28,%esp
c01047b0:	90                   	nop
c01047b1:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047b6:	85 c0                	test   %eax,%eax
c01047b8:	7e f7                	jle    c01047b1 <keyboard_read+0x7>
c01047ba:	e8 85 ff ff ff       	call   c0104744 <read_from_keyboard_buf>
c01047bf:	88 45 ea             	mov    %al,-0x16(%ebp)
c01047c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01047c9:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01047cd:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c01047d1:	75 5a                	jne    c010482d <keyboard_read+0x83>
c01047d3:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c01047d7:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c01047db:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c01047df:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c01047e3:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c01047e7:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c01047eb:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c01047ef:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01047f6:	eb 20                	jmp    c0104818 <keyboard_read+0x6e>
c01047f8:	e8 47 ff ff ff       	call   c0104744 <read_from_keyboard_buf>
c01047fd:	89 c1                	mov    %eax,%ecx
c01047ff:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104802:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104805:	01 d0                	add    %edx,%eax
c0104807:	0f b6 00             	movzbl (%eax),%eax
c010480a:	38 c1                	cmp    %al,%cl
c010480c:	74 06                	je     c0104814 <keyboard_read+0x6a>
c010480e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0104812:	eb 0a                	jmp    c010481e <keyboard_read+0x74>
c0104814:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104818:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c010481c:	7e da                	jle    c01047f8 <keyboard_read+0x4e>
c010481e:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0104822:	74 68                	je     c010488c <keyboard_read+0xe2>
c0104824:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c010482b:	eb 5f                	jmp    c010488c <keyboard_read+0xe2>
c010482d:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104831:	75 59                	jne    c010488c <keyboard_read+0xe2>
c0104833:	e8 0c ff ff ff       	call   c0104744 <read_from_keyboard_buf>
c0104838:	3c 2a                	cmp    $0x2a,%al
c010483a:	75 1d                	jne    c0104859 <keyboard_read+0xaf>
c010483c:	e8 03 ff ff ff       	call   c0104744 <read_from_keyboard_buf>
c0104841:	3c e0                	cmp    $0xe0,%al
c0104843:	75 14                	jne    c0104859 <keyboard_read+0xaf>
c0104845:	e8 fa fe ff ff       	call   c0104744 <read_from_keyboard_buf>
c010484a:	3c 37                	cmp    $0x37,%al
c010484c:	75 0b                	jne    c0104859 <keyboard_read+0xaf>
c010484e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104855:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104859:	e8 e6 fe ff ff       	call   c0104744 <read_from_keyboard_buf>
c010485e:	3c b7                	cmp    $0xb7,%al
c0104860:	75 1d                	jne    c010487f <keyboard_read+0xd5>
c0104862:	e8 dd fe ff ff       	call   c0104744 <read_from_keyboard_buf>
c0104867:	3c e0                	cmp    $0xe0,%al
c0104869:	75 14                	jne    c010487f <keyboard_read+0xd5>
c010486b:	e8 d4 fe ff ff       	call   c0104744 <read_from_keyboard_buf>
c0104870:	3c aa                	cmp    $0xaa,%al
c0104872:	75 0b                	jne    c010487f <keyboard_read+0xd5>
c0104874:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c010487b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010487f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104883:	75 07                	jne    c010488c <keyboard_read+0xe2>
c0104885:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c010488c:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104893:	0f 84 8d 00 00 00    	je     c0104926 <keyboard_read+0x17c>
c0104899:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c01048a0:	0f 84 80 00 00 00    	je     c0104926 <keyboard_read+0x17c>
c01048a6:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c01048aa:	0f 94 c2             	sete   %dl
c01048ad:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c01048b1:	0f 94 c0             	sete   %al
c01048b4:	09 d0                	or     %edx,%eax
c01048b6:	84 c0                	test   %al,%al
c01048b8:	74 07                	je     c01048c1 <keyboard_read+0x117>
c01048ba:	c6 05 c8 06 11 c0 01 	movb   $0x1,0xc01106c8
c01048c1:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c01048c5:	f7 d0                	not    %eax
c01048c7:	c0 e8 07             	shr    $0x7,%al
c01048ca:	88 45 e9             	mov    %al,-0x17(%ebp)
c01048cd:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c01048d1:	74 53                	je     c0104926 <keyboard_read+0x17c>
c01048d3:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c01048d7:	74 4d                	je     c0104926 <keyboard_read+0x17c>
c01048d9:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c01048dd:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c01048e4:	3c 01                	cmp    $0x1,%al
c01048e6:	75 04                	jne    c01048ec <keyboard_read+0x142>
c01048e8:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c01048ec:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c01048f3:	84 c0                	test   %al,%al
c01048f5:	74 04                	je     c01048fb <keyboard_read+0x151>
c01048f7:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c01048fb:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c01048ff:	89 d0                	mov    %edx,%eax
c0104901:	01 c0                	add    %eax,%eax
c0104903:	01 c2                	add    %eax,%edx
c0104905:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104909:	01 d0                	add    %edx,%eax
c010490b:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c0104912:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104915:	83 ec 08             	sub    $0x8,%esp
c0104918:	ff 75 f4             	pushl  -0xc(%ebp)
c010491b:	ff 75 08             	pushl  0x8(%ebp)
c010491e:	e8 1a 00 00 00       	call   c010493d <in_process>
c0104923:	83 c4 10             	add    $0x10,%esp
c0104926:	90                   	nop
c0104927:	c9                   	leave  
c0104928:	c3                   	ret    

c0104929 <init_keyboard_handler>:
c0104929:	55                   	push   %ebp
c010492a:	89 e5                	mov    %esp,%ebp
c010492c:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104933:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c010493a:	90                   	nop
c010493b:	5d                   	pop    %ebp
c010493c:	c3                   	ret    

c010493d <in_process>:
c010493d:	55                   	push   %ebp
c010493e:	89 e5                	mov    %esp,%ebp
c0104940:	83 ec 18             	sub    $0x18,%esp
c0104943:	83 ec 04             	sub    $0x4,%esp
c0104946:	6a 02                	push   $0x2
c0104948:	6a 00                	push   $0x0
c010494a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c010494d:	50                   	push   %eax
c010494e:	e8 18 78 00 00       	call   c010c16b <Memset>
c0104953:	83 c4 10             	add    $0x10,%esp
c0104956:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104959:	25 00 01 00 00       	and    $0x100,%eax
c010495e:	85 c0                	test   %eax,%eax
c0104960:	75 28                	jne    c010498a <in_process+0x4d>
c0104962:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104965:	0f b6 c0             	movzbl %al,%eax
c0104968:	83 ec 08             	sub    $0x8,%esp
c010496b:	50                   	push   %eax
c010496c:	ff 75 08             	pushl  0x8(%ebp)
c010496f:	e8 b3 f3 ff ff       	call   c0103d27 <put_key>
c0104974:	83 c4 10             	add    $0x10,%esp
c0104977:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c010497e:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104985:	e9 42 01 00 00       	jmp    c0104acc <in_process+0x18f>
c010498a:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c0104991:	84 c0                	test   %al,%al
c0104993:	0f 84 a9 00 00 00    	je     c0104a42 <in_process+0x105>
c0104999:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c010499d:	0f 84 9f 00 00 00    	je     c0104a42 <in_process+0x105>
c01049a3:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c01049a7:	0f 84 95 00 00 00    	je     c0104a42 <in_process+0x105>
c01049ad:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c01049b4:	74 64                	je     c0104a1a <in_process+0xdd>
c01049b6:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c01049bd:	77 0b                	ja     c01049ca <in_process+0x8d>
c01049bf:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c01049c6:	74 64                	je     c0104a2c <in_process+0xef>
c01049c8:	eb 73                	jmp    c0104a3d <in_process+0x100>
c01049ca:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c01049d1:	74 0b                	je     c01049de <in_process+0xa1>
c01049d3:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c01049da:	74 20                	je     c01049fc <in_process+0xbf>
c01049dc:	eb 5f                	jmp    c0104a3d <in_process+0x100>
c01049de:	83 ec 0c             	sub    $0xc,%esp
c01049e1:	ff 75 08             	pushl  0x8(%ebp)
c01049e4:	e8 aa f3 ff ff       	call   c0103d93 <scroll_up>
c01049e9:	83 c4 10             	add    $0x10,%esp
c01049ec:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c01049f3:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01049fa:	eb 41                	jmp    c0104a3d <in_process+0x100>
c01049fc:	83 ec 0c             	sub    $0xc,%esp
c01049ff:	ff 75 08             	pushl  0x8(%ebp)
c0104a02:	e8 ce f3 ff ff       	call   c0103dd5 <scroll_down>
c0104a07:	83 c4 10             	add    $0x10,%esp
c0104a0a:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104a11:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a18:	eb 23                	jmp    c0104a3d <in_process+0x100>
c0104a1a:	83 ec 08             	sub    $0x8,%esp
c0104a1d:	6a 0a                	push   $0xa
c0104a1f:	ff 75 08             	pushl  0x8(%ebp)
c0104a22:	e8 19 f4 ff ff       	call   c0103e40 <out_char>
c0104a27:	83 c4 10             	add    $0x10,%esp
c0104a2a:	eb 11                	jmp    c0104a3d <in_process+0x100>
c0104a2c:	83 ec 08             	sub    $0x8,%esp
c0104a2f:	6a 08                	push   $0x8
c0104a31:	ff 75 08             	pushl  0x8(%ebp)
c0104a34:	e8 07 f4 ff ff       	call   c0103e40 <out_char>
c0104a39:	83 c4 10             	add    $0x10,%esp
c0104a3c:	90                   	nop
c0104a3d:	e9 8a 00 00 00       	jmp    c0104acc <in_process+0x18f>
c0104a42:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104a49:	74 55                	je     c0104aa0 <in_process+0x163>
c0104a4b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104a52:	77 14                	ja     c0104a68 <in_process+0x12b>
c0104a54:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104a5b:	74 31                	je     c0104a8e <in_process+0x151>
c0104a5d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a64:	74 16                	je     c0104a7c <in_process+0x13f>
c0104a66:	eb 64                	jmp    c0104acc <in_process+0x18f>
c0104a68:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104a6f:	74 3e                	je     c0104aaf <in_process+0x172>
c0104a71:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104a78:	74 44                	je     c0104abe <in_process+0x181>
c0104a7a:	eb 50                	jmp    c0104acc <in_process+0x18f>
c0104a7c:	83 ec 08             	sub    $0x8,%esp
c0104a7f:	6a 0a                	push   $0xa
c0104a81:	ff 75 08             	pushl  0x8(%ebp)
c0104a84:	e8 9e f2 ff ff       	call   c0103d27 <put_key>
c0104a89:	83 c4 10             	add    $0x10,%esp
c0104a8c:	eb 3e                	jmp    c0104acc <in_process+0x18f>
c0104a8e:	83 ec 08             	sub    $0x8,%esp
c0104a91:	6a 08                	push   $0x8
c0104a93:	ff 75 08             	pushl  0x8(%ebp)
c0104a96:	e8 8c f2 ff ff       	call   c0103d27 <put_key>
c0104a9b:	83 c4 10             	add    $0x10,%esp
c0104a9e:	eb 2c                	jmp    c0104acc <in_process+0x18f>
c0104aa0:	83 ec 0c             	sub    $0xc,%esp
c0104aa3:	6a 00                	push   $0x0
c0104aa5:	e8 4c f1 ff ff       	call   c0103bf6 <select_console>
c0104aaa:	83 c4 10             	add    $0x10,%esp
c0104aad:	eb 1d                	jmp    c0104acc <in_process+0x18f>
c0104aaf:	83 ec 0c             	sub    $0xc,%esp
c0104ab2:	6a 01                	push   $0x1
c0104ab4:	e8 3d f1 ff ff       	call   c0103bf6 <select_console>
c0104ab9:	83 c4 10             	add    $0x10,%esp
c0104abc:	eb 0e                	jmp    c0104acc <in_process+0x18f>
c0104abe:	83 ec 0c             	sub    $0xc,%esp
c0104ac1:	6a 02                	push   $0x2
c0104ac3:	e8 2e f1 ff ff       	call   c0103bf6 <select_console>
c0104ac8:	83 c4 10             	add    $0x10,%esp
c0104acb:	90                   	nop
c0104acc:	90                   	nop
c0104acd:	c9                   	leave  
c0104ace:	c3                   	ret    

c0104acf <open>:
c0104acf:	55                   	push   %ebp
c0104ad0:	89 e5                	mov    %esp,%ebp
c0104ad2:	83 ec 18             	sub    $0x18,%esp
c0104ad5:	83 ec 0c             	sub    $0xc,%esp
c0104ad8:	6a 7c                	push   $0x7c
c0104ada:	e8 cd ca ff ff       	call   c01015ac <sys_malloc>
c0104adf:	83 c4 10             	add    $0x10,%esp
c0104ae2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104ae5:	83 ec 04             	sub    $0x4,%esp
c0104ae8:	6a 7c                	push   $0x7c
c0104aea:	6a 00                	push   $0x0
c0104aec:	ff 75 f4             	pushl  -0xc(%ebp)
c0104aef:	e8 77 76 00 00       	call   c010c16b <Memset>
c0104af4:	83 c4 10             	add    $0x10,%esp
c0104af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104afa:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104b01:	83 ec 0c             	sub    $0xc,%esp
c0104b04:	ff 75 08             	pushl  0x8(%ebp)
c0104b07:	e8 32 14 00 00       	call   c0105f3e <get_physical_address>
c0104b0c:	83 c4 10             	add    $0x10,%esp
c0104b0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b15:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104b18:	89 50 44             	mov    %edx,0x44(%eax)
c0104b1b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104b1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b21:	89 50 74             	mov    %edx,0x74(%eax)
c0104b24:	83 ec 0c             	sub    $0xc,%esp
c0104b27:	ff 75 08             	pushl  0x8(%ebp)
c0104b2a:	e8 75 76 00 00       	call   c010c1a4 <Strlen>
c0104b2f:	83 c4 10             	add    $0x10,%esp
c0104b32:	89 c2                	mov    %eax,%edx
c0104b34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b37:	89 50 40             	mov    %edx,0x40(%eax)
c0104b3a:	83 ec 04             	sub    $0x4,%esp
c0104b3d:	6a 02                	push   $0x2
c0104b3f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b42:	6a 03                	push   $0x3
c0104b44:	e8 6f 49 00 00       	call   c01094b8 <send_rec>
c0104b49:	83 c4 10             	add    $0x10,%esp
c0104b4c:	83 ec 08             	sub    $0x8,%esp
c0104b4f:	6a 7c                	push   $0x7c
c0104b51:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b54:	e8 68 ca ff ff       	call   c01015c1 <sys_free>
c0104b59:	83 c4 10             	add    $0x10,%esp
c0104b5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b5f:	8b 40 50             	mov    0x50(%eax),%eax
c0104b62:	c9                   	leave  
c0104b63:	c3                   	ret    

c0104b64 <read>:
c0104b64:	55                   	push   %ebp
c0104b65:	89 e5                	mov    %esp,%ebp
c0104b67:	83 ec 38             	sub    $0x38,%esp
c0104b6a:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104b71:	83 ec 0c             	sub    $0xc,%esp
c0104b74:	ff 75 dc             	pushl  -0x24(%ebp)
c0104b77:	e8 30 ca ff ff       	call   c01015ac <sys_malloc>
c0104b7c:	83 c4 10             	add    $0x10,%esp
c0104b7f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104b82:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104b85:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104b8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104b8d:	83 ec 0c             	sub    $0xc,%esp
c0104b90:	ff 75 0c             	pushl  0xc(%ebp)
c0104b93:	e8 a6 13 00 00       	call   c0105f3e <get_physical_address>
c0104b98:	83 c4 10             	add    $0x10,%esp
c0104b9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104b9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ba1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104ba6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104ba9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104bac:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104bb1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104bb4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104bbb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104bc2:	8b 55 10             	mov    0x10(%ebp),%edx
c0104bc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104bc8:	01 d0                	add    %edx,%eax
c0104bca:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104bcd:	0f 83 a8 00 00 00    	jae    c0104c7b <read+0x117>
c0104bd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104bd6:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104bd9:	05 00 10 00 00       	add    $0x1000,%eax
c0104bde:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104be1:	8b 45 10             	mov    0x10(%ebp),%eax
c0104be4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104be7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104bea:	83 ec 04             	sub    $0x4,%esp
c0104bed:	50                   	push   %eax
c0104bee:	6a 00                	push   $0x0
c0104bf0:	ff 75 d8             	pushl  -0x28(%ebp)
c0104bf3:	e8 73 75 00 00       	call   c010c16b <Memset>
c0104bf8:	83 c4 10             	add    $0x10,%esp
c0104bfb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bfe:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104c05:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c08:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c0b:	89 50 50             	mov    %edx,0x50(%eax)
c0104c0e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c11:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104c14:	89 50 10             	mov    %edx,0x10(%eax)
c0104c17:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c1a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104c1d:	89 50 60             	mov    %edx,0x60(%eax)
c0104c20:	83 ec 04             	sub    $0x4,%esp
c0104c23:	6a 02                	push   $0x2
c0104c25:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c28:	6a 03                	push   $0x3
c0104c2a:	e8 89 48 00 00       	call   c01094b8 <send_rec>
c0104c2f:	83 c4 10             	add    $0x10,%esp
c0104c32:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c35:	8b 40 60             	mov    0x60(%eax),%eax
c0104c38:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104c3b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104c3e:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104c41:	8b 45 10             	mov    0x10(%ebp),%eax
c0104c44:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104c47:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104c4a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104c4d:	89 45 10             	mov    %eax,0x10(%ebp)
c0104c50:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104c57:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104c5e:	83 ec 0c             	sub    $0xc,%esp
c0104c61:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c64:	e8 d5 12 00 00       	call   c0105f3e <get_physical_address>
c0104c69:	83 c4 10             	add    $0x10,%esp
c0104c6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c6f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104c73:	0f 85 6e ff ff ff    	jne    c0104be7 <read+0x83>
c0104c79:	eb 54                	jmp    c0104ccf <read+0x16b>
c0104c7b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104c7e:	83 ec 04             	sub    $0x4,%esp
c0104c81:	50                   	push   %eax
c0104c82:	6a 00                	push   $0x0
c0104c84:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c87:	e8 df 74 00 00       	call   c010c16b <Memset>
c0104c8c:	83 c4 10             	add    $0x10,%esp
c0104c8f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c92:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104c99:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c9c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c9f:	89 50 50             	mov    %edx,0x50(%eax)
c0104ca2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ca5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ca8:	89 50 10             	mov    %edx,0x10(%eax)
c0104cab:	8b 55 10             	mov    0x10(%ebp),%edx
c0104cae:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cb1:	89 50 60             	mov    %edx,0x60(%eax)
c0104cb4:	83 ec 04             	sub    $0x4,%esp
c0104cb7:	6a 02                	push   $0x2
c0104cb9:	ff 75 d8             	pushl  -0x28(%ebp)
c0104cbc:	6a 03                	push   $0x3
c0104cbe:	e8 f5 47 00 00       	call   c01094b8 <send_rec>
c0104cc3:	83 c4 10             	add    $0x10,%esp
c0104cc6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cc9:	8b 40 60             	mov    0x60(%eax),%eax
c0104ccc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104ccf:	83 ec 08             	sub    $0x8,%esp
c0104cd2:	ff 75 dc             	pushl  -0x24(%ebp)
c0104cd5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104cd8:	e8 e4 c8 ff ff       	call   c01015c1 <sys_free>
c0104cdd:	83 c4 10             	add    $0x10,%esp
c0104ce0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104ce3:	c9                   	leave  
c0104ce4:	c3                   	ret    

c0104ce5 <write>:
c0104ce5:	55                   	push   %ebp
c0104ce6:	89 e5                	mov    %esp,%ebp
c0104ce8:	83 ec 18             	sub    $0x18,%esp
c0104ceb:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104cf2:	83 ec 0c             	sub    $0xc,%esp
c0104cf5:	ff 75 f4             	pushl  -0xc(%ebp)
c0104cf8:	e8 af c8 ff ff       	call   c01015ac <sys_malloc>
c0104cfd:	83 c4 10             	add    $0x10,%esp
c0104d00:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104d03:	83 ec 0c             	sub    $0xc,%esp
c0104d06:	ff 75 0c             	pushl  0xc(%ebp)
c0104d09:	e8 30 12 00 00       	call   c0105f3e <get_physical_address>
c0104d0e:	83 c4 10             	add    $0x10,%esp
c0104d11:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104d14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d17:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104d1e:	8b 55 08             	mov    0x8(%ebp),%edx
c0104d21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d24:	89 50 50             	mov    %edx,0x50(%eax)
c0104d27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d2a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104d2d:	89 50 10             	mov    %edx,0x10(%eax)
c0104d30:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d33:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d36:	89 50 60             	mov    %edx,0x60(%eax)
c0104d39:	83 ec 04             	sub    $0x4,%esp
c0104d3c:	6a 02                	push   $0x2
c0104d3e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104d41:	6a 03                	push   $0x3
c0104d43:	e8 70 47 00 00       	call   c01094b8 <send_rec>
c0104d48:	83 c4 10             	add    $0x10,%esp
c0104d4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d4e:	8b 40 60             	mov    0x60(%eax),%eax
c0104d51:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104d54:	83 ec 08             	sub    $0x8,%esp
c0104d57:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d5a:	ff 75 f0             	pushl  -0x10(%ebp)
c0104d5d:	e8 5f c8 ff ff       	call   c01015c1 <sys_free>
c0104d62:	83 c4 10             	add    $0x10,%esp
c0104d65:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104d68:	c9                   	leave  
c0104d69:	c3                   	ret    

c0104d6a <close>:
c0104d6a:	55                   	push   %ebp
c0104d6b:	89 e5                	mov    %esp,%ebp
c0104d6d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d73:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104d7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d7d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104d80:	83 ec 04             	sub    $0x4,%esp
c0104d83:	6a 02                	push   $0x2
c0104d85:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d8b:	50                   	push   %eax
c0104d8c:	6a 03                	push   $0x3
c0104d8e:	e8 25 47 00 00       	call   c01094b8 <send_rec>
c0104d93:	83 c4 10             	add    $0x10,%esp
c0104d96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d99:	83 f8 65             	cmp    $0x65,%eax
c0104d9c:	74 19                	je     c0104db7 <close+0x4d>
c0104d9e:	6a 13                	push   $0x13
c0104da0:	68 e7 b4 10 c0       	push   $0xc010b4e7
c0104da5:	68 e7 b4 10 c0       	push   $0xc010b4e7
c0104daa:	68 f3 b4 10 c0       	push   $0xc010b4f3
c0104daf:	e8 94 3a 00 00       	call   c0108848 <assertion_failure>
c0104db4:	83 c4 10             	add    $0x10,%esp
c0104db7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104dba:	c9                   	leave  
c0104dbb:	c3                   	ret    

c0104dbc <wait>:
c0104dbc:	55                   	push   %ebp
c0104dbd:	89 e5                	mov    %esp,%ebp
c0104dbf:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104dc5:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104dcc:	83 ec 04             	sub    $0x4,%esp
c0104dcf:	6a 01                	push   $0x1
c0104dd1:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104dd7:	50                   	push   %eax
c0104dd8:	6a 03                	push   $0x3
c0104dda:	e8 d9 46 00 00       	call   c01094b8 <send_rec>
c0104ddf:	83 c4 10             	add    $0x10,%esp
c0104de2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104de5:	89 c2                	mov    %eax,%edx
c0104de7:	8b 45 08             	mov    0x8(%ebp),%eax
c0104dea:	89 10                	mov    %edx,(%eax)
c0104dec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104def:	83 f8 21             	cmp    $0x21,%eax
c0104df2:	74 05                	je     c0104df9 <wait+0x3d>
c0104df4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104df7:	eb 05                	jmp    c0104dfe <wait+0x42>
c0104df9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104dfe:	c9                   	leave  
c0104dff:	c3                   	ret    

c0104e00 <exit>:
c0104e00:	55                   	push   %ebp
c0104e01:	89 e5                	mov    %esp,%ebp
c0104e03:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e09:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104e10:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e13:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104e16:	83 ec 04             	sub    $0x4,%esp
c0104e19:	6a 01                	push   $0x1
c0104e1b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e21:	50                   	push   %eax
c0104e22:	6a 03                	push   $0x3
c0104e24:	e8 8f 46 00 00       	call   c01094b8 <send_rec>
c0104e29:	83 c4 10             	add    $0x10,%esp
c0104e2c:	90                   	nop
c0104e2d:	c9                   	leave  
c0104e2e:	c3                   	ret    

c0104e2f <fork>:
c0104e2f:	55                   	push   %ebp
c0104e30:	89 e5                	mov    %esp,%ebp
c0104e32:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e38:	83 ec 04             	sub    $0x4,%esp
c0104e3b:	6a 7c                	push   $0x7c
c0104e3d:	6a 00                	push   $0x0
c0104e3f:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e45:	50                   	push   %eax
c0104e46:	e8 20 73 00 00       	call   c010c16b <Memset>
c0104e4b:	83 c4 10             	add    $0x10,%esp
c0104e4e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104e55:	83 ec 04             	sub    $0x4,%esp
c0104e58:	6a 01                	push   $0x1
c0104e5a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e60:	50                   	push   %eax
c0104e61:	6a 03                	push   $0x3
c0104e63:	e8 50 46 00 00       	call   c01094b8 <send_rec>
c0104e68:	83 c4 10             	add    $0x10,%esp
c0104e6b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104e72:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e75:	c9                   	leave  
c0104e76:	c3                   	ret    

c0104e77 <getpid>:
c0104e77:	55                   	push   %ebp
c0104e78:	89 e5                	mov    %esp,%ebp
c0104e7a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e80:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104e87:	83 ec 04             	sub    $0x4,%esp
c0104e8a:	6a 05                	push   $0x5
c0104e8c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e92:	50                   	push   %eax
c0104e93:	6a 03                	push   $0x3
c0104e95:	e8 1e 46 00 00       	call   c01094b8 <send_rec>
c0104e9a:	83 c4 10             	add    $0x10,%esp
c0104e9d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ea0:	c9                   	leave  
c0104ea1:	c3                   	ret    

c0104ea2 <exec>:
c0104ea2:	55                   	push   %ebp
c0104ea3:	89 e5                	mov    %esp,%ebp
c0104ea5:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104eab:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104eb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0104eb5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104eb8:	83 ec 0c             	sub    $0xc,%esp
c0104ebb:	ff 75 08             	pushl  0x8(%ebp)
c0104ebe:	e8 e1 72 00 00       	call   c010c1a4 <Strlen>
c0104ec3:	83 c4 10             	add    $0x10,%esp
c0104ec6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104ec9:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104ed0:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104ed7:	83 ec 04             	sub    $0x4,%esp
c0104eda:	6a 01                	push   $0x1
c0104edc:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ee2:	50                   	push   %eax
c0104ee3:	6a 03                	push   $0x3
c0104ee5:	e8 ce 45 00 00       	call   c01094b8 <send_rec>
c0104eea:	83 c4 10             	add    $0x10,%esp
c0104eed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ef0:	83 f8 65             	cmp    $0x65,%eax
c0104ef3:	74 19                	je     c0104f0e <exec+0x6c>
c0104ef5:	6a 19                	push   $0x19
c0104ef7:	68 0b b5 10 c0       	push   $0xc010b50b
c0104efc:	68 0b b5 10 c0       	push   $0xc010b50b
c0104f01:	68 16 b5 10 c0       	push   $0xc010b516
c0104f06:	e8 3d 39 00 00       	call   c0108848 <assertion_failure>
c0104f0b:	83 c4 10             	add    $0x10,%esp
c0104f0e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104f11:	c9                   	leave  
c0104f12:	c3                   	ret    

c0104f13 <execv>:
c0104f13:	55                   	push   %ebp
c0104f14:	89 e5                	mov    %esp,%ebp
c0104f16:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104f1c:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104f23:	83 ec 0c             	sub    $0xc,%esp
c0104f26:	ff 75 e0             	pushl  -0x20(%ebp)
c0104f29:	e8 7e c6 ff ff       	call   c01015ac <sys_malloc>
c0104f2e:	83 c4 10             	add    $0x10,%esp
c0104f31:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104f34:	66 87 db             	xchg   %bx,%bx
c0104f37:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104f3a:	83 ec 04             	sub    $0x4,%esp
c0104f3d:	50                   	push   %eax
c0104f3e:	6a 00                	push   $0x0
c0104f40:	ff 75 dc             	pushl  -0x24(%ebp)
c0104f43:	e8 23 72 00 00       	call   c010c16b <Memset>
c0104f48:	83 c4 10             	add    $0x10,%esp
c0104f4b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104f4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104f51:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104f58:	eb 23                	jmp    c0104f7d <execv+0x6a>
c0104f5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104f5d:	8b 00                	mov    (%eax),%eax
c0104f5f:	83 ec 08             	sub    $0x8,%esp
c0104f62:	50                   	push   %eax
c0104f63:	68 2e b5 10 c0       	push   $0xc010b52e
c0104f68:	e8 7e 35 00 00       	call   c01084eb <Printf>
c0104f6d:	83 c4 10             	add    $0x10,%esp
c0104f70:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0104f74:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f77:	83 c0 04             	add    $0x4,%eax
c0104f7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104f80:	8b 00                	mov    (%eax),%eax
c0104f82:	85 c0                	test   %eax,%eax
c0104f84:	75 d4                	jne    c0104f5a <execv+0x47>
c0104f86:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f89:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f8c:	01 d0                	add    %edx,%eax
c0104f8e:	c6 00 00             	movb   $0x0,(%eax)
c0104f91:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f94:	83 c0 04             	add    $0x4,%eax
c0104f97:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f9a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104fa0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104fa3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104fa6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104fad:	eb 5b                	jmp    c010500a <execv+0xf7>
c0104faf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104fb2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104fb5:	01 c2                	add    %eax,%edx
c0104fb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104fba:	89 10                	mov    %edx,(%eax)
c0104fbc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104fbf:	8b 00                	mov    (%eax),%eax
c0104fc1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0104fc4:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104fc7:	01 ca                	add    %ecx,%edx
c0104fc9:	83 ec 08             	sub    $0x8,%esp
c0104fcc:	50                   	push   %eax
c0104fcd:	52                   	push   %edx
c0104fce:	e8 b7 71 00 00       	call   c010c18a <Strcpy>
c0104fd3:	83 c4 10             	add    $0x10,%esp
c0104fd6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104fd9:	8b 00                	mov    (%eax),%eax
c0104fdb:	83 ec 0c             	sub    $0xc,%esp
c0104fde:	50                   	push   %eax
c0104fdf:	e8 c0 71 00 00       	call   c010c1a4 <Strlen>
c0104fe4:	83 c4 10             	add    $0x10,%esp
c0104fe7:	01 45 f0             	add    %eax,-0x10(%ebp)
c0104fea:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104fed:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104ff0:	01 d0                	add    %edx,%eax
c0104ff2:	c6 00 00             	movb   $0x0,(%eax)
c0104ff5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ff8:	83 c0 01             	add    $0x1,%eax
c0104ffb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104ffe:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0105002:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0105006:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010500a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010500d:	8b 00                	mov    (%eax),%eax
c010500f:	85 c0                	test   %eax,%eax
c0105011:	75 9c                	jne    c0104faf <execv+0x9c>
c0105013:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105016:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c010501b:	29 c2                	sub    %eax,%edx
c010501d:	89 d0                	mov    %edx,%eax
c010501f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105022:	83 ec 0c             	sub    $0xc,%esp
c0105025:	ff 75 08             	pushl  0x8(%ebp)
c0105028:	e8 11 0f 00 00       	call   c0105f3e <get_physical_address>
c010502d:	83 c4 10             	add    $0x10,%esp
c0105030:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105033:	83 ec 0c             	sub    $0xc,%esp
c0105036:	ff 75 dc             	pushl  -0x24(%ebp)
c0105039:	e8 00 0f 00 00       	call   c0105f3e <get_physical_address>
c010503e:	83 c4 10             	add    $0x10,%esp
c0105041:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105044:	83 ec 0c             	sub    $0xc,%esp
c0105047:	ff 75 d8             	pushl  -0x28(%ebp)
c010504a:	e8 ef 0e 00 00       	call   c0105f3e <get_physical_address>
c010504f:	83 c4 10             	add    $0x10,%esp
c0105052:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105055:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c010505c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010505f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105062:	83 ec 0c             	sub    $0xc,%esp
c0105065:	ff 75 08             	pushl  0x8(%ebp)
c0105068:	e8 37 71 00 00       	call   c010c1a4 <Strlen>
c010506d:	83 c4 10             	add    $0x10,%esp
c0105070:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105073:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105076:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010507c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010507f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105085:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105088:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010508e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105091:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105097:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010509a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01050a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050a3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01050a6:	29 c2                	sub    %eax,%edx
c01050a8:	89 d0                	mov    %edx,%eax
c01050aa:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01050b0:	83 ec 04             	sub    $0x4,%esp
c01050b3:	6a 01                	push   $0x1
c01050b5:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c01050bb:	50                   	push   %eax
c01050bc:	6a 03                	push   $0x3
c01050be:	e8 f5 43 00 00       	call   c01094b8 <send_rec>
c01050c3:	83 c4 10             	add    $0x10,%esp
c01050c6:	83 ec 08             	sub    $0x8,%esp
c01050c9:	68 00 04 00 00       	push   $0x400
c01050ce:	ff 75 dc             	pushl  -0x24(%ebp)
c01050d1:	e8 eb c4 ff ff       	call   c01015c1 <sys_free>
c01050d6:	83 c4 10             	add    $0x10,%esp
c01050d9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01050dc:	83 f8 65             	cmp    $0x65,%eax
c01050df:	74 1c                	je     c01050fd <execv+0x1ea>
c01050e1:	68 95 00 00 00       	push   $0x95
c01050e6:	68 0b b5 10 c0       	push   $0xc010b50b
c01050eb:	68 0b b5 10 c0       	push   $0xc010b50b
c01050f0:	68 16 b5 10 c0       	push   $0xc010b516
c01050f5:	e8 4e 37 00 00       	call   c0108848 <assertion_failure>
c01050fa:	83 c4 10             	add    $0x10,%esp
c01050fd:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0105100:	c9                   	leave  
c0105101:	c3                   	ret    

c0105102 <execl>:
c0105102:	55                   	push   %ebp
c0105103:	89 e5                	mov    %esp,%ebp
c0105105:	83 ec 18             	sub    $0x18,%esp
c0105108:	8d 45 0c             	lea    0xc(%ebp),%eax
c010510b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010510e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105111:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105114:	83 ec 08             	sub    $0x8,%esp
c0105117:	ff 75 f0             	pushl  -0x10(%ebp)
c010511a:	ff 75 08             	pushl  0x8(%ebp)
c010511d:	e8 f1 fd ff ff       	call   c0104f13 <execv>
c0105122:	83 c4 10             	add    $0x10,%esp
c0105125:	c9                   	leave  
c0105126:	c3                   	ret    

c0105127 <TaskMM>:
c0105127:	55                   	push   %ebp
c0105128:	89 e5                	mov    %esp,%ebp
c010512a:	83 ec 28             	sub    $0x28,%esp
c010512d:	83 ec 0c             	sub    $0xc,%esp
c0105130:	6a 7c                	push   $0x7c
c0105132:	e8 75 c4 ff ff       	call   c01015ac <sys_malloc>
c0105137:	83 c4 10             	add    $0x10,%esp
c010513a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010513d:	83 ec 0c             	sub    $0xc,%esp
c0105140:	6a 7c                	push   $0x7c
c0105142:	e8 65 c4 ff ff       	call   c01015ac <sys_malloc>
c0105147:	83 c4 10             	add    $0x10,%esp
c010514a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010514d:	83 ec 04             	sub    $0x4,%esp
c0105150:	6a 12                	push   $0x12
c0105152:	ff 75 f0             	pushl  -0x10(%ebp)
c0105155:	6a 02                	push   $0x2
c0105157:	e8 5c 43 00 00       	call   c01094b8 <send_rec>
c010515c:	83 c4 10             	add    $0x10,%esp
c010515f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105162:	8b 40 78             	mov    0x78(%eax),%eax
c0105165:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105168:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010516b:	8b 00                	mov    (%eax),%eax
c010516d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105170:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105177:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010517a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0105181:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105184:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c010518b:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c010518f:	74 4e                	je     c01051df <TaskMM+0xb8>
c0105191:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105195:	7f 08                	jg     c010519f <TaskMM+0x78>
c0105197:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c010519b:	74 28                	je     c01051c5 <TaskMM+0x9e>
c010519d:	eb 71                	jmp    c0105210 <TaskMM+0xe9>
c010519f:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c01051a3:	74 08                	je     c01051ad <TaskMM+0x86>
c01051a5:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01051a9:	74 4e                	je     c01051f9 <TaskMM+0xd2>
c01051ab:	eb 63                	jmp    c0105210 <TaskMM+0xe9>
c01051ad:	83 ec 0c             	sub    $0xc,%esp
c01051b0:	ff 75 f0             	pushl  -0x10(%ebp)
c01051b3:	e8 d0 04 00 00       	call   c0105688 <do_fork>
c01051b8:	83 c4 10             	add    $0x10,%esp
c01051bb:	89 c2                	mov    %eax,%edx
c01051bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01051c0:	89 50 5c             	mov    %edx,0x5c(%eax)
c01051c3:	eb 5c                	jmp    c0105221 <TaskMM+0xfa>
c01051c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01051cc:	66 87 db             	xchg   %bx,%bx
c01051cf:	83 ec 0c             	sub    $0xc,%esp
c01051d2:	ff 75 f0             	pushl  -0x10(%ebp)
c01051d5:	e8 95 00 00 00       	call   c010526f <do_exec>
c01051da:	83 c4 10             	add    $0x10,%esp
c01051dd:	eb 42                	jmp    c0105221 <TaskMM+0xfa>
c01051df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01051e6:	83 ec 08             	sub    $0x8,%esp
c01051e9:	ff 75 e0             	pushl  -0x20(%ebp)
c01051ec:	ff 75 f0             	pushl  -0x10(%ebp)
c01051ef:	e8 02 05 00 00       	call   c01056f6 <do_exit>
c01051f4:	83 c4 10             	add    $0x10,%esp
c01051f7:	eb 28                	jmp    c0105221 <TaskMM+0xfa>
c01051f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105200:	83 ec 0c             	sub    $0xc,%esp
c0105203:	ff 75 f0             	pushl  -0x10(%ebp)
c0105206:	e8 75 05 00 00       	call   c0105780 <do_wait>
c010520b:	83 c4 10             	add    $0x10,%esp
c010520e:	eb 11                	jmp    c0105221 <TaskMM+0xfa>
c0105210:	83 ec 0c             	sub    $0xc,%esp
c0105213:	68 38 b5 10 c0       	push   $0xc010b538
c0105218:	e8 0d 36 00 00       	call   c010882a <panic>
c010521d:	83 c4 10             	add    $0x10,%esp
c0105220:	90                   	nop
c0105221:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105225:	0f 84 22 ff ff ff    	je     c010514d <TaskMM+0x26>
c010522b:	83 ec 0c             	sub    $0xc,%esp
c010522e:	6a 03                	push   $0x3
c0105230:	e8 82 31 00 00       	call   c01083b7 <delay>
c0105235:	83 c4 10             	add    $0x10,%esp
c0105238:	83 ec 04             	sub    $0x4,%esp
c010523b:	ff 75 e4             	pushl  -0x1c(%ebp)
c010523e:	ff 75 ec             	pushl  -0x14(%ebp)
c0105241:	6a 01                	push   $0x1
c0105243:	e8 70 42 00 00       	call   c01094b8 <send_rec>
c0105248:	83 c4 10             	add    $0x10,%esp
c010524b:	e9 fd fe ff ff       	jmp    c010514d <TaskMM+0x26>

c0105250 <alloc_mem>:
c0105250:	55                   	push   %ebp
c0105251:	89 e5                	mov    %esp,%ebp
c0105253:	83 ec 10             	sub    $0x10,%esp
c0105256:	8b 45 08             	mov    0x8(%ebp),%eax
c0105259:	83 e8 08             	sub    $0x8,%eax
c010525c:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0105262:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105267:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010526a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010526d:	c9                   	leave  
c010526e:	c3                   	ret    

c010526f <do_exec>:
c010526f:	55                   	push   %ebp
c0105270:	89 e5                	mov    %esp,%ebp
c0105272:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105278:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010527f:	65 76 5f 
c0105282:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c0105289:	74 79 31 
c010528c:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105293:	00 00 
c0105295:	83 ec 08             	sub    $0x8,%esp
c0105298:	6a 00                	push   $0x0
c010529a:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c01052a0:	50                   	push   %eax
c01052a1:	e8 29 f8 ff ff       	call   c0104acf <open>
c01052a6:	83 c4 10             	add    $0x10,%esp
c01052a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01052ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01052af:	8b 00                	mov    (%eax),%eax
c01052b1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01052b4:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c01052bb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01052be:	83 ec 0c             	sub    $0xc,%esp
c01052c1:	50                   	push   %eax
c01052c2:	e8 e5 c2 ff ff       	call   c01015ac <sys_malloc>
c01052c7:	83 c4 10             	add    $0x10,%esp
c01052ca:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01052cd:	83 ec 04             	sub    $0x4,%esp
c01052d0:	ff 75 d0             	pushl  -0x30(%ebp)
c01052d3:	6a 00                	push   $0x0
c01052d5:	ff 75 cc             	pushl  -0x34(%ebp)
c01052d8:	e8 8e 6e 00 00       	call   c010c16b <Memset>
c01052dd:	83 c4 10             	add    $0x10,%esp
c01052e0:	83 ec 04             	sub    $0x4,%esp
c01052e3:	6a 0c                	push   $0xc
c01052e5:	6a 00                	push   $0x0
c01052e7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01052ed:	50                   	push   %eax
c01052ee:	e8 78 6e 00 00       	call   c010c16b <Memset>
c01052f3:	83 c4 10             	add    $0x10,%esp
c01052f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01052f9:	8b 40 44             	mov    0x44(%eax),%eax
c01052fc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01052ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0105302:	8b 40 40             	mov    0x40(%eax),%eax
c0105305:	83 ec 08             	sub    $0x8,%esp
c0105308:	50                   	push   %eax
c0105309:	ff 75 c8             	pushl  -0x38(%ebp)
c010530c:	e8 de 0a 00 00       	call   c0105def <alloc_virtual_memory>
c0105311:	83 c4 10             	add    $0x10,%esp
c0105314:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105317:	8b 45 08             	mov    0x8(%ebp),%eax
c010531a:	8b 40 40             	mov    0x40(%eax),%eax
c010531d:	89 c2                	mov    %eax,%edx
c010531f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105322:	83 ec 04             	sub    $0x4,%esp
c0105325:	52                   	push   %edx
c0105326:	50                   	push   %eax
c0105327:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010532d:	50                   	push   %eax
c010532e:	e8 29 19 00 00       	call   c0106c5c <Memcpy>
c0105333:	83 c4 10             	add    $0x10,%esp
c0105336:	8b 45 08             	mov    0x8(%ebp),%eax
c0105339:	8b 40 40             	mov    0x40(%eax),%eax
c010533c:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105343:	00 
c0105344:	83 ec 08             	sub    $0x8,%esp
c0105347:	6a 00                	push   $0x0
c0105349:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010534f:	50                   	push   %eax
c0105350:	e8 7a f7 ff ff       	call   c0104acf <open>
c0105355:	83 c4 10             	add    $0x10,%esp
c0105358:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010535b:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010535f:	75 15                	jne    c0105376 <do_exec+0x107>
c0105361:	83 ec 0c             	sub    $0xc,%esp
c0105364:	68 49 b5 10 c0       	push   $0xc010b549
c0105369:	e8 7d 31 00 00       	call   c01084eb <Printf>
c010536e:	83 c4 10             	add    $0x10,%esp
c0105371:	e9 10 03 00 00       	jmp    c0105686 <do_exec+0x417>
c0105376:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010537d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105380:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105383:	01 d0                	add    %edx,%eax
c0105385:	83 ec 04             	sub    $0x4,%esp
c0105388:	68 00 10 00 00       	push   $0x1000
c010538d:	50                   	push   %eax
c010538e:	ff 75 c0             	pushl  -0x40(%ebp)
c0105391:	e8 ce f7 ff ff       	call   c0104b64 <read>
c0105396:	83 c4 10             	add    $0x10,%esp
c0105399:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010539c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010539f:	01 45 f4             	add    %eax,-0xc(%ebp)
c01053a2:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01053a6:	74 0a                	je     c01053b2 <do_exec+0x143>
c01053a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01053ab:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c01053ae:	7d 05                	jge    c01053b5 <do_exec+0x146>
c01053b0:	eb cb                	jmp    c010537d <do_exec+0x10e>
c01053b2:	90                   	nop
c01053b3:	eb 01                	jmp    c01053b6 <do_exec+0x147>
c01053b5:	90                   	nop
c01053b6:	83 ec 0c             	sub    $0xc,%esp
c01053b9:	ff 75 c0             	pushl  -0x40(%ebp)
c01053bc:	e8 a9 f9 ff ff       	call   c0104d6a <close>
c01053c1:	83 c4 10             	add    $0x10,%esp
c01053c4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01053c7:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01053ca:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01053cd:	8b 40 18             	mov    0x18(%eax),%eax
c01053d0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01053d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01053da:	e9 04 01 00 00       	jmp    c01054e3 <do_exec+0x274>
c01053df:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01053e2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c01053e6:	0f b7 d0             	movzwl %ax,%edx
c01053e9:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01053ec:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c01053f0:	0f b7 c0             	movzwl %ax,%eax
c01053f3:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c01053f7:	01 c2                	add    %eax,%edx
c01053f9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01053fc:	01 d0                	add    %edx,%eax
c01053fe:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0105401:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105404:	8b 40 10             	mov    0x10(%eax),%eax
c0105407:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010540a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010540d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105412:	c1 e8 0c             	shr    $0xc,%eax
c0105415:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105418:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010541b:	8b 40 08             	mov    0x8(%eax),%eax
c010541e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0105421:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105428:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010542b:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010542e:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0105431:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105434:	8b 50 04             	mov    0x4(%eax),%edx
c0105437:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010543a:	01 d0                	add    %edx,%eax
c010543c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010543f:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105443:	0f 84 95 00 00 00    	je     c01054de <do_exec+0x26f>
c0105449:	83 ec 04             	sub    $0x4,%esp
c010544c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010544f:	ff 75 a8             	pushl  -0x58(%ebp)
c0105452:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105455:	e8 a0 07 00 00       	call   c0105bfa <get_virtual_address_start_with_addr>
c010545a:	83 c4 10             	add    $0x10,%esp
c010545d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105460:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105463:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105466:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010546d:	eb 41                	jmp    c01054b0 <do_exec+0x241>
c010546f:	83 ec 08             	sub    $0x8,%esp
c0105472:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105475:	ff 75 e8             	pushl  -0x18(%ebp)
c0105478:	e8 f3 0a 00 00       	call   c0105f70 <alloc_physical_memory_of_proc>
c010547d:	83 c4 10             	add    $0x10,%esp
c0105480:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105483:	83 ec 08             	sub    $0x8,%esp
c0105486:	68 00 10 00 00       	push   $0x1000
c010548b:	ff 75 94             	pushl  -0x6c(%ebp)
c010548e:	e8 5c 09 00 00       	call   c0105def <alloc_virtual_memory>
c0105493:	83 c4 10             	add    $0x10,%esp
c0105496:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105499:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010549d:	75 06                	jne    c01054a5 <do_exec+0x236>
c010549f:	8b 45 90             	mov    -0x70(%ebp),%eax
c01054a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01054a5:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c01054ac:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01054b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01054b3:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c01054b6:	77 b7                	ja     c010546f <do_exec+0x200>
c01054b8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054bb:	8b 40 10             	mov    0x10(%eax),%eax
c01054be:	89 c1                	mov    %eax,%ecx
c01054c0:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054c3:	8b 50 04             	mov    0x4(%eax),%edx
c01054c6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01054c9:	01 c2                	add    %eax,%edx
c01054cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01054ce:	83 ec 04             	sub    $0x4,%esp
c01054d1:	51                   	push   %ecx
c01054d2:	52                   	push   %edx
c01054d3:	50                   	push   %eax
c01054d4:	e8 83 17 00 00       	call   c0106c5c <Memcpy>
c01054d9:	83 c4 10             	add    $0x10,%esp
c01054dc:	eb 01                	jmp    c01054df <do_exec+0x270>
c01054de:	90                   	nop
c01054df:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01054e3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01054e6:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01054ea:	0f b7 c0             	movzwl %ax,%eax
c01054ed:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01054f0:	0f 8c e9 fe ff ff    	jl     c01053df <do_exec+0x170>
c01054f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01054f9:	8b 40 10             	mov    0x10(%eax),%eax
c01054fc:	89 45 8c             	mov    %eax,-0x74(%ebp)
c01054ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0105502:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105505:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105508:	8b 45 08             	mov    0x8(%ebp),%eax
c010550b:	8b 40 24             	mov    0x24(%eax),%eax
c010550e:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0105511:	83 ec 0c             	sub    $0xc,%esp
c0105514:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105517:	e8 8a e2 ff ff       	call   c01037a6 <pid2proc>
c010551c:	83 c4 10             	add    $0x10,%esp
c010551f:	89 45 80             	mov    %eax,-0x80(%ebp)
c0105522:	8b 45 08             	mov    0x8(%ebp),%eax
c0105525:	8b 40 10             	mov    0x10(%eax),%eax
c0105528:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010552e:	83 ec 08             	sub    $0x8,%esp
c0105531:	ff 75 88             	pushl  -0x78(%ebp)
c0105534:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c010553a:	e8 b0 08 00 00       	call   c0105def <alloc_virtual_memory>
c010553f:	83 c4 10             	add    $0x10,%esp
c0105542:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105548:	8b 45 08             	mov    0x8(%ebp),%eax
c010554b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010554e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105554:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010555b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0105561:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105564:	eb 1a                	jmp    c0105580 <do_exec+0x311>
c0105566:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010556a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010556d:	8b 10                	mov    (%eax),%edx
c010556f:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105575:	01 c2                	add    %eax,%edx
c0105577:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010557a:	89 10                	mov    %edx,(%eax)
c010557c:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0105580:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105583:	8b 00                	mov    (%eax),%eax
c0105585:	85 c0                	test   %eax,%eax
c0105587:	75 dd                	jne    c0105566 <do_exec+0x2f7>
c0105589:	83 ec 0c             	sub    $0xc,%esp
c010558c:	ff 75 84             	pushl  -0x7c(%ebp)
c010558f:	e8 5b 08 00 00       	call   c0105def <alloc_virtual_memory>
c0105594:	83 c4 10             	add    $0x10,%esp
c0105597:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010559d:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01055a3:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01055a9:	83 ec 04             	sub    $0x4,%esp
c01055ac:	ff 75 88             	pushl  -0x78(%ebp)
c01055af:	52                   	push   %edx
c01055b0:	50                   	push   %eax
c01055b1:	e8 a6 16 00 00       	call   c0106c5c <Memcpy>
c01055b6:	83 c4 10             	add    $0x10,%esp
c01055b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01055bc:	8b 40 28             	mov    0x28(%eax),%eax
c01055bf:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01055c5:	83 ec 08             	sub    $0x8,%esp
c01055c8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055cb:	ff 75 80             	pushl  -0x80(%ebp)
c01055ce:	e8 ef 08 00 00       	call   c0105ec2 <get_physical_address_proc>
c01055d3:	83 c4 10             	add    $0x10,%esp
c01055d6:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c01055dc:	83 ec 08             	sub    $0x8,%esp
c01055df:	68 00 10 00 00       	push   $0x1000
c01055e4:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c01055ea:	e8 00 08 00 00       	call   c0105def <alloc_virtual_memory>
c01055ef:	83 c4 10             	add    $0x10,%esp
c01055f2:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c01055f8:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c01055fe:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105603:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105609:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010560f:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105615:	89 50 20             	mov    %edx,0x20(%eax)
c0105618:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010561b:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105621:	89 50 28             	mov    %edx,0x28(%eax)
c0105624:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105627:	8b 40 18             	mov    0x18(%eax),%eax
c010562a:	89 c2                	mov    %eax,%edx
c010562c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105632:	89 50 30             	mov    %edx,0x30(%eax)
c0105635:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010563b:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105641:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105644:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105647:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010564e:	00 00 00 
c0105651:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105658:	00 00 00 
c010565b:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0105662:	00 00 00 
c0105665:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c010566c:	00 00 00 
c010566f:	83 ec 04             	sub    $0x4,%esp
c0105672:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105675:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c010567b:	50                   	push   %eax
c010567c:	6a 01                	push   $0x1
c010567e:	e8 35 3e 00 00       	call   c01094b8 <send_rec>
c0105683:	83 c4 10             	add    $0x10,%esp
c0105686:	c9                   	leave  
c0105687:	c3                   	ret    

c0105688 <do_fork>:
c0105688:	55                   	push   %ebp
c0105689:	89 e5                	mov    %esp,%ebp
c010568b:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0105691:	8b 45 08             	mov    0x8(%ebp),%eax
c0105694:	8b 00                	mov    (%eax),%eax
c0105696:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105699:	83 ec 0c             	sub    $0xc,%esp
c010569c:	ff 75 f4             	pushl  -0xc(%ebp)
c010569f:	e8 0f 47 00 00       	call   c0109db3 <fork_process>
c01056a4:	83 c4 10             	add    $0x10,%esp
c01056a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01056aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056ad:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01056b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01056b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056b9:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01056bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01056c2:	89 50 5c             	mov    %edx,0x5c(%eax)
c01056c5:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c01056cc:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01056d3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01056da:	83 ec 04             	sub    $0x4,%esp
c01056dd:	ff 75 ec             	pushl  -0x14(%ebp)
c01056e0:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c01056e6:	50                   	push   %eax
c01056e7:	6a 01                	push   $0x1
c01056e9:	e8 ca 3d 00 00       	call   c01094b8 <send_rec>
c01056ee:	83 c4 10             	add    $0x10,%esp
c01056f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01056f4:	c9                   	leave  
c01056f5:	c3                   	ret    

c01056f6 <do_exit>:
c01056f6:	55                   	push   %ebp
c01056f7:	89 e5                	mov    %esp,%ebp
c01056f9:	83 ec 18             	sub    $0x18,%esp
c01056fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01056ff:	8b 00                	mov    (%eax),%eax
c0105701:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105704:	83 ec 0c             	sub    $0xc,%esp
c0105707:	ff 75 f4             	pushl  -0xc(%ebp)
c010570a:	e8 97 e0 ff ff       	call   c01037a6 <pid2proc>
c010570f:	83 c4 10             	add    $0x10,%esp
c0105712:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105715:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105718:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010571e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105721:	83 ec 0c             	sub    $0xc,%esp
c0105724:	ff 75 ec             	pushl  -0x14(%ebp)
c0105727:	e8 7a e0 ff ff       	call   c01037a6 <pid2proc>
c010572c:	83 c4 10             	add    $0x10,%esp
c010572f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105732:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105736:	74 45                	je     c010577d <do_exit+0x87>
c0105738:	8b 45 08             	mov    0x8(%ebp),%eax
c010573b:	8b 40 54             	mov    0x54(%eax),%eax
c010573e:	89 c2                	mov    %eax,%edx
c0105740:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105743:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105749:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010574c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105753:	3c 04                	cmp    $0x4,%al
c0105755:	75 1a                	jne    c0105771 <do_exit+0x7b>
c0105757:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010575a:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105761:	83 ec 0c             	sub    $0xc,%esp
c0105764:	ff 75 f0             	pushl  -0x10(%ebp)
c0105767:	e8 33 01 00 00       	call   c010589f <cleanup>
c010576c:	83 c4 10             	add    $0x10,%esp
c010576f:	eb 0d                	jmp    c010577e <do_exit+0x88>
c0105771:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105774:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c010577b:	eb 01                	jmp    c010577e <do_exit+0x88>
c010577d:	90                   	nop
c010577e:	c9                   	leave  
c010577f:	c3                   	ret    

c0105780 <do_wait>:
c0105780:	55                   	push   %ebp
c0105781:	89 e5                	mov    %esp,%ebp
c0105783:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0105789:	8b 45 08             	mov    0x8(%ebp),%eax
c010578c:	8b 00                	mov    (%eax),%eax
c010578e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105791:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105798:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010579f:	83 ec 0c             	sub    $0xc,%esp
c01057a2:	ff 75 ec             	pushl  -0x14(%ebp)
c01057a5:	e8 fc df ff ff       	call   c01037a6 <pid2proc>
c01057aa:	83 c4 10             	add    $0x10,%esp
c01057ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01057b0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01057b4:	75 19                	jne    c01057cf <do_wait+0x4f>
c01057b6:	6a 58                	push   $0x58
c01057b8:	68 59 b5 10 c0       	push   $0xc010b559
c01057bd:	68 59 b5 10 c0       	push   $0xc010b559
c01057c2:	68 67 b5 10 c0       	push   $0xc010b567
c01057c7:	e8 7c 30 00 00       	call   c0108848 <assertion_failure>
c01057cc:	83 c4 10             	add    $0x10,%esp
c01057cf:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c01057d4:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c01057da:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01057dd:	89 55 e0             	mov    %edx,-0x20(%ebp)
c01057e0:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c01057e5:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c01057eb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01057ee:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01057f1:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c01057f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057f9:	eb 5b                	jmp    c0105856 <do_wait+0xd6>
c01057fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057fe:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105803:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105806:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105809:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010580f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0105812:	74 0b                	je     c010581f <do_wait+0x9f>
c0105814:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105817:	8b 40 04             	mov    0x4(%eax),%eax
c010581a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010581d:	eb 37                	jmp    c0105856 <do_wait+0xd6>
c010581f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105823:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105826:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c010582d:	3c 03                	cmp    $0x3,%al
c010582f:	74 0b                	je     c010583c <do_wait+0xbc>
c0105831:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105834:	8b 40 04             	mov    0x4(%eax),%eax
c0105837:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010583a:	eb 1a                	jmp    c0105856 <do_wait+0xd6>
c010583c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010583f:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105846:	83 ec 0c             	sub    $0xc,%esp
c0105849:	ff 75 e8             	pushl  -0x18(%ebp)
c010584c:	e8 4e 00 00 00       	call   c010589f <cleanup>
c0105851:	83 c4 10             	add    $0x10,%esp
c0105854:	eb 47                	jmp    c010589d <do_wait+0x11d>
c0105856:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c010585d:	75 9c                	jne    c01057fb <do_wait+0x7b>
c010585f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105863:	74 0c                	je     c0105871 <do_wait+0xf1>
c0105865:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105868:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c010586f:	eb 2c                	jmp    c010589d <do_wait+0x11d>
c0105871:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105878:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010587f:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105886:	83 ec 04             	sub    $0x4,%esp
c0105889:	ff 75 ec             	pushl  -0x14(%ebp)
c010588c:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c0105892:	50                   	push   %eax
c0105893:	6a 01                	push   $0x1
c0105895:	e8 1e 3c 00 00       	call   c01094b8 <send_rec>
c010589a:	83 c4 10             	add    $0x10,%esp
c010589d:	c9                   	leave  
c010589e:	c3                   	ret    

c010589f <cleanup>:
c010589f:	55                   	push   %ebp
c01058a0:	89 e5                	mov    %esp,%ebp
c01058a2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01058a8:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c01058af:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c01058b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01058b9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01058bf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01058c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01058c5:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c01058cb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01058ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01058d1:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01058d7:	83 ec 04             	sub    $0x4,%esp
c01058da:	50                   	push   %eax
c01058db:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c01058e1:	50                   	push   %eax
c01058e2:	6a 01                	push   $0x1
c01058e4:	e8 cf 3b 00 00       	call   c01094b8 <send_rec>
c01058e9:	83 c4 10             	add    $0x10,%esp
c01058ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01058ef:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c01058f6:	90                   	nop
c01058f7:	c9                   	leave  
c01058f8:	c3                   	ret    

c01058f9 <init_bitmap>:
c01058f9:	55                   	push   %ebp
c01058fa:	89 e5                	mov    %esp,%ebp
c01058fc:	83 ec 08             	sub    $0x8,%esp
c01058ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0105902:	8b 50 04             	mov    0x4(%eax),%edx
c0105905:	8b 45 08             	mov    0x8(%ebp),%eax
c0105908:	8b 00                	mov    (%eax),%eax
c010590a:	83 ec 04             	sub    $0x4,%esp
c010590d:	52                   	push   %edx
c010590e:	6a 00                	push   $0x0
c0105910:	50                   	push   %eax
c0105911:	e8 55 68 00 00       	call   c010c16b <Memset>
c0105916:	83 c4 10             	add    $0x10,%esp
c0105919:	90                   	nop
c010591a:	c9                   	leave  
c010591b:	c3                   	ret    

c010591c <test_bit_val>:
c010591c:	55                   	push   %ebp
c010591d:	89 e5                	mov    %esp,%ebp
c010591f:	53                   	push   %ebx
c0105920:	83 ec 10             	sub    $0x10,%esp
c0105923:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105926:	8d 50 07             	lea    0x7(%eax),%edx
c0105929:	85 c0                	test   %eax,%eax
c010592b:	0f 48 c2             	cmovs  %edx,%eax
c010592e:	c1 f8 03             	sar    $0x3,%eax
c0105931:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105934:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105937:	99                   	cltd   
c0105938:	c1 ea 1d             	shr    $0x1d,%edx
c010593b:	01 d0                	add    %edx,%eax
c010593d:	83 e0 07             	and    $0x7,%eax
c0105940:	29 d0                	sub    %edx,%eax
c0105942:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105945:	8b 45 08             	mov    0x8(%ebp),%eax
c0105948:	8b 10                	mov    (%eax),%edx
c010594a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010594d:	01 d0                	add    %edx,%eax
c010594f:	0f b6 00             	movzbl (%eax),%eax
c0105952:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105955:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105959:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010595c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105961:	89 c1                	mov    %eax,%ecx
c0105963:	d3 e3                	shl    %cl,%ebx
c0105965:	89 d8                	mov    %ebx,%eax
c0105967:	21 c2                	and    %eax,%edx
c0105969:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010596c:	89 c1                	mov    %eax,%ecx
c010596e:	d3 fa                	sar    %cl,%edx
c0105970:	89 d0                	mov    %edx,%eax
c0105972:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105975:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105979:	0f 9f c0             	setg   %al
c010597c:	0f b6 c0             	movzbl %al,%eax
c010597f:	83 c4 10             	add    $0x10,%esp
c0105982:	5b                   	pop    %ebx
c0105983:	5d                   	pop    %ebp
c0105984:	c3                   	ret    

c0105985 <set_bit_val>:
c0105985:	55                   	push   %ebp
c0105986:	89 e5                	mov    %esp,%ebp
c0105988:	83 ec 10             	sub    $0x10,%esp
c010598b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010598e:	8d 50 07             	lea    0x7(%eax),%edx
c0105991:	85 c0                	test   %eax,%eax
c0105993:	0f 48 c2             	cmovs  %edx,%eax
c0105996:	c1 f8 03             	sar    $0x3,%eax
c0105999:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010599c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010599f:	99                   	cltd   
c01059a0:	c1 ea 1d             	shr    $0x1d,%edx
c01059a3:	01 d0                	add    %edx,%eax
c01059a5:	83 e0 07             	and    $0x7,%eax
c01059a8:	29 d0                	sub    %edx,%eax
c01059aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01059ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01059b0:	8b 10                	mov    (%eax),%edx
c01059b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01059b5:	01 d0                	add    %edx,%eax
c01059b7:	0f b6 00             	movzbl (%eax),%eax
c01059ba:	88 45 ff             	mov    %al,-0x1(%ebp)
c01059bd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01059c1:	7e 13                	jle    c01059d6 <set_bit_val+0x51>
c01059c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059c6:	ba 01 00 00 00       	mov    $0x1,%edx
c01059cb:	89 c1                	mov    %eax,%ecx
c01059cd:	d3 e2                	shl    %cl,%edx
c01059cf:	89 d0                	mov    %edx,%eax
c01059d1:	08 45 ff             	or     %al,-0x1(%ebp)
c01059d4:	eb 13                	jmp    c01059e9 <set_bit_val+0x64>
c01059d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059d9:	ba 01 00 00 00       	mov    $0x1,%edx
c01059de:	89 c1                	mov    %eax,%ecx
c01059e0:	d3 e2                	shl    %cl,%edx
c01059e2:	89 d0                	mov    %edx,%eax
c01059e4:	f7 d0                	not    %eax
c01059e6:	20 45 ff             	and    %al,-0x1(%ebp)
c01059e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01059ec:	8b 10                	mov    (%eax),%edx
c01059ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01059f1:	01 c2                	add    %eax,%edx
c01059f3:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c01059f7:	88 02                	mov    %al,(%edx)
c01059f9:	b8 01 00 00 00       	mov    $0x1,%eax
c01059fe:	c9                   	leave  
c01059ff:	c3                   	ret    

c0105a00 <set_bits>:
c0105a00:	55                   	push   %ebp
c0105a01:	89 e5                	mov    %esp,%ebp
c0105a03:	83 ec 10             	sub    $0x10,%esp
c0105a06:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105a0d:	eb 1c                	jmp    c0105a2b <set_bits+0x2b>
c0105a0f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a12:	8d 50 01             	lea    0x1(%eax),%edx
c0105a15:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105a18:	ff 75 10             	pushl  0x10(%ebp)
c0105a1b:	50                   	push   %eax
c0105a1c:	ff 75 08             	pushl  0x8(%ebp)
c0105a1f:	e8 61 ff ff ff       	call   c0105985 <set_bit_val>
c0105a24:	83 c4 0c             	add    $0xc,%esp
c0105a27:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105a2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a2e:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105a31:	7c dc                	jl     c0105a0f <set_bits+0xf>
c0105a33:	b8 01 00 00 00       	mov    $0x1,%eax
c0105a38:	c9                   	leave  
c0105a39:	c3                   	ret    

c0105a3a <get_first_free_bit>:
c0105a3a:	55                   	push   %ebp
c0105a3b:	89 e5                	mov    %esp,%ebp
c0105a3d:	83 ec 10             	sub    $0x10,%esp
c0105a40:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a43:	8b 40 04             	mov    0x4(%eax),%eax
c0105a46:	c1 e0 03             	shl    $0x3,%eax
c0105a49:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a4c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a4f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105a52:	eb 1b                	jmp    c0105a6f <get_first_free_bit+0x35>
c0105a54:	ff 75 fc             	pushl  -0x4(%ebp)
c0105a57:	ff 75 08             	pushl  0x8(%ebp)
c0105a5a:	e8 bd fe ff ff       	call   c010591c <test_bit_val>
c0105a5f:	83 c4 08             	add    $0x8,%esp
c0105a62:	85 c0                	test   %eax,%eax
c0105a64:	75 05                	jne    c0105a6b <get_first_free_bit+0x31>
c0105a66:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a69:	eb 11                	jmp    c0105a7c <get_first_free_bit+0x42>
c0105a6b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105a6f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a72:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105a75:	7c dd                	jl     c0105a54 <get_first_free_bit+0x1a>
c0105a77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105a7c:	c9                   	leave  
c0105a7d:	c3                   	ret    

c0105a7e <get_bits>:
c0105a7e:	55                   	push   %ebp
c0105a7f:	89 e5                	mov    %esp,%ebp
c0105a81:	83 ec 20             	sub    $0x20,%esp
c0105a84:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105a8b:	ff 75 f0             	pushl  -0x10(%ebp)
c0105a8e:	ff 75 08             	pushl  0x8(%ebp)
c0105a91:	e8 a4 ff ff ff       	call   c0105a3a <get_first_free_bit>
c0105a96:	83 c4 08             	add    $0x8,%esp
c0105a99:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a9f:	8b 40 04             	mov    0x4(%eax),%eax
c0105aa2:	c1 e0 03             	shl    $0x3,%eax
c0105aa5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105aa8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105aab:	83 e8 01             	sub    $0x1,%eax
c0105aae:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105ab1:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105ab5:	75 08                	jne    c0105abf <get_bits+0x41>
c0105ab7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105aba:	e9 85 00 00 00       	jmp    c0105b44 <get_bits+0xc6>
c0105abf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ac2:	83 c0 01             	add    $0x1,%eax
c0105ac5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105ac8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105acb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ace:	eb 58                	jmp    c0105b28 <get_bits+0xaa>
c0105ad0:	ff 75 f8             	pushl  -0x8(%ebp)
c0105ad3:	ff 75 08             	pushl  0x8(%ebp)
c0105ad6:	e8 41 fe ff ff       	call   c010591c <test_bit_val>
c0105adb:	83 c4 08             	add    $0x8,%esp
c0105ade:	85 c0                	test   %eax,%eax
c0105ae0:	75 0a                	jne    c0105aec <get_bits+0x6e>
c0105ae2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105ae6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105aea:	eb 2b                	jmp    c0105b17 <get_bits+0x99>
c0105aec:	6a 00                	push   $0x0
c0105aee:	ff 75 08             	pushl  0x8(%ebp)
c0105af1:	e8 44 ff ff ff       	call   c0105a3a <get_first_free_bit>
c0105af6:	83 c4 08             	add    $0x8,%esp
c0105af9:	83 c0 01             	add    $0x1,%eax
c0105afc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105aff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b02:	83 c0 01             	add    $0x1,%eax
c0105b05:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b08:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105b0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b0e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b11:	83 e8 01             	sub    $0x1,%eax
c0105b14:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105b17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b1a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105b1d:	7c 09                	jl     c0105b28 <get_bits+0xaa>
c0105b1f:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105b26:	eb 0d                	jmp    c0105b35 <get_bits+0xb7>
c0105b28:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b2b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105b2e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105b31:	85 c0                	test   %eax,%eax
c0105b33:	7f 9b                	jg     c0105ad0 <get_bits+0x52>
c0105b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b38:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105b3b:	83 c0 01             	add    $0x1,%eax
c0105b3e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b41:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105b44:	c9                   	leave  
c0105b45:	c3                   	ret    

c0105b46 <get_a_page>:
c0105b46:	55                   	push   %ebp
c0105b47:	89 e5                	mov    %esp,%ebp
c0105b49:	83 ec 28             	sub    $0x28,%esp
c0105b4c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105b50:	75 22                	jne    c0105b74 <get_a_page+0x2e>
c0105b52:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105b57:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105b5a:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105b5f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105b62:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105b67:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b6a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105b6f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b72:	eb 20                	jmp    c0105b94 <get_a_page+0x4e>
c0105b74:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105b79:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105b7c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105b81:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105b84:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105b89:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b8c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105b91:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b94:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105b97:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105b9a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105b9d:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105ba0:	6a 01                	push   $0x1
c0105ba2:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105ba5:	50                   	push   %eax
c0105ba6:	e8 d3 fe ff ff       	call   c0105a7e <get_bits>
c0105bab:	83 c4 08             	add    $0x8,%esp
c0105bae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105bb1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105bb5:	75 1c                	jne    c0105bd3 <get_a_page+0x8d>
c0105bb7:	68 84 00 00 00       	push   $0x84
c0105bbc:	68 7a b5 10 c0       	push   $0xc010b57a
c0105bc1:	68 7a b5 10 c0       	push   $0xc010b57a
c0105bc6:	68 84 b5 10 c0       	push   $0xc010b584
c0105bcb:	e8 78 2c 00 00       	call   c0108848 <assertion_failure>
c0105bd0:	83 c4 10             	add    $0x10,%esp
c0105bd3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105bd6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105bd9:	c1 e2 0c             	shl    $0xc,%edx
c0105bdc:	01 d0                	add    %edx,%eax
c0105bde:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105be1:	83 ec 04             	sub    $0x4,%esp
c0105be4:	6a 01                	push   $0x1
c0105be6:	ff 75 f4             	pushl  -0xc(%ebp)
c0105be9:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105bec:	50                   	push   %eax
c0105bed:	e8 93 fd ff ff       	call   c0105985 <set_bit_val>
c0105bf2:	83 c4 10             	add    $0x10,%esp
c0105bf5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105bf8:	c9                   	leave  
c0105bf9:	c3                   	ret    

c0105bfa <get_virtual_address_start_with_addr>:
c0105bfa:	55                   	push   %ebp
c0105bfb:	89 e5                	mov    %esp,%ebp
c0105bfd:	83 ec 38             	sub    $0x38,%esp
c0105c00:	e8 e4 a7 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0105c05:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c08:	83 ec 0c             	sub    $0xc,%esp
c0105c0b:	ff 75 10             	pushl  0x10(%ebp)
c0105c0e:	e8 93 db ff ff       	call   c01037a6 <pid2proc>
c0105c13:	83 c4 10             	add    $0x10,%esp
c0105c16:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105c19:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c1c:	8b 40 0c             	mov    0xc(%eax),%eax
c0105c1f:	83 ec 04             	sub    $0x4,%esp
c0105c22:	6a 0c                	push   $0xc
c0105c24:	50                   	push   %eax
c0105c25:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105c28:	50                   	push   %eax
c0105c29:	e8 2e 10 00 00       	call   c0106c5c <Memcpy>
c0105c2e:	83 c4 10             	add    $0x10,%esp
c0105c31:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105c34:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105c37:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105c3a:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105c3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105c40:	8b 55 08             	mov    0x8(%ebp),%edx
c0105c43:	29 c2                	sub    %eax,%edx
c0105c45:	89 d0                	mov    %edx,%eax
c0105c47:	c1 e8 0c             	shr    $0xc,%eax
c0105c4a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c4d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105c51:	79 1c                	jns    c0105c6f <get_virtual_address_start_with_addr+0x75>
c0105c53:	68 97 00 00 00       	push   $0x97
c0105c58:	68 7a b5 10 c0       	push   $0xc010b57a
c0105c5d:	68 7a b5 10 c0       	push   $0xc010b57a
c0105c62:	68 90 b5 10 c0       	push   $0xc010b590
c0105c67:	e8 dc 2b 00 00       	call   c0108848 <assertion_failure>
c0105c6c:	83 c4 10             	add    $0x10,%esp
c0105c6f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c72:	50                   	push   %eax
c0105c73:	6a 01                	push   $0x1
c0105c75:	ff 75 ec             	pushl  -0x14(%ebp)
c0105c78:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105c7b:	50                   	push   %eax
c0105c7c:	e8 7f fd ff ff       	call   c0105a00 <set_bits>
c0105c81:	83 c4 10             	add    $0x10,%esp
c0105c84:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c87:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105c8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c92:	c9                   	leave  
c0105c93:	c3                   	ret    

c0105c94 <get_virtual_address>:
c0105c94:	55                   	push   %ebp
c0105c95:	89 e5                	mov    %esp,%ebp
c0105c97:	83 ec 28             	sub    $0x28,%esp
c0105c9a:	e8 4a a7 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0105c9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ca2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105ca6:	75 1a                	jne    c0105cc2 <get_virtual_address+0x2e>
c0105ca8:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105cad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105cb0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105cb5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105cb8:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105cbd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105cc0:	eb 18                	jmp    c0105cda <get_virtual_address+0x46>
c0105cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105cc5:	8b 40 0c             	mov    0xc(%eax),%eax
c0105cc8:	83 ec 04             	sub    $0x4,%esp
c0105ccb:	6a 0c                	push   $0xc
c0105ccd:	50                   	push   %eax
c0105cce:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105cd1:	50                   	push   %eax
c0105cd2:	e8 85 0f 00 00       	call   c0106c5c <Memcpy>
c0105cd7:	83 c4 10             	add    $0x10,%esp
c0105cda:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105cdd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105ce0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105ce3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105ce6:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ce9:	83 ec 08             	sub    $0x8,%esp
c0105cec:	50                   	push   %eax
c0105ced:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105cf0:	50                   	push   %eax
c0105cf1:	e8 88 fd ff ff       	call   c0105a7e <get_bits>
c0105cf6:	83 c4 10             	add    $0x10,%esp
c0105cf9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105cfc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105cff:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105d02:	c1 e2 0c             	shl    $0xc,%edx
c0105d05:	01 d0                	add    %edx,%eax
c0105d07:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d0d:	50                   	push   %eax
c0105d0e:	6a 01                	push   $0x1
c0105d10:	ff 75 f0             	pushl  -0x10(%ebp)
c0105d13:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105d16:	50                   	push   %eax
c0105d17:	e8 e4 fc ff ff       	call   c0105a00 <set_bits>
c0105d1c:	83 c4 10             	add    $0x10,%esp
c0105d1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d22:	c9                   	leave  
c0105d23:	c3                   	ret    

c0105d24 <ptr_pde>:
c0105d24:	55                   	push   %ebp
c0105d25:	89 e5                	mov    %esp,%ebp
c0105d27:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d2a:	c1 e8 16             	shr    $0x16,%eax
c0105d2d:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105d32:	c1 e0 02             	shl    $0x2,%eax
c0105d35:	5d                   	pop    %ebp
c0105d36:	c3                   	ret    

c0105d37 <ptr_pte>:
c0105d37:	55                   	push   %ebp
c0105d38:	89 e5                	mov    %esp,%ebp
c0105d3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d3d:	c1 e8 0a             	shr    $0xa,%eax
c0105d40:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105d45:	89 c2                	mov    %eax,%edx
c0105d47:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d4a:	c1 e8 0c             	shr    $0xc,%eax
c0105d4d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105d52:	c1 e0 02             	shl    $0x2,%eax
c0105d55:	01 d0                	add    %edx,%eax
c0105d57:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105d5c:	5d                   	pop    %ebp
c0105d5d:	c3                   	ret    

c0105d5e <add_map_entry>:
c0105d5e:	55                   	push   %ebp
c0105d5f:	89 e5                	mov    %esp,%ebp
c0105d61:	83 ec 18             	sub    $0x18,%esp
c0105d64:	ff 75 08             	pushl  0x8(%ebp)
c0105d67:	e8 b8 ff ff ff       	call   c0105d24 <ptr_pde>
c0105d6c:	83 c4 04             	add    $0x4,%esp
c0105d6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d72:	ff 75 08             	pushl  0x8(%ebp)
c0105d75:	e8 bd ff ff ff       	call   c0105d37 <ptr_pte>
c0105d7a:	83 c4 04             	add    $0x4,%esp
c0105d7d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d83:	8b 00                	mov    (%eax),%eax
c0105d85:	83 e0 01             	and    $0x1,%eax
c0105d88:	85 c0                	test   %eax,%eax
c0105d8a:	74 1b                	je     c0105da7 <add_map_entry+0x49>
c0105d8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d8f:	8b 00                	mov    (%eax),%eax
c0105d91:	83 e0 01             	and    $0x1,%eax
c0105d94:	85 c0                	test   %eax,%eax
c0105d96:	75 54                	jne    c0105dec <add_map_entry+0x8e>
c0105d98:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d9b:	83 c8 07             	or     $0x7,%eax
c0105d9e:	89 c2                	mov    %eax,%edx
c0105da0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105da3:	89 10                	mov    %edx,(%eax)
c0105da5:	eb 45                	jmp    c0105dec <add_map_entry+0x8e>
c0105da7:	83 ec 0c             	sub    $0xc,%esp
c0105daa:	6a 00                	push   $0x0
c0105dac:	e8 95 fd ff ff       	call   c0105b46 <get_a_page>
c0105db1:	83 c4 10             	add    $0x10,%esp
c0105db4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105db7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105dba:	83 c8 07             	or     $0x7,%eax
c0105dbd:	89 c2                	mov    %eax,%edx
c0105dbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105dc2:	89 10                	mov    %edx,(%eax)
c0105dc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105dc7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105dcc:	83 ec 04             	sub    $0x4,%esp
c0105dcf:	68 00 10 00 00       	push   $0x1000
c0105dd4:	6a 00                	push   $0x0
c0105dd6:	50                   	push   %eax
c0105dd7:	e8 8f 63 00 00       	call   c010c16b <Memset>
c0105ddc:	83 c4 10             	add    $0x10,%esp
c0105ddf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105de2:	83 c8 07             	or     $0x7,%eax
c0105de5:	89 c2                	mov    %eax,%edx
c0105de7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105dea:	89 10                	mov    %edx,(%eax)
c0105dec:	90                   	nop
c0105ded:	c9                   	leave  
c0105dee:	c3                   	ret    

c0105def <alloc_virtual_memory>:
c0105def:	55                   	push   %ebp
c0105df0:	89 e5                	mov    %esp,%ebp
c0105df2:	83 ec 28             	sub    $0x28,%esp
c0105df5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105df8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105dfd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e00:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e03:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105e06:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e09:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e0c:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105e0f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105e12:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105e17:	c1 e8 0c             	shr    $0xc,%eax
c0105e1a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e1d:	e8 c7 a5 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0105e22:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105e25:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105e28:	8b 50 08             	mov    0x8(%eax),%edx
c0105e2b:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105e30:	39 c2                	cmp    %eax,%edx
c0105e32:	75 09                	jne    c0105e3d <alloc_virtual_memory+0x4e>
c0105e34:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105e3b:	eb 07                	jmp    c0105e44 <alloc_virtual_memory+0x55>
c0105e3d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105e44:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105e4b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105e52:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105e59:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105e60:	eb 47                	jmp    c0105ea9 <alloc_virtual_memory+0xba>
c0105e62:	83 ec 08             	sub    $0x8,%esp
c0105e65:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e68:	6a 01                	push   $0x1
c0105e6a:	e8 25 fe ff ff       	call   c0105c94 <get_virtual_address>
c0105e6f:	83 c4 10             	add    $0x10,%esp
c0105e72:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105e75:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105e79:	74 13                	je     c0105e8e <alloc_virtual_memory+0x9f>
c0105e7b:	83 ec 0c             	sub    $0xc,%esp
c0105e7e:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e81:	e8 c0 fc ff ff       	call   c0105b46 <get_a_page>
c0105e86:	83 c4 10             	add    $0x10,%esp
c0105e89:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e8c:	eb 06                	jmp    c0105e94 <alloc_virtual_memory+0xa5>
c0105e8e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105e91:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e94:	83 ec 08             	sub    $0x8,%esp
c0105e97:	ff 75 f4             	pushl  -0xc(%ebp)
c0105e9a:	ff 75 d8             	pushl  -0x28(%ebp)
c0105e9d:	e8 bc fe ff ff       	call   c0105d5e <add_map_entry>
c0105ea2:	83 c4 10             	add    $0x10,%esp
c0105ea5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105ea9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105eac:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105eaf:	72 b1                	jb     c0105e62 <alloc_virtual_memory+0x73>
c0105eb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0105eb4:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105eb9:	89 c2                	mov    %eax,%edx
c0105ebb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ebe:	01 d0                	add    %edx,%eax
c0105ec0:	c9                   	leave  
c0105ec1:	c3                   	ret    

c0105ec2 <get_physical_address_proc>:
c0105ec2:	55                   	push   %ebp
c0105ec3:	89 e5                	mov    %esp,%ebp
c0105ec5:	83 ec 18             	sub    $0x18,%esp
c0105ec8:	e8 40 a4 ff ff       	call   c010030d <disable_int>
c0105ecd:	e8 17 a5 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0105ed2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ed5:	83 ec 0c             	sub    $0xc,%esp
c0105ed8:	ff 75 0c             	pushl  0xc(%ebp)
c0105edb:	e8 c6 d8 ff ff       	call   c01037a6 <pid2proc>
c0105ee0:	83 c4 10             	add    $0x10,%esp
c0105ee3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ee6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ee9:	8b 40 08             	mov    0x8(%eax),%eax
c0105eec:	83 ec 0c             	sub    $0xc,%esp
c0105eef:	50                   	push   %eax
c0105ef0:	e8 d8 a4 ff ff       	call   c01003cd <update_cr3>
c0105ef5:	83 c4 10             	add    $0x10,%esp
c0105ef8:	83 ec 0c             	sub    $0xc,%esp
c0105efb:	ff 75 08             	pushl  0x8(%ebp)
c0105efe:	e8 34 fe ff ff       	call   c0105d37 <ptr_pte>
c0105f03:	83 c4 10             	add    $0x10,%esp
c0105f06:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f09:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f0c:	8b 00                	mov    (%eax),%eax
c0105f0e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f13:	89 c2                	mov    %eax,%edx
c0105f15:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f18:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f1d:	09 d0                	or     %edx,%eax
c0105f1f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105f25:	8b 40 08             	mov    0x8(%eax),%eax
c0105f28:	83 ec 0c             	sub    $0xc,%esp
c0105f2b:	50                   	push   %eax
c0105f2c:	e8 9c a4 ff ff       	call   c01003cd <update_cr3>
c0105f31:	83 c4 10             	add    $0x10,%esp
c0105f34:	e8 d6 a3 ff ff       	call   c010030f <enable_int>
c0105f39:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105f3c:	c9                   	leave  
c0105f3d:	c3                   	ret    

c0105f3e <get_physical_address>:
c0105f3e:	55                   	push   %ebp
c0105f3f:	89 e5                	mov    %esp,%ebp
c0105f41:	83 ec 10             	sub    $0x10,%esp
c0105f44:	ff 75 08             	pushl  0x8(%ebp)
c0105f47:	e8 eb fd ff ff       	call   c0105d37 <ptr_pte>
c0105f4c:	83 c4 04             	add    $0x4,%esp
c0105f4f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105f52:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105f55:	8b 00                	mov    (%eax),%eax
c0105f57:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f5c:	89 c2                	mov    %eax,%edx
c0105f5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f61:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f66:	09 d0                	or     %edx,%eax
c0105f68:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105f6b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105f6e:	c9                   	leave  
c0105f6f:	c3                   	ret    

c0105f70 <alloc_physical_memory_of_proc>:
c0105f70:	55                   	push   %ebp
c0105f71:	89 e5                	mov    %esp,%ebp
c0105f73:	83 ec 48             	sub    $0x48,%esp
c0105f76:	e8 92 a3 ff ff       	call   c010030d <disable_int>
c0105f7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f7e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f83:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f86:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105f8d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f90:	83 ec 0c             	sub    $0xc,%esp
c0105f93:	50                   	push   %eax
c0105f94:	e8 0d d8 ff ff       	call   c01037a6 <pid2proc>
c0105f99:	83 c4 10             	add    $0x10,%esp
c0105f9c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f9f:	e8 45 a4 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0105fa4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105fa7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105faa:	8b 40 0c             	mov    0xc(%eax),%eax
c0105fad:	83 ec 04             	sub    $0x4,%esp
c0105fb0:	6a 0c                	push   $0xc
c0105fb2:	50                   	push   %eax
c0105fb3:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105fb6:	50                   	push   %eax
c0105fb7:	e8 a0 0c 00 00       	call   c0106c5c <Memcpy>
c0105fbc:	83 c4 10             	add    $0x10,%esp
c0105fbf:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105fc2:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0105fc5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105fc8:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105fcb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105fce:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105fd1:	29 c2                	sub    %eax,%edx
c0105fd3:	89 d0                	mov    %edx,%eax
c0105fd5:	c1 e8 0c             	shr    $0xc,%eax
c0105fd8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105fdb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105fde:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105fe1:	c1 e2 0c             	shl    $0xc,%edx
c0105fe4:	01 d0                	add    %edx,%eax
c0105fe6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105fe9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105fec:	6a 01                	push   $0x1
c0105fee:	6a 01                	push   $0x1
c0105ff0:	50                   	push   %eax
c0105ff1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0105ff4:	50                   	push   %eax
c0105ff5:	e8 06 fa ff ff       	call   c0105a00 <set_bits>
c0105ffa:	83 c4 10             	add    $0x10,%esp
c0105ffd:	83 ec 0c             	sub    $0xc,%esp
c0106000:	ff 75 f0             	pushl  -0x10(%ebp)
c0106003:	e8 3e fb ff ff       	call   c0105b46 <get_a_page>
c0106008:	83 c4 10             	add    $0x10,%esp
c010600b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010600e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106011:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106016:	89 c2                	mov    %eax,%edx
c0106018:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010601b:	01 d0                	add    %edx,%eax
c010601d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106020:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106023:	8b 40 08             	mov    0x8(%eax),%eax
c0106026:	83 ec 0c             	sub    $0xc,%esp
c0106029:	50                   	push   %eax
c010602a:	e8 9e a3 ff ff       	call   c01003cd <update_cr3>
c010602f:	83 c4 10             	add    $0x10,%esp
c0106032:	83 ec 08             	sub    $0x8,%esp
c0106035:	ff 75 dc             	pushl  -0x24(%ebp)
c0106038:	ff 75 f4             	pushl  -0xc(%ebp)
c010603b:	e8 1e fd ff ff       	call   c0105d5e <add_map_entry>
c0106040:	83 c4 10             	add    $0x10,%esp
c0106043:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106046:	8b 40 08             	mov    0x8(%eax),%eax
c0106049:	83 ec 0c             	sub    $0xc,%esp
c010604c:	50                   	push   %eax
c010604d:	e8 7b a3 ff ff       	call   c01003cd <update_cr3>
c0106052:	83 c4 10             	add    $0x10,%esp
c0106055:	e8 b5 a2 ff ff       	call   c010030f <enable_int>
c010605a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010605d:	c9                   	leave  
c010605e:	c3                   	ret    

c010605f <alloc_physical_memory>:
c010605f:	55                   	push   %ebp
c0106060:	89 e5                	mov    %esp,%ebp
c0106062:	83 ec 38             	sub    $0x38,%esp
c0106065:	8b 45 08             	mov    0x8(%ebp),%eax
c0106068:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010606d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106070:	e8 74 a3 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0106075:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106078:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010607c:	75 1a                	jne    c0106098 <alloc_physical_memory+0x39>
c010607e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106083:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106086:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010608b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010608e:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106093:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106096:	eb 18                	jmp    c01060b0 <alloc_physical_memory+0x51>
c0106098:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010609b:	8b 40 0c             	mov    0xc(%eax),%eax
c010609e:	83 ec 04             	sub    $0x4,%esp
c01060a1:	6a 0c                	push   $0xc
c01060a3:	50                   	push   %eax
c01060a4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c01060a7:	50                   	push   %eax
c01060a8:	e8 af 0b 00 00       	call   c0106c5c <Memcpy>
c01060ad:	83 c4 10             	add    $0x10,%esp
c01060b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01060b3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01060b6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01060b9:	89 55 d0             	mov    %edx,-0x30(%ebp)
c01060bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01060bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01060c2:	29 c2                	sub    %eax,%edx
c01060c4:	89 d0                	mov    %edx,%eax
c01060c6:	c1 e8 0c             	shr    $0xc,%eax
c01060c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01060cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01060cf:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01060d2:	c1 e2 0c             	shl    $0xc,%edx
c01060d5:	01 d0                	add    %edx,%eax
c01060d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01060da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060dd:	6a 01                	push   $0x1
c01060df:	6a 01                	push   $0x1
c01060e1:	50                   	push   %eax
c01060e2:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01060e5:	50                   	push   %eax
c01060e6:	e8 15 f9 ff ff       	call   c0105a00 <set_bits>
c01060eb:	83 c4 10             	add    $0x10,%esp
c01060ee:	83 ec 0c             	sub    $0xc,%esp
c01060f1:	ff 75 0c             	pushl  0xc(%ebp)
c01060f4:	e8 4d fa ff ff       	call   c0105b46 <get_a_page>
c01060f9:	83 c4 10             	add    $0x10,%esp
c01060fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01060ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0106102:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106107:	89 c2                	mov    %eax,%edx
c0106109:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010610c:	01 d0                	add    %edx,%eax
c010610e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106111:	83 ec 08             	sub    $0x8,%esp
c0106114:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106117:	ff 75 f4             	pushl  -0xc(%ebp)
c010611a:	e8 3f fc ff ff       	call   c0105d5e <add_map_entry>
c010611f:	83 c4 10             	add    $0x10,%esp
c0106122:	8b 45 08             	mov    0x8(%ebp),%eax
c0106125:	c9                   	leave  
c0106126:	c3                   	ret    

c0106127 <alloc_memory>:
c0106127:	55                   	push   %ebp
c0106128:	89 e5                	mov    %esp,%ebp
c010612a:	83 ec 18             	sub    $0x18,%esp
c010612d:	83 ec 08             	sub    $0x8,%esp
c0106130:	ff 75 0c             	pushl  0xc(%ebp)
c0106133:	ff 75 08             	pushl  0x8(%ebp)
c0106136:	e8 59 fb ff ff       	call   c0105c94 <get_virtual_address>
c010613b:	83 c4 10             	add    $0x10,%esp
c010613e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106141:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106144:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106149:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010614c:	eb 29                	jmp    c0106177 <alloc_memory+0x50>
c010614e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106155:	83 ec 0c             	sub    $0xc,%esp
c0106158:	ff 75 0c             	pushl  0xc(%ebp)
c010615b:	e8 e6 f9 ff ff       	call   c0105b46 <get_a_page>
c0106160:	83 c4 10             	add    $0x10,%esp
c0106163:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106166:	83 ec 08             	sub    $0x8,%esp
c0106169:	ff 75 ec             	pushl  -0x14(%ebp)
c010616c:	ff 75 f4             	pushl  -0xc(%ebp)
c010616f:	e8 ea fb ff ff       	call   c0105d5e <add_map_entry>
c0106174:	83 c4 10             	add    $0x10,%esp
c0106177:	8b 45 08             	mov    0x8(%ebp),%eax
c010617a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010617d:	89 55 08             	mov    %edx,0x8(%ebp)
c0106180:	85 c0                	test   %eax,%eax
c0106182:	75 ca                	jne    c010614e <alloc_memory+0x27>
c0106184:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106187:	c9                   	leave  
c0106188:	c3                   	ret    

c0106189 <get_a_virtual_page>:
c0106189:	55                   	push   %ebp
c010618a:	89 e5                	mov    %esp,%ebp
c010618c:	83 ec 18             	sub    $0x18,%esp
c010618f:	83 ec 0c             	sub    $0xc,%esp
c0106192:	ff 75 08             	pushl  0x8(%ebp)
c0106195:	e8 ac f9 ff ff       	call   c0105b46 <get_a_page>
c010619a:	83 c4 10             	add    $0x10,%esp
c010619d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01061a3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01061a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01061ab:	83 ec 08             	sub    $0x8,%esp
c01061ae:	ff 75 f4             	pushl  -0xc(%ebp)
c01061b1:	ff 75 f0             	pushl  -0x10(%ebp)
c01061b4:	e8 a5 fb ff ff       	call   c0105d5e <add_map_entry>
c01061b9:	83 c4 10             	add    $0x10,%esp
c01061bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01061bf:	c9                   	leave  
c01061c0:	c3                   	ret    

c01061c1 <block2arena>:
c01061c1:	55                   	push   %ebp
c01061c2:	89 e5                	mov    %esp,%ebp
c01061c4:	83 ec 10             	sub    $0x10,%esp
c01061c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01061ca:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01061cf:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01061d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01061d5:	c9                   	leave  
c01061d6:	c3                   	ret    

c01061d7 <sys_malloc2>:
c01061d7:	55                   	push   %ebp
c01061d8:	89 e5                	mov    %esp,%ebp
c01061da:	83 ec 68             	sub    $0x68,%esp
c01061dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01061e4:	e8 00 a2 ff ff       	call   c01003e9 <get_running_thread_pcb>
c01061e9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01061ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01061ef:	8b 50 08             	mov    0x8(%eax),%edx
c01061f2:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01061f7:	39 c2                	cmp    %eax,%edx
c01061f9:	75 10                	jne    c010620b <sys_malloc2+0x34>
c01061fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106202:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106209:	eb 10                	jmp    c010621b <sys_malloc2+0x44>
c010620b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106212:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106215:	83 c0 10             	add    $0x10,%eax
c0106218:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010621b:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0106222:	76 52                	jbe    c0106276 <sys_malloc2+0x9f>
c0106224:	8b 45 08             	mov    0x8(%ebp),%eax
c0106227:	05 0b 10 00 00       	add    $0x100b,%eax
c010622c:	c1 e8 0c             	shr    $0xc,%eax
c010622f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106232:	83 ec 08             	sub    $0x8,%esp
c0106235:	ff 75 f0             	pushl  -0x10(%ebp)
c0106238:	ff 75 d8             	pushl  -0x28(%ebp)
c010623b:	e8 e7 fe ff ff       	call   c0106127 <alloc_memory>
c0106240:	83 c4 10             	add    $0x10,%esp
c0106243:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106246:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106249:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010624c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010624f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106255:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106258:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010625f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106262:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106266:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106269:	05 90 00 00 00       	add    $0x90,%eax
c010626e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106271:	e9 f0 01 00 00       	jmp    c0106466 <sys_malloc2+0x28f>
c0106276:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010627d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106284:	eb 26                	jmp    c01062ac <sys_malloc2+0xd5>
c0106286:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106289:	89 d0                	mov    %edx,%eax
c010628b:	01 c0                	add    %eax,%eax
c010628d:	01 d0                	add    %edx,%eax
c010628f:	c1 e0 03             	shl    $0x3,%eax
c0106292:	89 c2                	mov    %eax,%edx
c0106294:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106297:	01 d0                	add    %edx,%eax
c0106299:	8b 00                	mov    (%eax),%eax
c010629b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010629e:	77 08                	ja     c01062a8 <sys_malloc2+0xd1>
c01062a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01062a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01062a6:	eb 0a                	jmp    c01062b2 <sys_malloc2+0xdb>
c01062a8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01062ac:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c01062b0:	7e d4                	jle    c0106286 <sys_malloc2+0xaf>
c01062b2:	83 ec 08             	sub    $0x8,%esp
c01062b5:	ff 75 f0             	pushl  -0x10(%ebp)
c01062b8:	6a 01                	push   $0x1
c01062ba:	e8 68 fe ff ff       	call   c0106127 <alloc_memory>
c01062bf:	83 c4 10             	add    $0x10,%esp
c01062c2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01062c5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01062c8:	89 d0                	mov    %edx,%eax
c01062ca:	01 c0                	add    %eax,%eax
c01062cc:	01 d0                	add    %edx,%eax
c01062ce:	c1 e0 03             	shl    $0x3,%eax
c01062d1:	89 c2                	mov    %eax,%edx
c01062d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062d6:	01 d0                	add    %edx,%eax
c01062d8:	83 ec 04             	sub    $0x4,%esp
c01062db:	6a 18                	push   $0x18
c01062dd:	50                   	push   %eax
c01062de:	ff 75 cc             	pushl  -0x34(%ebp)
c01062e1:	e8 76 09 00 00       	call   c0106c5c <Memcpy>
c01062e6:	83 c4 10             	add    $0x10,%esp
c01062e9:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01062f0:	e8 03 09 00 00       	call   c0106bf8 <intr_disable>
c01062f5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01062f8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01062fb:	89 d0                	mov    %edx,%eax
c01062fd:	01 c0                	add    %eax,%eax
c01062ff:	01 d0                	add    %edx,%eax
c0106301:	c1 e0 03             	shl    $0x3,%eax
c0106304:	89 c2                	mov    %eax,%edx
c0106306:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106309:	01 d0                	add    %edx,%eax
c010630b:	83 c0 08             	add    $0x8,%eax
c010630e:	83 ec 0c             	sub    $0xc,%esp
c0106311:	50                   	push   %eax
c0106312:	e8 ec 3c 00 00       	call   c010a003 <isListEmpty>
c0106317:	83 c4 10             	add    $0x10,%esp
c010631a:	3c 01                	cmp    $0x1,%al
c010631c:	0f 85 c1 00 00 00    	jne    c01063e3 <sys_malloc2+0x20c>
c0106322:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106329:	83 ec 08             	sub    $0x8,%esp
c010632c:	ff 75 f0             	pushl  -0x10(%ebp)
c010632f:	6a 01                	push   $0x1
c0106331:	e8 f1 fd ff ff       	call   c0106127 <alloc_memory>
c0106336:	83 c4 10             	add    $0x10,%esp
c0106339:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010633c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010633f:	83 ec 0c             	sub    $0xc,%esp
c0106342:	50                   	push   %eax
c0106343:	e8 79 fe ff ff       	call   c01061c1 <block2arena>
c0106348:	83 c4 10             	add    $0x10,%esp
c010634b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010634e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106351:	89 d0                	mov    %edx,%eax
c0106353:	01 c0                	add    %eax,%eax
c0106355:	01 d0                	add    %edx,%eax
c0106357:	c1 e0 03             	shl    $0x3,%eax
c010635a:	89 c2                	mov    %eax,%edx
c010635c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010635f:	01 d0                	add    %edx,%eax
c0106361:	8b 50 04             	mov    0x4(%eax),%edx
c0106364:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106367:	89 50 04             	mov    %edx,0x4(%eax)
c010636a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010636d:	8b 00                	mov    (%eax),%eax
c010636f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106372:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106379:	b8 00 10 00 00       	mov    $0x1000,%eax
c010637e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0106381:	ba 00 00 00 00       	mov    $0x0,%edx
c0106386:	f7 75 b8             	divl   -0x48(%ebp)
c0106389:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010638c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010638f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0106392:	01 d0                	add    %edx,%eax
c0106394:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106397:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010639e:	eb 3b                	jmp    c01063db <sys_malloc2+0x204>
c01063a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01063a3:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c01063a7:	89 c2                	mov    %eax,%edx
c01063a9:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01063ac:	01 d0                	add    %edx,%eax
c01063ae:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01063b1:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01063b4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01063b7:	89 d0                	mov    %edx,%eax
c01063b9:	01 c0                	add    %eax,%eax
c01063bb:	01 d0                	add    %edx,%eax
c01063bd:	c1 e0 03             	shl    $0x3,%eax
c01063c0:	89 c2                	mov    %eax,%edx
c01063c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063c5:	01 d0                	add    %edx,%eax
c01063c7:	83 c0 08             	add    $0x8,%eax
c01063ca:	83 ec 08             	sub    $0x8,%esp
c01063cd:	51                   	push   %ecx
c01063ce:	50                   	push   %eax
c01063cf:	e8 2c 3d 00 00       	call   c010a100 <appendToDoubleLinkList>
c01063d4:	83 c4 10             	add    $0x10,%esp
c01063d7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01063db:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01063de:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01063e1:	77 bd                	ja     c01063a0 <sys_malloc2+0x1c9>
c01063e3:	83 ec 0c             	sub    $0xc,%esp
c01063e6:	ff 75 c4             	pushl  -0x3c(%ebp)
c01063e9:	e8 33 08 00 00       	call   c0106c21 <intr_set_status>
c01063ee:	83 c4 10             	add    $0x10,%esp
c01063f1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01063f4:	89 d0                	mov    %edx,%eax
c01063f6:	01 c0                	add    %eax,%eax
c01063f8:	01 d0                	add    %edx,%eax
c01063fa:	c1 e0 03             	shl    $0x3,%eax
c01063fd:	89 c2                	mov    %eax,%edx
c01063ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106402:	01 d0                	add    %edx,%eax
c0106404:	83 c0 08             	add    $0x8,%eax
c0106407:	83 ec 0c             	sub    $0xc,%esp
c010640a:	50                   	push   %eax
c010640b:	e8 5a 3e 00 00       	call   c010a26a <popFromDoubleLinkList>
c0106410:	83 c4 10             	add    $0x10,%esp
c0106413:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106416:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106419:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010641c:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0106420:	75 1c                	jne    c010643e <sys_malloc2+0x267>
c0106422:	68 ef 01 00 00       	push   $0x1ef
c0106427:	68 7a b5 10 c0       	push   $0xc010b57a
c010642c:	68 7a b5 10 c0       	push   $0xc010b57a
c0106431:	68 9b b5 10 c0       	push   $0xc010b59b
c0106436:	e8 0d 24 00 00       	call   c0108848 <assertion_failure>
c010643b:	83 c4 10             	add    $0x10,%esp
c010643e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106441:	83 ec 0c             	sub    $0xc,%esp
c0106444:	50                   	push   %eax
c0106445:	e8 77 fd ff ff       	call   c01061c1 <block2arena>
c010644a:	83 c4 10             	add    $0x10,%esp
c010644d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106450:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106453:	8b 40 04             	mov    0x4(%eax),%eax
c0106456:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106459:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010645c:	89 50 04             	mov    %edx,0x4(%eax)
c010645f:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106466:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010646a:	75 1c                	jne    c0106488 <sys_malloc2+0x2b1>
c010646c:	68 f6 01 00 00       	push   $0x1f6
c0106471:	68 7a b5 10 c0       	push   $0xc010b57a
c0106476:	68 7a b5 10 c0       	push   $0xc010b57a
c010647b:	68 ad b5 10 c0       	push   $0xc010b5ad
c0106480:	e8 c3 23 00 00       	call   c0108848 <assertion_failure>
c0106485:	83 c4 10             	add    $0x10,%esp
c0106488:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010648b:	c9                   	leave  
c010648c:	c3                   	ret    

c010648d <remove_map_entry>:
c010648d:	55                   	push   %ebp
c010648e:	89 e5                	mov    %esp,%ebp
c0106490:	83 ec 10             	sub    $0x10,%esp
c0106493:	ff 75 08             	pushl  0x8(%ebp)
c0106496:	e8 9c f8 ff ff       	call   c0105d37 <ptr_pte>
c010649b:	83 c4 04             	add    $0x4,%esp
c010649e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01064a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01064a4:	8b 10                	mov    (%eax),%edx
c01064a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01064a9:	89 10                	mov    %edx,(%eax)
c01064ab:	90                   	nop
c01064ac:	c9                   	leave  
c01064ad:	c3                   	ret    

c01064ae <free_a_page>:
c01064ae:	55                   	push   %ebp
c01064af:	89 e5                	mov    %esp,%ebp
c01064b1:	83 ec 20             	sub    $0x20,%esp
c01064b4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01064b8:	75 21                	jne    c01064db <free_a_page+0x2d>
c01064ba:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01064bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01064c2:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01064c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01064ca:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01064cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01064d2:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c01064d9:	eb 1f                	jmp    c01064fa <free_a_page+0x4c>
c01064db:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01064e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01064e3:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01064e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01064eb:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01064f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01064f3:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c01064fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01064fd:	c1 e8 0c             	shr    $0xc,%eax
c0106500:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106503:	6a 00                	push   $0x0
c0106505:	ff 75 f8             	pushl  -0x8(%ebp)
c0106508:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c010650b:	50                   	push   %eax
c010650c:	e8 74 f4 ff ff       	call   c0105985 <set_bit_val>
c0106511:	83 c4 0c             	add    $0xc,%esp
c0106514:	ff 75 08             	pushl  0x8(%ebp)
c0106517:	e8 22 fa ff ff       	call   c0105f3e <get_physical_address>
c010651c:	83 c4 04             	add    $0x4,%esp
c010651f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106522:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106525:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010652b:	85 c0                	test   %eax,%eax
c010652d:	0f 48 c2             	cmovs  %edx,%eax
c0106530:	c1 f8 0c             	sar    $0xc,%eax
c0106533:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106536:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106539:	6a 00                	push   $0x0
c010653b:	ff 75 f0             	pushl  -0x10(%ebp)
c010653e:	50                   	push   %eax
c010653f:	e8 41 f4 ff ff       	call   c0105985 <set_bit_val>
c0106544:	83 c4 0c             	add    $0xc,%esp
c0106547:	ff 75 08             	pushl  0x8(%ebp)
c010654a:	e8 3e ff ff ff       	call   c010648d <remove_map_entry>
c010654f:	83 c4 04             	add    $0x4,%esp
c0106552:	90                   	nop
c0106553:	c9                   	leave  
c0106554:	c3                   	ret    

c0106555 <sys_free2>:
c0106555:	55                   	push   %ebp
c0106556:	89 e5                	mov    %esp,%ebp
c0106558:	83 ec 58             	sub    $0x58,%esp
c010655b:	e8 89 9e ff ff       	call   c01003e9 <get_running_thread_pcb>
c0106560:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106563:	e8 90 06 00 00       	call   c0106bf8 <intr_disable>
c0106568:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010656b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010656e:	8b 50 08             	mov    0x8(%eax),%edx
c0106571:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106576:	39 c2                	cmp    %eax,%edx
c0106578:	75 10                	jne    c010658a <sys_free2+0x35>
c010657a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106581:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c0106588:	eb 10                	jmp    c010659a <sys_free2+0x45>
c010658a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106591:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106594:	83 c0 10             	add    $0x10,%eax
c0106597:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010659a:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c01065a1:	76 4d                	jbe    c01065f0 <sys_free2+0x9b>
c01065a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01065a6:	83 e8 0c             	sub    $0xc,%eax
c01065a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01065ac:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c01065b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01065b3:	05 ff 0f 00 00       	add    $0xfff,%eax
c01065b8:	c1 e8 0c             	shr    $0xc,%eax
c01065bb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01065be:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01065c5:	eb 1c                	jmp    c01065e3 <sys_free2+0x8e>
c01065c7:	83 ec 08             	sub    $0x8,%esp
c01065ca:	ff 75 f4             	pushl  -0xc(%ebp)
c01065cd:	ff 75 ec             	pushl  -0x14(%ebp)
c01065d0:	e8 d9 fe ff ff       	call   c01064ae <free_a_page>
c01065d5:	83 c4 10             	add    $0x10,%esp
c01065d8:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c01065df:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01065e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01065e6:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c01065e9:	77 dc                	ja     c01065c7 <sys_free2+0x72>
c01065eb:	e9 dc 00 00 00       	jmp    c01066cc <sys_free2+0x177>
c01065f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01065f7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01065fe:	eb 26                	jmp    c0106626 <sys_free2+0xd1>
c0106600:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106603:	89 d0                	mov    %edx,%eax
c0106605:	01 c0                	add    %eax,%eax
c0106607:	01 d0                	add    %edx,%eax
c0106609:	c1 e0 03             	shl    $0x3,%eax
c010660c:	89 c2                	mov    %eax,%edx
c010660e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106611:	01 d0                	add    %edx,%eax
c0106613:	8b 00                	mov    (%eax),%eax
c0106615:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106618:	77 08                	ja     c0106622 <sys_free2+0xcd>
c010661a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010661d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106620:	eb 0a                	jmp    c010662c <sys_free2+0xd7>
c0106622:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106626:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c010662a:	7e d4                	jle    c0106600 <sys_free2+0xab>
c010662c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010662f:	89 d0                	mov    %edx,%eax
c0106631:	01 c0                	add    %eax,%eax
c0106633:	01 d0                	add    %edx,%eax
c0106635:	c1 e0 03             	shl    $0x3,%eax
c0106638:	89 c2                	mov    %eax,%edx
c010663a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010663d:	01 d0                	add    %edx,%eax
c010663f:	8b 10                	mov    (%eax),%edx
c0106641:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106644:	8b 50 04             	mov    0x4(%eax),%edx
c0106647:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010664a:	8b 50 08             	mov    0x8(%eax),%edx
c010664d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106650:	8b 50 0c             	mov    0xc(%eax),%edx
c0106653:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106656:	8b 50 10             	mov    0x10(%eax),%edx
c0106659:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010665c:	8b 40 14             	mov    0x14(%eax),%eax
c010665f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106662:	8b 45 08             	mov    0x8(%ebp),%eax
c0106665:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106668:	83 ec 0c             	sub    $0xc,%esp
c010666b:	ff 75 d0             	pushl  -0x30(%ebp)
c010666e:	e8 4e fb ff ff       	call   c01061c1 <block2arena>
c0106673:	83 c4 10             	add    $0x10,%esp
c0106676:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106679:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010667c:	89 d0                	mov    %edx,%eax
c010667e:	01 c0                	add    %eax,%eax
c0106680:	01 d0                	add    %edx,%eax
c0106682:	c1 e0 03             	shl    $0x3,%eax
c0106685:	89 c2                	mov    %eax,%edx
c0106687:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010668a:	01 d0                	add    %edx,%eax
c010668c:	83 c0 08             	add    $0x8,%eax
c010668f:	83 ec 08             	sub    $0x8,%esp
c0106692:	ff 75 d0             	pushl  -0x30(%ebp)
c0106695:	50                   	push   %eax
c0106696:	e8 65 3a 00 00       	call   c010a100 <appendToDoubleLinkList>
c010669b:	83 c4 10             	add    $0x10,%esp
c010669e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01066a1:	8b 40 04             	mov    0x4(%eax),%eax
c01066a4:	8d 50 01             	lea    0x1(%eax),%edx
c01066a7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01066aa:	89 50 04             	mov    %edx,0x4(%eax)
c01066ad:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01066b0:	8b 50 04             	mov    0x4(%eax),%edx
c01066b3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01066b6:	39 c2                	cmp    %eax,%edx
c01066b8:	75 12                	jne    c01066cc <sys_free2+0x177>
c01066ba:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01066bd:	83 ec 08             	sub    $0x8,%esp
c01066c0:	ff 75 f4             	pushl  -0xc(%ebp)
c01066c3:	50                   	push   %eax
c01066c4:	e8 e5 fd ff ff       	call   c01064ae <free_a_page>
c01066c9:	83 c4 10             	add    $0x10,%esp
c01066cc:	83 ec 0c             	sub    $0xc,%esp
c01066cf:	ff 75 d8             	pushl  -0x28(%ebp)
c01066d2:	e8 4a 05 00 00       	call   c0106c21 <intr_set_status>
c01066d7:	83 c4 10             	add    $0x10,%esp
c01066da:	90                   	nop
c01066db:	c9                   	leave  
c01066dc:	c3                   	ret    

c01066dd <init_memory_block_desc>:
c01066dd:	55                   	push   %ebp
c01066de:	89 e5                	mov    %esp,%ebp
c01066e0:	83 ec 18             	sub    $0x18,%esp
c01066e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01066ea:	e9 b2 00 00 00       	jmp    c01067a1 <init_memory_block_desc+0xc4>
c01066ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01066f3:	75 1b                	jne    c0106710 <init_memory_block_desc+0x33>
c01066f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066f8:	89 d0                	mov    %edx,%eax
c01066fa:	01 c0                	add    %eax,%eax
c01066fc:	01 d0                	add    %edx,%eax
c01066fe:	c1 e0 03             	shl    $0x3,%eax
c0106701:	89 c2                	mov    %eax,%edx
c0106703:	8b 45 08             	mov    0x8(%ebp),%eax
c0106706:	01 d0                	add    %edx,%eax
c0106708:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010670e:	eb 2e                	jmp    c010673e <init_memory_block_desc+0x61>
c0106710:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106713:	89 d0                	mov    %edx,%eax
c0106715:	01 c0                	add    %eax,%eax
c0106717:	01 d0                	add    %edx,%eax
c0106719:	c1 e0 03             	shl    $0x3,%eax
c010671c:	8d 50 e8             	lea    -0x18(%eax),%edx
c010671f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106722:	01 d0                	add    %edx,%eax
c0106724:	8b 08                	mov    (%eax),%ecx
c0106726:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106729:	89 d0                	mov    %edx,%eax
c010672b:	01 c0                	add    %eax,%eax
c010672d:	01 d0                	add    %edx,%eax
c010672f:	c1 e0 03             	shl    $0x3,%eax
c0106732:	89 c2                	mov    %eax,%edx
c0106734:	8b 45 08             	mov    0x8(%ebp),%eax
c0106737:	01 d0                	add    %edx,%eax
c0106739:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c010673c:	89 10                	mov    %edx,(%eax)
c010673e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106741:	89 d0                	mov    %edx,%eax
c0106743:	01 c0                	add    %eax,%eax
c0106745:	01 d0                	add    %edx,%eax
c0106747:	c1 e0 03             	shl    $0x3,%eax
c010674a:	89 c2                	mov    %eax,%edx
c010674c:	8b 45 08             	mov    0x8(%ebp),%eax
c010674f:	01 d0                	add    %edx,%eax
c0106751:	8b 00                	mov    (%eax),%eax
c0106753:	89 c1                	mov    %eax,%ecx
c0106755:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c010675a:	ba 00 00 00 00       	mov    $0x0,%edx
c010675f:	f7 f1                	div    %ecx
c0106761:	89 c1                	mov    %eax,%ecx
c0106763:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106766:	89 d0                	mov    %edx,%eax
c0106768:	01 c0                	add    %eax,%eax
c010676a:	01 d0                	add    %edx,%eax
c010676c:	c1 e0 03             	shl    $0x3,%eax
c010676f:	89 c2                	mov    %eax,%edx
c0106771:	8b 45 08             	mov    0x8(%ebp),%eax
c0106774:	01 d0                	add    %edx,%eax
c0106776:	89 ca                	mov    %ecx,%edx
c0106778:	89 50 04             	mov    %edx,0x4(%eax)
c010677b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010677e:	89 d0                	mov    %edx,%eax
c0106780:	01 c0                	add    %eax,%eax
c0106782:	01 d0                	add    %edx,%eax
c0106784:	c1 e0 03             	shl    $0x3,%eax
c0106787:	89 c2                	mov    %eax,%edx
c0106789:	8b 45 08             	mov    0x8(%ebp),%eax
c010678c:	01 d0                	add    %edx,%eax
c010678e:	83 c0 08             	add    $0x8,%eax
c0106791:	83 ec 0c             	sub    $0xc,%esp
c0106794:	50                   	push   %eax
c0106795:	e8 3b 38 00 00       	call   c0109fd5 <initDoubleLinkList>
c010679a:	83 c4 10             	add    $0x10,%esp
c010679d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01067a1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01067a5:	0f 8e 44 ff ff ff    	jle    c01066ef <init_memory_block_desc+0x12>
c01067ab:	90                   	nop
c01067ac:	c9                   	leave  
c01067ad:	c3                   	ret    

c01067ae <init_memory2>:
c01067ae:	55                   	push   %ebp
c01067af:	89 e5                	mov    %esp,%ebp
c01067b1:	83 ec 38             	sub    $0x38,%esp
c01067b4:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c01067bb:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c01067c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01067c5:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c01067ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067cd:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01067d2:	29 c2                	sub    %eax,%edx
c01067d4:	89 d0                	mov    %edx,%eax
c01067d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01067d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01067dc:	89 c2                	mov    %eax,%edx
c01067de:	c1 ea 1f             	shr    $0x1f,%edx
c01067e1:	01 d0                	add    %edx,%eax
c01067e3:	d1 f8                	sar    %eax
c01067e5:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c01067ea:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01067ef:	83 ec 0c             	sub    $0xc,%esp
c01067f2:	50                   	push   %eax
c01067f3:	e8 52 08 00 00       	call   c010704a <disp_int>
c01067f8:	83 c4 10             	add    $0x10,%esp
c01067fb:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106800:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106803:	29 c2                	sub    %eax,%edx
c0106805:	89 d0                	mov    %edx,%eax
c0106807:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c010680c:	83 ec 0c             	sub    $0xc,%esp
c010680f:	68 b9 b5 10 c0       	push   $0xc010b5b9
c0106814:	e8 73 98 ff ff       	call   c010008c <disp_str>
c0106819:	83 c4 10             	add    $0x10,%esp
c010681c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106821:	83 ec 0c             	sub    $0xc,%esp
c0106824:	50                   	push   %eax
c0106825:	e8 20 08 00 00       	call   c010704a <disp_int>
c010682a:	83 c4 10             	add    $0x10,%esp
c010682d:	83 ec 0c             	sub    $0xc,%esp
c0106830:	68 b9 b5 10 c0       	push   $0xc010b5b9
c0106835:	e8 52 98 ff ff       	call   c010008c <disp_str>
c010683a:	83 c4 10             	add    $0x10,%esp
c010683d:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106842:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106847:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010684d:	85 c0                	test   %eax,%eax
c010684f:	0f 48 c2             	cmovs  %edx,%eax
c0106852:	c1 f8 0c             	sar    $0xc,%eax
c0106855:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106858:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010685b:	83 c0 07             	add    $0x7,%eax
c010685e:	8d 50 07             	lea    0x7(%eax),%edx
c0106861:	85 c0                	test   %eax,%eax
c0106863:	0f 48 c2             	cmovs  %edx,%eax
c0106866:	c1 f8 03             	sar    $0x3,%eax
c0106869:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c010686e:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106873:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106878:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c010687d:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106883:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106888:	83 ec 04             	sub    $0x4,%esp
c010688b:	52                   	push   %edx
c010688c:	6a 00                	push   $0x0
c010688e:	50                   	push   %eax
c010688f:	e8 d7 58 00 00       	call   c010c16b <Memset>
c0106894:	83 c4 10             	add    $0x10,%esp
c0106897:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c010689c:	05 ff 0f 00 00       	add    $0xfff,%eax
c01068a1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068a7:	85 c0                	test   %eax,%eax
c01068a9:	0f 48 c2             	cmovs  %edx,%eax
c01068ac:	c1 f8 0c             	sar    $0xc,%eax
c01068af:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01068b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01068b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01068b8:	ff 75 e8             	pushl  -0x18(%ebp)
c01068bb:	6a 01                	push   $0x1
c01068bd:	6a 00                	push   $0x0
c01068bf:	68 ac 06 11 c0       	push   $0xc01106ac
c01068c4:	e8 37 f1 ff ff       	call   c0105a00 <set_bits>
c01068c9:	83 c4 10             	add    $0x10,%esp
c01068cc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c01068d1:	05 ff 0f 00 00       	add    $0xfff,%eax
c01068d6:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068dc:	85 c0                	test   %eax,%eax
c01068de:	0f 48 c2             	cmovs  %edx,%eax
c01068e1:	c1 f8 0c             	sar    $0xc,%eax
c01068e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01068e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01068ea:	83 c0 07             	add    $0x7,%eax
c01068ed:	8d 50 07             	lea    0x7(%eax),%edx
c01068f0:	85 c0                	test   %eax,%eax
c01068f2:	0f 48 c2             	cmovs  %edx,%eax
c01068f5:	c1 f8 03             	sar    $0x3,%eax
c01068f8:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c01068fd:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106902:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106908:	01 d0                	add    %edx,%eax
c010690a:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c010690f:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106915:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c010691a:	83 ec 04             	sub    $0x4,%esp
c010691d:	52                   	push   %edx
c010691e:	6a 00                	push   $0x0
c0106920:	50                   	push   %eax
c0106921:	e8 45 58 00 00       	call   c010c16b <Memset>
c0106926:	83 c4 10             	add    $0x10,%esp
c0106929:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c010692e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106933:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106939:	85 c0                	test   %eax,%eax
c010693b:	0f 48 c2             	cmovs  %edx,%eax
c010693e:	c1 f8 0c             	sar    $0xc,%eax
c0106941:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106944:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106947:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010694a:	ff 75 e8             	pushl  -0x18(%ebp)
c010694d:	6a 01                	push   $0x1
c010694f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106952:	68 ac 06 11 c0       	push   $0xc01106ac
c0106957:	e8 a4 f0 ff ff       	call   c0105a00 <set_bits>
c010695c:	83 c4 10             	add    $0x10,%esp
c010695f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106966:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106969:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010696c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010696f:	83 c0 07             	add    $0x7,%eax
c0106972:	8d 50 07             	lea    0x7(%eax),%edx
c0106975:	85 c0                	test   %eax,%eax
c0106977:	0f 48 c2             	cmovs  %edx,%eax
c010697a:	c1 f8 03             	sar    $0x3,%eax
c010697d:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106982:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106987:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c010698d:	01 c2                	add    %eax,%edx
c010698f:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106994:	01 d0                	add    %edx,%eax
c0106996:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c010699b:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c01069a1:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01069a6:	83 ec 04             	sub    $0x4,%esp
c01069a9:	52                   	push   %edx
c01069aa:	6a 00                	push   $0x0
c01069ac:	50                   	push   %eax
c01069ad:	e8 b9 57 00 00       	call   c010c16b <Memset>
c01069b2:	83 c4 10             	add    $0x10,%esp
c01069b5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01069b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01069bb:	01 d0                	add    %edx,%eax
c01069bd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01069c0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01069c5:	05 ff 0f 00 00       	add    $0xfff,%eax
c01069ca:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069d0:	85 c0                	test   %eax,%eax
c01069d2:	0f 48 c2             	cmovs  %edx,%eax
c01069d5:	c1 f8 0c             	sar    $0xc,%eax
c01069d8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01069db:	ff 75 e8             	pushl  -0x18(%ebp)
c01069de:	6a 01                	push   $0x1
c01069e0:	ff 75 e0             	pushl  -0x20(%ebp)
c01069e3:	68 ac 06 11 c0       	push   $0xc01106ac
c01069e8:	e8 13 f0 ff ff       	call   c0105a00 <set_bits>
c01069ed:	83 c4 10             	add    $0x10,%esp
c01069f0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01069f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01069f6:	01 d0                	add    %edx,%eax
c01069f8:	c1 e0 0c             	shl    $0xc,%eax
c01069fb:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106a00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a03:	83 c0 02             	add    $0x2,%eax
c0106a06:	c1 e0 0c             	shl    $0xc,%eax
c0106a09:	89 c2                	mov    %eax,%edx
c0106a0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106a0e:	01 d0                	add    %edx,%eax
c0106a10:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106a15:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106a1c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a1f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106a22:	90                   	nop
c0106a23:	c9                   	leave  
c0106a24:	c3                   	ret    

c0106a25 <init_memory>:
c0106a25:	55                   	push   %ebp
c0106a26:	89 e5                	mov    %esp,%ebp
c0106a28:	83 ec 38             	sub    $0x38,%esp
c0106a2b:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106a32:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106a39:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106a40:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106a43:	05 00 00 40 00       	add    $0x400000,%eax
c0106a48:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a4e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106a51:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a57:	85 c0                	test   %eax,%eax
c0106a59:	0f 48 c2             	cmovs  %edx,%eax
c0106a5c:	c1 f8 0c             	sar    $0xc,%eax
c0106a5f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106a62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106a65:	89 c2                	mov    %eax,%edx
c0106a67:	c1 ea 1f             	shr    $0x1f,%edx
c0106a6a:	01 d0                	add    %edx,%eax
c0106a6c:	d1 f8                	sar    %eax
c0106a6e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a71:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106a74:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106a77:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106a7a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106a7d:	8d 50 07             	lea    0x7(%eax),%edx
c0106a80:	85 c0                	test   %eax,%eax
c0106a82:	0f 48 c2             	cmovs  %edx,%eax
c0106a85:	c1 f8 03             	sar    $0x3,%eax
c0106a88:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106a8b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106a8e:	8d 50 07             	lea    0x7(%eax),%edx
c0106a91:	85 c0                	test   %eax,%eax
c0106a93:	0f 48 c2             	cmovs  %edx,%eax
c0106a96:	c1 f8 03             	sar    $0x3,%eax
c0106a99:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106a9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a9f:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106aa4:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106aa9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106aac:	c1 e2 0c             	shl    $0xc,%edx
c0106aaf:	01 d0                	add    %edx,%eax
c0106ab1:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106ab6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ab9:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106abe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ac1:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106ac6:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106acb:	83 ec 04             	sub    $0x4,%esp
c0106ace:	ff 75 d8             	pushl  -0x28(%ebp)
c0106ad1:	6a 00                	push   $0x0
c0106ad3:	50                   	push   %eax
c0106ad4:	e8 92 56 00 00       	call   c010c16b <Memset>
c0106ad9:	83 c4 10             	add    $0x10,%esp
c0106adc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106adf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ae2:	01 d0                	add    %edx,%eax
c0106ae4:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106ae9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106aec:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106af1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106af6:	83 ec 04             	sub    $0x4,%esp
c0106af9:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106afc:	6a 00                	push   $0x0
c0106afe:	50                   	push   %eax
c0106aff:	e8 67 56 00 00       	call   c010c16b <Memset>
c0106b04:	83 c4 10             	add    $0x10,%esp
c0106b07:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b0a:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106b0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b12:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b15:	01 c2                	add    %eax,%edx
c0106b17:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106b1a:	01 d0                	add    %edx,%eax
c0106b1c:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106b21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106b24:	05 00 00 10 00       	add    $0x100000,%eax
c0106b29:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106b2e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106b33:	83 ec 04             	sub    $0x4,%esp
c0106b36:	ff 75 d8             	pushl  -0x28(%ebp)
c0106b39:	6a 00                	push   $0x0
c0106b3b:	50                   	push   %eax
c0106b3c:	e8 2a 56 00 00       	call   c010c16b <Memset>
c0106b41:	83 c4 10             	add    $0x10,%esp
c0106b44:	83 ec 04             	sub    $0x4,%esp
c0106b47:	68 f0 00 00 00       	push   $0xf0
c0106b4c:	6a 00                	push   $0x0
c0106b4e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106b53:	e8 13 56 00 00       	call   c010c16b <Memset>
c0106b58:	83 c4 10             	add    $0x10,%esp
c0106b5b:	83 ec 0c             	sub    $0xc,%esp
c0106b5e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106b63:	e8 75 fb ff ff       	call   c01066dd <init_memory_block_desc>
c0106b68:	83 c4 10             	add    $0x10,%esp
c0106b6b:	90                   	nop
c0106b6c:	c9                   	leave  
c0106b6d:	c3                   	ret    

c0106b6e <stop_here>:
c0106b6e:	55                   	push   %ebp
c0106b6f:	89 e5                	mov    %esp,%ebp
c0106b71:	83 ec 08             	sub    $0x8,%esp
c0106b74:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106b7b:	00 00 00 
c0106b7e:	83 ec 0c             	sub    $0xc,%esp
c0106b81:	68 c0 b5 10 c0       	push   $0xc010b5c0
c0106b86:	e8 01 95 ff ff       	call   c010008c <disp_str>
c0106b8b:	83 c4 10             	add    $0x10,%esp
c0106b8e:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106b93:	83 ec 0c             	sub    $0xc,%esp
c0106b96:	50                   	push   %eax
c0106b97:	e8 ae 04 00 00       	call   c010704a <disp_int>
c0106b9c:	83 c4 10             	add    $0x10,%esp
c0106b9f:	83 ec 0c             	sub    $0xc,%esp
c0106ba2:	68 c2 b5 10 c0       	push   $0xc010b5c2
c0106ba7:	e8 e0 94 ff ff       	call   c010008c <disp_str>
c0106bac:	83 c4 10             	add    $0x10,%esp
c0106baf:	90                   	nop
c0106bb0:	c9                   	leave  
c0106bb1:	c3                   	ret    

c0106bb2 <catch_error>:
c0106bb2:	55                   	push   %ebp
c0106bb3:	89 e5                	mov    %esp,%ebp
c0106bb5:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106bba:	83 c0 01             	add    $0x1,%eax
c0106bbd:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106bc2:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106bc7:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106bcc:	90                   	nop
c0106bcd:	5d                   	pop    %ebp
c0106bce:	c3                   	ret    

c0106bcf <intr_enable>:
c0106bcf:	55                   	push   %ebp
c0106bd0:	89 e5                	mov    %esp,%ebp
c0106bd2:	83 ec 18             	sub    $0x18,%esp
c0106bd5:	e8 65 00 00 00       	call   c0106c3f <intr_get_status>
c0106bda:	83 f8 01             	cmp    $0x1,%eax
c0106bdd:	75 0c                	jne    c0106beb <intr_enable+0x1c>
c0106bdf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106be6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106be9:	eb 0b                	jmp    c0106bf6 <intr_enable+0x27>
c0106beb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106bf2:	fb                   	sti    
c0106bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106bf6:	c9                   	leave  
c0106bf7:	c3                   	ret    

c0106bf8 <intr_disable>:
c0106bf8:	55                   	push   %ebp
c0106bf9:	89 e5                	mov    %esp,%ebp
c0106bfb:	83 ec 18             	sub    $0x18,%esp
c0106bfe:	e8 3c 00 00 00       	call   c0106c3f <intr_get_status>
c0106c03:	83 f8 01             	cmp    $0x1,%eax
c0106c06:	75 0d                	jne    c0106c15 <intr_disable+0x1d>
c0106c08:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106c0f:	fa                   	cli    
c0106c10:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c13:	eb 0a                	jmp    c0106c1f <intr_disable+0x27>
c0106c15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c1f:	c9                   	leave  
c0106c20:	c3                   	ret    

c0106c21 <intr_set_status>:
c0106c21:	55                   	push   %ebp
c0106c22:	89 e5                	mov    %esp,%ebp
c0106c24:	83 ec 08             	sub    $0x8,%esp
c0106c27:	8b 45 08             	mov    0x8(%ebp),%eax
c0106c2a:	83 e0 01             	and    $0x1,%eax
c0106c2d:	85 c0                	test   %eax,%eax
c0106c2f:	74 07                	je     c0106c38 <intr_set_status+0x17>
c0106c31:	e8 99 ff ff ff       	call   c0106bcf <intr_enable>
c0106c36:	eb 05                	jmp    c0106c3d <intr_set_status+0x1c>
c0106c38:	e8 bb ff ff ff       	call   c0106bf8 <intr_disable>
c0106c3d:	c9                   	leave  
c0106c3e:	c3                   	ret    

c0106c3f <intr_get_status>:
c0106c3f:	55                   	push   %ebp
c0106c40:	89 e5                	mov    %esp,%ebp
c0106c42:	83 ec 10             	sub    $0x10,%esp
c0106c45:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106c4c:	9c                   	pushf  
c0106c4d:	58                   	pop    %eax
c0106c4e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106c51:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106c54:	c1 e8 09             	shr    $0x9,%eax
c0106c57:	83 e0 01             	and    $0x1,%eax
c0106c5a:	c9                   	leave  
c0106c5b:	c3                   	ret    

c0106c5c <Memcpy>:
c0106c5c:	55                   	push   %ebp
c0106c5d:	89 e5                	mov    %esp,%ebp
c0106c5f:	83 ec 18             	sub    $0x18,%esp
c0106c62:	e8 91 ff ff ff       	call   c0106bf8 <intr_disable>
c0106c67:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106c6a:	83 ec 04             	sub    $0x4,%esp
c0106c6d:	ff 75 10             	pushl  0x10(%ebp)
c0106c70:	ff 75 0c             	pushl  0xc(%ebp)
c0106c73:	ff 75 08             	pushl  0x8(%ebp)
c0106c76:	e8 c2 54 00 00       	call   c010c13d <Memcpy2>
c0106c7b:	83 c4 10             	add    $0x10,%esp
c0106c7e:	83 ec 0c             	sub    $0xc,%esp
c0106c81:	ff 75 f4             	pushl  -0xc(%ebp)
c0106c84:	e8 98 ff ff ff       	call   c0106c21 <intr_set_status>
c0106c89:	83 c4 10             	add    $0x10,%esp
c0106c8c:	90                   	nop
c0106c8d:	c9                   	leave  
c0106c8e:	c3                   	ret    

c0106c8f <untar>:
c0106c8f:	55                   	push   %ebp
c0106c90:	89 e5                	mov    %esp,%ebp
c0106c92:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106c98:	83 ec 08             	sub    $0x8,%esp
c0106c9b:	6a 00                	push   $0x0
c0106c9d:	ff 75 08             	pushl  0x8(%ebp)
c0106ca0:	e8 2a de ff ff       	call   c0104acf <open>
c0106ca5:	83 c4 10             	add    $0x10,%esp
c0106ca8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106cab:	83 ec 0c             	sub    $0xc,%esp
c0106cae:	68 c4 b5 10 c0       	push   $0xc010b5c4
c0106cb3:	e8 33 18 00 00       	call   c01084eb <Printf>
c0106cb8:	83 c4 10             	add    $0x10,%esp
c0106cbb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106cc2:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106cc9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106cd0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106cd7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106cde:	e9 63 02 00 00       	jmp    c0106f46 <untar+0x2b7>
c0106ce3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106ce7:	7e 58                	jle    c0106d41 <untar+0xb2>
c0106ce9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cec:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106cf1:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106cf7:	85 c0                	test   %eax,%eax
c0106cf9:	0f 48 c2             	cmovs  %edx,%eax
c0106cfc:	c1 f8 09             	sar    $0x9,%eax
c0106cff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106d02:	83 ec 04             	sub    $0x4,%esp
c0106d05:	68 00 02 00 00       	push   $0x200
c0106d0a:	6a 00                	push   $0x0
c0106d0c:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d12:	50                   	push   %eax
c0106d13:	e8 53 54 00 00       	call   c010c16b <Memset>
c0106d18:	83 c4 10             	add    $0x10,%esp
c0106d1b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106d1e:	c1 e0 09             	shl    $0x9,%eax
c0106d21:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106d24:	83 ec 04             	sub    $0x4,%esp
c0106d27:	50                   	push   %eax
c0106d28:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d2e:	50                   	push   %eax
c0106d2f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106d32:	e8 2d de ff ff       	call   c0104b64 <read>
c0106d37:	83 c4 10             	add    $0x10,%esp
c0106d3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d41:	83 ec 04             	sub    $0x4,%esp
c0106d44:	68 00 02 00 00       	push   $0x200
c0106d49:	6a 00                	push   $0x0
c0106d4b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d51:	50                   	push   %eax
c0106d52:	e8 14 54 00 00       	call   c010c16b <Memset>
c0106d57:	83 c4 10             	add    $0x10,%esp
c0106d5a:	83 ec 04             	sub    $0x4,%esp
c0106d5d:	68 00 02 00 00       	push   $0x200
c0106d62:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d68:	50                   	push   %eax
c0106d69:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106d6c:	e8 f3 dd ff ff       	call   c0104b64 <read>
c0106d71:	83 c4 10             	add    $0x10,%esp
c0106d74:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106d77:	83 ec 0c             	sub    $0xc,%esp
c0106d7a:	68 d6 b5 10 c0       	push   $0xc010b5d6
c0106d7f:	e8 67 17 00 00       	call   c01084eb <Printf>
c0106d84:	83 c4 10             	add    $0x10,%esp
c0106d87:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106d8b:	0f 84 c1 01 00 00    	je     c0106f52 <untar+0x2c3>
c0106d91:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106d94:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106d97:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106d9e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106da4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106da7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106daa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106dad:	83 ec 08             	sub    $0x8,%esp
c0106db0:	6a 07                	push   $0x7
c0106db2:	ff 75 cc             	pushl  -0x34(%ebp)
c0106db5:	e8 15 dd ff ff       	call   c0104acf <open>
c0106dba:	83 c4 10             	add    $0x10,%esp
c0106dbd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106dc0:	83 ec 0c             	sub    $0xc,%esp
c0106dc3:	68 e8 b5 10 c0       	push   $0xc010b5e8
c0106dc8:	e8 1e 17 00 00       	call   c01084eb <Printf>
c0106dcd:	83 c4 10             	add    $0x10,%esp
c0106dd0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106dd7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106dda:	83 c0 7c             	add    $0x7c,%eax
c0106ddd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106de0:	83 ec 0c             	sub    $0xc,%esp
c0106de3:	ff 75 cc             	pushl  -0x34(%ebp)
c0106de6:	e8 b9 53 00 00       	call   c010c1a4 <Strlen>
c0106deb:	83 c4 10             	add    $0x10,%esp
c0106dee:	85 c0                	test   %eax,%eax
c0106df0:	75 28                	jne    c0106e1a <untar+0x18b>
c0106df2:	83 ec 0c             	sub    $0xc,%esp
c0106df5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106df8:	e8 a7 53 00 00       	call   c010c1a4 <Strlen>
c0106dfd:	83 c4 10             	add    $0x10,%esp
c0106e00:	85 c0                	test   %eax,%eax
c0106e02:	75 16                	jne    c0106e1a <untar+0x18b>
c0106e04:	83 ec 0c             	sub    $0xc,%esp
c0106e07:	68 fa b5 10 c0       	push   $0xc010b5fa
c0106e0c:	e8 da 16 00 00       	call   c01084eb <Printf>
c0106e11:	83 c4 10             	add    $0x10,%esp
c0106e14:	90                   	nop
c0106e15:	e9 39 01 00 00       	jmp    c0106f53 <untar+0x2c4>
c0106e1a:	83 ec 0c             	sub    $0xc,%esp
c0106e1d:	68 01 b6 10 c0       	push   $0xc010b601
c0106e22:	e8 c4 16 00 00       	call   c01084eb <Printf>
c0106e27:	83 c4 10             	add    $0x10,%esp
c0106e2a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106e2d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106e30:	eb 1f                	jmp    c0106e51 <untar+0x1c2>
c0106e32:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106e35:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106e3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106e3f:	0f b6 00             	movzbl (%eax),%eax
c0106e42:	0f be c0             	movsbl %al,%eax
c0106e45:	83 e8 30             	sub    $0x30,%eax
c0106e48:	01 d0                	add    %edx,%eax
c0106e4a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106e4d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106e51:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106e54:	0f b6 00             	movzbl (%eax),%eax
c0106e57:	84 c0                	test   %al,%al
c0106e59:	75 d7                	jne    c0106e32 <untar+0x1a3>
c0106e5b:	83 ec 0c             	sub    $0xc,%esp
c0106e5e:	68 0f b6 10 c0       	push   $0xc010b60f
c0106e63:	e8 83 16 00 00       	call   c01084eb <Printf>
c0106e68:	83 c4 10             	add    $0x10,%esp
c0106e6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106e6e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106e71:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106e78:	83 ec 08             	sub    $0x8,%esp
c0106e7b:	ff 75 c0             	pushl  -0x40(%ebp)
c0106e7e:	68 1d b6 10 c0       	push   $0xc010b61d
c0106e83:	e8 63 16 00 00       	call   c01084eb <Printf>
c0106e88:	83 c4 10             	add    $0x10,%esp
c0106e8b:	83 ec 08             	sub    $0x8,%esp
c0106e8e:	ff 75 c0             	pushl  -0x40(%ebp)
c0106e91:	68 2f b6 10 c0       	push   $0xc010b62f
c0106e96:	e8 50 16 00 00       	call   c01084eb <Printf>
c0106e9b:	83 c4 10             	add    $0x10,%esp
c0106e9e:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106ea1:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106ea4:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106ea8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106eab:	e8 02 fd ff ff       	call   c0106bb2 <catch_error>
c0106eb0:	83 ec 04             	sub    $0x4,%esp
c0106eb3:	ff 75 b8             	pushl  -0x48(%ebp)
c0106eb6:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106ebc:	50                   	push   %eax
c0106ebd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106ec0:	e8 9f dc ff ff       	call   c0104b64 <read>
c0106ec5:	83 c4 10             	add    $0x10,%esp
c0106ec8:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106ecb:	83 ec 04             	sub    $0x4,%esp
c0106ece:	ff 75 b8             	pushl  -0x48(%ebp)
c0106ed1:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106ed7:	50                   	push   %eax
c0106ed8:	ff 75 c8             	pushl  -0x38(%ebp)
c0106edb:	e8 05 de ff ff       	call   c0104ce5 <write>
c0106ee0:	83 c4 10             	add    $0x10,%esp
c0106ee3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ee6:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106ee9:	7d 02                	jge    c0106eed <untar+0x25e>
c0106eeb:	eb be                	jmp    c0106eab <untar+0x21c>
c0106eed:	90                   	nop
c0106eee:	83 ec 08             	sub    $0x8,%esp
c0106ef1:	ff 75 f4             	pushl  -0xc(%ebp)
c0106ef4:	68 41 b6 10 c0       	push   $0xc010b641
c0106ef9:	e8 ed 15 00 00       	call   c01084eb <Printf>
c0106efe:	83 c4 10             	add    $0x10,%esp
c0106f01:	83 ec 08             	sub    $0x8,%esp
c0106f04:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f07:	68 53 b6 10 c0       	push   $0xc010b653
c0106f0c:	e8 da 15 00 00       	call   c01084eb <Printf>
c0106f11:	83 c4 10             	add    $0x10,%esp
c0106f14:	83 ec 0c             	sub    $0xc,%esp
c0106f17:	68 64 b6 10 c0       	push   $0xc010b664
c0106f1c:	e8 ca 15 00 00       	call   c01084eb <Printf>
c0106f21:	83 c4 10             	add    $0x10,%esp
c0106f24:	83 ec 0c             	sub    $0xc,%esp
c0106f27:	ff 75 c8             	pushl  -0x38(%ebp)
c0106f2a:	e8 3b de ff ff       	call   c0104d6a <close>
c0106f2f:	83 c4 10             	add    $0x10,%esp
c0106f32:	83 ec 0c             	sub    $0xc,%esp
c0106f35:	68 72 b6 10 c0       	push   $0xc010b672
c0106f3a:	e8 ac 15 00 00       	call   c01084eb <Printf>
c0106f3f:	83 c4 10             	add    $0x10,%esp
c0106f42:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106f46:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106f4a:	0f 8f 93 fd ff ff    	jg     c0106ce3 <untar+0x54>
c0106f50:	eb 01                	jmp    c0106f53 <untar+0x2c4>
c0106f52:	90                   	nop
c0106f53:	83 ec 0c             	sub    $0xc,%esp
c0106f56:	68 7f b6 10 c0       	push   $0xc010b67f
c0106f5b:	e8 8b 15 00 00       	call   c01084eb <Printf>
c0106f60:	83 c4 10             	add    $0x10,%esp
c0106f63:	83 ec 0c             	sub    $0xc,%esp
c0106f66:	68 91 b6 10 c0       	push   $0xc010b691
c0106f6b:	e8 7b 15 00 00       	call   c01084eb <Printf>
c0106f70:	83 c4 10             	add    $0x10,%esp
c0106f73:	83 ec 0c             	sub    $0xc,%esp
c0106f76:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106f79:	e8 ec dd ff ff       	call   c0104d6a <close>
c0106f7e:	83 c4 10             	add    $0x10,%esp
c0106f81:	83 ec 0c             	sub    $0xc,%esp
c0106f84:	68 a1 b6 10 c0       	push   $0xc010b6a1
c0106f89:	e8 5d 15 00 00       	call   c01084eb <Printf>
c0106f8e:	83 c4 10             	add    $0x10,%esp
c0106f91:	83 ec 0c             	sub    $0xc,%esp
c0106f94:	68 b4 b6 10 c0       	push   $0xc010b6b4
c0106f99:	e8 4d 15 00 00       	call   c01084eb <Printf>
c0106f9e:	83 c4 10             	add    $0x10,%esp
c0106fa1:	90                   	nop
c0106fa2:	c9                   	leave  
c0106fa3:	c3                   	ret    

c0106fa4 <atoi>:
c0106fa4:	55                   	push   %ebp
c0106fa5:	89 e5                	mov    %esp,%ebp
c0106fa7:	83 ec 10             	sub    $0x10,%esp
c0106faa:	8b 45 08             	mov    0x8(%ebp),%eax
c0106fad:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106fb0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106fb3:	8d 50 01             	lea    0x1(%eax),%edx
c0106fb6:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106fb9:	c6 00 30             	movb   $0x30,(%eax)
c0106fbc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106fbf:	8d 50 01             	lea    0x1(%eax),%edx
c0106fc2:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106fc5:	c6 00 78             	movb   $0x78,(%eax)
c0106fc8:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0106fcc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106fd0:	75 0e                	jne    c0106fe0 <atoi+0x3c>
c0106fd2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106fd5:	8d 50 01             	lea    0x1(%eax),%edx
c0106fd8:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106fdb:	c6 00 30             	movb   $0x30,(%eax)
c0106fde:	eb 61                	jmp    c0107041 <atoi+0x9d>
c0106fe0:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0106fe7:	eb 52                	jmp    c010703b <atoi+0x97>
c0106fe9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fec:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106fef:	89 c1                	mov    %eax,%ecx
c0106ff1:	d3 fa                	sar    %cl,%edx
c0106ff3:	89 d0                	mov    %edx,%eax
c0106ff5:	83 e0 0f             	and    $0xf,%eax
c0106ff8:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106ffb:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0106fff:	75 06                	jne    c0107007 <atoi+0x63>
c0107001:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0107005:	74 2f                	je     c0107036 <atoi+0x92>
c0107007:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c010700b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010700f:	83 c0 30             	add    $0x30,%eax
c0107012:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107015:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0107019:	7e 0a                	jle    c0107025 <atoi+0x81>
c010701b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010701f:	83 c0 07             	add    $0x7,%eax
c0107022:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107025:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107028:	8d 50 01             	lea    0x1(%eax),%edx
c010702b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010702e:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0107032:	88 10                	mov    %dl,(%eax)
c0107034:	eb 01                	jmp    c0107037 <atoi+0x93>
c0107036:	90                   	nop
c0107037:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010703b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010703f:	79 a8                	jns    c0106fe9 <atoi+0x45>
c0107041:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107044:	c6 00 00             	movb   $0x0,(%eax)
c0107047:	90                   	nop
c0107048:	c9                   	leave  
c0107049:	c3                   	ret    

c010704a <disp_int>:
c010704a:	55                   	push   %ebp
c010704b:	89 e5                	mov    %esp,%ebp
c010704d:	83 ec 18             	sub    $0x18,%esp
c0107050:	ff 75 08             	pushl  0x8(%ebp)
c0107053:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107056:	50                   	push   %eax
c0107057:	e8 48 ff ff ff       	call   c0106fa4 <atoi>
c010705c:	83 c4 08             	add    $0x8,%esp
c010705f:	83 ec 08             	sub    $0x8,%esp
c0107062:	6a 0b                	push   $0xb
c0107064:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107067:	50                   	push   %eax
c0107068:	e8 5a 90 ff ff       	call   c01000c7 <disp_str_colour>
c010706d:	83 c4 10             	add    $0x10,%esp
c0107070:	90                   	nop
c0107071:	c9                   	leave  
c0107072:	c3                   	ret    

c0107073 <do_page_fault>:
c0107073:	55                   	push   %ebp
c0107074:	89 e5                	mov    %esp,%ebp
c0107076:	83 ec 28             	sub    $0x28,%esp
c0107079:	0f 20 d0             	mov    %cr2,%eax
c010707c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010707f:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107086:	00 00 00 
c0107089:	83 ec 0c             	sub    $0xc,%esp
c010708c:	68 bf b6 10 c0       	push   $0xc010b6bf
c0107091:	e8 f6 8f ff ff       	call   c010008c <disp_str>
c0107096:	83 c4 10             	add    $0x10,%esp
c0107099:	83 ec 0c             	sub    $0xc,%esp
c010709c:	68 ce b6 10 c0       	push   $0xc010b6ce
c01070a1:	e8 e6 8f ff ff       	call   c010008c <disp_str>
c01070a6:	83 c4 10             	add    $0x10,%esp
c01070a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01070ac:	83 ec 0c             	sub    $0xc,%esp
c01070af:	50                   	push   %eax
c01070b0:	e8 95 ff ff ff       	call   c010704a <disp_int>
c01070b5:	83 c4 10             	add    $0x10,%esp
c01070b8:	83 ec 0c             	sub    $0xc,%esp
c01070bb:	68 d3 b6 10 c0       	push   $0xc010b6d3
c01070c0:	e8 c7 8f ff ff       	call   c010008c <disp_str>
c01070c5:	83 c4 10             	add    $0x10,%esp
c01070c8:	83 ec 0c             	sub    $0xc,%esp
c01070cb:	ff 75 f4             	pushl  -0xc(%ebp)
c01070ce:	e8 51 ec ff ff       	call   c0105d24 <ptr_pde>
c01070d3:	83 c4 10             	add    $0x10,%esp
c01070d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01070d9:	83 ec 0c             	sub    $0xc,%esp
c01070dc:	ff 75 f4             	pushl  -0xc(%ebp)
c01070df:	e8 53 ec ff ff       	call   c0105d37 <ptr_pte>
c01070e4:	83 c4 10             	add    $0x10,%esp
c01070e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01070ea:	83 ec 0c             	sub    $0xc,%esp
c01070ed:	68 d5 b6 10 c0       	push   $0xc010b6d5
c01070f2:	e8 95 8f ff ff       	call   c010008c <disp_str>
c01070f7:	83 c4 10             	add    $0x10,%esp
c01070fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01070fd:	83 ec 0c             	sub    $0xc,%esp
c0107100:	50                   	push   %eax
c0107101:	e8 44 ff ff ff       	call   c010704a <disp_int>
c0107106:	83 c4 10             	add    $0x10,%esp
c0107109:	83 ec 0c             	sub    $0xc,%esp
c010710c:	68 da b6 10 c0       	push   $0xc010b6da
c0107111:	e8 76 8f ff ff       	call   c010008c <disp_str>
c0107116:	83 c4 10             	add    $0x10,%esp
c0107119:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010711c:	8b 00                	mov    (%eax),%eax
c010711e:	83 ec 0c             	sub    $0xc,%esp
c0107121:	50                   	push   %eax
c0107122:	e8 23 ff ff ff       	call   c010704a <disp_int>
c0107127:	83 c4 10             	add    $0x10,%esp
c010712a:	83 ec 0c             	sub    $0xc,%esp
c010712d:	68 d3 b6 10 c0       	push   $0xc010b6d3
c0107132:	e8 55 8f ff ff       	call   c010008c <disp_str>
c0107137:	83 c4 10             	add    $0x10,%esp
c010713a:	83 ec 0c             	sub    $0xc,%esp
c010713d:	68 e3 b6 10 c0       	push   $0xc010b6e3
c0107142:	e8 45 8f ff ff       	call   c010008c <disp_str>
c0107147:	83 c4 10             	add    $0x10,%esp
c010714a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010714d:	83 ec 0c             	sub    $0xc,%esp
c0107150:	50                   	push   %eax
c0107151:	e8 f4 fe ff ff       	call   c010704a <disp_int>
c0107156:	83 c4 10             	add    $0x10,%esp
c0107159:	83 ec 0c             	sub    $0xc,%esp
c010715c:	68 e8 b6 10 c0       	push   $0xc010b6e8
c0107161:	e8 26 8f ff ff       	call   c010008c <disp_str>
c0107166:	83 c4 10             	add    $0x10,%esp
c0107169:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010716c:	8b 00                	mov    (%eax),%eax
c010716e:	83 ec 0c             	sub    $0xc,%esp
c0107171:	50                   	push   %eax
c0107172:	e8 d3 fe ff ff       	call   c010704a <disp_int>
c0107177:	83 c4 10             	add    $0x10,%esp
c010717a:	83 ec 0c             	sub    $0xc,%esp
c010717d:	68 d3 b6 10 c0       	push   $0xc010b6d3
c0107182:	e8 05 8f ff ff       	call   c010008c <disp_str>
c0107187:	83 c4 10             	add    $0x10,%esp
c010718a:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0107191:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107194:	8b 00                	mov    (%eax),%eax
c0107196:	83 e0 01             	and    $0x1,%eax
c0107199:	85 c0                	test   %eax,%eax
c010719b:	74 09                	je     c01071a6 <do_page_fault+0x133>
c010719d:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c01071a4:	eb 07                	jmp    c01071ad <do_page_fault+0x13a>
c01071a6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01071ad:	90                   	nop
c01071ae:	c9                   	leave  
c01071af:	c3                   	ret    

c01071b0 <exception_handler>:
c01071b0:	55                   	push   %ebp
c01071b1:	89 e5                	mov    %esp,%ebp
c01071b3:	57                   	push   %edi
c01071b4:	56                   	push   %esi
c01071b5:	53                   	push   %ebx
c01071b6:	83 ec 6c             	sub    $0x6c,%esp
c01071b9:	8d 45 8c             	lea    -0x74(%ebp),%eax
c01071bc:	bb 60 b9 10 c0       	mov    $0xc010b960,%ebx
c01071c1:	ba 13 00 00 00       	mov    $0x13,%edx
c01071c6:	89 c7                	mov    %eax,%edi
c01071c8:	89 de                	mov    %ebx,%esi
c01071ca:	89 d1                	mov    %edx,%ecx
c01071cc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01071ce:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01071d5:	eb 04                	jmp    c01071db <exception_handler+0x2b>
c01071d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01071db:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c01071e2:	7e f3                	jle    c01071d7 <exception_handler+0x27>
c01071e4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01071eb:	00 00 00 
c01071ee:	83 ec 0c             	sub    $0xc,%esp
c01071f1:	68 f1 b6 10 c0       	push   $0xc010b6f1
c01071f6:	e8 91 8e ff ff       	call   c010008c <disp_str>
c01071fb:	83 c4 10             	add    $0x10,%esp
c01071fe:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107205:	8b 45 08             	mov    0x8(%ebp),%eax
c0107208:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c010720c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010720f:	83 ec 0c             	sub    $0xc,%esp
c0107212:	ff 75 dc             	pushl  -0x24(%ebp)
c0107215:	e8 72 8e ff ff       	call   c010008c <disp_str>
c010721a:	83 c4 10             	add    $0x10,%esp
c010721d:	83 ec 0c             	sub    $0xc,%esp
c0107220:	68 ff b6 10 c0       	push   $0xc010b6ff
c0107225:	e8 62 8e ff ff       	call   c010008c <disp_str>
c010722a:	83 c4 10             	add    $0x10,%esp
c010722d:	83 ec 0c             	sub    $0xc,%esp
c0107230:	68 02 b7 10 c0       	push   $0xc010b702
c0107235:	e8 52 8e ff ff       	call   c010008c <disp_str>
c010723a:	83 c4 10             	add    $0x10,%esp
c010723d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107240:	83 ec 0c             	sub    $0xc,%esp
c0107243:	50                   	push   %eax
c0107244:	e8 01 fe ff ff       	call   c010704a <disp_int>
c0107249:	83 c4 10             	add    $0x10,%esp
c010724c:	83 ec 0c             	sub    $0xc,%esp
c010724f:	68 ff b6 10 c0       	push   $0xc010b6ff
c0107254:	e8 33 8e ff ff       	call   c010008c <disp_str>
c0107259:	83 c4 10             	add    $0x10,%esp
c010725c:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107260:	74 2f                	je     c0107291 <exception_handler+0xe1>
c0107262:	83 ec 0c             	sub    $0xc,%esp
c0107265:	68 0a b7 10 c0       	push   $0xc010b70a
c010726a:	e8 1d 8e ff ff       	call   c010008c <disp_str>
c010726f:	83 c4 10             	add    $0x10,%esp
c0107272:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107275:	83 ec 0c             	sub    $0xc,%esp
c0107278:	50                   	push   %eax
c0107279:	e8 cc fd ff ff       	call   c010704a <disp_int>
c010727e:	83 c4 10             	add    $0x10,%esp
c0107281:	83 ec 0c             	sub    $0xc,%esp
c0107284:	68 ff b6 10 c0       	push   $0xc010b6ff
c0107289:	e8 fe 8d ff ff       	call   c010008c <disp_str>
c010728e:	83 c4 10             	add    $0x10,%esp
c0107291:	83 ec 0c             	sub    $0xc,%esp
c0107294:	68 14 b7 10 c0       	push   $0xc010b714
c0107299:	e8 ee 8d ff ff       	call   c010008c <disp_str>
c010729e:	83 c4 10             	add    $0x10,%esp
c01072a1:	83 ec 0c             	sub    $0xc,%esp
c01072a4:	ff 75 14             	pushl  0x14(%ebp)
c01072a7:	e8 9e fd ff ff       	call   c010704a <disp_int>
c01072ac:	83 c4 10             	add    $0x10,%esp
c01072af:	83 ec 0c             	sub    $0xc,%esp
c01072b2:	68 ff b6 10 c0       	push   $0xc010b6ff
c01072b7:	e8 d0 8d ff ff       	call   c010008c <disp_str>
c01072bc:	83 c4 10             	add    $0x10,%esp
c01072bf:	83 ec 0c             	sub    $0xc,%esp
c01072c2:	68 18 b7 10 c0       	push   $0xc010b718
c01072c7:	e8 c0 8d ff ff       	call   c010008c <disp_str>
c01072cc:	83 c4 10             	add    $0x10,%esp
c01072cf:	8b 45 10             	mov    0x10(%ebp),%eax
c01072d2:	83 ec 0c             	sub    $0xc,%esp
c01072d5:	50                   	push   %eax
c01072d6:	e8 6f fd ff ff       	call   c010704a <disp_int>
c01072db:	83 c4 10             	add    $0x10,%esp
c01072de:	83 ec 0c             	sub    $0xc,%esp
c01072e1:	68 ff b6 10 c0       	push   $0xc010b6ff
c01072e6:	e8 a1 8d ff ff       	call   c010008c <disp_str>
c01072eb:	83 c4 10             	add    $0x10,%esp
c01072ee:	83 ec 0c             	sub    $0xc,%esp
c01072f1:	68 1d b7 10 c0       	push   $0xc010b71d
c01072f6:	e8 91 8d ff ff       	call   c010008c <disp_str>
c01072fb:	83 c4 10             	add    $0x10,%esp
c01072fe:	83 ec 0c             	sub    $0xc,%esp
c0107301:	ff 75 18             	pushl  0x18(%ebp)
c0107304:	e8 41 fd ff ff       	call   c010704a <disp_int>
c0107309:	83 c4 10             	add    $0x10,%esp
c010730c:	83 ec 0c             	sub    $0xc,%esp
c010730f:	68 ff b6 10 c0       	push   $0xc010b6ff
c0107314:	e8 73 8d ff ff       	call   c010008c <disp_str>
c0107319:	83 c4 10             	add    $0x10,%esp
c010731c:	83 ec 0c             	sub    $0xc,%esp
c010731f:	68 28 b7 10 c0       	push   $0xc010b728
c0107324:	e8 63 8d ff ff       	call   c010008c <disp_str>
c0107329:	83 c4 10             	add    $0x10,%esp
c010732c:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0107330:	75 45                	jne    c0107377 <exception_handler+0x1c7>
c0107332:	0f 20 d0             	mov    %cr2,%eax
c0107335:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107338:	83 ec 0c             	sub    $0xc,%esp
c010733b:	68 47 b7 10 c0       	push   $0xc010b747
c0107340:	e8 47 8d ff ff       	call   c010008c <disp_str>
c0107345:	83 c4 10             	add    $0x10,%esp
c0107348:	83 ec 0c             	sub    $0xc,%esp
c010734b:	68 ce b6 10 c0       	push   $0xc010b6ce
c0107350:	e8 37 8d ff ff       	call   c010008c <disp_str>
c0107355:	83 c4 10             	add    $0x10,%esp
c0107358:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010735b:	83 ec 0c             	sub    $0xc,%esp
c010735e:	50                   	push   %eax
c010735f:	e8 e6 fc ff ff       	call   c010704a <disp_int>
c0107364:	83 c4 10             	add    $0x10,%esp
c0107367:	83 ec 0c             	sub    $0xc,%esp
c010736a:	68 d3 b6 10 c0       	push   $0xc010b6d3
c010736f:	e8 18 8d ff ff       	call   c010008c <disp_str>
c0107374:	83 c4 10             	add    $0x10,%esp
c0107377:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c010737b:	75 11                	jne    c010738e <exception_handler+0x1de>
c010737d:	83 ec 0c             	sub    $0xc,%esp
c0107380:	68 53 b7 10 c0       	push   $0xc010b753
c0107385:	e8 02 8d ff ff       	call   c010008c <disp_str>
c010738a:	83 c4 10             	add    $0x10,%esp
c010738d:	90                   	nop
c010738e:	90                   	nop
c010738f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107392:	5b                   	pop    %ebx
c0107393:	5e                   	pop    %esi
c0107394:	5f                   	pop    %edi
c0107395:	5d                   	pop    %ebp
c0107396:	c3                   	ret    

c0107397 <init_internal_interrupt>:
c0107397:	55                   	push   %ebp
c0107398:	89 e5                	mov    %esp,%ebp
c010739a:	83 ec 08             	sub    $0x8,%esp
c010739d:	6a 0e                	push   $0xe
c010739f:	6a 08                	push   $0x8
c01073a1:	68 03 01 10 c0       	push   $0xc0100103
c01073a6:	6a 00                	push   $0x0
c01073a8:	e8 62 c7 ff ff       	call   c0103b0f <InitInterruptDesc>
c01073ad:	83 c4 10             	add    $0x10,%esp
c01073b0:	6a 0e                	push   $0xe
c01073b2:	6a 08                	push   $0x8
c01073b4:	68 09 01 10 c0       	push   $0xc0100109
c01073b9:	6a 01                	push   $0x1
c01073bb:	e8 4f c7 ff ff       	call   c0103b0f <InitInterruptDesc>
c01073c0:	83 c4 10             	add    $0x10,%esp
c01073c3:	6a 0e                	push   $0xe
c01073c5:	6a 08                	push   $0x8
c01073c7:	68 0f 01 10 c0       	push   $0xc010010f
c01073cc:	6a 02                	push   $0x2
c01073ce:	e8 3c c7 ff ff       	call   c0103b0f <InitInterruptDesc>
c01073d3:	83 c4 10             	add    $0x10,%esp
c01073d6:	6a 0e                	push   $0xe
c01073d8:	6a 08                	push   $0x8
c01073da:	68 15 01 10 c0       	push   $0xc0100115
c01073df:	6a 03                	push   $0x3
c01073e1:	e8 29 c7 ff ff       	call   c0103b0f <InitInterruptDesc>
c01073e6:	83 c4 10             	add    $0x10,%esp
c01073e9:	6a 0e                	push   $0xe
c01073eb:	6a 08                	push   $0x8
c01073ed:	68 1b 01 10 c0       	push   $0xc010011b
c01073f2:	6a 04                	push   $0x4
c01073f4:	e8 16 c7 ff ff       	call   c0103b0f <InitInterruptDesc>
c01073f9:	83 c4 10             	add    $0x10,%esp
c01073fc:	6a 0e                	push   $0xe
c01073fe:	6a 08                	push   $0x8
c0107400:	68 21 01 10 c0       	push   $0xc0100121
c0107405:	6a 05                	push   $0x5
c0107407:	e8 03 c7 ff ff       	call   c0103b0f <InitInterruptDesc>
c010740c:	83 c4 10             	add    $0x10,%esp
c010740f:	6a 0e                	push   $0xe
c0107411:	6a 08                	push   $0x8
c0107413:	68 27 01 10 c0       	push   $0xc0100127
c0107418:	6a 06                	push   $0x6
c010741a:	e8 f0 c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c010741f:	83 c4 10             	add    $0x10,%esp
c0107422:	6a 0e                	push   $0xe
c0107424:	6a 08                	push   $0x8
c0107426:	68 2d 01 10 c0       	push   $0xc010012d
c010742b:	6a 07                	push   $0x7
c010742d:	e8 dd c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c0107432:	83 c4 10             	add    $0x10,%esp
c0107435:	6a 0e                	push   $0xe
c0107437:	6a 08                	push   $0x8
c0107439:	68 33 01 10 c0       	push   $0xc0100133
c010743e:	6a 08                	push   $0x8
c0107440:	e8 ca c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c0107445:	83 c4 10             	add    $0x10,%esp
c0107448:	6a 0e                	push   $0xe
c010744a:	6a 08                	push   $0x8
c010744c:	68 37 01 10 c0       	push   $0xc0100137
c0107451:	6a 09                	push   $0x9
c0107453:	e8 b7 c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c0107458:	83 c4 10             	add    $0x10,%esp
c010745b:	6a 0e                	push   $0xe
c010745d:	6a 08                	push   $0x8
c010745f:	68 3d 01 10 c0       	push   $0xc010013d
c0107464:	6a 0a                	push   $0xa
c0107466:	e8 a4 c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c010746b:	83 c4 10             	add    $0x10,%esp
c010746e:	6a 0e                	push   $0xe
c0107470:	6a 08                	push   $0x8
c0107472:	68 41 01 10 c0       	push   $0xc0100141
c0107477:	6a 0b                	push   $0xb
c0107479:	e8 91 c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c010747e:	83 c4 10             	add    $0x10,%esp
c0107481:	6a 0e                	push   $0xe
c0107483:	6a 08                	push   $0x8
c0107485:	68 45 01 10 c0       	push   $0xc0100145
c010748a:	6a 0c                	push   $0xc
c010748c:	e8 7e c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c0107491:	83 c4 10             	add    $0x10,%esp
c0107494:	6a 0e                	push   $0xe
c0107496:	6a 08                	push   $0x8
c0107498:	68 49 01 10 c0       	push   $0xc0100149
c010749d:	6a 0d                	push   $0xd
c010749f:	e8 6b c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c01074a4:	83 c4 10             	add    $0x10,%esp
c01074a7:	6a 0e                	push   $0xe
c01074a9:	6a 08                	push   $0x8
c01074ab:	68 54 01 10 c0       	push   $0xc0100154
c01074b0:	6a 0e                	push   $0xe
c01074b2:	e8 58 c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c01074b7:	83 c4 10             	add    $0x10,%esp
c01074ba:	6a 0e                	push   $0xe
c01074bc:	6a 08                	push   $0x8
c01074be:	68 58 01 10 c0       	push   $0xc0100158
c01074c3:	6a 10                	push   $0x10
c01074c5:	e8 45 c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c01074ca:	83 c4 10             	add    $0x10,%esp
c01074cd:	6a 0e                	push   $0xe
c01074cf:	6a 08                	push   $0x8
c01074d1:	68 5e 01 10 c0       	push   $0xc010015e
c01074d6:	6a 11                	push   $0x11
c01074d8:	e8 32 c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c01074dd:	83 c4 10             	add    $0x10,%esp
c01074e0:	6a 0e                	push   $0xe
c01074e2:	6a 08                	push   $0x8
c01074e4:	68 62 01 10 c0       	push   $0xc0100162
c01074e9:	6a 12                	push   $0x12
c01074eb:	e8 1f c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c01074f0:	83 c4 10             	add    $0x10,%esp
c01074f3:	6a 0e                	push   $0xe
c01074f5:	6a 0e                	push   $0xe
c01074f7:	68 67 02 10 c0       	push   $0xc0100267
c01074fc:	68 90 00 00 00       	push   $0x90
c0107501:	e8 09 c6 ff ff       	call   c0103b0f <InitInterruptDesc>
c0107506:	83 c4 10             	add    $0x10,%esp
c0107509:	90                   	nop
c010750a:	c9                   	leave  
c010750b:	c3                   	ret    

c010750c <spurious_irq>:
c010750c:	55                   	push   %ebp
c010750d:	89 e5                	mov    %esp,%ebp
c010750f:	83 ec 08             	sub    $0x8,%esp
c0107512:	83 ec 08             	sub    $0x8,%esp
c0107515:	6a 0b                	push   $0xb
c0107517:	68 ac b9 10 c0       	push   $0xc010b9ac
c010751c:	e8 a6 8b ff ff       	call   c01000c7 <disp_str_colour>
c0107521:	83 c4 10             	add    $0x10,%esp
c0107524:	83 ec 0c             	sub    $0xc,%esp
c0107527:	ff 75 08             	pushl  0x8(%ebp)
c010752a:	e8 1b fb ff ff       	call   c010704a <disp_int>
c010752f:	83 c4 10             	add    $0x10,%esp
c0107532:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107537:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010753d:	83 c0 01             	add    $0x1,%eax
c0107540:	83 d2 00             	adc    $0x0,%edx
c0107543:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107548:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010754e:	83 ec 0c             	sub    $0xc,%esp
c0107551:	68 c0 b5 10 c0       	push   $0xc010b5c0
c0107556:	e8 31 8b ff ff       	call   c010008c <disp_str>
c010755b:	83 c4 10             	add    $0x10,%esp
c010755e:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107563:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107569:	83 ec 0c             	sub    $0xc,%esp
c010756c:	50                   	push   %eax
c010756d:	e8 d8 fa ff ff       	call   c010704a <disp_int>
c0107572:	83 c4 10             	add    $0x10,%esp
c0107575:	83 ec 0c             	sub    $0xc,%esp
c0107578:	68 c2 b5 10 c0       	push   $0xc010b5c2
c010757d:	e8 0a 8b ff ff       	call   c010008c <disp_str>
c0107582:	83 c4 10             	add    $0x10,%esp
c0107585:	83 ec 08             	sub    $0x8,%esp
c0107588:	6a 0c                	push   $0xc
c010758a:	68 d4 b9 10 c0       	push   $0xc010b9d4
c010758f:	e8 33 8b ff ff       	call   c01000c7 <disp_str_colour>
c0107594:	83 c4 10             	add    $0x10,%esp
c0107597:	90                   	nop
c0107598:	c9                   	leave  
c0107599:	c3                   	ret    

c010759a <init_keyboard>:
c010759a:	55                   	push   %ebp
c010759b:	89 e5                	mov    %esp,%ebp
c010759d:	83 ec 08             	sub    $0x8,%esp
c01075a0:	83 ec 04             	sub    $0x4,%esp
c01075a3:	68 00 02 00 00       	push   $0x200
c01075a8:	6a 00                	push   $0x0
c01075aa:	68 ec fb 10 c0       	push   $0xc010fbec
c01075af:	e8 b7 4b 00 00       	call   c010c16b <Memset>
c01075b4:	83 c4 10             	add    $0x10,%esp
c01075b7:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01075be:	fb 10 c0 
c01075c1:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01075c6:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01075cb:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c01075d2:	00 00 00 
c01075d5:	e8 4f d3 ff ff       	call   c0104929 <init_keyboard_handler>
c01075da:	90                   	nop
c01075db:	c9                   	leave  
c01075dc:	c3                   	ret    

c01075dd <TestTTY>:
c01075dd:	55                   	push   %ebp
c01075de:	89 e5                	mov    %esp,%ebp
c01075e0:	83 ec 28             	sub    $0x28,%esp
c01075e3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01075ea:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01075f1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01075f7:	83 ec 08             	sub    $0x8,%esp
c01075fa:	6a 02                	push   $0x2
c01075fc:	8d 45 de             	lea    -0x22(%ebp),%eax
c01075ff:	50                   	push   %eax
c0107600:	e8 ca d4 ff ff       	call   c0104acf <open>
c0107605:	83 c4 10             	add    $0x10,%esp
c0107608:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010760b:	83 ec 08             	sub    $0x8,%esp
c010760e:	6a 02                	push   $0x2
c0107610:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107613:	50                   	push   %eax
c0107614:	e8 b6 d4 ff ff       	call   c0104acf <open>
c0107619:	83 c4 10             	add    $0x10,%esp
c010761c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010761f:	83 ec 0c             	sub    $0xc,%esp
c0107622:	68 f9 b9 10 c0       	push   $0xc010b9f9
c0107627:	e8 bf 0e 00 00       	call   c01084eb <Printf>
c010762c:	83 c4 10             	add    $0x10,%esp
c010762f:	83 ec 0c             	sub    $0xc,%esp
c0107632:	6a 0a                	push   $0xa
c0107634:	e8 73 9f ff ff       	call   c01015ac <sys_malloc>
c0107639:	83 c4 10             	add    $0x10,%esp
c010763c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010763f:	83 ec 04             	sub    $0x4,%esp
c0107642:	6a 0a                	push   $0xa
c0107644:	6a 00                	push   $0x0
c0107646:	ff 75 ec             	pushl  -0x14(%ebp)
c0107649:	e8 1d 4b 00 00       	call   c010c16b <Memset>
c010764e:	83 c4 10             	add    $0x10,%esp
c0107651:	83 ec 04             	sub    $0x4,%esp
c0107654:	6a 0a                	push   $0xa
c0107656:	ff 75 ec             	pushl  -0x14(%ebp)
c0107659:	ff 75 f0             	pushl  -0x10(%ebp)
c010765c:	e8 03 d5 ff ff       	call   c0104b64 <read>
c0107661:	83 c4 10             	add    $0x10,%esp
c0107664:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107667:	83 ec 08             	sub    $0x8,%esp
c010766a:	ff 75 ec             	pushl  -0x14(%ebp)
c010766d:	68 0b ba 10 c0       	push   $0xc010ba0b
c0107672:	e8 74 0e 00 00       	call   c01084eb <Printf>
c0107677:	83 c4 10             	add    $0x10,%esp
c010767a:	eb c3                	jmp    c010763f <TestTTY+0x62>

c010767c <TestReadReturnValue>:
c010767c:	55                   	push   %ebp
c010767d:	89 e5                	mov    %esp,%ebp
c010767f:	81 ec 18 02 00 00    	sub    $0x218,%esp
c0107685:	c7 45 f4 15 ba 10 c0 	movl   $0xc010ba15,-0xc(%ebp)
c010768c:	83 ec 08             	sub    $0x8,%esp
c010768f:	6a 00                	push   $0x0
c0107691:	ff 75 f4             	pushl  -0xc(%ebp)
c0107694:	e8 36 d4 ff ff       	call   c0104acf <open>
c0107699:	83 c4 10             	add    $0x10,%esp
c010769c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010769f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01076a6:	83 ec 04             	sub    $0x4,%esp
c01076a9:	68 cb 00 00 00       	push   $0xcb
c01076ae:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01076b4:	50                   	push   %eax
c01076b5:	ff 75 f0             	pushl  -0x10(%ebp)
c01076b8:	e8 a7 d4 ff ff       	call   c0104b64 <read>
c01076bd:	83 c4 10             	add    $0x10,%esp
c01076c0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01076c3:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c01076ca:	74 1c                	je     c01076e8 <TestReadReturnValue+0x6c>
c01076cc:	68 08 02 00 00       	push   $0x208
c01076d1:	68 21 ba 10 c0       	push   $0xc010ba21
c01076d6:	68 21 ba 10 c0       	push   $0xc010ba21
c01076db:	68 31 ba 10 c0       	push   $0xc010ba31
c01076e0:	e8 63 11 00 00       	call   c0108848 <assertion_failure>
c01076e5:	83 c4 10             	add    $0x10,%esp
c01076e8:	83 ec 0c             	sub    $0xc,%esp
c01076eb:	ff 75 f0             	pushl  -0x10(%ebp)
c01076ee:	e8 77 d6 ff ff       	call   c0104d6a <close>
c01076f3:	83 c4 10             	add    $0x10,%esp
c01076f6:	90                   	nop
c01076f7:	c9                   	leave  
c01076f8:	c3                   	ret    

c01076f9 <TestWriteReturnValue>:
c01076f9:	55                   	push   %ebp
c01076fa:	89 e5                	mov    %esp,%ebp
c01076fc:	81 ec 28 02 00 00    	sub    $0x228,%esp
c0107702:	c7 45 f4 3c ba 10 c0 	movl   $0xc010ba3c,-0xc(%ebp)
c0107709:	83 ec 08             	sub    $0x8,%esp
c010770c:	6a 07                	push   $0x7
c010770e:	ff 75 f4             	pushl  -0xc(%ebp)
c0107711:	e8 b9 d3 ff ff       	call   c0104acf <open>
c0107716:	83 c4 10             	add    $0x10,%esp
c0107719:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010771c:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c0107720:	75 1c                	jne    c010773e <TestWriteReturnValue+0x45>
c0107722:	68 12 02 00 00       	push   $0x212
c0107727:	68 21 ba 10 c0       	push   $0xc010ba21
c010772c:	68 21 ba 10 c0       	push   $0xc010ba21
c0107731:	68 49 ba 10 c0       	push   $0xc010ba49
c0107736:	e8 0d 11 00 00       	call   c0108848 <assertion_failure>
c010773b:	83 c4 10             	add    $0x10,%esp
c010773e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107745:	c7 45 e8 54 ba 10 c0 	movl   $0xc010ba54,-0x18(%ebp)
c010774c:	83 ec 0c             	sub    $0xc,%esp
c010774f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107752:	e8 4d 4a 00 00       	call   c010c1a4 <Strlen>
c0107757:	83 c4 10             	add    $0x10,%esp
c010775a:	83 ec 04             	sub    $0x4,%esp
c010775d:	50                   	push   %eax
c010775e:	ff 75 e8             	pushl  -0x18(%ebp)
c0107761:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107767:	50                   	push   %eax
c0107768:	e8 ef f4 ff ff       	call   c0106c5c <Memcpy>
c010776d:	83 c4 10             	add    $0x10,%esp
c0107770:	83 ec 04             	sub    $0x4,%esp
c0107773:	68 ff 01 00 00       	push   $0x1ff
c0107778:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c010777e:	50                   	push   %eax
c010777f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107782:	e8 5e d5 ff ff       	call   c0104ce5 <write>
c0107787:	83 c4 10             	add    $0x10,%esp
c010778a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010778d:	83 ec 0c             	sub    $0xc,%esp
c0107790:	ff 75 e8             	pushl  -0x18(%ebp)
c0107793:	e8 0c 4a 00 00       	call   c010c1a4 <Strlen>
c0107798:	83 c4 10             	add    $0x10,%esp
c010779b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c010779e:	74 1c                	je     c01077bc <TestWriteReturnValue+0xc3>
c01077a0:	68 1c 02 00 00       	push   $0x21c
c01077a5:	68 21 ba 10 c0       	push   $0xc010ba21
c01077aa:	68 21 ba 10 c0       	push   $0xc010ba21
c01077af:	68 87 ba 10 c0       	push   $0xc010ba87
c01077b4:	e8 8f 10 00 00       	call   c0108848 <assertion_failure>
c01077b9:	83 c4 10             	add    $0x10,%esp
c01077bc:	83 ec 0c             	sub    $0xc,%esp
c01077bf:	ff 75 f0             	pushl  -0x10(%ebp)
c01077c2:	e8 a3 d5 ff ff       	call   c0104d6a <close>
c01077c7:	83 c4 10             	add    $0x10,%esp
c01077ca:	90                   	nop
c01077cb:	c9                   	leave  
c01077cc:	c3                   	ret    

c01077cd <TestFS2>:
c01077cd:	55                   	push   %ebp
c01077ce:	89 e5                	mov    %esp,%ebp
c01077d0:	83 ec 08             	sub    $0x8,%esp
c01077d3:	e8 21 ff ff ff       	call   c01076f9 <TestWriteReturnValue>
c01077d8:	90                   	nop
c01077d9:	c9                   	leave  
c01077da:	c3                   	ret    

c01077db <TestFS>:
c01077db:	55                   	push   %ebp
c01077dc:	89 e5                	mov    %esp,%ebp
c01077de:	57                   	push   %edi
c01077df:	56                   	push   %esi
c01077e0:	53                   	push   %ebx
c01077e1:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c01077e7:	83 ec 0c             	sub    $0xc,%esp
c01077ea:	68 9a ba 10 c0       	push   $0xc010ba9a
c01077ef:	e8 98 88 ff ff       	call   c010008c <disp_str>
c01077f4:	83 c4 10             	add    $0x10,%esp
c01077f7:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c01077fe:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107805:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c010780b:	83 ec 08             	sub    $0x8,%esp
c010780e:	6a 02                	push   $0x2
c0107810:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107813:	50                   	push   %eax
c0107814:	e8 b6 d2 ff ff       	call   c0104acf <open>
c0107819:	83 c4 10             	add    $0x10,%esp
c010781c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010781f:	83 ec 08             	sub    $0x8,%esp
c0107822:	6a 02                	push   $0x2
c0107824:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107827:	50                   	push   %eax
c0107828:	e8 a2 d2 ff ff       	call   c0104acf <open>
c010782d:	83 c4 10             	add    $0x10,%esp
c0107830:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107833:	83 ec 0c             	sub    $0xc,%esp
c0107836:	68 f9 b9 10 c0       	push   $0xc010b9f9
c010783b:	e8 ab 0c 00 00       	call   c01084eb <Printf>
c0107840:	83 c4 10             	add    $0x10,%esp
c0107843:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c010784a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c010784e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c0107855:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c0107859:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c0107860:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c0107867:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c010786d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c0107874:	83 ec 0c             	sub    $0xc,%esp
c0107877:	68 a2 ba 10 c0       	push   $0xc010baa2
c010787c:	e8 6a 0c 00 00       	call   c01084eb <Printf>
c0107881:	83 c4 10             	add    $0x10,%esp
c0107884:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c0107888:	0f 85 e6 03 00 00    	jne    c0107c74 <TestFS+0x499>
c010788e:	83 ec 08             	sub    $0x8,%esp
c0107891:	6a 07                	push   $0x7
c0107893:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107896:	50                   	push   %eax
c0107897:	e8 33 d2 ff ff       	call   c0104acf <open>
c010789c:	83 c4 10             	add    $0x10,%esp
c010789f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01078a2:	83 ec 08             	sub    $0x8,%esp
c01078a5:	ff 75 d0             	pushl  -0x30(%ebp)
c01078a8:	68 ba ba 10 c0       	push   $0xc010baba
c01078ad:	e8 39 0c 00 00       	call   c01084eb <Printf>
c01078b2:	83 c4 10             	add    $0x10,%esp
c01078b5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c01078bc:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c01078c3:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c01078ca:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c01078d1:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c01078d8:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c01078df:	83 ec 0c             	sub    $0xc,%esp
c01078e2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c01078e5:	50                   	push   %eax
c01078e6:	e8 b9 48 00 00       	call   c010c1a4 <Strlen>
c01078eb:	83 c4 10             	add    $0x10,%esp
c01078ee:	83 ec 04             	sub    $0x4,%esp
c01078f1:	50                   	push   %eax
c01078f2:	8d 45 86             	lea    -0x7a(%ebp),%eax
c01078f5:	50                   	push   %eax
c01078f6:	ff 75 d0             	pushl  -0x30(%ebp)
c01078f9:	e8 e7 d3 ff ff       	call   c0104ce5 <write>
c01078fe:	83 c4 10             	add    $0x10,%esp
c0107901:	83 ec 0c             	sub    $0xc,%esp
c0107904:	ff 75 d0             	pushl  -0x30(%ebp)
c0107907:	e8 5e d4 ff ff       	call   c0104d6a <close>
c010790c:	83 c4 10             	add    $0x10,%esp
c010790f:	83 ec 08             	sub    $0x8,%esp
c0107912:	6a 00                	push   $0x0
c0107914:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107917:	50                   	push   %eax
c0107918:	e8 b2 d1 ff ff       	call   c0104acf <open>
c010791d:	83 c4 10             	add    $0x10,%esp
c0107920:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107923:	83 ec 04             	sub    $0x4,%esp
c0107926:	6a 14                	push   $0x14
c0107928:	6a 00                	push   $0x0
c010792a:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107930:	50                   	push   %eax
c0107931:	e8 35 48 00 00       	call   c010c16b <Memset>
c0107936:	83 c4 10             	add    $0x10,%esp
c0107939:	83 ec 04             	sub    $0x4,%esp
c010793c:	6a 12                	push   $0x12
c010793e:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107944:	50                   	push   %eax
c0107945:	ff 75 d0             	pushl  -0x30(%ebp)
c0107948:	e8 17 d2 ff ff       	call   c0104b64 <read>
c010794d:	83 c4 10             	add    $0x10,%esp
c0107950:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107953:	83 ec 08             	sub    $0x8,%esp
c0107956:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c010795c:	50                   	push   %eax
c010795d:	68 c3 ba 10 c0       	push   $0xc010bac3
c0107962:	e8 84 0b 00 00       	call   c01084eb <Printf>
c0107967:	83 c4 10             	add    $0x10,%esp
c010796a:	83 ec 0c             	sub    $0xc,%esp
c010796d:	6a 0a                	push   $0xa
c010796f:	e8 43 0a 00 00       	call   c01083b7 <delay>
c0107974:	83 c4 10             	add    $0x10,%esp
c0107977:	83 ec 08             	sub    $0x8,%esp
c010797a:	6a 07                	push   $0x7
c010797c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c010797f:	50                   	push   %eax
c0107980:	e8 4a d1 ff ff       	call   c0104acf <open>
c0107985:	83 c4 10             	add    $0x10,%esp
c0107988:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010798b:	83 ec 08             	sub    $0x8,%esp
c010798e:	ff 75 c8             	pushl  -0x38(%ebp)
c0107991:	68 ce ba 10 c0       	push   $0xc010bace
c0107996:	e8 50 0b 00 00       	call   c01084eb <Printf>
c010799b:	83 c4 10             	add    $0x10,%esp
c010799e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c01079a5:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c01079ab:	bb 04 bb 10 c0       	mov    $0xc010bb04,%ebx
c01079b0:	ba bf 00 00 00       	mov    $0xbf,%edx
c01079b5:	8b 0b                	mov    (%ebx),%ecx
c01079b7:	89 08                	mov    %ecx,(%eax)
c01079b9:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c01079bd:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c01079c1:	8d 78 04             	lea    0x4(%eax),%edi
c01079c4:	83 e7 fc             	and    $0xfffffffc,%edi
c01079c7:	29 f8                	sub    %edi,%eax
c01079c9:	29 c3                	sub    %eax,%ebx
c01079cb:	01 c2                	add    %eax,%edx
c01079cd:	83 e2 fc             	and    $0xfffffffc,%edx
c01079d0:	89 d0                	mov    %edx,%eax
c01079d2:	c1 e8 02             	shr    $0x2,%eax
c01079d5:	89 de                	mov    %ebx,%esi
c01079d7:	89 c1                	mov    %eax,%ecx
c01079d9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01079db:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c01079e2:	00 00 00 
c01079e5:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c01079ec:	00 00 00 
c01079ef:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c01079f6:	83 ec 0c             	sub    $0xc,%esp
c01079f9:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c01079ff:	50                   	push   %eax
c0107a00:	e8 9f 47 00 00       	call   c010c1a4 <Strlen>
c0107a05:	83 c4 10             	add    $0x10,%esp
c0107a08:	83 ec 04             	sub    $0x4,%esp
c0107a0b:	50                   	push   %eax
c0107a0c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a12:	50                   	push   %eax
c0107a13:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a16:	e8 ca d2 ff ff       	call   c0104ce5 <write>
c0107a1b:	83 c4 10             	add    $0x10,%esp
c0107a1e:	83 ec 0c             	sub    $0xc,%esp
c0107a21:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a24:	e8 41 d3 ff ff       	call   c0104d6a <close>
c0107a29:	83 c4 10             	add    $0x10,%esp
c0107a2c:	83 ec 08             	sub    $0x8,%esp
c0107a2f:	6a 00                	push   $0x0
c0107a31:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107a34:	50                   	push   %eax
c0107a35:	e8 95 d0 ff ff       	call   c0104acf <open>
c0107a3a:	83 c4 10             	add    $0x10,%esp
c0107a3d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107a40:	83 ec 04             	sub    $0x4,%esp
c0107a43:	68 c8 00 00 00       	push   $0xc8
c0107a48:	6a 00                	push   $0x0
c0107a4a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107a50:	50                   	push   %eax
c0107a51:	e8 15 47 00 00       	call   c010c16b <Memset>
c0107a56:	83 c4 10             	add    $0x10,%esp
c0107a59:	83 ec 0c             	sub    $0xc,%esp
c0107a5c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a62:	50                   	push   %eax
c0107a63:	e8 3c 47 00 00       	call   c010c1a4 <Strlen>
c0107a68:	83 c4 10             	add    $0x10,%esp
c0107a6b:	83 ec 04             	sub    $0x4,%esp
c0107a6e:	50                   	push   %eax
c0107a6f:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107a75:	50                   	push   %eax
c0107a76:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a79:	e8 e6 d0 ff ff       	call   c0104b64 <read>
c0107a7e:	83 c4 10             	add    $0x10,%esp
c0107a81:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107a84:	83 ec 08             	sub    $0x8,%esp
c0107a87:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107a8d:	50                   	push   %eax
c0107a8e:	68 d8 ba 10 c0       	push   $0xc010bad8
c0107a93:	e8 53 0a 00 00       	call   c01084eb <Printf>
c0107a98:	83 c4 10             	add    $0x10,%esp
c0107a9b:	83 ec 08             	sub    $0x8,%esp
c0107a9e:	6a 07                	push   $0x7
c0107aa0:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107aa3:	50                   	push   %eax
c0107aa4:	e8 26 d0 ff ff       	call   c0104acf <open>
c0107aa9:	83 c4 10             	add    $0x10,%esp
c0107aac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107aaf:	83 ec 08             	sub    $0x8,%esp
c0107ab2:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ab5:	68 ce ba 10 c0       	push   $0xc010bace
c0107aba:	e8 2c 0a 00 00       	call   c01084eb <Printf>
c0107abf:	83 c4 10             	add    $0x10,%esp
c0107ac2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107ac9:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107ad0:	20 77 69 
c0107ad3:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107ada:	6c 20 73 
c0107add:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107ae4:	63 63 65 
c0107ae7:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107aee:	73 20 61 
c0107af1:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107af8:	20 6c 61 
c0107afb:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107b02:	74 2e 00 
c0107b05:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107b0c:	00 00 00 
c0107b0f:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107b16:	00 00 
c0107b18:	83 ec 0c             	sub    $0xc,%esp
c0107b1b:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107b21:	50                   	push   %eax
c0107b22:	e8 7d 46 00 00       	call   c010c1a4 <Strlen>
c0107b27:	83 c4 10             	add    $0x10,%esp
c0107b2a:	83 ec 04             	sub    $0x4,%esp
c0107b2d:	50                   	push   %eax
c0107b2e:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107b34:	50                   	push   %eax
c0107b35:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107b38:	e8 a8 d1 ff ff       	call   c0104ce5 <write>
c0107b3d:	83 c4 10             	add    $0x10,%esp
c0107b40:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107b47:	eb 7e                	jmp    c0107bc7 <TestFS+0x3ec>
c0107b49:	83 ec 0c             	sub    $0xc,%esp
c0107b4c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107b4f:	e8 16 d2 ff ff       	call   c0104d6a <close>
c0107b54:	83 c4 10             	add    $0x10,%esp
c0107b57:	83 ec 08             	sub    $0x8,%esp
c0107b5a:	6a 00                	push   $0x0
c0107b5c:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107b5f:	50                   	push   %eax
c0107b60:	e8 6a cf ff ff       	call   c0104acf <open>
c0107b65:	83 c4 10             	add    $0x10,%esp
c0107b68:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107b6b:	83 ec 04             	sub    $0x4,%esp
c0107b6e:	6a 1e                	push   $0x1e
c0107b70:	6a 00                	push   $0x0
c0107b72:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107b78:	50                   	push   %eax
c0107b79:	e8 ed 45 00 00       	call   c010c16b <Memset>
c0107b7e:	83 c4 10             	add    $0x10,%esp
c0107b81:	83 ec 0c             	sub    $0xc,%esp
c0107b84:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107b8a:	50                   	push   %eax
c0107b8b:	e8 14 46 00 00       	call   c010c1a4 <Strlen>
c0107b90:	83 c4 10             	add    $0x10,%esp
c0107b93:	83 ec 04             	sub    $0x4,%esp
c0107b96:	50                   	push   %eax
c0107b97:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107b9d:	50                   	push   %eax
c0107b9e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107ba1:	e8 be cf ff ff       	call   c0104b64 <read>
c0107ba6:	83 c4 10             	add    $0x10,%esp
c0107ba9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107bac:	83 ec 08             	sub    $0x8,%esp
c0107baf:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107bb5:	50                   	push   %eax
c0107bb6:	68 e3 ba 10 c0       	push   $0xc010bae3
c0107bbb:	e8 2b 09 00 00       	call   c01084eb <Printf>
c0107bc0:	83 c4 10             	add    $0x10,%esp
c0107bc3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107bc7:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107bcb:	0f 8e 78 ff ff ff    	jle    c0107b49 <TestFS+0x36e>
c0107bd1:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107bd8:	6e 73 74 
c0107bdb:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107be2:	6c 6c 2e 
c0107be5:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107bec:	61 72 00 
c0107bef:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107bf6:	00 00 00 
c0107bf9:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107c00:	00 00 00 
c0107c03:	83 ec 08             	sub    $0x8,%esp
c0107c06:	6a 00                	push   $0x0
c0107c08:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107c0e:	50                   	push   %eax
c0107c0f:	e8 bb ce ff ff       	call   c0104acf <open>
c0107c14:	83 c4 10             	add    $0x10,%esp
c0107c17:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107c1a:	83 ec 08             	sub    $0x8,%esp
c0107c1d:	ff 75 bc             	pushl  -0x44(%ebp)
c0107c20:	68 ee ba 10 c0       	push   $0xc010baee
c0107c25:	e8 c1 08 00 00       	call   c01084eb <Printf>
c0107c2a:	83 c4 10             	add    $0x10,%esp
c0107c2d:	83 ec 04             	sub    $0x4,%esp
c0107c30:	6a 28                	push   $0x28
c0107c32:	6a 00                	push   $0x0
c0107c34:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107c3a:	50                   	push   %eax
c0107c3b:	e8 2b 45 00 00       	call   c010c16b <Memset>
c0107c40:	83 c4 10             	add    $0x10,%esp
c0107c43:	83 ec 04             	sub    $0x4,%esp
c0107c46:	6a 28                	push   $0x28
c0107c48:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107c4e:	50                   	push   %eax
c0107c4f:	ff 75 bc             	pushl  -0x44(%ebp)
c0107c52:	e8 0d cf ff ff       	call   c0104b64 <read>
c0107c57:	83 c4 10             	add    $0x10,%esp
c0107c5a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107c5d:	83 ec 08             	sub    $0x8,%esp
c0107c60:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107c66:	50                   	push   %eax
c0107c67:	68 f8 ba 10 c0       	push   $0xc010baf8
c0107c6c:	e8 7a 08 00 00       	call   c01084eb <Printf>
c0107c71:	83 c4 10             	add    $0x10,%esp
c0107c74:	90                   	nop
c0107c75:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107c78:	5b                   	pop    %ebx
c0107c79:	5e                   	pop    %esi
c0107c7a:	5f                   	pop    %edi
c0107c7b:	5d                   	pop    %ebp
c0107c7c:	c3                   	ret    

c0107c7d <wait_exit>:
c0107c7d:	55                   	push   %ebp
c0107c7e:	89 e5                	mov    %esp,%ebp
c0107c80:	83 ec 28             	sub    $0x28,%esp
c0107c83:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107c8a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107c91:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107c97:	83 ec 08             	sub    $0x8,%esp
c0107c9a:	6a 02                	push   $0x2
c0107c9c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107c9f:	50                   	push   %eax
c0107ca0:	e8 2a ce ff ff       	call   c0104acf <open>
c0107ca5:	83 c4 10             	add    $0x10,%esp
c0107ca8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107cab:	83 ec 08             	sub    $0x8,%esp
c0107cae:	6a 02                	push   $0x2
c0107cb0:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107cb3:	50                   	push   %eax
c0107cb4:	e8 16 ce ff ff       	call   c0104acf <open>
c0107cb9:	83 c4 10             	add    $0x10,%esp
c0107cbc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107cbf:	e8 6b d1 ff ff       	call   c0104e2f <fork>
c0107cc4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107cc7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107ccb:	7e 35                	jle    c0107d02 <wait_exit+0x85>
c0107ccd:	83 ec 0c             	sub    $0xc,%esp
c0107cd0:	68 cc bb 10 c0       	push   $0xc010bbcc
c0107cd5:	e8 11 08 00 00       	call   c01084eb <Printf>
c0107cda:	83 c4 10             	add    $0x10,%esp
c0107cdd:	83 ec 0c             	sub    $0xc,%esp
c0107ce0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107ce3:	50                   	push   %eax
c0107ce4:	e8 d3 d0 ff ff       	call   c0104dbc <wait>
c0107ce9:	83 c4 10             	add    $0x10,%esp
c0107cec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107cef:	83 ec 08             	sub    $0x8,%esp
c0107cf2:	50                   	push   %eax
c0107cf3:	68 e4 bb 10 c0       	push   $0xc010bbe4
c0107cf8:	e8 ee 07 00 00       	call   c01084eb <Printf>
c0107cfd:	83 c4 10             	add    $0x10,%esp
c0107d00:	eb fe                	jmp    c0107d00 <wait_exit+0x83>
c0107d02:	83 ec 0c             	sub    $0xc,%esp
c0107d05:	68 ff bb 10 c0       	push   $0xc010bbff
c0107d0a:	e8 dc 07 00 00       	call   c01084eb <Printf>
c0107d0f:	83 c4 10             	add    $0x10,%esp
c0107d12:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107d19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107d1c:	8d 50 01             	lea    0x1(%eax),%edx
c0107d1f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107d22:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107d27:	7f 02                	jg     c0107d2b <wait_exit+0xae>
c0107d29:	eb ee                	jmp    c0107d19 <wait_exit+0x9c>
c0107d2b:	90                   	nop
c0107d2c:	83 ec 0c             	sub    $0xc,%esp
c0107d2f:	68 0b bc 10 c0       	push   $0xc010bc0b
c0107d34:	e8 b2 07 00 00       	call   c01084eb <Printf>
c0107d39:	83 c4 10             	add    $0x10,%esp
c0107d3c:	83 ec 0c             	sub    $0xc,%esp
c0107d3f:	68 19 bc 10 c0       	push   $0xc010bc19
c0107d44:	e8 a2 07 00 00       	call   c01084eb <Printf>
c0107d49:	83 c4 10             	add    $0x10,%esp
c0107d4c:	83 ec 0c             	sub    $0xc,%esp
c0107d4f:	68 28 bc 10 c0       	push   $0xc010bc28
c0107d54:	e8 92 07 00 00       	call   c01084eb <Printf>
c0107d59:	83 c4 10             	add    $0x10,%esp
c0107d5c:	83 ec 0c             	sub    $0xc,%esp
c0107d5f:	6a 5a                	push   $0x5a
c0107d61:	e8 9a d0 ff ff       	call   c0104e00 <exit>
c0107d66:	83 c4 10             	add    $0x10,%esp
c0107d69:	83 ec 0c             	sub    $0xc,%esp
c0107d6c:	68 37 bc 10 c0       	push   $0xc010bc37
c0107d71:	e8 75 07 00 00       	call   c01084eb <Printf>
c0107d76:	83 c4 10             	add    $0x10,%esp
c0107d79:	eb fe                	jmp    c0107d79 <wait_exit+0xfc>

c0107d7b <INIT_fork>:
c0107d7b:	55                   	push   %ebp
c0107d7c:	89 e5                	mov    %esp,%ebp
c0107d7e:	83 ec 78             	sub    $0x78,%esp
c0107d81:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107d88:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107d8f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107d95:	83 ec 08             	sub    $0x8,%esp
c0107d98:	6a 02                	push   $0x2
c0107d9a:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d9d:	50                   	push   %eax
c0107d9e:	e8 2c cd ff ff       	call   c0104acf <open>
c0107da3:	83 c4 10             	add    $0x10,%esp
c0107da6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107da9:	83 ec 08             	sub    $0x8,%esp
c0107dac:	6a 02                	push   $0x2
c0107dae:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107db1:	50                   	push   %eax
c0107db2:	e8 18 cd ff ff       	call   c0104acf <open>
c0107db7:	83 c4 10             	add    $0x10,%esp
c0107dba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107dbd:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107dc4:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107dcb:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107dd2:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107dd9:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107de0:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107de7:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107dee:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107df5:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107dfc:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107e03:	83 ec 0c             	sub    $0xc,%esp
c0107e06:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e09:	50                   	push   %eax
c0107e0a:	e8 dc 06 00 00       	call   c01084eb <Printf>
c0107e0f:	83 c4 10             	add    $0x10,%esp
c0107e12:	83 ec 0c             	sub    $0xc,%esp
c0107e15:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e18:	50                   	push   %eax
c0107e19:	e8 86 43 00 00       	call   c010c1a4 <Strlen>
c0107e1e:	83 c4 10             	add    $0x10,%esp
c0107e21:	83 ec 04             	sub    $0x4,%esp
c0107e24:	50                   	push   %eax
c0107e25:	6a 00                	push   $0x0
c0107e27:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e2a:	50                   	push   %eax
c0107e2b:	e8 3b 43 00 00       	call   c010c16b <Memset>
c0107e30:	83 c4 10             	add    $0x10,%esp
c0107e33:	83 ec 04             	sub    $0x4,%esp
c0107e36:	6a 28                	push   $0x28
c0107e38:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e3b:	50                   	push   %eax
c0107e3c:	ff 75 f0             	pushl  -0x10(%ebp)
c0107e3f:	e8 20 cd ff ff       	call   c0104b64 <read>
c0107e44:	83 c4 10             	add    $0x10,%esp
c0107e47:	83 ec 0c             	sub    $0xc,%esp
c0107e4a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e4d:	50                   	push   %eax
c0107e4e:	e8 98 06 00 00       	call   c01084eb <Printf>
c0107e53:	83 c4 10             	add    $0x10,%esp
c0107e56:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107e5d:	e8 cd cf ff ff       	call   c0104e2f <fork>
c0107e62:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107e65:	83 ec 0c             	sub    $0xc,%esp
c0107e68:	6a 01                	push   $0x1
c0107e6a:	e8 48 05 00 00       	call   c01083b7 <delay>
c0107e6f:	83 c4 10             	add    $0x10,%esp
c0107e72:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107e76:	0f 8e cd 00 00 00    	jle    c0107f49 <INIT_fork+0x1ce>
c0107e7c:	83 ec 08             	sub    $0x8,%esp
c0107e7f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107e82:	68 45 bc 10 c0       	push   $0xc010bc45
c0107e87:	e8 5f 06 00 00       	call   c01084eb <Printf>
c0107e8c:	83 c4 10             	add    $0x10,%esp
c0107e8f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107e93:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107e9a:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107ea1:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107ea8:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107eaf:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107eb6:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107ebd:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107ec4:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107ecb:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107ed2:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107ed9:	83 ec 0c             	sub    $0xc,%esp
c0107edc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107edf:	50                   	push   %eax
c0107ee0:	e8 bf 42 00 00       	call   c010c1a4 <Strlen>
c0107ee5:	83 c4 10             	add    $0x10,%esp
c0107ee8:	83 ec 04             	sub    $0x4,%esp
c0107eeb:	50                   	push   %eax
c0107eec:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107eef:	50                   	push   %eax
c0107ef0:	ff 75 f4             	pushl  -0xc(%ebp)
c0107ef3:	e8 ed cd ff ff       	call   c0104ce5 <write>
c0107ef8:	83 c4 10             	add    $0x10,%esp
c0107efb:	e8 b2 ec ff ff       	call   c0106bb2 <catch_error>
c0107f00:	83 ec 0c             	sub    $0xc,%esp
c0107f03:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f06:	50                   	push   %eax
c0107f07:	e8 98 42 00 00       	call   c010c1a4 <Strlen>
c0107f0c:	83 c4 10             	add    $0x10,%esp
c0107f0f:	83 ec 04             	sub    $0x4,%esp
c0107f12:	50                   	push   %eax
c0107f13:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f16:	50                   	push   %eax
c0107f17:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f1a:	e8 c6 cd ff ff       	call   c0104ce5 <write>
c0107f1f:	83 c4 10             	add    $0x10,%esp
c0107f22:	83 ec 0c             	sub    $0xc,%esp
c0107f25:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f28:	50                   	push   %eax
c0107f29:	e8 76 42 00 00       	call   c010c1a4 <Strlen>
c0107f2e:	83 c4 10             	add    $0x10,%esp
c0107f31:	83 ec 04             	sub    $0x4,%esp
c0107f34:	50                   	push   %eax
c0107f35:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f38:	50                   	push   %eax
c0107f39:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f3c:	e8 a4 cd ff ff       	call   c0104ce5 <write>
c0107f41:	83 c4 10             	add    $0x10,%esp
c0107f44:	e9 d6 00 00 00       	jmp    c010801f <INIT_fork+0x2a4>
c0107f49:	83 ec 08             	sub    $0x8,%esp
c0107f4c:	ff 75 e8             	pushl  -0x18(%ebp)
c0107f4f:	68 45 bc 10 c0       	push   $0xc010bc45
c0107f54:	e8 92 05 00 00       	call   c01084eb <Printf>
c0107f59:	83 c4 10             	add    $0x10,%esp
c0107f5c:	83 ec 0c             	sub    $0xc,%esp
c0107f5f:	6a 01                	push   $0x1
c0107f61:	e8 51 04 00 00       	call   c01083b7 <delay>
c0107f66:	83 c4 10             	add    $0x10,%esp
c0107f69:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107f6d:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0107f71:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0107f78:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0107f7f:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0107f86:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0107f8d:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0107f94:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0107f9b:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0107fa2:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107fa9:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107fb0:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107fb7:	83 ec 0c             	sub    $0xc,%esp
c0107fba:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fbd:	50                   	push   %eax
c0107fbe:	e8 e1 41 00 00       	call   c010c1a4 <Strlen>
c0107fc3:	83 c4 10             	add    $0x10,%esp
c0107fc6:	83 ec 04             	sub    $0x4,%esp
c0107fc9:	50                   	push   %eax
c0107fca:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fcd:	50                   	push   %eax
c0107fce:	ff 75 f4             	pushl  -0xc(%ebp)
c0107fd1:	e8 0f cd ff ff       	call   c0104ce5 <write>
c0107fd6:	83 c4 10             	add    $0x10,%esp
c0107fd9:	83 ec 0c             	sub    $0xc,%esp
c0107fdc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fdf:	50                   	push   %eax
c0107fe0:	e8 bf 41 00 00       	call   c010c1a4 <Strlen>
c0107fe5:	83 c4 10             	add    $0x10,%esp
c0107fe8:	83 ec 04             	sub    $0x4,%esp
c0107feb:	50                   	push   %eax
c0107fec:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fef:	50                   	push   %eax
c0107ff0:	ff 75 f4             	pushl  -0xc(%ebp)
c0107ff3:	e8 ed cc ff ff       	call   c0104ce5 <write>
c0107ff8:	83 c4 10             	add    $0x10,%esp
c0107ffb:	83 ec 0c             	sub    $0xc,%esp
c0107ffe:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108001:	50                   	push   %eax
c0108002:	e8 9d 41 00 00       	call   c010c1a4 <Strlen>
c0108007:	83 c4 10             	add    $0x10,%esp
c010800a:	83 ec 04             	sub    $0x4,%esp
c010800d:	50                   	push   %eax
c010800e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108011:	50                   	push   %eax
c0108012:	ff 75 f4             	pushl  -0xc(%ebp)
c0108015:	e8 cb cc ff ff       	call   c0104ce5 <write>
c010801a:	83 c4 10             	add    $0x10,%esp
c010801d:	eb fe                	jmp    c010801d <INIT_fork+0x2a2>
c010801f:	83 ec 04             	sub    $0x4,%esp
c0108022:	6a 28                	push   $0x28
c0108024:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108027:	50                   	push   %eax
c0108028:	ff 75 f0             	pushl  -0x10(%ebp)
c010802b:	e8 34 cb ff ff       	call   c0104b64 <read>
c0108030:	83 c4 10             	add    $0x10,%esp
c0108033:	83 ec 0c             	sub    $0xc,%esp
c0108036:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108039:	50                   	push   %eax
c010803a:	e8 ac 04 00 00       	call   c01084eb <Printf>
c010803f:	83 c4 10             	add    $0x10,%esp
c0108042:	83 ec 0c             	sub    $0xc,%esp
c0108045:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108048:	50                   	push   %eax
c0108049:	e8 9d 04 00 00       	call   c01084eb <Printf>
c010804e:	83 c4 10             	add    $0x10,%esp
c0108051:	83 ec 0c             	sub    $0xc,%esp
c0108054:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108057:	50                   	push   %eax
c0108058:	e8 8e 04 00 00       	call   c01084eb <Printf>
c010805d:	83 c4 10             	add    $0x10,%esp
c0108060:	83 ec 0c             	sub    $0xc,%esp
c0108063:	68 4f bc 10 c0       	push   $0xc010bc4f
c0108068:	e8 97 07 00 00       	call   c0108804 <spin>
c010806d:	83 c4 10             	add    $0x10,%esp
c0108070:	90                   	nop
c0108071:	c9                   	leave  
c0108072:	c3                   	ret    

c0108073 <simple_shell>:
c0108073:	55                   	push   %ebp
c0108074:	89 e5                	mov    %esp,%ebp
c0108076:	57                   	push   %edi
c0108077:	83 ec 64             	sub    $0x64,%esp
c010807a:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0108081:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0108088:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c010808e:	83 ec 08             	sub    $0x8,%esp
c0108091:	6a 02                	push   $0x2
c0108093:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108096:	50                   	push   %eax
c0108097:	e8 33 ca ff ff       	call   c0104acf <open>
c010809c:	83 c4 10             	add    $0x10,%esp
c010809f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01080a2:	83 ec 08             	sub    $0x8,%esp
c01080a5:	6a 02                	push   $0x2
c01080a7:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01080aa:	50                   	push   %eax
c01080ab:	e8 1f ca ff ff       	call   c0104acf <open>
c01080b0:	83 c4 10             	add    $0x10,%esp
c01080b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01080b6:	8d 55 a8             	lea    -0x58(%ebp),%edx
c01080b9:	b8 00 00 00 00       	mov    $0x0,%eax
c01080be:	b9 0a 00 00 00       	mov    $0xa,%ecx
c01080c3:	89 d7                	mov    %edx,%edi
c01080c5:	f3 ab                	rep stos %eax,%es:(%edi)
c01080c7:	c7 45 a8 57 bc 10 c0 	movl   $0xc010bc57,-0x58(%ebp)
c01080ce:	c7 45 ac 5c bc 10 c0 	movl   $0xc010bc5c,-0x54(%ebp)
c01080d5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01080dc:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c01080e3:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c01080ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01080ed:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c01080f4:	00 
c01080f5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01080f8:	85 c0                	test   %eax,%eax
c01080fa:	75 1c                	jne    c0108118 <simple_shell+0xa5>
c01080fc:	68 0e 03 00 00       	push   $0x30e
c0108101:	68 21 ba 10 c0       	push   $0xc010ba21
c0108106:	68 21 ba 10 c0       	push   $0xc010ba21
c010810b:	68 62 bc 10 c0       	push   $0xc010bc62
c0108110:	e8 33 07 00 00       	call   c0108848 <assertion_failure>
c0108115:	83 c4 10             	add    $0x10,%esp
c0108118:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010811b:	83 ec 08             	sub    $0x8,%esp
c010811e:	6a 02                	push   $0x2
c0108120:	50                   	push   %eax
c0108121:	e8 a9 c9 ff ff       	call   c0104acf <open>
c0108126:	83 c4 10             	add    $0x10,%esp
c0108129:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010812c:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0108130:	75 4b                	jne    c010817d <simple_shell+0x10a>
c0108132:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108139:	eb 26                	jmp    c0108161 <simple_shell+0xee>
c010813b:	8b 55 a8             	mov    -0x58(%ebp),%edx
c010813e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108141:	01 d0                	add    %edx,%eax
c0108143:	0f b6 00             	movzbl (%eax),%eax
c0108146:	0f be c0             	movsbl %al,%eax
c0108149:	83 ec 04             	sub    $0x4,%esp
c010814c:	50                   	push   %eax
c010814d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108150:	68 71 bc 10 c0       	push   $0xc010bc71
c0108155:	e8 91 03 00 00       	call   c01084eb <Printf>
c010815a:	83 c4 10             	add    $0x10,%esp
c010815d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108161:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0108165:	7e d4                	jle    c010813b <simple_shell+0xc8>
c0108167:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010816a:	83 ec 08             	sub    $0x8,%esp
c010816d:	50                   	push   %eax
c010816e:	68 78 bc 10 c0       	push   $0xc010bc78
c0108173:	e8 73 03 00 00       	call   c01084eb <Printf>
c0108178:	83 c4 10             	add    $0x10,%esp
c010817b:	eb 78                	jmp    c01081f5 <simple_shell+0x182>
c010817d:	83 ec 0c             	sub    $0xc,%esp
c0108180:	68 7e bc 10 c0       	push   $0xc010bc7e
c0108185:	e8 61 03 00 00       	call   c01084eb <Printf>
c010818a:	83 c4 10             	add    $0x10,%esp
c010818d:	e8 9d cc ff ff       	call   c0104e2f <fork>
c0108192:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108195:	83 ec 0c             	sub    $0xc,%esp
c0108198:	68 93 bc 10 c0       	push   $0xc010bc93
c010819d:	e8 49 03 00 00       	call   c01084eb <Printf>
c01081a2:	83 c4 10             	add    $0x10,%esp
c01081a5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01081a9:	7e 11                	jle    c01081bc <simple_shell+0x149>
c01081ab:	83 ec 0c             	sub    $0xc,%esp
c01081ae:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c01081b1:	50                   	push   %eax
c01081b2:	e8 05 cc ff ff       	call   c0104dbc <wait>
c01081b7:	83 c4 10             	add    $0x10,%esp
c01081ba:	eb 39                	jmp    c01081f5 <simple_shell+0x182>
c01081bc:	83 ec 0c             	sub    $0xc,%esp
c01081bf:	68 a8 bc 10 c0       	push   $0xc010bca8
c01081c4:	e8 22 03 00 00       	call   c01084eb <Printf>
c01081c9:	83 c4 10             	add    $0x10,%esp
c01081cc:	83 ec 0c             	sub    $0xc,%esp
c01081cf:	ff 75 e0             	pushl  -0x20(%ebp)
c01081d2:	e8 93 cb ff ff       	call   c0104d6a <close>
c01081d7:	83 c4 10             	add    $0x10,%esp
c01081da:	6a 00                	push   $0x0
c01081dc:	68 5c bc 10 c0       	push   $0xc010bc5c
c01081e1:	68 57 bc 10 c0       	push   $0xc010bc57
c01081e6:	68 c4 bc 10 c0       	push   $0xc010bcc4
c01081eb:	e8 12 cf ff ff       	call   c0105102 <execl>
c01081f0:	83 c4 10             	add    $0x10,%esp
c01081f3:	eb fe                	jmp    c01081f3 <simple_shell+0x180>
c01081f5:	8b 7d fc             	mov    -0x4(%ebp),%edi
c01081f8:	c9                   	leave  
c01081f9:	c3                   	ret    

c01081fa <test_shell>:
c01081fa:	55                   	push   %ebp
c01081fb:	89 e5                	mov    %esp,%ebp
c01081fd:	83 ec 38             	sub    $0x38,%esp
c0108200:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0108207:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c010820e:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0108214:	83 ec 08             	sub    $0x8,%esp
c0108217:	6a 02                	push   $0x2
c0108219:	8d 45 ea             	lea    -0x16(%ebp),%eax
c010821c:	50                   	push   %eax
c010821d:	e8 ad c8 ff ff       	call   c0104acf <open>
c0108222:	83 c4 10             	add    $0x10,%esp
c0108225:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108228:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c010822f:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0108236:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c010823d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108244:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010824b:	83 ec 0c             	sub    $0xc,%esp
c010824e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108251:	50                   	push   %eax
c0108252:	e8 38 ea ff ff       	call   c0106c8f <untar>
c0108257:	83 c4 10             	add    $0x10,%esp
c010825a:	e8 14 fe ff ff       	call   c0108073 <simple_shell>
c010825f:	90                   	nop
c0108260:	c9                   	leave  
c0108261:	c3                   	ret    

c0108262 <test_exec>:
c0108262:	55                   	push   %ebp
c0108263:	89 e5                	mov    %esp,%ebp
c0108265:	83 ec 38             	sub    $0x38,%esp
c0108268:	83 ec 0c             	sub    $0xc,%esp
c010826b:	68 c0 b5 10 c0       	push   $0xc010b5c0
c0108270:	e8 17 7e ff ff       	call   c010008c <disp_str>
c0108275:	83 c4 10             	add    $0x10,%esp
c0108278:	83 ec 0c             	sub    $0xc,%esp
c010827b:	68 c2 b5 10 c0       	push   $0xc010b5c2
c0108280:	e8 07 7e ff ff       	call   c010008c <disp_str>
c0108285:	83 c4 10             	add    $0x10,%esp
c0108288:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c010828f:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108296:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c010829c:	83 ec 08             	sub    $0x8,%esp
c010829f:	6a 02                	push   $0x2
c01082a1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c01082a4:	50                   	push   %eax
c01082a5:	e8 25 c8 ff ff       	call   c0104acf <open>
c01082aa:	83 c4 10             	add    $0x10,%esp
c01082ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01082b0:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c01082b7:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c01082be:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c01082c5:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c01082cc:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01082d3:	83 ec 0c             	sub    $0xc,%esp
c01082d6:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01082d9:	50                   	push   %eax
c01082da:	e8 b0 e9 ff ff       	call   c0106c8f <untar>
c01082df:	83 c4 10             	add    $0x10,%esp
c01082e2:	83 ec 08             	sub    $0x8,%esp
c01082e5:	6a 00                	push   $0x0
c01082e7:	68 ca bc 10 c0       	push   $0xc010bcca
c01082ec:	68 ce bc 10 c0       	push   $0xc010bcce
c01082f1:	68 5c bc 10 c0       	push   $0xc010bc5c
c01082f6:	68 57 bc 10 c0       	push   $0xc010bc57
c01082fb:	68 c4 bc 10 c0       	push   $0xc010bcc4
c0108300:	e8 fd cd ff ff       	call   c0105102 <execl>
c0108305:	83 c4 20             	add    $0x20,%esp
c0108308:	e8 61 e8 ff ff       	call   c0106b6e <stop_here>
c010830d:	e8 1d cb ff ff       	call   c0104e2f <fork>
c0108312:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108315:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108319:	7e 25                	jle    c0108340 <test_exec+0xde>
c010831b:	83 ec 0c             	sub    $0xc,%esp
c010831e:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0108321:	50                   	push   %eax
c0108322:	e8 95 ca ff ff       	call   c0104dbc <wait>
c0108327:	83 c4 10             	add    $0x10,%esp
c010832a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010832d:	83 ec 08             	sub    $0x8,%esp
c0108330:	50                   	push   %eax
c0108331:	68 d4 bc 10 c0       	push   $0xc010bcd4
c0108336:	e8 b0 01 00 00       	call   c01084eb <Printf>
c010833b:	83 c4 10             	add    $0x10,%esp
c010833e:	eb 33                	jmp    c0108373 <test_exec+0x111>
c0108340:	83 ec 0c             	sub    $0xc,%esp
c0108343:	68 e6 bc 10 c0       	push   $0xc010bce6
c0108348:	e8 9e 01 00 00       	call   c01084eb <Printf>
c010834d:	83 c4 10             	add    $0x10,%esp
c0108350:	83 ec 0c             	sub    $0xc,%esp
c0108353:	6a 00                	push   $0x0
c0108355:	68 ce bc 10 c0       	push   $0xc010bcce
c010835a:	68 5c bc 10 c0       	push   $0xc010bc5c
c010835f:	68 57 bc 10 c0       	push   $0xc010bc57
c0108364:	68 c4 bc 10 c0       	push   $0xc010bcc4
c0108369:	e8 94 cd ff ff       	call   c0105102 <execl>
c010836e:	83 c4 20             	add    $0x20,%esp
c0108371:	eb fe                	jmp    c0108371 <test_exec+0x10f>
c0108373:	c9                   	leave  
c0108374:	c3                   	ret    

c0108375 <INIT>:
c0108375:	55                   	push   %ebp
c0108376:	89 e5                	mov    %esp,%ebp
c0108378:	83 ec 08             	sub    $0x8,%esp
c010837b:	e8 7a fe ff ff       	call   c01081fa <test_shell>
c0108380:	eb fe                	jmp    c0108380 <INIT+0xb>

c0108382 <TestA>:
c0108382:	55                   	push   %ebp
c0108383:	89 e5                	mov    %esp,%ebp
c0108385:	83 ec 08             	sub    $0x8,%esp
c0108388:	83 ec 0c             	sub    $0xc,%esp
c010838b:	6a 05                	push   $0x5
c010838d:	e8 b8 ec ff ff       	call   c010704a <disp_int>
c0108392:	83 c4 10             	add    $0x10,%esp
c0108395:	83 ec 0c             	sub    $0xc,%esp
c0108398:	68 d3 b6 10 c0       	push   $0xc010b6d3
c010839d:	e8 ea 7c ff ff       	call   c010008c <disp_str>
c01083a2:	83 c4 10             	add    $0x10,%esp
c01083a5:	83 ec 0c             	sub    $0xc,%esp
c01083a8:	68 f4 bc 10 c0       	push   $0xc010bcf4
c01083ad:	e8 da 7c ff ff       	call   c010008c <disp_str>
c01083b2:	83 c4 10             	add    $0x10,%esp
c01083b5:	eb fe                	jmp    c01083b5 <TestA+0x33>

c01083b7 <delay>:
c01083b7:	55                   	push   %ebp
c01083b8:	89 e5                	mov    %esp,%ebp
c01083ba:	83 ec 10             	sub    $0x10,%esp
c01083bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01083c4:	eb 2a                	jmp    c01083f0 <delay+0x39>
c01083c6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01083cd:	eb 17                	jmp    c01083e6 <delay+0x2f>
c01083cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01083d6:	eb 04                	jmp    c01083dc <delay+0x25>
c01083d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01083dc:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01083e0:	7e f6                	jle    c01083d8 <delay+0x21>
c01083e2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01083e6:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c01083ea:	7e e3                	jle    c01083cf <delay+0x18>
c01083ec:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01083f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01083f3:	3b 45 08             	cmp    0x8(%ebp),%eax
c01083f6:	7c ce                	jl     c01083c6 <delay+0xf>
c01083f8:	90                   	nop
c01083f9:	c9                   	leave  
c01083fa:	c3                   	ret    

c01083fb <TestB>:
c01083fb:	55                   	push   %ebp
c01083fc:	89 e5                	mov    %esp,%ebp
c01083fe:	83 ec 08             	sub    $0x8,%esp
c0108401:	83 ec 0c             	sub    $0xc,%esp
c0108404:	68 fb bc 10 c0       	push   $0xc010bcfb
c0108409:	e8 7e 7c ff ff       	call   c010008c <disp_str>
c010840e:	83 c4 10             	add    $0x10,%esp
c0108411:	eb fe                	jmp    c0108411 <TestB+0x16>

c0108413 <TestC>:
c0108413:	55                   	push   %ebp
c0108414:	89 e5                	mov    %esp,%ebp
c0108416:	83 ec 18             	sub    $0x18,%esp
c0108419:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108420:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108424:	77 1a                	ja     c0108440 <TestC+0x2d>
c0108426:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010842d:	83 ec 08             	sub    $0x8,%esp
c0108430:	ff 75 f0             	pushl  -0x10(%ebp)
c0108433:	68 fe bc 10 c0       	push   $0xc010bcfe
c0108438:	e8 ae 00 00 00       	call   c01084eb <Printf>
c010843d:	83 c4 10             	add    $0x10,%esp
c0108440:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108444:	eb da                	jmp    c0108420 <TestC+0xd>

c0108446 <sys_get_ticks>:
c0108446:	55                   	push   %ebp
c0108447:	89 e5                	mov    %esp,%ebp
c0108449:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010844e:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108454:	5d                   	pop    %ebp
c0108455:	c3                   	ret    

c0108456 <sys_write>:
c0108456:	55                   	push   %ebp
c0108457:	89 e5                	mov    %esp,%ebp
c0108459:	83 ec 18             	sub    $0x18,%esp
c010845c:	8b 45 10             	mov    0x10(%ebp),%eax
c010845f:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108465:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c010846b:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108470:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108473:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108476:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108479:	8b 45 08             	mov    0x8(%ebp),%eax
c010847c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010847f:	eb 20                	jmp    c01084a1 <sys_write+0x4b>
c0108481:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108484:	0f b6 00             	movzbl (%eax),%eax
c0108487:	0f b6 c0             	movzbl %al,%eax
c010848a:	83 ec 08             	sub    $0x8,%esp
c010848d:	50                   	push   %eax
c010848e:	ff 75 ec             	pushl  -0x14(%ebp)
c0108491:	e8 aa b9 ff ff       	call   c0103e40 <out_char>
c0108496:	83 c4 10             	add    $0x10,%esp
c0108499:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010849d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c01084a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01084a5:	7f da                	jg     c0108481 <sys_write+0x2b>
c01084a7:	90                   	nop
c01084a8:	c9                   	leave  
c01084a9:	c3                   	ret    

c01084aa <milli_delay>:
c01084aa:	55                   	push   %ebp
c01084ab:	89 e5                	mov    %esp,%ebp
c01084ad:	83 ec 18             	sub    $0x18,%esp
c01084b0:	e8 8a 11 00 00       	call   c010963f <get_ticks_ipc>
c01084b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01084b8:	90                   	nop
c01084b9:	e8 81 11 00 00       	call   c010963f <get_ticks_ipc>
c01084be:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01084c1:	89 c1                	mov    %eax,%ecx
c01084c3:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c01084c8:	89 c8                	mov    %ecx,%eax
c01084ca:	f7 ea                	imul   %edx
c01084cc:	c1 fa 05             	sar    $0x5,%edx
c01084cf:	89 c8                	mov    %ecx,%eax
c01084d1:	c1 f8 1f             	sar    $0x1f,%eax
c01084d4:	29 c2                	sub    %eax,%edx
c01084d6:	89 d0                	mov    %edx,%eax
c01084d8:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c01084de:	39 45 08             	cmp    %eax,0x8(%ebp)
c01084e1:	77 d6                	ja     c01084b9 <milli_delay+0xf>
c01084e3:	90                   	nop
c01084e4:	c9                   	leave  
c01084e5:	c3                   	ret    

c01084e6 <TaskSys>:
c01084e6:	55                   	push   %ebp
c01084e7:	89 e5                	mov    %esp,%ebp
c01084e9:	eb fe                	jmp    c01084e9 <TaskSys+0x3>

c01084eb <Printf>:
c01084eb:	55                   	push   %ebp
c01084ec:	89 e5                	mov    %esp,%ebp
c01084ee:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01084f4:	83 ec 04             	sub    $0x4,%esp
c01084f7:	68 00 01 00 00       	push   $0x100
c01084fc:	6a 00                	push   $0x0
c01084fe:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108504:	50                   	push   %eax
c0108505:	e8 61 3c 00 00       	call   c010c16b <Memset>
c010850a:	83 c4 10             	add    $0x10,%esp
c010850d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108510:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108513:	8b 45 08             	mov    0x8(%ebp),%eax
c0108516:	83 ec 04             	sub    $0x4,%esp
c0108519:	ff 75 f4             	pushl  -0xc(%ebp)
c010851c:	50                   	push   %eax
c010851d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108523:	50                   	push   %eax
c0108524:	e8 20 00 00 00       	call   c0108549 <vsprintf>
c0108529:	83 c4 10             	add    $0x10,%esp
c010852c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010852f:	83 ec 04             	sub    $0x4,%esp
c0108532:	ff 75 f0             	pushl  -0x10(%ebp)
c0108535:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010853b:	50                   	push   %eax
c010853c:	6a 00                	push   $0x0
c010853e:	e8 a2 c7 ff ff       	call   c0104ce5 <write>
c0108543:	83 c4 10             	add    $0x10,%esp
c0108546:	90                   	nop
c0108547:	c9                   	leave  
c0108548:	c3                   	ret    

c0108549 <vsprintf>:
c0108549:	55                   	push   %ebp
c010854a:	89 e5                	mov    %esp,%ebp
c010854c:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0108552:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108558:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010855e:	83 ec 04             	sub    $0x4,%esp
c0108561:	6a 40                	push   $0x40
c0108563:	6a 00                	push   $0x0
c0108565:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010856b:	50                   	push   %eax
c010856c:	e8 fa 3b 00 00       	call   c010c16b <Memset>
c0108571:	83 c4 10             	add    $0x10,%esp
c0108574:	8b 45 10             	mov    0x10(%ebp),%eax
c0108577:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010857a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108581:	8b 45 08             	mov    0x8(%ebp),%eax
c0108584:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108587:	e9 53 01 00 00       	jmp    c01086df <vsprintf+0x196>
c010858c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010858f:	0f b6 00             	movzbl (%eax),%eax
c0108592:	3c 25                	cmp    $0x25,%al
c0108594:	74 16                	je     c01085ac <vsprintf+0x63>
c0108596:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108599:	8d 50 01             	lea    0x1(%eax),%edx
c010859c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010859f:	8b 55 0c             	mov    0xc(%ebp),%edx
c01085a2:	0f b6 12             	movzbl (%edx),%edx
c01085a5:	88 10                	mov    %dl,(%eax)
c01085a7:	e9 2f 01 00 00       	jmp    c01086db <vsprintf+0x192>
c01085ac:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01085b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01085b3:	0f b6 00             	movzbl (%eax),%eax
c01085b6:	0f be c0             	movsbl %al,%eax
c01085b9:	83 f8 64             	cmp    $0x64,%eax
c01085bc:	74 26                	je     c01085e4 <vsprintf+0x9b>
c01085be:	83 f8 64             	cmp    $0x64,%eax
c01085c1:	7f 0e                	jg     c01085d1 <vsprintf+0x88>
c01085c3:	83 f8 63             	cmp    $0x63,%eax
c01085c6:	0f 84 f2 00 00 00    	je     c01086be <vsprintf+0x175>
c01085cc:	e9 0a 01 00 00       	jmp    c01086db <vsprintf+0x192>
c01085d1:	83 f8 73             	cmp    $0x73,%eax
c01085d4:	0f 84 b0 00 00 00    	je     c010868a <vsprintf+0x141>
c01085da:	83 f8 78             	cmp    $0x78,%eax
c01085dd:	74 5d                	je     c010863c <vsprintf+0xf3>
c01085df:	e9 f7 00 00 00       	jmp    c01086db <vsprintf+0x192>
c01085e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01085e7:	8b 00                	mov    (%eax),%eax
c01085e9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01085ec:	83 ec 04             	sub    $0x4,%esp
c01085ef:	6a 0a                	push   $0xa
c01085f1:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01085f7:	50                   	push   %eax
c01085f8:	ff 75 e8             	pushl  -0x18(%ebp)
c01085fb:	e8 96 10 00 00       	call   c0109696 <itoa>
c0108600:	83 c4 10             	add    $0x10,%esp
c0108603:	83 ec 08             	sub    $0x8,%esp
c0108606:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c010860c:	50                   	push   %eax
c010860d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108610:	e8 75 3b 00 00       	call   c010c18a <Strcpy>
c0108615:	83 c4 10             	add    $0x10,%esp
c0108618:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010861c:	83 ec 0c             	sub    $0xc,%esp
c010861f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108625:	50                   	push   %eax
c0108626:	e8 79 3b 00 00       	call   c010c1a4 <Strlen>
c010862b:	83 c4 10             	add    $0x10,%esp
c010862e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108631:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108634:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108637:	e9 9f 00 00 00       	jmp    c01086db <vsprintf+0x192>
c010863c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010863f:	8b 00                	mov    (%eax),%eax
c0108641:	83 ec 08             	sub    $0x8,%esp
c0108644:	50                   	push   %eax
c0108645:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010864b:	50                   	push   %eax
c010864c:	e8 53 e9 ff ff       	call   c0106fa4 <atoi>
c0108651:	83 c4 10             	add    $0x10,%esp
c0108654:	83 ec 08             	sub    $0x8,%esp
c0108657:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010865d:	50                   	push   %eax
c010865e:	ff 75 f4             	pushl  -0xc(%ebp)
c0108661:	e8 24 3b 00 00       	call   c010c18a <Strcpy>
c0108666:	83 c4 10             	add    $0x10,%esp
c0108669:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010866d:	83 ec 0c             	sub    $0xc,%esp
c0108670:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108676:	50                   	push   %eax
c0108677:	e8 28 3b 00 00       	call   c010c1a4 <Strlen>
c010867c:	83 c4 10             	add    $0x10,%esp
c010867f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108682:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108685:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108688:	eb 51                	jmp    c01086db <vsprintf+0x192>
c010868a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010868d:	8b 00                	mov    (%eax),%eax
c010868f:	83 ec 08             	sub    $0x8,%esp
c0108692:	50                   	push   %eax
c0108693:	ff 75 f4             	pushl  -0xc(%ebp)
c0108696:	e8 ef 3a 00 00       	call   c010c18a <Strcpy>
c010869b:	83 c4 10             	add    $0x10,%esp
c010869e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086a1:	8b 00                	mov    (%eax),%eax
c01086a3:	83 ec 0c             	sub    $0xc,%esp
c01086a6:	50                   	push   %eax
c01086a7:	e8 f8 3a 00 00       	call   c010c1a4 <Strlen>
c01086ac:	83 c4 10             	add    $0x10,%esp
c01086af:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01086b2:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01086b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01086b9:	01 45 f4             	add    %eax,-0xc(%ebp)
c01086bc:	eb 1d                	jmp    c01086db <vsprintf+0x192>
c01086be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086c1:	0f b6 10             	movzbl (%eax),%edx
c01086c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01086c7:	88 10                	mov    %dl,(%eax)
c01086c9:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01086cd:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01086d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01086d7:	01 45 f4             	add    %eax,-0xc(%ebp)
c01086da:	90                   	nop
c01086db:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01086df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01086e2:	0f b6 00             	movzbl (%eax),%eax
c01086e5:	84 c0                	test   %al,%al
c01086e7:	0f 85 9f fe ff ff    	jne    c010858c <vsprintf+0x43>
c01086ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01086f0:	2b 45 08             	sub    0x8(%ebp),%eax
c01086f3:	c9                   	leave  
c01086f4:	c3                   	ret    

c01086f5 <printx>:
c01086f5:	55                   	push   %ebp
c01086f6:	89 e5                	mov    %esp,%ebp
c01086f8:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01086fe:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108701:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108704:	8b 45 08             	mov    0x8(%ebp),%eax
c0108707:	83 ec 04             	sub    $0x4,%esp
c010870a:	ff 75 f4             	pushl  -0xc(%ebp)
c010870d:	50                   	push   %eax
c010870e:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108714:	50                   	push   %eax
c0108715:	e8 2f fe ff ff       	call   c0108549 <vsprintf>
c010871a:	83 c4 10             	add    $0x10,%esp
c010871d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108720:	83 ec 08             	sub    $0x8,%esp
c0108723:	ff 75 f0             	pushl  -0x10(%ebp)
c0108726:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010872c:	50                   	push   %eax
c010872d:	e8 3e 8e ff ff       	call   c0101570 <write_debug>
c0108732:	83 c4 10             	add    $0x10,%esp
c0108735:	90                   	nop
c0108736:	c9                   	leave  
c0108737:	c3                   	ret    

c0108738 <sys_printx>:
c0108738:	55                   	push   %ebp
c0108739:	89 e5                	mov    %esp,%ebp
c010873b:	83 ec 28             	sub    $0x28,%esp
c010873e:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108743:	85 c0                	test   %eax,%eax
c0108745:	75 15                	jne    c010875c <sys_printx+0x24>
c0108747:	8b 45 10             	mov    0x10(%ebp),%eax
c010874a:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108750:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108753:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010875a:	eb 10                	jmp    c010876c <sys_printx+0x34>
c010875c:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108761:	85 c0                	test   %eax,%eax
c0108763:	74 07                	je     c010876c <sys_printx+0x34>
c0108765:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010876c:	8b 55 08             	mov    0x8(%ebp),%edx
c010876f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108772:	01 d0                	add    %edx,%eax
c0108774:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108777:	8b 45 10             	mov    0x10(%ebp),%eax
c010877a:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108780:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108786:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010878b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010878e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108791:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108794:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108797:	0f b6 00             	movzbl (%eax),%eax
c010879a:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010879d:	eb 3a                	jmp    c01087d9 <sys_printx+0xa1>
c010879f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087a2:	0f b6 00             	movzbl (%eax),%eax
c01087a5:	3c 3b                	cmp    $0x3b,%al
c01087a7:	74 0a                	je     c01087b3 <sys_printx+0x7b>
c01087a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087ac:	0f b6 00             	movzbl (%eax),%eax
c01087af:	3c 3a                	cmp    $0x3a,%al
c01087b1:	75 06                	jne    c01087b9 <sys_printx+0x81>
c01087b3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01087b7:	eb 20                	jmp    c01087d9 <sys_printx+0xa1>
c01087b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087bc:	0f b6 00             	movzbl (%eax),%eax
c01087bf:	0f b6 c0             	movzbl %al,%eax
c01087c2:	83 ec 08             	sub    $0x8,%esp
c01087c5:	50                   	push   %eax
c01087c6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01087c9:	e8 72 b6 ff ff       	call   c0103e40 <out_char>
c01087ce:	83 c4 10             	add    $0x10,%esp
c01087d1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01087d5:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01087d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01087dd:	7f c0                	jg     c010879f <sys_printx+0x67>
c01087df:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c01087e3:	75 10                	jne    c01087f5 <sys_printx+0xbd>
c01087e5:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01087ea:	85 c0                	test   %eax,%eax
c01087ec:	74 13                	je     c0108801 <sys_printx+0xc9>
c01087ee:	e8 1a 7b ff ff       	call   c010030d <disable_int>
c01087f3:	eb 0c                	jmp    c0108801 <sys_printx+0xc9>
c01087f5:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c01087f9:	75 06                	jne    c0108801 <sys_printx+0xc9>
c01087fb:	e8 0d 7b ff ff       	call   c010030d <disable_int>
c0108800:	90                   	nop
c0108801:	90                   	nop
c0108802:	c9                   	leave  
c0108803:	c3                   	ret    

c0108804 <spin>:
c0108804:	55                   	push   %ebp
c0108805:	89 e5                	mov    %esp,%ebp
c0108807:	83 ec 08             	sub    $0x8,%esp
c010880a:	83 ec 0c             	sub    $0xc,%esp
c010880d:	ff 75 08             	pushl  0x8(%ebp)
c0108810:	e8 77 78 ff ff       	call   c010008c <disp_str>
c0108815:	83 c4 10             	add    $0x10,%esp
c0108818:	83 ec 0c             	sub    $0xc,%esp
c010881b:	68 d3 b6 10 c0       	push   $0xc010b6d3
c0108820:	e8 67 78 ff ff       	call   c010008c <disp_str>
c0108825:	83 c4 10             	add    $0x10,%esp
c0108828:	eb fe                	jmp    c0108828 <spin+0x24>

c010882a <panic>:
c010882a:	55                   	push   %ebp
c010882b:	89 e5                	mov    %esp,%ebp
c010882d:	83 ec 08             	sub    $0x8,%esp
c0108830:	83 ec 04             	sub    $0x4,%esp
c0108833:	ff 75 08             	pushl  0x8(%ebp)
c0108836:	6a 3a                	push   $0x3a
c0108838:	68 0b bd 10 c0       	push   $0xc010bd0b
c010883d:	e8 b3 fe ff ff       	call   c01086f5 <printx>
c0108842:	83 c4 10             	add    $0x10,%esp
c0108845:	90                   	nop
c0108846:	c9                   	leave  
c0108847:	c3                   	ret    

c0108848 <assertion_failure>:
c0108848:	55                   	push   %ebp
c0108849:	89 e5                	mov    %esp,%ebp
c010884b:	83 ec 08             	sub    $0x8,%esp
c010884e:	83 ec 08             	sub    $0x8,%esp
c0108851:	ff 75 14             	pushl  0x14(%ebp)
c0108854:	ff 75 10             	pushl  0x10(%ebp)
c0108857:	ff 75 0c             	pushl  0xc(%ebp)
c010885a:	ff 75 08             	pushl  0x8(%ebp)
c010885d:	6a 3b                	push   $0x3b
c010885f:	68 14 bd 10 c0       	push   $0xc010bd14
c0108864:	e8 8c fe ff ff       	call   c01086f5 <printx>
c0108869:	83 c4 20             	add    $0x20,%esp
c010886c:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108873:	00 00 00 
c0108876:	83 ec 0c             	sub    $0xc,%esp
c0108879:	68 c0 b5 10 c0       	push   $0xc010b5c0
c010887e:	e8 09 78 ff ff       	call   c010008c <disp_str>
c0108883:	83 c4 10             	add    $0x10,%esp
c0108886:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c010888b:	83 ec 0c             	sub    $0xc,%esp
c010888e:	50                   	push   %eax
c010888f:	e8 b6 e7 ff ff       	call   c010704a <disp_int>
c0108894:	83 c4 10             	add    $0x10,%esp
c0108897:	83 ec 0c             	sub    $0xc,%esp
c010889a:	68 c2 b5 10 c0       	push   $0xc010b5c2
c010889f:	e8 e8 77 ff ff       	call   c010008c <disp_str>
c01088a4:	83 c4 10             	add    $0x10,%esp
c01088a7:	83 ec 0c             	sub    $0xc,%esp
c01088aa:	68 47 bd 10 c0       	push   $0xc010bd47
c01088af:	e8 50 ff ff ff       	call   c0108804 <spin>
c01088b4:	83 c4 10             	add    $0x10,%esp
c01088b7:	90                   	nop
c01088b8:	c9                   	leave  
c01088b9:	c3                   	ret    

c01088ba <assertion_failure2>:
c01088ba:	55                   	push   %ebp
c01088bb:	89 e5                	mov    %esp,%ebp
c01088bd:	83 ec 08             	sub    $0x8,%esp
c01088c0:	83 ec 04             	sub    $0x4,%esp
c01088c3:	ff 75 18             	pushl  0x18(%ebp)
c01088c6:	ff 75 14             	pushl  0x14(%ebp)
c01088c9:	ff 75 10             	pushl  0x10(%ebp)
c01088cc:	ff 75 0c             	pushl  0xc(%ebp)
c01088cf:	ff 75 08             	pushl  0x8(%ebp)
c01088d2:	6a 3b                	push   $0x3b
c01088d4:	68 54 bd 10 c0       	push   $0xc010bd54
c01088d9:	e8 17 fe ff ff       	call   c01086f5 <printx>
c01088de:	83 c4 20             	add    $0x20,%esp
c01088e1:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01088e8:	00 00 00 
c01088eb:	83 ec 0c             	sub    $0xc,%esp
c01088ee:	68 c0 b5 10 c0       	push   $0xc010b5c0
c01088f3:	e8 94 77 ff ff       	call   c010008c <disp_str>
c01088f8:	83 c4 10             	add    $0x10,%esp
c01088fb:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108900:	83 ec 0c             	sub    $0xc,%esp
c0108903:	50                   	push   %eax
c0108904:	e8 41 e7 ff ff       	call   c010704a <disp_int>
c0108909:	83 c4 10             	add    $0x10,%esp
c010890c:	83 ec 0c             	sub    $0xc,%esp
c010890f:	68 c2 b5 10 c0       	push   $0xc010b5c2
c0108914:	e8 73 77 ff ff       	call   c010008c <disp_str>
c0108919:	83 c4 10             	add    $0x10,%esp
c010891c:	83 ec 0c             	sub    $0xc,%esp
c010891f:	68 47 bd 10 c0       	push   $0xc010bd47
c0108924:	e8 db fe ff ff       	call   c0108804 <spin>
c0108929:	83 c4 10             	add    $0x10,%esp
c010892c:	90                   	nop
c010892d:	c9                   	leave  
c010892e:	c3                   	ret    

c010892f <dead_lock>:
c010892f:	55                   	push   %ebp
c0108930:	89 e5                	mov    %esp,%ebp
c0108932:	b8 00 00 00 00       	mov    $0x0,%eax
c0108937:	5d                   	pop    %ebp
c0108938:	c3                   	ret    

c0108939 <sys_send_msg>:
c0108939:	55                   	push   %ebp
c010893a:	89 e5                	mov    %esp,%ebp
c010893c:	83 ec 58             	sub    $0x58,%esp
c010893f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108946:	83 ec 0c             	sub    $0xc,%esp
c0108949:	ff 75 0c             	pushl  0xc(%ebp)
c010894c:	e8 55 ae ff ff       	call   c01037a6 <pid2proc>
c0108951:	83 c4 10             	add    $0x10,%esp
c0108954:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108957:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010895b:	74 2c                	je     c0108989 <sys_send_msg+0x50>
c010895d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108960:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108966:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c010896b:	74 1c                	je     c0108989 <sys_send_msg+0x50>
c010896d:	68 59 05 00 00       	push   $0x559
c0108972:	68 21 ba 10 c0       	push   $0xc010ba21
c0108977:	68 21 ba 10 c0       	push   $0xc010ba21
c010897c:	68 94 bd 10 c0       	push   $0xc010bd94
c0108981:	e8 c2 fe ff ff       	call   c0108848 <assertion_failure>
c0108986:	83 c4 10             	add    $0x10,%esp
c0108989:	8b 45 10             	mov    0x10(%ebp),%eax
c010898c:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108992:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108997:	74 1c                	je     c01089b5 <sys_send_msg+0x7c>
c0108999:	68 5b 05 00 00       	push   $0x55b
c010899e:	68 21 ba 10 c0       	push   $0xc010ba21
c01089a3:	68 21 ba 10 c0       	push   $0xc010ba21
c01089a8:	68 bc bd 10 c0       	push   $0xc010bdbc
c01089ad:	e8 96 fe ff ff       	call   c0108848 <assertion_failure>
c01089b2:	83 c4 10             	add    $0x10,%esp
c01089b5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01089b9:	75 22                	jne    c01089dd <sys_send_msg+0xa4>
c01089bb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01089bf:	75 1c                	jne    c01089dd <sys_send_msg+0xa4>
c01089c1:	68 5e 05 00 00       	push   $0x55e
c01089c6:	68 21 ba 10 c0       	push   $0xc010ba21
c01089cb:	68 21 ba 10 c0       	push   $0xc010ba21
c01089d0:	68 df bd 10 c0       	push   $0xc010bddf
c01089d5:	e8 6e fe ff ff       	call   c0108848 <assertion_failure>
c01089da:	83 c4 10             	add    $0x10,%esp
c01089dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01089e0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01089e7:	84 c0                	test   %al,%al
c01089e9:	74 65                	je     c0108a50 <sys_send_msg+0x117>
c01089eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01089ee:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01089f5:	3c 01                	cmp    $0x1,%al
c01089f7:	74 57                	je     c0108a50 <sys_send_msg+0x117>
c01089f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01089fc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a03:	3c 02                	cmp    $0x2,%al
c0108a05:	74 49                	je     c0108a50 <sys_send_msg+0x117>
c0108a07:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a0a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a11:	3c 03                	cmp    $0x3,%al
c0108a13:	74 3b                	je     c0108a50 <sys_send_msg+0x117>
c0108a15:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a18:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a1f:	3c 04                	cmp    $0x4,%al
c0108a21:	74 2d                	je     c0108a50 <sys_send_msg+0x117>
c0108a23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a26:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a2d:	0f be c0             	movsbl %al,%eax
c0108a30:	83 ec 0c             	sub    $0xc,%esp
c0108a33:	68 62 05 00 00       	push   $0x562
c0108a38:	68 21 ba 10 c0       	push   $0xc010ba21
c0108a3d:	68 21 ba 10 c0       	push   $0xc010ba21
c0108a42:	50                   	push   %eax
c0108a43:	68 f0 bd 10 c0       	push   $0xc010bdf0
c0108a48:	e8 6d fe ff ff       	call   c01088ba <assertion_failure2>
c0108a4d:	83 c4 20             	add    $0x20,%esp
c0108a50:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a53:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a5a:	84 c0                	test   %al,%al
c0108a5c:	74 65                	je     c0108ac3 <sys_send_msg+0x18a>
c0108a5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a61:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a68:	3c 01                	cmp    $0x1,%al
c0108a6a:	74 57                	je     c0108ac3 <sys_send_msg+0x18a>
c0108a6c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a6f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a76:	3c 02                	cmp    $0x2,%al
c0108a78:	74 49                	je     c0108ac3 <sys_send_msg+0x18a>
c0108a7a:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a7d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a84:	3c 03                	cmp    $0x3,%al
c0108a86:	74 3b                	je     c0108ac3 <sys_send_msg+0x18a>
c0108a88:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a8b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a92:	3c 04                	cmp    $0x4,%al
c0108a94:	74 2d                	je     c0108ac3 <sys_send_msg+0x18a>
c0108a96:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a99:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108aa0:	0f be c0             	movsbl %al,%eax
c0108aa3:	83 ec 0c             	sub    $0xc,%esp
c0108aa6:	68 65 05 00 00       	push   $0x565
c0108aab:	68 21 ba 10 c0       	push   $0xc010ba21
c0108ab0:	68 21 ba 10 c0       	push   $0xc010ba21
c0108ab5:	50                   	push   %eax
c0108ab6:	68 8c be 10 c0       	push   $0xc010be8c
c0108abb:	e8 fa fd ff ff       	call   c01088ba <assertion_failure2>
c0108ac0:	83 c4 20             	add    $0x20,%esp
c0108ac3:	83 ec 0c             	sub    $0xc,%esp
c0108ac6:	ff 75 10             	pushl  0x10(%ebp)
c0108ac9:	e8 5e ad ff ff       	call   c010382c <proc2pid>
c0108ace:	83 c4 10             	add    $0x10,%esp
c0108ad1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108ad4:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108adb:	8b 45 08             	mov    0x8(%ebp),%eax
c0108ade:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108ae1:	83 ec 08             	sub    $0x8,%esp
c0108ae4:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108ae7:	ff 75 dc             	pushl  -0x24(%ebp)
c0108aea:	e8 d3 d3 ff ff       	call   c0105ec2 <get_physical_address_proc>
c0108aef:	83 c4 10             	add    $0x10,%esp
c0108af2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108af5:	83 ec 08             	sub    $0x8,%esp
c0108af8:	ff 75 e0             	pushl  -0x20(%ebp)
c0108afb:	ff 75 d8             	pushl  -0x28(%ebp)
c0108afe:	e8 ec d2 ff ff       	call   c0105def <alloc_virtual_memory>
c0108b03:	83 c4 10             	add    $0x10,%esp
c0108b06:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108b09:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b0c:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108b12:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108b15:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108b1c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108b1f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108b22:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108b25:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108b28:	89 10                	mov    %edx,(%eax)
c0108b2a:	83 ec 08             	sub    $0x8,%esp
c0108b2d:	ff 75 0c             	pushl  0xc(%ebp)
c0108b30:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108b33:	e8 f7 fd ff ff       	call   c010892f <dead_lock>
c0108b38:	83 c4 10             	add    $0x10,%esp
c0108b3b:	83 f8 01             	cmp    $0x1,%eax
c0108b3e:	75 10                	jne    c0108b50 <sys_send_msg+0x217>
c0108b40:	83 ec 0c             	sub    $0xc,%esp
c0108b43:	68 1c bf 10 c0       	push   $0xc010bf1c
c0108b48:	e8 dd fc ff ff       	call   c010882a <panic>
c0108b4d:	83 c4 10             	add    $0x10,%esp
c0108b50:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b53:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b5a:	3c 02                	cmp    $0x2,%al
c0108b5c:	0f 85 ca 01 00 00    	jne    c0108d2c <sys_send_msg+0x3f3>
c0108b62:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b65:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108b6b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108b6e:	74 12                	je     c0108b82 <sys_send_msg+0x249>
c0108b70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b73:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108b79:	83 f8 12             	cmp    $0x12,%eax
c0108b7c:	0f 85 aa 01 00 00    	jne    c0108d2c <sys_send_msg+0x3f3>
c0108b82:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b85:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108b8b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108b8e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b91:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108b97:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108b9a:	83 ec 08             	sub    $0x8,%esp
c0108b9d:	ff 75 0c             	pushl  0xc(%ebp)
c0108ba0:	ff 75 c0             	pushl  -0x40(%ebp)
c0108ba3:	e8 1a d3 ff ff       	call   c0105ec2 <get_physical_address_proc>
c0108ba8:	83 c4 10             	add    $0x10,%esp
c0108bab:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108bae:	83 ec 08             	sub    $0x8,%esp
c0108bb1:	ff 75 e0             	pushl  -0x20(%ebp)
c0108bb4:	ff 75 bc             	pushl  -0x44(%ebp)
c0108bb7:	e8 33 d2 ff ff       	call   c0105def <alloc_virtual_memory>
c0108bbc:	83 c4 10             	add    $0x10,%esp
c0108bbf:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108bc2:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108bc5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108bc8:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108bcb:	83 ec 04             	sub    $0x4,%esp
c0108bce:	51                   	push   %ecx
c0108bcf:	52                   	push   %edx
c0108bd0:	50                   	push   %eax
c0108bd1:	e8 86 e0 ff ff       	call   c0106c5c <Memcpy>
c0108bd6:	83 c4 10             	add    $0x10,%esp
c0108bd9:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108bde:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108be3:	75 0a                	jne    c0108bef <sys_send_msg+0x2b6>
c0108be5:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108bec:	00 00 00 
c0108bef:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bf2:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108bf9:	00 00 00 
c0108bfc:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bff:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108c06:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c09:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108c10:	00 00 00 
c0108c13:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c16:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108c1d:	00 00 00 
c0108c20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c23:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108c2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c2d:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108c34:	00 00 00 
c0108c37:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c3a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108c41:	00 00 00 
c0108c44:	83 ec 0c             	sub    $0xc,%esp
c0108c47:	ff 75 e8             	pushl  -0x18(%ebp)
c0108c4a:	e8 a0 09 00 00       	call   c01095ef <unblock>
c0108c4f:	83 c4 10             	add    $0x10,%esp
c0108c52:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c55:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c5c:	84 c0                	test   %al,%al
c0108c5e:	74 1c                	je     c0108c7c <sys_send_msg+0x343>
c0108c60:	68 9d 05 00 00       	push   $0x59d
c0108c65:	68 21 ba 10 c0       	push   $0xc010ba21
c0108c6a:	68 21 ba 10 c0       	push   $0xc010ba21
c0108c6f:	68 27 bf 10 c0       	push   $0xc010bf27
c0108c74:	e8 cf fb ff ff       	call   c0108848 <assertion_failure>
c0108c79:	83 c4 10             	add    $0x10,%esp
c0108c7c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c7f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108c85:	83 f8 21             	cmp    $0x21,%eax
c0108c88:	74 1c                	je     c0108ca6 <sys_send_msg+0x36d>
c0108c8a:	68 9e 05 00 00       	push   $0x59e
c0108c8f:	68 21 ba 10 c0       	push   $0xc010ba21
c0108c94:	68 21 ba 10 c0       	push   $0xc010ba21
c0108c99:	68 3b bf 10 c0       	push   $0xc010bf3b
c0108c9e:	e8 a5 fb ff ff       	call   c0108848 <assertion_failure>
c0108ca3:	83 c4 10             	add    $0x10,%esp
c0108ca6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ca9:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108caf:	85 c0                	test   %eax,%eax
c0108cb1:	74 1c                	je     c0108ccf <sys_send_msg+0x396>
c0108cb3:	68 a0 05 00 00       	push   $0x5a0
c0108cb8:	68 21 ba 10 c0       	push   $0xc010ba21
c0108cbd:	68 21 ba 10 c0       	push   $0xc010ba21
c0108cc2:	68 58 bf 10 c0       	push   $0xc010bf58
c0108cc7:	e8 7c fb ff ff       	call   c0108848 <assertion_failure>
c0108ccc:	83 c4 10             	add    $0x10,%esp
c0108ccf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cd2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cd9:	84 c0                	test   %al,%al
c0108cdb:	74 1c                	je     c0108cf9 <sys_send_msg+0x3c0>
c0108cdd:	68 a1 05 00 00       	push   $0x5a1
c0108ce2:	68 21 ba 10 c0       	push   $0xc010ba21
c0108ce7:	68 21 ba 10 c0       	push   $0xc010ba21
c0108cec:	68 6d bf 10 c0       	push   $0xc010bf6d
c0108cf1:	e8 52 fb ff ff       	call   c0108848 <assertion_failure>
c0108cf6:	83 c4 10             	add    $0x10,%esp
c0108cf9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cfc:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108d02:	83 f8 21             	cmp    $0x21,%eax
c0108d05:	0f 84 45 01 00 00    	je     c0108e50 <sys_send_msg+0x517>
c0108d0b:	68 a2 05 00 00       	push   $0x5a2
c0108d10:	68 21 ba 10 c0       	push   $0xc010ba21
c0108d15:	68 21 ba 10 c0       	push   $0xc010ba21
c0108d1a:	68 84 bf 10 c0       	push   $0xc010bf84
c0108d1f:	e8 24 fb ff ff       	call   c0108848 <assertion_failure>
c0108d24:	83 c4 10             	add    $0x10,%esp
c0108d27:	e9 24 01 00 00       	jmp    c0108e50 <sys_send_msg+0x517>
c0108d2c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108d33:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d36:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108d39:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d3c:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108d42:	85 c0                	test   %eax,%eax
c0108d44:	75 1b                	jne    c0108d61 <sys_send_msg+0x428>
c0108d46:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d49:	8b 55 10             	mov    0x10(%ebp),%edx
c0108d4c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108d52:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d55:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108d5c:	00 00 00 
c0108d5f:	eb 3f                	jmp    c0108da0 <sys_send_msg+0x467>
c0108d61:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d64:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108d6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108d6d:	eb 12                	jmp    c0108d81 <sys_send_msg+0x448>
c0108d6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108d72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108d75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108d78:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108d7e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108d81:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108d85:	75 e8                	jne    c0108d6f <sys_send_msg+0x436>
c0108d87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108d8a:	8b 55 10             	mov    0x10(%ebp),%edx
c0108d8d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108d93:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d96:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108d9d:	00 00 00 
c0108da0:	8b 45 10             	mov    0x10(%ebp),%eax
c0108da3:	8b 55 08             	mov    0x8(%ebp),%edx
c0108da6:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108dac:	8b 45 10             	mov    0x10(%ebp),%eax
c0108daf:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108db2:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108db8:	8b 45 10             	mov    0x10(%ebp),%eax
c0108dbb:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108dc2:	8b 45 10             	mov    0x10(%ebp),%eax
c0108dc5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dcc:	3c 01                	cmp    $0x1,%al
c0108dce:	74 1c                	je     c0108dec <sys_send_msg+0x4b3>
c0108dd0:	68 c4 05 00 00       	push   $0x5c4
c0108dd5:	68 21 ba 10 c0       	push   $0xc010ba21
c0108dda:	68 21 ba 10 c0       	push   $0xc010ba21
c0108ddf:	68 a8 bf 10 c0       	push   $0xc010bfa8
c0108de4:	e8 5f fa ff ff       	call   c0108848 <assertion_failure>
c0108de9:	83 c4 10             	add    $0x10,%esp
c0108dec:	8b 45 10             	mov    0x10(%ebp),%eax
c0108def:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108df5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108df8:	74 1c                	je     c0108e16 <sys_send_msg+0x4dd>
c0108dfa:	68 c5 05 00 00       	push   $0x5c5
c0108dff:	68 21 ba 10 c0       	push   $0xc010ba21
c0108e04:	68 21 ba 10 c0       	push   $0xc010ba21
c0108e09:	68 c4 bf 10 c0       	push   $0xc010bfc4
c0108e0e:	e8 35 fa ff ff       	call   c0108848 <assertion_failure>
c0108e13:	83 c4 10             	add    $0x10,%esp
c0108e16:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e19:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108e1f:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108e22:	74 1c                	je     c0108e40 <sys_send_msg+0x507>
c0108e24:	68 c6 05 00 00       	push   $0x5c6
c0108e29:	68 21 ba 10 c0       	push   $0xc010ba21
c0108e2e:	68 21 ba 10 c0       	push   $0xc010ba21
c0108e33:	68 e6 bf 10 c0       	push   $0xc010bfe6
c0108e38:	e8 0b fa ff ff       	call   c0108848 <assertion_failure>
c0108e3d:	83 c4 10             	add    $0x10,%esp
c0108e40:	83 ec 0c             	sub    $0xc,%esp
c0108e43:	ff 75 10             	pushl  0x10(%ebp)
c0108e46:	e8 68 07 00 00       	call   c01095b3 <block>
c0108e4b:	83 c4 10             	add    $0x10,%esp
c0108e4e:	eb 01                	jmp    c0108e51 <sys_send_msg+0x518>
c0108e50:	90                   	nop
c0108e51:	b8 00 00 00 00       	mov    $0x0,%eax
c0108e56:	c9                   	leave  
c0108e57:	c3                   	ret    

c0108e58 <sys_receive_msg>:
c0108e58:	55                   	push   %ebp
c0108e59:	89 e5                	mov    %esp,%ebp
c0108e5b:	83 ec 58             	sub    $0x58,%esp
c0108e5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108e65:	83 ec 0c             	sub    $0xc,%esp
c0108e68:	ff 75 0c             	pushl  0xc(%ebp)
c0108e6b:	e8 36 a9 ff ff       	call   c01037a6 <pid2proc>
c0108e70:	83 c4 10             	add    $0x10,%esp
c0108e73:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108e76:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108e7a:	74 2c                	je     c0108ea8 <sys_receive_msg+0x50>
c0108e7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108e7f:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108e85:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108e8a:	74 1c                	je     c0108ea8 <sys_receive_msg+0x50>
c0108e8c:	68 da 05 00 00       	push   $0x5da
c0108e91:	68 21 ba 10 c0       	push   $0xc010ba21
c0108e96:	68 21 ba 10 c0       	push   $0xc010ba21
c0108e9b:	68 bc bd 10 c0       	push   $0xc010bdbc
c0108ea0:	e8 a3 f9 ff ff       	call   c0108848 <assertion_failure>
c0108ea5:	83 c4 10             	add    $0x10,%esp
c0108ea8:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eab:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108eb1:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108eb6:	74 1c                	je     c0108ed4 <sys_receive_msg+0x7c>
c0108eb8:	68 dc 05 00 00       	push   $0x5dc
c0108ebd:	68 21 ba 10 c0       	push   $0xc010ba21
c0108ec2:	68 21 ba 10 c0       	push   $0xc010ba21
c0108ec7:	68 94 bd 10 c0       	push   $0xc010bd94
c0108ecc:	e8 77 f9 ff ff       	call   c0108848 <assertion_failure>
c0108ed1:	83 c4 10             	add    $0x10,%esp
c0108ed4:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ed7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ede:	84 c0                	test   %al,%al
c0108ee0:	74 65                	je     c0108f47 <sys_receive_msg+0xef>
c0108ee2:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ee5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108eec:	3c 01                	cmp    $0x1,%al
c0108eee:	74 57                	je     c0108f47 <sys_receive_msg+0xef>
c0108ef0:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ef3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108efa:	3c 02                	cmp    $0x2,%al
c0108efc:	74 49                	je     c0108f47 <sys_receive_msg+0xef>
c0108efe:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f01:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f08:	3c 03                	cmp    $0x3,%al
c0108f0a:	74 3b                	je     c0108f47 <sys_receive_msg+0xef>
c0108f0c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f0f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f16:	3c 04                	cmp    $0x4,%al
c0108f18:	74 2d                	je     c0108f47 <sys_receive_msg+0xef>
c0108f1a:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f1d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f24:	0f be c0             	movsbl %al,%eax
c0108f27:	83 ec 0c             	sub    $0xc,%esp
c0108f2a:	68 df 05 00 00       	push   $0x5df
c0108f2f:	68 21 ba 10 c0       	push   $0xc010ba21
c0108f34:	68 21 ba 10 c0       	push   $0xc010ba21
c0108f39:	50                   	push   %eax
c0108f3a:	68 f0 bd 10 c0       	push   $0xc010bdf0
c0108f3f:	e8 76 f9 ff ff       	call   c01088ba <assertion_failure2>
c0108f44:	83 c4 20             	add    $0x20,%esp
c0108f47:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108f4b:	74 73                	je     c0108fc0 <sys_receive_msg+0x168>
c0108f4d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f50:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f57:	84 c0                	test   %al,%al
c0108f59:	74 65                	je     c0108fc0 <sys_receive_msg+0x168>
c0108f5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f5e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f65:	3c 01                	cmp    $0x1,%al
c0108f67:	74 57                	je     c0108fc0 <sys_receive_msg+0x168>
c0108f69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f6c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f73:	3c 02                	cmp    $0x2,%al
c0108f75:	74 49                	je     c0108fc0 <sys_receive_msg+0x168>
c0108f77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f7a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f81:	3c 03                	cmp    $0x3,%al
c0108f83:	74 3b                	je     c0108fc0 <sys_receive_msg+0x168>
c0108f85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f88:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f8f:	3c 04                	cmp    $0x4,%al
c0108f91:	74 2d                	je     c0108fc0 <sys_receive_msg+0x168>
c0108f93:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f96:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f9d:	0f be c0             	movsbl %al,%eax
c0108fa0:	83 ec 0c             	sub    $0xc,%esp
c0108fa3:	68 e3 05 00 00       	push   $0x5e3
c0108fa8:	68 21 ba 10 c0       	push   $0xc010ba21
c0108fad:	68 21 ba 10 c0       	push   $0xc010ba21
c0108fb2:	50                   	push   %eax
c0108fb3:	68 8c be 10 c0       	push   $0xc010be8c
c0108fb8:	e8 fd f8 ff ff       	call   c01088ba <assertion_failure2>
c0108fbd:	83 c4 20             	add    $0x20,%esp
c0108fc0:	83 ec 0c             	sub    $0xc,%esp
c0108fc3:	ff 75 10             	pushl  0x10(%ebp)
c0108fc6:	e8 61 a8 ff ff       	call   c010382c <proc2pid>
c0108fcb:	83 c4 10             	add    $0x10,%esp
c0108fce:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108fd1:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0108fd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0108fdb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108fde:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fe1:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0108fe7:	83 ec 08             	sub    $0x8,%esp
c0108fea:	50                   	push   %eax
c0108feb:	ff 75 d8             	pushl  -0x28(%ebp)
c0108fee:	e8 cf ce ff ff       	call   c0105ec2 <get_physical_address_proc>
c0108ff3:	83 c4 10             	add    $0x10,%esp
c0108ff6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108ff9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109000:	8b 45 10             	mov    0x10(%ebp),%eax
c0109003:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109009:	85 c0                	test   %eax,%eax
c010900b:	0f 84 c5 00 00 00    	je     c01090d6 <sys_receive_msg+0x27e>
c0109011:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109015:	74 0d                	je     c0109024 <sys_receive_msg+0x1cc>
c0109017:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010901e:	0f 85 b2 00 00 00    	jne    c01090d6 <sys_receive_msg+0x27e>
c0109024:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c010902b:	83 ec 0c             	sub    $0xc,%esp
c010902e:	ff 75 d0             	pushl  -0x30(%ebp)
c0109031:	e8 76 85 ff ff       	call   c01015ac <sys_malloc>
c0109036:	83 c4 10             	add    $0x10,%esp
c0109039:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010903c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010903f:	83 ec 04             	sub    $0x4,%esp
c0109042:	50                   	push   %eax
c0109043:	6a 00                	push   $0x0
c0109045:	ff 75 cc             	pushl  -0x34(%ebp)
c0109048:	e8 1e 31 00 00       	call   c010c16b <Memset>
c010904d:	83 c4 10             	add    $0x10,%esp
c0109050:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109053:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109059:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010905c:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109063:	83 ec 08             	sub    $0x8,%esp
c0109066:	ff 75 d0             	pushl  -0x30(%ebp)
c0109069:	ff 75 d4             	pushl  -0x2c(%ebp)
c010906c:	e8 7e cd ff ff       	call   c0105def <alloc_virtual_memory>
c0109071:	83 c4 10             	add    $0x10,%esp
c0109074:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0109077:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010907a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010907d:	83 ec 04             	sub    $0x4,%esp
c0109080:	52                   	push   %edx
c0109081:	ff 75 cc             	pushl  -0x34(%ebp)
c0109084:	50                   	push   %eax
c0109085:	e8 d2 db ff ff       	call   c0106c5c <Memcpy>
c010908a:	83 c4 10             	add    $0x10,%esp
c010908d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109090:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109097:	00 00 00 
c010909a:	8b 45 10             	mov    0x10(%ebp),%eax
c010909d:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01090a4:	00 00 00 
c01090a7:	8b 45 10             	mov    0x10(%ebp),%eax
c01090aa:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01090b1:	00 00 00 
c01090b4:	8b 45 10             	mov    0x10(%ebp),%eax
c01090b7:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01090be:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01090c5:	83 ec 08             	sub    $0x8,%esp
c01090c8:	ff 75 d0             	pushl  -0x30(%ebp)
c01090cb:	ff 75 cc             	pushl  -0x34(%ebp)
c01090ce:	e8 ee 84 ff ff       	call   c01015c1 <sys_free>
c01090d3:	83 c4 10             	add    $0x10,%esp
c01090d6:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c01090da:	0f 84 d4 03 00 00    	je     c01094b4 <sys_receive_msg+0x65c>
c01090e0:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01090e4:	75 26                	jne    c010910c <sys_receive_msg+0x2b4>
c01090e6:	8b 45 10             	mov    0x10(%ebp),%eax
c01090e9:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01090ef:	85 c0                	test   %eax,%eax
c01090f1:	0f 84 8a 00 00 00    	je     c0109181 <sys_receive_msg+0x329>
c01090f7:	8b 45 10             	mov    0x10(%ebp),%eax
c01090fa:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109100:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109103:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010910a:	eb 75                	jmp    c0109181 <sys_receive_msg+0x329>
c010910c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109110:	78 6f                	js     c0109181 <sys_receive_msg+0x329>
c0109112:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109116:	7f 69                	jg     c0109181 <sys_receive_msg+0x329>
c0109118:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010911b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109122:	3c 01                	cmp    $0x1,%al
c0109124:	75 5b                	jne    c0109181 <sys_receive_msg+0x329>
c0109126:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109129:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010912f:	83 f8 12             	cmp    $0x12,%eax
c0109132:	74 0e                	je     c0109142 <sys_receive_msg+0x2ea>
c0109134:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109137:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010913d:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0109140:	75 3f                	jne    c0109181 <sys_receive_msg+0x329>
c0109142:	8b 45 10             	mov    0x10(%ebp),%eax
c0109145:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010914b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010914e:	eb 2b                	jmp    c010917b <sys_receive_msg+0x323>
c0109150:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109153:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109156:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109159:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010915f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109162:	39 c2                	cmp    %eax,%edx
c0109164:	75 09                	jne    c010916f <sys_receive_msg+0x317>
c0109166:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010916d:	eb 12                	jmp    c0109181 <sys_receive_msg+0x329>
c010916f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109172:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0109178:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010917b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010917f:	75 cf                	jne    c0109150 <sys_receive_msg+0x2f8>
c0109181:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0109185:	0f 85 4e 02 00 00    	jne    c01093d9 <sys_receive_msg+0x581>
c010918b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010918e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109191:	83 ec 08             	sub    $0x8,%esp
c0109194:	ff 75 dc             	pushl  -0x24(%ebp)
c0109197:	ff 75 d4             	pushl  -0x2c(%ebp)
c010919a:	e8 50 cc ff ff       	call   c0105def <alloc_virtual_memory>
c010919f:	83 c4 10             	add    $0x10,%esp
c01091a2:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01091a5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01091a8:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01091ae:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01091b1:	83 ec 0c             	sub    $0xc,%esp
c01091b4:	ff 75 c4             	pushl  -0x3c(%ebp)
c01091b7:	e8 70 a6 ff ff       	call   c010382c <proc2pid>
c01091bc:	83 c4 10             	add    $0x10,%esp
c01091bf:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01091c2:	83 ec 08             	sub    $0x8,%esp
c01091c5:	ff 75 b8             	pushl  -0x48(%ebp)
c01091c8:	ff 75 bc             	pushl  -0x44(%ebp)
c01091cb:	e8 f2 cc ff ff       	call   c0105ec2 <get_physical_address_proc>
c01091d0:	83 c4 10             	add    $0x10,%esp
c01091d3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01091d6:	83 ec 08             	sub    $0x8,%esp
c01091d9:	ff 75 dc             	pushl  -0x24(%ebp)
c01091dc:	ff 75 b4             	pushl  -0x4c(%ebp)
c01091df:	e8 0b cc ff ff       	call   c0105def <alloc_virtual_memory>
c01091e4:	83 c4 10             	add    $0x10,%esp
c01091e7:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01091ea:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01091ed:	83 ec 04             	sub    $0x4,%esp
c01091f0:	50                   	push   %eax
c01091f1:	ff 75 b0             	pushl  -0x50(%ebp)
c01091f4:	ff 75 c0             	pushl  -0x40(%ebp)
c01091f7:	e8 60 da ff ff       	call   c0106c5c <Memcpy>
c01091fc:	83 c4 10             	add    $0x10,%esp
c01091ff:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0109202:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0109205:	8b 45 10             	mov    0x10(%ebp),%eax
c0109208:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010920e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0109211:	75 21                	jne    c0109234 <sys_receive_msg+0x3dc>
c0109213:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109216:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010921c:	8b 45 10             	mov    0x10(%ebp),%eax
c010921f:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109225:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109228:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010922f:	00 00 00 
c0109232:	eb 1f                	jmp    c0109253 <sys_receive_msg+0x3fb>
c0109234:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109237:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010923d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109240:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109246:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109249:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0109250:	00 00 00 
c0109253:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109256:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010925d:	00 00 00 
c0109260:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109263:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010926a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010926d:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109274:	00 00 00 
c0109277:	8b 45 10             	mov    0x10(%ebp),%eax
c010927a:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0109281:	00 00 00 
c0109284:	8b 45 10             	mov    0x10(%ebp),%eax
c0109287:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010928e:	00 00 00 
c0109291:	8b 45 10             	mov    0x10(%ebp),%eax
c0109294:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010929b:	00 00 00 
c010929e:	83 ec 0c             	sub    $0xc,%esp
c01092a1:	ff 75 c4             	pushl  -0x3c(%ebp)
c01092a4:	e8 46 03 00 00       	call   c01095ef <unblock>
c01092a9:	83 c4 10             	add    $0x10,%esp
c01092ac:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01092af:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01092b5:	85 c0                	test   %eax,%eax
c01092b7:	74 1c                	je     c01092d5 <sys_receive_msg+0x47d>
c01092b9:	68 53 06 00 00       	push   $0x653
c01092be:	68 21 ba 10 c0       	push   $0xc010ba21
c01092c3:	68 21 ba 10 c0       	push   $0xc010ba21
c01092c8:	68 fb bf 10 c0       	push   $0xc010bffb
c01092cd:	e8 76 f5 ff ff       	call   c0108848 <assertion_failure>
c01092d2:	83 c4 10             	add    $0x10,%esp
c01092d5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01092d8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092df:	84 c0                	test   %al,%al
c01092e1:	74 1c                	je     c01092ff <sys_receive_msg+0x4a7>
c01092e3:	68 54 06 00 00       	push   $0x654
c01092e8:	68 21 ba 10 c0       	push   $0xc010ba21
c01092ed:	68 21 ba 10 c0       	push   $0xc010ba21
c01092f2:	68 13 c0 10 c0       	push   $0xc010c013
c01092f7:	e8 4c f5 ff ff       	call   c0108848 <assertion_failure>
c01092fc:	83 c4 10             	add    $0x10,%esp
c01092ff:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109302:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109308:	83 f8 21             	cmp    $0x21,%eax
c010930b:	74 1c                	je     c0109329 <sys_receive_msg+0x4d1>
c010930d:	68 55 06 00 00       	push   $0x655
c0109312:	68 21 ba 10 c0       	push   $0xc010ba21
c0109317:	68 21 ba 10 c0       	push   $0xc010ba21
c010931c:	68 2c c0 10 c0       	push   $0xc010c02c
c0109321:	e8 22 f5 ff ff       	call   c0108848 <assertion_failure>
c0109326:	83 c4 10             	add    $0x10,%esp
c0109329:	8b 45 10             	mov    0x10(%ebp),%eax
c010932c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109332:	85 c0                	test   %eax,%eax
c0109334:	74 1c                	je     c0109352 <sys_receive_msg+0x4fa>
c0109336:	68 57 06 00 00       	push   $0x657
c010933b:	68 21 ba 10 c0       	push   $0xc010ba21
c0109340:	68 21 ba 10 c0       	push   $0xc010ba21
c0109345:	68 58 bf 10 c0       	push   $0xc010bf58
c010934a:	e8 f9 f4 ff ff       	call   c0108848 <assertion_failure>
c010934f:	83 c4 10             	add    $0x10,%esp
c0109352:	8b 45 10             	mov    0x10(%ebp),%eax
c0109355:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010935c:	84 c0                	test   %al,%al
c010935e:	74 1c                	je     c010937c <sys_receive_msg+0x524>
c0109360:	68 58 06 00 00       	push   $0x658
c0109365:	68 21 ba 10 c0       	push   $0xc010ba21
c010936a:	68 21 ba 10 c0       	push   $0xc010ba21
c010936f:	68 6d bf 10 c0       	push   $0xc010bf6d
c0109374:	e8 cf f4 ff ff       	call   c0108848 <assertion_failure>
c0109379:	83 c4 10             	add    $0x10,%esp
c010937c:	8b 45 10             	mov    0x10(%ebp),%eax
c010937f:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109385:	83 f8 21             	cmp    $0x21,%eax
c0109388:	74 1c                	je     c01093a6 <sys_receive_msg+0x54e>
c010938a:	68 59 06 00 00       	push   $0x659
c010938f:	68 21 ba 10 c0       	push   $0xc010ba21
c0109394:	68 21 ba 10 c0       	push   $0xc010ba21
c0109399:	68 84 bf 10 c0       	push   $0xc010bf84
c010939e:	e8 a5 f4 ff ff       	call   c0108848 <assertion_failure>
c01093a3:	83 c4 10             	add    $0x10,%esp
c01093a6:	8b 45 10             	mov    0x10(%ebp),%eax
c01093a9:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01093af:	83 f8 21             	cmp    $0x21,%eax
c01093b2:	0f 84 f5 00 00 00    	je     c01094ad <sys_receive_msg+0x655>
c01093b8:	68 5a 06 00 00       	push   $0x65a
c01093bd:	68 21 ba 10 c0       	push   $0xc010ba21
c01093c2:	68 21 ba 10 c0       	push   $0xc010ba21
c01093c7:	68 50 c0 10 c0       	push   $0xc010c050
c01093cc:	e8 77 f4 ff ff       	call   c0108848 <assertion_failure>
c01093d1:	83 c4 10             	add    $0x10,%esp
c01093d4:	e9 d4 00 00 00       	jmp    c01094ad <sys_receive_msg+0x655>
c01093d9:	8b 45 10             	mov    0x10(%ebp),%eax
c01093dc:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c01093e3:	8b 45 10             	mov    0x10(%ebp),%eax
c01093e6:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01093ed:	3c 02                	cmp    $0x2,%al
c01093ef:	74 1c                	je     c010940d <sys_receive_msg+0x5b5>
c01093f1:	68 5f 06 00 00       	push   $0x65f
c01093f6:	68 21 ba 10 c0       	push   $0xc010ba21
c01093fb:	68 21 ba 10 c0       	push   $0xc010ba21
c0109400:	68 6f c0 10 c0       	push   $0xc010c06f
c0109405:	e8 3e f4 ff ff       	call   c0108848 <assertion_failure>
c010940a:	83 c4 10             	add    $0x10,%esp
c010940d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109410:	8b 55 08             	mov    0x8(%ebp),%edx
c0109413:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109419:	8b 45 10             	mov    0x10(%ebp),%eax
c010941c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109423:	3c 02                	cmp    $0x2,%al
c0109425:	74 1c                	je     c0109443 <sys_receive_msg+0x5eb>
c0109427:	68 61 06 00 00       	push   $0x661
c010942c:	68 21 ba 10 c0       	push   $0xc010ba21
c0109431:	68 21 ba 10 c0       	push   $0xc010ba21
c0109436:	68 6f c0 10 c0       	push   $0xc010c06f
c010943b:	e8 08 f4 ff ff       	call   c0108848 <assertion_failure>
c0109440:	83 c4 10             	add    $0x10,%esp
c0109443:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109447:	75 0f                	jne    c0109458 <sys_receive_msg+0x600>
c0109449:	8b 45 10             	mov    0x10(%ebp),%eax
c010944c:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c0109453:	00 00 00 
c0109456:	eb 0c                	jmp    c0109464 <sys_receive_msg+0x60c>
c0109458:	8b 45 10             	mov    0x10(%ebp),%eax
c010945b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010945e:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0109464:	8b 45 10             	mov    0x10(%ebp),%eax
c0109467:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010946e:	3c 02                	cmp    $0x2,%al
c0109470:	74 2d                	je     c010949f <sys_receive_msg+0x647>
c0109472:	8b 45 10             	mov    0x10(%ebp),%eax
c0109475:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010947c:	0f be c0             	movsbl %al,%eax
c010947f:	83 ec 0c             	sub    $0xc,%esp
c0109482:	68 6c 06 00 00       	push   $0x66c
c0109487:	68 21 ba 10 c0       	push   $0xc010ba21
c010948c:	68 21 ba 10 c0       	push   $0xc010ba21
c0109491:	50                   	push   %eax
c0109492:	68 6f c0 10 c0       	push   $0xc010c06f
c0109497:	e8 1e f4 ff ff       	call   c01088ba <assertion_failure2>
c010949c:	83 c4 20             	add    $0x20,%esp
c010949f:	83 ec 0c             	sub    $0xc,%esp
c01094a2:	ff 75 10             	pushl  0x10(%ebp)
c01094a5:	e8 09 01 00 00       	call   c01095b3 <block>
c01094aa:	83 c4 10             	add    $0x10,%esp
c01094ad:	b8 00 00 00 00       	mov    $0x0,%eax
c01094b2:	eb 02                	jmp    c01094b6 <sys_receive_msg+0x65e>
c01094b4:	90                   	nop
c01094b5:	90                   	nop
c01094b6:	c9                   	leave  
c01094b7:	c3                   	ret    

c01094b8 <send_rec>:
c01094b8:	55                   	push   %ebp
c01094b9:	89 e5                	mov    %esp,%ebp
c01094bb:	83 ec 18             	sub    $0x18,%esp
c01094be:	8b 45 0c             	mov    0xc(%ebp),%eax
c01094c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01094c4:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01094cb:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01094cf:	74 28                	je     c01094f9 <send_rec+0x41>
c01094d1:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01094d5:	74 22                	je     c01094f9 <send_rec+0x41>
c01094d7:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01094db:	74 1c                	je     c01094f9 <send_rec+0x41>
c01094dd:	68 7e 06 00 00       	push   $0x67e
c01094e2:	68 21 ba 10 c0       	push   $0xc010ba21
c01094e7:	68 21 ba 10 c0       	push   $0xc010ba21
c01094ec:	68 90 c0 10 c0       	push   $0xc010c090
c01094f1:	e8 52 f3 ff ff       	call   c0108848 <assertion_failure>
c01094f6:	83 c4 10             	add    $0x10,%esp
c01094f9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01094fd:	75 14                	jne    c0109513 <send_rec+0x5b>
c01094ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109502:	83 ec 04             	sub    $0x4,%esp
c0109505:	50                   	push   %eax
c0109506:	6a 00                	push   $0x0
c0109508:	ff 75 0c             	pushl  0xc(%ebp)
c010950b:	e8 5b 2c 00 00       	call   c010c16b <Memset>
c0109510:	83 c4 10             	add    $0x10,%esp
c0109513:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109517:	74 23                	je     c010953c <send_rec+0x84>
c0109519:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010951d:	74 34                	je     c0109553 <send_rec+0x9b>
c010951f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109523:	75 74                	jne    c0109599 <send_rec+0xe1>
c0109525:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109528:	83 ec 08             	sub    $0x8,%esp
c010952b:	ff 75 10             	pushl  0x10(%ebp)
c010952e:	50                   	push   %eax
c010952f:	e8 4c 80 ff ff       	call   c0101580 <send_msg>
c0109534:	83 c4 10             	add    $0x10,%esp
c0109537:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010953a:	eb 70                	jmp    c01095ac <send_rec+0xf4>
c010953c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010953f:	83 ec 08             	sub    $0x8,%esp
c0109542:	ff 75 10             	pushl  0x10(%ebp)
c0109545:	50                   	push   %eax
c0109546:	e8 4b 80 ff ff       	call   c0101596 <receive_msg>
c010954b:	83 c4 10             	add    $0x10,%esp
c010954e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109551:	eb 59                	jmp    c01095ac <send_rec+0xf4>
c0109553:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109556:	83 ec 08             	sub    $0x8,%esp
c0109559:	ff 75 10             	pushl  0x10(%ebp)
c010955c:	50                   	push   %eax
c010955d:	e8 1e 80 ff ff       	call   c0101580 <send_msg>
c0109562:	83 c4 10             	add    $0x10,%esp
c0109565:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109568:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010956c:	75 3d                	jne    c01095ab <send_rec+0xf3>
c010956e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109571:	83 ec 04             	sub    $0x4,%esp
c0109574:	50                   	push   %eax
c0109575:	6a 00                	push   $0x0
c0109577:	ff 75 0c             	pushl  0xc(%ebp)
c010957a:	e8 ec 2b 00 00       	call   c010c16b <Memset>
c010957f:	83 c4 10             	add    $0x10,%esp
c0109582:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109585:	83 ec 08             	sub    $0x8,%esp
c0109588:	ff 75 10             	pushl  0x10(%ebp)
c010958b:	50                   	push   %eax
c010958c:	e8 05 80 ff ff       	call   c0101596 <receive_msg>
c0109591:	83 c4 10             	add    $0x10,%esp
c0109594:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109597:	eb 12                	jmp    c01095ab <send_rec+0xf3>
c0109599:	83 ec 0c             	sub    $0xc,%esp
c010959c:	68 cc c0 10 c0       	push   $0xc010c0cc
c01095a1:	e8 84 f2 ff ff       	call   c010882a <panic>
c01095a6:	83 c4 10             	add    $0x10,%esp
c01095a9:	eb 01                	jmp    c01095ac <send_rec+0xf4>
c01095ab:	90                   	nop
c01095ac:	b8 00 00 00 00       	mov    $0x0,%eax
c01095b1:	c9                   	leave  
c01095b2:	c3                   	ret    

c01095b3 <block>:
c01095b3:	55                   	push   %ebp
c01095b4:	89 e5                	mov    %esp,%ebp
c01095b6:	83 ec 08             	sub    $0x8,%esp
c01095b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01095bc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01095c3:	84 c0                	test   %al,%al
c01095c5:	75 1c                	jne    c01095e3 <block+0x30>
c01095c7:	68 ad 06 00 00       	push   $0x6ad
c01095cc:	68 21 ba 10 c0       	push   $0xc010ba21
c01095d1:	68 21 ba 10 c0       	push   $0xc010ba21
c01095d6:	68 e1 c0 10 c0       	push   $0xc010c0e1
c01095db:	e8 68 f2 ff ff       	call   c0108848 <assertion_failure>
c01095e0:	83 c4 10             	add    $0x10,%esp
c01095e3:	e8 40 a0 ff ff       	call   c0103628 <schedule_process>
c01095e8:	b8 00 00 00 00       	mov    $0x0,%eax
c01095ed:	c9                   	leave  
c01095ee:	c3                   	ret    

c01095ef <unblock>:
c01095ef:	55                   	push   %ebp
c01095f0:	89 e5                	mov    %esp,%ebp
c01095f2:	83 ec 08             	sub    $0x8,%esp
c01095f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01095f8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01095ff:	84 c0                	test   %al,%al
c0109601:	74 1c                	je     c010961f <unblock+0x30>
c0109603:	68 b6 06 00 00       	push   $0x6b6
c0109608:	68 21 ba 10 c0       	push   $0xc010ba21
c010960d:	68 21 ba 10 c0       	push   $0xc010ba21
c0109612:	68 f9 c0 10 c0       	push   $0xc010c0f9
c0109617:	e8 2c f2 ff ff       	call   c0108848 <assertion_failure>
c010961c:	83 c4 10             	add    $0x10,%esp
c010961f:	8b 45 08             	mov    0x8(%ebp),%eax
c0109622:	05 60 02 00 00       	add    $0x260,%eax
c0109627:	83 ec 08             	sub    $0x8,%esp
c010962a:	50                   	push   %eax
c010962b:	68 ec fd 10 c0       	push   $0xc010fdec
c0109630:	e8 cb 0a 00 00       	call   c010a100 <appendToDoubleLinkList>
c0109635:	83 c4 10             	add    $0x10,%esp
c0109638:	b8 00 00 00 00       	mov    $0x0,%eax
c010963d:	c9                   	leave  
c010963e:	c3                   	ret    

c010963f <get_ticks_ipc>:
c010963f:	55                   	push   %ebp
c0109640:	89 e5                	mov    %esp,%ebp
c0109642:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109648:	83 ec 04             	sub    $0x4,%esp
c010964b:	6a 7c                	push   $0x7c
c010964d:	6a 00                	push   $0x0
c010964f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109655:	50                   	push   %eax
c0109656:	e8 10 2b 00 00       	call   c010c16b <Memset>
c010965b:	83 c4 10             	add    $0x10,%esp
c010965e:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109665:	00 00 00 
c0109668:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010966f:	83 ec 04             	sub    $0x4,%esp
c0109672:	6a 01                	push   $0x1
c0109674:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010967a:	50                   	push   %eax
c010967b:	6a 03                	push   $0x3
c010967d:	e8 36 fe ff ff       	call   c01094b8 <send_rec>
c0109682:	83 c4 10             	add    $0x10,%esp
c0109685:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109688:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010968e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109691:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109694:	c9                   	leave  
c0109695:	c3                   	ret    

c0109696 <itoa>:
c0109696:	55                   	push   %ebp
c0109697:	89 e5                	mov    %esp,%ebp
c0109699:	53                   	push   %ebx
c010969a:	83 ec 14             	sub    $0x14,%esp
c010969d:	8b 45 08             	mov    0x8(%ebp),%eax
c01096a0:	99                   	cltd   
c01096a1:	f7 7d 10             	idivl  0x10(%ebp)
c01096a4:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01096a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01096aa:	99                   	cltd   
c01096ab:	f7 7d 10             	idivl  0x10(%ebp)
c01096ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01096b1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01096b5:	74 14                	je     c01096cb <itoa+0x35>
c01096b7:	83 ec 04             	sub    $0x4,%esp
c01096ba:	ff 75 10             	pushl  0x10(%ebp)
c01096bd:	ff 75 0c             	pushl  0xc(%ebp)
c01096c0:	ff 75 f0             	pushl  -0x10(%ebp)
c01096c3:	e8 ce ff ff ff       	call   c0109696 <itoa>
c01096c8:	83 c4 10             	add    $0x10,%esp
c01096cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096ce:	8d 58 30             	lea    0x30(%eax),%ebx
c01096d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01096d4:	8b 00                	mov    (%eax),%eax
c01096d6:	8d 48 01             	lea    0x1(%eax),%ecx
c01096d9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01096dc:	89 0a                	mov    %ecx,(%edx)
c01096de:	89 da                	mov    %ebx,%edx
c01096e0:	88 10                	mov    %dl,(%eax)
c01096e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01096e5:	8b 00                	mov    (%eax),%eax
c01096e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01096ea:	c9                   	leave  
c01096eb:	c3                   	ret    

c01096ec <i2a>:
c01096ec:	55                   	push   %ebp
c01096ed:	89 e5                	mov    %esp,%ebp
c01096ef:	53                   	push   %ebx
c01096f0:	83 ec 14             	sub    $0x14,%esp
c01096f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01096f6:	99                   	cltd   
c01096f7:	f7 7d 0c             	idivl  0xc(%ebp)
c01096fa:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01096fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0109700:	99                   	cltd   
c0109701:	f7 7d 0c             	idivl  0xc(%ebp)
c0109704:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109707:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010970b:	74 14                	je     c0109721 <i2a+0x35>
c010970d:	83 ec 04             	sub    $0x4,%esp
c0109710:	ff 75 10             	pushl  0x10(%ebp)
c0109713:	ff 75 0c             	pushl  0xc(%ebp)
c0109716:	ff 75 f0             	pushl  -0x10(%ebp)
c0109719:	e8 ce ff ff ff       	call   c01096ec <i2a>
c010971e:	83 c4 10             	add    $0x10,%esp
c0109721:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109725:	7f 0a                	jg     c0109731 <i2a+0x45>
c0109727:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010972a:	83 c0 30             	add    $0x30,%eax
c010972d:	89 c3                	mov    %eax,%ebx
c010972f:	eb 08                	jmp    c0109739 <i2a+0x4d>
c0109731:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109734:	83 c0 37             	add    $0x37,%eax
c0109737:	89 c3                	mov    %eax,%ebx
c0109739:	8b 45 10             	mov    0x10(%ebp),%eax
c010973c:	8b 00                	mov    (%eax),%eax
c010973e:	8d 48 01             	lea    0x1(%eax),%ecx
c0109741:	8b 55 10             	mov    0x10(%ebp),%edx
c0109744:	89 0a                	mov    %ecx,(%edx)
c0109746:	88 18                	mov    %bl,(%eax)
c0109748:	8b 45 10             	mov    0x10(%ebp),%eax
c010974b:	8b 00                	mov    (%eax),%eax
c010974d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109750:	c9                   	leave  
c0109751:	c3                   	ret    

c0109752 <inform_int>:
c0109752:	55                   	push   %ebp
c0109753:	89 e5                	mov    %esp,%ebp
c0109755:	83 ec 18             	sub    $0x18,%esp
c0109758:	83 ec 0c             	sub    $0xc,%esp
c010975b:	ff 75 08             	pushl  0x8(%ebp)
c010975e:	e8 43 a0 ff ff       	call   c01037a6 <pid2proc>
c0109763:	83 c4 10             	add    $0x10,%esp
c0109766:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109769:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010976c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109773:	0f be c0             	movsbl %al,%eax
c0109776:	83 e0 02             	and    $0x2,%eax
c0109779:	85 c0                	test   %eax,%eax
c010977b:	0f 84 8e 00 00 00    	je     c010980f <inform_int+0xbd>
c0109781:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109784:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c010978a:	3d 13 02 00 00       	cmp    $0x213,%eax
c010978f:	74 0e                	je     c010979f <inform_int+0x4d>
c0109791:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109794:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c010979a:	83 f8 12             	cmp    $0x12,%eax
c010979d:	75 7d                	jne    c010981c <inform_int+0xca>
c010979f:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01097a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097a9:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01097af:	83 ec 08             	sub    $0x8,%esp
c01097b2:	ff 75 f0             	pushl  -0x10(%ebp)
c01097b5:	50                   	push   %eax
c01097b6:	e8 34 c6 ff ff       	call   c0105def <alloc_virtual_memory>
c01097bb:	83 c4 10             	add    $0x10,%esp
c01097be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01097c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01097c4:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c01097ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01097cd:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c01097d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097d7:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c01097de:	00 00 00 
c01097e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097e4:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01097eb:	00 00 00 
c01097ee:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01097f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097f8:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01097ff:	83 ec 0c             	sub    $0xc,%esp
c0109802:	ff 75 f4             	pushl  -0xc(%ebp)
c0109805:	e8 e5 fd ff ff       	call   c01095ef <unblock>
c010980a:	83 c4 10             	add    $0x10,%esp
c010980d:	eb 0d                	jmp    c010981c <inform_int+0xca>
c010980f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109812:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109819:	00 00 00 
c010981c:	90                   	nop
c010981d:	c9                   	leave  
c010981e:	c3                   	ret    

c010981f <strcmp>:
c010981f:	55                   	push   %ebp
c0109820:	89 e5                	mov    %esp,%ebp
c0109822:	83 ec 10             	sub    $0x10,%esp
c0109825:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109829:	74 06                	je     c0109831 <strcmp+0x12>
c010982b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010982f:	75 08                	jne    c0109839 <strcmp+0x1a>
c0109831:	8b 45 08             	mov    0x8(%ebp),%eax
c0109834:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109837:	eb 53                	jmp    c010988c <strcmp+0x6d>
c0109839:	8b 45 08             	mov    0x8(%ebp),%eax
c010983c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010983f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109842:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109845:	eb 18                	jmp    c010985f <strcmp+0x40>
c0109847:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010984a:	0f b6 10             	movzbl (%eax),%edx
c010984d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109850:	0f b6 00             	movzbl (%eax),%eax
c0109853:	38 c2                	cmp    %al,%dl
c0109855:	75 1e                	jne    c0109875 <strcmp+0x56>
c0109857:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010985b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010985f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109862:	0f b6 00             	movzbl (%eax),%eax
c0109865:	84 c0                	test   %al,%al
c0109867:	74 0d                	je     c0109876 <strcmp+0x57>
c0109869:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010986c:	0f b6 00             	movzbl (%eax),%eax
c010986f:	84 c0                	test   %al,%al
c0109871:	75 d4                	jne    c0109847 <strcmp+0x28>
c0109873:	eb 01                	jmp    c0109876 <strcmp+0x57>
c0109875:	90                   	nop
c0109876:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109879:	0f b6 00             	movzbl (%eax),%eax
c010987c:	0f be d0             	movsbl %al,%edx
c010987f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109882:	0f b6 00             	movzbl (%eax),%eax
c0109885:	0f be c0             	movsbl %al,%eax
c0109888:	29 c2                	sub    %eax,%edx
c010988a:	89 d0                	mov    %edx,%eax
c010988c:	c9                   	leave  
c010988d:	c3                   	ret    

c010988e <create_user_process_address_space>:
c010988e:	55                   	push   %ebp
c010988f:	89 e5                	mov    %esp,%ebp
c0109891:	83 ec 18             	sub    $0x18,%esp
c0109894:	83 ec 08             	sub    $0x8,%esp
c0109897:	6a 00                	push   $0x0
c0109899:	6a 01                	push   $0x1
c010989b:	e8 87 c8 ff ff       	call   c0106127 <alloc_memory>
c01098a0:	83 c4 10             	add    $0x10,%esp
c01098a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01098a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098a9:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c01098b0:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c01098b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01098ba:	05 ff 0f 00 00       	add    $0xfff,%eax
c01098bf:	c1 e8 0c             	shr    $0xc,%eax
c01098c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01098c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01098c8:	83 c0 07             	add    $0x7,%eax
c01098cb:	c1 e8 03             	shr    $0x3,%eax
c01098ce:	89 c2                	mov    %eax,%edx
c01098d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098d3:	89 50 04             	mov    %edx,0x4(%eax)
c01098d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098d9:	8b 40 04             	mov    0x4(%eax),%eax
c01098dc:	05 ff 0f 00 00       	add    $0xfff,%eax
c01098e1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01098e7:	85 c0                	test   %eax,%eax
c01098e9:	0f 48 c2             	cmovs  %edx,%eax
c01098ec:	c1 f8 0c             	sar    $0xc,%eax
c01098ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01098f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01098f5:	83 ec 08             	sub    $0x8,%esp
c01098f8:	6a 00                	push   $0x0
c01098fa:	50                   	push   %eax
c01098fb:	e8 27 c8 ff ff       	call   c0106127 <alloc_memory>
c0109900:	83 c4 10             	add    $0x10,%esp
c0109903:	89 c2                	mov    %eax,%edx
c0109905:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109908:	89 10                	mov    %edx,(%eax)
c010990a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010990d:	83 ec 0c             	sub    $0xc,%esp
c0109910:	50                   	push   %eax
c0109911:	e8 e3 bf ff ff       	call   c01058f9 <init_bitmap>
c0109916:	83 c4 10             	add    $0x10,%esp
c0109919:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010991c:	c9                   	leave  
c010991d:	c3                   	ret    

c010991e <user_process>:
c010991e:	55                   	push   %ebp
c010991f:	89 e5                	mov    %esp,%ebp
c0109921:	83 ec 38             	sub    $0x38,%esp
c0109924:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c010992b:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109932:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109939:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010993d:	75 0e                	jne    c010994d <user_process+0x2f>
c010993f:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109945:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c010994b:	eb 0c                	jmp    c0109959 <user_process+0x3b>
c010994d:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109953:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109959:	e8 8b 6a ff ff       	call   c01003e9 <get_running_thread_pcb>
c010995e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109961:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109964:	8b 55 14             	mov    0x14(%ebp),%edx
c0109967:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010996d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109970:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109976:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109979:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c010997f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109982:	05 00 10 00 00       	add    $0x1000,%eax
c0109987:	89 c2                	mov    %eax,%edx
c0109989:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010998c:	89 10                	mov    %edx,(%eax)
c010998e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109991:	8b 00                	mov    (%eax),%eax
c0109993:	83 e8 44             	sub    $0x44,%eax
c0109996:	89 c2                	mov    %eax,%edx
c0109998:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010999b:	89 10                	mov    %edx,(%eax)
c010999d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099a0:	8b 00                	mov    (%eax),%eax
c01099a2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01099a5:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c01099a9:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c01099af:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01099b3:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c01099b7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01099bb:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c01099bf:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01099c3:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c01099c7:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c01099cd:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c01099d1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01099d4:	89 50 34             	mov    %edx,0x34(%eax)
c01099d7:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c01099db:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01099de:	89 50 0c             	mov    %edx,0xc(%eax)
c01099e1:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c01099e5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01099e8:	89 50 04             	mov    %edx,0x4(%eax)
c01099eb:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c01099ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01099f2:	89 50 08             	mov    %edx,0x8(%eax)
c01099f5:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c01099f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01099fc:	89 50 40             	mov    %edx,0x40(%eax)
c01099ff:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109a03:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a06:	89 10                	mov    %edx,(%eax)
c0109a08:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a0b:	8b 55 08             	mov    0x8(%ebp),%edx
c0109a0e:	89 50 30             	mov    %edx,0x30(%eax)
c0109a11:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109a15:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a18:	89 50 38             	mov    %edx,0x38(%eax)
c0109a1b:	83 ec 08             	sub    $0x8,%esp
c0109a1e:	6a 01                	push   $0x1
c0109a20:	68 00 f0 ff bf       	push   $0xbffff000
c0109a25:	e8 35 c6 ff ff       	call   c010605f <alloc_physical_memory>
c0109a2a:	83 c4 10             	add    $0x10,%esp
c0109a2d:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109a33:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a36:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109a39:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a3c:	83 ec 0c             	sub    $0xc,%esp
c0109a3f:	50                   	push   %eax
c0109a40:	e8 77 68 ff ff       	call   c01002bc <restart>
c0109a45:	83 c4 10             	add    $0x10,%esp
c0109a48:	90                   	nop
c0109a49:	c9                   	leave  
c0109a4a:	c3                   	ret    

c0109a4b <clone_pcb>:
c0109a4b:	55                   	push   %ebp
c0109a4c:	89 e5                	mov    %esp,%ebp
c0109a4e:	83 ec 38             	sub    $0x38,%esp
c0109a51:	83 ec 08             	sub    $0x8,%esp
c0109a54:	6a 00                	push   $0x0
c0109a56:	6a 01                	push   $0x1
c0109a58:	e8 ca c6 ff ff       	call   c0106127 <alloc_memory>
c0109a5d:	83 c4 10             	add    $0x10,%esp
c0109a60:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109a63:	83 ec 04             	sub    $0x4,%esp
c0109a66:	68 00 10 00 00       	push   $0x1000
c0109a6b:	6a 00                	push   $0x0
c0109a6d:	ff 75 f4             	pushl  -0xc(%ebp)
c0109a70:	e8 f6 26 00 00       	call   c010c16b <Memset>
c0109a75:	83 c4 10             	add    $0x10,%esp
c0109a78:	83 ec 04             	sub    $0x4,%esp
c0109a7b:	68 00 10 00 00       	push   $0x1000
c0109a80:	ff 75 08             	pushl  0x8(%ebp)
c0109a83:	ff 75 f4             	pushl  -0xc(%ebp)
c0109a86:	e8 d1 d1 ff ff       	call   c0106c5c <Memcpy>
c0109a8b:	83 c4 10             	add    $0x10,%esp
c0109a8e:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0109a93:	8d 50 01             	lea    0x1(%eax),%edx
c0109a96:	89 15 c4 06 11 c0    	mov    %edx,0xc01106c4
c0109a9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109a9f:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109aa5:	8b 45 08             	mov    0x8(%ebp),%eax
c0109aa8:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109aae:	89 c2                	mov    %eax,%edx
c0109ab0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ab3:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109ab9:	83 ec 08             	sub    $0x8,%esp
c0109abc:	6a 00                	push   $0x0
c0109abe:	6a 01                	push   $0x1
c0109ac0:	e8 62 c6 ff ff       	call   c0106127 <alloc_memory>
c0109ac5:	83 c4 10             	add    $0x10,%esp
c0109ac8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109acb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ace:	05 00 0c 00 00       	add    $0xc00,%eax
c0109ad3:	83 ec 04             	sub    $0x4,%esp
c0109ad6:	68 00 04 00 00       	push   $0x400
c0109adb:	68 00 fc ff ff       	push   $0xfffffc00
c0109ae0:	50                   	push   %eax
c0109ae1:	e8 76 d1 ff ff       	call   c0106c5c <Memcpy>
c0109ae6:	83 c4 10             	add    $0x10,%esp
c0109ae9:	83 ec 0c             	sub    $0xc,%esp
c0109aec:	ff 75 f0             	pushl  -0x10(%ebp)
c0109aef:	e8 4a c4 ff ff       	call   c0105f3e <get_physical_address>
c0109af4:	83 c4 10             	add    $0x10,%esp
c0109af7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109afa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109afd:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109b02:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109b05:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109b08:	83 c8 07             	or     $0x7,%eax
c0109b0b:	89 c2                	mov    %eax,%edx
c0109b0d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109b10:	89 10                	mov    %edx,(%eax)
c0109b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b15:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109b18:	89 50 08             	mov    %edx,0x8(%eax)
c0109b1b:	e8 6e fd ff ff       	call   c010988e <create_user_process_address_space>
c0109b20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109b23:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109b26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b29:	89 50 0c             	mov    %edx,0xc(%eax)
c0109b2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b2f:	8b 40 0c             	mov    0xc(%eax),%eax
c0109b32:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109b35:	83 ec 04             	sub    $0x4,%esp
c0109b38:	6a 0c                	push   $0xc
c0109b3a:	ff 75 e0             	pushl  -0x20(%ebp)
c0109b3d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109b40:	e8 17 d1 ff ff       	call   c0106c5c <Memcpy>
c0109b45:	83 c4 10             	add    $0x10,%esp
c0109b48:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109b4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109b52:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109b57:	c1 e8 0c             	shr    $0xc,%eax
c0109b5a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109b5d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109b60:	83 c0 07             	add    $0x7,%eax
c0109b63:	c1 e8 03             	shr    $0x3,%eax
c0109b66:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109b69:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109b6c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109b6f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109b72:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109b77:	c1 e8 0c             	shr    $0xc,%eax
c0109b7a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109b7d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109b80:	83 ec 08             	sub    $0x8,%esp
c0109b83:	6a 00                	push   $0x0
c0109b85:	50                   	push   %eax
c0109b86:	e8 9c c5 ff ff       	call   c0106127 <alloc_memory>
c0109b8b:	83 c4 10             	add    $0x10,%esp
c0109b8e:	89 c2                	mov    %eax,%edx
c0109b90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b93:	89 10                	mov    %edx,(%eax)
c0109b95:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109b98:	c1 e0 0c             	shl    $0xc,%eax
c0109b9b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109b9e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ba1:	8b 10                	mov    (%eax),%edx
c0109ba3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ba6:	8b 00                	mov    (%eax),%eax
c0109ba8:	83 ec 04             	sub    $0x4,%esp
c0109bab:	ff 75 cc             	pushl  -0x34(%ebp)
c0109bae:	52                   	push   %edx
c0109baf:	50                   	push   %eax
c0109bb0:	e8 a7 d0 ff ff       	call   c0106c5c <Memcpy>
c0109bb5:	83 c4 10             	add    $0x10,%esp
c0109bb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bbb:	c9                   	leave  
c0109bbc:	c3                   	ret    

c0109bbd <build_body_stack>:
c0109bbd:	55                   	push   %ebp
c0109bbe:	89 e5                	mov    %esp,%ebp
c0109bc0:	83 ec 48             	sub    $0x48,%esp
c0109bc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0109bc6:	8b 40 0c             	mov    0xc(%eax),%eax
c0109bc9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109bcc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109bcf:	8b 50 04             	mov    0x4(%eax),%edx
c0109bd2:	8b 00                	mov    (%eax),%eax
c0109bd4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109bd7:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109bda:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109bdd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109be0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109be3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109be6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109be9:	8b 40 08             	mov    0x8(%eax),%eax
c0109bec:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109bef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109bf6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109bfd:	e8 f6 cf ff ff       	call   c0106bf8 <intr_disable>
c0109c02:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109c05:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109c0c:	e9 c2 00 00 00       	jmp    c0109cd3 <build_body_stack+0x116>
c0109c11:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109c14:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c17:	01 d0                	add    %edx,%eax
c0109c19:	0f b6 00             	movzbl (%eax),%eax
c0109c1c:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109c1f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109c26:	e9 9a 00 00 00       	jmp    c0109cc5 <build_body_stack+0x108>
c0109c2b:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109c2f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109c32:	89 c1                	mov    %eax,%ecx
c0109c34:	d3 fa                	sar    %cl,%edx
c0109c36:	89 d0                	mov    %edx,%eax
c0109c38:	83 e0 01             	and    $0x1,%eax
c0109c3b:	85 c0                	test   %eax,%eax
c0109c3d:	75 06                	jne    c0109c45 <build_body_stack+0x88>
c0109c3f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109c43:	eb 7c                	jmp    c0109cc1 <build_body_stack+0x104>
c0109c45:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c48:	8b 40 08             	mov    0x8(%eax),%eax
c0109c4b:	83 ec 0c             	sub    $0xc,%esp
c0109c4e:	50                   	push   %eax
c0109c4f:	e8 79 67 ff ff       	call   c01003cd <update_cr3>
c0109c54:	83 c4 10             	add    $0x10,%esp
c0109c57:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c5a:	c1 e0 0c             	shl    $0xc,%eax
c0109c5d:	89 c2                	mov    %eax,%edx
c0109c5f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109c62:	01 d0                	add    %edx,%eax
c0109c64:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109c67:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109c6a:	8b 45 10             	mov    0x10(%ebp),%eax
c0109c6d:	83 ec 04             	sub    $0x4,%esp
c0109c70:	68 00 10 00 00       	push   $0x1000
c0109c75:	52                   	push   %edx
c0109c76:	50                   	push   %eax
c0109c77:	e8 e0 cf ff ff       	call   c0106c5c <Memcpy>
c0109c7c:	83 c4 10             	add    $0x10,%esp
c0109c7f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109c82:	8b 40 08             	mov    0x8(%eax),%eax
c0109c85:	83 ec 0c             	sub    $0xc,%esp
c0109c88:	50                   	push   %eax
c0109c89:	e8 3f 67 ff ff       	call   c01003cd <update_cr3>
c0109c8e:	83 c4 10             	add    $0x10,%esp
c0109c91:	83 ec 08             	sub    $0x8,%esp
c0109c94:	ff 75 cc             	pushl  -0x34(%ebp)
c0109c97:	6a 01                	push   $0x1
c0109c99:	e8 eb c4 ff ff       	call   c0106189 <get_a_virtual_page>
c0109c9e:	83 c4 10             	add    $0x10,%esp
c0109ca1:	8b 55 10             	mov    0x10(%ebp),%edx
c0109ca4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109ca7:	83 ec 04             	sub    $0x4,%esp
c0109caa:	68 00 10 00 00       	push   $0x1000
c0109caf:	52                   	push   %edx
c0109cb0:	50                   	push   %eax
c0109cb1:	e8 a6 cf ff ff       	call   c0106c5c <Memcpy>
c0109cb6:	83 c4 10             	add    $0x10,%esp
c0109cb9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109cbd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109cc1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109cc5:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109cc9:	0f 8e 5c ff ff ff    	jle    c0109c2b <build_body_stack+0x6e>
c0109ccf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109cd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109cd6:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109cd9:	0f 87 32 ff ff ff    	ja     c0109c11 <build_body_stack+0x54>
c0109cdf:	83 ec 0c             	sub    $0xc,%esp
c0109ce2:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109ce5:	e8 37 cf ff ff       	call   c0106c21 <intr_set_status>
c0109cea:	83 c4 10             	add    $0x10,%esp
c0109ced:	90                   	nop
c0109cee:	c9                   	leave  
c0109cef:	c3                   	ret    

c0109cf0 <build_process_kernel_stack>:
c0109cf0:	55                   	push   %ebp
c0109cf1:	89 e5                	mov    %esp,%ebp
c0109cf3:	83 ec 28             	sub    $0x28,%esp
c0109cf6:	e8 fd ce ff ff       	call   c0106bf8 <intr_disable>
c0109cfb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109cfe:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d01:	05 00 10 00 00       	add    $0x1000,%eax
c0109d06:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109d09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d0c:	8b 00                	mov    (%eax),%eax
c0109d0e:	83 f8 38             	cmp    $0x38,%eax
c0109d11:	74 06                	je     c0109d19 <build_process_kernel_stack+0x29>
c0109d13:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109d17:	eb f0                	jmp    c0109d09 <build_process_kernel_stack+0x19>
c0109d19:	90                   	nop
c0109d1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d1d:	05 00 10 00 00       	add    $0x1000,%eax
c0109d22:	89 c2                	mov    %eax,%edx
c0109d24:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d27:	89 50 04             	mov    %edx,0x4(%eax)
c0109d2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d2d:	83 c0 2c             	add    $0x2c,%eax
c0109d30:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109d33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d36:	83 e8 04             	sub    $0x4,%eax
c0109d39:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109d3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d3f:	83 e8 08             	sub    $0x8,%eax
c0109d42:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109d45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d48:	83 e8 0c             	sub    $0xc,%eax
c0109d4b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109d4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d51:	83 e8 10             	sub    $0x10,%eax
c0109d54:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109d57:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d5a:	83 e8 14             	sub    $0x14,%eax
c0109d5d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109d60:	ba ad 02 10 c0       	mov    $0xc01002ad,%edx
c0109d65:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109d68:	89 10                	mov    %edx,(%eax)
c0109d6a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109d6d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109d73:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109d76:	8b 10                	mov    (%eax),%edx
c0109d78:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109d7b:	89 10                	mov    %edx,(%eax)
c0109d7d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109d80:	8b 10                	mov    (%eax),%edx
c0109d82:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d85:	89 10                	mov    %edx,(%eax)
c0109d87:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d8a:	8b 10                	mov    (%eax),%edx
c0109d8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d8f:	89 10                	mov    %edx,(%eax)
c0109d91:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109d94:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109d9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d9d:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109da0:	89 10                	mov    %edx,(%eax)
c0109da2:	83 ec 0c             	sub    $0xc,%esp
c0109da5:	ff 75 f0             	pushl  -0x10(%ebp)
c0109da8:	e8 74 ce ff ff       	call   c0106c21 <intr_set_status>
c0109dad:	83 c4 10             	add    $0x10,%esp
c0109db0:	90                   	nop
c0109db1:	c9                   	leave  
c0109db2:	c3                   	ret    

c0109db3 <fork_process>:
c0109db3:	55                   	push   %ebp
c0109db4:	89 e5                	mov    %esp,%ebp
c0109db6:	83 ec 18             	sub    $0x18,%esp
c0109db9:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dbc:	83 ec 0c             	sub    $0xc,%esp
c0109dbf:	50                   	push   %eax
c0109dc0:	e8 e1 99 ff ff       	call   c01037a6 <pid2proc>
c0109dc5:	83 c4 10             	add    $0x10,%esp
c0109dc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109dcb:	83 ec 0c             	sub    $0xc,%esp
c0109dce:	ff 75 f4             	pushl  -0xc(%ebp)
c0109dd1:	e8 75 fc ff ff       	call   c0109a4b <clone_pcb>
c0109dd6:	83 c4 10             	add    $0x10,%esp
c0109dd9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109ddc:	83 ec 08             	sub    $0x8,%esp
c0109ddf:	6a 00                	push   $0x0
c0109de1:	6a 01                	push   $0x1
c0109de3:	e8 3f c3 ff ff       	call   c0106127 <alloc_memory>
c0109de8:	83 c4 10             	add    $0x10,%esp
c0109deb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109dee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109df1:	83 ec 04             	sub    $0x4,%esp
c0109df4:	68 00 10 00 00       	push   $0x1000
c0109df9:	6a 00                	push   $0x0
c0109dfb:	50                   	push   %eax
c0109dfc:	e8 6a 23 00 00       	call   c010c16b <Memset>
c0109e01:	83 c4 10             	add    $0x10,%esp
c0109e04:	83 ec 04             	sub    $0x4,%esp
c0109e07:	ff 75 ec             	pushl  -0x14(%ebp)
c0109e0a:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e0d:	ff 75 f4             	pushl  -0xc(%ebp)
c0109e10:	e8 a8 fd ff ff       	call   c0109bbd <build_body_stack>
c0109e15:	83 c4 10             	add    $0x10,%esp
c0109e18:	83 ec 0c             	sub    $0xc,%esp
c0109e1b:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e1e:	e8 cd fe ff ff       	call   c0109cf0 <build_process_kernel_stack>
c0109e23:	83 c4 10             	add    $0x10,%esp
c0109e26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e29:	05 6a 02 00 00       	add    $0x26a,%eax
c0109e2e:	83 ec 08             	sub    $0x8,%esp
c0109e31:	50                   	push   %eax
c0109e32:	68 04 0f 11 c0       	push   $0xc0110f04
c0109e37:	e8 c4 02 00 00       	call   c010a100 <appendToDoubleLinkList>
c0109e3c:	83 c4 10             	add    $0x10,%esp
c0109e3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e42:	c9                   	leave  
c0109e43:	c3                   	ret    

c0109e44 <process_execute>:
c0109e44:	55                   	push   %ebp
c0109e45:	89 e5                	mov    %esp,%ebp
c0109e47:	83 ec 28             	sub    $0x28,%esp
c0109e4a:	e8 c7 04 00 00       	call   c010a316 <thread_init>
c0109e4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e52:	83 ec 0c             	sub    $0xc,%esp
c0109e55:	ff 75 f4             	pushl  -0xc(%ebp)
c0109e58:	e8 66 05 00 00       	call   c010a3c3 <thread_create>
c0109e5d:	83 c4 10             	add    $0x10,%esp
c0109e60:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e63:	05 28 01 00 00       	add    $0x128,%eax
c0109e68:	83 ec 08             	sub    $0x8,%esp
c0109e6b:	ff 75 10             	pushl  0x10(%ebp)
c0109e6e:	50                   	push   %eax
c0109e6f:	e8 16 23 00 00       	call   c010c18a <Strcpy>
c0109e74:	83 c4 10             	add    $0x10,%esp
c0109e77:	83 ec 08             	sub    $0x8,%esp
c0109e7a:	6a 00                	push   $0x0
c0109e7c:	6a 01                	push   $0x1
c0109e7e:	e8 a4 c2 ff ff       	call   c0106127 <alloc_memory>
c0109e83:	83 c4 10             	add    $0x10,%esp
c0109e86:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109e89:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e8c:	05 00 0c 00 00       	add    $0xc00,%eax
c0109e91:	83 ec 04             	sub    $0x4,%esp
c0109e94:	68 00 04 00 00       	push   $0x400
c0109e99:	68 00 fc ff ff       	push   $0xfffffc00
c0109e9e:	50                   	push   %eax
c0109e9f:	e8 b8 cd ff ff       	call   c0106c5c <Memcpy>
c0109ea4:	83 c4 10             	add    $0x10,%esp
c0109ea7:	83 ec 0c             	sub    $0xc,%esp
c0109eaa:	ff 75 f0             	pushl  -0x10(%ebp)
c0109ead:	e8 8c c0 ff ff       	call   c0105f3e <get_physical_address>
c0109eb2:	83 c4 10             	add    $0x10,%esp
c0109eb5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109eb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ebb:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109ec0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109ec3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109ec6:	83 c8 07             	or     $0x7,%eax
c0109ec9:	89 c2                	mov    %eax,%edx
c0109ecb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109ece:	89 10                	mov    %edx,(%eax)
c0109ed0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ed3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109ed6:	89 50 08             	mov    %edx,0x8(%eax)
c0109ed9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109edc:	83 c0 10             	add    $0x10,%eax
c0109edf:	83 ec 0c             	sub    $0xc,%esp
c0109ee2:	50                   	push   %eax
c0109ee3:	e8 f5 c7 ff ff       	call   c01066dd <init_memory_block_desc>
c0109ee8:	83 c4 10             	add    $0x10,%esp
c0109eeb:	e8 9e f9 ff ff       	call   c010988e <create_user_process_address_space>
c0109ef0:	89 c2                	mov    %eax,%edx
c0109ef2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ef5:	89 50 0c             	mov    %edx,0xc(%eax)
c0109ef8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109efb:	8b 00                	mov    (%eax),%eax
c0109efd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109f00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f03:	c7 40 10 1e 99 10 c0 	movl   $0xc010991e,0x10(%eax)
c0109f0a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f0d:	8b 55 08             	mov    0x8(%ebp),%edx
c0109f10:	89 50 18             	mov    %edx,0x18(%eax)
c0109f13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f16:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109f19:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109f1c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f1f:	8b 55 14             	mov    0x14(%ebp),%edx
c0109f22:	89 50 20             	mov    %edx,0x20(%eax)
c0109f25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f28:	8b 55 18             	mov    0x18(%ebp),%edx
c0109f2b:	89 50 24             	mov    %edx,0x24(%eax)
c0109f2e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109f31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f34:	89 50 28             	mov    %edx,0x28(%eax)
c0109f37:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f3a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109f40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f43:	8b 10                	mov    (%eax),%edx
c0109f45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f48:	89 50 04             	mov    %edx,0x4(%eax)
c0109f4b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f4e:	8b 50 04             	mov    0x4(%eax),%edx
c0109f51:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f54:	89 50 08             	mov    %edx,0x8(%eax)
c0109f57:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f5a:	8b 50 08             	mov    0x8(%eax),%edx
c0109f5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f60:	89 50 0c             	mov    %edx,0xc(%eax)
c0109f63:	83 ec 0c             	sub    $0xc,%esp
c0109f66:	68 ec fd 10 c0       	push   $0xc010fdec
c0109f6b:	e8 93 00 00 00       	call   c010a003 <isListEmpty>
c0109f70:	83 c4 10             	add    $0x10,%esp
c0109f73:	e8 80 cc ff ff       	call   c0106bf8 <intr_disable>
c0109f78:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109f7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f7e:	05 60 02 00 00       	add    $0x260,%eax
c0109f83:	83 ec 08             	sub    $0x8,%esp
c0109f86:	50                   	push   %eax
c0109f87:	68 ec fd 10 c0       	push   $0xc010fdec
c0109f8c:	e8 6f 01 00 00       	call   c010a100 <appendToDoubleLinkList>
c0109f91:	83 c4 10             	add    $0x10,%esp
c0109f94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f97:	05 6a 02 00 00       	add    $0x26a,%eax
c0109f9c:	83 ec 08             	sub    $0x8,%esp
c0109f9f:	50                   	push   %eax
c0109fa0:	68 04 0f 11 c0       	push   $0xc0110f04
c0109fa5:	e8 56 01 00 00       	call   c010a100 <appendToDoubleLinkList>
c0109faa:	83 c4 10             	add    $0x10,%esp
c0109fad:	83 ec 0c             	sub    $0xc,%esp
c0109fb0:	ff 75 e0             	pushl  -0x20(%ebp)
c0109fb3:	e8 69 cc ff ff       	call   c0106c21 <intr_set_status>
c0109fb8:	83 c4 10             	add    $0x10,%esp
c0109fbb:	90                   	nop
c0109fbc:	c9                   	leave  
c0109fbd:	c3                   	ret    
c0109fbe:	66 90                	xchg   %ax,%ax

c0109fc0 <switch_to>:
c0109fc0:	56                   	push   %esi
c0109fc1:	57                   	push   %edi
c0109fc2:	53                   	push   %ebx
c0109fc3:	55                   	push   %ebp
c0109fc4:	89 e5                	mov    %esp,%ebp
c0109fc6:	8b 45 14             	mov    0x14(%ebp),%eax
c0109fc9:	89 20                	mov    %esp,(%eax)
c0109fcb:	8b 45 18             	mov    0x18(%ebp),%eax
c0109fce:	8b 20                	mov    (%eax),%esp
c0109fd0:	5d                   	pop    %ebp
c0109fd1:	5b                   	pop    %ebx
c0109fd2:	5f                   	pop    %edi
c0109fd3:	5e                   	pop    %esi
c0109fd4:	c3                   	ret    

c0109fd5 <initDoubleLinkList>:
c0109fd5:	55                   	push   %ebp
c0109fd6:	89 e5                	mov    %esp,%ebp
c0109fd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0109fdb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109fe1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109fe4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0109feb:	8b 45 08             	mov    0x8(%ebp),%eax
c0109fee:	8d 50 08             	lea    0x8(%eax),%edx
c0109ff1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ff4:	89 50 04             	mov    %edx,0x4(%eax)
c0109ff7:	8b 55 08             	mov    0x8(%ebp),%edx
c0109ffa:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ffd:	89 50 08             	mov    %edx,0x8(%eax)
c010a000:	90                   	nop
c010a001:	5d                   	pop    %ebp
c010a002:	c3                   	ret    

c010a003 <isListEmpty>:
c010a003:	55                   	push   %ebp
c010a004:	89 e5                	mov    %esp,%ebp
c010a006:	8b 45 08             	mov    0x8(%ebp),%eax
c010a009:	8b 40 04             	mov    0x4(%eax),%eax
c010a00c:	8b 55 08             	mov    0x8(%ebp),%edx
c010a00f:	83 c2 08             	add    $0x8,%edx
c010a012:	39 d0                	cmp    %edx,%eax
c010a014:	75 07                	jne    c010a01d <isListEmpty+0x1a>
c010a016:	b8 01 00 00 00       	mov    $0x1,%eax
c010a01b:	eb 05                	jmp    c010a022 <isListEmpty+0x1f>
c010a01d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a022:	5d                   	pop    %ebp
c010a023:	c3                   	ret    

c010a024 <findElementInList>:
c010a024:	55                   	push   %ebp
c010a025:	89 e5                	mov    %esp,%ebp
c010a027:	83 ec 28             	sub    $0x28,%esp
c010a02a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a02e:	75 19                	jne    c010a049 <findElementInList+0x25>
c010a030:	6a 60                	push   $0x60
c010a032:	68 11 c1 10 c0       	push   $0xc010c111
c010a037:	68 11 c1 10 c0       	push   $0xc010c111
c010a03c:	68 24 c1 10 c0       	push   $0xc010c124
c010a041:	e8 02 e8 ff ff       	call   c0108848 <assertion_failure>
c010a046:	83 c4 10             	add    $0x10,%esp
c010a049:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a04d:	75 19                	jne    c010a068 <findElementInList+0x44>
c010a04f:	6a 61                	push   $0x61
c010a051:	68 11 c1 10 c0       	push   $0xc010c111
c010a056:	68 11 c1 10 c0       	push   $0xc010c111
c010a05b:	68 30 c1 10 c0       	push   $0xc010c130
c010a060:	e8 e3 e7 ff ff       	call   c0108848 <assertion_failure>
c010a065:	83 c4 10             	add    $0x10,%esp
c010a068:	e8 8b cb ff ff       	call   c0106bf8 <intr_disable>
c010a06d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a070:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a077:	8b 45 08             	mov    0x8(%ebp),%eax
c010a07a:	8b 40 08             	mov    0x8(%eax),%eax
c010a07d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a080:	8b 45 08             	mov    0x8(%ebp),%eax
c010a083:	8b 40 04             	mov    0x4(%eax),%eax
c010a086:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a089:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a08d:	75 07                	jne    c010a096 <findElementInList+0x72>
c010a08f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a094:	eb 68                	jmp    c010a0fe <findElementInList+0xda>
c010a096:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a099:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a09c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a09f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a0a2:	c1 f8 03             	sar    $0x3,%eax
c010a0a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a0a8:	eb 36                	jmp    c010a0e0 <findElementInList+0xbc>
c010a0aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0ad:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a0b0:	75 07                	jne    c010a0b9 <findElementInList+0x95>
c010a0b2:	b8 01 00 00 00       	mov    $0x1,%eax
c010a0b7:	eb 45                	jmp    c010a0fe <findElementInList+0xda>
c010a0b9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a0bd:	75 07                	jne    c010a0c6 <findElementInList+0xa2>
c010a0bf:	b8 00 00 00 00       	mov    $0x0,%eax
c010a0c4:	eb 38                	jmp    c010a0fe <findElementInList+0xda>
c010a0c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a0c9:	8b 40 04             	mov    0x4(%eax),%eax
c010a0cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a0cf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a0d3:	75 07                	jne    c010a0dc <findElementInList+0xb8>
c010a0d5:	b8 00 00 00 00       	mov    $0x0,%eax
c010a0da:	eb 22                	jmp    c010a0fe <findElementInList+0xda>
c010a0dc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a0e0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0e3:	83 c0 08             	add    $0x8,%eax
c010a0e6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a0e9:	75 bf                	jne    c010a0aa <findElementInList+0x86>
c010a0eb:	83 ec 0c             	sub    $0xc,%esp
c010a0ee:	ff 75 ec             	pushl  -0x14(%ebp)
c010a0f1:	e8 2b cb ff ff       	call   c0106c21 <intr_set_status>
c010a0f6:	83 c4 10             	add    $0x10,%esp
c010a0f9:	b8 00 00 00 00       	mov    $0x0,%eax
c010a0fe:	c9                   	leave  
c010a0ff:	c3                   	ret    

c010a100 <appendToDoubleLinkList>:
c010a100:	55                   	push   %ebp
c010a101:	89 e5                	mov    %esp,%ebp
c010a103:	83 ec 18             	sub    $0x18,%esp
c010a106:	83 ec 08             	sub    $0x8,%esp
c010a109:	ff 75 0c             	pushl  0xc(%ebp)
c010a10c:	ff 75 08             	pushl  0x8(%ebp)
c010a10f:	e8 10 ff ff ff       	call   c010a024 <findElementInList>
c010a114:	83 c4 10             	add    $0x10,%esp
c010a117:	3c 01                	cmp    $0x1,%al
c010a119:	0f 84 c2 00 00 00    	je     c010a1e1 <appendToDoubleLinkList+0xe1>
c010a11f:	e8 d4 ca ff ff       	call   c0106bf8 <intr_disable>
c010a124:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a127:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a12b:	75 1c                	jne    c010a149 <appendToDoubleLinkList+0x49>
c010a12d:	68 9e 00 00 00       	push   $0x9e
c010a132:	68 11 c1 10 c0       	push   $0xc010c111
c010a137:	68 11 c1 10 c0       	push   $0xc010c111
c010a13c:	68 24 c1 10 c0       	push   $0xc010c124
c010a141:	e8 02 e7 ff ff       	call   c0108848 <assertion_failure>
c010a146:	83 c4 10             	add    $0x10,%esp
c010a149:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a14d:	75 1c                	jne    c010a16b <appendToDoubleLinkList+0x6b>
c010a14f:	68 9f 00 00 00       	push   $0x9f
c010a154:	68 11 c1 10 c0       	push   $0xc010c111
c010a159:	68 11 c1 10 c0       	push   $0xc010c111
c010a15e:	68 30 c1 10 c0       	push   $0xc010c130
c010a163:	e8 e0 e6 ff ff       	call   c0108848 <assertion_failure>
c010a168:	83 c4 10             	add    $0x10,%esp
c010a16b:	83 ec 08             	sub    $0x8,%esp
c010a16e:	ff 75 0c             	pushl  0xc(%ebp)
c010a171:	ff 75 08             	pushl  0x8(%ebp)
c010a174:	e8 ab fe ff ff       	call   c010a024 <findElementInList>
c010a179:	83 c4 10             	add    $0x10,%esp
c010a17c:	3c 01                	cmp    $0x1,%al
c010a17e:	74 64                	je     c010a1e4 <appendToDoubleLinkList+0xe4>
c010a180:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a183:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a186:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a189:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a190:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a193:	8b 50 04             	mov    0x4(%eax),%edx
c010a196:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a199:	89 10                	mov    %edx,(%eax)
c010a19b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a19e:	8b 50 08             	mov    0x8(%eax),%edx
c010a1a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1a4:	89 10                	mov    %edx,(%eax)
c010a1a6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1a9:	8b 40 08             	mov    0x8(%eax),%eax
c010a1ac:	85 c0                	test   %eax,%eax
c010a1ae:	74 0c                	je     c010a1bc <appendToDoubleLinkList+0xbc>
c010a1b0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1b3:	8b 40 08             	mov    0x8(%eax),%eax
c010a1b6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a1b9:	89 50 04             	mov    %edx,0x4(%eax)
c010a1bc:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1bf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a1c2:	89 50 08             	mov    %edx,0x8(%eax)
c010a1c5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1c8:	8d 50 08             	lea    0x8(%eax),%edx
c010a1cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1ce:	89 50 04             	mov    %edx,0x4(%eax)
c010a1d1:	83 ec 0c             	sub    $0xc,%esp
c010a1d4:	ff 75 f4             	pushl  -0xc(%ebp)
c010a1d7:	e8 45 ca ff ff       	call   c0106c21 <intr_set_status>
c010a1dc:	83 c4 10             	add    $0x10,%esp
c010a1df:	eb 04                	jmp    c010a1e5 <appendToDoubleLinkList+0xe5>
c010a1e1:	90                   	nop
c010a1e2:	eb 01                	jmp    c010a1e5 <appendToDoubleLinkList+0xe5>
c010a1e4:	90                   	nop
c010a1e5:	c9                   	leave  
c010a1e6:	c3                   	ret    

c010a1e7 <insertToDoubleLinkList>:
c010a1e7:	55                   	push   %ebp
c010a1e8:	89 e5                	mov    %esp,%ebp
c010a1ea:	83 ec 18             	sub    $0x18,%esp
c010a1ed:	83 ec 08             	sub    $0x8,%esp
c010a1f0:	ff 75 0c             	pushl  0xc(%ebp)
c010a1f3:	ff 75 08             	pushl  0x8(%ebp)
c010a1f6:	e8 29 fe ff ff       	call   c010a024 <findElementInList>
c010a1fb:	83 c4 10             	add    $0x10,%esp
c010a1fe:	3c 01                	cmp    $0x1,%al
c010a200:	74 65                	je     c010a267 <insertToDoubleLinkList+0x80>
c010a202:	e8 f1 c9 ff ff       	call   c0106bf8 <intr_disable>
c010a207:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a20a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a20d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a210:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a213:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a21a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a21d:	8b 50 04             	mov    0x4(%eax),%edx
c010a220:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a223:	89 10                	mov    %edx,(%eax)
c010a225:	8b 45 08             	mov    0x8(%ebp),%eax
c010a228:	8b 50 04             	mov    0x4(%eax),%edx
c010a22b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a22e:	89 50 04             	mov    %edx,0x4(%eax)
c010a231:	8b 45 08             	mov    0x8(%ebp),%eax
c010a234:	8b 40 04             	mov    0x4(%eax),%eax
c010a237:	85 c0                	test   %eax,%eax
c010a239:	74 0b                	je     c010a246 <insertToDoubleLinkList+0x5f>
c010a23b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a23e:	8b 40 04             	mov    0x4(%eax),%eax
c010a241:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a244:	89 10                	mov    %edx,(%eax)
c010a246:	8b 45 08             	mov    0x8(%ebp),%eax
c010a249:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a24c:	89 50 04             	mov    %edx,0x4(%eax)
c010a24f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a252:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a255:	89 10                	mov    %edx,(%eax)
c010a257:	83 ec 0c             	sub    $0xc,%esp
c010a25a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a25d:	e8 bf c9 ff ff       	call   c0106c21 <intr_set_status>
c010a262:	83 c4 10             	add    $0x10,%esp
c010a265:	eb 01                	jmp    c010a268 <insertToDoubleLinkList+0x81>
c010a267:	90                   	nop
c010a268:	c9                   	leave  
c010a269:	c3                   	ret    

c010a26a <popFromDoubleLinkList>:
c010a26a:	55                   	push   %ebp
c010a26b:	89 e5                	mov    %esp,%ebp
c010a26d:	83 ec 18             	sub    $0x18,%esp
c010a270:	e8 83 c9 ff ff       	call   c0106bf8 <intr_disable>
c010a275:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a278:	83 ec 0c             	sub    $0xc,%esp
c010a27b:	ff 75 08             	pushl  0x8(%ebp)
c010a27e:	e8 80 fd ff ff       	call   c010a003 <isListEmpty>
c010a283:	83 c4 10             	add    $0x10,%esp
c010a286:	3c 01                	cmp    $0x1,%al
c010a288:	75 07                	jne    c010a291 <popFromDoubleLinkList+0x27>
c010a28a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a28f:	eb 6b                	jmp    c010a2fc <popFromDoubleLinkList+0x92>
c010a291:	8b 45 08             	mov    0x8(%ebp),%eax
c010a294:	8b 40 08             	mov    0x8(%eax),%eax
c010a297:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a29a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a29d:	8b 40 08             	mov    0x8(%eax),%eax
c010a2a0:	85 c0                	test   %eax,%eax
c010a2a2:	75 07                	jne    c010a2ab <popFromDoubleLinkList+0x41>
c010a2a4:	b8 00 00 00 00       	mov    $0x0,%eax
c010a2a9:	eb 51                	jmp    c010a2fc <popFromDoubleLinkList+0x92>
c010a2ab:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2ae:	8b 40 08             	mov    0x8(%eax),%eax
c010a2b1:	8b 00                	mov    (%eax),%eax
c010a2b3:	85 c0                	test   %eax,%eax
c010a2b5:	74 11                	je     c010a2c8 <popFromDoubleLinkList+0x5e>
c010a2b7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2ba:	8b 40 08             	mov    0x8(%eax),%eax
c010a2bd:	8b 00                	mov    (%eax),%eax
c010a2bf:	8b 55 08             	mov    0x8(%ebp),%edx
c010a2c2:	83 c2 08             	add    $0x8,%edx
c010a2c5:	89 50 04             	mov    %edx,0x4(%eax)
c010a2c8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2cb:	8b 40 08             	mov    0x8(%eax),%eax
c010a2ce:	8b 10                	mov    (%eax),%edx
c010a2d0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2d3:	89 50 08             	mov    %edx,0x8(%eax)
c010a2d6:	83 ec 0c             	sub    $0xc,%esp
c010a2d9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a2dc:	e8 40 c9 ff ff       	call   c0106c21 <intr_set_status>
c010a2e1:	83 c4 10             	add    $0x10,%esp
c010a2e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2e7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a2ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2f1:	8b 50 04             	mov    0x4(%eax),%edx
c010a2f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2f7:	89 10                	mov    %edx,(%eax)
c010a2f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2fc:	c9                   	leave  
c010a2fd:	c3                   	ret    

c010a2fe <kernel_thread>:
c010a2fe:	55                   	push   %ebp
c010a2ff:	89 e5                	mov    %esp,%ebp
c010a301:	83 ec 08             	sub    $0x8,%esp
c010a304:	fb                   	sti    
c010a305:	83 ec 0c             	sub    $0xc,%esp
c010a308:	ff 75 0c             	pushl  0xc(%ebp)
c010a30b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a30e:	ff d0                	call   *%eax
c010a310:	83 c4 10             	add    $0x10,%esp
c010a313:	90                   	nop
c010a314:	c9                   	leave  
c010a315:	c3                   	ret    

c010a316 <thread_init>:
c010a316:	55                   	push   %ebp
c010a317:	89 e5                	mov    %esp,%ebp
c010a319:	83 ec 18             	sub    $0x18,%esp
c010a31c:	83 ec 08             	sub    $0x8,%esp
c010a31f:	6a 00                	push   $0x0
c010a321:	6a 01                	push   $0x1
c010a323:	e8 ff bd ff ff       	call   c0106127 <alloc_memory>
c010a328:	83 c4 10             	add    $0x10,%esp
c010a32b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a32e:	83 ec 04             	sub    $0x4,%esp
c010a331:	68 00 10 00 00       	push   $0x1000
c010a336:	6a 00                	push   $0x0
c010a338:	ff 75 f4             	pushl  -0xc(%ebp)
c010a33b:	e8 2b 1e 00 00       	call   c010c16b <Memset>
c010a340:	83 c4 10             	add    $0x10,%esp
c010a343:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a346:	05 00 10 00 00       	add    $0x1000,%eax
c010a34b:	89 c2                	mov    %eax,%edx
c010a34d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a350:	89 10                	mov    %edx,(%eax)
c010a352:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a355:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a35c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a35f:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a366:	ff ff ff 
c010a369:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a36c:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a373:	00 00 00 
c010a376:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a379:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a37f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a382:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a388:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a38d:	83 c0 01             	add    $0x1,%eax
c010a390:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a395:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a39b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a39e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a3a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3a7:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a3ae:	00 00 00 
c010a3b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3b4:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a3bb:	cd ab 99 
c010a3be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3c1:	c9                   	leave  
c010a3c2:	c3                   	ret    

c010a3c3 <thread_create>:
c010a3c3:	55                   	push   %ebp
c010a3c4:	89 e5                	mov    %esp,%ebp
c010a3c6:	83 ec 10             	sub    $0x10,%esp
c010a3c9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a3d0:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a3d7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3da:	8b 00                	mov    (%eax),%eax
c010a3dc:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a3df:	89 c2                	mov    %eax,%edx
c010a3e1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3e4:	89 10                	mov    %edx,(%eax)
c010a3e6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3e9:	8b 00                	mov    (%eax),%eax
c010a3eb:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a3ee:	89 c2                	mov    %eax,%edx
c010a3f0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3f3:	89 10                	mov    %edx,(%eax)
c010a3f5:	90                   	nop
c010a3f6:	c9                   	leave  
c010a3f7:	c3                   	ret    

c010a3f8 <thread_start>:
c010a3f8:	55                   	push   %ebp
c010a3f9:	89 e5                	mov    %esp,%ebp
c010a3fb:	83 ec 18             	sub    $0x18,%esp
c010a3fe:	e8 13 ff ff ff       	call   c010a316 <thread_init>
c010a403:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a406:	83 ec 0c             	sub    $0xc,%esp
c010a409:	ff 75 f4             	pushl  -0xc(%ebp)
c010a40c:	e8 b2 ff ff ff       	call   c010a3c3 <thread_create>
c010a411:	83 c4 10             	add    $0x10,%esp
c010a414:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a417:	05 28 01 00 00       	add    $0x128,%eax
c010a41c:	83 ec 08             	sub    $0x8,%esp
c010a41f:	ff 75 10             	pushl  0x10(%ebp)
c010a422:	50                   	push   %eax
c010a423:	e8 62 1d 00 00       	call   c010c18a <Strcpy>
c010a428:	83 c4 10             	add    $0x10,%esp
c010a42b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a42e:	8b 00                	mov    (%eax),%eax
c010a430:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a433:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a436:	c7 40 10 fe a2 10 c0 	movl   $0xc010a2fe,0x10(%eax)
c010a43d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a440:	8b 55 08             	mov    0x8(%ebp),%edx
c010a443:	89 50 18             	mov    %edx,0x18(%eax)
c010a446:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a449:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a44c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a44f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a452:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a458:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a45b:	8b 10                	mov    (%eax),%edx
c010a45d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a460:	89 50 04             	mov    %edx,0x4(%eax)
c010a463:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a466:	8b 50 04             	mov    0x4(%eax),%edx
c010a469:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a46c:	89 50 08             	mov    %edx,0x8(%eax)
c010a46f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a472:	8b 50 08             	mov    0x8(%eax),%edx
c010a475:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a478:	89 50 0c             	mov    %edx,0xc(%eax)
c010a47b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a47e:	05 60 02 00 00       	add    $0x260,%eax
c010a483:	83 ec 08             	sub    $0x8,%esp
c010a486:	50                   	push   %eax
c010a487:	68 ec fd 10 c0       	push   $0xc010fdec
c010a48c:	e8 6f fc ff ff       	call   c010a100 <appendToDoubleLinkList>
c010a491:	83 c4 10             	add    $0x10,%esp
c010a494:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a497:	05 6a 02 00 00       	add    $0x26a,%eax
c010a49c:	83 ec 08             	sub    $0x8,%esp
c010a49f:	50                   	push   %eax
c010a4a0:	68 04 0f 11 c0       	push   $0xc0110f04
c010a4a5:	e8 56 fc ff ff       	call   c010a100 <appendToDoubleLinkList>
c010a4aa:	83 c4 10             	add    $0x10,%esp
c010a4ad:	90                   	nop
c010a4ae:	c9                   	leave  
c010a4af:	c3                   	ret    

c010a4b0 <DriverInitialize>:
c010a4b0:	b0 21                	mov    $0x21,%al
c010a4b2:	66 ba 10 00          	mov    $0x10,%dx
c010a4b6:	ee                   	out    %al,(%dx)
c010a4b7:	b0 58                	mov    $0x58,%al
c010a4b9:	66 ba 1e 00          	mov    $0x1e,%dx
c010a4bd:	ee                   	out    %al,(%dx)
c010a4be:	66 ba 1a 00          	mov    $0x1a,%dx
c010a4c2:	30 c0                	xor    %al,%al
c010a4c4:	ee                   	out    %al,(%dx)
c010a4c5:	66 ba 1b 00          	mov    $0x1b,%dx
c010a4c9:	ee                   	out    %al,(%dx)
c010a4ca:	b0 00                	mov    $0x0,%al
c010a4cc:	66 ba 1c 00          	mov    $0x1c,%dx
c010a4d0:	ee                   	out    %al,(%dx)
c010a4d1:	b0 20                	mov    $0x20,%al
c010a4d3:	66 ba 14 00          	mov    $0x14,%dx
c010a4d7:	ee                   	out    %al,(%dx)
c010a4d8:	b0 02                	mov    $0x2,%al
c010a4da:	66 ba 1d 00          	mov    $0x1d,%dx
c010a4de:	ee                   	out    %al,(%dx)
c010a4df:	b0 26                	mov    $0x26,%al
c010a4e1:	66 ba 11 00          	mov    $0x11,%dx
c010a4e5:	ee                   	out    %al,(%dx)
c010a4e6:	66 ba 13 00          	mov    $0x13,%dx
c010a4ea:	ee                   	out    %al,(%dx)
c010a4eb:	b0 40                	mov    $0x40,%al
c010a4ed:	66 ba 12 00          	mov    $0x12,%dx
c010a4f1:	ee                   	out    %al,(%dx)
c010a4f2:	b0 61                	mov    $0x61,%al
c010a4f4:	66 ba 10 00          	mov    $0x10,%dx
c010a4f8:	ee                   	out    %al,(%dx)
c010a4f9:	b0 26                	mov    $0x26,%al
c010a4fb:	66 ba 17 00          	mov    $0x17,%dx
c010a4ff:	ee                   	out    %al,(%dx)
c010a500:	b0 22                	mov    $0x22,%al
c010a502:	66 ba 10 00          	mov    $0x10,%dx
c010a506:	ee                   	out    %al,(%dx)
c010a507:	b0 ff                	mov    $0xff,%al
c010a509:	66 ba 17 00          	mov    $0x17,%dx
c010a50d:	ee                   	out    %al,(%dx)
c010a50e:	b0 0b                	mov    $0xb,%al
c010a510:	66 ba 1f 00          	mov    $0x1f,%dx
c010a514:	ee                   	out    %al,(%dx)
c010a515:	66 ba 1d 00          	mov    $0x1d,%dx
c010a519:	b0 00                	mov    $0x0,%al
c010a51b:	ee                   	out    %al,(%dx)
c010a51c:	c3                   	ret    

c010a51d <DriverSend>:
c010a51d:	fa                   	cli    
c010a51e:	66 ba 10 00          	mov    $0x10,%dx
c010a522:	ec                   	in     (%dx),%al
c010a523:	3c 26                	cmp    $0x26,%al
c010a525:	74 2b                	je     c010a552 <QueueIt>
c010a527:	66 51                	push   %cx
c010a529:	b4 40                	mov    $0x40,%ah
c010a52b:	30 c0                	xor    %al,%al
c010a52d:	e8 23 00 00 00       	call   c010a555 <PCtoNIC>
c010a532:	66 ba 14 00          	mov    $0x14,%dx
c010a536:	b0 40                	mov    $0x40,%al
c010a538:	ee                   	out    %al,(%dx)
c010a539:	66 59                	pop    %cx
c010a53b:	66 ba 15 00          	mov    $0x15,%dx
c010a53f:	88 c8                	mov    %cl,%al
c010a541:	ee                   	out    %al,(%dx)
c010a542:	66 ba 16 00          	mov    $0x16,%dx
c010a546:	88 e8                	mov    %ch,%al
c010a548:	ee                   	out    %al,(%dx)
c010a549:	66 ba 10 00          	mov    $0x10,%dx
c010a54d:	b0 26                	mov    $0x26,%al
c010a54f:	ee                   	out    %al,(%dx)
c010a550:	eb 01                	jmp    c010a553 <Finished>

c010a552 <QueueIt>:
c010a552:	90                   	nop

c010a553 <Finished>:
c010a553:	fb                   	sti    
c010a554:	c3                   	ret    

c010a555 <PCtoNIC>:
c010a555:	66 50                	push   %ax
c010a557:	66 41                	inc    %cx
c010a559:	66 83 e1 fe          	and    $0xfffe,%cx
c010a55d:	66 ba 1a 00          	mov    $0x1a,%dx
c010a561:	88 c8                	mov    %cl,%al
c010a563:	ee                   	out    %al,(%dx)
c010a564:	66 ba 1b 00          	mov    $0x1b,%dx
c010a568:	88 e8                	mov    %ch,%al
c010a56a:	ee                   	out    %al,(%dx)
c010a56b:	66 58                	pop    %ax
c010a56d:	66 ba 18 00          	mov    $0x18,%dx
c010a571:	ee                   	out    %al,(%dx)
c010a572:	66 ba 19 00          	mov    $0x19,%dx
c010a576:	88 e0                	mov    %ah,%al
c010a578:	ee                   	out    %al,(%dx)
c010a579:	66 ba 10 00          	mov    $0x10,%dx
c010a57d:	b0 12                	mov    $0x12,%al
c010a57f:	ee                   	out    %al,(%dx)
c010a580:	66 ba 20 00          	mov    $0x20,%dx
c010a584:	66 d1 e9             	shr    %cx

c010a587 <Writing_Word>:
c010a587:	66 ad                	lods   %ds:(%esi),%ax
c010a589:	66 ef                	out    %ax,(%dx)
c010a58b:	e2 fa                	loop   c010a587 <Writing_Word>
c010a58d:	66 b9 00 00          	mov    $0x0,%cx
c010a591:	66 ba 17 00          	mov    $0x17,%dx

c010a595 <CheckDMA>:
c010a595:	ec                   	in     (%dx),%al
c010a596:	a8 40                	test   $0x40,%al
c010a598:	75 02                	jne    c010a59c <toNICEND>
c010a59a:	eb f9                	jmp    c010a595 <CheckDMA>

c010a59c <toNICEND>:
c010a59c:	66 ba 17 00          	mov    $0x17,%dx
c010a5a0:	b0 40                	mov    $0x40,%al
c010a5a2:	ee                   	out    %al,(%dx)
c010a5a3:	f8                   	clc    
c010a5a4:	c3                   	ret    

c010a5a5 <NICtoPC>:
c010a5a5:	66 50                	push   %ax
c010a5a7:	66 41                	inc    %cx
c010a5a9:	66 83 e1 fe          	and    $0xfffe,%cx
c010a5ad:	66 ba 1a 00          	mov    $0x1a,%dx
c010a5b1:	88 c8                	mov    %cl,%al
c010a5b3:	ee                   	out    %al,(%dx)
c010a5b4:	66 ba 1b 00          	mov    $0x1b,%dx
c010a5b8:	88 e8                	mov    %ch,%al
c010a5ba:	ee                   	out    %al,(%dx)
c010a5bb:	66 58                	pop    %ax
c010a5bd:	66 ba 18 00          	mov    $0x18,%dx
c010a5c1:	ee                   	out    %al,(%dx)
c010a5c2:	66 ba 19 00          	mov    $0x19,%dx
c010a5c6:	88 e0                	mov    %ah,%al
c010a5c8:	ee                   	out    %al,(%dx)
c010a5c9:	66 ba 10 00          	mov    $0x10,%dx
c010a5cd:	b0 0a                	mov    $0xa,%al
c010a5cf:	ee                   	out    %al,(%dx)
c010a5d0:	66 ba 20 00          	mov    $0x20,%dx
c010a5d4:	66 d1 e9             	shr    %cx

c010a5d7 <Writing_Word_NICtoPC>:
c010a5d7:	66 ed                	in     (%dx),%ax
c010a5d9:	66 ab                	stos   %ax,%es:(%edi)
c010a5db:	e2 fa                	loop   c010a5d7 <Writing_Word_NICtoPC>
c010a5dd:	66 ba 17 00          	mov    $0x17,%dx

c010a5e1 <CheckDMA_NICtoPC>:
c010a5e1:	ec                   	in     (%dx),%al
c010a5e2:	a8 40                	test   $0x40,%al
c010a5e4:	75 02                	jne    c010a5e8 <ReadEnd>
c010a5e6:	eb f9                	jmp    c010a5e1 <CheckDMA_NICtoPC>

c010a5e8 <ReadEnd>:
c010a5e8:	ee                   	out    %al,(%dx)
c010a5e9:	c3                   	ret    
