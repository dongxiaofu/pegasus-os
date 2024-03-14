
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
c0100025:	e8 91 3c 00 00       	call   c0103cbb <ReloadGDT>
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
c010014b:	e8 b0 71 00 00       	call   c0107300 <exception_handler>
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
c0100168:	e8 93 71 00 00       	call   c0107300 <exception_handler>
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
c0100195:	e8 eb 36 00 00       	call   c0103885 <clock_handler>
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
c01001c7:	e8 44 46 00 00       	call   c0104810 <keyboard_handler>
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
c0100256:	e8 25 12 00 00       	call   c0101480 <net_handler>
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
c0100340:	e8 55 6e 00 00       	call   c010719a <disp_int>
c0100345:	83 c4 04             	add    $0x4,%esp
c0100348:	58                   	pop    %eax
c0100349:	5a                   	pop    %edx
c010034a:	52                   	push   %edx
c010034b:	50                   	push   %eax
c010034c:	e8 49 6e 00 00       	call   c010719a <disp_int>
c0100351:	58                   	pop    %eax
c0100352:	5a                   	pop    %edx
c0100353:	52                   	push   %edx
c0100354:	50                   	push   %eax
c0100355:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c010035b:	e8 3a 6e 00 00       	call   c010719a <disp_int>
c0100360:	83 c4 04             	add    $0x4,%esp
c0100363:	58                   	pop    %eax
c0100364:	5a                   	pop    %edx
c0100365:	52                   	push   %edx
c0100366:	50                   	push   %eax
c0100367:	ff 72 ec             	pushl  -0x14(%edx)
c010036a:	e8 2b 6e 00 00       	call   c010719a <disp_int>
c010036f:	83 c4 04             	add    $0x4,%esp
c0100372:	58                   	pop    %eax
c0100373:	5a                   	pop    %edx
c0100374:	52                   	push   %edx
c0100375:	50                   	push   %eax
c0100376:	ff 70 ec             	pushl  -0x14(%eax)
c0100379:	e8 1c 6e 00 00       	call   c010719a <disp_int>
c010037e:	83 c4 04             	add    $0x4,%esp
c0100381:	58                   	pop    %eax
c0100382:	5a                   	pop    %edx
c0100383:	52                   	push   %edx
c0100384:	50                   	push   %eax
c0100385:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c010038b:	e8 0a 6e 00 00       	call   c010719a <disp_int>
c0100390:	83 c4 04             	add    $0x4,%esp
c0100393:	58                   	pop    %eax
c0100394:	5a                   	pop    %edx
c0100395:	52                   	push   %edx
c0100396:	50                   	push   %eax
c0100397:	68 60 f7 10 c0       	push   $0xc010f760
c010039c:	e8 f9 6d 00 00       	call   c010719a <disp_int>
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
c0100469:	e8 a0 bd 00 00       	call   c010c20e <Strcpy>
c010046e:	83 c4 10             	add    $0x10,%esp
c0100471:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100476:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c010047b:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100480:	05 60 02 00 00       	add    $0x260,%eax
c0100485:	83 ec 08             	sub    $0x8,%esp
c0100488:	50                   	push   %eax
c0100489:	68 ec fd 10 c0       	push   $0xc010fdec
c010048e:	e8 ed 9d 00 00       	call   c010a280 <appendToDoubleLinkList>
c0100493:	83 c4 10             	add    $0x10,%esp
c0100496:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010049b:	05 6a 02 00 00       	add    $0x26a,%eax
c01004a0:	83 ec 08             	sub    $0x8,%esp
c01004a3:	50                   	push   %eax
c01004a4:	68 ec fd 10 c0       	push   $0xc010fdec
c01004a9:	e8 d2 9d 00 00       	call   c010a280 <appendToDoubleLinkList>
c01004ae:	83 c4 10             	add    $0x10,%esp
c01004b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004b4:	83 ec 0c             	sub    $0xc,%esp
c01004b7:	50                   	push   %eax
c01004b8:	6a 00                	push   $0x0
c01004ba:	68 0c b0 10 c0       	push   $0xc010b00c
c01004bf:	68 13 b0 10 c0       	push   $0xc010b013
c01004c4:	68 77 52 10 c0       	push   $0xc0105277
c01004c9:	e8 f3 9a 00 00       	call   c0109fc1 <process_execute>
c01004ce:	83 c4 20             	add    $0x20,%esp
c01004d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004d4:	83 ec 0c             	sub    $0xc,%esp
c01004d7:	50                   	push   %eax
c01004d8:	6a 00                	push   $0x0
c01004da:	68 1c b0 10 c0       	push   $0xc010b01c
c01004df:	68 24 b0 10 c0       	push   $0xc010b024
c01004e4:	68 29 17 10 c0       	push   $0xc0101729
c01004e9:	e8 d3 9a 00 00       	call   c0109fc1 <process_execute>
c01004ee:	83 c4 20             	add    $0x20,%esp
c01004f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004f4:	83 ec 0c             	sub    $0xc,%esp
c01004f7:	50                   	push   %eax
c01004f8:	6a 00                	push   $0x0
c01004fa:	68 2d b0 10 c0       	push   $0xc010b02d
c01004ff:	68 34 b0 10 c0       	push   $0xc010b034
c0100504:	68 cc 07 10 c0       	push   $0xc01007cc
c0100509:	e8 b3 9a 00 00       	call   c0109fc1 <process_execute>
c010050e:	83 c4 20             	add    $0x20,%esp
c0100511:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100514:	83 ec 0c             	sub    $0xc,%esp
c0100517:	50                   	push   %eax
c0100518:	6a 00                	push   $0x0
c010051a:	68 3d b0 10 c0       	push   $0xc010b03d
c010051f:	68 45 b0 10 c0       	push   $0xc010b045
c0100524:	68 0d 47 10 c0       	push   $0xc010470d
c0100529:	e8 93 9a 00 00       	call   c0109fc1 <process_execute>
c010052e:	83 c4 20             	add    $0x20,%esp
c0100531:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100534:	83 e8 02             	sub    $0x2,%eax
c0100537:	83 ec 0c             	sub    $0xc,%esp
c010053a:	50                   	push   %eax
c010053b:	6a 01                	push   $0x1
c010053d:	68 4f b0 10 c0       	push   $0xc010b04f
c0100542:	68 59 b0 10 c0       	push   $0xc010b059
c0100547:	68 e9 06 10 c0       	push   $0xc01006e9
c010054c:	e8 70 9a 00 00       	call   c0109fc1 <process_execute>
c0100551:	83 c4 20             	add    $0x20,%esp
c0100554:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100557:	83 e8 03             	sub    $0x3,%eax
c010055a:	83 ec 0c             	sub    $0xc,%esp
c010055d:	50                   	push   %eax
c010055e:	6a 01                	push   $0x1
c0100560:	68 66 b0 10 c0       	push   $0xc010b066
c0100565:	68 70 b0 10 c0       	push   $0xc010b070
c010056a:	68 b4 07 10 c0       	push   $0xc01007b4
c010056f:	e8 4d 9a 00 00       	call   c0109fc1 <process_execute>
c0100574:	83 c4 20             	add    $0x20,%esp
c0100577:	83 ec 0c             	sub    $0xc,%esp
c010057a:	68 7d b0 10 c0       	push   $0xc010b07d
c010057f:	e8 08 fb ff ff       	call   c010008c <disp_str>
c0100584:	83 c4 10             	add    $0x10,%esp
c0100587:	fb                   	sti    
c0100588:	e8 31 67 00 00       	call   c0106cbe <stop_here>
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
c01005eb:	e8 fa 70 00 00       	call   c01076ea <init_keyboard>
c01005f0:	83 ec 0c             	sub    $0xc,%esp
c01005f3:	68 00 00 00 04       	push   $0x4000000
c01005f8:	e8 78 65 00 00       	call   c0106b75 <init_memory>
c01005fd:	83 c4 10             	add    $0x10,%esp
c0100600:	83 ec 0c             	sub    $0xc,%esp
c0100603:	68 ec fd 10 c0       	push   $0xc010fdec
c0100608:	e8 48 9b 00 00       	call   c010a155 <initDoubleLinkList>
c010060d:	83 c4 10             	add    $0x10,%esp
c0100610:	83 ec 0c             	sub    $0xc,%esp
c0100613:	68 04 0f 11 c0       	push   $0xc0110f04
c0100618:	e8 38 9b 00 00       	call   c010a155 <initDoubleLinkList>
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
c0100713:	e8 e4 0f 00 00       	call   c01016fc <sys_malloc>
c0100718:	83 c4 10             	add    $0x10,%esp
c010071b:	a3 bc 06 11 c0       	mov    %eax,0xc01106bc
c0100720:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100723:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100728:	83 ec 04             	sub    $0x4,%esp
c010072b:	52                   	push   %edx
c010072c:	6a 00                	push   $0x0
c010072e:	50                   	push   %eax
c010072f:	e8 bb ba 00 00       	call   c010c1ef <Memset>
c0100734:	83 c4 10             	add    $0x10,%esp
c0100737:	c7 45 ec c3 b0 10 c0 	movl   $0xc010b0c3,-0x14(%ebp)
c010073e:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c0100743:	83 ec 08             	sub    $0x8,%esp
c0100746:	ff 75 ec             	pushl  -0x14(%ebp)
c0100749:	50                   	push   %eax
c010074a:	e8 bf ba 00 00       	call   c010c20e <Strcpy>
c010074f:	83 c4 10             	add    $0x10,%esp
c0100752:	c6 05 cd 06 11 c0 04 	movb   $0x4,0xc01106cd
c0100759:	e8 f5 9e 00 00       	call   c010a653 <DriverInitialize>
c010075e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100765:	eb 15                	jmp    c010077c <user_proc_a+0x93>
c0100767:	a1 bc 06 11 c0       	mov    0xc01106bc,%eax
c010076c:	83 ec 0c             	sub    $0xc,%esp
c010076f:	50                   	push   %eax
c0100770:	e8 86 9f 00 00       	call   c010a6fb <DriverSend>
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
c01007e4:	e8 13 0f 00 00       	call   c01016fc <sys_malloc>
c01007e9:	83 c4 10             	add    $0x10,%esp
c01007ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01007ef:	83 ec 04             	sub    $0x4,%esp
c01007f2:	6a 7c                	push   $0x7c
c01007f4:	6a 00                	push   $0x0
c01007f6:	ff 75 f0             	pushl  -0x10(%ebp)
c01007f9:	e8 f1 b9 00 00       	call   c010c1ef <Memset>
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
c010083b:	e8 f5 8d 00 00       	call   c0109635 <send_rec>
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
c01008ad:	6a 70                	push   $0x70
c01008af:	68 34 b1 10 c0       	push   $0xc010b134
c01008b4:	68 34 b1 10 c0       	push   $0xc010b134
c01008b9:	68 3c b1 10 c0       	push   $0xc010b13c
c01008be:	e8 02 81 00 00       	call   c01089c5 <assertion_failure>
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
c010091f:	e8 5d 80 00 00       	call   c0108981 <spin>
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
c0100945:	e8 06 0c 00 00       	call   c0101550 <waitfor>
c010094a:	83 c4 10             	add    $0x10,%esp
c010094d:	85 c0                	test   %eax,%eax
c010094f:	75 10                	jne    c0100961 <hd_cmd_out+0x31>
c0100951:	83 ec 0c             	sub    $0xc,%esp
c0100954:	68 a8 b1 10 c0       	push   $0xc010b1a8
c0100959:	e8 49 80 00 00       	call   c01089a7 <panic>
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
c0100ab5:	e8 35 b7 00 00       	call   c010c1ef <Memset>
c0100aba:	83 c4 10             	add    $0x10,%esp
c0100abd:	83 ec 04             	sub    $0x4,%esp
c0100ac0:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ac3:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ac6:	68 f0 01 00 00       	push   $0x1f0
c0100acb:	e8 73 b7 00 00       	call   c010c243 <read_port>
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
c0100c33:	e8 d6 b5 00 00       	call   c010c20e <Strcpy>
c0100c38:	83 c4 10             	add    $0x10,%esp
c0100c3b:	eb 13                	jmp    c0100c50 <print_hdinfo+0x167>
c0100c3d:	83 ec 08             	sub    $0x8,%esp
c0100c40:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c43:	50                   	push   %eax
c0100c44:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c47:	50                   	push   %eax
c0100c48:	e8 c1 b5 00 00       	call   c010c20e <Strcpy>
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
c0100c8c:	e8 d7 79 00 00       	call   c0108668 <Printf>
c0100c91:	83 c4 10             	add    $0x10,%esp
c0100c94:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c97:	8b 40 0c             	mov    0xc(%eax),%eax
c0100c9a:	83 ec 08             	sub    $0x8,%esp
c0100c9d:	50                   	push   %eax
c0100c9e:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100ca3:	e8 c0 79 00 00       	call   c0108668 <Printf>
c0100ca8:	83 c4 10             	add    $0x10,%esp
c0100cab:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cae:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100cb2:	0f b6 c0             	movzbl %al,%eax
c0100cb5:	83 ec 08             	sub    $0x8,%esp
c0100cb8:	50                   	push   %eax
c0100cb9:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100cbe:	e8 a5 79 00 00       	call   c0108668 <Printf>
c0100cc3:	83 c4 10             	add    $0x10,%esp
c0100cc6:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cc9:	0f b6 00             	movzbl (%eax),%eax
c0100ccc:	0f b6 c0             	movzbl %al,%eax
c0100ccf:	83 ec 08             	sub    $0x8,%esp
c0100cd2:	50                   	push   %eax
c0100cd3:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100cd8:	e8 8b 79 00 00       	call   c0108668 <Printf>
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
c0100d7c:	e8 6e b4 00 00       	call   c010c1ef <Memset>
c0100d81:	83 c4 10             	add    $0x10,%esp
c0100d84:	83 ec 04             	sub    $0x4,%esp
c0100d87:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d8a:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d8d:	68 f0 01 00 00       	push   $0x1f0
c0100d92:	e8 ac b4 00 00       	call   c010c243 <read_port>
c0100d97:	83 c4 10             	add    $0x10,%esp
c0100d9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100d9d:	05 be 01 00 00       	add    $0x1be,%eax
c0100da2:	83 ec 04             	sub    $0x4,%esp
c0100da5:	6a 40                	push   $0x40
c0100da7:	50                   	push   %eax
c0100da8:	ff 75 10             	pushl  0x10(%ebp)
c0100dab:	e8 fc 5f 00 00       	call   c0106dac <Memcpy>
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
c0100e19:	e8 d1 b3 00 00       	call   c010c1ef <Memset>
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
c0100f4b:	e8 9f b2 00 00       	call   c010c1ef <Memset>
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
c010102d:	e8 ca 06 00 00       	call   c01016fc <sys_malloc>
c0101032:	83 c4 10             	add    $0x10,%esp
c0101035:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101038:	83 ec 04             	sub    $0x4,%esp
c010103b:	6a 7c                	push   $0x7c
c010103d:	6a 00                	push   $0x0
c010103f:	ff 75 f0             	pushl  -0x10(%ebp)
c0101042:	e8 a8 b1 00 00       	call   c010c1ef <Memset>
c0101047:	83 c4 10             	add    $0x10,%esp
c010104a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010104d:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101054:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101057:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010105e:	83 ec 04             	sub    $0x4,%esp
c0101061:	6a 02                	push   $0x2
c0101063:	ff 75 f0             	pushl  -0x10(%ebp)
c0101066:	6a 01                	push   $0x1
c0101068:	e8 c8 85 00 00       	call   c0109635 <send_rec>
c010106d:	83 c4 10             	add    $0x10,%esp
c0101070:	83 ec 08             	sub    $0x8,%esp
c0101073:	6a 7c                	push   $0x7c
c0101075:	ff 75 f0             	pushl  -0x10(%ebp)
c0101078:	e8 94 06 00 00       	call   c0101711 <sys_free>
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
c01010dc:	e8 1b 06 00 00       	call   c01016fc <sys_malloc>
c01010e1:	83 c4 10             	add    $0x10,%esp
c01010e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01010e7:	83 ec 04             	sub    $0x4,%esp
c01010ea:	6a 7c                	push   $0x7c
c01010ec:	6a 00                	push   $0x0
c01010ee:	ff 75 ec             	pushl  -0x14(%ebp)
c01010f1:	e8 f9 b0 00 00       	call   c010c1ef <Memset>
c01010f6:	83 c4 10             	add    $0x10,%esp
c01010f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01010fc:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101103:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101106:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010110d:	83 ec 04             	sub    $0x4,%esp
c0101110:	6a 02                	push   $0x2
c0101112:	ff 75 ec             	pushl  -0x14(%ebp)
c0101115:	6a 01                	push   $0x1
c0101117:	e8 19 85 00 00       	call   c0109635 <send_rec>
c010111c:	83 c4 10             	add    $0x10,%esp
c010111f:	83 ec 08             	sub    $0x8,%esp
c0101122:	6a 7c                	push   $0x7c
c0101124:	ff 75 ec             	pushl  -0x14(%ebp)
c0101127:	e8 e5 05 00 00       	call   c0101711 <sys_free>
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
c0101146:	e8 05 04 00 00       	call   c0101550 <waitfor>
c010114b:	83 c4 10             	add    $0x10,%esp
c010114e:	85 c0                	test   %eax,%eax
c0101150:	75 10                	jne    c0101162 <wait_for+0x2e>
c0101152:	83 ec 0c             	sub    $0xc,%esp
c0101155:	68 e4 b1 10 c0       	push   $0xc010b1e4
c010115a:	e8 48 78 00 00       	call   c01089a7 <panic>
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
c0101170:	e8 87 05 00 00       	call   c01016fc <sys_malloc>
c0101175:	83 c4 10             	add    $0x10,%esp
c0101178:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010117b:	83 ec 04             	sub    $0x4,%esp
c010117e:	6a 7c                	push   $0x7c
c0101180:	6a 00                	push   $0x0
c0101182:	ff 75 f4             	pushl  -0xc(%ebp)
c0101185:	e8 65 b0 00 00       	call   c010c1ef <Memset>
c010118a:	83 c4 10             	add    $0x10,%esp
c010118d:	83 ec 04             	sub    $0x4,%esp
c0101190:	68 13 02 00 00       	push   $0x213
c0101195:	ff 75 f4             	pushl  -0xc(%ebp)
c0101198:	6a 02                	push   $0x2
c010119a:	e8 96 84 00 00       	call   c0109635 <send_rec>
c010119f:	83 c4 10             	add    $0x10,%esp
c01011a2:	83 ec 08             	sub    $0x8,%esp
c01011a5:	6a 7c                	push   $0x7c
c01011a7:	ff 75 f4             	pushl  -0xc(%ebp)
c01011aa:	e8 62 05 00 00       	call   c0101711 <sys_free>
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
c01012ac:	e8 8e 4c 00 00       	call   c0105f3f <alloc_virtual_memory>
c01012b1:	83 c4 10             	add    $0x10,%esp
c01012b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01012b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01012ba:	8b 40 78             	mov    0x78(%eax),%eax
c01012bd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01012c0:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01012c4:	74 22                	je     c01012e8 <hd_rdwt+0x133>
c01012c6:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01012ca:	74 1c                	je     c01012e8 <hd_rdwt+0x133>
c01012cc:	68 ba 01 00 00       	push   $0x1ba
c01012d1:	68 34 b1 10 c0       	push   $0xc010b134
c01012d6:	68 34 b1 10 c0       	push   $0xc010b134
c01012db:	68 f6 b1 10 c0       	push   $0xc010b1f6
c01012e0:	e8 e0 76 00 00       	call   c01089c5 <assertion_failure>
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
c010133e:	68 c8 01 00 00       	push   $0x1c8
c0101343:	68 34 b1 10 c0       	push   $0xc010b134
c0101348:	68 34 b1 10 c0       	push   $0xc010b134
c010134d:	68 14 b2 10 c0       	push   $0xc010b214
c0101352:	e8 6e 76 00 00       	call   c01089c5 <assertion_failure>
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
c010139e:	e8 4c ae 00 00       	call   c010c1ef <Memset>
c01013a3:	83 c4 10             	add    $0x10,%esp
c01013a6:	83 ec 04             	sub    $0x4,%esp
c01013a9:	68 00 02 00 00       	push   $0x200
c01013ae:	68 80 11 11 c0       	push   $0xc0111180
c01013b3:	68 f0 01 00 00       	push   $0x1f0
c01013b8:	e8 86 ae 00 00       	call   c010c243 <read_port>
c01013bd:	83 c4 10             	add    $0x10,%esp
c01013c0:	83 ec 04             	sub    $0x4,%esp
c01013c3:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013c6:	68 80 11 11 c0       	push   $0xc0111180
c01013cb:	ff 75 f0             	pushl  -0x10(%ebp)
c01013ce:	e8 d9 59 00 00       	call   c0106dac <Memcpy>
c01013d3:	83 c4 10             	add    $0x10,%esp
c01013d6:	eb 26                	jmp    c01013fe <hd_rdwt+0x249>
c01013d8:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01013dc:	75 20                	jne    c01013fe <hd_rdwt+0x249>
c01013de:	e8 51 fd ff ff       	call   c0101134 <wait_for>
c01013e3:	83 ec 04             	sub    $0x4,%esp
c01013e6:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013e9:	ff 75 f0             	pushl  -0x10(%ebp)
c01013ec:	68 f0 01 00 00       	push   $0x1f0
c01013f1:	e8 61 ae 00 00       	call   c010c257 <write_port>
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
c0101422:	e8 c8 ad 00 00       	call   c010c1ef <Memset>
c0101427:	83 c4 10             	add    $0x10,%esp
c010142a:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0101431:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101438:	00 00 00 
c010143b:	83 ec 04             	sub    $0x4,%esp
c010143e:	6a 02                	push   $0x2
c0101440:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101446:	50                   	push   %eax
c0101447:	6a 01                	push   $0x1
c0101449:	e8 e7 81 00 00       	call   c0109635 <send_rec>
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
c0101475:	e8 55 84 00 00       	call   c01098cf <inform_int>
c010147a:	83 c4 10             	add    $0x10,%esp
c010147d:	90                   	nop
c010147e:	c9                   	leave  
c010147f:	c3                   	ret    

c0101480 <net_handler>:
c0101480:	55                   	push   %ebp
c0101481:	89 e5                	mov    %esp,%ebp
c0101483:	83 ec 18             	sub    $0x18,%esp
c0101486:	83 ec 0c             	sub    $0xc,%esp
c0101489:	68 48 b2 10 c0       	push   $0xc010b248
c010148e:	e8 f9 eb ff ff       	call   c010008c <disp_str>
c0101493:	83 c4 10             	add    $0x10,%esp
c0101496:	e8 41 93 00 00       	call   c010a7dc <get_interrupt_status>
c010149b:	88 45 f7             	mov    %al,-0x9(%ebp)
c010149e:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
c01014a2:	83 ec 04             	sub    $0x4,%esp
c01014a5:	6a 01                	push   $0x1
c01014a7:	8d 45 f7             	lea    -0x9(%ebp),%eax
c01014aa:	50                   	push   %eax
c01014ab:	8d 45 f6             	lea    -0xa(%ebp),%eax
c01014ae:	50                   	push   %eax
c01014af:	e8 f8 58 00 00       	call   c0106dac <Memcpy>
c01014b4:	83 c4 10             	add    $0x10,%esp
c01014b7:	83 ec 0c             	sub    $0xc,%esp
c01014ba:	68 6a b2 10 c0       	push   $0xc010b26a
c01014bf:	e8 c8 eb ff ff       	call   c010008c <disp_str>
c01014c4:	83 c4 10             	add    $0x10,%esp
c01014c7:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
c01014cb:	83 e0 01             	and    $0x1,%eax
c01014ce:	0f b6 c0             	movzbl %al,%eax
c01014d1:	83 ec 0c             	sub    $0xc,%esp
c01014d4:	50                   	push   %eax
c01014d5:	e8 c0 5c 00 00       	call   c010719a <disp_int>
c01014da:	83 c4 10             	add    $0x10,%esp
c01014dd:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
c01014e1:	d0 e8                	shr    %al
c01014e3:	83 e0 01             	and    $0x1,%eax
c01014e6:	0f b6 c0             	movzbl %al,%eax
c01014e9:	83 ec 0c             	sub    $0xc,%esp
c01014ec:	50                   	push   %eax
c01014ed:	e8 a8 5c 00 00       	call   c010719a <disp_int>
c01014f2:	83 c4 10             	add    $0x10,%esp
c01014f5:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
c01014f9:	c0 e8 02             	shr    $0x2,%al
c01014fc:	83 e0 01             	and    $0x1,%eax
c01014ff:	0f b6 c0             	movzbl %al,%eax
c0101502:	83 ec 0c             	sub    $0xc,%esp
c0101505:	50                   	push   %eax
c0101506:	e8 8f 5c 00 00       	call   c010719a <disp_int>
c010150b:	83 c4 10             	add    $0x10,%esp
c010150e:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
c0101512:	c0 e8 06             	shr    $0x6,%al
c0101515:	83 e0 01             	and    $0x1,%eax
c0101518:	0f b6 c0             	movzbl %al,%eax
c010151b:	83 ec 0c             	sub    $0xc,%esp
c010151e:	50                   	push   %eax
c010151f:	e8 76 5c 00 00       	call   c010719a <disp_int>
c0101524:	83 c4 10             	add    $0x10,%esp
c0101527:	83 ec 0c             	sub    $0xc,%esp
c010152a:	68 6a b2 10 c0       	push   $0xc010b26a
c010152f:	e8 58 eb ff ff       	call   c010008c <disp_str>
c0101534:	83 c4 10             	add    $0x10,%esp
c0101537:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c010153b:	0f b6 c0             	movzbl %al,%eax
c010153e:	83 ec 0c             	sub    $0xc,%esp
c0101541:	50                   	push   %eax
c0101542:	e8 ab 92 00 00       	call   c010a7f2 <set_interrupt_status>
c0101547:	83 c4 10             	add    $0x10,%esp
c010154a:	66 87 db             	xchg   %bx,%bx
c010154d:	90                   	nop
c010154e:	c9                   	leave  
c010154f:	c3                   	ret    

c0101550 <waitfor>:
c0101550:	55                   	push   %ebp
c0101551:	89 e5                	mov    %esp,%ebp
c0101553:	83 ec 18             	sub    $0x18,%esp
c0101556:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010155d:	eb 26                	jmp    c0101585 <waitfor+0x35>
c010155f:	83 ec 0c             	sub    $0xc,%esp
c0101562:	68 f7 01 00 00       	push   $0x1f7
c0101567:	e8 78 ed ff ff       	call   c01002e4 <in_byte>
c010156c:	83 c4 10             	add    $0x10,%esp
c010156f:	0f b6 c0             	movzbl %al,%eax
c0101572:	23 45 08             	and    0x8(%ebp),%eax
c0101575:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0101578:	75 07                	jne    c0101581 <waitfor+0x31>
c010157a:	b8 01 00 00 00       	mov    $0x1,%eax
c010157f:	eb 11                	jmp    c0101592 <waitfor+0x42>
c0101581:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101585:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101588:	3b 45 10             	cmp    0x10(%ebp),%eax
c010158b:	7c d2                	jl     c010155f <waitfor+0xf>
c010158d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101592:	c9                   	leave  
c0101593:	c3                   	ret    

c0101594 <print_hd_info>:
c0101594:	55                   	push   %ebp
c0101595:	89 e5                	mov    %esp,%ebp
c0101597:	83 ec 18             	sub    $0x18,%esp
c010159a:	83 ec 0c             	sub    $0xc,%esp
c010159d:	68 82 b2 10 c0       	push   $0xc010b282
c01015a2:	e8 c1 70 00 00       	call   c0108668 <Printf>
c01015a7:	83 c4 10             	add    $0x10,%esp
c01015aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01015b1:	eb 3b                	jmp    c01015ee <print_hd_info+0x5a>
c01015b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015b6:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01015bd:	85 c0                	test   %eax,%eax
c01015bf:	74 28                	je     c01015e9 <print_hd_info+0x55>
c01015c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015c4:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01015cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015ce:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01015d5:	ff 75 f4             	pushl  -0xc(%ebp)
c01015d8:	52                   	push   %edx
c01015d9:	50                   	push   %eax
c01015da:	68 9f b2 10 c0       	push   $0xc010b29f
c01015df:	e8 84 70 00 00       	call   c0108668 <Printf>
c01015e4:	83 c4 10             	add    $0x10,%esp
c01015e7:	eb 01                	jmp    c01015ea <print_hd_info+0x56>
c01015e9:	90                   	nop
c01015ea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01015ee:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c01015f2:	7e bf                	jle    c01015b3 <print_hd_info+0x1f>
c01015f4:	83 ec 0c             	sub    $0xc,%esp
c01015f7:	68 b7 b2 10 c0       	push   $0xc010b2b7
c01015fc:	e8 67 70 00 00       	call   c0108668 <Printf>
c0101601:	83 c4 10             	add    $0x10,%esp
c0101604:	83 ec 0c             	sub    $0xc,%esp
c0101607:	68 d2 b2 10 c0       	push   $0xc010b2d2
c010160c:	e8 57 70 00 00       	call   c0108668 <Printf>
c0101611:	83 c4 10             	add    $0x10,%esp
c0101614:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c010161b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101622:	eb 44                	jmp    c0101668 <print_hd_info+0xd4>
c0101624:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101627:	83 c0 04             	add    $0x4,%eax
c010162a:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101631:	85 c0                	test   %eax,%eax
c0101633:	74 2e                	je     c0101663 <print_hd_info+0xcf>
c0101635:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101638:	83 c0 04             	add    $0x4,%eax
c010163b:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101642:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101645:	83 c0 04             	add    $0x4,%eax
c0101648:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c010164f:	ff 75 f0             	pushl  -0x10(%ebp)
c0101652:	52                   	push   %edx
c0101653:	50                   	push   %eax
c0101654:	68 9f b2 10 c0       	push   $0xc010b29f
c0101659:	e8 0a 70 00 00       	call   c0108668 <Printf>
c010165e:	83 c4 10             	add    $0x10,%esp
c0101661:	eb 01                	jmp    c0101664 <print_hd_info+0xd0>
c0101663:	90                   	nop
c0101664:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101668:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c010166c:	7e b6                	jle    c0101624 <print_hd_info+0x90>
c010166e:	83 ec 0c             	sub    $0xc,%esp
c0101671:	68 ef b2 10 c0       	push   $0xc010b2ef
c0101676:	e8 ed 6f 00 00       	call   c0108668 <Printf>
c010167b:	83 c4 10             	add    $0x10,%esp
c010167e:	90                   	nop
c010167f:	c9                   	leave  
c0101680:	c3                   	ret    

c0101681 <is_empty>:
c0101681:	55                   	push   %ebp
c0101682:	89 e5                	mov    %esp,%ebp
c0101684:	83 ec 10             	sub    $0x10,%esp
c0101687:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010168e:	eb 1a                	jmp    c01016aa <is_empty+0x29>
c0101690:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0101693:	8b 45 08             	mov    0x8(%ebp),%eax
c0101696:	01 d0                	add    %edx,%eax
c0101698:	0f b6 00             	movzbl (%eax),%eax
c010169b:	84 c0                	test   %al,%al
c010169d:	74 07                	je     c01016a6 <is_empty+0x25>
c010169f:	b8 00 00 00 00       	mov    $0x0,%eax
c01016a4:	eb 11                	jmp    c01016b7 <is_empty+0x36>
c01016a6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01016aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01016ad:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01016b0:	7c de                	jl     c0101690 <is_empty+0xf>
c01016b2:	b8 01 00 00 00       	mov    $0x1,%eax
c01016b7:	c9                   	leave  
c01016b8:	c3                   	ret    
c01016b9:	66 90                	xchg   %ax,%ax
c01016bb:	66 90                	xchg   %ax,%ax
c01016bd:	66 90                	xchg   %ax,%ax
c01016bf:	90                   	nop

c01016c0 <write_debug>:
c01016c0:	b8 02 00 00 00       	mov    $0x2,%eax
c01016c5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c01016c9:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c01016cd:	cd 90                	int    $0x90
c01016cf:	c3                   	ret    

c01016d0 <send_msg>:
c01016d0:	55                   	push   %ebp
c01016d1:	89 e5                	mov    %esp,%ebp
c01016d3:	53                   	push   %ebx
c01016d4:	51                   	push   %ecx
c01016d5:	b8 03 00 00 00       	mov    $0x3,%eax
c01016da:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01016dd:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01016e0:	cd 90                	int    $0x90
c01016e2:	59                   	pop    %ecx
c01016e3:	5b                   	pop    %ebx
c01016e4:	5d                   	pop    %ebp
c01016e5:	c3                   	ret    

c01016e6 <receive_msg>:
c01016e6:	55                   	push   %ebp
c01016e7:	89 e5                	mov    %esp,%ebp
c01016e9:	53                   	push   %ebx
c01016ea:	51                   	push   %ecx
c01016eb:	b8 04 00 00 00       	mov    $0x4,%eax
c01016f0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01016f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01016f6:	cd 90                	int    $0x90
c01016f8:	59                   	pop    %ecx
c01016f9:	5b                   	pop    %ebx
c01016fa:	5d                   	pop    %ebp
c01016fb:	c3                   	ret    

c01016fc <sys_malloc>:
c01016fc:	56                   	push   %esi
c01016fd:	57                   	push   %edi
c01016fe:	53                   	push   %ebx
c01016ff:	55                   	push   %ebp
c0101700:	89 e5                	mov    %esp,%ebp
c0101702:	b8 05 00 00 00       	mov    $0x5,%eax
c0101707:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010170a:	cd 90                	int    $0x90
c010170c:	5d                   	pop    %ebp
c010170d:	5b                   	pop    %ebx
c010170e:	5f                   	pop    %edi
c010170f:	5e                   	pop    %esi
c0101710:	c3                   	ret    

c0101711 <sys_free>:
c0101711:	56                   	push   %esi
c0101712:	57                   	push   %edi
c0101713:	53                   	push   %ebx
c0101714:	55                   	push   %ebp
c0101715:	89 e5                	mov    %esp,%ebp
c0101717:	b8 06 00 00 00       	mov    $0x6,%eax
c010171c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010171f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0101722:	cd 90                	int    $0x90
c0101724:	5d                   	pop    %ebp
c0101725:	5b                   	pop    %ebx
c0101726:	5f                   	pop    %edi
c0101727:	5e                   	pop    %esi
c0101728:	c3                   	ret    

c0101729 <task_fs>:
c0101729:	55                   	push   %ebp
c010172a:	89 e5                	mov    %esp,%ebp
c010172c:	83 ec 28             	sub    $0x28,%esp
c010172f:	e8 bb 08 00 00       	call   c0101fef <init_fs>
c0101734:	83 ec 0c             	sub    $0xc,%esp
c0101737:	6a 7c                	push   $0x7c
c0101739:	e8 be ff ff ff       	call   c01016fc <sys_malloc>
c010173e:	83 c4 10             	add    $0x10,%esp
c0101741:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101744:	83 ec 0c             	sub    $0xc,%esp
c0101747:	6a 7c                	push   $0x7c
c0101749:	e8 ae ff ff ff       	call   c01016fc <sys_malloc>
c010174e:	83 c4 10             	add    $0x10,%esp
c0101751:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101754:	83 ec 04             	sub    $0x4,%esp
c0101757:	6a 7c                	push   $0x7c
c0101759:	6a 00                	push   $0x0
c010175b:	ff 75 f4             	pushl  -0xc(%ebp)
c010175e:	e8 8c aa 00 00       	call   c010c1ef <Memset>
c0101763:	83 c4 10             	add    $0x10,%esp
c0101766:	83 ec 04             	sub    $0x4,%esp
c0101769:	6a 12                	push   $0x12
c010176b:	ff 75 f4             	pushl  -0xc(%ebp)
c010176e:	6a 02                	push   $0x2
c0101770:	e8 c0 7e 00 00       	call   c0109635 <send_rec>
c0101775:	83 c4 10             	add    $0x10,%esp
c0101778:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010177b:	8b 40 78             	mov    0x78(%eax),%eax
c010177e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101781:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101784:	8b 00                	mov    (%eax),%eax
c0101786:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101789:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010178c:	8b 40 50             	mov    0x50(%eax),%eax
c010178f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101792:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101795:	8b 40 68             	mov    0x68(%eax),%eax
c0101798:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010179b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010179e:	8b 00                	mov    (%eax),%eax
c01017a0:	85 c0                	test   %eax,%eax
c01017a2:	75 07                	jne    c01017ab <task_fs+0x82>
c01017a4:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c01017ab:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c01017b2:	83 ec 0c             	sub    $0xc,%esp
c01017b5:	ff 75 e8             	pushl  -0x18(%ebp)
c01017b8:	e8 39 21 00 00       	call   c01038f6 <pid2proc>
c01017bd:	83 c4 10             	add    $0x10,%esp
c01017c0:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c01017c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01017c9:	74 37                	je     c0101802 <task_fs+0xd9>
c01017cb:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01017cf:	74 31                	je     c0101802 <task_fs+0xd9>
c01017d1:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01017d5:	74 2b                	je     c0101802 <task_fs+0xd9>
c01017d7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01017db:	74 25                	je     c0101802 <task_fs+0xd9>
c01017dd:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01017e1:	74 1f                	je     c0101802 <task_fs+0xd9>
c01017e3:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01017e7:	74 19                	je     c0101802 <task_fs+0xd9>
c01017e9:	6a 7a                	push   $0x7a
c01017eb:	68 10 b3 10 c0       	push   $0xc010b310
c01017f0:	68 10 b3 10 c0       	push   $0xc010b310
c01017f5:	68 20 b3 10 c0       	push   $0xc010b320
c01017fa:	e8 c6 71 00 00       	call   c01089c5 <assertion_failure>
c01017ff:	83 c4 10             	add    $0x10,%esp
c0101802:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101806:	74 3a                	je     c0101842 <task_fs+0x119>
c0101808:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010180c:	7f 19                	jg     c0101827 <task_fs+0xfe>
c010180e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101812:	0f 84 10 01 00 00    	je     c0101928 <task_fs+0x1ff>
c0101818:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010181c:	0f 84 a1 00 00 00    	je     c01018c3 <task_fs+0x19a>
c0101822:	e9 ef 00 00 00       	jmp    c0101916 <task_fs+0x1ed>
c0101827:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c010182b:	74 50                	je     c010187d <task_fs+0x154>
c010182d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101831:	0f 84 c6 00 00 00    	je     c01018fd <task_fs+0x1d4>
c0101837:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010183b:	74 40                	je     c010187d <task_fs+0x154>
c010183d:	e9 d4 00 00 00       	jmp    c0101916 <task_fs+0x1ed>
c0101842:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101845:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010184c:	83 ec 0c             	sub    $0xc,%esp
c010184f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101852:	e8 ec 07 00 00       	call   c0102043 <do_open>
c0101857:	83 c4 10             	add    $0x10,%esp
c010185a:	89 c2                	mov    %eax,%edx
c010185c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010185f:	89 50 50             	mov    %edx,0x50(%eax)
c0101862:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101865:	8b 00                	mov    (%eax),%eax
c0101867:	83 ec 04             	sub    $0x4,%esp
c010186a:	50                   	push   %eax
c010186b:	ff 75 f4             	pushl  -0xc(%ebp)
c010186e:	6a 01                	push   $0x1
c0101870:	e8 c0 7d 00 00       	call   c0109635 <send_rec>
c0101875:	83 c4 10             	add    $0x10,%esp
c0101878:	e9 b2 00 00 00       	jmp    c010192f <task_fs+0x206>
c010187d:	83 ec 0c             	sub    $0xc,%esp
c0101880:	ff 75 f4             	pushl  -0xc(%ebp)
c0101883:	e8 19 19 00 00       	call   c01031a1 <do_rdwt>
c0101888:	83 c4 10             	add    $0x10,%esp
c010188b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010188e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101892:	0f 84 96 00 00 00    	je     c010192e <task_fs+0x205>
c0101898:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010189b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01018a2:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01018a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018a8:	89 50 60             	mov    %edx,0x60(%eax)
c01018ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018ae:	8b 00                	mov    (%eax),%eax
c01018b0:	83 ec 04             	sub    $0x4,%esp
c01018b3:	50                   	push   %eax
c01018b4:	ff 75 f4             	pushl  -0xc(%ebp)
c01018b7:	6a 01                	push   $0x1
c01018b9:	e8 77 7d 00 00       	call   c0109635 <send_rec>
c01018be:	83 c4 10             	add    $0x10,%esp
c01018c1:	eb 6b                	jmp    c010192e <task_fs+0x205>
c01018c3:	83 ec 0c             	sub    $0xc,%esp
c01018c6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01018c9:	e8 f0 1d 00 00       	call   c01036be <do_close>
c01018ce:	83 c4 10             	add    $0x10,%esp
c01018d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018d4:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01018db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018de:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01018e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018e8:	8b 00                	mov    (%eax),%eax
c01018ea:	83 ec 04             	sub    $0x4,%esp
c01018ed:	50                   	push   %eax
c01018ee:	ff 75 f4             	pushl  -0xc(%ebp)
c01018f1:	6a 01                	push   $0x1
c01018f3:	e8 3d 7d 00 00       	call   c0109635 <send_rec>
c01018f8:	83 c4 10             	add    $0x10,%esp
c01018fb:	eb 32                	jmp    c010192f <task_fs+0x206>
c01018fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101900:	8b 40 68             	mov    0x68(%eax),%eax
c0101903:	83 ec 04             	sub    $0x4,%esp
c0101906:	50                   	push   %eax
c0101907:	ff 75 f4             	pushl  -0xc(%ebp)
c010190a:	6a 01                	push   $0x1
c010190c:	e8 24 7d 00 00       	call   c0109635 <send_rec>
c0101911:	83 c4 10             	add    $0x10,%esp
c0101914:	eb 19                	jmp    c010192f <task_fs+0x206>
c0101916:	83 ec 0c             	sub    $0xc,%esp
c0101919:	68 83 b3 10 c0       	push   $0xc010b383
c010191e:	e8 84 70 00 00       	call   c01089a7 <panic>
c0101923:	83 c4 10             	add    $0x10,%esp
c0101926:	eb 07                	jmp    c010192f <task_fs+0x206>
c0101928:	90                   	nop
c0101929:	e9 26 fe ff ff       	jmp    c0101754 <task_fs+0x2b>
c010192e:	90                   	nop
c010192f:	e9 20 fe ff ff       	jmp    c0101754 <task_fs+0x2b>

c0101934 <rd_wt>:
c0101934:	55                   	push   %ebp
c0101935:	89 e5                	mov    %esp,%ebp
c0101937:	83 ec 18             	sub    $0x18,%esp
c010193a:	83 ec 0c             	sub    $0xc,%esp
c010193d:	6a 7c                	push   $0x7c
c010193f:	e8 b8 fd ff ff       	call   c01016fc <sys_malloc>
c0101944:	83 c4 10             	add    $0x10,%esp
c0101947:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010194a:	83 ec 04             	sub    $0x4,%esp
c010194d:	6a 7c                	push   $0x7c
c010194f:	6a 00                	push   $0x0
c0101951:	ff 75 f4             	pushl  -0xc(%ebp)
c0101954:	e8 96 a8 00 00       	call   c010c1ef <Memset>
c0101959:	83 c4 10             	add    $0x10,%esp
c010195c:	8b 55 18             	mov    0x18(%ebp),%edx
c010195f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101962:	89 50 78             	mov    %edx,0x78(%eax)
c0101965:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101968:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010196b:	89 50 14             	mov    %edx,0x14(%eax)
c010196e:	8b 55 10             	mov    0x10(%ebp),%edx
c0101971:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101974:	89 50 10             	mov    %edx,0x10(%eax)
c0101977:	8b 55 14             	mov    0x14(%ebp),%edx
c010197a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010197d:	89 50 0c             	mov    %edx,0xc(%eax)
c0101980:	8b 45 08             	mov    0x8(%ebp),%eax
c0101983:	c1 e0 09             	shl    $0x9,%eax
c0101986:	89 c2                	mov    %eax,%edx
c0101988:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010198b:	89 50 18             	mov    %edx,0x18(%eax)
c010198e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101992:	74 22                	je     c01019b6 <rd_wt+0x82>
c0101994:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101998:	74 1c                	je     c01019b6 <rd_wt+0x82>
c010199a:	68 b1 00 00 00       	push   $0xb1
c010199f:	68 10 b3 10 c0       	push   $0xc010b310
c01019a4:	68 10 b3 10 c0       	push   $0xc010b310
c01019a9:	68 96 b3 10 c0       	push   $0xc010b396
c01019ae:	e8 12 70 00 00       	call   c01089c5 <assertion_failure>
c01019b3:	83 c4 10             	add    $0x10,%esp
c01019b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019b9:	8b 40 78             	mov    0x78(%eax),%eax
c01019bc:	83 f8 07             	cmp    $0x7,%eax
c01019bf:	74 27                	je     c01019e8 <rd_wt+0xb4>
c01019c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01019c4:	8b 40 78             	mov    0x78(%eax),%eax
c01019c7:	83 f8 0a             	cmp    $0xa,%eax
c01019ca:	74 1c                	je     c01019e8 <rd_wt+0xb4>
c01019cc:	68 b2 00 00 00       	push   $0xb2
c01019d1:	68 10 b3 10 c0       	push   $0xc010b310
c01019d6:	68 10 b3 10 c0       	push   $0xc010b310
c01019db:	68 b4 b3 10 c0       	push   $0xc010b3b4
c01019e0:	e8 e0 6f 00 00       	call   c01089c5 <assertion_failure>
c01019e5:	83 c4 10             	add    $0x10,%esp
c01019e8:	83 ec 04             	sub    $0x4,%esp
c01019eb:	6a 03                	push   $0x3
c01019ed:	ff 75 f4             	pushl  -0xc(%ebp)
c01019f0:	6a 03                	push   $0x3
c01019f2:	e8 3e 7c 00 00       	call   c0109635 <send_rec>
c01019f7:	83 c4 10             	add    $0x10,%esp
c01019fa:	83 ec 08             	sub    $0x8,%esp
c01019fd:	6a 7c                	push   $0x7c
c01019ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0101a02:	e8 0a fd ff ff       	call   c0101711 <sys_free>
c0101a07:	83 c4 10             	add    $0x10,%esp
c0101a0a:	90                   	nop
c0101a0b:	c9                   	leave  
c0101a0c:	c3                   	ret    

c0101a0d <mkfs>:
c0101a0d:	55                   	push   %ebp
c0101a0e:	89 e5                	mov    %esp,%ebp
c0101a10:	57                   	push   %edi
c0101a11:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101a17:	83 ec 0c             	sub    $0xc,%esp
c0101a1a:	68 00 80 00 00       	push   $0x8000
c0101a1f:	e8 d8 fc ff ff       	call   c01016fc <sys_malloc>
c0101a24:	83 c4 10             	add    $0x10,%esp
c0101a27:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c0101a2c:	83 ec 0c             	sub    $0xc,%esp
c0101a2f:	6a 24                	push   $0x24
c0101a31:	e8 c6 fc ff ff       	call   c01016fc <sys_malloc>
c0101a36:	83 c4 10             	add    $0x10,%esp
c0101a39:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c0101a3e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a43:	83 ec 0c             	sub    $0xc,%esp
c0101a46:	50                   	push   %eax
c0101a47:	e8 42 46 00 00       	call   c010608e <get_physical_address>
c0101a4c:	83 c4 10             	add    $0x10,%esp
c0101a4f:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101a54:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101a59:	83 ec 0c             	sub    $0xc,%esp
c0101a5c:	50                   	push   %eax
c0101a5d:	e8 2c 46 00 00       	call   c010608e <get_physical_address>
c0101a62:	83 c4 10             	add    $0x10,%esp
c0101a65:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c0101a6a:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a6f:	83 ec 04             	sub    $0x4,%esp
c0101a72:	68 00 02 00 00       	push   $0x200
c0101a77:	6a 00                	push   $0x0
c0101a79:	50                   	push   %eax
c0101a7a:	e8 70 a7 00 00       	call   c010c1ef <Memset>
c0101a7f:	83 c4 10             	add    $0x10,%esp
c0101a82:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a87:	83 ec 0c             	sub    $0xc,%esp
c0101a8a:	6a 0a                	push   $0xa
c0101a8c:	68 00 02 00 00       	push   $0x200
c0101a91:	50                   	push   %eax
c0101a92:	6a 20                	push   $0x20
c0101a94:	6a 00                	push   $0x0
c0101a96:	e8 99 fe ff ff       	call   c0101934 <rd_wt>
c0101a9b:	83 c4 20             	add    $0x20,%esp
c0101a9e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101aa3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101aa6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101aa9:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101ab0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ab3:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0101aba:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101abd:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101ac4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ac7:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101ace:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ad1:	8b 40 04             	mov    0x4(%eax),%eax
c0101ad4:	8d 50 02             	lea    0x2(%eax),%edx
c0101ad7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ada:	8b 40 08             	mov    0x8(%eax),%eax
c0101add:	01 c2                	add    %eax,%edx
c0101adf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101ae2:	8b 40 0c             	mov    0xc(%eax),%eax
c0101ae5:	01 c2                	add    %eax,%edx
c0101ae7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101aea:	89 10                	mov    %edx,(%eax)
c0101aec:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101af3:	b8 00 02 00 00       	mov    $0x200,%eax
c0101af8:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101afb:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101b01:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101b04:	01 ca                	add    %ecx,%edx
c0101b06:	83 ec 04             	sub    $0x4,%esp
c0101b09:	50                   	push   %eax
c0101b0a:	6a 80                	push   $0xffffff80
c0101b0c:	52                   	push   %edx
c0101b0d:	e8 dd a6 00 00       	call   c010c1ef <Memset>
c0101b12:	83 c4 10             	add    $0x10,%esp
c0101b15:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b1a:	83 ec 0c             	sub    $0xc,%esp
c0101b1d:	6a 0a                	push   $0xa
c0101b1f:	68 00 02 00 00       	push   $0x200
c0101b24:	50                   	push   %eax
c0101b25:	6a 20                	push   $0x20
c0101b27:	6a 01                	push   $0x1
c0101b29:	e8 06 fe ff ff       	call   c0101934 <rd_wt>
c0101b2e:	83 c4 20             	add    $0x20,%esp
c0101b31:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101b34:	8b 10                	mov    (%eax),%edx
c0101b36:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101b39:	8b 50 04             	mov    0x4(%eax),%edx
c0101b3c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101b3f:	8b 50 08             	mov    0x8(%eax),%edx
c0101b42:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101b45:	8b 50 0c             	mov    0xc(%eax),%edx
c0101b48:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101b4b:	8b 50 10             	mov    0x10(%eax),%edx
c0101b4e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101b51:	8b 50 14             	mov    0x14(%eax),%edx
c0101b54:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101b57:	8b 50 18             	mov    0x18(%eax),%edx
c0101b5a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101b5d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101b60:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101b63:	8b 40 20             	mov    0x20(%eax),%eax
c0101b66:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101b69:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101b6d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101b71:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b76:	83 ec 04             	sub    $0x4,%esp
c0101b79:	6a 01                	push   $0x1
c0101b7b:	52                   	push   %edx
c0101b7c:	50                   	push   %eax
c0101b7d:	e8 6d a6 00 00       	call   c010c1ef <Memset>
c0101b82:	83 c4 10             	add    $0x10,%esp
c0101b85:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b8a:	83 c0 01             	add    $0x1,%eax
c0101b8d:	83 ec 04             	sub    $0x4,%esp
c0101b90:	68 ff 01 00 00       	push   $0x1ff
c0101b95:	6a 80                	push   $0xffffff80
c0101b97:	50                   	push   %eax
c0101b98:	e8 52 a6 00 00       	call   c010c1ef <Memset>
c0101b9d:	83 c4 10             	add    $0x10,%esp
c0101ba0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101ba5:	83 ec 0c             	sub    $0xc,%esp
c0101ba8:	6a 0a                	push   $0xa
c0101baa:	68 00 02 00 00       	push   $0x200
c0101baf:	50                   	push   %eax
c0101bb0:	6a 20                	push   $0x20
c0101bb2:	6a 02                	push   $0x2
c0101bb4:	e8 7b fd ff ff       	call   c0101934 <rd_wt>
c0101bb9:	83 c4 20             	add    $0x20,%esp
c0101bbc:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101bc3:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101bc8:	83 ec 04             	sub    $0x4,%esp
c0101bcb:	68 00 02 00 00       	push   $0x200
c0101bd0:	6a ff                	push   $0xffffffff
c0101bd2:	50                   	push   %eax
c0101bd3:	e8 17 a6 00 00       	call   c010c1ef <Memset>
c0101bd8:	83 c4 10             	add    $0x10,%esp
c0101bdb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101be0:	83 ec 0c             	sub    $0xc,%esp
c0101be3:	6a 0a                	push   $0xa
c0101be5:	68 00 02 00 00       	push   $0x200
c0101bea:	50                   	push   %eax
c0101beb:	6a 20                	push   $0x20
c0101bed:	ff 75 d0             	pushl  -0x30(%ebp)
c0101bf0:	e8 3f fd ff ff       	call   c0101934 <rd_wt>
c0101bf5:	83 c4 20             	add    $0x20,%esp
c0101bf8:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101bfd:	83 ec 04             	sub    $0x4,%esp
c0101c00:	6a 01                	push   $0x1
c0101c02:	6a 01                	push   $0x1
c0101c04:	50                   	push   %eax
c0101c05:	e8 e5 a5 00 00       	call   c010c1ef <Memset>
c0101c0a:	83 c4 10             	add    $0x10,%esp
c0101c0d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c12:	83 c0 01             	add    $0x1,%eax
c0101c15:	83 ec 04             	sub    $0x4,%esp
c0101c18:	68 ff 01 00 00       	push   $0x1ff
c0101c1d:	6a 00                	push   $0x0
c0101c1f:	50                   	push   %eax
c0101c20:	e8 ca a5 00 00       	call   c010c1ef <Memset>
c0101c25:	83 c4 10             	add    $0x10,%esp
c0101c28:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c2d:	89 c2                	mov    %eax,%edx
c0101c2f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101c32:	83 c0 01             	add    $0x1,%eax
c0101c35:	83 ec 0c             	sub    $0xc,%esp
c0101c38:	6a 0a                	push   $0xa
c0101c3a:	68 00 02 00 00       	push   $0x200
c0101c3f:	52                   	push   %edx
c0101c40:	6a 20                	push   $0x20
c0101c42:	50                   	push   %eax
c0101c43:	e8 ec fc ff ff       	call   c0101934 <rd_wt>
c0101c48:	83 c4 20             	add    $0x20,%esp
c0101c4b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c4e:	83 e8 02             	sub    $0x2,%eax
c0101c51:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101c54:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101c5b:	eb 04                	jmp    c0101c61 <mkfs+0x254>
c0101c5d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101c61:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101c64:	83 c0 01             	add    $0x1,%eax
c0101c67:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101c6a:	7e f1                	jle    c0101c5d <mkfs+0x250>
c0101c6c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c71:	89 c2                	mov    %eax,%edx
c0101c73:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c76:	83 c0 03             	add    $0x3,%eax
c0101c79:	83 ec 0c             	sub    $0xc,%esp
c0101c7c:	6a 0a                	push   $0xa
c0101c7e:	68 00 02 00 00       	push   $0x200
c0101c83:	52                   	push   %edx
c0101c84:	6a 20                	push   $0x20
c0101c86:	50                   	push   %eax
c0101c87:	e8 a8 fc ff ff       	call   c0101934 <rd_wt>
c0101c8c:	83 c4 20             	add    $0x20,%esp
c0101c8f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c94:	89 c2                	mov    %eax,%edx
c0101c96:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c99:	83 c0 03             	add    $0x3,%eax
c0101c9c:	83 ec 0c             	sub    $0xc,%esp
c0101c9f:	6a 07                	push   $0x7
c0101ca1:	68 00 02 00 00       	push   $0x200
c0101ca6:	52                   	push   %edx
c0101ca7:	6a 20                	push   $0x20
c0101ca9:	50                   	push   %eax
c0101caa:	e8 85 fc ff ff       	call   c0101934 <rd_wt>
c0101caf:	83 c4 20             	add    $0x20,%esp
c0101cb2:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101cb7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101cba:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cbd:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101cc3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cc6:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101ccd:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101cd0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cd3:	89 50 08             	mov    %edx,0x8(%eax)
c0101cd6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cd9:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101ce0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ce3:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101cea:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ced:	8b 10                	mov    (%eax),%edx
c0101cef:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101cf5:	8b 50 04             	mov    0x4(%eax),%edx
c0101cf8:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101cfe:	8b 50 08             	mov    0x8(%eax),%edx
c0101d01:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101d07:	8b 50 0c             	mov    0xc(%eax),%edx
c0101d0a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101d10:	8b 50 10             	mov    0x10(%eax),%edx
c0101d13:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101d19:	8b 50 14             	mov    0x14(%eax),%edx
c0101d1c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101d22:	8b 50 18             	mov    0x18(%eax),%edx
c0101d25:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101d2b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101d2e:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101d34:	8b 50 20             	mov    0x20(%eax),%edx
c0101d37:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101d3d:	8b 40 24             	mov    0x24(%eax),%eax
c0101d40:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101d45:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101d4c:	eb 4c                	jmp    c0101d9a <mkfs+0x38d>
c0101d4e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d53:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101d56:	83 c2 01             	add    $0x1,%edx
c0101d59:	c1 e2 05             	shl    $0x5,%edx
c0101d5c:	01 d0                	add    %edx,%eax
c0101d5e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101d61:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d64:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101d6a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d6d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101d74:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d77:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101d7e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101d85:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101d88:	c1 e0 08             	shl    $0x8,%eax
c0101d8b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101d8e:	89 c2                	mov    %eax,%edx
c0101d90:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d93:	89 50 08             	mov    %edx,0x8(%eax)
c0101d96:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101d9a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101d9e:	7e ae                	jle    c0101d4e <mkfs+0x341>
c0101da0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101da7:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101dad:	b8 00 00 00 00       	mov    $0x0,%eax
c0101db2:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101db7:	89 d7                	mov    %edx,%edi
c0101db9:	f3 ab                	rep stos %eax,%es:(%edi)
c0101dbb:	c7 85 70 ff ff ff dc 	movl   $0xc010b3dc,-0x90(%ebp)
c0101dc2:	b3 10 c0 
c0101dc5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101dcc:	eb 54                	jmp    c0101e22 <mkfs+0x415>
c0101dce:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101dd3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101dd6:	83 c2 04             	add    $0x4,%edx
c0101dd9:	c1 e2 05             	shl    $0x5,%edx
c0101ddc:	01 d0                	add    %edx,%eax
c0101dde:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101de1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101de4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101dea:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ded:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101df4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101df7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101dfa:	83 c2 01             	add    $0x1,%edx
c0101dfd:	c1 e2 0b             	shl    $0xb,%edx
c0101e00:	01 c2                	add    %eax,%edx
c0101e02:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e05:	89 50 08             	mov    %edx,0x8(%eax)
c0101e08:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e0b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101e12:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101e15:	8d 50 05             	lea    0x5(%eax),%edx
c0101e18:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101e1b:	89 50 10             	mov    %edx,0x10(%eax)
c0101e1e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101e22:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101e25:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101e28:	7c a4                	jl     c0101dce <mkfs+0x3c1>
c0101e2a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e2f:	89 c2                	mov    %eax,%edx
c0101e31:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101e34:	83 c0 03             	add    $0x3,%eax
c0101e37:	83 ec 0c             	sub    $0xc,%esp
c0101e3a:	6a 0a                	push   $0xa
c0101e3c:	68 00 02 00 00       	push   $0x200
c0101e41:	52                   	push   %edx
c0101e42:	6a 20                	push   $0x20
c0101e44:	50                   	push   %eax
c0101e45:	e8 ea fa ff ff       	call   c0101934 <rd_wt>
c0101e4a:	83 c4 20             	add    $0x20,%esp
c0101e4d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e52:	89 c2                	mov    %eax,%edx
c0101e54:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101e57:	83 ec 0c             	sub    $0xc,%esp
c0101e5a:	6a 07                	push   $0x7
c0101e5c:	68 00 02 00 00       	push   $0x200
c0101e61:	52                   	push   %edx
c0101e62:	6a 20                	push   $0x20
c0101e64:	50                   	push   %eax
c0101e65:	e8 ca fa ff ff       	call   c0101934 <rd_wt>
c0101e6a:	83 c4 20             	add    $0x20,%esp
c0101e6d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101e74:	00 00 00 
c0101e77:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101e7e:	2e 00 
c0101e80:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101e85:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101e88:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e8b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101e91:	83 ec 0c             	sub    $0xc,%esp
c0101e94:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101e9a:	50                   	push   %eax
c0101e9b:	e8 88 a3 00 00       	call   c010c228 <Strlen>
c0101ea0:	83 c4 10             	add    $0x10,%esp
c0101ea3:	89 c1                	mov    %eax,%ecx
c0101ea5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ea8:	8d 50 04             	lea    0x4(%eax),%edx
c0101eab:	83 ec 04             	sub    $0x4,%esp
c0101eae:	51                   	push   %ecx
c0101eaf:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101eb5:	50                   	push   %eax
c0101eb6:	52                   	push   %edx
c0101eb7:	e8 f0 4e 00 00       	call   c0106dac <Memcpy>
c0101ebc:	83 c4 10             	add    $0x10,%esp
c0101ebf:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101ec5:	b8 00 00 00 00       	mov    $0x0,%eax
c0101eca:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101ecf:	89 d7                	mov    %edx,%edi
c0101ed1:	f3 ab                	rep stos %eax,%es:(%edi)
c0101ed3:	c7 85 34 ff ff ff e8 	movl   $0xc010b3e8,-0xcc(%ebp)
c0101eda:	b3 10 c0 
c0101edd:	c7 85 38 ff ff ff f1 	movl   $0xc010b3f1,-0xc8(%ebp)
c0101ee4:	b3 10 c0 
c0101ee7:	c7 85 3c ff ff ff fa 	movl   $0xc010b3fa,-0xc4(%ebp)
c0101eee:	b3 10 c0 
c0101ef1:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101ef8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101eff:	eb 49                	jmp    c0101f4a <mkfs+0x53d>
c0101f01:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101f05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101f08:	8d 50 02             	lea    0x2(%eax),%edx
c0101f0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f0e:	89 10                	mov    %edx,(%eax)
c0101f10:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101f13:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101f1a:	83 ec 0c             	sub    $0xc,%esp
c0101f1d:	50                   	push   %eax
c0101f1e:	e8 05 a3 00 00       	call   c010c228 <Strlen>
c0101f23:	83 c4 10             	add    $0x10,%esp
c0101f26:	89 c1                	mov    %eax,%ecx
c0101f28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101f2b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101f32:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101f35:	83 c2 04             	add    $0x4,%edx
c0101f38:	83 ec 04             	sub    $0x4,%esp
c0101f3b:	51                   	push   %ecx
c0101f3c:	50                   	push   %eax
c0101f3d:	52                   	push   %edx
c0101f3e:	e8 69 4e 00 00       	call   c0106dac <Memcpy>
c0101f43:	83 c4 10             	add    $0x10,%esp
c0101f46:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101f4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101f4d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101f50:	7c af                	jl     c0101f01 <mkfs+0x4f4>
c0101f52:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101f59:	eb 66                	jmp    c0101fc1 <mkfs+0x5b4>
c0101f5b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f5e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101f65:	83 ec 0c             	sub    $0xc,%esp
c0101f68:	50                   	push   %eax
c0101f69:	e8 ba a2 00 00       	call   c010c228 <Strlen>
c0101f6e:	83 c4 10             	add    $0x10,%esp
c0101f71:	85 c0                	test   %eax,%eax
c0101f73:	74 47                	je     c0101fbc <mkfs+0x5af>
c0101f75:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101f79:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f7c:	8d 50 05             	lea    0x5(%eax),%edx
c0101f7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f82:	89 10                	mov    %edx,(%eax)
c0101f84:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f87:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101f8e:	83 ec 0c             	sub    $0xc,%esp
c0101f91:	50                   	push   %eax
c0101f92:	e8 91 a2 00 00       	call   c010c228 <Strlen>
c0101f97:	83 c4 10             	add    $0x10,%esp
c0101f9a:	89 c1                	mov    %eax,%ecx
c0101f9c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f9f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101fa6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101fa9:	83 c2 04             	add    $0x4,%edx
c0101fac:	83 ec 04             	sub    $0x4,%esp
c0101faf:	51                   	push   %ecx
c0101fb0:	50                   	push   %eax
c0101fb1:	52                   	push   %edx
c0101fb2:	e8 f5 4d 00 00       	call   c0106dac <Memcpy>
c0101fb7:	83 c4 10             	add    $0x10,%esp
c0101fba:	eb 01                	jmp    c0101fbd <mkfs+0x5b0>
c0101fbc:	90                   	nop
c0101fbd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101fc1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101fc4:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101fc7:	7c 92                	jl     c0101f5b <mkfs+0x54e>
c0101fc9:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101fce:	89 c2                	mov    %eax,%edx
c0101fd0:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101fd3:	83 ec 0c             	sub    $0xc,%esp
c0101fd6:	6a 0a                	push   $0xa
c0101fd8:	68 00 02 00 00       	push   $0x200
c0101fdd:	52                   	push   %edx
c0101fde:	6a 20                	push   $0x20
c0101fe0:	50                   	push   %eax
c0101fe1:	e8 4e f9 ff ff       	call   c0101934 <rd_wt>
c0101fe6:	83 c4 20             	add    $0x20,%esp
c0101fe9:	90                   	nop
c0101fea:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101fed:	c9                   	leave  
c0101fee:	c3                   	ret    

c0101fef <init_fs>:
c0101fef:	55                   	push   %ebp
c0101ff0:	89 e5                	mov    %esp,%ebp
c0101ff2:	83 ec 18             	sub    $0x18,%esp
c0101ff5:	83 ec 0c             	sub    $0xc,%esp
c0101ff8:	6a 7c                	push   $0x7c
c0101ffa:	e8 fd f6 ff ff       	call   c01016fc <sys_malloc>
c0101fff:	83 c4 10             	add    $0x10,%esp
c0102002:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102005:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102008:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c010200f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102012:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0102019:	83 ec 04             	sub    $0x4,%esp
c010201c:	6a 03                	push   $0x3
c010201e:	ff 75 f4             	pushl  -0xc(%ebp)
c0102021:	6a 03                	push   $0x3
c0102023:	e8 0d 76 00 00       	call   c0109635 <send_rec>
c0102028:	83 c4 10             	add    $0x10,%esp
c010202b:	e8 dd f9 ff ff       	call   c0101a0d <mkfs>
c0102030:	83 ec 08             	sub    $0x8,%esp
c0102033:	6a 7c                	push   $0x7c
c0102035:	ff 75 f4             	pushl  -0xc(%ebp)
c0102038:	e8 d4 f6 ff ff       	call   c0101711 <sys_free>
c010203d:	83 c4 10             	add    $0x10,%esp
c0102040:	90                   	nop
c0102041:	c9                   	leave  
c0102042:	c3                   	ret    

c0102043 <do_open>:
c0102043:	55                   	push   %ebp
c0102044:	89 e5                	mov    %esp,%ebp
c0102046:	83 ec 68             	sub    $0x68,%esp
c0102049:	83 ec 04             	sub    $0x4,%esp
c010204c:	6a 0c                	push   $0xc
c010204e:	6a 00                	push   $0x0
c0102050:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102053:	50                   	push   %eax
c0102054:	e8 96 a1 00 00       	call   c010c1ef <Memset>
c0102059:	83 c4 10             	add    $0x10,%esp
c010205c:	8b 45 08             	mov    0x8(%ebp),%eax
c010205f:	8b 40 44             	mov    0x44(%eax),%eax
c0102062:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102065:	83 ec 08             	sub    $0x8,%esp
c0102068:	6a 0c                	push   $0xc
c010206a:	ff 75 e4             	pushl  -0x1c(%ebp)
c010206d:	e8 cd 3e 00 00       	call   c0105f3f <alloc_virtual_memory>
c0102072:	83 c4 10             	add    $0x10,%esp
c0102075:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102078:	8b 45 08             	mov    0x8(%ebp),%eax
c010207b:	8b 40 40             	mov    0x40(%eax),%eax
c010207e:	89 c2                	mov    %eax,%edx
c0102080:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102083:	83 ec 04             	sub    $0x4,%esp
c0102086:	52                   	push   %edx
c0102087:	50                   	push   %eax
c0102088:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010208b:	50                   	push   %eax
c010208c:	e8 1b 4d 00 00       	call   c0106dac <Memcpy>
c0102091:	83 c4 10             	add    $0x10,%esp
c0102094:	8b 45 08             	mov    0x8(%ebp),%eax
c0102097:	8b 40 40             	mov    0x40(%eax),%eax
c010209a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c010209f:	8b 45 08             	mov    0x8(%ebp),%eax
c01020a2:	8b 40 74             	mov    0x74(%eax),%eax
c01020a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01020a8:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c01020af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01020b6:	eb 1f                	jmp    c01020d7 <do_open+0x94>
c01020b8:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01020bd:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01020c0:	83 c2 4c             	add    $0x4c,%edx
c01020c3:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01020c7:	85 c0                	test   %eax,%eax
c01020c9:	75 08                	jne    c01020d3 <do_open+0x90>
c01020cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01020d1:	eb 0a                	jmp    c01020dd <do_open+0x9a>
c01020d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01020d7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01020db:	7e db                	jle    c01020b8 <do_open+0x75>
c01020dd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c01020e1:	75 1c                	jne    c01020ff <do_open+0xbc>
c01020e3:	68 c6 01 00 00       	push   $0x1c6
c01020e8:	68 10 b3 10 c0       	push   $0xc010b310
c01020ed:	68 10 b3 10 c0       	push   $0xc010b310
c01020f2:	68 03 b4 10 c0       	push   $0xc010b403
c01020f7:	e8 c9 68 00 00       	call   c01089c5 <assertion_failure>
c01020fc:	83 c4 10             	add    $0x10,%esp
c01020ff:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0102106:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010210d:	eb 1d                	jmp    c010212c <do_open+0xe9>
c010210f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102112:	c1 e0 04             	shl    $0x4,%eax
c0102115:	05 88 13 11 c0       	add    $0xc0111388,%eax
c010211a:	8b 00                	mov    (%eax),%eax
c010211c:	85 c0                	test   %eax,%eax
c010211e:	75 08                	jne    c0102128 <do_open+0xe5>
c0102120:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102123:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102126:	eb 0a                	jmp    c0102132 <do_open+0xef>
c0102128:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010212c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0102130:	7e dd                	jle    c010210f <do_open+0xcc>
c0102132:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0102136:	75 1c                	jne    c0102154 <do_open+0x111>
c0102138:	68 d2 01 00 00       	push   $0x1d2
c010213d:	68 10 b3 10 c0       	push   $0xc010b310
c0102142:	68 10 b3 10 c0       	push   $0xc010b310
c0102147:	68 0b b4 10 c0       	push   $0xc010b40b
c010214c:	e8 74 68 00 00       	call   c01089c5 <assertion_failure>
c0102151:	83 c4 10             	add    $0x10,%esp
c0102154:	83 ec 0c             	sub    $0xc,%esp
c0102157:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010215a:	50                   	push   %eax
c010215b:	e8 d2 00 00 00       	call   c0102232 <search_file>
c0102160:	83 c4 10             	add    $0x10,%esp
c0102163:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102166:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010216a:	75 2b                	jne    c0102197 <do_open+0x154>
c010216c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0102170:	7e 10                	jle    c0102182 <do_open+0x13f>
c0102172:	83 ec 0c             	sub    $0xc,%esp
c0102175:	68 13 b4 10 c0       	push   $0xc010b413
c010217a:	e8 28 68 00 00       	call   c01089a7 <panic>
c010217f:	83 c4 10             	add    $0x10,%esp
c0102182:	83 ec 08             	sub    $0x8,%esp
c0102185:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102188:	50                   	push   %eax
c0102189:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010218c:	50                   	push   %eax
c010218d:	e8 60 04 00 00       	call   c01025f2 <create_file>
c0102192:	83 c4 10             	add    $0x10,%esp
c0102195:	eb 25                	jmp    c01021bc <do_open+0x179>
c0102197:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010219b:	75 0a                	jne    c01021a7 <do_open+0x164>
c010219d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01021a2:	e9 89 00 00 00       	jmp    c0102230 <do_open+0x1ed>
c01021a7:	83 ec 08             	sub    $0x8,%esp
c01021aa:	ff 75 d8             	pushl  -0x28(%ebp)
c01021ad:	8d 45 9c             	lea    -0x64(%ebp),%eax
c01021b0:	50                   	push   %eax
c01021b1:	e8 7a 02 00 00       	call   c0102430 <get_inode>
c01021b6:	83 c4 10             	add    $0x10,%esp
c01021b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01021bc:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01021c1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01021c4:	c1 e2 04             	shl    $0x4,%edx
c01021c7:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c01021cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01021d0:	83 c2 4c             	add    $0x4c,%edx
c01021d3:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c01021d7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01021da:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01021dd:	c1 e2 04             	shl    $0x4,%edx
c01021e0:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c01021e6:	89 02                	mov    %eax,(%edx)
c01021e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021eb:	c1 e0 04             	shl    $0x4,%eax
c01021ee:	05 84 13 11 c0       	add    $0xc0111384,%eax
c01021f3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01021f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021fc:	c1 e0 04             	shl    $0x4,%eax
c01021ff:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102204:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010220a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010220d:	c1 e0 04             	shl    $0x4,%eax
c0102210:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102215:	8b 00                	mov    (%eax),%eax
c0102217:	8d 50 01             	lea    0x1(%eax),%edx
c010221a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010221d:	c1 e0 04             	shl    $0x4,%eax
c0102220:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102225:	89 10                	mov    %edx,(%eax)
c0102227:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010222a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010222d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102230:	c9                   	leave  
c0102231:	c3                   	ret    

c0102232 <search_file>:
c0102232:	55                   	push   %ebp
c0102233:	89 e5                	mov    %esp,%ebp
c0102235:	83 ec 68             	sub    $0x68,%esp
c0102238:	83 ec 04             	sub    $0x4,%esp
c010223b:	6a 0c                	push   $0xc
c010223d:	6a 00                	push   $0x0
c010223f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102242:	50                   	push   %eax
c0102243:	e8 a7 9f 00 00       	call   c010c1ef <Memset>
c0102248:	83 c4 10             	add    $0x10,%esp
c010224b:	83 ec 04             	sub    $0x4,%esp
c010224e:	6a 28                	push   $0x28
c0102250:	6a 00                	push   $0x0
c0102252:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102255:	50                   	push   %eax
c0102256:	e8 94 9f 00 00       	call   c010c1ef <Memset>
c010225b:	83 c4 10             	add    $0x10,%esp
c010225e:	83 ec 04             	sub    $0x4,%esp
c0102261:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102264:	50                   	push   %eax
c0102265:	ff 75 08             	pushl  0x8(%ebp)
c0102268:	8d 45 c0             	lea    -0x40(%ebp),%eax
c010226b:	50                   	push   %eax
c010226c:	e8 f3 00 00 00       	call   c0102364 <strip_path>
c0102271:	83 c4 10             	add    $0x10,%esp
c0102274:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102277:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c010227b:	75 0a                	jne    c0102287 <search_file+0x55>
c010227d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102282:	e9 db 00 00 00       	jmp    c0102362 <search_file+0x130>
c0102287:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010228a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010228d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102290:	05 00 02 00 00       	add    $0x200,%eax
c0102295:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010229b:	85 c0                	test   %eax,%eax
c010229d:	0f 48 c2             	cmovs  %edx,%eax
c01022a0:	c1 f8 09             	sar    $0x9,%eax
c01022a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01022a6:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01022a9:	c1 e8 04             	shr    $0x4,%eax
c01022ac:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01022af:	e8 5c 14 00 00       	call   c0103710 <get_super_block>
c01022b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01022b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01022ba:	8b 00                	mov    (%eax),%eax
c01022bc:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01022bf:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c01022c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01022cd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01022d4:	eb 7b                	jmp    c0102351 <search_file+0x11f>
c01022d6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01022db:	89 c1                	mov    %eax,%ecx
c01022dd:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01022e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022e3:	01 d0                	add    %edx,%eax
c01022e5:	83 ec 0c             	sub    $0xc,%esp
c01022e8:	6a 07                	push   $0x7
c01022ea:	68 00 02 00 00       	push   $0x200
c01022ef:	51                   	push   %ecx
c01022f0:	ff 75 cc             	pushl  -0x34(%ebp)
c01022f3:	50                   	push   %eax
c01022f4:	e8 3b f6 ff ff       	call   c0101934 <rd_wt>
c01022f9:	83 c4 20             	add    $0x20,%esp
c01022fc:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102301:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102304:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010230b:	eb 35                	jmp    c0102342 <search_file+0x110>
c010230d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102311:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102314:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102317:	7f 33                	jg     c010234c <search_file+0x11a>
c0102319:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010231c:	83 c0 04             	add    $0x4,%eax
c010231f:	83 ec 08             	sub    $0x8,%esp
c0102322:	50                   	push   %eax
c0102323:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102326:	50                   	push   %eax
c0102327:	e8 70 76 00 00       	call   c010999c <strcmp>
c010232c:	83 c4 10             	add    $0x10,%esp
c010232f:	85 c0                	test   %eax,%eax
c0102331:	75 07                	jne    c010233a <search_file+0x108>
c0102333:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102336:	8b 00                	mov    (%eax),%eax
c0102338:	eb 28                	jmp    c0102362 <search_file+0x130>
c010233a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010233e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0102342:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102345:	83 f8 1f             	cmp    $0x1f,%eax
c0102348:	76 c3                	jbe    c010230d <search_file+0xdb>
c010234a:	eb 01                	jmp    c010234d <search_file+0x11b>
c010234c:	90                   	nop
c010234d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102351:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102354:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102357:	0f 8c 79 ff ff ff    	jl     c01022d6 <search_file+0xa4>
c010235d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102362:	c9                   	leave  
c0102363:	c3                   	ret    

c0102364 <strip_path>:
c0102364:	55                   	push   %ebp
c0102365:	89 e5                	mov    %esp,%ebp
c0102367:	83 ec 10             	sub    $0x10,%esp
c010236a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010236e:	75 0a                	jne    c010237a <strip_path+0x16>
c0102370:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102375:	e9 b4 00 00 00       	jmp    c010242e <strip_path+0xca>
c010237a:	8b 45 08             	mov    0x8(%ebp),%eax
c010237d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102380:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102383:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102386:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102389:	0f b6 00             	movzbl (%eax),%eax
c010238c:	3c 2f                	cmp    $0x2f,%al
c010238e:	75 2d                	jne    c01023bd <strip_path+0x59>
c0102390:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102394:	eb 27                	jmp    c01023bd <strip_path+0x59>
c0102396:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102399:	0f b6 00             	movzbl (%eax),%eax
c010239c:	3c 2f                	cmp    $0x2f,%al
c010239e:	75 0a                	jne    c01023aa <strip_path+0x46>
c01023a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01023a5:	e9 84 00 00 00       	jmp    c010242e <strip_path+0xca>
c01023aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01023ad:	0f b6 10             	movzbl (%eax),%edx
c01023b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01023b3:	88 10                	mov    %dl,(%eax)
c01023b5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01023b9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01023bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01023c0:	0f b6 00             	movzbl (%eax),%eax
c01023c3:	84 c0                	test   %al,%al
c01023c5:	75 cf                	jne    c0102396 <strip_path+0x32>
c01023c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01023ca:	c6 00 00             	movb   $0x0,(%eax)
c01023cd:	8b 45 10             	mov    0x10(%ebp),%eax
c01023d0:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c01023d6:	89 10                	mov    %edx,(%eax)
c01023d8:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c01023de:	89 50 04             	mov    %edx,0x4(%eax)
c01023e1:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c01023e7:	89 50 08             	mov    %edx,0x8(%eax)
c01023ea:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c01023f0:	89 50 0c             	mov    %edx,0xc(%eax)
c01023f3:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c01023f9:	89 50 10             	mov    %edx,0x10(%eax)
c01023fc:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102402:	89 50 14             	mov    %edx,0x14(%eax)
c0102405:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010240b:	89 50 18             	mov    %edx,0x18(%eax)
c010240e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102414:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102417:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010241d:	89 50 20             	mov    %edx,0x20(%eax)
c0102420:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102426:	89 50 24             	mov    %edx,0x24(%eax)
c0102429:	b8 00 00 00 00       	mov    $0x0,%eax
c010242e:	c9                   	leave  
c010242f:	c3                   	ret    

c0102430 <get_inode>:
c0102430:	55                   	push   %ebp
c0102431:	89 e5                	mov    %esp,%ebp
c0102433:	56                   	push   %esi
c0102434:	53                   	push   %ebx
c0102435:	83 ec 20             	sub    $0x20,%esp
c0102438:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010243c:	75 0a                	jne    c0102448 <get_inode+0x18>
c010243e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102443:	e9 a3 01 00 00       	jmp    c01025eb <get_inode+0x1bb>
c0102448:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010244f:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102456:	eb 69                	jmp    c01024c1 <get_inode+0x91>
c0102458:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010245b:	8b 40 24             	mov    0x24(%eax),%eax
c010245e:	85 c0                	test   %eax,%eax
c0102460:	7e 53                	jle    c01024b5 <get_inode+0x85>
c0102462:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102465:	8b 40 10             	mov    0x10(%eax),%eax
c0102468:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010246b:	75 50                	jne    c01024bd <get_inode+0x8d>
c010246d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102470:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102473:	8b 0a                	mov    (%edx),%ecx
c0102475:	89 08                	mov    %ecx,(%eax)
c0102477:	8b 4a 04             	mov    0x4(%edx),%ecx
c010247a:	89 48 04             	mov    %ecx,0x4(%eax)
c010247d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102480:	89 48 08             	mov    %ecx,0x8(%eax)
c0102483:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102486:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102489:	8b 4a 10             	mov    0x10(%edx),%ecx
c010248c:	89 48 10             	mov    %ecx,0x10(%eax)
c010248f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102492:	89 48 14             	mov    %ecx,0x14(%eax)
c0102495:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102498:	89 48 18             	mov    %ecx,0x18(%eax)
c010249b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010249e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01024a1:	8b 4a 20             	mov    0x20(%edx),%ecx
c01024a4:	89 48 20             	mov    %ecx,0x20(%eax)
c01024a7:	8b 52 24             	mov    0x24(%edx),%edx
c01024aa:	89 50 24             	mov    %edx,0x24(%eax)
c01024ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024b0:	e9 36 01 00 00       	jmp    c01025eb <get_inode+0x1bb>
c01024b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01024bb:	eb 0d                	jmp    c01024ca <get_inode+0x9a>
c01024bd:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c01024c1:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c01024c8:	76 8e                	jbe    c0102458 <get_inode+0x28>
c01024ca:	e8 41 12 00 00       	call   c0103710 <get_super_block>
c01024cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01024d2:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01024d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024dc:	8b 40 04             	mov    0x4(%eax),%eax
c01024df:	8d 50 02             	lea    0x2(%eax),%edx
c01024e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024e5:	8b 40 08             	mov    0x8(%eax),%eax
c01024e8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01024eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01024ee:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01024f1:	b8 00 02 00 00       	mov    $0x200,%eax
c01024f6:	99                   	cltd   
c01024f7:	f7 7d e8             	idivl  -0x18(%ebp)
c01024fa:	89 c6                	mov    %eax,%esi
c01024fc:	89 c8                	mov    %ecx,%eax
c01024fe:	99                   	cltd   
c01024ff:	f7 fe                	idiv   %esi
c0102501:	01 d8                	add    %ebx,%eax
c0102503:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102506:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010250d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102512:	83 ec 0c             	sub    $0xc,%esp
c0102515:	6a 07                	push   $0x7
c0102517:	68 00 02 00 00       	push   $0x200
c010251c:	50                   	push   %eax
c010251d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102520:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102523:	e8 0c f4 ff ff       	call   c0101934 <rd_wt>
c0102528:	83 c4 20             	add    $0x20,%esp
c010252b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010252e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102531:	b8 00 02 00 00       	mov    $0x200,%eax
c0102536:	99                   	cltd   
c0102537:	f7 7d e8             	idivl  -0x18(%ebp)
c010253a:	89 c3                	mov    %eax,%ebx
c010253c:	89 c8                	mov    %ecx,%eax
c010253e:	99                   	cltd   
c010253f:	f7 fb                	idiv   %ebx
c0102541:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0102544:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010254a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010254d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102551:	01 d0                	add    %edx,%eax
c0102553:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102556:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102559:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010255c:	8b 0a                	mov    (%edx),%ecx
c010255e:	89 08                	mov    %ecx,(%eax)
c0102560:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102563:	89 48 04             	mov    %ecx,0x4(%eax)
c0102566:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102569:	89 48 08             	mov    %ecx,0x8(%eax)
c010256c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010256f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102572:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102575:	89 48 10             	mov    %ecx,0x10(%eax)
c0102578:	8b 4a 14             	mov    0x14(%edx),%ecx
c010257b:	89 48 14             	mov    %ecx,0x14(%eax)
c010257e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102581:	89 48 18             	mov    %ecx,0x18(%eax)
c0102584:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102587:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010258a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010258d:	89 48 20             	mov    %ecx,0x20(%eax)
c0102590:	8b 52 24             	mov    0x24(%edx),%edx
c0102593:	89 50 24             	mov    %edx,0x24(%eax)
c0102596:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102599:	8b 55 0c             	mov    0xc(%ebp),%edx
c010259c:	89 50 10             	mov    %edx,0x10(%eax)
c010259f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025a2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01025a5:	89 50 20             	mov    %edx,0x20(%eax)
c01025a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01025ae:	8b 0a                	mov    (%edx),%ecx
c01025b0:	89 08                	mov    %ecx,(%eax)
c01025b2:	8b 4a 04             	mov    0x4(%edx),%ecx
c01025b5:	89 48 04             	mov    %ecx,0x4(%eax)
c01025b8:	8b 4a 08             	mov    0x8(%edx),%ecx
c01025bb:	89 48 08             	mov    %ecx,0x8(%eax)
c01025be:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01025c1:	89 48 0c             	mov    %ecx,0xc(%eax)
c01025c4:	8b 4a 10             	mov    0x10(%edx),%ecx
c01025c7:	89 48 10             	mov    %ecx,0x10(%eax)
c01025ca:	8b 4a 14             	mov    0x14(%edx),%ecx
c01025cd:	89 48 14             	mov    %ecx,0x14(%eax)
c01025d0:	8b 4a 18             	mov    0x18(%edx),%ecx
c01025d3:	89 48 18             	mov    %ecx,0x18(%eax)
c01025d6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01025d9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01025dc:	8b 4a 20             	mov    0x20(%edx),%ecx
c01025df:	89 48 20             	mov    %ecx,0x20(%eax)
c01025e2:	8b 52 24             	mov    0x24(%edx),%edx
c01025e5:	89 50 24             	mov    %edx,0x24(%eax)
c01025e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01025eb:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01025ee:	5b                   	pop    %ebx
c01025ef:	5e                   	pop    %esi
c01025f0:	5d                   	pop    %ebp
c01025f1:	c3                   	ret    

c01025f2 <create_file>:
c01025f2:	55                   	push   %ebp
c01025f3:	89 e5                	mov    %esp,%ebp
c01025f5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01025fb:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01025fe:	50                   	push   %eax
c01025ff:	ff 75 0c             	pushl  0xc(%ebp)
c0102602:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102605:	50                   	push   %eax
c0102606:	e8 59 fd ff ff       	call   c0102364 <strip_path>
c010260b:	83 c4 0c             	add    $0xc,%esp
c010260e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102611:	75 0a                	jne    c010261d <create_file+0x2b>
c0102613:	b8 00 00 00 00       	mov    $0x0,%eax
c0102618:	e9 de 00 00 00       	jmp    c01026fb <create_file+0x109>
c010261d:	e8 db 00 00 00       	call   c01026fd <alloc_imap_bit>
c0102622:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102625:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102629:	75 0a                	jne    c0102635 <create_file+0x43>
c010262b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102630:	e9 c6 00 00 00       	jmp    c01026fb <create_file+0x109>
c0102635:	e8 d6 10 00 00       	call   c0103710 <get_super_block>
c010263a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010263d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102640:	8b 40 10             	mov    0x10(%eax),%eax
c0102643:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102646:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102649:	83 ec 08             	sub    $0x8,%esp
c010264c:	50                   	push   %eax
c010264d:	ff 75 f4             	pushl  -0xc(%ebp)
c0102650:	e8 a5 01 00 00       	call   c01027fa <alloc_smap_bit>
c0102655:	83 c4 10             	add    $0x10,%esp
c0102658:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010265b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010265f:	75 0a                	jne    c010266b <create_file+0x79>
c0102661:	b8 00 00 00 00       	mov    $0x0,%eax
c0102666:	e9 90 00 00 00       	jmp    c01026fb <create_file+0x109>
c010266b:	83 ec 04             	sub    $0x4,%esp
c010266e:	ff 75 e8             	pushl  -0x18(%ebp)
c0102671:	ff 75 f4             	pushl  -0xc(%ebp)
c0102674:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0102677:	50                   	push   %eax
c0102678:	e8 1e 03 00 00       	call   c010299b <new_inode>
c010267d:	83 c4 10             	add    $0x10,%esp
c0102680:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102683:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102687:	75 07                	jne    c0102690 <create_file+0x9e>
c0102689:	b8 00 00 00 00       	mov    $0x0,%eax
c010268e:	eb 6b                	jmp    c01026fb <create_file+0x109>
c0102690:	ff 75 f4             	pushl  -0xc(%ebp)
c0102693:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102696:	50                   	push   %eax
c0102697:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010269a:	50                   	push   %eax
c010269b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01026a1:	50                   	push   %eax
c01026a2:	e8 12 04 00 00       	call   c0102ab9 <new_dir_entry>
c01026a7:	83 c4 10             	add    $0x10,%esp
c01026aa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01026ad:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01026b1:	75 07                	jne    c01026ba <create_file+0xc8>
c01026b3:	b8 00 00 00 00       	mov    $0x0,%eax
c01026b8:	eb 41                	jmp    c01026fb <create_file+0x109>
c01026ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01026bd:	8b 55 84             	mov    -0x7c(%ebp),%edx
c01026c0:	89 10                	mov    %edx,(%eax)
c01026c2:	8b 55 88             	mov    -0x78(%ebp),%edx
c01026c5:	89 50 04             	mov    %edx,0x4(%eax)
c01026c8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01026cb:	89 50 08             	mov    %edx,0x8(%eax)
c01026ce:	8b 55 90             	mov    -0x70(%ebp),%edx
c01026d1:	89 50 0c             	mov    %edx,0xc(%eax)
c01026d4:	8b 55 94             	mov    -0x6c(%ebp),%edx
c01026d7:	89 50 10             	mov    %edx,0x10(%eax)
c01026da:	8b 55 98             	mov    -0x68(%ebp),%edx
c01026dd:	89 50 14             	mov    %edx,0x14(%eax)
c01026e0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01026e3:	89 50 18             	mov    %edx,0x18(%eax)
c01026e6:	8b 55 a0             	mov    -0x60(%ebp),%edx
c01026e9:	89 50 1c             	mov    %edx,0x1c(%eax)
c01026ec:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c01026ef:	89 50 20             	mov    %edx,0x20(%eax)
c01026f2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01026f5:	89 50 24             	mov    %edx,0x24(%eax)
c01026f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01026fb:	c9                   	leave  
c01026fc:	c3                   	ret    

c01026fd <alloc_imap_bit>:
c01026fd:	55                   	push   %ebp
c01026fe:	89 e5                	mov    %esp,%ebp
c0102700:	53                   	push   %ebx
c0102701:	83 ec 24             	sub    $0x24,%esp
c0102704:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010270b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102712:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102717:	83 ec 0c             	sub    $0xc,%esp
c010271a:	6a 07                	push   $0x7
c010271c:	68 00 02 00 00       	push   $0x200
c0102721:	50                   	push   %eax
c0102722:	ff 75 e8             	pushl  -0x18(%ebp)
c0102725:	ff 75 ec             	pushl  -0x14(%ebp)
c0102728:	e8 07 f2 ff ff       	call   c0101934 <rd_wt>
c010272d:	83 c4 20             	add    $0x20,%esp
c0102730:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102737:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010273e:	e9 a5 00 00 00       	jmp    c01027e8 <alloc_imap_bit+0xeb>
c0102743:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010274a:	e9 8b 00 00 00       	jmp    c01027da <alloc_imap_bit+0xdd>
c010274f:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102755:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102758:	01 d0                	add    %edx,%eax
c010275a:	0f b6 00             	movzbl (%eax),%eax
c010275d:	0f be d0             	movsbl %al,%edx
c0102760:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102763:	89 c1                	mov    %eax,%ecx
c0102765:	d3 fa                	sar    %cl,%edx
c0102767:	89 d0                	mov    %edx,%eax
c0102769:	83 e0 01             	and    $0x1,%eax
c010276c:	85 c0                	test   %eax,%eax
c010276e:	74 06                	je     c0102776 <alloc_imap_bit+0x79>
c0102770:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102774:	eb 64                	jmp    c01027da <alloc_imap_bit+0xdd>
c0102776:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010277c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010277f:	01 d0                	add    %edx,%eax
c0102781:	0f b6 18             	movzbl (%eax),%ebx
c0102784:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102787:	ba 01 00 00 00       	mov    $0x1,%edx
c010278c:	89 c1                	mov    %eax,%ecx
c010278e:	d3 e2                	shl    %cl,%edx
c0102790:	89 d0                	mov    %edx,%eax
c0102792:	89 c1                	mov    %eax,%ecx
c0102794:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010279a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010279d:	01 d0                	add    %edx,%eax
c010279f:	09 cb                	or     %ecx,%ebx
c01027a1:	89 da                	mov    %ebx,%edx
c01027a3:	88 10                	mov    %dl,(%eax)
c01027a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027a8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01027af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027b2:	01 d0                	add    %edx,%eax
c01027b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01027b7:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01027bc:	83 ec 0c             	sub    $0xc,%esp
c01027bf:	6a 0a                	push   $0xa
c01027c1:	68 00 02 00 00       	push   $0x200
c01027c6:	50                   	push   %eax
c01027c7:	ff 75 e8             	pushl  -0x18(%ebp)
c01027ca:	ff 75 ec             	pushl  -0x14(%ebp)
c01027cd:	e8 62 f1 ff ff       	call   c0101934 <rd_wt>
c01027d2:	83 c4 20             	add    $0x20,%esp
c01027d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01027d8:	eb 1b                	jmp    c01027f5 <alloc_imap_bit+0xf8>
c01027da:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c01027de:	0f 8e 6b ff ff ff    	jle    c010274f <alloc_imap_bit+0x52>
c01027e4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01027e8:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c01027ef:	0f 8e 4e ff ff ff    	jle    c0102743 <alloc_imap_bit+0x46>
c01027f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01027f8:	c9                   	leave  
c01027f9:	c3                   	ret    

c01027fa <alloc_smap_bit>:
c01027fa:	55                   	push   %ebp
c01027fb:	89 e5                	mov    %esp,%ebp
c01027fd:	53                   	push   %ebx
c01027fe:	83 ec 34             	sub    $0x34,%esp
c0102801:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102805:	75 1c                	jne    c0102823 <alloc_smap_bit+0x29>
c0102807:	68 fd 02 00 00       	push   $0x2fd
c010280c:	68 10 b3 10 c0       	push   $0xc010b310
c0102811:	68 10 b3 10 c0       	push   $0xc010b310
c0102816:	68 20 b4 10 c0       	push   $0xc010b420
c010281b:	e8 a5 61 00 00       	call   c01089c5 <assertion_failure>
c0102820:	83 c4 10             	add    $0x10,%esp
c0102823:	e8 e8 0e 00 00       	call   c0103710 <get_super_block>
c0102828:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010282b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010282e:	8b 40 08             	mov    0x8(%eax),%eax
c0102831:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102834:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102837:	8b 40 04             	mov    0x4(%eax),%eax
c010283a:	83 c0 02             	add    $0x2,%eax
c010283d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102840:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102847:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c010284e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102855:	e9 20 01 00 00       	jmp    c010297a <alloc_smap_bit+0x180>
c010285a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010285d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102860:	01 d0                	add    %edx,%eax
c0102862:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102865:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010286a:	83 ec 0c             	sub    $0xc,%esp
c010286d:	6a 07                	push   $0x7
c010286f:	68 00 02 00 00       	push   $0x200
c0102874:	50                   	push   %eax
c0102875:	ff 75 d8             	pushl  -0x28(%ebp)
c0102878:	ff 75 d4             	pushl  -0x2c(%ebp)
c010287b:	e8 b4 f0 ff ff       	call   c0101934 <rd_wt>
c0102880:	83 c4 20             	add    $0x20,%esp
c0102883:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010288a:	e9 b0 00 00 00       	jmp    c010293f <alloc_smap_bit+0x145>
c010288f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102896:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010289a:	0f 85 8c 00 00 00    	jne    c010292c <alloc_smap_bit+0x132>
c01028a0:	eb 45                	jmp    c01028e7 <alloc_smap_bit+0xed>
c01028a2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01028a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01028ab:	01 d0                	add    %edx,%eax
c01028ad:	0f b6 00             	movzbl (%eax),%eax
c01028b0:	0f be d0             	movsbl %al,%edx
c01028b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01028b6:	89 c1                	mov    %eax,%ecx
c01028b8:	d3 fa                	sar    %cl,%edx
c01028ba:	89 d0                	mov    %edx,%eax
c01028bc:	83 e0 01             	and    $0x1,%eax
c01028bf:	85 c0                	test   %eax,%eax
c01028c1:	74 06                	je     c01028c9 <alloc_smap_bit+0xcf>
c01028c3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01028c7:	eb 1e                	jmp    c01028e7 <alloc_smap_bit+0xed>
c01028c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028cc:	c1 e0 09             	shl    $0x9,%eax
c01028cf:	89 c2                	mov    %eax,%edx
c01028d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01028d4:	01 d0                	add    %edx,%eax
c01028d6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01028dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01028e0:	01 d0                	add    %edx,%eax
c01028e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01028e5:	eb 06                	jmp    c01028ed <alloc_smap_bit+0xf3>
c01028e7:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c01028eb:	7e b5                	jle    c01028a2 <alloc_smap_bit+0xa8>
c01028ed:	eb 3d                	jmp    c010292c <alloc_smap_bit+0x132>
c01028ef:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01028f3:	74 45                	je     c010293a <alloc_smap_bit+0x140>
c01028f5:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01028fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01028fe:	01 d0                	add    %edx,%eax
c0102900:	0f b6 18             	movzbl (%eax),%ebx
c0102903:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102906:	ba 01 00 00 00       	mov    $0x1,%edx
c010290b:	89 c1                	mov    %eax,%ecx
c010290d:	d3 e2                	shl    %cl,%edx
c010290f:	89 d0                	mov    %edx,%eax
c0102911:	89 c1                	mov    %eax,%ecx
c0102913:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102919:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010291c:	01 d0                	add    %edx,%eax
c010291e:	09 cb                	or     %ecx,%ebx
c0102920:	89 da                	mov    %ebx,%edx
c0102922:	88 10                	mov    %dl,(%eax)
c0102924:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102928:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010292c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102930:	74 09                	je     c010293b <alloc_smap_bit+0x141>
c0102932:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102936:	7e b7                	jle    c01028ef <alloc_smap_bit+0xf5>
c0102938:	eb 01                	jmp    c010293b <alloc_smap_bit+0x141>
c010293a:	90                   	nop
c010293b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010293f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102946:	0f 8e 43 ff ff ff    	jle    c010288f <alloc_smap_bit+0x95>
c010294c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102950:	74 1e                	je     c0102970 <alloc_smap_bit+0x176>
c0102952:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102957:	83 ec 0c             	sub    $0xc,%esp
c010295a:	6a 0a                	push   $0xa
c010295c:	68 00 02 00 00       	push   $0x200
c0102961:	50                   	push   %eax
c0102962:	ff 75 d8             	pushl  -0x28(%ebp)
c0102965:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102968:	e8 c7 ef ff ff       	call   c0101934 <rd_wt>
c010296d:	83 c4 20             	add    $0x20,%esp
c0102970:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102974:	74 12                	je     c0102988 <alloc_smap_bit+0x18e>
c0102976:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010297a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010297d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102980:	0f 8c d4 fe ff ff    	jl     c010285a <alloc_smap_bit+0x60>
c0102986:	eb 01                	jmp    c0102989 <alloc_smap_bit+0x18f>
c0102988:	90                   	nop
c0102989:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010298c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010298f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102992:	8b 00                	mov    (%eax),%eax
c0102994:	01 d0                	add    %edx,%eax
c0102996:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102999:	c9                   	leave  
c010299a:	c3                   	ret    

c010299b <new_inode>:
c010299b:	55                   	push   %ebp
c010299c:	89 e5                	mov    %esp,%ebp
c010299e:	83 ec 38             	sub    $0x38,%esp
c01029a1:	83 ec 08             	sub    $0x8,%esp
c01029a4:	ff 75 0c             	pushl  0xc(%ebp)
c01029a7:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01029aa:	50                   	push   %eax
c01029ab:	e8 80 fa ff ff       	call   c0102430 <get_inode>
c01029b0:	83 c4 10             	add    $0x10,%esp
c01029b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01029b6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01029ba:	75 0a                	jne    c01029c6 <new_inode+0x2b>
c01029bc:	b8 00 00 00 00       	mov    $0x0,%eax
c01029c1:	e9 f1 00 00 00       	jmp    c0102ab7 <new_inode+0x11c>
c01029c6:	8b 45 10             	mov    0x10(%ebp),%eax
c01029c9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01029cc:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c01029d3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01029da:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c01029e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029e4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01029e7:	83 ec 0c             	sub    $0xc,%esp
c01029ea:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01029ed:	50                   	push   %eax
c01029ee:	e8 39 0b 00 00       	call   c010352c <sync_inode>
c01029f3:	83 c4 10             	add    $0x10,%esp
c01029f6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01029fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102a04:	eb 1d                	jmp    c0102a23 <new_inode+0x88>
c0102a06:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102a09:	89 d0                	mov    %edx,%eax
c0102a0b:	c1 e0 02             	shl    $0x2,%eax
c0102a0e:	01 d0                	add    %edx,%eax
c0102a10:	c1 e0 03             	shl    $0x3,%eax
c0102a13:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102a18:	8b 00                	mov    (%eax),%eax
c0102a1a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0102a1d:	74 0c                	je     c0102a2b <new_inode+0x90>
c0102a1f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102a23:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102a27:	7e dd                	jle    c0102a06 <new_inode+0x6b>
c0102a29:	eb 01                	jmp    c0102a2c <new_inode+0x91>
c0102a2b:	90                   	nop
c0102a2c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102a2f:	89 d0                	mov    %edx,%eax
c0102a31:	c1 e0 02             	shl    $0x2,%eax
c0102a34:	01 d0                	add    %edx,%eax
c0102a36:	c1 e0 03             	shl    $0x3,%eax
c0102a39:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c0102a3e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102a41:	89 10                	mov    %edx,(%eax)
c0102a43:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a46:	89 50 04             	mov    %edx,0x4(%eax)
c0102a49:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102a4c:	89 50 08             	mov    %edx,0x8(%eax)
c0102a4f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102a52:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a55:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102a58:	89 50 10             	mov    %edx,0x10(%eax)
c0102a5b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102a5e:	89 50 14             	mov    %edx,0x14(%eax)
c0102a61:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102a64:	89 50 18             	mov    %edx,0x18(%eax)
c0102a67:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102a6a:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102a6d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102a70:	89 50 20             	mov    %edx,0x20(%eax)
c0102a73:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102a76:	89 50 24             	mov    %edx,0x24(%eax)
c0102a79:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a7c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102a7f:	89 10                	mov    %edx,(%eax)
c0102a81:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a84:	89 50 04             	mov    %edx,0x4(%eax)
c0102a87:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102a8a:	89 50 08             	mov    %edx,0x8(%eax)
c0102a8d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102a90:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a93:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102a96:	89 50 10             	mov    %edx,0x10(%eax)
c0102a99:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0102a9c:	89 50 14             	mov    %edx,0x14(%eax)
c0102a9f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102aa2:	89 50 18             	mov    %edx,0x18(%eax)
c0102aa5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102aa8:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102aab:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102aae:	89 50 20             	mov    %edx,0x20(%eax)
c0102ab1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102ab4:	89 50 24             	mov    %edx,0x24(%eax)
c0102ab7:	c9                   	leave  
c0102ab8:	c3                   	ret    

c0102ab9 <new_dir_entry>:
c0102ab9:	55                   	push   %ebp
c0102aba:	89 e5                	mov    %esp,%ebp
c0102abc:	83 ec 48             	sub    $0x48,%esp
c0102abf:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102ac6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ac9:	8b 40 04             	mov    0x4(%eax),%eax
c0102acc:	99                   	cltd   
c0102acd:	f7 7d dc             	idivl  -0x24(%ebp)
c0102ad0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102ad3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ad6:	8b 40 0c             	mov    0xc(%eax),%eax
c0102ad9:	99                   	cltd   
c0102ada:	f7 7d dc             	idivl  -0x24(%ebp)
c0102add:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102ae0:	e8 2b 0c 00 00       	call   c0103710 <get_super_block>
c0102ae5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102ae8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102aeb:	8b 00                	mov    (%eax),%eax
c0102aed:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102af0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102af3:	8b 40 0c             	mov    0xc(%eax),%eax
c0102af6:	05 00 02 00 00       	add    $0x200,%eax
c0102afb:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102b01:	85 c0                	test   %eax,%eax
c0102b03:	0f 48 c2             	cmovs  %edx,%eax
c0102b06:	c1 f8 09             	sar    $0x9,%eax
c0102b09:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102b0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102b13:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102b1a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102b21:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102b28:	eb 7f                	jmp    c0102ba9 <new_dir_entry+0xf0>
c0102b2a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102b2f:	89 c1                	mov    %eax,%ecx
c0102b31:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102b34:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b37:	01 d0                	add    %edx,%eax
c0102b39:	83 ec 0c             	sub    $0xc,%esp
c0102b3c:	6a 07                	push   $0x7
c0102b3e:	68 00 02 00 00       	push   $0x200
c0102b43:	51                   	push   %ecx
c0102b44:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102b47:	50                   	push   %eax
c0102b48:	e8 e7 ed ff ff       	call   c0101934 <rd_wt>
c0102b4d:	83 c4 20             	add    $0x20,%esp
c0102b50:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102b55:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102b58:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102b5f:	eb 25                	jmp    c0102b86 <new_dir_entry+0xcd>
c0102b61:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102b65:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b68:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102b6b:	7f 29                	jg     c0102b96 <new_dir_entry+0xdd>
c0102b6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b70:	8b 00                	mov    (%eax),%eax
c0102b72:	85 c0                	test   %eax,%eax
c0102b74:	75 08                	jne    c0102b7e <new_dir_entry+0xc5>
c0102b76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b79:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102b7c:	eb 19                	jmp    c0102b97 <new_dir_entry+0xde>
c0102b7e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102b82:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102b86:	b8 00 02 00 00       	mov    $0x200,%eax
c0102b8b:	99                   	cltd   
c0102b8c:	f7 7d dc             	idivl  -0x24(%ebp)
c0102b8f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102b92:	7c cd                	jl     c0102b61 <new_dir_entry+0xa8>
c0102b94:	eb 01                	jmp    c0102b97 <new_dir_entry+0xde>
c0102b96:	90                   	nop
c0102b97:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102b9a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102b9d:	7f 16                	jg     c0102bb5 <new_dir_entry+0xfc>
c0102b9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102ba3:	75 10                	jne    c0102bb5 <new_dir_entry+0xfc>
c0102ba5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102ba9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102bac:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102baf:	0f 8c 75 ff ff ff    	jl     c0102b2a <new_dir_entry+0x71>
c0102bb5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102bb8:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102bbb:	75 0a                	jne    c0102bc7 <new_dir_entry+0x10e>
c0102bbd:	b8 00 00 00 00       	mov    $0x0,%eax
c0102bc2:	e9 fc 00 00 00       	jmp    c0102cc3 <new_dir_entry+0x20a>
c0102bc7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102bce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102bd2:	75 1e                	jne    c0102bf2 <new_dir_entry+0x139>
c0102bd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102bd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102bda:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102bdd:	8b 50 04             	mov    0x4(%eax),%edx
c0102be0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102be3:	01 c2                	add    %eax,%edx
c0102be5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102be8:	89 50 04             	mov    %edx,0x4(%eax)
c0102beb:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102bf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102bf5:	8b 55 14             	mov    0x14(%ebp),%edx
c0102bf8:	89 10                	mov    %edx,(%eax)
c0102bfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102bfd:	83 c0 04             	add    $0x4,%eax
c0102c00:	83 ec 08             	sub    $0x8,%esp
c0102c03:	ff 75 10             	pushl  0x10(%ebp)
c0102c06:	50                   	push   %eax
c0102c07:	e8 02 96 00 00       	call   c010c20e <Strcpy>
c0102c0c:	83 c4 10             	add    $0x10,%esp
c0102c0f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c12:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102c15:	8b 0a                	mov    (%edx),%ecx
c0102c17:	89 08                	mov    %ecx,(%eax)
c0102c19:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102c1c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102c1f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102c22:	89 48 08             	mov    %ecx,0x8(%eax)
c0102c25:	8b 52 0c             	mov    0xc(%edx),%edx
c0102c28:	89 50 0c             	mov    %edx,0xc(%eax)
c0102c2b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c30:	89 c1                	mov    %eax,%ecx
c0102c32:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102c35:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102c38:	01 d0                	add    %edx,%eax
c0102c3a:	83 ec 0c             	sub    $0xc,%esp
c0102c3d:	6a 0a                	push   $0xa
c0102c3f:	68 00 02 00 00       	push   $0x200
c0102c44:	51                   	push   %ecx
c0102c45:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102c48:	50                   	push   %eax
c0102c49:	e8 e6 ec ff ff       	call   c0101934 <rd_wt>
c0102c4e:	83 c4 20             	add    $0x20,%esp
c0102c51:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102c55:	74 69                	je     c0102cc0 <new_dir_entry+0x207>
c0102c57:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c5a:	8b 10                	mov    (%eax),%edx
c0102c5c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102c62:	8b 50 04             	mov    0x4(%eax),%edx
c0102c65:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102c6b:	8b 50 08             	mov    0x8(%eax),%edx
c0102c6e:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102c74:	8b 50 0c             	mov    0xc(%eax),%edx
c0102c77:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102c7d:	8b 50 10             	mov    0x10(%eax),%edx
c0102c80:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102c86:	8b 50 14             	mov    0x14(%eax),%edx
c0102c89:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102c8f:	8b 50 18             	mov    0x18(%eax),%edx
c0102c92:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102c98:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102c9b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102ca1:	8b 50 20             	mov    0x20(%eax),%edx
c0102ca4:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102caa:	8b 40 24             	mov    0x24(%eax),%eax
c0102cad:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102cb2:	83 ec 0c             	sub    $0xc,%esp
c0102cb5:	ff 75 0c             	pushl  0xc(%ebp)
c0102cb8:	e8 6f 08 00 00       	call   c010352c <sync_inode>
c0102cbd:	83 c4 10             	add    $0x10,%esp
c0102cc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102cc3:	c9                   	leave  
c0102cc4:	c3                   	ret    

c0102cc5 <do_unlink>:
c0102cc5:	55                   	push   %ebp
c0102cc6:	89 e5                	mov    %esp,%ebp
c0102cc8:	53                   	push   %ebx
c0102cc9:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102ccf:	83 ec 08             	sub    $0x8,%esp
c0102cd2:	ff 75 08             	pushl  0x8(%ebp)
c0102cd5:	68 35 b4 10 c0       	push   $0xc010b435
c0102cda:	e8 bd 6c 00 00       	call   c010999c <strcmp>
c0102cdf:	83 c4 10             	add    $0x10,%esp
c0102ce2:	85 c0                	test   %eax,%eax
c0102ce4:	75 10                	jne    c0102cf6 <do_unlink+0x31>
c0102ce6:	83 ec 0c             	sub    $0xc,%esp
c0102ce9:	68 37 b4 10 c0       	push   $0xc010b437
c0102cee:	e8 b4 5c 00 00       	call   c01089a7 <panic>
c0102cf3:	83 c4 10             	add    $0x10,%esp
c0102cf6:	83 ec 0c             	sub    $0xc,%esp
c0102cf9:	ff 75 08             	pushl  0x8(%ebp)
c0102cfc:	e8 31 f5 ff ff       	call   c0102232 <search_file>
c0102d01:	83 c4 10             	add    $0x10,%esp
c0102d04:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102d07:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102d0b:	75 10                	jne    c0102d1d <do_unlink+0x58>
c0102d0d:	83 ec 0c             	sub    $0xc,%esp
c0102d10:	68 53 b4 10 c0       	push   $0xc010b453
c0102d15:	e8 8d 5c 00 00       	call   c01089a7 <panic>
c0102d1a:	83 c4 10             	add    $0x10,%esp
c0102d1d:	83 ec 08             	sub    $0x8,%esp
c0102d20:	ff 75 d0             	pushl  -0x30(%ebp)
c0102d23:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102d29:	50                   	push   %eax
c0102d2a:	e8 01 f7 ff ff       	call   c0102430 <get_inode>
c0102d2f:	83 c4 10             	add    $0x10,%esp
c0102d32:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102d35:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102d39:	75 10                	jne    c0102d4b <do_unlink+0x86>
c0102d3b:	83 ec 0c             	sub    $0xc,%esp
c0102d3e:	68 53 b4 10 c0       	push   $0xc010b453
c0102d43:	e8 5f 5c 00 00       	call   c01089a7 <panic>
c0102d48:	83 c4 10             	add    $0x10,%esp
c0102d4b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102d4e:	85 c0                	test   %eax,%eax
c0102d50:	7e 10                	jle    c0102d62 <do_unlink+0x9d>
c0102d52:	83 ec 0c             	sub    $0xc,%esp
c0102d55:	68 6c b4 10 c0       	push   $0xc010b46c
c0102d5a:	e8 48 5c 00 00       	call   c01089a7 <panic>
c0102d5f:	83 c4 10             	add    $0x10,%esp
c0102d62:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102d68:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102d6b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102d6e:	8d 50 07             	lea    0x7(%eax),%edx
c0102d71:	85 c0                	test   %eax,%eax
c0102d73:	0f 48 c2             	cmovs  %edx,%eax
c0102d76:	c1 f8 03             	sar    $0x3,%eax
c0102d79:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102d7c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d7f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102d85:	85 c0                	test   %eax,%eax
c0102d87:	0f 48 c2             	cmovs  %edx,%eax
c0102d8a:	c1 f8 09             	sar    $0x9,%eax
c0102d8d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102d90:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102d93:	99                   	cltd   
c0102d94:	c1 ea 1d             	shr    $0x1d,%edx
c0102d97:	01 d0                	add    %edx,%eax
c0102d99:	83 e0 07             	and    $0x7,%eax
c0102d9c:	29 d0                	sub    %edx,%eax
c0102d9e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102da1:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102da8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102dad:	89 c2                	mov    %eax,%edx
c0102daf:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102db2:	83 c0 02             	add    $0x2,%eax
c0102db5:	83 ec 0c             	sub    $0xc,%esp
c0102db8:	6a 07                	push   $0x7
c0102dba:	68 00 02 00 00       	push   $0x200
c0102dbf:	52                   	push   %edx
c0102dc0:	ff 75 b8             	pushl  -0x48(%ebp)
c0102dc3:	50                   	push   %eax
c0102dc4:	e8 6b eb ff ff       	call   c0101934 <rd_wt>
c0102dc9:	83 c4 20             	add    $0x20,%esp
c0102dcc:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102dd2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102dd5:	01 d0                	add    %edx,%eax
c0102dd7:	0f b6 10             	movzbl (%eax),%edx
c0102dda:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102ddd:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102de2:	89 c1                	mov    %eax,%ecx
c0102de4:	d3 e3                	shl    %cl,%ebx
c0102de6:	89 d8                	mov    %ebx,%eax
c0102de8:	f7 d0                	not    %eax
c0102dea:	89 c3                	mov    %eax,%ebx
c0102dec:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102df2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102df5:	01 c8                	add    %ecx,%eax
c0102df7:	21 da                	and    %ebx,%edx
c0102df9:	88 10                	mov    %dl,(%eax)
c0102dfb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e00:	89 c2                	mov    %eax,%edx
c0102e02:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102e05:	83 c0 02             	add    $0x2,%eax
c0102e08:	83 ec 0c             	sub    $0xc,%esp
c0102e0b:	6a 0a                	push   $0xa
c0102e0d:	68 00 02 00 00       	push   $0x200
c0102e12:	52                   	push   %edx
c0102e13:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e16:	50                   	push   %eax
c0102e17:	e8 18 eb ff ff       	call   c0101934 <rd_wt>
c0102e1c:	83 c4 20             	add    $0x20,%esp
c0102e1f:	e8 ec 08 00 00       	call   c0103710 <get_super_block>
c0102e24:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102e27:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102e2d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102e30:	8b 00                	mov    (%eax),%eax
c0102e32:	29 c2                	sub    %eax,%edx
c0102e34:	89 d0                	mov    %edx,%eax
c0102e36:	83 c0 01             	add    $0x1,%eax
c0102e39:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102e3c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102e3f:	8d 50 07             	lea    0x7(%eax),%edx
c0102e42:	85 c0                	test   %eax,%eax
c0102e44:	0f 48 c2             	cmovs  %edx,%eax
c0102e47:	c1 f8 03             	sar    $0x3,%eax
c0102e4a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102e4d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e50:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102e56:	85 c0                	test   %eax,%eax
c0102e58:	0f 48 c2             	cmovs  %edx,%eax
c0102e5b:	c1 f8 09             	sar    $0x9,%eax
c0102e5e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102e61:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102e64:	99                   	cltd   
c0102e65:	c1 ea 1d             	shr    $0x1d,%edx
c0102e68:	01 d0                	add    %edx,%eax
c0102e6a:	83 e0 07             	and    $0x7,%eax
c0102e6d:	29 d0                	sub    %edx,%eax
c0102e6f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102e72:	b8 08 00 00 00       	mov    $0x8,%eax
c0102e77:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102e7a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102e7d:	29 c2                	sub    %eax,%edx
c0102e7f:	89 d0                	mov    %edx,%eax
c0102e81:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102e84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e87:	8d 50 07             	lea    0x7(%eax),%edx
c0102e8a:	85 c0                	test   %eax,%eax
c0102e8c:	0f 48 c2             	cmovs  %edx,%eax
c0102e8f:	c1 f8 03             	sar    $0x3,%eax
c0102e92:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102e95:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e9a:	89 c1                	mov    %eax,%ecx
c0102e9c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102e9f:	8b 40 04             	mov    0x4(%eax),%eax
c0102ea2:	8d 50 02             	lea    0x2(%eax),%edx
c0102ea5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102ea8:	01 d0                	add    %edx,%eax
c0102eaa:	83 ec 0c             	sub    $0xc,%esp
c0102ead:	6a 07                	push   $0x7
c0102eaf:	68 00 02 00 00       	push   $0x200
c0102eb4:	51                   	push   %ecx
c0102eb5:	ff 75 b8             	pushl  -0x48(%ebp)
c0102eb8:	50                   	push   %eax
c0102eb9:	e8 76 ea ff ff       	call   c0101934 <rd_wt>
c0102ebe:	83 c4 20             	add    $0x20,%esp
c0102ec1:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102ec7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102eca:	01 d0                	add    %edx,%eax
c0102ecc:	0f b6 10             	movzbl (%eax),%edx
c0102ecf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102ed2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102ed7:	89 c1                	mov    %eax,%ecx
c0102ed9:	d3 e3                	shl    %cl,%ebx
c0102edb:	89 d8                	mov    %ebx,%eax
c0102edd:	f7 d0                	not    %eax
c0102edf:	89 c3                	mov    %eax,%ebx
c0102ee1:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102ee7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102eea:	01 c8                	add    %ecx,%eax
c0102eec:	21 da                	and    %ebx,%edx
c0102eee:	88 10                	mov    %dl,(%eax)
c0102ef0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102ef7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102efa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102efd:	eb 6b                	jmp    c0102f6a <do_unlink+0x2a5>
c0102eff:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102f06:	75 4c                	jne    c0102f54 <do_unlink+0x28f>
c0102f08:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102f0f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f14:	83 ec 0c             	sub    $0xc,%esp
c0102f17:	6a 0a                	push   $0xa
c0102f19:	68 00 02 00 00       	push   $0x200
c0102f1e:	50                   	push   %eax
c0102f1f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f22:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f25:	e8 0a ea ff ff       	call   c0101934 <rd_wt>
c0102f2a:	83 c4 20             	add    $0x20,%esp
c0102f2d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f32:	89 c1                	mov    %eax,%ecx
c0102f34:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102f37:	8d 50 01             	lea    0x1(%eax),%edx
c0102f3a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102f3d:	83 ec 0c             	sub    $0xc,%esp
c0102f40:	6a 07                	push   $0x7
c0102f42:	68 00 02 00 00       	push   $0x200
c0102f47:	51                   	push   %ecx
c0102f48:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f4b:	50                   	push   %eax
c0102f4c:	e8 e3 e9 ff ff       	call   c0101934 <rd_wt>
c0102f51:	83 c4 20             	add    $0x20,%esp
c0102f54:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102f5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f5d:	01 d0                	add    %edx,%eax
c0102f5f:	c6 00 00             	movb   $0x0,(%eax)
c0102f62:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102f66:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102f6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f6d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102f70:	7c 8d                	jl     c0102eff <do_unlink+0x23a>
c0102f72:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102f79:	75 4c                	jne    c0102fc7 <do_unlink+0x302>
c0102f7b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102f82:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f87:	83 ec 0c             	sub    $0xc,%esp
c0102f8a:	6a 0a                	push   $0xa
c0102f8c:	68 00 02 00 00       	push   $0x200
c0102f91:	50                   	push   %eax
c0102f92:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f95:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f98:	e8 97 e9 ff ff       	call   c0101934 <rd_wt>
c0102f9d:	83 c4 20             	add    $0x20,%esp
c0102fa0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102fa5:	89 c1                	mov    %eax,%ecx
c0102fa7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102faa:	8d 50 01             	lea    0x1(%eax),%edx
c0102fad:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102fb0:	83 ec 0c             	sub    $0xc,%esp
c0102fb3:	6a 07                	push   $0x7
c0102fb5:	68 00 02 00 00       	push   $0x200
c0102fba:	51                   	push   %ecx
c0102fbb:	ff 75 b8             	pushl  -0x48(%ebp)
c0102fbe:	50                   	push   %eax
c0102fbf:	e8 70 e9 ff ff       	call   c0101934 <rd_wt>
c0102fc4:	83 c4 20             	add    $0x20,%esp
c0102fc7:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102fcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102fd0:	01 d0                	add    %edx,%eax
c0102fd2:	0f b6 10             	movzbl (%eax),%edx
c0102fd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102fd8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102fdd:	89 c1                	mov    %eax,%ecx
c0102fdf:	d3 e3                	shl    %cl,%ebx
c0102fe1:	89 d8                	mov    %ebx,%eax
c0102fe3:	89 c3                	mov    %eax,%ebx
c0102fe5:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102feb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102fee:	01 c8                	add    %ecx,%eax
c0102ff0:	21 da                	and    %ebx,%edx
c0102ff2:	88 10                	mov    %dl,(%eax)
c0102ff4:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ff9:	83 ec 0c             	sub    $0xc,%esp
c0102ffc:	6a 0a                	push   $0xa
c0102ffe:	68 00 02 00 00       	push   $0x200
c0103003:	50                   	push   %eax
c0103004:	ff 75 b8             	pushl  -0x48(%ebp)
c0103007:	ff 75 ec             	pushl  -0x14(%ebp)
c010300a:	e8 25 e9 ff ff       	call   c0101934 <rd_wt>
c010300f:	83 c4 20             	add    $0x20,%esp
c0103012:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0103019:	00 00 00 
c010301c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0103023:	00 00 00 
c0103026:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c010302d:	00 00 00 
c0103030:	83 ec 0c             	sub    $0xc,%esp
c0103033:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0103039:	50                   	push   %eax
c010303a:	e8 ed 04 00 00       	call   c010352c <sync_inode>
c010303f:	83 c4 10             	add    $0x10,%esp
c0103042:	83 ec 0c             	sub    $0xc,%esp
c0103045:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c010304b:	50                   	push   %eax
c010304c:	e8 2f 06 00 00       	call   c0103680 <put_inode>
c0103051:	83 c4 10             	add    $0x10,%esp
c0103054:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103057:	8b 00                	mov    (%eax),%eax
c0103059:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010305c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0103063:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103066:	8b 40 04             	mov    0x4(%eax),%eax
c0103069:	89 45 94             	mov    %eax,-0x6c(%ebp)
c010306c:	8b 45 98             	mov    -0x68(%ebp),%eax
c010306f:	8b 40 0c             	mov    0xc(%eax),%eax
c0103072:	89 45 90             	mov    %eax,-0x70(%ebp)
c0103075:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103078:	c1 e8 04             	shr    $0x4,%eax
c010307b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010307e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0103085:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010308c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0103093:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c010309a:	e9 a5 00 00 00       	jmp    c0103144 <do_unlink+0x47f>
c010309f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030a4:	89 c1                	mov    %eax,%ecx
c01030a6:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01030a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01030ac:	01 d0                	add    %edx,%eax
c01030ae:	83 ec 0c             	sub    $0xc,%esp
c01030b1:	6a 07                	push   $0x7
c01030b3:	68 00 02 00 00       	push   $0x200
c01030b8:	51                   	push   %ecx
c01030b9:	ff 75 b8             	pushl  -0x48(%ebp)
c01030bc:	50                   	push   %eax
c01030bd:	e8 72 e8 ff ff       	call   c0101934 <rd_wt>
c01030c2:	83 c4 20             	add    $0x20,%esp
c01030c5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01030ca:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01030cd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c01030d4:	eb 51                	jmp    c0103127 <do_unlink+0x462>
c01030d6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01030da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01030dd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c01030e0:	7f 4f                	jg     c0103131 <do_unlink+0x46c>
c01030e2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01030e5:	83 c0 10             	add    $0x10,%eax
c01030e8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01030eb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01030ee:	83 c0 04             	add    $0x4,%eax
c01030f1:	83 ec 08             	sub    $0x8,%esp
c01030f4:	ff 75 08             	pushl  0x8(%ebp)
c01030f7:	50                   	push   %eax
c01030f8:	e8 9f 68 00 00       	call   c010999c <strcmp>
c01030fd:	83 c4 10             	add    $0x10,%esp
c0103100:	85 c0                	test   %eax,%eax
c0103102:	75 1b                	jne    c010311f <do_unlink+0x45a>
c0103104:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c010310b:	83 ec 04             	sub    $0x4,%esp
c010310e:	6a 10                	push   $0x10
c0103110:	6a 00                	push   $0x0
c0103112:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103115:	e8 d5 90 00 00       	call   c010c1ef <Memset>
c010311a:	83 c4 10             	add    $0x10,%esp
c010311d:	eb 13                	jmp    c0103132 <do_unlink+0x46d>
c010311f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0103123:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0103127:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010312a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010312d:	7c a7                	jl     c01030d6 <do_unlink+0x411>
c010312f:	eb 01                	jmp    c0103132 <do_unlink+0x46d>
c0103131:	90                   	nop
c0103132:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103135:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103138:	7f 16                	jg     c0103150 <do_unlink+0x48b>
c010313a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010313e:	75 10                	jne    c0103150 <do_unlink+0x48b>
c0103140:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0103144:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103147:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010314a:	0f 8c 4f ff ff ff    	jl     c010309f <do_unlink+0x3da>
c0103150:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103153:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103156:	75 17                	jne    c010316f <do_unlink+0x4aa>
c0103158:	8b 45 98             	mov    -0x68(%ebp),%eax
c010315b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010315e:	89 50 04             	mov    %edx,0x4(%eax)
c0103161:	83 ec 0c             	sub    $0xc,%esp
c0103164:	ff 75 98             	pushl  -0x68(%ebp)
c0103167:	e8 c0 03 00 00       	call   c010352c <sync_inode>
c010316c:	83 c4 10             	add    $0x10,%esp
c010316f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0103173:	74 26                	je     c010319b <do_unlink+0x4d6>
c0103175:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010317a:	89 c1                	mov    %eax,%ecx
c010317c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c010317f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103182:	01 d0                	add    %edx,%eax
c0103184:	83 ec 0c             	sub    $0xc,%esp
c0103187:	6a 0a                	push   $0xa
c0103189:	68 00 02 00 00       	push   $0x200
c010318e:	51                   	push   %ecx
c010318f:	ff 75 b8             	pushl  -0x48(%ebp)
c0103192:	50                   	push   %eax
c0103193:	e8 9c e7 ff ff       	call   c0101934 <rd_wt>
c0103198:	83 c4 20             	add    $0x20,%esp
c010319b:	90                   	nop
c010319c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010319f:	c9                   	leave  
c01031a0:	c3                   	ret    

c01031a1 <do_rdwt>:
c01031a1:	55                   	push   %ebp
c01031a2:	89 e5                	mov    %esp,%ebp
c01031a4:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01031aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01031ad:	8b 40 78             	mov    0x78(%eax),%eax
c01031b0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01031b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01031b6:	8b 40 60             	mov    0x60(%eax),%eax
c01031b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01031bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01031bf:	8b 40 6c             	mov    0x6c(%eax),%eax
c01031c2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01031c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01031c8:	8b 00                	mov    (%eax),%eax
c01031ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01031cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01031d0:	8b 40 10             	mov    0x10(%eax),%eax
c01031d3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01031d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01031d9:	8b 40 50             	mov    0x50(%eax),%eax
c01031dc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01031df:	83 ec 0c             	sub    $0xc,%esp
c01031e2:	ff 75 d0             	pushl  -0x30(%ebp)
c01031e5:	e8 0c 07 00 00       	call   c01038f6 <pid2proc>
c01031ea:	83 c4 10             	add    $0x10,%esp
c01031ed:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01031f0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01031f3:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01031f6:	83 c2 4c             	add    $0x4c,%edx
c01031f9:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01031fd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103200:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103203:	8b 40 08             	mov    0x8(%eax),%eax
c0103206:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103209:	8b 45 08             	mov    0x8(%ebp),%eax
c010320c:	8b 00                	mov    (%eax),%eax
c010320e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103211:	83 ec 08             	sub    $0x8,%esp
c0103214:	ff 75 bc             	pushl  -0x44(%ebp)
c0103217:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010321d:	50                   	push   %eax
c010321e:	e8 0d f2 ff ff       	call   c0102430 <get_inode>
c0103223:	83 c4 10             	add    $0x10,%esp
c0103226:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103229:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010322d:	75 10                	jne    c010323f <do_rdwt+0x9e>
c010322f:	83 ec 0c             	sub    $0xc,%esp
c0103232:	68 a4 b4 10 c0       	push   $0xc010b4a4
c0103237:	e8 6b 57 00 00       	call   c01089a7 <panic>
c010323c:	83 c4 10             	add    $0x10,%esp
c010323f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103245:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103248:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010324b:	8b 40 04             	mov    0x4(%eax),%eax
c010324e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103251:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103255:	74 22                	je     c0103279 <do_rdwt+0xd8>
c0103257:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010325b:	74 1c                	je     c0103279 <do_rdwt+0xd8>
c010325d:	68 a8 04 00 00       	push   $0x4a8
c0103262:	68 10 b3 10 c0       	push   $0xc010b310
c0103267:	68 10 b3 10 c0       	push   $0xc010b310
c010326c:	68 b4 b4 10 c0       	push   $0xc010b4b4
c0103271:	e8 4f 57 00 00       	call   c01089c5 <assertion_failure>
c0103276:	83 c4 10             	add    $0x10,%esp
c0103279:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c010327f:	83 f8 01             	cmp    $0x1,%eax
c0103282:	0f 85 86 00 00 00    	jne    c010330e <do_rdwt+0x16d>
c0103288:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010328c:	75 09                	jne    c0103297 <do_rdwt+0xf6>
c010328e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103295:	eb 0d                	jmp    c01032a4 <do_rdwt+0x103>
c0103297:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010329b:	75 07                	jne    c01032a4 <do_rdwt+0x103>
c010329d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c01032a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01032a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01032aa:	89 50 78             	mov    %edx,0x78(%eax)
c01032ad:	8b 55 b8             	mov    -0x48(%ebp),%edx
c01032b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01032b3:	89 50 68             	mov    %edx,0x68(%eax)
c01032b6:	83 ec 04             	sub    $0x4,%esp
c01032b9:	6a 04                	push   $0x4
c01032bb:	ff 75 08             	pushl  0x8(%ebp)
c01032be:	6a 03                	push   $0x3
c01032c0:	e8 70 63 00 00       	call   c0109635 <send_rec>
c01032c5:	83 c4 10             	add    $0x10,%esp
c01032c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01032cb:	8b 40 78             	mov    0x78(%eax),%eax
c01032ce:	83 f8 66             	cmp    $0x66,%eax
c01032d1:	75 13                	jne    c01032e6 <do_rdwt+0x145>
c01032d3:	83 ec 04             	sub    $0x4,%esp
c01032d6:	ff 75 b8             	pushl  -0x48(%ebp)
c01032d9:	ff 75 08             	pushl  0x8(%ebp)
c01032dc:	6a 01                	push   $0x1
c01032de:	e8 52 63 00 00       	call   c0109635 <send_rec>
c01032e3:	83 c4 10             	add    $0x10,%esp
c01032e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01032e9:	8b 40 78             	mov    0x78(%eax),%eax
c01032ec:	83 f8 65             	cmp    $0x65,%eax
c01032ef:	75 13                	jne    c0103304 <do_rdwt+0x163>
c01032f1:	83 ec 04             	sub    $0x4,%esp
c01032f4:	ff 75 b8             	pushl  -0x48(%ebp)
c01032f7:	ff 75 08             	pushl  0x8(%ebp)
c01032fa:	6a 01                	push   $0x1
c01032fc:	e8 34 63 00 00       	call   c0109635 <send_rec>
c0103301:	83 c4 10             	add    $0x10,%esp
c0103304:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103309:	e9 1c 02 00 00       	jmp    c010352a <do_rdwt+0x389>
c010330e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103312:	75 18                	jne    c010332c <do_rdwt+0x18b>
c0103314:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010331a:	c1 e0 09             	shl    $0x9,%eax
c010331d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103320:	75 0a                	jne    c010332c <do_rdwt+0x18b>
c0103322:	b8 00 00 00 00       	mov    $0x0,%eax
c0103327:	e9 fe 01 00 00       	jmp    c010352a <do_rdwt+0x389>
c010332c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103330:	75 14                	jne    c0103346 <do_rdwt+0x1a5>
c0103332:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103335:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103338:	01 d0                	add    %edx,%eax
c010333a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010333d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0103341:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103344:	eb 19                	jmp    c010335f <do_rdwt+0x1be>
c0103346:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103349:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010334c:	01 c2                	add    %eax,%edx
c010334e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103354:	c1 e0 09             	shl    $0x9,%eax
c0103357:	39 c2                	cmp    %eax,%edx
c0103359:	0f 4e c2             	cmovle %edx,%eax
c010335c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010335f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103362:	99                   	cltd   
c0103363:	c1 ea 17             	shr    $0x17,%edx
c0103366:	01 d0                	add    %edx,%eax
c0103368:	25 ff 01 00 00       	and    $0x1ff,%eax
c010336d:	29 d0                	sub    %edx,%eax
c010336f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103372:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103378:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010337b:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103381:	85 c0                	test   %eax,%eax
c0103383:	0f 48 c1             	cmovs  %ecx,%eax
c0103386:	c1 f8 09             	sar    $0x9,%eax
c0103389:	01 d0                	add    %edx,%eax
c010338b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010338e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103394:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103397:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010339d:	85 c0                	test   %eax,%eax
c010339f:	0f 48 c1             	cmovs  %ecx,%eax
c01033a2:	c1 f8 09             	sar    $0x9,%eax
c01033a5:	01 d0                	add    %edx,%eax
c01033a7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01033aa:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01033ad:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01033b0:	ba 00 00 10 00       	mov    $0x100000,%edx
c01033b5:	39 d0                	cmp    %edx,%eax
c01033b7:	7d 0b                	jge    c01033c4 <do_rdwt+0x223>
c01033b9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01033bc:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01033bf:	83 c0 01             	add    $0x1,%eax
c01033c2:	eb 05                	jmp    c01033c9 <do_rdwt+0x228>
c01033c4:	b8 00 00 10 00       	mov    $0x100000,%eax
c01033c9:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01033cc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033cf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01033d2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01033d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01033dc:	8b 00                	mov    (%eax),%eax
c01033de:	83 ec 0c             	sub    $0xc,%esp
c01033e1:	50                   	push   %eax
c01033e2:	e8 0f 05 00 00       	call   c01038f6 <pid2proc>
c01033e7:	83 c4 10             	add    $0x10,%esp
c01033ea:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01033ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033f0:	83 ec 08             	sub    $0x8,%esp
c01033f3:	50                   	push   %eax
c01033f4:	ff 75 cc             	pushl  -0x34(%ebp)
c01033f7:	e8 43 2b 00 00       	call   c0105f3f <alloc_virtual_memory>
c01033fc:	83 c4 10             	add    $0x10,%esp
c01033ff:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103402:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103405:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103408:	e9 c5 00 00 00       	jmp    c01034d2 <do_rdwt+0x331>
c010340d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103410:	c1 e0 09             	shl    $0x9,%eax
c0103413:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103416:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103419:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010341d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103420:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103427:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010342b:	75 46                	jne    c0103473 <do_rdwt+0x2d2>
c010342d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103430:	c1 e0 09             	shl    $0x9,%eax
c0103433:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103439:	83 ec 0c             	sub    $0xc,%esp
c010343c:	6a 07                	push   $0x7
c010343e:	50                   	push   %eax
c010343f:	52                   	push   %edx
c0103440:	ff 75 90             	pushl  -0x70(%ebp)
c0103443:	ff 75 e0             	pushl  -0x20(%ebp)
c0103446:	e8 e9 e4 ff ff       	call   c0101934 <rd_wt>
c010344b:	83 c4 20             	add    $0x20,%esp
c010344e:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103454:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103457:	01 d0                	add    %edx,%eax
c0103459:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010345c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010345f:	01 ca                	add    %ecx,%edx
c0103461:	83 ec 04             	sub    $0x4,%esp
c0103464:	ff 75 94             	pushl  -0x6c(%ebp)
c0103467:	50                   	push   %eax
c0103468:	52                   	push   %edx
c0103469:	e8 3e 39 00 00       	call   c0106dac <Memcpy>
c010346e:	83 c4 10             	add    $0x10,%esp
c0103471:	eb 46                	jmp    c01034b9 <do_rdwt+0x318>
c0103473:	8b 55 98             	mov    -0x68(%ebp),%edx
c0103476:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103479:	01 d0                	add    %edx,%eax
c010347b:	89 c1                	mov    %eax,%ecx
c010347d:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103483:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103486:	01 d0                	add    %edx,%eax
c0103488:	83 ec 04             	sub    $0x4,%esp
c010348b:	ff 75 94             	pushl  -0x6c(%ebp)
c010348e:	51                   	push   %ecx
c010348f:	50                   	push   %eax
c0103490:	e8 17 39 00 00       	call   c0106dac <Memcpy>
c0103495:	83 c4 10             	add    $0x10,%esp
c0103498:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010349b:	c1 e0 09             	shl    $0x9,%eax
c010349e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01034a4:	83 ec 0c             	sub    $0xc,%esp
c01034a7:	6a 0a                	push   $0xa
c01034a9:	50                   	push   %eax
c01034aa:	52                   	push   %edx
c01034ab:	ff 75 90             	pushl  -0x70(%ebp)
c01034ae:	ff 75 e0             	pushl  -0x20(%ebp)
c01034b1:	e8 7e e4 ff ff       	call   c0101934 <rd_wt>
c01034b6:	83 c4 20             	add    $0x20,%esp
c01034b9:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01034bc:	29 45 e8             	sub    %eax,-0x18(%ebp)
c01034bf:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01034c2:	01 45 e4             	add    %eax,-0x1c(%ebp)
c01034c5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01034cc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01034cf:	01 45 e0             	add    %eax,-0x20(%ebp)
c01034d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01034d5:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c01034d8:	7f 0a                	jg     c01034e4 <do_rdwt+0x343>
c01034da:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01034de:	0f 85 29 ff ff ff    	jne    c010340d <do_rdwt+0x26c>
c01034e4:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01034e7:	8b 50 04             	mov    0x4(%eax),%edx
c01034ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034ed:	01 c2                	add    %eax,%edx
c01034ef:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01034f2:	89 50 04             	mov    %edx,0x4(%eax)
c01034f5:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01034f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01034fb:	01 c2                	add    %eax,%edx
c01034fd:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103503:	39 c2                	cmp    %eax,%edx
c0103505:	7e 20                	jle    c0103527 <do_rdwt+0x386>
c0103507:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010350a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010350d:	01 d0                	add    %edx,%eax
c010350f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103515:	83 ec 0c             	sub    $0xc,%esp
c0103518:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010351e:	50                   	push   %eax
c010351f:	e8 08 00 00 00       	call   c010352c <sync_inode>
c0103524:	83 c4 10             	add    $0x10,%esp
c0103527:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010352a:	c9                   	leave  
c010352b:	c3                   	ret    

c010352c <sync_inode>:
c010352c:	55                   	push   %ebp
c010352d:	89 e5                	mov    %esp,%ebp
c010352f:	53                   	push   %ebx
c0103530:	83 ec 34             	sub    $0x34,%esp
c0103533:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010353a:	eb 74                	jmp    c01035b0 <sync_inode+0x84>
c010353c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010353f:	89 d0                	mov    %edx,%eax
c0103541:	c1 e0 02             	shl    $0x2,%eax
c0103544:	01 d0                	add    %edx,%eax
c0103546:	c1 e0 03             	shl    $0x3,%eax
c0103549:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c010354e:	8b 10                	mov    (%eax),%edx
c0103550:	8b 45 08             	mov    0x8(%ebp),%eax
c0103553:	8b 40 10             	mov    0x10(%eax),%eax
c0103556:	39 c2                	cmp    %eax,%edx
c0103558:	75 52                	jne    c01035ac <sync_inode+0x80>
c010355a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010355d:	89 d0                	mov    %edx,%eax
c010355f:	c1 e0 02             	shl    $0x2,%eax
c0103562:	01 d0                	add    %edx,%eax
c0103564:	c1 e0 03             	shl    $0x3,%eax
c0103567:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c010356d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103570:	8b 08                	mov    (%eax),%ecx
c0103572:	89 0a                	mov    %ecx,(%edx)
c0103574:	8b 48 04             	mov    0x4(%eax),%ecx
c0103577:	89 4a 04             	mov    %ecx,0x4(%edx)
c010357a:	8b 48 08             	mov    0x8(%eax),%ecx
c010357d:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103580:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103583:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103586:	8b 48 10             	mov    0x10(%eax),%ecx
c0103589:	89 4a 10             	mov    %ecx,0x10(%edx)
c010358c:	8b 48 14             	mov    0x14(%eax),%ecx
c010358f:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103592:	8b 48 18             	mov    0x18(%eax),%ecx
c0103595:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103598:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010359b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010359e:	8b 48 20             	mov    0x20(%eax),%ecx
c01035a1:	89 4a 20             	mov    %ecx,0x20(%edx)
c01035a4:	8b 40 24             	mov    0x24(%eax),%eax
c01035a7:	89 42 24             	mov    %eax,0x24(%edx)
c01035aa:	eb 0a                	jmp    c01035b6 <sync_inode+0x8a>
c01035ac:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01035b0:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c01035b4:	7e 86                	jle    c010353c <sync_inode+0x10>
c01035b6:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c01035bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01035c0:	8b 40 10             	mov    0x10(%eax),%eax
c01035c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01035c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01035c9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01035cc:	b8 00 02 00 00       	mov    $0x200,%eax
c01035d1:	99                   	cltd   
c01035d2:	f7 7d f0             	idivl  -0x10(%ebp)
c01035d5:	89 c3                	mov    %eax,%ebx
c01035d7:	89 c8                	mov    %ecx,%eax
c01035d9:	99                   	cltd   
c01035da:	f7 fb                	idiv   %ebx
c01035dc:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01035df:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01035e2:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01035e5:	b8 00 02 00 00       	mov    $0x200,%eax
c01035ea:	99                   	cltd   
c01035eb:	f7 7d f0             	idivl  -0x10(%ebp)
c01035ee:	89 c3                	mov    %eax,%ebx
c01035f0:	89 c8                	mov    %ecx,%eax
c01035f2:	99                   	cltd   
c01035f3:	f7 fb                	idiv   %ebx
c01035f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01035f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01035fb:	8b 40 20             	mov    0x20(%eax),%eax
c01035fe:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103601:	e8 0a 01 00 00       	call   c0103710 <get_super_block>
c0103606:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103609:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010360c:	8b 40 04             	mov    0x4(%eax),%eax
c010360f:	8d 50 02             	lea    0x2(%eax),%edx
c0103612:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103615:	8b 40 08             	mov    0x8(%eax),%eax
c0103618:	01 c2                	add    %eax,%edx
c010361a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010361d:	01 d0                	add    %edx,%eax
c010361f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103622:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103627:	83 ec 0c             	sub    $0xc,%esp
c010362a:	6a 07                	push   $0x7
c010362c:	68 00 02 00 00       	push   $0x200
c0103631:	50                   	push   %eax
c0103632:	ff 75 e0             	pushl  -0x20(%ebp)
c0103635:	ff 75 d8             	pushl  -0x28(%ebp)
c0103638:	e8 f7 e2 ff ff       	call   c0101934 <rd_wt>
c010363d:	83 c4 20             	add    $0x20,%esp
c0103640:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0103645:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103648:	83 ec 04             	sub    $0x4,%esp
c010364b:	ff 75 f0             	pushl  -0x10(%ebp)
c010364e:	ff 75 08             	pushl  0x8(%ebp)
c0103651:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103654:	e8 53 37 00 00       	call   c0106dac <Memcpy>
c0103659:	83 c4 10             	add    $0x10,%esp
c010365c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103661:	83 ec 0c             	sub    $0xc,%esp
c0103664:	6a 0a                	push   $0xa
c0103666:	68 00 02 00 00       	push   $0x200
c010366b:	50                   	push   %eax
c010366c:	ff 75 e0             	pushl  -0x20(%ebp)
c010366f:	ff 75 d8             	pushl  -0x28(%ebp)
c0103672:	e8 bd e2 ff ff       	call   c0101934 <rd_wt>
c0103677:	83 c4 20             	add    $0x20,%esp
c010367a:	90                   	nop
c010367b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010367e:	c9                   	leave  
c010367f:	c3                   	ret    

c0103680 <put_inode>:
c0103680:	55                   	push   %ebp
c0103681:	89 e5                	mov    %esp,%ebp
c0103683:	83 ec 08             	sub    $0x8,%esp
c0103686:	8b 45 08             	mov    0x8(%ebp),%eax
c0103689:	8b 40 24             	mov    0x24(%eax),%eax
c010368c:	85 c0                	test   %eax,%eax
c010368e:	7f 1c                	jg     c01036ac <put_inode+0x2c>
c0103690:	68 4d 05 00 00       	push   $0x54d
c0103695:	68 10 b3 10 c0       	push   $0xc010b310
c010369a:	68 10 b3 10 c0       	push   $0xc010b310
c010369f:	68 e8 b4 10 c0       	push   $0xc010b4e8
c01036a4:	e8 1c 53 00 00       	call   c01089c5 <assertion_failure>
c01036a9:	83 c4 10             	add    $0x10,%esp
c01036ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01036af:	8b 40 24             	mov    0x24(%eax),%eax
c01036b2:	8d 50 ff             	lea    -0x1(%eax),%edx
c01036b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01036b8:	89 50 24             	mov    %edx,0x24(%eax)
c01036bb:	90                   	nop
c01036bc:	c9                   	leave  
c01036bd:	c3                   	ret    

c01036be <do_close>:
c01036be:	55                   	push   %ebp
c01036bf:	89 e5                	mov    %esp,%ebp
c01036c1:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01036c6:	8b 55 08             	mov    0x8(%ebp),%edx
c01036c9:	83 c2 4c             	add    $0x4c,%edx
c01036cc:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01036d0:	8b 50 0c             	mov    0xc(%eax),%edx
c01036d3:	83 ea 01             	sub    $0x1,%edx
c01036d6:	89 50 0c             	mov    %edx,0xc(%eax)
c01036d9:	8b 40 0c             	mov    0xc(%eax),%eax
c01036dc:	85 c0                	test   %eax,%eax
c01036de:	75 16                	jne    c01036f6 <do_close+0x38>
c01036e0:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01036e5:	8b 55 08             	mov    0x8(%ebp),%edx
c01036e8:	83 c2 4c             	add    $0x4c,%edx
c01036eb:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01036ef:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01036f6:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01036fb:	8b 55 08             	mov    0x8(%ebp),%edx
c01036fe:	83 c2 4c             	add    $0x4c,%edx
c0103701:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103708:	00 
c0103709:	b8 00 00 00 00       	mov    $0x0,%eax
c010370e:	5d                   	pop    %ebp
c010370f:	c3                   	ret    

c0103710 <get_super_block>:
c0103710:	55                   	push   %ebp
c0103711:	89 e5                	mov    %esp,%ebp
c0103713:	83 ec 08             	sub    $0x8,%esp
c0103716:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010371b:	83 ec 0c             	sub    $0xc,%esp
c010371e:	6a 07                	push   $0x7
c0103720:	68 00 02 00 00       	push   $0x200
c0103725:	50                   	push   %eax
c0103726:	6a 20                	push   $0x20
c0103728:	6a 01                	push   $0x1
c010372a:	e8 05 e2 ff ff       	call   c0101934 <rd_wt>
c010372f:	83 c4 20             	add    $0x20,%esp
c0103732:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103738:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010373d:	8b 0a                	mov    (%edx),%ecx
c010373f:	89 08                	mov    %ecx,(%eax)
c0103741:	8b 4a 04             	mov    0x4(%edx),%ecx
c0103744:	89 48 04             	mov    %ecx,0x4(%eax)
c0103747:	8b 4a 08             	mov    0x8(%edx),%ecx
c010374a:	89 48 08             	mov    %ecx,0x8(%eax)
c010374d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103750:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103753:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103756:	89 48 10             	mov    %ecx,0x10(%eax)
c0103759:	8b 4a 14             	mov    0x14(%edx),%ecx
c010375c:	89 48 14             	mov    %ecx,0x14(%eax)
c010375f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0103762:	89 48 18             	mov    %ecx,0x18(%eax)
c0103765:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0103768:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010376b:	8b 52 20             	mov    0x20(%edx),%edx
c010376e:	89 50 20             	mov    %edx,0x20(%eax)
c0103771:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0103776:	c9                   	leave  
c0103777:	c3                   	ret    

c0103778 <schedule_process>:
c0103778:	55                   	push   %ebp
c0103779:	89 e5                	mov    %esp,%ebp
c010377b:	83 ec 18             	sub    $0x18,%esp
c010377e:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103785:	e8 64 cc ff ff       	call   c01003ee <get_running_thread_pcb>
c010378a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010378d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103790:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103797:	84 c0                	test   %al,%al
c0103799:	75 35                	jne    c01037d0 <schedule_process+0x58>
c010379b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010379e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c01037a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01037a7:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01037ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01037b0:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01037b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01037ba:	05 60 02 00 00       	add    $0x260,%eax
c01037bf:	83 ec 08             	sub    $0x8,%esp
c01037c2:	50                   	push   %eax
c01037c3:	68 ec fd 10 c0       	push   $0xc010fdec
c01037c8:	e8 9a 6b 00 00       	call   c010a367 <insertToDoubleLinkList>
c01037cd:	83 c4 10             	add    $0x10,%esp
c01037d0:	83 ec 0c             	sub    $0xc,%esp
c01037d3:	68 ec fd 10 c0       	push   $0xc010fdec
c01037d8:	e8 a6 69 00 00       	call   c010a183 <isListEmpty>
c01037dd:	83 c4 10             	add    $0x10,%esp
c01037e0:	84 c0                	test   %al,%al
c01037e2:	74 19                	je     c01037fd <schedule_process+0x85>
c01037e4:	6a 1e                	push   $0x1e
c01037e6:	68 f7 b4 10 c0       	push   $0xc010b4f7
c01037eb:	68 f7 b4 10 c0       	push   $0xc010b4f7
c01037f0:	68 01 b5 10 c0       	push   $0xc010b501
c01037f5:	e8 cb 51 00 00       	call   c01089c5 <assertion_failure>
c01037fa:	83 c4 10             	add    $0x10,%esp
c01037fd:	83 ec 0c             	sub    $0xc,%esp
c0103800:	68 ec fd 10 c0       	push   $0xc010fdec
c0103805:	e8 e0 6b 00 00       	call   c010a3ea <popFromDoubleLinkList>
c010380a:	83 c4 10             	add    $0x10,%esp
c010380d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103810:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103813:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103818:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010381b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010381e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103825:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103828:	8b 50 08             	mov    0x8(%eax),%edx
c010382b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010382e:	39 c2                	cmp    %eax,%edx
c0103830:	74 28                	je     c010385a <schedule_process+0xe2>
c0103832:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103835:	05 00 10 00 00       	add    $0x1000,%eax
c010383a:	83 ec 0c             	sub    $0xc,%esp
c010383d:	50                   	push   %eax
c010383e:	e8 9c cb ff ff       	call   c01003df <update_tss>
c0103843:	83 c4 10             	add    $0x10,%esp
c0103846:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103849:	8b 40 08             	mov    0x8(%eax),%eax
c010384c:	83 ec 0c             	sub    $0xc,%esp
c010384f:	50                   	push   %eax
c0103850:	e8 7d cb ff ff       	call   c01003d2 <update_cr3>
c0103855:	83 c4 10             	add    $0x10,%esp
c0103858:	eb 0f                	jmp    c0103869 <schedule_process+0xf1>
c010385a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010385d:	83 ec 0c             	sub    $0xc,%esp
c0103860:	50                   	push   %eax
c0103861:	e8 6c cb ff ff       	call   c01003d2 <update_cr3>
c0103866:	83 c4 10             	add    $0x10,%esp
c0103869:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010386c:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103871:	83 ec 08             	sub    $0x8,%esp
c0103874:	ff 75 e8             	pushl  -0x18(%ebp)
c0103877:	ff 75 f0             	pushl  -0x10(%ebp)
c010387a:	e8 c1 68 00 00       	call   c010a140 <switch_to>
c010387f:	83 c4 10             	add    $0x10,%esp
c0103882:	90                   	nop
c0103883:	c9                   	leave  
c0103884:	c3                   	ret    

c0103885 <clock_handler>:
c0103885:	55                   	push   %ebp
c0103886:	89 e5                	mov    %esp,%ebp
c0103888:	83 ec 18             	sub    $0x18,%esp
c010388b:	e8 5e cb ff ff       	call   c01003ee <get_running_thread_pcb>
c0103890:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103893:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0103898:	85 c0                	test   %eax,%eax
c010389a:	74 0d                	je     c01038a9 <clock_handler+0x24>
c010389c:	83 ec 0c             	sub    $0xc,%esp
c010389f:	6a 04                	push   $0x4
c01038a1:	e8 29 60 00 00       	call   c01098cf <inform_int>
c01038a6:	83 c4 10             	add    $0x10,%esp
c01038a9:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01038ae:	83 f8 64             	cmp    $0x64,%eax
c01038b1:	75 0c                	jne    c01038bf <clock_handler+0x3a>
c01038b3:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c01038ba:	00 00 00 
c01038bd:	eb 0a                	jmp    c01038c9 <clock_handler+0x44>
c01038bf:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01038c4:	83 f8 01             	cmp    $0x1,%eax
c01038c7:	75 2a                	jne    c01038f3 <clock_handler+0x6e>
c01038c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038cc:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c01038d2:	85 c0                	test   %eax,%eax
c01038d4:	74 16                	je     c01038ec <clock_handler+0x67>
c01038d6:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c01038db:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01038e1:	83 ea 01             	sub    $0x1,%edx
c01038e4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01038ea:	eb 08                	jmp    c01038f4 <clock_handler+0x6f>
c01038ec:	e8 87 fe ff ff       	call   c0103778 <schedule_process>
c01038f1:	eb 01                	jmp    c01038f4 <clock_handler+0x6f>
c01038f3:	90                   	nop
c01038f4:	c9                   	leave  
c01038f5:	c3                   	ret    

c01038f6 <pid2proc>:
c01038f6:	55                   	push   %ebp
c01038f7:	89 e5                	mov    %esp,%ebp
c01038f9:	83 ec 20             	sub    $0x20,%esp
c01038fc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103903:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010390a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c010390f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103915:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103918:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010391b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103920:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103926:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103929:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010392c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103931:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103934:	eb 36                	jmp    c010396c <pid2proc+0x76>
c0103936:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103939:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010393e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103941:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103945:	75 07                	jne    c010394e <pid2proc+0x58>
c0103947:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c010394e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103951:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103957:	8b 45 08             	mov    0x8(%ebp),%eax
c010395a:	39 c2                	cmp    %eax,%edx
c010395c:	75 05                	jne    c0103963 <pid2proc+0x6d>
c010395e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103961:	eb 17                	jmp    c010397a <pid2proc+0x84>
c0103963:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103966:	8b 40 04             	mov    0x4(%eax),%eax
c0103969:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010396c:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103973:	75 c1                	jne    c0103936 <pid2proc+0x40>
c0103975:	b8 00 00 00 00       	mov    $0x0,%eax
c010397a:	c9                   	leave  
c010397b:	c3                   	ret    

c010397c <proc2pid>:
c010397c:	55                   	push   %ebp
c010397d:	89 e5                	mov    %esp,%ebp
c010397f:	83 ec 10             	sub    $0x10,%esp
c0103982:	8b 45 08             	mov    0x8(%ebp),%eax
c0103985:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c010398b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010398e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103991:	c9                   	leave  
c0103992:	c3                   	ret    

c0103993 <InitDescriptor>:
c0103993:	55                   	push   %ebp
c0103994:	89 e5                	mov    %esp,%ebp
c0103996:	83 ec 04             	sub    $0x4,%esp
c0103999:	8b 45 14             	mov    0x14(%ebp),%eax
c010399c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c01039a0:	8b 45 10             	mov    0x10(%ebp),%eax
c01039a3:	89 c2                	mov    %eax,%edx
c01039a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01039a8:	66 89 10             	mov    %dx,(%eax)
c01039ab:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039ae:	89 c2                	mov    %eax,%edx
c01039b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01039b3:	66 89 50 02          	mov    %dx,0x2(%eax)
c01039b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039ba:	c1 e8 10             	shr    $0x10,%eax
c01039bd:	89 c2                	mov    %eax,%edx
c01039bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01039c2:	88 50 04             	mov    %dl,0x4(%eax)
c01039c5:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01039c9:	89 c2                	mov    %eax,%edx
c01039cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01039ce:	88 50 05             	mov    %dl,0x5(%eax)
c01039d1:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01039d5:	66 c1 e8 08          	shr    $0x8,%ax
c01039d9:	c1 e0 04             	shl    $0x4,%eax
c01039dc:	89 c2                	mov    %eax,%edx
c01039de:	8b 45 10             	mov    0x10(%ebp),%eax
c01039e1:	c1 e8 10             	shr    $0x10,%eax
c01039e4:	83 e0 0f             	and    $0xf,%eax
c01039e7:	09 c2                	or     %eax,%edx
c01039e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01039ec:	88 50 06             	mov    %dl,0x6(%eax)
c01039ef:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039f2:	c1 e8 18             	shr    $0x18,%eax
c01039f5:	89 c2                	mov    %eax,%edx
c01039f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01039fa:	88 50 07             	mov    %dl,0x7(%eax)
c01039fd:	90                   	nop
c01039fe:	c9                   	leave  
c01039ff:	c3                   	ret    

c0103a00 <Seg2PhyAddr>:
c0103a00:	55                   	push   %ebp
c0103a01:	89 e5                	mov    %esp,%ebp
c0103a03:	83 ec 10             	sub    $0x10,%esp
c0103a06:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a09:	c1 e8 03             	shr    $0x3,%eax
c0103a0c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103a13:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c0103a1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a1d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103a20:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103a24:	0f b7 c0             	movzwl %ax,%eax
c0103a27:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103a2b:	0f b6 d2             	movzbl %dl,%edx
c0103a2e:	c1 e2 10             	shl    $0x10,%edx
c0103a31:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103a37:	09 d0                	or     %edx,%eax
c0103a39:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a3f:	c9                   	leave  
c0103a40:	c3                   	ret    

c0103a41 <Seg2PhyAddrLDT>:
c0103a41:	55                   	push   %ebp
c0103a42:	89 e5                	mov    %esp,%ebp
c0103a44:	83 ec 10             	sub    $0x10,%esp
c0103a47:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a4a:	c1 e8 03             	shr    $0x3,%eax
c0103a4d:	89 c2                	mov    %eax,%edx
c0103a4f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a52:	83 c2 20             	add    $0x20,%edx
c0103a55:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103a59:	8b 02                	mov    (%edx),%eax
c0103a5b:	8b 52 04             	mov    0x4(%edx),%edx
c0103a5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103a61:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103a64:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103a68:	0f b7 c0             	movzwl %ax,%eax
c0103a6b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103a6f:	0f b6 d2             	movzbl %dl,%edx
c0103a72:	c1 e2 10             	shl    $0x10,%edx
c0103a75:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103a7b:	09 d0                	or     %edx,%eax
c0103a7d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a80:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a83:	c9                   	leave  
c0103a84:	c3                   	ret    

c0103a85 <VirAddr2PhyAddr>:
c0103a85:	55                   	push   %ebp
c0103a86:	89 e5                	mov    %esp,%ebp
c0103a88:	83 ec 10             	sub    $0x10,%esp
c0103a8b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103a8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a91:	01 d0                	add    %edx,%eax
c0103a93:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a96:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a99:	c9                   	leave  
c0103a9a:	c3                   	ret    

c0103a9b <v2l>:
c0103a9b:	55                   	push   %ebp
c0103a9c:	89 e5                	mov    %esp,%ebp
c0103a9e:	83 ec 18             	sub    $0x18,%esp
c0103aa1:	83 ec 0c             	sub    $0xc,%esp
c0103aa4:	ff 75 08             	pushl  0x8(%ebp)
c0103aa7:	e8 4a fe ff ff       	call   c01038f6 <pid2proc>
c0103aac:	83 c4 10             	add    $0x10,%esp
c0103aaf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103ab2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103ab9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103abc:	83 ec 08             	sub    $0x8,%esp
c0103abf:	ff 75 f4             	pushl  -0xc(%ebp)
c0103ac2:	50                   	push   %eax
c0103ac3:	e8 79 ff ff ff       	call   c0103a41 <Seg2PhyAddrLDT>
c0103ac8:	83 c4 10             	add    $0x10,%esp
c0103acb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103ace:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103ad1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ad4:	01 d0                	add    %edx,%eax
c0103ad6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103ad9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103adc:	c9                   	leave  
c0103add:	c3                   	ret    

c0103ade <init_propt>:
c0103ade:	55                   	push   %ebp
c0103adf:	89 e5                	mov    %esp,%ebp
c0103ae1:	83 ec 38             	sub    $0x38,%esp
c0103ae4:	6a 0e                	push   $0xe
c0103ae6:	6a 08                	push   $0x8
c0103ae8:	68 71 01 10 c0       	push   $0xc0100171
c0103aed:	6a 20                	push   $0x20
c0103aef:	e8 6b 01 00 00       	call   c0103c5f <InitInterruptDesc>
c0103af4:	83 c4 10             	add    $0x10,%esp
c0103af7:	6a 0e                	push   $0xe
c0103af9:	6a 08                	push   $0x8
c0103afb:	68 9f 01 10 c0       	push   $0xc010019f
c0103b00:	6a 21                	push   $0x21
c0103b02:	e8 58 01 00 00       	call   c0103c5f <InitInterruptDesc>
c0103b07:	83 c4 10             	add    $0x10,%esp
c0103b0a:	6a 0e                	push   $0xe
c0103b0c:	6a 08                	push   $0x8
c0103b0e:	68 e2 01 10 c0       	push   $0xc01001e2
c0103b13:	6a 2e                	push   $0x2e
c0103b15:	e8 45 01 00 00       	call   c0103c5f <InitInterruptDesc>
c0103b1a:	83 c4 10             	add    $0x10,%esp
c0103b1d:	6a 0e                	push   $0xe
c0103b1f:	6a 08                	push   $0x8
c0103b21:	68 28 02 10 c0       	push   $0xc0100228
c0103b26:	6a 2a                	push   $0x2a
c0103b28:	e8 32 01 00 00       	call   c0103c5f <InitInterruptDesc>
c0103b2d:	83 c4 10             	add    $0x10,%esp
c0103b30:	83 ec 04             	sub    $0x4,%esp
c0103b33:	68 e0 15 00 00       	push   $0x15e0
c0103b38:	6a 00                	push   $0x0
c0103b3a:	68 00 22 18 c0       	push   $0xc0182200
c0103b3f:	e8 ab 86 00 00       	call   c010c1ef <Memset>
c0103b44:	83 c4 10             	add    $0x10,%esp
c0103b47:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103b4e:	83 ec 04             	sub    $0x4,%esp
c0103b51:	ff 75 f4             	pushl  -0xc(%ebp)
c0103b54:	6a 00                	push   $0x0
c0103b56:	68 40 06 11 c0       	push   $0xc0110640
c0103b5b:	e8 8f 86 00 00       	call   c010c1ef <Memset>
c0103b60:	83 c4 10             	add    $0x10,%esp
c0103b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b66:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103b6b:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103b72:	00 00 00 
c0103b75:	83 ec 0c             	sub    $0xc,%esp
c0103b78:	6a 30                	push   $0x30
c0103b7a:	e8 81 fe ff ff       	call   c0103a00 <Seg2PhyAddr>
c0103b7f:	83 c4 10             	add    $0x10,%esp
c0103b82:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103b85:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103b8c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103b93:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b96:	0f b7 d0             	movzwl %ax,%edx
c0103b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103b9c:	83 e8 01             	sub    $0x1,%eax
c0103b9f:	89 c1                	mov    %eax,%ecx
c0103ba1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103ba4:	52                   	push   %edx
c0103ba5:	51                   	push   %ecx
c0103ba6:	50                   	push   %eax
c0103ba7:	68 00 f8 10 c0       	push   $0xc010f800
c0103bac:	e8 e2 fd ff ff       	call   c0103993 <InitDescriptor>
c0103bb1:	83 c4 10             	add    $0x10,%esp
c0103bb4:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103bbb:	68 f2 00 00 00       	push   $0xf2
c0103bc0:	68 ff ff 00 00       	push   $0xffff
c0103bc5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103bc8:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103bcd:	e8 c1 fd ff ff       	call   c0103993 <InitDescriptor>
c0103bd2:	83 c4 10             	add    $0x10,%esp
c0103bd5:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103bdc:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103be3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103bea:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103bed:	0f b7 c0             	movzwl %ax,%eax
c0103bf0:	50                   	push   %eax
c0103bf1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103bf4:	6a 00                	push   $0x0
c0103bf6:	68 08 f8 10 c0       	push   $0xc010f808
c0103bfb:	e8 93 fd ff ff       	call   c0103993 <InitDescriptor>
c0103c00:	83 c4 10             	add    $0x10,%esp
c0103c03:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103c06:	0f b7 c0             	movzwl %ax,%eax
c0103c09:	50                   	push   %eax
c0103c0a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103c0d:	6a 00                	push   $0x0
c0103c0f:	68 10 f8 10 c0       	push   $0xc010f810
c0103c14:	e8 7a fd ff ff       	call   c0103993 <InitDescriptor>
c0103c19:	83 c4 10             	add    $0x10,%esp
c0103c1c:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103c23:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103c2a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103c2d:	0f b7 c0             	movzwl %ax,%eax
c0103c30:	50                   	push   %eax
c0103c31:	ff 75 d8             	pushl  -0x28(%ebp)
c0103c34:	6a 00                	push   $0x0
c0103c36:	68 18 f8 10 c0       	push   $0xc010f818
c0103c3b:	e8 53 fd ff ff       	call   c0103993 <InitDescriptor>
c0103c40:	83 c4 10             	add    $0x10,%esp
c0103c43:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103c46:	0f b7 c0             	movzwl %ax,%eax
c0103c49:	50                   	push   %eax
c0103c4a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103c4d:	6a 00                	push   $0x0
c0103c4f:	68 20 f8 10 c0       	push   $0xc010f820
c0103c54:	e8 3a fd ff ff       	call   c0103993 <InitDescriptor>
c0103c59:	83 c4 10             	add    $0x10,%esp
c0103c5c:	90                   	nop
c0103c5d:	c9                   	leave  
c0103c5e:	c3                   	ret    

c0103c5f <InitInterruptDesc>:
c0103c5f:	55                   	push   %ebp
c0103c60:	89 e5                	mov    %esp,%ebp
c0103c62:	83 ec 10             	sub    $0x10,%esp
c0103c65:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c68:	c1 e0 03             	shl    $0x3,%eax
c0103c6b:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103c70:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103c73:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c76:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103c7a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c7d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103c80:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103c83:	89 c2                	mov    %eax,%edx
c0103c85:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c88:	66 89 10             	mov    %dx,(%eax)
c0103c8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c8e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103c94:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103c97:	c1 f8 10             	sar    $0x10,%eax
c0103c9a:	89 c2                	mov    %eax,%edx
c0103c9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103c9f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103ca3:	8b 45 10             	mov    0x10(%ebp),%eax
c0103ca6:	c1 e0 04             	shl    $0x4,%eax
c0103ca9:	89 c2                	mov    %eax,%edx
c0103cab:	8b 45 14             	mov    0x14(%ebp),%eax
c0103cae:	09 d0                	or     %edx,%eax
c0103cb0:	89 c2                	mov    %eax,%edx
c0103cb2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103cb5:	88 50 05             	mov    %dl,0x5(%eax)
c0103cb8:	90                   	nop
c0103cb9:	c9                   	leave  
c0103cba:	c3                   	ret    

c0103cbb <ReloadGDT>:
c0103cbb:	55                   	push   %ebp
c0103cbc:	89 e5                	mov    %esp,%ebp
c0103cbe:	83 ec 28             	sub    $0x28,%esp
c0103cc1:	b8 d0 06 11 c0       	mov    $0xc01106d0,%eax
c0103cc6:	0f b7 00             	movzwl (%eax),%eax
c0103cc9:	98                   	cwtl   
c0103cca:	ba d2 06 11 c0       	mov    $0xc01106d2,%edx
c0103ccf:	8b 12                	mov    (%edx),%edx
c0103cd1:	83 ec 04             	sub    $0x4,%esp
c0103cd4:	50                   	push   %eax
c0103cd5:	52                   	push   %edx
c0103cd6:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103cdb:	e8 e1 84 00 00       	call   c010c1c1 <Memcpy2>
c0103ce0:	83 c4 10             	add    $0x10,%esp
c0103ce3:	c7 45 f0 d0 06 11 c0 	movl   $0xc01106d0,-0x10(%ebp)
c0103cea:	c7 45 ec d2 06 11 c0 	movl   $0xc01106d2,-0x14(%ebp)
c0103cf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103cf4:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103cf9:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103cfe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103d01:	89 10                	mov    %edx,(%eax)
c0103d03:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103d0a:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103d11:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103d14:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103d19:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103d1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103d21:	89 10                	mov    %edx,(%eax)
c0103d23:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103d2a:	eb 04                	jmp    c0103d30 <ReloadGDT+0x75>
c0103d2c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103d30:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103d37:	7e f3                	jle    c0103d2c <ReloadGDT+0x71>
c0103d39:	e8 a9 37 00 00       	call   c01074e7 <init_internal_interrupt>
c0103d3e:	e8 9b fd ff ff       	call   c0103ade <init_propt>
c0103d43:	90                   	nop
c0103d44:	c9                   	leave  
c0103d45:	c3                   	ret    

c0103d46 <select_console>:
c0103d46:	55                   	push   %ebp
c0103d47:	89 e5                	mov    %esp,%ebp
c0103d49:	83 ec 18             	sub    $0x18,%esp
c0103d4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d4f:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103d52:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103d56:	75 27                	jne    c0103d7f <select_console+0x39>
c0103d58:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103d5c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103d62:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103d67:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103d6c:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103d71:	83 ec 0c             	sub    $0xc,%esp
c0103d74:	50                   	push   %eax
c0103d75:	e8 08 00 00 00       	call   c0103d82 <flush>
c0103d7a:	83 c4 10             	add    $0x10,%esp
c0103d7d:	eb 01                	jmp    c0103d80 <select_console+0x3a>
c0103d7f:	90                   	nop
c0103d80:	c9                   	leave  
c0103d81:	c3                   	ret    

c0103d82 <flush>:
c0103d82:	55                   	push   %ebp
c0103d83:	89 e5                	mov    %esp,%ebp
c0103d85:	83 ec 08             	sub    $0x8,%esp
c0103d88:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d8b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d91:	8b 40 0c             	mov    0xc(%eax),%eax
c0103d94:	83 ec 0c             	sub    $0xc,%esp
c0103d97:	50                   	push   %eax
c0103d98:	e8 1e 00 00 00       	call   c0103dbb <set_cursor>
c0103d9d:	83 c4 10             	add    $0x10,%esp
c0103da0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103da3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103da9:	8b 40 08             	mov    0x8(%eax),%eax
c0103dac:	83 ec 0c             	sub    $0xc,%esp
c0103daf:	50                   	push   %eax
c0103db0:	e8 64 00 00 00       	call   c0103e19 <set_console_start_video_addr>
c0103db5:	83 c4 10             	add    $0x10,%esp
c0103db8:	90                   	nop
c0103db9:	c9                   	leave  
c0103dba:	c3                   	ret    

c0103dbb <set_cursor>:
c0103dbb:	55                   	push   %ebp
c0103dbc:	89 e5                	mov    %esp,%ebp
c0103dbe:	83 ec 08             	sub    $0x8,%esp
c0103dc1:	83 ec 08             	sub    $0x8,%esp
c0103dc4:	6a 0e                	push   $0xe
c0103dc6:	68 d4 03 00 00       	push   $0x3d4
c0103dcb:	e8 20 c5 ff ff       	call   c01002f0 <out_byte>
c0103dd0:	83 c4 10             	add    $0x10,%esp
c0103dd3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dd6:	c1 e8 08             	shr    $0x8,%eax
c0103dd9:	0f b7 c0             	movzwl %ax,%eax
c0103ddc:	83 ec 08             	sub    $0x8,%esp
c0103ddf:	50                   	push   %eax
c0103de0:	68 d5 03 00 00       	push   $0x3d5
c0103de5:	e8 06 c5 ff ff       	call   c01002f0 <out_byte>
c0103dea:	83 c4 10             	add    $0x10,%esp
c0103ded:	83 ec 08             	sub    $0x8,%esp
c0103df0:	6a 0f                	push   $0xf
c0103df2:	68 d4 03 00 00       	push   $0x3d4
c0103df7:	e8 f4 c4 ff ff       	call   c01002f0 <out_byte>
c0103dfc:	83 c4 10             	add    $0x10,%esp
c0103dff:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e02:	0f b7 c0             	movzwl %ax,%eax
c0103e05:	83 ec 08             	sub    $0x8,%esp
c0103e08:	50                   	push   %eax
c0103e09:	68 d5 03 00 00       	push   $0x3d5
c0103e0e:	e8 dd c4 ff ff       	call   c01002f0 <out_byte>
c0103e13:	83 c4 10             	add    $0x10,%esp
c0103e16:	90                   	nop
c0103e17:	c9                   	leave  
c0103e18:	c3                   	ret    

c0103e19 <set_console_start_video_addr>:
c0103e19:	55                   	push   %ebp
c0103e1a:	89 e5                	mov    %esp,%ebp
c0103e1c:	83 ec 08             	sub    $0x8,%esp
c0103e1f:	83 ec 08             	sub    $0x8,%esp
c0103e22:	6a 0c                	push   $0xc
c0103e24:	68 d4 03 00 00       	push   $0x3d4
c0103e29:	e8 c2 c4 ff ff       	call   c01002f0 <out_byte>
c0103e2e:	83 c4 10             	add    $0x10,%esp
c0103e31:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e34:	c1 e8 08             	shr    $0x8,%eax
c0103e37:	0f b7 c0             	movzwl %ax,%eax
c0103e3a:	83 ec 08             	sub    $0x8,%esp
c0103e3d:	50                   	push   %eax
c0103e3e:	68 d5 03 00 00       	push   $0x3d5
c0103e43:	e8 a8 c4 ff ff       	call   c01002f0 <out_byte>
c0103e48:	83 c4 10             	add    $0x10,%esp
c0103e4b:	83 ec 08             	sub    $0x8,%esp
c0103e4e:	6a 0d                	push   $0xd
c0103e50:	68 d4 03 00 00       	push   $0x3d4
c0103e55:	e8 96 c4 ff ff       	call   c01002f0 <out_byte>
c0103e5a:	83 c4 10             	add    $0x10,%esp
c0103e5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e60:	0f b7 c0             	movzwl %ax,%eax
c0103e63:	83 ec 08             	sub    $0x8,%esp
c0103e66:	50                   	push   %eax
c0103e67:	68 d5 03 00 00       	push   $0x3d5
c0103e6c:	e8 7f c4 ff ff       	call   c01002f0 <out_byte>
c0103e71:	83 c4 10             	add    $0x10,%esp
c0103e74:	90                   	nop
c0103e75:	c9                   	leave  
c0103e76:	c3                   	ret    

c0103e77 <put_key>:
c0103e77:	55                   	push   %ebp
c0103e78:	89 e5                	mov    %esp,%ebp
c0103e7a:	83 ec 04             	sub    $0x4,%esp
c0103e7d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103e80:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103e83:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e86:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103e8c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103e91:	77 4d                	ja     c0103ee0 <put_key+0x69>
c0103e93:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e96:	8b 00                	mov    (%eax),%eax
c0103e98:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103e9c:	89 10                	mov    %edx,(%eax)
c0103e9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ea1:	8b 00                	mov    (%eax),%eax
c0103ea3:	8d 50 04             	lea    0x4(%eax),%edx
c0103ea6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ea9:	89 10                	mov    %edx,(%eax)
c0103eab:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eae:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103eb4:	8d 50 01             	lea    0x1(%eax),%edx
c0103eb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eba:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103ec0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ec3:	8b 00                	mov    (%eax),%eax
c0103ec5:	8b 55 08             	mov    0x8(%ebp),%edx
c0103ec8:	83 c2 08             	add    $0x8,%edx
c0103ecb:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103ed1:	39 d0                	cmp    %edx,%eax
c0103ed3:	75 0b                	jne    c0103ee0 <put_key+0x69>
c0103ed5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ed8:	8d 50 08             	lea    0x8(%eax),%edx
c0103edb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ede:	89 10                	mov    %edx,(%eax)
c0103ee0:	90                   	nop
c0103ee1:	c9                   	leave  
c0103ee2:	c3                   	ret    

c0103ee3 <scroll_up>:
c0103ee3:	55                   	push   %ebp
c0103ee4:	89 e5                	mov    %esp,%ebp
c0103ee6:	83 ec 08             	sub    $0x8,%esp
c0103ee9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eec:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ef2:	8b 40 08             	mov    0x8(%eax),%eax
c0103ef5:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103ef8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103efb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f01:	8b 00                	mov    (%eax),%eax
c0103f03:	39 c2                	cmp    %eax,%edx
c0103f05:	76 1b                	jbe    c0103f22 <scroll_up+0x3f>
c0103f07:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f0a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f10:	8b 40 08             	mov    0x8(%eax),%eax
c0103f13:	83 e8 50             	sub    $0x50,%eax
c0103f16:	83 ec 0c             	sub    $0xc,%esp
c0103f19:	50                   	push   %eax
c0103f1a:	e8 fa fe ff ff       	call   c0103e19 <set_console_start_video_addr>
c0103f1f:	83 c4 10             	add    $0x10,%esp
c0103f22:	90                   	nop
c0103f23:	c9                   	leave  
c0103f24:	c3                   	ret    

c0103f25 <scroll_down>:
c0103f25:	55                   	push   %ebp
c0103f26:	89 e5                	mov    %esp,%ebp
c0103f28:	83 ec 08             	sub    $0x8,%esp
c0103f2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f2e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f34:	8b 40 08             	mov    0x8(%eax),%eax
c0103f37:	8d 48 50             	lea    0x50(%eax),%ecx
c0103f3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f3d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f43:	8b 10                	mov    (%eax),%edx
c0103f45:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f48:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f4e:	8b 40 04             	mov    0x4(%eax),%eax
c0103f51:	01 d0                	add    %edx,%eax
c0103f53:	39 c1                	cmp    %eax,%ecx
c0103f55:	73 36                	jae    c0103f8d <scroll_down+0x68>
c0103f57:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f5a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f60:	8b 40 08             	mov    0x8(%eax),%eax
c0103f63:	83 c0 50             	add    $0x50,%eax
c0103f66:	83 ec 0c             	sub    $0xc,%esp
c0103f69:	50                   	push   %eax
c0103f6a:	e8 aa fe ff ff       	call   c0103e19 <set_console_start_video_addr>
c0103f6f:	83 c4 10             	add    $0x10,%esp
c0103f72:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f75:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f7b:	8b 50 08             	mov    0x8(%eax),%edx
c0103f7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f81:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f87:	83 c2 50             	add    $0x50,%edx
c0103f8a:	89 50 08             	mov    %edx,0x8(%eax)
c0103f8d:	90                   	nop
c0103f8e:	c9                   	leave  
c0103f8f:	c3                   	ret    

c0103f90 <out_char>:
c0103f90:	55                   	push   %ebp
c0103f91:	89 e5                	mov    %esp,%ebp
c0103f93:	83 ec 28             	sub    $0x28,%esp
c0103f96:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103f99:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103f9c:	e8 a7 2d 00 00       	call   c0106d48 <intr_disable>
c0103fa1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103fa4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fa7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fad:	8b 40 0c             	mov    0xc(%eax),%eax
c0103fb0:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103fb5:	01 c0                	add    %eax,%eax
c0103fb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103fba:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103fbe:	83 f8 08             	cmp    $0x8,%eax
c0103fc1:	0f 84 8d 00 00 00    	je     c0104054 <out_char+0xc4>
c0103fc7:	83 f8 0a             	cmp    $0xa,%eax
c0103fca:	0f 85 c9 00 00 00    	jne    c0104099 <out_char+0x109>
c0103fd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fd3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fd9:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fdc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fdf:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fe5:	8b 08                	mov    (%eax),%ecx
c0103fe7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fea:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ff0:	8b 40 04             	mov    0x4(%eax),%eax
c0103ff3:	01 c8                	add    %ecx,%eax
c0103ff5:	83 e8 50             	sub    $0x50,%eax
c0103ff8:	39 c2                	cmp    %eax,%edx
c0103ffa:	0f 83 f4 00 00 00    	jae    c01040f4 <out_char+0x164>
c0104000:	8b 45 08             	mov    0x8(%ebp),%eax
c0104003:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104009:	8b 08                	mov    (%eax),%ecx
c010400b:	8b 45 08             	mov    0x8(%ebp),%eax
c010400e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104014:	8b 50 0c             	mov    0xc(%eax),%edx
c0104017:	8b 45 08             	mov    0x8(%ebp),%eax
c010401a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104020:	8b 00                	mov    (%eax),%eax
c0104022:	29 c2                	sub    %eax,%edx
c0104024:	89 d0                	mov    %edx,%eax
c0104026:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c010402b:	f7 e2                	mul    %edx
c010402d:	89 d0                	mov    %edx,%eax
c010402f:	c1 e8 06             	shr    $0x6,%eax
c0104032:	8d 50 01             	lea    0x1(%eax),%edx
c0104035:	89 d0                	mov    %edx,%eax
c0104037:	c1 e0 02             	shl    $0x2,%eax
c010403a:	01 d0                	add    %edx,%eax
c010403c:	c1 e0 04             	shl    $0x4,%eax
c010403f:	89 c2                	mov    %eax,%edx
c0104041:	8b 45 08             	mov    0x8(%ebp),%eax
c0104044:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010404a:	01 ca                	add    %ecx,%edx
c010404c:	89 50 0c             	mov    %edx,0xc(%eax)
c010404f:	e9 a0 00 00 00       	jmp    c01040f4 <out_char+0x164>
c0104054:	8b 45 08             	mov    0x8(%ebp),%eax
c0104057:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010405d:	8b 50 0c             	mov    0xc(%eax),%edx
c0104060:	8b 45 08             	mov    0x8(%ebp),%eax
c0104063:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104069:	8b 00                	mov    (%eax),%eax
c010406b:	39 c2                	cmp    %eax,%edx
c010406d:	0f 86 84 00 00 00    	jbe    c01040f7 <out_char+0x167>
c0104073:	8b 45 08             	mov    0x8(%ebp),%eax
c0104076:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010407c:	8b 50 0c             	mov    0xc(%eax),%edx
c010407f:	83 ea 01             	sub    $0x1,%edx
c0104082:	89 50 0c             	mov    %edx,0xc(%eax)
c0104085:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104088:	83 e8 02             	sub    $0x2,%eax
c010408b:	c6 00 20             	movb   $0x20,(%eax)
c010408e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104091:	83 e8 01             	sub    $0x1,%eax
c0104094:	c6 00 00             	movb   $0x0,(%eax)
c0104097:	eb 5e                	jmp    c01040f7 <out_char+0x167>
c0104099:	8b 45 08             	mov    0x8(%ebp),%eax
c010409c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040a2:	8b 40 0c             	mov    0xc(%eax),%eax
c01040a5:	8d 48 01             	lea    0x1(%eax),%ecx
c01040a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ab:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040b1:	8b 10                	mov    (%eax),%edx
c01040b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01040b6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040bc:	8b 40 04             	mov    0x4(%eax),%eax
c01040bf:	01 d0                	add    %edx,%eax
c01040c1:	39 c1                	cmp    %eax,%ecx
c01040c3:	73 35                	jae    c01040fa <out_char+0x16a>
c01040c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01040c8:	8d 50 01             	lea    0x1(%eax),%edx
c01040cb:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01040ce:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c01040d2:	88 10                	mov    %dl,(%eax)
c01040d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01040d7:	8d 50 01             	lea    0x1(%eax),%edx
c01040da:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01040dd:	c6 00 0a             	movb   $0xa,(%eax)
c01040e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01040e3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01040e9:	8b 50 0c             	mov    0xc(%eax),%edx
c01040ec:	83 c2 01             	add    $0x1,%edx
c01040ef:	89 50 0c             	mov    %edx,0xc(%eax)
c01040f2:	eb 06                	jmp    c01040fa <out_char+0x16a>
c01040f4:	90                   	nop
c01040f5:	eb 14                	jmp    c010410b <out_char+0x17b>
c01040f7:	90                   	nop
c01040f8:	eb 11                	jmp    c010410b <out_char+0x17b>
c01040fa:	90                   	nop
c01040fb:	eb 0e                	jmp    c010410b <out_char+0x17b>
c01040fd:	83 ec 0c             	sub    $0xc,%esp
c0104100:	ff 75 08             	pushl  0x8(%ebp)
c0104103:	e8 1d fe ff ff       	call   c0103f25 <scroll_down>
c0104108:	83 c4 10             	add    $0x10,%esp
c010410b:	8b 45 08             	mov    0x8(%ebp),%eax
c010410e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104114:	8b 50 0c             	mov    0xc(%eax),%edx
c0104117:	8b 45 08             	mov    0x8(%ebp),%eax
c010411a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104120:	8b 40 08             	mov    0x8(%eax),%eax
c0104123:	29 c2                	sub    %eax,%edx
c0104125:	89 d0                	mov    %edx,%eax
c0104127:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c010412c:	77 cf                	ja     c01040fd <out_char+0x16d>
c010412e:	83 ec 0c             	sub    $0xc,%esp
c0104131:	ff 75 08             	pushl  0x8(%ebp)
c0104134:	e8 49 fc ff ff       	call   c0103d82 <flush>
c0104139:	83 c4 10             	add    $0x10,%esp
c010413c:	83 ec 0c             	sub    $0xc,%esp
c010413f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104142:	e8 2a 2c 00 00       	call   c0106d71 <intr_set_status>
c0104147:	83 c4 10             	add    $0x10,%esp
c010414a:	90                   	nop
c010414b:	c9                   	leave  
c010414c:	c3                   	ret    

c010414d <tty_dev_read>:
c010414d:	55                   	push   %ebp
c010414e:	89 e5                	mov    %esp,%ebp
c0104150:	83 ec 08             	sub    $0x8,%esp
c0104153:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104158:	39 45 08             	cmp    %eax,0x8(%ebp)
c010415b:	75 17                	jne    c0104174 <tty_dev_read+0x27>
c010415d:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104162:	85 c0                	test   %eax,%eax
c0104164:	7e 0e                	jle    c0104174 <tty_dev_read+0x27>
c0104166:	83 ec 0c             	sub    $0xc,%esp
c0104169:	ff 75 08             	pushl  0x8(%ebp)
c010416c:	e8 89 07 00 00       	call   c01048fa <keyboard_read>
c0104171:	83 c4 10             	add    $0x10,%esp
c0104174:	90                   	nop
c0104175:	c9                   	leave  
c0104176:	c3                   	ret    

c0104177 <tty_dev_write>:
c0104177:	55                   	push   %ebp
c0104178:	89 e5                	mov    %esp,%ebp
c010417a:	83 ec 28             	sub    $0x28,%esp
c010417d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104180:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104186:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104189:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104190:	e9 88 01 00 00       	jmp    c010431d <tty_dev_write+0x1a6>
c0104195:	8b 45 08             	mov    0x8(%ebp),%eax
c0104198:	8b 40 04             	mov    0x4(%eax),%eax
c010419b:	8b 00                	mov    (%eax),%eax
c010419d:	88 45 e7             	mov    %al,-0x19(%ebp)
c01041a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01041a3:	8b 40 04             	mov    0x4(%eax),%eax
c01041a6:	8d 50 04             	lea    0x4(%eax),%edx
c01041a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ac:	89 50 04             	mov    %edx,0x4(%eax)
c01041af:	8b 45 08             	mov    0x8(%ebp),%eax
c01041b2:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01041b8:	8d 50 ff             	lea    -0x1(%eax),%edx
c01041bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01041be:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c01041c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01041c7:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01041cd:	8d 50 01             	lea    0x1(%eax),%edx
c01041d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01041d3:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01041d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01041dc:	8b 40 04             	mov    0x4(%eax),%eax
c01041df:	8b 55 08             	mov    0x8(%ebp),%edx
c01041e2:	83 c2 08             	add    $0x8,%edx
c01041e5:	81 c2 00 08 00 00    	add    $0x800,%edx
c01041eb:	39 d0                	cmp    %edx,%eax
c01041ed:	75 0c                	jne    c01041fb <tty_dev_write+0x84>
c01041ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01041f2:	8d 50 08             	lea    0x8(%eax),%edx
c01041f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01041f8:	89 50 04             	mov    %edx,0x4(%eax)
c01041fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01041fe:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104204:	85 c0                	test   %eax,%eax
c0104206:	0f 84 11 01 00 00    	je     c010431d <tty_dev_write+0x1a6>
c010420c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104210:	3c 20                	cmp    $0x20,%al
c0104212:	76 08                	jbe    c010421c <tty_dev_write+0xa5>
c0104214:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104218:	3c 7e                	cmp    $0x7e,%al
c010421a:	76 10                	jbe    c010422c <tty_dev_write+0xb5>
c010421c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104220:	3c 20                	cmp    $0x20,%al
c0104222:	74 08                	je     c010422c <tty_dev_write+0xb5>
c0104224:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104228:	84 c0                	test   %al,%al
c010422a:	75 58                	jne    c0104284 <tty_dev_write+0x10d>
c010422c:	8b 45 08             	mov    0x8(%ebp),%eax
c010422f:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104235:	8b 45 08             	mov    0x8(%ebp),%eax
c0104238:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010423e:	01 d0                	add    %edx,%eax
c0104240:	83 e8 01             	sub    $0x1,%eax
c0104243:	89 c2                	mov    %eax,%edx
c0104245:	83 ec 04             	sub    $0x4,%esp
c0104248:	6a 01                	push   $0x1
c010424a:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010424d:	50                   	push   %eax
c010424e:	52                   	push   %edx
c010424f:	e8 58 2b 00 00       	call   c0106dac <Memcpy>
c0104254:	83 c4 10             	add    $0x10,%esp
c0104257:	8b 45 08             	mov    0x8(%ebp),%eax
c010425a:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104260:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104263:	8b 45 08             	mov    0x8(%ebp),%eax
c0104266:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c010426c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104270:	0f b6 c0             	movzbl %al,%eax
c0104273:	83 ec 08             	sub    $0x8,%esp
c0104276:	50                   	push   %eax
c0104277:	ff 75 08             	pushl  0x8(%ebp)
c010427a:	e8 11 fd ff ff       	call   c0103f90 <out_char>
c010427f:	83 c4 10             	add    $0x10,%esp
c0104282:	eb 7c                	jmp    c0104300 <tty_dev_write+0x189>
c0104284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104288:	3c 08                	cmp    $0x8,%al
c010428a:	75 42                	jne    c01042ce <tty_dev_write+0x157>
c010428c:	8b 45 08             	mov    0x8(%ebp),%eax
c010428f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104295:	8d 50 01             	lea    0x1(%eax),%edx
c0104298:	8b 45 08             	mov    0x8(%ebp),%eax
c010429b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01042a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01042aa:	8d 50 fe             	lea    -0x2(%eax),%edx
c01042ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01042b0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01042b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042ba:	0f b6 c0             	movzbl %al,%eax
c01042bd:	83 ec 08             	sub    $0x8,%esp
c01042c0:	50                   	push   %eax
c01042c1:	ff 75 08             	pushl  0x8(%ebp)
c01042c4:	e8 c7 fc ff ff       	call   c0103f90 <out_char>
c01042c9:	83 c4 10             	add    $0x10,%esp
c01042cc:	eb 32                	jmp    c0104300 <tty_dev_write+0x189>
c01042ce:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042d2:	3c 0a                	cmp    $0xa,%al
c01042d4:	75 2a                	jne    c0104300 <tty_dev_write+0x189>
c01042d6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01042da:	0f b6 c0             	movzbl %al,%eax
c01042dd:	83 ec 08             	sub    $0x8,%esp
c01042e0:	50                   	push   %eax
c01042e1:	ff 75 08             	pushl  0x8(%ebp)
c01042e4:	e8 a7 fc ff ff       	call   c0103f90 <out_char>
c01042e9:	83 c4 10             	add    $0x10,%esp
c01042ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01042ef:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c01042f6:	00 00 00 
c01042f9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104300:	8b 45 08             	mov    0x8(%ebp),%eax
c0104303:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104309:	8b 45 08             	mov    0x8(%ebp),%eax
c010430c:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0104312:	39 c2                	cmp    %eax,%edx
c0104314:	75 07                	jne    c010431d <tty_dev_write+0x1a6>
c0104316:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010431d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104320:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104326:	85 c0                	test   %eax,%eax
c0104328:	0f 85 67 fe ff ff    	jne    c0104195 <tty_dev_write+0x1e>
c010432e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104332:	74 6d                	je     c01043a1 <tty_dev_write+0x22a>
c0104334:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c010433b:	83 ec 0c             	sub    $0xc,%esp
c010433e:	ff 75 ec             	pushl  -0x14(%ebp)
c0104341:	e8 b6 d3 ff ff       	call   c01016fc <sys_malloc>
c0104346:	83 c4 10             	add    $0x10,%esp
c0104349:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010434c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010434f:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104356:	8b 45 08             	mov    0x8(%ebp),%eax
c0104359:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010435f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104362:	89 50 60             	mov    %edx,0x60(%eax)
c0104365:	8b 45 08             	mov    0x8(%ebp),%eax
c0104368:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010436e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104371:	89 50 68             	mov    %edx,0x68(%eax)
c0104374:	8b 45 08             	mov    0x8(%ebp),%eax
c0104377:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010437d:	83 ec 04             	sub    $0x4,%esp
c0104380:	50                   	push   %eax
c0104381:	ff 75 e8             	pushl  -0x18(%ebp)
c0104384:	6a 01                	push   $0x1
c0104386:	e8 aa 52 00 00       	call   c0109635 <send_rec>
c010438b:	83 c4 10             	add    $0x10,%esp
c010438e:	83 ec 08             	sub    $0x8,%esp
c0104391:	ff 75 ec             	pushl  -0x14(%ebp)
c0104394:	ff 75 e8             	pushl  -0x18(%ebp)
c0104397:	e8 75 d3 ff ff       	call   c0101711 <sys_free>
c010439c:	83 c4 10             	add    $0x10,%esp
c010439f:	eb 01                	jmp    c01043a2 <tty_dev_write+0x22b>
c01043a1:	90                   	nop
c01043a2:	c9                   	leave  
c01043a3:	c3                   	ret    

c01043a4 <tty_do_read>:
c01043a4:	55                   	push   %ebp
c01043a5:	89 e5                	mov    %esp,%ebp
c01043a7:	83 ec 08             	sub    $0x8,%esp
c01043aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01043ad:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01043b4:	00 00 00 
c01043b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043ba:	8b 50 68             	mov    0x68(%eax),%edx
c01043bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01043c0:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c01043c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043c9:	8b 00                	mov    (%eax),%eax
c01043cb:	89 c2                	mov    %eax,%edx
c01043cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01043d0:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c01043d6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043d9:	8b 50 60             	mov    0x60(%eax),%edx
c01043dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01043df:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01043e5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043e8:	8b 50 60             	mov    0x60(%eax),%edx
c01043eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01043ee:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c01043f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01043f7:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c01043fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104400:	8b 40 10             	mov    0x10(%eax),%eax
c0104403:	83 ec 08             	sub    $0x8,%esp
c0104406:	52                   	push   %edx
c0104407:	50                   	push   %eax
c0104408:	e8 32 1b 00 00       	call   c0105f3f <alloc_virtual_memory>
c010440d:	83 c4 10             	add    $0x10,%esp
c0104410:	89 c2                	mov    %eax,%edx
c0104412:	8b 45 08             	mov    0x8(%ebp),%eax
c0104415:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c010441b:	8b 45 08             	mov    0x8(%ebp),%eax
c010441e:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104424:	83 f8 02             	cmp    $0x2,%eax
c0104427:	74 1c                	je     c0104445 <tty_do_read+0xa1>
c0104429:	68 3b 01 00 00       	push   $0x13b
c010442e:	68 1d b5 10 c0       	push   $0xc010b51d
c0104433:	68 1d b5 10 c0       	push   $0xc010b51d
c0104438:	68 27 b5 10 c0       	push   $0xc010b527
c010443d:	e8 83 45 00 00       	call   c01089c5 <assertion_failure>
c0104442:	83 c4 10             	add    $0x10,%esp
c0104445:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104448:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010444f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104452:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104458:	83 ec 04             	sub    $0x4,%esp
c010445b:	50                   	push   %eax
c010445c:	ff 75 0c             	pushl  0xc(%ebp)
c010445f:	6a 01                	push   $0x1
c0104461:	e8 cf 51 00 00       	call   c0109635 <send_rec>
c0104466:	83 c4 10             	add    $0x10,%esp
c0104469:	90                   	nop
c010446a:	c9                   	leave  
c010446b:	c3                   	ret    

c010446c <tty_do_write>:
c010446c:	55                   	push   %ebp
c010446d:	89 e5                	mov    %esp,%ebp
c010446f:	53                   	push   %ebx
c0104470:	83 ec 24             	sub    $0x24,%esp
c0104473:	89 e0                	mov    %esp,%eax
c0104475:	89 c3                	mov    %eax,%ebx
c0104477:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010447e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104481:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104484:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104487:	89 c2                	mov    %eax,%edx
c0104489:	b8 10 00 00 00       	mov    $0x10,%eax
c010448e:	83 e8 01             	sub    $0x1,%eax
c0104491:	01 d0                	add    %edx,%eax
c0104493:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104498:	ba 00 00 00 00       	mov    $0x0,%edx
c010449d:	f7 f1                	div    %ecx
c010449f:	6b c0 10             	imul   $0x10,%eax,%eax
c01044a2:	29 c4                	sub    %eax,%esp
c01044a4:	89 e0                	mov    %esp,%eax
c01044a6:	83 c0 00             	add    $0x0,%eax
c01044a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01044ac:	83 ec 04             	sub    $0x4,%esp
c01044af:	ff 75 e8             	pushl  -0x18(%ebp)
c01044b2:	6a 00                	push   $0x0
c01044b4:	ff 75 e0             	pushl  -0x20(%ebp)
c01044b7:	e8 33 7d 00 00       	call   c010c1ef <Memset>
c01044bc:	83 c4 10             	add    $0x10,%esp
c01044bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01044c2:	8b 40 60             	mov    0x60(%eax),%eax
c01044c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01044c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01044cb:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01044d2:	00 00 00 
c01044d5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01044d8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01044db:	8b 40 10             	mov    0x10(%eax),%eax
c01044de:	83 ec 08             	sub    $0x8,%esp
c01044e1:	52                   	push   %edx
c01044e2:	50                   	push   %eax
c01044e3:	e8 57 1a 00 00       	call   c0105f3f <alloc_virtual_memory>
c01044e8:	83 c4 10             	add    $0x10,%esp
c01044eb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01044ee:	eb 7e                	jmp    c010456e <tty_do_write+0x102>
c01044f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01044f3:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01044f6:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c01044fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01044fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0104500:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104506:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104509:	01 d0                	add    %edx,%eax
c010450b:	83 ec 04             	sub    $0x4,%esp
c010450e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104511:	50                   	push   %eax
c0104512:	ff 75 e0             	pushl  -0x20(%ebp)
c0104515:	e8 92 28 00 00       	call   c0106dac <Memcpy>
c010451a:	83 c4 10             	add    $0x10,%esp
c010451d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104520:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104523:	8b 45 08             	mov    0x8(%ebp),%eax
c0104526:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010452c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010452f:	01 c2                	add    %eax,%edx
c0104531:	8b 45 08             	mov    0x8(%ebp),%eax
c0104534:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c010453a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104541:	eb 25                	jmp    c0104568 <tty_do_write+0xfc>
c0104543:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104546:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104549:	01 d0                	add    %edx,%eax
c010454b:	0f b6 00             	movzbl (%eax),%eax
c010454e:	0f b6 c0             	movzbl %al,%eax
c0104551:	83 ec 08             	sub    $0x8,%esp
c0104554:	50                   	push   %eax
c0104555:	ff 75 08             	pushl  0x8(%ebp)
c0104558:	e8 33 fa ff ff       	call   c0103f90 <out_char>
c010455d:	83 c4 10             	add    $0x10,%esp
c0104560:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104564:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104568:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010456c:	75 d5                	jne    c0104543 <tty_do_write+0xd7>
c010456e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0104572:	0f 85 78 ff ff ff    	jne    c01044f0 <tty_do_write+0x84>
c0104578:	83 ec 0c             	sub    $0xc,%esp
c010457b:	6a 7c                	push   $0x7c
c010457d:	e8 7a d1 ff ff       	call   c01016fc <sys_malloc>
c0104582:	83 c4 10             	add    $0x10,%esp
c0104585:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104588:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010458b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104592:	8b 45 08             	mov    0x8(%ebp),%eax
c0104595:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010459b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010459e:	89 50 58             	mov    %edx,0x58(%eax)
c01045a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01045a4:	8b 00                	mov    (%eax),%eax
c01045a6:	83 ec 04             	sub    $0x4,%esp
c01045a9:	50                   	push   %eax
c01045aa:	ff 75 d8             	pushl  -0x28(%ebp)
c01045ad:	6a 01                	push   $0x1
c01045af:	e8 81 50 00 00       	call   c0109635 <send_rec>
c01045b4:	83 c4 10             	add    $0x10,%esp
c01045b7:	83 ec 08             	sub    $0x8,%esp
c01045ba:	6a 7c                	push   $0x7c
c01045bc:	ff 75 d8             	pushl  -0x28(%ebp)
c01045bf:	e8 4d d1 ff ff       	call   c0101711 <sys_free>
c01045c4:	83 c4 10             	add    $0x10,%esp
c01045c7:	89 dc                	mov    %ebx,%esp
c01045c9:	90                   	nop
c01045ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01045cd:	c9                   	leave  
c01045ce:	c3                   	ret    

c01045cf <init_screen>:
c01045cf:	55                   	push   %ebp
c01045d0:	89 e5                	mov    %esp,%ebp
c01045d2:	83 ec 10             	sub    $0x10,%esp
c01045d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01045d8:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01045dd:	c1 f8 03             	sar    $0x3,%eax
c01045e0:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01045e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01045e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01045ec:	c1 e0 04             	shl    $0x4,%eax
c01045ef:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c01045f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01045f8:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c01045fe:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104605:	8b 45 08             	mov    0x8(%ebp),%eax
c0104608:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010460e:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0104611:	89 50 04             	mov    %edx,0x4(%eax)
c0104614:	8b 45 08             	mov    0x8(%ebp),%eax
c0104617:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010461d:	8b 50 04             	mov    0x4(%eax),%edx
c0104620:	8b 45 08             	mov    0x8(%ebp),%eax
c0104623:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104629:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010462d:	89 10                	mov    %edx,(%eax)
c010462f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104632:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104638:	8b 45 08             	mov    0x8(%ebp),%eax
c010463b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104641:	8b 12                	mov    (%edx),%edx
c0104643:	89 50 08             	mov    %edx,0x8(%eax)
c0104646:	8b 55 08             	mov    0x8(%ebp),%edx
c0104649:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010464f:	8b 40 08             	mov    0x8(%eax),%eax
c0104652:	89 42 0c             	mov    %eax,0xc(%edx)
c0104655:	90                   	nop
c0104656:	c9                   	leave  
c0104657:	c3                   	ret    

c0104658 <init_tty>:
c0104658:	55                   	push   %ebp
c0104659:	89 e5                	mov    %esp,%ebp
c010465b:	83 ec 18             	sub    $0x18,%esp
c010465e:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104665:	e9 92 00 00 00       	jmp    c01046fc <init_tty+0xa4>
c010466a:	83 ec 04             	sub    $0x4,%esp
c010466d:	68 28 08 00 00       	push   $0x828
c0104672:	6a 00                	push   $0x0
c0104674:	ff 75 f4             	pushl  -0xc(%ebp)
c0104677:	e8 73 7b 00 00       	call   c010c1ef <Memset>
c010467c:	83 c4 10             	add    $0x10,%esp
c010467f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104682:	8d 50 08             	lea    0x8(%eax),%edx
c0104685:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104688:	89 50 04             	mov    %edx,0x4(%eax)
c010468b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010468e:	8b 50 04             	mov    0x4(%eax),%edx
c0104691:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104694:	89 10                	mov    %edx,(%eax)
c0104696:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104699:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c01046a0:	00 00 00 
c01046a3:	83 ec 0c             	sub    $0xc,%esp
c01046a6:	ff 75 f4             	pushl  -0xc(%ebp)
c01046a9:	e8 21 ff ff ff       	call   c01045cf <init_screen>
c01046ae:	83 c4 10             	add    $0x10,%esp
c01046b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046b4:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01046b9:	85 c0                	test   %eax,%eax
c01046bb:	7e 38                	jle    c01046f5 <init_tty+0x9d>
c01046bd:	83 ec 08             	sub    $0x8,%esp
c01046c0:	6a 23                	push   $0x23
c01046c2:	ff 75 f4             	pushl  -0xc(%ebp)
c01046c5:	e8 c6 f8 ff ff       	call   c0103f90 <out_char>
c01046ca:	83 c4 10             	add    $0x10,%esp
c01046cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046d0:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c01046d5:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01046da:	c1 f8 03             	sar    $0x3,%eax
c01046dd:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01046e3:	0f b6 c0             	movzbl %al,%eax
c01046e6:	83 ec 08             	sub    $0x8,%esp
c01046e9:	50                   	push   %eax
c01046ea:	ff 75 f4             	pushl  -0xc(%ebp)
c01046ed:	e8 9e f8 ff ff       	call   c0103f90 <out_char>
c01046f2:	83 c4 10             	add    $0x10,%esp
c01046f5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01046fc:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104701:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104704:	0f 82 60 ff ff ff    	jb     c010466a <init_tty+0x12>
c010470a:	90                   	nop
c010470b:	c9                   	leave  
c010470c:	c3                   	ret    

c010470d <TaskTTY>:
c010470d:	55                   	push   %ebp
c010470e:	89 e5                	mov    %esp,%ebp
c0104710:	83 ec 28             	sub    $0x28,%esp
c0104713:	e8 40 ff ff ff       	call   c0104658 <init_tty>
c0104718:	83 ec 0c             	sub    $0xc,%esp
c010471b:	6a 00                	push   $0x0
c010471d:	e8 24 f6 ff ff       	call   c0103d46 <select_console>
c0104722:	83 c4 10             	add    $0x10,%esp
c0104725:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010472c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104733:	83 ec 0c             	sub    $0xc,%esp
c0104736:	6a 7c                	push   $0x7c
c0104738:	e8 bf cf ff ff       	call   c01016fc <sys_malloc>
c010473d:	83 c4 10             	add    $0x10,%esp
c0104740:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104743:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c010474a:	eb 30                	jmp    c010477c <TaskTTY+0x6f>
c010474c:	83 ec 0c             	sub    $0xc,%esp
c010474f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104752:	e8 f6 f9 ff ff       	call   c010414d <tty_dev_read>
c0104757:	83 c4 10             	add    $0x10,%esp
c010475a:	83 ec 0c             	sub    $0xc,%esp
c010475d:	ff 75 f4             	pushl  -0xc(%ebp)
c0104760:	e8 12 fa ff ff       	call   c0104177 <tty_dev_write>
c0104765:	83 c4 10             	add    $0x10,%esp
c0104768:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010476b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104771:	85 c0                	test   %eax,%eax
c0104773:	75 d7                	jne    c010474c <TaskTTY+0x3f>
c0104775:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010477c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104781:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104784:	72 c6                	jb     c010474c <TaskTTY+0x3f>
c0104786:	83 ec 04             	sub    $0x4,%esp
c0104789:	6a 12                	push   $0x12
c010478b:	ff 75 e8             	pushl  -0x18(%ebp)
c010478e:	6a 02                	push   $0x2
c0104790:	e8 a0 4e 00 00       	call   c0109635 <send_rec>
c0104795:	83 c4 10             	add    $0x10,%esp
c0104798:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010479b:	8b 40 78             	mov    0x78(%eax),%eax
c010479e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01047a1:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01047a8:	74 28                	je     c01047d2 <TaskTTY+0xc5>
c01047aa:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01047b1:	7f 0b                	jg     c01047be <TaskTTY+0xb1>
c01047b3:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c01047ba:	74 4e                	je     c010480a <TaskTTY+0xfd>
c01047bc:	eb 4d                	jmp    c010480b <TaskTTY+0xfe>
c01047be:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c01047c5:	74 21                	je     c01047e8 <TaskTTY+0xdb>
c01047c7:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c01047ce:	74 2e                	je     c01047fe <TaskTTY+0xf1>
c01047d0:	eb 39                	jmp    c010480b <TaskTTY+0xfe>
c01047d2:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01047d7:	83 ec 08             	sub    $0x8,%esp
c01047da:	ff 75 e8             	pushl  -0x18(%ebp)
c01047dd:	50                   	push   %eax
c01047de:	e8 c1 fb ff ff       	call   c01043a4 <tty_do_read>
c01047e3:	83 c4 10             	add    $0x10,%esp
c01047e6:	eb 23                	jmp    c010480b <TaskTTY+0xfe>
c01047e8:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01047ed:	83 ec 08             	sub    $0x8,%esp
c01047f0:	ff 75 e8             	pushl  -0x18(%ebp)
c01047f3:	50                   	push   %eax
c01047f4:	e8 73 fc ff ff       	call   c010446c <tty_do_write>
c01047f9:	83 c4 10             	add    $0x10,%esp
c01047fc:	eb 0d                	jmp    c010480b <TaskTTY+0xfe>
c01047fe:	c7 05 c4 06 11 c0 00 	movl   $0x0,0xc01106c4
c0104805:	00 00 00 
c0104808:	eb 01                	jmp    c010480b <TaskTTY+0xfe>
c010480a:	90                   	nop
c010480b:	e9 33 ff ff ff       	jmp    c0104743 <TaskTTY+0x36>

c0104810 <keyboard_handler>:
c0104810:	55                   	push   %ebp
c0104811:	89 e5                	mov    %esp,%ebp
c0104813:	83 ec 18             	sub    $0x18,%esp
c0104816:	c7 05 c4 06 11 c0 01 	movl   $0x1,0xc01106c4
c010481d:	00 00 00 
c0104820:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104827:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010482c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104831:	7f 5e                	jg     c0104891 <keyboard_handler+0x81>
c0104833:	e8 da ba ff ff       	call   c0100312 <disable_int>
c0104838:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010483b:	0f b7 c0             	movzwl %ax,%eax
c010483e:	83 ec 0c             	sub    $0xc,%esp
c0104841:	50                   	push   %eax
c0104842:	e8 9d ba ff ff       	call   c01002e4 <in_byte>
c0104847:	83 c4 10             	add    $0x10,%esp
c010484a:	88 45 f3             	mov    %al,-0xd(%ebp)
c010484d:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104852:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104856:	88 10                	mov    %dl,(%eax)
c0104858:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010485d:	83 c0 01             	add    $0x1,%eax
c0104860:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104865:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010486a:	83 c0 01             	add    $0x1,%eax
c010486d:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104872:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104877:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c010487c:	39 d0                	cmp    %edx,%eax
c010487e:	72 0a                	jb     c010488a <keyboard_handler+0x7a>
c0104880:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104887:	fb 10 c0 
c010488a:	e8 85 ba ff ff       	call   c0100314 <enable_int>
c010488f:	eb 01                	jmp    c0104892 <keyboard_handler+0x82>
c0104891:	90                   	nop
c0104892:	c9                   	leave  
c0104893:	c3                   	ret    

c0104894 <read_from_keyboard_buf>:
c0104894:	55                   	push   %ebp
c0104895:	89 e5                	mov    %esp,%ebp
c0104897:	83 ec 18             	sub    $0x18,%esp
c010489a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c010489e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01048a3:	85 c0                	test   %eax,%eax
c01048a5:	7f 06                	jg     c01048ad <read_from_keyboard_buf+0x19>
c01048a7:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01048ab:	eb 4b                	jmp    c01048f8 <read_from_keyboard_buf+0x64>
c01048ad:	e8 60 ba ff ff       	call   c0100312 <disable_int>
c01048b2:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01048b7:	0f b6 00             	movzbl (%eax),%eax
c01048ba:	88 45 f7             	mov    %al,-0x9(%ebp)
c01048bd:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01048c2:	83 c0 01             	add    $0x1,%eax
c01048c5:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01048ca:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01048cf:	83 e8 01             	sub    $0x1,%eax
c01048d2:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01048d7:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01048dc:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01048e1:	39 d0                	cmp    %edx,%eax
c01048e3:	72 0a                	jb     c01048ef <read_from_keyboard_buf+0x5b>
c01048e5:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c01048ec:	fb 10 c0 
c01048ef:	e8 20 ba ff ff       	call   c0100314 <enable_int>
c01048f4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01048f8:	c9                   	leave  
c01048f9:	c3                   	ret    

c01048fa <keyboard_read>:
c01048fa:	55                   	push   %ebp
c01048fb:	89 e5                	mov    %esp,%ebp
c01048fd:	83 ec 28             	sub    $0x28,%esp
c0104900:	90                   	nop
c0104901:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104906:	85 c0                	test   %eax,%eax
c0104908:	7e f7                	jle    c0104901 <keyboard_read+0x7>
c010490a:	e8 85 ff ff ff       	call   c0104894 <read_from_keyboard_buf>
c010490f:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104912:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104919:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010491d:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104921:	75 5a                	jne    c010497d <keyboard_read+0x83>
c0104923:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104927:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c010492b:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010492f:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104933:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104937:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c010493b:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010493f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104946:	eb 20                	jmp    c0104968 <keyboard_read+0x6e>
c0104948:	e8 47 ff ff ff       	call   c0104894 <read_from_keyboard_buf>
c010494d:	89 c1                	mov    %eax,%ecx
c010494f:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104952:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104955:	01 d0                	add    %edx,%eax
c0104957:	0f b6 00             	movzbl (%eax),%eax
c010495a:	38 c1                	cmp    %al,%cl
c010495c:	74 06                	je     c0104964 <keyboard_read+0x6a>
c010495e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0104962:	eb 0a                	jmp    c010496e <keyboard_read+0x74>
c0104964:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104968:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c010496c:	7e da                	jle    c0104948 <keyboard_read+0x4e>
c010496e:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0104972:	74 68                	je     c01049dc <keyboard_read+0xe2>
c0104974:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c010497b:	eb 5f                	jmp    c01049dc <keyboard_read+0xe2>
c010497d:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104981:	75 59                	jne    c01049dc <keyboard_read+0xe2>
c0104983:	e8 0c ff ff ff       	call   c0104894 <read_from_keyboard_buf>
c0104988:	3c 2a                	cmp    $0x2a,%al
c010498a:	75 1d                	jne    c01049a9 <keyboard_read+0xaf>
c010498c:	e8 03 ff ff ff       	call   c0104894 <read_from_keyboard_buf>
c0104991:	3c e0                	cmp    $0xe0,%al
c0104993:	75 14                	jne    c01049a9 <keyboard_read+0xaf>
c0104995:	e8 fa fe ff ff       	call   c0104894 <read_from_keyboard_buf>
c010499a:	3c 37                	cmp    $0x37,%al
c010499c:	75 0b                	jne    c01049a9 <keyboard_read+0xaf>
c010499e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01049a5:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c01049a9:	e8 e6 fe ff ff       	call   c0104894 <read_from_keyboard_buf>
c01049ae:	3c b7                	cmp    $0xb7,%al
c01049b0:	75 1d                	jne    c01049cf <keyboard_read+0xd5>
c01049b2:	e8 dd fe ff ff       	call   c0104894 <read_from_keyboard_buf>
c01049b7:	3c e0                	cmp    $0xe0,%al
c01049b9:	75 14                	jne    c01049cf <keyboard_read+0xd5>
c01049bb:	e8 d4 fe ff ff       	call   c0104894 <read_from_keyboard_buf>
c01049c0:	3c aa                	cmp    $0xaa,%al
c01049c2:	75 0b                	jne    c01049cf <keyboard_read+0xd5>
c01049c4:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01049cb:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01049cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01049d3:	75 07                	jne    c01049dc <keyboard_read+0xe2>
c01049d5:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c01049dc:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c01049e3:	0f 84 8d 00 00 00    	je     c0104a76 <keyboard_read+0x17c>
c01049e9:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c01049f0:	0f 84 80 00 00 00    	je     c0104a76 <keyboard_read+0x17c>
c01049f6:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c01049fa:	0f 94 c2             	sete   %dl
c01049fd:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104a01:	0f 94 c0             	sete   %al
c0104a04:	09 d0                	or     %edx,%eax
c0104a06:	84 c0                	test   %al,%al
c0104a08:	74 07                	je     c0104a11 <keyboard_read+0x117>
c0104a0a:	c6 05 cc 06 11 c0 01 	movb   $0x1,0xc01106cc
c0104a11:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104a15:	f7 d0                	not    %eax
c0104a17:	c0 e8 07             	shr    $0x7,%al
c0104a1a:	88 45 e9             	mov    %al,-0x17(%ebp)
c0104a1d:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104a21:	74 53                	je     c0104a76 <keyboard_read+0x17c>
c0104a23:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104a27:	74 4d                	je     c0104a76 <keyboard_read+0x17c>
c0104a29:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0104a2d:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104a34:	3c 01                	cmp    $0x1,%al
c0104a36:	75 04                	jne    c0104a3c <keyboard_read+0x142>
c0104a38:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104a3c:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104a43:	84 c0                	test   %al,%al
c0104a45:	74 04                	je     c0104a4b <keyboard_read+0x151>
c0104a47:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104a4b:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0104a4f:	89 d0                	mov    %edx,%eax
c0104a51:	01 c0                	add    %eax,%eax
c0104a53:	01 c2                	add    %eax,%edx
c0104a55:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104a59:	01 d0                	add    %edx,%eax
c0104a5b:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c0104a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104a65:	83 ec 08             	sub    $0x8,%esp
c0104a68:	ff 75 f4             	pushl  -0xc(%ebp)
c0104a6b:	ff 75 08             	pushl  0x8(%ebp)
c0104a6e:	e8 1a 00 00 00       	call   c0104a8d <in_process>
c0104a73:	83 c4 10             	add    $0x10,%esp
c0104a76:	90                   	nop
c0104a77:	c9                   	leave  
c0104a78:	c3                   	ret    

c0104a79 <init_keyboard_handler>:
c0104a79:	55                   	push   %ebp
c0104a7a:	89 e5                	mov    %esp,%ebp
c0104a7c:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a83:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104a8a:	90                   	nop
c0104a8b:	5d                   	pop    %ebp
c0104a8c:	c3                   	ret    

c0104a8d <in_process>:
c0104a8d:	55                   	push   %ebp
c0104a8e:	89 e5                	mov    %esp,%ebp
c0104a90:	83 ec 18             	sub    $0x18,%esp
c0104a93:	83 ec 04             	sub    $0x4,%esp
c0104a96:	6a 02                	push   $0x2
c0104a98:	6a 00                	push   $0x0
c0104a9a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0104a9d:	50                   	push   %eax
c0104a9e:	e8 4c 77 00 00       	call   c010c1ef <Memset>
c0104aa3:	83 c4 10             	add    $0x10,%esp
c0104aa6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104aa9:	25 00 01 00 00       	and    $0x100,%eax
c0104aae:	85 c0                	test   %eax,%eax
c0104ab0:	75 28                	jne    c0104ada <in_process+0x4d>
c0104ab2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ab5:	0f b6 c0             	movzbl %al,%eax
c0104ab8:	83 ec 08             	sub    $0x8,%esp
c0104abb:	50                   	push   %eax
c0104abc:	ff 75 08             	pushl  0x8(%ebp)
c0104abf:	e8 b3 f3 ff ff       	call   c0103e77 <put_key>
c0104ac4:	83 c4 10             	add    $0x10,%esp
c0104ac7:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104ace:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104ad5:	e9 42 01 00 00       	jmp    c0104c1c <in_process+0x18f>
c0104ada:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104ae1:	84 c0                	test   %al,%al
c0104ae3:	0f 84 a9 00 00 00    	je     c0104b92 <in_process+0x105>
c0104ae9:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104aed:	0f 84 9f 00 00 00    	je     c0104b92 <in_process+0x105>
c0104af3:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104af7:	0f 84 95 00 00 00    	je     c0104b92 <in_process+0x105>
c0104afd:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104b04:	74 64                	je     c0104b6a <in_process+0xdd>
c0104b06:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104b0d:	77 0b                	ja     c0104b1a <in_process+0x8d>
c0104b0f:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104b16:	74 64                	je     c0104b7c <in_process+0xef>
c0104b18:	eb 73                	jmp    c0104b8d <in_process+0x100>
c0104b1a:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104b21:	74 0b                	je     c0104b2e <in_process+0xa1>
c0104b23:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104b2a:	74 20                	je     c0104b4c <in_process+0xbf>
c0104b2c:	eb 5f                	jmp    c0104b8d <in_process+0x100>
c0104b2e:	83 ec 0c             	sub    $0xc,%esp
c0104b31:	ff 75 08             	pushl  0x8(%ebp)
c0104b34:	e8 aa f3 ff ff       	call   c0103ee3 <scroll_up>
c0104b39:	83 c4 10             	add    $0x10,%esp
c0104b3c:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104b43:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104b4a:	eb 41                	jmp    c0104b8d <in_process+0x100>
c0104b4c:	83 ec 0c             	sub    $0xc,%esp
c0104b4f:	ff 75 08             	pushl  0x8(%ebp)
c0104b52:	e8 ce f3 ff ff       	call   c0103f25 <scroll_down>
c0104b57:	83 c4 10             	add    $0x10,%esp
c0104b5a:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104b61:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104b68:	eb 23                	jmp    c0104b8d <in_process+0x100>
c0104b6a:	83 ec 08             	sub    $0x8,%esp
c0104b6d:	6a 0a                	push   $0xa
c0104b6f:	ff 75 08             	pushl  0x8(%ebp)
c0104b72:	e8 19 f4 ff ff       	call   c0103f90 <out_char>
c0104b77:	83 c4 10             	add    $0x10,%esp
c0104b7a:	eb 11                	jmp    c0104b8d <in_process+0x100>
c0104b7c:	83 ec 08             	sub    $0x8,%esp
c0104b7f:	6a 08                	push   $0x8
c0104b81:	ff 75 08             	pushl  0x8(%ebp)
c0104b84:	e8 07 f4 ff ff       	call   c0103f90 <out_char>
c0104b89:	83 c4 10             	add    $0x10,%esp
c0104b8c:	90                   	nop
c0104b8d:	e9 8a 00 00 00       	jmp    c0104c1c <in_process+0x18f>
c0104b92:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104b99:	74 55                	je     c0104bf0 <in_process+0x163>
c0104b9b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104ba2:	77 14                	ja     c0104bb8 <in_process+0x12b>
c0104ba4:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104bab:	74 31                	je     c0104bde <in_process+0x151>
c0104bad:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104bb4:	74 16                	je     c0104bcc <in_process+0x13f>
c0104bb6:	eb 64                	jmp    c0104c1c <in_process+0x18f>
c0104bb8:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104bbf:	74 3e                	je     c0104bff <in_process+0x172>
c0104bc1:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104bc8:	74 44                	je     c0104c0e <in_process+0x181>
c0104bca:	eb 50                	jmp    c0104c1c <in_process+0x18f>
c0104bcc:	83 ec 08             	sub    $0x8,%esp
c0104bcf:	6a 0a                	push   $0xa
c0104bd1:	ff 75 08             	pushl  0x8(%ebp)
c0104bd4:	e8 9e f2 ff ff       	call   c0103e77 <put_key>
c0104bd9:	83 c4 10             	add    $0x10,%esp
c0104bdc:	eb 3e                	jmp    c0104c1c <in_process+0x18f>
c0104bde:	83 ec 08             	sub    $0x8,%esp
c0104be1:	6a 08                	push   $0x8
c0104be3:	ff 75 08             	pushl  0x8(%ebp)
c0104be6:	e8 8c f2 ff ff       	call   c0103e77 <put_key>
c0104beb:	83 c4 10             	add    $0x10,%esp
c0104bee:	eb 2c                	jmp    c0104c1c <in_process+0x18f>
c0104bf0:	83 ec 0c             	sub    $0xc,%esp
c0104bf3:	6a 00                	push   $0x0
c0104bf5:	e8 4c f1 ff ff       	call   c0103d46 <select_console>
c0104bfa:	83 c4 10             	add    $0x10,%esp
c0104bfd:	eb 1d                	jmp    c0104c1c <in_process+0x18f>
c0104bff:	83 ec 0c             	sub    $0xc,%esp
c0104c02:	6a 01                	push   $0x1
c0104c04:	e8 3d f1 ff ff       	call   c0103d46 <select_console>
c0104c09:	83 c4 10             	add    $0x10,%esp
c0104c0c:	eb 0e                	jmp    c0104c1c <in_process+0x18f>
c0104c0e:	83 ec 0c             	sub    $0xc,%esp
c0104c11:	6a 02                	push   $0x2
c0104c13:	e8 2e f1 ff ff       	call   c0103d46 <select_console>
c0104c18:	83 c4 10             	add    $0x10,%esp
c0104c1b:	90                   	nop
c0104c1c:	90                   	nop
c0104c1d:	c9                   	leave  
c0104c1e:	c3                   	ret    

c0104c1f <open>:
c0104c1f:	55                   	push   %ebp
c0104c20:	89 e5                	mov    %esp,%ebp
c0104c22:	83 ec 18             	sub    $0x18,%esp
c0104c25:	83 ec 0c             	sub    $0xc,%esp
c0104c28:	6a 7c                	push   $0x7c
c0104c2a:	e8 cd ca ff ff       	call   c01016fc <sys_malloc>
c0104c2f:	83 c4 10             	add    $0x10,%esp
c0104c32:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104c35:	83 ec 04             	sub    $0x4,%esp
c0104c38:	6a 7c                	push   $0x7c
c0104c3a:	6a 00                	push   $0x0
c0104c3c:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c3f:	e8 ab 75 00 00       	call   c010c1ef <Memset>
c0104c44:	83 c4 10             	add    $0x10,%esp
c0104c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c4a:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104c51:	83 ec 0c             	sub    $0xc,%esp
c0104c54:	ff 75 08             	pushl  0x8(%ebp)
c0104c57:	e8 32 14 00 00       	call   c010608e <get_physical_address>
c0104c5c:	83 c4 10             	add    $0x10,%esp
c0104c5f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c65:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104c68:	89 50 44             	mov    %edx,0x44(%eax)
c0104c6b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c71:	89 50 74             	mov    %edx,0x74(%eax)
c0104c74:	83 ec 0c             	sub    $0xc,%esp
c0104c77:	ff 75 08             	pushl  0x8(%ebp)
c0104c7a:	e8 a9 75 00 00       	call   c010c228 <Strlen>
c0104c7f:	83 c4 10             	add    $0x10,%esp
c0104c82:	89 c2                	mov    %eax,%edx
c0104c84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104c87:	89 50 40             	mov    %edx,0x40(%eax)
c0104c8a:	83 ec 04             	sub    $0x4,%esp
c0104c8d:	6a 02                	push   $0x2
c0104c8f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c92:	6a 03                	push   $0x3
c0104c94:	e8 9c 49 00 00       	call   c0109635 <send_rec>
c0104c99:	83 c4 10             	add    $0x10,%esp
c0104c9c:	83 ec 08             	sub    $0x8,%esp
c0104c9f:	6a 7c                	push   $0x7c
c0104ca1:	ff 75 f4             	pushl  -0xc(%ebp)
c0104ca4:	e8 68 ca ff ff       	call   c0101711 <sys_free>
c0104ca9:	83 c4 10             	add    $0x10,%esp
c0104cac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104caf:	8b 40 50             	mov    0x50(%eax),%eax
c0104cb2:	c9                   	leave  
c0104cb3:	c3                   	ret    

c0104cb4 <read>:
c0104cb4:	55                   	push   %ebp
c0104cb5:	89 e5                	mov    %esp,%ebp
c0104cb7:	83 ec 38             	sub    $0x38,%esp
c0104cba:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104cc1:	83 ec 0c             	sub    $0xc,%esp
c0104cc4:	ff 75 dc             	pushl  -0x24(%ebp)
c0104cc7:	e8 30 ca ff ff       	call   c01016fc <sys_malloc>
c0104ccc:	83 c4 10             	add    $0x10,%esp
c0104ccf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104cd2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104cd5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104cda:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104cdd:	83 ec 0c             	sub    $0xc,%esp
c0104ce0:	ff 75 0c             	pushl  0xc(%ebp)
c0104ce3:	e8 a6 13 00 00       	call   c010608e <get_physical_address>
c0104ce8:	83 c4 10             	add    $0x10,%esp
c0104ceb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104cee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104cf1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104cf6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104cf9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104cfc:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104d01:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104d04:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104d0b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104d12:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d18:	01 d0                	add    %edx,%eax
c0104d1a:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104d1d:	0f 83 a8 00 00 00    	jae    c0104dcb <read+0x117>
c0104d23:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104d26:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104d29:	05 00 10 00 00       	add    $0x1000,%eax
c0104d2e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104d31:	8b 45 10             	mov    0x10(%ebp),%eax
c0104d34:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104d37:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104d3a:	83 ec 04             	sub    $0x4,%esp
c0104d3d:	50                   	push   %eax
c0104d3e:	6a 00                	push   $0x0
c0104d40:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d43:	e8 a7 74 00 00       	call   c010c1ef <Memset>
c0104d48:	83 c4 10             	add    $0x10,%esp
c0104d4b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d4e:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104d55:	8b 55 08             	mov    0x8(%ebp),%edx
c0104d58:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d5b:	89 50 50             	mov    %edx,0x50(%eax)
c0104d5e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d61:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104d64:	89 50 10             	mov    %edx,0x10(%eax)
c0104d67:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d6a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104d6d:	89 50 60             	mov    %edx,0x60(%eax)
c0104d70:	83 ec 04             	sub    $0x4,%esp
c0104d73:	6a 02                	push   $0x2
c0104d75:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d78:	6a 03                	push   $0x3
c0104d7a:	e8 b6 48 00 00       	call   c0109635 <send_rec>
c0104d7f:	83 c4 10             	add    $0x10,%esp
c0104d82:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d85:	8b 40 60             	mov    0x60(%eax),%eax
c0104d88:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104d8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104d8e:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104d91:	8b 45 10             	mov    0x10(%ebp),%eax
c0104d94:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104d97:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104d9a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104d9d:	89 45 10             	mov    %eax,0x10(%ebp)
c0104da0:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104da7:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104dae:	83 ec 0c             	sub    $0xc,%esp
c0104db1:	ff 75 f4             	pushl  -0xc(%ebp)
c0104db4:	e8 d5 12 00 00       	call   c010608e <get_physical_address>
c0104db9:	83 c4 10             	add    $0x10,%esp
c0104dbc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104dbf:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104dc3:	0f 85 6e ff ff ff    	jne    c0104d37 <read+0x83>
c0104dc9:	eb 54                	jmp    c0104e1f <read+0x16b>
c0104dcb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104dce:	83 ec 04             	sub    $0x4,%esp
c0104dd1:	50                   	push   %eax
c0104dd2:	6a 00                	push   $0x0
c0104dd4:	ff 75 d8             	pushl  -0x28(%ebp)
c0104dd7:	e8 13 74 00 00       	call   c010c1ef <Memset>
c0104ddc:	83 c4 10             	add    $0x10,%esp
c0104ddf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104de2:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104de9:	8b 55 08             	mov    0x8(%ebp),%edx
c0104dec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104def:	89 50 50             	mov    %edx,0x50(%eax)
c0104df2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104df5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104df8:	89 50 10             	mov    %edx,0x10(%eax)
c0104dfb:	8b 55 10             	mov    0x10(%ebp),%edx
c0104dfe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e01:	89 50 60             	mov    %edx,0x60(%eax)
c0104e04:	83 ec 04             	sub    $0x4,%esp
c0104e07:	6a 02                	push   $0x2
c0104e09:	ff 75 d8             	pushl  -0x28(%ebp)
c0104e0c:	6a 03                	push   $0x3
c0104e0e:	e8 22 48 00 00       	call   c0109635 <send_rec>
c0104e13:	83 c4 10             	add    $0x10,%esp
c0104e16:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e19:	8b 40 60             	mov    0x60(%eax),%eax
c0104e1c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104e1f:	83 ec 08             	sub    $0x8,%esp
c0104e22:	ff 75 dc             	pushl  -0x24(%ebp)
c0104e25:	ff 75 d8             	pushl  -0x28(%ebp)
c0104e28:	e8 e4 c8 ff ff       	call   c0101711 <sys_free>
c0104e2d:	83 c4 10             	add    $0x10,%esp
c0104e30:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104e33:	c9                   	leave  
c0104e34:	c3                   	ret    

c0104e35 <write>:
c0104e35:	55                   	push   %ebp
c0104e36:	89 e5                	mov    %esp,%ebp
c0104e38:	83 ec 18             	sub    $0x18,%esp
c0104e3b:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104e42:	83 ec 0c             	sub    $0xc,%esp
c0104e45:	ff 75 f4             	pushl  -0xc(%ebp)
c0104e48:	e8 af c8 ff ff       	call   c01016fc <sys_malloc>
c0104e4d:	83 c4 10             	add    $0x10,%esp
c0104e50:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104e53:	83 ec 0c             	sub    $0xc,%esp
c0104e56:	ff 75 0c             	pushl  0xc(%ebp)
c0104e59:	e8 30 12 00 00       	call   c010608e <get_physical_address>
c0104e5e:	83 c4 10             	add    $0x10,%esp
c0104e61:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104e64:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e67:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104e6e:	8b 55 08             	mov    0x8(%ebp),%edx
c0104e71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e74:	89 50 50             	mov    %edx,0x50(%eax)
c0104e77:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e7a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104e7d:	89 50 10             	mov    %edx,0x10(%eax)
c0104e80:	8b 55 10             	mov    0x10(%ebp),%edx
c0104e83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e86:	89 50 60             	mov    %edx,0x60(%eax)
c0104e89:	83 ec 04             	sub    $0x4,%esp
c0104e8c:	6a 02                	push   $0x2
c0104e8e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104e91:	6a 03                	push   $0x3
c0104e93:	e8 9d 47 00 00       	call   c0109635 <send_rec>
c0104e98:	83 c4 10             	add    $0x10,%esp
c0104e9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e9e:	8b 40 60             	mov    0x60(%eax),%eax
c0104ea1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104ea4:	83 ec 08             	sub    $0x8,%esp
c0104ea7:	ff 75 f4             	pushl  -0xc(%ebp)
c0104eaa:	ff 75 f0             	pushl  -0x10(%ebp)
c0104ead:	e8 5f c8 ff ff       	call   c0101711 <sys_free>
c0104eb2:	83 c4 10             	add    $0x10,%esp
c0104eb5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104eb8:	c9                   	leave  
c0104eb9:	c3                   	ret    

c0104eba <close>:
c0104eba:	55                   	push   %ebp
c0104ebb:	89 e5                	mov    %esp,%ebp
c0104ebd:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ec3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104eca:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ecd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104ed0:	83 ec 04             	sub    $0x4,%esp
c0104ed3:	6a 02                	push   $0x2
c0104ed5:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104edb:	50                   	push   %eax
c0104edc:	6a 03                	push   $0x3
c0104ede:	e8 52 47 00 00       	call   c0109635 <send_rec>
c0104ee3:	83 c4 10             	add    $0x10,%esp
c0104ee6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ee9:	83 f8 65             	cmp    $0x65,%eax
c0104eec:	74 19                	je     c0104f07 <close+0x4d>
c0104eee:	6a 13                	push   $0x13
c0104ef0:	68 3f b5 10 c0       	push   $0xc010b53f
c0104ef5:	68 3f b5 10 c0       	push   $0xc010b53f
c0104efa:	68 4b b5 10 c0       	push   $0xc010b54b
c0104eff:	e8 c1 3a 00 00       	call   c01089c5 <assertion_failure>
c0104f04:	83 c4 10             	add    $0x10,%esp
c0104f07:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104f0a:	c9                   	leave  
c0104f0b:	c3                   	ret    

c0104f0c <wait>:
c0104f0c:	55                   	push   %ebp
c0104f0d:	89 e5                	mov    %esp,%ebp
c0104f0f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f15:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104f1c:	83 ec 04             	sub    $0x4,%esp
c0104f1f:	6a 01                	push   $0x1
c0104f21:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f27:	50                   	push   %eax
c0104f28:	6a 03                	push   $0x3
c0104f2a:	e8 06 47 00 00       	call   c0109635 <send_rec>
c0104f2f:	83 c4 10             	add    $0x10,%esp
c0104f32:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104f35:	89 c2                	mov    %eax,%edx
c0104f37:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f3a:	89 10                	mov    %edx,(%eax)
c0104f3c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f3f:	83 f8 21             	cmp    $0x21,%eax
c0104f42:	74 05                	je     c0104f49 <wait+0x3d>
c0104f44:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f47:	eb 05                	jmp    c0104f4e <wait+0x42>
c0104f49:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104f4e:	c9                   	leave  
c0104f4f:	c3                   	ret    

c0104f50 <exit>:
c0104f50:	55                   	push   %ebp
c0104f51:	89 e5                	mov    %esp,%ebp
c0104f53:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f59:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104f60:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f63:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104f66:	83 ec 04             	sub    $0x4,%esp
c0104f69:	6a 01                	push   $0x1
c0104f6b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f71:	50                   	push   %eax
c0104f72:	6a 03                	push   $0x3
c0104f74:	e8 bc 46 00 00       	call   c0109635 <send_rec>
c0104f79:	83 c4 10             	add    $0x10,%esp
c0104f7c:	90                   	nop
c0104f7d:	c9                   	leave  
c0104f7e:	c3                   	ret    

c0104f7f <fork>:
c0104f7f:	55                   	push   %ebp
c0104f80:	89 e5                	mov    %esp,%ebp
c0104f82:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f88:	83 ec 04             	sub    $0x4,%esp
c0104f8b:	6a 7c                	push   $0x7c
c0104f8d:	6a 00                	push   $0x0
c0104f8f:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f95:	50                   	push   %eax
c0104f96:	e8 54 72 00 00       	call   c010c1ef <Memset>
c0104f9b:	83 c4 10             	add    $0x10,%esp
c0104f9e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104fa5:	83 ec 04             	sub    $0x4,%esp
c0104fa8:	6a 01                	push   $0x1
c0104faa:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104fb0:	50                   	push   %eax
c0104fb1:	6a 03                	push   $0x3
c0104fb3:	e8 7d 46 00 00       	call   c0109635 <send_rec>
c0104fb8:	83 c4 10             	add    $0x10,%esp
c0104fbb:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104fc2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fc5:	c9                   	leave  
c0104fc6:	c3                   	ret    

c0104fc7 <getpid>:
c0104fc7:	55                   	push   %ebp
c0104fc8:	89 e5                	mov    %esp,%ebp
c0104fca:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104fd0:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104fd7:	83 ec 04             	sub    $0x4,%esp
c0104fda:	6a 05                	push   $0x5
c0104fdc:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104fe2:	50                   	push   %eax
c0104fe3:	6a 03                	push   $0x3
c0104fe5:	e8 4b 46 00 00       	call   c0109635 <send_rec>
c0104fea:	83 c4 10             	add    $0x10,%esp
c0104fed:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ff0:	c9                   	leave  
c0104ff1:	c3                   	ret    

c0104ff2 <exec>:
c0104ff2:	55                   	push   %ebp
c0104ff3:	89 e5                	mov    %esp,%ebp
c0104ff5:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ffb:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0105002:	8b 45 08             	mov    0x8(%ebp),%eax
c0105005:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0105008:	83 ec 0c             	sub    $0xc,%esp
c010500b:	ff 75 08             	pushl  0x8(%ebp)
c010500e:	e8 15 72 00 00       	call   c010c228 <Strlen>
c0105013:	83 c4 10             	add    $0x10,%esp
c0105016:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0105019:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0105020:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0105027:	83 ec 04             	sub    $0x4,%esp
c010502a:	6a 01                	push   $0x1
c010502c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105032:	50                   	push   %eax
c0105033:	6a 03                	push   $0x3
c0105035:	e8 fb 45 00 00       	call   c0109635 <send_rec>
c010503a:	83 c4 10             	add    $0x10,%esp
c010503d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105040:	83 f8 65             	cmp    $0x65,%eax
c0105043:	74 19                	je     c010505e <exec+0x6c>
c0105045:	6a 19                	push   $0x19
c0105047:	68 63 b5 10 c0       	push   $0xc010b563
c010504c:	68 63 b5 10 c0       	push   $0xc010b563
c0105051:	68 6e b5 10 c0       	push   $0xc010b56e
c0105056:	e8 6a 39 00 00       	call   c01089c5 <assertion_failure>
c010505b:	83 c4 10             	add    $0x10,%esp
c010505e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105061:	c9                   	leave  
c0105062:	c3                   	ret    

c0105063 <execv>:
c0105063:	55                   	push   %ebp
c0105064:	89 e5                	mov    %esp,%ebp
c0105066:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c010506c:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0105073:	83 ec 0c             	sub    $0xc,%esp
c0105076:	ff 75 e0             	pushl  -0x20(%ebp)
c0105079:	e8 7e c6 ff ff       	call   c01016fc <sys_malloc>
c010507e:	83 c4 10             	add    $0x10,%esp
c0105081:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105084:	66 87 db             	xchg   %bx,%bx
c0105087:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010508a:	83 ec 04             	sub    $0x4,%esp
c010508d:	50                   	push   %eax
c010508e:	6a 00                	push   $0x0
c0105090:	ff 75 dc             	pushl  -0x24(%ebp)
c0105093:	e8 57 71 00 00       	call   c010c1ef <Memset>
c0105098:	83 c4 10             	add    $0x10,%esp
c010509b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010509e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01050a1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01050a8:	eb 23                	jmp    c01050cd <execv+0x6a>
c01050aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01050ad:	8b 00                	mov    (%eax),%eax
c01050af:	83 ec 08             	sub    $0x8,%esp
c01050b2:	50                   	push   %eax
c01050b3:	68 86 b5 10 c0       	push   $0xc010b586
c01050b8:	e8 ab 35 00 00       	call   c0108668 <Printf>
c01050bd:	83 c4 10             	add    $0x10,%esp
c01050c0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c01050c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050c7:	83 c0 04             	add    $0x4,%eax
c01050ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01050d0:	8b 00                	mov    (%eax),%eax
c01050d2:	85 c0                	test   %eax,%eax
c01050d4:	75 d4                	jne    c01050aa <execv+0x47>
c01050d6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01050d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050dc:	01 d0                	add    %edx,%eax
c01050de:	c6 00 00             	movb   $0x0,(%eax)
c01050e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050e4:	83 c0 04             	add    $0x4,%eax
c01050e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050ea:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01050f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01050f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01050f6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01050fd:	eb 5b                	jmp    c010515a <execv+0xf7>
c01050ff:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105102:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105105:	01 c2                	add    %eax,%edx
c0105107:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010510a:	89 10                	mov    %edx,(%eax)
c010510c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010510f:	8b 00                	mov    (%eax),%eax
c0105111:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0105114:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0105117:	01 ca                	add    %ecx,%edx
c0105119:	83 ec 08             	sub    $0x8,%esp
c010511c:	50                   	push   %eax
c010511d:	52                   	push   %edx
c010511e:	e8 eb 70 00 00       	call   c010c20e <Strcpy>
c0105123:	83 c4 10             	add    $0x10,%esp
c0105126:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105129:	8b 00                	mov    (%eax),%eax
c010512b:	83 ec 0c             	sub    $0xc,%esp
c010512e:	50                   	push   %eax
c010512f:	e8 f4 70 00 00       	call   c010c228 <Strlen>
c0105134:	83 c4 10             	add    $0x10,%esp
c0105137:	01 45 f0             	add    %eax,-0x10(%ebp)
c010513a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010513d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105140:	01 d0                	add    %edx,%eax
c0105142:	c6 00 00             	movb   $0x0,(%eax)
c0105145:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105148:	83 c0 01             	add    $0x1,%eax
c010514b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010514e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0105152:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0105156:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010515a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010515d:	8b 00                	mov    (%eax),%eax
c010515f:	85 c0                	test   %eax,%eax
c0105161:	75 9c                	jne    c01050ff <execv+0x9c>
c0105163:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105166:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c010516b:	29 c2                	sub    %eax,%edx
c010516d:	89 d0                	mov    %edx,%eax
c010516f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105172:	83 ec 0c             	sub    $0xc,%esp
c0105175:	ff 75 08             	pushl  0x8(%ebp)
c0105178:	e8 11 0f 00 00       	call   c010608e <get_physical_address>
c010517d:	83 c4 10             	add    $0x10,%esp
c0105180:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105183:	83 ec 0c             	sub    $0xc,%esp
c0105186:	ff 75 dc             	pushl  -0x24(%ebp)
c0105189:	e8 00 0f 00 00       	call   c010608e <get_physical_address>
c010518e:	83 c4 10             	add    $0x10,%esp
c0105191:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105194:	83 ec 0c             	sub    $0xc,%esp
c0105197:	ff 75 d8             	pushl  -0x28(%ebp)
c010519a:	e8 ef 0e 00 00       	call   c010608e <get_physical_address>
c010519f:	83 c4 10             	add    $0x10,%esp
c01051a2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01051a5:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c01051ac:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01051af:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01051b2:	83 ec 0c             	sub    $0xc,%esp
c01051b5:	ff 75 08             	pushl  0x8(%ebp)
c01051b8:	e8 6b 70 00 00       	call   c010c228 <Strlen>
c01051bd:	83 c4 10             	add    $0x10,%esp
c01051c0:	89 45 90             	mov    %eax,-0x70(%ebp)
c01051c3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01051c6:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01051cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01051cf:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01051d5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01051d8:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01051de:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01051e1:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01051e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01051ea:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01051f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01051f3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01051f6:	29 c2                	sub    %eax,%edx
c01051f8:	89 d0                	mov    %edx,%eax
c01051fa:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0105200:	83 ec 04             	sub    $0x4,%esp
c0105203:	6a 01                	push   $0x1
c0105205:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c010520b:	50                   	push   %eax
c010520c:	6a 03                	push   $0x3
c010520e:	e8 22 44 00 00       	call   c0109635 <send_rec>
c0105213:	83 c4 10             	add    $0x10,%esp
c0105216:	83 ec 08             	sub    $0x8,%esp
c0105219:	68 00 04 00 00       	push   $0x400
c010521e:	ff 75 dc             	pushl  -0x24(%ebp)
c0105221:	e8 eb c4 ff ff       	call   c0101711 <sys_free>
c0105226:	83 c4 10             	add    $0x10,%esp
c0105229:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010522c:	83 f8 65             	cmp    $0x65,%eax
c010522f:	74 1c                	je     c010524d <execv+0x1ea>
c0105231:	68 95 00 00 00       	push   $0x95
c0105236:	68 63 b5 10 c0       	push   $0xc010b563
c010523b:	68 63 b5 10 c0       	push   $0xc010b563
c0105240:	68 6e b5 10 c0       	push   $0xc010b56e
c0105245:	e8 7b 37 00 00       	call   c01089c5 <assertion_failure>
c010524a:	83 c4 10             	add    $0x10,%esp
c010524d:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0105250:	c9                   	leave  
c0105251:	c3                   	ret    

c0105252 <execl>:
c0105252:	55                   	push   %ebp
c0105253:	89 e5                	mov    %esp,%ebp
c0105255:	83 ec 18             	sub    $0x18,%esp
c0105258:	8d 45 0c             	lea    0xc(%ebp),%eax
c010525b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010525e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105261:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105264:	83 ec 08             	sub    $0x8,%esp
c0105267:	ff 75 f0             	pushl  -0x10(%ebp)
c010526a:	ff 75 08             	pushl  0x8(%ebp)
c010526d:	e8 f1 fd ff ff       	call   c0105063 <execv>
c0105272:	83 c4 10             	add    $0x10,%esp
c0105275:	c9                   	leave  
c0105276:	c3                   	ret    

c0105277 <TaskMM>:
c0105277:	55                   	push   %ebp
c0105278:	89 e5                	mov    %esp,%ebp
c010527a:	83 ec 28             	sub    $0x28,%esp
c010527d:	83 ec 0c             	sub    $0xc,%esp
c0105280:	6a 7c                	push   $0x7c
c0105282:	e8 75 c4 ff ff       	call   c01016fc <sys_malloc>
c0105287:	83 c4 10             	add    $0x10,%esp
c010528a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010528d:	83 ec 0c             	sub    $0xc,%esp
c0105290:	6a 7c                	push   $0x7c
c0105292:	e8 65 c4 ff ff       	call   c01016fc <sys_malloc>
c0105297:	83 c4 10             	add    $0x10,%esp
c010529a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010529d:	83 ec 04             	sub    $0x4,%esp
c01052a0:	6a 12                	push   $0x12
c01052a2:	ff 75 f0             	pushl  -0x10(%ebp)
c01052a5:	6a 02                	push   $0x2
c01052a7:	e8 89 43 00 00       	call   c0109635 <send_rec>
c01052ac:	83 c4 10             	add    $0x10,%esp
c01052af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01052b2:	8b 40 78             	mov    0x78(%eax),%eax
c01052b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01052b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01052bb:	8b 00                	mov    (%eax),%eax
c01052bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01052c0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01052c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01052ca:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01052d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01052d4:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01052db:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01052df:	74 4e                	je     c010532f <TaskMM+0xb8>
c01052e1:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01052e5:	7f 08                	jg     c01052ef <TaskMM+0x78>
c01052e7:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c01052eb:	74 28                	je     c0105315 <TaskMM+0x9e>
c01052ed:	eb 71                	jmp    c0105360 <TaskMM+0xe9>
c01052ef:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c01052f3:	74 08                	je     c01052fd <TaskMM+0x86>
c01052f5:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01052f9:	74 4e                	je     c0105349 <TaskMM+0xd2>
c01052fb:	eb 63                	jmp    c0105360 <TaskMM+0xe9>
c01052fd:	83 ec 0c             	sub    $0xc,%esp
c0105300:	ff 75 f0             	pushl  -0x10(%ebp)
c0105303:	e8 d0 04 00 00       	call   c01057d8 <do_fork>
c0105308:	83 c4 10             	add    $0x10,%esp
c010530b:	89 c2                	mov    %eax,%edx
c010530d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105310:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105313:	eb 5c                	jmp    c0105371 <TaskMM+0xfa>
c0105315:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010531c:	66 87 db             	xchg   %bx,%bx
c010531f:	83 ec 0c             	sub    $0xc,%esp
c0105322:	ff 75 f0             	pushl  -0x10(%ebp)
c0105325:	e8 95 00 00 00       	call   c01053bf <do_exec>
c010532a:	83 c4 10             	add    $0x10,%esp
c010532d:	eb 42                	jmp    c0105371 <TaskMM+0xfa>
c010532f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105336:	83 ec 08             	sub    $0x8,%esp
c0105339:	ff 75 e0             	pushl  -0x20(%ebp)
c010533c:	ff 75 f0             	pushl  -0x10(%ebp)
c010533f:	e8 02 05 00 00       	call   c0105846 <do_exit>
c0105344:	83 c4 10             	add    $0x10,%esp
c0105347:	eb 28                	jmp    c0105371 <TaskMM+0xfa>
c0105349:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105350:	83 ec 0c             	sub    $0xc,%esp
c0105353:	ff 75 f0             	pushl  -0x10(%ebp)
c0105356:	e8 75 05 00 00       	call   c01058d0 <do_wait>
c010535b:	83 c4 10             	add    $0x10,%esp
c010535e:	eb 11                	jmp    c0105371 <TaskMM+0xfa>
c0105360:	83 ec 0c             	sub    $0xc,%esp
c0105363:	68 90 b5 10 c0       	push   $0xc010b590
c0105368:	e8 3a 36 00 00       	call   c01089a7 <panic>
c010536d:	83 c4 10             	add    $0x10,%esp
c0105370:	90                   	nop
c0105371:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105375:	0f 84 22 ff ff ff    	je     c010529d <TaskMM+0x26>
c010537b:	83 ec 0c             	sub    $0xc,%esp
c010537e:	6a 03                	push   $0x3
c0105380:	e8 af 31 00 00       	call   c0108534 <delay>
c0105385:	83 c4 10             	add    $0x10,%esp
c0105388:	83 ec 04             	sub    $0x4,%esp
c010538b:	ff 75 e4             	pushl  -0x1c(%ebp)
c010538e:	ff 75 ec             	pushl  -0x14(%ebp)
c0105391:	6a 01                	push   $0x1
c0105393:	e8 9d 42 00 00       	call   c0109635 <send_rec>
c0105398:	83 c4 10             	add    $0x10,%esp
c010539b:	e9 fd fe ff ff       	jmp    c010529d <TaskMM+0x26>

c01053a0 <alloc_mem>:
c01053a0:	55                   	push   %ebp
c01053a1:	89 e5                	mov    %esp,%ebp
c01053a3:	83 ec 10             	sub    $0x10,%esp
c01053a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01053a9:	83 e8 08             	sub    $0x8,%eax
c01053ac:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c01053b2:	05 00 00 a0 00       	add    $0xa00000,%eax
c01053b7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01053ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01053bd:	c9                   	leave  
c01053be:	c3                   	ret    

c01053bf <do_exec>:
c01053bf:	55                   	push   %ebp
c01053c0:	89 e5                	mov    %esp,%ebp
c01053c2:	81 ec 38 01 00 00    	sub    $0x138,%esp
c01053c8:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c01053cf:	65 76 5f 
c01053d2:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c01053d9:	74 79 31 
c01053dc:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c01053e3:	00 00 
c01053e5:	83 ec 08             	sub    $0x8,%esp
c01053e8:	6a 00                	push   $0x0
c01053ea:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c01053f0:	50                   	push   %eax
c01053f1:	e8 29 f8 ff ff       	call   c0104c1f <open>
c01053f6:	83 c4 10             	add    $0x10,%esp
c01053f9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01053fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01053ff:	8b 00                	mov    (%eax),%eax
c0105401:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105404:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c010540b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010540e:	83 ec 0c             	sub    $0xc,%esp
c0105411:	50                   	push   %eax
c0105412:	e8 e5 c2 ff ff       	call   c01016fc <sys_malloc>
c0105417:	83 c4 10             	add    $0x10,%esp
c010541a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010541d:	83 ec 04             	sub    $0x4,%esp
c0105420:	ff 75 d0             	pushl  -0x30(%ebp)
c0105423:	6a 00                	push   $0x0
c0105425:	ff 75 cc             	pushl  -0x34(%ebp)
c0105428:	e8 c2 6d 00 00       	call   c010c1ef <Memset>
c010542d:	83 c4 10             	add    $0x10,%esp
c0105430:	83 ec 04             	sub    $0x4,%esp
c0105433:	6a 0c                	push   $0xc
c0105435:	6a 00                	push   $0x0
c0105437:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010543d:	50                   	push   %eax
c010543e:	e8 ac 6d 00 00       	call   c010c1ef <Memset>
c0105443:	83 c4 10             	add    $0x10,%esp
c0105446:	8b 45 08             	mov    0x8(%ebp),%eax
c0105449:	8b 40 44             	mov    0x44(%eax),%eax
c010544c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010544f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105452:	8b 40 40             	mov    0x40(%eax),%eax
c0105455:	83 ec 08             	sub    $0x8,%esp
c0105458:	50                   	push   %eax
c0105459:	ff 75 c8             	pushl  -0x38(%ebp)
c010545c:	e8 de 0a 00 00       	call   c0105f3f <alloc_virtual_memory>
c0105461:	83 c4 10             	add    $0x10,%esp
c0105464:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105467:	8b 45 08             	mov    0x8(%ebp),%eax
c010546a:	8b 40 40             	mov    0x40(%eax),%eax
c010546d:	89 c2                	mov    %eax,%edx
c010546f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105472:	83 ec 04             	sub    $0x4,%esp
c0105475:	52                   	push   %edx
c0105476:	50                   	push   %eax
c0105477:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010547d:	50                   	push   %eax
c010547e:	e8 29 19 00 00       	call   c0106dac <Memcpy>
c0105483:	83 c4 10             	add    $0x10,%esp
c0105486:	8b 45 08             	mov    0x8(%ebp),%eax
c0105489:	8b 40 40             	mov    0x40(%eax),%eax
c010548c:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105493:	00 
c0105494:	83 ec 08             	sub    $0x8,%esp
c0105497:	6a 00                	push   $0x0
c0105499:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010549f:	50                   	push   %eax
c01054a0:	e8 7a f7 ff ff       	call   c0104c1f <open>
c01054a5:	83 c4 10             	add    $0x10,%esp
c01054a8:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01054ab:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c01054af:	75 15                	jne    c01054c6 <do_exec+0x107>
c01054b1:	83 ec 0c             	sub    $0xc,%esp
c01054b4:	68 a1 b5 10 c0       	push   $0xc010b5a1
c01054b9:	e8 aa 31 00 00       	call   c0108668 <Printf>
c01054be:	83 c4 10             	add    $0x10,%esp
c01054c1:	e9 10 03 00 00       	jmp    c01057d6 <do_exec+0x417>
c01054c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01054cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01054d0:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01054d3:	01 d0                	add    %edx,%eax
c01054d5:	83 ec 04             	sub    $0x4,%esp
c01054d8:	68 00 10 00 00       	push   $0x1000
c01054dd:	50                   	push   %eax
c01054de:	ff 75 c0             	pushl  -0x40(%ebp)
c01054e1:	e8 ce f7 ff ff       	call   c0104cb4 <read>
c01054e6:	83 c4 10             	add    $0x10,%esp
c01054e9:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01054ec:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01054ef:	01 45 f4             	add    %eax,-0xc(%ebp)
c01054f2:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01054f6:	74 0a                	je     c0105502 <do_exec+0x143>
c01054f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01054fb:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c01054fe:	7d 05                	jge    c0105505 <do_exec+0x146>
c0105500:	eb cb                	jmp    c01054cd <do_exec+0x10e>
c0105502:	90                   	nop
c0105503:	eb 01                	jmp    c0105506 <do_exec+0x147>
c0105505:	90                   	nop
c0105506:	83 ec 0c             	sub    $0xc,%esp
c0105509:	ff 75 c0             	pushl  -0x40(%ebp)
c010550c:	e8 a9 f9 ff ff       	call   c0104eba <close>
c0105511:	83 c4 10             	add    $0x10,%esp
c0105514:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105517:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010551a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010551d:	8b 40 18             	mov    0x18(%eax),%eax
c0105520:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105523:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010552a:	e9 04 01 00 00       	jmp    c0105633 <do_exec+0x274>
c010552f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105532:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105536:	0f b7 d0             	movzwl %ax,%edx
c0105539:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010553c:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0105540:	0f b7 c0             	movzwl %ax,%eax
c0105543:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105547:	01 c2                	add    %eax,%edx
c0105549:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010554c:	01 d0                	add    %edx,%eax
c010554e:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0105551:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105554:	8b 40 10             	mov    0x10(%eax),%eax
c0105557:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010555a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010555d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105562:	c1 e8 0c             	shr    $0xc,%eax
c0105565:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105568:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010556b:	8b 40 08             	mov    0x8(%eax),%eax
c010556e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0105571:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105578:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010557b:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010557e:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0105581:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105584:	8b 50 04             	mov    0x4(%eax),%edx
c0105587:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010558a:	01 d0                	add    %edx,%eax
c010558c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010558f:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105593:	0f 84 95 00 00 00    	je     c010562e <do_exec+0x26f>
c0105599:	83 ec 04             	sub    $0x4,%esp
c010559c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010559f:	ff 75 a8             	pushl  -0x58(%ebp)
c01055a2:	ff 75 a4             	pushl  -0x5c(%ebp)
c01055a5:	e8 a0 07 00 00       	call   c0105d4a <get_virtual_address_start_with_addr>
c01055aa:	83 c4 10             	add    $0x10,%esp
c01055ad:	89 45 98             	mov    %eax,-0x68(%ebp)
c01055b0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01055b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01055b6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01055bd:	eb 41                	jmp    c0105600 <do_exec+0x241>
c01055bf:	83 ec 08             	sub    $0x8,%esp
c01055c2:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055c5:	ff 75 e8             	pushl  -0x18(%ebp)
c01055c8:	e8 f3 0a 00 00       	call   c01060c0 <alloc_physical_memory_of_proc>
c01055cd:	83 c4 10             	add    $0x10,%esp
c01055d0:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01055d3:	83 ec 08             	sub    $0x8,%esp
c01055d6:	68 00 10 00 00       	push   $0x1000
c01055db:	ff 75 94             	pushl  -0x6c(%ebp)
c01055de:	e8 5c 09 00 00       	call   c0105f3f <alloc_virtual_memory>
c01055e3:	83 c4 10             	add    $0x10,%esp
c01055e6:	89 45 90             	mov    %eax,-0x70(%ebp)
c01055e9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01055ed:	75 06                	jne    c01055f5 <do_exec+0x236>
c01055ef:	8b 45 90             	mov    -0x70(%ebp),%eax
c01055f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01055f5:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c01055fc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0105600:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105603:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105606:	77 b7                	ja     c01055bf <do_exec+0x200>
c0105608:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010560b:	8b 40 10             	mov    0x10(%eax),%eax
c010560e:	89 c1                	mov    %eax,%ecx
c0105610:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105613:	8b 50 04             	mov    0x4(%eax),%edx
c0105616:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105619:	01 c2                	add    %eax,%edx
c010561b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010561e:	83 ec 04             	sub    $0x4,%esp
c0105621:	51                   	push   %ecx
c0105622:	52                   	push   %edx
c0105623:	50                   	push   %eax
c0105624:	e8 83 17 00 00       	call   c0106dac <Memcpy>
c0105629:	83 c4 10             	add    $0x10,%esp
c010562c:	eb 01                	jmp    c010562f <do_exec+0x270>
c010562e:	90                   	nop
c010562f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105633:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105636:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c010563a:	0f b7 c0             	movzwl %ax,%eax
c010563d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0105640:	0f 8c e9 fe ff ff    	jl     c010552f <do_exec+0x170>
c0105646:	8b 45 08             	mov    0x8(%ebp),%eax
c0105649:	8b 40 10             	mov    0x10(%eax),%eax
c010564c:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010564f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105652:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105655:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105658:	8b 45 08             	mov    0x8(%ebp),%eax
c010565b:	8b 40 24             	mov    0x24(%eax),%eax
c010565e:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0105661:	83 ec 0c             	sub    $0xc,%esp
c0105664:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105667:	e8 8a e2 ff ff       	call   c01038f6 <pid2proc>
c010566c:	83 c4 10             	add    $0x10,%esp
c010566f:	89 45 80             	mov    %eax,-0x80(%ebp)
c0105672:	8b 45 08             	mov    0x8(%ebp),%eax
c0105675:	8b 40 10             	mov    0x10(%eax),%eax
c0105678:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010567e:	83 ec 08             	sub    $0x8,%esp
c0105681:	ff 75 88             	pushl  -0x78(%ebp)
c0105684:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c010568a:	e8 b0 08 00 00       	call   c0105f3f <alloc_virtual_memory>
c010568f:	83 c4 10             	add    $0x10,%esp
c0105692:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105698:	8b 45 08             	mov    0x8(%ebp),%eax
c010569b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010569e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01056a4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01056ab:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01056b1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01056b4:	eb 1a                	jmp    c01056d0 <do_exec+0x311>
c01056b6:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01056ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01056bd:	8b 10                	mov    (%eax),%edx
c01056bf:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01056c5:	01 c2                	add    %eax,%edx
c01056c7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01056ca:	89 10                	mov    %edx,(%eax)
c01056cc:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c01056d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01056d3:	8b 00                	mov    (%eax),%eax
c01056d5:	85 c0                	test   %eax,%eax
c01056d7:	75 dd                	jne    c01056b6 <do_exec+0x2f7>
c01056d9:	83 ec 0c             	sub    $0xc,%esp
c01056dc:	ff 75 84             	pushl  -0x7c(%ebp)
c01056df:	e8 5b 08 00 00       	call   c0105f3f <alloc_virtual_memory>
c01056e4:	83 c4 10             	add    $0x10,%esp
c01056e7:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01056ed:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01056f3:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01056f9:	83 ec 04             	sub    $0x4,%esp
c01056fc:	ff 75 88             	pushl  -0x78(%ebp)
c01056ff:	52                   	push   %edx
c0105700:	50                   	push   %eax
c0105701:	e8 a6 16 00 00       	call   c0106dac <Memcpy>
c0105706:	83 c4 10             	add    $0x10,%esp
c0105709:	8b 45 08             	mov    0x8(%ebp),%eax
c010570c:	8b 40 28             	mov    0x28(%eax),%eax
c010570f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105715:	83 ec 08             	sub    $0x8,%esp
c0105718:	ff 75 d4             	pushl  -0x2c(%ebp)
c010571b:	ff 75 80             	pushl  -0x80(%ebp)
c010571e:	e8 ef 08 00 00       	call   c0106012 <get_physical_address_proc>
c0105723:	83 c4 10             	add    $0x10,%esp
c0105726:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c010572c:	83 ec 08             	sub    $0x8,%esp
c010572f:	68 00 10 00 00       	push   $0x1000
c0105734:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c010573a:	e8 00 08 00 00       	call   c0105f3f <alloc_virtual_memory>
c010573f:	83 c4 10             	add    $0x10,%esp
c0105742:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105748:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010574e:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105753:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105759:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010575f:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105765:	89 50 20             	mov    %edx,0x20(%eax)
c0105768:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010576b:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105771:	89 50 28             	mov    %edx,0x28(%eax)
c0105774:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105777:	8b 40 18             	mov    0x18(%eax),%eax
c010577a:	89 c2                	mov    %eax,%edx
c010577c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105782:	89 50 30             	mov    %edx,0x30(%eax)
c0105785:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010578b:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105791:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105794:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105797:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010579e:	00 00 00 
c01057a1:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c01057a8:	00 00 00 
c01057ab:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c01057b2:	00 00 00 
c01057b5:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c01057bc:	00 00 00 
c01057bf:	83 ec 04             	sub    $0x4,%esp
c01057c2:	ff 75 d4             	pushl  -0x2c(%ebp)
c01057c5:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c01057cb:	50                   	push   %eax
c01057cc:	6a 01                	push   $0x1
c01057ce:	e8 62 3e 00 00       	call   c0109635 <send_rec>
c01057d3:	83 c4 10             	add    $0x10,%esp
c01057d6:	c9                   	leave  
c01057d7:	c3                   	ret    

c01057d8 <do_fork>:
c01057d8:	55                   	push   %ebp
c01057d9:	89 e5                	mov    %esp,%ebp
c01057db:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01057e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01057e4:	8b 00                	mov    (%eax),%eax
c01057e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01057e9:	83 ec 0c             	sub    $0xc,%esp
c01057ec:	ff 75 f4             	pushl  -0xc(%ebp)
c01057ef:	e8 3c 47 00 00       	call   c0109f30 <fork_process>
c01057f4:	83 c4 10             	add    $0x10,%esp
c01057f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057fd:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105803:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105806:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105809:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010580f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105812:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105815:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c010581c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105823:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010582a:	83 ec 04             	sub    $0x4,%esp
c010582d:	ff 75 ec             	pushl  -0x14(%ebp)
c0105830:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105836:	50                   	push   %eax
c0105837:	6a 01                	push   $0x1
c0105839:	e8 f7 3d 00 00       	call   c0109635 <send_rec>
c010583e:	83 c4 10             	add    $0x10,%esp
c0105841:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105844:	c9                   	leave  
c0105845:	c3                   	ret    

c0105846 <do_exit>:
c0105846:	55                   	push   %ebp
c0105847:	89 e5                	mov    %esp,%ebp
c0105849:	83 ec 18             	sub    $0x18,%esp
c010584c:	8b 45 08             	mov    0x8(%ebp),%eax
c010584f:	8b 00                	mov    (%eax),%eax
c0105851:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105854:	83 ec 0c             	sub    $0xc,%esp
c0105857:	ff 75 f4             	pushl  -0xc(%ebp)
c010585a:	e8 97 e0 ff ff       	call   c01038f6 <pid2proc>
c010585f:	83 c4 10             	add    $0x10,%esp
c0105862:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105865:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105868:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010586e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105871:	83 ec 0c             	sub    $0xc,%esp
c0105874:	ff 75 ec             	pushl  -0x14(%ebp)
c0105877:	e8 7a e0 ff ff       	call   c01038f6 <pid2proc>
c010587c:	83 c4 10             	add    $0x10,%esp
c010587f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105882:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105886:	74 45                	je     c01058cd <do_exit+0x87>
c0105888:	8b 45 08             	mov    0x8(%ebp),%eax
c010588b:	8b 40 54             	mov    0x54(%eax),%eax
c010588e:	89 c2                	mov    %eax,%edx
c0105890:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105893:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105899:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010589c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01058a3:	3c 04                	cmp    $0x4,%al
c01058a5:	75 1a                	jne    c01058c1 <do_exit+0x7b>
c01058a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01058aa:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01058b1:	83 ec 0c             	sub    $0xc,%esp
c01058b4:	ff 75 f0             	pushl  -0x10(%ebp)
c01058b7:	e8 33 01 00 00       	call   c01059ef <cleanup>
c01058bc:	83 c4 10             	add    $0x10,%esp
c01058bf:	eb 0d                	jmp    c01058ce <do_exit+0x88>
c01058c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058c4:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01058cb:	eb 01                	jmp    c01058ce <do_exit+0x88>
c01058cd:	90                   	nop
c01058ce:	c9                   	leave  
c01058cf:	c3                   	ret    

c01058d0 <do_wait>:
c01058d0:	55                   	push   %ebp
c01058d1:	89 e5                	mov    %esp,%ebp
c01058d3:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c01058d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01058dc:	8b 00                	mov    (%eax),%eax
c01058de:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01058e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01058e8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01058ef:	83 ec 0c             	sub    $0xc,%esp
c01058f2:	ff 75 ec             	pushl  -0x14(%ebp)
c01058f5:	e8 fc df ff ff       	call   c01038f6 <pid2proc>
c01058fa:	83 c4 10             	add    $0x10,%esp
c01058fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105900:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105904:	75 19                	jne    c010591f <do_wait+0x4f>
c0105906:	6a 58                	push   $0x58
c0105908:	68 b1 b5 10 c0       	push   $0xc010b5b1
c010590d:	68 b1 b5 10 c0       	push   $0xc010b5b1
c0105912:	68 bf b5 10 c0       	push   $0xc010b5bf
c0105917:	e8 a9 30 00 00       	call   c01089c5 <assertion_failure>
c010591c:	83 c4 10             	add    $0x10,%esp
c010591f:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105924:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c010592a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010592d:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105930:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105935:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c010593b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010593e:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105941:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105946:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105949:	eb 5b                	jmp    c01059a6 <do_wait+0xd6>
c010594b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010594e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105953:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105956:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105959:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010595f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0105962:	74 0b                	je     c010596f <do_wait+0x9f>
c0105964:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105967:	8b 40 04             	mov    0x4(%eax),%eax
c010596a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010596d:	eb 37                	jmp    c01059a6 <do_wait+0xd6>
c010596f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105973:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105976:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c010597d:	3c 03                	cmp    $0x3,%al
c010597f:	74 0b                	je     c010598c <do_wait+0xbc>
c0105981:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105984:	8b 40 04             	mov    0x4(%eax),%eax
c0105987:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010598a:	eb 1a                	jmp    c01059a6 <do_wait+0xd6>
c010598c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010598f:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105996:	83 ec 0c             	sub    $0xc,%esp
c0105999:	ff 75 e8             	pushl  -0x18(%ebp)
c010599c:	e8 4e 00 00 00       	call   c01059ef <cleanup>
c01059a1:	83 c4 10             	add    $0x10,%esp
c01059a4:	eb 47                	jmp    c01059ed <do_wait+0x11d>
c01059a6:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c01059ad:	75 9c                	jne    c010594b <do_wait+0x7b>
c01059af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01059b3:	74 0c                	je     c01059c1 <do_wait+0xf1>
c01059b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01059b8:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c01059bf:	eb 2c                	jmp    c01059ed <do_wait+0x11d>
c01059c1:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c01059c8:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01059cf:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01059d6:	83 ec 04             	sub    $0x4,%esp
c01059d9:	ff 75 ec             	pushl  -0x14(%ebp)
c01059dc:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c01059e2:	50                   	push   %eax
c01059e3:	6a 01                	push   $0x1
c01059e5:	e8 4b 3c 00 00       	call   c0109635 <send_rec>
c01059ea:	83 c4 10             	add    $0x10,%esp
c01059ed:	c9                   	leave  
c01059ee:	c3                   	ret    

c01059ef <cleanup>:
c01059ef:	55                   	push   %ebp
c01059f0:	89 e5                	mov    %esp,%ebp
c01059f2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01059f8:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c01059ff:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105a06:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a09:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105a0f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105a12:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a15:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0105a1b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105a1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a21:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105a27:	83 ec 04             	sub    $0x4,%esp
c0105a2a:	50                   	push   %eax
c0105a2b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105a31:	50                   	push   %eax
c0105a32:	6a 01                	push   $0x1
c0105a34:	e8 fc 3b 00 00       	call   c0109635 <send_rec>
c0105a39:	83 c4 10             	add    $0x10,%esp
c0105a3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a3f:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105a46:	90                   	nop
c0105a47:	c9                   	leave  
c0105a48:	c3                   	ret    

c0105a49 <init_bitmap>:
c0105a49:	55                   	push   %ebp
c0105a4a:	89 e5                	mov    %esp,%ebp
c0105a4c:	83 ec 08             	sub    $0x8,%esp
c0105a4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a52:	8b 50 04             	mov    0x4(%eax),%edx
c0105a55:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a58:	8b 00                	mov    (%eax),%eax
c0105a5a:	83 ec 04             	sub    $0x4,%esp
c0105a5d:	52                   	push   %edx
c0105a5e:	6a 00                	push   $0x0
c0105a60:	50                   	push   %eax
c0105a61:	e8 89 67 00 00       	call   c010c1ef <Memset>
c0105a66:	83 c4 10             	add    $0x10,%esp
c0105a69:	90                   	nop
c0105a6a:	c9                   	leave  
c0105a6b:	c3                   	ret    

c0105a6c <test_bit_val>:
c0105a6c:	55                   	push   %ebp
c0105a6d:	89 e5                	mov    %esp,%ebp
c0105a6f:	53                   	push   %ebx
c0105a70:	83 ec 10             	sub    $0x10,%esp
c0105a73:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a76:	8d 50 07             	lea    0x7(%eax),%edx
c0105a79:	85 c0                	test   %eax,%eax
c0105a7b:	0f 48 c2             	cmovs  %edx,%eax
c0105a7e:	c1 f8 03             	sar    $0x3,%eax
c0105a81:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a84:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a87:	99                   	cltd   
c0105a88:	c1 ea 1d             	shr    $0x1d,%edx
c0105a8b:	01 d0                	add    %edx,%eax
c0105a8d:	83 e0 07             	and    $0x7,%eax
c0105a90:	29 d0                	sub    %edx,%eax
c0105a92:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a95:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a98:	8b 10                	mov    (%eax),%edx
c0105a9a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a9d:	01 d0                	add    %edx,%eax
c0105a9f:	0f b6 00             	movzbl (%eax),%eax
c0105aa2:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105aa5:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105aac:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105ab1:	89 c1                	mov    %eax,%ecx
c0105ab3:	d3 e3                	shl    %cl,%ebx
c0105ab5:	89 d8                	mov    %ebx,%eax
c0105ab7:	21 c2                	and    %eax,%edx
c0105ab9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105abc:	89 c1                	mov    %eax,%ecx
c0105abe:	d3 fa                	sar    %cl,%edx
c0105ac0:	89 d0                	mov    %edx,%eax
c0105ac2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ac5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105ac9:	0f 9f c0             	setg   %al
c0105acc:	0f b6 c0             	movzbl %al,%eax
c0105acf:	83 c4 10             	add    $0x10,%esp
c0105ad2:	5b                   	pop    %ebx
c0105ad3:	5d                   	pop    %ebp
c0105ad4:	c3                   	ret    

c0105ad5 <set_bit_val>:
c0105ad5:	55                   	push   %ebp
c0105ad6:	89 e5                	mov    %esp,%ebp
c0105ad8:	83 ec 10             	sub    $0x10,%esp
c0105adb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ade:	8d 50 07             	lea    0x7(%eax),%edx
c0105ae1:	85 c0                	test   %eax,%eax
c0105ae3:	0f 48 c2             	cmovs  %edx,%eax
c0105ae6:	c1 f8 03             	sar    $0x3,%eax
c0105ae9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105aec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105aef:	99                   	cltd   
c0105af0:	c1 ea 1d             	shr    $0x1d,%edx
c0105af3:	01 d0                	add    %edx,%eax
c0105af5:	83 e0 07             	and    $0x7,%eax
c0105af8:	29 d0                	sub    %edx,%eax
c0105afa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105afd:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b00:	8b 10                	mov    (%eax),%edx
c0105b02:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105b05:	01 d0                	add    %edx,%eax
c0105b07:	0f b6 00             	movzbl (%eax),%eax
c0105b0a:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105b0d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105b11:	7e 13                	jle    c0105b26 <set_bit_val+0x51>
c0105b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b16:	ba 01 00 00 00       	mov    $0x1,%edx
c0105b1b:	89 c1                	mov    %eax,%ecx
c0105b1d:	d3 e2                	shl    %cl,%edx
c0105b1f:	89 d0                	mov    %edx,%eax
c0105b21:	08 45 ff             	or     %al,-0x1(%ebp)
c0105b24:	eb 13                	jmp    c0105b39 <set_bit_val+0x64>
c0105b26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b29:	ba 01 00 00 00       	mov    $0x1,%edx
c0105b2e:	89 c1                	mov    %eax,%ecx
c0105b30:	d3 e2                	shl    %cl,%edx
c0105b32:	89 d0                	mov    %edx,%eax
c0105b34:	f7 d0                	not    %eax
c0105b36:	20 45 ff             	and    %al,-0x1(%ebp)
c0105b39:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b3c:	8b 10                	mov    (%eax),%edx
c0105b3e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105b41:	01 c2                	add    %eax,%edx
c0105b43:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105b47:	88 02                	mov    %al,(%edx)
c0105b49:	b8 01 00 00 00       	mov    $0x1,%eax
c0105b4e:	c9                   	leave  
c0105b4f:	c3                   	ret    

c0105b50 <set_bits>:
c0105b50:	55                   	push   %ebp
c0105b51:	89 e5                	mov    %esp,%ebp
c0105b53:	83 ec 10             	sub    $0x10,%esp
c0105b56:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105b5d:	eb 1c                	jmp    c0105b7b <set_bits+0x2b>
c0105b5f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b62:	8d 50 01             	lea    0x1(%eax),%edx
c0105b65:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105b68:	ff 75 10             	pushl  0x10(%ebp)
c0105b6b:	50                   	push   %eax
c0105b6c:	ff 75 08             	pushl  0x8(%ebp)
c0105b6f:	e8 61 ff ff ff       	call   c0105ad5 <set_bit_val>
c0105b74:	83 c4 0c             	add    $0xc,%esp
c0105b77:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105b7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b7e:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105b81:	7c dc                	jl     c0105b5f <set_bits+0xf>
c0105b83:	b8 01 00 00 00       	mov    $0x1,%eax
c0105b88:	c9                   	leave  
c0105b89:	c3                   	ret    

c0105b8a <get_first_free_bit>:
c0105b8a:	55                   	push   %ebp
c0105b8b:	89 e5                	mov    %esp,%ebp
c0105b8d:	83 ec 10             	sub    $0x10,%esp
c0105b90:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b93:	8b 40 04             	mov    0x4(%eax),%eax
c0105b96:	c1 e0 03             	shl    $0x3,%eax
c0105b99:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b9c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b9f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105ba2:	eb 1b                	jmp    c0105bbf <get_first_free_bit+0x35>
c0105ba4:	ff 75 fc             	pushl  -0x4(%ebp)
c0105ba7:	ff 75 08             	pushl  0x8(%ebp)
c0105baa:	e8 bd fe ff ff       	call   c0105a6c <test_bit_val>
c0105baf:	83 c4 08             	add    $0x8,%esp
c0105bb2:	85 c0                	test   %eax,%eax
c0105bb4:	75 05                	jne    c0105bbb <get_first_free_bit+0x31>
c0105bb6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105bb9:	eb 11                	jmp    c0105bcc <get_first_free_bit+0x42>
c0105bbb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105bbf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105bc2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105bc5:	7c dd                	jl     c0105ba4 <get_first_free_bit+0x1a>
c0105bc7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105bcc:	c9                   	leave  
c0105bcd:	c3                   	ret    

c0105bce <get_bits>:
c0105bce:	55                   	push   %ebp
c0105bcf:	89 e5                	mov    %esp,%ebp
c0105bd1:	83 ec 20             	sub    $0x20,%esp
c0105bd4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105bdb:	ff 75 f0             	pushl  -0x10(%ebp)
c0105bde:	ff 75 08             	pushl  0x8(%ebp)
c0105be1:	e8 a4 ff ff ff       	call   c0105b8a <get_first_free_bit>
c0105be6:	83 c4 08             	add    $0x8,%esp
c0105be9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105bec:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bef:	8b 40 04             	mov    0x4(%eax),%eax
c0105bf2:	c1 e0 03             	shl    $0x3,%eax
c0105bf5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105bf8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105bfb:	83 e8 01             	sub    $0x1,%eax
c0105bfe:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105c01:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105c05:	75 08                	jne    c0105c0f <get_bits+0x41>
c0105c07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c0a:	e9 85 00 00 00       	jmp    c0105c94 <get_bits+0xc6>
c0105c0f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c12:	83 c0 01             	add    $0x1,%eax
c0105c15:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c18:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c1e:	eb 58                	jmp    c0105c78 <get_bits+0xaa>
c0105c20:	ff 75 f8             	pushl  -0x8(%ebp)
c0105c23:	ff 75 08             	pushl  0x8(%ebp)
c0105c26:	e8 41 fe ff ff       	call   c0105a6c <test_bit_val>
c0105c2b:	83 c4 08             	add    $0x8,%esp
c0105c2e:	85 c0                	test   %eax,%eax
c0105c30:	75 0a                	jne    c0105c3c <get_bits+0x6e>
c0105c32:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105c36:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105c3a:	eb 2b                	jmp    c0105c67 <get_bits+0x99>
c0105c3c:	6a 00                	push   $0x0
c0105c3e:	ff 75 08             	pushl  0x8(%ebp)
c0105c41:	e8 44 ff ff ff       	call   c0105b8a <get_first_free_bit>
c0105c46:	83 c4 08             	add    $0x8,%esp
c0105c49:	83 c0 01             	add    $0x1,%eax
c0105c4c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c52:	83 c0 01             	add    $0x1,%eax
c0105c55:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c58:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c5e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c61:	83 e8 01             	sub    $0x1,%eax
c0105c64:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105c67:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c6a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105c6d:	7c 09                	jl     c0105c78 <get_bits+0xaa>
c0105c6f:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105c76:	eb 0d                	jmp    c0105c85 <get_bits+0xb7>
c0105c78:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105c7b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105c7e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105c81:	85 c0                	test   %eax,%eax
c0105c83:	7f 9b                	jg     c0105c20 <get_bits+0x52>
c0105c85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c88:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105c8b:	83 c0 01             	add    $0x1,%eax
c0105c8e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105c91:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105c94:	c9                   	leave  
c0105c95:	c3                   	ret    

c0105c96 <get_a_page>:
c0105c96:	55                   	push   %ebp
c0105c97:	89 e5                	mov    %esp,%ebp
c0105c99:	83 ec 28             	sub    $0x28,%esp
c0105c9c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105ca0:	75 22                	jne    c0105cc4 <get_a_page+0x2e>
c0105ca2:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105ca7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105caa:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105caf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105cb2:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105cb7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105cba:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105cbf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105cc2:	eb 20                	jmp    c0105ce4 <get_a_page+0x4e>
c0105cc4:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105cc9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ccc:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105cd1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105cd4:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105cd9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105cdc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105ce1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ce4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105ce7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105cea:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105ced:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105cf0:	6a 01                	push   $0x1
c0105cf2:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105cf5:	50                   	push   %eax
c0105cf6:	e8 d3 fe ff ff       	call   c0105bce <get_bits>
c0105cfb:	83 c4 08             	add    $0x8,%esp
c0105cfe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d01:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105d05:	75 1c                	jne    c0105d23 <get_a_page+0x8d>
c0105d07:	68 84 00 00 00       	push   $0x84
c0105d0c:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0105d11:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0105d16:	68 dc b5 10 c0       	push   $0xc010b5dc
c0105d1b:	e8 a5 2c 00 00       	call   c01089c5 <assertion_failure>
c0105d20:	83 c4 10             	add    $0x10,%esp
c0105d23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d26:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105d29:	c1 e2 0c             	shl    $0xc,%edx
c0105d2c:	01 d0                	add    %edx,%eax
c0105d2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d31:	83 ec 04             	sub    $0x4,%esp
c0105d34:	6a 01                	push   $0x1
c0105d36:	ff 75 f4             	pushl  -0xc(%ebp)
c0105d39:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105d3c:	50                   	push   %eax
c0105d3d:	e8 93 fd ff ff       	call   c0105ad5 <set_bit_val>
c0105d42:	83 c4 10             	add    $0x10,%esp
c0105d45:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d48:	c9                   	leave  
c0105d49:	c3                   	ret    

c0105d4a <get_virtual_address_start_with_addr>:
c0105d4a:	55                   	push   %ebp
c0105d4b:	89 e5                	mov    %esp,%ebp
c0105d4d:	83 ec 38             	sub    $0x38,%esp
c0105d50:	e8 99 a6 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105d55:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d58:	83 ec 0c             	sub    $0xc,%esp
c0105d5b:	ff 75 10             	pushl  0x10(%ebp)
c0105d5e:	e8 93 db ff ff       	call   c01038f6 <pid2proc>
c0105d63:	83 c4 10             	add    $0x10,%esp
c0105d66:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d69:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d6c:	8b 40 0c             	mov    0xc(%eax),%eax
c0105d6f:	83 ec 04             	sub    $0x4,%esp
c0105d72:	6a 0c                	push   $0xc
c0105d74:	50                   	push   %eax
c0105d75:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105d78:	50                   	push   %eax
c0105d79:	e8 2e 10 00 00       	call   c0106dac <Memcpy>
c0105d7e:	83 c4 10             	add    $0x10,%esp
c0105d81:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105d84:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105d87:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105d8a:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105d8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105d90:	8b 55 08             	mov    0x8(%ebp),%edx
c0105d93:	29 c2                	sub    %eax,%edx
c0105d95:	89 d0                	mov    %edx,%eax
c0105d97:	c1 e8 0c             	shr    $0xc,%eax
c0105d9a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d9d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105da1:	79 1c                	jns    c0105dbf <get_virtual_address_start_with_addr+0x75>
c0105da3:	68 97 00 00 00       	push   $0x97
c0105da8:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0105dad:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0105db2:	68 e8 b5 10 c0       	push   $0xc010b5e8
c0105db7:	e8 09 2c 00 00       	call   c01089c5 <assertion_failure>
c0105dbc:	83 c4 10             	add    $0x10,%esp
c0105dbf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105dc2:	50                   	push   %eax
c0105dc3:	6a 01                	push   $0x1
c0105dc5:	ff 75 ec             	pushl  -0x14(%ebp)
c0105dc8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105dcb:	50                   	push   %eax
c0105dcc:	e8 7f fd ff ff       	call   c0105b50 <set_bits>
c0105dd1:	83 c4 10             	add    $0x10,%esp
c0105dd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dd7:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105ddc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ddf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105de2:	c9                   	leave  
c0105de3:	c3                   	ret    

c0105de4 <get_virtual_address>:
c0105de4:	55                   	push   %ebp
c0105de5:	89 e5                	mov    %esp,%ebp
c0105de7:	83 ec 28             	sub    $0x28,%esp
c0105dea:	e8 ff a5 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105def:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105df2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105df6:	75 1a                	jne    c0105e12 <get_virtual_address+0x2e>
c0105df8:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105dfd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e00:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105e05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e08:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105e0d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e10:	eb 18                	jmp    c0105e2a <get_virtual_address+0x46>
c0105e12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e15:	8b 40 0c             	mov    0xc(%eax),%eax
c0105e18:	83 ec 04             	sub    $0x4,%esp
c0105e1b:	6a 0c                	push   $0xc
c0105e1d:	50                   	push   %eax
c0105e1e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105e21:	50                   	push   %eax
c0105e22:	e8 85 0f 00 00       	call   c0106dac <Memcpy>
c0105e27:	83 c4 10             	add    $0x10,%esp
c0105e2a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105e2d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e30:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105e33:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105e36:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e39:	83 ec 08             	sub    $0x8,%esp
c0105e3c:	50                   	push   %eax
c0105e3d:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105e40:	50                   	push   %eax
c0105e41:	e8 88 fd ff ff       	call   c0105bce <get_bits>
c0105e46:	83 c4 10             	add    $0x10,%esp
c0105e49:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e4c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105e4f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105e52:	c1 e2 0c             	shl    $0xc,%edx
c0105e55:	01 d0                	add    %edx,%eax
c0105e57:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e5d:	50                   	push   %eax
c0105e5e:	6a 01                	push   $0x1
c0105e60:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e63:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105e66:	50                   	push   %eax
c0105e67:	e8 e4 fc ff ff       	call   c0105b50 <set_bits>
c0105e6c:	83 c4 10             	add    $0x10,%esp
c0105e6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e72:	c9                   	leave  
c0105e73:	c3                   	ret    

c0105e74 <ptr_pde>:
c0105e74:	55                   	push   %ebp
c0105e75:	89 e5                	mov    %esp,%ebp
c0105e77:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e7a:	c1 e8 16             	shr    $0x16,%eax
c0105e7d:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105e82:	c1 e0 02             	shl    $0x2,%eax
c0105e85:	5d                   	pop    %ebp
c0105e86:	c3                   	ret    

c0105e87 <ptr_pte>:
c0105e87:	55                   	push   %ebp
c0105e88:	89 e5                	mov    %esp,%ebp
c0105e8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e8d:	c1 e8 0a             	shr    $0xa,%eax
c0105e90:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105e95:	89 c2                	mov    %eax,%edx
c0105e97:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e9a:	c1 e8 0c             	shr    $0xc,%eax
c0105e9d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105ea2:	c1 e0 02             	shl    $0x2,%eax
c0105ea5:	01 d0                	add    %edx,%eax
c0105ea7:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105eac:	5d                   	pop    %ebp
c0105ead:	c3                   	ret    

c0105eae <add_map_entry>:
c0105eae:	55                   	push   %ebp
c0105eaf:	89 e5                	mov    %esp,%ebp
c0105eb1:	83 ec 18             	sub    $0x18,%esp
c0105eb4:	ff 75 08             	pushl  0x8(%ebp)
c0105eb7:	e8 b8 ff ff ff       	call   c0105e74 <ptr_pde>
c0105ebc:	83 c4 04             	add    $0x4,%esp
c0105ebf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ec2:	ff 75 08             	pushl  0x8(%ebp)
c0105ec5:	e8 bd ff ff ff       	call   c0105e87 <ptr_pte>
c0105eca:	83 c4 04             	add    $0x4,%esp
c0105ecd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ed0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105ed3:	8b 00                	mov    (%eax),%eax
c0105ed5:	83 e0 01             	and    $0x1,%eax
c0105ed8:	85 c0                	test   %eax,%eax
c0105eda:	74 1b                	je     c0105ef7 <add_map_entry+0x49>
c0105edc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105edf:	8b 00                	mov    (%eax),%eax
c0105ee1:	83 e0 01             	and    $0x1,%eax
c0105ee4:	85 c0                	test   %eax,%eax
c0105ee6:	75 54                	jne    c0105f3c <add_map_entry+0x8e>
c0105ee8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105eeb:	83 c8 07             	or     $0x7,%eax
c0105eee:	89 c2                	mov    %eax,%edx
c0105ef0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ef3:	89 10                	mov    %edx,(%eax)
c0105ef5:	eb 45                	jmp    c0105f3c <add_map_entry+0x8e>
c0105ef7:	83 ec 0c             	sub    $0xc,%esp
c0105efa:	6a 00                	push   $0x0
c0105efc:	e8 95 fd ff ff       	call   c0105c96 <get_a_page>
c0105f01:	83 c4 10             	add    $0x10,%esp
c0105f04:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f0a:	83 c8 07             	or     $0x7,%eax
c0105f0d:	89 c2                	mov    %eax,%edx
c0105f0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105f12:	89 10                	mov    %edx,(%eax)
c0105f14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f17:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f1c:	83 ec 04             	sub    $0x4,%esp
c0105f1f:	68 00 10 00 00       	push   $0x1000
c0105f24:	6a 00                	push   $0x0
c0105f26:	50                   	push   %eax
c0105f27:	e8 c3 62 00 00       	call   c010c1ef <Memset>
c0105f2c:	83 c4 10             	add    $0x10,%esp
c0105f2f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f32:	83 c8 07             	or     $0x7,%eax
c0105f35:	89 c2                	mov    %eax,%edx
c0105f37:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f3a:	89 10                	mov    %edx,(%eax)
c0105f3c:	90                   	nop
c0105f3d:	c9                   	leave  
c0105f3e:	c3                   	ret    

c0105f3f <alloc_virtual_memory>:
c0105f3f:	55                   	push   %ebp
c0105f40:	89 e5                	mov    %esp,%ebp
c0105f42:	83 ec 28             	sub    $0x28,%esp
c0105f45:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f48:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f50:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f53:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105f56:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f59:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f5c:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105f5f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f62:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105f67:	c1 e8 0c             	shr    $0xc,%eax
c0105f6a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f6d:	e8 7c a4 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105f72:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105f75:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f78:	8b 50 08             	mov    0x8(%eax),%edx
c0105f7b:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105f80:	39 c2                	cmp    %eax,%edx
c0105f82:	75 09                	jne    c0105f8d <alloc_virtual_memory+0x4e>
c0105f84:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105f8b:	eb 07                	jmp    c0105f94 <alloc_virtual_memory+0x55>
c0105f8d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105f94:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105f9b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105fa2:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105fa9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105fb0:	eb 47                	jmp    c0105ff9 <alloc_virtual_memory+0xba>
c0105fb2:	83 ec 08             	sub    $0x8,%esp
c0105fb5:	ff 75 f0             	pushl  -0x10(%ebp)
c0105fb8:	6a 01                	push   $0x1
c0105fba:	e8 25 fe ff ff       	call   c0105de4 <get_virtual_address>
c0105fbf:	83 c4 10             	add    $0x10,%esp
c0105fc2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105fc5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105fc9:	74 13                	je     c0105fde <alloc_virtual_memory+0x9f>
c0105fcb:	83 ec 0c             	sub    $0xc,%esp
c0105fce:	ff 75 f0             	pushl  -0x10(%ebp)
c0105fd1:	e8 c0 fc ff ff       	call   c0105c96 <get_a_page>
c0105fd6:	83 c4 10             	add    $0x10,%esp
c0105fd9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fdc:	eb 06                	jmp    c0105fe4 <alloc_virtual_memory+0xa5>
c0105fde:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105fe1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fe4:	83 ec 08             	sub    $0x8,%esp
c0105fe7:	ff 75 f4             	pushl  -0xc(%ebp)
c0105fea:	ff 75 d8             	pushl  -0x28(%ebp)
c0105fed:	e8 bc fe ff ff       	call   c0105eae <add_map_entry>
c0105ff2:	83 c4 10             	add    $0x10,%esp
c0105ff5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105ff9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105ffc:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105fff:	72 b1                	jb     c0105fb2 <alloc_virtual_memory+0x73>
c0106001:	8b 45 08             	mov    0x8(%ebp),%eax
c0106004:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106009:	89 c2                	mov    %eax,%edx
c010600b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010600e:	01 d0                	add    %edx,%eax
c0106010:	c9                   	leave  
c0106011:	c3                   	ret    

c0106012 <get_physical_address_proc>:
c0106012:	55                   	push   %ebp
c0106013:	89 e5                	mov    %esp,%ebp
c0106015:	83 ec 18             	sub    $0x18,%esp
c0106018:	e8 f5 a2 ff ff       	call   c0100312 <disable_int>
c010601d:	e8 cc a3 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106022:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106025:	83 ec 0c             	sub    $0xc,%esp
c0106028:	ff 75 0c             	pushl  0xc(%ebp)
c010602b:	e8 c6 d8 ff ff       	call   c01038f6 <pid2proc>
c0106030:	83 c4 10             	add    $0x10,%esp
c0106033:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106036:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106039:	8b 40 08             	mov    0x8(%eax),%eax
c010603c:	83 ec 0c             	sub    $0xc,%esp
c010603f:	50                   	push   %eax
c0106040:	e8 8d a3 ff ff       	call   c01003d2 <update_cr3>
c0106045:	83 c4 10             	add    $0x10,%esp
c0106048:	83 ec 0c             	sub    $0xc,%esp
c010604b:	ff 75 08             	pushl  0x8(%ebp)
c010604e:	e8 34 fe ff ff       	call   c0105e87 <ptr_pte>
c0106053:	83 c4 10             	add    $0x10,%esp
c0106056:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106059:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010605c:	8b 00                	mov    (%eax),%eax
c010605e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106063:	89 c2                	mov    %eax,%edx
c0106065:	8b 45 08             	mov    0x8(%ebp),%eax
c0106068:	25 ff 0f 00 00       	and    $0xfff,%eax
c010606d:	09 d0                	or     %edx,%eax
c010606f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106072:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106075:	8b 40 08             	mov    0x8(%eax),%eax
c0106078:	83 ec 0c             	sub    $0xc,%esp
c010607b:	50                   	push   %eax
c010607c:	e8 51 a3 ff ff       	call   c01003d2 <update_cr3>
c0106081:	83 c4 10             	add    $0x10,%esp
c0106084:	e8 8b a2 ff ff       	call   c0100314 <enable_int>
c0106089:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010608c:	c9                   	leave  
c010608d:	c3                   	ret    

c010608e <get_physical_address>:
c010608e:	55                   	push   %ebp
c010608f:	89 e5                	mov    %esp,%ebp
c0106091:	83 ec 10             	sub    $0x10,%esp
c0106094:	ff 75 08             	pushl  0x8(%ebp)
c0106097:	e8 eb fd ff ff       	call   c0105e87 <ptr_pte>
c010609c:	83 c4 04             	add    $0x4,%esp
c010609f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01060a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01060a5:	8b 00                	mov    (%eax),%eax
c01060a7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060ac:	89 c2                	mov    %eax,%edx
c01060ae:	8b 45 08             	mov    0x8(%ebp),%eax
c01060b1:	25 ff 0f 00 00       	and    $0xfff,%eax
c01060b6:	09 d0                	or     %edx,%eax
c01060b8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01060bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01060be:	c9                   	leave  
c01060bf:	c3                   	ret    

c01060c0 <alloc_physical_memory_of_proc>:
c01060c0:	55                   	push   %ebp
c01060c1:	89 e5                	mov    %esp,%ebp
c01060c3:	83 ec 48             	sub    $0x48,%esp
c01060c6:	e8 47 a2 ff ff       	call   c0100312 <disable_int>
c01060cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01060ce:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060d6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01060dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01060e0:	83 ec 0c             	sub    $0xc,%esp
c01060e3:	50                   	push   %eax
c01060e4:	e8 0d d8 ff ff       	call   c01038f6 <pid2proc>
c01060e9:	83 c4 10             	add    $0x10,%esp
c01060ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01060ef:	e8 fa a2 ff ff       	call   c01003ee <get_running_thread_pcb>
c01060f4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01060f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060fa:	8b 40 0c             	mov    0xc(%eax),%eax
c01060fd:	83 ec 04             	sub    $0x4,%esp
c0106100:	6a 0c                	push   $0xc
c0106102:	50                   	push   %eax
c0106103:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106106:	50                   	push   %eax
c0106107:	e8 a0 0c 00 00       	call   c0106dac <Memcpy>
c010610c:	83 c4 10             	add    $0x10,%esp
c010610f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106112:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0106115:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106118:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010611b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010611e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106121:	29 c2                	sub    %eax,%edx
c0106123:	89 d0                	mov    %edx,%eax
c0106125:	c1 e8 0c             	shr    $0xc,%eax
c0106128:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010612b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010612e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106131:	c1 e2 0c             	shl    $0xc,%edx
c0106134:	01 d0                	add    %edx,%eax
c0106136:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106139:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010613c:	6a 01                	push   $0x1
c010613e:	6a 01                	push   $0x1
c0106140:	50                   	push   %eax
c0106141:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0106144:	50                   	push   %eax
c0106145:	e8 06 fa ff ff       	call   c0105b50 <set_bits>
c010614a:	83 c4 10             	add    $0x10,%esp
c010614d:	83 ec 0c             	sub    $0xc,%esp
c0106150:	ff 75 f0             	pushl  -0x10(%ebp)
c0106153:	e8 3e fb ff ff       	call   c0105c96 <get_a_page>
c0106158:	83 c4 10             	add    $0x10,%esp
c010615b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010615e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106161:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106166:	89 c2                	mov    %eax,%edx
c0106168:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010616b:	01 d0                	add    %edx,%eax
c010616d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106170:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106173:	8b 40 08             	mov    0x8(%eax),%eax
c0106176:	83 ec 0c             	sub    $0xc,%esp
c0106179:	50                   	push   %eax
c010617a:	e8 53 a2 ff ff       	call   c01003d2 <update_cr3>
c010617f:	83 c4 10             	add    $0x10,%esp
c0106182:	83 ec 08             	sub    $0x8,%esp
c0106185:	ff 75 dc             	pushl  -0x24(%ebp)
c0106188:	ff 75 f4             	pushl  -0xc(%ebp)
c010618b:	e8 1e fd ff ff       	call   c0105eae <add_map_entry>
c0106190:	83 c4 10             	add    $0x10,%esp
c0106193:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106196:	8b 40 08             	mov    0x8(%eax),%eax
c0106199:	83 ec 0c             	sub    $0xc,%esp
c010619c:	50                   	push   %eax
c010619d:	e8 30 a2 ff ff       	call   c01003d2 <update_cr3>
c01061a2:	83 c4 10             	add    $0x10,%esp
c01061a5:	e8 6a a1 ff ff       	call   c0100314 <enable_int>
c01061aa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01061ad:	c9                   	leave  
c01061ae:	c3                   	ret    

c01061af <alloc_physical_memory>:
c01061af:	55                   	push   %ebp
c01061b0:	89 e5                	mov    %esp,%ebp
c01061b2:	83 ec 38             	sub    $0x38,%esp
c01061b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01061b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01061bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061c0:	e8 29 a2 ff ff       	call   c01003ee <get_running_thread_pcb>
c01061c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01061c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01061cc:	75 1a                	jne    c01061e8 <alloc_physical_memory+0x39>
c01061ce:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01061d3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01061d6:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01061db:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01061de:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01061e3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01061e6:	eb 18                	jmp    c0106200 <alloc_physical_memory+0x51>
c01061e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01061eb:	8b 40 0c             	mov    0xc(%eax),%eax
c01061ee:	83 ec 04             	sub    $0x4,%esp
c01061f1:	6a 0c                	push   $0xc
c01061f3:	50                   	push   %eax
c01061f4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c01061f7:	50                   	push   %eax
c01061f8:	e8 af 0b 00 00       	call   c0106dac <Memcpy>
c01061fd:	83 c4 10             	add    $0x10,%esp
c0106200:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106203:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106206:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106209:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010620c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010620f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106212:	29 c2                	sub    %eax,%edx
c0106214:	89 d0                	mov    %edx,%eax
c0106216:	c1 e8 0c             	shr    $0xc,%eax
c0106219:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010621c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010621f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106222:	c1 e2 0c             	shl    $0xc,%edx
c0106225:	01 d0                	add    %edx,%eax
c0106227:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010622a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010622d:	6a 01                	push   $0x1
c010622f:	6a 01                	push   $0x1
c0106231:	50                   	push   %eax
c0106232:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106235:	50                   	push   %eax
c0106236:	e8 15 f9 ff ff       	call   c0105b50 <set_bits>
c010623b:	83 c4 10             	add    $0x10,%esp
c010623e:	83 ec 0c             	sub    $0xc,%esp
c0106241:	ff 75 0c             	pushl  0xc(%ebp)
c0106244:	e8 4d fa ff ff       	call   c0105c96 <get_a_page>
c0106249:	83 c4 10             	add    $0x10,%esp
c010624c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010624f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106252:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106257:	89 c2                	mov    %eax,%edx
c0106259:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010625c:	01 d0                	add    %edx,%eax
c010625e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106261:	83 ec 08             	sub    $0x8,%esp
c0106264:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106267:	ff 75 f4             	pushl  -0xc(%ebp)
c010626a:	e8 3f fc ff ff       	call   c0105eae <add_map_entry>
c010626f:	83 c4 10             	add    $0x10,%esp
c0106272:	8b 45 08             	mov    0x8(%ebp),%eax
c0106275:	c9                   	leave  
c0106276:	c3                   	ret    

c0106277 <alloc_memory>:
c0106277:	55                   	push   %ebp
c0106278:	89 e5                	mov    %esp,%ebp
c010627a:	83 ec 18             	sub    $0x18,%esp
c010627d:	83 ec 08             	sub    $0x8,%esp
c0106280:	ff 75 0c             	pushl  0xc(%ebp)
c0106283:	ff 75 08             	pushl  0x8(%ebp)
c0106286:	e8 59 fb ff ff       	call   c0105de4 <get_virtual_address>
c010628b:	83 c4 10             	add    $0x10,%esp
c010628e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106291:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106294:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106299:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010629c:	eb 29                	jmp    c01062c7 <alloc_memory+0x50>
c010629e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01062a5:	83 ec 0c             	sub    $0xc,%esp
c01062a8:	ff 75 0c             	pushl  0xc(%ebp)
c01062ab:	e8 e6 f9 ff ff       	call   c0105c96 <get_a_page>
c01062b0:	83 c4 10             	add    $0x10,%esp
c01062b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01062b6:	83 ec 08             	sub    $0x8,%esp
c01062b9:	ff 75 ec             	pushl  -0x14(%ebp)
c01062bc:	ff 75 f4             	pushl  -0xc(%ebp)
c01062bf:	e8 ea fb ff ff       	call   c0105eae <add_map_entry>
c01062c4:	83 c4 10             	add    $0x10,%esp
c01062c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01062ca:	8d 50 ff             	lea    -0x1(%eax),%edx
c01062cd:	89 55 08             	mov    %edx,0x8(%ebp)
c01062d0:	85 c0                	test   %eax,%eax
c01062d2:	75 ca                	jne    c010629e <alloc_memory+0x27>
c01062d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01062d7:	c9                   	leave  
c01062d8:	c3                   	ret    

c01062d9 <get_a_virtual_page>:
c01062d9:	55                   	push   %ebp
c01062da:	89 e5                	mov    %esp,%ebp
c01062dc:	83 ec 18             	sub    $0x18,%esp
c01062df:	83 ec 0c             	sub    $0xc,%esp
c01062e2:	ff 75 08             	pushl  0x8(%ebp)
c01062e5:	e8 ac f9 ff ff       	call   c0105c96 <get_a_page>
c01062ea:	83 c4 10             	add    $0x10,%esp
c01062ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01062f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01062f3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01062f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01062fb:	83 ec 08             	sub    $0x8,%esp
c01062fe:	ff 75 f4             	pushl  -0xc(%ebp)
c0106301:	ff 75 f0             	pushl  -0x10(%ebp)
c0106304:	e8 a5 fb ff ff       	call   c0105eae <add_map_entry>
c0106309:	83 c4 10             	add    $0x10,%esp
c010630c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010630f:	c9                   	leave  
c0106310:	c3                   	ret    

c0106311 <block2arena>:
c0106311:	55                   	push   %ebp
c0106312:	89 e5                	mov    %esp,%ebp
c0106314:	83 ec 10             	sub    $0x10,%esp
c0106317:	8b 45 08             	mov    0x8(%ebp),%eax
c010631a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010631f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106322:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106325:	c9                   	leave  
c0106326:	c3                   	ret    

c0106327 <sys_malloc2>:
c0106327:	55                   	push   %ebp
c0106328:	89 e5                	mov    %esp,%ebp
c010632a:	83 ec 68             	sub    $0x68,%esp
c010632d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106334:	e8 b5 a0 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106339:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010633c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010633f:	8b 50 08             	mov    0x8(%eax),%edx
c0106342:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106347:	39 c2                	cmp    %eax,%edx
c0106349:	75 10                	jne    c010635b <sys_malloc2+0x34>
c010634b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106352:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106359:	eb 10                	jmp    c010636b <sys_malloc2+0x44>
c010635b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106362:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106365:	83 c0 10             	add    $0x10,%eax
c0106368:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010636b:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0106372:	76 52                	jbe    c01063c6 <sys_malloc2+0x9f>
c0106374:	8b 45 08             	mov    0x8(%ebp),%eax
c0106377:	05 0b 10 00 00       	add    $0x100b,%eax
c010637c:	c1 e8 0c             	shr    $0xc,%eax
c010637f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106382:	83 ec 08             	sub    $0x8,%esp
c0106385:	ff 75 f0             	pushl  -0x10(%ebp)
c0106388:	ff 75 d8             	pushl  -0x28(%ebp)
c010638b:	e8 e7 fe ff ff       	call   c0106277 <alloc_memory>
c0106390:	83 c4 10             	add    $0x10,%esp
c0106393:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106396:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106399:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010639c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010639f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01063a5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01063a8:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01063af:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01063b2:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c01063b6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01063b9:	05 90 00 00 00       	add    $0x90,%eax
c01063be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01063c1:	e9 f0 01 00 00       	jmp    c01065b6 <sys_malloc2+0x28f>
c01063c6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01063cd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01063d4:	eb 26                	jmp    c01063fc <sys_malloc2+0xd5>
c01063d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01063d9:	89 d0                	mov    %edx,%eax
c01063db:	01 c0                	add    %eax,%eax
c01063dd:	01 d0                	add    %edx,%eax
c01063df:	c1 e0 03             	shl    $0x3,%eax
c01063e2:	89 c2                	mov    %eax,%edx
c01063e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063e7:	01 d0                	add    %edx,%eax
c01063e9:	8b 00                	mov    (%eax),%eax
c01063eb:	39 45 08             	cmp    %eax,0x8(%ebp)
c01063ee:	77 08                	ja     c01063f8 <sys_malloc2+0xd1>
c01063f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01063f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01063f6:	eb 0a                	jmp    c0106402 <sys_malloc2+0xdb>
c01063f8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01063fc:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0106400:	7e d4                	jle    c01063d6 <sys_malloc2+0xaf>
c0106402:	83 ec 08             	sub    $0x8,%esp
c0106405:	ff 75 f0             	pushl  -0x10(%ebp)
c0106408:	6a 01                	push   $0x1
c010640a:	e8 68 fe ff ff       	call   c0106277 <alloc_memory>
c010640f:	83 c4 10             	add    $0x10,%esp
c0106412:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106415:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106418:	89 d0                	mov    %edx,%eax
c010641a:	01 c0                	add    %eax,%eax
c010641c:	01 d0                	add    %edx,%eax
c010641e:	c1 e0 03             	shl    $0x3,%eax
c0106421:	89 c2                	mov    %eax,%edx
c0106423:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106426:	01 d0                	add    %edx,%eax
c0106428:	83 ec 04             	sub    $0x4,%esp
c010642b:	6a 18                	push   $0x18
c010642d:	50                   	push   %eax
c010642e:	ff 75 cc             	pushl  -0x34(%ebp)
c0106431:	e8 76 09 00 00       	call   c0106dac <Memcpy>
c0106436:	83 c4 10             	add    $0x10,%esp
c0106439:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0106440:	e8 03 09 00 00       	call   c0106d48 <intr_disable>
c0106445:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106448:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010644b:	89 d0                	mov    %edx,%eax
c010644d:	01 c0                	add    %eax,%eax
c010644f:	01 d0                	add    %edx,%eax
c0106451:	c1 e0 03             	shl    $0x3,%eax
c0106454:	89 c2                	mov    %eax,%edx
c0106456:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106459:	01 d0                	add    %edx,%eax
c010645b:	83 c0 08             	add    $0x8,%eax
c010645e:	83 ec 0c             	sub    $0xc,%esp
c0106461:	50                   	push   %eax
c0106462:	e8 1c 3d 00 00       	call   c010a183 <isListEmpty>
c0106467:	83 c4 10             	add    $0x10,%esp
c010646a:	3c 01                	cmp    $0x1,%al
c010646c:	0f 85 c1 00 00 00    	jne    c0106533 <sys_malloc2+0x20c>
c0106472:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106479:	83 ec 08             	sub    $0x8,%esp
c010647c:	ff 75 f0             	pushl  -0x10(%ebp)
c010647f:	6a 01                	push   $0x1
c0106481:	e8 f1 fd ff ff       	call   c0106277 <alloc_memory>
c0106486:	83 c4 10             	add    $0x10,%esp
c0106489:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010648c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010648f:	83 ec 0c             	sub    $0xc,%esp
c0106492:	50                   	push   %eax
c0106493:	e8 79 fe ff ff       	call   c0106311 <block2arena>
c0106498:	83 c4 10             	add    $0x10,%esp
c010649b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010649e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01064a1:	89 d0                	mov    %edx,%eax
c01064a3:	01 c0                	add    %eax,%eax
c01064a5:	01 d0                	add    %edx,%eax
c01064a7:	c1 e0 03             	shl    $0x3,%eax
c01064aa:	89 c2                	mov    %eax,%edx
c01064ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01064af:	01 d0                	add    %edx,%eax
c01064b1:	8b 50 04             	mov    0x4(%eax),%edx
c01064b4:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01064b7:	89 50 04             	mov    %edx,0x4(%eax)
c01064ba:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01064bd:	8b 00                	mov    (%eax),%eax
c01064bf:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01064c2:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c01064c9:	b8 00 10 00 00       	mov    $0x1000,%eax
c01064ce:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c01064d1:	ba 00 00 00 00       	mov    $0x0,%edx
c01064d6:	f7 75 b8             	divl   -0x48(%ebp)
c01064d9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01064dc:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01064df:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01064e2:	01 d0                	add    %edx,%eax
c01064e4:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01064e7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01064ee:	eb 3b                	jmp    c010652b <sys_malloc2+0x204>
c01064f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01064f3:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c01064f7:	89 c2                	mov    %eax,%edx
c01064f9:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01064fc:	01 d0                	add    %edx,%eax
c01064fe:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106501:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106504:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106507:	89 d0                	mov    %edx,%eax
c0106509:	01 c0                	add    %eax,%eax
c010650b:	01 d0                	add    %edx,%eax
c010650d:	c1 e0 03             	shl    $0x3,%eax
c0106510:	89 c2                	mov    %eax,%edx
c0106512:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106515:	01 d0                	add    %edx,%eax
c0106517:	83 c0 08             	add    $0x8,%eax
c010651a:	83 ec 08             	sub    $0x8,%esp
c010651d:	51                   	push   %ecx
c010651e:	50                   	push   %eax
c010651f:	e8 5c 3d 00 00       	call   c010a280 <appendToDoubleLinkList>
c0106524:	83 c4 10             	add    $0x10,%esp
c0106527:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010652b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010652e:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0106531:	77 bd                	ja     c01064f0 <sys_malloc2+0x1c9>
c0106533:	83 ec 0c             	sub    $0xc,%esp
c0106536:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106539:	e8 33 08 00 00       	call   c0106d71 <intr_set_status>
c010653e:	83 c4 10             	add    $0x10,%esp
c0106541:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106544:	89 d0                	mov    %edx,%eax
c0106546:	01 c0                	add    %eax,%eax
c0106548:	01 d0                	add    %edx,%eax
c010654a:	c1 e0 03             	shl    $0x3,%eax
c010654d:	89 c2                	mov    %eax,%edx
c010654f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106552:	01 d0                	add    %edx,%eax
c0106554:	83 c0 08             	add    $0x8,%eax
c0106557:	83 ec 0c             	sub    $0xc,%esp
c010655a:	50                   	push   %eax
c010655b:	e8 8a 3e 00 00       	call   c010a3ea <popFromDoubleLinkList>
c0106560:	83 c4 10             	add    $0x10,%esp
c0106563:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106566:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106569:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010656c:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0106570:	75 1c                	jne    c010658e <sys_malloc2+0x267>
c0106572:	68 ef 01 00 00       	push   $0x1ef
c0106577:	68 d2 b5 10 c0       	push   $0xc010b5d2
c010657c:	68 d2 b5 10 c0       	push   $0xc010b5d2
c0106581:	68 f3 b5 10 c0       	push   $0xc010b5f3
c0106586:	e8 3a 24 00 00       	call   c01089c5 <assertion_failure>
c010658b:	83 c4 10             	add    $0x10,%esp
c010658e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106591:	83 ec 0c             	sub    $0xc,%esp
c0106594:	50                   	push   %eax
c0106595:	e8 77 fd ff ff       	call   c0106311 <block2arena>
c010659a:	83 c4 10             	add    $0x10,%esp
c010659d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01065a0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01065a3:	8b 40 04             	mov    0x4(%eax),%eax
c01065a6:	8d 50 ff             	lea    -0x1(%eax),%edx
c01065a9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01065ac:	89 50 04             	mov    %edx,0x4(%eax)
c01065af:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c01065b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01065ba:	75 1c                	jne    c01065d8 <sys_malloc2+0x2b1>
c01065bc:	68 f6 01 00 00       	push   $0x1f6
c01065c1:	68 d2 b5 10 c0       	push   $0xc010b5d2
c01065c6:	68 d2 b5 10 c0       	push   $0xc010b5d2
c01065cb:	68 05 b6 10 c0       	push   $0xc010b605
c01065d0:	e8 f0 23 00 00       	call   c01089c5 <assertion_failure>
c01065d5:	83 c4 10             	add    $0x10,%esp
c01065d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01065db:	c9                   	leave  
c01065dc:	c3                   	ret    

c01065dd <remove_map_entry>:
c01065dd:	55                   	push   %ebp
c01065de:	89 e5                	mov    %esp,%ebp
c01065e0:	83 ec 10             	sub    $0x10,%esp
c01065e3:	ff 75 08             	pushl  0x8(%ebp)
c01065e6:	e8 9c f8 ff ff       	call   c0105e87 <ptr_pte>
c01065eb:	83 c4 04             	add    $0x4,%esp
c01065ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01065f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01065f4:	8b 10                	mov    (%eax),%edx
c01065f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01065f9:	89 10                	mov    %edx,(%eax)
c01065fb:	90                   	nop
c01065fc:	c9                   	leave  
c01065fd:	c3                   	ret    

c01065fe <free_a_page>:
c01065fe:	55                   	push   %ebp
c01065ff:	89 e5                	mov    %esp,%ebp
c0106601:	83 ec 20             	sub    $0x20,%esp
c0106604:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106608:	75 21                	jne    c010662b <free_a_page+0x2d>
c010660a:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010660f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106612:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106617:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010661a:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010661f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106622:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106629:	eb 1f                	jmp    c010664a <free_a_page+0x4c>
c010662b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106630:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106633:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106638:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010663b:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106640:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106643:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c010664a:	8b 45 08             	mov    0x8(%ebp),%eax
c010664d:	c1 e8 0c             	shr    $0xc,%eax
c0106650:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106653:	6a 00                	push   $0x0
c0106655:	ff 75 f8             	pushl  -0x8(%ebp)
c0106658:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c010665b:	50                   	push   %eax
c010665c:	e8 74 f4 ff ff       	call   c0105ad5 <set_bit_val>
c0106661:	83 c4 0c             	add    $0xc,%esp
c0106664:	ff 75 08             	pushl  0x8(%ebp)
c0106667:	e8 22 fa ff ff       	call   c010608e <get_physical_address>
c010666c:	83 c4 04             	add    $0x4,%esp
c010666f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106672:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106675:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010667b:	85 c0                	test   %eax,%eax
c010667d:	0f 48 c2             	cmovs  %edx,%eax
c0106680:	c1 f8 0c             	sar    $0xc,%eax
c0106683:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106686:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106689:	6a 00                	push   $0x0
c010668b:	ff 75 f0             	pushl  -0x10(%ebp)
c010668e:	50                   	push   %eax
c010668f:	e8 41 f4 ff ff       	call   c0105ad5 <set_bit_val>
c0106694:	83 c4 0c             	add    $0xc,%esp
c0106697:	ff 75 08             	pushl  0x8(%ebp)
c010669a:	e8 3e ff ff ff       	call   c01065dd <remove_map_entry>
c010669f:	83 c4 04             	add    $0x4,%esp
c01066a2:	90                   	nop
c01066a3:	c9                   	leave  
c01066a4:	c3                   	ret    

c01066a5 <sys_free2>:
c01066a5:	55                   	push   %ebp
c01066a6:	89 e5                	mov    %esp,%ebp
c01066a8:	83 ec 58             	sub    $0x58,%esp
c01066ab:	e8 3e 9d ff ff       	call   c01003ee <get_running_thread_pcb>
c01066b0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01066b3:	e8 90 06 00 00       	call   c0106d48 <intr_disable>
c01066b8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01066bb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01066be:	8b 50 08             	mov    0x8(%eax),%edx
c01066c1:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01066c6:	39 c2                	cmp    %eax,%edx
c01066c8:	75 10                	jne    c01066da <sys_free2+0x35>
c01066ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01066d1:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c01066d8:	eb 10                	jmp    c01066ea <sys_free2+0x45>
c01066da:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01066e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01066e4:	83 c0 10             	add    $0x10,%eax
c01066e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01066ea:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c01066f1:	76 4d                	jbe    c0106740 <sys_free2+0x9b>
c01066f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01066f6:	83 e8 0c             	sub    $0xc,%eax
c01066f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01066fc:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0106700:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106703:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106708:	c1 e8 0c             	shr    $0xc,%eax
c010670b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010670e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106715:	eb 1c                	jmp    c0106733 <sys_free2+0x8e>
c0106717:	83 ec 08             	sub    $0x8,%esp
c010671a:	ff 75 f4             	pushl  -0xc(%ebp)
c010671d:	ff 75 ec             	pushl  -0x14(%ebp)
c0106720:	e8 d9 fe ff ff       	call   c01065fe <free_a_page>
c0106725:	83 c4 10             	add    $0x10,%esp
c0106728:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010672f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106733:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106736:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106739:	77 dc                	ja     c0106717 <sys_free2+0x72>
c010673b:	e9 dc 00 00 00       	jmp    c010681c <sys_free2+0x177>
c0106740:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106747:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010674e:	eb 26                	jmp    c0106776 <sys_free2+0xd1>
c0106750:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106753:	89 d0                	mov    %edx,%eax
c0106755:	01 c0                	add    %eax,%eax
c0106757:	01 d0                	add    %edx,%eax
c0106759:	c1 e0 03             	shl    $0x3,%eax
c010675c:	89 c2                	mov    %eax,%edx
c010675e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106761:	01 d0                	add    %edx,%eax
c0106763:	8b 00                	mov    (%eax),%eax
c0106765:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106768:	77 08                	ja     c0106772 <sys_free2+0xcd>
c010676a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010676d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106770:	eb 0a                	jmp    c010677c <sys_free2+0xd7>
c0106772:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106776:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c010677a:	7e d4                	jle    c0106750 <sys_free2+0xab>
c010677c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010677f:	89 d0                	mov    %edx,%eax
c0106781:	01 c0                	add    %eax,%eax
c0106783:	01 d0                	add    %edx,%eax
c0106785:	c1 e0 03             	shl    $0x3,%eax
c0106788:	89 c2                	mov    %eax,%edx
c010678a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010678d:	01 d0                	add    %edx,%eax
c010678f:	8b 10                	mov    (%eax),%edx
c0106791:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106794:	8b 50 04             	mov    0x4(%eax),%edx
c0106797:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010679a:	8b 50 08             	mov    0x8(%eax),%edx
c010679d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c01067a0:	8b 50 0c             	mov    0xc(%eax),%edx
c01067a3:	89 55 c0             	mov    %edx,-0x40(%ebp)
c01067a6:	8b 50 10             	mov    0x10(%eax),%edx
c01067a9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c01067ac:	8b 40 14             	mov    0x14(%eax),%eax
c01067af:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01067b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01067b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01067b8:	83 ec 0c             	sub    $0xc,%esp
c01067bb:	ff 75 d0             	pushl  -0x30(%ebp)
c01067be:	e8 4e fb ff ff       	call   c0106311 <block2arena>
c01067c3:	83 c4 10             	add    $0x10,%esp
c01067c6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01067c9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01067cc:	89 d0                	mov    %edx,%eax
c01067ce:	01 c0                	add    %eax,%eax
c01067d0:	01 d0                	add    %edx,%eax
c01067d2:	c1 e0 03             	shl    $0x3,%eax
c01067d5:	89 c2                	mov    %eax,%edx
c01067d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01067da:	01 d0                	add    %edx,%eax
c01067dc:	83 c0 08             	add    $0x8,%eax
c01067df:	83 ec 08             	sub    $0x8,%esp
c01067e2:	ff 75 d0             	pushl  -0x30(%ebp)
c01067e5:	50                   	push   %eax
c01067e6:	e8 95 3a 00 00       	call   c010a280 <appendToDoubleLinkList>
c01067eb:	83 c4 10             	add    $0x10,%esp
c01067ee:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01067f1:	8b 40 04             	mov    0x4(%eax),%eax
c01067f4:	8d 50 01             	lea    0x1(%eax),%edx
c01067f7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01067fa:	89 50 04             	mov    %edx,0x4(%eax)
c01067fd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106800:	8b 50 04             	mov    0x4(%eax),%edx
c0106803:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106806:	39 c2                	cmp    %eax,%edx
c0106808:	75 12                	jne    c010681c <sys_free2+0x177>
c010680a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010680d:	83 ec 08             	sub    $0x8,%esp
c0106810:	ff 75 f4             	pushl  -0xc(%ebp)
c0106813:	50                   	push   %eax
c0106814:	e8 e5 fd ff ff       	call   c01065fe <free_a_page>
c0106819:	83 c4 10             	add    $0x10,%esp
c010681c:	83 ec 0c             	sub    $0xc,%esp
c010681f:	ff 75 d8             	pushl  -0x28(%ebp)
c0106822:	e8 4a 05 00 00       	call   c0106d71 <intr_set_status>
c0106827:	83 c4 10             	add    $0x10,%esp
c010682a:	90                   	nop
c010682b:	c9                   	leave  
c010682c:	c3                   	ret    

c010682d <init_memory_block_desc>:
c010682d:	55                   	push   %ebp
c010682e:	89 e5                	mov    %esp,%ebp
c0106830:	83 ec 18             	sub    $0x18,%esp
c0106833:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010683a:	e9 b2 00 00 00       	jmp    c01068f1 <init_memory_block_desc+0xc4>
c010683f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106843:	75 1b                	jne    c0106860 <init_memory_block_desc+0x33>
c0106845:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106848:	89 d0                	mov    %edx,%eax
c010684a:	01 c0                	add    %eax,%eax
c010684c:	01 d0                	add    %edx,%eax
c010684e:	c1 e0 03             	shl    $0x3,%eax
c0106851:	89 c2                	mov    %eax,%edx
c0106853:	8b 45 08             	mov    0x8(%ebp),%eax
c0106856:	01 d0                	add    %edx,%eax
c0106858:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010685e:	eb 2e                	jmp    c010688e <init_memory_block_desc+0x61>
c0106860:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106863:	89 d0                	mov    %edx,%eax
c0106865:	01 c0                	add    %eax,%eax
c0106867:	01 d0                	add    %edx,%eax
c0106869:	c1 e0 03             	shl    $0x3,%eax
c010686c:	8d 50 e8             	lea    -0x18(%eax),%edx
c010686f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106872:	01 d0                	add    %edx,%eax
c0106874:	8b 08                	mov    (%eax),%ecx
c0106876:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106879:	89 d0                	mov    %edx,%eax
c010687b:	01 c0                	add    %eax,%eax
c010687d:	01 d0                	add    %edx,%eax
c010687f:	c1 e0 03             	shl    $0x3,%eax
c0106882:	89 c2                	mov    %eax,%edx
c0106884:	8b 45 08             	mov    0x8(%ebp),%eax
c0106887:	01 d0                	add    %edx,%eax
c0106889:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c010688c:	89 10                	mov    %edx,(%eax)
c010688e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106891:	89 d0                	mov    %edx,%eax
c0106893:	01 c0                	add    %eax,%eax
c0106895:	01 d0                	add    %edx,%eax
c0106897:	c1 e0 03             	shl    $0x3,%eax
c010689a:	89 c2                	mov    %eax,%edx
c010689c:	8b 45 08             	mov    0x8(%ebp),%eax
c010689f:	01 d0                	add    %edx,%eax
c01068a1:	8b 00                	mov    (%eax),%eax
c01068a3:	89 c1                	mov    %eax,%ecx
c01068a5:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c01068aa:	ba 00 00 00 00       	mov    $0x0,%edx
c01068af:	f7 f1                	div    %ecx
c01068b1:	89 c1                	mov    %eax,%ecx
c01068b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01068b6:	89 d0                	mov    %edx,%eax
c01068b8:	01 c0                	add    %eax,%eax
c01068ba:	01 d0                	add    %edx,%eax
c01068bc:	c1 e0 03             	shl    $0x3,%eax
c01068bf:	89 c2                	mov    %eax,%edx
c01068c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01068c4:	01 d0                	add    %edx,%eax
c01068c6:	89 ca                	mov    %ecx,%edx
c01068c8:	89 50 04             	mov    %edx,0x4(%eax)
c01068cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01068ce:	89 d0                	mov    %edx,%eax
c01068d0:	01 c0                	add    %eax,%eax
c01068d2:	01 d0                	add    %edx,%eax
c01068d4:	c1 e0 03             	shl    $0x3,%eax
c01068d7:	89 c2                	mov    %eax,%edx
c01068d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01068dc:	01 d0                	add    %edx,%eax
c01068de:	83 c0 08             	add    $0x8,%eax
c01068e1:	83 ec 0c             	sub    $0xc,%esp
c01068e4:	50                   	push   %eax
c01068e5:	e8 6b 38 00 00       	call   c010a155 <initDoubleLinkList>
c01068ea:	83 c4 10             	add    $0x10,%esp
c01068ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01068f1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01068f5:	0f 8e 44 ff ff ff    	jle    c010683f <init_memory_block_desc+0x12>
c01068fb:	90                   	nop
c01068fc:	c9                   	leave  
c01068fd:	c3                   	ret    

c01068fe <init_memory2>:
c01068fe:	55                   	push   %ebp
c01068ff:	89 e5                	mov    %esp,%ebp
c0106901:	83 ec 38             	sub    $0x38,%esp
c0106904:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c010690b:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106912:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106915:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c010691a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010691d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106922:	29 c2                	sub    %eax,%edx
c0106924:	89 d0                	mov    %edx,%eax
c0106926:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106929:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010692c:	89 c2                	mov    %eax,%edx
c010692e:	c1 ea 1f             	shr    $0x1f,%edx
c0106931:	01 d0                	add    %edx,%eax
c0106933:	d1 f8                	sar    %eax
c0106935:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c010693a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010693f:	83 ec 0c             	sub    $0xc,%esp
c0106942:	50                   	push   %eax
c0106943:	e8 52 08 00 00       	call   c010719a <disp_int>
c0106948:	83 c4 10             	add    $0x10,%esp
c010694b:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106950:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106953:	29 c2                	sub    %eax,%edx
c0106955:	89 d0                	mov    %edx,%eax
c0106957:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c010695c:	83 ec 0c             	sub    $0xc,%esp
c010695f:	68 11 b6 10 c0       	push   $0xc010b611
c0106964:	e8 23 97 ff ff       	call   c010008c <disp_str>
c0106969:	83 c4 10             	add    $0x10,%esp
c010696c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106971:	83 ec 0c             	sub    $0xc,%esp
c0106974:	50                   	push   %eax
c0106975:	e8 20 08 00 00       	call   c010719a <disp_int>
c010697a:	83 c4 10             	add    $0x10,%esp
c010697d:	83 ec 0c             	sub    $0xc,%esp
c0106980:	68 11 b6 10 c0       	push   $0xc010b611
c0106985:	e8 02 97 ff ff       	call   c010008c <disp_str>
c010698a:	83 c4 10             	add    $0x10,%esp
c010698d:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106992:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106997:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010699d:	85 c0                	test   %eax,%eax
c010699f:	0f 48 c2             	cmovs  %edx,%eax
c01069a2:	c1 f8 0c             	sar    $0xc,%eax
c01069a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01069a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01069ab:	83 c0 07             	add    $0x7,%eax
c01069ae:	8d 50 07             	lea    0x7(%eax),%edx
c01069b1:	85 c0                	test   %eax,%eax
c01069b3:	0f 48 c2             	cmovs  %edx,%eax
c01069b6:	c1 f8 03             	sar    $0x3,%eax
c01069b9:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c01069be:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01069c3:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01069c8:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01069cd:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01069d3:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01069d8:	83 ec 04             	sub    $0x4,%esp
c01069db:	52                   	push   %edx
c01069dc:	6a 00                	push   $0x0
c01069de:	50                   	push   %eax
c01069df:	e8 0b 58 00 00       	call   c010c1ef <Memset>
c01069e4:	83 c4 10             	add    $0x10,%esp
c01069e7:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c01069ec:	05 ff 0f 00 00       	add    $0xfff,%eax
c01069f1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069f7:	85 c0                	test   %eax,%eax
c01069f9:	0f 48 c2             	cmovs  %edx,%eax
c01069fc:	c1 f8 0c             	sar    $0xc,%eax
c01069ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a02:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106a08:	ff 75 e8             	pushl  -0x18(%ebp)
c0106a0b:	6a 01                	push   $0x1
c0106a0d:	6a 00                	push   $0x0
c0106a0f:	68 ac 06 11 c0       	push   $0xc01106ac
c0106a14:	e8 37 f1 ff ff       	call   c0105b50 <set_bits>
c0106a19:	83 c4 10             	add    $0x10,%esp
c0106a1c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106a21:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a26:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a2c:	85 c0                	test   %eax,%eax
c0106a2e:	0f 48 c2             	cmovs  %edx,%eax
c0106a31:	c1 f8 0c             	sar    $0xc,%eax
c0106a34:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106a37:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106a3a:	83 c0 07             	add    $0x7,%eax
c0106a3d:	8d 50 07             	lea    0x7(%eax),%edx
c0106a40:	85 c0                	test   %eax,%eax
c0106a42:	0f 48 c2             	cmovs  %edx,%eax
c0106a45:	c1 f8 03             	sar    $0x3,%eax
c0106a48:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106a4d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106a52:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106a58:	01 d0                	add    %edx,%eax
c0106a5a:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106a5f:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106a65:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106a6a:	83 ec 04             	sub    $0x4,%esp
c0106a6d:	52                   	push   %edx
c0106a6e:	6a 00                	push   $0x0
c0106a70:	50                   	push   %eax
c0106a71:	e8 79 57 00 00       	call   c010c1ef <Memset>
c0106a76:	83 c4 10             	add    $0x10,%esp
c0106a79:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106a7e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a83:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a89:	85 c0                	test   %eax,%eax
c0106a8b:	0f 48 c2             	cmovs  %edx,%eax
c0106a8e:	c1 f8 0c             	sar    $0xc,%eax
c0106a91:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a94:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106a97:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a9a:	ff 75 e8             	pushl  -0x18(%ebp)
c0106a9d:	6a 01                	push   $0x1
c0106a9f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106aa2:	68 ac 06 11 c0       	push   $0xc01106ac
c0106aa7:	e8 a4 f0 ff ff       	call   c0105b50 <set_bits>
c0106aac:	83 c4 10             	add    $0x10,%esp
c0106aaf:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106ab6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106ab9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106abc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106abf:	83 c0 07             	add    $0x7,%eax
c0106ac2:	8d 50 07             	lea    0x7(%eax),%edx
c0106ac5:	85 c0                	test   %eax,%eax
c0106ac7:	0f 48 c2             	cmovs  %edx,%eax
c0106aca:	c1 f8 03             	sar    $0x3,%eax
c0106acd:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106ad2:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106ad7:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106add:	01 c2                	add    %eax,%edx
c0106adf:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106ae4:	01 d0                	add    %edx,%eax
c0106ae6:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106aeb:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106af1:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106af6:	83 ec 04             	sub    $0x4,%esp
c0106af9:	52                   	push   %edx
c0106afa:	6a 00                	push   $0x0
c0106afc:	50                   	push   %eax
c0106afd:	e8 ed 56 00 00       	call   c010c1ef <Memset>
c0106b02:	83 c4 10             	add    $0x10,%esp
c0106b05:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106b08:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b0b:	01 d0                	add    %edx,%eax
c0106b0d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106b10:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106b15:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106b1a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106b20:	85 c0                	test   %eax,%eax
c0106b22:	0f 48 c2             	cmovs  %edx,%eax
c0106b25:	c1 f8 0c             	sar    $0xc,%eax
c0106b28:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b2b:	ff 75 e8             	pushl  -0x18(%ebp)
c0106b2e:	6a 01                	push   $0x1
c0106b30:	ff 75 e0             	pushl  -0x20(%ebp)
c0106b33:	68 ac 06 11 c0       	push   $0xc01106ac
c0106b38:	e8 13 f0 ff ff       	call   c0105b50 <set_bits>
c0106b3d:	83 c4 10             	add    $0x10,%esp
c0106b40:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106b43:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b46:	01 d0                	add    %edx,%eax
c0106b48:	c1 e0 0c             	shl    $0xc,%eax
c0106b4b:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106b50:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b53:	83 c0 02             	add    $0x2,%eax
c0106b56:	c1 e0 0c             	shl    $0xc,%eax
c0106b59:	89 c2                	mov    %eax,%edx
c0106b5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106b5e:	01 d0                	add    %edx,%eax
c0106b60:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106b65:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106b6c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b6f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106b72:	90                   	nop
c0106b73:	c9                   	leave  
c0106b74:	c3                   	ret    

c0106b75 <init_memory>:
c0106b75:	55                   	push   %ebp
c0106b76:	89 e5                	mov    %esp,%ebp
c0106b78:	83 ec 38             	sub    $0x38,%esp
c0106b7b:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106b82:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106b89:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106b90:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106b93:	05 00 00 40 00       	add    $0x400000,%eax
c0106b98:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b9e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106ba1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106ba7:	85 c0                	test   %eax,%eax
c0106ba9:	0f 48 c2             	cmovs  %edx,%eax
c0106bac:	c1 f8 0c             	sar    $0xc,%eax
c0106baf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106bb2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106bb5:	89 c2                	mov    %eax,%edx
c0106bb7:	c1 ea 1f             	shr    $0x1f,%edx
c0106bba:	01 d0                	add    %edx,%eax
c0106bbc:	d1 f8                	sar    %eax
c0106bbe:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106bc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106bc4:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106bc7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106bca:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106bcd:	8d 50 07             	lea    0x7(%eax),%edx
c0106bd0:	85 c0                	test   %eax,%eax
c0106bd2:	0f 48 c2             	cmovs  %edx,%eax
c0106bd5:	c1 f8 03             	sar    $0x3,%eax
c0106bd8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106bdb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106bde:	8d 50 07             	lea    0x7(%eax),%edx
c0106be1:	85 c0                	test   %eax,%eax
c0106be3:	0f 48 c2             	cmovs  %edx,%eax
c0106be6:	c1 f8 03             	sar    $0x3,%eax
c0106be9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106bec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106bef:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106bf4:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106bf9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106bfc:	c1 e2 0c             	shl    $0xc,%edx
c0106bff:	01 d0                	add    %edx,%eax
c0106c01:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106c06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c09:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106c0e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106c11:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106c16:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106c1b:	83 ec 04             	sub    $0x4,%esp
c0106c1e:	ff 75 d8             	pushl  -0x28(%ebp)
c0106c21:	6a 00                	push   $0x0
c0106c23:	50                   	push   %eax
c0106c24:	e8 c6 55 00 00       	call   c010c1ef <Memset>
c0106c29:	83 c4 10             	add    $0x10,%esp
c0106c2c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106c2f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106c32:	01 d0                	add    %edx,%eax
c0106c34:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106c39:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106c3c:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106c41:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106c46:	83 ec 04             	sub    $0x4,%esp
c0106c49:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106c4c:	6a 00                	push   $0x0
c0106c4e:	50                   	push   %eax
c0106c4f:	e8 9b 55 00 00       	call   c010c1ef <Memset>
c0106c54:	83 c4 10             	add    $0x10,%esp
c0106c57:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106c5a:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106c5f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106c62:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106c65:	01 c2                	add    %eax,%edx
c0106c67:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106c6a:	01 d0                	add    %edx,%eax
c0106c6c:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106c71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106c74:	05 00 00 10 00       	add    $0x100000,%eax
c0106c79:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106c7e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106c83:	83 ec 04             	sub    $0x4,%esp
c0106c86:	ff 75 d8             	pushl  -0x28(%ebp)
c0106c89:	6a 00                	push   $0x0
c0106c8b:	50                   	push   %eax
c0106c8c:	e8 5e 55 00 00       	call   c010c1ef <Memset>
c0106c91:	83 c4 10             	add    $0x10,%esp
c0106c94:	83 ec 04             	sub    $0x4,%esp
c0106c97:	68 f0 00 00 00       	push   $0xf0
c0106c9c:	6a 00                	push   $0x0
c0106c9e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106ca3:	e8 47 55 00 00       	call   c010c1ef <Memset>
c0106ca8:	83 c4 10             	add    $0x10,%esp
c0106cab:	83 ec 0c             	sub    $0xc,%esp
c0106cae:	68 e0 37 18 c0       	push   $0xc01837e0
c0106cb3:	e8 75 fb ff ff       	call   c010682d <init_memory_block_desc>
c0106cb8:	83 c4 10             	add    $0x10,%esp
c0106cbb:	90                   	nop
c0106cbc:	c9                   	leave  
c0106cbd:	c3                   	ret    

c0106cbe <stop_here>:
c0106cbe:	55                   	push   %ebp
c0106cbf:	89 e5                	mov    %esp,%ebp
c0106cc1:	83 ec 08             	sub    $0x8,%esp
c0106cc4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106ccb:	00 00 00 
c0106cce:	83 ec 0c             	sub    $0xc,%esp
c0106cd1:	68 20 b6 10 c0       	push   $0xc010b620
c0106cd6:	e8 b1 93 ff ff       	call   c010008c <disp_str>
c0106cdb:	83 c4 10             	add    $0x10,%esp
c0106cde:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106ce3:	83 ec 0c             	sub    $0xc,%esp
c0106ce6:	50                   	push   %eax
c0106ce7:	e8 ae 04 00 00       	call   c010719a <disp_int>
c0106cec:	83 c4 10             	add    $0x10,%esp
c0106cef:	83 ec 0c             	sub    $0xc,%esp
c0106cf2:	68 22 b6 10 c0       	push   $0xc010b622
c0106cf7:	e8 90 93 ff ff       	call   c010008c <disp_str>
c0106cfc:	83 c4 10             	add    $0x10,%esp
c0106cff:	90                   	nop
c0106d00:	c9                   	leave  
c0106d01:	c3                   	ret    

c0106d02 <catch_error>:
c0106d02:	55                   	push   %ebp
c0106d03:	89 e5                	mov    %esp,%ebp
c0106d05:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106d0a:	83 c0 01             	add    $0x1,%eax
c0106d0d:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106d12:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106d17:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106d1c:	90                   	nop
c0106d1d:	5d                   	pop    %ebp
c0106d1e:	c3                   	ret    

c0106d1f <intr_enable>:
c0106d1f:	55                   	push   %ebp
c0106d20:	89 e5                	mov    %esp,%ebp
c0106d22:	83 ec 18             	sub    $0x18,%esp
c0106d25:	e8 65 00 00 00       	call   c0106d8f <intr_get_status>
c0106d2a:	83 f8 01             	cmp    $0x1,%eax
c0106d2d:	75 0c                	jne    c0106d3b <intr_enable+0x1c>
c0106d2f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106d36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d39:	eb 0b                	jmp    c0106d46 <intr_enable+0x27>
c0106d3b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d42:	fb                   	sti    
c0106d43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d46:	c9                   	leave  
c0106d47:	c3                   	ret    

c0106d48 <intr_disable>:
c0106d48:	55                   	push   %ebp
c0106d49:	89 e5                	mov    %esp,%ebp
c0106d4b:	83 ec 18             	sub    $0x18,%esp
c0106d4e:	e8 3c 00 00 00       	call   c0106d8f <intr_get_status>
c0106d53:	83 f8 01             	cmp    $0x1,%eax
c0106d56:	75 0d                	jne    c0106d65 <intr_disable+0x1d>
c0106d58:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106d5f:	fa                   	cli    
c0106d60:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d63:	eb 0a                	jmp    c0106d6f <intr_disable+0x27>
c0106d65:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d6f:	c9                   	leave  
c0106d70:	c3                   	ret    

c0106d71 <intr_set_status>:
c0106d71:	55                   	push   %ebp
c0106d72:	89 e5                	mov    %esp,%ebp
c0106d74:	83 ec 08             	sub    $0x8,%esp
c0106d77:	8b 45 08             	mov    0x8(%ebp),%eax
c0106d7a:	83 e0 01             	and    $0x1,%eax
c0106d7d:	85 c0                	test   %eax,%eax
c0106d7f:	74 07                	je     c0106d88 <intr_set_status+0x17>
c0106d81:	e8 99 ff ff ff       	call   c0106d1f <intr_enable>
c0106d86:	eb 05                	jmp    c0106d8d <intr_set_status+0x1c>
c0106d88:	e8 bb ff ff ff       	call   c0106d48 <intr_disable>
c0106d8d:	c9                   	leave  
c0106d8e:	c3                   	ret    

c0106d8f <intr_get_status>:
c0106d8f:	55                   	push   %ebp
c0106d90:	89 e5                	mov    %esp,%ebp
c0106d92:	83 ec 10             	sub    $0x10,%esp
c0106d95:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106d9c:	9c                   	pushf  
c0106d9d:	58                   	pop    %eax
c0106d9e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106da1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106da4:	c1 e8 09             	shr    $0x9,%eax
c0106da7:	83 e0 01             	and    $0x1,%eax
c0106daa:	c9                   	leave  
c0106dab:	c3                   	ret    

c0106dac <Memcpy>:
c0106dac:	55                   	push   %ebp
c0106dad:	89 e5                	mov    %esp,%ebp
c0106daf:	83 ec 18             	sub    $0x18,%esp
c0106db2:	e8 91 ff ff ff       	call   c0106d48 <intr_disable>
c0106db7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106dba:	83 ec 04             	sub    $0x4,%esp
c0106dbd:	ff 75 10             	pushl  0x10(%ebp)
c0106dc0:	ff 75 0c             	pushl  0xc(%ebp)
c0106dc3:	ff 75 08             	pushl  0x8(%ebp)
c0106dc6:	e8 f6 53 00 00       	call   c010c1c1 <Memcpy2>
c0106dcb:	83 c4 10             	add    $0x10,%esp
c0106dce:	83 ec 0c             	sub    $0xc,%esp
c0106dd1:	ff 75 f4             	pushl  -0xc(%ebp)
c0106dd4:	e8 98 ff ff ff       	call   c0106d71 <intr_set_status>
c0106dd9:	83 c4 10             	add    $0x10,%esp
c0106ddc:	90                   	nop
c0106ddd:	c9                   	leave  
c0106dde:	c3                   	ret    

c0106ddf <untar>:
c0106ddf:	55                   	push   %ebp
c0106de0:	89 e5                	mov    %esp,%ebp
c0106de2:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106de8:	83 ec 08             	sub    $0x8,%esp
c0106deb:	6a 00                	push   $0x0
c0106ded:	ff 75 08             	pushl  0x8(%ebp)
c0106df0:	e8 2a de ff ff       	call   c0104c1f <open>
c0106df5:	83 c4 10             	add    $0x10,%esp
c0106df8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106dfb:	83 ec 0c             	sub    $0xc,%esp
c0106dfe:	68 24 b6 10 c0       	push   $0xc010b624
c0106e03:	e8 60 18 00 00       	call   c0108668 <Printf>
c0106e08:	83 c4 10             	add    $0x10,%esp
c0106e0b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106e12:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106e19:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106e20:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106e27:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106e2e:	e9 63 02 00 00       	jmp    c0107096 <untar+0x2b7>
c0106e33:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106e37:	7e 58                	jle    c0106e91 <untar+0xb2>
c0106e39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e3c:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106e41:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106e47:	85 c0                	test   %eax,%eax
c0106e49:	0f 48 c2             	cmovs  %edx,%eax
c0106e4c:	c1 f8 09             	sar    $0x9,%eax
c0106e4f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106e52:	83 ec 04             	sub    $0x4,%esp
c0106e55:	68 00 02 00 00       	push   $0x200
c0106e5a:	6a 00                	push   $0x0
c0106e5c:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e62:	50                   	push   %eax
c0106e63:	e8 87 53 00 00       	call   c010c1ef <Memset>
c0106e68:	83 c4 10             	add    $0x10,%esp
c0106e6b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106e6e:	c1 e0 09             	shl    $0x9,%eax
c0106e71:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106e74:	83 ec 04             	sub    $0x4,%esp
c0106e77:	50                   	push   %eax
c0106e78:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e7e:	50                   	push   %eax
c0106e7f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106e82:	e8 2d de ff ff       	call   c0104cb4 <read>
c0106e87:	83 c4 10             	add    $0x10,%esp
c0106e8a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106e91:	83 ec 04             	sub    $0x4,%esp
c0106e94:	68 00 02 00 00       	push   $0x200
c0106e99:	6a 00                	push   $0x0
c0106e9b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106ea1:	50                   	push   %eax
c0106ea2:	e8 48 53 00 00       	call   c010c1ef <Memset>
c0106ea7:	83 c4 10             	add    $0x10,%esp
c0106eaa:	83 ec 04             	sub    $0x4,%esp
c0106ead:	68 00 02 00 00       	push   $0x200
c0106eb2:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106eb8:	50                   	push   %eax
c0106eb9:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106ebc:	e8 f3 dd ff ff       	call   c0104cb4 <read>
c0106ec1:	83 c4 10             	add    $0x10,%esp
c0106ec4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106ec7:	83 ec 0c             	sub    $0xc,%esp
c0106eca:	68 36 b6 10 c0       	push   $0xc010b636
c0106ecf:	e8 94 17 00 00       	call   c0108668 <Printf>
c0106ed4:	83 c4 10             	add    $0x10,%esp
c0106ed7:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106edb:	0f 84 c1 01 00 00    	je     c01070a2 <untar+0x2c3>
c0106ee1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ee4:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106ee7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106eee:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106ef4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106ef7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106efa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106efd:	83 ec 08             	sub    $0x8,%esp
c0106f00:	6a 07                	push   $0x7
c0106f02:	ff 75 cc             	pushl  -0x34(%ebp)
c0106f05:	e8 15 dd ff ff       	call   c0104c1f <open>
c0106f0a:	83 c4 10             	add    $0x10,%esp
c0106f0d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106f10:	83 ec 0c             	sub    $0xc,%esp
c0106f13:	68 48 b6 10 c0       	push   $0xc010b648
c0106f18:	e8 4b 17 00 00       	call   c0108668 <Printf>
c0106f1d:	83 c4 10             	add    $0x10,%esp
c0106f20:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106f27:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106f2a:	83 c0 7c             	add    $0x7c,%eax
c0106f2d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106f30:	83 ec 0c             	sub    $0xc,%esp
c0106f33:	ff 75 cc             	pushl  -0x34(%ebp)
c0106f36:	e8 ed 52 00 00       	call   c010c228 <Strlen>
c0106f3b:	83 c4 10             	add    $0x10,%esp
c0106f3e:	85 c0                	test   %eax,%eax
c0106f40:	75 28                	jne    c0106f6a <untar+0x18b>
c0106f42:	83 ec 0c             	sub    $0xc,%esp
c0106f45:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106f48:	e8 db 52 00 00       	call   c010c228 <Strlen>
c0106f4d:	83 c4 10             	add    $0x10,%esp
c0106f50:	85 c0                	test   %eax,%eax
c0106f52:	75 16                	jne    c0106f6a <untar+0x18b>
c0106f54:	83 ec 0c             	sub    $0xc,%esp
c0106f57:	68 5a b6 10 c0       	push   $0xc010b65a
c0106f5c:	e8 07 17 00 00       	call   c0108668 <Printf>
c0106f61:	83 c4 10             	add    $0x10,%esp
c0106f64:	90                   	nop
c0106f65:	e9 39 01 00 00       	jmp    c01070a3 <untar+0x2c4>
c0106f6a:	83 ec 0c             	sub    $0xc,%esp
c0106f6d:	68 61 b6 10 c0       	push   $0xc010b661
c0106f72:	e8 f1 16 00 00       	call   c0108668 <Printf>
c0106f77:	83 c4 10             	add    $0x10,%esp
c0106f7a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106f7d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106f80:	eb 1f                	jmp    c0106fa1 <untar+0x1c2>
c0106f82:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f85:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106f8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106f8f:	0f b6 00             	movzbl (%eax),%eax
c0106f92:	0f be c0             	movsbl %al,%eax
c0106f95:	83 e8 30             	sub    $0x30,%eax
c0106f98:	01 d0                	add    %edx,%eax
c0106f9a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106f9d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106fa1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106fa4:	0f b6 00             	movzbl (%eax),%eax
c0106fa7:	84 c0                	test   %al,%al
c0106fa9:	75 d7                	jne    c0106f82 <untar+0x1a3>
c0106fab:	83 ec 0c             	sub    $0xc,%esp
c0106fae:	68 6f b6 10 c0       	push   $0xc010b66f
c0106fb3:	e8 b0 16 00 00       	call   c0108668 <Printf>
c0106fb8:	83 c4 10             	add    $0x10,%esp
c0106fbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106fbe:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106fc1:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106fc8:	83 ec 08             	sub    $0x8,%esp
c0106fcb:	ff 75 c0             	pushl  -0x40(%ebp)
c0106fce:	68 7d b6 10 c0       	push   $0xc010b67d
c0106fd3:	e8 90 16 00 00       	call   c0108668 <Printf>
c0106fd8:	83 c4 10             	add    $0x10,%esp
c0106fdb:	83 ec 08             	sub    $0x8,%esp
c0106fde:	ff 75 c0             	pushl  -0x40(%ebp)
c0106fe1:	68 8f b6 10 c0       	push   $0xc010b68f
c0106fe6:	e8 7d 16 00 00       	call   c0108668 <Printf>
c0106feb:	83 c4 10             	add    $0x10,%esp
c0106fee:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106ff1:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106ff4:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106ff8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106ffb:	e8 02 fd ff ff       	call   c0106d02 <catch_error>
c0107000:	83 ec 04             	sub    $0x4,%esp
c0107003:	ff 75 b8             	pushl  -0x48(%ebp)
c0107006:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c010700c:	50                   	push   %eax
c010700d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107010:	e8 9f dc ff ff       	call   c0104cb4 <read>
c0107015:	83 c4 10             	add    $0x10,%esp
c0107018:	01 45 f4             	add    %eax,-0xc(%ebp)
c010701b:	83 ec 04             	sub    $0x4,%esp
c010701e:	ff 75 b8             	pushl  -0x48(%ebp)
c0107021:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0107027:	50                   	push   %eax
c0107028:	ff 75 c8             	pushl  -0x38(%ebp)
c010702b:	e8 05 de ff ff       	call   c0104e35 <write>
c0107030:	83 c4 10             	add    $0x10,%esp
c0107033:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107036:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0107039:	7d 02                	jge    c010703d <untar+0x25e>
c010703b:	eb be                	jmp    c0106ffb <untar+0x21c>
c010703d:	90                   	nop
c010703e:	83 ec 08             	sub    $0x8,%esp
c0107041:	ff 75 f4             	pushl  -0xc(%ebp)
c0107044:	68 a1 b6 10 c0       	push   $0xc010b6a1
c0107049:	e8 1a 16 00 00       	call   c0108668 <Printf>
c010704e:	83 c4 10             	add    $0x10,%esp
c0107051:	83 ec 08             	sub    $0x8,%esp
c0107054:	ff 75 c0             	pushl  -0x40(%ebp)
c0107057:	68 b3 b6 10 c0       	push   $0xc010b6b3
c010705c:	e8 07 16 00 00       	call   c0108668 <Printf>
c0107061:	83 c4 10             	add    $0x10,%esp
c0107064:	83 ec 0c             	sub    $0xc,%esp
c0107067:	68 c4 b6 10 c0       	push   $0xc010b6c4
c010706c:	e8 f7 15 00 00       	call   c0108668 <Printf>
c0107071:	83 c4 10             	add    $0x10,%esp
c0107074:	83 ec 0c             	sub    $0xc,%esp
c0107077:	ff 75 c8             	pushl  -0x38(%ebp)
c010707a:	e8 3b de ff ff       	call   c0104eba <close>
c010707f:	83 c4 10             	add    $0x10,%esp
c0107082:	83 ec 0c             	sub    $0xc,%esp
c0107085:	68 d2 b6 10 c0       	push   $0xc010b6d2
c010708a:	e8 d9 15 00 00       	call   c0108668 <Printf>
c010708f:	83 c4 10             	add    $0x10,%esp
c0107092:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0107096:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010709a:	0f 8f 93 fd ff ff    	jg     c0106e33 <untar+0x54>
c01070a0:	eb 01                	jmp    c01070a3 <untar+0x2c4>
c01070a2:	90                   	nop
c01070a3:	83 ec 0c             	sub    $0xc,%esp
c01070a6:	68 df b6 10 c0       	push   $0xc010b6df
c01070ab:	e8 b8 15 00 00       	call   c0108668 <Printf>
c01070b0:	83 c4 10             	add    $0x10,%esp
c01070b3:	83 ec 0c             	sub    $0xc,%esp
c01070b6:	68 f1 b6 10 c0       	push   $0xc010b6f1
c01070bb:	e8 a8 15 00 00       	call   c0108668 <Printf>
c01070c0:	83 c4 10             	add    $0x10,%esp
c01070c3:	83 ec 0c             	sub    $0xc,%esp
c01070c6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01070c9:	e8 ec dd ff ff       	call   c0104eba <close>
c01070ce:	83 c4 10             	add    $0x10,%esp
c01070d1:	83 ec 0c             	sub    $0xc,%esp
c01070d4:	68 01 b7 10 c0       	push   $0xc010b701
c01070d9:	e8 8a 15 00 00       	call   c0108668 <Printf>
c01070de:	83 c4 10             	add    $0x10,%esp
c01070e1:	83 ec 0c             	sub    $0xc,%esp
c01070e4:	68 14 b7 10 c0       	push   $0xc010b714
c01070e9:	e8 7a 15 00 00       	call   c0108668 <Printf>
c01070ee:	83 c4 10             	add    $0x10,%esp
c01070f1:	90                   	nop
c01070f2:	c9                   	leave  
c01070f3:	c3                   	ret    

c01070f4 <atoi>:
c01070f4:	55                   	push   %ebp
c01070f5:	89 e5                	mov    %esp,%ebp
c01070f7:	83 ec 10             	sub    $0x10,%esp
c01070fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01070fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107100:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107103:	8d 50 01             	lea    0x1(%eax),%edx
c0107106:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107109:	c6 00 30             	movb   $0x30,(%eax)
c010710c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010710f:	8d 50 01             	lea    0x1(%eax),%edx
c0107112:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107115:	c6 00 78             	movb   $0x78,(%eax)
c0107118:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c010711c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0107120:	75 0e                	jne    c0107130 <atoi+0x3c>
c0107122:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107125:	8d 50 01             	lea    0x1(%eax),%edx
c0107128:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010712b:	c6 00 30             	movb   $0x30,(%eax)
c010712e:	eb 61                	jmp    c0107191 <atoi+0x9d>
c0107130:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0107137:	eb 52                	jmp    c010718b <atoi+0x97>
c0107139:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010713c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010713f:	89 c1                	mov    %eax,%ecx
c0107141:	d3 fa                	sar    %cl,%edx
c0107143:	89 d0                	mov    %edx,%eax
c0107145:	83 e0 0f             	and    $0xf,%eax
c0107148:	88 45 fb             	mov    %al,-0x5(%ebp)
c010714b:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c010714f:	75 06                	jne    c0107157 <atoi+0x63>
c0107151:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0107155:	74 2f                	je     c0107186 <atoi+0x92>
c0107157:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c010715b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010715f:	83 c0 30             	add    $0x30,%eax
c0107162:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107165:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0107169:	7e 0a                	jle    c0107175 <atoi+0x81>
c010716b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010716f:	83 c0 07             	add    $0x7,%eax
c0107172:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107175:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107178:	8d 50 01             	lea    0x1(%eax),%edx
c010717b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010717e:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0107182:	88 10                	mov    %dl,(%eax)
c0107184:	eb 01                	jmp    c0107187 <atoi+0x93>
c0107186:	90                   	nop
c0107187:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010718b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010718f:	79 a8                	jns    c0107139 <atoi+0x45>
c0107191:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107194:	c6 00 00             	movb   $0x0,(%eax)
c0107197:	90                   	nop
c0107198:	c9                   	leave  
c0107199:	c3                   	ret    

c010719a <disp_int>:
c010719a:	55                   	push   %ebp
c010719b:	89 e5                	mov    %esp,%ebp
c010719d:	83 ec 18             	sub    $0x18,%esp
c01071a0:	ff 75 08             	pushl  0x8(%ebp)
c01071a3:	8d 45 ee             	lea    -0x12(%ebp),%eax
c01071a6:	50                   	push   %eax
c01071a7:	e8 48 ff ff ff       	call   c01070f4 <atoi>
c01071ac:	83 c4 08             	add    $0x8,%esp
c01071af:	83 ec 08             	sub    $0x8,%esp
c01071b2:	6a 0b                	push   $0xb
c01071b4:	8d 45 ee             	lea    -0x12(%ebp),%eax
c01071b7:	50                   	push   %eax
c01071b8:	e8 0a 8f ff ff       	call   c01000c7 <disp_str_colour>
c01071bd:	83 c4 10             	add    $0x10,%esp
c01071c0:	90                   	nop
c01071c1:	c9                   	leave  
c01071c2:	c3                   	ret    

c01071c3 <do_page_fault>:
c01071c3:	55                   	push   %ebp
c01071c4:	89 e5                	mov    %esp,%ebp
c01071c6:	83 ec 28             	sub    $0x28,%esp
c01071c9:	0f 20 d0             	mov    %cr2,%eax
c01071cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01071cf:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01071d6:	00 00 00 
c01071d9:	83 ec 0c             	sub    $0xc,%esp
c01071dc:	68 1f b7 10 c0       	push   $0xc010b71f
c01071e1:	e8 a6 8e ff ff       	call   c010008c <disp_str>
c01071e6:	83 c4 10             	add    $0x10,%esp
c01071e9:	83 ec 0c             	sub    $0xc,%esp
c01071ec:	68 2e b7 10 c0       	push   $0xc010b72e
c01071f1:	e8 96 8e ff ff       	call   c010008c <disp_str>
c01071f6:	83 c4 10             	add    $0x10,%esp
c01071f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01071fc:	83 ec 0c             	sub    $0xc,%esp
c01071ff:	50                   	push   %eax
c0107200:	e8 95 ff ff ff       	call   c010719a <disp_int>
c0107205:	83 c4 10             	add    $0x10,%esp
c0107208:	83 ec 0c             	sub    $0xc,%esp
c010720b:	68 33 b7 10 c0       	push   $0xc010b733
c0107210:	e8 77 8e ff ff       	call   c010008c <disp_str>
c0107215:	83 c4 10             	add    $0x10,%esp
c0107218:	83 ec 0c             	sub    $0xc,%esp
c010721b:	ff 75 f4             	pushl  -0xc(%ebp)
c010721e:	e8 51 ec ff ff       	call   c0105e74 <ptr_pde>
c0107223:	83 c4 10             	add    $0x10,%esp
c0107226:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107229:	83 ec 0c             	sub    $0xc,%esp
c010722c:	ff 75 f4             	pushl  -0xc(%ebp)
c010722f:	e8 53 ec ff ff       	call   c0105e87 <ptr_pte>
c0107234:	83 c4 10             	add    $0x10,%esp
c0107237:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010723a:	83 ec 0c             	sub    $0xc,%esp
c010723d:	68 35 b7 10 c0       	push   $0xc010b735
c0107242:	e8 45 8e ff ff       	call   c010008c <disp_str>
c0107247:	83 c4 10             	add    $0x10,%esp
c010724a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010724d:	83 ec 0c             	sub    $0xc,%esp
c0107250:	50                   	push   %eax
c0107251:	e8 44 ff ff ff       	call   c010719a <disp_int>
c0107256:	83 c4 10             	add    $0x10,%esp
c0107259:	83 ec 0c             	sub    $0xc,%esp
c010725c:	68 3a b7 10 c0       	push   $0xc010b73a
c0107261:	e8 26 8e ff ff       	call   c010008c <disp_str>
c0107266:	83 c4 10             	add    $0x10,%esp
c0107269:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010726c:	8b 00                	mov    (%eax),%eax
c010726e:	83 ec 0c             	sub    $0xc,%esp
c0107271:	50                   	push   %eax
c0107272:	e8 23 ff ff ff       	call   c010719a <disp_int>
c0107277:	83 c4 10             	add    $0x10,%esp
c010727a:	83 ec 0c             	sub    $0xc,%esp
c010727d:	68 33 b7 10 c0       	push   $0xc010b733
c0107282:	e8 05 8e ff ff       	call   c010008c <disp_str>
c0107287:	83 c4 10             	add    $0x10,%esp
c010728a:	83 ec 0c             	sub    $0xc,%esp
c010728d:	68 43 b7 10 c0       	push   $0xc010b743
c0107292:	e8 f5 8d ff ff       	call   c010008c <disp_str>
c0107297:	83 c4 10             	add    $0x10,%esp
c010729a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010729d:	83 ec 0c             	sub    $0xc,%esp
c01072a0:	50                   	push   %eax
c01072a1:	e8 f4 fe ff ff       	call   c010719a <disp_int>
c01072a6:	83 c4 10             	add    $0x10,%esp
c01072a9:	83 ec 0c             	sub    $0xc,%esp
c01072ac:	68 48 b7 10 c0       	push   $0xc010b748
c01072b1:	e8 d6 8d ff ff       	call   c010008c <disp_str>
c01072b6:	83 c4 10             	add    $0x10,%esp
c01072b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01072bc:	8b 00                	mov    (%eax),%eax
c01072be:	83 ec 0c             	sub    $0xc,%esp
c01072c1:	50                   	push   %eax
c01072c2:	e8 d3 fe ff ff       	call   c010719a <disp_int>
c01072c7:	83 c4 10             	add    $0x10,%esp
c01072ca:	83 ec 0c             	sub    $0xc,%esp
c01072cd:	68 33 b7 10 c0       	push   $0xc010b733
c01072d2:	e8 b5 8d ff ff       	call   c010008c <disp_str>
c01072d7:	83 c4 10             	add    $0x10,%esp
c01072da:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c01072e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01072e4:	8b 00                	mov    (%eax),%eax
c01072e6:	83 e0 01             	and    $0x1,%eax
c01072e9:	85 c0                	test   %eax,%eax
c01072eb:	74 09                	je     c01072f6 <do_page_fault+0x133>
c01072ed:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c01072f4:	eb 07                	jmp    c01072fd <do_page_fault+0x13a>
c01072f6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01072fd:	90                   	nop
c01072fe:	c9                   	leave  
c01072ff:	c3                   	ret    

c0107300 <exception_handler>:
c0107300:	55                   	push   %ebp
c0107301:	89 e5                	mov    %esp,%ebp
c0107303:	57                   	push   %edi
c0107304:	56                   	push   %esi
c0107305:	53                   	push   %ebx
c0107306:	83 ec 6c             	sub    $0x6c,%esp
c0107309:	8d 45 8c             	lea    -0x74(%ebp),%eax
c010730c:	bb c0 b9 10 c0       	mov    $0xc010b9c0,%ebx
c0107311:	ba 13 00 00 00       	mov    $0x13,%edx
c0107316:	89 c7                	mov    %eax,%edi
c0107318:	89 de                	mov    %ebx,%esi
c010731a:	89 d1                	mov    %edx,%ecx
c010731c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010731e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107325:	eb 04                	jmp    c010732b <exception_handler+0x2b>
c0107327:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010732b:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0107332:	7e f3                	jle    c0107327 <exception_handler+0x27>
c0107334:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010733b:	00 00 00 
c010733e:	83 ec 0c             	sub    $0xc,%esp
c0107341:	68 51 b7 10 c0       	push   $0xc010b751
c0107346:	e8 41 8d ff ff       	call   c010008c <disp_str>
c010734b:	83 c4 10             	add    $0x10,%esp
c010734e:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107355:	8b 45 08             	mov    0x8(%ebp),%eax
c0107358:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c010735c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010735f:	83 ec 0c             	sub    $0xc,%esp
c0107362:	ff 75 dc             	pushl  -0x24(%ebp)
c0107365:	e8 22 8d ff ff       	call   c010008c <disp_str>
c010736a:	83 c4 10             	add    $0x10,%esp
c010736d:	83 ec 0c             	sub    $0xc,%esp
c0107370:	68 5f b7 10 c0       	push   $0xc010b75f
c0107375:	e8 12 8d ff ff       	call   c010008c <disp_str>
c010737a:	83 c4 10             	add    $0x10,%esp
c010737d:	83 ec 0c             	sub    $0xc,%esp
c0107380:	68 62 b7 10 c0       	push   $0xc010b762
c0107385:	e8 02 8d ff ff       	call   c010008c <disp_str>
c010738a:	83 c4 10             	add    $0x10,%esp
c010738d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107390:	83 ec 0c             	sub    $0xc,%esp
c0107393:	50                   	push   %eax
c0107394:	e8 01 fe ff ff       	call   c010719a <disp_int>
c0107399:	83 c4 10             	add    $0x10,%esp
c010739c:	83 ec 0c             	sub    $0xc,%esp
c010739f:	68 5f b7 10 c0       	push   $0xc010b75f
c01073a4:	e8 e3 8c ff ff       	call   c010008c <disp_str>
c01073a9:	83 c4 10             	add    $0x10,%esp
c01073ac:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c01073b0:	74 2f                	je     c01073e1 <exception_handler+0xe1>
c01073b2:	83 ec 0c             	sub    $0xc,%esp
c01073b5:	68 6a b7 10 c0       	push   $0xc010b76a
c01073ba:	e8 cd 8c ff ff       	call   c010008c <disp_str>
c01073bf:	83 c4 10             	add    $0x10,%esp
c01073c2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01073c5:	83 ec 0c             	sub    $0xc,%esp
c01073c8:	50                   	push   %eax
c01073c9:	e8 cc fd ff ff       	call   c010719a <disp_int>
c01073ce:	83 c4 10             	add    $0x10,%esp
c01073d1:	83 ec 0c             	sub    $0xc,%esp
c01073d4:	68 5f b7 10 c0       	push   $0xc010b75f
c01073d9:	e8 ae 8c ff ff       	call   c010008c <disp_str>
c01073de:	83 c4 10             	add    $0x10,%esp
c01073e1:	83 ec 0c             	sub    $0xc,%esp
c01073e4:	68 74 b7 10 c0       	push   $0xc010b774
c01073e9:	e8 9e 8c ff ff       	call   c010008c <disp_str>
c01073ee:	83 c4 10             	add    $0x10,%esp
c01073f1:	83 ec 0c             	sub    $0xc,%esp
c01073f4:	ff 75 14             	pushl  0x14(%ebp)
c01073f7:	e8 9e fd ff ff       	call   c010719a <disp_int>
c01073fc:	83 c4 10             	add    $0x10,%esp
c01073ff:	83 ec 0c             	sub    $0xc,%esp
c0107402:	68 5f b7 10 c0       	push   $0xc010b75f
c0107407:	e8 80 8c ff ff       	call   c010008c <disp_str>
c010740c:	83 c4 10             	add    $0x10,%esp
c010740f:	83 ec 0c             	sub    $0xc,%esp
c0107412:	68 78 b7 10 c0       	push   $0xc010b778
c0107417:	e8 70 8c ff ff       	call   c010008c <disp_str>
c010741c:	83 c4 10             	add    $0x10,%esp
c010741f:	8b 45 10             	mov    0x10(%ebp),%eax
c0107422:	83 ec 0c             	sub    $0xc,%esp
c0107425:	50                   	push   %eax
c0107426:	e8 6f fd ff ff       	call   c010719a <disp_int>
c010742b:	83 c4 10             	add    $0x10,%esp
c010742e:	83 ec 0c             	sub    $0xc,%esp
c0107431:	68 5f b7 10 c0       	push   $0xc010b75f
c0107436:	e8 51 8c ff ff       	call   c010008c <disp_str>
c010743b:	83 c4 10             	add    $0x10,%esp
c010743e:	83 ec 0c             	sub    $0xc,%esp
c0107441:	68 7d b7 10 c0       	push   $0xc010b77d
c0107446:	e8 41 8c ff ff       	call   c010008c <disp_str>
c010744b:	83 c4 10             	add    $0x10,%esp
c010744e:	83 ec 0c             	sub    $0xc,%esp
c0107451:	ff 75 18             	pushl  0x18(%ebp)
c0107454:	e8 41 fd ff ff       	call   c010719a <disp_int>
c0107459:	83 c4 10             	add    $0x10,%esp
c010745c:	83 ec 0c             	sub    $0xc,%esp
c010745f:	68 5f b7 10 c0       	push   $0xc010b75f
c0107464:	e8 23 8c ff ff       	call   c010008c <disp_str>
c0107469:	83 c4 10             	add    $0x10,%esp
c010746c:	83 ec 0c             	sub    $0xc,%esp
c010746f:	68 88 b7 10 c0       	push   $0xc010b788
c0107474:	e8 13 8c ff ff       	call   c010008c <disp_str>
c0107479:	83 c4 10             	add    $0x10,%esp
c010747c:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0107480:	75 45                	jne    c01074c7 <exception_handler+0x1c7>
c0107482:	0f 20 d0             	mov    %cr2,%eax
c0107485:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107488:	83 ec 0c             	sub    $0xc,%esp
c010748b:	68 a7 b7 10 c0       	push   $0xc010b7a7
c0107490:	e8 f7 8b ff ff       	call   c010008c <disp_str>
c0107495:	83 c4 10             	add    $0x10,%esp
c0107498:	83 ec 0c             	sub    $0xc,%esp
c010749b:	68 2e b7 10 c0       	push   $0xc010b72e
c01074a0:	e8 e7 8b ff ff       	call   c010008c <disp_str>
c01074a5:	83 c4 10             	add    $0x10,%esp
c01074a8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01074ab:	83 ec 0c             	sub    $0xc,%esp
c01074ae:	50                   	push   %eax
c01074af:	e8 e6 fc ff ff       	call   c010719a <disp_int>
c01074b4:	83 c4 10             	add    $0x10,%esp
c01074b7:	83 ec 0c             	sub    $0xc,%esp
c01074ba:	68 33 b7 10 c0       	push   $0xc010b733
c01074bf:	e8 c8 8b ff ff       	call   c010008c <disp_str>
c01074c4:	83 c4 10             	add    $0x10,%esp
c01074c7:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c01074cb:	75 11                	jne    c01074de <exception_handler+0x1de>
c01074cd:	83 ec 0c             	sub    $0xc,%esp
c01074d0:	68 b3 b7 10 c0       	push   $0xc010b7b3
c01074d5:	e8 b2 8b ff ff       	call   c010008c <disp_str>
c01074da:	83 c4 10             	add    $0x10,%esp
c01074dd:	90                   	nop
c01074de:	90                   	nop
c01074df:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01074e2:	5b                   	pop    %ebx
c01074e3:	5e                   	pop    %esi
c01074e4:	5f                   	pop    %edi
c01074e5:	5d                   	pop    %ebp
c01074e6:	c3                   	ret    

c01074e7 <init_internal_interrupt>:
c01074e7:	55                   	push   %ebp
c01074e8:	89 e5                	mov    %esp,%ebp
c01074ea:	83 ec 08             	sub    $0x8,%esp
c01074ed:	6a 0e                	push   $0xe
c01074ef:	6a 08                	push   $0x8
c01074f1:	68 03 01 10 c0       	push   $0xc0100103
c01074f6:	6a 00                	push   $0x0
c01074f8:	e8 62 c7 ff ff       	call   c0103c5f <InitInterruptDesc>
c01074fd:	83 c4 10             	add    $0x10,%esp
c0107500:	6a 0e                	push   $0xe
c0107502:	6a 08                	push   $0x8
c0107504:	68 09 01 10 c0       	push   $0xc0100109
c0107509:	6a 01                	push   $0x1
c010750b:	e8 4f c7 ff ff       	call   c0103c5f <InitInterruptDesc>
c0107510:	83 c4 10             	add    $0x10,%esp
c0107513:	6a 0e                	push   $0xe
c0107515:	6a 08                	push   $0x8
c0107517:	68 0f 01 10 c0       	push   $0xc010010f
c010751c:	6a 02                	push   $0x2
c010751e:	e8 3c c7 ff ff       	call   c0103c5f <InitInterruptDesc>
c0107523:	83 c4 10             	add    $0x10,%esp
c0107526:	6a 0e                	push   $0xe
c0107528:	6a 08                	push   $0x8
c010752a:	68 15 01 10 c0       	push   $0xc0100115
c010752f:	6a 03                	push   $0x3
c0107531:	e8 29 c7 ff ff       	call   c0103c5f <InitInterruptDesc>
c0107536:	83 c4 10             	add    $0x10,%esp
c0107539:	6a 0e                	push   $0xe
c010753b:	6a 08                	push   $0x8
c010753d:	68 1b 01 10 c0       	push   $0xc010011b
c0107542:	6a 04                	push   $0x4
c0107544:	e8 16 c7 ff ff       	call   c0103c5f <InitInterruptDesc>
c0107549:	83 c4 10             	add    $0x10,%esp
c010754c:	6a 0e                	push   $0xe
c010754e:	6a 08                	push   $0x8
c0107550:	68 21 01 10 c0       	push   $0xc0100121
c0107555:	6a 05                	push   $0x5
c0107557:	e8 03 c7 ff ff       	call   c0103c5f <InitInterruptDesc>
c010755c:	83 c4 10             	add    $0x10,%esp
c010755f:	6a 0e                	push   $0xe
c0107561:	6a 08                	push   $0x8
c0107563:	68 27 01 10 c0       	push   $0xc0100127
c0107568:	6a 06                	push   $0x6
c010756a:	e8 f0 c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c010756f:	83 c4 10             	add    $0x10,%esp
c0107572:	6a 0e                	push   $0xe
c0107574:	6a 08                	push   $0x8
c0107576:	68 2d 01 10 c0       	push   $0xc010012d
c010757b:	6a 07                	push   $0x7
c010757d:	e8 dd c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c0107582:	83 c4 10             	add    $0x10,%esp
c0107585:	6a 0e                	push   $0xe
c0107587:	6a 08                	push   $0x8
c0107589:	68 33 01 10 c0       	push   $0xc0100133
c010758e:	6a 08                	push   $0x8
c0107590:	e8 ca c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c0107595:	83 c4 10             	add    $0x10,%esp
c0107598:	6a 0e                	push   $0xe
c010759a:	6a 08                	push   $0x8
c010759c:	68 37 01 10 c0       	push   $0xc0100137
c01075a1:	6a 09                	push   $0x9
c01075a3:	e8 b7 c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c01075a8:	83 c4 10             	add    $0x10,%esp
c01075ab:	6a 0e                	push   $0xe
c01075ad:	6a 08                	push   $0x8
c01075af:	68 3d 01 10 c0       	push   $0xc010013d
c01075b4:	6a 0a                	push   $0xa
c01075b6:	e8 a4 c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c01075bb:	83 c4 10             	add    $0x10,%esp
c01075be:	6a 0e                	push   $0xe
c01075c0:	6a 08                	push   $0x8
c01075c2:	68 41 01 10 c0       	push   $0xc0100141
c01075c7:	6a 0b                	push   $0xb
c01075c9:	e8 91 c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c01075ce:	83 c4 10             	add    $0x10,%esp
c01075d1:	6a 0e                	push   $0xe
c01075d3:	6a 08                	push   $0x8
c01075d5:	68 45 01 10 c0       	push   $0xc0100145
c01075da:	6a 0c                	push   $0xc
c01075dc:	e8 7e c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c01075e1:	83 c4 10             	add    $0x10,%esp
c01075e4:	6a 0e                	push   $0xe
c01075e6:	6a 08                	push   $0x8
c01075e8:	68 49 01 10 c0       	push   $0xc0100149
c01075ed:	6a 0d                	push   $0xd
c01075ef:	e8 6b c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c01075f4:	83 c4 10             	add    $0x10,%esp
c01075f7:	6a 0e                	push   $0xe
c01075f9:	6a 08                	push   $0x8
c01075fb:	68 54 01 10 c0       	push   $0xc0100154
c0107600:	6a 0e                	push   $0xe
c0107602:	e8 58 c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c0107607:	83 c4 10             	add    $0x10,%esp
c010760a:	6a 0e                	push   $0xe
c010760c:	6a 08                	push   $0x8
c010760e:	68 58 01 10 c0       	push   $0xc0100158
c0107613:	6a 10                	push   $0x10
c0107615:	e8 45 c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c010761a:	83 c4 10             	add    $0x10,%esp
c010761d:	6a 0e                	push   $0xe
c010761f:	6a 08                	push   $0x8
c0107621:	68 5e 01 10 c0       	push   $0xc010015e
c0107626:	6a 11                	push   $0x11
c0107628:	e8 32 c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c010762d:	83 c4 10             	add    $0x10,%esp
c0107630:	6a 0e                	push   $0xe
c0107632:	6a 08                	push   $0x8
c0107634:	68 62 01 10 c0       	push   $0xc0100162
c0107639:	6a 12                	push   $0x12
c010763b:	e8 1f c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c0107640:	83 c4 10             	add    $0x10,%esp
c0107643:	6a 0e                	push   $0xe
c0107645:	6a 0e                	push   $0xe
c0107647:	68 6c 02 10 c0       	push   $0xc010026c
c010764c:	68 90 00 00 00       	push   $0x90
c0107651:	e8 09 c6 ff ff       	call   c0103c5f <InitInterruptDesc>
c0107656:	83 c4 10             	add    $0x10,%esp
c0107659:	90                   	nop
c010765a:	c9                   	leave  
c010765b:	c3                   	ret    

c010765c <spurious_irq>:
c010765c:	55                   	push   %ebp
c010765d:	89 e5                	mov    %esp,%ebp
c010765f:	83 ec 08             	sub    $0x8,%esp
c0107662:	83 ec 08             	sub    $0x8,%esp
c0107665:	6a 0b                	push   $0xb
c0107667:	68 0c ba 10 c0       	push   $0xc010ba0c
c010766c:	e8 56 8a ff ff       	call   c01000c7 <disp_str_colour>
c0107671:	83 c4 10             	add    $0x10,%esp
c0107674:	83 ec 0c             	sub    $0xc,%esp
c0107677:	ff 75 08             	pushl  0x8(%ebp)
c010767a:	e8 1b fb ff ff       	call   c010719a <disp_int>
c010767f:	83 c4 10             	add    $0x10,%esp
c0107682:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107687:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010768d:	83 c0 01             	add    $0x1,%eax
c0107690:	83 d2 00             	adc    $0x0,%edx
c0107693:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107698:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010769e:	83 ec 0c             	sub    $0xc,%esp
c01076a1:	68 20 b6 10 c0       	push   $0xc010b620
c01076a6:	e8 e1 89 ff ff       	call   c010008c <disp_str>
c01076ab:	83 c4 10             	add    $0x10,%esp
c01076ae:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01076b3:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01076b9:	83 ec 0c             	sub    $0xc,%esp
c01076bc:	50                   	push   %eax
c01076bd:	e8 d8 fa ff ff       	call   c010719a <disp_int>
c01076c2:	83 c4 10             	add    $0x10,%esp
c01076c5:	83 ec 0c             	sub    $0xc,%esp
c01076c8:	68 22 b6 10 c0       	push   $0xc010b622
c01076cd:	e8 ba 89 ff ff       	call   c010008c <disp_str>
c01076d2:	83 c4 10             	add    $0x10,%esp
c01076d5:	83 ec 08             	sub    $0x8,%esp
c01076d8:	6a 0c                	push   $0xc
c01076da:	68 34 ba 10 c0       	push   $0xc010ba34
c01076df:	e8 e3 89 ff ff       	call   c01000c7 <disp_str_colour>
c01076e4:	83 c4 10             	add    $0x10,%esp
c01076e7:	90                   	nop
c01076e8:	c9                   	leave  
c01076e9:	c3                   	ret    

c01076ea <init_keyboard>:
c01076ea:	55                   	push   %ebp
c01076eb:	89 e5                	mov    %esp,%ebp
c01076ed:	83 ec 08             	sub    $0x8,%esp
c01076f0:	83 ec 04             	sub    $0x4,%esp
c01076f3:	68 00 02 00 00       	push   $0x200
c01076f8:	6a 00                	push   $0x0
c01076fa:	68 ec fb 10 c0       	push   $0xc010fbec
c01076ff:	e8 eb 4a 00 00       	call   c010c1ef <Memset>
c0107704:	83 c4 10             	add    $0x10,%esp
c0107707:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010770e:	fb 10 c0 
c0107711:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107716:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010771b:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c0107722:	00 00 00 
c0107725:	e8 4f d3 ff ff       	call   c0104a79 <init_keyboard_handler>
c010772a:	90                   	nop
c010772b:	c9                   	leave  
c010772c:	c3                   	ret    

c010772d <TestTTY>:
c010772d:	55                   	push   %ebp
c010772e:	89 e5                	mov    %esp,%ebp
c0107730:	83 ec 28             	sub    $0x28,%esp
c0107733:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c010773a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107741:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107747:	83 ec 08             	sub    $0x8,%esp
c010774a:	6a 02                	push   $0x2
c010774c:	8d 45 de             	lea    -0x22(%ebp),%eax
c010774f:	50                   	push   %eax
c0107750:	e8 ca d4 ff ff       	call   c0104c1f <open>
c0107755:	83 c4 10             	add    $0x10,%esp
c0107758:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010775b:	83 ec 08             	sub    $0x8,%esp
c010775e:	6a 02                	push   $0x2
c0107760:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107763:	50                   	push   %eax
c0107764:	e8 b6 d4 ff ff       	call   c0104c1f <open>
c0107769:	83 c4 10             	add    $0x10,%esp
c010776c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010776f:	83 ec 0c             	sub    $0xc,%esp
c0107772:	68 59 ba 10 c0       	push   $0xc010ba59
c0107777:	e8 ec 0e 00 00       	call   c0108668 <Printf>
c010777c:	83 c4 10             	add    $0x10,%esp
c010777f:	83 ec 0c             	sub    $0xc,%esp
c0107782:	6a 0a                	push   $0xa
c0107784:	e8 73 9f ff ff       	call   c01016fc <sys_malloc>
c0107789:	83 c4 10             	add    $0x10,%esp
c010778c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010778f:	83 ec 04             	sub    $0x4,%esp
c0107792:	6a 0a                	push   $0xa
c0107794:	6a 00                	push   $0x0
c0107796:	ff 75 ec             	pushl  -0x14(%ebp)
c0107799:	e8 51 4a 00 00       	call   c010c1ef <Memset>
c010779e:	83 c4 10             	add    $0x10,%esp
c01077a1:	83 ec 04             	sub    $0x4,%esp
c01077a4:	6a 0a                	push   $0xa
c01077a6:	ff 75 ec             	pushl  -0x14(%ebp)
c01077a9:	ff 75 f0             	pushl  -0x10(%ebp)
c01077ac:	e8 03 d5 ff ff       	call   c0104cb4 <read>
c01077b1:	83 c4 10             	add    $0x10,%esp
c01077b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01077b7:	83 ec 08             	sub    $0x8,%esp
c01077ba:	ff 75 ec             	pushl  -0x14(%ebp)
c01077bd:	68 6b ba 10 c0       	push   $0xc010ba6b
c01077c2:	e8 a1 0e 00 00       	call   c0108668 <Printf>
c01077c7:	83 c4 10             	add    $0x10,%esp
c01077ca:	eb c3                	jmp    c010778f <TestTTY+0x62>

c01077cc <TestReadReturnValue>:
c01077cc:	55                   	push   %ebp
c01077cd:	89 e5                	mov    %esp,%ebp
c01077cf:	81 ec 18 02 00 00    	sub    $0x218,%esp
c01077d5:	c7 45 f4 75 ba 10 c0 	movl   $0xc010ba75,-0xc(%ebp)
c01077dc:	83 ec 08             	sub    $0x8,%esp
c01077df:	6a 00                	push   $0x0
c01077e1:	ff 75 f4             	pushl  -0xc(%ebp)
c01077e4:	e8 36 d4 ff ff       	call   c0104c1f <open>
c01077e9:	83 c4 10             	add    $0x10,%esp
c01077ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01077ef:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01077f6:	83 ec 04             	sub    $0x4,%esp
c01077f9:	68 cb 00 00 00       	push   $0xcb
c01077fe:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0107804:	50                   	push   %eax
c0107805:	ff 75 f0             	pushl  -0x10(%ebp)
c0107808:	e8 a7 d4 ff ff       	call   c0104cb4 <read>
c010780d:	83 c4 10             	add    $0x10,%esp
c0107810:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107813:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c010781a:	74 1c                	je     c0107838 <TestReadReturnValue+0x6c>
c010781c:	68 08 02 00 00       	push   $0x208
c0107821:	68 81 ba 10 c0       	push   $0xc010ba81
c0107826:	68 81 ba 10 c0       	push   $0xc010ba81
c010782b:	68 91 ba 10 c0       	push   $0xc010ba91
c0107830:	e8 90 11 00 00       	call   c01089c5 <assertion_failure>
c0107835:	83 c4 10             	add    $0x10,%esp
c0107838:	83 ec 0c             	sub    $0xc,%esp
c010783b:	ff 75 f0             	pushl  -0x10(%ebp)
c010783e:	e8 77 d6 ff ff       	call   c0104eba <close>
c0107843:	83 c4 10             	add    $0x10,%esp
c0107846:	90                   	nop
c0107847:	c9                   	leave  
c0107848:	c3                   	ret    

c0107849 <TestWriteReturnValue>:
c0107849:	55                   	push   %ebp
c010784a:	89 e5                	mov    %esp,%ebp
c010784c:	81 ec 28 02 00 00    	sub    $0x228,%esp
c0107852:	c7 45 f4 9c ba 10 c0 	movl   $0xc010ba9c,-0xc(%ebp)
c0107859:	83 ec 08             	sub    $0x8,%esp
c010785c:	6a 07                	push   $0x7
c010785e:	ff 75 f4             	pushl  -0xc(%ebp)
c0107861:	e8 b9 d3 ff ff       	call   c0104c1f <open>
c0107866:	83 c4 10             	add    $0x10,%esp
c0107869:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010786c:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c0107870:	75 1c                	jne    c010788e <TestWriteReturnValue+0x45>
c0107872:	68 12 02 00 00       	push   $0x212
c0107877:	68 81 ba 10 c0       	push   $0xc010ba81
c010787c:	68 81 ba 10 c0       	push   $0xc010ba81
c0107881:	68 a9 ba 10 c0       	push   $0xc010baa9
c0107886:	e8 3a 11 00 00       	call   c01089c5 <assertion_failure>
c010788b:	83 c4 10             	add    $0x10,%esp
c010788e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107895:	c7 45 e8 b4 ba 10 c0 	movl   $0xc010bab4,-0x18(%ebp)
c010789c:	83 ec 0c             	sub    $0xc,%esp
c010789f:	ff 75 e8             	pushl  -0x18(%ebp)
c01078a2:	e8 81 49 00 00       	call   c010c228 <Strlen>
c01078a7:	83 c4 10             	add    $0x10,%esp
c01078aa:	83 ec 04             	sub    $0x4,%esp
c01078ad:	50                   	push   %eax
c01078ae:	ff 75 e8             	pushl  -0x18(%ebp)
c01078b1:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01078b7:	50                   	push   %eax
c01078b8:	e8 ef f4 ff ff       	call   c0106dac <Memcpy>
c01078bd:	83 c4 10             	add    $0x10,%esp
c01078c0:	83 ec 04             	sub    $0x4,%esp
c01078c3:	68 ff 01 00 00       	push   $0x1ff
c01078c8:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01078ce:	50                   	push   %eax
c01078cf:	ff 75 f0             	pushl  -0x10(%ebp)
c01078d2:	e8 5e d5 ff ff       	call   c0104e35 <write>
c01078d7:	83 c4 10             	add    $0x10,%esp
c01078da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01078dd:	83 ec 0c             	sub    $0xc,%esp
c01078e0:	ff 75 e8             	pushl  -0x18(%ebp)
c01078e3:	e8 40 49 00 00       	call   c010c228 <Strlen>
c01078e8:	83 c4 10             	add    $0x10,%esp
c01078eb:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01078ee:	74 1c                	je     c010790c <TestWriteReturnValue+0xc3>
c01078f0:	68 1c 02 00 00       	push   $0x21c
c01078f5:	68 81 ba 10 c0       	push   $0xc010ba81
c01078fa:	68 81 ba 10 c0       	push   $0xc010ba81
c01078ff:	68 e7 ba 10 c0       	push   $0xc010bae7
c0107904:	e8 bc 10 00 00       	call   c01089c5 <assertion_failure>
c0107909:	83 c4 10             	add    $0x10,%esp
c010790c:	83 ec 0c             	sub    $0xc,%esp
c010790f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107912:	e8 a3 d5 ff ff       	call   c0104eba <close>
c0107917:	83 c4 10             	add    $0x10,%esp
c010791a:	90                   	nop
c010791b:	c9                   	leave  
c010791c:	c3                   	ret    

c010791d <TestFS2>:
c010791d:	55                   	push   %ebp
c010791e:	89 e5                	mov    %esp,%ebp
c0107920:	83 ec 08             	sub    $0x8,%esp
c0107923:	e8 21 ff ff ff       	call   c0107849 <TestWriteReturnValue>
c0107928:	90                   	nop
c0107929:	c9                   	leave  
c010792a:	c3                   	ret    

c010792b <TestFS>:
c010792b:	55                   	push   %ebp
c010792c:	89 e5                	mov    %esp,%ebp
c010792e:	57                   	push   %edi
c010792f:	56                   	push   %esi
c0107930:	53                   	push   %ebx
c0107931:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c0107937:	83 ec 0c             	sub    $0xc,%esp
c010793a:	68 fa ba 10 c0       	push   $0xc010bafa
c010793f:	e8 48 87 ff ff       	call   c010008c <disp_str>
c0107944:	83 c4 10             	add    $0x10,%esp
c0107947:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c010794e:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107955:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c010795b:	83 ec 08             	sub    $0x8,%esp
c010795e:	6a 02                	push   $0x2
c0107960:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107963:	50                   	push   %eax
c0107964:	e8 b6 d2 ff ff       	call   c0104c1f <open>
c0107969:	83 c4 10             	add    $0x10,%esp
c010796c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010796f:	83 ec 08             	sub    $0x8,%esp
c0107972:	6a 02                	push   $0x2
c0107974:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107977:	50                   	push   %eax
c0107978:	e8 a2 d2 ff ff       	call   c0104c1f <open>
c010797d:	83 c4 10             	add    $0x10,%esp
c0107980:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107983:	83 ec 0c             	sub    $0xc,%esp
c0107986:	68 59 ba 10 c0       	push   $0xc010ba59
c010798b:	e8 d8 0c 00 00       	call   c0108668 <Printf>
c0107990:	83 c4 10             	add    $0x10,%esp
c0107993:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c010799a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c010799e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c01079a5:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c01079a9:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c01079b0:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c01079b7:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c01079bd:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c01079c4:	83 ec 0c             	sub    $0xc,%esp
c01079c7:	68 02 bb 10 c0       	push   $0xc010bb02
c01079cc:	e8 97 0c 00 00       	call   c0108668 <Printf>
c01079d1:	83 c4 10             	add    $0x10,%esp
c01079d4:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c01079d8:	0f 85 e6 03 00 00    	jne    c0107dc4 <TestFS+0x499>
c01079de:	83 ec 08             	sub    $0x8,%esp
c01079e1:	6a 07                	push   $0x7
c01079e3:	8d 45 a9             	lea    -0x57(%ebp),%eax
c01079e6:	50                   	push   %eax
c01079e7:	e8 33 d2 ff ff       	call   c0104c1f <open>
c01079ec:	83 c4 10             	add    $0x10,%esp
c01079ef:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01079f2:	83 ec 08             	sub    $0x8,%esp
c01079f5:	ff 75 d0             	pushl  -0x30(%ebp)
c01079f8:	68 1a bb 10 c0       	push   $0xc010bb1a
c01079fd:	e8 66 0c 00 00       	call   c0108668 <Printf>
c0107a02:	83 c4 10             	add    $0x10,%esp
c0107a05:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107a0c:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107a13:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c0107a1a:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107a21:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107a28:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c0107a2f:	83 ec 0c             	sub    $0xc,%esp
c0107a32:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107a35:	50                   	push   %eax
c0107a36:	e8 ed 47 00 00       	call   c010c228 <Strlen>
c0107a3b:	83 c4 10             	add    $0x10,%esp
c0107a3e:	83 ec 04             	sub    $0x4,%esp
c0107a41:	50                   	push   %eax
c0107a42:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107a45:	50                   	push   %eax
c0107a46:	ff 75 d0             	pushl  -0x30(%ebp)
c0107a49:	e8 e7 d3 ff ff       	call   c0104e35 <write>
c0107a4e:	83 c4 10             	add    $0x10,%esp
c0107a51:	83 ec 0c             	sub    $0xc,%esp
c0107a54:	ff 75 d0             	pushl  -0x30(%ebp)
c0107a57:	e8 5e d4 ff ff       	call   c0104eba <close>
c0107a5c:	83 c4 10             	add    $0x10,%esp
c0107a5f:	83 ec 08             	sub    $0x8,%esp
c0107a62:	6a 00                	push   $0x0
c0107a64:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107a67:	50                   	push   %eax
c0107a68:	e8 b2 d1 ff ff       	call   c0104c1f <open>
c0107a6d:	83 c4 10             	add    $0x10,%esp
c0107a70:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107a73:	83 ec 04             	sub    $0x4,%esp
c0107a76:	6a 14                	push   $0x14
c0107a78:	6a 00                	push   $0x0
c0107a7a:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a80:	50                   	push   %eax
c0107a81:	e8 69 47 00 00       	call   c010c1ef <Memset>
c0107a86:	83 c4 10             	add    $0x10,%esp
c0107a89:	83 ec 04             	sub    $0x4,%esp
c0107a8c:	6a 12                	push   $0x12
c0107a8e:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107a94:	50                   	push   %eax
c0107a95:	ff 75 d0             	pushl  -0x30(%ebp)
c0107a98:	e8 17 d2 ff ff       	call   c0104cb4 <read>
c0107a9d:	83 c4 10             	add    $0x10,%esp
c0107aa0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107aa3:	83 ec 08             	sub    $0x8,%esp
c0107aa6:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107aac:	50                   	push   %eax
c0107aad:	68 23 bb 10 c0       	push   $0xc010bb23
c0107ab2:	e8 b1 0b 00 00       	call   c0108668 <Printf>
c0107ab7:	83 c4 10             	add    $0x10,%esp
c0107aba:	83 ec 0c             	sub    $0xc,%esp
c0107abd:	6a 0a                	push   $0xa
c0107abf:	e8 70 0a 00 00       	call   c0108534 <delay>
c0107ac4:	83 c4 10             	add    $0x10,%esp
c0107ac7:	83 ec 08             	sub    $0x8,%esp
c0107aca:	6a 07                	push   $0x7
c0107acc:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107acf:	50                   	push   %eax
c0107ad0:	e8 4a d1 ff ff       	call   c0104c1f <open>
c0107ad5:	83 c4 10             	add    $0x10,%esp
c0107ad8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107adb:	83 ec 08             	sub    $0x8,%esp
c0107ade:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ae1:	68 2e bb 10 c0       	push   $0xc010bb2e
c0107ae6:	e8 7d 0b 00 00       	call   c0108668 <Printf>
c0107aeb:	83 c4 10             	add    $0x10,%esp
c0107aee:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107af5:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107afb:	bb 64 bb 10 c0       	mov    $0xc010bb64,%ebx
c0107b00:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107b05:	8b 0b                	mov    (%ebx),%ecx
c0107b07:	89 08                	mov    %ecx,(%eax)
c0107b09:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107b0d:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107b11:	8d 78 04             	lea    0x4(%eax),%edi
c0107b14:	83 e7 fc             	and    $0xfffffffc,%edi
c0107b17:	29 f8                	sub    %edi,%eax
c0107b19:	29 c3                	sub    %eax,%ebx
c0107b1b:	01 c2                	add    %eax,%edx
c0107b1d:	83 e2 fc             	and    $0xfffffffc,%edx
c0107b20:	89 d0                	mov    %edx,%eax
c0107b22:	c1 e8 02             	shr    $0x2,%eax
c0107b25:	89 de                	mov    %ebx,%esi
c0107b27:	89 c1                	mov    %eax,%ecx
c0107b29:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107b2b:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107b32:	00 00 00 
c0107b35:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107b3c:	00 00 00 
c0107b3f:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107b46:	83 ec 0c             	sub    $0xc,%esp
c0107b49:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107b4f:	50                   	push   %eax
c0107b50:	e8 d3 46 00 00       	call   c010c228 <Strlen>
c0107b55:	83 c4 10             	add    $0x10,%esp
c0107b58:	83 ec 04             	sub    $0x4,%esp
c0107b5b:	50                   	push   %eax
c0107b5c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107b62:	50                   	push   %eax
c0107b63:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b66:	e8 ca d2 ff ff       	call   c0104e35 <write>
c0107b6b:	83 c4 10             	add    $0x10,%esp
c0107b6e:	83 ec 0c             	sub    $0xc,%esp
c0107b71:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b74:	e8 41 d3 ff ff       	call   c0104eba <close>
c0107b79:	83 c4 10             	add    $0x10,%esp
c0107b7c:	83 ec 08             	sub    $0x8,%esp
c0107b7f:	6a 00                	push   $0x0
c0107b81:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107b84:	50                   	push   %eax
c0107b85:	e8 95 d0 ff ff       	call   c0104c1f <open>
c0107b8a:	83 c4 10             	add    $0x10,%esp
c0107b8d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107b90:	83 ec 04             	sub    $0x4,%esp
c0107b93:	68 c8 00 00 00       	push   $0xc8
c0107b98:	6a 00                	push   $0x0
c0107b9a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107ba0:	50                   	push   %eax
c0107ba1:	e8 49 46 00 00       	call   c010c1ef <Memset>
c0107ba6:	83 c4 10             	add    $0x10,%esp
c0107ba9:	83 ec 0c             	sub    $0xc,%esp
c0107bac:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107bb2:	50                   	push   %eax
c0107bb3:	e8 70 46 00 00       	call   c010c228 <Strlen>
c0107bb8:	83 c4 10             	add    $0x10,%esp
c0107bbb:	83 ec 04             	sub    $0x4,%esp
c0107bbe:	50                   	push   %eax
c0107bbf:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107bc5:	50                   	push   %eax
c0107bc6:	ff 75 c8             	pushl  -0x38(%ebp)
c0107bc9:	e8 e6 d0 ff ff       	call   c0104cb4 <read>
c0107bce:	83 c4 10             	add    $0x10,%esp
c0107bd1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107bd4:	83 ec 08             	sub    $0x8,%esp
c0107bd7:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107bdd:	50                   	push   %eax
c0107bde:	68 38 bb 10 c0       	push   $0xc010bb38
c0107be3:	e8 80 0a 00 00       	call   c0108668 <Printf>
c0107be8:	83 c4 10             	add    $0x10,%esp
c0107beb:	83 ec 08             	sub    $0x8,%esp
c0107bee:	6a 07                	push   $0x7
c0107bf0:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107bf3:	50                   	push   %eax
c0107bf4:	e8 26 d0 ff ff       	call   c0104c1f <open>
c0107bf9:	83 c4 10             	add    $0x10,%esp
c0107bfc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107bff:	83 ec 08             	sub    $0x8,%esp
c0107c02:	ff 75 c8             	pushl  -0x38(%ebp)
c0107c05:	68 2e bb 10 c0       	push   $0xc010bb2e
c0107c0a:	e8 59 0a 00 00       	call   c0108668 <Printf>
c0107c0f:	83 c4 10             	add    $0x10,%esp
c0107c12:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107c19:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107c20:	20 77 69 
c0107c23:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107c2a:	6c 20 73 
c0107c2d:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107c34:	63 63 65 
c0107c37:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107c3e:	73 20 61 
c0107c41:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107c48:	20 6c 61 
c0107c4b:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107c52:	74 2e 00 
c0107c55:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107c5c:	00 00 00 
c0107c5f:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107c66:	00 00 
c0107c68:	83 ec 0c             	sub    $0xc,%esp
c0107c6b:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107c71:	50                   	push   %eax
c0107c72:	e8 b1 45 00 00       	call   c010c228 <Strlen>
c0107c77:	83 c4 10             	add    $0x10,%esp
c0107c7a:	83 ec 04             	sub    $0x4,%esp
c0107c7d:	50                   	push   %eax
c0107c7e:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107c84:	50                   	push   %eax
c0107c85:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c88:	e8 a8 d1 ff ff       	call   c0104e35 <write>
c0107c8d:	83 c4 10             	add    $0x10,%esp
c0107c90:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107c97:	eb 7e                	jmp    c0107d17 <TestFS+0x3ec>
c0107c99:	83 ec 0c             	sub    $0xc,%esp
c0107c9c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c9f:	e8 16 d2 ff ff       	call   c0104eba <close>
c0107ca4:	83 c4 10             	add    $0x10,%esp
c0107ca7:	83 ec 08             	sub    $0x8,%esp
c0107caa:	6a 00                	push   $0x0
c0107cac:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107caf:	50                   	push   %eax
c0107cb0:	e8 6a cf ff ff       	call   c0104c1f <open>
c0107cb5:	83 c4 10             	add    $0x10,%esp
c0107cb8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107cbb:	83 ec 04             	sub    $0x4,%esp
c0107cbe:	6a 1e                	push   $0x1e
c0107cc0:	6a 00                	push   $0x0
c0107cc2:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107cc8:	50                   	push   %eax
c0107cc9:	e8 21 45 00 00       	call   c010c1ef <Memset>
c0107cce:	83 c4 10             	add    $0x10,%esp
c0107cd1:	83 ec 0c             	sub    $0xc,%esp
c0107cd4:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107cda:	50                   	push   %eax
c0107cdb:	e8 48 45 00 00       	call   c010c228 <Strlen>
c0107ce0:	83 c4 10             	add    $0x10,%esp
c0107ce3:	83 ec 04             	sub    $0x4,%esp
c0107ce6:	50                   	push   %eax
c0107ce7:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107ced:	50                   	push   %eax
c0107cee:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107cf1:	e8 be cf ff ff       	call   c0104cb4 <read>
c0107cf6:	83 c4 10             	add    $0x10,%esp
c0107cf9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107cfc:	83 ec 08             	sub    $0x8,%esp
c0107cff:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107d05:	50                   	push   %eax
c0107d06:	68 43 bb 10 c0       	push   $0xc010bb43
c0107d0b:	e8 58 09 00 00       	call   c0108668 <Printf>
c0107d10:	83 c4 10             	add    $0x10,%esp
c0107d13:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107d17:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107d1b:	0f 8e 78 ff ff ff    	jle    c0107c99 <TestFS+0x36e>
c0107d21:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107d28:	6e 73 74 
c0107d2b:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107d32:	6c 6c 2e 
c0107d35:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107d3c:	61 72 00 
c0107d3f:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107d46:	00 00 00 
c0107d49:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107d50:	00 00 00 
c0107d53:	83 ec 08             	sub    $0x8,%esp
c0107d56:	6a 00                	push   $0x0
c0107d58:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107d5e:	50                   	push   %eax
c0107d5f:	e8 bb ce ff ff       	call   c0104c1f <open>
c0107d64:	83 c4 10             	add    $0x10,%esp
c0107d67:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107d6a:	83 ec 08             	sub    $0x8,%esp
c0107d6d:	ff 75 bc             	pushl  -0x44(%ebp)
c0107d70:	68 4e bb 10 c0       	push   $0xc010bb4e
c0107d75:	e8 ee 08 00 00       	call   c0108668 <Printf>
c0107d7a:	83 c4 10             	add    $0x10,%esp
c0107d7d:	83 ec 04             	sub    $0x4,%esp
c0107d80:	6a 28                	push   $0x28
c0107d82:	6a 00                	push   $0x0
c0107d84:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d8a:	50                   	push   %eax
c0107d8b:	e8 5f 44 00 00       	call   c010c1ef <Memset>
c0107d90:	83 c4 10             	add    $0x10,%esp
c0107d93:	83 ec 04             	sub    $0x4,%esp
c0107d96:	6a 28                	push   $0x28
c0107d98:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107d9e:	50                   	push   %eax
c0107d9f:	ff 75 bc             	pushl  -0x44(%ebp)
c0107da2:	e8 0d cf ff ff       	call   c0104cb4 <read>
c0107da7:	83 c4 10             	add    $0x10,%esp
c0107daa:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107dad:	83 ec 08             	sub    $0x8,%esp
c0107db0:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107db6:	50                   	push   %eax
c0107db7:	68 58 bb 10 c0       	push   $0xc010bb58
c0107dbc:	e8 a7 08 00 00       	call   c0108668 <Printf>
c0107dc1:	83 c4 10             	add    $0x10,%esp
c0107dc4:	90                   	nop
c0107dc5:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107dc8:	5b                   	pop    %ebx
c0107dc9:	5e                   	pop    %esi
c0107dca:	5f                   	pop    %edi
c0107dcb:	5d                   	pop    %ebp
c0107dcc:	c3                   	ret    

c0107dcd <wait_exit>:
c0107dcd:	55                   	push   %ebp
c0107dce:	89 e5                	mov    %esp,%ebp
c0107dd0:	83 ec 28             	sub    $0x28,%esp
c0107dd3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107dda:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107de1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107de7:	83 ec 08             	sub    $0x8,%esp
c0107dea:	6a 02                	push   $0x2
c0107dec:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107def:	50                   	push   %eax
c0107df0:	e8 2a ce ff ff       	call   c0104c1f <open>
c0107df5:	83 c4 10             	add    $0x10,%esp
c0107df8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107dfb:	83 ec 08             	sub    $0x8,%esp
c0107dfe:	6a 02                	push   $0x2
c0107e00:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107e03:	50                   	push   %eax
c0107e04:	e8 16 ce ff ff       	call   c0104c1f <open>
c0107e09:	83 c4 10             	add    $0x10,%esp
c0107e0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107e0f:	e8 6b d1 ff ff       	call   c0104f7f <fork>
c0107e14:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107e17:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107e1b:	7e 35                	jle    c0107e52 <wait_exit+0x85>
c0107e1d:	83 ec 0c             	sub    $0xc,%esp
c0107e20:	68 2c bc 10 c0       	push   $0xc010bc2c
c0107e25:	e8 3e 08 00 00       	call   c0108668 <Printf>
c0107e2a:	83 c4 10             	add    $0x10,%esp
c0107e2d:	83 ec 0c             	sub    $0xc,%esp
c0107e30:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107e33:	50                   	push   %eax
c0107e34:	e8 d3 d0 ff ff       	call   c0104f0c <wait>
c0107e39:	83 c4 10             	add    $0x10,%esp
c0107e3c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107e3f:	83 ec 08             	sub    $0x8,%esp
c0107e42:	50                   	push   %eax
c0107e43:	68 44 bc 10 c0       	push   $0xc010bc44
c0107e48:	e8 1b 08 00 00       	call   c0108668 <Printf>
c0107e4d:	83 c4 10             	add    $0x10,%esp
c0107e50:	eb fe                	jmp    c0107e50 <wait_exit+0x83>
c0107e52:	83 ec 0c             	sub    $0xc,%esp
c0107e55:	68 5f bc 10 c0       	push   $0xc010bc5f
c0107e5a:	e8 09 08 00 00       	call   c0108668 <Printf>
c0107e5f:	83 c4 10             	add    $0x10,%esp
c0107e62:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107e69:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107e6c:	8d 50 01             	lea    0x1(%eax),%edx
c0107e6f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107e72:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107e77:	7f 02                	jg     c0107e7b <wait_exit+0xae>
c0107e79:	eb ee                	jmp    c0107e69 <wait_exit+0x9c>
c0107e7b:	90                   	nop
c0107e7c:	83 ec 0c             	sub    $0xc,%esp
c0107e7f:	68 6b bc 10 c0       	push   $0xc010bc6b
c0107e84:	e8 df 07 00 00       	call   c0108668 <Printf>
c0107e89:	83 c4 10             	add    $0x10,%esp
c0107e8c:	83 ec 0c             	sub    $0xc,%esp
c0107e8f:	68 79 bc 10 c0       	push   $0xc010bc79
c0107e94:	e8 cf 07 00 00       	call   c0108668 <Printf>
c0107e99:	83 c4 10             	add    $0x10,%esp
c0107e9c:	83 ec 0c             	sub    $0xc,%esp
c0107e9f:	68 88 bc 10 c0       	push   $0xc010bc88
c0107ea4:	e8 bf 07 00 00       	call   c0108668 <Printf>
c0107ea9:	83 c4 10             	add    $0x10,%esp
c0107eac:	83 ec 0c             	sub    $0xc,%esp
c0107eaf:	6a 5a                	push   $0x5a
c0107eb1:	e8 9a d0 ff ff       	call   c0104f50 <exit>
c0107eb6:	83 c4 10             	add    $0x10,%esp
c0107eb9:	83 ec 0c             	sub    $0xc,%esp
c0107ebc:	68 97 bc 10 c0       	push   $0xc010bc97
c0107ec1:	e8 a2 07 00 00       	call   c0108668 <Printf>
c0107ec6:	83 c4 10             	add    $0x10,%esp
c0107ec9:	eb fe                	jmp    c0107ec9 <wait_exit+0xfc>

c0107ecb <INIT_fork>:
c0107ecb:	55                   	push   %ebp
c0107ecc:	89 e5                	mov    %esp,%ebp
c0107ece:	83 ec 78             	sub    $0x78,%esp
c0107ed1:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107ed8:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107edf:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107ee5:	83 ec 08             	sub    $0x8,%esp
c0107ee8:	6a 02                	push   $0x2
c0107eea:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107eed:	50                   	push   %eax
c0107eee:	e8 2c cd ff ff       	call   c0104c1f <open>
c0107ef3:	83 c4 10             	add    $0x10,%esp
c0107ef6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107ef9:	83 ec 08             	sub    $0x8,%esp
c0107efc:	6a 02                	push   $0x2
c0107efe:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107f01:	50                   	push   %eax
c0107f02:	e8 18 cd ff ff       	call   c0104c1f <open>
c0107f07:	83 c4 10             	add    $0x10,%esp
c0107f0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107f0d:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107f14:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107f1b:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107f22:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107f29:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107f30:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107f37:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107f3e:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107f45:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107f4c:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107f53:	83 ec 0c             	sub    $0xc,%esp
c0107f56:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f59:	50                   	push   %eax
c0107f5a:	e8 09 07 00 00       	call   c0108668 <Printf>
c0107f5f:	83 c4 10             	add    $0x10,%esp
c0107f62:	83 ec 0c             	sub    $0xc,%esp
c0107f65:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f68:	50                   	push   %eax
c0107f69:	e8 ba 42 00 00       	call   c010c228 <Strlen>
c0107f6e:	83 c4 10             	add    $0x10,%esp
c0107f71:	83 ec 04             	sub    $0x4,%esp
c0107f74:	50                   	push   %eax
c0107f75:	6a 00                	push   $0x0
c0107f77:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f7a:	50                   	push   %eax
c0107f7b:	e8 6f 42 00 00       	call   c010c1ef <Memset>
c0107f80:	83 c4 10             	add    $0x10,%esp
c0107f83:	83 ec 04             	sub    $0x4,%esp
c0107f86:	6a 28                	push   $0x28
c0107f88:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f8b:	50                   	push   %eax
c0107f8c:	ff 75 f0             	pushl  -0x10(%ebp)
c0107f8f:	e8 20 cd ff ff       	call   c0104cb4 <read>
c0107f94:	83 c4 10             	add    $0x10,%esp
c0107f97:	83 ec 0c             	sub    $0xc,%esp
c0107f9a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f9d:	50                   	push   %eax
c0107f9e:	e8 c5 06 00 00       	call   c0108668 <Printf>
c0107fa3:	83 c4 10             	add    $0x10,%esp
c0107fa6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107fad:	e8 cd cf ff ff       	call   c0104f7f <fork>
c0107fb2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107fb5:	83 ec 0c             	sub    $0xc,%esp
c0107fb8:	6a 01                	push   $0x1
c0107fba:	e8 75 05 00 00       	call   c0108534 <delay>
c0107fbf:	83 c4 10             	add    $0x10,%esp
c0107fc2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107fc6:	0f 8e cd 00 00 00    	jle    c0108099 <INIT_fork+0x1ce>
c0107fcc:	83 ec 08             	sub    $0x8,%esp
c0107fcf:	ff 75 e8             	pushl  -0x18(%ebp)
c0107fd2:	68 a5 bc 10 c0       	push   $0xc010bca5
c0107fd7:	e8 8c 06 00 00       	call   c0108668 <Printf>
c0107fdc:	83 c4 10             	add    $0x10,%esp
c0107fdf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107fe3:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107fea:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107ff1:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107ff8:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107fff:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0108006:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c010800d:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0108014:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c010801b:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108022:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108029:	83 ec 0c             	sub    $0xc,%esp
c010802c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010802f:	50                   	push   %eax
c0108030:	e8 f3 41 00 00       	call   c010c228 <Strlen>
c0108035:	83 c4 10             	add    $0x10,%esp
c0108038:	83 ec 04             	sub    $0x4,%esp
c010803b:	50                   	push   %eax
c010803c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010803f:	50                   	push   %eax
c0108040:	ff 75 f4             	pushl  -0xc(%ebp)
c0108043:	e8 ed cd ff ff       	call   c0104e35 <write>
c0108048:	83 c4 10             	add    $0x10,%esp
c010804b:	e8 b2 ec ff ff       	call   c0106d02 <catch_error>
c0108050:	83 ec 0c             	sub    $0xc,%esp
c0108053:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108056:	50                   	push   %eax
c0108057:	e8 cc 41 00 00       	call   c010c228 <Strlen>
c010805c:	83 c4 10             	add    $0x10,%esp
c010805f:	83 ec 04             	sub    $0x4,%esp
c0108062:	50                   	push   %eax
c0108063:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108066:	50                   	push   %eax
c0108067:	ff 75 f4             	pushl  -0xc(%ebp)
c010806a:	e8 c6 cd ff ff       	call   c0104e35 <write>
c010806f:	83 c4 10             	add    $0x10,%esp
c0108072:	83 ec 0c             	sub    $0xc,%esp
c0108075:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108078:	50                   	push   %eax
c0108079:	e8 aa 41 00 00       	call   c010c228 <Strlen>
c010807e:	83 c4 10             	add    $0x10,%esp
c0108081:	83 ec 04             	sub    $0x4,%esp
c0108084:	50                   	push   %eax
c0108085:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108088:	50                   	push   %eax
c0108089:	ff 75 f4             	pushl  -0xc(%ebp)
c010808c:	e8 a4 cd ff ff       	call   c0104e35 <write>
c0108091:	83 c4 10             	add    $0x10,%esp
c0108094:	e9 d6 00 00 00       	jmp    c010816f <INIT_fork+0x2a4>
c0108099:	83 ec 08             	sub    $0x8,%esp
c010809c:	ff 75 e8             	pushl  -0x18(%ebp)
c010809f:	68 a5 bc 10 c0       	push   $0xc010bca5
c01080a4:	e8 bf 05 00 00       	call   c0108668 <Printf>
c01080a9:	83 c4 10             	add    $0x10,%esp
c01080ac:	83 ec 0c             	sub    $0xc,%esp
c01080af:	6a 01                	push   $0x1
c01080b1:	e8 7e 04 00 00       	call   c0108534 <delay>
c01080b6:	83 c4 10             	add    $0x10,%esp
c01080b9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01080bd:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c01080c1:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c01080c8:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c01080cf:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c01080d6:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c01080dd:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c01080e4:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c01080eb:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c01080f2:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c01080f9:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108100:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108107:	83 ec 0c             	sub    $0xc,%esp
c010810a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010810d:	50                   	push   %eax
c010810e:	e8 15 41 00 00       	call   c010c228 <Strlen>
c0108113:	83 c4 10             	add    $0x10,%esp
c0108116:	83 ec 04             	sub    $0x4,%esp
c0108119:	50                   	push   %eax
c010811a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010811d:	50                   	push   %eax
c010811e:	ff 75 f4             	pushl  -0xc(%ebp)
c0108121:	e8 0f cd ff ff       	call   c0104e35 <write>
c0108126:	83 c4 10             	add    $0x10,%esp
c0108129:	83 ec 0c             	sub    $0xc,%esp
c010812c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010812f:	50                   	push   %eax
c0108130:	e8 f3 40 00 00       	call   c010c228 <Strlen>
c0108135:	83 c4 10             	add    $0x10,%esp
c0108138:	83 ec 04             	sub    $0x4,%esp
c010813b:	50                   	push   %eax
c010813c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010813f:	50                   	push   %eax
c0108140:	ff 75 f4             	pushl  -0xc(%ebp)
c0108143:	e8 ed cc ff ff       	call   c0104e35 <write>
c0108148:	83 c4 10             	add    $0x10,%esp
c010814b:	83 ec 0c             	sub    $0xc,%esp
c010814e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108151:	50                   	push   %eax
c0108152:	e8 d1 40 00 00       	call   c010c228 <Strlen>
c0108157:	83 c4 10             	add    $0x10,%esp
c010815a:	83 ec 04             	sub    $0x4,%esp
c010815d:	50                   	push   %eax
c010815e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108161:	50                   	push   %eax
c0108162:	ff 75 f4             	pushl  -0xc(%ebp)
c0108165:	e8 cb cc ff ff       	call   c0104e35 <write>
c010816a:	83 c4 10             	add    $0x10,%esp
c010816d:	eb fe                	jmp    c010816d <INIT_fork+0x2a2>
c010816f:	83 ec 04             	sub    $0x4,%esp
c0108172:	6a 28                	push   $0x28
c0108174:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108177:	50                   	push   %eax
c0108178:	ff 75 f0             	pushl  -0x10(%ebp)
c010817b:	e8 34 cb ff ff       	call   c0104cb4 <read>
c0108180:	83 c4 10             	add    $0x10,%esp
c0108183:	83 ec 0c             	sub    $0xc,%esp
c0108186:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108189:	50                   	push   %eax
c010818a:	e8 d9 04 00 00       	call   c0108668 <Printf>
c010818f:	83 c4 10             	add    $0x10,%esp
c0108192:	83 ec 0c             	sub    $0xc,%esp
c0108195:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108198:	50                   	push   %eax
c0108199:	e8 ca 04 00 00       	call   c0108668 <Printf>
c010819e:	83 c4 10             	add    $0x10,%esp
c01081a1:	83 ec 0c             	sub    $0xc,%esp
c01081a4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01081a7:	50                   	push   %eax
c01081a8:	e8 bb 04 00 00       	call   c0108668 <Printf>
c01081ad:	83 c4 10             	add    $0x10,%esp
c01081b0:	83 ec 0c             	sub    $0xc,%esp
c01081b3:	68 af bc 10 c0       	push   $0xc010bcaf
c01081b8:	e8 c4 07 00 00       	call   c0108981 <spin>
c01081bd:	83 c4 10             	add    $0x10,%esp
c01081c0:	90                   	nop
c01081c1:	c9                   	leave  
c01081c2:	c3                   	ret    

c01081c3 <simple_shell>:
c01081c3:	55                   	push   %ebp
c01081c4:	89 e5                	mov    %esp,%ebp
c01081c6:	57                   	push   %edi
c01081c7:	83 ec 64             	sub    $0x64,%esp
c01081ca:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c01081d1:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c01081d8:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c01081de:	83 ec 08             	sub    $0x8,%esp
c01081e1:	6a 02                	push   $0x2
c01081e3:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01081e6:	50                   	push   %eax
c01081e7:	e8 33 ca ff ff       	call   c0104c1f <open>
c01081ec:	83 c4 10             	add    $0x10,%esp
c01081ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01081f2:	83 ec 08             	sub    $0x8,%esp
c01081f5:	6a 02                	push   $0x2
c01081f7:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01081fa:	50                   	push   %eax
c01081fb:	e8 1f ca ff ff       	call   c0104c1f <open>
c0108200:	83 c4 10             	add    $0x10,%esp
c0108203:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108206:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0108209:	b8 00 00 00 00       	mov    $0x0,%eax
c010820e:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0108213:	89 d7                	mov    %edx,%edi
c0108215:	f3 ab                	rep stos %eax,%es:(%edi)
c0108217:	c7 45 a8 b7 bc 10 c0 	movl   $0xc010bcb7,-0x58(%ebp)
c010821e:	c7 45 ac bc bc 10 c0 	movl   $0xc010bcbc,-0x54(%ebp)
c0108225:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010822c:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0108233:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c010823a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010823d:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c0108244:	00 
c0108245:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0108248:	85 c0                	test   %eax,%eax
c010824a:	75 1c                	jne    c0108268 <simple_shell+0xa5>
c010824c:	68 0e 03 00 00       	push   $0x30e
c0108251:	68 81 ba 10 c0       	push   $0xc010ba81
c0108256:	68 81 ba 10 c0       	push   $0xc010ba81
c010825b:	68 c2 bc 10 c0       	push   $0xc010bcc2
c0108260:	e8 60 07 00 00       	call   c01089c5 <assertion_failure>
c0108265:	83 c4 10             	add    $0x10,%esp
c0108268:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010826b:	83 ec 08             	sub    $0x8,%esp
c010826e:	6a 02                	push   $0x2
c0108270:	50                   	push   %eax
c0108271:	e8 a9 c9 ff ff       	call   c0104c1f <open>
c0108276:	83 c4 10             	add    $0x10,%esp
c0108279:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010827c:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0108280:	75 4b                	jne    c01082cd <simple_shell+0x10a>
c0108282:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108289:	eb 26                	jmp    c01082b1 <simple_shell+0xee>
c010828b:	8b 55 a8             	mov    -0x58(%ebp),%edx
c010828e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108291:	01 d0                	add    %edx,%eax
c0108293:	0f b6 00             	movzbl (%eax),%eax
c0108296:	0f be c0             	movsbl %al,%eax
c0108299:	83 ec 04             	sub    $0x4,%esp
c010829c:	50                   	push   %eax
c010829d:	ff 75 f4             	pushl  -0xc(%ebp)
c01082a0:	68 d1 bc 10 c0       	push   $0xc010bcd1
c01082a5:	e8 be 03 00 00       	call   c0108668 <Printf>
c01082aa:	83 c4 10             	add    $0x10,%esp
c01082ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01082b1:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c01082b5:	7e d4                	jle    c010828b <simple_shell+0xc8>
c01082b7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01082ba:	83 ec 08             	sub    $0x8,%esp
c01082bd:	50                   	push   %eax
c01082be:	68 d8 bc 10 c0       	push   $0xc010bcd8
c01082c3:	e8 a0 03 00 00       	call   c0108668 <Printf>
c01082c8:	83 c4 10             	add    $0x10,%esp
c01082cb:	eb 78                	jmp    c0108345 <simple_shell+0x182>
c01082cd:	83 ec 0c             	sub    $0xc,%esp
c01082d0:	68 de bc 10 c0       	push   $0xc010bcde
c01082d5:	e8 8e 03 00 00       	call   c0108668 <Printf>
c01082da:	83 c4 10             	add    $0x10,%esp
c01082dd:	e8 9d cc ff ff       	call   c0104f7f <fork>
c01082e2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01082e5:	83 ec 0c             	sub    $0xc,%esp
c01082e8:	68 f3 bc 10 c0       	push   $0xc010bcf3
c01082ed:	e8 76 03 00 00       	call   c0108668 <Printf>
c01082f2:	83 c4 10             	add    $0x10,%esp
c01082f5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01082f9:	7e 11                	jle    c010830c <simple_shell+0x149>
c01082fb:	83 ec 0c             	sub    $0xc,%esp
c01082fe:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0108301:	50                   	push   %eax
c0108302:	e8 05 cc ff ff       	call   c0104f0c <wait>
c0108307:	83 c4 10             	add    $0x10,%esp
c010830a:	eb 39                	jmp    c0108345 <simple_shell+0x182>
c010830c:	83 ec 0c             	sub    $0xc,%esp
c010830f:	68 08 bd 10 c0       	push   $0xc010bd08
c0108314:	e8 4f 03 00 00       	call   c0108668 <Printf>
c0108319:	83 c4 10             	add    $0x10,%esp
c010831c:	83 ec 0c             	sub    $0xc,%esp
c010831f:	ff 75 e0             	pushl  -0x20(%ebp)
c0108322:	e8 93 cb ff ff       	call   c0104eba <close>
c0108327:	83 c4 10             	add    $0x10,%esp
c010832a:	6a 00                	push   $0x0
c010832c:	68 bc bc 10 c0       	push   $0xc010bcbc
c0108331:	68 b7 bc 10 c0       	push   $0xc010bcb7
c0108336:	68 24 bd 10 c0       	push   $0xc010bd24
c010833b:	e8 12 cf ff ff       	call   c0105252 <execl>
c0108340:	83 c4 10             	add    $0x10,%esp
c0108343:	eb fe                	jmp    c0108343 <simple_shell+0x180>
c0108345:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0108348:	c9                   	leave  
c0108349:	c3                   	ret    

c010834a <test_shell>:
c010834a:	55                   	push   %ebp
c010834b:	89 e5                	mov    %esp,%ebp
c010834d:	83 ec 38             	sub    $0x38,%esp
c0108350:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0108357:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c010835e:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0108364:	83 ec 08             	sub    $0x8,%esp
c0108367:	6a 02                	push   $0x2
c0108369:	8d 45 ea             	lea    -0x16(%ebp),%eax
c010836c:	50                   	push   %eax
c010836d:	e8 ad c8 ff ff       	call   c0104c1f <open>
c0108372:	83 c4 10             	add    $0x10,%esp
c0108375:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108378:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c010837f:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0108386:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c010838d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108394:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010839b:	83 ec 0c             	sub    $0xc,%esp
c010839e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c01083a1:	50                   	push   %eax
c01083a2:	e8 38 ea ff ff       	call   c0106ddf <untar>
c01083a7:	83 c4 10             	add    $0x10,%esp
c01083aa:	e8 14 fe ff ff       	call   c01081c3 <simple_shell>
c01083af:	90                   	nop
c01083b0:	c9                   	leave  
c01083b1:	c3                   	ret    

c01083b2 <test_exec>:
c01083b2:	55                   	push   %ebp
c01083b3:	89 e5                	mov    %esp,%ebp
c01083b5:	83 ec 38             	sub    $0x38,%esp
c01083b8:	83 ec 0c             	sub    $0xc,%esp
c01083bb:	68 2a bd 10 c0       	push   $0xc010bd2a
c01083c0:	e8 c7 7c ff ff       	call   c010008c <disp_str>
c01083c5:	83 c4 10             	add    $0x10,%esp
c01083c8:	83 ec 0c             	sub    $0xc,%esp
c01083cb:	68 3c bd 10 c0       	push   $0xc010bd3c
c01083d0:	e8 b7 7c ff ff       	call   c010008c <disp_str>
c01083d5:	83 c4 10             	add    $0x10,%esp
c01083d8:	83 ec 0c             	sub    $0xc,%esp
c01083db:	6a 07                	push   $0x7
c01083dd:	e8 b8 ed ff ff       	call   c010719a <disp_int>
c01083e2:	83 c4 10             	add    $0x10,%esp
c01083e5:	83 ec 0c             	sub    $0xc,%esp
c01083e8:	68 20 b6 10 c0       	push   $0xc010b620
c01083ed:	e8 9a 7c ff ff       	call   c010008c <disp_str>
c01083f2:	83 c4 10             	add    $0x10,%esp
c01083f5:	83 ec 0c             	sub    $0xc,%esp
c01083f8:	68 22 b6 10 c0       	push   $0xc010b622
c01083fd:	e8 8a 7c ff ff       	call   c010008c <disp_str>
c0108402:	83 c4 10             	add    $0x10,%esp
c0108405:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c010840c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108413:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0108419:	83 ec 08             	sub    $0x8,%esp
c010841c:	6a 02                	push   $0x2
c010841e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108421:	50                   	push   %eax
c0108422:	e8 f8 c7 ff ff       	call   c0104c1f <open>
c0108427:	83 c4 10             	add    $0x10,%esp
c010842a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010842d:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0108434:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c010843b:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0108442:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0108449:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108450:	83 ec 0c             	sub    $0xc,%esp
c0108453:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108456:	50                   	push   %eax
c0108457:	e8 83 e9 ff ff       	call   c0106ddf <untar>
c010845c:	83 c4 10             	add    $0x10,%esp
c010845f:	83 ec 08             	sub    $0x8,%esp
c0108462:	6a 00                	push   $0x0
c0108464:	68 4f bd 10 c0       	push   $0xc010bd4f
c0108469:	68 53 bd 10 c0       	push   $0xc010bd53
c010846e:	68 bc bc 10 c0       	push   $0xc010bcbc
c0108473:	68 b7 bc 10 c0       	push   $0xc010bcb7
c0108478:	68 24 bd 10 c0       	push   $0xc010bd24
c010847d:	e8 d0 cd ff ff       	call   c0105252 <execl>
c0108482:	83 c4 20             	add    $0x20,%esp
c0108485:	e8 34 e8 ff ff       	call   c0106cbe <stop_here>
c010848a:	e8 f0 ca ff ff       	call   c0104f7f <fork>
c010848f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108492:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108496:	7e 25                	jle    c01084bd <test_exec+0x10b>
c0108498:	83 ec 0c             	sub    $0xc,%esp
c010849b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c010849e:	50                   	push   %eax
c010849f:	e8 68 ca ff ff       	call   c0104f0c <wait>
c01084a4:	83 c4 10             	add    $0x10,%esp
c01084a7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01084aa:	83 ec 08             	sub    $0x8,%esp
c01084ad:	50                   	push   %eax
c01084ae:	68 59 bd 10 c0       	push   $0xc010bd59
c01084b3:	e8 b0 01 00 00       	call   c0108668 <Printf>
c01084b8:	83 c4 10             	add    $0x10,%esp
c01084bb:	eb 33                	jmp    c01084f0 <test_exec+0x13e>
c01084bd:	83 ec 0c             	sub    $0xc,%esp
c01084c0:	68 6b bd 10 c0       	push   $0xc010bd6b
c01084c5:	e8 9e 01 00 00       	call   c0108668 <Printf>
c01084ca:	83 c4 10             	add    $0x10,%esp
c01084cd:	83 ec 0c             	sub    $0xc,%esp
c01084d0:	6a 00                	push   $0x0
c01084d2:	68 53 bd 10 c0       	push   $0xc010bd53
c01084d7:	68 bc bc 10 c0       	push   $0xc010bcbc
c01084dc:	68 b7 bc 10 c0       	push   $0xc010bcb7
c01084e1:	68 24 bd 10 c0       	push   $0xc010bd24
c01084e6:	e8 67 cd ff ff       	call   c0105252 <execl>
c01084eb:	83 c4 20             	add    $0x20,%esp
c01084ee:	eb fe                	jmp    c01084ee <test_exec+0x13c>
c01084f0:	c9                   	leave  
c01084f1:	c3                   	ret    

c01084f2 <INIT>:
c01084f2:	55                   	push   %ebp
c01084f3:	89 e5                	mov    %esp,%ebp
c01084f5:	83 ec 08             	sub    $0x8,%esp
c01084f8:	e8 4d fe ff ff       	call   c010834a <test_shell>
c01084fd:	eb fe                	jmp    c01084fd <INIT+0xb>

c01084ff <TestA>:
c01084ff:	55                   	push   %ebp
c0108500:	89 e5                	mov    %esp,%ebp
c0108502:	83 ec 08             	sub    $0x8,%esp
c0108505:	83 ec 0c             	sub    $0xc,%esp
c0108508:	6a 05                	push   $0x5
c010850a:	e8 8b ec ff ff       	call   c010719a <disp_int>
c010850f:	83 c4 10             	add    $0x10,%esp
c0108512:	83 ec 0c             	sub    $0xc,%esp
c0108515:	68 33 b7 10 c0       	push   $0xc010b733
c010851a:	e8 6d 7b ff ff       	call   c010008c <disp_str>
c010851f:	83 c4 10             	add    $0x10,%esp
c0108522:	83 ec 0c             	sub    $0xc,%esp
c0108525:	68 79 bd 10 c0       	push   $0xc010bd79
c010852a:	e8 5d 7b ff ff       	call   c010008c <disp_str>
c010852f:	83 c4 10             	add    $0x10,%esp
c0108532:	eb fe                	jmp    c0108532 <TestA+0x33>

c0108534 <delay>:
c0108534:	55                   	push   %ebp
c0108535:	89 e5                	mov    %esp,%ebp
c0108537:	83 ec 10             	sub    $0x10,%esp
c010853a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108541:	eb 2a                	jmp    c010856d <delay+0x39>
c0108543:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c010854a:	eb 17                	jmp    c0108563 <delay+0x2f>
c010854c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108553:	eb 04                	jmp    c0108559 <delay+0x25>
c0108555:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108559:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c010855d:	7e f6                	jle    c0108555 <delay+0x21>
c010855f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0108563:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0108567:	7e e3                	jle    c010854c <delay+0x18>
c0108569:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010856d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108570:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108573:	7c ce                	jl     c0108543 <delay+0xf>
c0108575:	90                   	nop
c0108576:	c9                   	leave  
c0108577:	c3                   	ret    

c0108578 <TestB>:
c0108578:	55                   	push   %ebp
c0108579:	89 e5                	mov    %esp,%ebp
c010857b:	83 ec 08             	sub    $0x8,%esp
c010857e:	83 ec 0c             	sub    $0xc,%esp
c0108581:	68 80 bd 10 c0       	push   $0xc010bd80
c0108586:	e8 01 7b ff ff       	call   c010008c <disp_str>
c010858b:	83 c4 10             	add    $0x10,%esp
c010858e:	eb fe                	jmp    c010858e <TestB+0x16>

c0108590 <TestC>:
c0108590:	55                   	push   %ebp
c0108591:	89 e5                	mov    %esp,%ebp
c0108593:	83 ec 18             	sub    $0x18,%esp
c0108596:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010859d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c01085a1:	77 1a                	ja     c01085bd <TestC+0x2d>
c01085a3:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c01085aa:	83 ec 08             	sub    $0x8,%esp
c01085ad:	ff 75 f0             	pushl  -0x10(%ebp)
c01085b0:	68 83 bd 10 c0       	push   $0xc010bd83
c01085b5:	e8 ae 00 00 00       	call   c0108668 <Printf>
c01085ba:	83 c4 10             	add    $0x10,%esp
c01085bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01085c1:	eb da                	jmp    c010859d <TestC+0xd>

c01085c3 <sys_get_ticks>:
c01085c3:	55                   	push   %ebp
c01085c4:	89 e5                	mov    %esp,%ebp
c01085c6:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01085cb:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01085d1:	5d                   	pop    %ebp
c01085d2:	c3                   	ret    

c01085d3 <sys_write>:
c01085d3:	55                   	push   %ebp
c01085d4:	89 e5                	mov    %esp,%ebp
c01085d6:	83 ec 18             	sub    $0x18,%esp
c01085d9:	8b 45 10             	mov    0x10(%ebp),%eax
c01085dc:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01085e2:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01085e8:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01085ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01085f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01085f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01085f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01085fc:	eb 20                	jmp    c010861e <sys_write+0x4b>
c01085fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108601:	0f b6 00             	movzbl (%eax),%eax
c0108604:	0f b6 c0             	movzbl %al,%eax
c0108607:	83 ec 08             	sub    $0x8,%esp
c010860a:	50                   	push   %eax
c010860b:	ff 75 ec             	pushl  -0x14(%ebp)
c010860e:	e8 7d b9 ff ff       	call   c0103f90 <out_char>
c0108613:	83 c4 10             	add    $0x10,%esp
c0108616:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010861a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c010861e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108622:	7f da                	jg     c01085fe <sys_write+0x2b>
c0108624:	90                   	nop
c0108625:	c9                   	leave  
c0108626:	c3                   	ret    

c0108627 <milli_delay>:
c0108627:	55                   	push   %ebp
c0108628:	89 e5                	mov    %esp,%ebp
c010862a:	83 ec 18             	sub    $0x18,%esp
c010862d:	e8 8a 11 00 00       	call   c01097bc <get_ticks_ipc>
c0108632:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108635:	90                   	nop
c0108636:	e8 81 11 00 00       	call   c01097bc <get_ticks_ipc>
c010863b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c010863e:	89 c1                	mov    %eax,%ecx
c0108640:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0108645:	89 c8                	mov    %ecx,%eax
c0108647:	f7 ea                	imul   %edx
c0108649:	c1 fa 05             	sar    $0x5,%edx
c010864c:	89 c8                	mov    %ecx,%eax
c010864e:	c1 f8 1f             	sar    $0x1f,%eax
c0108651:	29 c2                	sub    %eax,%edx
c0108653:	89 d0                	mov    %edx,%eax
c0108655:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c010865b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010865e:	77 d6                	ja     c0108636 <milli_delay+0xf>
c0108660:	90                   	nop
c0108661:	c9                   	leave  
c0108662:	c3                   	ret    

c0108663 <TaskSys>:
c0108663:	55                   	push   %ebp
c0108664:	89 e5                	mov    %esp,%ebp
c0108666:	eb fe                	jmp    c0108666 <TaskSys+0x3>

c0108668 <Printf>:
c0108668:	55                   	push   %ebp
c0108669:	89 e5                	mov    %esp,%ebp
c010866b:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108671:	83 ec 04             	sub    $0x4,%esp
c0108674:	68 00 01 00 00       	push   $0x100
c0108679:	6a 00                	push   $0x0
c010867b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108681:	50                   	push   %eax
c0108682:	e8 68 3b 00 00       	call   c010c1ef <Memset>
c0108687:	83 c4 10             	add    $0x10,%esp
c010868a:	8d 45 0c             	lea    0xc(%ebp),%eax
c010868d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108690:	8b 45 08             	mov    0x8(%ebp),%eax
c0108693:	83 ec 04             	sub    $0x4,%esp
c0108696:	ff 75 f4             	pushl  -0xc(%ebp)
c0108699:	50                   	push   %eax
c010869a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01086a0:	50                   	push   %eax
c01086a1:	e8 20 00 00 00       	call   c01086c6 <vsprintf>
c01086a6:	83 c4 10             	add    $0x10,%esp
c01086a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01086ac:	83 ec 04             	sub    $0x4,%esp
c01086af:	ff 75 f0             	pushl  -0x10(%ebp)
c01086b2:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01086b8:	50                   	push   %eax
c01086b9:	6a 00                	push   $0x0
c01086bb:	e8 75 c7 ff ff       	call   c0104e35 <write>
c01086c0:	83 c4 10             	add    $0x10,%esp
c01086c3:	90                   	nop
c01086c4:	c9                   	leave  
c01086c5:	c3                   	ret    

c01086c6 <vsprintf>:
c01086c6:	55                   	push   %ebp
c01086c7:	89 e5                	mov    %esp,%ebp
c01086c9:	81 ec 68 02 00 00    	sub    $0x268,%esp
c01086cf:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01086d5:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c01086db:	83 ec 04             	sub    $0x4,%esp
c01086de:	6a 40                	push   $0x40
c01086e0:	6a 00                	push   $0x0
c01086e2:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01086e8:	50                   	push   %eax
c01086e9:	e8 01 3b 00 00       	call   c010c1ef <Memset>
c01086ee:	83 c4 10             	add    $0x10,%esp
c01086f1:	8b 45 10             	mov    0x10(%ebp),%eax
c01086f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01086f7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01086fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0108701:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108704:	e9 53 01 00 00       	jmp    c010885c <vsprintf+0x196>
c0108709:	8b 45 0c             	mov    0xc(%ebp),%eax
c010870c:	0f b6 00             	movzbl (%eax),%eax
c010870f:	3c 25                	cmp    $0x25,%al
c0108711:	74 16                	je     c0108729 <vsprintf+0x63>
c0108713:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108716:	8d 50 01             	lea    0x1(%eax),%edx
c0108719:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010871c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010871f:	0f b6 12             	movzbl (%edx),%edx
c0108722:	88 10                	mov    %dl,(%eax)
c0108724:	e9 2f 01 00 00       	jmp    c0108858 <vsprintf+0x192>
c0108729:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010872d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108730:	0f b6 00             	movzbl (%eax),%eax
c0108733:	0f be c0             	movsbl %al,%eax
c0108736:	83 f8 64             	cmp    $0x64,%eax
c0108739:	74 26                	je     c0108761 <vsprintf+0x9b>
c010873b:	83 f8 64             	cmp    $0x64,%eax
c010873e:	7f 0e                	jg     c010874e <vsprintf+0x88>
c0108740:	83 f8 63             	cmp    $0x63,%eax
c0108743:	0f 84 f2 00 00 00    	je     c010883b <vsprintf+0x175>
c0108749:	e9 0a 01 00 00       	jmp    c0108858 <vsprintf+0x192>
c010874e:	83 f8 73             	cmp    $0x73,%eax
c0108751:	0f 84 b0 00 00 00    	je     c0108807 <vsprintf+0x141>
c0108757:	83 f8 78             	cmp    $0x78,%eax
c010875a:	74 5d                	je     c01087b9 <vsprintf+0xf3>
c010875c:	e9 f7 00 00 00       	jmp    c0108858 <vsprintf+0x192>
c0108761:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108764:	8b 00                	mov    (%eax),%eax
c0108766:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108769:	83 ec 04             	sub    $0x4,%esp
c010876c:	6a 0a                	push   $0xa
c010876e:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0108774:	50                   	push   %eax
c0108775:	ff 75 e8             	pushl  -0x18(%ebp)
c0108778:	e8 96 10 00 00       	call   c0109813 <itoa>
c010877d:	83 c4 10             	add    $0x10,%esp
c0108780:	83 ec 08             	sub    $0x8,%esp
c0108783:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108789:	50                   	push   %eax
c010878a:	ff 75 f4             	pushl  -0xc(%ebp)
c010878d:	e8 7c 3a 00 00       	call   c010c20e <Strcpy>
c0108792:	83 c4 10             	add    $0x10,%esp
c0108795:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108799:	83 ec 0c             	sub    $0xc,%esp
c010879c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01087a2:	50                   	push   %eax
c01087a3:	e8 80 3a 00 00       	call   c010c228 <Strlen>
c01087a8:	83 c4 10             	add    $0x10,%esp
c01087ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01087ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01087b1:	01 45 f4             	add    %eax,-0xc(%ebp)
c01087b4:	e9 9f 00 00 00       	jmp    c0108858 <vsprintf+0x192>
c01087b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087bc:	8b 00                	mov    (%eax),%eax
c01087be:	83 ec 08             	sub    $0x8,%esp
c01087c1:	50                   	push   %eax
c01087c2:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01087c8:	50                   	push   %eax
c01087c9:	e8 26 e9 ff ff       	call   c01070f4 <atoi>
c01087ce:	83 c4 10             	add    $0x10,%esp
c01087d1:	83 ec 08             	sub    $0x8,%esp
c01087d4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01087da:	50                   	push   %eax
c01087db:	ff 75 f4             	pushl  -0xc(%ebp)
c01087de:	e8 2b 3a 00 00       	call   c010c20e <Strcpy>
c01087e3:	83 c4 10             	add    $0x10,%esp
c01087e6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01087ea:	83 ec 0c             	sub    $0xc,%esp
c01087ed:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01087f3:	50                   	push   %eax
c01087f4:	e8 2f 3a 00 00       	call   c010c228 <Strlen>
c01087f9:	83 c4 10             	add    $0x10,%esp
c01087fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01087ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108802:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108805:	eb 51                	jmp    c0108858 <vsprintf+0x192>
c0108807:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010880a:	8b 00                	mov    (%eax),%eax
c010880c:	83 ec 08             	sub    $0x8,%esp
c010880f:	50                   	push   %eax
c0108810:	ff 75 f4             	pushl  -0xc(%ebp)
c0108813:	e8 f6 39 00 00       	call   c010c20e <Strcpy>
c0108818:	83 c4 10             	add    $0x10,%esp
c010881b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010881e:	8b 00                	mov    (%eax),%eax
c0108820:	83 ec 0c             	sub    $0xc,%esp
c0108823:	50                   	push   %eax
c0108824:	e8 ff 39 00 00       	call   c010c228 <Strlen>
c0108829:	83 c4 10             	add    $0x10,%esp
c010882c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010882f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108833:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108836:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108839:	eb 1d                	jmp    c0108858 <vsprintf+0x192>
c010883b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010883e:	0f b6 10             	movzbl (%eax),%edx
c0108841:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108844:	88 10                	mov    %dl,(%eax)
c0108846:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010884a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0108851:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108854:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108857:	90                   	nop
c0108858:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010885c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010885f:	0f b6 00             	movzbl (%eax),%eax
c0108862:	84 c0                	test   %al,%al
c0108864:	0f 85 9f fe ff ff    	jne    c0108709 <vsprintf+0x43>
c010886a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010886d:	2b 45 08             	sub    0x8(%ebp),%eax
c0108870:	c9                   	leave  
c0108871:	c3                   	ret    

c0108872 <printx>:
c0108872:	55                   	push   %ebp
c0108873:	89 e5                	mov    %esp,%ebp
c0108875:	81 ec 18 01 00 00    	sub    $0x118,%esp
c010887b:	8d 45 0c             	lea    0xc(%ebp),%eax
c010887e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108881:	8b 45 08             	mov    0x8(%ebp),%eax
c0108884:	83 ec 04             	sub    $0x4,%esp
c0108887:	ff 75 f4             	pushl  -0xc(%ebp)
c010888a:	50                   	push   %eax
c010888b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108891:	50                   	push   %eax
c0108892:	e8 2f fe ff ff       	call   c01086c6 <vsprintf>
c0108897:	83 c4 10             	add    $0x10,%esp
c010889a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010889d:	83 ec 08             	sub    $0x8,%esp
c01088a0:	ff 75 f0             	pushl  -0x10(%ebp)
c01088a3:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01088a9:	50                   	push   %eax
c01088aa:	e8 11 8e ff ff       	call   c01016c0 <write_debug>
c01088af:	83 c4 10             	add    $0x10,%esp
c01088b2:	90                   	nop
c01088b3:	c9                   	leave  
c01088b4:	c3                   	ret    

c01088b5 <sys_printx>:
c01088b5:	55                   	push   %ebp
c01088b6:	89 e5                	mov    %esp,%ebp
c01088b8:	83 ec 28             	sub    $0x28,%esp
c01088bb:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01088c0:	85 c0                	test   %eax,%eax
c01088c2:	75 15                	jne    c01088d9 <sys_printx+0x24>
c01088c4:	8b 45 10             	mov    0x10(%ebp),%eax
c01088c7:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c01088cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01088d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01088d7:	eb 10                	jmp    c01088e9 <sys_printx+0x34>
c01088d9:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01088de:	85 c0                	test   %eax,%eax
c01088e0:	74 07                	je     c01088e9 <sys_printx+0x34>
c01088e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01088e9:	8b 55 08             	mov    0x8(%ebp),%edx
c01088ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01088ef:	01 d0                	add    %edx,%eax
c01088f1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01088f4:	8b 45 10             	mov    0x10(%ebp),%eax
c01088f7:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01088fd:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108903:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108908:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010890b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010890e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108911:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108914:	0f b6 00             	movzbl (%eax),%eax
c0108917:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010891a:	eb 3a                	jmp    c0108956 <sys_printx+0xa1>
c010891c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010891f:	0f b6 00             	movzbl (%eax),%eax
c0108922:	3c 3b                	cmp    $0x3b,%al
c0108924:	74 0a                	je     c0108930 <sys_printx+0x7b>
c0108926:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108929:	0f b6 00             	movzbl (%eax),%eax
c010892c:	3c 3a                	cmp    $0x3a,%al
c010892e:	75 06                	jne    c0108936 <sys_printx+0x81>
c0108930:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108934:	eb 20                	jmp    c0108956 <sys_printx+0xa1>
c0108936:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108939:	0f b6 00             	movzbl (%eax),%eax
c010893c:	0f b6 c0             	movzbl %al,%eax
c010893f:	83 ec 08             	sub    $0x8,%esp
c0108942:	50                   	push   %eax
c0108943:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108946:	e8 45 b6 ff ff       	call   c0103f90 <out_char>
c010894b:	83 c4 10             	add    $0x10,%esp
c010894e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108952:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0108956:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010895a:	7f c0                	jg     c010891c <sys_printx+0x67>
c010895c:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108960:	75 10                	jne    c0108972 <sys_printx+0xbd>
c0108962:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108967:	85 c0                	test   %eax,%eax
c0108969:	74 13                	je     c010897e <sys_printx+0xc9>
c010896b:	e8 a2 79 ff ff       	call   c0100312 <disable_int>
c0108970:	eb 0c                	jmp    c010897e <sys_printx+0xc9>
c0108972:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0108976:	75 06                	jne    c010897e <sys_printx+0xc9>
c0108978:	e8 95 79 ff ff       	call   c0100312 <disable_int>
c010897d:	90                   	nop
c010897e:	90                   	nop
c010897f:	c9                   	leave  
c0108980:	c3                   	ret    

c0108981 <spin>:
c0108981:	55                   	push   %ebp
c0108982:	89 e5                	mov    %esp,%ebp
c0108984:	83 ec 08             	sub    $0x8,%esp
c0108987:	83 ec 0c             	sub    $0xc,%esp
c010898a:	ff 75 08             	pushl  0x8(%ebp)
c010898d:	e8 fa 76 ff ff       	call   c010008c <disp_str>
c0108992:	83 c4 10             	add    $0x10,%esp
c0108995:	83 ec 0c             	sub    $0xc,%esp
c0108998:	68 33 b7 10 c0       	push   $0xc010b733
c010899d:	e8 ea 76 ff ff       	call   c010008c <disp_str>
c01089a2:	83 c4 10             	add    $0x10,%esp
c01089a5:	eb fe                	jmp    c01089a5 <spin+0x24>

c01089a7 <panic>:
c01089a7:	55                   	push   %ebp
c01089a8:	89 e5                	mov    %esp,%ebp
c01089aa:	83 ec 08             	sub    $0x8,%esp
c01089ad:	83 ec 04             	sub    $0x4,%esp
c01089b0:	ff 75 08             	pushl  0x8(%ebp)
c01089b3:	6a 3a                	push   $0x3a
c01089b5:	68 90 bd 10 c0       	push   $0xc010bd90
c01089ba:	e8 b3 fe ff ff       	call   c0108872 <printx>
c01089bf:	83 c4 10             	add    $0x10,%esp
c01089c2:	90                   	nop
c01089c3:	c9                   	leave  
c01089c4:	c3                   	ret    

c01089c5 <assertion_failure>:
c01089c5:	55                   	push   %ebp
c01089c6:	89 e5                	mov    %esp,%ebp
c01089c8:	83 ec 08             	sub    $0x8,%esp
c01089cb:	83 ec 08             	sub    $0x8,%esp
c01089ce:	ff 75 14             	pushl  0x14(%ebp)
c01089d1:	ff 75 10             	pushl  0x10(%ebp)
c01089d4:	ff 75 0c             	pushl  0xc(%ebp)
c01089d7:	ff 75 08             	pushl  0x8(%ebp)
c01089da:	6a 3b                	push   $0x3b
c01089dc:	68 98 bd 10 c0       	push   $0xc010bd98
c01089e1:	e8 8c fe ff ff       	call   c0108872 <printx>
c01089e6:	83 c4 20             	add    $0x20,%esp
c01089e9:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01089f0:	00 00 00 
c01089f3:	83 ec 0c             	sub    $0xc,%esp
c01089f6:	68 20 b6 10 c0       	push   $0xc010b620
c01089fb:	e8 8c 76 ff ff       	call   c010008c <disp_str>
c0108a00:	83 c4 10             	add    $0x10,%esp
c0108a03:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108a08:	83 ec 0c             	sub    $0xc,%esp
c0108a0b:	50                   	push   %eax
c0108a0c:	e8 89 e7 ff ff       	call   c010719a <disp_int>
c0108a11:	83 c4 10             	add    $0x10,%esp
c0108a14:	83 ec 0c             	sub    $0xc,%esp
c0108a17:	68 22 b6 10 c0       	push   $0xc010b622
c0108a1c:	e8 6b 76 ff ff       	call   c010008c <disp_str>
c0108a21:	83 c4 10             	add    $0x10,%esp
c0108a24:	83 ec 0c             	sub    $0xc,%esp
c0108a27:	68 cb bd 10 c0       	push   $0xc010bdcb
c0108a2c:	e8 50 ff ff ff       	call   c0108981 <spin>
c0108a31:	83 c4 10             	add    $0x10,%esp
c0108a34:	90                   	nop
c0108a35:	c9                   	leave  
c0108a36:	c3                   	ret    

c0108a37 <assertion_failure2>:
c0108a37:	55                   	push   %ebp
c0108a38:	89 e5                	mov    %esp,%ebp
c0108a3a:	83 ec 08             	sub    $0x8,%esp
c0108a3d:	83 ec 04             	sub    $0x4,%esp
c0108a40:	ff 75 18             	pushl  0x18(%ebp)
c0108a43:	ff 75 14             	pushl  0x14(%ebp)
c0108a46:	ff 75 10             	pushl  0x10(%ebp)
c0108a49:	ff 75 0c             	pushl  0xc(%ebp)
c0108a4c:	ff 75 08             	pushl  0x8(%ebp)
c0108a4f:	6a 3b                	push   $0x3b
c0108a51:	68 d8 bd 10 c0       	push   $0xc010bdd8
c0108a56:	e8 17 fe ff ff       	call   c0108872 <printx>
c0108a5b:	83 c4 20             	add    $0x20,%esp
c0108a5e:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108a65:	00 00 00 
c0108a68:	83 ec 0c             	sub    $0xc,%esp
c0108a6b:	68 20 b6 10 c0       	push   $0xc010b620
c0108a70:	e8 17 76 ff ff       	call   c010008c <disp_str>
c0108a75:	83 c4 10             	add    $0x10,%esp
c0108a78:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108a7d:	83 ec 0c             	sub    $0xc,%esp
c0108a80:	50                   	push   %eax
c0108a81:	e8 14 e7 ff ff       	call   c010719a <disp_int>
c0108a86:	83 c4 10             	add    $0x10,%esp
c0108a89:	83 ec 0c             	sub    $0xc,%esp
c0108a8c:	68 22 b6 10 c0       	push   $0xc010b622
c0108a91:	e8 f6 75 ff ff       	call   c010008c <disp_str>
c0108a96:	83 c4 10             	add    $0x10,%esp
c0108a99:	83 ec 0c             	sub    $0xc,%esp
c0108a9c:	68 cb bd 10 c0       	push   $0xc010bdcb
c0108aa1:	e8 db fe ff ff       	call   c0108981 <spin>
c0108aa6:	83 c4 10             	add    $0x10,%esp
c0108aa9:	90                   	nop
c0108aaa:	c9                   	leave  
c0108aab:	c3                   	ret    

c0108aac <dead_lock>:
c0108aac:	55                   	push   %ebp
c0108aad:	89 e5                	mov    %esp,%ebp
c0108aaf:	b8 00 00 00 00       	mov    $0x0,%eax
c0108ab4:	5d                   	pop    %ebp
c0108ab5:	c3                   	ret    

c0108ab6 <sys_send_msg>:
c0108ab6:	55                   	push   %ebp
c0108ab7:	89 e5                	mov    %esp,%ebp
c0108ab9:	83 ec 58             	sub    $0x58,%esp
c0108abc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108ac3:	83 ec 0c             	sub    $0xc,%esp
c0108ac6:	ff 75 0c             	pushl  0xc(%ebp)
c0108ac9:	e8 28 ae ff ff       	call   c01038f6 <pid2proc>
c0108ace:	83 c4 10             	add    $0x10,%esp
c0108ad1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108ad4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108ad8:	74 2c                	je     c0108b06 <sys_send_msg+0x50>
c0108ada:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108add:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108ae3:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108ae8:	74 1c                	je     c0108b06 <sys_send_msg+0x50>
c0108aea:	68 5c 05 00 00       	push   $0x55c
c0108aef:	68 81 ba 10 c0       	push   $0xc010ba81
c0108af4:	68 81 ba 10 c0       	push   $0xc010ba81
c0108af9:	68 18 be 10 c0       	push   $0xc010be18
c0108afe:	e8 c2 fe ff ff       	call   c01089c5 <assertion_failure>
c0108b03:	83 c4 10             	add    $0x10,%esp
c0108b06:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b09:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108b0f:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108b14:	74 1c                	je     c0108b32 <sys_send_msg+0x7c>
c0108b16:	68 5e 05 00 00       	push   $0x55e
c0108b1b:	68 81 ba 10 c0       	push   $0xc010ba81
c0108b20:	68 81 ba 10 c0       	push   $0xc010ba81
c0108b25:	68 40 be 10 c0       	push   $0xc010be40
c0108b2a:	e8 96 fe ff ff       	call   c01089c5 <assertion_failure>
c0108b2f:	83 c4 10             	add    $0x10,%esp
c0108b32:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108b36:	75 22                	jne    c0108b5a <sys_send_msg+0xa4>
c0108b38:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108b3c:	75 1c                	jne    c0108b5a <sys_send_msg+0xa4>
c0108b3e:	68 61 05 00 00       	push   $0x561
c0108b43:	68 81 ba 10 c0       	push   $0xc010ba81
c0108b48:	68 81 ba 10 c0       	push   $0xc010ba81
c0108b4d:	68 63 be 10 c0       	push   $0xc010be63
c0108b52:	e8 6e fe ff ff       	call   c01089c5 <assertion_failure>
c0108b57:	83 c4 10             	add    $0x10,%esp
c0108b5a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b5d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b64:	84 c0                	test   %al,%al
c0108b66:	74 65                	je     c0108bcd <sys_send_msg+0x117>
c0108b68:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b6b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b72:	3c 01                	cmp    $0x1,%al
c0108b74:	74 57                	je     c0108bcd <sys_send_msg+0x117>
c0108b76:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b79:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b80:	3c 02                	cmp    $0x2,%al
c0108b82:	74 49                	je     c0108bcd <sys_send_msg+0x117>
c0108b84:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b87:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b8e:	3c 03                	cmp    $0x3,%al
c0108b90:	74 3b                	je     c0108bcd <sys_send_msg+0x117>
c0108b92:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b95:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b9c:	3c 04                	cmp    $0x4,%al
c0108b9e:	74 2d                	je     c0108bcd <sys_send_msg+0x117>
c0108ba0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ba3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108baa:	0f be c0             	movsbl %al,%eax
c0108bad:	83 ec 0c             	sub    $0xc,%esp
c0108bb0:	68 65 05 00 00       	push   $0x565
c0108bb5:	68 81 ba 10 c0       	push   $0xc010ba81
c0108bba:	68 81 ba 10 c0       	push   $0xc010ba81
c0108bbf:	50                   	push   %eax
c0108bc0:	68 74 be 10 c0       	push   $0xc010be74
c0108bc5:	e8 6d fe ff ff       	call   c0108a37 <assertion_failure2>
c0108bca:	83 c4 20             	add    $0x20,%esp
c0108bcd:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bd0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108bd7:	84 c0                	test   %al,%al
c0108bd9:	74 65                	je     c0108c40 <sys_send_msg+0x18a>
c0108bdb:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bde:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108be5:	3c 01                	cmp    $0x1,%al
c0108be7:	74 57                	je     c0108c40 <sys_send_msg+0x18a>
c0108be9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bec:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108bf3:	3c 02                	cmp    $0x2,%al
c0108bf5:	74 49                	je     c0108c40 <sys_send_msg+0x18a>
c0108bf7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bfa:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c01:	3c 03                	cmp    $0x3,%al
c0108c03:	74 3b                	je     c0108c40 <sys_send_msg+0x18a>
c0108c05:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c08:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c0f:	3c 04                	cmp    $0x4,%al
c0108c11:	74 2d                	je     c0108c40 <sys_send_msg+0x18a>
c0108c13:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c16:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c1d:	0f be c0             	movsbl %al,%eax
c0108c20:	83 ec 0c             	sub    $0xc,%esp
c0108c23:	68 68 05 00 00       	push   $0x568
c0108c28:	68 81 ba 10 c0       	push   $0xc010ba81
c0108c2d:	68 81 ba 10 c0       	push   $0xc010ba81
c0108c32:	50                   	push   %eax
c0108c33:	68 10 bf 10 c0       	push   $0xc010bf10
c0108c38:	e8 fa fd ff ff       	call   c0108a37 <assertion_failure2>
c0108c3d:	83 c4 20             	add    $0x20,%esp
c0108c40:	83 ec 0c             	sub    $0xc,%esp
c0108c43:	ff 75 10             	pushl  0x10(%ebp)
c0108c46:	e8 31 ad ff ff       	call   c010397c <proc2pid>
c0108c4b:	83 c4 10             	add    $0x10,%esp
c0108c4e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108c51:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108c58:	8b 45 08             	mov    0x8(%ebp),%eax
c0108c5b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108c5e:	83 ec 08             	sub    $0x8,%esp
c0108c61:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108c64:	ff 75 dc             	pushl  -0x24(%ebp)
c0108c67:	e8 a6 d3 ff ff       	call   c0106012 <get_physical_address_proc>
c0108c6c:	83 c4 10             	add    $0x10,%esp
c0108c6f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108c72:	83 ec 08             	sub    $0x8,%esp
c0108c75:	ff 75 e0             	pushl  -0x20(%ebp)
c0108c78:	ff 75 d8             	pushl  -0x28(%ebp)
c0108c7b:	e8 bf d2 ff ff       	call   c0105f3f <alloc_virtual_memory>
c0108c80:	83 c4 10             	add    $0x10,%esp
c0108c83:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108c86:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c89:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108c8f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108c92:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108c99:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108c9c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108c9f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108ca2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108ca5:	89 10                	mov    %edx,(%eax)
c0108ca7:	83 ec 08             	sub    $0x8,%esp
c0108caa:	ff 75 0c             	pushl  0xc(%ebp)
c0108cad:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108cb0:	e8 f7 fd ff ff       	call   c0108aac <dead_lock>
c0108cb5:	83 c4 10             	add    $0x10,%esp
c0108cb8:	83 f8 01             	cmp    $0x1,%eax
c0108cbb:	75 10                	jne    c0108ccd <sys_send_msg+0x217>
c0108cbd:	83 ec 0c             	sub    $0xc,%esp
c0108cc0:	68 a0 bf 10 c0       	push   $0xc010bfa0
c0108cc5:	e8 dd fc ff ff       	call   c01089a7 <panic>
c0108cca:	83 c4 10             	add    $0x10,%esp
c0108ccd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cd0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cd7:	3c 02                	cmp    $0x2,%al
c0108cd9:	0f 85 ca 01 00 00    	jne    c0108ea9 <sys_send_msg+0x3f3>
c0108cdf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ce2:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108ce8:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108ceb:	74 12                	je     c0108cff <sys_send_msg+0x249>
c0108ced:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cf0:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108cf6:	83 f8 12             	cmp    $0x12,%eax
c0108cf9:	0f 85 aa 01 00 00    	jne    c0108ea9 <sys_send_msg+0x3f3>
c0108cff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d02:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108d08:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108d0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d0e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108d14:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108d17:	83 ec 08             	sub    $0x8,%esp
c0108d1a:	ff 75 0c             	pushl  0xc(%ebp)
c0108d1d:	ff 75 c0             	pushl  -0x40(%ebp)
c0108d20:	e8 ed d2 ff ff       	call   c0106012 <get_physical_address_proc>
c0108d25:	83 c4 10             	add    $0x10,%esp
c0108d28:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108d2b:	83 ec 08             	sub    $0x8,%esp
c0108d2e:	ff 75 e0             	pushl  -0x20(%ebp)
c0108d31:	ff 75 bc             	pushl  -0x44(%ebp)
c0108d34:	e8 06 d2 ff ff       	call   c0105f3f <alloc_virtual_memory>
c0108d39:	83 c4 10             	add    $0x10,%esp
c0108d3c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108d3f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108d42:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108d45:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108d48:	83 ec 04             	sub    $0x4,%esp
c0108d4b:	51                   	push   %ecx
c0108d4c:	52                   	push   %edx
c0108d4d:	50                   	push   %eax
c0108d4e:	e8 59 e0 ff ff       	call   c0106dac <Memcpy>
c0108d53:	83 c4 10             	add    $0x10,%esp
c0108d56:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108d5b:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108d60:	75 0a                	jne    c0108d6c <sys_send_msg+0x2b6>
c0108d62:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108d69:	00 00 00 
c0108d6c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d6f:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108d76:	00 00 00 
c0108d79:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d7c:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108d83:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d86:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108d8d:	00 00 00 
c0108d90:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d93:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108d9a:	00 00 00 
c0108d9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108da0:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108da7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108daa:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108db1:	00 00 00 
c0108db4:	8b 45 10             	mov    0x10(%ebp),%eax
c0108db7:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108dbe:	00 00 00 
c0108dc1:	83 ec 0c             	sub    $0xc,%esp
c0108dc4:	ff 75 e8             	pushl  -0x18(%ebp)
c0108dc7:	e8 a0 09 00 00       	call   c010976c <unblock>
c0108dcc:	83 c4 10             	add    $0x10,%esp
c0108dcf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108dd2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108dd9:	84 c0                	test   %al,%al
c0108ddb:	74 1c                	je     c0108df9 <sys_send_msg+0x343>
c0108ddd:	68 a0 05 00 00       	push   $0x5a0
c0108de2:	68 81 ba 10 c0       	push   $0xc010ba81
c0108de7:	68 81 ba 10 c0       	push   $0xc010ba81
c0108dec:	68 ab bf 10 c0       	push   $0xc010bfab
c0108df1:	e8 cf fb ff ff       	call   c01089c5 <assertion_failure>
c0108df6:	83 c4 10             	add    $0x10,%esp
c0108df9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108dfc:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108e02:	83 f8 21             	cmp    $0x21,%eax
c0108e05:	74 1c                	je     c0108e23 <sys_send_msg+0x36d>
c0108e07:	68 a1 05 00 00       	push   $0x5a1
c0108e0c:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e11:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e16:	68 bf bf 10 c0       	push   $0xc010bfbf
c0108e1b:	e8 a5 fb ff ff       	call   c01089c5 <assertion_failure>
c0108e20:	83 c4 10             	add    $0x10,%esp
c0108e23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e26:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108e2c:	85 c0                	test   %eax,%eax
c0108e2e:	74 1c                	je     c0108e4c <sys_send_msg+0x396>
c0108e30:	68 a3 05 00 00       	push   $0x5a3
c0108e35:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e3a:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e3f:	68 dc bf 10 c0       	push   $0xc010bfdc
c0108e44:	e8 7c fb ff ff       	call   c01089c5 <assertion_failure>
c0108e49:	83 c4 10             	add    $0x10,%esp
c0108e4c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e4f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e56:	84 c0                	test   %al,%al
c0108e58:	74 1c                	je     c0108e76 <sys_send_msg+0x3c0>
c0108e5a:	68 a4 05 00 00       	push   $0x5a4
c0108e5f:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e64:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e69:	68 f1 bf 10 c0       	push   $0xc010bff1
c0108e6e:	e8 52 fb ff ff       	call   c01089c5 <assertion_failure>
c0108e73:	83 c4 10             	add    $0x10,%esp
c0108e76:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e79:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108e7f:	83 f8 21             	cmp    $0x21,%eax
c0108e82:	0f 84 45 01 00 00    	je     c0108fcd <sys_send_msg+0x517>
c0108e88:	68 a5 05 00 00       	push   $0x5a5
c0108e8d:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e92:	68 81 ba 10 c0       	push   $0xc010ba81
c0108e97:	68 08 c0 10 c0       	push   $0xc010c008
c0108e9c:	e8 24 fb ff ff       	call   c01089c5 <assertion_failure>
c0108ea1:	83 c4 10             	add    $0x10,%esp
c0108ea4:	e9 24 01 00 00       	jmp    c0108fcd <sys_send_msg+0x517>
c0108ea9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108eb0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108eb3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108eb6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108eb9:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108ebf:	85 c0                	test   %eax,%eax
c0108ec1:	75 1b                	jne    c0108ede <sys_send_msg+0x428>
c0108ec3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ec6:	8b 55 10             	mov    0x10(%ebp),%edx
c0108ec9:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108ecf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ed2:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108ed9:	00 00 00 
c0108edc:	eb 3f                	jmp    c0108f1d <sys_send_msg+0x467>
c0108ede:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ee1:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108ee7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108eea:	eb 12                	jmp    c0108efe <sys_send_msg+0x448>
c0108eec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108eef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108ef2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ef5:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108efb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108efe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108f02:	75 e8                	jne    c0108eec <sys_send_msg+0x436>
c0108f04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108f07:	8b 55 10             	mov    0x10(%ebp),%edx
c0108f0a:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108f10:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f13:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108f1a:	00 00 00 
c0108f1d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f20:	8b 55 08             	mov    0x8(%ebp),%edx
c0108f23:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108f29:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f2c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108f2f:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108f35:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f38:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108f3f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f42:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f49:	3c 01                	cmp    $0x1,%al
c0108f4b:	74 1c                	je     c0108f69 <sys_send_msg+0x4b3>
c0108f4d:	68 c7 05 00 00       	push   $0x5c7
c0108f52:	68 81 ba 10 c0       	push   $0xc010ba81
c0108f57:	68 81 ba 10 c0       	push   $0xc010ba81
c0108f5c:	68 2c c0 10 c0       	push   $0xc010c02c
c0108f61:	e8 5f fa ff ff       	call   c01089c5 <assertion_failure>
c0108f66:	83 c4 10             	add    $0x10,%esp
c0108f69:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f6c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108f72:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108f75:	74 1c                	je     c0108f93 <sys_send_msg+0x4dd>
c0108f77:	68 c8 05 00 00       	push   $0x5c8
c0108f7c:	68 81 ba 10 c0       	push   $0xc010ba81
c0108f81:	68 81 ba 10 c0       	push   $0xc010ba81
c0108f86:	68 48 c0 10 c0       	push   $0xc010c048
c0108f8b:	e8 35 fa ff ff       	call   c01089c5 <assertion_failure>
c0108f90:	83 c4 10             	add    $0x10,%esp
c0108f93:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f96:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108f9c:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108f9f:	74 1c                	je     c0108fbd <sys_send_msg+0x507>
c0108fa1:	68 c9 05 00 00       	push   $0x5c9
c0108fa6:	68 81 ba 10 c0       	push   $0xc010ba81
c0108fab:	68 81 ba 10 c0       	push   $0xc010ba81
c0108fb0:	68 6a c0 10 c0       	push   $0xc010c06a
c0108fb5:	e8 0b fa ff ff       	call   c01089c5 <assertion_failure>
c0108fba:	83 c4 10             	add    $0x10,%esp
c0108fbd:	83 ec 0c             	sub    $0xc,%esp
c0108fc0:	ff 75 10             	pushl  0x10(%ebp)
c0108fc3:	e8 68 07 00 00       	call   c0109730 <block>
c0108fc8:	83 c4 10             	add    $0x10,%esp
c0108fcb:	eb 01                	jmp    c0108fce <sys_send_msg+0x518>
c0108fcd:	90                   	nop
c0108fce:	b8 00 00 00 00       	mov    $0x0,%eax
c0108fd3:	c9                   	leave  
c0108fd4:	c3                   	ret    

c0108fd5 <sys_receive_msg>:
c0108fd5:	55                   	push   %ebp
c0108fd6:	89 e5                	mov    %esp,%ebp
c0108fd8:	83 ec 58             	sub    $0x58,%esp
c0108fdb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108fe2:	83 ec 0c             	sub    $0xc,%esp
c0108fe5:	ff 75 0c             	pushl  0xc(%ebp)
c0108fe8:	e8 09 a9 ff ff       	call   c01038f6 <pid2proc>
c0108fed:	83 c4 10             	add    $0x10,%esp
c0108ff0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108ff3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108ff7:	74 2c                	je     c0109025 <sys_receive_msg+0x50>
c0108ff9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ffc:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0109002:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0109007:	74 1c                	je     c0109025 <sys_receive_msg+0x50>
c0109009:	68 dd 05 00 00       	push   $0x5dd
c010900e:	68 81 ba 10 c0       	push   $0xc010ba81
c0109013:	68 81 ba 10 c0       	push   $0xc010ba81
c0109018:	68 40 be 10 c0       	push   $0xc010be40
c010901d:	e8 a3 f9 ff ff       	call   c01089c5 <assertion_failure>
c0109022:	83 c4 10             	add    $0x10,%esp
c0109025:	8b 45 10             	mov    0x10(%ebp),%eax
c0109028:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c010902e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0109033:	74 1c                	je     c0109051 <sys_receive_msg+0x7c>
c0109035:	68 df 05 00 00       	push   $0x5df
c010903a:	68 81 ba 10 c0       	push   $0xc010ba81
c010903f:	68 81 ba 10 c0       	push   $0xc010ba81
c0109044:	68 18 be 10 c0       	push   $0xc010be18
c0109049:	e8 77 f9 ff ff       	call   c01089c5 <assertion_failure>
c010904e:	83 c4 10             	add    $0x10,%esp
c0109051:	8b 45 10             	mov    0x10(%ebp),%eax
c0109054:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010905b:	84 c0                	test   %al,%al
c010905d:	74 65                	je     c01090c4 <sys_receive_msg+0xef>
c010905f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109062:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109069:	3c 01                	cmp    $0x1,%al
c010906b:	74 57                	je     c01090c4 <sys_receive_msg+0xef>
c010906d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109070:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109077:	3c 02                	cmp    $0x2,%al
c0109079:	74 49                	je     c01090c4 <sys_receive_msg+0xef>
c010907b:	8b 45 10             	mov    0x10(%ebp),%eax
c010907e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109085:	3c 03                	cmp    $0x3,%al
c0109087:	74 3b                	je     c01090c4 <sys_receive_msg+0xef>
c0109089:	8b 45 10             	mov    0x10(%ebp),%eax
c010908c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109093:	3c 04                	cmp    $0x4,%al
c0109095:	74 2d                	je     c01090c4 <sys_receive_msg+0xef>
c0109097:	8b 45 10             	mov    0x10(%ebp),%eax
c010909a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090a1:	0f be c0             	movsbl %al,%eax
c01090a4:	83 ec 0c             	sub    $0xc,%esp
c01090a7:	68 e2 05 00 00       	push   $0x5e2
c01090ac:	68 81 ba 10 c0       	push   $0xc010ba81
c01090b1:	68 81 ba 10 c0       	push   $0xc010ba81
c01090b6:	50                   	push   %eax
c01090b7:	68 74 be 10 c0       	push   $0xc010be74
c01090bc:	e8 76 f9 ff ff       	call   c0108a37 <assertion_failure2>
c01090c1:	83 c4 20             	add    $0x20,%esp
c01090c4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01090c8:	74 73                	je     c010913d <sys_receive_msg+0x168>
c01090ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090cd:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090d4:	84 c0                	test   %al,%al
c01090d6:	74 65                	je     c010913d <sys_receive_msg+0x168>
c01090d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090db:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090e2:	3c 01                	cmp    $0x1,%al
c01090e4:	74 57                	je     c010913d <sys_receive_msg+0x168>
c01090e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090e9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090f0:	3c 02                	cmp    $0x2,%al
c01090f2:	74 49                	je     c010913d <sys_receive_msg+0x168>
c01090f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090f7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090fe:	3c 03                	cmp    $0x3,%al
c0109100:	74 3b                	je     c010913d <sys_receive_msg+0x168>
c0109102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109105:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010910c:	3c 04                	cmp    $0x4,%al
c010910e:	74 2d                	je     c010913d <sys_receive_msg+0x168>
c0109110:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109113:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010911a:	0f be c0             	movsbl %al,%eax
c010911d:	83 ec 0c             	sub    $0xc,%esp
c0109120:	68 e6 05 00 00       	push   $0x5e6
c0109125:	68 81 ba 10 c0       	push   $0xc010ba81
c010912a:	68 81 ba 10 c0       	push   $0xc010ba81
c010912f:	50                   	push   %eax
c0109130:	68 10 bf 10 c0       	push   $0xc010bf10
c0109135:	e8 fd f8 ff ff       	call   c0108a37 <assertion_failure2>
c010913a:	83 c4 20             	add    $0x20,%esp
c010913d:	83 ec 0c             	sub    $0xc,%esp
c0109140:	ff 75 10             	pushl  0x10(%ebp)
c0109143:	e8 34 a8 ff ff       	call   c010397c <proc2pid>
c0109148:	83 c4 10             	add    $0x10,%esp
c010914b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010914e:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0109155:	8b 45 08             	mov    0x8(%ebp),%eax
c0109158:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010915b:	8b 45 10             	mov    0x10(%ebp),%eax
c010915e:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109164:	83 ec 08             	sub    $0x8,%esp
c0109167:	50                   	push   %eax
c0109168:	ff 75 d8             	pushl  -0x28(%ebp)
c010916b:	e8 a2 ce ff ff       	call   c0106012 <get_physical_address_proc>
c0109170:	83 c4 10             	add    $0x10,%esp
c0109173:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109176:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010917d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109180:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109186:	85 c0                	test   %eax,%eax
c0109188:	0f 84 c5 00 00 00    	je     c0109253 <sys_receive_msg+0x27e>
c010918e:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109192:	74 0d                	je     c01091a1 <sys_receive_msg+0x1cc>
c0109194:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010919b:	0f 85 b2 00 00 00    	jne    c0109253 <sys_receive_msg+0x27e>
c01091a1:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c01091a8:	83 ec 0c             	sub    $0xc,%esp
c01091ab:	ff 75 d0             	pushl  -0x30(%ebp)
c01091ae:	e8 49 85 ff ff       	call   c01016fc <sys_malloc>
c01091b3:	83 c4 10             	add    $0x10,%esp
c01091b6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01091b9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01091bc:	83 ec 04             	sub    $0x4,%esp
c01091bf:	50                   	push   %eax
c01091c0:	6a 00                	push   $0x0
c01091c2:	ff 75 cc             	pushl  -0x34(%ebp)
c01091c5:	e8 25 30 00 00       	call   c010c1ef <Memset>
c01091ca:	83 c4 10             	add    $0x10,%esp
c01091cd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01091d0:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c01091d6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01091d9:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c01091e0:	83 ec 08             	sub    $0x8,%esp
c01091e3:	ff 75 d0             	pushl  -0x30(%ebp)
c01091e6:	ff 75 d4             	pushl  -0x2c(%ebp)
c01091e9:	e8 51 cd ff ff       	call   c0105f3f <alloc_virtual_memory>
c01091ee:	83 c4 10             	add    $0x10,%esp
c01091f1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01091f4:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01091f7:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01091fa:	83 ec 04             	sub    $0x4,%esp
c01091fd:	52                   	push   %edx
c01091fe:	ff 75 cc             	pushl  -0x34(%ebp)
c0109201:	50                   	push   %eax
c0109202:	e8 a5 db ff ff       	call   c0106dac <Memcpy>
c0109207:	83 c4 10             	add    $0x10,%esp
c010920a:	8b 45 10             	mov    0x10(%ebp),%eax
c010920d:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109214:	00 00 00 
c0109217:	8b 45 10             	mov    0x10(%ebp),%eax
c010921a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109221:	00 00 00 
c0109224:	8b 45 10             	mov    0x10(%ebp),%eax
c0109227:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010922e:	00 00 00 
c0109231:	8b 45 10             	mov    0x10(%ebp),%eax
c0109234:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010923b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0109242:	83 ec 08             	sub    $0x8,%esp
c0109245:	ff 75 d0             	pushl  -0x30(%ebp)
c0109248:	ff 75 cc             	pushl  -0x34(%ebp)
c010924b:	e8 c1 84 ff ff       	call   c0101711 <sys_free>
c0109250:	83 c4 10             	add    $0x10,%esp
c0109253:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0109257:	0f 84 d4 03 00 00    	je     c0109631 <sys_receive_msg+0x65c>
c010925d:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109261:	75 26                	jne    c0109289 <sys_receive_msg+0x2b4>
c0109263:	8b 45 10             	mov    0x10(%ebp),%eax
c0109266:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010926c:	85 c0                	test   %eax,%eax
c010926e:	0f 84 8a 00 00 00    	je     c01092fe <sys_receive_msg+0x329>
c0109274:	8b 45 10             	mov    0x10(%ebp),%eax
c0109277:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010927d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109280:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0109287:	eb 75                	jmp    c01092fe <sys_receive_msg+0x329>
c0109289:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010928d:	78 6f                	js     c01092fe <sys_receive_msg+0x329>
c010928f:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109293:	7f 69                	jg     c01092fe <sys_receive_msg+0x329>
c0109295:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109298:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010929f:	3c 01                	cmp    $0x1,%al
c01092a1:	75 5b                	jne    c01092fe <sys_receive_msg+0x329>
c01092a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01092a6:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01092ac:	83 f8 12             	cmp    $0x12,%eax
c01092af:	74 0e                	je     c01092bf <sys_receive_msg+0x2ea>
c01092b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01092b4:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01092ba:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c01092bd:	75 3f                	jne    c01092fe <sys_receive_msg+0x329>
c01092bf:	8b 45 10             	mov    0x10(%ebp),%eax
c01092c2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01092c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01092cb:	eb 2b                	jmp    c01092f8 <sys_receive_msg+0x323>
c01092cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01092d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092d6:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01092dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01092df:	39 c2                	cmp    %eax,%edx
c01092e1:	75 09                	jne    c01092ec <sys_receive_msg+0x317>
c01092e3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01092ea:	eb 12                	jmp    c01092fe <sys_receive_msg+0x329>
c01092ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092ef:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c01092f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01092f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01092fc:	75 cf                	jne    c01092cd <sys_receive_msg+0x2f8>
c01092fe:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0109302:	0f 85 4e 02 00 00    	jne    c0109556 <sys_receive_msg+0x581>
c0109308:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010930b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010930e:	83 ec 08             	sub    $0x8,%esp
c0109311:	ff 75 dc             	pushl  -0x24(%ebp)
c0109314:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109317:	e8 23 cc ff ff       	call   c0105f3f <alloc_virtual_memory>
c010931c:	83 c4 10             	add    $0x10,%esp
c010931f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0109322:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109325:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010932b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010932e:	83 ec 0c             	sub    $0xc,%esp
c0109331:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109334:	e8 43 a6 ff ff       	call   c010397c <proc2pid>
c0109339:	83 c4 10             	add    $0x10,%esp
c010933c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010933f:	83 ec 08             	sub    $0x8,%esp
c0109342:	ff 75 b8             	pushl  -0x48(%ebp)
c0109345:	ff 75 bc             	pushl  -0x44(%ebp)
c0109348:	e8 c5 cc ff ff       	call   c0106012 <get_physical_address_proc>
c010934d:	83 c4 10             	add    $0x10,%esp
c0109350:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0109353:	83 ec 08             	sub    $0x8,%esp
c0109356:	ff 75 dc             	pushl  -0x24(%ebp)
c0109359:	ff 75 b4             	pushl  -0x4c(%ebp)
c010935c:	e8 de cb ff ff       	call   c0105f3f <alloc_virtual_memory>
c0109361:	83 c4 10             	add    $0x10,%esp
c0109364:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0109367:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010936a:	83 ec 04             	sub    $0x4,%esp
c010936d:	50                   	push   %eax
c010936e:	ff 75 b0             	pushl  -0x50(%ebp)
c0109371:	ff 75 c0             	pushl  -0x40(%ebp)
c0109374:	e8 33 da ff ff       	call   c0106dac <Memcpy>
c0109379:	83 c4 10             	add    $0x10,%esp
c010937c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010937f:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0109382:	8b 45 10             	mov    0x10(%ebp),%eax
c0109385:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010938b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010938e:	75 21                	jne    c01093b1 <sys_receive_msg+0x3dc>
c0109390:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109393:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109399:	8b 45 10             	mov    0x10(%ebp),%eax
c010939c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c01093a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093a5:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01093ac:	00 00 00 
c01093af:	eb 1f                	jmp    c01093d0 <sys_receive_msg+0x3fb>
c01093b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093b4:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c01093ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01093bd:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c01093c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093c6:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01093cd:	00 00 00 
c01093d0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093d3:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01093da:	00 00 00 
c01093dd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093e0:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01093e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093ea:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01093f1:	00 00 00 
c01093f4:	8b 45 10             	mov    0x10(%ebp),%eax
c01093f7:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01093fe:	00 00 00 
c0109401:	8b 45 10             	mov    0x10(%ebp),%eax
c0109404:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010940b:	00 00 00 
c010940e:	8b 45 10             	mov    0x10(%ebp),%eax
c0109411:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109418:	00 00 00 
c010941b:	83 ec 0c             	sub    $0xc,%esp
c010941e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109421:	e8 46 03 00 00       	call   c010976c <unblock>
c0109426:	83 c4 10             	add    $0x10,%esp
c0109429:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010942c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109432:	85 c0                	test   %eax,%eax
c0109434:	74 1c                	je     c0109452 <sys_receive_msg+0x47d>
c0109436:	68 56 06 00 00       	push   $0x656
c010943b:	68 81 ba 10 c0       	push   $0xc010ba81
c0109440:	68 81 ba 10 c0       	push   $0xc010ba81
c0109445:	68 7f c0 10 c0       	push   $0xc010c07f
c010944a:	e8 76 f5 ff ff       	call   c01089c5 <assertion_failure>
c010944f:	83 c4 10             	add    $0x10,%esp
c0109452:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109455:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010945c:	84 c0                	test   %al,%al
c010945e:	74 1c                	je     c010947c <sys_receive_msg+0x4a7>
c0109460:	68 57 06 00 00       	push   $0x657
c0109465:	68 81 ba 10 c0       	push   $0xc010ba81
c010946a:	68 81 ba 10 c0       	push   $0xc010ba81
c010946f:	68 97 c0 10 c0       	push   $0xc010c097
c0109474:	e8 4c f5 ff ff       	call   c01089c5 <assertion_failure>
c0109479:	83 c4 10             	add    $0x10,%esp
c010947c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010947f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109485:	83 f8 21             	cmp    $0x21,%eax
c0109488:	74 1c                	je     c01094a6 <sys_receive_msg+0x4d1>
c010948a:	68 58 06 00 00       	push   $0x658
c010948f:	68 81 ba 10 c0       	push   $0xc010ba81
c0109494:	68 81 ba 10 c0       	push   $0xc010ba81
c0109499:	68 b0 c0 10 c0       	push   $0xc010c0b0
c010949e:	e8 22 f5 ff ff       	call   c01089c5 <assertion_failure>
c01094a3:	83 c4 10             	add    $0x10,%esp
c01094a6:	8b 45 10             	mov    0x10(%ebp),%eax
c01094a9:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01094af:	85 c0                	test   %eax,%eax
c01094b1:	74 1c                	je     c01094cf <sys_receive_msg+0x4fa>
c01094b3:	68 5a 06 00 00       	push   $0x65a
c01094b8:	68 81 ba 10 c0       	push   $0xc010ba81
c01094bd:	68 81 ba 10 c0       	push   $0xc010ba81
c01094c2:	68 dc bf 10 c0       	push   $0xc010bfdc
c01094c7:	e8 f9 f4 ff ff       	call   c01089c5 <assertion_failure>
c01094cc:	83 c4 10             	add    $0x10,%esp
c01094cf:	8b 45 10             	mov    0x10(%ebp),%eax
c01094d2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094d9:	84 c0                	test   %al,%al
c01094db:	74 1c                	je     c01094f9 <sys_receive_msg+0x524>
c01094dd:	68 5b 06 00 00       	push   $0x65b
c01094e2:	68 81 ba 10 c0       	push   $0xc010ba81
c01094e7:	68 81 ba 10 c0       	push   $0xc010ba81
c01094ec:	68 f1 bf 10 c0       	push   $0xc010bff1
c01094f1:	e8 cf f4 ff ff       	call   c01089c5 <assertion_failure>
c01094f6:	83 c4 10             	add    $0x10,%esp
c01094f9:	8b 45 10             	mov    0x10(%ebp),%eax
c01094fc:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109502:	83 f8 21             	cmp    $0x21,%eax
c0109505:	74 1c                	je     c0109523 <sys_receive_msg+0x54e>
c0109507:	68 5c 06 00 00       	push   $0x65c
c010950c:	68 81 ba 10 c0       	push   $0xc010ba81
c0109511:	68 81 ba 10 c0       	push   $0xc010ba81
c0109516:	68 08 c0 10 c0       	push   $0xc010c008
c010951b:	e8 a5 f4 ff ff       	call   c01089c5 <assertion_failure>
c0109520:	83 c4 10             	add    $0x10,%esp
c0109523:	8b 45 10             	mov    0x10(%ebp),%eax
c0109526:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010952c:	83 f8 21             	cmp    $0x21,%eax
c010952f:	0f 84 f5 00 00 00    	je     c010962a <sys_receive_msg+0x655>
c0109535:	68 5d 06 00 00       	push   $0x65d
c010953a:	68 81 ba 10 c0       	push   $0xc010ba81
c010953f:	68 81 ba 10 c0       	push   $0xc010ba81
c0109544:	68 d4 c0 10 c0       	push   $0xc010c0d4
c0109549:	e8 77 f4 ff ff       	call   c01089c5 <assertion_failure>
c010954e:	83 c4 10             	add    $0x10,%esp
c0109551:	e9 d4 00 00 00       	jmp    c010962a <sys_receive_msg+0x655>
c0109556:	8b 45 10             	mov    0x10(%ebp),%eax
c0109559:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c0109560:	8b 45 10             	mov    0x10(%ebp),%eax
c0109563:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010956a:	3c 02                	cmp    $0x2,%al
c010956c:	74 1c                	je     c010958a <sys_receive_msg+0x5b5>
c010956e:	68 62 06 00 00       	push   $0x662
c0109573:	68 81 ba 10 c0       	push   $0xc010ba81
c0109578:	68 81 ba 10 c0       	push   $0xc010ba81
c010957d:	68 f3 c0 10 c0       	push   $0xc010c0f3
c0109582:	e8 3e f4 ff ff       	call   c01089c5 <assertion_failure>
c0109587:	83 c4 10             	add    $0x10,%esp
c010958a:	8b 45 10             	mov    0x10(%ebp),%eax
c010958d:	8b 55 08             	mov    0x8(%ebp),%edx
c0109590:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109596:	8b 45 10             	mov    0x10(%ebp),%eax
c0109599:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01095a0:	3c 02                	cmp    $0x2,%al
c01095a2:	74 1c                	je     c01095c0 <sys_receive_msg+0x5eb>
c01095a4:	68 64 06 00 00       	push   $0x664
c01095a9:	68 81 ba 10 c0       	push   $0xc010ba81
c01095ae:	68 81 ba 10 c0       	push   $0xc010ba81
c01095b3:	68 f3 c0 10 c0       	push   $0xc010c0f3
c01095b8:	e8 08 f4 ff ff       	call   c01089c5 <assertion_failure>
c01095bd:	83 c4 10             	add    $0x10,%esp
c01095c0:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01095c4:	75 0f                	jne    c01095d5 <sys_receive_msg+0x600>
c01095c6:	8b 45 10             	mov    0x10(%ebp),%eax
c01095c9:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c01095d0:	00 00 00 
c01095d3:	eb 0c                	jmp    c01095e1 <sys_receive_msg+0x60c>
c01095d5:	8b 45 10             	mov    0x10(%ebp),%eax
c01095d8:	8b 55 0c             	mov    0xc(%ebp),%edx
c01095db:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c01095e1:	8b 45 10             	mov    0x10(%ebp),%eax
c01095e4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01095eb:	3c 02                	cmp    $0x2,%al
c01095ed:	74 2d                	je     c010961c <sys_receive_msg+0x647>
c01095ef:	8b 45 10             	mov    0x10(%ebp),%eax
c01095f2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01095f9:	0f be c0             	movsbl %al,%eax
c01095fc:	83 ec 0c             	sub    $0xc,%esp
c01095ff:	68 6f 06 00 00       	push   $0x66f
c0109604:	68 81 ba 10 c0       	push   $0xc010ba81
c0109609:	68 81 ba 10 c0       	push   $0xc010ba81
c010960e:	50                   	push   %eax
c010960f:	68 f3 c0 10 c0       	push   $0xc010c0f3
c0109614:	e8 1e f4 ff ff       	call   c0108a37 <assertion_failure2>
c0109619:	83 c4 20             	add    $0x20,%esp
c010961c:	83 ec 0c             	sub    $0xc,%esp
c010961f:	ff 75 10             	pushl  0x10(%ebp)
c0109622:	e8 09 01 00 00       	call   c0109730 <block>
c0109627:	83 c4 10             	add    $0x10,%esp
c010962a:	b8 00 00 00 00       	mov    $0x0,%eax
c010962f:	eb 02                	jmp    c0109633 <sys_receive_msg+0x65e>
c0109631:	90                   	nop
c0109632:	90                   	nop
c0109633:	c9                   	leave  
c0109634:	c3                   	ret    

c0109635 <send_rec>:
c0109635:	55                   	push   %ebp
c0109636:	89 e5                	mov    %esp,%ebp
c0109638:	83 ec 18             	sub    $0x18,%esp
c010963b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010963e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109641:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109648:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c010964c:	74 28                	je     c0109676 <send_rec+0x41>
c010964e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109652:	74 22                	je     c0109676 <send_rec+0x41>
c0109654:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109658:	74 1c                	je     c0109676 <send_rec+0x41>
c010965a:	68 81 06 00 00       	push   $0x681
c010965f:	68 81 ba 10 c0       	push   $0xc010ba81
c0109664:	68 81 ba 10 c0       	push   $0xc010ba81
c0109669:	68 14 c1 10 c0       	push   $0xc010c114
c010966e:	e8 52 f3 ff ff       	call   c01089c5 <assertion_failure>
c0109673:	83 c4 10             	add    $0x10,%esp
c0109676:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010967a:	75 14                	jne    c0109690 <send_rec+0x5b>
c010967c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010967f:	83 ec 04             	sub    $0x4,%esp
c0109682:	50                   	push   %eax
c0109683:	6a 00                	push   $0x0
c0109685:	ff 75 0c             	pushl  0xc(%ebp)
c0109688:	e8 62 2b 00 00       	call   c010c1ef <Memset>
c010968d:	83 c4 10             	add    $0x10,%esp
c0109690:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109694:	74 23                	je     c01096b9 <send_rec+0x84>
c0109696:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010969a:	74 34                	je     c01096d0 <send_rec+0x9b>
c010969c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01096a0:	75 74                	jne    c0109716 <send_rec+0xe1>
c01096a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096a5:	83 ec 08             	sub    $0x8,%esp
c01096a8:	ff 75 10             	pushl  0x10(%ebp)
c01096ab:	50                   	push   %eax
c01096ac:	e8 1f 80 ff ff       	call   c01016d0 <send_msg>
c01096b1:	83 c4 10             	add    $0x10,%esp
c01096b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01096b7:	eb 70                	jmp    c0109729 <send_rec+0xf4>
c01096b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096bc:	83 ec 08             	sub    $0x8,%esp
c01096bf:	ff 75 10             	pushl  0x10(%ebp)
c01096c2:	50                   	push   %eax
c01096c3:	e8 1e 80 ff ff       	call   c01016e6 <receive_msg>
c01096c8:	83 c4 10             	add    $0x10,%esp
c01096cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01096ce:	eb 59                	jmp    c0109729 <send_rec+0xf4>
c01096d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096d3:	83 ec 08             	sub    $0x8,%esp
c01096d6:	ff 75 10             	pushl  0x10(%ebp)
c01096d9:	50                   	push   %eax
c01096da:	e8 f1 7f ff ff       	call   c01016d0 <send_msg>
c01096df:	83 c4 10             	add    $0x10,%esp
c01096e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01096e5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01096e9:	75 3d                	jne    c0109728 <send_rec+0xf3>
c01096eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01096ee:	83 ec 04             	sub    $0x4,%esp
c01096f1:	50                   	push   %eax
c01096f2:	6a 00                	push   $0x0
c01096f4:	ff 75 0c             	pushl  0xc(%ebp)
c01096f7:	e8 f3 2a 00 00       	call   c010c1ef <Memset>
c01096fc:	83 c4 10             	add    $0x10,%esp
c01096ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109702:	83 ec 08             	sub    $0x8,%esp
c0109705:	ff 75 10             	pushl  0x10(%ebp)
c0109708:	50                   	push   %eax
c0109709:	e8 d8 7f ff ff       	call   c01016e6 <receive_msg>
c010970e:	83 c4 10             	add    $0x10,%esp
c0109711:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109714:	eb 12                	jmp    c0109728 <send_rec+0xf3>
c0109716:	83 ec 0c             	sub    $0xc,%esp
c0109719:	68 50 c1 10 c0       	push   $0xc010c150
c010971e:	e8 84 f2 ff ff       	call   c01089a7 <panic>
c0109723:	83 c4 10             	add    $0x10,%esp
c0109726:	eb 01                	jmp    c0109729 <send_rec+0xf4>
c0109728:	90                   	nop
c0109729:	b8 00 00 00 00       	mov    $0x0,%eax
c010972e:	c9                   	leave  
c010972f:	c3                   	ret    

c0109730 <block>:
c0109730:	55                   	push   %ebp
c0109731:	89 e5                	mov    %esp,%ebp
c0109733:	83 ec 08             	sub    $0x8,%esp
c0109736:	8b 45 08             	mov    0x8(%ebp),%eax
c0109739:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109740:	84 c0                	test   %al,%al
c0109742:	75 1c                	jne    c0109760 <block+0x30>
c0109744:	68 b0 06 00 00       	push   $0x6b0
c0109749:	68 81 ba 10 c0       	push   $0xc010ba81
c010974e:	68 81 ba 10 c0       	push   $0xc010ba81
c0109753:	68 65 c1 10 c0       	push   $0xc010c165
c0109758:	e8 68 f2 ff ff       	call   c01089c5 <assertion_failure>
c010975d:	83 c4 10             	add    $0x10,%esp
c0109760:	e8 13 a0 ff ff       	call   c0103778 <schedule_process>
c0109765:	b8 00 00 00 00       	mov    $0x0,%eax
c010976a:	c9                   	leave  
c010976b:	c3                   	ret    

c010976c <unblock>:
c010976c:	55                   	push   %ebp
c010976d:	89 e5                	mov    %esp,%ebp
c010976f:	83 ec 08             	sub    $0x8,%esp
c0109772:	8b 45 08             	mov    0x8(%ebp),%eax
c0109775:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010977c:	84 c0                	test   %al,%al
c010977e:	74 1c                	je     c010979c <unblock+0x30>
c0109780:	68 b9 06 00 00       	push   $0x6b9
c0109785:	68 81 ba 10 c0       	push   $0xc010ba81
c010978a:	68 81 ba 10 c0       	push   $0xc010ba81
c010978f:	68 7d c1 10 c0       	push   $0xc010c17d
c0109794:	e8 2c f2 ff ff       	call   c01089c5 <assertion_failure>
c0109799:	83 c4 10             	add    $0x10,%esp
c010979c:	8b 45 08             	mov    0x8(%ebp),%eax
c010979f:	05 60 02 00 00       	add    $0x260,%eax
c01097a4:	83 ec 08             	sub    $0x8,%esp
c01097a7:	50                   	push   %eax
c01097a8:	68 ec fd 10 c0       	push   $0xc010fdec
c01097ad:	e8 ce 0a 00 00       	call   c010a280 <appendToDoubleLinkList>
c01097b2:	83 c4 10             	add    $0x10,%esp
c01097b5:	b8 00 00 00 00       	mov    $0x0,%eax
c01097ba:	c9                   	leave  
c01097bb:	c3                   	ret    

c01097bc <get_ticks_ipc>:
c01097bc:	55                   	push   %ebp
c01097bd:	89 e5                	mov    %esp,%ebp
c01097bf:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01097c5:	83 ec 04             	sub    $0x4,%esp
c01097c8:	6a 7c                	push   $0x7c
c01097ca:	6a 00                	push   $0x0
c01097cc:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01097d2:	50                   	push   %eax
c01097d3:	e8 17 2a 00 00       	call   c010c1ef <Memset>
c01097d8:	83 c4 10             	add    $0x10,%esp
c01097db:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c01097e2:	00 00 00 
c01097e5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01097ec:	83 ec 04             	sub    $0x4,%esp
c01097ef:	6a 01                	push   $0x1
c01097f1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01097f7:	50                   	push   %eax
c01097f8:	6a 03                	push   $0x3
c01097fa:	e8 36 fe ff ff       	call   c0109635 <send_rec>
c01097ff:	83 c4 10             	add    $0x10,%esp
c0109802:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109805:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010980b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010980e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109811:	c9                   	leave  
c0109812:	c3                   	ret    

c0109813 <itoa>:
c0109813:	55                   	push   %ebp
c0109814:	89 e5                	mov    %esp,%ebp
c0109816:	53                   	push   %ebx
c0109817:	83 ec 14             	sub    $0x14,%esp
c010981a:	8b 45 08             	mov    0x8(%ebp),%eax
c010981d:	99                   	cltd   
c010981e:	f7 7d 10             	idivl  0x10(%ebp)
c0109821:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109824:	8b 45 08             	mov    0x8(%ebp),%eax
c0109827:	99                   	cltd   
c0109828:	f7 7d 10             	idivl  0x10(%ebp)
c010982b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010982e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109832:	74 14                	je     c0109848 <itoa+0x35>
c0109834:	83 ec 04             	sub    $0x4,%esp
c0109837:	ff 75 10             	pushl  0x10(%ebp)
c010983a:	ff 75 0c             	pushl  0xc(%ebp)
c010983d:	ff 75 f0             	pushl  -0x10(%ebp)
c0109840:	e8 ce ff ff ff       	call   c0109813 <itoa>
c0109845:	83 c4 10             	add    $0x10,%esp
c0109848:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010984b:	8d 58 30             	lea    0x30(%eax),%ebx
c010984e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109851:	8b 00                	mov    (%eax),%eax
c0109853:	8d 48 01             	lea    0x1(%eax),%ecx
c0109856:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109859:	89 0a                	mov    %ecx,(%edx)
c010985b:	89 da                	mov    %ebx,%edx
c010985d:	88 10                	mov    %dl,(%eax)
c010985f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109862:	8b 00                	mov    (%eax),%eax
c0109864:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109867:	c9                   	leave  
c0109868:	c3                   	ret    

c0109869 <i2a>:
c0109869:	55                   	push   %ebp
c010986a:	89 e5                	mov    %esp,%ebp
c010986c:	53                   	push   %ebx
c010986d:	83 ec 14             	sub    $0x14,%esp
c0109870:	8b 45 08             	mov    0x8(%ebp),%eax
c0109873:	99                   	cltd   
c0109874:	f7 7d 0c             	idivl  0xc(%ebp)
c0109877:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010987a:	8b 45 08             	mov    0x8(%ebp),%eax
c010987d:	99                   	cltd   
c010987e:	f7 7d 0c             	idivl  0xc(%ebp)
c0109881:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109884:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109888:	74 14                	je     c010989e <i2a+0x35>
c010988a:	83 ec 04             	sub    $0x4,%esp
c010988d:	ff 75 10             	pushl  0x10(%ebp)
c0109890:	ff 75 0c             	pushl  0xc(%ebp)
c0109893:	ff 75 f0             	pushl  -0x10(%ebp)
c0109896:	e8 ce ff ff ff       	call   c0109869 <i2a>
c010989b:	83 c4 10             	add    $0x10,%esp
c010989e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01098a2:	7f 0a                	jg     c01098ae <i2a+0x45>
c01098a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098a7:	83 c0 30             	add    $0x30,%eax
c01098aa:	89 c3                	mov    %eax,%ebx
c01098ac:	eb 08                	jmp    c01098b6 <i2a+0x4d>
c01098ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098b1:	83 c0 37             	add    $0x37,%eax
c01098b4:	89 c3                	mov    %eax,%ebx
c01098b6:	8b 45 10             	mov    0x10(%ebp),%eax
c01098b9:	8b 00                	mov    (%eax),%eax
c01098bb:	8d 48 01             	lea    0x1(%eax),%ecx
c01098be:	8b 55 10             	mov    0x10(%ebp),%edx
c01098c1:	89 0a                	mov    %ecx,(%edx)
c01098c3:	88 18                	mov    %bl,(%eax)
c01098c5:	8b 45 10             	mov    0x10(%ebp),%eax
c01098c8:	8b 00                	mov    (%eax),%eax
c01098ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01098cd:	c9                   	leave  
c01098ce:	c3                   	ret    

c01098cf <inform_int>:
c01098cf:	55                   	push   %ebp
c01098d0:	89 e5                	mov    %esp,%ebp
c01098d2:	83 ec 18             	sub    $0x18,%esp
c01098d5:	83 ec 0c             	sub    $0xc,%esp
c01098d8:	ff 75 08             	pushl  0x8(%ebp)
c01098db:	e8 16 a0 ff ff       	call   c01038f6 <pid2proc>
c01098e0:	83 c4 10             	add    $0x10,%esp
c01098e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01098e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098e9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01098f0:	0f be c0             	movsbl %al,%eax
c01098f3:	83 e0 02             	and    $0x2,%eax
c01098f6:	85 c0                	test   %eax,%eax
c01098f8:	0f 84 8e 00 00 00    	je     c010998c <inform_int+0xbd>
c01098fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109901:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109907:	3d 13 02 00 00       	cmp    $0x213,%eax
c010990c:	74 0e                	je     c010991c <inform_int+0x4d>
c010990e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109911:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109917:	83 f8 12             	cmp    $0x12,%eax
c010991a:	75 7d                	jne    c0109999 <inform_int+0xca>
c010991c:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109923:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109926:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010992c:	83 ec 08             	sub    $0x8,%esp
c010992f:	ff 75 f0             	pushl  -0x10(%ebp)
c0109932:	50                   	push   %eax
c0109933:	e8 07 c6 ff ff       	call   c0105f3f <alloc_virtual_memory>
c0109938:	83 c4 10             	add    $0x10,%esp
c010993b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010993e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109941:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109947:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010994a:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109951:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109954:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c010995b:	00 00 00 
c010995e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109961:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109968:	00 00 00 
c010996b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109972:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109975:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010997c:	83 ec 0c             	sub    $0xc,%esp
c010997f:	ff 75 f4             	pushl  -0xc(%ebp)
c0109982:	e8 e5 fd ff ff       	call   c010976c <unblock>
c0109987:	83 c4 10             	add    $0x10,%esp
c010998a:	eb 0d                	jmp    c0109999 <inform_int+0xca>
c010998c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010998f:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109996:	00 00 00 
c0109999:	90                   	nop
c010999a:	c9                   	leave  
c010999b:	c3                   	ret    

c010999c <strcmp>:
c010999c:	55                   	push   %ebp
c010999d:	89 e5                	mov    %esp,%ebp
c010999f:	83 ec 10             	sub    $0x10,%esp
c01099a2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01099a6:	74 06                	je     c01099ae <strcmp+0x12>
c01099a8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01099ac:	75 08                	jne    c01099b6 <strcmp+0x1a>
c01099ae:	8b 45 08             	mov    0x8(%ebp),%eax
c01099b1:	2b 45 0c             	sub    0xc(%ebp),%eax
c01099b4:	eb 53                	jmp    c0109a09 <strcmp+0x6d>
c01099b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01099b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01099bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01099bf:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01099c2:	eb 18                	jmp    c01099dc <strcmp+0x40>
c01099c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01099c7:	0f b6 10             	movzbl (%eax),%edx
c01099ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01099cd:	0f b6 00             	movzbl (%eax),%eax
c01099d0:	38 c2                	cmp    %al,%dl
c01099d2:	75 1e                	jne    c01099f2 <strcmp+0x56>
c01099d4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01099d8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01099dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01099df:	0f b6 00             	movzbl (%eax),%eax
c01099e2:	84 c0                	test   %al,%al
c01099e4:	74 0d                	je     c01099f3 <strcmp+0x57>
c01099e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01099e9:	0f b6 00             	movzbl (%eax),%eax
c01099ec:	84 c0                	test   %al,%al
c01099ee:	75 d4                	jne    c01099c4 <strcmp+0x28>
c01099f0:	eb 01                	jmp    c01099f3 <strcmp+0x57>
c01099f2:	90                   	nop
c01099f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01099f6:	0f b6 00             	movzbl (%eax),%eax
c01099f9:	0f be d0             	movsbl %al,%edx
c01099fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01099ff:	0f b6 00             	movzbl (%eax),%eax
c0109a02:	0f be c0             	movsbl %al,%eax
c0109a05:	29 c2                	sub    %eax,%edx
c0109a07:	89 d0                	mov    %edx,%eax
c0109a09:	c9                   	leave  
c0109a0a:	c3                   	ret    

c0109a0b <create_user_process_address_space>:
c0109a0b:	55                   	push   %ebp
c0109a0c:	89 e5                	mov    %esp,%ebp
c0109a0e:	83 ec 18             	sub    $0x18,%esp
c0109a11:	83 ec 08             	sub    $0x8,%esp
c0109a14:	6a 00                	push   $0x0
c0109a16:	6a 01                	push   $0x1
c0109a18:	e8 5a c8 ff ff       	call   c0106277 <alloc_memory>
c0109a1d:	83 c4 10             	add    $0x10,%esp
c0109a20:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109a23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a26:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109a2d:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109a34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109a37:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109a3c:	c1 e8 0c             	shr    $0xc,%eax
c0109a3f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109a42:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109a45:	83 c0 07             	add    $0x7,%eax
c0109a48:	c1 e8 03             	shr    $0x3,%eax
c0109a4b:	89 c2                	mov    %eax,%edx
c0109a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a50:	89 50 04             	mov    %edx,0x4(%eax)
c0109a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a56:	8b 40 04             	mov    0x4(%eax),%eax
c0109a59:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109a5e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0109a64:	85 c0                	test   %eax,%eax
c0109a66:	0f 48 c2             	cmovs  %edx,%eax
c0109a69:	c1 f8 0c             	sar    $0xc,%eax
c0109a6c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109a6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109a72:	83 ec 08             	sub    $0x8,%esp
c0109a75:	6a 00                	push   $0x0
c0109a77:	50                   	push   %eax
c0109a78:	e8 fa c7 ff ff       	call   c0106277 <alloc_memory>
c0109a7d:	83 c4 10             	add    $0x10,%esp
c0109a80:	89 c2                	mov    %eax,%edx
c0109a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a85:	89 10                	mov    %edx,(%eax)
c0109a87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a8a:	83 ec 0c             	sub    $0xc,%esp
c0109a8d:	50                   	push   %eax
c0109a8e:	e8 b6 bf ff ff       	call   c0105a49 <init_bitmap>
c0109a93:	83 c4 10             	add    $0x10,%esp
c0109a96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a99:	c9                   	leave  
c0109a9a:	c3                   	ret    

c0109a9b <user_process>:
c0109a9b:	55                   	push   %ebp
c0109a9c:	89 e5                	mov    %esp,%ebp
c0109a9e:	83 ec 38             	sub    $0x38,%esp
c0109aa1:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109aa8:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109aaf:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109ab6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0109aba:	75 0e                	jne    c0109aca <user_process+0x2f>
c0109abc:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109ac2:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109ac8:	eb 0c                	jmp    c0109ad6 <user_process+0x3b>
c0109aca:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109ad0:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109ad6:	e8 13 69 ff ff       	call   c01003ee <get_running_thread_pcb>
c0109adb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109ade:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ae1:	8b 55 14             	mov    0x14(%ebp),%edx
c0109ae4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109aea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109aed:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109af3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109af6:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109afc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109aff:	05 00 10 00 00       	add    $0x1000,%eax
c0109b04:	89 c2                	mov    %eax,%edx
c0109b06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b09:	89 10                	mov    %edx,(%eax)
c0109b0b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b0e:	8b 00                	mov    (%eax),%eax
c0109b10:	83 e8 44             	sub    $0x44,%eax
c0109b13:	89 c2                	mov    %eax,%edx
c0109b15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b18:	89 10                	mov    %edx,(%eax)
c0109b1a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b1d:	8b 00                	mov    (%eax),%eax
c0109b1f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109b22:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109b26:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109b2c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109b30:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109b34:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109b38:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109b3c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109b40:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109b44:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109b4a:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109b4e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b51:	89 50 34             	mov    %edx,0x34(%eax)
c0109b54:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109b58:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b5b:	89 50 0c             	mov    %edx,0xc(%eax)
c0109b5e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109b62:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b65:	89 50 04             	mov    %edx,0x4(%eax)
c0109b68:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109b6c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b6f:	89 50 08             	mov    %edx,0x8(%eax)
c0109b72:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109b76:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b79:	89 50 40             	mov    %edx,0x40(%eax)
c0109b7c:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109b80:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b83:	89 10                	mov    %edx,(%eax)
c0109b85:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b88:	8b 55 08             	mov    0x8(%ebp),%edx
c0109b8b:	89 50 30             	mov    %edx,0x30(%eax)
c0109b8e:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109b92:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b95:	89 50 38             	mov    %edx,0x38(%eax)
c0109b98:	83 ec 08             	sub    $0x8,%esp
c0109b9b:	6a 01                	push   $0x1
c0109b9d:	68 00 f0 ff bf       	push   $0xbffff000
c0109ba2:	e8 08 c6 ff ff       	call   c01061af <alloc_physical_memory>
c0109ba7:	83 c4 10             	add    $0x10,%esp
c0109baa:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109bb0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109bb3:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109bb6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109bb9:	83 ec 0c             	sub    $0xc,%esp
c0109bbc:	50                   	push   %eax
c0109bbd:	e8 ff 66 ff ff       	call   c01002c1 <restart>
c0109bc2:	83 c4 10             	add    $0x10,%esp
c0109bc5:	90                   	nop
c0109bc6:	c9                   	leave  
c0109bc7:	c3                   	ret    

c0109bc8 <clone_pcb>:
c0109bc8:	55                   	push   %ebp
c0109bc9:	89 e5                	mov    %esp,%ebp
c0109bcb:	83 ec 38             	sub    $0x38,%esp
c0109bce:	83 ec 08             	sub    $0x8,%esp
c0109bd1:	6a 00                	push   $0x0
c0109bd3:	6a 01                	push   $0x1
c0109bd5:	e8 9d c6 ff ff       	call   c0106277 <alloc_memory>
c0109bda:	83 c4 10             	add    $0x10,%esp
c0109bdd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109be0:	83 ec 04             	sub    $0x4,%esp
c0109be3:	68 00 10 00 00       	push   $0x1000
c0109be8:	6a 00                	push   $0x0
c0109bea:	ff 75 f4             	pushl  -0xc(%ebp)
c0109bed:	e8 fd 25 00 00       	call   c010c1ef <Memset>
c0109bf2:	83 c4 10             	add    $0x10,%esp
c0109bf5:	83 ec 04             	sub    $0x4,%esp
c0109bf8:	68 00 10 00 00       	push   $0x1000
c0109bfd:	ff 75 08             	pushl  0x8(%ebp)
c0109c00:	ff 75 f4             	pushl  -0xc(%ebp)
c0109c03:	e8 a4 d1 ff ff       	call   c0106dac <Memcpy>
c0109c08:	83 c4 10             	add    $0x10,%esp
c0109c0b:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0109c10:	8d 50 01             	lea    0x1(%eax),%edx
c0109c13:	89 15 c8 06 11 c0    	mov    %edx,0xc01106c8
c0109c19:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109c1c:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109c22:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c25:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109c2b:	89 c2                	mov    %eax,%edx
c0109c2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c30:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109c36:	83 ec 08             	sub    $0x8,%esp
c0109c39:	6a 00                	push   $0x0
c0109c3b:	6a 01                	push   $0x1
c0109c3d:	e8 35 c6 ff ff       	call   c0106277 <alloc_memory>
c0109c42:	83 c4 10             	add    $0x10,%esp
c0109c45:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109c48:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c4b:	05 00 0c 00 00       	add    $0xc00,%eax
c0109c50:	83 ec 04             	sub    $0x4,%esp
c0109c53:	68 00 04 00 00       	push   $0x400
c0109c58:	68 00 fc ff ff       	push   $0xfffffc00
c0109c5d:	50                   	push   %eax
c0109c5e:	e8 49 d1 ff ff       	call   c0106dac <Memcpy>
c0109c63:	83 c4 10             	add    $0x10,%esp
c0109c66:	83 ec 0c             	sub    $0xc,%esp
c0109c69:	ff 75 f0             	pushl  -0x10(%ebp)
c0109c6c:	e8 1d c4 ff ff       	call   c010608e <get_physical_address>
c0109c71:	83 c4 10             	add    $0x10,%esp
c0109c74:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109c77:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c7a:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109c7f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109c82:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109c85:	83 c8 07             	or     $0x7,%eax
c0109c88:	89 c2                	mov    %eax,%edx
c0109c8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109c8d:	89 10                	mov    %edx,(%eax)
c0109c8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c92:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109c95:	89 50 08             	mov    %edx,0x8(%eax)
c0109c98:	e8 6e fd ff ff       	call   c0109a0b <create_user_process_address_space>
c0109c9d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109ca0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109ca3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ca6:	89 50 0c             	mov    %edx,0xc(%eax)
c0109ca9:	8b 45 08             	mov    0x8(%ebp),%eax
c0109cac:	8b 40 0c             	mov    0xc(%eax),%eax
c0109caf:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109cb2:	83 ec 04             	sub    $0x4,%esp
c0109cb5:	6a 0c                	push   $0xc
c0109cb7:	ff 75 e0             	pushl  -0x20(%ebp)
c0109cba:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109cbd:	e8 ea d0 ff ff       	call   c0106dac <Memcpy>
c0109cc2:	83 c4 10             	add    $0x10,%esp
c0109cc5:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109ccc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109ccf:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109cd4:	c1 e8 0c             	shr    $0xc,%eax
c0109cd7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109cda:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109cdd:	83 c0 07             	add    $0x7,%eax
c0109ce0:	c1 e8 03             	shr    $0x3,%eax
c0109ce3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109ce6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109ce9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109cec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109cef:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109cf4:	c1 e8 0c             	shr    $0xc,%eax
c0109cf7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109cfa:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109cfd:	83 ec 08             	sub    $0x8,%esp
c0109d00:	6a 00                	push   $0x0
c0109d02:	50                   	push   %eax
c0109d03:	e8 6f c5 ff ff       	call   c0106277 <alloc_memory>
c0109d08:	83 c4 10             	add    $0x10,%esp
c0109d0b:	89 c2                	mov    %eax,%edx
c0109d0d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d10:	89 10                	mov    %edx,(%eax)
c0109d12:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109d15:	c1 e0 0c             	shl    $0xc,%eax
c0109d18:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109d1b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d1e:	8b 10                	mov    (%eax),%edx
c0109d20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d23:	8b 00                	mov    (%eax),%eax
c0109d25:	83 ec 04             	sub    $0x4,%esp
c0109d28:	ff 75 cc             	pushl  -0x34(%ebp)
c0109d2b:	52                   	push   %edx
c0109d2c:	50                   	push   %eax
c0109d2d:	e8 7a d0 ff ff       	call   c0106dac <Memcpy>
c0109d32:	83 c4 10             	add    $0x10,%esp
c0109d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d38:	c9                   	leave  
c0109d39:	c3                   	ret    

c0109d3a <build_body_stack>:
c0109d3a:	55                   	push   %ebp
c0109d3b:	89 e5                	mov    %esp,%ebp
c0109d3d:	83 ec 48             	sub    $0x48,%esp
c0109d40:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d43:	8b 40 0c             	mov    0xc(%eax),%eax
c0109d46:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109d49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d4c:	8b 50 04             	mov    0x4(%eax),%edx
c0109d4f:	8b 00                	mov    (%eax),%eax
c0109d51:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109d54:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109d57:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109d5a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109d5d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109d60:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109d63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d66:	8b 40 08             	mov    0x8(%eax),%eax
c0109d69:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109d6c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109d73:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109d7a:	e8 c9 cf ff ff       	call   c0106d48 <intr_disable>
c0109d7f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109d82:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109d89:	e9 c2 00 00 00       	jmp    c0109e50 <build_body_stack+0x116>
c0109d8e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109d91:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109d94:	01 d0                	add    %edx,%eax
c0109d96:	0f b6 00             	movzbl (%eax),%eax
c0109d99:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109d9c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109da3:	e9 9a 00 00 00       	jmp    c0109e42 <build_body_stack+0x108>
c0109da8:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109dac:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109daf:	89 c1                	mov    %eax,%ecx
c0109db1:	d3 fa                	sar    %cl,%edx
c0109db3:	89 d0                	mov    %edx,%eax
c0109db5:	83 e0 01             	and    $0x1,%eax
c0109db8:	85 c0                	test   %eax,%eax
c0109dba:	75 06                	jne    c0109dc2 <build_body_stack+0x88>
c0109dbc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109dc0:	eb 7c                	jmp    c0109e3e <build_body_stack+0x104>
c0109dc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dc5:	8b 40 08             	mov    0x8(%eax),%eax
c0109dc8:	83 ec 0c             	sub    $0xc,%esp
c0109dcb:	50                   	push   %eax
c0109dcc:	e8 01 66 ff ff       	call   c01003d2 <update_cr3>
c0109dd1:	83 c4 10             	add    $0x10,%esp
c0109dd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dd7:	c1 e0 0c             	shl    $0xc,%eax
c0109dda:	89 c2                	mov    %eax,%edx
c0109ddc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109ddf:	01 d0                	add    %edx,%eax
c0109de1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109de4:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109de7:	8b 45 10             	mov    0x10(%ebp),%eax
c0109dea:	83 ec 04             	sub    $0x4,%esp
c0109ded:	68 00 10 00 00       	push   $0x1000
c0109df2:	52                   	push   %edx
c0109df3:	50                   	push   %eax
c0109df4:	e8 b3 cf ff ff       	call   c0106dac <Memcpy>
c0109df9:	83 c4 10             	add    $0x10,%esp
c0109dfc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109dff:	8b 40 08             	mov    0x8(%eax),%eax
c0109e02:	83 ec 0c             	sub    $0xc,%esp
c0109e05:	50                   	push   %eax
c0109e06:	e8 c7 65 ff ff       	call   c01003d2 <update_cr3>
c0109e0b:	83 c4 10             	add    $0x10,%esp
c0109e0e:	83 ec 08             	sub    $0x8,%esp
c0109e11:	ff 75 cc             	pushl  -0x34(%ebp)
c0109e14:	6a 01                	push   $0x1
c0109e16:	e8 be c4 ff ff       	call   c01062d9 <get_a_virtual_page>
c0109e1b:	83 c4 10             	add    $0x10,%esp
c0109e1e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109e21:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109e24:	83 ec 04             	sub    $0x4,%esp
c0109e27:	68 00 10 00 00       	push   $0x1000
c0109e2c:	52                   	push   %edx
c0109e2d:	50                   	push   %eax
c0109e2e:	e8 79 cf ff ff       	call   c0106dac <Memcpy>
c0109e33:	83 c4 10             	add    $0x10,%esp
c0109e36:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109e3a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109e3e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109e42:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109e46:	0f 8e 5c ff ff ff    	jle    c0109da8 <build_body_stack+0x6e>
c0109e4c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109e50:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e53:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109e56:	0f 87 32 ff ff ff    	ja     c0109d8e <build_body_stack+0x54>
c0109e5c:	83 ec 0c             	sub    $0xc,%esp
c0109e5f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109e62:	e8 0a cf ff ff       	call   c0106d71 <intr_set_status>
c0109e67:	83 c4 10             	add    $0x10,%esp
c0109e6a:	90                   	nop
c0109e6b:	c9                   	leave  
c0109e6c:	c3                   	ret    

c0109e6d <build_process_kernel_stack>:
c0109e6d:	55                   	push   %ebp
c0109e6e:	89 e5                	mov    %esp,%ebp
c0109e70:	83 ec 28             	sub    $0x28,%esp
c0109e73:	e8 d0 ce ff ff       	call   c0106d48 <intr_disable>
c0109e78:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109e7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e7e:	05 00 10 00 00       	add    $0x1000,%eax
c0109e83:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e89:	8b 00                	mov    (%eax),%eax
c0109e8b:	83 f8 38             	cmp    $0x38,%eax
c0109e8e:	74 06                	je     c0109e96 <build_process_kernel_stack+0x29>
c0109e90:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109e94:	eb f0                	jmp    c0109e86 <build_process_kernel_stack+0x19>
c0109e96:	90                   	nop
c0109e97:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e9a:	05 00 10 00 00       	add    $0x1000,%eax
c0109e9f:	89 c2                	mov    %eax,%edx
c0109ea1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ea4:	89 50 04             	mov    %edx,0x4(%eax)
c0109ea7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109eaa:	83 c0 2c             	add    $0x2c,%eax
c0109ead:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109eb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109eb3:	83 e8 04             	sub    $0x4,%eax
c0109eb6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109eb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ebc:	83 e8 08             	sub    $0x8,%eax
c0109ebf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109ec2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ec5:	83 e8 0c             	sub    $0xc,%eax
c0109ec8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109ecb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ece:	83 e8 10             	sub    $0x10,%eax
c0109ed1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109ed4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ed7:	83 e8 14             	sub    $0x14,%eax
c0109eda:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109edd:	ba b2 02 10 c0       	mov    $0xc01002b2,%edx
c0109ee2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109ee5:	89 10                	mov    %edx,(%eax)
c0109ee7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109eea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109ef0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109ef3:	8b 10                	mov    (%eax),%edx
c0109ef5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109ef8:	89 10                	mov    %edx,(%eax)
c0109efa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109efd:	8b 10                	mov    (%eax),%edx
c0109eff:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109f02:	89 10                	mov    %edx,(%eax)
c0109f04:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109f07:	8b 10                	mov    (%eax),%edx
c0109f09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f0c:	89 10                	mov    %edx,(%eax)
c0109f0e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109f11:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109f17:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f1a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109f1d:	89 10                	mov    %edx,(%eax)
c0109f1f:	83 ec 0c             	sub    $0xc,%esp
c0109f22:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f25:	e8 47 ce ff ff       	call   c0106d71 <intr_set_status>
c0109f2a:	83 c4 10             	add    $0x10,%esp
c0109f2d:	90                   	nop
c0109f2e:	c9                   	leave  
c0109f2f:	c3                   	ret    

c0109f30 <fork_process>:
c0109f30:	55                   	push   %ebp
c0109f31:	89 e5                	mov    %esp,%ebp
c0109f33:	83 ec 18             	sub    $0x18,%esp
c0109f36:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f39:	83 ec 0c             	sub    $0xc,%esp
c0109f3c:	50                   	push   %eax
c0109f3d:	e8 b4 99 ff ff       	call   c01038f6 <pid2proc>
c0109f42:	83 c4 10             	add    $0x10,%esp
c0109f45:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109f48:	83 ec 0c             	sub    $0xc,%esp
c0109f4b:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f4e:	e8 75 fc ff ff       	call   c0109bc8 <clone_pcb>
c0109f53:	83 c4 10             	add    $0x10,%esp
c0109f56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109f59:	83 ec 08             	sub    $0x8,%esp
c0109f5c:	6a 00                	push   $0x0
c0109f5e:	6a 01                	push   $0x1
c0109f60:	e8 12 c3 ff ff       	call   c0106277 <alloc_memory>
c0109f65:	83 c4 10             	add    $0x10,%esp
c0109f68:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109f6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109f6e:	83 ec 04             	sub    $0x4,%esp
c0109f71:	68 00 10 00 00       	push   $0x1000
c0109f76:	6a 00                	push   $0x0
c0109f78:	50                   	push   %eax
c0109f79:	e8 71 22 00 00       	call   c010c1ef <Memset>
c0109f7e:	83 c4 10             	add    $0x10,%esp
c0109f81:	83 ec 04             	sub    $0x4,%esp
c0109f84:	ff 75 ec             	pushl  -0x14(%ebp)
c0109f87:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f8a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f8d:	e8 a8 fd ff ff       	call   c0109d3a <build_body_stack>
c0109f92:	83 c4 10             	add    $0x10,%esp
c0109f95:	83 ec 0c             	sub    $0xc,%esp
c0109f98:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f9b:	e8 cd fe ff ff       	call   c0109e6d <build_process_kernel_stack>
c0109fa0:	83 c4 10             	add    $0x10,%esp
c0109fa3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109fa6:	05 6a 02 00 00       	add    $0x26a,%eax
c0109fab:	83 ec 08             	sub    $0x8,%esp
c0109fae:	50                   	push   %eax
c0109faf:	68 04 0f 11 c0       	push   $0xc0110f04
c0109fb4:	e8 c7 02 00 00       	call   c010a280 <appendToDoubleLinkList>
c0109fb9:	83 c4 10             	add    $0x10,%esp
c0109fbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109fbf:	c9                   	leave  
c0109fc0:	c3                   	ret    

c0109fc1 <process_execute>:
c0109fc1:	55                   	push   %ebp
c0109fc2:	89 e5                	mov    %esp,%ebp
c0109fc4:	83 ec 28             	sub    $0x28,%esp
c0109fc7:	e8 ca 04 00 00       	call   c010a496 <thread_init>
c0109fcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109fcf:	83 ec 0c             	sub    $0xc,%esp
c0109fd2:	ff 75 f4             	pushl  -0xc(%ebp)
c0109fd5:	e8 69 05 00 00       	call   c010a543 <thread_create>
c0109fda:	83 c4 10             	add    $0x10,%esp
c0109fdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fe0:	05 28 01 00 00       	add    $0x128,%eax
c0109fe5:	83 ec 08             	sub    $0x8,%esp
c0109fe8:	ff 75 10             	pushl  0x10(%ebp)
c0109feb:	50                   	push   %eax
c0109fec:	e8 1d 22 00 00       	call   c010c20e <Strcpy>
c0109ff1:	83 c4 10             	add    $0x10,%esp
c0109ff4:	83 ec 08             	sub    $0x8,%esp
c0109ff7:	6a 00                	push   $0x0
c0109ff9:	6a 01                	push   $0x1
c0109ffb:	e8 77 c2 ff ff       	call   c0106277 <alloc_memory>
c010a000:	83 c4 10             	add    $0x10,%esp
c010a003:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a006:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a009:	05 00 0c 00 00       	add    $0xc00,%eax
c010a00e:	83 ec 04             	sub    $0x4,%esp
c010a011:	68 00 04 00 00       	push   $0x400
c010a016:	68 00 fc ff ff       	push   $0xfffffc00
c010a01b:	50                   	push   %eax
c010a01c:	e8 8b cd ff ff       	call   c0106dac <Memcpy>
c010a021:	83 c4 10             	add    $0x10,%esp
c010a024:	83 ec 0c             	sub    $0xc,%esp
c010a027:	ff 75 f0             	pushl  -0x10(%ebp)
c010a02a:	e8 5f c0 ff ff       	call   c010608e <get_physical_address>
c010a02f:	83 c4 10             	add    $0x10,%esp
c010a032:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a035:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a038:	05 fc 0f 00 00       	add    $0xffc,%eax
c010a03d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a040:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010a043:	83 c8 07             	or     $0x7,%eax
c010a046:	89 c2                	mov    %eax,%edx
c010a048:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a04b:	89 10                	mov    %edx,(%eax)
c010a04d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a050:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010a053:	89 50 08             	mov    %edx,0x8(%eax)
c010a056:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a059:	83 c0 10             	add    $0x10,%eax
c010a05c:	83 ec 0c             	sub    $0xc,%esp
c010a05f:	50                   	push   %eax
c010a060:	e8 c8 c7 ff ff       	call   c010682d <init_memory_block_desc>
c010a065:	83 c4 10             	add    $0x10,%esp
c010a068:	e8 9e f9 ff ff       	call   c0109a0b <create_user_process_address_space>
c010a06d:	89 c2                	mov    %eax,%edx
c010a06f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a072:	89 50 0c             	mov    %edx,0xc(%eax)
c010a075:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a078:	8b 00                	mov    (%eax),%eax
c010a07a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a07d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a080:	c7 40 10 9b 9a 10 c0 	movl   $0xc0109a9b,0x10(%eax)
c010a087:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a08a:	8b 55 08             	mov    0x8(%ebp),%edx
c010a08d:	89 50 18             	mov    %edx,0x18(%eax)
c010a090:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a093:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a096:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a099:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a09c:	8b 55 14             	mov    0x14(%ebp),%edx
c010a09f:	89 50 20             	mov    %edx,0x20(%eax)
c010a0a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0a5:	8b 55 18             	mov    0x18(%ebp),%edx
c010a0a8:	89 50 24             	mov    %edx,0x24(%eax)
c010a0ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010a0ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0b1:	89 50 28             	mov    %edx,0x28(%eax)
c010a0b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0b7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a0bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0c0:	8b 10                	mov    (%eax),%edx
c010a0c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0c5:	89 50 04             	mov    %edx,0x4(%eax)
c010a0c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0cb:	8b 50 04             	mov    0x4(%eax),%edx
c010a0ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0d1:	89 50 08             	mov    %edx,0x8(%eax)
c010a0d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0d7:	8b 50 08             	mov    0x8(%eax),%edx
c010a0da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a0dd:	89 50 0c             	mov    %edx,0xc(%eax)
c010a0e0:	83 ec 0c             	sub    $0xc,%esp
c010a0e3:	68 ec fd 10 c0       	push   $0xc010fdec
c010a0e8:	e8 96 00 00 00       	call   c010a183 <isListEmpty>
c010a0ed:	83 c4 10             	add    $0x10,%esp
c010a0f0:	e8 53 cc ff ff       	call   c0106d48 <intr_disable>
c010a0f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a0f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0fb:	05 60 02 00 00       	add    $0x260,%eax
c010a100:	83 ec 08             	sub    $0x8,%esp
c010a103:	50                   	push   %eax
c010a104:	68 ec fd 10 c0       	push   $0xc010fdec
c010a109:	e8 72 01 00 00       	call   c010a280 <appendToDoubleLinkList>
c010a10e:	83 c4 10             	add    $0x10,%esp
c010a111:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a114:	05 6a 02 00 00       	add    $0x26a,%eax
c010a119:	83 ec 08             	sub    $0x8,%esp
c010a11c:	50                   	push   %eax
c010a11d:	68 04 0f 11 c0       	push   $0xc0110f04
c010a122:	e8 59 01 00 00       	call   c010a280 <appendToDoubleLinkList>
c010a127:	83 c4 10             	add    $0x10,%esp
c010a12a:	83 ec 0c             	sub    $0xc,%esp
c010a12d:	ff 75 e0             	pushl  -0x20(%ebp)
c010a130:	e8 3c cc ff ff       	call   c0106d71 <intr_set_status>
c010a135:	83 c4 10             	add    $0x10,%esp
c010a138:	90                   	nop
c010a139:	c9                   	leave  
c010a13a:	c3                   	ret    
c010a13b:	66 90                	xchg   %ax,%ax
c010a13d:	66 90                	xchg   %ax,%ax
c010a13f:	90                   	nop

c010a140 <switch_to>:
c010a140:	56                   	push   %esi
c010a141:	57                   	push   %edi
c010a142:	53                   	push   %ebx
c010a143:	55                   	push   %ebp
c010a144:	89 e5                	mov    %esp,%ebp
c010a146:	8b 45 14             	mov    0x14(%ebp),%eax
c010a149:	89 20                	mov    %esp,(%eax)
c010a14b:	8b 45 18             	mov    0x18(%ebp),%eax
c010a14e:	8b 20                	mov    (%eax),%esp
c010a150:	5d                   	pop    %ebp
c010a151:	5b                   	pop    %ebx
c010a152:	5f                   	pop    %edi
c010a153:	5e                   	pop    %esi
c010a154:	c3                   	ret    

c010a155 <initDoubleLinkList>:
c010a155:	55                   	push   %ebp
c010a156:	89 e5                	mov    %esp,%ebp
c010a158:	8b 45 08             	mov    0x8(%ebp),%eax
c010a15b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a161:	8b 45 08             	mov    0x8(%ebp),%eax
c010a164:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a16b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a16e:	8d 50 08             	lea    0x8(%eax),%edx
c010a171:	8b 45 08             	mov    0x8(%ebp),%eax
c010a174:	89 50 04             	mov    %edx,0x4(%eax)
c010a177:	8b 55 08             	mov    0x8(%ebp),%edx
c010a17a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a17d:	89 50 08             	mov    %edx,0x8(%eax)
c010a180:	90                   	nop
c010a181:	5d                   	pop    %ebp
c010a182:	c3                   	ret    

c010a183 <isListEmpty>:
c010a183:	55                   	push   %ebp
c010a184:	89 e5                	mov    %esp,%ebp
c010a186:	8b 45 08             	mov    0x8(%ebp),%eax
c010a189:	8b 40 04             	mov    0x4(%eax),%eax
c010a18c:	8b 55 08             	mov    0x8(%ebp),%edx
c010a18f:	83 c2 08             	add    $0x8,%edx
c010a192:	39 d0                	cmp    %edx,%eax
c010a194:	75 07                	jne    c010a19d <isListEmpty+0x1a>
c010a196:	b8 01 00 00 00       	mov    $0x1,%eax
c010a19b:	eb 05                	jmp    c010a1a2 <isListEmpty+0x1f>
c010a19d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1a2:	5d                   	pop    %ebp
c010a1a3:	c3                   	ret    

c010a1a4 <findElementInList>:
c010a1a4:	55                   	push   %ebp
c010a1a5:	89 e5                	mov    %esp,%ebp
c010a1a7:	83 ec 28             	sub    $0x28,%esp
c010a1aa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a1ae:	75 19                	jne    c010a1c9 <findElementInList+0x25>
c010a1b0:	6a 60                	push   $0x60
c010a1b2:	68 95 c1 10 c0       	push   $0xc010c195
c010a1b7:	68 95 c1 10 c0       	push   $0xc010c195
c010a1bc:	68 a8 c1 10 c0       	push   $0xc010c1a8
c010a1c1:	e8 ff e7 ff ff       	call   c01089c5 <assertion_failure>
c010a1c6:	83 c4 10             	add    $0x10,%esp
c010a1c9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a1cd:	75 19                	jne    c010a1e8 <findElementInList+0x44>
c010a1cf:	6a 61                	push   $0x61
c010a1d1:	68 95 c1 10 c0       	push   $0xc010c195
c010a1d6:	68 95 c1 10 c0       	push   $0xc010c195
c010a1db:	68 b4 c1 10 c0       	push   $0xc010c1b4
c010a1e0:	e8 e0 e7 ff ff       	call   c01089c5 <assertion_failure>
c010a1e5:	83 c4 10             	add    $0x10,%esp
c010a1e8:	e8 5b cb ff ff       	call   c0106d48 <intr_disable>
c010a1ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a1f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a1f7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1fa:	8b 40 08             	mov    0x8(%eax),%eax
c010a1fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a200:	8b 45 08             	mov    0x8(%ebp),%eax
c010a203:	8b 40 04             	mov    0x4(%eax),%eax
c010a206:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a209:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a20d:	75 07                	jne    c010a216 <findElementInList+0x72>
c010a20f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a214:	eb 68                	jmp    c010a27e <findElementInList+0xda>
c010a216:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a219:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a21c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a21f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a222:	c1 f8 03             	sar    $0x3,%eax
c010a225:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a228:	eb 36                	jmp    c010a260 <findElementInList+0xbc>
c010a22a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a22d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a230:	75 07                	jne    c010a239 <findElementInList+0x95>
c010a232:	b8 01 00 00 00       	mov    $0x1,%eax
c010a237:	eb 45                	jmp    c010a27e <findElementInList+0xda>
c010a239:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a23d:	75 07                	jne    c010a246 <findElementInList+0xa2>
c010a23f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a244:	eb 38                	jmp    c010a27e <findElementInList+0xda>
c010a246:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a249:	8b 40 04             	mov    0x4(%eax),%eax
c010a24c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a24f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a253:	75 07                	jne    c010a25c <findElementInList+0xb8>
c010a255:	b8 00 00 00 00       	mov    $0x0,%eax
c010a25a:	eb 22                	jmp    c010a27e <findElementInList+0xda>
c010a25c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a260:	8b 45 08             	mov    0x8(%ebp),%eax
c010a263:	83 c0 08             	add    $0x8,%eax
c010a266:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a269:	75 bf                	jne    c010a22a <findElementInList+0x86>
c010a26b:	83 ec 0c             	sub    $0xc,%esp
c010a26e:	ff 75 ec             	pushl  -0x14(%ebp)
c010a271:	e8 fb ca ff ff       	call   c0106d71 <intr_set_status>
c010a276:	83 c4 10             	add    $0x10,%esp
c010a279:	b8 00 00 00 00       	mov    $0x0,%eax
c010a27e:	c9                   	leave  
c010a27f:	c3                   	ret    

c010a280 <appendToDoubleLinkList>:
c010a280:	55                   	push   %ebp
c010a281:	89 e5                	mov    %esp,%ebp
c010a283:	83 ec 18             	sub    $0x18,%esp
c010a286:	83 ec 08             	sub    $0x8,%esp
c010a289:	ff 75 0c             	pushl  0xc(%ebp)
c010a28c:	ff 75 08             	pushl  0x8(%ebp)
c010a28f:	e8 10 ff ff ff       	call   c010a1a4 <findElementInList>
c010a294:	83 c4 10             	add    $0x10,%esp
c010a297:	3c 01                	cmp    $0x1,%al
c010a299:	0f 84 c2 00 00 00    	je     c010a361 <appendToDoubleLinkList+0xe1>
c010a29f:	e8 a4 ca ff ff       	call   c0106d48 <intr_disable>
c010a2a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a2a7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a2ab:	75 1c                	jne    c010a2c9 <appendToDoubleLinkList+0x49>
c010a2ad:	68 9e 00 00 00       	push   $0x9e
c010a2b2:	68 95 c1 10 c0       	push   $0xc010c195
c010a2b7:	68 95 c1 10 c0       	push   $0xc010c195
c010a2bc:	68 a8 c1 10 c0       	push   $0xc010c1a8
c010a2c1:	e8 ff e6 ff ff       	call   c01089c5 <assertion_failure>
c010a2c6:	83 c4 10             	add    $0x10,%esp
c010a2c9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a2cd:	75 1c                	jne    c010a2eb <appendToDoubleLinkList+0x6b>
c010a2cf:	68 9f 00 00 00       	push   $0x9f
c010a2d4:	68 95 c1 10 c0       	push   $0xc010c195
c010a2d9:	68 95 c1 10 c0       	push   $0xc010c195
c010a2de:	68 b4 c1 10 c0       	push   $0xc010c1b4
c010a2e3:	e8 dd e6 ff ff       	call   c01089c5 <assertion_failure>
c010a2e8:	83 c4 10             	add    $0x10,%esp
c010a2eb:	83 ec 08             	sub    $0x8,%esp
c010a2ee:	ff 75 0c             	pushl  0xc(%ebp)
c010a2f1:	ff 75 08             	pushl  0x8(%ebp)
c010a2f4:	e8 ab fe ff ff       	call   c010a1a4 <findElementInList>
c010a2f9:	83 c4 10             	add    $0x10,%esp
c010a2fc:	3c 01                	cmp    $0x1,%al
c010a2fe:	74 64                	je     c010a364 <appendToDoubleLinkList+0xe4>
c010a300:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a303:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a306:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a309:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a310:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a313:	8b 50 04             	mov    0x4(%eax),%edx
c010a316:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a319:	89 10                	mov    %edx,(%eax)
c010a31b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a31e:	8b 50 08             	mov    0x8(%eax),%edx
c010a321:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a324:	89 10                	mov    %edx,(%eax)
c010a326:	8b 45 08             	mov    0x8(%ebp),%eax
c010a329:	8b 40 08             	mov    0x8(%eax),%eax
c010a32c:	85 c0                	test   %eax,%eax
c010a32e:	74 0c                	je     c010a33c <appendToDoubleLinkList+0xbc>
c010a330:	8b 45 08             	mov    0x8(%ebp),%eax
c010a333:	8b 40 08             	mov    0x8(%eax),%eax
c010a336:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a339:	89 50 04             	mov    %edx,0x4(%eax)
c010a33c:	8b 45 08             	mov    0x8(%ebp),%eax
c010a33f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a342:	89 50 08             	mov    %edx,0x8(%eax)
c010a345:	8b 45 08             	mov    0x8(%ebp),%eax
c010a348:	8d 50 08             	lea    0x8(%eax),%edx
c010a34b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a34e:	89 50 04             	mov    %edx,0x4(%eax)
c010a351:	83 ec 0c             	sub    $0xc,%esp
c010a354:	ff 75 f4             	pushl  -0xc(%ebp)
c010a357:	e8 15 ca ff ff       	call   c0106d71 <intr_set_status>
c010a35c:	83 c4 10             	add    $0x10,%esp
c010a35f:	eb 04                	jmp    c010a365 <appendToDoubleLinkList+0xe5>
c010a361:	90                   	nop
c010a362:	eb 01                	jmp    c010a365 <appendToDoubleLinkList+0xe5>
c010a364:	90                   	nop
c010a365:	c9                   	leave  
c010a366:	c3                   	ret    

c010a367 <insertToDoubleLinkList>:
c010a367:	55                   	push   %ebp
c010a368:	89 e5                	mov    %esp,%ebp
c010a36a:	83 ec 18             	sub    $0x18,%esp
c010a36d:	83 ec 08             	sub    $0x8,%esp
c010a370:	ff 75 0c             	pushl  0xc(%ebp)
c010a373:	ff 75 08             	pushl  0x8(%ebp)
c010a376:	e8 29 fe ff ff       	call   c010a1a4 <findElementInList>
c010a37b:	83 c4 10             	add    $0x10,%esp
c010a37e:	3c 01                	cmp    $0x1,%al
c010a380:	74 65                	je     c010a3e7 <insertToDoubleLinkList+0x80>
c010a382:	e8 c1 c9 ff ff       	call   c0106d48 <intr_disable>
c010a387:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a38a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a38d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a390:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a393:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a39a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a39d:	8b 50 04             	mov    0x4(%eax),%edx
c010a3a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3a3:	89 10                	mov    %edx,(%eax)
c010a3a5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3a8:	8b 50 04             	mov    0x4(%eax),%edx
c010a3ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3ae:	89 50 04             	mov    %edx,0x4(%eax)
c010a3b1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3b4:	8b 40 04             	mov    0x4(%eax),%eax
c010a3b7:	85 c0                	test   %eax,%eax
c010a3b9:	74 0b                	je     c010a3c6 <insertToDoubleLinkList+0x5f>
c010a3bb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3be:	8b 40 04             	mov    0x4(%eax),%eax
c010a3c1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a3c4:	89 10                	mov    %edx,(%eax)
c010a3c6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3c9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a3cc:	89 50 04             	mov    %edx,0x4(%eax)
c010a3cf:	8b 55 08             	mov    0x8(%ebp),%edx
c010a3d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3d5:	89 10                	mov    %edx,(%eax)
c010a3d7:	83 ec 0c             	sub    $0xc,%esp
c010a3da:	ff 75 f4             	pushl  -0xc(%ebp)
c010a3dd:	e8 8f c9 ff ff       	call   c0106d71 <intr_set_status>
c010a3e2:	83 c4 10             	add    $0x10,%esp
c010a3e5:	eb 01                	jmp    c010a3e8 <insertToDoubleLinkList+0x81>
c010a3e7:	90                   	nop
c010a3e8:	c9                   	leave  
c010a3e9:	c3                   	ret    

c010a3ea <popFromDoubleLinkList>:
c010a3ea:	55                   	push   %ebp
c010a3eb:	89 e5                	mov    %esp,%ebp
c010a3ed:	83 ec 18             	sub    $0x18,%esp
c010a3f0:	e8 53 c9 ff ff       	call   c0106d48 <intr_disable>
c010a3f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a3f8:	83 ec 0c             	sub    $0xc,%esp
c010a3fb:	ff 75 08             	pushl  0x8(%ebp)
c010a3fe:	e8 80 fd ff ff       	call   c010a183 <isListEmpty>
c010a403:	83 c4 10             	add    $0x10,%esp
c010a406:	3c 01                	cmp    $0x1,%al
c010a408:	75 07                	jne    c010a411 <popFromDoubleLinkList+0x27>
c010a40a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a40f:	eb 6b                	jmp    c010a47c <popFromDoubleLinkList+0x92>
c010a411:	8b 45 08             	mov    0x8(%ebp),%eax
c010a414:	8b 40 08             	mov    0x8(%eax),%eax
c010a417:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a41a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a41d:	8b 40 08             	mov    0x8(%eax),%eax
c010a420:	85 c0                	test   %eax,%eax
c010a422:	75 07                	jne    c010a42b <popFromDoubleLinkList+0x41>
c010a424:	b8 00 00 00 00       	mov    $0x0,%eax
c010a429:	eb 51                	jmp    c010a47c <popFromDoubleLinkList+0x92>
c010a42b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a42e:	8b 40 08             	mov    0x8(%eax),%eax
c010a431:	8b 00                	mov    (%eax),%eax
c010a433:	85 c0                	test   %eax,%eax
c010a435:	74 11                	je     c010a448 <popFromDoubleLinkList+0x5e>
c010a437:	8b 45 08             	mov    0x8(%ebp),%eax
c010a43a:	8b 40 08             	mov    0x8(%eax),%eax
c010a43d:	8b 00                	mov    (%eax),%eax
c010a43f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a442:	83 c2 08             	add    $0x8,%edx
c010a445:	89 50 04             	mov    %edx,0x4(%eax)
c010a448:	8b 45 08             	mov    0x8(%ebp),%eax
c010a44b:	8b 40 08             	mov    0x8(%eax),%eax
c010a44e:	8b 10                	mov    (%eax),%edx
c010a450:	8b 45 08             	mov    0x8(%ebp),%eax
c010a453:	89 50 08             	mov    %edx,0x8(%eax)
c010a456:	83 ec 0c             	sub    $0xc,%esp
c010a459:	ff 75 f4             	pushl  -0xc(%ebp)
c010a45c:	e8 10 c9 ff ff       	call   c0106d71 <intr_set_status>
c010a461:	83 c4 10             	add    $0x10,%esp
c010a464:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a467:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a46e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a471:	8b 50 04             	mov    0x4(%eax),%edx
c010a474:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a477:	89 10                	mov    %edx,(%eax)
c010a479:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a47c:	c9                   	leave  
c010a47d:	c3                   	ret    

c010a47e <kernel_thread>:
c010a47e:	55                   	push   %ebp
c010a47f:	89 e5                	mov    %esp,%ebp
c010a481:	83 ec 08             	sub    $0x8,%esp
c010a484:	fb                   	sti    
c010a485:	83 ec 0c             	sub    $0xc,%esp
c010a488:	ff 75 0c             	pushl  0xc(%ebp)
c010a48b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a48e:	ff d0                	call   *%eax
c010a490:	83 c4 10             	add    $0x10,%esp
c010a493:	90                   	nop
c010a494:	c9                   	leave  
c010a495:	c3                   	ret    

c010a496 <thread_init>:
c010a496:	55                   	push   %ebp
c010a497:	89 e5                	mov    %esp,%ebp
c010a499:	83 ec 18             	sub    $0x18,%esp
c010a49c:	83 ec 08             	sub    $0x8,%esp
c010a49f:	6a 00                	push   $0x0
c010a4a1:	6a 01                	push   $0x1
c010a4a3:	e8 cf bd ff ff       	call   c0106277 <alloc_memory>
c010a4a8:	83 c4 10             	add    $0x10,%esp
c010a4ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a4ae:	83 ec 04             	sub    $0x4,%esp
c010a4b1:	68 00 10 00 00       	push   $0x1000
c010a4b6:	6a 00                	push   $0x0
c010a4b8:	ff 75 f4             	pushl  -0xc(%ebp)
c010a4bb:	e8 2f 1d 00 00       	call   c010c1ef <Memset>
c010a4c0:	83 c4 10             	add    $0x10,%esp
c010a4c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4c6:	05 00 10 00 00       	add    $0x1000,%eax
c010a4cb:	89 c2                	mov    %eax,%edx
c010a4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4d0:	89 10                	mov    %edx,(%eax)
c010a4d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4d5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a4dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4df:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a4e6:	ff ff ff 
c010a4e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4ec:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a4f3:	00 00 00 
c010a4f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4f9:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a4ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a502:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a508:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a50d:	83 c0 01             	add    $0x1,%eax
c010a510:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a515:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a51b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a51e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a524:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a527:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a52e:	00 00 00 
c010a531:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a534:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a53b:	cd ab 99 
c010a53e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a541:	c9                   	leave  
c010a542:	c3                   	ret    

c010a543 <thread_create>:
c010a543:	55                   	push   %ebp
c010a544:	89 e5                	mov    %esp,%ebp
c010a546:	83 ec 10             	sub    $0x10,%esp
c010a549:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a550:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a557:	8b 45 08             	mov    0x8(%ebp),%eax
c010a55a:	8b 00                	mov    (%eax),%eax
c010a55c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a55f:	89 c2                	mov    %eax,%edx
c010a561:	8b 45 08             	mov    0x8(%ebp),%eax
c010a564:	89 10                	mov    %edx,(%eax)
c010a566:	8b 45 08             	mov    0x8(%ebp),%eax
c010a569:	8b 00                	mov    (%eax),%eax
c010a56b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a56e:	89 c2                	mov    %eax,%edx
c010a570:	8b 45 08             	mov    0x8(%ebp),%eax
c010a573:	89 10                	mov    %edx,(%eax)
c010a575:	90                   	nop
c010a576:	c9                   	leave  
c010a577:	c3                   	ret    

c010a578 <thread_start>:
c010a578:	55                   	push   %ebp
c010a579:	89 e5                	mov    %esp,%ebp
c010a57b:	83 ec 18             	sub    $0x18,%esp
c010a57e:	e8 13 ff ff ff       	call   c010a496 <thread_init>
c010a583:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a586:	83 ec 0c             	sub    $0xc,%esp
c010a589:	ff 75 f4             	pushl  -0xc(%ebp)
c010a58c:	e8 b2 ff ff ff       	call   c010a543 <thread_create>
c010a591:	83 c4 10             	add    $0x10,%esp
c010a594:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a597:	05 28 01 00 00       	add    $0x128,%eax
c010a59c:	83 ec 08             	sub    $0x8,%esp
c010a59f:	ff 75 10             	pushl  0x10(%ebp)
c010a5a2:	50                   	push   %eax
c010a5a3:	e8 66 1c 00 00       	call   c010c20e <Strcpy>
c010a5a8:	83 c4 10             	add    $0x10,%esp
c010a5ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5ae:	8b 00                	mov    (%eax),%eax
c010a5b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a5b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5b6:	c7 40 10 7e a4 10 c0 	movl   $0xc010a47e,0x10(%eax)
c010a5bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5c0:	8b 55 08             	mov    0x8(%ebp),%edx
c010a5c3:	89 50 18             	mov    %edx,0x18(%eax)
c010a5c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5c9:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a5cc:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a5cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5d2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a5d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5db:	8b 10                	mov    (%eax),%edx
c010a5dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5e0:	89 50 04             	mov    %edx,0x4(%eax)
c010a5e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5e6:	8b 50 04             	mov    0x4(%eax),%edx
c010a5e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5ec:	89 50 08             	mov    %edx,0x8(%eax)
c010a5ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5f2:	8b 50 08             	mov    0x8(%eax),%edx
c010a5f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a5f8:	89 50 0c             	mov    %edx,0xc(%eax)
c010a5fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a5fe:	05 60 02 00 00       	add    $0x260,%eax
c010a603:	83 ec 08             	sub    $0x8,%esp
c010a606:	50                   	push   %eax
c010a607:	68 ec fd 10 c0       	push   $0xc010fdec
c010a60c:	e8 6f fc ff ff       	call   c010a280 <appendToDoubleLinkList>
c010a611:	83 c4 10             	add    $0x10,%esp
c010a614:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a617:	05 6a 02 00 00       	add    $0x26a,%eax
c010a61c:	83 ec 08             	sub    $0x8,%esp
c010a61f:	50                   	push   %eax
c010a620:	68 04 0f 11 c0       	push   $0xc0110f04
c010a625:	e8 56 fc ff ff       	call   c010a280 <appendToDoubleLinkList>
c010a62a:	83 c4 10             	add    $0x10,%esp
c010a62d:	90                   	nop
c010a62e:	c9                   	leave  
c010a62f:	c3                   	ret    

c010a630 <Buf>:
	...

c010a646 <My_Buf>:
c010a646:	48                   	dec    %eax
c010a647:	65 6c                	gs insb (%dx),%es:(%edi)
c010a649:	6c                   	insb   (%dx),%es:(%edi)
c010a64a:	6f                   	outsl  %ds:(%esi),(%dx)
c010a64b:	2c 57                	sub    $0x57,%al
c010a64d:	6f                   	outsl  %ds:(%esi),(%dx)
c010a64e:	72 6c                	jb     c010a6bc <DriverInitialize+0x69>
c010a650:	64 5c                	fs pop %esp
c010a652:	30                   	.byte 0x30

c010a653 <DriverInitialize>:
c010a653:	56                   	push   %esi
c010a654:	57                   	push   %edi
c010a655:	53                   	push   %ebx
c010a656:	55                   	push   %ebp
c010a657:	51                   	push   %ecx
c010a658:	89 e5                	mov    %esp,%ebp
c010a65a:	b0 21                	mov    $0x21,%al
c010a65c:	66 ba 00 03          	mov    $0x300,%dx
c010a660:	ee                   	out    %al,(%dx)
c010a661:	b0 59                	mov    $0x59,%al
c010a663:	66 ba 0e 03          	mov    $0x30e,%dx
c010a667:	ee                   	out    %al,(%dx)
c010a668:	66 ba 0a 03          	mov    $0x30a,%dx
c010a66c:	66 31 c0             	xor    %ax,%ax
c010a66f:	b0 00                	mov    $0x0,%al
c010a671:	ee                   	out    %al,(%dx)
c010a672:	66 ba 0b 03          	mov    $0x30b,%dx
c010a676:	b0 01                	mov    $0x1,%al
c010a678:	ee                   	out    %al,(%dx)
c010a679:	b0 10                	mov    $0x10,%al
c010a67b:	66 ba 0c 03          	mov    $0x30c,%dx
c010a67f:	ee                   	out    %al,(%dx)
c010a680:	b0 20                	mov    $0x20,%al
c010a682:	66 ba 04 03          	mov    $0x304,%dx
c010a686:	ee                   	out    %al,(%dx)
c010a687:	b0 02                	mov    $0x2,%al
c010a689:	66 ba 0d 03          	mov    $0x30d,%dx
c010a68d:	ee                   	out    %al,(%dx)
c010a68e:	b0 40                	mov    $0x40,%al
c010a690:	66 ba 01 03          	mov    $0x301,%dx
c010a694:	ee                   	out    %al,(%dx)
c010a695:	66 ba 03 03          	mov    $0x303,%dx
c010a699:	ee                   	out    %al,(%dx)
c010a69a:	b0 60                	mov    $0x60,%al
c010a69c:	66 ba 02 03          	mov    $0x302,%dx
c010a6a0:	ee                   	out    %al,(%dx)
c010a6a1:	b0 61                	mov    $0x61,%al
c010a6a3:	66 ba 00 03          	mov    $0x300,%dx
c010a6a7:	ee                   	out    %al,(%dx)
c010a6a8:	b0 40                	mov    $0x40,%al
c010a6aa:	66 ba 07 03          	mov    $0x307,%dx
c010a6ae:	ee                   	out    %al,(%dx)
c010a6af:	b0 22                	mov    $0x22,%al
c010a6b1:	66 ba 00 03          	mov    $0x300,%dx
c010a6b5:	ee                   	out    %al,(%dx)
c010a6b6:	b0 ff                	mov    $0xff,%al
c010a6b8:	66 ba 07 03          	mov    $0x307,%dx
c010a6bc:	ee                   	out    %al,(%dx)
c010a6bd:	b0 fb                	mov    $0xfb,%al
c010a6bf:	66 ba 0f 03          	mov    $0x30f,%dx
c010a6c3:	ee                   	out    %al,(%dx)
c010a6c4:	66 ba 0d 03          	mov    $0x30d,%dx
c010a6c8:	b0 00                	mov    $0x0,%al
c010a6ca:	ee                   	out    %al,(%dx)
c010a6cb:	89 ec                	mov    %ebp,%esp
c010a6cd:	59                   	pop    %ecx
c010a6ce:	5d                   	pop    %ebp
c010a6cf:	5b                   	pop    %ebx
c010a6d0:	5f                   	pop    %edi
c010a6d1:	5e                   	pop    %esi
c010a6d2:	c3                   	ret    

c010a6d3 <SetPageStart>:
c010a6d3:	56                   	push   %esi
c010a6d4:	57                   	push   %edi
c010a6d5:	53                   	push   %ebx
c010a6d6:	55                   	push   %ebp
c010a6d7:	51                   	push   %ecx
c010a6d8:	89 e5                	mov    %esp,%ebp
c010a6da:	66 ba 08 03          	mov    $0x308,%dx
c010a6de:	66 31 c0             	xor    %ax,%ax
c010a6e1:	66 b8 00 40          	mov    $0x4000,%ax
c010a6e5:	ee                   	out    %al,(%dx)
c010a6e6:	66 ba 09 03          	mov    $0x309,%dx
c010a6ea:	66 25 00 ff          	and    $0xff00,%ax
c010a6ee:	66 c1 e8 08          	shr    $0x8,%ax
c010a6f2:	ee                   	out    %al,(%dx)
c010a6f3:	89 ec                	mov    %ebp,%esp
c010a6f5:	59                   	pop    %ecx
c010a6f6:	5d                   	pop    %ebp
c010a6f7:	5b                   	pop    %ebx
c010a6f8:	5f                   	pop    %edi
c010a6f9:	5e                   	pop    %esi
c010a6fa:	c3                   	ret    

c010a6fb <DriverSend>:
c010a6fb:	56                   	push   %esi
c010a6fc:	57                   	push   %edi
c010a6fd:	53                   	push   %ebx
c010a6fe:	55                   	push   %ebp
c010a6ff:	51                   	push   %ecx
c010a700:	89 e5                	mov    %esp,%ebp
c010a702:	66 ba 00 03          	mov    $0x300,%dx
c010a706:	ec                   	in     (%dx),%al
c010a707:	3c 26                	cmp    $0x26,%al
c010a709:	74 57                	je     c010a762 <QueueIt>
c010a70b:	66 51                	push   %cx
c010a70d:	24 3f                	and    $0x3f,%al
c010a70f:	ee                   	out    %al,(%dx)
c010a710:	66 ba 08 03          	mov    $0x308,%dx
c010a714:	66 31 c0             	xor    %ax,%ax
c010a717:	66 b8 00 40          	mov    $0x4000,%ax
c010a71b:	ee                   	out    %al,(%dx)
c010a71c:	66 ba 09 03          	mov    $0x309,%dx
c010a720:	66 25 00 ff          	and    $0xff00,%ax
c010a724:	66 c1 e8 08          	shr    $0x8,%ax
c010a728:	ee                   	out    %al,(%dx)
c010a729:	ff 75 18             	pushl  0x18(%ebp)
c010a72c:	66 87 db             	xchg   %bx,%bx
c010a72f:	e8 3f 00 00 00       	call   c010a773 <PCtoNIC>
c010a734:	83 c4 04             	add    $0x4,%esp
c010a737:	eb 2a                	jmp    c010a763 <Finished>
c010a739:	66 ba 04 03          	mov    $0x304,%dx
c010a73d:	b0 40                	mov    $0x40,%al
c010a73f:	66 b8 00 40          	mov    $0x4000,%ax
c010a743:	66 c1 e8 08          	shr    $0x8,%ax
c010a747:	66 ef                	out    %ax,(%dx)
c010a749:	66 59                	pop    %cx
c010a74b:	66 ba 05 03          	mov    $0x305,%dx
c010a74f:	88 c8                	mov    %cl,%al
c010a751:	ee                   	out    %al,(%dx)
c010a752:	66 ba 06 03          	mov    $0x306,%dx
c010a756:	88 e8                	mov    %ch,%al
c010a758:	ee                   	out    %al,(%dx)
c010a759:	66 ba 00 03          	mov    $0x300,%dx
c010a75d:	b0 26                	mov    $0x26,%al
c010a75f:	ee                   	out    %al,(%dx)
c010a760:	eb 01                	jmp    c010a763 <Finished>

c010a762 <QueueIt>:
c010a762:	90                   	nop

c010a763 <Finished>:
c010a763:	89 ec                	mov    %ebp,%esp
c010a765:	59                   	pop    %ecx
c010a766:	5d                   	pop    %ebp
c010a767:	5b                   	pop    %ebx
c010a768:	5f                   	pop    %edi
c010a769:	5e                   	pop    %esi
c010a76a:	c3                   	ret    

c010a76b <MyEnd>:
c010a76b:	89 ec                	mov    %ebp,%esp
c010a76d:	59                   	pop    %ecx
c010a76e:	5d                   	pop    %ebp
c010a76f:	5b                   	pop    %ebx
c010a770:	5f                   	pop    %edi
c010a771:	5e                   	pop    %esi
c010a772:	c3                   	ret    

c010a773 <PCtoNIC>:
c010a773:	56                   	push   %esi
c010a774:	57                   	push   %edi
c010a775:	53                   	push   %ebx
c010a776:	55                   	push   %ebp
c010a777:	51                   	push   %ecx
c010a778:	89 e5                	mov    %esp,%ebp
c010a77a:	66 bb 20 00          	mov    $0x20,%bx
c010a77e:	66 ba 0a 03          	mov    $0x30a,%dx
c010a782:	88 d8                	mov    %bl,%al
c010a784:	ee                   	out    %al,(%dx)
c010a785:	66 ba 0b 03          	mov    $0x30b,%dx
c010a789:	88 f8                	mov    %bh,%al
c010a78b:	ee                   	out    %al,(%dx)
c010a78c:	66 ba 00 03          	mov    $0x300,%dx
c010a790:	b0 12                	mov    $0x12,%al
c010a792:	ee                   	out    %al,(%dx)
c010a793:	66 ba 10 03          	mov    $0x310,%dx
c010a797:	66 b9 20 00          	mov    $0x20,%cx
c010a79b:	66 d1 e9             	shr    %cx
c010a79e:	66 b8 59 00          	mov    $0x59,%ax
c010a7a2:	31 f6                	xor    %esi,%esi
c010a7a4:	8b 74 24 18          	mov    0x18(%esp),%esi
c010a7a8:	e8 26 ff ff ff       	call   c010a6d3 <SetPageStart>
c010a7ad:	66 ba 10 03          	mov    $0x310,%dx

c010a7b1 <Writing_Word>:
c010a7b1:	66 31 c0             	xor    %ax,%ax
c010a7b4:	66 ad                	lods   %ds:(%esi),%ax
c010a7b6:	66 ef                	out    %ax,(%dx)
c010a7b8:	e2 f7                	loop   c010a7b1 <Writing_Word>
c010a7ba:	66 b9 00 00          	mov    $0x0,%cx
c010a7be:	66 ba 07 03          	mov    $0x307,%dx

c010a7c2 <CheckDMA>:
c010a7c2:	66 87 db             	xchg   %bx,%bx
c010a7c5:	ec                   	in     (%dx),%al
c010a7c6:	a8 40                	test   $0x40,%al
c010a7c8:	75 02                	jne    c010a7cc <toNICEND>
c010a7ca:	eb f6                	jmp    c010a7c2 <CheckDMA>

c010a7cc <toNICEND>:
c010a7cc:	66 ba 07 03          	mov    $0x307,%dx
c010a7d0:	b0 00                	mov    $0x0,%al
c010a7d2:	ee                   	out    %al,(%dx)
c010a7d3:	f8                   	clc    
c010a7d4:	89 ec                	mov    %ebp,%esp
c010a7d6:	59                   	pop    %ecx
c010a7d7:	5d                   	pop    %ebp
c010a7d8:	5b                   	pop    %ebx
c010a7d9:	5f                   	pop    %edi
c010a7da:	5e                   	pop    %esi
c010a7db:	c3                   	ret    

c010a7dc <get_interrupt_status>:
c010a7dc:	56                   	push   %esi
c010a7dd:	57                   	push   %edi
c010a7de:	53                   	push   %ebx
c010a7df:	55                   	push   %ebp
c010a7e0:	51                   	push   %ecx
c010a7e1:	89 e5                	mov    %esp,%ebp
c010a7e3:	66 ba 07 03          	mov    $0x307,%dx
c010a7e7:	31 c0                	xor    %eax,%eax
c010a7e9:	ec                   	in     (%dx),%al
c010a7ea:	89 ec                	mov    %ebp,%esp
c010a7ec:	59                   	pop    %ecx
c010a7ed:	5d                   	pop    %ebp
c010a7ee:	5b                   	pop    %ebx
c010a7ef:	5f                   	pop    %edi
c010a7f0:	5e                   	pop    %esi
c010a7f1:	c3                   	ret    

c010a7f2 <set_interrupt_status>:
c010a7f2:	56                   	push   %esi
c010a7f3:	57                   	push   %edi
c010a7f4:	53                   	push   %ebx
c010a7f5:	55                   	push   %ebp
c010a7f6:	51                   	push   %ecx
c010a7f7:	89 e5                	mov    %esp,%ebp
c010a7f9:	66 ba 07 03          	mov    $0x307,%dx
c010a7fd:	31 c0                	xor    %eax,%eax
c010a7ff:	8b 45 14             	mov    0x14(%ebp),%eax
c010a802:	ee                   	out    %al,(%dx)
c010a803:	89 ec                	mov    %ebp,%esp
c010a805:	59                   	pop    %ecx
c010a806:	5d                   	pop    %ebp
c010a807:	5b                   	pop    %ebx
c010a808:	5f                   	pop    %edi
c010a809:	5e                   	pop    %esi

c010a80a <NICtoPC>:
c010a80a:	56                   	push   %esi
c010a80b:	57                   	push   %edi
c010a80c:	53                   	push   %ebx
c010a80d:	55                   	push   %ebp
c010a80e:	51                   	push   %ecx
c010a80f:	89 e5                	mov    %esp,%ebp
c010a811:	66 bb 20 00          	mov    $0x20,%bx
c010a815:	66 ba 0a 03          	mov    $0x30a,%dx
c010a819:	88 d8                	mov    %bl,%al
c010a81b:	ee                   	out    %al,(%dx)
c010a81c:	66 ba 0b 03          	mov    $0x30b,%dx
c010a820:	88 f8                	mov    %bh,%al
c010a822:	ee                   	out    %al,(%dx)
c010a823:	66 ba 00 03          	mov    $0x300,%dx
c010a827:	b0 0a                	mov    $0xa,%al
c010a829:	ee                   	out    %al,(%dx)
c010a82a:	66 ba 10 03          	mov    $0x310,%dx
c010a82e:	e8 a0 fe ff ff       	call   c010a6d3 <SetPageStart>
c010a833:	66 ba 10 03          	mov    $0x310,%dx
c010a837:	66 b9 20 00          	mov    $0x20,%cx
c010a83b:	66 d1 e9             	shr    %cx
c010a83e:	bf 30 a6 10 c0       	mov    $0xc010a630,%edi

c010a843 <READING_Word_NICtoPC>:
c010a843:	31 c0                	xor    %eax,%eax
c010a845:	66 ed                	in     (%dx),%ax
c010a847:	66 ab                	stos   %ax,%es:(%edi)
c010a849:	e2 f8                	loop   c010a843 <READING_Word_NICtoPC>
c010a84b:	b8 30 a6 10 c0       	mov    $0xc010a630,%eax
c010a850:	50                   	push   %eax
c010a851:	e8 36 58 ff ff       	call   c010008c <disp_str>
c010a856:	83 c4 04             	add    $0x4,%esp
c010a859:	66 ba 07 03          	mov    $0x307,%dx

c010a85d <CheckDMA_NICtoPC>:
c010a85d:	ec                   	in     (%dx),%al
c010a85e:	a8 40                	test   $0x40,%al
c010a860:	75 02                	jne    c010a864 <ReadEnd>
c010a862:	eb f9                	jmp    c010a85d <CheckDMA_NICtoPC>

c010a864 <ReadEnd>:
c010a864:	ee                   	out    %al,(%dx)
c010a865:	89 ec                	mov    %ebp,%esp
c010a867:	59                   	pop    %ecx
c010a868:	5d                   	pop    %ebp
c010a869:	5b                   	pop    %ebx
c010a86a:	5f                   	pop    %edi
c010a86b:	5e                   	pop    %esi
c010a86c:	c3                   	ret    
