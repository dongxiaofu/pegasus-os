
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
c0100025:	e8 81 3c 00 00       	call   c0103cab <ReloadGDT>
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
c010004e:	e9 b1 03 00 00       	jmp    c0100404 <kernel_main>
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
c010014b:	e8 a0 71 00 00       	call   c01072f0 <exception_handler>
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
c0100168:	e8 83 71 00 00       	call   c01072f0 <exception_handler>
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
c0100195:	e8 db 36 00 00       	call   c0103875 <clock_handler>
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
c01001c7:	e8 34 46 00 00       	call   c0104800 <keyboard_handler>
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
c010020d:	e8 50 12 00 00       	call   c0101462 <hd_handler>
c0100212:	b0 bb                	mov    $0xbb,%al
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
c0100238:	b0 bf                	mov    $0xbf,%al
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
c0100253:	66 87 db             	xchg   %bx,%bx
c0100256:	90                   	nop
c0100257:	90                   	nop
c0100258:	b0 bb                	mov    $0xbb,%al
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
c010033b:	e8 4a 6e 00 00       	call   c010718a <disp_int>
c0100340:	83 c4 04             	add    $0x4,%esp
c0100343:	58                   	pop    %eax
c0100344:	5a                   	pop    %edx
c0100345:	52                   	push   %edx
c0100346:	50                   	push   %eax
c0100347:	e8 3e 6e 00 00       	call   c010718a <disp_int>
c010034c:	58                   	pop    %eax
c010034d:	5a                   	pop    %edx
c010034e:	52                   	push   %edx
c010034f:	50                   	push   %eax
c0100350:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c0100356:	e8 2f 6e 00 00       	call   c010718a <disp_int>
c010035b:	83 c4 04             	add    $0x4,%esp
c010035e:	58                   	pop    %eax
c010035f:	5a                   	pop    %edx
c0100360:	52                   	push   %edx
c0100361:	50                   	push   %eax
c0100362:	ff 72 ec             	pushl  -0x14(%edx)
c0100365:	e8 20 6e 00 00       	call   c010718a <disp_int>
c010036a:	83 c4 04             	add    $0x4,%esp
c010036d:	58                   	pop    %eax
c010036e:	5a                   	pop    %edx
c010036f:	52                   	push   %edx
c0100370:	50                   	push   %eax
c0100371:	ff 70 ec             	pushl  -0x14(%eax)
c0100374:	e8 11 6e 00 00       	call   c010718a <disp_int>
c0100379:	83 c4 04             	add    $0x4,%esp
c010037c:	58                   	pop    %eax
c010037d:	5a                   	pop    %edx
c010037e:	52                   	push   %edx
c010037f:	50                   	push   %eax
c0100380:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100386:	e8 ff 6d 00 00       	call   c010718a <disp_int>
c010038b:	83 c4 04             	add    $0x4,%esp
c010038e:	58                   	pop    %eax
c010038f:	5a                   	pop    %edx
c0100390:	52                   	push   %edx
c0100391:	50                   	push   %eax
c0100392:	68 60 f7 10 c0       	push   $0xc010f760
c0100397:	e8 ee 6d 00 00       	call   c010718a <disp_int>
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
c01003f6:	66 87 db             	xchg   %bx,%bx
c01003f9:	30 c0                	xor    %al,%al
c01003fb:	e4 a1                	in     $0xa1,%al
c01003fd:	24 fb                	and    $0xfb,%al
c01003ff:	e6 a1                	out    %al,$0xa1
c0100401:	9d                   	popf   
c0100402:	fb                   	sti    
c0100403:	c3                   	ret    

c0100404 <kernel_main>:
c0100404:	55                   	push   %ebp
c0100405:	89 e5                	mov    %esp,%ebp
c0100407:	83 ec 18             	sub    $0x18,%esp
c010040a:	e8 7b 01 00 00       	call   c010058a <init>
c010040f:	c7 45 f4 0f 00 00 00 	movl   $0xf,-0xc(%ebp)
c0100416:	e8 ce ff ff ff       	call   c01003e9 <get_running_thread_pcb>
c010041b:	a3 e0 0e 11 c0       	mov    %eax,0xc0110ee0
c0100420:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100423:	8d 50 02             	lea    0x2(%eax),%edx
c0100426:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010042b:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0100431:	8b 15 e0 0e 11 c0    	mov    0xc0110ee0,%edx
c0100437:	8b 80 1c 01 00 00    	mov    0x11c(%eax),%eax
c010043d:	89 82 18 01 00 00    	mov    %eax,0x118(%edx)
c0100443:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100448:	8b 15 28 0f 11 c0    	mov    0xc0110f28,%edx
c010044e:	89 50 08             	mov    %edx,0x8(%eax)
c0100451:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100456:	05 28 01 00 00       	add    $0x128,%eax
c010045b:	83 ec 08             	sub    $0x8,%esp
c010045e:	68 00 b0 10 c0       	push   $0xc010b000
c0100463:	50                   	push   %eax
c0100464:	e8 a5 bd 00 00       	call   c010c20e <Strcpy>
c0100469:	83 c4 10             	add    $0x10,%esp
c010046c:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100471:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0100476:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010047b:	05 60 02 00 00       	add    $0x260,%eax
c0100480:	83 ec 08             	sub    $0x8,%esp
c0100483:	50                   	push   %eax
c0100484:	68 ec fd 10 c0       	push   $0xc010fdec
c0100489:	e8 e2 9d 00 00       	call   c010a270 <appendToDoubleLinkList>
c010048e:	83 c4 10             	add    $0x10,%esp
c0100491:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100496:	05 6a 02 00 00       	add    $0x26a,%eax
c010049b:	83 ec 08             	sub    $0x8,%esp
c010049e:	50                   	push   %eax
c010049f:	68 ec fd 10 c0       	push   $0xc010fdec
c01004a4:	e8 c7 9d 00 00       	call   c010a270 <appendToDoubleLinkList>
c01004a9:	83 c4 10             	add    $0x10,%esp
c01004ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004af:	83 ec 0c             	sub    $0xc,%esp
c01004b2:	50                   	push   %eax
c01004b3:	6a 00                	push   $0x0
c01004b5:	68 0c b0 10 c0       	push   $0xc010b00c
c01004ba:	68 13 b0 10 c0       	push   $0xc010b013
c01004bf:	68 67 52 10 c0       	push   $0xc0105267
c01004c4:	e8 e8 9a 00 00       	call   c0109fb1 <process_execute>
c01004c9:	83 c4 20             	add    $0x20,%esp
c01004cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004cf:	83 ec 0c             	sub    $0xc,%esp
c01004d2:	50                   	push   %eax
c01004d3:	6a 00                	push   $0x0
c01004d5:	68 1c b0 10 c0       	push   $0xc010b01c
c01004da:	68 24 b0 10 c0       	push   $0xc010b024
c01004df:	68 19 17 10 c0       	push   $0xc0101719
c01004e4:	e8 c8 9a 00 00       	call   c0109fb1 <process_execute>
c01004e9:	83 c4 20             	add    $0x20,%esp
c01004ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004ef:	83 ec 0c             	sub    $0xc,%esp
c01004f2:	50                   	push   %eax
c01004f3:	6a 00                	push   $0x0
c01004f5:	68 2d b0 10 c0       	push   $0xc010b02d
c01004fa:	68 34 b0 10 c0       	push   $0xc010b034
c01004ff:	68 da 07 10 c0       	push   $0xc01007da
c0100504:	e8 a8 9a 00 00       	call   c0109fb1 <process_execute>
c0100509:	83 c4 20             	add    $0x20,%esp
c010050c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010050f:	83 ec 0c             	sub    $0xc,%esp
c0100512:	50                   	push   %eax
c0100513:	6a 00                	push   $0x0
c0100515:	68 3d b0 10 c0       	push   $0xc010b03d
c010051a:	68 45 b0 10 c0       	push   $0xc010b045
c010051f:	68 fd 46 10 c0       	push   $0xc01046fd
c0100524:	e8 88 9a 00 00       	call   c0109fb1 <process_execute>
c0100529:	83 c4 20             	add    $0x20,%esp
c010052c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010052f:	83 e8 02             	sub    $0x2,%eax
c0100532:	83 ec 0c             	sub    $0xc,%esp
c0100535:	50                   	push   %eax
c0100536:	6a 01                	push   $0x1
c0100538:	68 4f b0 10 c0       	push   $0xc010b04f
c010053d:	68 59 b0 10 c0       	push   $0xc010b059
c0100542:	68 e4 06 10 c0       	push   $0xc01006e4
c0100547:	e8 65 9a 00 00       	call   c0109fb1 <process_execute>
c010054c:	83 c4 20             	add    $0x20,%esp
c010054f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100552:	83 e8 03             	sub    $0x3,%eax
c0100555:	83 ec 0c             	sub    $0xc,%esp
c0100558:	50                   	push   %eax
c0100559:	6a 01                	push   $0x1
c010055b:	68 66 b0 10 c0       	push   $0xc010b066
c0100560:	68 70 b0 10 c0       	push   $0xc010b070
c0100565:	68 c2 07 10 c0       	push   $0xc01007c2
c010056a:	e8 42 9a 00 00       	call   c0109fb1 <process_execute>
c010056f:	83 c4 20             	add    $0x20,%esp
c0100572:	83 ec 0c             	sub    $0xc,%esp
c0100575:	68 7d b0 10 c0       	push   $0xc010b07d
c010057a:	e8 0d fb ff ff       	call   c010008c <disp_str>
c010057f:	83 c4 10             	add    $0x10,%esp
c0100582:	fb                   	sti    
c0100583:	e8 26 67 00 00       	call   c0106cae <stop_here>
c0100588:	eb f9                	jmp    c0100583 <kernel_main+0x17f>

c010058a <init>:
c010058a:	55                   	push   %ebp
c010058b:	89 e5                	mov    %esp,%ebp
c010058d:	83 ec 08             	sub    $0x8,%esp
c0100590:	c7 05 28 0f 11 c0 00 	movl   $0x400000,0xc0110f28
c0100597:	00 40 00 
c010059a:	c7 05 a8 f7 10 c0 63 	movl   $0x63,0xc010f7a8
c01005a1:	00 00 00 
c01005a4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01005ab:	00 00 00 
c01005ae:	c7 05 90 f7 10 c0 00 	movl   $0x0,0xc010f790
c01005b5:	00 00 00 
c01005b8:	c7 05 c8 06 11 c0 64 	movl   $0x64,0xc01106c8
c01005bf:	00 00 00 
c01005c2:	c7 05 fc fd 10 c0 09 	movl   $0x9,0xc010fdfc
c01005c9:	00 00 00 
c01005cc:	c7 05 c0 fb 10 c0 00 	movl   $0x0,0xc010fbc0
c01005d3:	00 00 00 
c01005d6:	83 ec 0c             	sub    $0xc,%esp
c01005d9:	68 87 b0 10 c0       	push   $0xc010b087
c01005de:	e8 a9 fa ff ff       	call   c010008c <disp_str>
c01005e3:	83 c4 10             	add    $0x10,%esp
c01005e6:	e8 ef 70 00 00       	call   c01076da <init_keyboard>
c01005eb:	83 ec 0c             	sub    $0xc,%esp
c01005ee:	68 00 00 00 04       	push   $0x4000000
c01005f3:	e8 6d 65 00 00       	call   c0106b65 <init_memory>
c01005f8:	83 c4 10             	add    $0x10,%esp
c01005fb:	83 ec 0c             	sub    $0xc,%esp
c01005fe:	68 ec fd 10 c0       	push   $0xc010fdec
c0100603:	e8 3d 9b 00 00       	call   c010a145 <initDoubleLinkList>
c0100608:	83 c4 10             	add    $0x10,%esp
c010060b:	83 ec 0c             	sub    $0xc,%esp
c010060e:	68 04 0f 11 c0       	push   $0xc0110f04
c0100613:	e8 2d 9b 00 00       	call   c010a145 <initDoubleLinkList>
c0100618:	83 c4 10             	add    $0x10,%esp
c010061b:	90                   	nop
c010061c:	c9                   	leave  
c010061d:	c3                   	ret    

c010061e <kernel_thread_a>:
c010061e:	55                   	push   %ebp
c010061f:	89 e5                	mov    %esp,%ebp
c0100621:	83 ec 18             	sub    $0x18,%esp
c0100624:	83 ec 0c             	sub    $0xc,%esp
c0100627:	ff 75 08             	pushl  0x8(%ebp)
c010062a:	e8 5d fa ff ff       	call   c010008c <disp_str>
c010062f:	83 c4 10             	add    $0x10,%esp
c0100632:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100637:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010063a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100641:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100644:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c0100649:	83 ec 0c             	sub    $0xc,%esp
c010064c:	68 8d b0 10 c0       	push   $0xc010b08d
c0100651:	e8 36 fa ff ff       	call   c010008c <disp_str>
c0100656:	83 c4 10             	add    $0x10,%esp
c0100659:	83 ec 0c             	sub    $0xc,%esp
c010065c:	68 96 b0 10 c0       	push   $0xc010b096
c0100661:	e8 26 fa ff ff       	call   c010008c <disp_str>
c0100666:	83 c4 10             	add    $0x10,%esp
c0100669:	eb d6                	jmp    c0100641 <kernel_thread_a+0x23>

c010066b <kernel_thread_b>:
c010066b:	55                   	push   %ebp
c010066c:	89 e5                	mov    %esp,%ebp
c010066e:	83 ec 18             	sub    $0x18,%esp
c0100671:	83 ec 0c             	sub    $0xc,%esp
c0100674:	ff 75 08             	pushl  0x8(%ebp)
c0100677:	e8 10 fa ff ff       	call   c010008c <disp_str>
c010067c:	83 c4 10             	add    $0x10,%esp
c010067f:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100684:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100687:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010068e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100691:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c0100696:	83 ec 0c             	sub    $0xc,%esp
c0100699:	68 98 b0 10 c0       	push   $0xc010b098
c010069e:	e8 e9 f9 ff ff       	call   c010008c <disp_str>
c01006a3:	83 c4 10             	add    $0x10,%esp
c01006a6:	83 ec 0c             	sub    $0xc,%esp
c01006a9:	68 96 b0 10 c0       	push   $0xc010b096
c01006ae:	e8 d9 f9 ff ff       	call   c010008c <disp_str>
c01006b3:	83 c4 10             	add    $0x10,%esp
c01006b6:	eb d6                	jmp    c010068e <kernel_thread_b+0x23>

c01006b8 <kernel_thread_c>:
c01006b8:	55                   	push   %ebp
c01006b9:	89 e5                	mov    %esp,%ebp
c01006bb:	83 ec 08             	sub    $0x8,%esp
c01006be:	83 ec 0c             	sub    $0xc,%esp
c01006c1:	ff 75 08             	pushl  0x8(%ebp)
c01006c4:	e8 c3 f9 ff ff       	call   c010008c <disp_str>
c01006c9:	83 c4 10             	add    $0x10,%esp
c01006cc:	eb fe                	jmp    c01006cc <kernel_thread_c+0x14>

c01006ce <kernel_thread_d>:
c01006ce:	55                   	push   %ebp
c01006cf:	89 e5                	mov    %esp,%ebp
c01006d1:	83 ec 08             	sub    $0x8,%esp
c01006d4:	83 ec 0c             	sub    $0xc,%esp
c01006d7:	ff 75 08             	pushl  0x8(%ebp)
c01006da:	e8 ad f9 ff ff       	call   c010008c <disp_str>
c01006df:	83 c4 10             	add    $0x10,%esp
c01006e2:	eb fe                	jmp    c01006e2 <kernel_thread_d+0x14>

c01006e4 <user_proc_a>:
c01006e4:	55                   	push   %ebp
c01006e5:	89 e5                	mov    %esp,%ebp
c01006e7:	83 ec 18             	sub    $0x18,%esp
c01006ea:	83 ec 0c             	sub    $0xc,%esp
c01006ed:	68 a4 b0 10 c0       	push   $0xc010b0a4
c01006f2:	e8 95 f9 ff ff       	call   c010008c <disp_str>
c01006f7:	83 c4 10             	add    $0x10,%esp
c01006fa:	c6 05 cd 06 11 c0 00 	movb   $0x0,0xc01106cd
c0100701:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
c0100708:	83 ec 0c             	sub    $0xc,%esp
c010070b:	ff 75 f0             	pushl  -0x10(%ebp)
c010070e:	e8 d9 0f 00 00       	call   c01016ec <sys_malloc>
c0100713:	83 c4 10             	add    $0x10,%esp
c0100716:	a3 bc 06 11 c0       	mov    %eax,0xc01106bc
c010071b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010071e:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100723:	83 ec 04             	sub    $0x4,%esp
c0100726:	52                   	push   %edx
c0100727:	6a 00                	push   $0x0
c0100729:	50                   	push   %eax
c010072a:	e8 c0 ba 00 00       	call   c010c1ef <Memset>
c010072f:	83 c4 10             	add    $0x10,%esp
c0100732:	c7 45 ec c3 b0 10 c0 	movl   $0xc010b0c3,-0x14(%ebp)
c0100739:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c010073e:	83 ec 08             	sub    $0x8,%esp
c0100741:	ff 75 ec             	pushl  -0x14(%ebp)
c0100744:	50                   	push   %eax
c0100745:	e8 c4 ba 00 00       	call   c010c20e <Strcpy>
c010074a:	83 c4 10             	add    $0x10,%esp
c010074d:	c6 05 cd 06 11 c0 04 	movb   $0x4,0xc01106cd
c0100754:	e8 ea 9e 00 00       	call   c010a643 <DriverInitialize>
c0100759:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100760:	eb 28                	jmp    c010078a <user_proc_a+0xa6>
c0100762:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100767:	83 ec 0c             	sub    $0xc,%esp
c010076a:	50                   	push   %eax
c010076b:	e8 7b 9f 00 00       	call   c010a6eb <DriverSend>
c0100770:	83 c4 10             	add    $0x10,%esp
c0100773:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010077a:	eb 04                	jmp    c0100780 <user_proc_a+0x9c>
c010077c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100780:	83 7d e8 1d          	cmpl   $0x1d,-0x18(%ebp)
c0100784:	7e f6                	jle    c010077c <user_proc_a+0x98>
c0100786:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010078a:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c010078e:	7e d2                	jle    c0100762 <user_proc_a+0x7e>
c0100790:	83 ec 0c             	sub    $0xc,%esp
c0100793:	68 da b0 10 c0       	push   $0xc010b0da
c0100798:	e8 ef f8 ff ff       	call   c010008c <disp_str>
c010079d:	83 c4 10             	add    $0x10,%esp
c01007a0:	83 ec 0c             	sub    $0xc,%esp
c01007a3:	68 ed b0 10 c0       	push   $0xc010b0ed
c01007a8:	e8 df f8 ff ff       	call   c010008c <disp_str>
c01007ad:	83 c4 10             	add    $0x10,%esp
c01007b0:	83 ec 0c             	sub    $0xc,%esp
c01007b3:	68 00 b1 10 c0       	push   $0xc010b100
c01007b8:	e8 cf f8 ff ff       	call   c010008c <disp_str>
c01007bd:	83 c4 10             	add    $0x10,%esp
c01007c0:	eb fe                	jmp    c01007c0 <user_proc_a+0xdc>

c01007c2 <user_proc_b>:
c01007c2:	55                   	push   %ebp
c01007c3:	89 e5                	mov    %esp,%ebp
c01007c5:	83 ec 08             	sub    $0x8,%esp
c01007c8:	83 ec 0c             	sub    $0xc,%esp
c01007cb:	68 14 b1 10 c0       	push   $0xc010b114
c01007d0:	e8 b7 f8 ff ff       	call   c010008c <disp_str>
c01007d5:	83 c4 10             	add    $0x10,%esp
c01007d8:	eb fe                	jmp    c01007d8 <user_proc_b+0x16>

c01007da <TaskHD>:
c01007da:	55                   	push   %ebp
c01007db:	89 e5                	mov    %esp,%ebp
c01007dd:	83 ec 18             	sub    $0x18,%esp
c01007e0:	e8 04 fc ff ff       	call   c01003e9 <get_running_thread_pcb>
c01007e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01007e8:	e8 32 00 00 00       	call   c010081f <init_hd>
c01007ed:	83 ec 0c             	sub    $0xc,%esp
c01007f0:	6a 7c                	push   $0x7c
c01007f2:	e8 f5 0e 00 00       	call   c01016ec <sys_malloc>
c01007f7:	83 c4 10             	add    $0x10,%esp
c01007fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01007fd:	83 ec 04             	sub    $0x4,%esp
c0100800:	6a 7c                	push   $0x7c
c0100802:	6a 00                	push   $0x0
c0100804:	ff 75 f0             	pushl  -0x10(%ebp)
c0100807:	e8 e3 b9 00 00       	call   c010c1ef <Memset>
c010080c:	83 c4 10             	add    $0x10,%esp
c010080f:	83 ec 0c             	sub    $0xc,%esp
c0100812:	ff 75 f0             	pushl  -0x10(%ebp)
c0100815:	e8 1f 00 00 00       	call   c0100839 <hd_handle>
c010081a:	83 c4 10             	add    $0x10,%esp
c010081d:	eb de                	jmp    c01007fd <TaskHD+0x23>

c010081f <init_hd>:
c010081f:	55                   	push   %ebp
c0100820:	89 e5                	mov    %esp,%ebp
c0100822:	83 ec 18             	sub    $0x18,%esp
c0100825:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c010082c:	e8 74 fb ff ff       	call   c01003a5 <enable_8259A_casecade_irq>
c0100831:	e8 83 fb ff ff       	call   c01003b9 <enable_8259A_slave_winchester_irq>
c0100836:	90                   	nop
c0100837:	c9                   	leave  
c0100838:	c3                   	ret    

c0100839 <hd_handle>:
c0100839:	55                   	push   %ebp
c010083a:	89 e5                	mov    %esp,%ebp
c010083c:	83 ec 18             	sub    $0x18,%esp
c010083f:	83 ec 04             	sub    $0x4,%esp
c0100842:	6a 12                	push   $0x12
c0100844:	ff 75 08             	pushl  0x8(%ebp)
c0100847:	6a 02                	push   $0x2
c0100849:	e8 d7 8d 00 00       	call   c0109625 <send_rec>
c010084e:	83 c4 10             	add    $0x10,%esp
c0100851:	8b 45 08             	mov    0x8(%ebp),%eax
c0100854:	8b 40 78             	mov    0x78(%eax),%eax
c0100857:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010085a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010085e:	0f 84 d4 00 00 00    	je     c0100938 <hd_handle+0xff>
c0100864:	8b 45 08             	mov    0x8(%ebp),%eax
c0100867:	8b 00                	mov    (%eax),%eax
c0100869:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010086c:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100870:	74 28                	je     c010089a <hd_handle+0x61>
c0100872:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100876:	74 22                	je     c010089a <hd_handle+0x61>
c0100878:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010087c:	74 1c                	je     c010089a <hd_handle+0x61>
c010087e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100882:	74 16                	je     c010089a <hd_handle+0x61>
c0100884:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c010088b:	74 0d                	je     c010089a <hd_handle+0x61>
c010088d:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0100894:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100897:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010089a:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010089e:	74 34                	je     c01008d4 <hd_handle+0x9b>
c01008a0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008a4:	74 2e                	je     c01008d4 <hd_handle+0x9b>
c01008a6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008aa:	74 28                	je     c01008d4 <hd_handle+0x9b>
c01008ac:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008b0:	74 22                	je     c01008d4 <hd_handle+0x9b>
c01008b2:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008b9:	74 19                	je     c01008d4 <hd_handle+0x9b>
c01008bb:	6a 70                	push   $0x70
c01008bd:	68 34 b1 10 c0       	push   $0xc010b134
c01008c2:	68 34 b1 10 c0       	push   $0xc010b134
c01008c7:	68 3c b1 10 c0       	push   $0xc010b13c
c01008cc:	e8 e4 80 00 00       	call   c01089b5 <assertion_failure>
c01008d1:	83 c4 10             	add    $0x10,%esp
c01008d4:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008d8:	74 2c                	je     c0100906 <hd_handle+0xcd>
c01008da:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008de:	77 0e                	ja     c01008ee <hd_handle+0xb5>
c01008e0:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008e4:	74 19                	je     c01008ff <hd_handle+0xc6>
c01008e6:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008ea:	74 1a                	je     c0100906 <hd_handle+0xcd>
c01008ec:	eb 37                	jmp    c0100925 <hd_handle+0xec>
c01008ee:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008f2:	74 22                	je     c0100916 <hd_handle+0xdd>
c01008f4:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008fb:	74 3e                	je     c010093b <hd_handle+0x102>
c01008fd:	eb 26                	jmp    c0100925 <hd_handle+0xec>
c01008ff:	e8 e6 06 00 00       	call   c0100fea <hd_open>
c0100904:	eb 36                	jmp    c010093c <hd_handle+0x103>
c0100906:	83 ec 0c             	sub    $0xc,%esp
c0100909:	ff 75 08             	pushl  0x8(%ebp)
c010090c:	e8 b2 08 00 00       	call   c01011c3 <hd_rdwt>
c0100911:	83 c4 10             	add    $0x10,%esp
c0100914:	eb 26                	jmp    c010093c <hd_handle+0x103>
c0100916:	83 ec 0c             	sub    $0xc,%esp
c0100919:	6a 00                	push   $0x0
c010091b:	e8 71 07 00 00       	call   c0101091 <get_hd_ioctl>
c0100920:	83 c4 10             	add    $0x10,%esp
c0100923:	eb 17                	jmp    c010093c <hd_handle+0x103>
c0100925:	83 ec 0c             	sub    $0xc,%esp
c0100928:	68 96 b1 10 c0       	push   $0xc010b196
c010092d:	e8 3f 80 00 00       	call   c0108971 <spin>
c0100932:	83 c4 10             	add    $0x10,%esp
c0100935:	90                   	nop
c0100936:	eb 04                	jmp    c010093c <hd_handle+0x103>
c0100938:	90                   	nop
c0100939:	eb 01                	jmp    c010093c <hd_handle+0x103>
c010093b:	90                   	nop
c010093c:	c9                   	leave  
c010093d:	c3                   	ret    

c010093e <hd_cmd_out>:
c010093e:	55                   	push   %ebp
c010093f:	89 e5                	mov    %esp,%ebp
c0100941:	83 ec 08             	sub    $0x8,%esp
c0100944:	83 ec 04             	sub    $0x4,%esp
c0100947:	68 18 73 01 00       	push   $0x17318
c010094c:	6a 00                	push   $0x0
c010094e:	68 80 00 00 00       	push   $0x80
c0100953:	e8 ef 0b 00 00       	call   c0101547 <waitfor>
c0100958:	83 c4 10             	add    $0x10,%esp
c010095b:	85 c0                	test   %eax,%eax
c010095d:	75 10                	jne    c010096f <hd_cmd_out+0x31>
c010095f:	83 ec 0c             	sub    $0xc,%esp
c0100962:	68 a8 b1 10 c0       	push   $0xc010b1a8
c0100967:	e8 2b 80 00 00       	call   c0108997 <panic>
c010096c:	83 c4 10             	add    $0x10,%esp
c010096f:	83 ec 08             	sub    $0x8,%esp
c0100972:	6a 00                	push   $0x0
c0100974:	68 f6 03 00 00       	push   $0x3f6
c0100979:	e8 6d f9 ff ff       	call   c01002eb <out_byte>
c010097e:	83 c4 10             	add    $0x10,%esp
c0100981:	8b 45 08             	mov    0x8(%ebp),%eax
c0100984:	0f b6 00             	movzbl (%eax),%eax
c0100987:	0f b6 c0             	movzbl %al,%eax
c010098a:	83 ec 08             	sub    $0x8,%esp
c010098d:	50                   	push   %eax
c010098e:	68 f1 01 00 00       	push   $0x1f1
c0100993:	e8 53 f9 ff ff       	call   c01002eb <out_byte>
c0100998:	83 c4 10             	add    $0x10,%esp
c010099b:	8b 45 08             	mov    0x8(%ebp),%eax
c010099e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01009a2:	0f b6 c0             	movzbl %al,%eax
c01009a5:	83 ec 08             	sub    $0x8,%esp
c01009a8:	50                   	push   %eax
c01009a9:	68 f2 01 00 00       	push   $0x1f2
c01009ae:	e8 38 f9 ff ff       	call   c01002eb <out_byte>
c01009b3:	83 c4 10             	add    $0x10,%esp
c01009b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01009b9:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c01009bd:	0f b6 c0             	movzbl %al,%eax
c01009c0:	83 ec 08             	sub    $0x8,%esp
c01009c3:	50                   	push   %eax
c01009c4:	68 f3 01 00 00       	push   $0x1f3
c01009c9:	e8 1d f9 ff ff       	call   c01002eb <out_byte>
c01009ce:	83 c4 10             	add    $0x10,%esp
c01009d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01009d4:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c01009d8:	0f b6 c0             	movzbl %al,%eax
c01009db:	83 ec 08             	sub    $0x8,%esp
c01009de:	50                   	push   %eax
c01009df:	68 f4 01 00 00       	push   $0x1f4
c01009e4:	e8 02 f9 ff ff       	call   c01002eb <out_byte>
c01009e9:	83 c4 10             	add    $0x10,%esp
c01009ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01009ef:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c01009f3:	0f b6 c0             	movzbl %al,%eax
c01009f6:	83 ec 08             	sub    $0x8,%esp
c01009f9:	50                   	push   %eax
c01009fa:	68 f5 01 00 00       	push   $0x1f5
c01009ff:	e8 e7 f8 ff ff       	call   c01002eb <out_byte>
c0100a04:	83 c4 10             	add    $0x10,%esp
c0100a07:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a0a:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0100a0e:	0f b6 c0             	movzbl %al,%eax
c0100a11:	83 ec 08             	sub    $0x8,%esp
c0100a14:	50                   	push   %eax
c0100a15:	68 f6 01 00 00       	push   $0x1f6
c0100a1a:	e8 cc f8 ff ff       	call   c01002eb <out_byte>
c0100a1f:	83 c4 10             	add    $0x10,%esp
c0100a22:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a25:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100a29:	0f b6 c0             	movzbl %al,%eax
c0100a2c:	83 ec 08             	sub    $0x8,%esp
c0100a2f:	50                   	push   %eax
c0100a30:	68 f7 01 00 00       	push   $0x1f7
c0100a35:	e8 b1 f8 ff ff       	call   c01002eb <out_byte>
c0100a3a:	83 c4 10             	add    $0x10,%esp
c0100a3d:	90                   	nop
c0100a3e:	c9                   	leave  
c0100a3f:	c3                   	ret    

c0100a40 <hd_identify>:
c0100a40:	55                   	push   %ebp
c0100a41:	89 e5                	mov    %esp,%ebp
c0100a43:	53                   	push   %ebx
c0100a44:	83 ec 24             	sub    $0x24,%esp
c0100a47:	89 e0                	mov    %esp,%eax
c0100a49:	89 c3                	mov    %eax,%ebx
c0100a4b:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0100a4f:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100a53:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100a57:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100a5b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0100a5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a62:	c1 e0 04             	shl    $0x4,%eax
c0100a65:	83 c8 e0             	or     $0xffffffe0,%eax
c0100a68:	88 45 ea             	mov    %al,-0x16(%ebp)
c0100a6b:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0100a6f:	83 ec 0c             	sub    $0xc,%esp
c0100a72:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100a75:	50                   	push   %eax
c0100a76:	e8 c3 fe ff ff       	call   c010093e <hd_cmd_out>
c0100a7b:	83 c4 10             	add    $0x10,%esp
c0100a7e:	e8 f0 06 00 00       	call   c0101173 <interrupt_wait>
c0100a83:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100a8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a8d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100a90:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100a93:	89 c2                	mov    %eax,%edx
c0100a95:	b8 10 00 00 00       	mov    $0x10,%eax
c0100a9a:	83 e8 01             	sub    $0x1,%eax
c0100a9d:	01 d0                	add    %edx,%eax
c0100a9f:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100aa4:	ba 00 00 00 00       	mov    $0x0,%edx
c0100aa9:	f7 f1                	div    %ecx
c0100aab:	6b c0 10             	imul   $0x10,%eax,%eax
c0100aae:	29 c4                	sub    %eax,%esp
c0100ab0:	89 e0                	mov    %esp,%eax
c0100ab2:	83 c0 00             	add    $0x0,%eax
c0100ab5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100ab8:	83 ec 04             	sub    $0x4,%esp
c0100abb:	ff 75 f4             	pushl  -0xc(%ebp)
c0100abe:	6a 00                	push   $0x0
c0100ac0:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ac3:	e8 27 b7 00 00       	call   c010c1ef <Memset>
c0100ac8:	83 c4 10             	add    $0x10,%esp
c0100acb:	83 ec 04             	sub    $0x4,%esp
c0100ace:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ad1:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ad4:	68 f0 01 00 00       	push   $0x1f0
c0100ad9:	e8 65 b7 00 00       	call   c010c243 <read_port>
c0100ade:	83 c4 10             	add    $0x10,%esp
c0100ae1:	83 ec 0c             	sub    $0xc,%esp
c0100ae4:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ae7:	e8 0b 00 00 00       	call   c0100af7 <print_hdinfo>
c0100aec:	83 c4 10             	add    $0x10,%esp
c0100aef:	89 dc                	mov    %ebx,%esp
c0100af1:	90                   	nop
c0100af2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100af5:	c9                   	leave  
c0100af6:	c3                   	ret    

c0100af7 <print_hdinfo>:
c0100af7:	55                   	push   %ebp
c0100af8:	89 e5                	mov    %esp,%ebp
c0100afa:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100b00:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100b06:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100b0c:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100b13:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100b1a:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100b21:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100b28:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100b2f:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100b35:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100b3b:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100b42:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100b49:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100b50:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100b57:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100b5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100b65:	e9 8f 00 00 00       	jmp    c0100bf9 <print_hdinfo+0x102>
c0100b6a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100b71:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100b74:	89 d0                	mov    %edx,%eax
c0100b76:	01 c0                	add    %eax,%eax
c0100b78:	01 d0                	add    %edx,%eax
c0100b7a:	c1 e0 03             	shl    $0x3,%eax
c0100b7d:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100b80:	01 c8                	add    %ecx,%eax
c0100b82:	83 e8 44             	sub    $0x44,%eax
c0100b85:	0f b7 00             	movzwl (%eax),%eax
c0100b88:	0f b7 c0             	movzwl %ax,%eax
c0100b8b:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100b8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b91:	01 d0                	add    %edx,%eax
c0100b93:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100b96:	eb 30                	jmp    c0100bc8 <print_hdinfo+0xd1>
c0100b98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100b9b:	8d 50 01             	lea    0x1(%eax),%edx
c0100b9e:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100ba1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100ba4:	83 c2 01             	add    $0x1,%edx
c0100ba7:	0f b6 00             	movzbl (%eax),%eax
c0100baa:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100bae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bb1:	8d 50 01             	lea    0x1(%eax),%edx
c0100bb4:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100bb7:	0f b6 00             	movzbl (%eax),%eax
c0100bba:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100bbd:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100bc0:	01 ca                	add    %ecx,%edx
c0100bc2:	88 02                	mov    %al,(%edx)
c0100bc4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100bc8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100bcb:	89 d0                	mov    %edx,%eax
c0100bcd:	01 c0                	add    %eax,%eax
c0100bcf:	01 d0                	add    %edx,%eax
c0100bd1:	c1 e0 03             	shl    $0x3,%eax
c0100bd4:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100bd7:	01 c8                	add    %ecx,%eax
c0100bd9:	83 e8 42             	sub    $0x42,%eax
c0100bdc:	0f b7 00             	movzwl (%eax),%eax
c0100bdf:	66 d1 e8             	shr    %ax
c0100be2:	0f b7 c0             	movzwl %ax,%eax
c0100be5:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100be8:	7c ae                	jl     c0100b98 <print_hdinfo+0xa1>
c0100bea:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100bed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100bf0:	01 d0                	add    %edx,%eax
c0100bf2:	c6 00 00             	movb   $0x0,(%eax)
c0100bf5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100bf9:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100bfd:	0f 8e 67 ff ff ff    	jle    c0100b6a <print_hdinfo+0x73>
c0100c03:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c06:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100c0a:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100c0e:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100c12:	66 c1 e8 08          	shr    $0x8,%ax
c0100c16:	66 85 c0             	test   %ax,%ax
c0100c19:	0f 95 c0             	setne  %al
c0100c1c:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100c1f:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100c26:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100c2c:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100c30:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100c34:	75 15                	jne    c0100c4b <print_hdinfo+0x154>
c0100c36:	83 ec 08             	sub    $0x8,%esp
c0100c39:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100c3c:	50                   	push   %eax
c0100c3d:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c40:	50                   	push   %eax
c0100c41:	e8 c8 b5 00 00       	call   c010c20e <Strcpy>
c0100c46:	83 c4 10             	add    $0x10,%esp
c0100c49:	eb 13                	jmp    c0100c5e <print_hdinfo+0x167>
c0100c4b:	83 ec 08             	sub    $0x8,%esp
c0100c4e:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c51:	50                   	push   %eax
c0100c52:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c55:	50                   	push   %eax
c0100c56:	e8 b3 b5 00 00       	call   c010c20e <Strcpy>
c0100c5b:	83 c4 10             	add    $0x10,%esp
c0100c5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c61:	83 c0 7a             	add    $0x7a,%eax
c0100c64:	0f b7 00             	movzwl (%eax),%eax
c0100c67:	0f b7 d0             	movzwl %ax,%edx
c0100c6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c6d:	83 c0 78             	add    $0x78,%eax
c0100c70:	0f b7 00             	movzwl (%eax),%eax
c0100c73:	0f b7 c0             	movzwl %ax,%eax
c0100c76:	83 c0 10             	add    $0x10,%eax
c0100c79:	89 c1                	mov    %eax,%ecx
c0100c7b:	d3 e2                	shl    %cl,%edx
c0100c7d:	89 d0                	mov    %edx,%eax
c0100c7f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100c82:	90                   	nop
c0100c83:	c9                   	leave  
c0100c84:	c3                   	ret    

c0100c85 <print_dpt_entry>:
c0100c85:	55                   	push   %ebp
c0100c86:	89 e5                	mov    %esp,%ebp
c0100c88:	83 ec 08             	sub    $0x8,%esp
c0100c8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c8e:	8b 40 08             	mov    0x8(%eax),%eax
c0100c91:	83 ec 08             	sub    $0x8,%esp
c0100c94:	50                   	push   %eax
c0100c95:	68 b2 b1 10 c0       	push   $0xc010b1b2
c0100c9a:	e8 b9 79 00 00       	call   c0108658 <Printf>
c0100c9f:	83 c4 10             	add    $0x10,%esp
c0100ca2:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ca5:	8b 40 0c             	mov    0xc(%eax),%eax
c0100ca8:	83 ec 08             	sub    $0x8,%esp
c0100cab:	50                   	push   %eax
c0100cac:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100cb1:	e8 a2 79 00 00       	call   c0108658 <Printf>
c0100cb6:	83 c4 10             	add    $0x10,%esp
c0100cb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cbc:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100cc0:	0f b6 c0             	movzbl %al,%eax
c0100cc3:	83 ec 08             	sub    $0x8,%esp
c0100cc6:	50                   	push   %eax
c0100cc7:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100ccc:	e8 87 79 00 00       	call   c0108658 <Printf>
c0100cd1:	83 c4 10             	add    $0x10,%esp
c0100cd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cd7:	0f b6 00             	movzbl (%eax),%eax
c0100cda:	0f b6 c0             	movzbl %al,%eax
c0100cdd:	83 ec 08             	sub    $0x8,%esp
c0100ce0:	50                   	push   %eax
c0100ce1:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100ce6:	e8 6d 79 00 00       	call   c0108658 <Printf>
c0100ceb:	83 c4 10             	add    $0x10,%esp
c0100cee:	90                   	nop
c0100cef:	c9                   	leave  
c0100cf0:	c3                   	ret    

c0100cf1 <get_partition_table>:
c0100cf1:	55                   	push   %ebp
c0100cf2:	89 e5                	mov    %esp,%ebp
c0100cf4:	53                   	push   %ebx
c0100cf5:	83 ec 24             	sub    $0x24,%esp
c0100cf8:	89 e0                	mov    %esp,%eax
c0100cfa:	89 c3                	mov    %eax,%ebx
c0100cfc:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100d00:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100d04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d07:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100d0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d0d:	c1 f8 08             	sar    $0x8,%eax
c0100d10:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100d13:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d16:	c1 f8 10             	sar    $0x10,%eax
c0100d19:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100d1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d1f:	c1 f8 18             	sar    $0x18,%eax
c0100d22:	89 c2                	mov    %eax,%edx
c0100d24:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d27:	c1 e0 04             	shl    $0x4,%eax
c0100d2a:	09 d0                	or     %edx,%eax
c0100d2c:	83 c8 e0             	or     $0xffffffe0,%eax
c0100d2f:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100d32:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100d36:	83 ec 0c             	sub    $0xc,%esp
c0100d39:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100d3c:	50                   	push   %eax
c0100d3d:	e8 fc fb ff ff       	call   c010093e <hd_cmd_out>
c0100d42:	83 c4 10             	add    $0x10,%esp
c0100d45:	e8 29 04 00 00       	call   c0101173 <interrupt_wait>
c0100d4a:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100d51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d54:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100d57:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100d5a:	89 c2                	mov    %eax,%edx
c0100d5c:	b8 10 00 00 00       	mov    $0x10,%eax
c0100d61:	83 e8 01             	sub    $0x1,%eax
c0100d64:	01 d0                	add    %edx,%eax
c0100d66:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100d6b:	ba 00 00 00 00       	mov    $0x0,%edx
c0100d70:	f7 f1                	div    %ecx
c0100d72:	6b c0 10             	imul   $0x10,%eax,%eax
c0100d75:	29 c4                	sub    %eax,%esp
c0100d77:	89 e0                	mov    %esp,%eax
c0100d79:	83 c0 00             	add    $0x0,%eax
c0100d7c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100d7f:	83 ec 04             	sub    $0x4,%esp
c0100d82:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d85:	6a 00                	push   $0x0
c0100d87:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d8a:	e8 60 b4 00 00       	call   c010c1ef <Memset>
c0100d8f:	83 c4 10             	add    $0x10,%esp
c0100d92:	83 ec 04             	sub    $0x4,%esp
c0100d95:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d98:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d9b:	68 f0 01 00 00       	push   $0x1f0
c0100da0:	e8 9e b4 00 00       	call   c010c243 <read_port>
c0100da5:	83 c4 10             	add    $0x10,%esp
c0100da8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100dab:	05 be 01 00 00       	add    $0x1be,%eax
c0100db0:	83 ec 04             	sub    $0x4,%esp
c0100db3:	6a 40                	push   $0x40
c0100db5:	50                   	push   %eax
c0100db6:	ff 75 10             	pushl  0x10(%ebp)
c0100db9:	e8 de 5f 00 00       	call   c0106d9c <Memcpy>
c0100dbe:	83 c4 10             	add    $0x10,%esp
c0100dc1:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100dc8:	89 dc                	mov    %ebx,%esp
c0100dca:	90                   	nop
c0100dcb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100dce:	c9                   	leave  
c0100dcf:	c3                   	ret    

c0100dd0 <partition>:
c0100dd0:	55                   	push   %ebp
c0100dd1:	89 e5                	mov    %esp,%ebp
c0100dd3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100dd9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100ddc:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100ddf:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100de3:	7f 19                	jg     c0100dfe <partition+0x2e>
c0100de5:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100de8:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100ded:	89 c8                	mov    %ecx,%eax
c0100def:	f7 ea                	imul   %edx
c0100df1:	d1 fa                	sar    %edx
c0100df3:	89 c8                	mov    %ecx,%eax
c0100df5:	c1 f8 1f             	sar    $0x1f,%eax
c0100df8:	29 c2                	sub    %eax,%edx
c0100dfa:	89 d0                	mov    %edx,%eax
c0100dfc:	eb 11                	jmp    c0100e0f <partition+0x3f>
c0100dfe:	8b 45 08             	mov    0x8(%ebp),%eax
c0100e01:	83 e8 10             	sub    $0x10,%eax
c0100e04:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100e07:	85 c0                	test   %eax,%eax
c0100e09:	0f 48 c2             	cmovs  %edx,%eax
c0100e0c:	c1 f8 06             	sar    $0x6,%eax
c0100e0f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100e12:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100e16:	0f 85 cc 00 00 00    	jne    c0100ee8 <partition+0x118>
c0100e1c:	83 ec 04             	sub    $0x4,%esp
c0100e1f:	6a 40                	push   $0x40
c0100e21:	6a 00                	push   $0x0
c0100e23:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e26:	50                   	push   %eax
c0100e27:	e8 c3 b3 00 00       	call   c010c1ef <Memset>
c0100e2c:	83 c4 10             	add    $0x10,%esp
c0100e2f:	83 ec 04             	sub    $0x4,%esp
c0100e32:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e35:	50                   	push   %eax
c0100e36:	6a 00                	push   $0x0
c0100e38:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e3b:	e8 b1 fe ff ff       	call   c0100cf1 <get_partition_table>
c0100e40:	83 c4 10             	add    $0x10,%esp
c0100e43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e4a:	e9 8a 00 00 00       	jmp    c0100ed9 <partition+0x109>
c0100e4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e52:	83 c0 01             	add    $0x1,%eax
c0100e55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100e58:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e5b:	c1 e0 04             	shl    $0x4,%eax
c0100e5e:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e61:	01 c8                	add    %ecx,%eax
c0100e63:	83 e8 5c             	sub    $0x5c,%eax
c0100e66:	8b 00                	mov    (%eax),%eax
c0100e68:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e6b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e6e:	c1 e1 03             	shl    $0x3,%ecx
c0100e71:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e77:	01 ca                	add    %ecx,%edx
c0100e79:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100e7f:	89 02                	mov    %eax,(%edx)
c0100e81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e84:	c1 e0 04             	shl    $0x4,%eax
c0100e87:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e8a:	01 c8                	add    %ecx,%eax
c0100e8c:	83 e8 58             	sub    $0x58,%eax
c0100e8f:	8b 00                	mov    (%eax),%eax
c0100e91:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e94:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e97:	c1 e1 03             	shl    $0x3,%ecx
c0100e9a:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ea0:	01 ca                	add    %ecx,%edx
c0100ea2:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100ea8:	89 02                	mov    %eax,(%edx)
c0100eaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ead:	c1 e0 04             	shl    $0x4,%eax
c0100eb0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100eb3:	01 c8                	add    %ecx,%eax
c0100eb5:	83 e8 60             	sub    $0x60,%eax
c0100eb8:	0f b6 00             	movzbl (%eax),%eax
c0100ebb:	3c 05                	cmp    $0x5,%al
c0100ebd:	75 16                	jne    c0100ed5 <partition+0x105>
c0100ebf:	8b 55 08             	mov    0x8(%ebp),%edx
c0100ec2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ec5:	01 d0                	add    %edx,%eax
c0100ec7:	83 ec 08             	sub    $0x8,%esp
c0100eca:	6a 01                	push   $0x1
c0100ecc:	50                   	push   %eax
c0100ecd:	e8 fe fe ff ff       	call   c0100dd0 <partition>
c0100ed2:	83 c4 10             	add    $0x10,%esp
c0100ed5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100ed9:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100edd:	0f 8e 6c ff ff ff    	jle    c0100e4f <partition+0x7f>
c0100ee3:	e9 ff 00 00 00       	jmp    c0100fe7 <partition+0x217>
c0100ee8:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100eec:	0f 85 f5 00 00 00    	jne    c0100fe7 <partition+0x217>
c0100ef2:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100ef5:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100efa:	89 c8                	mov    %ecx,%eax
c0100efc:	f7 ea                	imul   %edx
c0100efe:	d1 fa                	sar    %edx
c0100f00:	89 c8                	mov    %ecx,%eax
c0100f02:	c1 f8 1f             	sar    $0x1f,%eax
c0100f05:	29 c2                	sub    %eax,%edx
c0100f07:	89 d0                	mov    %edx,%eax
c0100f09:	c1 e0 02             	shl    $0x2,%eax
c0100f0c:	01 d0                	add    %edx,%eax
c0100f0e:	29 c1                	sub    %eax,%ecx
c0100f10:	89 c8                	mov    %ecx,%eax
c0100f12:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100f15:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100f18:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f1b:	c1 e2 03             	shl    $0x3,%edx
c0100f1e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f24:	01 d0                	add    %edx,%eax
c0100f26:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f2b:	8b 00                	mov    (%eax),%eax
c0100f2d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100f30:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f33:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f36:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100f39:	83 e8 01             	sub    $0x1,%eax
c0100f3c:	c1 e0 04             	shl    $0x4,%eax
c0100f3f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100f42:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100f49:	e9 8c 00 00 00       	jmp    c0100fda <partition+0x20a>
c0100f4e:	83 ec 04             	sub    $0x4,%esp
c0100f51:	6a 40                	push   $0x40
c0100f53:	6a 00                	push   $0x0
c0100f55:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f58:	50                   	push   %eax
c0100f59:	e8 91 b2 00 00       	call   c010c1ef <Memset>
c0100f5e:	83 c4 10             	add    $0x10,%esp
c0100f61:	83 ec 04             	sub    $0x4,%esp
c0100f64:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f67:	50                   	push   %eax
c0100f68:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f6b:	ff 75 e8             	pushl  -0x18(%ebp)
c0100f6e:	e8 7e fd ff ff       	call   c0100cf1 <get_partition_table>
c0100f73:	83 c4 10             	add    $0x10,%esp
c0100f76:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100f79:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f7c:	01 d0                	add    %edx,%eax
c0100f7e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100f81:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100f84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f87:	01 c2                	add    %eax,%edx
c0100f89:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100f8c:	8d 48 04             	lea    0x4(%eax),%ecx
c0100f8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f92:	c1 e1 03             	shl    $0x3,%ecx
c0100f95:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f9b:	01 c8                	add    %ecx,%eax
c0100f9d:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100fa2:	89 10                	mov    %edx,(%eax)
c0100fa4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100fa7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100faa:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100fad:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100fb0:	c1 e1 03             	shl    $0x3,%ecx
c0100fb3:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100fb9:	01 ca                	add    %ecx,%edx
c0100fbb:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100fc1:	89 02                	mov    %eax,(%edx)
c0100fc3:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100fc7:	84 c0                	test   %al,%al
c0100fc9:	74 1b                	je     c0100fe6 <partition+0x216>
c0100fcb:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100fce:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100fd1:	01 d0                	add    %edx,%eax
c0100fd3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100fd6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100fda:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100fde:	0f 8e 6a ff ff ff    	jle    c0100f4e <partition+0x17e>
c0100fe4:	eb 01                	jmp    c0100fe7 <partition+0x217>
c0100fe6:	90                   	nop
c0100fe7:	90                   	nop
c0100fe8:	c9                   	leave  
c0100fe9:	c3                   	ret    

c0100fea <hd_open>:
c0100fea:	55                   	push   %ebp
c0100feb:	89 e5                	mov    %esp,%ebp
c0100fed:	83 ec 18             	sub    $0x18,%esp
c0100ff0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100ff7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ffa:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101000:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0101005:	8b 00                	mov    (%eax),%eax
c0101007:	8d 50 01             	lea    0x1(%eax),%edx
c010100a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010100d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101013:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0101018:	89 10                	mov    %edx,(%eax)
c010101a:	83 ec 0c             	sub    $0xc,%esp
c010101d:	6a 00                	push   $0x0
c010101f:	e8 1c fa ff ff       	call   c0100a40 <hd_identify>
c0101024:	83 c4 10             	add    $0x10,%esp
c0101027:	83 ec 08             	sub    $0x8,%esp
c010102a:	6a 00                	push   $0x0
c010102c:	6a 00                	push   $0x0
c010102e:	e8 9d fd ff ff       	call   c0100dd0 <partition>
c0101033:	83 c4 10             	add    $0x10,%esp
c0101036:	83 ec 0c             	sub    $0xc,%esp
c0101039:	6a 7c                	push   $0x7c
c010103b:	e8 ac 06 00 00       	call   c01016ec <sys_malloc>
c0101040:	83 c4 10             	add    $0x10,%esp
c0101043:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101046:	83 ec 04             	sub    $0x4,%esp
c0101049:	6a 7c                	push   $0x7c
c010104b:	6a 00                	push   $0x0
c010104d:	ff 75 f0             	pushl  -0x10(%ebp)
c0101050:	e8 9a b1 00 00       	call   c010c1ef <Memset>
c0101055:	83 c4 10             	add    $0x10,%esp
c0101058:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010105b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101062:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101065:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010106c:	83 ec 04             	sub    $0x4,%esp
c010106f:	6a 02                	push   $0x2
c0101071:	ff 75 f0             	pushl  -0x10(%ebp)
c0101074:	6a 01                	push   $0x1
c0101076:	e8 aa 85 00 00       	call   c0109625 <send_rec>
c010107b:	83 c4 10             	add    $0x10,%esp
c010107e:	83 ec 08             	sub    $0x8,%esp
c0101081:	6a 7c                	push   $0x7c
c0101083:	ff 75 f0             	pushl  -0x10(%ebp)
c0101086:	e8 76 06 00 00       	call   c0101701 <sys_free>
c010108b:	83 c4 10             	add    $0x10,%esp
c010108e:	90                   	nop
c010108f:	c9                   	leave  
c0101090:	c3                   	ret    

c0101091 <get_hd_ioctl>:
c0101091:	55                   	push   %ebp
c0101092:	89 e5                	mov    %esp,%ebp
c0101094:	83 ec 18             	sub    $0x18,%esp
c0101097:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c010109b:	7f 19                	jg     c01010b6 <get_hd_ioctl+0x25>
c010109d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01010a0:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01010a5:	89 c8                	mov    %ecx,%eax
c01010a7:	f7 ea                	imul   %edx
c01010a9:	d1 fa                	sar    %edx
c01010ab:	89 c8                	mov    %ecx,%eax
c01010ad:	c1 f8 1f             	sar    $0x1f,%eax
c01010b0:	29 c2                	sub    %eax,%edx
c01010b2:	89 d0                	mov    %edx,%eax
c01010b4:	eb 11                	jmp    c01010c7 <get_hd_ioctl+0x36>
c01010b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01010b9:	83 e8 10             	sub    $0x10,%eax
c01010bc:	8d 50 3f             	lea    0x3f(%eax),%edx
c01010bf:	85 c0                	test   %eax,%eax
c01010c1:	0f 48 c2             	cmovs  %edx,%eax
c01010c4:	c1 f8 06             	sar    $0x6,%eax
c01010c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010ca:	8b 55 08             	mov    0x8(%ebp),%edx
c01010cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010d0:	c1 e2 03             	shl    $0x3,%edx
c01010d3:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01010d9:	01 d0                	add    %edx,%eax
c01010db:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c01010e0:	8b 00                	mov    (%eax),%eax
c01010e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01010e5:	83 ec 0c             	sub    $0xc,%esp
c01010e8:	6a 7c                	push   $0x7c
c01010ea:	e8 fd 05 00 00       	call   c01016ec <sys_malloc>
c01010ef:	83 c4 10             	add    $0x10,%esp
c01010f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01010f5:	83 ec 04             	sub    $0x4,%esp
c01010f8:	6a 7c                	push   $0x7c
c01010fa:	6a 00                	push   $0x0
c01010fc:	ff 75 ec             	pushl  -0x14(%ebp)
c01010ff:	e8 eb b0 00 00       	call   c010c1ef <Memset>
c0101104:	83 c4 10             	add    $0x10,%esp
c0101107:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010110a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101111:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101114:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010111b:	83 ec 04             	sub    $0x4,%esp
c010111e:	6a 02                	push   $0x2
c0101120:	ff 75 ec             	pushl  -0x14(%ebp)
c0101123:	6a 01                	push   $0x1
c0101125:	e8 fb 84 00 00       	call   c0109625 <send_rec>
c010112a:	83 c4 10             	add    $0x10,%esp
c010112d:	83 ec 08             	sub    $0x8,%esp
c0101130:	6a 7c                	push   $0x7c
c0101132:	ff 75 ec             	pushl  -0x14(%ebp)
c0101135:	e8 c7 05 00 00       	call   c0101701 <sys_free>
c010113a:	83 c4 10             	add    $0x10,%esp
c010113d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101140:	c9                   	leave  
c0101141:	c3                   	ret    

c0101142 <wait_for>:
c0101142:	55                   	push   %ebp
c0101143:	89 e5                	mov    %esp,%ebp
c0101145:	83 ec 08             	sub    $0x8,%esp
c0101148:	83 ec 04             	sub    $0x4,%esp
c010114b:	68 50 c3 00 00       	push   $0xc350
c0101150:	6a 08                	push   $0x8
c0101152:	6a 08                	push   $0x8
c0101154:	e8 ee 03 00 00       	call   c0101547 <waitfor>
c0101159:	83 c4 10             	add    $0x10,%esp
c010115c:	85 c0                	test   %eax,%eax
c010115e:	75 10                	jne    c0101170 <wait_for+0x2e>
c0101160:	83 ec 0c             	sub    $0xc,%esp
c0101163:	68 e4 b1 10 c0       	push   $0xc010b1e4
c0101168:	e8 2a 78 00 00       	call   c0108997 <panic>
c010116d:	83 c4 10             	add    $0x10,%esp
c0101170:	90                   	nop
c0101171:	c9                   	leave  
c0101172:	c3                   	ret    

c0101173 <interrupt_wait>:
c0101173:	55                   	push   %ebp
c0101174:	89 e5                	mov    %esp,%ebp
c0101176:	83 ec 18             	sub    $0x18,%esp
c0101179:	83 ec 0c             	sub    $0xc,%esp
c010117c:	6a 7c                	push   $0x7c
c010117e:	e8 69 05 00 00       	call   c01016ec <sys_malloc>
c0101183:	83 c4 10             	add    $0x10,%esp
c0101186:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101189:	83 ec 04             	sub    $0x4,%esp
c010118c:	6a 7c                	push   $0x7c
c010118e:	6a 00                	push   $0x0
c0101190:	ff 75 f4             	pushl  -0xc(%ebp)
c0101193:	e8 57 b0 00 00       	call   c010c1ef <Memset>
c0101198:	83 c4 10             	add    $0x10,%esp
c010119b:	83 ec 04             	sub    $0x4,%esp
c010119e:	68 13 02 00 00       	push   $0x213
c01011a3:	ff 75 f4             	pushl  -0xc(%ebp)
c01011a6:	6a 02                	push   $0x2
c01011a8:	e8 78 84 00 00       	call   c0109625 <send_rec>
c01011ad:	83 c4 10             	add    $0x10,%esp
c01011b0:	83 ec 08             	sub    $0x8,%esp
c01011b3:	6a 7c                	push   $0x7c
c01011b5:	ff 75 f4             	pushl  -0xc(%ebp)
c01011b8:	e8 44 05 00 00       	call   c0101701 <sys_free>
c01011bd:	83 c4 10             	add    $0x10,%esp
c01011c0:	90                   	nop
c01011c1:	c9                   	leave  
c01011c2:	c3                   	ret    

c01011c3 <hd_rdwt>:
c01011c3:	55                   	push   %ebp
c01011c4:	89 e5                	mov    %esp,%ebp
c01011c6:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c01011cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01011cf:	8b 40 18             	mov    0x18(%eax),%eax
c01011d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01011d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01011d8:	8b 40 14             	mov    0x14(%eax),%eax
c01011db:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01011de:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01011e2:	7f 19                	jg     c01011fd <hd_rdwt+0x3a>
c01011e4:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c01011e7:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01011ec:	89 c8                	mov    %ecx,%eax
c01011ee:	f7 ea                	imul   %edx
c01011f0:	d1 fa                	sar    %edx
c01011f2:	89 c8                	mov    %ecx,%eax
c01011f4:	c1 f8 1f             	sar    $0x1f,%eax
c01011f7:	29 c2                	sub    %eax,%edx
c01011f9:	89 d0                	mov    %edx,%eax
c01011fb:	eb 11                	jmp    c010120e <hd_rdwt+0x4b>
c01011fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101200:	83 e8 10             	sub    $0x10,%eax
c0101203:	8d 50 3f             	lea    0x3f(%eax),%edx
c0101206:	85 c0                	test   %eax,%eax
c0101208:	0f 48 c2             	cmovs  %edx,%eax
c010120b:	c1 f8 06             	sar    $0x6,%eax
c010120e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101211:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101214:	8d 50 f0             	lea    -0x10(%eax),%edx
c0101217:	89 d0                	mov    %edx,%eax
c0101219:	c1 f8 1f             	sar    $0x1f,%eax
c010121c:	c1 e8 1a             	shr    $0x1a,%eax
c010121f:	01 c2                	add    %eax,%edx
c0101221:	83 e2 3f             	and    $0x3f,%edx
c0101224:	29 c2                	sub    %eax,%edx
c0101226:	89 d0                	mov    %edx,%eax
c0101228:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010122b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010122e:	c1 e8 09             	shr    $0x9,%eax
c0101231:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101234:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0101238:	7f 1a                	jg     c0101254 <hd_rdwt+0x91>
c010123a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010123d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101240:	c1 e2 03             	shl    $0x3,%edx
c0101243:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101249:	01 d0                	add    %edx,%eax
c010124b:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101250:	8b 00                	mov    (%eax),%eax
c0101252:	eb 1b                	jmp    c010126f <hd_rdwt+0xac>
c0101254:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101257:	8d 50 04             	lea    0x4(%eax),%edx
c010125a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010125d:	c1 e2 03             	shl    $0x3,%edx
c0101260:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101266:	01 d0                	add    %edx,%eax
c0101268:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010126d:	8b 00                	mov    (%eax),%eax
c010126f:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101272:	01 d0                	add    %edx,%eax
c0101274:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101277:	8b 45 08             	mov    0x8(%ebp),%eax
c010127a:	8b 40 0c             	mov    0xc(%eax),%eax
c010127d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101280:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101283:	05 ff 01 00 00       	add    $0x1ff,%eax
c0101288:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010128e:	85 c0                	test   %eax,%eax
c0101290:	0f 48 c2             	cmovs  %edx,%eax
c0101293:	c1 f8 09             	sar    $0x9,%eax
c0101296:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101299:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010129c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010129f:	8b 45 08             	mov    0x8(%ebp),%eax
c01012a2:	8b 40 10             	mov    0x10(%eax),%eax
c01012a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01012a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01012ab:	8b 00                	mov    (%eax),%eax
c01012ad:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01012b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01012b3:	83 ec 08             	sub    $0x8,%esp
c01012b6:	50                   	push   %eax
c01012b7:	ff 75 d0             	pushl  -0x30(%ebp)
c01012ba:	e8 70 4c 00 00       	call   c0105f2f <alloc_virtual_memory>
c01012bf:	83 c4 10             	add    $0x10,%esp
c01012c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01012c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01012c8:	8b 40 78             	mov    0x78(%eax),%eax
c01012cb:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01012ce:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01012d2:	74 22                	je     c01012f6 <hd_rdwt+0x133>
c01012d4:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01012d8:	74 1c                	je     c01012f6 <hd_rdwt+0x133>
c01012da:	68 ba 01 00 00       	push   $0x1ba
c01012df:	68 34 b1 10 c0       	push   $0xc010b134
c01012e4:	68 34 b1 10 c0       	push   $0xc010b134
c01012e9:	68 f6 b1 10 c0       	push   $0xc010b1f6
c01012ee:	e8 c2 76 00 00       	call   c01089b5 <assertion_failure>
c01012f3:	83 c4 10             	add    $0x10,%esp
c01012f6:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c01012fa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01012fd:	88 45 be             	mov    %al,-0x42(%ebp)
c0101300:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101303:	88 45 bf             	mov    %al,-0x41(%ebp)
c0101306:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101309:	c1 f8 08             	sar    $0x8,%eax
c010130c:	88 45 c0             	mov    %al,-0x40(%ebp)
c010130f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101312:	c1 f8 10             	sar    $0x10,%eax
c0101315:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0101318:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010131b:	c1 f8 18             	sar    $0x18,%eax
c010131e:	83 e0 0f             	and    $0xf,%eax
c0101321:	83 c8 e0             	or     $0xffffffe0,%eax
c0101324:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0101327:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c010132b:	75 07                	jne    c0101334 <hd_rdwt+0x171>
c010132d:	b8 20 00 00 00       	mov    $0x20,%eax
c0101332:	eb 05                	jmp    c0101339 <hd_rdwt+0x176>
c0101334:	b8 30 00 00 00       	mov    $0x30,%eax
c0101339:	88 45 c3             	mov    %al,-0x3d(%ebp)
c010133c:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101340:	3c 20                	cmp    $0x20,%al
c0101342:	74 24                	je     c0101368 <hd_rdwt+0x1a5>
c0101344:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101348:	3c 30                	cmp    $0x30,%al
c010134a:	74 1c                	je     c0101368 <hd_rdwt+0x1a5>
c010134c:	68 c8 01 00 00       	push   $0x1c8
c0101351:	68 34 b1 10 c0       	push   $0xc010b134
c0101356:	68 34 b1 10 c0       	push   $0xc010b134
c010135b:	68 14 b2 10 c0       	push   $0xc010b214
c0101360:	e8 50 76 00 00       	call   c01089b5 <assertion_failure>
c0101365:	83 c4 10             	add    $0x10,%esp
c0101368:	83 ec 0c             	sub    $0xc,%esp
c010136b:	8d 45 bd             	lea    -0x43(%ebp),%eax
c010136e:	50                   	push   %eax
c010136f:	e8 ca f5 ff ff       	call   c010093e <hd_cmd_out>
c0101374:	83 c4 10             	add    $0x10,%esp
c0101377:	e9 9c 00 00 00       	jmp    c0101418 <hd_rdwt+0x255>
c010137c:	b8 00 02 00 00       	mov    $0x200,%eax
c0101381:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c0101388:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c010138c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010138f:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101393:	75 51                	jne    c01013e6 <hd_rdwt+0x223>
c0101395:	e8 a8 fd ff ff       	call   c0101142 <wait_for>
c010139a:	e8 d4 fd ff ff       	call   c0101173 <interrupt_wait>
c010139f:	83 ec 04             	sub    $0x4,%esp
c01013a2:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013a5:	6a 00                	push   $0x0
c01013a7:	68 80 11 11 c0       	push   $0xc0111180
c01013ac:	e8 3e ae 00 00       	call   c010c1ef <Memset>
c01013b1:	83 c4 10             	add    $0x10,%esp
c01013b4:	83 ec 04             	sub    $0x4,%esp
c01013b7:	68 00 02 00 00       	push   $0x200
c01013bc:	68 80 11 11 c0       	push   $0xc0111180
c01013c1:	68 f0 01 00 00       	push   $0x1f0
c01013c6:	e8 78 ae 00 00       	call   c010c243 <read_port>
c01013cb:	83 c4 10             	add    $0x10,%esp
c01013ce:	83 ec 04             	sub    $0x4,%esp
c01013d1:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013d4:	68 80 11 11 c0       	push   $0xc0111180
c01013d9:	ff 75 f0             	pushl  -0x10(%ebp)
c01013dc:	e8 bb 59 00 00       	call   c0106d9c <Memcpy>
c01013e1:	83 c4 10             	add    $0x10,%esp
c01013e4:	eb 26                	jmp    c010140c <hd_rdwt+0x249>
c01013e6:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01013ea:	75 20                	jne    c010140c <hd_rdwt+0x249>
c01013ec:	e8 51 fd ff ff       	call   c0101142 <wait_for>
c01013f1:	83 ec 04             	sub    $0x4,%esp
c01013f4:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013f7:	ff 75 f0             	pushl  -0x10(%ebp)
c01013fa:	68 f0 01 00 00       	push   $0x1f0
c01013ff:	e8 53 ae 00 00       	call   c010c257 <write_port>
c0101404:	83 c4 10             	add    $0x10,%esp
c0101407:	e8 67 fd ff ff       	call   c0101173 <interrupt_wait>
c010140c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010140f:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101412:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101415:	01 45 f0             	add    %eax,-0x10(%ebp)
c0101418:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010141c:	0f 85 5a ff ff ff    	jne    c010137c <hd_rdwt+0x1b9>
c0101422:	83 ec 04             	sub    $0x4,%esp
c0101425:	6a 7c                	push   $0x7c
c0101427:	6a 00                	push   $0x0
c0101429:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010142f:	50                   	push   %eax
c0101430:	e8 ba ad 00 00       	call   c010c1ef <Memset>
c0101435:	83 c4 10             	add    $0x10,%esp
c0101438:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c010143f:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101446:	00 00 00 
c0101449:	83 ec 04             	sub    $0x4,%esp
c010144c:	6a 02                	push   $0x2
c010144e:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101454:	50                   	push   %eax
c0101455:	6a 01                	push   $0x1
c0101457:	e8 c9 81 00 00       	call   c0109625 <send_rec>
c010145c:	83 c4 10             	add    $0x10,%esp
c010145f:	90                   	nop
c0101460:	c9                   	leave  
c0101461:	c3                   	ret    

c0101462 <hd_handler>:
c0101462:	55                   	push   %ebp
c0101463:	89 e5                	mov    %esp,%ebp
c0101465:	83 ec 18             	sub    $0x18,%esp
c0101468:	83 ec 0c             	sub    $0xc,%esp
c010146b:	68 f7 01 00 00       	push   $0x1f7
c0101470:	e8 6a ee ff ff       	call   c01002df <in_byte>
c0101475:	83 c4 10             	add    $0x10,%esp
c0101478:	0f b6 c0             	movzbl %al,%eax
c010147b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010147e:	83 ec 0c             	sub    $0xc,%esp
c0101481:	6a 03                	push   $0x3
c0101483:	e8 37 84 00 00       	call   c01098bf <inform_int>
c0101488:	83 c4 10             	add    $0x10,%esp
c010148b:	90                   	nop
c010148c:	c9                   	leave  
c010148d:	c3                   	ret    

c010148e <net_handler>:
c010148e:	55                   	push   %ebp
c010148f:	89 e5                	mov    %esp,%ebp
c0101491:	83 ec 18             	sub    $0x18,%esp
c0101494:	83 ec 0c             	sub    $0xc,%esp
c0101497:	68 48 b2 10 c0       	push   $0xc010b248
c010149c:	e8 eb eb ff ff       	call   c010008c <disp_str>
c01014a1:	83 c4 10             	add    $0x10,%esp
c01014a4:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c01014a8:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
c01014ac:	83 ec 04             	sub    $0x4,%esp
c01014af:	6a 01                	push   $0x1
c01014b1:	8d 45 f6             	lea    -0xa(%ebp),%eax
c01014b4:	50                   	push   %eax
c01014b5:	8d 45 f7             	lea    -0x9(%ebp),%eax
c01014b8:	50                   	push   %eax
c01014b9:	e8 de 58 00 00       	call   c0106d9c <Memcpy>
c01014be:	83 c4 10             	add    $0x10,%esp
c01014c1:	83 ec 0c             	sub    $0xc,%esp
c01014c4:	68 6a b2 10 c0       	push   $0xc010b26a
c01014c9:	e8 be eb ff ff       	call   c010008c <disp_str>
c01014ce:	83 c4 10             	add    $0x10,%esp
c01014d1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01014d5:	83 e0 01             	and    $0x1,%eax
c01014d8:	0f b6 c0             	movzbl %al,%eax
c01014db:	83 ec 0c             	sub    $0xc,%esp
c01014de:	50                   	push   %eax
c01014df:	e8 a6 5c 00 00       	call   c010718a <disp_int>
c01014e4:	83 c4 10             	add    $0x10,%esp
c01014e7:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01014eb:	d0 e8                	shr    %al
c01014ed:	83 e0 01             	and    $0x1,%eax
c01014f0:	0f b6 c0             	movzbl %al,%eax
c01014f3:	83 ec 0c             	sub    $0xc,%esp
c01014f6:	50                   	push   %eax
c01014f7:	e8 8e 5c 00 00       	call   c010718a <disp_int>
c01014fc:	83 c4 10             	add    $0x10,%esp
c01014ff:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0101503:	c0 e8 02             	shr    $0x2,%al
c0101506:	83 e0 01             	and    $0x1,%eax
c0101509:	0f b6 c0             	movzbl %al,%eax
c010150c:	83 ec 0c             	sub    $0xc,%esp
c010150f:	50                   	push   %eax
c0101510:	e8 75 5c 00 00       	call   c010718a <disp_int>
c0101515:	83 c4 10             	add    $0x10,%esp
c0101518:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c010151c:	c0 e8 06             	shr    $0x6,%al
c010151f:	83 e0 01             	and    $0x1,%eax
c0101522:	0f b6 c0             	movzbl %al,%eax
c0101525:	83 ec 0c             	sub    $0xc,%esp
c0101528:	50                   	push   %eax
c0101529:	e8 5c 5c 00 00       	call   c010718a <disp_int>
c010152e:	83 c4 10             	add    $0x10,%esp
c0101531:	83 ec 0c             	sub    $0xc,%esp
c0101534:	68 6a b2 10 c0       	push   $0xc010b26a
c0101539:	e8 4e eb ff ff       	call   c010008c <disp_str>
c010153e:	83 c4 10             	add    $0x10,%esp
c0101541:	66 87 db             	xchg   %bx,%bx
c0101544:	90                   	nop
c0101545:	c9                   	leave  
c0101546:	c3                   	ret    

c0101547 <waitfor>:
c0101547:	55                   	push   %ebp
c0101548:	89 e5                	mov    %esp,%ebp
c010154a:	83 ec 18             	sub    $0x18,%esp
c010154d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101554:	eb 26                	jmp    c010157c <waitfor+0x35>
c0101556:	83 ec 0c             	sub    $0xc,%esp
c0101559:	68 f7 01 00 00       	push   $0x1f7
c010155e:	e8 7c ed ff ff       	call   c01002df <in_byte>
c0101563:	83 c4 10             	add    $0x10,%esp
c0101566:	0f b6 c0             	movzbl %al,%eax
c0101569:	23 45 08             	and    0x8(%ebp),%eax
c010156c:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010156f:	75 07                	jne    c0101578 <waitfor+0x31>
c0101571:	b8 01 00 00 00       	mov    $0x1,%eax
c0101576:	eb 11                	jmp    c0101589 <waitfor+0x42>
c0101578:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010157c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010157f:	3b 45 10             	cmp    0x10(%ebp),%eax
c0101582:	7c d2                	jl     c0101556 <waitfor+0xf>
c0101584:	b8 00 00 00 00       	mov    $0x0,%eax
c0101589:	c9                   	leave  
c010158a:	c3                   	ret    

c010158b <print_hd_info>:
c010158b:	55                   	push   %ebp
c010158c:	89 e5                	mov    %esp,%ebp
c010158e:	83 ec 18             	sub    $0x18,%esp
c0101591:	83 ec 0c             	sub    $0xc,%esp
c0101594:	68 82 b2 10 c0       	push   $0xc010b282
c0101599:	e8 ba 70 00 00       	call   c0108658 <Printf>
c010159e:	83 c4 10             	add    $0x10,%esp
c01015a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01015a8:	eb 3b                	jmp    c01015e5 <print_hd_info+0x5a>
c01015aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015ad:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01015b4:	85 c0                	test   %eax,%eax
c01015b6:	74 28                	je     c01015e0 <print_hd_info+0x55>
c01015b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015bb:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01015c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015c5:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01015cc:	ff 75 f4             	pushl  -0xc(%ebp)
c01015cf:	52                   	push   %edx
c01015d0:	50                   	push   %eax
c01015d1:	68 9f b2 10 c0       	push   $0xc010b29f
c01015d6:	e8 7d 70 00 00       	call   c0108658 <Printf>
c01015db:	83 c4 10             	add    $0x10,%esp
c01015de:	eb 01                	jmp    c01015e1 <print_hd_info+0x56>
c01015e0:	90                   	nop
c01015e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01015e5:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c01015e9:	7e bf                	jle    c01015aa <print_hd_info+0x1f>
c01015eb:	83 ec 0c             	sub    $0xc,%esp
c01015ee:	68 b7 b2 10 c0       	push   $0xc010b2b7
c01015f3:	e8 60 70 00 00       	call   c0108658 <Printf>
c01015f8:	83 c4 10             	add    $0x10,%esp
c01015fb:	83 ec 0c             	sub    $0xc,%esp
c01015fe:	68 d2 b2 10 c0       	push   $0xc010b2d2
c0101603:	e8 50 70 00 00       	call   c0108658 <Printf>
c0101608:	83 c4 10             	add    $0x10,%esp
c010160b:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0101612:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101619:	eb 44                	jmp    c010165f <print_hd_info+0xd4>
c010161b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010161e:	83 c0 04             	add    $0x4,%eax
c0101621:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101628:	85 c0                	test   %eax,%eax
c010162a:	74 2e                	je     c010165a <print_hd_info+0xcf>
c010162c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010162f:	83 c0 04             	add    $0x4,%eax
c0101632:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101639:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010163c:	83 c0 04             	add    $0x4,%eax
c010163f:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101646:	ff 75 f0             	pushl  -0x10(%ebp)
c0101649:	52                   	push   %edx
c010164a:	50                   	push   %eax
c010164b:	68 9f b2 10 c0       	push   $0xc010b29f
c0101650:	e8 03 70 00 00       	call   c0108658 <Printf>
c0101655:	83 c4 10             	add    $0x10,%esp
c0101658:	eb 01                	jmp    c010165b <print_hd_info+0xd0>
c010165a:	90                   	nop
c010165b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010165f:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101663:	7e b6                	jle    c010161b <print_hd_info+0x90>
c0101665:	83 ec 0c             	sub    $0xc,%esp
c0101668:	68 ef b2 10 c0       	push   $0xc010b2ef
c010166d:	e8 e6 6f 00 00       	call   c0108658 <Printf>
c0101672:	83 c4 10             	add    $0x10,%esp
c0101675:	90                   	nop
c0101676:	c9                   	leave  
c0101677:	c3                   	ret    

c0101678 <is_empty>:
c0101678:	55                   	push   %ebp
c0101679:	89 e5                	mov    %esp,%ebp
c010167b:	83 ec 10             	sub    $0x10,%esp
c010167e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0101685:	eb 1a                	jmp    c01016a1 <is_empty+0x29>
c0101687:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010168a:	8b 45 08             	mov    0x8(%ebp),%eax
c010168d:	01 d0                	add    %edx,%eax
c010168f:	0f b6 00             	movzbl (%eax),%eax
c0101692:	84 c0                	test   %al,%al
c0101694:	74 07                	je     c010169d <is_empty+0x25>
c0101696:	b8 00 00 00 00       	mov    $0x0,%eax
c010169b:	eb 11                	jmp    c01016ae <is_empty+0x36>
c010169d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01016a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01016a4:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01016a7:	7c de                	jl     c0101687 <is_empty+0xf>
c01016a9:	b8 01 00 00 00       	mov    $0x1,%eax
c01016ae:	c9                   	leave  
c01016af:	c3                   	ret    

c01016b0 <write_debug>:
c01016b0:	b8 02 00 00 00       	mov    $0x2,%eax
c01016b5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c01016b9:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c01016bd:	cd 90                	int    $0x90
c01016bf:	c3                   	ret    

c01016c0 <send_msg>:
c01016c0:	55                   	push   %ebp
c01016c1:	89 e5                	mov    %esp,%ebp
c01016c3:	53                   	push   %ebx
c01016c4:	51                   	push   %ecx
c01016c5:	b8 03 00 00 00       	mov    $0x3,%eax
c01016ca:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01016cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01016d0:	cd 90                	int    $0x90
c01016d2:	59                   	pop    %ecx
c01016d3:	5b                   	pop    %ebx
c01016d4:	5d                   	pop    %ebp
c01016d5:	c3                   	ret    

c01016d6 <receive_msg>:
c01016d6:	55                   	push   %ebp
c01016d7:	89 e5                	mov    %esp,%ebp
c01016d9:	53                   	push   %ebx
c01016da:	51                   	push   %ecx
c01016db:	b8 04 00 00 00       	mov    $0x4,%eax
c01016e0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01016e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01016e6:	cd 90                	int    $0x90
c01016e8:	59                   	pop    %ecx
c01016e9:	5b                   	pop    %ebx
c01016ea:	5d                   	pop    %ebp
c01016eb:	c3                   	ret    

c01016ec <sys_malloc>:
c01016ec:	56                   	push   %esi
c01016ed:	57                   	push   %edi
c01016ee:	53                   	push   %ebx
c01016ef:	55                   	push   %ebp
c01016f0:	89 e5                	mov    %esp,%ebp
c01016f2:	b8 05 00 00 00       	mov    $0x5,%eax
c01016f7:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01016fa:	cd 90                	int    $0x90
c01016fc:	5d                   	pop    %ebp
c01016fd:	5b                   	pop    %ebx
c01016fe:	5f                   	pop    %edi
c01016ff:	5e                   	pop    %esi
c0101700:	c3                   	ret    

c0101701 <sys_free>:
c0101701:	56                   	push   %esi
c0101702:	57                   	push   %edi
c0101703:	53                   	push   %ebx
c0101704:	55                   	push   %ebp
c0101705:	89 e5                	mov    %esp,%ebp
c0101707:	b8 06 00 00 00       	mov    $0x6,%eax
c010170c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010170f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0101712:	cd 90                	int    $0x90
c0101714:	5d                   	pop    %ebp
c0101715:	5b                   	pop    %ebx
c0101716:	5f                   	pop    %edi
c0101717:	5e                   	pop    %esi
c0101718:	c3                   	ret    

c0101719 <task_fs>:
c0101719:	55                   	push   %ebp
c010171a:	89 e5                	mov    %esp,%ebp
c010171c:	83 ec 28             	sub    $0x28,%esp
c010171f:	e8 bb 08 00 00       	call   c0101fdf <init_fs>
c0101724:	83 ec 0c             	sub    $0xc,%esp
c0101727:	6a 7c                	push   $0x7c
c0101729:	e8 be ff ff ff       	call   c01016ec <sys_malloc>
c010172e:	83 c4 10             	add    $0x10,%esp
c0101731:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101734:	83 ec 0c             	sub    $0xc,%esp
c0101737:	6a 7c                	push   $0x7c
c0101739:	e8 ae ff ff ff       	call   c01016ec <sys_malloc>
c010173e:	83 c4 10             	add    $0x10,%esp
c0101741:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101744:	83 ec 04             	sub    $0x4,%esp
c0101747:	6a 7c                	push   $0x7c
c0101749:	6a 00                	push   $0x0
c010174b:	ff 75 f4             	pushl  -0xc(%ebp)
c010174e:	e8 9c aa 00 00       	call   c010c1ef <Memset>
c0101753:	83 c4 10             	add    $0x10,%esp
c0101756:	83 ec 04             	sub    $0x4,%esp
c0101759:	6a 12                	push   $0x12
c010175b:	ff 75 f4             	pushl  -0xc(%ebp)
c010175e:	6a 02                	push   $0x2
c0101760:	e8 c0 7e 00 00       	call   c0109625 <send_rec>
c0101765:	83 c4 10             	add    $0x10,%esp
c0101768:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010176b:	8b 40 78             	mov    0x78(%eax),%eax
c010176e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101771:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101774:	8b 00                	mov    (%eax),%eax
c0101776:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101779:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010177c:	8b 40 50             	mov    0x50(%eax),%eax
c010177f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101782:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101785:	8b 40 68             	mov    0x68(%eax),%eax
c0101788:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010178b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010178e:	8b 00                	mov    (%eax),%eax
c0101790:	85 c0                	test   %eax,%eax
c0101792:	75 07                	jne    c010179b <task_fs+0x82>
c0101794:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010179b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c01017a2:	83 ec 0c             	sub    $0xc,%esp
c01017a5:	ff 75 e8             	pushl  -0x18(%ebp)
c01017a8:	e8 39 21 00 00       	call   c01038e6 <pid2proc>
c01017ad:	83 c4 10             	add    $0x10,%esp
c01017b0:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c01017b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01017b9:	74 37                	je     c01017f2 <task_fs+0xd9>
c01017bb:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01017bf:	74 31                	je     c01017f2 <task_fs+0xd9>
c01017c1:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01017c5:	74 2b                	je     c01017f2 <task_fs+0xd9>
c01017c7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01017cb:	74 25                	je     c01017f2 <task_fs+0xd9>
c01017cd:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01017d1:	74 1f                	je     c01017f2 <task_fs+0xd9>
c01017d3:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01017d7:	74 19                	je     c01017f2 <task_fs+0xd9>
c01017d9:	6a 7a                	push   $0x7a
c01017db:	68 10 b3 10 c0       	push   $0xc010b310
c01017e0:	68 10 b3 10 c0       	push   $0xc010b310
c01017e5:	68 20 b3 10 c0       	push   $0xc010b320
c01017ea:	e8 c6 71 00 00       	call   c01089b5 <assertion_failure>
c01017ef:	83 c4 10             	add    $0x10,%esp
c01017f2:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01017f6:	74 3a                	je     c0101832 <task_fs+0x119>
c01017f8:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01017fc:	7f 19                	jg     c0101817 <task_fs+0xfe>
c01017fe:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101802:	0f 84 10 01 00 00    	je     c0101918 <task_fs+0x1ff>
c0101808:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010180c:	0f 84 a1 00 00 00    	je     c01018b3 <task_fs+0x19a>
c0101812:	e9 ef 00 00 00       	jmp    c0101906 <task_fs+0x1ed>
c0101817:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c010181b:	74 50                	je     c010186d <task_fs+0x154>
c010181d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101821:	0f 84 c6 00 00 00    	je     c01018ed <task_fs+0x1d4>
c0101827:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010182b:	74 40                	je     c010186d <task_fs+0x154>
c010182d:	e9 d4 00 00 00       	jmp    c0101906 <task_fs+0x1ed>
c0101832:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101835:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010183c:	83 ec 0c             	sub    $0xc,%esp
c010183f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101842:	e8 ec 07 00 00       	call   c0102033 <do_open>
c0101847:	83 c4 10             	add    $0x10,%esp
c010184a:	89 c2                	mov    %eax,%edx
c010184c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010184f:	89 50 50             	mov    %edx,0x50(%eax)
c0101852:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101855:	8b 00                	mov    (%eax),%eax
c0101857:	83 ec 04             	sub    $0x4,%esp
c010185a:	50                   	push   %eax
c010185b:	ff 75 f4             	pushl  -0xc(%ebp)
c010185e:	6a 01                	push   $0x1
c0101860:	e8 c0 7d 00 00       	call   c0109625 <send_rec>
c0101865:	83 c4 10             	add    $0x10,%esp
c0101868:	e9 b2 00 00 00       	jmp    c010191f <task_fs+0x206>
c010186d:	83 ec 0c             	sub    $0xc,%esp
c0101870:	ff 75 f4             	pushl  -0xc(%ebp)
c0101873:	e8 19 19 00 00       	call   c0103191 <do_rdwt>
c0101878:	83 c4 10             	add    $0x10,%esp
c010187b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010187e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101882:	0f 84 96 00 00 00    	je     c010191e <task_fs+0x205>
c0101888:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010188b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101892:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101895:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101898:	89 50 60             	mov    %edx,0x60(%eax)
c010189b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010189e:	8b 00                	mov    (%eax),%eax
c01018a0:	83 ec 04             	sub    $0x4,%esp
c01018a3:	50                   	push   %eax
c01018a4:	ff 75 f4             	pushl  -0xc(%ebp)
c01018a7:	6a 01                	push   $0x1
c01018a9:	e8 77 7d 00 00       	call   c0109625 <send_rec>
c01018ae:	83 c4 10             	add    $0x10,%esp
c01018b1:	eb 6b                	jmp    c010191e <task_fs+0x205>
c01018b3:	83 ec 0c             	sub    $0xc,%esp
c01018b6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01018b9:	e8 f0 1d 00 00       	call   c01036ae <do_close>
c01018be:	83 c4 10             	add    $0x10,%esp
c01018c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018c4:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01018cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018ce:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01018d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018d8:	8b 00                	mov    (%eax),%eax
c01018da:	83 ec 04             	sub    $0x4,%esp
c01018dd:	50                   	push   %eax
c01018de:	ff 75 f4             	pushl  -0xc(%ebp)
c01018e1:	6a 01                	push   $0x1
c01018e3:	e8 3d 7d 00 00       	call   c0109625 <send_rec>
c01018e8:	83 c4 10             	add    $0x10,%esp
c01018eb:	eb 32                	jmp    c010191f <task_fs+0x206>
c01018ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018f0:	8b 40 68             	mov    0x68(%eax),%eax
c01018f3:	83 ec 04             	sub    $0x4,%esp
c01018f6:	50                   	push   %eax
c01018f7:	ff 75 f4             	pushl  -0xc(%ebp)
c01018fa:	6a 01                	push   $0x1
c01018fc:	e8 24 7d 00 00       	call   c0109625 <send_rec>
c0101901:	83 c4 10             	add    $0x10,%esp
c0101904:	eb 19                	jmp    c010191f <task_fs+0x206>
c0101906:	83 ec 0c             	sub    $0xc,%esp
c0101909:	68 83 b3 10 c0       	push   $0xc010b383
c010190e:	e8 84 70 00 00       	call   c0108997 <panic>
c0101913:	83 c4 10             	add    $0x10,%esp
c0101916:	eb 07                	jmp    c010191f <task_fs+0x206>
c0101918:	90                   	nop
c0101919:	e9 26 fe ff ff       	jmp    c0101744 <task_fs+0x2b>
c010191e:	90                   	nop
c010191f:	e9 20 fe ff ff       	jmp    c0101744 <task_fs+0x2b>

c0101924 <rd_wt>:
c0101924:	55                   	push   %ebp
c0101925:	89 e5                	mov    %esp,%ebp
c0101927:	83 ec 18             	sub    $0x18,%esp
c010192a:	83 ec 0c             	sub    $0xc,%esp
c010192d:	6a 7c                	push   $0x7c
c010192f:	e8 b8 fd ff ff       	call   c01016ec <sys_malloc>
c0101934:	83 c4 10             	add    $0x10,%esp
c0101937:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010193a:	83 ec 04             	sub    $0x4,%esp
c010193d:	6a 7c                	push   $0x7c
c010193f:	6a 00                	push   $0x0
c0101941:	ff 75 f4             	pushl  -0xc(%ebp)
c0101944:	e8 a6 a8 00 00       	call   c010c1ef <Memset>
c0101949:	83 c4 10             	add    $0x10,%esp
c010194c:	8b 55 18             	mov    0x18(%ebp),%edx
c010194f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101952:	89 50 78             	mov    %edx,0x78(%eax)
c0101955:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101958:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010195b:	89 50 14             	mov    %edx,0x14(%eax)
c010195e:	8b 55 10             	mov    0x10(%ebp),%edx
c0101961:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101964:	89 50 10             	mov    %edx,0x10(%eax)
c0101967:	8b 55 14             	mov    0x14(%ebp),%edx
c010196a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010196d:	89 50 0c             	mov    %edx,0xc(%eax)
c0101970:	8b 45 08             	mov    0x8(%ebp),%eax
c0101973:	c1 e0 09             	shl    $0x9,%eax
c0101976:	89 c2                	mov    %eax,%edx
c0101978:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010197b:	89 50 18             	mov    %edx,0x18(%eax)
c010197e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101982:	74 22                	je     c01019a6 <rd_wt+0x82>
c0101984:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101988:	74 1c                	je     c01019a6 <rd_wt+0x82>
c010198a:	68 b1 00 00 00       	push   $0xb1
c010198f:	68 10 b3 10 c0       	push   $0xc010b310
c0101994:	68 10 b3 10 c0       	push   $0xc010b310
c0101999:	68 96 b3 10 c0       	push   $0xc010b396
c010199e:	e8 12 70 00 00       	call   c01089b5 <assertion_failure>
c01019a3:	83 c4 10             	add    $0x10,%esp
c01019a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019a9:	8b 40 78             	mov    0x78(%eax),%eax
c01019ac:	83 f8 07             	cmp    $0x7,%eax
c01019af:	74 27                	je     c01019d8 <rd_wt+0xb4>
c01019b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019b4:	8b 40 78             	mov    0x78(%eax),%eax
c01019b7:	83 f8 0a             	cmp    $0xa,%eax
c01019ba:	74 1c                	je     c01019d8 <rd_wt+0xb4>
c01019bc:	68 b2 00 00 00       	push   $0xb2
c01019c1:	68 10 b3 10 c0       	push   $0xc010b310
c01019c6:	68 10 b3 10 c0       	push   $0xc010b310
c01019cb:	68 b4 b3 10 c0       	push   $0xc010b3b4
c01019d0:	e8 e0 6f 00 00       	call   c01089b5 <assertion_failure>
c01019d5:	83 c4 10             	add    $0x10,%esp
c01019d8:	83 ec 04             	sub    $0x4,%esp
c01019db:	6a 03                	push   $0x3
c01019dd:	ff 75 f4             	pushl  -0xc(%ebp)
c01019e0:	6a 03                	push   $0x3
c01019e2:	e8 3e 7c 00 00       	call   c0109625 <send_rec>
c01019e7:	83 c4 10             	add    $0x10,%esp
c01019ea:	83 ec 08             	sub    $0x8,%esp
c01019ed:	6a 7c                	push   $0x7c
c01019ef:	ff 75 f4             	pushl  -0xc(%ebp)
c01019f2:	e8 0a fd ff ff       	call   c0101701 <sys_free>
c01019f7:	83 c4 10             	add    $0x10,%esp
c01019fa:	90                   	nop
c01019fb:	c9                   	leave  
c01019fc:	c3                   	ret    

c01019fd <mkfs>:
c01019fd:	55                   	push   %ebp
c01019fe:	89 e5                	mov    %esp,%ebp
c0101a00:	57                   	push   %edi
c0101a01:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101a07:	83 ec 0c             	sub    $0xc,%esp
c0101a0a:	68 00 80 00 00       	push   $0x8000
c0101a0f:	e8 d8 fc ff ff       	call   c01016ec <sys_malloc>
c0101a14:	83 c4 10             	add    $0x10,%esp
c0101a17:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c0101a1c:	83 ec 0c             	sub    $0xc,%esp
c0101a1f:	6a 24                	push   $0x24
c0101a21:	e8 c6 fc ff ff       	call   c01016ec <sys_malloc>
c0101a26:	83 c4 10             	add    $0x10,%esp
c0101a29:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c0101a2e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a33:	83 ec 0c             	sub    $0xc,%esp
c0101a36:	50                   	push   %eax
c0101a37:	e8 42 46 00 00       	call   c010607e <get_physical_address>
c0101a3c:	83 c4 10             	add    $0x10,%esp
c0101a3f:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101a44:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101a49:	83 ec 0c             	sub    $0xc,%esp
c0101a4c:	50                   	push   %eax
c0101a4d:	e8 2c 46 00 00       	call   c010607e <get_physical_address>
c0101a52:	83 c4 10             	add    $0x10,%esp
c0101a55:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c0101a5a:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a5f:	83 ec 04             	sub    $0x4,%esp
c0101a62:	68 00 02 00 00       	push   $0x200
c0101a67:	6a 00                	push   $0x0
c0101a69:	50                   	push   %eax
c0101a6a:	e8 80 a7 00 00       	call   c010c1ef <Memset>
c0101a6f:	83 c4 10             	add    $0x10,%esp
c0101a72:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a77:	83 ec 0c             	sub    $0xc,%esp
c0101a7a:	6a 0a                	push   $0xa
c0101a7c:	68 00 02 00 00       	push   $0x200
c0101a81:	50                   	push   %eax
c0101a82:	6a 20                	push   $0x20
c0101a84:	6a 00                	push   $0x0
c0101a86:	e8 99 fe ff ff       	call   c0101924 <rd_wt>
c0101a8b:	83 c4 20             	add    $0x20,%esp
c0101a8e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a93:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101a96:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a99:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101aa0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101aa3:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0101aaa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101aad:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101ab4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ab7:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101abe:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ac1:	8b 40 04             	mov    0x4(%eax),%eax
c0101ac4:	8d 50 02             	lea    0x2(%eax),%edx
c0101ac7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101aca:	8b 40 08             	mov    0x8(%eax),%eax
c0101acd:	01 c2                	add    %eax,%edx
c0101acf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ad2:	8b 40 0c             	mov    0xc(%eax),%eax
c0101ad5:	01 c2                	add    %eax,%edx
c0101ad7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ada:	89 10                	mov    %edx,(%eax)
c0101adc:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101ae3:	b8 00 02 00 00       	mov    $0x200,%eax
c0101ae8:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101aeb:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101af1:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101af4:	01 ca                	add    %ecx,%edx
c0101af6:	83 ec 04             	sub    $0x4,%esp
c0101af9:	50                   	push   %eax
c0101afa:	6a 80                	push   $0xffffff80
c0101afc:	52                   	push   %edx
c0101afd:	e8 ed a6 00 00       	call   c010c1ef <Memset>
c0101b02:	83 c4 10             	add    $0x10,%esp
c0101b05:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b0a:	83 ec 0c             	sub    $0xc,%esp
c0101b0d:	6a 0a                	push   $0xa
c0101b0f:	68 00 02 00 00       	push   $0x200
c0101b14:	50                   	push   %eax
c0101b15:	6a 20                	push   $0x20
c0101b17:	6a 01                	push   $0x1
c0101b19:	e8 06 fe ff ff       	call   c0101924 <rd_wt>
c0101b1e:	83 c4 20             	add    $0x20,%esp
c0101b21:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101b24:	8b 10                	mov    (%eax),%edx
c0101b26:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101b29:	8b 50 04             	mov    0x4(%eax),%edx
c0101b2c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101b2f:	8b 50 08             	mov    0x8(%eax),%edx
c0101b32:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101b35:	8b 50 0c             	mov    0xc(%eax),%edx
c0101b38:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101b3b:	8b 50 10             	mov    0x10(%eax),%edx
c0101b3e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101b41:	8b 50 14             	mov    0x14(%eax),%edx
c0101b44:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101b47:	8b 50 18             	mov    0x18(%eax),%edx
c0101b4a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101b4d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101b50:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101b53:	8b 40 20             	mov    0x20(%eax),%eax
c0101b56:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101b59:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101b5d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101b61:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b66:	83 ec 04             	sub    $0x4,%esp
c0101b69:	6a 01                	push   $0x1
c0101b6b:	52                   	push   %edx
c0101b6c:	50                   	push   %eax
c0101b6d:	e8 7d a6 00 00       	call   c010c1ef <Memset>
c0101b72:	83 c4 10             	add    $0x10,%esp
c0101b75:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b7a:	83 c0 01             	add    $0x1,%eax
c0101b7d:	83 ec 04             	sub    $0x4,%esp
c0101b80:	68 ff 01 00 00       	push   $0x1ff
c0101b85:	6a 80                	push   $0xffffff80
c0101b87:	50                   	push   %eax
c0101b88:	e8 62 a6 00 00       	call   c010c1ef <Memset>
c0101b8d:	83 c4 10             	add    $0x10,%esp
c0101b90:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b95:	83 ec 0c             	sub    $0xc,%esp
c0101b98:	6a 0a                	push   $0xa
c0101b9a:	68 00 02 00 00       	push   $0x200
c0101b9f:	50                   	push   %eax
c0101ba0:	6a 20                	push   $0x20
c0101ba2:	6a 02                	push   $0x2
c0101ba4:	e8 7b fd ff ff       	call   c0101924 <rd_wt>
c0101ba9:	83 c4 20             	add    $0x20,%esp
c0101bac:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101bb3:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101bb8:	83 ec 04             	sub    $0x4,%esp
c0101bbb:	68 00 02 00 00       	push   $0x200
c0101bc0:	6a ff                	push   $0xffffffff
c0101bc2:	50                   	push   %eax
c0101bc3:	e8 27 a6 00 00       	call   c010c1ef <Memset>
c0101bc8:	83 c4 10             	add    $0x10,%esp
c0101bcb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101bd0:	83 ec 0c             	sub    $0xc,%esp
c0101bd3:	6a 0a                	push   $0xa
c0101bd5:	68 00 02 00 00       	push   $0x200
c0101bda:	50                   	push   %eax
c0101bdb:	6a 20                	push   $0x20
c0101bdd:	ff 75 d0             	pushl  -0x30(%ebp)
c0101be0:	e8 3f fd ff ff       	call   c0101924 <rd_wt>
c0101be5:	83 c4 20             	add    $0x20,%esp
c0101be8:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101bed:	83 ec 04             	sub    $0x4,%esp
c0101bf0:	6a 01                	push   $0x1
c0101bf2:	6a 01                	push   $0x1
c0101bf4:	50                   	push   %eax
c0101bf5:	e8 f5 a5 00 00       	call   c010c1ef <Memset>
c0101bfa:	83 c4 10             	add    $0x10,%esp
c0101bfd:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c02:	83 c0 01             	add    $0x1,%eax
c0101c05:	83 ec 04             	sub    $0x4,%esp
c0101c08:	68 ff 01 00 00       	push   $0x1ff
c0101c0d:	6a 00                	push   $0x0
c0101c0f:	50                   	push   %eax
c0101c10:	e8 da a5 00 00       	call   c010c1ef <Memset>
c0101c15:	83 c4 10             	add    $0x10,%esp
c0101c18:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c1d:	89 c2                	mov    %eax,%edx
c0101c1f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101c22:	83 c0 01             	add    $0x1,%eax
c0101c25:	83 ec 0c             	sub    $0xc,%esp
c0101c28:	6a 0a                	push   $0xa
c0101c2a:	68 00 02 00 00       	push   $0x200
c0101c2f:	52                   	push   %edx
c0101c30:	6a 20                	push   $0x20
c0101c32:	50                   	push   %eax
c0101c33:	e8 ec fc ff ff       	call   c0101924 <rd_wt>
c0101c38:	83 c4 20             	add    $0x20,%esp
c0101c3b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c3e:	83 e8 02             	sub    $0x2,%eax
c0101c41:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101c44:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101c4b:	eb 04                	jmp    c0101c51 <mkfs+0x254>
c0101c4d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101c51:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101c54:	83 c0 01             	add    $0x1,%eax
c0101c57:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101c5a:	7e f1                	jle    c0101c4d <mkfs+0x250>
c0101c5c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c61:	89 c2                	mov    %eax,%edx
c0101c63:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c66:	83 c0 03             	add    $0x3,%eax
c0101c69:	83 ec 0c             	sub    $0xc,%esp
c0101c6c:	6a 0a                	push   $0xa
c0101c6e:	68 00 02 00 00       	push   $0x200
c0101c73:	52                   	push   %edx
c0101c74:	6a 20                	push   $0x20
c0101c76:	50                   	push   %eax
c0101c77:	e8 a8 fc ff ff       	call   c0101924 <rd_wt>
c0101c7c:	83 c4 20             	add    $0x20,%esp
c0101c7f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c84:	89 c2                	mov    %eax,%edx
c0101c86:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c89:	83 c0 03             	add    $0x3,%eax
c0101c8c:	83 ec 0c             	sub    $0xc,%esp
c0101c8f:	6a 07                	push   $0x7
c0101c91:	68 00 02 00 00       	push   $0x200
c0101c96:	52                   	push   %edx
c0101c97:	6a 20                	push   $0x20
c0101c99:	50                   	push   %eax
c0101c9a:	e8 85 fc ff ff       	call   c0101924 <rd_wt>
c0101c9f:	83 c4 20             	add    $0x20,%esp
c0101ca2:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ca7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101caa:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cad:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101cb3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cb6:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101cbd:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101cc0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cc3:	89 50 08             	mov    %edx,0x8(%eax)
c0101cc6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cc9:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101cd0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cd3:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101cda:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cdd:	8b 10                	mov    (%eax),%edx
c0101cdf:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101ce5:	8b 50 04             	mov    0x4(%eax),%edx
c0101ce8:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101cee:	8b 50 08             	mov    0x8(%eax),%edx
c0101cf1:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101cf7:	8b 50 0c             	mov    0xc(%eax),%edx
c0101cfa:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101d00:	8b 50 10             	mov    0x10(%eax),%edx
c0101d03:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101d09:	8b 50 14             	mov    0x14(%eax),%edx
c0101d0c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101d12:	8b 50 18             	mov    0x18(%eax),%edx
c0101d15:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101d1b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101d1e:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101d24:	8b 50 20             	mov    0x20(%eax),%edx
c0101d27:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101d2d:	8b 40 24             	mov    0x24(%eax),%eax
c0101d30:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101d35:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101d3c:	eb 4c                	jmp    c0101d8a <mkfs+0x38d>
c0101d3e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d43:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101d46:	83 c2 01             	add    $0x1,%edx
c0101d49:	c1 e2 05             	shl    $0x5,%edx
c0101d4c:	01 d0                	add    %edx,%eax
c0101d4e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101d51:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d54:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101d5a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d5d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101d64:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d67:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101d6e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101d75:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101d78:	c1 e0 08             	shl    $0x8,%eax
c0101d7b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101d7e:	89 c2                	mov    %eax,%edx
c0101d80:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d83:	89 50 08             	mov    %edx,0x8(%eax)
c0101d86:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101d8a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101d8e:	7e ae                	jle    c0101d3e <mkfs+0x341>
c0101d90:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101d97:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101d9d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101da2:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101da7:	89 d7                	mov    %edx,%edi
c0101da9:	f3 ab                	rep stos %eax,%es:(%edi)
c0101dab:	c7 85 70 ff ff ff dc 	movl   $0xc010b3dc,-0x90(%ebp)
c0101db2:	b3 10 c0 
c0101db5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101dbc:	eb 54                	jmp    c0101e12 <mkfs+0x415>
c0101dbe:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101dc3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101dc6:	83 c2 04             	add    $0x4,%edx
c0101dc9:	c1 e2 05             	shl    $0x5,%edx
c0101dcc:	01 d0                	add    %edx,%eax
c0101dce:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101dd1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101dd4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101dda:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ddd:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101de4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101de7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101dea:	83 c2 01             	add    $0x1,%edx
c0101ded:	c1 e2 0b             	shl    $0xb,%edx
c0101df0:	01 c2                	add    %eax,%edx
c0101df2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101df5:	89 50 08             	mov    %edx,0x8(%eax)
c0101df8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101dfb:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101e02:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101e05:	8d 50 05             	lea    0x5(%eax),%edx
c0101e08:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e0b:	89 50 10             	mov    %edx,0x10(%eax)
c0101e0e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101e12:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101e15:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101e18:	7c a4                	jl     c0101dbe <mkfs+0x3c1>
c0101e1a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e1f:	89 c2                	mov    %eax,%edx
c0101e21:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101e24:	83 c0 03             	add    $0x3,%eax
c0101e27:	83 ec 0c             	sub    $0xc,%esp
c0101e2a:	6a 0a                	push   $0xa
c0101e2c:	68 00 02 00 00       	push   $0x200
c0101e31:	52                   	push   %edx
c0101e32:	6a 20                	push   $0x20
c0101e34:	50                   	push   %eax
c0101e35:	e8 ea fa ff ff       	call   c0101924 <rd_wt>
c0101e3a:	83 c4 20             	add    $0x20,%esp
c0101e3d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e42:	89 c2                	mov    %eax,%edx
c0101e44:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101e47:	83 ec 0c             	sub    $0xc,%esp
c0101e4a:	6a 07                	push   $0x7
c0101e4c:	68 00 02 00 00       	push   $0x200
c0101e51:	52                   	push   %edx
c0101e52:	6a 20                	push   $0x20
c0101e54:	50                   	push   %eax
c0101e55:	e8 ca fa ff ff       	call   c0101924 <rd_wt>
c0101e5a:	83 c4 20             	add    $0x20,%esp
c0101e5d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101e64:	00 00 00 
c0101e67:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101e6e:	2e 00 
c0101e70:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101e75:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101e78:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e7b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101e81:	83 ec 0c             	sub    $0xc,%esp
c0101e84:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101e8a:	50                   	push   %eax
c0101e8b:	e8 98 a3 00 00       	call   c010c228 <Strlen>
c0101e90:	83 c4 10             	add    $0x10,%esp
c0101e93:	89 c1                	mov    %eax,%ecx
c0101e95:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e98:	8d 50 04             	lea    0x4(%eax),%edx
c0101e9b:	83 ec 04             	sub    $0x4,%esp
c0101e9e:	51                   	push   %ecx
c0101e9f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101ea5:	50                   	push   %eax
c0101ea6:	52                   	push   %edx
c0101ea7:	e8 f0 4e 00 00       	call   c0106d9c <Memcpy>
c0101eac:	83 c4 10             	add    $0x10,%esp
c0101eaf:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101eb5:	b8 00 00 00 00       	mov    $0x0,%eax
c0101eba:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101ebf:	89 d7                	mov    %edx,%edi
c0101ec1:	f3 ab                	rep stos %eax,%es:(%edi)
c0101ec3:	c7 85 34 ff ff ff e8 	movl   $0xc010b3e8,-0xcc(%ebp)
c0101eca:	b3 10 c0 
c0101ecd:	c7 85 38 ff ff ff f1 	movl   $0xc010b3f1,-0xc8(%ebp)
c0101ed4:	b3 10 c0 
c0101ed7:	c7 85 3c ff ff ff fa 	movl   $0xc010b3fa,-0xc4(%ebp)
c0101ede:	b3 10 c0 
c0101ee1:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101ee8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101eef:	eb 49                	jmp    c0101f3a <mkfs+0x53d>
c0101ef1:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101ef5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101ef8:	8d 50 02             	lea    0x2(%eax),%edx
c0101efb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101efe:	89 10                	mov    %edx,(%eax)
c0101f00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101f03:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101f0a:	83 ec 0c             	sub    $0xc,%esp
c0101f0d:	50                   	push   %eax
c0101f0e:	e8 15 a3 00 00       	call   c010c228 <Strlen>
c0101f13:	83 c4 10             	add    $0x10,%esp
c0101f16:	89 c1                	mov    %eax,%ecx
c0101f18:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101f1b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101f22:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101f25:	83 c2 04             	add    $0x4,%edx
c0101f28:	83 ec 04             	sub    $0x4,%esp
c0101f2b:	51                   	push   %ecx
c0101f2c:	50                   	push   %eax
c0101f2d:	52                   	push   %edx
c0101f2e:	e8 69 4e 00 00       	call   c0106d9c <Memcpy>
c0101f33:	83 c4 10             	add    $0x10,%esp
c0101f36:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101f3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101f3d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101f40:	7c af                	jl     c0101ef1 <mkfs+0x4f4>
c0101f42:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101f49:	eb 66                	jmp    c0101fb1 <mkfs+0x5b4>
c0101f4b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f4e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101f55:	83 ec 0c             	sub    $0xc,%esp
c0101f58:	50                   	push   %eax
c0101f59:	e8 ca a2 00 00       	call   c010c228 <Strlen>
c0101f5e:	83 c4 10             	add    $0x10,%esp
c0101f61:	85 c0                	test   %eax,%eax
c0101f63:	74 47                	je     c0101fac <mkfs+0x5af>
c0101f65:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101f69:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f6c:	8d 50 05             	lea    0x5(%eax),%edx
c0101f6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f72:	89 10                	mov    %edx,(%eax)
c0101f74:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f77:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101f7e:	83 ec 0c             	sub    $0xc,%esp
c0101f81:	50                   	push   %eax
c0101f82:	e8 a1 a2 00 00       	call   c010c228 <Strlen>
c0101f87:	83 c4 10             	add    $0x10,%esp
c0101f8a:	89 c1                	mov    %eax,%ecx
c0101f8c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f8f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101f96:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101f99:	83 c2 04             	add    $0x4,%edx
c0101f9c:	83 ec 04             	sub    $0x4,%esp
c0101f9f:	51                   	push   %ecx
c0101fa0:	50                   	push   %eax
c0101fa1:	52                   	push   %edx
c0101fa2:	e8 f5 4d 00 00       	call   c0106d9c <Memcpy>
c0101fa7:	83 c4 10             	add    $0x10,%esp
c0101faa:	eb 01                	jmp    c0101fad <mkfs+0x5b0>
c0101fac:	90                   	nop
c0101fad:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101fb1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101fb4:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101fb7:	7c 92                	jl     c0101f4b <mkfs+0x54e>
c0101fb9:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101fbe:	89 c2                	mov    %eax,%edx
c0101fc0:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101fc3:	83 ec 0c             	sub    $0xc,%esp
c0101fc6:	6a 0a                	push   $0xa
c0101fc8:	68 00 02 00 00       	push   $0x200
c0101fcd:	52                   	push   %edx
c0101fce:	6a 20                	push   $0x20
c0101fd0:	50                   	push   %eax
c0101fd1:	e8 4e f9 ff ff       	call   c0101924 <rd_wt>
c0101fd6:	83 c4 20             	add    $0x20,%esp
c0101fd9:	90                   	nop
c0101fda:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101fdd:	c9                   	leave  
c0101fde:	c3                   	ret    

c0101fdf <init_fs>:
c0101fdf:	55                   	push   %ebp
c0101fe0:	89 e5                	mov    %esp,%ebp
c0101fe2:	83 ec 18             	sub    $0x18,%esp
c0101fe5:	83 ec 0c             	sub    $0xc,%esp
c0101fe8:	6a 7c                	push   $0x7c
c0101fea:	e8 fd f6 ff ff       	call   c01016ec <sys_malloc>
c0101fef:	83 c4 10             	add    $0x10,%esp
c0101ff2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101ff5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ff8:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101fff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102002:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0102009:	83 ec 04             	sub    $0x4,%esp
c010200c:	6a 03                	push   $0x3
c010200e:	ff 75 f4             	pushl  -0xc(%ebp)
c0102011:	6a 03                	push   $0x3
c0102013:	e8 0d 76 00 00       	call   c0109625 <send_rec>
c0102018:	83 c4 10             	add    $0x10,%esp
c010201b:	e8 dd f9 ff ff       	call   c01019fd <mkfs>
c0102020:	83 ec 08             	sub    $0x8,%esp
c0102023:	6a 7c                	push   $0x7c
c0102025:	ff 75 f4             	pushl  -0xc(%ebp)
c0102028:	e8 d4 f6 ff ff       	call   c0101701 <sys_free>
c010202d:	83 c4 10             	add    $0x10,%esp
c0102030:	90                   	nop
c0102031:	c9                   	leave  
c0102032:	c3                   	ret    

c0102033 <do_open>:
c0102033:	55                   	push   %ebp
c0102034:	89 e5                	mov    %esp,%ebp
c0102036:	83 ec 68             	sub    $0x68,%esp
c0102039:	83 ec 04             	sub    $0x4,%esp
c010203c:	6a 0c                	push   $0xc
c010203e:	6a 00                	push   $0x0
c0102040:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102043:	50                   	push   %eax
c0102044:	e8 a6 a1 00 00       	call   c010c1ef <Memset>
c0102049:	83 c4 10             	add    $0x10,%esp
c010204c:	8b 45 08             	mov    0x8(%ebp),%eax
c010204f:	8b 40 44             	mov    0x44(%eax),%eax
c0102052:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102055:	83 ec 08             	sub    $0x8,%esp
c0102058:	6a 0c                	push   $0xc
c010205a:	ff 75 e4             	pushl  -0x1c(%ebp)
c010205d:	e8 cd 3e 00 00       	call   c0105f2f <alloc_virtual_memory>
c0102062:	83 c4 10             	add    $0x10,%esp
c0102065:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102068:	8b 45 08             	mov    0x8(%ebp),%eax
c010206b:	8b 40 40             	mov    0x40(%eax),%eax
c010206e:	89 c2                	mov    %eax,%edx
c0102070:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102073:	83 ec 04             	sub    $0x4,%esp
c0102076:	52                   	push   %edx
c0102077:	50                   	push   %eax
c0102078:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010207b:	50                   	push   %eax
c010207c:	e8 1b 4d 00 00       	call   c0106d9c <Memcpy>
c0102081:	83 c4 10             	add    $0x10,%esp
c0102084:	8b 45 08             	mov    0x8(%ebp),%eax
c0102087:	8b 40 40             	mov    0x40(%eax),%eax
c010208a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c010208f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102092:	8b 40 74             	mov    0x74(%eax),%eax
c0102095:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102098:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c010209f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01020a6:	eb 1f                	jmp    c01020c7 <do_open+0x94>
c01020a8:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01020ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01020b0:	83 c2 4c             	add    $0x4c,%edx
c01020b3:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01020b7:	85 c0                	test   %eax,%eax
c01020b9:	75 08                	jne    c01020c3 <do_open+0x90>
c01020bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01020c1:	eb 0a                	jmp    c01020cd <do_open+0x9a>
c01020c3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01020c7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01020cb:	7e db                	jle    c01020a8 <do_open+0x75>
c01020cd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c01020d1:	75 1c                	jne    c01020ef <do_open+0xbc>
c01020d3:	68 c6 01 00 00       	push   $0x1c6
c01020d8:	68 10 b3 10 c0       	push   $0xc010b310
c01020dd:	68 10 b3 10 c0       	push   $0xc010b310
c01020e2:	68 03 b4 10 c0       	push   $0xc010b403
c01020e7:	e8 c9 68 00 00       	call   c01089b5 <assertion_failure>
c01020ec:	83 c4 10             	add    $0x10,%esp
c01020ef:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c01020f6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01020fd:	eb 1d                	jmp    c010211c <do_open+0xe9>
c01020ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102102:	c1 e0 04             	shl    $0x4,%eax
c0102105:	05 88 13 11 c0       	add    $0xc0111388,%eax
c010210a:	8b 00                	mov    (%eax),%eax
c010210c:	85 c0                	test   %eax,%eax
c010210e:	75 08                	jne    c0102118 <do_open+0xe5>
c0102110:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102113:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102116:	eb 0a                	jmp    c0102122 <do_open+0xef>
c0102118:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010211c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0102120:	7e dd                	jle    c01020ff <do_open+0xcc>
c0102122:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0102126:	75 1c                	jne    c0102144 <do_open+0x111>
c0102128:	68 d2 01 00 00       	push   $0x1d2
c010212d:	68 10 b3 10 c0       	push   $0xc010b310
c0102132:	68 10 b3 10 c0       	push   $0xc010b310
c0102137:	68 0b b4 10 c0       	push   $0xc010b40b
c010213c:	e8 74 68 00 00       	call   c01089b5 <assertion_failure>
c0102141:	83 c4 10             	add    $0x10,%esp
c0102144:	83 ec 0c             	sub    $0xc,%esp
c0102147:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010214a:	50                   	push   %eax
c010214b:	e8 d2 00 00 00       	call   c0102222 <search_file>
c0102150:	83 c4 10             	add    $0x10,%esp
c0102153:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102156:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010215a:	75 2b                	jne    c0102187 <do_open+0x154>
c010215c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0102160:	7e 10                	jle    c0102172 <do_open+0x13f>
c0102162:	83 ec 0c             	sub    $0xc,%esp
c0102165:	68 13 b4 10 c0       	push   $0xc010b413
c010216a:	e8 28 68 00 00       	call   c0108997 <panic>
c010216f:	83 c4 10             	add    $0x10,%esp
c0102172:	83 ec 08             	sub    $0x8,%esp
c0102175:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102178:	50                   	push   %eax
c0102179:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010217c:	50                   	push   %eax
c010217d:	e8 60 04 00 00       	call   c01025e2 <create_file>
c0102182:	83 c4 10             	add    $0x10,%esp
c0102185:	eb 25                	jmp    c01021ac <do_open+0x179>
c0102187:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010218b:	75 0a                	jne    c0102197 <do_open+0x164>
c010218d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102192:	e9 89 00 00 00       	jmp    c0102220 <do_open+0x1ed>
c0102197:	83 ec 08             	sub    $0x8,%esp
c010219a:	ff 75 d8             	pushl  -0x28(%ebp)
c010219d:	8d 45 9c             	lea    -0x64(%ebp),%eax
c01021a0:	50                   	push   %eax
c01021a1:	e8 7a 02 00 00       	call   c0102420 <get_inode>
c01021a6:	83 c4 10             	add    $0x10,%esp
c01021a9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01021ac:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01021b1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01021b4:	c1 e2 04             	shl    $0x4,%edx
c01021b7:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c01021bd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01021c0:	83 c2 4c             	add    $0x4c,%edx
c01021c3:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c01021c7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01021ca:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01021cd:	c1 e2 04             	shl    $0x4,%edx
c01021d0:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c01021d6:	89 02                	mov    %eax,(%edx)
c01021d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021db:	c1 e0 04             	shl    $0x4,%eax
c01021de:	05 84 13 11 c0       	add    $0xc0111384,%eax
c01021e3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01021e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021ec:	c1 e0 04             	shl    $0x4,%eax
c01021ef:	05 80 13 11 c0       	add    $0xc0111380,%eax
c01021f4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01021fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021fd:	c1 e0 04             	shl    $0x4,%eax
c0102200:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102205:	8b 00                	mov    (%eax),%eax
c0102207:	8d 50 01             	lea    0x1(%eax),%edx
c010220a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010220d:	c1 e0 04             	shl    $0x4,%eax
c0102210:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102215:	89 10                	mov    %edx,(%eax)
c0102217:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010221a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010221d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102220:	c9                   	leave  
c0102221:	c3                   	ret    

c0102222 <search_file>:
c0102222:	55                   	push   %ebp
c0102223:	89 e5                	mov    %esp,%ebp
c0102225:	83 ec 68             	sub    $0x68,%esp
c0102228:	83 ec 04             	sub    $0x4,%esp
c010222b:	6a 0c                	push   $0xc
c010222d:	6a 00                	push   $0x0
c010222f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102232:	50                   	push   %eax
c0102233:	e8 b7 9f 00 00       	call   c010c1ef <Memset>
c0102238:	83 c4 10             	add    $0x10,%esp
c010223b:	83 ec 04             	sub    $0x4,%esp
c010223e:	6a 28                	push   $0x28
c0102240:	6a 00                	push   $0x0
c0102242:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102245:	50                   	push   %eax
c0102246:	e8 a4 9f 00 00       	call   c010c1ef <Memset>
c010224b:	83 c4 10             	add    $0x10,%esp
c010224e:	83 ec 04             	sub    $0x4,%esp
c0102251:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102254:	50                   	push   %eax
c0102255:	ff 75 08             	pushl  0x8(%ebp)
c0102258:	8d 45 c0             	lea    -0x40(%ebp),%eax
c010225b:	50                   	push   %eax
c010225c:	e8 f3 00 00 00       	call   c0102354 <strip_path>
c0102261:	83 c4 10             	add    $0x10,%esp
c0102264:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102267:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c010226b:	75 0a                	jne    c0102277 <search_file+0x55>
c010226d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102272:	e9 db 00 00 00       	jmp    c0102352 <search_file+0x130>
c0102277:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010227a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010227d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102280:	05 00 02 00 00       	add    $0x200,%eax
c0102285:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010228b:	85 c0                	test   %eax,%eax
c010228d:	0f 48 c2             	cmovs  %edx,%eax
c0102290:	c1 f8 09             	sar    $0x9,%eax
c0102293:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102296:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102299:	c1 e8 04             	shr    $0x4,%eax
c010229c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010229f:	e8 5c 14 00 00       	call   c0103700 <get_super_block>
c01022a4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01022a7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01022aa:	8b 00                	mov    (%eax),%eax
c01022ac:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01022af:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c01022b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01022bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01022c4:	eb 7b                	jmp    c0102341 <search_file+0x11f>
c01022c6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01022cb:	89 c1                	mov    %eax,%ecx
c01022cd:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01022d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022d3:	01 d0                	add    %edx,%eax
c01022d5:	83 ec 0c             	sub    $0xc,%esp
c01022d8:	6a 07                	push   $0x7
c01022da:	68 00 02 00 00       	push   $0x200
c01022df:	51                   	push   %ecx
c01022e0:	ff 75 cc             	pushl  -0x34(%ebp)
c01022e3:	50                   	push   %eax
c01022e4:	e8 3b f6 ff ff       	call   c0101924 <rd_wt>
c01022e9:	83 c4 20             	add    $0x20,%esp
c01022ec:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01022f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01022f4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01022fb:	eb 35                	jmp    c0102332 <search_file+0x110>
c01022fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102301:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102304:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102307:	7f 33                	jg     c010233c <search_file+0x11a>
c0102309:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010230c:	83 c0 04             	add    $0x4,%eax
c010230f:	83 ec 08             	sub    $0x8,%esp
c0102312:	50                   	push   %eax
c0102313:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102316:	50                   	push   %eax
c0102317:	e8 70 76 00 00       	call   c010998c <strcmp>
c010231c:	83 c4 10             	add    $0x10,%esp
c010231f:	85 c0                	test   %eax,%eax
c0102321:	75 07                	jne    c010232a <search_file+0x108>
c0102323:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102326:	8b 00                	mov    (%eax),%eax
c0102328:	eb 28                	jmp    c0102352 <search_file+0x130>
c010232a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010232e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0102332:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102335:	83 f8 1f             	cmp    $0x1f,%eax
c0102338:	76 c3                	jbe    c01022fd <search_file+0xdb>
c010233a:	eb 01                	jmp    c010233d <search_file+0x11b>
c010233c:	90                   	nop
c010233d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102341:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102344:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102347:	0f 8c 79 ff ff ff    	jl     c01022c6 <search_file+0xa4>
c010234d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102352:	c9                   	leave  
c0102353:	c3                   	ret    

c0102354 <strip_path>:
c0102354:	55                   	push   %ebp
c0102355:	89 e5                	mov    %esp,%ebp
c0102357:	83 ec 10             	sub    $0x10,%esp
c010235a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010235e:	75 0a                	jne    c010236a <strip_path+0x16>
c0102360:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102365:	e9 b4 00 00 00       	jmp    c010241e <strip_path+0xca>
c010236a:	8b 45 08             	mov    0x8(%ebp),%eax
c010236d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102370:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102373:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102376:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102379:	0f b6 00             	movzbl (%eax),%eax
c010237c:	3c 2f                	cmp    $0x2f,%al
c010237e:	75 2d                	jne    c01023ad <strip_path+0x59>
c0102380:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102384:	eb 27                	jmp    c01023ad <strip_path+0x59>
c0102386:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102389:	0f b6 00             	movzbl (%eax),%eax
c010238c:	3c 2f                	cmp    $0x2f,%al
c010238e:	75 0a                	jne    c010239a <strip_path+0x46>
c0102390:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102395:	e9 84 00 00 00       	jmp    c010241e <strip_path+0xca>
c010239a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010239d:	0f b6 10             	movzbl (%eax),%edx
c01023a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01023a3:	88 10                	mov    %dl,(%eax)
c01023a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01023a9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01023ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01023b0:	0f b6 00             	movzbl (%eax),%eax
c01023b3:	84 c0                	test   %al,%al
c01023b5:	75 cf                	jne    c0102386 <strip_path+0x32>
c01023b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01023ba:	c6 00 00             	movb   $0x0,(%eax)
c01023bd:	8b 45 10             	mov    0x10(%ebp),%eax
c01023c0:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c01023c6:	89 10                	mov    %edx,(%eax)
c01023c8:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c01023ce:	89 50 04             	mov    %edx,0x4(%eax)
c01023d1:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c01023d7:	89 50 08             	mov    %edx,0x8(%eax)
c01023da:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c01023e0:	89 50 0c             	mov    %edx,0xc(%eax)
c01023e3:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c01023e9:	89 50 10             	mov    %edx,0x10(%eax)
c01023ec:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c01023f2:	89 50 14             	mov    %edx,0x14(%eax)
c01023f5:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c01023fb:	89 50 18             	mov    %edx,0x18(%eax)
c01023fe:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102404:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102407:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010240d:	89 50 20             	mov    %edx,0x20(%eax)
c0102410:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102416:	89 50 24             	mov    %edx,0x24(%eax)
c0102419:	b8 00 00 00 00       	mov    $0x0,%eax
c010241e:	c9                   	leave  
c010241f:	c3                   	ret    

c0102420 <get_inode>:
c0102420:	55                   	push   %ebp
c0102421:	89 e5                	mov    %esp,%ebp
c0102423:	56                   	push   %esi
c0102424:	53                   	push   %ebx
c0102425:	83 ec 20             	sub    $0x20,%esp
c0102428:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010242c:	75 0a                	jne    c0102438 <get_inode+0x18>
c010242e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102433:	e9 a3 01 00 00       	jmp    c01025db <get_inode+0x1bb>
c0102438:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010243f:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102446:	eb 69                	jmp    c01024b1 <get_inode+0x91>
c0102448:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010244b:	8b 40 24             	mov    0x24(%eax),%eax
c010244e:	85 c0                	test   %eax,%eax
c0102450:	7e 53                	jle    c01024a5 <get_inode+0x85>
c0102452:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102455:	8b 40 10             	mov    0x10(%eax),%eax
c0102458:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010245b:	75 50                	jne    c01024ad <get_inode+0x8d>
c010245d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102460:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102463:	8b 0a                	mov    (%edx),%ecx
c0102465:	89 08                	mov    %ecx,(%eax)
c0102467:	8b 4a 04             	mov    0x4(%edx),%ecx
c010246a:	89 48 04             	mov    %ecx,0x4(%eax)
c010246d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102470:	89 48 08             	mov    %ecx,0x8(%eax)
c0102473:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102476:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102479:	8b 4a 10             	mov    0x10(%edx),%ecx
c010247c:	89 48 10             	mov    %ecx,0x10(%eax)
c010247f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102482:	89 48 14             	mov    %ecx,0x14(%eax)
c0102485:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102488:	89 48 18             	mov    %ecx,0x18(%eax)
c010248b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010248e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102491:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102494:	89 48 20             	mov    %ecx,0x20(%eax)
c0102497:	8b 52 24             	mov    0x24(%edx),%edx
c010249a:	89 50 24             	mov    %edx,0x24(%eax)
c010249d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024a0:	e9 36 01 00 00       	jmp    c01025db <get_inode+0x1bb>
c01024a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01024ab:	eb 0d                	jmp    c01024ba <get_inode+0x9a>
c01024ad:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c01024b1:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c01024b8:	76 8e                	jbe    c0102448 <get_inode+0x28>
c01024ba:	e8 41 12 00 00       	call   c0103700 <get_super_block>
c01024bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01024c2:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01024c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024cc:	8b 40 04             	mov    0x4(%eax),%eax
c01024cf:	8d 50 02             	lea    0x2(%eax),%edx
c01024d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024d5:	8b 40 08             	mov    0x8(%eax),%eax
c01024d8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01024db:	8b 45 0c             	mov    0xc(%ebp),%eax
c01024de:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01024e1:	b8 00 02 00 00       	mov    $0x200,%eax
c01024e6:	99                   	cltd   
c01024e7:	f7 7d e8             	idivl  -0x18(%ebp)
c01024ea:	89 c6                	mov    %eax,%esi
c01024ec:	89 c8                	mov    %ecx,%eax
c01024ee:	99                   	cltd   
c01024ef:	f7 fe                	idiv   %esi
c01024f1:	01 d8                	add    %ebx,%eax
c01024f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01024f6:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c01024fd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102502:	83 ec 0c             	sub    $0xc,%esp
c0102505:	6a 07                	push   $0x7
c0102507:	68 00 02 00 00       	push   $0x200
c010250c:	50                   	push   %eax
c010250d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102510:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102513:	e8 0c f4 ff ff       	call   c0101924 <rd_wt>
c0102518:	83 c4 20             	add    $0x20,%esp
c010251b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010251e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102521:	b8 00 02 00 00       	mov    $0x200,%eax
c0102526:	99                   	cltd   
c0102527:	f7 7d e8             	idivl  -0x18(%ebp)
c010252a:	89 c3                	mov    %eax,%ebx
c010252c:	89 c8                	mov    %ecx,%eax
c010252e:	99                   	cltd   
c010252f:	f7 fb                	idiv   %ebx
c0102531:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0102534:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010253a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010253d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102541:	01 d0                	add    %edx,%eax
c0102543:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102546:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102549:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010254c:	8b 0a                	mov    (%edx),%ecx
c010254e:	89 08                	mov    %ecx,(%eax)
c0102550:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102553:	89 48 04             	mov    %ecx,0x4(%eax)
c0102556:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102559:	89 48 08             	mov    %ecx,0x8(%eax)
c010255c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010255f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102562:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102565:	89 48 10             	mov    %ecx,0x10(%eax)
c0102568:	8b 4a 14             	mov    0x14(%edx),%ecx
c010256b:	89 48 14             	mov    %ecx,0x14(%eax)
c010256e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102571:	89 48 18             	mov    %ecx,0x18(%eax)
c0102574:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102577:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010257a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010257d:	89 48 20             	mov    %ecx,0x20(%eax)
c0102580:	8b 52 24             	mov    0x24(%edx),%edx
c0102583:	89 50 24             	mov    %edx,0x24(%eax)
c0102586:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102589:	8b 55 0c             	mov    0xc(%ebp),%edx
c010258c:	89 50 10             	mov    %edx,0x10(%eax)
c010258f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102592:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102595:	89 50 20             	mov    %edx,0x20(%eax)
c0102598:	8b 45 08             	mov    0x8(%ebp),%eax
c010259b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010259e:	8b 0a                	mov    (%edx),%ecx
c01025a0:	89 08                	mov    %ecx,(%eax)
c01025a2:	8b 4a 04             	mov    0x4(%edx),%ecx
c01025a5:	89 48 04             	mov    %ecx,0x4(%eax)
c01025a8:	8b 4a 08             	mov    0x8(%edx),%ecx
c01025ab:	89 48 08             	mov    %ecx,0x8(%eax)
c01025ae:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01025b1:	89 48 0c             	mov    %ecx,0xc(%eax)
c01025b4:	8b 4a 10             	mov    0x10(%edx),%ecx
c01025b7:	89 48 10             	mov    %ecx,0x10(%eax)
c01025ba:	8b 4a 14             	mov    0x14(%edx),%ecx
c01025bd:	89 48 14             	mov    %ecx,0x14(%eax)
c01025c0:	8b 4a 18             	mov    0x18(%edx),%ecx
c01025c3:	89 48 18             	mov    %ecx,0x18(%eax)
c01025c6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01025c9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01025cc:	8b 4a 20             	mov    0x20(%edx),%ecx
c01025cf:	89 48 20             	mov    %ecx,0x20(%eax)
c01025d2:	8b 52 24             	mov    0x24(%edx),%edx
c01025d5:	89 50 24             	mov    %edx,0x24(%eax)
c01025d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01025db:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01025de:	5b                   	pop    %ebx
c01025df:	5e                   	pop    %esi
c01025e0:	5d                   	pop    %ebp
c01025e1:	c3                   	ret    

c01025e2 <create_file>:
c01025e2:	55                   	push   %ebp
c01025e3:	89 e5                	mov    %esp,%ebp
c01025e5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01025eb:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01025ee:	50                   	push   %eax
c01025ef:	ff 75 0c             	pushl  0xc(%ebp)
c01025f2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01025f5:	50                   	push   %eax
c01025f6:	e8 59 fd ff ff       	call   c0102354 <strip_path>
c01025fb:	83 c4 0c             	add    $0xc,%esp
c01025fe:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102601:	75 0a                	jne    c010260d <create_file+0x2b>
c0102603:	b8 00 00 00 00       	mov    $0x0,%eax
c0102608:	e9 de 00 00 00       	jmp    c01026eb <create_file+0x109>
c010260d:	e8 db 00 00 00       	call   c01026ed <alloc_imap_bit>
c0102612:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102615:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102619:	75 0a                	jne    c0102625 <create_file+0x43>
c010261b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102620:	e9 c6 00 00 00       	jmp    c01026eb <create_file+0x109>
c0102625:	e8 d6 10 00 00       	call   c0103700 <get_super_block>
c010262a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010262d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102630:	8b 40 10             	mov    0x10(%eax),%eax
c0102633:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102636:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102639:	83 ec 08             	sub    $0x8,%esp
c010263c:	50                   	push   %eax
c010263d:	ff 75 f4             	pushl  -0xc(%ebp)
c0102640:	e8 a5 01 00 00       	call   c01027ea <alloc_smap_bit>
c0102645:	83 c4 10             	add    $0x10,%esp
c0102648:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010264b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010264f:	75 0a                	jne    c010265b <create_file+0x79>
c0102651:	b8 00 00 00 00       	mov    $0x0,%eax
c0102656:	e9 90 00 00 00       	jmp    c01026eb <create_file+0x109>
c010265b:	83 ec 04             	sub    $0x4,%esp
c010265e:	ff 75 e8             	pushl  -0x18(%ebp)
c0102661:	ff 75 f4             	pushl  -0xc(%ebp)
c0102664:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0102667:	50                   	push   %eax
c0102668:	e8 1e 03 00 00       	call   c010298b <new_inode>
c010266d:	83 c4 10             	add    $0x10,%esp
c0102670:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102673:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102677:	75 07                	jne    c0102680 <create_file+0x9e>
c0102679:	b8 00 00 00 00       	mov    $0x0,%eax
c010267e:	eb 6b                	jmp    c01026eb <create_file+0x109>
c0102680:	ff 75 f4             	pushl  -0xc(%ebp)
c0102683:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102686:	50                   	push   %eax
c0102687:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010268a:	50                   	push   %eax
c010268b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102691:	50                   	push   %eax
c0102692:	e8 12 04 00 00       	call   c0102aa9 <new_dir_entry>
c0102697:	83 c4 10             	add    $0x10,%esp
c010269a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010269d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01026a1:	75 07                	jne    c01026aa <create_file+0xc8>
c01026a3:	b8 00 00 00 00       	mov    $0x0,%eax
c01026a8:	eb 41                	jmp    c01026eb <create_file+0x109>
c01026aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01026ad:	8b 55 84             	mov    -0x7c(%ebp),%edx
c01026b0:	89 10                	mov    %edx,(%eax)
c01026b2:	8b 55 88             	mov    -0x78(%ebp),%edx
c01026b5:	89 50 04             	mov    %edx,0x4(%eax)
c01026b8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01026bb:	89 50 08             	mov    %edx,0x8(%eax)
c01026be:	8b 55 90             	mov    -0x70(%ebp),%edx
c01026c1:	89 50 0c             	mov    %edx,0xc(%eax)
c01026c4:	8b 55 94             	mov    -0x6c(%ebp),%edx
c01026c7:	89 50 10             	mov    %edx,0x10(%eax)
c01026ca:	8b 55 98             	mov    -0x68(%ebp),%edx
c01026cd:	89 50 14             	mov    %edx,0x14(%eax)
c01026d0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01026d3:	89 50 18             	mov    %edx,0x18(%eax)
c01026d6:	8b 55 a0             	mov    -0x60(%ebp),%edx
c01026d9:	89 50 1c             	mov    %edx,0x1c(%eax)
c01026dc:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c01026df:	89 50 20             	mov    %edx,0x20(%eax)
c01026e2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01026e5:	89 50 24             	mov    %edx,0x24(%eax)
c01026e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01026eb:	c9                   	leave  
c01026ec:	c3                   	ret    

c01026ed <alloc_imap_bit>:
c01026ed:	55                   	push   %ebp
c01026ee:	89 e5                	mov    %esp,%ebp
c01026f0:	53                   	push   %ebx
c01026f1:	83 ec 24             	sub    $0x24,%esp
c01026f4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01026fb:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102702:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102707:	83 ec 0c             	sub    $0xc,%esp
c010270a:	6a 07                	push   $0x7
c010270c:	68 00 02 00 00       	push   $0x200
c0102711:	50                   	push   %eax
c0102712:	ff 75 e8             	pushl  -0x18(%ebp)
c0102715:	ff 75 ec             	pushl  -0x14(%ebp)
c0102718:	e8 07 f2 ff ff       	call   c0101924 <rd_wt>
c010271d:	83 c4 20             	add    $0x20,%esp
c0102720:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102727:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010272e:	e9 a5 00 00 00       	jmp    c01027d8 <alloc_imap_bit+0xeb>
c0102733:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010273a:	e9 8b 00 00 00       	jmp    c01027ca <alloc_imap_bit+0xdd>
c010273f:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102745:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102748:	01 d0                	add    %edx,%eax
c010274a:	0f b6 00             	movzbl (%eax),%eax
c010274d:	0f be d0             	movsbl %al,%edx
c0102750:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102753:	89 c1                	mov    %eax,%ecx
c0102755:	d3 fa                	sar    %cl,%edx
c0102757:	89 d0                	mov    %edx,%eax
c0102759:	83 e0 01             	and    $0x1,%eax
c010275c:	85 c0                	test   %eax,%eax
c010275e:	74 06                	je     c0102766 <alloc_imap_bit+0x79>
c0102760:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102764:	eb 64                	jmp    c01027ca <alloc_imap_bit+0xdd>
c0102766:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010276c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010276f:	01 d0                	add    %edx,%eax
c0102771:	0f b6 18             	movzbl (%eax),%ebx
c0102774:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102777:	ba 01 00 00 00       	mov    $0x1,%edx
c010277c:	89 c1                	mov    %eax,%ecx
c010277e:	d3 e2                	shl    %cl,%edx
c0102780:	89 d0                	mov    %edx,%eax
c0102782:	89 c1                	mov    %eax,%ecx
c0102784:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010278a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010278d:	01 d0                	add    %edx,%eax
c010278f:	09 cb                	or     %ecx,%ebx
c0102791:	89 da                	mov    %ebx,%edx
c0102793:	88 10                	mov    %dl,(%eax)
c0102795:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102798:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010279f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027a2:	01 d0                	add    %edx,%eax
c01027a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01027a7:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01027ac:	83 ec 0c             	sub    $0xc,%esp
c01027af:	6a 0a                	push   $0xa
c01027b1:	68 00 02 00 00       	push   $0x200
c01027b6:	50                   	push   %eax
c01027b7:	ff 75 e8             	pushl  -0x18(%ebp)
c01027ba:	ff 75 ec             	pushl  -0x14(%ebp)
c01027bd:	e8 62 f1 ff ff       	call   c0101924 <rd_wt>
c01027c2:	83 c4 20             	add    $0x20,%esp
c01027c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01027c8:	eb 1b                	jmp    c01027e5 <alloc_imap_bit+0xf8>
c01027ca:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c01027ce:	0f 8e 6b ff ff ff    	jle    c010273f <alloc_imap_bit+0x52>
c01027d4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01027d8:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c01027df:	0f 8e 4e ff ff ff    	jle    c0102733 <alloc_imap_bit+0x46>
c01027e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01027e8:	c9                   	leave  
c01027e9:	c3                   	ret    

c01027ea <alloc_smap_bit>:
c01027ea:	55                   	push   %ebp
c01027eb:	89 e5                	mov    %esp,%ebp
c01027ed:	53                   	push   %ebx
c01027ee:	83 ec 34             	sub    $0x34,%esp
c01027f1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01027f5:	75 1c                	jne    c0102813 <alloc_smap_bit+0x29>
c01027f7:	68 fd 02 00 00       	push   $0x2fd
c01027fc:	68 10 b3 10 c0       	push   $0xc010b310
c0102801:	68 10 b3 10 c0       	push   $0xc010b310
c0102806:	68 20 b4 10 c0       	push   $0xc010b420
c010280b:	e8 a5 61 00 00       	call   c01089b5 <assertion_failure>
c0102810:	83 c4 10             	add    $0x10,%esp
c0102813:	e8 e8 0e 00 00       	call   c0103700 <get_super_block>
c0102818:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010281b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010281e:	8b 40 08             	mov    0x8(%eax),%eax
c0102821:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102824:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102827:	8b 40 04             	mov    0x4(%eax),%eax
c010282a:	83 c0 02             	add    $0x2,%eax
c010282d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102830:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102837:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c010283e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102845:	e9 20 01 00 00       	jmp    c010296a <alloc_smap_bit+0x180>
c010284a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010284d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102850:	01 d0                	add    %edx,%eax
c0102852:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102855:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010285a:	83 ec 0c             	sub    $0xc,%esp
c010285d:	6a 07                	push   $0x7
c010285f:	68 00 02 00 00       	push   $0x200
c0102864:	50                   	push   %eax
c0102865:	ff 75 d8             	pushl  -0x28(%ebp)
c0102868:	ff 75 d4             	pushl  -0x2c(%ebp)
c010286b:	e8 b4 f0 ff ff       	call   c0101924 <rd_wt>
c0102870:	83 c4 20             	add    $0x20,%esp
c0102873:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010287a:	e9 b0 00 00 00       	jmp    c010292f <alloc_smap_bit+0x145>
c010287f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102886:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010288a:	0f 85 8c 00 00 00    	jne    c010291c <alloc_smap_bit+0x132>
c0102890:	eb 45                	jmp    c01028d7 <alloc_smap_bit+0xed>
c0102892:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102898:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010289b:	01 d0                	add    %edx,%eax
c010289d:	0f b6 00             	movzbl (%eax),%eax
c01028a0:	0f be d0             	movsbl %al,%edx
c01028a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01028a6:	89 c1                	mov    %eax,%ecx
c01028a8:	d3 fa                	sar    %cl,%edx
c01028aa:	89 d0                	mov    %edx,%eax
c01028ac:	83 e0 01             	and    $0x1,%eax
c01028af:	85 c0                	test   %eax,%eax
c01028b1:	74 06                	je     c01028b9 <alloc_smap_bit+0xcf>
c01028b3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01028b7:	eb 1e                	jmp    c01028d7 <alloc_smap_bit+0xed>
c01028b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028bc:	c1 e0 09             	shl    $0x9,%eax
c01028bf:	89 c2                	mov    %eax,%edx
c01028c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01028c4:	01 d0                	add    %edx,%eax
c01028c6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01028cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01028d0:	01 d0                	add    %edx,%eax
c01028d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01028d5:	eb 06                	jmp    c01028dd <alloc_smap_bit+0xf3>
c01028d7:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c01028db:	7e b5                	jle    c0102892 <alloc_smap_bit+0xa8>
c01028dd:	eb 3d                	jmp    c010291c <alloc_smap_bit+0x132>
c01028df:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01028e3:	74 45                	je     c010292a <alloc_smap_bit+0x140>
c01028e5:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01028eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01028ee:	01 d0                	add    %edx,%eax
c01028f0:	0f b6 18             	movzbl (%eax),%ebx
c01028f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01028f6:	ba 01 00 00 00       	mov    $0x1,%edx
c01028fb:	89 c1                	mov    %eax,%ecx
c01028fd:	d3 e2                	shl    %cl,%edx
c01028ff:	89 d0                	mov    %edx,%eax
c0102901:	89 c1                	mov    %eax,%ecx
c0102903:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102909:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010290c:	01 d0                	add    %edx,%eax
c010290e:	09 cb                	or     %ecx,%ebx
c0102910:	89 da                	mov    %ebx,%edx
c0102912:	88 10                	mov    %dl,(%eax)
c0102914:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102918:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010291c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102920:	74 09                	je     c010292b <alloc_smap_bit+0x141>
c0102922:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102926:	7e b7                	jle    c01028df <alloc_smap_bit+0xf5>
c0102928:	eb 01                	jmp    c010292b <alloc_smap_bit+0x141>
c010292a:	90                   	nop
c010292b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010292f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102936:	0f 8e 43 ff ff ff    	jle    c010287f <alloc_smap_bit+0x95>
c010293c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102940:	74 1e                	je     c0102960 <alloc_smap_bit+0x176>
c0102942:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102947:	83 ec 0c             	sub    $0xc,%esp
c010294a:	6a 0a                	push   $0xa
c010294c:	68 00 02 00 00       	push   $0x200
c0102951:	50                   	push   %eax
c0102952:	ff 75 d8             	pushl  -0x28(%ebp)
c0102955:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102958:	e8 c7 ef ff ff       	call   c0101924 <rd_wt>
c010295d:	83 c4 20             	add    $0x20,%esp
c0102960:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102964:	74 12                	je     c0102978 <alloc_smap_bit+0x18e>
c0102966:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010296a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010296d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102970:	0f 8c d4 fe ff ff    	jl     c010284a <alloc_smap_bit+0x60>
c0102976:	eb 01                	jmp    c0102979 <alloc_smap_bit+0x18f>
c0102978:	90                   	nop
c0102979:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010297c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010297f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102982:	8b 00                	mov    (%eax),%eax
c0102984:	01 d0                	add    %edx,%eax
c0102986:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102989:	c9                   	leave  
c010298a:	c3                   	ret    

c010298b <new_inode>:
c010298b:	55                   	push   %ebp
c010298c:	89 e5                	mov    %esp,%ebp
c010298e:	83 ec 38             	sub    $0x38,%esp
c0102991:	83 ec 08             	sub    $0x8,%esp
c0102994:	ff 75 0c             	pushl  0xc(%ebp)
c0102997:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010299a:	50                   	push   %eax
c010299b:	e8 80 fa ff ff       	call   c0102420 <get_inode>
c01029a0:	83 c4 10             	add    $0x10,%esp
c01029a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01029a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01029aa:	75 0a                	jne    c01029b6 <new_inode+0x2b>
c01029ac:	b8 00 00 00 00       	mov    $0x0,%eax
c01029b1:	e9 f1 00 00 00       	jmp    c0102aa7 <new_inode+0x11c>
c01029b6:	8b 45 10             	mov    0x10(%ebp),%eax
c01029b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01029bc:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c01029c3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01029ca:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c01029d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029d4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01029d7:	83 ec 0c             	sub    $0xc,%esp
c01029da:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01029dd:	50                   	push   %eax
c01029de:	e8 39 0b 00 00       	call   c010351c <sync_inode>
c01029e3:	83 c4 10             	add    $0x10,%esp
c01029e6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01029ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01029f4:	eb 1d                	jmp    c0102a13 <new_inode+0x88>
c01029f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01029f9:	89 d0                	mov    %edx,%eax
c01029fb:	c1 e0 02             	shl    $0x2,%eax
c01029fe:	01 d0                	add    %edx,%eax
c0102a00:	c1 e0 03             	shl    $0x3,%eax
c0102a03:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102a08:	8b 00                	mov    (%eax),%eax
c0102a0a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0102a0d:	74 0c                	je     c0102a1b <new_inode+0x90>
c0102a0f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102a13:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102a17:	7e dd                	jle    c01029f6 <new_inode+0x6b>
c0102a19:	eb 01                	jmp    c0102a1c <new_inode+0x91>
c0102a1b:	90                   	nop
c0102a1c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102a1f:	89 d0                	mov    %edx,%eax
c0102a21:	c1 e0 02             	shl    $0x2,%eax
c0102a24:	01 d0                	add    %edx,%eax
c0102a26:	c1 e0 03             	shl    $0x3,%eax
c0102a29:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c0102a2e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102a31:	89 10                	mov    %edx,(%eax)
c0102a33:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a36:	89 50 04             	mov    %edx,0x4(%eax)
c0102a39:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102a3c:	89 50 08             	mov    %edx,0x8(%eax)
c0102a3f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102a42:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a45:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102a48:	89 50 10             	mov    %edx,0x10(%eax)
c0102a4b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102a4e:	89 50 14             	mov    %edx,0x14(%eax)
c0102a51:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102a54:	89 50 18             	mov    %edx,0x18(%eax)
c0102a57:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102a5a:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102a5d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102a60:	89 50 20             	mov    %edx,0x20(%eax)
c0102a63:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102a66:	89 50 24             	mov    %edx,0x24(%eax)
c0102a69:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a6c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102a6f:	89 10                	mov    %edx,(%eax)
c0102a71:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a74:	89 50 04             	mov    %edx,0x4(%eax)
c0102a77:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102a7a:	89 50 08             	mov    %edx,0x8(%eax)
c0102a7d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102a80:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a83:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102a86:	89 50 10             	mov    %edx,0x10(%eax)
c0102a89:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102a8c:	89 50 14             	mov    %edx,0x14(%eax)
c0102a8f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102a92:	89 50 18             	mov    %edx,0x18(%eax)
c0102a95:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102a98:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102a9b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102a9e:	89 50 20             	mov    %edx,0x20(%eax)
c0102aa1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102aa4:	89 50 24             	mov    %edx,0x24(%eax)
c0102aa7:	c9                   	leave  
c0102aa8:	c3                   	ret    

c0102aa9 <new_dir_entry>:
c0102aa9:	55                   	push   %ebp
c0102aaa:	89 e5                	mov    %esp,%ebp
c0102aac:	83 ec 48             	sub    $0x48,%esp
c0102aaf:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102ab6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ab9:	8b 40 04             	mov    0x4(%eax),%eax
c0102abc:	99                   	cltd   
c0102abd:	f7 7d dc             	idivl  -0x24(%ebp)
c0102ac0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102ac3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ac6:	8b 40 0c             	mov    0xc(%eax),%eax
c0102ac9:	99                   	cltd   
c0102aca:	f7 7d dc             	idivl  -0x24(%ebp)
c0102acd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102ad0:	e8 2b 0c 00 00       	call   c0103700 <get_super_block>
c0102ad5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102ad8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102adb:	8b 00                	mov    (%eax),%eax
c0102add:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102ae0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ae3:	8b 40 0c             	mov    0xc(%eax),%eax
c0102ae6:	05 00 02 00 00       	add    $0x200,%eax
c0102aeb:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102af1:	85 c0                	test   %eax,%eax
c0102af3:	0f 48 c2             	cmovs  %edx,%eax
c0102af6:	c1 f8 09             	sar    $0x9,%eax
c0102af9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102afc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102b03:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102b0a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102b11:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102b18:	eb 7f                	jmp    c0102b99 <new_dir_entry+0xf0>
c0102b1a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102b1f:	89 c1                	mov    %eax,%ecx
c0102b21:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102b24:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b27:	01 d0                	add    %edx,%eax
c0102b29:	83 ec 0c             	sub    $0xc,%esp
c0102b2c:	6a 07                	push   $0x7
c0102b2e:	68 00 02 00 00       	push   $0x200
c0102b33:	51                   	push   %ecx
c0102b34:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102b37:	50                   	push   %eax
c0102b38:	e8 e7 ed ff ff       	call   c0101924 <rd_wt>
c0102b3d:	83 c4 20             	add    $0x20,%esp
c0102b40:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102b45:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102b48:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102b4f:	eb 25                	jmp    c0102b76 <new_dir_entry+0xcd>
c0102b51:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102b55:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b58:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102b5b:	7f 29                	jg     c0102b86 <new_dir_entry+0xdd>
c0102b5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b60:	8b 00                	mov    (%eax),%eax
c0102b62:	85 c0                	test   %eax,%eax
c0102b64:	75 08                	jne    c0102b6e <new_dir_entry+0xc5>
c0102b66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b69:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102b6c:	eb 19                	jmp    c0102b87 <new_dir_entry+0xde>
c0102b6e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102b72:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102b76:	b8 00 02 00 00       	mov    $0x200,%eax
c0102b7b:	99                   	cltd   
c0102b7c:	f7 7d dc             	idivl  -0x24(%ebp)
c0102b7f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102b82:	7c cd                	jl     c0102b51 <new_dir_entry+0xa8>
c0102b84:	eb 01                	jmp    c0102b87 <new_dir_entry+0xde>
c0102b86:	90                   	nop
c0102b87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b8a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102b8d:	7f 16                	jg     c0102ba5 <new_dir_entry+0xfc>
c0102b8f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102b93:	75 10                	jne    c0102ba5 <new_dir_entry+0xfc>
c0102b95:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102b99:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b9c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102b9f:	0f 8c 75 ff ff ff    	jl     c0102b1a <new_dir_entry+0x71>
c0102ba5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102ba8:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102bab:	75 0a                	jne    c0102bb7 <new_dir_entry+0x10e>
c0102bad:	b8 00 00 00 00       	mov    $0x0,%eax
c0102bb2:	e9 fc 00 00 00       	jmp    c0102cb3 <new_dir_entry+0x20a>
c0102bb7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102bbe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102bc2:	75 1e                	jne    c0102be2 <new_dir_entry+0x139>
c0102bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102bc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102bca:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bcd:	8b 50 04             	mov    0x4(%eax),%edx
c0102bd0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102bd3:	01 c2                	add    %eax,%edx
c0102bd5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bd8:	89 50 04             	mov    %edx,0x4(%eax)
c0102bdb:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102be2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102be5:	8b 55 14             	mov    0x14(%ebp),%edx
c0102be8:	89 10                	mov    %edx,(%eax)
c0102bea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102bed:	83 c0 04             	add    $0x4,%eax
c0102bf0:	83 ec 08             	sub    $0x8,%esp
c0102bf3:	ff 75 10             	pushl  0x10(%ebp)
c0102bf6:	50                   	push   %eax
c0102bf7:	e8 12 96 00 00       	call   c010c20e <Strcpy>
c0102bfc:	83 c4 10             	add    $0x10,%esp
c0102bff:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c02:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102c05:	8b 0a                	mov    (%edx),%ecx
c0102c07:	89 08                	mov    %ecx,(%eax)
c0102c09:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102c0c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102c0f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102c12:	89 48 08             	mov    %ecx,0x8(%eax)
c0102c15:	8b 52 0c             	mov    0xc(%edx),%edx
c0102c18:	89 50 0c             	mov    %edx,0xc(%eax)
c0102c1b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c20:	89 c1                	mov    %eax,%ecx
c0102c22:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102c25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102c28:	01 d0                	add    %edx,%eax
c0102c2a:	83 ec 0c             	sub    $0xc,%esp
c0102c2d:	6a 0a                	push   $0xa
c0102c2f:	68 00 02 00 00       	push   $0x200
c0102c34:	51                   	push   %ecx
c0102c35:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102c38:	50                   	push   %eax
c0102c39:	e8 e6 ec ff ff       	call   c0101924 <rd_wt>
c0102c3e:	83 c4 20             	add    $0x20,%esp
c0102c41:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102c45:	74 69                	je     c0102cb0 <new_dir_entry+0x207>
c0102c47:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c4a:	8b 10                	mov    (%eax),%edx
c0102c4c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102c52:	8b 50 04             	mov    0x4(%eax),%edx
c0102c55:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102c5b:	8b 50 08             	mov    0x8(%eax),%edx
c0102c5e:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102c64:	8b 50 0c             	mov    0xc(%eax),%edx
c0102c67:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102c6d:	8b 50 10             	mov    0x10(%eax),%edx
c0102c70:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102c76:	8b 50 14             	mov    0x14(%eax),%edx
c0102c79:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102c7f:	8b 50 18             	mov    0x18(%eax),%edx
c0102c82:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102c88:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102c8b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102c91:	8b 50 20             	mov    0x20(%eax),%edx
c0102c94:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102c9a:	8b 40 24             	mov    0x24(%eax),%eax
c0102c9d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102ca2:	83 ec 0c             	sub    $0xc,%esp
c0102ca5:	ff 75 0c             	pushl  0xc(%ebp)
c0102ca8:	e8 6f 08 00 00       	call   c010351c <sync_inode>
c0102cad:	83 c4 10             	add    $0x10,%esp
c0102cb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cb3:	c9                   	leave  
c0102cb4:	c3                   	ret    

c0102cb5 <do_unlink>:
c0102cb5:	55                   	push   %ebp
c0102cb6:	89 e5                	mov    %esp,%ebp
c0102cb8:	53                   	push   %ebx
c0102cb9:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102cbf:	83 ec 08             	sub    $0x8,%esp
c0102cc2:	ff 75 08             	pushl  0x8(%ebp)
c0102cc5:	68 35 b4 10 c0       	push   $0xc010b435
c0102cca:	e8 bd 6c 00 00       	call   c010998c <strcmp>
c0102ccf:	83 c4 10             	add    $0x10,%esp
c0102cd2:	85 c0                	test   %eax,%eax
c0102cd4:	75 10                	jne    c0102ce6 <do_unlink+0x31>
c0102cd6:	83 ec 0c             	sub    $0xc,%esp
c0102cd9:	68 37 b4 10 c0       	push   $0xc010b437
c0102cde:	e8 b4 5c 00 00       	call   c0108997 <panic>
c0102ce3:	83 c4 10             	add    $0x10,%esp
c0102ce6:	83 ec 0c             	sub    $0xc,%esp
c0102ce9:	ff 75 08             	pushl  0x8(%ebp)
c0102cec:	e8 31 f5 ff ff       	call   c0102222 <search_file>
c0102cf1:	83 c4 10             	add    $0x10,%esp
c0102cf4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102cf7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102cfb:	75 10                	jne    c0102d0d <do_unlink+0x58>
c0102cfd:	83 ec 0c             	sub    $0xc,%esp
c0102d00:	68 53 b4 10 c0       	push   $0xc010b453
c0102d05:	e8 8d 5c 00 00       	call   c0108997 <panic>
c0102d0a:	83 c4 10             	add    $0x10,%esp
c0102d0d:	83 ec 08             	sub    $0x8,%esp
c0102d10:	ff 75 d0             	pushl  -0x30(%ebp)
c0102d13:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102d19:	50                   	push   %eax
c0102d1a:	e8 01 f7 ff ff       	call   c0102420 <get_inode>
c0102d1f:	83 c4 10             	add    $0x10,%esp
c0102d22:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102d25:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102d29:	75 10                	jne    c0102d3b <do_unlink+0x86>
c0102d2b:	83 ec 0c             	sub    $0xc,%esp
c0102d2e:	68 53 b4 10 c0       	push   $0xc010b453
c0102d33:	e8 5f 5c 00 00       	call   c0108997 <panic>
c0102d38:	83 c4 10             	add    $0x10,%esp
c0102d3b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102d3e:	85 c0                	test   %eax,%eax
c0102d40:	7e 10                	jle    c0102d52 <do_unlink+0x9d>
c0102d42:	83 ec 0c             	sub    $0xc,%esp
c0102d45:	68 6c b4 10 c0       	push   $0xc010b46c
c0102d4a:	e8 48 5c 00 00       	call   c0108997 <panic>
c0102d4f:	83 c4 10             	add    $0x10,%esp
c0102d52:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102d58:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102d5b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102d5e:	8d 50 07             	lea    0x7(%eax),%edx
c0102d61:	85 c0                	test   %eax,%eax
c0102d63:	0f 48 c2             	cmovs  %edx,%eax
c0102d66:	c1 f8 03             	sar    $0x3,%eax
c0102d69:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102d6c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d6f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102d75:	85 c0                	test   %eax,%eax
c0102d77:	0f 48 c2             	cmovs  %edx,%eax
c0102d7a:	c1 f8 09             	sar    $0x9,%eax
c0102d7d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102d80:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102d83:	99                   	cltd   
c0102d84:	c1 ea 1d             	shr    $0x1d,%edx
c0102d87:	01 d0                	add    %edx,%eax
c0102d89:	83 e0 07             	and    $0x7,%eax
c0102d8c:	29 d0                	sub    %edx,%eax
c0102d8e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102d91:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102d98:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d9d:	89 c2                	mov    %eax,%edx
c0102d9f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102da2:	83 c0 02             	add    $0x2,%eax
c0102da5:	83 ec 0c             	sub    $0xc,%esp
c0102da8:	6a 07                	push   $0x7
c0102daa:	68 00 02 00 00       	push   $0x200
c0102daf:	52                   	push   %edx
c0102db0:	ff 75 b8             	pushl  -0x48(%ebp)
c0102db3:	50                   	push   %eax
c0102db4:	e8 6b eb ff ff       	call   c0101924 <rd_wt>
c0102db9:	83 c4 20             	add    $0x20,%esp
c0102dbc:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102dc2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102dc5:	01 d0                	add    %edx,%eax
c0102dc7:	0f b6 10             	movzbl (%eax),%edx
c0102dca:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102dcd:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102dd2:	89 c1                	mov    %eax,%ecx
c0102dd4:	d3 e3                	shl    %cl,%ebx
c0102dd6:	89 d8                	mov    %ebx,%eax
c0102dd8:	f7 d0                	not    %eax
c0102dda:	89 c3                	mov    %eax,%ebx
c0102ddc:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102de2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102de5:	01 c8                	add    %ecx,%eax
c0102de7:	21 da                	and    %ebx,%edx
c0102de9:	88 10                	mov    %dl,(%eax)
c0102deb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102df0:	89 c2                	mov    %eax,%edx
c0102df2:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102df5:	83 c0 02             	add    $0x2,%eax
c0102df8:	83 ec 0c             	sub    $0xc,%esp
c0102dfb:	6a 0a                	push   $0xa
c0102dfd:	68 00 02 00 00       	push   $0x200
c0102e02:	52                   	push   %edx
c0102e03:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e06:	50                   	push   %eax
c0102e07:	e8 18 eb ff ff       	call   c0101924 <rd_wt>
c0102e0c:	83 c4 20             	add    $0x20,%esp
c0102e0f:	e8 ec 08 00 00       	call   c0103700 <get_super_block>
c0102e14:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102e17:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102e1d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102e20:	8b 00                	mov    (%eax),%eax
c0102e22:	29 c2                	sub    %eax,%edx
c0102e24:	89 d0                	mov    %edx,%eax
c0102e26:	83 c0 01             	add    $0x1,%eax
c0102e29:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102e2c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102e2f:	8d 50 07             	lea    0x7(%eax),%edx
c0102e32:	85 c0                	test   %eax,%eax
c0102e34:	0f 48 c2             	cmovs  %edx,%eax
c0102e37:	c1 f8 03             	sar    $0x3,%eax
c0102e3a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102e3d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e40:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102e46:	85 c0                	test   %eax,%eax
c0102e48:	0f 48 c2             	cmovs  %edx,%eax
c0102e4b:	c1 f8 09             	sar    $0x9,%eax
c0102e4e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102e51:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102e54:	99                   	cltd   
c0102e55:	c1 ea 1d             	shr    $0x1d,%edx
c0102e58:	01 d0                	add    %edx,%eax
c0102e5a:	83 e0 07             	and    $0x7,%eax
c0102e5d:	29 d0                	sub    %edx,%eax
c0102e5f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102e62:	b8 08 00 00 00       	mov    $0x8,%eax
c0102e67:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102e6a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102e6d:	29 c2                	sub    %eax,%edx
c0102e6f:	89 d0                	mov    %edx,%eax
c0102e71:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102e74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e77:	8d 50 07             	lea    0x7(%eax),%edx
c0102e7a:	85 c0                	test   %eax,%eax
c0102e7c:	0f 48 c2             	cmovs  %edx,%eax
c0102e7f:	c1 f8 03             	sar    $0x3,%eax
c0102e82:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102e85:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e8a:	89 c1                	mov    %eax,%ecx
c0102e8c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102e8f:	8b 40 04             	mov    0x4(%eax),%eax
c0102e92:	8d 50 02             	lea    0x2(%eax),%edx
c0102e95:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102e98:	01 d0                	add    %edx,%eax
c0102e9a:	83 ec 0c             	sub    $0xc,%esp
c0102e9d:	6a 07                	push   $0x7
c0102e9f:	68 00 02 00 00       	push   $0x200
c0102ea4:	51                   	push   %ecx
c0102ea5:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ea8:	50                   	push   %eax
c0102ea9:	e8 76 ea ff ff       	call   c0101924 <rd_wt>
c0102eae:	83 c4 20             	add    $0x20,%esp
c0102eb1:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102eb7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102eba:	01 d0                	add    %edx,%eax
c0102ebc:	0f b6 10             	movzbl (%eax),%edx
c0102ebf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102ec2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102ec7:	89 c1                	mov    %eax,%ecx
c0102ec9:	d3 e3                	shl    %cl,%ebx
c0102ecb:	89 d8                	mov    %ebx,%eax
c0102ecd:	f7 d0                	not    %eax
c0102ecf:	89 c3                	mov    %eax,%ebx
c0102ed1:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102ed7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102eda:	01 c8                	add    %ecx,%eax
c0102edc:	21 da                	and    %ebx,%edx
c0102ede:	88 10                	mov    %dl,(%eax)
c0102ee0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102ee7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102eea:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102eed:	eb 6b                	jmp    c0102f5a <do_unlink+0x2a5>
c0102eef:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102ef6:	75 4c                	jne    c0102f44 <do_unlink+0x28f>
c0102ef8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102eff:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f04:	83 ec 0c             	sub    $0xc,%esp
c0102f07:	6a 0a                	push   $0xa
c0102f09:	68 00 02 00 00       	push   $0x200
c0102f0e:	50                   	push   %eax
c0102f0f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f12:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f15:	e8 0a ea ff ff       	call   c0101924 <rd_wt>
c0102f1a:	83 c4 20             	add    $0x20,%esp
c0102f1d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f22:	89 c1                	mov    %eax,%ecx
c0102f24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102f27:	8d 50 01             	lea    0x1(%eax),%edx
c0102f2a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102f2d:	83 ec 0c             	sub    $0xc,%esp
c0102f30:	6a 07                	push   $0x7
c0102f32:	68 00 02 00 00       	push   $0x200
c0102f37:	51                   	push   %ecx
c0102f38:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f3b:	50                   	push   %eax
c0102f3c:	e8 e3 e9 ff ff       	call   c0101924 <rd_wt>
c0102f41:	83 c4 20             	add    $0x20,%esp
c0102f44:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102f4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f4d:	01 d0                	add    %edx,%eax
c0102f4f:	c6 00 00             	movb   $0x0,(%eax)
c0102f52:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102f56:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102f5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f5d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102f60:	7c 8d                	jl     c0102eef <do_unlink+0x23a>
c0102f62:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102f69:	75 4c                	jne    c0102fb7 <do_unlink+0x302>
c0102f6b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102f72:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f77:	83 ec 0c             	sub    $0xc,%esp
c0102f7a:	6a 0a                	push   $0xa
c0102f7c:	68 00 02 00 00       	push   $0x200
c0102f81:	50                   	push   %eax
c0102f82:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f85:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f88:	e8 97 e9 ff ff       	call   c0101924 <rd_wt>
c0102f8d:	83 c4 20             	add    $0x20,%esp
c0102f90:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f95:	89 c1                	mov    %eax,%ecx
c0102f97:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102f9a:	8d 50 01             	lea    0x1(%eax),%edx
c0102f9d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102fa0:	83 ec 0c             	sub    $0xc,%esp
c0102fa3:	6a 07                	push   $0x7
c0102fa5:	68 00 02 00 00       	push   $0x200
c0102faa:	51                   	push   %ecx
c0102fab:	ff 75 b8             	pushl  -0x48(%ebp)
c0102fae:	50                   	push   %eax
c0102faf:	e8 70 e9 ff ff       	call   c0101924 <rd_wt>
c0102fb4:	83 c4 20             	add    $0x20,%esp
c0102fb7:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102fbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102fc0:	01 d0                	add    %edx,%eax
c0102fc2:	0f b6 10             	movzbl (%eax),%edx
c0102fc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102fc8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102fcd:	89 c1                	mov    %eax,%ecx
c0102fcf:	d3 e3                	shl    %cl,%ebx
c0102fd1:	89 d8                	mov    %ebx,%eax
c0102fd3:	89 c3                	mov    %eax,%ebx
c0102fd5:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102fdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102fde:	01 c8                	add    %ecx,%eax
c0102fe0:	21 da                	and    %ebx,%edx
c0102fe2:	88 10                	mov    %dl,(%eax)
c0102fe4:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102fe9:	83 ec 0c             	sub    $0xc,%esp
c0102fec:	6a 0a                	push   $0xa
c0102fee:	68 00 02 00 00       	push   $0x200
c0102ff3:	50                   	push   %eax
c0102ff4:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ff7:	ff 75 ec             	pushl  -0x14(%ebp)
c0102ffa:	e8 25 e9 ff ff       	call   c0101924 <rd_wt>
c0102fff:	83 c4 20             	add    $0x20,%esp
c0103002:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0103009:	00 00 00 
c010300c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0103013:	00 00 00 
c0103016:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c010301d:	00 00 00 
c0103020:	83 ec 0c             	sub    $0xc,%esp
c0103023:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0103029:	50                   	push   %eax
c010302a:	e8 ed 04 00 00       	call   c010351c <sync_inode>
c010302f:	83 c4 10             	add    $0x10,%esp
c0103032:	83 ec 0c             	sub    $0xc,%esp
c0103035:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c010303b:	50                   	push   %eax
c010303c:	e8 2f 06 00 00       	call   c0103670 <put_inode>
c0103041:	83 c4 10             	add    $0x10,%esp
c0103044:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103047:	8b 00                	mov    (%eax),%eax
c0103049:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010304c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0103053:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103056:	8b 40 04             	mov    0x4(%eax),%eax
c0103059:	89 45 94             	mov    %eax,-0x6c(%ebp)
c010305c:	8b 45 98             	mov    -0x68(%ebp),%eax
c010305f:	8b 40 0c             	mov    0xc(%eax),%eax
c0103062:	89 45 90             	mov    %eax,-0x70(%ebp)
c0103065:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103068:	c1 e8 04             	shr    $0x4,%eax
c010306b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010306e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0103075:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010307c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0103083:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010308a:	e9 a5 00 00 00       	jmp    c0103134 <do_unlink+0x47f>
c010308f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103094:	89 c1                	mov    %eax,%ecx
c0103096:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0103099:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010309c:	01 d0                	add    %edx,%eax
c010309e:	83 ec 0c             	sub    $0xc,%esp
c01030a1:	6a 07                	push   $0x7
c01030a3:	68 00 02 00 00       	push   $0x200
c01030a8:	51                   	push   %ecx
c01030a9:	ff 75 b8             	pushl  -0x48(%ebp)
c01030ac:	50                   	push   %eax
c01030ad:	e8 72 e8 ff ff       	call   c0101924 <rd_wt>
c01030b2:	83 c4 20             	add    $0x20,%esp
c01030b5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01030ba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01030bd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c01030c4:	eb 51                	jmp    c0103117 <do_unlink+0x462>
c01030c6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01030ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01030cd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01030d0:	7f 4f                	jg     c0103121 <do_unlink+0x46c>
c01030d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01030d5:	83 c0 10             	add    $0x10,%eax
c01030d8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01030db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01030de:	83 c0 04             	add    $0x4,%eax
c01030e1:	83 ec 08             	sub    $0x8,%esp
c01030e4:	ff 75 08             	pushl  0x8(%ebp)
c01030e7:	50                   	push   %eax
c01030e8:	e8 9f 68 00 00       	call   c010998c <strcmp>
c01030ed:	83 c4 10             	add    $0x10,%esp
c01030f0:	85 c0                	test   %eax,%eax
c01030f2:	75 1b                	jne    c010310f <do_unlink+0x45a>
c01030f4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01030fb:	83 ec 04             	sub    $0x4,%esp
c01030fe:	6a 10                	push   $0x10
c0103100:	6a 00                	push   $0x0
c0103102:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103105:	e8 e5 90 00 00       	call   c010c1ef <Memset>
c010310a:	83 c4 10             	add    $0x10,%esp
c010310d:	eb 13                	jmp    c0103122 <do_unlink+0x46d>
c010310f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0103113:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0103117:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010311a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010311d:	7c a7                	jl     c01030c6 <do_unlink+0x411>
c010311f:	eb 01                	jmp    c0103122 <do_unlink+0x46d>
c0103121:	90                   	nop
c0103122:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103125:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103128:	7f 16                	jg     c0103140 <do_unlink+0x48b>
c010312a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010312e:	75 10                	jne    c0103140 <do_unlink+0x48b>
c0103130:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0103134:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103137:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010313a:	0f 8c 4f ff ff ff    	jl     c010308f <do_unlink+0x3da>
c0103140:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103143:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103146:	75 17                	jne    c010315f <do_unlink+0x4aa>
c0103148:	8b 45 98             	mov    -0x68(%ebp),%eax
c010314b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010314e:	89 50 04             	mov    %edx,0x4(%eax)
c0103151:	83 ec 0c             	sub    $0xc,%esp
c0103154:	ff 75 98             	pushl  -0x68(%ebp)
c0103157:	e8 c0 03 00 00       	call   c010351c <sync_inode>
c010315c:	83 c4 10             	add    $0x10,%esp
c010315f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0103163:	74 26                	je     c010318b <do_unlink+0x4d6>
c0103165:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010316a:	89 c1                	mov    %eax,%ecx
c010316c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c010316f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103172:	01 d0                	add    %edx,%eax
c0103174:	83 ec 0c             	sub    $0xc,%esp
c0103177:	6a 0a                	push   $0xa
c0103179:	68 00 02 00 00       	push   $0x200
c010317e:	51                   	push   %ecx
c010317f:	ff 75 b8             	pushl  -0x48(%ebp)
c0103182:	50                   	push   %eax
c0103183:	e8 9c e7 ff ff       	call   c0101924 <rd_wt>
c0103188:	83 c4 20             	add    $0x20,%esp
c010318b:	90                   	nop
c010318c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010318f:	c9                   	leave  
c0103190:	c3                   	ret    

c0103191 <do_rdwt>:
c0103191:	55                   	push   %ebp
c0103192:	89 e5                	mov    %esp,%ebp
c0103194:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010319a:	8b 45 08             	mov    0x8(%ebp),%eax
c010319d:	8b 40 78             	mov    0x78(%eax),%eax
c01031a0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01031a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01031a6:	8b 40 60             	mov    0x60(%eax),%eax
c01031a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01031ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01031af:	8b 40 6c             	mov    0x6c(%eax),%eax
c01031b2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01031b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01031b8:	8b 00                	mov    (%eax),%eax
c01031ba:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01031bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01031c0:	8b 40 10             	mov    0x10(%eax),%eax
c01031c3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01031c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01031c9:	8b 40 50             	mov    0x50(%eax),%eax
c01031cc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01031cf:	83 ec 0c             	sub    $0xc,%esp
c01031d2:	ff 75 d0             	pushl  -0x30(%ebp)
c01031d5:	e8 0c 07 00 00       	call   c01038e6 <pid2proc>
c01031da:	83 c4 10             	add    $0x10,%esp
c01031dd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01031e0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01031e3:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01031e6:	83 c2 4c             	add    $0x4c,%edx
c01031e9:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01031ed:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01031f0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01031f3:	8b 40 08             	mov    0x8(%eax),%eax
c01031f6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01031f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01031fc:	8b 00                	mov    (%eax),%eax
c01031fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103201:	83 ec 08             	sub    $0x8,%esp
c0103204:	ff 75 bc             	pushl  -0x44(%ebp)
c0103207:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010320d:	50                   	push   %eax
c010320e:	e8 0d f2 ff ff       	call   c0102420 <get_inode>
c0103213:	83 c4 10             	add    $0x10,%esp
c0103216:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103219:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010321d:	75 10                	jne    c010322f <do_rdwt+0x9e>
c010321f:	83 ec 0c             	sub    $0xc,%esp
c0103222:	68 a4 b4 10 c0       	push   $0xc010b4a4
c0103227:	e8 6b 57 00 00       	call   c0108997 <panic>
c010322c:	83 c4 10             	add    $0x10,%esp
c010322f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103235:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103238:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010323b:	8b 40 04             	mov    0x4(%eax),%eax
c010323e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103241:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103245:	74 22                	je     c0103269 <do_rdwt+0xd8>
c0103247:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010324b:	74 1c                	je     c0103269 <do_rdwt+0xd8>
c010324d:	68 a8 04 00 00       	push   $0x4a8
c0103252:	68 10 b3 10 c0       	push   $0xc010b310
c0103257:	68 10 b3 10 c0       	push   $0xc010b310
c010325c:	68 b4 b4 10 c0       	push   $0xc010b4b4
c0103261:	e8 4f 57 00 00       	call   c01089b5 <assertion_failure>
c0103266:	83 c4 10             	add    $0x10,%esp
c0103269:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c010326f:	83 f8 01             	cmp    $0x1,%eax
c0103272:	0f 85 86 00 00 00    	jne    c01032fe <do_rdwt+0x16d>
c0103278:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010327c:	75 09                	jne    c0103287 <do_rdwt+0xf6>
c010327e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103285:	eb 0d                	jmp    c0103294 <do_rdwt+0x103>
c0103287:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010328b:	75 07                	jne    c0103294 <do_rdwt+0x103>
c010328d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103294:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103297:	8b 45 08             	mov    0x8(%ebp),%eax
c010329a:	89 50 78             	mov    %edx,0x78(%eax)
c010329d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c01032a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01032a3:	89 50 68             	mov    %edx,0x68(%eax)
c01032a6:	83 ec 04             	sub    $0x4,%esp
c01032a9:	6a 04                	push   $0x4
c01032ab:	ff 75 08             	pushl  0x8(%ebp)
c01032ae:	6a 03                	push   $0x3
c01032b0:	e8 70 63 00 00       	call   c0109625 <send_rec>
c01032b5:	83 c4 10             	add    $0x10,%esp
c01032b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01032bb:	8b 40 78             	mov    0x78(%eax),%eax
c01032be:	83 f8 66             	cmp    $0x66,%eax
c01032c1:	75 13                	jne    c01032d6 <do_rdwt+0x145>
c01032c3:	83 ec 04             	sub    $0x4,%esp
c01032c6:	ff 75 b8             	pushl  -0x48(%ebp)
c01032c9:	ff 75 08             	pushl  0x8(%ebp)
c01032cc:	6a 01                	push   $0x1
c01032ce:	e8 52 63 00 00       	call   c0109625 <send_rec>
c01032d3:	83 c4 10             	add    $0x10,%esp
c01032d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01032d9:	8b 40 78             	mov    0x78(%eax),%eax
c01032dc:	83 f8 65             	cmp    $0x65,%eax
c01032df:	75 13                	jne    c01032f4 <do_rdwt+0x163>
c01032e1:	83 ec 04             	sub    $0x4,%esp
c01032e4:	ff 75 b8             	pushl  -0x48(%ebp)
c01032e7:	ff 75 08             	pushl  0x8(%ebp)
c01032ea:	6a 01                	push   $0x1
c01032ec:	e8 34 63 00 00       	call   c0109625 <send_rec>
c01032f1:	83 c4 10             	add    $0x10,%esp
c01032f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01032f9:	e9 1c 02 00 00       	jmp    c010351a <do_rdwt+0x389>
c01032fe:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103302:	75 18                	jne    c010331c <do_rdwt+0x18b>
c0103304:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010330a:	c1 e0 09             	shl    $0x9,%eax
c010330d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103310:	75 0a                	jne    c010331c <do_rdwt+0x18b>
c0103312:	b8 00 00 00 00       	mov    $0x0,%eax
c0103317:	e9 fe 01 00 00       	jmp    c010351a <do_rdwt+0x389>
c010331c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103320:	75 14                	jne    c0103336 <do_rdwt+0x1a5>
c0103322:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103325:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103328:	01 d0                	add    %edx,%eax
c010332a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010332d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0103331:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103334:	eb 19                	jmp    c010334f <do_rdwt+0x1be>
c0103336:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103339:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010333c:	01 c2                	add    %eax,%edx
c010333e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103344:	c1 e0 09             	shl    $0x9,%eax
c0103347:	39 c2                	cmp    %eax,%edx
c0103349:	0f 4e c2             	cmovle %edx,%eax
c010334c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010334f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103352:	99                   	cltd   
c0103353:	c1 ea 17             	shr    $0x17,%edx
c0103356:	01 d0                	add    %edx,%eax
c0103358:	25 ff 01 00 00       	and    $0x1ff,%eax
c010335d:	29 d0                	sub    %edx,%eax
c010335f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103362:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103368:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010336b:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103371:	85 c0                	test   %eax,%eax
c0103373:	0f 48 c1             	cmovs  %ecx,%eax
c0103376:	c1 f8 09             	sar    $0x9,%eax
c0103379:	01 d0                	add    %edx,%eax
c010337b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010337e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103384:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103387:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010338d:	85 c0                	test   %eax,%eax
c010338f:	0f 48 c1             	cmovs  %ecx,%eax
c0103392:	c1 f8 09             	sar    $0x9,%eax
c0103395:	01 d0                	add    %edx,%eax
c0103397:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010339a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010339d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01033a0:	ba 00 00 10 00       	mov    $0x100000,%edx
c01033a5:	39 d0                	cmp    %edx,%eax
c01033a7:	7d 0b                	jge    c01033b4 <do_rdwt+0x223>
c01033a9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01033ac:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01033af:	83 c0 01             	add    $0x1,%eax
c01033b2:	eb 05                	jmp    c01033b9 <do_rdwt+0x228>
c01033b4:	b8 00 00 10 00       	mov    $0x100000,%eax
c01033b9:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01033bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01033c2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01033c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01033cc:	8b 00                	mov    (%eax),%eax
c01033ce:	83 ec 0c             	sub    $0xc,%esp
c01033d1:	50                   	push   %eax
c01033d2:	e8 0f 05 00 00       	call   c01038e6 <pid2proc>
c01033d7:	83 c4 10             	add    $0x10,%esp
c01033da:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01033dd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033e0:	83 ec 08             	sub    $0x8,%esp
c01033e3:	50                   	push   %eax
c01033e4:	ff 75 cc             	pushl  -0x34(%ebp)
c01033e7:	e8 43 2b 00 00       	call   c0105f2f <alloc_virtual_memory>
c01033ec:	83 c4 10             	add    $0x10,%esp
c01033ef:	89 45 98             	mov    %eax,-0x68(%ebp)
c01033f2:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01033f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01033f8:	e9 c5 00 00 00       	jmp    c01034c2 <do_rdwt+0x331>
c01033fd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103400:	c1 e0 09             	shl    $0x9,%eax
c0103403:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103406:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103409:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010340d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103410:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103417:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010341b:	75 46                	jne    c0103463 <do_rdwt+0x2d2>
c010341d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103420:	c1 e0 09             	shl    $0x9,%eax
c0103423:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103429:	83 ec 0c             	sub    $0xc,%esp
c010342c:	6a 07                	push   $0x7
c010342e:	50                   	push   %eax
c010342f:	52                   	push   %edx
c0103430:	ff 75 90             	pushl  -0x70(%ebp)
c0103433:	ff 75 e0             	pushl  -0x20(%ebp)
c0103436:	e8 e9 e4 ff ff       	call   c0101924 <rd_wt>
c010343b:	83 c4 20             	add    $0x20,%esp
c010343e:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103444:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103447:	01 d0                	add    %edx,%eax
c0103449:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010344c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010344f:	01 ca                	add    %ecx,%edx
c0103451:	83 ec 04             	sub    $0x4,%esp
c0103454:	ff 75 94             	pushl  -0x6c(%ebp)
c0103457:	50                   	push   %eax
c0103458:	52                   	push   %edx
c0103459:	e8 3e 39 00 00       	call   c0106d9c <Memcpy>
c010345e:	83 c4 10             	add    $0x10,%esp
c0103461:	eb 46                	jmp    c01034a9 <do_rdwt+0x318>
c0103463:	8b 55 98             	mov    -0x68(%ebp),%edx
c0103466:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103469:	01 d0                	add    %edx,%eax
c010346b:	89 c1                	mov    %eax,%ecx
c010346d:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103473:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103476:	01 d0                	add    %edx,%eax
c0103478:	83 ec 04             	sub    $0x4,%esp
c010347b:	ff 75 94             	pushl  -0x6c(%ebp)
c010347e:	51                   	push   %ecx
c010347f:	50                   	push   %eax
c0103480:	e8 17 39 00 00       	call   c0106d9c <Memcpy>
c0103485:	83 c4 10             	add    $0x10,%esp
c0103488:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010348b:	c1 e0 09             	shl    $0x9,%eax
c010348e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103494:	83 ec 0c             	sub    $0xc,%esp
c0103497:	6a 0a                	push   $0xa
c0103499:	50                   	push   %eax
c010349a:	52                   	push   %edx
c010349b:	ff 75 90             	pushl  -0x70(%ebp)
c010349e:	ff 75 e0             	pushl  -0x20(%ebp)
c01034a1:	e8 7e e4 ff ff       	call   c0101924 <rd_wt>
c01034a6:	83 c4 20             	add    $0x20,%esp
c01034a9:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01034ac:	29 45 e8             	sub    %eax,-0x18(%ebp)
c01034af:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01034b2:	01 45 e4             	add    %eax,-0x1c(%ebp)
c01034b5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01034bc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01034bf:	01 45 e0             	add    %eax,-0x20(%ebp)
c01034c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01034c5:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c01034c8:	7f 0a                	jg     c01034d4 <do_rdwt+0x343>
c01034ca:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01034ce:	0f 85 29 ff ff ff    	jne    c01033fd <do_rdwt+0x26c>
c01034d4:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01034d7:	8b 50 04             	mov    0x4(%eax),%edx
c01034da:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034dd:	01 c2                	add    %eax,%edx
c01034df:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01034e2:	89 50 04             	mov    %edx,0x4(%eax)
c01034e5:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01034e8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034eb:	01 c2                	add    %eax,%edx
c01034ed:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01034f3:	39 c2                	cmp    %eax,%edx
c01034f5:	7e 20                	jle    c0103517 <do_rdwt+0x386>
c01034f7:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01034fa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034fd:	01 d0                	add    %edx,%eax
c01034ff:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103505:	83 ec 0c             	sub    $0xc,%esp
c0103508:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010350e:	50                   	push   %eax
c010350f:	e8 08 00 00 00       	call   c010351c <sync_inode>
c0103514:	83 c4 10             	add    $0x10,%esp
c0103517:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010351a:	c9                   	leave  
c010351b:	c3                   	ret    

c010351c <sync_inode>:
c010351c:	55                   	push   %ebp
c010351d:	89 e5                	mov    %esp,%ebp
c010351f:	53                   	push   %ebx
c0103520:	83 ec 34             	sub    $0x34,%esp
c0103523:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010352a:	eb 74                	jmp    c01035a0 <sync_inode+0x84>
c010352c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010352f:	89 d0                	mov    %edx,%eax
c0103531:	c1 e0 02             	shl    $0x2,%eax
c0103534:	01 d0                	add    %edx,%eax
c0103536:	c1 e0 03             	shl    $0x3,%eax
c0103539:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c010353e:	8b 10                	mov    (%eax),%edx
c0103540:	8b 45 08             	mov    0x8(%ebp),%eax
c0103543:	8b 40 10             	mov    0x10(%eax),%eax
c0103546:	39 c2                	cmp    %eax,%edx
c0103548:	75 52                	jne    c010359c <sync_inode+0x80>
c010354a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010354d:	89 d0                	mov    %edx,%eax
c010354f:	c1 e0 02             	shl    $0x2,%eax
c0103552:	01 d0                	add    %edx,%eax
c0103554:	c1 e0 03             	shl    $0x3,%eax
c0103557:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c010355d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103560:	8b 08                	mov    (%eax),%ecx
c0103562:	89 0a                	mov    %ecx,(%edx)
c0103564:	8b 48 04             	mov    0x4(%eax),%ecx
c0103567:	89 4a 04             	mov    %ecx,0x4(%edx)
c010356a:	8b 48 08             	mov    0x8(%eax),%ecx
c010356d:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103570:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103573:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103576:	8b 48 10             	mov    0x10(%eax),%ecx
c0103579:	89 4a 10             	mov    %ecx,0x10(%edx)
c010357c:	8b 48 14             	mov    0x14(%eax),%ecx
c010357f:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103582:	8b 48 18             	mov    0x18(%eax),%ecx
c0103585:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103588:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010358b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010358e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103591:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103594:	8b 40 24             	mov    0x24(%eax),%eax
c0103597:	89 42 24             	mov    %eax,0x24(%edx)
c010359a:	eb 0a                	jmp    c01035a6 <sync_inode+0x8a>
c010359c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01035a0:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c01035a4:	7e 86                	jle    c010352c <sync_inode+0x10>
c01035a6:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c01035ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01035b0:	8b 40 10             	mov    0x10(%eax),%eax
c01035b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01035b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01035b9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01035bc:	b8 00 02 00 00       	mov    $0x200,%eax
c01035c1:	99                   	cltd   
c01035c2:	f7 7d f0             	idivl  -0x10(%ebp)
c01035c5:	89 c3                	mov    %eax,%ebx
c01035c7:	89 c8                	mov    %ecx,%eax
c01035c9:	99                   	cltd   
c01035ca:	f7 fb                	idiv   %ebx
c01035cc:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01035cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01035d2:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01035d5:	b8 00 02 00 00       	mov    $0x200,%eax
c01035da:	99                   	cltd   
c01035db:	f7 7d f0             	idivl  -0x10(%ebp)
c01035de:	89 c3                	mov    %eax,%ebx
c01035e0:	89 c8                	mov    %ecx,%eax
c01035e2:	99                   	cltd   
c01035e3:	f7 fb                	idiv   %ebx
c01035e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01035e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01035eb:	8b 40 20             	mov    0x20(%eax),%eax
c01035ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01035f1:	e8 0a 01 00 00       	call   c0103700 <get_super_block>
c01035f6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01035f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01035fc:	8b 40 04             	mov    0x4(%eax),%eax
c01035ff:	8d 50 02             	lea    0x2(%eax),%edx
c0103602:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103605:	8b 40 08             	mov    0x8(%eax),%eax
c0103608:	01 c2                	add    %eax,%edx
c010360a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010360d:	01 d0                	add    %edx,%eax
c010360f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103612:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103617:	83 ec 0c             	sub    $0xc,%esp
c010361a:	6a 07                	push   $0x7
c010361c:	68 00 02 00 00       	push   $0x200
c0103621:	50                   	push   %eax
c0103622:	ff 75 e0             	pushl  -0x20(%ebp)
c0103625:	ff 75 d8             	pushl  -0x28(%ebp)
c0103628:	e8 f7 e2 ff ff       	call   c0101924 <rd_wt>
c010362d:	83 c4 20             	add    $0x20,%esp
c0103630:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0103635:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103638:	83 ec 04             	sub    $0x4,%esp
c010363b:	ff 75 f0             	pushl  -0x10(%ebp)
c010363e:	ff 75 08             	pushl  0x8(%ebp)
c0103641:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103644:	e8 53 37 00 00       	call   c0106d9c <Memcpy>
c0103649:	83 c4 10             	add    $0x10,%esp
c010364c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103651:	83 ec 0c             	sub    $0xc,%esp
c0103654:	6a 0a                	push   $0xa
c0103656:	68 00 02 00 00       	push   $0x200
c010365b:	50                   	push   %eax
c010365c:	ff 75 e0             	pushl  -0x20(%ebp)
c010365f:	ff 75 d8             	pushl  -0x28(%ebp)
c0103662:	e8 bd e2 ff ff       	call   c0101924 <rd_wt>
c0103667:	83 c4 20             	add    $0x20,%esp
c010366a:	90                   	nop
c010366b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010366e:	c9                   	leave  
c010366f:	c3                   	ret    

c0103670 <put_inode>:
c0103670:	55                   	push   %ebp
c0103671:	89 e5                	mov    %esp,%ebp
c0103673:	83 ec 08             	sub    $0x8,%esp
c0103676:	8b 45 08             	mov    0x8(%ebp),%eax
c0103679:	8b 40 24             	mov    0x24(%eax),%eax
c010367c:	85 c0                	test   %eax,%eax
c010367e:	7f 1c                	jg     c010369c <put_inode+0x2c>
c0103680:	68 4d 05 00 00       	push   $0x54d
c0103685:	68 10 b3 10 c0       	push   $0xc010b310
c010368a:	68 10 b3 10 c0       	push   $0xc010b310
c010368f:	68 e8 b4 10 c0       	push   $0xc010b4e8
c0103694:	e8 1c 53 00 00       	call   c01089b5 <assertion_failure>
c0103699:	83 c4 10             	add    $0x10,%esp
c010369c:	8b 45 08             	mov    0x8(%ebp),%eax
c010369f:	8b 40 24             	mov    0x24(%eax),%eax
c01036a2:	8d 50 ff             	lea    -0x1(%eax),%edx
c01036a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01036a8:	89 50 24             	mov    %edx,0x24(%eax)
c01036ab:	90                   	nop
c01036ac:	c9                   	leave  
c01036ad:	c3                   	ret    

c01036ae <do_close>:
c01036ae:	55                   	push   %ebp
c01036af:	89 e5                	mov    %esp,%ebp
c01036b1:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01036b6:	8b 55 08             	mov    0x8(%ebp),%edx
c01036b9:	83 c2 4c             	add    $0x4c,%edx
c01036bc:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01036c0:	8b 50 0c             	mov    0xc(%eax),%edx
c01036c3:	83 ea 01             	sub    $0x1,%edx
c01036c6:	89 50 0c             	mov    %edx,0xc(%eax)
c01036c9:	8b 40 0c             	mov    0xc(%eax),%eax
c01036cc:	85 c0                	test   %eax,%eax
c01036ce:	75 16                	jne    c01036e6 <do_close+0x38>
c01036d0:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01036d5:	8b 55 08             	mov    0x8(%ebp),%edx
c01036d8:	83 c2 4c             	add    $0x4c,%edx
c01036db:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01036df:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01036e6:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01036eb:	8b 55 08             	mov    0x8(%ebp),%edx
c01036ee:	83 c2 4c             	add    $0x4c,%edx
c01036f1:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c01036f8:	00 
c01036f9:	b8 00 00 00 00       	mov    $0x0,%eax
c01036fe:	5d                   	pop    %ebp
c01036ff:	c3                   	ret    

c0103700 <get_super_block>:
c0103700:	55                   	push   %ebp
c0103701:	89 e5                	mov    %esp,%ebp
c0103703:	83 ec 08             	sub    $0x8,%esp
c0103706:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010370b:	83 ec 0c             	sub    $0xc,%esp
c010370e:	6a 07                	push   $0x7
c0103710:	68 00 02 00 00       	push   $0x200
c0103715:	50                   	push   %eax
c0103716:	6a 20                	push   $0x20
c0103718:	6a 01                	push   $0x1
c010371a:	e8 05 e2 ff ff       	call   c0101924 <rd_wt>
c010371f:	83 c4 20             	add    $0x20,%esp
c0103722:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103728:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010372d:	8b 0a                	mov    (%edx),%ecx
c010372f:	89 08                	mov    %ecx,(%eax)
c0103731:	8b 4a 04             	mov    0x4(%edx),%ecx
c0103734:	89 48 04             	mov    %ecx,0x4(%eax)
c0103737:	8b 4a 08             	mov    0x8(%edx),%ecx
c010373a:	89 48 08             	mov    %ecx,0x8(%eax)
c010373d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103740:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103743:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103746:	89 48 10             	mov    %ecx,0x10(%eax)
c0103749:	8b 4a 14             	mov    0x14(%edx),%ecx
c010374c:	89 48 14             	mov    %ecx,0x14(%eax)
c010374f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0103752:	89 48 18             	mov    %ecx,0x18(%eax)
c0103755:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0103758:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010375b:	8b 52 20             	mov    0x20(%edx),%edx
c010375e:	89 50 20             	mov    %edx,0x20(%eax)
c0103761:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0103766:	c9                   	leave  
c0103767:	c3                   	ret    

c0103768 <schedule_process>:
c0103768:	55                   	push   %ebp
c0103769:	89 e5                	mov    %esp,%ebp
c010376b:	83 ec 18             	sub    $0x18,%esp
c010376e:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103775:	e8 6f cc ff ff       	call   c01003e9 <get_running_thread_pcb>
c010377a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010377d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103780:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103787:	84 c0                	test   %al,%al
c0103789:	75 35                	jne    c01037c0 <schedule_process+0x58>
c010378b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010378e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103794:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103797:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010379d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01037a0:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01037a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01037aa:	05 60 02 00 00       	add    $0x260,%eax
c01037af:	83 ec 08             	sub    $0x8,%esp
c01037b2:	50                   	push   %eax
c01037b3:	68 ec fd 10 c0       	push   $0xc010fdec
c01037b8:	e8 9a 6b 00 00       	call   c010a357 <insertToDoubleLinkList>
c01037bd:	83 c4 10             	add    $0x10,%esp
c01037c0:	83 ec 0c             	sub    $0xc,%esp
c01037c3:	68 ec fd 10 c0       	push   $0xc010fdec
c01037c8:	e8 a6 69 00 00       	call   c010a173 <isListEmpty>
c01037cd:	83 c4 10             	add    $0x10,%esp
c01037d0:	84 c0                	test   %al,%al
c01037d2:	74 19                	je     c01037ed <schedule_process+0x85>
c01037d4:	6a 1e                	push   $0x1e
c01037d6:	68 f7 b4 10 c0       	push   $0xc010b4f7
c01037db:	68 f7 b4 10 c0       	push   $0xc010b4f7
c01037e0:	68 01 b5 10 c0       	push   $0xc010b501
c01037e5:	e8 cb 51 00 00       	call   c01089b5 <assertion_failure>
c01037ea:	83 c4 10             	add    $0x10,%esp
c01037ed:	83 ec 0c             	sub    $0xc,%esp
c01037f0:	68 ec fd 10 c0       	push   $0xc010fdec
c01037f5:	e8 e0 6b 00 00       	call   c010a3da <popFromDoubleLinkList>
c01037fa:	83 c4 10             	add    $0x10,%esp
c01037fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103800:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103803:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103808:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010380b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010380e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103815:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103818:	8b 50 08             	mov    0x8(%eax),%edx
c010381b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010381e:	39 c2                	cmp    %eax,%edx
c0103820:	74 28                	je     c010384a <schedule_process+0xe2>
c0103822:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103825:	05 00 10 00 00       	add    $0x1000,%eax
c010382a:	83 ec 0c             	sub    $0xc,%esp
c010382d:	50                   	push   %eax
c010382e:	e8 a7 cb ff ff       	call   c01003da <update_tss>
c0103833:	83 c4 10             	add    $0x10,%esp
c0103836:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103839:	8b 40 08             	mov    0x8(%eax),%eax
c010383c:	83 ec 0c             	sub    $0xc,%esp
c010383f:	50                   	push   %eax
c0103840:	e8 88 cb ff ff       	call   c01003cd <update_cr3>
c0103845:	83 c4 10             	add    $0x10,%esp
c0103848:	eb 0f                	jmp    c0103859 <schedule_process+0xf1>
c010384a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010384d:	83 ec 0c             	sub    $0xc,%esp
c0103850:	50                   	push   %eax
c0103851:	e8 77 cb ff ff       	call   c01003cd <update_cr3>
c0103856:	83 c4 10             	add    $0x10,%esp
c0103859:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010385c:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103861:	83 ec 08             	sub    $0x8,%esp
c0103864:	ff 75 e8             	pushl  -0x18(%ebp)
c0103867:	ff 75 f0             	pushl  -0x10(%ebp)
c010386a:	e8 c1 68 00 00       	call   c010a130 <switch_to>
c010386f:	83 c4 10             	add    $0x10,%esp
c0103872:	90                   	nop
c0103873:	c9                   	leave  
c0103874:	c3                   	ret    

c0103875 <clock_handler>:
c0103875:	55                   	push   %ebp
c0103876:	89 e5                	mov    %esp,%ebp
c0103878:	83 ec 18             	sub    $0x18,%esp
c010387b:	e8 69 cb ff ff       	call   c01003e9 <get_running_thread_pcb>
c0103880:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103883:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0103888:	85 c0                	test   %eax,%eax
c010388a:	74 0d                	je     c0103899 <clock_handler+0x24>
c010388c:	83 ec 0c             	sub    $0xc,%esp
c010388f:	6a 04                	push   $0x4
c0103891:	e8 29 60 00 00       	call   c01098bf <inform_int>
c0103896:	83 c4 10             	add    $0x10,%esp
c0103899:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010389e:	83 f8 64             	cmp    $0x64,%eax
c01038a1:	75 0c                	jne    c01038af <clock_handler+0x3a>
c01038a3:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c01038aa:	00 00 00 
c01038ad:	eb 0a                	jmp    c01038b9 <clock_handler+0x44>
c01038af:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01038b4:	83 f8 01             	cmp    $0x1,%eax
c01038b7:	75 2a                	jne    c01038e3 <clock_handler+0x6e>
c01038b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038bc:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c01038c2:	85 c0                	test   %eax,%eax
c01038c4:	74 16                	je     c01038dc <clock_handler+0x67>
c01038c6:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c01038cb:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01038d1:	83 ea 01             	sub    $0x1,%edx
c01038d4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01038da:	eb 08                	jmp    c01038e4 <clock_handler+0x6f>
c01038dc:	e8 87 fe ff ff       	call   c0103768 <schedule_process>
c01038e1:	eb 01                	jmp    c01038e4 <clock_handler+0x6f>
c01038e3:	90                   	nop
c01038e4:	c9                   	leave  
c01038e5:	c3                   	ret    

c01038e6 <pid2proc>:
c01038e6:	55                   	push   %ebp
c01038e7:	89 e5                	mov    %esp,%ebp
c01038e9:	83 ec 20             	sub    $0x20,%esp
c01038ec:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01038f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01038fa:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c01038ff:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103905:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103908:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010390b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103910:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103916:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103919:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010391c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103921:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103924:	eb 36                	jmp    c010395c <pid2proc+0x76>
c0103926:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103929:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010392e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103931:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103935:	75 07                	jne    c010393e <pid2proc+0x58>
c0103937:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c010393e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103941:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103947:	8b 45 08             	mov    0x8(%ebp),%eax
c010394a:	39 c2                	cmp    %eax,%edx
c010394c:	75 05                	jne    c0103953 <pid2proc+0x6d>
c010394e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103951:	eb 17                	jmp    c010396a <pid2proc+0x84>
c0103953:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103956:	8b 40 04             	mov    0x4(%eax),%eax
c0103959:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010395c:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103963:	75 c1                	jne    c0103926 <pid2proc+0x40>
c0103965:	b8 00 00 00 00       	mov    $0x0,%eax
c010396a:	c9                   	leave  
c010396b:	c3                   	ret    

c010396c <proc2pid>:
c010396c:	55                   	push   %ebp
c010396d:	89 e5                	mov    %esp,%ebp
c010396f:	83 ec 10             	sub    $0x10,%esp
c0103972:	8b 45 08             	mov    0x8(%ebp),%eax
c0103975:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c010397b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010397e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103981:	c9                   	leave  
c0103982:	c3                   	ret    

c0103983 <InitDescriptor>:
c0103983:	55                   	push   %ebp
c0103984:	89 e5                	mov    %esp,%ebp
c0103986:	83 ec 04             	sub    $0x4,%esp
c0103989:	8b 45 14             	mov    0x14(%ebp),%eax
c010398c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103990:	8b 45 10             	mov    0x10(%ebp),%eax
c0103993:	89 c2                	mov    %eax,%edx
c0103995:	8b 45 08             	mov    0x8(%ebp),%eax
c0103998:	66 89 10             	mov    %dx,(%eax)
c010399b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010399e:	89 c2                	mov    %eax,%edx
c01039a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01039a3:	66 89 50 02          	mov    %dx,0x2(%eax)
c01039a7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039aa:	c1 e8 10             	shr    $0x10,%eax
c01039ad:	89 c2                	mov    %eax,%edx
c01039af:	8b 45 08             	mov    0x8(%ebp),%eax
c01039b2:	88 50 04             	mov    %dl,0x4(%eax)
c01039b5:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01039b9:	89 c2                	mov    %eax,%edx
c01039bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01039be:	88 50 05             	mov    %dl,0x5(%eax)
c01039c1:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01039c5:	66 c1 e8 08          	shr    $0x8,%ax
c01039c9:	c1 e0 04             	shl    $0x4,%eax
c01039cc:	89 c2                	mov    %eax,%edx
c01039ce:	8b 45 10             	mov    0x10(%ebp),%eax
c01039d1:	c1 e8 10             	shr    $0x10,%eax
c01039d4:	83 e0 0f             	and    $0xf,%eax
c01039d7:	09 c2                	or     %eax,%edx
c01039d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01039dc:	88 50 06             	mov    %dl,0x6(%eax)
c01039df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039e2:	c1 e8 18             	shr    $0x18,%eax
c01039e5:	89 c2                	mov    %eax,%edx
c01039e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01039ea:	88 50 07             	mov    %dl,0x7(%eax)
c01039ed:	90                   	nop
c01039ee:	c9                   	leave  
c01039ef:	c3                   	ret    

c01039f0 <Seg2PhyAddr>:
c01039f0:	55                   	push   %ebp
c01039f1:	89 e5                	mov    %esp,%ebp
c01039f3:	83 ec 10             	sub    $0x10,%esp
c01039f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01039f9:	c1 e8 03             	shr    $0x3,%eax
c01039fc:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103a03:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c0103a0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a0d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103a10:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103a14:	0f b7 c0             	movzwl %ax,%eax
c0103a17:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103a1b:	0f b6 d2             	movzbl %dl,%edx
c0103a1e:	c1 e2 10             	shl    $0x10,%edx
c0103a21:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103a27:	09 d0                	or     %edx,%eax
c0103a29:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a2f:	c9                   	leave  
c0103a30:	c3                   	ret    

c0103a31 <Seg2PhyAddrLDT>:
c0103a31:	55                   	push   %ebp
c0103a32:	89 e5                	mov    %esp,%ebp
c0103a34:	83 ec 10             	sub    $0x10,%esp
c0103a37:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a3a:	c1 e8 03             	shr    $0x3,%eax
c0103a3d:	89 c2                	mov    %eax,%edx
c0103a3f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a42:	83 c2 20             	add    $0x20,%edx
c0103a45:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103a49:	8b 02                	mov    (%edx),%eax
c0103a4b:	8b 52 04             	mov    0x4(%edx),%edx
c0103a4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a51:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103a54:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103a58:	0f b7 c0             	movzwl %ax,%eax
c0103a5b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103a5f:	0f b6 d2             	movzbl %dl,%edx
c0103a62:	c1 e2 10             	shl    $0x10,%edx
c0103a65:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103a6b:	09 d0                	or     %edx,%eax
c0103a6d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a70:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a73:	c9                   	leave  
c0103a74:	c3                   	ret    

c0103a75 <VirAddr2PhyAddr>:
c0103a75:	55                   	push   %ebp
c0103a76:	89 e5                	mov    %esp,%ebp
c0103a78:	83 ec 10             	sub    $0x10,%esp
c0103a7b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103a7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a81:	01 d0                	add    %edx,%eax
c0103a83:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a86:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a89:	c9                   	leave  
c0103a8a:	c3                   	ret    

c0103a8b <v2l>:
c0103a8b:	55                   	push   %ebp
c0103a8c:	89 e5                	mov    %esp,%ebp
c0103a8e:	83 ec 18             	sub    $0x18,%esp
c0103a91:	83 ec 0c             	sub    $0xc,%esp
c0103a94:	ff 75 08             	pushl  0x8(%ebp)
c0103a97:	e8 4a fe ff ff       	call   c01038e6 <pid2proc>
c0103a9c:	83 c4 10             	add    $0x10,%esp
c0103a9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103aa2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103aa9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103aac:	83 ec 08             	sub    $0x8,%esp
c0103aaf:	ff 75 f4             	pushl  -0xc(%ebp)
c0103ab2:	50                   	push   %eax
c0103ab3:	e8 79 ff ff ff       	call   c0103a31 <Seg2PhyAddrLDT>
c0103ab8:	83 c4 10             	add    $0x10,%esp
c0103abb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103abe:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103ac1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ac4:	01 d0                	add    %edx,%eax
c0103ac6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103ac9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103acc:	c9                   	leave  
c0103acd:	c3                   	ret    

c0103ace <init_propt>:
c0103ace:	55                   	push   %ebp
c0103acf:	89 e5                	mov    %esp,%ebp
c0103ad1:	83 ec 38             	sub    $0x38,%esp
c0103ad4:	6a 0e                	push   $0xe
c0103ad6:	6a 08                	push   $0x8
c0103ad8:	68 71 01 10 c0       	push   $0xc0100171
c0103add:	6a 20                	push   $0x20
c0103adf:	e8 6b 01 00 00       	call   c0103c4f <InitInterruptDesc>
c0103ae4:	83 c4 10             	add    $0x10,%esp
c0103ae7:	6a 0e                	push   $0xe
c0103ae9:	6a 08                	push   $0x8
c0103aeb:	68 9f 01 10 c0       	push   $0xc010019f
c0103af0:	6a 21                	push   $0x21
c0103af2:	e8 58 01 00 00       	call   c0103c4f <InitInterruptDesc>
c0103af7:	83 c4 10             	add    $0x10,%esp
c0103afa:	6a 0e                	push   $0xe
c0103afc:	6a 08                	push   $0x8
c0103afe:	68 e2 01 10 c0       	push   $0xc01001e2
c0103b03:	6a 2e                	push   $0x2e
c0103b05:	e8 45 01 00 00       	call   c0103c4f <InitInterruptDesc>
c0103b0a:	83 c4 10             	add    $0x10,%esp
c0103b0d:	6a 0e                	push   $0xe
c0103b0f:	6a 08                	push   $0x8
c0103b11:	68 28 02 10 c0       	push   $0xc0100228
c0103b16:	6a 2a                	push   $0x2a
c0103b18:	e8 32 01 00 00       	call   c0103c4f <InitInterruptDesc>
c0103b1d:	83 c4 10             	add    $0x10,%esp
c0103b20:	83 ec 04             	sub    $0x4,%esp
c0103b23:	68 e0 15 00 00       	push   $0x15e0
c0103b28:	6a 00                	push   $0x0
c0103b2a:	68 00 22 18 c0       	push   $0xc0182200
c0103b2f:	e8 bb 86 00 00       	call   c010c1ef <Memset>
c0103b34:	83 c4 10             	add    $0x10,%esp
c0103b37:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103b3e:	83 ec 04             	sub    $0x4,%esp
c0103b41:	ff 75 f4             	pushl  -0xc(%ebp)
c0103b44:	6a 00                	push   $0x0
c0103b46:	68 40 06 11 c0       	push   $0xc0110640
c0103b4b:	e8 9f 86 00 00       	call   c010c1ef <Memset>
c0103b50:	83 c4 10             	add    $0x10,%esp
c0103b53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b56:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103b5b:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103b62:	00 00 00 
c0103b65:	83 ec 0c             	sub    $0xc,%esp
c0103b68:	6a 30                	push   $0x30
c0103b6a:	e8 81 fe ff ff       	call   c01039f0 <Seg2PhyAddr>
c0103b6f:	83 c4 10             	add    $0x10,%esp
c0103b72:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103b75:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103b7c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103b83:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b86:	0f b7 d0             	movzwl %ax,%edx
c0103b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b8c:	83 e8 01             	sub    $0x1,%eax
c0103b8f:	89 c1                	mov    %eax,%ecx
c0103b91:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b94:	52                   	push   %edx
c0103b95:	51                   	push   %ecx
c0103b96:	50                   	push   %eax
c0103b97:	68 00 f8 10 c0       	push   $0xc010f800
c0103b9c:	e8 e2 fd ff ff       	call   c0103983 <InitDescriptor>
c0103ba1:	83 c4 10             	add    $0x10,%esp
c0103ba4:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103bab:	68 f2 00 00 00       	push   $0xf2
c0103bb0:	68 ff ff 00 00       	push   $0xffff
c0103bb5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103bb8:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103bbd:	e8 c1 fd ff ff       	call   c0103983 <InitDescriptor>
c0103bc2:	83 c4 10             	add    $0x10,%esp
c0103bc5:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103bcc:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103bd3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103bda:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103bdd:	0f b7 c0             	movzwl %ax,%eax
c0103be0:	50                   	push   %eax
c0103be1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103be4:	6a 00                	push   $0x0
c0103be6:	68 08 f8 10 c0       	push   $0xc010f808
c0103beb:	e8 93 fd ff ff       	call   c0103983 <InitDescriptor>
c0103bf0:	83 c4 10             	add    $0x10,%esp
c0103bf3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103bf6:	0f b7 c0             	movzwl %ax,%eax
c0103bf9:	50                   	push   %eax
c0103bfa:	ff 75 d8             	pushl  -0x28(%ebp)
c0103bfd:	6a 00                	push   $0x0
c0103bff:	68 10 f8 10 c0       	push   $0xc010f810
c0103c04:	e8 7a fd ff ff       	call   c0103983 <InitDescriptor>
c0103c09:	83 c4 10             	add    $0x10,%esp
c0103c0c:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103c13:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103c1a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103c1d:	0f b7 c0             	movzwl %ax,%eax
c0103c20:	50                   	push   %eax
c0103c21:	ff 75 d8             	pushl  -0x28(%ebp)
c0103c24:	6a 00                	push   $0x0
c0103c26:	68 18 f8 10 c0       	push   $0xc010f818
c0103c2b:	e8 53 fd ff ff       	call   c0103983 <InitDescriptor>
c0103c30:	83 c4 10             	add    $0x10,%esp
c0103c33:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103c36:	0f b7 c0             	movzwl %ax,%eax
c0103c39:	50                   	push   %eax
c0103c3a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103c3d:	6a 00                	push   $0x0
c0103c3f:	68 20 f8 10 c0       	push   $0xc010f820
c0103c44:	e8 3a fd ff ff       	call   c0103983 <InitDescriptor>
c0103c49:	83 c4 10             	add    $0x10,%esp
c0103c4c:	90                   	nop
c0103c4d:	c9                   	leave  
c0103c4e:	c3                   	ret    

c0103c4f <InitInterruptDesc>:
c0103c4f:	55                   	push   %ebp
c0103c50:	89 e5                	mov    %esp,%ebp
c0103c52:	83 ec 10             	sub    $0x10,%esp
c0103c55:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c58:	c1 e0 03             	shl    $0x3,%eax
c0103c5b:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103c60:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103c63:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c66:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103c6a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c6d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103c70:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103c73:	89 c2                	mov    %eax,%edx
c0103c75:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c78:	66 89 10             	mov    %dx,(%eax)
c0103c7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c7e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103c84:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103c87:	c1 f8 10             	sar    $0x10,%eax
c0103c8a:	89 c2                	mov    %eax,%edx
c0103c8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c8f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103c93:	8b 45 10             	mov    0x10(%ebp),%eax
c0103c96:	c1 e0 04             	shl    $0x4,%eax
c0103c99:	89 c2                	mov    %eax,%edx
c0103c9b:	8b 45 14             	mov    0x14(%ebp),%eax
c0103c9e:	09 d0                	or     %edx,%eax
c0103ca0:	89 c2                	mov    %eax,%edx
c0103ca2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ca5:	88 50 05             	mov    %dl,0x5(%eax)
c0103ca8:	90                   	nop
c0103ca9:	c9                   	leave  
c0103caa:	c3                   	ret    

c0103cab <ReloadGDT>:
c0103cab:	55                   	push   %ebp
c0103cac:	89 e5                	mov    %esp,%ebp
c0103cae:	83 ec 28             	sub    $0x28,%esp
c0103cb1:	b8 d0 06 11 c0       	mov    $0xc01106d0,%eax
c0103cb6:	0f b7 00             	movzwl (%eax),%eax
c0103cb9:	98                   	cwtl   
c0103cba:	ba d2 06 11 c0       	mov    $0xc01106d2,%edx
c0103cbf:	8b 12                	mov    (%edx),%edx
c0103cc1:	83 ec 04             	sub    $0x4,%esp
c0103cc4:	50                   	push   %eax
c0103cc5:	52                   	push   %edx
c0103cc6:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103ccb:	e8 f1 84 00 00       	call   c010c1c1 <Memcpy2>
c0103cd0:	83 c4 10             	add    $0x10,%esp
c0103cd3:	c7 45 f0 d0 06 11 c0 	movl   $0xc01106d0,-0x10(%ebp)
c0103cda:	c7 45 ec d2 06 11 c0 	movl   $0xc01106d2,-0x14(%ebp)
c0103ce1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ce4:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103ce9:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103cee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103cf1:	89 10                	mov    %edx,(%eax)
c0103cf3:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103cfa:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103d01:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103d04:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103d09:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103d0e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103d11:	89 10                	mov    %edx,(%eax)
c0103d13:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103d1a:	eb 04                	jmp    c0103d20 <ReloadGDT+0x75>
c0103d1c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103d20:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103d27:	7e f3                	jle    c0103d1c <ReloadGDT+0x71>
c0103d29:	e8 a9 37 00 00       	call   c01074d7 <init_internal_interrupt>
c0103d2e:	e8 9b fd ff ff       	call   c0103ace <init_propt>
c0103d33:	90                   	nop
c0103d34:	c9                   	leave  
c0103d35:	c3                   	ret    

c0103d36 <select_console>:
c0103d36:	55                   	push   %ebp
c0103d37:	89 e5                	mov    %esp,%ebp
c0103d39:	83 ec 18             	sub    $0x18,%esp
c0103d3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d3f:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103d42:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103d46:	75 27                	jne    c0103d6f <select_console+0x39>
c0103d48:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103d4c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103d52:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103d57:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103d5c:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103d61:	83 ec 0c             	sub    $0xc,%esp
c0103d64:	50                   	push   %eax
c0103d65:	e8 08 00 00 00       	call   c0103d72 <flush>
c0103d6a:	83 c4 10             	add    $0x10,%esp
c0103d6d:	eb 01                	jmp    c0103d70 <select_console+0x3a>
c0103d6f:	90                   	nop
c0103d70:	c9                   	leave  
c0103d71:	c3                   	ret    

c0103d72 <flush>:
c0103d72:	55                   	push   %ebp
c0103d73:	89 e5                	mov    %esp,%ebp
c0103d75:	83 ec 08             	sub    $0x8,%esp
c0103d78:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d7b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d81:	8b 40 0c             	mov    0xc(%eax),%eax
c0103d84:	83 ec 0c             	sub    $0xc,%esp
c0103d87:	50                   	push   %eax
c0103d88:	e8 1e 00 00 00       	call   c0103dab <set_cursor>
c0103d8d:	83 c4 10             	add    $0x10,%esp
c0103d90:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d93:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d99:	8b 40 08             	mov    0x8(%eax),%eax
c0103d9c:	83 ec 0c             	sub    $0xc,%esp
c0103d9f:	50                   	push   %eax
c0103da0:	e8 64 00 00 00       	call   c0103e09 <set_console_start_video_addr>
c0103da5:	83 c4 10             	add    $0x10,%esp
c0103da8:	90                   	nop
c0103da9:	c9                   	leave  
c0103daa:	c3                   	ret    

c0103dab <set_cursor>:
c0103dab:	55                   	push   %ebp
c0103dac:	89 e5                	mov    %esp,%ebp
c0103dae:	83 ec 08             	sub    $0x8,%esp
c0103db1:	83 ec 08             	sub    $0x8,%esp
c0103db4:	6a 0e                	push   $0xe
c0103db6:	68 d4 03 00 00       	push   $0x3d4
c0103dbb:	e8 2b c5 ff ff       	call   c01002eb <out_byte>
c0103dc0:	83 c4 10             	add    $0x10,%esp
c0103dc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dc6:	c1 e8 08             	shr    $0x8,%eax
c0103dc9:	0f b7 c0             	movzwl %ax,%eax
c0103dcc:	83 ec 08             	sub    $0x8,%esp
c0103dcf:	50                   	push   %eax
c0103dd0:	68 d5 03 00 00       	push   $0x3d5
c0103dd5:	e8 11 c5 ff ff       	call   c01002eb <out_byte>
c0103dda:	83 c4 10             	add    $0x10,%esp
c0103ddd:	83 ec 08             	sub    $0x8,%esp
c0103de0:	6a 0f                	push   $0xf
c0103de2:	68 d4 03 00 00       	push   $0x3d4
c0103de7:	e8 ff c4 ff ff       	call   c01002eb <out_byte>
c0103dec:	83 c4 10             	add    $0x10,%esp
c0103def:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df2:	0f b7 c0             	movzwl %ax,%eax
c0103df5:	83 ec 08             	sub    $0x8,%esp
c0103df8:	50                   	push   %eax
c0103df9:	68 d5 03 00 00       	push   $0x3d5
c0103dfe:	e8 e8 c4 ff ff       	call   c01002eb <out_byte>
c0103e03:	83 c4 10             	add    $0x10,%esp
c0103e06:	90                   	nop
c0103e07:	c9                   	leave  
c0103e08:	c3                   	ret    

c0103e09 <set_console_start_video_addr>:
c0103e09:	55                   	push   %ebp
c0103e0a:	89 e5                	mov    %esp,%ebp
c0103e0c:	83 ec 08             	sub    $0x8,%esp
c0103e0f:	83 ec 08             	sub    $0x8,%esp
c0103e12:	6a 0c                	push   $0xc
c0103e14:	68 d4 03 00 00       	push   $0x3d4
c0103e19:	e8 cd c4 ff ff       	call   c01002eb <out_byte>
c0103e1e:	83 c4 10             	add    $0x10,%esp
c0103e21:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e24:	c1 e8 08             	shr    $0x8,%eax
c0103e27:	0f b7 c0             	movzwl %ax,%eax
c0103e2a:	83 ec 08             	sub    $0x8,%esp
c0103e2d:	50                   	push   %eax
c0103e2e:	68 d5 03 00 00       	push   $0x3d5
c0103e33:	e8 b3 c4 ff ff       	call   c01002eb <out_byte>
c0103e38:	83 c4 10             	add    $0x10,%esp
c0103e3b:	83 ec 08             	sub    $0x8,%esp
c0103e3e:	6a 0d                	push   $0xd
c0103e40:	68 d4 03 00 00       	push   $0x3d4
c0103e45:	e8 a1 c4 ff ff       	call   c01002eb <out_byte>
c0103e4a:	83 c4 10             	add    $0x10,%esp
c0103e4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e50:	0f b7 c0             	movzwl %ax,%eax
c0103e53:	83 ec 08             	sub    $0x8,%esp
c0103e56:	50                   	push   %eax
c0103e57:	68 d5 03 00 00       	push   $0x3d5
c0103e5c:	e8 8a c4 ff ff       	call   c01002eb <out_byte>
c0103e61:	83 c4 10             	add    $0x10,%esp
c0103e64:	90                   	nop
c0103e65:	c9                   	leave  
c0103e66:	c3                   	ret    

c0103e67 <put_key>:
c0103e67:	55                   	push   %ebp
c0103e68:	89 e5                	mov    %esp,%ebp
c0103e6a:	83 ec 04             	sub    $0x4,%esp
c0103e6d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103e70:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103e73:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e76:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103e7c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103e81:	77 4d                	ja     c0103ed0 <put_key+0x69>
c0103e83:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e86:	8b 00                	mov    (%eax),%eax
c0103e88:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103e8c:	89 10                	mov    %edx,(%eax)
c0103e8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e91:	8b 00                	mov    (%eax),%eax
c0103e93:	8d 50 04             	lea    0x4(%eax),%edx
c0103e96:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e99:	89 10                	mov    %edx,(%eax)
c0103e9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e9e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103ea4:	8d 50 01             	lea    0x1(%eax),%edx
c0103ea7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eaa:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103eb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb3:	8b 00                	mov    (%eax),%eax
c0103eb5:	8b 55 08             	mov    0x8(%ebp),%edx
c0103eb8:	83 c2 08             	add    $0x8,%edx
c0103ebb:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103ec1:	39 d0                	cmp    %edx,%eax
c0103ec3:	75 0b                	jne    c0103ed0 <put_key+0x69>
c0103ec5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ec8:	8d 50 08             	lea    0x8(%eax),%edx
c0103ecb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ece:	89 10                	mov    %edx,(%eax)
c0103ed0:	90                   	nop
c0103ed1:	c9                   	leave  
c0103ed2:	c3                   	ret    

c0103ed3 <scroll_up>:
c0103ed3:	55                   	push   %ebp
c0103ed4:	89 e5                	mov    %esp,%ebp
c0103ed6:	83 ec 08             	sub    $0x8,%esp
c0103ed9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103edc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ee2:	8b 40 08             	mov    0x8(%eax),%eax
c0103ee5:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103ee8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eeb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ef1:	8b 00                	mov    (%eax),%eax
c0103ef3:	39 c2                	cmp    %eax,%edx
c0103ef5:	76 1b                	jbe    c0103f12 <scroll_up+0x3f>
c0103ef7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103efa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f00:	8b 40 08             	mov    0x8(%eax),%eax
c0103f03:	83 e8 50             	sub    $0x50,%eax
c0103f06:	83 ec 0c             	sub    $0xc,%esp
c0103f09:	50                   	push   %eax
c0103f0a:	e8 fa fe ff ff       	call   c0103e09 <set_console_start_video_addr>
c0103f0f:	83 c4 10             	add    $0x10,%esp
c0103f12:	90                   	nop
c0103f13:	c9                   	leave  
c0103f14:	c3                   	ret    

c0103f15 <scroll_down>:
c0103f15:	55                   	push   %ebp
c0103f16:	89 e5                	mov    %esp,%ebp
c0103f18:	83 ec 08             	sub    $0x8,%esp
c0103f1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f1e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f24:	8b 40 08             	mov    0x8(%eax),%eax
c0103f27:	8d 48 50             	lea    0x50(%eax),%ecx
c0103f2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f2d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f33:	8b 10                	mov    (%eax),%edx
c0103f35:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f38:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f3e:	8b 40 04             	mov    0x4(%eax),%eax
c0103f41:	01 d0                	add    %edx,%eax
c0103f43:	39 c1                	cmp    %eax,%ecx
c0103f45:	73 36                	jae    c0103f7d <scroll_down+0x68>
c0103f47:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f4a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f50:	8b 40 08             	mov    0x8(%eax),%eax
c0103f53:	83 c0 50             	add    $0x50,%eax
c0103f56:	83 ec 0c             	sub    $0xc,%esp
c0103f59:	50                   	push   %eax
c0103f5a:	e8 aa fe ff ff       	call   c0103e09 <set_console_start_video_addr>
c0103f5f:	83 c4 10             	add    $0x10,%esp
c0103f62:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f65:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f6b:	8b 50 08             	mov    0x8(%eax),%edx
c0103f6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f71:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f77:	83 c2 50             	add    $0x50,%edx
c0103f7a:	89 50 08             	mov    %edx,0x8(%eax)
c0103f7d:	90                   	nop
c0103f7e:	c9                   	leave  
c0103f7f:	c3                   	ret    

c0103f80 <out_char>:
c0103f80:	55                   	push   %ebp
c0103f81:	89 e5                	mov    %esp,%ebp
c0103f83:	83 ec 28             	sub    $0x28,%esp
c0103f86:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103f89:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103f8c:	e8 a7 2d 00 00       	call   c0106d38 <intr_disable>
c0103f91:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103f94:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f97:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f9d:	8b 40 0c             	mov    0xc(%eax),%eax
c0103fa0:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103fa5:	01 c0                	add    %eax,%eax
c0103fa7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103faa:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103fae:	83 f8 08             	cmp    $0x8,%eax
c0103fb1:	0f 84 8d 00 00 00    	je     c0104044 <out_char+0xc4>
c0103fb7:	83 f8 0a             	cmp    $0xa,%eax
c0103fba:	0f 85 c9 00 00 00    	jne    c0104089 <out_char+0x109>
c0103fc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fc3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fc9:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fcc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fcf:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fd5:	8b 08                	mov    (%eax),%ecx
c0103fd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fda:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fe0:	8b 40 04             	mov    0x4(%eax),%eax
c0103fe3:	01 c8                	add    %ecx,%eax
c0103fe5:	83 e8 50             	sub    $0x50,%eax
c0103fe8:	39 c2                	cmp    %eax,%edx
c0103fea:	0f 83 f4 00 00 00    	jae    c01040e4 <out_char+0x164>
c0103ff0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ff9:	8b 08                	mov    (%eax),%ecx
c0103ffb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ffe:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104004:	8b 50 0c             	mov    0xc(%eax),%edx
c0104007:	8b 45 08             	mov    0x8(%ebp),%eax
c010400a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104010:	8b 00                	mov    (%eax),%eax
c0104012:	29 c2                	sub    %eax,%edx
c0104014:	89 d0                	mov    %edx,%eax
c0104016:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c010401b:	f7 e2                	mul    %edx
c010401d:	89 d0                	mov    %edx,%eax
c010401f:	c1 e8 06             	shr    $0x6,%eax
c0104022:	8d 50 01             	lea    0x1(%eax),%edx
c0104025:	89 d0                	mov    %edx,%eax
c0104027:	c1 e0 02             	shl    $0x2,%eax
c010402a:	01 d0                	add    %edx,%eax
c010402c:	c1 e0 04             	shl    $0x4,%eax
c010402f:	89 c2                	mov    %eax,%edx
c0104031:	8b 45 08             	mov    0x8(%ebp),%eax
c0104034:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010403a:	01 ca                	add    %ecx,%edx
c010403c:	89 50 0c             	mov    %edx,0xc(%eax)
c010403f:	e9 a0 00 00 00       	jmp    c01040e4 <out_char+0x164>
c0104044:	8b 45 08             	mov    0x8(%ebp),%eax
c0104047:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010404d:	8b 50 0c             	mov    0xc(%eax),%edx
c0104050:	8b 45 08             	mov    0x8(%ebp),%eax
c0104053:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104059:	8b 00                	mov    (%eax),%eax
c010405b:	39 c2                	cmp    %eax,%edx
c010405d:	0f 86 84 00 00 00    	jbe    c01040e7 <out_char+0x167>
c0104063:	8b 45 08             	mov    0x8(%ebp),%eax
c0104066:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010406c:	8b 50 0c             	mov    0xc(%eax),%edx
c010406f:	83 ea 01             	sub    $0x1,%edx
c0104072:	89 50 0c             	mov    %edx,0xc(%eax)
c0104075:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104078:	83 e8 02             	sub    $0x2,%eax
c010407b:	c6 00 20             	movb   $0x20,(%eax)
c010407e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104081:	83 e8 01             	sub    $0x1,%eax
c0104084:	c6 00 00             	movb   $0x0,(%eax)
c0104087:	eb 5e                	jmp    c01040e7 <out_char+0x167>
c0104089:	8b 45 08             	mov    0x8(%ebp),%eax
c010408c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104092:	8b 40 0c             	mov    0xc(%eax),%eax
c0104095:	8d 48 01             	lea    0x1(%eax),%ecx
c0104098:	8b 45 08             	mov    0x8(%ebp),%eax
c010409b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040a1:	8b 10                	mov    (%eax),%edx
c01040a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01040a6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040ac:	8b 40 04             	mov    0x4(%eax),%eax
c01040af:	01 d0                	add    %edx,%eax
c01040b1:	39 c1                	cmp    %eax,%ecx
c01040b3:	73 35                	jae    c01040ea <out_char+0x16a>
c01040b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01040b8:	8d 50 01             	lea    0x1(%eax),%edx
c01040bb:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01040be:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c01040c2:	88 10                	mov    %dl,(%eax)
c01040c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01040c7:	8d 50 01             	lea    0x1(%eax),%edx
c01040ca:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01040cd:	c6 00 0a             	movb   $0xa,(%eax)
c01040d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01040d3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040d9:	8b 50 0c             	mov    0xc(%eax),%edx
c01040dc:	83 c2 01             	add    $0x1,%edx
c01040df:	89 50 0c             	mov    %edx,0xc(%eax)
c01040e2:	eb 06                	jmp    c01040ea <out_char+0x16a>
c01040e4:	90                   	nop
c01040e5:	eb 14                	jmp    c01040fb <out_char+0x17b>
c01040e7:	90                   	nop
c01040e8:	eb 11                	jmp    c01040fb <out_char+0x17b>
c01040ea:	90                   	nop
c01040eb:	eb 0e                	jmp    c01040fb <out_char+0x17b>
c01040ed:	83 ec 0c             	sub    $0xc,%esp
c01040f0:	ff 75 08             	pushl  0x8(%ebp)
c01040f3:	e8 1d fe ff ff       	call   c0103f15 <scroll_down>
c01040f8:	83 c4 10             	add    $0x10,%esp
c01040fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01040fe:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104104:	8b 50 0c             	mov    0xc(%eax),%edx
c0104107:	8b 45 08             	mov    0x8(%ebp),%eax
c010410a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104110:	8b 40 08             	mov    0x8(%eax),%eax
c0104113:	29 c2                	sub    %eax,%edx
c0104115:	89 d0                	mov    %edx,%eax
c0104117:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c010411c:	77 cf                	ja     c01040ed <out_char+0x16d>
c010411e:	83 ec 0c             	sub    $0xc,%esp
c0104121:	ff 75 08             	pushl  0x8(%ebp)
c0104124:	e8 49 fc ff ff       	call   c0103d72 <flush>
c0104129:	83 c4 10             	add    $0x10,%esp
c010412c:	83 ec 0c             	sub    $0xc,%esp
c010412f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104132:	e8 2a 2c 00 00       	call   c0106d61 <intr_set_status>
c0104137:	83 c4 10             	add    $0x10,%esp
c010413a:	90                   	nop
c010413b:	c9                   	leave  
c010413c:	c3                   	ret    

c010413d <tty_dev_read>:
c010413d:	55                   	push   %ebp
c010413e:	89 e5                	mov    %esp,%ebp
c0104140:	83 ec 08             	sub    $0x8,%esp
c0104143:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104148:	39 45 08             	cmp    %eax,0x8(%ebp)
c010414b:	75 17                	jne    c0104164 <tty_dev_read+0x27>
c010414d:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104152:	85 c0                	test   %eax,%eax
c0104154:	7e 0e                	jle    c0104164 <tty_dev_read+0x27>
c0104156:	83 ec 0c             	sub    $0xc,%esp
c0104159:	ff 75 08             	pushl  0x8(%ebp)
c010415c:	e8 89 07 00 00       	call   c01048ea <keyboard_read>
c0104161:	83 c4 10             	add    $0x10,%esp
c0104164:	90                   	nop
c0104165:	c9                   	leave  
c0104166:	c3                   	ret    

c0104167 <tty_dev_write>:
c0104167:	55                   	push   %ebp
c0104168:	89 e5                	mov    %esp,%ebp
c010416a:	83 ec 28             	sub    $0x28,%esp
c010416d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104170:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104176:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104179:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104180:	e9 88 01 00 00       	jmp    c010430d <tty_dev_write+0x1a6>
c0104185:	8b 45 08             	mov    0x8(%ebp),%eax
c0104188:	8b 40 04             	mov    0x4(%eax),%eax
c010418b:	8b 00                	mov    (%eax),%eax
c010418d:	88 45 e7             	mov    %al,-0x19(%ebp)
c0104190:	8b 45 08             	mov    0x8(%ebp),%eax
c0104193:	8b 40 04             	mov    0x4(%eax),%eax
c0104196:	8d 50 04             	lea    0x4(%eax),%edx
c0104199:	8b 45 08             	mov    0x8(%ebp),%eax
c010419c:	89 50 04             	mov    %edx,0x4(%eax)
c010419f:	8b 45 08             	mov    0x8(%ebp),%eax
c01041a2:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01041a8:	8d 50 ff             	lea    -0x1(%eax),%edx
c01041ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ae:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c01041b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01041b7:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01041bd:	8d 50 01             	lea    0x1(%eax),%edx
c01041c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01041c3:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01041c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01041cc:	8b 40 04             	mov    0x4(%eax),%eax
c01041cf:	8b 55 08             	mov    0x8(%ebp),%edx
c01041d2:	83 c2 08             	add    $0x8,%edx
c01041d5:	81 c2 00 08 00 00    	add    $0x800,%edx
c01041db:	39 d0                	cmp    %edx,%eax
c01041dd:	75 0c                	jne    c01041eb <tty_dev_write+0x84>
c01041df:	8b 45 08             	mov    0x8(%ebp),%eax
c01041e2:	8d 50 08             	lea    0x8(%eax),%edx
c01041e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01041e8:	89 50 04             	mov    %edx,0x4(%eax)
c01041eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ee:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01041f4:	85 c0                	test   %eax,%eax
c01041f6:	0f 84 11 01 00 00    	je     c010430d <tty_dev_write+0x1a6>
c01041fc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104200:	3c 20                	cmp    $0x20,%al
c0104202:	76 08                	jbe    c010420c <tty_dev_write+0xa5>
c0104204:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104208:	3c 7e                	cmp    $0x7e,%al
c010420a:	76 10                	jbe    c010421c <tty_dev_write+0xb5>
c010420c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104210:	3c 20                	cmp    $0x20,%al
c0104212:	74 08                	je     c010421c <tty_dev_write+0xb5>
c0104214:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104218:	84 c0                	test   %al,%al
c010421a:	75 58                	jne    c0104274 <tty_dev_write+0x10d>
c010421c:	8b 45 08             	mov    0x8(%ebp),%eax
c010421f:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104225:	8b 45 08             	mov    0x8(%ebp),%eax
c0104228:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010422e:	01 d0                	add    %edx,%eax
c0104230:	83 e8 01             	sub    $0x1,%eax
c0104233:	89 c2                	mov    %eax,%edx
c0104235:	83 ec 04             	sub    $0x4,%esp
c0104238:	6a 01                	push   $0x1
c010423a:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010423d:	50                   	push   %eax
c010423e:	52                   	push   %edx
c010423f:	e8 58 2b 00 00       	call   c0106d9c <Memcpy>
c0104244:	83 c4 10             	add    $0x10,%esp
c0104247:	8b 45 08             	mov    0x8(%ebp),%eax
c010424a:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104250:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104253:	8b 45 08             	mov    0x8(%ebp),%eax
c0104256:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c010425c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104260:	0f b6 c0             	movzbl %al,%eax
c0104263:	83 ec 08             	sub    $0x8,%esp
c0104266:	50                   	push   %eax
c0104267:	ff 75 08             	pushl  0x8(%ebp)
c010426a:	e8 11 fd ff ff       	call   c0103f80 <out_char>
c010426f:	83 c4 10             	add    $0x10,%esp
c0104272:	eb 7c                	jmp    c01042f0 <tty_dev_write+0x189>
c0104274:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104278:	3c 08                	cmp    $0x8,%al
c010427a:	75 42                	jne    c01042be <tty_dev_write+0x157>
c010427c:	8b 45 08             	mov    0x8(%ebp),%eax
c010427f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104285:	8d 50 01             	lea    0x1(%eax),%edx
c0104288:	8b 45 08             	mov    0x8(%ebp),%eax
c010428b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104291:	8b 45 08             	mov    0x8(%ebp),%eax
c0104294:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010429a:	8d 50 fe             	lea    -0x2(%eax),%edx
c010429d:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01042a6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042aa:	0f b6 c0             	movzbl %al,%eax
c01042ad:	83 ec 08             	sub    $0x8,%esp
c01042b0:	50                   	push   %eax
c01042b1:	ff 75 08             	pushl  0x8(%ebp)
c01042b4:	e8 c7 fc ff ff       	call   c0103f80 <out_char>
c01042b9:	83 c4 10             	add    $0x10,%esp
c01042bc:	eb 32                	jmp    c01042f0 <tty_dev_write+0x189>
c01042be:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042c2:	3c 0a                	cmp    $0xa,%al
c01042c4:	75 2a                	jne    c01042f0 <tty_dev_write+0x189>
c01042c6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042ca:	0f b6 c0             	movzbl %al,%eax
c01042cd:	83 ec 08             	sub    $0x8,%esp
c01042d0:	50                   	push   %eax
c01042d1:	ff 75 08             	pushl  0x8(%ebp)
c01042d4:	e8 a7 fc ff ff       	call   c0103f80 <out_char>
c01042d9:	83 c4 10             	add    $0x10,%esp
c01042dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01042df:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c01042e6:	00 00 00 
c01042e9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01042f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01042f3:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01042f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01042fc:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0104302:	39 c2                	cmp    %eax,%edx
c0104304:	75 07                	jne    c010430d <tty_dev_write+0x1a6>
c0104306:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010430d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104310:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104316:	85 c0                	test   %eax,%eax
c0104318:	0f 85 67 fe ff ff    	jne    c0104185 <tty_dev_write+0x1e>
c010431e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104322:	74 6d                	je     c0104391 <tty_dev_write+0x22a>
c0104324:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c010432b:	83 ec 0c             	sub    $0xc,%esp
c010432e:	ff 75 ec             	pushl  -0x14(%ebp)
c0104331:	e8 b6 d3 ff ff       	call   c01016ec <sys_malloc>
c0104336:	83 c4 10             	add    $0x10,%esp
c0104339:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010433c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010433f:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104346:	8b 45 08             	mov    0x8(%ebp),%eax
c0104349:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010434f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104352:	89 50 60             	mov    %edx,0x60(%eax)
c0104355:	8b 45 08             	mov    0x8(%ebp),%eax
c0104358:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010435e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104361:	89 50 68             	mov    %edx,0x68(%eax)
c0104364:	8b 45 08             	mov    0x8(%ebp),%eax
c0104367:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010436d:	83 ec 04             	sub    $0x4,%esp
c0104370:	50                   	push   %eax
c0104371:	ff 75 e8             	pushl  -0x18(%ebp)
c0104374:	6a 01                	push   $0x1
c0104376:	e8 aa 52 00 00       	call   c0109625 <send_rec>
c010437b:	83 c4 10             	add    $0x10,%esp
c010437e:	83 ec 08             	sub    $0x8,%esp
c0104381:	ff 75 ec             	pushl  -0x14(%ebp)
c0104384:	ff 75 e8             	pushl  -0x18(%ebp)
c0104387:	e8 75 d3 ff ff       	call   c0101701 <sys_free>
c010438c:	83 c4 10             	add    $0x10,%esp
c010438f:	eb 01                	jmp    c0104392 <tty_dev_write+0x22b>
c0104391:	90                   	nop
c0104392:	c9                   	leave  
c0104393:	c3                   	ret    

c0104394 <tty_do_read>:
c0104394:	55                   	push   %ebp
c0104395:	89 e5                	mov    %esp,%ebp
c0104397:	83 ec 08             	sub    $0x8,%esp
c010439a:	8b 45 08             	mov    0x8(%ebp),%eax
c010439d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01043a4:	00 00 00 
c01043a7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043aa:	8b 50 68             	mov    0x68(%eax),%edx
c01043ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01043b0:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c01043b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043b9:	8b 00                	mov    (%eax),%eax
c01043bb:	89 c2                	mov    %eax,%edx
c01043bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01043c0:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c01043c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043c9:	8b 50 60             	mov    0x60(%eax),%edx
c01043cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01043cf:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01043d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043d8:	8b 50 60             	mov    0x60(%eax),%edx
c01043db:	8b 45 08             	mov    0x8(%ebp),%eax
c01043de:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c01043e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01043e7:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c01043ed:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043f0:	8b 40 10             	mov    0x10(%eax),%eax
c01043f3:	83 ec 08             	sub    $0x8,%esp
c01043f6:	52                   	push   %edx
c01043f7:	50                   	push   %eax
c01043f8:	e8 32 1b 00 00       	call   c0105f2f <alloc_virtual_memory>
c01043fd:	83 c4 10             	add    $0x10,%esp
c0104400:	89 c2                	mov    %eax,%edx
c0104402:	8b 45 08             	mov    0x8(%ebp),%eax
c0104405:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c010440b:	8b 45 08             	mov    0x8(%ebp),%eax
c010440e:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104414:	83 f8 02             	cmp    $0x2,%eax
c0104417:	74 1c                	je     c0104435 <tty_do_read+0xa1>
c0104419:	68 3b 01 00 00       	push   $0x13b
c010441e:	68 1d b5 10 c0       	push   $0xc010b51d
c0104423:	68 1d b5 10 c0       	push   $0xc010b51d
c0104428:	68 27 b5 10 c0       	push   $0xc010b527
c010442d:	e8 83 45 00 00       	call   c01089b5 <assertion_failure>
c0104432:	83 c4 10             	add    $0x10,%esp
c0104435:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104438:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010443f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104442:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104448:	83 ec 04             	sub    $0x4,%esp
c010444b:	50                   	push   %eax
c010444c:	ff 75 0c             	pushl  0xc(%ebp)
c010444f:	6a 01                	push   $0x1
c0104451:	e8 cf 51 00 00       	call   c0109625 <send_rec>
c0104456:	83 c4 10             	add    $0x10,%esp
c0104459:	90                   	nop
c010445a:	c9                   	leave  
c010445b:	c3                   	ret    

c010445c <tty_do_write>:
c010445c:	55                   	push   %ebp
c010445d:	89 e5                	mov    %esp,%ebp
c010445f:	53                   	push   %ebx
c0104460:	83 ec 24             	sub    $0x24,%esp
c0104463:	89 e0                	mov    %esp,%eax
c0104465:	89 c3                	mov    %eax,%ebx
c0104467:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010446e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104471:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104474:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104477:	89 c2                	mov    %eax,%edx
c0104479:	b8 10 00 00 00       	mov    $0x10,%eax
c010447e:	83 e8 01             	sub    $0x1,%eax
c0104481:	01 d0                	add    %edx,%eax
c0104483:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104488:	ba 00 00 00 00       	mov    $0x0,%edx
c010448d:	f7 f1                	div    %ecx
c010448f:	6b c0 10             	imul   $0x10,%eax,%eax
c0104492:	29 c4                	sub    %eax,%esp
c0104494:	89 e0                	mov    %esp,%eax
c0104496:	83 c0 00             	add    $0x0,%eax
c0104499:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010449c:	83 ec 04             	sub    $0x4,%esp
c010449f:	ff 75 e8             	pushl  -0x18(%ebp)
c01044a2:	6a 00                	push   $0x0
c01044a4:	ff 75 e0             	pushl  -0x20(%ebp)
c01044a7:	e8 43 7d 00 00       	call   c010c1ef <Memset>
c01044ac:	83 c4 10             	add    $0x10,%esp
c01044af:	8b 45 0c             	mov    0xc(%ebp),%eax
c01044b2:	8b 40 60             	mov    0x60(%eax),%eax
c01044b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01044b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01044bb:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01044c2:	00 00 00 
c01044c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01044c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01044cb:	8b 40 10             	mov    0x10(%eax),%eax
c01044ce:	83 ec 08             	sub    $0x8,%esp
c01044d1:	52                   	push   %edx
c01044d2:	50                   	push   %eax
c01044d3:	e8 57 1a 00 00       	call   c0105f2f <alloc_virtual_memory>
c01044d8:	83 c4 10             	add    $0x10,%esp
c01044db:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01044de:	eb 7e                	jmp    c010455e <tty_do_write+0x102>
c01044e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01044e3:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01044e6:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c01044ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01044ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01044f0:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01044f6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01044f9:	01 d0                	add    %edx,%eax
c01044fb:	83 ec 04             	sub    $0x4,%esp
c01044fe:	ff 75 f0             	pushl  -0x10(%ebp)
c0104501:	50                   	push   %eax
c0104502:	ff 75 e0             	pushl  -0x20(%ebp)
c0104505:	e8 92 28 00 00       	call   c0106d9c <Memcpy>
c010450a:	83 c4 10             	add    $0x10,%esp
c010450d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104510:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104513:	8b 45 08             	mov    0x8(%ebp),%eax
c0104516:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010451c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010451f:	01 c2                	add    %eax,%edx
c0104521:	8b 45 08             	mov    0x8(%ebp),%eax
c0104524:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c010452a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104531:	eb 25                	jmp    c0104558 <tty_do_write+0xfc>
c0104533:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104536:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104539:	01 d0                	add    %edx,%eax
c010453b:	0f b6 00             	movzbl (%eax),%eax
c010453e:	0f b6 c0             	movzbl %al,%eax
c0104541:	83 ec 08             	sub    $0x8,%esp
c0104544:	50                   	push   %eax
c0104545:	ff 75 08             	pushl  0x8(%ebp)
c0104548:	e8 33 fa ff ff       	call   c0103f80 <out_char>
c010454d:	83 c4 10             	add    $0x10,%esp
c0104550:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104554:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104558:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010455c:	75 d5                	jne    c0104533 <tty_do_write+0xd7>
c010455e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0104562:	0f 85 78 ff ff ff    	jne    c01044e0 <tty_do_write+0x84>
c0104568:	83 ec 0c             	sub    $0xc,%esp
c010456b:	6a 7c                	push   $0x7c
c010456d:	e8 7a d1 ff ff       	call   c01016ec <sys_malloc>
c0104572:	83 c4 10             	add    $0x10,%esp
c0104575:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104578:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010457b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104582:	8b 45 08             	mov    0x8(%ebp),%eax
c0104585:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010458b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010458e:	89 50 58             	mov    %edx,0x58(%eax)
c0104591:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104594:	8b 00                	mov    (%eax),%eax
c0104596:	83 ec 04             	sub    $0x4,%esp
c0104599:	50                   	push   %eax
c010459a:	ff 75 d8             	pushl  -0x28(%ebp)
c010459d:	6a 01                	push   $0x1
c010459f:	e8 81 50 00 00       	call   c0109625 <send_rec>
c01045a4:	83 c4 10             	add    $0x10,%esp
c01045a7:	83 ec 08             	sub    $0x8,%esp
c01045aa:	6a 7c                	push   $0x7c
c01045ac:	ff 75 d8             	pushl  -0x28(%ebp)
c01045af:	e8 4d d1 ff ff       	call   c0101701 <sys_free>
c01045b4:	83 c4 10             	add    $0x10,%esp
c01045b7:	89 dc                	mov    %ebx,%esp
c01045b9:	90                   	nop
c01045ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01045bd:	c9                   	leave  
c01045be:	c3                   	ret    

c01045bf <init_screen>:
c01045bf:	55                   	push   %ebp
c01045c0:	89 e5                	mov    %esp,%ebp
c01045c2:	83 ec 10             	sub    $0x10,%esp
c01045c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01045c8:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01045cd:	c1 f8 03             	sar    $0x3,%eax
c01045d0:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01045d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01045d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01045dc:	c1 e0 04             	shl    $0x4,%eax
c01045df:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c01045e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01045e8:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c01045ee:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c01045f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01045f8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01045fe:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0104601:	89 50 04             	mov    %edx,0x4(%eax)
c0104604:	8b 45 08             	mov    0x8(%ebp),%eax
c0104607:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010460d:	8b 50 04             	mov    0x4(%eax),%edx
c0104610:	8b 45 08             	mov    0x8(%ebp),%eax
c0104613:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104619:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010461d:	89 10                	mov    %edx,(%eax)
c010461f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104622:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104628:	8b 45 08             	mov    0x8(%ebp),%eax
c010462b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104631:	8b 12                	mov    (%edx),%edx
c0104633:	89 50 08             	mov    %edx,0x8(%eax)
c0104636:	8b 55 08             	mov    0x8(%ebp),%edx
c0104639:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010463f:	8b 40 08             	mov    0x8(%eax),%eax
c0104642:	89 42 0c             	mov    %eax,0xc(%edx)
c0104645:	90                   	nop
c0104646:	c9                   	leave  
c0104647:	c3                   	ret    

c0104648 <init_tty>:
c0104648:	55                   	push   %ebp
c0104649:	89 e5                	mov    %esp,%ebp
c010464b:	83 ec 18             	sub    $0x18,%esp
c010464e:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104655:	e9 92 00 00 00       	jmp    c01046ec <init_tty+0xa4>
c010465a:	83 ec 04             	sub    $0x4,%esp
c010465d:	68 28 08 00 00       	push   $0x828
c0104662:	6a 00                	push   $0x0
c0104664:	ff 75 f4             	pushl  -0xc(%ebp)
c0104667:	e8 83 7b 00 00       	call   c010c1ef <Memset>
c010466c:	83 c4 10             	add    $0x10,%esp
c010466f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104672:	8d 50 08             	lea    0x8(%eax),%edx
c0104675:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104678:	89 50 04             	mov    %edx,0x4(%eax)
c010467b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010467e:	8b 50 04             	mov    0x4(%eax),%edx
c0104681:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104684:	89 10                	mov    %edx,(%eax)
c0104686:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104689:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0104690:	00 00 00 
c0104693:	83 ec 0c             	sub    $0xc,%esp
c0104696:	ff 75 f4             	pushl  -0xc(%ebp)
c0104699:	e8 21 ff ff ff       	call   c01045bf <init_screen>
c010469e:	83 c4 10             	add    $0x10,%esp
c01046a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046a4:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01046a9:	85 c0                	test   %eax,%eax
c01046ab:	7e 38                	jle    c01046e5 <init_tty+0x9d>
c01046ad:	83 ec 08             	sub    $0x8,%esp
c01046b0:	6a 23                	push   $0x23
c01046b2:	ff 75 f4             	pushl  -0xc(%ebp)
c01046b5:	e8 c6 f8 ff ff       	call   c0103f80 <out_char>
c01046ba:	83 c4 10             	add    $0x10,%esp
c01046bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046c0:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c01046c5:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01046ca:	c1 f8 03             	sar    $0x3,%eax
c01046cd:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01046d3:	0f b6 c0             	movzbl %al,%eax
c01046d6:	83 ec 08             	sub    $0x8,%esp
c01046d9:	50                   	push   %eax
c01046da:	ff 75 f4             	pushl  -0xc(%ebp)
c01046dd:	e8 9e f8 ff ff       	call   c0103f80 <out_char>
c01046e2:	83 c4 10             	add    $0x10,%esp
c01046e5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01046ec:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01046f1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01046f4:	0f 82 60 ff ff ff    	jb     c010465a <init_tty+0x12>
c01046fa:	90                   	nop
c01046fb:	c9                   	leave  
c01046fc:	c3                   	ret    

c01046fd <TaskTTY>:
c01046fd:	55                   	push   %ebp
c01046fe:	89 e5                	mov    %esp,%ebp
c0104700:	83 ec 28             	sub    $0x28,%esp
c0104703:	e8 40 ff ff ff       	call   c0104648 <init_tty>
c0104708:	83 ec 0c             	sub    $0xc,%esp
c010470b:	6a 00                	push   $0x0
c010470d:	e8 24 f6 ff ff       	call   c0103d36 <select_console>
c0104712:	83 c4 10             	add    $0x10,%esp
c0104715:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010471c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104723:	83 ec 0c             	sub    $0xc,%esp
c0104726:	6a 7c                	push   $0x7c
c0104728:	e8 bf cf ff ff       	call   c01016ec <sys_malloc>
c010472d:	83 c4 10             	add    $0x10,%esp
c0104730:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104733:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c010473a:	eb 30                	jmp    c010476c <TaskTTY+0x6f>
c010473c:	83 ec 0c             	sub    $0xc,%esp
c010473f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104742:	e8 f6 f9 ff ff       	call   c010413d <tty_dev_read>
c0104747:	83 c4 10             	add    $0x10,%esp
c010474a:	83 ec 0c             	sub    $0xc,%esp
c010474d:	ff 75 f4             	pushl  -0xc(%ebp)
c0104750:	e8 12 fa ff ff       	call   c0104167 <tty_dev_write>
c0104755:	83 c4 10             	add    $0x10,%esp
c0104758:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010475b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104761:	85 c0                	test   %eax,%eax
c0104763:	75 d7                	jne    c010473c <TaskTTY+0x3f>
c0104765:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010476c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104771:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104774:	72 c6                	jb     c010473c <TaskTTY+0x3f>
c0104776:	83 ec 04             	sub    $0x4,%esp
c0104779:	6a 12                	push   $0x12
c010477b:	ff 75 e8             	pushl  -0x18(%ebp)
c010477e:	6a 02                	push   $0x2
c0104780:	e8 a0 4e 00 00       	call   c0109625 <send_rec>
c0104785:	83 c4 10             	add    $0x10,%esp
c0104788:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010478b:	8b 40 78             	mov    0x78(%eax),%eax
c010478e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104791:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104798:	74 28                	je     c01047c2 <TaskTTY+0xc5>
c010479a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01047a1:	7f 0b                	jg     c01047ae <TaskTTY+0xb1>
c01047a3:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c01047aa:	74 4e                	je     c01047fa <TaskTTY+0xfd>
c01047ac:	eb 4d                	jmp    c01047fb <TaskTTY+0xfe>
c01047ae:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c01047b5:	74 21                	je     c01047d8 <TaskTTY+0xdb>
c01047b7:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c01047be:	74 2e                	je     c01047ee <TaskTTY+0xf1>
c01047c0:	eb 39                	jmp    c01047fb <TaskTTY+0xfe>
c01047c2:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01047c7:	83 ec 08             	sub    $0x8,%esp
c01047ca:	ff 75 e8             	pushl  -0x18(%ebp)
c01047cd:	50                   	push   %eax
c01047ce:	e8 c1 fb ff ff       	call   c0104394 <tty_do_read>
c01047d3:	83 c4 10             	add    $0x10,%esp
c01047d6:	eb 23                	jmp    c01047fb <TaskTTY+0xfe>
c01047d8:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01047dd:	83 ec 08             	sub    $0x8,%esp
c01047e0:	ff 75 e8             	pushl  -0x18(%ebp)
c01047e3:	50                   	push   %eax
c01047e4:	e8 73 fc ff ff       	call   c010445c <tty_do_write>
c01047e9:	83 c4 10             	add    $0x10,%esp
c01047ec:	eb 0d                	jmp    c01047fb <TaskTTY+0xfe>
c01047ee:	c7 05 c4 06 11 c0 00 	movl   $0x0,0xc01106c4
c01047f5:	00 00 00 
c01047f8:	eb 01                	jmp    c01047fb <TaskTTY+0xfe>
c01047fa:	90                   	nop
c01047fb:	e9 33 ff ff ff       	jmp    c0104733 <TaskTTY+0x36>

c0104800 <keyboard_handler>:
c0104800:	55                   	push   %ebp
c0104801:	89 e5                	mov    %esp,%ebp
c0104803:	83 ec 18             	sub    $0x18,%esp
c0104806:	c7 05 c4 06 11 c0 01 	movl   $0x1,0xc01106c4
c010480d:	00 00 00 
c0104810:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104817:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010481c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104821:	7f 5e                	jg     c0104881 <keyboard_handler+0x81>
c0104823:	e8 e5 ba ff ff       	call   c010030d <disable_int>
c0104828:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010482b:	0f b7 c0             	movzwl %ax,%eax
c010482e:	83 ec 0c             	sub    $0xc,%esp
c0104831:	50                   	push   %eax
c0104832:	e8 a8 ba ff ff       	call   c01002df <in_byte>
c0104837:	83 c4 10             	add    $0x10,%esp
c010483a:	88 45 f3             	mov    %al,-0xd(%ebp)
c010483d:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104842:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104846:	88 10                	mov    %dl,(%eax)
c0104848:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010484d:	83 c0 01             	add    $0x1,%eax
c0104850:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104855:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010485a:	83 c0 01             	add    $0x1,%eax
c010485d:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104862:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104867:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c010486c:	39 d0                	cmp    %edx,%eax
c010486e:	72 0a                	jb     c010487a <keyboard_handler+0x7a>
c0104870:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104877:	fb 10 c0 
c010487a:	e8 90 ba ff ff       	call   c010030f <enable_int>
c010487f:	eb 01                	jmp    c0104882 <keyboard_handler+0x82>
c0104881:	90                   	nop
c0104882:	c9                   	leave  
c0104883:	c3                   	ret    

c0104884 <read_from_keyboard_buf>:
c0104884:	55                   	push   %ebp
c0104885:	89 e5                	mov    %esp,%ebp
c0104887:	83 ec 18             	sub    $0x18,%esp
c010488a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c010488e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104893:	85 c0                	test   %eax,%eax
c0104895:	7f 06                	jg     c010489d <read_from_keyboard_buf+0x19>
c0104897:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c010489b:	eb 4b                	jmp    c01048e8 <read_from_keyboard_buf+0x64>
c010489d:	e8 6b ba ff ff       	call   c010030d <disable_int>
c01048a2:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01048a7:	0f b6 00             	movzbl (%eax),%eax
c01048aa:	88 45 f7             	mov    %al,-0x9(%ebp)
c01048ad:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01048b2:	83 c0 01             	add    $0x1,%eax
c01048b5:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01048ba:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01048bf:	83 e8 01             	sub    $0x1,%eax
c01048c2:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01048c7:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01048cc:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01048d1:	39 d0                	cmp    %edx,%eax
c01048d3:	72 0a                	jb     c01048df <read_from_keyboard_buf+0x5b>
c01048d5:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c01048dc:	fb 10 c0 
c01048df:	e8 2b ba ff ff       	call   c010030f <enable_int>
c01048e4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01048e8:	c9                   	leave  
c01048e9:	c3                   	ret    

c01048ea <keyboard_read>:
c01048ea:	55                   	push   %ebp
c01048eb:	89 e5                	mov    %esp,%ebp
c01048ed:	83 ec 28             	sub    $0x28,%esp
c01048f0:	90                   	nop
c01048f1:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01048f6:	85 c0                	test   %eax,%eax
c01048f8:	7e f7                	jle    c01048f1 <keyboard_read+0x7>
c01048fa:	e8 85 ff ff ff       	call   c0104884 <read_from_keyboard_buf>
c01048ff:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104902:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104909:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010490d:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104911:	75 5a                	jne    c010496d <keyboard_read+0x83>
c0104913:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104917:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c010491b:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010491f:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104923:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104927:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c010492b:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010492f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104936:	eb 20                	jmp    c0104958 <keyboard_read+0x6e>
c0104938:	e8 47 ff ff ff       	call   c0104884 <read_from_keyboard_buf>
c010493d:	89 c1                	mov    %eax,%ecx
c010493f:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104942:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104945:	01 d0                	add    %edx,%eax
c0104947:	0f b6 00             	movzbl (%eax),%eax
c010494a:	38 c1                	cmp    %al,%cl
c010494c:	74 06                	je     c0104954 <keyboard_read+0x6a>
c010494e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0104952:	eb 0a                	jmp    c010495e <keyboard_read+0x74>
c0104954:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104958:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c010495c:	7e da                	jle    c0104938 <keyboard_read+0x4e>
c010495e:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0104962:	74 68                	je     c01049cc <keyboard_read+0xe2>
c0104964:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c010496b:	eb 5f                	jmp    c01049cc <keyboard_read+0xe2>
c010496d:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104971:	75 59                	jne    c01049cc <keyboard_read+0xe2>
c0104973:	e8 0c ff ff ff       	call   c0104884 <read_from_keyboard_buf>
c0104978:	3c 2a                	cmp    $0x2a,%al
c010497a:	75 1d                	jne    c0104999 <keyboard_read+0xaf>
c010497c:	e8 03 ff ff ff       	call   c0104884 <read_from_keyboard_buf>
c0104981:	3c e0                	cmp    $0xe0,%al
c0104983:	75 14                	jne    c0104999 <keyboard_read+0xaf>
c0104985:	e8 fa fe ff ff       	call   c0104884 <read_from_keyboard_buf>
c010498a:	3c 37                	cmp    $0x37,%al
c010498c:	75 0b                	jne    c0104999 <keyboard_read+0xaf>
c010498e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104995:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104999:	e8 e6 fe ff ff       	call   c0104884 <read_from_keyboard_buf>
c010499e:	3c b7                	cmp    $0xb7,%al
c01049a0:	75 1d                	jne    c01049bf <keyboard_read+0xd5>
c01049a2:	e8 dd fe ff ff       	call   c0104884 <read_from_keyboard_buf>
c01049a7:	3c e0                	cmp    $0xe0,%al
c01049a9:	75 14                	jne    c01049bf <keyboard_read+0xd5>
c01049ab:	e8 d4 fe ff ff       	call   c0104884 <read_from_keyboard_buf>
c01049b0:	3c aa                	cmp    $0xaa,%al
c01049b2:	75 0b                	jne    c01049bf <keyboard_read+0xd5>
c01049b4:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01049bb:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01049bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01049c3:	75 07                	jne    c01049cc <keyboard_read+0xe2>
c01049c5:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c01049cc:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c01049d3:	0f 84 8d 00 00 00    	je     c0104a66 <keyboard_read+0x17c>
c01049d9:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c01049e0:	0f 84 80 00 00 00    	je     c0104a66 <keyboard_read+0x17c>
c01049e6:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c01049ea:	0f 94 c2             	sete   %dl
c01049ed:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c01049f1:	0f 94 c0             	sete   %al
c01049f4:	09 d0                	or     %edx,%eax
c01049f6:	84 c0                	test   %al,%al
c01049f8:	74 07                	je     c0104a01 <keyboard_read+0x117>
c01049fa:	c6 05 cc 06 11 c0 01 	movb   $0x1,0xc01106cc
c0104a01:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104a05:	f7 d0                	not    %eax
c0104a07:	c0 e8 07             	shr    $0x7,%al
c0104a0a:	88 45 e9             	mov    %al,-0x17(%ebp)
c0104a0d:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104a11:	74 53                	je     c0104a66 <keyboard_read+0x17c>
c0104a13:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104a17:	74 4d                	je     c0104a66 <keyboard_read+0x17c>
c0104a19:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0104a1d:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104a24:	3c 01                	cmp    $0x1,%al
c0104a26:	75 04                	jne    c0104a2c <keyboard_read+0x142>
c0104a28:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104a2c:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104a33:	84 c0                	test   %al,%al
c0104a35:	74 04                	je     c0104a3b <keyboard_read+0x151>
c0104a37:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104a3b:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0104a3f:	89 d0                	mov    %edx,%eax
c0104a41:	01 c0                	add    %eax,%eax
c0104a43:	01 c2                	add    %eax,%edx
c0104a45:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104a49:	01 d0                	add    %edx,%eax
c0104a4b:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c0104a52:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104a55:	83 ec 08             	sub    $0x8,%esp
c0104a58:	ff 75 f4             	pushl  -0xc(%ebp)
c0104a5b:	ff 75 08             	pushl  0x8(%ebp)
c0104a5e:	e8 1a 00 00 00       	call   c0104a7d <in_process>
c0104a63:	83 c4 10             	add    $0x10,%esp
c0104a66:	90                   	nop
c0104a67:	c9                   	leave  
c0104a68:	c3                   	ret    

c0104a69 <init_keyboard_handler>:
c0104a69:	55                   	push   %ebp
c0104a6a:	89 e5                	mov    %esp,%ebp
c0104a6c:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a73:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104a7a:	90                   	nop
c0104a7b:	5d                   	pop    %ebp
c0104a7c:	c3                   	ret    

c0104a7d <in_process>:
c0104a7d:	55                   	push   %ebp
c0104a7e:	89 e5                	mov    %esp,%ebp
c0104a80:	83 ec 18             	sub    $0x18,%esp
c0104a83:	83 ec 04             	sub    $0x4,%esp
c0104a86:	6a 02                	push   $0x2
c0104a88:	6a 00                	push   $0x0
c0104a8a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0104a8d:	50                   	push   %eax
c0104a8e:	e8 5c 77 00 00       	call   c010c1ef <Memset>
c0104a93:	83 c4 10             	add    $0x10,%esp
c0104a96:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a99:	25 00 01 00 00       	and    $0x100,%eax
c0104a9e:	85 c0                	test   %eax,%eax
c0104aa0:	75 28                	jne    c0104aca <in_process+0x4d>
c0104aa2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104aa5:	0f b6 c0             	movzbl %al,%eax
c0104aa8:	83 ec 08             	sub    $0x8,%esp
c0104aab:	50                   	push   %eax
c0104aac:	ff 75 08             	pushl  0x8(%ebp)
c0104aaf:	e8 b3 f3 ff ff       	call   c0103e67 <put_key>
c0104ab4:	83 c4 10             	add    $0x10,%esp
c0104ab7:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104abe:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104ac5:	e9 42 01 00 00       	jmp    c0104c0c <in_process+0x18f>
c0104aca:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104ad1:	84 c0                	test   %al,%al
c0104ad3:	0f 84 a9 00 00 00    	je     c0104b82 <in_process+0x105>
c0104ad9:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104add:	0f 84 9f 00 00 00    	je     c0104b82 <in_process+0x105>
c0104ae3:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104ae7:	0f 84 95 00 00 00    	je     c0104b82 <in_process+0x105>
c0104aed:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104af4:	74 64                	je     c0104b5a <in_process+0xdd>
c0104af6:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104afd:	77 0b                	ja     c0104b0a <in_process+0x8d>
c0104aff:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104b06:	74 64                	je     c0104b6c <in_process+0xef>
c0104b08:	eb 73                	jmp    c0104b7d <in_process+0x100>
c0104b0a:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104b11:	74 0b                	je     c0104b1e <in_process+0xa1>
c0104b13:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104b1a:	74 20                	je     c0104b3c <in_process+0xbf>
c0104b1c:	eb 5f                	jmp    c0104b7d <in_process+0x100>
c0104b1e:	83 ec 0c             	sub    $0xc,%esp
c0104b21:	ff 75 08             	pushl  0x8(%ebp)
c0104b24:	e8 aa f3 ff ff       	call   c0103ed3 <scroll_up>
c0104b29:	83 c4 10             	add    $0x10,%esp
c0104b2c:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104b33:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104b3a:	eb 41                	jmp    c0104b7d <in_process+0x100>
c0104b3c:	83 ec 0c             	sub    $0xc,%esp
c0104b3f:	ff 75 08             	pushl  0x8(%ebp)
c0104b42:	e8 ce f3 ff ff       	call   c0103f15 <scroll_down>
c0104b47:	83 c4 10             	add    $0x10,%esp
c0104b4a:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104b51:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104b58:	eb 23                	jmp    c0104b7d <in_process+0x100>
c0104b5a:	83 ec 08             	sub    $0x8,%esp
c0104b5d:	6a 0a                	push   $0xa
c0104b5f:	ff 75 08             	pushl  0x8(%ebp)
c0104b62:	e8 19 f4 ff ff       	call   c0103f80 <out_char>
c0104b67:	83 c4 10             	add    $0x10,%esp
c0104b6a:	eb 11                	jmp    c0104b7d <in_process+0x100>
c0104b6c:	83 ec 08             	sub    $0x8,%esp
c0104b6f:	6a 08                	push   $0x8
c0104b71:	ff 75 08             	pushl  0x8(%ebp)
c0104b74:	e8 07 f4 ff ff       	call   c0103f80 <out_char>
c0104b79:	83 c4 10             	add    $0x10,%esp
c0104b7c:	90                   	nop
c0104b7d:	e9 8a 00 00 00       	jmp    c0104c0c <in_process+0x18f>
c0104b82:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104b89:	74 55                	je     c0104be0 <in_process+0x163>
c0104b8b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104b92:	77 14                	ja     c0104ba8 <in_process+0x12b>
c0104b94:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104b9b:	74 31                	je     c0104bce <in_process+0x151>
c0104b9d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104ba4:	74 16                	je     c0104bbc <in_process+0x13f>
c0104ba6:	eb 64                	jmp    c0104c0c <in_process+0x18f>
c0104ba8:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104baf:	74 3e                	je     c0104bef <in_process+0x172>
c0104bb1:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104bb8:	74 44                	je     c0104bfe <in_process+0x181>
c0104bba:	eb 50                	jmp    c0104c0c <in_process+0x18f>
c0104bbc:	83 ec 08             	sub    $0x8,%esp
c0104bbf:	6a 0a                	push   $0xa
c0104bc1:	ff 75 08             	pushl  0x8(%ebp)
c0104bc4:	e8 9e f2 ff ff       	call   c0103e67 <put_key>
c0104bc9:	83 c4 10             	add    $0x10,%esp
c0104bcc:	eb 3e                	jmp    c0104c0c <in_process+0x18f>
c0104bce:	83 ec 08             	sub    $0x8,%esp
c0104bd1:	6a 08                	push   $0x8
c0104bd3:	ff 75 08             	pushl  0x8(%ebp)
c0104bd6:	e8 8c f2 ff ff       	call   c0103e67 <put_key>
c0104bdb:	83 c4 10             	add    $0x10,%esp
c0104bde:	eb 2c                	jmp    c0104c0c <in_process+0x18f>
c0104be0:	83 ec 0c             	sub    $0xc,%esp
c0104be3:	6a 00                	push   $0x0
c0104be5:	e8 4c f1 ff ff       	call   c0103d36 <select_console>
c0104bea:	83 c4 10             	add    $0x10,%esp
c0104bed:	eb 1d                	jmp    c0104c0c <in_process+0x18f>
c0104bef:	83 ec 0c             	sub    $0xc,%esp
c0104bf2:	6a 01                	push   $0x1
c0104bf4:	e8 3d f1 ff ff       	call   c0103d36 <select_console>
c0104bf9:	83 c4 10             	add    $0x10,%esp
c0104bfc:	eb 0e                	jmp    c0104c0c <in_process+0x18f>
c0104bfe:	83 ec 0c             	sub    $0xc,%esp
c0104c01:	6a 02                	push   $0x2
c0104c03:	e8 2e f1 ff ff       	call   c0103d36 <select_console>
c0104c08:	83 c4 10             	add    $0x10,%esp
c0104c0b:	90                   	nop
c0104c0c:	90                   	nop
c0104c0d:	c9                   	leave  
c0104c0e:	c3                   	ret    

c0104c0f <open>:
c0104c0f:	55                   	push   %ebp
c0104c10:	89 e5                	mov    %esp,%ebp
c0104c12:	83 ec 18             	sub    $0x18,%esp
c0104c15:	83 ec 0c             	sub    $0xc,%esp
c0104c18:	6a 7c                	push   $0x7c
c0104c1a:	e8 cd ca ff ff       	call   c01016ec <sys_malloc>
c0104c1f:	83 c4 10             	add    $0x10,%esp
c0104c22:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104c25:	83 ec 04             	sub    $0x4,%esp
c0104c28:	6a 7c                	push   $0x7c
c0104c2a:	6a 00                	push   $0x0
c0104c2c:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c2f:	e8 bb 75 00 00       	call   c010c1ef <Memset>
c0104c34:	83 c4 10             	add    $0x10,%esp
c0104c37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c3a:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104c41:	83 ec 0c             	sub    $0xc,%esp
c0104c44:	ff 75 08             	pushl  0x8(%ebp)
c0104c47:	e8 32 14 00 00       	call   c010607e <get_physical_address>
c0104c4c:	83 c4 10             	add    $0x10,%esp
c0104c4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c55:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104c58:	89 50 44             	mov    %edx,0x44(%eax)
c0104c5b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104c5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c61:	89 50 74             	mov    %edx,0x74(%eax)
c0104c64:	83 ec 0c             	sub    $0xc,%esp
c0104c67:	ff 75 08             	pushl  0x8(%ebp)
c0104c6a:	e8 b9 75 00 00       	call   c010c228 <Strlen>
c0104c6f:	83 c4 10             	add    $0x10,%esp
c0104c72:	89 c2                	mov    %eax,%edx
c0104c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c77:	89 50 40             	mov    %edx,0x40(%eax)
c0104c7a:	83 ec 04             	sub    $0x4,%esp
c0104c7d:	6a 02                	push   $0x2
c0104c7f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c82:	6a 03                	push   $0x3
c0104c84:	e8 9c 49 00 00       	call   c0109625 <send_rec>
c0104c89:	83 c4 10             	add    $0x10,%esp
c0104c8c:	83 ec 08             	sub    $0x8,%esp
c0104c8f:	6a 7c                	push   $0x7c
c0104c91:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c94:	e8 68 ca ff ff       	call   c0101701 <sys_free>
c0104c99:	83 c4 10             	add    $0x10,%esp
c0104c9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c9f:	8b 40 50             	mov    0x50(%eax),%eax
c0104ca2:	c9                   	leave  
c0104ca3:	c3                   	ret    

c0104ca4 <read>:
c0104ca4:	55                   	push   %ebp
c0104ca5:	89 e5                	mov    %esp,%ebp
c0104ca7:	83 ec 38             	sub    $0x38,%esp
c0104caa:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104cb1:	83 ec 0c             	sub    $0xc,%esp
c0104cb4:	ff 75 dc             	pushl  -0x24(%ebp)
c0104cb7:	e8 30 ca ff ff       	call   c01016ec <sys_malloc>
c0104cbc:	83 c4 10             	add    $0x10,%esp
c0104cbf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104cc2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104cc5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104cca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104ccd:	83 ec 0c             	sub    $0xc,%esp
c0104cd0:	ff 75 0c             	pushl  0xc(%ebp)
c0104cd3:	e8 a6 13 00 00       	call   c010607e <get_physical_address>
c0104cd8:	83 c4 10             	add    $0x10,%esp
c0104cdb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104cde:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ce1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104ce6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104ce9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104cec:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104cf1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104cf4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104cfb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104d02:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d05:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d08:	01 d0                	add    %edx,%eax
c0104d0a:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104d0d:	0f 83 a8 00 00 00    	jae    c0104dbb <read+0x117>
c0104d13:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104d16:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104d19:	05 00 10 00 00       	add    $0x1000,%eax
c0104d1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104d21:	8b 45 10             	mov    0x10(%ebp),%eax
c0104d24:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104d27:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104d2a:	83 ec 04             	sub    $0x4,%esp
c0104d2d:	50                   	push   %eax
c0104d2e:	6a 00                	push   $0x0
c0104d30:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d33:	e8 b7 74 00 00       	call   c010c1ef <Memset>
c0104d38:	83 c4 10             	add    $0x10,%esp
c0104d3b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d3e:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104d45:	8b 55 08             	mov    0x8(%ebp),%edx
c0104d48:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d4b:	89 50 50             	mov    %edx,0x50(%eax)
c0104d4e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d51:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104d54:	89 50 10             	mov    %edx,0x10(%eax)
c0104d57:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d5a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104d5d:	89 50 60             	mov    %edx,0x60(%eax)
c0104d60:	83 ec 04             	sub    $0x4,%esp
c0104d63:	6a 02                	push   $0x2
c0104d65:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d68:	6a 03                	push   $0x3
c0104d6a:	e8 b6 48 00 00       	call   c0109625 <send_rec>
c0104d6f:	83 c4 10             	add    $0x10,%esp
c0104d72:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d75:	8b 40 60             	mov    0x60(%eax),%eax
c0104d78:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104d7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104d7e:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104d81:	8b 45 10             	mov    0x10(%ebp),%eax
c0104d84:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104d87:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104d8a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104d8d:	89 45 10             	mov    %eax,0x10(%ebp)
c0104d90:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104d97:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104d9e:	83 ec 0c             	sub    $0xc,%esp
c0104da1:	ff 75 f4             	pushl  -0xc(%ebp)
c0104da4:	e8 d5 12 00 00       	call   c010607e <get_physical_address>
c0104da9:	83 c4 10             	add    $0x10,%esp
c0104dac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104daf:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104db3:	0f 85 6e ff ff ff    	jne    c0104d27 <read+0x83>
c0104db9:	eb 54                	jmp    c0104e0f <read+0x16b>
c0104dbb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104dbe:	83 ec 04             	sub    $0x4,%esp
c0104dc1:	50                   	push   %eax
c0104dc2:	6a 00                	push   $0x0
c0104dc4:	ff 75 d8             	pushl  -0x28(%ebp)
c0104dc7:	e8 23 74 00 00       	call   c010c1ef <Memset>
c0104dcc:	83 c4 10             	add    $0x10,%esp
c0104dcf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104dd2:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104dd9:	8b 55 08             	mov    0x8(%ebp),%edx
c0104ddc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ddf:	89 50 50             	mov    %edx,0x50(%eax)
c0104de2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104de5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104de8:	89 50 10             	mov    %edx,0x10(%eax)
c0104deb:	8b 55 10             	mov    0x10(%ebp),%edx
c0104dee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104df1:	89 50 60             	mov    %edx,0x60(%eax)
c0104df4:	83 ec 04             	sub    $0x4,%esp
c0104df7:	6a 02                	push   $0x2
c0104df9:	ff 75 d8             	pushl  -0x28(%ebp)
c0104dfc:	6a 03                	push   $0x3
c0104dfe:	e8 22 48 00 00       	call   c0109625 <send_rec>
c0104e03:	83 c4 10             	add    $0x10,%esp
c0104e06:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e09:	8b 40 60             	mov    0x60(%eax),%eax
c0104e0c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104e0f:	83 ec 08             	sub    $0x8,%esp
c0104e12:	ff 75 dc             	pushl  -0x24(%ebp)
c0104e15:	ff 75 d8             	pushl  -0x28(%ebp)
c0104e18:	e8 e4 c8 ff ff       	call   c0101701 <sys_free>
c0104e1d:	83 c4 10             	add    $0x10,%esp
c0104e20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104e23:	c9                   	leave  
c0104e24:	c3                   	ret    

c0104e25 <write>:
c0104e25:	55                   	push   %ebp
c0104e26:	89 e5                	mov    %esp,%ebp
c0104e28:	83 ec 18             	sub    $0x18,%esp
c0104e2b:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104e32:	83 ec 0c             	sub    $0xc,%esp
c0104e35:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e38:	e8 af c8 ff ff       	call   c01016ec <sys_malloc>
c0104e3d:	83 c4 10             	add    $0x10,%esp
c0104e40:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104e43:	83 ec 0c             	sub    $0xc,%esp
c0104e46:	ff 75 0c             	pushl  0xc(%ebp)
c0104e49:	e8 30 12 00 00       	call   c010607e <get_physical_address>
c0104e4e:	83 c4 10             	add    $0x10,%esp
c0104e51:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104e54:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e57:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104e5e:	8b 55 08             	mov    0x8(%ebp),%edx
c0104e61:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e64:	89 50 50             	mov    %edx,0x50(%eax)
c0104e67:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e6a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104e6d:	89 50 10             	mov    %edx,0x10(%eax)
c0104e70:	8b 55 10             	mov    0x10(%ebp),%edx
c0104e73:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e76:	89 50 60             	mov    %edx,0x60(%eax)
c0104e79:	83 ec 04             	sub    $0x4,%esp
c0104e7c:	6a 02                	push   $0x2
c0104e7e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104e81:	6a 03                	push   $0x3
c0104e83:	e8 9d 47 00 00       	call   c0109625 <send_rec>
c0104e88:	83 c4 10             	add    $0x10,%esp
c0104e8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e8e:	8b 40 60             	mov    0x60(%eax),%eax
c0104e91:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104e94:	83 ec 08             	sub    $0x8,%esp
c0104e97:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e9a:	ff 75 f0             	pushl  -0x10(%ebp)
c0104e9d:	e8 5f c8 ff ff       	call   c0101701 <sys_free>
c0104ea2:	83 c4 10             	add    $0x10,%esp
c0104ea5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104ea8:	c9                   	leave  
c0104ea9:	c3                   	ret    

c0104eaa <close>:
c0104eaa:	55                   	push   %ebp
c0104eab:	89 e5                	mov    %esp,%ebp
c0104ead:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104eb3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104eba:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ebd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104ec0:	83 ec 04             	sub    $0x4,%esp
c0104ec3:	6a 02                	push   $0x2
c0104ec5:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ecb:	50                   	push   %eax
c0104ecc:	6a 03                	push   $0x3
c0104ece:	e8 52 47 00 00       	call   c0109625 <send_rec>
c0104ed3:	83 c4 10             	add    $0x10,%esp
c0104ed6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ed9:	83 f8 65             	cmp    $0x65,%eax
c0104edc:	74 19                	je     c0104ef7 <close+0x4d>
c0104ede:	6a 13                	push   $0x13
c0104ee0:	68 3f b5 10 c0       	push   $0xc010b53f
c0104ee5:	68 3f b5 10 c0       	push   $0xc010b53f
c0104eea:	68 4b b5 10 c0       	push   $0xc010b54b
c0104eef:	e8 c1 3a 00 00       	call   c01089b5 <assertion_failure>
c0104ef4:	83 c4 10             	add    $0x10,%esp
c0104ef7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104efa:	c9                   	leave  
c0104efb:	c3                   	ret    

c0104efc <wait>:
c0104efc:	55                   	push   %ebp
c0104efd:	89 e5                	mov    %esp,%ebp
c0104eff:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f05:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104f0c:	83 ec 04             	sub    $0x4,%esp
c0104f0f:	6a 01                	push   $0x1
c0104f11:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f17:	50                   	push   %eax
c0104f18:	6a 03                	push   $0x3
c0104f1a:	e8 06 47 00 00       	call   c0109625 <send_rec>
c0104f1f:	83 c4 10             	add    $0x10,%esp
c0104f22:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104f25:	89 c2                	mov    %eax,%edx
c0104f27:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f2a:	89 10                	mov    %edx,(%eax)
c0104f2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f2f:	83 f8 21             	cmp    $0x21,%eax
c0104f32:	74 05                	je     c0104f39 <wait+0x3d>
c0104f34:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f37:	eb 05                	jmp    c0104f3e <wait+0x42>
c0104f39:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104f3e:	c9                   	leave  
c0104f3f:	c3                   	ret    

c0104f40 <exit>:
c0104f40:	55                   	push   %ebp
c0104f41:	89 e5                	mov    %esp,%ebp
c0104f43:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f49:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104f50:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f53:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104f56:	83 ec 04             	sub    $0x4,%esp
c0104f59:	6a 01                	push   $0x1
c0104f5b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f61:	50                   	push   %eax
c0104f62:	6a 03                	push   $0x3
c0104f64:	e8 bc 46 00 00       	call   c0109625 <send_rec>
c0104f69:	83 c4 10             	add    $0x10,%esp
c0104f6c:	90                   	nop
c0104f6d:	c9                   	leave  
c0104f6e:	c3                   	ret    

c0104f6f <fork>:
c0104f6f:	55                   	push   %ebp
c0104f70:	89 e5                	mov    %esp,%ebp
c0104f72:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f78:	83 ec 04             	sub    $0x4,%esp
c0104f7b:	6a 7c                	push   $0x7c
c0104f7d:	6a 00                	push   $0x0
c0104f7f:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f85:	50                   	push   %eax
c0104f86:	e8 64 72 00 00       	call   c010c1ef <Memset>
c0104f8b:	83 c4 10             	add    $0x10,%esp
c0104f8e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104f95:	83 ec 04             	sub    $0x4,%esp
c0104f98:	6a 01                	push   $0x1
c0104f9a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104fa0:	50                   	push   %eax
c0104fa1:	6a 03                	push   $0x3
c0104fa3:	e8 7d 46 00 00       	call   c0109625 <send_rec>
c0104fa8:	83 c4 10             	add    $0x10,%esp
c0104fab:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104fb2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fb5:	c9                   	leave  
c0104fb6:	c3                   	ret    

c0104fb7 <getpid>:
c0104fb7:	55                   	push   %ebp
c0104fb8:	89 e5                	mov    %esp,%ebp
c0104fba:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104fc0:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104fc7:	83 ec 04             	sub    $0x4,%esp
c0104fca:	6a 05                	push   $0x5
c0104fcc:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104fd2:	50                   	push   %eax
c0104fd3:	6a 03                	push   $0x3
c0104fd5:	e8 4b 46 00 00       	call   c0109625 <send_rec>
c0104fda:	83 c4 10             	add    $0x10,%esp
c0104fdd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fe0:	c9                   	leave  
c0104fe1:	c3                   	ret    

c0104fe2 <exec>:
c0104fe2:	55                   	push   %ebp
c0104fe3:	89 e5                	mov    %esp,%ebp
c0104fe5:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104feb:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104ff2:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ff5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104ff8:	83 ec 0c             	sub    $0xc,%esp
c0104ffb:	ff 75 08             	pushl  0x8(%ebp)
c0104ffe:	e8 25 72 00 00       	call   c010c228 <Strlen>
c0105003:	83 c4 10             	add    $0x10,%esp
c0105006:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0105009:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0105010:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0105017:	83 ec 04             	sub    $0x4,%esp
c010501a:	6a 01                	push   $0x1
c010501c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105022:	50                   	push   %eax
c0105023:	6a 03                	push   $0x3
c0105025:	e8 fb 45 00 00       	call   c0109625 <send_rec>
c010502a:	83 c4 10             	add    $0x10,%esp
c010502d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105030:	83 f8 65             	cmp    $0x65,%eax
c0105033:	74 19                	je     c010504e <exec+0x6c>
c0105035:	6a 19                	push   $0x19
c0105037:	68 63 b5 10 c0       	push   $0xc010b563
c010503c:	68 63 b5 10 c0       	push   $0xc010b563
c0105041:	68 6e b5 10 c0       	push   $0xc010b56e
c0105046:	e8 6a 39 00 00       	call   c01089b5 <assertion_failure>
c010504b:	83 c4 10             	add    $0x10,%esp
c010504e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105051:	c9                   	leave  
c0105052:	c3                   	ret    

c0105053 <execv>:
c0105053:	55                   	push   %ebp
c0105054:	89 e5                	mov    %esp,%ebp
c0105056:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c010505c:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0105063:	83 ec 0c             	sub    $0xc,%esp
c0105066:	ff 75 e0             	pushl  -0x20(%ebp)
c0105069:	e8 7e c6 ff ff       	call   c01016ec <sys_malloc>
c010506e:	83 c4 10             	add    $0x10,%esp
c0105071:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105074:	66 87 db             	xchg   %bx,%bx
c0105077:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010507a:	83 ec 04             	sub    $0x4,%esp
c010507d:	50                   	push   %eax
c010507e:	6a 00                	push   $0x0
c0105080:	ff 75 dc             	pushl  -0x24(%ebp)
c0105083:	e8 67 71 00 00       	call   c010c1ef <Memset>
c0105088:	83 c4 10             	add    $0x10,%esp
c010508b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010508e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105091:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105098:	eb 23                	jmp    c01050bd <execv+0x6a>
c010509a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010509d:	8b 00                	mov    (%eax),%eax
c010509f:	83 ec 08             	sub    $0x8,%esp
c01050a2:	50                   	push   %eax
c01050a3:	68 86 b5 10 c0       	push   $0xc010b586
c01050a8:	e8 ab 35 00 00       	call   c0108658 <Printf>
c01050ad:	83 c4 10             	add    $0x10,%esp
c01050b0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c01050b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050b7:	83 c0 04             	add    $0x4,%eax
c01050ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01050c0:	8b 00                	mov    (%eax),%eax
c01050c2:	85 c0                	test   %eax,%eax
c01050c4:	75 d4                	jne    c010509a <execv+0x47>
c01050c6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01050c9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050cc:	01 d0                	add    %edx,%eax
c01050ce:	c6 00 00             	movb   $0x0,(%eax)
c01050d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050d4:	83 c0 04             	add    $0x4,%eax
c01050d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050da:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01050e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01050e3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01050e6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01050ed:	eb 5b                	jmp    c010514a <execv+0xf7>
c01050ef:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01050f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050f5:	01 c2                	add    %eax,%edx
c01050f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01050fa:	89 10                	mov    %edx,(%eax)
c01050fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01050ff:	8b 00                	mov    (%eax),%eax
c0105101:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0105104:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0105107:	01 ca                	add    %ecx,%edx
c0105109:	83 ec 08             	sub    $0x8,%esp
c010510c:	50                   	push   %eax
c010510d:	52                   	push   %edx
c010510e:	e8 fb 70 00 00       	call   c010c20e <Strcpy>
c0105113:	83 c4 10             	add    $0x10,%esp
c0105116:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105119:	8b 00                	mov    (%eax),%eax
c010511b:	83 ec 0c             	sub    $0xc,%esp
c010511e:	50                   	push   %eax
c010511f:	e8 04 71 00 00       	call   c010c228 <Strlen>
c0105124:	83 c4 10             	add    $0x10,%esp
c0105127:	01 45 f0             	add    %eax,-0x10(%ebp)
c010512a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010512d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105130:	01 d0                	add    %edx,%eax
c0105132:	c6 00 00             	movb   $0x0,(%eax)
c0105135:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105138:	83 c0 01             	add    $0x1,%eax
c010513b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010513e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0105142:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0105146:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010514a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010514d:	8b 00                	mov    (%eax),%eax
c010514f:	85 c0                	test   %eax,%eax
c0105151:	75 9c                	jne    c01050ef <execv+0x9c>
c0105153:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105156:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c010515b:	29 c2                	sub    %eax,%edx
c010515d:	89 d0                	mov    %edx,%eax
c010515f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105162:	83 ec 0c             	sub    $0xc,%esp
c0105165:	ff 75 08             	pushl  0x8(%ebp)
c0105168:	e8 11 0f 00 00       	call   c010607e <get_physical_address>
c010516d:	83 c4 10             	add    $0x10,%esp
c0105170:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105173:	83 ec 0c             	sub    $0xc,%esp
c0105176:	ff 75 dc             	pushl  -0x24(%ebp)
c0105179:	e8 00 0f 00 00       	call   c010607e <get_physical_address>
c010517e:	83 c4 10             	add    $0x10,%esp
c0105181:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105184:	83 ec 0c             	sub    $0xc,%esp
c0105187:	ff 75 d8             	pushl  -0x28(%ebp)
c010518a:	e8 ef 0e 00 00       	call   c010607e <get_physical_address>
c010518f:	83 c4 10             	add    $0x10,%esp
c0105192:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105195:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c010519c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010519f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01051a2:	83 ec 0c             	sub    $0xc,%esp
c01051a5:	ff 75 08             	pushl  0x8(%ebp)
c01051a8:	e8 7b 70 00 00       	call   c010c228 <Strlen>
c01051ad:	83 c4 10             	add    $0x10,%esp
c01051b0:	89 45 90             	mov    %eax,-0x70(%ebp)
c01051b3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01051b6:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01051bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01051bf:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01051c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01051c8:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01051ce:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01051d1:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01051d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01051da:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01051e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01051e3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01051e6:	29 c2                	sub    %eax,%edx
c01051e8:	89 d0                	mov    %edx,%eax
c01051ea:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01051f0:	83 ec 04             	sub    $0x4,%esp
c01051f3:	6a 01                	push   $0x1
c01051f5:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c01051fb:	50                   	push   %eax
c01051fc:	6a 03                	push   $0x3
c01051fe:	e8 22 44 00 00       	call   c0109625 <send_rec>
c0105203:	83 c4 10             	add    $0x10,%esp
c0105206:	83 ec 08             	sub    $0x8,%esp
c0105209:	68 00 04 00 00       	push   $0x400
c010520e:	ff 75 dc             	pushl  -0x24(%ebp)
c0105211:	e8 eb c4 ff ff       	call   c0101701 <sys_free>
c0105216:	83 c4 10             	add    $0x10,%esp
c0105219:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010521c:	83 f8 65             	cmp    $0x65,%eax
c010521f:	74 1c                	je     c010523d <execv+0x1ea>
c0105221:	68 95 00 00 00       	push   $0x95
c0105226:	68 63 b5 10 c0       	push   $0xc010b563
c010522b:	68 63 b5 10 c0       	push   $0xc010b563
c0105230:	68 6e b5 10 c0       	push   $0xc010b56e
c0105235:	e8 7b 37 00 00       	call   c01089b5 <assertion_failure>
c010523a:	83 c4 10             	add    $0x10,%esp
c010523d:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0105240:	c9                   	leave  
c0105241:	c3                   	ret    

c0105242 <execl>:
c0105242:	55                   	push   %ebp
c0105243:	89 e5                	mov    %esp,%ebp
c0105245:	83 ec 18             	sub    $0x18,%esp
c0105248:	8d 45 0c             	lea    0xc(%ebp),%eax
c010524b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010524e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105251:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105254:	83 ec 08             	sub    $0x8,%esp
c0105257:	ff 75 f0             	pushl  -0x10(%ebp)
c010525a:	ff 75 08             	pushl  0x8(%ebp)
c010525d:	e8 f1 fd ff ff       	call   c0105053 <execv>
c0105262:	83 c4 10             	add    $0x10,%esp
c0105265:	c9                   	leave  
c0105266:	c3                   	ret    

c0105267 <TaskMM>:
c0105267:	55                   	push   %ebp
c0105268:	89 e5                	mov    %esp,%ebp
c010526a:	83 ec 28             	sub    $0x28,%esp
c010526d:	83 ec 0c             	sub    $0xc,%esp
c0105270:	6a 7c                	push   $0x7c
c0105272:	e8 75 c4 ff ff       	call   c01016ec <sys_malloc>
c0105277:	83 c4 10             	add    $0x10,%esp
c010527a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010527d:	83 ec 0c             	sub    $0xc,%esp
c0105280:	6a 7c                	push   $0x7c
c0105282:	e8 65 c4 ff ff       	call   c01016ec <sys_malloc>
c0105287:	83 c4 10             	add    $0x10,%esp
c010528a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010528d:	83 ec 04             	sub    $0x4,%esp
c0105290:	6a 12                	push   $0x12
c0105292:	ff 75 f0             	pushl  -0x10(%ebp)
c0105295:	6a 02                	push   $0x2
c0105297:	e8 89 43 00 00       	call   c0109625 <send_rec>
c010529c:	83 c4 10             	add    $0x10,%esp
c010529f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01052a2:	8b 40 78             	mov    0x78(%eax),%eax
c01052a5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01052a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01052ab:	8b 00                	mov    (%eax),%eax
c01052ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01052b0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01052b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01052ba:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01052c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01052c4:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01052cb:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01052cf:	74 4e                	je     c010531f <TaskMM+0xb8>
c01052d1:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01052d5:	7f 08                	jg     c01052df <TaskMM+0x78>
c01052d7:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c01052db:	74 28                	je     c0105305 <TaskMM+0x9e>
c01052dd:	eb 71                	jmp    c0105350 <TaskMM+0xe9>
c01052df:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c01052e3:	74 08                	je     c01052ed <TaskMM+0x86>
c01052e5:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01052e9:	74 4e                	je     c0105339 <TaskMM+0xd2>
c01052eb:	eb 63                	jmp    c0105350 <TaskMM+0xe9>
c01052ed:	83 ec 0c             	sub    $0xc,%esp
c01052f0:	ff 75 f0             	pushl  -0x10(%ebp)
c01052f3:	e8 d0 04 00 00       	call   c01057c8 <do_fork>
c01052f8:	83 c4 10             	add    $0x10,%esp
c01052fb:	89 c2                	mov    %eax,%edx
c01052fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105300:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105303:	eb 5c                	jmp    c0105361 <TaskMM+0xfa>
c0105305:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010530c:	66 87 db             	xchg   %bx,%bx
c010530f:	83 ec 0c             	sub    $0xc,%esp
c0105312:	ff 75 f0             	pushl  -0x10(%ebp)
c0105315:	e8 95 00 00 00       	call   c01053af <do_exec>
c010531a:	83 c4 10             	add    $0x10,%esp
c010531d:	eb 42                	jmp    c0105361 <TaskMM+0xfa>
c010531f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105326:	83 ec 08             	sub    $0x8,%esp
c0105329:	ff 75 e0             	pushl  -0x20(%ebp)
c010532c:	ff 75 f0             	pushl  -0x10(%ebp)
c010532f:	e8 02 05 00 00       	call   c0105836 <do_exit>
c0105334:	83 c4 10             	add    $0x10,%esp
c0105337:	eb 28                	jmp    c0105361 <TaskMM+0xfa>
c0105339:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105340:	83 ec 0c             	sub    $0xc,%esp
c0105343:	ff 75 f0             	pushl  -0x10(%ebp)
c0105346:	e8 75 05 00 00       	call   c01058c0 <do_wait>
c010534b:	83 c4 10             	add    $0x10,%esp
c010534e:	eb 11                	jmp    c0105361 <TaskMM+0xfa>
c0105350:	83 ec 0c             	sub    $0xc,%esp
c0105353:	68 90 b5 10 c0       	push   $0xc010b590
c0105358:	e8 3a 36 00 00       	call   c0108997 <panic>
c010535d:	83 c4 10             	add    $0x10,%esp
c0105360:	90                   	nop
c0105361:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105365:	0f 84 22 ff ff ff    	je     c010528d <TaskMM+0x26>
c010536b:	83 ec 0c             	sub    $0xc,%esp
c010536e:	6a 03                	push   $0x3
c0105370:	e8 af 31 00 00       	call   c0108524 <delay>
c0105375:	83 c4 10             	add    $0x10,%esp
c0105378:	83 ec 04             	sub    $0x4,%esp
c010537b:	ff 75 e4             	pushl  -0x1c(%ebp)
c010537e:	ff 75 ec             	pushl  -0x14(%ebp)
c0105381:	6a 01                	push   $0x1
c0105383:	e8 9d 42 00 00       	call   c0109625 <send_rec>
c0105388:	83 c4 10             	add    $0x10,%esp
c010538b:	e9 fd fe ff ff       	jmp    c010528d <TaskMM+0x26>

c0105390 <alloc_mem>:
c0105390:	55                   	push   %ebp
c0105391:	89 e5                	mov    %esp,%ebp
c0105393:	83 ec 10             	sub    $0x10,%esp
c0105396:	8b 45 08             	mov    0x8(%ebp),%eax
c0105399:	83 e8 08             	sub    $0x8,%eax
c010539c:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c01053a2:	05 00 00 a0 00       	add    $0xa00000,%eax
c01053a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01053aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01053ad:	c9                   	leave  
c01053ae:	c3                   	ret    

c01053af <do_exec>:
c01053af:	55                   	push   %ebp
c01053b0:	89 e5                	mov    %esp,%ebp
c01053b2:	81 ec 38 01 00 00    	sub    $0x138,%esp
c01053b8:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c01053bf:	65 76 5f 
c01053c2:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c01053c9:	74 79 31 
c01053cc:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c01053d3:	00 00 
c01053d5:	83 ec 08             	sub    $0x8,%esp
c01053d8:	6a 00                	push   $0x0
c01053da:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c01053e0:	50                   	push   %eax
c01053e1:	e8 29 f8 ff ff       	call   c0104c0f <open>
c01053e6:	83 c4 10             	add    $0x10,%esp
c01053e9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01053ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01053ef:	8b 00                	mov    (%eax),%eax
c01053f1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01053f4:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c01053fb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01053fe:	83 ec 0c             	sub    $0xc,%esp
c0105401:	50                   	push   %eax
c0105402:	e8 e5 c2 ff ff       	call   c01016ec <sys_malloc>
c0105407:	83 c4 10             	add    $0x10,%esp
c010540a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010540d:	83 ec 04             	sub    $0x4,%esp
c0105410:	ff 75 d0             	pushl  -0x30(%ebp)
c0105413:	6a 00                	push   $0x0
c0105415:	ff 75 cc             	pushl  -0x34(%ebp)
c0105418:	e8 d2 6d 00 00       	call   c010c1ef <Memset>
c010541d:	83 c4 10             	add    $0x10,%esp
c0105420:	83 ec 04             	sub    $0x4,%esp
c0105423:	6a 0c                	push   $0xc
c0105425:	6a 00                	push   $0x0
c0105427:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010542d:	50                   	push   %eax
c010542e:	e8 bc 6d 00 00       	call   c010c1ef <Memset>
c0105433:	83 c4 10             	add    $0x10,%esp
c0105436:	8b 45 08             	mov    0x8(%ebp),%eax
c0105439:	8b 40 44             	mov    0x44(%eax),%eax
c010543c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010543f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105442:	8b 40 40             	mov    0x40(%eax),%eax
c0105445:	83 ec 08             	sub    $0x8,%esp
c0105448:	50                   	push   %eax
c0105449:	ff 75 c8             	pushl  -0x38(%ebp)
c010544c:	e8 de 0a 00 00       	call   c0105f2f <alloc_virtual_memory>
c0105451:	83 c4 10             	add    $0x10,%esp
c0105454:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105457:	8b 45 08             	mov    0x8(%ebp),%eax
c010545a:	8b 40 40             	mov    0x40(%eax),%eax
c010545d:	89 c2                	mov    %eax,%edx
c010545f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105462:	83 ec 04             	sub    $0x4,%esp
c0105465:	52                   	push   %edx
c0105466:	50                   	push   %eax
c0105467:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010546d:	50                   	push   %eax
c010546e:	e8 29 19 00 00       	call   c0106d9c <Memcpy>
c0105473:	83 c4 10             	add    $0x10,%esp
c0105476:	8b 45 08             	mov    0x8(%ebp),%eax
c0105479:	8b 40 40             	mov    0x40(%eax),%eax
c010547c:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105483:	00 
c0105484:	83 ec 08             	sub    $0x8,%esp
c0105487:	6a 00                	push   $0x0
c0105489:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010548f:	50                   	push   %eax
c0105490:	e8 7a f7 ff ff       	call   c0104c0f <open>
c0105495:	83 c4 10             	add    $0x10,%esp
c0105498:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010549b:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010549f:	75 15                	jne    c01054b6 <do_exec+0x107>
c01054a1:	83 ec 0c             	sub    $0xc,%esp
c01054a4:	68 a1 b5 10 c0       	push   $0xc010b5a1
c01054a9:	e8 aa 31 00 00       	call   c0108658 <Printf>
c01054ae:	83 c4 10             	add    $0x10,%esp
c01054b1:	e9 10 03 00 00       	jmp    c01057c6 <do_exec+0x417>
c01054b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01054bd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01054c0:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01054c3:	01 d0                	add    %edx,%eax
c01054c5:	83 ec 04             	sub    $0x4,%esp
c01054c8:	68 00 10 00 00       	push   $0x1000
c01054cd:	50                   	push   %eax
c01054ce:	ff 75 c0             	pushl  -0x40(%ebp)
c01054d1:	e8 ce f7 ff ff       	call   c0104ca4 <read>
c01054d6:	83 c4 10             	add    $0x10,%esp
c01054d9:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01054dc:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01054df:	01 45 f4             	add    %eax,-0xc(%ebp)
c01054e2:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01054e6:	74 0a                	je     c01054f2 <do_exec+0x143>
c01054e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01054eb:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c01054ee:	7d 05                	jge    c01054f5 <do_exec+0x146>
c01054f0:	eb cb                	jmp    c01054bd <do_exec+0x10e>
c01054f2:	90                   	nop
c01054f3:	eb 01                	jmp    c01054f6 <do_exec+0x147>
c01054f5:	90                   	nop
c01054f6:	83 ec 0c             	sub    $0xc,%esp
c01054f9:	ff 75 c0             	pushl  -0x40(%ebp)
c01054fc:	e8 a9 f9 ff ff       	call   c0104eaa <close>
c0105501:	83 c4 10             	add    $0x10,%esp
c0105504:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105507:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010550a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010550d:	8b 40 18             	mov    0x18(%eax),%eax
c0105510:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105513:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010551a:	e9 04 01 00 00       	jmp    c0105623 <do_exec+0x274>
c010551f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105522:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105526:	0f b7 d0             	movzwl %ax,%edx
c0105529:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010552c:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0105530:	0f b7 c0             	movzwl %ax,%eax
c0105533:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105537:	01 c2                	add    %eax,%edx
c0105539:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010553c:	01 d0                	add    %edx,%eax
c010553e:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0105541:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105544:	8b 40 10             	mov    0x10(%eax),%eax
c0105547:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010554a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010554d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105552:	c1 e8 0c             	shr    $0xc,%eax
c0105555:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105558:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010555b:	8b 40 08             	mov    0x8(%eax),%eax
c010555e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0105561:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105568:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010556b:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010556e:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0105571:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105574:	8b 50 04             	mov    0x4(%eax),%edx
c0105577:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010557a:	01 d0                	add    %edx,%eax
c010557c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010557f:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105583:	0f 84 95 00 00 00    	je     c010561e <do_exec+0x26f>
c0105589:	83 ec 04             	sub    $0x4,%esp
c010558c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010558f:	ff 75 a8             	pushl  -0x58(%ebp)
c0105592:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105595:	e8 a0 07 00 00       	call   c0105d3a <get_virtual_address_start_with_addr>
c010559a:	83 c4 10             	add    $0x10,%esp
c010559d:	89 45 98             	mov    %eax,-0x68(%ebp)
c01055a0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01055a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01055a6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01055ad:	eb 41                	jmp    c01055f0 <do_exec+0x241>
c01055af:	83 ec 08             	sub    $0x8,%esp
c01055b2:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055b5:	ff 75 e8             	pushl  -0x18(%ebp)
c01055b8:	e8 f3 0a 00 00       	call   c01060b0 <alloc_physical_memory_of_proc>
c01055bd:	83 c4 10             	add    $0x10,%esp
c01055c0:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01055c3:	83 ec 08             	sub    $0x8,%esp
c01055c6:	68 00 10 00 00       	push   $0x1000
c01055cb:	ff 75 94             	pushl  -0x6c(%ebp)
c01055ce:	e8 5c 09 00 00       	call   c0105f2f <alloc_virtual_memory>
c01055d3:	83 c4 10             	add    $0x10,%esp
c01055d6:	89 45 90             	mov    %eax,-0x70(%ebp)
c01055d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01055dd:	75 06                	jne    c01055e5 <do_exec+0x236>
c01055df:	8b 45 90             	mov    -0x70(%ebp),%eax
c01055e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01055e5:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c01055ec:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01055f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01055f3:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c01055f6:	77 b7                	ja     c01055af <do_exec+0x200>
c01055f8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01055fb:	8b 40 10             	mov    0x10(%eax),%eax
c01055fe:	89 c1                	mov    %eax,%ecx
c0105600:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105603:	8b 50 04             	mov    0x4(%eax),%edx
c0105606:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105609:	01 c2                	add    %eax,%edx
c010560b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010560e:	83 ec 04             	sub    $0x4,%esp
c0105611:	51                   	push   %ecx
c0105612:	52                   	push   %edx
c0105613:	50                   	push   %eax
c0105614:	e8 83 17 00 00       	call   c0106d9c <Memcpy>
c0105619:	83 c4 10             	add    $0x10,%esp
c010561c:	eb 01                	jmp    c010561f <do_exec+0x270>
c010561e:	90                   	nop
c010561f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105623:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105626:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c010562a:	0f b7 c0             	movzwl %ax,%eax
c010562d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0105630:	0f 8c e9 fe ff ff    	jl     c010551f <do_exec+0x170>
c0105636:	8b 45 08             	mov    0x8(%ebp),%eax
c0105639:	8b 40 10             	mov    0x10(%eax),%eax
c010563c:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010563f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105642:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105645:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105648:	8b 45 08             	mov    0x8(%ebp),%eax
c010564b:	8b 40 24             	mov    0x24(%eax),%eax
c010564e:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0105651:	83 ec 0c             	sub    $0xc,%esp
c0105654:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105657:	e8 8a e2 ff ff       	call   c01038e6 <pid2proc>
c010565c:	83 c4 10             	add    $0x10,%esp
c010565f:	89 45 80             	mov    %eax,-0x80(%ebp)
c0105662:	8b 45 08             	mov    0x8(%ebp),%eax
c0105665:	8b 40 10             	mov    0x10(%eax),%eax
c0105668:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010566e:	83 ec 08             	sub    $0x8,%esp
c0105671:	ff 75 88             	pushl  -0x78(%ebp)
c0105674:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c010567a:	e8 b0 08 00 00       	call   c0105f2f <alloc_virtual_memory>
c010567f:	83 c4 10             	add    $0x10,%esp
c0105682:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105688:	8b 45 08             	mov    0x8(%ebp),%eax
c010568b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010568e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105694:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010569b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01056a1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01056a4:	eb 1a                	jmp    c01056c0 <do_exec+0x311>
c01056a6:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01056aa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01056ad:	8b 10                	mov    (%eax),%edx
c01056af:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01056b5:	01 c2                	add    %eax,%edx
c01056b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01056ba:	89 10                	mov    %edx,(%eax)
c01056bc:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c01056c0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01056c3:	8b 00                	mov    (%eax),%eax
c01056c5:	85 c0                	test   %eax,%eax
c01056c7:	75 dd                	jne    c01056a6 <do_exec+0x2f7>
c01056c9:	83 ec 0c             	sub    $0xc,%esp
c01056cc:	ff 75 84             	pushl  -0x7c(%ebp)
c01056cf:	e8 5b 08 00 00       	call   c0105f2f <alloc_virtual_memory>
c01056d4:	83 c4 10             	add    $0x10,%esp
c01056d7:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01056dd:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01056e3:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01056e9:	83 ec 04             	sub    $0x4,%esp
c01056ec:	ff 75 88             	pushl  -0x78(%ebp)
c01056ef:	52                   	push   %edx
c01056f0:	50                   	push   %eax
c01056f1:	e8 a6 16 00 00       	call   c0106d9c <Memcpy>
c01056f6:	83 c4 10             	add    $0x10,%esp
c01056f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01056fc:	8b 40 28             	mov    0x28(%eax),%eax
c01056ff:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105705:	83 ec 08             	sub    $0x8,%esp
c0105708:	ff 75 d4             	pushl  -0x2c(%ebp)
c010570b:	ff 75 80             	pushl  -0x80(%ebp)
c010570e:	e8 ef 08 00 00       	call   c0106002 <get_physical_address_proc>
c0105713:	83 c4 10             	add    $0x10,%esp
c0105716:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c010571c:	83 ec 08             	sub    $0x8,%esp
c010571f:	68 00 10 00 00       	push   $0x1000
c0105724:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c010572a:	e8 00 08 00 00       	call   c0105f2f <alloc_virtual_memory>
c010572f:	83 c4 10             	add    $0x10,%esp
c0105732:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105738:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010573e:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105743:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105749:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010574f:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105755:	89 50 20             	mov    %edx,0x20(%eax)
c0105758:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010575b:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105761:	89 50 28             	mov    %edx,0x28(%eax)
c0105764:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105767:	8b 40 18             	mov    0x18(%eax),%eax
c010576a:	89 c2                	mov    %eax,%edx
c010576c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105772:	89 50 30             	mov    %edx,0x30(%eax)
c0105775:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010577b:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105781:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105784:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105787:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010578e:	00 00 00 
c0105791:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105798:	00 00 00 
c010579b:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c01057a2:	00 00 00 
c01057a5:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c01057ac:	00 00 00 
c01057af:	83 ec 04             	sub    $0x4,%esp
c01057b2:	ff 75 d4             	pushl  -0x2c(%ebp)
c01057b5:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c01057bb:	50                   	push   %eax
c01057bc:	6a 01                	push   $0x1
c01057be:	e8 62 3e 00 00       	call   c0109625 <send_rec>
c01057c3:	83 c4 10             	add    $0x10,%esp
c01057c6:	c9                   	leave  
c01057c7:	c3                   	ret    

c01057c8 <do_fork>:
c01057c8:	55                   	push   %ebp
c01057c9:	89 e5                	mov    %esp,%ebp
c01057cb:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01057d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01057d4:	8b 00                	mov    (%eax),%eax
c01057d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01057d9:	83 ec 0c             	sub    $0xc,%esp
c01057dc:	ff 75 f4             	pushl  -0xc(%ebp)
c01057df:	e8 3c 47 00 00       	call   c0109f20 <fork_process>
c01057e4:	83 c4 10             	add    $0x10,%esp
c01057e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057ed:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01057f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01057f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057f9:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01057ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0105802:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105805:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c010580c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105813:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010581a:	83 ec 04             	sub    $0x4,%esp
c010581d:	ff 75 ec             	pushl  -0x14(%ebp)
c0105820:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105826:	50                   	push   %eax
c0105827:	6a 01                	push   $0x1
c0105829:	e8 f7 3d 00 00       	call   c0109625 <send_rec>
c010582e:	83 c4 10             	add    $0x10,%esp
c0105831:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105834:	c9                   	leave  
c0105835:	c3                   	ret    

c0105836 <do_exit>:
c0105836:	55                   	push   %ebp
c0105837:	89 e5                	mov    %esp,%ebp
c0105839:	83 ec 18             	sub    $0x18,%esp
c010583c:	8b 45 08             	mov    0x8(%ebp),%eax
c010583f:	8b 00                	mov    (%eax),%eax
c0105841:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105844:	83 ec 0c             	sub    $0xc,%esp
c0105847:	ff 75 f4             	pushl  -0xc(%ebp)
c010584a:	e8 97 e0 ff ff       	call   c01038e6 <pid2proc>
c010584f:	83 c4 10             	add    $0x10,%esp
c0105852:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105855:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105858:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010585e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105861:	83 ec 0c             	sub    $0xc,%esp
c0105864:	ff 75 ec             	pushl  -0x14(%ebp)
c0105867:	e8 7a e0 ff ff       	call   c01038e6 <pid2proc>
c010586c:	83 c4 10             	add    $0x10,%esp
c010586f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105872:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105876:	74 45                	je     c01058bd <do_exit+0x87>
c0105878:	8b 45 08             	mov    0x8(%ebp),%eax
c010587b:	8b 40 54             	mov    0x54(%eax),%eax
c010587e:	89 c2                	mov    %eax,%edx
c0105880:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105883:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105889:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010588c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105893:	3c 04                	cmp    $0x4,%al
c0105895:	75 1a                	jne    c01058b1 <do_exit+0x7b>
c0105897:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010589a:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01058a1:	83 ec 0c             	sub    $0xc,%esp
c01058a4:	ff 75 f0             	pushl  -0x10(%ebp)
c01058a7:	e8 33 01 00 00       	call   c01059df <cleanup>
c01058ac:	83 c4 10             	add    $0x10,%esp
c01058af:	eb 0d                	jmp    c01058be <do_exit+0x88>
c01058b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058b4:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01058bb:	eb 01                	jmp    c01058be <do_exit+0x88>
c01058bd:	90                   	nop
c01058be:	c9                   	leave  
c01058bf:	c3                   	ret    

c01058c0 <do_wait>:
c01058c0:	55                   	push   %ebp
c01058c1:	89 e5                	mov    %esp,%ebp
c01058c3:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c01058c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01058cc:	8b 00                	mov    (%eax),%eax
c01058ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01058d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01058d8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01058df:	83 ec 0c             	sub    $0xc,%esp
c01058e2:	ff 75 ec             	pushl  -0x14(%ebp)
c01058e5:	e8 fc df ff ff       	call   c01038e6 <pid2proc>
c01058ea:	83 c4 10             	add    $0x10,%esp
c01058ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01058f0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01058f4:	75 19                	jne    c010590f <do_wait+0x4f>
c01058f6:	6a 58                	push   $0x58
c01058f8:	68 b1 b5 10 c0       	push   $0xc010b5b1
c01058fd:	68 b1 b5 10 c0       	push   $0xc010b5b1
c0105902:	68 bf b5 10 c0       	push   $0xc010b5bf
c0105907:	e8 a9 30 00 00       	call   c01089b5 <assertion_failure>
c010590c:	83 c4 10             	add    $0x10,%esp
c010590f:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105914:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c010591a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010591d:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105920:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105925:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c010592b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010592e:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105931:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105936:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105939:	eb 5b                	jmp    c0105996 <do_wait+0xd6>
c010593b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010593e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105943:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105946:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105949:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010594f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0105952:	74 0b                	je     c010595f <do_wait+0x9f>
c0105954:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105957:	8b 40 04             	mov    0x4(%eax),%eax
c010595a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010595d:	eb 37                	jmp    c0105996 <do_wait+0xd6>
c010595f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105963:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105966:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c010596d:	3c 03                	cmp    $0x3,%al
c010596f:	74 0b                	je     c010597c <do_wait+0xbc>
c0105971:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105974:	8b 40 04             	mov    0x4(%eax),%eax
c0105977:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010597a:	eb 1a                	jmp    c0105996 <do_wait+0xd6>
c010597c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010597f:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105986:	83 ec 0c             	sub    $0xc,%esp
c0105989:	ff 75 e8             	pushl  -0x18(%ebp)
c010598c:	e8 4e 00 00 00       	call   c01059df <cleanup>
c0105991:	83 c4 10             	add    $0x10,%esp
c0105994:	eb 47                	jmp    c01059dd <do_wait+0x11d>
c0105996:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c010599d:	75 9c                	jne    c010593b <do_wait+0x7b>
c010599f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01059a3:	74 0c                	je     c01059b1 <do_wait+0xf1>
c01059a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01059a8:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c01059af:	eb 2c                	jmp    c01059dd <do_wait+0x11d>
c01059b1:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c01059b8:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01059bf:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01059c6:	83 ec 04             	sub    $0x4,%esp
c01059c9:	ff 75 ec             	pushl  -0x14(%ebp)
c01059cc:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c01059d2:	50                   	push   %eax
c01059d3:	6a 01                	push   $0x1
c01059d5:	e8 4b 3c 00 00       	call   c0109625 <send_rec>
c01059da:	83 c4 10             	add    $0x10,%esp
c01059dd:	c9                   	leave  
c01059de:	c3                   	ret    

c01059df <cleanup>:
c01059df:	55                   	push   %ebp
c01059e0:	89 e5                	mov    %esp,%ebp
c01059e2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01059e8:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c01059ef:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c01059f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01059f9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01059ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105a02:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a05:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0105a0b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105a0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a11:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105a17:	83 ec 04             	sub    $0x4,%esp
c0105a1a:	50                   	push   %eax
c0105a1b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105a21:	50                   	push   %eax
c0105a22:	6a 01                	push   $0x1
c0105a24:	e8 fc 3b 00 00       	call   c0109625 <send_rec>
c0105a29:	83 c4 10             	add    $0x10,%esp
c0105a2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a2f:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105a36:	90                   	nop
c0105a37:	c9                   	leave  
c0105a38:	c3                   	ret    

c0105a39 <init_bitmap>:
c0105a39:	55                   	push   %ebp
c0105a3a:	89 e5                	mov    %esp,%ebp
c0105a3c:	83 ec 08             	sub    $0x8,%esp
c0105a3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a42:	8b 50 04             	mov    0x4(%eax),%edx
c0105a45:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a48:	8b 00                	mov    (%eax),%eax
c0105a4a:	83 ec 04             	sub    $0x4,%esp
c0105a4d:	52                   	push   %edx
c0105a4e:	6a 00                	push   $0x0
c0105a50:	50                   	push   %eax
c0105a51:	e8 99 67 00 00       	call   c010c1ef <Memset>
c0105a56:	83 c4 10             	add    $0x10,%esp
c0105a59:	90                   	nop
c0105a5a:	c9                   	leave  
c0105a5b:	c3                   	ret    

c0105a5c <test_bit_val>:
c0105a5c:	55                   	push   %ebp
c0105a5d:	89 e5                	mov    %esp,%ebp
c0105a5f:	53                   	push   %ebx
c0105a60:	83 ec 10             	sub    $0x10,%esp
c0105a63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a66:	8d 50 07             	lea    0x7(%eax),%edx
c0105a69:	85 c0                	test   %eax,%eax
c0105a6b:	0f 48 c2             	cmovs  %edx,%eax
c0105a6e:	c1 f8 03             	sar    $0x3,%eax
c0105a71:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a74:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a77:	99                   	cltd   
c0105a78:	c1 ea 1d             	shr    $0x1d,%edx
c0105a7b:	01 d0                	add    %edx,%eax
c0105a7d:	83 e0 07             	and    $0x7,%eax
c0105a80:	29 d0                	sub    %edx,%eax
c0105a82:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a85:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a88:	8b 10                	mov    (%eax),%edx
c0105a8a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a8d:	01 d0                	add    %edx,%eax
c0105a8f:	0f b6 00             	movzbl (%eax),%eax
c0105a92:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105a95:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105a99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a9c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105aa1:	89 c1                	mov    %eax,%ecx
c0105aa3:	d3 e3                	shl    %cl,%ebx
c0105aa5:	89 d8                	mov    %ebx,%eax
c0105aa7:	21 c2                	and    %eax,%edx
c0105aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105aac:	89 c1                	mov    %eax,%ecx
c0105aae:	d3 fa                	sar    %cl,%edx
c0105ab0:	89 d0                	mov    %edx,%eax
c0105ab2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ab5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105ab9:	0f 9f c0             	setg   %al
c0105abc:	0f b6 c0             	movzbl %al,%eax
c0105abf:	83 c4 10             	add    $0x10,%esp
c0105ac2:	5b                   	pop    %ebx
c0105ac3:	5d                   	pop    %ebp
c0105ac4:	c3                   	ret    

c0105ac5 <set_bit_val>:
c0105ac5:	55                   	push   %ebp
c0105ac6:	89 e5                	mov    %esp,%ebp
c0105ac8:	83 ec 10             	sub    $0x10,%esp
c0105acb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ace:	8d 50 07             	lea    0x7(%eax),%edx
c0105ad1:	85 c0                	test   %eax,%eax
c0105ad3:	0f 48 c2             	cmovs  %edx,%eax
c0105ad6:	c1 f8 03             	sar    $0x3,%eax
c0105ad9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105adc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105adf:	99                   	cltd   
c0105ae0:	c1 ea 1d             	shr    $0x1d,%edx
c0105ae3:	01 d0                	add    %edx,%eax
c0105ae5:	83 e0 07             	and    $0x7,%eax
c0105ae8:	29 d0                	sub    %edx,%eax
c0105aea:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105aed:	8b 45 08             	mov    0x8(%ebp),%eax
c0105af0:	8b 10                	mov    (%eax),%edx
c0105af2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105af5:	01 d0                	add    %edx,%eax
c0105af7:	0f b6 00             	movzbl (%eax),%eax
c0105afa:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105afd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105b01:	7e 13                	jle    c0105b16 <set_bit_val+0x51>
c0105b03:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b06:	ba 01 00 00 00       	mov    $0x1,%edx
c0105b0b:	89 c1                	mov    %eax,%ecx
c0105b0d:	d3 e2                	shl    %cl,%edx
c0105b0f:	89 d0                	mov    %edx,%eax
c0105b11:	08 45 ff             	or     %al,-0x1(%ebp)
c0105b14:	eb 13                	jmp    c0105b29 <set_bit_val+0x64>
c0105b16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b19:	ba 01 00 00 00       	mov    $0x1,%edx
c0105b1e:	89 c1                	mov    %eax,%ecx
c0105b20:	d3 e2                	shl    %cl,%edx
c0105b22:	89 d0                	mov    %edx,%eax
c0105b24:	f7 d0                	not    %eax
c0105b26:	20 45 ff             	and    %al,-0x1(%ebp)
c0105b29:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b2c:	8b 10                	mov    (%eax),%edx
c0105b2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105b31:	01 c2                	add    %eax,%edx
c0105b33:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105b37:	88 02                	mov    %al,(%edx)
c0105b39:	b8 01 00 00 00       	mov    $0x1,%eax
c0105b3e:	c9                   	leave  
c0105b3f:	c3                   	ret    

c0105b40 <set_bits>:
c0105b40:	55                   	push   %ebp
c0105b41:	89 e5                	mov    %esp,%ebp
c0105b43:	83 ec 10             	sub    $0x10,%esp
c0105b46:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105b4d:	eb 1c                	jmp    c0105b6b <set_bits+0x2b>
c0105b4f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b52:	8d 50 01             	lea    0x1(%eax),%edx
c0105b55:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105b58:	ff 75 10             	pushl  0x10(%ebp)
c0105b5b:	50                   	push   %eax
c0105b5c:	ff 75 08             	pushl  0x8(%ebp)
c0105b5f:	e8 61 ff ff ff       	call   c0105ac5 <set_bit_val>
c0105b64:	83 c4 0c             	add    $0xc,%esp
c0105b67:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105b6b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b6e:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105b71:	7c dc                	jl     c0105b4f <set_bits+0xf>
c0105b73:	b8 01 00 00 00       	mov    $0x1,%eax
c0105b78:	c9                   	leave  
c0105b79:	c3                   	ret    

c0105b7a <get_first_free_bit>:
c0105b7a:	55                   	push   %ebp
c0105b7b:	89 e5                	mov    %esp,%ebp
c0105b7d:	83 ec 10             	sub    $0x10,%esp
c0105b80:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b83:	8b 40 04             	mov    0x4(%eax),%eax
c0105b86:	c1 e0 03             	shl    $0x3,%eax
c0105b89:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b8c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b8f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105b92:	eb 1b                	jmp    c0105baf <get_first_free_bit+0x35>
c0105b94:	ff 75 fc             	pushl  -0x4(%ebp)
c0105b97:	ff 75 08             	pushl  0x8(%ebp)
c0105b9a:	e8 bd fe ff ff       	call   c0105a5c <test_bit_val>
c0105b9f:	83 c4 08             	add    $0x8,%esp
c0105ba2:	85 c0                	test   %eax,%eax
c0105ba4:	75 05                	jne    c0105bab <get_first_free_bit+0x31>
c0105ba6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105ba9:	eb 11                	jmp    c0105bbc <get_first_free_bit+0x42>
c0105bab:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105baf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105bb2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105bb5:	7c dd                	jl     c0105b94 <get_first_free_bit+0x1a>
c0105bb7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105bbc:	c9                   	leave  
c0105bbd:	c3                   	ret    

c0105bbe <get_bits>:
c0105bbe:	55                   	push   %ebp
c0105bbf:	89 e5                	mov    %esp,%ebp
c0105bc1:	83 ec 20             	sub    $0x20,%esp
c0105bc4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105bcb:	ff 75 f0             	pushl  -0x10(%ebp)
c0105bce:	ff 75 08             	pushl  0x8(%ebp)
c0105bd1:	e8 a4 ff ff ff       	call   c0105b7a <get_first_free_bit>
c0105bd6:	83 c4 08             	add    $0x8,%esp
c0105bd9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105bdc:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bdf:	8b 40 04             	mov    0x4(%eax),%eax
c0105be2:	c1 e0 03             	shl    $0x3,%eax
c0105be5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105be8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105beb:	83 e8 01             	sub    $0x1,%eax
c0105bee:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105bf1:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105bf5:	75 08                	jne    c0105bff <get_bits+0x41>
c0105bf7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105bfa:	e9 85 00 00 00       	jmp    c0105c84 <get_bits+0xc6>
c0105bff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c02:	83 c0 01             	add    $0x1,%eax
c0105c05:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c08:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c0e:	eb 58                	jmp    c0105c68 <get_bits+0xaa>
c0105c10:	ff 75 f8             	pushl  -0x8(%ebp)
c0105c13:	ff 75 08             	pushl  0x8(%ebp)
c0105c16:	e8 41 fe ff ff       	call   c0105a5c <test_bit_val>
c0105c1b:	83 c4 08             	add    $0x8,%esp
c0105c1e:	85 c0                	test   %eax,%eax
c0105c20:	75 0a                	jne    c0105c2c <get_bits+0x6e>
c0105c22:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105c26:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105c2a:	eb 2b                	jmp    c0105c57 <get_bits+0x99>
c0105c2c:	6a 00                	push   $0x0
c0105c2e:	ff 75 08             	pushl  0x8(%ebp)
c0105c31:	e8 44 ff ff ff       	call   c0105b7a <get_first_free_bit>
c0105c36:	83 c4 08             	add    $0x8,%esp
c0105c39:	83 c0 01             	add    $0x1,%eax
c0105c3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c42:	83 c0 01             	add    $0x1,%eax
c0105c45:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c48:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c4e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c51:	83 e8 01             	sub    $0x1,%eax
c0105c54:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105c57:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c5a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105c5d:	7c 09                	jl     c0105c68 <get_bits+0xaa>
c0105c5f:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105c66:	eb 0d                	jmp    c0105c75 <get_bits+0xb7>
c0105c68:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105c6b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105c6e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105c71:	85 c0                	test   %eax,%eax
c0105c73:	7f 9b                	jg     c0105c10 <get_bits+0x52>
c0105c75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c78:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105c7b:	83 c0 01             	add    $0x1,%eax
c0105c7e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c81:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c84:	c9                   	leave  
c0105c85:	c3                   	ret    

c0105c86 <get_a_page>:
c0105c86:	55                   	push   %ebp
c0105c87:	89 e5                	mov    %esp,%ebp
c0105c89:	83 ec 28             	sub    $0x28,%esp
c0105c8c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105c90:	75 22                	jne    c0105cb4 <get_a_page+0x2e>
c0105c92:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105c97:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c9a:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105c9f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ca2:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105ca7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105caa:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105caf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105cb2:	eb 20                	jmp    c0105cd4 <get_a_page+0x4e>
c0105cb4:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105cb9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105cbc:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105cc1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105cc4:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105cc9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ccc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105cd1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105cd4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105cd7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105cda:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105cdd:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105ce0:	6a 01                	push   $0x1
c0105ce2:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105ce5:	50                   	push   %eax
c0105ce6:	e8 d3 fe ff ff       	call   c0105bbe <get_bits>
c0105ceb:	83 c4 08             	add    $0x8,%esp
c0105cee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cf1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105cf5:	75 1c                	jne    c0105d13 <get_a_page+0x8d>
c0105cf7:	68 84 00 00 00       	push   $0x84
c0105cfc:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0105d01:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0105d06:	68 dc b5 10 c0       	push   $0xc010b5dc
c0105d0b:	e8 a5 2c 00 00       	call   c01089b5 <assertion_failure>
c0105d10:	83 c4 10             	add    $0x10,%esp
c0105d13:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d16:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105d19:	c1 e2 0c             	shl    $0xc,%edx
c0105d1c:	01 d0                	add    %edx,%eax
c0105d1e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d21:	83 ec 04             	sub    $0x4,%esp
c0105d24:	6a 01                	push   $0x1
c0105d26:	ff 75 f4             	pushl  -0xc(%ebp)
c0105d29:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105d2c:	50                   	push   %eax
c0105d2d:	e8 93 fd ff ff       	call   c0105ac5 <set_bit_val>
c0105d32:	83 c4 10             	add    $0x10,%esp
c0105d35:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d38:	c9                   	leave  
c0105d39:	c3                   	ret    

c0105d3a <get_virtual_address_start_with_addr>:
c0105d3a:	55                   	push   %ebp
c0105d3b:	89 e5                	mov    %esp,%ebp
c0105d3d:	83 ec 38             	sub    $0x38,%esp
c0105d40:	e8 a4 a6 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0105d45:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d48:	83 ec 0c             	sub    $0xc,%esp
c0105d4b:	ff 75 10             	pushl  0x10(%ebp)
c0105d4e:	e8 93 db ff ff       	call   c01038e6 <pid2proc>
c0105d53:	83 c4 10             	add    $0x10,%esp
c0105d56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d5c:	8b 40 0c             	mov    0xc(%eax),%eax
c0105d5f:	83 ec 04             	sub    $0x4,%esp
c0105d62:	6a 0c                	push   $0xc
c0105d64:	50                   	push   %eax
c0105d65:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105d68:	50                   	push   %eax
c0105d69:	e8 2e 10 00 00       	call   c0106d9c <Memcpy>
c0105d6e:	83 c4 10             	add    $0x10,%esp
c0105d71:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105d74:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105d77:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105d7a:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105d7d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105d80:	8b 55 08             	mov    0x8(%ebp),%edx
c0105d83:	29 c2                	sub    %eax,%edx
c0105d85:	89 d0                	mov    %edx,%eax
c0105d87:	c1 e8 0c             	shr    $0xc,%eax
c0105d8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d8d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105d91:	79 1c                	jns    c0105daf <get_virtual_address_start_with_addr+0x75>
c0105d93:	68 97 00 00 00       	push   $0x97
c0105d98:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0105d9d:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0105da2:	68 e8 b5 10 c0       	push   $0xc010b5e8
c0105da7:	e8 09 2c 00 00       	call   c01089b5 <assertion_failure>
c0105dac:	83 c4 10             	add    $0x10,%esp
c0105daf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105db2:	50                   	push   %eax
c0105db3:	6a 01                	push   $0x1
c0105db5:	ff 75 ec             	pushl  -0x14(%ebp)
c0105db8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105dbb:	50                   	push   %eax
c0105dbc:	e8 7f fd ff ff       	call   c0105b40 <set_bits>
c0105dc1:	83 c4 10             	add    $0x10,%esp
c0105dc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dc7:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105dcc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105dcf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105dd2:	c9                   	leave  
c0105dd3:	c3                   	ret    

c0105dd4 <get_virtual_address>:
c0105dd4:	55                   	push   %ebp
c0105dd5:	89 e5                	mov    %esp,%ebp
c0105dd7:	83 ec 28             	sub    $0x28,%esp
c0105dda:	e8 0a a6 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0105ddf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105de2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105de6:	75 1a                	jne    c0105e02 <get_virtual_address+0x2e>
c0105de8:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105ded:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105df0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105df5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105df8:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105dfd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e00:	eb 18                	jmp    c0105e1a <get_virtual_address+0x46>
c0105e02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e05:	8b 40 0c             	mov    0xc(%eax),%eax
c0105e08:	83 ec 04             	sub    $0x4,%esp
c0105e0b:	6a 0c                	push   $0xc
c0105e0d:	50                   	push   %eax
c0105e0e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105e11:	50                   	push   %eax
c0105e12:	e8 85 0f 00 00       	call   c0106d9c <Memcpy>
c0105e17:	83 c4 10             	add    $0x10,%esp
c0105e1a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105e1d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e20:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105e23:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105e26:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e29:	83 ec 08             	sub    $0x8,%esp
c0105e2c:	50                   	push   %eax
c0105e2d:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105e30:	50                   	push   %eax
c0105e31:	e8 88 fd ff ff       	call   c0105bbe <get_bits>
c0105e36:	83 c4 10             	add    $0x10,%esp
c0105e39:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105e3f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105e42:	c1 e2 0c             	shl    $0xc,%edx
c0105e45:	01 d0                	add    %edx,%eax
c0105e47:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e4d:	50                   	push   %eax
c0105e4e:	6a 01                	push   $0x1
c0105e50:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e53:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105e56:	50                   	push   %eax
c0105e57:	e8 e4 fc ff ff       	call   c0105b40 <set_bits>
c0105e5c:	83 c4 10             	add    $0x10,%esp
c0105e5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e62:	c9                   	leave  
c0105e63:	c3                   	ret    

c0105e64 <ptr_pde>:
c0105e64:	55                   	push   %ebp
c0105e65:	89 e5                	mov    %esp,%ebp
c0105e67:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e6a:	c1 e8 16             	shr    $0x16,%eax
c0105e6d:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105e72:	c1 e0 02             	shl    $0x2,%eax
c0105e75:	5d                   	pop    %ebp
c0105e76:	c3                   	ret    

c0105e77 <ptr_pte>:
c0105e77:	55                   	push   %ebp
c0105e78:	89 e5                	mov    %esp,%ebp
c0105e7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e7d:	c1 e8 0a             	shr    $0xa,%eax
c0105e80:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105e85:	89 c2                	mov    %eax,%edx
c0105e87:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e8a:	c1 e8 0c             	shr    $0xc,%eax
c0105e8d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105e92:	c1 e0 02             	shl    $0x2,%eax
c0105e95:	01 d0                	add    %edx,%eax
c0105e97:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105e9c:	5d                   	pop    %ebp
c0105e9d:	c3                   	ret    

c0105e9e <add_map_entry>:
c0105e9e:	55                   	push   %ebp
c0105e9f:	89 e5                	mov    %esp,%ebp
c0105ea1:	83 ec 18             	sub    $0x18,%esp
c0105ea4:	ff 75 08             	pushl  0x8(%ebp)
c0105ea7:	e8 b8 ff ff ff       	call   c0105e64 <ptr_pde>
c0105eac:	83 c4 04             	add    $0x4,%esp
c0105eaf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105eb2:	ff 75 08             	pushl  0x8(%ebp)
c0105eb5:	e8 bd ff ff ff       	call   c0105e77 <ptr_pte>
c0105eba:	83 c4 04             	add    $0x4,%esp
c0105ebd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105ec3:	8b 00                	mov    (%eax),%eax
c0105ec5:	83 e0 01             	and    $0x1,%eax
c0105ec8:	85 c0                	test   %eax,%eax
c0105eca:	74 1b                	je     c0105ee7 <add_map_entry+0x49>
c0105ecc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ecf:	8b 00                	mov    (%eax),%eax
c0105ed1:	83 e0 01             	and    $0x1,%eax
c0105ed4:	85 c0                	test   %eax,%eax
c0105ed6:	75 54                	jne    c0105f2c <add_map_entry+0x8e>
c0105ed8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105edb:	83 c8 07             	or     $0x7,%eax
c0105ede:	89 c2                	mov    %eax,%edx
c0105ee0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ee3:	89 10                	mov    %edx,(%eax)
c0105ee5:	eb 45                	jmp    c0105f2c <add_map_entry+0x8e>
c0105ee7:	83 ec 0c             	sub    $0xc,%esp
c0105eea:	6a 00                	push   $0x0
c0105eec:	e8 95 fd ff ff       	call   c0105c86 <get_a_page>
c0105ef1:	83 c4 10             	add    $0x10,%esp
c0105ef4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ef7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105efa:	83 c8 07             	or     $0x7,%eax
c0105efd:	89 c2                	mov    %eax,%edx
c0105eff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105f02:	89 10                	mov    %edx,(%eax)
c0105f04:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f07:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f0c:	83 ec 04             	sub    $0x4,%esp
c0105f0f:	68 00 10 00 00       	push   $0x1000
c0105f14:	6a 00                	push   $0x0
c0105f16:	50                   	push   %eax
c0105f17:	e8 d3 62 00 00       	call   c010c1ef <Memset>
c0105f1c:	83 c4 10             	add    $0x10,%esp
c0105f1f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f22:	83 c8 07             	or     $0x7,%eax
c0105f25:	89 c2                	mov    %eax,%edx
c0105f27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f2a:	89 10                	mov    %edx,(%eax)
c0105f2c:	90                   	nop
c0105f2d:	c9                   	leave  
c0105f2e:	c3                   	ret    

c0105f2f <alloc_virtual_memory>:
c0105f2f:	55                   	push   %ebp
c0105f30:	89 e5                	mov    %esp,%ebp
c0105f32:	83 ec 28             	sub    $0x28,%esp
c0105f35:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f38:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f40:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f43:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105f46:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f49:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f4c:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105f4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f52:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105f57:	c1 e8 0c             	shr    $0xc,%eax
c0105f5a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f5d:	e8 87 a4 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0105f62:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105f65:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f68:	8b 50 08             	mov    0x8(%eax),%edx
c0105f6b:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105f70:	39 c2                	cmp    %eax,%edx
c0105f72:	75 09                	jne    c0105f7d <alloc_virtual_memory+0x4e>
c0105f74:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105f7b:	eb 07                	jmp    c0105f84 <alloc_virtual_memory+0x55>
c0105f7d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105f84:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105f8b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105f92:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105f99:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105fa0:	eb 47                	jmp    c0105fe9 <alloc_virtual_memory+0xba>
c0105fa2:	83 ec 08             	sub    $0x8,%esp
c0105fa5:	ff 75 f0             	pushl  -0x10(%ebp)
c0105fa8:	6a 01                	push   $0x1
c0105faa:	e8 25 fe ff ff       	call   c0105dd4 <get_virtual_address>
c0105faf:	83 c4 10             	add    $0x10,%esp
c0105fb2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105fb5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105fb9:	74 13                	je     c0105fce <alloc_virtual_memory+0x9f>
c0105fbb:	83 ec 0c             	sub    $0xc,%esp
c0105fbe:	ff 75 f0             	pushl  -0x10(%ebp)
c0105fc1:	e8 c0 fc ff ff       	call   c0105c86 <get_a_page>
c0105fc6:	83 c4 10             	add    $0x10,%esp
c0105fc9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fcc:	eb 06                	jmp    c0105fd4 <alloc_virtual_memory+0xa5>
c0105fce:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105fd1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fd4:	83 ec 08             	sub    $0x8,%esp
c0105fd7:	ff 75 f4             	pushl  -0xc(%ebp)
c0105fda:	ff 75 d8             	pushl  -0x28(%ebp)
c0105fdd:	e8 bc fe ff ff       	call   c0105e9e <add_map_entry>
c0105fe2:	83 c4 10             	add    $0x10,%esp
c0105fe5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105fe9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105fec:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105fef:	72 b1                	jb     c0105fa2 <alloc_virtual_memory+0x73>
c0105ff1:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ff4:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105ff9:	89 c2                	mov    %eax,%edx
c0105ffb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ffe:	01 d0                	add    %edx,%eax
c0106000:	c9                   	leave  
c0106001:	c3                   	ret    

c0106002 <get_physical_address_proc>:
c0106002:	55                   	push   %ebp
c0106003:	89 e5                	mov    %esp,%ebp
c0106005:	83 ec 18             	sub    $0x18,%esp
c0106008:	e8 00 a3 ff ff       	call   c010030d <disable_int>
c010600d:	e8 d7 a3 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0106012:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106015:	83 ec 0c             	sub    $0xc,%esp
c0106018:	ff 75 0c             	pushl  0xc(%ebp)
c010601b:	e8 c6 d8 ff ff       	call   c01038e6 <pid2proc>
c0106020:	83 c4 10             	add    $0x10,%esp
c0106023:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106026:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106029:	8b 40 08             	mov    0x8(%eax),%eax
c010602c:	83 ec 0c             	sub    $0xc,%esp
c010602f:	50                   	push   %eax
c0106030:	e8 98 a3 ff ff       	call   c01003cd <update_cr3>
c0106035:	83 c4 10             	add    $0x10,%esp
c0106038:	83 ec 0c             	sub    $0xc,%esp
c010603b:	ff 75 08             	pushl  0x8(%ebp)
c010603e:	e8 34 fe ff ff       	call   c0105e77 <ptr_pte>
c0106043:	83 c4 10             	add    $0x10,%esp
c0106046:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106049:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010604c:	8b 00                	mov    (%eax),%eax
c010604e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106053:	89 c2                	mov    %eax,%edx
c0106055:	8b 45 08             	mov    0x8(%ebp),%eax
c0106058:	25 ff 0f 00 00       	and    $0xfff,%eax
c010605d:	09 d0                	or     %edx,%eax
c010605f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106062:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106065:	8b 40 08             	mov    0x8(%eax),%eax
c0106068:	83 ec 0c             	sub    $0xc,%esp
c010606b:	50                   	push   %eax
c010606c:	e8 5c a3 ff ff       	call   c01003cd <update_cr3>
c0106071:	83 c4 10             	add    $0x10,%esp
c0106074:	e8 96 a2 ff ff       	call   c010030f <enable_int>
c0106079:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010607c:	c9                   	leave  
c010607d:	c3                   	ret    

c010607e <get_physical_address>:
c010607e:	55                   	push   %ebp
c010607f:	89 e5                	mov    %esp,%ebp
c0106081:	83 ec 10             	sub    $0x10,%esp
c0106084:	ff 75 08             	pushl  0x8(%ebp)
c0106087:	e8 eb fd ff ff       	call   c0105e77 <ptr_pte>
c010608c:	83 c4 04             	add    $0x4,%esp
c010608f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106092:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106095:	8b 00                	mov    (%eax),%eax
c0106097:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010609c:	89 c2                	mov    %eax,%edx
c010609e:	8b 45 08             	mov    0x8(%ebp),%eax
c01060a1:	25 ff 0f 00 00       	and    $0xfff,%eax
c01060a6:	09 d0                	or     %edx,%eax
c01060a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01060ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01060ae:	c9                   	leave  
c01060af:	c3                   	ret    

c01060b0 <alloc_physical_memory_of_proc>:
c01060b0:	55                   	push   %ebp
c01060b1:	89 e5                	mov    %esp,%ebp
c01060b3:	83 ec 48             	sub    $0x48,%esp
c01060b6:	e8 52 a2 ff ff       	call   c010030d <disable_int>
c01060bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01060be:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060c6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01060cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01060d0:	83 ec 0c             	sub    $0xc,%esp
c01060d3:	50                   	push   %eax
c01060d4:	e8 0d d8 ff ff       	call   c01038e6 <pid2proc>
c01060d9:	83 c4 10             	add    $0x10,%esp
c01060dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01060df:	e8 05 a3 ff ff       	call   c01003e9 <get_running_thread_pcb>
c01060e4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01060e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060ea:	8b 40 0c             	mov    0xc(%eax),%eax
c01060ed:	83 ec 04             	sub    $0x4,%esp
c01060f0:	6a 0c                	push   $0xc
c01060f2:	50                   	push   %eax
c01060f3:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01060f6:	50                   	push   %eax
c01060f7:	e8 a0 0c 00 00       	call   c0106d9c <Memcpy>
c01060fc:	83 c4 10             	add    $0x10,%esp
c01060ff:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106102:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0106105:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106108:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010610b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010610e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106111:	29 c2                	sub    %eax,%edx
c0106113:	89 d0                	mov    %edx,%eax
c0106115:	c1 e8 0c             	shr    $0xc,%eax
c0106118:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010611b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010611e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106121:	c1 e2 0c             	shl    $0xc,%edx
c0106124:	01 d0                	add    %edx,%eax
c0106126:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106129:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010612c:	6a 01                	push   $0x1
c010612e:	6a 01                	push   $0x1
c0106130:	50                   	push   %eax
c0106131:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0106134:	50                   	push   %eax
c0106135:	e8 06 fa ff ff       	call   c0105b40 <set_bits>
c010613a:	83 c4 10             	add    $0x10,%esp
c010613d:	83 ec 0c             	sub    $0xc,%esp
c0106140:	ff 75 f0             	pushl  -0x10(%ebp)
c0106143:	e8 3e fb ff ff       	call   c0105c86 <get_a_page>
c0106148:	83 c4 10             	add    $0x10,%esp
c010614b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010614e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106151:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106156:	89 c2                	mov    %eax,%edx
c0106158:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010615b:	01 d0                	add    %edx,%eax
c010615d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106160:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106163:	8b 40 08             	mov    0x8(%eax),%eax
c0106166:	83 ec 0c             	sub    $0xc,%esp
c0106169:	50                   	push   %eax
c010616a:	e8 5e a2 ff ff       	call   c01003cd <update_cr3>
c010616f:	83 c4 10             	add    $0x10,%esp
c0106172:	83 ec 08             	sub    $0x8,%esp
c0106175:	ff 75 dc             	pushl  -0x24(%ebp)
c0106178:	ff 75 f4             	pushl  -0xc(%ebp)
c010617b:	e8 1e fd ff ff       	call   c0105e9e <add_map_entry>
c0106180:	83 c4 10             	add    $0x10,%esp
c0106183:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106186:	8b 40 08             	mov    0x8(%eax),%eax
c0106189:	83 ec 0c             	sub    $0xc,%esp
c010618c:	50                   	push   %eax
c010618d:	e8 3b a2 ff ff       	call   c01003cd <update_cr3>
c0106192:	83 c4 10             	add    $0x10,%esp
c0106195:	e8 75 a1 ff ff       	call   c010030f <enable_int>
c010619a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010619d:	c9                   	leave  
c010619e:	c3                   	ret    

c010619f <alloc_physical_memory>:
c010619f:	55                   	push   %ebp
c01061a0:	89 e5                	mov    %esp,%ebp
c01061a2:	83 ec 38             	sub    $0x38,%esp
c01061a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01061a8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01061ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061b0:	e8 34 a2 ff ff       	call   c01003e9 <get_running_thread_pcb>
c01061b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01061b8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01061bc:	75 1a                	jne    c01061d8 <alloc_physical_memory+0x39>
c01061be:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01061c3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01061c6:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01061cb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01061ce:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01061d3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01061d6:	eb 18                	jmp    c01061f0 <alloc_physical_memory+0x51>
c01061d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01061db:	8b 40 0c             	mov    0xc(%eax),%eax
c01061de:	83 ec 04             	sub    $0x4,%esp
c01061e1:	6a 0c                	push   $0xc
c01061e3:	50                   	push   %eax
c01061e4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c01061e7:	50                   	push   %eax
c01061e8:	e8 af 0b 00 00       	call   c0106d9c <Memcpy>
c01061ed:	83 c4 10             	add    $0x10,%esp
c01061f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01061f3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01061f6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01061f9:	89 55 d0             	mov    %edx,-0x30(%ebp)
c01061fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01061ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106202:	29 c2                	sub    %eax,%edx
c0106204:	89 d0                	mov    %edx,%eax
c0106206:	c1 e8 0c             	shr    $0xc,%eax
c0106209:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010620c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010620f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106212:	c1 e2 0c             	shl    $0xc,%edx
c0106215:	01 d0                	add    %edx,%eax
c0106217:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010621a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010621d:	6a 01                	push   $0x1
c010621f:	6a 01                	push   $0x1
c0106221:	50                   	push   %eax
c0106222:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106225:	50                   	push   %eax
c0106226:	e8 15 f9 ff ff       	call   c0105b40 <set_bits>
c010622b:	83 c4 10             	add    $0x10,%esp
c010622e:	83 ec 0c             	sub    $0xc,%esp
c0106231:	ff 75 0c             	pushl  0xc(%ebp)
c0106234:	e8 4d fa ff ff       	call   c0105c86 <get_a_page>
c0106239:	83 c4 10             	add    $0x10,%esp
c010623c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010623f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106242:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106247:	89 c2                	mov    %eax,%edx
c0106249:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010624c:	01 d0                	add    %edx,%eax
c010624e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106251:	83 ec 08             	sub    $0x8,%esp
c0106254:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106257:	ff 75 f4             	pushl  -0xc(%ebp)
c010625a:	e8 3f fc ff ff       	call   c0105e9e <add_map_entry>
c010625f:	83 c4 10             	add    $0x10,%esp
c0106262:	8b 45 08             	mov    0x8(%ebp),%eax
c0106265:	c9                   	leave  
c0106266:	c3                   	ret    

c0106267 <alloc_memory>:
c0106267:	55                   	push   %ebp
c0106268:	89 e5                	mov    %esp,%ebp
c010626a:	83 ec 18             	sub    $0x18,%esp
c010626d:	83 ec 08             	sub    $0x8,%esp
c0106270:	ff 75 0c             	pushl  0xc(%ebp)
c0106273:	ff 75 08             	pushl  0x8(%ebp)
c0106276:	e8 59 fb ff ff       	call   c0105dd4 <get_virtual_address>
c010627b:	83 c4 10             	add    $0x10,%esp
c010627e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106281:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106284:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106289:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010628c:	eb 29                	jmp    c01062b7 <alloc_memory+0x50>
c010628e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106295:	83 ec 0c             	sub    $0xc,%esp
c0106298:	ff 75 0c             	pushl  0xc(%ebp)
c010629b:	e8 e6 f9 ff ff       	call   c0105c86 <get_a_page>
c01062a0:	83 c4 10             	add    $0x10,%esp
c01062a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01062a6:	83 ec 08             	sub    $0x8,%esp
c01062a9:	ff 75 ec             	pushl  -0x14(%ebp)
c01062ac:	ff 75 f4             	pushl  -0xc(%ebp)
c01062af:	e8 ea fb ff ff       	call   c0105e9e <add_map_entry>
c01062b4:	83 c4 10             	add    $0x10,%esp
c01062b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01062ba:	8d 50 ff             	lea    -0x1(%eax),%edx
c01062bd:	89 55 08             	mov    %edx,0x8(%ebp)
c01062c0:	85 c0                	test   %eax,%eax
c01062c2:	75 ca                	jne    c010628e <alloc_memory+0x27>
c01062c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01062c7:	c9                   	leave  
c01062c8:	c3                   	ret    

c01062c9 <get_a_virtual_page>:
c01062c9:	55                   	push   %ebp
c01062ca:	89 e5                	mov    %esp,%ebp
c01062cc:	83 ec 18             	sub    $0x18,%esp
c01062cf:	83 ec 0c             	sub    $0xc,%esp
c01062d2:	ff 75 08             	pushl  0x8(%ebp)
c01062d5:	e8 ac f9 ff ff       	call   c0105c86 <get_a_page>
c01062da:	83 c4 10             	add    $0x10,%esp
c01062dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01062e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01062e3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01062e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01062eb:	83 ec 08             	sub    $0x8,%esp
c01062ee:	ff 75 f4             	pushl  -0xc(%ebp)
c01062f1:	ff 75 f0             	pushl  -0x10(%ebp)
c01062f4:	e8 a5 fb ff ff       	call   c0105e9e <add_map_entry>
c01062f9:	83 c4 10             	add    $0x10,%esp
c01062fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01062ff:	c9                   	leave  
c0106300:	c3                   	ret    

c0106301 <block2arena>:
c0106301:	55                   	push   %ebp
c0106302:	89 e5                	mov    %esp,%ebp
c0106304:	83 ec 10             	sub    $0x10,%esp
c0106307:	8b 45 08             	mov    0x8(%ebp),%eax
c010630a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010630f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106312:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106315:	c9                   	leave  
c0106316:	c3                   	ret    

c0106317 <sys_malloc2>:
c0106317:	55                   	push   %ebp
c0106318:	89 e5                	mov    %esp,%ebp
c010631a:	83 ec 68             	sub    $0x68,%esp
c010631d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106324:	e8 c0 a0 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0106329:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010632c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010632f:	8b 50 08             	mov    0x8(%eax),%edx
c0106332:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106337:	39 c2                	cmp    %eax,%edx
c0106339:	75 10                	jne    c010634b <sys_malloc2+0x34>
c010633b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106342:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106349:	eb 10                	jmp    c010635b <sys_malloc2+0x44>
c010634b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106352:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106355:	83 c0 10             	add    $0x10,%eax
c0106358:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010635b:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0106362:	76 52                	jbe    c01063b6 <sys_malloc2+0x9f>
c0106364:	8b 45 08             	mov    0x8(%ebp),%eax
c0106367:	05 0b 10 00 00       	add    $0x100b,%eax
c010636c:	c1 e8 0c             	shr    $0xc,%eax
c010636f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106372:	83 ec 08             	sub    $0x8,%esp
c0106375:	ff 75 f0             	pushl  -0x10(%ebp)
c0106378:	ff 75 d8             	pushl  -0x28(%ebp)
c010637b:	e8 e7 fe ff ff       	call   c0106267 <alloc_memory>
c0106380:	83 c4 10             	add    $0x10,%esp
c0106383:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106386:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106389:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010638c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010638f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106395:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106398:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010639f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01063a2:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c01063a6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01063a9:	05 90 00 00 00       	add    $0x90,%eax
c01063ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01063b1:	e9 f0 01 00 00       	jmp    c01065a6 <sys_malloc2+0x28f>
c01063b6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01063bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01063c4:	eb 26                	jmp    c01063ec <sys_malloc2+0xd5>
c01063c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01063c9:	89 d0                	mov    %edx,%eax
c01063cb:	01 c0                	add    %eax,%eax
c01063cd:	01 d0                	add    %edx,%eax
c01063cf:	c1 e0 03             	shl    $0x3,%eax
c01063d2:	89 c2                	mov    %eax,%edx
c01063d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063d7:	01 d0                	add    %edx,%eax
c01063d9:	8b 00                	mov    (%eax),%eax
c01063db:	39 45 08             	cmp    %eax,0x8(%ebp)
c01063de:	77 08                	ja     c01063e8 <sys_malloc2+0xd1>
c01063e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01063e3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01063e6:	eb 0a                	jmp    c01063f2 <sys_malloc2+0xdb>
c01063e8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01063ec:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c01063f0:	7e d4                	jle    c01063c6 <sys_malloc2+0xaf>
c01063f2:	83 ec 08             	sub    $0x8,%esp
c01063f5:	ff 75 f0             	pushl  -0x10(%ebp)
c01063f8:	6a 01                	push   $0x1
c01063fa:	e8 68 fe ff ff       	call   c0106267 <alloc_memory>
c01063ff:	83 c4 10             	add    $0x10,%esp
c0106402:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106405:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106408:	89 d0                	mov    %edx,%eax
c010640a:	01 c0                	add    %eax,%eax
c010640c:	01 d0                	add    %edx,%eax
c010640e:	c1 e0 03             	shl    $0x3,%eax
c0106411:	89 c2                	mov    %eax,%edx
c0106413:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106416:	01 d0                	add    %edx,%eax
c0106418:	83 ec 04             	sub    $0x4,%esp
c010641b:	6a 18                	push   $0x18
c010641d:	50                   	push   %eax
c010641e:	ff 75 cc             	pushl  -0x34(%ebp)
c0106421:	e8 76 09 00 00       	call   c0106d9c <Memcpy>
c0106426:	83 c4 10             	add    $0x10,%esp
c0106429:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0106430:	e8 03 09 00 00       	call   c0106d38 <intr_disable>
c0106435:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106438:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010643b:	89 d0                	mov    %edx,%eax
c010643d:	01 c0                	add    %eax,%eax
c010643f:	01 d0                	add    %edx,%eax
c0106441:	c1 e0 03             	shl    $0x3,%eax
c0106444:	89 c2                	mov    %eax,%edx
c0106446:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106449:	01 d0                	add    %edx,%eax
c010644b:	83 c0 08             	add    $0x8,%eax
c010644e:	83 ec 0c             	sub    $0xc,%esp
c0106451:	50                   	push   %eax
c0106452:	e8 1c 3d 00 00       	call   c010a173 <isListEmpty>
c0106457:	83 c4 10             	add    $0x10,%esp
c010645a:	3c 01                	cmp    $0x1,%al
c010645c:	0f 85 c1 00 00 00    	jne    c0106523 <sys_malloc2+0x20c>
c0106462:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106469:	83 ec 08             	sub    $0x8,%esp
c010646c:	ff 75 f0             	pushl  -0x10(%ebp)
c010646f:	6a 01                	push   $0x1
c0106471:	e8 f1 fd ff ff       	call   c0106267 <alloc_memory>
c0106476:	83 c4 10             	add    $0x10,%esp
c0106479:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010647c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010647f:	83 ec 0c             	sub    $0xc,%esp
c0106482:	50                   	push   %eax
c0106483:	e8 79 fe ff ff       	call   c0106301 <block2arena>
c0106488:	83 c4 10             	add    $0x10,%esp
c010648b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010648e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106491:	89 d0                	mov    %edx,%eax
c0106493:	01 c0                	add    %eax,%eax
c0106495:	01 d0                	add    %edx,%eax
c0106497:	c1 e0 03             	shl    $0x3,%eax
c010649a:	89 c2                	mov    %eax,%edx
c010649c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010649f:	01 d0                	add    %edx,%eax
c01064a1:	8b 50 04             	mov    0x4(%eax),%edx
c01064a4:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01064a7:	89 50 04             	mov    %edx,0x4(%eax)
c01064aa:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01064ad:	8b 00                	mov    (%eax),%eax
c01064af:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01064b2:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c01064b9:	b8 00 10 00 00       	mov    $0x1000,%eax
c01064be:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c01064c1:	ba 00 00 00 00       	mov    $0x0,%edx
c01064c6:	f7 75 b8             	divl   -0x48(%ebp)
c01064c9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01064cc:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01064cf:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01064d2:	01 d0                	add    %edx,%eax
c01064d4:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01064d7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01064de:	eb 3b                	jmp    c010651b <sys_malloc2+0x204>
c01064e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01064e3:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c01064e7:	89 c2                	mov    %eax,%edx
c01064e9:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01064ec:	01 d0                	add    %edx,%eax
c01064ee:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01064f1:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01064f4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01064f7:	89 d0                	mov    %edx,%eax
c01064f9:	01 c0                	add    %eax,%eax
c01064fb:	01 d0                	add    %edx,%eax
c01064fd:	c1 e0 03             	shl    $0x3,%eax
c0106500:	89 c2                	mov    %eax,%edx
c0106502:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106505:	01 d0                	add    %edx,%eax
c0106507:	83 c0 08             	add    $0x8,%eax
c010650a:	83 ec 08             	sub    $0x8,%esp
c010650d:	51                   	push   %ecx
c010650e:	50                   	push   %eax
c010650f:	e8 5c 3d 00 00       	call   c010a270 <appendToDoubleLinkList>
c0106514:	83 c4 10             	add    $0x10,%esp
c0106517:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010651b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010651e:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0106521:	77 bd                	ja     c01064e0 <sys_malloc2+0x1c9>
c0106523:	83 ec 0c             	sub    $0xc,%esp
c0106526:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106529:	e8 33 08 00 00       	call   c0106d61 <intr_set_status>
c010652e:	83 c4 10             	add    $0x10,%esp
c0106531:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106534:	89 d0                	mov    %edx,%eax
c0106536:	01 c0                	add    %eax,%eax
c0106538:	01 d0                	add    %edx,%eax
c010653a:	c1 e0 03             	shl    $0x3,%eax
c010653d:	89 c2                	mov    %eax,%edx
c010653f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106542:	01 d0                	add    %edx,%eax
c0106544:	83 c0 08             	add    $0x8,%eax
c0106547:	83 ec 0c             	sub    $0xc,%esp
c010654a:	50                   	push   %eax
c010654b:	e8 8a 3e 00 00       	call   c010a3da <popFromDoubleLinkList>
c0106550:	83 c4 10             	add    $0x10,%esp
c0106553:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106556:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106559:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010655c:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0106560:	75 1c                	jne    c010657e <sys_malloc2+0x267>
c0106562:	68 ef 01 00 00       	push   $0x1ef
c0106567:	68 d2 b5 10 c0       	push   $0xc010b5d2
c010656c:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0106571:	68 f3 b5 10 c0       	push   $0xc010b5f3
c0106576:	e8 3a 24 00 00       	call   c01089b5 <assertion_failure>
c010657b:	83 c4 10             	add    $0x10,%esp
c010657e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106581:	83 ec 0c             	sub    $0xc,%esp
c0106584:	50                   	push   %eax
c0106585:	e8 77 fd ff ff       	call   c0106301 <block2arena>
c010658a:	83 c4 10             	add    $0x10,%esp
c010658d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106590:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106593:	8b 40 04             	mov    0x4(%eax),%eax
c0106596:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106599:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010659c:	89 50 04             	mov    %edx,0x4(%eax)
c010659f:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c01065a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01065aa:	75 1c                	jne    c01065c8 <sys_malloc2+0x2b1>
c01065ac:	68 f6 01 00 00       	push   $0x1f6
c01065b1:	68 d2 b5 10 c0       	push   $0xc010b5d2
c01065b6:	68 d2 b5 10 c0       	push   $0xc010b5d2
c01065bb:	68 05 b6 10 c0       	push   $0xc010b605
c01065c0:	e8 f0 23 00 00       	call   c01089b5 <assertion_failure>
c01065c5:	83 c4 10             	add    $0x10,%esp
c01065c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01065cb:	c9                   	leave  
c01065cc:	c3                   	ret    

c01065cd <remove_map_entry>:
c01065cd:	55                   	push   %ebp
c01065ce:	89 e5                	mov    %esp,%ebp
c01065d0:	83 ec 10             	sub    $0x10,%esp
c01065d3:	ff 75 08             	pushl  0x8(%ebp)
c01065d6:	e8 9c f8 ff ff       	call   c0105e77 <ptr_pte>
c01065db:	83 c4 04             	add    $0x4,%esp
c01065de:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01065e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01065e4:	8b 10                	mov    (%eax),%edx
c01065e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01065e9:	89 10                	mov    %edx,(%eax)
c01065eb:	90                   	nop
c01065ec:	c9                   	leave  
c01065ed:	c3                   	ret    

c01065ee <free_a_page>:
c01065ee:	55                   	push   %ebp
c01065ef:	89 e5                	mov    %esp,%ebp
c01065f1:	83 ec 20             	sub    $0x20,%esp
c01065f4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01065f8:	75 21                	jne    c010661b <free_a_page+0x2d>
c01065fa:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01065ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106602:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106607:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010660a:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010660f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106612:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106619:	eb 1f                	jmp    c010663a <free_a_page+0x4c>
c010661b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106620:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106623:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106628:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010662b:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106630:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106633:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c010663a:	8b 45 08             	mov    0x8(%ebp),%eax
c010663d:	c1 e8 0c             	shr    $0xc,%eax
c0106640:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106643:	6a 00                	push   $0x0
c0106645:	ff 75 f8             	pushl  -0x8(%ebp)
c0106648:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c010664b:	50                   	push   %eax
c010664c:	e8 74 f4 ff ff       	call   c0105ac5 <set_bit_val>
c0106651:	83 c4 0c             	add    $0xc,%esp
c0106654:	ff 75 08             	pushl  0x8(%ebp)
c0106657:	e8 22 fa ff ff       	call   c010607e <get_physical_address>
c010665c:	83 c4 04             	add    $0x4,%esp
c010665f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106662:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106665:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010666b:	85 c0                	test   %eax,%eax
c010666d:	0f 48 c2             	cmovs  %edx,%eax
c0106670:	c1 f8 0c             	sar    $0xc,%eax
c0106673:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106676:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106679:	6a 00                	push   $0x0
c010667b:	ff 75 f0             	pushl  -0x10(%ebp)
c010667e:	50                   	push   %eax
c010667f:	e8 41 f4 ff ff       	call   c0105ac5 <set_bit_val>
c0106684:	83 c4 0c             	add    $0xc,%esp
c0106687:	ff 75 08             	pushl  0x8(%ebp)
c010668a:	e8 3e ff ff ff       	call   c01065cd <remove_map_entry>
c010668f:	83 c4 04             	add    $0x4,%esp
c0106692:	90                   	nop
c0106693:	c9                   	leave  
c0106694:	c3                   	ret    

c0106695 <sys_free2>:
c0106695:	55                   	push   %ebp
c0106696:	89 e5                	mov    %esp,%ebp
c0106698:	83 ec 58             	sub    $0x58,%esp
c010669b:	e8 49 9d ff ff       	call   c01003e9 <get_running_thread_pcb>
c01066a0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01066a3:	e8 90 06 00 00       	call   c0106d38 <intr_disable>
c01066a8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01066ab:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01066ae:	8b 50 08             	mov    0x8(%eax),%edx
c01066b1:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01066b6:	39 c2                	cmp    %eax,%edx
c01066b8:	75 10                	jne    c01066ca <sys_free2+0x35>
c01066ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01066c1:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c01066c8:	eb 10                	jmp    c01066da <sys_free2+0x45>
c01066ca:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01066d1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01066d4:	83 c0 10             	add    $0x10,%eax
c01066d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01066da:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c01066e1:	76 4d                	jbe    c0106730 <sys_free2+0x9b>
c01066e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01066e6:	83 e8 0c             	sub    $0xc,%eax
c01066e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01066ec:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c01066f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01066f3:	05 ff 0f 00 00       	add    $0xfff,%eax
c01066f8:	c1 e8 0c             	shr    $0xc,%eax
c01066fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01066fe:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106705:	eb 1c                	jmp    c0106723 <sys_free2+0x8e>
c0106707:	83 ec 08             	sub    $0x8,%esp
c010670a:	ff 75 f4             	pushl  -0xc(%ebp)
c010670d:	ff 75 ec             	pushl  -0x14(%ebp)
c0106710:	e8 d9 fe ff ff       	call   c01065ee <free_a_page>
c0106715:	83 c4 10             	add    $0x10,%esp
c0106718:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010671f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106723:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106726:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106729:	77 dc                	ja     c0106707 <sys_free2+0x72>
c010672b:	e9 dc 00 00 00       	jmp    c010680c <sys_free2+0x177>
c0106730:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106737:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010673e:	eb 26                	jmp    c0106766 <sys_free2+0xd1>
c0106740:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106743:	89 d0                	mov    %edx,%eax
c0106745:	01 c0                	add    %eax,%eax
c0106747:	01 d0                	add    %edx,%eax
c0106749:	c1 e0 03             	shl    $0x3,%eax
c010674c:	89 c2                	mov    %eax,%edx
c010674e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106751:	01 d0                	add    %edx,%eax
c0106753:	8b 00                	mov    (%eax),%eax
c0106755:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106758:	77 08                	ja     c0106762 <sys_free2+0xcd>
c010675a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010675d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106760:	eb 0a                	jmp    c010676c <sys_free2+0xd7>
c0106762:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106766:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c010676a:	7e d4                	jle    c0106740 <sys_free2+0xab>
c010676c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010676f:	89 d0                	mov    %edx,%eax
c0106771:	01 c0                	add    %eax,%eax
c0106773:	01 d0                	add    %edx,%eax
c0106775:	c1 e0 03             	shl    $0x3,%eax
c0106778:	89 c2                	mov    %eax,%edx
c010677a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010677d:	01 d0                	add    %edx,%eax
c010677f:	8b 10                	mov    (%eax),%edx
c0106781:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106784:	8b 50 04             	mov    0x4(%eax),%edx
c0106787:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010678a:	8b 50 08             	mov    0x8(%eax),%edx
c010678d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106790:	8b 50 0c             	mov    0xc(%eax),%edx
c0106793:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106796:	8b 50 10             	mov    0x10(%eax),%edx
c0106799:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010679c:	8b 40 14             	mov    0x14(%eax),%eax
c010679f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01067a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01067a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01067a8:	83 ec 0c             	sub    $0xc,%esp
c01067ab:	ff 75 d0             	pushl  -0x30(%ebp)
c01067ae:	e8 4e fb ff ff       	call   c0106301 <block2arena>
c01067b3:	83 c4 10             	add    $0x10,%esp
c01067b6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01067b9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01067bc:	89 d0                	mov    %edx,%eax
c01067be:	01 c0                	add    %eax,%eax
c01067c0:	01 d0                	add    %edx,%eax
c01067c2:	c1 e0 03             	shl    $0x3,%eax
c01067c5:	89 c2                	mov    %eax,%edx
c01067c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01067ca:	01 d0                	add    %edx,%eax
c01067cc:	83 c0 08             	add    $0x8,%eax
c01067cf:	83 ec 08             	sub    $0x8,%esp
c01067d2:	ff 75 d0             	pushl  -0x30(%ebp)
c01067d5:	50                   	push   %eax
c01067d6:	e8 95 3a 00 00       	call   c010a270 <appendToDoubleLinkList>
c01067db:	83 c4 10             	add    $0x10,%esp
c01067de:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01067e1:	8b 40 04             	mov    0x4(%eax),%eax
c01067e4:	8d 50 01             	lea    0x1(%eax),%edx
c01067e7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01067ea:	89 50 04             	mov    %edx,0x4(%eax)
c01067ed:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01067f0:	8b 50 04             	mov    0x4(%eax),%edx
c01067f3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01067f6:	39 c2                	cmp    %eax,%edx
c01067f8:	75 12                	jne    c010680c <sys_free2+0x177>
c01067fa:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01067fd:	83 ec 08             	sub    $0x8,%esp
c0106800:	ff 75 f4             	pushl  -0xc(%ebp)
c0106803:	50                   	push   %eax
c0106804:	e8 e5 fd ff ff       	call   c01065ee <free_a_page>
c0106809:	83 c4 10             	add    $0x10,%esp
c010680c:	83 ec 0c             	sub    $0xc,%esp
c010680f:	ff 75 d8             	pushl  -0x28(%ebp)
c0106812:	e8 4a 05 00 00       	call   c0106d61 <intr_set_status>
c0106817:	83 c4 10             	add    $0x10,%esp
c010681a:	90                   	nop
c010681b:	c9                   	leave  
c010681c:	c3                   	ret    

c010681d <init_memory_block_desc>:
c010681d:	55                   	push   %ebp
c010681e:	89 e5                	mov    %esp,%ebp
c0106820:	83 ec 18             	sub    $0x18,%esp
c0106823:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010682a:	e9 b2 00 00 00       	jmp    c01068e1 <init_memory_block_desc+0xc4>
c010682f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106833:	75 1b                	jne    c0106850 <init_memory_block_desc+0x33>
c0106835:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106838:	89 d0                	mov    %edx,%eax
c010683a:	01 c0                	add    %eax,%eax
c010683c:	01 d0                	add    %edx,%eax
c010683e:	c1 e0 03             	shl    $0x3,%eax
c0106841:	89 c2                	mov    %eax,%edx
c0106843:	8b 45 08             	mov    0x8(%ebp),%eax
c0106846:	01 d0                	add    %edx,%eax
c0106848:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010684e:	eb 2e                	jmp    c010687e <init_memory_block_desc+0x61>
c0106850:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106853:	89 d0                	mov    %edx,%eax
c0106855:	01 c0                	add    %eax,%eax
c0106857:	01 d0                	add    %edx,%eax
c0106859:	c1 e0 03             	shl    $0x3,%eax
c010685c:	8d 50 e8             	lea    -0x18(%eax),%edx
c010685f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106862:	01 d0                	add    %edx,%eax
c0106864:	8b 08                	mov    (%eax),%ecx
c0106866:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106869:	89 d0                	mov    %edx,%eax
c010686b:	01 c0                	add    %eax,%eax
c010686d:	01 d0                	add    %edx,%eax
c010686f:	c1 e0 03             	shl    $0x3,%eax
c0106872:	89 c2                	mov    %eax,%edx
c0106874:	8b 45 08             	mov    0x8(%ebp),%eax
c0106877:	01 d0                	add    %edx,%eax
c0106879:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c010687c:	89 10                	mov    %edx,(%eax)
c010687e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106881:	89 d0                	mov    %edx,%eax
c0106883:	01 c0                	add    %eax,%eax
c0106885:	01 d0                	add    %edx,%eax
c0106887:	c1 e0 03             	shl    $0x3,%eax
c010688a:	89 c2                	mov    %eax,%edx
c010688c:	8b 45 08             	mov    0x8(%ebp),%eax
c010688f:	01 d0                	add    %edx,%eax
c0106891:	8b 00                	mov    (%eax),%eax
c0106893:	89 c1                	mov    %eax,%ecx
c0106895:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c010689a:	ba 00 00 00 00       	mov    $0x0,%edx
c010689f:	f7 f1                	div    %ecx
c01068a1:	89 c1                	mov    %eax,%ecx
c01068a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01068a6:	89 d0                	mov    %edx,%eax
c01068a8:	01 c0                	add    %eax,%eax
c01068aa:	01 d0                	add    %edx,%eax
c01068ac:	c1 e0 03             	shl    $0x3,%eax
c01068af:	89 c2                	mov    %eax,%edx
c01068b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01068b4:	01 d0                	add    %edx,%eax
c01068b6:	89 ca                	mov    %ecx,%edx
c01068b8:	89 50 04             	mov    %edx,0x4(%eax)
c01068bb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01068be:	89 d0                	mov    %edx,%eax
c01068c0:	01 c0                	add    %eax,%eax
c01068c2:	01 d0                	add    %edx,%eax
c01068c4:	c1 e0 03             	shl    $0x3,%eax
c01068c7:	89 c2                	mov    %eax,%edx
c01068c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01068cc:	01 d0                	add    %edx,%eax
c01068ce:	83 c0 08             	add    $0x8,%eax
c01068d1:	83 ec 0c             	sub    $0xc,%esp
c01068d4:	50                   	push   %eax
c01068d5:	e8 6b 38 00 00       	call   c010a145 <initDoubleLinkList>
c01068da:	83 c4 10             	add    $0x10,%esp
c01068dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01068e1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01068e5:	0f 8e 44 ff ff ff    	jle    c010682f <init_memory_block_desc+0x12>
c01068eb:	90                   	nop
c01068ec:	c9                   	leave  
c01068ed:	c3                   	ret    

c01068ee <init_memory2>:
c01068ee:	55                   	push   %ebp
c01068ef:	89 e5                	mov    %esp,%ebp
c01068f1:	83 ec 38             	sub    $0x38,%esp
c01068f4:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c01068fb:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106902:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106905:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c010690a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010690d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106912:	29 c2                	sub    %eax,%edx
c0106914:	89 d0                	mov    %edx,%eax
c0106916:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106919:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010691c:	89 c2                	mov    %eax,%edx
c010691e:	c1 ea 1f             	shr    $0x1f,%edx
c0106921:	01 d0                	add    %edx,%eax
c0106923:	d1 f8                	sar    %eax
c0106925:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c010692a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010692f:	83 ec 0c             	sub    $0xc,%esp
c0106932:	50                   	push   %eax
c0106933:	e8 52 08 00 00       	call   c010718a <disp_int>
c0106938:	83 c4 10             	add    $0x10,%esp
c010693b:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106940:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106943:	29 c2                	sub    %eax,%edx
c0106945:	89 d0                	mov    %edx,%eax
c0106947:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c010694c:	83 ec 0c             	sub    $0xc,%esp
c010694f:	68 11 b6 10 c0       	push   $0xc010b611
c0106954:	e8 33 97 ff ff       	call   c010008c <disp_str>
c0106959:	83 c4 10             	add    $0x10,%esp
c010695c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106961:	83 ec 0c             	sub    $0xc,%esp
c0106964:	50                   	push   %eax
c0106965:	e8 20 08 00 00       	call   c010718a <disp_int>
c010696a:	83 c4 10             	add    $0x10,%esp
c010696d:	83 ec 0c             	sub    $0xc,%esp
c0106970:	68 11 b6 10 c0       	push   $0xc010b611
c0106975:	e8 12 97 ff ff       	call   c010008c <disp_str>
c010697a:	83 c4 10             	add    $0x10,%esp
c010697d:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106982:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106987:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010698d:	85 c0                	test   %eax,%eax
c010698f:	0f 48 c2             	cmovs  %edx,%eax
c0106992:	c1 f8 0c             	sar    $0xc,%eax
c0106995:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106998:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010699b:	83 c0 07             	add    $0x7,%eax
c010699e:	8d 50 07             	lea    0x7(%eax),%edx
c01069a1:	85 c0                	test   %eax,%eax
c01069a3:	0f 48 c2             	cmovs  %edx,%eax
c01069a6:	c1 f8 03             	sar    $0x3,%eax
c01069a9:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c01069ae:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01069b3:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01069b8:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01069bd:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01069c3:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01069c8:	83 ec 04             	sub    $0x4,%esp
c01069cb:	52                   	push   %edx
c01069cc:	6a 00                	push   $0x0
c01069ce:	50                   	push   %eax
c01069cf:	e8 1b 58 00 00       	call   c010c1ef <Memset>
c01069d4:	83 c4 10             	add    $0x10,%esp
c01069d7:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c01069dc:	05 ff 0f 00 00       	add    $0xfff,%eax
c01069e1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069e7:	85 c0                	test   %eax,%eax
c01069e9:	0f 48 c2             	cmovs  %edx,%eax
c01069ec:	c1 f8 0c             	sar    $0xc,%eax
c01069ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01069f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01069f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01069f8:	ff 75 e8             	pushl  -0x18(%ebp)
c01069fb:	6a 01                	push   $0x1
c01069fd:	6a 00                	push   $0x0
c01069ff:	68 ac 06 11 c0       	push   $0xc01106ac
c0106a04:	e8 37 f1 ff ff       	call   c0105b40 <set_bits>
c0106a09:	83 c4 10             	add    $0x10,%esp
c0106a0c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106a11:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a16:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a1c:	85 c0                	test   %eax,%eax
c0106a1e:	0f 48 c2             	cmovs  %edx,%eax
c0106a21:	c1 f8 0c             	sar    $0xc,%eax
c0106a24:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106a27:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106a2a:	83 c0 07             	add    $0x7,%eax
c0106a2d:	8d 50 07             	lea    0x7(%eax),%edx
c0106a30:	85 c0                	test   %eax,%eax
c0106a32:	0f 48 c2             	cmovs  %edx,%eax
c0106a35:	c1 f8 03             	sar    $0x3,%eax
c0106a38:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106a3d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106a42:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106a48:	01 d0                	add    %edx,%eax
c0106a4a:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106a4f:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106a55:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106a5a:	83 ec 04             	sub    $0x4,%esp
c0106a5d:	52                   	push   %edx
c0106a5e:	6a 00                	push   $0x0
c0106a60:	50                   	push   %eax
c0106a61:	e8 89 57 00 00       	call   c010c1ef <Memset>
c0106a66:	83 c4 10             	add    $0x10,%esp
c0106a69:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106a6e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a73:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a79:	85 c0                	test   %eax,%eax
c0106a7b:	0f 48 c2             	cmovs  %edx,%eax
c0106a7e:	c1 f8 0c             	sar    $0xc,%eax
c0106a81:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a84:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106a87:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a8a:	ff 75 e8             	pushl  -0x18(%ebp)
c0106a8d:	6a 01                	push   $0x1
c0106a8f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106a92:	68 ac 06 11 c0       	push   $0xc01106ac
c0106a97:	e8 a4 f0 ff ff       	call   c0105b40 <set_bits>
c0106a9c:	83 c4 10             	add    $0x10,%esp
c0106a9f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106aa6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106aa9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106aac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106aaf:	83 c0 07             	add    $0x7,%eax
c0106ab2:	8d 50 07             	lea    0x7(%eax),%edx
c0106ab5:	85 c0                	test   %eax,%eax
c0106ab7:	0f 48 c2             	cmovs  %edx,%eax
c0106aba:	c1 f8 03             	sar    $0x3,%eax
c0106abd:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106ac2:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106ac7:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106acd:	01 c2                	add    %eax,%edx
c0106acf:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106ad4:	01 d0                	add    %edx,%eax
c0106ad6:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106adb:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106ae1:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106ae6:	83 ec 04             	sub    $0x4,%esp
c0106ae9:	52                   	push   %edx
c0106aea:	6a 00                	push   $0x0
c0106aec:	50                   	push   %eax
c0106aed:	e8 fd 56 00 00       	call   c010c1ef <Memset>
c0106af2:	83 c4 10             	add    $0x10,%esp
c0106af5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106af8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106afb:	01 d0                	add    %edx,%eax
c0106afd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106b00:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106b05:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106b0a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106b10:	85 c0                	test   %eax,%eax
c0106b12:	0f 48 c2             	cmovs  %edx,%eax
c0106b15:	c1 f8 0c             	sar    $0xc,%eax
c0106b18:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b1b:	ff 75 e8             	pushl  -0x18(%ebp)
c0106b1e:	6a 01                	push   $0x1
c0106b20:	ff 75 e0             	pushl  -0x20(%ebp)
c0106b23:	68 ac 06 11 c0       	push   $0xc01106ac
c0106b28:	e8 13 f0 ff ff       	call   c0105b40 <set_bits>
c0106b2d:	83 c4 10             	add    $0x10,%esp
c0106b30:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106b33:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b36:	01 d0                	add    %edx,%eax
c0106b38:	c1 e0 0c             	shl    $0xc,%eax
c0106b3b:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106b40:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b43:	83 c0 02             	add    $0x2,%eax
c0106b46:	c1 e0 0c             	shl    $0xc,%eax
c0106b49:	89 c2                	mov    %eax,%edx
c0106b4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106b4e:	01 d0                	add    %edx,%eax
c0106b50:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106b55:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106b5c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b5f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106b62:	90                   	nop
c0106b63:	c9                   	leave  
c0106b64:	c3                   	ret    

c0106b65 <init_memory>:
c0106b65:	55                   	push   %ebp
c0106b66:	89 e5                	mov    %esp,%ebp
c0106b68:	83 ec 38             	sub    $0x38,%esp
c0106b6b:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106b72:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106b79:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106b80:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106b83:	05 00 00 40 00       	add    $0x400000,%eax
c0106b88:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b8e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106b91:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106b97:	85 c0                	test   %eax,%eax
c0106b99:	0f 48 c2             	cmovs  %edx,%eax
c0106b9c:	c1 f8 0c             	sar    $0xc,%eax
c0106b9f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106ba2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106ba5:	89 c2                	mov    %eax,%edx
c0106ba7:	c1 ea 1f             	shr    $0x1f,%edx
c0106baa:	01 d0                	add    %edx,%eax
c0106bac:	d1 f8                	sar    %eax
c0106bae:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106bb1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106bb4:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106bb7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106bba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106bbd:	8d 50 07             	lea    0x7(%eax),%edx
c0106bc0:	85 c0                	test   %eax,%eax
c0106bc2:	0f 48 c2             	cmovs  %edx,%eax
c0106bc5:	c1 f8 03             	sar    $0x3,%eax
c0106bc8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106bcb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106bce:	8d 50 07             	lea    0x7(%eax),%edx
c0106bd1:	85 c0                	test   %eax,%eax
c0106bd3:	0f 48 c2             	cmovs  %edx,%eax
c0106bd6:	c1 f8 03             	sar    $0x3,%eax
c0106bd9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106bdc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106bdf:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106be4:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106be9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106bec:	c1 e2 0c             	shl    $0xc,%edx
c0106bef:	01 d0                	add    %edx,%eax
c0106bf1:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106bf6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106bf9:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106bfe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106c01:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106c06:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106c0b:	83 ec 04             	sub    $0x4,%esp
c0106c0e:	ff 75 d8             	pushl  -0x28(%ebp)
c0106c11:	6a 00                	push   $0x0
c0106c13:	50                   	push   %eax
c0106c14:	e8 d6 55 00 00       	call   c010c1ef <Memset>
c0106c19:	83 c4 10             	add    $0x10,%esp
c0106c1c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106c1f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106c22:	01 d0                	add    %edx,%eax
c0106c24:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106c29:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106c2c:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106c31:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106c36:	83 ec 04             	sub    $0x4,%esp
c0106c39:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106c3c:	6a 00                	push   $0x0
c0106c3e:	50                   	push   %eax
c0106c3f:	e8 ab 55 00 00       	call   c010c1ef <Memset>
c0106c44:	83 c4 10             	add    $0x10,%esp
c0106c47:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106c4a:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106c4f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106c52:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106c55:	01 c2                	add    %eax,%edx
c0106c57:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106c5a:	01 d0                	add    %edx,%eax
c0106c5c:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106c61:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106c64:	05 00 00 10 00       	add    $0x100000,%eax
c0106c69:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106c6e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106c73:	83 ec 04             	sub    $0x4,%esp
c0106c76:	ff 75 d8             	pushl  -0x28(%ebp)
c0106c79:	6a 00                	push   $0x0
c0106c7b:	50                   	push   %eax
c0106c7c:	e8 6e 55 00 00       	call   c010c1ef <Memset>
c0106c81:	83 c4 10             	add    $0x10,%esp
c0106c84:	83 ec 04             	sub    $0x4,%esp
c0106c87:	68 f0 00 00 00       	push   $0xf0
c0106c8c:	6a 00                	push   $0x0
c0106c8e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106c93:	e8 57 55 00 00       	call   c010c1ef <Memset>
c0106c98:	83 c4 10             	add    $0x10,%esp
c0106c9b:	83 ec 0c             	sub    $0xc,%esp
c0106c9e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106ca3:	e8 75 fb ff ff       	call   c010681d <init_memory_block_desc>
c0106ca8:	83 c4 10             	add    $0x10,%esp
c0106cab:	90                   	nop
c0106cac:	c9                   	leave  
c0106cad:	c3                   	ret    

c0106cae <stop_here>:
c0106cae:	55                   	push   %ebp
c0106caf:	89 e5                	mov    %esp,%ebp
c0106cb1:	83 ec 08             	sub    $0x8,%esp
c0106cb4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106cbb:	00 00 00 
c0106cbe:	83 ec 0c             	sub    $0xc,%esp
c0106cc1:	68 20 b6 10 c0       	push   $0xc010b620
c0106cc6:	e8 c1 93 ff ff       	call   c010008c <disp_str>
c0106ccb:	83 c4 10             	add    $0x10,%esp
c0106cce:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106cd3:	83 ec 0c             	sub    $0xc,%esp
c0106cd6:	50                   	push   %eax
c0106cd7:	e8 ae 04 00 00       	call   c010718a <disp_int>
c0106cdc:	83 c4 10             	add    $0x10,%esp
c0106cdf:	83 ec 0c             	sub    $0xc,%esp
c0106ce2:	68 22 b6 10 c0       	push   $0xc010b622
c0106ce7:	e8 a0 93 ff ff       	call   c010008c <disp_str>
c0106cec:	83 c4 10             	add    $0x10,%esp
c0106cef:	90                   	nop
c0106cf0:	c9                   	leave  
c0106cf1:	c3                   	ret    

c0106cf2 <catch_error>:
c0106cf2:	55                   	push   %ebp
c0106cf3:	89 e5                	mov    %esp,%ebp
c0106cf5:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106cfa:	83 c0 01             	add    $0x1,%eax
c0106cfd:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106d02:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106d07:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106d0c:	90                   	nop
c0106d0d:	5d                   	pop    %ebp
c0106d0e:	c3                   	ret    

c0106d0f <intr_enable>:
c0106d0f:	55                   	push   %ebp
c0106d10:	89 e5                	mov    %esp,%ebp
c0106d12:	83 ec 18             	sub    $0x18,%esp
c0106d15:	e8 65 00 00 00       	call   c0106d7f <intr_get_status>
c0106d1a:	83 f8 01             	cmp    $0x1,%eax
c0106d1d:	75 0c                	jne    c0106d2b <intr_enable+0x1c>
c0106d1f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d29:	eb 0b                	jmp    c0106d36 <intr_enable+0x27>
c0106d2b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d32:	fb                   	sti    
c0106d33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d36:	c9                   	leave  
c0106d37:	c3                   	ret    

c0106d38 <intr_disable>:
c0106d38:	55                   	push   %ebp
c0106d39:	89 e5                	mov    %esp,%ebp
c0106d3b:	83 ec 18             	sub    $0x18,%esp
c0106d3e:	e8 3c 00 00 00       	call   c0106d7f <intr_get_status>
c0106d43:	83 f8 01             	cmp    $0x1,%eax
c0106d46:	75 0d                	jne    c0106d55 <intr_disable+0x1d>
c0106d48:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106d4f:	fa                   	cli    
c0106d50:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d53:	eb 0a                	jmp    c0106d5f <intr_disable+0x27>
c0106d55:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d5f:	c9                   	leave  
c0106d60:	c3                   	ret    

c0106d61 <intr_set_status>:
c0106d61:	55                   	push   %ebp
c0106d62:	89 e5                	mov    %esp,%ebp
c0106d64:	83 ec 08             	sub    $0x8,%esp
c0106d67:	8b 45 08             	mov    0x8(%ebp),%eax
c0106d6a:	83 e0 01             	and    $0x1,%eax
c0106d6d:	85 c0                	test   %eax,%eax
c0106d6f:	74 07                	je     c0106d78 <intr_set_status+0x17>
c0106d71:	e8 99 ff ff ff       	call   c0106d0f <intr_enable>
c0106d76:	eb 05                	jmp    c0106d7d <intr_set_status+0x1c>
c0106d78:	e8 bb ff ff ff       	call   c0106d38 <intr_disable>
c0106d7d:	c9                   	leave  
c0106d7e:	c3                   	ret    

c0106d7f <intr_get_status>:
c0106d7f:	55                   	push   %ebp
c0106d80:	89 e5                	mov    %esp,%ebp
c0106d82:	83 ec 10             	sub    $0x10,%esp
c0106d85:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106d8c:	9c                   	pushf  
c0106d8d:	58                   	pop    %eax
c0106d8e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106d91:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106d94:	c1 e8 09             	shr    $0x9,%eax
c0106d97:	83 e0 01             	and    $0x1,%eax
c0106d9a:	c9                   	leave  
c0106d9b:	c3                   	ret    

c0106d9c <Memcpy>:
c0106d9c:	55                   	push   %ebp
c0106d9d:	89 e5                	mov    %esp,%ebp
c0106d9f:	83 ec 18             	sub    $0x18,%esp
c0106da2:	e8 91 ff ff ff       	call   c0106d38 <intr_disable>
c0106da7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106daa:	83 ec 04             	sub    $0x4,%esp
c0106dad:	ff 75 10             	pushl  0x10(%ebp)
c0106db0:	ff 75 0c             	pushl  0xc(%ebp)
c0106db3:	ff 75 08             	pushl  0x8(%ebp)
c0106db6:	e8 06 54 00 00       	call   c010c1c1 <Memcpy2>
c0106dbb:	83 c4 10             	add    $0x10,%esp
c0106dbe:	83 ec 0c             	sub    $0xc,%esp
c0106dc1:	ff 75 f4             	pushl  -0xc(%ebp)
c0106dc4:	e8 98 ff ff ff       	call   c0106d61 <intr_set_status>
c0106dc9:	83 c4 10             	add    $0x10,%esp
c0106dcc:	90                   	nop
c0106dcd:	c9                   	leave  
c0106dce:	c3                   	ret    

c0106dcf <untar>:
c0106dcf:	55                   	push   %ebp
c0106dd0:	89 e5                	mov    %esp,%ebp
c0106dd2:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106dd8:	83 ec 08             	sub    $0x8,%esp
c0106ddb:	6a 00                	push   $0x0
c0106ddd:	ff 75 08             	pushl  0x8(%ebp)
c0106de0:	e8 2a de ff ff       	call   c0104c0f <open>
c0106de5:	83 c4 10             	add    $0x10,%esp
c0106de8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106deb:	83 ec 0c             	sub    $0xc,%esp
c0106dee:	68 24 b6 10 c0       	push   $0xc010b624
c0106df3:	e8 60 18 00 00       	call   c0108658 <Printf>
c0106df8:	83 c4 10             	add    $0x10,%esp
c0106dfb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106e02:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106e09:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106e10:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106e17:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106e1e:	e9 63 02 00 00       	jmp    c0107086 <untar+0x2b7>
c0106e23:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106e27:	7e 58                	jle    c0106e81 <untar+0xb2>
c0106e29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e2c:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106e31:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106e37:	85 c0                	test   %eax,%eax
c0106e39:	0f 48 c2             	cmovs  %edx,%eax
c0106e3c:	c1 f8 09             	sar    $0x9,%eax
c0106e3f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106e42:	83 ec 04             	sub    $0x4,%esp
c0106e45:	68 00 02 00 00       	push   $0x200
c0106e4a:	6a 00                	push   $0x0
c0106e4c:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e52:	50                   	push   %eax
c0106e53:	e8 97 53 00 00       	call   c010c1ef <Memset>
c0106e58:	83 c4 10             	add    $0x10,%esp
c0106e5b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106e5e:	c1 e0 09             	shl    $0x9,%eax
c0106e61:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106e64:	83 ec 04             	sub    $0x4,%esp
c0106e67:	50                   	push   %eax
c0106e68:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e6e:	50                   	push   %eax
c0106e6f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106e72:	e8 2d de ff ff       	call   c0104ca4 <read>
c0106e77:	83 c4 10             	add    $0x10,%esp
c0106e7a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106e81:	83 ec 04             	sub    $0x4,%esp
c0106e84:	68 00 02 00 00       	push   $0x200
c0106e89:	6a 00                	push   $0x0
c0106e8b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e91:	50                   	push   %eax
c0106e92:	e8 58 53 00 00       	call   c010c1ef <Memset>
c0106e97:	83 c4 10             	add    $0x10,%esp
c0106e9a:	83 ec 04             	sub    $0x4,%esp
c0106e9d:	68 00 02 00 00       	push   $0x200
c0106ea2:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106ea8:	50                   	push   %eax
c0106ea9:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106eac:	e8 f3 dd ff ff       	call   c0104ca4 <read>
c0106eb1:	83 c4 10             	add    $0x10,%esp
c0106eb4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106eb7:	83 ec 0c             	sub    $0xc,%esp
c0106eba:	68 36 b6 10 c0       	push   $0xc010b636
c0106ebf:	e8 94 17 00 00       	call   c0108658 <Printf>
c0106ec4:	83 c4 10             	add    $0x10,%esp
c0106ec7:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106ecb:	0f 84 c1 01 00 00    	je     c0107092 <untar+0x2c3>
c0106ed1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ed4:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106ed7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106ede:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106ee4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106ee7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106eea:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106eed:	83 ec 08             	sub    $0x8,%esp
c0106ef0:	6a 07                	push   $0x7
c0106ef2:	ff 75 cc             	pushl  -0x34(%ebp)
c0106ef5:	e8 15 dd ff ff       	call   c0104c0f <open>
c0106efa:	83 c4 10             	add    $0x10,%esp
c0106efd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106f00:	83 ec 0c             	sub    $0xc,%esp
c0106f03:	68 48 b6 10 c0       	push   $0xc010b648
c0106f08:	e8 4b 17 00 00       	call   c0108658 <Printf>
c0106f0d:	83 c4 10             	add    $0x10,%esp
c0106f10:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106f17:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106f1a:	83 c0 7c             	add    $0x7c,%eax
c0106f1d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106f20:	83 ec 0c             	sub    $0xc,%esp
c0106f23:	ff 75 cc             	pushl  -0x34(%ebp)
c0106f26:	e8 fd 52 00 00       	call   c010c228 <Strlen>
c0106f2b:	83 c4 10             	add    $0x10,%esp
c0106f2e:	85 c0                	test   %eax,%eax
c0106f30:	75 28                	jne    c0106f5a <untar+0x18b>
c0106f32:	83 ec 0c             	sub    $0xc,%esp
c0106f35:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106f38:	e8 eb 52 00 00       	call   c010c228 <Strlen>
c0106f3d:	83 c4 10             	add    $0x10,%esp
c0106f40:	85 c0                	test   %eax,%eax
c0106f42:	75 16                	jne    c0106f5a <untar+0x18b>
c0106f44:	83 ec 0c             	sub    $0xc,%esp
c0106f47:	68 5a b6 10 c0       	push   $0xc010b65a
c0106f4c:	e8 07 17 00 00       	call   c0108658 <Printf>
c0106f51:	83 c4 10             	add    $0x10,%esp
c0106f54:	90                   	nop
c0106f55:	e9 39 01 00 00       	jmp    c0107093 <untar+0x2c4>
c0106f5a:	83 ec 0c             	sub    $0xc,%esp
c0106f5d:	68 61 b6 10 c0       	push   $0xc010b661
c0106f62:	e8 f1 16 00 00       	call   c0108658 <Printf>
c0106f67:	83 c4 10             	add    $0x10,%esp
c0106f6a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106f6d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106f70:	eb 1f                	jmp    c0106f91 <untar+0x1c2>
c0106f72:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f75:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106f7c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106f7f:	0f b6 00             	movzbl (%eax),%eax
c0106f82:	0f be c0             	movsbl %al,%eax
c0106f85:	83 e8 30             	sub    $0x30,%eax
c0106f88:	01 d0                	add    %edx,%eax
c0106f8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106f8d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106f91:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106f94:	0f b6 00             	movzbl (%eax),%eax
c0106f97:	84 c0                	test   %al,%al
c0106f99:	75 d7                	jne    c0106f72 <untar+0x1a3>
c0106f9b:	83 ec 0c             	sub    $0xc,%esp
c0106f9e:	68 6f b6 10 c0       	push   $0xc010b66f
c0106fa3:	e8 b0 16 00 00       	call   c0108658 <Printf>
c0106fa8:	83 c4 10             	add    $0x10,%esp
c0106fab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106fae:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106fb1:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106fb8:	83 ec 08             	sub    $0x8,%esp
c0106fbb:	ff 75 c0             	pushl  -0x40(%ebp)
c0106fbe:	68 7d b6 10 c0       	push   $0xc010b67d
c0106fc3:	e8 90 16 00 00       	call   c0108658 <Printf>
c0106fc8:	83 c4 10             	add    $0x10,%esp
c0106fcb:	83 ec 08             	sub    $0x8,%esp
c0106fce:	ff 75 c0             	pushl  -0x40(%ebp)
c0106fd1:	68 8f b6 10 c0       	push   $0xc010b68f
c0106fd6:	e8 7d 16 00 00       	call   c0108658 <Printf>
c0106fdb:	83 c4 10             	add    $0x10,%esp
c0106fde:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106fe1:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106fe4:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106fe8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106feb:	e8 02 fd ff ff       	call   c0106cf2 <catch_error>
c0106ff0:	83 ec 04             	sub    $0x4,%esp
c0106ff3:	ff 75 b8             	pushl  -0x48(%ebp)
c0106ff6:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106ffc:	50                   	push   %eax
c0106ffd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107000:	e8 9f dc ff ff       	call   c0104ca4 <read>
c0107005:	83 c4 10             	add    $0x10,%esp
c0107008:	01 45 f4             	add    %eax,-0xc(%ebp)
c010700b:	83 ec 04             	sub    $0x4,%esp
c010700e:	ff 75 b8             	pushl  -0x48(%ebp)
c0107011:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0107017:	50                   	push   %eax
c0107018:	ff 75 c8             	pushl  -0x38(%ebp)
c010701b:	e8 05 de ff ff       	call   c0104e25 <write>
c0107020:	83 c4 10             	add    $0x10,%esp
c0107023:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107026:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0107029:	7d 02                	jge    c010702d <untar+0x25e>
c010702b:	eb be                	jmp    c0106feb <untar+0x21c>
c010702d:	90                   	nop
c010702e:	83 ec 08             	sub    $0x8,%esp
c0107031:	ff 75 f4             	pushl  -0xc(%ebp)
c0107034:	68 a1 b6 10 c0       	push   $0xc010b6a1
c0107039:	e8 1a 16 00 00       	call   c0108658 <Printf>
c010703e:	83 c4 10             	add    $0x10,%esp
c0107041:	83 ec 08             	sub    $0x8,%esp
c0107044:	ff 75 c0             	pushl  -0x40(%ebp)
c0107047:	68 b3 b6 10 c0       	push   $0xc010b6b3
c010704c:	e8 07 16 00 00       	call   c0108658 <Printf>
c0107051:	83 c4 10             	add    $0x10,%esp
c0107054:	83 ec 0c             	sub    $0xc,%esp
c0107057:	68 c4 b6 10 c0       	push   $0xc010b6c4
c010705c:	e8 f7 15 00 00       	call   c0108658 <Printf>
c0107061:	83 c4 10             	add    $0x10,%esp
c0107064:	83 ec 0c             	sub    $0xc,%esp
c0107067:	ff 75 c8             	pushl  -0x38(%ebp)
c010706a:	e8 3b de ff ff       	call   c0104eaa <close>
c010706f:	83 c4 10             	add    $0x10,%esp
c0107072:	83 ec 0c             	sub    $0xc,%esp
c0107075:	68 d2 b6 10 c0       	push   $0xc010b6d2
c010707a:	e8 d9 15 00 00       	call   c0108658 <Printf>
c010707f:	83 c4 10             	add    $0x10,%esp
c0107082:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0107086:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010708a:	0f 8f 93 fd ff ff    	jg     c0106e23 <untar+0x54>
c0107090:	eb 01                	jmp    c0107093 <untar+0x2c4>
c0107092:	90                   	nop
c0107093:	83 ec 0c             	sub    $0xc,%esp
c0107096:	68 df b6 10 c0       	push   $0xc010b6df
c010709b:	e8 b8 15 00 00       	call   c0108658 <Printf>
c01070a0:	83 c4 10             	add    $0x10,%esp
c01070a3:	83 ec 0c             	sub    $0xc,%esp
c01070a6:	68 f1 b6 10 c0       	push   $0xc010b6f1
c01070ab:	e8 a8 15 00 00       	call   c0108658 <Printf>
c01070b0:	83 c4 10             	add    $0x10,%esp
c01070b3:	83 ec 0c             	sub    $0xc,%esp
c01070b6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01070b9:	e8 ec dd ff ff       	call   c0104eaa <close>
c01070be:	83 c4 10             	add    $0x10,%esp
c01070c1:	83 ec 0c             	sub    $0xc,%esp
c01070c4:	68 01 b7 10 c0       	push   $0xc010b701
c01070c9:	e8 8a 15 00 00       	call   c0108658 <Printf>
c01070ce:	83 c4 10             	add    $0x10,%esp
c01070d1:	83 ec 0c             	sub    $0xc,%esp
c01070d4:	68 14 b7 10 c0       	push   $0xc010b714
c01070d9:	e8 7a 15 00 00       	call   c0108658 <Printf>
c01070de:	83 c4 10             	add    $0x10,%esp
c01070e1:	90                   	nop
c01070e2:	c9                   	leave  
c01070e3:	c3                   	ret    

c01070e4 <atoi>:
c01070e4:	55                   	push   %ebp
c01070e5:	89 e5                	mov    %esp,%ebp
c01070e7:	83 ec 10             	sub    $0x10,%esp
c01070ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01070ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01070f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01070f3:	8d 50 01             	lea    0x1(%eax),%edx
c01070f6:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01070f9:	c6 00 30             	movb   $0x30,(%eax)
c01070fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01070ff:	8d 50 01             	lea    0x1(%eax),%edx
c0107102:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107105:	c6 00 78             	movb   $0x78,(%eax)
c0107108:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c010710c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0107110:	75 0e                	jne    c0107120 <atoi+0x3c>
c0107112:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107115:	8d 50 01             	lea    0x1(%eax),%edx
c0107118:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010711b:	c6 00 30             	movb   $0x30,(%eax)
c010711e:	eb 61                	jmp    c0107181 <atoi+0x9d>
c0107120:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0107127:	eb 52                	jmp    c010717b <atoi+0x97>
c0107129:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010712c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010712f:	89 c1                	mov    %eax,%ecx
c0107131:	d3 fa                	sar    %cl,%edx
c0107133:	89 d0                	mov    %edx,%eax
c0107135:	83 e0 0f             	and    $0xf,%eax
c0107138:	88 45 fb             	mov    %al,-0x5(%ebp)
c010713b:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c010713f:	75 06                	jne    c0107147 <atoi+0x63>
c0107141:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0107145:	74 2f                	je     c0107176 <atoi+0x92>
c0107147:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c010714b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010714f:	83 c0 30             	add    $0x30,%eax
c0107152:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107155:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0107159:	7e 0a                	jle    c0107165 <atoi+0x81>
c010715b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010715f:	83 c0 07             	add    $0x7,%eax
c0107162:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107165:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107168:	8d 50 01             	lea    0x1(%eax),%edx
c010716b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010716e:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0107172:	88 10                	mov    %dl,(%eax)
c0107174:	eb 01                	jmp    c0107177 <atoi+0x93>
c0107176:	90                   	nop
c0107177:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010717b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010717f:	79 a8                	jns    c0107129 <atoi+0x45>
c0107181:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107184:	c6 00 00             	movb   $0x0,(%eax)
c0107187:	90                   	nop
c0107188:	c9                   	leave  
c0107189:	c3                   	ret    

c010718a <disp_int>:
c010718a:	55                   	push   %ebp
c010718b:	89 e5                	mov    %esp,%ebp
c010718d:	83 ec 18             	sub    $0x18,%esp
c0107190:	ff 75 08             	pushl  0x8(%ebp)
c0107193:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107196:	50                   	push   %eax
c0107197:	e8 48 ff ff ff       	call   c01070e4 <atoi>
c010719c:	83 c4 08             	add    $0x8,%esp
c010719f:	83 ec 08             	sub    $0x8,%esp
c01071a2:	6a 0b                	push   $0xb
c01071a4:	8d 45 ee             	lea    -0x12(%ebp),%eax
c01071a7:	50                   	push   %eax
c01071a8:	e8 1a 8f ff ff       	call   c01000c7 <disp_str_colour>
c01071ad:	83 c4 10             	add    $0x10,%esp
c01071b0:	90                   	nop
c01071b1:	c9                   	leave  
c01071b2:	c3                   	ret    

c01071b3 <do_page_fault>:
c01071b3:	55                   	push   %ebp
c01071b4:	89 e5                	mov    %esp,%ebp
c01071b6:	83 ec 28             	sub    $0x28,%esp
c01071b9:	0f 20 d0             	mov    %cr2,%eax
c01071bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01071bf:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01071c6:	00 00 00 
c01071c9:	83 ec 0c             	sub    $0xc,%esp
c01071cc:	68 1f b7 10 c0       	push   $0xc010b71f
c01071d1:	e8 b6 8e ff ff       	call   c010008c <disp_str>
c01071d6:	83 c4 10             	add    $0x10,%esp
c01071d9:	83 ec 0c             	sub    $0xc,%esp
c01071dc:	68 2e b7 10 c0       	push   $0xc010b72e
c01071e1:	e8 a6 8e ff ff       	call   c010008c <disp_str>
c01071e6:	83 c4 10             	add    $0x10,%esp
c01071e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01071ec:	83 ec 0c             	sub    $0xc,%esp
c01071ef:	50                   	push   %eax
c01071f0:	e8 95 ff ff ff       	call   c010718a <disp_int>
c01071f5:	83 c4 10             	add    $0x10,%esp
c01071f8:	83 ec 0c             	sub    $0xc,%esp
c01071fb:	68 33 b7 10 c0       	push   $0xc010b733
c0107200:	e8 87 8e ff ff       	call   c010008c <disp_str>
c0107205:	83 c4 10             	add    $0x10,%esp
c0107208:	83 ec 0c             	sub    $0xc,%esp
c010720b:	ff 75 f4             	pushl  -0xc(%ebp)
c010720e:	e8 51 ec ff ff       	call   c0105e64 <ptr_pde>
c0107213:	83 c4 10             	add    $0x10,%esp
c0107216:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107219:	83 ec 0c             	sub    $0xc,%esp
c010721c:	ff 75 f4             	pushl  -0xc(%ebp)
c010721f:	e8 53 ec ff ff       	call   c0105e77 <ptr_pte>
c0107224:	83 c4 10             	add    $0x10,%esp
c0107227:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010722a:	83 ec 0c             	sub    $0xc,%esp
c010722d:	68 35 b7 10 c0       	push   $0xc010b735
c0107232:	e8 55 8e ff ff       	call   c010008c <disp_str>
c0107237:	83 c4 10             	add    $0x10,%esp
c010723a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010723d:	83 ec 0c             	sub    $0xc,%esp
c0107240:	50                   	push   %eax
c0107241:	e8 44 ff ff ff       	call   c010718a <disp_int>
c0107246:	83 c4 10             	add    $0x10,%esp
c0107249:	83 ec 0c             	sub    $0xc,%esp
c010724c:	68 3a b7 10 c0       	push   $0xc010b73a
c0107251:	e8 36 8e ff ff       	call   c010008c <disp_str>
c0107256:	83 c4 10             	add    $0x10,%esp
c0107259:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010725c:	8b 00                	mov    (%eax),%eax
c010725e:	83 ec 0c             	sub    $0xc,%esp
c0107261:	50                   	push   %eax
c0107262:	e8 23 ff ff ff       	call   c010718a <disp_int>
c0107267:	83 c4 10             	add    $0x10,%esp
c010726a:	83 ec 0c             	sub    $0xc,%esp
c010726d:	68 33 b7 10 c0       	push   $0xc010b733
c0107272:	e8 15 8e ff ff       	call   c010008c <disp_str>
c0107277:	83 c4 10             	add    $0x10,%esp
c010727a:	83 ec 0c             	sub    $0xc,%esp
c010727d:	68 43 b7 10 c0       	push   $0xc010b743
c0107282:	e8 05 8e ff ff       	call   c010008c <disp_str>
c0107287:	83 c4 10             	add    $0x10,%esp
c010728a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010728d:	83 ec 0c             	sub    $0xc,%esp
c0107290:	50                   	push   %eax
c0107291:	e8 f4 fe ff ff       	call   c010718a <disp_int>
c0107296:	83 c4 10             	add    $0x10,%esp
c0107299:	83 ec 0c             	sub    $0xc,%esp
c010729c:	68 48 b7 10 c0       	push   $0xc010b748
c01072a1:	e8 e6 8d ff ff       	call   c010008c <disp_str>
c01072a6:	83 c4 10             	add    $0x10,%esp
c01072a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01072ac:	8b 00                	mov    (%eax),%eax
c01072ae:	83 ec 0c             	sub    $0xc,%esp
c01072b1:	50                   	push   %eax
c01072b2:	e8 d3 fe ff ff       	call   c010718a <disp_int>
c01072b7:	83 c4 10             	add    $0x10,%esp
c01072ba:	83 ec 0c             	sub    $0xc,%esp
c01072bd:	68 33 b7 10 c0       	push   $0xc010b733
c01072c2:	e8 c5 8d ff ff       	call   c010008c <disp_str>
c01072c7:	83 c4 10             	add    $0x10,%esp
c01072ca:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c01072d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01072d4:	8b 00                	mov    (%eax),%eax
c01072d6:	83 e0 01             	and    $0x1,%eax
c01072d9:	85 c0                	test   %eax,%eax
c01072db:	74 09                	je     c01072e6 <do_page_fault+0x133>
c01072dd:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c01072e4:	eb 07                	jmp    c01072ed <do_page_fault+0x13a>
c01072e6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01072ed:	90                   	nop
c01072ee:	c9                   	leave  
c01072ef:	c3                   	ret    

c01072f0 <exception_handler>:
c01072f0:	55                   	push   %ebp
c01072f1:	89 e5                	mov    %esp,%ebp
c01072f3:	57                   	push   %edi
c01072f4:	56                   	push   %esi
c01072f5:	53                   	push   %ebx
c01072f6:	83 ec 6c             	sub    $0x6c,%esp
c01072f9:	8d 45 8c             	lea    -0x74(%ebp),%eax
c01072fc:	bb c0 b9 10 c0       	mov    $0xc010b9c0,%ebx
c0107301:	ba 13 00 00 00       	mov    $0x13,%edx
c0107306:	89 c7                	mov    %eax,%edi
c0107308:	89 de                	mov    %ebx,%esi
c010730a:	89 d1                	mov    %edx,%ecx
c010730c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010730e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107315:	eb 04                	jmp    c010731b <exception_handler+0x2b>
c0107317:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010731b:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0107322:	7e f3                	jle    c0107317 <exception_handler+0x27>
c0107324:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010732b:	00 00 00 
c010732e:	83 ec 0c             	sub    $0xc,%esp
c0107331:	68 51 b7 10 c0       	push   $0xc010b751
c0107336:	e8 51 8d ff ff       	call   c010008c <disp_str>
c010733b:	83 c4 10             	add    $0x10,%esp
c010733e:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107345:	8b 45 08             	mov    0x8(%ebp),%eax
c0107348:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c010734c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010734f:	83 ec 0c             	sub    $0xc,%esp
c0107352:	ff 75 dc             	pushl  -0x24(%ebp)
c0107355:	e8 32 8d ff ff       	call   c010008c <disp_str>
c010735a:	83 c4 10             	add    $0x10,%esp
c010735d:	83 ec 0c             	sub    $0xc,%esp
c0107360:	68 5f b7 10 c0       	push   $0xc010b75f
c0107365:	e8 22 8d ff ff       	call   c010008c <disp_str>
c010736a:	83 c4 10             	add    $0x10,%esp
c010736d:	83 ec 0c             	sub    $0xc,%esp
c0107370:	68 62 b7 10 c0       	push   $0xc010b762
c0107375:	e8 12 8d ff ff       	call   c010008c <disp_str>
c010737a:	83 c4 10             	add    $0x10,%esp
c010737d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107380:	83 ec 0c             	sub    $0xc,%esp
c0107383:	50                   	push   %eax
c0107384:	e8 01 fe ff ff       	call   c010718a <disp_int>
c0107389:	83 c4 10             	add    $0x10,%esp
c010738c:	83 ec 0c             	sub    $0xc,%esp
c010738f:	68 5f b7 10 c0       	push   $0xc010b75f
c0107394:	e8 f3 8c ff ff       	call   c010008c <disp_str>
c0107399:	83 c4 10             	add    $0x10,%esp
c010739c:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c01073a0:	74 2f                	je     c01073d1 <exception_handler+0xe1>
c01073a2:	83 ec 0c             	sub    $0xc,%esp
c01073a5:	68 6a b7 10 c0       	push   $0xc010b76a
c01073aa:	e8 dd 8c ff ff       	call   c010008c <disp_str>
c01073af:	83 c4 10             	add    $0x10,%esp
c01073b2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01073b5:	83 ec 0c             	sub    $0xc,%esp
c01073b8:	50                   	push   %eax
c01073b9:	e8 cc fd ff ff       	call   c010718a <disp_int>
c01073be:	83 c4 10             	add    $0x10,%esp
c01073c1:	83 ec 0c             	sub    $0xc,%esp
c01073c4:	68 5f b7 10 c0       	push   $0xc010b75f
c01073c9:	e8 be 8c ff ff       	call   c010008c <disp_str>
c01073ce:	83 c4 10             	add    $0x10,%esp
c01073d1:	83 ec 0c             	sub    $0xc,%esp
c01073d4:	68 74 b7 10 c0       	push   $0xc010b774
c01073d9:	e8 ae 8c ff ff       	call   c010008c <disp_str>
c01073de:	83 c4 10             	add    $0x10,%esp
c01073e1:	83 ec 0c             	sub    $0xc,%esp
c01073e4:	ff 75 14             	pushl  0x14(%ebp)
c01073e7:	e8 9e fd ff ff       	call   c010718a <disp_int>
c01073ec:	83 c4 10             	add    $0x10,%esp
c01073ef:	83 ec 0c             	sub    $0xc,%esp
c01073f2:	68 5f b7 10 c0       	push   $0xc010b75f
c01073f7:	e8 90 8c ff ff       	call   c010008c <disp_str>
c01073fc:	83 c4 10             	add    $0x10,%esp
c01073ff:	83 ec 0c             	sub    $0xc,%esp
c0107402:	68 78 b7 10 c0       	push   $0xc010b778
c0107407:	e8 80 8c ff ff       	call   c010008c <disp_str>
c010740c:	83 c4 10             	add    $0x10,%esp
c010740f:	8b 45 10             	mov    0x10(%ebp),%eax
c0107412:	83 ec 0c             	sub    $0xc,%esp
c0107415:	50                   	push   %eax
c0107416:	e8 6f fd ff ff       	call   c010718a <disp_int>
c010741b:	83 c4 10             	add    $0x10,%esp
c010741e:	83 ec 0c             	sub    $0xc,%esp
c0107421:	68 5f b7 10 c0       	push   $0xc010b75f
c0107426:	e8 61 8c ff ff       	call   c010008c <disp_str>
c010742b:	83 c4 10             	add    $0x10,%esp
c010742e:	83 ec 0c             	sub    $0xc,%esp
c0107431:	68 7d b7 10 c0       	push   $0xc010b77d
c0107436:	e8 51 8c ff ff       	call   c010008c <disp_str>
c010743b:	83 c4 10             	add    $0x10,%esp
c010743e:	83 ec 0c             	sub    $0xc,%esp
c0107441:	ff 75 18             	pushl  0x18(%ebp)
c0107444:	e8 41 fd ff ff       	call   c010718a <disp_int>
c0107449:	83 c4 10             	add    $0x10,%esp
c010744c:	83 ec 0c             	sub    $0xc,%esp
c010744f:	68 5f b7 10 c0       	push   $0xc010b75f
c0107454:	e8 33 8c ff ff       	call   c010008c <disp_str>
c0107459:	83 c4 10             	add    $0x10,%esp
c010745c:	83 ec 0c             	sub    $0xc,%esp
c010745f:	68 88 b7 10 c0       	push   $0xc010b788
c0107464:	e8 23 8c ff ff       	call   c010008c <disp_str>
c0107469:	83 c4 10             	add    $0x10,%esp
c010746c:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0107470:	75 45                	jne    c01074b7 <exception_handler+0x1c7>
c0107472:	0f 20 d0             	mov    %cr2,%eax
c0107475:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107478:	83 ec 0c             	sub    $0xc,%esp
c010747b:	68 a7 b7 10 c0       	push   $0xc010b7a7
c0107480:	e8 07 8c ff ff       	call   c010008c <disp_str>
c0107485:	83 c4 10             	add    $0x10,%esp
c0107488:	83 ec 0c             	sub    $0xc,%esp
c010748b:	68 2e b7 10 c0       	push   $0xc010b72e
c0107490:	e8 f7 8b ff ff       	call   c010008c <disp_str>
c0107495:	83 c4 10             	add    $0x10,%esp
c0107498:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010749b:	83 ec 0c             	sub    $0xc,%esp
c010749e:	50                   	push   %eax
c010749f:	e8 e6 fc ff ff       	call   c010718a <disp_int>
c01074a4:	83 c4 10             	add    $0x10,%esp
c01074a7:	83 ec 0c             	sub    $0xc,%esp
c01074aa:	68 33 b7 10 c0       	push   $0xc010b733
c01074af:	e8 d8 8b ff ff       	call   c010008c <disp_str>
c01074b4:	83 c4 10             	add    $0x10,%esp
c01074b7:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c01074bb:	75 11                	jne    c01074ce <exception_handler+0x1de>
c01074bd:	83 ec 0c             	sub    $0xc,%esp
c01074c0:	68 b3 b7 10 c0       	push   $0xc010b7b3
c01074c5:	e8 c2 8b ff ff       	call   c010008c <disp_str>
c01074ca:	83 c4 10             	add    $0x10,%esp
c01074cd:	90                   	nop
c01074ce:	90                   	nop
c01074cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01074d2:	5b                   	pop    %ebx
c01074d3:	5e                   	pop    %esi
c01074d4:	5f                   	pop    %edi
c01074d5:	5d                   	pop    %ebp
c01074d6:	c3                   	ret    

c01074d7 <init_internal_interrupt>:
c01074d7:	55                   	push   %ebp
c01074d8:	89 e5                	mov    %esp,%ebp
c01074da:	83 ec 08             	sub    $0x8,%esp
c01074dd:	6a 0e                	push   $0xe
c01074df:	6a 08                	push   $0x8
c01074e1:	68 03 01 10 c0       	push   $0xc0100103
c01074e6:	6a 00                	push   $0x0
c01074e8:	e8 62 c7 ff ff       	call   c0103c4f <InitInterruptDesc>
c01074ed:	83 c4 10             	add    $0x10,%esp
c01074f0:	6a 0e                	push   $0xe
c01074f2:	6a 08                	push   $0x8
c01074f4:	68 09 01 10 c0       	push   $0xc0100109
c01074f9:	6a 01                	push   $0x1
c01074fb:	e8 4f c7 ff ff       	call   c0103c4f <InitInterruptDesc>
c0107500:	83 c4 10             	add    $0x10,%esp
c0107503:	6a 0e                	push   $0xe
c0107505:	6a 08                	push   $0x8
c0107507:	68 0f 01 10 c0       	push   $0xc010010f
c010750c:	6a 02                	push   $0x2
c010750e:	e8 3c c7 ff ff       	call   c0103c4f <InitInterruptDesc>
c0107513:	83 c4 10             	add    $0x10,%esp
c0107516:	6a 0e                	push   $0xe
c0107518:	6a 08                	push   $0x8
c010751a:	68 15 01 10 c0       	push   $0xc0100115
c010751f:	6a 03                	push   $0x3
c0107521:	e8 29 c7 ff ff       	call   c0103c4f <InitInterruptDesc>
c0107526:	83 c4 10             	add    $0x10,%esp
c0107529:	6a 0e                	push   $0xe
c010752b:	6a 08                	push   $0x8
c010752d:	68 1b 01 10 c0       	push   $0xc010011b
c0107532:	6a 04                	push   $0x4
c0107534:	e8 16 c7 ff ff       	call   c0103c4f <InitInterruptDesc>
c0107539:	83 c4 10             	add    $0x10,%esp
c010753c:	6a 0e                	push   $0xe
c010753e:	6a 08                	push   $0x8
c0107540:	68 21 01 10 c0       	push   $0xc0100121
c0107545:	6a 05                	push   $0x5
c0107547:	e8 03 c7 ff ff       	call   c0103c4f <InitInterruptDesc>
c010754c:	83 c4 10             	add    $0x10,%esp
c010754f:	6a 0e                	push   $0xe
c0107551:	6a 08                	push   $0x8
c0107553:	68 27 01 10 c0       	push   $0xc0100127
c0107558:	6a 06                	push   $0x6
c010755a:	e8 f0 c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c010755f:	83 c4 10             	add    $0x10,%esp
c0107562:	6a 0e                	push   $0xe
c0107564:	6a 08                	push   $0x8
c0107566:	68 2d 01 10 c0       	push   $0xc010012d
c010756b:	6a 07                	push   $0x7
c010756d:	e8 dd c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c0107572:	83 c4 10             	add    $0x10,%esp
c0107575:	6a 0e                	push   $0xe
c0107577:	6a 08                	push   $0x8
c0107579:	68 33 01 10 c0       	push   $0xc0100133
c010757e:	6a 08                	push   $0x8
c0107580:	e8 ca c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c0107585:	83 c4 10             	add    $0x10,%esp
c0107588:	6a 0e                	push   $0xe
c010758a:	6a 08                	push   $0x8
c010758c:	68 37 01 10 c0       	push   $0xc0100137
c0107591:	6a 09                	push   $0x9
c0107593:	e8 b7 c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c0107598:	83 c4 10             	add    $0x10,%esp
c010759b:	6a 0e                	push   $0xe
c010759d:	6a 08                	push   $0x8
c010759f:	68 3d 01 10 c0       	push   $0xc010013d
c01075a4:	6a 0a                	push   $0xa
c01075a6:	e8 a4 c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c01075ab:	83 c4 10             	add    $0x10,%esp
c01075ae:	6a 0e                	push   $0xe
c01075b0:	6a 08                	push   $0x8
c01075b2:	68 41 01 10 c0       	push   $0xc0100141
c01075b7:	6a 0b                	push   $0xb
c01075b9:	e8 91 c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c01075be:	83 c4 10             	add    $0x10,%esp
c01075c1:	6a 0e                	push   $0xe
c01075c3:	6a 08                	push   $0x8
c01075c5:	68 45 01 10 c0       	push   $0xc0100145
c01075ca:	6a 0c                	push   $0xc
c01075cc:	e8 7e c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c01075d1:	83 c4 10             	add    $0x10,%esp
c01075d4:	6a 0e                	push   $0xe
c01075d6:	6a 08                	push   $0x8
c01075d8:	68 49 01 10 c0       	push   $0xc0100149
c01075dd:	6a 0d                	push   $0xd
c01075df:	e8 6b c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c01075e4:	83 c4 10             	add    $0x10,%esp
c01075e7:	6a 0e                	push   $0xe
c01075e9:	6a 08                	push   $0x8
c01075eb:	68 54 01 10 c0       	push   $0xc0100154
c01075f0:	6a 0e                	push   $0xe
c01075f2:	e8 58 c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c01075f7:	83 c4 10             	add    $0x10,%esp
c01075fa:	6a 0e                	push   $0xe
c01075fc:	6a 08                	push   $0x8
c01075fe:	68 58 01 10 c0       	push   $0xc0100158
c0107603:	6a 10                	push   $0x10
c0107605:	e8 45 c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c010760a:	83 c4 10             	add    $0x10,%esp
c010760d:	6a 0e                	push   $0xe
c010760f:	6a 08                	push   $0x8
c0107611:	68 5e 01 10 c0       	push   $0xc010015e
c0107616:	6a 11                	push   $0x11
c0107618:	e8 32 c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c010761d:	83 c4 10             	add    $0x10,%esp
c0107620:	6a 0e                	push   $0xe
c0107622:	6a 08                	push   $0x8
c0107624:	68 62 01 10 c0       	push   $0xc0100162
c0107629:	6a 12                	push   $0x12
c010762b:	e8 1f c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c0107630:	83 c4 10             	add    $0x10,%esp
c0107633:	6a 0e                	push   $0xe
c0107635:	6a 0e                	push   $0xe
c0107637:	68 67 02 10 c0       	push   $0xc0100267
c010763c:	68 90 00 00 00       	push   $0x90
c0107641:	e8 09 c6 ff ff       	call   c0103c4f <InitInterruptDesc>
c0107646:	83 c4 10             	add    $0x10,%esp
c0107649:	90                   	nop
c010764a:	c9                   	leave  
c010764b:	c3                   	ret    

c010764c <spurious_irq>:
c010764c:	55                   	push   %ebp
c010764d:	89 e5                	mov    %esp,%ebp
c010764f:	83 ec 08             	sub    $0x8,%esp
c0107652:	83 ec 08             	sub    $0x8,%esp
c0107655:	6a 0b                	push   $0xb
c0107657:	68 0c ba 10 c0       	push   $0xc010ba0c
c010765c:	e8 66 8a ff ff       	call   c01000c7 <disp_str_colour>
c0107661:	83 c4 10             	add    $0x10,%esp
c0107664:	83 ec 0c             	sub    $0xc,%esp
c0107667:	ff 75 08             	pushl  0x8(%ebp)
c010766a:	e8 1b fb ff ff       	call   c010718a <disp_int>
c010766f:	83 c4 10             	add    $0x10,%esp
c0107672:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107677:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010767d:	83 c0 01             	add    $0x1,%eax
c0107680:	83 d2 00             	adc    $0x0,%edx
c0107683:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107688:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010768e:	83 ec 0c             	sub    $0xc,%esp
c0107691:	68 20 b6 10 c0       	push   $0xc010b620
c0107696:	e8 f1 89 ff ff       	call   c010008c <disp_str>
c010769b:	83 c4 10             	add    $0x10,%esp
c010769e:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01076a3:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01076a9:	83 ec 0c             	sub    $0xc,%esp
c01076ac:	50                   	push   %eax
c01076ad:	e8 d8 fa ff ff       	call   c010718a <disp_int>
c01076b2:	83 c4 10             	add    $0x10,%esp
c01076b5:	83 ec 0c             	sub    $0xc,%esp
c01076b8:	68 22 b6 10 c0       	push   $0xc010b622
c01076bd:	e8 ca 89 ff ff       	call   c010008c <disp_str>
c01076c2:	83 c4 10             	add    $0x10,%esp
c01076c5:	83 ec 08             	sub    $0x8,%esp
c01076c8:	6a 0c                	push   $0xc
c01076ca:	68 34 ba 10 c0       	push   $0xc010ba34
c01076cf:	e8 f3 89 ff ff       	call   c01000c7 <disp_str_colour>
c01076d4:	83 c4 10             	add    $0x10,%esp
c01076d7:	90                   	nop
c01076d8:	c9                   	leave  
c01076d9:	c3                   	ret    

c01076da <init_keyboard>:
c01076da:	55                   	push   %ebp
c01076db:	89 e5                	mov    %esp,%ebp
c01076dd:	83 ec 08             	sub    $0x8,%esp
c01076e0:	83 ec 04             	sub    $0x4,%esp
c01076e3:	68 00 02 00 00       	push   $0x200
c01076e8:	6a 00                	push   $0x0
c01076ea:	68 ec fb 10 c0       	push   $0xc010fbec
c01076ef:	e8 fb 4a 00 00       	call   c010c1ef <Memset>
c01076f4:	83 c4 10             	add    $0x10,%esp
c01076f7:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01076fe:	fb 10 c0 
c0107701:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107706:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010770b:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c0107712:	00 00 00 
c0107715:	e8 4f d3 ff ff       	call   c0104a69 <init_keyboard_handler>
c010771a:	90                   	nop
c010771b:	c9                   	leave  
c010771c:	c3                   	ret    

c010771d <TestTTY>:
c010771d:	55                   	push   %ebp
c010771e:	89 e5                	mov    %esp,%ebp
c0107720:	83 ec 28             	sub    $0x28,%esp
c0107723:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c010772a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107731:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107737:	83 ec 08             	sub    $0x8,%esp
c010773a:	6a 02                	push   $0x2
c010773c:	8d 45 de             	lea    -0x22(%ebp),%eax
c010773f:	50                   	push   %eax
c0107740:	e8 ca d4 ff ff       	call   c0104c0f <open>
c0107745:	83 c4 10             	add    $0x10,%esp
c0107748:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010774b:	83 ec 08             	sub    $0x8,%esp
c010774e:	6a 02                	push   $0x2
c0107750:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107753:	50                   	push   %eax
c0107754:	e8 b6 d4 ff ff       	call   c0104c0f <open>
c0107759:	83 c4 10             	add    $0x10,%esp
c010775c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010775f:	83 ec 0c             	sub    $0xc,%esp
c0107762:	68 59 ba 10 c0       	push   $0xc010ba59
c0107767:	e8 ec 0e 00 00       	call   c0108658 <Printf>
c010776c:	83 c4 10             	add    $0x10,%esp
c010776f:	83 ec 0c             	sub    $0xc,%esp
c0107772:	6a 0a                	push   $0xa
c0107774:	e8 73 9f ff ff       	call   c01016ec <sys_malloc>
c0107779:	83 c4 10             	add    $0x10,%esp
c010777c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010777f:	83 ec 04             	sub    $0x4,%esp
c0107782:	6a 0a                	push   $0xa
c0107784:	6a 00                	push   $0x0
c0107786:	ff 75 ec             	pushl  -0x14(%ebp)
c0107789:	e8 61 4a 00 00       	call   c010c1ef <Memset>
c010778e:	83 c4 10             	add    $0x10,%esp
c0107791:	83 ec 04             	sub    $0x4,%esp
c0107794:	6a 0a                	push   $0xa
c0107796:	ff 75 ec             	pushl  -0x14(%ebp)
c0107799:	ff 75 f0             	pushl  -0x10(%ebp)
c010779c:	e8 03 d5 ff ff       	call   c0104ca4 <read>
c01077a1:	83 c4 10             	add    $0x10,%esp
c01077a4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01077a7:	83 ec 08             	sub    $0x8,%esp
c01077aa:	ff 75 ec             	pushl  -0x14(%ebp)
c01077ad:	68 6b ba 10 c0       	push   $0xc010ba6b
c01077b2:	e8 a1 0e 00 00       	call   c0108658 <Printf>
c01077b7:	83 c4 10             	add    $0x10,%esp
c01077ba:	eb c3                	jmp    c010777f <TestTTY+0x62>

c01077bc <TestReadReturnValue>:
c01077bc:	55                   	push   %ebp
c01077bd:	89 e5                	mov    %esp,%ebp
c01077bf:	81 ec 18 02 00 00    	sub    $0x218,%esp
c01077c5:	c7 45 f4 75 ba 10 c0 	movl   $0xc010ba75,-0xc(%ebp)
c01077cc:	83 ec 08             	sub    $0x8,%esp
c01077cf:	6a 00                	push   $0x0
c01077d1:	ff 75 f4             	pushl  -0xc(%ebp)
c01077d4:	e8 36 d4 ff ff       	call   c0104c0f <open>
c01077d9:	83 c4 10             	add    $0x10,%esp
c01077dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01077df:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01077e6:	83 ec 04             	sub    $0x4,%esp
c01077e9:	68 cb 00 00 00       	push   $0xcb
c01077ee:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01077f4:	50                   	push   %eax
c01077f5:	ff 75 f0             	pushl  -0x10(%ebp)
c01077f8:	e8 a7 d4 ff ff       	call   c0104ca4 <read>
c01077fd:	83 c4 10             	add    $0x10,%esp
c0107800:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107803:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c010780a:	74 1c                	je     c0107828 <TestReadReturnValue+0x6c>
c010780c:	68 08 02 00 00       	push   $0x208
c0107811:	68 81 ba 10 c0       	push   $0xc010ba81
c0107816:	68 81 ba 10 c0       	push   $0xc010ba81
c010781b:	68 91 ba 10 c0       	push   $0xc010ba91
c0107820:	e8 90 11 00 00       	call   c01089b5 <assertion_failure>
c0107825:	83 c4 10             	add    $0x10,%esp
c0107828:	83 ec 0c             	sub    $0xc,%esp
c010782b:	ff 75 f0             	pushl  -0x10(%ebp)
c010782e:	e8 77 d6 ff ff       	call   c0104eaa <close>
c0107833:	83 c4 10             	add    $0x10,%esp
c0107836:	90                   	nop
c0107837:	c9                   	leave  
c0107838:	c3                   	ret    

c0107839 <TestWriteReturnValue>:
c0107839:	55                   	push   %ebp
c010783a:	89 e5                	mov    %esp,%ebp
c010783c:	81 ec 28 02 00 00    	sub    $0x228,%esp
c0107842:	c7 45 f4 9c ba 10 c0 	movl   $0xc010ba9c,-0xc(%ebp)
c0107849:	83 ec 08             	sub    $0x8,%esp
c010784c:	6a 07                	push   $0x7
c010784e:	ff 75 f4             	pushl  -0xc(%ebp)
c0107851:	e8 b9 d3 ff ff       	call   c0104c0f <open>
c0107856:	83 c4 10             	add    $0x10,%esp
c0107859:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010785c:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c0107860:	75 1c                	jne    c010787e <TestWriteReturnValue+0x45>
c0107862:	68 12 02 00 00       	push   $0x212
c0107867:	68 81 ba 10 c0       	push   $0xc010ba81
c010786c:	68 81 ba 10 c0       	push   $0xc010ba81
c0107871:	68 a9 ba 10 c0       	push   $0xc010baa9
c0107876:	e8 3a 11 00 00       	call   c01089b5 <assertion_failure>
c010787b:	83 c4 10             	add    $0x10,%esp
c010787e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107885:	c7 45 e8 b4 ba 10 c0 	movl   $0xc010bab4,-0x18(%ebp)
c010788c:	83 ec 0c             	sub    $0xc,%esp
c010788f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107892:	e8 91 49 00 00       	call   c010c228 <Strlen>
c0107897:	83 c4 10             	add    $0x10,%esp
c010789a:	83 ec 04             	sub    $0x4,%esp
c010789d:	50                   	push   %eax
c010789e:	ff 75 e8             	pushl  -0x18(%ebp)
c01078a1:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01078a7:	50                   	push   %eax
c01078a8:	e8 ef f4 ff ff       	call   c0106d9c <Memcpy>
c01078ad:	83 c4 10             	add    $0x10,%esp
c01078b0:	83 ec 04             	sub    $0x4,%esp
c01078b3:	68 ff 01 00 00       	push   $0x1ff
c01078b8:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01078be:	50                   	push   %eax
c01078bf:	ff 75 f0             	pushl  -0x10(%ebp)
c01078c2:	e8 5e d5 ff ff       	call   c0104e25 <write>
c01078c7:	83 c4 10             	add    $0x10,%esp
c01078ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01078cd:	83 ec 0c             	sub    $0xc,%esp
c01078d0:	ff 75 e8             	pushl  -0x18(%ebp)
c01078d3:	e8 50 49 00 00       	call   c010c228 <Strlen>
c01078d8:	83 c4 10             	add    $0x10,%esp
c01078db:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01078de:	74 1c                	je     c01078fc <TestWriteReturnValue+0xc3>
c01078e0:	68 1c 02 00 00       	push   $0x21c
c01078e5:	68 81 ba 10 c0       	push   $0xc010ba81
c01078ea:	68 81 ba 10 c0       	push   $0xc010ba81
c01078ef:	68 e7 ba 10 c0       	push   $0xc010bae7
c01078f4:	e8 bc 10 00 00       	call   c01089b5 <assertion_failure>
c01078f9:	83 c4 10             	add    $0x10,%esp
c01078fc:	83 ec 0c             	sub    $0xc,%esp
c01078ff:	ff 75 f0             	pushl  -0x10(%ebp)
c0107902:	e8 a3 d5 ff ff       	call   c0104eaa <close>
c0107907:	83 c4 10             	add    $0x10,%esp
c010790a:	90                   	nop
c010790b:	c9                   	leave  
c010790c:	c3                   	ret    

c010790d <TestFS2>:
c010790d:	55                   	push   %ebp
c010790e:	89 e5                	mov    %esp,%ebp
c0107910:	83 ec 08             	sub    $0x8,%esp
c0107913:	e8 21 ff ff ff       	call   c0107839 <TestWriteReturnValue>
c0107918:	90                   	nop
c0107919:	c9                   	leave  
c010791a:	c3                   	ret    

c010791b <TestFS>:
c010791b:	55                   	push   %ebp
c010791c:	89 e5                	mov    %esp,%ebp
c010791e:	57                   	push   %edi
c010791f:	56                   	push   %esi
c0107920:	53                   	push   %ebx
c0107921:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c0107927:	83 ec 0c             	sub    $0xc,%esp
c010792a:	68 fa ba 10 c0       	push   $0xc010bafa
c010792f:	e8 58 87 ff ff       	call   c010008c <disp_str>
c0107934:	83 c4 10             	add    $0x10,%esp
c0107937:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c010793e:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107945:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c010794b:	83 ec 08             	sub    $0x8,%esp
c010794e:	6a 02                	push   $0x2
c0107950:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107953:	50                   	push   %eax
c0107954:	e8 b6 d2 ff ff       	call   c0104c0f <open>
c0107959:	83 c4 10             	add    $0x10,%esp
c010795c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010795f:	83 ec 08             	sub    $0x8,%esp
c0107962:	6a 02                	push   $0x2
c0107964:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107967:	50                   	push   %eax
c0107968:	e8 a2 d2 ff ff       	call   c0104c0f <open>
c010796d:	83 c4 10             	add    $0x10,%esp
c0107970:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107973:	83 ec 0c             	sub    $0xc,%esp
c0107976:	68 59 ba 10 c0       	push   $0xc010ba59
c010797b:	e8 d8 0c 00 00       	call   c0108658 <Printf>
c0107980:	83 c4 10             	add    $0x10,%esp
c0107983:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c010798a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c010798e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c0107995:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c0107999:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c01079a0:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c01079a7:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c01079ad:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c01079b4:	83 ec 0c             	sub    $0xc,%esp
c01079b7:	68 02 bb 10 c0       	push   $0xc010bb02
c01079bc:	e8 97 0c 00 00       	call   c0108658 <Printf>
c01079c1:	83 c4 10             	add    $0x10,%esp
c01079c4:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c01079c8:	0f 85 e6 03 00 00    	jne    c0107db4 <TestFS+0x499>
c01079ce:	83 ec 08             	sub    $0x8,%esp
c01079d1:	6a 07                	push   $0x7
c01079d3:	8d 45 a9             	lea    -0x57(%ebp),%eax
c01079d6:	50                   	push   %eax
c01079d7:	e8 33 d2 ff ff       	call   c0104c0f <open>
c01079dc:	83 c4 10             	add    $0x10,%esp
c01079df:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01079e2:	83 ec 08             	sub    $0x8,%esp
c01079e5:	ff 75 d0             	pushl  -0x30(%ebp)
c01079e8:	68 1a bb 10 c0       	push   $0xc010bb1a
c01079ed:	e8 66 0c 00 00       	call   c0108658 <Printf>
c01079f2:	83 c4 10             	add    $0x10,%esp
c01079f5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c01079fc:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107a03:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c0107a0a:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107a11:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107a18:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c0107a1f:	83 ec 0c             	sub    $0xc,%esp
c0107a22:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107a25:	50                   	push   %eax
c0107a26:	e8 fd 47 00 00       	call   c010c228 <Strlen>
c0107a2b:	83 c4 10             	add    $0x10,%esp
c0107a2e:	83 ec 04             	sub    $0x4,%esp
c0107a31:	50                   	push   %eax
c0107a32:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107a35:	50                   	push   %eax
c0107a36:	ff 75 d0             	pushl  -0x30(%ebp)
c0107a39:	e8 e7 d3 ff ff       	call   c0104e25 <write>
c0107a3e:	83 c4 10             	add    $0x10,%esp
c0107a41:	83 ec 0c             	sub    $0xc,%esp
c0107a44:	ff 75 d0             	pushl  -0x30(%ebp)
c0107a47:	e8 5e d4 ff ff       	call   c0104eaa <close>
c0107a4c:	83 c4 10             	add    $0x10,%esp
c0107a4f:	83 ec 08             	sub    $0x8,%esp
c0107a52:	6a 00                	push   $0x0
c0107a54:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107a57:	50                   	push   %eax
c0107a58:	e8 b2 d1 ff ff       	call   c0104c0f <open>
c0107a5d:	83 c4 10             	add    $0x10,%esp
c0107a60:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107a63:	83 ec 04             	sub    $0x4,%esp
c0107a66:	6a 14                	push   $0x14
c0107a68:	6a 00                	push   $0x0
c0107a6a:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a70:	50                   	push   %eax
c0107a71:	e8 79 47 00 00       	call   c010c1ef <Memset>
c0107a76:	83 c4 10             	add    $0x10,%esp
c0107a79:	83 ec 04             	sub    $0x4,%esp
c0107a7c:	6a 12                	push   $0x12
c0107a7e:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a84:	50                   	push   %eax
c0107a85:	ff 75 d0             	pushl  -0x30(%ebp)
c0107a88:	e8 17 d2 ff ff       	call   c0104ca4 <read>
c0107a8d:	83 c4 10             	add    $0x10,%esp
c0107a90:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107a93:	83 ec 08             	sub    $0x8,%esp
c0107a96:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a9c:	50                   	push   %eax
c0107a9d:	68 23 bb 10 c0       	push   $0xc010bb23
c0107aa2:	e8 b1 0b 00 00       	call   c0108658 <Printf>
c0107aa7:	83 c4 10             	add    $0x10,%esp
c0107aaa:	83 ec 0c             	sub    $0xc,%esp
c0107aad:	6a 0a                	push   $0xa
c0107aaf:	e8 70 0a 00 00       	call   c0108524 <delay>
c0107ab4:	83 c4 10             	add    $0x10,%esp
c0107ab7:	83 ec 08             	sub    $0x8,%esp
c0107aba:	6a 07                	push   $0x7
c0107abc:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107abf:	50                   	push   %eax
c0107ac0:	e8 4a d1 ff ff       	call   c0104c0f <open>
c0107ac5:	83 c4 10             	add    $0x10,%esp
c0107ac8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107acb:	83 ec 08             	sub    $0x8,%esp
c0107ace:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ad1:	68 2e bb 10 c0       	push   $0xc010bb2e
c0107ad6:	e8 7d 0b 00 00       	call   c0108658 <Printf>
c0107adb:	83 c4 10             	add    $0x10,%esp
c0107ade:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107ae5:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107aeb:	bb 64 bb 10 c0       	mov    $0xc010bb64,%ebx
c0107af0:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107af5:	8b 0b                	mov    (%ebx),%ecx
c0107af7:	89 08                	mov    %ecx,(%eax)
c0107af9:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107afd:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107b01:	8d 78 04             	lea    0x4(%eax),%edi
c0107b04:	83 e7 fc             	and    $0xfffffffc,%edi
c0107b07:	29 f8                	sub    %edi,%eax
c0107b09:	29 c3                	sub    %eax,%ebx
c0107b0b:	01 c2                	add    %eax,%edx
c0107b0d:	83 e2 fc             	and    $0xfffffffc,%edx
c0107b10:	89 d0                	mov    %edx,%eax
c0107b12:	c1 e8 02             	shr    $0x2,%eax
c0107b15:	89 de                	mov    %ebx,%esi
c0107b17:	89 c1                	mov    %eax,%ecx
c0107b19:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107b1b:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107b22:	00 00 00 
c0107b25:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107b2c:	00 00 00 
c0107b2f:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107b36:	83 ec 0c             	sub    $0xc,%esp
c0107b39:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107b3f:	50                   	push   %eax
c0107b40:	e8 e3 46 00 00       	call   c010c228 <Strlen>
c0107b45:	83 c4 10             	add    $0x10,%esp
c0107b48:	83 ec 04             	sub    $0x4,%esp
c0107b4b:	50                   	push   %eax
c0107b4c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107b52:	50                   	push   %eax
c0107b53:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b56:	e8 ca d2 ff ff       	call   c0104e25 <write>
c0107b5b:	83 c4 10             	add    $0x10,%esp
c0107b5e:	83 ec 0c             	sub    $0xc,%esp
c0107b61:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b64:	e8 41 d3 ff ff       	call   c0104eaa <close>
c0107b69:	83 c4 10             	add    $0x10,%esp
c0107b6c:	83 ec 08             	sub    $0x8,%esp
c0107b6f:	6a 00                	push   $0x0
c0107b71:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107b74:	50                   	push   %eax
c0107b75:	e8 95 d0 ff ff       	call   c0104c0f <open>
c0107b7a:	83 c4 10             	add    $0x10,%esp
c0107b7d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107b80:	83 ec 04             	sub    $0x4,%esp
c0107b83:	68 c8 00 00 00       	push   $0xc8
c0107b88:	6a 00                	push   $0x0
c0107b8a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b90:	50                   	push   %eax
c0107b91:	e8 59 46 00 00       	call   c010c1ef <Memset>
c0107b96:	83 c4 10             	add    $0x10,%esp
c0107b99:	83 ec 0c             	sub    $0xc,%esp
c0107b9c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107ba2:	50                   	push   %eax
c0107ba3:	e8 80 46 00 00       	call   c010c228 <Strlen>
c0107ba8:	83 c4 10             	add    $0x10,%esp
c0107bab:	83 ec 04             	sub    $0x4,%esp
c0107bae:	50                   	push   %eax
c0107baf:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107bb5:	50                   	push   %eax
c0107bb6:	ff 75 c8             	pushl  -0x38(%ebp)
c0107bb9:	e8 e6 d0 ff ff       	call   c0104ca4 <read>
c0107bbe:	83 c4 10             	add    $0x10,%esp
c0107bc1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107bc4:	83 ec 08             	sub    $0x8,%esp
c0107bc7:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107bcd:	50                   	push   %eax
c0107bce:	68 38 bb 10 c0       	push   $0xc010bb38
c0107bd3:	e8 80 0a 00 00       	call   c0108658 <Printf>
c0107bd8:	83 c4 10             	add    $0x10,%esp
c0107bdb:	83 ec 08             	sub    $0x8,%esp
c0107bde:	6a 07                	push   $0x7
c0107be0:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107be3:	50                   	push   %eax
c0107be4:	e8 26 d0 ff ff       	call   c0104c0f <open>
c0107be9:	83 c4 10             	add    $0x10,%esp
c0107bec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107bef:	83 ec 08             	sub    $0x8,%esp
c0107bf2:	ff 75 c8             	pushl  -0x38(%ebp)
c0107bf5:	68 2e bb 10 c0       	push   $0xc010bb2e
c0107bfa:	e8 59 0a 00 00       	call   c0108658 <Printf>
c0107bff:	83 c4 10             	add    $0x10,%esp
c0107c02:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107c09:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107c10:	20 77 69 
c0107c13:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107c1a:	6c 20 73 
c0107c1d:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107c24:	63 63 65 
c0107c27:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107c2e:	73 20 61 
c0107c31:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107c38:	20 6c 61 
c0107c3b:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107c42:	74 2e 00 
c0107c45:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107c4c:	00 00 00 
c0107c4f:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107c56:	00 00 
c0107c58:	83 ec 0c             	sub    $0xc,%esp
c0107c5b:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107c61:	50                   	push   %eax
c0107c62:	e8 c1 45 00 00       	call   c010c228 <Strlen>
c0107c67:	83 c4 10             	add    $0x10,%esp
c0107c6a:	83 ec 04             	sub    $0x4,%esp
c0107c6d:	50                   	push   %eax
c0107c6e:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107c74:	50                   	push   %eax
c0107c75:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c78:	e8 a8 d1 ff ff       	call   c0104e25 <write>
c0107c7d:	83 c4 10             	add    $0x10,%esp
c0107c80:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107c87:	eb 7e                	jmp    c0107d07 <TestFS+0x3ec>
c0107c89:	83 ec 0c             	sub    $0xc,%esp
c0107c8c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c8f:	e8 16 d2 ff ff       	call   c0104eaa <close>
c0107c94:	83 c4 10             	add    $0x10,%esp
c0107c97:	83 ec 08             	sub    $0x8,%esp
c0107c9a:	6a 00                	push   $0x0
c0107c9c:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107c9f:	50                   	push   %eax
c0107ca0:	e8 6a cf ff ff       	call   c0104c0f <open>
c0107ca5:	83 c4 10             	add    $0x10,%esp
c0107ca8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107cab:	83 ec 04             	sub    $0x4,%esp
c0107cae:	6a 1e                	push   $0x1e
c0107cb0:	6a 00                	push   $0x0
c0107cb2:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107cb8:	50                   	push   %eax
c0107cb9:	e8 31 45 00 00       	call   c010c1ef <Memset>
c0107cbe:	83 c4 10             	add    $0x10,%esp
c0107cc1:	83 ec 0c             	sub    $0xc,%esp
c0107cc4:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107cca:	50                   	push   %eax
c0107ccb:	e8 58 45 00 00       	call   c010c228 <Strlen>
c0107cd0:	83 c4 10             	add    $0x10,%esp
c0107cd3:	83 ec 04             	sub    $0x4,%esp
c0107cd6:	50                   	push   %eax
c0107cd7:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107cdd:	50                   	push   %eax
c0107cde:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107ce1:	e8 be cf ff ff       	call   c0104ca4 <read>
c0107ce6:	83 c4 10             	add    $0x10,%esp
c0107ce9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107cec:	83 ec 08             	sub    $0x8,%esp
c0107cef:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107cf5:	50                   	push   %eax
c0107cf6:	68 43 bb 10 c0       	push   $0xc010bb43
c0107cfb:	e8 58 09 00 00       	call   c0108658 <Printf>
c0107d00:	83 c4 10             	add    $0x10,%esp
c0107d03:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107d07:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107d0b:	0f 8e 78 ff ff ff    	jle    c0107c89 <TestFS+0x36e>
c0107d11:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107d18:	6e 73 74 
c0107d1b:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107d22:	6c 6c 2e 
c0107d25:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107d2c:	61 72 00 
c0107d2f:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107d36:	00 00 00 
c0107d39:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107d40:	00 00 00 
c0107d43:	83 ec 08             	sub    $0x8,%esp
c0107d46:	6a 00                	push   $0x0
c0107d48:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107d4e:	50                   	push   %eax
c0107d4f:	e8 bb ce ff ff       	call   c0104c0f <open>
c0107d54:	83 c4 10             	add    $0x10,%esp
c0107d57:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107d5a:	83 ec 08             	sub    $0x8,%esp
c0107d5d:	ff 75 bc             	pushl  -0x44(%ebp)
c0107d60:	68 4e bb 10 c0       	push   $0xc010bb4e
c0107d65:	e8 ee 08 00 00       	call   c0108658 <Printf>
c0107d6a:	83 c4 10             	add    $0x10,%esp
c0107d6d:	83 ec 04             	sub    $0x4,%esp
c0107d70:	6a 28                	push   $0x28
c0107d72:	6a 00                	push   $0x0
c0107d74:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d7a:	50                   	push   %eax
c0107d7b:	e8 6f 44 00 00       	call   c010c1ef <Memset>
c0107d80:	83 c4 10             	add    $0x10,%esp
c0107d83:	83 ec 04             	sub    $0x4,%esp
c0107d86:	6a 28                	push   $0x28
c0107d88:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d8e:	50                   	push   %eax
c0107d8f:	ff 75 bc             	pushl  -0x44(%ebp)
c0107d92:	e8 0d cf ff ff       	call   c0104ca4 <read>
c0107d97:	83 c4 10             	add    $0x10,%esp
c0107d9a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107d9d:	83 ec 08             	sub    $0x8,%esp
c0107da0:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107da6:	50                   	push   %eax
c0107da7:	68 58 bb 10 c0       	push   $0xc010bb58
c0107dac:	e8 a7 08 00 00       	call   c0108658 <Printf>
c0107db1:	83 c4 10             	add    $0x10,%esp
c0107db4:	90                   	nop
c0107db5:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107db8:	5b                   	pop    %ebx
c0107db9:	5e                   	pop    %esi
c0107dba:	5f                   	pop    %edi
c0107dbb:	5d                   	pop    %ebp
c0107dbc:	c3                   	ret    

c0107dbd <wait_exit>:
c0107dbd:	55                   	push   %ebp
c0107dbe:	89 e5                	mov    %esp,%ebp
c0107dc0:	83 ec 28             	sub    $0x28,%esp
c0107dc3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107dca:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107dd1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107dd7:	83 ec 08             	sub    $0x8,%esp
c0107dda:	6a 02                	push   $0x2
c0107ddc:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107ddf:	50                   	push   %eax
c0107de0:	e8 2a ce ff ff       	call   c0104c0f <open>
c0107de5:	83 c4 10             	add    $0x10,%esp
c0107de8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107deb:	83 ec 08             	sub    $0x8,%esp
c0107dee:	6a 02                	push   $0x2
c0107df0:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107df3:	50                   	push   %eax
c0107df4:	e8 16 ce ff ff       	call   c0104c0f <open>
c0107df9:	83 c4 10             	add    $0x10,%esp
c0107dfc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107dff:	e8 6b d1 ff ff       	call   c0104f6f <fork>
c0107e04:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107e07:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107e0b:	7e 35                	jle    c0107e42 <wait_exit+0x85>
c0107e0d:	83 ec 0c             	sub    $0xc,%esp
c0107e10:	68 2c bc 10 c0       	push   $0xc010bc2c
c0107e15:	e8 3e 08 00 00       	call   c0108658 <Printf>
c0107e1a:	83 c4 10             	add    $0x10,%esp
c0107e1d:	83 ec 0c             	sub    $0xc,%esp
c0107e20:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107e23:	50                   	push   %eax
c0107e24:	e8 d3 d0 ff ff       	call   c0104efc <wait>
c0107e29:	83 c4 10             	add    $0x10,%esp
c0107e2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107e2f:	83 ec 08             	sub    $0x8,%esp
c0107e32:	50                   	push   %eax
c0107e33:	68 44 bc 10 c0       	push   $0xc010bc44
c0107e38:	e8 1b 08 00 00       	call   c0108658 <Printf>
c0107e3d:	83 c4 10             	add    $0x10,%esp
c0107e40:	eb fe                	jmp    c0107e40 <wait_exit+0x83>
c0107e42:	83 ec 0c             	sub    $0xc,%esp
c0107e45:	68 5f bc 10 c0       	push   $0xc010bc5f
c0107e4a:	e8 09 08 00 00       	call   c0108658 <Printf>
c0107e4f:	83 c4 10             	add    $0x10,%esp
c0107e52:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107e59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107e5c:	8d 50 01             	lea    0x1(%eax),%edx
c0107e5f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107e62:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107e67:	7f 02                	jg     c0107e6b <wait_exit+0xae>
c0107e69:	eb ee                	jmp    c0107e59 <wait_exit+0x9c>
c0107e6b:	90                   	nop
c0107e6c:	83 ec 0c             	sub    $0xc,%esp
c0107e6f:	68 6b bc 10 c0       	push   $0xc010bc6b
c0107e74:	e8 df 07 00 00       	call   c0108658 <Printf>
c0107e79:	83 c4 10             	add    $0x10,%esp
c0107e7c:	83 ec 0c             	sub    $0xc,%esp
c0107e7f:	68 79 bc 10 c0       	push   $0xc010bc79
c0107e84:	e8 cf 07 00 00       	call   c0108658 <Printf>
c0107e89:	83 c4 10             	add    $0x10,%esp
c0107e8c:	83 ec 0c             	sub    $0xc,%esp
c0107e8f:	68 88 bc 10 c0       	push   $0xc010bc88
c0107e94:	e8 bf 07 00 00       	call   c0108658 <Printf>
c0107e99:	83 c4 10             	add    $0x10,%esp
c0107e9c:	83 ec 0c             	sub    $0xc,%esp
c0107e9f:	6a 5a                	push   $0x5a
c0107ea1:	e8 9a d0 ff ff       	call   c0104f40 <exit>
c0107ea6:	83 c4 10             	add    $0x10,%esp
c0107ea9:	83 ec 0c             	sub    $0xc,%esp
c0107eac:	68 97 bc 10 c0       	push   $0xc010bc97
c0107eb1:	e8 a2 07 00 00       	call   c0108658 <Printf>
c0107eb6:	83 c4 10             	add    $0x10,%esp
c0107eb9:	eb fe                	jmp    c0107eb9 <wait_exit+0xfc>

c0107ebb <INIT_fork>:
c0107ebb:	55                   	push   %ebp
c0107ebc:	89 e5                	mov    %esp,%ebp
c0107ebe:	83 ec 78             	sub    $0x78,%esp
c0107ec1:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107ec8:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107ecf:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107ed5:	83 ec 08             	sub    $0x8,%esp
c0107ed8:	6a 02                	push   $0x2
c0107eda:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107edd:	50                   	push   %eax
c0107ede:	e8 2c cd ff ff       	call   c0104c0f <open>
c0107ee3:	83 c4 10             	add    $0x10,%esp
c0107ee6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107ee9:	83 ec 08             	sub    $0x8,%esp
c0107eec:	6a 02                	push   $0x2
c0107eee:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107ef1:	50                   	push   %eax
c0107ef2:	e8 18 cd ff ff       	call   c0104c0f <open>
c0107ef7:	83 c4 10             	add    $0x10,%esp
c0107efa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107efd:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107f04:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107f0b:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107f12:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107f19:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107f20:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107f27:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107f2e:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107f35:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107f3c:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107f43:	83 ec 0c             	sub    $0xc,%esp
c0107f46:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f49:	50                   	push   %eax
c0107f4a:	e8 09 07 00 00       	call   c0108658 <Printf>
c0107f4f:	83 c4 10             	add    $0x10,%esp
c0107f52:	83 ec 0c             	sub    $0xc,%esp
c0107f55:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f58:	50                   	push   %eax
c0107f59:	e8 ca 42 00 00       	call   c010c228 <Strlen>
c0107f5e:	83 c4 10             	add    $0x10,%esp
c0107f61:	83 ec 04             	sub    $0x4,%esp
c0107f64:	50                   	push   %eax
c0107f65:	6a 00                	push   $0x0
c0107f67:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f6a:	50                   	push   %eax
c0107f6b:	e8 7f 42 00 00       	call   c010c1ef <Memset>
c0107f70:	83 c4 10             	add    $0x10,%esp
c0107f73:	83 ec 04             	sub    $0x4,%esp
c0107f76:	6a 28                	push   $0x28
c0107f78:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f7b:	50                   	push   %eax
c0107f7c:	ff 75 f0             	pushl  -0x10(%ebp)
c0107f7f:	e8 20 cd ff ff       	call   c0104ca4 <read>
c0107f84:	83 c4 10             	add    $0x10,%esp
c0107f87:	83 ec 0c             	sub    $0xc,%esp
c0107f8a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f8d:	50                   	push   %eax
c0107f8e:	e8 c5 06 00 00       	call   c0108658 <Printf>
c0107f93:	83 c4 10             	add    $0x10,%esp
c0107f96:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107f9d:	e8 cd cf ff ff       	call   c0104f6f <fork>
c0107fa2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107fa5:	83 ec 0c             	sub    $0xc,%esp
c0107fa8:	6a 01                	push   $0x1
c0107faa:	e8 75 05 00 00       	call   c0108524 <delay>
c0107faf:	83 c4 10             	add    $0x10,%esp
c0107fb2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107fb6:	0f 8e cd 00 00 00    	jle    c0108089 <INIT_fork+0x1ce>
c0107fbc:	83 ec 08             	sub    $0x8,%esp
c0107fbf:	ff 75 e8             	pushl  -0x18(%ebp)
c0107fc2:	68 a5 bc 10 c0       	push   $0xc010bca5
c0107fc7:	e8 8c 06 00 00       	call   c0108658 <Printf>
c0107fcc:	83 c4 10             	add    $0x10,%esp
c0107fcf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107fd3:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107fda:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107fe1:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107fe8:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107fef:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107ff6:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107ffd:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0108004:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c010800b:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108012:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108019:	83 ec 0c             	sub    $0xc,%esp
c010801c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010801f:	50                   	push   %eax
c0108020:	e8 03 42 00 00       	call   c010c228 <Strlen>
c0108025:	83 c4 10             	add    $0x10,%esp
c0108028:	83 ec 04             	sub    $0x4,%esp
c010802b:	50                   	push   %eax
c010802c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010802f:	50                   	push   %eax
c0108030:	ff 75 f4             	pushl  -0xc(%ebp)
c0108033:	e8 ed cd ff ff       	call   c0104e25 <write>
c0108038:	83 c4 10             	add    $0x10,%esp
c010803b:	e8 b2 ec ff ff       	call   c0106cf2 <catch_error>
c0108040:	83 ec 0c             	sub    $0xc,%esp
c0108043:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108046:	50                   	push   %eax
c0108047:	e8 dc 41 00 00       	call   c010c228 <Strlen>
c010804c:	83 c4 10             	add    $0x10,%esp
c010804f:	83 ec 04             	sub    $0x4,%esp
c0108052:	50                   	push   %eax
c0108053:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108056:	50                   	push   %eax
c0108057:	ff 75 f4             	pushl  -0xc(%ebp)
c010805a:	e8 c6 cd ff ff       	call   c0104e25 <write>
c010805f:	83 c4 10             	add    $0x10,%esp
c0108062:	83 ec 0c             	sub    $0xc,%esp
c0108065:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108068:	50                   	push   %eax
c0108069:	e8 ba 41 00 00       	call   c010c228 <Strlen>
c010806e:	83 c4 10             	add    $0x10,%esp
c0108071:	83 ec 04             	sub    $0x4,%esp
c0108074:	50                   	push   %eax
c0108075:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108078:	50                   	push   %eax
c0108079:	ff 75 f4             	pushl  -0xc(%ebp)
c010807c:	e8 a4 cd ff ff       	call   c0104e25 <write>
c0108081:	83 c4 10             	add    $0x10,%esp
c0108084:	e9 d6 00 00 00       	jmp    c010815f <INIT_fork+0x2a4>
c0108089:	83 ec 08             	sub    $0x8,%esp
c010808c:	ff 75 e8             	pushl  -0x18(%ebp)
c010808f:	68 a5 bc 10 c0       	push   $0xc010bca5
c0108094:	e8 bf 05 00 00       	call   c0108658 <Printf>
c0108099:	83 c4 10             	add    $0x10,%esp
c010809c:	83 ec 0c             	sub    $0xc,%esp
c010809f:	6a 01                	push   $0x1
c01080a1:	e8 7e 04 00 00       	call   c0108524 <delay>
c01080a6:	83 c4 10             	add    $0x10,%esp
c01080a9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01080ad:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c01080b1:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c01080b8:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c01080bf:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c01080c6:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c01080cd:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c01080d4:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c01080db:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c01080e2:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c01080e9:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c01080f0:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c01080f7:	83 ec 0c             	sub    $0xc,%esp
c01080fa:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080fd:	50                   	push   %eax
c01080fe:	e8 25 41 00 00       	call   c010c228 <Strlen>
c0108103:	83 c4 10             	add    $0x10,%esp
c0108106:	83 ec 04             	sub    $0x4,%esp
c0108109:	50                   	push   %eax
c010810a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010810d:	50                   	push   %eax
c010810e:	ff 75 f4             	pushl  -0xc(%ebp)
c0108111:	e8 0f cd ff ff       	call   c0104e25 <write>
c0108116:	83 c4 10             	add    $0x10,%esp
c0108119:	83 ec 0c             	sub    $0xc,%esp
c010811c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010811f:	50                   	push   %eax
c0108120:	e8 03 41 00 00       	call   c010c228 <Strlen>
c0108125:	83 c4 10             	add    $0x10,%esp
c0108128:	83 ec 04             	sub    $0x4,%esp
c010812b:	50                   	push   %eax
c010812c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010812f:	50                   	push   %eax
c0108130:	ff 75 f4             	pushl  -0xc(%ebp)
c0108133:	e8 ed cc ff ff       	call   c0104e25 <write>
c0108138:	83 c4 10             	add    $0x10,%esp
c010813b:	83 ec 0c             	sub    $0xc,%esp
c010813e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108141:	50                   	push   %eax
c0108142:	e8 e1 40 00 00       	call   c010c228 <Strlen>
c0108147:	83 c4 10             	add    $0x10,%esp
c010814a:	83 ec 04             	sub    $0x4,%esp
c010814d:	50                   	push   %eax
c010814e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108151:	50                   	push   %eax
c0108152:	ff 75 f4             	pushl  -0xc(%ebp)
c0108155:	e8 cb cc ff ff       	call   c0104e25 <write>
c010815a:	83 c4 10             	add    $0x10,%esp
c010815d:	eb fe                	jmp    c010815d <INIT_fork+0x2a2>
c010815f:	83 ec 04             	sub    $0x4,%esp
c0108162:	6a 28                	push   $0x28
c0108164:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108167:	50                   	push   %eax
c0108168:	ff 75 f0             	pushl  -0x10(%ebp)
c010816b:	e8 34 cb ff ff       	call   c0104ca4 <read>
c0108170:	83 c4 10             	add    $0x10,%esp
c0108173:	83 ec 0c             	sub    $0xc,%esp
c0108176:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108179:	50                   	push   %eax
c010817a:	e8 d9 04 00 00       	call   c0108658 <Printf>
c010817f:	83 c4 10             	add    $0x10,%esp
c0108182:	83 ec 0c             	sub    $0xc,%esp
c0108185:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108188:	50                   	push   %eax
c0108189:	e8 ca 04 00 00       	call   c0108658 <Printf>
c010818e:	83 c4 10             	add    $0x10,%esp
c0108191:	83 ec 0c             	sub    $0xc,%esp
c0108194:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108197:	50                   	push   %eax
c0108198:	e8 bb 04 00 00       	call   c0108658 <Printf>
c010819d:	83 c4 10             	add    $0x10,%esp
c01081a0:	83 ec 0c             	sub    $0xc,%esp
c01081a3:	68 af bc 10 c0       	push   $0xc010bcaf
c01081a8:	e8 c4 07 00 00       	call   c0108971 <spin>
c01081ad:	83 c4 10             	add    $0x10,%esp
c01081b0:	90                   	nop
c01081b1:	c9                   	leave  
c01081b2:	c3                   	ret    

c01081b3 <simple_shell>:
c01081b3:	55                   	push   %ebp
c01081b4:	89 e5                	mov    %esp,%ebp
c01081b6:	57                   	push   %edi
c01081b7:	83 ec 64             	sub    $0x64,%esp
c01081ba:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c01081c1:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c01081c8:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c01081ce:	83 ec 08             	sub    $0x8,%esp
c01081d1:	6a 02                	push   $0x2
c01081d3:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01081d6:	50                   	push   %eax
c01081d7:	e8 33 ca ff ff       	call   c0104c0f <open>
c01081dc:	83 c4 10             	add    $0x10,%esp
c01081df:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01081e2:	83 ec 08             	sub    $0x8,%esp
c01081e5:	6a 02                	push   $0x2
c01081e7:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01081ea:	50                   	push   %eax
c01081eb:	e8 1f ca ff ff       	call   c0104c0f <open>
c01081f0:	83 c4 10             	add    $0x10,%esp
c01081f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01081f6:	8d 55 a8             	lea    -0x58(%ebp),%edx
c01081f9:	b8 00 00 00 00       	mov    $0x0,%eax
c01081fe:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0108203:	89 d7                	mov    %edx,%edi
c0108205:	f3 ab                	rep stos %eax,%es:(%edi)
c0108207:	c7 45 a8 b7 bc 10 c0 	movl   $0xc010bcb7,-0x58(%ebp)
c010820e:	c7 45 ac bc bc 10 c0 	movl   $0xc010bcbc,-0x54(%ebp)
c0108215:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010821c:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0108223:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c010822a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010822d:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c0108234:	00 
c0108235:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0108238:	85 c0                	test   %eax,%eax
c010823a:	75 1c                	jne    c0108258 <simple_shell+0xa5>
c010823c:	68 0e 03 00 00       	push   $0x30e
c0108241:	68 81 ba 10 c0       	push   $0xc010ba81
c0108246:	68 81 ba 10 c0       	push   $0xc010ba81
c010824b:	68 c2 bc 10 c0       	push   $0xc010bcc2
c0108250:	e8 60 07 00 00       	call   c01089b5 <assertion_failure>
c0108255:	83 c4 10             	add    $0x10,%esp
c0108258:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010825b:	83 ec 08             	sub    $0x8,%esp
c010825e:	6a 02                	push   $0x2
c0108260:	50                   	push   %eax
c0108261:	e8 a9 c9 ff ff       	call   c0104c0f <open>
c0108266:	83 c4 10             	add    $0x10,%esp
c0108269:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010826c:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0108270:	75 4b                	jne    c01082bd <simple_shell+0x10a>
c0108272:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108279:	eb 26                	jmp    c01082a1 <simple_shell+0xee>
c010827b:	8b 55 a8             	mov    -0x58(%ebp),%edx
c010827e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108281:	01 d0                	add    %edx,%eax
c0108283:	0f b6 00             	movzbl (%eax),%eax
c0108286:	0f be c0             	movsbl %al,%eax
c0108289:	83 ec 04             	sub    $0x4,%esp
c010828c:	50                   	push   %eax
c010828d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108290:	68 d1 bc 10 c0       	push   $0xc010bcd1
c0108295:	e8 be 03 00 00       	call   c0108658 <Printf>
c010829a:	83 c4 10             	add    $0x10,%esp
c010829d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01082a1:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c01082a5:	7e d4                	jle    c010827b <simple_shell+0xc8>
c01082a7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01082aa:	83 ec 08             	sub    $0x8,%esp
c01082ad:	50                   	push   %eax
c01082ae:	68 d8 bc 10 c0       	push   $0xc010bcd8
c01082b3:	e8 a0 03 00 00       	call   c0108658 <Printf>
c01082b8:	83 c4 10             	add    $0x10,%esp
c01082bb:	eb 78                	jmp    c0108335 <simple_shell+0x182>
c01082bd:	83 ec 0c             	sub    $0xc,%esp
c01082c0:	68 de bc 10 c0       	push   $0xc010bcde
c01082c5:	e8 8e 03 00 00       	call   c0108658 <Printf>
c01082ca:	83 c4 10             	add    $0x10,%esp
c01082cd:	e8 9d cc ff ff       	call   c0104f6f <fork>
c01082d2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01082d5:	83 ec 0c             	sub    $0xc,%esp
c01082d8:	68 f3 bc 10 c0       	push   $0xc010bcf3
c01082dd:	e8 76 03 00 00       	call   c0108658 <Printf>
c01082e2:	83 c4 10             	add    $0x10,%esp
c01082e5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01082e9:	7e 11                	jle    c01082fc <simple_shell+0x149>
c01082eb:	83 ec 0c             	sub    $0xc,%esp
c01082ee:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c01082f1:	50                   	push   %eax
c01082f2:	e8 05 cc ff ff       	call   c0104efc <wait>
c01082f7:	83 c4 10             	add    $0x10,%esp
c01082fa:	eb 39                	jmp    c0108335 <simple_shell+0x182>
c01082fc:	83 ec 0c             	sub    $0xc,%esp
c01082ff:	68 08 bd 10 c0       	push   $0xc010bd08
c0108304:	e8 4f 03 00 00       	call   c0108658 <Printf>
c0108309:	83 c4 10             	add    $0x10,%esp
c010830c:	83 ec 0c             	sub    $0xc,%esp
c010830f:	ff 75 e0             	pushl  -0x20(%ebp)
c0108312:	e8 93 cb ff ff       	call   c0104eaa <close>
c0108317:	83 c4 10             	add    $0x10,%esp
c010831a:	6a 00                	push   $0x0
c010831c:	68 bc bc 10 c0       	push   $0xc010bcbc
c0108321:	68 b7 bc 10 c0       	push   $0xc010bcb7
c0108326:	68 24 bd 10 c0       	push   $0xc010bd24
c010832b:	e8 12 cf ff ff       	call   c0105242 <execl>
c0108330:	83 c4 10             	add    $0x10,%esp
c0108333:	eb fe                	jmp    c0108333 <simple_shell+0x180>
c0108335:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0108338:	c9                   	leave  
c0108339:	c3                   	ret    

c010833a <test_shell>:
c010833a:	55                   	push   %ebp
c010833b:	89 e5                	mov    %esp,%ebp
c010833d:	83 ec 38             	sub    $0x38,%esp
c0108340:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0108347:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c010834e:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0108354:	83 ec 08             	sub    $0x8,%esp
c0108357:	6a 02                	push   $0x2
c0108359:	8d 45 ea             	lea    -0x16(%ebp),%eax
c010835c:	50                   	push   %eax
c010835d:	e8 ad c8 ff ff       	call   c0104c0f <open>
c0108362:	83 c4 10             	add    $0x10,%esp
c0108365:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108368:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c010836f:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0108376:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c010837d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108384:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010838b:	83 ec 0c             	sub    $0xc,%esp
c010838e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108391:	50                   	push   %eax
c0108392:	e8 38 ea ff ff       	call   c0106dcf <untar>
c0108397:	83 c4 10             	add    $0x10,%esp
c010839a:	e8 14 fe ff ff       	call   c01081b3 <simple_shell>
c010839f:	90                   	nop
c01083a0:	c9                   	leave  
c01083a1:	c3                   	ret    

c01083a2 <test_exec>:
c01083a2:	55                   	push   %ebp
c01083a3:	89 e5                	mov    %esp,%ebp
c01083a5:	83 ec 38             	sub    $0x38,%esp
c01083a8:	83 ec 0c             	sub    $0xc,%esp
c01083ab:	68 2a bd 10 c0       	push   $0xc010bd2a
c01083b0:	e8 d7 7c ff ff       	call   c010008c <disp_str>
c01083b5:	83 c4 10             	add    $0x10,%esp
c01083b8:	83 ec 0c             	sub    $0xc,%esp
c01083bb:	68 3c bd 10 c0       	push   $0xc010bd3c
c01083c0:	e8 c7 7c ff ff       	call   c010008c <disp_str>
c01083c5:	83 c4 10             	add    $0x10,%esp
c01083c8:	83 ec 0c             	sub    $0xc,%esp
c01083cb:	6a 07                	push   $0x7
c01083cd:	e8 b8 ed ff ff       	call   c010718a <disp_int>
c01083d2:	83 c4 10             	add    $0x10,%esp
c01083d5:	83 ec 0c             	sub    $0xc,%esp
c01083d8:	68 20 b6 10 c0       	push   $0xc010b620
c01083dd:	e8 aa 7c ff ff       	call   c010008c <disp_str>
c01083e2:	83 c4 10             	add    $0x10,%esp
c01083e5:	83 ec 0c             	sub    $0xc,%esp
c01083e8:	68 22 b6 10 c0       	push   $0xc010b622
c01083ed:	e8 9a 7c ff ff       	call   c010008c <disp_str>
c01083f2:	83 c4 10             	add    $0x10,%esp
c01083f5:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c01083fc:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108403:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0108409:	83 ec 08             	sub    $0x8,%esp
c010840c:	6a 02                	push   $0x2
c010840e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108411:	50                   	push   %eax
c0108412:	e8 f8 c7 ff ff       	call   c0104c0f <open>
c0108417:	83 c4 10             	add    $0x10,%esp
c010841a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010841d:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0108424:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c010842b:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0108432:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0108439:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108440:	83 ec 0c             	sub    $0xc,%esp
c0108443:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108446:	50                   	push   %eax
c0108447:	e8 83 e9 ff ff       	call   c0106dcf <untar>
c010844c:	83 c4 10             	add    $0x10,%esp
c010844f:	83 ec 08             	sub    $0x8,%esp
c0108452:	6a 00                	push   $0x0
c0108454:	68 4f bd 10 c0       	push   $0xc010bd4f
c0108459:	68 53 bd 10 c0       	push   $0xc010bd53
c010845e:	68 bc bc 10 c0       	push   $0xc010bcbc
c0108463:	68 b7 bc 10 c0       	push   $0xc010bcb7
c0108468:	68 24 bd 10 c0       	push   $0xc010bd24
c010846d:	e8 d0 cd ff ff       	call   c0105242 <execl>
c0108472:	83 c4 20             	add    $0x20,%esp
c0108475:	e8 34 e8 ff ff       	call   c0106cae <stop_here>
c010847a:	e8 f0 ca ff ff       	call   c0104f6f <fork>
c010847f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108482:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108486:	7e 25                	jle    c01084ad <test_exec+0x10b>
c0108488:	83 ec 0c             	sub    $0xc,%esp
c010848b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c010848e:	50                   	push   %eax
c010848f:	e8 68 ca ff ff       	call   c0104efc <wait>
c0108494:	83 c4 10             	add    $0x10,%esp
c0108497:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010849a:	83 ec 08             	sub    $0x8,%esp
c010849d:	50                   	push   %eax
c010849e:	68 59 bd 10 c0       	push   $0xc010bd59
c01084a3:	e8 b0 01 00 00       	call   c0108658 <Printf>
c01084a8:	83 c4 10             	add    $0x10,%esp
c01084ab:	eb 33                	jmp    c01084e0 <test_exec+0x13e>
c01084ad:	83 ec 0c             	sub    $0xc,%esp
c01084b0:	68 6b bd 10 c0       	push   $0xc010bd6b
c01084b5:	e8 9e 01 00 00       	call   c0108658 <Printf>
c01084ba:	83 c4 10             	add    $0x10,%esp
c01084bd:	83 ec 0c             	sub    $0xc,%esp
c01084c0:	6a 00                	push   $0x0
c01084c2:	68 53 bd 10 c0       	push   $0xc010bd53
c01084c7:	68 bc bc 10 c0       	push   $0xc010bcbc
c01084cc:	68 b7 bc 10 c0       	push   $0xc010bcb7
c01084d1:	68 24 bd 10 c0       	push   $0xc010bd24
c01084d6:	e8 67 cd ff ff       	call   c0105242 <execl>
c01084db:	83 c4 20             	add    $0x20,%esp
c01084de:	eb fe                	jmp    c01084de <test_exec+0x13c>
c01084e0:	c9                   	leave  
c01084e1:	c3                   	ret    

c01084e2 <INIT>:
c01084e2:	55                   	push   %ebp
c01084e3:	89 e5                	mov    %esp,%ebp
c01084e5:	83 ec 08             	sub    $0x8,%esp
c01084e8:	e8 4d fe ff ff       	call   c010833a <test_shell>
c01084ed:	eb fe                	jmp    c01084ed <INIT+0xb>

c01084ef <TestA>:
c01084ef:	55                   	push   %ebp
c01084f0:	89 e5                	mov    %esp,%ebp
c01084f2:	83 ec 08             	sub    $0x8,%esp
c01084f5:	83 ec 0c             	sub    $0xc,%esp
c01084f8:	6a 05                	push   $0x5
c01084fa:	e8 8b ec ff ff       	call   c010718a <disp_int>
c01084ff:	83 c4 10             	add    $0x10,%esp
c0108502:	83 ec 0c             	sub    $0xc,%esp
c0108505:	68 33 b7 10 c0       	push   $0xc010b733
c010850a:	e8 7d 7b ff ff       	call   c010008c <disp_str>
c010850f:	83 c4 10             	add    $0x10,%esp
c0108512:	83 ec 0c             	sub    $0xc,%esp
c0108515:	68 79 bd 10 c0       	push   $0xc010bd79
c010851a:	e8 6d 7b ff ff       	call   c010008c <disp_str>
c010851f:	83 c4 10             	add    $0x10,%esp
c0108522:	eb fe                	jmp    c0108522 <TestA+0x33>

c0108524 <delay>:
c0108524:	55                   	push   %ebp
c0108525:	89 e5                	mov    %esp,%ebp
c0108527:	83 ec 10             	sub    $0x10,%esp
c010852a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108531:	eb 2a                	jmp    c010855d <delay+0x39>
c0108533:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c010853a:	eb 17                	jmp    c0108553 <delay+0x2f>
c010853c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108543:	eb 04                	jmp    c0108549 <delay+0x25>
c0108545:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108549:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c010854d:	7e f6                	jle    c0108545 <delay+0x21>
c010854f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0108553:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0108557:	7e e3                	jle    c010853c <delay+0x18>
c0108559:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010855d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108560:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108563:	7c ce                	jl     c0108533 <delay+0xf>
c0108565:	90                   	nop
c0108566:	c9                   	leave  
c0108567:	c3                   	ret    

c0108568 <TestB>:
c0108568:	55                   	push   %ebp
c0108569:	89 e5                	mov    %esp,%ebp
c010856b:	83 ec 08             	sub    $0x8,%esp
c010856e:	83 ec 0c             	sub    $0xc,%esp
c0108571:	68 80 bd 10 c0       	push   $0xc010bd80
c0108576:	e8 11 7b ff ff       	call   c010008c <disp_str>
c010857b:	83 c4 10             	add    $0x10,%esp
c010857e:	eb fe                	jmp    c010857e <TestB+0x16>

c0108580 <TestC>:
c0108580:	55                   	push   %ebp
c0108581:	89 e5                	mov    %esp,%ebp
c0108583:	83 ec 18             	sub    $0x18,%esp
c0108586:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010858d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108591:	77 1a                	ja     c01085ad <TestC+0x2d>
c0108593:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010859a:	83 ec 08             	sub    $0x8,%esp
c010859d:	ff 75 f0             	pushl  -0x10(%ebp)
c01085a0:	68 83 bd 10 c0       	push   $0xc010bd83
c01085a5:	e8 ae 00 00 00       	call   c0108658 <Printf>
c01085aa:	83 c4 10             	add    $0x10,%esp
c01085ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01085b1:	eb da                	jmp    c010858d <TestC+0xd>

c01085b3 <sys_get_ticks>:
c01085b3:	55                   	push   %ebp
c01085b4:	89 e5                	mov    %esp,%ebp
c01085b6:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01085bb:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01085c1:	5d                   	pop    %ebp
c01085c2:	c3                   	ret    

c01085c3 <sys_write>:
c01085c3:	55                   	push   %ebp
c01085c4:	89 e5                	mov    %esp,%ebp
c01085c6:	83 ec 18             	sub    $0x18,%esp
c01085c9:	8b 45 10             	mov    0x10(%ebp),%eax
c01085cc:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01085d2:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01085d8:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01085dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01085e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01085e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01085e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01085ec:	eb 20                	jmp    c010860e <sys_write+0x4b>
c01085ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01085f1:	0f b6 00             	movzbl (%eax),%eax
c01085f4:	0f b6 c0             	movzbl %al,%eax
c01085f7:	83 ec 08             	sub    $0x8,%esp
c01085fa:	50                   	push   %eax
c01085fb:	ff 75 ec             	pushl  -0x14(%ebp)
c01085fe:	e8 7d b9 ff ff       	call   c0103f80 <out_char>
c0108603:	83 c4 10             	add    $0x10,%esp
c0108606:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010860a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c010860e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108612:	7f da                	jg     c01085ee <sys_write+0x2b>
c0108614:	90                   	nop
c0108615:	c9                   	leave  
c0108616:	c3                   	ret    

c0108617 <milli_delay>:
c0108617:	55                   	push   %ebp
c0108618:	89 e5                	mov    %esp,%ebp
c010861a:	83 ec 18             	sub    $0x18,%esp
c010861d:	e8 8a 11 00 00       	call   c01097ac <get_ticks_ipc>
c0108622:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108625:	90                   	nop
c0108626:	e8 81 11 00 00       	call   c01097ac <get_ticks_ipc>
c010862b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c010862e:	89 c1                	mov    %eax,%ecx
c0108630:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0108635:	89 c8                	mov    %ecx,%eax
c0108637:	f7 ea                	imul   %edx
c0108639:	c1 fa 05             	sar    $0x5,%edx
c010863c:	89 c8                	mov    %ecx,%eax
c010863e:	c1 f8 1f             	sar    $0x1f,%eax
c0108641:	29 c2                	sub    %eax,%edx
c0108643:	89 d0                	mov    %edx,%eax
c0108645:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c010864b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010864e:	77 d6                	ja     c0108626 <milli_delay+0xf>
c0108650:	90                   	nop
c0108651:	c9                   	leave  
c0108652:	c3                   	ret    

c0108653 <TaskSys>:
c0108653:	55                   	push   %ebp
c0108654:	89 e5                	mov    %esp,%ebp
c0108656:	eb fe                	jmp    c0108656 <TaskSys+0x3>

c0108658 <Printf>:
c0108658:	55                   	push   %ebp
c0108659:	89 e5                	mov    %esp,%ebp
c010865b:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108661:	83 ec 04             	sub    $0x4,%esp
c0108664:	68 00 01 00 00       	push   $0x100
c0108669:	6a 00                	push   $0x0
c010866b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108671:	50                   	push   %eax
c0108672:	e8 78 3b 00 00       	call   c010c1ef <Memset>
c0108677:	83 c4 10             	add    $0x10,%esp
c010867a:	8d 45 0c             	lea    0xc(%ebp),%eax
c010867d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108680:	8b 45 08             	mov    0x8(%ebp),%eax
c0108683:	83 ec 04             	sub    $0x4,%esp
c0108686:	ff 75 f4             	pushl  -0xc(%ebp)
c0108689:	50                   	push   %eax
c010868a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108690:	50                   	push   %eax
c0108691:	e8 20 00 00 00       	call   c01086b6 <vsprintf>
c0108696:	83 c4 10             	add    $0x10,%esp
c0108699:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010869c:	83 ec 04             	sub    $0x4,%esp
c010869f:	ff 75 f0             	pushl  -0x10(%ebp)
c01086a2:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01086a8:	50                   	push   %eax
c01086a9:	6a 00                	push   $0x0
c01086ab:	e8 75 c7 ff ff       	call   c0104e25 <write>
c01086b0:	83 c4 10             	add    $0x10,%esp
c01086b3:	90                   	nop
c01086b4:	c9                   	leave  
c01086b5:	c3                   	ret    

c01086b6 <vsprintf>:
c01086b6:	55                   	push   %ebp
c01086b7:	89 e5                	mov    %esp,%ebp
c01086b9:	81 ec 68 02 00 00    	sub    $0x268,%esp
c01086bf:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01086c5:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c01086cb:	83 ec 04             	sub    $0x4,%esp
c01086ce:	6a 40                	push   $0x40
c01086d0:	6a 00                	push   $0x0
c01086d2:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01086d8:	50                   	push   %eax
c01086d9:	e8 11 3b 00 00       	call   c010c1ef <Memset>
c01086de:	83 c4 10             	add    $0x10,%esp
c01086e1:	8b 45 10             	mov    0x10(%ebp),%eax
c01086e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01086e7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01086ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01086f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01086f4:	e9 53 01 00 00       	jmp    c010884c <vsprintf+0x196>
c01086f9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01086fc:	0f b6 00             	movzbl (%eax),%eax
c01086ff:	3c 25                	cmp    $0x25,%al
c0108701:	74 16                	je     c0108719 <vsprintf+0x63>
c0108703:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108706:	8d 50 01             	lea    0x1(%eax),%edx
c0108709:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010870c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010870f:	0f b6 12             	movzbl (%edx),%edx
c0108712:	88 10                	mov    %dl,(%eax)
c0108714:	e9 2f 01 00 00       	jmp    c0108848 <vsprintf+0x192>
c0108719:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010871d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108720:	0f b6 00             	movzbl (%eax),%eax
c0108723:	0f be c0             	movsbl %al,%eax
c0108726:	83 f8 64             	cmp    $0x64,%eax
c0108729:	74 26                	je     c0108751 <vsprintf+0x9b>
c010872b:	83 f8 64             	cmp    $0x64,%eax
c010872e:	7f 0e                	jg     c010873e <vsprintf+0x88>
c0108730:	83 f8 63             	cmp    $0x63,%eax
c0108733:	0f 84 f2 00 00 00    	je     c010882b <vsprintf+0x175>
c0108739:	e9 0a 01 00 00       	jmp    c0108848 <vsprintf+0x192>
c010873e:	83 f8 73             	cmp    $0x73,%eax
c0108741:	0f 84 b0 00 00 00    	je     c01087f7 <vsprintf+0x141>
c0108747:	83 f8 78             	cmp    $0x78,%eax
c010874a:	74 5d                	je     c01087a9 <vsprintf+0xf3>
c010874c:	e9 f7 00 00 00       	jmp    c0108848 <vsprintf+0x192>
c0108751:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108754:	8b 00                	mov    (%eax),%eax
c0108756:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108759:	83 ec 04             	sub    $0x4,%esp
c010875c:	6a 0a                	push   $0xa
c010875e:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0108764:	50                   	push   %eax
c0108765:	ff 75 e8             	pushl  -0x18(%ebp)
c0108768:	e8 96 10 00 00       	call   c0109803 <itoa>
c010876d:	83 c4 10             	add    $0x10,%esp
c0108770:	83 ec 08             	sub    $0x8,%esp
c0108773:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108779:	50                   	push   %eax
c010877a:	ff 75 f4             	pushl  -0xc(%ebp)
c010877d:	e8 8c 3a 00 00       	call   c010c20e <Strcpy>
c0108782:	83 c4 10             	add    $0x10,%esp
c0108785:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108789:	83 ec 0c             	sub    $0xc,%esp
c010878c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108792:	50                   	push   %eax
c0108793:	e8 90 3a 00 00       	call   c010c228 <Strlen>
c0108798:	83 c4 10             	add    $0x10,%esp
c010879b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010879e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01087a1:	01 45 f4             	add    %eax,-0xc(%ebp)
c01087a4:	e9 9f 00 00 00       	jmp    c0108848 <vsprintf+0x192>
c01087a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087ac:	8b 00                	mov    (%eax),%eax
c01087ae:	83 ec 08             	sub    $0x8,%esp
c01087b1:	50                   	push   %eax
c01087b2:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01087b8:	50                   	push   %eax
c01087b9:	e8 26 e9 ff ff       	call   c01070e4 <atoi>
c01087be:	83 c4 10             	add    $0x10,%esp
c01087c1:	83 ec 08             	sub    $0x8,%esp
c01087c4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01087ca:	50                   	push   %eax
c01087cb:	ff 75 f4             	pushl  -0xc(%ebp)
c01087ce:	e8 3b 3a 00 00       	call   c010c20e <Strcpy>
c01087d3:	83 c4 10             	add    $0x10,%esp
c01087d6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01087da:	83 ec 0c             	sub    $0xc,%esp
c01087dd:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01087e3:	50                   	push   %eax
c01087e4:	e8 3f 3a 00 00       	call   c010c228 <Strlen>
c01087e9:	83 c4 10             	add    $0x10,%esp
c01087ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01087ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01087f2:	01 45 f4             	add    %eax,-0xc(%ebp)
c01087f5:	eb 51                	jmp    c0108848 <vsprintf+0x192>
c01087f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087fa:	8b 00                	mov    (%eax),%eax
c01087fc:	83 ec 08             	sub    $0x8,%esp
c01087ff:	50                   	push   %eax
c0108800:	ff 75 f4             	pushl  -0xc(%ebp)
c0108803:	e8 06 3a 00 00       	call   c010c20e <Strcpy>
c0108808:	83 c4 10             	add    $0x10,%esp
c010880b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010880e:	8b 00                	mov    (%eax),%eax
c0108810:	83 ec 0c             	sub    $0xc,%esp
c0108813:	50                   	push   %eax
c0108814:	e8 0f 3a 00 00       	call   c010c228 <Strlen>
c0108819:	83 c4 10             	add    $0x10,%esp
c010881c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010881f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108823:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108826:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108829:	eb 1d                	jmp    c0108848 <vsprintf+0x192>
c010882b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010882e:	0f b6 10             	movzbl (%eax),%edx
c0108831:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108834:	88 10                	mov    %dl,(%eax)
c0108836:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010883a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0108841:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108844:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108847:	90                   	nop
c0108848:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010884c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010884f:	0f b6 00             	movzbl (%eax),%eax
c0108852:	84 c0                	test   %al,%al
c0108854:	0f 85 9f fe ff ff    	jne    c01086f9 <vsprintf+0x43>
c010885a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010885d:	2b 45 08             	sub    0x8(%ebp),%eax
c0108860:	c9                   	leave  
c0108861:	c3                   	ret    

c0108862 <printx>:
c0108862:	55                   	push   %ebp
c0108863:	89 e5                	mov    %esp,%ebp
c0108865:	81 ec 18 01 00 00    	sub    $0x118,%esp
c010886b:	8d 45 0c             	lea    0xc(%ebp),%eax
c010886e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108871:	8b 45 08             	mov    0x8(%ebp),%eax
c0108874:	83 ec 04             	sub    $0x4,%esp
c0108877:	ff 75 f4             	pushl  -0xc(%ebp)
c010887a:	50                   	push   %eax
c010887b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108881:	50                   	push   %eax
c0108882:	e8 2f fe ff ff       	call   c01086b6 <vsprintf>
c0108887:	83 c4 10             	add    $0x10,%esp
c010888a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010888d:	83 ec 08             	sub    $0x8,%esp
c0108890:	ff 75 f0             	pushl  -0x10(%ebp)
c0108893:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108899:	50                   	push   %eax
c010889a:	e8 11 8e ff ff       	call   c01016b0 <write_debug>
c010889f:	83 c4 10             	add    $0x10,%esp
c01088a2:	90                   	nop
c01088a3:	c9                   	leave  
c01088a4:	c3                   	ret    

c01088a5 <sys_printx>:
c01088a5:	55                   	push   %ebp
c01088a6:	89 e5                	mov    %esp,%ebp
c01088a8:	83 ec 28             	sub    $0x28,%esp
c01088ab:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01088b0:	85 c0                	test   %eax,%eax
c01088b2:	75 15                	jne    c01088c9 <sys_printx+0x24>
c01088b4:	8b 45 10             	mov    0x10(%ebp),%eax
c01088b7:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c01088bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01088c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01088c7:	eb 10                	jmp    c01088d9 <sys_printx+0x34>
c01088c9:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01088ce:	85 c0                	test   %eax,%eax
c01088d0:	74 07                	je     c01088d9 <sys_printx+0x34>
c01088d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01088d9:	8b 55 08             	mov    0x8(%ebp),%edx
c01088dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01088df:	01 d0                	add    %edx,%eax
c01088e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01088e4:	8b 45 10             	mov    0x10(%ebp),%eax
c01088e7:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01088ed:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01088f3:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01088f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01088fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108901:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108904:	0f b6 00             	movzbl (%eax),%eax
c0108907:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010890a:	eb 3a                	jmp    c0108946 <sys_printx+0xa1>
c010890c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010890f:	0f b6 00             	movzbl (%eax),%eax
c0108912:	3c 3b                	cmp    $0x3b,%al
c0108914:	74 0a                	je     c0108920 <sys_printx+0x7b>
c0108916:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108919:	0f b6 00             	movzbl (%eax),%eax
c010891c:	3c 3a                	cmp    $0x3a,%al
c010891e:	75 06                	jne    c0108926 <sys_printx+0x81>
c0108920:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108924:	eb 20                	jmp    c0108946 <sys_printx+0xa1>
c0108926:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108929:	0f b6 00             	movzbl (%eax),%eax
c010892c:	0f b6 c0             	movzbl %al,%eax
c010892f:	83 ec 08             	sub    $0x8,%esp
c0108932:	50                   	push   %eax
c0108933:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108936:	e8 45 b6 ff ff       	call   c0103f80 <out_char>
c010893b:	83 c4 10             	add    $0x10,%esp
c010893e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108942:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0108946:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010894a:	7f c0                	jg     c010890c <sys_printx+0x67>
c010894c:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108950:	75 10                	jne    c0108962 <sys_printx+0xbd>
c0108952:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108957:	85 c0                	test   %eax,%eax
c0108959:	74 13                	je     c010896e <sys_printx+0xc9>
c010895b:	e8 ad 79 ff ff       	call   c010030d <disable_int>
c0108960:	eb 0c                	jmp    c010896e <sys_printx+0xc9>
c0108962:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0108966:	75 06                	jne    c010896e <sys_printx+0xc9>
c0108968:	e8 a0 79 ff ff       	call   c010030d <disable_int>
c010896d:	90                   	nop
c010896e:	90                   	nop
c010896f:	c9                   	leave  
c0108970:	c3                   	ret    

c0108971 <spin>:
c0108971:	55                   	push   %ebp
c0108972:	89 e5                	mov    %esp,%ebp
c0108974:	83 ec 08             	sub    $0x8,%esp
c0108977:	83 ec 0c             	sub    $0xc,%esp
c010897a:	ff 75 08             	pushl  0x8(%ebp)
c010897d:	e8 0a 77 ff ff       	call   c010008c <disp_str>
c0108982:	83 c4 10             	add    $0x10,%esp
c0108985:	83 ec 0c             	sub    $0xc,%esp
c0108988:	68 33 b7 10 c0       	push   $0xc010b733
c010898d:	e8 fa 76 ff ff       	call   c010008c <disp_str>
c0108992:	83 c4 10             	add    $0x10,%esp
c0108995:	eb fe                	jmp    c0108995 <spin+0x24>

c0108997 <panic>:
c0108997:	55                   	push   %ebp
c0108998:	89 e5                	mov    %esp,%ebp
c010899a:	83 ec 08             	sub    $0x8,%esp
c010899d:	83 ec 04             	sub    $0x4,%esp
c01089a0:	ff 75 08             	pushl  0x8(%ebp)
c01089a3:	6a 3a                	push   $0x3a
c01089a5:	68 90 bd 10 c0       	push   $0xc010bd90
c01089aa:	e8 b3 fe ff ff       	call   c0108862 <printx>
c01089af:	83 c4 10             	add    $0x10,%esp
c01089b2:	90                   	nop
c01089b3:	c9                   	leave  
c01089b4:	c3                   	ret    

c01089b5 <assertion_failure>:
c01089b5:	55                   	push   %ebp
c01089b6:	89 e5                	mov    %esp,%ebp
c01089b8:	83 ec 08             	sub    $0x8,%esp
c01089bb:	83 ec 08             	sub    $0x8,%esp
c01089be:	ff 75 14             	pushl  0x14(%ebp)
c01089c1:	ff 75 10             	pushl  0x10(%ebp)
c01089c4:	ff 75 0c             	pushl  0xc(%ebp)
c01089c7:	ff 75 08             	pushl  0x8(%ebp)
c01089ca:	6a 3b                	push   $0x3b
c01089cc:	68 98 bd 10 c0       	push   $0xc010bd98
c01089d1:	e8 8c fe ff ff       	call   c0108862 <printx>
c01089d6:	83 c4 20             	add    $0x20,%esp
c01089d9:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01089e0:	00 00 00 
c01089e3:	83 ec 0c             	sub    $0xc,%esp
c01089e6:	68 20 b6 10 c0       	push   $0xc010b620
c01089eb:	e8 9c 76 ff ff       	call   c010008c <disp_str>
c01089f0:	83 c4 10             	add    $0x10,%esp
c01089f3:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01089f8:	83 ec 0c             	sub    $0xc,%esp
c01089fb:	50                   	push   %eax
c01089fc:	e8 89 e7 ff ff       	call   c010718a <disp_int>
c0108a01:	83 c4 10             	add    $0x10,%esp
c0108a04:	83 ec 0c             	sub    $0xc,%esp
c0108a07:	68 22 b6 10 c0       	push   $0xc010b622
c0108a0c:	e8 7b 76 ff ff       	call   c010008c <disp_str>
c0108a11:	83 c4 10             	add    $0x10,%esp
c0108a14:	83 ec 0c             	sub    $0xc,%esp
c0108a17:	68 cb bd 10 c0       	push   $0xc010bdcb
c0108a1c:	e8 50 ff ff ff       	call   c0108971 <spin>
c0108a21:	83 c4 10             	add    $0x10,%esp
c0108a24:	90                   	nop
c0108a25:	c9                   	leave  
c0108a26:	c3                   	ret    

c0108a27 <assertion_failure2>:
c0108a27:	55                   	push   %ebp
c0108a28:	89 e5                	mov    %esp,%ebp
c0108a2a:	83 ec 08             	sub    $0x8,%esp
c0108a2d:	83 ec 04             	sub    $0x4,%esp
c0108a30:	ff 75 18             	pushl  0x18(%ebp)
c0108a33:	ff 75 14             	pushl  0x14(%ebp)
c0108a36:	ff 75 10             	pushl  0x10(%ebp)
c0108a39:	ff 75 0c             	pushl  0xc(%ebp)
c0108a3c:	ff 75 08             	pushl  0x8(%ebp)
c0108a3f:	6a 3b                	push   $0x3b
c0108a41:	68 d8 bd 10 c0       	push   $0xc010bdd8
c0108a46:	e8 17 fe ff ff       	call   c0108862 <printx>
c0108a4b:	83 c4 20             	add    $0x20,%esp
c0108a4e:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108a55:	00 00 00 
c0108a58:	83 ec 0c             	sub    $0xc,%esp
c0108a5b:	68 20 b6 10 c0       	push   $0xc010b620
c0108a60:	e8 27 76 ff ff       	call   c010008c <disp_str>
c0108a65:	83 c4 10             	add    $0x10,%esp
c0108a68:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108a6d:	83 ec 0c             	sub    $0xc,%esp
c0108a70:	50                   	push   %eax
c0108a71:	e8 14 e7 ff ff       	call   c010718a <disp_int>
c0108a76:	83 c4 10             	add    $0x10,%esp
c0108a79:	83 ec 0c             	sub    $0xc,%esp
c0108a7c:	68 22 b6 10 c0       	push   $0xc010b622
c0108a81:	e8 06 76 ff ff       	call   c010008c <disp_str>
c0108a86:	83 c4 10             	add    $0x10,%esp
c0108a89:	83 ec 0c             	sub    $0xc,%esp
c0108a8c:	68 cb bd 10 c0       	push   $0xc010bdcb
c0108a91:	e8 db fe ff ff       	call   c0108971 <spin>
c0108a96:	83 c4 10             	add    $0x10,%esp
c0108a99:	90                   	nop
c0108a9a:	c9                   	leave  
c0108a9b:	c3                   	ret    

c0108a9c <dead_lock>:
c0108a9c:	55                   	push   %ebp
c0108a9d:	89 e5                	mov    %esp,%ebp
c0108a9f:	b8 00 00 00 00       	mov    $0x0,%eax
c0108aa4:	5d                   	pop    %ebp
c0108aa5:	c3                   	ret    

c0108aa6 <sys_send_msg>:
c0108aa6:	55                   	push   %ebp
c0108aa7:	89 e5                	mov    %esp,%ebp
c0108aa9:	83 ec 58             	sub    $0x58,%esp
c0108aac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108ab3:	83 ec 0c             	sub    $0xc,%esp
c0108ab6:	ff 75 0c             	pushl  0xc(%ebp)
c0108ab9:	e8 28 ae ff ff       	call   c01038e6 <pid2proc>
c0108abe:	83 c4 10             	add    $0x10,%esp
c0108ac1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108ac4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108ac8:	74 2c                	je     c0108af6 <sys_send_msg+0x50>
c0108aca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108acd:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108ad3:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108ad8:	74 1c                	je     c0108af6 <sys_send_msg+0x50>
c0108ada:	68 5c 05 00 00       	push   $0x55c
c0108adf:	68 81 ba 10 c0       	push   $0xc010ba81
c0108ae4:	68 81 ba 10 c0       	push   $0xc010ba81
c0108ae9:	68 18 be 10 c0       	push   $0xc010be18
c0108aee:	e8 c2 fe ff ff       	call   c01089b5 <assertion_failure>
c0108af3:	83 c4 10             	add    $0x10,%esp
c0108af6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108af9:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108aff:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108b04:	74 1c                	je     c0108b22 <sys_send_msg+0x7c>
c0108b06:	68 5e 05 00 00       	push   $0x55e
c0108b0b:	68 81 ba 10 c0       	push   $0xc010ba81
c0108b10:	68 81 ba 10 c0       	push   $0xc010ba81
c0108b15:	68 40 be 10 c0       	push   $0xc010be40
c0108b1a:	e8 96 fe ff ff       	call   c01089b5 <assertion_failure>
c0108b1f:	83 c4 10             	add    $0x10,%esp
c0108b22:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108b26:	75 22                	jne    c0108b4a <sys_send_msg+0xa4>
c0108b28:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108b2c:	75 1c                	jne    c0108b4a <sys_send_msg+0xa4>
c0108b2e:	68 61 05 00 00       	push   $0x561
c0108b33:	68 81 ba 10 c0       	push   $0xc010ba81
c0108b38:	68 81 ba 10 c0       	push   $0xc010ba81
c0108b3d:	68 63 be 10 c0       	push   $0xc010be63
c0108b42:	e8 6e fe ff ff       	call   c01089b5 <assertion_failure>
c0108b47:	83 c4 10             	add    $0x10,%esp
c0108b4a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b4d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b54:	84 c0                	test   %al,%al
c0108b56:	74 65                	je     c0108bbd <sys_send_msg+0x117>
c0108b58:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b5b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b62:	3c 01                	cmp    $0x1,%al
c0108b64:	74 57                	je     c0108bbd <sys_send_msg+0x117>
c0108b66:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b69:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b70:	3c 02                	cmp    $0x2,%al
c0108b72:	74 49                	je     c0108bbd <sys_send_msg+0x117>
c0108b74:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b77:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b7e:	3c 03                	cmp    $0x3,%al
c0108b80:	74 3b                	je     c0108bbd <sys_send_msg+0x117>
c0108b82:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b85:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b8c:	3c 04                	cmp    $0x4,%al
c0108b8e:	74 2d                	je     c0108bbd <sys_send_msg+0x117>
c0108b90:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b93:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b9a:	0f be c0             	movsbl %al,%eax
c0108b9d:	83 ec 0c             	sub    $0xc,%esp
c0108ba0:	68 65 05 00 00       	push   $0x565
c0108ba5:	68 81 ba 10 c0       	push   $0xc010ba81
c0108baa:	68 81 ba 10 c0       	push   $0xc010ba81
c0108baf:	50                   	push   %eax
c0108bb0:	68 74 be 10 c0       	push   $0xc010be74
c0108bb5:	e8 6d fe ff ff       	call   c0108a27 <assertion_failure2>
c0108bba:	83 c4 20             	add    $0x20,%esp
c0108bbd:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bc0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108bc7:	84 c0                	test   %al,%al
c0108bc9:	74 65                	je     c0108c30 <sys_send_msg+0x18a>
c0108bcb:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bce:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108bd5:	3c 01                	cmp    $0x1,%al
c0108bd7:	74 57                	je     c0108c30 <sys_send_msg+0x18a>
c0108bd9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bdc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108be3:	3c 02                	cmp    $0x2,%al
c0108be5:	74 49                	je     c0108c30 <sys_send_msg+0x18a>
c0108be7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bea:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108bf1:	3c 03                	cmp    $0x3,%al
c0108bf3:	74 3b                	je     c0108c30 <sys_send_msg+0x18a>
c0108bf5:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bf8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108bff:	3c 04                	cmp    $0x4,%al
c0108c01:	74 2d                	je     c0108c30 <sys_send_msg+0x18a>
c0108c03:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c06:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c0d:	0f be c0             	movsbl %al,%eax
c0108c10:	83 ec 0c             	sub    $0xc,%esp
c0108c13:	68 68 05 00 00       	push   $0x568
c0108c18:	68 81 ba 10 c0       	push   $0xc010ba81
c0108c1d:	68 81 ba 10 c0       	push   $0xc010ba81
c0108c22:	50                   	push   %eax
c0108c23:	68 10 bf 10 c0       	push   $0xc010bf10
c0108c28:	e8 fa fd ff ff       	call   c0108a27 <assertion_failure2>
c0108c2d:	83 c4 20             	add    $0x20,%esp
c0108c30:	83 ec 0c             	sub    $0xc,%esp
c0108c33:	ff 75 10             	pushl  0x10(%ebp)
c0108c36:	e8 31 ad ff ff       	call   c010396c <proc2pid>
c0108c3b:	83 c4 10             	add    $0x10,%esp
c0108c3e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108c41:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108c48:	8b 45 08             	mov    0x8(%ebp),%eax
c0108c4b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108c4e:	83 ec 08             	sub    $0x8,%esp
c0108c51:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108c54:	ff 75 dc             	pushl  -0x24(%ebp)
c0108c57:	e8 a6 d3 ff ff       	call   c0106002 <get_physical_address_proc>
c0108c5c:	83 c4 10             	add    $0x10,%esp
c0108c5f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108c62:	83 ec 08             	sub    $0x8,%esp
c0108c65:	ff 75 e0             	pushl  -0x20(%ebp)
c0108c68:	ff 75 d8             	pushl  -0x28(%ebp)
c0108c6b:	e8 bf d2 ff ff       	call   c0105f2f <alloc_virtual_memory>
c0108c70:	83 c4 10             	add    $0x10,%esp
c0108c73:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108c76:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c79:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108c7f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108c82:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108c89:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108c8c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108c8f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108c92:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108c95:	89 10                	mov    %edx,(%eax)
c0108c97:	83 ec 08             	sub    $0x8,%esp
c0108c9a:	ff 75 0c             	pushl  0xc(%ebp)
c0108c9d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108ca0:	e8 f7 fd ff ff       	call   c0108a9c <dead_lock>
c0108ca5:	83 c4 10             	add    $0x10,%esp
c0108ca8:	83 f8 01             	cmp    $0x1,%eax
c0108cab:	75 10                	jne    c0108cbd <sys_send_msg+0x217>
c0108cad:	83 ec 0c             	sub    $0xc,%esp
c0108cb0:	68 a0 bf 10 c0       	push   $0xc010bfa0
c0108cb5:	e8 dd fc ff ff       	call   c0108997 <panic>
c0108cba:	83 c4 10             	add    $0x10,%esp
c0108cbd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cc0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cc7:	3c 02                	cmp    $0x2,%al
c0108cc9:	0f 85 ca 01 00 00    	jne    c0108e99 <sys_send_msg+0x3f3>
c0108ccf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cd2:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108cd8:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108cdb:	74 12                	je     c0108cef <sys_send_msg+0x249>
c0108cdd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ce0:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108ce6:	83 f8 12             	cmp    $0x12,%eax
c0108ce9:	0f 85 aa 01 00 00    	jne    c0108e99 <sys_send_msg+0x3f3>
c0108cef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cf2:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108cf8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108cfb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cfe:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108d04:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108d07:	83 ec 08             	sub    $0x8,%esp
c0108d0a:	ff 75 0c             	pushl  0xc(%ebp)
c0108d0d:	ff 75 c0             	pushl  -0x40(%ebp)
c0108d10:	e8 ed d2 ff ff       	call   c0106002 <get_physical_address_proc>
c0108d15:	83 c4 10             	add    $0x10,%esp
c0108d18:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108d1b:	83 ec 08             	sub    $0x8,%esp
c0108d1e:	ff 75 e0             	pushl  -0x20(%ebp)
c0108d21:	ff 75 bc             	pushl  -0x44(%ebp)
c0108d24:	e8 06 d2 ff ff       	call   c0105f2f <alloc_virtual_memory>
c0108d29:	83 c4 10             	add    $0x10,%esp
c0108d2c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108d2f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108d32:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108d35:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108d38:	83 ec 04             	sub    $0x4,%esp
c0108d3b:	51                   	push   %ecx
c0108d3c:	52                   	push   %edx
c0108d3d:	50                   	push   %eax
c0108d3e:	e8 59 e0 ff ff       	call   c0106d9c <Memcpy>
c0108d43:	83 c4 10             	add    $0x10,%esp
c0108d46:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108d4b:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108d50:	75 0a                	jne    c0108d5c <sys_send_msg+0x2b6>
c0108d52:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108d59:	00 00 00 
c0108d5c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d5f:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108d66:	00 00 00 
c0108d69:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d6c:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108d73:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d76:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108d7d:	00 00 00 
c0108d80:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d83:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108d8a:	00 00 00 
c0108d8d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d90:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108d97:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d9a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108da1:	00 00 00 
c0108da4:	8b 45 10             	mov    0x10(%ebp),%eax
c0108da7:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108dae:	00 00 00 
c0108db1:	83 ec 0c             	sub    $0xc,%esp
c0108db4:	ff 75 e8             	pushl  -0x18(%ebp)
c0108db7:	e8 a0 09 00 00       	call   c010975c <unblock>
c0108dbc:	83 c4 10             	add    $0x10,%esp
c0108dbf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108dc2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dc9:	84 c0                	test   %al,%al
c0108dcb:	74 1c                	je     c0108de9 <sys_send_msg+0x343>
c0108dcd:	68 a0 05 00 00       	push   $0x5a0
c0108dd2:	68 81 ba 10 c0       	push   $0xc010ba81
c0108dd7:	68 81 ba 10 c0       	push   $0xc010ba81
c0108ddc:	68 ab bf 10 c0       	push   $0xc010bfab
c0108de1:	e8 cf fb ff ff       	call   c01089b5 <assertion_failure>
c0108de6:	83 c4 10             	add    $0x10,%esp
c0108de9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108dec:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108df2:	83 f8 21             	cmp    $0x21,%eax
c0108df5:	74 1c                	je     c0108e13 <sys_send_msg+0x36d>
c0108df7:	68 a1 05 00 00       	push   $0x5a1
c0108dfc:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e01:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e06:	68 bf bf 10 c0       	push   $0xc010bfbf
c0108e0b:	e8 a5 fb ff ff       	call   c01089b5 <assertion_failure>
c0108e10:	83 c4 10             	add    $0x10,%esp
c0108e13:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e16:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108e1c:	85 c0                	test   %eax,%eax
c0108e1e:	74 1c                	je     c0108e3c <sys_send_msg+0x396>
c0108e20:	68 a3 05 00 00       	push   $0x5a3
c0108e25:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e2a:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e2f:	68 dc bf 10 c0       	push   $0xc010bfdc
c0108e34:	e8 7c fb ff ff       	call   c01089b5 <assertion_failure>
c0108e39:	83 c4 10             	add    $0x10,%esp
c0108e3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e3f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e46:	84 c0                	test   %al,%al
c0108e48:	74 1c                	je     c0108e66 <sys_send_msg+0x3c0>
c0108e4a:	68 a4 05 00 00       	push   $0x5a4
c0108e4f:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e54:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e59:	68 f1 bf 10 c0       	push   $0xc010bff1
c0108e5e:	e8 52 fb ff ff       	call   c01089b5 <assertion_failure>
c0108e63:	83 c4 10             	add    $0x10,%esp
c0108e66:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e69:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108e6f:	83 f8 21             	cmp    $0x21,%eax
c0108e72:	0f 84 45 01 00 00    	je     c0108fbd <sys_send_msg+0x517>
c0108e78:	68 a5 05 00 00       	push   $0x5a5
c0108e7d:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e82:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e87:	68 08 c0 10 c0       	push   $0xc010c008
c0108e8c:	e8 24 fb ff ff       	call   c01089b5 <assertion_failure>
c0108e91:	83 c4 10             	add    $0x10,%esp
c0108e94:	e9 24 01 00 00       	jmp    c0108fbd <sys_send_msg+0x517>
c0108e99:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108ea0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ea3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108ea6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ea9:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108eaf:	85 c0                	test   %eax,%eax
c0108eb1:	75 1b                	jne    c0108ece <sys_send_msg+0x428>
c0108eb3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108eb6:	8b 55 10             	mov    0x10(%ebp),%edx
c0108eb9:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108ebf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ec2:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108ec9:	00 00 00 
c0108ecc:	eb 3f                	jmp    c0108f0d <sys_send_msg+0x467>
c0108ece:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ed1:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108ed7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108eda:	eb 12                	jmp    c0108eee <sys_send_msg+0x448>
c0108edc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108edf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108ee2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ee5:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108eeb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108eee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108ef2:	75 e8                	jne    c0108edc <sys_send_msg+0x436>
c0108ef4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108ef7:	8b 55 10             	mov    0x10(%ebp),%edx
c0108efa:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108f00:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f03:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108f0a:	00 00 00 
c0108f0d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f10:	8b 55 08             	mov    0x8(%ebp),%edx
c0108f13:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108f19:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f1c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108f1f:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108f25:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f28:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108f2f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f32:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f39:	3c 01                	cmp    $0x1,%al
c0108f3b:	74 1c                	je     c0108f59 <sys_send_msg+0x4b3>
c0108f3d:	68 c7 05 00 00       	push   $0x5c7
c0108f42:	68 81 ba 10 c0       	push   $0xc010ba81
c0108f47:	68 81 ba 10 c0       	push   $0xc010ba81
c0108f4c:	68 2c c0 10 c0       	push   $0xc010c02c
c0108f51:	e8 5f fa ff ff       	call   c01089b5 <assertion_failure>
c0108f56:	83 c4 10             	add    $0x10,%esp
c0108f59:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f5c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108f62:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108f65:	74 1c                	je     c0108f83 <sys_send_msg+0x4dd>
c0108f67:	68 c8 05 00 00       	push   $0x5c8
c0108f6c:	68 81 ba 10 c0       	push   $0xc010ba81
c0108f71:	68 81 ba 10 c0       	push   $0xc010ba81
c0108f76:	68 48 c0 10 c0       	push   $0xc010c048
c0108f7b:	e8 35 fa ff ff       	call   c01089b5 <assertion_failure>
c0108f80:	83 c4 10             	add    $0x10,%esp
c0108f83:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f86:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108f8c:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108f8f:	74 1c                	je     c0108fad <sys_send_msg+0x507>
c0108f91:	68 c9 05 00 00       	push   $0x5c9
c0108f96:	68 81 ba 10 c0       	push   $0xc010ba81
c0108f9b:	68 81 ba 10 c0       	push   $0xc010ba81
c0108fa0:	68 6a c0 10 c0       	push   $0xc010c06a
c0108fa5:	e8 0b fa ff ff       	call   c01089b5 <assertion_failure>
c0108faa:	83 c4 10             	add    $0x10,%esp
c0108fad:	83 ec 0c             	sub    $0xc,%esp
c0108fb0:	ff 75 10             	pushl  0x10(%ebp)
c0108fb3:	e8 68 07 00 00       	call   c0109720 <block>
c0108fb8:	83 c4 10             	add    $0x10,%esp
c0108fbb:	eb 01                	jmp    c0108fbe <sys_send_msg+0x518>
c0108fbd:	90                   	nop
c0108fbe:	b8 00 00 00 00       	mov    $0x0,%eax
c0108fc3:	c9                   	leave  
c0108fc4:	c3                   	ret    

c0108fc5 <sys_receive_msg>:
c0108fc5:	55                   	push   %ebp
c0108fc6:	89 e5                	mov    %esp,%ebp
c0108fc8:	83 ec 58             	sub    $0x58,%esp
c0108fcb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108fd2:	83 ec 0c             	sub    $0xc,%esp
c0108fd5:	ff 75 0c             	pushl  0xc(%ebp)
c0108fd8:	e8 09 a9 ff ff       	call   c01038e6 <pid2proc>
c0108fdd:	83 c4 10             	add    $0x10,%esp
c0108fe0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108fe3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108fe7:	74 2c                	je     c0109015 <sys_receive_msg+0x50>
c0108fe9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108fec:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108ff2:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108ff7:	74 1c                	je     c0109015 <sys_receive_msg+0x50>
c0108ff9:	68 dd 05 00 00       	push   $0x5dd
c0108ffe:	68 81 ba 10 c0       	push   $0xc010ba81
c0109003:	68 81 ba 10 c0       	push   $0xc010ba81
c0109008:	68 40 be 10 c0       	push   $0xc010be40
c010900d:	e8 a3 f9 ff ff       	call   c01089b5 <assertion_failure>
c0109012:	83 c4 10             	add    $0x10,%esp
c0109015:	8b 45 10             	mov    0x10(%ebp),%eax
c0109018:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c010901e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0109023:	74 1c                	je     c0109041 <sys_receive_msg+0x7c>
c0109025:	68 df 05 00 00       	push   $0x5df
c010902a:	68 81 ba 10 c0       	push   $0xc010ba81
c010902f:	68 81 ba 10 c0       	push   $0xc010ba81
c0109034:	68 18 be 10 c0       	push   $0xc010be18
c0109039:	e8 77 f9 ff ff       	call   c01089b5 <assertion_failure>
c010903e:	83 c4 10             	add    $0x10,%esp
c0109041:	8b 45 10             	mov    0x10(%ebp),%eax
c0109044:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010904b:	84 c0                	test   %al,%al
c010904d:	74 65                	je     c01090b4 <sys_receive_msg+0xef>
c010904f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109052:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109059:	3c 01                	cmp    $0x1,%al
c010905b:	74 57                	je     c01090b4 <sys_receive_msg+0xef>
c010905d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109060:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109067:	3c 02                	cmp    $0x2,%al
c0109069:	74 49                	je     c01090b4 <sys_receive_msg+0xef>
c010906b:	8b 45 10             	mov    0x10(%ebp),%eax
c010906e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109075:	3c 03                	cmp    $0x3,%al
c0109077:	74 3b                	je     c01090b4 <sys_receive_msg+0xef>
c0109079:	8b 45 10             	mov    0x10(%ebp),%eax
c010907c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109083:	3c 04                	cmp    $0x4,%al
c0109085:	74 2d                	je     c01090b4 <sys_receive_msg+0xef>
c0109087:	8b 45 10             	mov    0x10(%ebp),%eax
c010908a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109091:	0f be c0             	movsbl %al,%eax
c0109094:	83 ec 0c             	sub    $0xc,%esp
c0109097:	68 e2 05 00 00       	push   $0x5e2
c010909c:	68 81 ba 10 c0       	push   $0xc010ba81
c01090a1:	68 81 ba 10 c0       	push   $0xc010ba81
c01090a6:	50                   	push   %eax
c01090a7:	68 74 be 10 c0       	push   $0xc010be74
c01090ac:	e8 76 f9 ff ff       	call   c0108a27 <assertion_failure2>
c01090b1:	83 c4 20             	add    $0x20,%esp
c01090b4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01090b8:	74 73                	je     c010912d <sys_receive_msg+0x168>
c01090ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090bd:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090c4:	84 c0                	test   %al,%al
c01090c6:	74 65                	je     c010912d <sys_receive_msg+0x168>
c01090c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090cb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090d2:	3c 01                	cmp    $0x1,%al
c01090d4:	74 57                	je     c010912d <sys_receive_msg+0x168>
c01090d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090d9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090e0:	3c 02                	cmp    $0x2,%al
c01090e2:	74 49                	je     c010912d <sys_receive_msg+0x168>
c01090e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090e7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090ee:	3c 03                	cmp    $0x3,%al
c01090f0:	74 3b                	je     c010912d <sys_receive_msg+0x168>
c01090f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090f5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090fc:	3c 04                	cmp    $0x4,%al
c01090fe:	74 2d                	je     c010912d <sys_receive_msg+0x168>
c0109100:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109103:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010910a:	0f be c0             	movsbl %al,%eax
c010910d:	83 ec 0c             	sub    $0xc,%esp
c0109110:	68 e6 05 00 00       	push   $0x5e6
c0109115:	68 81 ba 10 c0       	push   $0xc010ba81
c010911a:	68 81 ba 10 c0       	push   $0xc010ba81
c010911f:	50                   	push   %eax
c0109120:	68 10 bf 10 c0       	push   $0xc010bf10
c0109125:	e8 fd f8 ff ff       	call   c0108a27 <assertion_failure2>
c010912a:	83 c4 20             	add    $0x20,%esp
c010912d:	83 ec 0c             	sub    $0xc,%esp
c0109130:	ff 75 10             	pushl  0x10(%ebp)
c0109133:	e8 34 a8 ff ff       	call   c010396c <proc2pid>
c0109138:	83 c4 10             	add    $0x10,%esp
c010913b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010913e:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0109145:	8b 45 08             	mov    0x8(%ebp),%eax
c0109148:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010914b:	8b 45 10             	mov    0x10(%ebp),%eax
c010914e:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109154:	83 ec 08             	sub    $0x8,%esp
c0109157:	50                   	push   %eax
c0109158:	ff 75 d8             	pushl  -0x28(%ebp)
c010915b:	e8 a2 ce ff ff       	call   c0106002 <get_physical_address_proc>
c0109160:	83 c4 10             	add    $0x10,%esp
c0109163:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109166:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010916d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109170:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109176:	85 c0                	test   %eax,%eax
c0109178:	0f 84 c5 00 00 00    	je     c0109243 <sys_receive_msg+0x27e>
c010917e:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109182:	74 0d                	je     c0109191 <sys_receive_msg+0x1cc>
c0109184:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010918b:	0f 85 b2 00 00 00    	jne    c0109243 <sys_receive_msg+0x27e>
c0109191:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0109198:	83 ec 0c             	sub    $0xc,%esp
c010919b:	ff 75 d0             	pushl  -0x30(%ebp)
c010919e:	e8 49 85 ff ff       	call   c01016ec <sys_malloc>
c01091a3:	83 c4 10             	add    $0x10,%esp
c01091a6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01091a9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01091ac:	83 ec 04             	sub    $0x4,%esp
c01091af:	50                   	push   %eax
c01091b0:	6a 00                	push   $0x0
c01091b2:	ff 75 cc             	pushl  -0x34(%ebp)
c01091b5:	e8 35 30 00 00       	call   c010c1ef <Memset>
c01091ba:	83 c4 10             	add    $0x10,%esp
c01091bd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01091c0:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c01091c6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01091c9:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c01091d0:	83 ec 08             	sub    $0x8,%esp
c01091d3:	ff 75 d0             	pushl  -0x30(%ebp)
c01091d6:	ff 75 d4             	pushl  -0x2c(%ebp)
c01091d9:	e8 51 cd ff ff       	call   c0105f2f <alloc_virtual_memory>
c01091de:	83 c4 10             	add    $0x10,%esp
c01091e1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01091e4:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01091e7:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01091ea:	83 ec 04             	sub    $0x4,%esp
c01091ed:	52                   	push   %edx
c01091ee:	ff 75 cc             	pushl  -0x34(%ebp)
c01091f1:	50                   	push   %eax
c01091f2:	e8 a5 db ff ff       	call   c0106d9c <Memcpy>
c01091f7:	83 c4 10             	add    $0x10,%esp
c01091fa:	8b 45 10             	mov    0x10(%ebp),%eax
c01091fd:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109204:	00 00 00 
c0109207:	8b 45 10             	mov    0x10(%ebp),%eax
c010920a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109211:	00 00 00 
c0109214:	8b 45 10             	mov    0x10(%ebp),%eax
c0109217:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010921e:	00 00 00 
c0109221:	8b 45 10             	mov    0x10(%ebp),%eax
c0109224:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010922b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0109232:	83 ec 08             	sub    $0x8,%esp
c0109235:	ff 75 d0             	pushl  -0x30(%ebp)
c0109238:	ff 75 cc             	pushl  -0x34(%ebp)
c010923b:	e8 c1 84 ff ff       	call   c0101701 <sys_free>
c0109240:	83 c4 10             	add    $0x10,%esp
c0109243:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0109247:	0f 84 d4 03 00 00    	je     c0109621 <sys_receive_msg+0x65c>
c010924d:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109251:	75 26                	jne    c0109279 <sys_receive_msg+0x2b4>
c0109253:	8b 45 10             	mov    0x10(%ebp),%eax
c0109256:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010925c:	85 c0                	test   %eax,%eax
c010925e:	0f 84 8a 00 00 00    	je     c01092ee <sys_receive_msg+0x329>
c0109264:	8b 45 10             	mov    0x10(%ebp),%eax
c0109267:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010926d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109270:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0109277:	eb 75                	jmp    c01092ee <sys_receive_msg+0x329>
c0109279:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010927d:	78 6f                	js     c01092ee <sys_receive_msg+0x329>
c010927f:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109283:	7f 69                	jg     c01092ee <sys_receive_msg+0x329>
c0109285:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109288:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010928f:	3c 01                	cmp    $0x1,%al
c0109291:	75 5b                	jne    c01092ee <sys_receive_msg+0x329>
c0109293:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109296:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010929c:	83 f8 12             	cmp    $0x12,%eax
c010929f:	74 0e                	je     c01092af <sys_receive_msg+0x2ea>
c01092a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01092a4:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01092aa:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c01092ad:	75 3f                	jne    c01092ee <sys_receive_msg+0x329>
c01092af:	8b 45 10             	mov    0x10(%ebp),%eax
c01092b2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01092b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01092bb:	eb 2b                	jmp    c01092e8 <sys_receive_msg+0x323>
c01092bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01092c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092c6:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01092cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01092cf:	39 c2                	cmp    %eax,%edx
c01092d1:	75 09                	jne    c01092dc <sys_receive_msg+0x317>
c01092d3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01092da:	eb 12                	jmp    c01092ee <sys_receive_msg+0x329>
c01092dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092df:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c01092e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01092e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01092ec:	75 cf                	jne    c01092bd <sys_receive_msg+0x2f8>
c01092ee:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c01092f2:	0f 85 4e 02 00 00    	jne    c0109546 <sys_receive_msg+0x581>
c01092f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092fb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01092fe:	83 ec 08             	sub    $0x8,%esp
c0109301:	ff 75 dc             	pushl  -0x24(%ebp)
c0109304:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109307:	e8 23 cc ff ff       	call   c0105f2f <alloc_virtual_memory>
c010930c:	83 c4 10             	add    $0x10,%esp
c010930f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0109312:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109315:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010931b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010931e:	83 ec 0c             	sub    $0xc,%esp
c0109321:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109324:	e8 43 a6 ff ff       	call   c010396c <proc2pid>
c0109329:	83 c4 10             	add    $0x10,%esp
c010932c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010932f:	83 ec 08             	sub    $0x8,%esp
c0109332:	ff 75 b8             	pushl  -0x48(%ebp)
c0109335:	ff 75 bc             	pushl  -0x44(%ebp)
c0109338:	e8 c5 cc ff ff       	call   c0106002 <get_physical_address_proc>
c010933d:	83 c4 10             	add    $0x10,%esp
c0109340:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0109343:	83 ec 08             	sub    $0x8,%esp
c0109346:	ff 75 dc             	pushl  -0x24(%ebp)
c0109349:	ff 75 b4             	pushl  -0x4c(%ebp)
c010934c:	e8 de cb ff ff       	call   c0105f2f <alloc_virtual_memory>
c0109351:	83 c4 10             	add    $0x10,%esp
c0109354:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0109357:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010935a:	83 ec 04             	sub    $0x4,%esp
c010935d:	50                   	push   %eax
c010935e:	ff 75 b0             	pushl  -0x50(%ebp)
c0109361:	ff 75 c0             	pushl  -0x40(%ebp)
c0109364:	e8 33 da ff ff       	call   c0106d9c <Memcpy>
c0109369:	83 c4 10             	add    $0x10,%esp
c010936c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010936f:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0109372:	8b 45 10             	mov    0x10(%ebp),%eax
c0109375:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010937b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010937e:	75 21                	jne    c01093a1 <sys_receive_msg+0x3dc>
c0109380:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109383:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109389:	8b 45 10             	mov    0x10(%ebp),%eax
c010938c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109392:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109395:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010939c:	00 00 00 
c010939f:	eb 1f                	jmp    c01093c0 <sys_receive_msg+0x3fb>
c01093a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093a4:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c01093aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01093ad:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c01093b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093b6:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01093bd:	00 00 00 
c01093c0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093c3:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01093ca:	00 00 00 
c01093cd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093d0:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01093d7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093da:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01093e1:	00 00 00 
c01093e4:	8b 45 10             	mov    0x10(%ebp),%eax
c01093e7:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01093ee:	00 00 00 
c01093f1:	8b 45 10             	mov    0x10(%ebp),%eax
c01093f4:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01093fb:	00 00 00 
c01093fe:	8b 45 10             	mov    0x10(%ebp),%eax
c0109401:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109408:	00 00 00 
c010940b:	83 ec 0c             	sub    $0xc,%esp
c010940e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109411:	e8 46 03 00 00       	call   c010975c <unblock>
c0109416:	83 c4 10             	add    $0x10,%esp
c0109419:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010941c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109422:	85 c0                	test   %eax,%eax
c0109424:	74 1c                	je     c0109442 <sys_receive_msg+0x47d>
c0109426:	68 56 06 00 00       	push   $0x656
c010942b:	68 81 ba 10 c0       	push   $0xc010ba81
c0109430:	68 81 ba 10 c0       	push   $0xc010ba81
c0109435:	68 7f c0 10 c0       	push   $0xc010c07f
c010943a:	e8 76 f5 ff ff       	call   c01089b5 <assertion_failure>
c010943f:	83 c4 10             	add    $0x10,%esp
c0109442:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109445:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010944c:	84 c0                	test   %al,%al
c010944e:	74 1c                	je     c010946c <sys_receive_msg+0x4a7>
c0109450:	68 57 06 00 00       	push   $0x657
c0109455:	68 81 ba 10 c0       	push   $0xc010ba81
c010945a:	68 81 ba 10 c0       	push   $0xc010ba81
c010945f:	68 97 c0 10 c0       	push   $0xc010c097
c0109464:	e8 4c f5 ff ff       	call   c01089b5 <assertion_failure>
c0109469:	83 c4 10             	add    $0x10,%esp
c010946c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010946f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109475:	83 f8 21             	cmp    $0x21,%eax
c0109478:	74 1c                	je     c0109496 <sys_receive_msg+0x4d1>
c010947a:	68 58 06 00 00       	push   $0x658
c010947f:	68 81 ba 10 c0       	push   $0xc010ba81
c0109484:	68 81 ba 10 c0       	push   $0xc010ba81
c0109489:	68 b0 c0 10 c0       	push   $0xc010c0b0
c010948e:	e8 22 f5 ff ff       	call   c01089b5 <assertion_failure>
c0109493:	83 c4 10             	add    $0x10,%esp
c0109496:	8b 45 10             	mov    0x10(%ebp),%eax
c0109499:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010949f:	85 c0                	test   %eax,%eax
c01094a1:	74 1c                	je     c01094bf <sys_receive_msg+0x4fa>
c01094a3:	68 5a 06 00 00       	push   $0x65a
c01094a8:	68 81 ba 10 c0       	push   $0xc010ba81
c01094ad:	68 81 ba 10 c0       	push   $0xc010ba81
c01094b2:	68 dc bf 10 c0       	push   $0xc010bfdc
c01094b7:	e8 f9 f4 ff ff       	call   c01089b5 <assertion_failure>
c01094bc:	83 c4 10             	add    $0x10,%esp
c01094bf:	8b 45 10             	mov    0x10(%ebp),%eax
c01094c2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094c9:	84 c0                	test   %al,%al
c01094cb:	74 1c                	je     c01094e9 <sys_receive_msg+0x524>
c01094cd:	68 5b 06 00 00       	push   $0x65b
c01094d2:	68 81 ba 10 c0       	push   $0xc010ba81
c01094d7:	68 81 ba 10 c0       	push   $0xc010ba81
c01094dc:	68 f1 bf 10 c0       	push   $0xc010bff1
c01094e1:	e8 cf f4 ff ff       	call   c01089b5 <assertion_failure>
c01094e6:	83 c4 10             	add    $0x10,%esp
c01094e9:	8b 45 10             	mov    0x10(%ebp),%eax
c01094ec:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01094f2:	83 f8 21             	cmp    $0x21,%eax
c01094f5:	74 1c                	je     c0109513 <sys_receive_msg+0x54e>
c01094f7:	68 5c 06 00 00       	push   $0x65c
c01094fc:	68 81 ba 10 c0       	push   $0xc010ba81
c0109501:	68 81 ba 10 c0       	push   $0xc010ba81
c0109506:	68 08 c0 10 c0       	push   $0xc010c008
c010950b:	e8 a5 f4 ff ff       	call   c01089b5 <assertion_failure>
c0109510:	83 c4 10             	add    $0x10,%esp
c0109513:	8b 45 10             	mov    0x10(%ebp),%eax
c0109516:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010951c:	83 f8 21             	cmp    $0x21,%eax
c010951f:	0f 84 f5 00 00 00    	je     c010961a <sys_receive_msg+0x655>
c0109525:	68 5d 06 00 00       	push   $0x65d
c010952a:	68 81 ba 10 c0       	push   $0xc010ba81
c010952f:	68 81 ba 10 c0       	push   $0xc010ba81
c0109534:	68 d4 c0 10 c0       	push   $0xc010c0d4
c0109539:	e8 77 f4 ff ff       	call   c01089b5 <assertion_failure>
c010953e:	83 c4 10             	add    $0x10,%esp
c0109541:	e9 d4 00 00 00       	jmp    c010961a <sys_receive_msg+0x655>
c0109546:	8b 45 10             	mov    0x10(%ebp),%eax
c0109549:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c0109550:	8b 45 10             	mov    0x10(%ebp),%eax
c0109553:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010955a:	3c 02                	cmp    $0x2,%al
c010955c:	74 1c                	je     c010957a <sys_receive_msg+0x5b5>
c010955e:	68 62 06 00 00       	push   $0x662
c0109563:	68 81 ba 10 c0       	push   $0xc010ba81
c0109568:	68 81 ba 10 c0       	push   $0xc010ba81
c010956d:	68 f3 c0 10 c0       	push   $0xc010c0f3
c0109572:	e8 3e f4 ff ff       	call   c01089b5 <assertion_failure>
c0109577:	83 c4 10             	add    $0x10,%esp
c010957a:	8b 45 10             	mov    0x10(%ebp),%eax
c010957d:	8b 55 08             	mov    0x8(%ebp),%edx
c0109580:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109586:	8b 45 10             	mov    0x10(%ebp),%eax
c0109589:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109590:	3c 02                	cmp    $0x2,%al
c0109592:	74 1c                	je     c01095b0 <sys_receive_msg+0x5eb>
c0109594:	68 64 06 00 00       	push   $0x664
c0109599:	68 81 ba 10 c0       	push   $0xc010ba81
c010959e:	68 81 ba 10 c0       	push   $0xc010ba81
c01095a3:	68 f3 c0 10 c0       	push   $0xc010c0f3
c01095a8:	e8 08 f4 ff ff       	call   c01089b5 <assertion_failure>
c01095ad:	83 c4 10             	add    $0x10,%esp
c01095b0:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01095b4:	75 0f                	jne    c01095c5 <sys_receive_msg+0x600>
c01095b6:	8b 45 10             	mov    0x10(%ebp),%eax
c01095b9:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c01095c0:	00 00 00 
c01095c3:	eb 0c                	jmp    c01095d1 <sys_receive_msg+0x60c>
c01095c5:	8b 45 10             	mov    0x10(%ebp),%eax
c01095c8:	8b 55 0c             	mov    0xc(%ebp),%edx
c01095cb:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c01095d1:	8b 45 10             	mov    0x10(%ebp),%eax
c01095d4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01095db:	3c 02                	cmp    $0x2,%al
c01095dd:	74 2d                	je     c010960c <sys_receive_msg+0x647>
c01095df:	8b 45 10             	mov    0x10(%ebp),%eax
c01095e2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01095e9:	0f be c0             	movsbl %al,%eax
c01095ec:	83 ec 0c             	sub    $0xc,%esp
c01095ef:	68 6f 06 00 00       	push   $0x66f
c01095f4:	68 81 ba 10 c0       	push   $0xc010ba81
c01095f9:	68 81 ba 10 c0       	push   $0xc010ba81
c01095fe:	50                   	push   %eax
c01095ff:	68 f3 c0 10 c0       	push   $0xc010c0f3
c0109604:	e8 1e f4 ff ff       	call   c0108a27 <assertion_failure2>
c0109609:	83 c4 20             	add    $0x20,%esp
c010960c:	83 ec 0c             	sub    $0xc,%esp
c010960f:	ff 75 10             	pushl  0x10(%ebp)
c0109612:	e8 09 01 00 00       	call   c0109720 <block>
c0109617:	83 c4 10             	add    $0x10,%esp
c010961a:	b8 00 00 00 00       	mov    $0x0,%eax
c010961f:	eb 02                	jmp    c0109623 <sys_receive_msg+0x65e>
c0109621:	90                   	nop
c0109622:	90                   	nop
c0109623:	c9                   	leave  
c0109624:	c3                   	ret    

c0109625 <send_rec>:
c0109625:	55                   	push   %ebp
c0109626:	89 e5                	mov    %esp,%ebp
c0109628:	83 ec 18             	sub    $0x18,%esp
c010962b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010962e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109631:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109638:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c010963c:	74 28                	je     c0109666 <send_rec+0x41>
c010963e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109642:	74 22                	je     c0109666 <send_rec+0x41>
c0109644:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109648:	74 1c                	je     c0109666 <send_rec+0x41>
c010964a:	68 81 06 00 00       	push   $0x681
c010964f:	68 81 ba 10 c0       	push   $0xc010ba81
c0109654:	68 81 ba 10 c0       	push   $0xc010ba81
c0109659:	68 14 c1 10 c0       	push   $0xc010c114
c010965e:	e8 52 f3 ff ff       	call   c01089b5 <assertion_failure>
c0109663:	83 c4 10             	add    $0x10,%esp
c0109666:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010966a:	75 14                	jne    c0109680 <send_rec+0x5b>
c010966c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010966f:	83 ec 04             	sub    $0x4,%esp
c0109672:	50                   	push   %eax
c0109673:	6a 00                	push   $0x0
c0109675:	ff 75 0c             	pushl  0xc(%ebp)
c0109678:	e8 72 2b 00 00       	call   c010c1ef <Memset>
c010967d:	83 c4 10             	add    $0x10,%esp
c0109680:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109684:	74 23                	je     c01096a9 <send_rec+0x84>
c0109686:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010968a:	74 34                	je     c01096c0 <send_rec+0x9b>
c010968c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109690:	75 74                	jne    c0109706 <send_rec+0xe1>
c0109692:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109695:	83 ec 08             	sub    $0x8,%esp
c0109698:	ff 75 10             	pushl  0x10(%ebp)
c010969b:	50                   	push   %eax
c010969c:	e8 1f 80 ff ff       	call   c01016c0 <send_msg>
c01096a1:	83 c4 10             	add    $0x10,%esp
c01096a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01096a7:	eb 70                	jmp    c0109719 <send_rec+0xf4>
c01096a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096ac:	83 ec 08             	sub    $0x8,%esp
c01096af:	ff 75 10             	pushl  0x10(%ebp)
c01096b2:	50                   	push   %eax
c01096b3:	e8 1e 80 ff ff       	call   c01016d6 <receive_msg>
c01096b8:	83 c4 10             	add    $0x10,%esp
c01096bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01096be:	eb 59                	jmp    c0109719 <send_rec+0xf4>
c01096c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096c3:	83 ec 08             	sub    $0x8,%esp
c01096c6:	ff 75 10             	pushl  0x10(%ebp)
c01096c9:	50                   	push   %eax
c01096ca:	e8 f1 7f ff ff       	call   c01016c0 <send_msg>
c01096cf:	83 c4 10             	add    $0x10,%esp
c01096d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01096d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01096d9:	75 3d                	jne    c0109718 <send_rec+0xf3>
c01096db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01096de:	83 ec 04             	sub    $0x4,%esp
c01096e1:	50                   	push   %eax
c01096e2:	6a 00                	push   $0x0
c01096e4:	ff 75 0c             	pushl  0xc(%ebp)
c01096e7:	e8 03 2b 00 00       	call   c010c1ef <Memset>
c01096ec:	83 c4 10             	add    $0x10,%esp
c01096ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096f2:	83 ec 08             	sub    $0x8,%esp
c01096f5:	ff 75 10             	pushl  0x10(%ebp)
c01096f8:	50                   	push   %eax
c01096f9:	e8 d8 7f ff ff       	call   c01016d6 <receive_msg>
c01096fe:	83 c4 10             	add    $0x10,%esp
c0109701:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109704:	eb 12                	jmp    c0109718 <send_rec+0xf3>
c0109706:	83 ec 0c             	sub    $0xc,%esp
c0109709:	68 50 c1 10 c0       	push   $0xc010c150
c010970e:	e8 84 f2 ff ff       	call   c0108997 <panic>
c0109713:	83 c4 10             	add    $0x10,%esp
c0109716:	eb 01                	jmp    c0109719 <send_rec+0xf4>
c0109718:	90                   	nop
c0109719:	b8 00 00 00 00       	mov    $0x0,%eax
c010971e:	c9                   	leave  
c010971f:	c3                   	ret    

c0109720 <block>:
c0109720:	55                   	push   %ebp
c0109721:	89 e5                	mov    %esp,%ebp
c0109723:	83 ec 08             	sub    $0x8,%esp
c0109726:	8b 45 08             	mov    0x8(%ebp),%eax
c0109729:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109730:	84 c0                	test   %al,%al
c0109732:	75 1c                	jne    c0109750 <block+0x30>
c0109734:	68 b0 06 00 00       	push   $0x6b0
c0109739:	68 81 ba 10 c0       	push   $0xc010ba81
c010973e:	68 81 ba 10 c0       	push   $0xc010ba81
c0109743:	68 65 c1 10 c0       	push   $0xc010c165
c0109748:	e8 68 f2 ff ff       	call   c01089b5 <assertion_failure>
c010974d:	83 c4 10             	add    $0x10,%esp
c0109750:	e8 13 a0 ff ff       	call   c0103768 <schedule_process>
c0109755:	b8 00 00 00 00       	mov    $0x0,%eax
c010975a:	c9                   	leave  
c010975b:	c3                   	ret    

c010975c <unblock>:
c010975c:	55                   	push   %ebp
c010975d:	89 e5                	mov    %esp,%ebp
c010975f:	83 ec 08             	sub    $0x8,%esp
c0109762:	8b 45 08             	mov    0x8(%ebp),%eax
c0109765:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010976c:	84 c0                	test   %al,%al
c010976e:	74 1c                	je     c010978c <unblock+0x30>
c0109770:	68 b9 06 00 00       	push   $0x6b9
c0109775:	68 81 ba 10 c0       	push   $0xc010ba81
c010977a:	68 81 ba 10 c0       	push   $0xc010ba81
c010977f:	68 7d c1 10 c0       	push   $0xc010c17d
c0109784:	e8 2c f2 ff ff       	call   c01089b5 <assertion_failure>
c0109789:	83 c4 10             	add    $0x10,%esp
c010978c:	8b 45 08             	mov    0x8(%ebp),%eax
c010978f:	05 60 02 00 00       	add    $0x260,%eax
c0109794:	83 ec 08             	sub    $0x8,%esp
c0109797:	50                   	push   %eax
c0109798:	68 ec fd 10 c0       	push   $0xc010fdec
c010979d:	e8 ce 0a 00 00       	call   c010a270 <appendToDoubleLinkList>
c01097a2:	83 c4 10             	add    $0x10,%esp
c01097a5:	b8 00 00 00 00       	mov    $0x0,%eax
c01097aa:	c9                   	leave  
c01097ab:	c3                   	ret    

c01097ac <get_ticks_ipc>:
c01097ac:	55                   	push   %ebp
c01097ad:	89 e5                	mov    %esp,%ebp
c01097af:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01097b5:	83 ec 04             	sub    $0x4,%esp
c01097b8:	6a 7c                	push   $0x7c
c01097ba:	6a 00                	push   $0x0
c01097bc:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01097c2:	50                   	push   %eax
c01097c3:	e8 27 2a 00 00       	call   c010c1ef <Memset>
c01097c8:	83 c4 10             	add    $0x10,%esp
c01097cb:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c01097d2:	00 00 00 
c01097d5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01097dc:	83 ec 04             	sub    $0x4,%esp
c01097df:	6a 01                	push   $0x1
c01097e1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01097e7:	50                   	push   %eax
c01097e8:	6a 03                	push   $0x3
c01097ea:	e8 36 fe ff ff       	call   c0109625 <send_rec>
c01097ef:	83 c4 10             	add    $0x10,%esp
c01097f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01097f5:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01097fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01097fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109801:	c9                   	leave  
c0109802:	c3                   	ret    

c0109803 <itoa>:
c0109803:	55                   	push   %ebp
c0109804:	89 e5                	mov    %esp,%ebp
c0109806:	53                   	push   %ebx
c0109807:	83 ec 14             	sub    $0x14,%esp
c010980a:	8b 45 08             	mov    0x8(%ebp),%eax
c010980d:	99                   	cltd   
c010980e:	f7 7d 10             	idivl  0x10(%ebp)
c0109811:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109814:	8b 45 08             	mov    0x8(%ebp),%eax
c0109817:	99                   	cltd   
c0109818:	f7 7d 10             	idivl  0x10(%ebp)
c010981b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010981e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109822:	74 14                	je     c0109838 <itoa+0x35>
c0109824:	83 ec 04             	sub    $0x4,%esp
c0109827:	ff 75 10             	pushl  0x10(%ebp)
c010982a:	ff 75 0c             	pushl  0xc(%ebp)
c010982d:	ff 75 f0             	pushl  -0x10(%ebp)
c0109830:	e8 ce ff ff ff       	call   c0109803 <itoa>
c0109835:	83 c4 10             	add    $0x10,%esp
c0109838:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010983b:	8d 58 30             	lea    0x30(%eax),%ebx
c010983e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109841:	8b 00                	mov    (%eax),%eax
c0109843:	8d 48 01             	lea    0x1(%eax),%ecx
c0109846:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109849:	89 0a                	mov    %ecx,(%edx)
c010984b:	89 da                	mov    %ebx,%edx
c010984d:	88 10                	mov    %dl,(%eax)
c010984f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109852:	8b 00                	mov    (%eax),%eax
c0109854:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109857:	c9                   	leave  
c0109858:	c3                   	ret    

c0109859 <i2a>:
c0109859:	55                   	push   %ebp
c010985a:	89 e5                	mov    %esp,%ebp
c010985c:	53                   	push   %ebx
c010985d:	83 ec 14             	sub    $0x14,%esp
c0109860:	8b 45 08             	mov    0x8(%ebp),%eax
c0109863:	99                   	cltd   
c0109864:	f7 7d 0c             	idivl  0xc(%ebp)
c0109867:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010986a:	8b 45 08             	mov    0x8(%ebp),%eax
c010986d:	99                   	cltd   
c010986e:	f7 7d 0c             	idivl  0xc(%ebp)
c0109871:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109874:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109878:	74 14                	je     c010988e <i2a+0x35>
c010987a:	83 ec 04             	sub    $0x4,%esp
c010987d:	ff 75 10             	pushl  0x10(%ebp)
c0109880:	ff 75 0c             	pushl  0xc(%ebp)
c0109883:	ff 75 f0             	pushl  -0x10(%ebp)
c0109886:	e8 ce ff ff ff       	call   c0109859 <i2a>
c010988b:	83 c4 10             	add    $0x10,%esp
c010988e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109892:	7f 0a                	jg     c010989e <i2a+0x45>
c0109894:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109897:	83 c0 30             	add    $0x30,%eax
c010989a:	89 c3                	mov    %eax,%ebx
c010989c:	eb 08                	jmp    c01098a6 <i2a+0x4d>
c010989e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098a1:	83 c0 37             	add    $0x37,%eax
c01098a4:	89 c3                	mov    %eax,%ebx
c01098a6:	8b 45 10             	mov    0x10(%ebp),%eax
c01098a9:	8b 00                	mov    (%eax),%eax
c01098ab:	8d 48 01             	lea    0x1(%eax),%ecx
c01098ae:	8b 55 10             	mov    0x10(%ebp),%edx
c01098b1:	89 0a                	mov    %ecx,(%edx)
c01098b3:	88 18                	mov    %bl,(%eax)
c01098b5:	8b 45 10             	mov    0x10(%ebp),%eax
c01098b8:	8b 00                	mov    (%eax),%eax
c01098ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01098bd:	c9                   	leave  
c01098be:	c3                   	ret    

c01098bf <inform_int>:
c01098bf:	55                   	push   %ebp
c01098c0:	89 e5                	mov    %esp,%ebp
c01098c2:	83 ec 18             	sub    $0x18,%esp
c01098c5:	83 ec 0c             	sub    $0xc,%esp
c01098c8:	ff 75 08             	pushl  0x8(%ebp)
c01098cb:	e8 16 a0 ff ff       	call   c01038e6 <pid2proc>
c01098d0:	83 c4 10             	add    $0x10,%esp
c01098d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01098d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098d9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01098e0:	0f be c0             	movsbl %al,%eax
c01098e3:	83 e0 02             	and    $0x2,%eax
c01098e6:	85 c0                	test   %eax,%eax
c01098e8:	0f 84 8e 00 00 00    	je     c010997c <inform_int+0xbd>
c01098ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098f1:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01098f7:	3d 13 02 00 00       	cmp    $0x213,%eax
c01098fc:	74 0e                	je     c010990c <inform_int+0x4d>
c01098fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109901:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109907:	83 f8 12             	cmp    $0x12,%eax
c010990a:	75 7d                	jne    c0109989 <inform_int+0xca>
c010990c:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109913:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109916:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010991c:	83 ec 08             	sub    $0x8,%esp
c010991f:	ff 75 f0             	pushl  -0x10(%ebp)
c0109922:	50                   	push   %eax
c0109923:	e8 07 c6 ff ff       	call   c0105f2f <alloc_virtual_memory>
c0109928:	83 c4 10             	add    $0x10,%esp
c010992b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010992e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109931:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109937:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010993a:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109941:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109944:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c010994b:	00 00 00 
c010994e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109951:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109958:	00 00 00 
c010995b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109962:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109965:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010996c:	83 ec 0c             	sub    $0xc,%esp
c010996f:	ff 75 f4             	pushl  -0xc(%ebp)
c0109972:	e8 e5 fd ff ff       	call   c010975c <unblock>
c0109977:	83 c4 10             	add    $0x10,%esp
c010997a:	eb 0d                	jmp    c0109989 <inform_int+0xca>
c010997c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010997f:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109986:	00 00 00 
c0109989:	90                   	nop
c010998a:	c9                   	leave  
c010998b:	c3                   	ret    

c010998c <strcmp>:
c010998c:	55                   	push   %ebp
c010998d:	89 e5                	mov    %esp,%ebp
c010998f:	83 ec 10             	sub    $0x10,%esp
c0109992:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109996:	74 06                	je     c010999e <strcmp+0x12>
c0109998:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010999c:	75 08                	jne    c01099a6 <strcmp+0x1a>
c010999e:	8b 45 08             	mov    0x8(%ebp),%eax
c01099a1:	2b 45 0c             	sub    0xc(%ebp),%eax
c01099a4:	eb 53                	jmp    c01099f9 <strcmp+0x6d>
c01099a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01099a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01099ac:	8b 45 0c             	mov    0xc(%ebp),%eax
c01099af:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01099b2:	eb 18                	jmp    c01099cc <strcmp+0x40>
c01099b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01099b7:	0f b6 10             	movzbl (%eax),%edx
c01099ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01099bd:	0f b6 00             	movzbl (%eax),%eax
c01099c0:	38 c2                	cmp    %al,%dl
c01099c2:	75 1e                	jne    c01099e2 <strcmp+0x56>
c01099c4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01099c8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01099cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01099cf:	0f b6 00             	movzbl (%eax),%eax
c01099d2:	84 c0                	test   %al,%al
c01099d4:	74 0d                	je     c01099e3 <strcmp+0x57>
c01099d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01099d9:	0f b6 00             	movzbl (%eax),%eax
c01099dc:	84 c0                	test   %al,%al
c01099de:	75 d4                	jne    c01099b4 <strcmp+0x28>
c01099e0:	eb 01                	jmp    c01099e3 <strcmp+0x57>
c01099e2:	90                   	nop
c01099e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01099e6:	0f b6 00             	movzbl (%eax),%eax
c01099e9:	0f be d0             	movsbl %al,%edx
c01099ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01099ef:	0f b6 00             	movzbl (%eax),%eax
c01099f2:	0f be c0             	movsbl %al,%eax
c01099f5:	29 c2                	sub    %eax,%edx
c01099f7:	89 d0                	mov    %edx,%eax
c01099f9:	c9                   	leave  
c01099fa:	c3                   	ret    

c01099fb <create_user_process_address_space>:
c01099fb:	55                   	push   %ebp
c01099fc:	89 e5                	mov    %esp,%ebp
c01099fe:	83 ec 18             	sub    $0x18,%esp
c0109a01:	83 ec 08             	sub    $0x8,%esp
c0109a04:	6a 00                	push   $0x0
c0109a06:	6a 01                	push   $0x1
c0109a08:	e8 5a c8 ff ff       	call   c0106267 <alloc_memory>
c0109a0d:	83 c4 10             	add    $0x10,%esp
c0109a10:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a16:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109a1d:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109a24:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109a27:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109a2c:	c1 e8 0c             	shr    $0xc,%eax
c0109a2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109a32:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109a35:	83 c0 07             	add    $0x7,%eax
c0109a38:	c1 e8 03             	shr    $0x3,%eax
c0109a3b:	89 c2                	mov    %eax,%edx
c0109a3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a40:	89 50 04             	mov    %edx,0x4(%eax)
c0109a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a46:	8b 40 04             	mov    0x4(%eax),%eax
c0109a49:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109a4e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0109a54:	85 c0                	test   %eax,%eax
c0109a56:	0f 48 c2             	cmovs  %edx,%eax
c0109a59:	c1 f8 0c             	sar    $0xc,%eax
c0109a5c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109a5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109a62:	83 ec 08             	sub    $0x8,%esp
c0109a65:	6a 00                	push   $0x0
c0109a67:	50                   	push   %eax
c0109a68:	e8 fa c7 ff ff       	call   c0106267 <alloc_memory>
c0109a6d:	83 c4 10             	add    $0x10,%esp
c0109a70:	89 c2                	mov    %eax,%edx
c0109a72:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a75:	89 10                	mov    %edx,(%eax)
c0109a77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a7a:	83 ec 0c             	sub    $0xc,%esp
c0109a7d:	50                   	push   %eax
c0109a7e:	e8 b6 bf ff ff       	call   c0105a39 <init_bitmap>
c0109a83:	83 c4 10             	add    $0x10,%esp
c0109a86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a89:	c9                   	leave  
c0109a8a:	c3                   	ret    

c0109a8b <user_process>:
c0109a8b:	55                   	push   %ebp
c0109a8c:	89 e5                	mov    %esp,%ebp
c0109a8e:	83 ec 38             	sub    $0x38,%esp
c0109a91:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109a98:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109a9f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109aa6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0109aaa:	75 0e                	jne    c0109aba <user_process+0x2f>
c0109aac:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109ab2:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109ab8:	eb 0c                	jmp    c0109ac6 <user_process+0x3b>
c0109aba:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109ac0:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109ac6:	e8 1e 69 ff ff       	call   c01003e9 <get_running_thread_pcb>
c0109acb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109ace:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ad1:	8b 55 14             	mov    0x14(%ebp),%edx
c0109ad4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109ada:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109add:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109ae3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ae6:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109aec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109aef:	05 00 10 00 00       	add    $0x1000,%eax
c0109af4:	89 c2                	mov    %eax,%edx
c0109af6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109af9:	89 10                	mov    %edx,(%eax)
c0109afb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109afe:	8b 00                	mov    (%eax),%eax
c0109b00:	83 e8 44             	sub    $0x44,%eax
c0109b03:	89 c2                	mov    %eax,%edx
c0109b05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b08:	89 10                	mov    %edx,(%eax)
c0109b0a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b0d:	8b 00                	mov    (%eax),%eax
c0109b0f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109b12:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109b16:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109b1c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109b20:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109b24:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109b28:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109b2c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109b30:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109b34:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109b3a:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109b3e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b41:	89 50 34             	mov    %edx,0x34(%eax)
c0109b44:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109b48:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b4b:	89 50 0c             	mov    %edx,0xc(%eax)
c0109b4e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109b52:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b55:	89 50 04             	mov    %edx,0x4(%eax)
c0109b58:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109b5c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b5f:	89 50 08             	mov    %edx,0x8(%eax)
c0109b62:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109b66:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b69:	89 50 40             	mov    %edx,0x40(%eax)
c0109b6c:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109b70:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b73:	89 10                	mov    %edx,(%eax)
c0109b75:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b78:	8b 55 08             	mov    0x8(%ebp),%edx
c0109b7b:	89 50 30             	mov    %edx,0x30(%eax)
c0109b7e:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109b82:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b85:	89 50 38             	mov    %edx,0x38(%eax)
c0109b88:	83 ec 08             	sub    $0x8,%esp
c0109b8b:	6a 01                	push   $0x1
c0109b8d:	68 00 f0 ff bf       	push   $0xbffff000
c0109b92:	e8 08 c6 ff ff       	call   c010619f <alloc_physical_memory>
c0109b97:	83 c4 10             	add    $0x10,%esp
c0109b9a:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109ba0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ba3:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109ba6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ba9:	83 ec 0c             	sub    $0xc,%esp
c0109bac:	50                   	push   %eax
c0109bad:	e8 0a 67 ff ff       	call   c01002bc <restart>
c0109bb2:	83 c4 10             	add    $0x10,%esp
c0109bb5:	90                   	nop
c0109bb6:	c9                   	leave  
c0109bb7:	c3                   	ret    

c0109bb8 <clone_pcb>:
c0109bb8:	55                   	push   %ebp
c0109bb9:	89 e5                	mov    %esp,%ebp
c0109bbb:	83 ec 38             	sub    $0x38,%esp
c0109bbe:	83 ec 08             	sub    $0x8,%esp
c0109bc1:	6a 00                	push   $0x0
c0109bc3:	6a 01                	push   $0x1
c0109bc5:	e8 9d c6 ff ff       	call   c0106267 <alloc_memory>
c0109bca:	83 c4 10             	add    $0x10,%esp
c0109bcd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109bd0:	83 ec 04             	sub    $0x4,%esp
c0109bd3:	68 00 10 00 00       	push   $0x1000
c0109bd8:	6a 00                	push   $0x0
c0109bda:	ff 75 f4             	pushl  -0xc(%ebp)
c0109bdd:	e8 0d 26 00 00       	call   c010c1ef <Memset>
c0109be2:	83 c4 10             	add    $0x10,%esp
c0109be5:	83 ec 04             	sub    $0x4,%esp
c0109be8:	68 00 10 00 00       	push   $0x1000
c0109bed:	ff 75 08             	pushl  0x8(%ebp)
c0109bf0:	ff 75 f4             	pushl  -0xc(%ebp)
c0109bf3:	e8 a4 d1 ff ff       	call   c0106d9c <Memcpy>
c0109bf8:	83 c4 10             	add    $0x10,%esp
c0109bfb:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0109c00:	8d 50 01             	lea    0x1(%eax),%edx
c0109c03:	89 15 c8 06 11 c0    	mov    %edx,0xc01106c8
c0109c09:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109c0c:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109c12:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c15:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109c1b:	89 c2                	mov    %eax,%edx
c0109c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c20:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109c26:	83 ec 08             	sub    $0x8,%esp
c0109c29:	6a 00                	push   $0x0
c0109c2b:	6a 01                	push   $0x1
c0109c2d:	e8 35 c6 ff ff       	call   c0106267 <alloc_memory>
c0109c32:	83 c4 10             	add    $0x10,%esp
c0109c35:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109c38:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c3b:	05 00 0c 00 00       	add    $0xc00,%eax
c0109c40:	83 ec 04             	sub    $0x4,%esp
c0109c43:	68 00 04 00 00       	push   $0x400
c0109c48:	68 00 fc ff ff       	push   $0xfffffc00
c0109c4d:	50                   	push   %eax
c0109c4e:	e8 49 d1 ff ff       	call   c0106d9c <Memcpy>
c0109c53:	83 c4 10             	add    $0x10,%esp
c0109c56:	83 ec 0c             	sub    $0xc,%esp
c0109c59:	ff 75 f0             	pushl  -0x10(%ebp)
c0109c5c:	e8 1d c4 ff ff       	call   c010607e <get_physical_address>
c0109c61:	83 c4 10             	add    $0x10,%esp
c0109c64:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109c67:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c6a:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109c6f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109c72:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109c75:	83 c8 07             	or     $0x7,%eax
c0109c78:	89 c2                	mov    %eax,%edx
c0109c7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109c7d:	89 10                	mov    %edx,(%eax)
c0109c7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c82:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109c85:	89 50 08             	mov    %edx,0x8(%eax)
c0109c88:	e8 6e fd ff ff       	call   c01099fb <create_user_process_address_space>
c0109c8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c90:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109c93:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c96:	89 50 0c             	mov    %edx,0xc(%eax)
c0109c99:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c9c:	8b 40 0c             	mov    0xc(%eax),%eax
c0109c9f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109ca2:	83 ec 04             	sub    $0x4,%esp
c0109ca5:	6a 0c                	push   $0xc
c0109ca7:	ff 75 e0             	pushl  -0x20(%ebp)
c0109caa:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109cad:	e8 ea d0 ff ff       	call   c0106d9c <Memcpy>
c0109cb2:	83 c4 10             	add    $0x10,%esp
c0109cb5:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109cbc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109cbf:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109cc4:	c1 e8 0c             	shr    $0xc,%eax
c0109cc7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109cca:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109ccd:	83 c0 07             	add    $0x7,%eax
c0109cd0:	c1 e8 03             	shr    $0x3,%eax
c0109cd3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109cd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109cd9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109cdc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109cdf:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109ce4:	c1 e8 0c             	shr    $0xc,%eax
c0109ce7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109cea:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109ced:	83 ec 08             	sub    $0x8,%esp
c0109cf0:	6a 00                	push   $0x0
c0109cf2:	50                   	push   %eax
c0109cf3:	e8 6f c5 ff ff       	call   c0106267 <alloc_memory>
c0109cf8:	83 c4 10             	add    $0x10,%esp
c0109cfb:	89 c2                	mov    %eax,%edx
c0109cfd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d00:	89 10                	mov    %edx,(%eax)
c0109d02:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109d05:	c1 e0 0c             	shl    $0xc,%eax
c0109d08:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109d0b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d0e:	8b 10                	mov    (%eax),%edx
c0109d10:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d13:	8b 00                	mov    (%eax),%eax
c0109d15:	83 ec 04             	sub    $0x4,%esp
c0109d18:	ff 75 cc             	pushl  -0x34(%ebp)
c0109d1b:	52                   	push   %edx
c0109d1c:	50                   	push   %eax
c0109d1d:	e8 7a d0 ff ff       	call   c0106d9c <Memcpy>
c0109d22:	83 c4 10             	add    $0x10,%esp
c0109d25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d28:	c9                   	leave  
c0109d29:	c3                   	ret    

c0109d2a <build_body_stack>:
c0109d2a:	55                   	push   %ebp
c0109d2b:	89 e5                	mov    %esp,%ebp
c0109d2d:	83 ec 48             	sub    $0x48,%esp
c0109d30:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d33:	8b 40 0c             	mov    0xc(%eax),%eax
c0109d36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109d39:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d3c:	8b 50 04             	mov    0x4(%eax),%edx
c0109d3f:	8b 00                	mov    (%eax),%eax
c0109d41:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109d44:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109d47:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109d4a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109d4d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109d50:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109d53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d56:	8b 40 08             	mov    0x8(%eax),%eax
c0109d59:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109d5c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109d63:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109d6a:	e8 c9 cf ff ff       	call   c0106d38 <intr_disable>
c0109d6f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109d72:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109d79:	e9 c2 00 00 00       	jmp    c0109e40 <build_body_stack+0x116>
c0109d7e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109d81:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d84:	01 d0                	add    %edx,%eax
c0109d86:	0f b6 00             	movzbl (%eax),%eax
c0109d89:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109d8c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109d93:	e9 9a 00 00 00       	jmp    c0109e32 <build_body_stack+0x108>
c0109d98:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109d9c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109d9f:	89 c1                	mov    %eax,%ecx
c0109da1:	d3 fa                	sar    %cl,%edx
c0109da3:	89 d0                	mov    %edx,%eax
c0109da5:	83 e0 01             	and    $0x1,%eax
c0109da8:	85 c0                	test   %eax,%eax
c0109daa:	75 06                	jne    c0109db2 <build_body_stack+0x88>
c0109dac:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109db0:	eb 7c                	jmp    c0109e2e <build_body_stack+0x104>
c0109db2:	8b 45 08             	mov    0x8(%ebp),%eax
c0109db5:	8b 40 08             	mov    0x8(%eax),%eax
c0109db8:	83 ec 0c             	sub    $0xc,%esp
c0109dbb:	50                   	push   %eax
c0109dbc:	e8 0c 66 ff ff       	call   c01003cd <update_cr3>
c0109dc1:	83 c4 10             	add    $0x10,%esp
c0109dc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dc7:	c1 e0 0c             	shl    $0xc,%eax
c0109dca:	89 c2                	mov    %eax,%edx
c0109dcc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109dcf:	01 d0                	add    %edx,%eax
c0109dd1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109dd4:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109dd7:	8b 45 10             	mov    0x10(%ebp),%eax
c0109dda:	83 ec 04             	sub    $0x4,%esp
c0109ddd:	68 00 10 00 00       	push   $0x1000
c0109de2:	52                   	push   %edx
c0109de3:	50                   	push   %eax
c0109de4:	e8 b3 cf ff ff       	call   c0106d9c <Memcpy>
c0109de9:	83 c4 10             	add    $0x10,%esp
c0109dec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109def:	8b 40 08             	mov    0x8(%eax),%eax
c0109df2:	83 ec 0c             	sub    $0xc,%esp
c0109df5:	50                   	push   %eax
c0109df6:	e8 d2 65 ff ff       	call   c01003cd <update_cr3>
c0109dfb:	83 c4 10             	add    $0x10,%esp
c0109dfe:	83 ec 08             	sub    $0x8,%esp
c0109e01:	ff 75 cc             	pushl  -0x34(%ebp)
c0109e04:	6a 01                	push   $0x1
c0109e06:	e8 be c4 ff ff       	call   c01062c9 <get_a_virtual_page>
c0109e0b:	83 c4 10             	add    $0x10,%esp
c0109e0e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109e11:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109e14:	83 ec 04             	sub    $0x4,%esp
c0109e17:	68 00 10 00 00       	push   $0x1000
c0109e1c:	52                   	push   %edx
c0109e1d:	50                   	push   %eax
c0109e1e:	e8 79 cf ff ff       	call   c0106d9c <Memcpy>
c0109e23:	83 c4 10             	add    $0x10,%esp
c0109e26:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109e2a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109e2e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109e32:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109e36:	0f 8e 5c ff ff ff    	jle    c0109d98 <build_body_stack+0x6e>
c0109e3c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109e40:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e43:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109e46:	0f 87 32 ff ff ff    	ja     c0109d7e <build_body_stack+0x54>
c0109e4c:	83 ec 0c             	sub    $0xc,%esp
c0109e4f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109e52:	e8 0a cf ff ff       	call   c0106d61 <intr_set_status>
c0109e57:	83 c4 10             	add    $0x10,%esp
c0109e5a:	90                   	nop
c0109e5b:	c9                   	leave  
c0109e5c:	c3                   	ret    

c0109e5d <build_process_kernel_stack>:
c0109e5d:	55                   	push   %ebp
c0109e5e:	89 e5                	mov    %esp,%ebp
c0109e60:	83 ec 28             	sub    $0x28,%esp
c0109e63:	e8 d0 ce ff ff       	call   c0106d38 <intr_disable>
c0109e68:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109e6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e6e:	05 00 10 00 00       	add    $0x1000,%eax
c0109e73:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e79:	8b 00                	mov    (%eax),%eax
c0109e7b:	83 f8 38             	cmp    $0x38,%eax
c0109e7e:	74 06                	je     c0109e86 <build_process_kernel_stack+0x29>
c0109e80:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109e84:	eb f0                	jmp    c0109e76 <build_process_kernel_stack+0x19>
c0109e86:	90                   	nop
c0109e87:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e8a:	05 00 10 00 00       	add    $0x1000,%eax
c0109e8f:	89 c2                	mov    %eax,%edx
c0109e91:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e94:	89 50 04             	mov    %edx,0x4(%eax)
c0109e97:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e9a:	83 c0 2c             	add    $0x2c,%eax
c0109e9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ea3:	83 e8 04             	sub    $0x4,%eax
c0109ea6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109ea9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109eac:	83 e8 08             	sub    $0x8,%eax
c0109eaf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109eb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109eb5:	83 e8 0c             	sub    $0xc,%eax
c0109eb8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109ebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ebe:	83 e8 10             	sub    $0x10,%eax
c0109ec1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109ec4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ec7:	83 e8 14             	sub    $0x14,%eax
c0109eca:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109ecd:	ba ad 02 10 c0       	mov    $0xc01002ad,%edx
c0109ed2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109ed5:	89 10                	mov    %edx,(%eax)
c0109ed7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109eda:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109ee0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109ee3:	8b 10                	mov    (%eax),%edx
c0109ee5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109ee8:	89 10                	mov    %edx,(%eax)
c0109eea:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109eed:	8b 10                	mov    (%eax),%edx
c0109eef:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ef2:	89 10                	mov    %edx,(%eax)
c0109ef4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ef7:	8b 10                	mov    (%eax),%edx
c0109ef9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109efc:	89 10                	mov    %edx,(%eax)
c0109efe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109f01:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109f07:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f0a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109f0d:	89 10                	mov    %edx,(%eax)
c0109f0f:	83 ec 0c             	sub    $0xc,%esp
c0109f12:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f15:	e8 47 ce ff ff       	call   c0106d61 <intr_set_status>
c0109f1a:	83 c4 10             	add    $0x10,%esp
c0109f1d:	90                   	nop
c0109f1e:	c9                   	leave  
c0109f1f:	c3                   	ret    

c0109f20 <fork_process>:
c0109f20:	55                   	push   %ebp
c0109f21:	89 e5                	mov    %esp,%ebp
c0109f23:	83 ec 18             	sub    $0x18,%esp
c0109f26:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f29:	83 ec 0c             	sub    $0xc,%esp
c0109f2c:	50                   	push   %eax
c0109f2d:	e8 b4 99 ff ff       	call   c01038e6 <pid2proc>
c0109f32:	83 c4 10             	add    $0x10,%esp
c0109f35:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109f38:	83 ec 0c             	sub    $0xc,%esp
c0109f3b:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f3e:	e8 75 fc ff ff       	call   c0109bb8 <clone_pcb>
c0109f43:	83 c4 10             	add    $0x10,%esp
c0109f46:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109f49:	83 ec 08             	sub    $0x8,%esp
c0109f4c:	6a 00                	push   $0x0
c0109f4e:	6a 01                	push   $0x1
c0109f50:	e8 12 c3 ff ff       	call   c0106267 <alloc_memory>
c0109f55:	83 c4 10             	add    $0x10,%esp
c0109f58:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109f5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109f5e:	83 ec 04             	sub    $0x4,%esp
c0109f61:	68 00 10 00 00       	push   $0x1000
c0109f66:	6a 00                	push   $0x0
c0109f68:	50                   	push   %eax
c0109f69:	e8 81 22 00 00       	call   c010c1ef <Memset>
c0109f6e:	83 c4 10             	add    $0x10,%esp
c0109f71:	83 ec 04             	sub    $0x4,%esp
c0109f74:	ff 75 ec             	pushl  -0x14(%ebp)
c0109f77:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f7a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f7d:	e8 a8 fd ff ff       	call   c0109d2a <build_body_stack>
c0109f82:	83 c4 10             	add    $0x10,%esp
c0109f85:	83 ec 0c             	sub    $0xc,%esp
c0109f88:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f8b:	e8 cd fe ff ff       	call   c0109e5d <build_process_kernel_stack>
c0109f90:	83 c4 10             	add    $0x10,%esp
c0109f93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f96:	05 6a 02 00 00       	add    $0x26a,%eax
c0109f9b:	83 ec 08             	sub    $0x8,%esp
c0109f9e:	50                   	push   %eax
c0109f9f:	68 04 0f 11 c0       	push   $0xc0110f04
c0109fa4:	e8 c7 02 00 00       	call   c010a270 <appendToDoubleLinkList>
c0109fa9:	83 c4 10             	add    $0x10,%esp
c0109fac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109faf:	c9                   	leave  
c0109fb0:	c3                   	ret    

c0109fb1 <process_execute>:
c0109fb1:	55                   	push   %ebp
c0109fb2:	89 e5                	mov    %esp,%ebp
c0109fb4:	83 ec 28             	sub    $0x28,%esp
c0109fb7:	e8 ca 04 00 00       	call   c010a486 <thread_init>
c0109fbc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109fbf:	83 ec 0c             	sub    $0xc,%esp
c0109fc2:	ff 75 f4             	pushl  -0xc(%ebp)
c0109fc5:	e8 69 05 00 00       	call   c010a533 <thread_create>
c0109fca:	83 c4 10             	add    $0x10,%esp
c0109fcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fd0:	05 28 01 00 00       	add    $0x128,%eax
c0109fd5:	83 ec 08             	sub    $0x8,%esp
c0109fd8:	ff 75 10             	pushl  0x10(%ebp)
c0109fdb:	50                   	push   %eax
c0109fdc:	e8 2d 22 00 00       	call   c010c20e <Strcpy>
c0109fe1:	83 c4 10             	add    $0x10,%esp
c0109fe4:	83 ec 08             	sub    $0x8,%esp
c0109fe7:	6a 00                	push   $0x0
c0109fe9:	6a 01                	push   $0x1
c0109feb:	e8 77 c2 ff ff       	call   c0106267 <alloc_memory>
c0109ff0:	83 c4 10             	add    $0x10,%esp
c0109ff3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109ff6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ff9:	05 00 0c 00 00       	add    $0xc00,%eax
c0109ffe:	83 ec 04             	sub    $0x4,%esp
c010a001:	68 00 04 00 00       	push   $0x400
c010a006:	68 00 fc ff ff       	push   $0xfffffc00
c010a00b:	50                   	push   %eax
c010a00c:	e8 8b cd ff ff       	call   c0106d9c <Memcpy>
c010a011:	83 c4 10             	add    $0x10,%esp
c010a014:	83 ec 0c             	sub    $0xc,%esp
c010a017:	ff 75 f0             	pushl  -0x10(%ebp)
c010a01a:	e8 5f c0 ff ff       	call   c010607e <get_physical_address>
c010a01f:	83 c4 10             	add    $0x10,%esp
c010a022:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a025:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a028:	05 fc 0f 00 00       	add    $0xffc,%eax
c010a02d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a030:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a033:	83 c8 07             	or     $0x7,%eax
c010a036:	89 c2                	mov    %eax,%edx
c010a038:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a03b:	89 10                	mov    %edx,(%eax)
c010a03d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a040:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010a043:	89 50 08             	mov    %edx,0x8(%eax)
c010a046:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a049:	83 c0 10             	add    $0x10,%eax
c010a04c:	83 ec 0c             	sub    $0xc,%esp
c010a04f:	50                   	push   %eax
c010a050:	e8 c8 c7 ff ff       	call   c010681d <init_memory_block_desc>
c010a055:	83 c4 10             	add    $0x10,%esp
c010a058:	e8 9e f9 ff ff       	call   c01099fb <create_user_process_address_space>
c010a05d:	89 c2                	mov    %eax,%edx
c010a05f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a062:	89 50 0c             	mov    %edx,0xc(%eax)
c010a065:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a068:	8b 00                	mov    (%eax),%eax
c010a06a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a06d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a070:	c7 40 10 8b 9a 10 c0 	movl   $0xc0109a8b,0x10(%eax)
c010a077:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a07a:	8b 55 08             	mov    0x8(%ebp),%edx
c010a07d:	89 50 18             	mov    %edx,0x18(%eax)
c010a080:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a083:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a086:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a089:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a08c:	8b 55 14             	mov    0x14(%ebp),%edx
c010a08f:	89 50 20             	mov    %edx,0x20(%eax)
c010a092:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a095:	8b 55 18             	mov    0x18(%ebp),%edx
c010a098:	89 50 24             	mov    %edx,0x24(%eax)
c010a09b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010a09e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0a1:	89 50 28             	mov    %edx,0x28(%eax)
c010a0a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0a7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a0ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0b0:	8b 10                	mov    (%eax),%edx
c010a0b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0b5:	89 50 04             	mov    %edx,0x4(%eax)
c010a0b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0bb:	8b 50 04             	mov    0x4(%eax),%edx
c010a0be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0c1:	89 50 08             	mov    %edx,0x8(%eax)
c010a0c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0c7:	8b 50 08             	mov    0x8(%eax),%edx
c010a0ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0cd:	89 50 0c             	mov    %edx,0xc(%eax)
c010a0d0:	83 ec 0c             	sub    $0xc,%esp
c010a0d3:	68 ec fd 10 c0       	push   $0xc010fdec
c010a0d8:	e8 96 00 00 00       	call   c010a173 <isListEmpty>
c010a0dd:	83 c4 10             	add    $0x10,%esp
c010a0e0:	e8 53 cc ff ff       	call   c0106d38 <intr_disable>
c010a0e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a0e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0eb:	05 60 02 00 00       	add    $0x260,%eax
c010a0f0:	83 ec 08             	sub    $0x8,%esp
c010a0f3:	50                   	push   %eax
c010a0f4:	68 ec fd 10 c0       	push   $0xc010fdec
c010a0f9:	e8 72 01 00 00       	call   c010a270 <appendToDoubleLinkList>
c010a0fe:	83 c4 10             	add    $0x10,%esp
c010a101:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a104:	05 6a 02 00 00       	add    $0x26a,%eax
c010a109:	83 ec 08             	sub    $0x8,%esp
c010a10c:	50                   	push   %eax
c010a10d:	68 04 0f 11 c0       	push   $0xc0110f04
c010a112:	e8 59 01 00 00       	call   c010a270 <appendToDoubleLinkList>
c010a117:	83 c4 10             	add    $0x10,%esp
c010a11a:	83 ec 0c             	sub    $0xc,%esp
c010a11d:	ff 75 e0             	pushl  -0x20(%ebp)
c010a120:	e8 3c cc ff ff       	call   c0106d61 <intr_set_status>
c010a125:	83 c4 10             	add    $0x10,%esp
c010a128:	90                   	nop
c010a129:	c9                   	leave  
c010a12a:	c3                   	ret    
c010a12b:	66 90                	xchg   %ax,%ax
c010a12d:	66 90                	xchg   %ax,%ax
c010a12f:	90                   	nop

c010a130 <switch_to>:
c010a130:	56                   	push   %esi
c010a131:	57                   	push   %edi
c010a132:	53                   	push   %ebx
c010a133:	55                   	push   %ebp
c010a134:	89 e5                	mov    %esp,%ebp
c010a136:	8b 45 14             	mov    0x14(%ebp),%eax
c010a139:	89 20                	mov    %esp,(%eax)
c010a13b:	8b 45 18             	mov    0x18(%ebp),%eax
c010a13e:	8b 20                	mov    (%eax),%esp
c010a140:	5d                   	pop    %ebp
c010a141:	5b                   	pop    %ebx
c010a142:	5f                   	pop    %edi
c010a143:	5e                   	pop    %esi
c010a144:	c3                   	ret    

c010a145 <initDoubleLinkList>:
c010a145:	55                   	push   %ebp
c010a146:	89 e5                	mov    %esp,%ebp
c010a148:	8b 45 08             	mov    0x8(%ebp),%eax
c010a14b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a151:	8b 45 08             	mov    0x8(%ebp),%eax
c010a154:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a15b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a15e:	8d 50 08             	lea    0x8(%eax),%edx
c010a161:	8b 45 08             	mov    0x8(%ebp),%eax
c010a164:	89 50 04             	mov    %edx,0x4(%eax)
c010a167:	8b 55 08             	mov    0x8(%ebp),%edx
c010a16a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a16d:	89 50 08             	mov    %edx,0x8(%eax)
c010a170:	90                   	nop
c010a171:	5d                   	pop    %ebp
c010a172:	c3                   	ret    

c010a173 <isListEmpty>:
c010a173:	55                   	push   %ebp
c010a174:	89 e5                	mov    %esp,%ebp
c010a176:	8b 45 08             	mov    0x8(%ebp),%eax
c010a179:	8b 40 04             	mov    0x4(%eax),%eax
c010a17c:	8b 55 08             	mov    0x8(%ebp),%edx
c010a17f:	83 c2 08             	add    $0x8,%edx
c010a182:	39 d0                	cmp    %edx,%eax
c010a184:	75 07                	jne    c010a18d <isListEmpty+0x1a>
c010a186:	b8 01 00 00 00       	mov    $0x1,%eax
c010a18b:	eb 05                	jmp    c010a192 <isListEmpty+0x1f>
c010a18d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a192:	5d                   	pop    %ebp
c010a193:	c3                   	ret    

c010a194 <findElementInList>:
c010a194:	55                   	push   %ebp
c010a195:	89 e5                	mov    %esp,%ebp
c010a197:	83 ec 28             	sub    $0x28,%esp
c010a19a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a19e:	75 19                	jne    c010a1b9 <findElementInList+0x25>
c010a1a0:	6a 60                	push   $0x60
c010a1a2:	68 95 c1 10 c0       	push   $0xc010c195
c010a1a7:	68 95 c1 10 c0       	push   $0xc010c195
c010a1ac:	68 a8 c1 10 c0       	push   $0xc010c1a8
c010a1b1:	e8 ff e7 ff ff       	call   c01089b5 <assertion_failure>
c010a1b6:	83 c4 10             	add    $0x10,%esp
c010a1b9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a1bd:	75 19                	jne    c010a1d8 <findElementInList+0x44>
c010a1bf:	6a 61                	push   $0x61
c010a1c1:	68 95 c1 10 c0       	push   $0xc010c195
c010a1c6:	68 95 c1 10 c0       	push   $0xc010c195
c010a1cb:	68 b4 c1 10 c0       	push   $0xc010c1b4
c010a1d0:	e8 e0 e7 ff ff       	call   c01089b5 <assertion_failure>
c010a1d5:	83 c4 10             	add    $0x10,%esp
c010a1d8:	e8 5b cb ff ff       	call   c0106d38 <intr_disable>
c010a1dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a1e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a1e7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1ea:	8b 40 08             	mov    0x8(%eax),%eax
c010a1ed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a1f0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1f3:	8b 40 04             	mov    0x4(%eax),%eax
c010a1f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a1f9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a1fd:	75 07                	jne    c010a206 <findElementInList+0x72>
c010a1ff:	b8 00 00 00 00       	mov    $0x0,%eax
c010a204:	eb 68                	jmp    c010a26e <findElementInList+0xda>
c010a206:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a209:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a20c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a20f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a212:	c1 f8 03             	sar    $0x3,%eax
c010a215:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a218:	eb 36                	jmp    c010a250 <findElementInList+0xbc>
c010a21a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a21d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a220:	75 07                	jne    c010a229 <findElementInList+0x95>
c010a222:	b8 01 00 00 00       	mov    $0x1,%eax
c010a227:	eb 45                	jmp    c010a26e <findElementInList+0xda>
c010a229:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a22d:	75 07                	jne    c010a236 <findElementInList+0xa2>
c010a22f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a234:	eb 38                	jmp    c010a26e <findElementInList+0xda>
c010a236:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a239:	8b 40 04             	mov    0x4(%eax),%eax
c010a23c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a23f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a243:	75 07                	jne    c010a24c <findElementInList+0xb8>
c010a245:	b8 00 00 00 00       	mov    $0x0,%eax
c010a24a:	eb 22                	jmp    c010a26e <findElementInList+0xda>
c010a24c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a250:	8b 45 08             	mov    0x8(%ebp),%eax
c010a253:	83 c0 08             	add    $0x8,%eax
c010a256:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a259:	75 bf                	jne    c010a21a <findElementInList+0x86>
c010a25b:	83 ec 0c             	sub    $0xc,%esp
c010a25e:	ff 75 ec             	pushl  -0x14(%ebp)
c010a261:	e8 fb ca ff ff       	call   c0106d61 <intr_set_status>
c010a266:	83 c4 10             	add    $0x10,%esp
c010a269:	b8 00 00 00 00       	mov    $0x0,%eax
c010a26e:	c9                   	leave  
c010a26f:	c3                   	ret    

c010a270 <appendToDoubleLinkList>:
c010a270:	55                   	push   %ebp
c010a271:	89 e5                	mov    %esp,%ebp
c010a273:	83 ec 18             	sub    $0x18,%esp
c010a276:	83 ec 08             	sub    $0x8,%esp
c010a279:	ff 75 0c             	pushl  0xc(%ebp)
c010a27c:	ff 75 08             	pushl  0x8(%ebp)
c010a27f:	e8 10 ff ff ff       	call   c010a194 <findElementInList>
c010a284:	83 c4 10             	add    $0x10,%esp
c010a287:	3c 01                	cmp    $0x1,%al
c010a289:	0f 84 c2 00 00 00    	je     c010a351 <appendToDoubleLinkList+0xe1>
c010a28f:	e8 a4 ca ff ff       	call   c0106d38 <intr_disable>
c010a294:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a297:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a29b:	75 1c                	jne    c010a2b9 <appendToDoubleLinkList+0x49>
c010a29d:	68 9e 00 00 00       	push   $0x9e
c010a2a2:	68 95 c1 10 c0       	push   $0xc010c195
c010a2a7:	68 95 c1 10 c0       	push   $0xc010c195
c010a2ac:	68 a8 c1 10 c0       	push   $0xc010c1a8
c010a2b1:	e8 ff e6 ff ff       	call   c01089b5 <assertion_failure>
c010a2b6:	83 c4 10             	add    $0x10,%esp
c010a2b9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a2bd:	75 1c                	jne    c010a2db <appendToDoubleLinkList+0x6b>
c010a2bf:	68 9f 00 00 00       	push   $0x9f
c010a2c4:	68 95 c1 10 c0       	push   $0xc010c195
c010a2c9:	68 95 c1 10 c0       	push   $0xc010c195
c010a2ce:	68 b4 c1 10 c0       	push   $0xc010c1b4
c010a2d3:	e8 dd e6 ff ff       	call   c01089b5 <assertion_failure>
c010a2d8:	83 c4 10             	add    $0x10,%esp
c010a2db:	83 ec 08             	sub    $0x8,%esp
c010a2de:	ff 75 0c             	pushl  0xc(%ebp)
c010a2e1:	ff 75 08             	pushl  0x8(%ebp)
c010a2e4:	e8 ab fe ff ff       	call   c010a194 <findElementInList>
c010a2e9:	83 c4 10             	add    $0x10,%esp
c010a2ec:	3c 01                	cmp    $0x1,%al
c010a2ee:	74 64                	je     c010a354 <appendToDoubleLinkList+0xe4>
c010a2f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a2f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a2f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2f9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a300:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a303:	8b 50 04             	mov    0x4(%eax),%edx
c010a306:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a309:	89 10                	mov    %edx,(%eax)
c010a30b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a30e:	8b 50 08             	mov    0x8(%eax),%edx
c010a311:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a314:	89 10                	mov    %edx,(%eax)
c010a316:	8b 45 08             	mov    0x8(%ebp),%eax
c010a319:	8b 40 08             	mov    0x8(%eax),%eax
c010a31c:	85 c0                	test   %eax,%eax
c010a31e:	74 0c                	je     c010a32c <appendToDoubleLinkList+0xbc>
c010a320:	8b 45 08             	mov    0x8(%ebp),%eax
c010a323:	8b 40 08             	mov    0x8(%eax),%eax
c010a326:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a329:	89 50 04             	mov    %edx,0x4(%eax)
c010a32c:	8b 45 08             	mov    0x8(%ebp),%eax
c010a32f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a332:	89 50 08             	mov    %edx,0x8(%eax)
c010a335:	8b 45 08             	mov    0x8(%ebp),%eax
c010a338:	8d 50 08             	lea    0x8(%eax),%edx
c010a33b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a33e:	89 50 04             	mov    %edx,0x4(%eax)
c010a341:	83 ec 0c             	sub    $0xc,%esp
c010a344:	ff 75 f4             	pushl  -0xc(%ebp)
c010a347:	e8 15 ca ff ff       	call   c0106d61 <intr_set_status>
c010a34c:	83 c4 10             	add    $0x10,%esp
c010a34f:	eb 04                	jmp    c010a355 <appendToDoubleLinkList+0xe5>
c010a351:	90                   	nop
c010a352:	eb 01                	jmp    c010a355 <appendToDoubleLinkList+0xe5>
c010a354:	90                   	nop
c010a355:	c9                   	leave  
c010a356:	c3                   	ret    

c010a357 <insertToDoubleLinkList>:
c010a357:	55                   	push   %ebp
c010a358:	89 e5                	mov    %esp,%ebp
c010a35a:	83 ec 18             	sub    $0x18,%esp
c010a35d:	83 ec 08             	sub    $0x8,%esp
c010a360:	ff 75 0c             	pushl  0xc(%ebp)
c010a363:	ff 75 08             	pushl  0x8(%ebp)
c010a366:	e8 29 fe ff ff       	call   c010a194 <findElementInList>
c010a36b:	83 c4 10             	add    $0x10,%esp
c010a36e:	3c 01                	cmp    $0x1,%al
c010a370:	74 65                	je     c010a3d7 <insertToDoubleLinkList+0x80>
c010a372:	e8 c1 c9 ff ff       	call   c0106d38 <intr_disable>
c010a377:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a37a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a37d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a380:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a383:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a38a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a38d:	8b 50 04             	mov    0x4(%eax),%edx
c010a390:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a393:	89 10                	mov    %edx,(%eax)
c010a395:	8b 45 08             	mov    0x8(%ebp),%eax
c010a398:	8b 50 04             	mov    0x4(%eax),%edx
c010a39b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a39e:	89 50 04             	mov    %edx,0x4(%eax)
c010a3a1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3a4:	8b 40 04             	mov    0x4(%eax),%eax
c010a3a7:	85 c0                	test   %eax,%eax
c010a3a9:	74 0b                	je     c010a3b6 <insertToDoubleLinkList+0x5f>
c010a3ab:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3ae:	8b 40 04             	mov    0x4(%eax),%eax
c010a3b1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a3b4:	89 10                	mov    %edx,(%eax)
c010a3b6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a3bc:	89 50 04             	mov    %edx,0x4(%eax)
c010a3bf:	8b 55 08             	mov    0x8(%ebp),%edx
c010a3c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3c5:	89 10                	mov    %edx,(%eax)
c010a3c7:	83 ec 0c             	sub    $0xc,%esp
c010a3ca:	ff 75 f4             	pushl  -0xc(%ebp)
c010a3cd:	e8 8f c9 ff ff       	call   c0106d61 <intr_set_status>
c010a3d2:	83 c4 10             	add    $0x10,%esp
c010a3d5:	eb 01                	jmp    c010a3d8 <insertToDoubleLinkList+0x81>
c010a3d7:	90                   	nop
c010a3d8:	c9                   	leave  
c010a3d9:	c3                   	ret    

c010a3da <popFromDoubleLinkList>:
c010a3da:	55                   	push   %ebp
c010a3db:	89 e5                	mov    %esp,%ebp
c010a3dd:	83 ec 18             	sub    $0x18,%esp
c010a3e0:	e8 53 c9 ff ff       	call   c0106d38 <intr_disable>
c010a3e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a3e8:	83 ec 0c             	sub    $0xc,%esp
c010a3eb:	ff 75 08             	pushl  0x8(%ebp)
c010a3ee:	e8 80 fd ff ff       	call   c010a173 <isListEmpty>
c010a3f3:	83 c4 10             	add    $0x10,%esp
c010a3f6:	3c 01                	cmp    $0x1,%al
c010a3f8:	75 07                	jne    c010a401 <popFromDoubleLinkList+0x27>
c010a3fa:	b8 00 00 00 00       	mov    $0x0,%eax
c010a3ff:	eb 6b                	jmp    c010a46c <popFromDoubleLinkList+0x92>
c010a401:	8b 45 08             	mov    0x8(%ebp),%eax
c010a404:	8b 40 08             	mov    0x8(%eax),%eax
c010a407:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a40a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a40d:	8b 40 08             	mov    0x8(%eax),%eax
c010a410:	85 c0                	test   %eax,%eax
c010a412:	75 07                	jne    c010a41b <popFromDoubleLinkList+0x41>
c010a414:	b8 00 00 00 00       	mov    $0x0,%eax
c010a419:	eb 51                	jmp    c010a46c <popFromDoubleLinkList+0x92>
c010a41b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a41e:	8b 40 08             	mov    0x8(%eax),%eax
c010a421:	8b 00                	mov    (%eax),%eax
c010a423:	85 c0                	test   %eax,%eax
c010a425:	74 11                	je     c010a438 <popFromDoubleLinkList+0x5e>
c010a427:	8b 45 08             	mov    0x8(%ebp),%eax
c010a42a:	8b 40 08             	mov    0x8(%eax),%eax
c010a42d:	8b 00                	mov    (%eax),%eax
c010a42f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a432:	83 c2 08             	add    $0x8,%edx
c010a435:	89 50 04             	mov    %edx,0x4(%eax)
c010a438:	8b 45 08             	mov    0x8(%ebp),%eax
c010a43b:	8b 40 08             	mov    0x8(%eax),%eax
c010a43e:	8b 10                	mov    (%eax),%edx
c010a440:	8b 45 08             	mov    0x8(%ebp),%eax
c010a443:	89 50 08             	mov    %edx,0x8(%eax)
c010a446:	83 ec 0c             	sub    $0xc,%esp
c010a449:	ff 75 f4             	pushl  -0xc(%ebp)
c010a44c:	e8 10 c9 ff ff       	call   c0106d61 <intr_set_status>
c010a451:	83 c4 10             	add    $0x10,%esp
c010a454:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a457:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a45e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a461:	8b 50 04             	mov    0x4(%eax),%edx
c010a464:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a467:	89 10                	mov    %edx,(%eax)
c010a469:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a46c:	c9                   	leave  
c010a46d:	c3                   	ret    

c010a46e <kernel_thread>:
c010a46e:	55                   	push   %ebp
c010a46f:	89 e5                	mov    %esp,%ebp
c010a471:	83 ec 08             	sub    $0x8,%esp
c010a474:	fb                   	sti    
c010a475:	83 ec 0c             	sub    $0xc,%esp
c010a478:	ff 75 0c             	pushl  0xc(%ebp)
c010a47b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a47e:	ff d0                	call   *%eax
c010a480:	83 c4 10             	add    $0x10,%esp
c010a483:	90                   	nop
c010a484:	c9                   	leave  
c010a485:	c3                   	ret    

c010a486 <thread_init>:
c010a486:	55                   	push   %ebp
c010a487:	89 e5                	mov    %esp,%ebp
c010a489:	83 ec 18             	sub    $0x18,%esp
c010a48c:	83 ec 08             	sub    $0x8,%esp
c010a48f:	6a 00                	push   $0x0
c010a491:	6a 01                	push   $0x1
c010a493:	e8 cf bd ff ff       	call   c0106267 <alloc_memory>
c010a498:	83 c4 10             	add    $0x10,%esp
c010a49b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a49e:	83 ec 04             	sub    $0x4,%esp
c010a4a1:	68 00 10 00 00       	push   $0x1000
c010a4a6:	6a 00                	push   $0x0
c010a4a8:	ff 75 f4             	pushl  -0xc(%ebp)
c010a4ab:	e8 3f 1d 00 00       	call   c010c1ef <Memset>
c010a4b0:	83 c4 10             	add    $0x10,%esp
c010a4b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4b6:	05 00 10 00 00       	add    $0x1000,%eax
c010a4bb:	89 c2                	mov    %eax,%edx
c010a4bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4c0:	89 10                	mov    %edx,(%eax)
c010a4c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4c5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a4cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4cf:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a4d6:	ff ff ff 
c010a4d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4dc:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a4e3:	00 00 00 
c010a4e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4e9:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a4ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4f2:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a4f8:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a4fd:	83 c0 01             	add    $0x1,%eax
c010a500:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a505:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a50b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a50e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a514:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a517:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a51e:	00 00 00 
c010a521:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a524:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a52b:	cd ab 99 
c010a52e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a531:	c9                   	leave  
c010a532:	c3                   	ret    

c010a533 <thread_create>:
c010a533:	55                   	push   %ebp
c010a534:	89 e5                	mov    %esp,%ebp
c010a536:	83 ec 10             	sub    $0x10,%esp
c010a539:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a540:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a547:	8b 45 08             	mov    0x8(%ebp),%eax
c010a54a:	8b 00                	mov    (%eax),%eax
c010a54c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a54f:	89 c2                	mov    %eax,%edx
c010a551:	8b 45 08             	mov    0x8(%ebp),%eax
c010a554:	89 10                	mov    %edx,(%eax)
c010a556:	8b 45 08             	mov    0x8(%ebp),%eax
c010a559:	8b 00                	mov    (%eax),%eax
c010a55b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a55e:	89 c2                	mov    %eax,%edx
c010a560:	8b 45 08             	mov    0x8(%ebp),%eax
c010a563:	89 10                	mov    %edx,(%eax)
c010a565:	90                   	nop
c010a566:	c9                   	leave  
c010a567:	c3                   	ret    

c010a568 <thread_start>:
c010a568:	55                   	push   %ebp
c010a569:	89 e5                	mov    %esp,%ebp
c010a56b:	83 ec 18             	sub    $0x18,%esp
c010a56e:	e8 13 ff ff ff       	call   c010a486 <thread_init>
c010a573:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a576:	83 ec 0c             	sub    $0xc,%esp
c010a579:	ff 75 f4             	pushl  -0xc(%ebp)
c010a57c:	e8 b2 ff ff ff       	call   c010a533 <thread_create>
c010a581:	83 c4 10             	add    $0x10,%esp
c010a584:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a587:	05 28 01 00 00       	add    $0x128,%eax
c010a58c:	83 ec 08             	sub    $0x8,%esp
c010a58f:	ff 75 10             	pushl  0x10(%ebp)
c010a592:	50                   	push   %eax
c010a593:	e8 76 1c 00 00       	call   c010c20e <Strcpy>
c010a598:	83 c4 10             	add    $0x10,%esp
c010a59b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a59e:	8b 00                	mov    (%eax),%eax
c010a5a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a5a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5a6:	c7 40 10 6e a4 10 c0 	movl   $0xc010a46e,0x10(%eax)
c010a5ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5b0:	8b 55 08             	mov    0x8(%ebp),%edx
c010a5b3:	89 50 18             	mov    %edx,0x18(%eax)
c010a5b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5b9:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a5bc:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a5bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5c2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a5c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5cb:	8b 10                	mov    (%eax),%edx
c010a5cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5d0:	89 50 04             	mov    %edx,0x4(%eax)
c010a5d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5d6:	8b 50 04             	mov    0x4(%eax),%edx
c010a5d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5dc:	89 50 08             	mov    %edx,0x8(%eax)
c010a5df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5e2:	8b 50 08             	mov    0x8(%eax),%edx
c010a5e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5e8:	89 50 0c             	mov    %edx,0xc(%eax)
c010a5eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5ee:	05 60 02 00 00       	add    $0x260,%eax
c010a5f3:	83 ec 08             	sub    $0x8,%esp
c010a5f6:	50                   	push   %eax
c010a5f7:	68 ec fd 10 c0       	push   $0xc010fdec
c010a5fc:	e8 6f fc ff ff       	call   c010a270 <appendToDoubleLinkList>
c010a601:	83 c4 10             	add    $0x10,%esp
c010a604:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a607:	05 6a 02 00 00       	add    $0x26a,%eax
c010a60c:	83 ec 08             	sub    $0x8,%esp
c010a60f:	50                   	push   %eax
c010a610:	68 04 0f 11 c0       	push   $0xc0110f04
c010a615:	e8 56 fc ff ff       	call   c010a270 <appendToDoubleLinkList>
c010a61a:	83 c4 10             	add    $0x10,%esp
c010a61d:	90                   	nop
c010a61e:	c9                   	leave  
c010a61f:	c3                   	ret    

c010a620 <Buf>:
	...

c010a636 <My_Buf>:
c010a636:	48                   	dec    %eax
c010a637:	65 6c                	gs insb (%dx),%es:(%edi)
c010a639:	6c                   	insb   (%dx),%es:(%edi)
c010a63a:	6f                   	outsl  %ds:(%esi),(%dx)
c010a63b:	2c 57                	sub    $0x57,%al
c010a63d:	6f                   	outsl  %ds:(%esi),(%dx)
c010a63e:	72 6c                	jb     c010a6ac <DriverInitialize+0x69>
c010a640:	64 5c                	fs pop %esp
c010a642:	30                   	.byte 0x30

c010a643 <DriverInitialize>:
c010a643:	56                   	push   %esi
c010a644:	57                   	push   %edi
c010a645:	53                   	push   %ebx
c010a646:	55                   	push   %ebp
c010a647:	51                   	push   %ecx
c010a648:	89 e5                	mov    %esp,%ebp
c010a64a:	b0 21                	mov    $0x21,%al
c010a64c:	66 ba 00 03          	mov    $0x300,%dx
c010a650:	ee                   	out    %al,(%dx)
c010a651:	b0 59                	mov    $0x59,%al
c010a653:	66 ba 0e 03          	mov    $0x30e,%dx
c010a657:	ee                   	out    %al,(%dx)
c010a658:	66 ba 0a 03          	mov    $0x30a,%dx
c010a65c:	66 31 c0             	xor    %ax,%ax
c010a65f:	b0 00                	mov    $0x0,%al
c010a661:	ee                   	out    %al,(%dx)
c010a662:	66 ba 0b 03          	mov    $0x30b,%dx
c010a666:	b0 01                	mov    $0x1,%al
c010a668:	ee                   	out    %al,(%dx)
c010a669:	b0 10                	mov    $0x10,%al
c010a66b:	66 ba 0c 03          	mov    $0x30c,%dx
c010a66f:	ee                   	out    %al,(%dx)
c010a670:	b0 20                	mov    $0x20,%al
c010a672:	66 ba 04 03          	mov    $0x304,%dx
c010a676:	ee                   	out    %al,(%dx)
c010a677:	b0 02                	mov    $0x2,%al
c010a679:	66 ba 0d 03          	mov    $0x30d,%dx
c010a67d:	ee                   	out    %al,(%dx)
c010a67e:	b0 40                	mov    $0x40,%al
c010a680:	66 ba 01 03          	mov    $0x301,%dx
c010a684:	ee                   	out    %al,(%dx)
c010a685:	66 ba 03 03          	mov    $0x303,%dx
c010a689:	ee                   	out    %al,(%dx)
c010a68a:	b0 60                	mov    $0x60,%al
c010a68c:	66 ba 02 03          	mov    $0x302,%dx
c010a690:	ee                   	out    %al,(%dx)
c010a691:	b0 61                	mov    $0x61,%al
c010a693:	66 ba 00 03          	mov    $0x300,%dx
c010a697:	ee                   	out    %al,(%dx)
c010a698:	b0 40                	mov    $0x40,%al
c010a69a:	66 ba 07 03          	mov    $0x307,%dx
c010a69e:	ee                   	out    %al,(%dx)
c010a69f:	b0 22                	mov    $0x22,%al
c010a6a1:	66 ba 00 03          	mov    $0x300,%dx
c010a6a5:	ee                   	out    %al,(%dx)
c010a6a6:	b0 ff                	mov    $0xff,%al
c010a6a8:	66 ba 07 03          	mov    $0x307,%dx
c010a6ac:	ee                   	out    %al,(%dx)
c010a6ad:	b0 fb                	mov    $0xfb,%al
c010a6af:	66 ba 0f 03          	mov    $0x30f,%dx
c010a6b3:	ee                   	out    %al,(%dx)
c010a6b4:	66 ba 0d 03          	mov    $0x30d,%dx
c010a6b8:	b0 00                	mov    $0x0,%al
c010a6ba:	ee                   	out    %al,(%dx)
c010a6bb:	89 ec                	mov    %ebp,%esp
c010a6bd:	59                   	pop    %ecx
c010a6be:	5d                   	pop    %ebp
c010a6bf:	5b                   	pop    %ebx
c010a6c0:	5f                   	pop    %edi
c010a6c1:	5e                   	pop    %esi
c010a6c2:	c3                   	ret    

c010a6c3 <SetPageStart>:
c010a6c3:	56                   	push   %esi
c010a6c4:	57                   	push   %edi
c010a6c5:	53                   	push   %ebx
c010a6c6:	55                   	push   %ebp
c010a6c7:	51                   	push   %ecx
c010a6c8:	89 e5                	mov    %esp,%ebp
c010a6ca:	66 ba 08 03          	mov    $0x308,%dx
c010a6ce:	66 31 c0             	xor    %ax,%ax
c010a6d1:	66 b8 00 40          	mov    $0x4000,%ax
c010a6d5:	ee                   	out    %al,(%dx)
c010a6d6:	66 ba 09 03          	mov    $0x309,%dx
c010a6da:	66 25 00 ff          	and    $0xff00,%ax
c010a6de:	66 c1 e8 08          	shr    $0x8,%ax
c010a6e2:	ee                   	out    %al,(%dx)
c010a6e3:	89 ec                	mov    %ebp,%esp
c010a6e5:	59                   	pop    %ecx
c010a6e6:	5d                   	pop    %ebp
c010a6e7:	5b                   	pop    %ebx
c010a6e8:	5f                   	pop    %edi
c010a6e9:	5e                   	pop    %esi
c010a6ea:	c3                   	ret    

c010a6eb <DriverSend>:
c010a6eb:	56                   	push   %esi
c010a6ec:	57                   	push   %edi
c010a6ed:	53                   	push   %ebx
c010a6ee:	55                   	push   %ebp
c010a6ef:	51                   	push   %ecx
c010a6f0:	89 e5                	mov    %esp,%ebp
c010a6f2:	66 ba 00 03          	mov    $0x300,%dx
c010a6f6:	ec                   	in     (%dx),%al
c010a6f7:	3c 26                	cmp    $0x26,%al
c010a6f9:	74 57                	je     c010a752 <QueueIt>
c010a6fb:	66 51                	push   %cx
c010a6fd:	24 3f                	and    $0x3f,%al
c010a6ff:	ee                   	out    %al,(%dx)
c010a700:	66 ba 08 03          	mov    $0x308,%dx
c010a704:	66 31 c0             	xor    %ax,%ax
c010a707:	66 b8 00 40          	mov    $0x4000,%ax
c010a70b:	ee                   	out    %al,(%dx)
c010a70c:	66 ba 09 03          	mov    $0x309,%dx
c010a710:	66 25 00 ff          	and    $0xff00,%ax
c010a714:	66 c1 e8 08          	shr    $0x8,%ax
c010a718:	ee                   	out    %al,(%dx)
c010a719:	ff 75 18             	pushl  0x18(%ebp)
c010a71c:	66 87 db             	xchg   %bx,%bx
c010a71f:	e8 3f 00 00 00       	call   c010a763 <PCtoNIC>
c010a724:	83 c4 04             	add    $0x4,%esp
c010a727:	eb 2a                	jmp    c010a753 <Finished>
c010a729:	66 ba 04 03          	mov    $0x304,%dx
c010a72d:	b0 40                	mov    $0x40,%al
c010a72f:	66 b8 00 40          	mov    $0x4000,%ax
c010a733:	66 c1 e8 08          	shr    $0x8,%ax
c010a737:	66 ef                	out    %ax,(%dx)
c010a739:	66 59                	pop    %cx
c010a73b:	66 ba 05 03          	mov    $0x305,%dx
c010a73f:	88 c8                	mov    %cl,%al
c010a741:	ee                   	out    %al,(%dx)
c010a742:	66 ba 06 03          	mov    $0x306,%dx
c010a746:	88 e8                	mov    %ch,%al
c010a748:	ee                   	out    %al,(%dx)
c010a749:	66 ba 00 03          	mov    $0x300,%dx
c010a74d:	b0 26                	mov    $0x26,%al
c010a74f:	ee                   	out    %al,(%dx)
c010a750:	eb 01                	jmp    c010a753 <Finished>

c010a752 <QueueIt>:
c010a752:	90                   	nop

c010a753 <Finished>:
c010a753:	89 ec                	mov    %ebp,%esp
c010a755:	59                   	pop    %ecx
c010a756:	5d                   	pop    %ebp
c010a757:	5b                   	pop    %ebx
c010a758:	5f                   	pop    %edi
c010a759:	5e                   	pop    %esi
c010a75a:	c3                   	ret    

c010a75b <MyEnd>:
c010a75b:	89 ec                	mov    %ebp,%esp
c010a75d:	59                   	pop    %ecx
c010a75e:	5d                   	pop    %ebp
c010a75f:	5b                   	pop    %ebx
c010a760:	5f                   	pop    %edi
c010a761:	5e                   	pop    %esi
c010a762:	c3                   	ret    

c010a763 <PCtoNIC>:
c010a763:	56                   	push   %esi
c010a764:	57                   	push   %edi
c010a765:	53                   	push   %ebx
c010a766:	55                   	push   %ebp
c010a767:	51                   	push   %ecx
c010a768:	89 e5                	mov    %esp,%ebp
c010a76a:	66 bb 20 00          	mov    $0x20,%bx
c010a76e:	66 ba 0a 03          	mov    $0x30a,%dx
c010a772:	88 d8                	mov    %bl,%al
c010a774:	ee                   	out    %al,(%dx)
c010a775:	66 ba 0b 03          	mov    $0x30b,%dx
c010a779:	88 f8                	mov    %bh,%al
c010a77b:	ee                   	out    %al,(%dx)
c010a77c:	66 ba 00 03          	mov    $0x300,%dx
c010a780:	b0 12                	mov    $0x12,%al
c010a782:	ee                   	out    %al,(%dx)
c010a783:	66 ba 10 03          	mov    $0x310,%dx
c010a787:	66 b9 20 00          	mov    $0x20,%cx
c010a78b:	66 d1 e9             	shr    %cx
c010a78e:	66 b8 59 00          	mov    $0x59,%ax
c010a792:	31 f6                	xor    %esi,%esi
c010a794:	8b 74 24 18          	mov    0x18(%esp),%esi
c010a798:	e8 26 ff ff ff       	call   c010a6c3 <SetPageStart>
c010a79d:	66 ba 10 03          	mov    $0x310,%dx

c010a7a1 <Writing_Word>:
c010a7a1:	66 31 c0             	xor    %ax,%ax
c010a7a4:	66 ad                	lods   %ds:(%esi),%ax
c010a7a6:	66 ef                	out    %ax,(%dx)
c010a7a8:	e2 f7                	loop   c010a7a1 <Writing_Word>
c010a7aa:	66 b9 00 00          	mov    $0x0,%cx
c010a7ae:	66 ba 07 03          	mov    $0x307,%dx

c010a7b2 <CheckDMA>:
c010a7b2:	66 87 db             	xchg   %bx,%bx
c010a7b5:	ec                   	in     (%dx),%al
c010a7b6:	a8 40                	test   $0x40,%al
c010a7b8:	75 02                	jne    c010a7bc <toNICEND>
c010a7ba:	eb f6                	jmp    c010a7b2 <CheckDMA>

c010a7bc <toNICEND>:
c010a7bc:	66 ba 07 03          	mov    $0x307,%dx
c010a7c0:	b0 00                	mov    $0x0,%al
c010a7c2:	ee                   	out    %al,(%dx)
c010a7c3:	f8                   	clc    
c010a7c4:	89 ec                	mov    %ebp,%esp
c010a7c6:	59                   	pop    %ecx
c010a7c7:	5d                   	pop    %ebp
c010a7c8:	5b                   	pop    %ebx
c010a7c9:	5f                   	pop    %edi
c010a7ca:	5e                   	pop    %esi
c010a7cb:	c3                   	ret    

c010a7cc <get_interrupt_status>:
c010a7cc:	56                   	push   %esi
c010a7cd:	57                   	push   %edi
c010a7ce:	53                   	push   %ebx
c010a7cf:	55                   	push   %ebp
c010a7d0:	51                   	push   %ecx
c010a7d1:	89 e5                	mov    %esp,%ebp
c010a7d3:	66 ba 07 03          	mov    $0x307,%dx
c010a7d7:	31 c0                	xor    %eax,%eax
c010a7d9:	ec                   	in     (%dx),%al
c010a7da:	89 ec                	mov    %ebp,%esp
c010a7dc:	59                   	pop    %ecx
c010a7dd:	5d                   	pop    %ebp
c010a7de:	5b                   	pop    %ebx
c010a7df:	5f                   	pop    %edi
c010a7e0:	5e                   	pop    %esi
c010a7e1:	c3                   	ret    

c010a7e2 <NICtoPC>:
c010a7e2:	56                   	push   %esi
c010a7e3:	57                   	push   %edi
c010a7e4:	53                   	push   %ebx
c010a7e5:	55                   	push   %ebp
c010a7e6:	51                   	push   %ecx
c010a7e7:	89 e5                	mov    %esp,%ebp
c010a7e9:	66 bb 20 00          	mov    $0x20,%bx
c010a7ed:	66 ba 0a 03          	mov    $0x30a,%dx
c010a7f1:	88 d8                	mov    %bl,%al
c010a7f3:	ee                   	out    %al,(%dx)
c010a7f4:	66 ba 0b 03          	mov    $0x30b,%dx
c010a7f8:	88 f8                	mov    %bh,%al
c010a7fa:	ee                   	out    %al,(%dx)
c010a7fb:	66 ba 00 03          	mov    $0x300,%dx
c010a7ff:	b0 0a                	mov    $0xa,%al
c010a801:	ee                   	out    %al,(%dx)
c010a802:	66 ba 10 03          	mov    $0x310,%dx
c010a806:	e8 b8 fe ff ff       	call   c010a6c3 <SetPageStart>
c010a80b:	66 ba 10 03          	mov    $0x310,%dx
c010a80f:	66 b9 20 00          	mov    $0x20,%cx
c010a813:	66 d1 e9             	shr    %cx
c010a816:	bf 20 a6 10 c0       	mov    $0xc010a620,%edi

c010a81b <READING_Word_NICtoPC>:
c010a81b:	31 c0                	xor    %eax,%eax
c010a81d:	66 ed                	in     (%dx),%ax
c010a81f:	66 ab                	stos   %ax,%es:(%edi)
c010a821:	e2 f8                	loop   c010a81b <READING_Word_NICtoPC>
c010a823:	b8 20 a6 10 c0       	mov    $0xc010a620,%eax
c010a828:	50                   	push   %eax
c010a829:	e8 5e 58 ff ff       	call   c010008c <disp_str>
c010a82e:	83 c4 04             	add    $0x4,%esp
c010a831:	66 ba 07 03          	mov    $0x307,%dx

c010a835 <CheckDMA_NICtoPC>:
c010a835:	ec                   	in     (%dx),%al
c010a836:	a8 40                	test   $0x40,%al
c010a838:	75 02                	jne    c010a83c <ReadEnd>
c010a83a:	eb f9                	jmp    c010a835 <CheckDMA_NICtoPC>

c010a83c <ReadEnd>:
c010a83c:	ee                   	out    %al,(%dx)
c010a83d:	89 ec                	mov    %ebp,%esp
c010a83f:	59                   	pop    %ecx
c010a840:	5d                   	pop    %ebp
c010a841:	5b                   	pop    %ebx
c010a842:	5f                   	pop    %edi
c010a843:	5e                   	pop    %esi
c010a844:	c3                   	ret    
