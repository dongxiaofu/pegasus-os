
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
c0100025:	e8 d1 3b 00 00       	call   c0103bfb <ReloadGDT>
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
c010014b:	e8 f0 70 00 00       	call   c0107240 <exception_handler>
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
c0100168:	e8 d3 70 00 00       	call   c0107240 <exception_handler>
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
c0100195:	e8 2b 36 00 00       	call   c01037c5 <clock_handler>
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
c01001c7:	e8 84 45 00 00       	call   c0104750 <keyboard_handler>
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
c010020d:	e8 31 12 00 00       	call   c0101443 <hd_handler>
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
c0100256:	e8 a6 a4 00 00       	call   c010a701 <NICtoPC>
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
c0100340:	e8 95 6d 00 00       	call   c01070da <disp_int>
c0100345:	83 c4 04             	add    $0x4,%esp
c0100348:	58                   	pop    %eax
c0100349:	5a                   	pop    %edx
c010034a:	52                   	push   %edx
c010034b:	50                   	push   %eax
c010034c:	e8 89 6d 00 00       	call   c01070da <disp_int>
c0100351:	58                   	pop    %eax
c0100352:	5a                   	pop    %edx
c0100353:	52                   	push   %edx
c0100354:	50                   	push   %eax
c0100355:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c010035b:	e8 7a 6d 00 00       	call   c01070da <disp_int>
c0100360:	83 c4 04             	add    $0x4,%esp
c0100363:	58                   	pop    %eax
c0100364:	5a                   	pop    %edx
c0100365:	52                   	push   %edx
c0100366:	50                   	push   %eax
c0100367:	ff 72 ec             	pushl  -0x14(%edx)
c010036a:	e8 6b 6d 00 00       	call   c01070da <disp_int>
c010036f:	83 c4 04             	add    $0x4,%esp
c0100372:	58                   	pop    %eax
c0100373:	5a                   	pop    %edx
c0100374:	52                   	push   %edx
c0100375:	50                   	push   %eax
c0100376:	ff 70 ec             	pushl  -0x14(%eax)
c0100379:	e8 5c 6d 00 00       	call   c01070da <disp_int>
c010037e:	83 c4 04             	add    $0x4,%esp
c0100381:	58                   	pop    %eax
c0100382:	5a                   	pop    %edx
c0100383:	52                   	push   %edx
c0100384:	50                   	push   %eax
c0100385:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c010038b:	e8 4a 6d 00 00       	call   c01070da <disp_int>
c0100390:	83 c4 04             	add    $0x4,%esp
c0100393:	58                   	pop    %eax
c0100394:	5a                   	pop    %edx
c0100395:	52                   	push   %edx
c0100396:	50                   	push   %eax
c0100397:	68 60 f7 10 c0       	push   $0xc010f760
c010039c:	e8 39 6d 00 00       	call   c01070da <disp_int>
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
c010048e:	e8 2d 9d 00 00       	call   c010a1c0 <appendToDoubleLinkList>
c0100493:	83 c4 10             	add    $0x10,%esp
c0100496:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010049b:	05 6a 02 00 00       	add    $0x26a,%eax
c01004a0:	83 ec 08             	sub    $0x8,%esp
c01004a3:	50                   	push   %eax
c01004a4:	68 ec fd 10 c0       	push   $0xc010fdec
c01004a9:	e8 12 9d 00 00       	call   c010a1c0 <appendToDoubleLinkList>
c01004ae:	83 c4 10             	add    $0x10,%esp
c01004b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004b4:	83 ec 0c             	sub    $0xc,%esp
c01004b7:	50                   	push   %eax
c01004b8:	6a 00                	push   $0x0
c01004ba:	68 0c b0 10 c0       	push   $0xc010b00c
c01004bf:	68 13 b0 10 c0       	push   $0xc010b013
c01004c4:	68 b7 51 10 c0       	push   $0xc01051b7
c01004c9:	e8 33 9a 00 00       	call   c0109f01 <process_execute>
c01004ce:	83 c4 20             	add    $0x20,%esp
c01004d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004d4:	83 ec 0c             	sub    $0xc,%esp
c01004d7:	50                   	push   %eax
c01004d8:	6a 00                	push   $0x0
c01004da:	68 1c b0 10 c0       	push   $0xc010b01c
c01004df:	68 24 b0 10 c0       	push   $0xc010b024
c01004e4:	68 69 16 10 c0       	push   $0xc0101669
c01004e9:	e8 13 9a 00 00       	call   c0109f01 <process_execute>
c01004ee:	83 c4 20             	add    $0x20,%esp
c01004f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004f4:	83 ec 0c             	sub    $0xc,%esp
c01004f7:	50                   	push   %eax
c01004f8:	6a 00                	push   $0x0
c01004fa:	68 2d b0 10 c0       	push   $0xc010b02d
c01004ff:	68 34 b0 10 c0       	push   $0xc010b034
c0100504:	68 bb 07 10 c0       	push   $0xc01007bb
c0100509:	e8 f3 99 00 00       	call   c0109f01 <process_execute>
c010050e:	83 c4 20             	add    $0x20,%esp
c0100511:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100514:	83 ec 0c             	sub    $0xc,%esp
c0100517:	50                   	push   %eax
c0100518:	6a 00                	push   $0x0
c010051a:	68 3d b0 10 c0       	push   $0xc010b03d
c010051f:	68 45 b0 10 c0       	push   $0xc010b045
c0100524:	68 4d 46 10 c0       	push   $0xc010464d
c0100529:	e8 d3 99 00 00       	call   c0109f01 <process_execute>
c010052e:	83 c4 20             	add    $0x20,%esp
c0100531:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100534:	83 e8 02             	sub    $0x2,%eax
c0100537:	83 ec 0c             	sub    $0xc,%esp
c010053a:	50                   	push   %eax
c010053b:	6a 01                	push   $0x1
c010053d:	68 4f b0 10 c0       	push   $0xc010b04f
c0100542:	68 59 b0 10 c0       	push   $0xc010b059
c0100547:	68 e9 06 10 c0       	push   $0xc01006e9
c010054c:	e8 b0 99 00 00       	call   c0109f01 <process_execute>
c0100551:	83 c4 20             	add    $0x20,%esp
c0100554:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100557:	83 e8 03             	sub    $0x3,%eax
c010055a:	83 ec 0c             	sub    $0xc,%esp
c010055d:	50                   	push   %eax
c010055e:	6a 01                	push   $0x1
c0100560:	68 66 b0 10 c0       	push   $0xc010b066
c0100565:	68 70 b0 10 c0       	push   $0xc010b070
c010056a:	68 a3 07 10 c0       	push   $0xc01007a3
c010056f:	e8 8d 99 00 00       	call   c0109f01 <process_execute>
c0100574:	83 c4 20             	add    $0x20,%esp
c0100577:	83 ec 0c             	sub    $0xc,%esp
c010057a:	68 7d b0 10 c0       	push   $0xc010b07d
c010057f:	e8 08 fb ff ff       	call   c010008c <disp_str>
c0100584:	83 c4 10             	add    $0x10,%esp
c0100587:	fb                   	sti    
c0100588:	e8 71 66 00 00       	call   c0106bfe <stop_here>
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
c01005eb:	e8 3a 70 00 00       	call   c010762a <init_keyboard>
c01005f0:	83 ec 0c             	sub    $0xc,%esp
c01005f3:	68 00 00 00 04       	push   $0x4000000
c01005f8:	e8 b8 64 00 00       	call   c0106ab5 <init_memory>
c01005fd:	83 c4 10             	add    $0x10,%esp
c0100600:	83 ec 0c             	sub    $0xc,%esp
c0100603:	68 ec fd 10 c0       	push   $0xc010fdec
c0100608:	e8 88 9a 00 00       	call   c010a095 <initDoubleLinkList>
c010060d:	83 c4 10             	add    $0x10,%esp
c0100610:	83 ec 0c             	sub    $0xc,%esp
c0100613:	68 04 0f 11 c0       	push   $0xc0110f04
c0100618:	e8 78 9a 00 00       	call   c010a095 <initDoubleLinkList>
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
c0100713:	e8 24 0f 00 00       	call   c010163c <sys_malloc>
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
c0100759:	e8 35 9e 00 00       	call   c010a593 <DriverInitialize>
c010075e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100765:	eb 04                	jmp    c010076b <user_proc_a+0x82>
c0100767:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010076b:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c010076f:	7e f6                	jle    c0100767 <user_proc_a+0x7e>
c0100771:	83 ec 0c             	sub    $0xc,%esp
c0100774:	68 da b0 10 c0       	push   $0xc010b0da
c0100779:	e8 0e f9 ff ff       	call   c010008c <disp_str>
c010077e:	83 c4 10             	add    $0x10,%esp
c0100781:	83 ec 0c             	sub    $0xc,%esp
c0100784:	68 ed b0 10 c0       	push   $0xc010b0ed
c0100789:	e8 fe f8 ff ff       	call   c010008c <disp_str>
c010078e:	83 c4 10             	add    $0x10,%esp
c0100791:	83 ec 0c             	sub    $0xc,%esp
c0100794:	68 00 b1 10 c0       	push   $0xc010b100
c0100799:	e8 ee f8 ff ff       	call   c010008c <disp_str>
c010079e:	83 c4 10             	add    $0x10,%esp
c01007a1:	eb fe                	jmp    c01007a1 <user_proc_a+0xb8>

c01007a3 <user_proc_b>:
c01007a3:	55                   	push   %ebp
c01007a4:	89 e5                	mov    %esp,%ebp
c01007a6:	83 ec 08             	sub    $0x8,%esp
c01007a9:	83 ec 0c             	sub    $0xc,%esp
c01007ac:	68 14 b1 10 c0       	push   $0xc010b114
c01007b1:	e8 d6 f8 ff ff       	call   c010008c <disp_str>
c01007b6:	83 c4 10             	add    $0x10,%esp
c01007b9:	eb fe                	jmp    c01007b9 <user_proc_b+0x16>

c01007bb <TaskHD>:
c01007bb:	55                   	push   %ebp
c01007bc:	89 e5                	mov    %esp,%ebp
c01007be:	83 ec 18             	sub    $0x18,%esp
c01007c1:	e8 28 fc ff ff       	call   c01003ee <get_running_thread_pcb>
c01007c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01007c9:	e8 32 00 00 00       	call   c0100800 <init_hd>
c01007ce:	83 ec 0c             	sub    $0xc,%esp
c01007d1:	6a 7c                	push   $0x7c
c01007d3:	e8 64 0e 00 00       	call   c010163c <sys_malloc>
c01007d8:	83 c4 10             	add    $0x10,%esp
c01007db:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01007de:	83 ec 04             	sub    $0x4,%esp
c01007e1:	6a 7c                	push   $0x7c
c01007e3:	6a 00                	push   $0x0
c01007e5:	ff 75 f0             	pushl  -0x10(%ebp)
c01007e8:	e8 e2 b9 00 00       	call   c010c1cf <Memset>
c01007ed:	83 c4 10             	add    $0x10,%esp
c01007f0:	83 ec 0c             	sub    $0xc,%esp
c01007f3:	ff 75 f0             	pushl  -0x10(%ebp)
c01007f6:	e8 1f 00 00 00       	call   c010081a <hd_handle>
c01007fb:	83 c4 10             	add    $0x10,%esp
c01007fe:	eb de                	jmp    c01007de <TaskHD+0x23>

c0100800 <init_hd>:
c0100800:	55                   	push   %ebp
c0100801:	89 e5                	mov    %esp,%ebp
c0100803:	83 ec 18             	sub    $0x18,%esp
c0100806:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c010080d:	e8 98 fb ff ff       	call   c01003aa <enable_8259A_casecade_irq>
c0100812:	e8 a7 fb ff ff       	call   c01003be <enable_8259A_slave_winchester_irq>
c0100817:	90                   	nop
c0100818:	c9                   	leave  
c0100819:	c3                   	ret    

c010081a <hd_handle>:
c010081a:	55                   	push   %ebp
c010081b:	89 e5                	mov    %esp,%ebp
c010081d:	83 ec 18             	sub    $0x18,%esp
c0100820:	83 ec 04             	sub    $0x4,%esp
c0100823:	6a 12                	push   $0x12
c0100825:	ff 75 08             	pushl  0x8(%ebp)
c0100828:	6a 02                	push   $0x2
c010082a:	e8 46 8d 00 00       	call   c0109575 <send_rec>
c010082f:	83 c4 10             	add    $0x10,%esp
c0100832:	8b 45 08             	mov    0x8(%ebp),%eax
c0100835:	8b 40 78             	mov    0x78(%eax),%eax
c0100838:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010083b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010083f:	0f 84 d4 00 00 00    	je     c0100919 <hd_handle+0xff>
c0100845:	8b 45 08             	mov    0x8(%ebp),%eax
c0100848:	8b 00                	mov    (%eax),%eax
c010084a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010084d:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100851:	74 28                	je     c010087b <hd_handle+0x61>
c0100853:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100857:	74 22                	je     c010087b <hd_handle+0x61>
c0100859:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010085d:	74 1c                	je     c010087b <hd_handle+0x61>
c010085f:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100863:	74 16                	je     c010087b <hd_handle+0x61>
c0100865:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c010086c:	74 0d                	je     c010087b <hd_handle+0x61>
c010086e:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0100875:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100878:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010087b:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010087f:	74 34                	je     c01008b5 <hd_handle+0x9b>
c0100881:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100885:	74 2e                	je     c01008b5 <hd_handle+0x9b>
c0100887:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010088b:	74 28                	je     c01008b5 <hd_handle+0x9b>
c010088d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100891:	74 22                	je     c01008b5 <hd_handle+0x9b>
c0100893:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c010089a:	74 19                	je     c01008b5 <hd_handle+0x9b>
c010089c:	6a 6d                	push   $0x6d
c010089e:	68 34 b1 10 c0       	push   $0xc010b134
c01008a3:	68 34 b1 10 c0       	push   $0xc010b134
c01008a8:	68 3c b1 10 c0       	push   $0xc010b13c
c01008ad:	e8 53 80 00 00       	call   c0108905 <assertion_failure>
c01008b2:	83 c4 10             	add    $0x10,%esp
c01008b5:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008b9:	74 2c                	je     c01008e7 <hd_handle+0xcd>
c01008bb:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01008bf:	77 0e                	ja     c01008cf <hd_handle+0xb5>
c01008c1:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01008c5:	74 19                	je     c01008e0 <hd_handle+0xc6>
c01008c7:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01008cb:	74 1a                	je     c01008e7 <hd_handle+0xcd>
c01008cd:	eb 37                	jmp    c0100906 <hd_handle+0xec>
c01008cf:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01008d3:	74 22                	je     c01008f7 <hd_handle+0xdd>
c01008d5:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01008dc:	74 3e                	je     c010091c <hd_handle+0x102>
c01008de:	eb 26                	jmp    c0100906 <hd_handle+0xec>
c01008e0:	e8 e6 06 00 00       	call   c0100fcb <hd_open>
c01008e5:	eb 36                	jmp    c010091d <hd_handle+0x103>
c01008e7:	83 ec 0c             	sub    $0xc,%esp
c01008ea:	ff 75 08             	pushl  0x8(%ebp)
c01008ed:	e8 b2 08 00 00       	call   c01011a4 <hd_rdwt>
c01008f2:	83 c4 10             	add    $0x10,%esp
c01008f5:	eb 26                	jmp    c010091d <hd_handle+0x103>
c01008f7:	83 ec 0c             	sub    $0xc,%esp
c01008fa:	6a 00                	push   $0x0
c01008fc:	e8 71 07 00 00       	call   c0101072 <get_hd_ioctl>
c0100901:	83 c4 10             	add    $0x10,%esp
c0100904:	eb 17                	jmp    c010091d <hd_handle+0x103>
c0100906:	83 ec 0c             	sub    $0xc,%esp
c0100909:	68 96 b1 10 c0       	push   $0xc010b196
c010090e:	e8 ae 7f 00 00       	call   c01088c1 <spin>
c0100913:	83 c4 10             	add    $0x10,%esp
c0100916:	90                   	nop
c0100917:	eb 04                	jmp    c010091d <hd_handle+0x103>
c0100919:	90                   	nop
c010091a:	eb 01                	jmp    c010091d <hd_handle+0x103>
c010091c:	90                   	nop
c010091d:	c9                   	leave  
c010091e:	c3                   	ret    

c010091f <hd_cmd_out>:
c010091f:	55                   	push   %ebp
c0100920:	89 e5                	mov    %esp,%ebp
c0100922:	83 ec 08             	sub    $0x8,%esp
c0100925:	83 ec 04             	sub    $0x4,%esp
c0100928:	68 18 73 01 00       	push   $0x17318
c010092d:	6a 00                	push   $0x0
c010092f:	68 80 00 00 00       	push   $0x80
c0100934:	e8 52 0b 00 00       	call   c010148b <waitfor>
c0100939:	83 c4 10             	add    $0x10,%esp
c010093c:	85 c0                	test   %eax,%eax
c010093e:	75 10                	jne    c0100950 <hd_cmd_out+0x31>
c0100940:	83 ec 0c             	sub    $0xc,%esp
c0100943:	68 a8 b1 10 c0       	push   $0xc010b1a8
c0100948:	e8 9a 7f 00 00       	call   c01088e7 <panic>
c010094d:	83 c4 10             	add    $0x10,%esp
c0100950:	83 ec 08             	sub    $0x8,%esp
c0100953:	6a 00                	push   $0x0
c0100955:	68 f6 03 00 00       	push   $0x3f6
c010095a:	e8 91 f9 ff ff       	call   c01002f0 <out_byte>
c010095f:	83 c4 10             	add    $0x10,%esp
c0100962:	8b 45 08             	mov    0x8(%ebp),%eax
c0100965:	0f b6 00             	movzbl (%eax),%eax
c0100968:	0f b6 c0             	movzbl %al,%eax
c010096b:	83 ec 08             	sub    $0x8,%esp
c010096e:	50                   	push   %eax
c010096f:	68 f1 01 00 00       	push   $0x1f1
c0100974:	e8 77 f9 ff ff       	call   c01002f0 <out_byte>
c0100979:	83 c4 10             	add    $0x10,%esp
c010097c:	8b 45 08             	mov    0x8(%ebp),%eax
c010097f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0100983:	0f b6 c0             	movzbl %al,%eax
c0100986:	83 ec 08             	sub    $0x8,%esp
c0100989:	50                   	push   %eax
c010098a:	68 f2 01 00 00       	push   $0x1f2
c010098f:	e8 5c f9 ff ff       	call   c01002f0 <out_byte>
c0100994:	83 c4 10             	add    $0x10,%esp
c0100997:	8b 45 08             	mov    0x8(%ebp),%eax
c010099a:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c010099e:	0f b6 c0             	movzbl %al,%eax
c01009a1:	83 ec 08             	sub    $0x8,%esp
c01009a4:	50                   	push   %eax
c01009a5:	68 f3 01 00 00       	push   $0x1f3
c01009aa:	e8 41 f9 ff ff       	call   c01002f0 <out_byte>
c01009af:	83 c4 10             	add    $0x10,%esp
c01009b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01009b5:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c01009b9:	0f b6 c0             	movzbl %al,%eax
c01009bc:	83 ec 08             	sub    $0x8,%esp
c01009bf:	50                   	push   %eax
c01009c0:	68 f4 01 00 00       	push   $0x1f4
c01009c5:	e8 26 f9 ff ff       	call   c01002f0 <out_byte>
c01009ca:	83 c4 10             	add    $0x10,%esp
c01009cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01009d0:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c01009d4:	0f b6 c0             	movzbl %al,%eax
c01009d7:	83 ec 08             	sub    $0x8,%esp
c01009da:	50                   	push   %eax
c01009db:	68 f5 01 00 00       	push   $0x1f5
c01009e0:	e8 0b f9 ff ff       	call   c01002f0 <out_byte>
c01009e5:	83 c4 10             	add    $0x10,%esp
c01009e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01009eb:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c01009ef:	0f b6 c0             	movzbl %al,%eax
c01009f2:	83 ec 08             	sub    $0x8,%esp
c01009f5:	50                   	push   %eax
c01009f6:	68 f6 01 00 00       	push   $0x1f6
c01009fb:	e8 f0 f8 ff ff       	call   c01002f0 <out_byte>
c0100a00:	83 c4 10             	add    $0x10,%esp
c0100a03:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a06:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100a0a:	0f b6 c0             	movzbl %al,%eax
c0100a0d:	83 ec 08             	sub    $0x8,%esp
c0100a10:	50                   	push   %eax
c0100a11:	68 f7 01 00 00       	push   $0x1f7
c0100a16:	e8 d5 f8 ff ff       	call   c01002f0 <out_byte>
c0100a1b:	83 c4 10             	add    $0x10,%esp
c0100a1e:	90                   	nop
c0100a1f:	c9                   	leave  
c0100a20:	c3                   	ret    

c0100a21 <hd_identify>:
c0100a21:	55                   	push   %ebp
c0100a22:	89 e5                	mov    %esp,%ebp
c0100a24:	53                   	push   %ebx
c0100a25:	83 ec 24             	sub    $0x24,%esp
c0100a28:	89 e0                	mov    %esp,%eax
c0100a2a:	89 c3                	mov    %eax,%ebx
c0100a2c:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0100a30:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100a34:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100a38:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100a3c:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0100a40:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a43:	c1 e0 04             	shl    $0x4,%eax
c0100a46:	83 c8 e0             	or     $0xffffffe0,%eax
c0100a49:	88 45 ea             	mov    %al,-0x16(%ebp)
c0100a4c:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0100a50:	83 ec 0c             	sub    $0xc,%esp
c0100a53:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100a56:	50                   	push   %eax
c0100a57:	e8 c3 fe ff ff       	call   c010091f <hd_cmd_out>
c0100a5c:	83 c4 10             	add    $0x10,%esp
c0100a5f:	e8 f0 06 00 00       	call   c0101154 <interrupt_wait>
c0100a64:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a6e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100a71:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100a74:	89 c2                	mov    %eax,%edx
c0100a76:	b8 10 00 00 00       	mov    $0x10,%eax
c0100a7b:	83 e8 01             	sub    $0x1,%eax
c0100a7e:	01 d0                	add    %edx,%eax
c0100a80:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100a85:	ba 00 00 00 00       	mov    $0x0,%edx
c0100a8a:	f7 f1                	div    %ecx
c0100a8c:	6b c0 10             	imul   $0x10,%eax,%eax
c0100a8f:	29 c4                	sub    %eax,%esp
c0100a91:	89 e0                	mov    %esp,%eax
c0100a93:	83 c0 00             	add    $0x0,%eax
c0100a96:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100a99:	83 ec 04             	sub    $0x4,%esp
c0100a9c:	ff 75 f4             	pushl  -0xc(%ebp)
c0100a9f:	6a 00                	push   $0x0
c0100aa1:	ff 75 ec             	pushl  -0x14(%ebp)
c0100aa4:	e8 26 b7 00 00       	call   c010c1cf <Memset>
c0100aa9:	83 c4 10             	add    $0x10,%esp
c0100aac:	83 ec 04             	sub    $0x4,%esp
c0100aaf:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ab2:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ab5:	68 f0 01 00 00       	push   $0x1f0
c0100aba:	e8 64 b7 00 00       	call   c010c223 <read_port>
c0100abf:	83 c4 10             	add    $0x10,%esp
c0100ac2:	83 ec 0c             	sub    $0xc,%esp
c0100ac5:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ac8:	e8 0b 00 00 00       	call   c0100ad8 <print_hdinfo>
c0100acd:	83 c4 10             	add    $0x10,%esp
c0100ad0:	89 dc                	mov    %ebx,%esp
c0100ad2:	90                   	nop
c0100ad3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100ad6:	c9                   	leave  
c0100ad7:	c3                   	ret    

c0100ad8 <print_hdinfo>:
c0100ad8:	55                   	push   %ebp
c0100ad9:	89 e5                	mov    %esp,%ebp
c0100adb:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100ae1:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100ae7:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100aed:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100af4:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100afb:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100b02:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100b09:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100b10:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100b16:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100b1c:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100b23:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100b2a:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100b31:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100b38:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100b3f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100b46:	e9 8f 00 00 00       	jmp    c0100bda <print_hdinfo+0x102>
c0100b4b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100b52:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100b55:	89 d0                	mov    %edx,%eax
c0100b57:	01 c0                	add    %eax,%eax
c0100b59:	01 d0                	add    %edx,%eax
c0100b5b:	c1 e0 03             	shl    $0x3,%eax
c0100b5e:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100b61:	01 c8                	add    %ecx,%eax
c0100b63:	83 e8 44             	sub    $0x44,%eax
c0100b66:	0f b7 00             	movzwl (%eax),%eax
c0100b69:	0f b7 c0             	movzwl %ax,%eax
c0100b6c:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100b6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b72:	01 d0                	add    %edx,%eax
c0100b74:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100b77:	eb 30                	jmp    c0100ba9 <print_hdinfo+0xd1>
c0100b79:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100b7c:	8d 50 01             	lea    0x1(%eax),%edx
c0100b7f:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100b82:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100b85:	83 c2 01             	add    $0x1,%edx
c0100b88:	0f b6 00             	movzbl (%eax),%eax
c0100b8b:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100b8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100b92:	8d 50 01             	lea    0x1(%eax),%edx
c0100b95:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100b98:	0f b6 00             	movzbl (%eax),%eax
c0100b9b:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100b9e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100ba1:	01 ca                	add    %ecx,%edx
c0100ba3:	88 02                	mov    %al,(%edx)
c0100ba5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100ba9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100bac:	89 d0                	mov    %edx,%eax
c0100bae:	01 c0                	add    %eax,%eax
c0100bb0:	01 d0                	add    %edx,%eax
c0100bb2:	c1 e0 03             	shl    $0x3,%eax
c0100bb5:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100bb8:	01 c8                	add    %ecx,%eax
c0100bba:	83 e8 42             	sub    $0x42,%eax
c0100bbd:	0f b7 00             	movzwl (%eax),%eax
c0100bc0:	66 d1 e8             	shr    %ax
c0100bc3:	0f b7 c0             	movzwl %ax,%eax
c0100bc6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100bc9:	7c ae                	jl     c0100b79 <print_hdinfo+0xa1>
c0100bcb:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100bce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100bd1:	01 d0                	add    %edx,%eax
c0100bd3:	c6 00 00             	movb   $0x0,(%eax)
c0100bd6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100bda:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100bde:	0f 8e 67 ff ff ff    	jle    c0100b4b <print_hdinfo+0x73>
c0100be4:	8b 45 08             	mov    0x8(%ebp),%eax
c0100be7:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100beb:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100bef:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100bf3:	66 c1 e8 08          	shr    $0x8,%ax
c0100bf7:	66 85 c0             	test   %ax,%ax
c0100bfa:	0f 95 c0             	setne  %al
c0100bfd:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100c00:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100c07:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100c0d:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100c11:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100c15:	75 15                	jne    c0100c2c <print_hdinfo+0x154>
c0100c17:	83 ec 08             	sub    $0x8,%esp
c0100c1a:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100c1d:	50                   	push   %eax
c0100c1e:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c21:	50                   	push   %eax
c0100c22:	e8 c7 b5 00 00       	call   c010c1ee <Strcpy>
c0100c27:	83 c4 10             	add    $0x10,%esp
c0100c2a:	eb 13                	jmp    c0100c3f <print_hdinfo+0x167>
c0100c2c:	83 ec 08             	sub    $0x8,%esp
c0100c2f:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100c32:	50                   	push   %eax
c0100c33:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c36:	50                   	push   %eax
c0100c37:	e8 b2 b5 00 00       	call   c010c1ee <Strcpy>
c0100c3c:	83 c4 10             	add    $0x10,%esp
c0100c3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c42:	83 c0 7a             	add    $0x7a,%eax
c0100c45:	0f b7 00             	movzwl (%eax),%eax
c0100c48:	0f b7 d0             	movzwl %ax,%edx
c0100c4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c4e:	83 c0 78             	add    $0x78,%eax
c0100c51:	0f b7 00             	movzwl (%eax),%eax
c0100c54:	0f b7 c0             	movzwl %ax,%eax
c0100c57:	83 c0 10             	add    $0x10,%eax
c0100c5a:	89 c1                	mov    %eax,%ecx
c0100c5c:	d3 e2                	shl    %cl,%edx
c0100c5e:	89 d0                	mov    %edx,%eax
c0100c60:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100c63:	90                   	nop
c0100c64:	c9                   	leave  
c0100c65:	c3                   	ret    

c0100c66 <print_dpt_entry>:
c0100c66:	55                   	push   %ebp
c0100c67:	89 e5                	mov    %esp,%ebp
c0100c69:	83 ec 08             	sub    $0x8,%esp
c0100c6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c6f:	8b 40 08             	mov    0x8(%eax),%eax
c0100c72:	83 ec 08             	sub    $0x8,%esp
c0100c75:	50                   	push   %eax
c0100c76:	68 b2 b1 10 c0       	push   $0xc010b1b2
c0100c7b:	e8 28 79 00 00       	call   c01085a8 <Printf>
c0100c80:	83 c4 10             	add    $0x10,%esp
c0100c83:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c86:	8b 40 0c             	mov    0xc(%eax),%eax
c0100c89:	83 ec 08             	sub    $0x8,%esp
c0100c8c:	50                   	push   %eax
c0100c8d:	68 ba b1 10 c0       	push   $0xc010b1ba
c0100c92:	e8 11 79 00 00       	call   c01085a8 <Printf>
c0100c97:	83 c4 10             	add    $0x10,%esp
c0100c9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c9d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100ca1:	0f b6 c0             	movzbl %al,%eax
c0100ca4:	83 ec 08             	sub    $0x8,%esp
c0100ca7:	50                   	push   %eax
c0100ca8:	68 cb b1 10 c0       	push   $0xc010b1cb
c0100cad:	e8 f6 78 00 00       	call   c01085a8 <Printf>
c0100cb2:	83 c4 10             	add    $0x10,%esp
c0100cb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cb8:	0f b6 00             	movzbl (%eax),%eax
c0100cbb:	0f b6 c0             	movzbl %al,%eax
c0100cbe:	83 ec 08             	sub    $0x8,%esp
c0100cc1:	50                   	push   %eax
c0100cc2:	68 d9 b1 10 c0       	push   $0xc010b1d9
c0100cc7:	e8 dc 78 00 00       	call   c01085a8 <Printf>
c0100ccc:	83 c4 10             	add    $0x10,%esp
c0100ccf:	90                   	nop
c0100cd0:	c9                   	leave  
c0100cd1:	c3                   	ret    

c0100cd2 <get_partition_table>:
c0100cd2:	55                   	push   %ebp
c0100cd3:	89 e5                	mov    %esp,%ebp
c0100cd5:	53                   	push   %ebx
c0100cd6:	83 ec 24             	sub    $0x24,%esp
c0100cd9:	89 e0                	mov    %esp,%eax
c0100cdb:	89 c3                	mov    %eax,%ebx
c0100cdd:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100ce1:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100ce5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100ce8:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100ceb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100cee:	c1 f8 08             	sar    $0x8,%eax
c0100cf1:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100cf4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100cf7:	c1 f8 10             	sar    $0x10,%eax
c0100cfa:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100cfd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d00:	c1 f8 18             	sar    $0x18,%eax
c0100d03:	89 c2                	mov    %eax,%edx
c0100d05:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d08:	c1 e0 04             	shl    $0x4,%eax
c0100d0b:	09 d0                	or     %edx,%eax
c0100d0d:	83 c8 e0             	or     $0xffffffe0,%eax
c0100d10:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100d13:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100d17:	83 ec 0c             	sub    $0xc,%esp
c0100d1a:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100d1d:	50                   	push   %eax
c0100d1e:	e8 fc fb ff ff       	call   c010091f <hd_cmd_out>
c0100d23:	83 c4 10             	add    $0x10,%esp
c0100d26:	e8 29 04 00 00       	call   c0101154 <interrupt_wait>
c0100d2b:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100d32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d35:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100d38:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100d3b:	89 c2                	mov    %eax,%edx
c0100d3d:	b8 10 00 00 00       	mov    $0x10,%eax
c0100d42:	83 e8 01             	sub    $0x1,%eax
c0100d45:	01 d0                	add    %edx,%eax
c0100d47:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100d4c:	ba 00 00 00 00       	mov    $0x0,%edx
c0100d51:	f7 f1                	div    %ecx
c0100d53:	6b c0 10             	imul   $0x10,%eax,%eax
c0100d56:	29 c4                	sub    %eax,%esp
c0100d58:	89 e0                	mov    %esp,%eax
c0100d5a:	83 c0 00             	add    $0x0,%eax
c0100d5d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100d60:	83 ec 04             	sub    $0x4,%esp
c0100d63:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d66:	6a 00                	push   $0x0
c0100d68:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d6b:	e8 5f b4 00 00       	call   c010c1cf <Memset>
c0100d70:	83 c4 10             	add    $0x10,%esp
c0100d73:	83 ec 04             	sub    $0x4,%esp
c0100d76:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d79:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d7c:	68 f0 01 00 00       	push   $0x1f0
c0100d81:	e8 9d b4 00 00       	call   c010c223 <read_port>
c0100d86:	83 c4 10             	add    $0x10,%esp
c0100d89:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100d8c:	05 be 01 00 00       	add    $0x1be,%eax
c0100d91:	83 ec 04             	sub    $0x4,%esp
c0100d94:	6a 40                	push   $0x40
c0100d96:	50                   	push   %eax
c0100d97:	ff 75 10             	pushl  0x10(%ebp)
c0100d9a:	e8 4d 5f 00 00       	call   c0106cec <Memcpy>
c0100d9f:	83 c4 10             	add    $0x10,%esp
c0100da2:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100da9:	89 dc                	mov    %ebx,%esp
c0100dab:	90                   	nop
c0100dac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100daf:	c9                   	leave  
c0100db0:	c3                   	ret    

c0100db1 <partition>:
c0100db1:	55                   	push   %ebp
c0100db2:	89 e5                	mov    %esp,%ebp
c0100db4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100dba:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100dbd:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100dc0:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100dc4:	7f 19                	jg     c0100ddf <partition+0x2e>
c0100dc6:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100dc9:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100dce:	89 c8                	mov    %ecx,%eax
c0100dd0:	f7 ea                	imul   %edx
c0100dd2:	d1 fa                	sar    %edx
c0100dd4:	89 c8                	mov    %ecx,%eax
c0100dd6:	c1 f8 1f             	sar    $0x1f,%eax
c0100dd9:	29 c2                	sub    %eax,%edx
c0100ddb:	89 d0                	mov    %edx,%eax
c0100ddd:	eb 11                	jmp    c0100df0 <partition+0x3f>
c0100ddf:	8b 45 08             	mov    0x8(%ebp),%eax
c0100de2:	83 e8 10             	sub    $0x10,%eax
c0100de5:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100de8:	85 c0                	test   %eax,%eax
c0100dea:	0f 48 c2             	cmovs  %edx,%eax
c0100ded:	c1 f8 06             	sar    $0x6,%eax
c0100df0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100df3:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100df7:	0f 85 cc 00 00 00    	jne    c0100ec9 <partition+0x118>
c0100dfd:	83 ec 04             	sub    $0x4,%esp
c0100e00:	6a 40                	push   $0x40
c0100e02:	6a 00                	push   $0x0
c0100e04:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e07:	50                   	push   %eax
c0100e08:	e8 c2 b3 00 00       	call   c010c1cf <Memset>
c0100e0d:	83 c4 10             	add    $0x10,%esp
c0100e10:	83 ec 04             	sub    $0x4,%esp
c0100e13:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e16:	50                   	push   %eax
c0100e17:	6a 00                	push   $0x0
c0100e19:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e1c:	e8 b1 fe ff ff       	call   c0100cd2 <get_partition_table>
c0100e21:	83 c4 10             	add    $0x10,%esp
c0100e24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e2b:	e9 8a 00 00 00       	jmp    c0100eba <partition+0x109>
c0100e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e33:	83 c0 01             	add    $0x1,%eax
c0100e36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100e39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e3c:	c1 e0 04             	shl    $0x4,%eax
c0100e3f:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e42:	01 c8                	add    %ecx,%eax
c0100e44:	83 e8 5c             	sub    $0x5c,%eax
c0100e47:	8b 00                	mov    (%eax),%eax
c0100e49:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e4c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e4f:	c1 e1 03             	shl    $0x3,%ecx
c0100e52:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e58:	01 ca                	add    %ecx,%edx
c0100e5a:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100e60:	89 02                	mov    %eax,(%edx)
c0100e62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e65:	c1 e0 04             	shl    $0x4,%eax
c0100e68:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e6b:	01 c8                	add    %ecx,%eax
c0100e6d:	83 e8 58             	sub    $0x58,%eax
c0100e70:	8b 00                	mov    (%eax),%eax
c0100e72:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e75:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e78:	c1 e1 03             	shl    $0x3,%ecx
c0100e7b:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e81:	01 ca                	add    %ecx,%edx
c0100e83:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100e89:	89 02                	mov    %eax,(%edx)
c0100e8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e8e:	c1 e0 04             	shl    $0x4,%eax
c0100e91:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e94:	01 c8                	add    %ecx,%eax
c0100e96:	83 e8 60             	sub    $0x60,%eax
c0100e99:	0f b6 00             	movzbl (%eax),%eax
c0100e9c:	3c 05                	cmp    $0x5,%al
c0100e9e:	75 16                	jne    c0100eb6 <partition+0x105>
c0100ea0:	8b 55 08             	mov    0x8(%ebp),%edx
c0100ea3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100ea6:	01 d0                	add    %edx,%eax
c0100ea8:	83 ec 08             	sub    $0x8,%esp
c0100eab:	6a 01                	push   $0x1
c0100ead:	50                   	push   %eax
c0100eae:	e8 fe fe ff ff       	call   c0100db1 <partition>
c0100eb3:	83 c4 10             	add    $0x10,%esp
c0100eb6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100eba:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100ebe:	0f 8e 6c ff ff ff    	jle    c0100e30 <partition+0x7f>
c0100ec4:	e9 ff 00 00 00       	jmp    c0100fc8 <partition+0x217>
c0100ec9:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100ecd:	0f 85 f5 00 00 00    	jne    c0100fc8 <partition+0x217>
c0100ed3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100ed6:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100edb:	89 c8                	mov    %ecx,%eax
c0100edd:	f7 ea                	imul   %edx
c0100edf:	d1 fa                	sar    %edx
c0100ee1:	89 c8                	mov    %ecx,%eax
c0100ee3:	c1 f8 1f             	sar    $0x1f,%eax
c0100ee6:	29 c2                	sub    %eax,%edx
c0100ee8:	89 d0                	mov    %edx,%eax
c0100eea:	c1 e0 02             	shl    $0x2,%eax
c0100eed:	01 d0                	add    %edx,%eax
c0100eef:	29 c1                	sub    %eax,%ecx
c0100ef1:	89 c8                	mov    %ecx,%eax
c0100ef3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100ef6:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100ef9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100efc:	c1 e2 03             	shl    $0x3,%edx
c0100eff:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f05:	01 d0                	add    %edx,%eax
c0100f07:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f0c:	8b 00                	mov    (%eax),%eax
c0100f0e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100f11:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f14:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f17:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100f1a:	83 e8 01             	sub    $0x1,%eax
c0100f1d:	c1 e0 04             	shl    $0x4,%eax
c0100f20:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100f23:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100f2a:	e9 8c 00 00 00       	jmp    c0100fbb <partition+0x20a>
c0100f2f:	83 ec 04             	sub    $0x4,%esp
c0100f32:	6a 40                	push   $0x40
c0100f34:	6a 00                	push   $0x0
c0100f36:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f39:	50                   	push   %eax
c0100f3a:	e8 90 b2 00 00       	call   c010c1cf <Memset>
c0100f3f:	83 c4 10             	add    $0x10,%esp
c0100f42:	83 ec 04             	sub    $0x4,%esp
c0100f45:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100f48:	50                   	push   %eax
c0100f49:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f4c:	ff 75 e8             	pushl  -0x18(%ebp)
c0100f4f:	e8 7e fd ff ff       	call   c0100cd2 <get_partition_table>
c0100f54:	83 c4 10             	add    $0x10,%esp
c0100f57:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100f5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f5d:	01 d0                	add    %edx,%eax
c0100f5f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100f62:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100f65:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f68:	01 c2                	add    %eax,%edx
c0100f6a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100f6d:	8d 48 04             	lea    0x4(%eax),%ecx
c0100f70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f73:	c1 e1 03             	shl    $0x3,%ecx
c0100f76:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f7c:	01 c8                	add    %ecx,%eax
c0100f7e:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f83:	89 10                	mov    %edx,(%eax)
c0100f85:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100f88:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100f8b:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100f8e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100f91:	c1 e1 03             	shl    $0x3,%ecx
c0100f94:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100f9a:	01 ca                	add    %ecx,%edx
c0100f9c:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100fa2:	89 02                	mov    %eax,(%edx)
c0100fa4:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100fa8:	84 c0                	test   %al,%al
c0100faa:	74 1b                	je     c0100fc7 <partition+0x216>
c0100fac:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100faf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100fb2:	01 d0                	add    %edx,%eax
c0100fb4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100fb7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100fbb:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100fbf:	0f 8e 6a ff ff ff    	jle    c0100f2f <partition+0x17e>
c0100fc5:	eb 01                	jmp    c0100fc8 <partition+0x217>
c0100fc7:	90                   	nop
c0100fc8:	90                   	nop
c0100fc9:	c9                   	leave  
c0100fca:	c3                   	ret    

c0100fcb <hd_open>:
c0100fcb:	55                   	push   %ebp
c0100fcc:	89 e5                	mov    %esp,%ebp
c0100fce:	83 ec 18             	sub    $0x18,%esp
c0100fd1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100fd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100fdb:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100fe1:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100fe6:	8b 00                	mov    (%eax),%eax
c0100fe8:	8d 50 01             	lea    0x1(%eax),%edx
c0100feb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100fee:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100ff4:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100ff9:	89 10                	mov    %edx,(%eax)
c0100ffb:	83 ec 0c             	sub    $0xc,%esp
c0100ffe:	6a 00                	push   $0x0
c0101000:	e8 1c fa ff ff       	call   c0100a21 <hd_identify>
c0101005:	83 c4 10             	add    $0x10,%esp
c0101008:	83 ec 08             	sub    $0x8,%esp
c010100b:	6a 00                	push   $0x0
c010100d:	6a 00                	push   $0x0
c010100f:	e8 9d fd ff ff       	call   c0100db1 <partition>
c0101014:	83 c4 10             	add    $0x10,%esp
c0101017:	83 ec 0c             	sub    $0xc,%esp
c010101a:	6a 7c                	push   $0x7c
c010101c:	e8 1b 06 00 00       	call   c010163c <sys_malloc>
c0101021:	83 c4 10             	add    $0x10,%esp
c0101024:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101027:	83 ec 04             	sub    $0x4,%esp
c010102a:	6a 7c                	push   $0x7c
c010102c:	6a 00                	push   $0x0
c010102e:	ff 75 f0             	pushl  -0x10(%ebp)
c0101031:	e8 99 b1 00 00       	call   c010c1cf <Memset>
c0101036:	83 c4 10             	add    $0x10,%esp
c0101039:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010103c:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101043:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101046:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010104d:	83 ec 04             	sub    $0x4,%esp
c0101050:	6a 02                	push   $0x2
c0101052:	ff 75 f0             	pushl  -0x10(%ebp)
c0101055:	6a 01                	push   $0x1
c0101057:	e8 19 85 00 00       	call   c0109575 <send_rec>
c010105c:	83 c4 10             	add    $0x10,%esp
c010105f:	83 ec 08             	sub    $0x8,%esp
c0101062:	6a 7c                	push   $0x7c
c0101064:	ff 75 f0             	pushl  -0x10(%ebp)
c0101067:	e8 e5 05 00 00       	call   c0101651 <sys_free>
c010106c:	83 c4 10             	add    $0x10,%esp
c010106f:	90                   	nop
c0101070:	c9                   	leave  
c0101071:	c3                   	ret    

c0101072 <get_hd_ioctl>:
c0101072:	55                   	push   %ebp
c0101073:	89 e5                	mov    %esp,%ebp
c0101075:	83 ec 18             	sub    $0x18,%esp
c0101078:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c010107c:	7f 19                	jg     c0101097 <get_hd_ioctl+0x25>
c010107e:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101081:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101086:	89 c8                	mov    %ecx,%eax
c0101088:	f7 ea                	imul   %edx
c010108a:	d1 fa                	sar    %edx
c010108c:	89 c8                	mov    %ecx,%eax
c010108e:	c1 f8 1f             	sar    $0x1f,%eax
c0101091:	29 c2                	sub    %eax,%edx
c0101093:	89 d0                	mov    %edx,%eax
c0101095:	eb 11                	jmp    c01010a8 <get_hd_ioctl+0x36>
c0101097:	8b 45 08             	mov    0x8(%ebp),%eax
c010109a:	83 e8 10             	sub    $0x10,%eax
c010109d:	8d 50 3f             	lea    0x3f(%eax),%edx
c01010a0:	85 c0                	test   %eax,%eax
c01010a2:	0f 48 c2             	cmovs  %edx,%eax
c01010a5:	c1 f8 06             	sar    $0x6,%eax
c01010a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010ab:	8b 55 08             	mov    0x8(%ebp),%edx
c01010ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01010b1:	c1 e2 03             	shl    $0x3,%edx
c01010b4:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01010ba:	01 d0                	add    %edx,%eax
c01010bc:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c01010c1:	8b 00                	mov    (%eax),%eax
c01010c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01010c6:	83 ec 0c             	sub    $0xc,%esp
c01010c9:	6a 7c                	push   $0x7c
c01010cb:	e8 6c 05 00 00       	call   c010163c <sys_malloc>
c01010d0:	83 c4 10             	add    $0x10,%esp
c01010d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01010d6:	83 ec 04             	sub    $0x4,%esp
c01010d9:	6a 7c                	push   $0x7c
c01010db:	6a 00                	push   $0x0
c01010dd:	ff 75 ec             	pushl  -0x14(%ebp)
c01010e0:	e8 ea b0 00 00       	call   c010c1cf <Memset>
c01010e5:	83 c4 10             	add    $0x10,%esp
c01010e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01010eb:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01010f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01010f5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01010fc:	83 ec 04             	sub    $0x4,%esp
c01010ff:	6a 02                	push   $0x2
c0101101:	ff 75 ec             	pushl  -0x14(%ebp)
c0101104:	6a 01                	push   $0x1
c0101106:	e8 6a 84 00 00       	call   c0109575 <send_rec>
c010110b:	83 c4 10             	add    $0x10,%esp
c010110e:	83 ec 08             	sub    $0x8,%esp
c0101111:	6a 7c                	push   $0x7c
c0101113:	ff 75 ec             	pushl  -0x14(%ebp)
c0101116:	e8 36 05 00 00       	call   c0101651 <sys_free>
c010111b:	83 c4 10             	add    $0x10,%esp
c010111e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101121:	c9                   	leave  
c0101122:	c3                   	ret    

c0101123 <wait_for>:
c0101123:	55                   	push   %ebp
c0101124:	89 e5                	mov    %esp,%ebp
c0101126:	83 ec 08             	sub    $0x8,%esp
c0101129:	83 ec 04             	sub    $0x4,%esp
c010112c:	68 50 c3 00 00       	push   $0xc350
c0101131:	6a 08                	push   $0x8
c0101133:	6a 08                	push   $0x8
c0101135:	e8 51 03 00 00       	call   c010148b <waitfor>
c010113a:	83 c4 10             	add    $0x10,%esp
c010113d:	85 c0                	test   %eax,%eax
c010113f:	75 10                	jne    c0101151 <wait_for+0x2e>
c0101141:	83 ec 0c             	sub    $0xc,%esp
c0101144:	68 e4 b1 10 c0       	push   $0xc010b1e4
c0101149:	e8 99 77 00 00       	call   c01088e7 <panic>
c010114e:	83 c4 10             	add    $0x10,%esp
c0101151:	90                   	nop
c0101152:	c9                   	leave  
c0101153:	c3                   	ret    

c0101154 <interrupt_wait>:
c0101154:	55                   	push   %ebp
c0101155:	89 e5                	mov    %esp,%ebp
c0101157:	83 ec 18             	sub    $0x18,%esp
c010115a:	83 ec 0c             	sub    $0xc,%esp
c010115d:	6a 7c                	push   $0x7c
c010115f:	e8 d8 04 00 00       	call   c010163c <sys_malloc>
c0101164:	83 c4 10             	add    $0x10,%esp
c0101167:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010116a:	83 ec 04             	sub    $0x4,%esp
c010116d:	6a 7c                	push   $0x7c
c010116f:	6a 00                	push   $0x0
c0101171:	ff 75 f4             	pushl  -0xc(%ebp)
c0101174:	e8 56 b0 00 00       	call   c010c1cf <Memset>
c0101179:	83 c4 10             	add    $0x10,%esp
c010117c:	83 ec 04             	sub    $0x4,%esp
c010117f:	68 13 02 00 00       	push   $0x213
c0101184:	ff 75 f4             	pushl  -0xc(%ebp)
c0101187:	6a 02                	push   $0x2
c0101189:	e8 e7 83 00 00       	call   c0109575 <send_rec>
c010118e:	83 c4 10             	add    $0x10,%esp
c0101191:	83 ec 08             	sub    $0x8,%esp
c0101194:	6a 7c                	push   $0x7c
c0101196:	ff 75 f4             	pushl  -0xc(%ebp)
c0101199:	e8 b3 04 00 00       	call   c0101651 <sys_free>
c010119e:	83 c4 10             	add    $0x10,%esp
c01011a1:	90                   	nop
c01011a2:	c9                   	leave  
c01011a3:	c3                   	ret    

c01011a4 <hd_rdwt>:
c01011a4:	55                   	push   %ebp
c01011a5:	89 e5                	mov    %esp,%ebp
c01011a7:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c01011ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01011b0:	8b 40 18             	mov    0x18(%eax),%eax
c01011b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01011b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01011b9:	8b 40 14             	mov    0x14(%eax),%eax
c01011bc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01011bf:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01011c3:	7f 19                	jg     c01011de <hd_rdwt+0x3a>
c01011c5:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c01011c8:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01011cd:	89 c8                	mov    %ecx,%eax
c01011cf:	f7 ea                	imul   %edx
c01011d1:	d1 fa                	sar    %edx
c01011d3:	89 c8                	mov    %ecx,%eax
c01011d5:	c1 f8 1f             	sar    $0x1f,%eax
c01011d8:	29 c2                	sub    %eax,%edx
c01011da:	89 d0                	mov    %edx,%eax
c01011dc:	eb 11                	jmp    c01011ef <hd_rdwt+0x4b>
c01011de:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01011e1:	83 e8 10             	sub    $0x10,%eax
c01011e4:	8d 50 3f             	lea    0x3f(%eax),%edx
c01011e7:	85 c0                	test   %eax,%eax
c01011e9:	0f 48 c2             	cmovs  %edx,%eax
c01011ec:	c1 f8 06             	sar    $0x6,%eax
c01011ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01011f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01011f5:	8d 50 f0             	lea    -0x10(%eax),%edx
c01011f8:	89 d0                	mov    %edx,%eax
c01011fa:	c1 f8 1f             	sar    $0x1f,%eax
c01011fd:	c1 e8 1a             	shr    $0x1a,%eax
c0101200:	01 c2                	add    %eax,%edx
c0101202:	83 e2 3f             	and    $0x3f,%edx
c0101205:	29 c2                	sub    %eax,%edx
c0101207:	89 d0                	mov    %edx,%eax
c0101209:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010120c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010120f:	c1 e8 09             	shr    $0x9,%eax
c0101212:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101215:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0101219:	7f 1a                	jg     c0101235 <hd_rdwt+0x91>
c010121b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010121e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101221:	c1 e2 03             	shl    $0x3,%edx
c0101224:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010122a:	01 d0                	add    %edx,%eax
c010122c:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101231:	8b 00                	mov    (%eax),%eax
c0101233:	eb 1b                	jmp    c0101250 <hd_rdwt+0xac>
c0101235:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101238:	8d 50 04             	lea    0x4(%eax),%edx
c010123b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010123e:	c1 e2 03             	shl    $0x3,%edx
c0101241:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101247:	01 d0                	add    %edx,%eax
c0101249:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010124e:	8b 00                	mov    (%eax),%eax
c0101250:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101253:	01 d0                	add    %edx,%eax
c0101255:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101258:	8b 45 08             	mov    0x8(%ebp),%eax
c010125b:	8b 40 0c             	mov    0xc(%eax),%eax
c010125e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101261:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101264:	05 ff 01 00 00       	add    $0x1ff,%eax
c0101269:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010126f:	85 c0                	test   %eax,%eax
c0101271:	0f 48 c2             	cmovs  %edx,%eax
c0101274:	c1 f8 09             	sar    $0x9,%eax
c0101277:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010127a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010127d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101280:	8b 45 08             	mov    0x8(%ebp),%eax
c0101283:	8b 40 10             	mov    0x10(%eax),%eax
c0101286:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0101289:	8b 45 08             	mov    0x8(%ebp),%eax
c010128c:	8b 00                	mov    (%eax),%eax
c010128e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101291:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101294:	83 ec 08             	sub    $0x8,%esp
c0101297:	50                   	push   %eax
c0101298:	ff 75 d0             	pushl  -0x30(%ebp)
c010129b:	e8 df 4b 00 00       	call   c0105e7f <alloc_virtual_memory>
c01012a0:	83 c4 10             	add    $0x10,%esp
c01012a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01012a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01012a9:	8b 40 78             	mov    0x78(%eax),%eax
c01012ac:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01012af:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01012b3:	74 22                	je     c01012d7 <hd_rdwt+0x133>
c01012b5:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01012b9:	74 1c                	je     c01012d7 <hd_rdwt+0x133>
c01012bb:	68 b7 01 00 00       	push   $0x1b7
c01012c0:	68 34 b1 10 c0       	push   $0xc010b134
c01012c5:	68 34 b1 10 c0       	push   $0xc010b134
c01012ca:	68 f6 b1 10 c0       	push   $0xc010b1f6
c01012cf:	e8 31 76 00 00       	call   c0108905 <assertion_failure>
c01012d4:	83 c4 10             	add    $0x10,%esp
c01012d7:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c01012db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01012de:	88 45 be             	mov    %al,-0x42(%ebp)
c01012e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01012e4:	88 45 bf             	mov    %al,-0x41(%ebp)
c01012e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01012ea:	c1 f8 08             	sar    $0x8,%eax
c01012ed:	88 45 c0             	mov    %al,-0x40(%ebp)
c01012f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01012f3:	c1 f8 10             	sar    $0x10,%eax
c01012f6:	88 45 c1             	mov    %al,-0x3f(%ebp)
c01012f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01012fc:	c1 f8 18             	sar    $0x18,%eax
c01012ff:	83 e0 0f             	and    $0xf,%eax
c0101302:	83 c8 e0             	or     $0xffffffe0,%eax
c0101305:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0101308:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c010130c:	75 07                	jne    c0101315 <hd_rdwt+0x171>
c010130e:	b8 20 00 00 00       	mov    $0x20,%eax
c0101313:	eb 05                	jmp    c010131a <hd_rdwt+0x176>
c0101315:	b8 30 00 00 00       	mov    $0x30,%eax
c010131a:	88 45 c3             	mov    %al,-0x3d(%ebp)
c010131d:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101321:	3c 20                	cmp    $0x20,%al
c0101323:	74 24                	je     c0101349 <hd_rdwt+0x1a5>
c0101325:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101329:	3c 30                	cmp    $0x30,%al
c010132b:	74 1c                	je     c0101349 <hd_rdwt+0x1a5>
c010132d:	68 c5 01 00 00       	push   $0x1c5
c0101332:	68 34 b1 10 c0       	push   $0xc010b134
c0101337:	68 34 b1 10 c0       	push   $0xc010b134
c010133c:	68 14 b2 10 c0       	push   $0xc010b214
c0101341:	e8 bf 75 00 00       	call   c0108905 <assertion_failure>
c0101346:	83 c4 10             	add    $0x10,%esp
c0101349:	83 ec 0c             	sub    $0xc,%esp
c010134c:	8d 45 bd             	lea    -0x43(%ebp),%eax
c010134f:	50                   	push   %eax
c0101350:	e8 ca f5 ff ff       	call   c010091f <hd_cmd_out>
c0101355:	83 c4 10             	add    $0x10,%esp
c0101358:	e9 9c 00 00 00       	jmp    c01013f9 <hd_rdwt+0x255>
c010135d:	b8 00 02 00 00       	mov    $0x200,%eax
c0101362:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c0101369:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c010136d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0101370:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101374:	75 51                	jne    c01013c7 <hd_rdwt+0x223>
c0101376:	e8 a8 fd ff ff       	call   c0101123 <wait_for>
c010137b:	e8 d4 fd ff ff       	call   c0101154 <interrupt_wait>
c0101380:	83 ec 04             	sub    $0x4,%esp
c0101383:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101386:	6a 00                	push   $0x0
c0101388:	68 80 11 11 c0       	push   $0xc0111180
c010138d:	e8 3d ae 00 00       	call   c010c1cf <Memset>
c0101392:	83 c4 10             	add    $0x10,%esp
c0101395:	83 ec 04             	sub    $0x4,%esp
c0101398:	68 00 02 00 00       	push   $0x200
c010139d:	68 80 11 11 c0       	push   $0xc0111180
c01013a2:	68 f0 01 00 00       	push   $0x1f0
c01013a7:	e8 77 ae 00 00       	call   c010c223 <read_port>
c01013ac:	83 c4 10             	add    $0x10,%esp
c01013af:	83 ec 04             	sub    $0x4,%esp
c01013b2:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013b5:	68 80 11 11 c0       	push   $0xc0111180
c01013ba:	ff 75 f0             	pushl  -0x10(%ebp)
c01013bd:	e8 2a 59 00 00       	call   c0106cec <Memcpy>
c01013c2:	83 c4 10             	add    $0x10,%esp
c01013c5:	eb 26                	jmp    c01013ed <hd_rdwt+0x249>
c01013c7:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01013cb:	75 20                	jne    c01013ed <hd_rdwt+0x249>
c01013cd:	e8 51 fd ff ff       	call   c0101123 <wait_for>
c01013d2:	83 ec 04             	sub    $0x4,%esp
c01013d5:	ff 75 c4             	pushl  -0x3c(%ebp)
c01013d8:	ff 75 f0             	pushl  -0x10(%ebp)
c01013db:	68 f0 01 00 00       	push   $0x1f0
c01013e0:	e8 52 ae 00 00       	call   c010c237 <write_port>
c01013e5:	83 c4 10             	add    $0x10,%esp
c01013e8:	e8 67 fd ff ff       	call   c0101154 <interrupt_wait>
c01013ed:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01013f0:	29 45 f4             	sub    %eax,-0xc(%ebp)
c01013f3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01013f6:	01 45 f0             	add    %eax,-0x10(%ebp)
c01013f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01013fd:	0f 85 5a ff ff ff    	jne    c010135d <hd_rdwt+0x1b9>
c0101403:	83 ec 04             	sub    $0x4,%esp
c0101406:	6a 7c                	push   $0x7c
c0101408:	6a 00                	push   $0x0
c010140a:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101410:	50                   	push   %eax
c0101411:	e8 b9 ad 00 00       	call   c010c1cf <Memset>
c0101416:	83 c4 10             	add    $0x10,%esp
c0101419:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0101420:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101427:	00 00 00 
c010142a:	83 ec 04             	sub    $0x4,%esp
c010142d:	6a 02                	push   $0x2
c010142f:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101435:	50                   	push   %eax
c0101436:	6a 01                	push   $0x1
c0101438:	e8 38 81 00 00       	call   c0109575 <send_rec>
c010143d:	83 c4 10             	add    $0x10,%esp
c0101440:	90                   	nop
c0101441:	c9                   	leave  
c0101442:	c3                   	ret    

c0101443 <hd_handler>:
c0101443:	55                   	push   %ebp
c0101444:	89 e5                	mov    %esp,%ebp
c0101446:	83 ec 18             	sub    $0x18,%esp
c0101449:	83 ec 0c             	sub    $0xc,%esp
c010144c:	68 f7 01 00 00       	push   $0x1f7
c0101451:	e8 8e ee ff ff       	call   c01002e4 <in_byte>
c0101456:	83 c4 10             	add    $0x10,%esp
c0101459:	0f b6 c0             	movzbl %al,%eax
c010145c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010145f:	83 ec 0c             	sub    $0xc,%esp
c0101462:	6a 03                	push   $0x3
c0101464:	e8 a6 83 00 00       	call   c010980f <inform_int>
c0101469:	83 c4 10             	add    $0x10,%esp
c010146c:	90                   	nop
c010146d:	c9                   	leave  
c010146e:	c3                   	ret    

c010146f <net_handler>:
c010146f:	55                   	push   %ebp
c0101470:	89 e5                	mov    %esp,%ebp
c0101472:	83 ec 08             	sub    $0x8,%esp
c0101475:	83 ec 0c             	sub    $0xc,%esp
c0101478:	68 48 b2 10 c0       	push   $0xc010b248
c010147d:	e8 26 71 00 00       	call   c01085a8 <Printf>
c0101482:	83 c4 10             	add    $0x10,%esp
c0101485:	66 87 db             	xchg   %bx,%bx
c0101488:	90                   	nop
c0101489:	c9                   	leave  
c010148a:	c3                   	ret    

c010148b <waitfor>:
c010148b:	55                   	push   %ebp
c010148c:	89 e5                	mov    %esp,%ebp
c010148e:	83 ec 18             	sub    $0x18,%esp
c0101491:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101498:	eb 26                	jmp    c01014c0 <waitfor+0x35>
c010149a:	83 ec 0c             	sub    $0xc,%esp
c010149d:	68 f7 01 00 00       	push   $0x1f7
c01014a2:	e8 3d ee ff ff       	call   c01002e4 <in_byte>
c01014a7:	83 c4 10             	add    $0x10,%esp
c01014aa:	0f b6 c0             	movzbl %al,%eax
c01014ad:	23 45 08             	and    0x8(%ebp),%eax
c01014b0:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01014b3:	75 07                	jne    c01014bc <waitfor+0x31>
c01014b5:	b8 01 00 00 00       	mov    $0x1,%eax
c01014ba:	eb 11                	jmp    c01014cd <waitfor+0x42>
c01014bc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01014c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01014c3:	3b 45 10             	cmp    0x10(%ebp),%eax
c01014c6:	7c d2                	jl     c010149a <waitfor+0xf>
c01014c8:	b8 00 00 00 00       	mov    $0x0,%eax
c01014cd:	c9                   	leave  
c01014ce:	c3                   	ret    

c01014cf <print_hd_info>:
c01014cf:	55                   	push   %ebp
c01014d0:	89 e5                	mov    %esp,%ebp
c01014d2:	83 ec 18             	sub    $0x18,%esp
c01014d5:	83 ec 0c             	sub    $0xc,%esp
c01014d8:	68 6a b2 10 c0       	push   $0xc010b26a
c01014dd:	e8 c6 70 00 00       	call   c01085a8 <Printf>
c01014e2:	83 c4 10             	add    $0x10,%esp
c01014e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01014ec:	eb 3b                	jmp    c0101529 <print_hd_info+0x5a>
c01014ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01014f1:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01014f8:	85 c0                	test   %eax,%eax
c01014fa:	74 28                	je     c0101524 <print_hd_info+0x55>
c01014fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01014ff:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101506:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101509:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101510:	ff 75 f4             	pushl  -0xc(%ebp)
c0101513:	52                   	push   %edx
c0101514:	50                   	push   %eax
c0101515:	68 87 b2 10 c0       	push   $0xc010b287
c010151a:	e8 89 70 00 00       	call   c01085a8 <Printf>
c010151f:	83 c4 10             	add    $0x10,%esp
c0101522:	eb 01                	jmp    c0101525 <print_hd_info+0x56>
c0101524:	90                   	nop
c0101525:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101529:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c010152d:	7e bf                	jle    c01014ee <print_hd_info+0x1f>
c010152f:	83 ec 0c             	sub    $0xc,%esp
c0101532:	68 9f b2 10 c0       	push   $0xc010b29f
c0101537:	e8 6c 70 00 00       	call   c01085a8 <Printf>
c010153c:	83 c4 10             	add    $0x10,%esp
c010153f:	83 ec 0c             	sub    $0xc,%esp
c0101542:	68 ba b2 10 c0       	push   $0xc010b2ba
c0101547:	e8 5c 70 00 00       	call   c01085a8 <Printf>
c010154c:	83 c4 10             	add    $0x10,%esp
c010154f:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0101556:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010155d:	eb 44                	jmp    c01015a3 <print_hd_info+0xd4>
c010155f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101562:	83 c0 04             	add    $0x4,%eax
c0101565:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c010156c:	85 c0                	test   %eax,%eax
c010156e:	74 2e                	je     c010159e <print_hd_info+0xcf>
c0101570:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101573:	83 c0 04             	add    $0x4,%eax
c0101576:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c010157d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101580:	83 c0 04             	add    $0x4,%eax
c0101583:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c010158a:	ff 75 f0             	pushl  -0x10(%ebp)
c010158d:	52                   	push   %edx
c010158e:	50                   	push   %eax
c010158f:	68 87 b2 10 c0       	push   $0xc010b287
c0101594:	e8 0f 70 00 00       	call   c01085a8 <Printf>
c0101599:	83 c4 10             	add    $0x10,%esp
c010159c:	eb 01                	jmp    c010159f <print_hd_info+0xd0>
c010159e:	90                   	nop
c010159f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01015a3:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01015a7:	7e b6                	jle    c010155f <print_hd_info+0x90>
c01015a9:	83 ec 0c             	sub    $0xc,%esp
c01015ac:	68 d7 b2 10 c0       	push   $0xc010b2d7
c01015b1:	e8 f2 6f 00 00       	call   c01085a8 <Printf>
c01015b6:	83 c4 10             	add    $0x10,%esp
c01015b9:	90                   	nop
c01015ba:	c9                   	leave  
c01015bb:	c3                   	ret    

c01015bc <is_empty>:
c01015bc:	55                   	push   %ebp
c01015bd:	89 e5                	mov    %esp,%ebp
c01015bf:	83 ec 10             	sub    $0x10,%esp
c01015c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01015c9:	eb 1a                	jmp    c01015e5 <is_empty+0x29>
c01015cb:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01015ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01015d1:	01 d0                	add    %edx,%eax
c01015d3:	0f b6 00             	movzbl (%eax),%eax
c01015d6:	84 c0                	test   %al,%al
c01015d8:	74 07                	je     c01015e1 <is_empty+0x25>
c01015da:	b8 00 00 00 00       	mov    $0x0,%eax
c01015df:	eb 11                	jmp    c01015f2 <is_empty+0x36>
c01015e1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01015e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01015e8:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01015eb:	7c de                	jl     c01015cb <is_empty+0xf>
c01015ed:	b8 01 00 00 00       	mov    $0x1,%eax
c01015f2:	c9                   	leave  
c01015f3:	c3                   	ret    
c01015f4:	66 90                	xchg   %ax,%ax
c01015f6:	66 90                	xchg   %ax,%ax
c01015f8:	66 90                	xchg   %ax,%ax
c01015fa:	66 90                	xchg   %ax,%ax
c01015fc:	66 90                	xchg   %ax,%ax
c01015fe:	66 90                	xchg   %ax,%ax

c0101600 <write_debug>:
c0101600:	b8 02 00 00 00       	mov    $0x2,%eax
c0101605:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101609:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010160d:	cd 90                	int    $0x90
c010160f:	c3                   	ret    

c0101610 <send_msg>:
c0101610:	55                   	push   %ebp
c0101611:	89 e5                	mov    %esp,%ebp
c0101613:	53                   	push   %ebx
c0101614:	51                   	push   %ecx
c0101615:	b8 03 00 00 00       	mov    $0x3,%eax
c010161a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010161d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101620:	cd 90                	int    $0x90
c0101622:	59                   	pop    %ecx
c0101623:	5b                   	pop    %ebx
c0101624:	5d                   	pop    %ebp
c0101625:	c3                   	ret    

c0101626 <receive_msg>:
c0101626:	55                   	push   %ebp
c0101627:	89 e5                	mov    %esp,%ebp
c0101629:	53                   	push   %ebx
c010162a:	51                   	push   %ecx
c010162b:	b8 04 00 00 00       	mov    $0x4,%eax
c0101630:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101633:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101636:	cd 90                	int    $0x90
c0101638:	59                   	pop    %ecx
c0101639:	5b                   	pop    %ebx
c010163a:	5d                   	pop    %ebp
c010163b:	c3                   	ret    

c010163c <sys_malloc>:
c010163c:	56                   	push   %esi
c010163d:	57                   	push   %edi
c010163e:	53                   	push   %ebx
c010163f:	55                   	push   %ebp
c0101640:	89 e5                	mov    %esp,%ebp
c0101642:	b8 05 00 00 00       	mov    $0x5,%eax
c0101647:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010164a:	cd 90                	int    $0x90
c010164c:	5d                   	pop    %ebp
c010164d:	5b                   	pop    %ebx
c010164e:	5f                   	pop    %edi
c010164f:	5e                   	pop    %esi
c0101650:	c3                   	ret    

c0101651 <sys_free>:
c0101651:	56                   	push   %esi
c0101652:	57                   	push   %edi
c0101653:	53                   	push   %ebx
c0101654:	55                   	push   %ebp
c0101655:	89 e5                	mov    %esp,%ebp
c0101657:	b8 06 00 00 00       	mov    $0x6,%eax
c010165c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010165f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0101662:	cd 90                	int    $0x90
c0101664:	5d                   	pop    %ebp
c0101665:	5b                   	pop    %ebx
c0101666:	5f                   	pop    %edi
c0101667:	5e                   	pop    %esi
c0101668:	c3                   	ret    

c0101669 <task_fs>:
c0101669:	55                   	push   %ebp
c010166a:	89 e5                	mov    %esp,%ebp
c010166c:	83 ec 28             	sub    $0x28,%esp
c010166f:	e8 bb 08 00 00       	call   c0101f2f <init_fs>
c0101674:	83 ec 0c             	sub    $0xc,%esp
c0101677:	6a 7c                	push   $0x7c
c0101679:	e8 be ff ff ff       	call   c010163c <sys_malloc>
c010167e:	83 c4 10             	add    $0x10,%esp
c0101681:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101684:	83 ec 0c             	sub    $0xc,%esp
c0101687:	6a 7c                	push   $0x7c
c0101689:	e8 ae ff ff ff       	call   c010163c <sys_malloc>
c010168e:	83 c4 10             	add    $0x10,%esp
c0101691:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101694:	83 ec 04             	sub    $0x4,%esp
c0101697:	6a 7c                	push   $0x7c
c0101699:	6a 00                	push   $0x0
c010169b:	ff 75 f4             	pushl  -0xc(%ebp)
c010169e:	e8 2c ab 00 00       	call   c010c1cf <Memset>
c01016a3:	83 c4 10             	add    $0x10,%esp
c01016a6:	83 ec 04             	sub    $0x4,%esp
c01016a9:	6a 12                	push   $0x12
c01016ab:	ff 75 f4             	pushl  -0xc(%ebp)
c01016ae:	6a 02                	push   $0x2
c01016b0:	e8 c0 7e 00 00       	call   c0109575 <send_rec>
c01016b5:	83 c4 10             	add    $0x10,%esp
c01016b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016bb:	8b 40 78             	mov    0x78(%eax),%eax
c01016be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01016c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016c4:	8b 00                	mov    (%eax),%eax
c01016c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01016c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016cc:	8b 40 50             	mov    0x50(%eax),%eax
c01016cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01016d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016d5:	8b 40 68             	mov    0x68(%eax),%eax
c01016d8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01016db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016de:	8b 00                	mov    (%eax),%eax
c01016e0:	85 c0                	test   %eax,%eax
c01016e2:	75 07                	jne    c01016eb <task_fs+0x82>
c01016e4:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c01016eb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c01016f2:	83 ec 0c             	sub    $0xc,%esp
c01016f5:	ff 75 e8             	pushl  -0x18(%ebp)
c01016f8:	e8 39 21 00 00       	call   c0103836 <pid2proc>
c01016fd:	83 c4 10             	add    $0x10,%esp
c0101700:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101705:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101709:	74 37                	je     c0101742 <task_fs+0xd9>
c010170b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010170f:	74 31                	je     c0101742 <task_fs+0xd9>
c0101711:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101715:	74 2b                	je     c0101742 <task_fs+0xd9>
c0101717:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010171b:	74 25                	je     c0101742 <task_fs+0xd9>
c010171d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101721:	74 1f                	je     c0101742 <task_fs+0xd9>
c0101723:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101727:	74 19                	je     c0101742 <task_fs+0xd9>
c0101729:	6a 7a                	push   $0x7a
c010172b:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101730:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101735:	68 08 b3 10 c0       	push   $0xc010b308
c010173a:	e8 c6 71 00 00       	call   c0108905 <assertion_failure>
c010173f:	83 c4 10             	add    $0x10,%esp
c0101742:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101746:	74 3a                	je     c0101782 <task_fs+0x119>
c0101748:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010174c:	7f 19                	jg     c0101767 <task_fs+0xfe>
c010174e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101752:	0f 84 10 01 00 00    	je     c0101868 <task_fs+0x1ff>
c0101758:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010175c:	0f 84 a1 00 00 00    	je     c0101803 <task_fs+0x19a>
c0101762:	e9 ef 00 00 00       	jmp    c0101856 <task_fs+0x1ed>
c0101767:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c010176b:	74 50                	je     c01017bd <task_fs+0x154>
c010176d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101771:	0f 84 c6 00 00 00    	je     c010183d <task_fs+0x1d4>
c0101777:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010177b:	74 40                	je     c01017bd <task_fs+0x154>
c010177d:	e9 d4 00 00 00       	jmp    c0101856 <task_fs+0x1ed>
c0101782:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101785:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010178c:	83 ec 0c             	sub    $0xc,%esp
c010178f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101792:	e8 ec 07 00 00       	call   c0101f83 <do_open>
c0101797:	83 c4 10             	add    $0x10,%esp
c010179a:	89 c2                	mov    %eax,%edx
c010179c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010179f:	89 50 50             	mov    %edx,0x50(%eax)
c01017a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017a5:	8b 00                	mov    (%eax),%eax
c01017a7:	83 ec 04             	sub    $0x4,%esp
c01017aa:	50                   	push   %eax
c01017ab:	ff 75 f4             	pushl  -0xc(%ebp)
c01017ae:	6a 01                	push   $0x1
c01017b0:	e8 c0 7d 00 00       	call   c0109575 <send_rec>
c01017b5:	83 c4 10             	add    $0x10,%esp
c01017b8:	e9 b2 00 00 00       	jmp    c010186f <task_fs+0x206>
c01017bd:	83 ec 0c             	sub    $0xc,%esp
c01017c0:	ff 75 f4             	pushl  -0xc(%ebp)
c01017c3:	e8 19 19 00 00       	call   c01030e1 <do_rdwt>
c01017c8:	83 c4 10             	add    $0x10,%esp
c01017cb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01017ce:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c01017d2:	0f 84 96 00 00 00    	je     c010186e <task_fs+0x205>
c01017d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017db:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01017e2:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01017e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017e8:	89 50 60             	mov    %edx,0x60(%eax)
c01017eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017ee:	8b 00                	mov    (%eax),%eax
c01017f0:	83 ec 04             	sub    $0x4,%esp
c01017f3:	50                   	push   %eax
c01017f4:	ff 75 f4             	pushl  -0xc(%ebp)
c01017f7:	6a 01                	push   $0x1
c01017f9:	e8 77 7d 00 00       	call   c0109575 <send_rec>
c01017fe:	83 c4 10             	add    $0x10,%esp
c0101801:	eb 6b                	jmp    c010186e <task_fs+0x205>
c0101803:	83 ec 0c             	sub    $0xc,%esp
c0101806:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101809:	e8 f0 1d 00 00       	call   c01035fe <do_close>
c010180e:	83 c4 10             	add    $0x10,%esp
c0101811:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101814:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010181b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010181e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101825:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101828:	8b 00                	mov    (%eax),%eax
c010182a:	83 ec 04             	sub    $0x4,%esp
c010182d:	50                   	push   %eax
c010182e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101831:	6a 01                	push   $0x1
c0101833:	e8 3d 7d 00 00       	call   c0109575 <send_rec>
c0101838:	83 c4 10             	add    $0x10,%esp
c010183b:	eb 32                	jmp    c010186f <task_fs+0x206>
c010183d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101840:	8b 40 68             	mov    0x68(%eax),%eax
c0101843:	83 ec 04             	sub    $0x4,%esp
c0101846:	50                   	push   %eax
c0101847:	ff 75 f4             	pushl  -0xc(%ebp)
c010184a:	6a 01                	push   $0x1
c010184c:	e8 24 7d 00 00       	call   c0109575 <send_rec>
c0101851:	83 c4 10             	add    $0x10,%esp
c0101854:	eb 19                	jmp    c010186f <task_fs+0x206>
c0101856:	83 ec 0c             	sub    $0xc,%esp
c0101859:	68 6b b3 10 c0       	push   $0xc010b36b
c010185e:	e8 84 70 00 00       	call   c01088e7 <panic>
c0101863:	83 c4 10             	add    $0x10,%esp
c0101866:	eb 07                	jmp    c010186f <task_fs+0x206>
c0101868:	90                   	nop
c0101869:	e9 26 fe ff ff       	jmp    c0101694 <task_fs+0x2b>
c010186e:	90                   	nop
c010186f:	e9 20 fe ff ff       	jmp    c0101694 <task_fs+0x2b>

c0101874 <rd_wt>:
c0101874:	55                   	push   %ebp
c0101875:	89 e5                	mov    %esp,%ebp
c0101877:	83 ec 18             	sub    $0x18,%esp
c010187a:	83 ec 0c             	sub    $0xc,%esp
c010187d:	6a 7c                	push   $0x7c
c010187f:	e8 b8 fd ff ff       	call   c010163c <sys_malloc>
c0101884:	83 c4 10             	add    $0x10,%esp
c0101887:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010188a:	83 ec 04             	sub    $0x4,%esp
c010188d:	6a 7c                	push   $0x7c
c010188f:	6a 00                	push   $0x0
c0101891:	ff 75 f4             	pushl  -0xc(%ebp)
c0101894:	e8 36 a9 00 00       	call   c010c1cf <Memset>
c0101899:	83 c4 10             	add    $0x10,%esp
c010189c:	8b 55 18             	mov    0x18(%ebp),%edx
c010189f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018a2:	89 50 78             	mov    %edx,0x78(%eax)
c01018a5:	8b 55 0c             	mov    0xc(%ebp),%edx
c01018a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018ab:	89 50 14             	mov    %edx,0x14(%eax)
c01018ae:	8b 55 10             	mov    0x10(%ebp),%edx
c01018b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018b4:	89 50 10             	mov    %edx,0x10(%eax)
c01018b7:	8b 55 14             	mov    0x14(%ebp),%edx
c01018ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018bd:	89 50 0c             	mov    %edx,0xc(%eax)
c01018c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01018c3:	c1 e0 09             	shl    $0x9,%eax
c01018c6:	89 c2                	mov    %eax,%edx
c01018c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018cb:	89 50 18             	mov    %edx,0x18(%eax)
c01018ce:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c01018d2:	74 22                	je     c01018f6 <rd_wt+0x82>
c01018d4:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c01018d8:	74 1c                	je     c01018f6 <rd_wt+0x82>
c01018da:	68 b1 00 00 00       	push   $0xb1
c01018df:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01018e4:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01018e9:	68 7e b3 10 c0       	push   $0xc010b37e
c01018ee:	e8 12 70 00 00       	call   c0108905 <assertion_failure>
c01018f3:	83 c4 10             	add    $0x10,%esp
c01018f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018f9:	8b 40 78             	mov    0x78(%eax),%eax
c01018fc:	83 f8 07             	cmp    $0x7,%eax
c01018ff:	74 27                	je     c0101928 <rd_wt+0xb4>
c0101901:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101904:	8b 40 78             	mov    0x78(%eax),%eax
c0101907:	83 f8 0a             	cmp    $0xa,%eax
c010190a:	74 1c                	je     c0101928 <rd_wt+0xb4>
c010190c:	68 b2 00 00 00       	push   $0xb2
c0101911:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0101916:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010191b:	68 9c b3 10 c0       	push   $0xc010b39c
c0101920:	e8 e0 6f 00 00       	call   c0108905 <assertion_failure>
c0101925:	83 c4 10             	add    $0x10,%esp
c0101928:	83 ec 04             	sub    $0x4,%esp
c010192b:	6a 03                	push   $0x3
c010192d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101930:	6a 03                	push   $0x3
c0101932:	e8 3e 7c 00 00       	call   c0109575 <send_rec>
c0101937:	83 c4 10             	add    $0x10,%esp
c010193a:	83 ec 08             	sub    $0x8,%esp
c010193d:	6a 7c                	push   $0x7c
c010193f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101942:	e8 0a fd ff ff       	call   c0101651 <sys_free>
c0101947:	83 c4 10             	add    $0x10,%esp
c010194a:	90                   	nop
c010194b:	c9                   	leave  
c010194c:	c3                   	ret    

c010194d <mkfs>:
c010194d:	55                   	push   %ebp
c010194e:	89 e5                	mov    %esp,%ebp
c0101950:	57                   	push   %edi
c0101951:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101957:	83 ec 0c             	sub    $0xc,%esp
c010195a:	68 00 80 00 00       	push   $0x8000
c010195f:	e8 d8 fc ff ff       	call   c010163c <sys_malloc>
c0101964:	83 c4 10             	add    $0x10,%esp
c0101967:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c010196c:	83 ec 0c             	sub    $0xc,%esp
c010196f:	6a 24                	push   $0x24
c0101971:	e8 c6 fc ff ff       	call   c010163c <sys_malloc>
c0101976:	83 c4 10             	add    $0x10,%esp
c0101979:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c010197e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101983:	83 ec 0c             	sub    $0xc,%esp
c0101986:	50                   	push   %eax
c0101987:	e8 42 46 00 00       	call   c0105fce <get_physical_address>
c010198c:	83 c4 10             	add    $0x10,%esp
c010198f:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101994:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101999:	83 ec 0c             	sub    $0xc,%esp
c010199c:	50                   	push   %eax
c010199d:	e8 2c 46 00 00       	call   c0105fce <get_physical_address>
c01019a2:	83 c4 10             	add    $0x10,%esp
c01019a5:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c01019aa:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019af:	83 ec 04             	sub    $0x4,%esp
c01019b2:	68 00 02 00 00       	push   $0x200
c01019b7:	6a 00                	push   $0x0
c01019b9:	50                   	push   %eax
c01019ba:	e8 10 a8 00 00       	call   c010c1cf <Memset>
c01019bf:	83 c4 10             	add    $0x10,%esp
c01019c2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019c7:	83 ec 0c             	sub    $0xc,%esp
c01019ca:	6a 0a                	push   $0xa
c01019cc:	68 00 02 00 00       	push   $0x200
c01019d1:	50                   	push   %eax
c01019d2:	6a 20                	push   $0x20
c01019d4:	6a 00                	push   $0x0
c01019d6:	e8 99 fe ff ff       	call   c0101874 <rd_wt>
c01019db:	83 c4 20             	add    $0x20,%esp
c01019de:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019e3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01019e6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019e9:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01019f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019f3:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c01019fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019fd:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101a04:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a07:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0101a0e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a11:	8b 40 04             	mov    0x4(%eax),%eax
c0101a14:	8d 50 02             	lea    0x2(%eax),%edx
c0101a17:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a1a:	8b 40 08             	mov    0x8(%eax),%eax
c0101a1d:	01 c2                	add    %eax,%edx
c0101a1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a22:	8b 40 0c             	mov    0xc(%eax),%eax
c0101a25:	01 c2                	add    %eax,%edx
c0101a27:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a2a:	89 10                	mov    %edx,(%eax)
c0101a2c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101a33:	b8 00 02 00 00       	mov    $0x200,%eax
c0101a38:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0101a3b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101a41:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101a44:	01 ca                	add    %ecx,%edx
c0101a46:	83 ec 04             	sub    $0x4,%esp
c0101a49:	50                   	push   %eax
c0101a4a:	6a 80                	push   $0xffffff80
c0101a4c:	52                   	push   %edx
c0101a4d:	e8 7d a7 00 00       	call   c010c1cf <Memset>
c0101a52:	83 c4 10             	add    $0x10,%esp
c0101a55:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a5a:	83 ec 0c             	sub    $0xc,%esp
c0101a5d:	6a 0a                	push   $0xa
c0101a5f:	68 00 02 00 00       	push   $0x200
c0101a64:	50                   	push   %eax
c0101a65:	6a 20                	push   $0x20
c0101a67:	6a 01                	push   $0x1
c0101a69:	e8 06 fe ff ff       	call   c0101874 <rd_wt>
c0101a6e:	83 c4 20             	add    $0x20,%esp
c0101a71:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a74:	8b 10                	mov    (%eax),%edx
c0101a76:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101a79:	8b 50 04             	mov    0x4(%eax),%edx
c0101a7c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101a7f:	8b 50 08             	mov    0x8(%eax),%edx
c0101a82:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101a85:	8b 50 0c             	mov    0xc(%eax),%edx
c0101a88:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101a8b:	8b 50 10             	mov    0x10(%eax),%edx
c0101a8e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101a91:	8b 50 14             	mov    0x14(%eax),%edx
c0101a94:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101a97:	8b 50 18             	mov    0x18(%eax),%edx
c0101a9a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101a9d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101aa0:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101aa3:	8b 40 20             	mov    0x20(%eax),%eax
c0101aa6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101aa9:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101aad:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101ab1:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ab6:	83 ec 04             	sub    $0x4,%esp
c0101ab9:	6a 01                	push   $0x1
c0101abb:	52                   	push   %edx
c0101abc:	50                   	push   %eax
c0101abd:	e8 0d a7 00 00       	call   c010c1cf <Memset>
c0101ac2:	83 c4 10             	add    $0x10,%esp
c0101ac5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101aca:	83 c0 01             	add    $0x1,%eax
c0101acd:	83 ec 04             	sub    $0x4,%esp
c0101ad0:	68 ff 01 00 00       	push   $0x1ff
c0101ad5:	6a 80                	push   $0xffffff80
c0101ad7:	50                   	push   %eax
c0101ad8:	e8 f2 a6 00 00       	call   c010c1cf <Memset>
c0101add:	83 c4 10             	add    $0x10,%esp
c0101ae0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101ae5:	83 ec 0c             	sub    $0xc,%esp
c0101ae8:	6a 0a                	push   $0xa
c0101aea:	68 00 02 00 00       	push   $0x200
c0101aef:	50                   	push   %eax
c0101af0:	6a 20                	push   $0x20
c0101af2:	6a 02                	push   $0x2
c0101af4:	e8 7b fd ff ff       	call   c0101874 <rd_wt>
c0101af9:	83 c4 20             	add    $0x20,%esp
c0101afc:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101b03:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b08:	83 ec 04             	sub    $0x4,%esp
c0101b0b:	68 00 02 00 00       	push   $0x200
c0101b10:	6a ff                	push   $0xffffffff
c0101b12:	50                   	push   %eax
c0101b13:	e8 b7 a6 00 00       	call   c010c1cf <Memset>
c0101b18:	83 c4 10             	add    $0x10,%esp
c0101b1b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b20:	83 ec 0c             	sub    $0xc,%esp
c0101b23:	6a 0a                	push   $0xa
c0101b25:	68 00 02 00 00       	push   $0x200
c0101b2a:	50                   	push   %eax
c0101b2b:	6a 20                	push   $0x20
c0101b2d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101b30:	e8 3f fd ff ff       	call   c0101874 <rd_wt>
c0101b35:	83 c4 20             	add    $0x20,%esp
c0101b38:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b3d:	83 ec 04             	sub    $0x4,%esp
c0101b40:	6a 01                	push   $0x1
c0101b42:	6a 01                	push   $0x1
c0101b44:	50                   	push   %eax
c0101b45:	e8 85 a6 00 00       	call   c010c1cf <Memset>
c0101b4a:	83 c4 10             	add    $0x10,%esp
c0101b4d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b52:	83 c0 01             	add    $0x1,%eax
c0101b55:	83 ec 04             	sub    $0x4,%esp
c0101b58:	68 ff 01 00 00       	push   $0x1ff
c0101b5d:	6a 00                	push   $0x0
c0101b5f:	50                   	push   %eax
c0101b60:	e8 6a a6 00 00       	call   c010c1cf <Memset>
c0101b65:	83 c4 10             	add    $0x10,%esp
c0101b68:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b6d:	89 c2                	mov    %eax,%edx
c0101b6f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101b72:	83 c0 01             	add    $0x1,%eax
c0101b75:	83 ec 0c             	sub    $0xc,%esp
c0101b78:	6a 0a                	push   $0xa
c0101b7a:	68 00 02 00 00       	push   $0x200
c0101b7f:	52                   	push   %edx
c0101b80:	6a 20                	push   $0x20
c0101b82:	50                   	push   %eax
c0101b83:	e8 ec fc ff ff       	call   c0101874 <rd_wt>
c0101b88:	83 c4 20             	add    $0x20,%esp
c0101b8b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101b8e:	83 e8 02             	sub    $0x2,%eax
c0101b91:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101b94:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101b9b:	eb 04                	jmp    c0101ba1 <mkfs+0x254>
c0101b9d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101ba1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101ba4:	83 c0 01             	add    $0x1,%eax
c0101ba7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101baa:	7e f1                	jle    c0101b9d <mkfs+0x250>
c0101bac:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101bb1:	89 c2                	mov    %eax,%edx
c0101bb3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101bb6:	83 c0 03             	add    $0x3,%eax
c0101bb9:	83 ec 0c             	sub    $0xc,%esp
c0101bbc:	6a 0a                	push   $0xa
c0101bbe:	68 00 02 00 00       	push   $0x200
c0101bc3:	52                   	push   %edx
c0101bc4:	6a 20                	push   $0x20
c0101bc6:	50                   	push   %eax
c0101bc7:	e8 a8 fc ff ff       	call   c0101874 <rd_wt>
c0101bcc:	83 c4 20             	add    $0x20,%esp
c0101bcf:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101bd4:	89 c2                	mov    %eax,%edx
c0101bd6:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101bd9:	83 c0 03             	add    $0x3,%eax
c0101bdc:	83 ec 0c             	sub    $0xc,%esp
c0101bdf:	6a 07                	push   $0x7
c0101be1:	68 00 02 00 00       	push   $0x200
c0101be6:	52                   	push   %edx
c0101be7:	6a 20                	push   $0x20
c0101be9:	50                   	push   %eax
c0101bea:	e8 85 fc ff ff       	call   c0101874 <rd_wt>
c0101bef:	83 c4 20             	add    $0x20,%esp
c0101bf2:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101bf7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101bfa:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bfd:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101c03:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c06:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101c0d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101c10:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c13:	89 50 08             	mov    %edx,0x8(%eax)
c0101c16:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c19:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101c20:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c23:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101c2a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c2d:	8b 10                	mov    (%eax),%edx
c0101c2f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101c35:	8b 50 04             	mov    0x4(%eax),%edx
c0101c38:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101c3e:	8b 50 08             	mov    0x8(%eax),%edx
c0101c41:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101c47:	8b 50 0c             	mov    0xc(%eax),%edx
c0101c4a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101c50:	8b 50 10             	mov    0x10(%eax),%edx
c0101c53:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101c59:	8b 50 14             	mov    0x14(%eax),%edx
c0101c5c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101c62:	8b 50 18             	mov    0x18(%eax),%edx
c0101c65:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101c6b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101c6e:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101c74:	8b 50 20             	mov    0x20(%eax),%edx
c0101c77:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101c7d:	8b 40 24             	mov    0x24(%eax),%eax
c0101c80:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101c85:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101c8c:	eb 4c                	jmp    c0101cda <mkfs+0x38d>
c0101c8e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c93:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101c96:	83 c2 01             	add    $0x1,%edx
c0101c99:	c1 e2 05             	shl    $0x5,%edx
c0101c9c:	01 d0                	add    %edx,%eax
c0101c9e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101ca1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ca4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101caa:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cad:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101cb4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cb7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101cbe:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101cc5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101cc8:	c1 e0 08             	shl    $0x8,%eax
c0101ccb:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101cce:	89 c2                	mov    %eax,%edx
c0101cd0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cd3:	89 50 08             	mov    %edx,0x8(%eax)
c0101cd6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101cda:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101cde:	7e ae                	jle    c0101c8e <mkfs+0x341>
c0101ce0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101ce7:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101ced:	b8 00 00 00 00       	mov    $0x0,%eax
c0101cf2:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101cf7:	89 d7                	mov    %edx,%edi
c0101cf9:	f3 ab                	rep stos %eax,%es:(%edi)
c0101cfb:	c7 85 70 ff ff ff c4 	movl   $0xc010b3c4,-0x90(%ebp)
c0101d02:	b3 10 c0 
c0101d05:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101d0c:	eb 54                	jmp    c0101d62 <mkfs+0x415>
c0101d0e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d13:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101d16:	83 c2 04             	add    $0x4,%edx
c0101d19:	c1 e2 05             	shl    $0x5,%edx
c0101d1c:	01 d0                	add    %edx,%eax
c0101d1e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101d21:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d24:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101d2a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d2d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101d34:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101d37:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101d3a:	83 c2 01             	add    $0x1,%edx
c0101d3d:	c1 e2 0b             	shl    $0xb,%edx
c0101d40:	01 c2                	add    %eax,%edx
c0101d42:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d45:	89 50 08             	mov    %edx,0x8(%eax)
c0101d48:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d4b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101d52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d55:	8d 50 05             	lea    0x5(%eax),%edx
c0101d58:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101d5b:	89 50 10             	mov    %edx,0x10(%eax)
c0101d5e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101d62:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d65:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101d68:	7c a4                	jl     c0101d0e <mkfs+0x3c1>
c0101d6a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d6f:	89 c2                	mov    %eax,%edx
c0101d71:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101d74:	83 c0 03             	add    $0x3,%eax
c0101d77:	83 ec 0c             	sub    $0xc,%esp
c0101d7a:	6a 0a                	push   $0xa
c0101d7c:	68 00 02 00 00       	push   $0x200
c0101d81:	52                   	push   %edx
c0101d82:	6a 20                	push   $0x20
c0101d84:	50                   	push   %eax
c0101d85:	e8 ea fa ff ff       	call   c0101874 <rd_wt>
c0101d8a:	83 c4 20             	add    $0x20,%esp
c0101d8d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d92:	89 c2                	mov    %eax,%edx
c0101d94:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101d97:	83 ec 0c             	sub    $0xc,%esp
c0101d9a:	6a 07                	push   $0x7
c0101d9c:	68 00 02 00 00       	push   $0x200
c0101da1:	52                   	push   %edx
c0101da2:	6a 20                	push   $0x20
c0101da4:	50                   	push   %eax
c0101da5:	e8 ca fa ff ff       	call   c0101874 <rd_wt>
c0101daa:	83 c4 20             	add    $0x20,%esp
c0101dad:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101db4:	00 00 00 
c0101db7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101dbe:	2e 00 
c0101dc0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101dc5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101dc8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101dcb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101dd1:	83 ec 0c             	sub    $0xc,%esp
c0101dd4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101dda:	50                   	push   %eax
c0101ddb:	e8 28 a4 00 00       	call   c010c208 <Strlen>
c0101de0:	83 c4 10             	add    $0x10,%esp
c0101de3:	89 c1                	mov    %eax,%ecx
c0101de5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101de8:	8d 50 04             	lea    0x4(%eax),%edx
c0101deb:	83 ec 04             	sub    $0x4,%esp
c0101dee:	51                   	push   %ecx
c0101def:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101df5:	50                   	push   %eax
c0101df6:	52                   	push   %edx
c0101df7:	e8 f0 4e 00 00       	call   c0106cec <Memcpy>
c0101dfc:	83 c4 10             	add    $0x10,%esp
c0101dff:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101e05:	b8 00 00 00 00       	mov    $0x0,%eax
c0101e0a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101e0f:	89 d7                	mov    %edx,%edi
c0101e11:	f3 ab                	rep stos %eax,%es:(%edi)
c0101e13:	c7 85 34 ff ff ff d0 	movl   $0xc010b3d0,-0xcc(%ebp)
c0101e1a:	b3 10 c0 
c0101e1d:	c7 85 38 ff ff ff d9 	movl   $0xc010b3d9,-0xc8(%ebp)
c0101e24:	b3 10 c0 
c0101e27:	c7 85 3c ff ff ff e2 	movl   $0xc010b3e2,-0xc4(%ebp)
c0101e2e:	b3 10 c0 
c0101e31:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101e38:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101e3f:	eb 49                	jmp    c0101e8a <mkfs+0x53d>
c0101e41:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101e45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e48:	8d 50 02             	lea    0x2(%eax),%edx
c0101e4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e4e:	89 10                	mov    %edx,(%eax)
c0101e50:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e53:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101e5a:	83 ec 0c             	sub    $0xc,%esp
c0101e5d:	50                   	push   %eax
c0101e5e:	e8 a5 a3 00 00       	call   c010c208 <Strlen>
c0101e63:	83 c4 10             	add    $0x10,%esp
c0101e66:	89 c1                	mov    %eax,%ecx
c0101e68:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e6b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101e72:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101e75:	83 c2 04             	add    $0x4,%edx
c0101e78:	83 ec 04             	sub    $0x4,%esp
c0101e7b:	51                   	push   %ecx
c0101e7c:	50                   	push   %eax
c0101e7d:	52                   	push   %edx
c0101e7e:	e8 69 4e 00 00       	call   c0106cec <Memcpy>
c0101e83:	83 c4 10             	add    $0x10,%esp
c0101e86:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101e8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e8d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101e90:	7c af                	jl     c0101e41 <mkfs+0x4f4>
c0101e92:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101e99:	eb 66                	jmp    c0101f01 <mkfs+0x5b4>
c0101e9b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e9e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101ea5:	83 ec 0c             	sub    $0xc,%esp
c0101ea8:	50                   	push   %eax
c0101ea9:	e8 5a a3 00 00       	call   c010c208 <Strlen>
c0101eae:	83 c4 10             	add    $0x10,%esp
c0101eb1:	85 c0                	test   %eax,%eax
c0101eb3:	74 47                	je     c0101efc <mkfs+0x5af>
c0101eb5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101eb9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ebc:	8d 50 05             	lea    0x5(%eax),%edx
c0101ebf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ec2:	89 10                	mov    %edx,(%eax)
c0101ec4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ec7:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101ece:	83 ec 0c             	sub    $0xc,%esp
c0101ed1:	50                   	push   %eax
c0101ed2:	e8 31 a3 00 00       	call   c010c208 <Strlen>
c0101ed7:	83 c4 10             	add    $0x10,%esp
c0101eda:	89 c1                	mov    %eax,%ecx
c0101edc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101edf:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101ee6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101ee9:	83 c2 04             	add    $0x4,%edx
c0101eec:	83 ec 04             	sub    $0x4,%esp
c0101eef:	51                   	push   %ecx
c0101ef0:	50                   	push   %eax
c0101ef1:	52                   	push   %edx
c0101ef2:	e8 f5 4d 00 00       	call   c0106cec <Memcpy>
c0101ef7:	83 c4 10             	add    $0x10,%esp
c0101efa:	eb 01                	jmp    c0101efd <mkfs+0x5b0>
c0101efc:	90                   	nop
c0101efd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101f01:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f04:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101f07:	7c 92                	jl     c0101e9b <mkfs+0x54e>
c0101f09:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101f0e:	89 c2                	mov    %eax,%edx
c0101f10:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101f13:	83 ec 0c             	sub    $0xc,%esp
c0101f16:	6a 0a                	push   $0xa
c0101f18:	68 00 02 00 00       	push   $0x200
c0101f1d:	52                   	push   %edx
c0101f1e:	6a 20                	push   $0x20
c0101f20:	50                   	push   %eax
c0101f21:	e8 4e f9 ff ff       	call   c0101874 <rd_wt>
c0101f26:	83 c4 20             	add    $0x20,%esp
c0101f29:	90                   	nop
c0101f2a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101f2d:	c9                   	leave  
c0101f2e:	c3                   	ret    

c0101f2f <init_fs>:
c0101f2f:	55                   	push   %ebp
c0101f30:	89 e5                	mov    %esp,%ebp
c0101f32:	83 ec 18             	sub    $0x18,%esp
c0101f35:	83 ec 0c             	sub    $0xc,%esp
c0101f38:	6a 7c                	push   $0x7c
c0101f3a:	e8 fd f6 ff ff       	call   c010163c <sys_malloc>
c0101f3f:	83 c4 10             	add    $0x10,%esp
c0101f42:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101f45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f48:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101f4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f52:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101f59:	83 ec 04             	sub    $0x4,%esp
c0101f5c:	6a 03                	push   $0x3
c0101f5e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101f61:	6a 03                	push   $0x3
c0101f63:	e8 0d 76 00 00       	call   c0109575 <send_rec>
c0101f68:	83 c4 10             	add    $0x10,%esp
c0101f6b:	e8 dd f9 ff ff       	call   c010194d <mkfs>
c0101f70:	83 ec 08             	sub    $0x8,%esp
c0101f73:	6a 7c                	push   $0x7c
c0101f75:	ff 75 f4             	pushl  -0xc(%ebp)
c0101f78:	e8 d4 f6 ff ff       	call   c0101651 <sys_free>
c0101f7d:	83 c4 10             	add    $0x10,%esp
c0101f80:	90                   	nop
c0101f81:	c9                   	leave  
c0101f82:	c3                   	ret    

c0101f83 <do_open>:
c0101f83:	55                   	push   %ebp
c0101f84:	89 e5                	mov    %esp,%ebp
c0101f86:	83 ec 68             	sub    $0x68,%esp
c0101f89:	83 ec 04             	sub    $0x4,%esp
c0101f8c:	6a 0c                	push   $0xc
c0101f8e:	6a 00                	push   $0x0
c0101f90:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f93:	50                   	push   %eax
c0101f94:	e8 36 a2 00 00       	call   c010c1cf <Memset>
c0101f99:	83 c4 10             	add    $0x10,%esp
c0101f9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f9f:	8b 40 44             	mov    0x44(%eax),%eax
c0101fa2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101fa5:	83 ec 08             	sub    $0x8,%esp
c0101fa8:	6a 0c                	push   $0xc
c0101faa:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101fad:	e8 cd 3e 00 00       	call   c0105e7f <alloc_virtual_memory>
c0101fb2:	83 c4 10             	add    $0x10,%esp
c0101fb5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101fb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fbb:	8b 40 40             	mov    0x40(%eax),%eax
c0101fbe:	89 c2                	mov    %eax,%edx
c0101fc0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101fc3:	83 ec 04             	sub    $0x4,%esp
c0101fc6:	52                   	push   %edx
c0101fc7:	50                   	push   %eax
c0101fc8:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101fcb:	50                   	push   %eax
c0101fcc:	e8 1b 4d 00 00       	call   c0106cec <Memcpy>
c0101fd1:	83 c4 10             	add    $0x10,%esp
c0101fd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fd7:	8b 40 40             	mov    0x40(%eax),%eax
c0101fda:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0101fdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fe2:	8b 40 74             	mov    0x74(%eax),%eax
c0101fe5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101fe8:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0101fef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101ff6:	eb 1f                	jmp    c0102017 <do_open+0x94>
c0101ff8:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101ffd:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102000:	83 c2 4c             	add    $0x4c,%edx
c0102003:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0102007:	85 c0                	test   %eax,%eax
c0102009:	75 08                	jne    c0102013 <do_open+0x90>
c010200b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010200e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102011:	eb 0a                	jmp    c010201d <do_open+0x9a>
c0102013:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102017:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c010201b:	7e db                	jle    c0101ff8 <do_open+0x75>
c010201d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0102021:	75 1c                	jne    c010203f <do_open+0xbc>
c0102023:	68 c6 01 00 00       	push   $0x1c6
c0102028:	68 f8 b2 10 c0       	push   $0xc010b2f8
c010202d:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102032:	68 eb b3 10 c0       	push   $0xc010b3eb
c0102037:	e8 c9 68 00 00       	call   c0108905 <assertion_failure>
c010203c:	83 c4 10             	add    $0x10,%esp
c010203f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0102046:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010204d:	eb 1d                	jmp    c010206c <do_open+0xe9>
c010204f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102052:	c1 e0 04             	shl    $0x4,%eax
c0102055:	05 88 13 11 c0       	add    $0xc0111388,%eax
c010205a:	8b 00                	mov    (%eax),%eax
c010205c:	85 c0                	test   %eax,%eax
c010205e:	75 08                	jne    c0102068 <do_open+0xe5>
c0102060:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102063:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102066:	eb 0a                	jmp    c0102072 <do_open+0xef>
c0102068:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010206c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0102070:	7e dd                	jle    c010204f <do_open+0xcc>
c0102072:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0102076:	75 1c                	jne    c0102094 <do_open+0x111>
c0102078:	68 d2 01 00 00       	push   $0x1d2
c010207d:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102082:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102087:	68 f3 b3 10 c0       	push   $0xc010b3f3
c010208c:	e8 74 68 00 00       	call   c0108905 <assertion_failure>
c0102091:	83 c4 10             	add    $0x10,%esp
c0102094:	83 ec 0c             	sub    $0xc,%esp
c0102097:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010209a:	50                   	push   %eax
c010209b:	e8 d2 00 00 00       	call   c0102172 <search_file>
c01020a0:	83 c4 10             	add    $0x10,%esp
c01020a3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01020a6:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01020aa:	75 2b                	jne    c01020d7 <do_open+0x154>
c01020ac:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c01020b0:	7e 10                	jle    c01020c2 <do_open+0x13f>
c01020b2:	83 ec 0c             	sub    $0xc,%esp
c01020b5:	68 fb b3 10 c0       	push   $0xc010b3fb
c01020ba:	e8 28 68 00 00       	call   c01088e7 <panic>
c01020bf:	83 c4 10             	add    $0x10,%esp
c01020c2:	83 ec 08             	sub    $0x8,%esp
c01020c5:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c01020c8:	50                   	push   %eax
c01020c9:	8d 45 9c             	lea    -0x64(%ebp),%eax
c01020cc:	50                   	push   %eax
c01020cd:	e8 60 04 00 00       	call   c0102532 <create_file>
c01020d2:	83 c4 10             	add    $0x10,%esp
c01020d5:	eb 25                	jmp    c01020fc <do_open+0x179>
c01020d7:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c01020db:	75 0a                	jne    c01020e7 <do_open+0x164>
c01020dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01020e2:	e9 89 00 00 00       	jmp    c0102170 <do_open+0x1ed>
c01020e7:	83 ec 08             	sub    $0x8,%esp
c01020ea:	ff 75 d8             	pushl  -0x28(%ebp)
c01020ed:	8d 45 9c             	lea    -0x64(%ebp),%eax
c01020f0:	50                   	push   %eax
c01020f1:	e8 7a 02 00 00       	call   c0102370 <get_inode>
c01020f6:	83 c4 10             	add    $0x10,%esp
c01020f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01020fc:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0102101:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102104:	c1 e2 04             	shl    $0x4,%edx
c0102107:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010210d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102110:	83 c2 4c             	add    $0x4c,%edx
c0102113:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102117:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010211a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010211d:	c1 e2 04             	shl    $0x4,%edx
c0102120:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102126:	89 02                	mov    %eax,(%edx)
c0102128:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010212b:	c1 e0 04             	shl    $0x4,%eax
c010212e:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102133:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102139:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010213c:	c1 e0 04             	shl    $0x4,%eax
c010213f:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102144:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010214a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010214d:	c1 e0 04             	shl    $0x4,%eax
c0102150:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102155:	8b 00                	mov    (%eax),%eax
c0102157:	8d 50 01             	lea    0x1(%eax),%edx
c010215a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010215d:	c1 e0 04             	shl    $0x4,%eax
c0102160:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102165:	89 10                	mov    %edx,(%eax)
c0102167:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010216a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010216d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102170:	c9                   	leave  
c0102171:	c3                   	ret    

c0102172 <search_file>:
c0102172:	55                   	push   %ebp
c0102173:	89 e5                	mov    %esp,%ebp
c0102175:	83 ec 68             	sub    $0x68,%esp
c0102178:	83 ec 04             	sub    $0x4,%esp
c010217b:	6a 0c                	push   $0xc
c010217d:	6a 00                	push   $0x0
c010217f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102182:	50                   	push   %eax
c0102183:	e8 47 a0 00 00       	call   c010c1cf <Memset>
c0102188:	83 c4 10             	add    $0x10,%esp
c010218b:	83 ec 04             	sub    $0x4,%esp
c010218e:	6a 28                	push   $0x28
c0102190:	6a 00                	push   $0x0
c0102192:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102195:	50                   	push   %eax
c0102196:	e8 34 a0 00 00       	call   c010c1cf <Memset>
c010219b:	83 c4 10             	add    $0x10,%esp
c010219e:	83 ec 04             	sub    $0x4,%esp
c01021a1:	8d 45 98             	lea    -0x68(%ebp),%eax
c01021a4:	50                   	push   %eax
c01021a5:	ff 75 08             	pushl  0x8(%ebp)
c01021a8:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01021ab:	50                   	push   %eax
c01021ac:	e8 f3 00 00 00       	call   c01022a4 <strip_path>
c01021b1:	83 c4 10             	add    $0x10,%esp
c01021b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01021b7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c01021bb:	75 0a                	jne    c01021c7 <search_file+0x55>
c01021bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01021c2:	e9 db 00 00 00       	jmp    c01022a2 <search_file+0x130>
c01021c7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01021ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01021cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01021d0:	05 00 02 00 00       	add    $0x200,%eax
c01021d5:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01021db:	85 c0                	test   %eax,%eax
c01021dd:	0f 48 c2             	cmovs  %edx,%eax
c01021e0:	c1 f8 09             	sar    $0x9,%eax
c01021e3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01021e6:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01021e9:	c1 e8 04             	shr    $0x4,%eax
c01021ec:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01021ef:	e8 5c 14 00 00       	call   c0103650 <get_super_block>
c01021f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01021f7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01021fa:	8b 00                	mov    (%eax),%eax
c01021fc:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01021ff:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102206:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010220d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102214:	eb 7b                	jmp    c0102291 <search_file+0x11f>
c0102216:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010221b:	89 c1                	mov    %eax,%ecx
c010221d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102220:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102223:	01 d0                	add    %edx,%eax
c0102225:	83 ec 0c             	sub    $0xc,%esp
c0102228:	6a 07                	push   $0x7
c010222a:	68 00 02 00 00       	push   $0x200
c010222f:	51                   	push   %ecx
c0102230:	ff 75 cc             	pushl  -0x34(%ebp)
c0102233:	50                   	push   %eax
c0102234:	e8 3b f6 ff ff       	call   c0101874 <rd_wt>
c0102239:	83 c4 20             	add    $0x20,%esp
c010223c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102241:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102244:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010224b:	eb 35                	jmp    c0102282 <search_file+0x110>
c010224d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102251:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102254:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102257:	7f 33                	jg     c010228c <search_file+0x11a>
c0102259:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010225c:	83 c0 04             	add    $0x4,%eax
c010225f:	83 ec 08             	sub    $0x8,%esp
c0102262:	50                   	push   %eax
c0102263:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102266:	50                   	push   %eax
c0102267:	e8 70 76 00 00       	call   c01098dc <strcmp>
c010226c:	83 c4 10             	add    $0x10,%esp
c010226f:	85 c0                	test   %eax,%eax
c0102271:	75 07                	jne    c010227a <search_file+0x108>
c0102273:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102276:	8b 00                	mov    (%eax),%eax
c0102278:	eb 28                	jmp    c01022a2 <search_file+0x130>
c010227a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010227e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0102282:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102285:	83 f8 1f             	cmp    $0x1f,%eax
c0102288:	76 c3                	jbe    c010224d <search_file+0xdb>
c010228a:	eb 01                	jmp    c010228d <search_file+0x11b>
c010228c:	90                   	nop
c010228d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102291:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102294:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102297:	0f 8c 79 ff ff ff    	jl     c0102216 <search_file+0xa4>
c010229d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022a2:	c9                   	leave  
c01022a3:	c3                   	ret    

c01022a4 <strip_path>:
c01022a4:	55                   	push   %ebp
c01022a5:	89 e5                	mov    %esp,%ebp
c01022a7:	83 ec 10             	sub    $0x10,%esp
c01022aa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01022ae:	75 0a                	jne    c01022ba <strip_path+0x16>
c01022b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022b5:	e9 b4 00 00 00       	jmp    c010236e <strip_path+0xca>
c01022ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01022bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01022c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022c3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01022c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01022c9:	0f b6 00             	movzbl (%eax),%eax
c01022cc:	3c 2f                	cmp    $0x2f,%al
c01022ce:	75 2d                	jne    c01022fd <strip_path+0x59>
c01022d0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01022d4:	eb 27                	jmp    c01022fd <strip_path+0x59>
c01022d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01022d9:	0f b6 00             	movzbl (%eax),%eax
c01022dc:	3c 2f                	cmp    $0x2f,%al
c01022de:	75 0a                	jne    c01022ea <strip_path+0x46>
c01022e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01022e5:	e9 84 00 00 00       	jmp    c010236e <strip_path+0xca>
c01022ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01022ed:	0f b6 10             	movzbl (%eax),%edx
c01022f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01022f3:	88 10                	mov    %dl,(%eax)
c01022f5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01022f9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01022fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102300:	0f b6 00             	movzbl (%eax),%eax
c0102303:	84 c0                	test   %al,%al
c0102305:	75 cf                	jne    c01022d6 <strip_path+0x32>
c0102307:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010230a:	c6 00 00             	movb   $0x0,(%eax)
c010230d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102310:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102316:	89 10                	mov    %edx,(%eax)
c0102318:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010231e:	89 50 04             	mov    %edx,0x4(%eax)
c0102321:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102327:	89 50 08             	mov    %edx,0x8(%eax)
c010232a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102330:	89 50 0c             	mov    %edx,0xc(%eax)
c0102333:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102339:	89 50 10             	mov    %edx,0x10(%eax)
c010233c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102342:	89 50 14             	mov    %edx,0x14(%eax)
c0102345:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010234b:	89 50 18             	mov    %edx,0x18(%eax)
c010234e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102354:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102357:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010235d:	89 50 20             	mov    %edx,0x20(%eax)
c0102360:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102366:	89 50 24             	mov    %edx,0x24(%eax)
c0102369:	b8 00 00 00 00       	mov    $0x0,%eax
c010236e:	c9                   	leave  
c010236f:	c3                   	ret    

c0102370 <get_inode>:
c0102370:	55                   	push   %ebp
c0102371:	89 e5                	mov    %esp,%ebp
c0102373:	56                   	push   %esi
c0102374:	53                   	push   %ebx
c0102375:	83 ec 20             	sub    $0x20,%esp
c0102378:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010237c:	75 0a                	jne    c0102388 <get_inode+0x18>
c010237e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102383:	e9 a3 01 00 00       	jmp    c010252b <get_inode+0x1bb>
c0102388:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010238f:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102396:	eb 69                	jmp    c0102401 <get_inode+0x91>
c0102398:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010239b:	8b 40 24             	mov    0x24(%eax),%eax
c010239e:	85 c0                	test   %eax,%eax
c01023a0:	7e 53                	jle    c01023f5 <get_inode+0x85>
c01023a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023a5:	8b 40 10             	mov    0x10(%eax),%eax
c01023a8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01023ab:	75 50                	jne    c01023fd <get_inode+0x8d>
c01023ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01023b0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01023b3:	8b 0a                	mov    (%edx),%ecx
c01023b5:	89 08                	mov    %ecx,(%eax)
c01023b7:	8b 4a 04             	mov    0x4(%edx),%ecx
c01023ba:	89 48 04             	mov    %ecx,0x4(%eax)
c01023bd:	8b 4a 08             	mov    0x8(%edx),%ecx
c01023c0:	89 48 08             	mov    %ecx,0x8(%eax)
c01023c3:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01023c6:	89 48 0c             	mov    %ecx,0xc(%eax)
c01023c9:	8b 4a 10             	mov    0x10(%edx),%ecx
c01023cc:	89 48 10             	mov    %ecx,0x10(%eax)
c01023cf:	8b 4a 14             	mov    0x14(%edx),%ecx
c01023d2:	89 48 14             	mov    %ecx,0x14(%eax)
c01023d5:	8b 4a 18             	mov    0x18(%edx),%ecx
c01023d8:	89 48 18             	mov    %ecx,0x18(%eax)
c01023db:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01023de:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01023e1:	8b 4a 20             	mov    0x20(%edx),%ecx
c01023e4:	89 48 20             	mov    %ecx,0x20(%eax)
c01023e7:	8b 52 24             	mov    0x24(%edx),%edx
c01023ea:	89 50 24             	mov    %edx,0x24(%eax)
c01023ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023f0:	e9 36 01 00 00       	jmp    c010252b <get_inode+0x1bb>
c01023f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01023fb:	eb 0d                	jmp    c010240a <get_inode+0x9a>
c01023fd:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102401:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102408:	76 8e                	jbe    c0102398 <get_inode+0x28>
c010240a:	e8 41 12 00 00       	call   c0103650 <get_super_block>
c010240f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102412:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102419:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010241c:	8b 40 04             	mov    0x4(%eax),%eax
c010241f:	8d 50 02             	lea    0x2(%eax),%edx
c0102422:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102425:	8b 40 08             	mov    0x8(%eax),%eax
c0102428:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010242b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010242e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102431:	b8 00 02 00 00       	mov    $0x200,%eax
c0102436:	99                   	cltd   
c0102437:	f7 7d e8             	idivl  -0x18(%ebp)
c010243a:	89 c6                	mov    %eax,%esi
c010243c:	89 c8                	mov    %ecx,%eax
c010243e:	99                   	cltd   
c010243f:	f7 fe                	idiv   %esi
c0102441:	01 d8                	add    %ebx,%eax
c0102443:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102446:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010244d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102452:	83 ec 0c             	sub    $0xc,%esp
c0102455:	6a 07                	push   $0x7
c0102457:	68 00 02 00 00       	push   $0x200
c010245c:	50                   	push   %eax
c010245d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102460:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102463:	e8 0c f4 ff ff       	call   c0101874 <rd_wt>
c0102468:	83 c4 20             	add    $0x20,%esp
c010246b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010246e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102471:	b8 00 02 00 00       	mov    $0x200,%eax
c0102476:	99                   	cltd   
c0102477:	f7 7d e8             	idivl  -0x18(%ebp)
c010247a:	89 c3                	mov    %eax,%ebx
c010247c:	89 c8                	mov    %ecx,%eax
c010247e:	99                   	cltd   
c010247f:	f7 fb                	idiv   %ebx
c0102481:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0102484:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010248a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010248d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102491:	01 d0                	add    %edx,%eax
c0102493:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102496:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102499:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010249c:	8b 0a                	mov    (%edx),%ecx
c010249e:	89 08                	mov    %ecx,(%eax)
c01024a0:	8b 4a 04             	mov    0x4(%edx),%ecx
c01024a3:	89 48 04             	mov    %ecx,0x4(%eax)
c01024a6:	8b 4a 08             	mov    0x8(%edx),%ecx
c01024a9:	89 48 08             	mov    %ecx,0x8(%eax)
c01024ac:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01024af:	89 48 0c             	mov    %ecx,0xc(%eax)
c01024b2:	8b 4a 10             	mov    0x10(%edx),%ecx
c01024b5:	89 48 10             	mov    %ecx,0x10(%eax)
c01024b8:	8b 4a 14             	mov    0x14(%edx),%ecx
c01024bb:	89 48 14             	mov    %ecx,0x14(%eax)
c01024be:	8b 4a 18             	mov    0x18(%edx),%ecx
c01024c1:	89 48 18             	mov    %ecx,0x18(%eax)
c01024c4:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01024c7:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01024ca:	8b 4a 20             	mov    0x20(%edx),%ecx
c01024cd:	89 48 20             	mov    %ecx,0x20(%eax)
c01024d0:	8b 52 24             	mov    0x24(%edx),%edx
c01024d3:	89 50 24             	mov    %edx,0x24(%eax)
c01024d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024d9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01024dc:	89 50 10             	mov    %edx,0x10(%eax)
c01024df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024e2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01024e5:	89 50 20             	mov    %edx,0x20(%eax)
c01024e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01024eb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01024ee:	8b 0a                	mov    (%edx),%ecx
c01024f0:	89 08                	mov    %ecx,(%eax)
c01024f2:	8b 4a 04             	mov    0x4(%edx),%ecx
c01024f5:	89 48 04             	mov    %ecx,0x4(%eax)
c01024f8:	8b 4a 08             	mov    0x8(%edx),%ecx
c01024fb:	89 48 08             	mov    %ecx,0x8(%eax)
c01024fe:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102501:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102504:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102507:	89 48 10             	mov    %ecx,0x10(%eax)
c010250a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010250d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102510:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102513:	89 48 18             	mov    %ecx,0x18(%eax)
c0102516:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102519:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010251c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010251f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102522:	8b 52 24             	mov    0x24(%edx),%edx
c0102525:	89 50 24             	mov    %edx,0x24(%eax)
c0102528:	8b 45 08             	mov    0x8(%ebp),%eax
c010252b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010252e:	5b                   	pop    %ebx
c010252f:	5e                   	pop    %esi
c0102530:	5d                   	pop    %ebp
c0102531:	c3                   	ret    

c0102532 <create_file>:
c0102532:	55                   	push   %ebp
c0102533:	89 e5                	mov    %esp,%ebp
c0102535:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010253b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010253e:	50                   	push   %eax
c010253f:	ff 75 0c             	pushl  0xc(%ebp)
c0102542:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102545:	50                   	push   %eax
c0102546:	e8 59 fd ff ff       	call   c01022a4 <strip_path>
c010254b:	83 c4 0c             	add    $0xc,%esp
c010254e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102551:	75 0a                	jne    c010255d <create_file+0x2b>
c0102553:	b8 00 00 00 00       	mov    $0x0,%eax
c0102558:	e9 de 00 00 00       	jmp    c010263b <create_file+0x109>
c010255d:	e8 db 00 00 00       	call   c010263d <alloc_imap_bit>
c0102562:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102565:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102569:	75 0a                	jne    c0102575 <create_file+0x43>
c010256b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102570:	e9 c6 00 00 00       	jmp    c010263b <create_file+0x109>
c0102575:	e8 d6 10 00 00       	call   c0103650 <get_super_block>
c010257a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010257d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102580:	8b 40 10             	mov    0x10(%eax),%eax
c0102583:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102586:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102589:	83 ec 08             	sub    $0x8,%esp
c010258c:	50                   	push   %eax
c010258d:	ff 75 f4             	pushl  -0xc(%ebp)
c0102590:	e8 a5 01 00 00       	call   c010273a <alloc_smap_bit>
c0102595:	83 c4 10             	add    $0x10,%esp
c0102598:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010259b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010259f:	75 0a                	jne    c01025ab <create_file+0x79>
c01025a1:	b8 00 00 00 00       	mov    $0x0,%eax
c01025a6:	e9 90 00 00 00       	jmp    c010263b <create_file+0x109>
c01025ab:	83 ec 04             	sub    $0x4,%esp
c01025ae:	ff 75 e8             	pushl  -0x18(%ebp)
c01025b1:	ff 75 f4             	pushl  -0xc(%ebp)
c01025b4:	8d 45 84             	lea    -0x7c(%ebp),%eax
c01025b7:	50                   	push   %eax
c01025b8:	e8 1e 03 00 00       	call   c01028db <new_inode>
c01025bd:	83 c4 10             	add    $0x10,%esp
c01025c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01025c3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01025c7:	75 07                	jne    c01025d0 <create_file+0x9e>
c01025c9:	b8 00 00 00 00       	mov    $0x0,%eax
c01025ce:	eb 6b                	jmp    c010263b <create_file+0x109>
c01025d0:	ff 75 f4             	pushl  -0xc(%ebp)
c01025d3:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01025d6:	50                   	push   %eax
c01025d7:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01025da:	50                   	push   %eax
c01025db:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01025e1:	50                   	push   %eax
c01025e2:	e8 12 04 00 00       	call   c01029f9 <new_dir_entry>
c01025e7:	83 c4 10             	add    $0x10,%esp
c01025ea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01025ed:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01025f1:	75 07                	jne    c01025fa <create_file+0xc8>
c01025f3:	b8 00 00 00 00       	mov    $0x0,%eax
c01025f8:	eb 41                	jmp    c010263b <create_file+0x109>
c01025fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01025fd:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102600:	89 10                	mov    %edx,(%eax)
c0102602:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102605:	89 50 04             	mov    %edx,0x4(%eax)
c0102608:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010260b:	89 50 08             	mov    %edx,0x8(%eax)
c010260e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102611:	89 50 0c             	mov    %edx,0xc(%eax)
c0102614:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102617:	89 50 10             	mov    %edx,0x10(%eax)
c010261a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010261d:	89 50 14             	mov    %edx,0x14(%eax)
c0102620:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102623:	89 50 18             	mov    %edx,0x18(%eax)
c0102626:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102629:	89 50 1c             	mov    %edx,0x1c(%eax)
c010262c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010262f:	89 50 20             	mov    %edx,0x20(%eax)
c0102632:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102635:	89 50 24             	mov    %edx,0x24(%eax)
c0102638:	8b 45 08             	mov    0x8(%ebp),%eax
c010263b:	c9                   	leave  
c010263c:	c3                   	ret    

c010263d <alloc_imap_bit>:
c010263d:	55                   	push   %ebp
c010263e:	89 e5                	mov    %esp,%ebp
c0102640:	53                   	push   %ebx
c0102641:	83 ec 24             	sub    $0x24,%esp
c0102644:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010264b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102652:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102657:	83 ec 0c             	sub    $0xc,%esp
c010265a:	6a 07                	push   $0x7
c010265c:	68 00 02 00 00       	push   $0x200
c0102661:	50                   	push   %eax
c0102662:	ff 75 e8             	pushl  -0x18(%ebp)
c0102665:	ff 75 ec             	pushl  -0x14(%ebp)
c0102668:	e8 07 f2 ff ff       	call   c0101874 <rd_wt>
c010266d:	83 c4 20             	add    $0x20,%esp
c0102670:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102677:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010267e:	e9 a5 00 00 00       	jmp    c0102728 <alloc_imap_bit+0xeb>
c0102683:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010268a:	e9 8b 00 00 00       	jmp    c010271a <alloc_imap_bit+0xdd>
c010268f:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102695:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102698:	01 d0                	add    %edx,%eax
c010269a:	0f b6 00             	movzbl (%eax),%eax
c010269d:	0f be d0             	movsbl %al,%edx
c01026a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026a3:	89 c1                	mov    %eax,%ecx
c01026a5:	d3 fa                	sar    %cl,%edx
c01026a7:	89 d0                	mov    %edx,%eax
c01026a9:	83 e0 01             	and    $0x1,%eax
c01026ac:	85 c0                	test   %eax,%eax
c01026ae:	74 06                	je     c01026b6 <alloc_imap_bit+0x79>
c01026b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01026b4:	eb 64                	jmp    c010271a <alloc_imap_bit+0xdd>
c01026b6:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026bf:	01 d0                	add    %edx,%eax
c01026c1:	0f b6 18             	movzbl (%eax),%ebx
c01026c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026c7:	ba 01 00 00 00       	mov    $0x1,%edx
c01026cc:	89 c1                	mov    %eax,%ecx
c01026ce:	d3 e2                	shl    %cl,%edx
c01026d0:	89 d0                	mov    %edx,%eax
c01026d2:	89 c1                	mov    %eax,%ecx
c01026d4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026dd:	01 d0                	add    %edx,%eax
c01026df:	09 cb                	or     %ecx,%ebx
c01026e1:	89 da                	mov    %ebx,%edx
c01026e3:	88 10                	mov    %dl,(%eax)
c01026e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026e8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01026ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026f2:	01 d0                	add    %edx,%eax
c01026f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01026f7:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01026fc:	83 ec 0c             	sub    $0xc,%esp
c01026ff:	6a 0a                	push   $0xa
c0102701:	68 00 02 00 00       	push   $0x200
c0102706:	50                   	push   %eax
c0102707:	ff 75 e8             	pushl  -0x18(%ebp)
c010270a:	ff 75 ec             	pushl  -0x14(%ebp)
c010270d:	e8 62 f1 ff ff       	call   c0101874 <rd_wt>
c0102712:	83 c4 20             	add    $0x20,%esp
c0102715:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102718:	eb 1b                	jmp    c0102735 <alloc_imap_bit+0xf8>
c010271a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010271e:	0f 8e 6b ff ff ff    	jle    c010268f <alloc_imap_bit+0x52>
c0102724:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102728:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010272f:	0f 8e 4e ff ff ff    	jle    c0102683 <alloc_imap_bit+0x46>
c0102735:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102738:	c9                   	leave  
c0102739:	c3                   	ret    

c010273a <alloc_smap_bit>:
c010273a:	55                   	push   %ebp
c010273b:	89 e5                	mov    %esp,%ebp
c010273d:	53                   	push   %ebx
c010273e:	83 ec 34             	sub    $0x34,%esp
c0102741:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102745:	75 1c                	jne    c0102763 <alloc_smap_bit+0x29>
c0102747:	68 fd 02 00 00       	push   $0x2fd
c010274c:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102751:	68 f8 b2 10 c0       	push   $0xc010b2f8
c0102756:	68 08 b4 10 c0       	push   $0xc010b408
c010275b:	e8 a5 61 00 00       	call   c0108905 <assertion_failure>
c0102760:	83 c4 10             	add    $0x10,%esp
c0102763:	e8 e8 0e 00 00       	call   c0103650 <get_super_block>
c0102768:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010276b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010276e:	8b 40 08             	mov    0x8(%eax),%eax
c0102771:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102774:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102777:	8b 40 04             	mov    0x4(%eax),%eax
c010277a:	83 c0 02             	add    $0x2,%eax
c010277d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102780:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102787:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c010278e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102795:	e9 20 01 00 00       	jmp    c01028ba <alloc_smap_bit+0x180>
c010279a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010279d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027a0:	01 d0                	add    %edx,%eax
c01027a2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01027a5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01027aa:	83 ec 0c             	sub    $0xc,%esp
c01027ad:	6a 07                	push   $0x7
c01027af:	68 00 02 00 00       	push   $0x200
c01027b4:	50                   	push   %eax
c01027b5:	ff 75 d8             	pushl  -0x28(%ebp)
c01027b8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01027bb:	e8 b4 f0 ff ff       	call   c0101874 <rd_wt>
c01027c0:	83 c4 20             	add    $0x20,%esp
c01027c3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01027ca:	e9 b0 00 00 00       	jmp    c010287f <alloc_smap_bit+0x145>
c01027cf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01027d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01027da:	0f 85 8c 00 00 00    	jne    c010286c <alloc_smap_bit+0x132>
c01027e0:	eb 45                	jmp    c0102827 <alloc_smap_bit+0xed>
c01027e2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01027e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027eb:	01 d0                	add    %edx,%eax
c01027ed:	0f b6 00             	movzbl (%eax),%eax
c01027f0:	0f be d0             	movsbl %al,%edx
c01027f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01027f6:	89 c1                	mov    %eax,%ecx
c01027f8:	d3 fa                	sar    %cl,%edx
c01027fa:	89 d0                	mov    %edx,%eax
c01027fc:	83 e0 01             	and    $0x1,%eax
c01027ff:	85 c0                	test   %eax,%eax
c0102801:	74 06                	je     c0102809 <alloc_smap_bit+0xcf>
c0102803:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102807:	eb 1e                	jmp    c0102827 <alloc_smap_bit+0xed>
c0102809:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010280c:	c1 e0 09             	shl    $0x9,%eax
c010280f:	89 c2                	mov    %eax,%edx
c0102811:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102814:	01 d0                	add    %edx,%eax
c0102816:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010281d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102820:	01 d0                	add    %edx,%eax
c0102822:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102825:	eb 06                	jmp    c010282d <alloc_smap_bit+0xf3>
c0102827:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010282b:	7e b5                	jle    c01027e2 <alloc_smap_bit+0xa8>
c010282d:	eb 3d                	jmp    c010286c <alloc_smap_bit+0x132>
c010282f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102833:	74 45                	je     c010287a <alloc_smap_bit+0x140>
c0102835:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010283b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010283e:	01 d0                	add    %edx,%eax
c0102840:	0f b6 18             	movzbl (%eax),%ebx
c0102843:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102846:	ba 01 00 00 00       	mov    $0x1,%edx
c010284b:	89 c1                	mov    %eax,%ecx
c010284d:	d3 e2                	shl    %cl,%edx
c010284f:	89 d0                	mov    %edx,%eax
c0102851:	89 c1                	mov    %eax,%ecx
c0102853:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102859:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010285c:	01 d0                	add    %edx,%eax
c010285e:	09 cb                	or     %ecx,%ebx
c0102860:	89 da                	mov    %ebx,%edx
c0102862:	88 10                	mov    %dl,(%eax)
c0102864:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102868:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010286c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102870:	74 09                	je     c010287b <alloc_smap_bit+0x141>
c0102872:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102876:	7e b7                	jle    c010282f <alloc_smap_bit+0xf5>
c0102878:	eb 01                	jmp    c010287b <alloc_smap_bit+0x141>
c010287a:	90                   	nop
c010287b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010287f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102886:	0f 8e 43 ff ff ff    	jle    c01027cf <alloc_smap_bit+0x95>
c010288c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102890:	74 1e                	je     c01028b0 <alloc_smap_bit+0x176>
c0102892:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102897:	83 ec 0c             	sub    $0xc,%esp
c010289a:	6a 0a                	push   $0xa
c010289c:	68 00 02 00 00       	push   $0x200
c01028a1:	50                   	push   %eax
c01028a2:	ff 75 d8             	pushl  -0x28(%ebp)
c01028a5:	ff 75 d4             	pushl  -0x2c(%ebp)
c01028a8:	e8 c7 ef ff ff       	call   c0101874 <rd_wt>
c01028ad:	83 c4 20             	add    $0x20,%esp
c01028b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01028b4:	74 12                	je     c01028c8 <alloc_smap_bit+0x18e>
c01028b6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01028ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028bd:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01028c0:	0f 8c d4 fe ff ff    	jl     c010279a <alloc_smap_bit+0x60>
c01028c6:	eb 01                	jmp    c01028c9 <alloc_smap_bit+0x18f>
c01028c8:	90                   	nop
c01028c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01028cc:	8d 50 ff             	lea    -0x1(%eax),%edx
c01028cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01028d2:	8b 00                	mov    (%eax),%eax
c01028d4:	01 d0                	add    %edx,%eax
c01028d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01028d9:	c9                   	leave  
c01028da:	c3                   	ret    

c01028db <new_inode>:
c01028db:	55                   	push   %ebp
c01028dc:	89 e5                	mov    %esp,%ebp
c01028de:	83 ec 38             	sub    $0x38,%esp
c01028e1:	83 ec 08             	sub    $0x8,%esp
c01028e4:	ff 75 0c             	pushl  0xc(%ebp)
c01028e7:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01028ea:	50                   	push   %eax
c01028eb:	e8 80 fa ff ff       	call   c0102370 <get_inode>
c01028f0:	83 c4 10             	add    $0x10,%esp
c01028f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01028f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01028fa:	75 0a                	jne    c0102906 <new_inode+0x2b>
c01028fc:	b8 00 00 00 00       	mov    $0x0,%eax
c0102901:	e9 f1 00 00 00       	jmp    c01029f7 <new_inode+0x11c>
c0102906:	8b 45 10             	mov    0x10(%ebp),%eax
c0102909:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010290c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102913:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010291a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102921:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102924:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102927:	83 ec 0c             	sub    $0xc,%esp
c010292a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010292d:	50                   	push   %eax
c010292e:	e8 39 0b 00 00       	call   c010346c <sync_inode>
c0102933:	83 c4 10             	add    $0x10,%esp
c0102936:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010293d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102944:	eb 1d                	jmp    c0102963 <new_inode+0x88>
c0102946:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102949:	89 d0                	mov    %edx,%eax
c010294b:	c1 e0 02             	shl    $0x2,%eax
c010294e:	01 d0                	add    %edx,%eax
c0102950:	c1 e0 03             	shl    $0x3,%eax
c0102953:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102958:	8b 00                	mov    (%eax),%eax
c010295a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010295d:	74 0c                	je     c010296b <new_inode+0x90>
c010295f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102963:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102967:	7e dd                	jle    c0102946 <new_inode+0x6b>
c0102969:	eb 01                	jmp    c010296c <new_inode+0x91>
c010296b:	90                   	nop
c010296c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010296f:	89 d0                	mov    %edx,%eax
c0102971:	c1 e0 02             	shl    $0x2,%eax
c0102974:	01 d0                	add    %edx,%eax
c0102976:	c1 e0 03             	shl    $0x3,%eax
c0102979:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c010297e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102981:	89 10                	mov    %edx,(%eax)
c0102983:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102986:	89 50 04             	mov    %edx,0x4(%eax)
c0102989:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010298c:	89 50 08             	mov    %edx,0x8(%eax)
c010298f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102992:	89 50 0c             	mov    %edx,0xc(%eax)
c0102995:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102998:	89 50 10             	mov    %edx,0x10(%eax)
c010299b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010299e:	89 50 14             	mov    %edx,0x14(%eax)
c01029a1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01029a4:	89 50 18             	mov    %edx,0x18(%eax)
c01029a7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01029aa:	89 50 1c             	mov    %edx,0x1c(%eax)
c01029ad:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01029b0:	89 50 20             	mov    %edx,0x20(%eax)
c01029b3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01029b6:	89 50 24             	mov    %edx,0x24(%eax)
c01029b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01029bc:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01029bf:	89 10                	mov    %edx,(%eax)
c01029c1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01029c4:	89 50 04             	mov    %edx,0x4(%eax)
c01029c7:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01029ca:	89 50 08             	mov    %edx,0x8(%eax)
c01029cd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01029d0:	89 50 0c             	mov    %edx,0xc(%eax)
c01029d3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01029d6:	89 50 10             	mov    %edx,0x10(%eax)
c01029d9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01029dc:	89 50 14             	mov    %edx,0x14(%eax)
c01029df:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01029e2:	89 50 18             	mov    %edx,0x18(%eax)
c01029e5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01029e8:	89 50 1c             	mov    %edx,0x1c(%eax)
c01029eb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01029ee:	89 50 20             	mov    %edx,0x20(%eax)
c01029f1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01029f4:	89 50 24             	mov    %edx,0x24(%eax)
c01029f7:	c9                   	leave  
c01029f8:	c3                   	ret    

c01029f9 <new_dir_entry>:
c01029f9:	55                   	push   %ebp
c01029fa:	89 e5                	mov    %esp,%ebp
c01029fc:	83 ec 48             	sub    $0x48,%esp
c01029ff:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102a06:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a09:	8b 40 04             	mov    0x4(%eax),%eax
c0102a0c:	99                   	cltd   
c0102a0d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a10:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102a13:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a16:	8b 40 0c             	mov    0xc(%eax),%eax
c0102a19:	99                   	cltd   
c0102a1a:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a1d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102a20:	e8 2b 0c 00 00       	call   c0103650 <get_super_block>
c0102a25:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102a28:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102a2b:	8b 00                	mov    (%eax),%eax
c0102a2d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102a30:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a33:	8b 40 0c             	mov    0xc(%eax),%eax
c0102a36:	05 00 02 00 00       	add    $0x200,%eax
c0102a3b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102a41:	85 c0                	test   %eax,%eax
c0102a43:	0f 48 c2             	cmovs  %edx,%eax
c0102a46:	c1 f8 09             	sar    $0x9,%eax
c0102a49:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102a4c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102a53:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0102a5a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102a61:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102a68:	eb 7f                	jmp    c0102ae9 <new_dir_entry+0xf0>
c0102a6a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a6f:	89 c1                	mov    %eax,%ecx
c0102a71:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a74:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a77:	01 d0                	add    %edx,%eax
c0102a79:	83 ec 0c             	sub    $0xc,%esp
c0102a7c:	6a 07                	push   $0x7
c0102a7e:	68 00 02 00 00       	push   $0x200
c0102a83:	51                   	push   %ecx
c0102a84:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102a87:	50                   	push   %eax
c0102a88:	e8 e7 ed ff ff       	call   c0101874 <rd_wt>
c0102a8d:	83 c4 20             	add    $0x20,%esp
c0102a90:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102a95:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102a98:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102a9f:	eb 25                	jmp    c0102ac6 <new_dir_entry+0xcd>
c0102aa1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102aa5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102aa8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102aab:	7f 29                	jg     c0102ad6 <new_dir_entry+0xdd>
c0102aad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ab0:	8b 00                	mov    (%eax),%eax
c0102ab2:	85 c0                	test   %eax,%eax
c0102ab4:	75 08                	jne    c0102abe <new_dir_entry+0xc5>
c0102ab6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ab9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102abc:	eb 19                	jmp    c0102ad7 <new_dir_entry+0xde>
c0102abe:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102ac2:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102ac6:	b8 00 02 00 00       	mov    $0x200,%eax
c0102acb:	99                   	cltd   
c0102acc:	f7 7d dc             	idivl  -0x24(%ebp)
c0102acf:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102ad2:	7c cd                	jl     c0102aa1 <new_dir_entry+0xa8>
c0102ad4:	eb 01                	jmp    c0102ad7 <new_dir_entry+0xde>
c0102ad6:	90                   	nop
c0102ad7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102ada:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102add:	7f 16                	jg     c0102af5 <new_dir_entry+0xfc>
c0102adf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102ae3:	75 10                	jne    c0102af5 <new_dir_entry+0xfc>
c0102ae5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102ae9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102aec:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102aef:	0f 8c 75 ff ff ff    	jl     c0102a6a <new_dir_entry+0x71>
c0102af5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102af8:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102afb:	75 0a                	jne    c0102b07 <new_dir_entry+0x10e>
c0102afd:	b8 00 00 00 00       	mov    $0x0,%eax
c0102b02:	e9 fc 00 00 00       	jmp    c0102c03 <new_dir_entry+0x20a>
c0102b07:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102b0e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102b12:	75 1e                	jne    c0102b32 <new_dir_entry+0x139>
c0102b14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102b17:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102b1a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b1d:	8b 50 04             	mov    0x4(%eax),%edx
c0102b20:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102b23:	01 c2                	add    %eax,%edx
c0102b25:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b28:	89 50 04             	mov    %edx,0x4(%eax)
c0102b2b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b35:	8b 55 14             	mov    0x14(%ebp),%edx
c0102b38:	89 10                	mov    %edx,(%eax)
c0102b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102b3d:	83 c0 04             	add    $0x4,%eax
c0102b40:	83 ec 08             	sub    $0x8,%esp
c0102b43:	ff 75 10             	pushl  0x10(%ebp)
c0102b46:	50                   	push   %eax
c0102b47:	e8 a2 96 00 00       	call   c010c1ee <Strcpy>
c0102b4c:	83 c4 10             	add    $0x10,%esp
c0102b4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b52:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102b55:	8b 0a                	mov    (%edx),%ecx
c0102b57:	89 08                	mov    %ecx,(%eax)
c0102b59:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102b5c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102b5f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102b62:	89 48 08             	mov    %ecx,0x8(%eax)
c0102b65:	8b 52 0c             	mov    0xc(%edx),%edx
c0102b68:	89 50 0c             	mov    %edx,0xc(%eax)
c0102b6b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102b70:	89 c1                	mov    %eax,%ecx
c0102b72:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102b75:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b78:	01 d0                	add    %edx,%eax
c0102b7a:	83 ec 0c             	sub    $0xc,%esp
c0102b7d:	6a 0a                	push   $0xa
c0102b7f:	68 00 02 00 00       	push   $0x200
c0102b84:	51                   	push   %ecx
c0102b85:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102b88:	50                   	push   %eax
c0102b89:	e8 e6 ec ff ff       	call   c0101874 <rd_wt>
c0102b8e:	83 c4 20             	add    $0x20,%esp
c0102b91:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102b95:	74 69                	je     c0102c00 <new_dir_entry+0x207>
c0102b97:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b9a:	8b 10                	mov    (%eax),%edx
c0102b9c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102ba2:	8b 50 04             	mov    0x4(%eax),%edx
c0102ba5:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102bab:	8b 50 08             	mov    0x8(%eax),%edx
c0102bae:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102bb4:	8b 50 0c             	mov    0xc(%eax),%edx
c0102bb7:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102bbd:	8b 50 10             	mov    0x10(%eax),%edx
c0102bc0:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102bc6:	8b 50 14             	mov    0x14(%eax),%edx
c0102bc9:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102bcf:	8b 50 18             	mov    0x18(%eax),%edx
c0102bd2:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102bd8:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102bdb:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102be1:	8b 50 20             	mov    0x20(%eax),%edx
c0102be4:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102bea:	8b 40 24             	mov    0x24(%eax),%eax
c0102bed:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102bf2:	83 ec 0c             	sub    $0xc,%esp
c0102bf5:	ff 75 0c             	pushl  0xc(%ebp)
c0102bf8:	e8 6f 08 00 00       	call   c010346c <sync_inode>
c0102bfd:	83 c4 10             	add    $0x10,%esp
c0102c00:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c03:	c9                   	leave  
c0102c04:	c3                   	ret    

c0102c05 <do_unlink>:
c0102c05:	55                   	push   %ebp
c0102c06:	89 e5                	mov    %esp,%ebp
c0102c08:	53                   	push   %ebx
c0102c09:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102c0f:	83 ec 08             	sub    $0x8,%esp
c0102c12:	ff 75 08             	pushl  0x8(%ebp)
c0102c15:	68 1d b4 10 c0       	push   $0xc010b41d
c0102c1a:	e8 bd 6c 00 00       	call   c01098dc <strcmp>
c0102c1f:	83 c4 10             	add    $0x10,%esp
c0102c22:	85 c0                	test   %eax,%eax
c0102c24:	75 10                	jne    c0102c36 <do_unlink+0x31>
c0102c26:	83 ec 0c             	sub    $0xc,%esp
c0102c29:	68 1f b4 10 c0       	push   $0xc010b41f
c0102c2e:	e8 b4 5c 00 00       	call   c01088e7 <panic>
c0102c33:	83 c4 10             	add    $0x10,%esp
c0102c36:	83 ec 0c             	sub    $0xc,%esp
c0102c39:	ff 75 08             	pushl  0x8(%ebp)
c0102c3c:	e8 31 f5 ff ff       	call   c0102172 <search_file>
c0102c41:	83 c4 10             	add    $0x10,%esp
c0102c44:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102c47:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102c4b:	75 10                	jne    c0102c5d <do_unlink+0x58>
c0102c4d:	83 ec 0c             	sub    $0xc,%esp
c0102c50:	68 3b b4 10 c0       	push   $0xc010b43b
c0102c55:	e8 8d 5c 00 00       	call   c01088e7 <panic>
c0102c5a:	83 c4 10             	add    $0x10,%esp
c0102c5d:	83 ec 08             	sub    $0x8,%esp
c0102c60:	ff 75 d0             	pushl  -0x30(%ebp)
c0102c63:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102c69:	50                   	push   %eax
c0102c6a:	e8 01 f7 ff ff       	call   c0102370 <get_inode>
c0102c6f:	83 c4 10             	add    $0x10,%esp
c0102c72:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102c75:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102c79:	75 10                	jne    c0102c8b <do_unlink+0x86>
c0102c7b:	83 ec 0c             	sub    $0xc,%esp
c0102c7e:	68 3b b4 10 c0       	push   $0xc010b43b
c0102c83:	e8 5f 5c 00 00       	call   c01088e7 <panic>
c0102c88:	83 c4 10             	add    $0x10,%esp
c0102c8b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102c8e:	85 c0                	test   %eax,%eax
c0102c90:	7e 10                	jle    c0102ca2 <do_unlink+0x9d>
c0102c92:	83 ec 0c             	sub    $0xc,%esp
c0102c95:	68 54 b4 10 c0       	push   $0xc010b454
c0102c9a:	e8 48 5c 00 00       	call   c01088e7 <panic>
c0102c9f:	83 c4 10             	add    $0x10,%esp
c0102ca2:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102ca8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102cab:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102cae:	8d 50 07             	lea    0x7(%eax),%edx
c0102cb1:	85 c0                	test   %eax,%eax
c0102cb3:	0f 48 c2             	cmovs  %edx,%eax
c0102cb6:	c1 f8 03             	sar    $0x3,%eax
c0102cb9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102cbc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102cbf:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102cc5:	85 c0                	test   %eax,%eax
c0102cc7:	0f 48 c2             	cmovs  %edx,%eax
c0102cca:	c1 f8 09             	sar    $0x9,%eax
c0102ccd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102cd0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102cd3:	99                   	cltd   
c0102cd4:	c1 ea 1d             	shr    $0x1d,%edx
c0102cd7:	01 d0                	add    %edx,%eax
c0102cd9:	83 e0 07             	and    $0x7,%eax
c0102cdc:	29 d0                	sub    %edx,%eax
c0102cde:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102ce1:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102ce8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ced:	89 c2                	mov    %eax,%edx
c0102cef:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102cf2:	83 c0 02             	add    $0x2,%eax
c0102cf5:	83 ec 0c             	sub    $0xc,%esp
c0102cf8:	6a 07                	push   $0x7
c0102cfa:	68 00 02 00 00       	push   $0x200
c0102cff:	52                   	push   %edx
c0102d00:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d03:	50                   	push   %eax
c0102d04:	e8 6b eb ff ff       	call   c0101874 <rd_wt>
c0102d09:	83 c4 20             	add    $0x20,%esp
c0102d0c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d12:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d15:	01 d0                	add    %edx,%eax
c0102d17:	0f b6 10             	movzbl (%eax),%edx
c0102d1a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102d1d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102d22:	89 c1                	mov    %eax,%ecx
c0102d24:	d3 e3                	shl    %cl,%ebx
c0102d26:	89 d8                	mov    %ebx,%eax
c0102d28:	f7 d0                	not    %eax
c0102d2a:	89 c3                	mov    %eax,%ebx
c0102d2c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102d32:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102d35:	01 c8                	add    %ecx,%eax
c0102d37:	21 da                	and    %ebx,%edx
c0102d39:	88 10                	mov    %dl,(%eax)
c0102d3b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d40:	89 c2                	mov    %eax,%edx
c0102d42:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102d45:	83 c0 02             	add    $0x2,%eax
c0102d48:	83 ec 0c             	sub    $0xc,%esp
c0102d4b:	6a 0a                	push   $0xa
c0102d4d:	68 00 02 00 00       	push   $0x200
c0102d52:	52                   	push   %edx
c0102d53:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d56:	50                   	push   %eax
c0102d57:	e8 18 eb ff ff       	call   c0101874 <rd_wt>
c0102d5c:	83 c4 20             	add    $0x20,%esp
c0102d5f:	e8 ec 08 00 00       	call   c0103650 <get_super_block>
c0102d64:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102d67:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102d6d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102d70:	8b 00                	mov    (%eax),%eax
c0102d72:	29 c2                	sub    %eax,%edx
c0102d74:	89 d0                	mov    %edx,%eax
c0102d76:	83 c0 01             	add    $0x1,%eax
c0102d79:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102d7c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102d7f:	8d 50 07             	lea    0x7(%eax),%edx
c0102d82:	85 c0                	test   %eax,%eax
c0102d84:	0f 48 c2             	cmovs  %edx,%eax
c0102d87:	c1 f8 03             	sar    $0x3,%eax
c0102d8a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102d8d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102d90:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102d96:	85 c0                	test   %eax,%eax
c0102d98:	0f 48 c2             	cmovs  %edx,%eax
c0102d9b:	c1 f8 09             	sar    $0x9,%eax
c0102d9e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102da1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102da4:	99                   	cltd   
c0102da5:	c1 ea 1d             	shr    $0x1d,%edx
c0102da8:	01 d0                	add    %edx,%eax
c0102daa:	83 e0 07             	and    $0x7,%eax
c0102dad:	29 d0                	sub    %edx,%eax
c0102daf:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102db2:	b8 08 00 00 00       	mov    $0x8,%eax
c0102db7:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102dba:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102dbd:	29 c2                	sub    %eax,%edx
c0102dbf:	89 d0                	mov    %edx,%eax
c0102dc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102dc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102dc7:	8d 50 07             	lea    0x7(%eax),%edx
c0102dca:	85 c0                	test   %eax,%eax
c0102dcc:	0f 48 c2             	cmovs  %edx,%eax
c0102dcf:	c1 f8 03             	sar    $0x3,%eax
c0102dd2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102dd5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102dda:	89 c1                	mov    %eax,%ecx
c0102ddc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102ddf:	8b 40 04             	mov    0x4(%eax),%eax
c0102de2:	8d 50 02             	lea    0x2(%eax),%edx
c0102de5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102de8:	01 d0                	add    %edx,%eax
c0102dea:	83 ec 0c             	sub    $0xc,%esp
c0102ded:	6a 07                	push   $0x7
c0102def:	68 00 02 00 00       	push   $0x200
c0102df4:	51                   	push   %ecx
c0102df5:	ff 75 b8             	pushl  -0x48(%ebp)
c0102df8:	50                   	push   %eax
c0102df9:	e8 76 ea ff ff       	call   c0101874 <rd_wt>
c0102dfe:	83 c4 20             	add    $0x20,%esp
c0102e01:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102e07:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e0a:	01 d0                	add    %edx,%eax
c0102e0c:	0f b6 10             	movzbl (%eax),%edx
c0102e0f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102e12:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102e17:	89 c1                	mov    %eax,%ecx
c0102e19:	d3 e3                	shl    %cl,%ebx
c0102e1b:	89 d8                	mov    %ebx,%eax
c0102e1d:	f7 d0                	not    %eax
c0102e1f:	89 c3                	mov    %eax,%ebx
c0102e21:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102e27:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102e2a:	01 c8                	add    %ecx,%eax
c0102e2c:	21 da                	and    %ebx,%edx
c0102e2e:	88 10                	mov    %dl,(%eax)
c0102e30:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102e37:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102e3a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102e3d:	eb 6b                	jmp    c0102eaa <do_unlink+0x2a5>
c0102e3f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102e46:	75 4c                	jne    c0102e94 <do_unlink+0x28f>
c0102e48:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102e4f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e54:	83 ec 0c             	sub    $0xc,%esp
c0102e57:	6a 0a                	push   $0xa
c0102e59:	68 00 02 00 00       	push   $0x200
c0102e5e:	50                   	push   %eax
c0102e5f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e62:	ff 75 ec             	pushl  -0x14(%ebp)
c0102e65:	e8 0a ea ff ff       	call   c0101874 <rd_wt>
c0102e6a:	83 c4 20             	add    $0x20,%esp
c0102e6d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e72:	89 c1                	mov    %eax,%ecx
c0102e74:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102e77:	8d 50 01             	lea    0x1(%eax),%edx
c0102e7a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102e7d:	83 ec 0c             	sub    $0xc,%esp
c0102e80:	6a 07                	push   $0x7
c0102e82:	68 00 02 00 00       	push   $0x200
c0102e87:	51                   	push   %ecx
c0102e88:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e8b:	50                   	push   %eax
c0102e8c:	e8 e3 e9 ff ff       	call   c0101874 <rd_wt>
c0102e91:	83 c4 20             	add    $0x20,%esp
c0102e94:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102e9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e9d:	01 d0                	add    %edx,%eax
c0102e9f:	c6 00 00             	movb   $0x0,(%eax)
c0102ea2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102ea6:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102eaa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ead:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102eb0:	7c 8d                	jl     c0102e3f <do_unlink+0x23a>
c0102eb2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102eb9:	75 4c                	jne    c0102f07 <do_unlink+0x302>
c0102ebb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102ec2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ec7:	83 ec 0c             	sub    $0xc,%esp
c0102eca:	6a 0a                	push   $0xa
c0102ecc:	68 00 02 00 00       	push   $0x200
c0102ed1:	50                   	push   %eax
c0102ed2:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ed5:	ff 75 ec             	pushl  -0x14(%ebp)
c0102ed8:	e8 97 e9 ff ff       	call   c0101874 <rd_wt>
c0102edd:	83 c4 20             	add    $0x20,%esp
c0102ee0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ee5:	89 c1                	mov    %eax,%ecx
c0102ee7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102eea:	8d 50 01             	lea    0x1(%eax),%edx
c0102eed:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102ef0:	83 ec 0c             	sub    $0xc,%esp
c0102ef3:	6a 07                	push   $0x7
c0102ef5:	68 00 02 00 00       	push   $0x200
c0102efa:	51                   	push   %ecx
c0102efb:	ff 75 b8             	pushl  -0x48(%ebp)
c0102efe:	50                   	push   %eax
c0102eff:	e8 70 e9 ff ff       	call   c0101874 <rd_wt>
c0102f04:	83 c4 20             	add    $0x20,%esp
c0102f07:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102f0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f10:	01 d0                	add    %edx,%eax
c0102f12:	0f b6 10             	movzbl (%eax),%edx
c0102f15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102f18:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102f1d:	89 c1                	mov    %eax,%ecx
c0102f1f:	d3 e3                	shl    %cl,%ebx
c0102f21:	89 d8                	mov    %ebx,%eax
c0102f23:	89 c3                	mov    %eax,%ebx
c0102f25:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102f2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f2e:	01 c8                	add    %ecx,%eax
c0102f30:	21 da                	and    %ebx,%edx
c0102f32:	88 10                	mov    %dl,(%eax)
c0102f34:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f39:	83 ec 0c             	sub    $0xc,%esp
c0102f3c:	6a 0a                	push   $0xa
c0102f3e:	68 00 02 00 00       	push   $0x200
c0102f43:	50                   	push   %eax
c0102f44:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f47:	ff 75 ec             	pushl  -0x14(%ebp)
c0102f4a:	e8 25 e9 ff ff       	call   c0101874 <rd_wt>
c0102f4f:	83 c4 20             	add    $0x20,%esp
c0102f52:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102f59:	00 00 00 
c0102f5c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102f63:	00 00 00 
c0102f66:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102f6d:	00 00 00 
c0102f70:	83 ec 0c             	sub    $0xc,%esp
c0102f73:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102f79:	50                   	push   %eax
c0102f7a:	e8 ed 04 00 00       	call   c010346c <sync_inode>
c0102f7f:	83 c4 10             	add    $0x10,%esp
c0102f82:	83 ec 0c             	sub    $0xc,%esp
c0102f85:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102f8b:	50                   	push   %eax
c0102f8c:	e8 2f 06 00 00       	call   c01035c0 <put_inode>
c0102f91:	83 c4 10             	add    $0x10,%esp
c0102f94:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102f97:	8b 00                	mov    (%eax),%eax
c0102f99:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102f9c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102fa3:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102fa6:	8b 40 04             	mov    0x4(%eax),%eax
c0102fa9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102fac:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102faf:	8b 40 0c             	mov    0xc(%eax),%eax
c0102fb2:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102fb5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102fb8:	c1 e8 04             	shr    $0x4,%eax
c0102fbb:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102fbe:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102fc5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102fcc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102fd3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0102fda:	e9 a5 00 00 00       	jmp    c0103084 <do_unlink+0x47f>
c0102fdf:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102fe4:	89 c1                	mov    %eax,%ecx
c0102fe6:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102fe9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102fec:	01 d0                	add    %edx,%eax
c0102fee:	83 ec 0c             	sub    $0xc,%esp
c0102ff1:	6a 07                	push   $0x7
c0102ff3:	68 00 02 00 00       	push   $0x200
c0102ff8:	51                   	push   %ecx
c0102ff9:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ffc:	50                   	push   %eax
c0102ffd:	e8 72 e8 ff ff       	call   c0101874 <rd_wt>
c0103002:	83 c4 20             	add    $0x20,%esp
c0103005:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010300a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010300d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0103014:	eb 51                	jmp    c0103067 <do_unlink+0x462>
c0103016:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010301a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010301d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103020:	7f 4f                	jg     c0103071 <do_unlink+0x46c>
c0103022:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103025:	83 c0 10             	add    $0x10,%eax
c0103028:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010302b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010302e:	83 c0 04             	add    $0x4,%eax
c0103031:	83 ec 08             	sub    $0x8,%esp
c0103034:	ff 75 08             	pushl  0x8(%ebp)
c0103037:	50                   	push   %eax
c0103038:	e8 9f 68 00 00       	call   c01098dc <strcmp>
c010303d:	83 c4 10             	add    $0x10,%esp
c0103040:	85 c0                	test   %eax,%eax
c0103042:	75 1b                	jne    c010305f <do_unlink+0x45a>
c0103044:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c010304b:	83 ec 04             	sub    $0x4,%esp
c010304e:	6a 10                	push   $0x10
c0103050:	6a 00                	push   $0x0
c0103052:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103055:	e8 75 91 00 00       	call   c010c1cf <Memset>
c010305a:	83 c4 10             	add    $0x10,%esp
c010305d:	eb 13                	jmp    c0103072 <do_unlink+0x46d>
c010305f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0103063:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0103067:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010306a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010306d:	7c a7                	jl     c0103016 <do_unlink+0x411>
c010306f:	eb 01                	jmp    c0103072 <do_unlink+0x46d>
c0103071:	90                   	nop
c0103072:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103075:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103078:	7f 16                	jg     c0103090 <do_unlink+0x48b>
c010307a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010307e:	75 10                	jne    c0103090 <do_unlink+0x48b>
c0103080:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0103084:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103087:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010308a:	0f 8c 4f ff ff ff    	jl     c0102fdf <do_unlink+0x3da>
c0103090:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103093:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103096:	75 17                	jne    c01030af <do_unlink+0x4aa>
c0103098:	8b 45 98             	mov    -0x68(%ebp),%eax
c010309b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010309e:	89 50 04             	mov    %edx,0x4(%eax)
c01030a1:	83 ec 0c             	sub    $0xc,%esp
c01030a4:	ff 75 98             	pushl  -0x68(%ebp)
c01030a7:	e8 c0 03 00 00       	call   c010346c <sync_inode>
c01030ac:	83 c4 10             	add    $0x10,%esp
c01030af:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01030b3:	74 26                	je     c01030db <do_unlink+0x4d6>
c01030b5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01030ba:	89 c1                	mov    %eax,%ecx
c01030bc:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01030bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030c2:	01 d0                	add    %edx,%eax
c01030c4:	83 ec 0c             	sub    $0xc,%esp
c01030c7:	6a 0a                	push   $0xa
c01030c9:	68 00 02 00 00       	push   $0x200
c01030ce:	51                   	push   %ecx
c01030cf:	ff 75 b8             	pushl  -0x48(%ebp)
c01030d2:	50                   	push   %eax
c01030d3:	e8 9c e7 ff ff       	call   c0101874 <rd_wt>
c01030d8:	83 c4 20             	add    $0x20,%esp
c01030db:	90                   	nop
c01030dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01030df:	c9                   	leave  
c01030e0:	c3                   	ret    

c01030e1 <do_rdwt>:
c01030e1:	55                   	push   %ebp
c01030e2:	89 e5                	mov    %esp,%ebp
c01030e4:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01030ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01030ed:	8b 40 78             	mov    0x78(%eax),%eax
c01030f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01030f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01030f6:	8b 40 60             	mov    0x60(%eax),%eax
c01030f9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01030fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01030ff:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103102:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103105:	8b 45 08             	mov    0x8(%ebp),%eax
c0103108:	8b 00                	mov    (%eax),%eax
c010310a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010310d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103110:	8b 40 10             	mov    0x10(%eax),%eax
c0103113:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103116:	8b 45 08             	mov    0x8(%ebp),%eax
c0103119:	8b 40 50             	mov    0x50(%eax),%eax
c010311c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010311f:	83 ec 0c             	sub    $0xc,%esp
c0103122:	ff 75 d0             	pushl  -0x30(%ebp)
c0103125:	e8 0c 07 00 00       	call   c0103836 <pid2proc>
c010312a:	83 c4 10             	add    $0x10,%esp
c010312d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103130:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103133:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0103136:	83 c2 4c             	add    $0x4c,%edx
c0103139:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010313d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103140:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103143:	8b 40 08             	mov    0x8(%eax),%eax
c0103146:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103149:	8b 45 08             	mov    0x8(%ebp),%eax
c010314c:	8b 00                	mov    (%eax),%eax
c010314e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103151:	83 ec 08             	sub    $0x8,%esp
c0103154:	ff 75 bc             	pushl  -0x44(%ebp)
c0103157:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010315d:	50                   	push   %eax
c010315e:	e8 0d f2 ff ff       	call   c0102370 <get_inode>
c0103163:	83 c4 10             	add    $0x10,%esp
c0103166:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103169:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010316d:	75 10                	jne    c010317f <do_rdwt+0x9e>
c010316f:	83 ec 0c             	sub    $0xc,%esp
c0103172:	68 8c b4 10 c0       	push   $0xc010b48c
c0103177:	e8 6b 57 00 00       	call   c01088e7 <panic>
c010317c:	83 c4 10             	add    $0x10,%esp
c010317f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103185:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103188:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010318b:	8b 40 04             	mov    0x4(%eax),%eax
c010318e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103191:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103195:	74 22                	je     c01031b9 <do_rdwt+0xd8>
c0103197:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010319b:	74 1c                	je     c01031b9 <do_rdwt+0xd8>
c010319d:	68 a8 04 00 00       	push   $0x4a8
c01031a2:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01031a7:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01031ac:	68 9c b4 10 c0       	push   $0xc010b49c
c01031b1:	e8 4f 57 00 00       	call   c0108905 <assertion_failure>
c01031b6:	83 c4 10             	add    $0x10,%esp
c01031b9:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c01031bf:	83 f8 01             	cmp    $0x1,%eax
c01031c2:	0f 85 86 00 00 00    	jne    c010324e <do_rdwt+0x16d>
c01031c8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01031cc:	75 09                	jne    c01031d7 <do_rdwt+0xf6>
c01031ce:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c01031d5:	eb 0d                	jmp    c01031e4 <do_rdwt+0x103>
c01031d7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01031db:	75 07                	jne    c01031e4 <do_rdwt+0x103>
c01031dd:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c01031e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01031e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01031ea:	89 50 78             	mov    %edx,0x78(%eax)
c01031ed:	8b 55 b8             	mov    -0x48(%ebp),%edx
c01031f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01031f3:	89 50 68             	mov    %edx,0x68(%eax)
c01031f6:	83 ec 04             	sub    $0x4,%esp
c01031f9:	6a 04                	push   $0x4
c01031fb:	ff 75 08             	pushl  0x8(%ebp)
c01031fe:	6a 03                	push   $0x3
c0103200:	e8 70 63 00 00       	call   c0109575 <send_rec>
c0103205:	83 c4 10             	add    $0x10,%esp
c0103208:	8b 45 08             	mov    0x8(%ebp),%eax
c010320b:	8b 40 78             	mov    0x78(%eax),%eax
c010320e:	83 f8 66             	cmp    $0x66,%eax
c0103211:	75 13                	jne    c0103226 <do_rdwt+0x145>
c0103213:	83 ec 04             	sub    $0x4,%esp
c0103216:	ff 75 b8             	pushl  -0x48(%ebp)
c0103219:	ff 75 08             	pushl  0x8(%ebp)
c010321c:	6a 01                	push   $0x1
c010321e:	e8 52 63 00 00       	call   c0109575 <send_rec>
c0103223:	83 c4 10             	add    $0x10,%esp
c0103226:	8b 45 08             	mov    0x8(%ebp),%eax
c0103229:	8b 40 78             	mov    0x78(%eax),%eax
c010322c:	83 f8 65             	cmp    $0x65,%eax
c010322f:	75 13                	jne    c0103244 <do_rdwt+0x163>
c0103231:	83 ec 04             	sub    $0x4,%esp
c0103234:	ff 75 b8             	pushl  -0x48(%ebp)
c0103237:	ff 75 08             	pushl  0x8(%ebp)
c010323a:	6a 01                	push   $0x1
c010323c:	e8 34 63 00 00       	call   c0109575 <send_rec>
c0103241:	83 c4 10             	add    $0x10,%esp
c0103244:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103249:	e9 1c 02 00 00       	jmp    c010346a <do_rdwt+0x389>
c010324e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103252:	75 18                	jne    c010326c <do_rdwt+0x18b>
c0103254:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010325a:	c1 e0 09             	shl    $0x9,%eax
c010325d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103260:	75 0a                	jne    c010326c <do_rdwt+0x18b>
c0103262:	b8 00 00 00 00       	mov    $0x0,%eax
c0103267:	e9 fe 01 00 00       	jmp    c010346a <do_rdwt+0x389>
c010326c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103270:	75 14                	jne    c0103286 <do_rdwt+0x1a5>
c0103272:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103275:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103278:	01 d0                	add    %edx,%eax
c010327a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010327d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0103281:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103284:	eb 19                	jmp    c010329f <do_rdwt+0x1be>
c0103286:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103289:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010328c:	01 c2                	add    %eax,%edx
c010328e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103294:	c1 e0 09             	shl    $0x9,%eax
c0103297:	39 c2                	cmp    %eax,%edx
c0103299:	0f 4e c2             	cmovle %edx,%eax
c010329c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010329f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01032a2:	99                   	cltd   
c01032a3:	c1 ea 17             	shr    $0x17,%edx
c01032a6:	01 d0                	add    %edx,%eax
c01032a8:	25 ff 01 00 00       	and    $0x1ff,%eax
c01032ad:	29 d0                	sub    %edx,%eax
c01032af:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01032b2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01032b8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01032bb:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01032c1:	85 c0                	test   %eax,%eax
c01032c3:	0f 48 c1             	cmovs  %ecx,%eax
c01032c6:	c1 f8 09             	sar    $0x9,%eax
c01032c9:	01 d0                	add    %edx,%eax
c01032cb:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01032ce:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01032d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01032d7:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01032dd:	85 c0                	test   %eax,%eax
c01032df:	0f 48 c1             	cmovs  %ecx,%eax
c01032e2:	c1 f8 09             	sar    $0x9,%eax
c01032e5:	01 d0                	add    %edx,%eax
c01032e7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01032ea:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01032ed:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01032f0:	ba 00 00 10 00       	mov    $0x100000,%edx
c01032f5:	39 d0                	cmp    %edx,%eax
c01032f7:	7d 0b                	jge    c0103304 <do_rdwt+0x223>
c01032f9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01032fc:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01032ff:	83 c0 01             	add    $0x1,%eax
c0103302:	eb 05                	jmp    c0103309 <do_rdwt+0x228>
c0103304:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103309:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010330c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010330f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103312:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103319:	8b 45 08             	mov    0x8(%ebp),%eax
c010331c:	8b 00                	mov    (%eax),%eax
c010331e:	83 ec 0c             	sub    $0xc,%esp
c0103321:	50                   	push   %eax
c0103322:	e8 0f 05 00 00       	call   c0103836 <pid2proc>
c0103327:	83 c4 10             	add    $0x10,%esp
c010332a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010332d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103330:	83 ec 08             	sub    $0x8,%esp
c0103333:	50                   	push   %eax
c0103334:	ff 75 cc             	pushl  -0x34(%ebp)
c0103337:	e8 43 2b 00 00       	call   c0105e7f <alloc_virtual_memory>
c010333c:	83 c4 10             	add    $0x10,%esp
c010333f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103342:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103345:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103348:	e9 c5 00 00 00       	jmp    c0103412 <do_rdwt+0x331>
c010334d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103350:	c1 e0 09             	shl    $0x9,%eax
c0103353:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103356:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103359:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010335d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103360:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103367:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010336b:	75 46                	jne    c01033b3 <do_rdwt+0x2d2>
c010336d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103370:	c1 e0 09             	shl    $0x9,%eax
c0103373:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103379:	83 ec 0c             	sub    $0xc,%esp
c010337c:	6a 07                	push   $0x7
c010337e:	50                   	push   %eax
c010337f:	52                   	push   %edx
c0103380:	ff 75 90             	pushl  -0x70(%ebp)
c0103383:	ff 75 e0             	pushl  -0x20(%ebp)
c0103386:	e8 e9 e4 ff ff       	call   c0101874 <rd_wt>
c010338b:	83 c4 20             	add    $0x20,%esp
c010338e:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103394:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103397:	01 d0                	add    %edx,%eax
c0103399:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010339c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010339f:	01 ca                	add    %ecx,%edx
c01033a1:	83 ec 04             	sub    $0x4,%esp
c01033a4:	ff 75 94             	pushl  -0x6c(%ebp)
c01033a7:	50                   	push   %eax
c01033a8:	52                   	push   %edx
c01033a9:	e8 3e 39 00 00       	call   c0106cec <Memcpy>
c01033ae:	83 c4 10             	add    $0x10,%esp
c01033b1:	eb 46                	jmp    c01033f9 <do_rdwt+0x318>
c01033b3:	8b 55 98             	mov    -0x68(%ebp),%edx
c01033b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01033b9:	01 d0                	add    %edx,%eax
c01033bb:	89 c1                	mov    %eax,%ecx
c01033bd:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01033c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033c6:	01 d0                	add    %edx,%eax
c01033c8:	83 ec 04             	sub    $0x4,%esp
c01033cb:	ff 75 94             	pushl  -0x6c(%ebp)
c01033ce:	51                   	push   %ecx
c01033cf:	50                   	push   %eax
c01033d0:	e8 17 39 00 00       	call   c0106cec <Memcpy>
c01033d5:	83 c4 10             	add    $0x10,%esp
c01033d8:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01033db:	c1 e0 09             	shl    $0x9,%eax
c01033de:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01033e4:	83 ec 0c             	sub    $0xc,%esp
c01033e7:	6a 0a                	push   $0xa
c01033e9:	50                   	push   %eax
c01033ea:	52                   	push   %edx
c01033eb:	ff 75 90             	pushl  -0x70(%ebp)
c01033ee:	ff 75 e0             	pushl  -0x20(%ebp)
c01033f1:	e8 7e e4 ff ff       	call   c0101874 <rd_wt>
c01033f6:	83 c4 20             	add    $0x20,%esp
c01033f9:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01033fc:	29 45 e8             	sub    %eax,-0x18(%ebp)
c01033ff:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103402:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103405:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010340c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010340f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103412:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103415:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103418:	7f 0a                	jg     c0103424 <do_rdwt+0x343>
c010341a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010341e:	0f 85 29 ff ff ff    	jne    c010334d <do_rdwt+0x26c>
c0103424:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103427:	8b 50 04             	mov    0x4(%eax),%edx
c010342a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010342d:	01 c2                	add    %eax,%edx
c010342f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103432:	89 50 04             	mov    %edx,0x4(%eax)
c0103435:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103438:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010343b:	01 c2                	add    %eax,%edx
c010343d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103443:	39 c2                	cmp    %eax,%edx
c0103445:	7e 20                	jle    c0103467 <do_rdwt+0x386>
c0103447:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010344a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010344d:	01 d0                	add    %edx,%eax
c010344f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103455:	83 ec 0c             	sub    $0xc,%esp
c0103458:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010345e:	50                   	push   %eax
c010345f:	e8 08 00 00 00       	call   c010346c <sync_inode>
c0103464:	83 c4 10             	add    $0x10,%esp
c0103467:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010346a:	c9                   	leave  
c010346b:	c3                   	ret    

c010346c <sync_inode>:
c010346c:	55                   	push   %ebp
c010346d:	89 e5                	mov    %esp,%ebp
c010346f:	53                   	push   %ebx
c0103470:	83 ec 34             	sub    $0x34,%esp
c0103473:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010347a:	eb 74                	jmp    c01034f0 <sync_inode+0x84>
c010347c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010347f:	89 d0                	mov    %edx,%eax
c0103481:	c1 e0 02             	shl    $0x2,%eax
c0103484:	01 d0                	add    %edx,%eax
c0103486:	c1 e0 03             	shl    $0x3,%eax
c0103489:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c010348e:	8b 10                	mov    (%eax),%edx
c0103490:	8b 45 08             	mov    0x8(%ebp),%eax
c0103493:	8b 40 10             	mov    0x10(%eax),%eax
c0103496:	39 c2                	cmp    %eax,%edx
c0103498:	75 52                	jne    c01034ec <sync_inode+0x80>
c010349a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010349d:	89 d0                	mov    %edx,%eax
c010349f:	c1 e0 02             	shl    $0x2,%eax
c01034a2:	01 d0                	add    %edx,%eax
c01034a4:	c1 e0 03             	shl    $0x3,%eax
c01034a7:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c01034ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01034b0:	8b 08                	mov    (%eax),%ecx
c01034b2:	89 0a                	mov    %ecx,(%edx)
c01034b4:	8b 48 04             	mov    0x4(%eax),%ecx
c01034b7:	89 4a 04             	mov    %ecx,0x4(%edx)
c01034ba:	8b 48 08             	mov    0x8(%eax),%ecx
c01034bd:	89 4a 08             	mov    %ecx,0x8(%edx)
c01034c0:	8b 48 0c             	mov    0xc(%eax),%ecx
c01034c3:	89 4a 0c             	mov    %ecx,0xc(%edx)
c01034c6:	8b 48 10             	mov    0x10(%eax),%ecx
c01034c9:	89 4a 10             	mov    %ecx,0x10(%edx)
c01034cc:	8b 48 14             	mov    0x14(%eax),%ecx
c01034cf:	89 4a 14             	mov    %ecx,0x14(%edx)
c01034d2:	8b 48 18             	mov    0x18(%eax),%ecx
c01034d5:	89 4a 18             	mov    %ecx,0x18(%edx)
c01034d8:	8b 48 1c             	mov    0x1c(%eax),%ecx
c01034db:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c01034de:	8b 48 20             	mov    0x20(%eax),%ecx
c01034e1:	89 4a 20             	mov    %ecx,0x20(%edx)
c01034e4:	8b 40 24             	mov    0x24(%eax),%eax
c01034e7:	89 42 24             	mov    %eax,0x24(%edx)
c01034ea:	eb 0a                	jmp    c01034f6 <sync_inode+0x8a>
c01034ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01034f0:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c01034f4:	7e 86                	jle    c010347c <sync_inode+0x10>
c01034f6:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c01034fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103500:	8b 40 10             	mov    0x10(%eax),%eax
c0103503:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103506:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103509:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010350c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103511:	99                   	cltd   
c0103512:	f7 7d f0             	idivl  -0x10(%ebp)
c0103515:	89 c3                	mov    %eax,%ebx
c0103517:	89 c8                	mov    %ecx,%eax
c0103519:	99                   	cltd   
c010351a:	f7 fb                	idiv   %ebx
c010351c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010351f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103522:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103525:	b8 00 02 00 00       	mov    $0x200,%eax
c010352a:	99                   	cltd   
c010352b:	f7 7d f0             	idivl  -0x10(%ebp)
c010352e:	89 c3                	mov    %eax,%ebx
c0103530:	89 c8                	mov    %ecx,%eax
c0103532:	99                   	cltd   
c0103533:	f7 fb                	idiv   %ebx
c0103535:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103538:	8b 45 08             	mov    0x8(%ebp),%eax
c010353b:	8b 40 20             	mov    0x20(%eax),%eax
c010353e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103541:	e8 0a 01 00 00       	call   c0103650 <get_super_block>
c0103546:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103549:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010354c:	8b 40 04             	mov    0x4(%eax),%eax
c010354f:	8d 50 02             	lea    0x2(%eax),%edx
c0103552:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103555:	8b 40 08             	mov    0x8(%eax),%eax
c0103558:	01 c2                	add    %eax,%edx
c010355a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010355d:	01 d0                	add    %edx,%eax
c010355f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103562:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103567:	83 ec 0c             	sub    $0xc,%esp
c010356a:	6a 07                	push   $0x7
c010356c:	68 00 02 00 00       	push   $0x200
c0103571:	50                   	push   %eax
c0103572:	ff 75 e0             	pushl  -0x20(%ebp)
c0103575:	ff 75 d8             	pushl  -0x28(%ebp)
c0103578:	e8 f7 e2 ff ff       	call   c0101874 <rd_wt>
c010357d:	83 c4 20             	add    $0x20,%esp
c0103580:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0103585:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103588:	83 ec 04             	sub    $0x4,%esp
c010358b:	ff 75 f0             	pushl  -0x10(%ebp)
c010358e:	ff 75 08             	pushl  0x8(%ebp)
c0103591:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103594:	e8 53 37 00 00       	call   c0106cec <Memcpy>
c0103599:	83 c4 10             	add    $0x10,%esp
c010359c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01035a1:	83 ec 0c             	sub    $0xc,%esp
c01035a4:	6a 0a                	push   $0xa
c01035a6:	68 00 02 00 00       	push   $0x200
c01035ab:	50                   	push   %eax
c01035ac:	ff 75 e0             	pushl  -0x20(%ebp)
c01035af:	ff 75 d8             	pushl  -0x28(%ebp)
c01035b2:	e8 bd e2 ff ff       	call   c0101874 <rd_wt>
c01035b7:	83 c4 20             	add    $0x20,%esp
c01035ba:	90                   	nop
c01035bb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01035be:	c9                   	leave  
c01035bf:	c3                   	ret    

c01035c0 <put_inode>:
c01035c0:	55                   	push   %ebp
c01035c1:	89 e5                	mov    %esp,%ebp
c01035c3:	83 ec 08             	sub    $0x8,%esp
c01035c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01035c9:	8b 40 24             	mov    0x24(%eax),%eax
c01035cc:	85 c0                	test   %eax,%eax
c01035ce:	7f 1c                	jg     c01035ec <put_inode+0x2c>
c01035d0:	68 4d 05 00 00       	push   $0x54d
c01035d5:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01035da:	68 f8 b2 10 c0       	push   $0xc010b2f8
c01035df:	68 d0 b4 10 c0       	push   $0xc010b4d0
c01035e4:	e8 1c 53 00 00       	call   c0108905 <assertion_failure>
c01035e9:	83 c4 10             	add    $0x10,%esp
c01035ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01035ef:	8b 40 24             	mov    0x24(%eax),%eax
c01035f2:	8d 50 ff             	lea    -0x1(%eax),%edx
c01035f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01035f8:	89 50 24             	mov    %edx,0x24(%eax)
c01035fb:	90                   	nop
c01035fc:	c9                   	leave  
c01035fd:	c3                   	ret    

c01035fe <do_close>:
c01035fe:	55                   	push   %ebp
c01035ff:	89 e5                	mov    %esp,%ebp
c0103601:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103606:	8b 55 08             	mov    0x8(%ebp),%edx
c0103609:	83 c2 4c             	add    $0x4c,%edx
c010360c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103610:	8b 50 0c             	mov    0xc(%eax),%edx
c0103613:	83 ea 01             	sub    $0x1,%edx
c0103616:	89 50 0c             	mov    %edx,0xc(%eax)
c0103619:	8b 40 0c             	mov    0xc(%eax),%eax
c010361c:	85 c0                	test   %eax,%eax
c010361e:	75 16                	jne    c0103636 <do_close+0x38>
c0103620:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103625:	8b 55 08             	mov    0x8(%ebp),%edx
c0103628:	83 c2 4c             	add    $0x4c,%edx
c010362b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010362f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103636:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010363b:	8b 55 08             	mov    0x8(%ebp),%edx
c010363e:	83 c2 4c             	add    $0x4c,%edx
c0103641:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103648:	00 
c0103649:	b8 00 00 00 00       	mov    $0x0,%eax
c010364e:	5d                   	pop    %ebp
c010364f:	c3                   	ret    

c0103650 <get_super_block>:
c0103650:	55                   	push   %ebp
c0103651:	89 e5                	mov    %esp,%ebp
c0103653:	83 ec 08             	sub    $0x8,%esp
c0103656:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010365b:	83 ec 0c             	sub    $0xc,%esp
c010365e:	6a 07                	push   $0x7
c0103660:	68 00 02 00 00       	push   $0x200
c0103665:	50                   	push   %eax
c0103666:	6a 20                	push   $0x20
c0103668:	6a 01                	push   $0x1
c010366a:	e8 05 e2 ff ff       	call   c0101874 <rd_wt>
c010366f:	83 c4 20             	add    $0x20,%esp
c0103672:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103678:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010367d:	8b 0a                	mov    (%edx),%ecx
c010367f:	89 08                	mov    %ecx,(%eax)
c0103681:	8b 4a 04             	mov    0x4(%edx),%ecx
c0103684:	89 48 04             	mov    %ecx,0x4(%eax)
c0103687:	8b 4a 08             	mov    0x8(%edx),%ecx
c010368a:	89 48 08             	mov    %ecx,0x8(%eax)
c010368d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103690:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103693:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103696:	89 48 10             	mov    %ecx,0x10(%eax)
c0103699:	8b 4a 14             	mov    0x14(%edx),%ecx
c010369c:	89 48 14             	mov    %ecx,0x14(%eax)
c010369f:	8b 4a 18             	mov    0x18(%edx),%ecx
c01036a2:	89 48 18             	mov    %ecx,0x18(%eax)
c01036a5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01036a8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01036ab:	8b 52 20             	mov    0x20(%edx),%edx
c01036ae:	89 50 20             	mov    %edx,0x20(%eax)
c01036b1:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01036b6:	c9                   	leave  
c01036b7:	c3                   	ret    

c01036b8 <schedule_process>:
c01036b8:	55                   	push   %ebp
c01036b9:	89 e5                	mov    %esp,%ebp
c01036bb:	83 ec 18             	sub    $0x18,%esp
c01036be:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c01036c5:	e8 24 cd ff ff       	call   c01003ee <get_running_thread_pcb>
c01036ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01036cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036d0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01036d7:	84 c0                	test   %al,%al
c01036d9:	75 35                	jne    c0103710 <schedule_process+0x58>
c01036db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036de:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c01036e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036e7:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01036ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036f0:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01036f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01036fa:	05 60 02 00 00       	add    $0x260,%eax
c01036ff:	83 ec 08             	sub    $0x8,%esp
c0103702:	50                   	push   %eax
c0103703:	68 ec fd 10 c0       	push   $0xc010fdec
c0103708:	e8 9a 6b 00 00       	call   c010a2a7 <insertToDoubleLinkList>
c010370d:	83 c4 10             	add    $0x10,%esp
c0103710:	83 ec 0c             	sub    $0xc,%esp
c0103713:	68 ec fd 10 c0       	push   $0xc010fdec
c0103718:	e8 a6 69 00 00       	call   c010a0c3 <isListEmpty>
c010371d:	83 c4 10             	add    $0x10,%esp
c0103720:	84 c0                	test   %al,%al
c0103722:	74 19                	je     c010373d <schedule_process+0x85>
c0103724:	6a 1e                	push   $0x1e
c0103726:	68 df b4 10 c0       	push   $0xc010b4df
c010372b:	68 df b4 10 c0       	push   $0xc010b4df
c0103730:	68 e9 b4 10 c0       	push   $0xc010b4e9
c0103735:	e8 cb 51 00 00       	call   c0108905 <assertion_failure>
c010373a:	83 c4 10             	add    $0x10,%esp
c010373d:	83 ec 0c             	sub    $0xc,%esp
c0103740:	68 ec fd 10 c0       	push   $0xc010fdec
c0103745:	e8 e0 6b 00 00       	call   c010a32a <popFromDoubleLinkList>
c010374a:	83 c4 10             	add    $0x10,%esp
c010374d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103750:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103753:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103758:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010375b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010375e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103765:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103768:	8b 50 08             	mov    0x8(%eax),%edx
c010376b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010376e:	39 c2                	cmp    %eax,%edx
c0103770:	74 28                	je     c010379a <schedule_process+0xe2>
c0103772:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103775:	05 00 10 00 00       	add    $0x1000,%eax
c010377a:	83 ec 0c             	sub    $0xc,%esp
c010377d:	50                   	push   %eax
c010377e:	e8 5c cc ff ff       	call   c01003df <update_tss>
c0103783:	83 c4 10             	add    $0x10,%esp
c0103786:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103789:	8b 40 08             	mov    0x8(%eax),%eax
c010378c:	83 ec 0c             	sub    $0xc,%esp
c010378f:	50                   	push   %eax
c0103790:	e8 3d cc ff ff       	call   c01003d2 <update_cr3>
c0103795:	83 c4 10             	add    $0x10,%esp
c0103798:	eb 0f                	jmp    c01037a9 <schedule_process+0xf1>
c010379a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010379d:	83 ec 0c             	sub    $0xc,%esp
c01037a0:	50                   	push   %eax
c01037a1:	e8 2c cc ff ff       	call   c01003d2 <update_cr3>
c01037a6:	83 c4 10             	add    $0x10,%esp
c01037a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037ac:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01037b1:	83 ec 08             	sub    $0x8,%esp
c01037b4:	ff 75 e8             	pushl  -0x18(%ebp)
c01037b7:	ff 75 f0             	pushl  -0x10(%ebp)
c01037ba:	e8 c1 68 00 00       	call   c010a080 <switch_to>
c01037bf:	83 c4 10             	add    $0x10,%esp
c01037c2:	90                   	nop
c01037c3:	c9                   	leave  
c01037c4:	c3                   	ret    

c01037c5 <clock_handler>:
c01037c5:	55                   	push   %ebp
c01037c6:	89 e5                	mov    %esp,%ebp
c01037c8:	83 ec 18             	sub    $0x18,%esp
c01037cb:	e8 1e cc ff ff       	call   c01003ee <get_running_thread_pcb>
c01037d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01037d3:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c01037d8:	85 c0                	test   %eax,%eax
c01037da:	74 0d                	je     c01037e9 <clock_handler+0x24>
c01037dc:	83 ec 0c             	sub    $0xc,%esp
c01037df:	6a 04                	push   $0x4
c01037e1:	e8 29 60 00 00       	call   c010980f <inform_int>
c01037e6:	83 c4 10             	add    $0x10,%esp
c01037e9:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01037ee:	83 f8 64             	cmp    $0x64,%eax
c01037f1:	75 0c                	jne    c01037ff <clock_handler+0x3a>
c01037f3:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c01037fa:	00 00 00 
c01037fd:	eb 0a                	jmp    c0103809 <clock_handler+0x44>
c01037ff:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103804:	83 f8 01             	cmp    $0x1,%eax
c0103807:	75 2a                	jne    c0103833 <clock_handler+0x6e>
c0103809:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010380c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103812:	85 c0                	test   %eax,%eax
c0103814:	74 16                	je     c010382c <clock_handler+0x67>
c0103816:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c010381b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103821:	83 ea 01             	sub    $0x1,%edx
c0103824:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010382a:	eb 08                	jmp    c0103834 <clock_handler+0x6f>
c010382c:	e8 87 fe ff ff       	call   c01036b8 <schedule_process>
c0103831:	eb 01                	jmp    c0103834 <clock_handler+0x6f>
c0103833:	90                   	nop
c0103834:	c9                   	leave  
c0103835:	c3                   	ret    

c0103836 <pid2proc>:
c0103836:	55                   	push   %ebp
c0103837:	89 e5                	mov    %esp,%ebp
c0103839:	83 ec 20             	sub    $0x20,%esp
c010383c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103843:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010384a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c010384f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103855:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103858:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010385b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103860:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103866:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103869:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010386c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103871:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103874:	eb 36                	jmp    c01038ac <pid2proc+0x76>
c0103876:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103879:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010387e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103881:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103885:	75 07                	jne    c010388e <pid2proc+0x58>
c0103887:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c010388e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103891:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103897:	8b 45 08             	mov    0x8(%ebp),%eax
c010389a:	39 c2                	cmp    %eax,%edx
c010389c:	75 05                	jne    c01038a3 <pid2proc+0x6d>
c010389e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038a1:	eb 17                	jmp    c01038ba <pid2proc+0x84>
c01038a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038a6:	8b 40 04             	mov    0x4(%eax),%eax
c01038a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038ac:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c01038b3:	75 c1                	jne    c0103876 <pid2proc+0x40>
c01038b5:	b8 00 00 00 00       	mov    $0x0,%eax
c01038ba:	c9                   	leave  
c01038bb:	c3                   	ret    

c01038bc <proc2pid>:
c01038bc:	55                   	push   %ebp
c01038bd:	89 e5                	mov    %esp,%ebp
c01038bf:	83 ec 10             	sub    $0x10,%esp
c01038c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01038c5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01038cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038d1:	c9                   	leave  
c01038d2:	c3                   	ret    

c01038d3 <InitDescriptor>:
c01038d3:	55                   	push   %ebp
c01038d4:	89 e5                	mov    %esp,%ebp
c01038d6:	83 ec 04             	sub    $0x4,%esp
c01038d9:	8b 45 14             	mov    0x14(%ebp),%eax
c01038dc:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c01038e0:	8b 45 10             	mov    0x10(%ebp),%eax
c01038e3:	89 c2                	mov    %eax,%edx
c01038e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01038e8:	66 89 10             	mov    %dx,(%eax)
c01038eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038ee:	89 c2                	mov    %eax,%edx
c01038f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01038f3:	66 89 50 02          	mov    %dx,0x2(%eax)
c01038f7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038fa:	c1 e8 10             	shr    $0x10,%eax
c01038fd:	89 c2                	mov    %eax,%edx
c01038ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0103902:	88 50 04             	mov    %dl,0x4(%eax)
c0103905:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103909:	89 c2                	mov    %eax,%edx
c010390b:	8b 45 08             	mov    0x8(%ebp),%eax
c010390e:	88 50 05             	mov    %dl,0x5(%eax)
c0103911:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103915:	66 c1 e8 08          	shr    $0x8,%ax
c0103919:	c1 e0 04             	shl    $0x4,%eax
c010391c:	89 c2                	mov    %eax,%edx
c010391e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103921:	c1 e8 10             	shr    $0x10,%eax
c0103924:	83 e0 0f             	and    $0xf,%eax
c0103927:	09 c2                	or     %eax,%edx
c0103929:	8b 45 08             	mov    0x8(%ebp),%eax
c010392c:	88 50 06             	mov    %dl,0x6(%eax)
c010392f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103932:	c1 e8 18             	shr    $0x18,%eax
c0103935:	89 c2                	mov    %eax,%edx
c0103937:	8b 45 08             	mov    0x8(%ebp),%eax
c010393a:	88 50 07             	mov    %dl,0x7(%eax)
c010393d:	90                   	nop
c010393e:	c9                   	leave  
c010393f:	c3                   	ret    

c0103940 <Seg2PhyAddr>:
c0103940:	55                   	push   %ebp
c0103941:	89 e5                	mov    %esp,%ebp
c0103943:	83 ec 10             	sub    $0x10,%esp
c0103946:	8b 45 08             	mov    0x8(%ebp),%eax
c0103949:	c1 e8 03             	shr    $0x3,%eax
c010394c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103953:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c010395a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010395d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103960:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103964:	0f b7 c0             	movzwl %ax,%eax
c0103967:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010396b:	0f b6 d2             	movzbl %dl,%edx
c010396e:	c1 e2 10             	shl    $0x10,%edx
c0103971:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103977:	09 d0                	or     %edx,%eax
c0103979:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010397c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010397f:	c9                   	leave  
c0103980:	c3                   	ret    

c0103981 <Seg2PhyAddrLDT>:
c0103981:	55                   	push   %ebp
c0103982:	89 e5                	mov    %esp,%ebp
c0103984:	83 ec 10             	sub    $0x10,%esp
c0103987:	8b 45 08             	mov    0x8(%ebp),%eax
c010398a:	c1 e8 03             	shr    $0x3,%eax
c010398d:	89 c2                	mov    %eax,%edx
c010398f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103992:	83 c2 20             	add    $0x20,%edx
c0103995:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103999:	8b 02                	mov    (%edx),%eax
c010399b:	8b 52 04             	mov    0x4(%edx),%edx
c010399e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01039a1:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01039a4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01039a8:	0f b7 c0             	movzwl %ax,%eax
c01039ab:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c01039af:	0f b6 d2             	movzbl %dl,%edx
c01039b2:	c1 e2 10             	shl    $0x10,%edx
c01039b5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c01039bb:	09 d0                	or     %edx,%eax
c01039bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01039c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01039c3:	c9                   	leave  
c01039c4:	c3                   	ret    

c01039c5 <VirAddr2PhyAddr>:
c01039c5:	55                   	push   %ebp
c01039c6:	89 e5                	mov    %esp,%ebp
c01039c8:	83 ec 10             	sub    $0x10,%esp
c01039cb:	8b 55 0c             	mov    0xc(%ebp),%edx
c01039ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01039d1:	01 d0                	add    %edx,%eax
c01039d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01039d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01039d9:	c9                   	leave  
c01039da:	c3                   	ret    

c01039db <v2l>:
c01039db:	55                   	push   %ebp
c01039dc:	89 e5                	mov    %esp,%ebp
c01039de:	83 ec 18             	sub    $0x18,%esp
c01039e1:	83 ec 0c             	sub    $0xc,%esp
c01039e4:	ff 75 08             	pushl  0x8(%ebp)
c01039e7:	e8 4a fe ff ff       	call   c0103836 <pid2proc>
c01039ec:	83 c4 10             	add    $0x10,%esp
c01039ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01039f2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01039f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01039fc:	83 ec 08             	sub    $0x8,%esp
c01039ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0103a02:	50                   	push   %eax
c0103a03:	e8 79 ff ff ff       	call   c0103981 <Seg2PhyAddrLDT>
c0103a08:	83 c4 10             	add    $0x10,%esp
c0103a0b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103a0e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103a11:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a14:	01 d0                	add    %edx,%eax
c0103a16:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103a19:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a1c:	c9                   	leave  
c0103a1d:	c3                   	ret    

c0103a1e <init_propt>:
c0103a1e:	55                   	push   %ebp
c0103a1f:	89 e5                	mov    %esp,%ebp
c0103a21:	83 ec 38             	sub    $0x38,%esp
c0103a24:	6a 0e                	push   $0xe
c0103a26:	6a 08                	push   $0x8
c0103a28:	68 71 01 10 c0       	push   $0xc0100171
c0103a2d:	6a 20                	push   $0x20
c0103a2f:	e8 6b 01 00 00       	call   c0103b9f <InitInterruptDesc>
c0103a34:	83 c4 10             	add    $0x10,%esp
c0103a37:	6a 0e                	push   $0xe
c0103a39:	6a 08                	push   $0x8
c0103a3b:	68 9f 01 10 c0       	push   $0xc010019f
c0103a40:	6a 21                	push   $0x21
c0103a42:	e8 58 01 00 00       	call   c0103b9f <InitInterruptDesc>
c0103a47:	83 c4 10             	add    $0x10,%esp
c0103a4a:	6a 0e                	push   $0xe
c0103a4c:	6a 08                	push   $0x8
c0103a4e:	68 e2 01 10 c0       	push   $0xc01001e2
c0103a53:	6a 2e                	push   $0x2e
c0103a55:	e8 45 01 00 00       	call   c0103b9f <InitInterruptDesc>
c0103a5a:	83 c4 10             	add    $0x10,%esp
c0103a5d:	6a 0e                	push   $0xe
c0103a5f:	6a 08                	push   $0x8
c0103a61:	68 28 02 10 c0       	push   $0xc0100228
c0103a66:	6a 2a                	push   $0x2a
c0103a68:	e8 32 01 00 00       	call   c0103b9f <InitInterruptDesc>
c0103a6d:	83 c4 10             	add    $0x10,%esp
c0103a70:	83 ec 04             	sub    $0x4,%esp
c0103a73:	68 e0 15 00 00       	push   $0x15e0
c0103a78:	6a 00                	push   $0x0
c0103a7a:	68 00 22 18 c0       	push   $0xc0182200
c0103a7f:	e8 4b 87 00 00       	call   c010c1cf <Memset>
c0103a84:	83 c4 10             	add    $0x10,%esp
c0103a87:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103a8e:	83 ec 04             	sub    $0x4,%esp
c0103a91:	ff 75 f4             	pushl  -0xc(%ebp)
c0103a94:	6a 00                	push   $0x0
c0103a96:	68 40 06 11 c0       	push   $0xc0110640
c0103a9b:	e8 2f 87 00 00       	call   c010c1cf <Memset>
c0103aa0:	83 c4 10             	add    $0x10,%esp
c0103aa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103aa6:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103aab:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103ab2:	00 00 00 
c0103ab5:	83 ec 0c             	sub    $0xc,%esp
c0103ab8:	6a 30                	push   $0x30
c0103aba:	e8 81 fe ff ff       	call   c0103940 <Seg2PhyAddr>
c0103abf:	83 c4 10             	add    $0x10,%esp
c0103ac2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103ac5:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103acc:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103ad3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103ad6:	0f b7 d0             	movzwl %ax,%edx
c0103ad9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103adc:	83 e8 01             	sub    $0x1,%eax
c0103adf:	89 c1                	mov    %eax,%ecx
c0103ae1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103ae4:	52                   	push   %edx
c0103ae5:	51                   	push   %ecx
c0103ae6:	50                   	push   %eax
c0103ae7:	68 00 f8 10 c0       	push   $0xc010f800
c0103aec:	e8 e2 fd ff ff       	call   c01038d3 <InitDescriptor>
c0103af1:	83 c4 10             	add    $0x10,%esp
c0103af4:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103afb:	68 f2 00 00 00       	push   $0xf2
c0103b00:	68 ff ff 00 00       	push   $0xffff
c0103b05:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103b08:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103b0d:	e8 c1 fd ff ff       	call   c01038d3 <InitDescriptor>
c0103b12:	83 c4 10             	add    $0x10,%esp
c0103b15:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103b1c:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103b23:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103b2a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103b2d:	0f b7 c0             	movzwl %ax,%eax
c0103b30:	50                   	push   %eax
c0103b31:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b34:	6a 00                	push   $0x0
c0103b36:	68 08 f8 10 c0       	push   $0xc010f808
c0103b3b:	e8 93 fd ff ff       	call   c01038d3 <InitDescriptor>
c0103b40:	83 c4 10             	add    $0x10,%esp
c0103b43:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103b46:	0f b7 c0             	movzwl %ax,%eax
c0103b49:	50                   	push   %eax
c0103b4a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b4d:	6a 00                	push   $0x0
c0103b4f:	68 10 f8 10 c0       	push   $0xc010f810
c0103b54:	e8 7a fd ff ff       	call   c01038d3 <InitDescriptor>
c0103b59:	83 c4 10             	add    $0x10,%esp
c0103b5c:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103b63:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103b6a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103b6d:	0f b7 c0             	movzwl %ax,%eax
c0103b70:	50                   	push   %eax
c0103b71:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b74:	6a 00                	push   $0x0
c0103b76:	68 18 f8 10 c0       	push   $0xc010f818
c0103b7b:	e8 53 fd ff ff       	call   c01038d3 <InitDescriptor>
c0103b80:	83 c4 10             	add    $0x10,%esp
c0103b83:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103b86:	0f b7 c0             	movzwl %ax,%eax
c0103b89:	50                   	push   %eax
c0103b8a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b8d:	6a 00                	push   $0x0
c0103b8f:	68 20 f8 10 c0       	push   $0xc010f820
c0103b94:	e8 3a fd ff ff       	call   c01038d3 <InitDescriptor>
c0103b99:	83 c4 10             	add    $0x10,%esp
c0103b9c:	90                   	nop
c0103b9d:	c9                   	leave  
c0103b9e:	c3                   	ret    

c0103b9f <InitInterruptDesc>:
c0103b9f:	55                   	push   %ebp
c0103ba0:	89 e5                	mov    %esp,%ebp
c0103ba2:	83 ec 10             	sub    $0x10,%esp
c0103ba5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ba8:	c1 e0 03             	shl    $0x3,%eax
c0103bab:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103bb0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103bb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bb6:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103bba:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103bbd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103bc0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103bc3:	89 c2                	mov    %eax,%edx
c0103bc5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bc8:	66 89 10             	mov    %dx,(%eax)
c0103bcb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bce:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103bd4:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103bd7:	c1 f8 10             	sar    $0x10,%eax
c0103bda:	89 c2                	mov    %eax,%edx
c0103bdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bdf:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103be3:	8b 45 10             	mov    0x10(%ebp),%eax
c0103be6:	c1 e0 04             	shl    $0x4,%eax
c0103be9:	89 c2                	mov    %eax,%edx
c0103beb:	8b 45 14             	mov    0x14(%ebp),%eax
c0103bee:	09 d0                	or     %edx,%eax
c0103bf0:	89 c2                	mov    %eax,%edx
c0103bf2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103bf5:	88 50 05             	mov    %dl,0x5(%eax)
c0103bf8:	90                   	nop
c0103bf9:	c9                   	leave  
c0103bfa:	c3                   	ret    

c0103bfb <ReloadGDT>:
c0103bfb:	55                   	push   %ebp
c0103bfc:	89 e5                	mov    %esp,%ebp
c0103bfe:	83 ec 28             	sub    $0x28,%esp
c0103c01:	b8 d0 06 11 c0       	mov    $0xc01106d0,%eax
c0103c06:	0f b7 00             	movzwl (%eax),%eax
c0103c09:	98                   	cwtl   
c0103c0a:	ba d2 06 11 c0       	mov    $0xc01106d2,%edx
c0103c0f:	8b 12                	mov    (%edx),%edx
c0103c11:	83 ec 04             	sub    $0x4,%esp
c0103c14:	50                   	push   %eax
c0103c15:	52                   	push   %edx
c0103c16:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103c1b:	e8 81 85 00 00       	call   c010c1a1 <Memcpy2>
c0103c20:	83 c4 10             	add    $0x10,%esp
c0103c23:	c7 45 f0 d0 06 11 c0 	movl   $0xc01106d0,-0x10(%ebp)
c0103c2a:	c7 45 ec d2 06 11 c0 	movl   $0xc01106d2,-0x14(%ebp)
c0103c31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103c34:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103c39:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103c3e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103c41:	89 10                	mov    %edx,(%eax)
c0103c43:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103c4a:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103c51:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c54:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103c59:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103c5e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103c61:	89 10                	mov    %edx,(%eax)
c0103c63:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103c6a:	eb 04                	jmp    c0103c70 <ReloadGDT+0x75>
c0103c6c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103c70:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103c77:	7e f3                	jle    c0103c6c <ReloadGDT+0x71>
c0103c79:	e8 a9 37 00 00       	call   c0107427 <init_internal_interrupt>
c0103c7e:	e8 9b fd ff ff       	call   c0103a1e <init_propt>
c0103c83:	90                   	nop
c0103c84:	c9                   	leave  
c0103c85:	c3                   	ret    

c0103c86 <select_console>:
c0103c86:	55                   	push   %ebp
c0103c87:	89 e5                	mov    %esp,%ebp
c0103c89:	83 ec 18             	sub    $0x18,%esp
c0103c8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c8f:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103c92:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103c96:	75 27                	jne    c0103cbf <select_console+0x39>
c0103c98:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103c9c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103ca2:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103ca7:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103cac:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103cb1:	83 ec 0c             	sub    $0xc,%esp
c0103cb4:	50                   	push   %eax
c0103cb5:	e8 08 00 00 00       	call   c0103cc2 <flush>
c0103cba:	83 c4 10             	add    $0x10,%esp
c0103cbd:	eb 01                	jmp    c0103cc0 <select_console+0x3a>
c0103cbf:	90                   	nop
c0103cc0:	c9                   	leave  
c0103cc1:	c3                   	ret    

c0103cc2 <flush>:
c0103cc2:	55                   	push   %ebp
c0103cc3:	89 e5                	mov    %esp,%ebp
c0103cc5:	83 ec 08             	sub    $0x8,%esp
c0103cc8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ccb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103cd1:	8b 40 0c             	mov    0xc(%eax),%eax
c0103cd4:	83 ec 0c             	sub    $0xc,%esp
c0103cd7:	50                   	push   %eax
c0103cd8:	e8 1e 00 00 00       	call   c0103cfb <set_cursor>
c0103cdd:	83 c4 10             	add    $0x10,%esp
c0103ce0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ce3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ce9:	8b 40 08             	mov    0x8(%eax),%eax
c0103cec:	83 ec 0c             	sub    $0xc,%esp
c0103cef:	50                   	push   %eax
c0103cf0:	e8 64 00 00 00       	call   c0103d59 <set_console_start_video_addr>
c0103cf5:	83 c4 10             	add    $0x10,%esp
c0103cf8:	90                   	nop
c0103cf9:	c9                   	leave  
c0103cfa:	c3                   	ret    

c0103cfb <set_cursor>:
c0103cfb:	55                   	push   %ebp
c0103cfc:	89 e5                	mov    %esp,%ebp
c0103cfe:	83 ec 08             	sub    $0x8,%esp
c0103d01:	83 ec 08             	sub    $0x8,%esp
c0103d04:	6a 0e                	push   $0xe
c0103d06:	68 d4 03 00 00       	push   $0x3d4
c0103d0b:	e8 e0 c5 ff ff       	call   c01002f0 <out_byte>
c0103d10:	83 c4 10             	add    $0x10,%esp
c0103d13:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d16:	c1 e8 08             	shr    $0x8,%eax
c0103d19:	0f b7 c0             	movzwl %ax,%eax
c0103d1c:	83 ec 08             	sub    $0x8,%esp
c0103d1f:	50                   	push   %eax
c0103d20:	68 d5 03 00 00       	push   $0x3d5
c0103d25:	e8 c6 c5 ff ff       	call   c01002f0 <out_byte>
c0103d2a:	83 c4 10             	add    $0x10,%esp
c0103d2d:	83 ec 08             	sub    $0x8,%esp
c0103d30:	6a 0f                	push   $0xf
c0103d32:	68 d4 03 00 00       	push   $0x3d4
c0103d37:	e8 b4 c5 ff ff       	call   c01002f0 <out_byte>
c0103d3c:	83 c4 10             	add    $0x10,%esp
c0103d3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d42:	0f b7 c0             	movzwl %ax,%eax
c0103d45:	83 ec 08             	sub    $0x8,%esp
c0103d48:	50                   	push   %eax
c0103d49:	68 d5 03 00 00       	push   $0x3d5
c0103d4e:	e8 9d c5 ff ff       	call   c01002f0 <out_byte>
c0103d53:	83 c4 10             	add    $0x10,%esp
c0103d56:	90                   	nop
c0103d57:	c9                   	leave  
c0103d58:	c3                   	ret    

c0103d59 <set_console_start_video_addr>:
c0103d59:	55                   	push   %ebp
c0103d5a:	89 e5                	mov    %esp,%ebp
c0103d5c:	83 ec 08             	sub    $0x8,%esp
c0103d5f:	83 ec 08             	sub    $0x8,%esp
c0103d62:	6a 0c                	push   $0xc
c0103d64:	68 d4 03 00 00       	push   $0x3d4
c0103d69:	e8 82 c5 ff ff       	call   c01002f0 <out_byte>
c0103d6e:	83 c4 10             	add    $0x10,%esp
c0103d71:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d74:	c1 e8 08             	shr    $0x8,%eax
c0103d77:	0f b7 c0             	movzwl %ax,%eax
c0103d7a:	83 ec 08             	sub    $0x8,%esp
c0103d7d:	50                   	push   %eax
c0103d7e:	68 d5 03 00 00       	push   $0x3d5
c0103d83:	e8 68 c5 ff ff       	call   c01002f0 <out_byte>
c0103d88:	83 c4 10             	add    $0x10,%esp
c0103d8b:	83 ec 08             	sub    $0x8,%esp
c0103d8e:	6a 0d                	push   $0xd
c0103d90:	68 d4 03 00 00       	push   $0x3d4
c0103d95:	e8 56 c5 ff ff       	call   c01002f0 <out_byte>
c0103d9a:	83 c4 10             	add    $0x10,%esp
c0103d9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103da0:	0f b7 c0             	movzwl %ax,%eax
c0103da3:	83 ec 08             	sub    $0x8,%esp
c0103da6:	50                   	push   %eax
c0103da7:	68 d5 03 00 00       	push   $0x3d5
c0103dac:	e8 3f c5 ff ff       	call   c01002f0 <out_byte>
c0103db1:	83 c4 10             	add    $0x10,%esp
c0103db4:	90                   	nop
c0103db5:	c9                   	leave  
c0103db6:	c3                   	ret    

c0103db7 <put_key>:
c0103db7:	55                   	push   %ebp
c0103db8:	89 e5                	mov    %esp,%ebp
c0103dba:	83 ec 04             	sub    $0x4,%esp
c0103dbd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103dc0:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103dc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dc6:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103dcc:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103dd1:	77 4d                	ja     c0103e20 <put_key+0x69>
c0103dd3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dd6:	8b 00                	mov    (%eax),%eax
c0103dd8:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103ddc:	89 10                	mov    %edx,(%eax)
c0103dde:	8b 45 08             	mov    0x8(%ebp),%eax
c0103de1:	8b 00                	mov    (%eax),%eax
c0103de3:	8d 50 04             	lea    0x4(%eax),%edx
c0103de6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103de9:	89 10                	mov    %edx,(%eax)
c0103deb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dee:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103df4:	8d 50 01             	lea    0x1(%eax),%edx
c0103df7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dfa:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103e00:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e03:	8b 00                	mov    (%eax),%eax
c0103e05:	8b 55 08             	mov    0x8(%ebp),%edx
c0103e08:	83 c2 08             	add    $0x8,%edx
c0103e0b:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103e11:	39 d0                	cmp    %edx,%eax
c0103e13:	75 0b                	jne    c0103e20 <put_key+0x69>
c0103e15:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e18:	8d 50 08             	lea    0x8(%eax),%edx
c0103e1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e1e:	89 10                	mov    %edx,(%eax)
c0103e20:	90                   	nop
c0103e21:	c9                   	leave  
c0103e22:	c3                   	ret    

c0103e23 <scroll_up>:
c0103e23:	55                   	push   %ebp
c0103e24:	89 e5                	mov    %esp,%ebp
c0103e26:	83 ec 08             	sub    $0x8,%esp
c0103e29:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e2c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e32:	8b 40 08             	mov    0x8(%eax),%eax
c0103e35:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103e38:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e3b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e41:	8b 00                	mov    (%eax),%eax
c0103e43:	39 c2                	cmp    %eax,%edx
c0103e45:	76 1b                	jbe    c0103e62 <scroll_up+0x3f>
c0103e47:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e4a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e50:	8b 40 08             	mov    0x8(%eax),%eax
c0103e53:	83 e8 50             	sub    $0x50,%eax
c0103e56:	83 ec 0c             	sub    $0xc,%esp
c0103e59:	50                   	push   %eax
c0103e5a:	e8 fa fe ff ff       	call   c0103d59 <set_console_start_video_addr>
c0103e5f:	83 c4 10             	add    $0x10,%esp
c0103e62:	90                   	nop
c0103e63:	c9                   	leave  
c0103e64:	c3                   	ret    

c0103e65 <scroll_down>:
c0103e65:	55                   	push   %ebp
c0103e66:	89 e5                	mov    %esp,%ebp
c0103e68:	83 ec 08             	sub    $0x8,%esp
c0103e6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e6e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e74:	8b 40 08             	mov    0x8(%eax),%eax
c0103e77:	8d 48 50             	lea    0x50(%eax),%ecx
c0103e7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e7d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e83:	8b 10                	mov    (%eax),%edx
c0103e85:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e88:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e8e:	8b 40 04             	mov    0x4(%eax),%eax
c0103e91:	01 d0                	add    %edx,%eax
c0103e93:	39 c1                	cmp    %eax,%ecx
c0103e95:	73 36                	jae    c0103ecd <scroll_down+0x68>
c0103e97:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e9a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ea0:	8b 40 08             	mov    0x8(%eax),%eax
c0103ea3:	83 c0 50             	add    $0x50,%eax
c0103ea6:	83 ec 0c             	sub    $0xc,%esp
c0103ea9:	50                   	push   %eax
c0103eaa:	e8 aa fe ff ff       	call   c0103d59 <set_console_start_video_addr>
c0103eaf:	83 c4 10             	add    $0x10,%esp
c0103eb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ebb:	8b 50 08             	mov    0x8(%eax),%edx
c0103ebe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ec1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ec7:	83 c2 50             	add    $0x50,%edx
c0103eca:	89 50 08             	mov    %edx,0x8(%eax)
c0103ecd:	90                   	nop
c0103ece:	c9                   	leave  
c0103ecf:	c3                   	ret    

c0103ed0 <out_char>:
c0103ed0:	55                   	push   %ebp
c0103ed1:	89 e5                	mov    %esp,%ebp
c0103ed3:	83 ec 28             	sub    $0x28,%esp
c0103ed6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ed9:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103edc:	e8 a7 2d 00 00       	call   c0106c88 <intr_disable>
c0103ee1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103ee4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ee7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eed:	8b 40 0c             	mov    0xc(%eax),%eax
c0103ef0:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103ef5:	01 c0                	add    %eax,%eax
c0103ef7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103efa:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103efe:	83 f8 08             	cmp    $0x8,%eax
c0103f01:	0f 84 8d 00 00 00    	je     c0103f94 <out_char+0xc4>
c0103f07:	83 f8 0a             	cmp    $0xa,%eax
c0103f0a:	0f 85 c9 00 00 00    	jne    c0103fd9 <out_char+0x109>
c0103f10:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f13:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f19:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f1f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f25:	8b 08                	mov    (%eax),%ecx
c0103f27:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f2a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f30:	8b 40 04             	mov    0x4(%eax),%eax
c0103f33:	01 c8                	add    %ecx,%eax
c0103f35:	83 e8 50             	sub    $0x50,%eax
c0103f38:	39 c2                	cmp    %eax,%edx
c0103f3a:	0f 83 f4 00 00 00    	jae    c0104034 <out_char+0x164>
c0103f40:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f43:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f49:	8b 08                	mov    (%eax),%ecx
c0103f4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f4e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f54:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f57:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f5a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f60:	8b 00                	mov    (%eax),%eax
c0103f62:	29 c2                	sub    %eax,%edx
c0103f64:	89 d0                	mov    %edx,%eax
c0103f66:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103f6b:	f7 e2                	mul    %edx
c0103f6d:	89 d0                	mov    %edx,%eax
c0103f6f:	c1 e8 06             	shr    $0x6,%eax
c0103f72:	8d 50 01             	lea    0x1(%eax),%edx
c0103f75:	89 d0                	mov    %edx,%eax
c0103f77:	c1 e0 02             	shl    $0x2,%eax
c0103f7a:	01 d0                	add    %edx,%eax
c0103f7c:	c1 e0 04             	shl    $0x4,%eax
c0103f7f:	89 c2                	mov    %eax,%edx
c0103f81:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f84:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f8a:	01 ca                	add    %ecx,%edx
c0103f8c:	89 50 0c             	mov    %edx,0xc(%eax)
c0103f8f:	e9 a0 00 00 00       	jmp    c0104034 <out_char+0x164>
c0103f94:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f97:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f9d:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fa0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fa3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fa9:	8b 00                	mov    (%eax),%eax
c0103fab:	39 c2                	cmp    %eax,%edx
c0103fad:	0f 86 84 00 00 00    	jbe    c0104037 <out_char+0x167>
c0103fb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fb6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fbc:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fbf:	83 ea 01             	sub    $0x1,%edx
c0103fc2:	89 50 0c             	mov    %edx,0xc(%eax)
c0103fc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103fc8:	83 e8 02             	sub    $0x2,%eax
c0103fcb:	c6 00 20             	movb   $0x20,(%eax)
c0103fce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103fd1:	83 e8 01             	sub    $0x1,%eax
c0103fd4:	c6 00 00             	movb   $0x0,(%eax)
c0103fd7:	eb 5e                	jmp    c0104037 <out_char+0x167>
c0103fd9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fdc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fe2:	8b 40 0c             	mov    0xc(%eax),%eax
c0103fe5:	8d 48 01             	lea    0x1(%eax),%ecx
c0103fe8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103feb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ff1:	8b 10                	mov    (%eax),%edx
c0103ff3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ffc:	8b 40 04             	mov    0x4(%eax),%eax
c0103fff:	01 d0                	add    %edx,%eax
c0104001:	39 c1                	cmp    %eax,%ecx
c0104003:	73 35                	jae    c010403a <out_char+0x16a>
c0104005:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104008:	8d 50 01             	lea    0x1(%eax),%edx
c010400b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010400e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0104012:	88 10                	mov    %dl,(%eax)
c0104014:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104017:	8d 50 01             	lea    0x1(%eax),%edx
c010401a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010401d:	c6 00 0a             	movb   $0xa,(%eax)
c0104020:	8b 45 08             	mov    0x8(%ebp),%eax
c0104023:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104029:	8b 50 0c             	mov    0xc(%eax),%edx
c010402c:	83 c2 01             	add    $0x1,%edx
c010402f:	89 50 0c             	mov    %edx,0xc(%eax)
c0104032:	eb 06                	jmp    c010403a <out_char+0x16a>
c0104034:	90                   	nop
c0104035:	eb 14                	jmp    c010404b <out_char+0x17b>
c0104037:	90                   	nop
c0104038:	eb 11                	jmp    c010404b <out_char+0x17b>
c010403a:	90                   	nop
c010403b:	eb 0e                	jmp    c010404b <out_char+0x17b>
c010403d:	83 ec 0c             	sub    $0xc,%esp
c0104040:	ff 75 08             	pushl  0x8(%ebp)
c0104043:	e8 1d fe ff ff       	call   c0103e65 <scroll_down>
c0104048:	83 c4 10             	add    $0x10,%esp
c010404b:	8b 45 08             	mov    0x8(%ebp),%eax
c010404e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104054:	8b 50 0c             	mov    0xc(%eax),%edx
c0104057:	8b 45 08             	mov    0x8(%ebp),%eax
c010405a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104060:	8b 40 08             	mov    0x8(%eax),%eax
c0104063:	29 c2                	sub    %eax,%edx
c0104065:	89 d0                	mov    %edx,%eax
c0104067:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c010406c:	77 cf                	ja     c010403d <out_char+0x16d>
c010406e:	83 ec 0c             	sub    $0xc,%esp
c0104071:	ff 75 08             	pushl  0x8(%ebp)
c0104074:	e8 49 fc ff ff       	call   c0103cc2 <flush>
c0104079:	83 c4 10             	add    $0x10,%esp
c010407c:	83 ec 0c             	sub    $0xc,%esp
c010407f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104082:	e8 2a 2c 00 00       	call   c0106cb1 <intr_set_status>
c0104087:	83 c4 10             	add    $0x10,%esp
c010408a:	90                   	nop
c010408b:	c9                   	leave  
c010408c:	c3                   	ret    

c010408d <tty_dev_read>:
c010408d:	55                   	push   %ebp
c010408e:	89 e5                	mov    %esp,%ebp
c0104090:	83 ec 08             	sub    $0x8,%esp
c0104093:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104098:	39 45 08             	cmp    %eax,0x8(%ebp)
c010409b:	75 17                	jne    c01040b4 <tty_dev_read+0x27>
c010409d:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01040a2:	85 c0                	test   %eax,%eax
c01040a4:	7e 0e                	jle    c01040b4 <tty_dev_read+0x27>
c01040a6:	83 ec 0c             	sub    $0xc,%esp
c01040a9:	ff 75 08             	pushl  0x8(%ebp)
c01040ac:	e8 89 07 00 00       	call   c010483a <keyboard_read>
c01040b1:	83 c4 10             	add    $0x10,%esp
c01040b4:	90                   	nop
c01040b5:	c9                   	leave  
c01040b6:	c3                   	ret    

c01040b7 <tty_dev_write>:
c01040b7:	55                   	push   %ebp
c01040b8:	89 e5                	mov    %esp,%ebp
c01040ba:	83 ec 28             	sub    $0x28,%esp
c01040bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01040c0:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01040c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01040c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01040d0:	e9 88 01 00 00       	jmp    c010425d <tty_dev_write+0x1a6>
c01040d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01040d8:	8b 40 04             	mov    0x4(%eax),%eax
c01040db:	8b 00                	mov    (%eax),%eax
c01040dd:	88 45 e7             	mov    %al,-0x19(%ebp)
c01040e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01040e3:	8b 40 04             	mov    0x4(%eax),%eax
c01040e6:	8d 50 04             	lea    0x4(%eax),%edx
c01040e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ec:	89 50 04             	mov    %edx,0x4(%eax)
c01040ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01040f2:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01040f8:	8d 50 ff             	lea    -0x1(%eax),%edx
c01040fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01040fe:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104104:	8b 45 08             	mov    0x8(%ebp),%eax
c0104107:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010410d:	8d 50 01             	lea    0x1(%eax),%edx
c0104110:	8b 45 08             	mov    0x8(%ebp),%eax
c0104113:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104119:	8b 45 08             	mov    0x8(%ebp),%eax
c010411c:	8b 40 04             	mov    0x4(%eax),%eax
c010411f:	8b 55 08             	mov    0x8(%ebp),%edx
c0104122:	83 c2 08             	add    $0x8,%edx
c0104125:	81 c2 00 08 00 00    	add    $0x800,%edx
c010412b:	39 d0                	cmp    %edx,%eax
c010412d:	75 0c                	jne    c010413b <tty_dev_write+0x84>
c010412f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104132:	8d 50 08             	lea    0x8(%eax),%edx
c0104135:	8b 45 08             	mov    0x8(%ebp),%eax
c0104138:	89 50 04             	mov    %edx,0x4(%eax)
c010413b:	8b 45 08             	mov    0x8(%ebp),%eax
c010413e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104144:	85 c0                	test   %eax,%eax
c0104146:	0f 84 11 01 00 00    	je     c010425d <tty_dev_write+0x1a6>
c010414c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104150:	3c 20                	cmp    $0x20,%al
c0104152:	76 08                	jbe    c010415c <tty_dev_write+0xa5>
c0104154:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104158:	3c 7e                	cmp    $0x7e,%al
c010415a:	76 10                	jbe    c010416c <tty_dev_write+0xb5>
c010415c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104160:	3c 20                	cmp    $0x20,%al
c0104162:	74 08                	je     c010416c <tty_dev_write+0xb5>
c0104164:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104168:	84 c0                	test   %al,%al
c010416a:	75 58                	jne    c01041c4 <tty_dev_write+0x10d>
c010416c:	8b 45 08             	mov    0x8(%ebp),%eax
c010416f:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104175:	8b 45 08             	mov    0x8(%ebp),%eax
c0104178:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010417e:	01 d0                	add    %edx,%eax
c0104180:	83 e8 01             	sub    $0x1,%eax
c0104183:	89 c2                	mov    %eax,%edx
c0104185:	83 ec 04             	sub    $0x4,%esp
c0104188:	6a 01                	push   $0x1
c010418a:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010418d:	50                   	push   %eax
c010418e:	52                   	push   %edx
c010418f:	e8 58 2b 00 00       	call   c0106cec <Memcpy>
c0104194:	83 c4 10             	add    $0x10,%esp
c0104197:	8b 45 08             	mov    0x8(%ebp),%eax
c010419a:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01041a0:	8d 50 ff             	lea    -0x1(%eax),%edx
c01041a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01041a6:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01041ac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041b0:	0f b6 c0             	movzbl %al,%eax
c01041b3:	83 ec 08             	sub    $0x8,%esp
c01041b6:	50                   	push   %eax
c01041b7:	ff 75 08             	pushl  0x8(%ebp)
c01041ba:	e8 11 fd ff ff       	call   c0103ed0 <out_char>
c01041bf:	83 c4 10             	add    $0x10,%esp
c01041c2:	eb 7c                	jmp    c0104240 <tty_dev_write+0x189>
c01041c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041c8:	3c 08                	cmp    $0x8,%al
c01041ca:	75 42                	jne    c010420e <tty_dev_write+0x157>
c01041cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01041cf:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01041d5:	8d 50 01             	lea    0x1(%eax),%edx
c01041d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01041db:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01041e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01041e4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01041ea:	8d 50 fe             	lea    -0x2(%eax),%edx
c01041ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01041f0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01041f6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041fa:	0f b6 c0             	movzbl %al,%eax
c01041fd:	83 ec 08             	sub    $0x8,%esp
c0104200:	50                   	push   %eax
c0104201:	ff 75 08             	pushl  0x8(%ebp)
c0104204:	e8 c7 fc ff ff       	call   c0103ed0 <out_char>
c0104209:	83 c4 10             	add    $0x10,%esp
c010420c:	eb 32                	jmp    c0104240 <tty_dev_write+0x189>
c010420e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104212:	3c 0a                	cmp    $0xa,%al
c0104214:	75 2a                	jne    c0104240 <tty_dev_write+0x189>
c0104216:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010421a:	0f b6 c0             	movzbl %al,%eax
c010421d:	83 ec 08             	sub    $0x8,%esp
c0104220:	50                   	push   %eax
c0104221:	ff 75 08             	pushl  0x8(%ebp)
c0104224:	e8 a7 fc ff ff       	call   c0103ed0 <out_char>
c0104229:	83 c4 10             	add    $0x10,%esp
c010422c:	8b 45 08             	mov    0x8(%ebp),%eax
c010422f:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0104236:	00 00 00 
c0104239:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104240:	8b 45 08             	mov    0x8(%ebp),%eax
c0104243:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104249:	8b 45 08             	mov    0x8(%ebp),%eax
c010424c:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0104252:	39 c2                	cmp    %eax,%edx
c0104254:	75 07                	jne    c010425d <tty_dev_write+0x1a6>
c0104256:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010425d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104260:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104266:	85 c0                	test   %eax,%eax
c0104268:	0f 85 67 fe ff ff    	jne    c01040d5 <tty_dev_write+0x1e>
c010426e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104272:	74 6d                	je     c01042e1 <tty_dev_write+0x22a>
c0104274:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c010427b:	83 ec 0c             	sub    $0xc,%esp
c010427e:	ff 75 ec             	pushl  -0x14(%ebp)
c0104281:	e8 b6 d3 ff ff       	call   c010163c <sys_malloc>
c0104286:	83 c4 10             	add    $0x10,%esp
c0104289:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010428c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010428f:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104296:	8b 45 08             	mov    0x8(%ebp),%eax
c0104299:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010429f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042a2:	89 50 60             	mov    %edx,0x60(%eax)
c01042a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a8:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c01042ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042b1:	89 50 68             	mov    %edx,0x68(%eax)
c01042b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01042b7:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01042bd:	83 ec 04             	sub    $0x4,%esp
c01042c0:	50                   	push   %eax
c01042c1:	ff 75 e8             	pushl  -0x18(%ebp)
c01042c4:	6a 01                	push   $0x1
c01042c6:	e8 aa 52 00 00       	call   c0109575 <send_rec>
c01042cb:	83 c4 10             	add    $0x10,%esp
c01042ce:	83 ec 08             	sub    $0x8,%esp
c01042d1:	ff 75 ec             	pushl  -0x14(%ebp)
c01042d4:	ff 75 e8             	pushl  -0x18(%ebp)
c01042d7:	e8 75 d3 ff ff       	call   c0101651 <sys_free>
c01042dc:	83 c4 10             	add    $0x10,%esp
c01042df:	eb 01                	jmp    c01042e2 <tty_dev_write+0x22b>
c01042e1:	90                   	nop
c01042e2:	c9                   	leave  
c01042e3:	c3                   	ret    

c01042e4 <tty_do_read>:
c01042e4:	55                   	push   %ebp
c01042e5:	89 e5                	mov    %esp,%ebp
c01042e7:	83 ec 08             	sub    $0x8,%esp
c01042ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01042ed:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01042f4:	00 00 00 
c01042f7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042fa:	8b 50 68             	mov    0x68(%eax),%edx
c01042fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0104300:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104306:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104309:	8b 00                	mov    (%eax),%eax
c010430b:	89 c2                	mov    %eax,%edx
c010430d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104310:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0104316:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104319:	8b 50 60             	mov    0x60(%eax),%edx
c010431c:	8b 45 08             	mov    0x8(%ebp),%eax
c010431f:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104325:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104328:	8b 50 60             	mov    0x60(%eax),%edx
c010432b:	8b 45 08             	mov    0x8(%ebp),%eax
c010432e:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0104334:	8b 45 08             	mov    0x8(%ebp),%eax
c0104337:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c010433d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104340:	8b 40 10             	mov    0x10(%eax),%eax
c0104343:	83 ec 08             	sub    $0x8,%esp
c0104346:	52                   	push   %edx
c0104347:	50                   	push   %eax
c0104348:	e8 32 1b 00 00       	call   c0105e7f <alloc_virtual_memory>
c010434d:	83 c4 10             	add    $0x10,%esp
c0104350:	89 c2                	mov    %eax,%edx
c0104352:	8b 45 08             	mov    0x8(%ebp),%eax
c0104355:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c010435b:	8b 45 08             	mov    0x8(%ebp),%eax
c010435e:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104364:	83 f8 02             	cmp    $0x2,%eax
c0104367:	74 1c                	je     c0104385 <tty_do_read+0xa1>
c0104369:	68 3b 01 00 00       	push   $0x13b
c010436e:	68 05 b5 10 c0       	push   $0xc010b505
c0104373:	68 05 b5 10 c0       	push   $0xc010b505
c0104378:	68 0f b5 10 c0       	push   $0xc010b50f
c010437d:	e8 83 45 00 00       	call   c0108905 <assertion_failure>
c0104382:	83 c4 10             	add    $0x10,%esp
c0104385:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104388:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010438f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104392:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104398:	83 ec 04             	sub    $0x4,%esp
c010439b:	50                   	push   %eax
c010439c:	ff 75 0c             	pushl  0xc(%ebp)
c010439f:	6a 01                	push   $0x1
c01043a1:	e8 cf 51 00 00       	call   c0109575 <send_rec>
c01043a6:	83 c4 10             	add    $0x10,%esp
c01043a9:	90                   	nop
c01043aa:	c9                   	leave  
c01043ab:	c3                   	ret    

c01043ac <tty_do_write>:
c01043ac:	55                   	push   %ebp
c01043ad:	89 e5                	mov    %esp,%ebp
c01043af:	53                   	push   %ebx
c01043b0:	83 ec 24             	sub    $0x24,%esp
c01043b3:	89 e0                	mov    %esp,%eax
c01043b5:	89 c3                	mov    %eax,%ebx
c01043b7:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c01043be:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01043c1:	8d 50 ff             	lea    -0x1(%eax),%edx
c01043c4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01043c7:	89 c2                	mov    %eax,%edx
c01043c9:	b8 10 00 00 00       	mov    $0x10,%eax
c01043ce:	83 e8 01             	sub    $0x1,%eax
c01043d1:	01 d0                	add    %edx,%eax
c01043d3:	b9 10 00 00 00       	mov    $0x10,%ecx
c01043d8:	ba 00 00 00 00       	mov    $0x0,%edx
c01043dd:	f7 f1                	div    %ecx
c01043df:	6b c0 10             	imul   $0x10,%eax,%eax
c01043e2:	29 c4                	sub    %eax,%esp
c01043e4:	89 e0                	mov    %esp,%eax
c01043e6:	83 c0 00             	add    $0x0,%eax
c01043e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01043ec:	83 ec 04             	sub    $0x4,%esp
c01043ef:	ff 75 e8             	pushl  -0x18(%ebp)
c01043f2:	6a 00                	push   $0x0
c01043f4:	ff 75 e0             	pushl  -0x20(%ebp)
c01043f7:	e8 d3 7d 00 00       	call   c010c1cf <Memset>
c01043fc:	83 c4 10             	add    $0x10,%esp
c01043ff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104402:	8b 40 60             	mov    0x60(%eax),%eax
c0104405:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104408:	8b 45 08             	mov    0x8(%ebp),%eax
c010440b:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104412:	00 00 00 
c0104415:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104418:	8b 45 0c             	mov    0xc(%ebp),%eax
c010441b:	8b 40 10             	mov    0x10(%eax),%eax
c010441e:	83 ec 08             	sub    $0x8,%esp
c0104421:	52                   	push   %edx
c0104422:	50                   	push   %eax
c0104423:	e8 57 1a 00 00       	call   c0105e7f <alloc_virtual_memory>
c0104428:	83 c4 10             	add    $0x10,%esp
c010442b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010442e:	eb 7e                	jmp    c01044ae <tty_do_write+0x102>
c0104430:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104433:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0104436:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c010443a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010443d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104440:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104446:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104449:	01 d0                	add    %edx,%eax
c010444b:	83 ec 04             	sub    $0x4,%esp
c010444e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104451:	50                   	push   %eax
c0104452:	ff 75 e0             	pushl  -0x20(%ebp)
c0104455:	e8 92 28 00 00       	call   c0106cec <Memcpy>
c010445a:	83 c4 10             	add    $0x10,%esp
c010445d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104460:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104463:	8b 45 08             	mov    0x8(%ebp),%eax
c0104466:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010446c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010446f:	01 c2                	add    %eax,%edx
c0104471:	8b 45 08             	mov    0x8(%ebp),%eax
c0104474:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c010447a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104481:	eb 25                	jmp    c01044a8 <tty_do_write+0xfc>
c0104483:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104486:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104489:	01 d0                	add    %edx,%eax
c010448b:	0f b6 00             	movzbl (%eax),%eax
c010448e:	0f b6 c0             	movzbl %al,%eax
c0104491:	83 ec 08             	sub    $0x8,%esp
c0104494:	50                   	push   %eax
c0104495:	ff 75 08             	pushl  0x8(%ebp)
c0104498:	e8 33 fa ff ff       	call   c0103ed0 <out_char>
c010449d:	83 c4 10             	add    $0x10,%esp
c01044a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01044a4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c01044a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01044ac:	75 d5                	jne    c0104483 <tty_do_write+0xd7>
c01044ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01044b2:	0f 85 78 ff ff ff    	jne    c0104430 <tty_do_write+0x84>
c01044b8:	83 ec 0c             	sub    $0xc,%esp
c01044bb:	6a 7c                	push   $0x7c
c01044bd:	e8 7a d1 ff ff       	call   c010163c <sys_malloc>
c01044c2:	83 c4 10             	add    $0x10,%esp
c01044c5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01044c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01044cb:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01044d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01044d5:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01044db:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01044de:	89 50 58             	mov    %edx,0x58(%eax)
c01044e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01044e4:	8b 00                	mov    (%eax),%eax
c01044e6:	83 ec 04             	sub    $0x4,%esp
c01044e9:	50                   	push   %eax
c01044ea:	ff 75 d8             	pushl  -0x28(%ebp)
c01044ed:	6a 01                	push   $0x1
c01044ef:	e8 81 50 00 00       	call   c0109575 <send_rec>
c01044f4:	83 c4 10             	add    $0x10,%esp
c01044f7:	83 ec 08             	sub    $0x8,%esp
c01044fa:	6a 7c                	push   $0x7c
c01044fc:	ff 75 d8             	pushl  -0x28(%ebp)
c01044ff:	e8 4d d1 ff ff       	call   c0101651 <sys_free>
c0104504:	83 c4 10             	add    $0x10,%esp
c0104507:	89 dc                	mov    %ebx,%esp
c0104509:	90                   	nop
c010450a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010450d:	c9                   	leave  
c010450e:	c3                   	ret    

c010450f <init_screen>:
c010450f:	55                   	push   %ebp
c0104510:	89 e5                	mov    %esp,%ebp
c0104512:	83 ec 10             	sub    $0x10,%esp
c0104515:	8b 45 08             	mov    0x8(%ebp),%eax
c0104518:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010451d:	c1 f8 03             	sar    $0x3,%eax
c0104520:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104526:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104529:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010452c:	c1 e0 04             	shl    $0x4,%eax
c010452f:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c0104535:	8b 45 08             	mov    0x8(%ebp),%eax
c0104538:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c010453e:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104545:	8b 45 08             	mov    0x8(%ebp),%eax
c0104548:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010454e:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0104551:	89 50 04             	mov    %edx,0x4(%eax)
c0104554:	8b 45 08             	mov    0x8(%ebp),%eax
c0104557:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010455d:	8b 50 04             	mov    0x4(%eax),%edx
c0104560:	8b 45 08             	mov    0x8(%ebp),%eax
c0104563:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104569:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010456d:	89 10                	mov    %edx,(%eax)
c010456f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104572:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104578:	8b 45 08             	mov    0x8(%ebp),%eax
c010457b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104581:	8b 12                	mov    (%edx),%edx
c0104583:	89 50 08             	mov    %edx,0x8(%eax)
c0104586:	8b 55 08             	mov    0x8(%ebp),%edx
c0104589:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010458f:	8b 40 08             	mov    0x8(%eax),%eax
c0104592:	89 42 0c             	mov    %eax,0xc(%edx)
c0104595:	90                   	nop
c0104596:	c9                   	leave  
c0104597:	c3                   	ret    

c0104598 <init_tty>:
c0104598:	55                   	push   %ebp
c0104599:	89 e5                	mov    %esp,%ebp
c010459b:	83 ec 18             	sub    $0x18,%esp
c010459e:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01045a5:	e9 92 00 00 00       	jmp    c010463c <init_tty+0xa4>
c01045aa:	83 ec 04             	sub    $0x4,%esp
c01045ad:	68 28 08 00 00       	push   $0x828
c01045b2:	6a 00                	push   $0x0
c01045b4:	ff 75 f4             	pushl  -0xc(%ebp)
c01045b7:	e8 13 7c 00 00       	call   c010c1cf <Memset>
c01045bc:	83 c4 10             	add    $0x10,%esp
c01045bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045c2:	8d 50 08             	lea    0x8(%eax),%edx
c01045c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045c8:	89 50 04             	mov    %edx,0x4(%eax)
c01045cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045ce:	8b 50 04             	mov    0x4(%eax),%edx
c01045d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045d4:	89 10                	mov    %edx,(%eax)
c01045d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045d9:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c01045e0:	00 00 00 
c01045e3:	83 ec 0c             	sub    $0xc,%esp
c01045e6:	ff 75 f4             	pushl  -0xc(%ebp)
c01045e9:	e8 21 ff ff ff       	call   c010450f <init_screen>
c01045ee:	83 c4 10             	add    $0x10,%esp
c01045f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045f4:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01045f9:	85 c0                	test   %eax,%eax
c01045fb:	7e 38                	jle    c0104635 <init_tty+0x9d>
c01045fd:	83 ec 08             	sub    $0x8,%esp
c0104600:	6a 23                	push   $0x23
c0104602:	ff 75 f4             	pushl  -0xc(%ebp)
c0104605:	e8 c6 f8 ff ff       	call   c0103ed0 <out_char>
c010460a:	83 c4 10             	add    $0x10,%esp
c010460d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104610:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0104615:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010461a:	c1 f8 03             	sar    $0x3,%eax
c010461d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104623:	0f b6 c0             	movzbl %al,%eax
c0104626:	83 ec 08             	sub    $0x8,%esp
c0104629:	50                   	push   %eax
c010462a:	ff 75 f4             	pushl  -0xc(%ebp)
c010462d:	e8 9e f8 ff ff       	call   c0103ed0 <out_char>
c0104632:	83 c4 10             	add    $0x10,%esp
c0104635:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010463c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104641:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104644:	0f 82 60 ff ff ff    	jb     c01045aa <init_tty+0x12>
c010464a:	90                   	nop
c010464b:	c9                   	leave  
c010464c:	c3                   	ret    

c010464d <TaskTTY>:
c010464d:	55                   	push   %ebp
c010464e:	89 e5                	mov    %esp,%ebp
c0104650:	83 ec 28             	sub    $0x28,%esp
c0104653:	e8 40 ff ff ff       	call   c0104598 <init_tty>
c0104658:	83 ec 0c             	sub    $0xc,%esp
c010465b:	6a 00                	push   $0x0
c010465d:	e8 24 f6 ff ff       	call   c0103c86 <select_console>
c0104662:	83 c4 10             	add    $0x10,%esp
c0104665:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010466c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104673:	83 ec 0c             	sub    $0xc,%esp
c0104676:	6a 7c                	push   $0x7c
c0104678:	e8 bf cf ff ff       	call   c010163c <sys_malloc>
c010467d:	83 c4 10             	add    $0x10,%esp
c0104680:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104683:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c010468a:	eb 30                	jmp    c01046bc <TaskTTY+0x6f>
c010468c:	83 ec 0c             	sub    $0xc,%esp
c010468f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104692:	e8 f6 f9 ff ff       	call   c010408d <tty_dev_read>
c0104697:	83 c4 10             	add    $0x10,%esp
c010469a:	83 ec 0c             	sub    $0xc,%esp
c010469d:	ff 75 f4             	pushl  -0xc(%ebp)
c01046a0:	e8 12 fa ff ff       	call   c01040b7 <tty_dev_write>
c01046a5:	83 c4 10             	add    $0x10,%esp
c01046a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01046ab:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01046b1:	85 c0                	test   %eax,%eax
c01046b3:	75 d7                	jne    c010468c <TaskTTY+0x3f>
c01046b5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01046bc:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01046c1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01046c4:	72 c6                	jb     c010468c <TaskTTY+0x3f>
c01046c6:	83 ec 04             	sub    $0x4,%esp
c01046c9:	6a 12                	push   $0x12
c01046cb:	ff 75 e8             	pushl  -0x18(%ebp)
c01046ce:	6a 02                	push   $0x2
c01046d0:	e8 a0 4e 00 00       	call   c0109575 <send_rec>
c01046d5:	83 c4 10             	add    $0x10,%esp
c01046d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01046db:	8b 40 78             	mov    0x78(%eax),%eax
c01046de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01046e1:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01046e8:	74 28                	je     c0104712 <TaskTTY+0xc5>
c01046ea:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01046f1:	7f 0b                	jg     c01046fe <TaskTTY+0xb1>
c01046f3:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c01046fa:	74 4e                	je     c010474a <TaskTTY+0xfd>
c01046fc:	eb 4d                	jmp    c010474b <TaskTTY+0xfe>
c01046fe:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104705:	74 21                	je     c0104728 <TaskTTY+0xdb>
c0104707:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c010470e:	74 2e                	je     c010473e <TaskTTY+0xf1>
c0104710:	eb 39                	jmp    c010474b <TaskTTY+0xfe>
c0104712:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104717:	83 ec 08             	sub    $0x8,%esp
c010471a:	ff 75 e8             	pushl  -0x18(%ebp)
c010471d:	50                   	push   %eax
c010471e:	e8 c1 fb ff ff       	call   c01042e4 <tty_do_read>
c0104723:	83 c4 10             	add    $0x10,%esp
c0104726:	eb 23                	jmp    c010474b <TaskTTY+0xfe>
c0104728:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c010472d:	83 ec 08             	sub    $0x8,%esp
c0104730:	ff 75 e8             	pushl  -0x18(%ebp)
c0104733:	50                   	push   %eax
c0104734:	e8 73 fc ff ff       	call   c01043ac <tty_do_write>
c0104739:	83 c4 10             	add    $0x10,%esp
c010473c:	eb 0d                	jmp    c010474b <TaskTTY+0xfe>
c010473e:	c7 05 c4 06 11 c0 00 	movl   $0x0,0xc01106c4
c0104745:	00 00 00 
c0104748:	eb 01                	jmp    c010474b <TaskTTY+0xfe>
c010474a:	90                   	nop
c010474b:	e9 33 ff ff ff       	jmp    c0104683 <TaskTTY+0x36>

c0104750 <keyboard_handler>:
c0104750:	55                   	push   %ebp
c0104751:	89 e5                	mov    %esp,%ebp
c0104753:	83 ec 18             	sub    $0x18,%esp
c0104756:	c7 05 c4 06 11 c0 01 	movl   $0x1,0xc01106c4
c010475d:	00 00 00 
c0104760:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104767:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010476c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104771:	7f 5e                	jg     c01047d1 <keyboard_handler+0x81>
c0104773:	e8 9a bb ff ff       	call   c0100312 <disable_int>
c0104778:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010477b:	0f b7 c0             	movzwl %ax,%eax
c010477e:	83 ec 0c             	sub    $0xc,%esp
c0104781:	50                   	push   %eax
c0104782:	e8 5d bb ff ff       	call   c01002e4 <in_byte>
c0104787:	83 c4 10             	add    $0x10,%esp
c010478a:	88 45 f3             	mov    %al,-0xd(%ebp)
c010478d:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104792:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104796:	88 10                	mov    %dl,(%eax)
c0104798:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010479d:	83 c0 01             	add    $0x1,%eax
c01047a0:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c01047a5:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047aa:	83 c0 01             	add    $0x1,%eax
c01047ad:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01047b2:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01047b7:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01047bc:	39 d0                	cmp    %edx,%eax
c01047be:	72 0a                	jb     c01047ca <keyboard_handler+0x7a>
c01047c0:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01047c7:	fb 10 c0 
c01047ca:	e8 45 bb ff ff       	call   c0100314 <enable_int>
c01047cf:	eb 01                	jmp    c01047d2 <keyboard_handler+0x82>
c01047d1:	90                   	nop
c01047d2:	c9                   	leave  
c01047d3:	c3                   	ret    

c01047d4 <read_from_keyboard_buf>:
c01047d4:	55                   	push   %ebp
c01047d5:	89 e5                	mov    %esp,%ebp
c01047d7:	83 ec 18             	sub    $0x18,%esp
c01047da:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c01047de:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047e3:	85 c0                	test   %eax,%eax
c01047e5:	7f 06                	jg     c01047ed <read_from_keyboard_buf+0x19>
c01047e7:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01047eb:	eb 4b                	jmp    c0104838 <read_from_keyboard_buf+0x64>
c01047ed:	e8 20 bb ff ff       	call   c0100312 <disable_int>
c01047f2:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01047f7:	0f b6 00             	movzbl (%eax),%eax
c01047fa:	88 45 f7             	mov    %al,-0x9(%ebp)
c01047fd:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104802:	83 c0 01             	add    $0x1,%eax
c0104805:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010480a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010480f:	83 e8 01             	sub    $0x1,%eax
c0104812:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104817:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c010481c:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104821:	39 d0                	cmp    %edx,%eax
c0104823:	72 0a                	jb     c010482f <read_from_keyboard_buf+0x5b>
c0104825:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c010482c:	fb 10 c0 
c010482f:	e8 e0 ba ff ff       	call   c0100314 <enable_int>
c0104834:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104838:	c9                   	leave  
c0104839:	c3                   	ret    

c010483a <keyboard_read>:
c010483a:	55                   	push   %ebp
c010483b:	89 e5                	mov    %esp,%ebp
c010483d:	83 ec 28             	sub    $0x28,%esp
c0104840:	90                   	nop
c0104841:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104846:	85 c0                	test   %eax,%eax
c0104848:	7e f7                	jle    c0104841 <keyboard_read+0x7>
c010484a:	e8 85 ff ff ff       	call   c01047d4 <read_from_keyboard_buf>
c010484f:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104852:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104859:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010485d:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104861:	75 5a                	jne    c01048bd <keyboard_read+0x83>
c0104863:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104867:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c010486b:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010486f:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104873:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104877:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c010487b:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010487f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104886:	eb 20                	jmp    c01048a8 <keyboard_read+0x6e>
c0104888:	e8 47 ff ff ff       	call   c01047d4 <read_from_keyboard_buf>
c010488d:	89 c1                	mov    %eax,%ecx
c010488f:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104892:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104895:	01 d0                	add    %edx,%eax
c0104897:	0f b6 00             	movzbl (%eax),%eax
c010489a:	38 c1                	cmp    %al,%cl
c010489c:	74 06                	je     c01048a4 <keyboard_read+0x6a>
c010489e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c01048a2:	eb 0a                	jmp    c01048ae <keyboard_read+0x74>
c01048a4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01048a8:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c01048ac:	7e da                	jle    c0104888 <keyboard_read+0x4e>
c01048ae:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c01048b2:	74 68                	je     c010491c <keyboard_read+0xe2>
c01048b4:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c01048bb:	eb 5f                	jmp    c010491c <keyboard_read+0xe2>
c01048bd:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c01048c1:	75 59                	jne    c010491c <keyboard_read+0xe2>
c01048c3:	e8 0c ff ff ff       	call   c01047d4 <read_from_keyboard_buf>
c01048c8:	3c 2a                	cmp    $0x2a,%al
c01048ca:	75 1d                	jne    c01048e9 <keyboard_read+0xaf>
c01048cc:	e8 03 ff ff ff       	call   c01047d4 <read_from_keyboard_buf>
c01048d1:	3c e0                	cmp    $0xe0,%al
c01048d3:	75 14                	jne    c01048e9 <keyboard_read+0xaf>
c01048d5:	e8 fa fe ff ff       	call   c01047d4 <read_from_keyboard_buf>
c01048da:	3c 37                	cmp    $0x37,%al
c01048dc:	75 0b                	jne    c01048e9 <keyboard_read+0xaf>
c01048de:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01048e5:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c01048e9:	e8 e6 fe ff ff       	call   c01047d4 <read_from_keyboard_buf>
c01048ee:	3c b7                	cmp    $0xb7,%al
c01048f0:	75 1d                	jne    c010490f <keyboard_read+0xd5>
c01048f2:	e8 dd fe ff ff       	call   c01047d4 <read_from_keyboard_buf>
c01048f7:	3c e0                	cmp    $0xe0,%al
c01048f9:	75 14                	jne    c010490f <keyboard_read+0xd5>
c01048fb:	e8 d4 fe ff ff       	call   c01047d4 <read_from_keyboard_buf>
c0104900:	3c aa                	cmp    $0xaa,%al
c0104902:	75 0b                	jne    c010490f <keyboard_read+0xd5>
c0104904:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c010490b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010490f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104913:	75 07                	jne    c010491c <keyboard_read+0xe2>
c0104915:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c010491c:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104923:	0f 84 8d 00 00 00    	je     c01049b6 <keyboard_read+0x17c>
c0104929:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0104930:	0f 84 80 00 00 00    	je     c01049b6 <keyboard_read+0x17c>
c0104936:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c010493a:	0f 94 c2             	sete   %dl
c010493d:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104941:	0f 94 c0             	sete   %al
c0104944:	09 d0                	or     %edx,%eax
c0104946:	84 c0                	test   %al,%al
c0104948:	74 07                	je     c0104951 <keyboard_read+0x117>
c010494a:	c6 05 cc 06 11 c0 01 	movb   $0x1,0xc01106cc
c0104951:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104955:	f7 d0                	not    %eax
c0104957:	c0 e8 07             	shr    $0x7,%al
c010495a:	88 45 e9             	mov    %al,-0x17(%ebp)
c010495d:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104961:	74 53                	je     c01049b6 <keyboard_read+0x17c>
c0104963:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104967:	74 4d                	je     c01049b6 <keyboard_read+0x17c>
c0104969:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c010496d:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104974:	3c 01                	cmp    $0x1,%al
c0104976:	75 04                	jne    c010497c <keyboard_read+0x142>
c0104978:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c010497c:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104983:	84 c0                	test   %al,%al
c0104985:	74 04                	je     c010498b <keyboard_read+0x151>
c0104987:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c010498b:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c010498f:	89 d0                	mov    %edx,%eax
c0104991:	01 c0                	add    %eax,%eax
c0104993:	01 c2                	add    %eax,%edx
c0104995:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104999:	01 d0                	add    %edx,%eax
c010499b:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c01049a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01049a5:	83 ec 08             	sub    $0x8,%esp
c01049a8:	ff 75 f4             	pushl  -0xc(%ebp)
c01049ab:	ff 75 08             	pushl  0x8(%ebp)
c01049ae:	e8 1a 00 00 00       	call   c01049cd <in_process>
c01049b3:	83 c4 10             	add    $0x10,%esp
c01049b6:	90                   	nop
c01049b7:	c9                   	leave  
c01049b8:	c3                   	ret    

c01049b9 <init_keyboard_handler>:
c01049b9:	55                   	push   %ebp
c01049ba:	89 e5                	mov    %esp,%ebp
c01049bc:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01049c3:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c01049ca:	90                   	nop
c01049cb:	5d                   	pop    %ebp
c01049cc:	c3                   	ret    

c01049cd <in_process>:
c01049cd:	55                   	push   %ebp
c01049ce:	89 e5                	mov    %esp,%ebp
c01049d0:	83 ec 18             	sub    $0x18,%esp
c01049d3:	83 ec 04             	sub    $0x4,%esp
c01049d6:	6a 02                	push   $0x2
c01049d8:	6a 00                	push   $0x0
c01049da:	8d 45 f6             	lea    -0xa(%ebp),%eax
c01049dd:	50                   	push   %eax
c01049de:	e8 ec 77 00 00       	call   c010c1cf <Memset>
c01049e3:	83 c4 10             	add    $0x10,%esp
c01049e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049e9:	25 00 01 00 00       	and    $0x100,%eax
c01049ee:	85 c0                	test   %eax,%eax
c01049f0:	75 28                	jne    c0104a1a <in_process+0x4d>
c01049f2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049f5:	0f b6 c0             	movzbl %al,%eax
c01049f8:	83 ec 08             	sub    $0x8,%esp
c01049fb:	50                   	push   %eax
c01049fc:	ff 75 08             	pushl  0x8(%ebp)
c01049ff:	e8 b3 f3 ff ff       	call   c0103db7 <put_key>
c0104a04:	83 c4 10             	add    $0x10,%esp
c0104a07:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a0e:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104a15:	e9 42 01 00 00       	jmp    c0104b5c <in_process+0x18f>
c0104a1a:	0f b6 05 cc 06 11 c0 	movzbl 0xc01106cc,%eax
c0104a21:	84 c0                	test   %al,%al
c0104a23:	0f 84 a9 00 00 00    	je     c0104ad2 <in_process+0x105>
c0104a29:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0104a2d:	0f 84 9f 00 00 00    	je     c0104ad2 <in_process+0x105>
c0104a33:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104a37:	0f 84 95 00 00 00    	je     c0104ad2 <in_process+0x105>
c0104a3d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a44:	74 64                	je     c0104aaa <in_process+0xdd>
c0104a46:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a4d:	77 0b                	ja     c0104a5a <in_process+0x8d>
c0104a4f:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104a56:	74 64                	je     c0104abc <in_process+0xef>
c0104a58:	eb 73                	jmp    c0104acd <in_process+0x100>
c0104a5a:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104a61:	74 0b                	je     c0104a6e <in_process+0xa1>
c0104a63:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104a6a:	74 20                	je     c0104a8c <in_process+0xbf>
c0104a6c:	eb 5f                	jmp    c0104acd <in_process+0x100>
c0104a6e:	83 ec 0c             	sub    $0xc,%esp
c0104a71:	ff 75 08             	pushl  0x8(%ebp)
c0104a74:	e8 aa f3 ff ff       	call   c0103e23 <scroll_up>
c0104a79:	83 c4 10             	add    $0x10,%esp
c0104a7c:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104a83:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a8a:	eb 41                	jmp    c0104acd <in_process+0x100>
c0104a8c:	83 ec 0c             	sub    $0xc,%esp
c0104a8f:	ff 75 08             	pushl  0x8(%ebp)
c0104a92:	e8 ce f3 ff ff       	call   c0103e65 <scroll_down>
c0104a97:	83 c4 10             	add    $0x10,%esp
c0104a9a:	c6 05 cc 06 11 c0 00 	movb   $0x0,0xc01106cc
c0104aa1:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104aa8:	eb 23                	jmp    c0104acd <in_process+0x100>
c0104aaa:	83 ec 08             	sub    $0x8,%esp
c0104aad:	6a 0a                	push   $0xa
c0104aaf:	ff 75 08             	pushl  0x8(%ebp)
c0104ab2:	e8 19 f4 ff ff       	call   c0103ed0 <out_char>
c0104ab7:	83 c4 10             	add    $0x10,%esp
c0104aba:	eb 11                	jmp    c0104acd <in_process+0x100>
c0104abc:	83 ec 08             	sub    $0x8,%esp
c0104abf:	6a 08                	push   $0x8
c0104ac1:	ff 75 08             	pushl  0x8(%ebp)
c0104ac4:	e8 07 f4 ff ff       	call   c0103ed0 <out_char>
c0104ac9:	83 c4 10             	add    $0x10,%esp
c0104acc:	90                   	nop
c0104acd:	e9 8a 00 00 00       	jmp    c0104b5c <in_process+0x18f>
c0104ad2:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104ad9:	74 55                	je     c0104b30 <in_process+0x163>
c0104adb:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104ae2:	77 14                	ja     c0104af8 <in_process+0x12b>
c0104ae4:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104aeb:	74 31                	je     c0104b1e <in_process+0x151>
c0104aed:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104af4:	74 16                	je     c0104b0c <in_process+0x13f>
c0104af6:	eb 64                	jmp    c0104b5c <in_process+0x18f>
c0104af8:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104aff:	74 3e                	je     c0104b3f <in_process+0x172>
c0104b01:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104b08:	74 44                	je     c0104b4e <in_process+0x181>
c0104b0a:	eb 50                	jmp    c0104b5c <in_process+0x18f>
c0104b0c:	83 ec 08             	sub    $0x8,%esp
c0104b0f:	6a 0a                	push   $0xa
c0104b11:	ff 75 08             	pushl  0x8(%ebp)
c0104b14:	e8 9e f2 ff ff       	call   c0103db7 <put_key>
c0104b19:	83 c4 10             	add    $0x10,%esp
c0104b1c:	eb 3e                	jmp    c0104b5c <in_process+0x18f>
c0104b1e:	83 ec 08             	sub    $0x8,%esp
c0104b21:	6a 08                	push   $0x8
c0104b23:	ff 75 08             	pushl  0x8(%ebp)
c0104b26:	e8 8c f2 ff ff       	call   c0103db7 <put_key>
c0104b2b:	83 c4 10             	add    $0x10,%esp
c0104b2e:	eb 2c                	jmp    c0104b5c <in_process+0x18f>
c0104b30:	83 ec 0c             	sub    $0xc,%esp
c0104b33:	6a 00                	push   $0x0
c0104b35:	e8 4c f1 ff ff       	call   c0103c86 <select_console>
c0104b3a:	83 c4 10             	add    $0x10,%esp
c0104b3d:	eb 1d                	jmp    c0104b5c <in_process+0x18f>
c0104b3f:	83 ec 0c             	sub    $0xc,%esp
c0104b42:	6a 01                	push   $0x1
c0104b44:	e8 3d f1 ff ff       	call   c0103c86 <select_console>
c0104b49:	83 c4 10             	add    $0x10,%esp
c0104b4c:	eb 0e                	jmp    c0104b5c <in_process+0x18f>
c0104b4e:	83 ec 0c             	sub    $0xc,%esp
c0104b51:	6a 02                	push   $0x2
c0104b53:	e8 2e f1 ff ff       	call   c0103c86 <select_console>
c0104b58:	83 c4 10             	add    $0x10,%esp
c0104b5b:	90                   	nop
c0104b5c:	90                   	nop
c0104b5d:	c9                   	leave  
c0104b5e:	c3                   	ret    

c0104b5f <open>:
c0104b5f:	55                   	push   %ebp
c0104b60:	89 e5                	mov    %esp,%ebp
c0104b62:	83 ec 18             	sub    $0x18,%esp
c0104b65:	83 ec 0c             	sub    $0xc,%esp
c0104b68:	6a 7c                	push   $0x7c
c0104b6a:	e8 cd ca ff ff       	call   c010163c <sys_malloc>
c0104b6f:	83 c4 10             	add    $0x10,%esp
c0104b72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104b75:	83 ec 04             	sub    $0x4,%esp
c0104b78:	6a 7c                	push   $0x7c
c0104b7a:	6a 00                	push   $0x0
c0104b7c:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b7f:	e8 4b 76 00 00       	call   c010c1cf <Memset>
c0104b84:	83 c4 10             	add    $0x10,%esp
c0104b87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b8a:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104b91:	83 ec 0c             	sub    $0xc,%esp
c0104b94:	ff 75 08             	pushl  0x8(%ebp)
c0104b97:	e8 32 14 00 00       	call   c0105fce <get_physical_address>
c0104b9c:	83 c4 10             	add    $0x10,%esp
c0104b9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104ba2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ba5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ba8:	89 50 44             	mov    %edx,0x44(%eax)
c0104bab:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104bae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bb1:	89 50 74             	mov    %edx,0x74(%eax)
c0104bb4:	83 ec 0c             	sub    $0xc,%esp
c0104bb7:	ff 75 08             	pushl  0x8(%ebp)
c0104bba:	e8 49 76 00 00       	call   c010c208 <Strlen>
c0104bbf:	83 c4 10             	add    $0x10,%esp
c0104bc2:	89 c2                	mov    %eax,%edx
c0104bc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bc7:	89 50 40             	mov    %edx,0x40(%eax)
c0104bca:	83 ec 04             	sub    $0x4,%esp
c0104bcd:	6a 02                	push   $0x2
c0104bcf:	ff 75 f4             	pushl  -0xc(%ebp)
c0104bd2:	6a 03                	push   $0x3
c0104bd4:	e8 9c 49 00 00       	call   c0109575 <send_rec>
c0104bd9:	83 c4 10             	add    $0x10,%esp
c0104bdc:	83 ec 08             	sub    $0x8,%esp
c0104bdf:	6a 7c                	push   $0x7c
c0104be1:	ff 75 f4             	pushl  -0xc(%ebp)
c0104be4:	e8 68 ca ff ff       	call   c0101651 <sys_free>
c0104be9:	83 c4 10             	add    $0x10,%esp
c0104bec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bef:	8b 40 50             	mov    0x50(%eax),%eax
c0104bf2:	c9                   	leave  
c0104bf3:	c3                   	ret    

c0104bf4 <read>:
c0104bf4:	55                   	push   %ebp
c0104bf5:	89 e5                	mov    %esp,%ebp
c0104bf7:	83 ec 38             	sub    $0x38,%esp
c0104bfa:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104c01:	83 ec 0c             	sub    $0xc,%esp
c0104c04:	ff 75 dc             	pushl  -0x24(%ebp)
c0104c07:	e8 30 ca ff ff       	call   c010163c <sys_malloc>
c0104c0c:	83 c4 10             	add    $0x10,%esp
c0104c0f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104c12:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104c15:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104c1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104c1d:	83 ec 0c             	sub    $0xc,%esp
c0104c20:	ff 75 0c             	pushl  0xc(%ebp)
c0104c23:	e8 a6 13 00 00       	call   c0105fce <get_physical_address>
c0104c28:	83 c4 10             	add    $0x10,%esp
c0104c2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c31:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104c36:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104c39:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104c3c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104c41:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104c44:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104c4b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104c52:	8b 55 10             	mov    0x10(%ebp),%edx
c0104c55:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c58:	01 d0                	add    %edx,%eax
c0104c5a:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104c5d:	0f 83 a8 00 00 00    	jae    c0104d0b <read+0x117>
c0104c63:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104c66:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104c69:	05 00 10 00 00       	add    $0x1000,%eax
c0104c6e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104c71:	8b 45 10             	mov    0x10(%ebp),%eax
c0104c74:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104c77:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104c7a:	83 ec 04             	sub    $0x4,%esp
c0104c7d:	50                   	push   %eax
c0104c7e:	6a 00                	push   $0x0
c0104c80:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c83:	e8 47 75 00 00       	call   c010c1cf <Memset>
c0104c88:	83 c4 10             	add    $0x10,%esp
c0104c8b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c8e:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104c95:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c98:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c9b:	89 50 50             	mov    %edx,0x50(%eax)
c0104c9e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ca1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ca4:	89 50 10             	mov    %edx,0x10(%eax)
c0104ca7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104caa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104cad:	89 50 60             	mov    %edx,0x60(%eax)
c0104cb0:	83 ec 04             	sub    $0x4,%esp
c0104cb3:	6a 02                	push   $0x2
c0104cb5:	ff 75 d8             	pushl  -0x28(%ebp)
c0104cb8:	6a 03                	push   $0x3
c0104cba:	e8 b6 48 00 00       	call   c0109575 <send_rec>
c0104cbf:	83 c4 10             	add    $0x10,%esp
c0104cc2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cc5:	8b 40 60             	mov    0x60(%eax),%eax
c0104cc8:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104ccb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104cce:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104cd1:	8b 45 10             	mov    0x10(%ebp),%eax
c0104cd4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104cd7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104cda:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104cdd:	89 45 10             	mov    %eax,0x10(%ebp)
c0104ce0:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104ce7:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104cee:	83 ec 0c             	sub    $0xc,%esp
c0104cf1:	ff 75 f4             	pushl  -0xc(%ebp)
c0104cf4:	e8 d5 12 00 00       	call   c0105fce <get_physical_address>
c0104cf9:	83 c4 10             	add    $0x10,%esp
c0104cfc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104cff:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104d03:	0f 85 6e ff ff ff    	jne    c0104c77 <read+0x83>
c0104d09:	eb 54                	jmp    c0104d5f <read+0x16b>
c0104d0b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104d0e:	83 ec 04             	sub    $0x4,%esp
c0104d11:	50                   	push   %eax
c0104d12:	6a 00                	push   $0x0
c0104d14:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d17:	e8 b3 74 00 00       	call   c010c1cf <Memset>
c0104d1c:	83 c4 10             	add    $0x10,%esp
c0104d1f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d22:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104d29:	8b 55 08             	mov    0x8(%ebp),%edx
c0104d2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d2f:	89 50 50             	mov    %edx,0x50(%eax)
c0104d32:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d35:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104d38:	89 50 10             	mov    %edx,0x10(%eax)
c0104d3b:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d3e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d41:	89 50 60             	mov    %edx,0x60(%eax)
c0104d44:	83 ec 04             	sub    $0x4,%esp
c0104d47:	6a 02                	push   $0x2
c0104d49:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d4c:	6a 03                	push   $0x3
c0104d4e:	e8 22 48 00 00       	call   c0109575 <send_rec>
c0104d53:	83 c4 10             	add    $0x10,%esp
c0104d56:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d59:	8b 40 60             	mov    0x60(%eax),%eax
c0104d5c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104d5f:	83 ec 08             	sub    $0x8,%esp
c0104d62:	ff 75 dc             	pushl  -0x24(%ebp)
c0104d65:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d68:	e8 e4 c8 ff ff       	call   c0101651 <sys_free>
c0104d6d:	83 c4 10             	add    $0x10,%esp
c0104d70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104d73:	c9                   	leave  
c0104d74:	c3                   	ret    

c0104d75 <write>:
c0104d75:	55                   	push   %ebp
c0104d76:	89 e5                	mov    %esp,%ebp
c0104d78:	83 ec 18             	sub    $0x18,%esp
c0104d7b:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104d82:	83 ec 0c             	sub    $0xc,%esp
c0104d85:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d88:	e8 af c8 ff ff       	call   c010163c <sys_malloc>
c0104d8d:	83 c4 10             	add    $0x10,%esp
c0104d90:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104d93:	83 ec 0c             	sub    $0xc,%esp
c0104d96:	ff 75 0c             	pushl  0xc(%ebp)
c0104d99:	e8 30 12 00 00       	call   c0105fce <get_physical_address>
c0104d9e:	83 c4 10             	add    $0x10,%esp
c0104da1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104da4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104da7:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104dae:	8b 55 08             	mov    0x8(%ebp),%edx
c0104db1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104db4:	89 50 50             	mov    %edx,0x50(%eax)
c0104db7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dba:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104dbd:	89 50 10             	mov    %edx,0x10(%eax)
c0104dc0:	8b 55 10             	mov    0x10(%ebp),%edx
c0104dc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dc6:	89 50 60             	mov    %edx,0x60(%eax)
c0104dc9:	83 ec 04             	sub    $0x4,%esp
c0104dcc:	6a 02                	push   $0x2
c0104dce:	ff 75 f0             	pushl  -0x10(%ebp)
c0104dd1:	6a 03                	push   $0x3
c0104dd3:	e8 9d 47 00 00       	call   c0109575 <send_rec>
c0104dd8:	83 c4 10             	add    $0x10,%esp
c0104ddb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dde:	8b 40 60             	mov    0x60(%eax),%eax
c0104de1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104de4:	83 ec 08             	sub    $0x8,%esp
c0104de7:	ff 75 f4             	pushl  -0xc(%ebp)
c0104dea:	ff 75 f0             	pushl  -0x10(%ebp)
c0104ded:	e8 5f c8 ff ff       	call   c0101651 <sys_free>
c0104df2:	83 c4 10             	add    $0x10,%esp
c0104df5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104df8:	c9                   	leave  
c0104df9:	c3                   	ret    

c0104dfa <close>:
c0104dfa:	55                   	push   %ebp
c0104dfb:	89 e5                	mov    %esp,%ebp
c0104dfd:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e03:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104e0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e0d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104e10:	83 ec 04             	sub    $0x4,%esp
c0104e13:	6a 02                	push   $0x2
c0104e15:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e1b:	50                   	push   %eax
c0104e1c:	6a 03                	push   $0x3
c0104e1e:	e8 52 47 00 00       	call   c0109575 <send_rec>
c0104e23:	83 c4 10             	add    $0x10,%esp
c0104e26:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e29:	83 f8 65             	cmp    $0x65,%eax
c0104e2c:	74 19                	je     c0104e47 <close+0x4d>
c0104e2e:	6a 13                	push   $0x13
c0104e30:	68 27 b5 10 c0       	push   $0xc010b527
c0104e35:	68 27 b5 10 c0       	push   $0xc010b527
c0104e3a:	68 33 b5 10 c0       	push   $0xc010b533
c0104e3f:	e8 c1 3a 00 00       	call   c0108905 <assertion_failure>
c0104e44:	83 c4 10             	add    $0x10,%esp
c0104e47:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104e4a:	c9                   	leave  
c0104e4b:	c3                   	ret    

c0104e4c <wait>:
c0104e4c:	55                   	push   %ebp
c0104e4d:	89 e5                	mov    %esp,%ebp
c0104e4f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e55:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104e5c:	83 ec 04             	sub    $0x4,%esp
c0104e5f:	6a 01                	push   $0x1
c0104e61:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e67:	50                   	push   %eax
c0104e68:	6a 03                	push   $0x3
c0104e6a:	e8 06 47 00 00       	call   c0109575 <send_rec>
c0104e6f:	83 c4 10             	add    $0x10,%esp
c0104e72:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104e75:	89 c2                	mov    %eax,%edx
c0104e77:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e7a:	89 10                	mov    %edx,(%eax)
c0104e7c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e7f:	83 f8 21             	cmp    $0x21,%eax
c0104e82:	74 05                	je     c0104e89 <wait+0x3d>
c0104e84:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e87:	eb 05                	jmp    c0104e8e <wait+0x42>
c0104e89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104e8e:	c9                   	leave  
c0104e8f:	c3                   	ret    

c0104e90 <exit>:
c0104e90:	55                   	push   %ebp
c0104e91:	89 e5                	mov    %esp,%ebp
c0104e93:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e99:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104ea0:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ea3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104ea6:	83 ec 04             	sub    $0x4,%esp
c0104ea9:	6a 01                	push   $0x1
c0104eab:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104eb1:	50                   	push   %eax
c0104eb2:	6a 03                	push   $0x3
c0104eb4:	e8 bc 46 00 00       	call   c0109575 <send_rec>
c0104eb9:	83 c4 10             	add    $0x10,%esp
c0104ebc:	90                   	nop
c0104ebd:	c9                   	leave  
c0104ebe:	c3                   	ret    

c0104ebf <fork>:
c0104ebf:	55                   	push   %ebp
c0104ec0:	89 e5                	mov    %esp,%ebp
c0104ec2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ec8:	83 ec 04             	sub    $0x4,%esp
c0104ecb:	6a 7c                	push   $0x7c
c0104ecd:	6a 00                	push   $0x0
c0104ecf:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ed5:	50                   	push   %eax
c0104ed6:	e8 f4 72 00 00       	call   c010c1cf <Memset>
c0104edb:	83 c4 10             	add    $0x10,%esp
c0104ede:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104ee5:	83 ec 04             	sub    $0x4,%esp
c0104ee8:	6a 01                	push   $0x1
c0104eea:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ef0:	50                   	push   %eax
c0104ef1:	6a 03                	push   $0x3
c0104ef3:	e8 7d 46 00 00       	call   c0109575 <send_rec>
c0104ef8:	83 c4 10             	add    $0x10,%esp
c0104efb:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104f02:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f05:	c9                   	leave  
c0104f06:	c3                   	ret    

c0104f07 <getpid>:
c0104f07:	55                   	push   %ebp
c0104f08:	89 e5                	mov    %esp,%ebp
c0104f0a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f10:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104f17:	83 ec 04             	sub    $0x4,%esp
c0104f1a:	6a 05                	push   $0x5
c0104f1c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f22:	50                   	push   %eax
c0104f23:	6a 03                	push   $0x3
c0104f25:	e8 4b 46 00 00       	call   c0109575 <send_rec>
c0104f2a:	83 c4 10             	add    $0x10,%esp
c0104f2d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104f30:	c9                   	leave  
c0104f31:	c3                   	ret    

c0104f32 <exec>:
c0104f32:	55                   	push   %ebp
c0104f33:	89 e5                	mov    %esp,%ebp
c0104f35:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104f3b:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104f42:	8b 45 08             	mov    0x8(%ebp),%eax
c0104f45:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104f48:	83 ec 0c             	sub    $0xc,%esp
c0104f4b:	ff 75 08             	pushl  0x8(%ebp)
c0104f4e:	e8 b5 72 00 00       	call   c010c208 <Strlen>
c0104f53:	83 c4 10             	add    $0x10,%esp
c0104f56:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104f59:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104f60:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104f67:	83 ec 04             	sub    $0x4,%esp
c0104f6a:	6a 01                	push   $0x1
c0104f6c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f72:	50                   	push   %eax
c0104f73:	6a 03                	push   $0x3
c0104f75:	e8 fb 45 00 00       	call   c0109575 <send_rec>
c0104f7a:	83 c4 10             	add    $0x10,%esp
c0104f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104f80:	83 f8 65             	cmp    $0x65,%eax
c0104f83:	74 19                	je     c0104f9e <exec+0x6c>
c0104f85:	6a 19                	push   $0x19
c0104f87:	68 4b b5 10 c0       	push   $0xc010b54b
c0104f8c:	68 4b b5 10 c0       	push   $0xc010b54b
c0104f91:	68 56 b5 10 c0       	push   $0xc010b556
c0104f96:	e8 6a 39 00 00       	call   c0108905 <assertion_failure>
c0104f9b:	83 c4 10             	add    $0x10,%esp
c0104f9e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104fa1:	c9                   	leave  
c0104fa2:	c3                   	ret    

c0104fa3 <execv>:
c0104fa3:	55                   	push   %ebp
c0104fa4:	89 e5                	mov    %esp,%ebp
c0104fa6:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104fac:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104fb3:	83 ec 0c             	sub    $0xc,%esp
c0104fb6:	ff 75 e0             	pushl  -0x20(%ebp)
c0104fb9:	e8 7e c6 ff ff       	call   c010163c <sys_malloc>
c0104fbe:	83 c4 10             	add    $0x10,%esp
c0104fc1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104fc4:	66 87 db             	xchg   %bx,%bx
c0104fc7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104fca:	83 ec 04             	sub    $0x4,%esp
c0104fcd:	50                   	push   %eax
c0104fce:	6a 00                	push   $0x0
c0104fd0:	ff 75 dc             	pushl  -0x24(%ebp)
c0104fd3:	e8 f7 71 00 00       	call   c010c1cf <Memset>
c0104fd8:	83 c4 10             	add    $0x10,%esp
c0104fdb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104fde:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104fe1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104fe8:	eb 23                	jmp    c010500d <execv+0x6a>
c0104fea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104fed:	8b 00                	mov    (%eax),%eax
c0104fef:	83 ec 08             	sub    $0x8,%esp
c0104ff2:	50                   	push   %eax
c0104ff3:	68 6e b5 10 c0       	push   $0xc010b56e
c0104ff8:	e8 ab 35 00 00       	call   c01085a8 <Printf>
c0104ffd:	83 c4 10             	add    $0x10,%esp
c0105000:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0105004:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105007:	83 c0 04             	add    $0x4,%eax
c010500a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010500d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105010:	8b 00                	mov    (%eax),%eax
c0105012:	85 c0                	test   %eax,%eax
c0105014:	75 d4                	jne    c0104fea <execv+0x47>
c0105016:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105019:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010501c:	01 d0                	add    %edx,%eax
c010501e:	c6 00 00             	movb   $0x0,(%eax)
c0105021:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105024:	83 c0 04             	add    $0x4,%eax
c0105027:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010502a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010502d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105030:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105033:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105036:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010503d:	eb 5b                	jmp    c010509a <execv+0xf7>
c010503f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105042:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105045:	01 c2                	add    %eax,%edx
c0105047:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010504a:	89 10                	mov    %edx,(%eax)
c010504c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010504f:	8b 00                	mov    (%eax),%eax
c0105051:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0105054:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0105057:	01 ca                	add    %ecx,%edx
c0105059:	83 ec 08             	sub    $0x8,%esp
c010505c:	50                   	push   %eax
c010505d:	52                   	push   %edx
c010505e:	e8 8b 71 00 00       	call   c010c1ee <Strcpy>
c0105063:	83 c4 10             	add    $0x10,%esp
c0105066:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105069:	8b 00                	mov    (%eax),%eax
c010506b:	83 ec 0c             	sub    $0xc,%esp
c010506e:	50                   	push   %eax
c010506f:	e8 94 71 00 00       	call   c010c208 <Strlen>
c0105074:	83 c4 10             	add    $0x10,%esp
c0105077:	01 45 f0             	add    %eax,-0x10(%ebp)
c010507a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010507d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105080:	01 d0                	add    %edx,%eax
c0105082:	c6 00 00             	movb   $0x0,(%eax)
c0105085:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105088:	83 c0 01             	add    $0x1,%eax
c010508b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010508e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0105092:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0105096:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010509a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010509d:	8b 00                	mov    (%eax),%eax
c010509f:	85 c0                	test   %eax,%eax
c01050a1:	75 9c                	jne    c010503f <execv+0x9c>
c01050a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050a6:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c01050ab:	29 c2                	sub    %eax,%edx
c01050ad:	89 d0                	mov    %edx,%eax
c01050af:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01050b2:	83 ec 0c             	sub    $0xc,%esp
c01050b5:	ff 75 08             	pushl  0x8(%ebp)
c01050b8:	e8 11 0f 00 00       	call   c0105fce <get_physical_address>
c01050bd:	83 c4 10             	add    $0x10,%esp
c01050c0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01050c3:	83 ec 0c             	sub    $0xc,%esp
c01050c6:	ff 75 dc             	pushl  -0x24(%ebp)
c01050c9:	e8 00 0f 00 00       	call   c0105fce <get_physical_address>
c01050ce:	83 c4 10             	add    $0x10,%esp
c01050d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01050d4:	83 ec 0c             	sub    $0xc,%esp
c01050d7:	ff 75 d8             	pushl  -0x28(%ebp)
c01050da:	e8 ef 0e 00 00       	call   c0105fce <get_physical_address>
c01050df:	83 c4 10             	add    $0x10,%esp
c01050e2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01050e5:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c01050ec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01050ef:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01050f2:	83 ec 0c             	sub    $0xc,%esp
c01050f5:	ff 75 08             	pushl  0x8(%ebp)
c01050f8:	e8 0b 71 00 00       	call   c010c208 <Strlen>
c01050fd:	83 c4 10             	add    $0x10,%esp
c0105100:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105103:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105106:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010510c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010510f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105115:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105118:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010511e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105121:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105127:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010512a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105130:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105133:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105136:	29 c2                	sub    %eax,%edx
c0105138:	89 d0                	mov    %edx,%eax
c010513a:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0105140:	83 ec 04             	sub    $0x4,%esp
c0105143:	6a 01                	push   $0x1
c0105145:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c010514b:	50                   	push   %eax
c010514c:	6a 03                	push   $0x3
c010514e:	e8 22 44 00 00       	call   c0109575 <send_rec>
c0105153:	83 c4 10             	add    $0x10,%esp
c0105156:	83 ec 08             	sub    $0x8,%esp
c0105159:	68 00 04 00 00       	push   $0x400
c010515e:	ff 75 dc             	pushl  -0x24(%ebp)
c0105161:	e8 eb c4 ff ff       	call   c0101651 <sys_free>
c0105166:	83 c4 10             	add    $0x10,%esp
c0105169:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010516c:	83 f8 65             	cmp    $0x65,%eax
c010516f:	74 1c                	je     c010518d <execv+0x1ea>
c0105171:	68 95 00 00 00       	push   $0x95
c0105176:	68 4b b5 10 c0       	push   $0xc010b54b
c010517b:	68 4b b5 10 c0       	push   $0xc010b54b
c0105180:	68 56 b5 10 c0       	push   $0xc010b556
c0105185:	e8 7b 37 00 00       	call   c0108905 <assertion_failure>
c010518a:	83 c4 10             	add    $0x10,%esp
c010518d:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0105190:	c9                   	leave  
c0105191:	c3                   	ret    

c0105192 <execl>:
c0105192:	55                   	push   %ebp
c0105193:	89 e5                	mov    %esp,%ebp
c0105195:	83 ec 18             	sub    $0x18,%esp
c0105198:	8d 45 0c             	lea    0xc(%ebp),%eax
c010519b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010519e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01051a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01051a4:	83 ec 08             	sub    $0x8,%esp
c01051a7:	ff 75 f0             	pushl  -0x10(%ebp)
c01051aa:	ff 75 08             	pushl  0x8(%ebp)
c01051ad:	e8 f1 fd ff ff       	call   c0104fa3 <execv>
c01051b2:	83 c4 10             	add    $0x10,%esp
c01051b5:	c9                   	leave  
c01051b6:	c3                   	ret    

c01051b7 <TaskMM>:
c01051b7:	55                   	push   %ebp
c01051b8:	89 e5                	mov    %esp,%ebp
c01051ba:	83 ec 28             	sub    $0x28,%esp
c01051bd:	83 ec 0c             	sub    $0xc,%esp
c01051c0:	6a 7c                	push   $0x7c
c01051c2:	e8 75 c4 ff ff       	call   c010163c <sys_malloc>
c01051c7:	83 c4 10             	add    $0x10,%esp
c01051ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01051cd:	83 ec 0c             	sub    $0xc,%esp
c01051d0:	6a 7c                	push   $0x7c
c01051d2:	e8 65 c4 ff ff       	call   c010163c <sys_malloc>
c01051d7:	83 c4 10             	add    $0x10,%esp
c01051da:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01051dd:	83 ec 04             	sub    $0x4,%esp
c01051e0:	6a 12                	push   $0x12
c01051e2:	ff 75 f0             	pushl  -0x10(%ebp)
c01051e5:	6a 02                	push   $0x2
c01051e7:	e8 89 43 00 00       	call   c0109575 <send_rec>
c01051ec:	83 c4 10             	add    $0x10,%esp
c01051ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01051f2:	8b 40 78             	mov    0x78(%eax),%eax
c01051f5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01051f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01051fb:	8b 00                	mov    (%eax),%eax
c01051fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105200:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105207:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010520a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0105211:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105214:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c010521b:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c010521f:	74 4e                	je     c010526f <TaskMM+0xb8>
c0105221:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105225:	7f 08                	jg     c010522f <TaskMM+0x78>
c0105227:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c010522b:	74 28                	je     c0105255 <TaskMM+0x9e>
c010522d:	eb 71                	jmp    c01052a0 <TaskMM+0xe9>
c010522f:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0105233:	74 08                	je     c010523d <TaskMM+0x86>
c0105235:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0105239:	74 4e                	je     c0105289 <TaskMM+0xd2>
c010523b:	eb 63                	jmp    c01052a0 <TaskMM+0xe9>
c010523d:	83 ec 0c             	sub    $0xc,%esp
c0105240:	ff 75 f0             	pushl  -0x10(%ebp)
c0105243:	e8 d0 04 00 00       	call   c0105718 <do_fork>
c0105248:	83 c4 10             	add    $0x10,%esp
c010524b:	89 c2                	mov    %eax,%edx
c010524d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105250:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105253:	eb 5c                	jmp    c01052b1 <TaskMM+0xfa>
c0105255:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010525c:	66 87 db             	xchg   %bx,%bx
c010525f:	83 ec 0c             	sub    $0xc,%esp
c0105262:	ff 75 f0             	pushl  -0x10(%ebp)
c0105265:	e8 95 00 00 00       	call   c01052ff <do_exec>
c010526a:	83 c4 10             	add    $0x10,%esp
c010526d:	eb 42                	jmp    c01052b1 <TaskMM+0xfa>
c010526f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105276:	83 ec 08             	sub    $0x8,%esp
c0105279:	ff 75 e0             	pushl  -0x20(%ebp)
c010527c:	ff 75 f0             	pushl  -0x10(%ebp)
c010527f:	e8 02 05 00 00       	call   c0105786 <do_exit>
c0105284:	83 c4 10             	add    $0x10,%esp
c0105287:	eb 28                	jmp    c01052b1 <TaskMM+0xfa>
c0105289:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105290:	83 ec 0c             	sub    $0xc,%esp
c0105293:	ff 75 f0             	pushl  -0x10(%ebp)
c0105296:	e8 75 05 00 00       	call   c0105810 <do_wait>
c010529b:	83 c4 10             	add    $0x10,%esp
c010529e:	eb 11                	jmp    c01052b1 <TaskMM+0xfa>
c01052a0:	83 ec 0c             	sub    $0xc,%esp
c01052a3:	68 78 b5 10 c0       	push   $0xc010b578
c01052a8:	e8 3a 36 00 00       	call   c01088e7 <panic>
c01052ad:	83 c4 10             	add    $0x10,%esp
c01052b0:	90                   	nop
c01052b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01052b5:	0f 84 22 ff ff ff    	je     c01051dd <TaskMM+0x26>
c01052bb:	83 ec 0c             	sub    $0xc,%esp
c01052be:	6a 03                	push   $0x3
c01052c0:	e8 af 31 00 00       	call   c0108474 <delay>
c01052c5:	83 c4 10             	add    $0x10,%esp
c01052c8:	83 ec 04             	sub    $0x4,%esp
c01052cb:	ff 75 e4             	pushl  -0x1c(%ebp)
c01052ce:	ff 75 ec             	pushl  -0x14(%ebp)
c01052d1:	6a 01                	push   $0x1
c01052d3:	e8 9d 42 00 00       	call   c0109575 <send_rec>
c01052d8:	83 c4 10             	add    $0x10,%esp
c01052db:	e9 fd fe ff ff       	jmp    c01051dd <TaskMM+0x26>

c01052e0 <alloc_mem>:
c01052e0:	55                   	push   %ebp
c01052e1:	89 e5                	mov    %esp,%ebp
c01052e3:	83 ec 10             	sub    $0x10,%esp
c01052e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01052e9:	83 e8 08             	sub    $0x8,%eax
c01052ec:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c01052f2:	05 00 00 a0 00       	add    $0xa00000,%eax
c01052f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01052fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01052fd:	c9                   	leave  
c01052fe:	c3                   	ret    

c01052ff <do_exec>:
c01052ff:	55                   	push   %ebp
c0105300:	89 e5                	mov    %esp,%ebp
c0105302:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105308:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010530f:	65 76 5f 
c0105312:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c0105319:	74 79 31 
c010531c:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105323:	00 00 
c0105325:	83 ec 08             	sub    $0x8,%esp
c0105328:	6a 00                	push   $0x0
c010532a:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c0105330:	50                   	push   %eax
c0105331:	e8 29 f8 ff ff       	call   c0104b5f <open>
c0105336:	83 c4 10             	add    $0x10,%esp
c0105339:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010533c:	8b 45 08             	mov    0x8(%ebp),%eax
c010533f:	8b 00                	mov    (%eax),%eax
c0105341:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105344:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c010534b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010534e:	83 ec 0c             	sub    $0xc,%esp
c0105351:	50                   	push   %eax
c0105352:	e8 e5 c2 ff ff       	call   c010163c <sys_malloc>
c0105357:	83 c4 10             	add    $0x10,%esp
c010535a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010535d:	83 ec 04             	sub    $0x4,%esp
c0105360:	ff 75 d0             	pushl  -0x30(%ebp)
c0105363:	6a 00                	push   $0x0
c0105365:	ff 75 cc             	pushl  -0x34(%ebp)
c0105368:	e8 62 6e 00 00       	call   c010c1cf <Memset>
c010536d:	83 c4 10             	add    $0x10,%esp
c0105370:	83 ec 04             	sub    $0x4,%esp
c0105373:	6a 0c                	push   $0xc
c0105375:	6a 00                	push   $0x0
c0105377:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010537d:	50                   	push   %eax
c010537e:	e8 4c 6e 00 00       	call   c010c1cf <Memset>
c0105383:	83 c4 10             	add    $0x10,%esp
c0105386:	8b 45 08             	mov    0x8(%ebp),%eax
c0105389:	8b 40 44             	mov    0x44(%eax),%eax
c010538c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010538f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105392:	8b 40 40             	mov    0x40(%eax),%eax
c0105395:	83 ec 08             	sub    $0x8,%esp
c0105398:	50                   	push   %eax
c0105399:	ff 75 c8             	pushl  -0x38(%ebp)
c010539c:	e8 de 0a 00 00       	call   c0105e7f <alloc_virtual_memory>
c01053a1:	83 c4 10             	add    $0x10,%esp
c01053a4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01053a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01053aa:	8b 40 40             	mov    0x40(%eax),%eax
c01053ad:	89 c2                	mov    %eax,%edx
c01053af:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01053b2:	83 ec 04             	sub    $0x4,%esp
c01053b5:	52                   	push   %edx
c01053b6:	50                   	push   %eax
c01053b7:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01053bd:	50                   	push   %eax
c01053be:	e8 29 19 00 00       	call   c0106cec <Memcpy>
c01053c3:	83 c4 10             	add    $0x10,%esp
c01053c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01053c9:	8b 40 40             	mov    0x40(%eax),%eax
c01053cc:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c01053d3:	00 
c01053d4:	83 ec 08             	sub    $0x8,%esp
c01053d7:	6a 00                	push   $0x0
c01053d9:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01053df:	50                   	push   %eax
c01053e0:	e8 7a f7 ff ff       	call   c0104b5f <open>
c01053e5:	83 c4 10             	add    $0x10,%esp
c01053e8:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01053eb:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c01053ef:	75 15                	jne    c0105406 <do_exec+0x107>
c01053f1:	83 ec 0c             	sub    $0xc,%esp
c01053f4:	68 89 b5 10 c0       	push   $0xc010b589
c01053f9:	e8 aa 31 00 00       	call   c01085a8 <Printf>
c01053fe:	83 c4 10             	add    $0x10,%esp
c0105401:	e9 10 03 00 00       	jmp    c0105716 <do_exec+0x417>
c0105406:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010540d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105410:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105413:	01 d0                	add    %edx,%eax
c0105415:	83 ec 04             	sub    $0x4,%esp
c0105418:	68 00 10 00 00       	push   $0x1000
c010541d:	50                   	push   %eax
c010541e:	ff 75 c0             	pushl  -0x40(%ebp)
c0105421:	e8 ce f7 ff ff       	call   c0104bf4 <read>
c0105426:	83 c4 10             	add    $0x10,%esp
c0105429:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010542c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010542f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0105432:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0105436:	74 0a                	je     c0105442 <do_exec+0x143>
c0105438:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010543b:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c010543e:	7d 05                	jge    c0105445 <do_exec+0x146>
c0105440:	eb cb                	jmp    c010540d <do_exec+0x10e>
c0105442:	90                   	nop
c0105443:	eb 01                	jmp    c0105446 <do_exec+0x147>
c0105445:	90                   	nop
c0105446:	83 ec 0c             	sub    $0xc,%esp
c0105449:	ff 75 c0             	pushl  -0x40(%ebp)
c010544c:	e8 a9 f9 ff ff       	call   c0104dfa <close>
c0105451:	83 c4 10             	add    $0x10,%esp
c0105454:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105457:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010545a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010545d:	8b 40 18             	mov    0x18(%eax),%eax
c0105460:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105463:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010546a:	e9 04 01 00 00       	jmp    c0105573 <do_exec+0x274>
c010546f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105472:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105476:	0f b7 d0             	movzwl %ax,%edx
c0105479:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010547c:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0105480:	0f b7 c0             	movzwl %ax,%eax
c0105483:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105487:	01 c2                	add    %eax,%edx
c0105489:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010548c:	01 d0                	add    %edx,%eax
c010548e:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0105491:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105494:	8b 40 10             	mov    0x10(%eax),%eax
c0105497:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010549a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010549d:	05 ff 0f 00 00       	add    $0xfff,%eax
c01054a2:	c1 e8 0c             	shr    $0xc,%eax
c01054a5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01054a8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054ab:	8b 40 08             	mov    0x8(%eax),%eax
c01054ae:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01054b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01054b8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01054bb:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c01054be:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01054c1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054c4:	8b 50 04             	mov    0x4(%eax),%edx
c01054c7:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01054ca:	01 d0                	add    %edx,%eax
c01054cc:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01054cf:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c01054d3:	0f 84 95 00 00 00    	je     c010556e <do_exec+0x26f>
c01054d9:	83 ec 04             	sub    $0x4,%esp
c01054dc:	ff 75 d4             	pushl  -0x2c(%ebp)
c01054df:	ff 75 a8             	pushl  -0x58(%ebp)
c01054e2:	ff 75 a4             	pushl  -0x5c(%ebp)
c01054e5:	e8 a0 07 00 00       	call   c0105c8a <get_virtual_address_start_with_addr>
c01054ea:	83 c4 10             	add    $0x10,%esp
c01054ed:	89 45 98             	mov    %eax,-0x68(%ebp)
c01054f0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01054f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01054f6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01054fd:	eb 41                	jmp    c0105540 <do_exec+0x241>
c01054ff:	83 ec 08             	sub    $0x8,%esp
c0105502:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105505:	ff 75 e8             	pushl  -0x18(%ebp)
c0105508:	e8 f3 0a 00 00       	call   c0106000 <alloc_physical_memory_of_proc>
c010550d:	83 c4 10             	add    $0x10,%esp
c0105510:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105513:	83 ec 08             	sub    $0x8,%esp
c0105516:	68 00 10 00 00       	push   $0x1000
c010551b:	ff 75 94             	pushl  -0x6c(%ebp)
c010551e:	e8 5c 09 00 00       	call   c0105e7f <alloc_virtual_memory>
c0105523:	83 c4 10             	add    $0x10,%esp
c0105526:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105529:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010552d:	75 06                	jne    c0105535 <do_exec+0x236>
c010552f:	8b 45 90             	mov    -0x70(%ebp),%eax
c0105532:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105535:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c010553c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0105540:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105543:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105546:	77 b7                	ja     c01054ff <do_exec+0x200>
c0105548:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010554b:	8b 40 10             	mov    0x10(%eax),%eax
c010554e:	89 c1                	mov    %eax,%ecx
c0105550:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105553:	8b 50 04             	mov    0x4(%eax),%edx
c0105556:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105559:	01 c2                	add    %eax,%edx
c010555b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010555e:	83 ec 04             	sub    $0x4,%esp
c0105561:	51                   	push   %ecx
c0105562:	52                   	push   %edx
c0105563:	50                   	push   %eax
c0105564:	e8 83 17 00 00       	call   c0106cec <Memcpy>
c0105569:	83 c4 10             	add    $0x10,%esp
c010556c:	eb 01                	jmp    c010556f <do_exec+0x270>
c010556e:	90                   	nop
c010556f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105573:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105576:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c010557a:	0f b7 c0             	movzwl %ax,%eax
c010557d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0105580:	0f 8c e9 fe ff ff    	jl     c010546f <do_exec+0x170>
c0105586:	8b 45 08             	mov    0x8(%ebp),%eax
c0105589:	8b 40 10             	mov    0x10(%eax),%eax
c010558c:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010558f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105592:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105595:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105598:	8b 45 08             	mov    0x8(%ebp),%eax
c010559b:	8b 40 24             	mov    0x24(%eax),%eax
c010559e:	89 45 84             	mov    %eax,-0x7c(%ebp)
c01055a1:	83 ec 0c             	sub    $0xc,%esp
c01055a4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055a7:	e8 8a e2 ff ff       	call   c0103836 <pid2proc>
c01055ac:	83 c4 10             	add    $0x10,%esp
c01055af:	89 45 80             	mov    %eax,-0x80(%ebp)
c01055b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01055b5:	8b 40 10             	mov    0x10(%eax),%eax
c01055b8:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01055be:	83 ec 08             	sub    $0x8,%esp
c01055c1:	ff 75 88             	pushl  -0x78(%ebp)
c01055c4:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c01055ca:	e8 b0 08 00 00       	call   c0105e7f <alloc_virtual_memory>
c01055cf:	83 c4 10             	add    $0x10,%esp
c01055d2:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01055d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01055db:	8b 40 2c             	mov    0x2c(%eax),%eax
c01055de:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01055e4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01055eb:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01055f1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01055f4:	eb 1a                	jmp    c0105610 <do_exec+0x311>
c01055f6:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01055fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01055fd:	8b 10                	mov    (%eax),%edx
c01055ff:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105605:	01 c2                	add    %eax,%edx
c0105607:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010560a:	89 10                	mov    %edx,(%eax)
c010560c:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0105610:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105613:	8b 00                	mov    (%eax),%eax
c0105615:	85 c0                	test   %eax,%eax
c0105617:	75 dd                	jne    c01055f6 <do_exec+0x2f7>
c0105619:	83 ec 0c             	sub    $0xc,%esp
c010561c:	ff 75 84             	pushl  -0x7c(%ebp)
c010561f:	e8 5b 08 00 00       	call   c0105e7f <alloc_virtual_memory>
c0105624:	83 c4 10             	add    $0x10,%esp
c0105627:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010562d:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c0105633:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0105639:	83 ec 04             	sub    $0x4,%esp
c010563c:	ff 75 88             	pushl  -0x78(%ebp)
c010563f:	52                   	push   %edx
c0105640:	50                   	push   %eax
c0105641:	e8 a6 16 00 00       	call   c0106cec <Memcpy>
c0105646:	83 c4 10             	add    $0x10,%esp
c0105649:	8b 45 08             	mov    0x8(%ebp),%eax
c010564c:	8b 40 28             	mov    0x28(%eax),%eax
c010564f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105655:	83 ec 08             	sub    $0x8,%esp
c0105658:	ff 75 d4             	pushl  -0x2c(%ebp)
c010565b:	ff 75 80             	pushl  -0x80(%ebp)
c010565e:	e8 ef 08 00 00       	call   c0105f52 <get_physical_address_proc>
c0105663:	83 c4 10             	add    $0x10,%esp
c0105666:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c010566c:	83 ec 08             	sub    $0x8,%esp
c010566f:	68 00 10 00 00       	push   $0x1000
c0105674:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c010567a:	e8 00 08 00 00       	call   c0105e7f <alloc_virtual_memory>
c010567f:	83 c4 10             	add    $0x10,%esp
c0105682:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105688:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010568e:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105693:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105699:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010569f:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01056a5:	89 50 20             	mov    %edx,0x20(%eax)
c01056a8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01056ab:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056b1:	89 50 28             	mov    %edx,0x28(%eax)
c01056b4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01056b7:	8b 40 18             	mov    0x18(%eax),%eax
c01056ba:	89 c2                	mov    %eax,%edx
c01056bc:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056c2:	89 50 30             	mov    %edx,0x30(%eax)
c01056c5:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01056cb:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01056d1:	89 50 3c             	mov    %edx,0x3c(%eax)
c01056d4:	8b 45 80             	mov    -0x80(%ebp),%eax
c01056d7:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01056de:	00 00 00 
c01056e1:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c01056e8:	00 00 00 
c01056eb:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c01056f2:	00 00 00 
c01056f5:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c01056fc:	00 00 00 
c01056ff:	83 ec 04             	sub    $0x4,%esp
c0105702:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105705:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c010570b:	50                   	push   %eax
c010570c:	6a 01                	push   $0x1
c010570e:	e8 62 3e 00 00       	call   c0109575 <send_rec>
c0105713:	83 c4 10             	add    $0x10,%esp
c0105716:	c9                   	leave  
c0105717:	c3                   	ret    

c0105718 <do_fork>:
c0105718:	55                   	push   %ebp
c0105719:	89 e5                	mov    %esp,%ebp
c010571b:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0105721:	8b 45 08             	mov    0x8(%ebp),%eax
c0105724:	8b 00                	mov    (%eax),%eax
c0105726:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105729:	83 ec 0c             	sub    $0xc,%esp
c010572c:	ff 75 f4             	pushl  -0xc(%ebp)
c010572f:	e8 3c 47 00 00       	call   c0109e70 <fork_process>
c0105734:	83 c4 10             	add    $0x10,%esp
c0105737:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010573a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010573d:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105743:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105746:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105749:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010574f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105752:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105755:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c010575c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105763:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010576a:	83 ec 04             	sub    $0x4,%esp
c010576d:	ff 75 ec             	pushl  -0x14(%ebp)
c0105770:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105776:	50                   	push   %eax
c0105777:	6a 01                	push   $0x1
c0105779:	e8 f7 3d 00 00       	call   c0109575 <send_rec>
c010577e:	83 c4 10             	add    $0x10,%esp
c0105781:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105784:	c9                   	leave  
c0105785:	c3                   	ret    

c0105786 <do_exit>:
c0105786:	55                   	push   %ebp
c0105787:	89 e5                	mov    %esp,%ebp
c0105789:	83 ec 18             	sub    $0x18,%esp
c010578c:	8b 45 08             	mov    0x8(%ebp),%eax
c010578f:	8b 00                	mov    (%eax),%eax
c0105791:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105794:	83 ec 0c             	sub    $0xc,%esp
c0105797:	ff 75 f4             	pushl  -0xc(%ebp)
c010579a:	e8 97 e0 ff ff       	call   c0103836 <pid2proc>
c010579f:	83 c4 10             	add    $0x10,%esp
c01057a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057a8:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01057ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01057b1:	83 ec 0c             	sub    $0xc,%esp
c01057b4:	ff 75 ec             	pushl  -0x14(%ebp)
c01057b7:	e8 7a e0 ff ff       	call   c0103836 <pid2proc>
c01057bc:	83 c4 10             	add    $0x10,%esp
c01057bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01057c2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01057c6:	74 45                	je     c010580d <do_exit+0x87>
c01057c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01057cb:	8b 40 54             	mov    0x54(%eax),%eax
c01057ce:	89 c2                	mov    %eax,%edx
c01057d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057d3:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c01057d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01057dc:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01057e3:	3c 04                	cmp    $0x4,%al
c01057e5:	75 1a                	jne    c0105801 <do_exit+0x7b>
c01057e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01057ea:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01057f1:	83 ec 0c             	sub    $0xc,%esp
c01057f4:	ff 75 f0             	pushl  -0x10(%ebp)
c01057f7:	e8 33 01 00 00       	call   c010592f <cleanup>
c01057fc:	83 c4 10             	add    $0x10,%esp
c01057ff:	eb 0d                	jmp    c010580e <do_exit+0x88>
c0105801:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105804:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c010580b:	eb 01                	jmp    c010580e <do_exit+0x88>
c010580d:	90                   	nop
c010580e:	c9                   	leave  
c010580f:	c3                   	ret    

c0105810 <do_wait>:
c0105810:	55                   	push   %ebp
c0105811:	89 e5                	mov    %esp,%ebp
c0105813:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0105819:	8b 45 08             	mov    0x8(%ebp),%eax
c010581c:	8b 00                	mov    (%eax),%eax
c010581e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105821:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105828:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010582f:	83 ec 0c             	sub    $0xc,%esp
c0105832:	ff 75 ec             	pushl  -0x14(%ebp)
c0105835:	e8 fc df ff ff       	call   c0103836 <pid2proc>
c010583a:	83 c4 10             	add    $0x10,%esp
c010583d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105840:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105844:	75 19                	jne    c010585f <do_wait+0x4f>
c0105846:	6a 58                	push   $0x58
c0105848:	68 99 b5 10 c0       	push   $0xc010b599
c010584d:	68 99 b5 10 c0       	push   $0xc010b599
c0105852:	68 a7 b5 10 c0       	push   $0xc010b5a7
c0105857:	e8 a9 30 00 00       	call   c0108905 <assertion_failure>
c010585c:	83 c4 10             	add    $0x10,%esp
c010585f:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105864:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c010586a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010586d:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105870:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105875:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c010587b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010587e:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105881:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105886:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105889:	eb 5b                	jmp    c01058e6 <do_wait+0xd6>
c010588b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010588e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105893:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105896:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105899:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010589f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01058a2:	74 0b                	je     c01058af <do_wait+0x9f>
c01058a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058a7:	8b 40 04             	mov    0x4(%eax),%eax
c01058aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058ad:	eb 37                	jmp    c01058e6 <do_wait+0xd6>
c01058af:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01058b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01058b6:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01058bd:	3c 03                	cmp    $0x3,%al
c01058bf:	74 0b                	je     c01058cc <do_wait+0xbc>
c01058c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01058c4:	8b 40 04             	mov    0x4(%eax),%eax
c01058c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01058ca:	eb 1a                	jmp    c01058e6 <do_wait+0xd6>
c01058cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01058cf:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01058d6:	83 ec 0c             	sub    $0xc,%esp
c01058d9:	ff 75 e8             	pushl  -0x18(%ebp)
c01058dc:	e8 4e 00 00 00       	call   c010592f <cleanup>
c01058e1:	83 c4 10             	add    $0x10,%esp
c01058e4:	eb 47                	jmp    c010592d <do_wait+0x11d>
c01058e6:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c01058ed:	75 9c                	jne    c010588b <do_wait+0x7b>
c01058ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01058f3:	74 0c                	je     c0105901 <do_wait+0xf1>
c01058f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01058f8:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c01058ff:	eb 2c                	jmp    c010592d <do_wait+0x11d>
c0105901:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105908:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010590f:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105916:	83 ec 04             	sub    $0x4,%esp
c0105919:	ff 75 ec             	pushl  -0x14(%ebp)
c010591c:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c0105922:	50                   	push   %eax
c0105923:	6a 01                	push   $0x1
c0105925:	e8 4b 3c 00 00       	call   c0109575 <send_rec>
c010592a:	83 c4 10             	add    $0x10,%esp
c010592d:	c9                   	leave  
c010592e:	c3                   	ret    

c010592f <cleanup>:
c010592f:	55                   	push   %ebp
c0105930:	89 e5                	mov    %esp,%ebp
c0105932:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105938:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c010593f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105946:	8b 45 08             	mov    0x8(%ebp),%eax
c0105949:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010594f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105952:	8b 45 08             	mov    0x8(%ebp),%eax
c0105955:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c010595b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010595e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105961:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105967:	83 ec 04             	sub    $0x4,%esp
c010596a:	50                   	push   %eax
c010596b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105971:	50                   	push   %eax
c0105972:	6a 01                	push   $0x1
c0105974:	e8 fc 3b 00 00       	call   c0109575 <send_rec>
c0105979:	83 c4 10             	add    $0x10,%esp
c010597c:	8b 45 08             	mov    0x8(%ebp),%eax
c010597f:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105986:	90                   	nop
c0105987:	c9                   	leave  
c0105988:	c3                   	ret    

c0105989 <init_bitmap>:
c0105989:	55                   	push   %ebp
c010598a:	89 e5                	mov    %esp,%ebp
c010598c:	83 ec 08             	sub    $0x8,%esp
c010598f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105992:	8b 50 04             	mov    0x4(%eax),%edx
c0105995:	8b 45 08             	mov    0x8(%ebp),%eax
c0105998:	8b 00                	mov    (%eax),%eax
c010599a:	83 ec 04             	sub    $0x4,%esp
c010599d:	52                   	push   %edx
c010599e:	6a 00                	push   $0x0
c01059a0:	50                   	push   %eax
c01059a1:	e8 29 68 00 00       	call   c010c1cf <Memset>
c01059a6:	83 c4 10             	add    $0x10,%esp
c01059a9:	90                   	nop
c01059aa:	c9                   	leave  
c01059ab:	c3                   	ret    

c01059ac <test_bit_val>:
c01059ac:	55                   	push   %ebp
c01059ad:	89 e5                	mov    %esp,%ebp
c01059af:	53                   	push   %ebx
c01059b0:	83 ec 10             	sub    $0x10,%esp
c01059b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059b6:	8d 50 07             	lea    0x7(%eax),%edx
c01059b9:	85 c0                	test   %eax,%eax
c01059bb:	0f 48 c2             	cmovs  %edx,%eax
c01059be:	c1 f8 03             	sar    $0x3,%eax
c01059c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01059c4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059c7:	99                   	cltd   
c01059c8:	c1 ea 1d             	shr    $0x1d,%edx
c01059cb:	01 d0                	add    %edx,%eax
c01059cd:	83 e0 07             	and    $0x7,%eax
c01059d0:	29 d0                	sub    %edx,%eax
c01059d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01059d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01059d8:	8b 10                	mov    (%eax),%edx
c01059da:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01059dd:	01 d0                	add    %edx,%eax
c01059df:	0f b6 00             	movzbl (%eax),%eax
c01059e2:	88 45 f3             	mov    %al,-0xd(%ebp)
c01059e5:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c01059e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059ec:	bb 01 00 00 00       	mov    $0x1,%ebx
c01059f1:	89 c1                	mov    %eax,%ecx
c01059f3:	d3 e3                	shl    %cl,%ebx
c01059f5:	89 d8                	mov    %ebx,%eax
c01059f7:	21 c2                	and    %eax,%edx
c01059f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059fc:	89 c1                	mov    %eax,%ecx
c01059fe:	d3 fa                	sar    %cl,%edx
c0105a00:	89 d0                	mov    %edx,%eax
c0105a02:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a05:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105a09:	0f 9f c0             	setg   %al
c0105a0c:	0f b6 c0             	movzbl %al,%eax
c0105a0f:	83 c4 10             	add    $0x10,%esp
c0105a12:	5b                   	pop    %ebx
c0105a13:	5d                   	pop    %ebp
c0105a14:	c3                   	ret    

c0105a15 <set_bit_val>:
c0105a15:	55                   	push   %ebp
c0105a16:	89 e5                	mov    %esp,%ebp
c0105a18:	83 ec 10             	sub    $0x10,%esp
c0105a1b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a1e:	8d 50 07             	lea    0x7(%eax),%edx
c0105a21:	85 c0                	test   %eax,%eax
c0105a23:	0f 48 c2             	cmovs  %edx,%eax
c0105a26:	c1 f8 03             	sar    $0x3,%eax
c0105a29:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a2f:	99                   	cltd   
c0105a30:	c1 ea 1d             	shr    $0x1d,%edx
c0105a33:	01 d0                	add    %edx,%eax
c0105a35:	83 e0 07             	and    $0x7,%eax
c0105a38:	29 d0                	sub    %edx,%eax
c0105a3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a40:	8b 10                	mov    (%eax),%edx
c0105a42:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a45:	01 d0                	add    %edx,%eax
c0105a47:	0f b6 00             	movzbl (%eax),%eax
c0105a4a:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105a4d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105a51:	7e 13                	jle    c0105a66 <set_bit_val+0x51>
c0105a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a56:	ba 01 00 00 00       	mov    $0x1,%edx
c0105a5b:	89 c1                	mov    %eax,%ecx
c0105a5d:	d3 e2                	shl    %cl,%edx
c0105a5f:	89 d0                	mov    %edx,%eax
c0105a61:	08 45 ff             	or     %al,-0x1(%ebp)
c0105a64:	eb 13                	jmp    c0105a79 <set_bit_val+0x64>
c0105a66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a69:	ba 01 00 00 00       	mov    $0x1,%edx
c0105a6e:	89 c1                	mov    %eax,%ecx
c0105a70:	d3 e2                	shl    %cl,%edx
c0105a72:	89 d0                	mov    %edx,%eax
c0105a74:	f7 d0                	not    %eax
c0105a76:	20 45 ff             	and    %al,-0x1(%ebp)
c0105a79:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a7c:	8b 10                	mov    (%eax),%edx
c0105a7e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a81:	01 c2                	add    %eax,%edx
c0105a83:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105a87:	88 02                	mov    %al,(%edx)
c0105a89:	b8 01 00 00 00       	mov    $0x1,%eax
c0105a8e:	c9                   	leave  
c0105a8f:	c3                   	ret    

c0105a90 <set_bits>:
c0105a90:	55                   	push   %ebp
c0105a91:	89 e5                	mov    %esp,%ebp
c0105a93:	83 ec 10             	sub    $0x10,%esp
c0105a96:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105a9d:	eb 1c                	jmp    c0105abb <set_bits+0x2b>
c0105a9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105aa2:	8d 50 01             	lea    0x1(%eax),%edx
c0105aa5:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105aa8:	ff 75 10             	pushl  0x10(%ebp)
c0105aab:	50                   	push   %eax
c0105aac:	ff 75 08             	pushl  0x8(%ebp)
c0105aaf:	e8 61 ff ff ff       	call   c0105a15 <set_bit_val>
c0105ab4:	83 c4 0c             	add    $0xc,%esp
c0105ab7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105abb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105abe:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105ac1:	7c dc                	jl     c0105a9f <set_bits+0xf>
c0105ac3:	b8 01 00 00 00       	mov    $0x1,%eax
c0105ac8:	c9                   	leave  
c0105ac9:	c3                   	ret    

c0105aca <get_first_free_bit>:
c0105aca:	55                   	push   %ebp
c0105acb:	89 e5                	mov    %esp,%ebp
c0105acd:	83 ec 10             	sub    $0x10,%esp
c0105ad0:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ad3:	8b 40 04             	mov    0x4(%eax),%eax
c0105ad6:	c1 e0 03             	shl    $0x3,%eax
c0105ad9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105adc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105adf:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105ae2:	eb 1b                	jmp    c0105aff <get_first_free_bit+0x35>
c0105ae4:	ff 75 fc             	pushl  -0x4(%ebp)
c0105ae7:	ff 75 08             	pushl  0x8(%ebp)
c0105aea:	e8 bd fe ff ff       	call   c01059ac <test_bit_val>
c0105aef:	83 c4 08             	add    $0x8,%esp
c0105af2:	85 c0                	test   %eax,%eax
c0105af4:	75 05                	jne    c0105afb <get_first_free_bit+0x31>
c0105af6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105af9:	eb 11                	jmp    c0105b0c <get_first_free_bit+0x42>
c0105afb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105aff:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b02:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105b05:	7c dd                	jl     c0105ae4 <get_first_free_bit+0x1a>
c0105b07:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105b0c:	c9                   	leave  
c0105b0d:	c3                   	ret    

c0105b0e <get_bits>:
c0105b0e:	55                   	push   %ebp
c0105b0f:	89 e5                	mov    %esp,%ebp
c0105b11:	83 ec 20             	sub    $0x20,%esp
c0105b14:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105b1b:	ff 75 f0             	pushl  -0x10(%ebp)
c0105b1e:	ff 75 08             	pushl  0x8(%ebp)
c0105b21:	e8 a4 ff ff ff       	call   c0105aca <get_first_free_bit>
c0105b26:	83 c4 08             	add    $0x8,%esp
c0105b29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b2f:	8b 40 04             	mov    0x4(%eax),%eax
c0105b32:	c1 e0 03             	shl    $0x3,%eax
c0105b35:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b38:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b3b:	83 e8 01             	sub    $0x1,%eax
c0105b3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105b41:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105b45:	75 08                	jne    c0105b4f <get_bits+0x41>
c0105b47:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b4a:	e9 85 00 00 00       	jmp    c0105bd4 <get_bits+0xc6>
c0105b4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b52:	83 c0 01             	add    $0x1,%eax
c0105b55:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b58:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b5e:	eb 58                	jmp    c0105bb8 <get_bits+0xaa>
c0105b60:	ff 75 f8             	pushl  -0x8(%ebp)
c0105b63:	ff 75 08             	pushl  0x8(%ebp)
c0105b66:	e8 41 fe ff ff       	call   c01059ac <test_bit_val>
c0105b6b:	83 c4 08             	add    $0x8,%esp
c0105b6e:	85 c0                	test   %eax,%eax
c0105b70:	75 0a                	jne    c0105b7c <get_bits+0x6e>
c0105b72:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105b76:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105b7a:	eb 2b                	jmp    c0105ba7 <get_bits+0x99>
c0105b7c:	6a 00                	push   $0x0
c0105b7e:	ff 75 08             	pushl  0x8(%ebp)
c0105b81:	e8 44 ff ff ff       	call   c0105aca <get_first_free_bit>
c0105b86:	83 c4 08             	add    $0x8,%esp
c0105b89:	83 c0 01             	add    $0x1,%eax
c0105b8c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b92:	83 c0 01             	add    $0x1,%eax
c0105b95:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b98:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105b9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b9e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ba1:	83 e8 01             	sub    $0x1,%eax
c0105ba4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105ba7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105baa:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105bad:	7c 09                	jl     c0105bb8 <get_bits+0xaa>
c0105baf:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105bb6:	eb 0d                	jmp    c0105bc5 <get_bits+0xb7>
c0105bb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105bbb:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105bbe:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105bc1:	85 c0                	test   %eax,%eax
c0105bc3:	7f 9b                	jg     c0105b60 <get_bits+0x52>
c0105bc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bc8:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105bcb:	83 c0 01             	add    $0x1,%eax
c0105bce:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105bd1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105bd4:	c9                   	leave  
c0105bd5:	c3                   	ret    

c0105bd6 <get_a_page>:
c0105bd6:	55                   	push   %ebp
c0105bd7:	89 e5                	mov    %esp,%ebp
c0105bd9:	83 ec 28             	sub    $0x28,%esp
c0105bdc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105be0:	75 22                	jne    c0105c04 <get_a_page+0x2e>
c0105be2:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105be7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105bea:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105bef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105bf2:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105bf7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105bfa:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105bff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c02:	eb 20                	jmp    c0105c24 <get_a_page+0x4e>
c0105c04:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105c09:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c0c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105c11:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c14:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105c19:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c1c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105c21:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c24:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105c27:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105c2a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c2d:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105c30:	6a 01                	push   $0x1
c0105c32:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c35:	50                   	push   %eax
c0105c36:	e8 d3 fe ff ff       	call   c0105b0e <get_bits>
c0105c3b:	83 c4 08             	add    $0x8,%esp
c0105c3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c41:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105c45:	75 1c                	jne    c0105c63 <get_a_page+0x8d>
c0105c47:	68 84 00 00 00       	push   $0x84
c0105c4c:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105c51:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105c56:	68 c4 b5 10 c0       	push   $0xc010b5c4
c0105c5b:	e8 a5 2c 00 00       	call   c0108905 <assertion_failure>
c0105c60:	83 c4 10             	add    $0x10,%esp
c0105c63:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c66:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105c69:	c1 e2 0c             	shl    $0xc,%edx
c0105c6c:	01 d0                	add    %edx,%eax
c0105c6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105c71:	83 ec 04             	sub    $0x4,%esp
c0105c74:	6a 01                	push   $0x1
c0105c76:	ff 75 f4             	pushl  -0xc(%ebp)
c0105c79:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c7c:	50                   	push   %eax
c0105c7d:	e8 93 fd ff ff       	call   c0105a15 <set_bit_val>
c0105c82:	83 c4 10             	add    $0x10,%esp
c0105c85:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c88:	c9                   	leave  
c0105c89:	c3                   	ret    

c0105c8a <get_virtual_address_start_with_addr>:
c0105c8a:	55                   	push   %ebp
c0105c8b:	89 e5                	mov    %esp,%ebp
c0105c8d:	83 ec 38             	sub    $0x38,%esp
c0105c90:	e8 59 a7 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105c95:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c98:	83 ec 0c             	sub    $0xc,%esp
c0105c9b:	ff 75 10             	pushl  0x10(%ebp)
c0105c9e:	e8 93 db ff ff       	call   c0103836 <pid2proc>
c0105ca3:	83 c4 10             	add    $0x10,%esp
c0105ca6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ca9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cac:	8b 40 0c             	mov    0xc(%eax),%eax
c0105caf:	83 ec 04             	sub    $0x4,%esp
c0105cb2:	6a 0c                	push   $0xc
c0105cb4:	50                   	push   %eax
c0105cb5:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105cb8:	50                   	push   %eax
c0105cb9:	e8 2e 10 00 00       	call   c0106cec <Memcpy>
c0105cbe:	83 c4 10             	add    $0x10,%esp
c0105cc1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105cc4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105cc7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105cca:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105ccd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105cd0:	8b 55 08             	mov    0x8(%ebp),%edx
c0105cd3:	29 c2                	sub    %eax,%edx
c0105cd5:	89 d0                	mov    %edx,%eax
c0105cd7:	c1 e8 0c             	shr    $0xc,%eax
c0105cda:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105cdd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105ce1:	79 1c                	jns    c0105cff <get_virtual_address_start_with_addr+0x75>
c0105ce3:	68 97 00 00 00       	push   $0x97
c0105ce8:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105ced:	68 ba b5 10 c0       	push   $0xc010b5ba
c0105cf2:	68 d0 b5 10 c0       	push   $0xc010b5d0
c0105cf7:	e8 09 2c 00 00       	call   c0108905 <assertion_failure>
c0105cfc:	83 c4 10             	add    $0x10,%esp
c0105cff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d02:	50                   	push   %eax
c0105d03:	6a 01                	push   $0x1
c0105d05:	ff 75 ec             	pushl  -0x14(%ebp)
c0105d08:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105d0b:	50                   	push   %eax
c0105d0c:	e8 7f fd ff ff       	call   c0105a90 <set_bits>
c0105d11:	83 c4 10             	add    $0x10,%esp
c0105d14:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d17:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105d1c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d22:	c9                   	leave  
c0105d23:	c3                   	ret    

c0105d24 <get_virtual_address>:
c0105d24:	55                   	push   %ebp
c0105d25:	89 e5                	mov    %esp,%ebp
c0105d27:	83 ec 28             	sub    $0x28,%esp
c0105d2a:	e8 bf a6 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105d2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d32:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105d36:	75 1a                	jne    c0105d52 <get_virtual_address+0x2e>
c0105d38:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105d3d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d40:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105d45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d48:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105d4d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d50:	eb 18                	jmp    c0105d6a <get_virtual_address+0x46>
c0105d52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d55:	8b 40 0c             	mov    0xc(%eax),%eax
c0105d58:	83 ec 04             	sub    $0x4,%esp
c0105d5b:	6a 0c                	push   $0xc
c0105d5d:	50                   	push   %eax
c0105d5e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105d61:	50                   	push   %eax
c0105d62:	e8 85 0f 00 00       	call   c0106cec <Memcpy>
c0105d67:	83 c4 10             	add    $0x10,%esp
c0105d6a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105d6d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105d70:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105d73:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105d76:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d79:	83 ec 08             	sub    $0x8,%esp
c0105d7c:	50                   	push   %eax
c0105d7d:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105d80:	50                   	push   %eax
c0105d81:	e8 88 fd ff ff       	call   c0105b0e <get_bits>
c0105d86:	83 c4 10             	add    $0x10,%esp
c0105d89:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d8f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105d92:	c1 e2 0c             	shl    $0xc,%edx
c0105d95:	01 d0                	add    %edx,%eax
c0105d97:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d9d:	50                   	push   %eax
c0105d9e:	6a 01                	push   $0x1
c0105da0:	ff 75 f0             	pushl  -0x10(%ebp)
c0105da3:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105da6:	50                   	push   %eax
c0105da7:	e8 e4 fc ff ff       	call   c0105a90 <set_bits>
c0105dac:	83 c4 10             	add    $0x10,%esp
c0105daf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105db2:	c9                   	leave  
c0105db3:	c3                   	ret    

c0105db4 <ptr_pde>:
c0105db4:	55                   	push   %ebp
c0105db5:	89 e5                	mov    %esp,%ebp
c0105db7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dba:	c1 e8 16             	shr    $0x16,%eax
c0105dbd:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105dc2:	c1 e0 02             	shl    $0x2,%eax
c0105dc5:	5d                   	pop    %ebp
c0105dc6:	c3                   	ret    

c0105dc7 <ptr_pte>:
c0105dc7:	55                   	push   %ebp
c0105dc8:	89 e5                	mov    %esp,%ebp
c0105dca:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dcd:	c1 e8 0a             	shr    $0xa,%eax
c0105dd0:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105dd5:	89 c2                	mov    %eax,%edx
c0105dd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dda:	c1 e8 0c             	shr    $0xc,%eax
c0105ddd:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105de2:	c1 e0 02             	shl    $0x2,%eax
c0105de5:	01 d0                	add    %edx,%eax
c0105de7:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105dec:	5d                   	pop    %ebp
c0105ded:	c3                   	ret    

c0105dee <add_map_entry>:
c0105dee:	55                   	push   %ebp
c0105def:	89 e5                	mov    %esp,%ebp
c0105df1:	83 ec 18             	sub    $0x18,%esp
c0105df4:	ff 75 08             	pushl  0x8(%ebp)
c0105df7:	e8 b8 ff ff ff       	call   c0105db4 <ptr_pde>
c0105dfc:	83 c4 04             	add    $0x4,%esp
c0105dff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e02:	ff 75 08             	pushl  0x8(%ebp)
c0105e05:	e8 bd ff ff ff       	call   c0105dc7 <ptr_pte>
c0105e0a:	83 c4 04             	add    $0x4,%esp
c0105e0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e10:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e13:	8b 00                	mov    (%eax),%eax
c0105e15:	83 e0 01             	and    $0x1,%eax
c0105e18:	85 c0                	test   %eax,%eax
c0105e1a:	74 1b                	je     c0105e37 <add_map_entry+0x49>
c0105e1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e1f:	8b 00                	mov    (%eax),%eax
c0105e21:	83 e0 01             	and    $0x1,%eax
c0105e24:	85 c0                	test   %eax,%eax
c0105e26:	75 54                	jne    c0105e7c <add_map_entry+0x8e>
c0105e28:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e2b:	83 c8 07             	or     $0x7,%eax
c0105e2e:	89 c2                	mov    %eax,%edx
c0105e30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e33:	89 10                	mov    %edx,(%eax)
c0105e35:	eb 45                	jmp    c0105e7c <add_map_entry+0x8e>
c0105e37:	83 ec 0c             	sub    $0xc,%esp
c0105e3a:	6a 00                	push   $0x0
c0105e3c:	e8 95 fd ff ff       	call   c0105bd6 <get_a_page>
c0105e41:	83 c4 10             	add    $0x10,%esp
c0105e44:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e47:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e4a:	83 c8 07             	or     $0x7,%eax
c0105e4d:	89 c2                	mov    %eax,%edx
c0105e4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e52:	89 10                	mov    %edx,(%eax)
c0105e54:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e57:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e5c:	83 ec 04             	sub    $0x4,%esp
c0105e5f:	68 00 10 00 00       	push   $0x1000
c0105e64:	6a 00                	push   $0x0
c0105e66:	50                   	push   %eax
c0105e67:	e8 63 63 00 00       	call   c010c1cf <Memset>
c0105e6c:	83 c4 10             	add    $0x10,%esp
c0105e6f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e72:	83 c8 07             	or     $0x7,%eax
c0105e75:	89 c2                	mov    %eax,%edx
c0105e77:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e7a:	89 10                	mov    %edx,(%eax)
c0105e7c:	90                   	nop
c0105e7d:	c9                   	leave  
c0105e7e:	c3                   	ret    

c0105e7f <alloc_virtual_memory>:
c0105e7f:	55                   	push   %ebp
c0105e80:	89 e5                	mov    %esp,%ebp
c0105e82:	83 ec 28             	sub    $0x28,%esp
c0105e85:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e88:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e90:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e93:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105e96:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e99:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e9c:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105e9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105ea2:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105ea7:	c1 e8 0c             	shr    $0xc,%eax
c0105eaa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ead:	e8 3c a5 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105eb2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105eb5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105eb8:	8b 50 08             	mov    0x8(%eax),%edx
c0105ebb:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105ec0:	39 c2                	cmp    %eax,%edx
c0105ec2:	75 09                	jne    c0105ecd <alloc_virtual_memory+0x4e>
c0105ec4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105ecb:	eb 07                	jmp    c0105ed4 <alloc_virtual_memory+0x55>
c0105ecd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105ed4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105edb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105ee2:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105ee9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105ef0:	eb 47                	jmp    c0105f39 <alloc_virtual_memory+0xba>
c0105ef2:	83 ec 08             	sub    $0x8,%esp
c0105ef5:	ff 75 f0             	pushl  -0x10(%ebp)
c0105ef8:	6a 01                	push   $0x1
c0105efa:	e8 25 fe ff ff       	call   c0105d24 <get_virtual_address>
c0105eff:	83 c4 10             	add    $0x10,%esp
c0105f02:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f05:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105f09:	74 13                	je     c0105f1e <alloc_virtual_memory+0x9f>
c0105f0b:	83 ec 0c             	sub    $0xc,%esp
c0105f0e:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f11:	e8 c0 fc ff ff       	call   c0105bd6 <get_a_page>
c0105f16:	83 c4 10             	add    $0x10,%esp
c0105f19:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f1c:	eb 06                	jmp    c0105f24 <alloc_virtual_memory+0xa5>
c0105f1e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105f21:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f24:	83 ec 08             	sub    $0x8,%esp
c0105f27:	ff 75 f4             	pushl  -0xc(%ebp)
c0105f2a:	ff 75 d8             	pushl  -0x28(%ebp)
c0105f2d:	e8 bc fe ff ff       	call   c0105dee <add_map_entry>
c0105f32:	83 c4 10             	add    $0x10,%esp
c0105f35:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105f39:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105f3c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105f3f:	72 b1                	jb     c0105ef2 <alloc_virtual_memory+0x73>
c0105f41:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f44:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f49:	89 c2                	mov    %eax,%edx
c0105f4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f4e:	01 d0                	add    %edx,%eax
c0105f50:	c9                   	leave  
c0105f51:	c3                   	ret    

c0105f52 <get_physical_address_proc>:
c0105f52:	55                   	push   %ebp
c0105f53:	89 e5                	mov    %esp,%ebp
c0105f55:	83 ec 18             	sub    $0x18,%esp
c0105f58:	e8 b5 a3 ff ff       	call   c0100312 <disable_int>
c0105f5d:	e8 8c a4 ff ff       	call   c01003ee <get_running_thread_pcb>
c0105f62:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f65:	83 ec 0c             	sub    $0xc,%esp
c0105f68:	ff 75 0c             	pushl  0xc(%ebp)
c0105f6b:	e8 c6 d8 ff ff       	call   c0103836 <pid2proc>
c0105f70:	83 c4 10             	add    $0x10,%esp
c0105f73:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105f76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f79:	8b 40 08             	mov    0x8(%eax),%eax
c0105f7c:	83 ec 0c             	sub    $0xc,%esp
c0105f7f:	50                   	push   %eax
c0105f80:	e8 4d a4 ff ff       	call   c01003d2 <update_cr3>
c0105f85:	83 c4 10             	add    $0x10,%esp
c0105f88:	83 ec 0c             	sub    $0xc,%esp
c0105f8b:	ff 75 08             	pushl  0x8(%ebp)
c0105f8e:	e8 34 fe ff ff       	call   c0105dc7 <ptr_pte>
c0105f93:	83 c4 10             	add    $0x10,%esp
c0105f96:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f99:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f9c:	8b 00                	mov    (%eax),%eax
c0105f9e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105fa3:	89 c2                	mov    %eax,%edx
c0105fa5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fa8:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105fad:	09 d0                	or     %edx,%eax
c0105faf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105fb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105fb5:	8b 40 08             	mov    0x8(%eax),%eax
c0105fb8:	83 ec 0c             	sub    $0xc,%esp
c0105fbb:	50                   	push   %eax
c0105fbc:	e8 11 a4 ff ff       	call   c01003d2 <update_cr3>
c0105fc1:	83 c4 10             	add    $0x10,%esp
c0105fc4:	e8 4b a3 ff ff       	call   c0100314 <enable_int>
c0105fc9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105fcc:	c9                   	leave  
c0105fcd:	c3                   	ret    

c0105fce <get_physical_address>:
c0105fce:	55                   	push   %ebp
c0105fcf:	89 e5                	mov    %esp,%ebp
c0105fd1:	83 ec 10             	sub    $0x10,%esp
c0105fd4:	ff 75 08             	pushl  0x8(%ebp)
c0105fd7:	e8 eb fd ff ff       	call   c0105dc7 <ptr_pte>
c0105fdc:	83 c4 04             	add    $0x4,%esp
c0105fdf:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105fe2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105fe5:	8b 00                	mov    (%eax),%eax
c0105fe7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105fec:	89 c2                	mov    %eax,%edx
c0105fee:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ff1:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105ff6:	09 d0                	or     %edx,%eax
c0105ff8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105ffb:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105ffe:	c9                   	leave  
c0105fff:	c3                   	ret    

c0106000 <alloc_physical_memory_of_proc>:
c0106000:	55                   	push   %ebp
c0106001:	89 e5                	mov    %esp,%ebp
c0106003:	83 ec 48             	sub    $0x48,%esp
c0106006:	e8 07 a3 ff ff       	call   c0100312 <disable_int>
c010600b:	8b 45 08             	mov    0x8(%ebp),%eax
c010600e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106013:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106016:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010601d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106020:	83 ec 0c             	sub    $0xc,%esp
c0106023:	50                   	push   %eax
c0106024:	e8 0d d8 ff ff       	call   c0103836 <pid2proc>
c0106029:	83 c4 10             	add    $0x10,%esp
c010602c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010602f:	e8 ba a3 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106034:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106037:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010603a:	8b 40 0c             	mov    0xc(%eax),%eax
c010603d:	83 ec 04             	sub    $0x4,%esp
c0106040:	6a 0c                	push   $0xc
c0106042:	50                   	push   %eax
c0106043:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106046:	50                   	push   %eax
c0106047:	e8 a0 0c 00 00       	call   c0106cec <Memcpy>
c010604c:	83 c4 10             	add    $0x10,%esp
c010604f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106052:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0106055:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106058:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010605b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010605e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106061:	29 c2                	sub    %eax,%edx
c0106063:	89 d0                	mov    %edx,%eax
c0106065:	c1 e8 0c             	shr    $0xc,%eax
c0106068:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010606b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010606e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106071:	c1 e2 0c             	shl    $0xc,%edx
c0106074:	01 d0                	add    %edx,%eax
c0106076:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106079:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010607c:	6a 01                	push   $0x1
c010607e:	6a 01                	push   $0x1
c0106080:	50                   	push   %eax
c0106081:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0106084:	50                   	push   %eax
c0106085:	e8 06 fa ff ff       	call   c0105a90 <set_bits>
c010608a:	83 c4 10             	add    $0x10,%esp
c010608d:	83 ec 0c             	sub    $0xc,%esp
c0106090:	ff 75 f0             	pushl  -0x10(%ebp)
c0106093:	e8 3e fb ff ff       	call   c0105bd6 <get_a_page>
c0106098:	83 c4 10             	add    $0x10,%esp
c010609b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010609e:	8b 45 08             	mov    0x8(%ebp),%eax
c01060a1:	25 ff 0f 00 00       	and    $0xfff,%eax
c01060a6:	89 c2                	mov    %eax,%edx
c01060a8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01060ab:	01 d0                	add    %edx,%eax
c01060ad:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01060b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060b3:	8b 40 08             	mov    0x8(%eax),%eax
c01060b6:	83 ec 0c             	sub    $0xc,%esp
c01060b9:	50                   	push   %eax
c01060ba:	e8 13 a3 ff ff       	call   c01003d2 <update_cr3>
c01060bf:	83 c4 10             	add    $0x10,%esp
c01060c2:	83 ec 08             	sub    $0x8,%esp
c01060c5:	ff 75 dc             	pushl  -0x24(%ebp)
c01060c8:	ff 75 f4             	pushl  -0xc(%ebp)
c01060cb:	e8 1e fd ff ff       	call   c0105dee <add_map_entry>
c01060d0:	83 c4 10             	add    $0x10,%esp
c01060d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01060d6:	8b 40 08             	mov    0x8(%eax),%eax
c01060d9:	83 ec 0c             	sub    $0xc,%esp
c01060dc:	50                   	push   %eax
c01060dd:	e8 f0 a2 ff ff       	call   c01003d2 <update_cr3>
c01060e2:	83 c4 10             	add    $0x10,%esp
c01060e5:	e8 2a a2 ff ff       	call   c0100314 <enable_int>
c01060ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01060ed:	c9                   	leave  
c01060ee:	c3                   	ret    

c01060ef <alloc_physical_memory>:
c01060ef:	55                   	push   %ebp
c01060f0:	89 e5                	mov    %esp,%ebp
c01060f2:	83 ec 38             	sub    $0x38,%esp
c01060f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01060f8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106100:	e8 e9 a2 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106105:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106108:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010610c:	75 1a                	jne    c0106128 <alloc_physical_memory+0x39>
c010610e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106113:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106116:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010611b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010611e:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106123:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106126:	eb 18                	jmp    c0106140 <alloc_physical_memory+0x51>
c0106128:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010612b:	8b 40 0c             	mov    0xc(%eax),%eax
c010612e:	83 ec 04             	sub    $0x4,%esp
c0106131:	6a 0c                	push   $0xc
c0106133:	50                   	push   %eax
c0106134:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0106137:	50                   	push   %eax
c0106138:	e8 af 0b 00 00       	call   c0106cec <Memcpy>
c010613d:	83 c4 10             	add    $0x10,%esp
c0106140:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106143:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106146:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106149:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010614c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010614f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106152:	29 c2                	sub    %eax,%edx
c0106154:	89 d0                	mov    %edx,%eax
c0106156:	c1 e8 0c             	shr    $0xc,%eax
c0106159:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010615c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010615f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106162:	c1 e2 0c             	shl    $0xc,%edx
c0106165:	01 d0                	add    %edx,%eax
c0106167:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010616a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010616d:	6a 01                	push   $0x1
c010616f:	6a 01                	push   $0x1
c0106171:	50                   	push   %eax
c0106172:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106175:	50                   	push   %eax
c0106176:	e8 15 f9 ff ff       	call   c0105a90 <set_bits>
c010617b:	83 c4 10             	add    $0x10,%esp
c010617e:	83 ec 0c             	sub    $0xc,%esp
c0106181:	ff 75 0c             	pushl  0xc(%ebp)
c0106184:	e8 4d fa ff ff       	call   c0105bd6 <get_a_page>
c0106189:	83 c4 10             	add    $0x10,%esp
c010618c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010618f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106192:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106197:	89 c2                	mov    %eax,%edx
c0106199:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010619c:	01 d0                	add    %edx,%eax
c010619e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01061a1:	83 ec 08             	sub    $0x8,%esp
c01061a4:	ff 75 e4             	pushl  -0x1c(%ebp)
c01061a7:	ff 75 f4             	pushl  -0xc(%ebp)
c01061aa:	e8 3f fc ff ff       	call   c0105dee <add_map_entry>
c01061af:	83 c4 10             	add    $0x10,%esp
c01061b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01061b5:	c9                   	leave  
c01061b6:	c3                   	ret    

c01061b7 <alloc_memory>:
c01061b7:	55                   	push   %ebp
c01061b8:	89 e5                	mov    %esp,%ebp
c01061ba:	83 ec 18             	sub    $0x18,%esp
c01061bd:	83 ec 08             	sub    $0x8,%esp
c01061c0:	ff 75 0c             	pushl  0xc(%ebp)
c01061c3:	ff 75 08             	pushl  0x8(%ebp)
c01061c6:	e8 59 fb ff ff       	call   c0105d24 <get_virtual_address>
c01061cb:	83 c4 10             	add    $0x10,%esp
c01061ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01061d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01061d4:	2d 00 10 00 00       	sub    $0x1000,%eax
c01061d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061dc:	eb 29                	jmp    c0106207 <alloc_memory+0x50>
c01061de:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01061e5:	83 ec 0c             	sub    $0xc,%esp
c01061e8:	ff 75 0c             	pushl  0xc(%ebp)
c01061eb:	e8 e6 f9 ff ff       	call   c0105bd6 <get_a_page>
c01061f0:	83 c4 10             	add    $0x10,%esp
c01061f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01061f6:	83 ec 08             	sub    $0x8,%esp
c01061f9:	ff 75 ec             	pushl  -0x14(%ebp)
c01061fc:	ff 75 f4             	pushl  -0xc(%ebp)
c01061ff:	e8 ea fb ff ff       	call   c0105dee <add_map_entry>
c0106204:	83 c4 10             	add    $0x10,%esp
c0106207:	8b 45 08             	mov    0x8(%ebp),%eax
c010620a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010620d:	89 55 08             	mov    %edx,0x8(%ebp)
c0106210:	85 c0                	test   %eax,%eax
c0106212:	75 ca                	jne    c01061de <alloc_memory+0x27>
c0106214:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106217:	c9                   	leave  
c0106218:	c3                   	ret    

c0106219 <get_a_virtual_page>:
c0106219:	55                   	push   %ebp
c010621a:	89 e5                	mov    %esp,%ebp
c010621c:	83 ec 18             	sub    $0x18,%esp
c010621f:	83 ec 0c             	sub    $0xc,%esp
c0106222:	ff 75 08             	pushl  0x8(%ebp)
c0106225:	e8 ac f9 ff ff       	call   c0105bd6 <get_a_page>
c010622a:	83 c4 10             	add    $0x10,%esp
c010622d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106230:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106233:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106238:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010623b:	83 ec 08             	sub    $0x8,%esp
c010623e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106241:	ff 75 f0             	pushl  -0x10(%ebp)
c0106244:	e8 a5 fb ff ff       	call   c0105dee <add_map_entry>
c0106249:	83 c4 10             	add    $0x10,%esp
c010624c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010624f:	c9                   	leave  
c0106250:	c3                   	ret    

c0106251 <block2arena>:
c0106251:	55                   	push   %ebp
c0106252:	89 e5                	mov    %esp,%ebp
c0106254:	83 ec 10             	sub    $0x10,%esp
c0106257:	8b 45 08             	mov    0x8(%ebp),%eax
c010625a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010625f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106262:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106265:	c9                   	leave  
c0106266:	c3                   	ret    

c0106267 <sys_malloc2>:
c0106267:	55                   	push   %ebp
c0106268:	89 e5                	mov    %esp,%ebp
c010626a:	83 ec 68             	sub    $0x68,%esp
c010626d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106274:	e8 75 a1 ff ff       	call   c01003ee <get_running_thread_pcb>
c0106279:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010627c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010627f:	8b 50 08             	mov    0x8(%eax),%edx
c0106282:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106287:	39 c2                	cmp    %eax,%edx
c0106289:	75 10                	jne    c010629b <sys_malloc2+0x34>
c010628b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106292:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106299:	eb 10                	jmp    c01062ab <sys_malloc2+0x44>
c010629b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01062a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01062a5:	83 c0 10             	add    $0x10,%eax
c01062a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01062ab:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c01062b2:	76 52                	jbe    c0106306 <sys_malloc2+0x9f>
c01062b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01062b7:	05 0b 10 00 00       	add    $0x100b,%eax
c01062bc:	c1 e8 0c             	shr    $0xc,%eax
c01062bf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01062c2:	83 ec 08             	sub    $0x8,%esp
c01062c5:	ff 75 f0             	pushl  -0x10(%ebp)
c01062c8:	ff 75 d8             	pushl  -0x28(%ebp)
c01062cb:	e8 e7 fe ff ff       	call   c01061b7 <alloc_memory>
c01062d0:	83 c4 10             	add    $0x10,%esp
c01062d3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01062d6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01062d9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01062dc:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01062df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01062e5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01062e8:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01062ef:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01062f2:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c01062f6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01062f9:	05 90 00 00 00       	add    $0x90,%eax
c01062fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106301:	e9 f0 01 00 00       	jmp    c01064f6 <sys_malloc2+0x28f>
c0106306:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010630d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106314:	eb 26                	jmp    c010633c <sys_malloc2+0xd5>
c0106316:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106319:	89 d0                	mov    %edx,%eax
c010631b:	01 c0                	add    %eax,%eax
c010631d:	01 d0                	add    %edx,%eax
c010631f:	c1 e0 03             	shl    $0x3,%eax
c0106322:	89 c2                	mov    %eax,%edx
c0106324:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106327:	01 d0                	add    %edx,%eax
c0106329:	8b 00                	mov    (%eax),%eax
c010632b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010632e:	77 08                	ja     c0106338 <sys_malloc2+0xd1>
c0106330:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106333:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106336:	eb 0a                	jmp    c0106342 <sys_malloc2+0xdb>
c0106338:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010633c:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0106340:	7e d4                	jle    c0106316 <sys_malloc2+0xaf>
c0106342:	83 ec 08             	sub    $0x8,%esp
c0106345:	ff 75 f0             	pushl  -0x10(%ebp)
c0106348:	6a 01                	push   $0x1
c010634a:	e8 68 fe ff ff       	call   c01061b7 <alloc_memory>
c010634f:	83 c4 10             	add    $0x10,%esp
c0106352:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106355:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106358:	89 d0                	mov    %edx,%eax
c010635a:	01 c0                	add    %eax,%eax
c010635c:	01 d0                	add    %edx,%eax
c010635e:	c1 e0 03             	shl    $0x3,%eax
c0106361:	89 c2                	mov    %eax,%edx
c0106363:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106366:	01 d0                	add    %edx,%eax
c0106368:	83 ec 04             	sub    $0x4,%esp
c010636b:	6a 18                	push   $0x18
c010636d:	50                   	push   %eax
c010636e:	ff 75 cc             	pushl  -0x34(%ebp)
c0106371:	e8 76 09 00 00       	call   c0106cec <Memcpy>
c0106376:	83 c4 10             	add    $0x10,%esp
c0106379:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0106380:	e8 03 09 00 00       	call   c0106c88 <intr_disable>
c0106385:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106388:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010638b:	89 d0                	mov    %edx,%eax
c010638d:	01 c0                	add    %eax,%eax
c010638f:	01 d0                	add    %edx,%eax
c0106391:	c1 e0 03             	shl    $0x3,%eax
c0106394:	89 c2                	mov    %eax,%edx
c0106396:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106399:	01 d0                	add    %edx,%eax
c010639b:	83 c0 08             	add    $0x8,%eax
c010639e:	83 ec 0c             	sub    $0xc,%esp
c01063a1:	50                   	push   %eax
c01063a2:	e8 1c 3d 00 00       	call   c010a0c3 <isListEmpty>
c01063a7:	83 c4 10             	add    $0x10,%esp
c01063aa:	3c 01                	cmp    $0x1,%al
c01063ac:	0f 85 c1 00 00 00    	jne    c0106473 <sys_malloc2+0x20c>
c01063b2:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c01063b9:	83 ec 08             	sub    $0x8,%esp
c01063bc:	ff 75 f0             	pushl  -0x10(%ebp)
c01063bf:	6a 01                	push   $0x1
c01063c1:	e8 f1 fd ff ff       	call   c01061b7 <alloc_memory>
c01063c6:	83 c4 10             	add    $0x10,%esp
c01063c9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01063cc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01063cf:	83 ec 0c             	sub    $0xc,%esp
c01063d2:	50                   	push   %eax
c01063d3:	e8 79 fe ff ff       	call   c0106251 <block2arena>
c01063d8:	83 c4 10             	add    $0x10,%esp
c01063db:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01063de:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01063e1:	89 d0                	mov    %edx,%eax
c01063e3:	01 c0                	add    %eax,%eax
c01063e5:	01 d0                	add    %edx,%eax
c01063e7:	c1 e0 03             	shl    $0x3,%eax
c01063ea:	89 c2                	mov    %eax,%edx
c01063ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063ef:	01 d0                	add    %edx,%eax
c01063f1:	8b 50 04             	mov    0x4(%eax),%edx
c01063f4:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01063f7:	89 50 04             	mov    %edx,0x4(%eax)
c01063fa:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01063fd:	8b 00                	mov    (%eax),%eax
c01063ff:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106402:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106409:	b8 00 10 00 00       	mov    $0x1000,%eax
c010640e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0106411:	ba 00 00 00 00       	mov    $0x0,%edx
c0106416:	f7 75 b8             	divl   -0x48(%ebp)
c0106419:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010641c:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010641f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0106422:	01 d0                	add    %edx,%eax
c0106424:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106427:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010642e:	eb 3b                	jmp    c010646b <sys_malloc2+0x204>
c0106430:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106433:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0106437:	89 c2                	mov    %eax,%edx
c0106439:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010643c:	01 d0                	add    %edx,%eax
c010643e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106441:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106444:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106447:	89 d0                	mov    %edx,%eax
c0106449:	01 c0                	add    %eax,%eax
c010644b:	01 d0                	add    %edx,%eax
c010644d:	c1 e0 03             	shl    $0x3,%eax
c0106450:	89 c2                	mov    %eax,%edx
c0106452:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106455:	01 d0                	add    %edx,%eax
c0106457:	83 c0 08             	add    $0x8,%eax
c010645a:	83 ec 08             	sub    $0x8,%esp
c010645d:	51                   	push   %ecx
c010645e:	50                   	push   %eax
c010645f:	e8 5c 3d 00 00       	call   c010a1c0 <appendToDoubleLinkList>
c0106464:	83 c4 10             	add    $0x10,%esp
c0106467:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010646b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010646e:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0106471:	77 bd                	ja     c0106430 <sys_malloc2+0x1c9>
c0106473:	83 ec 0c             	sub    $0xc,%esp
c0106476:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106479:	e8 33 08 00 00       	call   c0106cb1 <intr_set_status>
c010647e:	83 c4 10             	add    $0x10,%esp
c0106481:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106484:	89 d0                	mov    %edx,%eax
c0106486:	01 c0                	add    %eax,%eax
c0106488:	01 d0                	add    %edx,%eax
c010648a:	c1 e0 03             	shl    $0x3,%eax
c010648d:	89 c2                	mov    %eax,%edx
c010648f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106492:	01 d0                	add    %edx,%eax
c0106494:	83 c0 08             	add    $0x8,%eax
c0106497:	83 ec 0c             	sub    $0xc,%esp
c010649a:	50                   	push   %eax
c010649b:	e8 8a 3e 00 00       	call   c010a32a <popFromDoubleLinkList>
c01064a0:	83 c4 10             	add    $0x10,%esp
c01064a3:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01064a6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01064a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01064ac:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c01064b0:	75 1c                	jne    c01064ce <sys_malloc2+0x267>
c01064b2:	68 ef 01 00 00       	push   $0x1ef
c01064b7:	68 ba b5 10 c0       	push   $0xc010b5ba
c01064bc:	68 ba b5 10 c0       	push   $0xc010b5ba
c01064c1:	68 db b5 10 c0       	push   $0xc010b5db
c01064c6:	e8 3a 24 00 00       	call   c0108905 <assertion_failure>
c01064cb:	83 c4 10             	add    $0x10,%esp
c01064ce:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01064d1:	83 ec 0c             	sub    $0xc,%esp
c01064d4:	50                   	push   %eax
c01064d5:	e8 77 fd ff ff       	call   c0106251 <block2arena>
c01064da:	83 c4 10             	add    $0x10,%esp
c01064dd:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01064e0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01064e3:	8b 40 04             	mov    0x4(%eax),%eax
c01064e6:	8d 50 ff             	lea    -0x1(%eax),%edx
c01064e9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01064ec:	89 50 04             	mov    %edx,0x4(%eax)
c01064ef:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c01064f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01064fa:	75 1c                	jne    c0106518 <sys_malloc2+0x2b1>
c01064fc:	68 f6 01 00 00       	push   $0x1f6
c0106501:	68 ba b5 10 c0       	push   $0xc010b5ba
c0106506:	68 ba b5 10 c0       	push   $0xc010b5ba
c010650b:	68 ed b5 10 c0       	push   $0xc010b5ed
c0106510:	e8 f0 23 00 00       	call   c0108905 <assertion_failure>
c0106515:	83 c4 10             	add    $0x10,%esp
c0106518:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010651b:	c9                   	leave  
c010651c:	c3                   	ret    

c010651d <remove_map_entry>:
c010651d:	55                   	push   %ebp
c010651e:	89 e5                	mov    %esp,%ebp
c0106520:	83 ec 10             	sub    $0x10,%esp
c0106523:	ff 75 08             	pushl  0x8(%ebp)
c0106526:	e8 9c f8 ff ff       	call   c0105dc7 <ptr_pte>
c010652b:	83 c4 04             	add    $0x4,%esp
c010652e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106531:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106534:	8b 10                	mov    (%eax),%edx
c0106536:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106539:	89 10                	mov    %edx,(%eax)
c010653b:	90                   	nop
c010653c:	c9                   	leave  
c010653d:	c3                   	ret    

c010653e <free_a_page>:
c010653e:	55                   	push   %ebp
c010653f:	89 e5                	mov    %esp,%ebp
c0106541:	83 ec 20             	sub    $0x20,%esp
c0106544:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106548:	75 21                	jne    c010656b <free_a_page+0x2d>
c010654a:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010654f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106552:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106557:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010655a:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010655f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106562:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106569:	eb 1f                	jmp    c010658a <free_a_page+0x4c>
c010656b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106570:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106573:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106578:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010657b:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106580:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106583:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c010658a:	8b 45 08             	mov    0x8(%ebp),%eax
c010658d:	c1 e8 0c             	shr    $0xc,%eax
c0106590:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106593:	6a 00                	push   $0x0
c0106595:	ff 75 f8             	pushl  -0x8(%ebp)
c0106598:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c010659b:	50                   	push   %eax
c010659c:	e8 74 f4 ff ff       	call   c0105a15 <set_bit_val>
c01065a1:	83 c4 0c             	add    $0xc,%esp
c01065a4:	ff 75 08             	pushl  0x8(%ebp)
c01065a7:	e8 22 fa ff ff       	call   c0105fce <get_physical_address>
c01065ac:	83 c4 04             	add    $0x4,%esp
c01065af:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01065b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01065b5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01065bb:	85 c0                	test   %eax,%eax
c01065bd:	0f 48 c2             	cmovs  %edx,%eax
c01065c0:	c1 f8 0c             	sar    $0xc,%eax
c01065c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01065c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01065c9:	6a 00                	push   $0x0
c01065cb:	ff 75 f0             	pushl  -0x10(%ebp)
c01065ce:	50                   	push   %eax
c01065cf:	e8 41 f4 ff ff       	call   c0105a15 <set_bit_val>
c01065d4:	83 c4 0c             	add    $0xc,%esp
c01065d7:	ff 75 08             	pushl  0x8(%ebp)
c01065da:	e8 3e ff ff ff       	call   c010651d <remove_map_entry>
c01065df:	83 c4 04             	add    $0x4,%esp
c01065e2:	90                   	nop
c01065e3:	c9                   	leave  
c01065e4:	c3                   	ret    

c01065e5 <sys_free2>:
c01065e5:	55                   	push   %ebp
c01065e6:	89 e5                	mov    %esp,%ebp
c01065e8:	83 ec 58             	sub    $0x58,%esp
c01065eb:	e8 fe 9d ff ff       	call   c01003ee <get_running_thread_pcb>
c01065f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01065f3:	e8 90 06 00 00       	call   c0106c88 <intr_disable>
c01065f8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01065fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01065fe:	8b 50 08             	mov    0x8(%eax),%edx
c0106601:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106606:	39 c2                	cmp    %eax,%edx
c0106608:	75 10                	jne    c010661a <sys_free2+0x35>
c010660a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106611:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c0106618:	eb 10                	jmp    c010662a <sys_free2+0x45>
c010661a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106621:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106624:	83 c0 10             	add    $0x10,%eax
c0106627:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010662a:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0106631:	76 4d                	jbe    c0106680 <sys_free2+0x9b>
c0106633:	8b 45 08             	mov    0x8(%ebp),%eax
c0106636:	83 e8 0c             	sub    $0xc,%eax
c0106639:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010663c:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0106640:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106643:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106648:	c1 e8 0c             	shr    $0xc,%eax
c010664b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010664e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106655:	eb 1c                	jmp    c0106673 <sys_free2+0x8e>
c0106657:	83 ec 08             	sub    $0x8,%esp
c010665a:	ff 75 f4             	pushl  -0xc(%ebp)
c010665d:	ff 75 ec             	pushl  -0x14(%ebp)
c0106660:	e8 d9 fe ff ff       	call   c010653e <free_a_page>
c0106665:	83 c4 10             	add    $0x10,%esp
c0106668:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010666f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106673:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106676:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106679:	77 dc                	ja     c0106657 <sys_free2+0x72>
c010667b:	e9 dc 00 00 00       	jmp    c010675c <sys_free2+0x177>
c0106680:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106687:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010668e:	eb 26                	jmp    c01066b6 <sys_free2+0xd1>
c0106690:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106693:	89 d0                	mov    %edx,%eax
c0106695:	01 c0                	add    %eax,%eax
c0106697:	01 d0                	add    %edx,%eax
c0106699:	c1 e0 03             	shl    $0x3,%eax
c010669c:	89 c2                	mov    %eax,%edx
c010669e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066a1:	01 d0                	add    %edx,%eax
c01066a3:	8b 00                	mov    (%eax),%eax
c01066a5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01066a8:	77 08                	ja     c01066b2 <sys_free2+0xcd>
c01066aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01066ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01066b0:	eb 0a                	jmp    c01066bc <sys_free2+0xd7>
c01066b2:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01066b6:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c01066ba:	7e d4                	jle    c0106690 <sys_free2+0xab>
c01066bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01066bf:	89 d0                	mov    %edx,%eax
c01066c1:	01 c0                	add    %eax,%eax
c01066c3:	01 d0                	add    %edx,%eax
c01066c5:	c1 e0 03             	shl    $0x3,%eax
c01066c8:	89 c2                	mov    %eax,%edx
c01066ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066cd:	01 d0                	add    %edx,%eax
c01066cf:	8b 10                	mov    (%eax),%edx
c01066d1:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c01066d4:	8b 50 04             	mov    0x4(%eax),%edx
c01066d7:	89 55 b8             	mov    %edx,-0x48(%ebp)
c01066da:	8b 50 08             	mov    0x8(%eax),%edx
c01066dd:	89 55 bc             	mov    %edx,-0x44(%ebp)
c01066e0:	8b 50 0c             	mov    0xc(%eax),%edx
c01066e3:	89 55 c0             	mov    %edx,-0x40(%ebp)
c01066e6:	8b 50 10             	mov    0x10(%eax),%edx
c01066e9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c01066ec:	8b 40 14             	mov    0x14(%eax),%eax
c01066ef:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01066f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01066f5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01066f8:	83 ec 0c             	sub    $0xc,%esp
c01066fb:	ff 75 d0             	pushl  -0x30(%ebp)
c01066fe:	e8 4e fb ff ff       	call   c0106251 <block2arena>
c0106703:	83 c4 10             	add    $0x10,%esp
c0106706:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106709:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010670c:	89 d0                	mov    %edx,%eax
c010670e:	01 c0                	add    %eax,%eax
c0106710:	01 d0                	add    %edx,%eax
c0106712:	c1 e0 03             	shl    $0x3,%eax
c0106715:	89 c2                	mov    %eax,%edx
c0106717:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010671a:	01 d0                	add    %edx,%eax
c010671c:	83 c0 08             	add    $0x8,%eax
c010671f:	83 ec 08             	sub    $0x8,%esp
c0106722:	ff 75 d0             	pushl  -0x30(%ebp)
c0106725:	50                   	push   %eax
c0106726:	e8 95 3a 00 00       	call   c010a1c0 <appendToDoubleLinkList>
c010672b:	83 c4 10             	add    $0x10,%esp
c010672e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106731:	8b 40 04             	mov    0x4(%eax),%eax
c0106734:	8d 50 01             	lea    0x1(%eax),%edx
c0106737:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010673a:	89 50 04             	mov    %edx,0x4(%eax)
c010673d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106740:	8b 50 04             	mov    0x4(%eax),%edx
c0106743:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106746:	39 c2                	cmp    %eax,%edx
c0106748:	75 12                	jne    c010675c <sys_free2+0x177>
c010674a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010674d:	83 ec 08             	sub    $0x8,%esp
c0106750:	ff 75 f4             	pushl  -0xc(%ebp)
c0106753:	50                   	push   %eax
c0106754:	e8 e5 fd ff ff       	call   c010653e <free_a_page>
c0106759:	83 c4 10             	add    $0x10,%esp
c010675c:	83 ec 0c             	sub    $0xc,%esp
c010675f:	ff 75 d8             	pushl  -0x28(%ebp)
c0106762:	e8 4a 05 00 00       	call   c0106cb1 <intr_set_status>
c0106767:	83 c4 10             	add    $0x10,%esp
c010676a:	90                   	nop
c010676b:	c9                   	leave  
c010676c:	c3                   	ret    

c010676d <init_memory_block_desc>:
c010676d:	55                   	push   %ebp
c010676e:	89 e5                	mov    %esp,%ebp
c0106770:	83 ec 18             	sub    $0x18,%esp
c0106773:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010677a:	e9 b2 00 00 00       	jmp    c0106831 <init_memory_block_desc+0xc4>
c010677f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106783:	75 1b                	jne    c01067a0 <init_memory_block_desc+0x33>
c0106785:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106788:	89 d0                	mov    %edx,%eax
c010678a:	01 c0                	add    %eax,%eax
c010678c:	01 d0                	add    %edx,%eax
c010678e:	c1 e0 03             	shl    $0x3,%eax
c0106791:	89 c2                	mov    %eax,%edx
c0106793:	8b 45 08             	mov    0x8(%ebp),%eax
c0106796:	01 d0                	add    %edx,%eax
c0106798:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010679e:	eb 2e                	jmp    c01067ce <init_memory_block_desc+0x61>
c01067a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067a3:	89 d0                	mov    %edx,%eax
c01067a5:	01 c0                	add    %eax,%eax
c01067a7:	01 d0                	add    %edx,%eax
c01067a9:	c1 e0 03             	shl    $0x3,%eax
c01067ac:	8d 50 e8             	lea    -0x18(%eax),%edx
c01067af:	8b 45 08             	mov    0x8(%ebp),%eax
c01067b2:	01 d0                	add    %edx,%eax
c01067b4:	8b 08                	mov    (%eax),%ecx
c01067b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067b9:	89 d0                	mov    %edx,%eax
c01067bb:	01 c0                	add    %eax,%eax
c01067bd:	01 d0                	add    %edx,%eax
c01067bf:	c1 e0 03             	shl    $0x3,%eax
c01067c2:	89 c2                	mov    %eax,%edx
c01067c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01067c7:	01 d0                	add    %edx,%eax
c01067c9:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c01067cc:	89 10                	mov    %edx,(%eax)
c01067ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067d1:	89 d0                	mov    %edx,%eax
c01067d3:	01 c0                	add    %eax,%eax
c01067d5:	01 d0                	add    %edx,%eax
c01067d7:	c1 e0 03             	shl    $0x3,%eax
c01067da:	89 c2                	mov    %eax,%edx
c01067dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01067df:	01 d0                	add    %edx,%eax
c01067e1:	8b 00                	mov    (%eax),%eax
c01067e3:	89 c1                	mov    %eax,%ecx
c01067e5:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c01067ea:	ba 00 00 00 00       	mov    $0x0,%edx
c01067ef:	f7 f1                	div    %ecx
c01067f1:	89 c1                	mov    %eax,%ecx
c01067f3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067f6:	89 d0                	mov    %edx,%eax
c01067f8:	01 c0                	add    %eax,%eax
c01067fa:	01 d0                	add    %edx,%eax
c01067fc:	c1 e0 03             	shl    $0x3,%eax
c01067ff:	89 c2                	mov    %eax,%edx
c0106801:	8b 45 08             	mov    0x8(%ebp),%eax
c0106804:	01 d0                	add    %edx,%eax
c0106806:	89 ca                	mov    %ecx,%edx
c0106808:	89 50 04             	mov    %edx,0x4(%eax)
c010680b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010680e:	89 d0                	mov    %edx,%eax
c0106810:	01 c0                	add    %eax,%eax
c0106812:	01 d0                	add    %edx,%eax
c0106814:	c1 e0 03             	shl    $0x3,%eax
c0106817:	89 c2                	mov    %eax,%edx
c0106819:	8b 45 08             	mov    0x8(%ebp),%eax
c010681c:	01 d0                	add    %edx,%eax
c010681e:	83 c0 08             	add    $0x8,%eax
c0106821:	83 ec 0c             	sub    $0xc,%esp
c0106824:	50                   	push   %eax
c0106825:	e8 6b 38 00 00       	call   c010a095 <initDoubleLinkList>
c010682a:	83 c4 10             	add    $0x10,%esp
c010682d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0106831:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0106835:	0f 8e 44 ff ff ff    	jle    c010677f <init_memory_block_desc+0x12>
c010683b:	90                   	nop
c010683c:	c9                   	leave  
c010683d:	c3                   	ret    

c010683e <init_memory2>:
c010683e:	55                   	push   %ebp
c010683f:	89 e5                	mov    %esp,%ebp
c0106841:	83 ec 38             	sub    $0x38,%esp
c0106844:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c010684b:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106852:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106855:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c010685a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010685d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106862:	29 c2                	sub    %eax,%edx
c0106864:	89 d0                	mov    %edx,%eax
c0106866:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106869:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010686c:	89 c2                	mov    %eax,%edx
c010686e:	c1 ea 1f             	shr    $0x1f,%edx
c0106871:	01 d0                	add    %edx,%eax
c0106873:	d1 f8                	sar    %eax
c0106875:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c010687a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010687f:	83 ec 0c             	sub    $0xc,%esp
c0106882:	50                   	push   %eax
c0106883:	e8 52 08 00 00       	call   c01070da <disp_int>
c0106888:	83 c4 10             	add    $0x10,%esp
c010688b:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106890:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106893:	29 c2                	sub    %eax,%edx
c0106895:	89 d0                	mov    %edx,%eax
c0106897:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c010689c:	83 ec 0c             	sub    $0xc,%esp
c010689f:	68 f9 b5 10 c0       	push   $0xc010b5f9
c01068a4:	e8 e3 97 ff ff       	call   c010008c <disp_str>
c01068a9:	83 c4 10             	add    $0x10,%esp
c01068ac:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c01068b1:	83 ec 0c             	sub    $0xc,%esp
c01068b4:	50                   	push   %eax
c01068b5:	e8 20 08 00 00       	call   c01070da <disp_int>
c01068ba:	83 c4 10             	add    $0x10,%esp
c01068bd:	83 ec 0c             	sub    $0xc,%esp
c01068c0:	68 f9 b5 10 c0       	push   $0xc010b5f9
c01068c5:	e8 c2 97 ff ff       	call   c010008c <disp_str>
c01068ca:	83 c4 10             	add    $0x10,%esp
c01068cd:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01068d2:	05 ff 0f 00 00       	add    $0xfff,%eax
c01068d7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068dd:	85 c0                	test   %eax,%eax
c01068df:	0f 48 c2             	cmovs  %edx,%eax
c01068e2:	c1 f8 0c             	sar    $0xc,%eax
c01068e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01068e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01068eb:	83 c0 07             	add    $0x7,%eax
c01068ee:	8d 50 07             	lea    0x7(%eax),%edx
c01068f1:	85 c0                	test   %eax,%eax
c01068f3:	0f 48 c2             	cmovs  %edx,%eax
c01068f6:	c1 f8 03             	sar    $0x3,%eax
c01068f9:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c01068fe:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106903:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106908:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c010690d:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106913:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106918:	83 ec 04             	sub    $0x4,%esp
c010691b:	52                   	push   %edx
c010691c:	6a 00                	push   $0x0
c010691e:	50                   	push   %eax
c010691f:	e8 ab 58 00 00       	call   c010c1cf <Memset>
c0106924:	83 c4 10             	add    $0x10,%esp
c0106927:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c010692c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106931:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106937:	85 c0                	test   %eax,%eax
c0106939:	0f 48 c2             	cmovs  %edx,%eax
c010693c:	c1 f8 0c             	sar    $0xc,%eax
c010693f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106942:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106945:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106948:	ff 75 e8             	pushl  -0x18(%ebp)
c010694b:	6a 01                	push   $0x1
c010694d:	6a 00                	push   $0x0
c010694f:	68 ac 06 11 c0       	push   $0xc01106ac
c0106954:	e8 37 f1 ff ff       	call   c0105a90 <set_bits>
c0106959:	83 c4 10             	add    $0x10,%esp
c010695c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106961:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106966:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010696c:	85 c0                	test   %eax,%eax
c010696e:	0f 48 c2             	cmovs  %edx,%eax
c0106971:	c1 f8 0c             	sar    $0xc,%eax
c0106974:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106977:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010697a:	83 c0 07             	add    $0x7,%eax
c010697d:	8d 50 07             	lea    0x7(%eax),%edx
c0106980:	85 c0                	test   %eax,%eax
c0106982:	0f 48 c2             	cmovs  %edx,%eax
c0106985:	c1 f8 03             	sar    $0x3,%eax
c0106988:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c010698d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106992:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106998:	01 d0                	add    %edx,%eax
c010699a:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c010699f:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c01069a5:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c01069aa:	83 ec 04             	sub    $0x4,%esp
c01069ad:	52                   	push   %edx
c01069ae:	6a 00                	push   $0x0
c01069b0:	50                   	push   %eax
c01069b1:	e8 19 58 00 00       	call   c010c1cf <Memset>
c01069b6:	83 c4 10             	add    $0x10,%esp
c01069b9:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01069be:	05 ff 0f 00 00       	add    $0xfff,%eax
c01069c3:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069c9:	85 c0                	test   %eax,%eax
c01069cb:	0f 48 c2             	cmovs  %edx,%eax
c01069ce:	c1 f8 0c             	sar    $0xc,%eax
c01069d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01069d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01069d7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01069da:	ff 75 e8             	pushl  -0x18(%ebp)
c01069dd:	6a 01                	push   $0x1
c01069df:	ff 75 e0             	pushl  -0x20(%ebp)
c01069e2:	68 ac 06 11 c0       	push   $0xc01106ac
c01069e7:	e8 a4 f0 ff ff       	call   c0105a90 <set_bits>
c01069ec:	83 c4 10             	add    $0x10,%esp
c01069ef:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c01069f6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01069f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01069fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01069ff:	83 c0 07             	add    $0x7,%eax
c0106a02:	8d 50 07             	lea    0x7(%eax),%edx
c0106a05:	85 c0                	test   %eax,%eax
c0106a07:	0f 48 c2             	cmovs  %edx,%eax
c0106a0a:	c1 f8 03             	sar    $0x3,%eax
c0106a0d:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106a12:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106a17:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106a1d:	01 c2                	add    %eax,%edx
c0106a1f:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106a24:	01 d0                	add    %edx,%eax
c0106a26:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106a2b:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106a31:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106a36:	83 ec 04             	sub    $0x4,%esp
c0106a39:	52                   	push   %edx
c0106a3a:	6a 00                	push   $0x0
c0106a3c:	50                   	push   %eax
c0106a3d:	e8 8d 57 00 00       	call   c010c1cf <Memset>
c0106a42:	83 c4 10             	add    $0x10,%esp
c0106a45:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106a48:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a4b:	01 d0                	add    %edx,%eax
c0106a4d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a50:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106a55:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106a5a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a60:	85 c0                	test   %eax,%eax
c0106a62:	0f 48 c2             	cmovs  %edx,%eax
c0106a65:	c1 f8 0c             	sar    $0xc,%eax
c0106a68:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a6b:	ff 75 e8             	pushl  -0x18(%ebp)
c0106a6e:	6a 01                	push   $0x1
c0106a70:	ff 75 e0             	pushl  -0x20(%ebp)
c0106a73:	68 ac 06 11 c0       	push   $0xc01106ac
c0106a78:	e8 13 f0 ff ff       	call   c0105a90 <set_bits>
c0106a7d:	83 c4 10             	add    $0x10,%esp
c0106a80:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106a83:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a86:	01 d0                	add    %edx,%eax
c0106a88:	c1 e0 0c             	shl    $0xc,%eax
c0106a8b:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106a90:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a93:	83 c0 02             	add    $0x2,%eax
c0106a96:	c1 e0 0c             	shl    $0xc,%eax
c0106a99:	89 c2                	mov    %eax,%edx
c0106a9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106a9e:	01 d0                	add    %edx,%eax
c0106aa0:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106aa5:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106aac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106aaf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106ab2:	90                   	nop
c0106ab3:	c9                   	leave  
c0106ab4:	c3                   	ret    

c0106ab5 <init_memory>:
c0106ab5:	55                   	push   %ebp
c0106ab6:	89 e5                	mov    %esp,%ebp
c0106ab8:	83 ec 38             	sub    $0x38,%esp
c0106abb:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106ac2:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106ac9:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106ad0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106ad3:	05 00 00 40 00       	add    $0x400000,%eax
c0106ad8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106adb:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ade:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106ae1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106ae7:	85 c0                	test   %eax,%eax
c0106ae9:	0f 48 c2             	cmovs  %edx,%eax
c0106aec:	c1 f8 0c             	sar    $0xc,%eax
c0106aef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106af2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106af5:	89 c2                	mov    %eax,%edx
c0106af7:	c1 ea 1f             	shr    $0x1f,%edx
c0106afa:	01 d0                	add    %edx,%eax
c0106afc:	d1 f8                	sar    %eax
c0106afe:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106b01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106b04:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106b07:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106b0a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106b0d:	8d 50 07             	lea    0x7(%eax),%edx
c0106b10:	85 c0                	test   %eax,%eax
c0106b12:	0f 48 c2             	cmovs  %edx,%eax
c0106b15:	c1 f8 03             	sar    $0x3,%eax
c0106b18:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106b1b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106b1e:	8d 50 07             	lea    0x7(%eax),%edx
c0106b21:	85 c0                	test   %eax,%eax
c0106b23:	0f 48 c2             	cmovs  %edx,%eax
c0106b26:	c1 f8 03             	sar    $0x3,%eax
c0106b29:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106b2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b2f:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106b34:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106b39:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106b3c:	c1 e2 0c             	shl    $0xc,%edx
c0106b3f:	01 d0                	add    %edx,%eax
c0106b41:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b49:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106b4e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b51:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106b56:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106b5b:	83 ec 04             	sub    $0x4,%esp
c0106b5e:	ff 75 d8             	pushl  -0x28(%ebp)
c0106b61:	6a 00                	push   $0x0
c0106b63:	50                   	push   %eax
c0106b64:	e8 66 56 00 00       	call   c010c1cf <Memset>
c0106b69:	83 c4 10             	add    $0x10,%esp
c0106b6c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b6f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b72:	01 d0                	add    %edx,%eax
c0106b74:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106b79:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106b7c:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106b81:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106b86:	83 ec 04             	sub    $0x4,%esp
c0106b89:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106b8c:	6a 00                	push   $0x0
c0106b8e:	50                   	push   %eax
c0106b8f:	e8 3b 56 00 00       	call   c010c1cf <Memset>
c0106b94:	83 c4 10             	add    $0x10,%esp
c0106b97:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b9a:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106b9f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106ba2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ba5:	01 c2                	add    %eax,%edx
c0106ba7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106baa:	01 d0                	add    %edx,%eax
c0106bac:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106bb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106bb4:	05 00 00 10 00       	add    $0x100000,%eax
c0106bb9:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106bbe:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106bc3:	83 ec 04             	sub    $0x4,%esp
c0106bc6:	ff 75 d8             	pushl  -0x28(%ebp)
c0106bc9:	6a 00                	push   $0x0
c0106bcb:	50                   	push   %eax
c0106bcc:	e8 fe 55 00 00       	call   c010c1cf <Memset>
c0106bd1:	83 c4 10             	add    $0x10,%esp
c0106bd4:	83 ec 04             	sub    $0x4,%esp
c0106bd7:	68 f0 00 00 00       	push   $0xf0
c0106bdc:	6a 00                	push   $0x0
c0106bde:	68 e0 37 18 c0       	push   $0xc01837e0
c0106be3:	e8 e7 55 00 00       	call   c010c1cf <Memset>
c0106be8:	83 c4 10             	add    $0x10,%esp
c0106beb:	83 ec 0c             	sub    $0xc,%esp
c0106bee:	68 e0 37 18 c0       	push   $0xc01837e0
c0106bf3:	e8 75 fb ff ff       	call   c010676d <init_memory_block_desc>
c0106bf8:	83 c4 10             	add    $0x10,%esp
c0106bfb:	90                   	nop
c0106bfc:	c9                   	leave  
c0106bfd:	c3                   	ret    

c0106bfe <stop_here>:
c0106bfe:	55                   	push   %ebp
c0106bff:	89 e5                	mov    %esp,%ebp
c0106c01:	83 ec 08             	sub    $0x8,%esp
c0106c04:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106c0b:	00 00 00 
c0106c0e:	83 ec 0c             	sub    $0xc,%esp
c0106c11:	68 00 b6 10 c0       	push   $0xc010b600
c0106c16:	e8 71 94 ff ff       	call   c010008c <disp_str>
c0106c1b:	83 c4 10             	add    $0x10,%esp
c0106c1e:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106c23:	83 ec 0c             	sub    $0xc,%esp
c0106c26:	50                   	push   %eax
c0106c27:	e8 ae 04 00 00       	call   c01070da <disp_int>
c0106c2c:	83 c4 10             	add    $0x10,%esp
c0106c2f:	83 ec 0c             	sub    $0xc,%esp
c0106c32:	68 02 b6 10 c0       	push   $0xc010b602
c0106c37:	e8 50 94 ff ff       	call   c010008c <disp_str>
c0106c3c:	83 c4 10             	add    $0x10,%esp
c0106c3f:	90                   	nop
c0106c40:	c9                   	leave  
c0106c41:	c3                   	ret    

c0106c42 <catch_error>:
c0106c42:	55                   	push   %ebp
c0106c43:	89 e5                	mov    %esp,%ebp
c0106c45:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106c4a:	83 c0 01             	add    $0x1,%eax
c0106c4d:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106c52:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106c57:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106c5c:	90                   	nop
c0106c5d:	5d                   	pop    %ebp
c0106c5e:	c3                   	ret    

c0106c5f <intr_enable>:
c0106c5f:	55                   	push   %ebp
c0106c60:	89 e5                	mov    %esp,%ebp
c0106c62:	83 ec 18             	sub    $0x18,%esp
c0106c65:	e8 65 00 00 00       	call   c0106ccf <intr_get_status>
c0106c6a:	83 f8 01             	cmp    $0x1,%eax
c0106c6d:	75 0c                	jne    c0106c7b <intr_enable+0x1c>
c0106c6f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106c76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c79:	eb 0b                	jmp    c0106c86 <intr_enable+0x27>
c0106c7b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c82:	fb                   	sti    
c0106c83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c86:	c9                   	leave  
c0106c87:	c3                   	ret    

c0106c88 <intr_disable>:
c0106c88:	55                   	push   %ebp
c0106c89:	89 e5                	mov    %esp,%ebp
c0106c8b:	83 ec 18             	sub    $0x18,%esp
c0106c8e:	e8 3c 00 00 00       	call   c0106ccf <intr_get_status>
c0106c93:	83 f8 01             	cmp    $0x1,%eax
c0106c96:	75 0d                	jne    c0106ca5 <intr_disable+0x1d>
c0106c98:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106c9f:	fa                   	cli    
c0106ca0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ca3:	eb 0a                	jmp    c0106caf <intr_disable+0x27>
c0106ca5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106cac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106caf:	c9                   	leave  
c0106cb0:	c3                   	ret    

c0106cb1 <intr_set_status>:
c0106cb1:	55                   	push   %ebp
c0106cb2:	89 e5                	mov    %esp,%ebp
c0106cb4:	83 ec 08             	sub    $0x8,%esp
c0106cb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0106cba:	83 e0 01             	and    $0x1,%eax
c0106cbd:	85 c0                	test   %eax,%eax
c0106cbf:	74 07                	je     c0106cc8 <intr_set_status+0x17>
c0106cc1:	e8 99 ff ff ff       	call   c0106c5f <intr_enable>
c0106cc6:	eb 05                	jmp    c0106ccd <intr_set_status+0x1c>
c0106cc8:	e8 bb ff ff ff       	call   c0106c88 <intr_disable>
c0106ccd:	c9                   	leave  
c0106cce:	c3                   	ret    

c0106ccf <intr_get_status>:
c0106ccf:	55                   	push   %ebp
c0106cd0:	89 e5                	mov    %esp,%ebp
c0106cd2:	83 ec 10             	sub    $0x10,%esp
c0106cd5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106cdc:	9c                   	pushf  
c0106cdd:	58                   	pop    %eax
c0106cde:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106ce1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106ce4:	c1 e8 09             	shr    $0x9,%eax
c0106ce7:	83 e0 01             	and    $0x1,%eax
c0106cea:	c9                   	leave  
c0106ceb:	c3                   	ret    

c0106cec <Memcpy>:
c0106cec:	55                   	push   %ebp
c0106ced:	89 e5                	mov    %esp,%ebp
c0106cef:	83 ec 18             	sub    $0x18,%esp
c0106cf2:	e8 91 ff ff ff       	call   c0106c88 <intr_disable>
c0106cf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106cfa:	83 ec 04             	sub    $0x4,%esp
c0106cfd:	ff 75 10             	pushl  0x10(%ebp)
c0106d00:	ff 75 0c             	pushl  0xc(%ebp)
c0106d03:	ff 75 08             	pushl  0x8(%ebp)
c0106d06:	e8 96 54 00 00       	call   c010c1a1 <Memcpy2>
c0106d0b:	83 c4 10             	add    $0x10,%esp
c0106d0e:	83 ec 0c             	sub    $0xc,%esp
c0106d11:	ff 75 f4             	pushl  -0xc(%ebp)
c0106d14:	e8 98 ff ff ff       	call   c0106cb1 <intr_set_status>
c0106d19:	83 c4 10             	add    $0x10,%esp
c0106d1c:	90                   	nop
c0106d1d:	c9                   	leave  
c0106d1e:	c3                   	ret    

c0106d1f <untar>:
c0106d1f:	55                   	push   %ebp
c0106d20:	89 e5                	mov    %esp,%ebp
c0106d22:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106d28:	83 ec 08             	sub    $0x8,%esp
c0106d2b:	6a 00                	push   $0x0
c0106d2d:	ff 75 08             	pushl  0x8(%ebp)
c0106d30:	e8 2a de ff ff       	call   c0104b5f <open>
c0106d35:	83 c4 10             	add    $0x10,%esp
c0106d38:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106d3b:	83 ec 0c             	sub    $0xc,%esp
c0106d3e:	68 04 b6 10 c0       	push   $0xc010b604
c0106d43:	e8 60 18 00 00       	call   c01085a8 <Printf>
c0106d48:	83 c4 10             	add    $0x10,%esp
c0106d4b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106d52:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106d59:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d60:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106d67:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106d6e:	e9 63 02 00 00       	jmp    c0106fd6 <untar+0x2b7>
c0106d73:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106d77:	7e 58                	jle    c0106dd1 <untar+0xb2>
c0106d79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d7c:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106d81:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106d87:	85 c0                	test   %eax,%eax
c0106d89:	0f 48 c2             	cmovs  %edx,%eax
c0106d8c:	c1 f8 09             	sar    $0x9,%eax
c0106d8f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106d92:	83 ec 04             	sub    $0x4,%esp
c0106d95:	68 00 02 00 00       	push   $0x200
c0106d9a:	6a 00                	push   $0x0
c0106d9c:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106da2:	50                   	push   %eax
c0106da3:	e8 27 54 00 00       	call   c010c1cf <Memset>
c0106da8:	83 c4 10             	add    $0x10,%esp
c0106dab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106dae:	c1 e0 09             	shl    $0x9,%eax
c0106db1:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106db4:	83 ec 04             	sub    $0x4,%esp
c0106db7:	50                   	push   %eax
c0106db8:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106dbe:	50                   	push   %eax
c0106dbf:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106dc2:	e8 2d de ff ff       	call   c0104bf4 <read>
c0106dc7:	83 c4 10             	add    $0x10,%esp
c0106dca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106dd1:	83 ec 04             	sub    $0x4,%esp
c0106dd4:	68 00 02 00 00       	push   $0x200
c0106dd9:	6a 00                	push   $0x0
c0106ddb:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106de1:	50                   	push   %eax
c0106de2:	e8 e8 53 00 00       	call   c010c1cf <Memset>
c0106de7:	83 c4 10             	add    $0x10,%esp
c0106dea:	83 ec 04             	sub    $0x4,%esp
c0106ded:	68 00 02 00 00       	push   $0x200
c0106df2:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106df8:	50                   	push   %eax
c0106df9:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106dfc:	e8 f3 dd ff ff       	call   c0104bf4 <read>
c0106e01:	83 c4 10             	add    $0x10,%esp
c0106e04:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106e07:	83 ec 0c             	sub    $0xc,%esp
c0106e0a:	68 16 b6 10 c0       	push   $0xc010b616
c0106e0f:	e8 94 17 00 00       	call   c01085a8 <Printf>
c0106e14:	83 c4 10             	add    $0x10,%esp
c0106e17:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106e1b:	0f 84 c1 01 00 00    	je     c0106fe2 <untar+0x2c3>
c0106e21:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106e24:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106e27:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106e2e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106e34:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106e37:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106e3a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106e3d:	83 ec 08             	sub    $0x8,%esp
c0106e40:	6a 07                	push   $0x7
c0106e42:	ff 75 cc             	pushl  -0x34(%ebp)
c0106e45:	e8 15 dd ff ff       	call   c0104b5f <open>
c0106e4a:	83 c4 10             	add    $0x10,%esp
c0106e4d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106e50:	83 ec 0c             	sub    $0xc,%esp
c0106e53:	68 28 b6 10 c0       	push   $0xc010b628
c0106e58:	e8 4b 17 00 00       	call   c01085a8 <Printf>
c0106e5d:	83 c4 10             	add    $0x10,%esp
c0106e60:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106e67:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106e6a:	83 c0 7c             	add    $0x7c,%eax
c0106e6d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106e70:	83 ec 0c             	sub    $0xc,%esp
c0106e73:	ff 75 cc             	pushl  -0x34(%ebp)
c0106e76:	e8 8d 53 00 00       	call   c010c208 <Strlen>
c0106e7b:	83 c4 10             	add    $0x10,%esp
c0106e7e:	85 c0                	test   %eax,%eax
c0106e80:	75 28                	jne    c0106eaa <untar+0x18b>
c0106e82:	83 ec 0c             	sub    $0xc,%esp
c0106e85:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106e88:	e8 7b 53 00 00       	call   c010c208 <Strlen>
c0106e8d:	83 c4 10             	add    $0x10,%esp
c0106e90:	85 c0                	test   %eax,%eax
c0106e92:	75 16                	jne    c0106eaa <untar+0x18b>
c0106e94:	83 ec 0c             	sub    $0xc,%esp
c0106e97:	68 3a b6 10 c0       	push   $0xc010b63a
c0106e9c:	e8 07 17 00 00       	call   c01085a8 <Printf>
c0106ea1:	83 c4 10             	add    $0x10,%esp
c0106ea4:	90                   	nop
c0106ea5:	e9 39 01 00 00       	jmp    c0106fe3 <untar+0x2c4>
c0106eaa:	83 ec 0c             	sub    $0xc,%esp
c0106ead:	68 41 b6 10 c0       	push   $0xc010b641
c0106eb2:	e8 f1 16 00 00       	call   c01085a8 <Printf>
c0106eb7:	83 c4 10             	add    $0x10,%esp
c0106eba:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106ebd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106ec0:	eb 1f                	jmp    c0106ee1 <untar+0x1c2>
c0106ec2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106ec5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106ecc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ecf:	0f b6 00             	movzbl (%eax),%eax
c0106ed2:	0f be c0             	movsbl %al,%eax
c0106ed5:	83 e8 30             	sub    $0x30,%eax
c0106ed8:	01 d0                	add    %edx,%eax
c0106eda:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106edd:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106ee1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ee4:	0f b6 00             	movzbl (%eax),%eax
c0106ee7:	84 c0                	test   %al,%al
c0106ee9:	75 d7                	jne    c0106ec2 <untar+0x1a3>
c0106eeb:	83 ec 0c             	sub    $0xc,%esp
c0106eee:	68 4f b6 10 c0       	push   $0xc010b64f
c0106ef3:	e8 b0 16 00 00       	call   c01085a8 <Printf>
c0106ef8:	83 c4 10             	add    $0x10,%esp
c0106efb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106efe:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106f01:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106f08:	83 ec 08             	sub    $0x8,%esp
c0106f0b:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f0e:	68 5d b6 10 c0       	push   $0xc010b65d
c0106f13:	e8 90 16 00 00       	call   c01085a8 <Printf>
c0106f18:	83 c4 10             	add    $0x10,%esp
c0106f1b:	83 ec 08             	sub    $0x8,%esp
c0106f1e:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f21:	68 6f b6 10 c0       	push   $0xc010b66f
c0106f26:	e8 7d 16 00 00       	call   c01085a8 <Printf>
c0106f2b:	83 c4 10             	add    $0x10,%esp
c0106f2e:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106f31:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106f34:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106f38:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106f3b:	e8 02 fd ff ff       	call   c0106c42 <catch_error>
c0106f40:	83 ec 04             	sub    $0x4,%esp
c0106f43:	ff 75 b8             	pushl  -0x48(%ebp)
c0106f46:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106f4c:	50                   	push   %eax
c0106f4d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106f50:	e8 9f dc ff ff       	call   c0104bf4 <read>
c0106f55:	83 c4 10             	add    $0x10,%esp
c0106f58:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106f5b:	83 ec 04             	sub    $0x4,%esp
c0106f5e:	ff 75 b8             	pushl  -0x48(%ebp)
c0106f61:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106f67:	50                   	push   %eax
c0106f68:	ff 75 c8             	pushl  -0x38(%ebp)
c0106f6b:	e8 05 de ff ff       	call   c0104d75 <write>
c0106f70:	83 c4 10             	add    $0x10,%esp
c0106f73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f76:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106f79:	7d 02                	jge    c0106f7d <untar+0x25e>
c0106f7b:	eb be                	jmp    c0106f3b <untar+0x21c>
c0106f7d:	90                   	nop
c0106f7e:	83 ec 08             	sub    $0x8,%esp
c0106f81:	ff 75 f4             	pushl  -0xc(%ebp)
c0106f84:	68 81 b6 10 c0       	push   $0xc010b681
c0106f89:	e8 1a 16 00 00       	call   c01085a8 <Printf>
c0106f8e:	83 c4 10             	add    $0x10,%esp
c0106f91:	83 ec 08             	sub    $0x8,%esp
c0106f94:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f97:	68 93 b6 10 c0       	push   $0xc010b693
c0106f9c:	e8 07 16 00 00       	call   c01085a8 <Printf>
c0106fa1:	83 c4 10             	add    $0x10,%esp
c0106fa4:	83 ec 0c             	sub    $0xc,%esp
c0106fa7:	68 a4 b6 10 c0       	push   $0xc010b6a4
c0106fac:	e8 f7 15 00 00       	call   c01085a8 <Printf>
c0106fb1:	83 c4 10             	add    $0x10,%esp
c0106fb4:	83 ec 0c             	sub    $0xc,%esp
c0106fb7:	ff 75 c8             	pushl  -0x38(%ebp)
c0106fba:	e8 3b de ff ff       	call   c0104dfa <close>
c0106fbf:	83 c4 10             	add    $0x10,%esp
c0106fc2:	83 ec 0c             	sub    $0xc,%esp
c0106fc5:	68 b2 b6 10 c0       	push   $0xc010b6b2
c0106fca:	e8 d9 15 00 00       	call   c01085a8 <Printf>
c0106fcf:	83 c4 10             	add    $0x10,%esp
c0106fd2:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106fd6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106fda:	0f 8f 93 fd ff ff    	jg     c0106d73 <untar+0x54>
c0106fe0:	eb 01                	jmp    c0106fe3 <untar+0x2c4>
c0106fe2:	90                   	nop
c0106fe3:	83 ec 0c             	sub    $0xc,%esp
c0106fe6:	68 bf b6 10 c0       	push   $0xc010b6bf
c0106feb:	e8 b8 15 00 00       	call   c01085a8 <Printf>
c0106ff0:	83 c4 10             	add    $0x10,%esp
c0106ff3:	83 ec 0c             	sub    $0xc,%esp
c0106ff6:	68 d1 b6 10 c0       	push   $0xc010b6d1
c0106ffb:	e8 a8 15 00 00       	call   c01085a8 <Printf>
c0107000:	83 c4 10             	add    $0x10,%esp
c0107003:	83 ec 0c             	sub    $0xc,%esp
c0107006:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107009:	e8 ec dd ff ff       	call   c0104dfa <close>
c010700e:	83 c4 10             	add    $0x10,%esp
c0107011:	83 ec 0c             	sub    $0xc,%esp
c0107014:	68 e1 b6 10 c0       	push   $0xc010b6e1
c0107019:	e8 8a 15 00 00       	call   c01085a8 <Printf>
c010701e:	83 c4 10             	add    $0x10,%esp
c0107021:	83 ec 0c             	sub    $0xc,%esp
c0107024:	68 f4 b6 10 c0       	push   $0xc010b6f4
c0107029:	e8 7a 15 00 00       	call   c01085a8 <Printf>
c010702e:	83 c4 10             	add    $0x10,%esp
c0107031:	90                   	nop
c0107032:	c9                   	leave  
c0107033:	c3                   	ret    

c0107034 <atoi>:
c0107034:	55                   	push   %ebp
c0107035:	89 e5                	mov    %esp,%ebp
c0107037:	83 ec 10             	sub    $0x10,%esp
c010703a:	8b 45 08             	mov    0x8(%ebp),%eax
c010703d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107040:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107043:	8d 50 01             	lea    0x1(%eax),%edx
c0107046:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107049:	c6 00 30             	movb   $0x30,(%eax)
c010704c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010704f:	8d 50 01             	lea    0x1(%eax),%edx
c0107052:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0107055:	c6 00 78             	movb   $0x78,(%eax)
c0107058:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c010705c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0107060:	75 0e                	jne    c0107070 <atoi+0x3c>
c0107062:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107065:	8d 50 01             	lea    0x1(%eax),%edx
c0107068:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010706b:	c6 00 30             	movb   $0x30,(%eax)
c010706e:	eb 61                	jmp    c01070d1 <atoi+0x9d>
c0107070:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0107077:	eb 52                	jmp    c01070cb <atoi+0x97>
c0107079:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010707c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010707f:	89 c1                	mov    %eax,%ecx
c0107081:	d3 fa                	sar    %cl,%edx
c0107083:	89 d0                	mov    %edx,%eax
c0107085:	83 e0 0f             	and    $0xf,%eax
c0107088:	88 45 fb             	mov    %al,-0x5(%ebp)
c010708b:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c010708f:	75 06                	jne    c0107097 <atoi+0x63>
c0107091:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0107095:	74 2f                	je     c01070c6 <atoi+0x92>
c0107097:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c010709b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010709f:	83 c0 30             	add    $0x30,%eax
c01070a2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070a5:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c01070a9:	7e 0a                	jle    c01070b5 <atoi+0x81>
c01070ab:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c01070af:	83 c0 07             	add    $0x7,%eax
c01070b2:	88 45 fb             	mov    %al,-0x5(%ebp)
c01070b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01070b8:	8d 50 01             	lea    0x1(%eax),%edx
c01070bb:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01070be:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c01070c2:	88 10                	mov    %dl,(%eax)
c01070c4:	eb 01                	jmp    c01070c7 <atoi+0x93>
c01070c6:	90                   	nop
c01070c7:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c01070cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01070cf:	79 a8                	jns    c0107079 <atoi+0x45>
c01070d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01070d4:	c6 00 00             	movb   $0x0,(%eax)
c01070d7:	90                   	nop
c01070d8:	c9                   	leave  
c01070d9:	c3                   	ret    

c01070da <disp_int>:
c01070da:	55                   	push   %ebp
c01070db:	89 e5                	mov    %esp,%ebp
c01070dd:	83 ec 18             	sub    $0x18,%esp
c01070e0:	ff 75 08             	pushl  0x8(%ebp)
c01070e3:	8d 45 ee             	lea    -0x12(%ebp),%eax
c01070e6:	50                   	push   %eax
c01070e7:	e8 48 ff ff ff       	call   c0107034 <atoi>
c01070ec:	83 c4 08             	add    $0x8,%esp
c01070ef:	83 ec 08             	sub    $0x8,%esp
c01070f2:	6a 0b                	push   $0xb
c01070f4:	8d 45 ee             	lea    -0x12(%ebp),%eax
c01070f7:	50                   	push   %eax
c01070f8:	e8 ca 8f ff ff       	call   c01000c7 <disp_str_colour>
c01070fd:	83 c4 10             	add    $0x10,%esp
c0107100:	90                   	nop
c0107101:	c9                   	leave  
c0107102:	c3                   	ret    

c0107103 <do_page_fault>:
c0107103:	55                   	push   %ebp
c0107104:	89 e5                	mov    %esp,%ebp
c0107106:	83 ec 28             	sub    $0x28,%esp
c0107109:	0f 20 d0             	mov    %cr2,%eax
c010710c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010710f:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107116:	00 00 00 
c0107119:	83 ec 0c             	sub    $0xc,%esp
c010711c:	68 ff b6 10 c0       	push   $0xc010b6ff
c0107121:	e8 66 8f ff ff       	call   c010008c <disp_str>
c0107126:	83 c4 10             	add    $0x10,%esp
c0107129:	83 ec 0c             	sub    $0xc,%esp
c010712c:	68 0e b7 10 c0       	push   $0xc010b70e
c0107131:	e8 56 8f ff ff       	call   c010008c <disp_str>
c0107136:	83 c4 10             	add    $0x10,%esp
c0107139:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010713c:	83 ec 0c             	sub    $0xc,%esp
c010713f:	50                   	push   %eax
c0107140:	e8 95 ff ff ff       	call   c01070da <disp_int>
c0107145:	83 c4 10             	add    $0x10,%esp
c0107148:	83 ec 0c             	sub    $0xc,%esp
c010714b:	68 13 b7 10 c0       	push   $0xc010b713
c0107150:	e8 37 8f ff ff       	call   c010008c <disp_str>
c0107155:	83 c4 10             	add    $0x10,%esp
c0107158:	83 ec 0c             	sub    $0xc,%esp
c010715b:	ff 75 f4             	pushl  -0xc(%ebp)
c010715e:	e8 51 ec ff ff       	call   c0105db4 <ptr_pde>
c0107163:	83 c4 10             	add    $0x10,%esp
c0107166:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107169:	83 ec 0c             	sub    $0xc,%esp
c010716c:	ff 75 f4             	pushl  -0xc(%ebp)
c010716f:	e8 53 ec ff ff       	call   c0105dc7 <ptr_pte>
c0107174:	83 c4 10             	add    $0x10,%esp
c0107177:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010717a:	83 ec 0c             	sub    $0xc,%esp
c010717d:	68 15 b7 10 c0       	push   $0xc010b715
c0107182:	e8 05 8f ff ff       	call   c010008c <disp_str>
c0107187:	83 c4 10             	add    $0x10,%esp
c010718a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010718d:	83 ec 0c             	sub    $0xc,%esp
c0107190:	50                   	push   %eax
c0107191:	e8 44 ff ff ff       	call   c01070da <disp_int>
c0107196:	83 c4 10             	add    $0x10,%esp
c0107199:	83 ec 0c             	sub    $0xc,%esp
c010719c:	68 1a b7 10 c0       	push   $0xc010b71a
c01071a1:	e8 e6 8e ff ff       	call   c010008c <disp_str>
c01071a6:	83 c4 10             	add    $0x10,%esp
c01071a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01071ac:	8b 00                	mov    (%eax),%eax
c01071ae:	83 ec 0c             	sub    $0xc,%esp
c01071b1:	50                   	push   %eax
c01071b2:	e8 23 ff ff ff       	call   c01070da <disp_int>
c01071b7:	83 c4 10             	add    $0x10,%esp
c01071ba:	83 ec 0c             	sub    $0xc,%esp
c01071bd:	68 13 b7 10 c0       	push   $0xc010b713
c01071c2:	e8 c5 8e ff ff       	call   c010008c <disp_str>
c01071c7:	83 c4 10             	add    $0x10,%esp
c01071ca:	83 ec 0c             	sub    $0xc,%esp
c01071cd:	68 23 b7 10 c0       	push   $0xc010b723
c01071d2:	e8 b5 8e ff ff       	call   c010008c <disp_str>
c01071d7:	83 c4 10             	add    $0x10,%esp
c01071da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01071dd:	83 ec 0c             	sub    $0xc,%esp
c01071e0:	50                   	push   %eax
c01071e1:	e8 f4 fe ff ff       	call   c01070da <disp_int>
c01071e6:	83 c4 10             	add    $0x10,%esp
c01071e9:	83 ec 0c             	sub    $0xc,%esp
c01071ec:	68 28 b7 10 c0       	push   $0xc010b728
c01071f1:	e8 96 8e ff ff       	call   c010008c <disp_str>
c01071f6:	83 c4 10             	add    $0x10,%esp
c01071f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01071fc:	8b 00                	mov    (%eax),%eax
c01071fe:	83 ec 0c             	sub    $0xc,%esp
c0107201:	50                   	push   %eax
c0107202:	e8 d3 fe ff ff       	call   c01070da <disp_int>
c0107207:	83 c4 10             	add    $0x10,%esp
c010720a:	83 ec 0c             	sub    $0xc,%esp
c010720d:	68 13 b7 10 c0       	push   $0xc010b713
c0107212:	e8 75 8e ff ff       	call   c010008c <disp_str>
c0107217:	83 c4 10             	add    $0x10,%esp
c010721a:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0107221:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107224:	8b 00                	mov    (%eax),%eax
c0107226:	83 e0 01             	and    $0x1,%eax
c0107229:	85 c0                	test   %eax,%eax
c010722b:	74 09                	je     c0107236 <do_page_fault+0x133>
c010722d:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0107234:	eb 07                	jmp    c010723d <do_page_fault+0x13a>
c0107236:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010723d:	90                   	nop
c010723e:	c9                   	leave  
c010723f:	c3                   	ret    

c0107240 <exception_handler>:
c0107240:	55                   	push   %ebp
c0107241:	89 e5                	mov    %esp,%ebp
c0107243:	57                   	push   %edi
c0107244:	56                   	push   %esi
c0107245:	53                   	push   %ebx
c0107246:	83 ec 6c             	sub    $0x6c,%esp
c0107249:	8d 45 8c             	lea    -0x74(%ebp),%eax
c010724c:	bb a0 b9 10 c0       	mov    $0xc010b9a0,%ebx
c0107251:	ba 13 00 00 00       	mov    $0x13,%edx
c0107256:	89 c7                	mov    %eax,%edi
c0107258:	89 de                	mov    %ebx,%esi
c010725a:	89 d1                	mov    %edx,%ecx
c010725c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010725e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107265:	eb 04                	jmp    c010726b <exception_handler+0x2b>
c0107267:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010726b:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0107272:	7e f3                	jle    c0107267 <exception_handler+0x27>
c0107274:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010727b:	00 00 00 
c010727e:	83 ec 0c             	sub    $0xc,%esp
c0107281:	68 31 b7 10 c0       	push   $0xc010b731
c0107286:	e8 01 8e ff ff       	call   c010008c <disp_str>
c010728b:	83 c4 10             	add    $0x10,%esp
c010728e:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107295:	8b 45 08             	mov    0x8(%ebp),%eax
c0107298:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c010729c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010729f:	83 ec 0c             	sub    $0xc,%esp
c01072a2:	ff 75 dc             	pushl  -0x24(%ebp)
c01072a5:	e8 e2 8d ff ff       	call   c010008c <disp_str>
c01072aa:	83 c4 10             	add    $0x10,%esp
c01072ad:	83 ec 0c             	sub    $0xc,%esp
c01072b0:	68 3f b7 10 c0       	push   $0xc010b73f
c01072b5:	e8 d2 8d ff ff       	call   c010008c <disp_str>
c01072ba:	83 c4 10             	add    $0x10,%esp
c01072bd:	83 ec 0c             	sub    $0xc,%esp
c01072c0:	68 42 b7 10 c0       	push   $0xc010b742
c01072c5:	e8 c2 8d ff ff       	call   c010008c <disp_str>
c01072ca:	83 c4 10             	add    $0x10,%esp
c01072cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01072d0:	83 ec 0c             	sub    $0xc,%esp
c01072d3:	50                   	push   %eax
c01072d4:	e8 01 fe ff ff       	call   c01070da <disp_int>
c01072d9:	83 c4 10             	add    $0x10,%esp
c01072dc:	83 ec 0c             	sub    $0xc,%esp
c01072df:	68 3f b7 10 c0       	push   $0xc010b73f
c01072e4:	e8 a3 8d ff ff       	call   c010008c <disp_str>
c01072e9:	83 c4 10             	add    $0x10,%esp
c01072ec:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c01072f0:	74 2f                	je     c0107321 <exception_handler+0xe1>
c01072f2:	83 ec 0c             	sub    $0xc,%esp
c01072f5:	68 4a b7 10 c0       	push   $0xc010b74a
c01072fa:	e8 8d 8d ff ff       	call   c010008c <disp_str>
c01072ff:	83 c4 10             	add    $0x10,%esp
c0107302:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107305:	83 ec 0c             	sub    $0xc,%esp
c0107308:	50                   	push   %eax
c0107309:	e8 cc fd ff ff       	call   c01070da <disp_int>
c010730e:	83 c4 10             	add    $0x10,%esp
c0107311:	83 ec 0c             	sub    $0xc,%esp
c0107314:	68 3f b7 10 c0       	push   $0xc010b73f
c0107319:	e8 6e 8d ff ff       	call   c010008c <disp_str>
c010731e:	83 c4 10             	add    $0x10,%esp
c0107321:	83 ec 0c             	sub    $0xc,%esp
c0107324:	68 54 b7 10 c0       	push   $0xc010b754
c0107329:	e8 5e 8d ff ff       	call   c010008c <disp_str>
c010732e:	83 c4 10             	add    $0x10,%esp
c0107331:	83 ec 0c             	sub    $0xc,%esp
c0107334:	ff 75 14             	pushl  0x14(%ebp)
c0107337:	e8 9e fd ff ff       	call   c01070da <disp_int>
c010733c:	83 c4 10             	add    $0x10,%esp
c010733f:	83 ec 0c             	sub    $0xc,%esp
c0107342:	68 3f b7 10 c0       	push   $0xc010b73f
c0107347:	e8 40 8d ff ff       	call   c010008c <disp_str>
c010734c:	83 c4 10             	add    $0x10,%esp
c010734f:	83 ec 0c             	sub    $0xc,%esp
c0107352:	68 58 b7 10 c0       	push   $0xc010b758
c0107357:	e8 30 8d ff ff       	call   c010008c <disp_str>
c010735c:	83 c4 10             	add    $0x10,%esp
c010735f:	8b 45 10             	mov    0x10(%ebp),%eax
c0107362:	83 ec 0c             	sub    $0xc,%esp
c0107365:	50                   	push   %eax
c0107366:	e8 6f fd ff ff       	call   c01070da <disp_int>
c010736b:	83 c4 10             	add    $0x10,%esp
c010736e:	83 ec 0c             	sub    $0xc,%esp
c0107371:	68 3f b7 10 c0       	push   $0xc010b73f
c0107376:	e8 11 8d ff ff       	call   c010008c <disp_str>
c010737b:	83 c4 10             	add    $0x10,%esp
c010737e:	83 ec 0c             	sub    $0xc,%esp
c0107381:	68 5d b7 10 c0       	push   $0xc010b75d
c0107386:	e8 01 8d ff ff       	call   c010008c <disp_str>
c010738b:	83 c4 10             	add    $0x10,%esp
c010738e:	83 ec 0c             	sub    $0xc,%esp
c0107391:	ff 75 18             	pushl  0x18(%ebp)
c0107394:	e8 41 fd ff ff       	call   c01070da <disp_int>
c0107399:	83 c4 10             	add    $0x10,%esp
c010739c:	83 ec 0c             	sub    $0xc,%esp
c010739f:	68 3f b7 10 c0       	push   $0xc010b73f
c01073a4:	e8 e3 8c ff ff       	call   c010008c <disp_str>
c01073a9:	83 c4 10             	add    $0x10,%esp
c01073ac:	83 ec 0c             	sub    $0xc,%esp
c01073af:	68 68 b7 10 c0       	push   $0xc010b768
c01073b4:	e8 d3 8c ff ff       	call   c010008c <disp_str>
c01073b9:	83 c4 10             	add    $0x10,%esp
c01073bc:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c01073c0:	75 45                	jne    c0107407 <exception_handler+0x1c7>
c01073c2:	0f 20 d0             	mov    %cr2,%eax
c01073c5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01073c8:	83 ec 0c             	sub    $0xc,%esp
c01073cb:	68 87 b7 10 c0       	push   $0xc010b787
c01073d0:	e8 b7 8c ff ff       	call   c010008c <disp_str>
c01073d5:	83 c4 10             	add    $0x10,%esp
c01073d8:	83 ec 0c             	sub    $0xc,%esp
c01073db:	68 0e b7 10 c0       	push   $0xc010b70e
c01073e0:	e8 a7 8c ff ff       	call   c010008c <disp_str>
c01073e5:	83 c4 10             	add    $0x10,%esp
c01073e8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01073eb:	83 ec 0c             	sub    $0xc,%esp
c01073ee:	50                   	push   %eax
c01073ef:	e8 e6 fc ff ff       	call   c01070da <disp_int>
c01073f4:	83 c4 10             	add    $0x10,%esp
c01073f7:	83 ec 0c             	sub    $0xc,%esp
c01073fa:	68 13 b7 10 c0       	push   $0xc010b713
c01073ff:	e8 88 8c ff ff       	call   c010008c <disp_str>
c0107404:	83 c4 10             	add    $0x10,%esp
c0107407:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c010740b:	75 11                	jne    c010741e <exception_handler+0x1de>
c010740d:	83 ec 0c             	sub    $0xc,%esp
c0107410:	68 93 b7 10 c0       	push   $0xc010b793
c0107415:	e8 72 8c ff ff       	call   c010008c <disp_str>
c010741a:	83 c4 10             	add    $0x10,%esp
c010741d:	90                   	nop
c010741e:	90                   	nop
c010741f:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107422:	5b                   	pop    %ebx
c0107423:	5e                   	pop    %esi
c0107424:	5f                   	pop    %edi
c0107425:	5d                   	pop    %ebp
c0107426:	c3                   	ret    

c0107427 <init_internal_interrupt>:
c0107427:	55                   	push   %ebp
c0107428:	89 e5                	mov    %esp,%ebp
c010742a:	83 ec 08             	sub    $0x8,%esp
c010742d:	6a 0e                	push   $0xe
c010742f:	6a 08                	push   $0x8
c0107431:	68 03 01 10 c0       	push   $0xc0100103
c0107436:	6a 00                	push   $0x0
c0107438:	e8 62 c7 ff ff       	call   c0103b9f <InitInterruptDesc>
c010743d:	83 c4 10             	add    $0x10,%esp
c0107440:	6a 0e                	push   $0xe
c0107442:	6a 08                	push   $0x8
c0107444:	68 09 01 10 c0       	push   $0xc0100109
c0107449:	6a 01                	push   $0x1
c010744b:	e8 4f c7 ff ff       	call   c0103b9f <InitInterruptDesc>
c0107450:	83 c4 10             	add    $0x10,%esp
c0107453:	6a 0e                	push   $0xe
c0107455:	6a 08                	push   $0x8
c0107457:	68 0f 01 10 c0       	push   $0xc010010f
c010745c:	6a 02                	push   $0x2
c010745e:	e8 3c c7 ff ff       	call   c0103b9f <InitInterruptDesc>
c0107463:	83 c4 10             	add    $0x10,%esp
c0107466:	6a 0e                	push   $0xe
c0107468:	6a 08                	push   $0x8
c010746a:	68 15 01 10 c0       	push   $0xc0100115
c010746f:	6a 03                	push   $0x3
c0107471:	e8 29 c7 ff ff       	call   c0103b9f <InitInterruptDesc>
c0107476:	83 c4 10             	add    $0x10,%esp
c0107479:	6a 0e                	push   $0xe
c010747b:	6a 08                	push   $0x8
c010747d:	68 1b 01 10 c0       	push   $0xc010011b
c0107482:	6a 04                	push   $0x4
c0107484:	e8 16 c7 ff ff       	call   c0103b9f <InitInterruptDesc>
c0107489:	83 c4 10             	add    $0x10,%esp
c010748c:	6a 0e                	push   $0xe
c010748e:	6a 08                	push   $0x8
c0107490:	68 21 01 10 c0       	push   $0xc0100121
c0107495:	6a 05                	push   $0x5
c0107497:	e8 03 c7 ff ff       	call   c0103b9f <InitInterruptDesc>
c010749c:	83 c4 10             	add    $0x10,%esp
c010749f:	6a 0e                	push   $0xe
c01074a1:	6a 08                	push   $0x8
c01074a3:	68 27 01 10 c0       	push   $0xc0100127
c01074a8:	6a 06                	push   $0x6
c01074aa:	e8 f0 c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c01074af:	83 c4 10             	add    $0x10,%esp
c01074b2:	6a 0e                	push   $0xe
c01074b4:	6a 08                	push   $0x8
c01074b6:	68 2d 01 10 c0       	push   $0xc010012d
c01074bb:	6a 07                	push   $0x7
c01074bd:	e8 dd c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c01074c2:	83 c4 10             	add    $0x10,%esp
c01074c5:	6a 0e                	push   $0xe
c01074c7:	6a 08                	push   $0x8
c01074c9:	68 33 01 10 c0       	push   $0xc0100133
c01074ce:	6a 08                	push   $0x8
c01074d0:	e8 ca c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c01074d5:	83 c4 10             	add    $0x10,%esp
c01074d8:	6a 0e                	push   $0xe
c01074da:	6a 08                	push   $0x8
c01074dc:	68 37 01 10 c0       	push   $0xc0100137
c01074e1:	6a 09                	push   $0x9
c01074e3:	e8 b7 c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c01074e8:	83 c4 10             	add    $0x10,%esp
c01074eb:	6a 0e                	push   $0xe
c01074ed:	6a 08                	push   $0x8
c01074ef:	68 3d 01 10 c0       	push   $0xc010013d
c01074f4:	6a 0a                	push   $0xa
c01074f6:	e8 a4 c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c01074fb:	83 c4 10             	add    $0x10,%esp
c01074fe:	6a 0e                	push   $0xe
c0107500:	6a 08                	push   $0x8
c0107502:	68 41 01 10 c0       	push   $0xc0100141
c0107507:	6a 0b                	push   $0xb
c0107509:	e8 91 c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c010750e:	83 c4 10             	add    $0x10,%esp
c0107511:	6a 0e                	push   $0xe
c0107513:	6a 08                	push   $0x8
c0107515:	68 45 01 10 c0       	push   $0xc0100145
c010751a:	6a 0c                	push   $0xc
c010751c:	e8 7e c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c0107521:	83 c4 10             	add    $0x10,%esp
c0107524:	6a 0e                	push   $0xe
c0107526:	6a 08                	push   $0x8
c0107528:	68 49 01 10 c0       	push   $0xc0100149
c010752d:	6a 0d                	push   $0xd
c010752f:	e8 6b c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c0107534:	83 c4 10             	add    $0x10,%esp
c0107537:	6a 0e                	push   $0xe
c0107539:	6a 08                	push   $0x8
c010753b:	68 54 01 10 c0       	push   $0xc0100154
c0107540:	6a 0e                	push   $0xe
c0107542:	e8 58 c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c0107547:	83 c4 10             	add    $0x10,%esp
c010754a:	6a 0e                	push   $0xe
c010754c:	6a 08                	push   $0x8
c010754e:	68 58 01 10 c0       	push   $0xc0100158
c0107553:	6a 10                	push   $0x10
c0107555:	e8 45 c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c010755a:	83 c4 10             	add    $0x10,%esp
c010755d:	6a 0e                	push   $0xe
c010755f:	6a 08                	push   $0x8
c0107561:	68 5e 01 10 c0       	push   $0xc010015e
c0107566:	6a 11                	push   $0x11
c0107568:	e8 32 c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c010756d:	83 c4 10             	add    $0x10,%esp
c0107570:	6a 0e                	push   $0xe
c0107572:	6a 08                	push   $0x8
c0107574:	68 62 01 10 c0       	push   $0xc0100162
c0107579:	6a 12                	push   $0x12
c010757b:	e8 1f c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c0107580:	83 c4 10             	add    $0x10,%esp
c0107583:	6a 0e                	push   $0xe
c0107585:	6a 0e                	push   $0xe
c0107587:	68 6c 02 10 c0       	push   $0xc010026c
c010758c:	68 90 00 00 00       	push   $0x90
c0107591:	e8 09 c6 ff ff       	call   c0103b9f <InitInterruptDesc>
c0107596:	83 c4 10             	add    $0x10,%esp
c0107599:	90                   	nop
c010759a:	c9                   	leave  
c010759b:	c3                   	ret    

c010759c <spurious_irq>:
c010759c:	55                   	push   %ebp
c010759d:	89 e5                	mov    %esp,%ebp
c010759f:	83 ec 08             	sub    $0x8,%esp
c01075a2:	83 ec 08             	sub    $0x8,%esp
c01075a5:	6a 0b                	push   $0xb
c01075a7:	68 ec b9 10 c0       	push   $0xc010b9ec
c01075ac:	e8 16 8b ff ff       	call   c01000c7 <disp_str_colour>
c01075b1:	83 c4 10             	add    $0x10,%esp
c01075b4:	83 ec 0c             	sub    $0xc,%esp
c01075b7:	ff 75 08             	pushl  0x8(%ebp)
c01075ba:	e8 1b fb ff ff       	call   c01070da <disp_int>
c01075bf:	83 c4 10             	add    $0x10,%esp
c01075c2:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01075c7:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01075cd:	83 c0 01             	add    $0x1,%eax
c01075d0:	83 d2 00             	adc    $0x0,%edx
c01075d3:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c01075d8:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c01075de:	83 ec 0c             	sub    $0xc,%esp
c01075e1:	68 00 b6 10 c0       	push   $0xc010b600
c01075e6:	e8 a1 8a ff ff       	call   c010008c <disp_str>
c01075eb:	83 c4 10             	add    $0x10,%esp
c01075ee:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01075f3:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01075f9:	83 ec 0c             	sub    $0xc,%esp
c01075fc:	50                   	push   %eax
c01075fd:	e8 d8 fa ff ff       	call   c01070da <disp_int>
c0107602:	83 c4 10             	add    $0x10,%esp
c0107605:	83 ec 0c             	sub    $0xc,%esp
c0107608:	68 02 b6 10 c0       	push   $0xc010b602
c010760d:	e8 7a 8a ff ff       	call   c010008c <disp_str>
c0107612:	83 c4 10             	add    $0x10,%esp
c0107615:	83 ec 08             	sub    $0x8,%esp
c0107618:	6a 0c                	push   $0xc
c010761a:	68 14 ba 10 c0       	push   $0xc010ba14
c010761f:	e8 a3 8a ff ff       	call   c01000c7 <disp_str_colour>
c0107624:	83 c4 10             	add    $0x10,%esp
c0107627:	90                   	nop
c0107628:	c9                   	leave  
c0107629:	c3                   	ret    

c010762a <init_keyboard>:
c010762a:	55                   	push   %ebp
c010762b:	89 e5                	mov    %esp,%ebp
c010762d:	83 ec 08             	sub    $0x8,%esp
c0107630:	83 ec 04             	sub    $0x4,%esp
c0107633:	68 00 02 00 00       	push   $0x200
c0107638:	6a 00                	push   $0x0
c010763a:	68 ec fb 10 c0       	push   $0xc010fbec
c010763f:	e8 8b 4b 00 00       	call   c010c1cf <Memset>
c0107644:	83 c4 10             	add    $0x10,%esp
c0107647:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010764e:	fb 10 c0 
c0107651:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107656:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c010765b:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c0107662:	00 00 00 
c0107665:	e8 4f d3 ff ff       	call   c01049b9 <init_keyboard_handler>
c010766a:	90                   	nop
c010766b:	c9                   	leave  
c010766c:	c3                   	ret    

c010766d <TestTTY>:
c010766d:	55                   	push   %ebp
c010766e:	89 e5                	mov    %esp,%ebp
c0107670:	83 ec 28             	sub    $0x28,%esp
c0107673:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c010767a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107681:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107687:	83 ec 08             	sub    $0x8,%esp
c010768a:	6a 02                	push   $0x2
c010768c:	8d 45 de             	lea    -0x22(%ebp),%eax
c010768f:	50                   	push   %eax
c0107690:	e8 ca d4 ff ff       	call   c0104b5f <open>
c0107695:	83 c4 10             	add    $0x10,%esp
c0107698:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010769b:	83 ec 08             	sub    $0x8,%esp
c010769e:	6a 02                	push   $0x2
c01076a0:	8d 45 de             	lea    -0x22(%ebp),%eax
c01076a3:	50                   	push   %eax
c01076a4:	e8 b6 d4 ff ff       	call   c0104b5f <open>
c01076a9:	83 c4 10             	add    $0x10,%esp
c01076ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01076af:	83 ec 0c             	sub    $0xc,%esp
c01076b2:	68 39 ba 10 c0       	push   $0xc010ba39
c01076b7:	e8 ec 0e 00 00       	call   c01085a8 <Printf>
c01076bc:	83 c4 10             	add    $0x10,%esp
c01076bf:	83 ec 0c             	sub    $0xc,%esp
c01076c2:	6a 0a                	push   $0xa
c01076c4:	e8 73 9f ff ff       	call   c010163c <sys_malloc>
c01076c9:	83 c4 10             	add    $0x10,%esp
c01076cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01076cf:	83 ec 04             	sub    $0x4,%esp
c01076d2:	6a 0a                	push   $0xa
c01076d4:	6a 00                	push   $0x0
c01076d6:	ff 75 ec             	pushl  -0x14(%ebp)
c01076d9:	e8 f1 4a 00 00       	call   c010c1cf <Memset>
c01076de:	83 c4 10             	add    $0x10,%esp
c01076e1:	83 ec 04             	sub    $0x4,%esp
c01076e4:	6a 0a                	push   $0xa
c01076e6:	ff 75 ec             	pushl  -0x14(%ebp)
c01076e9:	ff 75 f0             	pushl  -0x10(%ebp)
c01076ec:	e8 03 d5 ff ff       	call   c0104bf4 <read>
c01076f1:	83 c4 10             	add    $0x10,%esp
c01076f4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01076f7:	83 ec 08             	sub    $0x8,%esp
c01076fa:	ff 75 ec             	pushl  -0x14(%ebp)
c01076fd:	68 4b ba 10 c0       	push   $0xc010ba4b
c0107702:	e8 a1 0e 00 00       	call   c01085a8 <Printf>
c0107707:	83 c4 10             	add    $0x10,%esp
c010770a:	eb c3                	jmp    c01076cf <TestTTY+0x62>

c010770c <TestReadReturnValue>:
c010770c:	55                   	push   %ebp
c010770d:	89 e5                	mov    %esp,%ebp
c010770f:	81 ec 18 02 00 00    	sub    $0x218,%esp
c0107715:	c7 45 f4 55 ba 10 c0 	movl   $0xc010ba55,-0xc(%ebp)
c010771c:	83 ec 08             	sub    $0x8,%esp
c010771f:	6a 00                	push   $0x0
c0107721:	ff 75 f4             	pushl  -0xc(%ebp)
c0107724:	e8 36 d4 ff ff       	call   c0104b5f <open>
c0107729:	83 c4 10             	add    $0x10,%esp
c010772c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010772f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107736:	83 ec 04             	sub    $0x4,%esp
c0107739:	68 cb 00 00 00       	push   $0xcb
c010773e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0107744:	50                   	push   %eax
c0107745:	ff 75 f0             	pushl  -0x10(%ebp)
c0107748:	e8 a7 d4 ff ff       	call   c0104bf4 <read>
c010774d:	83 c4 10             	add    $0x10,%esp
c0107750:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107753:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c010775a:	74 1c                	je     c0107778 <TestReadReturnValue+0x6c>
c010775c:	68 08 02 00 00       	push   $0x208
c0107761:	68 61 ba 10 c0       	push   $0xc010ba61
c0107766:	68 61 ba 10 c0       	push   $0xc010ba61
c010776b:	68 71 ba 10 c0       	push   $0xc010ba71
c0107770:	e8 90 11 00 00       	call   c0108905 <assertion_failure>
c0107775:	83 c4 10             	add    $0x10,%esp
c0107778:	83 ec 0c             	sub    $0xc,%esp
c010777b:	ff 75 f0             	pushl  -0x10(%ebp)
c010777e:	e8 77 d6 ff ff       	call   c0104dfa <close>
c0107783:	83 c4 10             	add    $0x10,%esp
c0107786:	90                   	nop
c0107787:	c9                   	leave  
c0107788:	c3                   	ret    

c0107789 <TestWriteReturnValue>:
c0107789:	55                   	push   %ebp
c010778a:	89 e5                	mov    %esp,%ebp
c010778c:	81 ec 28 02 00 00    	sub    $0x228,%esp
c0107792:	c7 45 f4 7c ba 10 c0 	movl   $0xc010ba7c,-0xc(%ebp)
c0107799:	83 ec 08             	sub    $0x8,%esp
c010779c:	6a 07                	push   $0x7
c010779e:	ff 75 f4             	pushl  -0xc(%ebp)
c01077a1:	e8 b9 d3 ff ff       	call   c0104b5f <open>
c01077a6:	83 c4 10             	add    $0x10,%esp
c01077a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01077ac:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c01077b0:	75 1c                	jne    c01077ce <TestWriteReturnValue+0x45>
c01077b2:	68 12 02 00 00       	push   $0x212
c01077b7:	68 61 ba 10 c0       	push   $0xc010ba61
c01077bc:	68 61 ba 10 c0       	push   $0xc010ba61
c01077c1:	68 89 ba 10 c0       	push   $0xc010ba89
c01077c6:	e8 3a 11 00 00       	call   c0108905 <assertion_failure>
c01077cb:	83 c4 10             	add    $0x10,%esp
c01077ce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01077d5:	c7 45 e8 94 ba 10 c0 	movl   $0xc010ba94,-0x18(%ebp)
c01077dc:	83 ec 0c             	sub    $0xc,%esp
c01077df:	ff 75 e8             	pushl  -0x18(%ebp)
c01077e2:	e8 21 4a 00 00       	call   c010c208 <Strlen>
c01077e7:	83 c4 10             	add    $0x10,%esp
c01077ea:	83 ec 04             	sub    $0x4,%esp
c01077ed:	50                   	push   %eax
c01077ee:	ff 75 e8             	pushl  -0x18(%ebp)
c01077f1:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01077f7:	50                   	push   %eax
c01077f8:	e8 ef f4 ff ff       	call   c0106cec <Memcpy>
c01077fd:	83 c4 10             	add    $0x10,%esp
c0107800:	83 ec 04             	sub    $0x4,%esp
c0107803:	68 ff 01 00 00       	push   $0x1ff
c0107808:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c010780e:	50                   	push   %eax
c010780f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107812:	e8 5e d5 ff ff       	call   c0104d75 <write>
c0107817:	83 c4 10             	add    $0x10,%esp
c010781a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010781d:	83 ec 0c             	sub    $0xc,%esp
c0107820:	ff 75 e8             	pushl  -0x18(%ebp)
c0107823:	e8 e0 49 00 00       	call   c010c208 <Strlen>
c0107828:	83 c4 10             	add    $0x10,%esp
c010782b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c010782e:	74 1c                	je     c010784c <TestWriteReturnValue+0xc3>
c0107830:	68 1c 02 00 00       	push   $0x21c
c0107835:	68 61 ba 10 c0       	push   $0xc010ba61
c010783a:	68 61 ba 10 c0       	push   $0xc010ba61
c010783f:	68 c7 ba 10 c0       	push   $0xc010bac7
c0107844:	e8 bc 10 00 00       	call   c0108905 <assertion_failure>
c0107849:	83 c4 10             	add    $0x10,%esp
c010784c:	83 ec 0c             	sub    $0xc,%esp
c010784f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107852:	e8 a3 d5 ff ff       	call   c0104dfa <close>
c0107857:	83 c4 10             	add    $0x10,%esp
c010785a:	90                   	nop
c010785b:	c9                   	leave  
c010785c:	c3                   	ret    

c010785d <TestFS2>:
c010785d:	55                   	push   %ebp
c010785e:	89 e5                	mov    %esp,%ebp
c0107860:	83 ec 08             	sub    $0x8,%esp
c0107863:	e8 21 ff ff ff       	call   c0107789 <TestWriteReturnValue>
c0107868:	90                   	nop
c0107869:	c9                   	leave  
c010786a:	c3                   	ret    

c010786b <TestFS>:
c010786b:	55                   	push   %ebp
c010786c:	89 e5                	mov    %esp,%ebp
c010786e:	57                   	push   %edi
c010786f:	56                   	push   %esi
c0107870:	53                   	push   %ebx
c0107871:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c0107877:	83 ec 0c             	sub    $0xc,%esp
c010787a:	68 da ba 10 c0       	push   $0xc010bada
c010787f:	e8 08 88 ff ff       	call   c010008c <disp_str>
c0107884:	83 c4 10             	add    $0x10,%esp
c0107887:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c010788e:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107895:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c010789b:	83 ec 08             	sub    $0x8,%esp
c010789e:	6a 02                	push   $0x2
c01078a0:	8d 45 ae             	lea    -0x52(%ebp),%eax
c01078a3:	50                   	push   %eax
c01078a4:	e8 b6 d2 ff ff       	call   c0104b5f <open>
c01078a9:	83 c4 10             	add    $0x10,%esp
c01078ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01078af:	83 ec 08             	sub    $0x8,%esp
c01078b2:	6a 02                	push   $0x2
c01078b4:	8d 45 ae             	lea    -0x52(%ebp),%eax
c01078b7:	50                   	push   %eax
c01078b8:	e8 a2 d2 ff ff       	call   c0104b5f <open>
c01078bd:	83 c4 10             	add    $0x10,%esp
c01078c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01078c3:	83 ec 0c             	sub    $0xc,%esp
c01078c6:	68 39 ba 10 c0       	push   $0xc010ba39
c01078cb:	e8 d8 0c 00 00       	call   c01085a8 <Printf>
c01078d0:	83 c4 10             	add    $0x10,%esp
c01078d3:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c01078da:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c01078de:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c01078e5:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c01078e9:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c01078f0:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c01078f7:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c01078fd:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c0107904:	83 ec 0c             	sub    $0xc,%esp
c0107907:	68 e2 ba 10 c0       	push   $0xc010bae2
c010790c:	e8 97 0c 00 00       	call   c01085a8 <Printf>
c0107911:	83 c4 10             	add    $0x10,%esp
c0107914:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c0107918:	0f 85 e6 03 00 00    	jne    c0107d04 <TestFS+0x499>
c010791e:	83 ec 08             	sub    $0x8,%esp
c0107921:	6a 07                	push   $0x7
c0107923:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107926:	50                   	push   %eax
c0107927:	e8 33 d2 ff ff       	call   c0104b5f <open>
c010792c:	83 c4 10             	add    $0x10,%esp
c010792f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107932:	83 ec 08             	sub    $0x8,%esp
c0107935:	ff 75 d0             	pushl  -0x30(%ebp)
c0107938:	68 fa ba 10 c0       	push   $0xc010bafa
c010793d:	e8 66 0c 00 00       	call   c01085a8 <Printf>
c0107942:	83 c4 10             	add    $0x10,%esp
c0107945:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c010794c:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107953:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c010795a:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107961:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107968:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c010796f:	83 ec 0c             	sub    $0xc,%esp
c0107972:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107975:	50                   	push   %eax
c0107976:	e8 8d 48 00 00       	call   c010c208 <Strlen>
c010797b:	83 c4 10             	add    $0x10,%esp
c010797e:	83 ec 04             	sub    $0x4,%esp
c0107981:	50                   	push   %eax
c0107982:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107985:	50                   	push   %eax
c0107986:	ff 75 d0             	pushl  -0x30(%ebp)
c0107989:	e8 e7 d3 ff ff       	call   c0104d75 <write>
c010798e:	83 c4 10             	add    $0x10,%esp
c0107991:	83 ec 0c             	sub    $0xc,%esp
c0107994:	ff 75 d0             	pushl  -0x30(%ebp)
c0107997:	e8 5e d4 ff ff       	call   c0104dfa <close>
c010799c:	83 c4 10             	add    $0x10,%esp
c010799f:	83 ec 08             	sub    $0x8,%esp
c01079a2:	6a 00                	push   $0x0
c01079a4:	8d 45 a9             	lea    -0x57(%ebp),%eax
c01079a7:	50                   	push   %eax
c01079a8:	e8 b2 d1 ff ff       	call   c0104b5f <open>
c01079ad:	83 c4 10             	add    $0x10,%esp
c01079b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01079b3:	83 ec 04             	sub    $0x4,%esp
c01079b6:	6a 14                	push   $0x14
c01079b8:	6a 00                	push   $0x0
c01079ba:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c01079c0:	50                   	push   %eax
c01079c1:	e8 09 48 00 00       	call   c010c1cf <Memset>
c01079c6:	83 c4 10             	add    $0x10,%esp
c01079c9:	83 ec 04             	sub    $0x4,%esp
c01079cc:	6a 12                	push   $0x12
c01079ce:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c01079d4:	50                   	push   %eax
c01079d5:	ff 75 d0             	pushl  -0x30(%ebp)
c01079d8:	e8 17 d2 ff ff       	call   c0104bf4 <read>
c01079dd:	83 c4 10             	add    $0x10,%esp
c01079e0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01079e3:	83 ec 08             	sub    $0x8,%esp
c01079e6:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c01079ec:	50                   	push   %eax
c01079ed:	68 03 bb 10 c0       	push   $0xc010bb03
c01079f2:	e8 b1 0b 00 00       	call   c01085a8 <Printf>
c01079f7:	83 c4 10             	add    $0x10,%esp
c01079fa:	83 ec 0c             	sub    $0xc,%esp
c01079fd:	6a 0a                	push   $0xa
c01079ff:	e8 70 0a 00 00       	call   c0108474 <delay>
c0107a04:	83 c4 10             	add    $0x10,%esp
c0107a07:	83 ec 08             	sub    $0x8,%esp
c0107a0a:	6a 07                	push   $0x7
c0107a0c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107a0f:	50                   	push   %eax
c0107a10:	e8 4a d1 ff ff       	call   c0104b5f <open>
c0107a15:	83 c4 10             	add    $0x10,%esp
c0107a18:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107a1b:	83 ec 08             	sub    $0x8,%esp
c0107a1e:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a21:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107a26:	e8 7d 0b 00 00       	call   c01085a8 <Printf>
c0107a2b:	83 c4 10             	add    $0x10,%esp
c0107a2e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107a35:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a3b:	bb 44 bb 10 c0       	mov    $0xc010bb44,%ebx
c0107a40:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107a45:	8b 0b                	mov    (%ebx),%ecx
c0107a47:	89 08                	mov    %ecx,(%eax)
c0107a49:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107a4d:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107a51:	8d 78 04             	lea    0x4(%eax),%edi
c0107a54:	83 e7 fc             	and    $0xfffffffc,%edi
c0107a57:	29 f8                	sub    %edi,%eax
c0107a59:	29 c3                	sub    %eax,%ebx
c0107a5b:	01 c2                	add    %eax,%edx
c0107a5d:	83 e2 fc             	and    $0xfffffffc,%edx
c0107a60:	89 d0                	mov    %edx,%eax
c0107a62:	c1 e8 02             	shr    $0x2,%eax
c0107a65:	89 de                	mov    %ebx,%esi
c0107a67:	89 c1                	mov    %eax,%ecx
c0107a69:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107a6b:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107a72:	00 00 00 
c0107a75:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107a7c:	00 00 00 
c0107a7f:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107a86:	83 ec 0c             	sub    $0xc,%esp
c0107a89:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a8f:	50                   	push   %eax
c0107a90:	e8 73 47 00 00       	call   c010c208 <Strlen>
c0107a95:	83 c4 10             	add    $0x10,%esp
c0107a98:	83 ec 04             	sub    $0x4,%esp
c0107a9b:	50                   	push   %eax
c0107a9c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107aa2:	50                   	push   %eax
c0107aa3:	ff 75 c8             	pushl  -0x38(%ebp)
c0107aa6:	e8 ca d2 ff ff       	call   c0104d75 <write>
c0107aab:	83 c4 10             	add    $0x10,%esp
c0107aae:	83 ec 0c             	sub    $0xc,%esp
c0107ab1:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ab4:	e8 41 d3 ff ff       	call   c0104dfa <close>
c0107ab9:	83 c4 10             	add    $0x10,%esp
c0107abc:	83 ec 08             	sub    $0x8,%esp
c0107abf:	6a 00                	push   $0x0
c0107ac1:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107ac4:	50                   	push   %eax
c0107ac5:	e8 95 d0 ff ff       	call   c0104b5f <open>
c0107aca:	83 c4 10             	add    $0x10,%esp
c0107acd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107ad0:	83 ec 04             	sub    $0x4,%esp
c0107ad3:	68 c8 00 00 00       	push   $0xc8
c0107ad8:	6a 00                	push   $0x0
c0107ada:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107ae0:	50                   	push   %eax
c0107ae1:	e8 e9 46 00 00       	call   c010c1cf <Memset>
c0107ae6:	83 c4 10             	add    $0x10,%esp
c0107ae9:	83 ec 0c             	sub    $0xc,%esp
c0107aec:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107af2:	50                   	push   %eax
c0107af3:	e8 10 47 00 00       	call   c010c208 <Strlen>
c0107af8:	83 c4 10             	add    $0x10,%esp
c0107afb:	83 ec 04             	sub    $0x4,%esp
c0107afe:	50                   	push   %eax
c0107aff:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b05:	50                   	push   %eax
c0107b06:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b09:	e8 e6 d0 ff ff       	call   c0104bf4 <read>
c0107b0e:	83 c4 10             	add    $0x10,%esp
c0107b11:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107b14:	83 ec 08             	sub    $0x8,%esp
c0107b17:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107b1d:	50                   	push   %eax
c0107b1e:	68 18 bb 10 c0       	push   $0xc010bb18
c0107b23:	e8 80 0a 00 00       	call   c01085a8 <Printf>
c0107b28:	83 c4 10             	add    $0x10,%esp
c0107b2b:	83 ec 08             	sub    $0x8,%esp
c0107b2e:	6a 07                	push   $0x7
c0107b30:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107b33:	50                   	push   %eax
c0107b34:	e8 26 d0 ff ff       	call   c0104b5f <open>
c0107b39:	83 c4 10             	add    $0x10,%esp
c0107b3c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107b3f:	83 ec 08             	sub    $0x8,%esp
c0107b42:	ff 75 c8             	pushl  -0x38(%ebp)
c0107b45:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107b4a:	e8 59 0a 00 00       	call   c01085a8 <Printf>
c0107b4f:	83 c4 10             	add    $0x10,%esp
c0107b52:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107b59:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107b60:	20 77 69 
c0107b63:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107b6a:	6c 20 73 
c0107b6d:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107b74:	63 63 65 
c0107b77:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107b7e:	73 20 61 
c0107b81:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107b88:	20 6c 61 
c0107b8b:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107b92:	74 2e 00 
c0107b95:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107b9c:	00 00 00 
c0107b9f:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107ba6:	00 00 
c0107ba8:	83 ec 0c             	sub    $0xc,%esp
c0107bab:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107bb1:	50                   	push   %eax
c0107bb2:	e8 51 46 00 00       	call   c010c208 <Strlen>
c0107bb7:	83 c4 10             	add    $0x10,%esp
c0107bba:	83 ec 04             	sub    $0x4,%esp
c0107bbd:	50                   	push   %eax
c0107bbe:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107bc4:	50                   	push   %eax
c0107bc5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107bc8:	e8 a8 d1 ff ff       	call   c0104d75 <write>
c0107bcd:	83 c4 10             	add    $0x10,%esp
c0107bd0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107bd7:	eb 7e                	jmp    c0107c57 <TestFS+0x3ec>
c0107bd9:	83 ec 0c             	sub    $0xc,%esp
c0107bdc:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107bdf:	e8 16 d2 ff ff       	call   c0104dfa <close>
c0107be4:	83 c4 10             	add    $0x10,%esp
c0107be7:	83 ec 08             	sub    $0x8,%esp
c0107bea:	6a 00                	push   $0x0
c0107bec:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107bef:	50                   	push   %eax
c0107bf0:	e8 6a cf ff ff       	call   c0104b5f <open>
c0107bf5:	83 c4 10             	add    $0x10,%esp
c0107bf8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107bfb:	83 ec 04             	sub    $0x4,%esp
c0107bfe:	6a 1e                	push   $0x1e
c0107c00:	6a 00                	push   $0x0
c0107c02:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c08:	50                   	push   %eax
c0107c09:	e8 c1 45 00 00       	call   c010c1cf <Memset>
c0107c0e:	83 c4 10             	add    $0x10,%esp
c0107c11:	83 ec 0c             	sub    $0xc,%esp
c0107c14:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107c1a:	50                   	push   %eax
c0107c1b:	e8 e8 45 00 00       	call   c010c208 <Strlen>
c0107c20:	83 c4 10             	add    $0x10,%esp
c0107c23:	83 ec 04             	sub    $0x4,%esp
c0107c26:	50                   	push   %eax
c0107c27:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c2d:	50                   	push   %eax
c0107c2e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107c31:	e8 be cf ff ff       	call   c0104bf4 <read>
c0107c36:	83 c4 10             	add    $0x10,%esp
c0107c39:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107c3c:	83 ec 08             	sub    $0x8,%esp
c0107c3f:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107c45:	50                   	push   %eax
c0107c46:	68 23 bb 10 c0       	push   $0xc010bb23
c0107c4b:	e8 58 09 00 00       	call   c01085a8 <Printf>
c0107c50:	83 c4 10             	add    $0x10,%esp
c0107c53:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107c57:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107c5b:	0f 8e 78 ff ff ff    	jle    c0107bd9 <TestFS+0x36e>
c0107c61:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107c68:	6e 73 74 
c0107c6b:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107c72:	6c 6c 2e 
c0107c75:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107c7c:	61 72 00 
c0107c7f:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107c86:	00 00 00 
c0107c89:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107c90:	00 00 00 
c0107c93:	83 ec 08             	sub    $0x8,%esp
c0107c96:	6a 00                	push   $0x0
c0107c98:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107c9e:	50                   	push   %eax
c0107c9f:	e8 bb ce ff ff       	call   c0104b5f <open>
c0107ca4:	83 c4 10             	add    $0x10,%esp
c0107ca7:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107caa:	83 ec 08             	sub    $0x8,%esp
c0107cad:	ff 75 bc             	pushl  -0x44(%ebp)
c0107cb0:	68 2e bb 10 c0       	push   $0xc010bb2e
c0107cb5:	e8 ee 08 00 00       	call   c01085a8 <Printf>
c0107cba:	83 c4 10             	add    $0x10,%esp
c0107cbd:	83 ec 04             	sub    $0x4,%esp
c0107cc0:	6a 28                	push   $0x28
c0107cc2:	6a 00                	push   $0x0
c0107cc4:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107cca:	50                   	push   %eax
c0107ccb:	e8 ff 44 00 00       	call   c010c1cf <Memset>
c0107cd0:	83 c4 10             	add    $0x10,%esp
c0107cd3:	83 ec 04             	sub    $0x4,%esp
c0107cd6:	6a 28                	push   $0x28
c0107cd8:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107cde:	50                   	push   %eax
c0107cdf:	ff 75 bc             	pushl  -0x44(%ebp)
c0107ce2:	e8 0d cf ff ff       	call   c0104bf4 <read>
c0107ce7:	83 c4 10             	add    $0x10,%esp
c0107cea:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107ced:	83 ec 08             	sub    $0x8,%esp
c0107cf0:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107cf6:	50                   	push   %eax
c0107cf7:	68 38 bb 10 c0       	push   $0xc010bb38
c0107cfc:	e8 a7 08 00 00       	call   c01085a8 <Printf>
c0107d01:	83 c4 10             	add    $0x10,%esp
c0107d04:	90                   	nop
c0107d05:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107d08:	5b                   	pop    %ebx
c0107d09:	5e                   	pop    %esi
c0107d0a:	5f                   	pop    %edi
c0107d0b:	5d                   	pop    %ebp
c0107d0c:	c3                   	ret    

c0107d0d <wait_exit>:
c0107d0d:	55                   	push   %ebp
c0107d0e:	89 e5                	mov    %esp,%ebp
c0107d10:	83 ec 28             	sub    $0x28,%esp
c0107d13:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107d1a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107d21:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107d27:	83 ec 08             	sub    $0x8,%esp
c0107d2a:	6a 02                	push   $0x2
c0107d2c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d2f:	50                   	push   %eax
c0107d30:	e8 2a ce ff ff       	call   c0104b5f <open>
c0107d35:	83 c4 10             	add    $0x10,%esp
c0107d38:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107d3b:	83 ec 08             	sub    $0x8,%esp
c0107d3e:	6a 02                	push   $0x2
c0107d40:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d43:	50                   	push   %eax
c0107d44:	e8 16 ce ff ff       	call   c0104b5f <open>
c0107d49:	83 c4 10             	add    $0x10,%esp
c0107d4c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107d4f:	e8 6b d1 ff ff       	call   c0104ebf <fork>
c0107d54:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107d57:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107d5b:	7e 35                	jle    c0107d92 <wait_exit+0x85>
c0107d5d:	83 ec 0c             	sub    $0xc,%esp
c0107d60:	68 0c bc 10 c0       	push   $0xc010bc0c
c0107d65:	e8 3e 08 00 00       	call   c01085a8 <Printf>
c0107d6a:	83 c4 10             	add    $0x10,%esp
c0107d6d:	83 ec 0c             	sub    $0xc,%esp
c0107d70:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107d73:	50                   	push   %eax
c0107d74:	e8 d3 d0 ff ff       	call   c0104e4c <wait>
c0107d79:	83 c4 10             	add    $0x10,%esp
c0107d7c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107d7f:	83 ec 08             	sub    $0x8,%esp
c0107d82:	50                   	push   %eax
c0107d83:	68 24 bc 10 c0       	push   $0xc010bc24
c0107d88:	e8 1b 08 00 00       	call   c01085a8 <Printf>
c0107d8d:	83 c4 10             	add    $0x10,%esp
c0107d90:	eb fe                	jmp    c0107d90 <wait_exit+0x83>
c0107d92:	83 ec 0c             	sub    $0xc,%esp
c0107d95:	68 3f bc 10 c0       	push   $0xc010bc3f
c0107d9a:	e8 09 08 00 00       	call   c01085a8 <Printf>
c0107d9f:	83 c4 10             	add    $0x10,%esp
c0107da2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107da9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107dac:	8d 50 01             	lea    0x1(%eax),%edx
c0107daf:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107db2:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107db7:	7f 02                	jg     c0107dbb <wait_exit+0xae>
c0107db9:	eb ee                	jmp    c0107da9 <wait_exit+0x9c>
c0107dbb:	90                   	nop
c0107dbc:	83 ec 0c             	sub    $0xc,%esp
c0107dbf:	68 4b bc 10 c0       	push   $0xc010bc4b
c0107dc4:	e8 df 07 00 00       	call   c01085a8 <Printf>
c0107dc9:	83 c4 10             	add    $0x10,%esp
c0107dcc:	83 ec 0c             	sub    $0xc,%esp
c0107dcf:	68 59 bc 10 c0       	push   $0xc010bc59
c0107dd4:	e8 cf 07 00 00       	call   c01085a8 <Printf>
c0107dd9:	83 c4 10             	add    $0x10,%esp
c0107ddc:	83 ec 0c             	sub    $0xc,%esp
c0107ddf:	68 68 bc 10 c0       	push   $0xc010bc68
c0107de4:	e8 bf 07 00 00       	call   c01085a8 <Printf>
c0107de9:	83 c4 10             	add    $0x10,%esp
c0107dec:	83 ec 0c             	sub    $0xc,%esp
c0107def:	6a 5a                	push   $0x5a
c0107df1:	e8 9a d0 ff ff       	call   c0104e90 <exit>
c0107df6:	83 c4 10             	add    $0x10,%esp
c0107df9:	83 ec 0c             	sub    $0xc,%esp
c0107dfc:	68 77 bc 10 c0       	push   $0xc010bc77
c0107e01:	e8 a2 07 00 00       	call   c01085a8 <Printf>
c0107e06:	83 c4 10             	add    $0x10,%esp
c0107e09:	eb fe                	jmp    c0107e09 <wait_exit+0xfc>

c0107e0b <INIT_fork>:
c0107e0b:	55                   	push   %ebp
c0107e0c:	89 e5                	mov    %esp,%ebp
c0107e0e:	83 ec 78             	sub    $0x78,%esp
c0107e11:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107e18:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107e1f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107e25:	83 ec 08             	sub    $0x8,%esp
c0107e28:	6a 02                	push   $0x2
c0107e2a:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107e2d:	50                   	push   %eax
c0107e2e:	e8 2c cd ff ff       	call   c0104b5f <open>
c0107e33:	83 c4 10             	add    $0x10,%esp
c0107e36:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107e39:	83 ec 08             	sub    $0x8,%esp
c0107e3c:	6a 02                	push   $0x2
c0107e3e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107e41:	50                   	push   %eax
c0107e42:	e8 18 cd ff ff       	call   c0104b5f <open>
c0107e47:	83 c4 10             	add    $0x10,%esp
c0107e4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107e4d:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107e54:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107e5b:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107e62:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107e69:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107e70:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107e77:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107e7e:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107e85:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107e8c:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107e93:	83 ec 0c             	sub    $0xc,%esp
c0107e96:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e99:	50                   	push   %eax
c0107e9a:	e8 09 07 00 00       	call   c01085a8 <Printf>
c0107e9f:	83 c4 10             	add    $0x10,%esp
c0107ea2:	83 ec 0c             	sub    $0xc,%esp
c0107ea5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107ea8:	50                   	push   %eax
c0107ea9:	e8 5a 43 00 00       	call   c010c208 <Strlen>
c0107eae:	83 c4 10             	add    $0x10,%esp
c0107eb1:	83 ec 04             	sub    $0x4,%esp
c0107eb4:	50                   	push   %eax
c0107eb5:	6a 00                	push   $0x0
c0107eb7:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107eba:	50                   	push   %eax
c0107ebb:	e8 0f 43 00 00       	call   c010c1cf <Memset>
c0107ec0:	83 c4 10             	add    $0x10,%esp
c0107ec3:	83 ec 04             	sub    $0x4,%esp
c0107ec6:	6a 28                	push   $0x28
c0107ec8:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107ecb:	50                   	push   %eax
c0107ecc:	ff 75 f0             	pushl  -0x10(%ebp)
c0107ecf:	e8 20 cd ff ff       	call   c0104bf4 <read>
c0107ed4:	83 c4 10             	add    $0x10,%esp
c0107ed7:	83 ec 0c             	sub    $0xc,%esp
c0107eda:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107edd:	50                   	push   %eax
c0107ede:	e8 c5 06 00 00       	call   c01085a8 <Printf>
c0107ee3:	83 c4 10             	add    $0x10,%esp
c0107ee6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107eed:	e8 cd cf ff ff       	call   c0104ebf <fork>
c0107ef2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107ef5:	83 ec 0c             	sub    $0xc,%esp
c0107ef8:	6a 01                	push   $0x1
c0107efa:	e8 75 05 00 00       	call   c0108474 <delay>
c0107eff:	83 c4 10             	add    $0x10,%esp
c0107f02:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107f06:	0f 8e cd 00 00 00    	jle    c0107fd9 <INIT_fork+0x1ce>
c0107f0c:	83 ec 08             	sub    $0x8,%esp
c0107f0f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107f12:	68 85 bc 10 c0       	push   $0xc010bc85
c0107f17:	e8 8c 06 00 00       	call   c01085a8 <Printf>
c0107f1c:	83 c4 10             	add    $0x10,%esp
c0107f1f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107f23:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107f2a:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107f31:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107f38:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107f3f:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107f46:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107f4d:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107f54:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107f5b:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107f62:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107f69:	83 ec 0c             	sub    $0xc,%esp
c0107f6c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f6f:	50                   	push   %eax
c0107f70:	e8 93 42 00 00       	call   c010c208 <Strlen>
c0107f75:	83 c4 10             	add    $0x10,%esp
c0107f78:	83 ec 04             	sub    $0x4,%esp
c0107f7b:	50                   	push   %eax
c0107f7c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f7f:	50                   	push   %eax
c0107f80:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f83:	e8 ed cd ff ff       	call   c0104d75 <write>
c0107f88:	83 c4 10             	add    $0x10,%esp
c0107f8b:	e8 b2 ec ff ff       	call   c0106c42 <catch_error>
c0107f90:	83 ec 0c             	sub    $0xc,%esp
c0107f93:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f96:	50                   	push   %eax
c0107f97:	e8 6c 42 00 00       	call   c010c208 <Strlen>
c0107f9c:	83 c4 10             	add    $0x10,%esp
c0107f9f:	83 ec 04             	sub    $0x4,%esp
c0107fa2:	50                   	push   %eax
c0107fa3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fa6:	50                   	push   %eax
c0107fa7:	ff 75 f4             	pushl  -0xc(%ebp)
c0107faa:	e8 c6 cd ff ff       	call   c0104d75 <write>
c0107faf:	83 c4 10             	add    $0x10,%esp
c0107fb2:	83 ec 0c             	sub    $0xc,%esp
c0107fb5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fb8:	50                   	push   %eax
c0107fb9:	e8 4a 42 00 00       	call   c010c208 <Strlen>
c0107fbe:	83 c4 10             	add    $0x10,%esp
c0107fc1:	83 ec 04             	sub    $0x4,%esp
c0107fc4:	50                   	push   %eax
c0107fc5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fc8:	50                   	push   %eax
c0107fc9:	ff 75 f4             	pushl  -0xc(%ebp)
c0107fcc:	e8 a4 cd ff ff       	call   c0104d75 <write>
c0107fd1:	83 c4 10             	add    $0x10,%esp
c0107fd4:	e9 d6 00 00 00       	jmp    c01080af <INIT_fork+0x2a4>
c0107fd9:	83 ec 08             	sub    $0x8,%esp
c0107fdc:	ff 75 e8             	pushl  -0x18(%ebp)
c0107fdf:	68 85 bc 10 c0       	push   $0xc010bc85
c0107fe4:	e8 bf 05 00 00       	call   c01085a8 <Printf>
c0107fe9:	83 c4 10             	add    $0x10,%esp
c0107fec:	83 ec 0c             	sub    $0xc,%esp
c0107fef:	6a 01                	push   $0x1
c0107ff1:	e8 7e 04 00 00       	call   c0108474 <delay>
c0107ff6:	83 c4 10             	add    $0x10,%esp
c0107ff9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107ffd:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0108001:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0108008:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c010800f:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0108016:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c010801d:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0108024:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c010802b:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0108032:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0108039:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0108040:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0108047:	83 ec 0c             	sub    $0xc,%esp
c010804a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010804d:	50                   	push   %eax
c010804e:	e8 b5 41 00 00       	call   c010c208 <Strlen>
c0108053:	83 c4 10             	add    $0x10,%esp
c0108056:	83 ec 04             	sub    $0x4,%esp
c0108059:	50                   	push   %eax
c010805a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010805d:	50                   	push   %eax
c010805e:	ff 75 f4             	pushl  -0xc(%ebp)
c0108061:	e8 0f cd ff ff       	call   c0104d75 <write>
c0108066:	83 c4 10             	add    $0x10,%esp
c0108069:	83 ec 0c             	sub    $0xc,%esp
c010806c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010806f:	50                   	push   %eax
c0108070:	e8 93 41 00 00       	call   c010c208 <Strlen>
c0108075:	83 c4 10             	add    $0x10,%esp
c0108078:	83 ec 04             	sub    $0x4,%esp
c010807b:	50                   	push   %eax
c010807c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010807f:	50                   	push   %eax
c0108080:	ff 75 f4             	pushl  -0xc(%ebp)
c0108083:	e8 ed cc ff ff       	call   c0104d75 <write>
c0108088:	83 c4 10             	add    $0x10,%esp
c010808b:	83 ec 0c             	sub    $0xc,%esp
c010808e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108091:	50                   	push   %eax
c0108092:	e8 71 41 00 00       	call   c010c208 <Strlen>
c0108097:	83 c4 10             	add    $0x10,%esp
c010809a:	83 ec 04             	sub    $0x4,%esp
c010809d:	50                   	push   %eax
c010809e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c01080a1:	50                   	push   %eax
c01080a2:	ff 75 f4             	pushl  -0xc(%ebp)
c01080a5:	e8 cb cc ff ff       	call   c0104d75 <write>
c01080aa:	83 c4 10             	add    $0x10,%esp
c01080ad:	eb fe                	jmp    c01080ad <INIT_fork+0x2a2>
c01080af:	83 ec 04             	sub    $0x4,%esp
c01080b2:	6a 28                	push   $0x28
c01080b4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080b7:	50                   	push   %eax
c01080b8:	ff 75 f0             	pushl  -0x10(%ebp)
c01080bb:	e8 34 cb ff ff       	call   c0104bf4 <read>
c01080c0:	83 c4 10             	add    $0x10,%esp
c01080c3:	83 ec 0c             	sub    $0xc,%esp
c01080c6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080c9:	50                   	push   %eax
c01080ca:	e8 d9 04 00 00       	call   c01085a8 <Printf>
c01080cf:	83 c4 10             	add    $0x10,%esp
c01080d2:	83 ec 0c             	sub    $0xc,%esp
c01080d5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080d8:	50                   	push   %eax
c01080d9:	e8 ca 04 00 00       	call   c01085a8 <Printf>
c01080de:	83 c4 10             	add    $0x10,%esp
c01080e1:	83 ec 0c             	sub    $0xc,%esp
c01080e4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01080e7:	50                   	push   %eax
c01080e8:	e8 bb 04 00 00       	call   c01085a8 <Printf>
c01080ed:	83 c4 10             	add    $0x10,%esp
c01080f0:	83 ec 0c             	sub    $0xc,%esp
c01080f3:	68 8f bc 10 c0       	push   $0xc010bc8f
c01080f8:	e8 c4 07 00 00       	call   c01088c1 <spin>
c01080fd:	83 c4 10             	add    $0x10,%esp
c0108100:	90                   	nop
c0108101:	c9                   	leave  
c0108102:	c3                   	ret    

c0108103 <simple_shell>:
c0108103:	55                   	push   %ebp
c0108104:	89 e5                	mov    %esp,%ebp
c0108106:	57                   	push   %edi
c0108107:	83 ec 64             	sub    $0x64,%esp
c010810a:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0108111:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0108118:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c010811e:	83 ec 08             	sub    $0x8,%esp
c0108121:	6a 02                	push   $0x2
c0108123:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108126:	50                   	push   %eax
c0108127:	e8 33 ca ff ff       	call   c0104b5f <open>
c010812c:	83 c4 10             	add    $0x10,%esp
c010812f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108132:	83 ec 08             	sub    $0x8,%esp
c0108135:	6a 02                	push   $0x2
c0108137:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c010813a:	50                   	push   %eax
c010813b:	e8 1f ca ff ff       	call   c0104b5f <open>
c0108140:	83 c4 10             	add    $0x10,%esp
c0108143:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108146:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0108149:	b8 00 00 00 00       	mov    $0x0,%eax
c010814e:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0108153:	89 d7                	mov    %edx,%edi
c0108155:	f3 ab                	rep stos %eax,%es:(%edi)
c0108157:	c7 45 a8 97 bc 10 c0 	movl   $0xc010bc97,-0x58(%ebp)
c010815e:	c7 45 ac 9c bc 10 c0 	movl   $0xc010bc9c,-0x54(%ebp)
c0108165:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010816c:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0108173:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c010817a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010817d:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c0108184:	00 
c0108185:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0108188:	85 c0                	test   %eax,%eax
c010818a:	75 1c                	jne    c01081a8 <simple_shell+0xa5>
c010818c:	68 0e 03 00 00       	push   $0x30e
c0108191:	68 61 ba 10 c0       	push   $0xc010ba61
c0108196:	68 61 ba 10 c0       	push   $0xc010ba61
c010819b:	68 a2 bc 10 c0       	push   $0xc010bca2
c01081a0:	e8 60 07 00 00       	call   c0108905 <assertion_failure>
c01081a5:	83 c4 10             	add    $0x10,%esp
c01081a8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01081ab:	83 ec 08             	sub    $0x8,%esp
c01081ae:	6a 02                	push   $0x2
c01081b0:	50                   	push   %eax
c01081b1:	e8 a9 c9 ff ff       	call   c0104b5f <open>
c01081b6:	83 c4 10             	add    $0x10,%esp
c01081b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01081bc:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c01081c0:	75 4b                	jne    c010820d <simple_shell+0x10a>
c01081c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01081c9:	eb 26                	jmp    c01081f1 <simple_shell+0xee>
c01081cb:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01081ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01081d1:	01 d0                	add    %edx,%eax
c01081d3:	0f b6 00             	movzbl (%eax),%eax
c01081d6:	0f be c0             	movsbl %al,%eax
c01081d9:	83 ec 04             	sub    $0x4,%esp
c01081dc:	50                   	push   %eax
c01081dd:	ff 75 f4             	pushl  -0xc(%ebp)
c01081e0:	68 b1 bc 10 c0       	push   $0xc010bcb1
c01081e5:	e8 be 03 00 00       	call   c01085a8 <Printf>
c01081ea:	83 c4 10             	add    $0x10,%esp
c01081ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01081f1:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c01081f5:	7e d4                	jle    c01081cb <simple_shell+0xc8>
c01081f7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01081fa:	83 ec 08             	sub    $0x8,%esp
c01081fd:	50                   	push   %eax
c01081fe:	68 b8 bc 10 c0       	push   $0xc010bcb8
c0108203:	e8 a0 03 00 00       	call   c01085a8 <Printf>
c0108208:	83 c4 10             	add    $0x10,%esp
c010820b:	eb 78                	jmp    c0108285 <simple_shell+0x182>
c010820d:	83 ec 0c             	sub    $0xc,%esp
c0108210:	68 be bc 10 c0       	push   $0xc010bcbe
c0108215:	e8 8e 03 00 00       	call   c01085a8 <Printf>
c010821a:	83 c4 10             	add    $0x10,%esp
c010821d:	e8 9d cc ff ff       	call   c0104ebf <fork>
c0108222:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108225:	83 ec 0c             	sub    $0xc,%esp
c0108228:	68 d3 bc 10 c0       	push   $0xc010bcd3
c010822d:	e8 76 03 00 00       	call   c01085a8 <Printf>
c0108232:	83 c4 10             	add    $0x10,%esp
c0108235:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0108239:	7e 11                	jle    c010824c <simple_shell+0x149>
c010823b:	83 ec 0c             	sub    $0xc,%esp
c010823e:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0108241:	50                   	push   %eax
c0108242:	e8 05 cc ff ff       	call   c0104e4c <wait>
c0108247:	83 c4 10             	add    $0x10,%esp
c010824a:	eb 39                	jmp    c0108285 <simple_shell+0x182>
c010824c:	83 ec 0c             	sub    $0xc,%esp
c010824f:	68 e8 bc 10 c0       	push   $0xc010bce8
c0108254:	e8 4f 03 00 00       	call   c01085a8 <Printf>
c0108259:	83 c4 10             	add    $0x10,%esp
c010825c:	83 ec 0c             	sub    $0xc,%esp
c010825f:	ff 75 e0             	pushl  -0x20(%ebp)
c0108262:	e8 93 cb ff ff       	call   c0104dfa <close>
c0108267:	83 c4 10             	add    $0x10,%esp
c010826a:	6a 00                	push   $0x0
c010826c:	68 9c bc 10 c0       	push   $0xc010bc9c
c0108271:	68 97 bc 10 c0       	push   $0xc010bc97
c0108276:	68 04 bd 10 c0       	push   $0xc010bd04
c010827b:	e8 12 cf ff ff       	call   c0105192 <execl>
c0108280:	83 c4 10             	add    $0x10,%esp
c0108283:	eb fe                	jmp    c0108283 <simple_shell+0x180>
c0108285:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0108288:	c9                   	leave  
c0108289:	c3                   	ret    

c010828a <test_shell>:
c010828a:	55                   	push   %ebp
c010828b:	89 e5                	mov    %esp,%ebp
c010828d:	83 ec 38             	sub    $0x38,%esp
c0108290:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0108297:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c010829e:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c01082a4:	83 ec 08             	sub    $0x8,%esp
c01082a7:	6a 02                	push   $0x2
c01082a9:	8d 45 ea             	lea    -0x16(%ebp),%eax
c01082ac:	50                   	push   %eax
c01082ad:	e8 ad c8 ff ff       	call   c0104b5f <open>
c01082b2:	83 c4 10             	add    $0x10,%esp
c01082b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01082b8:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c01082bf:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c01082c6:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c01082cd:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01082d4:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c01082db:	83 ec 0c             	sub    $0xc,%esp
c01082de:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c01082e1:	50                   	push   %eax
c01082e2:	e8 38 ea ff ff       	call   c0106d1f <untar>
c01082e7:	83 c4 10             	add    $0x10,%esp
c01082ea:	e8 14 fe ff ff       	call   c0108103 <simple_shell>
c01082ef:	90                   	nop
c01082f0:	c9                   	leave  
c01082f1:	c3                   	ret    

c01082f2 <test_exec>:
c01082f2:	55                   	push   %ebp
c01082f3:	89 e5                	mov    %esp,%ebp
c01082f5:	83 ec 38             	sub    $0x38,%esp
c01082f8:	83 ec 0c             	sub    $0xc,%esp
c01082fb:	68 0a bd 10 c0       	push   $0xc010bd0a
c0108300:	e8 87 7d ff ff       	call   c010008c <disp_str>
c0108305:	83 c4 10             	add    $0x10,%esp
c0108308:	83 ec 0c             	sub    $0xc,%esp
c010830b:	68 1c bd 10 c0       	push   $0xc010bd1c
c0108310:	e8 77 7d ff ff       	call   c010008c <disp_str>
c0108315:	83 c4 10             	add    $0x10,%esp
c0108318:	83 ec 0c             	sub    $0xc,%esp
c010831b:	6a 07                	push   $0x7
c010831d:	e8 b8 ed ff ff       	call   c01070da <disp_int>
c0108322:	83 c4 10             	add    $0x10,%esp
c0108325:	83 ec 0c             	sub    $0xc,%esp
c0108328:	68 00 b6 10 c0       	push   $0xc010b600
c010832d:	e8 5a 7d ff ff       	call   c010008c <disp_str>
c0108332:	83 c4 10             	add    $0x10,%esp
c0108335:	83 ec 0c             	sub    $0xc,%esp
c0108338:	68 02 b6 10 c0       	push   $0xc010b602
c010833d:	e8 4a 7d ff ff       	call   c010008c <disp_str>
c0108342:	83 c4 10             	add    $0x10,%esp
c0108345:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c010834c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108353:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0108359:	83 ec 08             	sub    $0x8,%esp
c010835c:	6a 02                	push   $0x2
c010835e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108361:	50                   	push   %eax
c0108362:	e8 f8 c7 ff ff       	call   c0104b5f <open>
c0108367:	83 c4 10             	add    $0x10,%esp
c010836a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010836d:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0108374:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c010837b:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0108382:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0108389:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108390:	83 ec 0c             	sub    $0xc,%esp
c0108393:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108396:	50                   	push   %eax
c0108397:	e8 83 e9 ff ff       	call   c0106d1f <untar>
c010839c:	83 c4 10             	add    $0x10,%esp
c010839f:	83 ec 08             	sub    $0x8,%esp
c01083a2:	6a 00                	push   $0x0
c01083a4:	68 2f bd 10 c0       	push   $0xc010bd2f
c01083a9:	68 33 bd 10 c0       	push   $0xc010bd33
c01083ae:	68 9c bc 10 c0       	push   $0xc010bc9c
c01083b3:	68 97 bc 10 c0       	push   $0xc010bc97
c01083b8:	68 04 bd 10 c0       	push   $0xc010bd04
c01083bd:	e8 d0 cd ff ff       	call   c0105192 <execl>
c01083c2:	83 c4 20             	add    $0x20,%esp
c01083c5:	e8 34 e8 ff ff       	call   c0106bfe <stop_here>
c01083ca:	e8 f0 ca ff ff       	call   c0104ebf <fork>
c01083cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01083d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01083d6:	7e 25                	jle    c01083fd <test_exec+0x10b>
c01083d8:	83 ec 0c             	sub    $0xc,%esp
c01083db:	8d 45 cc             	lea    -0x34(%ebp),%eax
c01083de:	50                   	push   %eax
c01083df:	e8 68 ca ff ff       	call   c0104e4c <wait>
c01083e4:	83 c4 10             	add    $0x10,%esp
c01083e7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01083ea:	83 ec 08             	sub    $0x8,%esp
c01083ed:	50                   	push   %eax
c01083ee:	68 39 bd 10 c0       	push   $0xc010bd39
c01083f3:	e8 b0 01 00 00       	call   c01085a8 <Printf>
c01083f8:	83 c4 10             	add    $0x10,%esp
c01083fb:	eb 33                	jmp    c0108430 <test_exec+0x13e>
c01083fd:	83 ec 0c             	sub    $0xc,%esp
c0108400:	68 4b bd 10 c0       	push   $0xc010bd4b
c0108405:	e8 9e 01 00 00       	call   c01085a8 <Printf>
c010840a:	83 c4 10             	add    $0x10,%esp
c010840d:	83 ec 0c             	sub    $0xc,%esp
c0108410:	6a 00                	push   $0x0
c0108412:	68 33 bd 10 c0       	push   $0xc010bd33
c0108417:	68 9c bc 10 c0       	push   $0xc010bc9c
c010841c:	68 97 bc 10 c0       	push   $0xc010bc97
c0108421:	68 04 bd 10 c0       	push   $0xc010bd04
c0108426:	e8 67 cd ff ff       	call   c0105192 <execl>
c010842b:	83 c4 20             	add    $0x20,%esp
c010842e:	eb fe                	jmp    c010842e <test_exec+0x13c>
c0108430:	c9                   	leave  
c0108431:	c3                   	ret    

c0108432 <INIT>:
c0108432:	55                   	push   %ebp
c0108433:	89 e5                	mov    %esp,%ebp
c0108435:	83 ec 08             	sub    $0x8,%esp
c0108438:	e8 4d fe ff ff       	call   c010828a <test_shell>
c010843d:	eb fe                	jmp    c010843d <INIT+0xb>

c010843f <TestA>:
c010843f:	55                   	push   %ebp
c0108440:	89 e5                	mov    %esp,%ebp
c0108442:	83 ec 08             	sub    $0x8,%esp
c0108445:	83 ec 0c             	sub    $0xc,%esp
c0108448:	6a 05                	push   $0x5
c010844a:	e8 8b ec ff ff       	call   c01070da <disp_int>
c010844f:	83 c4 10             	add    $0x10,%esp
c0108452:	83 ec 0c             	sub    $0xc,%esp
c0108455:	68 13 b7 10 c0       	push   $0xc010b713
c010845a:	e8 2d 7c ff ff       	call   c010008c <disp_str>
c010845f:	83 c4 10             	add    $0x10,%esp
c0108462:	83 ec 0c             	sub    $0xc,%esp
c0108465:	68 59 bd 10 c0       	push   $0xc010bd59
c010846a:	e8 1d 7c ff ff       	call   c010008c <disp_str>
c010846f:	83 c4 10             	add    $0x10,%esp
c0108472:	eb fe                	jmp    c0108472 <TestA+0x33>

c0108474 <delay>:
c0108474:	55                   	push   %ebp
c0108475:	89 e5                	mov    %esp,%ebp
c0108477:	83 ec 10             	sub    $0x10,%esp
c010847a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108481:	eb 2a                	jmp    c01084ad <delay+0x39>
c0108483:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c010848a:	eb 17                	jmp    c01084a3 <delay+0x2f>
c010848c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108493:	eb 04                	jmp    c0108499 <delay+0x25>
c0108495:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108499:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c010849d:	7e f6                	jle    c0108495 <delay+0x21>
c010849f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01084a3:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c01084a7:	7e e3                	jle    c010848c <delay+0x18>
c01084a9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01084ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01084b0:	3b 45 08             	cmp    0x8(%ebp),%eax
c01084b3:	7c ce                	jl     c0108483 <delay+0xf>
c01084b5:	90                   	nop
c01084b6:	c9                   	leave  
c01084b7:	c3                   	ret    

c01084b8 <TestB>:
c01084b8:	55                   	push   %ebp
c01084b9:	89 e5                	mov    %esp,%ebp
c01084bb:	83 ec 08             	sub    $0x8,%esp
c01084be:	83 ec 0c             	sub    $0xc,%esp
c01084c1:	68 60 bd 10 c0       	push   $0xc010bd60
c01084c6:	e8 c1 7b ff ff       	call   c010008c <disp_str>
c01084cb:	83 c4 10             	add    $0x10,%esp
c01084ce:	eb fe                	jmp    c01084ce <TestB+0x16>

c01084d0 <TestC>:
c01084d0:	55                   	push   %ebp
c01084d1:	89 e5                	mov    %esp,%ebp
c01084d3:	83 ec 18             	sub    $0x18,%esp
c01084d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084dd:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c01084e1:	77 1a                	ja     c01084fd <TestC+0x2d>
c01084e3:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c01084ea:	83 ec 08             	sub    $0x8,%esp
c01084ed:	ff 75 f0             	pushl  -0x10(%ebp)
c01084f0:	68 63 bd 10 c0       	push   $0xc010bd63
c01084f5:	e8 ae 00 00 00       	call   c01085a8 <Printf>
c01084fa:	83 c4 10             	add    $0x10,%esp
c01084fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108501:	eb da                	jmp    c01084dd <TestC+0xd>

c0108503 <sys_get_ticks>:
c0108503:	55                   	push   %ebp
c0108504:	89 e5                	mov    %esp,%ebp
c0108506:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010850b:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108511:	5d                   	pop    %ebp
c0108512:	c3                   	ret    

c0108513 <sys_write>:
c0108513:	55                   	push   %ebp
c0108514:	89 e5                	mov    %esp,%ebp
c0108516:	83 ec 18             	sub    $0x18,%esp
c0108519:	8b 45 10             	mov    0x10(%ebp),%eax
c010851c:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108522:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108528:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010852d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108530:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108533:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108536:	8b 45 08             	mov    0x8(%ebp),%eax
c0108539:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010853c:	eb 20                	jmp    c010855e <sys_write+0x4b>
c010853e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108541:	0f b6 00             	movzbl (%eax),%eax
c0108544:	0f b6 c0             	movzbl %al,%eax
c0108547:	83 ec 08             	sub    $0x8,%esp
c010854a:	50                   	push   %eax
c010854b:	ff 75 ec             	pushl  -0x14(%ebp)
c010854e:	e8 7d b9 ff ff       	call   c0103ed0 <out_char>
c0108553:	83 c4 10             	add    $0x10,%esp
c0108556:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010855a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c010855e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108562:	7f da                	jg     c010853e <sys_write+0x2b>
c0108564:	90                   	nop
c0108565:	c9                   	leave  
c0108566:	c3                   	ret    

c0108567 <milli_delay>:
c0108567:	55                   	push   %ebp
c0108568:	89 e5                	mov    %esp,%ebp
c010856a:	83 ec 18             	sub    $0x18,%esp
c010856d:	e8 8a 11 00 00       	call   c01096fc <get_ticks_ipc>
c0108572:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108575:	90                   	nop
c0108576:	e8 81 11 00 00       	call   c01096fc <get_ticks_ipc>
c010857b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c010857e:	89 c1                	mov    %eax,%ecx
c0108580:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0108585:	89 c8                	mov    %ecx,%eax
c0108587:	f7 ea                	imul   %edx
c0108589:	c1 fa 05             	sar    $0x5,%edx
c010858c:	89 c8                	mov    %ecx,%eax
c010858e:	c1 f8 1f             	sar    $0x1f,%eax
c0108591:	29 c2                	sub    %eax,%edx
c0108593:	89 d0                	mov    %edx,%eax
c0108595:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c010859b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010859e:	77 d6                	ja     c0108576 <milli_delay+0xf>
c01085a0:	90                   	nop
c01085a1:	c9                   	leave  
c01085a2:	c3                   	ret    

c01085a3 <TaskSys>:
c01085a3:	55                   	push   %ebp
c01085a4:	89 e5                	mov    %esp,%ebp
c01085a6:	eb fe                	jmp    c01085a6 <TaskSys+0x3>

c01085a8 <Printf>:
c01085a8:	55                   	push   %ebp
c01085a9:	89 e5                	mov    %esp,%ebp
c01085ab:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01085b1:	83 ec 04             	sub    $0x4,%esp
c01085b4:	68 00 01 00 00       	push   $0x100
c01085b9:	6a 00                	push   $0x0
c01085bb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01085c1:	50                   	push   %eax
c01085c2:	e8 08 3c 00 00       	call   c010c1cf <Memset>
c01085c7:	83 c4 10             	add    $0x10,%esp
c01085ca:	8d 45 0c             	lea    0xc(%ebp),%eax
c01085cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01085d3:	83 ec 04             	sub    $0x4,%esp
c01085d6:	ff 75 f4             	pushl  -0xc(%ebp)
c01085d9:	50                   	push   %eax
c01085da:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01085e0:	50                   	push   %eax
c01085e1:	e8 20 00 00 00       	call   c0108606 <vsprintf>
c01085e6:	83 c4 10             	add    $0x10,%esp
c01085e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01085ec:	83 ec 04             	sub    $0x4,%esp
c01085ef:	ff 75 f0             	pushl  -0x10(%ebp)
c01085f2:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01085f8:	50                   	push   %eax
c01085f9:	6a 00                	push   $0x0
c01085fb:	e8 75 c7 ff ff       	call   c0104d75 <write>
c0108600:	83 c4 10             	add    $0x10,%esp
c0108603:	90                   	nop
c0108604:	c9                   	leave  
c0108605:	c3                   	ret    

c0108606 <vsprintf>:
c0108606:	55                   	push   %ebp
c0108607:	89 e5                	mov    %esp,%ebp
c0108609:	81 ec 68 02 00 00    	sub    $0x268,%esp
c010860f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108615:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010861b:	83 ec 04             	sub    $0x4,%esp
c010861e:	6a 40                	push   $0x40
c0108620:	6a 00                	push   $0x0
c0108622:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108628:	50                   	push   %eax
c0108629:	e8 a1 3b 00 00       	call   c010c1cf <Memset>
c010862e:	83 c4 10             	add    $0x10,%esp
c0108631:	8b 45 10             	mov    0x10(%ebp),%eax
c0108634:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108637:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010863e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108641:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108644:	e9 53 01 00 00       	jmp    c010879c <vsprintf+0x196>
c0108649:	8b 45 0c             	mov    0xc(%ebp),%eax
c010864c:	0f b6 00             	movzbl (%eax),%eax
c010864f:	3c 25                	cmp    $0x25,%al
c0108651:	74 16                	je     c0108669 <vsprintf+0x63>
c0108653:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108656:	8d 50 01             	lea    0x1(%eax),%edx
c0108659:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010865c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010865f:	0f b6 12             	movzbl (%edx),%edx
c0108662:	88 10                	mov    %dl,(%eax)
c0108664:	e9 2f 01 00 00       	jmp    c0108798 <vsprintf+0x192>
c0108669:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010866d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108670:	0f b6 00             	movzbl (%eax),%eax
c0108673:	0f be c0             	movsbl %al,%eax
c0108676:	83 f8 64             	cmp    $0x64,%eax
c0108679:	74 26                	je     c01086a1 <vsprintf+0x9b>
c010867b:	83 f8 64             	cmp    $0x64,%eax
c010867e:	7f 0e                	jg     c010868e <vsprintf+0x88>
c0108680:	83 f8 63             	cmp    $0x63,%eax
c0108683:	0f 84 f2 00 00 00    	je     c010877b <vsprintf+0x175>
c0108689:	e9 0a 01 00 00       	jmp    c0108798 <vsprintf+0x192>
c010868e:	83 f8 73             	cmp    $0x73,%eax
c0108691:	0f 84 b0 00 00 00    	je     c0108747 <vsprintf+0x141>
c0108697:	83 f8 78             	cmp    $0x78,%eax
c010869a:	74 5d                	je     c01086f9 <vsprintf+0xf3>
c010869c:	e9 f7 00 00 00       	jmp    c0108798 <vsprintf+0x192>
c01086a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086a4:	8b 00                	mov    (%eax),%eax
c01086a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01086a9:	83 ec 04             	sub    $0x4,%esp
c01086ac:	6a 0a                	push   $0xa
c01086ae:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01086b4:	50                   	push   %eax
c01086b5:	ff 75 e8             	pushl  -0x18(%ebp)
c01086b8:	e8 96 10 00 00       	call   c0109753 <itoa>
c01086bd:	83 c4 10             	add    $0x10,%esp
c01086c0:	83 ec 08             	sub    $0x8,%esp
c01086c3:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01086c9:	50                   	push   %eax
c01086ca:	ff 75 f4             	pushl  -0xc(%ebp)
c01086cd:	e8 1c 3b 00 00       	call   c010c1ee <Strcpy>
c01086d2:	83 c4 10             	add    $0x10,%esp
c01086d5:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01086d9:	83 ec 0c             	sub    $0xc,%esp
c01086dc:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01086e2:	50                   	push   %eax
c01086e3:	e8 20 3b 00 00       	call   c010c208 <Strlen>
c01086e8:	83 c4 10             	add    $0x10,%esp
c01086eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01086ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01086f1:	01 45 f4             	add    %eax,-0xc(%ebp)
c01086f4:	e9 9f 00 00 00       	jmp    c0108798 <vsprintf+0x192>
c01086f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086fc:	8b 00                	mov    (%eax),%eax
c01086fe:	83 ec 08             	sub    $0x8,%esp
c0108701:	50                   	push   %eax
c0108702:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108708:	50                   	push   %eax
c0108709:	e8 26 e9 ff ff       	call   c0107034 <atoi>
c010870e:	83 c4 10             	add    $0x10,%esp
c0108711:	83 ec 08             	sub    $0x8,%esp
c0108714:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010871a:	50                   	push   %eax
c010871b:	ff 75 f4             	pushl  -0xc(%ebp)
c010871e:	e8 cb 3a 00 00       	call   c010c1ee <Strcpy>
c0108723:	83 c4 10             	add    $0x10,%esp
c0108726:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010872a:	83 ec 0c             	sub    $0xc,%esp
c010872d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108733:	50                   	push   %eax
c0108734:	e8 cf 3a 00 00       	call   c010c208 <Strlen>
c0108739:	83 c4 10             	add    $0x10,%esp
c010873c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010873f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108742:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108745:	eb 51                	jmp    c0108798 <vsprintf+0x192>
c0108747:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010874a:	8b 00                	mov    (%eax),%eax
c010874c:	83 ec 08             	sub    $0x8,%esp
c010874f:	50                   	push   %eax
c0108750:	ff 75 f4             	pushl  -0xc(%ebp)
c0108753:	e8 96 3a 00 00       	call   c010c1ee <Strcpy>
c0108758:	83 c4 10             	add    $0x10,%esp
c010875b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010875e:	8b 00                	mov    (%eax),%eax
c0108760:	83 ec 0c             	sub    $0xc,%esp
c0108763:	50                   	push   %eax
c0108764:	e8 9f 3a 00 00       	call   c010c208 <Strlen>
c0108769:	83 c4 10             	add    $0x10,%esp
c010876c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010876f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108773:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108776:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108779:	eb 1d                	jmp    c0108798 <vsprintf+0x192>
c010877b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010877e:	0f b6 10             	movzbl (%eax),%edx
c0108781:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108784:	88 10                	mov    %dl,(%eax)
c0108786:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010878a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0108791:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108794:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108797:	90                   	nop
c0108798:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010879c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010879f:	0f b6 00             	movzbl (%eax),%eax
c01087a2:	84 c0                	test   %al,%al
c01087a4:	0f 85 9f fe ff ff    	jne    c0108649 <vsprintf+0x43>
c01087aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01087ad:	2b 45 08             	sub    0x8(%ebp),%eax
c01087b0:	c9                   	leave  
c01087b1:	c3                   	ret    

c01087b2 <printx>:
c01087b2:	55                   	push   %ebp
c01087b3:	89 e5                	mov    %esp,%ebp
c01087b5:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01087bb:	8d 45 0c             	lea    0xc(%ebp),%eax
c01087be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01087c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01087c4:	83 ec 04             	sub    $0x4,%esp
c01087c7:	ff 75 f4             	pushl  -0xc(%ebp)
c01087ca:	50                   	push   %eax
c01087cb:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01087d1:	50                   	push   %eax
c01087d2:	e8 2f fe ff ff       	call   c0108606 <vsprintf>
c01087d7:	83 c4 10             	add    $0x10,%esp
c01087da:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01087dd:	83 ec 08             	sub    $0x8,%esp
c01087e0:	ff 75 f0             	pushl  -0x10(%ebp)
c01087e3:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01087e9:	50                   	push   %eax
c01087ea:	e8 11 8e ff ff       	call   c0101600 <write_debug>
c01087ef:	83 c4 10             	add    $0x10,%esp
c01087f2:	90                   	nop
c01087f3:	c9                   	leave  
c01087f4:	c3                   	ret    

c01087f5 <sys_printx>:
c01087f5:	55                   	push   %ebp
c01087f6:	89 e5                	mov    %esp,%ebp
c01087f8:	83 ec 28             	sub    $0x28,%esp
c01087fb:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108800:	85 c0                	test   %eax,%eax
c0108802:	75 15                	jne    c0108819 <sys_printx+0x24>
c0108804:	8b 45 10             	mov    0x10(%ebp),%eax
c0108807:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c010880d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108810:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108817:	eb 10                	jmp    c0108829 <sys_printx+0x34>
c0108819:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010881e:	85 c0                	test   %eax,%eax
c0108820:	74 07                	je     c0108829 <sys_printx+0x34>
c0108822:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108829:	8b 55 08             	mov    0x8(%ebp),%edx
c010882c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010882f:	01 d0                	add    %edx,%eax
c0108831:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108834:	8b 45 10             	mov    0x10(%ebp),%eax
c0108837:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c010883d:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108843:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108848:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010884b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010884e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108851:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108854:	0f b6 00             	movzbl (%eax),%eax
c0108857:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010885a:	eb 3a                	jmp    c0108896 <sys_printx+0xa1>
c010885c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010885f:	0f b6 00             	movzbl (%eax),%eax
c0108862:	3c 3b                	cmp    $0x3b,%al
c0108864:	74 0a                	je     c0108870 <sys_printx+0x7b>
c0108866:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108869:	0f b6 00             	movzbl (%eax),%eax
c010886c:	3c 3a                	cmp    $0x3a,%al
c010886e:	75 06                	jne    c0108876 <sys_printx+0x81>
c0108870:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108874:	eb 20                	jmp    c0108896 <sys_printx+0xa1>
c0108876:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108879:	0f b6 00             	movzbl (%eax),%eax
c010887c:	0f b6 c0             	movzbl %al,%eax
c010887f:	83 ec 08             	sub    $0x8,%esp
c0108882:	50                   	push   %eax
c0108883:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108886:	e8 45 b6 ff ff       	call   c0103ed0 <out_char>
c010888b:	83 c4 10             	add    $0x10,%esp
c010888e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108892:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0108896:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010889a:	7f c0                	jg     c010885c <sys_printx+0x67>
c010889c:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c01088a0:	75 10                	jne    c01088b2 <sys_printx+0xbd>
c01088a2:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01088a7:	85 c0                	test   %eax,%eax
c01088a9:	74 13                	je     c01088be <sys_printx+0xc9>
c01088ab:	e8 62 7a ff ff       	call   c0100312 <disable_int>
c01088b0:	eb 0c                	jmp    c01088be <sys_printx+0xc9>
c01088b2:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c01088b6:	75 06                	jne    c01088be <sys_printx+0xc9>
c01088b8:	e8 55 7a ff ff       	call   c0100312 <disable_int>
c01088bd:	90                   	nop
c01088be:	90                   	nop
c01088bf:	c9                   	leave  
c01088c0:	c3                   	ret    

c01088c1 <spin>:
c01088c1:	55                   	push   %ebp
c01088c2:	89 e5                	mov    %esp,%ebp
c01088c4:	83 ec 08             	sub    $0x8,%esp
c01088c7:	83 ec 0c             	sub    $0xc,%esp
c01088ca:	ff 75 08             	pushl  0x8(%ebp)
c01088cd:	e8 ba 77 ff ff       	call   c010008c <disp_str>
c01088d2:	83 c4 10             	add    $0x10,%esp
c01088d5:	83 ec 0c             	sub    $0xc,%esp
c01088d8:	68 13 b7 10 c0       	push   $0xc010b713
c01088dd:	e8 aa 77 ff ff       	call   c010008c <disp_str>
c01088e2:	83 c4 10             	add    $0x10,%esp
c01088e5:	eb fe                	jmp    c01088e5 <spin+0x24>

c01088e7 <panic>:
c01088e7:	55                   	push   %ebp
c01088e8:	89 e5                	mov    %esp,%ebp
c01088ea:	83 ec 08             	sub    $0x8,%esp
c01088ed:	83 ec 04             	sub    $0x4,%esp
c01088f0:	ff 75 08             	pushl  0x8(%ebp)
c01088f3:	6a 3a                	push   $0x3a
c01088f5:	68 70 bd 10 c0       	push   $0xc010bd70
c01088fa:	e8 b3 fe ff ff       	call   c01087b2 <printx>
c01088ff:	83 c4 10             	add    $0x10,%esp
c0108902:	90                   	nop
c0108903:	c9                   	leave  
c0108904:	c3                   	ret    

c0108905 <assertion_failure>:
c0108905:	55                   	push   %ebp
c0108906:	89 e5                	mov    %esp,%ebp
c0108908:	83 ec 08             	sub    $0x8,%esp
c010890b:	83 ec 08             	sub    $0x8,%esp
c010890e:	ff 75 14             	pushl  0x14(%ebp)
c0108911:	ff 75 10             	pushl  0x10(%ebp)
c0108914:	ff 75 0c             	pushl  0xc(%ebp)
c0108917:	ff 75 08             	pushl  0x8(%ebp)
c010891a:	6a 3b                	push   $0x3b
c010891c:	68 78 bd 10 c0       	push   $0xc010bd78
c0108921:	e8 8c fe ff ff       	call   c01087b2 <printx>
c0108926:	83 c4 20             	add    $0x20,%esp
c0108929:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108930:	00 00 00 
c0108933:	83 ec 0c             	sub    $0xc,%esp
c0108936:	68 00 b6 10 c0       	push   $0xc010b600
c010893b:	e8 4c 77 ff ff       	call   c010008c <disp_str>
c0108940:	83 c4 10             	add    $0x10,%esp
c0108943:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108948:	83 ec 0c             	sub    $0xc,%esp
c010894b:	50                   	push   %eax
c010894c:	e8 89 e7 ff ff       	call   c01070da <disp_int>
c0108951:	83 c4 10             	add    $0x10,%esp
c0108954:	83 ec 0c             	sub    $0xc,%esp
c0108957:	68 02 b6 10 c0       	push   $0xc010b602
c010895c:	e8 2b 77 ff ff       	call   c010008c <disp_str>
c0108961:	83 c4 10             	add    $0x10,%esp
c0108964:	83 ec 0c             	sub    $0xc,%esp
c0108967:	68 ab bd 10 c0       	push   $0xc010bdab
c010896c:	e8 50 ff ff ff       	call   c01088c1 <spin>
c0108971:	83 c4 10             	add    $0x10,%esp
c0108974:	90                   	nop
c0108975:	c9                   	leave  
c0108976:	c3                   	ret    

c0108977 <assertion_failure2>:
c0108977:	55                   	push   %ebp
c0108978:	89 e5                	mov    %esp,%ebp
c010897a:	83 ec 08             	sub    $0x8,%esp
c010897d:	83 ec 04             	sub    $0x4,%esp
c0108980:	ff 75 18             	pushl  0x18(%ebp)
c0108983:	ff 75 14             	pushl  0x14(%ebp)
c0108986:	ff 75 10             	pushl  0x10(%ebp)
c0108989:	ff 75 0c             	pushl  0xc(%ebp)
c010898c:	ff 75 08             	pushl  0x8(%ebp)
c010898f:	6a 3b                	push   $0x3b
c0108991:	68 b8 bd 10 c0       	push   $0xc010bdb8
c0108996:	e8 17 fe ff ff       	call   c01087b2 <printx>
c010899b:	83 c4 20             	add    $0x20,%esp
c010899e:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01089a5:	00 00 00 
c01089a8:	83 ec 0c             	sub    $0xc,%esp
c01089ab:	68 00 b6 10 c0       	push   $0xc010b600
c01089b0:	e8 d7 76 ff ff       	call   c010008c <disp_str>
c01089b5:	83 c4 10             	add    $0x10,%esp
c01089b8:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01089bd:	83 ec 0c             	sub    $0xc,%esp
c01089c0:	50                   	push   %eax
c01089c1:	e8 14 e7 ff ff       	call   c01070da <disp_int>
c01089c6:	83 c4 10             	add    $0x10,%esp
c01089c9:	83 ec 0c             	sub    $0xc,%esp
c01089cc:	68 02 b6 10 c0       	push   $0xc010b602
c01089d1:	e8 b6 76 ff ff       	call   c010008c <disp_str>
c01089d6:	83 c4 10             	add    $0x10,%esp
c01089d9:	83 ec 0c             	sub    $0xc,%esp
c01089dc:	68 ab bd 10 c0       	push   $0xc010bdab
c01089e1:	e8 db fe ff ff       	call   c01088c1 <spin>
c01089e6:	83 c4 10             	add    $0x10,%esp
c01089e9:	90                   	nop
c01089ea:	c9                   	leave  
c01089eb:	c3                   	ret    

c01089ec <dead_lock>:
c01089ec:	55                   	push   %ebp
c01089ed:	89 e5                	mov    %esp,%ebp
c01089ef:	b8 00 00 00 00       	mov    $0x0,%eax
c01089f4:	5d                   	pop    %ebp
c01089f5:	c3                   	ret    

c01089f6 <sys_send_msg>:
c01089f6:	55                   	push   %ebp
c01089f7:	89 e5                	mov    %esp,%ebp
c01089f9:	83 ec 58             	sub    $0x58,%esp
c01089fc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108a03:	83 ec 0c             	sub    $0xc,%esp
c0108a06:	ff 75 0c             	pushl  0xc(%ebp)
c0108a09:	e8 28 ae ff ff       	call   c0103836 <pid2proc>
c0108a0e:	83 c4 10             	add    $0x10,%esp
c0108a11:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108a14:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a18:	74 2c                	je     c0108a46 <sys_send_msg+0x50>
c0108a1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a1d:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108a23:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108a28:	74 1c                	je     c0108a46 <sys_send_msg+0x50>
c0108a2a:	68 5c 05 00 00       	push   $0x55c
c0108a2f:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a34:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a39:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108a3e:	e8 c2 fe ff ff       	call   c0108905 <assertion_failure>
c0108a43:	83 c4 10             	add    $0x10,%esp
c0108a46:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a49:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108a4f:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108a54:	74 1c                	je     c0108a72 <sys_send_msg+0x7c>
c0108a56:	68 5e 05 00 00       	push   $0x55e
c0108a5b:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a60:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a65:	68 20 be 10 c0       	push   $0xc010be20
c0108a6a:	e8 96 fe ff ff       	call   c0108905 <assertion_failure>
c0108a6f:	83 c4 10             	add    $0x10,%esp
c0108a72:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a76:	75 22                	jne    c0108a9a <sys_send_msg+0xa4>
c0108a78:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a7c:	75 1c                	jne    c0108a9a <sys_send_msg+0xa4>
c0108a7e:	68 61 05 00 00       	push   $0x561
c0108a83:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a88:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a8d:	68 43 be 10 c0       	push   $0xc010be43
c0108a92:	e8 6e fe ff ff       	call   c0108905 <assertion_failure>
c0108a97:	83 c4 10             	add    $0x10,%esp
c0108a9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a9d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108aa4:	84 c0                	test   %al,%al
c0108aa6:	74 65                	je     c0108b0d <sys_send_msg+0x117>
c0108aa8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108aab:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ab2:	3c 01                	cmp    $0x1,%al
c0108ab4:	74 57                	je     c0108b0d <sys_send_msg+0x117>
c0108ab6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ab9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ac0:	3c 02                	cmp    $0x2,%al
c0108ac2:	74 49                	je     c0108b0d <sys_send_msg+0x117>
c0108ac4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ac7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ace:	3c 03                	cmp    $0x3,%al
c0108ad0:	74 3b                	je     c0108b0d <sys_send_msg+0x117>
c0108ad2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ad5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108adc:	3c 04                	cmp    $0x4,%al
c0108ade:	74 2d                	je     c0108b0d <sys_send_msg+0x117>
c0108ae0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ae3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108aea:	0f be c0             	movsbl %al,%eax
c0108aed:	83 ec 0c             	sub    $0xc,%esp
c0108af0:	68 65 05 00 00       	push   $0x565
c0108af5:	68 61 ba 10 c0       	push   $0xc010ba61
c0108afa:	68 61 ba 10 c0       	push   $0xc010ba61
c0108aff:	50                   	push   %eax
c0108b00:	68 54 be 10 c0       	push   $0xc010be54
c0108b05:	e8 6d fe ff ff       	call   c0108977 <assertion_failure2>
c0108b0a:	83 c4 20             	add    $0x20,%esp
c0108b0d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b10:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b17:	84 c0                	test   %al,%al
c0108b19:	74 65                	je     c0108b80 <sys_send_msg+0x18a>
c0108b1b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b1e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b25:	3c 01                	cmp    $0x1,%al
c0108b27:	74 57                	je     c0108b80 <sys_send_msg+0x18a>
c0108b29:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b2c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b33:	3c 02                	cmp    $0x2,%al
c0108b35:	74 49                	je     c0108b80 <sys_send_msg+0x18a>
c0108b37:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b3a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b41:	3c 03                	cmp    $0x3,%al
c0108b43:	74 3b                	je     c0108b80 <sys_send_msg+0x18a>
c0108b45:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b48:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b4f:	3c 04                	cmp    $0x4,%al
c0108b51:	74 2d                	je     c0108b80 <sys_send_msg+0x18a>
c0108b53:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b56:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b5d:	0f be c0             	movsbl %al,%eax
c0108b60:	83 ec 0c             	sub    $0xc,%esp
c0108b63:	68 68 05 00 00       	push   $0x568
c0108b68:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b6d:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b72:	50                   	push   %eax
c0108b73:	68 f0 be 10 c0       	push   $0xc010bef0
c0108b78:	e8 fa fd ff ff       	call   c0108977 <assertion_failure2>
c0108b7d:	83 c4 20             	add    $0x20,%esp
c0108b80:	83 ec 0c             	sub    $0xc,%esp
c0108b83:	ff 75 10             	pushl  0x10(%ebp)
c0108b86:	e8 31 ad ff ff       	call   c01038bc <proc2pid>
c0108b8b:	83 c4 10             	add    $0x10,%esp
c0108b8e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108b91:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108b98:	8b 45 08             	mov    0x8(%ebp),%eax
c0108b9b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108b9e:	83 ec 08             	sub    $0x8,%esp
c0108ba1:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108ba4:	ff 75 dc             	pushl  -0x24(%ebp)
c0108ba7:	e8 a6 d3 ff ff       	call   c0105f52 <get_physical_address_proc>
c0108bac:	83 c4 10             	add    $0x10,%esp
c0108baf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108bb2:	83 ec 08             	sub    $0x8,%esp
c0108bb5:	ff 75 e0             	pushl  -0x20(%ebp)
c0108bb8:	ff 75 d8             	pushl  -0x28(%ebp)
c0108bbb:	e8 bf d2 ff ff       	call   c0105e7f <alloc_virtual_memory>
c0108bc0:	83 c4 10             	add    $0x10,%esp
c0108bc3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108bc6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bc9:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108bcf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108bd2:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108bd9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108bdc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108bdf:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108be2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108be5:	89 10                	mov    %edx,(%eax)
c0108be7:	83 ec 08             	sub    $0x8,%esp
c0108bea:	ff 75 0c             	pushl  0xc(%ebp)
c0108bed:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108bf0:	e8 f7 fd ff ff       	call   c01089ec <dead_lock>
c0108bf5:	83 c4 10             	add    $0x10,%esp
c0108bf8:	83 f8 01             	cmp    $0x1,%eax
c0108bfb:	75 10                	jne    c0108c0d <sys_send_msg+0x217>
c0108bfd:	83 ec 0c             	sub    $0xc,%esp
c0108c00:	68 80 bf 10 c0       	push   $0xc010bf80
c0108c05:	e8 dd fc ff ff       	call   c01088e7 <panic>
c0108c0a:	83 c4 10             	add    $0x10,%esp
c0108c0d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c10:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c17:	3c 02                	cmp    $0x2,%al
c0108c19:	0f 85 ca 01 00 00    	jne    c0108de9 <sys_send_msg+0x3f3>
c0108c1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c22:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108c28:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108c2b:	74 12                	je     c0108c3f <sys_send_msg+0x249>
c0108c2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c30:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108c36:	83 f8 12             	cmp    $0x12,%eax
c0108c39:	0f 85 aa 01 00 00    	jne    c0108de9 <sys_send_msg+0x3f3>
c0108c3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c42:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108c48:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108c4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c4e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108c54:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108c57:	83 ec 08             	sub    $0x8,%esp
c0108c5a:	ff 75 0c             	pushl  0xc(%ebp)
c0108c5d:	ff 75 c0             	pushl  -0x40(%ebp)
c0108c60:	e8 ed d2 ff ff       	call   c0105f52 <get_physical_address_proc>
c0108c65:	83 c4 10             	add    $0x10,%esp
c0108c68:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108c6b:	83 ec 08             	sub    $0x8,%esp
c0108c6e:	ff 75 e0             	pushl  -0x20(%ebp)
c0108c71:	ff 75 bc             	pushl  -0x44(%ebp)
c0108c74:	e8 06 d2 ff ff       	call   c0105e7f <alloc_virtual_memory>
c0108c79:	83 c4 10             	add    $0x10,%esp
c0108c7c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108c7f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108c82:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108c85:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108c88:	83 ec 04             	sub    $0x4,%esp
c0108c8b:	51                   	push   %ecx
c0108c8c:	52                   	push   %edx
c0108c8d:	50                   	push   %eax
c0108c8e:	e8 59 e0 ff ff       	call   c0106cec <Memcpy>
c0108c93:	83 c4 10             	add    $0x10,%esp
c0108c96:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108c9b:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108ca0:	75 0a                	jne    c0108cac <sys_send_msg+0x2b6>
c0108ca2:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108ca9:	00 00 00 
c0108cac:	8b 45 10             	mov    0x10(%ebp),%eax
c0108caf:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108cb6:	00 00 00 
c0108cb9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cbc:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108cc3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cc6:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108ccd:	00 00 00 
c0108cd0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cd3:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108cda:	00 00 00 
c0108cdd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ce0:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108ce7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cea:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108cf1:	00 00 00 
c0108cf4:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cf7:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108cfe:	00 00 00 
c0108d01:	83 ec 0c             	sub    $0xc,%esp
c0108d04:	ff 75 e8             	pushl  -0x18(%ebp)
c0108d07:	e8 a0 09 00 00       	call   c01096ac <unblock>
c0108d0c:	83 c4 10             	add    $0x10,%esp
c0108d0f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d12:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d19:	84 c0                	test   %al,%al
c0108d1b:	74 1c                	je     c0108d39 <sys_send_msg+0x343>
c0108d1d:	68 a0 05 00 00       	push   $0x5a0
c0108d22:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d27:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d2c:	68 8b bf 10 c0       	push   $0xc010bf8b
c0108d31:	e8 cf fb ff ff       	call   c0108905 <assertion_failure>
c0108d36:	83 c4 10             	add    $0x10,%esp
c0108d39:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d3c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108d42:	83 f8 21             	cmp    $0x21,%eax
c0108d45:	74 1c                	je     c0108d63 <sys_send_msg+0x36d>
c0108d47:	68 a1 05 00 00       	push   $0x5a1
c0108d4c:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d51:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d56:	68 9f bf 10 c0       	push   $0xc010bf9f
c0108d5b:	e8 a5 fb ff ff       	call   c0108905 <assertion_failure>
c0108d60:	83 c4 10             	add    $0x10,%esp
c0108d63:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d66:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108d6c:	85 c0                	test   %eax,%eax
c0108d6e:	74 1c                	je     c0108d8c <sys_send_msg+0x396>
c0108d70:	68 a3 05 00 00       	push   $0x5a3
c0108d75:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d7a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d7f:	68 bc bf 10 c0       	push   $0xc010bfbc
c0108d84:	e8 7c fb ff ff       	call   c0108905 <assertion_failure>
c0108d89:	83 c4 10             	add    $0x10,%esp
c0108d8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d8f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d96:	84 c0                	test   %al,%al
c0108d98:	74 1c                	je     c0108db6 <sys_send_msg+0x3c0>
c0108d9a:	68 a4 05 00 00       	push   $0x5a4
c0108d9f:	68 61 ba 10 c0       	push   $0xc010ba61
c0108da4:	68 61 ba 10 c0       	push   $0xc010ba61
c0108da9:	68 d1 bf 10 c0       	push   $0xc010bfd1
c0108dae:	e8 52 fb ff ff       	call   c0108905 <assertion_failure>
c0108db3:	83 c4 10             	add    $0x10,%esp
c0108db6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108db9:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108dbf:	83 f8 21             	cmp    $0x21,%eax
c0108dc2:	0f 84 45 01 00 00    	je     c0108f0d <sys_send_msg+0x517>
c0108dc8:	68 a5 05 00 00       	push   $0x5a5
c0108dcd:	68 61 ba 10 c0       	push   $0xc010ba61
c0108dd2:	68 61 ba 10 c0       	push   $0xc010ba61
c0108dd7:	68 e8 bf 10 c0       	push   $0xc010bfe8
c0108ddc:	e8 24 fb ff ff       	call   c0108905 <assertion_failure>
c0108de1:	83 c4 10             	add    $0x10,%esp
c0108de4:	e9 24 01 00 00       	jmp    c0108f0d <sys_send_msg+0x517>
c0108de9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108df0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108df3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108df6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108df9:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108dff:	85 c0                	test   %eax,%eax
c0108e01:	75 1b                	jne    c0108e1e <sys_send_msg+0x428>
c0108e03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e06:	8b 55 10             	mov    0x10(%ebp),%edx
c0108e09:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108e0f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e12:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108e19:	00 00 00 
c0108e1c:	eb 3f                	jmp    c0108e5d <sys_send_msg+0x467>
c0108e1e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108e21:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e27:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e2a:	eb 12                	jmp    c0108e3e <sys_send_msg+0x448>
c0108e2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108e2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108e32:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108e35:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108e3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e3e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108e42:	75 e8                	jne    c0108e2c <sys_send_msg+0x436>
c0108e44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108e47:	8b 55 10             	mov    0x10(%ebp),%edx
c0108e4a:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108e50:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e53:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108e5a:	00 00 00 
c0108e5d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e60:	8b 55 08             	mov    0x8(%ebp),%edx
c0108e63:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108e69:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e6c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108e6f:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108e75:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e78:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108e7f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e82:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e89:	3c 01                	cmp    $0x1,%al
c0108e8b:	74 1c                	je     c0108ea9 <sys_send_msg+0x4b3>
c0108e8d:	68 c7 05 00 00       	push   $0x5c7
c0108e92:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e97:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e9c:	68 0c c0 10 c0       	push   $0xc010c00c
c0108ea1:	e8 5f fa ff ff       	call   c0108905 <assertion_failure>
c0108ea6:	83 c4 10             	add    $0x10,%esp
c0108ea9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eac:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108eb2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108eb5:	74 1c                	je     c0108ed3 <sys_send_msg+0x4dd>
c0108eb7:	68 c8 05 00 00       	push   $0x5c8
c0108ebc:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ec1:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ec6:	68 28 c0 10 c0       	push   $0xc010c028
c0108ecb:	e8 35 fa ff ff       	call   c0108905 <assertion_failure>
c0108ed0:	83 c4 10             	add    $0x10,%esp
c0108ed3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ed6:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108edc:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108edf:	74 1c                	je     c0108efd <sys_send_msg+0x507>
c0108ee1:	68 c9 05 00 00       	push   $0x5c9
c0108ee6:	68 61 ba 10 c0       	push   $0xc010ba61
c0108eeb:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ef0:	68 4a c0 10 c0       	push   $0xc010c04a
c0108ef5:	e8 0b fa ff ff       	call   c0108905 <assertion_failure>
c0108efa:	83 c4 10             	add    $0x10,%esp
c0108efd:	83 ec 0c             	sub    $0xc,%esp
c0108f00:	ff 75 10             	pushl  0x10(%ebp)
c0108f03:	e8 68 07 00 00       	call   c0109670 <block>
c0108f08:	83 c4 10             	add    $0x10,%esp
c0108f0b:	eb 01                	jmp    c0108f0e <sys_send_msg+0x518>
c0108f0d:	90                   	nop
c0108f0e:	b8 00 00 00 00       	mov    $0x0,%eax
c0108f13:	c9                   	leave  
c0108f14:	c3                   	ret    

c0108f15 <sys_receive_msg>:
c0108f15:	55                   	push   %ebp
c0108f16:	89 e5                	mov    %esp,%ebp
c0108f18:	83 ec 58             	sub    $0x58,%esp
c0108f1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108f22:	83 ec 0c             	sub    $0xc,%esp
c0108f25:	ff 75 0c             	pushl  0xc(%ebp)
c0108f28:	e8 09 a9 ff ff       	call   c0103836 <pid2proc>
c0108f2d:	83 c4 10             	add    $0x10,%esp
c0108f30:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108f33:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108f37:	74 2c                	je     c0108f65 <sys_receive_msg+0x50>
c0108f39:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f3c:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108f42:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108f47:	74 1c                	je     c0108f65 <sys_receive_msg+0x50>
c0108f49:	68 dd 05 00 00       	push   $0x5dd
c0108f4e:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f53:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f58:	68 20 be 10 c0       	push   $0xc010be20
c0108f5d:	e8 a3 f9 ff ff       	call   c0108905 <assertion_failure>
c0108f62:	83 c4 10             	add    $0x10,%esp
c0108f65:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f68:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108f6e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108f73:	74 1c                	je     c0108f91 <sys_receive_msg+0x7c>
c0108f75:	68 df 05 00 00       	push   $0x5df
c0108f7a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f7f:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f84:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108f89:	e8 77 f9 ff ff       	call   c0108905 <assertion_failure>
c0108f8e:	83 c4 10             	add    $0x10,%esp
c0108f91:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f94:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f9b:	84 c0                	test   %al,%al
c0108f9d:	74 65                	je     c0109004 <sys_receive_msg+0xef>
c0108f9f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fa2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fa9:	3c 01                	cmp    $0x1,%al
c0108fab:	74 57                	je     c0109004 <sys_receive_msg+0xef>
c0108fad:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fb0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fb7:	3c 02                	cmp    $0x2,%al
c0108fb9:	74 49                	je     c0109004 <sys_receive_msg+0xef>
c0108fbb:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fbe:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fc5:	3c 03                	cmp    $0x3,%al
c0108fc7:	74 3b                	je     c0109004 <sys_receive_msg+0xef>
c0108fc9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fcc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fd3:	3c 04                	cmp    $0x4,%al
c0108fd5:	74 2d                	je     c0109004 <sys_receive_msg+0xef>
c0108fd7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fda:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fe1:	0f be c0             	movsbl %al,%eax
c0108fe4:	83 ec 0c             	sub    $0xc,%esp
c0108fe7:	68 e2 05 00 00       	push   $0x5e2
c0108fec:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ff1:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ff6:	50                   	push   %eax
c0108ff7:	68 54 be 10 c0       	push   $0xc010be54
c0108ffc:	e8 76 f9 ff ff       	call   c0108977 <assertion_failure2>
c0109001:	83 c4 20             	add    $0x20,%esp
c0109004:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0109008:	74 73                	je     c010907d <sys_receive_msg+0x168>
c010900a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010900d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109014:	84 c0                	test   %al,%al
c0109016:	74 65                	je     c010907d <sys_receive_msg+0x168>
c0109018:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010901b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109022:	3c 01                	cmp    $0x1,%al
c0109024:	74 57                	je     c010907d <sys_receive_msg+0x168>
c0109026:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109029:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109030:	3c 02                	cmp    $0x2,%al
c0109032:	74 49                	je     c010907d <sys_receive_msg+0x168>
c0109034:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109037:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010903e:	3c 03                	cmp    $0x3,%al
c0109040:	74 3b                	je     c010907d <sys_receive_msg+0x168>
c0109042:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109045:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010904c:	3c 04                	cmp    $0x4,%al
c010904e:	74 2d                	je     c010907d <sys_receive_msg+0x168>
c0109050:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109053:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010905a:	0f be c0             	movsbl %al,%eax
c010905d:	83 ec 0c             	sub    $0xc,%esp
c0109060:	68 e6 05 00 00       	push   $0x5e6
c0109065:	68 61 ba 10 c0       	push   $0xc010ba61
c010906a:	68 61 ba 10 c0       	push   $0xc010ba61
c010906f:	50                   	push   %eax
c0109070:	68 f0 be 10 c0       	push   $0xc010bef0
c0109075:	e8 fd f8 ff ff       	call   c0108977 <assertion_failure2>
c010907a:	83 c4 20             	add    $0x20,%esp
c010907d:	83 ec 0c             	sub    $0xc,%esp
c0109080:	ff 75 10             	pushl  0x10(%ebp)
c0109083:	e8 34 a8 ff ff       	call   c01038bc <proc2pid>
c0109088:	83 c4 10             	add    $0x10,%esp
c010908b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010908e:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0109095:	8b 45 08             	mov    0x8(%ebp),%eax
c0109098:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010909b:	8b 45 10             	mov    0x10(%ebp),%eax
c010909e:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01090a4:	83 ec 08             	sub    $0x8,%esp
c01090a7:	50                   	push   %eax
c01090a8:	ff 75 d8             	pushl  -0x28(%ebp)
c01090ab:	e8 a2 ce ff ff       	call   c0105f52 <get_physical_address_proc>
c01090b0:	83 c4 10             	add    $0x10,%esp
c01090b3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01090b6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01090bd:	8b 45 10             	mov    0x10(%ebp),%eax
c01090c0:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c01090c6:	85 c0                	test   %eax,%eax
c01090c8:	0f 84 c5 00 00 00    	je     c0109193 <sys_receive_msg+0x27e>
c01090ce:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01090d2:	74 0d                	je     c01090e1 <sys_receive_msg+0x1cc>
c01090d4:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c01090db:	0f 85 b2 00 00 00    	jne    c0109193 <sys_receive_msg+0x27e>
c01090e1:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c01090e8:	83 ec 0c             	sub    $0xc,%esp
c01090eb:	ff 75 d0             	pushl  -0x30(%ebp)
c01090ee:	e8 49 85 ff ff       	call   c010163c <sys_malloc>
c01090f3:	83 c4 10             	add    $0x10,%esp
c01090f6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01090f9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01090fc:	83 ec 04             	sub    $0x4,%esp
c01090ff:	50                   	push   %eax
c0109100:	6a 00                	push   $0x0
c0109102:	ff 75 cc             	pushl  -0x34(%ebp)
c0109105:	e8 c5 30 00 00       	call   c010c1cf <Memset>
c010910a:	83 c4 10             	add    $0x10,%esp
c010910d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109110:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109116:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109119:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109120:	83 ec 08             	sub    $0x8,%esp
c0109123:	ff 75 d0             	pushl  -0x30(%ebp)
c0109126:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109129:	e8 51 cd ff ff       	call   c0105e7f <alloc_virtual_memory>
c010912e:	83 c4 10             	add    $0x10,%esp
c0109131:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0109134:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0109137:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010913a:	83 ec 04             	sub    $0x4,%esp
c010913d:	52                   	push   %edx
c010913e:	ff 75 cc             	pushl  -0x34(%ebp)
c0109141:	50                   	push   %eax
c0109142:	e8 a5 db ff ff       	call   c0106cec <Memcpy>
c0109147:	83 c4 10             	add    $0x10,%esp
c010914a:	8b 45 10             	mov    0x10(%ebp),%eax
c010914d:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109154:	00 00 00 
c0109157:	8b 45 10             	mov    0x10(%ebp),%eax
c010915a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109161:	00 00 00 
c0109164:	8b 45 10             	mov    0x10(%ebp),%eax
c0109167:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010916e:	00 00 00 
c0109171:	8b 45 10             	mov    0x10(%ebp),%eax
c0109174:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010917b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0109182:	83 ec 08             	sub    $0x8,%esp
c0109185:	ff 75 d0             	pushl  -0x30(%ebp)
c0109188:	ff 75 cc             	pushl  -0x34(%ebp)
c010918b:	e8 c1 84 ff ff       	call   c0101651 <sys_free>
c0109190:	83 c4 10             	add    $0x10,%esp
c0109193:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0109197:	0f 84 d4 03 00 00    	je     c0109571 <sys_receive_msg+0x65c>
c010919d:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01091a1:	75 26                	jne    c01091c9 <sys_receive_msg+0x2b4>
c01091a3:	8b 45 10             	mov    0x10(%ebp),%eax
c01091a6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01091ac:	85 c0                	test   %eax,%eax
c01091ae:	0f 84 8a 00 00 00    	je     c010923e <sys_receive_msg+0x329>
c01091b4:	8b 45 10             	mov    0x10(%ebp),%eax
c01091b7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01091bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01091c0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01091c7:	eb 75                	jmp    c010923e <sys_receive_msg+0x329>
c01091c9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01091cd:	78 6f                	js     c010923e <sys_receive_msg+0x329>
c01091cf:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c01091d3:	7f 69                	jg     c010923e <sys_receive_msg+0x329>
c01091d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091d8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091df:	3c 01                	cmp    $0x1,%al
c01091e1:	75 5b                	jne    c010923e <sys_receive_msg+0x329>
c01091e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091e6:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01091ec:	83 f8 12             	cmp    $0x12,%eax
c01091ef:	74 0e                	je     c01091ff <sys_receive_msg+0x2ea>
c01091f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01091f4:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01091fa:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c01091fd:	75 3f                	jne    c010923e <sys_receive_msg+0x329>
c01091ff:	8b 45 10             	mov    0x10(%ebp),%eax
c0109202:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109208:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010920b:	eb 2b                	jmp    c0109238 <sys_receive_msg+0x323>
c010920d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109210:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109213:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109216:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010921c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010921f:	39 c2                	cmp    %eax,%edx
c0109221:	75 09                	jne    c010922c <sys_receive_msg+0x317>
c0109223:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010922a:	eb 12                	jmp    c010923e <sys_receive_msg+0x329>
c010922c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010922f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0109235:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109238:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010923c:	75 cf                	jne    c010920d <sys_receive_msg+0x2f8>
c010923e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0109242:	0f 85 4e 02 00 00    	jne    c0109496 <sys_receive_msg+0x581>
c0109248:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010924b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010924e:	83 ec 08             	sub    $0x8,%esp
c0109251:	ff 75 dc             	pushl  -0x24(%ebp)
c0109254:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109257:	e8 23 cc ff ff       	call   c0105e7f <alloc_virtual_memory>
c010925c:	83 c4 10             	add    $0x10,%esp
c010925f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0109262:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109265:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010926b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010926e:	83 ec 0c             	sub    $0xc,%esp
c0109271:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109274:	e8 43 a6 ff ff       	call   c01038bc <proc2pid>
c0109279:	83 c4 10             	add    $0x10,%esp
c010927c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010927f:	83 ec 08             	sub    $0x8,%esp
c0109282:	ff 75 b8             	pushl  -0x48(%ebp)
c0109285:	ff 75 bc             	pushl  -0x44(%ebp)
c0109288:	e8 c5 cc ff ff       	call   c0105f52 <get_physical_address_proc>
c010928d:	83 c4 10             	add    $0x10,%esp
c0109290:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0109293:	83 ec 08             	sub    $0x8,%esp
c0109296:	ff 75 dc             	pushl  -0x24(%ebp)
c0109299:	ff 75 b4             	pushl  -0x4c(%ebp)
c010929c:	e8 de cb ff ff       	call   c0105e7f <alloc_virtual_memory>
c01092a1:	83 c4 10             	add    $0x10,%esp
c01092a4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01092a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01092aa:	83 ec 04             	sub    $0x4,%esp
c01092ad:	50                   	push   %eax
c01092ae:	ff 75 b0             	pushl  -0x50(%ebp)
c01092b1:	ff 75 c0             	pushl  -0x40(%ebp)
c01092b4:	e8 33 da ff ff       	call   c0106cec <Memcpy>
c01092b9:	83 c4 10             	add    $0x10,%esp
c01092bc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01092bf:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01092c2:	8b 45 10             	mov    0x10(%ebp),%eax
c01092c5:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01092cb:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01092ce:	75 21                	jne    c01092f1 <sys_receive_msg+0x3dc>
c01092d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092d3:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c01092d9:	8b 45 10             	mov    0x10(%ebp),%eax
c01092dc:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c01092e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092e5:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01092ec:	00 00 00 
c01092ef:	eb 1f                	jmp    c0109310 <sys_receive_msg+0x3fb>
c01092f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092f4:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c01092fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01092fd:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109303:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109306:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010930d:	00 00 00 
c0109310:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109313:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010931a:	00 00 00 
c010931d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109320:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109327:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010932a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109331:	00 00 00 
c0109334:	8b 45 10             	mov    0x10(%ebp),%eax
c0109337:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010933e:	00 00 00 
c0109341:	8b 45 10             	mov    0x10(%ebp),%eax
c0109344:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010934b:	00 00 00 
c010934e:	8b 45 10             	mov    0x10(%ebp),%eax
c0109351:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109358:	00 00 00 
c010935b:	83 ec 0c             	sub    $0xc,%esp
c010935e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109361:	e8 46 03 00 00       	call   c01096ac <unblock>
c0109366:	83 c4 10             	add    $0x10,%esp
c0109369:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010936c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109372:	85 c0                	test   %eax,%eax
c0109374:	74 1c                	je     c0109392 <sys_receive_msg+0x47d>
c0109376:	68 56 06 00 00       	push   $0x656
c010937b:	68 61 ba 10 c0       	push   $0xc010ba61
c0109380:	68 61 ba 10 c0       	push   $0xc010ba61
c0109385:	68 5f c0 10 c0       	push   $0xc010c05f
c010938a:	e8 76 f5 ff ff       	call   c0108905 <assertion_failure>
c010938f:	83 c4 10             	add    $0x10,%esp
c0109392:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109395:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010939c:	84 c0                	test   %al,%al
c010939e:	74 1c                	je     c01093bc <sys_receive_msg+0x4a7>
c01093a0:	68 57 06 00 00       	push   $0x657
c01093a5:	68 61 ba 10 c0       	push   $0xc010ba61
c01093aa:	68 61 ba 10 c0       	push   $0xc010ba61
c01093af:	68 77 c0 10 c0       	push   $0xc010c077
c01093b4:	e8 4c f5 ff ff       	call   c0108905 <assertion_failure>
c01093b9:	83 c4 10             	add    $0x10,%esp
c01093bc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01093bf:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01093c5:	83 f8 21             	cmp    $0x21,%eax
c01093c8:	74 1c                	je     c01093e6 <sys_receive_msg+0x4d1>
c01093ca:	68 58 06 00 00       	push   $0x658
c01093cf:	68 61 ba 10 c0       	push   $0xc010ba61
c01093d4:	68 61 ba 10 c0       	push   $0xc010ba61
c01093d9:	68 90 c0 10 c0       	push   $0xc010c090
c01093de:	e8 22 f5 ff ff       	call   c0108905 <assertion_failure>
c01093e3:	83 c4 10             	add    $0x10,%esp
c01093e6:	8b 45 10             	mov    0x10(%ebp),%eax
c01093e9:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01093ef:	85 c0                	test   %eax,%eax
c01093f1:	74 1c                	je     c010940f <sys_receive_msg+0x4fa>
c01093f3:	68 5a 06 00 00       	push   $0x65a
c01093f8:	68 61 ba 10 c0       	push   $0xc010ba61
c01093fd:	68 61 ba 10 c0       	push   $0xc010ba61
c0109402:	68 bc bf 10 c0       	push   $0xc010bfbc
c0109407:	e8 f9 f4 ff ff       	call   c0108905 <assertion_failure>
c010940c:	83 c4 10             	add    $0x10,%esp
c010940f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109412:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109419:	84 c0                	test   %al,%al
c010941b:	74 1c                	je     c0109439 <sys_receive_msg+0x524>
c010941d:	68 5b 06 00 00       	push   $0x65b
c0109422:	68 61 ba 10 c0       	push   $0xc010ba61
c0109427:	68 61 ba 10 c0       	push   $0xc010ba61
c010942c:	68 d1 bf 10 c0       	push   $0xc010bfd1
c0109431:	e8 cf f4 ff ff       	call   c0108905 <assertion_failure>
c0109436:	83 c4 10             	add    $0x10,%esp
c0109439:	8b 45 10             	mov    0x10(%ebp),%eax
c010943c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109442:	83 f8 21             	cmp    $0x21,%eax
c0109445:	74 1c                	je     c0109463 <sys_receive_msg+0x54e>
c0109447:	68 5c 06 00 00       	push   $0x65c
c010944c:	68 61 ba 10 c0       	push   $0xc010ba61
c0109451:	68 61 ba 10 c0       	push   $0xc010ba61
c0109456:	68 e8 bf 10 c0       	push   $0xc010bfe8
c010945b:	e8 a5 f4 ff ff       	call   c0108905 <assertion_failure>
c0109460:	83 c4 10             	add    $0x10,%esp
c0109463:	8b 45 10             	mov    0x10(%ebp),%eax
c0109466:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010946c:	83 f8 21             	cmp    $0x21,%eax
c010946f:	0f 84 f5 00 00 00    	je     c010956a <sys_receive_msg+0x655>
c0109475:	68 5d 06 00 00       	push   $0x65d
c010947a:	68 61 ba 10 c0       	push   $0xc010ba61
c010947f:	68 61 ba 10 c0       	push   $0xc010ba61
c0109484:	68 b4 c0 10 c0       	push   $0xc010c0b4
c0109489:	e8 77 f4 ff ff       	call   c0108905 <assertion_failure>
c010948e:	83 c4 10             	add    $0x10,%esp
c0109491:	e9 d4 00 00 00       	jmp    c010956a <sys_receive_msg+0x655>
c0109496:	8b 45 10             	mov    0x10(%ebp),%eax
c0109499:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c01094a0:	8b 45 10             	mov    0x10(%ebp),%eax
c01094a3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094aa:	3c 02                	cmp    $0x2,%al
c01094ac:	74 1c                	je     c01094ca <sys_receive_msg+0x5b5>
c01094ae:	68 62 06 00 00       	push   $0x662
c01094b3:	68 61 ba 10 c0       	push   $0xc010ba61
c01094b8:	68 61 ba 10 c0       	push   $0xc010ba61
c01094bd:	68 d3 c0 10 c0       	push   $0xc010c0d3
c01094c2:	e8 3e f4 ff ff       	call   c0108905 <assertion_failure>
c01094c7:	83 c4 10             	add    $0x10,%esp
c01094ca:	8b 45 10             	mov    0x10(%ebp),%eax
c01094cd:	8b 55 08             	mov    0x8(%ebp),%edx
c01094d0:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c01094d6:	8b 45 10             	mov    0x10(%ebp),%eax
c01094d9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094e0:	3c 02                	cmp    $0x2,%al
c01094e2:	74 1c                	je     c0109500 <sys_receive_msg+0x5eb>
c01094e4:	68 64 06 00 00       	push   $0x664
c01094e9:	68 61 ba 10 c0       	push   $0xc010ba61
c01094ee:	68 61 ba 10 c0       	push   $0xc010ba61
c01094f3:	68 d3 c0 10 c0       	push   $0xc010c0d3
c01094f8:	e8 08 f4 ff ff       	call   c0108905 <assertion_failure>
c01094fd:	83 c4 10             	add    $0x10,%esp
c0109500:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109504:	75 0f                	jne    c0109515 <sys_receive_msg+0x600>
c0109506:	8b 45 10             	mov    0x10(%ebp),%eax
c0109509:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c0109510:	00 00 00 
c0109513:	eb 0c                	jmp    c0109521 <sys_receive_msg+0x60c>
c0109515:	8b 45 10             	mov    0x10(%ebp),%eax
c0109518:	8b 55 0c             	mov    0xc(%ebp),%edx
c010951b:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0109521:	8b 45 10             	mov    0x10(%ebp),%eax
c0109524:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010952b:	3c 02                	cmp    $0x2,%al
c010952d:	74 2d                	je     c010955c <sys_receive_msg+0x647>
c010952f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109532:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109539:	0f be c0             	movsbl %al,%eax
c010953c:	83 ec 0c             	sub    $0xc,%esp
c010953f:	68 6f 06 00 00       	push   $0x66f
c0109544:	68 61 ba 10 c0       	push   $0xc010ba61
c0109549:	68 61 ba 10 c0       	push   $0xc010ba61
c010954e:	50                   	push   %eax
c010954f:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109554:	e8 1e f4 ff ff       	call   c0108977 <assertion_failure2>
c0109559:	83 c4 20             	add    $0x20,%esp
c010955c:	83 ec 0c             	sub    $0xc,%esp
c010955f:	ff 75 10             	pushl  0x10(%ebp)
c0109562:	e8 09 01 00 00       	call   c0109670 <block>
c0109567:	83 c4 10             	add    $0x10,%esp
c010956a:	b8 00 00 00 00       	mov    $0x0,%eax
c010956f:	eb 02                	jmp    c0109573 <sys_receive_msg+0x65e>
c0109571:	90                   	nop
c0109572:	90                   	nop
c0109573:	c9                   	leave  
c0109574:	c3                   	ret    

c0109575 <send_rec>:
c0109575:	55                   	push   %ebp
c0109576:	89 e5                	mov    %esp,%ebp
c0109578:	83 ec 18             	sub    $0x18,%esp
c010957b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010957e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109581:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109588:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c010958c:	74 28                	je     c01095b6 <send_rec+0x41>
c010958e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109592:	74 22                	je     c01095b6 <send_rec+0x41>
c0109594:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109598:	74 1c                	je     c01095b6 <send_rec+0x41>
c010959a:	68 81 06 00 00       	push   $0x681
c010959f:	68 61 ba 10 c0       	push   $0xc010ba61
c01095a4:	68 61 ba 10 c0       	push   $0xc010ba61
c01095a9:	68 f4 c0 10 c0       	push   $0xc010c0f4
c01095ae:	e8 52 f3 ff ff       	call   c0108905 <assertion_failure>
c01095b3:	83 c4 10             	add    $0x10,%esp
c01095b6:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01095ba:	75 14                	jne    c01095d0 <send_rec+0x5b>
c01095bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01095bf:	83 ec 04             	sub    $0x4,%esp
c01095c2:	50                   	push   %eax
c01095c3:	6a 00                	push   $0x0
c01095c5:	ff 75 0c             	pushl  0xc(%ebp)
c01095c8:	e8 02 2c 00 00       	call   c010c1cf <Memset>
c01095cd:	83 c4 10             	add    $0x10,%esp
c01095d0:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01095d4:	74 23                	je     c01095f9 <send_rec+0x84>
c01095d6:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01095da:	74 34                	je     c0109610 <send_rec+0x9b>
c01095dc:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01095e0:	75 74                	jne    c0109656 <send_rec+0xe1>
c01095e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095e5:	83 ec 08             	sub    $0x8,%esp
c01095e8:	ff 75 10             	pushl  0x10(%ebp)
c01095eb:	50                   	push   %eax
c01095ec:	e8 1f 80 ff ff       	call   c0101610 <send_msg>
c01095f1:	83 c4 10             	add    $0x10,%esp
c01095f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01095f7:	eb 70                	jmp    c0109669 <send_rec+0xf4>
c01095f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095fc:	83 ec 08             	sub    $0x8,%esp
c01095ff:	ff 75 10             	pushl  0x10(%ebp)
c0109602:	50                   	push   %eax
c0109603:	e8 1e 80 ff ff       	call   c0101626 <receive_msg>
c0109608:	83 c4 10             	add    $0x10,%esp
c010960b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010960e:	eb 59                	jmp    c0109669 <send_rec+0xf4>
c0109610:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109613:	83 ec 08             	sub    $0x8,%esp
c0109616:	ff 75 10             	pushl  0x10(%ebp)
c0109619:	50                   	push   %eax
c010961a:	e8 f1 7f ff ff       	call   c0101610 <send_msg>
c010961f:	83 c4 10             	add    $0x10,%esp
c0109622:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109625:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0109629:	75 3d                	jne    c0109668 <send_rec+0xf3>
c010962b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010962e:	83 ec 04             	sub    $0x4,%esp
c0109631:	50                   	push   %eax
c0109632:	6a 00                	push   $0x0
c0109634:	ff 75 0c             	pushl  0xc(%ebp)
c0109637:	e8 93 2b 00 00       	call   c010c1cf <Memset>
c010963c:	83 c4 10             	add    $0x10,%esp
c010963f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109642:	83 ec 08             	sub    $0x8,%esp
c0109645:	ff 75 10             	pushl  0x10(%ebp)
c0109648:	50                   	push   %eax
c0109649:	e8 d8 7f ff ff       	call   c0101626 <receive_msg>
c010964e:	83 c4 10             	add    $0x10,%esp
c0109651:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109654:	eb 12                	jmp    c0109668 <send_rec+0xf3>
c0109656:	83 ec 0c             	sub    $0xc,%esp
c0109659:	68 30 c1 10 c0       	push   $0xc010c130
c010965e:	e8 84 f2 ff ff       	call   c01088e7 <panic>
c0109663:	83 c4 10             	add    $0x10,%esp
c0109666:	eb 01                	jmp    c0109669 <send_rec+0xf4>
c0109668:	90                   	nop
c0109669:	b8 00 00 00 00       	mov    $0x0,%eax
c010966e:	c9                   	leave  
c010966f:	c3                   	ret    

c0109670 <block>:
c0109670:	55                   	push   %ebp
c0109671:	89 e5                	mov    %esp,%ebp
c0109673:	83 ec 08             	sub    $0x8,%esp
c0109676:	8b 45 08             	mov    0x8(%ebp),%eax
c0109679:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109680:	84 c0                	test   %al,%al
c0109682:	75 1c                	jne    c01096a0 <block+0x30>
c0109684:	68 b0 06 00 00       	push   $0x6b0
c0109689:	68 61 ba 10 c0       	push   $0xc010ba61
c010968e:	68 61 ba 10 c0       	push   $0xc010ba61
c0109693:	68 45 c1 10 c0       	push   $0xc010c145
c0109698:	e8 68 f2 ff ff       	call   c0108905 <assertion_failure>
c010969d:	83 c4 10             	add    $0x10,%esp
c01096a0:	e8 13 a0 ff ff       	call   c01036b8 <schedule_process>
c01096a5:	b8 00 00 00 00       	mov    $0x0,%eax
c01096aa:	c9                   	leave  
c01096ab:	c3                   	ret    

c01096ac <unblock>:
c01096ac:	55                   	push   %ebp
c01096ad:	89 e5                	mov    %esp,%ebp
c01096af:	83 ec 08             	sub    $0x8,%esp
c01096b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01096b5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096bc:	84 c0                	test   %al,%al
c01096be:	74 1c                	je     c01096dc <unblock+0x30>
c01096c0:	68 b9 06 00 00       	push   $0x6b9
c01096c5:	68 61 ba 10 c0       	push   $0xc010ba61
c01096ca:	68 61 ba 10 c0       	push   $0xc010ba61
c01096cf:	68 5d c1 10 c0       	push   $0xc010c15d
c01096d4:	e8 2c f2 ff ff       	call   c0108905 <assertion_failure>
c01096d9:	83 c4 10             	add    $0x10,%esp
c01096dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01096df:	05 60 02 00 00       	add    $0x260,%eax
c01096e4:	83 ec 08             	sub    $0x8,%esp
c01096e7:	50                   	push   %eax
c01096e8:	68 ec fd 10 c0       	push   $0xc010fdec
c01096ed:	e8 ce 0a 00 00       	call   c010a1c0 <appendToDoubleLinkList>
c01096f2:	83 c4 10             	add    $0x10,%esp
c01096f5:	b8 00 00 00 00       	mov    $0x0,%eax
c01096fa:	c9                   	leave  
c01096fb:	c3                   	ret    

c01096fc <get_ticks_ipc>:
c01096fc:	55                   	push   %ebp
c01096fd:	89 e5                	mov    %esp,%ebp
c01096ff:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109705:	83 ec 04             	sub    $0x4,%esp
c0109708:	6a 7c                	push   $0x7c
c010970a:	6a 00                	push   $0x0
c010970c:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109712:	50                   	push   %eax
c0109713:	e8 b7 2a 00 00       	call   c010c1cf <Memset>
c0109718:	83 c4 10             	add    $0x10,%esp
c010971b:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109722:	00 00 00 
c0109725:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010972c:	83 ec 04             	sub    $0x4,%esp
c010972f:	6a 01                	push   $0x1
c0109731:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109737:	50                   	push   %eax
c0109738:	6a 03                	push   $0x3
c010973a:	e8 36 fe ff ff       	call   c0109575 <send_rec>
c010973f:	83 c4 10             	add    $0x10,%esp
c0109742:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109745:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010974b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010974e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109751:	c9                   	leave  
c0109752:	c3                   	ret    

c0109753 <itoa>:
c0109753:	55                   	push   %ebp
c0109754:	89 e5                	mov    %esp,%ebp
c0109756:	53                   	push   %ebx
c0109757:	83 ec 14             	sub    $0x14,%esp
c010975a:	8b 45 08             	mov    0x8(%ebp),%eax
c010975d:	99                   	cltd   
c010975e:	f7 7d 10             	idivl  0x10(%ebp)
c0109761:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109764:	8b 45 08             	mov    0x8(%ebp),%eax
c0109767:	99                   	cltd   
c0109768:	f7 7d 10             	idivl  0x10(%ebp)
c010976b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010976e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109772:	74 14                	je     c0109788 <itoa+0x35>
c0109774:	83 ec 04             	sub    $0x4,%esp
c0109777:	ff 75 10             	pushl  0x10(%ebp)
c010977a:	ff 75 0c             	pushl  0xc(%ebp)
c010977d:	ff 75 f0             	pushl  -0x10(%ebp)
c0109780:	e8 ce ff ff ff       	call   c0109753 <itoa>
c0109785:	83 c4 10             	add    $0x10,%esp
c0109788:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010978b:	8d 58 30             	lea    0x30(%eax),%ebx
c010978e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109791:	8b 00                	mov    (%eax),%eax
c0109793:	8d 48 01             	lea    0x1(%eax),%ecx
c0109796:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109799:	89 0a                	mov    %ecx,(%edx)
c010979b:	89 da                	mov    %ebx,%edx
c010979d:	88 10                	mov    %dl,(%eax)
c010979f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097a2:	8b 00                	mov    (%eax),%eax
c01097a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01097a7:	c9                   	leave  
c01097a8:	c3                   	ret    

c01097a9 <i2a>:
c01097a9:	55                   	push   %ebp
c01097aa:	89 e5                	mov    %esp,%ebp
c01097ac:	53                   	push   %ebx
c01097ad:	83 ec 14             	sub    $0x14,%esp
c01097b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01097b3:	99                   	cltd   
c01097b4:	f7 7d 0c             	idivl  0xc(%ebp)
c01097b7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01097ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01097bd:	99                   	cltd   
c01097be:	f7 7d 0c             	idivl  0xc(%ebp)
c01097c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01097c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01097c8:	74 14                	je     c01097de <i2a+0x35>
c01097ca:	83 ec 04             	sub    $0x4,%esp
c01097cd:	ff 75 10             	pushl  0x10(%ebp)
c01097d0:	ff 75 0c             	pushl  0xc(%ebp)
c01097d3:	ff 75 f0             	pushl  -0x10(%ebp)
c01097d6:	e8 ce ff ff ff       	call   c01097a9 <i2a>
c01097db:	83 c4 10             	add    $0x10,%esp
c01097de:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01097e2:	7f 0a                	jg     c01097ee <i2a+0x45>
c01097e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097e7:	83 c0 30             	add    $0x30,%eax
c01097ea:	89 c3                	mov    %eax,%ebx
c01097ec:	eb 08                	jmp    c01097f6 <i2a+0x4d>
c01097ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097f1:	83 c0 37             	add    $0x37,%eax
c01097f4:	89 c3                	mov    %eax,%ebx
c01097f6:	8b 45 10             	mov    0x10(%ebp),%eax
c01097f9:	8b 00                	mov    (%eax),%eax
c01097fb:	8d 48 01             	lea    0x1(%eax),%ecx
c01097fe:	8b 55 10             	mov    0x10(%ebp),%edx
c0109801:	89 0a                	mov    %ecx,(%edx)
c0109803:	88 18                	mov    %bl,(%eax)
c0109805:	8b 45 10             	mov    0x10(%ebp),%eax
c0109808:	8b 00                	mov    (%eax),%eax
c010980a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010980d:	c9                   	leave  
c010980e:	c3                   	ret    

c010980f <inform_int>:
c010980f:	55                   	push   %ebp
c0109810:	89 e5                	mov    %esp,%ebp
c0109812:	83 ec 18             	sub    $0x18,%esp
c0109815:	83 ec 0c             	sub    $0xc,%esp
c0109818:	ff 75 08             	pushl  0x8(%ebp)
c010981b:	e8 16 a0 ff ff       	call   c0103836 <pid2proc>
c0109820:	83 c4 10             	add    $0x10,%esp
c0109823:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109826:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109829:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109830:	0f be c0             	movsbl %al,%eax
c0109833:	83 e0 02             	and    $0x2,%eax
c0109836:	85 c0                	test   %eax,%eax
c0109838:	0f 84 8e 00 00 00    	je     c01098cc <inform_int+0xbd>
c010983e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109841:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109847:	3d 13 02 00 00       	cmp    $0x213,%eax
c010984c:	74 0e                	je     c010985c <inform_int+0x4d>
c010984e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109851:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109857:	83 f8 12             	cmp    $0x12,%eax
c010985a:	75 7d                	jne    c01098d9 <inform_int+0xca>
c010985c:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109863:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109866:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010986c:	83 ec 08             	sub    $0x8,%esp
c010986f:	ff 75 f0             	pushl  -0x10(%ebp)
c0109872:	50                   	push   %eax
c0109873:	e8 07 c6 ff ff       	call   c0105e7f <alloc_virtual_memory>
c0109878:	83 c4 10             	add    $0x10,%esp
c010987b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010987e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109881:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109887:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010988a:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109891:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109894:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c010989b:	00 00 00 
c010989e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098a1:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01098a8:	00 00 00 
c01098ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01098b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098b5:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01098bc:	83 ec 0c             	sub    $0xc,%esp
c01098bf:	ff 75 f4             	pushl  -0xc(%ebp)
c01098c2:	e8 e5 fd ff ff       	call   c01096ac <unblock>
c01098c7:	83 c4 10             	add    $0x10,%esp
c01098ca:	eb 0d                	jmp    c01098d9 <inform_int+0xca>
c01098cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098cf:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c01098d6:	00 00 00 
c01098d9:	90                   	nop
c01098da:	c9                   	leave  
c01098db:	c3                   	ret    

c01098dc <strcmp>:
c01098dc:	55                   	push   %ebp
c01098dd:	89 e5                	mov    %esp,%ebp
c01098df:	83 ec 10             	sub    $0x10,%esp
c01098e2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01098e6:	74 06                	je     c01098ee <strcmp+0x12>
c01098e8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01098ec:	75 08                	jne    c01098f6 <strcmp+0x1a>
c01098ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01098f1:	2b 45 0c             	sub    0xc(%ebp),%eax
c01098f4:	eb 53                	jmp    c0109949 <strcmp+0x6d>
c01098f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01098f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01098fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01098ff:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109902:	eb 18                	jmp    c010991c <strcmp+0x40>
c0109904:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109907:	0f b6 10             	movzbl (%eax),%edx
c010990a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010990d:	0f b6 00             	movzbl (%eax),%eax
c0109910:	38 c2                	cmp    %al,%dl
c0109912:	75 1e                	jne    c0109932 <strcmp+0x56>
c0109914:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0109918:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010991c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010991f:	0f b6 00             	movzbl (%eax),%eax
c0109922:	84 c0                	test   %al,%al
c0109924:	74 0d                	je     c0109933 <strcmp+0x57>
c0109926:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109929:	0f b6 00             	movzbl (%eax),%eax
c010992c:	84 c0                	test   %al,%al
c010992e:	75 d4                	jne    c0109904 <strcmp+0x28>
c0109930:	eb 01                	jmp    c0109933 <strcmp+0x57>
c0109932:	90                   	nop
c0109933:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109936:	0f b6 00             	movzbl (%eax),%eax
c0109939:	0f be d0             	movsbl %al,%edx
c010993c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010993f:	0f b6 00             	movzbl (%eax),%eax
c0109942:	0f be c0             	movsbl %al,%eax
c0109945:	29 c2                	sub    %eax,%edx
c0109947:	89 d0                	mov    %edx,%eax
c0109949:	c9                   	leave  
c010994a:	c3                   	ret    

c010994b <create_user_process_address_space>:
c010994b:	55                   	push   %ebp
c010994c:	89 e5                	mov    %esp,%ebp
c010994e:	83 ec 18             	sub    $0x18,%esp
c0109951:	83 ec 08             	sub    $0x8,%esp
c0109954:	6a 00                	push   $0x0
c0109956:	6a 01                	push   $0x1
c0109958:	e8 5a c8 ff ff       	call   c01061b7 <alloc_memory>
c010995d:	83 c4 10             	add    $0x10,%esp
c0109960:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109963:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109966:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c010996d:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109974:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109977:	05 ff 0f 00 00       	add    $0xfff,%eax
c010997c:	c1 e8 0c             	shr    $0xc,%eax
c010997f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109982:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109985:	83 c0 07             	add    $0x7,%eax
c0109988:	c1 e8 03             	shr    $0x3,%eax
c010998b:	89 c2                	mov    %eax,%edx
c010998d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109990:	89 50 04             	mov    %edx,0x4(%eax)
c0109993:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109996:	8b 40 04             	mov    0x4(%eax),%eax
c0109999:	05 ff 0f 00 00       	add    $0xfff,%eax
c010999e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01099a4:	85 c0                	test   %eax,%eax
c01099a6:	0f 48 c2             	cmovs  %edx,%eax
c01099a9:	c1 f8 0c             	sar    $0xc,%eax
c01099ac:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01099af:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01099b2:	83 ec 08             	sub    $0x8,%esp
c01099b5:	6a 00                	push   $0x0
c01099b7:	50                   	push   %eax
c01099b8:	e8 fa c7 ff ff       	call   c01061b7 <alloc_memory>
c01099bd:	83 c4 10             	add    $0x10,%esp
c01099c0:	89 c2                	mov    %eax,%edx
c01099c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099c5:	89 10                	mov    %edx,(%eax)
c01099c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099ca:	83 ec 0c             	sub    $0xc,%esp
c01099cd:	50                   	push   %eax
c01099ce:	e8 b6 bf ff ff       	call   c0105989 <init_bitmap>
c01099d3:	83 c4 10             	add    $0x10,%esp
c01099d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099d9:	c9                   	leave  
c01099da:	c3                   	ret    

c01099db <user_process>:
c01099db:	55                   	push   %ebp
c01099dc:	89 e5                	mov    %esp,%ebp
c01099de:	83 ec 38             	sub    $0x38,%esp
c01099e1:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c01099e8:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c01099ef:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c01099f6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01099fa:	75 0e                	jne    c0109a0a <user_process+0x2f>
c01099fc:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109a02:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109a08:	eb 0c                	jmp    c0109a16 <user_process+0x3b>
c0109a0a:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109a10:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109a16:	e8 d3 69 ff ff       	call   c01003ee <get_running_thread_pcb>
c0109a1b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109a1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a21:	8b 55 14             	mov    0x14(%ebp),%edx
c0109a24:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c0109a2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a2d:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109a33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a36:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c0109a3c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a3f:	05 00 10 00 00       	add    $0x1000,%eax
c0109a44:	89 c2                	mov    %eax,%edx
c0109a46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a49:	89 10                	mov    %edx,(%eax)
c0109a4b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a4e:	8b 00                	mov    (%eax),%eax
c0109a50:	83 e8 44             	sub    $0x44,%eax
c0109a53:	89 c2                	mov    %eax,%edx
c0109a55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a58:	89 10                	mov    %edx,(%eax)
c0109a5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a5d:	8b 00                	mov    (%eax),%eax
c0109a5f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109a62:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109a66:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109a6c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109a70:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109a74:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109a78:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109a7c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109a80:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109a84:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109a8a:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109a8e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a91:	89 50 34             	mov    %edx,0x34(%eax)
c0109a94:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109a98:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a9b:	89 50 0c             	mov    %edx,0xc(%eax)
c0109a9e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109aa2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109aa5:	89 50 04             	mov    %edx,0x4(%eax)
c0109aa8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109aac:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109aaf:	89 50 08             	mov    %edx,0x8(%eax)
c0109ab2:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109ab6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ab9:	89 50 40             	mov    %edx,0x40(%eax)
c0109abc:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109ac0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ac3:	89 10                	mov    %edx,(%eax)
c0109ac5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ac8:	8b 55 08             	mov    0x8(%ebp),%edx
c0109acb:	89 50 30             	mov    %edx,0x30(%eax)
c0109ace:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109ad2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109ad5:	89 50 38             	mov    %edx,0x38(%eax)
c0109ad8:	83 ec 08             	sub    $0x8,%esp
c0109adb:	6a 01                	push   $0x1
c0109add:	68 00 f0 ff bf       	push   $0xbffff000
c0109ae2:	e8 08 c6 ff ff       	call   c01060ef <alloc_physical_memory>
c0109ae7:	83 c4 10             	add    $0x10,%esp
c0109aea:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109af0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109af3:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109af6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109af9:	83 ec 0c             	sub    $0xc,%esp
c0109afc:	50                   	push   %eax
c0109afd:	e8 bf 67 ff ff       	call   c01002c1 <restart>
c0109b02:	83 c4 10             	add    $0x10,%esp
c0109b05:	90                   	nop
c0109b06:	c9                   	leave  
c0109b07:	c3                   	ret    

c0109b08 <clone_pcb>:
c0109b08:	55                   	push   %ebp
c0109b09:	89 e5                	mov    %esp,%ebp
c0109b0b:	83 ec 38             	sub    $0x38,%esp
c0109b0e:	83 ec 08             	sub    $0x8,%esp
c0109b11:	6a 00                	push   $0x0
c0109b13:	6a 01                	push   $0x1
c0109b15:	e8 9d c6 ff ff       	call   c01061b7 <alloc_memory>
c0109b1a:	83 c4 10             	add    $0x10,%esp
c0109b1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109b20:	83 ec 04             	sub    $0x4,%esp
c0109b23:	68 00 10 00 00       	push   $0x1000
c0109b28:	6a 00                	push   $0x0
c0109b2a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b2d:	e8 9d 26 00 00       	call   c010c1cf <Memset>
c0109b32:	83 c4 10             	add    $0x10,%esp
c0109b35:	83 ec 04             	sub    $0x4,%esp
c0109b38:	68 00 10 00 00       	push   $0x1000
c0109b3d:	ff 75 08             	pushl  0x8(%ebp)
c0109b40:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b43:	e8 a4 d1 ff ff       	call   c0106cec <Memcpy>
c0109b48:	83 c4 10             	add    $0x10,%esp
c0109b4b:	a1 c8 06 11 c0       	mov    0xc01106c8,%eax
c0109b50:	8d 50 01             	lea    0x1(%eax),%edx
c0109b53:	89 15 c8 06 11 c0    	mov    %edx,0xc01106c8
c0109b59:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109b5c:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109b62:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b65:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109b6b:	89 c2                	mov    %eax,%edx
c0109b6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b70:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109b76:	83 ec 08             	sub    $0x8,%esp
c0109b79:	6a 00                	push   $0x0
c0109b7b:	6a 01                	push   $0x1
c0109b7d:	e8 35 c6 ff ff       	call   c01061b7 <alloc_memory>
c0109b82:	83 c4 10             	add    $0x10,%esp
c0109b85:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109b88:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b8b:	05 00 0c 00 00       	add    $0xc00,%eax
c0109b90:	83 ec 04             	sub    $0x4,%esp
c0109b93:	68 00 04 00 00       	push   $0x400
c0109b98:	68 00 fc ff ff       	push   $0xfffffc00
c0109b9d:	50                   	push   %eax
c0109b9e:	e8 49 d1 ff ff       	call   c0106cec <Memcpy>
c0109ba3:	83 c4 10             	add    $0x10,%esp
c0109ba6:	83 ec 0c             	sub    $0xc,%esp
c0109ba9:	ff 75 f0             	pushl  -0x10(%ebp)
c0109bac:	e8 1d c4 ff ff       	call   c0105fce <get_physical_address>
c0109bb1:	83 c4 10             	add    $0x10,%esp
c0109bb4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109bb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bba:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109bbf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109bc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109bc5:	83 c8 07             	or     $0x7,%eax
c0109bc8:	89 c2                	mov    %eax,%edx
c0109bca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109bcd:	89 10                	mov    %edx,(%eax)
c0109bcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bd2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109bd5:	89 50 08             	mov    %edx,0x8(%eax)
c0109bd8:	e8 6e fd ff ff       	call   c010994b <create_user_process_address_space>
c0109bdd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109be0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109be3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109be6:	89 50 0c             	mov    %edx,0xc(%eax)
c0109be9:	8b 45 08             	mov    0x8(%ebp),%eax
c0109bec:	8b 40 0c             	mov    0xc(%eax),%eax
c0109bef:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109bf2:	83 ec 04             	sub    $0x4,%esp
c0109bf5:	6a 0c                	push   $0xc
c0109bf7:	ff 75 e0             	pushl  -0x20(%ebp)
c0109bfa:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109bfd:	e8 ea d0 ff ff       	call   c0106cec <Memcpy>
c0109c02:	83 c4 10             	add    $0x10,%esp
c0109c05:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109c0c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109c0f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109c14:	c1 e8 0c             	shr    $0xc,%eax
c0109c17:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109c1a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109c1d:	83 c0 07             	add    $0x7,%eax
c0109c20:	c1 e8 03             	shr    $0x3,%eax
c0109c23:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109c26:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109c29:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109c2c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109c2f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109c34:	c1 e8 0c             	shr    $0xc,%eax
c0109c37:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109c3a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109c3d:	83 ec 08             	sub    $0x8,%esp
c0109c40:	6a 00                	push   $0x0
c0109c42:	50                   	push   %eax
c0109c43:	e8 6f c5 ff ff       	call   c01061b7 <alloc_memory>
c0109c48:	83 c4 10             	add    $0x10,%esp
c0109c4b:	89 c2                	mov    %eax,%edx
c0109c4d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c50:	89 10                	mov    %edx,(%eax)
c0109c52:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109c55:	c1 e0 0c             	shl    $0xc,%eax
c0109c58:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109c5b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c5e:	8b 10                	mov    (%eax),%edx
c0109c60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c63:	8b 00                	mov    (%eax),%eax
c0109c65:	83 ec 04             	sub    $0x4,%esp
c0109c68:	ff 75 cc             	pushl  -0x34(%ebp)
c0109c6b:	52                   	push   %edx
c0109c6c:	50                   	push   %eax
c0109c6d:	e8 7a d0 ff ff       	call   c0106cec <Memcpy>
c0109c72:	83 c4 10             	add    $0x10,%esp
c0109c75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c78:	c9                   	leave  
c0109c79:	c3                   	ret    

c0109c7a <build_body_stack>:
c0109c7a:	55                   	push   %ebp
c0109c7b:	89 e5                	mov    %esp,%ebp
c0109c7d:	83 ec 48             	sub    $0x48,%esp
c0109c80:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c83:	8b 40 0c             	mov    0xc(%eax),%eax
c0109c86:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c8c:	8b 50 04             	mov    0x4(%eax),%edx
c0109c8f:	8b 00                	mov    (%eax),%eax
c0109c91:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109c94:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109c97:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109c9a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109c9d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109ca0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109ca3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ca6:	8b 40 08             	mov    0x8(%eax),%eax
c0109ca9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109cac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109cb3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109cba:	e8 c9 cf ff ff       	call   c0106c88 <intr_disable>
c0109cbf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109cc2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109cc9:	e9 c2 00 00 00       	jmp    c0109d90 <build_body_stack+0x116>
c0109cce:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109cd1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109cd4:	01 d0                	add    %edx,%eax
c0109cd6:	0f b6 00             	movzbl (%eax),%eax
c0109cd9:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109cdc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109ce3:	e9 9a 00 00 00       	jmp    c0109d82 <build_body_stack+0x108>
c0109ce8:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109cec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109cef:	89 c1                	mov    %eax,%ecx
c0109cf1:	d3 fa                	sar    %cl,%edx
c0109cf3:	89 d0                	mov    %edx,%eax
c0109cf5:	83 e0 01             	and    $0x1,%eax
c0109cf8:	85 c0                	test   %eax,%eax
c0109cfa:	75 06                	jne    c0109d02 <build_body_stack+0x88>
c0109cfc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109d00:	eb 7c                	jmp    c0109d7e <build_body_stack+0x104>
c0109d02:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d05:	8b 40 08             	mov    0x8(%eax),%eax
c0109d08:	83 ec 0c             	sub    $0xc,%esp
c0109d0b:	50                   	push   %eax
c0109d0c:	e8 c1 66 ff ff       	call   c01003d2 <update_cr3>
c0109d11:	83 c4 10             	add    $0x10,%esp
c0109d14:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d17:	c1 e0 0c             	shl    $0xc,%eax
c0109d1a:	89 c2                	mov    %eax,%edx
c0109d1c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109d1f:	01 d0                	add    %edx,%eax
c0109d21:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109d24:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109d27:	8b 45 10             	mov    0x10(%ebp),%eax
c0109d2a:	83 ec 04             	sub    $0x4,%esp
c0109d2d:	68 00 10 00 00       	push   $0x1000
c0109d32:	52                   	push   %edx
c0109d33:	50                   	push   %eax
c0109d34:	e8 b3 cf ff ff       	call   c0106cec <Memcpy>
c0109d39:	83 c4 10             	add    $0x10,%esp
c0109d3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109d3f:	8b 40 08             	mov    0x8(%eax),%eax
c0109d42:	83 ec 0c             	sub    $0xc,%esp
c0109d45:	50                   	push   %eax
c0109d46:	e8 87 66 ff ff       	call   c01003d2 <update_cr3>
c0109d4b:	83 c4 10             	add    $0x10,%esp
c0109d4e:	83 ec 08             	sub    $0x8,%esp
c0109d51:	ff 75 cc             	pushl  -0x34(%ebp)
c0109d54:	6a 01                	push   $0x1
c0109d56:	e8 be c4 ff ff       	call   c0106219 <get_a_virtual_page>
c0109d5b:	83 c4 10             	add    $0x10,%esp
c0109d5e:	8b 55 10             	mov    0x10(%ebp),%edx
c0109d61:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109d64:	83 ec 04             	sub    $0x4,%esp
c0109d67:	68 00 10 00 00       	push   $0x1000
c0109d6c:	52                   	push   %edx
c0109d6d:	50                   	push   %eax
c0109d6e:	e8 79 cf ff ff       	call   c0106cec <Memcpy>
c0109d73:	83 c4 10             	add    $0x10,%esp
c0109d76:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109d7a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109d7e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109d82:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109d86:	0f 8e 5c ff ff ff    	jle    c0109ce8 <build_body_stack+0x6e>
c0109d8c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109d90:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109d93:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109d96:	0f 87 32 ff ff ff    	ja     c0109cce <build_body_stack+0x54>
c0109d9c:	83 ec 0c             	sub    $0xc,%esp
c0109d9f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109da2:	e8 0a cf ff ff       	call   c0106cb1 <intr_set_status>
c0109da7:	83 c4 10             	add    $0x10,%esp
c0109daa:	90                   	nop
c0109dab:	c9                   	leave  
c0109dac:	c3                   	ret    

c0109dad <build_process_kernel_stack>:
c0109dad:	55                   	push   %ebp
c0109dae:	89 e5                	mov    %esp,%ebp
c0109db0:	83 ec 28             	sub    $0x28,%esp
c0109db3:	e8 d0 ce ff ff       	call   c0106c88 <intr_disable>
c0109db8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109dbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dbe:	05 00 10 00 00       	add    $0x1000,%eax
c0109dc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109dc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dc9:	8b 00                	mov    (%eax),%eax
c0109dcb:	83 f8 38             	cmp    $0x38,%eax
c0109dce:	74 06                	je     c0109dd6 <build_process_kernel_stack+0x29>
c0109dd0:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109dd4:	eb f0                	jmp    c0109dc6 <build_process_kernel_stack+0x19>
c0109dd6:	90                   	nop
c0109dd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dda:	05 00 10 00 00       	add    $0x1000,%eax
c0109ddf:	89 c2                	mov    %eax,%edx
c0109de1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109de4:	89 50 04             	mov    %edx,0x4(%eax)
c0109de7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dea:	83 c0 2c             	add    $0x2c,%eax
c0109ded:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109df0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109df3:	83 e8 04             	sub    $0x4,%eax
c0109df6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109df9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dfc:	83 e8 08             	sub    $0x8,%eax
c0109dff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e05:	83 e8 0c             	sub    $0xc,%eax
c0109e08:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109e0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e0e:	83 e8 10             	sub    $0x10,%eax
c0109e11:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109e14:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e17:	83 e8 14             	sub    $0x14,%eax
c0109e1a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109e1d:	ba b2 02 10 c0       	mov    $0xc01002b2,%edx
c0109e22:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e25:	89 10                	mov    %edx,(%eax)
c0109e27:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e2a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109e30:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109e33:	8b 10                	mov    (%eax),%edx
c0109e35:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e38:	89 10                	mov    %edx,(%eax)
c0109e3a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109e3d:	8b 10                	mov    (%eax),%edx
c0109e3f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e42:	89 10                	mov    %edx,(%eax)
c0109e44:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109e47:	8b 10                	mov    (%eax),%edx
c0109e49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e4c:	89 10                	mov    %edx,(%eax)
c0109e4e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e51:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109e57:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e5a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109e5d:	89 10                	mov    %edx,(%eax)
c0109e5f:	83 ec 0c             	sub    $0xc,%esp
c0109e62:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e65:	e8 47 ce ff ff       	call   c0106cb1 <intr_set_status>
c0109e6a:	83 c4 10             	add    $0x10,%esp
c0109e6d:	90                   	nop
c0109e6e:	c9                   	leave  
c0109e6f:	c3                   	ret    

c0109e70 <fork_process>:
c0109e70:	55                   	push   %ebp
c0109e71:	89 e5                	mov    %esp,%ebp
c0109e73:	83 ec 18             	sub    $0x18,%esp
c0109e76:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e79:	83 ec 0c             	sub    $0xc,%esp
c0109e7c:	50                   	push   %eax
c0109e7d:	e8 b4 99 ff ff       	call   c0103836 <pid2proc>
c0109e82:	83 c4 10             	add    $0x10,%esp
c0109e85:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e88:	83 ec 0c             	sub    $0xc,%esp
c0109e8b:	ff 75 f4             	pushl  -0xc(%ebp)
c0109e8e:	e8 75 fc ff ff       	call   c0109b08 <clone_pcb>
c0109e93:	83 c4 10             	add    $0x10,%esp
c0109e96:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109e99:	83 ec 08             	sub    $0x8,%esp
c0109e9c:	6a 00                	push   $0x0
c0109e9e:	6a 01                	push   $0x1
c0109ea0:	e8 12 c3 ff ff       	call   c01061b7 <alloc_memory>
c0109ea5:	83 c4 10             	add    $0x10,%esp
c0109ea8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109eab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109eae:	83 ec 04             	sub    $0x4,%esp
c0109eb1:	68 00 10 00 00       	push   $0x1000
c0109eb6:	6a 00                	push   $0x0
c0109eb8:	50                   	push   %eax
c0109eb9:	e8 11 23 00 00       	call   c010c1cf <Memset>
c0109ebe:	83 c4 10             	add    $0x10,%esp
c0109ec1:	83 ec 04             	sub    $0x4,%esp
c0109ec4:	ff 75 ec             	pushl  -0x14(%ebp)
c0109ec7:	ff 75 f0             	pushl  -0x10(%ebp)
c0109eca:	ff 75 f4             	pushl  -0xc(%ebp)
c0109ecd:	e8 a8 fd ff ff       	call   c0109c7a <build_body_stack>
c0109ed2:	83 c4 10             	add    $0x10,%esp
c0109ed5:	83 ec 0c             	sub    $0xc,%esp
c0109ed8:	ff 75 f0             	pushl  -0x10(%ebp)
c0109edb:	e8 cd fe ff ff       	call   c0109dad <build_process_kernel_stack>
c0109ee0:	83 c4 10             	add    $0x10,%esp
c0109ee3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ee6:	05 6a 02 00 00       	add    $0x26a,%eax
c0109eeb:	83 ec 08             	sub    $0x8,%esp
c0109eee:	50                   	push   %eax
c0109eef:	68 04 0f 11 c0       	push   $0xc0110f04
c0109ef4:	e8 c7 02 00 00       	call   c010a1c0 <appendToDoubleLinkList>
c0109ef9:	83 c4 10             	add    $0x10,%esp
c0109efc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109eff:	c9                   	leave  
c0109f00:	c3                   	ret    

c0109f01 <process_execute>:
c0109f01:	55                   	push   %ebp
c0109f02:	89 e5                	mov    %esp,%ebp
c0109f04:	83 ec 28             	sub    $0x28,%esp
c0109f07:	e8 ca 04 00 00       	call   c010a3d6 <thread_init>
c0109f0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109f0f:	83 ec 0c             	sub    $0xc,%esp
c0109f12:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f15:	e8 69 05 00 00       	call   c010a483 <thread_create>
c0109f1a:	83 c4 10             	add    $0x10,%esp
c0109f1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f20:	05 28 01 00 00       	add    $0x128,%eax
c0109f25:	83 ec 08             	sub    $0x8,%esp
c0109f28:	ff 75 10             	pushl  0x10(%ebp)
c0109f2b:	50                   	push   %eax
c0109f2c:	e8 bd 22 00 00       	call   c010c1ee <Strcpy>
c0109f31:	83 c4 10             	add    $0x10,%esp
c0109f34:	83 ec 08             	sub    $0x8,%esp
c0109f37:	6a 00                	push   $0x0
c0109f39:	6a 01                	push   $0x1
c0109f3b:	e8 77 c2 ff ff       	call   c01061b7 <alloc_memory>
c0109f40:	83 c4 10             	add    $0x10,%esp
c0109f43:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109f46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f49:	05 00 0c 00 00       	add    $0xc00,%eax
c0109f4e:	83 ec 04             	sub    $0x4,%esp
c0109f51:	68 00 04 00 00       	push   $0x400
c0109f56:	68 00 fc ff ff       	push   $0xfffffc00
c0109f5b:	50                   	push   %eax
c0109f5c:	e8 8b cd ff ff       	call   c0106cec <Memcpy>
c0109f61:	83 c4 10             	add    $0x10,%esp
c0109f64:	83 ec 0c             	sub    $0xc,%esp
c0109f67:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f6a:	e8 5f c0 ff ff       	call   c0105fce <get_physical_address>
c0109f6f:	83 c4 10             	add    $0x10,%esp
c0109f72:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109f75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f78:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109f7d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109f80:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109f83:	83 c8 07             	or     $0x7,%eax
c0109f86:	89 c2                	mov    %eax,%edx
c0109f88:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109f8b:	89 10                	mov    %edx,(%eax)
c0109f8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f90:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109f93:	89 50 08             	mov    %edx,0x8(%eax)
c0109f96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f99:	83 c0 10             	add    $0x10,%eax
c0109f9c:	83 ec 0c             	sub    $0xc,%esp
c0109f9f:	50                   	push   %eax
c0109fa0:	e8 c8 c7 ff ff       	call   c010676d <init_memory_block_desc>
c0109fa5:	83 c4 10             	add    $0x10,%esp
c0109fa8:	e8 9e f9 ff ff       	call   c010994b <create_user_process_address_space>
c0109fad:	89 c2                	mov    %eax,%edx
c0109faf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fb2:	89 50 0c             	mov    %edx,0xc(%eax)
c0109fb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fb8:	8b 00                	mov    (%eax),%eax
c0109fba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109fbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fc0:	c7 40 10 db 99 10 c0 	movl   $0xc01099db,0x10(%eax)
c0109fc7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fca:	8b 55 08             	mov    0x8(%ebp),%edx
c0109fcd:	89 50 18             	mov    %edx,0x18(%eax)
c0109fd0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fd3:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109fd6:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109fd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fdc:	8b 55 14             	mov    0x14(%ebp),%edx
c0109fdf:	89 50 20             	mov    %edx,0x20(%eax)
c0109fe2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fe5:	8b 55 18             	mov    0x18(%ebp),%edx
c0109fe8:	89 50 24             	mov    %edx,0x24(%eax)
c0109feb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109fee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ff1:	89 50 28             	mov    %edx,0x28(%eax)
c0109ff4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ff7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109ffd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a000:	8b 10                	mov    (%eax),%edx
c010a002:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a005:	89 50 04             	mov    %edx,0x4(%eax)
c010a008:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a00b:	8b 50 04             	mov    0x4(%eax),%edx
c010a00e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a011:	89 50 08             	mov    %edx,0x8(%eax)
c010a014:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a017:	8b 50 08             	mov    0x8(%eax),%edx
c010a01a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a01d:	89 50 0c             	mov    %edx,0xc(%eax)
c010a020:	83 ec 0c             	sub    $0xc,%esp
c010a023:	68 ec fd 10 c0       	push   $0xc010fdec
c010a028:	e8 96 00 00 00       	call   c010a0c3 <isListEmpty>
c010a02d:	83 c4 10             	add    $0x10,%esp
c010a030:	e8 53 cc ff ff       	call   c0106c88 <intr_disable>
c010a035:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a038:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a03b:	05 60 02 00 00       	add    $0x260,%eax
c010a040:	83 ec 08             	sub    $0x8,%esp
c010a043:	50                   	push   %eax
c010a044:	68 ec fd 10 c0       	push   $0xc010fdec
c010a049:	e8 72 01 00 00       	call   c010a1c0 <appendToDoubleLinkList>
c010a04e:	83 c4 10             	add    $0x10,%esp
c010a051:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a054:	05 6a 02 00 00       	add    $0x26a,%eax
c010a059:	83 ec 08             	sub    $0x8,%esp
c010a05c:	50                   	push   %eax
c010a05d:	68 04 0f 11 c0       	push   $0xc0110f04
c010a062:	e8 59 01 00 00       	call   c010a1c0 <appendToDoubleLinkList>
c010a067:	83 c4 10             	add    $0x10,%esp
c010a06a:	83 ec 0c             	sub    $0xc,%esp
c010a06d:	ff 75 e0             	pushl  -0x20(%ebp)
c010a070:	e8 3c cc ff ff       	call   c0106cb1 <intr_set_status>
c010a075:	83 c4 10             	add    $0x10,%esp
c010a078:	90                   	nop
c010a079:	c9                   	leave  
c010a07a:	c3                   	ret    
c010a07b:	66 90                	xchg   %ax,%ax
c010a07d:	66 90                	xchg   %ax,%ax
c010a07f:	90                   	nop

c010a080 <switch_to>:
c010a080:	56                   	push   %esi
c010a081:	57                   	push   %edi
c010a082:	53                   	push   %ebx
c010a083:	55                   	push   %ebp
c010a084:	89 e5                	mov    %esp,%ebp
c010a086:	8b 45 14             	mov    0x14(%ebp),%eax
c010a089:	89 20                	mov    %esp,(%eax)
c010a08b:	8b 45 18             	mov    0x18(%ebp),%eax
c010a08e:	8b 20                	mov    (%eax),%esp
c010a090:	5d                   	pop    %ebp
c010a091:	5b                   	pop    %ebx
c010a092:	5f                   	pop    %edi
c010a093:	5e                   	pop    %esi
c010a094:	c3                   	ret    

c010a095 <initDoubleLinkList>:
c010a095:	55                   	push   %ebp
c010a096:	89 e5                	mov    %esp,%ebp
c010a098:	8b 45 08             	mov    0x8(%ebp),%eax
c010a09b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a0a1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0a4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a0ab:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0ae:	8d 50 08             	lea    0x8(%eax),%edx
c010a0b1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0b4:	89 50 04             	mov    %edx,0x4(%eax)
c010a0b7:	8b 55 08             	mov    0x8(%ebp),%edx
c010a0ba:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0bd:	89 50 08             	mov    %edx,0x8(%eax)
c010a0c0:	90                   	nop
c010a0c1:	5d                   	pop    %ebp
c010a0c2:	c3                   	ret    

c010a0c3 <isListEmpty>:
c010a0c3:	55                   	push   %ebp
c010a0c4:	89 e5                	mov    %esp,%ebp
c010a0c6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0c9:	8b 40 04             	mov    0x4(%eax),%eax
c010a0cc:	8b 55 08             	mov    0x8(%ebp),%edx
c010a0cf:	83 c2 08             	add    $0x8,%edx
c010a0d2:	39 d0                	cmp    %edx,%eax
c010a0d4:	75 07                	jne    c010a0dd <isListEmpty+0x1a>
c010a0d6:	b8 01 00 00 00       	mov    $0x1,%eax
c010a0db:	eb 05                	jmp    c010a0e2 <isListEmpty+0x1f>
c010a0dd:	b8 00 00 00 00       	mov    $0x0,%eax
c010a0e2:	5d                   	pop    %ebp
c010a0e3:	c3                   	ret    

c010a0e4 <findElementInList>:
c010a0e4:	55                   	push   %ebp
c010a0e5:	89 e5                	mov    %esp,%ebp
c010a0e7:	83 ec 28             	sub    $0x28,%esp
c010a0ea:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a0ee:	75 19                	jne    c010a109 <findElementInList+0x25>
c010a0f0:	6a 60                	push   $0x60
c010a0f2:	68 75 c1 10 c0       	push   $0xc010c175
c010a0f7:	68 75 c1 10 c0       	push   $0xc010c175
c010a0fc:	68 88 c1 10 c0       	push   $0xc010c188
c010a101:	e8 ff e7 ff ff       	call   c0108905 <assertion_failure>
c010a106:	83 c4 10             	add    $0x10,%esp
c010a109:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a10d:	75 19                	jne    c010a128 <findElementInList+0x44>
c010a10f:	6a 61                	push   $0x61
c010a111:	68 75 c1 10 c0       	push   $0xc010c175
c010a116:	68 75 c1 10 c0       	push   $0xc010c175
c010a11b:	68 94 c1 10 c0       	push   $0xc010c194
c010a120:	e8 e0 e7 ff ff       	call   c0108905 <assertion_failure>
c010a125:	83 c4 10             	add    $0x10,%esp
c010a128:	e8 5b cb ff ff       	call   c0106c88 <intr_disable>
c010a12d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a130:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a137:	8b 45 08             	mov    0x8(%ebp),%eax
c010a13a:	8b 40 08             	mov    0x8(%eax),%eax
c010a13d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a140:	8b 45 08             	mov    0x8(%ebp),%eax
c010a143:	8b 40 04             	mov    0x4(%eax),%eax
c010a146:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a149:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a14d:	75 07                	jne    c010a156 <findElementInList+0x72>
c010a14f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a154:	eb 68                	jmp    c010a1be <findElementInList+0xda>
c010a156:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a159:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a15c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a15f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a162:	c1 f8 03             	sar    $0x3,%eax
c010a165:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a168:	eb 36                	jmp    c010a1a0 <findElementInList+0xbc>
c010a16a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a16d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a170:	75 07                	jne    c010a179 <findElementInList+0x95>
c010a172:	b8 01 00 00 00       	mov    $0x1,%eax
c010a177:	eb 45                	jmp    c010a1be <findElementInList+0xda>
c010a179:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a17d:	75 07                	jne    c010a186 <findElementInList+0xa2>
c010a17f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a184:	eb 38                	jmp    c010a1be <findElementInList+0xda>
c010a186:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a189:	8b 40 04             	mov    0x4(%eax),%eax
c010a18c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a18f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a193:	75 07                	jne    c010a19c <findElementInList+0xb8>
c010a195:	b8 00 00 00 00       	mov    $0x0,%eax
c010a19a:	eb 22                	jmp    c010a1be <findElementInList+0xda>
c010a19c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a1a0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1a3:	83 c0 08             	add    $0x8,%eax
c010a1a6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a1a9:	75 bf                	jne    c010a16a <findElementInList+0x86>
c010a1ab:	83 ec 0c             	sub    $0xc,%esp
c010a1ae:	ff 75 ec             	pushl  -0x14(%ebp)
c010a1b1:	e8 fb ca ff ff       	call   c0106cb1 <intr_set_status>
c010a1b6:	83 c4 10             	add    $0x10,%esp
c010a1b9:	b8 00 00 00 00       	mov    $0x0,%eax
c010a1be:	c9                   	leave  
c010a1bf:	c3                   	ret    

c010a1c0 <appendToDoubleLinkList>:
c010a1c0:	55                   	push   %ebp
c010a1c1:	89 e5                	mov    %esp,%ebp
c010a1c3:	83 ec 18             	sub    $0x18,%esp
c010a1c6:	83 ec 08             	sub    $0x8,%esp
c010a1c9:	ff 75 0c             	pushl  0xc(%ebp)
c010a1cc:	ff 75 08             	pushl  0x8(%ebp)
c010a1cf:	e8 10 ff ff ff       	call   c010a0e4 <findElementInList>
c010a1d4:	83 c4 10             	add    $0x10,%esp
c010a1d7:	3c 01                	cmp    $0x1,%al
c010a1d9:	0f 84 c2 00 00 00    	je     c010a2a1 <appendToDoubleLinkList+0xe1>
c010a1df:	e8 a4 ca ff ff       	call   c0106c88 <intr_disable>
c010a1e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a1e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a1eb:	75 1c                	jne    c010a209 <appendToDoubleLinkList+0x49>
c010a1ed:	68 9e 00 00 00       	push   $0x9e
c010a1f2:	68 75 c1 10 c0       	push   $0xc010c175
c010a1f7:	68 75 c1 10 c0       	push   $0xc010c175
c010a1fc:	68 88 c1 10 c0       	push   $0xc010c188
c010a201:	e8 ff e6 ff ff       	call   c0108905 <assertion_failure>
c010a206:	83 c4 10             	add    $0x10,%esp
c010a209:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a20d:	75 1c                	jne    c010a22b <appendToDoubleLinkList+0x6b>
c010a20f:	68 9f 00 00 00       	push   $0x9f
c010a214:	68 75 c1 10 c0       	push   $0xc010c175
c010a219:	68 75 c1 10 c0       	push   $0xc010c175
c010a21e:	68 94 c1 10 c0       	push   $0xc010c194
c010a223:	e8 dd e6 ff ff       	call   c0108905 <assertion_failure>
c010a228:	83 c4 10             	add    $0x10,%esp
c010a22b:	83 ec 08             	sub    $0x8,%esp
c010a22e:	ff 75 0c             	pushl  0xc(%ebp)
c010a231:	ff 75 08             	pushl  0x8(%ebp)
c010a234:	e8 ab fe ff ff       	call   c010a0e4 <findElementInList>
c010a239:	83 c4 10             	add    $0x10,%esp
c010a23c:	3c 01                	cmp    $0x1,%al
c010a23e:	74 64                	je     c010a2a4 <appendToDoubleLinkList+0xe4>
c010a240:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a243:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a246:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a249:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a250:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a253:	8b 50 04             	mov    0x4(%eax),%edx
c010a256:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a259:	89 10                	mov    %edx,(%eax)
c010a25b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a25e:	8b 50 08             	mov    0x8(%eax),%edx
c010a261:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a264:	89 10                	mov    %edx,(%eax)
c010a266:	8b 45 08             	mov    0x8(%ebp),%eax
c010a269:	8b 40 08             	mov    0x8(%eax),%eax
c010a26c:	85 c0                	test   %eax,%eax
c010a26e:	74 0c                	je     c010a27c <appendToDoubleLinkList+0xbc>
c010a270:	8b 45 08             	mov    0x8(%ebp),%eax
c010a273:	8b 40 08             	mov    0x8(%eax),%eax
c010a276:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a279:	89 50 04             	mov    %edx,0x4(%eax)
c010a27c:	8b 45 08             	mov    0x8(%ebp),%eax
c010a27f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a282:	89 50 08             	mov    %edx,0x8(%eax)
c010a285:	8b 45 08             	mov    0x8(%ebp),%eax
c010a288:	8d 50 08             	lea    0x8(%eax),%edx
c010a28b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a28e:	89 50 04             	mov    %edx,0x4(%eax)
c010a291:	83 ec 0c             	sub    $0xc,%esp
c010a294:	ff 75 f4             	pushl  -0xc(%ebp)
c010a297:	e8 15 ca ff ff       	call   c0106cb1 <intr_set_status>
c010a29c:	83 c4 10             	add    $0x10,%esp
c010a29f:	eb 04                	jmp    c010a2a5 <appendToDoubleLinkList+0xe5>
c010a2a1:	90                   	nop
c010a2a2:	eb 01                	jmp    c010a2a5 <appendToDoubleLinkList+0xe5>
c010a2a4:	90                   	nop
c010a2a5:	c9                   	leave  
c010a2a6:	c3                   	ret    

c010a2a7 <insertToDoubleLinkList>:
c010a2a7:	55                   	push   %ebp
c010a2a8:	89 e5                	mov    %esp,%ebp
c010a2aa:	83 ec 18             	sub    $0x18,%esp
c010a2ad:	83 ec 08             	sub    $0x8,%esp
c010a2b0:	ff 75 0c             	pushl  0xc(%ebp)
c010a2b3:	ff 75 08             	pushl  0x8(%ebp)
c010a2b6:	e8 29 fe ff ff       	call   c010a0e4 <findElementInList>
c010a2bb:	83 c4 10             	add    $0x10,%esp
c010a2be:	3c 01                	cmp    $0x1,%al
c010a2c0:	74 65                	je     c010a327 <insertToDoubleLinkList+0x80>
c010a2c2:	e8 c1 c9 ff ff       	call   c0106c88 <intr_disable>
c010a2c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a2cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a2d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2d3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a2da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2dd:	8b 50 04             	mov    0x4(%eax),%edx
c010a2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2e3:	89 10                	mov    %edx,(%eax)
c010a2e5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2e8:	8b 50 04             	mov    0x4(%eax),%edx
c010a2eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2ee:	89 50 04             	mov    %edx,0x4(%eax)
c010a2f1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2f4:	8b 40 04             	mov    0x4(%eax),%eax
c010a2f7:	85 c0                	test   %eax,%eax
c010a2f9:	74 0b                	je     c010a306 <insertToDoubleLinkList+0x5f>
c010a2fb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2fe:	8b 40 04             	mov    0x4(%eax),%eax
c010a301:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a304:	89 10                	mov    %edx,(%eax)
c010a306:	8b 45 08             	mov    0x8(%ebp),%eax
c010a309:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a30c:	89 50 04             	mov    %edx,0x4(%eax)
c010a30f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a312:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a315:	89 10                	mov    %edx,(%eax)
c010a317:	83 ec 0c             	sub    $0xc,%esp
c010a31a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a31d:	e8 8f c9 ff ff       	call   c0106cb1 <intr_set_status>
c010a322:	83 c4 10             	add    $0x10,%esp
c010a325:	eb 01                	jmp    c010a328 <insertToDoubleLinkList+0x81>
c010a327:	90                   	nop
c010a328:	c9                   	leave  
c010a329:	c3                   	ret    

c010a32a <popFromDoubleLinkList>:
c010a32a:	55                   	push   %ebp
c010a32b:	89 e5                	mov    %esp,%ebp
c010a32d:	83 ec 18             	sub    $0x18,%esp
c010a330:	e8 53 c9 ff ff       	call   c0106c88 <intr_disable>
c010a335:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a338:	83 ec 0c             	sub    $0xc,%esp
c010a33b:	ff 75 08             	pushl  0x8(%ebp)
c010a33e:	e8 80 fd ff ff       	call   c010a0c3 <isListEmpty>
c010a343:	83 c4 10             	add    $0x10,%esp
c010a346:	3c 01                	cmp    $0x1,%al
c010a348:	75 07                	jne    c010a351 <popFromDoubleLinkList+0x27>
c010a34a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a34f:	eb 6b                	jmp    c010a3bc <popFromDoubleLinkList+0x92>
c010a351:	8b 45 08             	mov    0x8(%ebp),%eax
c010a354:	8b 40 08             	mov    0x8(%eax),%eax
c010a357:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a35a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a35d:	8b 40 08             	mov    0x8(%eax),%eax
c010a360:	85 c0                	test   %eax,%eax
c010a362:	75 07                	jne    c010a36b <popFromDoubleLinkList+0x41>
c010a364:	b8 00 00 00 00       	mov    $0x0,%eax
c010a369:	eb 51                	jmp    c010a3bc <popFromDoubleLinkList+0x92>
c010a36b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a36e:	8b 40 08             	mov    0x8(%eax),%eax
c010a371:	8b 00                	mov    (%eax),%eax
c010a373:	85 c0                	test   %eax,%eax
c010a375:	74 11                	je     c010a388 <popFromDoubleLinkList+0x5e>
c010a377:	8b 45 08             	mov    0x8(%ebp),%eax
c010a37a:	8b 40 08             	mov    0x8(%eax),%eax
c010a37d:	8b 00                	mov    (%eax),%eax
c010a37f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a382:	83 c2 08             	add    $0x8,%edx
c010a385:	89 50 04             	mov    %edx,0x4(%eax)
c010a388:	8b 45 08             	mov    0x8(%ebp),%eax
c010a38b:	8b 40 08             	mov    0x8(%eax),%eax
c010a38e:	8b 10                	mov    (%eax),%edx
c010a390:	8b 45 08             	mov    0x8(%ebp),%eax
c010a393:	89 50 08             	mov    %edx,0x8(%eax)
c010a396:	83 ec 0c             	sub    $0xc,%esp
c010a399:	ff 75 f4             	pushl  -0xc(%ebp)
c010a39c:	e8 10 c9 ff ff       	call   c0106cb1 <intr_set_status>
c010a3a1:	83 c4 10             	add    $0x10,%esp
c010a3a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3a7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a3ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3b1:	8b 50 04             	mov    0x4(%eax),%edx
c010a3b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3b7:	89 10                	mov    %edx,(%eax)
c010a3b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3bc:	c9                   	leave  
c010a3bd:	c3                   	ret    

c010a3be <kernel_thread>:
c010a3be:	55                   	push   %ebp
c010a3bf:	89 e5                	mov    %esp,%ebp
c010a3c1:	83 ec 08             	sub    $0x8,%esp
c010a3c4:	fb                   	sti    
c010a3c5:	83 ec 0c             	sub    $0xc,%esp
c010a3c8:	ff 75 0c             	pushl  0xc(%ebp)
c010a3cb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a3ce:	ff d0                	call   *%eax
c010a3d0:	83 c4 10             	add    $0x10,%esp
c010a3d3:	90                   	nop
c010a3d4:	c9                   	leave  
c010a3d5:	c3                   	ret    

c010a3d6 <thread_init>:
c010a3d6:	55                   	push   %ebp
c010a3d7:	89 e5                	mov    %esp,%ebp
c010a3d9:	83 ec 18             	sub    $0x18,%esp
c010a3dc:	83 ec 08             	sub    $0x8,%esp
c010a3df:	6a 00                	push   $0x0
c010a3e1:	6a 01                	push   $0x1
c010a3e3:	e8 cf bd ff ff       	call   c01061b7 <alloc_memory>
c010a3e8:	83 c4 10             	add    $0x10,%esp
c010a3eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a3ee:	83 ec 04             	sub    $0x4,%esp
c010a3f1:	68 00 10 00 00       	push   $0x1000
c010a3f6:	6a 00                	push   $0x0
c010a3f8:	ff 75 f4             	pushl  -0xc(%ebp)
c010a3fb:	e8 cf 1d 00 00       	call   c010c1cf <Memset>
c010a400:	83 c4 10             	add    $0x10,%esp
c010a403:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a406:	05 00 10 00 00       	add    $0x1000,%eax
c010a40b:	89 c2                	mov    %eax,%edx
c010a40d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a410:	89 10                	mov    %edx,(%eax)
c010a412:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a415:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a41c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a41f:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a426:	ff ff ff 
c010a429:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a42c:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a433:	00 00 00 
c010a436:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a439:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a43f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a442:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a448:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a44d:	83 c0 01             	add    $0x1,%eax
c010a450:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a455:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a45b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a45e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a464:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a467:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a46e:	00 00 00 
c010a471:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a474:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a47b:	cd ab 99 
c010a47e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a481:	c9                   	leave  
c010a482:	c3                   	ret    

c010a483 <thread_create>:
c010a483:	55                   	push   %ebp
c010a484:	89 e5                	mov    %esp,%ebp
c010a486:	83 ec 10             	sub    $0x10,%esp
c010a489:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a490:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a497:	8b 45 08             	mov    0x8(%ebp),%eax
c010a49a:	8b 00                	mov    (%eax),%eax
c010a49c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a49f:	89 c2                	mov    %eax,%edx
c010a4a1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4a4:	89 10                	mov    %edx,(%eax)
c010a4a6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4a9:	8b 00                	mov    (%eax),%eax
c010a4ab:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a4ae:	89 c2                	mov    %eax,%edx
c010a4b0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a4b3:	89 10                	mov    %edx,(%eax)
c010a4b5:	90                   	nop
c010a4b6:	c9                   	leave  
c010a4b7:	c3                   	ret    

c010a4b8 <thread_start>:
c010a4b8:	55                   	push   %ebp
c010a4b9:	89 e5                	mov    %esp,%ebp
c010a4bb:	83 ec 18             	sub    $0x18,%esp
c010a4be:	e8 13 ff ff ff       	call   c010a3d6 <thread_init>
c010a4c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a4c6:	83 ec 0c             	sub    $0xc,%esp
c010a4c9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a4cc:	e8 b2 ff ff ff       	call   c010a483 <thread_create>
c010a4d1:	83 c4 10             	add    $0x10,%esp
c010a4d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4d7:	05 28 01 00 00       	add    $0x128,%eax
c010a4dc:	83 ec 08             	sub    $0x8,%esp
c010a4df:	ff 75 10             	pushl  0x10(%ebp)
c010a4e2:	50                   	push   %eax
c010a4e3:	e8 06 1d 00 00       	call   c010c1ee <Strcpy>
c010a4e8:	83 c4 10             	add    $0x10,%esp
c010a4eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4ee:	8b 00                	mov    (%eax),%eax
c010a4f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a4f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4f6:	c7 40 10 be a3 10 c0 	movl   $0xc010a3be,0x10(%eax)
c010a4fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a500:	8b 55 08             	mov    0x8(%ebp),%edx
c010a503:	89 50 18             	mov    %edx,0x18(%eax)
c010a506:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a509:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a50c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a50f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a512:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a518:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a51b:	8b 10                	mov    (%eax),%edx
c010a51d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a520:	89 50 04             	mov    %edx,0x4(%eax)
c010a523:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a526:	8b 50 04             	mov    0x4(%eax),%edx
c010a529:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a52c:	89 50 08             	mov    %edx,0x8(%eax)
c010a52f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a532:	8b 50 08             	mov    0x8(%eax),%edx
c010a535:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a538:	89 50 0c             	mov    %edx,0xc(%eax)
c010a53b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a53e:	05 60 02 00 00       	add    $0x260,%eax
c010a543:	83 ec 08             	sub    $0x8,%esp
c010a546:	50                   	push   %eax
c010a547:	68 ec fd 10 c0       	push   $0xc010fdec
c010a54c:	e8 6f fc ff ff       	call   c010a1c0 <appendToDoubleLinkList>
c010a551:	83 c4 10             	add    $0x10,%esp
c010a554:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a557:	05 6a 02 00 00       	add    $0x26a,%eax
c010a55c:	83 ec 08             	sub    $0x8,%esp
c010a55f:	50                   	push   %eax
c010a560:	68 04 0f 11 c0       	push   $0xc0110f04
c010a565:	e8 56 fc ff ff       	call   c010a1c0 <appendToDoubleLinkList>
c010a56a:	83 c4 10             	add    $0x10,%esp
c010a56d:	90                   	nop
c010a56e:	c9                   	leave  
c010a56f:	c3                   	ret    

c010a570 <Buf>:
	...

c010a586 <My_Buf>:
c010a586:	48                   	dec    %eax
c010a587:	65 6c                	gs insb (%dx),%es:(%edi)
c010a589:	6c                   	insb   (%dx),%es:(%edi)
c010a58a:	6f                   	outsl  %ds:(%esi),(%dx)
c010a58b:	2c 57                	sub    $0x57,%al
c010a58d:	6f                   	outsl  %ds:(%esi),(%dx)
c010a58e:	72 6c                	jb     c010a5fc <DriverInitialize+0x69>
c010a590:	64 5c                	fs pop %esp
c010a592:	30                   	.byte 0x30

c010a593 <DriverInitialize>:
c010a593:	56                   	push   %esi
c010a594:	57                   	push   %edi
c010a595:	53                   	push   %ebx
c010a596:	55                   	push   %ebp
c010a597:	51                   	push   %ecx
c010a598:	89 e5                	mov    %esp,%ebp
c010a59a:	b0 21                	mov    $0x21,%al
c010a59c:	66 ba 00 03          	mov    $0x300,%dx
c010a5a0:	ee                   	out    %al,(%dx)
c010a5a1:	b0 59                	mov    $0x59,%al
c010a5a3:	66 ba 0e 03          	mov    $0x30e,%dx
c010a5a7:	ee                   	out    %al,(%dx)
c010a5a8:	66 ba 0a 03          	mov    $0x30a,%dx
c010a5ac:	30 c0                	xor    %al,%al
c010a5ae:	ee                   	out    %al,(%dx)
c010a5af:	66 ba 0b 03          	mov    $0x30b,%dx
c010a5b3:	ee                   	out    %al,(%dx)
c010a5b4:	b0 10                	mov    $0x10,%al
c010a5b6:	66 ba 0c 03          	mov    $0x30c,%dx
c010a5ba:	ee                   	out    %al,(%dx)
c010a5bb:	b0 20                	mov    $0x20,%al
c010a5bd:	66 ba 04 03          	mov    $0x304,%dx
c010a5c1:	ee                   	out    %al,(%dx)
c010a5c2:	b0 02                	mov    $0x2,%al
c010a5c4:	66 ba 0d 03          	mov    $0x30d,%dx
c010a5c8:	ee                   	out    %al,(%dx)
c010a5c9:	b0 40                	mov    $0x40,%al
c010a5cb:	66 ba 01 03          	mov    $0x301,%dx
c010a5cf:	ee                   	out    %al,(%dx)
c010a5d0:	66 ba 03 03          	mov    $0x303,%dx
c010a5d4:	ee                   	out    %al,(%dx)
c010a5d5:	b0 60                	mov    $0x60,%al
c010a5d7:	66 ba 02 03          	mov    $0x302,%dx
c010a5db:	ee                   	out    %al,(%dx)
c010a5dc:	b0 61                	mov    $0x61,%al
c010a5de:	66 ba 00 03          	mov    $0x300,%dx
c010a5e2:	ee                   	out    %al,(%dx)
c010a5e3:	b0 40                	mov    $0x40,%al
c010a5e5:	66 ba 07 03          	mov    $0x307,%dx
c010a5e9:	ee                   	out    %al,(%dx)
c010a5ea:	b0 22                	mov    $0x22,%al
c010a5ec:	66 ba 00 03          	mov    $0x300,%dx
c010a5f0:	ee                   	out    %al,(%dx)
c010a5f1:	b0 ff                	mov    $0xff,%al
c010a5f3:	66 ba 07 03          	mov    $0x307,%dx
c010a5f7:	ee                   	out    %al,(%dx)
c010a5f8:	b0 fb                	mov    $0xfb,%al
c010a5fa:	66 ba 0f 03          	mov    $0x30f,%dx
c010a5fe:	ee                   	out    %al,(%dx)
c010a5ff:	66 ba 0d 03          	mov    $0x30d,%dx
c010a603:	b0 00                	mov    $0x0,%al
c010a605:	ee                   	out    %al,(%dx)
c010a606:	89 ec                	mov    %ebp,%esp
c010a608:	59                   	pop    %ecx
c010a609:	5d                   	pop    %ebp
c010a60a:	5b                   	pop    %ebx
c010a60b:	5f                   	pop    %edi
c010a60c:	5e                   	pop    %esi
c010a60d:	c3                   	ret    

c010a60e <SetPageStart>:
c010a60e:	66 ba 08 03          	mov    $0x308,%dx
c010a612:	66 31 c0             	xor    %ax,%ax
c010a615:	66 b8 00 40          	mov    $0x4000,%ax
c010a619:	ee                   	out    %al,(%dx)
c010a61a:	66 ba 09 03          	mov    $0x309,%dx
c010a61e:	66 25 00 ff          	and    $0xff00,%ax
c010a622:	66 c1 e8 08          	shr    $0x8,%ax
c010a626:	ee                   	out    %al,(%dx)
c010a627:	c3                   	ret    

c010a628 <DriverSend>:
c010a628:	56                   	push   %esi
c010a629:	57                   	push   %edi
c010a62a:	53                   	push   %ebx
c010a62b:	55                   	push   %ebp
c010a62c:	51                   	push   %ecx
c010a62d:	89 e5                	mov    %esp,%ebp
c010a62f:	66 ba 00 03          	mov    $0x300,%dx
c010a633:	ec                   	in     (%dx),%al
c010a634:	3c 26                	cmp    $0x26,%al
c010a636:	74 52                	je     c010a68a <QueueIt>
c010a638:	66 51                	push   %cx
c010a63a:	24 3f                	and    $0x3f,%al
c010a63c:	ee                   	out    %al,(%dx)
c010a63d:	66 ba 08 03          	mov    $0x308,%dx
c010a641:	66 31 c0             	xor    %ax,%ax
c010a644:	66 b8 00 40          	mov    $0x4000,%ax
c010a648:	ee                   	out    %al,(%dx)
c010a649:	66 ba 09 03          	mov    $0x309,%dx
c010a64d:	66 25 00 ff          	and    $0xff00,%ax
c010a651:	66 c1 e8 08          	shr    $0x8,%ax
c010a655:	ee                   	out    %al,(%dx)
c010a656:	ff 75 18             	pushl  0x18(%ebp)
c010a659:	e8 3d 00 00 00       	call   c010a69b <PCtoNIC>
c010a65e:	83 c4 04             	add    $0x4,%esp
c010a661:	66 ba 04 03          	mov    $0x304,%dx
c010a665:	b0 40                	mov    $0x40,%al
c010a667:	66 b8 00 40          	mov    $0x4000,%ax
c010a66b:	66 c1 e8 08          	shr    $0x8,%ax
c010a66f:	66 ef                	out    %ax,(%dx)
c010a671:	66 59                	pop    %cx
c010a673:	66 ba 05 03          	mov    $0x305,%dx
c010a677:	88 c8                	mov    %cl,%al
c010a679:	ee                   	out    %al,(%dx)
c010a67a:	66 ba 06 03          	mov    $0x306,%dx
c010a67e:	88 e8                	mov    %ch,%al
c010a680:	ee                   	out    %al,(%dx)
c010a681:	66 ba 00 03          	mov    $0x300,%dx
c010a685:	b0 26                	mov    $0x26,%al
c010a687:	ee                   	out    %al,(%dx)
c010a688:	eb 01                	jmp    c010a68b <Finished>

c010a68a <QueueIt>:
c010a68a:	90                   	nop

c010a68b <Finished>:
c010a68b:	89 ec                	mov    %ebp,%esp
c010a68d:	59                   	pop    %ecx
c010a68e:	5d                   	pop    %ebp
c010a68f:	5b                   	pop    %ebx
c010a690:	5f                   	pop    %edi
c010a691:	5e                   	pop    %esi
c010a692:	c3                   	ret    

c010a693 <MyEnd>:
c010a693:	89 ec                	mov    %ebp,%esp
c010a695:	59                   	pop    %ecx
c010a696:	5d                   	pop    %ebp
c010a697:	5b                   	pop    %ebx
c010a698:	5f                   	pop    %edi
c010a699:	5e                   	pop    %esi
c010a69a:	c3                   	ret    

c010a69b <PCtoNIC>:
c010a69b:	56                   	push   %esi
c010a69c:	57                   	push   %edi
c010a69d:	53                   	push   %ebx
c010a69e:	55                   	push   %ebp
c010a69f:	51                   	push   %ecx
c010a6a0:	89 e5                	mov    %esp,%ebp
c010a6a2:	66 bb 16 00          	mov    $0x16,%bx
c010a6a6:	66 ba 0a 03          	mov    $0x30a,%dx
c010a6aa:	88 d8                	mov    %bl,%al
c010a6ac:	ee                   	out    %al,(%dx)
c010a6ad:	66 ba 0b 03          	mov    $0x30b,%dx
c010a6b1:	88 f8                	mov    %bh,%al
c010a6b3:	ee                   	out    %al,(%dx)
c010a6b4:	66 ba 00 03          	mov    $0x300,%dx
c010a6b8:	b0 12                	mov    $0x12,%al
c010a6ba:	ee                   	out    %al,(%dx)
c010a6bb:	66 ba 10 03          	mov    $0x310,%dx
c010a6bf:	66 b9 16 00          	mov    $0x16,%cx
c010a6c3:	66 d1 e9             	shr    %cx
c010a6c6:	66 b8 59 00          	mov    $0x59,%ax
c010a6ca:	31 f6                	xor    %esi,%esi
c010a6cc:	8b 74 24 18          	mov    0x18(%esp),%esi
c010a6d0:	e8 39 ff ff ff       	call   c010a60e <SetPageStart>
c010a6d5:	66 ba 10 03          	mov    $0x310,%dx

c010a6d9 <Writing_Word>:
c010a6d9:	66 31 c0             	xor    %ax,%ax
c010a6dc:	66 ad                	lods   %ds:(%esi),%ax
c010a6de:	66 ef                	out    %ax,(%dx)
c010a6e0:	e2 f7                	loop   c010a6d9 <Writing_Word>
c010a6e2:	66 b9 00 00          	mov    $0x0,%cx
c010a6e6:	66 ba 07 03          	mov    $0x307,%dx

c010a6ea <CheckDMA>:
c010a6ea:	ec                   	in     (%dx),%al
c010a6eb:	a8 40                	test   $0x40,%al
c010a6ed:	75 02                	jne    c010a6f1 <toNICEND>
c010a6ef:	eb f9                	jmp    c010a6ea <CheckDMA>

c010a6f1 <toNICEND>:
c010a6f1:	66 ba 07 03          	mov    $0x307,%dx
c010a6f5:	b0 40                	mov    $0x40,%al
c010a6f7:	ee                   	out    %al,(%dx)
c010a6f8:	f8                   	clc    
c010a6f9:	89 ec                	mov    %ebp,%esp
c010a6fb:	59                   	pop    %ecx
c010a6fc:	5d                   	pop    %ebp
c010a6fd:	5b                   	pop    %ebx
c010a6fe:	5f                   	pop    %edi
c010a6ff:	5e                   	pop    %esi
c010a700:	c3                   	ret    

c010a701 <NICtoPC>:
c010a701:	56                   	push   %esi
c010a702:	57                   	push   %edi
c010a703:	53                   	push   %ebx
c010a704:	55                   	push   %ebp
c010a705:	51                   	push   %ecx
c010a706:	89 e5                	mov    %esp,%ebp
c010a708:	66 bb 16 00          	mov    $0x16,%bx
c010a70c:	66 ba 0a 03          	mov    $0x30a,%dx
c010a710:	88 d8                	mov    %bl,%al
c010a712:	ee                   	out    %al,(%dx)
c010a713:	66 ba 0b 03          	mov    $0x30b,%dx
c010a717:	88 f8                	mov    %bh,%al
c010a719:	ee                   	out    %al,(%dx)
c010a71a:	66 ba 00 03          	mov    $0x300,%dx
c010a71e:	b0 0a                	mov    $0xa,%al
c010a720:	ee                   	out    %al,(%dx)
c010a721:	66 ba 10 03          	mov    $0x310,%dx
c010a725:	e8 e4 fe ff ff       	call   c010a60e <SetPageStart>
c010a72a:	66 ba 10 03          	mov    $0x310,%dx
c010a72e:	66 b9 16 00          	mov    $0x16,%cx
c010a732:	66 d1 e9             	shr    %cx
c010a735:	bf 70 a5 10 c0       	mov    $0xc010a570,%edi

c010a73a <READING_Word_NICtoPC>:
c010a73a:	31 c0                	xor    %eax,%eax
c010a73c:	66 ed                	in     (%dx),%ax
c010a73e:	66 ab                	stos   %ax,%es:(%edi)
c010a740:	e2 f8                	loop   c010a73a <READING_Word_NICtoPC>
c010a742:	b8 70 a5 10 c0       	mov    $0xc010a570,%eax
c010a747:	50                   	push   %eax
c010a748:	e8 3f 59 ff ff       	call   c010008c <disp_str>
c010a74d:	83 c4 04             	add    $0x4,%esp
c010a750:	66 ba 07 03          	mov    $0x307,%dx

c010a754 <CheckDMA_NICtoPC>:
c010a754:	ec                   	in     (%dx),%al
c010a755:	a8 40                	test   $0x40,%al
c010a757:	75 02                	jne    c010a75b <ReadEnd>
c010a759:	eb f9                	jmp    c010a754 <CheckDMA_NICtoPC>

c010a75b <ReadEnd>:
c010a75b:	ee                   	out    %al,(%dx)
c010a75c:	89 ec                	mov    %ebp,%esp
c010a75e:	59                   	pop    %ecx
c010a75f:	5d                   	pop    %ebp
c010a760:	5b                   	pop    %ebx
c010a761:	5f                   	pop    %edi
c010a762:	5e                   	pop    %esi
c010a763:	c3                   	ret    
